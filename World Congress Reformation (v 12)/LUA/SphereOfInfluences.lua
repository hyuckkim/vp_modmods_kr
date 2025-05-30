citystateliberate = nil
citystatecaptured = nil
Puppetnomy = nil
local iREEEEE = GameInfoTypes.PLAYER_EVENT_CSVASSAL
local iSphereofInfluence = GameInfoTypes.PLAYER_EVENT_CSVASSAL_CHOICE_1
local iOpenDoor = GameInfoTypes.PLAYER_EVENT_CSVASSAL_CHOICE_2
local iIndependence = GameInfoTypes.PLAYER_EVENT_CSVASSAL_CHOICE_3
local iOwO = GameInfoTypes.PLAYER_EVENT_CSVASSAL2_CHOICE_1
local iVenice = GameInfoTypes.CIVILIZATION_VENICE
local iSphere = GameInfoTypes.RESOLUTION_SPHERE_OF_INFLUENCE
local iOpen = GameInfoTypes.RESOLUTION_OPEN_DOOR
local iDecolonization = GameInfoTypes.RESOLUTION_DECOLONIZATION
local iRebellion = GameInfoTypes.MINOR_CIV_QUEST_HORDE

function YouDecide(iPlayer, iChoice)
	local pPlayer = Players[iPlayer]
	if iChoice == iSphereofInfluence then
		if isUsingUCS then
			local minorPlayer = Players[citystateliberate]
			local majorPlayer = Players[iPlayer]
			if majorPlayer:GetEventChoiceCooldown(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. GameInfo.MinorCivilizations[minorPlayer:GetMinorCivType()].Type]) == 0 then
				majorPlayer:DoEventChoice(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. GameInfo.MinorCivilizations[minorPlayer:GetMinorCivType()].Type])	
			end
		end
		Game.DoEnactResolution(iSphere, citystateliberate, iPlayer)
		Players[0]:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, "A Sphere of Influence is established in " .. Players[citystateliberate]:GetName() .. " by " .. Players[iPlayer]:GetName() .. "'s forces. The world is shocked at this action taken.", "Sphere of Influence Established!", Players[citystateliberate]:GetCapitalCity():GetX(), Players[citystateliberate]:GetCapitalCity():GetY())
		--Network.SendChangeWar(citystateliberate, false)
		--Players[citystateliberate]:SetMinorCivActiveQuestForPlayer(iPlayer, 27, 0, citystateliberate)
		Players[citystateliberate]:SetMinorCivActiveQuestForPlayer(iPlayer, iRebellion, Game.GetGameTurn(), iPlayer)
		pPlayer:SetEventChoiceCooldown(iSphereofInfluence, 0)
		pPlayer:DoCancelEventChoice(iSphereofInfluence)
	elseif iChoice == iOpenDoor then
		Game.DoEnactResolution(iOpen, citystateliberate, iPlayer)
		Players[0]:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, "An Open Door Policy is enacted in " .. Players[citystateliberate]:GetName() .. " by " .. Players[iPlayer]:GetName() .. "'s forces. The world becomes uneasy of this action.", "Open Door Policy Enacted!", Players[citystateliberate]:GetCapitalCity():GetX(), Players[citystateliberate]:GetCapitalCity():GetY())
		--Network.SendChangeWar(citystateliberate, false)
		pPlayer:SetEventChoiceCooldown(iOpenDoor, 0)
		pPlayer:DoCancelEventChoice(iOpenDoor)
	elseif iChoice == iIndependence then
		--Network.SendChangeWar(citystateliberate, false)
		pPlayer:SetEventChoiceCooldown(iIndependence, 0)
		pPlayer:DoCancelEventChoice(iIndependence)
	elseif iChoice == iOwO then
		pPlayer:SetEventChoiceCooldown(iOwO, 0)
		pPlayer:DoCancelEventChoice(iOwO)
		Network.SendLiberateMinor(citystatecaptured, Puppetnomy)
	end
end

function VassalCityState(iPlayer, iOtherPlayer, iCity)
	citystateliberate = "none"
	local pPlayer = Players[iPlayer]
	local pOtherPlayer = Players[iOtherPlayer]
	if pOtherPlayer:IsMinorCiv() then
		citystateliberate = iOtherPlayer
		--[[pPlayer:SetEventChoiceCooldown(iSphereofInfluence, 0)
		pPlayer:DoCancelEventChoice(iSphereofInfluence)
		pPlayer:SetEventChoiceCooldown(iOpenDoor, 0)
		pPlayer:DoCancelEventChoice(iOpenDoor)
		pPlayer:SetEventChoiceCooldown(iIndependence, 0)
		pPlayer:DoCancelEventChoice(iIndependence)]]
		pPlayer:DoStartEvent(iREEEEE)
	end
end

function Peacekeeping(oldOwnerID, bIsCapital, x, y, newOwnerID, pop, bConquest)
	citystatecaptured = "none"
	if Players[oldOwnerID]:IsMinorCiv() then
		citystatecaptured = oldOwnerID
	end
end

function PuppetMaster(playerID, cityID)
	local pPlayer = Players[playerID]
	if Players[pPlayer:GetCityByID(cityID):GetOriginalOwner()]:IsMinorCiv() and pPlayer:GetCityByID(cityID):IsOriginalCapital() and citystatecaptured ~= "none" then
		if pPlayer:GetCivilizationType() ~= iVenice then
			pPlayer:DoStartEvent(GameInfoTypes.PLAYER_EVENT_CSVASSAL2)
			Puppetnomy = cityID
		end
		if pPlayer:GetCivilizationType() == iVenice and pPlayer:IsHuman() then
			pPlayer:DoStartEvent(GameInfoTypes.PLAYER_EVENT_CSVASSAL2)
			Puppetnomy = cityID
		end
	end 
end

function Resolutiontest(iResolution, iPlayer, iChoice, bEnact, bPassed)
	if iResolution == iDecolonization and bPassed then
		for i = 22, GameDefines.MAX_CIV_PLAYERS - 1 do
			if Players[i]:IsEverAlive() then
				if Game.IsResolutionPassed(iSphere, i) and Players[i]:GetPermanentAlly() == iChoice then
					Game.DoRepealResolution(iSphere, iPlayer, i)
				end
			end
		end
	end
end

function StopBullyGold(iPlayer, iCS)
	if Game.IsResolutionPassed(iOpen, iCS) ~= nil then
		if (Game.IsResolutionPassed(iOpen, iCS)) then
			return false
		end
	end
	return true 
end

function StopBullyUnit(iPlayer, iCS)
	if Game.IsResolutionPassed(iOpen, iCS) ~= nil then
		if Game.IsResolutionPassed(iOpen, iCS) then
			return false
		end
	end
	return true 
end

isUsingUCS = false
for _, mod in pairs(Modding.GetActivatedMods()) do
	if (mod.ID == "b2eb6d1e-1fcb-4a0d-829c-51691aa3183a") or (mod.ID == "10c8e61b-b309-4b3e-8975-5e21b3214622") then
		isUsingUCS = true
	end
end

GameEvents.CityCaptureComplete.Add(Peacekeeping)
GameEvents.CityPuppeted.Add(PuppetMaster)
GameEvents.EventChoiceActivated.Add(YouDecide)
GameEvents.PlayerLiberated.Add(VassalCityState)
GameEvents.ResolutionResult.Add(Resolutiontest)
GameEvents.PlayerCanBullyGold.Add(StopBullyGold)
GameEvents.PlayerCanBullyUnit.Add(StopBullyUnit)