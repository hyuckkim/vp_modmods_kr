--[[
-- NW_CentralStation
-- Author: FramedArchitecture
-- DateCreated: 6/2014
--------------------------------------------------------------------
local triggerID		= GameInfoTypes["UNIT_FA_ELECTRIC_CO"]
local companyID		= -1
local electricID	= -1
--------------------------------------------------------------------
function OnUnitCreated(playerID, unitID)
	if (companyID == -1) then return end
	if (electricID == -1) then return end

	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID);

	if not unit then return end
	if unit:GetUnitType() ~= triggerID then return end
	local plot = unit:GetPlot()
	if plot then
		local continentID = plot:GetContinentArtType()
		for city in player:Cities() do
			if GetContinent(city) == continentID then
				city:SetNumRealBuilding(electricID, 1)
			end
		end
	end

	unit:Kill();
end
Events.SerialEventUnitCreated.Add( OnUnitCreated )
--------------------------------------------------------------
function OnCityCreated(playerID, x, y)
	if (companyID == -1) then return end
	if (electricID == -1) then return end

	local player = Players[playerID]
    if player:CountNumBuildings(companyID) == 1 then 
		local continentID;
		for city in player:Cities() do
			if city:IsHasBuilding(companyID) then
				continentID = GetContinent(city)
				break;
			end
		end
		if continentID then
			local newcity = Map.GetPlot(x, y):GetPlotCity()
			if GetContinent(newcity) == continentID then
				newcity:SetNumRealBuilding(electricID, 1)
			end
		end
	end
end
GameEvents.PlayerCityFounded.Add( OnCityCreated )
--------------------------------------------------------------------
function OnCityCaptureComplete(oldOwnerID, bIsCapital, x, y, newOwnerID, pop, bConquest)
	if (companyID == -1) then return end
	if (electricID == -1) then return end

	local player = Players[oldOwnerID]
	if player:CountNumBuildings(companyID) == 0 then 
		for city in player:Cities() do
			city:SetNumRealBuilding(electricID, 0)
		end
	end

	local newPlayer = Players[newOwnerID]
    if newPlayer:CountNumBuildings(companyID) == 1 then 
		local continentID;
		for city in newPlayer:Cities() do
			if city:IsHasBuilding(companyID) then
				continentID = GetContinent(city)
				break;
			end
		end
		if continentID then
			local newcity = Map.GetPlot(x, y):GetPlotCity()
			if GetContinent(newcity) == continentID then
				newcity:SetNumRealBuilding(electricID, 1)
			end
		end
	end

end
GameEvents.CityCaptureComplete.Add( OnCityCaptureComplete );
--------------------------------------------------------------------
function IsBuildingSellable(playerID, buildingID)
	if (companyID == -1) then return true end
	if (buildingID == companyID) then return false end
	return true;
end
GameEvents.CityBuildingsIsBuildingSellable.Add(IsBuildingSellable)
--------------------------------------------------------------------
function GetContinent(city)
	return city:Plot():GetContinentArtType();
end
--------------------------------------------------------------------
for row in GameInfo.Buildings() do
	if row.FreeBuildingThisContinent then
		companyID = row.ID
		electricID = GameInfoTypes[row.FreeBuildingThisContinent]
		print("Script loaded...")
		break;
	end
end
--------------------------------------------------------------------
]]