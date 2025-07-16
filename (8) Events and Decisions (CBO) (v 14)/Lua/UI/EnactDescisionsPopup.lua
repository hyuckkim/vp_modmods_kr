-- Enact Decisions Popup
--=======================================================================================================================
print("--=======================================================================================================================")
print("Loading Random Events")
print("--=======================================================================================================================")

include("PlotIterators.lua")
include("EventsAndDecisions_Utilities.lua")

if g_TSLSave_Enabled then
	print("Using Table Saver Loader")
	------------
	include("TableSaverLoader016.lua");

	MapModData.EventsDecisions_Decisions = MapModData.EventsDecisions_Decisions or {}
	tableRoot = MapModData.EventsDecisions_Decisions
	tableName = "EventsDecisions_Decisions"

	include("EnD_TSLSerializerV3.lua");
	TableLoad(tableRoot, tableName)

	MY_MOD_NAME = "EventsDecisions_Decisions"; MY_MOD_SAVE = MapModData.EventsDecisions_Decisions;
	include("TSL_Sukritact_SaveUtils.lua");
	------------
else
	print("Using Sukritact's NewSaveUtils")
	include("Sukritact_SaveUtils.lua"); MY_MOD_NAME = "Sukritact_EnactDecisions_Popup";
end

--=======================================================================================================================
-- Globals
--=======================================================================================================================

include("IconSupport")
include("InstanceManager")
include("CommonBehaviors")

-- Used for Piano Keys
local ltBlue = {19/255,32/255,46/255,120/255}
local dkBlue = {12/255,22/255,30/255,120/255}

local g_ItemManagers = {
	InstanceManager:new("ItemInstance", "DecisionBox", Controls.EnactedStack),
	InstanceManager:new("ItemInstance", "DecisionBox", Controls.EnactableStack),
	InstanceManager:new("ItemInstance", "DecisionBox", Controls.LockedStack),
}

local bHidden = false

local screenSizeX, screenSizeY = UIManager:GetScreenSizeVal()
local spWidth, spHeight = Controls.ItemScrollPanel:GetSizeVal()

-- Original UI designed at 1050px 
local heightOffset = screenSizeY - 1020

spHeight = spHeight + heightOffset
Controls.ItemScrollPanel:SetSizeVal(spWidth, spHeight) 
Controls.ItemScrollPanel:CalculateInternalSize()
Controls.ItemScrollPanel:ReprocessAnchoring()

local bpWidth, bpHeight = Controls.BottomPanel:GetSizeVal()
bpHeight = bpHeight + heightOffset 


Controls.BottomPanel:SetSizeVal(bpWidth, bpHeight)
Controls.BottomPanel:ReprocessAnchoring()

ButtonPopupTypes.BUTTONPOPUP_ENACTDECISIONSPANEL = "BUTTONPOPUP_ENACTDECISIONSPANEL"
g_PopupInfo = {["Type"] = ButtonPopupTypes.BUTTONPOPUP_ENACTDECISIONSPANEL}
--=======================================================================================================================
-- Import Decisions/Enable Monitory Functions
--=======================================================================================================================

tDecisions = {}
tTempDecisions = {}
tDecisionsStorage = {}

if g_CoreDecisions_Enabled then
	include("CoreDecisions.lua")
	include("CivDecisions.lua")
	include("ReligiousDecisions.lua")
end

for row in GameInfo.DecisionsAddin_Support() do
	include(row.FileName)
end

local sType_Generic = "Z" --This way, generic decisions will come last

for sKey, tEvent in pairs(tDecisions) do

	if tEvent.Type == nil then tEvent.Type = sType_Generic end

	if load("GAME", sKey .. "_Monitors") == true then
		for eEvent, fFunc in pairs(tEvent.Monitors) do
			eEvent.Remove(fFunc)
			eEvent.Add(fFunc)
		end		
	end
end
--=======================================================================================================================
-- Opening
--=======================================================================================================================
function ShowHideHandler(bIsHide, bInitState)
	bHidden = bIsHide
    if (not bInitState) then
        if (not bIsHide) then
        	UI.incTurnTimerSemaphore()
        	Events.SerialEventGameMessagePopupShown(g_PopupInfo)
        	
        	RefreshList()
        
			local unitPanel = ContextPtr:LookUpControl("/InGame/WorldView/UnitPanel/Base")
			if (unitPanel ~= nil) then
				unitPanel:SetHide(true)
			end
			
			local infoCorner = ContextPtr:LookUpControl("/InGame/WorldView/InfoCorner")
			if (infoCorner ~= nil) then
				infoCorner:SetHide(true)
			end
               	
        else
      
			local unitPanel = ContextPtr:LookUpControl("/InGame/WorldView/UnitPanel/Base")
			if (unitPanel ~= nil) then
				unitPanel:SetHide(false)
			end
			
			local infoCorner = ContextPtr:LookUpControl("/InGame/WorldView/InfoCorner")
			if (infoCorner ~= nil) then
				infoCorner:SetHide(false)
			end
			
			if (g_PopupInfo ~= nil) then
				Events.SerialEventGameMessagePopupProcessed.CallImmediate(g_PopupInfo.Type, 0)
			end
            UI.decTurnTimerSemaphore()
        end
    end
end
ContextPtr:SetShowHideHandler(ShowHideHandler)
--=======================================================================================================================
-- Closing
--=======================================================================================================================
function OnClose()
    UIManager:DequeuePopup(ContextPtr)
end
Controls.CloseButton:RegisterCallback(Mouse.eLClick, OnClose)

function OnDirty()
	-- If the user performed any action that changes selection states, just close this UI.
	if not bHidden then
		OnClose()
	end
end
Events.UnitSelectionChanged.Add(OnDirty)
Events.ActivePlayerTurnEnd.Add(OnDirty)

function InputHandler(uiMsg, wParam, lParam)

    if uiMsg == KeyEvents.KeyDown then
        if (wParam == Keys.VK_RETURN or wParam == Keys.VK_ESCAPE) then
			OnClose()
		end	
    end
end
ContextPtr:SetInputHandler(InputHandler)
Controls.CloseButton:RegisterCallback(Mouse.eLClick, OnClose)
--=======================================================================================================================
-- Include "Enact Decisions" in drop-down
--=======================================================================================================================
function OnEnactDecisionsPopup()
	if bHidden then
		UIManager:QueuePopup(ContextPtr, PopupPriority.SocialPolicy)
	else
		OnClose()
	end
end 

function OnAdditionalInformationDropdownGatherEntries(additionalEntries)
	table.insert(additionalEntries,
	{
    text = Locale.ConvertTextKey("TXT_KEY_ENACT_DECISIONS"), 
	art = "DC45_EnactDecision.dds",
    call = OnEnactDecisionsPopup
	}
	)
