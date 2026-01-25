-- France
-- Author: Gwennog
-- Date Created: 27/06/2024

local eCivilizationFrance = GameInfoTypes.CIVILIZATION_GW_FRANCE
local iAcademy = GameInfoTypes.IMPROVEMENT_ACADEMY
local iCitadel = GameInfoTypes.IMPROVEMENT_CITADEL
local iCustomHouse = GameInfoTypes.IMPROVEMENT_CUSTOMS_HOUSE
local iEmbassy = GameInfoTypes.IMPROVEMENT_EMBASSY
local iManufactory = GameInfoTypes.IMPROVEMENT_MANUFACTORY
local iChateau = GameInfoTypes.IMPROVEMENT_GW_FRANCE_CHATEAU
local iDummyBuildingForScientist = GameInfoTypes.BUILDING_D_GW_FRANCE_SCIENTIST
local iDummyBuildingForMerchant = GameInfoTypes.BUILDING_D_GW_FRANCE_MERCHANT
local iDummyBuildingForDiplomat = GameInfoTypes.BUILDING_D_GW_FRANCE_DIPLOMAT
local iDummyBuildingForEngineer = GameInfoTypes.BUILDING_D_GW_FRANCE_ENGINEER
local iDummyBuildingForArtist = GameInfoTypes.BUILDING_D_GW_FRANCE_ARTIST
local iDummyBuildingForWriter = GameInfoTypes.BUILDING_D_GW_FRANCE_WRITER
local iDummyBuildingForMusician = GameInfoTypes.BUILDING_D_GW_FRANCE_MUSICIAN
local iDummyBuildingForModifiers = GameInfoTypes.BUILDING_D_GW_FRANCE_TRAIT
local iDummyBuildingClassForModifiers = GameInfoTypes.BUILDINGCLASS_D_GW_FRANCE_TRAIT
local iDummyBuildingClassForDiplomat = GameInfoTypes.BUILDINGCLASS_D_GW_FRANCE_DIPLOMAT
local iGrandeEcole = GameInfoTypes.BUILDING_FRANCE_GRANDE_ECOLE
local iDummyBuildingForModifiersLocal = GameInfoTypes.BUILDING_D_GW_FRANCE_GE
local iDummyBuildingClassForModifiersLocal = GameInfoTypes.BUILDINGCLASS_D_GW_FRANCE_GE
local iMontjoiePromo = GameInfoTypes.PROMOTION_GW_FRANCE_MONTJOIE
local iJoutePromo = GameInfoTypes.PROMOTION_GW_FRANCE_JOUTE

include("FLuaVector.lua")

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
--------------------------------------------------------------
-- Trait
--------------------------------------------------------------
-- Trait : Cities gain GPP from unique improvements

function GPPForImprovement(iPlayer)	
	local pPlayer = Players[iPlayer]
	
	if not (pPlayer and pPlayer:GetCivilizationType() == eCivilizationFrance) then return end

	local pTeam = Teams[pPlayer:GetTeam()]
	
	if pPlayer:CountNumBuildings(iDummyBuildingForDiplomat) > 0 then
		for pCity in pPlayer:Cities() do
			pCity:SetNumRealBuilding(iDummyBuildingForDiplomat, 0)
		end
	end

	for iPlayerLoop = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_PLAYERS - 2 do
		local pCheckPlayer = Players[iPlayerLoop]
		local pCheckTeam = Teams[pCheckPlayer:GetTeam()]
        if pCheckPlayer:IsEverAlive() and pCheckTeam:IsHasMet(pTeam) then
			local pCSCapital = pCheckPlayer:GetCapitalCity()
			if pCSCapital and pCSCapital:CountNumWorkedImprovement(iEmbassy, false) > 0 then
				for i = 0, pCSCapital:GetNumCityPlots()-1, 1 do
					local pPlot = pCSCapital:GetCityIndexPlot(i)
					local iPlotOwner = pPlot:GetOwner()
					local pPlotOwner = Players[iPlotOwner]
					if pPlot and pPlotOwner == pCheckPlayer and pPlot:HasImprovement(iEmbassy) and (not pPlot:IsImprovementPillaged()) then
						if pPlot:GetPlayerThatBuiltImprovement() == iPlayer then
							local pCity = NearestCity(pPlot:GetX(), pPlot:GetY(), pPlayer)
							pCity:SetNumRealBuilding(iDummyBuildingForDiplomat, pCity:GetNumBuildingClass(iDummyBuildingClassForDiplomat) + 1)
						end
					end
				end
			end
		end
	end
	
	local NumAcademy = pPlayer:CountAllImprovement(iAcademy)
	local NumCitadel = pPlayer:CountAllImprovement(iCitadel)
	local NumCustomHouse = pPlayer:CountAllImprovement(iCustomHouse)
	local NumManufactory = pPlayer:CountAllImprovement(iManufactory)
	local SumImprovements = NumAcademy+NumCitadel+NumCustomHouse+NumManufactory

	if SumImprovements < 1 then return end

	for pCity in pPlayer:Cities() do
		local NumCityAcademy = pCity:CountNumWorkedImprovement(iAcademy, false)
		if NumCityAcademy > 0 then
			pCity:SetNumRealBuilding(iDummyBuildingForScientist, NumCityAcademy)
		end
		
		local NumCityCitadel = pCity:CountNumWorkedImprovement(iCitadel, false)
		if NumCityCitadel > 0 then
			pPlayer:ChangeCombatExperience(NumCitadel * 2)
		end
		
		local NumCityCustomHouse = pCity:CountWorkedImprovement(iCustomHouse, false)
		if NumCityCustomHouse > 0 then
			pCity:SetNumRealBuilding(iDummyBuildingForMerchant, NumCityCustomHouse)
		end
		
		local NumCityManufactory = pCity:CountNumWorkedImprovement(iManufactory, false)
		if NumCityManufactory > 0 then
			pCity:SetNumRealBuilding(iDummyBuildingForEngineer, NumCityManufactory)
		end
	end
