function OnFoundCheckCity(iPlayer, iX, iY)
	
	local pPlayer = Players[iPlayer]
	local pCity = Map.GetPlot(iX, iY):GetPlotCity()
	local plot = pCity:GetCityIndexPlot( i ) -- Added
	
		-- Checking coastal status. Set NoCoast flag where applicable.
		if not pCity:IsCoastal() then
			pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_NOCOAST_TOWN_DUMMY, 1)
		end
		
		-- Checking river status. Set NoRiver flag where applicable.
		if not plot:IsRiver() then
			pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_NORIVER_TOWN_DUMMY, 1)
		end
		
		--[[ Checking for other water sources adjacent to city (e.g. oasis, NW with water, etc.)
		Works by creating a DryTown tag initally then running through a loop to destroy it if applicable. --]]
		
		pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DRY_TOWN_DUMMY, 1)
		
		for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
			local pAdjacentPlot = Map.PlotDirection(plot:GetX(), plot:GetY(), direction)
			local bcheck= pCity:IsCoastal() or plot:IsRiver() or pAdjacentPlot:GetFeatureType() == GameInfoTypes.FEATURE_OASIS  or pAdjacentPlot:GetFeatureType() == GameInfoTypes.FEATURE_FOUNTAIN_YOUTH or pAdjacentPlot:GetFeatureType() == GameInfoTypes.FEATURE_LAKE_VICTORIA
			if pAdjacentPlot and bcheck then 
				pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DRY_TOWN_DUMMY, 0)
			end
		end
end

GameEvents.PlayerCityFounded.Add(OnFoundCheckCity)
