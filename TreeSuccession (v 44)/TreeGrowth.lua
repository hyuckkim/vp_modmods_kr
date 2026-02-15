-- TreeGrowth
-- Author: Bhruic, FiresForever, Tekamthi
-- DateCreated: 9/30/2010 10:36:21 AM
--------------------------------------------------------------

---------------------------------------
-- mod options, change these as desired
---------------------------------------
-- attempt to create a wildfire when the player chooses 'no intervention' choice for VP forest fire event.
-- Recommend also bFireOnPillagedWorkerForestJungleImprovements set to true
local bForestFireEventSpawnsWildfire = true;
-- plot eligibility for smoke/fire/successional growth
-- ...refers to city's worked plots, combines w/ other options below
local bTreeGrowthInWorkedPlots = true;
-- ...on resources:
local bTreeGrowthOnResources = false;
local bSmokeOnResources = true;
local bFireOnResources = false;
-- ...on pillaged, worker-built improvement (ie not GP-, archaeologist-, or unique-improvements):
local bTreeGrowthOnPillagedWorkerImprovements = false;
local bFireOnPillagedWorkerForestJungleImprovements = false;
-- how many smoke plots can a fire spawn per turn (assuming all adjacent plots are eligible)
local iMaxSmokePerTurn = 1;
-- turn timers
local iJungleGrowthTurnTime = 8;
local iForestGrowthTurnTime = 10;
local iBurnTurnTime = 6;
local iBurntTurnTime = 7;
--higher values increase tree growth/burn chance; these are just integers/multipliers (not %)
-- eg. Original TG mod frequency & TreeGrowth (VP) v1 = 3; TG VP v2 = 1
-- Do not set below zero, decimals okay
local iForestGrowthProbability = 3;
local iJungleGrowthProbability = 3;
-- frequency of spontaneous fire starting (not including spreading)
local iForestBurnProbability = 2;
local iJungleBurnProbability = 1;
--higher values increase chance; these are %
local iBurnFeatureRemovalProbability = 50;
local iBurnSpreadProbability = 5;
local iSmokeSpawnProbability = 100;
local iSmokeDisperseProbability = 30;
local iSmokeMoveProbability = 40;
-- set to nil to disable fire pillage check:
local iFirePillageAdjacentProbability = nil;

--------------------------------------------
-- mod constants, do not edit anything below
--------------------------------------------
local g_TreeCount = 0;
local tForestImprovement = GameInfoTypes.IMPROVEMENT_YOUNG_FOREST;
local tJungleImprovement = GameInfoTypes.IMPROVEMENT_TROPICAL_VEG;
local tFireImprovement = GameInfoTypes.IMPROVEMENT_WILDFIRE;
local tSmokeImprovement = GameInfoTypes.IMPROVEMENT_SMOKE;
local tSmokeFeatureRough = GameInfoTypes.FEATURE_SMOKE2;
local tSmokeFeature = GameInfoTypes.FEATURE_SMOKE;
local tBurntImprovement = GameInfoTypes.IMPROVEMENT_BURNT;
local iFirePromo = GameInfoTypes.PROMOTION_WILDFIRE;
local iSmokePromo = GameInfoTypes.PROMOTION_SMOKE;

local TGburnableImprovements =	{GameInfoTypes.IMPROVEMENT_FARM, 
								GameInfoTypes.IMPROVEMENT_MINE,
								GameInfoTypes.IMPROVEMENT_QUARRY,
								GameInfoTypes.IMPROVEMENT_PASTURE,
								GameInfoTypes.IMPROVEMENT_TRADING_POST,
								GameInfoTypes.IMPROVEMENT_PLANTATION,
								GameInfoTypes.IMPROVEMENT_CAMP,
								GameInfoTypes.IMPROVEMENT_WELL,
								GameInfoTypes.IMPROVEMENT_LUMBERMILL};

local TGimprovementPlots = {};
local TGburnPlots = {};
local TGsmokePlots = {};
local TGburntPlots = {};
local TGinitialized = false;

function doesForestFireEventSpawnsWildfire()
	return bForestFireEventSpawnsWildfire;
end

function allowFireOnPillagedWorkerForestJungleImprovements()
	return bFireOnPillagedWorkerForestJungleImprovements;
end

