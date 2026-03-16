include("FLuaVector")

local highlights = { Red     = Vector4(1.0, 0.0, 0.0, 1.0), 
                     Green   = Vector4(0.0, 1.0, 0.0, 1.0), 
                     Blue    = Vector4(0.0, 0.0, 1.0, 1.0),
                     Cyan    = Vector4(0.0, 1.0, 1.0, 1.0),
                     Yellow  = Vector4(1.0, 1.0, 0.0 ,1.0),
                     Magenta = Vector4(1.0, 0.0, 1.0, 1.0),
                     Black   = Vector4(0.5, 0.5, 0.5, 1.0)}             

local colourRoads    = highlights["Red"]
local colourRailways = highlights["Green"]

local iRouteRoad = GameInfoTypes["ROUTE_ROAD"]
local iRouteRail = GameInfoTypes["ROUTE_RAILROAD"]

local routeInfo = {
    {Name="TXT_KEY_RANDR_LEGEND_ROAD", Color={R=colourRoads.x,    G=colourRoads.y,    B=colourRoads.z}},
    {Name="TXT_KEY_RANDR_LEGEND_RAIL", Color={R=colourRailways.x, G=colourRailways.y, B=colourRailways.z}}
}

function highlightNone()
  Events.ClearHexHighlights()
end

function highlightAllRoutes(iPlayer)
  local iTeam = Players[iPlayer]:GetTeam()

  highlightRoads(iTeam)
  highlightRailways(iTeam)
end

function highlightRoads(iTeam)
  for iPlot = 0, Map.GetNumPlots()-1, 1 do
    local pPlot = Map.GetPlotByIndex(iPlot)

    if (pPlot:GetRevealedRouteType(iTeam) == iRouteRoad) then
      highlightPlot(iTeam, pPlot, colourRoads)
    end
  end
end

function highlightRailways(iTeam)
  for iPlot = 0, Map.GetNumPlots()-1, 1 do
    local pPlot = Map.GetPlotByIndex(iPlot)

    if (pPlot:GetRevealedRouteType(iTeam) == iRouteRail) then
      highlightPlot(iTeam, pPlot, colourRailways)
    end
  end
end

function highlightPlot(iTeam, pPlot, highlight)
  Events.SerialEventHexHighlight(ToHexFromGrid(Vector2(pPlot:GetX(), pPlot:GetY())), true, highlight)
end


function OnRoutesDisplay(bShow)
  if (bShow) then
    highlightAllRoutes(Game.GetActivePlayer())

    LuaEvents.MiniMapOverlayLegend("TXT_KEY_RANDR_OVERLAY_RANDR", routeInfo)
  else
    highlightNone()
  end

end
LuaEvents.RoutesDisplay.Add(OnRoutesDisplay) 
