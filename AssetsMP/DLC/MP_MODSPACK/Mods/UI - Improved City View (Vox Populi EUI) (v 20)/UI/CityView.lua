print("Loading CityView.lua from 'UI - Improved City View (Vox Populi with EUI)' version 20.0")
------------------------------------------------------
-- City View
-- coded by bc1 from 1.0.3.276 brave new world code
-- code is common using gk_mode and bnw_mode switches
-- compatible with Gazebo's City-State Diplomacy Mod (CSD) for Brave New World v21
-- compatible with JFD's Piety & Prestige for Brave New World
-- compatible with GameInfo.Yields() iterator broken by Communitas
-- todo: sell building button
------------------------------------------------------
include( "EUI_tooltips" )

include( "InstanceManager" );

-------------------------------
-- minor lua optimizations
-------------------------------
local ipairs = ipairs
local math_abs = math.abs
local math_ceil = math.ceil
local math_floor = math.floor
local math_max = math.max
local math_min = math.min
local pairs = pairs
local tonumber = tonumber
local tostring = tostring
local unpack = unpack

-------------------------------
-- city production list user settings
-- (requires the option to be enabled in Options Menu to take effect!)
--
-- No need this local option anymore, since the option already integrated into Options Menu
-------------------------------
--local g_isSeparateGPReligious = true		-- Separate Great Person and Religious units into its own category
--local g_isSeparateMilitaryDomain = true		-- Separate Military units by its domain
--local g_isSeparateProjectWonders = true		-- Separate Projects and National Wonders into its own category

Events.SequenceGameInitComplete.Add(function()
print("Loading EUI city view",ContextPtr,os.clock(),[[
  ____ _ _       __     ___
 / ___(_) |_ _   \ \   / (_) _____      __
| |   | | __| | | \ \ / /| |/ _ \ \ /\ / /
| |___| | |_| |_| |\ V / | |  __/\ V  V /
 \____|_|\__|\__, | \_/  |_|\___| \_/\_/
             |___/
]])

local civ5_mode = InStrategicView ~= nil
local civBE_mode = not civ5_mode
local gk_mode = civBE_mode or Game.GetReligionName ~= nil
local bnw_mode = civBE_mode or Game.GetActiveLeague ~= nil
local civ5bnw_mode = civ5_mode and bnw_mode
local civ5gk_mode = civ5_mode and gk_mode
local g_currencyIcon = civ5_mode and "[ICON_GOLD]" or "[ICON_ENERGY]"
local g_maintenanceCurrency = civ5_mode and "GoldMaintenance" or "EnergyMaintenance"
local g_yieldCurrency = civ5_mode and YieldTypes.YIELD_GOLD or YieldTypes.YIELD_ENERGY
local g_focusCurrency = CityAIFocusTypes.CITY_AI_FOCUS_TYPE_GOLD or CityAIFocusTypes.CITY_AI_FOCUS_TYPE_ENERGY

--EUI_utilities
local IconHookup = EUI.IconHookup
local CivIconHookup = EUI.CivIconHookup
local RadiusHexArea = EUI.RadiusHexArea
local table = EUI.table
local YieldIcons = EUI.YieldIcons
local GreatPeopleIcon = EUI.GreatPeopleIcon
local StackInstanceManager = StackInstanceManager
local GameInfo = EUI.GameInfoCache -- warning! use iterator ONLY with table field conditions, NOT string SQL query

--EUI_tooltips
local GetHelpTextForUnit = EUI.GetHelpTextForUnit
local GetHelpTextForBuilding = EUI.GetHelpTextForBuilding
local GetHelpTextForProject = EUI.GetHelpTextForProject
local GetHelpTextForProcess = EUI.GetHelpTextForProcess
local GetFoodTooltip = EUI.GetFoodTooltip
local GetGoldTooltip = civ5_mode and EUI.GetGoldTooltip or EUI.GetEnergyTooltip
local GetScienceTooltip = EUI.GetScienceTooltip
local GetProductionTooltip = EUI.GetProductionTooltip
local GetCultureTooltip = EUI.GetCultureTooltip
local GetFaithTooltip = EUI.GetFaithTooltip
local GetTourismTooltip = EUI.GetTourismTooltip
--CBP
local GetCityHappinessTooltip = EUI.GetCityHappinessTooltip
local GetCityUnhappinessTooltip = EUI.GetCityUnhappinessTooltip

local UpdateCityView
--END

include( "SupportFunctions" )
local TruncateString = TruncateString
if not civ5_mode then
	include( "IntrigueHelper" )
end

local AdvisorTypes = AdvisorTypes
local ButtonPopupTypes = ButtonPopupTypes
local CityAIFocusTypes = CityAIFocusTypes
local CityUpdateTypes = CityUpdateTypes
local ContextPtr = ContextPtr
local Controls = Controls
local Events = Events
local Events_ClearHexHighlightStyle = Events.ClearHexHighlightStyle
local Events_RequestYieldDisplay = Events.RequestYieldDisplay
local Events_SerialEventHexHighlight = Events.SerialEventHexHighlight
local Game = Game
local GameDefines = GameDefines
local GameInfoTypes = GameInfoTypes
local GameMessageTypes = GameMessageTypes
local GameOptionTypes = GameOptionTypes
local HexToWorld = HexToWorld
local InStrategicView = InStrategicView or function() return false end
local KeyEvents = KeyEvents
local Keys = Keys
local L = Locale.ConvertTextKey
local Locale = Locale
local Modding = Modding
local Mouse = Mouse
local Network = Network
local NotificationTypes = NotificationTypes
local OptionsManager = OptionsManager
local OrderTypes = OrderTypes
local Players = Players
local Teams = Teams
local TaskTypes = TaskTypes
local ToHexFromGrid = ToHexFromGrid
local UI = UI
local UI_GetHeadSelectedCity = UI.GetHeadSelectedCity
local UI_GetUnitPortraitIcon = UI.GetUnitPortraitIcon
local YieldDisplayTypes_AREA = YieldDisplayTypes.AREA
local YieldTypes = YieldTypes


-------------------------------
-- Globals
-------------------------------

local g_options = Modding.OpenUserData( "Enhanced User Interface Options", 1)
local g_isAdvisor = true

local g_isSeparateCityProductionEUI = g_options.GetValue( "SeparateCityProduction" ) == 1
--print("Separate City Production: "..tostring(g_isSeparateCityProductionEUI))

local g_isSeparateGPReligious = g_options.GetValue( "SeparateGPReligious" ) == 1
--print("Separate Great Person and Religious Units: "..tostring(g_isSeparateGPReligious))

local g_isSeparateMilitaryDomain = g_options.GetValue( "SeparateMilitaryDomain" ) == 1
--print("Separate Military Units by Domain: "..tostring(g_isSeparateMilitaryDomain))

local g_isSeparateProjectWonders = g_options.GetValue( "SeparateProjectWonders" ) == 1
--print("Separate Projects and Wonders: "..tostring(g_isSeparateProjectWonders))

local g_activePlayerID = Game.GetActivePlayer()
local g_activePlayer = Players[ g_activePlayerID ]
local g_finishedItems = {}

local g_workerHeadingOpen = OptionsManager.IsNoCitizenWarning()

local g_rightTipControls = {}
local g_leftTipControls = {}
TTManager:GetTypeControlTable( "EUI_CityViewRightTooltip", g_rightTipControls )
TTManager:GetTypeControlTable( "EUI_CityViewLeftTooltip", g_leftTipControls )

local g_worldPositionOffset = { x = 0, y = 0, z = 30 }
local g_worldPositionOffset2 = { x = 0, y = 35, z = 0 }
local g_portraitSize = Controls.PQportrait:GetSizeX()
local g_screenHeight = select(2, UIManager:GetScreenSizeVal() )
local g_leftStackHeigth = g_screenHeight - 40 - Controls.CityInfoBG:GetOffsetY() - Controls.CityInfoBG:GetSizeY()

local g_PlotButtonIM	= StackInstanceManager( "PlotButtonInstance", "PlotButtonAnchor", Controls.PlotButtonContainer )
local g_BuyPlotButtonIM	= StackInstanceManager( "BuyPlotButtonInstance", "BuyPlotButtonAnchor", Controls.PlotButtonContainer )
-- Maggi: Instance managers for specialists/icons and below SpecialistsboxStack (g_SpecialistsIM)
local g_SpecialistSlotIM   = InstanceManager:new( "SpecialistSlotInstance", "SpecialistSlotButton", Controls.SpecialistsBox );
local g_SpecialistIconIM   = InstanceManager:new( "SpecialistIconInstance", "SpecialistIconButton", Controls.SpecialistsBox );
local g_SpecialistsIM
-- Infixo - IMs for Great Works
local g_GreatWorksSlotIM   = InstanceManager:new( "Work", "Button", Controls.GreatWorksBox );
local g_GreatWorksIM
local g_ProdQueueIM, g_SpecialBuildingsIM, g_GreatWorkIM, g_WondersIM, g_BuildingsIM, g_CorpsIM, g_GreatPeopleIM, g_SlackerIM, g_FocusSelectIM
local g_UnitSelectIM, g_GPUnitSelectIM, g_ReligiousUnitSelectIM, g_MilitaryUnitSelectIM, g_LandUnitSelectIM, g_SeaUnitSelectIM, g_AirUnitSelectIM, g_BuildingSelectIM, g_ProjectSelectIM, g_NationalWonderSelectIM, g_WonderSelectIM, g_ProcessSelectIM
local g_slots = table()
local g_works = table()
local g_heap = Controls.Scrap

local g_citySpecialists = {}
--local g_lockedcitySpecialists = {} -- VP/Lock Specialists

local g_queuedItemNumber = false
local g_isViewingMode = true
local g_isDebugMode = false
local g_BuyPlotMode = not ( g_options and g_options.GetValue and g_options.GetValue( "CityPlotPurchase" ) == 0 )
local g_previousCity, g_isCityViewDirty, g_isCityHexesDirty

local g_isButtonPopupChooseProduction = false
local g_isAutoClose
local g_requestTopPanelUpdate
local g_slotTexture = {
	SPECIALIST_CITIZEN = "CitizenUnemployed.dds",
	SPECIALIST_SCIENTIST = "CitizenScientist.dds",
	SPECIALIST_MERCHANT = "CitizenMerchant.dds",
	SPECIALIST_ARTIST = "CitizenArtist.dds",
	SPECIALIST_MUSICIAN = "citizenmusician.dds",
	SPECIALIST_WRITER = "citizenwriter.dds",
	SPECIALIST_ENGINEER = "CitizenEngineer.dds",
	SPECIALIST_CIVIL_SERVANT = "CitizenCivilServant.dds",	-- Compatibility with Gazebo's City-State Diplomacy Mod (CSD) for Brave New World
	SPECIALIST_JFD_MONK = "CitizenMonk.dds", -- Compatibility with JFD's Piety & Prestige for Brave New World
	SPECIALIST_PMMM_ENTERTAINER = "PMMMEntertainmentSpecialist.dds", --Compatibility with Vicevirtuoso's Madoka Magica: Wish for the World for Brave New World
}
for specialist in GameInfo.Specialists() do
	if specialist.SlotTexture then
		g_slotTexture[ specialist.Type ] = specialist.SlotTexture
	end
end

-- VP/LockSpecialists: icons for locked specs
local g_lockedslotTexture = {
	SPECIALIST_CITIZEN = "locked_citizen.dds",
	SPECIALIST_SCIENTIST = "locked_scientist.dds",
	SPECIALIST_MERCHANT = "locked_merchant.dds",
	SPECIALIST_ARTIST = "locked_artist.dds",
	SPECIALIST_MUSICIAN = "locked_musician.dds",
	SPECIALIST_WRITER = "locked_writer.dds",
	SPECIALIST_ENGINEER = "locked_engineer.dds",
	SPECIALIST_CIVIL_SERVANT = "locked_servant.dds",
	SPECIALIST_JFD_MONK = "CitizenMonk.dds",  -- VP/Lock Specialists: need to add this for Religion Overhaul sometime
}
for specialist in GameInfo.Specialists() do
	if specialist.LockedSlotTexture then
		g_lockedslotTexture[ specialist.Type ] = specialist.LockedSlotTexture
	end
end
local g_slackerTexture = civBE_mode and "UnemployedIndicator.dds" or g_slotTexture[ (GameInfo.Specialists[GameDefines.DEFAULT_SPECIALIST or -1] or {}).Type ] or "Blank.dds"

--local g_colorWhite = {x=1, y=1, z=1, w=1}
--local g_colorGreen = {x=0, y=1, z=0, w=1}
--local g_colorYellow = {x=1, y=1, z=0, w=1}
--local g_colorRed = {x=1, y=0, z=0, w=1}
local g_colorCulture = EUI.Color( 1, 0, 1, 1 )

local g_gameInfo = {
[OrderTypes.ORDER_TRAIN] = GameInfo.Units,
[OrderTypes.ORDER_CONSTRUCT] = GameInfo.Buildings,
[OrderTypes.ORDER_CREATE] = GameInfo.Projects,
[OrderTypes.ORDER_MAINTAIN] = GameInfo.Processes,
}
local g_avisorRecommended = {
[OrderTypes.ORDER_TRAIN] = Game.IsUnitRecommended,
[OrderTypes.ORDER_CONSTRUCT] = Game.IsBuildingRecommended,
[OrderTypes.ORDER_CREATE] = Game.IsProjectRecommended,
}
local g_advisors = {
[AdvisorTypes.ADVISOR_ECONOMIC] = "EconomicRecommendation",
[AdvisorTypes.ADVISOR_MILITARY] = "MilitaryRecommendation",
[AdvisorTypes.ADVISOR_SCIENCE] = "ScienceRecommendation",
[AdvisorTypes.ADVISOR_FOREIGN] = "ForeignRecommendation",
}

local function SetupCallbacks( controls, toolTips, tootTipType, callBacks )
	local control
	-- Setup Tootips
	for name, callback in pairs( toolTips ) do
		control = controls[name]
		if control then
			control:SetToolTipCallback( callback )
			control:SetToolTipType( tootTipType )
		end
	end
	-- Setup Callbacks
	for name, eventCallbacks in pairs( callBacks ) do
		control = controls[name]
		if control then
			for event, callback in pairs( eventCallbacks ) do
				control:RegisterCallback( event, callback )
			end
		end
	end
end

local function ResizeProdQueue()
	local selectionPanelHeight = 0
	local queuePanelHeight = math_min( 190, Controls.QueueStack:IsHidden() and 0 or Controls.QueueStack:GetSizeY() )	-- 190 = 5 x 38=instance height
	if not Controls.SelectionScrollPanel:IsHidden() then
		Controls.SelectionStacks:CalculateSize()
		selectionPanelHeight = math_max( math_min( g_leftStackHeigth - queuePanelHeight, Controls.SelectionStacks:GetSizeY() ), 64 )
--		Controls.SelectionBackground:SetSizeY( selectionPanelHeight + 85 )
		Controls.SelectionScrollPanel:SetSizeY( selectionPanelHeight )
		Controls.SelectionScrollPanel:CalculateInternalSize()
		Controls.SelectionScrollPanel:ReprocessAnchoring()
	end
	Controls.QueueSlider:SetSizeY( queuePanelHeight + 38 )				-- 38 = Controls.PQbox:GetSizeY()
	Controls.QueueScrollPanel:SetSizeY( queuePanelHeight )
	Controls.QueueScrollPanel:CalculateInternalSize()
	Controls.QueueBackground:SetSizeY( queuePanelHeight + selectionPanelHeight + 152 )	-- 125 = 38=Controls.PQbox:GetSizeY() + 87 + 27
	return Controls.QueueBackground:ReprocessAnchoring()
end

local function ResizeRightStack()
	Controls.BoxOSlackers:SetHide( Controls.SlackerStack:IsHidden() )
	Controls.BoxOSlackers:SetSizeY( Controls.SlackerStack:GetSizeY() )
	Controls.WorkerManagementBox:CalculateSize()
	Controls.WorkerManagementBox:ReprocessAnchoring()
	Controls.GPStack:CalculateSize() -- Infixo
	Controls.GPStack:ReprocessAnchoring() -- Infixo
	Controls.SpecialistsStack:CalculateSize() -- Infixo
	Controls.SpecialistsStack:ReprocessAnchoring() -- Infixo
	Controls.GreatWorksStack:CalculateSize() -- Infixo
	Controls.GreatWorksStack:ReprocessAnchoring() -- Infixo
	Controls.RightStack:CalculateSize()
	local rightStackHeight = Controls.RightStack:GetSizeY() + 85
	Controls.BuildingListBackground:SetSizeY( math_max( math_min( g_screenHeight + 48, rightStackHeight ), 160 ) )
	Controls.RightScrollPanel:SetSizeY( math_min( g_screenHeight - 38, rightStackHeight ) )
	Controls.RightScrollPanel:CalculateInternalSize()
	return Controls.RightScrollPanel:ReprocessAnchoring()
end

local function GetSelectedCity()
	return ( not Game.IsNetworkMultiPlayer() or g_activePlayer:IsTurnActive() ) and UI_GetHeadSelectedCity()
end

local function GetSelectedModifiableCity()
	return not g_isViewingMode and GetSelectedCity()
end

local cityIsCanPurchase
if gk_mode then
	function cityIsCanPurchase( city, ... )
		return city:IsCanPurchase( ... )
	end
else
	function cityIsCanPurchase( city, bTestPurchaseCost, bTestTrainable, unitID, buildingID, projectID, yieldID )
		if yieldID == g_yieldCurrency then
			return city:IsCanPurchase( not bTestPurchaseCost, unitID, buildingID, projectID )
							-- bOnlyTestVisible
		else
			return false
		end
	end
end

local function StringFormatNeatFloat(x)
	if math.floor(math.abs(x)) == math.abs(x) then return string.format("%d", x); end
	return string.format("%.1f", x);
end

-------------------------------------------------
-- See if the mod for faith purchase buildings in
-- puppets is activated, then cache the result.
-------------------------------------------------
local g_isFaithPurchaseBuildingsInPuppetsMod = Game.IsCustomModOption("GLOBAL_PURCHASE_FAITH_BUILDINGS_IN_PUPPETS")

-------------------------------------------------
-- Clear out the UI so that when a player changes
-- the next update doesn't show the previous player's
-- values for a frame
-------------------------------------------------
local function ClearCityUIInfo()
	g_ProdQueueIM.ResetInstances()
	g_ProdQueueIM.Commit()
	Controls.PQremove:SetHide( true )
	Controls.PQrank:SetText()
	Controls.PQname:SetText()
	Controls.PQturns:SetText()
	Controls.PQGoldButton:SetHide( true )
	return Controls.ProductionPortraitButton:SetHide(true)
end

--------------------
-- Selling Buildings
--------------------
local function SellBuilding( buildingID )

	local city = GetSelectedModifiableCity()

	-- Can this building be sold?
	if city and city:IsBuildingSellable( buildingID ) then
		-- Build info string
		local building = GameInfo.Buildings[ buildingID ]

		Controls.SellBuildingPopupText:SetText( L(building.Description) .. ": "
			.. L( "TXT_KEY_SELL_BUILDING_INFO", city:GetSellBuildingRefund(buildingID), building[g_maintenanceCurrency] or 0 ) )
--todo energy


		Controls.YesButton:SetVoids( city:GetID(), buildingID )

		return Controls.SellBuildingConfirm:SetHide( false )
	end
end

local function CancelBuildingSale()
	Controls.SellBuildingConfirm:SetHide(true)
	return Controls.YesButton:SetVoids( -1, -1 )
end

local function ExitCityButNotScreen()
	-- clear any rogue leftover tooltip
	g_leftTipControls.Box:SetHide( true )
	g_rightTipControls.Box:SetHide( true )
	g_isButtonPopupChooseProduction = false
	Controls.RightScrollPanel:SetScrollValue(0)
	return CancelBuildingSale()
end

local function GotoNextCity()
	ExitCityButNotScreen()
	return Game.DoControl( GameInfoTypes.CONTROL_NEXTCITY )
end

local function GotoPrevCity()
	ExitCityButNotScreen()
	return Game.DoControl( GameInfoTypes.CONTROL_PREVCITY )
end

local function ExitCityScreen()
	ExitCityButNotScreen()
	return Events.SerialEventExitCityScreen()
end

----------------------------------------------------------------
-- Input handling
----------------------------------------------------------------
ContextPtr:SetInputHandler(
function( uiMsg, wParam )--, lParam )
	if uiMsg == KeyEvents.KeyDown then
		if wParam == Keys.VK_ESCAPE or wParam == Keys.VK_RETURN then
			if Controls.SellBuildingConfirm:IsHidden() then
				ExitCityScreen()
			else
				CancelBuildingSale()
			end
			return true
		elseif wParam == Keys.VK_LEFT then
			GotoPrevCity()
			return true
		elseif wParam == Keys.VK_RIGHT then
			GotoNextCity()
			return true
		end
	end
	return false
end)

-------------------------------
-- Pedia
-------------------------------
local function UnitClassPedia( unitClassID )
	return Events.SearchForPediaEntry( GameInfo.UnitClasses[ unitClassID ].Description )
end

local function BuildingPedia( buildingID )
	return Events.SearchForPediaEntry( GameInfo.Buildings[ buildingID ].Description )
end

local function SpecialistPedia( buildingID )
	local building = buildingID and GameInfo.Buildings[ buildingID ]
	local specialistType = building and building.SpecialistType
	local specialistID = specialistType and GameInfoTypes[specialistType] or GameDefines.DEFAULT_SPECIALIST
	local specialist = specialistID and GameInfo.Specialists[ specialistID ]
	return Events.SearchForPediaEntry( specialist and tostring(specialist.Description) )
end

