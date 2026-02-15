-- Louisiana
-- Author: Gwennog
-- DateCreated: 11/11/2021

local eCivilizationLouisiana = GameInfoTypes.CIVILIZATION_GH_LOUISIANA
local iYieldFood = GameInfoTypes.YIELD_FOOD
local iSpecialistMerchant = GameInfoTypes.SPECIALIST_MERCHANT
local iBuildCajunCabin = GameInfoTypes.BUILD_GH_LOUISIANA_CAJUN_CABIN
local iImprovementCajunCabin = GameInfoTypes.IMPROVEMENT_GH_LOUISIANA_CAJUN_CABIN
local iBuildAcademy = GameInfoTypes.BUILD_ACADEMY
local iBuildCitadel = GameInfoTypes.BUILD_CITADEL
local iBuildTown = GameInfoTypes.BUILD_CUSTOMS_HOUSE
local iBuildEmbassy = GameInfoTypes.BUILD_EMBASSY
local iBuildHolySite = GameInfoTypes.BUILD_HOLY_SITE
local iBuildManufactory = GameInfoTypes.BUILD_MANUFACTORY
local iBuildRoad = GameInfoTypes.BUILD_ROAD
local iBuildRailroad = GameInfoTypes.BUILD_RAILROAD
local iBuildRemoveRoute = GameInfoTypes.BUILD_REMOVE_ROUTE
local iBuildRepair = GameInfoTypes.BUILD_REPAIR
local iBuildRepairEmbarked = GameInfoTypes.BUILD_REPAIR_EMBARKED
local iBuildScrubFallout = GameInfoTypes.BUILD_SCRUB_FALLOUT
local iBuildingMusicSlots = GameInfoTypes.BUILDING_MUSIC_FOR_CAJUN_CABIN
local iBuildingNoLandUnit = GameInfoTypes.BUILDING_NO_UNIT_PROD_FOR_CITIES
local iBuildingXPCSAllied = GameInfoTypes.BUILDING_XP_FROM_CS_FOR_CITIES
local ePromotionMetissage = GameInfoTypes.PROMOTION_GH_LOUISIANA_METISSAGE
local ePromotionPemmican = GameInfoTypes.PROMOTION_GH_LOUISIANA_INDIGENOUS_ALLIES
local ePromotionPemmicanEffect = GameInfoTypes.PROMOTION_GH_LOUISIANA_GUIDE_AND_PEMMICAN
local ePromotionEntrepreneur = GameInfoTypes.PROMOTION_GH_LOUISIANA_ENTREPRENEUR
local iGreatMerchant = GameInfoTypes.UNIT_MERCHANT
local iGrandVoyageur = GameInfoTypes.UNIT_GH_LOUISIANA_GVOYAGEUR
local iTown = GameInfoTypes.IMPROVEMENT_CUSTOMS_HOUSE


local GoldGameSpeed = GameInfo.GameSpeeds[Game.GetGameSpeedType()].GoldPercent/100
local FaithGameSpeed = GameInfo.GameSpeeds[Game.GetGameSpeedType()].FaithPercent/100
local XPGameSpeed = GameInfo.GameSpeeds[Game.GetGameSpeedType()].TrainPercent/100
local GPGameSpeed = GameInfo.GameSpeeds[Game.GetGameSpeedType()].GreatPeoplePercent/100

local tUniqueUnits = {}

for row in DB.Query("SELECT a.ID, a.Type FROM Units a, Civilization_UnitClassOverrides b WHERE a.CivilianAttackPriority IS NULL AND a.CombatClass <> 'UNITCOMBAT_RECON' AND a.CombatClass <> 'UNITCOMBAT_SIEGE' AND a.CombatClass IS NOT NULL AND b.CivilizationType <> 'CIVILIZATION_BARBARIAN' AND b.CivilizationType <> 'CIVILIZATION_MINOR' AND b.CivilizationType <> 'CIVILIZATION_GH_LOUISIANA' AND a.Type = b.UnitType") do
	tUniqueUnits[row.ID] = row.Type
	print (row.Type)
