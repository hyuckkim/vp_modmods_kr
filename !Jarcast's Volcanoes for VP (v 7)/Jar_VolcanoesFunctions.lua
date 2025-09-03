-- Jar_VolcanoesFunctions.lua
-- Author: Jarcast
-- DateCreated: 4/10/2024 12:29:02 AM
--==========================================================================================================================
-- UTILITIES
--==========================================================================================================================
-- GetRandom
function GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
-------------------------------------------------------------------------------------------------------------------------
if Game then
	function Game.GetCommunityOptions(type)
		for row in GameInfo.Community("Type = '" .. type .. "'") do
			return row.Value
		end
	end
end
--==========================================================================================================================
-- FUNCTIONS
--==========================================================================================================================
local tAllowedFeatures = {}
tAllowedFeatures[-1] = true
tAllowedFeatures[GameInfoTypes.FEATURE_JUNGLE] = true
tAllowedFeatures[GameInfoTypes.FEATURE_MARSH] = true
tAllowedFeatures[GameInfoTypes.FEATURE_FOREST] = true
tAllowedFeatures[GameInfoTypes.FEATURE_FLOOD_PLAINS] = true

function Jar_ObsidianWorksResourceSpawn(iPlayer, iCity, iBuildingType, bGold, bFaithOrCulture)
	local pPlayer = Players[iPlayer];
	local pCity = pPlayer:GetCityByID(iCity)
	if not pPlayer:IsAlive() then return end
	if pCity and iBuildingType == GameInfoTypes.BUILDING_OBSIDIAN_WORKS then
		for i = 0, pCity:GetNumCityPlots() - 1, 1 do
			local pPlot = pCity:GetCityIndexPlot(i)
			local distance = Map.PlotDistance(pCity:GetX(), pCity:GetY(), pPlot:GetX(), pPlot:GetY())
			local bcheck = pPlot:GetOwner() == iPlayer or pPlot:GetOwner() == -1
			if pPlot and distance<= 3 and bcheck and pPlot:GetResourceType() == -1 and pPlot:GetImprovementType() == -1
			and tAllowedFeatures[pPlot:GetFeatureType()] and (not pPlot:IsWater()) and (not pPlot:IsMountain()) and (not pPlot:IsCity()) then
				pPlot:SetResourceType(GameInfoTypes.RESOURCE_OBSIDIAN, 1)
				break
			end
		end
	end
end
GameEvents.CityConstructed.Add(Jar_ObsidianWorksResourceSpawn)

local tVolcanoFeatures = {}
for row in GameInfo.Features("IsVolcano=1") do
	tVolcanoFeatures[row.ID] = true
end

function Jar_Tongariro_CityCanConstruct(playerID, cityID, buildingType)
	local pPlayer = Players[playerID]
	local pCity = pPlayer:GetCityByID(cityID)
	if buildingType == GameInfoTypes.BUILDING_JAR_TONGARIRO then
		local iFlora = 0
		local iVolcano = 0
		for cityPlot = 1, pCity:GetNumCityPlots() - 1, 1 do
			local pPlot = pCity:GetCityIndexPlot(cityPlot)
			if pPlot and pPlot:GetOwner() == playerID then
				if pPlot:GetFeatureType() == GameInfoTypes.FEATURE_FOREST or pPlot:GetFeatureType() == GameInfoTypes.FEATURE_JUNGLE then
					iFlora = iFlora +1
				end
				if tVolcanoFeatures[pPlot:GetFeatureType()] then
					iVolcano = iVolcano +1
				end
			end
		end
		if iFlora>0 and iVolcano>0 then return true end
		return false
	end
	return true
end
GameEvents.CityCanConstruct.Add(Jar_Tongariro_CityCanConstruct)

local iFVolcano = GameInfoTypes.FEATURE_VOLCANO_NEW

function Jar_PompeiiWonderDummyPolicy(iPlayer, iCity, iBuilding, bIncludeGold, bIncludeFaithOrCulture)
	local pPlayer = Players[iPlayer]	
	local pCity = pPlayer:GetCityByID(iCity)
	if iBuilding ~= GameInfoTypes.BUILDING_JAR_POMPEII then return end
	if not pPlayer:HasPolicy(GameInfoTypes.POLICY_JAR_POMPEII) then
		pPlayer:GrantPolicy(GameInfoTypes.POLICY_JAR_POMPEII, true)
	end	
end
GameEvents.CityConstructed.Add(Jar_PompeiiWonderDummyPolicy)

function Jar_TongariroWonderDummyPolicy(iPlayer, iCity, iBuilding, bIncludeGold, bIncludeFaithOrCulture)
	local pPlayer = Players[iPlayer]	
	local pCity = pPlayer:GetCityByID(iCity)
	if iBuilding ~= GameInfoTypes.BUILDING_JAR_TONGARIRO then return end
	if not pPlayer:HasPolicy(GameInfoTypes.POLICY_JAR_TONGARIRO) then
		pPlayer:GrantPolicy(GameInfoTypes.POLICY_JAR_TONGARIRO, true)
	end	
end
GameEvents.CityConstructed.Add(Jar_TongariroWonderDummyPolicy)