end
LuaEvents.OnEnactDecisionsPopup.Add(OnEnactDecisionsPopup)
LuaEvents.AdditionalInformationDropdownGatherEntries.Add(OnAdditionalInformationDropdownGatherEntries)
LuaEvents.RequestRefreshAdditionalInformationDropdownEntries()
--=======================================================================================================================
-- Sorting
--=======================================================================================================================
function SortByDecisionName(a, b)
	return Locale.Compare(a.Name, b.Name) < 0
end

function SortByDecisionType(a, b)
	if a.Type == nil then a.Type = sType_Generic end
	if b.Type == nil then b.Type = sType_Generic end
	
	if a.Type == b.Type then
		return Locale.Compare(a.Name, b.Name) < 0
	else
		return Locale.Compare(a.Type, b.Type) < 0
	end
end

g_SortOptions = {
	{"TXT_KEY_DECISION_TYPE_SORT", SortByDecisionType},
	{"TXT_KEY_DECISION_NAME_SORT", SortByDecisionName},
}

g_CurrentSortOption = 1

local g_SortByPulldown = Controls.SortByPullDown
g_SortByPulldown:ClearEntries()

for i, v in ipairs(g_SortOptions) do

	local Sort_ControlTable = {}
	g_SortByPulldown:BuildEntry("InstanceOne", Sort_ControlTable)
	Sort_ControlTable.Button:LocalizeAndSetText(v[1])
	
	Sort_ControlTable.Button:RegisterCallback(Mouse.eLClick, 
	function()
		g_SortByPulldown:GetButton():LocalizeAndSetText(v[1])
		g_CurrentSortOption = i
		
		RefreshList()
	end
	)
	
end

g_SortByPulldown:CalculateInternals()
g_SortByPulldown:GetButton():LocalizeAndSetText(g_SortOptions[g_CurrentSortOption][1])
--=======================================================================================================================
-- Push Decision Function
--=======================================================================================================================
function PushDecision(pPlayer, tDecision)

	print(pPlayer:GetName() .. "(" .. pPlayer:GetID() .. ") Enacting " .. tDecision.Name)

	tDecision.DoFunc(pPlayer, tDecision.Data1, tDecision.Data2)
	if not(bHidden) then RefreshList() end
	if pPlayer:GetID() == Game.GetActivePlayer() then
		if tDecision.NotificationFunc ~= nil then
			tDecision.NotificationFunc(pPlayer, tDecision.Data1, tDecision.Data2)
		else
			Events.AudioPlay2DSound("AS2D_INTERFACE_POLICY")
			local StrMessage = Locale.ConvertTextKey("TXT_KEY_ENACT_ALERT", tDecision.Name)
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, StrMessage, tDecision.Name, -1, -1)
		end
	end
	if tDecision.Monitors ~= nil then 
		for eEvent, fFunc in pairs(tDecision.Monitors) do
			eEvent.Remove(fFunc)
			eEvent.Add(fFunc)
		end	
		save("GAME", tDecision.ID .. "_Monitors", true)
	end
	LuaEvents.DecisionEnacted(pPlayer:GetID(), tDecision.ID)
end

LuaEvents.PushDecisions.Add(PushDecision)
--=======================================================================================================================
-- Pedia Callback: Adapted from EUI
--=======================================================================================================================
CivilopediaControl = "/FrontEnd/MainMenu/Other/Civilopedia"

local getPedia

local function getPediaB(...)
	Events.SearchForPediaEntry(...)
end

local function getPediaA(...)
	UIManager:QueuePopup(LookUpControl(CivilopediaControl), PopupPriority.eUtmost)
	getPedia = getPediaB
	getPedia(...)
end

getPedia = CivilopediaControl and getPediaA
--=======================================================================================================================
-- Decision Type Defines
--=======================================================================================================================
tInfo = {}
	tInfo.tEnacted = {}
		tInfo.tEnacted.iKey = 1
		tInfo.tEnacted.sButton = "EnactedButton"
		tInfo.tEnacted.bFunction = false
		tInfo.tEnacted.Hide_Enacted = false
		tInfo.tEnacted.Hide_Enactable = true
		tInfo.tEnacted.Hide_Available = true
	tInfo.tEnactable = {}
		tInfo.tEnactable.iKey = 2
		tInfo.tEnactable.sButton = "EnactableButton"
		tInfo.tEnactable.bFunction = true
		tInfo.tEnactable.Hide_Enacted = true
		tInfo.tEnactable.Hide_Enactable = false
		tInfo.tEnactable.Hide_Available = true
	tInfo.tAvailable = {}
		tInfo.tAvailable.iKey = 3
		tInfo.tAvailable.sButton = "AvailableButton"
		tInfo.tAvailable.bFunction = false
		tInfo.tAvailable.Hide_Enacted = true
		tInfo.tAvailable.Hide_Enactable = true
		tInfo.tAvailable.Hide_Available = false
--=======================================================================================================================
-- Refresh Decisions Functions
--=======================================================================================================================
tToRemove = {}