end

include("FLuaVector.lua")
include("PlotIterators")

function UUnitOccurencePercent ()
	local gameSpeedID = Game.GetGameSpeedType()
	if gameSpeedID == 0 then UUGameSpeed = 1.5 end
	if gameSpeedID == 1 then UUGameSpeed = 1.25 end
	if gameSpeedID == 2 then UUGameSpeed = 1 end
	if gameSpeedID == 3 then UUGameSpeed = 0.75 end
	return UUGameSpeed
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

-- JFD_GetRandom
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end

function NearestCity(iX, iY, pPlayer)
	local iShortestDistance = 99999
	local pNearestCity = nil
	for pCity in pPlayer:Cities() do
			local iDist = Map.PlotDistance(pCity:GetX(), pCity:GetY(), iX, iY)
			if iDist < iShortestDistance then
				iShortestDistance = iDist
				pNearestCity = pCity
			end
	end
	return pNearestCity
end


local tEraUU = {}
local index = 1

function CollectUUnitsFromEra (pPlayer, bIncludeSeaUnits)
	tEraUU = {}
	index = 1

	for id, nUU in pairs(tUniqueUnits) do
		local iDomain = GameInfoTypes[GameInfo.Units[nUU].Domain]
		local iNeededTech = GameInfoTypes[GameInfo.Units[nUU].PrereqTech]
		if iNeededTech == nil then iNeededTech = 0 end	
		local nEraNeededTech = GameInfo.Technologies[iNeededTech].Era
		local iEraNeededTech = GameInfoTypes[nEraNeededTech]
		if pPlayer:GetCurrentEra() < 4 then
            if iEraNeededTech == pPlayer:GetCurrentEra() then
                if bIncludeSeaUnits then
                    tEraUU[index] = id
                    index = index + 1
                else
                    if iDomain ~= DomainTypes.DOMAIN_SEA then
                        tEraUU[index] = id
                        index = index + 1
                    end
                end
            end
		elseif pPlayer:GetCurrentEra() == 4 then
			if iEraNeededTech == 3 or iEraNeededTech == 4 then
                if bIncludeSeaUnits then
                    tEraUU[index] = id
                    index = index + 1
                else
                    if iDomain ~= DomainTypes.DOMAIN_SEA then
                        tEraUU[index] = id
                        index = index + 1
                    end
                end		
			end
		elseif pPlayer:GetCurrentEra() > 4 then
			if iEraNeededTech >= 3 then
                if bIncludeSeaUnits then
                    tEraUU[index] = id
                    index = index + 1
                else
                    if iDomain ~= DomainTypes.DOMAIN_SEA then
                        tEraUU[index] = id
                        index = index + 1
                    end
                end	
			end
		end
	end		
for i,v in ipairs(tEraUU) do print(i,v) end
end
--------------------------------------------------------------
-- Trait
--------------------------------------------------------------
-- Start with a Great Voyageur

-- function StartWithGVoyageur()
    -- for iPlayerLoop = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
        -- local pPlayer = Players[iPlayerLoop]
        -- if (pPlayer:IsAlive() == true) and (pPlayer:GetCivilizationType() == eCivilizationLouisiana) then
			-- --CollectUUnitsFromEra (pPlayer)
			-- if Game.GetElapsedGameTurns() > 0 or pPlayer:HasUnit(iGrandVoyageur) then return end	
			-- for pUnit in pPlayer:Units() do
				-- if pUnit and pUnit:GetUnitType() == GameInfoTypes.UNIT_SETTLER then
					-- local pGVoyageur = pPlayer:InitUnit(iGrandVoyageur, pUnit:GetX(), pUnit:GetY(), -1, DirectionTypes.NO_DIRECTION, false)
					-- pGVoyageur:SetMoves(180)
					-- pGVoyageur:SetName("TXT_KEY_GH_GVOYAGEUR__001")
					-- break
				-- end
			-- end
		-- end
	-- end
-- end

