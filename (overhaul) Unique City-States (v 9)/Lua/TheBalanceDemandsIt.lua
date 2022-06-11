local eSphere = GameInfoTypes.RESOLUTION_SPHERE_OF_INFLUENCE

local tLostCities = {}

local tEventChoice = {
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_BOGOTA, -- 1
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_BRUSSELS,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_CAHOKIA,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_CAPE_TOWN,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_MANILA,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_ZURICH, -- 6
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_SIDON,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_LHASA,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_OC_EO,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_THIMPHU,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_ANDORRA, -- 11
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_CANOSSA,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_LEVUKA
}

local tBuildingsActiveAbilities = {
	GameInfoTypes.BUILDING_LHASA, -- 1
	GameInfoTypes.BUILDING_OC_EO,
	GameInfoTypes.BUILDING_OC_EO_2,
	GameInfoTypes.BUILDING_THIMPHU,
	GameInfoTypes.BUILDING_THIMPHU_2,
	GameInfoTypes.BUILDING_ANDORRA, -- 6
	GameInfoTypes.BUILDING_CANOSSA,
	GameInfoTypes.BUILDING_TEMPLE,
	GameInfoTypes.BUILDING_LEVUKA
}

local tBuildingsPassiveAbilities = {
	GameInfoTypes.BUILDING_MARITIME, -- 1
	GameInfoTypes.BUILDING_MARITIME_FRIENDLY,
	GameInfoTypes.BUILDING_MARITIME_NEUTRAL,
	GameInfoTypes.BUILDING_MARITIME_HOSTILE,
	GameInfoTypes.BUILDING_MERCANTILE,
	GameInfoTypes.BUILDING_MERCANTILE_FRIENDLY, -- 6
	GameInfoTypes.BUILDING_MERCANTILE_NEUTRAL,
	GameInfoTypes.BUILDING_MERCANTILE_HOSTILE,
	GameInfoTypes.BUILDING_CULTURED,
	GameInfoTypes.BUILDING_CULTURED_FRIENDLY,
	GameInfoTypes.BUILDING_CULTURED_NEUTRAL, -- 11
	GameInfoTypes.BUILDING_CULTURED_HOSTILE,
	GameInfoTypes.BUILDING_RELIGIOUS,
	GameInfoTypes.BUILDING_RELIGIOUS_FRIENDLY,
	GameInfoTypes.BUILDING_RELIGIOUS_NEUTRAL,
	GameInfoTypes.BUILDING_RELIGIOUS_HOSTILE, -- 16
	GameInfoTypes.BUILDING_MILITARISTIC,
	GameInfoTypes.BUILDING_MILITARISTIC_FRIENDLY,
	GameInfoTypes.BUILDING_MILITARISTIC_NEUTRAL,
	GameInfoTypes.BUILDING_MILITARISTIC_HOSTILE
}

local ePolicyMaritime = GameInfoTypes.POLICY_MARITIME
local ePolicyReligious = GameInfoTypes.POLICY_RELIGIOUS
local ePolicyReligiousFriendly = GameInfoTypes.POLICY_RELIGIOUS_FRIENDLY
local ePolicyMilitaristic = GameInfoTypes.POLICY_MILITARISTIC
local ePolicyMilitaristicFriendly = GameInfoTypes.POLICY_MILITARISTIC_FRIENDLY

local eBuildMarsh = GameInfoTypes.BUILD_MARSH
local eBuildMound = GameInfoTypes.BUILD_MOUND

local eImprovementMarsh = GameInfoTypes.IMPROVEMENT_MARSH
local eImprovementForest = GameInfoTypes.IMPROVEMENT_PLANT_FOREST
local eImprovementJungle = GameInfoTypes.IMPROVEMENT_PLANT_JUNGLE
local eImprovementEmbassy = GameInfoTypes.IMPROVEMENT_EMBASSY
local eImprovementHolySite = GameInfoTypes.IMPROVEMENT_HOLY_SITE
local eImprovementFort = GameInfoTypes.IMPROVEMENT_FORT
local eImprovementManufactory = GameInfoTypes.IMPROVEMENT_MANUFACTORY
local eImprovementTown = GameInfoTypes.IMPROVEMENT_CUSTOMS_HOUSE
local eImprovementAcademy = GameInfoTypes.IMPROVEMENT_ACADEMY

local eFeatureMarsh = GameInfoTypes.FEATURE_MARSH

local ePlotFlat = GameInfoTypes.PLOT_LAND
local ePlotHill = GameInfoTypes.PLOT_HILLS
local ePlotMountain = GameInfoTypes.PLOT_MOUNTAIN
local ePlotWater = GameInfoTypes.PLOT_OCEAN

local eUnitGreatDiplomat = GameInfoTypes.UNIT_GREAT_DIPLOMAT
local eUnitMissionary = GameInfoTypes.UNIT_MISSIONARY
local eUnitWorker = GameInfoTypes.UNIT_WORKER
local eUnitFishingBoat = GameInfoTypes.UNIT_WORKBOAT

local tMinorTraits = {
	GameInfoTypes.MINOR_TRAIT_MARITIME,
	GameInfoTypes.MINOR_TRAIT_MERCANTILE,
	GameInfoTypes.MINOR_TRAIT_CULTURED,
	GameInfoTypes.MINOR_TRAIT_RELIGIOUS,
	GameInfoTypes.MINOR_TRAIT_MILITARISTIC
}

local tMinorPersonalities = {
	MinorCivPersonalityTypes.MINOR_CIV_PERSONALITY_FRIENDLY,
	MinorCivPersonalityTypes.MINOR_CIV_PERSONALITY_NEUTRAL,
	MinorCivPersonalityTypes.MINOR_CIV_PERSONALITY_HOSTILE
}

-- for events to start
local iThresholdPseudoAllies = 3 * GameDefines.FRIENDSHIP_THRESHOLD_ALLIES
local bIsAllyAnOption = true
local bIsEmbassyAnOption = true
local bIsPseudoAllyAnOption = true
local tEmbassies = {}

-- for CS UU gifts (MinorCivGift=1)
local tUniqueUnitsFromMinors = {}
	tUniqueUnitsFromMinors["UNIT_HUNNIC_BATTERING_RAM"] = {
		eUnit = GameInfoTypes.UNIT_SPEARMAN
	}
	tUniqueUnitsFromMinors["UNIT_DANISH_SKI_INFANTRY"] = {
		eUnit = GameInfoTypes.UNIT_RIFLEMAN
	}
	tUniqueUnitsFromMinors["UNIT_BRAZILIAN_PRACINHA"] = {
		eUnit = GameInfoTypes.UNIT_INFANTRY
	}
	tUniqueUnitsFromMinors["UNIT_ENGLISH_LONGBOWMAN"] = {
		eUnit = GameInfoTypes.UNIT_CROSSBOWMAN
	}
	tUniqueUnitsFromMinors["UNIT_GREEK_COMPANIONCAVALRY"] = {
		eUnit = GameInfoTypes.UNIT_HORSEMAN
	}
	tUniqueUnitsFromMinors["UNIT_OTTOMAN_SIPAHI"] = {
		eUnit = GameInfoTypes.UNIT_LANCER
	}
	tUniqueUnitsFromMinors["UNIT_SWEDISH_HAKKAPELIITTA"] = {
		eUnit = GameInfoTypes.UNIT_LANCER
	}
	tUniqueUnitsFromMinors["UNIT_KOREAN_TURTLE_SHIP"] = {
		eUnit = GameInfoTypes.UNIT_CARAVEL
	}
	tUniqueUnitsFromMinors["UNIT_VENETIAN_GALLEASS"] = {
		eUnit = GameInfoTypes.UNIT_GALLEASS
	}
	tUniqueUnitsFromMinors["UNIT_ROMAN_BALLISTA"] = {
		eUnit = GameInfoTypes.UNIT_CATAPULT
	}
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
function RandomNumberBetween(iLower, iHigher)
    return (Game.Rand((iHigher + 1) - iLower, "")) + iLower
