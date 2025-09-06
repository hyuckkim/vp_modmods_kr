-- WWonders_Functions.lua
-- Author: Jarcast
-- DateCreated: 6/13/2024 7:59:00 AM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
--include("PlotIterators.lua")
--==========================================================================================================================
-- UTILITIES
--==========================================================================================================================
-- GetRandom
function GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
-------------------------------------------------------------------------------------------------------------------------
if Game then
	function Game.GetCommunityOptions(type)
		for row in GameInfo.Community("Type = '" .. type .. "'") do
			return row.Value
		end
	end
end
-------------------------------------------------------------------------------------------------------------------------
function Game_IsUsingMod(modID)
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == modID then
			return true
		end
	end
	return false
end
-------------------------------------------------------------------------------------------------------------------------
tUniqueVillages = {}
tUniqueVillages[GameInfoTypes.IMPROVEMENT_TRADING_POST] = true
if Game_IsUsingMod("cc3e1671-2832-40dc-9bfd-8e053d3b76b2") then
	tUniqueVillages[GameInfoTypes.IMPROVEMENT_CL_KALLE] = true
end
if Game_IsUsingMod("17304572-5735-44c1-a981-29be1ff401b6") then
	tUniqueVillages[GameInfoTypes.IMPROVEMENT_GW_BRITTANY_KERIADENN] = true
end
if Game_IsUsingMod("3499cc3d-2073-42c9-9bf0-f39db982e741") then
	tUniqueVillages[GameInfoTypes.IMPROVEMENT_HININ_AINU_KOTAN] = true
end
if Game_IsUsingMod("f79ace06-b989-45be-b310-1632ed1c79b9") then
	tUniqueVillages[GameInfoTypes.IMPROVEMENT_JAR_BORGO] = true
end
if Game_IsUsingMod("8dac91b6-191b-4698-b762-0256963343ac") then
	tUniqueVillages[GameInfoTypes.IMPROVEMENT_JAR_HOGAN] = true
end
if Game_IsUsingMod("6cc3abfc-baaf-4aff-9c62-0757e0ed9944") then
	tUniqueVillages[GameInfoTypes.IMPROVEMENT_JAR_KILOMBO] = true
end

tUniqueForts = {}
tUniqueForts[GameInfoTypes.IMPROVEMENT_FORT] = true
--==========================================================================================================================
-- FUNCTIONS
--==========================================================================================================================
-- The Temple to Heracles at Agrigento 
--==========================================================================================================================
function Jar_HeraclesAgrigento(playerID)
	local player = Players[playerID]
	if player:CountNumBuildings(GameInfoTypes.BUILDING_AKRAGATOS) <1 then return end
	for pCity in player:Cities() do
		local faith = pCity:GetFaithPerTurn()
		local productionUnit = pCity:GetProductionUnit()
		if productionUnit and GameInfo.Units[productionUnit].Found then
			pCity:ChangeProduction(faith)
		end
	end
end
GameEvents.PlayerDoTurn.Add(Jar_HeraclesAgrigento)
--==========================================================================================================================
-- Piscina Mirabilis
--==========================================================================================================================
function Jar_PiscinaMirabilis(playerID)
	local player = Players[playerID]
	for pCity in player:Cities() do
		local pCityPlot = pCity:Plot()
		if pCity:IsHasBuilding(GameInfoTypes.BUILDING_PISCINA_MIR) then
			if pCityPlot:IsUnit() then
				for i = 0, pCityPlot:GetNumUnits() - 1 do
					local zUnit = pCityPlot:GetUnit(i)
					local pOwner = Players[zUnit:GetOwner()]
					if  pOwner == player and zUnit:GetDomainType() == DomainTypes.DOMAIN_SEA then
						zUnit:ChangeDamage(-10)
					end
				end
			end
			for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
				local pAdjacentPlot = Map.PlotDirection(pCity:GetX(), pCity:GetY(), direction)
				if pAdjacentPlot and pAdjacentPlot:IsUnit() and pAdjacentPlot:IsWater() then
					for i = 0, pAdjacentPlot:GetNumUnits() - 1 do
						local zUnit = pAdjacentPlot:GetUnit(i)
						local pOwner = Players[zUnit:GetOwner()]
						if pOwner == player and zUnit:GetDomainType() == DomainTypes.DOMAIN_SEA then
							zUnit:ChangeDamage(-10)
						end
					end	
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(Jar_PiscinaMirabilis)
--==========================================================================================================================
-- Banaue Rice Terraces
--==========================================================================================================================
function Jar_CanConstructBanaue(ePlayer, eCity, eBuilding)
	local pPlayer = Players[ePlayer]
	if not pPlayer:IsAlive() then return false end
	local pCity = pPlayer:GetCityByID(eCity)
	local pCityPlot = pCity:Plot()
	
	if eBuilding == GameInfoTypes.BUILDING_BANAUE then
		for cityPlot = 1, pCity:GetNumCityPlots() - 1, 1 do
			local pPlot = pCity:GetCityIndexPlot(cityPlot)
			if pPlot:GetOwner() == ePlayer and pPlot:GetWorkingCity():GetID() == eCity and pPlot:GetImprovementType() == GameInfoTypes.IMPROVEMENT_FARM then
				return true
			end
		end
		return false
	end
	return true
