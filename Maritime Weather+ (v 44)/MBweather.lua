-----------------------------------------------
--Mod options, can be customized by user/player
-----------------------------------------------

local iStormUpdateFrequency = (4 - Game.GetGameSpeedType());
local iStormsSpawnedPerTurn = (Map.GetWorldSize() + Game.GetGameSpeedType() + Map.GetSeaLevel() + (5 - Map.GetClimate()) );
local iStormAdjacencySpawnProbability = (10 + Map.GetWorldSize() + Map.GetSeaLevel() + (4 - Map.GetClimate()));
local iSeasonLength = iStormUpdateFrequency * math.max(4, ( (Map.GetWorldSize() + 1) * (4 - Game.GetGameSpeedType()) + Map.GetClimate() + Map.GetSeaLevel() ) );
local iFreshWaterDespawnChance = 0;
local iCoastalDespawnChance = 5;
local iInlandDespawnChance = 15;
local iStuckDespawnChance = 34;

----------------------------------------------------------------------------
--Mod variables and constants (user/player should not change anything below)
----------------------------------------------------------------------------
--[[
local bModDLLstormsUnrevealWater = false;
local bModDLLstormsUnrevealLand = false;
local bVanillaStormsUnrevealWater = true;
local bVanillaStormsUnrevealLand = false;
--]]
local MBPcancerOcean = {};
local MBPcapricornOcean = {};
local MBParcticOcean = {};
local MBPantarcticOcean = {};
local MBPnorthernLakes = {};
local MBPsouthernLakes = {};
local MBPcancerLakes = {};
local MBPcapricornLakes = {};
local MBPstorms = {};
--local lastPlayerVisStorms = {};
local summerLakeSpawns;
local summerOceanSpawns;
local fallLakeSpawns;
local fallOceanSpawns;
local winterLakeSpawns;
local winterOceanSpawns;
local springLakeSpawns;
local springOceanSpawns;
local allStormSpawns;
local tWeatherFeature = GameInfoTypes.FEATURE_RESTRICTED_VISIBILITY;
local tWeatherLandFeature = GameInfoTypes.FEATURE_RESTRICTED_VISIBILITY_LAND;
local tFloodPlainsWeatherFeature = GameInfoTypes.FEATURE_FLOOD_PLAINS_STORM;
local tFloodPlainsFeature = GameInfoTypes.FEATURE_FLOOD_PLAINS;
local tAtollWeatherFeature = GameInfoTypes.FEATURE_ATOLL_STORM;
local tAtollFeature = GameInfoTypes.FEATURE_ATOLL;
--[[local tIceWeatherFeature = GameInfoTypes.FEATURE_ICE_STORM;
local tIceFeature = GameInfoTypes.FEATURE_ICE;
local tForestWeatherFeature = GameInfoTypes.FEATURE_FOREST_STORM;
local tForestFeature = GameInfoTypes.FEATURE_FOREST;
local tJungleWeatherFeature = GameInfoTypes.FEATURE_JUNGLE_STORM;
local tJungleFeature = GameInfoTypes.FEATURE_JUNGLE;--]]
local tStormImprovement = GameInfoTypes.IMPROVEMENT_STORM;
local tStormImprovementAnim = GameInfoTypes.IMPROVEMENT_STORM_ANIM;
local tOceanTerrain = GameInfoTypes.TERRAIN_OCEAN;
local tCoastTerrain = TerrainTypes.TERRAIN_COAST;
local tOceanCrossTech = GameInfoTypes.TECH_ASTRONOMY;
local cPolynesia = GameInfoTypes.CIVILIZATION_POLYNESIA;
local tAllWaterPromotion = GameInfoTypes.PROMOTION_ALLWATER_EMBARKATION;
local bOceanCrossFunctionAvailable;
local tSubmarine = GameInfoTypes.UNITCOMBAT_SUBMARINE;
local spawnScaler = 1;

local iW, iH = Map.GetGridSize();
local iCapricorn = math.floor(0.3 * iH);
local iCancer = math.ceil(0.7 * iH);
local iEquator = math.floor((0.5 * iH) + 0.5);

local iSnapshotModelCreateTypeID = nil;
local iAnimModelCreateTypeID = nil;
local iSViconTypeID = nil;
local tStormPromotion = GameInfoTypes.PROMOTION_WEATHERED;
local directions = {DirectionTypes.DIRECTION_NORTHWEST, DirectionTypes.DIRECTION_NORTHEAST, 
					DirectionTypes.DIRECTION_SOUTHWEST, DirectionTypes.DIRECTION_SOUTHEAST, 
					DirectionTypes.DIRECTION_EAST, DirectionTypes.DIRECTION_WEST};