end
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
-- Resetting cooldown for active events for civs passing the threshold and setting new events
function MinorPlayerDoTurn(ePlayer)
	if Players[ePlayer]:IsMinorCiv() then
		local pMinorPlayer = Players[ePlayer]
		local sMinorCivType = GameInfo.MinorCivilizations[pMinorPlayer:GetMinorCivType()].Type
		
		-- Ally part
		if bIsAllyAnOption then
			if pMinorPlayer:GetAlly() ~= -1 then 
				local pMajorPlayer = Players[pMinorPlayer:GetAlly()]
				
				if pMajorPlayer:GetEventChoiceCooldown(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. sMinorCivType]) ~= 0 then
					pMajorPlayer:SetEventChoiceCooldown(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. sMinorCivType], 3)
				end 
				
				if pMajorPlayer:GetEventChoiceCooldown(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. sMinorCivType]) == 0 and not pMajorPlayer:IsEventChoiceActive(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. sMinorCivType]) then
					pMajorPlayer:DoEventChoice(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. sMinorCivType])
					
					if pMajorPlayer:IsHuman() then
						pMajorPlayer:AddNotification(NotificationTypes.NOTIFICATION_MET_MINOR, "You became an Ally of [COLOR_CYAN]" .. pMinorPlayer:GetName() .. "[ENDCOLOR] and you are first in queue to benefit from the knowledge, technologies, experience and informations of its citizens. Watch for the new bonuses from this City-State.", "City-State's Alliance bonuses!", pMinorPlayer:GetCapitalCity():GetX(), pMinorPlayer:GetCapitalCity():GetY())
					end
				end
			end
		end
		
		-- Embassy part
		if bIsEmbassyAnOption then
			if pMinorPlayer:GetImprovementCount(eImprovementEmbassy) > 0 then
				if tEmbassies[ePlayer] == nil then
					local pMinorCapital = pMinorPlayer:GetCapitalCity()
				
					for i = 0, pMinorCapital:GetNumCityPlots() - 1, 1 do
						local pPlot = pMinorCapital:GetCityIndexPlot(i)
					   
						if pPlot and pPlot:GetOwner() == ePlayer and pPlot:GetImprovementType() == eImprovementEmbassy then
							tEmbassies[ePlayer] = pPlot:GetPlayerThatBuiltImprovement()
							break
						end
					end
				end
				
				local pMajorPlayer = Players[tEmbassies[ePlayer]]
				
				if pMajorPlayer:GetEventChoiceCooldown(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. sMinorCivType]) ~= 0 then
					pMajorPlayer:SetEventChoiceCooldown(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. sMinorCivType], 3)
				end 
				
				if pMajorPlayer:GetEventChoiceCooldown(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. sMinorCivType]) == 0 and not pMajorPlayer:IsEventChoiceActive(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. sMinorCivType]) then
					pMajorPlayer:DoEventChoice(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. sMinorCivType])
					
					if pMajorPlayer:IsHuman() then
						pMajorPlayer:AddNotification(NotificationTypes.NOTIFICATION_MET_MINOR, "You established an Embassy in [COLOR_CYAN]" .. pMinorPlayer:GetName() .. "[ENDCOLOR], therefore you gain a permanent access to the knowledge, technologies, experience and informations of its citizens. Watch for the new bonuses from this City-State.", "City-State's permanent bonuses from an Embassy!", pMinorPlayer:GetCapitalCity():GetX(), pMinorPlayer:GetCapitalCity():GetY())
					end
				end
			end
		end
		
		-- pseudoAlly part
		if bIsPseudoAllyAnOption then
			for ePlayer, pPlayer in ipairs(Players) do
				if pPlayer and pPlayer:IsAlive() then
					if pPlayer:IsMinorCiv() then break end
					if not pPlayer:IsEverAlive() then break end
					
					if pMinorPlayer:GetMinorCivFriendshipWithMajor(ePlayer) >= iThresholdPseudoAllies then
						if pPlayer:GetEventChoiceCooldown(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. sMinorCivType]) ~= 0 then
							pPlayer:SetEventChoiceCooldown(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. sMinorCivType], 3)
						end
						
						if pPlayer:GetEventChoiceCooldown(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. sMinorCivType]) == 0 and not pPlayer:IsEventChoiceActive(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. sMinorCivType]) then
							pPlayer:DoEventChoice(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. sMinorCivType])
							
							if pPlayer:IsHuman() then
								pPlayer:AddNotification(NotificationTypes.NOTIFICATION_MET_MINOR, "Now you are under the influence of [COLOR_CYAN]" .. pMinorPlayer:GetName() .. "[ENDCOLOR] and may benefit from the knowledge, technologies, experience and informations of its citizens. Watch for the new bonuses from this City-State.", "Overwhelming influence with a City-State!", pMinorPlayer:GetCapitalCity():GetX(), pMinorPlayer:GetCapitalCity():GetY())
							end
						end
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(MinorPlayerDoTurn)

-- !!!Moved to previous function (no way for using that one)
--[[function ImbalanceDemandsIt(eMinor, eMajor, bIsAlly, iOldFriendship, iNewFriendship)
	local pMinorPlayer = Players[eMinor]
	local pMajorPlayer = Players[eMajor]
	
	if bIsAlly then
		if pMajorPlayer:GetEventChoiceCooldown(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. GameInfo.MinorCivilizations[pMinorPlayer:GetMinorCivType()].Type]) == 0 and not pMajorPlayer:IsEventChoiceActive(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. GameInfo.MinorCivilizations[minorPlayer:GetMinorCivType()].Type]) then
			pMajorPlayer:DoEventChoice(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. GameInfo.MinorCivilizations[pMinorPlayer:GetMinorCivType()].Type])
		end
	end
end
GameEvents.MinorAlliesChanged.Add(ImbalanceDemandsIt)--]]

-- Setting events after Sphere of Influence voting
function MovingSwiftly(eResolution, eProposer, eChoice, bEnact, bPassed)
	if eResolution == eSphere then
		local pMinorPlayer = Players[eChoice]
		local pMajorPlayer = Players[eProposer]
	
		if bEnact and bPassed then
			if pMajorPlayer:GetEventChoiceCooldown(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. GameInfo.MinorCivilizations[pMinorPlayer:GetMinorCivType()].Type]) == 0 then
				pMajorPlayer:DoEventChoice(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. GameInfo.MinorCivilizations[pMinorPlayer:GetMinorCivType()].Type])	
			end
		end
	end
end
GameEvents.ResolutionResult.Add(MovingSwiftly)
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
-- Unique stuff for CSs types and personalities
-- MARITIME
function MaritimeCityStatesBonuses(ePlayer, iX, iY)
	local pPlayer = Players[ePlayer]
	
	if not pPlayer:IsMinorCiv() then return end
	
	local eMinorType = pPlayer:GetMinorCivType()
	local eMinorTrait = pPlayer:GetMinorCivTrait()
	local eMinorPersonality = pPlayer:GetPersonality()
	
	-- Maritime
	-- Manufactory
	if eMinorTrait ~= tMinorTraits[1] then return end
	
	local pMinorCapital = pPlayer:GetCapitalCity()

	for i = 1, pMinorCapital:GetNumCityPlots() - 1, 1 do
		local pPlot = pMinorCapital:GetCityIndexPlot(i)
		
		if pPlot then
			local bIsCity = pPlot:IsCity()
			local ePlot = pPlot:GetPlotType()
			local eResource = pPlot:GetResourceType()
			local eImprovement = pPlot:GetImprovementType()
			local eFeature = pPlot:GetFeatureType()
			
			if not bIsCity and eResource == -1 and eImprovement == -1 and eFeature == -1 and (ePlot == ePlotFlat or ePlot == ePlotHill) then
				pPlot:SetImprovementType(eImprovementManufactory)
				break
			end
		end
		
		if i >= 36 then
			break
		end
	end
	
	-- Bonus Resource
	local tBonusResourcesIDs = {}
	local tBonusResourcesTypes = {}
	local bBonusPlaced = false
	
	for resource in GameInfo.Resources{ResourceClassType='RESOURCECLASS_BONUS'} do
		table.insert(tBonusResourcesIDs, resource.ID)
		table.insert(tBonusResourcesTypes, resource.Type)
	end
	
	repeat
		local iRandomResource = RandomNumberBetween(1, #tBonusResourcesIDs)
		local eChosenResource = tBonusResourcesIDs[iRandomResource]
		local tBonusResourceFeatures = {}
		local tBonusResourceTerrains = {}
		
		for row in GameInfo.Resource_FeatureBooleans{ResourceType=tBonusResourcesTypes[iRandomResource]} do
			table.insert(tBonusResourceFeatures, row.FeatureType)
		end
		for row in GameInfo.Resource_TerrainBooleans{ResourceType=tBonusResourcesTypes[iRandomResource]} do
			table.insert(tBonusResourceTerrains, row.TerrainType)
		end	
		
		for i = 1, pMinorCapital:GetNumCityPlots() - 1, 1 do
			local pPlot = pMinorCapital:GetCityIndexPlot(i)
			
			if pPlot then
				local bIsCity = pPlot:IsCity()
				local eImprovement = pPlot:GetImprovementType()
				local eResource = pPlot:GetResourceType()
				local eFeature = pPlot:GetFeatureType()
				local eTerrain = pPlot:GetTerrainType()
				local bFeaturePass = false
				local bTerrainPass = false
				
				if not bIsCity and eResource == -1 and eImprovement == -1 then
					if #tBonusResourceFeatures == 0 and eFeature == -1 then
						bFeaturePass = true
					else
						for i, value in ipairs(tBonusResourceFeatures) do
							if eFeature == FeatureTypes[value] then
								bFeaturePass = true
								break
							end
						end
					end
					
					if #tBonusResourceTerrains == 0 then
						bFeaturePass = true
					else
						for i, value in ipairs(tBonusResourceTerrains) do
							if eTerrain == TerrainTypes[value] then
								bTerrainPass = true
								break
							end
						end
					end
					
					if bFeaturePass and bTerrainPass then
						pPlot:SetResourceType(eChosenResource, 1)
						bBonusPlaced = true
						break
					end
				end
			end
			
			if i >= 36 then
				table.remove(tBonusResourcesIDs, iRandomResource)
				table.remove(tBonusResourcesTypes, iRandomResource)
				break
			end
		end
	until (bBonusPlaced or #tBonusResourcesIDs == 0)
	
	-- rest
	pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[1], 1)
	pPlayer:SetHasPolicy(ePolicyMaritime, true)
	
	
	-- Maritime - Friendly
	if eMinorPersonality == tMinorPersonalities[1] then
		pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[2], 1)
	end
	
	-- Maritime - Neutral
	if eMinorPersonality == tMinorPersonalities[2] then
		pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[3], 1)
	end
	
	-- Maritime - Hostile
	if eMinorPersonality == tMinorPersonalities[3] then
		pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[4], 1)
	end
