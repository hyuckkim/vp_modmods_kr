-- buildingChecks - when buildings can only be built in certain circumstances
-- Author: IA
-- DateCreated: 7/30/2020 9:39:29 PM
--------------------------------------------------------------

--LocalResourceOrs requires the local resource to be improved, but Sea Salt/Lake Fish isn't a resource that's improvable
--So we'll do it manually

local iSeaSalt = GameInfoTypes.RESOURCE_IA_SALT_LAKE
local iLakeFish = GameInfoTypes.RESOURCE_IA_LAKE_FISH
local iBuildingLakeExtractor = GameInfoTypes.BUILDING_IA_LAKE_EXTRACTOR
--local iBuildingSaltGatherer = GameInfoTypes.BUILDING_IA_SALT_GATHERER
--local iBuildingFishery = GameInfoTypes.BUILDING_IA_FISHERY

function buildingCheck (iPlayer, iCity, iBuildingType)
	local pPlayer = Players[iPlayer]

	--if iBuildingType ~= iBuildingSaltGatherer and iBuildingType ~= iBuildingLakeExtractor and iBuildingType ~= iBuildingFishery then return true end
	if iBuildingType ~= iBuildingLakeExtractor then return true end
	
	local pCity = pPlayer:GetCityByID(iCity)

	--[[if iBuildingType == iBuildingSaltGatherer then
		for iCityPlot = 1, pCity:GetNumCityPlots() - 1, 1 do	
			local pPlot = pCity:GetCityIndexPlot(iCityPlot)
			if (pPlot and pPlot:GetResourceType(-1) == iSeaSalt and pPlot:GetOwner() == iPlayer) then
				return true
			end
		end
		return false
	end

	if iBuildingType == iBuildingFishery then
		for iCityPlot = 1, pCity:GetNumCityPlots() - 1, 1 do	
			local pPlot = pCity:GetCityIndexPlot(iCityPlot)
			if (pPlot and pPlot:GetResourceType(-1) == iLakeFish and pPlot:GetOwner() == iPlayer) then
				return true
			end
		end
		return false
	end ]]
	
	if iBuildingType == iBuildingLakeExtractor then
		for iCityPlot = 1, pCity:GetNumCityPlots() - 1, 1 do	
			local pPlot = pCity:GetCityIndexPlot(iCityPlot)
			if (pPlot and pPlot:IsLake() and pPlot:GetOwner() == iPlayer and not pPlot:IsNaturalWonder()) then
				return true
			end
		end
		return false
	end
	
	return true
end


GameEvents.CityCanConstruct.Add(buildingCheck)