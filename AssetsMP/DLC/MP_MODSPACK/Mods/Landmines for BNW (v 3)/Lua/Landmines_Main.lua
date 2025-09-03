-- Landmines_Main
-- Author: FramedArchitecture
-- DateCreated: 7/12/2013
--------------------------------------------------------------------
include("Landmines_Functions.lua");
include("Landmines_AI.lua");
--------------------------------------------------------------------
local techUnlockID	= g_TechUnlockID
local landmineID	= g_LandmineID
local landmines		= g_Landmines
local bIsLoad		= false
local bMinesEnabled	= false
--------------------------------------------------------------------
function OnPlayerTurn(iPlayer)
	if not bMinesEnabled then return end
	if iPlayer > 0 then return end
	UpdateLandmines();
	DoLandminesAI();
	bIsLoad = false;
end
GameEvents.PlayerDoTurn.Add( OnPlayerTurn )
--------------------------------------------------------------------
function OnLandmineComplete(iPlayer, iX, iY, improvementID)
	if not bMinesEnabled then return end
	if (improvementID ~= landmineID) then return end
	UpdateLandmineData(iPlayer, iX, iY, true);
end
LuaEvents.LandmineComplete.Add( OnLandmineComplete )
GameEvents.BuildFinished.Add( OnLandmineComplete )
--------------------------------------------------------------------
function OnLandmineDestroyed()
	if not bMinesEnabled then return end
	if bIsLoad then return end
	UpdateLandmines();
end
Events.SerialEventImprovementDestroyed.Add( OnLandmineDestroyed )
--------------------------------------------------------------------
function OnLandminePlot(iPlayer, unitID, iX, iY)
	if not bMinesEnabled then return false end

	local plot = Map.GetPlot(iX, iY);
	if not plot then return end
	if plot:GetImprovementType() ~= landmineID then return end
	
	local iMineOwner = GetLandmineOwner(iX, iY);
	if not iMineOwner then return false end
	if (iMineOwner == iPlayer) then return false end

	local enemyPlayer = Players[iPlayer];
	local minePlayer = Players[iMineOwner];
	
	if minePlayer and enemyPlayer then
		local bWar = Teams[enemyPlayer:GetTeam()]:IsAtWar(minePlayer:GetTeam());
		if bWar then
			local unit = enemyPlayer:GetUnitByID(unitID);
			if not unit or unit:IsDelayedDeath() then return false end
			if unit:GetDomainType() == DomainTypes.DOMAIN_HOVER then return false end
			
			print(unit:GetName() .. " died from landmine damage.")
			SetAoEDamage(iPlayer, iX, iY);
			UpdateLandmineData(iMineOwner, iX, iY, false);
			unit:Kill(true, -1);

			-- Notification
			local heading = Locale.ConvertTextKey("TXT_KEY_EVENT_LANDMINE_EXPLODES");
			if enemyPlayer:IsHuman() then
				local text = Locale.ConvertTextKey("TXT_KEY_EVENT_LANDMINE_EXPLODES_US");
				enemyPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
			elseif minePlayer:IsHuman() then
				local text = Locale.ConvertTextKey("TXT_KEY_EVENT_LANDMINE_EXPLODES_THEM", enemyPlayer:GetCivilizationAdjective());
				minePlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iX, iY);
			end
		end
	end
end
GameEvents.UnitSetXY.Add( OnLandminePlot )
--------------------------------------------------------------------
function OnTechResearched(teamID, techID, int)
	if (techID == techUnlockID) then
		for iPlayer = 0, GameDefines.MAX_CIV_PLAYERS - 1, 1 do
			local player = Players[iPlayer]
			if player and (player:GetTeam() == teamID) then
				SetPlayerCanBuildLandmines(iPlayer, true)
				SetLandminesEnabled(true);
				bMinesEnabled = true
				--notification
				local text;
				local heading = Locale.ConvertTextKey("TXT_KEY_EVENT_LANDMINES_ENABLED");
				if player:IsHuman() then
					text = Locale.ConvertTextKey("TXT_KEY_EVENT_LANDMINES_ENABLED_US");
					player:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, -1, -1);
				else
					text = Locale.ConvertTextKey("TXT_KEY_EVENT_LANDMINES_ENABLED_THEM", player:GetCivilizationAdjective());
					Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, -1, -1);
				end
			end
		end
	end
end
GameEvents.TeamTechResearched.Add( OnTechResearched )
--------------------------------------------------------------------
function Initialize()
	local bInit = GetPersistentProperty("Landmines_Init")
	if not bInit then bMinesEnabled = OnBeginNewGame();
	elseif IsLandminesEnabled() then bMinesEnabled = OnLoadSavedGame() end
	bIsLoad = true;
end
--------------------------------------------------------------------
Initialize();