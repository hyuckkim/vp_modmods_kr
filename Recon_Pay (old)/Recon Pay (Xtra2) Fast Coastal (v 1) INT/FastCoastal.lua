
GameEvents.TileFeatureChanged.Add(function(iPlotX, iPlotY, iPlotOwner, iOldFeature, iNewFeature)
	local plot = Map.GetPlot(iPlotX, iPlotY);
	if iOldFeature == GameInfoTypes.FEATURE_MARSH or iOldFeature == GameInfoTypes.FEATURE_OASIS or iOldFeature == GameInfoTypes.FEATURE_FOREST or iOldFeature == GameInfoTypes.FEATURE_JUNGLE then
		if (plot:IsAdjacentToTerrain(TerrainTypes.TERRAIN_COAST) or plot:IsAdjacentToTerrain(TerrainTypes.TERRAIN_OCEAN)) and not plot:IsWater() then
			local plotTerrain = plot:GetTerrainType();
			local bRoughPlot = plotTerrain == TerrainTypes.TERRAIN_DESERT or plotTerrain == TerrainTypes.TERRAIN_SNOW;
			if bRoughPlot then
				plot:SetFeatureType(GameInfoTypes.FEATURE_COASTAL_2);
			else
				plot:SetFeatureType(GameInfoTypes.FEATURE_COASTAL);
			end
		end
	end
end)

Events.SequenceGameInitComplete.Add(function()
	if Game.GetGameTurn() > Game.GetStartTurn() then return end
	for i = 0, Map.GetNumPlots()-1, 1 do
		local plot = Map.GetPlotByIndex(i);
		if not plot:IsMountain() and plot:GetFeatureType() == FeatureTypes.NO_FEATURE then
			if (plot:IsAdjacentToTerrain(TerrainTypes.TERRAIN_COAST) or plot:IsAdjacentToTerrain(TerrainTypes.TERRAIN_OCEAN)) and not plot:IsWater() then
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
end)
