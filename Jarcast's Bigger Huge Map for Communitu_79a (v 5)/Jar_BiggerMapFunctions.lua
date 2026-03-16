-- Jar_BiggerMapFunctions
-- Author: Jarcast
-- DateCreated: 6/12/2023 12:33:49 PM
--------------------------------------------------------------
function Jar_IsCivilisationActive(civilisationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilisationID then
				return true
			end
		end
	end

	return false
end
-------------------------------------------------------------------------------------------------------------------------
local iCivPapalStates = GameInfoTypes.CIVILIZATION_JFD_PAPAL_STATES
local iCivRome = GameInfoTypes.CIVILIZATION_ROME

function Jar_RomePapalStatesCapitalChange(iPlayer, iCityX, iCityY)
	local pPlayer = Players[iPlayer]
	local pPlot = Map.GetPlot(iCityX, iCityY)
	local pCity = pPlot:GetPlotCity()
	if not pPlayer:IsAlive() then return end
	if pPlayer:GetCivilizationType() == iCivPapalStates and pCity:IsCapital() then
		pCity:SetName('Vatican City', true)
	end
end
if Jar_IsCivilisationActive(iCivRome) and Jar_IsCivilisationActive(iCivPapalStates) then
	GameEvents.PlayerCityFounded.Add(Jar_RomePapalStatesCapitalChange)
end
--==========================================================================================================================
--==========================================================================================================================