--[[function Jar_VolcanoFood2AdjacentTiles(iPlotX, iPlotY, iPlotOwner, iOldFeature, iNewFeature)
	local pPlot = Map.GetPlot(iPlotX, iPlotY);
	if pPlot then
		if iNewFeature == iFVolcano then
			for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
				local pAdjacentPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), direction)
				if pAdjacentPlot and (not pAdjacentPlot:IsWater()) and (not pAdjacentPlot:IsMountain()) and pPlot:GetFeatureType() ~= iFVolcano then
					Game.SetPlotExtraYield(pAdjacentPlot:GetX(), pAdjacentPlot:GetY(), GameInfo.Yields.YIELD_FOOD.ID, 1 )				
				end
			end
		end
		if iOldFeature == iFVolcano then
			for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
				local pAdjacentPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), direction)
				if pAdjacentPlot and (not pAdjacentPlot:IsWater()) and (not pAdjacentPlot:IsMountain()) and pPlot:GetFeatureType() ~= iFVolcano then
					Game.SetPlotExtraYield(pAdjacentPlot:GetX(), pAdjacentPlot:GetY(), GameInfo.Yields.YIELD_FOOD.ID, -1 )				
				end
			end
		end
	end
end
GameEvents.TileFeatureChanged.Add(Jar_VolcanoFood2AdjacentTiles)]]
--==========================================================================================================================
-- VOLCANO PLACEMENT ON MAP
--==========================================================================================================================
local VolcanoPercent = Game.GetCommunityOptions("JAR_VOLCANOES_PERCENT")
local MinDistanceVolcanoes = Game.GetCommunityOptions("JAR_VOLCANOES_MINDISTANCE")
local MaxDistanceFromAtoll = 2

function Jar_PlaceVolcanoes()
	local tEligiblePlots = {}
	for plotLoop = Map.GetNumPlots() - 1, 0, -1 do
		local pPlot = Map.GetPlotByIndex(plotLoop)
		if pPlot:IsHills() and pPlot:GetResourceType()== -1 and pPlot:GetImprovementType() == -1 and tAllowedFeatures[pPlot:GetFeatureType()] and not pPlot:IsUnit() then
			local iAdjacentLand = 0
			for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
				local pAdjacentPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), direction)
				if pAdjacentPlot and not pAdjacentPlot:IsWater() then
					iAdjacentLand = iAdjacentLand +1
				end
			end			
			if iAdjacentLand >2 and GetRandom(1, 100) <= VolcanoPercent then
				table.insert(tEligiblePlots, pPlot)
			end
		end		
	end
	local tNearPlots = {}
	for k, v in pairs(tEligiblePlots) do
		tNearPlots[k] = {}
		for a, b in pairs(tEligiblePlots) do
			local distance = Map.PlotDistance(v:GetX(), v:GetY(), b:GetX(), b:GetY())
			if b ~= v and distance < MinDistanceVolcanoes then
				table.insert(tNearPlots[k], b)
			end
		end
	end	
	local tVolcanoPlots = {}
	local tAvoidPlots = {}
	local imax = #tEligiblePlots
	local i=1
	while( i <= imax ) do
		if next (tEligiblePlots) ~= nil then
			local randNum = GetRandom(1, #tEligiblePlots)
			table.insert(tVolcanoPlots, tEligiblePlots[ randNum ] )
			if next (tNearPlots[randNum]) ~= nil then
				for index, value in pairs(tNearPlots[randNum]) do
					table.insert(tAvoidPlots, value )
				end
			end
			table.remove(tEligiblePlots, randNum)
		end	
		i = i+1
	end
	local tVolcanoPlots2 = {}
	for k, v in pairs(tVolcanoPlots) do
		local bcheck = true
		for a, b in pairs(tAvoidPlots) do
			if v:GetX() == b:GetX() and v:GetY() == b:GetY() then
				bcheck = false
			end
		end
		if bcheck then
			table.insert(tVolcanoPlots2, v )
		end
	end
	for k, v in pairs(tVolcanoPlots2) do
		v:SetFeatureType(iFVolcano)
		print(k .. ") Volcano placed: " .. v:GetX() .. ", " .. v:GetY() )
		
		for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
			local pAdjacentPlot = Map.PlotDirection(v:GetX(), v:GetY(), direction)
			if pAdjacentPlot and (not pAdjacentPlot:IsWater()) and (not pAdjacentPlot:IsMountain()) and pPlot:GetFeatureType() ~= iFVolcano then
				Game.SetPlotExtraYield(pAdjacentPlot:GetX(), pAdjacentPlot:GetY(), GameInfo.Yields.YIELD_FOOD.ID, 1 )				
			end
		end		
	end
end

local g_SaveData = Modding.OpenSaveData();
function Initialize()
	local bInit = g_SaveData.GetValue("Jar_VolcanoesVP");
	if not bInit then
		Jar_PlaceVolcanoes();
		g_SaveData.SetValue("Jar_VolcanoesVP", true);
	end
end
Initialize();

function Jar_VolcanoEruption(iPlayer, iCityID, iEvent)
	local pPlayer = Players[iPlayer]
	local pCity = pPlayer:GetCityByID(iCityID)
	if iEvent == GameInfoTypes.CITY_EVENT_JAR_VOLCANO_1 or iEvent == GameInfoTypes.CITY_EVENT_JAR_VOLCANO_2 then
		for i = 0, pCity:GetNumCityPlots() - 1, 1 do
			local pPlot = pCity:GetCityIndexPlot(i)
			if pPlot:GetFeatureType() == iFVolcano then
				for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
					local pAdjacentPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), direction)
					if pAdjacentPlot and pAdjacentPlot:GetImprovementType() > 2 then
						pAdjacentPlot:SetImprovementPillaged(true)			
					end
				end
				break
			end
		end
	end
end
GameEvents.CityEventActivated.Add(Jar_VolcanoEruption)
---------------------------------------------------------
print("Volcanoes functions done!")
--======================================================================================================================
--======================================================================================================================