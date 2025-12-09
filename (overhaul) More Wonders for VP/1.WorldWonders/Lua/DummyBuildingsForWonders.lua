--------------------------------------------------------------
-- Orginal script for Kronborg was created by LeeS 
-- Dec 13, 2017: Retrofitted for Vox Populi, Infixo
-- Jan 14, 2020: Improved, adan_eslavo
--------------------------------------------------------------
local eUnitClassCaravan = GameInfoTypes.UNITCLASS_CARAVAN
local eUnitClassCargo = GameInfoTypes.UNITCLASS_CARGO_SHIP

local eBuildingClassWalls = GameInfoTypes.BUILDINGCLASS_WALLS
local eBuildingClassTemple = GameInfoTypes.BUILDINGCLASS_TEMPLE

local eDomainSea = GameInfoTypes.DOMAIN_SEA

local ePromotionSanboAir = GameInfoTypes.PROMOTION_SANBO_AIR
local ePromotionSanboAirEffect = GameInfoTypes.PROMOTION_SANBO_AIR_EFFECT
--------------------------------------------------------------
local iCoastMinArea = 10
local iSanboLifeThreshold = 20
--------------------------------------------------------------
local g_tWorldWonder = {
	GameInfoTypes["BUILDING_CHEVALIERS"],
	GameInfoTypes["BUILDING_ITSUKUSHIMA"],
	GameInfoTypes["BUILDING_QALHAT"],
	GameInfoTypes["BUILDING_GATE_OF_SUN"],
	GameInfoTypes["BUILDING_GREAT_ZIMBABWE"],
	GameInfoTypes["BUILDING_KILWA_KISIWANI"],
	GameInfoTypes["BUILDING_MARAE_ARAHURAHU"],
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
	GameInfoTypes["BUILDING_TEMBLEQUE"],
	GameInfoTypes["BUILDING_ANGKOR_WAT"],
	GameInfoTypes["BUILDING_TLACHIHUALTEPETL"],
	GameInfoTypes["BUILDING_HOSPITALLER"],
	GameInfoTypes["BUILDING_SONGYUE"]
}

local g_tWorldWonderDummy = {
	GameInfoTypes["BUILDING_DUMMY_CHEVALIERS"],
	GameInfoTypes["BUILDING_DUMMY_ITSUKUSHIMA"],
	GameInfoTypes["BUILDING_DUMMY_QALHAT"],
	GameInfoTypes["BUILDING_DUMMY_GATE_OF_SUN"],
	GameInfoTypes["BUILDING_DUMMY_GREAT_ZIMBABWE"],
	GameInfoTypes["BUILDING_DUMMY_KILWA_KISIWANI"],
	GameInfoTypes["BUILDING_DUMMY_MARAE_ARAHURAHU"],
	GameInfoTypes["BUILDING_DUMMY_KUK"],
	GameInfoTypes["BUILDING_DUMMY_ST_PETERS"],
	GameInfoTypes["BUILDING_DUMMY_PANAMA_CANAL"],
	GameInfoTypes["BUILDING_DUMMY_JUMEIRAH"],
	GameInfoTypes["BUILDING_DUMMY_ARECIBO"],
	GameInfoTypes["BUILDING_DUMMY_ROCKEFELLER"],
	GameInfoTypes["BUILDING_DUMMY_DARJEELING"],
	GameInfoTypes["BUILDING_DUMMY_SANBO"],
	GameInfoTypes["BUILDING_DUMMY_AUTOBAHN"],
	GameInfoTypes["BUILDING_DUMMY_INTERSTATE"],
	GameInfoTypes["BUILDING_DUMMY_MUSEUM_ISLAND"],
	GameInfoTypes["BUILDING_DUMMY_CURIOSITY"],
	GameInfoTypes["BUILDING_DUMMY_SEED_VAULT"],
	GameInfoTypes["BUILDING_DUMMY_TEMBLEQUE"],
	GameInfoTypes["POLICY_DUMMY_ANGKOR_WAT"],		-- POLICY!!!
	GameInfoTypes["POLICY_DUMMY_TLACHIHUALTEPETL"], -- POLICY!!!
	GameInfoTypes["BUILDING_DUMMY_HOSPITALLER"],
	GameInfoTypes["BUILDING_DUMMY_SONGYUE"]
}

local g_iWonderWithDummies = #g_tWorldWonderDummy

local g_tWorldWonderDummy2 = {}
	for i = 1, g_iWonderWithDummies do
		g_tWorldWonderDummy2[i] = false
	end
	g_tWorldWonderDummy2[15] = GameInfoTypes["BUILDING_DUMMY_SANBO_2"]

