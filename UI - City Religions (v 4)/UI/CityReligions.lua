print("This is the 'UI - City Religions' mod script.")

include("IconSupport")
include("InfoTooltipInclude")
include("InstanceManager")

local bIsRegistered = false

local g_ActivePanel = "Cities"

local g_ImCities = InstanceManager:new("CityInstance", "City", Controls.CitiesStack)
local g_ImPurchases = InstanceManager:new("PurchaseInstance", "City", Controls.PurchasesStack)

local g_SortTable = {}
local g_ActiveSort = "status"
local g_ReverseSort = false

local g_StatusIcons = {"[ICON_CAPITAL]", "", "[ICON_OCCUPIED]", "[ICON_PUPPET]", "[ICON_RESISTANCE]", "[ICON_RAZING]"}
local g_StatusToolTips = {"TXT_KEY_CR_STATUS_CAPITAL_TT", "", "TXT_KEY_CR_STATUS_OCCUPIED_TT", "TXT_KEY_CR_STATUS_PUPPET_TT", "TXT_KEY_CR_STATUS_RESISTANCE_TT", "TXT_KEY_CR_STATUS_RAZING_TT"}


function OnSort(sort)
  if (sort == g_ActiveSort) then
    g_ReverseSort = not g_ReverseSort
  else
    g_ReverseSort = not (sort == "name" or sort == "status" or sort == "buildTurns")
    g_ActiveSort = sort
  end

  Controls.CitiesStack:SortChildren(SortByValue)
  Controls.PurchasesStack:SortChildren(SortByValue)
end
Controls.CitiesSortPop:RegisterCallback(Mouse.eLClick, function() OnSort("pop") end)
Controls.CitiesSortIcon:RegisterCallback(Mouse.eLClick, function() OnSort("status") end)
Controls.CitiesSortReligion:RegisterCallback(Mouse.eLClick, function() OnSort("religion") end)
Controls.CitiesSortName:RegisterCallback(Mouse.eLClick, function() OnSort("name") end)
Controls.CitiesSortReligion0:RegisterCallback(Mouse.eLClick, function() OnSort("religion0") end)
Controls.CitiesSortReligion1:RegisterCallback(Mouse.eLClick, function() OnSort("religion1") end)
Controls.CitiesSortReligion2:RegisterCallback(Mouse.eLClick, function() OnSort("religion2") end)
Controls.CitiesSortReligion3:RegisterCallback(Mouse.eLClick, function() OnSort("religion3") end)
Controls.CitiesSortReligion4:RegisterCallback(Mouse.eLClick, function() OnSort("religion4") end)
Controls.CitiesSortReligion5:RegisterCallback(Mouse.eLClick, function() OnSort("religion5") end)
Controls.CitiesSortReligion6:RegisterCallback(Mouse.eLClick, function() OnSort("religion6") end)
Controls.CitiesSortReligion7:RegisterCallback(Mouse.eLClick, function() OnSort("religion7") end)
Controls.CitiesSortReligion8:RegisterCallback(Mouse.eLClick, function() OnSort("religion8") end)
Controls.CitiesSortReligion9:RegisterCallback(Mouse.eLClick, function() OnSort("religion9") end)
Controls.CitiesSortReligion10:RegisterCallback(Mouse.eLClick, function() OnSort("religion10") end)
Controls.CitiesSortReligion11:RegisterCallback(Mouse.eLClick, function() OnSort("religion11") end)
Controls.CitiesSortReligion12:RegisterCallback(Mouse.eLClick, function() OnSort("religion12") end)
Controls.CitiesSortReligion13:RegisterCallback(Mouse.eLClick, function() OnSort("religion13") end)
Controls.CitiesSortReligion14:RegisterCallback(Mouse.eLClick, function() OnSort("religion14") end)
Controls.CitiesSortReligion15:RegisterCallback(Mouse.eLClick, function() OnSort("religion15") end)
Controls.PurchasesSortPop:RegisterCallback(Mouse.eLClick, function() OnSort("pop") end)
Controls.PurchasesSortIcon:RegisterCallback(Mouse.eLClick, function() OnSort("status") end)
Controls.PurchasesSortReligion:RegisterCallback(Mouse.eLClick, function() OnSort("religion") end)
Controls.PurchasesSortName:RegisterCallback(Mouse.eLClick, function() OnSort("name") end)

