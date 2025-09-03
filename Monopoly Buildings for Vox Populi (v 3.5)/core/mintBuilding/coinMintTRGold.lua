-- Coinage Mint Gold from Trade Routes (Altered from Chaebol, which was altered from Waag)
-- Author: hokath
-- DateCreated: 27/1/18
--------------------------------------------------------------
local eBuildingDummyForMint = GameInfoTypes.BUILDING_IA_GOLD_BONUS_D
local eBuildingCoinMint = GameInfoTypes.BUILDING_IA_COIN_MINT

-- adds Gold for every 2 TR
function TradeRoutesGold(iPlayer)
	local pPlayer = Players[iPlayer]

	local iNumberOfCoinMints = pPlayer:CountNumBuildings(eBuildingCoinMint)

	if iNumberOfCoinMints > 0 then
		local iCounter = 0
		local tTradeRoutes = pPlayer:GetTradeRoutes()

		for i, tradeRoute in ipairs(tTradeRoutes) do
			local eFromCiv = tradeRoute.FromCivilizationType
			local eToCiv = tradeRoute.ToCivilizationType

			if (eFromCiv ~= eToCiv) then
				iCounter = iCounter + 1
			end
		end

		local iCurrentCoinMint = 0

		for city in pPlayer:Cities() do
			if city:IsHasBuilding(eBuildingCoinMint) then
				city:SetNumRealBuilding(eBuildingDummyForMint, iCounter)
				iCurrentCoinMint = iCurrentCoinMint + 1
				
				if iCurrentCoinMint == iNumberOfCoinMints then
					break
				end
			end
		end
	end
end


GameEvents.PlayerDoTurn.Add(TradeRoutesGold)
