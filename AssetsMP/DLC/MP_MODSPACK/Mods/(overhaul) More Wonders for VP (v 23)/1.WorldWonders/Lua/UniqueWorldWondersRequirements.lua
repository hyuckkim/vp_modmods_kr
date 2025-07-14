print("Loading UniqueWorldWondersRequirements.lua from MWfVP")
--------------------------------------------------------------
-- CityCanConstruct event expansion
-- Dec 15, 2017: Created, Infixo
-- Jan 7, 2020: Improved, adan_eslavo
--------------------------------------------------------------
-- debug output routine
function dprint(sStr,p1,p2,p3,p4,p5,p6)
	local sOutStr = sStr
	if p1 ~= nil then sOutStr = sOutStr.." [1] "..tostring(p1) end
	if p2 ~= nil then sOutStr = sOutStr.." [2] "..tostring(p2) end
	if p3 ~= nil then sOutStr = sOutStr.." [3] "..tostring(p3) end
	if p4 ~= nil then sOutStr = sOutStr.." [4] "..tostring(p4) end
	if p5 ~= nil then sOutStr = sOutStr.." [5] "..tostring(p5) end
	if p6 ~= nil then sOutStr = sOutStr.." [6] "..tostring(p6) end
	print(sOutStr)
end

local tValidIsMaxEra = {}

local tValidIsNearLake = {}
local tValidIsNoCoast = {} -- temporary?
local tValidIsHasMountains = {}
local tValidIsProhibitedTerrain = {}
local tValidIsHasImprovement = {}
local tValidIsOneTile = {}
local tValidIsAtPeace = {}
local tValidIsMajorApproach = {}
local tValidIsHasCsAllies = {}
local tValidIsHasGreatWorks = {}
local tValidIsReligionFounded = {}
local tValidIsHappiness = {}
local tValidIsOnIsthmus = {}
local tValidIsHasCitizens = {}
local tValidIsHasCities = {}
local tValidIsHasSpecialists = {}
local tValidIsHasPlotsForResources = {}
local tValidIsHasResearchAgreements = {}
local tValidIsAtPolar = {}
--local tValidIsHasUniqueBuildingClassReq = {} -- fix for VP bug

local bReachedMaxEra

local ePlotOcean = PlotTypes.PLOT_OCEAN
local ePlotFlat = PlotTypes.PLOT_LAND
local ePlotHill = PlotTypes.PLOT_HILLS
local ePlotMountain = PlotTypes.PLOT_MOUNTAIN

local bIsRestrictionEra = false
local iRequirementType = 0 --unusued

for option in GameInfo.Community{Type="MW-SETTING-MAX-ERA"} do
	if option.Value == 1 then
		bIsRestrictionEra = true
		break
	end
end

for option in GameInfo.Community{Type="MW-SETTING-REQUIREMENT"} do
	iRequirementType = option.Value
end

-- IsMaxEra
if bIsRestrictionEra then
	function IsMaxEra(ePlayer, eCity, eBuilding)
		if not tValidIsMaxEra[eBuilding] then 
			bReachedMaxEra = false 
			return true
		end
	
		local pPlayer = Players[ePlayer]
	
		if not pPlayer:IsAlive() then return false end

		local pTeam = Teams[pPlayer:GetTeam()]
		local eCurrentEra = pTeam:GetCurrentEra()
		local eMaxStartEra = tValidIsMaxEra[eBuilding]
		local pCity = pPlayer:GetCityByID(eCity)
		local iReturnProduction = pCity:GetBuildingProduction(eBuilding)
		
		if eCurrentEra <= eMaxStartEra then 
			bReachedMaxEra = false
			return true 
		end

		bReachedMaxEra = true

		if pPlayer:IsHuman() and pPlayer:IsTurnActive() and iReturnProduction > 0 then
			for building in GameInfo.Buildings() do
				if building.ID == eBuilding then
					local sWonderName = Locale.ConvertTextKey(building.Description)
					
					for era in GameInfo.Eras() do
						if era.ID == eCurrentEra then
							local sEraName = Locale.ConvertTextKey(era.Description)
							local sCityName = pCity:GetName()
							local iCultureReturn = math.ceil(0.33 * iReturnProduction)

							pPlayer:AddNotification(NotificationTypes.NOTIFICATION_WONDER_BEATEN, 
								'It is too late for building [COLOR_CYAN]' .. sWonderName .. '[ENDCOLOR] Wonder in [COLOR_CYAN]' .. sCityName .. '[ENDCOLOR], because Player has just entered [COLOR_CYAN]' .. sEraName .. '[ENDCOLOR]. Player will receive ' .. iCultureReturn .. '[ICON_CULTURE] Culture in return.', -- use TXT_KEY_ here
								'[COLOR_CYAN]' .. sWonderName .. '[ENDCOLOR] cannot be built anymore',
								pCity:GetX(), pCity:GetY(), building.ID)
						
							pPlayer:ChangeJONSCulture(iCultureReturn)
							pCity:SetBuildingProduction(eBuilding, 0)
							break
						end
					end

					break
				end
			end
		end
		
		return false
	end
	GameEvents.CityCanConstruct.Add(IsMaxEra)
end

-- checks if city is between River and Sea and adds this condition (normally it would be treated like city with Lake)
-- Sea and Lake		=	FreshWater == true, 	Water>=1 == true			true
-- Lake and River	=	FreshWater == true, 	Water>=1 == true			true
-- Sea and River	=	FreshWater == true, 	Water>=1 == true			true? (should be false)
-- Sea				=	FreshWater == false, 	Water>=1 == true			false
-- Lake				=	FreshWater == true, 	Water>=1 == true			true
-- River			=	FreshWater == true, 	Water>=1 == false			false
function IsLakeWithOcean(ePlayer, eCity, eBuilding)
	if not tValidIsNearLake[eBuilding] then return true end
	if bReachedMaxEra then return false end

	local pPlayer = Players[ePlayer]
   
	if not pPlayer:IsAlive() then return false end

	local pCity = pPlayer:GetCityByID(eCity)
	local iCityX = pCity:GetX()
	local iCityY = pCity:GetY()

	if pCity:IsCoastal(1) then -- city is adjacent to at least one water tile
		for dir = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1 do
			if Map.PlotDirection(iCityX, iCityY, dir):IsLake() then
				return true
			end
		end
	end

	return false
end
GameEvents.CityCanConstruct.Add(IsLakeWithOcean)

-- checks if city is NOT near COAST
function IsNoCoast(ePlayer, eCity, eBuilding)
	if not tValidIsNoCoast[eBuilding] then return true end
	if bReachedMaxEra then return false end

	local pPlayer = Players[ePlayer]
   
	if not pPlayer:IsAlive() then return false end

	local pCity = pPlayer:GetCityByID(eCity)

	if pCity:IsCoastal(10) then
		return false
	end

	return true
end
GameEvents.CityCanConstruct.Add(IsNoCoast)