end
GameEvents.PlayerCityFounded.Add(MaritimeCityStatesBonuses)

function FreeWorkerFromCityState(ePlayer)
	local pPlayer = Players[ePlayer]
	
	if not pPlayer:IsMinorCiv() then return end
	
	local pMinorCapital = pPlayer:GetCapitalCity()
	
	if pMinorCapital == nil then return end
	
	if pMinorCapital:IsHasBuilding(tBuildingsPassiveAbilities[2]) then
		local iWorkerSpawnChance = RandomNumberBetween(1, 100)
		
		if iWorkerSpawnChance <= 5 then
			for eMajorPlayer, pMajorPlayer in ipairs(Players) do
				if pMajorPlayer and pMajorPlayer:IsAlive() then
					if pMajorPlayer:IsMinorCiv() then break end
					if not pMajorPlayer:IsEverAlive() then break end
					
					if pPlayer:IsFriends(eMajorPlayer) then
						local iWorkerOrFishingBoatSpawnChance = RandomNumberBetween(1, 100)
						local bIsMajorHasCoast = pMajorPlayer:GetCapitalCity():IsCoastal()
						
						if iWorkerOrFishingBoatSpawnChance <= 50 and bIsMajorHasCoast then
							pMajorPlayer:AddFreeUnit(eUnitFishingBoat, UNITAI_DEFENSE)
						else	
							pMajorPlayer:AddFreeUnit(eUnitWorker, UNITAI_DEFENSE)
						end
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(FreeWorkerFromCityState)


-- MERCANTILE
function MercantileCityStatesBonuses(ePlayer, iX, iY)
	local pPlayer = Players[ePlayer]
	
	if not pPlayer:IsMinorCiv() then return end
	
	local eMinorType = pPlayer:GetMinorCivType()
	local eMinorTrait = pPlayer:GetMinorCivTrait()
	local eMinorPersonality = pPlayer:GetPersonality()
	
	-- Mercantile
	-- Town
	if eMinorTrait ~= tMinorTraits[2] then return end
	
	local pMinorCapital = pPlayer:GetCapitalCity()

	for i = 1, pMinorCapital:GetNumCityPlots() - 1, 1 do
		local pPlot = pMinorCapital:GetCityIndexPlot(i)
		
		if pPlot then
			local bIsCity = pPlot:IsCity()
			local ePlot = pPlot:GetPlotType()
			local eResource = pPlot:GetResourceType()
			local eImprovement = pPlot:GetImprovementType()
			local eFeature = pPlot:GetFeatureType()
			
			if not bIsCity and eResource == -1 and eImprovement == -1 and eFeature == -1 and (ePlot == ePlotFlat or ePlot == ePlotHill) then
				pPlot:SetImprovementType(eImprovementTown)
				break
			end
		end
		
		if i >= 36 then
			break
		end
	end
	
	-- Luxury Resource
	local tLuxuryResourcesIDs = {}
	local tLuxuryResourcesTypes = {}
	local bLuxuryPlaced = false
	
	for resource in GameInfo.Resources{ResourceClassType='RESOURCECLASS_LUXURY', OnlyMinorCivs=0} do
		table.insert(tLuxuryResourcesIDs, resource.ID)
		table.insert(tLuxuryResourcesTypes, resource.Type)
	end
	
	repeat
		local iRandomResource = RandomNumberBetween(1, #tLuxuryResourcesIDs)
		local eChosenResource = tLuxuryResourcesIDs[iRandomResource]
		local tLuxuryResourceFeatures = {}
		local tLuxuryResourceTerrains = {}
		
		for row in GameInfo.Resource_FeatureBooleans{ResourceType=tLuxuryResourcesTypes[iRandomResource]} do
			table.insert(tLuxuryResourceFeatures, row.FeatureType)
		end
		for row in GameInfo.Resource_TerrainBooleans{ResourceType=tLuxuryResourcesTypes[iRandomResource]} do
			table.insert(tLuxuryResourceTerrains, row.TerrainType)
		end	
		
		for i = 1, pMinorCapital:GetNumCityPlots() - 1, 1 do
			local pPlot = pMinorCapital:GetCityIndexPlot(i)
			
			if pPlot then
				local bIsCity = pPlot:IsCity()
				local eImprovement = pPlot:GetImprovementType()
				local eResource = pPlot:GetResourceType()
				local eFeature = pPlot:GetFeatureType()
				local eTerrain = pPlot:GetTerrainType()
				local bFeaturePass = false
				local bTerrainPass = false
				
				if not bIsCity and eResource == -1 and eImprovement == -1 then
					if #tLuxuryResourceFeatures == 0 and eFeature == -1 then
						bFeaturePass = true
					else
						for i, value in ipairs(tLuxuryResourceFeatures) do
							if eFeature == FeatureTypes[value] then
								bFeaturePass = true
								break
							end
						end
					end
					
					if #tLuxuryResourceTerrains == 0 then
						bFeaturePass = true
					else
						for i, value in ipairs(tLuxuryResourceTerrains) do
							if eTerrain == TerrainTypes[value] then
								bTerrainPass = true
								break
							end
						end
					end
					
					if bFeaturePass and bTerrainPass then
						pPlot:SetResourceType(eChosenResource, 1)
						bLuxuryPlaced = true
						break
					end
				end
			end
			
			if i >= 36 then
				table.remove(tLuxuryResourcesIDs, iRandomResource)
				table.remove(tLuxuryResourcesTypes, iRandomResource)
				break
			end
		end
	until (bLuxuryPlaced or #tLuxuryResourcesIDs == 0)
	
	-- rest
	pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[5], 1)
	
	
	-- Mercantile - Friendly
	if eMinorPersonality == tMinorPersonalities[1] then
		pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[6], 1)
	end
	
	-- Mercantile - Neutral
	if eMinorPersonality == tMinorPersonalities[2] then
		pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[7], 1)
	end
	
	-- Mercantile - Hostile
	if eMinorPersonality == tMinorPersonalities[3] then
		pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[8], 1)
	end
end
GameEvents.PlayerCityFounded.Add(MercantileCityStatesBonuses)


-- CULTURED
function CulturedCityStatesBonuses(ePlayer, iX, iY)
	local pPlayer = Players[ePlayer]
	
	if not pPlayer:IsMinorCiv() then return end
	
	local eMinorType = pPlayer:GetMinorCivType()
	local eMinorTrait = pPlayer:GetMinorCivTrait()
	local eMinorPersonality = pPlayer:GetPersonality()
	
	-- Cultured
	-- Academy
	if eMinorTrait ~= tMinorTraits[3] then return end
	
	local pMinorCapital = pPlayer:GetCapitalCity()

	for i = 1, pMinorCapital:GetNumCityPlots() - 1, 1 do
		local pPlot = pMinorCapital:GetCityIndexPlot(i)
		
		if pPlot then
			local bIsCity = pPlot:IsCity()
			local ePlot = pPlot:GetPlotType()
			local eResource = pPlot:GetResourceType()
			local eImprovement = pPlot:GetImprovementType()
			local eFeature = pPlot:GetFeatureType()
			
			if not bIsCity and eResource == -1 and eImprovement == -1 and eFeature == -1 and (ePlot == ePlotFlat or ePlot == ePlotHill) then
				pPlot:SetImprovementType(eImprovementAcademy)
				break
			end
		end
		
		if i >= 36 then
			break
		end
	end
	
	-- rest
	pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[9], 1)
	
	-- Cultured - Friendly
	if eMinorPersonality == tMinorPersonalities[1] then
		pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[10], 1)
	end
	
	-- Cultured - Neutral
	if eMinorPersonality == tMinorPersonalities[2] then
		pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[11], 1)
	end
	
	-- Cultured - Hostile
	if eMinorPersonality == tMinorPersonalities[3] then
		pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[12], 1)
	end
