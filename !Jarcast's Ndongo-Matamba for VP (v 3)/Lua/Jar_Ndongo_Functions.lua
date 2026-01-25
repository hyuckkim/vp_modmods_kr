-- Ndongo-Matamba_Functions
-- Author: Jarcast
-- DateCreated: 8/16/2024 5:04:01 PM
--==========================================================================================================================
include("FLuaVector.lua")
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
local Teams 					= Teams
local activeiPlayer				= Game.GetActivePlayer()
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
-- HasTrait
function HasTrait(pPlayer, traitID)
	if Game_IsUsingMod(CBPmodID) then 
		return pPlayer:HasTrait(traitID)
	else
		local leaderType = GameInfo.Leaders[pPlayer:GetLeaderType()].Type
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
-- IsTraitActive
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
------------------------------------------------------------------------------------------------------------------------
-- GetStrongestMilitaryUnit (Sukritact)
function GetStrongestMilitaryUnit(pPlayer, bIgnoreResources, ...)
	local tUnit = {["ID"] = GameInfoTypes.UNIT_WARRIOR, ["Combat"] = 0}
	for iKey, sCombatType in pairs(arg) do
		for row in GameInfo.Units("CombatClass = \'" .. sCombatType .. "\'") do
			if pPlayer:CanTrain(row.ID, bIgnoreResources) and row.Combat > tUnit.Combat then
				tUnit = row
			end
		end
	end
	return tUnit.ID
end
-------------------------------------------------------------------------------------------------------------------------
function Jar_IsPlayerAtWarWithAnyone(playerID, bIncludeMinors)
    local pPlayer = Players[playerID]
    local iTeam = pPlayer:GetTeam()
    local pTeam = Teams[iTeam]
    local bIsAtWar = false
    for i = 0, GameDefines.MAX_CIV_PLAYERS - 1 do -- Iterate through everyone
        if i ~= playerID then -- If this isn't the Player, since you can't be at war with yourself...
            local pOtherPlayer = Players[i]
            if pOtherPlayer:IsAlive() then -- Can't be at war with the dead :p
                if not pOtherPlayer:IsBarbarian() then -- You're always at war with Barbs so ignore them
                    if (bIncludeMinors) or ((not bIncludeMinors) and (not pOtherPlayer:IsMinorCiv())) then -- If you've said to include City-States, then everyone will qualify; if you've said to not include them, then make sure pOtherPlayer isn't a City-State
                        local iOtherTeam = pOtherPlayer:GetTeam()
                        if pTeam:IsAtWar(iOtherTeam) then -- The crucial Method
                            bIsAtWar = true
                            break -- We've found someone we're at war with, so we don't need to check for any longer
                        end
                    end
                end
            end
        end
    end
    return bIsAtWar -- Returns either true or false to wherever you called the function
end
------------------------------------------------------------------------------------------------------------------------
function Jar_GetTraitPlayerFromTeam(teamID, traitID)
	local iTeam = 0
	for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local pPlayer = Players[iPlayer]
		if pPlayer and HasTrait(pPlayer, traitID) then
			iTeam = pPlayer:GetTeam()
			if iTeam == teamID then
				return pPlayer
			end
		end
	end
	return nil
end
-------------------------------------------------------------------------------------------------------------------------
function Jar_GetRequiredResourceIDfromUnitID( unitID)
	for row in DB.Query("SELECT a.ID UnitID, a.Type UnitType, c.ID ResID, c.Type ResType, b.Cost from Units a, Unit_ResourceQuantityRequirements b, Resources c WHERE a.Type= b.UnitType AND b.ResourceType= c.Type AND a.ID = '" .. unitID .. "'") do
		if row.ResID == nil then
			return -1
		else
			return row.ResID
		end
	end
