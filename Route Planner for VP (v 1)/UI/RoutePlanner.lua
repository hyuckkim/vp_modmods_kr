



-- needs to go into WorldView.lua
-- InterfaceModeMessageHandler[GameInfo.InterfaceModes.INTERFACEMODE_ROUTE_PLANNER_DRAW.ID] = {};
-- InterfaceModeMessageHandler[GameInfo.InterfaceModes.INTERFACEMODE_ROUTE_PLANNER_DRAW.ID][MouseEvents.RButtonUp] = LuaEvents.ROUTE_PLANNER_RButtonUp
-- InterfaceModeMessageHandler[GameInfo.InterfaceModes.INTERFACEMODE_ROUTE_PLANNER_DRAW.ID][MouseEvents.RButtonDown] = LuaEvents.ROUTE_PLANNER_RButtonDown

print("This is the 'RoutePlanner' mod script.")

include( "IconSupport" );
include( "InstanceManager" );
include( "SupportFunctions" );

-- Constants
local WHITE = Vector4(1, 1, 1, 1)
local LIME = Vector4(0.5, 1, 0, 1)
local ORANGE = Vector4(1, 0.65, 0, 1)

-- Enum values for road planning
RoadPlanTypes = {
    NO_PLANNED_ROUTE      = -1, -- If a plot has this flag, consider road construction like before
    ROAD_PLANNING_EXCLUDE = 0,  -- AI will not plan routes on these tiles and remove roads present here
    ROAD_PLANNING_INCLUDE = 1,  -- AI will plan routes on these tiles and not remove roads here
    ROAD_PLANNING_PRIORITY_CONSTRUCTION = 2, -- AI will prioritize constructing roads here
};

-- Planning and Display Logic
local bShowConnections = false
local bShowIncludes = false
local bShowExcludes = false
local bShowAutomatedRouteExplanation = false;

local bDrawMode = false
local eDrawingRoadPlanType = RoadPlanTypes.NO_PLANNED_ROUTE
local bDrawing = false

local currentPlot = nil;



function HighlightRoutePlans()
    local iPlayer = Game.GetActivePlayer();

    ClearRoutePlannerHighlights()
    ApplyPlots(function(pPlot)
        if bShowConnections and pPlot:IsTradeRoute(iPlayer) then HighlightPlot(pPlot, "RoutePlannerCityConnection") end

        local roadPlanType = pPlot:GetPlannedRouteState(iPlayer)
        if bShowIncludes and roadPlanType == RoadPlanTypes.ROAD_PLANNING_INCLUDE then HighlightPlot(pPlot, "RoutePlannerInclude") end
        if bShowExcludes and roadPlanType == RoadPlanTypes.ROAD_PLANNING_EXCLUDE then HighlightPlot(pPlot, "RoutePlannerExclude") end
        if bShowIncludes and roadPlanType == RoadPlanTypes.ROAD_PLANNING_PRIORITY_CONSTRUCTION then HighlightPlot(pPlot, "RPPCR") end

        -- A hex can be all of these at once so only display the most "important" one
        if bShowAutomatedRouteExplanation then
            if pPlot:IsMainRoutePlan(iPlayer) then HighlightHexColor(pPlot, WHITE)
            elseif pPlot:IsShortcutRoutePlan(iPlayer) then HighlightHexColor(pPlot, LIME)
            elseif pPlot:IsStrategicRoutePlan(iPlayer) then HighlightHexColor(pPlot, ORANGE)
            end
        end
    end)
end

function StartDrawing(eRoadPlanType)
    bShowIncludes = true
    bShowExcludes = true
    HighlightRoutePlans()
    bDrawMode = true
    eDrawingRoadPlanType = eRoadPlanType

    if UI.GetInterfaceMode() ~= GameInfo.InterfaceModes.INTERFACEMODE_ROUTE_PLANNER_DRAW.ID then
        UI.SetInterfaceMode(GameInfo.InterfaceModes.INTERFACEMODE_ROUTE_PLANNER_DRAW.ID);
    end
    Events.SerialEventMouseOverHex.Add(OnMouseMoveOverHex);
end

function EndDrawing()
    print("ending drawing")
    bShowIncludes = Controls.ShowRoadPlansCheckBox:IsChecked()
    bShowExcludes = Controls.ShowRoadPlansCheckBox:IsChecked()
    HighlightRoutePlans()
    bDrawMode = false
    bDrawing = false
    eDrawingRoadPlanType = RoadPlanTypes.NO_PLANNED_ROUTE

    if UI.GetInterfaceMode() ~= GameInfo.InterfaceModes.INTERFACEMODE_SELECTION.ID then
        UI.SetInterfaceMode(GameInfo.InterfaceModes.INTERFACEMODE_SELECTION.ID)
    end

    ResetDrawButtons()

    Events.SerialEventMouseOverHex.Remove(OnMouseMoveOverHex);
end