end

function GPPForChateau(iPlayer)	
	local pPlayer = Players[iPlayer]

	if not pPlayer then return end	
	
	local NumChateau = pPlayer:CountAllImprovement(iChateau)
	
	if NumChateau < 1 then return end
	
	for pCity in pPlayer:Cities() do
		local NumCityChateau = pCity:CountNumWorkedImprovement(iChateau, false)		
		if NumCityChateau > 0 then
			pCity:SetNumRealBuilding(iDummyBuildingForArtist, NumCityChateau)
			pCity:SetNumRealBuilding(iDummyBuildingForWriter, NumCityChateau)
			pCity:SetNumRealBuilding(iDummyBuildingForMusician, NumCityChateau)
		end
	end
end

-- Modifiers to all cities and Montjoie St Denis Promotion when a GP born

function ModifierswhenGPBorn(iUnitOwner, iUnit, iUnitType, iPlotX, iPlotY)
	local pPlayer = Players[iUnitOwner]
	if not (pPlayer and (pPlayer:GetCivilizationType() == eCivilizationFrance)) then return end
	
	if (not iUnitType) then iUnitType = iUnit end
	local pUnit = pPlayer:GetUnitByID(iUnit)	
	if not pUnit:IsGreatPerson() then return end
	for pUnit in pPlayer:Units() do
		if pUnit:IsCombatUnit() and pUnit:GetDomainType() == DomainTypes.DOMAIN_LAND then
			if pUnit:IsHasPromotion(iMontjoiePromo) then
				pUnit:SetHasPromotion(iMontjoiePromo, false)
				pUnit:SetHasPromotion(iMontjoiePromo, true)
			else
				pUnit:SetHasPromotion(iMontjoiePromo, true)
			end
		end
	end
	
	local pCapital = pPlayer:GetCapitalCity()
	if pCapital:GetNumBuildingClass(iDummyBuildingClassForModifiers) < 15 then
		pCapital:SetNumRealBuilding(iDummyBuildingForModifiers, pCapital:GetNumBuildingClass(iDummyBuildingClassForModifiers)+1)
	elseif pCapital:GetNumBuildingClass(iDummyBuildingClassForModifiers) >= 15 then
		for pCity in pPlayer:Cities() do
			if pCity:IsHasBuilding(iGrandeEcole) and pCity:GetNumBuildingClass(iDummyBuildingClassForModifiersLocal) < 10 then
				pCity:SetNumRealBuilding(iDummyBuildingForModifiersLocal, pCity:GetNumBuildingClass(iDummyBuildingClassForModifiersLocal)+1)
			end
		end
	end
end

function ChevalierAtPeace(iPlayer)
	local pPlayer = Players[iPlayer]
	if not (pPlayer and pPlayer:IsAtPeace()) then return end	
	if pPlayer:GetNumUnitPromotions(iJoutePromo) <1 then return end
	
	for pUnit in pPlayer:Units() do
		if pUnit:IsHasPromotion(iJoutePromo) then
			local Culturebonus = pUnit:GetLevel() * 2
			local pPlot = pUnit:GetPlot()
			pPlayer:ChangeJONSCulture(Culturebonus)
			pUnit:ChangeExperience(1, -1, 1)
			
			if pPlayer:IsHuman() then
				Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(pPlot:GetX(), pPlot:GetY()))), "+ " .. Culturebonus .. " [ICON_CULTURE]", 1)
			end
		end		
	end
end

if Game.IsCivEverActive(eCivilizationFrance) then
	GameEvents.PlayerDoTurn.Add(GPPForImprovement)
	GameEvents.PlayerDoTurn.Add(GPPForChateau)
	GameEvents.UnitCreated.Add(ModifierswhenGPBorn)
	GameEvents.PlayerDoTurn.Add(ChevalierAtPeace)
	print("France under Philippe II Auguste activated!")
end