local g_tWorldWonderExists = {}
	for i = 1, g_iWonderWithDummies do
		g_tWorldWonderExists[i] = false
	end

local g_tWorldWonderOwner = {}
--------------------------------------------------------------
--------------------------------------------------------------
-- Kuk Swamp 						(8)		NEOLITHIC
-- Angkor Wat 						(22)		CLASSICAL
-- Gate of the Sun 					(4)			CLASSICAL
-- Songyue Pagoda 					(25)		CLASSICAL
-- Great Zimbabwe 					(5)				MEDIEVAL
-- Itsukushima Shrine 				(2)				MEDIEVAL
-- Knight's Hospitaller 			(24)			MEDIEVAL
-- Krak des Chevaliers 				(1)				MEDIEVAL
-- Qalhat 							(3)				MEDIEVAL
-- Tlachihualtepetl 				(23)			MEDIEVAL
-- Aqueduct of Padre Tembleque 		(21)				RENAISSANCE
-- Kilwa Kisiwani 					(6)					RENAISSANCE
-- Marae Arahurahu 					(7)					RENAISSANCE
-- St. Peter's Basilica 			(9)					RENAISSANCE
-- Darjeeling Himalayan Railway 	(14)					INDUSTRIAL
-- Museum Island 					(18)					INDUSTRIAL
-- Panama Canal 					(10)					INDUSTRIAL
-- Autobahn 						(16)						MODERN
-- Interstate Highway System 		(17)						MODERN
-- Rockefeller Center 				(13)						MODERN
-- Sanbo Honbu 						(15)						MODERN
-- Arecibo Observatory 				(12)							ATOMIC
-- Curiosity Rover 					(19)								INFORMATION
-- Palm Jumeirah 					(11)								INFORMATION
-- Svalbard Global Seed Vault 		(20)								INFORMATION
--------------------------------------------------------------
-- CODED WITH POLICY:
	-- Angkor Wat 						(22)	faith_purchase_of_diplomatic_units
	-- Tlachihualtepetl 				(23)	global_yields_from_constructions
-- REQUIRES OTHER BASIC BUILDING:
	-- Gate of the Sun 					(4)		global_modifiers_to_cities_with_walls
	-- Knight's Hospitaller 			(24)	global_unit_healing_from_cities_with_temple
-- REQUIRES COASTAL/NON-COASTAL CITY:
	-- Krak des Chevaliers 				(1)		different_bonuses_in_non_coastal_cities	
	-- Itsukushima Shrine 				(2)		border_growth_boost_in_coastal_cities/yields_to_atolls_in_coastal_cities
	-- Panama Canal 					(10)	global_bonuses_to_sea_tr_in_coastal_cities/global_yields_to_tr_owners_in_coastal_cities
-- COUNTS TRADE ROUTES:	
	-- Qalhat 							(3)		global_bonus_to_sea_tr_from_majors
	-- Great Zimbabwe 					(5)		global_yields_per_tr/global_production_modifiers_per_tr
-- COUNTS RESEARCH AGREEMENTS:	
	-- Curiosity Rover 					(19)	global_yields_from_research_agreements
-- ADDS ADDITIONAL PROMOTIONS:
	-- Marae Arahurahu 					(7)		second_free_promotion
	-- Sanbo Honbu 						(15)	second_and_third_free_promotion
-- MUST BE BUILT IN EVERY PLAYER CITY:
	-- Kuk Swamp 						(8)		global_yields_from_tech/global_yields_to_marsh
	-- Palm Jumeirah 					(11)	global_yields_to_atolls
	-- Arecibo Observatory 				(12)	global_yields_from_mountains
	-- Rockefeller Center 				(13)	global_yields/global_yields_from_gold_purchases
	-- Darjeeling Himalayan Railway 	(14)	global_yields_from_mountains
	-- Autobahn 						(16)	global_defense
	-- Interstate Highway System 		(17)	global_population_increase
	-- Museum Island 					(18)	global_great_person_modifiers
	-- Svalbard Global Seed Vault 		(20)	global_yields_from_growth
	-- Aqueduct of Padre Tembleque 		(21)	global_yields_from_faith_purchases
	-- Songyue Pagoda 					(25)	global_yields_from_faith_purchases
-- CAN BE BUILT LOCALLY:
	-- Kilwa Kisiwani 					(6)		global_yields_to_strategic_and_luxury_resources
	-- St. Peter's Basilica 			(9)		happiness_to_all_religious_buildings
