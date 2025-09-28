-- lua/WRLib.lua
-- Author: Cynther
-- Based on work by: hambil
-- DateCreated: 4/7/2013 1:48:51 PM
--------------------------------------------------------------
WRVersion = 7
print('***[ Wonder Race v' .. WRVersion .. ' loaded ]***')

function GetOptions()
	local db = Modding.OpenUserData('WonderRace', WRVersion)
	local WRNotifyTurnDiff = db.GetValue('WRNotifyTurnDiff')
	if WRNotifyTurnDiff == 1 then
		WRNotifyTurnDiff = true
	elseif WRNotifyTurnDiff == 0 then
		WRNotifyTurnDiff = false
	elseif type(WRNotifyTurnDiff) ~= "boolean" then
		WRNotifyTurnDiff = true	-- default
	end
	local WRNotifyCompetitorID = db.GetValue('WRNotifyCompetitorID')
	if WRNotifyCompetitorID == 1 then
		WRNotifyCompetitorID = true
	elseif WRNotifyCompetitorID == 0 then
		WRNotifyCompetitorID = false
	elseif type(WRNotifyCompetitorID) ~= "boolean" then
		WRNotifyCompetitorID = true	-- default
	end
	local WRNotifyOnDetectWonder = db.GetValue('WRNotifyOnDetectWonder')
	if WRNotifyOnDetectWonder == 1 then
		WRNotifyOnDetectWonder = true
	elseif WRNotifyOnDetectWonder == 0 then
		WRNotifyOnDetectWonder = false
	elseif type(WRNotifyOnDetectWonder) ~= "boolean" then
		WRNotifyOnDetectWonder = true	-- default
	end
	local WRRepeatLosingNotification = db.GetValue('WRRepeatLosingNotification')
	if WRRepeatLosingNotification == 1 then
		WRRepeatLosingNotification = true
	elseif WRRepeatLosingNotification == 0 then
		WRRepeatLosingNotification = false
	elseif type(WRRepeatLosingNotification) ~= "boolean" then
		WRRepeatLosingNotification = true	-- default
	end
	local WREnableLogging = db.GetValue('WREnableLogging')
	if WREnableLogging == 1 then
		WREnableLogging = true
	elseif WREnableLogging == 0 then
		WREnableLogging = false
	elseif type(WREnableLogging) ~= "boolean" then
		WREnableLogging = false	-- default
	end
	local WRDebug = db.GetValue('WRDebug')
	if WRDebug == 1 then
		WRDebug = true
	elseif WRDebug == 0 then
		WRDebug = false
	elseif type(WRDebug) ~= "boolean" then
		WRDebug = false	-- default
	end
	return {TurnDiff = WRNotifyTurnDiff, CompID = WRNotifyCompetitorID, DetectWonder = WRNotifyOnDetectWonder, LosingNotif = WRRepeatLosingNotification, Logging = WREnableLogging, Debug = WRDebug}
end

-- Prints options to log
function PrintOptionsToLog()
	if MapModData.WonderRace and MapModData.WonderRace.Options then
		print('MapModData Options: TurnDiff = ' .. tostring(MapModData.WonderRace.Options.TurnDiff) .. ', CompID = ' .. tostring(MapModData.WonderRace.Options.CompID) .. ', DetectWonder = ' .. tostring(MapModData.WonderRace.Options.DetectWonder) .. ', LosingNotif = ' .. tostring(MapModData.WonderRace.Options.LosingNotif) .. ', Logging = ' .. tostring(MapModData.WonderRace.Options.Logging) .. ', Debug = ' .. tostring(MapModData.WonderRace.Options.Debug))
	else
		print('ERROR: MapModData.WonderRace.Options does not exist')
	end
end

-- Create tables
MapModData.WonderRace = {}
local gWonderTable = {}
local gWonderWinningPlayer = {}
local gWonderLosingPlayer = {}
local gFastestBuild = {}
local gSecondFastestBuild = {}
local gSuppressNotifications = {}
local humanID = nil
MapModData.WonderRace.Options = GetOptions()
PrintOptionsToLog()

