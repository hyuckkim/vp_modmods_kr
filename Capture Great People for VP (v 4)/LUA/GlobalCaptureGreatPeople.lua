local iClassScientist = GameInfoTypes.UNITCLASS_SCIENTIST
local iClassEngineer = GameInfoTypes.UNITCLASS_ENGINEER
local iClassMerchant = GameInfoTypes.UNITCLASS_MERCHANT
local iClassGeneral = GameInfoTypes.UNITCLASS_GREAT_GENERAL
local iClassAdmiral = GameInfoTypes.UNITCLASS_GREAT_ADMIRAL
local iClassArtist = GameInfoTypes.UNITCLASS_ARTIST
local iClassMusician = GameInfoTypes.UNITCLASS_MUSICIAN
local iClassWriter = GameInfoTypes.UNITCLASS_WRITER
local iClassProphet = GameInfoTypes.UNITCLASS_PROPHET
local iClassDiplomat = GameInfoTypes.UNITCLASS_GREAT_DIPLOMAT
local iClassSSStasisChamber = GameInfoTypes.UNITCLASS_SS_STASIS_CHAMBER
local iClassSSEngine = GameInfoTypes.UNITCLASS_SS_ENGINE
local iClassSSCockpit = GameInfoTypes.UNITCLASS_SS_COCKPIT
local iClassSSBooster = GameInfoTypes.UNITCLASS_SS_BOOSTER

local g_NotificationType = NotificationTypes.NOTIFICATION_GENERIC

function randomAmount(iMaxAmount)
  local iRand1 = Game.Rand(21, "Rand1") + 20 -- 20 to 40
  local iRand2 = Game.Rand(21, "Rand2") + 20 -- 20 to 40
  
  return math.floor((math.floor((iMaxAmount * (iRand1 + iRand2)) / 100) + 5) / 10) * 10
end

