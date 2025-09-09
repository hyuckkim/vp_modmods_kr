-- JFD_PapalStates_Decisions
-- Author: JFD
--=======================================================================================================================
-- include("EventsAndDecisions_Utilities")
print("JFD's Papal States Decisions: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local mathMax				= math.max
local mathCeil				= math.ceil
local mathFloor				= math.floor
--------------------------------------------------------------------------------------------------------------------------
-- JFD_IsUsingPietyPrestige
--------------------------------------------------------------------------------------------------------------------------
function JFD_IsUsingPietyPrestige()
	local pietyPrestigeModID = "eea66053-7579-481a-bb8d-2f3959b59974"
	local isUsingPiety = false
	
	for _, mod in pairs(Modding.GetActivatedMods()) do
	  if (mod.ID == pietyPrestigeModID) then
	    isUsingPiety = true
	    break
	  end
	end

	return isUsingPiety
end
-------------------------------------------------------------------------------------------------------------------------
-- JFD_SendWorldEvent
------------------------------------------------------------------------------------------------------------------------
function JFD_SendWorldEvent(playerID, description)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if (not player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end
-------------------------------------------------------------------------------------------------------------------------
-- GetStrongestMilitaryUnit_Adapted
------------------------------------------------------------------------------------------------------------------------
function GetStrongestMilitaryUnit_Adapted(pPlayer, bIgnoreResources, ...)
	local tUnit = {["ID"] = GameInfoTypes.UNIT_WARRIOR, ["Combat"] = -1}
	local iResource = 0
	for iKey, sDomain in pairs({...}) do
		for row in GameInfo.Units("Domain = \'" .. sDomain .. "\'") do
			local bRequiresResource = false
			local bEnoughResource = true
			if pPlayer:CanTrain(row.ID, bIgnoreResources) and row.Combat > tUnit.Combat then
				for i in GameInfo.Unit_ResourceQuantityRequirements() do
					if i.UnitType == row.Type and i.Cost > 0 then
						bRequiresResource = true
						local iNumResources = pPlayer:GetNumResourceAvailable(GameInfoTypes[i.ResourceType], true)
						if iNumResources < i.Cost and iNumResources <= 0 and bEnoughResource == true then
							bEnoughResource = false
							break -- save cpu, break it since we don't need it anymore
						end
					end
				end
				if (bRequiresResource == false) or (bRequiresResource == true and bEnoughResource == true) then 
					tUnit = row
				end
			end
		end
	end
	return tUnit.ID
end
-------------------------------------------------------------------------------------------------------------------------
-- GetEraScaling
------------------------------------------------------------------------------------------------------------------------
function GetEraScaling(iEra)
	iScaling = iEra
	return mathMax(iScaling, 1)
end
-------------------------------------------------------------------------------------------------------------------------
-- IsCivilizationInTeam
------------------------------------------------------------------------------------------------------------------------
function IsCivilizationInTeam(iCivilization, iTeam)
	local bValid = false
	for iSlot = 0, GameDefines.MAX_CIV_PLAYERS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		local pSlotPlayer = Players[iSlot]
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if iCivilization == pSlotPlayer:GetCivilizationType() and iTeam == pSlotPlayer:GetTeam() then
				bValid = true
				break
			end
		end
	end
	return bValid
end
-------------------------------------------------------------------------------------------------------------------------
-- GetNumMajorCivsInTeam
------------------------------------------------------------------------------------------------------------------------
function GetNumMajorCivsInTeam(iTeam)
	local iNum = 0
	for iSlot = 0, GameDefines.MAX_CIV_PLAYERS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		local pSlotPlayer = Players[iSlot]
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if pSlotPlayer:IsMajorCiv() == true and iTeam == pSlotPlayer:GetTeam() then
				iNum = iNum + 1
			end
		end
	end
	return iNum
end
--=======================================================================================================================
-- Civ Specific Decisions
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local civilisationID		= GameInfoTypes["CIVILIZATION_JFD_PAPAL_STATES"]
local isUsingPietyPrestige	= JFD_IsUsingPietyPrestige()
-------------------------------------------------------------------------------------------------------------------------
-- Papal States: Declare the Kingdom of God
-------------------------------------------------------------------------------------------------------------------------
local unitDiscipleID = GameInfoTypes["UNIT_JFD_DISCIPLE"]

local Decisions_KingdomofGod = {}
	Decisions_KingdomofGod.Name = "TXT_KEY_DECISIONS_JFD_PAPAL_STATES_KINGDOM_OF_GOD"
	Decisions_KingdomofGod.Desc = "TXT_KEY_DECISIONS_JFD_PAPAL_STATES_KINGDOM_OF_GOD_DESC"
	HookDecisionCivilizationIcon(Decisions_KingdomofGod, "CIVILIZATION_JFD_PAPAL_STATES")
	Decisions_KingdomofGod.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		if load(player, "Decisions_KingdomofGod") == true then
			Decisions_KingdomofGod.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_PAPAL_STATES_KINGDOM_OF_GOD_ENACTED_DESC")
			return false, false, true
		end
		
		local religionID = player:GetReligionCreatedByPlayer()
		local religiousUnity = (GetReligiousUnity(player, religionID) or 0) * 100
		if religionID <= 0 then religiousUnity = 0 end
		
		local iEra = player:GetCurrentEra()
		
		local goldCost = mathCeil(100 * iMod * GetEraScaling(iEra))
		local faithCost = mathCeil(250 * iMod * GetEraScaling(iEra))
		Decisions_KingdomofGod.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_PAPAL_STATES_KINGDOM_OF_GOD_DESC", religiousUnity, goldCost, faithCost)

		if player:GetNumResourceAvailable(iMagistrate, false) < 1 	then return true, false end
		if religiousUnity < 90 										then return true, false end
		if player:GetGold()  < goldCost 							then return true, false end
		if player:GetFaith() < faithCost			 			   then return true, false end
		if player:GetReligionCreatedByPlayer() <= 0 				then return true, false end

		return true, true
	end
	)
	
	Decisions_KingdomofGod.DoFunc = (
	function(player)
		local iEra = player:GetCurrentEra()
		local goldCost = mathCeil(100 * iMod * GetEraScaling(iEra))
		local faithCost = mathCeil(250 * iMod * GetEraScaling(iEra))
		local pCapital = player:GetCapitalCity()
		player:ChangeGold(-goldCost)
		player:ChangeFaith(-faithCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		Events.AudioPlay2DSound("AS2D_DISCIPLE_ARTIST_WRITER")
		InitUnitFromCity(pCapital, unitDiscipleID, 2)

		local description =  Locale.ConvertTextKey("TXT_KEY_JFD_PAPAL_STATES_KINGDOM_OF_GOD_DESC");
		PreGame.SetCivilizationDescription(player:GetID(), "TXT_KEY_JFD_PAPAL_STATES_KINGDOM_OF_GOD_DESC")
		PreGame.SetCivilizationShortDescription(player:GetID(), "TXT_KEY_JFD_PAPAL_STATES_KINGDOM_OF_GOD_DESC")
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_PAPAL_KINGDOM_OF_GOD")) 
		save(player, "Decisions_KingdomofGod", true)
	end
	)

	Decisions_KingdomofGod.Monitors = {}
	Decisions_KingdomofGod.Monitors[GameEvents.DeclareWar] = (
	function(iPlayer, iAgainstTeam, bAggressor)
		local pPlayer = Players[iPlayer]
		local pAgainstTeam = Teams[iAgainstTeam]
		if pPlayer:GetCivilizationType() ~= civilisationID and IsCivilizationInTeam(civilisationID, iAgainstTeam) == false then return end
		if pPlayer:IsMajorCiv() == false then return end -- JJ: Both IsMajorCiv() methods here are from CPDLL
		if GetNumMajorCivsInTeam(iAgainstTeam) == 0 then return end
		--if pAgainstTeam:IsMajorCiv() == false then return end -- JJ: This method only checks if the first alive player in the team is a minor / barbarian / observer, not that great for what we want to do
		local iNumCities = 0
		local iReligion = 0 -- the id 0 is almost surely RELIGION_PANTHEON
		-- JJ: Case when Papal States declares war
		--[[if pPlayer:GetCivilizationType() == civilisationID then
			if load(pPlayer, "Decisions_KingdomofGod") == true then
				local iReligion = pPlayer:GetReligionCreatedByPlayer()
				if iReligion > 0 then
					iNumCities = Game.GetNumCitiesFollowing(iReligion)
				end
				if iNumCities > 0 then
					local pCapital = pPlayer:GetCapitalCity()
					local iNumUnits = mathFloor(iNumCities / 5)
					if iNumUnits > 0 then
						for i = 0, iNumUnits-1, 1 do
							iBestUnit = GetStrongestMilitaryUnit_Adapted(pPlayer, true, "DOMAIN_LAND")
							InitUnitFromCity(pCapital, iBestUnit, 1)
						end
					end
				end
			end
		end]]
		-- JJ: Case when someone declares war on Papal States (not an elseif because someone might put two Papal States in the game)
		if IsCivilizationInTeam(civilisationID, iAgainstTeam) == true then
			for iPapalSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
				local pPapalPlayer = Players[iPapalSlot]
				local papalSlotStatus = PreGame.GetSlotStatus(iPapalSlot)
				if (papalSlotStatus == SlotStatus["SS_TAKEN"] or papalSlotStatus == SlotStatus["SS_COMPUTER"]) then 
					if civilisationID == pPapalPlayer:GetCivilizationType() and iAgainstTeam == pPapalPlayer:GetTeam() and load(pPapalPlayer, "Decisions_KingdomofGod") == true then
						local iReligion = pPapalPlayer:GetReligionCreatedByPlayer()
						if iReligion > 0 then
							iNumCities = Game.GetNumCitiesFollowing(iReligion)
						end
						if iNumCities > 0 then
							local pCapital = pPapalPlayer:GetCapitalCity()
							local iNumUnits = mathFloor(iNumCities / 5)
							if iNumUnits > 0 then
								for i = 0, iNumUnits-1, 1 do
									iBestUnit = GetStrongestMilitaryUnit_Adapted(pPapalPlayer, true, "DOMAIN_LAND")
									InitUnitFromCity(pCapital, iBestUnit, 1)
								end
							end
						end
					end
				end
			end
		end
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_KingdomofGod", Decisions_KingdomofGod)
-------------------------------------------------------------------------------------------------------------------------
-- Papal States: Institute the Societas Jesu
-------------------------------------------------------------------------------------------------------------------------
local policySocietasJesuID = GameInfoTypes["POLICY_DECISIONS_JFD_PAPAL_STATES_SOCIETAS_JESU"]
local Decisions_SocietasJesu = {}
	Decisions_SocietasJesu.Name = "TXT_KEY_DECISIONS_JFD_PAPAL_STATES_SOCIETAS_JESU"
	Decisions_SocietasJesu.Desc = "TXT_KEY_DECISIONS_JFD_PAPAL_STATES_SOCIETAS_JESU_DESC"
	HookDecisionCivilizationIcon(Decisions_SocietasJesu, "CIVILIZATION_JFD_PAPAL_STATES")
	Decisions_SocietasJesu.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		
		if load(player, "Decisions_SocietasJesu") == true then
			Decisions_SocietasJesu.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_PAPAL_STATES_SOCIETAS_JESU_ENACTED_DESC")
			return false, false, true
		end

		local iEra = player:GetCurrentEra()
		local goldCost = mathCeil(100 * iMod * GetEraScaling(iEra))
		local faithCost = mathCeil(100 * iMod * GetEraScaling(iEra))
		Decisions_SocietasJesu.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_PAPAL_STATES_SOCIETAS_JESU_DESC", goldCost, faithCost)
		
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 		then return true, false end
		if player:GetGold() < goldCost									then return true, false end
		if player:GetFaith() < faithCost								then return true, false end
		if Game.GetNumReligionsStillToFound()  > 0 						then return true, false end
		if player:GetReligionCreatedByPlayer() <= 0 					then return true, false end

		return true, true
	end
	)
	
	Decisions_SocietasJesu.DoFunc = (
	function(player)
		local iEra = player:GetCurrentEra()
		local goldCost = mathCeil(100 * iMod * GetEraScaling(iEra))
		local faithCost = mathCeil(100 * iMod * GetEraScaling(iEra))
		player:ChangeFaith(-faithCost)
		player:ChangeGold(-goldCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:GrantPolicy(policySocietasJesuID, true) -- JJ: This is a CPDLL method
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_PAPAL_JESUITS")) 
		save(player, "Decisions_SocietasJesu", true)
	end
	)

Decisions_AddCivilisationSpecific(civilisationID, "Decisions_SocietasJesu", Decisions_SocietasJesu)
--=======================================================================================================================
--=======================================================================================================================