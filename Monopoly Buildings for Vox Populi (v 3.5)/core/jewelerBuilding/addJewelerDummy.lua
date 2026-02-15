-- addJewelerDummy
-- Author: IA
-- DateCreated: 5/30/2020 7:33:01 PM
--------------------------------------------------------------

local eJewelerBuilding = GameInfoTypes.BUILDING_IA_JEWELER
local eBuildingJewelerDummy = GameInfoTypes.BUILDING_IA_JEWELER_DUMMY
local eTechArchaeology = GameInfoTypes.TECH_ARCHAEOLOGY

--give jeweler dummy building when Archaeology is researched, and start checking every turn for Jeweler Buildings
function TechResearchedBuildJeweleryDummy(iTeam, iTech)
	local pTeam = Teams[iTeam]
	local pPlayer = Players[pTeam:GetLeaderID()]

	if not pPlayer then return end

	if iTech == eTechArchaeology then
		GameEvents.CityConstructed.Add(DummyBuildingAfterTech);
		local iNumberOfJewelers = pPlayer:CountNumBuildings(eJewelerBuilding)

		if iNumberOfJewelers > 0 then
			local iCurrentJeweler = 0

			for city in pPlayer:Cities() do
				if city:IsHasBuilding(eJewelerBuilding) then
					city:SetNumRealBuilding(eBuildingJewelerDummy, 1);
					iCurrentJeweler = iCurrentJeweler + 1
				
					if iCurrentJeweler == iNumberOfJewelers then
						break
					end
				end
			end
		end
	end
end


--give jeweler dummy building after Archaeology is researched
function DummyBuildingAfterTech(iPlayer, iCity, iBuilding, bGold, bFaith)
	local pPlayer = Players[iPlayer];
	local pCity = pPlayer:GetCityByID(iCity)

	if (iBuilding == eJewelerBuilding and Teams[pPlayer:GetTeam()]:IsHasTech(eTechArchaeology)) then
		pCity:SetNumRealBuilding(eBuildingJewelerDummy, 1)
	end
end

GameEvents.TeamTechResearched.Add(TechResearchedBuildJeweleryDummy);

