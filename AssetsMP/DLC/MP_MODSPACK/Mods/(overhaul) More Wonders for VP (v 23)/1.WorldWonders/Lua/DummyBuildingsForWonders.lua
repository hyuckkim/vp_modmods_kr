print("Loading DummyBuildingsForWonders.lua from MWfVP")
--------------------------------------------------------------
-- Orginal script for Kronborg was created by LeeS 
-- Dec 13, 2017: Retrofitted for Vox Populi, Infixo
-- Jan 14, 2020: Improved, adan_eslavo
--------------------------------------------------------------
local eUnitClassCaravan = GameInfoTypes.UNITCLASS_CARAVAN
local eUnitClassCargo = GameInfoTypes.UNITCLASS_CARGO_SHIP
local eClassWalls = "BUILDINGCLASS_WALLS"

local g_tWorldWonder = {
	GameInfoTypes["BUILDING_CHEVALIERS"],
	GameInfoTypes["BUILDING_ITSUKUSHIMA"],
	GameInfoTypes["BUILDING_QALHAT"],
	GameInfoTypes["BUILDING_GATE_OF_SUN"],
	GameInfoTypes["BUILDING_GREAT_ZIMBABWE"],
	GameInfoTypes["BUILDING_KILWA_KISIWANI"],
	GameInfoTypes["BUILDING_MARAE"],
	GameInfoTypes["BUILDING_KUK"],
	GameInfoTypes["BUILDING_ST_PETERS"],
	GameInfoTypes["BUILDING_PANAMA_CANAL"],
	GameInfoTypes["BUILDING_JUMEIRAH"],
	GameInfoTypes["BUILDING_ARECIBO"],
	GameInfoTypes["BUILDING_ROCKEFELLER"],
	GameInfoTypes["BUILDING_DARJEELING"],
	GameInfoTypes["BUILDING_SANBO"],
	GameInfoTypes["BUILDING_AUTOBAHN"],
	GameInfoTypes["BUILDING_INTERSTATE"],
	GameInfoTypes["BUILDING_MUSEUM_ISLAND"],
	GameInfoTypes["BUILDING_CURIOSITY"],
	GameInfoTypes["BUILDING_SEED_VAULT"],
	GameInfoTypes["BUILDING_TEMBLEQUE"]
}

local g_tWorldWonderDummy = {
	GameInfoTypes["BUILDING_CHEVALIERS_DUMMY"],
	GameInfoTypes["BUILDING_ITSUKUSHIMA_DUMMY"],
	GameInfoTypes["BUILDING_QALHAT_DUMMY"],
	GameInfoTypes["BUILDING_GATE_OF_SUN_DUMMY"],
	GameInfoTypes["BUILDING_GREAT_ZIMBABWE_DUMMY"],
	GameInfoTypes["BUILDING_KILWA_KISIWANI_DUMMY"],
	GameInfoTypes["BUILDING_MARAE_DUMMY"],
	GameInfoTypes["BUILDING_KUK_DUMMY"],
	GameInfoTypes["BUILDING_ST_PETERS_DUMMY"],
	GameInfoTypes["BUILDING_PANAMA_CANAL_DUMMY"],
	GameInfoTypes["BUILDING_JUMEIRAH_DUMMY"],
	GameInfoTypes["BUILDING_ARECIBO_DUMMY"],
	GameInfoTypes["BUILDING_ROCKEFELLER_DUMMY"],
	GameInfoTypes["BUILDING_DARJEELING_DUMMY"],
	GameInfoTypes["BUILDING_SANBO_DUMMY"],
	GameInfoTypes["BUILDING_AUTOBAHN_DUMMY"],
	GameInfoTypes["BUILDING_INTERSTATE_DUMMY"],
	GameInfoTypes["BUILDING_MUSEUM_ISLAND_DUMMY"],
	GameInfoTypes["BUILDING_CURIOSITY_DUMMY"],
	GameInfoTypes["BUILDING_SEED_VAULT_DUMMY"],
	GameInfoTypes["BUILDING_TEMBLEQUE_DUMMY"]
}

local g_iWonderWithDummies = #g_tWorldWonderDummy

local g_tWorldWonderDummy2 = {}
	for i = 1, g_iWonderWithDummies do
		g_tWorldWonderDummy2[i] = false
	end
	g_tWorldWonderDummy2[15] = GameInfoTypes["BUILDING_SANBO_2_DUMMY"]

local g_tWorldWonderExists = {}
	for i = 1, g_iWonderWithDummies do
		g_tWorldWonderExists[i] = false
	end

local g_tWorldWonderOwner = {}

-- Chevaliers (1)
-- Itsukushima (2)
-- Qalhat (3)
-- Gate of the Sun (4)
-- Great Zimbabwe (5)
-- Kilwa Kisiwani (6)
-- Marae Arahurahu (7)
-- Kuk Swamp (8)
-- St. Peter's Basilica (9)
-- Panama Canal (10)
-- Palm Jumeirah (11)
-- Arecibo Observatory (12)
-- Rockefeller Center (13)
-- Darjeeling Himalayan Railway (14)
-- Sanbo Honbu (15)
-- Autobahn (16)
-- Interstate (17)
-- Museum Island (18)
-- Curiosity Rover (19)
-- Svalbard Global Seed Vault (20)
-- Aqueduct of Padre Tembleque (21)

-- load game and check if they are built
function WasWonderAlreadyBuilt()
	for i = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
		local pPlayer = Players[i]
	
		if pPlayer:IsEverAlive() then
			for city in pPlayer:Cities() do
				for j, building in ipairs(g_tWorldWonder) do
					if city:IsHasBuilding(g_tWorldWonder[j]) then
						g_tWorldWonderExists[j] = true
						g_tWorldWonderOwner[j] = i
					end
				end
			end
		end
	end
end
Events.LoadScreenClose.Add(WasWonderAlreadyBuilt)