end
GameEvents.CityCanConstruct.Add(Jar_CanConstructBanaue)

local tAllowedFeatures= {}
tAllowedFeatures[-1] = true
tAllowedFeatures[GameInfoTypes.FEATURE_JUNGLE] = true
tAllowedFeatures[GameInfoTypes.FEATURE_FOREST] = true
tAllowedFeatures[GameInfoTypes.FEATURE_MARSH] = true
tAllowedFeatures[GameInfoTypes.FEATURE_FLOOD_PLAINS] = true

function Jar_BanaueWonderPlaceRice(iPlayer, iCity, iBuilding, bIncludeGold, bIncludeFaithOrCulture)
	local pPlayer = Players[iPlayer]	
	local pCity = pPlayer:GetCityByID(iCity)
	if iBuilding ~= GameInfoTypes.BUILDING_BANAUE then return end
	local count = 0
	local numRiceRes = 3
	for cityPlot = 1, pCity:GetNumCityPlots() - 1, 1 do
		local pPlot = pCity:GetCityIndexPlot(cityPlot)
		local ePlotOwner = pPlot:GetOwner()
		local distance = Map.PlotDistance(pCity:GetX(), pCity:GetY(), pPlot:GetX(), pPlot:GetY())
		if pPlot and pPlot:IsHills() and count<numRiceRes and distance<= 3 and pPlot:GetResourceType() == -1 and pPlot:GetImprovementType() == -1 and tAllowedFeatures[pPlot:GetFeatureType()] and (not pPlot:IsCity()) and pPlot:GetTerrainType() ~= GameInfoTypes.TERRAIN_SNOW then
			if ePlotOwner == iPlayer or ePlotOwner == -1 then
				if ePlotOwner == -1 then
					pPlot:SetOwner(iPlayer, iCity, true, true)
				end
				pPlot:SetResourceType(GameInfoTypes.RESOURCE_RICE, 1)
				pPlot:SetFeatureType(-1)
				pPlot:SetImprovementType(GameInfoTypes.IMPROVEMENT_FARM)				
				count = count +1 
			end
		end
	end
end
GameEvents.CityConstructed.Add(Jar_BanaueWonderPlaceRice)
--==========================================================================================================================
-- Horyu-ji
--==========================================================================================================================
function Jar_HoryujiCultureReligiousUnits(iPlayer, iUnit, iUnitType, iX, iY)
	--Abort if the new unit is not a Carthaginian Great Admiral
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit);
	if pPlayer:CountNumBuildings(GameInfoTypes.BUILDING_HORYUJI) <1 then return end
	if pUnit:GetUnitClassType() == GameInfoTypes.UNITCLASS_MISSIONARY or pUnit:GetUnitClassType() == GameInfoTypes.UNITCLASS_INQUISITOR then
		local bonus = 20*math.max(1, pPlayer:GetCurrentEra())
		local adjustedBonus = math.floor((GameInfo.GameSpeeds[Game:GetGameSpeedType()].CulturePercent * bonus) / 100);
		
		pPlayer:ChangeJONSCulture(adjustedBonus)
		if pPlayer:IsHuman() then
			-- Send a notification to the player
			local header = Locale.ConvertTextKey("TXT_KEY_GRAND_HORYUJI_BONUS_HEADER");
			local text = Locale.ConvertTextKey("TXT_KEY_GRAND_HORYUJI_BONUS_BODY", tostring(adjustedBonus), pUnit:GetName());
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, header);
		end
	end