-- looks for 2 MOUNTAINS in city range (MACHU PICCHU, BUDDHAS OF BAMYAN, DARJEELING)
function IsHasMountains(ePlayer, eCity, eBuilding)
	if not tValidIsHasMountains[eBuilding] then return true end
	if bReachedMaxEra then return false end

	local pPlayer = Players[ePlayer]
   
	if not pPlayer:IsAlive() then return false end

	local pCity = pPlayer:GetCityByID(eCity)
	local iCityX = pCity:GetX()
	local iCityY = pCity:GetY()
	local iMountainCount = 0

	for cityPlot = 1, pCity:GetNumCityPlots() - 1, 1 do
		local pSpecificPlot = pCity:GetCityIndexPlot(cityPlot)
		
		if pSpecificPlot then
			local eTerrain = pSpecificPlot:GetTerrainType()
			local ePlotOwner = pSpecificPlot:GetOwner()
			local eMountain = GameInfoTypes.TERRAIN_MOUNTAIN
				
			if ePlotOwner == ePlayer and eTerrain == eMountain then
				iMountainCount = iMountainCount + 1
			
				if iMountainCount >= 2 then
					return true
				end
			end
		end
	end

	return false
end
GameEvents.CityCanConstruct.Add(IsHasMountains)

-- expands ProhibitedCityTerrain function by tiles around the city
-- adds condition: if not tundra then also not snow
function IsProhibitedTerrainExpanded(ePlayer, eCity, eBuilding)
	if not tValidIsProhibitedTerrain[eBuilding] then return true end
	if bReachedMaxEra then return false end

	local pPlayer = Players[ePlayer]
   
	if not pPlayer:IsAlive() then return false end

	local pCity = pPlayer:GetCityByID(eCity)
	local eCityTerrain = pCity:GetCityIndexPlot(0):GetTerrainType()
	local eProhibitedTerrain = tValidIsProhibitedTerrain[eBuilding]
	local eTundra = GameInfoTypes.TERRAIN_TUNDRA
	local eSnow = GameInfoTypes.TERRAIN_SNOW

	-- check city tile
	if eProhibitedTerrain == eTundra and eCityTerrain == eSnow then
		return false
	end
	
	-- check tiles around the city
	local iCityX = pCity:GetX()
	local iCityY = pCity:GetY()
	
	for dir = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1 do
		local eTerrain = Map.PlotDirection(iCityX, iCityY, dir):GetTerrainType()
		
		if eTerrain == eProhibitedTerrain then
			return false
		elseif eProhibitedTerrain == eTundra and eTerrain == eSnow then
			return false -- if not tundra then also not snow
		end
	end

	return true
end
GameEvents.CityCanConstruct.Add(IsProhibitedTerrainExpanded)

-- looks for IMPROVEMENTS
function IsHasImprovement(ePlayer, eCity, eBuilding)
	if not tValidIsHasImprovement[eBuilding] then return true end
	if bReachedMaxEra then return false end

	local pPlayer = Players[ePlayer]
   
	if not pPlayer:IsAlive() then return false end

	local pCity = pPlayer:GetCityByID(eCity)
	local iCityX = pCity:GetX()
	local iCityY = pCity:GetY()
	
	for id, building in pairs(tValidIsHasImprovement) do
		if id == eBuilding then
			local eRequiredImprovement1 = building.eRequiredImprovement1
			local eRequiredImprovement2 = building.eRequiredImprovement2
			local eRequiredImprovement3 = building.eRequiredImprovement3
			local iRequiredImprovements = tValidIsHasImprovement[eBuilding].iRequiredImprovements or 0
			local iRequiredRoads = tValidIsHasImprovement[eBuilding].iRequiredRoads or 0
			
			local iCurrentImprovements = 0
			local iCurrentRoads = 0
			
			for cityPlot = 1, pCity:GetNumCityPlots() - 1, 1 do
				local pSpecificPlot = pCity:GetCityIndexPlot(cityPlot)
				
				if pSpecificPlot then
					local ePlotOwner = pSpecificPlot:GetOwner()
					
					if ePlotOwner == ePlayer then
						local pWorkingCity = pSpecificPlot:GetWorkingCity()
						
						if pWorkingCity == nil then
							print("CHECK_WORK_PLOT_FOR_IMP", "OWNER", ePlotOwner, "TILE", cityPlot, pSpecificPlot:GetX(), pSpecificPlot:GetY())
						end

						local eWorkingCity = pWorkingCity:GetID()      
						
						if eWorkingCity == eCity then
							if iRequiredRoads > 0 then
								local eRoute = pSpecificPlot:GetRouteType()
								local eRoad = GameInfoTypes.ROUTE_ROAD
						
								if eRoute == eRoad and not pSpecificPlot:IsRoutePillaged() then
									iCurrentRoads = iCurrentRoads + 1
								end
							end

							if iRequiredImprovements > 0 then
								local eImprovement = pSpecificPlot:GetImprovementType()
				
								if (eImprovement == eRequiredImprovement1 or eImprovement == eRequiredImprovement2 or eImprovement == eRequiredImprovement3) and not pSpecificPlot:IsImprovementPillaged() then
									iCurrentImprovements = iCurrentImprovements + 1
								end
							end
						end
					
						if iCurrentRoads >= iRequiredRoads and iCurrentImprovements >= iRequiredImprovements then
							return true
						end
					end
				end
			end

			return false
		end
	end
end
GameEvents.CityCanConstruct.Add(IsHasImprovement)

-- checks if city is ONE-tile (MONT ST MICHELLE, SOLOVIETSKY)
function IsOneTile(ePlayer, eCity, eBuilding)
	if not tValidIsOneTile[eBuilding] then return true end
	if bReachedMaxEra then return false end

	local pPlayer = Players[ePlayer]
	
	if not pPlayer:IsAlive() then return false end
	
	local pCity = pPlayer:GetCityByID(eCity)
	local iCityX = pCity:GetX()
	local iCityY = pCity:GetY()
	
	-- check all six dir, quit if not water
	for dir = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1 do
		if not Map.PlotDirection(iCityX, iCityY, dir):IsWater() then
			return false
		end
	end
	
	return true
end
GameEvents.CityCanConstruct.Add(IsOneTile)

-- checks if player is at PEACE (BUDDHAS OF BAMYAN)
function IsAtPeace(ePlayer, eCity, eBuilding)
	if not tValidIsAtPeace[eBuilding] then return true end
	if bReachedMaxEra then return false end

	local pPlayer = Players[ePlayer]
	
	if not pPlayer:IsAlive() then return false end
	
	local pTeam = Teams[pPlayer:GetTeam()]
	local iCountWars = pTeam:GetAtWarCount(false)
	
	if iCountWars > 0 then
		return false
	end
	
	return true
end
GameEvents.CityCanConstruct.Add(IsAtPeace)