local ResourceLayoutHandlers = {};
local SurveillanceCities = {};

----------------
--Initialization
----------------

function MBPfindAllSurveillanceCities()
	for iPlayer = 0, GameDefines.MAX_PLAYERS - 1 do
		local iTeam = Players[iPlayer]:GetTeam();
		MBPupdateSurveillanceTeams(iTeam);
	end
	for iPlayer = 0, GameDefines.MAX_PLAYERS - 1 do
		local pPlayer = Players[iPlayer];
		local iTeam = pPlayer:GetTeam();
		MBPupdateSurveillanceCities(iTeam, iPlayer, pPlayer)
	end
end

function MBPtestArtModel()
	MBPmapResourceLayoutHandlers();
	print("initializing search for storm art")
	local iActiveTeam = Game.GetActiveTeam();
	local snapshotPlaced = false;
	local snapshot2Placed = false;	
	local unitTestComplete = false;
	for i = 0, Map.GetNumPlots()-1, 1 do
		local pPlot = Map.GetPlotByIndex(i);
		-- lets find the IDs of the createTypes for the serialEvent
		if (not unitTestComplete) and (pPlot:GetNumUnits() == 0) then
			MBPOceanCrossFunctionAvailable();
			unitTestComplete = true;
		elseif (pPlot:IsVisible(iActiveTeam)) and (pPlot:GetImprovementType() == -1) and (pPlot:GetResourceType() == -1) and (not pPlot:IsOwned()) then
			if not snapshotPlaced then		--add improvement for snapshot identification
				print("placing snapshot improvement in test plot")
				MBPplaceStormImprovement(pPlot, true);
				snapshotPlaced = true;
			elseif not snapshot2Placed then		--add improvement for icon identification
				print("placing 2nd snapshot improvement in test plot")
				MBPplaceStormImprovement(pPlot, true);
				snapshot2Placed = true;
			else		--add improvement for anim identification and end the loop
				print("placing anim improvement in test plot")
				MBPplaceStormImprovement(pPlot, false);
				break;
			end
		end
	end
end

function MBPplaceStormImprovement(pPlot, bSnapshot)
	if bSnapshot then
		pPlot:SetImprovementType(tStormImprovement);
	else
		pPlot:SetImprovementType(tStormImprovementAnim);
	end
end

function MBPOceanCrossFunctionAvailable()
	local pPlayer = Players[63];
	local uUnit = pPlayer:InitUnit(83, 0, 0, 0, -1);
	bOceanCrossFunctionAvailable = (type(uUnit.CanCrossOceans) == "function")
	uUnit:Kill();
	print("unit ocean crossing checker function available: " .. tostring(bOceanCrossFunctionAvailable));
end

