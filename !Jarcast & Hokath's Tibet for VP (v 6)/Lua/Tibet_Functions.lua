-- Tibet_Functions
-- Author: Jarcast
-- DateCreated: 3/19/2024 12:54:58 PM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
include("FLuaVector.lua")
include("IconSupport.lua")
include("InstanceManager.lua")
include("PlotIterators.lua")
include("C15_IteratorPack_v3.lua")
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
local Teams 					= Teams
local activeiPlayer			= Game.GetActivePlayer()
local activePlayer				= Players[activeiPlayer]
local activeTeamID				= activePlayer:GetTeam()
local activeTeam				= Teams[activeTeamID]
--==========================================================================================================================
-- UTILITIES
--==========================================================================================================================
-- UTILITIES
----------------------------------------------------------------------------------------------------------------------------
--Game_IsUsingMod
local CBPmodID = "d1b6328c-ff44-4b0d-aad7-c657f83610cd"
local CBOmodID = "8411a7a8-dad3-4622-a18e-fcc18324c799"
local CSDmodID = "eead0050-1e3f-4178-a91f-26cf1881ac39"
local EEraModID = "ce8aa614-7ef7-4a45-a179-5329869e8d6d"
local EECBPmodID  = "87b2deae-83cb-9b88-9017-79e741d3739c"
local JPEPmodID  = "6f6c20b3-020c-4c62-9668-38e87eb66065"

function Game_IsUsingMod(modID)
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == modID then
			return true
		end
	end
	return false
end

local isUsingEEra = Game_IsUsingMod(EEraModID) or Game_IsUsingMod(EECBPmodID)
local isUsingCBP  = Game_IsUsingMod(CBPmodID)
local isUsingCBO  = Game_IsUsingMod(CBOmodID)
local isUsingJPE  = Game_IsUsingMod(JPEPmodID)
----------------------------------------------------------------------------------------------------------------------------
--HasTrait
function HasTrait(player, traitID)
	if Game_IsUsingMod(CBPmodID) then 
		return player:HasTrait(traitID)
	else
		local leaderType = GameInfo.Leaders[player:GetLeaderType()].Type
		local traitType  = GameInfo.Traits[traitID].Type
		for row in GameInfo.Leader_Traits("LeaderType = '" .. leaderType .. "' AND TraitType = '" .. traitType .. "'") do
			return true
		end
	end
	return false
end
-------------------------------------------------------------------------------------------------------------------------
-- GetRandom
function GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
-------------------------------------------------------------------------------------------------------------------------
--IsTraitActive
local slotComputerID = SlotStatus["SS_COMPUTER"]
local slotTakenID = SlotStatus["SS_TAKEN"]
function IsTraitActive(traitID)
	for slotID = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotPlayer = Players[slotID]
		local slotStatus = PreGame.GetSlotStatus(slotID)
		if (slotStatus == slotTakenID or slotStatus == slotComputerID) then
			if HasTrait(slotPlayer, traitID) then
				return true
			end
		end
	end
	return false
end
-------------------------------------------------------------------------------------------------------------------------
if Game then
	--Game.GetUserSetting
	function Game.GetUserSetting(type)
		for row in GameInfo.JFD_GlobalUserSettings("Type = '" .. type .. "'") do
			return row.Value
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------
function Player_GetPrimaryReligionID(iPlayer)
	local player = Players[iPlayer]
	local religionID = player:GetReligionCreatedByPlayer()
	if isUsingCBP then
		if religionID <= 0 then
			religionID = player:GetStateReligion()
		end
	else
		if religionID <= 0 then
			local capital = player:GetCapitalCity()
			religionID = capital:GetReligiousMajority()
		end
	end

	return religionID