-- checks if other player's APPROACHES (STATUE OF ZEUS, GREAT WALL)
function IsMajorApproach(ePlayer, eCity, eBuilding)
	if not tValidIsMajorApproach[eBuilding] then return true end
	if bReachedMaxEra then return false end

	local pPlayer = Players[ePlayer]
	
	if not pPlayer:IsAlive() then return false end
	
	for id, building in pairs(tValidIsMajorApproach) do
		if id == eBuilding then
			local eRequiredApproach1 = building.eRequiredApproach1
			local eRequiredApproach2 = building.eRequiredApproach2
			local eRequiredApproach3 = building.eRequiredApproach3
			local eRequiredApproach4 = building.eRequiredApproach4
			
			for i = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
				local pTargetPlayer = Players[i]
				
				if not pTargetPlayer:IsEverAlive() then break end

				local eApproachTrue = pPlayer:GetMajorCivApproach(i)
				local eApproachGuess = pPlayer:GetApproachTowardsUsGuess(i)
				
				if eApproachTrue == eRequiredApproach1 or eApproachTrue == eRequiredApproach2 or eApproachTrue == eRequiredApproach3 or eApproachTrue == eRequiredApproach4 or
				   eApproachGuess == eRequiredApproach1 or eApproachGuess == eRequiredApproach2 or eApproachGuess == eRequiredApproach3 or eApproachGuess == eRequiredApproach4 then
					return true
				end
			end
			
			return false
		end
	end
end
GameEvents.CityCanConstruct.Add(IsMajorApproach)

-- checks number of CS ALLIES (PORCELAIN TOWER, HOUSE OF TRADE OF THE INDIES)
function IsHasCsAllies(ePlayer, eCity, eBuilding)
	if not tValidIsHasCsAllies[eBuilding] then return true end
	if bReachedMaxEra then return false end

	local pPlayer = Players[ePlayer]
	
	if not pPlayer:IsAlive() then return false end
	
	local iRequiredCsAllies = tValidIsHasCsAllies[eBuilding]
	local iCurrentCsAllies = 0

	for eCs = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_PLAYERS - 2, 1 do
		local pCs = Players[eCs]
		
		if not pCs:IsEverAlive() then break end
		
		if pCs:IsAlive() and pCs:IsAllies(ePlayer) then
			iCurrentCsAllies = iCurrentCsAllies + 1
			
			if iCurrentCsAllies >= iRequiredCsAllies then
				return true
			end
		end
	end

	return false
end
GameEvents.CityCanConstruct.Add(IsHasCsAllies)


-- checks number of GREAT WORKS (UFFIZI)
function IsHasGreatWorks(ePlayer, eCity, eBuilding)
	if not tValidIsHasGreatWorks[eBuilding] then return true end
	if bReachedMaxEra then return false end

	local pPlayer = Players[ePlayer]
	
	if not pPlayer:IsAlive() then return false end
	
	local eGreatWorkType = tValidIsHasGreatWorks[eBuilding].eGreatWorkType
	local iRequiredGreatWorks = tValidIsHasGreatWorks[eBuilding].iRequiredGreatWorks
	local iCurrentGreatWorks = 0
	
	for city in pPlayer:Cities() do
		for building in GameInfo.Buildings() do
			if city:IsHasBuilding(building.ID) then
    			iCurrentGreatWorks = iCurrentGreatWorks + CheckArt(building, city, eGreatWorkType)
				
				if iCurrentGreatWorks >= iRequiredGreatWorks then
					return true
				end
			end
		end
	end
	
	return false
end
GameEvents.CityCanConstruct.Add(IsHasGreatWorks)

function CheckArt(pBuilding, pCity, eGreatWorkType)
	local iGreatWorks = 0
	local iAvailableSlots = pBuilding.GreatWorkCount
	
	if iAvailableSlots > 0 then
		local eCurrentGreatWorkType = pBuilding.GreatWorkSlotType
		
		if eCurrentGreatWorkType == eGreatWorkType then
			for slot = 0, iAvailableSlots - 1, 1 do
				local iWork = pCity:GetBuildingGreatWork(GameInfoTypes[pBuilding.BuildingClass], slot)
				
				if iWork ~= -1 then
					iGreatWorks = iGreatWorks + 1
				end
			end
		end
	end
	
	return iGreatWorks
end

-- checks if player found RELIGION (SISTINE CHAPEL)
function IsReligionFounded(ePlayer, eCity, eBuilding)
	if not tValidIsReligionFounded[eBuilding] then return true end
	if bReachedMaxEra then return false end

	local pPlayer = Players[ePlayer]
	
	if not pPlayer:IsAlive() then return false end
	
	if pPlayer:HasCreatedReligion() then
		return true
	end
	
	return false
end
GameEvents.CityCanConstruct.Add(IsReligionFounded)

-- checks if player passes the HAPPINESS value (BAKKEN)
function IsHappiness(ePlayer, eCity, eBuilding)
	if not tValidIsHappiness[eBuilding] then return true end
	if bReachedMaxEra then return false end

	local pPlayer = Players[ePlayer]
	
	if not pPlayer:IsAlive() then return false end
	
	local iRequiredHappiness = tValidIsHappiness[eBuilding]
	
	if pPlayer:GetExcessHappiness() >= iRequiredHappiness then
		return true
	end
	
	return false
end
GameEvents.CityCanConstruct.Add(IsHappiness)

-- checks if city is on ISTHMUS (PANAMA CANAL)
function IsOnIsthmus(ePlayer, eCity, eBuilding)
	if not tValidIsOnIsthmus[eBuilding] then return true end
	if bReachedMaxEra then return false end

	local pPlayer = Players[ePlayer]
   
	if not pPlayer:IsAlive() then return false end

	local pCity = pPlayer:GetCityByID(eCity)
	
	if pCity:Plot():Area():GetNumTiles() < 11 then return false end
	
	local iCityX = pCity:GetX()
	local iCityY = pCity:GetY()
	local iCoastChanges = 0
	local iPreviousPlotType = -1
	local iCurrentPlotType = -1

	for dir = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1 do
		local pAdjacentPlot = Map.PlotDirection(iCityX, iCityY, dir)
		
		if pAdjacentPlot:IsLake() then
			return false
		end

		iPreviousPlotType = iCurrentPlotType
		iCurrentPlotType = pAdjacentPlot:GetPlotType()
		if iCurrentPlotType == ePlotHill or iCurrentPlotType == ePlotMountain then
			iCurrentPlotType = ePlotFlat
		end

		if iPreviousPlotType ~= -1 and iPreviousPlotType ~= iCurrentPlotType then
			iCoastChanges = iCoastChanges + 1
		end

		if iCoastChanges >= 3 then return true end		
	end

	return false
end
GameEvents.CityCanConstruct.Add(IsOnIsthmus)