function SortByValue(a, b)
  local entryA = g_SortTable[tostring(a)]
  local entryB = g_SortTable[tostring(b)]

  if (entryA == nil or entryB == nil) then
    return tostring(a) < tostring(b)
  end

  local valueA = entryA[g_ActiveSort]
  local valueB = entryB[g_ActiveSort]

  if (valueA == valueB) then
    valueA = entryA.name
    valueB = entryB.name
  elseif (g_ReverseSort) then
    valueA = entryB[g_ActiveSort]
    valueB = entryA[g_ActiveSort]
  end

  if (valueA == nil or valueB == nil) then
    return tostring(a) < tostring(b)
  end

  return valueA < valueB
end

function OnCity(pCity)
  -- From CityBannerManager
  if (pCity:IsPuppet()) then
    Events.SerialEventGameMessagePopup({Type=ButtonPopupTypes.BUTTONPOPUP_ANNEX_CITY, Data1=pCity:GetID(), Data2=-1, Data3=-1, Option1=false, Option2=false})
  else
    UI.DoSelectCityAtPlot(pCity:Plot())
  end
end


function GetAllReligions(iActivePlayer)
  local iActiveReligion = ReligionTypes.NO_RELIGION
  local allReligions = {}

  for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
    local pPlayer = Players[iPlayer]

    if (pPlayer:IsEverAlive() and pPlayer:HasCreatedReligion(false)) then
      local iReligion = pPlayer:GetReligionCreatedByPlayer()
      
      if (iReligion > ReligionTypes.RELIGION_PANTHEON) then
        if (iActivePlayer == iPlayer) then
          iActiveReligion = iReligion
        else
          table.insert(allReligions, iReligion)
        end
      end
    end
  end

  if (iActiveReligion ~= ReligionTypes.NO_RELIGION) then
    allReligions[0] = iActiveReligion
  end

  return allReligions
end


function UpdateCitiesPanel(iPlayer)
  local pPlayer = Players[iPlayer]
  CivIconHookup(iPlayer, 64, Controls.Icon, Controls.CivIconBG, Controls.CivIconShadow, false, true)

  local iPlayerReligion = pPlayer:GetReligionCreatedByPlayer()
  local allReligions = GetAllReligions(iPlayer)

  for iReligion = 0, 15, 1 do
    local control = Controls["CitiesSortReligion" .. iReligion]
    if (allReligions[iReligion]) then
	  local eReligion = allReligions[iReligion]
	  local religion = GameInfo.Religions[eReligion]
	  local iFounder = Game.GetFounder(eReligion, -1)
      control:SetText(religion.IconString)
      control:SetToolTipString(Locale.ConvertTextKey("TXT_KEY_CR_SORT_CITY_RELIGION_TT", religion.Description, Players[iFounder]:GetCivilizationShortDescriptionKey(), Game.GetHolyCityForReligion(eReligion, iFounder):GetNameKey()))
      control:SetHide(false)
    else
      control:SetHide(true)
	end
  end

  g_ImCities:ResetInstances()
  g_SortTable = {}

  for pCity in pPlayer:Cities() do
    local instance = g_ImCities:GetInstance()
    local sort = {}
    g_SortTable[tostring(instance.City)] = sort

    sort.pop = pCity:GetPopulation()
    instance.Pop:SetText(pCity:GetPopulation())
	
    local iStatus = pCity:IsRazing() and 6 or
                    pCity:IsResistance() and 5 or
                    pCity:IsPuppet() and 4 or
                   (pCity:IsOccupied() and not pCity:IsNoOccupiedUnhappiness()) and 3 or
                    pCity:IsCapital() and 1 or 2
    sort.status = iStatus
    instance.Icon:SetText(g_StatusIcons[iStatus])
    instance.Icon:SetToolTipString(Locale.ConvertTextKey(g_StatusToolTips[iStatus]))

	local iReligion = pCity:GetReligiousMajority()
	local religion = GameInfo.Religions[iReligion]
	sort.religion = (iReligion == iPlayerReligion) and -1 or iReligion
    instance.Religion:SetText(religion and religion.IconString or "")
    instance.Religion:SetToolTipString(religion and Locale.ConvertTextKey(religion.Description) or "")

    sort.name = pCity:GetName()
    instance.Name:SetText(pCity:GetName())
    instance.Name:RegisterCallback(Mouse.eLClick, function() OnCity(pCity) end)

	for iReligion = 0, 15, 1 do
	  local control = instance["Religion" .. iReligion]
	  local sortkey = "religion" .. iReligion

	  if (allReligions[iReligion]) then
	    local iFollowers = pCity:GetNumFollowers(allReligions[iReligion])
	    local sText = (iFollowers > 0) and iFollowers or ""
		local sTooltip = Locale.ConvertTextKey(GameInfo.Religions[allReligions[iReligion]].Description)

		if (iReligion == 0) then
		  local iMyPressure = pCity:GetPressurePerTurn(allReligions[iReligion])

		  for iOtherReligion = 1, 15, 1 do
		    if (allReligions[iOtherReligion] and pCity:GetPressurePerTurn(allReligions[iOtherReligion]) > iMyPressure) then
		      sText = "[COLOR_WARNING_TEXT]" .. sText .. "[ENDCOLOR]"
			  break;
		    end
		  end

          sTooltip = GetReligionTooltip(pCity)
		end

	    sort[sortkey] = iFollowers
        control:SetText(sText)
        control:SetToolTipString(sTooltip)
	  else
	    sort[sortkey] = 0	
        control:SetText("")
        control:SetToolTipString("")
	  end
	end
  end

  Controls.CitiesStack:SortChildren(SortByValue)
  Controls.CitiesStack:CalculateSize()
  Controls.CitiesScrollPanel:CalculateInternalSize()