local function SelectionPedia( orderID, itemID )
	local item = g_gameInfo[ orderID ]
	item = item and item[ itemID ]
	if item then
		return Events.SearchForPediaEntry( item.Description )
	end
end

local function ProductionPedia( queuedItemNumber )
	local city = UI_GetHeadSelectedCity()
	if city and queuedItemNumber then
		return SelectionPedia( city:GetOrderFromQueue( queuedItemNumber ) )
	end
end

-------------------------------
-- Tooltips
-------------------------------

local function GetSpecialistYields( city, specialist )
	local yieldTips = table()
	if city and specialist then
		local specialistID = specialist.ID
		local cityOwner = Players[ city:GetOwner() ]
		-- Culture
		local specialistYield = 0
		local cultureFromSpecialist = city:GetCultureFromSpecialist( specialistID )
		local specialistYieldModifier = 0
		local specialistCultureModifier = city:GetCultureRateModifier() + ( cityOwner and ( cityOwner:GetCultureCityModifier() + (( city:GetNumWorldWonders() > 0 and cityOwner:GetCultureWonderMultiplier() or 0 ) or 0) ) )
		-- Yield
		for yieldID = 0, YieldTypes.NUM_YIELD_TYPES-1 do
			specialistYield = city:GetSpecialistYield( specialistID, yieldID )
			-- COMMUNITY PATCH BEGINS
			local extraYield = city:GetSpecialistYieldChange( specialistID, yieldID)
			specialistYield = (specialistYield + extraYield)
			-- COMMUNITY PATCH ENDS
			specialistYieldModifier = city:GetBaseYieldRateModifier( yieldID )
			if yieldID == YieldTypes.YIELD_CULTURE then
				specialistYield = specialistYield + cultureFromSpecialist
				specialistYieldModifier = specialistYieldModifier + specialistCultureModifier
				cultureFromSpecialist = 0
			end
			-- Vox Populi Comparable Yields
			specialistYieldModifier = 100
			yieldTips:insertIf( specialistYield ~= 0 and specialistYield * specialistYieldModifier / 100 .. tostring(YieldIcons[yieldID]) )
			--yieldTips:insertIf( specialistYield ~= 0 and specialistYield .. tostring(YieldIcons[yieldID]) )
		end
		yieldTips:insertIf( cultureFromSpecialist ~= 0 and cultureFromSpecialist .. "[ICON_CULTURE]" )
		yieldTips:insertIf( civ5_mode and (specialist.GreatPeopleRateChange or 0) ~= 0 and specialist.GreatPeopleRateChange .. GreatPeopleIcon( specialist.Type ) )
		-- Vox Populi food info
		local foodPerSpec = city:FoodConsumptionSpecialistTimes100() / 100;
		if specialist.Type == "SPECIALIST_CITIZEN" then foodPerSpec = GameDefines.FOOD_CONSUMPTION_PER_POPULATION end
		yieldTips:insertIf( foodPerSpec ~= 0 and StringFormatNeatFloat(-foodPerSpec) .. "[ICON_FOOD]" );
		-- Vox Populi end
	end
	return yieldTips:concat(" ")
end

local function SpecialistTooltip( control )
	local buildingID = control:GetVoid1()
	local building = buildingID and GameInfo.Buildings[ buildingID ]
	local specialistType = building and building.SpecialistType
	local specialistID = specialistType and GameInfoTypes[specialistType] or GameDefines.DEFAULT_SPECIALIST
	local specialist = GameInfo.Specialists[ specialistID ]
	local strToolTip = L(specialist.Description) .. " " .. GetSpecialistYields( UI_GetHeadSelectedCity(), specialist )
	local slotTable = building and g_citySpecialists[buildingID]
	if slotTable and not slotTable[control:GetVoid2()] then
		strToolTip = L"TXT_KEY_CITYVIEW_EMPTY_SLOT".."[NEWLINE]("..strToolTip..")"
	end
	g_rightTipControls.Text:SetText( strToolTip )
	-- Infixo Portrait is used to show bigger tooltip icon
	IconHookup( specialist.PortraitIndex, g_rightTipControls.Portrait:GetSizeY(), specialist.IconAtlas, g_rightTipControls.Portrait )
	g_rightTipControls.Box:SetHide( false )
	return g_rightTipControls.Box:DoAutoSize()
end

local function BuildingToolTip( control )
	local buildingID = control:GetVoid1()
	local building = GameInfo.Buildings[ buildingID ]
	local city = UI_GetHeadSelectedCity()
	if city and building then

		g_rightTipControls.Text:SetText( GetHelpTextForBuilding( buildingID, false, false, city:GetNumFreeBuilding(buildingID) > 0, city ) )
		-- Infixo Portrait is used to show bigger tooltip icon
		IconHookup( building.PortraitIndex, g_rightTipControls.Portrait:GetSizeY(), building.IconAtlas, g_rightTipControls.Portrait )
		g_rightTipControls.Box:SetHide( false )
		return g_rightTipControls.Box:DoAutoSize()
	end
end

local function OrderItemTooltip( city, isDisabled, purchaseYieldID, orderID, itemID, _, isRepeat )
	local itemInfo, strToolTip, strDisabledInfo, portraitOffset, portraitAtlas, isRealRepeat
	local IsBasic = not OptionsManager.IsNoBasicHelp() -- condensedhelp

	if city then
		local cityOwnerID = city:GetOwner()
		if orderID == OrderTypes.ORDER_TRAIN then
			itemInfo = GameInfo.Units
			portraitOffset, portraitAtlas = UI_GetUnitPortraitIcon( itemID, cityOwnerID )
			strToolTip = GetHelpTextForUnit( itemID, true )
			isRealRepeat = isRepeat

			if isDisabled then
				if purchaseYieldID == g_yieldCurrency then
					strDisabledInfo = city:GetPurchaseUnitTooltip(itemID)
				elseif purchaseYieldID == YieldTypes.YIELD_FAITH then
					strDisabledInfo = city:GetFaithPurchaseUnitTooltip(itemID)
				else
					strDisabledInfo = city:CanTrainTooltip(itemID)
				end
			end

		elseif orderID == OrderTypes.ORDER_CONSTRUCT then
			itemInfo = GameInfo.Buildings
			strToolTip = GetHelpTextForBuilding( itemID, false, false, city:GetNumFreeBuilding(itemID) > 0, city )
			if isDisabled then
				if purchaseYieldID == g_yieldCurrency then
--					cash = cityOwner:GetGold() - city:GetBuildingPurchaseCost(itemID)
--					icon = g_currencyIcon
					strDisabledInfo = city:GetPurchaseBuildingTooltip(itemID)
				elseif purchaseYieldID == YieldTypes.YIELD_FAITH then
--					cash = cityOwner:GetFaith() - city:GetBuildingFaithPurchaseCost(itemID)
--					icon = "[ICON_PEACE]"
					strDisabledInfo = city:GetFaithPurchaseBuildingTooltip(itemID)
				else
					strDisabledInfo = city:CanConstructTooltip(itemID)
				end
			end

		elseif orderID == OrderTypes.ORDER_CREATE then
			itemInfo = GameInfo.Projects
			strToolTip = GetHelpTextForProject( itemID, city, true )
		elseif orderID == OrderTypes.ORDER_MAINTAIN then
			itemInfo = GameInfo.Processes
			strToolTip = GetHelpTextForProcess( itemID, true )
			isRealRepeat = true
		else
			strToolTip = L"TXT_KEY_PRODUCTION_NO_PRODUCTION"
		end
		if strToolTip then
			if isRealRepeat then
				strToolTip = "[ICON_TURNS_REMAINING]" .. strToolTip
			end
			if strDisabledInfo and #strDisabledInfo > 0 then
				strDisabledInfo = (strDisabledInfo:gsub("^%[NEWLINE%]","")):gsub("^%[NEWLINE%]","")
--				if cash and cash < 0 then
--					strDisabledInfo = ("%s (%+i%s)"):format( strDisabledInfo, cash, icon )
--				end
				strToolTip = "[COLOR_WARNING_TEXT]" .. strDisabledInfo .. "[ENDCOLOR][NEWLINE][NEWLINE]"..strToolTip
			elseif purchaseYieldID then -- condensedhelp
				if not isDisabled and orderID == OrderTypes.ORDER_CONSTRUCT and purchaseYieldID == g_yieldCurrency and IsBasic then
					strToolTip = "[COLOR_YELLOW]"..L"TXT_KEY_CITYVIEW_PURCHASE_TT_BUILDING".."[ENDCOLOR][NEWLINE][NEWLINE]"..strToolTip
				elseif not isDisabled and orderID == OrderTypes.ORDER_TRAIN and purchaseYieldID == g_yieldCurrency and IsBasic then
					strToolTip = "[COLOR_YELLOW]"..L"TXT_KEY_CITYVIEW_PURCHASE_TT_UNIT".."[ENDCOLOR][NEWLINE][NEWLINE]"..strToolTip
				elseif not isDisabled and purchaseYieldID == YieldTypes.YIELD_FAITH and IsBasic then
					strToolTip = "[COLOR_YELLOW]"..L"TXT_KEY_CITYVIEW_PURCHASE_TT_FAITH".."[ENDCOLOR][NEWLINE][NEWLINE]"..strToolTip
				end
			elseif isDisabled and IsBasic then
				strToolTip = "[COLOR_YIELD_FOOD]"..L"TXT_KEY_CITYVIEW_QUEUE_PROD_TT".."[ENDCOLOR][NEWLINE][NEWLINE]"..strToolTip
			end -- condensedhelp ends
		end
		local item = itemInfo and itemInfo[itemID]
		item = item and IconHookup( portraitOffset or item.PortraitIndex, g_leftTipControls.Portrait:GetSizeY(), portraitAtlas or item.IconAtlas, g_leftTipControls.Portrait )
		g_leftTipControls.Text:SetText( strToolTip )
		g_leftTipControls.PortraitFrame:SetHide( not item )
		g_leftTipControls.Box:DoAutoSize()
	end
	return g_leftTipControls.Box:SetHide( not strToolTip )
end

local function ProductionToolTip( control )
	local city = UI_GetHeadSelectedCity()
	local queuedItemNumber = control:GetVoid1()
	if city and queuedItemNumber and not Controls.QueueSlider:IsTrackingLeftMouseButton() then
		return OrderItemTooltip( city, false, false, city:GetOrderFromQueue( queuedItemNumber ) )
	end
end

local function SelectionToolTip( control )
	return OrderItemTooltip( UI_GetHeadSelectedCity(), true, false, control:GetVoid1(), control:GetVoid2() )
end

-- Vox Populi gold button
local function PQGoldButtonToolTip( control )
	return OrderItemTooltip( UI_GetHeadSelectedCity(),control:IsDisabled(), g_yieldCurrency, control:GetVoid1(), control:GetVoid2() )
end

-------------------------------
-- Specialist Managemeent
-------------------------------
local function OnSlackersSelected( buildingID, slotID )
	local city = GetSelectedModifiableCity()
	if city then
		for i=1, slotID<=0 and city:GetSpecialistCount( GameDefines.DEFAULT_SPECIALIST ) or 1 do
			Network.SendDoTask( city:GetID(), TaskTypes.TASK_REMOVE_SLACKER, 0, -1, false )
		end
	end
end

--[[ This entire function isn't used in this file, just disable it
local function ToggleSpecialist( buildingID, slotID )
	local city = buildingID and slotID and GetSelectedModifiableCity()
	if city then

-- --VP/LockSpecialist: Disabling this so we can lock specialists without taking full manual control
		-- If Specialists are automated then you can't change things with them
		if civ5_mode and not city:IsNoAutoAssignSpecialists() then
			Game.SelectedCitiesGameNetMessage(GameMessageTypes.GAMEMESSAGE_DO_TASK, TaskTypes.TASK_NO_AUTO_ASSIGN_SPECIALISTS, -1, -1, true)
			Controls.NoAutoSpecialistCheckbox:SetCheck(true)
			if bnw_mode then
				Controls.NoAutoSpecialistCheckbox2:SetCheck(true)
			end
		end
-- --

		local specialistID = GameInfoTypes[(GameInfo.Buildings[ buildingID ] or {}).SpecialistType] or -1
		local specialistTable = g_citySpecialists[buildingID]
		local lockedspecialistTable = g_lockedcitySpecialists[buildingID]
		if specialistTable[slotID] then -- new behavior, removes AI assigned specialists and assigns them to the best plot
			if city:GetNumSpecialistsInBuilding(buildingID) > 0 then
				specialistTable[slotID] = false
				specialistTable.n = specialistTable.n - 1
				return Game.SelectedCitiesGameNetMessage( GameMessageTypes.GAMEMESSAGE_DO_TASK, TaskTypes.TASK_UNSLOT_SPECIALIST, specialistID, buildingID, false )
			end
		elseif lockedspecialistTable[slotID] then -- old REMOVE_SPECIALIST behavior with a new task, remove player assigned specialist, assigns them to the best plot
			if city:GetNumForcedSpecialistsInBuilding(buildingID) > 0 then
				lockedspecialistTable[slotID] = false
				lockedspecialistTable.n = lockedspecialistTable.n - 1
				return Game.SelectedCitiesGameNetMessage( GameMessageTypes.GAMEMESSAGE_DO_TASK, TaskTypes.TASK_UNSLOT_SPECIALIST, specialistID, buildingID, true )
			end
		elseif city:IsCanAddSpecialistToBuilding(buildingID) then -- player added (forced) specialists are always locked
			lockedspecialistTable[slotID] = true
			lockedspecialistTable.n = lockedspecialistTable.n + 1
			return Game.SelectedCitiesGameNetMessage( GameMessageTypes.GAMEMESSAGE_DO_TASK, TaskTypes.TASK_ADD_SPECIALIST, specialistID, buildingID )
		end
	end
end
--]]
-------------------------------
-- Great Work Managemeent
-------------------------------
local function GreatWorkPopup( greatWorkID )
	local greatWork = GameInfo.GreatWorks[ Game.GetGreatWorkType( greatWorkID or -1 ) or -1 ]

	if greatWork and greatWork.GreatWorkClassType ~= "GREAT_WORK_ARTIFACT" then
		return Events.SerialEventGameMessagePopup{
			Type = ButtonPopupTypes.BUTTONPOPUP_GREAT_WORK_COMPLETED_ACTIVE_PLAYER,
			Data1 = greatWorkID,
			Priority = PopupPriority.Current
			}
	end
end

local function YourCulturePopup( greatWorkID )
	return Events.SerialEventGameMessagePopup{
		Type = ButtonPopupTypes.BUTTONPOPUP_CULTURE_OVERVIEW,
		Data1 = 1,
		Data2 = 1,
		}
end

local function ThemingTooltip( buildingClassID, _, control )
	control:SetToolTipString( UI_GetHeadSelectedCity():GetThemingTooltip( buildingClassID ) )
end

local function GreatWorkTooltip( greatWorkID, greatWorkSlotID, slot )
	if greatWorkID >= 0 then
		return slot:SetToolTipString( Game.GetGreatWorkTooltip( greatWorkID, UI_GetHeadSelectedCity():GetOwner() ) )
	else
		return slot:LocalizeAndSetToolTip( tostring(( GameInfo.GreatWorkSlots[ greatWorkSlotID ] or {}).EmptyToolTipText) )
	end
end

-------------------------------------------------
-- City Buildings List
-------------------------------------------------

local function sortBuildings(a,b)
-- Infixo [1] is building, [2] is Localized Description, [3] is great work count, [4] is specialist type id (or 999 if none)
	if a and b then
		--if a[4] ~= b[4] then
		--	return a[4] < b[4]
		--elseif a[3] ~= b[3] then
		--	return a[3] > b[3]
		--end
		-- Infixo just sort by name...
		--if a[3] ~= b[3] then
			--return a[3] > b[3]
		--end
		return a[2] < b[2]
	end
end

local function SetupBuildingList( city, buildings, buildingIM )
	buildingIM.ResetInstances()
	buildings:sort( sortBuildings )
	local cityOwnerID = city:GetOwner()
	local cityOwner = Players[ cityOwnerID ]
	local isNotResistance = not city:IsResistance()
	-- Get the active perk types for civ BE
	local cityOwnerPerks = civBE_mode and cityOwner:GetAllActivePlayerPerkTypes()
	for i = 1, #buildings do

		local building, buildingName, greatWorkCount = unpack(buildings[i])
		local buildingNameSuffix = "" -- will show specialists and great work count
		local buildingID = building.ID
		local controls, isNewInstance = buildingIM.GetInstance()
		local buildingButton = controls.Button
		local sellButton = controls.SellButton
		--local textButton = controls.TextButton
		--textButton:SetHide( true )
		if isNewInstance then
			buildingButton:RegisterCallback( Mouse.eRClick, BuildingPedia )
			buildingButton:SetToolTipCallback( BuildingToolTip )
			sellButton:RegisterCallback( Mouse.eLClick, SellBuilding )
			--textButton:RegisterCallback( Mouse.eLClick, YourCulturePopup )
			--textButton:RegisterCallback( Mouse.eMouseEnter, ThemingTooltip )
		else
			for _, slot in pairs( controls[1] ) do
				g_slots:insert( slot )
				slot:ChangeParent( g_heap )
			end
			for _, slot in pairs( controls[2] ) do
				g_works:insert( slot )
				slot:ChangeParent( g_heap )
			end
		end
		controls[1] = table()
		controls[2] = table()
		buildingButton:SetVoid1( buildingID )
		-- Can we sell this building?
		if not g_isViewingMode and city:IsBuildingSellable( buildingID ) then
			sellButton:SetText( city:GetSellBuildingRefund( buildingID ) .. g_currencyIcon )
			sellButton:SetHide( false )
			sellButton:SetVoid1( buildingID )
		else
			sellButton:SetHide( true )
		end

		local slotStack = controls.SlotStack
		local instance = {}

