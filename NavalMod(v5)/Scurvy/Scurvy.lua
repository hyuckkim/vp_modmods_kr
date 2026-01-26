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


print("Finished loading Scurvy.lua from Naval mod");