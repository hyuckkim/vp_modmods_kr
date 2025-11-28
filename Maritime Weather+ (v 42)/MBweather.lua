--Mod options, can be customized
local iStormUpdateFrequency = (4 - Game.GetGameSpeedType());
local iStormsSpawnedPerTurn = (Map.GetWorldSize() + Game.GetGameSpeedType() + Map.GetSeaLevel() + (5 - Map.GetClimate()) );
local iStormAdjacencySpawnProbability = (10 + Map.GetWorldSize() + Map.GetSeaLevel() + (4 - Map.GetClimate()));
local iSeasonLength = iStormUpdateFrequency * (math.max(4, ((Map.GetWorldSize() + 1) * (4 - Game.GetGameSpeedType()) + Map.GetClimate() + Map.GetSeaLevel())));
local iFreshWaterDespawnChance = 0;
local iCoastalDespawnChance = 5;
local iInlandDespawnChance = 15;
local iStuckDespawnChance = 34;

--Mod variables and constants, do not change
local MBPcancerOcean = {};
local MBPcapricornOcean = {};
local MBParcticOcean = {};
local MBPantarcticOcean = {};
local MBPnorthernLakes = {};
local MBPsouthernLakes = {};
local MBPcancerLakes = {};
local MBPcapricornLakes = {};
local MBPstorms = {};
local tWeatherFeature = GameInfoTypes.FEATURE_RESTRICTED_VISIBILITY;
local tStormImprovement = GameInfoTypes.IMPROVEMENT_STORM;
local tOceanTerrain = GameInfoTypes.TERRAIN_OCEAN;

local iW, iH = Map.GetGridSize();
local iCapricorn = math.floor(0.3 * iH);
local iCancer = math.ceil(0.7 * iH);
local iEquator = math.floor((0.5 * iH) + 0.5);

local iSnapshotModelCreateTypeID = nil;
local iAnimModelCreateTypeID = nil;
local iSViconTypeID = nil;

local ResourceLayoutHandlers = {};

function MBPOceanCrossFunctionAvailable()
	local pPlayer = Players[63];
	local uUnit = pPlayer:InitUnit(83, 0, 0, 0, -1);
	local bOceanCrossFunctionActive = (type(uUnit.CanCrossOceans) == "function")
	uUnit:Kill();
	return bOceanCrossFunctionActive
end

function MBPartInitialized()
	if iSnapshotModelCreateTypeID and iAnimModelCreateTypeID and iSViconTypeID then
		MBPwaterCounter();
	end
end

function MBPgetStormUpdateFrequency()
	return iStormUpdateFrequency;
end

function MBPgetSeason()
	local iTurn = Game.GetGameTurn();
	return math.fmod(math.floor(iTurn/iSeasonLength), 4);
end

function MBPupdateSnapshotID(artModelID)
	iSnapshotModelCreateTypeID = artModelID
	print("SnapshotID updated to " .. iSnapshotModelCreateTypeID)
end

function MBPupdateAnimID(artModelID)
	iAnimModelCreateTypeID = artModelID
	print("animID updated to " .. iAnimModelCreateTypeID)
end

function MBPupdateSViconID(SViconID)
	iSViconTypeID = SViconID
	print("SViconID updated to " .. iSViconTypeID)
end

function MBPmapResourceLayoutHandlers()
	print("finding resource layoutHandler values")
	local holdingTable = {};
	for row in DB.Query("SELECT ID, ArtDefineTag FROM Resources") do
		--print(row.ArtDefineTag)
		if row.ArtDefineTag == "ART_DEF_RESOURCE_ALL" then
			holdingTable[row.ID] = 0;
		else
			for lrow in DB.Query("SELECT DISTINCT LayoutHandler FROM ArtDefine_Landmarks WHERE ImprovementType = 'ART_DEF_IMPROVEMENT_NONE' AND ResourceType = '" .. row.ArtDefineTag .. "' AND NOT ResourceType = 'ART_DEF_RESOURCE_ALL'") do
				holdingTable[row.ID] = lrow.LayoutHandler
			end
		end
		--print(holdingTable[row.ID])
	end
	for i = 0, #holdingTable - 1, 1 do
		if holdingTable[i] == "SNAPSHOT" or holdingTable[i] == "RANDOM" then
			ResourceLayoutHandlers[i] = 1;
		elseif holdingTable[i] == "ANIMATED" or holdingTable[i] == "ANIMATED_ROTATED" then
			ResourceLayoutHandlers[i] = 0;
		else
			ResourceLayoutHandlers[i] = -1;
		end
	end
