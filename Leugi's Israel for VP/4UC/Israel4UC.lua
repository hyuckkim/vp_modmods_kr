-- Israel Mod 
-- Author: pineappledan
-- DateCreated: 4/12/2018
--------------------------------------------------------------
print ("Israel Check")


local eCivilizationIsrael = GameInfoTypes.CIVILIZATION_LEUGI_ISRAEL
include("FLuaVector.lua")

--Shofet Unique Promotions Assignment. Give Great General promotion depending if it starts turn in friendly or non-friendly land
--Shofet Culture and Faith every turn

function Shofar(iPlayer)
	local pPlayer = Players[iPlayer]
	local pPlayerTeam = Teams[pPlayer:GetTeam()]
	
    if pPlayer:GetCivilizationType() ~= eCivilizationIsrael then return end
	
	local NumShofets = pPlayer:GetUnitClassCount(GameInfoTypes.UNITCLASS_GREAT_GENERAL)
	pPlayer:GetCapitalCity():SetNumRealBuilding(GameInfoTypes.BUILDING_SHOPHET_DUMMY, NumShofets)
	
	if NumShofets >= 1 then
	
		for otherPlayerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
			local otherPlayer = Players[otherPlayerID]
			if (pPlayer:IsAlive() and otherPlayerID ~= iPlayer) then
				if pPlayerTeam:IsAtWar(otherPlayer:GetTeam()) then
					for city in otherPlayer:Cities() do	
						if city:IsWithinDistanceOfUnitPromotion(GameInfoTypes.PROMOTION_SHOFAR, 1, false, true) then
							if city:IsBlockaded() then
								city:ChangeDamage(40)
								if (pPlayer:IsHuman() or otherPlayer:IsHuman()) then
									Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(city:GetX(), city:GetY()))), Locale.ConvertTextKey("[COLOR_NEGATIVE_TEXT]40 Shofar[ENDCOLOR]", 1))
								end
							else 
								city:ChangeDamage(20)
								if (pPlayer:IsHuman() or otherPlayer:IsHuman()) then
									Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(city:GetX(), city:GetY()))), Locale.ConvertTextKey("[COLOR_NEGATIVE_TEXT]20 Shofar[ENDCOLOR]", 1))
								end
							end
						end
					end
				end
			end
		end
	end
end

function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

if Game.IsCivEverActive(eCivilizationIsrael) then
	GameEvents.PlayerDoTurn.Add(Shofar)
end