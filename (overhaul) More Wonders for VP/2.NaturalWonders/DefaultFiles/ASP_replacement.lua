-- Functions replacing default ones from AssignstartingPlots.lua file from VP
-- Author: adan_eslavo
-- DateCreated: 1/1/2024 12:39:17 PM
--------------------------------------------------------------
include("AssignStartingPlots")

function AssignStartingPlots:ExaminePlotForNaturalWondersEligibility(x, y)
	-- This function checks only for eligibility requirements applicable to all Natural Wonders.
	-- If a candidate plot passes all such checks, we will move on to checking it against specific needs for each particular wonderID.

	-- Update, May 2011: Control over wonderID placement is being migrated to XML. Some checks here moved to there.
	local iW, iH = Map.GetGridSize();
	local plotIndex = iW * y + x + 1;

	-- adan_eslavo, start (top and bottom rows are not targetted)
	if (not Map.IsWrapY() and (y == 0 or y == iH - 1)) or (not Map.IsWrapX() and (x == 0 or x == iW - 1)) then
		return false, false;
	end
	-- adan_eslavo, end
	
	-- Check for collision with player starts
	if self.impactData[ImpactLayers.LAYER_NATURAL_WONDER][plotIndex] > 0 then
		return false, false;
	end
	
	-- adan_eslavo, start (fertility rework; was range=3; was 20/28); I use different algorithms than Fertility, so it's disabled now (all tiles are taken into account)
	-- Check the location is a decent city site, otherwise the wonderID is pointless
	local plot = Map.GetPlot(x, y);
	local fertility = self:Plot_GetFertilityInRange(plot, 1);
	--print("Plot:", x, y, "fertility=", fertility)
	if fertility < 0 then
		return false, false;
	elseif fertility < 0 then
		return false, true;
	end
	return true, true;
	-- adan_eslavo, end
end

