-- Louisiana 4UC
-- Author: Gwennog
-- DateCreated: 11/11/2021

local eCivilizationLouisiana = GameInfoTypes.CIVILIZATION_GH_LOUISIANA
local ePromotionMardiGras = GameInfoTypes.PROMOTION_GH_LOUISIANA_KREWE_MARDIGRAS
local iTechNeeded = GameInfoTypes.TECH_ACOUSTICS
local iDummyBuildingNumKreweExpended = GameInfoTypes.BUILDING_D_GH_LOUISIANA_FOR_VIEUXCARRE_BUILD
local iVieuxCarre = GameInfoTypes.BUILDING_GH_LOUISIANA_VIEUXCARRE
local iDummyBuildingForWLTKD = GameInfoTypes.BUILDING_D_GH_LOUISIANA_FOR_VIEUXCARRE_WLTKD
local iTourismMusicEvent = GameInfoTypes.PLAYER_EVENT_CHOICE_GH_TOURISM_MUSIC_BONUS

local WLTKDGameSpeed = GameInfo.GameSpeeds[Game.GetGameSpeedType()].GoldenAgePercent/100
local ResistanceGameSpeed = GameInfo.GameSpeeds[Game.GetGameSpeedType()].OpinionDurationPercent/100

include("FLuaVector.lua")

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
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

--------------------------------------------------------------
-- Krewe
--------------------------------------------------------------
-- WLTKD when a Krewe is expended in your territory and resistance in nearest city in the territory of another civilization

function KreweMardiGras(iPlayer, iUnit, iUnitType, iPlotX, iPlotY)
	local pPlayer = Players[iPlayer]

	if not (pPlayer and pPlayer:GetCivilizationType() == eCivilizationLouisiana) then return end

	local pUnit = pPlayer:GetUnitByID(iUnit)
	
	if not pUnit:IsHasPromotion(ePromotionMardiGras) then return end
	
	pPlayer:DoEventChoice(iTourismMusicEvent)

	local pTeam = Teams[pPlayer:GetTeam()]
	local pCapital = pPlayer:GetCapitalCity()
	local NumKreweExpended = pCapital:GetNumRealBuilding(iDummyBuildingNumKreweExpended) + 1

	print ("NumKreweExpended", NumKreweExpended)
	
	if NumKreweExpended > 2 and pTeam:GetTeamTechs():HasTech(iTechNeeded) then
		print ("Choix1")
		local pCapital = pPlayer:GetCapitalCity()
		if pCapital and not pCapital:IsHasBuilding(iVieuxCarre) then
			pCapital:SetNumRealBuilding(iVieuxCarre, 1)		
			NotificationLoad(pPlayer, pCapital)
		end
	else
		--print ("Choix2")
		pCapital:SetNumRealBuilding(iDummyBuildingNumKreweExpended, NumKreweExpended)
	end

	--print ("pCapital:GetNumRealBuilding(iDummyBuildingNumKreweExpended) ", pCapital:GetNumRealBuilding(iDummyBuildingNumKreweExpended))

	local pPlot = Map.GetPlot(iPlotX, iPlotY)	
	local iOwnerPlayer = pPlot:GetOwner()
	local pOwnerPlayer = Players[iOwnerPlayer]
	if pOwnerPlayer == pPlayer then
		local WLTKDDuration = math.floor (15 * WLTKDGameSpeed)
		for pCity in pPlayer:Cities() do
			pCity:ChangeWeLoveTheKingDayCounter(WLTKDDuration)
		end
	else
		local pCity = NearestCity(iPlotX, iPlotY, pOwnerPlayer)
		local ResistanceDuration = math.floor (3 * ResistanceGameSpeed)
		pCity:ChangeResistanceTurns(ResistanceDuration)
	end
end
--------------------------------------------------------------
-- Vieux Carré
--------------------------------------------------------------
function With4GMCityCanConstructVieuxCarre(iPlayer, icity, iBuildingType)
	local pPlayer = Players[iPlayer]
	if iBuildingType == iVieuxCarre then
		return false
	end
	return true
end

function OnTechResearchedIsVieuxCarreConstructed(iTeam, iTech)
	local pTeam = Teams[iTeam]
	local pPlayer = Players[pTeam:GetLeaderID()]

	if not (pPlayer and pPlayer:GetCivilizationType() == eCivilizationLouisiana) then return end

	if iTech ~= iTechNeeded then return end

	local pCapital = pPlayer:GetCapitalCity()
	local NumKreweExpended = pCapital:GetNumRealBuilding(iDummyBuildingNumKreweExpended)
	
	if NumKreweExpended < 3 then return end
	
	if pCapital and not pCapital:IsHasBuilding(iVieuxCarre) then
		pCapital:SetNumRealBuilding(iVieuxCarre, 1)
		
		NotificationLoad(pPlayer, pCapital)
	end
end

function VieuxCarreWLTKDStart(iPlayer, iPlotX, iPlotY)
	local pPlayer = Players[iPlayer]
		
	if not (pPlayer and pPlayer:GetCivilizationType() == eCivilizationLouisiana) then return end

	local pCapital = pPlayer:GetCapitalCity()	
	
	if not pCapital:IsHasBuilding(iVieuxCarre) then return end
			
	local pCityPlot = Map.GetPlot(iPlotX, iPlotY)
	local pCity = pCityPlot:GetPlotCity()
	
	if pCity ~= pCapital then return end
	
	if not pCapital:IsHasBuilding(iDummyBuildingForWLTKD) then
		pCapital:SetNumRealBuilding(iDummyBuildingForWLTKD, 1)
	end
end

function IsVieuxCarreConstructed(iPlayer)
	local pPlayer = Players[iPlayer]
		
	if not (pPlayer and pPlayer:GetCivilizationType() == eCivilizationLouisiana) then return end
	
	local pCapital = pPlayer:GetCapitalCity()
	
	if not pCapital:IsHasBuilding(iVieuxCarre) then return end
		
	if pCapital:GetWeLoveTheKingDayCounter() > 0 then
		pCapital:SetNumRealBuilding(iDummyBuildingForWLTKD, 1)
	else
		pCapital:SetNumRealBuilding(iDummyBuildingForWLTKD, 0)		
	end
end

function NotificationLoad(pPlayer, pCapital)
	if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
		pPlayer:AddNotification(NotificationTypes.NOTIFICATION_INSTANT_YIELD, 
		'Music everywhere in [COLOR_CYAN]'..pCapital:GetName()..'[ENDCOLOR] brings the Vieux Carré to life.', 
		'Vieux Carré constructed in '..pCapital:GetName(), 
		pCapital:GetX(), pCapital:GetY())
	end
end

if Game.IsCivEverActive(eCivilizationLouisiana) then
	GameEvents.GreatPersonExpended.Add(KreweMardiGras)
	GameEvents.CityCanConstruct.Add(With4GMCityCanConstructVieuxCarre)
	GameEvents.TeamTechResearched.Add(OnTechResearchedIsVieuxCarreConstructed)
	GameEvents.CityBeginsWLTKD.Add(VieuxCarreWLTKDStart)
	GameEvents.PlayerDoTurn.Add(IsVieuxCarreConstructed)
	print("Louisiana 4UC activated!")
end