end

function UpdatePurchasesPanel(iPlayer)
  local pPlayer = Players[iPlayer]
  CivIconHookup(iPlayer, 64, Controls.Icon, Controls.CivIconBG, Controls.CivIconShadow, false, true)

  local iPlayerReligion = pPlayer:GetReligionCreatedByPlayer()

  g_ImPurchases:ResetInstances()
  g_SortTable = {}

  for pCity in pPlayer:Cities() do
    if (not (pCity:IsRazing() or pCity:IsResistance() or pCity:IsPuppet())) then
      local instance = g_ImPurchases:GetInstance()
      local sort = {}
      g_SortTable[tostring(instance.City)] = sort

      sort.pop = pCity:GetPopulation()
      instance.Pop:SetText(pCity:GetPopulation())
	
      local iStatus = pCity:IsRazing() and 6 or
                      pCity:IsResistance() and 5 or
                      pCity:IsPuppet() and 4 or
                     (pCity:IsOccupied() and not pCity:IsNoOccupiedUnhappiness()) and 3 or
                      pCity:IsCapital() and 1 or 2
      sort.status = iStatus
      instance.Icon:SetText(g_StatusIcons[iStatus])
      instance.Icon:SetToolTipString(Locale.ConvertTextKey(g_StatusToolTips[iStatus]))

	  local iReligion = pCity:GetReligiousMajority()
	  local religion = GameInfo.Religions[iReligion]
	  sort.religion = (iReligion == iPlayerReligion) and -1 or iReligion
      instance.Religion:SetText(religion and religion.IconString or "")
      instance.Religion:SetToolTipString(religion and Locale.ConvertTextKey(religion.Description) or "")

      sort.name = pCity:GetName()
      instance.Name:SetText(pCity:GetName())
      instance.Name:RegisterCallback(Mouse.eLClick, function() OnCity(pCity) end)
	
	  if (instance.imPurchases == nil) then
	    instance.imPurchases = InstanceManager:new("ItemInstance", "Item", instance.ItemsStack)
	  end
	
	  local iItems = 0
	  local imPurchases = instance.imPurchases
	  imPurchases:ResetInstances()
	
 	  for building in GameInfo.Buildings() do
 		local iBuilding = building.ID
		if (iItems < 9 and pCity:IsCanPurchase(false, false, -1, iBuilding, -1, YieldTypes.YIELD_FAITH)) then
			local item = imPurchases:GetInstance()
			IconHookup(building.PortraitIndex, 45, building.IconAtlas, item.Icon)
			item.Cost:SetText(pCity:GetBuildingFaithPurchaseCost(iBuilding))
			
			if (not pCity:IsCanPurchase(true, true, -1, iBuilding, -1, YieldTypes.YIELD_FAITH)) then
				item.Item:SetToolTipString(Locale.ConvertTextKey(building.Description) .. "[NEWLINE][COLOR_WARNING_TEXT]" .. pCity:GetFaithPurchaseBuildingTooltip(iBuilding) .. "[ENDCOLOR]")
				item.Item:SetAlpha(0.4)
				item.Item:ClearCallback(Mouse.eLClick)
			else
				item.Item:SetToolTipString(Locale.ConvertTextKey(building.Description))
				item.Item:SetAlpha(1.0)
				item.Item:SetVoids(pCity:GetID(), iBuilding)
				item.Item:RegisterCallback(Mouse.eLClick, OnPurchaseBuilding)
			end
			
			iItems = iItems + 1
		end
	  end

 	  for unit in GameInfo.Units() do
 		local iUnit = unit.ID
		if (iItems < 9 and unit.SpreadReligion == 0 and (unit.Combat == 0 and unit.RangedCombat == 0) and pCity:IsCanPurchase(false, false, iUnit, -1, -1, YieldTypes.YIELD_FAITH)) then
			local item = imPurchases:GetInstance()
			IconHookup(unit.PortraitIndex, 45, unit.IconAtlas, item.Icon)
			item.Cost:SetText(pCity:GetUnitFaithPurchaseCost(iUnit, true))

			if (not pCity:IsCanPurchase(true, true, iUnit, -1, -1, YieldTypes.YIELD_FAITH)) then
				item.Item:SetToolTipString(Locale.ConvertTextKey(unit.Description) .. "[NEWLINE][COLOR_WARNING_TEXT]" .. pCity:GetFaithPurchaseUnitTooltip(iUnit) .. "[ENDCOLOR]")
				item.Item:SetAlpha(0.4)
				item.Item:ClearCallback(Mouse.eLClick)
			else
				item.Item:SetToolTipString(Locale.ConvertTextKey(unit.Description))
				item.Item:SetAlpha(1.0)
				item.Item:SetVoids(pCity:GetID(), iUnit)
				item.Item:RegisterCallback(Mouse.eLClick, OnPurchaseUnit)
			end
			
			iItems = iItems + 1
 		end
	  end

 	  for unit in GameInfo.Units() do
 		local iUnit = unit.ID
		if (iItems < 9 and (unit.Combat ~= 0 or unit.RangedCombat ~= 0) and pCity:IsCanPurchase(false, false, iUnit, -1, -1, YieldTypes.YIELD_FAITH)) then
			local item = imPurchases:GetInstance()
			IconHookup(unit.PortraitIndex, 45, unit.IconAtlas, item.Icon)
			item.Cost:SetText(pCity:GetUnitFaithPurchaseCost(iUnit, true))

			if (not pCity:IsCanPurchase(true, true, iUnit, -1, -1, YieldTypes.YIELD_FAITH)) then
				item.Item:SetToolTipString(Locale.ConvertTextKey(unit.Description) .. "[NEWLINE][COLOR_WARNING_TEXT]" .. pCity:GetFaithPurchaseUnitTooltip(iUnit) .. "[ENDCOLOR]")
				item.Item:SetAlpha(0.4)
				item.Item:ClearCallback(Mouse.eLClick)
			else
				item.Item:SetToolTipString(Locale.ConvertTextKey(unit.Description))
				item.Item:SetAlpha(1.0)
				item.Item:SetVoids(pCity:GetID(), iUnit)
				item.Item:RegisterCallback(Mouse.eLClick, OnPurchaseUnit)
			end
			
			item.Item:SetVoids(pCity:GetID(), iUnit)
			item.Item:RegisterCallback(Mouse.eLClick, OnPurchaseUnit)
			
			iItems = iItems + 1
 		end
	  end

	  instance.ItemsStack:CalculateSize()
    end
  end

  Controls.PurchasesStack:SortChildren(SortByValue)
  Controls.PurchasesStack:CalculateSize()
  Controls.PurchasesScrollPanel:CalculateInternalSize()
