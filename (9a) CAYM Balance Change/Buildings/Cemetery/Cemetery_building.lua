include("[CAYM] Cemetary.lua")

-- CemeteryCeremony (Faith only, Dummy stacks only for Great Persons)
function CemeteryCeremony(playerID, UnitID, iUnitType, plotX, plotY, isDelay)
	
	local pPlayer = Players[playerID]
	if (isDelay) then return end
	if not pPlayer then return end

	local pUnit = pPlayer:GetUnitByID(UnitID)
	if not pUnit then return end

	-- 무역 유닛 제외
	if pUnit:GetUnitClassType() == unitClassCargoShipID or pUnit:GetUnitClassType() == unitClassCaravanID then
		return
	end

	-- 위인 여부 판정
	local GPDead = false
	local uClass = pUnit:GetUnitClassType()
	if  uClass == unitClassAdmiralID or uClass == unitClassArtistID or uClass == unitClassDiplomatID
	or uClass == unitClassEngineerID or uClass == unitClassGeneralID or uClass == unitClassMerchantID
	or uClass == unitClassMusicianID or uClass == unitClassProphetID or uClass == unitClassScientistID
	or uClass == unitClassWriterID then
		GPDead = true
	end

	-- 게임 속도/시대 스케일 (Faith만 사용)
	local gameSpeedFaith = GameInfo.GameSpeeds[Game.GetGameSpeedType()].FaithPercent / 100
	local iEraModifier   = math.max(pPlayer:GetCurrentEra(), 1)
	local GainFaith      = math.floor(gameSpeedFaith * iEraModifier)

	local pUnitPlot = Map.GetPlot(plotX, plotY)
	local pOwnerPlayer = Players[pUnit:GetOwner()]
	if pOwnerPlayer ~= pPlayer then return end

	local pCity = KilledNearestCity(pUnitPlot, pPlayer)
	if pCity and pCity:IsHasBuilding(GameInfoTypes["BUILDING_CEMETERY"]) then
		local iX, iY = pCity:GetX(), pCity:GetY()

		-- 공통: 신앙 지급
		pPlayer:ChangeFaith(GainFaith)

		-- 위인 사망 시에만 더미 스택 +1 (더미는 너가 Faith 주도록 설정)
		if GPDead then
			local iNumberOfCemeteryD = pCity:GetNumRealBuilding(GameInfoTypes["BUILDING_CEMETERY_DUMMY"])
			pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_CEMETERY_DUMMY"], iNumberOfCemeteryD + 1)
		end

		-- 팝업/알림(문화 관련 문구/아이콘은 제거, Faith만 표시)
		if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
			Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iX, iY))), "[COLOR_WHITE]+".. GainFaith .." [ICON_PEACE][ENDCOLOR]", 1)

			if GPDead then
				local sCityName = pCity:GetName()
				pPlayer:AddNotification(
					NotificationTypes.NOTIFICATION_INSTANT_YIELD,
					'Funerals of a [ICON_GREAT_PEOPLE] personality:[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]'.. sCityName ..': [ENDCOLOR]+1 [ICON_PEACE] Faith [COLOR_POSITIVE_TEXT]permanently[ENDCOLOR] in '.. sCityName,
					'Permanent City Bonus',
					iX, iY, pCity:GetID()
				)
			end
		end
	end
end

print("Cemetery building is in game")