-- checks if city has enough citizens (BROOKLYN)
function IsHasCitizens(ePlayer, eCity, eBuilding)
	if not tValidIsHasCitizens[eBuilding] then return true end
	if bReachedMaxEra then return false end

	local pPlayer = Players[ePlayer]
	
	if not pPlayer:IsAlive() then return false end
	
	local iCitizens = tValidIsHasCitizens[eBuilding]
	local pCity = pPlayer:GetCityByID(eCity)
	
	if pCity:GetPopulation() >= iCitizens then
		return true
	end
	
	return false
end
GameEvents.CityCanConstruct.Add(IsHasCitizens)

-- checks if player has enough cities (SIKU QANSHU)
function IsHasCities(ePlayer, eCity, eBuilding)
	if not tValidIsHasCities[eBuilding] then return true end
	if bReachedMaxEra then return false end

	local pPlayer = Players[ePlayer]
	
	if not pPlayer:IsAlive() then return false end
	
	local iCities = tValidIsHasCities[eBuilding]
		
	if pPlayer:GetNumCities() >= iCities then
		return true
	end
	
	return false
end
GameEvents.CityCanConstruct.Add(IsHasCitizens)

-- checks if city has enough specialists (STATUE OF LIBERTY)
function IsHasSpecialists(ePlayer, eCity, eBuilding)
	if not tValidIsHasSpecialists[eBuilding] then return true end
	if bReachedMaxEra then return false end

	local pPlayer = Players[ePlayer]
	
	if not pPlayer:IsAlive() then return false end
	
	local iRequiredSpecialists = tValidIsHasSpecialists[eBuilding].iRequiredSpecialists
	local eRequiredSpecialistType =	tValidIsHasSpecialists[eBuilding].eSpecialistType
	local pCity = pPlayer:GetCityByID(eCity)
	local iSpecialistsCount = 0
	
	for specialist in GameInfo.Specialists() do
		local eSpecialist = specialist.ID
		local eSpecialistType = specialist.Type
		
		if eSpecialist ~= 0 and (eSpecialistType == eRequiredSpecialistType or eRequiredSpecialistType == "NONE") then
			iSpecialistsCount = iSpecialistsCount + pCity:GetSpecialistCount(eSpecialist)
			
			if iSpecialistsCount >= iRequiredSpecialists then
				return true
			end
		end
	end
	
	return false
end
GameEvents.CityCanConstruct.Add(IsHasSpecialists)

-- checks if city has place for resources (WIELICZKA, FALUN, LAVAUX, RUHR)
function IsHasPlotsForResources(ePlayer, eCity, eBuilding)
	if not tValidIsHasPlotsForResources[eBuilding] then return true end
	if bReachedMaxEra then return false end

	if Map.GetNumResources(tValidIsHasPlotsForResources[eBuilding]) == 0 then return false end

	local pPlayer = Players[ePlayer]
	
	if not pPlayer:IsAlive() then return false end
	
	local eCheckedResource = tValidIsHasPlotsForResources[eBuilding]
	local pCity = pPlayer:GetCityByID(eCity)
	
	for cityPlot = 1, pCity:GetNumCityPlots() - 1, 1 do
		local pSpecificPlot = pCity:GetCityIndexPlot(cityPlot)
				
		if pSpecificPlot then
			if pSpecificPlot:CanHaveResource(eCheckedResource, true) and pSpecificPlot:GetNumResource() == 0 then
				return true
			end
		end
	end
	
	return false
end
GameEvents.CityCanConstruct.Add(IsHasPlotsForResources)

-- checks if player has research agreements (HUBBLE)
function IsHasResearchAgreements(ePlayer, eCity, eBuilding)
	if not tValidIsHasResearchAgreements[eBuilding] then return true end
	if bReachedMaxEra then return false end
	
	local pPlayer = Players[ePlayer]
	
	if not pPlayer:IsAlive() then return false end
	
	local pTeam = Teams[pPlayer:GetTeam()]

	for i = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
		local pTargetPlayer = Players[i]
				
		if not pTargetPlayer:IsEverAlive() then break end
		
		if pTeam:IsHasResearchAgreement(pTargetPlayer:GetTeam()) then
			return true
		end
	end
	
	return false
end
GameEvents.CityCanConstruct.Add(IsHasResearchAgreements)

-- checks if city is near pole (POLAR EXPEDITION)
function IsAtPolar(ePlayer, eCity, eBuilding)
	if not tValidIsAtPolar[eBuilding] then return true end
	if bReachedMaxEra then return false end

	local pPlayer = Players[ePlayer]
	
	if not pPlayer:IsAlive() then return false end
	
	local pCity = pPlayer:GetCityByID(eCity)
	local iCityY = pCity:GetY()
	local iW, iH = Map.GetGridSize()
	
	if (iCityY >= (iH/2)) then	
		-- Upper half of map;
		if (math.abs((iH/2) - iCityY)/(iH/2)) > 0.6 then
			return true
		end
	else
		-- Lower half of map;
		if (math.abs((iH/2) - iCityY + 1)/(iH/2)) > 0.6 then
			return true
		end
	end

	return false
end
GameEvents.CityCanConstruct.Add(IsAtPolar)