-- check if wonder was built
function IsWonderConstructed(ePlayer, eCity, eBuilding, bGold, bFaith) 
	if not g_tWorldWonderExists[1] then	
		if eBuilding == g_tWorldWonder[1] then
			g_tWorldWonderExists[1] = true
			g_tWorldWonderOwner[1] = ePlayer
			
			local pPlayer = Players[ePlayer]
		
			for city in pPlayer:Cities() do
				if not city:IsCoastal(10) and not city:IsHasBuilding(g_tWorldWonder[1]) then
					city:SetNumRealBuilding(g_tWorldWonderDummy[1], 1)
				end
			end
		end
	end

	if not g_tWorldWonderExists[2] then	
		if eBuilding == g_tWorldWonder[2] then
			g_tWorldWonderExists[2] = true
			g_tWorldWonderOwner[2] = ePlayer
			
			local pPlayer = Players[ePlayer]
		
			for city in pPlayer:Cities() do
				if city:IsCoastal(10) then
					city:SetNumRealBuilding(g_tWorldWonderDummy[2], 1)
				end
			end
		end
	end

	if not g_tWorldWonderExists[3] then
		if eBuilding == g_tWorldWonder[3] then
			g_tWorldWonderExists[3] = true
			g_tWorldWonderOwner[3] = ePlayer
			
			local pPlayer = Players[ePlayer]
			local pCity = pPlayer:GetCityByID(eCity)
			local iSeaTradeRoutesWithMajors = 0

			for _, player in ipairs(Players) do
				if player:IsAlive() then
					for _, tradeRoute in ipairs(player:GetTradeRoutes()) do
						if ((tradeRoute.FromID == ePlayer and not Players[tradeRoute.ToID]:IsMinorCiv()) 
						or (tradeRoute.ToID == ePlayer and not Players[tradeRoute.FromID]:IsMinorCiv())) 
						and tradeRoute.FromID ~= tradeRoute.ToID 
						and tradeRoute.Domain == GameInfoTypes.DOMAIN_SEA then
							iSeaTradeRoutesWithMajors = iSeaTradeRoutesWithMajors + 1
						end
					end
				end
			end

			pCity:SetNumRealBuilding(g_tWorldWonderDummy[3], iSeaTradeRoutesWithMajors)
			
			--[[		
			Domain - DomainTypes.DOMAIN_LAND or DomainTypes.DOMAIN_SEA (int)
			TurnsLeft - turns left before the trade route can be reassigned (int)
			FromCivilizationType - eg GameInfoTypes.CIVILIZATION_ENGLAND (int)
			FromID - from player ID (int)
			FromCityName - from city name (string)
			FromCity - from city (Lua pCity object)
			ToCivilizationType - to player civ type (int)
			ToID - to player ID (int)
			ToCityName - to city name (string)
			ToCity - to city (Lua pCity object)
			FromGPT - route yield (int)
			ToGPT - route yield (int)
			ToFood - route yield (int)
			ToProduction - route yield (int)
			FromScience - route yield (int)
			ToScience - route yield (int)
			ToReligion - to religion type (or -1) (int)
			ToPressure - to pressure (int)
			FromReligion - from religion type (or -1) (int)
			FromPressure - from pressure (int)
			FromTourism - from tourism (int)
			ToTourism - to tourism (int)
			--]]
		end
	end

	if eBuilding == g_tWorldWonder[4] then
		g_tWorldWonderExists[4] = true
		g_tWorldWonderOwner[4] = ePlayer
			
		local pPlayer = Players[ePlayer]
		
		for city in pPlayer:Cities() do
			for building in GameInfo.Buildings{BuildingClass=eClassWalls} do	
				if city:IsHasBuilding(building.Type) then
					city:SetNumRealBuilding(g_tWorldWonderDummy[4], 1)
					break
				end
			end
		end
	else
		if g_tWorldWonderExists[4] and g_tWorldWonderOwner[4] == ePlayer then
			for building in GameInfo.Buildings{BuildingClass=eClassWalls} do
				if eBuilding == building.ID then
					local pPlayer = Players[ePlayer]
					local pCity = pPlayer:GetCityByID(eCity)
					
					pCity:SetNumRealBuilding(g_tWorldWonderDummy[4], 1)
					break
				end
			end
		end
	end

	if not g_tWorldWonderExists[5] then
		if eBuilding == g_tWorldWonder[5] then
			g_tWorldWonderExists[5] = true
			g_tWorldWonderOwner[5] = ePlayer
			
			local pPlayer = Players[ePlayer]
			local pCity = pPlayer:GetCityByID(eCity)
			local iActiveTradeRoutes = 0

			for _, player in ipairs(Players) do
				if player:IsAlive() then
					for _, tradeRoute in ipairs(player:GetTradeRoutes()) do
						if tradeRoute.FromID == ePlayer then
							iActiveTradeRoutes = iActiveTradeRoutes + 1
						end
					end
				end
			end

			pCity:SetNumRealBuilding(g_tWorldWonderDummy[5], iActiveTradeRoutes)
		end
	end

	if not g_tWorldWonderExists[6] then	
		if eBuilding == g_tWorldWonder[6] then
			g_tWorldWonderExists[6] = true
			g_tWorldWonderOwner[6] = ePlayer
			
			local pPlayer = Players[ePlayer]
			local pCity = pPlayer:GetCityByID(eCity)

			pCity:SetNumRealBuilding(g_tWorldWonderDummy[6], 1)
		end
	end

	if not g_tWorldWonderExists[7] then	
		if eBuilding == g_tWorldWonder[7] then
			g_tWorldWonderExists[7] = true
			g_tWorldWonderOwner[7] = ePlayer
			
			local pPlayer = Players[ePlayer]
			local pCity = pPlayer:GetCityByID(eCity)

			pCity:SetNumRealBuilding(g_tWorldWonderDummy[7], 1)
		end
	end

	if not g_tWorldWonderExists[8] then	
		if eBuilding == g_tWorldWonder[8] then
			g_tWorldWonderExists[8] = true
			g_tWorldWonderOwner[8] = ePlayer
			
			local pPlayer = Players[ePlayer]
		
			for city in pPlayer:Cities() do
				city:SetNumRealBuilding(g_tWorldWonderDummy[8], 1)
			end
		end
	end

	if not g_tWorldWonderExists[9] then	
		if eBuilding == g_tWorldWonder[9] then
			g_tWorldWonderExists[9] = true
			g_tWorldWonderOwner[9] = ePlayer
			
			local pPlayer = Players[ePlayer]
			local pCity = pPlayer:GetCityByID(eCity)

			pCity:SetNumRealBuilding(g_tWorldWonderDummy[9], 1)
		end
	end

	if not g_tWorldWonderExists[10] then	
		if eBuilding == g_tWorldWonder[10] then
			g_tWorldWonderExists[10] = true
			g_tWorldWonderOwner[10] = ePlayer
			
			local pPlayer = Players[ePlayer]
		
			for city in pPlayer:Cities() do
				if city:IsCoastal(10) then
					city:SetNumRealBuilding(g_tWorldWonderDummy[10], 1)
				end
			end
		end
	end

	if not g_tWorldWonderExists[11] then	
		if eBuilding == g_tWorldWonder[11] then
			g_tWorldWonderExists[11] = true
			g_tWorldWonderOwner[11] = ePlayer
			
			local pPlayer = Players[ePlayer]
		
			for city in pPlayer:Cities() do
				city:SetNumRealBuilding(g_tWorldWonderDummy[11], 1)
			end
		end
	end

	if not g_tWorldWonderExists[12] then	
		if eBuilding == g_tWorldWonder[12] then
			g_tWorldWonderExists[12] = true
			g_tWorldWonderOwner[12] = ePlayer
			
			local pPlayer = Players[ePlayer]
		
			for city in pPlayer:Cities() do
				city:SetNumRealBuilding(g_tWorldWonderDummy[12], 1)
			end
		end
	end
	
	if not g_tWorldWonderExists[13] then	
		if eBuilding == g_tWorldWonder[13] then
			g_tWorldWonderExists[13] = true
			g_tWorldWonderOwner[13] = ePlayer
			
			local pPlayer = Players[ePlayer]
		
			for city in pPlayer:Cities() do
				city:SetNumRealBuilding(g_tWorldWonderDummy[13], 1)
			end
		end
	end
	
	if not g_tWorldWonderExists[14] then	
		if eBuilding == g_tWorldWonder[14] then
			g_tWorldWonderExists[14] = true
			g_tWorldWonderOwner[14] = ePlayer
			
			local pPlayer = Players[ePlayer]
		
			for city in pPlayer:Cities() do
				city:SetNumRealBuilding(g_tWorldWonderDummy[14], 1)
			end
		end
	end

	if not g_tWorldWonderExists[15] then	
		if eBuilding == g_tWorldWonder[15] then
			g_tWorldWonderExists[15] = true
			g_tWorldWonderOwner[15] = ePlayer
			
			local pPlayer = Players[ePlayer]
			local pCity = pPlayer:GetCityByID(eCity)

			pCity:SetNumRealBuilding(g_tWorldWonderDummy[15], 1)

			if g_tWorldWonderDummy2[15] then
				pCity:SetNumRealBuilding(g_tWorldWonderDummy2[15], 1)
			end
		end
	end
	
	if not g_tWorldWonderExists[16] then	
		if eBuilding == g_tWorldWonder[16] then
			g_tWorldWonderExists[16] = true
			g_tWorldWonderOwner[16] = ePlayer
			
			local pPlayer = Players[ePlayer]
		
			for city in pPlayer:Cities() do
				city:SetNumRealBuilding(g_tWorldWonderDummy[16], 1)
			end
		end
	end
	
	if not g_tWorldWonderExists[17] then	
		if eBuilding == g_tWorldWonder[17] then
			g_tWorldWonderExists[17] = true
			g_tWorldWonderOwner[17] = ePlayer
			
			local pPlayer = Players[ePlayer]
		
			for city in pPlayer:Cities() do
				city:SetNumRealBuilding(g_tWorldWonderDummy[17], 1)
			end
		end
	end

	if not g_tWorldWonderExists[18] then	
		if eBuilding == g_tWorldWonder[18] then
			g_tWorldWonderExists[18] = true
			g_tWorldWonderOwner[18] = ePlayer
			
			local pPlayer = Players[ePlayer]
		
			for city in pPlayer:Cities() do
				city:SetNumRealBuilding(g_tWorldWonderDummy[18], 1)
			end
		end
	end

	if not g_tWorldWonderExists[19] then	
		if eBuilding == g_tWorldWonder[19] then
			g_tWorldWonderExists[19] = true
			g_tWorldWonderOwner[19] = ePlayer
			
			local pPlayer = Players[ePlayer]
			local pCity = pPlayer:GetCityByID(eCity)
			local pTeam = Teams[pPlayer:GetTeam()]
			local iCountResearchAgreements = 0
			local tCheckedTeams = {}

			for i = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
				local pTargetPlayer = Players[i]

				if not pTargetPlayer:IsEverAlive() then break end
				
				local eTargetTeam = pTargetPlayer:GetTeam()

				if pTeam:IsHasResearchAgreement(eTargetTeam) and not tCheckedTeams[eTargetTeam] then
					iCountResearchAgreements = iCountResearchAgreements + 1
					tCheckedTeams[eTargetTeam] = true
				end
			end

			pCity:SetNumRealBuilding(g_tWorldWonderDummy[19], iCountResearchAgreements)
		end
	end

	if not g_tWorldWonderExists[20] then	
		if eBuilding == g_tWorldWonder[20] then
			g_tWorldWonderExists[20] = true
			g_tWorldWonderOwner[20] = ePlayer
			
			local pPlayer = Players[ePlayer]
		
			for city in pPlayer:Cities() do
				city:SetNumRealBuilding(g_tWorldWonderDummy[20], 1)
			end
		end
	end

	if not g_tWorldWonderExists[21] then	
		if eBuilding == g_tWorldWonder[21] then
			g_tWorldWonderExists[21] = true
			g_tWorldWonderOwner[21] = ePlayer
			
			local pPlayer = Players[ePlayer]
		
			for city in pPlayer:Cities() do
				city:SetNumRealBuilding(g_tWorldWonderDummy[21], 1)
			end
		end
	end