end
----------------------------------------------------------------------------------------------------------------------------
function Jar_GetUnitEraCombatStrength(pUnit, pPlayer)
	local UnitType= GameInfo.Units[pUnit:GetUnitType()].Type
	local EraType = GameInfo.Eras[pPlayer:GetCurrentEra()].Type
	for row in GameInfo.Unit_EraCombatStrength("UnitType = '" .. UnitType .. "' AND EraType = '" .. EraType .. "'") do
		return row.CombatStrength
	end
end
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local onlycoastal= GameDefines.LAKE_MAX_AREA_SIZE +1
local CityWorkingRadius = GameDefines.MAXIMUM_WORK_PLOT_DISTANCE or 3
local iMod = ((GameInfo.GameSpeeds[Game.GetGameSpeedType()].BuildPercent)/100)
local iCiv = GameInfoTypes.CIVILIZATION_JAR_NANMADOL
local traitTibetID = GameInfoTypes.TRAIT_JAR_TIBET
local g_IsTraitActive = IsTraitActive(traitTibetID)
local iTibetUADummy = GameInfoTypes.BUILDING_JAR_DUMMY_TIBETUA
local iUURtakhrabClass = GameInfoTypes.UNITCLASS_KNIGHT;
local iUURtakhrab = GameInfoTypes.UNIT_JAR_RTAKHRAB;
local iDobDobDummy = GameInfoTypes.BUILDING_JAR_DUMMY_DOBDOB
local missionDobdob = MissionTypes.MISSION_JAR_KILL_MISSIONARY
local iPromoWisdomOfAge = GameInfoTypes.PROMOTION_JAR_RTAKHRAB2
local iPromoMissionDobdob = GameInfoTypes.PROMOTION_JAR_TIBETANTHEOCRACY
local iPromoMonPolice = GameInfoTypes.PROMOTION_JAR_MONASTICPOLICE
local iPromoAideWM = GameInfoTypes.PROMOTION_JAR_AIDEWORDLYMATTERS
local iCitadel = GameInfoTypes.IMPROVEMENT_CITADEL
local iHolySite = GameInfoTypes.IMPROVEMENT_HOLY_SITE
local eDummyPolicy = GameInfoTypes.POLICY_JAR_TIBET
local eDummyPolicy2 = GameInfoTypes.POLICY_JAR_TIBET2
local eDummyPolicy3 = GameInfoTypes.POLICY_JAR_TIBET3
local eDummyPolicyJPE = GameInfoTypes.POLICY_JAR_TIBET_JPE

local CUSTOM_MISSION_NO_ACTION		 	= 0
local CUSTOM_MISSION_ACTION			 	= 1
local CUSTOM_MISSION_DONE            	= 2
local CUSTOM_MISSION_ACTION_AND_DONE 	= 3
------------------------------------------------------------------------------------------------------------------------
-- QUICK MOD BALANCING PANEL
------------------------------------------------------------------------------------------------------------------------
-- Here are the changeable values that determine the strength of the effects described in the design.
-- UA
local iUARelFactor=1

-- UU1
local iRangeAIDobDob = 2
local iFaithfromKillMiss = 40
local iXPfromKillMiss = 5

-- UI
local NumLimitYakPasture = 10
--------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
--------------------------------------------------------------------------------------------------------------------------
-- TIBET UA
--========================================================================================================================
function Jar_Tibet_YieldConvert(playerID, bStart, iTurns)
    local pPlayer = Players[playerID]
    if (not pPlayer:IsAlive()) then return end
    if (not HasTrait(pPlayer, traitTibetID)) then return end
    local pCapital = pPlayer:GetCapitalCity();
    if not bStart and iTurns == 0 then
        pCapital:SetNumRealBuilding(iTibetUADummy, 0);
    else
        pCapital:SetNumRealBuilding(iTibetUADummy, 1);
    end    
end
if g_IsTraitActive then GameEvents.PlayerGoldenAge.Add(Jar_Tibet_YieldConvert) end