end
GameEvents.UnitCreated.Add(Jar_HoryujiCultureReligiousUnits)
--==========================================================================================================================
-- Great Kyz Kala
--==========================================================================================================================
function Jar_CanConstructKyzKala(ePlayer, eCity, eBuilding)
	local pPlayer = Players[ePlayer]
	if not pPlayer:IsAlive() then return false end
	local pCity = pPlayer:GetCityByID(eCity)
	local pPlot = pCity:Plot()
	
	if eBuilding == GameInfoTypes.BUILDING_KYZ_KALA then
		for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
			local pAdjacentPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), direction)
			if pAdjacentPlot and pAdjacentPlot:IsWater() then
				return false
			end
		end
	end
	return true
end
GameEvents.CityCanConstruct.Add(Jar_CanConstructKyzKala)

function Jar_KyzKalaWonderDummyPolicy(iPlayer, iCity, iBuilding, bIncludeGold, bIncludeFaithOrCulture)
	local pPlayer = Players[iPlayer]	
	local pCity = pPlayer:GetCityByID(iCity)
	if iBuilding ~= GameInfoTypes.BUILDING_KYZ_KALA then return end
	if not pPlayer:HasPolicy(GameInfoTypes.POLICY_KYZ_KALA) then
		pPlayer:GrantPolicy(GameInfoTypes.POLICY_KYZ_KALA, true)
	end	
end
GameEvents.CityConstructed.Add(Jar_KyzKalaWonderDummyPolicy)
--==========================================================================================================================
-- Shaolin Temple
--==========================================================================================================================
function Jar_CanConstructShaolinTemple(ePlayer, eCity, eBuilding)
	local pPlayer = Players[ePlayer]
	if not pPlayer:IsAlive() then return false end
	local pCity = pPlayer:GetCityByID(eCity)
	
	if eBuilding == GameInfoTypes.BUILDING_SHAOLIN then
		local cityReligionID = pCity:GetReligiousMajority();
		if cityReligionID > 0 and cityReligionID == pPlayer:GetMajorityReligion() then
			return true
		else
			return false
		end
	end
	return true
end
GameEvents.CityCanConstruct.Add(Jar_CanConstructShaolinTemple)
--==========================================================================================================================
-- Church of the Nativity
--==========================================================================================================================
function Jar_CanConstructChurchNativity(ePlayer, eCity, eBuilding)
	local pPlayer = Players[ePlayer]
	if not pPlayer:IsAlive() then return false end
	local pCity = pPlayer:GetCityByID(eCity)
	local pPlot = pCity:Plot()
	
	if eBuilding == GameInfoTypes.BUILDING_CHURCH_NATIVITY then
		return pPlayer:HasCreatedReligion()
	end
	return true
end
GameEvents.CityCanConstruct.Add(Jar_CanConstructChurchNativity)

function Jar_ChurchNativityWonderDummyPolicy(iPlayer, iCity, iBuilding, bIncludeGold, bIncludeFaithOrCulture)
	local pPlayer = Players[iPlayer]	
	local pCity = pPlayer:GetCityByID(iCity)
	if iBuilding ~= GameInfoTypes.BUILDING_CHURCH_NATIVITY then return end
	if not pPlayer:HasPolicy(GameInfoTypes.POLICY_CHURCH_NATIVITY) then
		pPlayer:GrantPolicy(GameInfoTypes.POLICY_CHURCH_NATIVITY, true)
	end	
