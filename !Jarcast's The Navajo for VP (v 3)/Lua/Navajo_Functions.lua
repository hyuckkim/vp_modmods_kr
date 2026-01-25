-- Jarcast Navajo Functions
-- Author: Jarcast
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
include("FLuaVector.lua")
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
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
if Game then
	--Game.GetUserSetting
	function Game.GetUserSetting(type)
		for row in GameInfo.JFD_GlobalUserSettings("Type = '" .. type .. "'") do
			return row.Value
		end
	end
end
-------------------------------------------------------------------------------------------------------------------------
local iCiv = GameInfoTypes["CIVILIZATION_JAR_NAVAJO"]
function NavajoHasTech(techID)
	local bNavHasTech = false
	for iMajPlayer = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
		local pPlayer = Players[iMajPlayer]
		if HasTrait(pPlayer, traitNavajoID) and (Teams[pPlayer:GetTeam()]:IsHasTech( techID )) then
			bNavHasTech = true
		end
	end
	return bNavHasTech
end
-------------------------------------------------------------------------------------------------------------------------
function PlayersShareWarEnemy(playerAID, playerBID)
    local pPlayerA = Players[playerAID]
	local pPlayerB = Players[playerBID]
    local iTeamA = pPlayerA:GetTeam()
    local pTeamA = Teams[iTeamA]
	local iTeamB = pPlayerB:GetTeam()
    local pTeamB = Teams[iTeamB]
	local bAlliesAtWar = false
    for i = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
        if i ~= playerAID and i ~= playerBID then
            local pOtherPlayer = Players[i]
            if pOtherPlayer:IsAlive() then
				local iOtherTeam = pOtherPlayer:GetTeam()
				if pTeamA:IsAtWar(iOtherTeam) and pTeamB:IsAtWar(iOtherTeam) then
					bAlliesAtWar = true
					break
                end
            end
        end
    end
    return bAlliesAtWar
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
-------------------------------------------------------------------------------------------------------------------------
function GetImprovementIDFromResourceID( resourceID)
	tResImprovements  = {}
	for row in DB.Query("SELECT a.ID ResID, b.ResourceType ResType, c.ID ImprovID FROM Resources a, Improvement_ResourceTypes b, Improvements c WHERE a.Type = b.ResourceType and b.ImprovementType = c.Type and a.ID = '" .. resourceID .. "'") do
		table.insert(tResImprovements, row.ImprovID);
	end
	return tResImprovements[1]
end
-------------------------------------------------------------------------------------------------------------------------
local tJPROPFeatures= {}
tJPROPFeatures[-1] = true
tJPROPFeatures[GameInfoTypes.FEATURE_JUNGLE] = true
tJPROPFeatures[GameInfoTypes.FEATURE_FOREST] = true
tJPROPFeatures[GameInfoTypes.FEATURE_MARSH] = true
tJPROPFeatures[GameInfoTypes.FEATURE_FLOOD_PLAINS] = true