function GetPlayer()
	local iPlayerID = Game.GetActivePlayer();
	if (iPlayerID < 0) then
		print("Error - player index not correct");
		return nil;
	end

	if (not Players[iPlayerID]:IsHuman()) then
		return nil;
	end;

	return Players[iPlayerID];
end

-- Checks if tile is a valid location for a forest

function IsValidForestTile(plot)
	local plotType = plot:GetPlotType();
	local terrainType = plot:GetTerrainType();
	local featureType = plot:GetFeatureType();
	local improvementType = plot:GetImprovementType();
	local resourceType = plot:GetResourceType(-1);
	local bPillagedImprovement = plot:IsImprovementPillaged();
	
	if (plotType == PlotTypes.PLOT_MOUNTAIN) then
		return false;
	elseif (plotType == PlotTypes.PLOT_OCEAN) then
		return false;
	elseif plot:IsCity() then
		return false;
	elseif plot:IsBeingWorked() and not bTreeGrowthInWorkedPlots then
		return false;
	elseif (improvementType ~= -1) and not (bTreeGrowthOnPillagedWorkerImprovements and bPillagedImprovement and isWorkerImprovement(improvementType)) then
		return false;
	elseif (featureType ~= FeatureTypes.NO_FEATURE) and (featureType ~= FeatureTypes.FEATURE_RIVER) then
		return false;
	elseif (resourceType == -1) or bTreeGrowthOnResources then
		for i = 0, plot:GetNumUnits() - 1 do
			local uUnit = plot:GetUnit(i);
			if (uUnit:GetUnitClassType() == GameInfo.UnitClasses.UNITCLASS_WORKER.ID) then
				local tBuild = uUnit:GetBuildType();
				if not ((tBuild == nil) or (tBuild == -1)) then
					return false;
				end
			end
		end
		if (terrainType == TerrainTypes.TERRAIN_GRASS) or (terrainType == TerrainTypes.TERRAIN_PLAINS) or (terrainType == TerrainTypes.TERRAIN_TUNDRA) then
			return true;
		end
	end

	return false;
end

-- Main Tree Expansion function

function TreeGrowth(plots)
	local firstRingYIsEven = {{0, 1}, {1, 0}, {0, -1}, {-1, -1}, {-1, 0}, {-1, 1}}
	local firstRingYIsOdd = {{1, 1}, {1, 0}, {1, -1}, {0, -1}, {-1, 0}, {0, 1}};
	local plot = plots;
	local iW, iH = Map.GetGridSize();
	local x, y;
	local search_table = {};
		
	-- lets first find out if the plot is acceptable for growth	
		if IsValidForestTile(plot) then
			x = plot:GetX();
			y = plot:GetY();

			local isEvenY = true;
			if y % 2 > 0 then
				isEvenY = false;
			end

			if isEvenY then
				search_table = firstRingYIsEven;
			else
				search_table = firstRingYIsOdd;
			end

			for plotAdjacentLoop, plot_adjustments in ipairs(search_table) do
				local searchX = x + plot_adjustments[1];
				local searchY = y + plot_adjustments[2];

				if searchX >= 0 and searchX < iW and searchY >= 0 and searchY < iH then
					local plotAdjacent = Map.GetPlot(searchX, searchY);
					local runOnce = false;
					
					-- if plot does not have an adjecent forest we dont want it growing a forest
					if (plotAdjacent:GetFeatureType() == FeatureTypes.FEATURE_FOREST) and not runOnce then
						local info = GameInfo.GameSpeeds[Game.GetGameSpeedType()];
						local world = GameInfo.Worlds[Map.GetWorldSize()];

						local base = (1500/iForestGrowthProbability) * (info.GrowthPercent / 100) * (world.ResearchPercent / 100);

						local diceroll = Map.Rand(base, "TreeGrowth - Randomized percentage chance of new Forest");
						if diceroll < 1 then
							plot:SetImprovementType(tForestImprovement);
							table.insert(TGimprovementPlots, plot);
							print("New Forest located at x:", x, " y:", y, " - base chance 1/", base);
							g_TreeCount = g_TreeCount + 1;
							return "Forest"
						end
						runOnce = true;
					elseif (plotAdjacent:GetFeatureType() == FeatureTypes.FEATURE_JUNGLE) and not runOnce then
					-- if the plot will not accept a forest then lets check for jungle instead
						local info = GameInfo.GameSpeeds[Game.GetGameSpeedType()];
						local world = GameInfo.Worlds[Map.GetWorldSize()];

						local base = (1500/iJungleGrowthProbability) * (info.GrowthPercent / 100) * (world.ResearchPercent / 100);

						local diceroll = Map.Rand(base, "TreeGrowth - Randomized percentage chance of new Jungle");
						if diceroll < 1 then
							plot:SetImprovementType(tJungleImprovement);
							table.insert(TGimprovementPlots, plot);
							print("New Jungle located at x:", x, " y:", y, " - base chance 1/", base);
							g_TreeCount = g_TreeCount + 1;
							return "Jungle"
						end
						runOnce = true;
					end
				end
			end
		end
	return "no_event"
