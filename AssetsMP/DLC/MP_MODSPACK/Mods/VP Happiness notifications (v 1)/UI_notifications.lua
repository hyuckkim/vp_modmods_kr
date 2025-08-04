-- UI_notifications
-- Author: Glider
-- DateCreated: 9/27/2018 1:25:56 PM
--------------------------------------------------------------

gCityHappyValues = {};

function UI_HappinessReport()
	local pPlayer = Players[Game.GetActivePlayer()];
	local pCity = nil;
	if (pPlayer ~= nil and not pPlayer:IsMinorCiv() and not pPlayer:IsBarbarian() and pPlayer:IsHuman()) then
		local sTitle = "행복도 보고";
		local sReport = "";
		local threshold = 1;
		local bChange = false;
		for pCity in pPlayer:Cities() do
			if (pCity ~= nil and gCityHappyValues[pCity:GetID()] ~= nil) then
				local sName = pCity:GetName() .. "[NEWLINE]";
				sName = sName .. "----------" .. "[NEWLINE]";
				local sSubject = "";
				local bLocalChange = false;
				--도시 낙후
				iDiff = gCityHappyValues[pCity:GetID()]["GetUnhappinessFromStarving"] - pCity:GetUnhappinessFromStarving();
				if (iDiff >= threshold) then
					bChange = true;
					bLocalChange = true;
					sSubject = sSubject .. "[COLOR_POSITIVE_TEXT]" .. " 낙후 개선: " .. iDiff .. "[ENDCOLOR][NEWLINE]";
				elseif (iDiff <= -threshold) then
					bChange = true;
					bLocalChange = true;
					sSubject = sSubject .. "[COLOR_WARNING_TEXT]" .. " 낙후 약화 " .. -iDiff .. "[ENDCOLOR][NEWLINE]";
				end		
				--약탈			
				iDiff = gCityHappyValues[pCity:GetID()]["GetUnhappinessFromPillaged"] - pCity:GetUnhappinessFromPillaged();
				if (iDiff >= threshold) then
					bChange = true;
					bLocalChange = true;
					sSubject = sSubject .. "[COLOR_POSITIVE_TEXT]" .. " 약탈 개선: " .. iDiff .. "[ENDCOLOR][NEWLINE]";
				elseif (iDiff <= -threshold) then
					bChange = true;
					bLocalChange = true;
					sSubject = sSubject .. "[COLOR_WARNING_TEXT]" .. " 약탈 악화: " .. -iDiff .. "[ENDCOLOR][NEWLINE]";
				end	
				--빈곤	
				iDiff = gCityHappyValues[pCity:GetID()]["GetUnhappinessFromGold"] - pCity:GetUnhappinessFromGold();
				if (iDiff >= threshold) then
					bChange = true;
					bLocalChange = true;
					sSubject = sSubject .. "[COLOR_POSITIVE_TEXT]" .. " 빈곤 개선: " .. iDiff .. "[ENDCOLOR][NEWLINE]";
				elseif (iDiff <= -threshold) then
					bChange = true;
					bLocalChange = true;
					sSubject = sSubject .. "[COLOR_WARNING_TEXT]" .. " 빈곤 악화: " .. -iDiff .. "[ENDCOLOR][NEWLINE]";
				end		
				--전쟁 피로
				iDiff = gCityHappyValues[pCity:GetID()]["GetUnhappinessFromDefense"] - pCity:GetUnhappinessFromDefense();
				if (iDiff >= threshold) then
					bChange = true;
					bLocalChange = true;
					sSubject = sSubject .. "[COLOR_POSITIVE_TEXT]" .. " 전쟁 피로 개선: " .. iDiff .. "[ENDCOLOR][NEWLINE]";
				elseif (iDiff <= -threshold) then
					bChange = true;
					bLocalChange = true;
					sSubject = sSubject .. "[COLOR_WARNING_TEXT]" .. " 전쟁 피로 악화: " .. -iDiff .. "[ENDCOLOR][NEWLINE]";
				end		
				--도시 연결(고립)
				iDiff = gCityHappyValues[pCity:GetID()]["GetUnhappinessFromConnection"] - pCity:GetUnhappinessFromConnection();
				if (iDiff >= threshold) then
					bChange = true;
					bLocalChange = true;
					sSubject = sSubject .. "[COLOR_POSITIVE_TEXT]" .. " 도시 연결 개선: " .. iDiff .. "[ENDCOLOR][NEWLINE]";
				elseif (iDiff <= -threshold) then
					bChange = true;
					bLocalChange = true;
					sSubject = sSubject .. "[COLOR_WARNING_TEXT]" .. " 도시 연결 악화: " .. -iDiff .. "[ENDCOLOR][NEWLINE]";
				end		
				--종교적 소수자
				iDiff = gCityHappyValues[pCity:GetID()]["GetUnhappinessFromMinority"] - pCity:GetUnhappinessFromMinority();
				if (iDiff >= threshold) then
					bChange = true;
					bLocalChange = true;
					sSubject = sSubject .. "[COLOR_POSITIVE_TEXT]" .. " 종교 분쟁 개선: " .. iDiff .. "[ENDCOLOR][NEWLINE]";
				elseif (iDiff <= -threshold) then
					bChange = true;
					bLocalChange = true;
					sSubject = sSubject .. "[COLOR_WARNING_TEXT]" .. " 종교 분쟁 악화: " .. -iDiff .. "[ENDCOLOR][NEWLINE]";
				end		
				--문맹
				iDiff = gCityHappyValues[pCity:GetID()]["GetUnhappinessFromScience"] - pCity:GetUnhappinessFromScience();
				if (iDiff >= threshold) then
					bChange = true;
					bLocalChange = true;
					sSubject = sSubject .. "[COLOR_POSITIVE_TEXT]" .. " 문맹 개선: " .. iDiff .. "[ENDCOLOR][NEWLINE]";
				elseif (iDiff <= -threshold) then
					bChange = true;
					bLocalChange = true;
					sSubject = sSubject .. "[COLOR_WARNING_TEXT]" .. " 문맹 악화: " .. -iDiff .. "[ENDCOLOR][NEWLINE]";
				end		
				--무료
				iDiff = gCityHappyValues[pCity:GetID()]["GetUnhappinessFromCulture"] - pCity:GetUnhappinessFromCulture();
				if (iDiff >= threshold) then
					bChange = true;
					bLocalChange = true;
					sSubject = sSubject .. "[COLOR_POSITIVE_TEXT]" .. " 무료 개선: " .. iDiff .. "[ENDCOLOR][NEWLINE]";
				elseif (iDiff <= -threshold) then
					bChange = true;
					bLocalChange = true;
					sSubject = sSubject .. "[COLOR_WARNING_TEXT]" .. " 무료 악화: " .. -iDiff .. "[ENDCOLOR][NEWLINE]";
				end
				local iResistanceUnhappiness = 0;
				local iOccupationUnhappiness = 0;
				local iPuppetUnhappiness = 0;
				if(pCity:IsRazing()) then
					iResistanceUnhappiness = (pCity:GetPopulation() / 2);
				elseif(pCity:IsResistance()) then
					iResistanceUnhappiness = (pCity:GetPopulation() / 2);
				elseif(pCity:IsPuppet()) then
					iPuppetUnhappiness = (pCity:GetPopulation() / GameDefines.BALANCE_HAPPINESS_PUPPET_THRESHOLD_MOD);
				elseif(pCity:IsOccupied() and not pCity:IsNoOccupiedUnhappiness() and not pCity:IsResistance()) then
					iOccupationUnhappiness = (pCity:GetPopulation() * GameDefines.UNHAPPINESS_PER_OCCUPIED_POPULATION);
				end
				--iResistanceUnhappiness
				iDiff = gCityHappyValues[pCity:GetID()]["iResistanceUnhappiness"] - iResistanceUnhappiness;
				if (iDiff >= threshold) then
					bChange = true;
					bLocalChange = true;
					sSubject = sSubject .. "[COLOR_POSITIVE_TEXT]" .. " 저항 개선: " .. iDiff .. "[ENDCOLOR][NEWLINE]";
				elseif (iDiff <= -threshold) then
					bChange = true;
					bLocalChange = true;
					sSubject = sSubject .. "[COLOR_WARNING_TEXT]" .. " 저항 악화: " .. -iDiff .. "[ENDCOLOR][NEWLINE]";
				end
				--iOccupationUnhappiness
				iDiff = gCityHappyValues[pCity:GetID()]["iOccupationUnhappiness"] - iOccupationUnhappiness;
				if (iDiff >= threshold) then
					bChange = true;
					bLocalChange = true;
					sSubject = sSubject .. "[COLOR_POSITIVE_TEXT]" .. " 점령 개선: " .. iDiff .. "[ENDCOLOR][NEWLINE]";
				elseif (iDiff <= -threshold) then
					bChange = true;
					bLocalChange = true;
					sSubject = sSubject .. "[COLOR_WARNING_TEXT]" .. " 점령 악화: " .. -iDiff .. "[ENDCOLOR][NEWLINE]";
				end
				--iPuppetUnhappiness
				iDiff = gCityHappyValues[pCity:GetID()]["iPuppetUnhappiness"] - iPuppetUnhappiness;
				if (iDiff >= threshold) then
					bChange = true;
					bLocalChange = true;
					sSubject = sSubject .. "[COLOR_POSITIVE_TEXT]" .. " 괴뢰 개선: " .. iDiff .. "[ENDCOLOR][NEWLINE]";
				elseif (iDiff <= -threshold) then
					bChange = true;
					bLocalChange = true;
					sSubject = sSubject .. "[COLOR_WARNING_TEXT]" .. " 괴뢰 악화: " .. -iDiff .. "[ENDCOLOR][NEWLINE]";
				end
				--build report text
				if (bLocalChange) then
					sReport = sReport .. sName .. sSubject;
				end
			end
		end
		-- update new values
		if (pPlayer ~= nil and not pPlayer:IsMinorCiv() and not pPlayer:IsBarbarian() and pPlayer:IsHuman()) then
			for pCity in pPlayer:Cities() do
				if (pCity ~= nil) then
					gCityHappyValues[pCity:GetID()] = {};
					gCityHappyValues[pCity:GetID()]["GetUnhappinessFromStarving"] = pCity:GetUnhappinessFromStarving();
					gCityHappyValues[pCity:GetID()]["GetUnhappinessFromPillaged"] = pCity:GetUnhappinessFromPillaged();
					gCityHappyValues[pCity:GetID()]["GetUnhappinessFromGold"] = pCity:GetUnhappinessFromGold();
					gCityHappyValues[pCity:GetID()]["GetUnhappinessFromDefense"] = pCity:GetUnhappinessFromDefense();
					gCityHappyValues[pCity:GetID()]["GetUnhappinessFromConnection"] = pCity:GetUnhappinessFromConnection();
					gCityHappyValues[pCity:GetID()]["GetUnhappinessFromMinority"] = pCity:GetUnhappinessFromMinority();
					gCityHappyValues[pCity:GetID()]["GetUnhappinessFromScience"] = pCity:GetUnhappinessFromScience();
					gCityHappyValues[pCity:GetID()]["GetUnhappinessFromCulture"] = pCity:GetUnhappinessFromCulture();
					local iResistanceUnhappiness = 0;
					local iOccupationUnhappiness = 0;
					local iPuppetUnhappiness = 0;
					if(pCity:IsRazing()) then
						iResistanceUnhappiness = (pCity:GetPopulation() / 2);
					elseif(pCity:IsResistance()) then
						iResistanceUnhappiness = (pCity:GetPopulation() / 2);
					elseif(pCity:IsPuppet()) then
						iPuppetUnhappiness = (pCity:GetPopulation() / GameDefines.BALANCE_HAPPINESS_PUPPET_THRESHOLD_MOD);
					elseif(pCity:IsOccupied() and not pCity:IsNoOccupiedUnhappiness() and not pCity:IsResistance()) then
						iOccupationUnhappiness = (pCity:GetPopulation() * GameDefines.UNHAPPINESS_PER_OCCUPIED_POPULATION);
					end
					gCityHappyValues[pCity:GetID()]["iResistanceUnhappiness"] = iResistanceUnhappiness;
					gCityHappyValues[pCity:GetID()]["iOccupationUnhappiness"] = iOccupationUnhappiness;
					gCityHappyValues[pCity:GetID()]["iPuppetUnhappiness"] = iPuppetUnhappiness;
				end
			end
		end
		-- report to UI
		if (bChange) then
			pCity = pPlayer:GetCapitalCity();
			if (pCity ~= nil) then
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, sReport, sTitle, pCity:GetX(), pCity:GetY());
			end
		end
	end
end
Events.SerialEventGameDataDirty.Add( UI_HappinessReport );
Events.SerialEventTurnTimerDirty.Add( UI_HappinessReport );
Events.SerialEventImprovementCreated.Add( UI_HappinessReport );
Events.SerialEventExitCityScreen.Add( UI_HappinessReport );
Events.ActivePlayerTurnStart.Add( UI_HappinessReport );