-- JFD_Mercenaries_Functions
-- Author: JFD
-- DateCreated: 8/27/2015 5:24:57 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("CommonBehaviors")
include("IconSupport.lua")
include("InfoTooltipInclude.lua")
include("InstanceManager.lua")
include("JFD_MercenariesUtilities.lua")

include("TableSaverLoader016.lua")

tableRoot = JFD_Contracts
tableName = "JFD_Contracts"

include("JFD_Mercenaries_TSLSerializerV3.lua")

TableLoad(tableRoot, tableName)
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
local userSettingMercenariesCoreAICap = JFD_GetUserSetting("JFD_RTP_MERCENARIES_CORE_AI_CAP")
--=======================================================================================================================
-- MERCENARY CONTRACTS
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local activePlayerID = Game.GetActivePlayer()
local activePlayer	 = Players[activePlayerID]
local activeTeamID   = Game.GetActiveTeam()
local activeTeam	 = Teams[activeTeamID]
local convertTextKey = Locale.ConvertTextKey
local mathCeil		 = math.ceil
local mathFloor		 = math.floor
local speedID		 = Game.GetGameSpeedType()
local speedMod		 = ((GameInfo.GameSpeeds[speedID].BuildPercent)/100)

local defaultTurnsExtension = mathCeil(10*speedMod)

local isUsingCPDLL = JFD_IsUsingCPDLL()
------------------------------------------------------------------------------------------------------------------------
-- AI CONTRACT FUNCTIONS
------------------------------------------------------------------------------------------------------------------------
-- JFD_Mercenaries_DoAIContracts
function JFD_Mercenaries_DoAIContracts(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and (not player:IsHuman()) and (not player:IsBarbarian())) then
		local isMercenaryContractsUnlocked = JFD_IsContractsUnlocked(playerID, "CONTRACT_JFD_MERCENARY")
		if (not isMercenaryContractsUnlocked) then return end
		if JFD_GetNumContracts(playerID) >= userSettingMercenariesCoreAICap then return end
		local activePlayerMilitaryUnits = (activePlayer:GetNumMilitaryUnits()*2)
		local militaryUnits = player:GetNumMilitaryUnits()
		if militaryUnits > activePlayerMilitaryUnits then return end
		local goldRate = player:CalculateGoldRate()
		if goldRate < 5 then return end
		local playerTeam = Teams[player:GetTeam()]
		local chanceToConsiderMerc = JFD_GetRandom(1,10)
		local flavourMercenary = 5
		if (not player:IsMinorCiv()) then
			flavourMercenary = JFD_GetLeaderFlavour(playerID, "FLAVOR_JFD_MERCENARY") or 5
		end
		if chanceToConsiderMerc <= flavourMercenary then
			local warCount = playerTeam:GetAtWarCount(true)
			if warCount > 0 then
				local validContracts = {}
				local validContractCount = 1
				for contract in GameInfo.JFD_Contracts() do
					local contractID = contract.ID
					local canHaveContract = JFD_CanHaveContract(playerID, contractID) 
					if canHaveContract then
						validContracts[validContractCount] = contractID
						validContractCount = validContractCount + 1
					end
				end
				if #validContracts > 0 then
					local contractToTakeID = validContracts[JFD_GetRandom(1,#validContracts)]
					if contractToTakeID then
						JFD_SetHasContract(playerID, contractToTakeID, true)
					end
				end
			end
		end		
	end
end
GameEvents.PlayerDoTurn.Add(JFD_Mercenaries_DoAIContracts)
------------------------------------------------------------------------------------------------------------------------
-- CONTRACT FUNCTIONS
------------------------------------------------------------------------------------------------------------------------
local unitContractID = GameInfoTypes["UNIT_JFD_CONTRACT_NOTIFICATION"]

-- JFD_Mercenaries_DoContractMaintenance
function JFD_Mercenaries_DoContractMaintenance(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and (not player:IsBarbarian())) then
		local maintenance = JFD_GetTotalContractMaintenance(playerID)
		if maintenance > 0 then
			player:ChangeGold(-maintenance)
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_Mercenaries_DoContractMaintenance)

-- JFD_Mercenaries_DoContractTurns
function JFD_Mercenaries_DoContractTurns(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and (not player:IsBarbarian())) then
		for contract in GameInfo.JFD_Contracts() do
			local contractID = contract.ID
			local anyoneHasContract = JFD_AnyoneHasContract(contractID)
			if anyoneHasContract then
				if JFD_HasContract(playerID, contractID) then
					local contractTurns = JFD_GetContractTurnsLeft(contractID)
					if contractTurns > 0 then
						local contractDesc = GameInfo.JFD_Contracts[contractID].Description
						if playerID == activePlayerID then
							if contractTurns == mathCeil(5*speedMod) then
								JFD_SendNotification(playerID, "NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER", convertTextKey("TXT_KEY_JFD_CONTRACTS_NOTIFICATION_CONTRACT_IMPENDING_ENDS", contractDesc, contractTurns), convertTextKey("TXT_KEY_JFD_CONTRACTS_NOTIFICATION_CONTRACT_ENDS_SHORT"), false, -1, -1, unitContractID)
							end
						end
						JFD_ChangeContractTurnsLeft(contractID, -1)
						
						local playerGold = player:GetGold()
						local playerGoldRate = player:CalculateGoldRate()
						if (playerGold <= 0 and playerGoldRate < 0) then
							local contractChance = JFD_GetRandom(1,100)
							if contractChance <= contract.MutinyChance then
								JFD_SetHasContract(playerID, contractID, false, false, true)
							elseif contractChance <= contract.DisbandChance then
								JFD_SetHasContract(playerID, contractID, false)
								if playerID == activePlayerID then
									Events.AudioPlay2DSound("AS2D_SOUND_JFD_CONTRACT_DEFAULTED")
									JFD_SendNotification(playerID, "NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER", convertTextKey("TXT_KEY_JFD_CONTRACTS_NOTIFICATION_CONTRACT_DISBANDS", contractDesc, contractTurns), convertTextKey("TXT_KEY_JFD_CONTRACTS_NOTIFICATION_CONTRACT_DISBANDS_SHORT"), false, -1, -1, unitContractID)	
								end
							end
						end
					else
						JFD_SetHasContract(playerID, contractID, false)
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_Mercenaries_DoContractTurns)
------------------------------------------------------------------------------------------------------------------------
-- MERCENARY FUNCTIONS
------------------------------------------------------------------------------------------------------------------------
-- JFD_Mercenaries_MercenaryUnitBlockTraining
local unitGalleyID = GameInfoTypes["UNIT_GALLEY"]
function JFD_Mercenaries_MercenaryUnitBlockTraining(playerID, unitID)
	local player = Players[playerID]
	if (unitID == unitGalleyID and playerID ~= 63) then
		return false
	else
		local unit = GameInfo.Units[unitID]
		local unitMercenary = unit.JFD_OnlyMercenary
		return (not unit.JFD_OnlyMercenary)
	end
	return true
end
GameEvents.PlayerCanTrain.Add(JFD_Mercenaries_MercenaryUnitBlockTraining)

-- JFD_Mercenaries_MercenaryUnitBlockPromotions
function JFD_Mercenaries_MercenaryUnitBlockPromotions(playerID, unitID, promotionID)
	local player = Players[playerID]
	local unitMercenary = JFD_IsUnitMercenary(playerID, unitID)
	return (not unitMercenary)
end
GameEvents.CanHavePromotion.Add(JFD_Mercenaries_MercenaryUnitBlockPromotions)

-- JFD_Mercenaries_MercenaryUnitBlockUpgrades
function JFD_Mercenaries_MercenaryUnitBlockUpgrades(playerID, unitID)
	local player = Players[playerID]
	local unitMercenary = JFD_IsUnitMercenary(playerID, unitID)
	return (not unitMercenary)
