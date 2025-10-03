-- Alti Cur
-- Author: 
-- DateCreated: 
--------------------------------------------------------------
local eBuildingAltiCur = GameInfoTypes.BUILDING_HUNS_ALTI_CUR
local eCivilizationHuns = GameInfoTypes.CIVILIZATION_HUNS
local eBuildingDummyForAltiCur = GameInfoTypes.BUILDING_D_FOR_SACHEM_7
--local fGameSpeedModifier = GameInfo.GameSpeeds[ Game.GetGameSpeedType() ].GoldPercent / 100
--local eAltiCurEvent = GameInfoTypes.PLAYER_EVENT_CHOICE_ALTI_CUR_HAPPINESS

function OnTurnHunsBullyWarCheck(iPlayer)
    local pPlayer = Players[iPlayer]
    
    if not (pPlayer and pPlayer:GetCivilizationType() == eCivilizationHuns) then return end
    if (pPlayer:CountNumBuildings(eBuildingAltiCur) == 0) then return end
    
    --defines
    local pCapital = pPlayer:GetCapitalCity()
    local iBullyCounter = 0
    local iHappinessCounter = 0
    local pTeam = Teams[pPlayer:GetTeam()]
    
    -- adds gold For every CS that you can bully	
    for player in pairs(Players) do
        local MinorPlayer = Players[player]
        if (MinorPlayer and MinorPlayer:IsMinorCiv()) then 
            if MinorPlayer:CanMajorBullyGold(pPlayer) then
                iBullyCounter = iBullyCounter + 1
            end
        end
    end
    pCapital:SetNumRealBuilding(GameInfoTypes.BUILDING_D_FOR_ALTICUR, iBullyCounter)

    -- increase global happiness and supply for each war you are in
    for teamID, otherTeam in pairs(Teams) do
        if otherTeam:IsAlive() and teamID ~= pPlayer:GetTeam() then
            -- Check if this is a major civ team (has at least one major civ player)
            local isMajorTeam = false
            for otherPlayerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
                local otherPlayer = Players[otherPlayerID]
                if otherPlayer and otherPlayer:IsAlive() and otherPlayer:GetTeam() == teamID and not otherPlayer:IsMinorCiv() then
                    isMajorTeam = true
                    break
                end
            end
            
            if isMajorTeam and pTeam:IsAtWar(teamID) then
                iHappinessCounter = iHappinessCounter + 1
            end
        end
    end
    pCapital:SetNumRealBuilding(eBuildingDummyForAltiCur, iHappinessCounter)
end 

if Game.IsCivEverActive(eCivilizationHuns) then
    GameEvents.PlayerDoTurn.Add(OnTurnHunsBullyWarCheck)
end