--------------------------------------------------------------
--------------------------------------------------------------
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
	-- Krak des Chevaliers (1)
	if not g_tWorldWonderExists[1] then	
		if eBuilding == g_tWorldWonder[1] then
			g_tWorldWonderExists[1] = true
			g_tWorldWonderOwner[1] = ePlayer
			
			local pPlayer = Players[ePlayer]
		
			for city in pPlayer:Cities() do
				if not city:IsCoastal(iCoastMinArea) and not city:IsHasBuilding(g_tWorldWonder[1]) then
					city:SetNumRealBuilding(g_tWorldWonderDummy[1], 1)
				end
			end
		end
	end

	-- Itsukushima Shrine (2)
	if not g_tWorldWonderExists[2] then	
		if eBuilding == g_tWorldWonder[2] then
			g_tWorldWonderExists[2] = true
			g_tWorldWonderOwner[2] = ePlayer
			
			local pPlayer = Players[ePlayer]
		
			for city in pPlayer:Cities() do
				if city:IsCoastal(iCoastMinArea) then
					city:SetNumRealBuilding(g_tWorldWonderDummy[2], 1)
				end
			end
		end
	end

	-- Qalhat (3)
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
						and tradeRoute.Domain == eDomainSea then
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

	-- Gate of the Sun (4)
	if eBuilding == g_tWorldWonder[4] then
		g_tWorldWonderExists[4] = true
		g_tWorldWonderOwner[4] = ePlayer
			
		local pPlayer = Players[ePlayer]
		
		for city in pPlayer:Cities() do
			for building in GameInfo.Buildings{BuildingClass=eBuildingClassWalls} do	
				if city:IsHasBuilding(building.ID) then
					city:SetNumRealBuilding(g_tWorldWonderDummy[4], 1)
					break
				end
			end
		end
	else
		if g_tWorldWonderExists[4] and g_tWorldWonderOwner[4] == ePlayer then
			for building in GameInfo.Buildings{BuildingClass=eBuildingClassWalls} do
				if eBuilding == building.ID then
					local pPlayer = Players[ePlayer]
					local pCity = pPlayer:GetCityByID(eCity)
					
					pCity:SetNumRealBuilding(g_tWorldWonderDummy[4], 1)
					break
				end
			end
		end
	end

	-- Great Zimbabwe (5)
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

	-- Kilwa Kisiwani (6)
	if not g_tWorldWonderExists[6] then	
		if eBuilding == g_tWorldWonder[6] then
			g_tWorldWonderExists[6] = true
			g_tWorldWonderOwner[6] = ePlayer
			
			local pPlayer = Players[ePlayer]
			local pCity = pPlayer:GetCityByID(eCity)

			pCity:SetNumRealBuilding(g_tWorldWonderDummy[6], 1)
		end
	end

	-- Marae Arahurahu (7)
	if not g_tWorldWonderExists[7] then	
		if eBuilding == g_tWorldWonder[7] then
			g_tWorldWonderExists[7] = true
			g_tWorldWonderOwner[7] = ePlayer
			
			local pPlayer = Players[ePlayer]
			local pCity = pPlayer:GetCityByID(eCity)

			pCity:SetNumRealBuilding(g_tWorldWonderDummy[7], 1)
		end
	end

	-- Kuk Swamp (8)
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

	-- St. Peter's Basilica (9)
	if not g_tWorldWonderExists[9] then	
		if eBuilding == g_tWorldWonder[9] then
			g_tWorldWonderExists[9] = true
			g_tWorldWonderOwner[9] = ePlayer
			
			local pPlayer = Players[ePlayer]
			local pCity = pPlayer:GetCityByID(eCity)

			pCity:SetNumRealBuilding(g_tWorldWonderDummy[9], 1)
		end
	end

	-- Panama Canal (10)
	if not g_tWorldWonderExists[10] then	
		if eBuilding == g_tWorldWonder[10] then
			g_tWorldWonderExists[10] = true
			g_tWorldWonderOwner[10] = ePlayer
			
			local pPlayer = Players[ePlayer]
		
			for city in pPlayer:Cities() do
				if city:IsCoastal(iCoastMinArea) then
					city:SetNumRealBuilding(g_tWorldWonderDummy[10], 1)
				end
			end
		end
	end

	-- Palm Jumeirah (11)
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

	-- Arecibo Observatory (12)
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
	
	-- Rockefeller Center (13)
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
	
	-- Darjeeling Himalayan Railway (14)
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

	-- Sanbo Honbu (15)
	if not g_tWorldWonderExists[15] then	
		if eBuilding == g_tWorldWonder[15] then
			g_tWorldWonderExists[15] = true
			g_tWorldWonderOwner[15] = ePlayer
			
			local pPlayer = Players[ePlayer]
			local pCity = pPlayer:GetCityByID(eCity)

			pCity:SetNumRealBuilding(g_tWorldWonderDummy[15], 1)
			pCity:SetNumRealBuilding(g_tWorldWonderDummy2[15], 1)
		end
	end
	
	-- Autobahn (16)
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
	
	-- Interstate Highway System (17)
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

	-- Museum Island (18)
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

	-- Curiosity Rover (19)
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

	-- Svalbard Global Seed Vault (20)
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

	-- Aqueduct of Padre Tembleque (21)
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
	
	-- Angkor Wat (22)
	if not g_tWorldWonderExists[22] then	
		if eBuilding == g_tWorldWonder[22] then
			g_tWorldWonderExists[22] = true
			g_tWorldWonderOwner[22] = ePlayer
			
			local pPlayer = Players[ePlayer]
		
			pPlayer:SetHasPolicy(g_tWorldWonderDummy[22], 1) -- POLICY!!!
		end
	end

	-- Tlachihualtepetl (23)
	if not g_tWorldWonderExists[23] then	
		if eBuilding == g_tWorldWonder[23] then
			g_tWorldWonderExists[23] = true
			g_tWorldWonderOwner[23] = ePlayer
			
			local pPlayer = Players[ePlayer]
		
			pPlayer:SetHasPolicy(g_tWorldWonderDummy[23], 1) -- POLICY!!!
		end
	end
	
	-- Hospital of St. John (24)
	if eBuilding == g_tWorldWonder[24] then
		g_tWorldWonderExists[24] = true
		g_tWorldWonderOwner[24] = ePlayer
			
		local pPlayer = Players[ePlayer]
		
		for city in pPlayer:Cities() do
			for building in GameInfo.Buildings{BuildingClass=eBuildingClassTemple} do	
				if city:IsHasBuilding(building.ID) then
					city:SetNumRealBuilding(g_tWorldWonderDummy[24], 1)
					break
				end
			end
		end
	else
		if g_tWorldWonderExists[24] and g_tWorldWonderOwner[24] == ePlayer then
			for building in GameInfo.Buildings{BuildingClass=eBuildingClassTemple} do
				if eBuilding == building.ID then
					local pPlayer = Players[ePlayer]
					local pCity = pPlayer:GetCityByID(eCity)
					
					pCity:SetNumRealBuilding(g_tWorldWonderDummy[24], 1)
					break
				end
			end
		end
	end

	-- Songyue Pagoda (25)
	if not g_tWorldWonderExists[25] then	
		if eBuilding == g_tWorldWonder[25] then
			g_tWorldWonderExists[25] = true
			g_tWorldWonderOwner[25] = ePlayer
			
			local pPlayer = Players[ePlayer]
		
			for city in pPlayer:Cities() do
				city:SetNumRealBuilding(g_tWorldWonderDummy[25], 1)
			end
		end
	end