end
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local iMod = ((GameInfo.GameSpeeds[Game.GetGameSpeedType()].TrainPercent)/100)
local iCiv = GameInfoTypes.CIVILIZATION_JAR_NDONGO
local traitNdongoID = GameInfoTypes.TRAIT_JAR_NZINGA
local g_IsTraitActive = IsTraitActive(traitNdongoID)
local iCivilServant = GameInfoTypes.SPECIALIST_CIVIL_SERVANT
local iTimerDummy = GameInfoTypes.BUILDING_JAR_NDUMMY
------------------------------------------------------------------------------------------------------------------------
-- QUICK MOD BALANCING PANEL
------------------------------------------------------------------------------------------------------------------------
-- Here are the changeable values that determine the strength of the effects described in the design.
-- UA
local GPbonus = 20
local UALimit = 15
local UADoWturns = math.floor(10 *iMod)

-- UU
local MakunzeScienceTurns = 5
local MakunzeSciencePercent = 20
--========================================================================================================================
-- FUNCTIONS
--========================================================================================================================
-- NDONGO UA
------------------------------------------------------------------------------------------------------------------------
function Jar_DiploUnitsExpended(iPlayer, iUnit, iUnitType, iX, iY, bDelay, iByPlayer)
	if not bDelay then
		if iByPlayer == -1 then
			local pPlayer = Players[iPlayer]
			local pUnit = pPlayer:GetUnitByID(iUnit)
			local pPlot = Map.GetPlot(iX, iY)
			if pUnit:GetUnitCombatType() == GameInfoTypes.UNITCOMBAT_DIPLOMACY and HasTrait(pPlayer, traitNdongoID) and Players[pPlot:GetOwner()]:IsMinorCiv() then
				local pCapital = pPlayer:GetCapitalCity()
				local bonusGP = GPbonus*math.max(1, pPlayer:GetCurrentEra())
				pCapital:ChangeSpecialistGreatPersonProgressTimes100(iCivilServant, bonusGP*100)
				pPlayer:ChangeCombatExperience(bonusGP)
				if pPlayer:IsHuman() then
					local stringtext = "+" .. bonusGP .. " [ICON_GREAT_GENERAL], [COLOR_YIELD_FOOD]+" .. bonusGP .. " [ENDCOLOR][ICON_DIPLOMAT]"
					Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iX, iY))), stringtext, 2)
				end
			end
		end
	end
end
if g_IsTraitActive then	GameEvents.UnitPrekill.Add(Jar_DiploUnitsExpended) end

function Jar_UABonusFromAllyCSOrMakunze(playerID)
    local pPlayer = Players[playerID]
    local pCapital = pPlayer:GetCapitalCity()
    if HasTrait(pPlayer, traitNdongoID) and pPlayer:IsAlive() and pCapital ~= nil then
        local count = 0
        for i = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_PLAYERS - 2 do
			local CSPlayer = Players[i]
			if CSPlayer:IsMinorCiv() then
				local iFriend = CSPlayer:GetMinorCivFriendshipLevelWithMajor(playerID)
				local NumMakunze = CSPlayer:CountAllImprovement(GameInfoTypes.IMPROVEMENT_JAR_MAKUNZE, false)
				if iFriend == 2 or NumMakunze >0 then			
					count = count + 1
				end
			end
		end
		for pCity in pPlayer:Cities() do
			pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_JAR_NDONGO, math.min(count, UALimit))
		end
    end
end
if g_IsTraitActive then	GameEvents.PlayerDoTurn.Add(Jar_UABonusFromAllyCSOrMakunze) end

function Jar_TicTokChickenClock(iPlayer)
	local pPlayer = Players[iPlayer]
	if HasTrait(pPlayer, traitNdongoID) and pPlayer:IsAlive() and pPlayer:CountNumBuildings(iTimerDummy) >0 then
		local pCapital = pPlayer:GetCapitalCity();
		local num = pCapital:GetNumBuilding(iTimerDummy)
		if num >0 then
			pCapital:SetNumRealBuilding(iTimerDummy,  num -1 )
		end
	end
end
if g_IsTraitActive then GameEvents.PlayerDoTurn.Add(Jar_TicTokChickenClock) end;