end
GameEvents.CityConstructed.Add(IsWonderConstructed)

-- check if wonder conquered by another player
function CheckForWonderAfterCapture(eOldOwner, bIsCapital, iX, iY, eNewOwner, iPop, bConquest)
	if g_tWorldWonderExists[1] then	
		local pPlot = Map.GetPlot(iX, iY)
		local pConqCity = pPlot:GetWorkingCity()
		
		if pConqCity:IsHasBuilding(g_tWorldWonder[1]) then
			local pOldOwner = Players[eOldOwner]
			
			for city in pOldOwner:Cities() do
				city:SetNumRealBuilding(g_tWorldWonderDummy[1], 0)
			end
			
			local pNewOwner = Players[eNewOwner]
			g_tWorldWonderOwner[1] = eNewOwner
			
			for city in pNewOwner:Cities() do
				if not city:IsCoastal(10) and not city:IsHasBuilding(g_tWorldWonder[1]) then
					city:SetNumRealBuilding(g_tWorldWonderDummy[1], 1)
				end
			end		
		else
			if eNewOwner == g_tWorldWonderOwner[1] and not pConqCity:IsCoastal(10) then
				pConqCity:SetNumRealBuilding(g_tWorldWonderDummy[1], 1)
			elseif eNewOwner ~= g_tWorldWonderOwner[1] then
				pConqCity:SetNumRealBuilding(g_tWorldWonderDummy[1], 0)
			end
		end
	end
	
	if g_tWorldWonderExists[2] then	
		local pPlot = Map.GetPlot(iX, iY)
		local pConqCity = pPlot:GetWorkingCity()
		
		if pConqCity:IsHasBuilding(g_tWorldWonder[2]) then
			local pOldOwner = Players[eOldOwner]
			
			for city in pOldOwner:Cities() do
				city:SetNumRealBuilding(g_tWorldWonderDummy[2], 0)
			end
			
			local pNewOwner = Players[eNewOwner]
			g_tWorldWonderOwner[2] = eNewOwner
			
			for city in pNewOwner:Cities() do
				if city:IsCoastal(10) then
					city:SetNumRealBuilding(g_tWorldWonderDummy[2], 1)
				end
			end		
		else
			if eNewOwner == g_tWorldWonderOwner[2] and pConqCity:IsCoastal(10) then
				pConqCity:SetNumRealBuilding(g_tWorldWonderDummy[2], 1)
			elseif eNewOwner ~= g_tWorldWonderOwner[2] then
				pConqCity:SetNumRealBuilding(g_tWorldWonderDummy[2], 0)
			end
		end
	end

	if g_tWorldWonderExists[3] then	
		local pPlot = Map.GetPlot(iX, iY)
		local pConqCity = pPlot:GetWorkingCity()
		
		if pConqCity:IsHasBuilding(g_tWorldWonder[3]) then
			g_tWorldWonderOwner[3] = eNewOwner
			local iSeaTradeRoutesWithMajors = 0
			
			for _, player in ipairs(Players) do
				if player:IsAlive() then
					for _, tradeRoute in ipairs(player:GetTradeRoutes()) do
						if ((tradeRoute.FromID == eNewOwner and not Players[tradeRoute.ToID]:IsMinorCiv()) 
						or (tradeRoute.ToID == eNewOwner and not Players[tradeRoute.FromID]:IsMinorCiv())) 
						and tradeRoute.FromID ~= tradeRoute.ToID 
						and tradeRoute.Domain == GameInfoTypes.DOMAIN_SEA then
							iSeaTradeRoutesWithMajors = iSeaTradeRoutesWithMajors + 1
						end
					end
				end
			end

			pConqCity:SetNumRealBuilding(g_tWorldWonderDummy[3], iSeaTradeRoutesWithMajors)
		end
	end

	if g_tWorldWonderExists[4] then	
		local pPlot = Map.GetPlot(iX, iY)
		local pConqCity = pPlot:GetWorkingCity()
		
		if pConqCity:IsHasBuilding(g_tWorldWonder[4]) then
			local pOldOwner = Players[eOldOwner]
			
			for city in pOldOwner:Cities() do
				city:SetNumRealBuilding(g_tWorldWonderDummy[4], 0)
			end
			
			local pNewOwner = Players[eNewOwner]
			g_tWorldWonderOwner[4] = eNewOwner
			
			for city in pNewOwner:Cities() do
				for building in GameInfo.Buildings{BuildingClass=eClassWalls} do	
					if city:IsHasBuilding(building.Type) then
						city:SetNumRealBuilding(g_tWorldWonderDummy[4], 1)
						break
					end
				end
			end		
		else
			for building in GameInfo.Buildings{BuildingClass=eClassWalls} do	
				if eNewOwner == g_tWorldWonderOwner[4] and pConqCity:IsHasBuilding(building.Type) then
					pConqCity:SetNumRealBuilding(g_tWorldWonderDummy[4], 1)
					break
				elseif eNewOwner ~= g_tWorldWonderOwner[4] then
					pConqCity:SetNumRealBuilding(g_tWorldWonderDummy[4], 0)
					break
				end
			end
		end
	end

	if g_tWorldWonderExists[5] then	
		local pPlot = Map.GetPlot(iX, iY)
		local pConqCity = pPlot:GetWorkingCity()
		
		if pConqCity:IsHasBuilding(g_tWorldWonder[5]) then
			g_tWorldWonderOwner[5] = eNewOwner
			local iActiveTradeRoutes = 0
			
			for _, player in ipairs(Players) do
				if player:IsAlive() then
					for _, tradeRoute in ipairs(player:GetTradeRoutes()) do
						if tradeRoute.FromID == ePlayer then
							iActiveTradeRoutes = iActiveTradeRoutes + 1
						end
					end
				end
			end

			pConqCity:SetNumRealBuilding(g_tWorldWonderDummy[5], iActiveTradeRoutes)
		end
	end

	if g_tWorldWonderExists[6] then	
		local pPlot = Map.GetPlot(iX, iY)
		local pConqCity = pPlot:GetWorkingCity()
		
		if pConqCity:IsHasBuilding(g_tWorldWonder[6]) then
			g_tWorldWonderOwner[6] = eNewOwner
			
			pConqCity:SetNumRealBuilding(g_tWorldWonderDummy[6], 1)
		end
	end

	if g_tWorldWonderExists[7] then	
		local pPlot = Map.GetPlot(iX, iY)
		local pConqCity = pPlot:GetWorkingCity()
		
		if pConqCity:IsHasBuilding(g_tWorldWonder[7]) then
			g_tWorldWonderOwner[7] = eNewOwner
			
			pConqCity:SetNumRealBuilding(g_tWorldWonderDummy[7], 1)
		end
	end

	if g_tWorldWonderExists[8] then	
		local pPlot = Map.GetPlot(iX, iY)
		local pConqCity = pPlot:GetWorkingCity()
		
		if pConqCity:IsHasBuilding(g_tWorldWonder[8]) then
			local pOldOwner = Players[eOldOwner]
			
			for city in pOldOwner:Cities() do
				city:SetNumRealBuilding(g_tWorldWonderDummy[8], 0)
			end
			
			local pNewOwner = Players[eNewOwner]
			g_tWorldWonderOwner[8] = eNewOwner
			
			for city in pNewOwner:Cities() do
				city:SetNumRealBuilding(g_tWorldWonderDummy[8], 1)
			end		
		else
			if eNewOwner == g_tWorldWonderOwner[8] then
				pConqCity:SetNumRealBuilding(g_tWorldWonderDummy[8], 1)
			else
				pConqCity:SetNumRealBuilding(g_tWorldWonderDummy[8], 0)
			end
		end
	end

	if g_tWorldWonderExists[9] then	
		local pPlot = Map.GetPlot(iX, iY)
		local pConqCity = pPlot:GetWorkingCity()
		
		if pConqCity:IsHasBuilding(g_tWorldWonder[9]) then
			g_tWorldWonderOwner[9] = eNewOwner
			
			pConqCity:SetNumRealBuilding(g_tWorldWonderDummy[9], 1)
		end
	end

	if g_tWorldWonderExists[10] then	
		local pPlot = Map.GetPlot(iX, iY)
		local pConqCity = pPlot:GetWorkingCity()
		
		if pConqCity:IsHasBuilding(g_tWorldWonder[10]) then
			local pOldOwner = Players[eOldOwner]
			
			for city in pOldOwner:Cities() do
				city:SetNumRealBuilding(g_tWorldWonderDummy[10], 0)
			end
			
			local pNewOwner = Players[eNewOwner]
			g_tWorldWonderOwner[10] = eNewOwner
			
			for city in pNewOwner:Cities() do
				if city:IsCoastal(10) then
					city:SetNumRealBuilding(g_tWorldWonderDummy[10], 1)
				end
			end		
		else
			if eNewOwner == g_tWorldWonderOwner[10] and pConqCity:IsCoastal(10) then
				pConqCity:SetNumRealBuilding(g_tWorldWonderDummy[10], 1)
			elseif eNewOwner ~= g_tWorldWonderOwner[10] then
				pConqCity:SetNumRealBuilding(g_tWorldWonderDummy[10], 0)
			end
		end
	end

	if g_tWorldWonderExists[11] then	
		local pPlot = Map.GetPlot(iX, iY)
		local pConqCity = pPlot:GetWorkingCity()
		
		if pConqCity:IsHasBuilding(g_tWorldWonder[11]) then
			local pOldOwner = Players[eOldOwner]
			
			for city in pOldOwner:Cities() do
				city:SetNumRealBuilding(g_tWorldWonderDummy[11], 0)
			end
			
			local pNewOwner = Players[eNewOwner]
			g_tWorldWonderOwner[11] = eNewOwner
			
			for city in pNewOwner:Cities() do
				city:SetNumRealBuilding(g_tWorldWonderDummy[11], 1)
			end		
		else
			if eNewOwner == g_tWorldWonderOwner[11] then
				pConqCity:SetNumRealBuilding(g_tWorldWonderDummy[11], 1)
			else
				pConqCity:SetNumRealBuilding(g_tWorldWonderDummy[11], 0)
			end
		end
	end

	if g_tWorldWonderExists[12] then	
		local pPlot = Map.GetPlot(iX, iY)
		local pConqCity = pPlot:GetWorkingCity()
		
		if pConqCity:IsHasBuilding(g_tWorldWonder[12]) then
			local pOldOwner = Players[eOldOwner]
			
			for city in pOldOwner:Cities() do
				city:SetNumRealBuilding(g_tWorldWonderDummy[12], 0)
			end
			
			local pNewOwner = Players[eNewOwner]
			g_tWorldWonderOwner[12] = eNewOwner
			
			for city in pNewOwner:Cities() do
				city:SetNumRealBuilding(g_tWorldWonderDummy[12], 1)
			end		
		else
			if eNewOwner == g_tWorldWonderOwner[12] then
				pConqCity:SetNumRealBuilding(g_tWorldWonderDummy[12], 1)
			else
				pConqCity:SetNumRealBuilding(g_tWorldWonderDummy[12], 0)
			end
		end
	end

	if g_tWorldWonderExists[13] then	
		local pPlot = Map.GetPlot(iX, iY)
		local pConqCity = pPlot:GetWorkingCity()
		
		if pConqCity:IsHasBuilding(g_tWorldWonder[13]) then
			local pOldOwner = Players[eOldOwner]
			
			for city in pOldOwner:Cities() do
				city:SetNumRealBuilding(g_tWorldWonderDummy[13], 0)
			end
			
			local pNewOwner = Players[eNewOwner]
			g_tWorldWonderOwner[13] = eNewOwner
			
			for city in pNewOwner:Cities() do
				city:SetNumRealBuilding(g_tWorldWonderDummy[13], 1)
			end		
		else
			if eNewOwner == g_tWorldWonderOwner[13] then
				pConqCity:SetNumRealBuilding(g_tWorldWonderDummy[13], 1)
			else
				pConqCity:SetNumRealBuilding(g_tWorldWonderDummy[13], 0)
			end
		end
	end

	if g_tWorldWonderExists[14] then	
		local pPlot = Map.GetPlot(iX, iY)
		local pConqCity = pPlot:GetWorkingCity()
		
		if pConqCity:IsHasBuilding(g_tWorldWonder[14]) then
			local pOldOwner = Players[eOldOwner]
			
			for city in pOldOwner:Cities() do
				city:SetNumRealBuilding(g_tWorldWonderDummy[14], 0)
			end
			
			local pNewOwner = Players[eNewOwner]
			g_tWorldWonderOwner[14] = eNewOwner
			
			for city in pNewOwner:Cities() do
				city:SetNumRealBuilding(g_tWorldWonderDummy[14], 1)
			end		
		else
			if eNewOwner == g_tWorldWonderOwner[14] then
				pConqCity:SetNumRealBuilding(g_tWorldWonderDummy[14], 1)
			else
				pConqCity:SetNumRealBuilding(g_tWorldWonderDummy[14], 0)
			end
		end
	end

	if g_tWorldWonderExists[15] then	
		local pPlot = Map.GetPlot(iX, iY)
		local pConqCity = pPlot:GetWorkingCity()
		
		if pConqCity:IsHasBuilding(g_tWorldWonder[15]) then
			g_tWorldWonderOwner[15] = eNewOwner
			
			pConqCity:SetNumRealBuilding(g_tWorldWonderDummy[15], 1)
		end
	end

	if g_tWorldWonderExists[16] then	
		local pPlot = Map.GetPlot(iX, iY)
		local pConqCity = pPlot:GetWorkingCity()
		
		if pConqCity:IsHasBuilding(g_tWorldWonder[16]) then
			local pOldOwner = Players[eOldOwner]
			
			for city in pOldOwner:Cities() do
				city:SetNumRealBuilding(g_tWorldWonderDummy[16], 0)
			end
			
			local pNewOwner = Players[eNewOwner]
			g_tWorldWonderOwner[16] = eNewOwner
			
			for city in pNewOwner:Cities() do
				city:SetNumRealBuilding(g_tWorldWonderDummy[16], 1)
			end		
		else
			if eNewOwner == g_tWorldWonderOwner[16] then
				pConqCity:SetNumRealBuilding(g_tWorldWonderDummy[16], 1)
			else
				pConqCity:SetNumRealBuilding(g_tWorldWonderDummy[16], 0)
			end
		end
	end

	if g_tWorldWonderExists[18] then	
		local pPlot = Map.GetPlot(iX, iY)
		local pConqCity = pPlot:GetWorkingCity()
		
		if pConqCity:IsHasBuilding(g_tWorldWonder[18]) then
			local pOldOwner = Players[eOldOwner]
			
			for city in pOldOwner:Cities() do
				city:SetNumRealBuilding(g_tWorldWonderDummy[18], 0)
			end
			
			local pNewOwner = Players[eNewOwner]
			g_tWorldWonderOwner[18] = eNewOwner
			
			for city in pNewOwner:Cities() do
				city:SetNumRealBuilding(g_tWorldWonderDummy[18], 1)
			end		
		else
			if eNewOwner == g_tWorldWonderOwner[18] then
				pConqCity:SetNumRealBuilding(g_tWorldWonderDummy[18], 1)
			else
				pConqCity:SetNumRealBuilding(g_tWorldWonderDummy[18], 0)
			end
		end
	end

	if g_tWorldWonderExists[19] then	
		local pPlot = Map.GetPlot(iX, iY)
		local pConqCity = pPlot:GetWorkingCity()
		
		if pConqCity:IsHasBuilding(g_tWorldWonder[19]) then
			local pPlayer = Players[ePlayer]
			local pTeam = Teams[pPlayer:GetTeam()]
			local iCountResearchAgreements = 0
			local tCheckedTeams = {}

			for i = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
				local pTargetPlayer = Players[i]

				if not pTargetPlayer:IsEverAlive() then break end
				
				local eTargetTeam = pTargetPlayer:GetTeam()

				if pTeam:IsHasResearchAgreement(eTargetTeam) and not tCheckedTeams[eTargetTeam] then
					iCountResearchAgreements = iCountResearchAgreements + 1
					tCheckedTeams[eTargetTeam] = true
				end
			end

			pConqCity:SetNumRealBuilding(g_tWorldWonderDummy[19], iCountResearchAgreements)
		end
	end

	if g_tWorldWonderExists[20] then	
		local pPlot = Map.GetPlot(iX, iY)
		local pConqCity = pPlot:GetWorkingCity()
		
		if pConqCity:IsHasBuilding(g_tWorldWonder[20]) then
			local pOldOwner = Players[eOldOwner]
			
			for city in pOldOwner:Cities() do
				city:SetNumRealBuilding(g_tWorldWonderDummy[20], 0)
			end
			
			local pNewOwner = Players[eNewOwner]
			g_tWorldWonderOwner[20] = eNewOwner
			
			for city in pNewOwner:Cities() do
				city:SetNumRealBuilding(g_tWorldWonderDummy[20], 1)
			end		
		else
			if eNewOwner == g_tWorldWonderOwner[20] then
				pConqCity:SetNumRealBuilding(g_tWorldWonderDummy[20], 1)
			else
				pConqCity:SetNumRealBuilding(g_tWorldWonderDummy[20], 0)
			end
		end
	end

	if g_tWorldWonderExists[21] then	
		local pPlot = Map.GetPlot(iX, iY)
		local pConqCity = pPlot:GetWorkingCity()
		
		if pConqCity:IsHasBuilding(g_tWorldWonder[21]) then
			local pOldOwner = Players[eOldOwner]
			
			for city in pOldOwner:Cities() do
				city:SetNumRealBuilding(g_tWorldWonderDummy[21], 0)
			end
			
			local pNewOwner = Players[eNewOwner]
			g_tWorldWonderOwner[21] = eNewOwner
			
			for city in pNewOwner:Cities() do
				city:SetNumRealBuilding(g_tWorldWonderDummy[21], 1)
			end		
		else
			if eNewOwner == g_tWorldWonderOwner[21] then
				pConqCity:SetNumRealBuilding(g_tWorldWonderDummy[21], 1)
			else
				pConqCity:SetNumRealBuilding(g_tWorldWonderDummy[21], 0)
			end
		end
	end