end
GameEvents.CityConstructed.Add(IsWonderConstructed)

-- check if wonder was conquered by another player
function CheckForWonderAfterCapture(eOldOwner, bIsCapital, iX, iY, eNewOwner, iPop, bConquest)
	-- Krak des Chevaliers (1)
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
				if not city:IsCoastal(iCoastMinArea) and not city:IsHasBuilding(g_tWorldWonder[1]) then
					city:SetNumRealBuilding(g_tWorldWonderDummy[1], 1)
				end
			end		
		else
			if eNewOwner == g_tWorldWonderOwner[1] and not pConqCity:IsCoastal(iCoastMinArea) then
				pConqCity:SetNumRealBuilding(g_tWorldWonderDummy[1], 1)
			elseif eNewOwner ~= g_tWorldWonderOwner[1] then
				pConqCity:SetNumRealBuilding(g_tWorldWonderDummy[1], 0)
			end
		end
	end
	
	-- Itsukushima Shrine (2)
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
				if city:IsCoastal(iCoastMinArea) then
					city:SetNumRealBuilding(g_tWorldWonderDummy[2], 1)
				end
			end		
		else
			if eNewOwner == g_tWorldWonderOwner[2] and pConqCity:IsCoastal(iCoastMinArea) then
				pConqCity:SetNumRealBuilding(g_tWorldWonderDummy[2], 1)
			elseif eNewOwner ~= g_tWorldWonderOwner[2] then
				pConqCity:SetNumRealBuilding(g_tWorldWonderDummy[2], 0)
			end
		end
	end

	-- Qalhat (3)
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
						and tradeRoute.Domain == eDomainSea then
							iSeaTradeRoutesWithMajors = iSeaTradeRoutesWithMajors + 1
						end
					end
				end
			end

			pConqCity:SetNumRealBuilding(g_tWorldWonderDummy[3], iSeaTradeRoutesWithMajors)
		end
	end

	-- Gate of the Sun (4)
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
				for building in GameInfo.Buildings{BuildingClass=eBuildingClassWalls} do	
					if city:IsHasBuilding(building.ID) then
						city:SetNumRealBuilding(g_tWorldWonderDummy[4], 1)
						break
					end
				end
			end		
		else
			for building in GameInfo.Buildings{BuildingClass=eBuildingClassWalls} do	
				if eNewOwner == g_tWorldWonderOwner[4] and pConqCity:IsHasBuilding(building.ID) then
					pConqCity:SetNumRealBuilding(g_tWorldWonderDummy[4], 1)
					break
				elseif eNewOwner ~= g_tWorldWonderOwner[4] then
					pConqCity:SetNumRealBuilding(g_tWorldWonderDummy[4], 0)
					break
				end
			end
		end
	end

	-- Great Zimbabwe (5)
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

	-- Kilwa Kisiwani (6)
	if g_tWorldWonderExists[6] then	
		local pPlot = Map.GetPlot(iX, iY)
		local pConqCity = pPlot:GetWorkingCity()
		
		if pConqCity:IsHasBuilding(g_tWorldWonder[6]) then
			g_tWorldWonderOwner[6] = eNewOwner
			
			pConqCity:SetNumRealBuilding(g_tWorldWonderDummy[6], 1)
		end
	end

	-- Marae Arahurahu (7)
	if g_tWorldWonderExists[7] then	
		local pPlot = Map.GetPlot(iX, iY)
		local pConqCity = pPlot:GetWorkingCity()
		
		if pConqCity:IsHasBuilding(g_tWorldWonder[7]) then
			g_tWorldWonderOwner[7] = eNewOwner
			
			pConqCity:SetNumRealBuilding(g_tWorldWonderDummy[7], 1)
		end
	end

	-- Kuk Swamp (8)
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

	-- St. Peter's Basilica (9)
	if g_tWorldWonderExists[9] then	
		local pPlot = Map.GetPlot(iX, iY)
		local pConqCity = pPlot:GetWorkingCity()
		
		if pConqCity:IsHasBuilding(g_tWorldWonder[9]) then
			g_tWorldWonderOwner[9] = eNewOwner
			
			pConqCity:SetNumRealBuilding(g_tWorldWonderDummy[9], 1)
		end
	end

	-- Panama Canal (10)
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
				if city:IsCoastal(iCoastMinArea) then
					city:SetNumRealBuilding(g_tWorldWonderDummy[10], 1)
				end
			end		
		else
			if eNewOwner == g_tWorldWonderOwner[10] and pConqCity:IsCoastal(iCoastMinArea) then
				pConqCity:SetNumRealBuilding(g_tWorldWonderDummy[10], 1)
			elseif eNewOwner ~= g_tWorldWonderOwner[10] then
				pConqCity:SetNumRealBuilding(g_tWorldWonderDummy[10], 0)
			end
		end
	end

	-- Palm Jumeirah (11)
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

	-- Arecibo Observatory (12)
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

	-- Rockefeller Center (13)
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

	-- Darjeeling Himalayan Railway (14)
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

	-- Sanbo Honbu (15)
	if g_tWorldWonderExists[15] then	
		local pPlot = Map.GetPlot(iX, iY)
		local pConqCity = pPlot:GetWorkingCity()
		
		if pConqCity:IsHasBuilding(g_tWorldWonder[15]) then
			g_tWorldWonderOwner[15] = eNewOwner
			
			pConqCity:SetNumRealBuilding(g_tWorldWonderDummy[15], 1)
		end
	end

	-- Autobahn (16)
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

	-- Museum Island (18)
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

	-- Curiosity Rover (19)
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

	-- Svalbard Global Seed Vault (20)
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

	-- Aqueduct of Padre Tembleque (21)
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

	-- Angkor Wat (22)
	if g_tWorldWonderExists[22] then	
		local pPlot = Map.GetPlot(iX, iY)
		local pConqCity = pPlot:GetWorkingCity()
		
		if pConqCity:IsHasBuilding(g_tWorldWonder[22]) then
			local pOldOwner = Players[eOldOwner]
			local pNewOwner = Players[eNewOwner]
			
			g_tWorldWonderOwner[22] = eNewOwner
			
			pOldOwner:SetHasPolicy(g_tWorldWonderDummy[22], 0) -- POLICY!!!
			pNewOwner:SetHasPolicy(g_tWorldWonderDummy[22], 1) -- POLICY!!!
		end
	end

	-- Tlachihualtepetl (23)
	if g_tWorldWonderExists[23] then	
		local pPlot = Map.GetPlot(iX, iY)
		local pConqCity = pPlot:GetWorkingCity()
		
		if pConqCity:IsHasBuilding(g_tWorldWonder[23]) then
			local pOldOwner = Players[eOldOwner]
			local pNewOwner = Players[eNewOwner]
			
			g_tWorldWonderOwner[23] = eNewOwner
			
			pOldOwner:SetHasPolicy(g_tWorldWonderDummy[23], 0) -- POLICY!!!
			pNewOwner:SetHasPolicy(g_tWorldWonderDummy[23], 1) -- POLICY!!!
		end
	end

	-- Hospital of St. John (24)
	if g_tWorldWonderExists[24] then	
		local pPlot = Map.GetPlot(iX, iY)
		local pConqCity = pPlot:GetWorkingCity()
		
		if pConqCity:IsHasBuilding(g_tWorldWonder[24]) then
			local pOldOwner = Players[eOldOwner]
			
			for city in pOldOwner:Cities() do
				city:SetNumRealBuilding(g_tWorldWonderDummy[24], 0)
			end
			
			local pNewOwner = Players[eNewOwner]
			g_tWorldWonderOwner[24] = eNewOwner
			
			for city in pNewOwner:Cities() do
				for building in GameInfo.Buildings{BuildingClass=eBuildingClassTemple} do	
					if city:IsHasBuilding(building.ID) then
						city:SetNumRealBuilding(g_tWorldWonderDummy[24], 1)
						break
					end
				end
			end		
		else
			for building in GameInfo.Buildings{BuildingClass=eBuildingClassTemple} do	
				if eNewOwner == g_tWorldWonderOwner[24] and pConqCity:IsHasBuilding(building.ID) then
					pConqCity:SetNumRealBuilding(g_tWorldWonderDummy[24], 1)
					break
				elseif eNewOwner ~= g_tWorldWonderOwner[24] then
					pConqCity:SetNumRealBuilding(g_tWorldWonderDummy[24], 0)
					break
				end
			end
		end
	end

	-- Songyue Pagoda (25)
	if g_tWorldWonderExists[25] then	
		local pPlot = Map.GetPlot(iX, iY)
		local pConqCity = pPlot:GetWorkingCity()
		
		if pConqCity:IsHasBuilding(g_tWorldWonder[25]) then
			local pOldOwner = Players[eOldOwner]
			
			for city in pOldOwner:Cities() do
				city:SetNumRealBuilding(g_tWorldWonderDummy[25], 0)
			end
			
			local pNewOwner = Players[eNewOwner]
			g_tWorldWonderOwner[25] = eNewOwner
			
			for city in pNewOwner:Cities() do
				city:SetNumRealBuilding(g_tWorldWonderDummy[25], 1)
			end		
		else
			if eNewOwner == g_tWorldWonderOwner[25] then
				pConqCity:SetNumRealBuilding(g_tWorldWonderDummy[25], 1)
			else
				pConqCity:SetNumRealBuilding(g_tWorldWonderDummy[25], 0)
			end
		end
	end
