-- JFD_MoWUtilities
-- Author: JFD
-- DateCreated: 9/22/2014 11:18:48 PM
--=======================================================================================================================
-- USER SETTING FUNCTIONS
--=======================================================================================================================
-- MOD CHECKS
--------------------------------------------------------------------------------------------------------------------------
-- JFD_IsUsingCPDLL
function JFD_IsUsingCPDLL()
	local cPDLLModID = "d1b6328c-ff44-4b0d-aad7-c657f83610cd"
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == cPDLLModID) then
			return true
		end
	end
end
local isUsingCPDLL = JFD_IsUsingCPDLL()

-- JFD_IsUsingCBP
function JFD_IsUsingCBP()
	local cBPModID = "8411a7a8-dad3-4622-a18e-fcc18324c799"
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == cBPModID) then
			return true
		end
	end
end

-- JFD_IsUsingCulDiv
function JFD_IsUsingCulDiv()
	local culDivModID = "31a31d1c-b9d7-45e1-842c-23232d66cd47"
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == culDivModID) then
			return true
		end
	end
end
local isUsingCulDiv = JFD_IsUsingCulDiv()

-- JFD_IsUsingEUI
function JFD_IsUsingEUI()
	if ContextPtr:LookUpControl("/InGame/CityView/CityInfoBG") then
		return true
	end
	return false
end

-- JFD_IsUsingExCE
function JFD_IsUsingExCE()
	local exCEModID = "6676902b-b907-45f1-8db5-32dcb2135eee"
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == exCEModID) then
			return true
		end
	end
end

-- JFD_IsUsingPiety
function JFD_IsUsingPiety()
	local pietyModID = "eea66053-7579-481a-bb8d-2f3959b59974"
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == pietyModID) then
			return true
		end
	end
end
local isUsingPiety = JFD_IsUsingPiety()

-- JFD_IsUsingSovereignty
function JFD_IsUsingSovereignty()
	local sovereigntyModID = "d99bf7aa-51ac-4bef-bd88-d765b28e260e"
	for _, mod in pairs(Modding.GetActivatedMods()) do
		 if (mod.ID == sovereigntyModID) then
			return true
		end
	end
end
local isUsingSovereignty = JFD_IsUsingSovereignty()

-- JFD_IsWhowardsDLLActive
function JFD_IsWhowardsDLLActive()
	local whowardsDLLModID = "d1b6328c-ff44-4b0d-aad7-c657f83610cd"
	for _, mod in pairs(Modding.GetActivatedMods()) do
	  if (mod.ID == whowardsDLLModID) then
	    return true
	  end
	end
end
--------------------------------------------------------------------------------------------------------------------------
-- USER SETTINGS
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetUserSetting
function JFD_GetUserSetting(type)
	for row in GameInfo.JFD_GlobalUserSettings("Type = '" .. type .. "'") do
		return row.Value
	end
end
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFD_Mercenaries_GlobalDefines.lua")
include("PlotIterators.lua")
if isUsingPiety then
	include("JFD_PietyUtils.lua")
end
if isUsingSovereignty then
	include("JFD_SovereigntyUtils.lua")
end
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local activePlayerID = Game.GetActivePlayer()
local activePlayer	 = Players[activePlayerID]
local convertTextKey = Locale.ConvertTextKey
local handicapID 	 = Game.GetHandicapType()
local handicapMod	 = GameInfo.HandicapInfos[handicapID].AIUnitCostPercent
local mathCeil		 = math.ceil
local mathFloor		 = math.floor
local mathMin		 = math.minJFD_IsUsingPiety
local speedID		 = Game.GetGameSpeedType()
local speedMod		 = ((GameInfo.GameSpeeds[speedID].BuildPercent)/100)

local defaultTurnsExtension = mathCeil(10*speedMod)
--------------------------------------------------------------------------------------------------------------------------
-- GENERAL
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetLeaderFlavour
function JFD_GetLeaderFlavour(playerID, flavourType)
	local player = Players[playerID]
	local leaderType = GameInfo.Leaders[player:GetLeaderType()].Type
	for row in GameInfo.Leader_Flavors("LeaderType = '" .. leaderType .. "' AND FlavorType = '" .. flavourType .. "'") do
		return row.Flavor
	end
end 

-- JFD_GetRandom
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end

-- JFD_GetUniqueUnit
function JFD_GetUniqueUnit(player, unitClass)
	if isUsingCPDLL then
		return player:GetSpecificUnitType(unitClass)
	end
	local unitType = nil
	local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
	for uniqueUnit in GameInfo.Civilization_UnitClassOverrides{CivilizationType = civType, UnitClassType = unitClass} do
		unitType = uniqueUnit.UnitType
		break
	end
	if (unitType == nil) then
		unitType = GameInfo.UnitClasses[unitClass].DefaultUnit
	end
	return unitType
end

-- JFD_SendNotification
function JFD_SendNotification(playerID, notificationType, description, descriptionShort, global, data1, data2, unitID, data3, metOnly, includesSerialMessage)
	local player = Players[playerID]
	local data1 = data1 or -1
	local data2 = data2 or -1
	local unitID = unitID or -1
	local data3 = data3 or -1
	local sendNotification = false
	local sendSerialMessage = false
	if global then
		if metOnly then
			if Teams[Game.GetActiveTeam()]:IsHasMet(player:GetTeam()) then
				sendNotification = true
			end
		else
			sendNotification = true
		end
	else
		if player:IsHuman() then
			if metOnly then
				if Teams[Game.GetActiveTeam()]:IsHasMet(player:GetTeam()) then
					sendNotification = true
				end
			else
				sendNotification = true
			end
		end
	end
	if sendNotification then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes[notificationType], description, descriptionShort, data1, data2, unitID, data3)
		if includesSerialMessage then
			Events.GameplayAlertMessage(description)
		end
	end