function MBPartInitialized()
	if iSnapshotModelCreateTypeID and iAnimModelCreateTypeID and iSViconTypeID then
		MBPplaceExistingStormArt();
	end
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
	MBPfindAllSurveillanceCities();
	for i = 0, Map.GetNumPlots()-1, 1 do
		local pPlot = Map.GetPlotByIndex(i);
		MBPlatitudeSorter(pPlot);
		local iFeatureType = pPlot:GetFeatureType();
		if MBPisStormFeature(iFeatureType) then
			table.insert(MBPstorms, pPlot);
		end
		--[[if iFeatureType == tIceWeatherFeature then
			pPlot:SetFeatureType(tIceFeature);
		end--]]
	end
	summerLakeSpawns = math.ceil(iStormsSpawnedPerTurn * (#MBPsouthernLakes/(#MBPsouthernLakes+#MBPcancerOcean)));
	summerOceanSpawns = math.ceil(iStormsSpawnedPerTurn * (#MBPcancerOcean/(#MBPsouthernLakes+#MBPcancerOcean)));
	fallLakeSpawns = math.ceil(iStormsSpawnedPerTurn * (#MBPnorthernLakes/(#MBPnorthernLakes+#MBPcapricornOcean)));
	fallOceanSpawns = math.ceil(iStormsSpawnedPerTurn * (#MBPcapricornOcean/(#MBPnorthernLakes+#MBPcapricornOcean)));
	winterLakeSpawns = math.ceil(iStormsSpawnedPerTurn * (#MBPcapricornLakes/(#MBPcapricornLakes+#MBParcticOcean)));
	winterOceanSpawns = math.ceil(iStormsSpawnedPerTurn * (#MBParcticOcean/(#MBPcapricornLakes+#MBParcticOcean)));
	springLakeSpawns = math.ceil(iStormsSpawnedPerTurn * (#MBPcancerLakes/(#MBPcancerLakes+#MBPantarcticOcean)));
	springOceanSpawns = math.ceil(iStormsSpawnedPerTurn * (#MBPantarcticOcean/(#MBPcancerLakes+#MBPantarcticOcean)));
	allStormSpawns = #MBPsouthernLakes + #MBPcancerOcean + #MBPnorthernLakes + #MBPcapricornOcean + #MBPcapricornLakes + #MBParcticOcean + #MBPcancerLakes + #MBPantarcticOcean;
end

function MBPplaceExistingStormArt()
	if (Game.GetGameTurn() == 0) and not (#MBPstorms > 0) then
		for i = 1, Map.GetWorldSize() + 1 do
			MBPsummer(true, false);
			MBPfall(true, false);
			MBPwinter(true, false);
			MBPspring(true, false);
		end
	else
		for _, stormPlot in pairs(MBPstorms) do
			--[[local iFeatureType = stormPlot:GetFeatureType();
			if iFeatureType == tIceFeature then
				stormPlot:SetFeatureType(tIceWeatherFeature);
			end--]]
			MBPstormArtDrawer(stormPlot);
		end
	end
end

-----------------------
--Weather spawn/despawn
-----------------------

function MBPstormSpawner(spawnPlot, bSpawnAdjacent, iFeatureType)
	--local iFeatureType = spawnPlot:GetFeatureType();
	if iFeatureType == -1 then
		if spawnPlot:IsWater() then
			spawnPlot:SetFeatureType(tWeatherFeature);
		else
			spawnPlot:SetFeatureType(tWeatherLandFeature);
		end
	elseif iFeatureType == tFloodPlainsFeature then
		spawnPlot:SetFeatureType(tFloodPlainsWeatherFeature);
	elseif iFeatureType == tAtollFeature then
		spawnPlot:SetFeatureType(tAtollWeatherFeature);
	--[[elseif iFeatureType == tIceFeature then
		spawnPlot:SetFeatureType(tIceWeatherFeature);
	elseif iFeatureType == tForestFeature then
		spawnPlot:SetFeatureType(tForestWeatherFeature);
		local hexPos = ToHexFromGrid({x = spawnPlot:GetX(), y = spawnPlot:GetY()})
		Events.SerialEventForestCreated(hexPos.x, hexPos.y)
	elseif iFeatureType == tJungleFeature then
		spawnPlot:SetFeatureType(tJungleWeatherFeature);
		local hexPos = ToHexFromGrid({x = spawnPlot:GetX(), y = spawnPlot:GetY()})
		Events.SerialEventJungleCreated(hexPos.x, hexPos.y)--]]
	end
	MBPstormArtDrawer(spawnPlot);
	MBPstorms[#MBPstorms + 1] = spawnPlot; -- Add storm to tracking table
	MBPstormPromotions(spawnPlot, true);
	MBPallPlayersVisFix(spawnPlot, 3, true, true);
	if bSpawnAdjacent then
		-- Recursive storm expansion
		for _, dir in ipairs(directions) do
			if Game.Rand(100, "Storm Adjacent Spawn") < iStormAdjacencySpawnProbability then
				local adjPlot = Map.PlotDirection(spawnPlot:GetX(), spawnPlot:GetY(), dir);
				if adjPlot then
					local iAdjFeature = adjPlot:GetFeatureType();
					if MBPcanStorm(adjPlot, iAdjFeature) then
						MBPstormSpawner(adjPlot, true, iAdjFeature)
					end
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
	if ResourceLayoutHandlers[ResourceType] == 0 then
		Events.SerialEventImprovementCreated(hexPos.x, hexPos.y, 1, 1, 63, iSnapshotModelCreateTypeID, -1, ResourceType, NumResource, nil);
	else
		Events.SerialEventImprovementCreated(hexPos.x, hexPos.y, 1, 1, 63, iAnimModelCreateTypeID, -1, ResourceType, NumResource, nil);
	end
end

function MBPstormArtRemover(pPlot)
	--print("MBPstormArtRemover called")
	local hexPos = ToHexFromGrid({x = pPlot:GetX(), y = pPlot:GetY()})
	--print("calling destroyed event")
	Events.SerialEventImprovementIconDestroyed(hexPos.x, hexPos.y)
	Events.SerialEventImprovementDestroyed(hexPos.x, hexPos.y)
end

function MBPstormDespawner(despawnPlot, iFeatureType)
	--local iFeatureType = despawnPlot:GetFeatureType();
	if (iFeatureType == tWeatherFeature) or (iFeatureType == tWeatherLandFeature) then
		despawnPlot:SetFeatureType(-1);
	elseif iFeatureType == tFloodPlainsWeatherFeature then
		despawnPlot:SetFeatureType(tFloodPlainsFeature);
	elseif iFeatureType == tAtollWeatherFeature then
		despawnPlot:SetFeatureType(tAtollFeature);
	--[[elseif iFeatureType == tIceWeatherFeature then
		despawnPlot:SetFeatureType(tIceFeature);
	elseif iFeatureType == tForestWeatherFeature then
		despawnPlot:SetFeatureType(tForestFeature);
	elseif iFeatureType == tJungleWeatherFeature then
		despawnPlot:SetFeatureType(tJungleFeature);--]]
	end
	MBPstormArtRemover(despawnPlot)
	MBPstormPromotions(despawnPlot, false)
	MBPallPlayersVisFix(despawnPlot, 3, false, false);
end

function MBPspawnStorms(regionTable, spawnCount)
	local count = 0
	local adjustedSpawn = math.ceil(spawnScaler*spawnCount);
	--print("Spawn table contains " .. #regionTable .. " candidates");
	--print("Spawning up to " .. adjustedSpawn .. " storms");
	while count < adjustedSpawn and count < #regionTable do
		local index = Game.Rand(#regionTable, "Select Storm Spawn Plot") + 1
		local plot = regionTable[index]
		local iFeatureType = plot:GetFeatureType();
		if MBPcanStorm(plot, iFeatureType) then
			MBPstormSpawner(plot, true, iFeatureType) -- Spawning storms should have adjacent spawns
		end
		count = count + 1
	end
end

---------------
--Plot checkers
---------------

function MBPcanStorm(pStormCandi, iPlotFeature)
	if not pStormCandi then return false end
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
	--local iPlotFeature = pStormCandi:GetFeatureType();
	local bFeatureEligibility =	(iPlotFeature == -1) or 
								(iPlotFeature == tFloodPlainsFeature) or 
								(iPlotFeature == tAtollFeature) or 
								--[[(iPlotFeature == tForestFeature) or 
								(iPlotFeature == tJungleFeature) or 
								(iPlotFeature == tIceFeature) or --]]
								(iPlotFeature == GameInfoTypes.FEATURE_COASTAL)  or 
								(iPlotFeature == GameInfoTypes.FEATURE_SUBLITTORAL) or 
								(iPlotFeature == GameInfoTypes.FEATURE_SAFE_WATERS) or 
								pStormCandi:IsLake();
	local bImprovementEligibility = pStormCandi:GetImprovementType() == -1;
	--local bResourceEligibility = pStormCandi:GetNumResource() < 1;
	return bValidTerrain and bFeatureEligibility and bImprovementEligibility;
end

function MBPisStormImprovement(pPlot, bSnapshot)
	if bSnapshot then
		return (pPlot:GetImprovementType() == tStormImprovement);
	else
		return (pPlot:GetImprovementType() == tStormImprovementAnim);
	end
end

-----------------
--Season handlers
-----------------

function MBPsummer(bSpawn, bMove)
	print("Season: Summer")
	if bMove then
		MBPmoveStorms(function(stormPlot)
			return stormPlot:GetY() > iEquator and MBPmoveNorth(stormPlot) or MBPmoveEast(stormPlot)
		end)
	end
	if bSpawn then
		MBPspawnStorms(MBPcancerOcean, summerOceanSpawns)
		MBPspawnStorms(MBPsouthernLakes, summerLakeSpawns)
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
		MBPspawnStorms(MBPcapricornOcean, fallOceanSpawns)
		MBPspawnStorms(MBPnorthernLakes, fallLakeSpawns)
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
		MBPspawnStorms(MBParcticOcean, winterOceanSpawns)
		MBPspawnStorms(MBPcapricornLakes, winterLakeSpawns)
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
		MBPspawnStorms(MBPantarcticOcean, springOceanSpawns)
		MBPspawnStorms(MBPcancerLakes, springLakeSpawns)
	end
end

----------------
--Weather movers
----------------

function MBPmoveStorms(moveFunction)
	--print("MBPmoveStorms called")
	local currentStorms = MBPstorms;
	MBPstorms = {};
	for i, stormPlot in pairs(currentStorms) do -- Use pairs to handle nil values
		-- Verify storm still exists before processing
		local iFeatureType = stormPlot:GetFeatureType();
		if not MBPisStormFeature(iFeatureType) then
			MBPstormDespawner(stormPlot, iFeatureType)
		else
			local bDespawned = false;
			if not stormPlot:IsWater() then
				if stormPlot:IsFreshWater() then
					if Game.Rand(100, "Storm Despawn") < iFreshWaterDespawnChance then
						MBPstormDespawner(stormPlot, iFeatureType);
						bDespawned = true;
					end
				elseif stormPlot:IsCoastalLand() then
					if Game.Rand(100, "Storm Despawn") < iCoastalDespawnChance then
						MBPstormDespawner(stormPlot, iFeatureType);
						bDespawned = true;
					end
				else
					if Game.Rand(100, "Storm Despawn") < iInlandDespawnChance then
						MBPstormDespawner(stormPlot, iFeatureType);
						bDespawned = true;
					end
				end
			end
			if not bDespawned then
				--print("storm is not despawned, moving...");
				local adjPlots = moveFunction(stormPlot)
				local bMoved = false;
				while #adjPlots > 0 do
					local adjIndex = Game.Rand(#adjPlots, "Storm Movement") + 1
					local adjPlot = adjPlots[adjIndex];
					local iAdjFeatureType = adjPlot:GetFeatureType();
					if MBPcanStorm(adjPlot, iAdjFeatureType) then
						MBPstormSpawner(adjPlot, false, iAdjFeatureType) -- Moving storms should not spawn adjacent ones
						MBPstormDespawner(stormPlot, iFeatureType)
						bMoved = true;
						break;
					else
						table.remove(adjPlots, adjIndex) -- If no valid move, keep the storm in place
					end
				end
				if not bMoved then
					if Game.Rand(100, "Storm Despawn") < iStuckDespawnChance then
						MBPstormDespawner(stormPlot, iFeatureType)
					else
						MBPstorms[#MBPstorms + 1] = stormPlot
					end
				end
			end
		end
	end
end

function MBPmoveNorth(stormPlot)
    local adjPlots = {}
    for _, dir in ipairs({DirectionTypes.DIRECTION_NORTHWEST, DirectionTypes.DIRECTION_NORTHEAST}) do
        local adjPlot = Map.PlotDirection(stormPlot:GetX(), stormPlot:GetY(), dir)
        if adjPlot then
            table.insert(adjPlots, adjPlot)
        end
    end
    return adjPlots
end

function MBPmoveSouth(stormPlot)
    local adjPlots = {}
    for _, dir in ipairs({DirectionTypes.DIRECTION_SOUTHWEST, DirectionTypes.DIRECTION_SOUTHEAST}) do
        local adjPlot = Map.PlotDirection(stormPlot:GetX(), stormPlot:GetY(), dir)
        if adjPlot then
            table.insert(adjPlots, adjPlot)
        end
    end
    return adjPlots
end

function MBPmoveEast(stormPlot)
    local adjPlots = {}
    for _, dir in ipairs({DirectionTypes.DIRECTION_NORTHEAST, DirectionTypes.DIRECTION_EAST, DirectionTypes.DIRECTION_SOUTHEAST}) do
        local adjPlot = Map.PlotDirection(stormPlot:GetX(), stormPlot:GetY(), dir)
        if adjPlot then
            table.insert(adjPlots, adjPlot)
        end
    end
    return adjPlots
end

function MBPmoveWest(stormPlot)
    local adjPlots = {}
    for _, dir in ipairs({DirectionTypes.DIRECTION_NORTHWEST, DirectionTypes.DIRECTION_WEST, DirectionTypes.DIRECTION_SOUTHWEST}) do
        local adjPlot = Map.PlotDirection(stormPlot:GetX(), stormPlot:GetY(), dir)
        if adjPlot then
            table.insert(adjPlots, adjPlot)
        end
    end
    return adjPlots
end

-----------------
--Helpers & utils
-----------------

function MBPupdateSurveillanceTeams(iTeam)
	SurveillanceCities[iTeam] = {};
end

function MBPupdateSurveillanceCities(iTeam, iPlayer, pPlayer)
	SurveillanceCities[iTeam][iPlayer] = {};
	for k, v in pairs(pPlayer:GetEspionageSpies()) do
		--if v.EstablishedSurveillance then
			local pPlot = Map.GetPlot(v.CityX, v.CityY);
			if pPlot then
				local cCity = pPlot:GetPlotCity();
				if cCity then
					table.insert(SurveillanceCities[iTeam][iPlayer], cCity);
				end
			end
		--end
	end
end

function MBPlatitudeSorter(pPlot)
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
end

function MBPisStormFeature(iFeatureType)
	return	(iFeatureType == tFloodPlainsWeatherFeature) or 
			(iFeatureType == tWeatherFeature) or 
			(iFeatureType == tWeatherLandFeature) or 
			(iFeatureType == tAtollWeatherFeature)--[[ or 
			(iFeatureType == tForestWeatherFeature) or 
			(iFeatureType == tJungleWeatherFeature) or 
			(iFeatureType == tIceWeatherFeature)--]];
end

function MBPspawnScaler()
	spawnScaler = math.max(0, ((allStormSpawns - #MBPstorms)/allStormSpawns));
end

function MBPgetPrevPlayer(iPlayer)
	local prevPlayer = iPlayer - 1;
	if prevPlayer < 0 then
		prevPlayer = 63
	end
	while (not Players[prevPlayer]:IsAlive()) do
		prevPlayer = prevPlayer - 1;
		if prevPlayer < 0 then
			prevPlayer = 63
		end
	end
	return prevPlayer;
end

function MBPgetStormUpdateFrequency()
	return iStormUpdateFrequency;
end

function MBPgetSeason()
	local iTurn = Game.GetGameTurn();
	return math.fmod(math.floor(iTurn/(iSeasonLength+(2*Game.GetCurrentEra()))), 4);
end

function MBPplotRingIterator(pPlot, r)
	local hex = ToHexFromGrid({x=pPlot:GetX(), y=pPlot:GetY()})
	local x, y = hex.x, hex.y

	local function north(x, y, r, i) return {x=x-r+i, y=y+r} end
	local function northeast(x, y, r, i) return {x=x+i, y=y+r-i} end
	local function southeast(x, y, r, i) return {x=x+r, y=y-i} end
	local function south(x, y, r, i) return {x=x+r-i, y=y-r} end
	local function southwest(x, y, r, i) return {x=x-i, y=y-r+i} end
	local function northwest(x, y, r, i) return {x=x-r, y=y+i} end
	local sides = {north, northeast, southeast, south, southwest, northwest}

	-- This coroutine walks the edges of the hex centered on pPlot at radius r
	local next = coroutine.create(function ()
		for _, side in ipairs(sides) do
			for i=0, r-1, 1 do
				coroutine.yield(side(x, y, r, i))
			end
		end

		return nil
	end)

	-- This function returns the next edge plot in the sequence, ignoring those that fall off the edges of the map
	return function ()
		local pEdgePlot = nil
		local _, hex = coroutine.resume(next)

		while (hex ~= nil and pEdgePlot == nil) do
			pEdgePlot = Map.GetPlot(ToGridFromHex(hex.x, hex.y))
			if (pEdgePlot == nil) then _, hex = coroutine.resume(next) end
		end

		return pEdgePlot
	end
end
--[[
function MBPisFriendlyUnitAdjacent(iTeam, pPlot)
	local iX = pPlot:GetX();
	local iY = pPlot:GetY();
	for loop, direction in ipairs(directions) do
		local adjPlot = Map.PlotDirection(iX, iY, direction);
		if adjPlot then
			local uUnit = adjPlot:GetUnit(0);
			if uUnit then
				local iAdjUnitTeam = uUnit:GetTeam();
				if iAdjUnitTeam == iTeam then
					return true
				end
			end
		end
	end
end

function MBPisFoggable(iPlayer, iTeam, pPlot)
	if not pPlot:IsAdjacentNonvisible(iTeam) then
	elseif (#Players[iPlayer]:GetInternationalTradeRoutePlotToolTip(pPlot) > 0) then
	elseif MBPisFriendlyUnitAdjacent(iTeam, pPlot) then
	elseif pPlot:IsWater() then
		if ((bModDLLstormsUnrevealWater and bOceanCrossFunctionAvailable) or (bVanillaStormsUnrevealWater and not bOceanCrossFunctionAvailable)) and not pPlot:IsAdjacentToLand() then
			return true;
		end
	else
		if ((bModDLLstormsUnrevealLand and bOceanCrossFunctionAvailable) or (bVanillaStormsUnrevealLand and not bOceanCrossFunctionAvailable)) and not (pPlot:IsCity() or pPlot:IsCoastalLand()) then
			return true;
		end
	end
end

function MBPupdateFoW()
	if ((bModDLLstormsUnrevealWater and bOceanCrossFunctionAvailable) or (bVanillaStormsUnrevealWater and not bOceanCrossFunctionAvailable) or (bModDLLstormsUnrevealLand and bOceanCrossFunctionAvailable) or (bVanillaStormsUnrevealLand and not bOceanCrossFunctionAvailable)) then
		Game.UpdateFOW(true);
		UI:RequestMinimapBroadcast();
	end
end
--]]
-------------------
--Weather promoters
-------------------

function MBPstormPromotions(pPlot, bAdd)
	local numPlotUnits = pPlot:GetNumUnits();
	if numPlotUnits > 0 then
		for i = 0, numPlotUnits - 1 do
			local uUnit = pPlot:GetUnit(i);
			MBPstormPromotion(uUnit, bAdd);
			uUnit:SetMoves(uUnit:MaxMoves());
		end
	end
end

function MBPstormPromotion(uUnit, bAdd)
	if (uUnit:GetUnitCombatType() ~= tSubmarine) then
		uUnit:SetHasPromotion(tStormPromotion, bAdd);
	end
end

function MBPpromoAddRemoveOnMove(uUnit, pPlot)
	if MBPisStormFeature(pPlot:GetFeatureType()) then
		MBPstormPromotion(uUnit, true);
	elseif uUnit:IsHasPromotion(tStormPromotion) then
		MBPstormPromotion(uUnit, false);
	end
end

------------------------
--Bugfixes & workarounds
------------------------

function MBPstormFix(iPlayer)
	--print("MBPstormFixer activated");
	local pPlayer = Players[MBPgetPrevPlayer(iPlayer)];
	local tTeam = Teams[pPlayer:GetTeam()];
	if not tTeam:IsHasTech(tOceanCrossTech) and not (pPlayer:GetCivilizationType() == cPolynesia) then
		--print("MBPstormFixer: pre-astro player found");
		local pCapitalPlot = pPlayer:GetStartingPlot();
		if not pCapitalPlot then return end;
		local iCapitalX = pCapitalPlot:GetX();
		local iCapitalY = pCapitalPlot:GetY();
		for uUnit in pPlayer:Units() do
			local pPlot = uUnit:GetPlot();
			local bCanCrossOceans = uUnit:IsHasPromotion(tAllWaterPromotion);
			local iFeatureType = pPlot:GetFeatureType();
			if bOceanCrossFunctionAvailable then
				bCanCrossOceans = uUnit:CanCrossOceans();
			end
			if (pPlot:GetTerrainType() == tOceanTerrain) and MBPisStormFeature(iFeatureType) and not bCanCrossOceans then
				print("MBPstormFixer: invalid ocean unit found");
				while (pPlot:GetTerrainType() == tOceanTerrain) do
					local oceanMovePlot = nil;
					local coastMovePlot = nil;
					for loop, direction in ipairs(directions) do
						local adjPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), direction);
						if adjPlot then
							if (adjPlot:GetTerrainType() == tCoastTerrain) then
								if coastMovePlot == nil then
									coastMovePlot = adjPlot;
								elseif Map.PlotDistance(adjPlot:GetX(), adjPlot:GetY(), iCapitalX, iCapitalY) < Map.PlotDistance(coastMovePlot:GetX(), coastMovePlot:GetY(), iCapitalX, iCapitalY) then
									coastMovePlot = adjPlot;
								end
							elseif (adjPlot:GetTerrainType() == tOceanTerrain) then
								if oceanMovePlot == nil then
									oceanMovePlot = adjPlot;
								elseif Map.PlotDistance(adjPlot:GetX(), adjPlot:GetY(), iCapitalX, iCapitalY) < Map.PlotDistance(oceanMovePlot:GetX(), oceanMovePlot:GetY(), iCapitalX, iCapitalY) then
									oceanMovePlot = adjPlot;
								end
							end
						end
					end
					if coastMovePlot ~= nil then
						uUnit:SetXY(coastMovePlot:GetX(), coastMovePlot:GetY());
					else
						uUnit:SetXY(oceanMovePlot:GetX(), oceanMovePlot:GetY());
					end
					MBPstormDespawner(pPlot, iFeatureType);
					pPlot = uUnit:GetPlot();
				end
			end
		end
	end
end

function MBPplotsAdjVisFix(iPlayer, iTeam, pPlot, iRadius, bFeatureHillCoastalOnly, bUnrevealEligible)
	while iRadius > -1 do
		if iRadius > 1 then
			for pEdgePlot in MBPplotRingIterator(pPlot, iRadius) do
				if pEdgePlot and ((not bFeatureHillCoastalOnly) or ((pEdgePlot:GetFeatureType() > -1) or (pEdgePlot:IsHills()) or (pEdgePlot:IsCoastalLand()))) then
					MBPplotVisFix(iPlayer, iTeam, pEdgePlot, false);
				end
			end
		elseif iRadius == 1 then
			for _, dir in ipairs(directions) do
				local adjPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), dir);
				if adjPlot and ((not bFeatureHillCoastalOnly) or ((adjPlot:GetFeatureType() > -1) or (adjPlot:IsHills()) or (adjPlot:IsCoastalLand()))) then
					MBPplotVisFix(iPlayer, iTeam, adjPlot, false);
				end
			end
		else
			MBPplotVisFix(iPlayer, iTeam, pPlot, bUnrevealEligible);
		end
		iRadius = iRadius - 1;
	end
end

function MBPplotVisFix(iPlayer, iTeam, pPlot, bUnrevealEligible)
	if pPlot:IsVisible(iTeam) then
		if pPlot:IsBeingWorked() then
			if pPlot:IsFriendlyTerritory(iPlayer) then return end
			local workingCity = pPlot:GetWorkingCity();
			if workingCity then
				for _, survPlayer in pairs(SurveillanceCities[iTeam]) do
					for _, survCity in pairs(survPlayer) do
						if (survCity == workingCity) then return end
					end
				end
			end
		end
		local visCount = (pPlot:GetVisibilityCount(iTeam))
		local uUnit = pPlot:GetUnit(0);
		if (pPlot:GetTeam() == iTeam) or (pPlot:IsAdjacentTeam(iTeam, false)) or (uUnit and (uUnit:GetTeam() == iTeam)) then
			if visCount == 1 then
			elseif bOceanCrossFunctionAvailable then -- only run this if dll is modded, otherwise changeviscount is bugged in vanilla
				pPlot:ChangeVisibilityCount(iTeam, -1, -1, true, true);
			end
		else
			if bOceanCrossFunctionAvailable then -- only run this if dll is modded, otherwise changeviscount is bugged in vanilla
				pPlot:ChangeVisibilityCount(iTeam, -1, -1, true, true);
			end
			--[[if bUnrevealEligible then
				if MBPisFoggable(iPlayer, iTeam, pPlot) then
					pPlot:SetRevealed(iTeam, false);
					pPlot:UpdateFog();
					--pPlot:UpdateVisibility();
				end
			end--]]
		end
	end
end

function MBPallPlayersVisFix(pPlot, iRadius, bFeatureHillCoastalOnly, bUnrevealEligible)
	for iPlayer = 0, GameDefines.MAX_PLAYERS - 1 do
		local pPlayer = Players[iPlayer];
		if pPlayer:IsAlive() then
			MBPplotsAdjVisFix(iPlayer, pPlayer:GetTeam(), pPlot, iRadius, bFeatureHillCoastalOnly, bUnrevealEligible);
		end
	end
end
--[[
function MBPturnVisFixer(iPlayer, iTeam, bPreTurn)
	local stormTable;
	if bPreTurn then
		stormTable = MBPstorms;
	else
		stormTable = lastPlayerVisStorms;
		lastPlayerVisStorms = {};
	end
	for i, stormPlot in pairs(stormTable) do
		if stormPlot:IsVisible(iTeam) then
			if bPreTurn then
				MBPplotsAdjVisFix(iPlayer, iTeam, stormPlot, 0, false, false);
				table.insert(lastPlayerVisStorms, stormPlot);
			else
				MBPplotsAdjVisFix(iPlayer, iTeam, stormPlot, 0, false, true);
			end
		end
	end
	if bPreturn then
		MBPupdateFoW();
	end
end--]]