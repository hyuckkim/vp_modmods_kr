-- Nuclear Plants Can Meltdown
-- Author: Tofusojo
-- DateCreated: 31-Oct-14 13:12:16
--------------------------------------------------------------

function IsSuperQuickEnabled() 
	--print("IsSuperQuickEnabled running...")
	local SuperQuickModID = "e3699836-4ca9-405b-8b20-232a05ea8bf6"

	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == SuperQuickModID) then
			return true
		end
	end
	return false
end

--0 is Marathon 300%, 1 is Epic 150%, 2 is Standard 100%, and 3 is Quick 66%
local iGameSpeed = GameInfo.GameSpeeds[PreGame.GetGameSpeed()].GrowthPercent / 100
local MeltdownChance = 1 / iGameSpeed --x1  0: 0.33%, 1: 0.66%, 2: 1.00%, 3: 1.50%
									  --x3  0: 1.00%, 1: 2.00%, 2: 3.00%, 3: 4.50%

--("MeltdownChance before: " .. MeltdownChance)
if IsSuperQuickEnabled() then
	MeltdownChance = 3 -- Assumes SuperQuick's GrowthPercent is still 33 instead of 66
end
--print("MeltdownChance after: " .. MeltdownChance)

function CheckNuclearPlants(PlayerID)
	local pPlayer = Players[PlayerID]
	local iNuclearPlant = GameInfoTypes["BUILDING_NUCLEAR_PLANT"]
	local iFallout = GameInfoTypes["FEATURE_FALLOUT"]
	local directions = {DirectionTypes.DIRECTION_NORTHEAST, DirectionTypes.DIRECTION_EAST, DirectionTypes.DIRECTION_SOUTHEAST, DirectionTypes.DIRECTION_SOUTHWEST, DirectionTypes.DIRECTION_WEST, DirectionTypes.DIRECTION_NORTHWEST}

	for pCity in pPlayer:Cities() do
		local sCityName = pCity:GetName()
		local pCityPlot = pCity:Plot()
		local iCityX = pCity:GetX()
		local iCityY = pCity:GetY()
		local sText = "Nuclear Plant in " .. sCityName .. " destroyed!"
		local sHeading = "Nuclear Plant Meltdown"

		if pCity:IsHasBuilding(iNuclearPlant) and (math.random(1,100)  <= MeltdownChance) then
			pCity:SetNumRealBuilding(iNuclearPlant, 0)
			--print("Nuclear Plant removed from: " .. sCityName)
			for loop, direction in ipairs(directions) do
				local pPlot = Map.PlotDirection(pCityPlot:GetX(), pCityPlot:GetY(), direction)

				if not pPlot:IsWater() and (math.random(1,100)  <= 50) then
					pPlot:SetFeatureType(iFallout)
					--print("Spawning Fallout near: " .. sCityName)
				end
			end
			--print("A Nuclear Plant has had a meltdown in: " .. sCityName)
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, sText, sHeading, iCityX, iCityY, false, false, false )
		end
	end
end
GameEvents.PlayerDoTurn.Add(CheckNuclearPlants) 