function Jar_Tibet_MountainsClam(iPlayer, iCityX, iCityY)
	local pPlayer = Players[iPlayer]
	local teamID = pPlayer:GetTeam()
	local pTeam = Teams[teamID]
	local pPlot = Map.GetPlot(iCityX, iCityY)
	local pCity = pPlot:GetPlotCity()
	local iCity = pCity:GetID()
	if HasTrait(pPlayer, traitTibetID) and pPlayer:IsAlive() then
		for adjacentPlot in PlotAreaSweepIterator(pPlot, CityWorkingRadius, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_INWARDS, CENTRE_INCLUDE) do
			if adjacentPlot and adjacentPlot:IsMountain() then
				if adjacentPlot:GetOwner() ~= iPlayer then
					adjacentPlot:SetOwner(iPlayer, iCity, true, true);
					--adjacentPlot:ChangeVisibilityCount(teamID, 1, -1, true, true);
					--adjacentPlot:SetRevealed(pTeam, true)
					adjacentPlot:UpdateFog();
				end
			end
		end
	end
end
if g_IsTraitActive then GameEvents.PlayerCityFounded.Add(Jar_Tibet_MountainsClam) end

function Jar_TibetUA_PantheonFounded(playerID, cityID, religionID, iBelief)
	local pPlayer = Players[playerID]
	if (not pPlayer:IsAlive()) then return end
	if (not HasTrait(pPlayer, traitTibetID)) then return end
	if not pPlayer:HasPolicy(eDummyPolicyJPE) then
		pPlayer:GrantPolicy(eDummyPolicyJPE, true)
	end	
end
if g_IsTraitActive then GameEvents.PantheonFounded.Add(Jar_TibetUA_PantheonFounded) end

function Jar_TibetUA_ReligionFounded(playerID, cityID, religionID, iBelief1, iBelief2, iBelief3, iBelief4, iBelief5)
	local pPlayer = Players[playerID]
	if pPlayer:IsAlive() and HasTrait(pPlayer, traitTibetID) then
		if not pPlayer:HasPolicy(eDummyPolicy) then
			pPlayer:GrantPolicy(eDummyPolicy, true)
		end
	end
end
if g_IsTraitActive then GameEvents.ReligionFounded.Add(Jar_TibetUA_ReligionFounded) end

function Jar_TibetUA_ReligionEnhanced(playerID, religionID, iBelief1, iBelief2)
	local pPlayer = Players[playerID]
	if pPlayer:IsAlive() and HasTrait(pPlayer, traitTibetID) then
		if not pPlayer:HasPolicy(eDummyPolicy2) then
			pPlayer:GrantPolicy(eDummyPolicy2, true)
		end
	end
end
if g_IsTraitActive then GameEvents.ReligionEnhanced.Add(Jar_TibetUA_ReligionEnhanced) end

function Jar_TibetUA_ReligionReformed(playerID, religionID, iBelief)
	local pPlayer = Players[playerID]
	if pPlayer:IsAlive() and HasTrait(pPlayer, traitTibetID) then
		if not pPlayer:HasPolicy(eDummyPolicy3) then
			pPlayer:GrantPolicy(eDummyPolicy3, true)
		end
	end
end
if g_IsTraitActive then GameEvents.ReligionReformed.Add(Jar_TibetUA_ReligionReformed) end
--==========================================================================================================================
-- UU1: DOB-DOB
--==========================================================================================================================
function Jar_DobDob_TibetOnly(playerID, unitID)
	local pPlayer = Players[playerID]
	if unitID == GameInfoTypes.UNIT_JAR_DOBDOB then return HasTrait(pPlayer, traitTibetID) end
	return true
end
GameEvents.PlayerCanTrain.Add(Jar_DobDob_TibetOnly)