function RefreshList()
	print("")
	print("----------------------------------------------------------------------------------------------------")
	print("Refresh list")

	for _, itemManager in ipairs(g_ItemManagers) do
		itemManager:ResetInstances()
	end
		
	local iPlayer = Game.GetActivePlayer()
	local pPlayer = Players[iPlayer]

	tDecisionsStorage[iPlayer] = tDecisionsStorage[iPlayer] or {}
	CivIconHookup(pPlayer:GetID(), 64, Controls.CivIcon, Controls.CivIconBG, Controls.CivIconShadow, false, true)
	Controls.PanelTitle:LocalizeAndSetText("TXT_KEY_ENACT_DECISIONS")
	if pPlayer:GetNumResourceAvailable(GameInfoTypes.RESOURCE_MORALITY, false) >= 80 then 
	Controls.PanelSubtitle:LocalizeAndSetText("TXT_KEY_ENACT_DECISIONS_SUB3", pPlayer:GetNumResourceAvailable(GameInfoTypes.RESOURCE_MAGISTRATES, false))
	elseif pPlayer:GetNumResourceAvailable(GameInfoTypes.RESOURCE_MORALITY, false) >= 60 then
	Controls.PanelSubtitle:LocalizeAndSetText("TXT_KEY_ENACT_DECISIONS_SUB2", pPlayer:GetNumResourceAvailable(GameInfoTypes.RESOURCE_MAGISTRATES, false))
	elseif pPlayer:GetNumResourceAvailable(GameInfoTypes.RESOURCE_MORALITY, false) >= 40 then 
	Controls.PanelSubtitle:LocalizeAndSetText("TXT_KEY_ENACT_DECISIONS_SUB", pPlayer:GetNumResourceAvailable(GameInfoTypes.RESOURCE_MAGISTRATES, false))
	elseif pPlayer:GetNumResourceAvailable(GameInfoTypes.RESOURCE_MORALITY, false) >= 20 then 
	Controls.PanelSubtitle:LocalizeAndSetText("TXT_KEY_ENACT_DECISIONS_SUB4", pPlayer:GetNumResourceAvailable(GameInfoTypes.RESOURCE_MAGISTRATES, false))
	elseif pPlayer:GetNumResourceAvailable(GameInfoTypes.RESOURCE_MORALITY, false) >= 0 then 
	Controls.PanelSubtitle:LocalizeAndSetText("TXT_KEY_ENACT_DECISIONS_SUB5", pPlayer:GetNumResourceAvailable(GameInfoTypes.RESOURCE_MAGISTRATES, false))
	end

	local tEnacted = {}
	local tEnactable = {}
	local tAvailable = {}
	
	print("Processing Decisions")
	print("")
	for sKey, tEvent in pairs(tDecisions) do
		local bAvailable, bEnactable, bEnacted = tEvent.CanFunc(pPlayer, tEvent.Data1, tEvent.Data2)
		tEvent.Name = Locale.ConvertTextKey(tEvent.Name)
		tEvent.ID = sKey
		
		if bAvailable then
			if bEnactable then
				table.insert(tEnactable, tEvent)
			else
				table.insert(tAvailable, tEvent)
			end
		end
		if bEnacted then
			table.insert(tEnacted, tEvent)
		end
		
		tDecisionsStorage[iPlayer][sKey] = {Name = tEvent.Name, Available = bAvailable, Enactable = bEnactable, Enacted = bEnacted}
		print(tEvent.Name, bAvailable, bEnactable, bEnacted)
	end
	print("")

	print("Processing Generated Decisions")
	print("")
	for sKey, tEvent in pairs(tTempDecisions) do
		local bAvailable, bEnactable, bEnacted = tEvent.CanFunc(pPlayer, tEvent.Data1, tEvent.Data2)
		tEvent.Name = Locale.ConvertTextKey(tEvent.Name)
		tEvent.ID = sKey
		
		if bAvailable then
			if bEnactable then
				table.insert(tEnactable, tEvent)
			else
				table.insert(tAvailable, tEvent)
			end
		end
		if bEnacted then
			table.insert(tEnacted, tEvent)
		end
		
		tDecisionsStorage[iPlayer][sKey] = {Name = tEvent.Name, Available = bAvailable, Enactable = bEnactable, Enacted = bEnacted}
		print(tEvent.Name, bAvailable, bEnactable, bEnacted)
	end
	tTempDecisions = {}
	print("")
	
	print("Sort by " ..  Locale.ConvertTextKey(g_SortOptions[g_CurrentSortOption][1]))
	table.sort(tEnacted, 	g_SortOptions[g_CurrentSortOption][2])
	table.sort(tEnactable, 	g_SortOptions[g_CurrentSortOption][2])
	table.sort(tAvailable, 	g_SortOptions[g_CurrentSortOption][2])
	print("End sort")
	
	local tPopulate = {}
	tPopulate.tEnacted = tEnacted
	tPopulate.tEnactable = tEnactable
	tPopulate.tAvailable = tAvailable

	print("Populating screen")
	--Populate list with Decisions
	local bSetColor = false
	for sKey, tTable in pairs(tPopulate) do
		for iKey, tEvent in pairs(tTable) do
		
			g_ItemManagers[tInfo[sKey].iKey]:BuildInstance()
			local itemInstance = g_ItemManagers[tInfo[sKey].iKey]:GetInstance()
			
			local Pedia = CivilopediaControl and (tEvent.Pedia)
			if Pedia then
				itemInstance[tInfo[sKey].sButton]:RegisterCallback(Mouse.eRClick, function() getPedia(Pedia) end)
				
				local sPediaTitle = Locale.ConvertTextKey(tEvent.Pedia)
				local sHelpPedia = Locale.ConvertTextKey("TXT_KEY_RIGHT_CLICK_NOTE", sPediaTitle)
				tEvent.Desc = tEvent.Desc .. sHelpPedia
			end

			itemInstance[tInfo[sKey].sButton]:SetToolTipString(tEvent.Desc)
			itemInstance.Name:SetText(tEvent.Name)
			
			itemInstance.EnactedButton:SetHide(tInfo[sKey].Hide_Enacted)
			itemInstance.EnactableButton:SetHide(tInfo[sKey].Hide_Enactable)
			itemInstance.AvailableButton:SetHide(tInfo[sKey].Hide_Available)
			itemInstance.OptionalIcon:SetHide(true)
			
			if tEvent.IconAtlas ~= nil and tEvent.IconIndex ~= nil then
			
				local iSize = 48
				
				IconHookup(tEvent.IconIndex, iSize, tEvent.IconAtlas, itemInstance.OptionalIcon)
				--if iSize == 45 then iSize = 48 end
				--itemInstance.Name:SetOffsetX(10 + iSize + 8)
				--itemInstance.Name:SetWrapWidth(300 - (iSize + 8))
				itemInstance.OptionalIcon:SetHide(false)
			end
			
			if (tInfo[sKey].bFunction) then
				itemInstance.EnactableButton:RegisterCallback(Mouse.eLClick, 
				function() 
					LuaEvents.PushDecisions(pPlayer, tEvent)
				end)
			end
		
			if (bSetColor == false) then
				itemInstance.Box:SetColorVal(unpack(ltBlue))
			else
				itemInstance.Box:SetColorVal(unpack(dkBlue))
			end
			bSetColor = not bSetColor
			
			local buttonWidth, buttonHeight = itemInstance.DecisionBox:GetSizeVal()
			local descWidth, descHeight = itemInstance.Name:GetSizeVal()
			local newHeight = descHeight + 40	
			itemInstance.DecisionBox:SetSizeVal(buttonWidth, newHeight)
			itemInstance.Box:SetSizeVal(buttonWidth + 20, newHeight)
		end
	end
	print("End populate")
	
	print("Calculating size and anchoring")
	Controls.EnactedStack:CalculateSize()
	Controls.EnactedStack:ReprocessAnchoring()
	Controls.EnactableStack:CalculateSize()
	Controls.EnactableStack:ReprocessAnchoring()
	Controls.LockedStack:CalculateSize()
	Controls.LockedStack:ReprocessAnchoring()
	Controls.ItemScrollPanel:CalculateInternalSize()
	print("Refresh list end")
	print("")
end

function RefreshData()
	if not(bHidden) then
		if not(Players[Game.GetActivePlayer()]:IsTurnActive()) then
			return
		end
		RefreshList()
	end