end
GameEvents.PlayerCityFounded.Add(CulturedCityStatesBonuses)


-- RELIGIOUS
function ReligiousCityStatesBonuses(ePlayer, iX, iY)
	local pPlayer = Players[ePlayer]
	
	if not pPlayer:IsMinorCiv() then return end
	
	local eMinorType = pPlayer:GetMinorCivType()
	local eMinorTrait = pPlayer:GetMinorCivTrait()
	local eMinorPersonality = pPlayer:GetPersonality()
	
	-- Religious
	-- Holy Site
	if eMinorTrait ~= tMinorTraits[4] then return end
	
	local pMinorCapital = pPlayer:GetCapitalCity()

	for i = 1, pMinorCapital:GetNumCityPlots() - 1, 1 do
		local pPlot = pMinorCapital:GetCityIndexPlot(i)
		
		if pPlot then
			local bIsCity = pPlot:IsCity()
			local ePlot = pPlot:GetPlotType()
			local eResource = pPlot:GetResourceType()
			local eImprovement = pPlot:GetImprovementType()
			local eFeature = pPlot:GetFeatureType()
			
			if not bIsCity and eResource == -1 and eImprovement == -1 and eFeature == -1 and (ePlot == ePlotFlat or ePlot == ePlotHill) then
				pPlot:SetImprovementType(eImprovementHolySite)
				break
			end
		end
		
		if i >= 36 then
			break
		end
	end
	
	-- rest
	pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[13], 1)
	pPlayer:SetHasPolicy(ePolicyReligious, true)
	
	-- Religious - Friendly
	if eMinorPersonality == tMinorPersonalities[1] then
		pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[14], 1)
		pPlayer:SetHasPolicy(ePolicyReligiousFriendly, true)
	end
	
	-- Religious - Neutral
	if eMinorPersonality == tMinorPersonalities[2] then
		pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[15], 1)
	end
	
	-- Religious - Hostile
	if eMinorPersonality == tMinorPersonalities[3] then
		pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[16], 1)
	end
end
GameEvents.PlayerCityFounded.Add(ReligiousCityStatesBonuses)

function FreeMissionariesFromCityState(ePlayer)
	local pPlayer = Players[ePlayer]
	
	if not pPlayer:IsMinorCiv() then return end
	
	local pMinorCapital = pPlayer:GetCapitalCity()
	
	if pMinorCapital == nil then return end
	
	if pMinorCapital:IsHasBuilding(tBuildingsPassiveAbilities[14]) then
		local iMissionarySpawnChance = RandomNumberBetween(1, 100)
		
		if iMissionarySpawnChance <= 5 then
			for eMajorPlayer, pMajorPlayer in ipairs(Players) do
				if pMajorPlayer and pMajorPlayer:IsAlive() then
					if pMajorPlayer:IsMinorCiv() then break end
					if not pMajorPlayer:IsEverAlive() then break end
					
					if pPlayer:IsFriends(eMajorPlayer) then
						pMajorPlayer:AddFreeUnit(eUnitMissionary, UNITAI_DEFENSE)
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(FreeMissionariesFromCityState)


-- MILITARISTIC
function MilitaristicCityStatesBonuses(ePlayer, iX, iY)
	local pPlayer = Players[ePlayer]
	
	if not pPlayer:IsMinorCiv() then return end
	
	local eMinorType = pPlayer:GetMinorCivType()
	local eMinorTrait = pPlayer:GetMinorCivTrait()
	local eMinorPersonality = pPlayer:GetPersonality()
	
	-- Militaristic
	-- Fort
	if eMinorTrait ~= tMinorTraits[5] then return end
	
	local pMinorCapital = pPlayer:GetCapitalCity()

	for i = 1, pMinorCapital:GetNumCityPlots() - 1, 1 do
		local pPlot = pMinorCapital:GetCityIndexPlot(i)
		
		if pPlot then
			local bIsCity = pPlot:IsCity()
			local ePlot = pPlot:GetPlotType()
			local eResource = pPlot:GetResourceType()
			local eImprovement = pPlot:GetImprovementType()
			local eFeature = pPlot:GetFeatureType()
			
			if not bIsCity and eResource == -1 and eImprovement == -1 and eFeature == -1 and (ePlot == ePlotFlat or ePlot == ePlotHill) then
				pPlot:SetImprovementType(eImprovementFort)
				break
			end
		end
		
		if i >= 36 then
			break
		end
	end
	
	-- Strategic Resource
	local tStrategicResourcesIDs = {}
	local tStrategicResourcesTypes = {}
	local bStrategicPlaced = false
	
	for resource in GameInfo.Resources{ResourceUsage=1} do
		if resource.ID ~= GameInfoTypes.RESOURCE_PAPER then
			table.insert(tStrategicResourcesIDs, resource.ID)
			table.insert(tStrategicResourcesTypes, resource.Type)
		end
	end
	
	repeat
		local iRandomResource = RandomNumberBetween(1, #tStrategicResourcesIDs)
		local eChosenResource = tStrategicResourcesIDs[iRandomResource]
		local tStrategicResourceFeatures = {}
		local tStrategicResourceTerrains = {}
			
		for row in GameInfo.Resource_FeatureBooleans{ResourceType=tStrategicResourcesTypes[iRandomResource]} do
			table.insert(tStrategicResourceFeatures, row.FeatureType)
		end
		for row in GameInfo.Resource_TerrainBooleans{ResourceType=tStrategicResourcesTypes[iRandomResource]} do
			table.insert(tStrategicResourceTerrains, row.TerrainType)
		end	
		
		for i = 1, pMinorCapital:GetNumCityPlots() - 1, 1 do
			local pPlot = pMinorCapital:GetCityIndexPlot(i)
			
			if pPlot then
				local bIsCity = pPlot:IsCity()
				local eImprovement = pPlot:GetImprovementType()
				local eResource = pPlot:GetResourceType()
				local ePlot = pPlot:GetPlotType()
				local eFeature = pPlot:GetFeatureType()
				local eTerrain = pPlot:GetTerrainType()
				local bFeaturePass = false
				local bTerrainPass = false
				
				if not bIsCity and eResource == -1 and eImprovement == -1 then
					if #tStrategicResourceFeatures == 0 and eFeature == -1 then
						bFeaturePass = true
					elseif eFeature == -1  and ePlot == ePlotWater then
						bFeaturePass = true
					else
						for i, value in ipairs(tStrategicResourceFeatures) do
							if eFeature == FeatureTypes[value] then
								bFeaturePass = true
								break
							end
						end
					end
					
					if #tStrategicResourceTerrains == 0 then
						bFeaturePass = true
					else
						for i, value in ipairs(tStrategicResourceTerrains) do
							if eTerrain == TerrainTypes[value] then
								bTerrainPass = true
								break
							end
						end
					end
					
					if bFeaturePass and bTerrainPass then
						pPlot:SetResourceType(eChosenResource, 1)
						bStrategicPlaced = true
						break
					end
				end
			end
			
			if i >= 36 then
				table.remove(tStrategicResourcesIDs, iRandomResource)
				table.remove(tStrategicResourcesTypes, iRandomResource)
				break
			end
		end
	until (bStrategicPlaced or #tStrategicResourcesIDs == 0)
	
	-- rest
	pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[17], 1)
	pPlayer:SetHasPolicy(ePolicyMilitaristic, true)
	
	
	-- Militaristic - Friendly
	if eMinorPersonality == tMinorPersonalities[1] then
		pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[18], 1)
		pPlayer:SetHasPolicy(ePolicyMilitaristicFriendly, true)
	end
	
	-- Militaristic - Neutral
	if eMinorPersonality == tMinorPersonalities[2] then
		pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[19], 1)
	end
	
	-- Militaristic - Hostile
	if eMinorPersonality == tMinorPersonalities[3] then
		pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[20], 1)
	end
end
GameEvents.PlayerCityFounded.Add(MilitaristicCityStatesBonuses)

