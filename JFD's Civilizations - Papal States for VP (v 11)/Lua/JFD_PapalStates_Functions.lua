-- JFD_PapalStates_Functions
-- Author: JFD
-- DateCreated: 11/23/2013 12:54:04 PM
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
-------------------------------------------------------------------------------------------------------------------------
function JFD_GetUserSetting(type)
	for row in GameInfo.JFD_GlobalUserSettings("Type = '" .. type .. "'") do
		return row.Value
	end
end
local bUserSettingPiety = JFD_GetUserSetting("JFD_RTP_PIETY_CORE") == 1
-------------------------------------------------------------------------------------------------------------------------
function DMS_GetMajorityReligion(player)
	local ownReligion = nil
	if isUsingCBP and (not bUserSettingPiety) then
		if player.GetOriginalReligionCreatedByPlayer then
			ownReligion = player:GetOriginalReligionCreatedByPlayer()
		else
			ownReligion = player:GetReligionCreatedByPlayer()
		end
	elseif isUsingCBP and bUserSettingPiety then 
		if player:HasStateReligion() then
			ownReligion = player:GetStateReligion()
		else
			ownReligion = player:GetCapitalCity():GetReligiousMajority()
		end
	elseif (not isUsingCBP) then
		if player:HasCreatedReligion() then
			ownReligion = player:GetReligionCreatedByPlayer()
		elseif player:GetCapitalCity() and player:GetCapitalCity():GetReligiousMajority() ~= -1 then
			ownReligion = player:GetCapitalCity():GetReligiousMajority()
		else
			ownReligion = nil
		end
	end
	return ownReligion
end
-------------------------------------------------------------------------------------------------------------------------
function SetReligionState(state, currentCity)
	-- What is the majority?
	local maxFollowers = -1;
	local majority = -1;
	for i in pairs(state) do
		state[i] = math.floor(state[i] + 0.5)
		if state[i] > maxFollowers then
			majority = i;
			maxFollowers = state[i]
		end
	end

	-- EDIT: Those crashes may actually have only been caused by tests with a religion not founded yet. Doesn't matter, leave the code like that
	-- ConvertPercentFollowers is full of nasty bugs (can only convert from majority to minority) hence this twisted method
	currentCity:AdoptReligionFully(majority);
	print("PapalStates. Done fully adopting")

	for i, v in pairs(state) do
		if i ~= majority and i >= 0 then
			-- Convert 1% at a time because followers are internally stored as real numbers.
			while (currentCity:GetNumFollowers(i) + 0.5) < v do
				currentCity:ConvertPercentFollowers(i, majority, 1)
			end
		end
	end
	print("PapalStates. Done increasing minorities.")

	-- We do atheists in the end because of a rounding error in civ5 (sum of followers can be population + 1)
	-- Since they're never displayed, we actually use the majority as a loop condition.
	if majority >= 0 then
		while (currentCity:GetNumFollowers(majority) - 0.5) > state[majority] do
			currentCity:ConvertPercentFollowers(-1, majority, 1)
		end
	end
	print("PapalStates. Done lowering majority.")
end
-------------------------------------------------------------------------------------------------
function ConvertState(state, sourceID, targetID, toConvert)
	-- Enough people from that other religion?
	local converted = toConvert
	if state[sourceID] < toConvert then
		converted = state[sourceID]
	end

	state[sourceID] = state[sourceID] - converted;
	state[targetID] = state[targetID] + converted;
	return toConvert - converted;
end
-------------------------------------------------------------------------------------------------
function SetFollowers(religionID, num, currentCity)
	local current = currentCity:GetNumFollowers(religionID);
	if (num == current) then return end

	-- Get followers state
	local count = 0;
	local state = {}
	--for _, v in pairs(data.religions) do
	for v in GameInfo.Religions() do
		state[v.ID] = currentCity:GetNumFollowers(v.ID);
		count = count + state[v.ID];
	end
	state[-1] = currentCity:GetPopulation() - count;

	--print("Converting...");
	--PrintReligionState(state);

	if num < current then
		-- Convert to atheists
		ConvertState(state, religionID, -1, current - num);
	else
		local toConvert = num - current;

		-- Convert from atheists
		toConvert = ConvertState(state, -1, religionID, toConvert)

		-- Convert from pantheon
		toConvert = ConvertState(state, 0, religionID, toConvert)

		-- Convert from group with max followers, one at a time
		while toConvert > 0 do
			local maxFollowers = 0;
			local sourceID = -1;
			--for _, v in pairs(data.religions) do
			for v in GameInfo.Religions() do
				if v.ID ~= religionID and v.ID > 0 then
					if state[v.ID] > maxFollowers then
						sourceID = v.ID;
						maxFollowers = state[v.ID];
					end
				end
			end
			if sourceID == -1 then break end
			if ConvertState(state, sourceID, religionID, 1) == 0 then
				toConvert = toConvert - 1;
			end
		end
	end
	SetReligionState(state, currentCity);