end
GameEvents.CityCaptureComplete.Add(CheckForWonderAfterCapture)

-- check if new city has effects
function BuildDummyInNewCity(ePlayer, iX, iY)
	if g_tWorldWonderExists[1] then
		if ePlayer == g_tWorldWonderOwner[1] then
			local pPlot = Map.GetPlot(iX, iY)
			local pCity = pPlot:GetWorkingCity()
			
			if not pCity:IsCoastal(10) then
				pCity:SetNumRealBuilding(g_tWorldWonderDummy[1], 1)
			end
		end
	end

	if g_tWorldWonderExists[2] then
		if ePlayer == g_tWorldWonderOwner[2] then
			local pPlot = Map.GetPlot(iX, iY)
			local pCity = pPlot:GetWorkingCity()
			
			if pCity:IsCoastal(10) then
				pCity:SetNumRealBuilding(g_tWorldWonderDummy[2], 1)
			end
		end
	end

	if g_tWorldWonderExists[4] then
		if ePlayer == g_tWorldWonderOwner[4] then
			local pPlot = Map.GetPlot(iX, iY)
			local pCity = pPlot:GetWorkingCity()
			
			for building in GameInfo.Buildings{BuildingClass=eClassWalls} do	
				if pCity:IsHasBuilding(building.Type) then
					pCity:SetNumRealBuilding(g_tWorldWonderDummy[4], 1)
					break
				end
			end
		end
	end

	if g_tWorldWonderExists[8] then
		if ePlayer == g_tWorldWonderOwner[8] then
			local pPlot = Map.GetPlot(iX, iY)
			local pCity = pPlot:GetWorkingCity()
			
			pCity:SetNumRealBuilding(g_tWorldWonderDummy[8], 1)
		end
	end

	if g_tWorldWonderExists[10] then
		if ePlayer == g_tWorldWonderOwner[10] then
			local pPlot = Map.GetPlot(iX, iY)
			local pCity = pPlot:GetWorkingCity()
			
			if pCity:IsCoastal(10) then
				pCity:SetNumRealBuilding(g_tWorldWonderDummy[10], 1)
			end
		end
	end

	if g_tWorldWonderExists[11] then
		if ePlayer == g_tWorldWonderOwner[11] then
			local pPlot = Map.GetPlot(iX, iY)
			local pCity = pPlot:GetWorkingCity()
			
			pCity:SetNumRealBuilding(g_tWorldWonderDummy[11], 1)
		end
	end

	if g_tWorldWonderExists[12] then
		if ePlayer == g_tWorldWonderOwner[12] then
			local pPlot = Map.GetPlot(iX, iY)
			local pCity = pPlot:GetWorkingCity()
			
			pCity:SetNumRealBuilding(g_tWorldWonderDummy[12], 1)
		end
	end

	if g_tWorldWonderExists[13] then
		if ePlayer == g_tWorldWonderOwner[13] then
			local pPlot = Map.GetPlot(iX, iY)
			local pCity = pPlot:GetWorkingCity()
			
			pCity:SetNumRealBuilding(g_tWorldWonderDummy[13], 1)
		end
	end

	if g_tWorldWonderExists[14] then
		if ePlayer == g_tWorldWonderOwner[14] then
			local pPlot = Map.GetPlot(iX, iY)
			local pCity = pPlot:GetWorkingCity()
			
			pCity:SetNumRealBuilding(g_tWorldWonderDummy[14], 1)
		end
	end

	if g_tWorldWonderExists[16] then
		if ePlayer == g_tWorldWonderOwner[16] then
			local pPlot = Map.GetPlot(iX, iY)
			local pCity = pPlot:GetWorkingCity()
			
			pCity:SetNumRealBuilding(g_tWorldWonderDummy[16], 1)
		end
	end

	if g_tWorldWonderExists[18] then
		if ePlayer == g_tWorldWonderOwner[18] then
			local pPlot = Map.GetPlot(iX, iY)
			local pCity = pPlot:GetWorkingCity()
			
			pCity:SetNumRealBuilding(g_tWorldWonderDummy[18], 1)
		end
	end

	if g_tWorldWonderExists[20] then
		if ePlayer == g_tWorldWonderOwner[20] then
			local pPlot = Map.GetPlot(iX, iY)
			local pCity = pPlot:GetWorkingCity()
			
			pCity:SetNumRealBuilding(g_tWorldWonderDummy[20], 1)
		end
	end

	if g_tWorldWonderExists[21] then
		if ePlayer == g_tWorldWonderOwner[21] then
			local pPlot = Map.GetPlot(iX, iY)
			local pCity = pPlot:GetWorkingCity()
			
			pCity:SetNumRealBuilding(g_tWorldWonderDummy[21], 1)
		end
	end