function AssignStartingPlots:AttemptToPlaceNaturalWonder(wonder_number, row_number)
	-- Attempts to place a specific natural wonder. The "wonder_number" is a Lua index while "row_number" is an XML index.
	local iW, _ = Map.GetGridSize();
	local feature_type_to_place;
	for thisFeature in GameInfo.Features() do
		if thisFeature.Type == self.wonder_list[wonder_number] then
			feature_type_to_place = thisFeature.ID;
			break;
		end
	end
	local temp_table = self.eligibility_lists[wonder_number];
	local candidate_plot_list = GetShuffledCopyOfTable(temp_table);
	for _, plotIndex in ipairs(candidate_plot_list) do
		if self.impactData[ImpactLayers.LAYER_NATURAL_WONDER][plotIndex] == 0 then -- No collision with civ start or other NW, so place wonder here!
			local x = (plotIndex - 1) % iW;
			local y = (plotIndex - x - 1) / iW;
			local plot = Map.GetPlot(x, y);
			-- If called for, force the local terrain to conform to what the wonder needs.
			local method_number = GameInfo.Natural_Wonder_Placement[row_number].TileChangesMethodNumber;
			if method_number ~= -1 then
				-- Custom method for tile changes needed by this wonder.
				NWCustomPlacement(x, y, row_number, method_number);
			else
				-- Check the XML data for any standard type tile changes, execute any that are indicated.
				if GameInfo.Natural_Wonder_Placement[row_number].ChangeCoreTileToMountain then
					if not plot:IsMountain() then
						plot:SetPlotType(PlotTypes.PLOT_MOUNTAIN, false, false);
					end
				elseif GameInfo.Natural_Wonder_Placement[row_number].ChangeCoreTileToFlatland then
					if plot:GetPlotType() ~= PlotTypes.PLOT_LAND then
						plot:SetPlotType(PlotTypes.PLOT_LAND, false, false);
					end
				end
				if GameInfo.Natural_Wonder_Placement[row_number].ChangeCoreTileTerrainToGrass then
					if plot:GetTerrainType() ~= TerrainTypes.TERRAIN_GRASS then
						plot:SetTerrainType(TerrainTypes.TERRAIN_GRASS, false, false);
					end
				elseif GameInfo.Natural_Wonder_Placement[row_number].ChangeCoreTileTerrainToPlains then
					if plot:GetTerrainType() ~= TerrainTypes.TERRAIN_PLAINS then
						plot:SetTerrainType(TerrainTypes.TERRAIN_PLAINS, false, false);
					end
				end
				if GameInfo.Natural_Wonder_Placement[row_number].SetAdjacentTilesToShallowWater then
					for _, direction in ipairs(self.direction_types) do
						local adjPlot = Map.PlotDirection(x, y, direction);
						if adjPlot:GetTerrainType() ~= TerrainTypes.TERRAIN_COAST then
							adjPlot:SetTerrainType(TerrainTypes.TERRAIN_COAST, false, false);
						end
					end
				end
			end

			-- Now place this wonder and record the placement.
			plot:SetFeatureType(feature_type_to_place);

			-- Natural Wonders shouldn't be too close to each other.
			self:PlaceResourceImpact(x, y, ImpactLayers.LAYER_NATURAL_WONDER, 11);

			-- Force no resource on Natural Wonders.
			self:PlaceStrategicResourceImpact(x, y, 0);
			self:PlaceResourceImpact(x, y, ImpactLayers.LAYER_LUXURY, 0);
			self:PlaceResourceImpact(x, y, ImpactLayers.LAYER_BONUS, 0);
			self:PlaceResourceImpact(x, y, ImpactLayers.LAYER_FISH, 0);
			self:PlaceResourceImpact(x, y, ImpactLayers.LAYER_MARBLE, 0);
			self:PlaceResourceImpact(x, y, ImpactLayers.LAYER_IVORY, 0);

			-- Keep City States away from Natural Wonders!
			self:PlaceResourceImpact(x, y, ImpactLayers.LAYER_CITY_STATE, 4);

			local plotIndex = y * iW + x + 1;
			self.playerCollisionData[plotIndex] = true; -- Record exact plot of wonder in the collision list.

			-- MOD.Barathor: Fixed: Added a check for the Great Barrier Reef being placed.  If so, it appropriately applies impact values to its second tile to avoid buggy collisions with water resources.
			-- MOD.Barathor: Start
			-- MOD.adan_eslavo: adaptation to 3-tile GBR (now tiles around center blocked);
			if (self.wonder_list[wonder_number] == "FEATURE_NEW_REEF_A") then
				--print("Great Barrier Reef placed... applying impact values to its southeast tile as well.")
				for i = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1 do
					local pBarrierPlot = Map.PlotDirection(x, y, i)
					
					if pBarrierPlot:GetFeatureType() == GameInfoTypes.FEATURE_NEW_REEF_B or pBarrierPlot:GetFeatureType() == GameInfoTypes.FEATURE_NEW_REEF_C then	
						local iBarrierX = pBarrierPlot:GetX()
						local iBarrierY = pBarrierPlot:GetY()
					
						self:PlaceStrategicResourceImpact(iBarrierX, iBarrierY, 0);
						
						self:PlaceResourceImpact(iBarrierX, iBarrierY, ImpactLayers.LAYER_LUXURY, 0) -- Luxury layer
						self:PlaceResourceImpact(iBarrierX, iBarrierY, ImpactLayers.LAYER_BONUS, 0) -- Bonus layer
						self:PlaceResourceImpact(iBarrierX, iBarrierY, ImpactLayers.LAYER_FISH, 0) -- Fish layer
						self:PlaceResourceImpact(iBarrierX, iBarrierY, ImpactLayers.LAYER_MARBLE, 0) -- Marble layer
						self:PlaceResourceImpact(iBarrierX, iBarrierY, ImpactLayers.LAYER_IVORY, 0) -- Ivory layer
					
						local iBarrierPlotIndex = iBarrierY * iW + iBarrierX + 1
						
						self.playerCollisionData[iBarrierPlotIndex] = true -- Record exact plot of wonder in the collision list.
					end
				end
			elseif (self.wonder_list[wonder_number] == "FEATURE_SALAR_A") then
				for i = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1 do
					local pSalarPlot = Map.PlotDirection(x, y, i)
					
					if pSalarPlot:GetFeatureType() == GameInfoTypes.FEATURE_SALAR_B then	
						local iSalarX = pSalarPlot:GetX()
						local iSalarY = pSalarPlot:GetY()
					
						self:PlaceStrategicResourceImpact(iSalarX, iSalarY, 0);
						
						self:PlaceResourceImpact(iSalarX, iSalarY, ImpactLayers.LAYER_LUXURY, 0) -- Luxury layer
						self:PlaceResourceImpact(iSalarX, iSalarY, ImpactLayers.LAYER_BONUS, 0) -- Bonus layer
						self:PlaceResourceImpact(iSalarX, iSalarY, ImpactLayers.LAYER_FISH, 0) -- Fish layer
						self:PlaceResourceImpact(iSalarX, iSalarY, ImpactLayers.LAYER_MARBLE, 0) -- Marble layer
						self:PlaceResourceImpact(iSalarX, iSalarY, ImpactLayers.LAYER_IVORY, 0) -- Ivory layer
					
						local iSalarPlotIndex = iSalarY * iW + iSalarX + 1
						
						self.playerCollisionData[iSalarPlotIndex] = true -- Record exact plot of wonder in the collision list.
						break
					end
				end
			elseif (self.wonder_list[wonder_number] == "FEATURE_BERMUDA_A") then
				local pBermudaPlotSE = Map.PlotDirection(x, y, DirectionTypes.DIRECTION_SOUTHEAST)
				local pBermudaPlotSW = Map.PlotDirection(x, y, DirectionTypes.DIRECTION_SOUTHWEST)
					
				local iBermudaX = pBermudaPlotSE:GetX()
				local iBermudaY = pBermudaPlotSE:GetY()
				
				self:PlaceStrategicResourceImpact(iBermudaX, iBermudaY, 0);
						
				self:PlaceResourceImpact(iBermudaX, iBermudaY, ImpactLayers.LAYER_LUXURY, 0) -- Luxury layer
				self:PlaceResourceImpact(iBermudaX, iBermudaY, ImpactLayers.LAYER_BONUS, 0) -- Bonus layer
				self:PlaceResourceImpact(iBermudaX, iBermudaY, ImpactLayers.LAYER_FISH, 0) -- Fish layer
				self:PlaceResourceImpact(iBermudaX, iBermudaY, ImpactLayers.LAYER_MARBLE, 0) -- Marble layer
				self:PlaceResourceImpact(iBermudaX, iBermudaY, ImpactLayers.LAYER_IVORY, 0) -- Ivory layer
				
				local iBermudaPlotIndex = iBermudaY * iW + iBermudaX + 1
					
				self.playerCollisionData[iBermudaPlotIndex] = true -- Record exact plot of wonder in the collision list.
				
				local iBermudaX = pBermudaPlotSW:GetX()
				local iBermudaY = pBermudaPlotSW:GetY()
				
				self:PlaceStrategicResourceImpact(iBermudaX, iBermudaY, 0);
						
				self:PlaceResourceImpact(iBermudaX, iBermudaY, ImpactLayers.LAYER_LUXURY, 0) -- Luxury layer
				self:PlaceResourceImpact(iBermudaX, iBermudaY, ImpactLayers.LAYER_BONUS, 0) -- Bonus layer
				self:PlaceResourceImpact(iBermudaX, iBermudaY, ImpactLayers.LAYER_FISH, 0) -- Fish layer
				self:PlaceResourceImpact(iBermudaX, iBermudaY, ImpactLayers.LAYER_MARBLE, 0) -- Marble layer
				self:PlaceResourceImpact(iBermudaX, iBermudaY, ImpactLayers.LAYER_IVORY, 0) -- Ivory layer
				
				local iBermudaPlotIndex = iBermudaY * iW + iBermudaX + 1
					
				self.playerCollisionData[iBermudaPlotIndex] = true -- Record exact plot of wonder in the collision list.
			elseif (self.wonder_list[wonder_number] == "FEATURE_CAUSEWAY_A") then
				for i = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1 do
					local pCausewayPlot = Map.PlotDirection(x, y, i)
					
					if pCausewayPlot:GetFeatureType() == GameInfoTypes.FEATURE_CAUSEWAY_B then	
						local iCausewayX = pCausewayPlot:GetX()
						local iCausewayY = pCausewayPlot:GetY()
				
						self:PlaceStrategicResourceImpact(iCausewayX, iCausewayY, 0);
						
						self:PlaceResourceImpact(iCausewayX, iCausewayY, ImpactLayers.LAYER_LUXURY, 0) -- Luxury layer
						self:PlaceResourceImpact(iCausewayX, iCausewayY, ImpactLayers.LAYER_BONUS, 0) -- Bonus layer
						self:PlaceResourceImpact(iCausewayX, iCausewayY, ImpactLayers.LAYER_FISH, 0) -- Fish layer
						self:PlaceResourceImpact(iCausewayX, iCausewayY, ImpactLayers.LAYER_MARBLE, 0) -- Marble layer
						self:PlaceResourceImpact(iCausewayX, iCausewayY, ImpactLayers.LAYER_IVORY, 0) -- Ivory layer
					
						local iCausewayPlotIndex = iCausewayY * iW + iCausewayX + 1
						
						self.playerCollisionData[iCausewayPlotIndex] = true -- Record exact plot of wonder in the collision list.
						break
					end
				end
			elseif (self.wonder_list[wonder_number] == "FEATURE_EYE_OF_SAHARA_A") then
				local pEyeOfSaharaPlotSE = Map.PlotDirection(x, y, DirectionTypes.DIRECTION_SOUTHEAST)
				local pEyeOfSaharaPlotSW = Map.PlotDirection(x, y, DirectionTypes.DIRECTION_SOUTHWEST)
					
				local iEyeOfSaharaX = pEyeOfSaharaPlotSE:GetX()
				local iEyeOfSaharaY = pEyeOfSaharaPlotSE:GetY()
				
				self:PlaceStrategicResourceImpact(iEyeOfSaharaX, iEyeOfSaharaY, 0);
						
				self:PlaceResourceImpact(iEyeOfSaharaX, iEyeOfSaharaY, ImpactLayers.LAYER_LUXURY, 0) -- Luxury layer
				self:PlaceResourceImpact(iEyeOfSaharaX, iEyeOfSaharaY, ImpactLayers.LAYER_BONUS, 0) -- Bonus layer
				self:PlaceResourceImpact(iEyeOfSaharaX, iEyeOfSaharaY, ImpactLayers.LAYER_FISH, 0) -- Fish layer
				self:PlaceResourceImpact(iEyeOfSaharaX, iEyeOfSaharaY, ImpactLayers.LAYER_MARBLE, 0) -- Marble layer
				self:PlaceResourceImpact(iEyeOfSaharaX, iEyeOfSaharaY, ImpactLayers.LAYER_IVORY, 0) -- Ivory layer
				
				local iEyeOfSaharaPlotIndex = iEyeOfSaharaY * iW + iEyeOfSaharaX + 1
					
				self.playerCollisionData[iEyeOfSaharaPlotIndex] = true -- Record exact plot of wonder in the collision list.
				
				local iEyeOfSaharaX = pEyeOfSaharaPlotSW:GetX()
				local iEyeOfSaharaY = pEyeOfSaharaPlotSW:GetY()
				
				self:PlaceStrategicResourceImpact(iEyeOfSaharaX, iEyeOfSaharaY, 0);
						
				self:PlaceResourceImpact(iEyeOfSaharaX, iEyeOfSaharaY, ImpactLayers.LAYER_LUXURY, 0) -- Luxury layer
				self:PlaceResourceImpact(iEyeOfSaharaX, iEyeOfSaharaY, ImpactLayers.LAYER_BONUS, 0) -- Bonus layer
				self:PlaceResourceImpact(iEyeOfSaharaX, iEyeOfSaharaY, ImpactLayers.LAYER_FISH, 0) -- Fish layer
				self:PlaceResourceImpact(iEyeOfSaharaX, iEyeOfSaharaY, ImpactLayers.LAYER_MARBLE, 0) -- Marble layer
				self:PlaceResourceImpact(iEyeOfSaharaX, iEyeOfSaharaY, ImpactLayers.LAYER_IVORY, 0) -- Ivory layer
				
				local iEyeOfSaharaPlotIndex = iEyeOfSaharaY * iW + iEyeOfSaharaX + 1
					
				self.playerCollisionData[iEyeOfSaharaPlotIndex] = true -- Record exact plot of wonder in the collision list.
			elseif (self.wonder_list[wonder_number] == "FEATURE_GALAPAGOS_A") then
				for i = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1 do
					local pGalapagosPlot = Map.PlotDirection(x, y, i)
					
					if pGalapagosPlot:GetFeatureType() == GameInfoTypes.FEATURE_GALAPAGOS_B then	
						local iGalapagosX = pGalapagosPlot:GetX()
						local iGalapagosY = pGalapagosPlot:GetY()
					
						self:PlaceStrategicResourceImpact(iGalapagosX, iGalapagosY, 0);
						
						self:PlaceResourceImpact(iGalapagosX, iGalapagosY, ImpactLayers.LAYER_LUXURY, 0) -- Luxury layer
						self:PlaceResourceImpact(iGalapagosX, iGalapagosY, ImpactLayers.LAYER_BONUS, 0) -- Bonus layer
						self:PlaceResourceImpact(iGalapagosX, iGalapagosY, ImpactLayers.LAYER_FISH, 0) -- Fish layer
						self:PlaceResourceImpact(iGalapagosX, iGalapagosY, ImpactLayers.LAYER_MARBLE, 0) -- Marble layer
						self:PlaceResourceImpact(iGalapagosX, iGalapagosY, ImpactLayers.LAYER_IVORY, 0) -- Ivory layer
					
						local iGalapagosPlotIndex = iGalapagosY * iW + iGalapagosX + 1
						
						self.playerCollisionData[iGalapagosPlotIndex] = true -- Record exact plot of wonder in the collision list.
						break
					end
				end
			elseif (self.wonder_list[wonder_number] == "FEATURE_HA_LONG_A") then
				for i = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1 do
					local pHaLongPlot = Map.PlotDirection(x, y, i)
					
					if pHaLongPlot:GetFeatureType() == GameInfoTypes.FEATURE_HA_LONG_B then	
						local iHaLongX = pHaLongPlot:GetX()
						local iHaLongY = pHaLongPlot:GetY()
					
						self:PlaceStrategicResourceImpact(iHaLongX, iHaLongY, 0);
						
						self:PlaceResourceImpact(iHaLongX, iHaLongY, ImpactLayers.LAYER_LUXURY, 0) -- Luxury layer
						self:PlaceResourceImpact(iHaLongX, iHaLongY, ImpactLayers.LAYER_BONUS, 0) -- Bonus layer
						self:PlaceResourceImpact(iHaLongX, iHaLongY, ImpactLayers.LAYER_FISH, 0) -- Fish layer
						self:PlaceResourceImpact(iHaLongX, iHaLongY, ImpactLayers.LAYER_MARBLE, 0) -- Marble layer
						self:PlaceResourceImpact(iHaLongX, iHaLongY, ImpactLayers.LAYER_IVORY, 0) -- Ivory layer
					
						local iHaLongPlotIndex = iHaLongY * iW + iHaLongX + 1
						
						self.playerCollisionData[iHaLongPlotIndex] = true -- Record exact plot of wonder in the collision list.
						break
					end
				end
			elseif (self.wonder_list[wonder_number] == "FEATURE_AURORA_A") then
				for i = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1 do
					local pAuroraPlot = Map.PlotDirection(x, y, i)
					
					if pAuroraPlot:GetFeatureType() == GameInfoTypes.FEATURE_AURORA_B or pAuroraPlot:GetFeatureType() == GameInfoTypes.FEATURE_AURORA_C then	
						local iAuroraX = pAuroraPlot:GetX()
						local iAuroraY = pAuroraPlot:GetY()
					
						self:PlaceStrategicResourceImpact(iAuroraX, iAuroraY, 0);
						
						self:PlaceResourceImpact(iAuroraX, iAuroraY, ImpactLayers.LAYER_LUXURY, 0) -- Luxury layer
						self:PlaceResourceImpact(iAuroraX, iAuroraY, ImpactLayers.LAYER_BONUS, 0) -- Bonus layer
						self:PlaceResourceImpact(iAuroraX, iAuroraY, ImpactLayers.LAYER_FISH, 0) -- Fish layer
						self:PlaceResourceImpact(iAuroraX, iAuroraY, ImpactLayers.LAYER_MARBLE, 0) -- Marble layer
						self:PlaceResourceImpact(iAuroraX, iAuroraY, ImpactLayers.LAYER_IVORY, 0) -- Ivory layer
					
						local iAuroraPlotIndex = iAuroraY * iW + iAuroraX + 1
						
						self.playerCollisionData[iAuroraPlotIndex] = true -- Record exact plot of wonder in the collision list.
					end
				end
			end
			-- MOD.Barathor: End

			print("- Placed ".. self.wonder_list[wonder_number].. " in Plot", x, y);

			return true;
		end
	end
	-- If reached here, this wonder was unable to be placed because all candidates are too close to an already-placed NW.
	return false;
end

function AssignStartingPlots:GetNumNaturalWondersToPlace(iWorldSize)
	local tTarget = {
		[GameInfo.Worlds.WORLDSIZE_DUEL.ID] = 2, -- adan_eslavo
		[GameInfo.Worlds.WORLDSIZE_TINY.ID] = 4,
		[GameInfo.Worlds.WORLDSIZE_SMALL.ID] = 6,
		[GameInfo.Worlds.WORLDSIZE_STANDARD.ID] = 8,
		[GameInfo.Worlds.WORLDSIZE_LARGE.ID] = 10,
		[GameInfo.Worlds.WORLDSIZE_HUGE.ID] = 12,
	};
	return tTarget[iWorldSize];
end