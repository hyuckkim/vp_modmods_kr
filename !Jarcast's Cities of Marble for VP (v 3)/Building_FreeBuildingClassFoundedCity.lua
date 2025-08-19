-- Building FreeBuildingClassFoundedCity
-- Author: Machiavelli
-- DateCreated: 7/21/2014 4:25:35 PM
--------------------------------------------------------------
-- Version 2
--
-- Implements the Building_FreeBuildingClassFoundedCity table.
--------------------------------------------------------------
function Building_FreeBuildingClassFoundedCity_Table(playerID, iCityX, iCityY)
	local player = Players[playerID];
	local city = Map.GetPlot(iCityX, iCityY):GetPlotCity();
	local buildingType;

	for row in GameInfo.Building_FreeBuildingClassFoundedCity() do
		if(player:CountNumBuildings(GameInfoTypes[row.BuildingType]) > 0) then
			buildingType = GetBuildingTypeFromClass(row.BuildingClassType, player:GetCivilizationType());
			if(buildingType ~= nil and buildingType ~= "") then
				city:SetNumRealBuilding(GameInfoTypes[buildingType], 1);
			end
		end
	end
end
GameEvents.PlayerCityFounded.Add(Building_FreeBuildingClassFoundedCity_Table);

------------------------------
-- Private helper functions --
------------------------------
function GetBuildingTypeFromClass(buildingClass, civilizationTypeID)
	-- Assume it is the default building
	local buildingType = GameInfo.BuildingClasses[buildingClass].DefaultBuilding;

	-- See if this civilization has a unique building for this building class
	local condition = "CivilizationType = '" .. GameInfo.Civilizations[civilizationTypeID].Type .. "' AND BuildingClassType = '" .. buildingClass .. "'";
	for row in GameInfo.Civilization_BuildingClassOverrides(condition) do
		buildingType = row.BuildingType;
		return buildingType;
	end

	return buildingType;
end

--------------
-- Initialization check.  Ensures this code isn't loaded twice
--------------
local retVal = {};
LuaEvents.Building_FreeBuildingClassFoundedCity_Table_IsInitialized(retVal);

-- If retVal isn't changed, no other mod has initialized this code.
if (retVal.isInitialized == nil) then
	LuaEvents.Building_FreeBuildingClassFoundedCity_Table_IsInitialized.Add(function (retVal) retVal.isInitialized = true; end);
	-- Initialize the code
	GameEvents.PlayerCityFounded.Add(Building_FreeBuildingClassFoundedCity_Table);
end


function Waterworks_GivePopulation(playerID, iCityX, iCityY)
	local player = Players[playerID];
	local city = Map.GetPlot(iCityX, iCityY):GetPlotCity();

	if(player:CountNumBuildings(GameInfoTypes["BUILDING_JAR_WATERWORKS"]) > 0) then
		city:ChangePopulation(1, true);
	end
end
GameEvents.PlayerCityFounded.Add(Waterworks_GivePopulation);