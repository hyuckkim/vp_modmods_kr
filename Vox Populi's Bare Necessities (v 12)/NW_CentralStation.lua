--[[
-- NW_CentralStation
-- Author: FramedArchitecture
-- DateCreated: 6/2014
--------------------------------------------------------------------
local triggerID		= GameInfoTypes["UNIT_FA_CENTRAL_STATION"]
local roadID		= GameInfoTypes["ROUTE_ROAD"];
local railroadID	= GameInfoTypes["ROUTE_RAILROAD"];
--------------------------------------------------------------------
function OnUnitCreated(playerID, unitID)
	local unit = Players[playerID]:GetUnitByID(unitID);
	
	if not unit then return end
	if unit:GetUnitType() ~= triggerID then return end

	for i = 0, Map.GetNumPlots() - 1, 1 do
		local plot = Map.GetPlotByIndex( i );
		if plot:GetOwner() == playerID then
			if plot:GetRouteType() == roadID then
				plot:SetRouteType(railroadID);
			end
		end
	end

	unit:Kill();
end
Events.SerialEventUnitCreated.Add( OnUnitCreated )
--------------------------------------------------------------------
print("Script loaded...")]]