end   

-- JFD_SendWorldEvent
function JFD_SendWorldEvent(playerID, description)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if (not player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end  
--=======================================================================================================================
-- CONTRACT UTILITIES
--=======================================================================================================================
-- CONTRACT
--------------------------------------------------------------------------------------------------------------------------
local playerBarbarianID = 63
local playerBarbarian 	= Players[playerBarbarianID]
local unitContractID  	= GameInfoTypes["UNIT_JFD_CONTRACT_NOTIFICATION"]

-- JFD_IsContractsUnlocked
function JFD_IsContractsUnlocked(playerID, category)
	local player = Players[playerID]
	local team = Teams[player:GetTeam()]
	local queries = {}
	queries["CONTRACT_JFD_LOAN"]	  = "AllowLoanContracts"
	queries["CONTRACT_JFD_MERCENARY"] = "AllowMercenaryContracts"
	for row in GameInfo.Technologies_JFD_MiscEffects(queries[category] .. " > 0") do
		local techID = GameInfoTypes[row.TechType]
		if team:IsHasTech(techID) then
			return true
		end
	end
	return false
end

-- JFD_IsContractsBanned
local resolutionMercenariesID = GameInfoTypes["RESOLUTION_JFD_MERCENARIES"]
function JFD_IsContractsBanned(category)
	if (not isUsingCPDLL) then
		return false
	end
	if resolutionMercenariesID then
		return Game.IsResolutionPassed(resolutionMercenariesID, -1)
	end
end

-- JFD_AnyoneHasContract
function JFD_AnyoneHasContract(contractID)
	local contract = JFD_Contracts[contractID]
	if contract then
		return (contract.ContractorID ~= nil)
	else
		return false
	end
end

-- JFD_HasContract
function JFD_HasContract(playerID, contractID)
	return JFD_GetContractor(contractID) == playerID or false
end

-- JFD_GetContractor
function JFD_GetContractor(contractID)
	return JFD_Contracts[contractID].ContractorID or -1
end

-- JFD_GetNumContracts
function JFD_GetNumContracts(playerID)
	local numContracts = 0
	for row in GameInfo.JFD_Contracts() do
		if JFD_HasContract(playerID, row.ID) then
			numContracts = numContracts + 1
		end
	end
	return numContracts
end

-- JFD_SetHasContract
function JFD_SetHasContract(playerID, contractID, isHiring, isBreaking, isExtending, isMutiny)
	local player = Players[playerID]
	local contract = GameInfo.JFD_Contracts[contractID]
	local contractDesc = contract.Description
	local contractCost, contractCostBreak = JFD_GetContractCost(playerID, contractID)
	if isHiring then
		local contractTurns = JFD_GetContractTurns(playerID, contractID)
		local contractYieldCost = contract.YieldCost
		if isExtending then
			contractCost = (contractCost/2) 
		end
		if contractYieldCost == "[ICON_PEACE]" then
			player:ChangeFaith(-contractCost)
		elseif contractYieldCost == "[ICON_JFD_PIETY]" then
			player:ChangePiety(-contractCost)		
		else
			player:ChangeGold(-contractCost)
		end
		if isExtending then
			JFD_ChangeContractTurnsLeft(contractID, defaultTurnsExtension)
			if playerID == activePlayerID then
				local purchaseDing = contract.PurchaseDing
				if purchaseDing then
					Events.AudioPlay2DSound(purchaseDing)
				end
				Events.AudioPlay2DSound("AS2D_INTERFACE_POLICY")
				JFD_SendNotification(playerID, "NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER", convertTextKey("TXT_KEY_JFD_CONTRACTS_NOTIFICATION_EXTENDED_CONTRACT", contractDesc, contractTurns+defaultTurnsExtension), convertTextKey("TXT_KEY_JFD_CONTRACTS_NOTIFICATION_CONTRACT_SHORT"), false, -1, -1, unitContractID)
			end
		else
			JFD_Contracts[contractID].ContractorID = playerID
			JFD_ChangeContractTurnsLeft(contractID, contractTurns)
			if contract.Category == "CONTRACT_JFD_MERCENARY" then
				local contractUnitID, contractUnitCount, contractUnitLevel = JFD_GetContractUnitID(contractID)
				if contractUnitID then
					JFD_CreateMercenaryUnits(playerID, contractID, contractUnitID, contractUnitCount, contractUnitLevel)
				end
			end
			if playerID == activePlayerID then
				local purchaseDing = contract.PurchaseDing
				if purchaseDing then
					Events.AudioPlay2DSound(purchaseDing)
				end
				Events.AudioPlay2DSound("AS2D_INTERFACE_POLICY")
				JFD_SendNotification(playerID, "NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER", convertTextKey("TXT_KEY_JFD_CONTRACTS_NOTIFICATION_NEW_CONTRACT", contractDesc, contractTurns), convertTextKey("TXT_KEY_JFD_CONTRACTS_NOTIFICATION_CONTRACT_SHORT"), false, -1, -1, unitContractID)
			end
		end
	else
		if isBreaking then
			player:ChangeGold(-contractCostBreak)
			if contract.Category == "CONTRACT_JFD_MERCENARY" then
				if JFD_GetRandom(1,100) <= contract.MutinyChance then
					isMutiny = true
					if playerID == activePlayerID then
						Events.AudioPlay2DSound("AS2D_INTERFACE_CITY_SCREEN_PURCHASE")
						Events.AudioPlay2DSound("AS2D_INTERFACE_POLICY")
						Events.AudioPlay2DSound("AS2D_INTERFACE_ENEMY_IN_TERRITORY")
						JFD_SendNotification(playerID, "NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER", convertTextKey("TXT_KEY_JFD_CONTRACTS_NOTIFICATION_CONTRACT_MUTINY", contractDesc), convertTextKey("TXT_KEY_JFD_CONTRACTS_NOTIFICATION_CONTRACT_MUTINY_SHORT"), false, -1, -1, unitContractID)
					end
				end
			end
		elseif isMutiny then
			if playerID == activePlayerID then
				Events.AudioPlay2DSound("AS2D_INTERFACE_ENEMY_IN_TERRITORY")
				JFD_SendNotification(playerID, "NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER", convertTextKey("TXT_KEY_JFD_CONTRACTS_NOTIFICATION_CONTRACT_MUTINY", contractDesc), convertTextKey("TXT_KEY_JFD_CONTRACTS_NOTIFICATION_CONTRACT_MUTINY_SHORT"), false, -1, -1, unitContractID)
			end
		end
		if contract.Category == "CONTRACT_JFD_MERCENARY" then
			JFD_DisbandMercenaryUnits(playerID, contractID, contractUnitID, isMutiny)
		end
		if playerID == activePlayerID then
			Events.AudioPlay2DSound("AS2D_INTERFACE_POLICY")
			JFD_SendNotification(playerID, "NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER", convertTextKey("TXT_KEY_JFD_CONTRACTS_NOTIFICATION_CONTRACT_ENDS", contractDesc), convertTextKey("TXT_KEY_JFD_CONTRACTS_NOTIFICATION_CONTRACT_SHORT"), false, -1, -1, unitContractID)
		end
		JFD_Contracts[contractID].ContractorID = nil
		JFD_Contracts[contractID].TurnsLeft = 0
	end
end
--------------------------------------------------------------------------------------------------------------------------
-- CONTRACT TURNS
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetContractTurns
function JFD_GetContractTurns(playerID, contractID)
	local player = Players[playerID]
	local contract = GameInfo.JFD_Contracts[contractID]
	local contractTurns = contract.Turns or 25
	for building in GameInfo.Building_JFD_ContractModifiers("TurnsModifier > 0") do
		local buildingID = GameInfoTypes[building.BuildingType]
		if player:CountNumBuildings(buildingID) > 0 then
			contractTurns = contractTurns + (contractTurns*building.TurnsModifier/100)
		end
	end
	for policy in GameInfo.Policy_JFD_ContractModifiers("TurnsModifier > 0") do
		local policyID = GameInfoTypes[policy.PolicyType]
		if player:HasPolicy(policyID) then
			contractTurns = contractTurns + (contractTurns*policy.TurnsModifier/100)
		end
	end
	for trait in GameInfo.Trait_JFD_ContractModifiers("TurnsModifier > 0") do
		local leaderType = GameInfo.Leaders[player:GetLeaderType()].Type
		for row in GameInfo.Leader_Traits("LeaderType = '" .. leaderType .. "' AND TraitType = '" .. trait.TraitType .. "'") do
			contractTurns = contractTurns + (contractTurns*trait.TurnsModifier/100)
			break
		end
	end
	return mathCeil(contractTurns*speedMod)
end

-- JFD_ChangeContractTurnsLeft
function JFD_ChangeContractTurnsLeft(contractID, change)
	local turnsLeft = JFD_GetContractTurnsLeft(contractID)
	JFD_Contracts[contractID].TurnsLeft = (turnsLeft + change)
end

-- JFD_GetContractTurnsLeft
function JFD_GetContractTurnsLeft(contractID)
	return JFD_Contracts[contractID].TurnsLeft or 0
end
--------------------------------------------------------------------------------------------------------------------------
-- CONTRACT COSTS
--------------------------------------------------------------------------------------------------------------------------
-- JFD_CanHaveContract
local reformEmancipationID = GameInfoTypes["POLICY_REFORM_JFD_LABOUR_EMANCIPATED"]
function JFD_CanHaveContract(playerID, contractID)
	if (not JFD_Contracts[contractID]) then 
		return false, false
	end
	local player = Players[playerID]
	local anyoneHasContract = JFD_AnyoneHasContract(contractID)
	if anyoneHasContract then 
		return false, true
	end
	local contract = GameInfo.JFD_Contracts[contractID]
	local contractSlavery = contract.IsSlavery
	if (contractSlavery and isUsingSovereignty) then
		if JFD_HasReform(playerID, reformEmancipationID) then
			return false, false
		end
	end
	local prereqCiv = contract.PrereqCivilization
	if prereqCiv then
		local prereqCivID = GameInfoTypes[prereqCiv]
		if player:GetCivilizationType() ~= prereqCivID then
			return false, false
		end
	end
	local contractUnitID, contractUnitCount, contractUnitLevel = JFD_GetContractUnitID(contractID)
	if (not contractUnitID) then
		return false, false
	end
	local unit = GameInfo.Units[contractUnitID]
	if unit.Domain == "DOMAIN_SEA" then
		local hasCoast = false
		for city in player:Cities() do
			if city:IsCoastal() then
				hasCoast = true
				break
			end
		end
		if (not hasCoast) then
			return false, true
		end
	end
	local currentEraID = player:GetCurrentEra()
	local contractObsoleteEra = contract.ObsoleteEra
	local contractObsoleteEraID = GameInfoTypes[contractObsoleteEra]
	if (contractObsoleteEraID and currentEraID >= contractObsoleteEraID) then 
		return false, true
	end
	local contractPrereqEra = contract.PrereqEra
	local contractPrereqEraID = GameInfoTypes[contractPrereqEra]
	if (contractPrereqEraID and currentEraID < contractPrereqEraID) then 
		return false, true
	end
	local contractCost = JFD_GetContractCost(playerID, contractID)
	local contractYieldCost = contract.YieldCost
	if contractYieldCost == "[ICON_PEACE]" then
		local currentFaith = player:GetFaith()
		if currentFaith < contractCost then 
			return false, true
		end
	elseif contractYieldCost == "[ICON_JFD_PIETY]" then
		local currentPiety = player:GetPiety()
		if currentPiety < contractCost then 
			return false, true
		end
	else
		local currentGold = player:GetGold()
		if currentGold < contractCost then 
			return false, true
		end
	end
	local contractPreqReligion = contract.PrereqReligion
	if contractPreqReligion then
		local preqReligionID = GameInfoTypes[contractPreqReligion]
		local religionID = player:GetReligionCreatedByPlayer()
		if isUsingPiety then
			religionID = player:GetStateReligion()
		end
		if preqReligionID ~= religionID then
			return false, false
		end
		if isUsingPiety then
			local contractPreqPietyLevel = contract.PrereqPietyLevel
			if contractPreqPietyLevel then
				local preqPietyLevelID = GameInfoTypes[contractPreqPietyLevel]
				local pietyLevelID = JFD_GetPietyLevelID(playerID)
				if pietyLevelID ~= preqPietyLevelID then
					return false, true
				end
			end
		end	
	end
	return true, true
end

-- JFD_CanBreakContract
function JFD_CanBreakContract(playerID, contractID)
	local player = Players[playerID]
	local contract = GameInfo.JFD_Contracts[contractID]
	local contractCost, contractCostBreak, contractCostExtend = JFD_GetContractCost(playerID, contractID)
	local contractYieldCost = contract.YieldCost
	if contractYieldCost == "[ICON_PEACE]" then
		local currentFaith = player:GetFaith()
		if currentFaith < contractCostBreak then 
			return false
		end
	elseif contractYieldCost == "[ICON_JFD_PIETY]" then
		local currentPiety = player:GetPiety()
		if currentPiety < contractCostBreak then 
			return false
		end
	else
		local currentGold = player:GetGold()
		if currentGold < contractCostBreak then 
			return false
		end
	end
	return true
end

-- JFD_CanExtendContract
function JFD_CanExtendContract(playerID, contractID)
	local player = Players[playerID]
	local contract = GameInfo.JFD_Contracts[contractID]
	local contractCategory = contract.Category
	if (contractCategory == "CONTRACT_JFD_MERCENARY" and isMercenaryContractsBanned) then return false end
	local contractCost, contractCostBreak, contractCostExtend = JFD_GetContractCost(playerID, contractID)
	local contractYieldCost = contract.YieldCost
	if contractYieldCost == "[ICON_PEACE]" then
		local currentFaith = player:GetFaith()
		if currentFaith < contractCostExtend then 
			return false
		end
	elseif contractYieldCost == "[ICON_JFD_PIETY]" then
		local currentPiety = player:GetPiety()
		if currentPiety < contractCostExtend then 
			return false
		end
	else
		local currentGold = player:GetGold()
		if currentGold < contractCostExtend then 
			return false
		end
	end
	local contractPreqReligion = contract.PrereqReligion
	if contractPreqReligion then
		local preqReligionID = GameInfoTypes[contractPreqReligion]
		local religionID = player:GetReligionCreatedByPlayer()
		if isUsingPiety then
			religionID = player:GetStateReligion()
		end
		if preqReligionID ~= religionID then
			return false
		end
		if isUsingPiety then
			local contractPreqPietyLevel = contract.PrereqPietyLevel
			if contractPreqPietyLevel then
				local preqPietyLevelID = GameInfoTypes[PrereqPietyLevel]
				local pietyLevelID = JFD_GetPietyLevel(playerID)
				if pietyLevelID ~= preqPietyLevelID then
					return false
				end
			end
		end	
	end
	return true
end

-- JFD_GetContractCost
function JFD_GetContractCost(playerID, contractID)
	local player = Players[playerID]
	local capital = player:GetCapitalCity()
	local contract = GameInfo.JFD_Contracts[contractID]
	local contractCategory = contract.Category
	local contractRating = contract.Rating
	local contractYieldCost = contract.YieldCost
	local contractYieldCostIsFaith = (contractYieldCost == "[ICON_PEACE]")
	local contractYieldCostIsPiety = (contractYieldCost == "[ICON_JFD_PIETY]")
	local contractUnitID, contractUnitCount, contractUnitLevel = JFD_GetContractUnitID(contractID)
	local contractCost = 0
	if contractCategory == "CONTRACT_JFD_MERCENARY" then
		if contractUnitID then
			local unitCost = player:GetUnitProductionNeeded(contractUnitID)*0.7
			if contractYieldCostIsFaith then
				unitCost = Game.GetFaithCost(contractUnitID)
				if unitCost == 0 then
					unitCost = (player:GetUnitProductionNeeded(contractUnitID)*0.1)
				end
			elseif contractYieldCostIsPiety then
				local currentPiety = player:GetPiety()
				if currentPiety == 0 then currentPiety = 100 end
				unitCost = mathFloor((currentPiety*3)/100)
			end
			contractCost = contractCost + (unitCost*contractUnitLevel)
			for value = 1, contractUnitCount do
				contractCost = contractCost + ((contractCost*20)/100)
			end
		end
	end
	if (not player:IsHuman()) then
		contractCost = (contractCost*2)
	end
	for building in GameInfo.Building_JFD_ContractModifiers("CostModifier <> 0") do
		local buildingID = GameInfoTypes[building.BuildingType]
		if player:CountNumBuildings(buildingID) > 0 then
			contractCost = contractCost + (contractCost*building.CostModifier/100)
		end
	end
	for policy in GameInfo.Policy_JFD_ContractModifiers("CostModifier <> 0") do
		local policyID = GameInfoTypes[policy.PolicyType]
		if player:HasPolicy(policyID) then
			contractCost = contractCost + (contractCost*policy.CostModifier/100)
		end
	end
	for trait in GameInfo.Trait_JFD_ContractModifiers("CostModifier <> 0") do
		local leaderType = GameInfo.Leaders[player:GetLeaderType()].Type
		for row in GameInfo.Leader_Traits("LeaderType = '" .. leaderType .. "' AND TraitType = '" .. trait.TraitType .. "'") do
			contractCost = contractCost + (contractCost*trait.CostModifier/100)
			break
		end
	end
	return mathFloor(contractCost), mathFloor((contractCost*20)/100), mathFloor(contractCost/2)
end

-- JFD_GetContractMaintenance
local userSettingNoAIMaintenance = JFD_GetUserSetting("JFD_MERCENARIES_NO_AI_MAINTENANCE") == 1
function JFD_GetContractMaintenance(contractID)
	local contractCategory = GameInfo.JFD_Contracts[contractID].Category
	local unitMaintenance = 0
	if contractCategory == "CONTRACT_JFD_MERCENARY" then
		local contractUnitID, contractUnitCount, contractUnitLevel = JFD_GetContractUnitID(contractID)
		unitMaintenance = contractUnitCount
	end
	for building in GameInfo.Building_JFD_ContractModifiers("MaintenanceModifier > 0") do
		local buildingID = GameInfoTypes[building.BuildingType]
		if player:CountNumBuildings(buildingID) > 0 then
			unitMaintenance = unitMaintenance + (unitMaintenance*building.MaintenanceModifier/100)
		end
	end
	for policy in GameInfo.Policy_JFD_ContractModifiers("MaintenanceModifier > 0") do
		local policyID = GameInfoTypes[policy.PolicyType]
		if player:HasPolicy(policyID) then
			unitMaintenance = unitMaintenance + (unitMaintenance*policy.MaintenanceModifier/100)
		end
	end
	for trait in GameInfo.Trait_JFD_ContractModifiers("MaintenanceModifier > 0") do
		local leaderType = GameInfo.Leaders[player:GetLeaderType()].Type
		for row in GameInfo.Leader_Traits("LeaderType = '" .. leaderType .. "' AND TraitType = '" .. trait.TraitType .. "'") do
			unitMaintenance = unitMaintenance + (unitMaintenance*trait.MaintenanceModifier/100)
			break
		end
	end
	return mathCeil(unitMaintenance)
end

-- JFD_SetContractMaintenance
function JFD_SetContractMaintenance(contractID, contractMaintenance)
	JFD_Contracts[contractID].Maintenance = contractMaintenance
end

-- JFD_GetTotalContractMaintenance
function JFD_GetTotalContractMaintenance(playerID)
	return (JFD_GetTotalMercenaryContractMaintenance(playerID) + JFD_GetTotalLoanContractMaintenance(playerID))
end

-- JFD_GetTotalMercenaryContractMaintenance
function JFD_GetTotalMercenaryContractMaintenance(playerID)
	local player = Players[playerID]
	if ((not player:IsHuman()) and userSettingNoAIMaintenance) then return 0 end
	local contractMaintenance = 0
	if JFD_Contracts[0] then
		for contract in GameInfo.JFD_Contracts("Category = 'CONTRACT_JFD_MERCENARY'") do
			local contractID = contract.ID
			if JFD_Contracts[contractID] then
				local hasContract = JFD_HasContract(playerID, contractID)
				if hasContract then
					contractMaintenance = contractMaintenance + JFD_GetContractMaintenance(contractID)
				end
			end
		end
	end
	return contractMaintenance
end

-- JFD_GetTotalLoanContractMaintenance
function JFD_GetTotalLoanContractMaintenance(playerID)
	local player = Players[playerID]
	if ((not player:IsHuman()) and userSettingNoAIMaintenance) then return 0 end
	local contractMaintenance = 0
	for contract in GameInfo.JFD_Contracts("Category = 'CONTRACT_JFD_LOAN'") do
		local contractID = contract.ID
		if JFD_Contracts[contractID] then
			local hasContract = JFD_HasContract(playerID, contractID)
			if hasContract then
				contractMaintenance = contractMaintenance + JFD_GetContractMaintenance(contractID)
			end
		end
	end
	return contractMaintenance
end
--------------------------------------------------------------------------------------------------------------------------
-- CONTRACT TEXT
--------------------------------------------------------------------------------------------------------------------------
-- JFD_BuildContractOverview
function JFD_BuildContractOverview(playerID, contractID)
	local contract = GameInfo.JFD_Contracts[contractID]
	local canHaveContract = JFD_CanHaveContract(playerID, contractID)
	local contractType = contract.Type
	local contractCategory = contract.Category
	local contractCost = JFD_GetContractCost(playerID, contractID)
	local contractMaintenance = JFD_GetContractMaintenance(contractID)
	local contractDesc = contract.Description
	local contractPedia = contract.Civilopedia
	local contractRating = contract.Rating
	local contractYieldCost = contract.YieldCost
	local overviewText = Locale.ConvertTextKey("TXT_KEY_JFD_CONTRACT_OVERVIEW_MAINTENANCE_LABEL", contractMaintenance)
	if contractCategory == "CONTRACT_JFD_MERCENARY" then
		local contractUnitID, contractUnitCount, contractUnitLevel = JFD_GetContractUnitID(contractID)
		if contractUnitID then
			local player = Players[playerID]
			local unit = GameInfo.Units[contractUnitID]
			local unitCombat = unit.Combat
			local unitDesc = unit.Description
			local unitDomain = unit.Domain
			local unitHelp = unit.Help
			local unitMoves = unit.Moves
			if unitDomain == "DOMAIN_SEA" then
				local hasCoast = false
				for city in player:Cities() do
					if city:IsCoastal() then
						hasCoast = true
						break
					end
				end
				if (not hasCoast) then
					overviewText = overviewText .. Locale.ConvertTextKey("TXT_KEY_JFD_CONTRACT_OVERVIEW_REQ_COAST_LABEL")
				end
			end
			local contractPreqReligion = contract.PrereqReligion
			if contractPreqReligion then
				local religionID = GameInfoTypes[contractPreqReligion]
				local religion = GameInfo.Religions[religionID]
				overviewText = overviewText .. Locale.ConvertTextKey("TXT_KEY_JFD_CONTRACT_OVERVIEW_REQ_LABEL", religion.IconString, Game.GetReligionName(religionID))
			end
			overviewText = overviewText .. "[NEWLINE]" .. contractUnitCount .. "x " .. convertTextKey(unitDesc) .. " (" .. Locale.ConvertTextKey("TXT_KEY_JFD_CONTRACT_OVERVIEW_UNIT_LEVEL_LABEL", contractUnitLevel) .. ")"
		end
	end
	local resourceID = JFD_Contracts[contractID].Resource
	local resourceCount = JFD_Contracts[contractID].ResourceCount
	if (resourceID and resourceCount) then
		local resource = GameInfo.Resources[resourceID]
		local resourceFontIcon = resource.IconString
		local resourceDesc = resource.Description
		overviewText = overviewText .. "[NEWLINE]" .. resourceCount .. "x " .. resourceFontIcon .. " " .. convertTextKey(resourceDesc)
	end
	return overviewText
end
--=======================================================================================================================
-- LOAN CONTRACT UTILITIES
--=======================================================================================================================
--=======================================================================================================================
-- MERCENARY CONTRACT UTILITIES
--=======================================================================================================================
-- MERCENARIES
--------------------------------------------------------------------------------------------------------------------------
local promotionMercenaryID 	= GameInfoTypes["PROMOTION_JFD_MERCENARY"]
local promotionMercenaryIgnoreGGID 	= GameInfoTypes["PROMOTION_JFD_MERCENARY_IGNORE_GG"]
-- JFD_CreateMercenaryUnits
function JFD_CreateMercenaryUnits(playerID, contractID, unitID, unitCount, unitLevel)
	local player = Players[playerID]
	local capital = player:GetCapitalCity()
	local capitalX = capital:GetX()+1
	local capitalY = capital:GetY()+1
	local contract = GameInfo.JFD_Contracts[contractID]
	local contractRating = contract.Rating
	local contractPromotionID = GameInfoTypes[contract.PromotionType]
	local resource = JFD_Contracts[contractID].Resource
	local resourceCost = JFD_Contracts[contractID].ResourceCount
	if (resource and resourceCost) then
		local resourceID = GameInfo.Resources[resource].ID
		player:ChangeNumResourceTotal(resourceID, resourceCost)
	end
	for value = 1, unitCount do
		local mercenaryUnit = player:InitUnit(unitID, capitalX, capitalY)
		mercenaryUnit:JumpToNearestValidPlot()
		mercenaryUnit:SetHasPromotion(contractPromotionID, true)
		mercenaryUnit:SetHasPromotion(promotionMercenaryID, true)
		mercenaryUnit:SetHasPromotion(promotionMercenaryIgnoreGGID, true)
		mercenaryUnit:SetName(convertTextKey(contract.Description))
		mercenaryUnit:ChangeLevel(unitLevel)
		if mercenaryUnit:GetExperience() > 0 then
			mercenaryUnit:SetExperience(0)
		end
		if mercenaryUnit:IsCombatUnit() then
			for value = 1, unitLevel do
				local contractRatingPromotion = "PROMOTION_JFD_MERCENARY_" .. value
				local contractRatingPromotionID = GameInfoTypes[contractRatingPromotion]
				mercenaryUnit:SetHasPromotion(contractRatingPromotionID, true)
			end
		end
	end
end

-- JFD_DisbandMercenaryUnits
function JFD_DisbandMercenaryUnits(playerID, contractID, isMutiny)
	local player = Players[playerID]
	local contract = GameInfo.JFD_Contracts[contractID]
	for unit in player:Units() do
		local contractPromotionID = GameInfoTypes[contract.PromotionType]
		if unit:IsHasPromotion(contractPromotionID) then
			if isMutiny then
				local unitID = unit:GetUnitType()
				local unitX = unit:GetX()
				local unitY = unit:GetY()
				unit:Kill(63)
				local barbarianUnit = playerBarbarian:InitUnit(unitID, unitX, unitY)
				barbarianUnit:SetHasPromotion(contractPromotionID, true)
				local contractRating = contract.Rating
				for value = 1, contractRating do
					local contractRatingPromotion = "PROMOTION_JFD_MERCENARY_" .. contractRating
					local contractRatingPromotionID = GameInfoTypes[contractRatingPromotion]
					barbarianUnit:SetHasPromotion(contractRatingPromotionID, true)
				end
			else
				unit:Kill(-1)
			end			
		end
	end
	local resourceID = JFD_Contracts[contractID].Resource
	local resourceCount = JFD_Contracts[contractID].ResourceCount
	if (resourceID and resourceCount) then
		player:ChangeNumResourceTotal(resourceID, -resourceCount)
	end
end
--------------------------------------------------------------------------------------------------------------------------
-- MERCENARIES UNITS
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetRandomMercenaryStats
function JFD_GetRandomMercenaryStats(contractID)
	local contract = GameInfo.JFD_Contracts[contractID]
	local contractRating = contract.Rating
	local unitLevelRanges = {}
	unitLevelRanges[1] = 1
	unitLevelRanges[2] = JFD_GetRandom(1,2)
	unitLevelRanges[3] = JFD_GetRandom(3,5)
	unitLevelRanges[4] = JFD_GetRandom(5,6)
	unitLevelRanges[5] = JFD_GetRandom(6,8)
	
	local unitCountRanges = {}
	unitCountRanges[1] = JFD_GetRandom(1,5)
	unitCountRanges[2] = JFD_GetRandom(1,4)
	unitCountRanges[3] = JFD_GetRandom(1,3)
	unitCountRanges[4] = JFD_GetRandom(1,2)
	unitCountRanges[5] = 1

	local unitCount = unitCountRanges[contractRating]
	local unitLevel = unitLevelRanges[contractRating]
	
	return unitLevel, unitCount, unitLevel
end

-- JFD_GetRandomMercenaryFromType
function JFD_GetRandomMercenaryFromType(playerID, contractID, eraID)
	local contract = GameInfo.JFD_Contracts[contractID]
	local contractType = contract.Type
	local unitTypes = {}
	local count = 1
	for row in GameInfo.JFD_Contract_Units("ContractType = '" .. contractType .. "'") do
		local unitType = row.UnitType
		local unitID = GameInfoTypes[unitType]
		if unitID then
			local unit = GameInfo.Units[unitID]
			local unitClass = unit.Class
			local useUniqueIfAvailable = row.UseUniqueIfAvailable
			if useUniqueIfAvailable then
				local player = Players[playerID]
				unitID = GameInfoTypes[JFD_GetUniqueUnit(player, unitClass)]
			end
			local unitCost = unit.Cost
			local unitNoMerc = unit.JFD_CannnotBeMercenary
			if (unitCost > 0 and (not unitNoMerc)) then
				local prereqTech = unit.PrereqTech or "TECH_AGRICULTURE"
				local prereqTechID = GameInfoTypes[prereqTech]
				local prereqTechEra = GameInfo.Technologies[prereqTechID].Era
				local prereqTechEraID = GameInfoTypes[prereqTechEra]
				if (prereqTechEraID == eraID or prereqTechEraID == (eraID-1)) then
					unitTypes[count] = unitID
					count = count + 1
				end
			end
		else
			print(unitType .. " is missing from the Database!")
		end
	end
	return unitTypes[JFD_GetRandom(1,#unitTypes)]
end

-- JFD_GetRandomMercenaryFromClass
function JFD_GetRandomMercenaryFromClass(contractID, eraID)
	local contract = GameInfo.JFD_Contracts[contractID]
	local contractType = contract.Type
	local unitTypes = {}
	local count = 1
	for row in GameInfo.JFD_Contract_UnitClasses("ContractType = '" .. contractType .. "'") do
		local cultureType = row.CultureType
		local unitClassType = row.UnitClassType
		local useOnlyCultureType = row.UseOnlyCultureType
		for unit in GameInfo.Units("JFD_CannnotBeMercenary = 0 AND JFD_OnlyMercenary = 0 AND Class = '" .. unitClassType .. "'") do
			local prereqTech = unit.PrereqTech or "TECH_AGRICULTURE"
			local prereqTechID = GameInfoTypes[prereqTech]
			local prereqTechEra = GameInfo.Technologies[prereqTechID].Era
			local prereqTechEraID = GameInfoTypes[prereqTechEra]
			if (prereqTechEraID == eraID or prereqTechEraID == (eraID-1)) then
				if (isUsingCulDiv and cultureType) then
					local unitClassID = GameInfoTypes[unitClassType]
					local unitClassDefault = GameInfo.UnitClasses[unitClassID].DefaultUnit
					local unitClassDefaultID = GameInfoTypes[unitClassDefault]
					if unit.ID ~= unitClassDefaultID then
						for row2 in GameInfo.Civilization_UnitClassOverrides("UnitType = '" .. unit.Type .. "'") do
							local civilizationType = row2.CivilizationType
							local civilizationID = GameInfoTypes[civilizationType]
							if (isUsingCPDLL and Game.GetCivilizationPlayer(civilizationID) == -1) then
								for row3 in GameInfo.Civilization_JFD_CultureTypes("CivilizationType = '" .. civilizationType .. "' AND CultureType = '" .. cultureType .. "'") do
									unitTypes[count] = unit.ID
									count = count + 1	
								end
							else
								for row3 in GameInfo.Civilization_JFD_CultureTypes("CivilizationType = '" .. civilizationType .. "' AND CultureType = '" .. cultureType .. "'") do
									unitTypes[count] = unit.ID
									count = count + 1	
								end
							end
						end
					else
						if (not useOnlyCultureType) then
							unitTypes[count] = unit.ID
							count = count + 1	
						end
					end
				else
					unitTypes[count] = unit.ID
					count = count + 1
				end
			elseif unit.Combat == 0 then
				unitTypes[count] = unit.ID
				count = count + 1
			end
		end
	end
	return unitTypes[JFD_GetRandom(1,#unitTypes)]
end

-- JFD_GetRandomMercenaryFromCombat
function JFD_GetRandomMercenaryFromCombat(contractID, eraID)
	local contract = GameInfo.JFD_Contracts[contractID]
	local contractType = contract.Type
	local unitTypes = {}
	local count = 1
	for row in GameInfo.JFD_Contract_UnitCombats("ContractType = '" .. contractType .. "'") do
		local cultureType = row.CultureType
		local unitCombatType = row.UnitCombatType
		local useOnlyCultureType = row.UseOnlyCultureType
		for unit in GameInfo.Units("Cost > 0 AND JFD_CannnotBeMercenary = 0 AND PrereqTech IS NOT NULL AND JFD_OnlyMercenary = 0 AND CombatClass = '" .. unitCombatType .. "'") do
			local prereqTech = unit.PrereqTech or "TECH_AGRICULTURE"
			local prereqTechID = GameInfoTypes[prereqTech]
			local prereqTechEra = GameInfo.Technologies[prereqTechID].Era
			local prereqTechEraID = GameInfoTypes[prereqTechEra]
			if (prereqTechEraID == eraID or prereqTechEraID == (eraID-1)) then
				if (isUsingCulDiv and cultureType) then
					local unitClass = unit.Class
					local unitClassID = GameInfoTypes[unitClass]
					local unitClassDefault = GameInfo.UnitClasses[unitClassID].DefaultUnit
					local unitClassDefaultID = GameInfoTypes[unitClassDefault]
					if unit.ID ~= unitClassDefaultID then
						for row2 in GameInfo.Civilization_UnitClassOverrides("UnitType = '" .. unit.Type .. "'") do
							local civilizationType = row2.CivilizationType
							local civilizationID = GameInfoTypes[civilizationType]
							if (isUsingCPDLL and Game.GetCivilizationPlayer(civilizationID) == -1) then
								for row3 in GameInfo.Civilization_JFD_CultureTypes("CivilizationType = '" .. civilizationType .. "' AND CultureType = '" .. cultureType .. "'") do
									unitTypes[count] = unit.ID
									count = count + 1	
								end
							else
								for row3 in GameInfo.Civilization_JFD_CultureTypes("CivilizationType = '" .. civilizationType .. "' AND CultureType = '" .. cultureType .. "'") do
									unitTypes[count] = unit.ID
									count = count + 1	
								end
							end
						end
					else
						if (not useOnlyCultureType) then
							unitTypes[count] = unit.ID
							count = count + 1	
						end
					end
				else
					unitTypes[count] = unit.ID
					count = count + 1
				end
			end
		end
	end
	return unitTypes[JFD_GetRandom(1,#unitTypes)]
end

-- JFD_AssignContractUnits
function JFD_AssignContractUnits(playerID, contractID, eraID)
	local contract = GameInfo.JFD_Contracts[contractID]
	local contractMaintenance, unitCount, unitLevel = JFD_GetRandomMercenaryStats(contractID)
	local unitID = JFD_GetRandomMercenaryFromType(playerID, contractID, eraID)
	if (unitID and contractMaintenance) then	
		-- JFD_SetContractMaintenance(contractID, contractMaintenance)
		JFD_SetContractUnitID(contractID, unitID, unitCount, unitLevel)
		return
	end
	unitID = JFD_GetRandomMercenaryFromClass(contractID, eraID)
	if (unitID and contractMaintenance) then	
		-- JFD_SetContractMaintenance(contractID, contractMaintenance)
		JFD_SetContractUnitID(contractID, unitID, unitCount, unitLevel)
		return
	end
	unitID = JFD_GetRandomMercenaryFromCombat(contractID, eraID)
	if (unitID and contractMaintenance) then	
		-- JFD_SetContractMaintenance(contractID, contractMaintenance)
		JFD_SetContractUnitID(contractID, unitID, unitCount, unitLevel)
		return
	end
end

-- JFD_GetContractUnitID
function JFD_GetContractUnitID(contractID)
	local contract = JFD_Contracts[contractID]
	if contract then
		return contract.UnitID, contract.UnitCount, contract.UnitLevel
	else
		return nil
	end
end

-- JFD_SetContractUnitID
function JFD_SetContractUnitID(contractID, unitID, unitCount, unitLevel)
	local unitType = GameInfo.Units[unitID].Type
	JFD_Contracts[contractID].Resource = nil
	JFD_Contracts[contractID].ResourceCount = nil
	for row in GameInfo.Unit_ResourceQuantityRequirements("UnitType = '" .. unitType .. "'") do
		JFD_Contracts[contractID].Resource = row.ResourceType
		JFD_Contracts[contractID].ResourceCount = (row.Cost*unitCount)
	end
	JFD_Contracts[contractID].UnitID = unitID
	JFD_Contracts[contractID].UnitCount = unitCount
	JFD_Contracts[contractID].UnitLevel = unitLevel
end

-- JFD_IsUnitMercenary
function JFD_IsUnitMercenary(playerID, unitID)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	if unit:IsHasPromotion(promotionMercenaryID) then
		return true
	else
		return false
	end
end	
--=======================================================================================================================
--=======================================================================================================================