end
--=======================================================================================================================
-- CORE FUNCTIONS	
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local iCivPapalStates 	= GameInfoTypes.CIVILIZATION_JFD_PAPAL_STATES
local traitPapalID 		= GameInfoTypes.TRAIT_JFD_PAPAL_STATES
local g_IsTraitActive 	= IsTraitActive(traitPapalID)
local bRomeActive		= IsTraitActive(GameInfoTypes.TRAIT_CAPITAL_BUILDINGS_CHEAPER)
local bItalyActive		= Game_IsUsingMod("f79ace06-b989-45be-b310-1632ed1c79b9") and IsTraitActive(GameInfoTypes.TRAIT_JAR_UMBERTO_I)
local bIsRomeThere		= bRomeActive or bItalyActive
local unitSwissGuardID	= GameInfoTypes.UNIT_JFD_SWISS_GUARD
local iCivilServant 	= GameInfoTypes.SPECIALIST_CIVIL_SERVANT
local iEmbassy 			= GameInfoTypes.IMPROVEMENT_EMBASSY
local PapalEmbassyDummy = GameInfoTypes.BUILDING_JAR_EMBASSY_D
local GPbonus			= 30
--========================================================================================================================
-- FUNCTIONS
--========================================================================================================================
function Jar_RomePapalStatesCapitalChange(iPlayer, iCityX, iCityY)
	local pPlayer = Players[iPlayer]
	local pPlot = Map.GetPlot(iCityX, iCityY)
	local pCity = pPlot:GetPlotCity()
	if not pPlayer:IsAlive() then return end
	if HasTrait(pPlayer, traitPapalID) and pCity:IsCapital() then
		pCity:SetName('Vaticano', true)
	end
end
if g_IsTraitActive and bIsRomeThere then
	GameEvents.PlayerCityFounded.Add(Jar_RomePapalStatesCapitalChange)
end
------------------------------------------------------------------------------------------------------------------------
-- PAPAL STATES UA
------------------------------------------------------------------------------------------------------------------------
function Jar_MissionaryExpended(iPlayer, iUnit, iUnitType, iX, iY, bDelay, iByPlayer)
	if not bDelay then
		if iByPlayer == -1 then
			local pPlayer = Players[iPlayer]
			local pUnit = pPlayer:GetUnitByID(iUnit)
			local pPlot = Map.GetPlot(iX, iY)
			local iOwner= pPlot:GetOwner()
			local bcheck= iOwner > -1 and iOwner ~= iPlayer
			if pUnit:GetUnitClassType() == GameInfoTypes.UNITCLASS_MISSIONARY and HasTrait(pPlayer, traitPapalID) and bcheck then
				local pCapital = pPlayer:GetCapitalCity()
				local bonusGP = GPbonus*math.max(1, pPlayer:GetCurrentEra())
				pCapital:ChangeSpecialistGreatPersonProgressTimes100(iCivilServant, bonusGP*100)
				if pPlayer:IsHuman() then
					local stringtext = "+" .. bonusGP .. " [ENDCOLOR][ICON_DIPLOMAT]"
					Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iX, iY))), stringtext, 2)
				end
			end
		end
	end
end
if g_IsTraitActive then	GameEvents.UnitPrekill.Add(Jar_MissionaryExpended) end
------------------------------------------------------------------------------------------------------------------------
-- UGP APOCRISIARIUS
------------------------------------------------------------------------------------------------------------------------
function Jar_ApocrisiariusExpended(iPlayer, iUnit, iUnitType, iPlotX, iPlotY)
	local pPlayer = Players[iPlayer]
	local pPlot = Map.GetPlot(iPlotX, iPlotY)
	if not HasTrait(pPlayer, traitPapalID) then return end
	if iUnitType == GameInfoTypes.UNIT_DJ_APOCRISIARIUS then
		local FaithPerTurn = pPlayer:GetTotalFaithPerTurnTimes100() / 100
		local iValue = math.floor( 6* FaithPerTurn)
		pPlayer:ChangeFaith(iValue)
		if pPlayer:IsHuman() then
			local bonus = iValue
			Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iPlotX, iPlotY))), "+" .. bonus .. " [ENDCOLOR][ICON_PEACE]", 2)
		end
		local CScity = Players[pPlot:GetOwner()]:GetCapitalCity()
		local iMajorityReligion = DMS_GetMajorityReligion(pPlayer)
		CScity:AdoptReligionFully( iMajorityReligion )
	end