end
GameEvents.CityConstructed.Add(Jar_ChurchNativityWonderDummyPolicy)
--==========================================================================================================================
-- Old New Synagogue of Prague
--==========================================================================================================================
function Jar_CanConstructSynagogueofPrague(ePlayer, eCity, eBuilding)
	local pPlayer = Players[ePlayer]
	if not pPlayer:IsAlive() then return false end
	local pCity = pPlayer:GetCityByID(eCity)
	local pPlot = pCity:Plot()
	
	if eBuilding == GameInfoTypes.BUILDING_OLD_NEW_SYNAGOGUE then
		local cityReligionID = pCity:GetReligiousMajority();		
		for ID = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
			local otherReligiousPlayer = Players[ID]
			local otherReligionID = otherReligiousPlayer:GetMajorityReligion()
			local otherFollowers = pCity:GetNumFollowers(otherReligionID)
			if cityReligionID ~= otherReligionID and otherFollowers >= 4 then
				return true
			end
		end
		return false
	end
	return true
end
GameEvents.CityCanConstruct.Add(Jar_CanConstructSynagogueofPrague)

function Jar_PragueSynagogueWonderDummyPolicy(iPlayer, iCity, iBuilding, bIncludeGold, bIncludeFaithOrCulture)
	local pPlayer = Players[iPlayer]	
	local pCity = pPlayer:GetCityByID(iCity)
	if iBuilding ~= GameInfoTypes.BUILDING_OLD_NEW_SYNAGOGUE then return end
	if not pPlayer:HasPolicy(GameInfoTypes.POLICY_OLD_NEW_SYNAGOGUE) then
		pPlayer:GrantPolicy(GameInfoTypes.POLICY_OLD_NEW_SYNAGOGUE, true)
	end	
end
GameEvents.CityConstructed.Add(Jar_PragueSynagogueWonderDummyPolicy)
--==========================================================================================================================
-- Jetavanaramaya
--==========================================================================================================================
function Jar_CanConstructJetavanaramaya(ePlayer, eCity, eBuilding)
	local pPlayer = Players[ePlayer]
	if not pPlayer:IsAlive() then return false end
	local pCity = pPlayer:GetCityByID(eCity)
	local pCityPlot = pCity:Plot()
	
	if eBuilding == GameInfoTypes.BUILDING_JETAVANARAMAYA then
		local count= 0
		for cityPlot = 1, pCity:GetNumCityPlots() - 1, 1 do
			local pPlot = pCity:GetCityIndexPlot(cityPlot)
			if pPlot:GetOwner() == ePlayer and pPlot:GetWorkingCity():GetID() == eCity and tUniqueVillages[pPlot:GetImprovementType()] then
				count = count +1
			end
		end
		return count >= 1
	end
	return true
end
GameEvents.CityCanConstruct.Add(Jar_CanConstructJetavanaramaya)

function Jar_JetavanaramayaWonderDummyPolicy(iPlayer, iCity, iBuilding, bIncludeGold, bIncludeFaithOrCulture)
	local pPlayer = Players[iPlayer]	
	local pCity = pPlayer:GetCityByID(iCity)
	if iBuilding ~= GameInfoTypes.BUILDING_JETAVANARAMAYA then return end
	if not pPlayer:HasPolicy(GameInfoTypes.POLICY_JETAVANARAMAYA) then
		pPlayer:GrantPolicy(GameInfoTypes.POLICY_JETAVANARAMAYA, true)
	end	
end
GameEvents.CityConstructed.Add(Jar_JetavanaramayaWonderDummyPolicy)
--==========================================================================================================================
-- Tlachihualtepetl
--==========================================================================================================================
function Jar_TlachihualtepetlWonderDummyPolicy(iPlayer, iCity, iBuilding, bIncludeGold, bIncludeFaithOrCulture)
	local pPlayer = Players[iPlayer]	
	local pCity = pPlayer:GetCityByID(iCity)
	if iBuilding ~= GameInfoTypes.BUILDING_TLACHIHUALTEPETL then return end
	if not pPlayer:HasPolicy(GameInfoTypes.POLICY_TLACHIHUALTEPETL) then
		pPlayer:GrantPolicy(GameInfoTypes.POLICY_TLACHIHUALTEPETL, true)
	end	