function Jar_CanDoUUDobDobKillRel(unit) -- checks if a unit is on a valid plot
	local pBool = false;
	local pPlot = unit:GetPlot();
	if unit:MovesLeft() <= 1 then return pBool end
	local unitOwner = unit:GetOwner()
	for pAdjacentPlot in PlotAreaSweepIterator(pPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_INWARDS, CENTRE_INCLUDE) do
		if pAdjacentPlot and pAdjacentPlot:IsUnit() then
			for pUnit in Cunt15_PlotUnitsIterator(pAdjacentPlot) do
				if pUnit:GetUnitClassType() == GameInfoTypes.UNITCLASS_MISSIONARY
				and pUnit:GetReligion() ~= Player_GetPrimaryReligionID(unitOwner) then
					pBool = true;
					break
				end
			end
		end		
	end
	return pBool
end

function Jar_DoUUDobDobKillRel(pPlayer, pUnit)
	local pUnitPlot = pUnit:GetPlot();
	local unitOwnerID = pUnit:GetOwner()
	for pAdjacentPlot in PlotAreaSweepIterator(pUnitPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_INWARDS, CENTRE_INCLUDE) do
		if pAdjacentPlot and pAdjacentPlot:IsUnit() then
			for zUnit in Cunt15_PlotUnitsIterator(pAdjacentPlot) do
				if zUnit:GetUnitClassType() == GameInfoTypes.UNITCLASS_MISSIONARY
				and zUnit:GetReligion() ~= Player_GetPrimaryReligionID(unitOwnerID) then
					local iNumSpread= zUnit:GetSpreadsLeft()
					if iNumSpread > 0 then
						local bonus = iFaithfromKillMiss*iNumSpread
						pPlayer:ChangeFaith(bonus)
						stringtext = "+" .. bonus .. " [ICON_PEACE]"
						Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(pAdjacentPlot:GetX(), pAdjacentPlot:GetY()))), stringtext, 2)
					end
					zUnit:Kill()
					pUnit:ChangeExperience(iXPfromKillMiss)
				end
			end
		end
	end
end

-- Jar_UUDobDobKillRelMissionStart
local function Jar_UUDobDobKillRelMissionStart(playerID, unitID, missionID, data1, data2, flags, turn)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	local plot = unit:GetPlot()
	if missionID == missionDobdob then
		Jar_DoUUDobDobKillRel(player, unit)
		return CUSTOM_MISSION_ACTION
	end
	return CUSTOM_MISSION_NO_ACTION
end

-- Jar_UUDobDobKillRelMissionCompleted
local function Jar_UUDobDobKillRelMissionCompleted(playerID, unitID, missionID, data1, data2, flags, turn)
	return (missionID == missionDobdob)
end

-- Jar_UUDobDobKillRelMissionPossible
local function Jar_UUDobDobKillRelMissionPossible(playerID, unitID, missionID, data1, data2, _, _, plotX, plotY, bTestVisible)
	if ((not playerID) or (not unitID) or (not missionID)) then return end
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	if missionID == missionDobdob then
		if unit:IsHasPromotion(iPromoMissionDobdob) then
			if Jar_CanDoUUDobDobKillRel(unit) then
				return true
			else
				return bTestVisible
			end
		end
	end	
	return false
end

GameEvents.CustomMissionStart.Add(Jar_UUDobDobKillRelMissionStart)
GameEvents.CustomMissionCompleted.Add(Jar_UUDobDobKillRelMissionCompleted)
GameEvents.CustomMissionPossible.Add(Jar_UUDobDobKillRelMissionPossible)