-- Events.LoadScreenClose.Add(StartWithGVoyageur)

-- Number of Allied Cities with population size

function CountCityStateAllied (iPlayer)
	local pPlayer = Players[iPlayer]
	local AlliedCityNumber = 0
	
	for iMinorPlayer = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS-1, 1 do
		if Players[iMinorPlayer] then
			local pMinorPlayer = Players[iMinorPlayer]
				--print (pMinorPlayer:GetName())
			if (pMinorPlayer:IsMinorCiv() and pMinorPlayer:IsAlive()) then
				AlliedCityNumber = AlliedCityNumber + pMinorPlayer:GetMinorCivFriendshipLevelWithMajor(iPlayer)
				--print (pMinorPlayer:GetMinorCivFriendshipLevelWithMajor(iPlayer))
			end
		end
	end	
	return AlliedCityNumber
end

-- Number of Cities in Resistance with population size

function CountCityInResistance (iPlayer)
	local pPlayer = Players[iPlayer]
	local ResistanceCityNumber = 0
	
	for iOtherPlayer = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
		if Players[iOtherPlayer] then
			local pOtherPlayer = Players[iOtherPlayer]
			local pOtherTeam = Teams[pOtherPlayer:GetTeam()]
			if pOtherPlayer:IsAlive() and pOtherPlayer ~= pPlayer and pOtherTeam:IsHasMet(pPlayer:GetTeam()) then
				for pCity in pOtherPlayer:Cities() do
					if pCity:IsResistance() then
						ResistanceCityNumber = ResistanceCityNumber + 1
					end
				end
			end
		end
	end
	return ResistanceCityNumber
end
	
-- UA, New Unique Units from Allied City-states and Foreign Cities in Resistance

function NewUUReinforcements (iPlayer)
	local pPlayer = Players[iPlayer]
	
	if not (pPlayer and pPlayer:GetCivilizationType() == eCivilizationLouisiana) then return end
	
	local AlliedCityNumber = CountCityStateAllied (iPlayer)
	local ResistanceCityNumber = CountCityInResistance (iPlayer)
	local SumCityNumber = AlliedCityNumber + ResistanceCityNumber
	local NumUUMax = math.floor(SumCityNumber/10 + 1)
	local NumTurnPassed = Game.GetElapsedGameTurns()
	local UUGameSpeed = UUnitOccurencePercent()
	local NumTurnThreshold = math.floor (UUGameSpeed * 20)
	--print (NumTurnThreshold)
	--print ("NumUUMax", NumUUMax)
	--print ("AlliedCityNumber", AlliedCityNumber)
	local pCapital = pPlayer:GetCapitalCity()
	
	-- if SumCityNumber > 0 then
		-- for pCity in pPlayer:Cities() do
			-- pCity:SetNumRealBuilding(iBuildingXPCSAllied, SumCityNumber)
		-- end
	-- else
		-- for pCity in pPlayer:Cities() do
			-- pCity:SetNumRealBuilding(iBuildingXPCSAllied, 0)
		-- end	
	-- end
	local NumDummyBuildingXP = math.floor(SumCityNumber/5 * XPGameSpeed)
	pCapital:SetNumRealBuilding(iBuildingXPCSAllied, NumDummyBuildingXP)

	if NumTurnPassed%NumTurnThreshold == 0 then
		CollectUUnitsFromEra (pPlayer, pCapital:IsCoastal(10))
		for NumUU = 1, NumUUMax, 1 do
			if next(tEraUU) ~= nil then
				local iRand = JFD_GetRandom(1, #tEraUU)
				local iUURandom = tEraUU[iRand]
				local pUUnit = pPlayer:InitUnit(iUURandom, pCapital:GetX(), pCapital:GetY(), -1, DirectionTypes.NO_DIRECTION, false)
				if pUUnit:GetDomainType() == 0 then
					BonusXPs = pCapital:GetProductionExperience(GameInfoTypes.UNIT_TRIREME) * XPGameSpeed
				elseif pUUnit:GetDomainType() == 1 then
					BonusXPs = pCapital:GetProductionExperience(GameInfoTypes.UNIT_FIGHTER) * XPGameSpeed 
				elseif pUUnit:GetDomainType() == 2 then
					BonusXPs = pCapital:GetProductionExperience(GameInfoTypes.UNIT_WARRIOR) * XPGameSpeed
				else
					BonusXPs = pCapital:GetProductionExperience("NO_UNIT") * XPGameSpeed
				end
				pUUnit:SetExperience(BonusXPs)
				local pCapitalX, pCapitalY, pCapitalID = pCapital:GetX(), pCapital:GetY(), pCapital:GetID()
				if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
					pPlayer:AddNotification(NotificationTypes.NOTIFICATION_INSTANT_YIELD,
					'Refugees and travelers have finished their training and have now formed a battalion, ready to protect their new homes.',
					'A [COLOR_POSITIVE_TEXT]'..pUUnit:GetName()..'[ENDCOLOR] joins your [ICON_CAPITAL] Capital [COLOR_POSITIVE_TEXT]'..pCapital:GetName()..'[ENDCOLOR]',
					pCapitalX, pCapitalY, pCapitalID)
				end
			end
		end
	end
	
	local RemainingTurns = NumTurnThreshold - NumTurnPassed%NumTurnThreshold
	local sTitle = "Louisiana Reinforcement Units"
	local sText = "Refugees and travelers from Allied [ICON_CITY_STATE] City-States and Cities in [ICON_RESISTANCE] Resistance:[NEWLINE][ICON_BULLET][COLOR_XP_BLUE]+" .. NumDummyBuildingXP*5 .. " XP[ENDCOLOR] for all new Units[NEWLINE][ICON_BULLET]"..NumUUMax.." [COLOR_POSITIVE_TEXT]New Unique Unit(s)[ENDCOLOR] will join you in "..RemainingTurns.." turns in your [ICON_CAPITAL] Capital [COLOR_POSITIVE_TEXT]"..pCapital:GetName().."[ENDCOLOR]"
	if pPlayer:IsHuman() then
		pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, sText, sTitle)
	end	