-- This function adds a new entry in the tables.
-- Parameters are p = player ID, w = wonder name, t = production turns left
function DoWonder(p, w, t)

	if MapModData.WonderRace.Options.Debug and MapModData.WonderRace.Options.Logging then print('Processing wonder entry (Player ' .. p .. ', ' .. Locale.ConvertTextKey(GameInfo.Buildings[w].Description) .. ', ' .. t .. ' turns)') end
	
	if not gWonderTable[w] then	-- If no one has been building wonder w before, create table
		if MapModData.WonderRace.Options.Debug and MapModData.WonderRace.Options.Logging then print('Creating gWonderTable[' .. w .. ']') end
		gWonderTable[w] = {}
	end
	gWonderTable[w]['' .. p] = t
	
	if not gFastestBuild[w] then	-- If no one has been building this wonder before
		if MapModData.WonderRace.Options.Debug and MapModData.WonderRace.Options.Logging then print('Creating gFastestBuild[' .. w .. ']') end
		gFastestBuild[w] = t
		gWonderWinningPlayer[w] = '' .. p
	elseif t < gFastestBuild[w] then	-- If this entry is the new fastest
		if MapModData.WonderRace.Options.Debug and MapModData.WonderRace.Options.Logging then print('Replacing gFastestBuild[' .. w .. ']') end
		if gWonderWinningPlayer[w] ~= '' .. p then	-- If the prior fastest entry belongs to another player
			if MapModData.WonderRace.Options.Debug and MapModData.WonderRace.Options.Logging then print('Replacing gWonderWinningPlayer[' .. w .. ']') end
			gSecondFastestBuild[w] = gFastestBuild[w]
			gWonderLosingPlayer[w] = gWonderWinningPlayer[w]
			gWonderWinningPlayer[w] = '' .. p
		end
		gFastestBuild[w] = t
	elseif not gSecondFastestBuild[w] then	-- If this entry is the second fastest
		if MapModData.WonderRace.Options.Debug and MapModData.WonderRace.Options.Logging then print('Creating gSecondFastestBuild[' .. w .. ']') end
		gSecondFastestBuild[w] = t
		gWonderLosingPlayer[w] = '' .. p
	elseif t < gSecondFastestBuild[w] then	-- If this entry is the second fastest
		if MapModData.WonderRace.Options.Debug and MapModData.WonderRace.Options.Logging then print('Replacing gSecondFastestBuild[' .. w .. ']') end
		gSecondFastestBuild[w] = t
		gWonderLosingPlayer[w] = '' .. p
	end
end