function Jar_Tibet_AIDoPerformAction(playerID)
	local aPlayer = Players[playerID]
	if aPlayer:IsHuman() then return end	
	if aPlayer:GetNumUnitPromotions(iPromoMissionDobdob) <1 then return end
	for aUnit in aPlayer:Units() do
		if aUnit:IsHasPromotion(iPromoMissionDobdob) then
			local aUnitPlot = aUnit:GetPlot();
			for adjacentPlot in PlotAreaSweepIterator(aUnitPlot, iRangeAIDobDob, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_INWARDS, CENTRE_INCLUDE) do
				if adjacentPlot and adjacentPlot:IsUnit() then
					for zUnit in Cunt15_PlotUnitsIterator(adjacentPlot) do
						if zUnit:GetUnitClassType() == GameInfoTypes.UNITCLASS_MISSIONARY
						and zUnit:GetReligion() ~= Player_GetPrimaryReligionID(playerID) then
							local iNumSpread= zUnit:GetSpreadsLeft()
							if iNumSpread > 0 then
								local bonus = iFaithfromKillMiss*iNumSpread
								aPlayer:ChangeFaith(bonus)
								stringtext = "+" .. bonus .. " [ICON_PEACE]"
								Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(aUnitPlot:GetX(), aUnitPlot:GetY()))), stringtext, 2)
							end
							zUnit:Kill()
							aUnit:ChangeExperience(iXPfromKillMiss)
						end
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(Jar_Tibet_AIDoPerformAction)

tImprovementsGP = {}
for row in DB.Query("SELECT ID from Improvements WHERE CreatedByGreatPerson=1") do
	tImprovementsGP[row.ID] = true
end

function Jar_Tibet_MonasticPolicePromo(playerID)
	local pPlayer = Players[playerID]	
	if pPlayer:GetNumUnitPromotions(iPromoMonPolice) <1 then return end
	for pUnit in pPlayer:Units() do
		if pUnit:IsHasPromotion(iPromoMonPolice) then
			local pUnitPlot = pUnit:GetPlot();
			local bCheck= false
			if pUnitPlot and pUnitPlot:GetOwner() == playerID then 
				if pUnitPlot:IsCity() or tImprovementsGP[pUnitPlot:GetImprovementType()] then
					bCheck= true
				end
				if not bCheck then
					for pAdjacentPlot in Cunt15_AdjacentPlotIterator(pUnitPlot) do
						if pAdjacentPlot and pAdjacentPlot:GetOwner() == playerID then 
							if pAdjacentPlot:IsCity() or tImprovementsGP[pAdjacentPlot:GetImprovementType()] then
								bCheck= true
								break
							end
						end
					end
				end
			end
			if bCheck then				
				local strength = Jar_GetUnitEraCombatStrength(pUnit, pPlayer)
				pUnit:SetBaseCombatStrength(math.floor( strength *1.25));
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(Jar_Tibet_MonasticPolicePromo)

function Jar_Tibet_AideWordlyMattersPromo(iPlayer)
	local pPlayer = Players[iPlayer]
	if not pPlayer:IsAlive() then return end
	if pPlayer:GetNumUnitPromotions(iPromoAideWM) <1 then return end
	for pCity in pPlayer:Cities() do
		local pCityPlot = pCity:Plot()
		local bCheck = false
		if pCityPlot and pCityPlot:IsUnit() then
			for pUnit in Cunt15_PlotUnitsIterator(pCityPlot) do
				if pUnit:IsHasPromotion(iPromoAideWM) then
					bCheck = true
					break
				end
			end
		end
		if bCheck then
			pCity:SetNumRealBuilding(iDobDobDummy, 1)
		else
			pCity:SetNumRealBuilding(iDobDobDummy, 0)
		end	
	end
end
GameEvents.PlayerDoTurn.Add(Jar_Tibet_AideWordlyMattersPromo)
--==========================================================================================================================
-- UU2: RTAKHRAB
--==========================================================================================================================
function Hokath_TibetUU1(iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlayer:GetNumUnitPromotions(iPromoWisdomOfAge) <1 then return end
	for pUnit in pPlayer:Units() do
		if pUnit:IsHasPromotion(iPromoWisdomOfAge) then
			local strength = GameInfo.Units[pUnit:GetUnitType()].Combat
			pUnit:SetBaseCombatStrength(pUnit:GetLevel() + strength );
		end
	end
end
GameEvents.PlayerDoTurn.Add(Hokath_TibetUU1)
---------------------------------------------------------
print("Jarcast and Hokath's Tibet functions loaded")
--==========================================================================================================================
--==========================================================================================================================