-- Global_Warming
-- Author: FramedArchitecture
-- DateCreated: 11/9/2012
--------------------------------------------------------------
include("GW_Globals.lua")
include("PlotIterators.lua")
--------------------------------------------------------------
local MapModData		= MapModData
MapModData.g_Properties	= MapModData.g_Properties or {}
local g_Properties		= MapModData.g_Properties
--------------------------------------------------------------
local bIsBNW		 = ContentManager.IsActive("6DA07636-4123-4018-B643-6575B4EC336B", ContentType.GAMEPLAY);
local eraBegin		 = GameInfo.Eras[g_EraBegin]
local bKillResource	 = bKillResource
local randomChance	 = PreGame.GetGameSpeed() + 4
local playerVariable = (1 - Game.CountCivPlayersEverAlive()/150)
local speedVariable	 = (12 - 3*PreGame.GetGameSpeed())
local worldVariable	 = 1
local floor			 = math.floor
local ceil			 = math.ceil
local log			 = math.log
local random		 = math.random
local insert		 = table.insert
local remove		 = table.remove
--------------------------------------------------------------
--Events
--------------------------------------------------------------
local DoIceMelting = function()
	local plot
	local plots = {}
	local bChoice = (Random() < 50)
	local iceID = FeatureTypes.FEATURE_ICE
	local snowID = TerrainTypes.TERRAIN_SNOW

	local n = Map.GetNumPlots()-1
	for i = 0, n, 1 do
		local plot = Map.GetPlotByIndex(i)
		local bInsert = false
		if bChoice and (plot:GetFeatureType() == iceID) then
			bInsert = true
		elseif (plot:GetTerrainType() == snowID) then
			bInsert = true
    	end
		if bInsert then
			insert(plots, plot)
		end
	end
		
	if (#plots > 0) then
		plot = plots[random(#plots)]

		if (plot:GetFeatureType() == iceID) then
			plot:SetFeatureType(FeatureTypes.NO_FEATURE, -1)
		elseif (plot:GetTerrainType() == snowID) then
			plot:SetImprovementPillaged(true)
			plot:SetTerrainType(TerrainTypes.TERRAIN_TUNDRA, false, true)

			if bKillResource and (Random() < randomChance) then
				SetResource(plot, true)
			elseif (Random() < 20) then
				plot:SetFeatureType(FeatureTypes.FEATURE_FOREST, -1)
				SetResource(plot, false)
			end
		end
	end
	return plot
end
local DoLandWarming = function()
	local plot
	local plots = {}
	local shifts = {
		["TERRAIN_TUNDRA"] = "TERRAIN_GRASS",
		["TERRAIN_GRASS"] = "TERRAIN_PLAINS",
		["TERRAIN_PLAINS"] = "TERRAIN_DESERT",
	}

	local n = Map.GetNumPlots()-1
	for i = 0, n, 1 do
		local plot = Map.GetPlotByIndex(i)
		if not plot:IsWater() and not plot:IsMountain() then
			insert(plots, plot)
    	end
	end
	
	if (#plots > 0) then
		plot = plots[random(#plots)]
		local terrainType = GameInfo.Terrains[plot:GetTerrainType()].Type
		for key,value in pairs(shifts) do
			if (key == terrainType) then
				plot:SetImprovementPillaged(true)
				plot:SetTerrainType(GameInfoTypes[value], false, true)
				terrainType = value
				break
			end
		end
		local featureInfo = GameInfo.Features[plot:GetFeatureType()]
		if featureInfo and not featureInfo.NaturalWonder then
			local bRemove = true
			for row in GameInfo.Feature_TerrainBooleans("TerrainType='" .. terrainType .. "'") do
				if (featureInfo.Type == row.FeatureType) then
					bRemove = false
					break
				end
			end
			if bRemove then
				plot:SetFeatureType(FeatureTypes.NO_FEATURE, -1)
			end
		end
		local resourceInfo = GameInfo.Resources[plot:GetResourceType(-1)]
		if resourceInfo then
			local bRemove = true
			if featureInfo then
				for row in GameInfo.Resource_FeatureBooleans("FeatureType='" .. featureInfo.Type .. "'") do
					if (resourceInfo.Type == row.ResourceType) then
						bRemove = false
						break
					end
				end
			end
			for row in GameInfo.Resource_FeatureTerrainBooleans("TerrainType='" .. terrainType .. "'") do
				if (resourceInfo.Type == row.ResourceType) then
					bRemove = false
					break
				end
			end
			if bRemove then
				SetResource(plot, true)
			end
		end
	end
	return plot
end
local DoCoastWarming = function()
	local plot
	local plots = {}
	local bDestroy = (Random() < 50)

	local n = Map.GetNumPlots()-1
	for i = 0, n, 1 do
		local plot = Map.GetPlotByIndex(i)
		if plot:IsWater() and plot:IsAdjacentToLand() then
			local resourceID = plot:GetResourceType()
			if (bDestroy and (resourceID > -1)) or (not bDestroy and (resourceID == -1)) then
				insert(plots, plot)
			end
    	end
	end
	if (#plots > 0) then
		plot = plots[random(#plots)]
		SetResource(plot, bDestroy)
	end
	return plot
end
local DoCoastFlood = function()
	local plot
	local plots = {}

	local n = Map.GetNumPlots()-1
	for i = 0, n, 1 do
		local plot = Map.GetPlotByIndex(i);
		if (plot:IsCoastalLand() or plot:IsRiver()) and plot:IsFlatlands() then
			insert(plots, plot)
    	end
	end
		
	if (#plots > 0) then
		plot = plots[random(#plots)]
		for newPlot in PlotAreaSpiralIterator(plot, 3, 1, true, false, true) do
			if newPlot then
				if (newPlot:IsCoastalLand() or newPlot:IsRiver()) and newPlot:IsFlatlands() then
					newPlot:SetImprovementPillaged(true)
					if bKillResource and (Random() < randomChance) then
						SetResource(newPlot, true)
					end
				end
			end
		end
	end
	return plot
end
local DoJungleExpand = function()
	local plot
	
	if IsWBMap() then return plot end

	local plots = {}
	local bResource = true
	local updatePlot = function(plot, featureID)
		plot:SetImprovementType(-1)
		plot:SetFeatureType(featureID, -1)
		SetResource(plot, false)
		if (random(100) <= randomChance) then
			SetResource(plot, true)
		end
	end

	local n = Map.GetNumPlots()-1
	for i = 0, n, 1 do
		local plot = Map.GetPlotByIndex(i)
		if not plot:IsWater() and (plot:GetLatitude() < 0.3) then
			insert(plots, plot)
    	end
	end
		
	if (#plots > 0) then
		plot = plots[random(#plots)]
		local plainsID = TerrainTypes.TERRAIN_PLAINS
		local grassID = TerrainTypes.TERRAIN_GRASS
		local jungleID = FeatureTypes.FEATURE_JUNGLE
		local marshID = FeatureTypes.FEATURE_MARSH

		for newPlot in PlotAreaSpiralIterator(plot, 2, 1, true, false, true) do
			if newPlot and not newPlot:IsCity() then
				if not plot:IsWater() and (plot:GetLatitude() < 0.35) then
					local featureID = newPlot:GetFeatureType()
					if (featureID ~= jungleID) and (featureID ~= marshID) then
						local terrainID = newPlot:GetTerrainType()
						if (terrainID == plainsID) then
							updatePlot(newPlot, jungleID)
						elseif (terrainID == grassID) then
							updatePlot(newPlot, marshID)
						end
					end
				end
			end
		end
	end

	return plot
end
local DoHurricane = function()
	local plot
	local cities = {}

	for i = 0, GameDefines.MAX_CIV_PLAYERS-1, 1 do
		local player = Players[i]
		if player and player:IsAlive() then
			for city in player:Cities() do
				if city:IsCoastal() then
					insert(cities, city)
				end
			end
		end
	end
		
	if (#cities > 0) then
		local city = cities[random(#cities)]
		local change = floor(city:GetPopulation()/random(3,5))
		
		city:ChangePopulation(-change, true)
		plot = city:Plot()

		for newPlot in PlotAreaSpiralIterator(plot, 3, 1, true, false, true) do
			if newPlot then
				if newPlot:IsFlatlands() or newPlot:IsAdjacentToLand() then
					if (Random() < 33) then
						if plot:IsWater() then
							newPlot:SetImprovementType(-1)
						else
							newPlot:SetImprovementPillaged(true)
						end
					end
				end
			end
		end
	end

	return plot
end
local g_GWEvents = {
	{ func = DoIceMelting,		title = "TXT_KEY_GW_EVENT_MELT_TITLE",		text = "TXT_KEY_GW_EVENT_MELT",			threshold = 5 },
	{ func = DoLandWarming,		title = "TXT_KEY_GW_EVENT_LANDWARM_TITLE",	text = "TXT_KEY_GW_EVENT_LANDWARM",		threshold = 15 },
	{ func = DoCoastWarming,	title = "TXT_KEY_GW_EVENT_COASTWARM_TITLE",	text = "TXT_KEY_GW_EVENT_COASTWARM",	threshold = 30 },
	{ func = DoCoastFlood,		title = "TXT_KEY_GW_EVENT_FLOOD_TITLE",		text = "TXT_KEY_GW_EVENT_FLOOD",		threshold = 50 },
	{ func = DoJungleExpand,	title = "TXT_KEY_GW_EVENT_JUNGLE_TITLE",	text = "TXT_KEY_GW_EVENT_JUNGLE",		threshold = 60 },
	{ func = DoHurricane,		title = "TXT_KEY_GW_EVENT_HURRICANE_TITLE",	text = "TXT_KEY_GW_EVENT_HURRICANE",	threshold = 75 },
}
--------------------------------------------------------------
--GameEvents
--------------------------------------------------------------
function OnGlobalWarming()
	local fIndex = OnUpdateGlobalWarmingIndex()
	local modulo = function()
		local x = (speedVariable - floor(fIndex/20))
		x = (x < 1) and 1 or x
		return x
	end
	
	if ((Game.GetGameTurn() % modulo()) == 0) then
		DoGlobalWarmingEvent(fIndex)
	end
end
--------------------------------------------------------------
function OnEraChanged(eraID)
	if (eraID == eraBegin) then

		Events.ActivePlayerTurnStart.Add(OnGlobalWarming)
		Events.SerialEventEraChanged.Remove(OnEraChanged)
		g_Properties.g_GWIntialized = true

		-- Notification
		local text = Locale.ConvertTextKey("TXT_KEY_GW_ERANOTIFY", GameInfo.Eras[eraID].Description);
		local heading = Locale.ConvertTextKey("TXT_KEY_GW_ERANOTIFY_SHORT");
    	Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, -1, -1); 
	end
end
--------------------------------------------------------------
--Functions
--------------------------------------------------------------
function OnUpdateGlobalWarmingIndex()
	local fIndex = 0
	local myIndex = 0
	local fPopulation = 0
	local myPopulation = 0
	local fBuildings = 0
	local myBuildings = 0
	local fTech = 0
	local myTech = 0
	local fTerrain = 1
	local fFeatures = 1
	local fImprovements = 1
	local currentPlayerID = Game.GetActivePlayer()
	local currentPlayer = Players[currentPlayerID]
	local globalArea = Map.GetNumPlots()
	local recalcIndex = function(x)
		local x = x
		x = (x * worldVariable)
		x = (x < 0) and 0 or x
		x = (x > 100) and 100 or x
		return floor(x)
	end	
	local resolutionMod = function()
		local mod = 100
		if bIsBNW then
			local t = g_Properties.g_GWResolutions or {}
			for type, bEnacted in pairs(t) do
				if bEnacted then
					mod = mod - GameInfo.Resolutions[type].GlobalWarmingReduction
				end
			end
		end
		return mod/100
	end

	fPopulation = ceil(log(Game.GetTotalPopulation())^1.5)
	myPopulation = ceil(log(currentPlayer:GetTotalPopulation())^1.5)

	local n = GameDefines.MAX_CIV_PLAYERS-1

	for i = 0, n, 1 do
		local player = Players[i]
		if player and player:IsAlive() then
			for _,v in ipairs(g_buildings) do
				local buildingInfo = GameInfo.Buildings[v.type]
				if buildingInfo then
					local value = (v.value * player:CountNumBuildings(buildingInfo.ID))
					fBuildings = fBuildings + value
					if (i == currentPlayerID) then
						myBuildings = myBuildings + value
					end
				end
			end
			local team = Teams[player:GetTeam()]
			for _,v in ipairs(g_techs) do
				local techInfo = GameInfo.Technologies[v.type]
				if techInfo then
					if team:IsHasTech(techInfo.ID) then
						fTech = fTech + v.value
						if (i == currentPlayerID) then
							myTech = myTech + v.value
						end
					end
				end
			end
		end
	end

	n = Map.GetNumPlots() - 1

	for i = 0, n, 1 do
		local plot = Map.GetPlotByIndex(i)
		local terrainID = plot:GetTerrainType()
		for _,v in ipairs(g_terrains) do
			local terrainInfo = GameInfo.Terrains[v.type]
			if terrainInfo and (terrainInfo.ID == terrainID) then
				fTerrain = fTerrain + v.value
			end
		end
		local featureID = plot:GetFeatureType()
		if (featureID > -1) then
			for _,v in ipairs(g_features) do
				local featureInfo = GameInfo.Features[v.type]
				if featureInfo and (featureInfo.ID == featureID) then
					fFeatures = fFeatures + v.value
				end
			end
		end
		local improvementID = plot:GetImprovementType()
		if (improvementID > -1) then
			for _,v in ipairs(g_improvements) do
				local improveInfo = GameInfo.Improvements[v.type]
				if improveInfo and (improveInfo.ID == improvementID) then
					fImprovements = fImprovements + v.value
				end
			end
		end
		local routeID = plot:GetRouteType()
		if (routeID > -1) then
			for _,v in ipairs(g_routes) do
				local routeInfo = GameInfo.Routes[v.type]
				if routeInfo and (routeInfo.ID == routeID) then
					fImprovements = fImprovements + v.value
				end
			end
		end
	end

	fTerrain = 1 + (fTerrain/globalArea)
	fFeatures = 1 + (fFeatures/globalArea)
	fImprovements = 1 + (fImprovements/Map.GetLandPlots())
	fResolutions = resolutionMod()

	local fMitigation = playerVariable * fTerrain * fImprovements * fFeatures * fResolutions
	fIndex = (fPopulation + fBuildings + fTech) * fMitigation
	myIndex = (myPopulation + myBuildings + myTech) * fMitigation

	fIndex = recalcIndex(fIndex)
	myIndex = recalcIndex(myIndex)

	----meter UI support
	g_Properties.fIndex = fIndex
	g_Properties.myIndex = myIndex

	return fIndex, myIndex
end
LuaEvents.UpdateGlobalWarmingIndex.Add(OnUpdateGlobalWarmingIndex)
--------------------------------------------------------------
function DoGlobalWarmingEvent(fIndex)
	local randomroll = Random()

	print("DoGlobalWarmingEvent()", Game.GetGameTurn(), randomroll, fIndex)

	if (randomroll <= fIndex) then
		local options = {}

		for _,v in ipairs(g_GWEvents) do
			if (v.threshold < fIndex) then
				insert(options, v)
			end
		end

		if (#options > 0) then
			local event = options[random(#options)]
			local plot = event.func()

			-- Notification
			if plot then
				local x, y = -1, -1
				local heading = Locale.ConvertTextKey("TXT_KEY_GW_EVENT_TITLE")
				local text = Locale.ConvertTextKey(event.text)
				if plot:IsRevealed(Game.GetActiveTeam(), false) then
					x, y = plot:GetX(), plot:GetY()	
				end
				if plot:IsCity() then
					text = Locale.ConvertTextKey(event.text, plot:GetPlotCity():GetName())
				end

     			Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, x, y); 
			end
		end
	end
end
--------------------------------------------------------------
function SetResource(plot, bDestroy)
	local bNotify = false
	local resourceID = plot:GetResourceType(-1)

	if bDestroy and (resourceID > -1) then
		plot:SetImprovementType(-1)
		plot:SetResourceType(-1)
		bNotify = true
	elseif (resourceID == -1) then
		local options = {}
		local featureInfo = GameInfo.Features[plot:GetFeatureType()]
		if featureInfo and not featureInfo.NaturalWonder then
			for row in GameInfo.Resource_FeatureBooleans("FeatureType='" .. featureInfo.Type .. "'") do
				insert(options, row.ResourceType)
			end
		else
			local terrainType = GameInfo.Terrains[plot:GetTerrainType()].Type
			for row in GameInfo.Resource_TerrainBooleans("TerrainType='" .. terrainType .. "'") do
				insert(options, row.ResourceType)
			end
		end
		
		if (#options > 0) then
			local resourceType = options[random(#options)]
			local quantity = 1
			for row in GameInfo.Resource_QuantityTypes("ResourceType='" .. resourceType .. "'") do
				quantity = random(row.Quantity)
			end
			resourceID = GameInfo.Resources[resourceType].ID
			plot:SetResourceType(resourceID, quantity)
			bNotify = true
		end
	end
	
	-- Notification
	if bNotify and plot:IsVisible(Game.GetActiveTeam(), false) then
		local description = GameInfo.Resources[resourceID].Description
		local heading = Locale.ConvertTextKey("TXT_KEY_GW_EVENT_TITLE")
		local text = Locale.ConvertTextKey("TXT_KEY_GW_GAINED_RESOURCE", description)
		if bDestroy then
			text = Locale.ConvertTextKey("TXT_KEY_GW_LOST_RESOURCE", description)
		end 
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, plot:GetX(), plot:GetY()); 
	end
end
--------------------------------------------------------------
function Random()
	return Game.Rand(100, "Choosing Global Warming Effect")
end
--------------------------------------------------------------
function IsWBMap()
	return Path.UsesExtension(PreGame.GetMapScript(),".Civ5Map"); 
end
--------------------------------------------------------------
function Initialize()
	if eraBegin then
		local bInitialized = false

		eraBegin = eraBegin.ID
		
		for i = 0, GameDefines.MAX_CIV_PLAYERS-1, 1 do
			local player = Players[i]
			if player and (player:GetCurrentEra() >= eraBegin) then	
				bInitialized = true
				break
			end
		end
	
		if (worldVariable > 0) then
			local worldInfo = GameInfo.Worlds[Map.GetWorldSize()]
			if worldInfo then
				worldVariable = (1/worldInfo.AdvancedStartPointsMod)*100
			end
		end
	
		if bInitialized then
			Events.ActivePlayerTurnStart.Add(OnGlobalWarming)
		else
			Events.SerialEventEraChanged.Add(OnEraChanged)
		end

		g_Properties.g_GWIntialized = bInitialized
		g_Properties.g_GWEvents = g_GWEvents
	end
end
--------------------------------------------------------------
Initialize();