-- This function is called at the start of every player's turn.
-- It goes through the construction projects of every city in the empire, searching for wonders.
-- Adds any wonders to the tables and then fires a notification if necessary.
function DoTurn(playerID)
	local player = Players[playerID]
	local turndiff = 0
	local buildingInfo
	local wonder
	local wondername
	
	if not player then
		print('DoTurn(' .. playerID .. ') FAILED: playerID not found')
		return
	end
	if player:IsMinorCiv() or player:IsBarbarian() then return end

	if MapModData.WonderRace.Options.Logging and player:IsHuman() then print('************HUMAN TURN STARTED (Turn ' .. Game.GetGameTurn() .. ')************') end
	
	local activePlayer = '문명 ' .. player:GetID()
	if player:IsHuman() or Teams[Players[humanID]:GetTeam()]:IsHasMet(player:GetTeam()) then
		activePlayer = player:GetName()
	end
	if MapModData.WonderRace.Options.Logging then print('Processing ' .. activePlayer .. '\'s turn') end
	
	local wonderTablePlayerCopy = {}	-- Create list of active player's current wonder construction projects
	for key,value in pairs(gWonderTable) do
		for k, v in pairs(value) do
			if k == '' .. playerID then
				wonderTablePlayerCopy[key] = v
			end
		end
	end

	RemoveEntries(playerID)	-- Remove preexisting entries for this player

	for city in player:Cities() do	-- Go through every city
		buildingInfo = GameInfo.Buildings[city:GetProductionBuilding()]
		if buildingInfo then
			buildingClassInfo = GameInfo.BuildingClasses[buildingInfo.BuildingClass]
			
			if buildingClassInfo.MaxGlobalInstances == 1 then	-- If construction project is a wonder
				wonder = buildingInfo.Type
				wondername = Locale.ConvertTextKey(buildingInfo.Description)
				building = city:GetProductionBuilding()
				if not gSuppressNotifications[wonder] then
					gSuppressNotifications[wonder] = {}
				end
				
				-- print log message
				local builder = nil
				local buildingSite = nil
				if player:IsHuman() or (MapModData.WonderRace.Options.CompID and Teams[Players[humanID]:GetTeam()]:IsHasMet(player:GetTeam())) then
					builder = player:GetName()
					buildingSite = city:GetName()
				else
					builder = '문명 ' .. player:GetID()
					buildingSite = '그들의 도시 중 하나'
				end
				print(builder .. '의 ' .. Locale.ConvertTextKey(buildingInfo.Description) .. ' 건설 중: ' .. buildingSite .. ' (' .. city:GetProductionTurnsLeft() .. ' 턴 남음.)')
				
				-- Fire notification if new wonder that player is not constructing
				if MapModData.WonderRace.Options.DetectWonder and humanID and humanID ~= playerID then
					if not wonderTablePlayerCopy[wonder] and (not gWonderTable[wonder] or not gWonderTable[wonder]['' .. humanID]) then
						if MapModData.WonderRace.Options.Debug and MapModData.WonderRace.Options.Logging then print('New wonder detected!') end
						local competitor = nil
						local competitorSite = nil
						if not MapModData.WonderRace.Options.CompID then
							competitor = '다른 문명'
							competitorSite = '멀리 떨어진 도시'
						elseif Teams[Players[humanID]:GetTeam()]:IsHasMet(player:GetTeam()) then
							competitor = player:GetName()
							competitorSite = city:GetName()
						else
							competitor = '문명 ' .. player:GetID()
							competitorSite = '그들의 도시 중 하나'
						end
						local msg = '불가사의 건설 시작함'
						local tip = '[COLOR_RED]' .. competitor .. '[ENDCOLOR] 지도자가 [COLOR_GREEN]' .. wondername .. '[ENDCOLOR] 건설을 [COLOR:0:240:240:255]' .. competitorSite .. '[ENDCOLOR]에서 시작했습니다.'
						Players[humanID]:AddNotification(NotificationTypes.NOTIFICATION_WONDER_BEATEN, tip, msg, Players[humanID], building, building) 
						print('Notification fired: ' .. tip)
					else
						if MapModData.WonderRace.Options.Debug and MapModData.WonderRace.Options.Logging then print('Wonder is not a new entry!') end
					end
				end
				
				DoWonder(playerID, wonder, city:GetProductionTurnsLeft())	-- Add wonder to database
				
				if player:IsHuman() then -- Notifications are only for humans
					if not gWonderWinningPlayer[wonder] then
						print('ERROR: ' .. wonder .. ' wonder has not been properly registered')
						return
					elseif gWonderWinningPlayer[wonder] == '' .. playerID then	-- If this player is winning the race
						if not gSecondFastestBuild[wonder] then	-- If this player is the only one building the wonder
							turndiff = city:GetProductionTurnsLeft()
							gSuppressNotifications[wonder]['' .. playerID] = 1	-- No need for notification
							if MapModData.WonderRace.Options.Logging then print('Turndiff = NO CONTEST') end
						else	-- This player is winning the race
							turndiff = gSecondFastestBuild[wonder] - city:GetProductionTurnsLeft()	-- turndiff > 0
							if MapModData.WonderRace.Options.Logging then print('Winning by ' .. turndiff .. ' turns') end
						end
					else	-- This player is losing the race
						turndiff = gFastestBuild[wonder] - city:GetProductionTurnsLeft()	-- turndiff < 0
						turndiff = turndiff - 1	-- Because game turns are asynchronous, you need to speed up 1 extra turn to get ahead
						if MapModData.WonderRace.Options.Logging then print('Losing by ' .. (-turndiff) .. ' turns') end
					end
		
					-- Here we are just setting a flag to let us know when things have changed, so we don't spam notices
					if not gSuppressNotifications[wonder] then
						gSuppressNotifications[wonder] = {}
					end

					if MapModData.WonderRace.Options.Debug and turndiff == 0 then print('WARNING: TURNDIFF SHOULD NOT BE ZERO! PLEASE REPORT AS BUG') end

					if not gSuppressNotifications[wonder]['' .. playerID] then
						gSuppressNotifications[wonder]['' .. playerID] = 0
					elseif gSuppressNotifications[wonder]['' .. playerID] == 1 then	-- If was winning
						if turndiff <= 0 then
							gSuppressNotifications[wonder]['' .. playerID] = 0	-- Not winning anymore
						-- Add WRRepeatWinningNotification option here??
						end
					elseif  gSuppressNotifications[wonder]['' .. playerID] == 2 then	-- If was losing
						if turndiff > 0 then
							gSuppressNotifications[wonder]['' .. playerID] = 0	-- Not losing anymore
						elseif MapModData.WonderRace.Options.LosingNotif then
							gSuppressNotifications[wonder]['' .. playerID] = 0	-- Repeat
						end
					end
					
					if MapModData.WonderRace.Options.Debug and MapModData.WonderRace.Options.Logging then print('gSuppressNotifications[' .. wonder .. '][Player ' .. playerID .. '] set to ' .. gSuppressNotifications[wonder]['' .. playerID]) end

					if gSuppressNotifications[wonder]['' .. playerID] == 0 then	-- If notification is necessary
						local otherPlayer = nil
						if turndiff > 0  then	-- Winning
							local loser = Players[tonumber(gWonderLosingPlayer[wonder])]
							if not MapModData.WonderRace.Options.CompID then
								otherPlayer = '다른 문명'
							elseif Teams[player:GetTeam()]:IsHasMet(loser:GetTeam()) then
								otherPlayer = loser:GetName()
							else
								otherPlayer = '문명' .. loser:GetID()
							end
							if MapModData.WonderRace.Options.Debug then print('otherPlayer = ' .. otherPlayer) end
							local msg = Locale.ConvertTextKey("TXT_KEY_WR_WINNING")
							local tip = Locale.ConvertTextKey("TXT_KEY_WR_WINNING_TOOLTIP", otherPlayer, '[COLOR_GREEN]' .. wondername .. '[ENDCOLOR]')
							if MapModData.WonderRace.Options.TurnDiff then tip = tip .. " (" .. turndiff .. "턴 차이)" end
							if (OptionsManager.GetSinglePlayerAutoEndTurnEnabled_Cached()) then	-- If auto-end-turn is enabled
								Controls.WRDialogCaptionLabel:SetText(msg)
								Controls.WRDialogWonderLabel:SetText(tip) 
								-- ContextPtr:SetHide(false)
								Controls.WRDialogPanel:SetHide(false)
								print('Dialog fired: ' .. tip)
							else
								player:AddNotification(NotificationTypes.NOTIFICATION_WONDER_COMPLETED_ACTIVE_PLAYER, tip, msg, player, building, building) 
								print('Notification fired: ' .. tip)
							end
							gSuppressNotifications[wonder]['' .. playerID] = 1	-- Do not show winning notification again
						else	-- Losing
							local winner = Players[tonumber(gWonderWinningPlayer[wonder])]
							if not MapModData.WonderRace.Options.CompID then
								otherPlayer = '다른 문명'
							elseif Teams[player:GetTeam()]:IsHasMet(winner:GetTeam()) then
								otherPlayer = winner:GetName()
							else
								otherPlayer = '문명' .. winner:GetID()
							end
							if MapModData.WonderRace.Options.Debug then print('otherPlayer = ' .. otherPlayer) end
							local losingturns  = (0-turndiff)
							local msg = Locale.ConvertTextKey("TXT_KEY_WR_LOSING")
							local tip = Locale.ConvertTextKey("TXT_KEY_WR_LOSING_TOOLTIP", otherPlayer, '[COLOR_RED]' .. wondername .. '[ENDCOLOR]')
							if MapModData.WonderRace.Options.TurnDiff then tip = tip .. " (" .. losingturns .. "턴 차이)" end
							if (OptionsManager.GetSinglePlayerAutoEndTurnEnabled_Cached()) then
								Controls.WRDialogCaptionLabel:SetText(msg)
								Controls.WRDialogWonderLabel:SetText(tip)
								-- ContextPtr:SetHide(false)
								Controls.WRDialogPanel:SetHide(false)
								print('Dialog fired: ' .. tip)
							else
								player:AddNotification(NotificationTypes.NOTIFICATION_WONDER_BEATEN, tip, msg, player, building, building) 
								print('Notification fired: ' .. tip)
							end
							gSuppressNotifications[wonder]['' .. playerID] = 2	-- Do not show losing notification again
						end -- Notification sent
					end -- Notification suppressed
				end -- If human
			end	-- If building wonder
		end	-- If producing building
	end	-- Cities loop
	if (MapModData.WonderRace.Options.Debug or player:IsHuman()) and MapModData.WonderRace.Options.Logging then PrintTableContents() end
