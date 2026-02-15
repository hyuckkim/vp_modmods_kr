include("InstanceManager")

local bIsRegistered = false

local isUsingEUI = false
local isUsingIGE = false

local IGEModId = "170c8ed1-b516-4fe2-b571-befeac39d220"
for _, mod in pairs(Modding.GetActivatedMods()) do
  if (mod.ID == IGEModId) then
    isUsingIGE = true
	break
  end
end

-- DO NOT CHANGE THIS VALUE!!!  It MUST be the version of the "Utils - Modular Summary Bar" mod included into your mod
local modVersion = 4

local savedData = Modding.OpenUserData("SummaryBar", 3)

local g_ButtonManager = InstanceManager:new("SummaryInstance", "SummaryButton", Controls.SummaryStack)
local buttonUpdates = {}
local topPanelTooltipTable = {}

local iBaseX = 300   -- We update this value later, in case the user changes the offset in the XML context
local iMayanAdjustX = 50
local iIgeAdjustX = 115

local gNoSummaryOverlay = false
LuaEvents.SummaryOverlayOff.Add(function () gNoSummaryOverlay = true; ContextPtr:SetHide(gNoSummaryOverlay) end)
LuaEvents.SummaryOverlayNotify()

-----
----- Addin Functions -----
-----
local g_SummaryBarTabs = {}
local iPriority = 100

function OnSummaryBarAddin(tab)
  if (not ContextPtr:IsHidden()) then
    if (tab.priority == nil) then
      tab.priority = iPriority
      iPriority = iPriority + 1
    end

    setDefaultToggle(tab.id, (tab.small == true))

    table.insert(g_SummaryBarTabs, tab)
  end
end