end

function sendPlotNotification(ntype, plot)
	for iPlayer = 0, GameDefines.MAX_CIV_PLAYERS-1, 1 do
		local pPlayer = Players[iPlayer];
		if (pPlayer ~= nil and not pPlayer:IsMinorCiv() and not pPlayer:IsBarbarian() and pPlayer:IsHuman() and plot:IsVisible(pPlayer:GetTeam(), false)) then
			if (ntype == "Forest") then
				plot:AddPopupMessage(Locale.ConvertTextKey("TXT_KEY_CIV5_SUCCESSIONAL_VEGETATION"), 0, iPlayer);
			elseif (ntype == "Jungle") then
				plot:AddPopupMessage(Locale.ConvertTextKey("TXT_KEY_CIV5_SUCCESSIONAL_VEGETATION"), 0, iPlayer);
			elseif (ntype == "GrowForest") then
				plot:AddPopupMessage(Locale.ConvertTextKey("TXT_KEY_CIV5_IMPROVEMENT_GROW_FOREST"), 0, iPlayer);
			elseif (ntype == "GrowJungle") then
				plot:AddPopupMessage(Locale.ConvertTextKey("TXT_KEY_CIV5_IMPROVEMENT_GROW_JUNGLE"), 0, iPlayer);
			elseif (ntype == "Wildfire") then
				plot:AddPopupMessage(Locale.ConvertTextKey("TXT_KEY_CIV5_IMPROVEMENT_WILDFIRE"), 0, iPlayer);
			elseif (ntype == "RemoveForest") then
				plot:AddPopupMessage(Locale.ConvertTextKey("TXT_KEY_CIV5_BURN_FOREST"), 0, iPlayer);
			elseif (ntype == "FirePillage") then
				plot:AddPopupMessage(Locale.ConvertTextKey("TXT_KEY_CIV5_FIRE_PILLAGE"), 0, iPlayer);
			end
		end
	end
end