function Jar_PlaceResourceOnPlot(playerID, resourceID, numres, pPlot, improvementID)
	if pPlot:GetResourceType() == -1 then
		pPlot:SetResourceType(resourceID, numres)
		if pPlot:IsCity() then
			pPlot:SetImprovementType(GetImprovementIDFromResourceID( resourceID))
			pPlot:SetImprovementType(-1)
			print("Jar_PlaceResourceOnPlot. Resource placed.")
		else
			if pPlot:GetFeatureType() ~= -1 then pAdjacentPlot:SetFeatureType(-1) end
			pPlot:SetImprovementType(-1)
			pPlot:SetImprovementType(improvementID)
			print("Jar_PlaceResourceOnPlot. Resource placed.")
		end
	else
		local plotresID = pPlot:GetResourceType()
		local plotresNum= pPlot:GetNumResource()
		local pCity
		if pPlot:IsCity() then
			pCity = pPlot:GetPlotCity()
		else
			pCity = pPlot:GetWorkingCity()
			if pCity == nil then pCity = Neirai_GetNearestCity(Players[playerID], pPlot) end
		end
		print("Jar_PlaceResourceOnPlot. City found: ".. pCity:GetName())
		local bcheck = true
		for i = 0, pCity:GetNumCityPlots() - 1, 1 do
			local pAdjacentPlot = pCity:GetCityIndexPlot(i)
			if pAdjacentPlot and pAdjacentPlot:GetOwner() == playerID and pAdjacentPlot:GetResourceType() == -1 and (pAdjacentPlot:GetImprovementType() == -1) and tJPROPFeatures[pAdjacentPlot:GetFeatureType()] and not pAdjacentPlot:IsCity() and not pAdjacentPlot:IsWater() and not pAdjacentPlot:IsMountain() then
				pAdjacentPlot:SetResourceType(plotresID, plotresNum)
				--pAdjacentPlot:SetImprovementType( GetImprovementIDFromResourceID( plotresID) )
				-- Notification
				local sTitle = "A resource was moved."
				local sText = "A resource was moved to the highlighted plot to make space for another resource to take its place."
				Players[playerID]:AddNotification(NotificationTypes.NOTIFICATION_CITY_TILE, sText, sTitle, pAdjacentPlot:GetX(), pAdjacentPlot:GetY())
				bcheck = false
				break
			end			
		end
		if bcheck then
			for i = 0, pCity:GetNumCityPlots() - 1, 1 do
				local pAdjacentPlot = pCity:GetCityIndexPlot(i)	
				if pAdjacentPlot and pAdjacentPlot:GetOwner() == -1 and pAdjacentPlot:GetResourceType() == -1 and pAdjacentPlot:GetFeatureType() == -1 and tJPROPFeatures[pAdjacentPlot:GetFeatureType()] and not pAdjacentPlot:IsWater() and not pAdjacentPlot:IsMountain() then
					pAdjacentPlot:SetOwner(playerID, pCity:GetID(), true, true);
					pAdjacentPlot:SetRevealed(Teams[Players[playerID]:GetTeam()], true)
					pAdjacentPlot:SetResourceType(plotresID, plotresNum)
					--pAdjacentPlot:SetImprovementType( GetImprovementIDFromResourceID( plotresID) )
					-- Notification
					local sTitle = "A resource was moved."
					local sText = "A resource was moved to the highlighted plot to make space for another resource to take its place."
					Players[playerID]:AddNotification(NotificationTypes.NOTIFICATION_CITY_TILE, sText, sTitle, pAdjacentPlot:GetX(), pAdjacentPlot:GetY())
					bcheck = false
					break
				end			
			end
		end
		pPlot:SetImprovementType(-1)
		pPlot:SetResourceType(resourceID, numres)
		pPlot:SetImprovementType(improvementID)
		if pPlot:IsCity() then
			pPlot:SetImprovementType( GetImprovementIDFromResourceID( resourceID) )
			pPlot:SetImprovementType(-1)
		end
		print("Jar_PlaceResourceOnPlot. Resource placed.")
	end
end
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local iMod = ((GameInfo.GameSpeeds[Game.GetGameSpeedType()].BuildPercent)/100)
local iFood = GameInfo.Yields.YIELD_FOOD.ID
local iProd = GameInfoTypes.YIELD_PRODUCTION
local traitNavajoID = GameInfoTypes["TRAIT_JAR_NAVAJO"]
local g_IsTraitActive = IsTraitActive(traitNavajoID)
local iUADummyGrowth = GameInfoTypes.BUILDING_JAR_DUMMY_NAVAJO
local iUADummyGWM = GameInfoTypes.BUILDING_JAR_DUMMY_GWORKS
local hoganID = GameInfoTypes.IMPROVEMENT_JAR_HOGAN
local hoganBuilding = GameInfoTypes.BUILDING_JAR_HOGAN
local HataaliiID = GameInfoTypes.UNIT_JAR_HATAALII
local eResourceDiyogi = GameInfoTypes.RESOURCE_JAR_DIYOGI
local eImprovementPlantation = GameInfoTypes.IMPROVEMENT_PLANTATION
local AtloohID =GameInfoTypes.BUILDING_JAR_ATLOOH
--------
local iTechreq = 0
for row in DB.Query("SELECT a.PrereqTech Prereqtech, b.ID techID FROM Units a, Technologies b WHERE a.PrereqTech = b.Type AND a.Type='UNIT_JAR_CODETALKER'") do
	iTechreq = row.techID