function CityStateTrainedUU(ePlayer, eCity, eUnit, bGold, bFaith)
	local pPlayer = Players[ePlayer]

	if not pPlayer:IsMinorCiv() then return end

	if pPlayer:IsMinorCivHasUniqueUnit() then
		local ePrereqTech
		
		local eUniqueUnit = pPlayer:GetMinorCivUniqueUnit()
		local sUniqueUnit = GameInfo.Units{ID=eUniqueUnit}().Type
		
		local pUnit = pPlayer:GetUnitByID(eUnit)
		local eUnitType = pUnit:GetUnitType()
		local eUnitClass = pUnit:GetUnitClassType()
		local sUnitClass = GameInfo.Units{ID=eUnitType}().Class
		
		local bUnitMatched = false

		for civclassoverrides in GameInfo.Civilization_UnitClassOverrides{UnitClassType=sUnitClass} do
			if civclassoverrides.UnitType == sUniqueUnit then
				ePrereqTech = GameInfoTypes[GameInfo.Units{Type=sUniqueUnit}().PrereqTech]				
				bUnitMatched = true
				break
			end
		end
		
		if not bUnitMatched and tUniqueUnitsFromMinors[sUniqueUnit] then
			if tUniqueUnitsFromMinors[sUniqueUnit].eUnit == eUnitType then
				ePrereqTech = GameInfoTypes[GameInfo.Units{Type=sUniqueUnit}().PrereqTech]
				bUnitMatched = true
			end
		end

		if bUnitMatched then
			local pTeam = Teams[pPlayer:GetTeam()]
			
			if pTeam:IsHasTech(ePrereqTech) then
				pUnit:Kill()
				pPlayer:AddFreeUnit(eUniqueUnit, UNITAI_DEFENSE)
			end
		end
	end
end
GameEvents.CityTrained.Add(CityStateTrainedUU)
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
-- BOGOTA (CULTURE FROM LIBERATION)
function LiberatedForBogota(ePlayer, eOtherPlayer, eCity)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[1]) ~= 0 then
		local iCities = pPlayer:GetNumCities()
		
		if iCities > 6 then iCities = 6 end
		
		local iCultureLiberated = RandomNumberBetween(10, 40) * (pPlayer:GetCurrentEra() + 1) * iCities
	
		pPlayer:ChangeJONSCulture(iCultureLiberated)
	
		local pMinorPlayer = Players[tLostCities["eLostBogota"]]
	
		if pPlayer:IsHuman() then
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_MET_MINOR, "Your liberation efforts do not go unrewarded. [COLOR_CYAN]" .. pMinorPlayer:GetName() .. "[ENDCOLOR] rewards you with " .. iCultureLiberated .. " [ICON_CULTURE] Culture.", "United Independence!", pMinorPlayer:GetCapitalCity():GetX(), pMinorPlayer:GetCapitalCity():GetY())
		end
	end
end



-- BRUSSELS (FEATURE)
function CanWeBuildMarsh(ePlayer, eUnit, iX, iY, eBuild)
	if eBuild ~= eBuildMarsh then return true end
	
	local pPlayer = Players[ePlayer]
	
	if not (pPlayer:GetEventChoiceCooldown(tEventChoice[2]) > 0) then return false end
	
	return true
end
GameEvents.PlayerCanBuild.Add(CanWeBuildMarsh)

function BuiltMarsh(ePlayer, iX, iY, eImprovement)
	if eImprovement == eImprovementMarsh or eImprovement == eImprovementForest or eImprovement == eImprovementJungle then
		local pPlot = Map.GetPlot(iX, iY)
		
		pPlot:SetImprovementType(-1)
		pPlot:SetFeatureType(eFeatureMarsh, -1)
	end
end	



-- CAHOKIA (IMPROVEMENT)
function CanWeBuildMound(ePlayer, eUnit, iX, iY, eBuild)
	if eBuild ~= eBuildMound then return true end
	
	local pPlayer = Players[ePlayer]
	
	if not (pPlayer:GetEventChoiceCooldown(tEventChoice[3]) > 0) then return false end
	
	return true
end
GameEvents.PlayerCanBuild.Add(CanWeBuildMound)



-- CAPE TOWN/MANILA (TRADE ROUTES)
function TradeToTheKing(eFromPlayer, eFromCity, eToPlayer, eToCity, eDomain, eConnectionType)
	local pPlayer = Players[eFromPlayer]
	local pToPlayer = Players[eToPlayer]
	
	-- CAPE TOWN
	if pPlayer:GetEventChoiceCooldown(tEventChoice[4]) ~= 0 then
		local iCahChing = pToPlayer:GetCityByID(eToCity):GetPopulation() * RandomNumberBetween(20, 40)
		
		pPlayer:ChangeGold(iCahChing)
	
		local pMinorPlayer = Players[tLostCities["eLostCapeTown"]]
		
		if pPlayer:IsHuman() then
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_MET_MINOR, "And Cape of Good Hope it was, [COLOR_CYAN]" .. pMinorPlayer:GetName() .. "[ENDCOLOR] rewards you with " .. iCahChing .. "[ICON_GOLD] Gold!", "Cape of Good Hope", pMinorPlayer:GetCapitalCity():GetX(), pMinorPlayer:GetCapitalCity():GetY())
		end
	end

    -- MANILA
	if pPlayer:GetEventChoiceCooldown(tEventChoice[5]) ~= 0 then
		local iYumYum = pToPlayer:GetCityByID(eToCity):GetPopulation() * RandomNumberBetween(1, 15)
		local pPlayerCity = pPlayer:GetCityByID(eFromCity)
	
		pPlayerCity:ChangeFood(iYumYum)
		pPlayerCity:ChangeProduction(iYumYum)
		
		local pMinorPlayer = Players[tLostCities["eLostManila"]]
		
		if pPlayer:IsHuman() then
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_MET_MINOR, "With the Pearl of the Orient, your merchants discovered " .. iYumYum .. "[ICON_FOOD] Food and [ICON_PRODUCTION] Production on their travels!", "Pearl of the Orient", pMinorPlayer:GetCapitalCity():GetX(), pMinorPlayer:GetCapitalCity():GetY())
		end
	end
end



-- KIEV/MILAN/VILNIUS/VALETTA (STARTING BUILDINGS)
function SettledCityStateWithBuilding(ePlayer, eUnit, eUnitType, iPlotX, iPlotY)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:IsMinorCiv() then
		local pSettledCity = Map.GetPlot(iPlotX, iPlotY):GetPlotCity()
		
		if GameInfo.MinorCivilizations[pPlayer:GetMinorCivType()].Type == "MINOR_CIV_KIEV" then
			pSettledCity:SetNumRealBuilding(GameInfoTypes.BUILDING_KIEV, 1)
		elseif GameInfo.MinorCivilizations[pPlayer:GetMinorCivType()].Type == "MINOR_CIV_MILAN" then
			pSettledCity:SetNumRealBuilding(GameInfoTypes.BUILDING_MILAN, 1)
		elseif GameInfo.MinorCivilizations[pPlayer:GetMinorCivType()].Type == "MINOR_CIV_VALLETTA" then
			pSettledCity:SetNumRealBuilding(GameInfoTypes.BUILDING_VALLETTA, 1)
		elseif GameInfo.MinorCivilizations[pPlayer:GetMinorCivType()].Type == "MINOR_CIV_VILNIUS" then
			pSettledCity:SetNumRealBuilding(GameInfoTypes.BUILDING_VILNIUS, 1)
		end
	end
end



-- ZURICH (GOLD)
function ZurichMerchants(ePlayer)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:IsMinorCiv() then return end
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[6]) ~= 0 then
		local iInterest = math.ceil(pPlayer:GetGold() * 0.02)
		
		if iInterest > 50 * (pPlayer:GetCurrentEra() + 1) then iInterest = 50 * (pPlayer:GetCurrentEra() + 1) end
		
		pPlayer:ChangeGold(iInterest)
		local pMinorPlayer = Players[tLostCities["eLostZurich"]]
		
		if pPlayer:IsHuman() then
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_MET_MINOR, "[COLOR_CYAN]" .. pMinorPlayer:GetName() .. "[ENDCOLOR] bankers found a discrepency in your spending and saved you " .. iInterest .. " [ICON_GOLD] Gold!", "Money in the Right Hands!", pMinorPlayer:GetCapitalCity():GetX(), pMinorPlayer:GetCapitalCity():GetY())
		end
	end
end