end
GameEvents.PlayerCityFounded.Add(BuildDummyInNewCity)

-- check if unit action changed
function SetDummiesOnUnitActionChange(ePlayer, iUnit)
	if g_tWorldWonderExists[3] then
		if ePlayer == g_tWorldWonderOwner[3] then
			local pPlayer = Players[ePlayer]
			local pUnit = pPlayer:GetUnitByID(iUnit)
		
			if pUnit == nil then return end 	
		
			local iUnitClass = pUnit:GetUnitClassType()
		
			if iUnitClass ~= eUnitClassCargo then return end
		
			local iSeaTradeRoutesWithMajors = 0

			for _, player in ipairs(Players) do
				if player:IsAlive() then
					for city in player:Cities() do
						if city:IsHasBuilding(g_tWorldWonder[3]) then
							for _, trader in ipairs(Players) do
								if not trader:IsEverAlive() then break end
						
								for _, tradeRoute in ipairs(trader:GetTradeRoutes()) do
									if ((tradeRoute.FromID == player:GetID() and not Players[tradeRoute.ToID]:IsMinorCiv()) 
									or (tradeRoute.ToID == player:GetID() and not Players[tradeRoute.FromID]:IsMinorCiv())) 
									and tradeRoute.FromID ~= tradeRoute.ToID 
									and tradeRoute.Domain == GameInfoTypes.DOMAIN_SEA then
										iSeaTradeRoutesWithMajors = iSeaTradeRoutesWithMajors + 1
									end
								end
							end

							city:SetNumRealBuilding(g_tWorldWonderDummy[3], iSeaTradeRoutesWithMajors)
							return
						end
					end
				end
			end
		end
	end

	if g_tWorldWonderExists[5] then
		if ePlayer == g_tWorldWonderOwner[5] then
			local pPlayer = Players[ePlayer]
			local pUnit = pPlayer:GetUnitByID(iUnit)
			if pUnit == nil then return end 	
		
			local iUnitClass = pUnit:GetUnitClassType()
			
			if iUnitClass ~= eUnitClassCargo and iUnitClass ~= eUnitClassCaravan then return end
			
			local iActiveTradeRoutes = 0

			for _, player in ipairs(Players) do
				if player:IsAlive() then
					for city in player:Cities() do
						if city:IsHasBuilding(g_tWorldWonder[5]) then
							for _, trader in ipairs(Players) do
								if not trader:IsEverAlive() then break end
								
								for _, tradeRoute in ipairs(trader:GetTradeRoutes()) do
									if tradeRoute.FromID == ePlayer then
										iActiveTradeRoutes = iActiveTradeRoutes + 1
									end
								end
							end

							city:SetNumRealBuilding(g_tWorldWonderDummy[5], iActiveTradeRoutes)
							return
						end
					end
				end
			end
		end
	end
