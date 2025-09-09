-- Italy_Functions
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
function Neirai_GetNearestCity(pPlayer, pPlot)
    local distance = 9999
    local cNearestCity = nil
    for cCity in pPlayer:Cities() do
        local pCityPlot = cCity:Plot()
        local between = Map.PlotDistance(pCityPlot:GetX(), pCityPlot:GetY(), pPlot:GetX(), pPlot:GetY())
        if between < distance then
            distance = between
            cNearestCity = cCity
        end
    end
    return cNearestCity
end
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local onlycoastal= GameDefines.LAKE_MAX_AREA_SIZE +1
local CityWorkingRadius = GameDefines.MAXIMUM_WORK_PLOT_DISTANCE or 3
local iMod = ((GameInfo.GameSpeeds[Game.GetGameSpeedType()].BuildPercent)/100)
local iCiv = GameInfoTypes.CIVILIZATION_JAR_ITALY
local traitItalyID = GameInfoTypes.TRAIT_JAR_UMBERTO_I
local g_IsTraitActive = IsTraitActive(traitItalyID)
local iItalyUADummy1 = GameInfoTypes.BUILDING_JAR_DUMMY_UAIT1
local iItalyDummyBorgo = GameInfoTypes.BUILDING_JAR_DUMMY_BORGO
local iUTIBorgo = GameInfoTypes.IMPROVEMENT_JAR_BORGO
local iUUCondotta = GameInfoTypes.UNIT_JAR_CONDOTTA
local iPromoCSGift = GameInfoTypes.PROMOTION_JAR_SWORDONDEMAND
local iUUBersaglieri = GameInfoTypes.UNIT_JAR_BERSAGLIERI
local iPastificio = GameInfoTypes.BUILDING_JAR_PASTIFICIO
local iPastaDummy = GameInfoTypes.BUILDING_JAR_DUMMY_PASTA
------------------------------------------------------------------------------------------------------------------------
-- QUICK MOD BALANCING PANEL
------------------------------------------------------------------------------------------------------------------------
-- Here are the changeable values that determine the strength of the effects described in the design.
-- UA
local GPbonus = 2

-- UU Condotta
local CondottaInfluence= math.floor(30*iMod)
local CondottaGold= math.floor(30*iMod)

-- UU Bersaglieri
local BersaglieriPointsKill = 2/3
--========================================================================================================================
-- FUNCTIONS
--========================================================================================================================
-- ITALY UA
------------------------------------------------------------------------------------------------------------------------
local tGWArchitecture = {}
for row in DB.Query("select a.ID BuildingID, b.ID EraID from Buildings a, Eras b, Jar_GWArchitecture c WHERE c.BuildingType=a.Type AND c.EraType=b.Type ") do
	tGWArchitecture[row.BuildingID] = row.EraID
end

local tEligibleImpr = {}
tEligibleImpr[GameInfoTypes.IMPROVEMENT_ACADEMY]= true
tEligibleImpr[GameInfoTypes.IMPROVEMENT_CUSTOMS_HOUSE]= true
tEligibleImpr[GameInfoTypes.IMPROVEMENT_MANUFACTORY]= true
tEligibleImpr[GameInfoTypes.IMPROVEMENT_CITADEL]= true
tEligibleImpr[GameInfoTypes.IMPROVEMENT_HOLY_SITE]= true
tEligibleImpr[GameInfoTypes.IMPROVEMENT_EMBASSY]= true

-- Use global variables to avoid having the event be called twice for the same plot
ItalyUA_BuildFinished_PlayerID = 0
ItalyUA_BuildFinished_X = 0
ItalyUA_BuildFinished_Y = 0
ItalyUA_BuildFinished_Improvement = 0