--!!!BE portrait size is bigger
		-- Infixo icon is not shown but needed for tooltip icon
		IconHookup( building.PortraitIndex, 64, building.IconAtlas, controls.Portrait )
		controls.Portrait:SetHide( true )

		-------------------
		-- Great Work Slots
		local greatWorkIcons = {
			["GREAT_WORK_SLOT_ART_ARTIFACT"] = "[ICON_GREAT_ARTIST]",
			["GREAT_WORK_SLOT_LITERATURE"] = "[ICON_GREAT_WRITER]",
			["GREAT_WORK_SLOT_MUSIC"] = "[ICON_GREAT_MUSICIAN]",
		}
		if greatWorkCount > 0 then
			local buildingGreatWorkSlotType = building.GreatWorkSlotType
			if buildingGreatWorkSlotType then
				--buildingNameSuffix = buildingNameSuffix.." "..string.rep(greatWorkIcons[buildingGreatWorkSlotType], greatWorkCount) -- Infixo great works
				buildingNameSuffix = buildingNameSuffix.." "..string.rep("[ICON_GREAT_WORK]", greatWorkCount) -- Infixo great works
				--local buildingGreatWorkSlot = GameInfo.GreatWorkSlots[ buildingGreatWorkSlotType ]
				local buildingClassID = GameInfoTypes[ building.BuildingClass ]

				if city:IsThemingBonusPossible( buildingClassID ) then
					if city:GetThemingBonus( buildingClassID ) > 0 then buildingNameSuffix = buildingNameSuffix.."[ICON_CHECKBOX]" end -- Infixo theming bonus active flag
					--textButton:SetText( " +" .. city:GetThemingBonus( buildingClassID ) )
					--textButton:SetVoid1( buildingClassID )
					--textButton:SetHide( false )
				end

				--[[ Infixo Great Works
				for i = 0, greatWorkCount - 1 do
					local slot = g_works:remove()
					if slot then
						slot:ChangeParent( slotStack )
					else
						ContextPtr:BuildInstanceForControl( "Work", instance, slotStack )
						slot = instance.Button
						slot:RegisterCallback( Mouse.eLClick, YourCulturePopup )
						slot:RegisterCallback( Mouse.eMouseEnter, GreatWorkTooltip )
					end
					controls[2]:insert( slot )
					local greatWorkID = city:GetBuildingGreatWork( buildingClassID, i )
					slot:SetVoids( greatWorkID, buildingGreatWorkSlot.ID )
					if greatWorkID >= 0 then
						slot:SetTexture( buildingGreatWorkSlot.FilledIcon )
						slot:RegisterCallback( Mouse.eRClick, GreatWorkPopup )
					else
						slot:SetTexture( buildingGreatWorkSlot.EmptyIcon )
						slot:ClearCallback( Mouse.eRClick )
					end
				end
				--]]
			end
		end

		-------------------
		-- Specialist Slots
		local numSpecialistsInBuilding = city:GetNumSpecialistsInBuilding( buildingID )
		local specialistTable = g_citySpecialists[buildingID] or {}
		if specialistTable.n ~= numSpecialistsInBuilding then
			specialistTable = { n = numSpecialistsInBuilding }
			for i = 1, numSpecialistsInBuilding do
				specialistTable[i] = true
			end
			g_citySpecialists[buildingID] = specialistTable
		end
		local specialistType = building.SpecialistType
		local specialist = GameInfo.Specialists[specialistType]
		-- Infixo add icons to building name
		if numSpecialistsInBuilding > 0 then buildingNameSuffix = buildingNameSuffix.." "..string.rep(GreatPeopleIcon(specialistType), numSpecialistsInBuilding) end
		--[[ Maggi: Specialists
		if specialist then
			for slotID = 1, city:GetNumSpecialistsAllowedByBuilding( buildingID ) do
				local slot = g_slots:remove()
				if slot then
					slot:ChangeParent( slotStack )
				else
					ContextPtr:BuildInstanceForControl( "Slot", instance, slotStack )
					slot = instance.Button
					slot:RegisterCallback( Mouse.eRClick, SpecialistPedia )
					slot:SetToolTipCallback( SpecialistTooltip )
				end
				controls[1]:insert( slot )
				if civ5_mode then
					if lockedspecialistTable[slotID] then
						slot:SetTexture( lockedspecialistTable[ slotID ] and g_lockedslotTexture[ specialistType ] or "CitizenEmpty.dds" )
					elseif specialistTable[slotID] then
						slot:SetTexture( specialistTable[ slotID ] and g_slotTexture[ specialistType ] or "CitizenEmpty.dds" )
					else
						slot:SetTexture("CitizenEmpty.dds")
					end
				else
					IconHookup( specialist.PortraitIndex, 45, specialist.IconAtlas, instance.Portrait )
					instance.Portrait:SetHide( not specialistTable[ slotID ] )
				end
				slot:SetVoids( buildingID, slotID )
				if g_isViewingMode then
					slot:ClearCallback( Mouse.eLClick )
				else
					slot:RegisterCallback( Mouse.eLClick, ToggleSpecialist )
				end
			end -- Specialist Slots
		end
		--]]
		-- Building stats/bonuses
		local buildingClassID = GameInfoTypes[ building.BuildingClass ] or -1
		local maintenanceCost = tonumber(building[g_maintenanceCurrency]) or 0
		local defenseChange = tonumber(building.Defense) or 0
		local hitPointChange = tonumber(building.ExtraCityHitPoints) or 0
		--CBP
		--local buildingCultureRate = (not gk_mode and tonumber(building.Culture) or 0) + (specialist and city:GetCultureFromSpecialist( specialist.ID ) or 0) * numSpecialistsInBuilding
		--local buildingCultureRate = (not gk_mode and tonumber(building.Culture) or 0) + (specialist and (city:GetSpecialistYield( specialist.ID, YieldTypes.YIELD_CULTURE ) + city:GetCultureFromSpecialist( specialist.ID ) + city:GetSpecialistYieldChange( specialist.ID, YieldTypes.YIELD_CULTURE)) or 0) * numSpecialistsInBuilding
		local buildingCultureRate = (not gk_mode and tonumber(building.Culture) or 0) -- Infixo don't duplicate specialists
		--END
		local buildingCultureModifier = tonumber(building.CultureRateModifier) or 0
		local cityCultureRateModifier = cityOwner:GetCultureCityModifier() + city:GetCultureRateModifier() + (city:GetNumWorldWonders() > 0 and cityOwner and cityOwner:GetCultureWonderMultiplier() or 0)
		local cityCultureRate
		local population = city:GetPopulation()
		local populationEmpire = cityOwner:GetTotalPopulation()
		local tips = table()
		local thisBuildingAndYieldTypes = { BuildingType = building.Type }
		if civ5_mode then
			cityCultureRate = city:GetBaseJONSCulturePerTurn()
			-- Happiness
			local happinessChange = (tonumber(building.Happiness) or 0) + (tonumber(building.UnmoddedHappiness) or 0)
						+ cityOwner:GetExtraBuildingHappinessFromPolicies( buildingID )
						+ (cityOwner:IsHalfSpecialistUnhappiness() and GameDefines.UNHAPPINESS_PER_POPULATION * numSpecialistsInBuilding * ((city:IsCapital() and cityOwner:GetCapitalUnhappinessMod() or 0)+100) * (cityOwner:GetUnhappinessMod() + 100) * (cityOwner:GetTraitPopUnhappinessMod() + 100) / 2e6 or 0) -- missing getHandicapInfo().getPopulationUnhappinessMod()
			-- Vox Populi fix for 3939
			if gk_mode then
				happinessChange = happinessChange + cityOwner:GetPlayerBuildingClassHappiness( buildingClassID )
			end
			--[[if city and civ5gk_mode and buildingClassID then
				happinessChange = happinessChange + city:GetReligionBuildingClassHappiness(buildingClassID)
			end]]
			-- Vox Populi end
			tips:insertIf( happinessChange ~=0 and happinessChange .. "[ICON_HAPPINESS_1]" )

		else -- civBE_mode
			cityCultureRate = city:GetBaseCulturePerTurn()
			-- Health
			local healthChange = (tonumber(building.Health) or 0) + (tonumber(building.UnmoddedHealth) or 0) + cityOwner:GetExtraBuildingHealthFromPolicies( buildingID )
			local healthModifier = tonumber(building.HealthModifier) or 0
			-- Effect of player perks
			for i, perkID in ipairs(cityOwnerPerks) do
				healthChange = healthChange + Game.GetPlayerPerkBuildingClassPercentHealthChange( perkID, buildingClassID )
				healthModifier = healthModifier + Game.GetPlayerPerkBuildingClassPercentHealthChange( perkID, buildingClassID )
				defenseChange = defenseChange + Game.GetPlayerPerkBuildingClassCityStrengthChange( perkID, buildingClassID )
				hitPointChange = hitPointChange + Game.GetPlayerPerkBuildingClassCityHPChange( perkID, buildingClassID )
				maintenanceCost = maintenanceCost + Game.GetPlayerPerkBuildingClassEnergyMaintenanceChange( perkID, buildingClassID )
			end
			tips:insertIf( healthChange ~=0 and healthChange .. "[ICON_HEALTH_1]" )
--			tips:insertLocalizedIfNonZero( "TXT_KEY_STAT_POSITIVE_YIELD_MOD", "[ICON_HEALTH_1]", healthModifier )
		end
		local buildingYieldRate, buildingYieldPerPop, buildingYieldPerPopInEmpire, buildingTechEnhancedYield, buildingYieldModifier, cityYieldRate, cityYieldRateModifier, isProducing
		for yieldID = 0, YieldTypes.NUM_YIELD_TYPES-1 do
			isProducing = isNotResistance
			thisBuildingAndYieldTypes.YieldType = (GameInfo.Yields[yieldID] or {}).Type or -1
			-- Yield changes from the building
			buildingYieldRate = Game.GetBuildingYieldChange( buildingID, yieldID )
						+ (gk_mode and cityOwner:GetPlayerBuildingClassYieldChange( buildingClassID, yieldID )
						+ city:GetReligionBuildingClassYieldChange( buildingClassID, yieldID ) or 0)
						+ (bnw_mode and city:GetLeagueBuildingClassYieldChange( buildingClassID, yieldID ) or 0)
						+ city:GetLocalBuildingClassYield(buildingClassID, yieldID)
						+ city:GetReligionBuildingYieldRateModifier(buildingClassID, yieldID)
						+ city:GetBuildingYieldChangeFromCorporationFranchises(buildingClassID, yieldID)
						+ city:GetEventBuildingClassYield(buildingClassID, yieldID)
						+ cityOwner:GetPolicyBuildingClassYieldChange(buildingClassID, yieldID)

			if GameInfo.Yields[yieldID].Type == "YIELD_CULTURE" then
				buildingCultureRate = buildingCultureRate + city:GetBuildingClassCultureChange(buildingClassID )
			end
			-- Yield modifiers from the building
			buildingYieldModifier = Game.GetBuildingYieldModifier( buildingID, yieldID )
						+ cityOwner:GetPolicyBuildingClassYieldModifier( buildingClassID, yieldID )
			-- Effect of player perks
			if civBE_mode then
				for i, perkID in ipairs(cityOwnerPerks) do
					buildingYieldRate = buildingYieldRate + Game.GetPlayerPerkBuildingClassFlatYieldChange( perkID, buildingClassID, yieldID )
					buildingYieldModifier = buildingYieldModifier + Game.GetPlayerPerkBuildingClassPercentYieldChange( perkID, buildingClassID, yieldID )
				end
			end
			-- Vox Populi start
			-- Yield bonuses to World Wonders
			if city:GetNumWorldWonders() > 0 and Game.IsWorldWonderClass(buildingClassID) then
				buildingYieldRate = buildingYieldRate + cityOwner:GetExtraYieldWorldWonder(buildingID, yieldID)
			end
			-- Vox Populi end
			-- Specialists yield
			--[[ Infixo don't duplicate specialists
			if specialist then
				--CBP
				if(yieldID ~= YieldTypes.YIELD_CULTURE) then
					buildingYieldRate = buildingYieldRate + (numSpecialistsInBuilding * (city:GetSpecialistYield( specialist.ID, yieldID ) + city:GetSpecialistYieldChange( specialist.ID, yieldID)))
				end
				--END
			end
			--]]
			cityYieldRateModifier = city:GetBaseYieldRateModifier( yieldID )
			cityYieldRate = city:GetYieldPerPopTimes100( yieldID ) * population / 100 + city:GetBaseYieldRate( yieldID ) + city:GetYieldPerPopInEmpireTimes100( yieldID ) * populationEmpire / 100
			-- Special culture case
			if yieldID == YieldTypes.YIELD_CULTURE then
				buildingYieldRate = buildingYieldRate + buildingCultureRate
				buildingYieldModifier = buildingYieldModifier + buildingCultureModifier
				cityYieldRateModifier = cityYieldRateModifier + cityCultureRateModifier
				cityYieldRate = cityYieldRate + cityCultureRate
				buildingCultureRate = 0
				buildingCultureModifier = 0
			elseif yieldID == YieldTypes.YIELD_FOOD then
				local foodPerPop = GameDefines.FOOD_CONSUMPTION_PER_POPULATION
				local foodConsumed = city:FoodConsumption()
				-- Vox Populi Comparable Yields
				--buildingYieldRate = buildingYieldRate + (foodConsumed < foodPerPop * population and foodPerPop * numSpecialistsInBuilding / 2 or 0)
				--buildingYieldModifier = buildingYieldModifier + (tonumber(building.FoodKept) or 0) -- FoodKept has a different meaning
				--[[ Infixo turned off due to confusion
				if foodConsumed < foodPerPop * population then
					-- this only happens when specialists in the city consume less food that normal population
					local foodPerSpec = city:FoodConsumptionSpecialistTimes100() / 100;
					buildingYieldRate = buildingYieldRate + (foodPerPop - foodPerSpec) * numSpecialistsInBuilding;
				end
				--]]
				-- Vox Populi end
				cityYieldRate = city:FoodDifferenceTimes100() / 100 -- cityYieldRate - foodConsumed
				cityYieldRateModifier = cityYieldRateModifier + city:GetMaxFoodKeptPercent()
				isProducing = true
			end
			-- Population yield
			buildingYieldPerPop = 0
			for row in GameInfo.Building_YieldChangesPerPop( thisBuildingAndYieldTypes ) do
				buildingYieldPerPop = buildingYieldPerPop + (row.Yield or 0)
			end
			buildingYieldRate = buildingYieldRate + buildingYieldPerPop * population / 100
			-- Empire Population yield
			buildingYieldPerPopInEmpire = 0
			for row in GameInfo.Building_YieldChangesPerPopInEmpire( thisBuildingAndYieldTypes ) do
				buildingYieldPerPopInEmpire = buildingYieldPerPopInEmpire + (row.Yield or 0)
			end
			buildingYieldRate = buildingYieldRate + buildingYieldPerPopInEmpire * populationEmpire / 100
			-- Events
			buildingYieldRate = buildingYieldRate + city:GetEventBuildingClassYield(buildingClassID, yieldID);
			-- Tech Enhanced Yield
			buildingTechEnhancedYield = 0
			for row in GameInfo.Building_TechEnhancedYieldChanges( thisBuildingAndYieldTypes ) do
				if (Teams[city:GetTeam()]:IsHasTech(GameInfoTypes[ building.EnhancedYieldTech ])) then
					buildingTechEnhancedYield = buildingTechEnhancedYield + (row.Yield or 0)
				end
			end
			buildingYieldRate = buildingYieldRate + buildingTechEnhancedYield
			-- End
			-- Vox Populi Comparable Yields
			cityYieldRateModifier = 100
			-- Vox Populi calculate impact of that single building on base yields
			--buildingYieldRate = buildingYieldRate * cityYieldRateModifier + ( cityYieldRate - buildingYieldRate ) * buildingYieldModifier
			--local iYieldFromBuildingModifier = city:GetBaseYieldRate(yieldID) * buildingYieldModifier / 100;
			--buildingYieldRate = buildingYieldRate + iYieldFromBuildingModifier
			tips:insertIf( isProducing and buildingYieldRate ~= 0 and StringFormatNeatFloat(buildingYieldRate) .. tostring(YieldIcons[ yieldID ]) )
			-- Vox Populi end
		end

		-- Culture leftovers
		cityCultureRateModifier = 0 -- Vox Populi Comparable Yields
		buildingCultureRate = buildingCultureRate * (100+cityCultureRateModifier) + ( cityCultureRate - buildingCultureRate ) * buildingCultureModifier
		tips:insertIf( isNotResistance and buildingCultureRate ~=0 and StringFormatNeatFloat(buildingCultureRate / 100) .. "[ICON_CULTURE]" )

-- TODO TOURISM
		if civ5bnw_mode then
			local tourism = ( ( (building.FaithCost or 0) > 0
					and building.UnlockedByBelief
					and building.Cost == -1
					and city and city:GetFaithBuildingTourism()
					) or 0 )
--			local enhancedYieldTechID = GameInfoTypes[ building.EnhancedYieldTech ]
			tourism = tourism + (tonumber(building.TechEnhancedTourism) or 0)
			tips:insertIf( tourism ~= 0 and tourism.."[ICON_TOURISM]" )
		end

		-- Defense and HitPoints before maintenance cost
		tips:insertIf( defenseChange ~=0 and StringFormatNeatFloat(defenseChange / 100) .. "[ICON_STRENGTH]" )
		tips:insertLocalizedIfNonZero( "TXT_KEY_PEDIA_DEFENSE_HITPOINTS", hitPointChange )

		-- free / maintenance cost
		if city:GetNumFreeBuilding( buildingID ) > 0 then
			--buildingName = buildingName .. " ([COLOR_POSITIVE_TEXT]" .. L"TXT_KEY_FREE" .. "[ENDCOLOR])"
			tips:insertIf( "[COLOR_POSITIVE_TEXT]"..L"TXT_KEY_FREE".."[ENDCOLOR]" )
		else
			tips:insertIf( maintenanceCost ~=0 and "[COLOR_NEGATIVE_TEXT]"..-maintenanceCost.."[ENDCOLOR]".. g_currencyIcon )
		end

		-- Name
		if civ5_mode and building.IsReligious then
			buildingName = L( "TXT_KEY_RELIGIOUS_BUILDING", buildingName, Players[city:GetOwner()]:GetStateReligionKey() )
		end
		buildingName = buildingName..buildingNameSuffix -- Infixo show icons for great work slots and specialist slots

		-- Finally, set controls
		controls.Name:SetText( buildingName )
		controls.Label:SetText( tips:concat(" ") )
		-- Sometimes yields go to the 2nd line and mess with the next building
		if tips:count() > 6 then
			buildingButton:SetSizeY( 69 ) -- cannot use GetSizeY() because it scales from Portrait which is already 64
		else
			buildingButton:SetSizeY( 46 ) -- original size from xml
		end
		-- Infixo OFF
		--controls.Label:ChangeParent( controls.Stack )
		--slotStack:CalculateSize()
		--if slotStack:GetSizeX() + controls.Label:GetSizeX() < 254 then
			--controls.Label:ChangeParent( slotStack )
		--end
		--controls.Stack:CalculateSize()
--		slotStack:ReprocessAnchoring()
--		controls.Stack:ReprocessAnchoring()
		--buildingButton:SetSizeY( math_max(64, controls.Stack:GetSizeY() + 16) ) -- Infixo OFF
	end
	return buildingIM.Commit()
end

-------------------------------------------
-- Production Selection List Management
-------------------------------------------

local function isItemInQueue(city, itemID)
	local queueLength = city:GetOrderQueueLength()
	if queueLength < 1 then
		return false
	else
		for queuedItemNumber = 0, queueLength-1 do
			local curItemID
			_, curItemID, _, _ = city:GetOrderFromQueue( queuedItemNumber )
			if itemID == curItemID then
				return true
			end
		end
		return false
	end
end

local function SelectionPurchase( orderID, itemID, yieldID, soundKey )
	local city = UI_GetHeadSelectedCity()
	if city then
		local cityOwnerID = city:GetOwner()
		if cityOwnerID == g_activePlayerID
			and ( not city:IsPuppet() or ( bnw_mode and g_activePlayer:MayNotAnnex() ) or g_isFaithPurchaseBuildingsInPuppetsMod)
							----------- Venice exception -----------
		then
			local cityID = city:GetID()
			local isPurchase
			if orderID == OrderTypes.ORDER_TRAIN then
				if cityIsCanPurchase( city, true, true, itemID, -1, -1, yieldID ) then
					Game.CityPurchaseUnit( city, itemID, yieldID )
					isPurchase = true
				end
			elseif orderID == OrderTypes.ORDER_CONSTRUCT then
				if cityIsCanPurchase( city, true, true, -1, itemID, -1, yieldID ) then
					Game.CityPurchaseBuilding( city, itemID, yieldID )
					Network.SendUpdateCityCitizens( cityID )
					isPurchase = true
				end

				-- Invest in all buildings of this type in any cities queue
				if UI.ShiftKeyDown() then
					for cityX in g_activePlayer:Cities() do
						if cityX ~= city
								and ( not cityX:IsPuppet() or ( bnw_mode and g_activePlayer:MayNotAnnex() ) or g_isFaithPurchaseBuildingsInPuppetsMod)
								and isItemInQueue(cityX, itemID) then
							if cityIsCanPurchase( cityX, true, true, -1, itemID, -1, yieldID ) then
								Game.CityPurchaseBuilding( cityX, itemID, yieldID )
								Network.SendUpdateCityCitizens( cityX:GetID() )
								isPurchase = true
							end
						end
					end
				end
			elseif orderID == OrderTypes.ORDER_CREATE then
				if cityIsCanPurchase( city, true, true, -1, -1, itemID, yieldID ) then
					Game.CityPurchaseProject( city, itemID, yieldID )
					isPurchase = true
				end
			end
			if isPurchase then
				UpdateCityView()
				Events.SpecificCityInfoDirty( cityOwnerID, cityID, CityUpdateTypes.CITY_UPDATE_TYPE_BANNER )
				Events.SpecificCityInfoDirty( cityOwnerID, cityID, CityUpdateTypes.CITY_UPDATE_TYPE_PRODUCTION )
				if soundKey then
					Events.AudioPlay2DSound( soundKey )
				end
			end
		end
	end
end

local function AddSelectionItem( city, item,
				selectionList,
				orderID,
				cityCanProduce,
				unitID, buildingID, projectID,
				cityGetProductionTurnsLeft,
				cityGetGoldCost,
				cityGetFaithCost )

	local itemID = item.ID
	local name = item.Description
	local turnsLeft = not g_isViewingMode and cityCanProduce( city, itemID, 0, 1 )	-- 0 = /continue, 1 = testvisible, nil = /ignore cost
	local canProduce = not g_isViewingMode and cityCanProduce( city, itemID )	-- nil = /continue, nil = /testvisible, nil = /ignore cost
	local canBuyWithGold, goldCost, canBuyWithFaith, faithCost
	if unitID then
		if civBE_mode then
			local bestUpgradeInfo = GameInfo.UnitUpgrades[ g_activePlayer:GetBestUnitUpgrade(unitID) ]
			name = bestUpgradeInfo and bestUpgradeInfo.Description or name
		end
		if cityGetGoldCost then
			canBuyWithGold = cityIsCanPurchase( city, true, true, unitID, buildingID, projectID, g_yieldCurrency )
			goldCost = cityIsCanPurchase( city, false, false, unitID, buildingID, projectID, g_yieldCurrency )
					and cityGetGoldCost( city, itemID )
		end
		if cityGetFaithCost then
			canBuyWithFaith = cityIsCanPurchase( city, true, true, unitID, buildingID, projectID, YieldTypes.YIELD_FAITH )
			faithCost = cityIsCanPurchase( city, false, false, unitID, buildingID, projectID, YieldTypes.YIELD_FAITH )
					and cityGetFaithCost( city, itemID, true )
		end
	end
	if turnsLeft or goldCost or faithCost or (g_isDebugMode and not city:IsHasBuilding(buildingID)) then
		turnsLeft = turnsLeft and ( cityGetProductionTurnsLeft and cityGetProductionTurnsLeft( city, itemID ) or -1 )
		return selectionList:insert{ item, orderID, L(name), turnsLeft, canProduce, goldCost, canBuyWithGold, faithCost, canBuyWithFaith }
	end
end

local function SortSelectionList(a,b)
	return a[3]<b[3]
end

local function doCityPushOrder( city, orderID, itemID, bAlt, bShift, bCtrl )
	-- cityPushOrder( city, orderID, itemID, bAlt, bShift, bCtrl )
	-- cityPushOrder( city, orderID, itemID, repeatBuild, replaceQueue, bottomOfQueue )
	Game.CityPushOrder( city, orderID, itemID, bAlt, bShift, not bCtrl )
	Events.SpecificCityInfoDirty( cityOwnerID, city:GetID(), CityUpdateTypes.CITY_UPDATE_TYPE_BANNER )
	Events.SpecificCityInfoDirty( cityOwnerID, city:GetID(), CityUpdateTypes.CITY_UPDATE_TYPE_PRODUCTION )
end

local function canCityFulfillOrder(city, orderID, itemID)
	if orderID == OrderTypes.ORDER_TRAIN then
		return city:CanTrain( itemID )
	elseif orderID == OrderTypes.ORDER_CONSTRUCT then
		return city:CanConstruct( itemID )
	elseif orderID == OrderTypes.ORDER_CREATE then
		return city:CanCreate( itemID )
	elseif orderID == OrderTypes.ORDER_MAINTAIN then
		return city:CanMaintain( itemID )
	else
		print("Warning: unknown orderID", orderID)
		return false
	end
end