function Jar_CSgivesUnitsUponDoW(fromTeamID, toTeamID) -- attacking, defending
	local fromPlayerHasTrait = Jar_GetTraitPlayerFromTeam(fromTeamID, traitNdongoID)
	local toPlayerHasTrait = Jar_GetTraitPlayerFromTeam(toTeamID, traitNdongoID)
	if fromPlayerHasTrait and fromPlayerHasTrait:CountNumBuildings(iTimerDummy) <1 and not Players[Teams[toTeamID]:GetLeaderID()]:IsMinorCiv() then
		print("Attacking Civ: " .. Locale.ConvertTextKey( GameInfo.Civilizations[fromPlayerHasTrait:GetCivilizationType()].ShortDescription))
        local count = 0
        for i = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_PLAYERS - 2 do
			local CSPlayer = Players[i]
			if CSPlayer:IsMinorCiv() then
				local iFriend = CSPlayer:GetMinorCivFriendshipLevelWithMajor(fromPlayerHasTrait:GetID())
				local NumMakunze = CSPlayer:CountAllImprovement(GameInfoTypes.IMPROVEMENT_JAR_MAKUNZE, false)
				if iFriend == 2 or NumMakunze >0 then			
					count = count + 1
				end
			end
		end
		local pCapital = fromPlayerHasTrait:GetCapitalCity();
		pCapital:SetNumRealBuilding(iTimerDummy,  UADoWturns)
		for i = 1, count, 1 do 
			local iUnitsTotal = fromPlayerHasTrait:GetNumUnitsSupplied();
			local iUnitsSupply = fromPlayerHasTrait:GetNumUnitsToSupply();
			if iUnitsSupply < iUnitsTotal then
				print("[" .. i .. "] Military Supply: " .. iUnitsSupply .. "/" .. iUnitsTotal)
				local pNew = fromPlayerHasTrait:InitUnit(GetStrongestMilitaryUnit(fromPlayerHasTrait, false, "UNITCOMBAT_MELEE", "UNITCOMBAT_GUN", "UNITCOMBAT_ARCHER", "UNITCOMBAT_MOUNTED", "UNITCOMBAT_ARMOR"), 	pCapital:GetX(), pCapital:GetY());
				--local pNew = fromPlayerHasTrait:InitUnit(fromPlayerHasTrait:GetCompetitiveSpawnUnitType(true, false, false, true, false, true, true, {UNITCOMBAT_MELEE, UNITCOMBAT_GUN, UNITCOMBAT_ARCHER, UNITCOMBAT_MOUNTED, UNITCOMBAT_ARMOR}), 	pCapital:GetX(), pCapital:GetY());
				pNew:JumpToNearestValidPlot()
				pNew:SetExperience(pCapital:GetDomainFreeExperience(pNew:GetDomainType()))
			end
		end
		
	elseif toPlayerHasTrait and toPlayerHasTrait:CountNumBuildings(iTimerDummy) <1 and not Players[Teams[fromTeamID]:GetLeaderID()]:IsMinorCiv() then
		print("Defending Civ: " .. Locale.ConvertTextKey( GameInfo.Civilizations[toPlayerHasTrait:GetCivilizationType()].ShortDescription))
        local count = 0
        for i = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_PLAYERS - 2 do
			local CSPlayer = Players[i]
			if CSPlayer:IsMinorCiv() then
				local iFriend = CSPlayer:GetMinorCivFriendshipLevelWithMajor(toPlayerHasTrait:GetID())
				local NumMakunze = CSPlayer:CountAllImprovement(GameInfoTypes.IMPROVEMENT_JAR_MAKUNZE, false)
				if iFriend == 2 or NumMakunze >0 then			
					count = count + 1
				end
			end
		end
		local pCapital = toPlayerHasTrait:GetCapitalCity();
		pCapital:SetNumRealBuilding(iTimerDummy,  UADoWturns)
		for i = 1, count, 1 do 
			local iUnitsTotal = toPlayerHasTrait:GetNumUnitsSupplied();
			local iUnitsSupply = toPlayerHasTrait:GetNumUnitsToSupply();
			if iUnitsSupply < iUnitsTotal then
				print("[" .. i .. "] Military Supply: " .. iUnitsSupply .. "/" .. iUnitsTotal)
				local pNew = toPlayerHasTrait:InitUnit(GetStrongestMilitaryUnit(toPlayerHasTrait, false, "UNITCOMBAT_MELEE", "UNITCOMBAT_GUN", "UNITCOMBAT_ARCHER", "UNITCOMBAT_MOUNTED", "UNITCOMBAT_ARMOR"), 	pCapital:GetX(), pCapital:GetY());
				--local pNew = toPlayerHasTrait:InitUnit(toPlayerHasTrait:GetCompetitiveSpawnUnitType(true, false, false, true, false, true, true, {UNITCOMBAT_MELEE, UNITCOMBAT_GUN, UNITCOMBAT_ARCHER, UNITCOMBAT_MOUNTED, UNITCOMBAT_ARMOR}), 	pCapital:GetX(), pCapital:GetY());
				pNew:JumpToNearestValidPlot()
				pNew:SetExperience(pCapital:GetDomainFreeExperience(pNew:GetDomainType()))
			end
		end
	end