end
if g_IsTraitActive then GameEvents.GreatPersonExpended.Add(Jar_ApocrisiariusExpended) end;

JarPapalEmbassyBuilt_BuildFinished_PlayerID = 0
JarPapalEmbassyBuilt_BuildFinished_X = 0
JarPapalEmbassyBuilt_BuildFinished_Y = 0
JarPapalEmbassyBuilt_BuildFinished_Improvement = 0
	
function Jar_PapalEmbassyBuilt(playerID, plotX, plotY, improvementID)
	if(JarPapalEmbassyBuilt_BuildFinished_PlayerID == playerID and JarPapalEmbassyBuilt_BuildFinished_X == plotX and JarPapalEmbassyBuilt_BuildFinished_Y == plotY and JarPapalEmbassyBuilt_BuildFinished_Improvement == improvementID) then
		return;
	end
	-- Store inputs for duplication check
	JarPapalEmbassyBuilt_BuildFinished_PlayerID = playerID;	
	JarPapalEmbassyBuilt_BuildFinished_X = plotX;					
	JarPapalEmbassyBuilt_BuildFinished_Y = plotY;					
	JarPapalEmbassyBuilt_BuildFinished_Improvement = improvementID;
	--
	local pPlot = Map.GetPlot(plotX, plotY)
	local pPlayer = Players[playerID]
	if HasTrait(pPlayer, traitPapalID) and pPlayer:IsAlive() then
		if improvementID == iEmbassy and Players[pPlot:GetOwner()]:IsMinorCiv() then
			local csCity = pPlot:GetWorkingCity()
			if not csCity:IsHasBuilding(PapalEmbassyDummy) then 
				csCity:SetNumRealBuilding(PapalEmbassyDummy, 1)
			end
			for pCity in pPlayer:Cities() do
				pCity:SetNumRealBuilding(PapalEmbassyDummy, 1+ pCity:GetNumRealBuilding(PapalEmbassyDummy))
			end
		end
	end
end
if g_IsTraitActive then GameEvents.BuildFinished.Add(Jar_PapalEmbassyBuilt) end

function Jar_ApocrisiariusEmbassyBonuses(playerID)
    local pPlayer = Players[playerID]
    local pCapital = pPlayer:GetCapitalCity()
    if HasTrait(pPlayer, traitPapalID) and pPlayer:IsAlive() and pCapital ~= nil then
		local iMajorityReligion = DMS_GetMajorityReligion(pPlayer)
        local count = 0
        for i = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_PLAYERS - 2 do
			local CSPlayer = Players[i]
			if CSPlayer:IsMinorCiv() and CSPlayer:CountNumBuildings(PapalEmbassyDummy) > 0 then
				count = count +1
				for csCity in CSPlayer:Cities() do				
					local CSpop = csCity:GetPopulation()
					local numPapalFollowers = csCity:GetNumFollowers(iMajorityReligion)
					if iMajorityReligion > -1 and numPapalFollowers <= 0.5*CSpop then
						local numToConvert = math.ceil(CSpop*0.51)
						SetFollowers(iMajorityReligion, numToConvert, csCity)  -- function taken from IGE
					end
				end
			end
		end
		for pCity in pPlayer:Cities() do
			pCity:SetNumRealBuilding(PapalEmbassyDummy, count)
		end
    end
end
if g_IsTraitActive then	GameEvents.PlayerDoTurn.Add(Jar_ApocrisiariusEmbassyBonuses) end
----------------------------------------------------------------------------------------------------------------------------
-- UU SWISS GUARD
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
	if unitTypeID == unitSwissGuardID then
		unit:ChangeMoves(unit:MaxMoves())
	end
end
if g_IsTraitActive then GameEvents.CityTrained.Add(JFD_PapalStates_MoveAfterFaithPurchase) end
---------------------------------------------------------
print("Papal States for VP functions loaded")
--==========================================================================================================================
--==========================================================================================================================