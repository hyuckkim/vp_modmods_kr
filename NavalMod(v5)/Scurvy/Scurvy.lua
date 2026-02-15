print("Loading Scurvy.lua from Naval mod");


local iPromotionSID = GameInfoTypes["PROMOTION_SCURVY_IMMUNITY"]

function RemoveScurvy(iTeam, iTech)
    if iTech == GameInfoTypes.TECH_STEAM_POWER then
        for iPlayer = 0, GameDefines.MAX_CIV_PLAYERS - 1 do
            local player = Players[iPlayer]
            if player and player:GetTeam() == iTeam then
                if player:IsMinorCiv() or player:IsBarbarian() then
                    player:ChangeFreePromotionCount(iPromotionSID, 1)
                end
            end
        end
    end
end

GameEvents.TeamTechResearched.Add(RemoveScurvy)
-------------------------------------------------------------------------------
local ePromotionMinenwerfer = GameInfoTypes.PROMOTION_BOMBSIGHT

local tDefenseImprovements = {}
for improvement in GameInfo.Improvements() do
    if improvement.DefenseModifier > 0 then
        tDefenseImprovements[improvement.ID] = true
    end
end

function KruppGunAttack(iAttackingPlayer, iAttackingUnit, attackerDamage, attackerFinalDamage, attackerMaxHP, iDefendingPlayer, iDefendingUnit, defenderDamage, defenderFinalDamage, defenderMaxHP)
    local pAttackingPlayer = Players[iAttackingPlayer]
    local pDefendingPlayer = Players[iDefendingPlayer]
    if not pAttackingPlayer or not pDefendingPlayer then return end

    local pAttackingUnit = pAttackingPlayer:GetUnitByID(iAttackingUnit)
    if not pAttackingUnit or not pAttackingUnit:IsHasPromotion(ePromotionMinenwerfer) then return end

    local pDefendingUnit = pDefendingPlayer:GetUnitByID(iDefendingUnit)
    if not pDefendingUnit then return end

    if defenderFinalDamage >= defenderMaxHP then
        local iX, iY = pDefendingUnit:GetX(), pDefendingUnit:GetY()
        local pPlot = Map.GetPlot(iX, iY)
        if pPlot and pAttackingPlayer:IsAtWarWith(pPlot:GetOwner()) then
            local iImprovement = pPlot:GetImprovementType()
            if iImprovement and not pPlot:IsImprovementPillaged() and tDefenseImprovements[iImprovement] then
                pPlot:SetImprovementPillaged(true)
                if pAttackingPlayer:IsHuman() or pDefendingPlayer:IsHuman() then
                    Events.AudioPlay2DSound("AS2D_INTERFACE_PILLAGE")
                end
            end
        end
    end
end
GameEvents.CombatResult.Add(KruppGunAttack)

print("Finished loading Scurvy.lua from Naval mod");