end
if g_IsTraitActive then	GameEvents.DeclareWar.Add(Jar_CSgivesUnitsUponDoW) end

function Jar_CSgivesUnitsAtWar(csID, playerID, bGained, oldValue, newValue)
	local pPlayer = Players[playerID]
	if HasTrait(pPlayer, traitNdongoID) and bGained and Jar_IsPlayerAtWarWithAnyone(playerID, false) then
		local iUnitsTotal = pPlayer:GetNumUnitsSupplied();
		local iUnitsSupply = pPlayer:GetNumUnitsToSupply();
		if iUnitsSupply < iUnitsTotal then
			print("Military Supply: " .. iUnitsSupply .. "/" .. iUnitsTotal)
			local pCapital = pPlayer:GetCapitalCity();
			local unitID = GetStrongestMilitaryUnit(pPlayer, false, "UNITCOMBAT_MELEE", "UNITCOMBAT_GUN", "UNITCOMBAT_ARCHER", "UNITCOMBAT_MOUNTED", "UNITCOMBAT_ARMOR")
			local pNew = pPlayer:InitUnit( unitID, 	pCapital:GetX(), pCapital:GetY());
			--local pNew = pPlayer:InitUnit(pPlayer:GetCompetitiveSpawnUnitType(true, false, false, true, false, true, true, {UNITCOMBAT_MELEE, UNITCOMBAT_GUN, UNITCOMBAT_ARCHER, UNITCOMBAT_MOUNTED, UNITCOMBAT_ARMOR}), 	pCapital:GetX(), pCapital:GetY());
			pNew:JumpToNearestValidPlot()
			pNew:SetExperience(pCapital:GetDomainFreeExperience(pNew:GetDomainType()))
		end
	end
end
if g_IsTraitActive then	GameEvents.MinorAlliesChanged.Add(Jar_CSgivesUnitsAtWar) end
------------------------------------------------------------------------------------------------------------------------
-- UU MAKUNZE
------------------------------------------------------------------------------------------------------------------------
function Jar_MakunzeExpended(iPlayer, iUnit, iUnitType, iPlotX, iPlotY)
	local pPlayer = Players[iPlayer]
	if not HasTrait(pPlayer, traitNdongoID) then return end
	if iUnitType == GameInfoTypes.UNIT_JAR_MAKUNZE then
		local pTeamTechs = Teams[pPlayer:GetTeam()]:GetTeamTechs()
		local iTech = pPlayer:GetCurrentResearch()
		local ScienceXTurn = pPlayer:GetScienceTimes100() / 100
		local iScience = math.floor( ScienceXTurn * MakunzeScienceTurns )
		pTeamTechs:ChangeResearchProgressPercent(iTech, MakunzeSciencePercent, iPlayer)
		pTeamTechs:ChangeResearchProgress(iTech, iScience, iPlayer)
		if pPlayer:IsHuman() then
			local snum = MakunzeSciencePercent / 100
			local bonus = math.floor( (snum* pTeamTechs:GetResearchCost(iTech)) + iScience )
			Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iPlotX, iPlotY))), "[COLOR_RESEARCH_STORED]+" .. bonus .. " [ENDCOLOR][ICON_RESEARCH]", 2)
		end
	end
end
if g_IsTraitActive then GameEvents.GreatPersonExpended.Add(Jar_MakunzeExpended) end;
---------------------------------------------------------
print("Jarcast's Ndongo-Matamba functions loaded")
--==========================================================================================================================
--==========================================================================================================================