-- temporary FIX for unique buildingclass requirement (ALL)
--[[function IsHasUniqueBuildingClassReq(ePlayer, eCity, eBuilding)
	if not tValidIsHasUniqueBuildingClassReq[eBuilding] then return true end
	if bReachedMaxEra then return false end

	local pPlayer = Players[ePlayer]
	
	if not pPlayer:IsAlive() then return false end
	
	local iBuildingClass1 = tValidIsHasUniqueBuildingClassReq[eBuilding].iBuildingClass1
	local iBuildingClass2 = tValidIsHasUniqueBuildingClassReq[eBuilding].iBuildingClass2
	local pCity = pPlayer:GetCityByID(eCity)
	
	for building in GameInfo.Buildings{BuildingClass=iBuildingClass1} do
		if pCity:IsHasBuilding(building.ID) then
			if iBuildingClass2 == nil then
				return true
			else
				for building in GameInfo.Buildings{BuildingClass=iBuildingClass2} do
					if pCity:IsHasBuilding(building.ID) then
						return true
					end
				end
			end
		end
	end
	
	return false
end
GameEvents.CityCanConstruct.Add(IsHasUniqueBuildingClassReq)--]]
-------------------------------------------------------------------------------------------------------------------------
function Initialize()
	-- IsMaxEra
	for building in GameInfo.Buildings() do
		if building.MaxStartEra ~= nil and building.WonderSplashImage ~= nil then
			tValidIsMaxEra[building.ID] = GameInfo.Eras[building.MaxStartEra].ID
			--dprint("...adding (id,building,era_limit)", building.ID, building.Type, building.MaxStartEra)
		end
	end
	
	-- IsNearLake
	-- add lake buildings ==> lake is when: FreshWater = 1, Water = 1, MinAreaSize = 1
	for building in GameInfo.Buildings() do	
		if building.FreshWater and building.Water and building.MinAreaSize == 1 and building.IsCorporation == 0 then
			local eBuilding = GameInfoTypes[building.Type]
			
			--dprint("...adding (id,building,requirement)", building.ID, building.Type, "(IsNearLake)")
			tValidIsNearLake[building.ID] = true
		end
	end
	
	-- IsProhibitedTerrain
	for building in GameInfo.Buildings() do
		if building.ProhibitedCityTerrain ~= nil then
			--dprint("...adding (id,building,prohibition)", building.ID, building.Type, "(Prohibited: " .. building.ProhibitedCityTerrain .. ")")
			tValidIsProhibitedTerrain[building.ID] = GameInfo.Terrains[building.ProhibitedCityTerrain].ID
		end
	end
	---------------------------------------------------------
	-- LIGHT REQUIREMENTS
	if iRequirementType == 1 then
		-- IsNoCoast
		tValidIsNoCoast = {
			[GameInfo.Buildings.BUILDING_TERRACOTTA_ARMY.ID] = true,
			[GameInfo.Buildings.BUILDING_MORAY.ID] = true,
			[GameInfo.Buildings.BUILDING_GREAT_ZIMBABWE.ID] = true,
			[GameInfo.Buildings.BUILDING_ORSZAGHAZ.ID] = true,
			[GameInfo.Buildings.BUILDING_BUYUK_HAN.ID] = true,
			[GameInfo.Buildings.BUILDING_CHEVALIERS.ID] = true,
			[GameInfo.Buildings.BUILDING_KREMLIN.ID] = true,
			[GameInfo.Buildings.BUILDING_MILESTII_MICI.ID] = true
		}
		-- EE compatibility
		if GameInfo.Buildings.BUILDING_EE_WAT_PHRA_KAEW ~= nil then
			tValidIsNoCoast[GameInfo.Buildings.BUILDING_EE_VERSAILLES.ID] = true
			tValidIsNoCoast[GameInfo.Buildings.BUILDING_EE_FASIL_GHEBBI.ID] = true
		end
		for id, building in pairs(tValidIsNoCoast) do
			--dprint("...adding (id,building,requirement)", id, GameInfo.Buildings[id].Type, "(IsNoCoast)")
		end

		-- IsOneTile
		tValidIsOneTile = {
			[GameInfo.Buildings.BUILDING_MICHEL.ID] = true
		}
		--dprint("...adding (id,building,requirement)", GameInfo.Buildings.BUILDING_MICHEL.ID, GameInfo.Buildings.BUILDING_MICHEL.Type, "(IsOneTile)")
		
		-- IsOnIsthmus
		tValidIsOnIsthmus = {
			[GameInfo.Buildings.BUILDING_PANAMA_CANAL.ID] = true
		}
		for id, building in pairs(tValidIsOnIsthmus) do
			--dprint("...adding (id,building,requirement)", id, GameInfo.Buildings[id].Type, "(IsOnIsthmus)")
		end

		-- IsHasPlotsForResources
		tValidIsHasPlotsForResources = {
			[GameInfo.Buildings.BUILDING_WIELICZKA.ID] = GameInfoTypes.RESOURCE_SALT,
			[GameInfo.Buildings.BUILDING_FALUN.ID] = GameInfoTypes.RESOURCE_COPPER,
			[GameInfo.Buildings.BUILDING_LAVAUX.ID] = GameInfoTypes.RESOURCE_WINE,
			[GameInfo.Buildings.BUILDING_RUHR_VALLEY.ID] = GameInfoTypes.RESOURCE_COAL,
			[GameInfo.Buildings.BUILDING_POLAR_EXPEDITION.ID] = GameInfoTypes.RESOURCE_OIL
		}
		for id, building in pairs(tValidIsHasPlotsForResources) do
			--dprint("...adding (id,building,resource)", id, GameInfo.Buildings[id].Type, tValidIsHasPlotsForResources[id])
		end

		-- IsHasImprovement
		tValidIsHasImprovement[GameInfo.Buildings.BUILDING_LOUVRE.ID] = {
			eRequiredImprovement1 = GameInfoTypes.IMPROVEMENT_LANDMARK,
			iRequiredImprovements = 1
		}
		for id, building in pairs(tValidIsHasImprovement) do
			--dprint("...adding (id,building,improvement1,improvement2,count,roads)", id, GameInfo.Buildings[id].Type, building.eRequiredImprovement1, building.eRequiredImprovement2, building.iRequiredImprovements, building.iRequiredRoads)
		end
	end
	---------------------------------------------------------
	-- HARD REQUIREMENTS
	if iRequirementType == 2 then
		-- IsNoCoast
		tValidIsNoCoast = {
			[GameInfo.Buildings.BUILDING_GOEBEKLI_TEPE.ID] = true,
			[GameInfo.Buildings.BUILDING_MOHENJO_DARO.ID] = true,
			[GameInfo.Buildings.BUILDING_STONEHENGE.ID] = true,
			[GameInfo.Buildings.BUILDING_NAZCA.ID] = true,
			[GameInfo.Buildings.BUILDING_THONG_HAI_HIN.ID] = true,
			[GameInfo.Buildings.BUILDING_HANGING_GARDEN.ID] = true,
			[GameInfo.Buildings.BUILDING_SIGIRIYA.ID] = true,			
			[GameInfo.Buildings.BUILDING_TERRACOTTA_ARMY.ID] = true,
			[GameInfo.Buildings.BUILDING_ETCHMIADZIN.ID] = true,
			[GameInfo.Buildings.BUILDING_MORAY.ID] = true,
			[GameInfo.Buildings.BUILDING_GREAT_ZIMBABWE.ID] = true,
			[GameInfo.Buildings.BUILDING_BUYUK_HAN.ID] = true,
			[GameInfo.Buildings.BUILDING_CHEVALIERS.ID] = true,
			[GameInfo.Buildings.BUILDING_TAJ_MAHAL.ID] = true,
			[GameInfo.Buildings.BUILDING_RED_FORT.ID] = true,
			[GameInfo.Buildings.BUILDING_SIBERIAN_RAILWAY.ID] = true,
			[GameInfo.Buildings.BUILDING_ORSZAGHAZ.ID] = true,
			[GameInfo.Buildings.BUILDING_MOTHERLAND_STATUE.ID] = true,
			[GameInfo.Buildings.BUILDING_BLETCHLEY_PARK.ID] = true,
			[GameInfo.Buildings.BUILDING_ANITKABIR.ID] = true,
			[GameInfo.Buildings.BUILDING_KREMLIN.ID] = true,
			[GameInfo.Buildings.BUILDING_MILESTII_MICI.ID] = true,
			[GameInfo.Buildings.BUILDING_MILLAU.ID] = true,
			[GameInfo.Buildings.BUILDING_SEED_VAULT.ID] = true,
			[GameInfo.Buildings.BUILDING_TEMBLEQUE.ID] = true,
			[GameInfo.Buildings.BUILDING_CURIOSITY.ID] = true			
		}
		-- EE compatibility
		if GameInfo.Buildings.BUILDING_EE_WAT_PHRA_KAEW ~= nil then
			tValidIsNoCoast[GameInfo.Buildings.BUILDING_EE_VERSAILLES.ID] = true
			tValidIsNoCoast[GameInfo.Buildings.BUILDING_EE_FASIL_GHEBBI.ID] = true
		end
		for id, building in pairs(tValidIsNoCoast) do
			--dprint("...adding (id,building,requirement)", id, GameInfo.Buildings[id].Type, "(IsNoCoast)")
		end

		-- IsHasMountains
		tValidIsHasMountains = {
			[GameInfo.Buildings.BUILDING_MACHU_PICHU.ID] = true,
			[GameInfo.Buildings.BUILDING_BAMYAN.ID] = true,
			[GameInfo.Buildings.BUILDING_DARJEELING.ID] = true
		}
		for id, building in pairs(tValidIsHasMountains) do
			--dprint("...adding (id,building,requirement)", id, GameInfo.Buildings[id].Type, "(IsHasMountains)")
		end

		-- IsOneTile
		tValidIsOneTile = {
			[GameInfo.Buildings.BUILDING_MICHEL.ID] = true
		}
		--dprint("...adding (id,building,requirement)", GameInfo.Buildings.BUILDING_MICHEL.ID, GameInfo.Buildings.BUILDING_MICHEL.Type, "(IsOneTile)")
		
		-- IsAtPeace
		tValidIsAtPeace = {
			[GameInfo.Buildings.BUILDING_BAMYAN.ID] = true,
			[GameInfo.Buildings.BUILDING_OLD_BRIDGE.ID] = true
		}
		--dprint("...adding (id,building,requirement)", GameInfo.Buildings.BUILDING_BAMYAN.ID, GameInfo.Buildings.BUILDING_BAMYAN.Type, "(IsAtPeace)")

		-- IsReligionFounded
		tValidIsReligionFounded = {
			[GameInfo.Buildings.BUILDING_SISTINE_CHAPEL.ID] = true
		}
		for id, building in pairs(tValidIsReligionFounded) do
			--dprint("...adding (id,building,requirement)", id, GameInfo.Buildings[id].Type, "(IsReligionFounded)")
		end

		-- IsOnIsthmus
		tValidIsOnIsthmus = {
			[GameInfo.Buildings.BUILDING_PANAMA_CANAL.ID] = true
		}
		for id, building in pairs(tValidIsOnIsthmus) do
			--dprint("...adding (id,building,requirement)", id, GameInfo.Buildings[id].Type, "(IsOnIsthmus)")
		end

		-- IsHasImprovement
		tValidIsHasImprovement[GameInfo.Buildings.BUILDING_GGANTIJA.ID] = {
			eRequiredImprovement1 = GameInfoTypes.IMPROVEMENT_FARM,
			iRequiredImprovements = 2
		}
		tValidIsHasImprovement[GameInfo.Buildings.BUILDING_TEMPLE_ARTEMIS.ID] = {
			eRequiredImprovement1 = GameInfoTypes.IMPROVEMENT_CAMP,
			eRequiredImprovement2 = GameInfoTypes.IMPROVEMENT_PLANTATION,
			iRequiredImprovements = 1
		}
		tValidIsHasImprovement[GameInfo.Buildings.BUILDING_WIELICZKA.ID] = {
			eRequiredImprovement1 = GameInfoTypes.IMPROVEMENT_MINE,
			iRequiredImprovements = 2
		}
		tValidIsHasImprovement[GameInfo.Buildings.BUILDING_MAUSOLEUM_HALICARNASSUS.ID] = {
			eRequiredImprovement1 = GameInfoTypes.IMPROVEMENT_QUARRY,
			iRequiredImprovements = 1
		}
		tValidIsHasImprovement[GameInfo.Buildings.BUILDING_TERRACOTTA_ARMY.ID] = {
			eRequiredImprovement1 = GameInfoTypes.IMPROVEMENT_MINE,
			eRequiredImprovement2 = GameInfoTypes.IMPROVEMENT_QUARRY,
			iRequiredImprovements = 2
		}
		tValidIsHasImprovement[GameInfo.Buildings.BUILDING_MORAY.ID] = {
			eRequiredImprovement1 = GameInfoTypes.IMPROVEMENT_FARM,
			iRequiredImprovements = 1
		}
		tValidIsHasImprovement[GameInfo.Buildings.BUILDING_GREAT_ZIMBABWE.ID] = {
			eRequiredImprovement1 = GameInfoTypes.IMPROVEMENT_MINE,
			eRequiredImprovement2 = GameInfoTypes.IMPROVEMENT_CAMP,
			iRequiredImprovements = 3
		}
		tValidIsHasImprovement[GameInfo.Buildings.BUILDING_BENHADDOU.ID] = {
			eRequiredImprovement1 = GameInfoTypes.IMPROVEMENT_TRADING_POST,
			iRequiredImprovements = 1
		}
		tValidIsHasImprovement[GameInfo.Buildings.BUILDING_KILWA_KISIWANI.ID] = {
			eRequiredImprovement1 = GameInfoTypes.IMPROVEMENT_MINE,
			eRequiredImprovement2 = GameInfoTypes.IMPROVEMENT_CAMP,
			iRequiredImprovements = 3
		}
		tValidIsHasImprovement[GameInfo.Buildings.BUILDING_FALUN.ID] = {
			eRequiredImprovement1 = GameInfoTypes.IMPROVEMENT_MINE,
			iRequiredImprovements = 2
		}
		tValidIsHasImprovement[GameInfo.Buildings.BUILDING_BUYUK_HAN.ID] = {
			eRequiredImprovement1 = GameInfoTypes.IMPROVEMENT_TRADING_POST,
			iRequiredImprovements = 1
		}
		tValidIsHasImprovement[GameInfo.Buildings.BUILDING_BRANDENBURG_GATE.ID] = {
			eRequiredImprovement1 = GameInfoTypes.IMPROVEMENT_CITADEL,
			eRequiredImprovement2 = GameInfoTypes.IMPROVEMENT_FORT,
			iRequiredImprovements = 1
		}
		tValidIsHasImprovement[GameInfo.Buildings.BUILDING_LOUVRE.ID] = {
			eRequiredImprovement1 = GameInfoTypes.IMPROVEMENT_LANDMARK,
			iRequiredImprovements = 1
		}
		tValidIsHasImprovement[GameInfo.Buildings.BUILDING_PENTAGON.ID] = {
			eRequiredImprovement1 = GameInfoTypes.IMPROVEMENT_CITADEL,
			eRequiredImprovement2 = GameInfoTypes.IMPROVEMENT_FORT,
			iRequiredImprovements = 1
		}
		tValidIsHasImprovement[GameInfo.Buildings.BUILDING_AKIHABARA.ID] = {
			eRequiredImprovement1 = GameInfoTypes.IMPROVEMENT_CUSTOMS_HOUSE,
			iRequiredImprovements = 1
		}
		tValidIsHasImprovement[GameInfo.Buildings.BUILDING_MILLAU.ID] = {
			eRequiredImprovement1 = GameInfoTypes.IMPROVEMENT_TRADING_POST,
			iRequiredImprovements = 1
		}
		tValidIsHasImprovement[GameInfo.Buildings.BUILDING_ARECIBO.ID] = {
			eRequiredImprovement1 = GameInfoTypes.IMPROVEMENT_ACADEMY,
			iRequiredImprovements = 1
		}
		tValidIsHasImprovement[GameInfo.Buildings.BUILDING_TAIPEI.ID] = {
			eRequiredImprovement1 = GameInfoTypes.IMPROVEMENT_TRADING_POST,
			iRequiredImprovements = 1
		}
		-- EE compatibility
		if GameInfo.Buildings.BUILDING_EE_WAT_PHRA_KAEW ~= nil then
			tValidIsHasImprovement[GameInfo.Buildings.BUILDING_EE_WAT_PHRA_KAEW.ID] = {
				eRequiredImprovement1 = GameInfoTypes.IMPROVEMENT_HOLY_SITE,
				iRequiredImprovements = 1
			}
			tValidIsHasImprovement[GameInfo.Buildings.BUILDING_EE_SMITHSONIAN.ID] = {
				eRequiredImprovement1 = GameInfoTypes.IMPROVEMENT_ACADEMY,
				iRequiredImprovements = 1
			}
		end
		for id, building in pairs(tValidIsHasImprovement) do
			--dprint("...adding (id,building,improvement1,improvement2,count,roads)", id, GameInfo.Buildings[id].Type, building.eRequiredImprovement1, building.eRequiredImprovement2, building.iRequiredImprovements, building.iRequiredRoads)
		end
	
		-- IsMajorApproach
		tValidIsMajorApproach[GameInfo.Buildings.BUILDING_STATUE_ZEUS.ID] = {
			eRequiredApproach1 = GameInfoTypes.MAJOR_CIV_APPROACH_WAR,
			eRequiredApproach2 = GameInfoTypes.MAJOR_CIV_APPROACH_HOSTILE,
			eRequiredApproach3 = GameInfoTypes.MAJOR_CIV_APPROACH_GUARDED,
			eRequiredApproach4 = GameInfoTypes.MAJOR_CIV_APPROACH_AFRAID
		}
		tValidIsMajorApproach[GameInfo.Buildings.BUILDING_GREAT_WALL.ID] = {
			eRequiredApproach1 = GameInfoTypes.MAJOR_CIV_APPROACH_WAR,
			eRequiredApproach2 = GameInfoTypes.MAJOR_CIV_APPROACH_HOSTILE,
			eRequiredApproach3 = GameInfoTypes.MAJOR_CIV_APPROACH_DECEPTIVE
		}
		for id, building in pairs(tValidIsMajorApproach) do
			--dprint("...adding (id,building,approach1,approach2,approach3,approach4)", id, GameInfo.Buildings[id].Type, building.eRequiredApproach1, building.eRequiredApproach2, building.eRequiredApproach3, building.eRequiredApproach4)
		end
	
		-- IsHasCsAllies
		tValidIsHasCsAllies = {
			[GameInfo.Buildings.BUILDING_PORCELAIN_TOWER.ID] = 2,
			[GameInfo.Buildings.BUILDING_HOUSE_OF_TRADE.ID] = 2,
			[GameInfo.Buildings.BUILDING_BIG_BEN.ID] = 3,
			[GameInfo.Buildings.BUILDING_TAIPEI.ID] = 3
		}
		for id, building in pairs(tValidIsHasCsAllies) do
			--dprint("...adding (id,building,allies)", id, GameInfo.Buildings[id].Type, tValidIsHasCsAllies[id])
		end

		-- IsHappiness
		tValidIsHappiness = {
			[GameInfo.Buildings.BUILDING_BAKKEN.ID] = 70,
			[GameInfo.Buildings.BUILDING_CN_TOWER.ID] = 80
		}
		for id, building in pairs(tValidIsHappiness) do
			--dprint("...adding (id,building,happiness)", id, GameInfo.Buildings[id].Type, tValidIsHappiness[id])
		end
	
		-- IsHasGreatWorks
		tValidIsHasGreatWorks[GameInfo.Buildings.BUILDING_UFFIZI.ID] = {
			eGreatWorkType = "GREAT_WORK_SLOT_ART_ARTIFACT",
			iRequiredGreatWorks = 3
		}
		tValidIsHasGreatWorks[GameInfo.Buildings.BUILDING_MUSEUM_ISLAND.ID] = {
			eGreatWorkType = "GREAT_WORK_SLOT_ART_ARTIFACT",
			iRequiredGreatWorks = 4
		}
		tValidIsHasGreatWorks[GameInfo.Buildings.BUILDING_LOUVRE.ID] = {
			eGreatWorkType = "GREAT_WORK_SLOT_ART_ARTIFACT",
			iRequiredGreatWorks = 4
		}
		tValidIsHasGreatWorks[GameInfo.Buildings.BUILDING_BROADWAY.ID] = {
			eGreatWorkType = "GREAT_WORK_SLOT_MUSIC",
			iRequiredGreatWorks = 3
		}
		tValidIsHasGreatWorks[GameInfo.Buildings.BUILDING_SYDNEY_OPERA_HOUSE.ID] = {
			eGreatWorkType = "GREAT_WORK_SLOT_MUSIC",
			iRequiredGreatWorks = 4
		}
		tValidIsHasGreatWorks[GameInfo.Buildings.BUILDING_SIKU_QUANSHU.ID] = {
			eGreatWorkType = "GREAT_WORK_SLOT_LITERATURE",
			iRequiredGreatWorks = 4
		}
		for id, building in pairs(tValidIsHasGreatWorks) do
			--dprint("...adding (id,building,gwtype,count)", id, GameInfo.Buildings[id].Type, building.eGreatWorkType, building.iRequiredGreatWorks)
		end
	
		-- IsHasCitizens
		tValidIsHasCitizens = {
			[GameInfo.Buildings.BUILDING_BROOKLYN.ID] = 25
		}
		for id, building in pairs(tValidIsHasCitizens) do
			--dprint("...adding (id,building,citizens)", id, GameInfo.Buildings[id].Type, tValidIsHasCitizens[id])
		end

		-- IsHasCities
		tValidIsHasCities = {
			[GameInfo.Buildings.BUILDING_SIKU_QUANSHU.ID] = 7,
			[GameInfo.Buildings.BUILDING_INTERSTATE.ID] = 8
		}
		for id, building in pairs(tValidIsHasCities) do
			--dprint("...adding (id,building,cities)", id, GameInfo.Buildings[id].Type, tValidIsHasCities[id])
		end

		-- IsHasUniqueBuildingClassReq
		--[[tValidIsHasUniqueBuildingClassReq[GameInfo.Buildings.BUILDING_MALWIYA.ID] = {
			iBuildingClass1 = "BUILDINGCLASS_STONE_WORKS"
		}
		tValidIsHasUniqueBuildingClassReq[GameInfo.Buildings.BUILDING_CHAND_BAORI.ID] = {
			iBuildingClass1 = "BUILDINGCLASS_WELL"
		}
		tValidIsHasUniqueBuildingClassReq[GameInfo.Buildings.BUILDING_MOSQUE_OF_DJENNE.ID] = {
			iBuildingClass1 = "BUILDINGCLASS_LIBRARY"
		}
		tValidIsHasUniqueBuildingClassReq[GameInfo.Buildings.BUILDING_WARTBURG.ID] = {
			iBuildingClass1 = "BUILDINGCLASS_WRITERS_GUILD"
		}
		tValidIsHasUniqueBuildingClassReq[GameInfo.Buildings.BUILDING_FORBIDDEN_PALACE.ID] = {
			iBuildingClass1 = "BUILDINGCLASS_WALLS",
			iBuildingClass2 = "BUILDINGCLASS_PALACE"		
		}
		tValidIsHasUniqueBuildingClassReq[GameInfo.Buildings.BUILDING_GLOBE_THEATER.ID] = {
			iBuildingClass1 = "BUILDINGCLASS_BATH",
			iBuildingClass2 = "BUILDINGCLASS_AMPHITHEATER"
		}
		tValidIsHasUniqueBuildingClassReq[GameInfo.Buildings.BUILDING_MARAE.ID] = {
			iBuildingClass1 = "BUILDINGCLASS_GARDEN"
		}
		tValidIsHasUniqueBuildingClassReq[GameInfo.Buildings.BUILDING_SISTINE_CHAPEL.ID] = {
			iBuildingClass1 = "BUILDINGCLASS_ARTISTS_GUILD"
		}
		tValidIsHasUniqueBuildingClassReq[GameInfo.Buildings.BUILDING_SIBERIAN_RAILWAY.ID] = {
			iBuildingClass1 = "BUILDINGCLASS_TRAINSTATION"
		}
		tValidIsHasUniqueBuildingClassReq[GameInfo.Buildings.BUILDING_KEW_GARDENS.ID] = {
			iBuildingClass1 = "BUILDINGCLASS_STOCKYARD",
			iBuildingClass2 = "BUILDINGCLASS_GARDEN"
		}
		tValidIsHasUniqueBuildingClassReq[GameInfo.Buildings.BUILDING_DARJEELING.ID] = {
			iBuildingClass1 = "BUILDINGCLASS_TRAINSTATION"
		}
		tValidIsHasUniqueBuildingClassReq[GameInfo.Buildings.BUILDING_ORSZAGHAZ.ID] = {
			iBuildingClass1 = "BUILDINGCLASS_CONSTABLE"
		}
		tValidIsHasUniqueBuildingClassReq[GameInfo.Buildings.BUILDING_GREAT_FIREWALL.ID] = {
			iBuildingClass1 = "BUILDINGCLASS_POLICE_STATION",
			iBuildingClass2 = "BUILDINGCLASS_WIRE_SERVICE"
		}
		tValidIsHasUniqueBuildingClassReq[GameInfo.Buildings.BUILDING_CERN.ID] = {
			iBuildingClass1 = "BUILDINGCLASS_LABORATORY"
		}
		for id, building in pairs(tValidIsHasUniqueBuildingClassReq) do
			dprint("...adding (id,building,buildingclass1,buildingclass2)", id, GameInfo.Buildings[id].Type, building.iBuildingClass1, building.iBuildingClass2)
		end--]]

		-- IsHasSpecialist
		tValidIsHasSpecialists[GameInfo.Buildings.BUILDING_STATUE_OF_LIBERTY.ID] = {
			eSpecialistType = "NONE",
			iRequiredSpecialists = 10
		}
		tValidIsHasSpecialists[GameInfo.Buildings.BUILDING_AKIHABARA.ID] = {
			eSpecialistType = "SPECIALIST_MERCHANT",
			iRequiredSpecialists = 3
		}
		tValidIsHasSpecialists[GameInfo.Buildings.BUILDING_CONCORDE.ID] = {
			eSpecialistType = "SPECIALIST_ENGINEER",
			iRequiredSpecialists = 3
		}
		tValidIsHasSpecialists[GameInfo.Buildings.BUILDING_SPUTNIK.ID] = {
			eSpecialistType = "SPECIALIST_SCIENTIST",
			iRequiredSpecialists = 3
		}
		for id, building in pairs(tValidIsHasSpecialists) do
			--dprint("...adding (id,building,specialists)", id, GameInfo.Buildings[id].Type, building.eSpecialistType, building.iRequiredSpecialists)
		end

		-- IsHasResearchAgreement
		tValidIsHasResearchAgreements = {
			[GameInfo.Buildings.BUILDING_HUBBLE.ID] = true
		}
		for id, building in pairs(tValidIsHasResearchAgreements) do
			--dprint("...adding (id,building,research)", id, GameInfo.Buildings[id].Type, tValidIsHasResearchAgreements[id])
		end	

		-- IsAtPolar
		tValidIsAtPolar = {
			[GameInfo.Buildings.BUILDING_POLAR_EXPEDITION.ID] = true
		}
		for id, building in pairs(tValidIsAtPolar) do
			--dprint("...adding (id,building,polar)", id, GameInfo.Buildings[id].Type, tValidIsAtPolar[id])
		end	

		-- IsHasPlotsForResources
		tValidIsHasPlotsForResources = {
			[GameInfo.Buildings.BUILDING_WIELICZKA.ID] = GameInfoTypes.RESOURCE_SALT,
			[GameInfo.Buildings.BUILDING_FALUN.ID] = GameInfoTypes.RESOURCE_COPPER,
			[GameInfo.Buildings.BUILDING_LAVAUX.ID] = GameInfoTypes.RESOURCE_WINE,
			[GameInfo.Buildings.BUILDING_RUHR_VALLEY.ID] = GameInfoTypes.RESOURCE_COAL,
			[GameInfo.Buildings.BUILDING_POLAR_EXPEDITION.ID] = GameInfoTypes.RESOURCE_OIL
		}
		for id, building in pairs(tValidIsHasPlotsForResources) do
			--dprint("...adding (id,building,resource)", id, GameInfo.Buildings[id].Type, tValidIsHasPlotsForResources[id])
		end
	end
end

Initialize()
--------------------------------------------------------------
--------------------------------------------------------------
print("Loaded UniqueWorldWondersRequirements.lua from MWfVP")
--------------------------------------------------------------
--------------------------------------------------------------