function ResetDrawButtons()
    Controls.DrawRoadPlanButton:SetText(Locale.ConvertTextKey("TXT_KEY_RP_DRAW_ROAD_PLAN"))
    Controls.DrawNoBuildZoneButton:SetText(Locale.ConvertTextKey("TXT_KEY_RP_DRAW_NO_BUILD_ZONE"))
    Controls.EraseRoadPlansButton:SetText(Locale.ConvertTextKey("TXT_KEY_RP_ERASE_ROAD_PLANS"))
    Controls.DRCPB:SetText(Locale.ConvertTextKey("TXT_KEY_RP_DRAW_PRIORITY_CONSTRUCTION_PLAN"))
end

function UpdatePlotPlan(pPlot, eRoadPlanType)
    local iPlayer = Game.GetActivePlayer(); 
    RemovePlanHighlightsFromPlot(pPlot)
    print("updating plot ", pPlot:GetX(), pPlot:GetY())
    print("with road plan type ", eRoadPlanType)

    if eRoadPlanType == RoadPlanTypes.ROAD_PLANNING_INCLUDE then HighlightPlot(pPlot, "RoutePlannerInclude") end
    if eRoadPlanType == RoadPlanTypes.ROAD_PLANNING_EXCLUDE then HighlightPlot(pPlot, "RoutePlannerExclude") end
    if eRoadPlanType == RoadPlanTypes.ROAD_PLANNING_PRIORITY_CONSTRUCTION then HighlightPlot(pPlot, "RPPCR") end
    pPlot:SetPlannedRouteState(iPlayer, eRoadPlanType)
end

function OnMouseMoveOverHex(gridX, gridY)
    if gridX == nil then
        gridX, gridY = UI.GetMouseOverHex();
    end

    currentPlot = Map.GetPlot(gridX, gridY) or nil
    if bDrawing then UpdatePlotPlan(currentPlot, eDrawingRoadPlanType) end
    print("setting current plot to ", currentPlot:GetX(), currentPlot:GetY())
end

-- Mouse Action Handlers
LuaEvents.ROUTE_PLANNER_RButtonUp.Add(function() 
    print("r button up in plan mode")
    bDrawing = false
end)

LuaEvents.ROUTE_PLANNER_RButtonDown.Add(function() 
    print("r button down in plan mode")
    bDrawing = true

    UpdatePlotPlan(currentPlot, eDrawingRoadPlanType)
end)

-- Input Element Handlers
Controls.ShowCityConnectionsCheckBox:RegisterCheckHandler(function()
    print("show city connections checkbox checked")
    bShowConnections = Controls.ShowCityConnectionsCheckBox:IsChecked()
    HighlightRoutePlans()
end);

Controls.ShowRoadPlansCheckBox:RegisterCheckHandler(function()
    print("show road plans checkbox checked")

    bShowIncludes = Controls.ShowRoadPlansCheckBox:IsChecked()
    bShowExcludes = Controls.ShowRoadPlansCheckBox:IsChecked()
    HighlightRoutePlans()
end);

Controls.ExplainAutomatedRoutesCheckBox:RegisterCheckHandler(function()
    print("explain automated plans checkbox checked")

    bShowAutomatedRouteExplanation = Controls.ExplainAutomatedRoutesCheckBox:IsChecked()
    Controls.LegendBox:SetHide(not Controls.ExplainAutomatedRoutesCheckBox:IsChecked())
    HighlightRoutePlans()
end);

Controls.DrawRoadPlanButton:RegisterCallback(Mouse.eLClick, function()
    print("draw road plan button pressed")
    ResetDrawButtons()
    if bDrawMode and eDrawingRoadPlanType == RoadPlanTypes.ROAD_PLANNING_INCLUDE then 
        EndDrawing()
        return
    end

    Controls.DrawRoadPlanButton:SetText(Locale.ConvertTextKey("TXT_KEY_RP_FINISH_DRAWING"))
    StartDrawing(RoadPlanTypes.ROAD_PLANNING_INCLUDE)
end);

Controls.DRCPB:RegisterCallback(Mouse.eLClick, function()
    print("draw priority construction plan button pressed")

    ResetDrawButtons()
    if bDrawMode and eDrawingRoadPlanType == RoadPlanTypes.ROAD_PLANNING_PRIORITY_CONSTRUCTION then 
        EndDrawing()
        return
    end

    Controls.DRCPB:SetText(Locale.ConvertTextKey("TXT_KEY_RP_FINISH_DRAWING"))
    StartDrawing(RoadPlanTypes.ROAD_PLANNING_PRIORITY_CONSTRUCTION)
end);


Controls.DrawNoBuildZoneButton:RegisterCallback(Mouse.eLClick, function()
    print("draw no build zone button pressed")
    ResetDrawButtons()
    if bDrawMode and eDrawingRoadPlanType == RoadPlanTypes.ROAD_PLANNING_EXCLUDE then 
        EndDrawing()
        return
    end

    Controls.DrawNoBuildZoneButton:SetText(Locale.ConvertTextKey("TXT_KEY_RP_FINISH_DRAWING"))
    StartDrawing(RoadPlanTypes.ROAD_PLANNING_EXCLUDE)
end);