local function handleBuildOrder( city, orderID, itemID )
	if UI.ShiftKeyDown() and UI.AltKeyDown() and not UI.CtrlKeyDown() then
		-- Add to back of every cities queue (shift-alt-lclick)
		for cityX in g_activePlayer:Cities() do
			if not cityX:IsPuppet() and canCityFulfillOrder(cityX, orderID, itemID) and
					-- allow duplicates when order type is units
					not (orderID ~= OrderTypes.ORDER_TRAIN and isItemInQueue(cityX, itemID)) then
				doCityPushOrder( cityX, orderID, itemID, false, false, false )
			end
		end
	elseif UI.ShiftKeyDown() and not UI.AltKeyDown() and UI.CtrlKeyDown() then
		-- Add to front of every cities queue (shift-ctrl-lclick)
		for cityX in g_activePlayer:Cities() do
			if not cityX:IsPuppet() and canCityFulfillOrder(cityX, orderID, itemID) and
					-- allow duplicates when order type is units
					not (orderID ~= OrderTypes.ORDER_TRAIN and isItemInQueue(cityX, itemID)) then
				doCityPushOrder( cityX, orderID, itemID, false, false, true )
			end
		end
	else
		-- Default behavior
		doCityPushOrder( city, orderID, itemID, UI.AltKeyDown(), UI.ShiftKeyDown(), UI.CtrlKeyDown() )
	end
end

local g_SelectionListCallBacks = {
	Button = {
		[Mouse.eLClick] = function( orderID, itemID )
			local city = GetSelectedModifiableCity()
			if city then
				local cityOwnerID = city:GetOwner()
				if cityOwnerID == g_activePlayerID and not city:IsPuppet() then
					handleBuildOrder( city, orderID, itemID )
					if g_isButtonPopupChooseProduction then
						-- is there another city without production order ?
						for cityX in g_activePlayer:Cities() do
							if cityX ~= city and not cityX:IsPuppet() and cityX:GetOrderQueueLength() < 1 then
								UI.SelectCity( cityX )
								return UI.LookAtSelectionPlot()
							end
						end
						-- all cities are producing...
						if not UI.CtrlKeyDown() then
							return ExitCityScreen()
						end
					end
				end
			end
		end,
		[Mouse.eRClick] = SelectionPedia,
	},
	GoldButton = {
		[Mouse.eLClick] = function( orderID, itemID )
			return SelectionPurchase( orderID, itemID, g_yieldCurrency, "AS2D_INTERFACE_CITY_SCREEN_PURCHASE" )
		end,
	},
	FaithButton = {
		[Mouse.eLClick] = function( orderID, itemID )
			return SelectionPurchase( orderID, itemID, YieldTypes.YIELD_FAITH, "AS2D_INTERFACE_FAITH_PURCHASE" )
		end,
	},
}
local g_SelectionListTooltips = {
	Button = SelectionToolTip,
	GoldButton = function( control )
		return OrderItemTooltip( UI_GetHeadSelectedCity(), control:IsDisabled(), g_yieldCurrency, control:GetVoid1(), control:GetVoid2() )
	end,
	FaithButton = function( control )
		return OrderItemTooltip( UI_GetHeadSelectedCity(), control:IsDisabled(), YieldTypes.YIELD_FAITH, control:GetVoid1(), control:GetVoid2() )
	end,
}

local function SetupSelectionList( itemList, selectionIM, cityOwnerID, getUnitPortraitIcon )
	itemList:sort( SortSelectionList )
	selectionIM.ResetInstances()
	local cash = g_activePlayer:GetGold()
	local faith = gk_mode and g_activePlayer:GetFaith() or 0
	for i = 1, #itemList do
		local item, orderID, itemDescription, turnsLeft, canProduce, goldCost, canBuyWithGold, faithCost, canBuyWithFaith = unpack( itemList[i] )
		local itemID = item.ID
		local avisorRecommended = g_isAdvisor and g_avisorRecommended[ orderID ]
		if g_isDebugMode then
			avisorRecommended, goldCost, canBuyWithGold, faithCost, canBuyWithFaith = nil
		end
		local instance, isNewInstance = selectionIM.GetInstance()
		if isNewInstance then
			SetupCallbacks( instance, g_SelectionListTooltips, "EUI_CityViewLeftTooltip", g_SelectionListCallBacks )
		end
		instance.DisabledProduction:SetHide( canProduce or not(canBuyWithGold or canBuyWithFaith) )
		instance.Disabled:SetHide( canProduce or canBuyWithGold or canBuyWithFaith )
		if getUnitPortraitIcon then
			local iconIndex, iconAtlas = getUnitPortraitIcon( itemID, cityOwnerID )
			IconHookup( iconIndex, 45, iconAtlas, instance.Portrait )
		else
			IconHookup( item.PortraitIndex, 45, item.IconAtlas, instance.Portrait )
		end
		instance.Name:SetText( itemDescription )
		if not turnsLeft then
		elseif turnsLeft > -1 and turnsLeft <= 999 then
			instance.Turns:LocalizeAndSetText( "TXT_KEY_STR_TURNS", turnsLeft )
		else
			instance.Turns:LocalizeAndSetText( "TXT_KEY_PRODUCTION_HELP_INFINITE_TURNS" )
		end
		instance.Turns:SetHide( not turnsLeft )
		instance.Button:SetVoids( orderID, itemID )

		instance.GoldButton:SetHide( not goldCost )
		if goldCost then
			instance.GoldButton:SetDisabled( not canBuyWithGold )
			instance.GoldButton:SetAlpha( canBuyWithGold and 1 or 0.5 )
			instance.GoldButton:SetVoids( orderID, itemID )
			instance.GoldButton:SetText( (cash>=goldCost and goldCost or "[COLOR_WARNING_TEXT]"..(goldCost-cash).."[ENDCOLOR]") .. g_currencyIcon )
		end
		instance.FaithButton:SetHide( not faithCost )
		if faithCost then
			instance.FaithButton:SetDisabled( not canBuyWithFaith )
			instance.FaithButton:SetAlpha( canBuyWithFaith and 1 or 0.5 )
			instance.FaithButton:SetVoids( orderID, itemID )
			instance.FaithButton:SetText( (faith>=faithCost and faithCost or "[COLOR_WARNING_TEXT]"..(faithCost-faith).."[ENDCOLOR]") .. "[ICON_PEACE]" )
		end

		for advisorID, advisorName in pairs(g_advisors) do
			local advisorControl = instance[ advisorName ]
			if advisorControl then
				advisorControl:SetHide( not (avisorRecommended and avisorRecommended( itemID, advisorID )) )
			end
		end
	end
	return selectionIM.Commit()
end

-------------------------------
-- Production Queue Managemeent
-------------------------------
local function RemoveQueueItem( queuedItemNumber )
	local city = GetSelectedModifiableCity()
	if city then
		local queueLength = city:GetOrderQueueLength()
		if city:GetOwner() == g_activePlayerID and queueLength > queuedItemNumber then
			Game.SelectedCitiesGameNetMessage( GameMessageTypes.GAMEMESSAGE_POP_ORDER, queuedItemNumber )
			if queueLength < 2 then
				local strTooltip = L( "TXT_KEY_NOTIFICATION_NEW_CONSTRUCTION", city:GetNameKey() )
				g_activePlayer:AddNotification( NotificationTypes.NOTIFICATION_PRODUCTION, strTooltip, strTooltip, city:GetX(), city:GetY(), -1, -1 )
			end
		end
	end
end

local function SwapQueueItem( queuedItemNumber )
	if g_queuedItemNumber and Controls.QueueSlider:IsTrackingLeftMouseButton() then
		local a, b = g_queuedItemNumber, queuedItemNumber
		if a>b then a, b = b, a end
		for i=a, b-1 do
			Game.SelectedCitiesGameNetMessage( GameMessageTypes.GAMEMESSAGE_SWAP_ORDER, i )
		end
		for i=b-2, a, -1 do
			Game.SelectedCitiesGameNetMessage( GameMessageTypes.GAMEMESSAGE_SWAP_ORDER, i )
		end
	end
	g_queuedItemNumber = queuedItemNumber or g_queuedItemNumber
end

-- Vox Populi gold button
local function PQGoldButtonCallback( orderID, itemID )
	return SelectionPurchase( orderID, itemID, g_yieldCurrency, "AS2D_INTERFACE_CITY_SCREEN_PURCHASE" )
end

local function UpdateCityProductionQueueNow (city, cityID, cityOwnerID, isVeniceException )

-- Automated City Production
Controls.AutomateProduction:RegisterCheckHandler( function( isChecked )
	Game.SelectedCitiesGameNetMessage( GameMessageTypes.GAMEMESSAGE_DO_TASK, TaskTypes.TASK_SET_AUTOMATED_PRODUCTION, -1, -1, isChecked, false )
--	Network.SendDoTask( city:GetID(), TaskTypes.TASK_SET_AUTOMATED_PRODUCTION, -1, -1, isChecked, false )
end)

	-------------------------------------------
	-- Update Production Queue
	-------------------------------------------
	local queueLength = city:GetOrderQueueLength()
	local currentProductionPerTurnTimes100 = city:GetCurrentProductionDifferenceTimes100(false, false)
	local isGeneratingProduction = not bnw_mode or ( currentProductionPerTurnTimes100 > 0)
	local isMaintain = false
	local isQueueEmpty = queueLength < 1
	Controls.ProductionFinished:SetHide( true )
	g_BuildingSelectIM.ResetInstances();
	g_ProjectSelectIM.ResetInstances();
	g_NationalWonderSelectIM.ResetInstances();
	g_WonderSelectIM.ResetInstances();

	local isActivePlayerCity = cityOwnerID == Game.GetActivePlayer()
	local isCityCaptureViewingMode = UI.IsPopupTypeOpen(ButtonPopupTypes.BUTTONPOPUP_CITY_CAPTURED)

	-- Production stored and needed
	local storedProduction = city:GetProduction() + city:GetOverflowProduction() + city:GetFeatureProduction()
	local productionNeeded = 1E-99
	if isGeneratingProduction and not isQueueEmpty and not city:IsProductionProcess() then
		productionNeeded = city:GetProductionNeeded()
	end

	-- Progress info for meter
	local storedProductionPlusThisTurn = storedProduction + currentProductionPerTurnTimes100 / 100

	Controls.PQmeter:SetPercents( storedProduction / productionNeeded, storedProductionPlusThisTurn / productionNeeded )

	Controls.ProdPerTurnLabel:LocalizeAndSetText( "TXT_KEY_CITYVIEW_PERTURN_TEXT", currentProductionPerTurnTimes100 / 100 )

	Controls.ProductionPortraitButton:SetHide( false )

	g_ProdQueueIM.ResetInstances()
	local queueItems = {}

	for queuedItemNumber = 0, math_max( queueLength-1, 0 ) do

		local orderID, itemID, _, isRepeat, isReallyRepeat
		if isQueueEmpty then
			local item = g_finishedItems[ cityID ]
			if item then
				orderID, itemID = unpack( item )
				Controls.ProductionFinished:SetHide( false )
			end
		else
			orderID, itemID, _, isRepeat = city:GetOrderFromQueue( queuedItemNumber )
			queueItems[ orderID / 64 + itemID ] = true
		end
		local instance, portraitSize
		if queuedItemNumber == 0 then
			instance = Controls
			portraitSize = g_portraitSize
		else
			portraitSize = 45
			instance = g_ProdQueueIM.GetInstance()
			instance.PQdisabled:SetHide( not isMaintain )
		end
		instance.PQbox:SetVoid1( queuedItemNumber )
		instance.PQbox:RegisterCallback( Mouse.eMouseEnter, SwapQueueItem )
		instance.PQbox:RegisterCallback( Mouse.eRClick, ProductionPedia )
		instance.PQbox:SetToolTipCallback( ProductionToolTip )

		instance.PQremove:SetHide( isQueueEmpty or g_isViewingMode )
		instance.PQremove:SetVoid1( queuedItemNumber )
		instance.PQremove:RegisterCallback( Mouse.eLClick, RemoveQueueItem )

		local itemInfo, turnsRemaining, portraitOffset, portraitAtlas

		-- Vox Populi invested
		local cashInvested;
		-- Vox Populi gold button
		local cashPQ = g_activePlayer:GetGold();
		local canBuyWithGoldPQ, goldCostPQ;

		if orderID == OrderTypes.ORDER_TRAIN then
			itemInfo = GameInfo.Units
			turnsRemaining = city:GetUnitProductionTurnsLeft( itemID, queuedItemNumber )
			portraitOffset, portraitAtlas = UI_GetUnitPortraitIcon( itemID, cityOwnerID )
			isReallyRepeat = isRepeat
			-- Vox Populi invested
			cashInvested = city:GetUnitInvestment(itemID)
			-- Vox Populi gold button
			canBuyWithGoldPQ = cityIsCanPurchase( city, true, true, itemID, -1, -1, g_yieldCurrency )
			goldCostPQ = cityIsCanPurchase( city, false, false, itemID, -1, -1, g_yieldCurrency )
						and city:GetUnitPurchaseCost( itemID )
		elseif orderID == OrderTypes.ORDER_CONSTRUCT then
			itemInfo = GameInfo.Buildings
			turnsRemaining = city:GetBuildingProductionTurnsLeft( itemID, queuedItemNumber )
			-- Vox Populi invested
			cashInvested = city:GetBuildingInvestment(itemID)
			-- Vox Populi gold button
			canBuyWithGoldPQ = cityIsCanPurchase( city, true, true, -1, itemID, -1, g_yieldCurrency )
			goldCostPQ = cityIsCanPurchase( city, false, false, -1, itemID, -1, g_yieldCurrency )
						and city:GetBuildingPurchaseCost( itemID )
		elseif orderID == OrderTypes.ORDER_CREATE then
			itemInfo = GameInfo.Projects
			turnsRemaining = city:GetProjectProductionTurnsLeft( itemID, queuedItemNumber )
		elseif orderID == OrderTypes.ORDER_MAINTAIN then
			itemInfo = GameInfo.Processes
			isMaintain = true
			isReallyRepeat = true
		end

		-- Maggi
		if g_isDebugMode then goldCost, canBuyWithGold = nil end

		-- Vox Populi invested
		instance.PQinvested:SetHide( not (cashInvested and cashInvested > 0) );

		-- Vox Populi gold button
		if itemInfo then
			if (bnw_mode and g_activePlayer:MayNotAnnex()) then --Venice puppets needs to buy building on production queue
				instance.PQGoldButton:SetHide( not goldCostPQ or (isActivePlayerCity or isCityCaptureViewingMode))
			else
				instance.PQGoldButton:SetHide( not goldCostPQ or g_isViewingMode)
			end
			if goldCostPQ then
				instance.PQGoldButton:SetDisabled( not canBuyWithGoldPQ )
				instance.PQGoldButton:SetAlpha( canBuyWithGoldPQ and 1 or 0.5 )
				instance.PQGoldButton:SetVoids( orderID, itemID )
				instance.PQGoldButton:SetText( (cashPQ >= goldCostPQ and goldCostPQ or "[COLOR_WARNING_TEXT]"..(goldCostPQ-cashPQ).."[ENDCOLOR]") .. g_currencyIcon )
				instance.PQGoldButton:RegisterCallback( Mouse.eLClick, PQGoldButtonCallback )
				instance.PQGoldButton:SetToolTipCallback ( PQGoldButtonToolTip )
			end
		else
			instance.PQGoldButton:SetHide( true )
		end
		-- Vox Populi end

		if itemInfo then
			local item = itemInfo[itemID]
			itemInfo = IconHookup( portraitOffset or item.PortraitIndex, portraitSize, portraitAtlas or item.IconAtlas, instance.PQportrait )
			instance.PQname:LocalizeAndSetText( item.Description )
			if isMaintain or isQueueEmpty then
			elseif isGeneratingProduction then
				instance.PQturns:LocalizeAndSetText( "TXT_KEY_PRODUCTION_HELP_NUM_TURNS", turnsRemaining )
			else
				instance.PQturns:LocalizeAndSetText( "TXT_KEY_PRODUCTION_HELP_INFINITE_TURNS" )
			end
		else
			instance.PQname:LocalizeAndSetText( "TXT_KEY_PRODUCTION_NO_PRODUCTION" )
		end
		instance.PQturns:SetHide( isMaintain or isQueueEmpty or not itemInfo )
		instance.PQportrait:SetHide( not itemInfo )
		if isReallyRepeat then
			isMaintain = true
			instance.PQrank:SetText( "[ICON_TURNS_REMAINING]" )
		else
			instance.PQrank:SetText( not isMaintain and queueLength > 1 and (queuedItemNumber+1).."." )
		end
	end

	g_ProdQueueIM.Commit()

	-------------------------------------------
	-- Update Selection List
	-------------------------------------------

	local isSelectionList = not g_isViewingMode or isVeniceException or g_isDebugMode or g_isFaithPurchaseBuildingsInPuppetsMod
	Controls.SelectionScrollPanel:SetHide( not isSelectionList )
	if isSelectionList then
		local unitSelectList = table()
		local gpUnitSelectList = table()
		local religiousUnitSelectList = table()
		local landUnitSelectList = table()
		local seaUnitSelectList = table()
		local airUnitSelectList = table()
		local militaryUnitSelectList = table()
		local buildingSelectList = table()
		local projectSelectList = table()
		local nationalWonderSelectList = table()
		local wonderSelectList = table()
		local processSelectList = table()

		if g_isAdvisor then
			Game.SetAdvisorRecommenderCity( city )
		end
		-- Buildings & Wonders
		local orderID = OrderTypes.ORDER_CONSTRUCT
		local code = orderID / 64
		for item in GameInfo.Buildings() do
			local buildingClass = GameInfo.BuildingClasses[item.BuildingClass]
			local isWonder = buildingClass and (buildingClass.MaxGlobalInstances > 0 or buildingClass.MaxPlayerInstances == 1 or buildingClass.MaxTeamInstances > 0)
			local isWorldWonder = buildingClass and (buildingClass.MaxGlobalInstances > 0 or buildingClass.MaxTeamInstances > 0)
			local isNationalWonder = buildingClass and buildingClass.MaxPlayerInstances == 1
			if not queueItems[ code + item.ID ] then
				if g_isSeparateCityProductionEUI then
					if g_isSeparateProjectWonders then
						Controls.WondersText:SetText(L("TXT_KEY_POP_WORLD_WONDERS"))
						AddSelectionItem( city, item,
								(isNationalWonder and nationalWonderSelectList) or
								(isWorldWonder and wonderSelectList) or
								buildingSelectList,
								orderID,
								city.CanConstruct,
								-1, item.ID, -1,
								city.GetBuildingProductionTurnsLeft,
								city.GetBuildingPurchaseCost,
								city.GetBuildingFaithPurchaseCost )
					else
						AddSelectionItem( city, item,
								(isWonder and wonderSelectList) or
								buildingSelectList,
								orderID,
								city.CanConstruct,
								-1, item.ID, -1,
								city.GetBuildingProductionTurnsLeft,
								city.GetBuildingPurchaseCost,
								city.GetBuildingFaithPurchaseCost )
					end
				else
					AddSelectionItem( city, item,
							(isWonder and wonderSelectList) or
							buildingSelectList,
							orderID,
							city.CanConstruct,
							-1, item.ID, -1,
							city.GetBuildingProductionTurnsLeft,
							city.GetBuildingPurchaseCost,
							city.GetBuildingFaithPurchaseCost )
				end
			end
		end
		if not g_isDebugMode then
			-- Units
			orderID = OrderTypes.ORDER_TRAIN
			for item in GameInfo.Units() do
				local isGPUnit = item.Special == "SPECIALUNIT_PEOPLE"
				local isReligiousUnit = item.ReligiousStrength > 0
				local isLandMilitary = item.Domain == "DOMAIN_LAND" and item.Combat > 0
				local isSeaMilitary = item.Domain == "DOMAIN_SEA" and item.Combat > 0
				local isAirMilitary = item.Domain == "DOMAIN_AIR" and item.RangedCombat > 0
				local isMilitary = item.Combat > 0 or item.RangedCombat > 0
				-- N.Core: This is unelegant solution, I'm sorry
				if g_isSeparateCityProductionEUI then
					if g_isSeparateGPReligious and g_isSeparateMilitaryDomain then
						AddSelectionItem( city, item,
									(isGPUnit and gpUnitSelectList) or
									(isReligiousUnit and religiousUnitSelectList) or
									(isLandMilitary and landUnitSelectList) or
									(isSeaMilitary and seaUnitSelectList) or
									(isAirMilitary and airUnitSelectList) or
									(isMilitary and militaryUnitSelectList) or
									unitSelectList,
									orderID,
									city.CanTrain,
									item.ID, -1, -1,
									city.GetUnitProductionTurnsLeft,
									city.GetUnitPurchaseCost,
									city.GetUnitFaithPurchaseCost )
					elseif not g_isSeparateGPReligious and g_isSeparateMilitaryDomain then
						AddSelectionItem( city, item,
									(isLandMilitary and landUnitSelectList) or
									(isSeaMilitary and seaUnitSelectList) or
									(isAirMilitary and airUnitSelectList) or
									(isMilitary and militaryUnitSelectList) or
									unitSelectList,
									orderID,
									city.CanTrain,
									item.ID, -1, -1,
									city.GetUnitProductionTurnsLeft,
									city.GetUnitPurchaseCost,
									city.GetUnitFaithPurchaseCost )
					elseif g_isSeparateGPReligious and not g_isSeparateMilitaryDomain then
						AddSelectionItem( city, item,
									(isGPUnit and gpUnitSelectList) or
									(isReligiousUnit and religiousUnitSelectList) or
									(isMilitary and militaryUnitSelectList) or
									unitSelectList,
									orderID,
									city.CanTrain,
									item.ID, -1, -1,
									city.GetUnitProductionTurnsLeft,
									city.GetUnitPurchaseCost,
									city.GetUnitFaithPurchaseCost )
					elseif not g_isSeparateGPReligious and not g_isSeparateMilitaryDomain then
						AddSelectionItem( city, item,
									(isMilitary and militaryUnitSelectList) or
									unitSelectList,
									orderID,
									city.CanTrain,
									item.ID, -1, -1,
									city.GetUnitProductionTurnsLeft,
									city.GetUnitPurchaseCost,
									city.GetUnitFaithPurchaseCost )
					else	-- N.Core: same as above, only serve as a redundancy check
						AddSelectionItem( city, item,
									(isMilitary and militaryUnitSelectList) or
									unitSelectList,
									orderID,
									city.CanTrain,
									item.ID, -1, -1,
									city.GetUnitProductionTurnsLeft,
									city.GetUnitPurchaseCost,
									city.GetUnitFaithPurchaseCost )
					end
				else
					AddSelectionItem( city, item,
								unitSelectList,
								orderID,
								city.CanTrain,
								item.ID, -1, -1,
								city.GetUnitProductionTurnsLeft,
								city.GetUnitPurchaseCost,
								city.GetUnitFaithPurchaseCost )
				end
			end
			-- Projects
			orderID = OrderTypes.ORDER_CREATE
			code = orderID / 64
			for item in GameInfo.Projects() do
				if not queueItems[ code + item.ID ] then
					if g_isSeparateCityProductionEUI then
						if g_isSeparateProjectWonders then
							AddSelectionItem( city, item,
									projectSelectList,
									orderID,
									city.CanCreate,
									-1, -1, item.ID,
									city.GetProjectProductionTurnsLeft,
									city.GetProjectPurchaseCost,
									city.GetProjectFaithPurchaseCost )	-- nil
						else
							AddSelectionItem( city, item,
									wonderSelectList,
									orderID,
									city.CanCreate,
									-1, -1, item.ID,
									city.GetProjectProductionTurnsLeft,
									city.GetProjectPurchaseCost,
									city.GetProjectFaithPurchaseCost )	-- nil
						end
					else
						AddSelectionItem( city, item,
								wonderSelectList,
								orderID,
								city.CanCreate,
								-1, -1, item.ID,
								city.GetProjectProductionTurnsLeft,
								city.GetProjectPurchaseCost,
								city.GetProjectFaithPurchaseCost )	-- nil
					end
				end
			end
			-- Processes
			orderID = OrderTypes.ORDER_MAINTAIN
			code = orderID / 64
			for item in GameInfo.Processes() do
				local leagueProjects = GameInfo.LeagueProjects{Process = item.Type}()
				local isLeagueProject = leagueProjects and leagueProjects.Process == item.Type
				if not queueItems[ code + item.ID ] then
					if g_isSeparateCityProductionEUI then
						if g_isSeparateProjectWonders then
							AddSelectionItem( city, item,
									(isLeagueProject and projectSelectList) or
									processSelectList,
									orderID,
									city.CanMaintain )
						else
							AddSelectionItem( city, item,
									processSelectList,
									orderID,
									city.CanMaintain )
						end
					else
						AddSelectionItem( city, item,
								processSelectList,
								orderID,
								city.CanMaintain )
					end
				end
			end
		end

		SetupSelectionList( unitSelectList, g_UnitSelectIM, cityOwnerID, UI_GetUnitPortraitIcon )
		SetupSelectionList( gpUnitSelectList, g_GPUnitSelectIM, cityOwnerID, UI_GetUnitPortraitIcon )
		SetupSelectionList( religiousUnitSelectList, g_ReligiousUnitSelectIM, cityOwnerID, UI_GetUnitPortraitIcon )
		SetupSelectionList( militaryUnitSelectList, g_MilitaryUnitSelectIM, cityOwnerID, UI_GetUnitPortraitIcon )
		SetupSelectionList( landUnitSelectList, g_LandUnitSelectIM, cityOwnerID, UI_GetUnitPortraitIcon )
		SetupSelectionList( seaUnitSelectList, g_SeaUnitSelectIM, cityOwnerID, UI_GetUnitPortraitIcon )
		SetupSelectionList( airUnitSelectList, g_AirUnitSelectIM, cityOwnerID, UI_GetUnitPortraitIcon )
		SetupSelectionList( buildingSelectList, g_BuildingSelectIM )
		SetupSelectionList( projectSelectList, g_ProjectSelectIM )
		SetupSelectionList( nationalWonderSelectList, g_NationalWonderSelectIM )
		SetupSelectionList( wonderSelectList, g_WonderSelectIM )
		SetupSelectionList( processSelectList, g_ProcessSelectIM )

	end
	return ResizeProdQueue()
