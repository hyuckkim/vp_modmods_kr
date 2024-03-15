
GameEvents.TileFeatureChanged.Add(function(iPlotX, iPlotY, iPlotOwner, iOldFeature, iNewFeature)
	local plot = Map.GetPlot(iPlotX, iPlotY);
	local plotTerrain = plot:GetTerrainType();
	local bRoughPlot = plotTerrain == TerrainTypes.TERRAIN_DESERT or plotTerrain == TerrainTypes.TERRAIN_SNOW;
	if iOldFeature == GameInfoTypes.FEATURE_MARSH or iOldFeature == GameInfoTypes.FEATURE_OASIS or iOldFeature == GameInfoTypes.FEATURE_FOREST or iOldFeature == GameInfoTypes.FEATURE_JUNGLE then
		if bRoughPlot then
			if plot:IsRiver() then
				plot:SetFeatureType(GameInfoTypes.FEATURE_RIPARIAN_2);
			end
		else
			if plot:IsRiver() then
				plot:SetFeatureType(GameInfoTypes.FEATURE_RIPARIAN);
			end
		end
	end
end)

Events.SequenceGameInitComplete.Add(function()
	if Game.GetGameTurn() > Game.GetStartTurn() then return end
	for i = 0, Map.GetNumPlots()-1, 1 do
		local plot = Map.GetPlotByIndex(i);
		if not plot:IsMountain() and plot:GetFeatureType() == FeatureTypes.NO_FEATURE then
			local plotTerrain = plot:GetTerrainType();
			local bRoughPlot = plotTerrain == TerrainTypes.TERRAIN_DESERT or plotTerrain == TerrainTypes.TERRAIN_SNOW;
			if bRoughPlot then
				if not plot:IsWater() and plot:IsRiver() then
					plot:SetFeatureType(GameInfoTypes.FEATURE_RIPARIAN_2);
				end
			else
				if not plot:IsWater() and plot:IsRiver() then
					plot:SetFeatureType(GameInfoTypes.FEATURE_RIPARIAN);
				end
			end
		end
	end
end)