end

-- UA, Gold and Cities States Influence when Construct a Building, an Improvement or a GPTI

function GoldandInfluencePoint(iPlayer, pCity, iBonusMultiplier)
    local pPlayer = Players[iPlayer]
	
	local iEraModifier = math.max(pPlayer:GetCurrentEra(), 1)
	local GoldBonus = math.floor (8 * iEraModifier * GoldGameSpeed * iBonusMultiplier)
	local FaithBonus = math.floor (3 * iEraModifier * FaithGameSpeed * iBonusMultiplier)
	local BuildInfluence = 1 * iBonusMultiplier

	pPlayer:ChangeGold(GoldBonus)
	pPlayer:ChangeFaith(FaithBonus)
	
	for iMinorPlayer = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS - 1 do
		if Players[iMinorPlayer] then
			local pMinorPlayer = Players[iMinorPlayer]
			local iPlayer = pPlayer:GetID()
			if pMinorPlayer:IsMinorCiv() and pMinorPlayer:IsAlive() and pMinorPlayer:GetNumCities() > 0 then
				if pMinorPlayer:GetCapitalCity():GetReligiousMajority() > 0 then
					if pMinorPlayer:GetCapitalCity():GetReligiousMajority() == pPlayer:GetMajorityReligion() then						
						pMinorPlayer:ChangeMinorCivFriendshipWithMajor(iPlayer, BuildInfluence)
						if pPlayer:IsHuman() then
							local pMinorCityPlayer = pMinorPlayer:GetCapitalCity()
							local vCityPosition = PositionCalculator(pMinorCityPlayer:GetX(), pMinorCityPlayer:GetY())
							Events.AddPopupTextEvent(vCityPosition, "[COLOR_WHITE]+"..BuildInfluence.."[ICON_INFLUENCE][ENDCOLOR]", 1)
						end
					end
				end
			end
		end
	end
	
	if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
		local vCityPosition = PositionCalculator(pCity:GetX(), pCity:GetY())
		local sName = pCity:GetName()
		local pCityX, pCityY, pCityID = pCity:GetX(), pCity:GetY(), pCity:GetID()
		Events.AddPopupTextEvent(vCityPosition, "[COLOR_YIELD_GOLD]+"..GoldBonus.."[ICON_GOLD][ENDCOLOR]", 1.5)
		Events.AddPopupTextEvent(vCityPosition, "[COLOR_WHITE]+"..FaithBonus.."[ICON_PEACE][ENDCOLOR]", 2)	
		pPlayer:AddNotification(NotificationTypes.NOTIFICATION_INSTANT_YIELD,
			'Finished Building or Improvement:[NEWLINE] [ICON_BULLET] [COLOR_POSITIVE_TEXT]'..sName..':[ENDCOLOR] [COLOR_YIELD_GOLD]+'..GoldBonus..' [ENDCOLOR][ICON_GOLD] Gold, [COLOR_WHITE]+'..FaithBonus..' [ENDCOLOR][ICON_PEACE], [COLOR_WHITE]+'..BuildInfluence..' [ENDCOLOR][ICON_INFLUENCE] Influence on city states that share your majority religion',
			'Empire-Wide Bonus Yields',
			pCityX, pCityY, pCityID)	
	end