end

-------------------------------------------------
-- City Hex Clicking & Mousing
-------------------------------------------------
local function PlotButtonClicked( plotIndex )
	local city = GetSelectedModifiableCity()
	local plot = city and city:GetCityIndexPlot( plotIndex )
	if plot then
		local outside = city ~= plot:GetWorkingCity()
		-- calling this with the city center (0 in the third param) causes it to reset all forced tiles
		Network.SendDoTask( city:GetID(), TaskTypes.TASK_CHANGE_WORKING_PLOT, plotIndex, -1, false )
		if outside then
			return Network.SendUpdateCityCitizens( city:GetID() )
		end
		--Another venice exception
		elseif g_activePlayer:MayNotAnnex() then
			local puppet = GetSelectedCity();
			local plot = puppet and puppet:GetCityIndexPlot( plotIndex )
			local outside = puppet ~= plot:GetWorkingCity()
			-- calling this with the puppet center (0 in the third param) causes it to reset all forced tiles
			Network.SendDoTask( puppet:GetID(), TaskTypes.TASK_CHANGE_WORKING_PLOT, plotIndex, -1, false )
			if outside then
				return Network.SendUpdateCityCitizens( puppet:GetID() )
			end
	end
end

local function BuyPlotAnchorButtonClicked( plotIndex )
	local city = GetSelectedModifiableCity()
	if city then
		local plot = city:GetCityIndexPlot( plotIndex )
		local plotX = plot:GetX()
		local plotY = plot:GetY()
		Network.SendCityBuyPlot(city:GetID(), plotX, plotY)
		Network.SendUpdateCityCitizens( city:GetID() )
		UI.UpdateCityScreen()
		Events.AudioPlay2DSound("AS2D_INTERFACE_BUY_TILE")
	--CBP
	elseif g_activePlayer:MayNotAnnex() then
		local puppet = GetSelectedCity()
		if(puppet) then
			local plot = puppet:GetCityIndexPlot( plotIndex )
			local plotX = plot:GetX()
			local plotY = plot:GetY()
			Network.SendCityBuyPlot(puppet:GetID(), plotX, plotY)
			Network.SendUpdateCityCitizens( puppet:GetID() )
			UI.UpdateCityScreen()
			Events.AudioPlay2DSound("AS2D_INTERFACE_BUY_TILE")
		end
	--END
	end
	return true
end

-------------------------------------------------
-- City Hexes Update
-------------------------------------------------
local function UpdateWorkingHexesNow()

	g_isCityHexesDirty = false
	local city = UI_GetHeadSelectedCity()
	if city and UI.IsCityScreenUp() then

		Events_ClearHexHighlightStyle( "Culture" )
		Events_ClearHexHighlightStyle( "WorkedFill" )
		Events_ClearHexHighlightStyle( "WorkedOutline" )
		Events_ClearHexHighlightStyle( "OverlapFill" )
		Events_ClearHexHighlightStyle( "OverlapOutline" )
		Events_ClearHexHighlightStyle( "VacantFill" )
		Events_ClearHexHighlightStyle( "VacantOutline" )
		Events_ClearHexHighlightStyle( "EnemyFill" )
		Events_ClearHexHighlightStyle( "EnemyOutline" )
		Events_ClearHexHighlightStyle( "BuyFill" )
		Events_ClearHexHighlightStyle( "BuyOutline" )

		g_PlotButtonIM.ResetInstances()
		g_BuyPlotButtonIM.ResetInstances()

		-- Show plots that will be acquired by culture
		local purchasablePlots = {city:GetBuyablePlotList()}
		for i = 1, #purchasablePlots do
			local plot = purchasablePlots[i]
			Events_SerialEventHexHighlight( ToHexFromGrid{ x=plot:GetX(), y=plot:GetY() }, true, g_colorCulture, "Culture" )
			purchasablePlots[ plot ] = true
		end


		local cityArea = city:GetNumCityPlots() - 1
		Events_RequestYieldDisplay( YieldDisplayTypes_AREA, RadiusHexArea( cityArea ), city:GetX(), city:GetY() )

		-- display worked plots buttons
		local cityOwnerID = city:GetOwner()
		local notInStrategicView = not InStrategicView();
		local bAnnex = g_activePlayer:MayNotAnnex();
		local showButtons = g_workerHeadingOpen and (not g_isViewingMode or bAnnex)

		for cityPlotIndex = 0, cityArea do
			local plot = city:GetCityIndexPlot( cityPlotIndex )

			if plot and plot:GetOwner() == cityOwnerID then

				local hexPos = ToHexFromGrid{ x=plot:GetX(), y=plot:GetY() }
				local worldPos = HexToWorld( hexPos )
				local iconID, tipKey
				if city:IsWorkingPlot( plot ) then

					-- The city itself
					if cityPlotIndex == 0 then
						iconID = 11
						tipKey = "TXT_KEY_CITYVIEW_CITY_CENTER"

					-- FORCED worked plot
					elseif city:IsForcedWorkingPlot( plot ) then
						iconID = 10
						tipKey = "TXT_KEY_CITYVIEW_FORCED_WORK_TILE"

					-- AI-picked worked plot
					else
						iconID = 0
						tipKey = "TXT_KEY_CITYVIEW_GUVNA_WORK_TILE"
					end
					if notInStrategicView then
						Events_SerialEventHexHighlight( hexPos , true, nil, "WorkedFill" )
						Events_SerialEventHexHighlight( hexPos , true, nil, "WorkedOutline" )
					end
				else
					local workingCity = plot:GetWorkingCity()
					-- worked by another one of our Cities
					if workingCity:IsWorkingPlot( plot ) then
						iconID = 12
						tipKey = "TXT_KEY_CITYVIEW_NUTHA_CITY_TILE"

					-- Workable plot
					elseif workingCity:CanWork( plot ) then
						iconID = 9
						tipKey = "TXT_KEY_CITYVIEW_UNWORKED_CITY_TILE"

					-- Blockaded plot
					elseif city:IsPlotBlockaded( plot ) then
						iconID = 13
						tipKey = "TXT_KEY_CITYVIEW_BLOCKADED_CITY_TILE"
						cityPlotIndex = nil

					-- Enemy Unit standing here
					elseif plot:IsVisibleEnemyUnit( cityOwnerID ) then
						iconID = 13
						tipKey = "TXT_KEY_CITYVIEW_ENEMY_UNIT_CITY_TILE"
						cityPlotIndex = nil
					end
					if notInStrategicView then
						if workingCity ~= city then
							Events_SerialEventHexHighlight( hexPos , true, nil, "OverlapFill" )
							Events_SerialEventHexHighlight( hexPos , true, nil, "OverlapOutline" )
						elseif cityPlotIndex then
							Events_SerialEventHexHighlight( hexPos , true, nil, "VacantFill" )
							Events_SerialEventHexHighlight( hexPos , true, nil, "VacantOutline" )
						else
							Events_SerialEventHexHighlight( hexPos , true, nil, "EnemyFill" )
							Events_SerialEventHexHighlight( hexPos , true, nil, "EnemyOutline" )
						end
					end
				end
				if iconID and showButtons then
					local instance = g_PlotButtonIM.GetInstance()
					instance.PlotButtonAnchor:SetWorldPositionVal( worldPos.x + g_worldPositionOffset.x, worldPos.y + g_worldPositionOffset.y, worldPos.z + g_worldPositionOffset.z ) --todo: improve code
					instance.PlotButtonImage:LocalizeAndSetToolTip( tipKey )
					IconHookup( iconID, 45, "CITIZEN_ATLAS", instance.PlotButtonImage )
					local button = instance.PlotButtonImage
					if not cityPlotIndex or (g_isViewingMode and not bAnnex) then
						button:ClearCallback( Mouse.eLCLick )
					elseif (bAnnex and city:IsPuppet() and iconID ~= 12) then --Another Venice exception huh...
						button:ClearCallback( Mouse.eLCLick )
					else
						button:SetVoid1( cityPlotIndex )
						button:RegisterCallback( Mouse.eLCLick, PlotButtonClicked )
					end
				end
			end
		end --loop

		-- display buy plot buttons
		-- Venice Edit (CBP)
		if g_BuyPlotMode then
			if not g_isViewingMode or bAnnex then
		--END
				local cash = g_activePlayer:GetGold()
				for cityPlotIndex = 0, cityArea do
					local plot = city:GetCityIndexPlot( cityPlotIndex )
					if plot then
						local x, y = plot:GetX(), plot:GetY()
						local hexPos = ToHexFromGrid{ x=x, y=y }
						local worldPos = HexToWorld( hexPos )
						if city:CanBuyPlotAt( x, y, true ) then
							local instance = g_BuyPlotButtonIM.GetInstance()
							local button = instance.BuyPlotAnchoredButton
							instance.BuyPlotButtonAnchor:SetWorldPositionVal( worldPos.x + g_worldPositionOffset2.x, worldPos.y + g_worldPositionOffset2.y, worldPos.z + g_worldPositionOffset2.z ) --todo: improve code
							local plotCost = city:GetBuyPlotCost( x, y )
							local tip, txt, alpha
							local canBuy = city:CanBuyPlotAt( x, y, false )
							if canBuy then
								tip = L( "TXT_KEY_CITYVIEW_CLAIM_NEW_LAND", plotCost )
								txt = plotCost
								alpha = 1
								button:SetVoid1( cityPlotIndex )
								button:RegisterCallback( Mouse.eLCLick, BuyPlotAnchorButtonClicked )
								if notInStrategicView then
									Events_SerialEventHexHighlight( hexPos , true, nil, "BuyFill" )
									if not purchasablePlots[ plot ] then
										Events_SerialEventHexHighlight( hexPos , true, nil, "BuyOutline" )
									end
								end
							else
								tip = L( "TXT_KEY_CITYVIEW_NEED_MONEY_BUY_TILE", plotCost )
								txt = "[COLOR_WARNING_TEXT]"..(plotCost-cash).."[ENDCOLOR]"
								alpha = 0.5
							end
							button:SetDisabled( not canBuy )
							instance.BuyPlotButtonAnchor:SetAlpha( alpha )
	--todo
							button:SetToolTipString( tip )
							instance.BuyPlotAnchoredButtonLabel:SetText( txt )
						end
					end
				end --loop
			end
		end
		g_PlotButtonIM.Commit()
		g_BuyPlotButtonIM.Commit()

	end -- city
end


-------------------------------------------------
-- Workaround for ERROR "function at line 1660 has more than 60 upvalues"
-------------------------------------------------
local g_gwCallbacks = {
	tooltip = GreatWorkTooltip,
	culture = YourCulturePopup,
	gwpopup = GreatWorkPopup,
}

-------------------------------------------------
-- City View Update
-------------------------------------------------
local function UpdateCityViewNow()
	g_requestTopPanelUpdate = true;
	g_isCityViewDirty = false
	local city = UI_GetHeadSelectedCity()

	if city then

		if g_citySpecialists.city ~= city then
			g_citySpecialists = { city = city }
		end
		if g_previousCity ~= city then
			g_previousCity = city
--[[
			Events_ClearHexHighlightStyle("CityLimits")
			if not InStrategicView() then
				for cityPlotIndex = 0, city:GetNumCityPlots() - 1 do
					local plot = city:GetCityIndexPlot( cityPlotIndex )
					if plot then
						local hexPos = ToHexFromGrid{ x=plot:GetX(), y=plot:GetY() }
						Events_SerialEventHexHighlight( hexPos , true, nil, "CityLimits" )
					end
				end
			end
--]]
		end
		local cityID = city:GetID()
		local cityOwnerID = city:GetOwner()
		local cityOwner = Players[cityOwnerID]
		local isActivePlayerCity = cityOwnerID == Game.GetActivePlayer()
		local isCityCaptureViewingMode = UI.IsPopupTypeOpen(ButtonPopupTypes.BUTTONPOPUP_CITY_CAPTURED)
		g_isDebugMode = Game.IsDebugMode()
		g_isViewingMode = city:IsPuppet() or not isActivePlayerCity or isCityCaptureViewingMode

		if civ5_mode then
			-- Auto Specialist checkbox
			local isNoAutoAssignSpecialists = city:IsNoAutoAssignSpecialists()
			Controls.NoAutoSpecialistCheckbox:SetCheck( isNoAutoAssignSpecialists )
			Controls.NoAutoSpecialistCheckbox:SetDisabled( g_isViewingMode )
			Controls.SpecialistsControlBox:SetHide( g_isViewingMode )
			Controls.ResetSpecialistsButton:SetDisabled( g_isViewingMode )
			if bnw_mode then
				Controls.TourismPerTurnLabel:LocalizeAndSetText( "TXT_KEY_CITYVIEW_PERTURN_TEXT", city:GetBaseTourism() / 100 )
				-- CBP
				local iHappinessPerTurn = city:GetLocalHappiness();
				local iUnhappinessPerTurn = city:GetUnhappinessAggregated();
				Controls.HappinessPerTurnLabel:LocalizeAndSetText( "TXT_KEY_NET_HAPPINESS_TEXT", iHappinessPerTurn)
				Controls.UnhappinessPerTurnLabel:LocalizeAndSetText( "TXT_KEY_NET_UNHAPPINESS_TEXT", iUnhappinessPerTurn)
				-- END
				--Controls.NoAutoSpecialistCheckbox2:SetCheck( isNoAutoAssignSpecialists ) -- Infixo not used
				--Controls.NoAutoSpecialistCheckbox2:SetDisabled( g_isViewingMode ) -- Infixo not used
			end
		end

		-- Automated City Production
		Controls.AutomateProduction:SetCheck( city:IsProductionAutomated() )
		Controls.AutomateProduction:SetDisabled( g_isViewingMode )

		-------------------------------------------
		-- City Banner
		-------------------------------------------

		-- Update capital icon
		local isCapital = city:IsCapital()
		Controls.CityCapitalIcon:SetHide( not isCapital )

		-- Connected to capital?
		Controls.CityIsConnected:SetHide( isCapital or city:IsBlockaded() or not cityOwner:IsCapitalConnectedToCity(city) or city:GetTeam() ~= Game.GetActiveTeam() )

		-- Blockaded ? / Sapped ?
		Controls.CityIsBlockaded:SetHide( not city:IsBlockaded() )
		if (city:GetSappedTurns() > 0) then
			Controls.CityIsBlockaded:SetText("[ICON_VP_SAPPED]")
			Controls.CityIsBlockaded:LocalizeAndSetToolTip("TXT_KEY_CITY_SAPPED", city:GetSappedTurns())
		else
			Controls.CityIsBlockaded:SetText("[ICON_BLOCKADED]")
			Controls.CityIsBlockaded:LocalizeAndSetToolTip("TXT_KEY_CITY_BLOCKADED")
		end

		-- Being Razed
		if city:IsRazing() then
			Controls.CityIsRazing:SetHide(false)
			Controls.CityIsRazing:LocalizeAndSetToolTip("TXT_KEY_CITY_BURNING", city:GetRazingTurns())
		else
			Controls.CityIsRazing:SetHide(true)
		end

		-- Puppet Status
		Controls.CityIsPuppet:SetHide( not city:IsPuppet() )

		-- In Resistance
		if city:IsResistance() then
			Controls.CityIsResistance:SetHide(false)
			Controls.CityIsResistance:LocalizeAndSetToolTip("TXT_KEY_CITY_RESISTANCE", city:GetResistanceTurns())
		else
			Controls.CityIsResistance:SetHide(true)
		end

		-- Occupation Status
