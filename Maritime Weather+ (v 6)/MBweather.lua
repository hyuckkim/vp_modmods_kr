--how often storms move and spawn -- set this to 1 for spawn every turn regardless of game settings
local iStormUpdateFrequency = (4 - Game.GetGameSpeedType());
local iStormsSpawnedPerTurn = (Map.GetWorldSize() + Game.GetGameSpeedType() + Map.GetSeaLevel() + (5 - Map.GetClimate()) );
local iStormAdjacencySpawnProbability = (10 + Map.GetWorldSize() + Map.GetSeaLevel() + (4 - Map.GetClimate()));
local iSeasonLength = iStormUpdateFrequency * (math.max(4, ((Map.GetWorldSize() + 1) * (4 - Game.GetGameSpeedType()) + Map.GetClimate() + Map.GetSeaLevel())));
local iFreshWaterDespawnChance = 0;
local iCoastalDespawnChance = 5;
local iInlandDespawnChance = 15;
local iStuckDespawnChance = 34;
local iRoadPillageChance = nil;

local MBPcancerOcean = {};
local MBPcapricornOcean = {};
local MBParcticOcean = {};
local MBPantarcticOcean = {};
local MBPnorthernLakes = {};
local MBPsouthernLakes = {};
local MBPcancerLakes = {};
local MBPcapricornLakes = {};
local MBPstorms = {};
local MBPinit = false;
local tWeatherFeature = GameInfoTypes.FEATURE_RESTRICTED_VISIBILITY;
local tIceFeature = GameInfoTypes.FEATURE_ICE;
local tStormImprovement = GameInfoTypes.IMPROVEMENT_STORM;
local tNoFeature = FeatureTypes.NO_FEATURE;

local iW, iH = Map.GetGridSize();
local iCapricorn = math.floor(0.3 * iH);
local iCancer = math.ceil(0.7 * iH);
local iEquator = math.floor((0.5 * iH) + 0.5);

function MBPgetStormUpdateFrequency()
	return iStormUpdateFrequency;
end

function MBPgetSeason()
	local iTurn = Game.GetGameTurn();
	return math.fmod(math.floor(iTurn/iSeasonLength), 4);
end

function MBPwaterCounter()
	for i = 0, Map.GetNumPlots()-1, 1 do
		local pPlot = Map.GetPlotByIndex(i);
		local iLatitude = pPlot:GetY();
		if pPlot:IsTerrainOcean() then
			if iLatitude > iCancer then
				--if pPlot:IsAdjacentToFeature(tIceFeature) then
					table.insert(MBParcticOcean, pPlot);
				--end
			elseif iLatitude > iEquator then
				table.insert(MBPcancerOcean, pPlot);
			elseif iLatitude > iCapricorn then
				table.insert(MBPcapricornOcean, pPlot);
			else
				--if pPlot:IsAdjacentToFeature(tIceFeature) then
					table.insert(MBPantarcticOcean, pPlot);
				--end
			end
		elseif pPlot:IsFeatureLake() then
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
		local plotFeature = pPlot:GetFeatureType();
		if (plotFeature == tWeatherFeature) then
			table.insert(MBPstorms, pPlot);
		end
	end
	MBPinit = true;
end

function MBPstormSpawner(spawnPlot, bSpawnAdjacent)
	spawnPlot:SetImprovementType(tStormImprovement)
	spawnPlot:SetFeatureType(tWeatherFeature)
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

function MBPstormDespawner(despawnPlot, index)
	if despawnPlot:GetImprovementType() == tStormImprovement then
		despawnPlot:SetImprovementType(-1)
	end
	if despawnPlot:GetFeatureType() == tWeatherFeature then
		despawnPlot:SetFeatureType(-1)
	end
end

function MBPspawnStorms(regionTable, spawnCount)
	print("MBPspawnStorms called")
	local count = 0
	while #regionTable > 0 and count < spawnCount do
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
	local bFeatureEligibility = (iPlotFeature == -1) or pStormCandi:IsFeatureLake() or (iPlotFeature == GameInfoTypes.FEATURE_COASTAL)  or (iPlotFeature == GameInfoTypes.FEATURE_SUBLITTORAL) or (iPlotFeature == GameInfoTypes.FEATURE_SAFE_WATERS);
	local bImprovementEligibility = pStormCandi:GetImprovementType() == -1;
	--local bResourceEligibility = pStormCandi:GetNumResource() < 1;
	return bValidTerrain and bFeatureEligibility and bImprovementEligibility;
end

function MBPmoveStorms(moveFunction)
	print("MBPmoveStorms called")
	local currentStorms = MBPstorms;
	MBPstorms = {};
	for i, stormPlot in pairs(currentStorms) do -- Use pairs to handle nil values
		-- Verify storm still exists before processing
		if stormPlot:GetImprovementType() ~= tStormImprovement or stormPlot:GetFeatureType() ~= tWeatherFeature then
			MBPstormDespawner(stormPlot, i)
		elseif stormPlot:GetImprovementDuration() > 0 then
			local bDespawned = false;
			if not stormPlot:IsWater() then
				if stormPlot:IsFreshWater() then
					if Game.Rand(100, "Storm Despawn") < iFreshWaterDespawnChance then
						MBPstormDespawner(stormPlot, i);
						bDespawned = true;
					end
				elseif (stormPlot:IsAdjacentToTerrain(TerrainTypes.TERRAIN_COAST) or stormPlot:IsAdjacentToTerrain(TerrainTypes.TERRAIN_OCEAN)) then
					if Game.Rand(100, "Storm Despawn") < iCoastalDespawnChance then
						MBPstormDespawner(stormPlot, i);
						bDespawned = true;
					end
				else
					if Game.Rand(100, "Storm Despawn") < iInlandDespawnChance then
						MBPstormDespawner(stormPlot, i);
						bDespawned = true;
					end
				end
			end
			if not bDespawned and iRoadPillageChance and stormPlot:IsRoute() and not stormPlot:IsRoutePillaged() and not stormPlot:IsCity() then
				if Game.Rand(100, "Road pillage") < iRoadPillageChance then
					stormPlot:SetRoutePillaged(true);
					bDespawned = true;
					MBPsendPlotNotification("Washout", stormPlot);
				end
			end
			if not bDespawned then
				local adjPlots = moveFunction(stormPlot)
				local bMoved = false;
				while #adjPlots > 0 do
					local newPlot = adjPlots[Game.Rand(#adjPlots, "Storm Movement") + 1]
					if MBPcanStorm(newPlot) then
						MBPstormSpawner(newPlot, false) -- Moving storms should not spawn adjacent ones
						MBPstormDespawner(stormPlot, i)
						--newStorms[i] = newPlot
						bMoved = true;
						break;
					else
						table.remove(adjPlots, i) -- If no valid move, keep the storm in place
					end
				end
				if not bMoved then
					if Game.Rand(100, "Storm Despawn") < iStuckDespawnChance then
						MBPstormDespawner(stormPlot, i)
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

function MBPsendPlotNotification(ntype, plot)
	for iPlayer = 0, GameDefines.MAX_CIV_PLAYERS-1, 1 do
		local pPlayer = Players[iPlayer];
		if (pPlayer ~= nil and not pPlayer:IsMinorCiv() and not pPlayer:IsBarbarian() and pPlayer:IsHuman() and plot:IsVisible(pPlayer:GetTeam(), false)) then
			if (ntype == "Washout") then
				plot:AddPopupMessage(Locale.ConvertTextKey("TXT_KEY_CIV5_WASHOUT"), 0, iPlayer);
			end
		end
	end
end