function Jar_ItalyUA_GWA(playerID, iX, iY, eImprovement) -- Thanks DMS
	-- Don't continue if this is a duplicate call
	if(ItalyUA_BuildFinished_PlayerID == playerID and ItalyUA_BuildFinished_X == iX and ItalyUA_BuildFinished_Y == iY and ItalyUA_BuildFinished_Improvement == eImprovement) then
		return;
	end
	-- Store inputs for duplication check
	ItalyUA_BuildFinished_PlayerID = playerID;
	ItalyUA_BuildFinished_X = iX;		
	ItalyUA_BuildFinished_Y = iY;		
	ItalyUA_BuildFinished_Improvement = eImprovement;
	--
	local pPlayer = Players[playerID];
	local pPlot = Map.GetPlot(iX, iY);
	if not pPlayer:IsAlive() then return end
	if not HasTrait(pPlayer, traitItalyID) then return end
	if not pPlot then return end
	
	if tEligibleImpr[eImprovement] then				
		local currentEra = pPlayer:GetCurrentEra()
		local tEligibleGWA = {}
		for k, v in pairs(tGWArchitecture) do
			if currentEra == v and pPlayer:CountNumBuildings(k) <1 then
				table.insert(tEligibleGWA, k)
			end
		end
		if #tEligibleGWA <1 then
			for k, v in pairs(tGWArchitecture) do
				if currentEra == v+1 and pPlayer:CountNumBuildings(k) <1 then
					table.insert(tEligibleGWA, k)
				end
			end		
		end
		if #tEligibleGWA <1 then
			for k, v in pairs(tGWArchitecture) do
				if currentEra == v+2 and pPlayer:CountNumBuildings(k) <1 then
					table.insert(tEligibleGWA, k)
				end
			end		
		end
		local randBuildingID = GetRandom(1, #tEligibleGWA)
		local chosenBuildingID = tEligibleGWA[randBuildingID]
		local pCity= Neirai_GetNearestCity(pPlayer, pPlot)
		pCity:SetNumRealBuilding( chosenBuildingID , 1)
		
		if pPlayer:IsHuman() then
			local tPopupInfo = {
				Type = ButtonPopupTypes.BUTTONPOPUP_WONDER_COMPLETED_ACTIVE_PLAYER,
				Data1 = chosenBuildingID
			}
			Events.SerialEventGameMessagePopup(tPopupInfo)
		end

	end
end
if g_IsTraitActive then GameEvents.BuildFinished.Add(Jar_ItalyUA_GWA) end

function Jar_GWACulturalHeritage(eResolution, eProposer, eChoice, bEnact, bPassed)
	if eResolution == GameInfoTypes.RESOLUTION_CULTURAL_HERITAGE_SITES and bEnact and bPassed then
		for playerID = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
			local pPlayer = Players[playerID];
			if pPlayer:IsAlive() and HasTrait(pPlayer, traitItalyID) then
				if not pPlayer:HasPolicy(GameInfoTypes.POLICY_ITALY_CULTHER) then
					pPlayer:GrantPolicy(GameInfoTypes.POLICY_ITALY_CULTHER, true)
				end
			end 
		end
	end
end
if g_IsTraitActive then GameEvents.ResolutionResult.Add(Jar_GWACulturalHeritage) end
--========================================================================================================================
-- UI - COMUNE
--========================================================================================================================
function Jar_ItalyUTI(playerID)
	local pPlayer = Players[playerID]
	if not pPlayer:IsAlive() then return end
	if pPlayer:CountAllImprovement(iUTIBorgo) <1 then return end	
	for pCity in pPlayer:Cities() do
		if pCity:HasImprovement(iUTIBorgo) then
			local iNumBorghi= 0
			for i = 0, pCity:GetNumCityPlots()-1, 1 do
				local pPlot = pCity:GetCityIndexPlot(i)
				if pPlot and pPlot:HasImprovement(iUTIBorgo) and (not pPlot:IsImprovementPillaged()) then
					iNumBorghi= iNumBorghi +1
				end
			end
			pCity:SetNumRealBuilding(iItalyDummyBorgo, iNumBorghi)
		end
	end
end
GameEvents.PlayerDoTurn.Add(Jar_ItalyUTI)
--========================================================================================================================
-- UU - COMPAGNIA DI VENTURA
--========================================================================================================================
function Jar_MarkGiftedCondotte(iPlayer, iCS, iGold, iUnitType, iPlotX, iPlotY)
	local pPlayer = Players[iPlayer]
	if not pPlayer:IsAlive() then return end
	if not HasTrait(pPlayer, traitItalyID) then return end
	local pMinorPlayer = Players[iCS]
	local CSplot = pMinorPlayer:GetCapitalCity():Plot()
	if iUnitType == iUUCondotta then
		pMinorPlayer:ChangeMinorCivFriendshipWithMajor(iPlayer, CondottaInfluence)
		pPlayer:ChangeGold(CondottaGold)
		if pPlayer:IsHuman() then
			Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(CSplot:GetX(), CSplot:GetY()))), "[COLOR_YIELD_GOLD]+ " .. CondottaGold .. "[ENDCOLOR][ICON_GOLD], +".. CondottaInfluence .. " [ICON_INFLUENCE]", 2)
		end
	end