--todo BE
		Controls.CityIsOccupied:SetHide( not( civ5_mode and city:IsOccupied() and not city:IsNoOccupiedUnhappiness() ) )

		local cityName = Locale.ToUpper( city:GetName() )

		if city:IsRazing() then
			cityName = cityName .. " (" .. L"TXT_KEY_BURNING" .. ")"
		end

		local size = isCapital and Controls.CityCapitalIcon:GetSizeX() or 0
		Controls.CityNameTitleBarLabel:SetOffsetX( size / 2 )
		TruncateString( Controls.CityNameTitleBarLabel, math_abs(Controls.NextCityButton:GetOffsetX()) * 2 - Controls.NextCityButton:GetSizeX() - size, cityName )

		-- COMMUNITY PATCH
		Controls.CityNameTitleBarLabel:LocalizeAndSetToolTip(city:GetCityUnhappinessBreakdown(false));
		-- END

		Controls.Defense:SetText( math_floor( city:GetStrengthValue() / 100 ) )
		Controls.Defense:LocalizeAndSetToolTip( Locale.ConvertTextKey("TXT_KEY_CITYVIEW_CITY_COMB_STRENGTH_TT") .. ": [ICON_RANGE_STRENGTH] " .. math_floor(city:GetStrengthValue(true) / 100) )

 		CivIconHookup( cityOwnerID, 64, Controls.CivIcon, Controls.CivIconBG, Controls.CivIconShadow, false, true )

		-------------------------------------------
		-- City Damage
		-------------------------------------------
		local cityDamage = city:GetDamage()
		if cityDamage > 0 then
			local cityHealthPercent = 1 - cityDamage / ( gk_mode and city:GetMaxHitPoints() or GameDefines.MAX_CITY_HIT_POINTS )

			Controls.HealthMeter:SetPercent( cityHealthPercent )
			if cityHealthPercent > 0.66 then
				Controls.HealthMeter:SetTexture("CityNamePanelHealthBarGreen.dds")
			elseif cityHealthPercent > 0.33 then
				Controls.HealthMeter:SetTexture("CityNamePanelHealthBarYellow.dds")
			else
				Controls.HealthMeter:SetTexture("CityNamePanelHealthBarRed.dds")
			end
			Controls.HealthFrame:SetHide( false )
		else
			Controls.HealthFrame:SetHide( true )
		end

		-------------------------------------------
		-- Growth Meter
		-------------------------------------------
		local cityPopulation = math_floor(city:GetPopulation())
		Controls.CityPopulationLabel:SetText(tostring(cityPopulation))
		Controls.PeopleMeter:SetPercent( city:GetFood() / city:GrowthThreshold() )

		--Update suffix to use correct plurality.
		Controls.CityPopulationLabelSuffix:LocalizeAndSetText( "TXT_KEY_CITYVIEW_CITIZENS_TEXT", cityPopulation )


		-------------------------------------------
		-- Citizen Focus & Slackers
		-------------------------------------------

		Controls.AvoidGrowthButton:SetCheck( city:IsForcedAvoidGrowth() )

		local slackerCount = city:GetSpecialistCount( GameDefines.DEFAULT_SPECIALIST )

		local focusType = city:GetFocusType()
		if focusType == CityAIFocusTypes.NO_CITY_AI_FOCUS_TYPE then
			Controls.BalancedFocusButton:SetCheck( true )
		elseif focusType == CityAIFocusTypes.CITY_AI_FOCUS_TYPE_FOOD then
			Controls.FoodFocusButton:SetCheck( true )
		elseif focusType == CityAIFocusTypes.CITY_AI_FOCUS_TYPE_PRODUCTION then
			Controls.ProductionFocusButton:SetCheck( true )
		elseif focusType == g_focusCurrency then
			Controls.GoldFocusButton:SetCheck( true )
		elseif focusType == CityAIFocusTypes.CITY_AI_FOCUS_TYPE_SCIENCE then
			Controls.ResearchFocusButton:SetCheck( true )
		elseif focusType == CityAIFocusTypes.CITY_AI_FOCUS_TYPE_CULTURE then
			Controls.CultureFocusButton:SetCheck( true )
		elseif focusType == CityAIFocusTypes.CITY_AI_FOCUS_TYPE_GREAT_PEOPLE then
			Controls.GPFocusButton:SetCheck( true )
		elseif gk_mode and focusType == CityAIFocusTypes.CITY_AI_FOCUS_TYPE_FAITH then
			Controls.FaithFocusButton:SetCheck( true )
		else
			Controls.BalancedFocusButton:SetCheck( true )
		end
		if city:GetNumForcedWorkingPlots() > 0 or slackerCount > 0 then
			Controls.ResetButton:SetHide( false )
			Controls.ResetFooter:SetHide( false )
		else
			Controls.ResetButton:SetHide( true )
			Controls.ResetFooter:SetHide( true )
		end

		g_SlackerIM.ResetInstances()
		for i = 1, slackerCount do
			local instance = g_SlackerIM.GetInstance()
			local slot = instance.Button
			slot:SetVoids( -1, i )
			slot:SetToolTipCallback( SpecialistTooltip )
			slot:SetTexture( g_slackerTexture )
			if g_isViewingMode then
				slot:ClearCallback( Mouse.eLClick )
			else
				slot:RegisterCallback( Mouse.eLClick, OnSlackersSelected )
			end
			slot:RegisterCallback( Mouse.eRClick, SpecialistPedia )
		end
		g_SlackerIM.Commit()

		-------------------------------------------
		-- Great Person Meters
		-------------------------------------------
		if civ5_mode then
			g_GreatPeopleIM.ResetInstances()
			for specialist in GameInfo.Specialists() do

				local gpuClass = specialist.GreatPeopleUnitClass	-- nil / UNITCLASS_ARTIST / UNITCLASS_SCIENTIST / UNITCLASS_MERCHANT / UNITCLASS_ENGINEER ...
				local unitClass = GameInfo.UnitClasses[ gpuClass or -1 ]
				if unitClass then
					local gpThreshold = city:GetSpecialistUpgradeThreshold(unitClass.ID)
					local gpProgress = city:GetSpecialistGreatPersonProgressTimes100(specialist.ID) / 100
					local gpChange = specialist.GreatPeopleRateChange * city:GetSpecialistCount( specialist.ID )
					for building in GameInfo.Buildings{SpecialistType = specialist.Type} do
						if city:IsHasBuilding(building.ID) then
							gpChange = gpChange + building.GreatPeopleRateChange
						end
					end

					gpChange = gpChange + city:GetExtraSpecialistPoints(specialist.ID)
					gpChange = gpChange + cityOwner:GetMonopolyGreatPersonRateChange(specialist.ID)

					local gpChangePlayerMod = cityOwner:GetGreatPeopleRateModifier()
					local gpChangeCityMod = city:GetGreatPeopleRateModifier()
					-- CBP
					gpChangeCityMod = gpChangeCityMod + city:GetSpecialistCityModifier(specialist.ID);
					local gpChangeMonopolyMod = cityOwner:GetMonopolyGreatPersonRateModifier(specialist.ID);
					--END
					local gpChangePolicyMod = 0
					local gpChangeWorldCongressMod = 0
					local gpChangeGoldenAgeMod = 0
					local isGoldenAge = cityOwner:GetGoldenAgeTurns() > 0

					if bnw_mode then
						-- Generic GP mods

						gpChangePolicyMod = cityOwner:GetPolicyGreatPeopleRateModifier()

						local worldCongress = (Game.GetNumActiveLeagues() > 0) and Game.GetActiveLeague()

						-- GP mods by type
						if specialist.GreatPeopleUnitClass == "UNITCLASS_WRITER" then
							gpChangePlayerMod = gpChangePlayerMod + cityOwner:GetGreatWriterRateModifier()
							gpChangePolicyMod = gpChangePolicyMod + cityOwner:GetPolicyGreatWriterRateModifier()
							if worldCongress then
								gpChangeWorldCongressMod = gpChangeWorldCongressMod + cityOwner:GetArtsyGreatPersonRateModifier()
							end
							if isGoldenAge and cityOwner:GetGoldenAgeGreatWriterRateModifier() > 0 then
								gpChangeGoldenAgeMod = gpChangeGoldenAgeMod + cityOwner:GetGoldenAgeGreatWriterRateModifier()
							end
						elseif specialist.GreatPeopleUnitClass == "UNITCLASS_ARTIST" then
							gpChangePlayerMod = gpChangePlayerMod + cityOwner:GetGreatArtistRateModifier()
							gpChangePolicyMod = gpChangePolicyMod + cityOwner:GetPolicyGreatArtistRateModifier()
							if worldCongress then
								gpChangeWorldCongressMod = gpChangeWorldCongressMod + cityOwner:GetArtsyGreatPersonRateModifier()
							end
							if isGoldenAge and cityOwner:GetGoldenAgeGreatArtistRateModifier() > 0 then
								gpChangeGoldenAgeMod = gpChangeGoldenAgeMod + cityOwner:GetGoldenAgeGreatArtistRateModifier()
							end
						elseif specialist.GreatPeopleUnitClass == "UNITCLASS_MUSICIAN" then
							gpChangePlayerMod = gpChangePlayerMod + cityOwner:GetGreatMusicianRateModifier()
							gpChangePolicyMod = gpChangePolicyMod + cityOwner:GetPolicyGreatMusicianRateModifier()
							if worldCongress then
								gpChangeWorldCongressMod = gpChangeWorldCongressMod + cityOwner:GetArtsyGreatPersonRateModifier()
							end
							if isGoldenAge and cityOwner:GetGoldenAgeGreatMusicianRateModifier() > 0 then
								gpChangeGoldenAgeMod = gpChangeGoldenAgeMod + cityOwner:GetGoldenAgeGreatMusicianRateModifier()
							end
						elseif specialist.GreatPeopleUnitClass == "UNITCLASS_SCIENTIST" then
							gpChangePlayerMod = gpChangePlayerMod + cityOwner:GetGreatScientistRateModifier()
							gpChangePolicyMod = gpChangePolicyMod + cityOwner:GetPolicyGreatScientistRateModifier()
							if worldCongress then
								gpChangeWorldCongressMod = gpChangeWorldCongressMod + cityOwner:GetScienceyGreatPersonRateModifier()
							end
--CBP
							if isGoldenAge and cityOwner:GetGoldenAgeGreatScientistRateModifier() > 0 then
								gpChangeGoldenAgeMod = gpChangeGoldenAgeMod + cityOwner:GetGoldenAgeGreatScientistRateModifier()
							end
-- END
						elseif specialist.GreatPeopleUnitClass == "UNITCLASS_MERCHANT" then
							gpChangePlayerMod = gpChangePlayerMod + cityOwner:GetGreatMerchantRateModifier()
							gpChangePolicyMod = gpChangePolicyMod + cityOwner:GetPolicyGreatMerchantRateModifier()
							if worldCongress then
								gpChangeWorldCongressMod = gpChangeWorldCongressMod + cityOwner:GetScienceyGreatPersonRateModifier()
							end
--CBP
							if isGoldenAge and cityOwner:GetGoldenAgeGreatMerchantRateModifier() > 0 then
								gpChangeGoldenAgeMod = gpChangeGoldenAgeMod + cityOwner:GetGoldenAgeGreatMerchantRateModifier()
							end
-- END
						elseif specialist.GreatPeopleUnitClass == "UNITCLASS_ENGINEER" then
							gpChangePlayerMod = gpChangePlayerMod + cityOwner:GetGreatEngineerRateModifier()
							gpChangePolicyMod = gpChangePolicyMod + cityOwner:GetPolicyGreatEngineerRateModifier()
							if worldCongress then
								gpChangeWorldCongressMod = gpChangeWorldCongressMod + cityOwner:GetScienceyGreatPersonRateModifier()
							end
--CBP
							if isGoldenAge and cityOwner:GetGoldenAgeGreatEngineerRateModifier() > 0 then
								gpChangeGoldenAgeMod = gpChangeGoldenAgeMod + cityOwner:GetGoldenAgeGreatEngineerRateModifier()
							end
-- END
						-- Compatibility with Gazebo's City-State Diplomacy Mod (CSD) for Brave New World
						elseif cityOwner.GetGreatDiplomatRateModifier and specialist.GreatPeopleUnitClass == "UNITCLASS_GREAT_DIPLOMAT" then
							gpChangePlayerMod = gpChangePlayerMod + cityOwner:GetGreatDiplomatRateModifier()
--CBP
							if isGoldenAge and cityOwner:GetGoldenAgeGreatDiplomatRateModifier() > 0 then
								gpChangeGoldenAgeMod = gpChangeGoldenAgeMod + cityOwner:GetGoldenAgeGreatDiplomatRateModifier()
							end