end
local CodeTalkerID = GameInfoTypes.UNIT_JAR_CODETALKER
local CodeTalkerPromoID = GameInfoTypes["PROMOTION_JAR_CODETALKER"]
local CTBonusPromoID = GameInfoTypes["PROMOTION_JAR_CODETALKERPOS"]
local CTMalusPromoID = GameInfoTypes["PROMOTION_JAR_CODETALKERNEG"]
------------------------------------------------------------------------------------------------------------------------
-- QUICK MOD BALANCING PANEL
------------------------------------------------------------------------------------------------------------------------
-- Here are the changeable values that determine the strength of the effects described in the design.
-- UA
local CityHealFactor = 0.05
local UnitHealFactor = 5
local MaxFBcount = 8

-- Hataalii
local HSHeal= -10
local HSHealAdj = -5

-- Hogan
local iDesertYield = 1
local GMusP= 1

--==========================================================================================================================
-- FUNCTIONS
--==========================================================================================================================
-- HOZHOOJI UA
--==========================================================================================================================
function NavajoUA(iPlayer)
	local pPlayer = Players[iPlayer]
	if (HasTrait(pPlayer, traitNavajoID) and pPlayer:IsAlive()) then	
		for pCity in pPlayer:Cities() do
			local numGWMusic = pCity:GetNumGreatWorksFilled(GameInfoTypes.GREAT_WORK_SLOT_MUSIC)
			pCity:SetNumRealBuilding(iUADummyGWM,  numGWMusic)
		end
	end
end
if g_IsTraitActive then GameEvents.PlayerDoTurn.Add(NavajoUA) end

function Jar_NavajoSlotCapital(iPlayer, iCityX, iCityY)
	local pPlayer = Players[iPlayer]
	local teamID = pPlayer:GetTeam()
	local pTeam = Teams[teamID]
	local pPlot = Map.GetPlot(iCityX, iCityY)
	local pCity = pPlot:GetPlotCity()
	local iCity = pCity:GetID()
	if HasTrait(pPlayer, traitNavajoID) and pPlayer:IsAlive() and pCity:IsCapital() then
		pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_JAR_HOZHOOJI,  1)
	end