end

-- On construct Building

function OnConstructionGoldandInfluencePoint(iPlayer, iCity, iBuilding, bIncludeGold, bIncludeFaithOrCulture)
	local pPlayer = Players[iPlayer]

	if not (pPlayer and pPlayer:GetCivilizationType() == eCivilizationLouisiana) then return end
	
	local pCity = pPlayer:GetCityByID(iCity)
	local iBonusMultiplier = 1
	
	if pCity:IsWorldWonder(iBuilding) then
		iBonusMultiplier = 5
	end
	
	GoldandInfluencePoint (iPlayer, pCity, iBonusMultiplier)
end

-- On build Improvement or GPTI and On build Cajun Cabin, if they are worked, add GWork of Music slot and Specialist Musician Slot in the city

function OnBuildGoldandInfluencePoint(iPlayer, iUnit, iPlotX, iPlotY, iBuild)
	local pPlayer = Players[iPlayer]
	if not (pPlayer and (pPlayer:GetCivilizationType() == eCivilizationLouisiana)) then return end
	if iBuild == iBuildRoad or iBuild == iBuildRailroad or iBuild == iBuildRemoveRoute or iBuild == iBuildRepair or iBuild == iBuildRepairEmbarked or iBuild == iBuildScrubFallout then return end
	local pCity = NearestCity(iPlotX, iPlotY, pPlayer)
	local iBonusMultiplier = 1

	if iBuild == iBuildAcademy or iBuild == iBuildCitadel or iBuild == iBuildTown or iBuild == iBuildEmbassy or iBuild == iBuildHolySite or iBuild == iBuildManufactory then
		iBonusMultiplier = 5
	elseif iBuild == iBuildCajunCabin then
		if pCity:HasWorkedImprovement(iImprovementCajunCabin) then
			pCity:SetNumRealBuilding(iBuildingMusicSlots, 1)
		end
	end

	GoldandInfluencePoint (iPlayer, pCity, iBonusMultiplier)	
end

--------------------------------------------------------------
-- Cajun Cabin Improvement
--------------------------------------------------------------

-- Check each turn if City have a Cajun Cabin worked

function IfWorkedCajunCabinGiveMusicSlots(iPlayer)
	local pPlayer = Players[iPlayer]
	
	if (not pPlayer:IsAlive()) then return end
	if pPlayer:CountAllWorkedImprovement(iImprovementCajunCabin) == 0 and not pPlayer:HasBuilding(iBuildingMusicSlots) then return end
	
	for pCity in pPlayer:Cities() do
		if pCity:HasWorkedImprovement(iImprovementCajunCabin) then
			if not pCity:IsHasBuilding(iBuildingMusicSlots) then
				pCity:SetNumRealBuilding(iBuildingMusicSlots, 1)
			end
		elseif not pCity:HasWorkedImprovement(iImprovementCajunCabin) and pCity:IsHasBuilding(iBuildingMusicSlots) then
			pCity:SetNumRealBuilding(iBuildingMusicSlots, 0)
		end
	end
