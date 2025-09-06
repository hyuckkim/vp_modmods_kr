-- JPE_Functions
-- Author: Jarcast
-- DateCreated: 02/09/2023 5:51:48 PM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
include("FLuaVector.lua")
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
local Teams 					= Teams
local activePlayerID			= Game.GetActivePlayer()
local activePlayer				= Players[activePlayerID]
local activeTeamID				= activePlayer:GetTeam()
local activeTeam				= Teams[activeTeamID]
--==========================================================================================================================
-- UTILITIES
--==========================================================================================================================
-- UTILITIES
----------------------------------------------------------------------------------------------------------------------------
-- GetRandom
function GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
-------------------------------------------------------------------------------------------------------------------------
function IsInteger(n)
  return n==math.floor(n)
end
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local onlycoastal= GameDefines.LAKE_MAX_AREA_SIZE +1
local CityWorkingRadius = GameDefines.MAXIMUM_WORK_PLOT_DISTANCE or 3
local iMod = ((GameInfo.GameSpeeds[Game.GetGameSpeedType()].BuildPercent)/100)
local iResJade = GameInfoTypes.RESOURCE_JADE
local NumJadeOnMap = Map.GetNumResources(iResJade)
--========================================================================================================================
-- FUNCTIONS
--========================================================================================================================
function Jar_CanConstructLianghzu(ePlayer, eCity, eBuilding)
	local pPlayer = Players[ePlayer]
	if not pPlayer:IsAlive() then return false end
	local pCity = pPlayer:GetCityByID(eCity)
	local pCityPlot = pCity:Plot()
	
	if eBuilding == GameInfoTypes.BUILDING_LIANGZHU then
		if NumJadeOnMap <1 then return false else return true end
	end
	return true
end
GameEvents.CityCanConstruct.Add(Jar_CanConstructLianghzu)

local tAllowedFeatures = {}
tAllowedFeatures[-1] = true
tAllowedFeatures[GameInfoTypes.FEATURE_JUNGLE] = true
tAllowedFeatures[GameInfoTypes.FEATURE_MARSH] = true
tAllowedFeatures[GameInfoTypes.FEATURE_FOREST] = true
--tAllowedFeatures[GameInfoTypes.FEATURE_FLOOD_PLAINS] = true

function Jar_LianghzuJade(iPlayer, iCity, iBuildingType, bGold, bFaithOrCulture)
	local pPlayer = Players[iPlayer];
	local pCity = pPlayer:GetCityByID(iCity)
	if not pPlayer:IsAlive() then return end
	if pCity and iBuildingType == GameInfoTypes.BUILDING_LIANGZHU then
		local NumRes2place = 2
		for i = 0, pCity:GetNumCityPlots() - 1, 1 do
			local pPlot = pCity:GetCityIndexPlot(i)
			local distance = Map.PlotDistance(pCity:GetX(), pCity:GetY(), pPlot:GetX(), pPlot:GetY())
			local bcheck = pPlot:GetOwner() == iPlayer or pPlot:GetOwner() == -1
			if pPlot and distance<= 3 and bcheck and pPlot:GetImprovementType() == -1 and (not pPlot:IsMountain()) and (not pPlot:IsCity())
			and pPlot:GetResourceType() == -1 and tAllowedFeatures[pPlot:GetFeatureType()] and (not pPlot:IsWater()) then
				if NumRes2place >0  then
					pPlot:SetResourceType(iResJade, 1)
					if pPlot:GetOwner() == -1 then
						pPlot:SetOwner(iPlayer, iCity, true, true)
					end
					NumRes2place = NumRes2place-1
				else break
				end
			end
		end
	end
end
GameEvents.CityConstructed.Add(Jar_LianghzuJade)
---------------------------------------------------------
print("Jarcast's Bare Necessities functions loaded")
print("Number of Jade on map for Liangzhu: " .. NumJadeOnMap )
--======================================================================================================================
--======================================================================================================================