end
GameEvents.CanHaveAnyUpgrade.Add(JFD_Mercenaries_MercenaryUnitBlockUpgrades)

-- JFD_MercenaryResolutionPassed
-- local resolutionMercenariesID = GameInfoTypes["RESOLUTION_JFD_MERCENARIES"]
-- function JFD_MercenaryResolutionPassed(resolutionID, choiceID, isEnact, isPassed)
	-- if resolutionID == resolutionMercenariesID then
		--print("Banned Mercs!", choiceID, isEnact, isPassed)
	-- end
-- end
-- if isUsingCPDLL then
	-- GameEvents.ResolutionResult.Add(JFD_MercenaryResolutionPassed)
-- end
------------------------------------------------------------------------------------------------------------------------
-- UI
------------------------------------------------------------------------------------------------------------------------
-- GLOBALS
-----------------
local g_CurrentTab 			= "MercenaryContracts"
local g_ContractSelectedID 	= nil
local g_UnitSelectedID 		= nil
local g_UnitClassSelectedID = nil
-----------------
-- CHOOSE TABS
-----------------
g_Tabs = {
	["MercenaryContracts"] = {
		Button = Controls.ButtonMercenaryContracts,
		Panel = Controls.MercenaryContractsPanel,
		SelectHighlight = Controls.IconMercenaryContractsHL,
	},
	-- ["LoanContracts"] = {
		-- Button = Controls.ButtonLoanContracts,
		-- Panel = Controls.LoanContractsPanel,
		-- SelectHighlight = Controls.IconLoanContractsHL,
	-- },
	
	["CurrentContracts"] = {
		Button = Controls.ButtonCurrentContracts,
		Panel = Controls.CurrentContractsPanel,
		SelectHighlight = Controls.IconCurrentContractsHL,
	},
}
IconHookup(0, 64, "EXPANSIONPATCH_POLICY_ATLAS", 			Controls.IconMercenaryContracts)
IconHookup(0, 64, "EXPANSIONPATCH_POLICY_ACHIEVED_ATLAS", 	Controls.IconMercenaryContractsHL)
IconHookup(9, 64, "POLICY_ATLAS", 							Controls.IconLoanContracts)
IconHookup(9, 64, "POLICY_A_ATLAS", 						Controls.IconLoanContractsHL)
IconHookup(8, 64, "POLICY_ATLAS_EXP2", 						Controls.IconCurrentContracts)
IconHookup(8, 64, "POLICY_A_ATLAS_EXP2", 					Controls.IconCurrentContractsHL)
-----------------
-- SORT FUNCTIONS
-----------------
local g_CurrentSortOption = 1
local g_CurrentSortDirection = "asc"
local g_MercenaryContractsShowOnly = "ShowAll"
function SortByContractCivilization(a, b)
	if g_CurrentSortDirection == "asc" then
		return a.CivilizationDesc > b.CivilizationDesc
	else
		return a.CivilizationDesc < b.CivilizationDesc
	end
end
function SortByContractCost(a, b)
	if g_CurrentSortDirection == "asc" then
		return a.ContractCost > b.ContractCost
	else
		return a.ContractCost < b.ContractCost
	end
end
function SortByContractMaintenance(a, b)
	if g_CurrentSortDirection == "asc" then
		return a.ContractMaintenance > b.ContractMaintenance
	else
		return a.ContractMaintenance < b.ContractMaintenance
	end
end
function SortByContractName(a, b)
	if g_CurrentSortDirection == "asc" then
		return Locale.Compare(a.ContractDesc, b.ContractDesc) < 0
	else
		return Locale.Compare(a.ContractDesc, b.ContractDesc) > 0
	end
end
function SortByContractRating(a, b)
	if g_CurrentSortDirection == "asc" then
		return a.ContractRating > b.ContractRating
	else
		return a.ContractRating < b.ContractRating
	end
end
function SortByContractTurns(a, b)
	if g_CurrentSortDirection == "asc" then
		return a.ContractTurns > b.ContractTurns
	else
		return a.ContractTurns < b.ContractTurns
	end
end
function SortByContractUnitClass(a, b)
	if g_CurrentSortDirection == "asc" then
		return Locale.Compare(a.ContractUnitClass, b.ContractUnitClass) < 0
	else                                                                
		return Locale.Compare(a.ContractUnitClass, b.ContractUnitClass) > 0
	end
end
function SortByContractUnitCombat(a, b)
	if g_CurrentSortDirection == "asc" then
		return Locale.Compare(a.ContractUnitCombat, b.ContractUnitCombat) < 0
	else                                                                  
		return Locale.Compare(a.ContractUnitCombat, b.ContractUnitCombat) > 0
	end
end
function SortByContractUnitCount(a, b)
	if g_CurrentSortDirection == "asc" then
		return a.ContractUnitCount > b.ContractUnitCount
	else
		return a.ContractUnitCount < b.ContractUnitCount
	end
end
function SortByContractUnitLevel(a, b)
	if g_CurrentSortDirection == "asc" then
		return a.ContractUnitLevel > b.ContractUnitLevel
	else
		return a.ContractUnitLevel < b.ContractUnitLevel
	end
end
function SortByUnitDesc(a, b)
	if g_CurrentSortDirection == "asc" then
		return Locale.Compare(a.UnitDesc, b.UnitDesc) < 0
	else                                                              
		return Locale.Compare(a.UnitDesc, b.UnitDesc) > 0
	end
end
function SortByUnitClassDesc(a, b)
	if g_CurrentSortDirection == "asc" then
		return Locale.Compare(a.UnitClassDesc, b.UnitClassDesc) < 0
	else                                                              
		return Locale.Compare(a.UnitClassDesc, b.UnitClassDesc) > 0
	end
end
g_SortOptions = {}
	-- g_SortOptions["LoanContracts"] = {
	-- {"TXT_KEY_CONTRACT_OVERVIEW_JFD_COST_SORT",			SortByContractCost},
	-- {"TXT_KEY_CONTRACT_OVERVIEW_JFD_CONTRACT_SORT",		SortByContractName},
	-- {"TXT_KEY_CONTRACT_OVERVIEW_JFD_RATING_SORT",		SortByContractRating},}
	g_SortOptions["MercenaryContracts"] = {
	{"TXT_KEY_CONTRACT_OVERVIEW_JFD_ALL_SHOW_ONLY",			"ShowAll"},
	{"TXT_KEY_CONTRACT_OVERVIEW_JFD_AIR_SHOW_ONLY",			"ShowOnlyAir"},
	{"TXT_KEY_CONTRACT_OVERVIEW_JFD_EXPEDITION_SHOW_ONLY",	"ShowOnlyExpedition"},
	{"TXT_KEY_CONTRACT_OVERVIEW_JFD_MELEE_SHOW_ONLY",		"ShowOnlyMelee"},
	{"TXT_KEY_CONTRACT_OVERVIEW_JFD_MERCENARIES_SHOW_ONLY",	"ShowOnlyMercenaries"},
	{"TXT_KEY_CONTRACT_OVERVIEW_JFD_MOUNTED_SHOW_ONLY",		"ShowOnlyMounted"},
	{"TXT_KEY_CONTRACT_OVERVIEW_JFD_NAVAL_SHOW_ONLY",		"ShowOnlyNaval"},
	{"TXT_KEY_CONTRACT_OVERVIEW_JFD_RANGED_SHOW_ONLY",		"ShowOnlyRanged"},}
	g_SortOptions["CurrentContracts"] = {
	{"TXT_KEY_CONTRACT_OVERVIEW_JFD_CIVILIZATION_SORT",	SortByContractCivilization},
	{"TXT_KEY_CONTRACT_OVERVIEW_JFD_CONTRACT_SORT",		SortByContractName},
	{"TXT_KEY_CONTRACT_OVERVIEW_JFD_TURNS_LEFT_SORT",	SortByContractTurns},}

