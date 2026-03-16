-- Patagonia
-- Author: Hokath
-- DateCreated: 11/02/2025 20:08:03 PM
--------------------------------------------------------------
local iXon = GameInfoTypes["UNIT_CD_XON"];
local iXonEvent = GameInfoTypes.EVENT_XON;
local iJumbe = GameInfoTypes["UNIT_CD_JUMBE"];
local iJumbeEvent = GameInfoTypes.EVENT_JUMBE;
local iDjeli = GameInfoTypes["UNIT_CD_DJELI"];
local iDjeliChoice = GameInfoTypes.EVENT_DJELI_CHOICE;
local iDjeliEvent = GameInfoTypes.EVENT_DJELI;

function CDGPFires(iPlayer, iUnit, iUnitType, iPlotX, iPlotY)
	if iUnitType == iXon then 
		local pPlayer = Players[iPlayer];
		pPlayer:DoStartEvent(iXonEvent)
	elseif iUnitType == iJumbe then 
		local pPlayer = Players[iPlayer];
		pPlayer:DoStartEvent(iJumbeEvent)
	elseif iUnitType == iDjeli then
		local pPlayer = Players[iPlayer];
		if pPlayer:IsEventChoiceActive(iDjeliChoice) then
			pPlayer:DoEventChoice(iDjeliChoice)
			if pPlayer:IsHuman() then 	
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, "Your Djéli has extended the duration of your active bonuses!", "Bardic Inspiration")
			end
		else
			pPlayer:DoStartEvent(iDjeliEvent)
		end
	end
end

GameEvents.GreatPersonExpended.Add(CDGPFires)