end
GameEvents.CityConstructed.Add(Jar_TlachihualtepetlWonderDummyPolicy)
--==========================================================================================================================
-- Larabanga Mosque
--==========================================================================================================================
function Jar_LarabangaWonderDummyPolicy(iPlayer, iCity, iBuilding, bIncludeGold, bIncludeFaithOrCulture)
	local pPlayer = Players[iPlayer]	
	local pCity = pPlayer:GetCityByID(iCity)
	if iBuilding ~= GameInfoTypes.BUILDING_LARABANGA then return end
	if not pPlayer:HasPolicy(GameInfoTypes.POLICY_LARABANGA) then
		pPlayer:GrantPolicy(GameInfoTypes.POLICY_LARABANGA, true)
	end	
end
GameEvents.CityConstructed.Add(Jar_LarabangaWonderDummyPolicy)
--==========================================================================================================================
-- Paro Taktsang
--==========================================================================================================================
function Jar_ParoTaktsangWonderHolySite(iPlayer, iCity, iBuilding, bIncludeGold, bIncludeFaithOrCulture)
	local pPlayer = Players[iPlayer]	
	local pCity = pPlayer:GetCityByID(iCity)
	if iBuilding ~= GameInfoTypes.BUILDING_TAKTSANG then return end
	for cityPlot = 1, pCity:GetNumCityPlots() - 1, 1 do
		local pPlot = pCity:GetCityIndexPlot(cityPlot)
		local eTerrain = pPlot:GetTerrainType()
		local ePlotOwner = pPlot:GetOwner()
		local eMountain = GameInfoTypes.TERRAIN_MOUNTAIN
		if pPlot and eTerrain == eMountain then
			if ePlotOwner == iPlayer or ePlotOwner == -1 then
				if ePlotOwner == -1 then
					pPlot:SetOwner(iPlayer, iCity, true, true)
				end
				pPlot:SetImprovementType(GameInfoTypes["IMPROVEMENT_HOLY_SITE"])
				Game.SetPlotExtraYield(pPlot:GetX(), pPlot:GetY(), GameInfo.Yields.YIELD_FOOD.ID, 1 )
				Game.SetPlotExtraYield(pPlot:GetX(), pPlot:GetY(), GameInfo.Yields.YIELD_PRODUCTION.ID, 1 )
				break
			end
		end
	end
end
GameEvents.CityConstructed.Add(Jar_ParoTaktsangWonderHolySite)
--==========================================================================================================================
-- Keshgarh Qila
--==========================================================================================================================
function Jar_CanConstructKeshgarhQila(ePlayer, eCity, eBuilding)
	local pPlayer = Players[ePlayer]
	if not pPlayer:IsAlive() then return false end
	local pCity = pPlayer:GetCityByID(eCity)
	local pCityPlot = pCity:Plot()
	
	if eBuilding == GameInfoTypes.BUILDING_KESHGARH_QILA then
		local count= 0
		for cityPlot = 1, pCity:GetNumCityPlots() - 1, 1 do
			local pPlot = pCity:GetCityIndexPlot(cityPlot)
			if pPlot:GetOwner() == ePlayer and pPlot:GetWorkingCity():GetID() == eCity and tUniqueForts[pPlot:GetImprovementType()] then
				count = count +1
			end
		end
		return count >= 1
	end
	return true
end
GameEvents.CityCanConstruct.Add(Jar_CanConstructKeshgarhQila)
--==========================================================================================================================
-- Victoria Terminus / Chhatrapati Shivaji Terminus
--==========================================================================================================================
function Jar_CanConstructVictoriaTerminus(ePlayer, eCity, eBuilding)
	local pPlayer = Players[ePlayer]
	if not pPlayer:IsAlive() then return false end
	local pCity = pPlayer:GetCityByID(eCity)
	local pPlot = pCity:Plot()
	
	if eBuilding == GameInfoTypes.BUILDING_VICTORIA_TERMINUS then
		return pCity:GetPopulation() >= 18
	end
	return true
end
GameEvents.CityCanConstruct.Add(Jar_CanConstructVictoriaTerminus)

