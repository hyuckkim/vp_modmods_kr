-- Solar Plant Fix
-- Author: Tofusojo
-- DateCreated: 21-Oct-14 14:14:20
--------------------------------------------------------------
function OnCityCanConstruct(iPlayerID, iCity, iBuildingType)
	local iSolarPlant = GameInfoTypes["BUILDING_SOLAR_PLANT"]
	local iSnow = GameInfoTypes.TERRAIN_SNOW
	local iTundra = GameInfoTypes.TERRAIN_TUNDRA
	local bFirstRun = true

	if iBuildingType == iSolarPlant and bFirstRun == true then
		print("Building is a Solar Plant")
		local pCityPlot = Players[iPlayerID]:GetCityByID(iCity):Plot()
		local sCityName = Players[iPlayerID]:GetCityByID(iCity):GetName()
		local directions = {DirectionTypes.DIRECTION_NORTHEAST, DirectionTypes.DIRECTION_EAST, DirectionTypes.DIRECTION_SOUTHEAST, DirectionTypes.DIRECTION_SOUTHWEST, DirectionTypes.DIRECTION_WEST, DirectionTypes.DIRECTION_NORTHWEST}

		if pCityPlot:GetTerrainType() == iSnow or pCityPlot:GetTerrainType() == iTundra then 
			print("Cities on Snow or Tundra Tiles can't build a Solar Plant. City: " .. sCityName)
			bFirstRun = false
			return false 
		else
			for loop, direction in ipairs(directions) do
				local pPlot = Map.PlotDirection(pCityPlot:GetX(), pCityPlot:GetY(), direction)

				if pPlot:GetTerrainType() == iSnow or pPlot:GetTerrainType() == iTundra then
					print("Cities next to Snow or Tundra Tiles can't build a Solar Plant. City: " .. sCityName)
					bFirstRun = false
					return false
				end
			end
		end
		print("A Solar Plant may be built in this city: " .. sCityName)
		bFirstRun = false
		return true
	end
	return true
end
GameEvents.CityCanConstruct.Add(OnCityCanConstruct)