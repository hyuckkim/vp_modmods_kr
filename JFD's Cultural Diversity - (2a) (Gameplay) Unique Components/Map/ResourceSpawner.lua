local tAllowedFeatures = {}
tAllowedFeatures[-1] = true
tAllowedFeatures[GameInfoTypes.FEATURE_JUNGLE] = true
tAllowedFeatures[GameInfoTypes.FEATURE_FOREST] = true

function Jar_CocaSpawn(iPlayer, iCity, iBuildingType, bGold, bFaithOrCulture)
	local pPlayer = Players[iPlayer];
	local pCity = pPlayer:GetCityByID(iCity)
	if not pPlayer:IsAlive() then return end
	if pCity and iBuildingType == GameInfoTypes.BUILDING_CD_YATIRI then
		print("coca is being placed!")
		for i = 0, pCity:GetNumCityPlots() - 1, 1 do
			local pPlot = pCity:GetCityIndexPlot(i)
			local distance = Map.PlotDistance(pCity:GetX(), pCity:GetY(), pPlot:GetX(), pPlot:GetY())
			local bcheck = pPlot:GetOwner() == iPlayer or pPlot:GetOwner() == -1
			if pPlot and distance<= 3 and bcheck and pPlot:GetResourceType() == -1 
			and (pPlot:GetTerrainType() ~= TerrainTypes.TERRAIN_SNOW) and (pPlot:GetTerrainType() ~= TerrainTypes.TERRAIN_DESERT)
			and tAllowedFeatures[pPlot:GetFeatureType()] and (not pPlot:IsWater()) and (not pPlot:IsMountain()) and (not pPlot:IsCity()) then
				pPlot:SetResourceType(GameInfoTypes.RESOURCE_COCA, 1)
				break
			end
		end
	end
end
GameEvents.CityConstructed.Add(Jar_CocaSpawn)

-- and pPlot:GetImprovementType() == -1 

function Hok_ReindeerSpawn(iPlayer, iCity, iBuildingType, bGold, bFaithOrCulture)
	local pPlayer = Players[iPlayer];
	local pCity = pPlayer:GetCityByID(iCity)
	if not pPlayer:IsAlive() then return end
	if pCity and iBuildingType == GameInfoTypes.BUILDING_CD_REINDEER_DISTRICT then
		print("reindeer are being placed!")
		local numPlaced = 0;
		for i = 0, pCity:GetNumCityPlots() - 1, 1 do
			local pPlot = pCity:GetCityIndexPlot(i)
			local distance = Map.PlotDistance(pCity:GetX(), pCity:GetY(), pPlot:GetX(), pPlot:GetY())
			local bcheck = pPlot:GetOwner() == iPlayer or pPlot:GetOwner() == -1
			if pPlot and distance<= 3 and bcheck and pPlot:GetResourceType() == -1
			and ((pPlot:GetTerrainType() == TerrainTypes.TERRAIN_SNOW) or (pPlot:GetTerrainType() == TerrainTypes.TERRAIN_TUNDRA))
			and tAllowedFeatures[pPlot:GetFeatureType()] and (not pPlot:IsWater()) and (not pPlot:IsMountain()) and (not pPlot:IsCity()) then
				pPlot:SetResourceType(GameInfoTypes.RESOURCE_REINDEER, 1)
				numPlaced = numPlaced + 1
				if numPlaced == 2 then
					break
				end
			end
		end
	end
end
GameEvents.CityConstructed.Add(Hok_ReindeerSpawn)