end
Events.UnitActionChanged.Add(SetDummiesOnUnitActionChange)

-- checks for promotion (SANBO)
function SetPromotionsOnCombatEnd(eAttackingPlayer, eAttackingUnit, iAttackerDamage, iAttackerFinalDamage, iAttackerMaxHP, eDefendingPlayer, eDefendingUnit, iDefenderDamage, iDefenderFinalDamage, iDefenderMaxHP, eInterceptingPlayer, eInterceptingUnit, iInterceptorDamage, iPlotX, iPlotY)
	if g_tWorldWonderExists[15] then
		if eAttackingPlayer == g_tWorldWonderOwner[15] then
			local pAttackingPlayer = Players[eAttackingPlayer]

			if pAttackingPlayer ~= nil then				
				local pAttackingUnit = pAttackingPlayer:GetUnitByID(eAttackingUnit)

				if pAttackingUnit ~= nil and pAttackingUnit:IsHasPromotion(GameInfoTypes.PROMOTION_SANBO_AIR) or pAttackingUnit:IsHasPromotion(GameInfoTypes.PROMOTION_SANBO_AIR_EFFECT) then
					local iUnitHP = pAttackingUnit:GetCurrHitPoints()
					local iUnitMaxHP = pAttackingUnit:GetMaxHitPoints()
					local fHPPercentage = 100 * iUnitHP / iUnitMaxHP
					
					if fHPPercentage <= 20 then
						pAttackingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_SANBO_AIR_EFFECT, true)
						pAttackingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_SANBO_AIR, false)
					else
						pAttackingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_SANBO_AIR, true)
						pAttackingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_SANBO_AIR_EFFECT, false)
					end
				end
			end
		elseif eDefendingPlayer == g_tWorldWonderOwner[15] then
			local pDefendingPlayer = Players[eDefendingPlayer]

			if pDefendingPlayer ~= nil then
				local pDefendingUnit = pDefendingPlayer:GetUnitByID(eDefendingUnit)

				if pDefendingUnit ~= nil and pDefendingUnit:IsHasPromotion(GameInfoTypes.PROMOTION_SANBO_AIR) or pDefendingUnit:IsHasPromotion(GameInfoTypes.PROMOTION_SANBO_AIR_EFFECT) then
					local iUnitHP = pDefendingUnit:GetCurrHitPoints()
					local iUnitMaxHP = pDefendingUnit:GetMaxHitPoints()
					local fHPPercentage = 100 * iUnitHP / iUnitMaxHP
					
					if fHPPercentage <= 20 then
						pDefendingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_SANBO_AIR_EFFECT, true)
						pDefendingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_SANBO_AIR, false)
					else
						pDefendingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_SANBO_AIR, true)
						pDefendingUnit:SetHasPromotion(GameInfoTypes.PROMOTION_SANBO_AIR_EFFECT, false)
					end
				end
			end
		end
	end