end
if g_IsTraitActive then GameEvents.PlayerGifted.Add(Jar_MarkGiftedCondotte) end
--========================================================================================================================
-- UB - PASTIFICIO
--========================================================================================================================
function Jar_PastaTourismTR(iPlayer)
	local pPlayer = Players[iPlayer]
	if not pPlayer:IsAlive() then return end
	if pPlayer:CountNumBuildings(iPastificio) <1 then return end
	local tTRPasta = {}
	for pCity in pPlayer:Cities() do
		tTRPasta[pCity] = 0
	end
	for _,route in ipairs(pPlayer:GetTradeRoutes()) do		
		local pFromCity = route.FromCity
		if route.FromID ~= route.ToID and pFromCity:IsHasBuilding(iPastificio) then
			tTRPasta[pFromCity] = 1 + tTRPasta[pFromCity]
		end
	end
	for _,route in ipairs(pPlayer:GetTradeRoutesToYou()) do
		local pToCity = route.ToCity
		if route.FromID ~= route.ToID and pToCity:IsHasBuilding(iPastificio) then
			tTRPasta[pToCity] = 1 + tTRPasta[pToCity]
		end
	end
	for pCity in pPlayer:Cities() do
		if pCity:IsHasBuilding(iPastificio) then
			pCity:SetNumRealBuilding(iPastaDummy, tTRPasta[pCity])
		end
	end
end
if g_IsTraitActive then GameEvents.PlayerDoTurn.Add(Jar_PastaTourismTR) end
--========================================================================================================================
-- UU - BERSAGLIERI
--========================================================================================================================
function Jar_BersaglieriTourismToProduction(playerID)
	local pPlayer = Players[playerID]
	if not pPlayer:IsAlive() then return end
	if not pPlayer:CanTrain(iUUBersaglieri, true) then return end
	for city in pPlayer:Cities() do
		local cityUnitProductionID = city:GetProductionUnit()
		if cityUnitProductionID == iUUBersaglieri then
			local tourism = city:GetBaseTourism()*0.01
			if tourism > 0 then
				local prodbonus = tourism
				city:ChangeProduction(prodbonus)
				if pPlayer:IsHuman() then
					Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(city:Plot():GetX(), city:Plot():GetY()))), "+" .. prodbonus .. "[ICON_PRODUCTION] from [ICON_TOURISM]", 2)
				end
			end
		end
	end
end
if g_IsTraitActive then GameEvents.PlayerDoTurn.Add(Jar_BersaglieriTourismToProduction) end

function JarBersaglieriPointSKill(iAttackingPlayer, iAttackingUnit, iAttackerDamage, iAttackerFinalDamage, iAttackerMaxHP, iDefendingPlayer, iDefendingUnit, iDefenderDamage, iDefenderFinalDamage, iDefenderMaxHP, iInterceptingPlayer, iInterceptingUnit, iInterceptorDamage, iPlotX, iPlotY)
	local pDefendingPlayer = Players[iDefendingPlayer]
	if not (pDefendingPlayer and (iDefenderFinalDamage >= iDefenderMaxHP)) then return end
	local pAttackingPlayer = Players[iAttackingPlayer]
	local pDefUnit = pDefendingPlayer:GetUnitByID(iDefendingUnit)
	local pAttUnit = pAttackingPlayer:GetUnitByID(iAttackingUnit)
	local pPlot = Map.GetPlot(iPlotX, iPlotY)
		
	if pAttUnit:IsHasPromotion(GameInfoTypes.PROMOTION_JAR_VIVAVERDI)  then
		local pCap = pAttackingPlayer:GetCapitalCity()
		if pCap then
			local iVictimStrength = math.max( GameInfo.Units[pDefUnit:GetUnitType()].Combat , GameInfo.Units[pDefUnit:GetUnitType()].RangedCombat)
			local bonus = math.floor(100*iVictimStrength*BersaglieriPointsKill)
			local randomNum = GetRandom(1, 3)
			if randomNum==1 then 
				pCap:ChangeSpecialistGreatPersonProgressTimes100(GameInfoTypes.SPECIALIST_WRITER, bonus)
				if pAttackingPlayer:IsHuman() then
					local sMessage = "+" .. bonus/100 .. " [ICON_GREAT_WRITER]"
					Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iPlotX, iPlotY))), sMessage, 3)
				end
			elseif randomNum==2 then 
				pCap:ChangeSpecialistGreatPersonProgressTimes100(GameInfoTypes.SPECIALIST_ARTIST, bonus)
				if pAttackingPlayer:IsHuman() then
					local sMessage = "+" .. bonus/100 .. " [ICON_GREAT_ARTIST]"
					Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iPlotX, iPlotY))), sMessage, 3)
				end
			else
				pCap:ChangeSpecialistGreatPersonProgressTimes100(GameInfoTypes.SPECIALIST_MUSICIAN, bonus)
				if pAttackingPlayer:IsHuman() then
					local sMessage = "+" .. bonus/100 .. " [ICON_GREAT_MUSICIAN]"
					Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iPlotX, iPlotY))), sMessage, 3)
				end
			end
		end	
	end
end
if g_IsTraitActive then GameEvents.CombatEnded.Add(JarBersaglieriPointSKill) end
---------------------------------------------------------
print("Jarcast's Italy functions loaded")
--==========================================================================================================================
--==========================================================================================================================