end
if g_IsTraitActive then GameEvents.PlayerCityFounded.Add(Jar_NavajoSlotCapital) end
--==========================================================================================================================
-- HATAALII functions
--==========================================================================================================================
function HataaliiExpended(iPlayer, iUnit, iUnitType, iX, iY)
	local pPlayer = Players[iPlayer]
	if iUnitType == HataaliiID then
		local iFreeMusicSpots = 0
		for city in pPlayer:Cities() do
			iFreeMusicSpots = iFreeMusicSpots + city:GetNumAvailableGreatWorkSlots(GameInfoTypes.GREAT_WORK_SLOT_MUSIC)
		end
		--print("Hataalii. Num free Music slots: " .. iFreeMusicSpots )
		if iFreeMusicSpots > 0 then			
			local eGreatWorkClassType = GameInfoTypes.GREAT_WORK_MUSIC
			local sGreatWorkClassType = 'GREAT_WORK_MUSIC'
			local eGreatWorkSlotType = GameInfoTypes.GREAT_WORK_SLOT_MUSIC
			local sGreatWorkSlotType = 'GREAT_WORK_SLOT_MUSIC'
			local tUsedGreatWorks, tReservedGreatWorks, tAvailableGreatWorks = {}, {}, {}
			-- already created great works
			for eplayer, pplayer in ipairs(Players) do
				local tTempTable = pplayer:GetGreatWorks(eGreatWorkClassType)
				for i, v in ipairs(tTempTable) do
					local eUsedID = Game.GetGreatWorkType(v.Index)
					tUsedGreatWorks[eUsedID] = true
				end
			end
			-- reserved great works (for buildings)
			for building in DB.Query("SELECT Buildings.FreeGreatWork FROM Buildings") do
				if building.FreeGreatWork ~= nil then
					local eReservedID = GameInfo.GreatWorks{Type=building.FreeGreatWork}().ID
					tReservedGreatWorks[eReservedID] = true
				end
			end
			-- creating GW list to choose from
			for greatwork in DB.Query("SELECT GreatWorks.ID FROM GreatWorks WHERE GreatWorkClassType = ?", sGreatWorkClassType) do
				if not tUsedGreatWorks[greatwork.ID] and not tReservedGreatWorks[greatwork.ID] then
					table.insert(tAvailableGreatWorks, greatwork.ID)
				end
			end
			--print("Hataalii. Available GW Art: " .. #tAvailableGreatWorks)
			if #tAvailableGreatWorks > 0 then
				local eGreatWorkType = table.remove(tAvailableGreatWorks, Game.Rand(#tAvailableGreatWorks, "Choose a random ID of a GW") + 1)
				local eGreatWork = Game.CreateGreatWork(eGreatWorkType, pPlayer, pPlayer:GetCurrentEra(), pPlayer:GetName())
				local bFoundFreeSlot = false
				-- looking for a building with at least 1 free slot
				for city in pPlayer:Cities() do
					if city:GetNumAvailableGreatWorkSlots(eGreatWorkSlotType) > 0 then
						for building in DB.Query("SELECT Buildings.ID, Buildings.Description, Buildings.BuildingClass, Buildings.GreatWorkCount FROM Buildings WHERE GreatWorkSlotType = ?", sGreatWorkSlotType) do
							if city:IsHasBuilding(building.ID) then
								local eBuildingClass = GameInfo.BuildingClasses{Type=building.BuildingClass}{}.ID
								local iNumBuildingGreatWorkSlots = building.GreatWorkCount
								
								for i = 0, iNumBuildingGreatWorkSlots - 1 do
									if city:GetBuildingGreatWork(eBuildingClass, i) == -1 then
										city:SetBuildingGreatWork(eBuildingClass, i, eGreatWork)
										bFoundFreeSlot = true												
										if pPlayer:IsHuman() then
											local L = Locale.ConvertTextKey
											pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GREAT_WORK_COMPLETED_ACTIVE_PLAYER,
											L("TXT_KEY_UNIT_JAR_HATAALII_GWMUSIC", L(GameInfo.GreatWorks[eGreatWorkType].Description), L(building.Description)),
											L("TXT_KEY_UNIT_JAR_HATAALII_GWMUSIC_TITLE"), city:GetX(), city:GetY(), eGreatWork)
										end	
										break
									end	
								end										
								if bFoundFreeSlot then break end
							end
						end								
						if bFoundFreeSlot then break end
					end
				end
			end			
		end
	end
end
if g_IsTraitActive then GameEvents.GreatPersonExpended.Add(HataaliiExpended) end;

-- Holy sites heal +10 HP per turn, +5 HP if adjacent
function NavajoHolySiteHealUnits(iPlayer)
	local pPlayer = Players[iPlayer]
	if (HasTrait(pPlayer, traitNavajoID) and pPlayer:IsAlive()) then	
		for pCity in pPlayer:Cities() do
			for i = 0, pCity:GetNumCityPlots() - 1, 1 do
				local pPlot = pCity:GetCityIndexPlot(i)
				if pPlot:GetImprovementType() == GameInfo.Improvements["IMPROVEMENT_HOLY_SITE"].ID and pPlot:GetOwner() == iPlayer then
					if pPlot:IsUnit() then
						for iPlotUnit = 0, pPlot:GetNumUnits() -1, 1 do
							local pUnit = pPlot:GetUnit(iPlotUnit)
							local iUnitOwner = pUnit:GetOwner()
							if iUnitOwner == iPlayer then
								pUnit:ChangeDamage(HSHeal)
							end
						end
					end
					for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
						local pAdjacentPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), direction)
						if pAdjacentPlot and pAdjacentPlot:IsUnit() then
							for iPlotUnit = 0, pAdjacentPlot:GetNumUnits() -1, 1 do
								local pAdjUnit = pAdjacentPlot:GetUnit(iPlotUnit)
								local iAdjUnitOwner = pAdjUnit:GetOwner()
								if iAdjUnitOwner == iPlayer then
									pAdjUnit:ChangeDamage(HSHealAdj)
								end
							end
						end
					end
				end
			end
		end
	end