end -- DoTurn()

function DoInit()
--	ContextPtr:SetHide(true)	-- Hide the notification dialog for auto-end-turn until needed

	for i,j in pairs(Players) do
		if j:IsHuman() then
			if humanID == nil then
				humanID = i	-- Should be 0
			else
				humanID = nil	-- Not multiplayer compatible
			end
		end
	end
	if MapModData.WonderRace.Options.Debug and MapModData.WonderRace.Options.Logging then print('Initialization complete: humanID = ' .. humanID) end
end

---------------------Auxiliary functions---------------------

-- This function removes all entries associated with the current player.
-- All current construction projects will be added again during the turn.
function RemoveEntries(p)
	if MapModData.WonderRace.Options.Debug and MapModData.WonderRace.Options.Logging then print('Removing Player ' .. p .. ' entries') end
	for key,value in pairs(gSuppressNotifications) do	-- remove notification suppresion
		if gSuppressNotifications[key]['' .. p] and not gWonderTable[key]['' .. p] then	-- only if wonder is not being produced anymore
			if MapModData.WonderRace.Options.Debug and MapModData.WonderRace.Options.Logging then print('gSuppressNotifications[' .. key .. '][' .. p .. '] removed') end
			gSuppressNotifications[key]['' .. p] = nil
		end
	end
	for key,value in pairs(gWonderTable) do	-- remove all entries for player p
		if gWonderTable[key]['' .. p] then
			if MapModData.WonderRace.Options.Debug and MapModData.WonderRace.Options.Logging then print('gWonderTable[' .. key .. '][' .. p .. '] removed') end
			gWonderTable[key]['' .. p] = nil
		end
	end
	for key,value in pairs(gWonderWinningPlayer) do	-- if player p is best
		if value == '' .. p then
			if MapModData.WonderRace.Options.Debug and MapModData.WonderRace.Options.Logging then print('gWonderWinningPlayer[' .. key .. '] removed') end
			if MapModData.WonderRace.Options.Debug and MapModData.WonderRace.Options.Logging then print('gFastestBuild[' .. key .. '] removed') end
			if gWonderLosingPlayer[key] then	-- promote 2nd best entry
				gWonderWinningPlayer[key] = gWonderLosingPlayer[key]
				gFastestBuild[key] = gSecondFastestBuild[key]
				if MapModData.WonderRace.Options.Debug and MapModData.WonderRace.Options.Logging then print('Promoting 2nd best entry to 1st: Player ' .. gWonderWinningPlayer[key] .. ' (' .. gFastestBuild[key] .. ' turns)') end
				gWonderLosingPlayer[key] = nil
				gSecondFastestBuild[key] = nil
				for k,v in pairs(gWonderTable[key]) do	-- promote 3rd best entry
					if k ~= gWonderWinningPlayer[key] then
						if not gSecondFastestBuild[key] or v < gSecondFastestBuild[key] then
							gWonderLosingPlayer[key] = k
							gSecondFastestBuild[key] = v
							if MapModData.WonderRace.Options.Debug and MapModData.WonderRace.Options.Logging then print('Promoting 3rd best entry to 2nd: Player ' .. k .. ' (' .. v .. ' turns)') end
						end
					end
				end
			else
				if MapModData.WonderRace.Options.Debug and MapModData.WonderRace.Options.Logging then print('Found no entry to promote') end
				gWonderWinningPlayer[key] = nil	-- there is no other entry to promote
				gFastestBuild[key] = nil
			end
		end
	end
	for key,value in pairs(gWonderLosingPlayer) do	-- if player p is second best
		if value == '' .. p then
			if MapModData.WonderRace.Options.Debug and MapModData.WonderRace.Options.Logging then print('gWonderLosingPlayer[' .. key .. '] removed') end
			gWonderLosingPlayer[key] = nil
			if MapModData.WonderRace.Options.Debug and MapModData.WonderRace.Options.Logging then print('gSecondFastestBuild[' .. key .. '] removed') end
			gSecondFastestBuild[key] = nil
			for k,v in pairs(gWonderTable[key]) do	-- promote 3rd best entry
				if k ~= gWonderWinningPlayer[key] then
					if not gSecondFastestBuild[key] or v < gSecondFastestBuild[key] then
						gWonderLosingPlayer[key] = k
						gSecondFastestBuild[key] = v
						if MapModData.WonderRace.Options.Debug and MapModData.WonderRace.Options.Logging then print('Promoting 3rd best entry to 2nd: Player ' .. k .. ' /' .. v .. ' turns') end
					end
				end
			end
		end
	end