function plotEvents()
	local plot;
	local iW, iH = Map.GetGridSize();
	local x, y;
	local i = 0
	local forestCandidates = {}
	local ntype

	for plotLoop = 0, Map.GetNumPlots() - 1, 1 do
		plot = Map.GetPlotByIndex(plotLoop);	
		-- run Tree Growth
		ntype = TreeGrowth(plot)
		
		-- Check for and add growth notification or if no growth, check for fire spawn
		if (ntype == "no_event") then
			if canBurn(plot) then
				if (plot:GetFeatureType() == FeatureTypes.FEATURE_JUNGLE) then
					local info = GameInfo.GameSpeeds[Game.GetGameSpeedType()];
					local world = GameInfo.Worlds[Map.GetWorldSize()];
					local base = (1500/iJungleBurnProbability) * (info.GrowthPercent / 100) * (world.ResearchPercent / 100);
					local diceroll = Map.Rand(base, "TreeGrowth - Randomized percentage chance of burn Jungle");
					if diceroll < 1 then
						setBurnPlot(plot);
						print("Burn Jungle");
					end
				elseif (plot:GetFeatureType() == FeatureTypes.FEATURE_FOREST) then
					local info = GameInfo.GameSpeeds[Game.GetGameSpeedType()];
					local world = GameInfo.Worlds[Map.GetWorldSize()];
					local base = (1500/iForestBurnProbability) * (info.GrowthPercent / 100) * (world.ResearchPercent / 100);
					local diceroll = Map.Rand(base, "TreeGrowth - Randomized percentage chance of burn Forest");
					if diceroll < 1 then
						setBurnPlot(plot);
						print("Burn Forest");
					end
				end
			end
		else
			sendPlotNotification(ntype, plot)
		end
		if not TGinitialized then
			if ((plot:GetImprovementType() == tForestImprovement) or (plot:GetImprovementType() == tJungleImprovement)) then
				table.insert(TGimprovementPlots, plot);
			elseif (plot:GetImprovementType() == tFireImprovement) then
				table.insert(TGburnPlots, plot);
			elseif (plot:GetImprovementType() == tSmokeImprovement) then
				table.insert(TGsmokePlots, plot);
			elseif (plot:GetImprovementType() == tBurntImprovement) then
				table.insert(TGburntPlots, plot);
			end
		end
	end
	TGinitialized = true;
	-- check known smoke plots
	for tableIndex, tgPlot in pairs(TGsmokePlots) do
		if tgPlot ~= nil then
			if (tgPlot:GetImprovementType() == tSmokeImprovement) then
				if (tgPlot:GetImprovementDuration() > 0) then
					local bFireAdjacent = false;
					local smokeCandis = {};
					for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
						local pAdjacentPlot = Map.PlotDirection(tgPlot:GetX(), tgPlot:GetY(), direction);
						local improvementType = pAdjacentPlot:GetImprovementType();
						if (improvementType == nil) then
						elseif (improvementType == tFireImprovement) then
							bFireAdjacent = true;
						elseif canSmoke(pAdjacentPlot) then 
							table.insert(smokeCandis, pAdjacentPlot);
						end
					end
					local disperseRoll = Map.Rand(100, "TreeGrowth - Randomized percentage chance of smoke dispersal");
					local moveRoll = Map.Rand(100, "TreeGrowth - Randomized percentage chance of smoke move");
					--check if smoke is adjacent to fire and if disperse chance exceeds smoke roll
					if not bFireAdjacent and iSmokeDisperseProbability > disperseRoll then
						removeSmokePlot(tgPlot, tableIndex);
					--check if smoke move chance exceeds smoke roll
					elseif iSmokeMoveProbability > moveRoll and #smokeCandis > 0 then
						local smokeMoveDir = Map.Rand(#smokeCandis, "TreeGrowth - Randomized selection of smoke move plot") + 1;
						setSmokePlot(smokeCandis[smokeMoveDir]);
						removeSmokePlot(tgPlot, tableIndex);
					end
				end
			elseif (tgPlot:GetFeatureType() == tSmokeFeature) or (tgPlot:GetFeatureType() == tSmokeFeatureRough) then
				tgPlot:SetFeatureType(FeatureTypes.NO_FEATURE, -1);
				TGsmokePlots[tableIndex] = nil;
				removeTGpromos(tgPlot, iSmokePromo)
			else
				TGsmokePlots[tableIndex] = nil;
				removeTGpromos(tgPlot, iSmokePromo)
			end
		end
	end
	-- check known early-successional growth plots
	for tableIndex, tgPlot in pairs(TGimprovementPlots) do
		if tgPlot ~= nil then
			if (tgPlot:GetImprovementType() == tForestImprovement) then
				if (tgPlot:GetImprovementDuration() >= iForestGrowthTurnTime) then
					tgPlot:SetImprovementType(GameInfoTypes.IMPROVEMENT_GROW_FOREST);
					sendPlotNotification("GrowForest", tgPlot);
					TGimprovementPlots[tableIndex] = nil;
				end
			elseif (tgPlot:GetImprovementType() == tJungleImprovement) then
				if (tgPlot:GetImprovementDuration() >= iJungleGrowthTurnTime) then
					tgPlot:SetImprovementType(GameInfoTypes.IMPROVEMENT_GROW_JUNGLE);
					sendPlotNotification("GrowJungle", tgPlot);
					TGimprovementPlots[tableIndex] = nil;
				end
			else
				TGimprovementPlots[tableIndex] = nil;
			end
		end
	end
	-- check known burn plots
	for tableIndex, tgPlot in pairs(TGburnPlots) do
		if tgPlot ~= nil then
			if (tgPlot:GetImprovementType() == tFireImprovement) then
				local iPlotBurnDuration = tgPlot:GetImprovementDuration();
				if (iPlotBurnDuration >= iBurnTurnTime) then
					removeBurnPlot(tgPlot, tableIndex);
				elseif (iPlotBurnDuration > 0) then
					local adjacentKindling = {};
					local adjacentSmokeCandi = {};
					for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
						local pAdjacentPlot = Map.PlotDirection(tgPlot:GetX(), tgPlot:GetY(), direction)
						if canBurn(pAdjacentPlot) then 
							table.insert(adjacentKindling, pAdjacentPlot);
						end
						if canSmoke(pAdjacentPlot) then
							table.insert(adjacentSmokeCandi, pAdjacentPlot);
						end
						if iFirePillageAdjacentProbability and isWorkerImprovement(pAdjacentPlot:GetImprovementType()) and not pAdjacentPlot:IsImprovementPillaged() then
							if iFirePillageAdjacentProbability > Map.Rand(100, "TreeGrowth - Randomized percentage chance of fire pillaging adjacent improvement") then
								pAdjacentPlot:SetImprovementPillaged(true);
								sendPlotNotification("FirePillage", pAdjacentPlot);
							end
						end
					end
					if #adjacentSmokeCandi > 0 and iSmokeSpawnProbability > 0 then
						local iSmokeSpawned = 0;
						while( iSmokeSpawned < iMaxSmokePerTurn ) and (0 < #adjacentSmokeCandi) do
							local iSmokePlot = Map.Rand(#adjacentSmokeCandi, "TreeGrowth - Randomized choice of plot to spread smoke to") + 1;
							if iSmokeSpawnProbability > Map.Rand(100, "TreeGrowth - Randomized percentage chance of smoke spread") then
								setSmokePlot(adjacentSmokeCandi[iSmokePlot]);
								iSmokeSpawned = iSmokeSpawned + 1;
							end
							table.remove(adjacentSmokeCandi, iSmokePlot);
						end
					end
					if #adjacentKindling > 0 and iBurnSpreadProbability > Map.Rand(100, "TreeGrowth - Randomized percentage chance of burning Forest/Jungle spread") then
						local iSpreadPlot = Map.Rand(#adjacentKindling, "TreeGrowth - Randomized choice of plot to spread fire to") + 1;
						if adjacentKindling[iSpreadPlot] ~= nil then
							setBurnPlot(adjacentKindling[iSpreadPlot]);
							print("Burn spread");
						end
					end
				end
			else
				TGburnPlots[tableIndex] = nil;
				removeTGpromos(tgPlot, iFirePromo)
			end
		end
	end
	-- check known burnt plots
	for tableIndex, tgPlot in pairs(TGburntPlots) do
		if tgPlot ~= nil then
			if (tgPlot:GetImprovementType() == tBurntImprovement) then
				
				if (tgPlot:GetImprovementDuration() >= iBurntTurnTime) then
					removeBurntPlot(tgPlot, tableIndex);
				end
			else
				TGburntPlots[tableIndex] = nil;
			end
		end
	end
end

function setSmokePlot(pSmoker)
	local featureType = pSmoker:GetFeatureType();
	local bTreePlot = (featureType == FeatureTypes.FEATURE_FOREST) or (featureType == FeatureTypes.FEATURE_JUNGLE);
	if not bTreePlot then
		local plotTerrain = pSmoker:GetTerrainType();
		local bRoughPlot = (plotTerrain == TerrainTypes.TERRAIN_DESERT) or (plotTerrain == TerrainTypes.TERRAIN_SNOW);
		if bRoughPlot then
			pSmoker:SetFeatureType(tSmokeFeatureRough);
		else
			pSmoker:SetFeatureType(tSmokeFeature);
		end
	end
	pSmoker:SetImprovementType(tSmokeImprovement);
	table.insert(TGsmokePlots, pSmoker);
	for i = 0, pSmoker:GetNumUnits() - 1 do
		local uUnit = pSmoker:GetUnit(i);
		if not uUnit:IsHasPromotion(iSmokePromo) then
			uUnit:SetHasPromotion(iSmokePromo, true);
		end
	end
end

function removeSmokePlot(pNoSmoke, iSmokeIndex)
	local featureType = pNoSmoke:GetFeatureType();
	local bTreePlot = (featureType == FeatureTypes.FEATURE_FOREST) or (featureType == FeatureTypes.FEATURE_JUNGLE);
	if not bTreePlot then
		pNoSmoke:SetFeatureType(FeatureTypes.NO_FEATURE, -1);
	end
	pNoSmoke:SetImprovementType(-1);
	TGsmokePlots[iSmokeIndex] = nil;
	removeTGpromos(pNoSmoke, iSmokePromo);
end

function canSmoke(pSmokeCandi)
	if pSmokeCandi:IsMountain() then
		return false;
	elseif pSmokeCandi:IsTerrainOcean() then
		return false;
	end
	local featureType = pSmokeCandi:GetFeatureType();
	if featureType ~= -1 and not ((featureType == FeatureTypes.FEATURE_FOREST) or (featureType == FeatureTypes.FEATURE_JUNGLE)) then
		return false;
	elseif pSmokeCandi:GetImprovementType() ~= -1 then
		return false;
	elseif pSmokeCandi:GetResourceType(-1) ~= -1 and not bSmokeOnResources then
		return false;
	end
	return true;
end

function setBurnPlot(pBurner)
	pBurner:SetImprovementType(tFireImprovement);
	table.insert(TGburnPlots, pBurner);
	sendPlotNotification("Wildfire", pBurner);
	for i = 0, pBurner:GetNumUnits() - 1 do
		local uUnit = pBurner:GetUnit(i);
		--[[if uUnit:IsHasPromotion(iSmokePromo) then
			uUnit:SetHasPromotion(iSmokePromo, false);
		end]]--
		if not uUnit:IsHasPromotion(iFirePromo) then
			uUnit:SetHasPromotion(iFirePromo, true);
		end
	end
end

function removeBurnPlot(pNoBurn, iBurnIndex)
	local bFireScar = false;
	if iBurnFeatureRemovalProbability > Map.Rand(100, "TreeGrowth - Randomized percentage chance of burnt Forest/Jungle removal") then
		pNoBurn:SetFeatureType(FeatureTypes.NO_FEATURE, -1);
		sendPlotNotification("RemoveForest", pNoBurn);
	else
		bFireScar = true;
	end
	
	pNoBurn:SetImprovementType(-1);
	TGburnPlots[iBurnIndex] = nil;
	
	if bFireScar then
		setBurntPlot(pNoBurn, true);
	elseif iSmokeSpawnProbability > Map.Rand(100, "TreeGrowth - Randomized chance of smoke after fire burns out") then
		setSmokePlot(pNoBurn);
	end
	
	removeTGpromos(pNoBurn, iFirePromo);
end

function setBurntPlot(pBurnt, bAddImprovement)
	if bAddImprovement then
		pBurnt:SetImprovementType(tBurntImprovement);
	end
	table.insert(TGburntPlots, pBurnt);
end

function removeBurntPlot(pRecovered, iBurntIndex)
	pRecovered:SetImprovementType(-1);
	TGburntPlots[iBurntIndex] = nil;
end

function removeTGpromos(pPlot, iPromotion)
	for i = 0, pPlot:GetNumUnits() - 1 do
		local uUnit = pPlot:GetUnit(i);
		if uUnit:IsHasPromotion(iPromotion) then
			uUnit:SetHasPromotion(iPromotion, false);
		end
	end
end

function canBurn(pBurnCandi)
	local featureType = pBurnCandi:GetFeatureType();
	if not ((featureType == FeatureTypes.FEATURE_FOREST) or (featureType == FeatureTypes.FEATURE_JUNGLE)) then
		return false;
	end
	local improvementType = pBurnCandi:GetImprovementType();
	local bPillagedImprovement = pBurnCandi:IsImprovementPillaged();
	if (improvementType ~= -1) and not (improvementType == tSmokeImprovement) and not (bFireOnPillagedWorkerForestJungleImprovements and bPillagedImprovement and isWorkerImprovement(improvementType)) then
		return false;
	elseif pBurnCandi:GetResourceType(-1) ~= -1 and not bFireOnResources then
		return false;
	end
	for i = 0, pBurnCandi:GetNumUnits() - 1 do
		local uUnit = pBurnCandi:GetUnit(i);
		if (uUnit:GetUnitClassType() == GameInfo.UnitClasses.UNITCLASS_WORKER.ID) then
			local tBuild = uUnit:GetBuildType();
			if not ((tBuild == nil) or (tBuild == -1)) then
				return false;
			end
		end
	end
	return true;
end

function isWorkerImprovement(iImprovementType)
	for improvementIndex = 1, #TGburnableImprovements, 1 do
		if TGburnableImprovements[improvementIndex] == iImprovementType then
			return true;
		end
	end
	return false;
end