end

function MBPwaterCounter()
	print("counting water to initialize weather")
	for i = 0, Map.GetNumPlots()-1, 1 do
		local pPlot = Map.GetPlotByIndex(i);
		local iLatitude = pPlot:GetY();
		if pPlot:GetTerrainType() == tOceanTerrain then
			if iLatitude > iCancer then
				table.insert(MBParcticOcean, pPlot);
			elseif iLatitude > iEquator then
				table.insert(MBPcancerOcean, pPlot);
			elseif iLatitude > iCapricorn then
				table.insert(MBPcapricornOcean, pPlot);
			else
				table.insert(MBPantarcticOcean, pPlot);
			end
		elseif pPlot:IsLake() then
			if iLatitude > iCancer then
				table.insert(MBPnorthernLakes, pPlot);
			elseif iLatitude > iEquator then
				table.insert(MBPcancerLakes, pPlot);
			elseif iLatitude > iCapricorn then
				table.insert(MBPcapricornLakes, pPlot);
			else
				table.insert(MBPsouthernLakes, pPlot);
			end
		end
		if (pPlot:GetFeatureType() == tWeatherFeature) then
			table.insert(MBPstorms, pPlot);
			MBPstormArtDrawer(pPlot)
		end
	end
end

function MBPstormSpawner(spawnPlot, bSpawnAdjacent)
	spawnPlot:SetFeatureType(tWeatherFeature)
	MBPstormArtDrawer(spawnPlot)
	MBPstorms[#MBPstorms + 1] = spawnPlot -- Add storm to tracking table
	if bSpawnAdjacent then
		-- Recursive storm expansion
		for _, dir in ipairs({DirectionTypes.DIRECTION_NORTHWEST, DirectionTypes.DIRECTION_NORTHEAST, 
							  DirectionTypes.DIRECTION_SOUTHWEST, DirectionTypes.DIRECTION_SOUTHEAST, 
							  DirectionTypes.DIRECTION_EAST, DirectionTypes.DIRECTION_WEST}) do
			if Game.Rand(100, "Storm Adjacent Spawn") < iStormAdjacencySpawnProbability then
				local adjPlot = Map.PlotDirection(spawnPlot:GetX(), spawnPlot:GetY(), dir)
				if MBPcanStorm(adjPlot) then
					MBPstormSpawner(adjPlot, true)
				end
			end
		end
	end
end

function MBPstormArtDrawer(pPlot)
	local ResourceType = pPlot:GetResourceType()
	local NumResource = pPlot:GetNumResource()
	local hexPos = ToHexFromGrid({x = pPlot:GetX(), y = pPlot:GetY()})
	Events.SerialEventImprovementIconCreated(hexPos.x, hexPos.y, iSViconTypeID, -1, nil)
	if ResourceLayoutHandlers[ResourceType] == 1 then
		Events.SerialEventImprovementCreated(hexPos.x, hexPos.y, 1, 1, 63, iAnimModelCreateTypeID, -1, ResourceType, NumResource, nil)
	else
		Events.SerialEventImprovementCreated(hexPos.x, hexPos.y, 1, 1, 63, iSnapshotModelCreateTypeID, -1, ResourceType, NumResource, nil)
	end
end

function MBPstormArtRemover(pPlot)
	--print("MBPstormArtRemover called")
	local hexPos = ToHexFromGrid({x = pPlot:GetX(), y = pPlot:GetY()})
	--print("calling destroyed event")
	Events.SerialEventImprovementIconDestroyed(hexPos.x, hexPos.y)
	Events.SerialEventImprovementDestroyed(hexPos.x, hexPos.y)
end

function MBPstormDespawner(despawnPlot)
	if despawnPlot:GetFeatureType() == tWeatherFeature then
		despawnPlot:SetFeatureType(-1)
		MBPstormArtRemover(despawnPlot)
	end
end

function MBPspawnStorms(regionTable, spawnCount)
	--print("MBPspawnStorms called")
	local count = 0
	local adjustedSpawnCount = math.ceil(spawnCount/math.max(1, math.ceil(Game.GetCurrentEra()/2)))
	while #regionTable > 0 and count < adjustedSpawnCount do
		local index = Game.Rand(#regionTable, "Select Storm Spawn Plot") + 1
		local plot = table.remove(regionTable, index)
		if MBPcanStorm(plot) then
			MBPstormSpawner(plot, true) -- Spawning storms should have adjacent spawns
			count = count + 1
		end
	end
end

function MBPcanStorm(pStormCandi)
	if pStormCandi == nil then return false end
	for i = 0, pStormCandi:GetNumUnits() - 1 do
		local uUnit = pStormCandi:GetUnit(i);
		if (uUnit:GetUnitClassType() == GameInfo.UnitClasses.UNITCLASS_WORKER.ID) then
			local tBuild = uUnit:GetBuildType();
			if not ((tBuild == nil) or (tBuild == -1)) then
				return false;
			end
		end
	end
	local bValidTerrain = pStormCandi:IsWater() or not pStormCandi:IsMountain();
	local iPlotFeature = pStormCandi:GetFeatureType();
	local bFeatureEligibility = (iPlotFeature == -1) or pStormCandi:IsLake() or (iPlotFeature == GameInfoTypes.FEATURE_COASTAL)  or (iPlotFeature == GameInfoTypes.FEATURE_SUBLITTORAL) or (iPlotFeature == GameInfoTypes.FEATURE_SAFE_WATERS);
	local bImprovementEligibility = pStormCandi:GetImprovementType() == -1;
	--local bResourceEligibility = pStormCandi:GetNumResource() < 1;
	return bValidTerrain and bFeatureEligibility and bImprovementEligibility;
end

function MBPmoveStorms(moveFunction)
	--print("MBPmoveStorms called")
	local currentStorms = MBPstorms;
	MBPstorms = {};
	for i, stormPlot in pairs(currentStorms) do -- Use pairs to handle nil values
		-- Verify storm still exists before processing
		if stormPlot:GetFeatureType() ~= tWeatherFeature then
			MBPstormDespawner(stormPlot)
		else
			local bDespawned = false;
			if not stormPlot:IsWater() then
				if stormPlot:IsFreshWater() then
					if Game.Rand(100, "Storm Despawn") < iFreshWaterDespawnChance then
						MBPstormDespawner(stormPlot);
						bDespawned = true;
					end
				elseif stormPlot:IsCoastalLand() then
					if Game.Rand(100, "Storm Despawn") < iCoastalDespawnChance then
						MBPstormDespawner(stormPlot);
						bDespawned = true;
					end
				else
					if Game.Rand(100, "Storm Despawn") < iInlandDespawnChance then
						MBPstormDespawner(stormPlot);
						bDespawned = true;
					end
				end
			end
			if not bDespawned then
				local adjPlots = moveFunction(stormPlot)
				local bMoved = false;
				while #adjPlots > 0 do
					local newPlot = adjPlots[Game.Rand(#adjPlots, "Storm Movement") + 1]
					if MBPcanStorm(newPlot) then
						MBPstormSpawner(newPlot, false) -- Moving storms should not spawn adjacent ones
						MBPstormDespawner(stormPlot)
						bMoved = true;
						break;
					else
						table.remove(adjPlots, i) -- If no valid move, keep the storm in place
					end
				end
				if not bMoved then
					if Game.Rand(100, "Storm Despawn") < iStuckDespawnChance then
						MBPstormDespawner(stormPlot)
					else
						MBPstorms[#MBPstorms + 1] = stormPlot
					end
				end
			end
		end
	end
end

function MBPsummer(bSpawn, bMove)
	print("Season: Summer")
	if bMove then
		MBPmoveStorms(function(stormPlot)
			return stormPlot:GetY() > iEquator and MBPmoveNorth(stormPlot) or MBPmoveEast(stormPlot)
		end)
	end
	if bSpawn then
		MBPspawnStorms(MBPcancerOcean, math.ceil(iStormsSpawnedPerTurn * 0.75))
		MBPspawnStorms(MBPsouthernLakes, math.ceil(iStormsSpawnedPerTurn * 0.25))
	end
end

function MBPfall(bSpawn, bMove)
	print("Season: Fall")
	if bMove then
		MBPmoveStorms(function(stormPlot)
			return stormPlot:GetY() > iEquator and MBPmoveWest(stormPlot) or MBPmoveSouth(stormPlot)
		end)
	end
	if bSpawn then
		MBPspawnStorms(MBPcapricornOcean, math.ceil(iStormsSpawnedPerTurn * 0.75))
		MBPspawnStorms(MBPnorthernLakes, math.ceil(iStormsSpawnedPerTurn * 0.25))
	end
end

function MBPwinter(bSpawn, bMove)
	print("Season: Winter")
	if bMove then
		MBPmoveStorms(function(stormPlot)
			return stormPlot:GetY() > iEquator and MBPmoveSouth(stormPlot) or MBPmoveWest(stormPlot)
		end)
	end
	if bSpawn then
		MBPspawnStorms(MBParcticOcean, math.ceil(iStormsSpawnedPerTurn * 0.75))
		MBPspawnStorms(MBPcapricornLakes, math.ceil(iStormsSpawnedPerTurn * 0.25))
	end
end

function MBPspring(bSpawn, bMove)
	print("Season: Spring")
	if bMove then
		MBPmoveStorms(function(stormPlot)
			return stormPlot:GetY() > iEquator and MBPmoveEast(stormPlot) or MBPmoveNorth(stormPlot)
		end)
	end
	if bSpawn then
		MBPspawnStorms(MBPantarcticOcean, math.ceil(iStormsSpawnedPerTurn * 0.75))
		MBPspawnStorms(MBPcancerLakes, math.ceil(iStormsSpawnedPerTurn * 0.25))
	end
end

function MBPmoveNorth(stormPlot)
    local adjPlots = {}
    for _, dir in ipairs({DirectionTypes.DIRECTION_NORTHWEST, DirectionTypes.DIRECTION_NORTHEAST}) do
        local adjPlot = Map.PlotDirection(stormPlot:GetX(), stormPlot:GetY(), dir)
        if adjPlot and MBPcanStorm(adjPlot) then
            table.insert(adjPlots, adjPlot)
        end
    end
    return adjPlots
end

function MBPmoveSouth(stormPlot)
    local adjPlots = {}
    for _, dir in ipairs({DirectionTypes.DIRECTION_SOUTHWEST, DirectionTypes.DIRECTION_SOUTHEAST}) do
        local adjPlot = Map.PlotDirection(stormPlot:GetX(), stormPlot:GetY(), dir)
        if adjPlot and MBPcanStorm(adjPlot) then
            table.insert(adjPlots, adjPlot)
        end
    end
    return adjPlots
end

function MBPmoveEast(stormPlot)
    local adjPlots = {}
    for _, dir in ipairs({DirectionTypes.DIRECTION_NORTHEAST, DirectionTypes.DIRECTION_EAST, DirectionTypes.DIRECTION_SOUTHEAST}) do
        local adjPlot = Map.PlotDirection(stormPlot:GetX(), stormPlot:GetY(), dir)
        if adjPlot and MBPcanStorm(adjPlot) then
            table.insert(adjPlots, adjPlot)
        end
    end
    return adjPlots
end

function MBPmoveWest(stormPlot)
    local adjPlots = {}
    for _, dir in ipairs({DirectionTypes.DIRECTION_NORTHWEST, DirectionTypes.DIRECTION_WEST, DirectionTypes.DIRECTION_SOUTHWEST}) do
        local adjPlot = Map.PlotDirection(stormPlot:GetX(), stormPlot:GetY(), dir)
        if adjPlot and MBPcanStorm(adjPlot) then
            table.insert(adjPlots, adjPlot)
        end
    end
    return adjPlots
end