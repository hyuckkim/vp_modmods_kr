-- Supermarket
-- Author: pineappledan
-- DateCreated: 05/09/2022
--------------------------------------------------------------
local eBuildingDummySupermarket = GameInfoTypes.BUILDING_D_FOR_SUPERMARKET
local eBuildingSupermarket = GameInfoTypes.BUILDING_SUPERMARKET
local eImprovementFarm = GameInfoTypes.IMPROVEMENT_FARM
local eImprovementPasture = GameInfoTypes.IMPROVEMENT_PASTURE

-- add defense per Wonder and convert defense to culture
function SupermarketFood(iPlayer)
	local pPlayer = Players[iPlayer]

	if pPlayer:IsMinorCiv() then return end

	if pPlayer:CountNumBuildings(eBuildingSupermarket) > 0 then
		local pCapital = pPlayer:GetCapitalCity()
		local iImprovementCount = (pPlayer:GetImprovementCount(eImprovementFarm) + pPlayer:GetImprovementCount(eImprovementPasture))
		
		pCapital:SetNumRealBuilding(eBuildingDummySupermarket, iImprovementCount)
	end
end

GameEvents.PlayerDoTurn.Add(SupermarketFood)