-- Tophet
-- Author: Blue Ghost, adan_eslavo
-- DateCreated:
--------------------------------------------------------------	
include("FLuaVector.lua")
local eAkapanaDummyPolicy = GameInfoTypes.POLICY_AKAPANA_DUMMY

-- two abilities: additional xp on purchasing and culture to the city on purchasing
function AkapanaChallaRitual(iPlayer, iCity, iUnit, bGold, bFaith)

	if bGold then return end 
	
	local pPlayer = Players[iPlayer]
	
	local pCity = pPlayer:GetCityByID(iCity)

	if not pCity:IsHasBuilding(GameInfoTypes.BUILDING_AKAPANA) then return end
	
	local pUnit = pPlayer:GetUnitByID(iUnit)
	
	if pUnit:GetUnitType() == GameInfoTypes.UNIT_AKAPANA_CHALLA_RITUAL then
		
		pUnit:Kill(true, -1)
		local eBuildingChallaBonus = GameInfoTypes.BUILDING_D_FOR_AKAPANA_STACKS
		local iAkapanaBonus = pCity:GetNumRealBuilding(eBuildingChallaBonus) + 1	
		
		if iAkapanaBonus > 25 then 
			pPlayer:RevokePolicy(eAkapanaDummyPolicy)
			return 
		end
		
		if iAkapanaBonus == 10 then 
			pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_D_FOR_AKAPANA_REFORM, 1)
		end
		
		pCity:SetNumRealBuilding(eBuildingChallaBonus, iAkapanaBonus)
		
		if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
			local iX, iY = pCity:GetX(), pCity:GetY()
			local vCityPosition = PositionCalculator(iX, iY)
							
			Events.AddPopupTextEvent(vCityPosition, "[COLOR_POSITIVE_TEXT]Challa Ritual[ENDCOLOR]", 1)
		end
	end
end

function OnReligionFoundAkapana(iPlayer, iHolyCity, iReligion, iBelief1, iBelief2, iBelief3, iBelief4, iBelief5)
	local iLibations = GameInfo.Beliefs.BELIEF_LIBATIONS.ID
	
	if (iBelief1 == iLibations or iBelief2 == iLibations or iBelief3 == iLibations or iBelief4 == iLibations or iBelief5 == iLibations) then
		local pPlayer = Players[iPlayer]
		pPlayer:GrantPolicy(eAkapanaDummyPolicy, true)
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

GameEvents.CityTrained.Add(AkapanaChallaRitual)
GameEvents.ReligionFounded.Add(OnReligionFoundAkapana)