end

GameEvents.PlayerDoTurn.Add(IfWorkedCajunCabinGiveMusicSlots)
--------------------------------------------------------------
-- Grand Voyageur
--------------------------------------------------------------
-- Grand Voyageur appears when a Great Merchant born

function GrandVoyageurWhenGMerchantBorn(iUnitOwner, iUnit, iUnitType, iPlotX, iPlotY)
	local pPlayer = Players[iUnitOwner]

	if not (pPlayer and (pPlayer:GetCivilizationType() == eCivilizationLouisiana)) then return end
	
	if (not iUnitType) then iUnitType = iUnit end
	if iUnitType ~= iGreatMerchant then return end

	local pGVUnit = pPlayer:InitUnit(iGrandVoyageur, iPlotX, iPlotY, -1, DirectionTypes.NO_DIRECTION, false)
	local StartMove = 120
	if pPlayer:GetCurrentEra() > 1 then StartMove = StartMove + 60 end
	pGVUnit:SetMoves(StartMove)	
	local pPlot = Map.GetPlot(iPlotX, iPlotY)
	local pCity = pPlot:GetPlotCity()
	local BonusXPs = pCity:GetProductionExperience(GameInfoTypes.UNIT_WARRIOR) * XPGameSpeed
	pGVUnit:SetExperience(BonusXPs)
end

-- Can buy Grand Voyageur

function CanBuyGrandVoyageur(iOwner, iCity, iUnitType)
	local pPlayer = Players[iOwner]
	
	if not (pPlayer and (pPlayer:GetCivilizationType() == eCivilizationLouisiana)) then return true end
	if iUnitType ~= iGrandVoyageur then return true end
	
	local NumTown = pPlayer:CountAllImprovement(iTown, false)
	local NumGrandVoyageur = math.max(pPlayer:GetNumUnitsOfType(iGrandVoyageur), pPlayer:GetNumUnitPromotions(ePromotionEntrepreneur))
	if NumTown > NumGrandVoyageur then return true end
	return false
end

-- Reveal tiles give G Merchant Points in the Capital

function GrandVoyageurDiscoverForGMerchantPoints(iPlotX, iPlotY, iTeam, iFromTeam, bFirst, iUnitOwner, iUnit)
	local pPlayer = Players[iUnitOwner]
	if not (pPlayer and (pPlayer:GetNumUnitPromotions(ePromotionMetissage) > 0)) then return end
	local pPlot = Map.GetPlot(iPlotX, iPlotY)
	if pPlot then
		local pUnit = pPlayer:GetUnitByID(iUnit)
		if pUnit:IsHasPromotion(ePromotionMetissage) then
			local iEraModifier = math.max(pPlayer:GetCurrentEra(), 1)
			local NumPromotionMetissage = pPlayer:GetNumUnitPromotions(ePromotionMetissage)
			local GMerchantPointBonus = 12 * iEraModifier * GPGameSpeed * NumPromotionMetissage
			local GMerchantPointBonusView = GMerchantPointBonus / 10
			local pCapital = pPlayer:GetCapitalCity()
			pCapital:ChangeSpecialistGreatPersonProgressTimes100(iSpecialistMerchant, GMerchantPointBonus)
			
			if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
				local vCityPosition = PositionCalculator(pCapital:GetX(), pCapital:GetY())
				Events.AddPopupTextEvent(vCityPosition, "[COLOR_GREAT_PEOPLE_STORED]+"..GMerchantPointBonusView.." [ICON_GREAT_MERCHANT][ENDCOLOR]", 0.5)
			end
		
		end
	end
end

