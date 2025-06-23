local iPopulationBuilding = GameInfoTypes.BUILDING_POPULATION

function OnTheCapitalNextTurn (iPlayer)
	local pplayer = Players[iPlayer]
	if pplayer:IsMinorCiv() or pplayer:IsBarbarian() then return end
	if not pplayer:IsAlive() then return end
	if pplayer:GetCapitalCity() == nil then return end
	if pplayer:GetBuildingClassCount(iPopulationBuilding) > math.floor(pplayer:GetTotalPopulation()/((pplayer:GetCurrentEra()+5)*5)) then
		for pCity in pplayer:Cities() do
			pCity:SetNumRealBuilding(iPopulationBuilding, 0)
		end
	end
	pplayer:GetCapitalCity():SetNumRealBuilding(iPopulationBuilding, math.floor(pplayer:GetTotalPopulation()/((pplayer:GetCurrentEra()+5)*5)))
end

GameEvents.PlayerDoTurn.Add(OnTheCapitalNextTurn)