end

Events.SerialEventCityInfoDirty.Add(RefreshData)
--=======================================================================================================================
-- Collapse/Expand Behavior
--=======================================================================================================================
function OnCollapseExpand()
	Controls.EnactedStack:CalculateSize()
	Controls.EnactedStack:ReprocessAnchoring()
	Controls.EnactableStack:CalculateSize()
	Controls.EnactableStack:ReprocessAnchoring()
	Controls.LockedStack:CalculateSize()
	Controls.LockedStack:ReprocessAnchoring()
	Controls.ItemScrollPanel:CalculateInternalSize()
end

RegisterCollapseBehavior{	
	Header = Controls.EnactedHeader, 
	HeaderLabel = Controls.EnactedHeaderLabel, 
	HeaderExpandedLabel = Locale.Lookup("TXT_KEY_ENACTED_HEADER"),
	HeaderCollapsedLabel = Locale.Lookup("TXT_KEY_ENACTED_HEADER_COLLAPSED"),
	Panel = Controls.EnactedStack,
	Collapsed = false,
	OnCollapse = OnCollapseExpand,
	OnExpand = OnCollapseExpand,
};
							
RegisterCollapseBehavior{
	Header = Controls.EnactableHeader,
	HeaderLabel = Controls.EnactableHeaderLabel,
	HeaderExpandedLabel = Locale.Lookup("TXT_KEY_ENACTABLE_HEADER"),
	HeaderCollapsedLabel = Locale.Lookup("TXT_KEY_ENACTABLE_HEADER_COLLAPSED"),
	Panel = Controls.EnactableStack,
	Collapsed = false,
	OnCollapse = OnCollapseExpand,
	OnExpand = OnCollapseExpand,
};

RegisterCollapseBehavior{
	Header = Controls.LockedHeader,
	HeaderLabel = Controls.LockedHeaderLabel,
	HeaderExpandedLabel = Locale.Lookup("TXT_KEY_LOCKED_HEADER"),
	HeaderCollapsedLabel = Locale.Lookup("TXT_KEY_LOCKED_HEADER_COLLAPSED"),
	Panel = Controls.LockedStack,
	Collapsed = false,
	OnCollapse = OnCollapseExpand,
	OnExpand = OnCollapseExpand,
}
--=======================================================================================================================
-- AI and Notification Support
--=======================================================================================================================
-- AIProcessEventsTable
-------------------------------------------------------------------------
function AIProcessEventsTable(pPlayer, tTable)
	for sKey, tEvent in pairs(tTable) do
		local sType = type(tEvent.Weight)
		if sType == "number" then
			if tEvent.Weight < 1 then
				if GetRandom(0, 1000) <= tEvent.Weight then
					local bAvailable, bEnactable, bEnacted = tEvent.CanFunc(pPlayer, tEvent.Data1, tEvent.Data2)
					if bAvailable and bEnactable then
			
						--print(pPlayer:GetName() .. "(" .. pPlayer:GetID() .. ") Can Enact " .. tEvent.Name)
				
						LuaEvents.PushDecisions(pPlayer, tEvent)
					end
				end
			end
		elseif sType == "function" then
			local bAvailable, bEnactable, bEnacted = tEvent.CanFunc(pPlayer, tEvent.Data1, tEvent.Data2)
			if bAvailable and bEnactable then
			
				--print(pPlayer:GetName() .. "(" .. pPlayer:GetID() .. ") Can Enact " .. tEvent.Name)
				
				if tEvent.Weight(pPlayer, tEvent.Data1, tEvent.Data2) then
					LuaEvents.PushDecisions(pPlayer, tEvent)
				end
			end
		else
			local bAvailable, bEnactable, bEnacted = tEvent.CanFunc(pPlayer, tEvent.Data1, tEvent.Data2)
			if bAvailable and bEnactable then
			
				--print(pPlayer:GetName() .. "(" .. pPlayer:GetID() .. ") Can Enact " .. tEvent.Name)
				
				LuaEvents.PushDecisions(pPlayer, tEvent)
			end
		end
	end
end
-------------------------------------------------------------------------
-- ProcessPlayerDecisions
-------------------------------------------------------------------------
function ProcessPlayerDecisions(iPlayer)
	tDecisionsStorage[iPlayer] = tDecisionsStorage[iPlayer] or {}
	local tPlayerDecisions = {}
	local pPlayer = Players[iPlayer]

	for sKey, tEvent in pairs(tDecisions) do
		local bAvailable, bEnactable, bEnacted = tEvent.CanFunc(pPlayer, tEvent.Data1, tEvent.Data2)
		tPlayerDecisions[sKey] = {Name = tEvent.Name, Available = bAvailable, Enactable = bEnactable, Enacted = bEnacted}
	end
	for sKey, tEvent in pairs(tTempDecisions) do
		tPlayerDecisions[sKey] = {Name = tEvent.Name, Available = bAvailable, Enactable = bEnactable, Enacted = bEnacted}
	end
	tTempDecisions = {}

	return tPlayerDecisions
end
LuaEvents.ProcessPlayerDecisions.Add(ProcessPlayerDecisions)
-------------------------------------------------------------------------
-- GetDecisionsTable
-------------------------------------------------------------------------
function GetDecisionsTable(iPlayer, tTable)
	if not tTable then return end
	tDecisionsStorage[iPlayer] = tDecisionsStorage[iPlayer] or {}
	for sKey, tEvent in pairs(tDecisionsStorage[iPlayer]) do
		tTable[sKey] = {Name = tEvent.Name, Available = tEvent.Available, Enactable = tEvent.Enactable, Enacted = tEvent.Enacted}
	end
