local iMainEvent = GameInfoTypes.EVENT_CIV_UE
cive = {}
for row in GameInfo.CivilizationEvents() do 
	cive[row.FileName] = row.FileName 
end

function CompatibilityCiv (iPlayer, iEvent)
local iCivilization = GameInfo.Civilizations[Players[iPlayer]:GetCivilizationType()].Type
	if iEvent == iMainEvent and iCivilization == cive[iCivilization]  then
		return false
	end
	return true
end
GameEvents.EventCanTake.Add(CompatibilityCiv)