end

function OnPurchaseBuilding(iCity, iBuilding)
  local pCity = Players[Game.GetActivePlayer()]:GetCityByID(iCity)
  local iYield = YieldTypes.YIELD_FAITH

  if (pCity:IsCanPurchase(true, true, -1, iBuilding, -1, iYield)) then
    Game.CityPurchaseBuilding(pCity, iBuilding, iYield)
  end
end

function OnPurchaseUnit(iCity, iUnit)
  local pCity = Players[Game.GetActivePlayer()]:GetCityByID(iCity)
  local iYield = YieldTypes.YIELD_FAITH

  if (pCity:IsCanPurchase(true, true, iUnit, -1, -1, iYield)) then
    Game.CityPurchaseUnit(pCity, iUnit, iYield)
  end
end

function OnClose()
  ContextPtr:SetHide(true)
end
Controls.CloseButton:RegisterCallback(Mouse.eLClick, OnClose)

function InputHandler(uiMsg, wParam, lParam)
  if (uiMsg == KeyEvents.KeyDown) then
    if (wParam == Keys.VK_ESCAPE) then
      OnClose()
      return true
    end
  end
end
ContextPtr:SetInputHandler(InputHandler)

function OnCitiesButton()
  g_ActivePanel = "Cities"

  Controls.CitiesPanel:SetHide(false)
  Controls.PurchasesPanel:SetHide(true)

  Controls.CitiesSelectHighlight:SetHide(false)
  Controls.PurchasesSelectHighlight:SetHide(true)

  UpdateCitiesPanel(Game.GetActivePlayer())