-- JERUSALEM (SPHERE OF INFLUENCE AND RELIGION)
function JerusalemsDevotion(ePlayer)
	for _, pplayer in ipairs(Players) do
		if pplayer and pplayer:IsAlive() and pplayer:IsMinorCiv() then
		    local pMinorPlayer = pplayer
		    
		    if GameInfo.MinorCivilizations[pMinorPlayer:GetMinorCivType()].Type == "MINOR_CIV_JERUSALEM" then
                if pMinorPlayer:IsAllies(ePlayer) then
	        	    local pMajorPlayer = Players[ePlayer]
        	    
            		if pMajorPlayer:GetMajorityReligion() ~= nil and pMajorPlayer:GetMajorityReligion() ~= pMinorPlayer:GetMajorityReligion() then
            			pMinorPlayer:GetCapitalCity():AdoptReligionFully(pMajorPlayer:GetMajorityReligion())
						
						if pMajorPlayer:IsHuman() then
							pMajorPlayer:AddNotification(NotificationTypes.NOTIFICATION_MET_MINOR, "[COLOR_CYAN]" .. pMinorPlayer:GetName() .. "[ENDCOLOR] adopted your main Religion. Now they spread your word over the world.", "Religion transfer to [COLOR_CYAN]" .. pMinorPlayer:GetName() .. "[ENDCOLOR]", pMinorPlayer:GetCapitalCity():GetX(), pMinorPlayer:GetCapitalCity():GetY())
						end
            		end
            		
            		if Game.GetNumActiveLeagues() ~= 0 and not Game.IsResolutionPassed(eSphere, tLostCities["eLostJerusalem"]) then
            			Game.DoEnactResolution(eSphere, tLostCities["eLostJerusalem"], eMajor)
            			
            			if pMajorPlayer:IsHuman() then
            				pMajorPlayer:AddNotification(NotificationTypes.NOTIFICATION_MET_MINOR, "In recognition and awe of your holiness, the leaders of [COLOR_CYAN]" .. pMinorPlayer:GetName() .. "[ENDCOLOR] pledge their loyalty to you in the form of a [COLOR_POSITIVE_TEXT]Sphere of Influence[ENDCOLOR].", "[COLOR_CYAN]" .. pMinorPlayer:GetName() .. "[ENDCOLOR]'s Sphere of Influence", pMinorPlayer:GetCapitalCity():GetX(), pMinorPlayer:GetCapitalCity():GetY())
            			end
        	    	end
        		
        		    break
                end
    	    end
    	end
	end
end



-- SIDON (SPHERE OF INFLUENCE)
function DestroyLifeForSidon(ePlayer, eCS, iGold, eUnitType, iPlotX, iPlotY)
	local pPlayer = Players[ePlayer]

	if not Game.IsResolutionPassed(eSphere, tLostCities["eLostSidon"]) and pPlayer:GetEventChoiceCooldown(tEventChoice[7]) ~= 0 and Game.GetNumActiveLeagues() ~= 0 then
		Game.DoEnactResolution(eSphere, tLostCities["eLostSidon"], ePlayer)
		
		local pMinorPlayer = Players[tLostCities["eLostSidon"]]
		
		if pPlayer:IsHuman() then
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_MET_MINOR, "In recognition and awe of your powers, the leaders of [COLOR_CYAN]" .. pMinorPlayer:GetName() .. "[ENDCOLOR] pledge their loyalty to you in the form of a [COLOR_POSITIVE_TEXT]Sphere of Influence[ENDCOLOR].", "[COLOR_CYAN]" .. pMinorPlayer:GetName() .. "[ENDCOLOR]'s Sphere of Influence", pMinorPlayer:GetCapitalCity():GetX(), pMinorPlayer:GetCapitalCity():GetY())
		end
	end
end



-- LHASA (SPHERE OF INFLUENCE)
function CanWeBuildPotalaPalace(ePlayer, eBuilding)
	if eBuilding ~= tBuildingsActiveAbilities[1] then return true end
	if Game.GetNumActiveLeagues() == 0 then return false end
	if Players[ePlayer]:GetEventChoiceCooldown(tEventChoice[8]) ~= 0 then return true	end
	
	return false
end

function BuiltWonderForLhasa(ePlayer, eCity, eBuilding, bGold, bFaith)
	if eBuilding == tBuildingsActiveAbilities[1] then
		Game.DoEnactResolution(eSphere, tLostCities["eLostLhasa"], ePlayer)
		GameEvents.CityConstructed.Remove(BuiltWonderForLhasa)
		
		local pPlayer = Players[ePlayer]
		local pMinorPlayer = Players[tLostCities["eLostLhasa"]]
		
		if pPlayer:IsHuman() then
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_MET_MINOR, "Citizens of [COLOR_CYAN]" .. pMinorPlayer:GetName() .. "[ENDCOLOR] awe you for your recent cunstruction efforts. They swear loyality and offer you services in return for the [COLOR_POSITIVE_TEXT]Sphere of Influence[ENDCOLOR].", "Sphere of Influence over [COLOR_CYAN]" .. pMinorPlayer:GetName() .. "[ENDCOLOR]", pMinorPlayer:GetCapitalCity():GetX(), pMinorPlayer:GetCapitalCity():GetY())
		end
	end
end



-- ÓC EO (TRADE ROUTES INTO GROWTH)
function LordsOfTheGreatGlassRiver(ePlayer)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:IsMinorCiv() then return end
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[9]) ~= 0 then
		local iInternationalSeaTradeRoutes = InternationalSeaTradeRoutes(ePlayer, pPlayer)
		local pCapitalCity = pPlayer:GetCapitalCity()
		
		for city in pPlayer:Cities() do
			if city:IsCoastal(10) then
				city:SetNumRealBuilding(tBuildingsActiveAbilities[2], iInternationalSeaTradeRoutes)
			end
		end
		
		pCapitalCity:SetNumRealBuilding(tBuildingsActiveAbilities[3], iInternationalSeaTradeRoutes)
	else
		if pPlayer:CountNumBuildings(tBuildingsActiveAbilities[2]) > 0 or pPlayer:CountNumBuildings(tBuildingsActiveAbilities[3]) > 0 then
			if not pPlayer:IsEventChoiceActive(tEventChoice[9]) then
				for city in pPlayer:Cities() do
					city:SetNumRealBuilding(tBuildingsActiveAbilities[2], 0)
					city:SetNumRealBuilding(tBuildingsActiveAbilities[3], 0)
				end
			end
		end
	end
	
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

function LordsOfTheGreatGlassRiverCapture(eOldOwner, bIsCapital, iX, iY, eNewOwner, iPop, bConquest)
	local pNewOwner = Players[eNewOwner]
	
	if pNewOwner:GetEventChoiceCooldown(tEventChoice[9]) ~= 0 then
		local pPlot = Map.GetPlot(iX, iY)
		local pConqCity = pPlot:GetWorkingCity()
		
		if pConqCity:IsCoastal(10) then
			local iInternationalSeaTradeRoutes = InternationalSeaTradeRoutes(eNewOwner, pNewOwner)
			
			pConqCity:SetNumRealBuilding(tBuildingsActiveAbilities[2], iInternationalSeaTradeRoutes)
		end
	else	
		if not pNewOwner:IsEventChoiceActive(tEventChoice[9]) then
			local pPlot = Map.GetPlot(iX, iY)
			
			if pPlot then
				local pConqCity = pPlot:GetWorkingCity()
			
				pConqCity:SetNumRealBuilding(tBuildingsActiveAbilities[2], 0)
			end
		end
	end
end

function LordsOfTheGreatGlassRiverNewCity(ePlayer, iX, iY)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[9]) ~= 0 then
		local pPlot = Map.GetPlot(iX, iY)
			
		if pPlot then
			local pCity = pPlot:GetWorkingCity()
			
			if pCity:IsCoastal(10) then
				local iInternationalSeaTradeRoutes = InternationalSeaTradeRoutes(ePlayer, pPlayer)
				
				pCity:SetNumRealBuilding(tBuildingsActiveAbilities[2], iInternationalSeaTradeRoutes)
			end
		end
	end
end

function InternationalSeaTradeRoutes(ePlayer, pPlayer)
	local iInternationalSeaTradeRoutes = 0
	
	for _, tradeRoute in ipairs(pPlayer:GetTradeRoutes()) do
		if tradeRoute.FromID == ePlayer and tradeRoute.ToID ~= ePlayer and tradeRoute.Domain == GameInfoTypes.DOMAIN_SEA then
			iInternationalSeaTradeRoutes = iInternationalSeaTradeRoutes + 1
		end
	end
	
	return iInternationalSeaTradeRoutes
end