GameEvents.TileRevealed.Add(GrandVoyageurDiscoverForGMerchantPoints)

-- When Promoted, give G Merchant Points in the nearest city

function WhenPromotedGainGMerchantPointInCapital (iplayer, iUnit)
	local pPlayer = Players[iplayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)
	
	if pUnit and pUnit:IsHasPromotion(ePromotionMetissage) then
		local GMerchantPointBonus = math.floor(1000 * (pUnit:GetLevel() - 1) * GPGameSpeed)
		local GMerchantPointBonusView = GMerchantPointBonus / 100
		local pCapital = pPlayer:GetCapitalCity()
		pCapital:ChangeSpecialistGreatPersonProgressTimes100(iSpecialistMerchant, GMerchantPointBonus)

		if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
			local vCityPosition = PositionCalculator(pCapital:GetX(), pCapital:GetY())
			Events.AddPopupTextEvent(vCityPosition, "[COLOR_GREAT_PEOPLE_STORED]+"..GMerchantPointBonusView.." [ICON_GREAT_MERCHANT][ENDCOLOR]", 1.5)
		end
	end
end

GameEvents.UnitPromoted.Add(WhenPromotedGainGMerchantPointInCapital)

-- Pemmican Promotion when Great Merchant Expended

function ExpendGMerchantForPemmicanPromotion(iPlayer, iUnit, iUnitType, iPlotX, iPlotY)
	local pPlayer = Players[iPlayer]
	
	if pPlayer:GetNumUnitPromotions(ePromotionPemmican) == 0 then return end
	if iUnitType == iGreatMerchant then
		for pUnit in pPlayer:Units() do
			if pUnit:GetDomainType() == DomainTypes.DOMAIN_LAND and not pUnit:IsEmbarked() then
				for pUnitPP in pPlayer:Units() do
					if pUnitPP:IsHasPromotion(ePromotionPemmican) then
						if pUnit:GetPlot():GetArea() == pUnitPP:GetPlot():GetArea() and pUnit:GetOwner() == pUnitPP:GetOwner() then
							pUnit:SetHasPromotion(ePromotionPemmicanEffect, true)
							break
						end
					end
				end
			end
		end
	end
end

GameEvents.GreatPersonExpended.Add(ExpendGMerchantForPemmicanPromotion)

-- Entrepreneur Promotion gives GMerchant Points in Capital

function EntrepreneurGivesGMP (iPlayer)
	local pPlayer = Players[iPlayer]
	
	if (pPlayer:GetNumUnitPromotions(ePromotionEntrepreneur)) == 0 then return end
	
	local EntrepreneurNumber = pPlayer:GetNumUnitPromotions(ePromotionEntrepreneur)
	local GMerchantPointBonus = math.floor(200 * EntrepreneurNumber * GPGameSpeed)
	local GMerchantPointBonusView = GMerchantPointBonus / 100
	local pCapital = pPlayer:GetCapitalCity()
	pCapital:ChangeSpecialistGreatPersonProgressTimes100(iSpecialistMerchant, GMerchantPointBonus)

	if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
		local vCityPosition = PositionCalculator(pCapital:GetX(), pCapital:GetY())
		Events.AddPopupTextEvent(vCityPosition, "[COLOR_GREAT_PEOPLE_STORED]+"..GMerchantPointBonusView.." [ICON_GREAT_MERCHANT][ENDCOLOR]", 1.5)
	end
end

GameEvents.PlayerDoTurn.Add(EntrepreneurGivesGMP)


if Game.IsCivEverActive(eCivilizationLouisiana) then
	GameEvents.PlayerDoTurn.Add(NewUUReinforcements)
	GameEvents.PlayerBuilt.Add(OnBuildGoldandInfluencePoint)
	GameEvents.CityConstructed.Add(OnConstructionGoldandInfluencePoint)
	GameEvents.UnitCreated.Add(GrandVoyageurWhenGMerchantBorn)
	GameEvents.CityCanTrain.Add(CanBuyGrandVoyageur)
	print("Louisiana activated!")
end