function OnUnitCaptured(iByPlayer, iByUnit, iCapturedPlayer, iCapturedUnit, bWillBeKilled, iReason)
	local pGpUnit = Players[iCapturedPlayer]:GetUnitByID(iCapturedUnit)
	local iClass = pGpUnit:GetUnitClassType()
	local pByPlayer = Players[iByPlayer]
	local pByUnit = pByPlayer:GetUnitByID(iByUnit)
	local sGpDescription = GameInfo.UnitClasses[iClass].Description
	local iExtra1 = (GameInfoTypes[GameInfo.UnitClasses[iClass].DefaultUnit] * 100 + iCapturedPlayer) * 100 + iByPlayer
	print("The function UnitCaptured is called. ", Locale.ConvertTextKey(sGpDescription), iByPlayer, iByUnit, iCapturedPlayer, iCapturedUnit, bWillBeKilled, iReason)
	
	if (not pGpUnit:IsGreatPerson()) then
		if (bWillBeKilled and (iClass == iClassSSBooster or iClass == iClassSSCockpit or iClass == iClassSSEngine or iClass == iClassSSStasisChamber)) then
			-- SS Parts give about 22% - 44% of the Science cost of the Tech currently being researched by the capturing player
			local eCurrentTech = pByPlayer:GetCurrentResearch()        
			local iBoost = randomAmount(math.floor(pByPlayer:GetResearchCost(eCurrentTech) / 2))
			pByPlayer:ChangeOverflowResearch(iBoost)
        
			if (pByPlayer:IsHuman()) then
				local sHeading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATIONS_CAPTURE_GP_HEADING", sGpDescription, pByUnit:GetName())
				local sMessage = Locale.ConvertTextKey("TXT_KEY_NOTIFICATIONS_CAPTURE_GP_TEXT_BOOST", sGpDescription, pByUnit:GetName(), "[ICON_RESEARCH]", iBoost)
				pByPlayer:AddNotification(g_NotificationType, sMessage, sHeading, pGpUnit:GetX(), pGpUnit:GetY(), iExtra1, iByUnit)
			end
		end
		if iClass == GameInfoTypes.UNITCLASS_PIONEER then
			pByPlayer:GetCapitalCity():ChangePopulation(1, true)
			
			if (pByPlayer:IsHuman()) then
				local sHeading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATIONS_CAPTURE_GP_HEADING", sGpDescription, pByUnit:GetName())
				local sMessage = Locale.ConvertTextKey("TXT_KEY_NOTIFICATIONS_CAPTURE_GP_TEXT_PIONEER", sGpDescription, pByUnit:GetName(), pByPlayer:GetCapitalCity():GetName())
				pByPlayer:AddNotification(g_NotificationType, sMessage, sHeading, pGpUnit:GetX(), pGpUnit:GetY(), iExtra1, iByUnit)
			end
		end
		if iClass == GameInfoTypes.UNITCLASS_COLONIST then
			pByPlayer:GetCapitalCity():ChangePopulation(1, true)
			local pCity = Neirai_GetNearestCity(pByPlayer, pGpUnit:GetPlot())
			pCity:ChangePopulation(1, true)
			
			if (pByPlayer:IsHuman()) then
				local sHeading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATIONS_CAPTURE_GP_HEADING", sGpDescription, pByUnit:GetName())
				local sMessage = Locale.ConvertTextKey("TXT_KEY_NOTIFICATIONS_CAPTURE_GP_TEXT_PIONEER", sGpDescription, pByUnit:GetName(), pByPlayer:GetCapitalCity():GetName())
				sMessage = sMessage .. "[NEWLINE]" .. pCity:GetName() .. ": +1 [ICON_CITIZEN]."
				pByPlayer:AddNotification(g_NotificationType, sMessage, sHeading, pGpUnit:GetX(), pGpUnit:GetY(), iExtra1, iByUnit)
			end
		end
	else		
		if (iClass == iClassGeneral or iClass == iClassAdmiral) then
			pByUnit:SetHasPromotion(GameInfoTypes.PROMOTION_HEROES, true)
		
			local bonus = 1/3
			if iClass == iClassGeneral then pByPlayer:ChangeCombatExperience(pByPlayer:GreatGeneralThreshold() *bonus)
			else pByPlayer:ChangeNavalCombatExperience(pByPlayer:GreatAdmiralThreshold() *bonus)
			end
		
			if (pByPlayer:IsHuman()) then
				local sHeading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATIONS_CAPTURE_GP_HEADING", sGpDescription, pByUnit:GetName())
				local sMessage = Locale.ConvertTextKey("TXT_KEY_NOTIFICATIONS_CAPTURE_GP_TEXT_PROMOTION", sGpDescription, pByUnit:GetName())
			
				if iClass == iClassGeneral then sMessage = sMessage .. ". +" .. pByPlayer:GreatGeneralThreshold() *bonus .. "[ICON_GREAT_GENERAL] Great General Points."
				else sMessage = sMessage .. ". +" .. pByPlayer:GreatAdmiralThreshold() *bonus .. " [ICON_GREAT_ADMIRAL] Great Admiral Points."
				end
				pByPlayer:AddNotification(g_NotificationType, sMessage, sHeading, pGpUnit:GetX(), pGpUnit:GetY(), iExtra1, iByUnit)
			end
		else
			if not bWillBeKilled then
				if (pByPlayer:IsHuman()) then
					local sHeading = Locale.ConvertTextKey("TXT_KEY_NOTIFICATIONS_CAPTURE_GP_HEADING", sGpDescription, pByUnit:GetName())
					local sMessage = Locale.ConvertTextKey("TXT_KEY_NOTIFICATIONS_CAPTURE_GP_TEXT_UNIT", sGpDescription, pByUnit:GetName())
					pByPlayer:AddNotification(g_NotificationType, sMessage, sHeading, pGpUnit:GetX(), pGpUnit:GetY(), iExtra1, iByUnit)
				end
			end
		end
	end
end
GameEvents.UnitCaptured.Add(OnUnitCaptured)


function OnCaptureGPNotificationId(id)
  print(string.format("Setting capture Great People notification id to %i", id))
  g_NotificationType = id
end
LuaEvents.CaptureGPNotificationId.Add(OnCaptureGPNotificationId)

LuaEvents.CaptureGPNotificationIdRequest()

function Jar_RemovePrisonerPromo(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:GetNumUnitPromotions(GameInfoTypes.PROMOTION_PRISONERS_OF_WAR) <1 then return end
	for pUnit in pPlayer:Units() do
		if pUnit:IsGreatPerson() and pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_PRISONERS_OF_WAR) then
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_PRISONERS_OF_WAR, false)
		end
	end
end
GameEvents.PlayerDoTurn.Add(Jar_RemovePrisonerPromo)

function Neirai_GetNearestCity(pPlayer, pPlot)
    local distance = 9999
    local cNearestCity = nil
    for cCity in pPlayer:Cities() do
        local pCityPlot = cCity:Plot()
        local between = Map.PlotDistance(pCityPlot:GetX(), pCityPlot:GetY(), pPlot:GetX(), pPlot:GetY())
        if between < distance then
            distance = between
            cNearestCity = cCity
        end
    end
    return cNearestCity
end

print("Capture Great People functions loaded.")