local g_MercSortByPulldown = Controls.MercSortByPullDown
g_MercSortByPulldown:ClearEntries()
for i, v in ipairs(g_SortOptions["MercenaryContracts"]) do
	local Sort_ControlTable = {}
	g_MercSortByPulldown:BuildEntry("InstanceOne", Sort_ControlTable)
	Sort_ControlTable.Button:LocalizeAndSetText(v[1])
	Sort_ControlTable.Button:LocalizeAndSetToolTip(nil)
	Sort_ControlTable.Button:RegisterCallback(Mouse.eLClick, 
	function()
		g_MercSortByPulldown:GetButton():LocalizeAndSetText(v[1])
		g_MercenaryContractsShowOnly = v[2]
		g_ContractSelectedID = nil
		g_UnitClassSelectedID = nil
		JFD_Mercenaries_PopulateMercenaryUnitsPanel()
		JFD_Mercenaries_PopulateMercenaryContractsPanel()
	end)
end
g_MercSortByPulldown:CalculateInternals()
g_MercSortByPulldown:GetButton():LocalizeAndSetText(g_SortOptions["MercenaryContracts"][g_CurrentSortOption][1])
g_MercSortByPulldown:GetButton():LocalizeAndSetToolTip(nil)

-- local g_LoanSortByPulldown = Controls.LoanSortByPullDown
-- g_LoanSortByPulldown:ClearEntries()
-- for i, v in ipairs(g_SortOptions["LoanContracts"]) do
	-- local Sort_ControlTable = {}
	-- g_LoanSortByPulldown:BuildEntry("InstanceOne", Sort_ControlTable)
	-- Sort_ControlTable.Button:LocalizeAndSetText(v[1])
	-- Sort_ControlTable.Button:LocalizeAndSetToolTip("TXT_KEY_CONTRACT_OVERVIEW_JFD_SORT_TT")
	-- Sort_ControlTable.Button:RegisterCallback(Mouse.eLClick, 
	-- function()
		-- g_LoanSortByPulldown:GetButton():LocalizeAndSetText(v[1])
		-- g_LoanSortByPulldown:GetButton():LocalizeAndSetToolTip("TXT_KEY_CONTRACT_OVERVIEW_JFD_SORT_TT")
		-- g_CurrentSortOption = i
		-- g_CurrentSortDirection = "asc"
		-- JFD_PopulateLoanContractPopup()
	-- end)
	-- Sort_ControlTable.Button:RegisterCallback(Mouse.eRClick, 
	-- function()
		-- g_LoanSortByPulldown:GetButton():LocalizeAndSetText(v[1])
		-- g_LoanSortByPulldown:GetButton():LocalizeAndSetToolTip("TXT_KEY_CONTRACT_OVERVIEW_JFD_SORT_TT")
		-- g_CurrentSortOption = i
		-- g_CurrentSortDirection = "desc"
		-- JFD_PopulateLoanContractPopup()
	-- end)
-- end
-- g_LoanSortByPulldown:CalculateInternals()
-- g_LoanSortByPulldown:GetButton():LocalizeAndSetText(g_SortOptions["LoanContracts"][g_CurrentSortOption][1])	
-- g_LoanSortByPulldown:GetButton():LocalizeAndSetToolTip("TXT_KEY_CONTRACT_OVERVIEW_JFD_SORT_TT")

local g_CurrentSortByPulldown = Controls.CurrentSortByPullDown
g_CurrentSortByPulldown:ClearEntries()
for i, v in ipairs(g_SortOptions["CurrentContracts"]) do
	local Sort_ControlTable = {}
	g_CurrentSortByPulldown:BuildEntry("InstanceOne", Sort_ControlTable)
	Sort_ControlTable.Button:LocalizeAndSetText(v[1])
	Sort_ControlTable.Button:LocalizeAndSetToolTip("TXT_KEY_CONTRACT_OVERVIEW_JFD_SORT_TT")
	Sort_ControlTable.Button:RegisterCallback(Mouse.eLClick, 
	function()
		g_CurrentSortByPulldown:GetButton():LocalizeAndSetText(v[1])
		g_CurrentSortByPulldown:GetButton():LocalizeAndSetToolTip("TXT_KEY_CONTRACT_OVERVIEW_JFD_SORT_TT")
		g_CurrentSortOption = i
		g_CurrentSortDirection = "asc"
		JFD_Mercenaries_PopulateCurrentContractPopup()
	end)
	Sort_ControlTable.Button:RegisterCallback(Mouse.eRClick, 
	function()
		g_CurrentSortByPulldown:GetButton():LocalizeAndSetText(v[1])
		g_CurrentSortByPulldown:GetButton():LocalizeAndSetToolTip("TXT_KEY_CONTRACT_OVERVIEW_JFD_SORT_TT")
		g_CurrentSortOption = i
		g_CurrentSortDirection = "desc"
		JFD_Mercenaries_PopulateCurrentContractPopup()
	end)
end
g_CurrentSortByPulldown:CalculateInternals()
g_CurrentSortByPulldown:GetButton():LocalizeAndSetText(g_SortOptions["CurrentContracts"][g_CurrentSortOption][1])	
g_CurrentSortByPulldown:GetButton():LocalizeAndSetToolTip("TXT_KEY_CONTRACT_OVERVIEW_JFD_SORT_TT")
-----------------
-- PEDIA CALLBACK (EUI)
-----------------
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
-----------------
-----------------

local showOnlyMyContracts	 = false
local showAffordedContracts	 = false
local showDetailedontracts	 = false

-- Used for Piano Keys
local ltBlue = {19/255,32/255,46/255,120/255}
local dkBlue = {12/255,22/255,30/255,120/255}

local currentContractsManager	= InstanceManager:new("CurrentContractsInstance",		"CurrentContractsButton",		Controls.CurrentStack)
-- local loanContractsManager		= InstanceManager:new("LoanContractsInstance",			"LoanContractsButton",			Controls.LoanContractsStack)
local mercenaryContractsManager = InstanceManager:new("MercenaryContractsInstance", 	"MercenaryContractsButton", 	Controls.MercenaryContractsStack)
local mercenaryPromotionsStack	= InstanceManager:new("MercenaryPromotionInstance",		"MercenaryPromotionContainer",	Controls.MercenaryPromotionStack)
local mercenaryUnitsManager 	= InstanceManager:new("MercenaryUnitsInstance", 		"MercenaryUnitsButton", 		Controls.MercenaryUnitsStack)

-- JFD_Mercenaries_UpdateDisplays
function JFD_Mercenaries_UpdateDisplays()
	JFD_Mercenaries_PopulateContractOverview()
	JFD_Mercenaries_PopulateCurrentContractPopup()
	-- JFD_Mercenaries_PopulateLoanContractPopup()
	JFD_Mercenaries_PopulateMercenaryContractsPanel()
	JFD_Mercenaries_PopulateMercenaryUnitsPanel()
end
LuaEvents.JFD_Mercenaries_MercenaryShowContractsOverviewPopup.Add(JFD_Mercenaries_UpdateDisplays)

