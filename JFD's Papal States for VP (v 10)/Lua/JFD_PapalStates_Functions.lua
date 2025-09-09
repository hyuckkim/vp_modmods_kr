-- JFD_PapalStates_Functions
-- Author: JFD
-- DateCreated: 11/23/2013 12:54:04 PM
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- JFD_IsCivilisationActive
------------------------------------------------------------------------------------------------------------------------
function JFD_IsCivilisationActive(civilisationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilisationID then
				return true
			end
		end
	end

	return false
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetRandom
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
--=======================================================================================================================
-- CORE FUNCTIONS	
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local civilisationID			= GameInfoTypes["CIVILIZATION_JFD_PAPAL_STATES"]
local isPapalStatesCivActive	= JFD_IsCivilisationActive(civilisationID)
local unitDiscipleID			= GameInfoTypes["UNIT_JFD_DISCIPLE"]
local unitSwissGuardID			= GameInfoTypes["UNIT_JFD_SWISS_GUARD"]
local yieldFaithID				= YieldTypes["YIELD_FAITH"]
local artArtificatSlotID		= GameInfoTypes["GREAT_WORK_SLOT_ART_ARTIFACT"]
local literatureSlotID			= GameInfoTypes["GREAT_WORK_SLOT_LITERATURE"]
local musicSlotID				= GameInfoTypes["GREAT_WORK_SLOT_MUSIC"]
local missionaryClassID			= GameInfoTypes["UNITCLASS_MISSIONARY"]
local inquisitorClassID			= GameInfoTypes["UNITCLASS_INQUISITOR"]
	
if isPapalStatesCivActive then
	print("Pope Pius IX is in this game")
end
----------------------------------------------------------------------------------------------------------------------------
-- AreAllGreatWorkSlotsTypesAvailable (NEW)
----------------------------------------------------------------------------------------------------------------------------
-- Checks to see if we have at least one of each great work type.
function AreAllGreatWorkSlotsTypesAvailable(playerID)
	local player = Players[playerID]
	-- A mod might add additional great work types, while we always want to check these three types only
	if player:HasAvailableGreatWorkSlot(artArtificatSlotID) and player:HasAvailableGreatWorkSlot(literatureSlotID) and player:HasAvailableGreatWorkSlot(musicSlotID) then
		return true
	else
		return false
	end
	return false
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_AIDisciplePurchases (EDITED)
----------------------------------------------------------------------------------------------------------------------------
-- CPDLL AI does not handle religious civilian units which are not missionaries, inquisitors, or great people well
-- This function helps decide whether it is good to buy a Disciple, based on faith yields, the condition of our religion, whether we have great work slots, golden ages, etc
function JFD_AIDisciplePurchases(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilisationID and (not player:IsHuman()) and (not player:IsBarbarian())) then
		local capital = player:GetCapitalCity()
		if capital == nil then return end
		-- Case for has founded
		if player:HasCreatedReligion() == true then
			-- Only consider buying Disciples if all our cities have our religion, or we have a missionary or inquisitor
			local religionID = player:GetReligionCreatedByPlayer()
			local religionBool = true
			for city in player:Cities() do
				if city:GetReligiousMajority() ~= religionID then
					religionBool = false
					break
				end
			end
			if religionBool == true or (religionBool == false and player:GetUnitClassCount(missionaryClassID) > 0) or (religionBool == false and player:GetUnitClassCount(inquisitorClassID) > 0) then
				-- Can we actually purchase Disciples?
				if capital:IsCanPurchase(true, true, unitDiscipleID, -1, -1, yieldFaithID) then
					-- Do we have all types of Great Work slots available?
					if AreAllGreatWorkSlotsTypesAvailable(playerID) == true then
						if JFD_GetRandom(1,100) <= 90 then
							capital:Purchase(unitDiscipleID, -1 ,-1, yieldFaithID)
						end
					-- Are we not in a Golden Age and unhappy or losing gold?
					elseif player:GetGoldenAgeTurns() == 0 and (player:GetExcessHappiness() < 0 or player:CalculateGoldRate() < 0) then
						if JFD_GetRandom(1,100) <= 90 then
							capital:Purchase(unitDiscipleID, -1 ,-1, yieldFaithID)
						end
					-- Small chance to buy if above conditions not fulfilled (AI will pop it for golden age)
					else
						if JFD_GetRandom(1,100) <= 30 then
							capital:Purchase(unitDiscipleID, -1 ,-1, yieldFaithID)
						end
					end
				end
			end
		-- Case for not founded, and there's no religion left to found
		elseif player:HasCreatedReligion() == false and Game.GetNumReligionsStillToFound == 0 then
			-- Can we actually purchase Disciples?
			if capital:IsCanPurchase(true, true, unitDiscipleID, -1, -1, yieldFaithID) then
				-- Do we have all types of Great Work slots available?
				if AreAllGreatWorkSlotsTypesAvailable(playerID) == true then
					if JFD_GetRandom(1,100) <= 90 then
						capital:Purchase(unitDiscipleID, -1 ,-1, yieldFaithID)
					end
				-- Are we not in a Golden Age and unhappy or losing gold?
				elseif player:GetGoldenAgeTurns() == 0 and (player:GetExcessHappiness() < 0 or player:CalculateGoldRate() < 0) then
					if JFD_GetRandom(1,100) <= 90 then
						capital:Purchase(unitDiscipleID, -1 ,-1, yieldFaithID)
					end
				-- Small chance to buy if above conditions not fulfilled (AI will pop it for golden age)
				else
					if JFD_GetRandom(1,100) <= 30 then
						capital:Purchase(unitDiscipleID, -1 ,-1, yieldFaithID)
					end
				end
			end
		end
	end
end

if isPapalStatesCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_AIDisciplePurchases)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_PapalStates_MoveAfterFaithPurchase (NEW)
----------------------------------------------------------------------------------------------------------------------------
-- This function is based on JFD's Kingdom of Portugal, JFD_Portugal_Convento_UnitTrained
-- Allows Disciples and Swiss Guard to move immediately after faith purchase (the column Unit.MoveAfterPurchase does not work for faith)

function JFD_PapalStates_MoveAfterFaithPurchase(playerID, cityID, unitID, isGold, isFaith)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if (not isFaith) then return end
	local city = player:GetCityByID(cityID)
	local unit = player:GetUnitByID(unitID)
	local unitTypeID = unit:GetUnitType()
	if unitTypeID == unitDiscipleID or unitTypeID == unitSwissGuardID then
		unit:ChangeMoves(unit:MaxMoves())
	end
end

if isPapalStatesCivActive then
	GameEvents.CityTrained.Add(JFD_PapalStates_MoveAfterFaithPurchase)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_PapalStates_BlockDisciplesInNonCapitals (NEW)
----------------------------------------------------------------------------------------------------------------------------
-- This function is based on JFD_BlockChapels from the original version of Papal States
-- Hides the Disciple from all cities except the capital

function JFD_PapalStates_BlockDisciplesInNonCapitals(playerID, cityID, unitTypeID)
	local player = Players[playerID]
	local city = player:GetCityByID(cityID)
	local capital = player:GetCapitalCity()
	local capitalCityID = capital:GetID()
	if cityID ~= capitalCityID and unitTypeID == unitDiscipleID then
	 return false
	end
	return true
end

if isPapalStatesCivActive then
	GameEvents.CityCanTrain.Add(JFD_PapalStates_BlockDisciplesInNonCapitals)
end
--==========================================================================================================================
--==========================================================================================================================