-- THIMPHU (CITY ON HILL)
function DrukTsendhen(ePlayer)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:IsMinorCiv() then return end
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[10]) ~= 0 then
		for city in pPlayer:Cities() do
			-- culture on hill
			local pPlot = city:Plot()
			
			if pPlot then
				local ePlot = pPlot:GetPlotType()
			
				if ePlot == ePlotHill then
					city:SetNumRealBuilding(tBuildingsActiveAbilities[4], 1)
				end
			end
			
			-- culture to defense conversion
			local iDefenseToAdd = city:GetJONSCulturePerTurn()
			
			city:SetNumRealBuilding(tBuildingsActiveAbilities[5], iDefenseToAdd)
		end
	else
		if pPlayer:CountNumBuildings(tBuildingsActiveAbilities[4]) > 0 or pPlayer:CountNumBuildings(tBuildingsActiveAbilities[5]) > 0 then
			if not pPlayer:IsEventChoiceActive(tEventChoice[10]) then
				for city in pPlayer:Cities() do
					city:SetNumRealBuilding(tBuildingsActiveAbilities[4], 0)
					city:SetNumRealBuilding(tBuildingsActiveAbilities[5], 0)
				end
			end
		end
	end
end

function DrukTsendhenCapture(eOldOwner, bIsCapital, iX, iY, eNewOwner, iPop, bConquest)
	local pNewOwner = Players[eNewOwner]
	
	if pNewOwner:GetEventChoiceCooldown(tEventChoice[10]) ~= 0 then
		local pPlot = Map.GetPlot(iX, iY)
			
		if pPlot then
			local ePlot = pPlot:GetPlotType()
			local pConqCity = pPlot:GetWorkingCity()
			
			if ePlot == ePlotHill then
				pConqCity:SetNumRealBuilding(tBuildingsActiveAbilities[4], 1)
			end
			
			-- culture to defense conversion
			local iDefenseToAdd = city:GetJONSCulturePerTurn()
			
			pCity:SetNumRealBuilding(tBuildingsActiveAbilities[5], iDefenseToAdd)
		end
	else
		if not pNewOwner:IsEventChoiceActive(tEventChoice[10]) then
			local pPlot = Map.GetPlot(iX, iY)
			
			if pPlot then
				local pConqCity = pPlot:GetWorkingCity()
			
				pConqCity:SetNumRealBuilding(tBuildingsActiveAbilities[4], 0)
				pConqCity:SetNumRealBuilding(tBuildingsActiveAbilities[5], 0)
			end
		end
	end
end

function DrukTsendhenNewCity(ePlayer, iX, iY)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[10]) ~= 0 then
		local pPlot = Map.GetPlot(iX, iY)
				
		if pPlot then
			-- culture on hill
			local ePlot = pPlot:GetPlotType()
			local pCity = pPlot:GetWorkingCity()
			
			if ePlot == ePlotHill then		
				pCity:SetNumRealBuilding(tBuildingsActiveAbilities[4], 1)
			end
			
			-- culture to defense conversion
			local iDefenseToAdd = city:GetJONSCulturePerTurn()
			
			pCity:SetNumRealBuilding(tBuildingsActiveAbilities[5], iDefenseToAdd)
		end
	end
end



-- ANDORRA (MOUNTAIN NEARBY)
function PyreneanPareage(ePlayer)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:IsMinorCiv() then return end
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[11]) ~= 0 then
		for city in pPlayer:Cities() do
			if not city:IsHasBuilding(tBuildingsActiveAbilities[6]) then
				for i = 1, city:GetNumCityPlots() - 1, 1 do
					local pPlot = city:GetCityIndexPlot(i)
					
					if pPlot then
						local ePlot = pPlot:GetPlotType()
						
						if ePlot == ePlotMountain then
							city:SetNumRealBuilding(tBuildingsActiveAbilities[6], 1)
							break
						end
					end
					
					if i >= 6 then
						break
					end
				end
			end
		end
	else
		if pPlayer:CountNumBuildings(tBuildingsActiveAbilities[6]) > 0 then
			if not pPlayer:IsEventChoiceActive(tEventChoice[11]) then
				for city in pPlayer:Cities() do
					city:SetNumRealBuilding(tBuildingsActiveAbilities[6], 0)
				end
			end
		end
	end
end

function PyreneanPareageCapture(eOldOwner, bIsCapital, iX, iY, eNewOwner, iPop, bConquest)
	local pNewOwner = Players[eNewOwner]
	local pPlot = Map.GetPlot(iX, iY)
	local pConqCity = pPlot:GetWorkingCity()
			
	if pNewOwner:GetEventChoiceCooldown(tEventChoice[11]) ~= 0 then
		for i = 1, pConqCity:GetNumCityPlots() - 1, 1 do
			local pPlot = pConqCity:GetCityIndexPlot(i)
			
			if pPlot then
				local ePlot = pPlot:GetPlotType()
				
				if ePlot == ePlotMountain then
					pConqCity:SetNumRealBuilding(tBuildingsActiveAbilities[6], 1)
					break
				end
			end
			
			if i >= 6 then
				break
			end
		end
	else
		if not pNewOwner:IsEventChoiceActive(tEventChoice[11]) then
			pConqCity:SetNumRealBuilding(tBuildingsActiveAbilities[6], 0)
		end
	end
end

function PyreneanPareageNewCity(ePlayer, iX, iY)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[11]) ~= 0 then
		local pPlot = Map.GetPlot(iX, iY)
		
		if pPlot then
			local pCity = pPlot:GetWorkingCity()	
			
			for i = 1, pCity:GetNumCityPlots() - 1, 1 do
				local pPlotAround = pCity:GetCityIndexPlot(i)
				
				if pPlotAround then
					local ePlot = pPlotAround:GetPlotType()
					
					if ePlot == ePlotMountain then
						pCity:SetNumRealBuilding(tBuildingsActiveAbilities[6], 1)
						break
					end
				end
				
				if i >= 6 then
					break
				end
			end
		end
	end
end



-- CANOSSA (TEMPLE BUILT)
function ArdentFlameInPiousHeart(ePlayer)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:IsMinorCiv() then return end
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[12]) ~= 0 then
		for city in pPlayer:Cities() do
			if city:IsHasBuilding(tBuildingsActiveAbilities[8]) then
				city:SetNumRealBuilding(tBuildingsActiveAbilities[7], 1)
			else
				city:SetNumRealBuilding(tBuildingsActiveAbilities[7], 0)
			end
		end
	else
		if pPlayer:CountNumBuildings(tBuildingsActiveAbilities[7]) > 0 then
			if not pPlayer:IsEventChoiceActive(tEventChoice[12]) then
				for city in pPlayer:Cities() do
					city:SetNumRealBuilding(tBuildingsActiveAbilities[7], 0)
				end
			end
		end
	end
end

function ArdentFlameInPiousHeartCapture(eOldOwner, bIsCapital, iX, iY, eNewOwner, iPop, bConquest)
	local pNewOwner = Players[eNewOwner]
	local pPlot = Map.GetPlot(iX, iY)
	local pConqCity = pPlot:GetWorkingCity()
			
	if pNewOwner:GetEventChoiceCooldown(tEventChoice[12]) ~= 0 then
		if pConqCity:IsHasBuilding(tBuildingsActiveAbilities[8]) then
			pConqCity:SetNumRealBuilding(tBuildingsActiveAbilities[7], 1)
		else
			pConqCity:SetNumRealBuilding(tBuildingsActiveAbilities[7], 0)
		end
	else
		if not pNewOwner:IsEventChoiceActive(tEventChoice[12]) then
			pConqCity:SetNumRealBuilding(tBuildingsActiveAbilities[7], 0)
		end
	end
end

function ArdentFlameInPiousHeartNewCity(ePlayer, iX, iY)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[12]) ~= 0 then
		local pPlot = Map.GetPlot(iX, iY)
		
		if pPlot then
			local pCity = pPlot:GetWorkingCity()	

			if pCity:IsHasBuilding(tBuildingsActiveAbilities[8]) then
				pCity:SetNumRealBuilding(tBuildingsActiveAbilities[7], 1)
			else
				pCity:SetNumRealBuilding(tBuildingsActiveAbilities[7], 0)
			end
		end
	end
end

function ArdentFlameInPiousHeartBuildingConstruction(ePlayer, eCity, eBuilding, bGold, bFaith) 
	if eBuilding == tBuildingsActiveAbilities[8] then
		local pPlayer = Players[ePlayer]
	
		if pPlayer:GetEventChoiceCooldown(tEventChoice[12]) ~= 0 then
			local pPlot = Map.GetPlot(iX, iY)
			
			if pPlot then
				local pCity = pPlot:GetWorkingCity()	

				pCity:SetNumRealBuilding(tBuildingsActiveAbilities[7], 1)
			end
		end
	end
end