function Jar_VictoriaTerminusWonderDummyPolicy(iPlayer, iCity, iBuilding, bIncludeGold, bIncludeFaithOrCulture)
	local pPlayer = Players[iPlayer]	
	local pCity = pPlayer:GetCityByID(iCity)
	if iBuilding ~= GameInfoTypes.BUILDING_VICTORIA_TERMINUS then return end
	if not pPlayer:HasPolicy(GameInfoTypes.POLICY_VICTORIA_TERMINUS) then
		pPlayer:GrantPolicy(GameInfoTypes.POLICY_VICTORIA_TERMINUS, true)
	end	
end
GameEvents.CityConstructed.Add(Jar_VictoriaTerminusWonderDummyPolicy)
--==========================================================================================================================
-- Capitoline Museums
--==========================================================================================================================
function Jar_CapitolineArchaeologist(playerID, unitID)
	local pPlayer = Players[playerID]
	if unitID == GameInfoTypes.UNIT_ARCHAEOLOGIST_CM then
		return pPlayer:CountNumBuildings(GameInfoTypes.BUILDING_CAPITOLINE) >0
	elseif unitID == GameInfoTypes.UNIT_ARCHAEOLOGIST then
		return pPlayer:CountNumBuildings(GameInfoTypes.BUILDING_CAPITOLINE) <1
	end
	return true
end
GameEvents.PlayerCanTrain.Add(Jar_CapitolineArchaeologist)
--==========================================================================================================================
-- Muzibu Azaala Mpanga
--==========================================================================================================================
function Jar_CanConstructKasubiTombs(ePlayer, eCity, eBuilding)
	local pPlayer = Players[ePlayer]
	if not pPlayer:IsAlive() then return false end
	local pCity = pPlayer:GetCityByID(eCity)
	local pCityPlot = pCity:Plot()
	
	if eBuilding == GameInfoTypes.BUILDING_KASUBI_TOMBS then
		for cityPlot = 1, pCity:GetNumCityPlots() - 1, 1 do
			local pPlot = pCity:GetCityIndexPlot(cityPlot)
			local distance = Map.PlotDistance(pCityPlot:GetX(), pCityPlot:GetY(), pPlot:GetX(), pPlot:GetY())
			if pPlot:GetOwner() == ePlayer and pPlot:GetWorkingCity():GetID() == eCity and pPlot:IsLake() and distance < 3 then
				return true
			end
		end
		return false
	end
	return true
end
GameEvents.CityCanConstruct.Add(Jar_CanConstructKasubiTombs)
--==========================================================================================================================
-- Golden Gate Bridge
--==========================================================================================================================
function Jar_GoldenGateWonderDummyPolicy(iPlayer, iCity, iBuilding, bIncludeGold, bIncludeFaithOrCulture)
	local pPlayer = Players[iPlayer]	
	local pCity = pPlayer:GetCityByID(iCity)
	if iBuilding ~= GameInfoTypes.BUILDING_GOLDEN_GATE then return end
	if not pPlayer:HasPolicy(GameInfoTypes.POLICY_GOLDEN_GATE) then
		pPlayer:GrantPolicy(GameInfoTypes.POLICY_GOLDEN_GATE, true)
	end	
end
GameEvents.CityConstructed.Add(Jar_GoldenGateWonderDummyPolicy)
--==========================================================================================================================
-- Changi Airport
--==========================================================================================================================
function Jar_SingaporeAirportWonderDummyPolicy(iPlayer, iCity, iBuilding, bIncludeGold, bIncludeFaithOrCulture)
	local pPlayer = Players[iPlayer]	
	local pCity = pPlayer:GetCityByID(iCity)
	if iBuilding ~= GameInfoTypes.BUILDING_CHANGI_AIRPORT then return end
	if not pPlayer:HasPolicy(GameInfoTypes.POLICY_CHANGI_AIRPORT) then
		pPlayer:GrantPolicy(GameInfoTypes.POLICY_CHANGI_AIRPORT, true)
	end	
end
GameEvents.CityConstructed.Add(Jar_SingaporeAirportWonderDummyPolicy)
---------------------------------------------------------
print("Hidden Wonders functions done!")
--==========================================================================================================================
--==========================================================================================================================