end
GameEvents.CityCaptureComplete.Add(CheckForWonderAfterCapture)

-- check if new city gains effects
function BuildDummyInNewCity(ePlayer, iX, iY)
	-- Krak des Chevaliers (1)
	if g_tWorldWonderExists[1] then
		if ePlayer == g_tWorldWonderOwner[1] then
			local pPlot = Map.GetPlot(iX, iY)
			local pCity = pPlot:GetWorkingCity()
			
			if not pCity:IsCoastal(iCoastMinArea) then
				pCity:SetNumRealBuilding(g_tWorldWonderDummy[1], 1)
			end
		end
	end

	-- Itsukushima Shrine (2)
	if g_tWorldWonderExists[2] then
		if ePlayer == g_tWorldWonderOwner[2] then
			local pPlot = Map.GetPlot(iX, iY)
			local pCity = pPlot:GetWorkingCity()
			
			if pCity:IsCoastal(iCoastMinArea) then
				pCity:SetNumRealBuilding(g_tWorldWonderDummy[2], 1)
			end
		end
	end

	-- Gate of the Sun (4)
	if g_tWorldWonderExists[4] then
		if ePlayer == g_tWorldWonderOwner[4] then
			local pPlot = Map.GetPlot(iX, iY)
			local pCity = pPlot:GetWorkingCity()
			
			for building in GameInfo.Buildings{BuildingClass=eBuildingClassWalls} do	
				if pCity:IsHasBuilding(building.ID) then
					pCity:SetNumRealBuilding(g_tWorldWonderDummy[4], 1)
					break
				end
			end
		end
	end

	-- Kuk Swamp (8)
	if g_tWorldWonderExists[8] then
		if ePlayer == g_tWorldWonderOwner[8] then
			local pPlot = Map.GetPlot(iX, iY)
			local pCity = pPlot:GetWorkingCity()
			
			pCity:SetNumRealBuilding(g_tWorldWonderDummy[8], 1)
		end
	end

	-- Panama Canal (10)
	if g_tWorldWonderExists[10] then
		if ePlayer == g_tWorldWonderOwner[10] then
			local pPlot = Map.GetPlot(iX, iY)
			local pCity = pPlot:GetWorkingCity()
			
			if pCity:IsCoastal(iCoastMinArea) then
				pCity:SetNumRealBuilding(g_tWorldWonderDummy[10], 1)
			end
		end
	end

	-- Palm Jumeirah (11)
	if g_tWorldWonderExists[11] then
		if ePlayer == g_tWorldWonderOwner[11] then
			local pPlot = Map.GetPlot(iX, iY)
			local pCity = pPlot:GetWorkingCity()
			
			pCity:SetNumRealBuilding(g_tWorldWonderDummy[11], 1)
		end
	end

	-- Arecibo Observatory (12)
	if g_tWorldWonderExists[12] then
		if ePlayer == g_tWorldWonderOwner[12] then
			local pPlot = Map.GetPlot(iX, iY)
			local pCity = pPlot:GetWorkingCity()
			
			pCity:SetNumRealBuilding(g_tWorldWonderDummy[12], 1)
		end
	end

	-- Rockefeller Center (13)
	if g_tWorldWonderExists[13] then
		if ePlayer == g_tWorldWonderOwner[13] then
			local pPlot = Map.GetPlot(iX, iY)
			local pCity = pPlot:GetWorkingCity()
			
			pCity:SetNumRealBuilding(g_tWorldWonderDummy[13], 1)
		end
	end

	-- Darjeeling Himalayan Railway (14)
	if g_tWorldWonderExists[14] then
		if ePlayer == g_tWorldWonderOwner[14] then
			local pPlot = Map.GetPlot(iX, iY)
			local pCity = pPlot:GetWorkingCity()
			
			pCity:SetNumRealBuilding(g_tWorldWonderDummy[14], 1)
		end
	end

	-- Autobahn (16)
	if g_tWorldWonderExists[16] then
		if ePlayer == g_tWorldWonderOwner[16] then
			local pPlot = Map.GetPlot(iX, iY)
			local pCity = pPlot:GetWorkingCity()
			
			pCity:SetNumRealBuilding(g_tWorldWonderDummy[16], 1)
		end
	end

	-- Museum Island (18)
	if g_tWorldWonderExists[18] then
		if ePlayer == g_tWorldWonderOwner[18] then
			local pPlot = Map.GetPlot(iX, iY)
			local pCity = pPlot:GetWorkingCity()
			
			pCity:SetNumRealBuilding(g_tWorldWonderDummy[18], 1)
		end
	end

	-- Svalbard Global Seed Vault (20)
	if g_tWorldWonderExists[20] then
		if ePlayer == g_tWorldWonderOwner[20] then
			local pPlot = Map.GetPlot(iX, iY)
			local pCity = pPlot:GetWorkingCity()
			
			pCity:SetNumRealBuilding(g_tWorldWonderDummy[20], 1)
		end
	end

	-- Aqueduct of Padre Tembleque (21)
	if g_tWorldWonderExists[21] then
		if ePlayer == g_tWorldWonderOwner[21] then
			local pPlot = Map.GetPlot(iX, iY)
			local pCity = pPlot:GetWorkingCity()
			
			pCity:SetNumRealBuilding(g_tWorldWonderDummy[21], 1)
		end
	end

	-- Hospital of St. John (24)
	if g_tWorldWonderExists[24] then
		if ePlayer == g_tWorldWonderOwner[24] then
			local pPlot = Map.GetPlot(iX, iY)
			local pCity = pPlot:GetWorkingCity()
			
			for building in GameInfo.Buildings{BuildingClass=eBuildingClassTemple} do	
				if pCity:IsHasBuilding(building.ID) then
					pCity:SetNumRealBuilding(g_tWorldWonderDummy[24], 1)
					break
				end
			end
		end
	end

	-- Songyue Pagoda (25)
	if g_tWorldWonderExists[25] then
		if ePlayer == g_tWorldWonderOwner[25] then
			local pPlot = Map.GetPlot(iX, iY)
			local pCity = pPlot:GetWorkingCity()
			
			pCity:SetNumRealBuilding(g_tWorldWonderDummy[25], 1)
		end
	end
