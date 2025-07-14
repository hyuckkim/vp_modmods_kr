function WhenIWasABoy(iPlayer, iCityID, iChoice)
	if iChoice == GameInfoTypes.CITY_EVENT_FIREFIRE_CHOICE_1 then
		if Players[iPlayer]:GetCityByID(iCityID):IsCityEventChoiceValid(GameInfoTypes.CITY_EVENT_FIREFIRE_CHOICE_3) or Players[iPlayer]:GetCityByID(iCityID):IsCityEventChoiceValid(GameInfoTypes.CITY_EVENT_FIREFIRE_CHOICE_4) then
			return false
		end
	elseif iChoice == GameInfoTypes.CITY_EVENT_FIREFIRE_CHOICE_2 then
		if Players[iPlayer]:GetCityByID(iCityID):IsCityEventChoiceValid(GameInfoTypes.CITY_EVENT_FIREFIRE_CHOICE_3) or Players[iPlayer]:GetCityByID(iCityID):IsCityEventChoiceValid(GameInfoTypes.CITY_EVENT_FIREFIRE_CHOICE_4) then
			return false
		end
	else return true
	end
end

function IHadADream(iPlayer, iChoice)
	if iChoice == GameInfoTypes.PLAYER_EVENT_LOSTLUXURIES_CHOICE_1 then
		for pUnit in Players[iPlayer]:Units() do
			if pUnit:GetUnitClassType() == GameInfoTypes.UNITCLASS_SCOUT then
				pUnit:ChangeExperience(10)
			end
		end
	end
end

--[[bArabiaExist = false
if Game.IsCivEverActive(GameInfoTypes.CIVILIZATION_ARABIA) then bArabiaExist = false end
local iBazaar = GameInfoTypes.CITY_EVENT_BAZAAR
local iBazaarChoice = GameInfoTypes.CITY_EVENT_BAZAAR_CHOICE_1
local iBuildingBazaar = GameInfoTypes.BUILDING_BAZAAR

function IdLikeToBe(iPlayer, iCityID, iEvent)
	if iEvent == iBazaar then
		if bArabiaExist == true then
			return false
		end
	end
	return true
end

function AllAboutTheThings(iPlayer, iCityID, iChoice)
	local newcity = Players[iPlayer]:GetCityByID(iCityID)
	if iChoice == iBazaarChoice then
		newcity:SetNumRealBuilding(iBuildingBazaar, 1)
	end
end]]

GameEvents.CityEventChoiceCanTake.Add(WhenIWasABoy)
GameEvents.EventChoiceActivated.Add(IHadADream)
--GameEvents.CityEventChoiceActivated.Add(AllAboutTheThings)
--GameEvents.CityEventCanTake.Add(IdLikeToBe)