-- JFD_Mercenaries_ResetContractOverview
function JFD_Mercenaries_ResetContractOverview()
	g_ContractSelectedID = nil
	g_UnitClassSelectedID = nil
	mercenaryContractsManager:ResetInstances()
	mercenaryPromotionsStack:ResetInstances()
	Controls.Rating:SetHide(true)
	Controls.Help:SetHide(true)
	Controls.Pedia:SetHide(true)
	Controls.Button1:SetHide(true)
	Controls.Button2:SetHide(true)
	Controls.Button3:SetHide(true)
	Controls.Desc:LocalizeAndSetText("TXT_KEY_JFD_CONTRACT_OVERVIEW_DESC")
	Controls.OverviewFrame:LocalizeAndSetToolTip(nil)
	IconHookup(0, 128, "JFD_POUAKAI_MERCENARY_TECH_ATLAS", Controls.OverviewIcon)
end

-- JFD_Mercenaries_PopulateContractOverview
function JFD_Mercenaries_PopulateContractOverview()
	ContextPtr:SetHide(false)
	--Populate Contract Overview
	mercenaryPromotionsStack:ResetInstances()
	if (not g_ContractSelectedID) then
		JFD_Mercenaries_ResetContractOverview()
	else
		local contract = GameInfo.JFD_Contracts[g_ContractSelectedID]
		local contractCategory = contract.Category
		local contractDesc = contract.Description
		local contractRating = contract.Rating
		local contractRatingText = "" 
		local contractPedia = contract.Civilopedia
		local contractPediaText = ("-----------------" .. "[NEWLINE]" .. convertTextKey(contractPedia))
		local contractCost, contractCostBreak, contractCostExtend = JFD_GetContractCost(activePlayerID, g_ContractSelectedID)
		local contractUnitID, contractUnitCount, contractUnitLevel = JFD_GetContractUnitID(g_ContractSelectedID)
		if contractUnitID then
			local contractUnit = GameInfo.Units[contractUnitID]
			local contractUnitTT = GetHelpTextForUnit(contractUnitID, true)
			local contractYieldCost = contract.YieldCost
			local overviewText = JFD_BuildContractOverview(activePlayerID, g_ContractSelectedID)
			IconHookup(contractUnit.PortraitIndex, 128, contractUnit.IconAtlas, Controls.OverviewIcon)
			Controls.OverviewFrame:LocalizeAndSetToolTip(contractUnitTT)
			for value = 1, contractRating do
				contractRatingText = contractRatingText .. "[ICON_CAPITAL]"
			end
			Controls.Desc:SetText("[COLOR_UNIT_TEXT]" .. Locale.ToUpper(contractDesc) .. "[ENDCOLOR]")
			Controls.Rating:SetHide(false)
			Controls.Rating:SetText(contractRatingText)
			Controls.Help:SetHide(false)
			Controls.Help:SetText(overviewText)
			Controls.Pedia:SetHide(false)
			Controls.Pedia:SetText(contractPediaText)
			for value = 1, 1 do
				local promotionInstance = mercenaryPromotionsStack:GetInstance()
				local unitPromotionID = GameInfoTypes[contract.PromotionType]
				local unitPromotion = GameInfo.UnitPromotions[unitPromotionID]
				IconHookup(unitPromotion.PortraitIndex, 32, unitPromotion.IconAtlas, promotionInstance.MercenaryPromotionImage)
				promotionInstance.MercenaryPromotionContainer:SetToolTipString(convertTextKey(unitPromotion.Description) .. "[NEWLINE][NEWLINE]" .. convertTextKey(unitPromotion.Help))	
			end
			for row in GameInfo.Unit_FreePromotions("UnitType = '" .. contractUnit.Type .. "'") do
				local promotionInstance = mercenaryPromotionsStack:GetInstance()
				local unitPromotionID = GameInfoTypes[row.PromotionType]
				local unitPromotion = GameInfo.UnitPromotions[unitPromotionID]
				IconHookup(unitPromotion.PortraitIndex, 32, unitPromotion.IconAtlas, promotionInstance.MercenaryPromotionImage)
				promotionInstance.MercenaryPromotionContainer:SetToolTipString(convertTextKey(unitPromotion.Description) .. "[NEWLINE][NEWLINE]" .. convertTextKey(unitPromotion.Help))	
			end
			if contractUnit.Combat > 0 then
				for value = 1, contractUnitLevel do
					local promotionInstance = mercenaryPromotionsStack:GetInstance()
					local contractRatingPromotion = "PROMOTION_JFD_MERCENARY_" .. value
					local contractRatingPromotionID = GameInfoTypes[contractRatingPromotion]
					local unitPromotion = GameInfo.UnitPromotions[contractRatingPromotionID]
					IconHookup(unitPromotion.PortraitIndex, 32, unitPromotion.IconAtlas, promotionInstance.MercenaryPromotionImage)
					promotionInstance.MercenaryPromotionContainer:SetToolTipString(convertTextKey(unitPromotion.Description) .. "[NEWLINE][NEWLINE]" .. convertTextKey(unitPromotion.Help))	
				end
			end
			local hasSelectedContract = JFD_HasContract(activePlayerID, g_ContractSelectedID)
			if hasSelectedContract then
				local canBreakSelectedContract = JFD_CanBreakContract(activePlayerID, g_ContractSelectedID)
				local canExtendSelectedContract = JFD_CanExtendContract(activePlayerID, g_ContractSelectedID)
				local breakContractText = convertTextKey("TXT_KEY_JFD_CONTRACT_BUTTON_FIRE", contractCostBreak, contractYieldCost)
				local extendContractText = convertTextKey("TXT_KEY_JFD_CONTRACT_BUTTON_EXTEND", defaultTurnsExtension, contractCostExtend, contractYieldCost)
				Controls.Button1:SetHide(true)
				Controls.Button2:SetHide(false)
				Controls.Button3:SetHide(false)
				if canBreakSelectedContract then
					Controls.Button2:SetDisabled(false)
					Controls.Button2Disable:SetHide(true)
				else
					breakContractText = "[COLOR_FADING_NEGATIVE_TEXT]" .. breakContractText .. "[ENDCOLOR]"
					Controls.Button2:SetDisabled(true)
					Controls.Button2Disable:SetHide(false)
				end
				Controls.Button2:SetText(breakContractText)
				Controls.Button2:LocalizeAndSetToolTip("TXT_KEY_JFD_CONTRACT_BUTTON_FIRE_TT")
				if canExtendSelectedContract then
					Controls.Button3:SetDisabled(false)
					Controls.Button3Disable:SetHide(true)
				else
					extendContractText = "[COLOR_FADING_NEGATIVE_TEXT]" .. extendContractText .. "[ENDCOLOR]"
					Controls.Button3:SetDisabled(true)
					Controls.Button3Disable:SetHide(false)
				end
				Controls.Button3:SetText(extendContractText)
				Controls.Button3:LocalizeAndSetToolTip("TXT_KEY_JFD_CONTRACT_BUTTON_EXTEND_TT", defaultTurnsExtension)
			else
				local anyoneHasContract = JFD_AnyoneHasContract(activePlayerID, g_ContractSelectedID)
				if anyoneHasContract then
					Controls.Button1:SetHide(true)
				else
					local canHaveSelectedContract = JFD_CanHaveContract(activePlayerID, g_ContractSelectedID)
					local buttonText = convertTextKey("TXT_KEY_JFD_CONTRACT_BUTTON_HIRE", contractCost, contractYieldCost)
					local buttonTT = convertTextKey("TXT_KEY_JFD_CONTRACT_BUTTON_HIRE_TT")
					if (not canHaveSelectedContract) then
						buttonText = "[COLOR_FADING_NEGATIVE_TEXT]" .. buttonText .. "[ENDCOLOR]"
						buttonTT = convertTextKey("TXT_KEY_JFD_CONTRACT_BUTTON_HIRE_TT_DISABLED")
					end
					Controls.Button1:SetHide(false)
					Controls.Button1:SetDisabled(not canHaveSelectedContract)
					Controls.Button1Disable:SetHide(canHaveSelectedContract)
					Controls.Button1:SetText(buttonText)
					Controls.Button1:LocalizeAndSetToolTip(buttonTT)
				end
				Controls.Button2:SetHide(true)
				Controls.Button3:SetHide(true)
			end
		end
	end