end
LuaEvents.GetDecisionsTable.Add(GetDecisionsTable)
-------------------------------------------------------------------------
-- AI_NotificationSupport
-------------------------------------------------------------------------
function AI_NotificationSupport(iPlayer)
	local pPlayer = Players[iPlayer]
	local iActivePlayer = Game.GetActivePlayer()
	
	if pPlayer:IsMinorCiv() or pPlayer:IsBarbarian() then
		return
	end
	--=========================================================
	--Run this block for Humans
	--=========================================================
	if pPlayer:IsHuman() then
		if iPlayer == iActivePlayer then
			local tAvailableNow = ProcessPlayerDecisions(iPlayer)
			local tNewDecisions = {}

			-- Gather a list of newly available decisions
			for sKey, tEvent in pairs(tAvailableNow) do
				local tOldEvent = tDecisionsStorage[iPlayer][sKey]

				local bEnactable = tEvent.Available and tEvent.Enactable
				local bOldEnactable
				if tOldEvent then bOldEnactable = (tOldEvent.Available and tOldEvent.Enactable) else bOldEnactable = false end

				if not(bOldEnactable) and bEnactable then
					table.insert(tNewDecisions, tEvent.Name)
				end	
			end

			-- Update the decisions storage
			tDecisionsStorage[iPlayer] = DeepCopy(tAvailableNow)

			-- Send a notification if number of new decisions is greater than 0 and it's the beginning of a turn.
			if (#tNewDecisions > 0) then
				local sString = ""
				for iKey, sName in ipairs(tNewDecisions) do
					sString = sString .. "[NEWLINE][ICON_BULLET]" .. sName
				end
				local strTitle = Locale.ConvertTextKey("TXT_KEY_DECISION_NOTIFICATION_TITLE")
				local strTooltip = Locale.ConvertTextKey("TXT_KEY_DECISION_NOTIFICATION", sString)
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, strTooltip, strTitle, -1, -1)
			end
		end

		return
	end
	--=========================================================
	--Run this block for Major AIs
	--=========================================================
	if pPlayer:GetCapitalCity() == nil then
		return
	end
	
	AIProcessEventsTable(pPlayer, tDecisions)
	AIProcessEventsTable(pPlayer, tTempDecisions)
	
	tTempDecisions = {}
end

GameEvents.PlayerDoTurn.Add(AI_NotificationSupport)
--=======================================================================================================================
-- Initialise
--=======================================================================================================================
UIManager:QueuePopup(ContextPtr, PopupPriority.SocialPolicy)
UIManager:DequeuePopup(ContextPtr)
--=======================================================================================================================
-- TSL UTILITIES	
--=======================================================================================================================
-- OnModLoaded
if g_TSLSave_Enabled then
	function OnModLoaded() 
		local bNewGame = not TableLoad(tableRoot, tableName)
		TableSave(tableRoot, tableName)
	end
	OnModLoaded()
end

