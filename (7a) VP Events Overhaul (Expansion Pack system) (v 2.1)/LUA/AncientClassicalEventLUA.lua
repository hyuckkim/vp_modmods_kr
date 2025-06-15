function LostLuxuries(iPlayer, iChoice)
	if iChoice == GameInfoTypes.PLAYER_EVENT_LOSTLUXURIES_CHOICE_1 then
		for pUnit in Players[iPlayer]:Units() do
			if pUnit:GetUnitClassType() == GameInfoTypes.UNITCLASS_SCOUT then
				pUnit:ChangeExperience(20)
			end
		end
	end
end

GameEvents.EventChoiceActivated.Add(LostLuxuries)