end
if g_IsTraitActive then GameEvents.PlayerDoTurn.Add(NavajoHolySiteHealUnits) end
--==========================================================================================================================
-- HOGAN functions
--==========================================================================================================================
function Jar_HoganMusicPoints(playerID)
	local pPlayer = Players[playerID]
	if not pPlayer:IsAlive() then return end
	if pPlayer:CountAllImprovement(hoganID) <1 then return end	
	for pCity in pPlayer:Cities() do
		if pCity:HasImprovement(hoganID) then	
			local iNumHogan= 0
			for i = 0, pCity:GetNumCityPlots()-1, 1 do
				local pPlot = pCity:GetCityIndexPlot(i)
				if pPlot and pPlot:GetOwner() == playerID and pPlot:HasImprovement(hoganID) then
					iNumHogan= iNumHogan +1
				end
			end
			if iNumHogan > 0 then
				pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_JAR_HOGAN_MUS, iNumHogan)
			end
		end
	end
end
if g_IsTraitActive then GameEvents.PlayerDoTurn.Add(Jar_HoganMusicPoints) end

-- Hogan gives +1 Food, Prod to own flat desert tiles
JarHoganDesertFood_BuildFinished_PlayerID = 0
JarHoganDesertFood_BuildFinished_X = 0
JarHoganDesertFood_BuildFinished_Y = 0
JarHoganDesertFood_BuildFinished_Improvement = 0
	
function HoganDesertFood(playerID, plotX, plotY, improvementID)
	if(JarHoganDesertFood_BuildFinished_PlayerID == playerID and JarHoganDesertFood_BuildFinished_X == plotX and JarHoganDesertFood_BuildFinished_Y == plotY and JarHoganDesertFood_BuildFinished_Improvement == improvementID) then
		return;
	end
	-- Store inputs for duplication check
	JarHoganDesertFood_BuildFinished_PlayerID = playerID;	
	JarHoganDesertFood_BuildFinished_X = plotX;					
	JarHoganDesertFood_BuildFinished_Y = plotY;					
	JarHoganDesertFood_BuildFinished_Improvement = improvementID;
	
	local pPlot = Map.GetPlot(plotX, plotY)
	local pPlayer = Players[playerID]
	--local pPlayer = Players[pPlot:GetOwner()]
	if HasTrait(pPlayer, traitNavajoID) and pPlayer:IsAlive() then
		if improvementID == hoganID then
			local pCity = pPlot:GetWorkingCity()
			if not pCity:IsHasBuilding(hoganBuilding) then 
				pCity:SetNumRealBuilding(hoganBuilding, 1)
			end
			if pPlot:GetTerrainType() == TerrainTypes.TERRAIN_DESERT and pPlot:IsFlatlands() and pPlot:GetFeatureType() == -1 then
				Game.SetPlotExtraYield(plotX, plotY, iFood, iDesertYield ) 
				Game.SetPlotExtraYield(plotX, plotY, iProd, iDesertYield )
			end
		end
	end
end
if g_IsTraitActive then GameEvents.BuildFinished.Add(HoganDesertFood) end
--==========================================================================================================================
-- DIYOGI AT'LOOH functions
--==========================================================================================================================
function OnConstructionPlaceDiyogi(iPlayer, iCity, iBuilding)
	local pPlayer = Players[iPlayer]
	if not HasTrait(pPlayer, traitNavajoID) then return end
	if iBuilding == AtloohID then	
		local pCity = pPlayer:GetCityByID(iCity)
		local pPlot = Map.GetPlot(pCity:GetX(), pCity:GetY())
		Jar_PlaceResourceOnPlot(iPlayer, eResourceDiyogi, 1, pPlot, eImprovementPlantation)
	end