print("--=======================================================================================================================")
print("--=======================================================================================================================")
--=======================================================================================================================
--=======================================================================================================================
function NativePopup(iPlayer, iUnit, iUnitType, iPlotX, iPlotY)
	local pPlayer = Players[iPlayer]
	if not pPlayer:IsMinorCiv() or pPlayer:IsBarbarian() then
	local pSettledCity = Map.GetPlot(iPlotX, iPlotY):GetPlotCity()
	local iRandomSettleEvent = RandomSettleEvent[math.random(#RandomSettleEvent)]
	pSettledCity:DoCityStartEvent(iRandomSettleEvent)
	end
end

function MoralEvents(iPlayer)
local pPlayer = Players[iPlayer]
	if pPlayer:IsMinorCiv() or pPlayer:IsBarbarian() then return end
local pCapital = pPlayer:GetCapitalCity()
	if pCapital == nil then return end
	if pPlayer:GetNumResourceAvailable(iMorality, false) > 100 then
		pPlayer:ChangeNumResourceTotal(iMorality, 100-pPlayer:GetNumResourceAvailable(iMorality, false))
	elseif pPlayer:GetNumResourceAvailable(iMorality, false) < 0 then
		pPlayer:ChangeNumResourceTotal(iMorality, -1*pPlayer:GetNumResourceAvailable(iMorality, false))
	end
	if pPlayer:GetNumResourceAvailable(iMorality, false) >= 80 and pCapital:GetNumBuilding(GameInfoTypes.BUILDING_BENEVOLENCE2) == 0 then
		pCapital:DoCityStartEvent(GameInfoTypes.CITY_EVENT_TRUEBENEVOLENCE)
	elseif pPlayer:GetNumResourceAvailable(iMorality, false) >= 60 and pCapital:GetNumBuilding(GameInfoTypes.BUILDING_BENEVOLENCE) == 0 then
		pCapital:DoCityStartEvent(GameInfoTypes.CITY_EVENT_BENEVOLENCE)
	elseif pPlayer:GetNumResourceAvailable(iMorality, false) > 40 and pPlayer:GetNumResourceAvailable(iMorality, false) < 60 and pCapital:GetNumBuilding(GameInfoTypes.BUILDING_PRAGMATIC) == 0  then
		pCapital:DoCityStartEvent(GameInfoTypes.CITY_EVENT_PRAGMATIC)
	elseif pPlayer:GetNumResourceAvailable(iMorality, false) <= 40 and pCapital:GetNumBuilding(GameInfoTypes.BUILDING_MALEVOLENCE) == 0 then
		pCapital:DoCityStartEvent(GameInfoTypes.CITY_EVENT_MALEVOLENCE)
	elseif pPlayer:GetNumResourceAvailable(iMorality, false) <= 20 and pCapital:GetNumBuilding(GameInfoTypes.BUILDING_MALEVOLENCE2) == 0 then
		pCapital:DoCityStartEvent(GameInfoTypes.CITY_EVENT_TRUEMALEVOLENCE)
	end
end
--[[function MoralResearched(iTeam, iTech, iChange)
	for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
		if (Players[iPlayer] ~= nil and not Players[iPlayer]:IsMinorCiv() and not Players[iPlayer]:IsBarbarian()) then
			if (Players[iPlayer]:GetTeam() == iTeam) then
				if (iTech == GameInfoTypes.TECH_PHILOSOPHY) then
					Players[iPlayer]:ChangeNumResourceTotal(iMorality, 6)
				elseif (iTech == GameInfoTypes.TECH_CIVIL_SERVICE) then
					Players[iPlayer]:ChangeNumResourceTotal(iMorality, -6)
				elseif (iTech == TECH_ACOUSTICS) then
				elseif (iTech == TECH_INDUSTRIALIZATION) then
				elseif (iTech == TECH_NUCLEAR_FISSION) then
				elseif (iTech == TECH_ROBOTICS) then
				elseif (iTech == TECH_GLOBALIZATION) then
				end
			end
		end
	end
end]]
function GetGoodDiploModifier(iDiploModifier, iFromPlayer, iToPlayer)
	local iFromPlayerID = Players[iFromPlayer]
	local iToPlayerID = Players[iToPlayer]
	local iModifier = 0
	if (iDiploModifier == GameInfoTypes.DIPLOMODIFIER_BENEVOLENCE_SAME) then
		if iToPlayerID:GetNumResourceAvailable(iMorality, false) >= 80 and iFromPlayerID:GetNumResourceAvailable(iMorality, false) >= 80 then
			iModifier = -20
		elseif iToPlayerID:GetNumResourceAvailable(iMorality, false) >= 60 and iFromPlayerID:GetNumResourceAvailable(iMorality, false) >= 60 then
			iModifier = -10
		end
	end
	return iModifier
end

function GetNeutralDiploModifier(iDiploModifier, iFromPlayer, iToPlayer)
	local iFromPlayerID = Players[iFromPlayer]
	local iToPlayerID = Players[iToPlayer]
	local iModifier = 0
	if (iDiploModifier == GameInfoTypes.DIPLOMODIFIER_PRAGMATIC_SAME) then
		if iToPlayerID:GetNumResourceAvailable(iMorality, false) > 40 and iToPlayerID:GetNumResourceAvailable(iMorality, false) < 60 and iFromPlayerID:GetNumResourceAvailable(iMorality, false) > 40 and iFromPlayerID:GetNumResourceAvailable(iMorality, false) < 60 then
			iModifier = -5
		end
	end
	return iModifier
end

function GetBadDiploModifier(iDiploModifier, iFromPlayer, iToPlayer)
	local iFromPlayerID = Players[iFromPlayer]
	local iToPlayerID = Players[iToPlayer]
	local iModifier = 0
	if (iDiploModifier == GameInfoTypes.DIPLOMODIFIER_MALEVOLENCE_SAME) then
		if iToPlayerID:GetNumResourceAvailable(iMorality, false) <= 20 and iFromPlayerID:GetNumResourceAvailable(iMorality, false) <= 20 then
			iModifier = -20
		elseif iToPlayerID:GetNumResourceAvailable(iMorality, false) <= 40 and iFromPlayerID:GetNumResourceAvailable(iMorality, false) <= 40 then
			iModifier = -10
		end
	end
	return iModifier
end

function GetContrastDiploModifier(iDiploModifier, iFromPlayer, iToPlayer)
	local iFromPlayerID = Players[iFromPlayer]
	local iToPlayerID = Players[iToPlayer]
	local iModifier = 0
	if (iDiploModifier == GameInfoTypes.DIPLOMODIFIER_MORAL_DIFFERENCE) then
		if iToPlayerID:GetNumResourceAvailable(iMorality, false) <= 40 and iFromPlayerID:GetNumResourceAvailable(iMorality, false) >= 60 then
			iModifier = 15
		elseif iToPlayerID:GetNumResourceAvailable(iMorality, false) >= 60 and iFromPlayerID:GetNumResourceAvailable(iMorality, false) <= 40 then
			iModifier = 15
		end
	end
	return iModifier
end

function GreatDiplomatExpended(iPlayer, iUnit, iUnitType, iX, iY)
	local pUnit = Players[iPlayer]:GetUnitByID(iUnit)
	if pUnit:GetUnitClassType() == GameInfoTypes.UNITCLASS_GREAT_DIPLOMAT then
		Players[iPlayer]:ChangeNumResourceTotal(iMagistrate, 1)
	end
end

function CityAreTheGods(iPlayer, iCityID, iChoice)
	local pPlayer = Players[iPlayer]
	local iHighNoon = GetRandom(1,100)
	if iChoice == GameInfoTypes.CITY_EVENT_ANTIGOV_CHOICE_1 then
		pPlayer:ChangeNumResourceTotal(iMorality, 6)
	elseif iChoice == GameInfoTypes.CITY_EVENT_NATIVES_CHOICE_1 then
		pPlayer:ChangeNumResourceTotal(iMorality, 5)
	elseif iChoice == GameInfoTypes.CITY_EVENT_DESTITUTENOBLE_CHOICE_1 then
		pPlayer:ChangeNumResourceTotal(iMorality, 4)
	elseif iChoice == GameInfoTypes.CITY_EVENT_SACREDRUINS_CHOICE_1 or iChoice == GameInfoTypes.CITY_EVENT_NEWDISEASE_CHOICE_1 then
		pPlayer:ChangeNumResourceTotal(iMorality, 3)
	elseif iChoice == GameInfoTypes.CITY_EVENT_HURRICANE_CHOICE_1 or iChoice == GameInfoTypes.CITY_EVENT_HOSPITAL_OVERCROWDING_CHOICE_4 then
		pPlayer:ChangeNumResourceTotal(iMorality, 2)
	elseif iChoice == GameInfoTypes.CITY_EVENT_MERCENARIES_CHOICE_1 or iChoice == GameInfoTypes.CITY_EVENT_PUBLIC_SCHOOL_DECISION_CHOICE_1 or iChoice == GameInfoTypes.CITY_EVENT_NOMADS_CHOICE_4 or iChoice == GameInfoTypes.CITY_EVENT_EYEFOREYE_CHOICE_3 or iChoice == GameInfoTypes.CITY_EVENT_TEMPLE_CONCERNS_CHOICE_2 or iChoice == GameInfoTypes.CITY_EVENT_HOSPITAL_OVERCROWDING_CHOICE_1 then
		pPlayer:ChangeNumResourceTotal(iMorality, 1)
	elseif iChoice == GameInfoTypes.CITY_EVENT_ANTIGOV_CHOICE_2 then
		if iHighNoon <= 25 then 
			pPlayer:ChangeNumResourceTotal(iMorality, 3)
		elseif iHighNoon >= 75 then 
			pPlayer:ChangeNumResourceTotal(iMorality, -3)
		end
	elseif iChoice == GameInfoTypes.CITY_EVENT_DESTITUTENOBLE_CHOICE_2 or iChoice == GameInfoTypes.CITY_EVENT_NATIVES_CHOICE_2 then
		if iHighNoon <= 25 then 
			pPlayer:ChangeNumResourceTotal(iMorality, 2)
		elseif iHighNoon >= 75 then 
			pPlayer:ChangeNumResourceTotal(iMorality, -2)
		end
	elseif iChoice == GameInfoTypes.CITY_EVENT_SACREDRUINS_CHOICE_2 or iChoice == GameInfoTypes.CITY_EVENT_NEWDISEASE_CHOICE_2 then
		if iHighNoon <= 25 then 
			pPlayer:ChangeNumResourceTotal(iMorality, 1)
		elseif iHighNoon >= 75 then 
			pPlayer:ChangeNumResourceTotal(iMorality, -1)
		end
	elseif iChoice == GameInfoTypes.CITY_EVENT_MERCENARIES_CHOICE_3 or iChoice == GameInfoTypes.CITY_EVENT_PUBLIC_SCHOOL_DECISION_CHOICE_3 or iChoice == GameInfoTypes.CITY_EVENT_NOMADS_CHOICE_2 or iChoice == GameInfoTypes.CITY_EVENT_EYEFOREYE_CHOICE_1 or iChoice == GameInfoTypes. CITY_EVENT_TEMPLE_CONCERNS_CHOICE_1 or iChoice == GameInfoTypes.CITY_EVENT_TEMPLE_CONCERNS_CHOICE_3 or iChoice == GameInfoTypes.CITY_EVENT_HOSPITAL_OVERCROWDING_CHOICE_2 then
		pPlayer:ChangeNumResourceTotal(iMorality, -1)
	elseif iChoice == GameInfoTypes.CITY_EVENT_HURRICANE_CHOICE_2 or iChoice == GameInfoTypes.CITY_EVENT_HOSPITAL_OVERCROWDING_CHOICE_5 then
		pPlayer:ChangeNumResourceTotal(iMorality, -2)
	elseif iChoice == GameInfoTypes.CITY_EVENT_SACREDRUINS_CHOICE_3 or iChoice == GameInfoTypes.CITY_EVENT_NEWDISEASE_CHOICE_3 then
		pPlayer:ChangeNumResourceTotal(iMorality, -3)
	elseif iChoice == GameInfoTypes.CITY_EVENT_DESTITUTENOBLE_CHOICE_3 then
		pPlayer:ChangeNumResourceTotal(iMorality, -4)
	elseif iChoice == GameInfoTypes.CITY_EVENT_NATIVES_CHOICE_3 then
		pPlayer:ChangeNumResourceTotal(iMorality, -5)
	elseif iChoice == GameInfoTypes.CITY_EVENT_ANTIGOV_CHOICE_3 then
		pPlayer:ChangeNumResourceTotal(iMorality, -6)
	end
end

citystateliberated = nil
function LiberatedCityState(iPlayer, iOtherPlayer, iCity)
	citystateliberated = "none"
	local pPlayer = Players[iPlayer]
	local pOtherPlayer = Players[iOtherPlayer]
	local iRandom = GetRandom(1, 100)
	if pPlayer:IsHuman() and pOtherPlayer:IsMinorCiv() then
		pPlayer:DoStartEvent(GameInfoTypes.PLAYER_EVENT_CSLIBERATION)
		citystateliberated = pOtherPlayer
	elseif pOtherPlayer:IsMinorCiv() then
		citystateliberated = pOtherPlayer
		if pPlayer:GetNumResourceAvailable(iMorality, false) >= 60 then
			pPlayer:DoEventChoice(GameInfoTypes.PLAYER_EVENT_CSLIBERATION_CHOICE_1)
		elseif pPlayer:GetNumResourceAvailable(iMorality, false) <= 40 then
			pPlayer:DoEventChoice(GameInfoTypes.PLAYER_EVENT_CSLIBERATION_CHOICE_3)
		elseif iRandom > 50 then
			pPlayer:DoEventChoice(GameInfoTypes.PLAYER_EVENT_CSLIBERATION_CHOICE_2)
		elseif iRandom <= 50 then
			pPlayer:DoEventChoice(GameInfoTypes.PLAYER_EVENT_CSLIBERATION_CHOICE_4)
		end
	end
end

function WeAreTheGods(iPlayer, iChoice)
local pPlayer = Players[iPlayer]
local iHighNoon = GetRandom(1,100)
	if iChoice == GameInfoTypes.PLAYER_EVENT_EXCELLENTOFFICIAL_CHOICE_1 then
		pPlayer:ChangeNumResourceTotal(iMagistrate, 2)
	elseif iChoice == GameInfoTypes.PLAYER_EVENT_CSLIBERATION_CHOICE_1 then
		citystateliberated:SetPersonality(MinorCivPersonalityTypes.MINOR_CIV_PERSONALITY_FRIENDLY)
		pPlayer:ChangeNumResourceTotal(iMorality, 5)
		pPlayer:SetEventChoiceCooldown(GameInfoTypes.PLAYER_EVENT_CSLIBERATION_CHOICE_1)
	elseif iChoice == GameInfoTypes.PLAYER_EVENT_CSLIBERATION_CHOICE_2 then
		citystateliberated:SetPersonality(MinorCivPersonalityTypes.MINOR_CIV_PERSONALITY_NEUTRAL)
		pPlayer:SetEventChoiceCooldown(GameInfoTypes.PLAYER_EVENT_CSLIBERATION_CHOICE_2)
	elseif iChoice == GameInfoTypes.PLAYER_EVENT_CSLIBERATION_CHOICE_3 then
		citystateliberated:SetPersonality(MinorCivPersonalityTypes.MINOR_CIV_PERSONALITY_HOSTILE)
		pPlayer:ChangeNumResourceTotal(iMorality, -5)
		pPlayer:SetEventChoiceCooldown(GameInfoTypes.PLAYER_EVENT_CSLIBERATION_CHOICE_3)
		citystateliberated:ChangeMinorCivFriendshipWithMajor(pPlayer:GetID(), 15)
	elseif iChoice == GameInfoTypes.PLAYER_EVENT_CSLIBERATION_CHOICE_4 then
		citystateliberated:SetPersonality(MinorCivPersonalityTypes.MINOR_CIV_PERSONALITY_IRRATIONAL)
		pPlayer:SetEventChoiceCooldown(GameInfoTypes.PLAYER_EVENT_CSLIBERATION_CHOICE_4)
		if iHighNoon <= 25 then 
			pPlayer:ChangeNumResourceTotal(iMorality, 5)
		elseif iHighNoon >= 75 then 
			pPlayer:ChangeNumResourceTotal(iMorality, -5)
		end
	elseif iChoice == GameInfoTypes.EVENT_AES_WAR_CHOICE_1 then
		pPlayer:ChangeNumResourceTotal(iMorality, -3)
	elseif iChoice == GameInfoTypes.EVENT_AES_WAR_CHOICE_2 then
		pPlayer:ChangeNumResourceTotal(iMorality, 3)
	end
end

function FeelsBadMan(iPlayer, iEvent)
	local pPlayer = Players[iPlayer]
	Event_CityStateData = {}
	for iCS, pCS in pairs(Players) do
		if (pCS:IsAlive() and pCS:IsMinorCiv() and Teams[pPlayer:GetTeam()]:IsHasMet(pCS:GetTeam()) and not(Teams[pPlayer:GetTeam()]:IsAtWar(pCS:GetTeam()))) then
			table.insert(Event_CityStateData, pCS)
		end
	end
	if #Event_CityStateData < 1 then
		if iEvent == GameInfoTypes.PLAYER_EVENT_INCOMPETENTDIPLOMAT then
			return false
		elseif iEvent == GameInfoTypes.PLAYER_EVENT_COMPETENTDIPLOMAT then
			return false
		elseif iEvent == GameInfoTypes.PLAYER_EVENT_CSREGIMECHANGE then
			return false
		end
	end
	return true
end

function OverrideForCityStates(playerID, _, info, tChoiceOverrideStrings)
	local pPlayer = Players[playerID]
    if info.Type == "PLAYER_EVENT_INCOMPETENTDIPLOMAT_CHOICE_1" then
		local Event_IncompetentDiplomatData1 = {}
		for iCS, pCS in pairs(Players) do
			if (pCS:IsAlive() and pCS:IsMinorCiv() and Teams[pPlayer:GetTeam()]:IsHasMet(pCS:GetTeam()) and not(Teams[pPlayer:GetTeam()]:IsAtWar(pCS:GetTeam()))) then
				table.insert(Event_IncompetentDiplomatData1, pCS)
			end
		end
		local Event_IncompetentDiplomatData2 = Event_IncompetentDiplomatData1[GetRandom(1, #Event_IncompetentDiplomatData1)]
		local Event_IncompetentDiplomatData3 = GetRandom(5,45)
        local help = Locale.ConvertTextKey("TXT_KEY_EVENT_INCOMPETENTDIPLOMAT_CHOICE_" .. GetRandom(1, 3) .. "_HELP", Event_IncompetentDiplomatData2:GetCivilizationAdjectiveKey(), Event_IncompetentDiplomatData2:GetCivilizationShortDescription(), Event_IncompetentDiplomatData3)
        table.insert(tChoiceOverrideStrings, {Description = nil, Help = help})
		if Event_IncompetentDiplomatData2 ~= nil and Event_IncompetentDiplomatData3 ~= nil then
			Event_IncompetentDiplomatData2:ChangeMinorCivFriendshipWithMajor(pPlayer:GetID(), -Event_IncompetentDiplomatData3)
		end
	elseif info.Type == "PLAYER_EVENT_COMPETENTDIPLOMAT_CHOICE_1" then
		local Event_CompetentDiplomatData1 = {}
		for iCS, pCS in pairs(Players) do
			if (pCS:IsAlive() and pCS:IsMinorCiv() and Teams[pPlayer:GetTeam()]:IsHasMet(pCS:GetTeam()) and not(Teams[pPlayer:GetTeam()]:IsAtWar(pCS:GetTeam()))) then
				table.insert(Event_CompetentDiplomatData1, pCS)
			end
		end
		local Event_CompetentDiplomatData2 = Event_CompetentDiplomatData1[GetRandom(1, #Event_CompetentDiplomatData1)]
		local Event_CompetentDiplomatData3 = GetRandom(20,60)
        local help = Locale.ConvertTextKey("TXT_KEY_EVENT_COMPETENTDIPLOMAT_CHOICE_" .. GetRandom(1, 2) .. "_HELP", Event_CompetentDiplomatData2:GetCivilizationAdjectiveKey(), Event_CompetentDiplomatData2:GetCivilizationShortDescription(), Event_CompetentDiplomatData3)
        table.insert(tChoiceOverrideStrings, {Description = nil, Help = help})
		if Event_CompetentDiplomatData2 ~= nil and Event_CompetentDiplomatData3 ~= nil then
			Event_CompetentDiplomatData2:ChangeMinorCivFriendshipWithMajor(pPlayer:GetID(), Event_CompetentDiplomatData3)
		end
	elseif info.Type == "PLAYER_EVENT_CSREGIMECHANGE_CHOICE_1" then
		local Event_CSRegimeChangeData1 = {}
		for iCS, pCS in pairs(Players) do
			if (pCS:IsAlive() and pCS:IsMinorCiv() and Teams[pPlayer:GetTeam()]:IsHasMet(pCS:GetTeam()) and not(Teams[pPlayer:GetTeam()]:IsAtWar(pCS:GetTeam()))) then
				table.insert(Event_CSRegimeChangeData1, pCS)
			end
		end
		local Event_CSRegimeChangeData2 = Event_CSRegimeChangeData1[GetRandom(1, #Event_CSRegimeChangeData1)]
		local Event_CSRegimeChangeData = RegimeChange[math.random(#RegimeChange)]
		Event_CSRegimeChangeData2:SetPersonality(Event_CSRegimeChangeData)
		local iPersonality = Event_CSRegimeChangeData2:GetPersonality()
		local tooltiptext = ""
		if (iPersonality == MinorCivPersonalityTypes.MINOR_CIV_PERSONALITY_FRIENDLY) then
			tooltiptext = "TXT_KEY_CITY_STATE_PERSONALITY_FRIENDLY"
		elseif (iPersonality == MinorCivPersonalityTypes.MINOR_CIV_PERSONALITY_NEUTRAL) then
			tooltiptext = "TXT_KEY_CITY_STATE_PERSONALITY_NEUTRAL"
		elseif (iPersonality == MinorCivPersonalityTypes.MINOR_CIV_PERSONALITY_HOSTILE) then
			tooltiptext = "TXT_KEY_CITY_STATE_PERSONALITY_HOSTILE"
		elseif (iPersonality == MinorCivPersonalityTypes.MINOR_CIV_PERSONALITY_IRRATIONAL) then
			tooltiptext = "TXT_KEY_CITY_STATE_PERSONALITY_IRRATIONAL"
		end
        local help = Locale.ConvertTextKey("TXT_KEY_EVENT_CSREGIMECHANGE_CHOICE_1_HELP", Event_CSRegimeChangeData2:GetCivilizationAdjectiveKey(), tooltiptext)
        table.insert(tChoiceOverrideStrings, {Description = nil, Help = help})
    end
end

RegimeChange = {MinorCivPersonalityTypes.MINOR_CIV_PERSONALITY_FRIENDLY, MinorCivPersonalityTypes.MINOR_CIV_PERSONALITY_NEUTRAL, MinorCivPersonalityTypes.MINOR_CIV_PERSONALITY_HOSTILE, MinorCivPersonalityTypes.MINOR_CIV_PERSONALITY_IRRATIONAL}
RandomSettleEvent = {GameInfoTypes.CITY_EVENT_NATIVES, GameInfoTypes.CITY_EVENT_ANTIGOV, GameInfoTypes.CITY_EVENT_SACREDRUINS, GameInfoTypes.CITY_EVENT_NEWDISEASE}
GameEvents.CityEventChoiceActivated.Add(CityAreTheGods)
GameEvents.EventChoiceActivated.Add(WeAreTheGods)
GameEvents.UnitCityFounded.Add(NativePopup)
GameEvents.PlayerDoTurn.Add(MoralEvents)
--GameEvents.TeamTechResearched.Add(MoralResearched)
GameEvents.GetDiploModifier.Add(GetGoodDiploModifier)
GameEvents.GetDiploModifier.Add(GetNeutralDiploModifier)
GameEvents.GetDiploModifier.Add(GetBadDiploModifier)
GameEvents.GetDiploModifier.Add(GetContrastDiploModifier)
GameEvents.GreatPersonExpended.Add(GreatDiplomatExpended)
LuaEvents.EventChoice_OverrideTextStrings.Add(OverrideForCityStates)
GameEvents.EventCanTake.Add(FeelsBadMan)
GameEvents.PlayerLiberated.Add(LiberatedCityState)