-- LEVUKA
function CaptureCityForLevuka(eOldOwner, bIsCapital, iX, iY, eNewOwner, iPop, bConquest)
	local pPlayer = Players[eNewOwner]
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[13]) ~= 0 then
		local pMinorPlayer = Players[tLostCities["eLostLevuka"]]
		
		local iGameSpeedGoldenAgeModifier = GameInfo.GameSpeeds[Game:GetGameSpeedType()].GoldenAgePercent
		local iCurrentEraModifier = (pPlayer:GetCurrentEra() + 1) * 10
		local iOwnedCities = pPlayer:GetNumCities()
		local iFoodBonus = math.ceil(((iCurrentEraModifier * iGameSpeedGoldenAgeModifier) / 100) / iOwnedCities)
		
		for city in pPlayer:Cities() do
			city:ChangeFood(iFoodBonus)
		end
		
		if pPlayer:IsHuman() then
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_MET_MINOR, "[COLOR_CYAN]" .. pMinorPlayer:GetName() .. "[ENDCOLOR] grants you " .. iFoodBonus .. " [ICON_FOOD] in each of your Cities for successful capture. They awe you.", "City captured for [COLOR_CYAN]" .. pMinorPlayer:GetName() .. "[ENDCOLOR]", iX, iY)
		end
		
		ConquestsForLevuka(eNewOwner)
	end
end

function ConquestsForLevuka(ePlayer)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:IsMinorCiv() then return end
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[13]) ~= 0 then
		local iConqueredCities = 0
		
		for city in pPlayer:Cities() do
			if city:GetOwner() ~= city:GetOriginalOwner() then
				iConqueredCities = iConqueredCities + 1
			end
		end
		
		pPlayer:GetCapitalCity():SetNumRealBuilding(tBuildingsActiveAbilities[9], iConqueredCities)
	else
		if pPlayer:CountNumBuildings(tBuildingsActiveAbilities[9]) > 0 then
			if not pPlayer:IsEventChoiceActive(tEventChoice[13]) then
				pPlayer:GetCapitalCity():SetNumRealBuilding(tBuildingsActiveAbilities[9], 0)
			end
		end
	end
end

-- CLEAR BARB CAMP
function BarbCampForLevuka(iX, iY, ePlayer)
    local pPlayer = Players[ePlayer]
    local pTeam = Teams[pPlayer:GetTeam()]
   
	if not pPlayer:IsAlive() then return end
	if pPlayer:IsMinorCiv() then return end
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[13]) ~= 0 then
		local pMinorPlayer = Players[tLostCities["eLostLevuka"]]
		
		local iGameSpeedGoldenAgeModifier = GameInfo.GameSpeeds[Game:GetGameSpeedType()].GoldenAgePercent
		local iCurrentEraModifier = (pPlayer:GetCurrentEra() + 1) * 10
		local iCities = pPlayer:GetNumCities()
		local iFoodBonus = math.ceil(((iCurrentEraModifier * iGameSpeedGoldenAgeModifier) / 100) / iCities)
		
		for city in pPlayer:Cities() do
			city:ChangeFood(iFoodBonus)
		end
			
		if pPlayer:IsHuman() then
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_MET_MINOR, "[COLOR_CYAN]" .. pMinorPlayer:GetName() .. "[ENDCOLOR] grants you " .. iFoodBonus .. " [ICON_FOOD] in each of your Cities for clearing a Barbarian Camp. They are very grateful for your help.", "Barbarian Camp cleared for [COLOR_CYAN]" .. pMinorPlayer:GetName() .. "[ENDCOLOR]", iX, iY)
		end
	end
end
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
-- INITIALIZATION
function SettingUpSpecificEvents()
	for eCS, pCS in pairs(Players) do
		if pCS:IsMinorCiv() then		
			local sMinorCivType = GameInfo.MinorCivilizations[pCS:GetMinorCivType()].Type
		
			if sMinorCivType == "MINOR_CIV_BOGOTA" then	
				tLostCities["eLostBogota"] = eCS
				GameEvents.PlayerLiberated.Add(LiberatedForBogota)		
			
			
			-- improvements
			elseif sMinorCivType == "MINOR_CIV_BRUSSELS" then	
				tLostCities["eLostBrussels"] = eCS
				GameEvents.BuildFinished.Add(BuiltMarsh)	
			elseif sMinorCivType == "MINOR_CIV_CAHOKIA" then	
				tLostCities["eLostCahokia"] = eCS
			

			-- trade routes
			elseif sMinorCivType == "MINOR_CIV_CAPE_TOWN" then	
				tLostCities["eLostCapeTown"] = eCS
				GameEvents.PlayerTradeRouteCompleted.Add(TradeToTheKing)
			elseif sMinorCivType == "MINOR_CIV_MANILA" then	
				tLostCities["eLostManila"] = eCS
				GameEvents.PlayerTradeRouteCompleted.Add(TradeToTheKing)
			
			
			-- starting building setup
			elseif sMinorCivType == "MINOR_CIV_KIEV" then	
				tLostCities["eLostKyiv"] = eCS
				GameEvents.UnitCityFounded.Add(SettledCityStateWithBuilding)
			elseif sMinorCivType == "MINOR_CIV_MILAN" then	
				tLostCities["eLostMilan"] = eCS
				GameEvents.UnitCityFounded.Add(SettledCityStateWithBuilding)
			elseif sMinorCivType == "MINOR_CIV_VILNIUS" then	
				tLostCities["eLostVilnius"] = eCS
				GameEvents.UnitCityFounded.Add(SettledCityStateWithBuilding)
			elseif sMinorCivType == "MINOR_CIV_VALLETTA" then	
				tLostCities["eLostValletta"] = eCS
				GameEvents.UnitCityFounded.Add(SettledCityStateWithBuilding)	
			
			
			
			elseif sMinorCivType == "MINOR_CIV_ZURICH" then	
				tLostCities["eLostZurich"] = eCS
				GameEvents.PlayerDoTurn.Add(ZurichMerchants)
			
			
			-- sphere of influence
			elseif sMinorCivType == "MINOR_CIV_SIDON" then
				tLostCities["eLostSidon"] = eCS
				GameEvents.PlayerBullied.Add(DestroyLifeForSidon)
			elseif sMinorCivType == "MINOR_CIV_LHASA" then
				tLostCities["eLostLhasa"] = eCS
				
				if not Game.AnyoneHasWonder(tBuildingsActiveAbilities[1]) then
					GameEvents.PlayerCanConstruct.Add(CanWeBuildPotalaPalace)
					GameEvents.CityConstructed.Add(BuiltWonderForLhasa)
				end
			elseif sMinorCivType == "MINOR_CIV_JERUSALEM" then
				tLostCities["eLostJerusalem"] = eCS
				GameEvents.PlayerDoTurn.Add(JerusalemsDevotion)
			
			
			
			elseif sMinorCivType == "MINOR_CIV_OC_EO" then	
				tLostCities["eLostOcEo"] = eCS
				GameEvents.PlayerDoTurn.Add(LordsOfTheGreatGlassRiver)
				GameEvents.CityCaptureComplete.Add(LordsOfTheGreatGlassRiverCapture)
				GameEvents.PlayerCityFounded.Add(LordsOfTheGreatGlassRiverNewCity)
			elseif sMinorCivType == "MINOR_CIV_THIMPHU" then
				tLostCities["eLostThimphu"] = eCS
				
				GameEvents.PlayerDoTurn.Add(DrukTsendhen)
				GameEvents.CityCaptureComplete.Add(DrukTsendhenCapture)
				GameEvents.PlayerCityFounded.Add(DrukTsendhenNewCity)
			elseif sMinorCivType == "MINOR_CIV_ANDORRA" then
				tLostCities["eLostAndorra"] = eCS
				
				GameEvents.PlayerDoTurn.Add(PyreneanPareage)
				GameEvents.CityCaptureComplete.Add(PyreneanPareageCapture)
				GameEvents.PlayerCityFounded.Add(PyreneanPareageNewCity)
			elseif sMinorCivType == "MINOR_CIV_CANOSSA" then
				tLostCities["eLostCanossa"] = eCS
				
				GameEvents.PlayerDoTurn.Add(ArdentFlameInPiousHeart)
				GameEvents.CityCaptureComplete.Add(ArdentFlameInPiousHeartCapture)
				GameEvents.PlayerCityFounded.Add(ArdentFlameInPiousHeartNewCity)
				GameEvents.CityConstructed.Add(ArdentFlameInPiousHeartBuildingConstruction)
			
			
			
			elseif sMinorCivType == "MINOR_CIV_LEVUKA" then
				tLostCities["eLostLevuka"] = eCS
				
				GameEvents.CityCaptureComplete.Add(CaptureCityForLevuka)
				GameEvents.PlayerDoTurn.Add(ConquestsForLevuka)
				GameEvents.BarbariansCampCleared.Add(BarbCampForLevuka)
			end
		end
	end
end
SettingUpSpecificEvents()