Controls.EraseRoadPlansButton:RegisterCallback(Mouse.eLClick, function()
    print("erase no build zone button pressed")
    ResetDrawButtons()
    if bDrawMode and eDrawingRoadPlanType == RoadPlanTypes.NO_PLANNED_ROUTE then 
        EndDrawing()
        return
    end

    Controls.EraseRoadPlansButton:SetText(Locale.ConvertTextKey("TXT_KEY_RP_FINISH_DRAWING"))
    StartDrawing(RoadPlanTypes.NO_PLANNED_ROUTE)
end);

Controls.AllTilesNoBuildButton:RegisterCallback(Mouse.eLClick, function()
    local iPlayer = Game.GetActivePlayer();
    ApplyPlots(function(pPlot)
        pPlot:SetPlannedRouteState(iPlayer, RoadPlanTypes.ROAD_PLANNING_EXCLUDE)
    end)
    HighlightRoutePlans()
end);

Controls.ResetAllTilesButton:RegisterCallback(Mouse.eLClick, function()
    local iPlayer = Game.GetActivePlayer();
    ApplyPlots(function(pPlot)
        pPlot:SetPlannedRouteState(iPlayer, RoadPlanTypes.NO_PLANNED_ROUTE)
    end)
    HighlightRoutePlans()
end);

-- Utility functions


-- Applies fn to every plot 
function ApplyPlots(fn)
    for i = 0, Map.GetNumPlots() - 1, 1 do
        fn(Map.GetPlotByIndex(i))
    end
end

function HighlightPlot(plot, style)
    if plot then
        Events.SerialEventHexHighlight(ToHexFromGrid(Vector2(plot:GetX(), plot:GetY())), true, nil, style);
    end
end

function HighlightHexColor(plot, color)
    if plot then
        Events.SerialEventHexHighlight(ToHexFromGrid(Vector2(plot:GetX(), plot:GetY())), true, color);
    end
end

function RemovePlanHighlightsFromPlot(plot)
    if plot then
        Events.SerialEventHexHighlight(ToHexFromGrid(Vector2(plot:GetX(), plot:GetY())), false, nil, "RoutePlannerInclude");
        Events.SerialEventHexHighlight(ToHexFromGrid(Vector2(plot:GetX(), plot:GetY())), false, nil, "RoutePlannerExclude");
        Events.SerialEventHexHighlight(ToHexFromGrid(Vector2(plot:GetX(), plot:GetY())), false, nil, "RPPCR");
    end
end

function ClearRoutePlannerHighlights()
    Events.ClearHexHighlights()
    -- Events.ClearHexHighlightStyle("RoutePlannerCityConnection")
    -- Events.ClearHexHighlightStyle("RoutePlannerInclude")
    -- Events.ClearHexHighlightStyle("RoutePlannerExclude")
end









function UpdateScreen()
    m_SortTable = {};
    local iPlayer = Game.GetActivePlayer();
    local pPlayer = Players[ iPlayer ];


end

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function ShowHideHandler( bIsHide, bInitState )

    -- Set player icon at top of screen
    CivIconHookup( 0, 64, Controls.Icon, Controls.CivIconBG, Controls.CivIconShadow, false, true );
    UpdateScreen();
end
ContextPtr:SetShowHideHandler( ShowHideHandler );

ContextPtr:SetHide(true);


function InputHandler( uiMsg, wParam, lParam )
    if uiMsg == KeyEvents.KeyDown then
        if wParam == Keys.VK_ESCAPE or wParam == Keys.VK_RETURN then
            OnClose();
            return true;
        end
    end
end
ContextPtr:SetInputHandler( InputHandler );

function OnClose ()
  EndDrawing()
  ClearRoutePlannerHighlights()
  
  ContextPtr:SetHide(true)
end
Controls.CloseButton:RegisterCallback(Mouse.eLClick, OnClose)

function Open()
    ContextPtr:SetHide(false)
    HighlightRoutePlans()
end

----------------------------------------------------------------
-- 'Active' (local human) player has changed
----------------------------------------------------------------
-- Boilerplate
function OnDiploCornerPopup()
    Open();
  -- ContextPtr:SetHide(false)
end

function OnAdditionalInformationDropdownGatherEntries(additionalEntries)
  table.insert(additionalEntries, {text=Locale.ConvertTextKey("TXT_KEY_RP_ROUTE_PLANNER"), call=OnDiploCornerPopup, art="DC45_RoutePlanner.dds"})
end

LuaEvents.AdditionalInformationDropdownGatherEntries.Add(OnAdditionalInformationDropdownGatherEntries)
LuaEvents.RequestRefreshAdditionalInformationDropdownEntries()

Events.GameplaySetActivePlayer.Add(OnClose)

print("Loaded RoutePlanner.lua")