-- END
						end

						-- Player mod actually includes policy mod and World Congress mod, so separate them for tooltip

						gpChangePlayerMod = gpChangePlayerMod - gpChangePolicyMod - gpChangeWorldCongressMod

					elseif gpuClass == "UNITCLASS_SCIENTIST" then

						gpChangePlayerMod = gpChangePlayerMod + cityOwner:GetTraitGreatScientistRateModifier()

					end

					local gpChangeMod = gpChangePlayerMod + gpChangePolicyMod + gpChangeWorldCongressMod + gpChangeCityMod + gpChangeGoldenAgeMod + gpChangeMonopolyMod
					gpChange = (gpChangeMod / 100 + 1) * gpChange

					if gpProgress > 0 or gpChange > 0 then
						local instance = g_GreatPeopleIM.GetInstance()
						local percent = gpProgress / gpThreshold
						instance.GPMeter:SetPercent( percent )
						local labelText = L(unitClass.Description)
						local icon = GreatPeopleIcon(gpuClass)
						local tips = table( "[COLOR_YIELD_FOOD]" .. Locale.ToUpper( labelText ) .. "[ENDCOLOR]"
									.. " " .. gpProgress .. icon .." / " .. gpThreshold .. icon )
	--					tips:insert( L( "TXT_KEY_PROGRESS_TOWARDS", "[COLOR_YIELD_FOOD]" .. Locale.ToUpper( labelText ) .. "[ENDCOLOR]" )
						if gpChange > 0 then
							local gpTurns = math_ceil( (gpThreshold - gpProgress) / gpChange )
							tips:insert( "[COLOR_YIELD_FOOD]" .. Locale.ToUpper( L( "TXT_KEY_STR_TURNS", gpTurns ) ) .. "[ENDCOLOR]  "
										 .. gpChange .. icon .. " " .. L"TXT_KEY_GOLD_PERTURN_HEADING4_TITLE" )
							labelText = labelText .. ": " .. Locale.ToLower( L( "TXT_KEY_STR_TURNS", gpTurns ) )
							instance.GreatPersonLabel:SetText( icon..string.format("%+.1f", gpChange).." [ICON_SWAP]"..gpTurns )
						else
							instance.GreatPersonLabel:SetText( icon )
						end
						if gk_mode then
							if gpChangePlayerMod ~= 0 then
								tips:insert( L( "TXT_KEY_PLAYER_GP_MOD", gpChangePlayerMod ) )
							end
							if gpChangeMonopolyMod ~= 0 then
								tips:insert( L( "TXT_KEY_MONOPOLY_GP_MOD", gpChangeMonopolyMod ) )
							end
							if gpChangePolicyMod ~= 0 then
								tips:insert( L( "TXT_KEY_POLICY_GP_MOD", gpChangePolicyMod ) )
							end
							if gpChangeCityMod ~= 0 then
								tips:insert( L( "TXT_KEY_CITY_GP_MOD", gpChangeCityMod ) )
							end
							if gpChangeGoldenAgeMod ~= 0 then
								tips:insert( L( "TXT_KEY_GOLDENAGE_GP_MOD", gpChangeGoldenAgeMod ) )
							end
							if gpChangeWorldCongressMod ~= 0 then
								if gpChangeWorldCongressMod < 0 then
									tips:insert( L( "TXT_KEY_WORLD_CONGRESS_NEGATIVE_GP_MOD", gpChangeWorldCongressMod ) )
								else
									tips:insert( L( "TXT_KEY_WORLD_CONGRESS_POSITIVE_GP_MOD", gpChangeWorldCongressMod ) )
								end
							end
						elseif gpChangeMod ~= 0 then
							tips:insert( "[ICON_BULLET] "..gpChangeMod..icon )
						end
						instance.GPBox:SetToolTipString( tips:concat("[NEWLINE]") )
						instance.GPBox:SetVoid1( unitClass.ID )
						instance.GPBox:RegisterCallback( Mouse.eRClick, UnitClassPedia )

						--local portraitOffset, portraitAtlas = UI_GetUnitPortraitIcon( GameInfoTypes[ unitClass.DefaultUnit ], cityOwnerID )
						--instance.GPImage:SetHide(not IconHookup( portraitOffset, 64, portraitAtlas, instance.GPImage ) )
					end
				end
			end
			g_GreatPeopleIM.Commit()
		end

		----------------------------
		-- Maggi: Specialist Control Box --
		----------------------------
		local numSS = 0;
		local specialistSlotTable = {};
		g_SpecialistIconIM:ResetInstances();
		g_SpecialistSlotIM:ResetInstances();

		--Build Table
		for building in GameInfo.Buildings() do
			local buildingID = building.ID;
			local buildingSC = building.SpecialistCount;
			if buildingSC > 0 and (city:IsHasBuilding(buildingID)) then
				local buildingST = building.SpecialistType;
				local buildingFC = city:GetNumSpecialistsInBuilding(buildingID);
				for i = 1,buildingSC do
					numSS = numSS + 1;
					local isFilled = not(i > buildingFC);
					specialistSlotTable[numSS] = {ID = numSS, Type = buildingST, Building = buildingID, Slot = i, Filled = isFilled, Locked = not(i>city:GetNumForcedSpecialistsInBuilding (buildingID))};
					--print("Slot Added - ID: "..(specialistSlotTable[numSS].ID).." Type: "..(specialistSlotTable[numSS].Type).." Building: "..(specialistSlotTable[numSS].Building).." Slot: "..(specialistSlotTable[numSS].Slot).." Filled: "..tostring(specialistSlotTable[numSS].Filled));
				end
			end
		end

		local SlotX = 32;
		local SlotY = 2;
		local IconX = 0;
		local IconY = 2;
		local SCount = 0;

		if numSS > 0 then
			Controls.SpecialistsHeader:SetHide( false );
			Controls.SpecialistsBox:SetHide( false );
			Controls.SpecialistsControlBox:SetHide( g_isViewingMode );
		--	Controls.SpecialistHeader:RegisterCallback( Mouse.eLClick, OnSpecialistHeaderSelected );
		--	if specialistHeadingOpen then
		--		Controls.SpecialistBox:SetHide( false );
		--		Controls.SpecialistControlBox:SetHide( false );
				for pSpecialistInfo in GameInfo.Specialists() do
					local STCount = 0;
					local pSIType = pSpecialistInfo.Type;
					local gpuClass = pSpecialistInfo.GreatPeopleUnitClass;
					local icon = GreatPeopleIcon(gpuClass);
					--local iSpecialistID = pSpecialistInfo.ID;
					--print("Building Slots for "..pSIType);
					IconY = SlotY;
					for slot = 1, numSS do
						if specialistSlotTable[slot].Type == pSIType then
							slotid = specialistSlotTable[slot].ID;
							slotbuilding = specialistSlotTable[slot].Building;
							slotfilled = specialistSlotTable[slot].Filled;
							slotnum = specialistSlotTable[slot].Slot;
							STCount = STCount + 1;
							SCount = SCount + 1;
							controlTable = g_SpecialistSlotIM:GetInstance();
							controlTable.SpecialistSlotButton:SetOffsetX(SlotX);
							controlTable.SpecialistSlotButton:SetOffsetY(SlotY);
							--print(pSIType.." at "..SlotX..", "..SlotY);
							controlTable.EmptySpecialistSlot:SetHide(slotfilled);
							controlTable.FilledSpecialistSlot:SetHide(not(slotfilled));
							controlTable.LockedSlot:SetHide(not(specialistSlotTable[slot].Locked));
							local emptySlotString = Locale.ConvertTextKey("TXT_KEY_CITYVIEW_EMPTY_SLOT");
							--local specialistName = Locale.ConvertTextKey(pSpecialistInfo.Description);
							local employedAt = Locale.ConvertTextKey("TXT_KEY_CITYVIEW_EMPLOYED_AT",pSpecialistInfo.Description,GameInfo.Buildings[slotbuilding].Description);
							local ToolTipString = employedAt .."[NEWLINE] ";
							--local employedAt = Locale.ConvertTextKey("TXT_KEY_CITYVIEW_EMPLOYED_AT");
							--local ToolTipString = specialistName .. " " .. employedAt .. " " .. Locale.ConvertTextKey(GameInfo.Buildings[slotbuilding].Description) .."[NEWLINE] ";
		--					-- Culture unneeded with CivUP
							--local iCultureFromSpecialist = city:GetCultureFromSpecialist(iSpecialistID);
							--if (iCultureFromSpecialist > 0) then
								--ToolTipString = ToolTipString .. " +" .. iCultureFromSpecialist .. "[ICON_CULTURE]";
							--end
							--for pYieldInfo in GameInfo.Yields() do
							--	local iYieldID = pYieldInfo.ID;
							--	local iYieldAmount = city:GetSpecialistYield(iSpecialistID, iYieldID);
							--	iYieldAmount = iYieldAmount + Players[city:GetOwner()]:GetSpecialistExtraYield(iSpecialistID, iYieldID);
							--	if (iYieldAmount > 0) then
									--ToolTipString = ToolTipString .. " +" .. iYieldAmount .. pYieldInfo.IconString;
							--	end
							--end
							--if pSpecialistInfo.GreatPeopleRateChange > 0 then
								--ToolTipString = ToolTipString .. " +" .. pSpecialistInfo.GreatPeopleRateChange .. icon;
							--end
							ToolTipString = ToolTipString .. GetSpecialistYields( UI_GetHeadSelectedCity(), pSpecialistInfo );
							controlTable.FilledSpecialistSlot:SetToolTipString(ToolTipString);
							ToolTipString = emptySlotString.."[NEWLINE]("..ToolTipString..")";
							controlTable.EmptySpecialistSlot:SetToolTipString(ToolTipString);
							local filledSlotTexture = g_slotTexture[pSIType];
							--local lockedSlotTexture = g_lockedslotTexture[pSIType];
							controlTable.FilledSpecialistSlot:SetTexture(filledSlotTexture);
							controlTable.FilledSpecialistSlot:RegisterCallback( Mouse.eLClick, RemoveSpecialist );
							--pediaSearchStrings[tostring(controlTable.FilledSpecialistSlot)] = specialistName;
							controlTable.FilledSpecialistSlot:RegisterCallback( Mouse.eRClick, SpecialistPedia );
							controlTable.EmptySpecialistSlot:RegisterCallback( Mouse.eRClick, SpecialistPedia );
							controlTable.FilledSpecialistSlot:SetVoids( slotbuilding, slotnum);
							controlTable.EmptySpecialistSlot:RegisterCallback( Mouse.eLClick, AddSpecialist );
							controlTable.EmptySpecialistSlot:SetVoids( slotbuilding, slotnum);
							if (UI.IsCityScreenViewingMode()) then
								controlTable.FilledSpecialistSlot:RegisterCallback( Mouse.eLClick, DisableSpecialist );
								controlTable.EmptySpecialistSlot:RegisterCallback( Mouse.eLClick, DisableSpecialist );
							else
								controlTable.FilledSpecialistSlot:RegisterCallback( Mouse.eLClick, RemoveSpecialist );
								controlTable.EmptySpecialistSlot:RegisterCallback( Mouse.eLClick, AddSpecialist );
							end
							SlotX = SlotX + 32;

							if SlotX > 250 then
								SlotX =  32;
								SlotY = SlotY + 32;
							end
						end
					end
					if STCount > 0 then
						controlTable = g_SpecialistIconIM:GetInstance();
						controlTable.SpecialistIconButton:SetOffsetX(IconX);
						controlTable.SpecialistIconButton:SetOffsetY(IconY);
						local localizedLabel = icon;
						controlTable.SpecialistIcon:SetText(localizedLabel);
						--print(localizedLabel.." at "..IconX..", "..IconY);
						if SlotX ~= 32 then
							SlotX = 32;
							SlotY = SlotY + 32;
						end
					end
				end
				if SCount > 0 then
					local frameSize = {};
					local h = SlotY + 2;
					frameSize.x = 254;
					frameSize.y = h;
					Controls.SpecialistsBox:SetSize( frameSize );
				end
		--	else
		--		Controls.SpecialistBox:SetHide( true );
		--		Controls.SpecialistControlBox:SetHide( true );
		--	end
		else
			Controls.SpecialistsHeader:SetHide( true );
			Controls.SpecialistsBox:SetHide( true );
			Controls.SpecialistsControlBox:SetHide( true );
			Controls.ResetSpecialistsButton:SetHide( true )
			Controls.ResetSpecialistsFooter:SetHide( true )
		end

		--print("Made it through specialists");

		-----------------------------
		-- Infixo: Great Works Box --
		-----------------------------
		local totalGreatWorkCount = 0;
		g_GreatWorksSlotIM:ResetInstances();
		local greatWorksData = {
			["GREAT_WORK_SLOT_ART_ARTIFACT"] = {},
			["GREAT_WORK_SLOT_LITERATURE"] = {},
			["GREAT_WORK_SLOT_MUSIC"] = {},
		}
		-- Build table of GWs
		for building in GameInfo.Buildings() do
			local buildingGreatWorkCount = civ5bnw_mode and building.GreatWorkCount or 0
			local buildingGreatWorkSlotType = building.GreatWorkSlotType -- GREAT_WORK_SLOT_ART_ARTIFACT / GREAT_WORK_SLOT_MUSIC / GREAT_WORK_SLOT_LITERATURE
			if buildingGreatWorkCount > 0 and buildingGreatWorkSlotType and city:IsHasBuilding(building.ID) then
				totalGreatWorkCount = totalGreatWorkCount + buildingGreatWorkCount
				local buildingGreatWorkSlot = GameInfo.GreatWorkSlots[ buildingGreatWorkSlotType ]
				local buildingClassID = GameInfoTypes[ building.BuildingClass ]
				local sThemingBonus = ""
				if city:IsThemingBonusPossible( buildingClassID ) then sThemingBonus = city:GetThemingBonus( buildingClassID ) end
				--[[ THEMING BONUS???
				if city:IsThemingBonusPossible( buildingClassID ) then
					textButton:SetText( " +" .. city:GetThemingBonus( buildingClassID ) )
					textButton:SetVoid1( buildingClassID )
					textButton:SetHide( false )
				end
				--]]
				for i = 0, buildingGreatWorkCount - 1 do
					local greatWorkData = {}
					greatWorkData.BuildingID = building.ID
					greatWorkData.BuildingDescription = building.Description
					greatWorkData.ThemingBonus = sThemingBonus
					greatWorkData.GreatWorkID = city:GetBuildingGreatWork( buildingClassID, i )
					greatWorkData.GreatWorkSlotID = buildingGreatWorkSlot.ID
					if greatWorkData.GreatWorkID >= 0 then
						greatWorkData.IsFilled = true
						--Artifact Workaround
						local greatWork = GameInfo.GreatWorks[ Game.GetGreatWorkType( greatWorkData.GreatWorkID or -1 ) or -1 ]
						if greatWork and greatWork.GreatWorkClassType == "GREAT_WORK_ARTIFACT" then
							greatWorkData.Icon = "GreatWorks_Artifact.dds"
						else
							greatWorkData.Icon = buildingGreatWorkSlot.FilledIcon
						end
					else
						greatWorkData.IsFilled = false
						greatWorkData.Icon = buildingGreatWorkSlot.EmptyIcon
					end
					table.insert(greatWorksData[buildingGreatWorkSlotType], greatWorkData);
				end -- great works in a building
			end -- greatWorkCount > 0
		end -- GameInfo.Buildings

		-- show or hide the box
		--print("SHOW/HIDE")
		Controls.GreatWorksHeader:SetHide( totalGreatWorkCount == 0 )
		Controls.GreatWorksBox:SetHide( totalGreatWorkCount == 0 )
		-- create slots and put them into the box
		local slotX, slotY = 0, 0
		--print("FOUND #gw in city", totalGreatWorkCount, city:GetName())
		for gwt, gwall in pairs(greatWorksData) do -- 3 types
			--print("GW TYPE:", gwt, #gwall);
			for i, gwdata in pairs(gwall) do -- specific type
				--print("  GW num#", i)
				if slotX == 7 then slotX = 0; slotY = slotY + 1; end
				-- create an instance
				gwInstance = g_GreatWorksSlotIM:GetInstance();
				--print("gwInstance", gwInstance);
				-- content
				gwInstance.Button:SetOffsetX(8 + slotX * 34);
				gwInstance.Button:SetOffsetY(2 + slotY * 34);
				gwInstance.Button:SetTexture(gwdata.Icon);
				-- callbacks
				gwInstance.Button:SetVoids( gwdata.GreatWorkID, gwdata.GreatWorkSlotID )
				gwInstance.Button:RegisterCallback( Mouse.eMouseEnter,  g_gwCallbacks.tooltip) -- GreatWorkTooltip
				gwInstance.Button:RegisterCallback( Mouse.eLClick,  g_gwCallbacks.culture) -- YourCulturePopup
				if gwdata.IsFilled then gwInstance.Button:RegisterCallback( Mouse.eRClick, g_gwCallbacks.gwpopup ) -- GreatWorkPopup
				else                    gwInstance.Button:ClearCallback( Mouse.eRClick ) end
				-- DEBUG
				--for k,v in pairs(gwdata) do
					--if type(v) == "string" and v then print("    (k,v)",k,v,Locale.ConvertTextKey(v))
					--else print("    (k,v)",k,v) end
				--end
				slotX = slotX + 1
			end
		end
		-- resize the box
		if totalGreatWorkCount > 0 then
			Controls.GreatWorksBox:SetSize( { x = 254, y = (slotY+1) * 34 + 4} );
		end


		-------------------------------------------
		-- Buildings
		-------------------------------------------

		local greatWorkBuildings = table()
		local specialistBuildings = table()
		local wonders = table()
		local corps = table()
		local otherBuildings = table()
		local noWondersWithSpecialistInThisCity = true
		local HasForcedSpecialists = false

		for building in GameInfo.Buildings() do
			local buildingID = building.ID
			if city:IsHasBuilding(buildingID) then
				local buildingClass = GameInfo.BuildingClasses[ building.BuildingClass ]
				local buildings
				local greatWorkCount = civ5bnw_mode and building.GreatWorkCount or 0
				local corporation = building.IsCorporation
				local areSpecialistsAllowedByBuilding = city:GetNumSpecialistsAllowedByBuilding(buildingID) > 0

				if (corporation) then
					buildings = corps
				elseif buildingClass.MaxGlobalInstances > 0
				or buildingClass.MaxTeamInstances > 0
				or ( buildingClass.MaxPlayerInstances == 1 and not areSpecialistsAllowedByBuilding )
				then
					buildings = wonders
					if areSpecialistsAllowedByBuilding then
						noWondersWithSpecialistInThisCity = false
					end
				elseif areSpecialistsAllowedByBuilding then
					buildings = specialistBuildings
				elseif greatWorkCount > 0 then
					buildings = greatWorkBuildings
				elseif greatWorkCount == 0 then		-- compatibility with Firaxis code exploit for invisibility
					buildings = otherBuildings
				end
				if buildings then
					buildings:insert{ building, L(building.Description), greatWorkCount, areSpecialistsAllowedByBuilding and GameInfoTypes[building.SpecialistType] or 999 }
				end
				if not HasForcedSpecialists and city:GetNumForcedSpecialistsInBuilding(buildingID) > 0 then
					HasForcedSpecialists = true
				end
				Controls.ResetSpecialistsButton:SetHide( not HasForcedSpecialists )
				Controls.ResetSpecialistsFooter:SetHide( not HasForcedSpecialists )
			end
		end
		local strMaintenanceTT = L( "TXT_KEY_BUILDING_MAINTENANCE_TT", city:GetTotalBaseBuildingMaintenance() )
		Controls.SpecialBuildingsHeader:SetToolTipString(strMaintenanceTT)

		local freeSpecialists = city:GetRemainingFreeSpecialists();
		if(freeSpecialists > 0) then
			Controls.FreeSpecialistLabel:SetText(tostring(freeSpecialists))
			--Update suffix to use correct plurality.
			Controls.FreeSpecialistLabelSuffix:LocalizeAndSetText( "TXT_KEY_CITYVIEW_FREESPECIALIST_TEXT", freeSpecialists )
		else
			local defSpecialist = (GameDefines.UNHAPPINESS_PER_SPECIALIST / 100)
			Controls.FreeSpecialistLabel:SetText(tostring(defSpecialist))
			--Update suffix to use correct plurality.
			Controls.FreeSpecialistLabelSuffix:LocalizeAndSetText("TXT_KEY_CITYVIEW_NOFREESPECIALIST_TEXT")
		end

		Controls.BuildingsHeader:SetToolTipString(strMaintenanceTT)
		Controls.CorpsHeader:SetToolTipString(strMaintenanceTT)
		Controls.GreatWorkHeader:SetToolTipString(strMaintenanceTT)
--		Controls.SpecialistControlBox:SetHide( #specialistBuildings < 1 )
--		Controls.SpecialistControlBox2:SetHide( noWondersWithSpecialistInThisCity )

		SetupBuildingList( city, specialistBuildings, g_SpecialBuildingsIM )
		SetupBuildingList( city, wonders, g_WondersIM )
		SetupBuildingList( city, corps, g_CorpsIM )
		SetupBuildingList( city, greatWorkBuildings, g_GreatWorkIM )
		SetupBuildingList( city, otherBuildings, g_BuildingsIM )

		ResizeRightStack()

		-------------------------------------------
		-- Buying Plots
		-------------------------------------------
--		szText = L"TXT_KEY_CITYVIEW_BUY_TILE"
--		Controls.BuyPlotButton:LocalizeAndSetToolTip( "TXT_KEY_CITYVIEW_BUY_TILE_TT" )
--		Controls.BuyPlotText:SetText(szText)
--		Controls.BuyPlotButton:SetDisabled( g_isViewingMode or (GameDefines.BUY_PLOTS_DISABLED ~= 0 and city:CanBuyAnyPlot()) )

		-------------------------------------------
		-- Resource Demanded
		-------------------------------------------
		local weLoveTheKingDayCounter = city:GetWeLoveTheKingDayCounter()
		if weLoveTheKingDayCounter > 0 then
			--- CBP
			if(cityOwner:IsGPWLTKD()) then
				Controls.ResourceDemandedString:LocalizeAndSetText( "TXT_KEY_CITYVIEW_WLTKD_COUNTER_UA", weLoveTheKingDayCounter )
				Controls.ResourceDemandedBox:LocalizeAndSetToolTip( "TXT_KEY_CITYVIEW_RESOURCE_FULFILLED_TT_UA" )
			elseif(cityOwner:IsCarnaval())then
				Controls.ResourceDemandedString:LocalizeAndSetText( "TXT_KEY_CITYVIEW_WLTKD_COUNTER_UA_CARNAVAL", weLoveTheKingDayCounter )
				Controls.ResourceDemandedBox:LocalizeAndSetToolTip( "TXT_KEY_CITYVIEW_RESOURCE_FULFILLED_TT_UA_CARNAVAL" )
			else
			-- END
				Controls.ResourceDemandedString:LocalizeAndSetText( "TXT_KEY_CITYVIEW_WLTKD_COUNTER", weLoveTheKingDayCounter )
				Controls.ResourceDemandedBox:LocalizeAndSetToolTip( "TXT_KEY_CITYVIEW_RESOURCE_FULFILLED_TT" )
			--CBP
			end
			-- END
			Controls.ResourceDemandedBox:SetHide(true)
		elseif(city:GetResourceDemanded(true) ~= -1) then
			local resourceInfo = GameInfo.Resources[ city:GetResourceDemanded() ]
			--CBP
			Controls.ResourceDemandedString:LocalizeAndSetText( "TXT_KEY_CITYVIEW_RESOURCE_DEMANDED", resourceInfo.IconString .. " " .. L(resourceInfo.Description) )
			if(cityOwner:IsGPWLTKD()) then
				Controls.ResourceDemandedBox:LocalizeAndSetToolTip( "TXT_KEY_CITYVIEW_RESOURCE_DEMANDED_TT_UA" )
			elseif(cityOwner:IsCarnaval())then
				Controls.ResourceDemandedBox:LocalizeAndSetToolTip("TXT_KEY_CITYVIEW_RESOURCE_DEMANDED_TT_UA_CARNAVAL" )
			else
			-- END
				Controls.ResourceDemandedBox:LocalizeAndSetToolTip( "TXT_KEY_CITYVIEW_RESOURCE_DEMANDED_TT" )
			-- CBP
			end
			-- END
			Controls.ResourceDemandedBox:SetSizeX(Controls.ResourceDemandedString:GetSizeX() + 10)
			Controls.ResourceDemandedBox:SetHide(false)
		else
			-- END
			Controls.ResourceDemandedBox:SetHide(true)
		end

		Controls.IconsStack:CalculateSize()
		Controls.IconsStack:ReprocessAnchoring()

		Controls.NotificationStack:CalculateSize()
		Controls.NotificationStack:ReprocessAnchoring()

		-------------------------------------------
		-- Raze / Unraze / Annex City Buttons
		-------------------------------------------

		local buttonToolTip, buttonLabel, taskID
		if isActivePlayerCity then
			-- Currently razing? Can unraze!
			if city:IsRazing() then
				taskID = TaskTypes.TASK_UNRAZE
				buttonLabel = L"TXT_KEY_CITYVIEW_UNRAZE_BUTTON_TEXT"
				buttonToolTip = L"TXT_KEY_CITYVIEW_UNRAZE_BUTTON_TT"
			-- Puppet? Venice can raze, others can annex.
			elseif city:IsPuppet() then
				if (bnw_mode and cityOwner:MayNotAnnex()) then
					if cityOwner:CanRaze(city, true) then
						buttonLabel = L"TXT_KEY_CITYVIEW_RAZE_BUTTON_TEXT"

						if cityOwner:CanRaze(city, false) then
							-- We can actually raze this city
							taskID = TaskTypes.TASK_RAZE
							buttonToolTip = L"TXT_KEY_CITYVIEW_RAZE_BUTTON_TT"
						else
							-- We COULD raze this city if it weren't a capital
							buttonToolTip = L"TXT_KEY_CITYVIEW_RAZE_BUTTON_DISABLED_BECAUSE_CAPITAL_TT"
						end
					end
				else
					-- We can annex this city
					taskID = TaskTypes.TASK_ANNEX_PUPPET
					buttonLabel = L"TXT_KEY_POPUP_ANNEX_CITY"
					if civ5_mode then
						buttonToolTip = L( "TXT_KEY_POPUP_CITY_CAPTURE_INFO_ANNEX", cityOwner:GetUnhappinessForecast(city) - cityOwner:GetUnhappiness() )
					end
				end
			elseif cityOwner:CanRaze(city, true) then
				buttonLabel = L"TXT_KEY_CITYVIEW_RAZE_BUTTON_TEXT"

				if cityOwner:CanRaze(city, false) then
					-- We can actually raze this city
					taskID = TaskTypes.TASK_RAZE
					buttonToolTip = L"TXT_KEY_CITYVIEW_RAZE_BUTTON_TT"
				else
					-- We COULD raze this city if it weren't a capital
					buttonToolTip = L"TXT_KEY_CITYVIEW_RAZE_BUTTON_DISABLED_BECAUSE_CAPITAL_TT"
				end
			end
		end
		local CityTaskButton = Controls.CityTaskButton
		CityTaskButton:SetText( buttonLabel )
		CityTaskButton:SetVoids( cityID, taskID )
		CityTaskButton:SetToolTipString( buttonToolTip )
		CityTaskButton:SetDisabled( not taskID )
		CityTaskButton:SetHide( not buttonLabel )

		UpdateWorkingHexesNow()
		UpdateCityProductionQueueNow( city, cityID, cityOwnerID, isActivePlayerCity and not isCityCaptureViewingMode and civ5_mode and bnw_mode and cityOwner:MayNotAnnex() and city:IsPuppet() )

		-- display gold income
		local iGoldPerTurn = city:GetYieldRateTimes100( g_yieldCurrency ) / 100
		Controls.GoldPerTurnLabel:LocalizeAndSetText( "TXT_KEY_CITYVIEW_PERTURN_TEXT", iGoldPerTurn )

		-- display science income
		if Game.IsOption(GameOptionTypes.GAMEOPTION_NO_SCIENCE) then
			Controls.SciencePerTurnLabel:LocalizeAndSetText( "TXT_KEY_CITYVIEW_OFF" )
		else
			local iSciencePerTurn = city:GetYieldRateTimes100(YieldTypes.YIELD_SCIENCE) / 100
			Controls.SciencePerTurnLabel:LocalizeAndSetText( "TXT_KEY_CITYVIEW_PERTURN_TEXT", iSciencePerTurn )
		end

		local culturePerTurn, cultureStored, cultureNext
		-- thanks for Firaxis Cleverness !
		if civ5_mode then
			culturePerTurn = city:GetJONSCulturePerTurn()
			cultureStored = city:GetJONSCultureStored()
			cultureNext = city:GetJONSCultureThreshold()
		else
			culturePerTurn = city:GetCulturePerTurn()
			cultureStored = city:GetCultureStored()
			cultureNext = city:GetCultureThreshold()
		end
		Controls.CulturePerTurnLabel:LocalizeAndSetText( "TXT_KEY_CITYVIEW_PERTURN_TEXT", culturePerTurn )
		local cultureDiff = cultureNext - cultureStored
		local borderGrowthRate = culturePerTurn + city:GetBaseYieldRate(YieldTypes.YIELD_CULTURE_LOCAL)
		local borderGrowthRateIncrease = city:GetBorderGrowthRateIncreaseTotal()
		borderGrowthRate = math_floor(borderGrowthRate * (100 + borderGrowthRateIncrease) / 100)
		if borderGrowthRate > 0 then
			local math_ceil = math.ceil
			local math_max = math.max
			local cultureTurns = math_max(math_ceil(cultureDiff / borderGrowthRate), 1)
			Controls.CultureTimeTillGrowthLabel:LocalizeAndSetText( "TXT_KEY_CITYVIEW_TURNS_TILL_TILE_TEXT", cultureTurns )
			Controls.CultureTimeTillGrowthLabel:SetHide( false )
		else
			Controls.CultureTimeTillGrowthLabel:SetHide( true )
		end
		local percentComplete = cultureStored / cultureNext
		Controls.CultureMeter:SetPercent( percentComplete )

		if gk_mode then
			if Game.IsOption(GameOptionTypes.GAMEOPTION_NO_RELIGION) then
				Controls.FaithPerTurnLabel:LocalizeAndSetText( "TXT_KEY_CITYVIEW_OFF" )
			else
				Controls.FaithPerTurnLabel:LocalizeAndSetText( "TXT_KEY_CITYVIEW_PERTURN_TEXT", city:GetFaithPerTurn() )
			end
			Controls.FaithFocusButton:SetDisabled( g_isViewingMode )
		end

		local cityGrowth = city:GetFoodTurnsLeft()
		local foodPerTurnTimes100 = city:FoodDifferenceTimes100()
		if city:IsFoodProduction() or foodPerTurnTimes100 == 0 then
			Controls.CityGrowthLabel:LocalizeAndSetText( "TXT_KEY_CITYVIEW_STAGNATION_TEXT" )
		elseif foodPerTurnTimes100 < 0 then
			Controls.CityGrowthLabel:LocalizeAndSetText( "TXT_KEY_CITYVIEW_STARVATION_TEXT" )
		else
			Controls.CityGrowthLabel:LocalizeAndSetText( "TXT_KEY_CITYVIEW_TURNS_TILL_CITIZEN_TEXT", cityGrowth )
		end

		Controls.FoodPerTurnLabel:LocalizeAndSetText( foodPerTurnTimes100 >= 0 and "TXT_KEY_CITYVIEW_PERTURN_TEXT" or "TXT_KEY_CITYVIEW_PERTURN_TEXT_NEGATIVE", foodPerTurnTimes100 / 100 )

		-------------------------------------------
		-- Disable Buttons as Appropriate
		-------------------------------------------
		local bIsLock = g_isViewingMode or (cityOwner:GetNumCities() <= 1)
		Controls.PrevCityButton:SetDisabled( bIsLock )
		Controls.NextCityButton:SetDisabled( bIsLock )

		Controls.BalancedFocusButton:SetDisabled( g_isViewingMode )
		Controls.FoodFocusButton:SetDisabled( g_isViewingMode )
		Controls.ProductionFocusButton:SetDisabled( g_isViewingMode )
		Controls.GoldFocusButton:SetDisabled( g_isViewingMode )
		Controls.ResearchFocusButton:SetDisabled( g_isViewingMode )
		Controls.CultureFocusButton:SetDisabled( g_isViewingMode )
		Controls.GPFocusButton:SetDisabled( g_isViewingMode )

		Controls.AvoidGrowthButton:SetDisabled( g_isViewingMode )
		Controls.ResetButton:SetDisabled( g_isViewingMode )

		Controls.BoxOSlackers:SetDisabled( g_isViewingMode )

		Controls.EditButton:SetHide( g_isViewingMode )
	end
end

local function UpdateStuffNow()
--	if IsGameCoreBusy() then
--		return
--	end
	ContextPtr:ClearUpdate()
	if g_isCityViewDirty then
		UpdateCityViewNow()
	end
	if g_isCityHexesDirty then
		UpdateWorkingHexesNow()
	end
end
UpdateCityView = function()
	g_isCityViewDirty = true
	return ContextPtr:SetUpdate( UpdateStuffNow )
end
local function UpdateWorkingHexes()
	g_isCityHexesDirty = true
	return ContextPtr:SetUpdate( UpdateStuffNow )
end

local function UpdateOptionsAndCityView()
	g_isAdvisor = not ( g_options and g_options.GetValue and g_options.GetValue( "CityAdvisor" ) == 0 )
	g_isAutoClose = not ( g_options and g_options.GetValue and g_options.GetValue( "AutoClose" ) == 0 )
	g_FocusSelectIM.Collapse( not OptionsManager.IsNoCitizenWarning() )
	Controls.BuyPlotCheckBox:SetCheck( g_BuyPlotMode )
	return UpdateCityView()
end

g_SpecialBuildingsIM	= StackInstanceManager( "BuildingInstance", "Button", Controls.SpecialBuildingsStack, Controls.SpecialBuildingsHeader, ResizeRightStack )
g_GreatWorkIM		= StackInstanceManager( "BuildingInstance", "Button", Controls.GreatWorkStack, Controls.GreatWorkHeader, ResizeRightStack )
g_WondersIM		= StackInstanceManager( "BuildingInstance", "Button", Controls.WondersStack, Controls.WondersHeader, ResizeRightStack )
g_CorpsIM		= StackInstanceManager( "BuildingInstance", "Button", Controls.CorpsStack, Controls.CorpsHeader, ResizeRightStack )
g_BuildingsIM		= StackInstanceManager( "BuildingInstance", "Button", Controls.BuildingsStack, Controls.BuildingsHeader, ResizeRightStack )
g_GreatPeopleIM		= StackInstanceManager( "GPInstance", "GPBox", Controls.GPStack, Controls.GPHeader, ResizeRightStack )
g_SlackerIM		= StackInstanceManager( "Slot", "Button", Controls.SlackerStack, Controls.SlackerHeader, ResizeRightStack )
g_ProdQueueIM		= StackInstanceManager( "ProductionInstance", "PQbox", Controls.QueueStack, Controls.ProdBox, ResizeProdQueue, true )
g_UnitSelectIM		= StackInstanceManager( "SelectionInstance", "Button", Controls.UnitButtonStack, Controls.UnitButton, ResizeProdQueue )
g_GPUnitSelectIM		= StackInstanceManager( "SelectionInstance", "Button", Controls.GPUnitButtonStack, Controls.GPUnitButton, ResizeProdQueue )
g_ReligiousUnitSelectIM		= StackInstanceManager( "SelectionInstance", "Button", Controls.ReligiousUnitButtonStack, Controls.ReligiousUnitButton, ResizeProdQueue )
g_MilitaryUnitSelectIM		= StackInstanceManager( "SelectionInstance", "Button", Controls.MilitaryUnitButtonStack, Controls.MilitaryUnitButton, ResizeProdQueue )
g_LandUnitSelectIM		= StackInstanceManager( "SelectionInstance", "Button", Controls.LandUnitButtonStack, Controls.LandUnitButton, ResizeProdQueue )
g_SeaUnitSelectIM		= StackInstanceManager( "SelectionInstance", "Button", Controls.SeaUnitButtonStack, Controls.SeaUnitButton, ResizeProdQueue )
g_AirUnitSelectIM		= StackInstanceManager( "SelectionInstance", "Button", Controls.AirUnitButtonStack, Controls.AirUnitButton, ResizeProdQueue )
g_BuildingSelectIM	= StackInstanceManager( "SelectionInstance", "Button", Controls.BuildingButtonStack, Controls.BuildingsButton, ResizeProdQueue )
g_ProjectSelectIM	= StackInstanceManager( "SelectionInstance", "Button", Controls.ProjectButtonStack, Controls.ProjectsButton, ResizeProdQueue )
g_NationalWonderSelectIM	= StackInstanceManager( "SelectionInstance", "Button", Controls.NationalWonderButtonStack, Controls.NationalWondersButton, ResizeProdQueue )
g_WonderSelectIM	= StackInstanceManager( "SelectionInstance", "Button", Controls.WonderButtonStack, Controls.WondersButton, ResizeProdQueue )
g_ProcessSelectIM	= StackInstanceManager( "SelectionInstance", "Button", Controls.OtherButtonStack, Controls.OtherButton, ResizeProdQueue )
g_FocusSelectIM		= StackInstanceManager( "", "", Controls.WorkerManagementBox, Controls.WorkerHeader, function(self, collapsed) g_workerHeadingOpen = not collapsed ResizeRightStack() UpdateWorkingHexes() end, true, not g_workerHeadingOpen )
-- Maggi: Specialists
g_SpecialistsIM     = StackInstanceManager("", "", Controls.SpecialistsStack, Controls.SpecialistsHeader, ResizeRightStack)
-- Infixo Great Works
g_GreatWorksIM      = StackInstanceManager("", "", Controls.GreatWorksStack, Controls.GreatWorksHeader, ResizeRightStack)

local function SetToolTipString( toolTipFunc )
	g_leftTipControls.Text:SetText( toolTipFunc( UI_GetHeadSelectedCity() ) )
	g_leftTipControls.PortraitFrame:SetHide( true )
	return g_leftTipControls.Box:DoAutoSize()
end

local g_toolTips = {
	ProdBox = function()
		return SetToolTipString( GetProductionTooltip )
	end,
	FoodBox = function()
		return SetToolTipString( GetFoodTooltip )
	end,
	GoldBox = function()
		return SetToolTipString( GetGoldTooltip )
	end,
	ScienceBox = function()
		return SetToolTipString( GetScienceTooltip )
	end,
	CultureBox = function()
		return SetToolTipString( GetCultureTooltip )
	end,
	FaithBox = function()
		return SetToolTipString( GetFaithTooltip )
	end,
	TourismBox = function()
		return SetToolTipString( GetTourismTooltip )
	end,

-- CBP
	HappinessBox = function()
		return SetToolTipString( GetCityHappinessTooltip )
	end,
	UnhappinessBox = function()
		return SetToolTipString( GetCityUnhappinessTooltip )
	end,
-- END
	ProductionPortraitButton = ProductionToolTip
}
g_toolTips.PopulationBox = g_toolTips.FoodBox
Controls.ProductionPortraitButton:SetVoid1(0)

--------------
-- Rename City
local function RenameCity()
	local city = UI_GetHeadSelectedCity()
	if city then
		return Events.SerialEventGameMessagePopup{
				Type = ButtonPopupTypes.BUTTONPOPUP_RENAME_CITY,
				Data1 = city:GetID(),
				Data2 = -1,
				Data3 = -1,
				Option1 = false,
				Option2 = false
				}
	end
end

----------------
-- Citizen Focus
local FocusButtonBehavior = {
	[Mouse.eLClick] = function( focus )
		local city = GetSelectedModifiableCity()
		if city then
			Network.SendSetCityAIFocus( city:GetID(), focus )
			return Network.SendUpdateCityCitizens( city:GetID() )
		end
	end,
}

local g_callBacks = {
	BalancedFocusButton = FocusButtonBehavior,
	FoodFocusButton = FocusButtonBehavior,
	ProductionFocusButton = FocusButtonBehavior,
	GoldFocusButton = FocusButtonBehavior,
	ResearchFocusButton = FocusButtonBehavior,
	CultureFocusButton = FocusButtonBehavior,
	GPFocusButton = FocusButtonBehavior,
	FaithFocusButton = FocusButtonBehavior,

	AvoidGrowthButton = {
		[Mouse.eLClick] = function()
			local city = GetSelectedModifiableCity()
			if city then
				Network.SendSetCityAvoidGrowth( city:GetID(), not city:IsForcedAvoidGrowth() )
				return Network.SendUpdateCityCitizens( city:GetID() )
			end
		end,
	},
	CityTaskButton = {
		[Mouse.eLClick] = function( cityID, taskID, button )
			local city = GetSelectedCity()
			if city and city:GetID() == cityID then
				return Events.SerialEventGameMessagePopup{
					Type = ButtonPopupTypes.BUTTONPOPUP_CONFIRM_CITY_TASK,
					Data1 = cityID,
					Data2 = taskID,
					Text = button:GetToolTipString()
					}
			end
		end,
	},
	YesButton = {
		[Mouse.eLClick] = function( cityID, buildingID )
			Controls.SellBuildingConfirm:SetHide( true )
			if cityID and buildingID and buildingID > 0 and GetSelectedModifiableCity() then
				Network.SendSellBuilding( cityID, buildingID )
				Network.SendUpdateCityCitizens( cityID )
			end
			return Controls.YesButton:SetVoids( -1, -1 )
		end,
	},
	NoButton = {
		[Mouse.eLClick] = CancelBuildingSale,
	},
	NextCityButton = {
		[Mouse.eLClick] = GotoNextCity,
	},
	PrevCityButton = {
		[Mouse.eLClick] = GotoPrevCity,
	},
	ReturnToMapButton = {
		[Mouse.eLClick] = ExitCityScreen,
	},
	ProductionPortraitButton = {
		[Mouse.eRClick] = ProductionPedia,
	},
	BoxOSlackers = {
		[Mouse.eLClick] = OnSlackersSelected,
	},
	ResetButton = {
		[Mouse.eLClick] = PlotButtonClicked,
	},
	NoAutoSpecialistCheckbox = {
		[Mouse.eLClick] = function()
			return Game.SelectedCitiesGameNetMessage(GameMessageTypes.GAMEMESSAGE_DO_TASK, TaskTypes.TASK_NO_AUTO_ASSIGN_SPECIALISTS, -1, -1, not UI_GetHeadSelectedCity():IsNoAutoAssignSpecialists() )
		end,
	},
	ResetSpecialistsButton = {
		[Mouse.eLClick] = function()
			return Game.SelectedCitiesGameNetMessage(GameMessageTypes.GAMEMESSAGE_DO_TASK, TaskTypes.TASK_RESET_SPECIALISTS, -1, -1)
		end,
	},
	EditButton = {
		[Mouse.eLClick] = RenameCity,
	},
	CityNameTitleBarLabel = {
		[Mouse.eRClick] = RenameCity,
	},
}
--g_callBacks.NoAutoSpecialistCheckbox2 = g_callBacks.NoAutoSpecialistCheckbox -- Infixo not used

--Controls.ResetButton:SetVoid1( 0 )	-- calling with 0 = city center causes reset of all forced tiles
--Controls.BoxOSlackers:SetVoids(-1,-1)
--Controls.ProductionPortraitButton:SetVoid1( 0 )
Controls.BalancedFocusButton:SetVoid1( CityAIFocusTypes.NO_CITY_AI_FOCUS_TYPE )
Controls.FoodFocusButton:SetVoid1( CityAIFocusTypes.CITY_AI_FOCUS_TYPE_FOOD )
Controls.ProductionFocusButton:SetVoid1( CityAIFocusTypes.CITY_AI_FOCUS_TYPE_PRODUCTION )
Controls.GoldFocusButton:SetVoid1( g_focusCurrency )
Controls.ResearchFocusButton:SetVoid1( CityAIFocusTypes.CITY_AI_FOCUS_TYPE_SCIENCE )
Controls.CultureFocusButton:SetVoid1( CityAIFocusTypes.CITY_AI_FOCUS_TYPE_CULTURE )
Controls.GPFocusButton:SetVoid1( CityAIFocusTypes.CITY_AI_FOCUS_TYPE_GREAT_PEOPLE )
if gk_mode then
	Controls.FaithFocusButton:SetVoid1( CityAIFocusTypes.CITY_AI_FOCUS_TYPE_FAITH )
end
Controls.GPFocusButton:SetHide( civBE_mode )
Controls.FaithBox:SetHide( civBE_mode or not gk_mode )
Controls.FaithFocusButton:SetHide( civBE_mode or not gk_mode )
Controls.TourismBox:SetHide( not civ5bnw_mode )
-- CBP
Controls.HappinessBox:SetHide(not civ5bnw_mode);
Controls.UnhappinessBox:SetHide(not civ5bnw_mode);

-- END
SetupCallbacks( Controls, g_toolTips, "EUI_CityViewLeftTooltip", g_callBacks )

Controls.BuyPlotCheckBox:RegisterCheckHandler( function( isChecked ) -- Void1, Void2, control )
	g_BuyPlotMode = isChecked
	g_options.SetValue( "CityPlotPurchase", isChecked and 1 or 0 )
	return UpdateCityView()
end )

----------------------------------------------
-- Register Events
----------------------------------------------

Events.SerialEventCityScreenDirty.Add( UpdateCityView )
Events.SerialEventCityInfoDirty.Add( UpdateCityView )
Events.GameOptionsChanged.Add( UpdateOptionsAndCityView )
Events.SerialEventCityHexHighlightDirty.Add( UpdateWorkingHexes )
UpdateOptionsAndCityView()

--------------------------
-- Enter City Screen Event
Events.SerialEventEnterCityScreen.Add(
function()

--	local city = UI_GetHeadSelectedCity()
--	if city then
--		Network.SendUpdateCityCitizens( city:GetID() )
--	end

	LuaEvents.TryQueueTutorial("CITY_SCREEN", true)

	g_queuedItemNumber = false
	g_previousCity = false
--TODO other scroll panels
	Controls.RightScrollPanel:SetScrollValue(0)
end)

-------------------------
-- Exit City Screen Event
Events.SerialEventExitCityScreen.Add(
function()
	Events.ClearHexHighlights()

	-- We may get here after a player change, clear the UI if this is not the active player's city
	local city = UI_GetHeadSelectedCity()
	if not city or city:GetOwner() ~= g_activePlayerID then
		ClearCityUIInfo()
	end
	UI.ClearSelectedCities()
	LuaEvents.TryDismissTutorial("CITY_SCREEN")

	CancelBuildingSale()

	-- Try and re-select the last unit selected
	if not UI.GetHeadSelectedUnit() then
		local unit = UI.GetLastSelectedUnit()
		if unit and unit:MovesLeft() > 0 then
			UI.SelectUnit( unit )
			UI.LookAtSelectionPlot()
		end
	end
	g_isViewingMode = true
	return UI.SetCityScreenViewingMode(false)
end)
if civ5_mode then
	------------------------------------
	-- Strategic View State Change Event
	local NormalWorldPositionOffset = g_worldPositionOffset
	local NormalWorldPositionOffset2 = g_worldPositionOffset2
	local StrategicViewWorldPositionOffset = { x = 0, y = 20, z = 0 }
	Events.StrategicViewStateChanged.Add(
	function( bStrategicView )
		if bStrategicView then
			g_worldPositionOffset = StrategicViewWorldPositionOffset
			g_worldPositionOffset2 = StrategicViewWorldPositionOffset
		else
			g_worldPositionOffset = NormalWorldPositionOffset
			g_worldPositionOffset2 = NormalWorldPositionOffset2
		end
		g_previousCity = false
		return UpdateCityView()
	end)
end
--------------------------------------------
-- 'Active' (local human) player has changed
Events.GameplaySetActivePlayer.Add(
function( activePlayerID )--, previousActivePlayerID )
	g_activePlayerID = activePlayerID
	g_activePlayer = Players[ g_activePlayerID ]
	g_finishedItems = {}
	ClearCityUIInfo()
	if UI.IsCityScreenUp() then
		return ExitCityScreen()
	end
end)

Events.ActivePlayerTurnEnd.Add(
function()
	g_finishedItems = {}
end)

Events.SerialEventGameMessagePopup.Add(
function( popupInfo )
	if popupInfo.Type == ButtonPopupTypes.BUTTONPOPUP_CHOOSEPRODUCTION then
		Events.SerialEventGameMessagePopupProcessed.CallImmediate(ButtonPopupTypes.BUTTONPOPUP_CHOOSEPRODUCTION, 0)
		Events.SerialEventGameMessagePopupShown( popupInfo )

		local cityID = popupInfo.Data1		-- city id
		local orderID = popupInfo.Data2		-- finished order id
		local itemID = popupInfo.Data3		-- finished item id
		local city = cityID and g_activePlayer:GetCityByID( cityID )

		if city and not UI.IsCityScreenUp() then
			if orderID >= 0 and itemID >= 0 then
				g_finishedItems[ cityID ] = { orderID, itemID }
			end
			g_isButtonPopupChooseProduction = g_isAutoClose
			return UI.DoSelectCityAtPlot( city:Plot() )	-- open city screen
		end
	end
end)

Events.NotificationAdded.Add(
function( notificationID, notificationType, toolTip, strSummary, data1, data2, playerID )
	if notificationType == NotificationTypes.NOTIFICATION_PRODUCTION and playerID == g_activePlayerID then
		-- Hack to find city
		for city in g_activePlayer:Cities() do
			if strSummary == L( "TXT_KEY_NOTIFICATION_NEW_CONSTRUCTION", city:GetNameKey() ) then
				if data1 >= 0 and data2 >=0 then
					g_finishedItems[ city:GetID() ] = { data1, data2 }
				end
				if city:GetGameTurnFounded() == Game.GetGameTurn() and not UI.IsCityScreenUp() then
					return UI.DoSelectCityAtPlot( city:Plot() )	-- open city screen
				end
				return
			end
		end
	end
end)
print("OK loaded CityView.lua from 'UI - Improved City View (Vox Populi with EUI)' version 20.0")
print("Finished loading EUI city view",os.clock())
end)

