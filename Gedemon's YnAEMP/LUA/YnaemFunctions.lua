-- LUA YnaemFunctions
-- Author: Gedemon
-- DateCreated: 6/15/2011 7:07:09 AM
--------------------------------------------------------------

--print ("---- Loading YnAEMP functions -----")

-- Civilizations check

include("YnaemUtils.lua")

function MinorCivExist ( minorCivilizationType )
	local civExist = false
	for row in GameInfo.MinorCivilizations() do
		if row.Type == minorCivilizationType then
			civExist = true
		end
	end
	return civExist
end

function MajorCivExist ( civilizationType )
	local civExist = false
	for row in GameInfo.Civilizations() do
		if row.Type == civilizationType then
			civExist = true
		end
	end
	return civExist
end

function MinorCivHasTSL ( minorCivID )
	if IsCulDivActive() then
		local cultureID = GetCultureType(minorCivID, true)
		local cultureOption = "GAMEOPTION_" .. GameInfo.JFD_CultureTypes[cultureID].Type
		for option in GameInfo.GameOptions("Type = '" .. cultureOption .. "'") do
			if (PreGame.GetMapOption(option.ID) and PreGame.GetMapOption(option.ID) ~= 1) then
				return false
			end
		end	
	end	
	local minorCivilizationType = GameInfo["MinorCivilizations"][minorCivID]["Type"]
	local civHasTSL = false
	local mapID = modUserData.GetValue ("MapID")
	if mapID < 50 then
		tableName = "MinorCiv_" .. g_MapList[mapID].TablePrefix .. "StartPosition"
		for row in GameInfo[tableName]() do
			if row.Type == minorCivilizationType then
				civHasTSL = true
			end
		end
	end
	for row in GameInfo.MinorCivilizations_YnAEMP("MapPrefix = '" .. g_MapList[mapID].TablePrefix .. "'") do
		if row.MinorCivType == minorCivilizationType then
			civHasTSL = true
		end
	end
	return civHasTSL
end

function CivHasTSL(civID)
	local mapID = modUserData.GetValue ("MapID")
	tableName = "Civilizations_" .. g_MapList[mapID].TablePrefix .. "StartPosition"
	for row in GameInfo[tableName]() do
		if MajorCivExist ( row.Type ) then
			if civID == GameInfo["Civilizations"][row.Type]["ID"] then
				return true
			end
		end
	end
	for row in GameInfo.Civilizations_YnAEMP("MapPrefix = '" .. g_MapList[mapID].TablePrefix .. "'") do
		if MajorCivExist ( row.CivilizationType ) then
			if civID == GameInfo["Civilizations"][row.CivilizationType]["ID"] then
				return true
			end
		end
	end
	return false
end

function CivCultureIsValid(civID, isMinor)
	if IsCulDivActive() then
		local cultureID = GetCultureType(civID, isMinor)
		local cultureOption = "GAMEOPTION_" .. GameInfo.JFD_CultureTypes[cultureID].Type
		for option in GameInfo.GameOptions("Type = '" .. cultureOption .. "'") do
			if (PreGame.GetGameOption(option.Type) and PreGame.GetGameOption(option.Type) ~= 1 and PreGame.GetGameOption("GAMEOPTION_CULTURE_JFD_ALL") ~= 1) then
				return false
			end
		end	
	end
	return true 
end


-- update localized text

function SetText ( str, tag )
	-- in case of language change mid-game :
	local query = "UPDATE Language_en_US SET Text = '".. str .."' WHERE Tag = '".. tag .."'"
	for result in DB.Query(query) do
	end
	-- that's the table used ingame :
	local query = "UPDATE LocalizedText SET Text = '".. str .."' WHERE Tag = '".. tag .."'"
	for result in DB.Query(query) do
	end
end



-------------------------------------------------
-- UI functions 
-------------------------------------------------

function RemoveDeadNotifications(Id, type, toolTip, strSummary, iGameValue, iExtraGameData)
	if not Game then return end -- test
	local turn = Game.GetGameTurn()
	if turn == 0 then -- no dead civs notifications at start
		if type == NotificationTypes.NOTIFICATION_PLAYER_KILLED then
			Events.NotificationRemoved(Id)
		end
	end 
	if turn < 2 and Game.IsHotSeat() then  -- no dead civs notifications at start in hotseat
		if type == NotificationTypes.NOTIFICATION_PLAYER_KILLED then
			Events.NotificationRemoved(Id)
		end
	end
end

if Events then -- No Events in the setup screen, call only when included for in game file... 
	Events.NotificationAdded.Add( RemoveDeadNotifications )
end