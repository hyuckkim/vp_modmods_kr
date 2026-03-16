-- farmYields
-- Author: IA
-- DateCreated: 6/1/2020 7:28:26 PM
--------------------------------------------------------------
local eFarmersMarketBuilding = GameInfoTypes.BUILDING_IA_FARMERS_MARKET
local eFarmersMarketDummy = GameInfoTypes.BUILDING_IA_FARM_BONUS_D
local eTechNavigation = GameInfoTypes.TECH_NAVIGATION


function TechResearchedStartFarmCheck(iTeam, iTech)
	local pTeam = Teams[iTeam]
	local pPlayer = Players[pTeam:GetLeaderID()]

	if not pPlayer then return end

	if iTech == eTechNavigation then
		GameEvents.PlayerDoTurn.Add(detectFarms);
	end
end


function detectFarms(iPlayer)
	local pPlayer = Players[iPlayer];

	if not pPlayer then return end

	local iFarmCount = 0;

	local iNumberOfFarmersMarkets = pPlayer:CountNumBuildings(eFarmersMarketBuilding)

	if iNumberOfFarmersMarkets > 0 then

		local iCurrentFarmersMarket = 0;

		for city in pPlayer:Cities() do
			if (city:IsHasBuilding(eFarmersMarketBuilding)) then

				for i = 0, city:GetNumCityPlots()-1, 1 do
					local pPlot = city:GetCityIndexPlot(i)
					if (pPlot) then
						if (pPlot:GetImprovementType() == GameInfo.Improvements.IMPROVEMENT_FARM.ID and pPlot:GetOwner() == iPlayer and not pPlot:IsImprovementPillaged()) then
							iFarmCount = iFarmCount + 1;
						end
					end
				end

				city:SetNumRealBuilding(eFarmersMarketDummy, math.floor(iFarmCount / 3));
				iFarmCount = 0;
				iCurrentFarmersMarket = iCurrentFarmersMarket + 1;

				if iCurrentFarmersMarket == iNumberOfFarmersMarkets then
					break
				end

			end
		end
	end
end




GameEvents.TeamTechResearched.Add(TechResearchedStartFarmCheck);
