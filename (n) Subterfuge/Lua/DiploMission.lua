-- DiploMission
-- Author: Hokath
-- DateCreated: 21/12/2024 8:38:11 PM
--------------------------------------------------------------
local iGDipClass = GameInfoTypes["UNITCLASS_GREAT_DIPLOMAT"]
local iBEmbassy = GameInfoTypes["BUILD_EMBASSY"]
local iEmbassy = GameInfoTypes["IMPROVEMENT_EMBASSY"]
local eSpyPoints = GameInfoTypes.BUILDING_D_FOR_SPYPOINTS

-- these log actions each turn
local hasExpDip = 0
local hasGotEmb = 0

function DiploFires(iPlayer, iUnit, iUnitType, iPlotX, iPlotY)
    local pUnit = Players[iPlayer]:GetUnitByID(iUnit)
    if pUnit:GetUnitClassType() ~= iGDipClass then return false end
    hasExpDip = hasExpDip + 1
end

GameEvents.GreatPersonExpended.Add(DiploFires)

-- this fires afterwards 
function EmbassyFires(iPlayer, iUnit, iPlotX, iPlotY, iBuild)
	if iBuild ~= iBEmbassy then return false end
	hasGotEmb = hasGotEmb + 1
end

GameEvents.PlayerBuilt.Add(EmbassyFires)

function PointsOrNot(iPlayer)
	local diff = hasExpDip - hasGotEmb
	if diff > 0 then
		print("we get some points!")
		local pPlayer = Players[iPlayer]
		pCapital = pPlayer:GetCapitalCity()
		for i=1, diff do
			local iPoints = pCapital:GetNumBuilding(eSpyPoints)
			pCapital:SetNumRealBuilding(eSpyPoints, iPoints+1)
		end
		local iX, iY = pCapital:GetX(), pCapital:GetY()
		pPlayer:AddNotification(NotificationTypes.NOTIFICATION_INSTANT_YIELD, 
				'After your [ICON_DIPLOMAT] Great Diplomat Mission completed, your agents were exfiltrated from their diplomatic cover. Your newly cultivated assets permanently increase your operational capabilities, +50 [ICON_SPY_POINT] Spy Points.',
				'Spy Point Increase', 
				iX, iY, pCapital:GetID())

	end
	-- for the next player
	hasExpDip = 0
	hasGotEmb = 0
end

GameEvents.PlayerDoneTurn.Add(PointsOrNot)

print("DiploMission has initiated all its functions")