---------------------------------
-- Support for Modded Add-in UI's
---------------------------------
local g_uiAddins = {}
for addin in Modding.GetActivatedModEntryPoints("CityViewUIAddin") do
	local addinFile = Modding.GetEvaluatedFilePath(addin.ModID, addin.Version, addin.File)
	local addinPath = addinFile.EvaluatedPath

	-- Get the absolute path and filename without extension.
	local extension = Path.GetExtension(addinPath)
	local ok, result = pcall( ContextPtr.LoadNewContext, ContextPtr, addinPath:sub( 1, #addinPath - #extension ) )
	if ok then
		table.insert( g_uiAddins, result )
	else
		print( addinPath, result )
	end
end

---------------------------------
-- Auxiliary Functions for Specialists Box
---------------------------------

function AddSpecialist(iBuilding, slot)
	local pCity = UI.GetHeadSelectedCity();

	--[[ VP/LockSpecialist: Disabling this so we can lock specialists without taking full manual control
	-- If Specialists are automated then you can't change things with them
	if (not pCity:IsNoAutoAssignSpecialists()) then
		Game.SelectedCitiesGameNetMessage(GameMessageTypes.GAMEMESSAGE_DO_TASK, TaskTypes.TASK_NO_AUTO_ASSIGN_SPECIALISTS, -1, -1, true);
		Controls.NoAutoSpecialistCheckbox:SetCheck(true);
		if bnw_mode then
			-- Controls.NoAutoSpecialistCheckbox2:SetCheck(true); --Infixo not used
		end
	end]]

	local iSpecialist = GameInfoTypes[GameInfo.Buildings[iBuilding].SpecialistType];

	-- If we can add something, add it
	if (pCity:IsCanAddSpecialistToBuilding(iBuilding)) then
		Game.SelectedCitiesGameNetMessage(GameMessageTypes.GAMEMESSAGE_DO_TASK, TaskTypes.TASK_ADD_SPECIALIST, iSpecialist, iBuilding);
	end

	--g_iCurrentSpecialist = iSpecialist;
	--specialistTable[iBuilding][slot] = true;

end

function RemoveSpecialist(iBuilding, slot)
	local pCity = UI.GetHeadSelectedCity();

	local iNumSpecialistsAssigned = pCity:GetNumSpecialistsInBuilding(iBuilding);

	--[[ VP/LockSpecialist: Disabling this so we can lock specialists without taking full manual control
	-- If Specialists are automated then you can't change things with them
	if (not pCity:IsNoAutoAssignSpecialists()) then
		Game.SelectedCitiesGameNetMessage(GameMessageTypes.GAMEMESSAGE_DO_TASK, TaskTypes.TASK_NO_AUTO_ASSIGN_SPECIALISTS, -1, -1, true);
		Controls.NoAutoSpecialistCheckbox:SetCheck(true);
		if bnw_mode then
			-- Controls.NoAutoSpecialistCheckbox2:SetCheck(true); -- Infixo not used
        end
	end]]

	local iSpecialist = GameInfoTypes[GameInfo.Buildings[iBuilding].SpecialistType];

	-- If we can remove something, remove it
	if pCity:GetNumForcedSpecialistsInBuilding(iBuilding) > 0 then -- old REMOVE_SPECIALIST behavior with a new task, remove player assigned specialist, assigns them to the best plot
		Game.SelectedCitiesGameNetMessage( GameMessageTypes.GAMEMESSAGE_DO_TASK, TaskTypes.TASK_UNSLOT_SPECIALIST, iSpecialist, iBuilding, true )
	elseif (iNumSpecialistsAssigned > 0) then -- new behavior, removes AI assigned specialists and assigns them to the best plot
		Game.SelectedCitiesGameNetMessage(GameMessageTypes.GAMEMESSAGE_DO_TASK, TaskTypes.TASK_UNSLOT_SPECIALIST, iSpecialist, iBuilding, false);
	end

	--g_iCurrentSpecialist = iSpecialist;

	--specialistTable[iBuilding][slot] = false;
end

function DisableSpecialist(iBuilding, slot)
end