end
Controls.CitiesButton:RegisterCallback(Mouse.eLClick, OnCitiesButton)

function OnPurchasesButton()
  g_ActivePanel = "Purchases"

  Controls.CitiesPanel:SetHide(true)
  Controls.PurchasesPanel:SetHide(false)

  Controls.CitiesSelectHighlight:SetHide(true)
  Controls.PurchasesSelectHighlight:SetHide(false)

  UpdatePurchasesPanel(Game.GetActivePlayer())
end
Controls.PurchasesButton:RegisterCallback(Mouse.eLClick, OnPurchasesButton)

function OnCityViewUpdate()
  if (not ContextPtr:IsHidden()) then
    if (g_ActivePanel == "Cities") then
      OnCitiesButton()
    else
      OnPurchasesButton()
    end
  end
end
Events.SerialEventCityInfoDirty.Add(OnCityViewUpdate)
LuaEvents.CityReligionsDisplay.Add(function() ContextPtr:SetHide(false) end)

local wasHidden
function OnEnterCityScreen()
  wasHidden = ContextPtr:IsHidden()
  ContextPtr:SetHide(true);
end
Events.SerialEventEnterCityScreen.Add(OnEnterCityScreen)

function OnExitCityScreen()
  ContextPtr:SetHide(wasHidden)
end
Events.SerialEventExitCityScreen.Add(OnExitCityScreen)

function ShowHideHandler(bIsHide, bInitState)
  if (not bInitState and not bIsHide) then
    OnCityViewUpdate()
  end
end
ContextPtr:SetShowHideHandler(ShowHideHandler)

ContextPtr:SetHide(true)

--------------------
--------------------

function SetActivePlayer(iPlayer, iPrevPlayer)
  if (not bIsRegistered) then
    -- This doesn't want to play nicely at load time!
    local control = ContextPtr:LookUpControl("/InGame/TopPanel/FaithString")
    
    if (control) then
      control:RegisterCallback(Mouse.eRClick, function() ContextPtr:SetHide(false) end)
      bIsRegistered = true
      Events.GameplaySetActivePlayer.Remove(SetActivePlayer)
    else
      print("/InGame/TopPanel/FaithString is nil!")
    end
  end
end
Events.GameplaySetActivePlayer.Add(SetActivePlayer)

--------------------
--------------------

function OnDiploCornerPopup()
  ContextPtr:SetHide(false)
end

function OnAdditionalInformationDropdownGatherEntries(additionalEntries)
  table.insert(additionalEntries, {text=Locale.ConvertTextKey("TXT_KEY_CR_DIPLO_CORNER_HOOK"), call=OnDiploCornerPopup, art="EUI_DC45_CityReligion.dds"})
end
LuaEvents.AdditionalInformationDropdownGatherEntries.Add(OnAdditionalInformationDropdownGatherEntries)
LuaEvents.RequestRefreshAdditionalInformationDropdownEntries()
