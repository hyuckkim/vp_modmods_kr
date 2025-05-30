local ePromotionYerba = GameInfoTypes.PROMOTION_FLETCHER
local eBuildingFletcher = GameInfoTypes.BUILDING_FLETCHER

local tArcheryUnits = {
	GameInfoTypes.UNITCLASS_VP_SLINGER,
	GameInfoTypes.UNITCLASS_ARCHER,
	GameInfoTypes.UNITCLASS_COMPOSITE_BOWMAN,
	GameInfoTypes.UNITCLASS_CROSSBOWMAN,
	GameInfoTypes.UNITCLASS_LONGBOWMAN,
	GameInfoTypes.UNITCLASS_CHARIOT_ARCHER,
	GameInfoTypes.UNITCLASS_HORSE_ARCHER,
	GameInfoTypes.UNITCLASS_MOUNTED_BOWMAN
}

-- adding fletcher promotion to archery units
--function OnUpgradeTakeOutFletcher(iPlayer, iOldUnit, iNewUnit, bGoodyHut)
function OnUpgradeTakeOutFletcher(iOldPlayer, iNewPlayer, iOldUnit, iNewUnit, bIsUpgrade)
	if bIsUpgrade then
		local pNewPlayer = Players[iNewPlayer]
		local pOldUnit = pNewPlayer:GetUnitByID(iOldUnit)
		local pNewUnit = pNewPlayer:GetUnitByID(iNewUnit)
		
		if pOldUnit:IsHasPromotion(ePromotionYerba) then
			local eNewUnitClass = pNewUnit:GetUnitClassType()
			
			for _, class in ipairs(tArcheryUnits) do
				if class == eNewUnitClass then
					pNewUnit:SetHasPromotion(ePromotionYerba, true)
					break
				end
			end
		end
	end
end
GameEvents.UnitConverted.Add(OnUpgradeTakeOutFletcher)
--GameEvents.UnitUpgraded.Add(OnUpgradeTakeOutFletcher)

function OnCityTrainTakeOutFletcher(iPlayer, iCity, iUnit, bGold, bFaith)
    local pPlayer = Players[iPlayer]
    local pCity = pPlayer:GetCityByID(iCity)
    local pUnit = pPlayer:GetUnitByID(iUnit)
    
    if pCity:IsHasBuilding(eBuildingFletcher) then
        local eUnitClass = pUnit:GetUnitClassType()
		
		for _, class in ipairs(tArcheryUnits) do
            if class == eUnitClass then
			    pUnit:SetHasPromotion(ePromotionYerba, true)
			    break
			end
		end
    end
end
GameEvents.CityTrained.Add(OnCityTrainTakeOutFletcher)



-- code for promotion - kill chance
--[[function OnCombatInstaKill(iAttackingPlayer, iAttackingUnit, iAttackerDamage, iAttackerFinalDamage, iAttackerMaxHP, iDefendingPlayer, iDefendingUnit, iDefenderDamage, iDefenderFinalDamage, iDefenderMaxHP, iInterceptingPlayer, iInterceptingUnit, iInterceptorDamage, iPlotX, iPlotY)
	local pAttackingPlayer = Players[iAttackingPlayer]
	
	if not (pAttackingPlayer and (iDefenderFinalDamage < iDefenderMaxHP)) then return end
	
	local pAttackingUnit = pAttackingPlayer:GetUnitByID(iAttackingUnit)
	
	if pAttackingUnit ~= nil and pAttackingUnit:IsHasPromotion(ePromotionYerba) then
		local iChanceToKill = Game.Rand(100, "Chance to kill") + 1
		
		if iChanceToKill <= 5 then
			local pDefendingPlayer = Players[iDefendingPlayer]
			local pDefendingUnit = pDefendingPlayer:GetUnitByID(iDefendingUnit)
			local eDefendingUnitType = pDefendingUnit:GetUnitType()

			pDefendingUnit:Kill(false, iAttackingPlayer)
			
			if pAttackingPlayer:IsHuman() and pAttackingPlayer:IsTurnActive() then
				pAttackingPlayer:AddNotification(NotificationTypes.NOTIFICATION_UNIT_DIED, 
					'Enemy unit was poisoned with your arrow and died in pain!', 
					'Poisoned Enemy', 
					pAttackingUnit:GetX(), pAttackingUnit:GetY(), eDefendingUnitType)
			end

			if pDefendingPlayer:IsHuman() then
				pDefendingPlayer:AddNotification(NotificationTypes.NOTIFICATION_UNIT_DIED, 
					'Poisoned arrow hit your unit causing letal infection! Unfortunately, it died horribly!', 
					'Your unit was poisoned!', 
					pAttackingUnit:GetX(), pAttackingUnit:GetY(), eDefendingUnitType)
			end
		end
	end
end
GameEvents.CombatEnded.Add(OnCombatInstaKill)--]]
