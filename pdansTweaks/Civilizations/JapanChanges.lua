print("What's this? Japan is Evolving!")

local eCivilizationJapan = GameInfoTypes.CIVILIZATION_JAPAN

function WholesomeJapan(iFromPlayer, iFromCity, iToPlayer, iToCity, iDomain, iConnectionType)
	local pToPlayer = Players[iToPlayer]
    
	if pToPlayer:GetCivilizationType() == eCivilizationJapan then --Are you trying to trade with Japan?
		local pFromPlayer = Players[iFromPlayer]
		if iFromPlayer == iToPlayer then
			return true -- Japan can send trade routes to himself.
		end
		
		local pTeamJapan = Teams[pToPlayer:GetTeam()] 
		local pTeamNotJapan = Teams[pFromPlayer:GetTeam()]
		if pTeamNotJapan:HasEmbassyAtTeam(pTeamJapan:GetID()) then -- Do you have an Embassy with Japan?
			return true ---Oh we have accepted your embassy.. mkay. You can trade with us here.
		end
			
--		for _,v in ipairs(pToPlayer:GetTradeRoutes()) do --List all Japan's Trade Routes
--           if (v.ToCivilizationType == pFromPlayer:GetCivilizationType()) then 
--                return true ----Oh we did trade with you.. mkay. You can trade with us here.
--            end
--        end
        return false --I've never heard of you be GONE
    end
    return true --default return true
end


-- adds GPP and yields for every TR
function TradeRoutesSakokuBonus(iPlayer)
	local pPlayer = Players[iPlayer]

	if (pPlayer and pPlayer:GetCivilizationType() == eCivilizationJapan) then -- see if it's Japan's turn

		local iNumUnusedTRs = pPlayer:GetNumInternationalTradeRoutesAvailable() - (pPlayer:GetNumInternalTradeRoutes() + pPlayer:GetNumInternationalTradeRoutes())
		local eSakokuDummy = GameInfoTypes.BUILDING_SAKOKU_DUMMY
		local pCapital = pPlayer:GetCapitalCity()
	
		pCapital:SetNumRealBuilding(eSakokuDummy, iNumUnusedTRs)
	end
end

if Game.IsCivEverActive(eCivilizationJapan) then
	GameEvents.PlayerCanCreateTradeRoute.Add(WholesomeJapan)
	GameEvents.PlayerDoTurn.Add(TradeRoutesSakokuBonus)
end