end
GameEvents.PlayerCityFounded.Add(BuildDummyInNewCity)

-- checks for trade routes (QALHAT, GREAT ZIMBABWE)
function SetDummiesOnUnitActionChange(ePlayer, iUnit)
	-- Qalhat (3)
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
									and tradeRoute.Domain == eDomainSea then
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

	-- Great Zimbabwe (5)
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

-- checks for promotions (SANBO)
function SetPromotionsOnCombatEnd(eAttackingPlayer, eAttackingUnit, iAttackerDamage, iAttackerFinalDamage, iAttackerMaxHP, eDefendingPlayer, eDefendingUnit, iDefenderDamage, iDefenderFinalDamage, iDefenderMaxHP, eInterceptingPlayer, eInterceptingUnit, iInterceptorDamage, iPlotX, iPlotY)
	-- Sanbo Honbu (15)
	if g_tWorldWonderExists[15] then
		if eAttackingPlayer == g_tWorldWonderOwner[15] then
			local pAttackingPlayer = Players[eAttackingPlayer]

			if pAttackingPlayer ~= nil then				
				local pAttackingUnit = pAttackingPlayer:GetUnitByID(eAttackingUnit)

				if pAttackingUnit ~= nil and pAttackingUnit:IsHasPromotion(ePromotionSanboAir) or pAttackingUnit:IsHasPromotion(ePromotionSanboAirEffect) then
					local iUnitHP = pAttackingUnit:GetCurrHitPoints()
					local iUnitMaxHP = pAttackingUnit:GetMaxHitPoints()
					local fHPPercentage = 100 * iUnitHP / iUnitMaxHP
					
					if fHPPercentage <= iSanboLifeThreshold then
						pAttackingUnit:SetHasPromotion(ePromotionSanboAirEffect, true)
						pAttackingUnit:SetHasPromotion(ePromotionSanboAir, false)
					else
						pAttackingUnit:SetHasPromotion(ePromotionSanboAir, true)
						pAttackingUnit:SetHasPromotion(ePromotionSanboAirEffect, false)
					end
				end
			end
		elseif eDefendingPlayer == g_tWorldWonderOwner[15] then
			local pDefendingPlayer = Players[eDefendingPlayer]

			if pDefendingPlayer ~= nil then
				local pDefendingUnit = pDefendingPlayer:GetUnitByID(eDefendingUnit)

				if pDefendingUnit ~= nil and pDefendingUnit:IsHasPromotion(ePromotionSanboAir) or pDefendingUnit:IsHasPromotion(ePromotionSanboAirEffect) then
					local iUnitHP = pDefendingUnit:GetCurrHitPoints()
					local iUnitMaxHP = pDefendingUnit:GetMaxHitPoints()
					local fHPPercentage = 100 * iUnitHP / iUnitMaxHP
					
					if fHPPercentage <= iSanboLifeThreshold then
						pDefendingUnit:SetHasPromotion(ePromotionSanboAirEffect, true)
						pDefendingUnit:SetHasPromotion(ePromotionSanboAir, false)
					else
						pDefendingUnit:SetHasPromotion(ePromotionSanboAir, true)
						pDefendingUnit:SetHasPromotion(ePromotionSanboAirEffect, false)
					end
				end
			end
		end
	end
end
GameEvents.CombatEnded.Add(SetPromotionsOnCombatEnd)

function SetPromotionOnTurn(ePlayer)
	-- Sanbo Honbu (15)
	if g_tWorldWonderExists[15] then
		if ePlayer == g_tWorldWonderOwner[15] then
			local pPlayer = Players[ePlayer]
			
			for unit in pPlayer:Units() do
				if unit:IsHasPromotion(ePromotionSanboAir) or unit:IsHasPromotion(ePromotionSanboAirEffect) then
					local iUnitHP = unit:GetCurrHitPoints()
					local iUnitMaxHP = unit:GetMaxHitPoints()
					local fHPPercentage = 100 * iUnitHP / iUnitMaxHP
					
					if fHPPercentage <= iSanboLifeThreshold then
						unit:SetHasPromotion(ePromotionSanboAirEffect, true)
						unit:SetHasPromotion(ePromotionSanboAir, false)
					else
						unit:SetHasPromotion(ePromotionSanboAir, true)
						unit:SetHasPromotion(ePromotionSanboAirEffect, false)
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(SetPromotionOnTurn)

-- checks for Research Agreements (CURIOSITY ROVER)
function SetRAOnTurn(ePlayer)
	-- Curiosity Rover (19)
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