function LoadAddins()
  LuaEvents.SummaryBarAddin.Add(OnSummaryBarAddin)

  summaryAddins = {}
  for addin in Modding.GetActivatedModEntryPoints("SummaryBarAddin") do
    local addinFile = addin.File;
    local extension = Path.GetExtension(addinFile);
    local path = string.sub(addinFile, 1, #addinFile - #extension);
    ptr = ContextPtr:LoadNewContext(path)
    table.insert(summaryAddins, ptr)
  end

  table.sort(g_SummaryBarTabs, byPriority)
end


-----
----- Hide the TopPanel overlay when the Civilopedia is active -----
-----
function SystemUpdateUIHandler(iType)
  if (iType == SystemUpdateUIType.BulkHideUI) then
    ContextPtr:SetHide(true)
  elseif (iType == SystemUpdateUIType.BulkShowUI) then
    ContextPtr:SetHide(gNoSummaryOverlay)
  end
end
Events.SystemUpdateUI.Add(SystemUpdateUIHandler)


-----
----- Update Functions -----
-----
function OnClick(iTab)
  local tab = g_SummaryBarTabs[iTab]

  tab.click(getButtonOffsetX(iTab), tab.button)
end

function OnRightClick(iTab)
  local tab = g_SummaryBarTabs[iTab]

  if (tab.rclick) then
    tab.rclick(getButtonOffsetX(iTab), tab.button)
  else
    setToggle(tab.id, not (isToggle(tab.id) == true))

    OnUpdateButton(iTab)
	
    if (isUsingEUI) then
      Controls.SummaryStack:CalculateSize()
      Controls.SummaryStack:ReprocessAnchoring()
      Controls.TopPanelBarC:SetSizeX(Controls.SummaryStack:GetSizeX() + 30)
    end
  end
end

function OnUpdateToolTip(iTab)
  local tab = g_SummaryBarTabs[iTab]
  local sLabel = nil

  if type(tab.tip) == "string" then
    sLabel = Locale.ConvertTextKey(tab.tip)
  elseif type(tab.tip) == "function" then
    sLabel = g_SummaryBarTabs[iTab].tip(Game.GetActivePlayer())
  end

  if (sLabel ~= nil) then
    topPanelTooltipTable.TopPanelMouseover:SetHide(false)
    topPanelTooltipTable.TooltipLabel:SetText(sLabel)
    topPanelTooltipTable.TopPanelMouseover:DoAutoSize()
  else
    topPanelTooltipTable.TopPanelMouseover:SetHide(true)
  end
end

function OnUpdateButton(iTab)
  local tab = g_SummaryBarTabs[iTab]
  local sText = ""

  if type(tab.text) == "string" then
    sText = Locale.ConvertTextKey(tab.text)

    if (isToggle(tab.id) == true) then
	  if (tab.short) then
        sText = Locale.ConvertTextKey(tab.short)
	  end
    end
  elseif type(tab.text) == "function" then
    sText = tab.text(Game.GetActivePlayer(), (isToggle(tab.id) == true))
  end

  tab.button:SetText(sText)
end

function OnUpdateButtons()
  if (isUsingEUI) then
    -- Do nothing here
  elseif (isUsingIGE) then
    Controls.SummaryStack:SetOffsetX(iBaseX + iIgeAdjustX)
  elseif (Players[Game.GetActivePlayer()]:IsUsingMayaCalendar()) then
    Controls.SummaryStack:SetOffsetX(iBaseX + iMayanAdjustX)
  else
    Controls.SummaryStack:SetOffsetX(iBaseX)
  end

  for _,iTab in ipairs(buttonUpdates) do
    OnUpdateButton(iTab)
  end

  Controls.SummaryStack:CalculateSize()
  Controls.SummaryStack:ReprocessAnchoring()
  if (isUsingEUI) then
	 Controls.TopPanelBarC:SetSizeX(Controls.SummaryStack:GetSizeX() + 30)
  end
end


-----
----- Helper Functions -----
-----
function getButtonOffsetX(iTab)
  local iStackPadding = 10
  local iButtonOffsetX = Controls.SummaryStack:GetOffsetX() - iStackPadding

  for i = 1, iTab, 1 do
    iButtonOffsetX = iButtonOffsetX + g_SummaryBarTabs[i].button:GetSizeX() + iStackPadding
  end
  
  if (isUsingEUI) then
    local iScreenX, _ = UIManager:GetScreenSizeVal()
	local iStackX = Controls.SummaryStack:GetSizeX()
	
	iButtonOffsetX = iButtonOffsetX + ((iScreenX - iStackX) / 2)
  end

  return iButtonOffsetX
end

function byPriority(a, b)
  return (a.priority < b.priority)
end

function OnSummaryBarBroadcast(broadcastModVersion, action, response)
  if (action == "present") then
    if (broadcastModVersion > modVersion) then
	  -- The broadcasting mod is more recent than I am, so pretend I'm not really here
      LuaEvents.ModBroadcast.Remove(OnModBroadcast)
	  ContextPtr:SetHide(true)
	else
	  -- I'm more recent (or got here first) than the broadcasting mod, so signal that I've already loaded the addins
      table.insert(response, "Already here!")
	end
  end
end

function isModInitialised()
  local response = {}
  LuaEvents.ModBroadcast(modVersion, "present", response)

  if (#response == 0) then
    LuaEvents.ModBroadcast.Add(OnSummaryBarBroadcast)
  end

  return (#response ~= 0)
end

function setDefaultToggle(sKey, bValue)
  local value = savedData.GetValue(sKey)
  if (value == nil) then
    setToggle(sKey, bValue)
  end
end

function setToggle(sKey, bValue)
  local iValue = 0
  if (bValue == true) then iValue = 1 end

  savedData.SetValue(sKey, iValue)
end

function isToggle(sKey)
  local value = savedData.GetValue(sKey)

  return (value ~= nil and value == 1)
end


-----
----- Initialisation -----
-----
function Initialize()
  if (not isModInitialised()) then
    ContextPtr:SetHide(false)
    iBaseX = Controls.SummaryStack:GetOffsetX()
	
    LoadAddins()

    TTManager:GetTypeControlTable("TooltipTypeTopPanel", topPanelTooltipTable)

    for i,tab in ipairs(g_SummaryBarTabs) do
        local controlTable = g_ButtonManager:GetInstance()
	    local button = controlTable.SummaryButton

        print(string.format("Added SummaryTab %s", tab.id))
	    tab.button = button

	    if (tab.callback) then
	      tab.callback(button)
	    end

        if type(tab.text) == "string" then
	      OnUpdateButton(i)
        elseif type(tab.text) == "function" then
	      table.insert(buttonUpdates, i)
	    end

        button:SetToolTipCallback(function() OnUpdateToolTip(i) end)

	    if (tab.click) then
          button:RegisterCallback(Mouse.eLClick, function() OnClick(i) end)
	    end

        button:RegisterCallback(Mouse.eRClick, function() OnRightClick(i) end)
    end

    Events.SerialEventGameDataDirty.Add(OnUpdateButtons)
    Events.SerialEventCityInfoDirty.Add(OnUpdateButtons)
    Events.SerialEventTurnTimerDirty.Add(OnUpdateButtons)
    Events.GameplaySetActivePlayer.Add(OnUpdateButtons)

    OnUpdateButtons()
  else
    ContextPtr:SetHide(true)
  end
end

function SetActivePlayer(iPlayer, iPrevPlayer)
  if (not bIsRegistered) then
    -- This doesn't want to play nicely at load time!
	local control = ContextPtr:LookUpControl("/InGame/TopPanel/CurrentDate")
    
	if (control) then
      isUsingEUI = (ContextPtr:LookUpControl("/InGame/TopPanel/TopPanelBarR") ~= nil)
	
      if (isUsingEUI) then
        iBaseX = -5
        Controls.SummaryStack:SetAnchor("C,T")
        Controls.SummaryStack:SetOffsetX(iBaseX)
        Controls.TopPanelBarC:SetHide(false)
      end

	  bIsRegistered = true
      -- Events.GameplaySetActivePlayer.Remove(SetActivePlayer)

	  OnUpdateButtons()
	end
  end
end
Events.GameplaySetActivePlayer.Add(SetActivePlayer)

Initialize()