end

function RemoveNotificationSuppression()
	gSuppressNotifications = {}
end

-- Print the contents of all the tables for logging purposes
function PrintTableContents()
	if MapModData.WonderRace.Options.Debug and MapModData.WonderRace.Options.Logging then print('Printing table contents') end
	PrintDoubleTableContents(gWonderTable,'WonderTable')
	PrintSingleTableContents(gWonderWinningPlayer,'WinningPlayer')
	PrintSingleTableContents(gWonderLosingPlayer,'LosingPlayer')
	PrintSingleTableContents(gFastestBuild,'FastestBuild')
	PrintSingleTableContents(gSecondFastestBuild,'SecondFastestBuild')
	if MapModData.WonderRace.Options.Debug then PrintDoubleTableContents(gSuppressNotifications,'SuppressNotifications') end
end

function PrintSingleTableContents(t, n)
	for key,value in pairs(t) do
		print(n .. '[' .. key .. '] = ' .. value)
	end
end

function PrintDoubleTableContents(t, n)
	for key,value in pairs(t) do
		for k, v in pairs(value) do
			print(n .. '[' .. key .. '][Player ' .. k .. '] = ' .. v)
		end
	end
end

-- TODO: Listen for Wonder built events
Events.SequenceGameInitComplete.Add( DoInit );
GameEvents.PlayerDoTurn.Add( DoTurn );