end
GameEvents.CombatEnded.Add(SetPromotionsOnCombatEnd)

function SetPromotionOnTurn(ePlayer)
	if g_tWorldWonderExists[15] then
		if ePlayer == g_tWorldWonderOwner[15] then
			local pPlayer = Players[ePlayer]
			
			for unit in pPlayer:Units() do
				if unit:IsHasPromotion(GameInfoTypes.PROMOTION_SANBO_AIR) or unit:IsHasPromotion(GameInfoTypes.PROMOTION_SANBO_AIR_EFFECT) then
					local iUnitHP = unit:GetCurrHitPoints()
					local iUnitMaxHP = unit:GetMaxHitPoints()
					local fHPPercentage = 100 * iUnitHP / iUnitMaxHP
					
					if fHPPercentage <= 20 then
						unit:SetHasPromotion(GameInfoTypes.PROMOTION_SANBO_AIR_EFFECT, true)
						unit:SetHasPromotion(GameInfoTypes.PROMOTION_SANBO_AIR, false)
					else
						unit:SetHasPromotion(GameInfoTypes.PROMOTION_SANBO_AIR, true)
						unit:SetHasPromotion(GameInfoTypes.PROMOTION_SANBO_AIR_EFFECT, false)
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(SetPromotionOnTurn)

-- Curiosity Rover Research Agreements check
function SetRAOnTurn(ePlayer)
	if g_tWorldWonderExists[19] then
		if g_tWorldWonderOwner[19] == ePlayer then		
			local pPlayer = Players[ePlayer]
			local pCity = pPlayer:GetCityByID(eCity)
			local pTeam = Teams[pPlayer:GetTeam()]
			local iCountResearchAgreements = 0
			local tCheckedTeams = {}

			for i = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
				local pTargetPlayer = Players[i]

				if not pTargetPlayer:IsEverAlive() then break end
				
				local eTargetTeam = pTargetPlayer:GetTeam()

				if pTeam:IsHasResearchAgreement(eTargetTeam) and not tCheckedTeams[eTargetTeam] then
					iCountResearchAgreements = iCountResearchAgreements + 1
					tCheckedTeams[eTargetTeam] = true
				end
			end

			pCity:SetNumRealBuilding(g_tWorldWonderDummy[19], iCountResearchAgreements)
		end
	end
end
GameEvents.PlayerDoTurn.Add(SetRAOnTurn)
--------------------------------------------------------------
--------------------------------------------------------------
print("Loaded DummyBuildingsForWonders.lua from MWfVP")
--------------------------------------------------------------
--------------------------------------------------------------