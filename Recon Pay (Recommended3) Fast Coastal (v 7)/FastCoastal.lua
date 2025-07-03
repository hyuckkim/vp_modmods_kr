
function CoastalMaker(plot)
	if not plot:IsWater() then
		if (plot:IsAdjacentToTerrain(TerrainTypes.TERRAIN_COAST) or plot:IsAdjacentToTerrain(TerrainTypes.TERRAIN_OCEAN)) then
			local plotTerrain = plot:GetTerrainType();
			local bRoughPlot = plotTerrain == TerrainTypes.TERRAIN_DESERT or plotTerrain == TerrainTypes.TERRAIN_SNOW;
			if bRoughPlot then
				plot:SetFeatureType(GameInfoTypes.FEATURE_COASTAL_2);
			else
				plot:SetFeatureType(GameInfoTypes.FEATURE_COASTAL);
			end
		end
	end
end

GameEvents.TileFeatureChanged.Add(function(iPlotX, iPlotY, iPlotOwner, iOldFeature, iNewFeature)
	local plot = Map.GetPlot(iPlotX, iPlotY);
	if plot == nil then return end
	if iNewFeature ~= FeatureTypes.NO_FEATURE then return end
	if plot:IsCity() then return end
	CoastalMaker(plot);
end)

GameEvents.CityRazed.Add(function(iCityOwner, iPlotX, iPlotY)
	local plot = Map.GetPlot(iPlotX, iPlotY);
	if plot == nil then return end
	if plot:GetFeatureType() ~= FeatureTypes.NO_FEATURE then return end
	CoastalMaker(plot);
end)

Events.SequenceGameInitComplete.Add(function()
	if Game.GetGameTurn() > Game.GetStartTurn() then return end
	for i = 0, Map.GetNumPlots()-1, 1 do
		local plot = Map.GetPlotByIndex(i);
		if not plot:IsMountain() and plot:GetFeatureType() == FeatureTypes.NO_FEATURE then
			CoastalMaker(plot);
		end
	end
end)