end
if g_IsTraitActive then GameEvents.CityConstructed.Add(OnConstructionPlaceDiyogi) end
--==========================================================================================================================
-- CODE TALKER functions
--==========================================================================================================================
function CodeTalkerPromotionActive(iPlayer, iUnitID)
	local pPlayer = Players[iPlayer]
	if NavajoHasTech(iTechreq) then
		if (not HasTrait(pPlayer, traitNavajoID) and pPlayer:IsAlive()) then
			local pUnit = pPlayer:GetUnitByID(iUnitID)
			local unitplot = pUnit:GetPlot()
			local pOwner = Players[pUnit:GetOwner()];
			for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
				local pAdjacentPlot = Map.PlotDirection(unitplot:GetX(), unitplot:GetY(), direction)
				if pAdjacentPlot and pAdjacentPlot:IsUnit() then
					for iPlotUnit = 0, pAdjacentPlot:GetNumUnits() -1, 1 do
						local pAdjUnit = pAdjacentPlot:GetUnit(iPlotUnit)
						local iAdjUnitOwner = pAdjUnit:GetOwner()
						local pAdjUnitOwner = Players[iAdjUnitOwner]
						if not pAdjUnitOwner:IsBarbarian() then
							if pAdjUnit:IsHasPromotion(CodeTalkerPromoID) and not HasTrait(pAdjUnitOwner, traitNavajoID) then
								if 		iAdjUnitOwner == iPlayer then
									pUnit:SetHasPromotion(CTBonusPromoID, true)
								elseif 	iAdjUnitOwner ~= iPlayer and PlayersShareWarEnemy(iAdjUnitOwner, iPlayer) then
									pUnit:SetHasPromotion(CTBonusPromoID, true)
								else
									pUnit:SetHasPromotion(CTMalusPromoID, true)
								end
							else
								pUnit:SetHasPromotion(CTBonusPromoID, false)
								pUnit:SetHasPromotion(CTMalusPromoID, false)
							end
						end
					end
				end
			end
		end
	end
end
GameEvents.UnitSetXY.Add(CodeTalkerPromotionActive)

function GiftedCodeTalker(iPlayer, iCS, iGold, iUnitType, iPlotX, iPlotY)
	local pPlayer = Players[iPlayer]
	if HasTrait(pPlayer, traitNavajoID) and iUnitType == CodeTalkerID then
		local influencegain = 25
		Players[iCS]:ChangeMinorCivFriendshipWithMajor(pPlayer, influencegain)
	end
end
GameEvents.PlayerGifted.Add(GiftedCodeTalker)

-- Grant diplomatic bonus from the civ you gift Code Talker to
local CTDiploModifier = GameInfoTypes.DIPLOMODIFIER_JAR_NAVAJO_CODE_TALKER

function CodeTalkerDiploModifier(iDiploModifier, iFromPlayer, iToPlayer)
	local iModifier = 0
	local pToPlayer = Players[iToPlayer]
	local pFromPlayer = Players[iFromPlayer];
	if iDiploModifier == CTDiploModifier  and (Teams[pToPlayer:GetTeam()]:IsHasTech( iTechreq )) then
		--print(string.format("CodeTalkerDiploModifier(%s, %i, %s, %s)", GameInfo.DiploModifiers[iDiploModifier].Type, iModifier, Players[iFromPlayer]:GetCivilizationDescription(), Players[iToPlayer]:GetCivilizationDescription()))
		if not HasTrait(pFromPlayer, traitNavajoID) then
			local CTcount = 0
			for pUnit in pFromPlayer:Units() do
				if pUnit:IsHasPromotion(CodeTalkerPromoID) then
					CTcount = CTcount +1
				end
			end
			if CTcount <=10 then
				iModifier = -5 -1*CTcount;
			else
				iModifier = -15
			end
		end
	end
	return iModifier
end
GameEvents.GetDiploModifier.Add(CodeTalkerDiploModifier)
-----------------------------------
print("Navajo functions loaded")
--==========================================================================================================================
--==========================================================================================================================