end

-- JFD_Mercenaries_PopulateMercenaryContractsPanel
function JFD_Mercenaries_PopulateMercenaryContractsPanel()
	mercenaryContractsManager:ResetInstances()
	if g_UnitClassSelectedID then
		local mercenaryContracts = {}
		for contract in GameInfo.JFD_Contracts("Category = 'CONTRACT_JFD_MERCENARY' AND PromotionType IS NOT NULL") do
			local contractID = contract.ID
			local anyoneHasContract = JFD_AnyoneHasContract(contractID)
			if (not anyoneHasContract) then
				local contractUnitID, contractUnitCount, contractUnitLevel = JFD_GetContractUnitID(contractID)
				if contractUnitID then
					local contractUnitClass = GameInfo.Units[contractUnitID].Class
					local contractUnitClassID = GameInfoTypes[contractUnitClass]
					if contractUnitClassID == g_UnitClassSelectedID then
						local canHaveContract, canShowContract = JFD_CanHaveContract(activePlayerID, contractID)
						local contractCost = JFD_GetContractCost(activePlayerID, contractID)
						local contractDesc = contract.Description
						local contractMaintenance = JFD_GetContractMaintenance(contractID)
						local contractRating = contract.Rating
						if (showAffordedContracts and (not canHaveContract)) then
							canShowContract = false
						end
						if canShowContract then
							table.insert(mercenaryContracts, {
								ContractID = contractID,
								ContractDesc = Locale.Lookup(contractDesc),
								ContractRating = contractRating,
								ContractCost = contractCost,
								ContractMaintenance = contractMaintenance,
							});
						end
					end
				end
			end
		end
		if(#mercenaryContracts > 0) then
			table.sort(mercenaryContracts, SortByContractRating)
			for i,v in ipairs(mercenaryContracts) do
				local mercenaryContractsInstance = mercenaryContractsManager:GetInstance()
				local contractID = v.ContractID
				local contractUnitID, contractUnitCount, contractUnitLevel = JFD_GetContractUnitID(contractID)
				local contract = GameInfo.JFD_Contracts[contractID]
				local contractCost = v.ContractCost
				local contractMaintenance = JFD_GetContractMaintenance(contractID)
				local contractRating = v.ContractRating
				local contractUnit = GameInfo.Units[contractUnitID]
				local contractYieldCost = contract.YieldCost
				local canHaveContract = JFD_CanHaveContract(activePlayerID, contractID)
				local contractRatingText = ""
				for value = 1, contractRating do
					contractRatingText = contractRatingText .. "[ICON_CAPITAL]"
				end
				if (not canHaveContract) then
					mercenaryContractsInstance.MercenaryContractsBox:SetColorVal(unpack(dkBlue))
					mercenaryContractsInstance.MercenaryContractsDisable:SetHide(false)
				else
					mercenaryContractsInstance.MercenaryContractsBox:SetColorVal(unpack(ltBlue))
					mercenaryContractsInstance.MercenaryContractsDisable:SetHide(true)
				end
				local contractNameText = convertTextKey("[COLOR_UNIT_TEXT]" .. v.ContractDesc .. "[ENDCOLOR]" .. " (" .. contractRatingText ..")")
				local contractDetailsText = convertTextKey(convertTextKey(contractUnit.Description) .. " (" .. contractCost .. contractYieldCost .. ")")
				if showDetailedontracts then
					contractNameText = convertTextKey("[COLOR_UNIT_TEXT]" .. v.ContractDesc .. "[ENDCOLOR]" .. " (" .. contractRatingText ..")" .. " (" .. Locale.ConvertTextKey("TXT_KEY_JFD_CONTRACT_OVERVIEW_MAINTENANCE_PER_TURN_LABEL", contractMaintenance) .. ")")
					contractDetailsText = convertTextKey(contractUnitCount .. "x " .. "Lv. " .. contractUnitLevel .. " " .. convertTextKey(contractUnit.Description) .. " (" .. contractCost .. contractYieldCost ..")")
				end
				mercenaryContractsInstance.MercenaryContractsName:SetText(contractNameText)
				mercenaryContractsInstance.MercenaryContractsDetails:SetText(contractDetailsText)
				mercenaryContractsInstance.MercenaryContractsButton:RegisterCallback(Mouse.eLClick, 
				function()
					g_ContractSelectedID = v.ContractID
					JFD_Mercenaries_PopulateContractOverview()
				end)
			end
			Controls.NoMercenaryContractsStack:SetHide(true)
		else
			Controls.NoMercenaryContractsStack:LocalizeAndSetText("TXT_KEY_CONTRACT_OVERVIEW_JFD_MERCENARY_SELECTION")
			Controls.NoMercenaryContractsStack:SetHide(false)
		end
		Controls.MercenaryContractsStack:CalculateSize()
		Controls.MercenaryContractsStack:ReprocessAnchoring()
		Controls.MercenaryContractsScrollPanel:CalculateInternalSize()
	else
		Controls.NoMercenaryContractsStack:LocalizeAndSetText("TXT_KEY_CONTRACT_OVERVIEW_JFD_MERCENARY_NO_SELECTION")
		Controls.NoMercenaryContractsStack:SetHide(false)
	end
end	
g_Tabs["MercenaryContracts"].RefreshContent = JFD_Mercenaries_PopulateMercenaryContractsPanel

-- JFD_Mercenaries_PopulateMercenaryUnitsPanel
local mercenaryContractsUnitCombats = {}
	mercenaryContractsUnitCombats["ShowOnlyAir"] 		 = {"UNITCOMBAT_BOMBER", 	 "UNITCOMBAT_FIGHTER", 		"UNITCOMBAT_HELICOPTER"}
	mercenaryContractsUnitCombats["ShowOnlyExpedition"]  = {"UNITCOMBAT_RECON", 	 "UNITCOMBAT_CIVILIAN", 	'UNITCOMBAT_GREAT_PEOPLE'}
	mercenaryContractsUnitCombats["ShowOnlyMelee"] 		 = {"UNITCOMBAT_MELEE", 	 "UNITCOMBAT_GUN"}
	mercenaryContractsUnitCombats["ShowOnlyMercenaries"] = {"UNITCOMBAT_MELEE", 	 "UNITCOMBAT_GUN",			"UNITCOMBAT_NAVALRANGED", 	"UNITCOMBAT_NAVALMELEE"}
	mercenaryContractsUnitCombats["ShowOnlyMounted"] 	 = {"UNITCOMBAT_RECON",  	 "UNITCOMBAT_MOUNTED",	 	"UNITCOMBAT_ARMOR"}
	mercenaryContractsUnitCombats["ShowOnlyNaval"] 		 = {"UNITCOMBAT_NAVALMELEE", "UNITCOMBAT_NAVALRANGED", 	"UNITCOMBAT_CARRIER", "UNITCOMBAT_SUBMARINE"}
	mercenaryContractsUnitCombats["ShowOnlyRanged"] 	 = {"UNITCOMBAT_ARCHER", 	 "UNITCOMBAT_SIEGE"}
function JFD_Mercenaries_PopulateMercenaryUnitsPanel()
	g_CurrentTab = "MercenaryContracts"
	local isMercenaryContractsBanned = JFD_IsContractsBanned("CONTRACT_JFD_MERCENARY")
	if isMercenaryContractsBanned then
		Controls.NoUnitsStack:LocalizeAndSetText("TXT_KEY_CONTRACT_OVERVIEW_JFD_MERCENARY_BANNED")
		Controls.NoUnitsStack:SetHide(false)
	else
		local isMercenaryContractsUnlocked = JFD_IsContractsUnlocked(activePlayerID, "CONTRACT_JFD_MERCENARY")
		if isMercenaryContractsUnlocked then
			--Populate Mercenary MercenaryContracts
			mercenaryUnitsManager:ResetInstances()
			local mercenaryUnitClasses = {}
			for unitClass in GameInfo.UnitClasses("DefaultUnit IS NOT NULL AND MaxPlayerInstances = -1") do
				local unitClassID = unitClass.ID
				local unitClassDesc = unitClass.Description
				local unitClassDefaultUnit = unitClass.DefaultUnit
				local unitID = GameInfoTypes[unitClassDefaultUnit]
				if unitID then
					local unit = GameInfo.Units[unitID]
					local unitCombat = unit.CombatClass
					local unitMercenary = unit.JFD_OnlyMercenary
					local unitClassHasContract = false
					local insertIntoTable = false
					if g_MercenaryContractsShowOnly ~= "ShowAll" then
						for i,combatClass in pairs(mercenaryContractsUnitCombats[g_MercenaryContractsShowOnly]) do
							if unitCombat == combatClass then
								if (g_MercenaryContractsShowOnly == "ShowOnlyMercenaries" and (not unitMercenary)) then
									insertIntoTable = false
								else
									insertIntoTable = true
								end
								break
							end
						end
					else
						insertIntoTable = true
					end
					if insertIntoTable then
						for contract in GameInfo.JFD_Contracts("Category = 'CONTRACT_JFD_MERCENARY' AND PromotionType IS NOT NULL") do
							local contractID = contract.ID
							local anyoneHasContract = JFD_AnyoneHasContract(contractID)
							if (not anyoneHasContract) then
								local contractUnitID, contractUnitCount, contractUnitLevel = JFD_GetContractUnitID(contractID)
								if contractUnitID then
									local contractUnitClass = GameInfo.Units[contractUnitID].Class
									local contractUnitClassID = GameInfoTypes[contractUnitClass]
									if contractUnitID then
										if unitClassID == contractUnitClassID then
											unitClassHasContract = true
											break
										end
									end
								end
							end
						end
					end
					if (insertIntoTable and unitClassHasContract) then
						table.insert(mercenaryUnitClasses, {
							UnitClassID = unitClassID,
							UnitID = unitID,
							UnitClassDesc = Locale.Lookup(unitClassDesc),
						});
					end
				end
			end
			if(#mercenaryUnitClasses > 0) then
			table.sort(mercenaryUnitClasses, SortByUnitClassDesc)
				for i,v in ipairs(mercenaryUnitClasses) do
					local mercenaryUnitsInstance = mercenaryUnitsManager:GetInstance()
					local unitID = v.UnitID
					local unit = GameInfo.Units[unitID]
					local unitClass = GameInfo.UnitClasses[v.UnitClassID]
					local unitClassDesc = unitClass.Description
					local unitTT = GetHelpTextForUnit(unitID, true)
					IconHookup(unit.PortraitIndex, 64, unit.IconAtlas, mercenaryUnitsInstance.UnitIconBG)
					mercenaryUnitsInstance.UnitIconFrame:LocalizeAndSetToolTip(unitTT)
					mercenaryUnitsInstance.MercenaryUnitBox:SetColorVal(unpack(dkBlue))
					mercenaryUnitsInstance.MercenaryUnitsDesc:LocalizeAndSetText(unitClassDesc)
					mercenaryUnitsInstance.MercenaryUnitsButton:RegisterCallback(Mouse.eLClick, 
					function()
						g_UnitClassSelectedID = v.UnitClassID
						JFD_Mercenaries_PopulateMercenaryContractsPanel()
					end)
					
					local pedia = CivilopediaControl and (unit.Description)
					if pedia then
						mercenaryUnitsInstance.MercenaryUnitsButton:RegisterCallback(Mouse.eRClick, function() getPedia(pedia) end)
					end
				end
				Controls.NoUnitsStack:SetHide(true)
			else
				Controls.NoUnitsStack:LocalizeAndSetText("TXT_KEY_CONTRACT_OVERVIEW_JFD_AVAILABLE_NONE")
				Controls.NoUnitsStack:SetHide(false)
			end
			Controls.MercenaryUnitsStack:CalculateSize()
			Controls.MercenaryUnitsStack:ReprocessAnchoring()
			Controls.UnitscrollPanel:CalculateInternalSize()
		else
			Controls.NoUnitsStack:LocalizeAndSetText("TXT_KEY_CONTRACT_OVERVIEW_JFD_MERCENARY_DISABLED")
			Controls.NoUnitsStack:SetHide(false)
		end
	end
	Controls.NoUnitsStack:ReprocessAnchoring()
end
g_Tabs["MercenaryContracts"].RefreshContent = JFD_Mercenaries_PopulateMercenaryContractsPanel

-- JFD_PopulateLoanContractPopup
-- function JFD_PopulateLoanContractPopup()
	-- g_CurrentTab = "LoanContracts"
	-- JFD_ResetContractOverview()
	-- local isLoanContractsUnlocked = JFD_IsContractsUnlocked(activePlayerID, "CONTRACT_JFD_LOAN")
	-- if isLoanContractsUnlocked then
		-- Populate Loan LoanContracts
		-- loanContractsManager:ResetInstances()
		-- local loanContracts = {}
		-- for contract in GameInfo.JFD_Contracts("Category = 'CONTRACT_JFD_LOAN'") do
			-- local contractID = contract.ID
			-- local contractDesc = contract.Description
			-- local anyoneHasContract = JFD_AnyoneHasContract(contractID)
			-- if (not anyoneHasContract) then
				-- local insertIntoTable = true
				-- local canHaveContract, canShowContract = JFD_CanHaveContract(activePlayerID, contractID)
				-- if canShowContract then
					-- local contractCost = JFD_GetContractCost(activePlayerID, contractID)
					-- local ContractMaintenance = JFD_GetContractMaintenance(contractID)
					-- local contractRating = contract.Rating
					-- if (showAffordedContracts and (not canHaveContract)) then
						-- insertIntoTable = false
					-- end
					-- if insertIntoTable then
						-- table.insert(loanContracts, {
							-- ContractID = contractID,
							-- ContractDesc = Locale.Lookup(contractDesc),
							-- ContractRating = contractRating,
							-- ContractCost = contractCost,
							-- ContractMaintenance = contractMaintenance,
						-- });
					-- end
				-- end
			-- end
		-- end
		-- if(#loanContracts > 0) then
		-- table.sort(loanContracts, 	g_SortOptions["LoanContracts"][g_CurrentSortOption][2])
			-- for i,v in ipairs(loanContracts) do
				-- local loanContractsInstance = loanContractsManager:GetInstance()
				-- local sortedContractID = v.ContractID
				-- local sortedContract = GameInfo.JFD_Contracts[sortedContractID]
				-- local canHaveContract = JFD_CanHaveContract(activePlayerID, sortedContractID)
				-- local contractYieldCost = sortedContract.YieldCost
				-- local contractRatingText = ""
				-- for value = 1, v.ContractRating do
					-- contractRatingText = contractRatingText .. "[ICON_CAPITAL]"
				-- end
				-- if (not canHaveContract) then
					-- loanContractsInstance.Box:SetColorVal(unpack(ltBlue))
				-- else
					-- loanContractsInstance.Box:SetColorVal(unpack(dkBlue))
				-- end
				-- IconHookup(contractUnit.PortraitIndex, 64, contractUnit.IconAtlas, loanContractsInstance.UnitIconBG)
				-- loanContractsInstance.LoanContractsName:SetText(v.ContractDesc .. " (" .. contractRatingText ..")")
				-- loanContractsInstance.LoanContractsDisable:SetHide(canHaveContract)
				-- loanContractsInstance.LoanContractsButton:RegisterCallback(Mouse.eLClick, 
				-- function()
					-- g_ContractSelectedID = v.ContractID
					-- JFD_PopulateLoanContractOverview()
				-- end)
			-- end
			-- Controls.NoLoanContracts:SetHide(true)
		-- else
			-- Controls.NoLoanContracts:LocalizeAndSetText("TXT_KEY_CONTRACT_OVERVIEW_JFD_AVAILABLE_NONE")
			-- Controls.NoLoanContracts:SetHide(false)
		-- end				
		-- Controls.LoanContractsStack:CalculateSize()
		-- Controls.LoanContractsStack:ReprocessAnchoring()
		-- Controls.LoanContractsScrollPanel:CalculateInternalSize()
	-- else
		-- Controls.NoLoanContracts:LocalizeAndSetText("TXT_KEY_CONTRACT_OVERVIEW_JFD_LOAN_DISABLED")
		-- Controls.NoLoanContracts:SetHide(false)
	-- end
-- end
-- g_Tabs["LoanContracts"].RefreshContent = JFD_PopulateLoanContractPopup

function JFD_Mercenaries_PopulateCurrentContractPopup()
	g_CurrentTab = "CurrentContracts"
	-- JFD_Mercenaries_ResetContractOverview()
	--Populate Current Contracts
	currentContractsManager:ResetInstances()
	local currentContracts = {}
	for contract in GameInfo.JFD_Contracts() do
		local contractID = contract.ID
		local anyoneHasContract = JFD_AnyoneHasContract(contractID)
		if anyoneHasContract then
			local insertIntoTable = true
			local contractDesc = contract.Description
			local contractRating = contract.Rating
			local contractTurns = JFD_GetContractTurnsLeft(contractID)
			local contractorID = JFD_GetContractor(contractID)
			local contractor = Players[contractorID]
			local civID = contractor:GetCivilizationType() or contractor:GetMinorCivilizationType()
			local civDesc
			if contractor:IsMinorCiv() then
				civID = contractor:GetMinorCivType()
				civDesc = GameInfo.MinorCivilizations[civID].ShortDescription
			else
				civDesc = GameInfo.Civilizations[civID].ShortDescription
			end
			if (showOnlyMyContracts and contractorID ~= activePlayerID) then
				insertIntoTable = false
			end
			if insertIntoTable then
				table.insert(currentContracts, {
					ContractID = contractID,
					ContractorID = contractorID,
					CivilizationDesc = Locale.Lookup(civDesc),
					ContractDesc = Locale.Lookup(contractDesc),
					ContractRating = contractRating,
					ContractTurns = contractTurns,
				});
			end
		end
	end
	if(#currentContracts > 0) then
	table.sort(currentContracts, 	g_SortOptions["CurrentContracts"][g_CurrentSortOption][2])
		for i,v in ipairs(currentContracts) do
			local currentContractsInstance = currentContractsManager:GetInstance()
			local sortedContractID = v.ContractID
			local sortedContract = GameInfo.JFD_Contracts[sortedContractID]
			local sortedContractDesc = convertTextKey(v.ContractDesc)
			local sortedContractTurns = v.ContractTurns
			local sortedContractorID = v.ContractorID
			local sortedContractor = Players[sortedContractorID]
			local sortedContractorTeamID = sortedContractor:GetTeam()
			if (not activeTeam:IsHasMet(sortedContractorTeamID)) then
				sortedContractorID = -1
			end
			CivIconHookup(sortedContractorID, 32, currentContractsInstance.CivIcon, currentContractsInstance.CivIconBG, currentContractsInstance.CivIconShadow, false, true)
			if sortedContractorID == activePlayerID then
				currentContractsInstance.CurrentContractsName:SetText("[COLOR_UNIT_TEXT]" .. sortedContractDesc .. "[ENDCOLOR] (" .. Locale.ConvertTextKey("TXT_KEY_JFD_CONTRACT_OVERVIEW_TURNS_LABEL", sortedContractTurns) .. ")")
				currentContractsInstance.CurrentContractsName:SetToolTipString("[COLOR_UNIT_TEXT]" .. sortedContractDesc .. "[ENDCOLOR] (" .. Locale.ConvertTextKey("TXT_KEY_JFD_CONTRACT_OVERVIEW_TURNS_LABEL", sortedContractTurns) .. ")")
				currentContractsInstance.ButtonBox:SetHide(false)
			else
				currentContractsInstance.CurrentContractsName:LocalizeAndSetText("[COLOR_UNIT_TEXT]" .. sortedContractDesc .. "[ENDCOLOR]")
				currentContractsInstance.CurrentContractsName:SetToolTipString("[COLOR_UNIT_TEXT]" .. sortedContractDesc .. "[ENDCOLOR]")
				currentContractsInstance.ButtonBox:SetHide(true)
			end
			currentContractsInstance.CurrentContractsButton:RegisterCallback(Mouse.eLClick, 
			function()
				g_ContractSelectedID = sortedContractID
				JFD_Mercenaries_PopulateContractOverview()
			end)
		end
		Controls.NoContracts:SetHide(true)
	else
		Controls.NoContracts:LocalizeAndSetText("TXT_KEY_CONTRACT_OVERVIEW_JFD_CURRENT_NONE")
		Controls.NoContracts:SetHide(false)
	end				
	Controls.CurrentStack:CalculateSize()
	Controls.CurrentStack:ReprocessAnchoring()
	Controls.CurrentScrollPanel:CalculateInternalSize()
end
g_Tabs["CurrentContracts"].RefreshContent = JFD_Mercenaries_PopulateCurrentContractPopup
---------------------------
-- OPTIONS
---------------------------
-- JFD_Mercenaries_OnShowOnlyAffordedContracts
function JFD_Mercenaries_OnShowOnlyAffordedContracts(isChecked)
	showAffordedContracts = isChecked
	-- if g_CurrentTab == "LoanContracts" then
		-- JFD_Mercenaries_PopulateLoanContractPopup()
	-- else
		JFD_Mercenaries_PopulateMercenaryContractsPanel()
		JFD_Mercenaries_PopulateMercenaryUnitsPanel()
	-- end
end
Controls.ShowAffordCheckMerc:RegisterCheckHandler(JFD_Mercenaries_OnShowOnlyAffordedContracts)
Controls.ShowAffordCheckLoan:RegisterCheckHandler(JFD_Mercenaries_OnShowOnlyAffordedContracts)

-- JFD_Mercenaries_OnShowDetailedContracts
function JFD_Mercenaries_OnShowDetailedContracts(isChecked)
	showDetailedontracts = isChecked
	-- if g_CurrentTab == "LoanContracts" then
		-- JFD_Mercenaries_PopulateLoanContractPopup()
	-- else
		JFD_Mercenaries_PopulateMercenaryContractsPanel()
		JFD_Mercenaries_PopulateMercenaryUnitsPanel()
	-- end
end
Controls.ShowDetailCheckMerc:RegisterCheckHandler(JFD_Mercenaries_OnShowDetailedContracts)
Controls.ShowDetailCheckLoan:RegisterCheckHandler(JFD_Mercenaries_OnShowDetailedContracts)

-- JFD_Mercenaries_OnShowAllContracts
function JFD_Mercenaries_OnShowOnlyMyContracts(isChecked)
	showOnlyMyContracts = isChecked
	JFD_Mercenaries_PopulateCurrentContractPopup()
end
Controls.ShowAllCheck:RegisterCheckHandler(JFD_Mercenaries_OnShowOnlyMyContracts)

-- JFD_Mercenaries_OnHire
local isBreaking = false
local isHiring = true
local isExtending = true
function JFD_Mercenaries_OnHire()
	isBreaking = false
	isHiring = true
	isExtending = false
	Controls.Confirm:SetHide(false)
	Controls.LabelConfirm:LocalizeAndSetText("TXT_KEY_CONTRACT_OVERVIEW_CONFIRM_JFD_CONTRACT_HIRE")
end
Controls.Button1:RegisterCallback(Mouse.eLClick, JFD_Mercenaries_OnHire)

-- JFD_Mercenaries_OnFire
function JFD_Mercenaries_OnFire()
	isBreaking = true
	isHiring = false
	isExtending = false
	Controls.Confirm:SetHide(false)
	Controls.LabelConfirm:LocalizeAndSetText("TXT_KEY_CONTRACT_OVERVIEW_CONFIRM_JFD_CONTRACT_FIRE")
end
Controls.Button2:RegisterCallback(Mouse.eLClick, JFD_Mercenaries_OnFire)

-- JFD_Mercenaries_OnExtend
function JFD_Mercenaries_OnExtend()
	isBreaking = false
	isExtending = true
	Controls.Confirm:SetHide(false)
	Controls.LabelConfirm:LocalizeAndSetText("TXT_KEY_CONTRACT_OVERVIEW_CONFIRM_JFD_CONTRACT_EXTEND")
end
Controls.Button3:RegisterCallback(Mouse.eLClick, JFD_Mercenaries_OnExtend)

-- JFD_Mercenaries_OnYes
function JFD_Mercenaries_OnYes()
	Controls.Confirm:SetHide(true)
	JFD_SetHasContract(activePlayerID, g_ContractSelectedID, isHiring, isBreaking, isExtending)
	JFD_Mercenaries_ResetContractOverview()
	JFD_Mercenaries_UpdateDisplays()
end
Controls.ConfirmYes:RegisterCallback(Mouse.eLClick, JFD_Mercenaries_OnYes)

-- JFD_Mercenaries_OnNo
function JFD_Mercenaries_OnNo()
	Controls.Confirm:SetHide(true)
end
Controls.ConfirmNo:RegisterCallback(Mouse.eLClick, JFD_Mercenaries_OnNo)

-- JFD_Mercenaries_OnClose
function JFD_Mercenaries_OnClose()
	ContextPtr:SetHide(true)
end
Controls.CloseButton:RegisterCallback(Mouse.eLClick, JFD_Mercenaries_OnClose)
----------------------------------------------------------------
-- 'Active' (local human) player has changed
----------------------------------------------------------------
function OnActivePlayerChanged()
	JFD_Mercenaries_OnClose()
end
Events.GameplaySetActivePlayer.Add(OnActivePlayerChanged);
--------------------------------------------------------------------
function InputHandler(uiMsg, wParam, lParam)
  if (uiMsg == KeyEvents.KeyDown) then
    if (wParam == Keys.VK_ESCAPE) then
      JFD_Mercenaries_OnClose()
      return true
    end
  end
end
ContextPtr:SetInputHandler(InputHandler)
ContextPtr:SetHide(true)

-- Register tabbing behavior and assign global TabSelect routine.
TabSelect = RegisterTabBehavior(g_Tabs, g_Tabs["MercenaryContracts"]);
------------------------------------------------------------------------------------------------------------------------
-- DROP-DOWN
------------------------------------------------------------------------------------------------------------------------
-- JFD_Mercenaries_ShowMercenaryContractsPopup
function JFD_Mercenaries_ShowMercenaryContractsPopup()
	JFD_Mercenaries_UpdateDisplays()
end
LuaEvents.JFD_Mercenaries_ShowMercenaryContractsOverviewPopup.Add(JFD_Mercenaries_ShowMercenaryContractsPopup)

-- OnAdditionalInformationDropdownGatherEntries 
function OnAdditionalInformationDropdownGatherEntries(additionalEntries)
	table.insert(additionalEntries,
	{
    text = Locale.ConvertTextKey("TXT_KEY_JFD_CONTRACTS_OVERVIEW_DROPDOWN"), 
	art = "DC45_Mercenaries.dds",
    call = JFD_Mercenaries_UpdateDisplays
	}
	)
end
LuaEvents.AdditionalInformationDropdownGatherEntries.Add(OnAdditionalInformationDropdownGatherEntries)
LuaEvents.RequestRefreshAdditionalInformationDropdownEntries()
------------------------------------------------------------------------------------------------------------------------
-- INIT
------------------------------------------------------------------------------------------------------------------------
-- JFD_Mercenaries_InitContracts
function JFD_Mercenaries_InitContracts()
	local currentEraID = activePlayer:GetCurrentEra()
	for contract in GameInfo.JFD_Contracts() do
		local contractID = contract.ID
		if (not JFD_Contracts[0]) then
			JFD_Contracts[0] = {}
		end
		if JFD_IsContractsUnlocked(activePlayerID, "CONTRACT_JFD_MERCENARY") then
			local eraID = activePlayer:GetCurrentEra()
			local prereqEra = contract.PrereqEra
			local prereqEraID = GameInfoTypes[prereqEra]
			if prereqEraID <= eraID then
				if (not JFD_Contracts[contractID]) then
					JFD_Contracts[contractID] = {}
				end
				local contracterID = JFD_Contracts[contractID].ContractorID
				if (not contracterID) then
					local obsoleteEra = contract.ObsoleteEra
					if obsoleteEra then
						local obsoleteEraID = GameInfoTypes[obsoleteEra]
						if eraID >= obsoleteEraID then
							JFD_Contracts[contractID] = {}
						else
							if contract.Category == "CONTRACT_JFD_MERCENARY" then
								JFD_AssignContractUnits(playerID, contractID, eraID)
							end
						end
					else
						if contract.Category == "CONTRACT_JFD_MERCENARY" then
							JFD_AssignContractUnits(playerID, contractID, eraID)
						end
					end
				end
			end
		end
	end
end
Events.LoadScreenClose.Add(JFD_Mercenaries_InitContracts)

-- JFD_Mercenaries_InitContractsNewEra
function JFD_Mercenaries_InitContractsNewEra(teamID, eraID)
	local playerID = Teams[teamID]:GetLeaderID()
	local player = Players[playerID]
	if player:IsHuman() then
		for contract in GameInfo.JFD_Contracts() do
			local contractID = contract.ID
			local prereqEra = contract.PrereqEra
			local prereqEraID = GameInfoTypes[prereqEra]
			if prereqEraID <= eraID then
				if (not JFD_Contracts[contractID]) then
					JFD_Contracts[contractID] = {}
				end
				local contracterID = JFD_Contracts[contractID].ContractorID
				if (not contracterID) then
					local obsoleteEra = contract.ObsoleteEra
					if obsoleteEra then
						local obsoleteEraID = GameInfoTypes[obsoleteEra]
						if eraID >= obsoleteEraID then
							JFD_Contracts[contractID] = {}
						else
							if contract.Category == "CONTRACT_JFD_MERCENARY" then
								JFD_AssignContractUnits(playerID, contractID, eraID)
							end
						end
					else
						if contract.Category == "CONTRACT_JFD_MERCENARY" then
							JFD_AssignContractUnits(playerID, contractID, eraID)
						end
					end
				end
			end
		end
	end
end
GameEvents.TeamSetEra.Add(JFD_Mercenaries_InitContractsNewEra)
--=======================================================================================================================
-- TSL UTILITIES	
--=======================================================================================================================
-- OnModLoaded
function OnModLoaded() 
	local bNewGame = not TableLoad(tableRoot, tableName)
	TableSave(tableRoot, tableName)
end
OnModLoaded()
--=======================================================================================================================
--=======================================================================================================================