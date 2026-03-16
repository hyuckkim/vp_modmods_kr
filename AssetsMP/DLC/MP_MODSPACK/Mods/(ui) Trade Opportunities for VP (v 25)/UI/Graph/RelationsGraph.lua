-- InfoAddictCivRelations
-- Author: robk + Aristos + adan_eslavo
-- DateCreated: 10/8/2010 10:57:08 PM
--------------------------------------------------------------
include("RelationsGraphLib.lua")
include("IconSupport")
include("FLuaVector")

local L = Locale.ConvertTextKey

-- This is the max number of icons that are available. Since I'm pre-generating all the
-- positions and connectors, this is tied to external program that writes the XML and
-- generates those connectors.
local iconCount = 22

-- A bunch of colors that I'm defining myself since I may want to make them slightly
-- different than the named colors available. After the color vectors are defined,
-- they're assigned to the various connection types and the key bars are set.
local colors = {}
	colors.red				= Vector4(0.8,	0.2,	0.2,	1)
	colors.green			= Vector4(0,	0.8,	0.2,	1)
	colors.yellow			= Vector4(1,	1,		0,		1)
	colors.purple			= Vector4(0.63,	0.13,	0.94,	1)
	colors.lightpink		= Vector4(0.93, 0.51,	0.93,	1)
	colors.orange			= Vector4(1,	0.50,	0,		1) --(1, .65, 0, 1)
	colors.lightorange		= Vector4(1,	0.87,	0,		1)
	colors.peachpuff		= Vector4(0.8,	0.69,	0.58,	1)
	colors.white			= Vector4(1,	1,		1,		1)
	colors.pink				= Vector4(0.8,	0,		0.8,	1)
	colors.steelblue		= Vector4(0.14, 0.35,	0.57,	1) --(.27, .51, .71, 1)
	colors.lightsteelblue	= Vector4(0.68, 0.78,	0.96,	1)
	colors.gold				= Vector4(0.93, 0.91,	0.67,	1)

local textcolors = {}
	textcolors.redtext			= "[COLOR:204:51:51:255]"
	textcolors.greentext		= "[COLOR:0:204:51:255]"
	textcolors.yellowtext		= "[COLOR:255:255:0:255]"
	textcolors.lightpinktext	= "[COLOR:238:130:238:255]"
	textcolors.purpletext		= "[COLOR:160:32:240:255]"
	textcolors.orangetext		= "[COLOR:255:128:0:255]"		-- original: 255:153:0
	textcolors.whitetext		= "[COLOR:255:255:255:255]"
	textcolors.pinktext			= "[COLOR:205:0:205:255]"
	textcolors.peachpufftext	= "[COLOR:204:176:148:255]"
	textcolors.steelbluetext	= "[COLOR:35:90:145:255]"		-- original: 69:130:181
	textcolors.goldtext			= "[COLOR:238:232:170:255]"

-- Political colors
local war_color = colors.red
local war_text = textcolors.redtext
Controls.WarKeyBar:SetColor(war_color)

local openBorders_color = colors.steelblue
local openBordersHalf_color = colors.lightsteelblue
local openBorders_text = textcolors.steelbluetext
Controls.BordersKeyBar:SetColor(openBorders_color)
Controls.BordersOneKeyBar:SetColor(openBordersHalf_color)

local DoF_color = colors.green
local DoF_text = textcolors.greentext
Controls.DoFKeyBar:SetColor(DoF_color)

local denounce_color = colors.orange
local denounceHalf_color = colors.lightorange
local denounce_text = textcolors.orangetext
Controls.DenounceKeyBar:SetColor(denounce_color)
Controls.DenounceOneKeyBar:SetColor(denounceHalf_color)

local defensivePact_color = colors.white
local defensivePact_text = textcolors.whitetext
Controls.DefensiveKeyBar:SetColor(defensivePact_color)

--Economic colors
local gold_color = colors.gold
local gold_text = textcolors.goldtext
Controls.GPTKeyBar:SetColor(gold_color)

local research_color = colors.steelblue
local research_text = textcolors.steelbluetext
Controls.ResearchKeyBar:SetColor(research_color)

local resource_color = colors.green
local resource_text = textcolors.greentext
Controls.ResourceKeyBar:SetColor(resource_color)

local traderoute_color = colors.pink
local traderouteHalf_color = colors.lightpink
local traderoute_text = textcolors.pinktext
Controls.TradeRouteKeyBar:SetColor(traderoute_color)
Controls.TradeRouteOneKeyBar:SetColor(traderouteHalf_color)

Controls.TradeRouteKey:SetHide(false)

local export_text = textcolors.purpletext
local import_text = textcolors.orangetext

-- This table keeps track of the connector counts between two icons. Also have a max value
-- in here that's set by the external program that generates the XML for the connectors.
local connectorCount = {}
local maxConnections = 5

-- Tables to keep track of civ icon and key selection state.
local civSelected = {}
local keySelected = {}

-- The last view select is held here. Initialized to the political view.
local lastView = "political"

-- Global deal place holder
-- local m_Deal = UI.GetScratchDeal()

-- Controls for the various keys are kept in keyBarControls and referenced later on by
-- keyBarHandler(). keyBarControls is set up in initkeySelected()
local keyBarControl = {}
local keyBarExtControl = {}

-- Various keys that we're displaying
local keyType = {}
	keyType.borders = 1
	keyType.denounce = 2
	keyType.DoF = 6
	keyType.defensive = 4
	keyType.war = 5
	keyType.traderoute = 3 -- problems with array require it to have such a low number
	keyType.GPT = 7
	keyType.resource = 8
	keyType.research = 9
	
-- Global table that holds icon positions for each civ. Initialized when the game is loaded
-- and referenced through getIconPosition().
local iconPositionTable = {}

function initIconPositions()
	local count = getAllCivCount()
	local iconDistance = iconCount/count

	local iconPosition = 0
  
	for iPlayerLoop = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		iconPositionTable[iPlayerLoop] = nil    -- init everybody to non-existant position
		
		if not Players[iPlayerLoop]:IsMinorCiv() and Players[iPlayerLoop]:IsEverAlive() then
			local thisIcon = math.floor(iconPosition + .5)   -- the + .5 rounds the number instead of a straight floor
			--logger:trace("iconPosition = " .. iconPosition .. ", thisIcon = " .. thisIcon .. ", iconDistance = " .. iconDistance)     

			iconPositionTable[iPlayerLoop] = thisIcon
			iconPosition = iconPosition + iconDistance
		end
	end
end
initIconPositions()

-- Initialize the civ selections
function initCivSelected()
	for pid = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		civSelected[pid] = false
	end
end
initCivSelected()

-- Initialize the key selections and keyBarControls
function initKeySelected()
	-- Political Keys
	keySelected[keyType.war] = false
	keyBarControl[keyType.war] = Controls.WarKeyBar
	
	keySelected[keyType.defensive] = false
	keyBarControl[keyType.defensive] = Controls.DefensiveKeyBar
	
	keySelected[keyType.denounce] = false
	keyBarControl[keyType.denounce] = Controls.DenounceKeyBar
	keyBarExtControl[keyType.denounce] = Controls.DenounceOneKeyBar
	
	keySelected[keyType.DoF] = false
	keyBarControl[keyType.DoF] = Controls.DoFKeyBar
	
	keySelected[keyType.borders] = false
	keyBarControl[keyType.borders] = Controls.BordersKeyBar
	keyBarExtControl[keyType.borders] = Controls.BordersOneKeyBar
	
	-- Economic Keys
	keySelected[keyType.traderoute] = false
	keyBarControl[keyType.traderoute] = Controls.TradeRouteKeyBar
	keyBarExtControl[keyType.traderoute] = Controls.TradeRouteOneKeyBar
	
	keySelected[keyType.GPT] = false
	keyBarControl[keyType.GPT] = Controls.GPTKeyBar
	
	keySelected[keyType.resource] = false
	keyBarControl[keyType.resource] = Controls.ResourceKeyBar
	
	keySelected[keyType.research] = false
	keyBarControl[keyType.research] = Controls.ResearchKeyBar
end
initKeySelected()

-- Returns the icon position of a given civ
function getIconPosition(pid)
	local pos = iconPositionTable[pid]
	--logger:trace(pid .. " is at position " .. pos)
	return pos
end

-- This handler acts as a toggle when the civ icon is selected. Selection
-- state is held in the civSelected table and selecting the civ icon
-- causes the current view to rebuild. Special pid of -1 does nothing (this
-- is for dead civs).
function civIconButtonHandler(pid)
	if pid == -1 then
		return false
	end

	--logger:debug("Toggling civ " .. pid)

	local icon = getIconPosition(pid)

	if civSelected[pid] == true then
		civSelected[pid] = false
	else
		civSelected[pid] = true
	end

	BuildView(lastView)
end

--Aristos
function civIconDiploHandler(pid)
	UI.SetRepeatActionPlayer(pid)
    UI.ChangeStartDiploRepeatCount(1)
	Players[pid]:DoBeginDiploWithHuman()
end

-- Mimics the Military Advisor's comments on relative power using the same formulas
-- glider1, Aristos
function getMilitaryPowerText(iPlayer)
	local basePower = 30
	local errorFactor = Game.Rand(21, "+/-10% factor for measurement error") - 10
	local ourPower = basePower + Players[Game.GetActivePlayer()]:GetMilitaryMight()
	local hisPower = basePower + Players[iPlayer]:GetMilitaryMight()
	hisPower = ((hisPower * errorFactor) / 100) + hisPower
	local milRatio =  100 * hisPower / ourPower
	
	if milRatio >= 185 then
		return L("TXT_KEY_DO_GR_IMMENSE")
	elseif milRatio >= 160 then
		return L("TXT_KEY_DO_GR_POWERFUL")
	elseif milRatio >= 135 then
		return L("TXT_KEY_DO_GR_STRONG")
	elseif milRatio >= 110 then
		return L("TXT_KEY_DO_GR_SIGNIFICANT")
	elseif milRatio >= 90 then
		return L("TXT_KEY_DO_GR_SIMILAR")
	elseif milRatio >= 70 then
		return L("TXT_KEY_DO_GR_INFERIOR")
	elseif milRatio >= 50 then
		return L("TXT_KEY_DO_GR_WEAK")
	elseif milRatio >= 30 then
		return L("TXT_KEY_DO_GR_POOR")
	else
		return L("TXT_KEY_DO_GR_PATHETIC")
	end
end

-- Unhide all the icons for the civs that we have met and set the button handlers for each
-- of the icons. Also checks to see if frames need to be drawn for selected icons.
function showVisibleCivIcons()
	for iPlayerLoop = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		-- needed to make icons clickable to call diplomacy
		if Players[iPlayerLoop]:IsEverAlive() then
			local thisIcon = getIconPosition(iPlayerLoop)
			local iconcontrol = Controls["IARelIcon-" .. thisIcon]
			local framecontrol = Controls["IARelIconFrame-" .. thisIcon]

			iconcontrol:SetHide(false)
			SimpleCivIconHookup(iPlayerLoop, 64, iconcontrol)

			-- Dim the icon if the civ is dead
			if not Players[iPlayerLoop]:IsAlive() then
				iconcontrol:SetAlpha(.2)
			else
				iconcontrol:SetAlpha(1)
			end
      
			-- makes icon a diplo button - Aristos
			if not hasMetCiv(iPlayerLoop) then
				iconcontrol:SetAlpha(.0)
			end

			local buttonarg = iPlayerLoop
			
			if not Players[iPlayerLoop]:IsAlive() then
				buttonarg = -1
				framecontrol:SetHide(true)
			end

			local buttoncontrol = Controls["IARelIconButton-" .. thisIcon]
			
			buttoncontrol:SetVoid1(buttonarg)
			buttoncontrol:RegisterCallback(Mouse.eLClick, civIconButtonHandler)
			
			-- makes icon a diplo button if not human - Aristos
			if Players[iPlayerLoop]:IsAlive() and not Players[iPlayerLoop]:IsHuman() then
				buttoncontrol:RegisterCallback(Mouse.eRClick, civIconDiploHandler)
			end  
			
			if civSelected[iPlayerLoop] == true then
				framecontrol:SetHide(false)
			else
				framecontrol:SetHide(true)
			end
		end
	end
end

-- Main view handler for building connections and tooltips. 
function BuildView(view)
	--logger:debug("Building view: " .. view)
	local totaltimer = os.clock()

	showVisibleCivIcons()
	keyBarHandler()
	selectionResetShowHide()

	if view == "political" then
		politicalView()
	elseif view == "economic" then
		economicView()
	end

	lastView = view
	--logger:info("Total time to build " .. view .. " view: " .. elapsedTime(totaltimer))
end

-- Switch to the political relations view
function politicalView()
	resetAllConnections()
	resetAllTooltips()

	local tooltipPad = "[NEWLINE]   "

	-- Tables to hold values for tooltip building. I probably could have done this in a smarter, cleaner
	-- way but, meh, this is good enough.
	local tooltipData = {}
	tooltipData["war"] = {}
	tooltipData["defensive"] = {}
	tooltipData["DoF"] = {}
	tooltipData["borders"] = {}
	tooltipData["denounce"] = {}
	local speed = GameInfo.GameSpeeds[ PreGame.GetGameSpeed() ]
	local relationDuration = speed.RelationshipDuration

	-- Some political states are uni-directional but we only want to draw one line between
	-- the civs if there is a mutual state between two civs. These tables keep track if
	-- that line has been drawn or not.
	local openBordersDrawn = {}
	local denounceDrawn = {}

	for thisPid = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		if hasMetCiv(thisPid) and Players[thisPid]:IsAlive() then
			if tooltipData["war"][thisPid] == nil then
				tooltipData["war"][thisPid] = ""
				tooltipData["defensive"][thisPid] = ""
				tooltipData["DoF"][thisPid] = ""
				tooltipData["borders"][thisPid] = ""
				tooltipData["denounce"][thisPid] = ""
			end

			for targetPid = thisPid + 1, GameDefines.MAX_MAJOR_CIVS-1, 1 do
				if hasMetCiv(targetPid) and Players[targetPid]:IsAlive() then
					if tooltipData["war"][targetPid] == nil then
						tooltipData["war"][targetPid] = ""
						tooltipData["defensive"][targetPid] = ""
						tooltipData["DoF"][targetPid] = ""
						tooltipData["borders"][targetPid] = ""
						tooltipData["denounce"][targetPid] = ""
					end

					local thisPlayer = Players[thisPid]
					local thisTid = thisPlayer:GetTeam()
					local thisTeam = Teams[thisTid]

					local targetPlayer = Players[targetPid]
					local targetTid = targetPlayer:GetTeam()
					local targetTeam = Teams[targetTid]
					local isHuman = (thisPid == Game.GetActivePlayer() or targetPid == Game.GetActivePlayer()) --RJG

					local thisName = L(GameInfo.Civilizations[ thisPlayer:GetCivilizationType() ].ShortDescription)
					local targetName = L(GameInfo.Civilizations[ targetPlayer:GetCivilizationType() ].ShortDescription)

					--logger:debug("Checking " .. thisName .. " against " .. targetName .. " for political relationships")

					if thisTeam:IsAtWar(targetTid) and isKeySelected(keyType.war) then
						showConnector(thisPid, targetPid, war_color)
				
						if (isCivSelected(thisPid) or isCivSelected(targetPid)) then
							tooltipData["war"][thisPid] = tooltipData["war"][thisPid] .. tooltipPad .. targetName
							tooltipData["war"][targetPid] = tooltipData["war"][targetPid] .. tooltipPad .. thisName
						end
						--logger:debug(thisName .. " is at war with " .. targetName)
					else
						-- Defensive Pact
						if thisTeam:IsDefensivePact(targetTid) and isKeySelected(keyType.defensive) and isHuman then
							showConnector(thisPid, targetPid, defensivePact_color)
				  
							if (isCivSelected(thisPid) or isCivSelected(targetPid)) then
								tooltipData["defensive"][thisPid] = tooltipData["defensive"][thisPid] .. tooltipPad .. targetName
								tooltipData["defensive"][targetPid] = tooltipData["defensive"][targetPid] .. tooltipPad .. thisName
							end
							--logger:debug(thisName .. " has a defensive pact with " .. targetName)
						end

						-- Friendship
						if thisPlayer:IsDoF(targetPid) and isKeySelected(keyType.DoF) then
							showConnector(thisPid, targetPid, DoF_color)
					
							if isCivSelected(thisPid) or isCivSelected(targetPid) then
								tooltipData["DoF"][thisPid] = tooltipData["DoF"][thisPid] .. tooltipPad .. targetName
								tooltipData["DoF"][targetPid] = tooltipData["DoF"][targetPid] .. tooltipPad .. thisName

								local turnsLeft
					
								if(thisPlayer.GetDoFCounter ~= nil) then
									turnsLeft = relationDuration - thisPlayer:GetDoFCounter(targetPid)--GameDefines.DOF_EXPIRATION_TIME - thisPlayer:GetDoFCounter(targetPid)
									tooltipData["DoF"][thisPid] = tooltipData["DoF"][thisPid] .. " (" .. turnsLeft .. ")"
									tooltipData["DoF"][targetPid] = tooltipData["DoF"][targetPid] .. " (" .. turnsLeft .. ")"
								end
							end
							--logger:debug(thisName .. " has declared friendship with " .. targetName)
						end

						-- open borders can be one-sided so we check both directions. Connectors are drawn regardless if it's
						-- mutual or not but the tooltips should show who is opening borders to whom.
						if isKeySelected(keyType.borders) then
							if thisTeam:IsAllowsOpenBordersToTeam(targetTid) then
								if isCivSelected(thisPid) or isCivSelected(targetPid) then
									tooltipData["borders"][thisPid] = tooltipData["borders"][thisPid] .. tooltipPad .. targetName
								end
								--logger:debug(thisName .. " is opening borders to " .. targetName)
							end

							if targetTeam:IsAllowsOpenBordersToTeam(thisTid) then
								if isCivSelected(thisPid) or isCivSelected(targetPid) then
									tooltipData["borders"][targetPid] = tooltipData["borders"][targetPid] .. tooltipPad .. thisName
								end
								--logger:debug(targetName .. " has opening borders to " .. thisName)
							end

							local firstPid = thisPid
							local secondPid = targetPid
              
							if firstPid > secondPid then
								firstPid = toPid
								secondPid = fromPid
							end

							local bordercheck = firstPid .. "-" .. secondPid
							
							if (thisTeam:IsAllowsOpenBordersToTeam(targetTid) or targetTeam:IsAllowsOpenBordersToTeam(thisTid)) and openBordersDrawn[bordercheck] == nil then
								if thisTeam:IsAllowsOpenBordersToTeam(targetTid) and targetTeam:IsAllowsOpenBordersToTeam(thisTid) then
									showConnector(thisPid, targetPid, openBorders_color)
								else
									showConnector(thisPid, targetPid, openBordersHalf_color)
								end

								openBordersDrawn[bordercheck] = true
							end
						end

						-- Like open borders, denouncements get checked in both directions but only one line is drawn
						if isKeySelected(keyType.denounce) then
							if thisPlayer:IsDenouncedPlayer(targetPid) then
								if isCivSelected(thisPid) or isCivSelected(targetPid) then
									tooltipData["denounce"][thisPid] = tooltipData["denounce"][thisPid] .. tooltipPad .. targetName

									local turnsleft
						
									if Players[thisPid].GetDenouncedPlayerCounter ~= nil then
										turnsLeft = relationDuration - Players[thisPid]:GetDenouncedPlayerCounter(targetPid)--GameDefines.DENUNCIATION_EXPIRATION_TIME - Players[thisPid]:GetDenouncedPlayerCounter(targetPid)
										tooltipData["denounce"][thisPid] = tooltipData["denounce"][thisPid] .. " (" .. turnsLeft .. ")"
									end
								end
								--logger:debug(thisName .. " has denounced " .. targetName)
							end

							if targetPlayer:IsDenouncedPlayer(thisPid) then
								if isCivSelected(thisPid) or isCivSelected(targetPid) then
									tooltipData["denounce"][targetPid] = tooltipData["denounce"][targetPid] .. tooltipPad .. thisName

									local turnsleft
						
									if Players[targetPid].GetDenouncedPlayerCounter ~= nil then
										turnsLeft = relationDuration - Players[targetPid]:GetDenouncedPlayerCounter(thisPid)--GameDefines.DENUNCIATION_EXPIRATION_TIME - Players[targetPid]:GetDenouncedPlayerCounter(thisPid)
										tooltipData["denounce"][targetPid] = tooltipData["denounce"][targetPid] .. " (" .. turnsLeft .. ")"
									end
								end
								--logger:debug(targetName .. " has denounced " .. thisName)
							end

							local firstPid = thisPid
							local secondPid = targetPid
              
							if firstPid > secondPid then
								firstPid = toPid
								secondPid = fromPid
							end

							local denouncecheck = firstPid .. "-" .. secondPid

							if (thisPlayer:IsDenouncedPlayer(targetPid) or targetPlayer:IsDenouncedPlayer(thisPid)) and denounceDrawn[denouncecheck] == nil then
								if thisPlayer:IsDenouncedPlayer(targetPid) and targetPlayer:IsDenouncedPlayer(thisPid) then
									showConnector(thisPid, targetPid, denounce_color)
								else
									showConnector(thisPid, targetPid, denounceHalf_color)
								end

								denounceDrawn[denouncecheck] = true
							end
						end
					end
				end
			end
		end
	end

	-- Now that we've collected all the data, tooltips can be built
	for thisPid = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		if (tooltipData["war"][thisPid] ~= nil) then
			--logger:debug("Building tooltip for " .. thisPid)
			local str = ""

			-- First, the main civ name
			str = str .. "[COLOR_POSITIVE_TEXT]" .. getFullLeaderTitle(thisPid) .. "[ENDCOLOR]"
		
			-- adds tool tip information - glider1
			str = str .. getCivSummaryToolTip(thisPid)

			-- Any wars?
			if (tooltipData["war"][thisPid] ~= "") then
				str = str .. "[NEWLINE]" .. war_text .. L("TXT_KEY_DO_GR_RELATIONKEY_WAR") .. ":[ENDCOLOR] " .. tooltipData["war"][thisPid]
			end

			-- Defensive pacts
			if (tooltipData["defensive"][thisPid] ~= "") then
				str = str .. "[NEWLINE]" .. defensivePact_text .. L("TXT_KEY_DO_GR_RELATIONKEY_DEFENSIVE_PACT") .. ":[ENDCOLOR] " .. tooltipData["defensive"][thisPid]
			end

			-- Declaration of Friendship
			if (tooltipData["DoF"][thisPid] ~= "") then
				str = str .. "[NEWLINE]" .. DoF_text .. L("TXT_KEY_DO_GR_RELATIONKEY_DECLARATION_OF_FRIENDSHIP") .. ":[ENDCOLOR] " .. tooltipData["DoF"][thisPid]
			end

			-- Open Borders?
			if (tooltipData["borders"][thisPid] ~= "") then
				str = str .. "[NEWLINE]" .. openBorders_text .. L("TXT_KEY_DO_GR_RELATIONKEY_OPEN_BORDERS") .. ":[ENDCOLOR] " .. tooltipData["borders"][thisPid]
			end

			-- Denouncements
			if (tooltipData["denounce"][thisPid] ~= nil and tooltipData["denounce"][thisPid] ~= "") then
				str = str .. "[NEWLINE]" .. denounce_text .. L("TXT_KEY_DO_GR_RELATIONKEY_DENOUNCEMENT") .. ":[ENDCOLOR] " .. tooltipData["denounce"][thisPid]
			end

			local icon = getIconPosition(thisPid)
			local iconname = "IARelIconButton-" .. icon
			local iconcontrol = Controls[iconname]
			iconcontrol:SetToolTipString(str)

			--logger:debug("Tooltip: " .. str)
		end
	end
end

function getCivSummaryToolTip(iPlayer)
	local str = "[NEWLINE]"
	local tooltipPad = "[NEWLINE]   "
	local pActiveTeam = Teams[Game.GetActiveTeam()]
	local pTeam = Players[iPlayer]:GetTeam()
	--str = str .. "[NEWLINE]" .. Players[iPlayer]:GetName()
	
	if iPlayer ~= 0 then
		local approachID = Players[0]:GetApproachTowardsUsGuess(iPlayer)
		local statusIcon = ""
		local statusColor = ""
		local statusTip = ""
		
		if not pActiveTeam:IsAtWar(pTeam) then
			if approachID == MajorCivApproachTypes.MAJOR_CIV_APPROACH_HOSTILE then
				statusIcon	= "[ICON_HAPPINESS_4]"
				statusColor	= "[COLOR_CULTURE_STORED]"
				statusTip	= L("TXT_KEY_DO_GR_HOSTILE")
			elseif approachID == MajorCivApproachTypes.MAJOR_CIV_APPROACH_GUARDED then
				statusIcon	= "[ICON_HAPPINESS_3]"
				statusColor	= "[COLOR_YELLOW]"
				statusTip	= L("TXT_KEY_DO_GR_GUARDED")
			elseif approachID == MajorCivApproachTypes.MAJOR_CIV_APPROACH_AFRAID then
				statusIcon	= "[ICON_HAPPINESS_3]"
				statusColor	= "[COLOR_PLAYER_ORANGE_TEXT]"
				statusTip	= L("TXT_KEY_DO_GR_AFRAID")
			elseif approachID == MajorCivApproachTypes.MAJOR_CIV_APPROACH_FRIENDLY then
				statusIcon	= "[ICON_HAPPINESS_1]"
				statusColor	= "[COLOR_GREEN]"
				statusTip	= L("TXT_KEY_DO_GR_FRIENDLY")
			else
				statusIcon	= "[ICON_HAPPINESS_2]"
				statusColor	= "[COLOR_WHITE]"
				statusTip	= L("TXT_KEY_DO_GR_NEUTRAL_STANCE")
			end
		else
			statusIcon	= "[ICON_WAR]"
			statusColor	= "[COLOR_RED]"
			statusTip	= L("TXT_KEY_DO_GR_AT_WAR")
		end

		str = str .. L("TXT_KEY_DO_GR_STANCE") .. " " .. statusColor  .. statusTip .. " " .. statusIcon
	else
		str = str .. L("TXT_KEY_DO_GR_OUR_EMPIRE")
	end

	str = str .. "[NEWLINE]" .. "[COLOR_LIGHT_GREY]" .. L("TXT_KEY_DO_GR_SCORE") ..  " [COLOR_WHITE]" .. Players[iPlayer]:GetScore().. "[ENDCOLOR]"
	str = str .. "[NEWLINE]" .. "[COLOR_LIGHT_GREY]" .. L("TXT_KEY_DO_GR_ERA") ..  " [COLOR_WHITE]" .. L(GameInfo.Eras[Players[iPlayer]:GetCurrentEra()].Description) .. "[ENDCOLOR]"

	-- Technologies
	if Game.GetActivePlayer() ~= iPlayer then
		local pActiveTeam = Teams[Game.GetActivePlayer()]
		local pOtherPlayer = Players[iPlayer]
		local iOtherTeam = pOtherPlayer:GetTeam()
		local pOtherTeam = Teams[iOtherTeam]
		
		local iOtherTeamTechnologies = pOtherTeam:GetTeamTechs():GetNumTechsKnown()
		local iActiveTeamTechnologies = pActiveTeam:GetTeamTechs():GetNumTechsKnown()
		local iDifference = iOtherTeamTechnologies - iActiveTeamTechnologies

		local strText = "[NEWLINE][COLOR_LIGHT_GREY]" .. L("TXT_KEY_DO_GR_TECHNOLOGY") .. "[ENDCOLOR]"
		strText = strText .. " [COLOR_WHITE]" .. iOtherTeamTechnologies .. (" (%+2g)[ENDCOLOR]"):format(iDifference)
		
		str = str .. strText 
	end

	if not pActiveTeam:IsAtWar(pTeam) then
		str = str .. "[NEWLINE]" .. "[COLOR_LIGHT_GREY]" .. L("TXT_KEY_DO_GR_INCOME") .. " [COLOR_WHITE]" .. Players[iPlayer]:GetGold() .. ("[ICON_GOLD] (%+2g[ICON_GOLD]/"):format(Players[iPlayer]:CalculateGoldRate()) .. L("TXT_KEY_DO_GR_TURN") .. ")[ENDCOLOR]"
	end

	if Game.GetActivePlayer() ~= iPlayer then
		str = str .. "[NEWLINE]" .. "[COLOR_LIGHT_GREY]" .. L("TXT_KEY_DO_GR_MILITARY") .. " " .. getMilitaryPowerText(iPlayer) .. "[ENDCOLOR]"
	end

	-- Policies
	if Game.GetActivePlayer() ~= iPlayer then
		local pOtherPlayer = Players[iPlayer]
		local strText = "[NEWLINE]" .. "[COLOR_CULTURE_STORED]" .. L("TXT_KEY_DO_GR_POLICY") .. "[ENDCOLOR]"
		
		for pPolicyBranch in GameInfo.PolicyBranchTypes() do
			local iPolicyBranch = pPolicyBranch.ID	
			local iCount = 0
					
			for pPolicy in GameInfo.Policies() do
				local iPolicy = pPolicy.ID
						
				if pPolicy.PolicyBranchType == pPolicyBranch.Type then
					if pOtherPlayer:HasPolicy(iPolicy) then
						iCount = iCount + 1
					end
				end
			end
					
			if iCount > 0 then
				--local textControls = {}
				--ContextPtr:BuildInstanceForControl("LTextEntry", textControls, controlTable.PoliciesStack)
				strText = strText .. tooltipPad .. L(pPolicyBranch.Description) .. ": " .. iCount
				--textControls.Text:SetText(strText)
			end
		end

		str = str .. strText 
	end

	return str
end

function economicView()
	resetAllConnections()
	resetAllTooltips()

	local tooltipPad = "[NEWLINE]   "
	local iconPad = "  "

	-- Build tables of strings that hold all active trade deal details. We also have an
	-- "already seen" table so that we do not list the same trade multiple times in a tooltip.
	local exports = {}
	local imports = {}
	local research = {}
	local traderoutes = {}
	local alreadyseen = {}

	local thisTurn = Game.GetGameTurn()


	-- Loops through all current trade deals for all visible players. Turn on connectors
	-- where appropriate and start building export and import strings for the tooltips.
	--
	-- The looping is really kinda messed up because it appears the UI:GetNumCurrentDeals(pid)
	-- is broken. No matter what player ID you feed it, it will return the number of current
	-- deals for player 0. So, to get around this, I'm using something I noticed:
	-- UI.LoadCurrentDeal() leaves the current state of m_Deal alone if you ask for a deal that
	-- doesn't exist. So, I loop over all the civs, loading successive deals until I start getting
	-- repeats. Once I know that's done, I move on the the next civ. As a side effect of my little
	-- hack, I have to put in a loop stopper just in case there are no deals whatsoever (which is
	-- always the case right at the beginning of a game). I figure 20 deals per visible civ is high
	-- enough to prevent premature cutoff but still give good performance.

	local hackGuardPissed = getVisibleCivCount() * 20
	local maxRepeats = 10

	for thisPid = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		if hasMetCiv(thisPid) and Players[thisPid]:IsAlive() then
			--logger:debug("Looking at thisPid = " .. thisPid .. " for active trade deals")
			local repeatcheck = false
			local repeatchecktable = {}
			local dealIterator = 0
			local hackGuard = 0

			if repeatcheck == false and hackGuard < hackGuardPissed then
				repeat
					local itemType
					local duration
					local finalTurn
					local data1
					local data2
					local data3
					local flag1
					local fromPidDeal
					local m_Deal = UI.GetScratchDeal()

					UI.LoadCurrentDeal(thisPid, dealIterator)
					local otherPid = m_Deal:GetOtherPlayer()

					dealIterator = dealIterator + 1
					hackGuard = hackGuard + 1

					--logger:debug("Looking at deal " .. dealIterator .. " with thisPid = " .. thisPid)

					m_Deal:ResetIterator()

					itemType, duration, finalTurn, data1, data2, data3, flag1, fromPidDeal = m_Deal:GetNextItem()

					-- For some reason, deals get loaded that don't include the player that we're looking at. Let's skip
					-- those.
					local fromCheck = m_Deal:GetFromPlayer()
					local toCheck = m_Deal:GetToPlayer()
					local thisCheckFail = false

					if fromCheck ~= thisPid and toCheck ~= thisPid then
						--logger:trace("Check fail:  fromCheck = " .. fromCheck .. ", toCheck = " .. toCheck .. ", thisPid = " .. thisPid)
						thisCheckFail = true
					end

					if itemType ~= nil and thisCheckFail == false then
						repeat
							local toPid = thisPid
							local fromPid = otherPid

							if fromPidDeal == thisPid then
								toPid = otherPid
								fromPid = thisPid
							end

							local repeatcheckstr = itemType .. "-" .. finalTurn .. "-" .. duration .. "-" .. data1 .. "-" .. fromPid .. "-" .. toPid
          
							--logger:trace("   " .. repeatcheckstr)
							if (repeatchecktable[repeatcheckstr] == nil) then
								repeatchecktable[repeatcheckstr] = 1
							elseif (repeatchecktable[repeatcheckstr] > maxRepeats) then
								repeatcheck = true
								--logger:debug("Repeat detected: hackGuard = " .. hackGuard .. ", thisPid = " .. thisPid)
							else
								repeatchecktable[repeatcheckstr] = repeatchecktable[repeatcheckstr] + 1
							end 

							-- Not sure what a trade to yourself is all about but it seems like I have to check
							-- for it anyway.

							if toPid ~= fromPid then
								-- Check to initialize tooltip string if needed
								if (exports[toPid] == nil)     then exports[toPid] = {} end
								if (imports[toPid] == nil)     then imports[toPid] = {} end
								if (research[toPid] == nil)    then research[toPid] = "" end
								if (exports[fromPid] == nil)   then exports[fromPid] = {} end
								if (imports[fromPid] == nil)   then imports[fromPid] = {}  end
								if (research[fromPid] == nil)  then research[fromPid] = "" end

								local toPlayer = Players[toPid]
								local fromPlayer = Players[fromPid]
								local isHuman = (fromPid == Game.GetActivePlayer() or toPid == Game.GetActivePlayer()) --RJG
    
								local toName = L( GameInfo.Civilizations[ toPlayer:GetCivilizationType() ].ShortDescription )
								local fromName = L( GameInfo.Civilizations[ fromPlayer:GetCivilizationType() ].ShortDescription )

								--logger:debug("  Looking at trade from " .. fromName .. " to " .. toName .. " itemType = " .. itemType)

								if hasMetCiv(fromPid) and Players[fromPid]:IsAlive() and hasMetCiv(toPid) and Players[toPid]:IsAlive() then
									local turnsLeft = finalTurn - thisTurn
									--logger:trace("   finalTurn: " .. finalTurn .. ", thisTurn: " .. thisTurn)

									-- Deal is for gold per turn
									if TradeableItems.TRADE_ITEM_GOLD_PER_TURN == itemType and isHuman then             
										local goldamount = data1
										local exportstr = tooltipPad .. "[ICON_GOLD]" .. iconPad .. goldamount .. " " .. L("TXT_KEY_DO_GR_TT_GPT_TO") .. " " .. toName .. " (" .. turnsLeft .. ")"
										local importstr = tooltipPad .. "[ICON_GOLD]" .. iconPad .. goldamount .. " " .. L("TXT_KEY_DO_GR_TT_GPT_FROM") .. " " .. fromName .. " (" .. turnsLeft .. ")"

										--logger:debug("   " .. exportstr)
										--logger:debug("   " .. importstr)
                
										if (isCivSelected(fromPid) or isCivSelected(toPid)) and isKeySelected(keyType.GPT) then
											exports[fromPid][exportstr] = turnsLeft
										end

										if (isCivSelected(fromPid) or isCivSelected(toPid)) and isKeySelected(keyType.GPT) then
											imports[toPid][importstr] = turnsLeft
										end
                  
										local firstPid = fromPid
										local secondPid = toPid
										
										if firstPid > secondPid then
											firstPid = toPid
											secondPid = fromPid
										end

										local check = "gpt:" .. firstPid .. "-" .. secondPid
										
										if alreadyseen[check] ~= 1 then
											if isKeySelected(keyType.GPT) then
												showConnector(fromPid, toPid, gold_color)
											end
											
											alreadyseen[check] = 1
										end

									-- Deal is RA
									elseif TradeableItems.TRADE_ITEM_RESEARCH_AGREEMENT == itemType then     
										local exportstr = tooltipPad .. "[ICON_RESEARCH]" .. iconPad .. " " .. toName .. " (" .. turnsLeft .. ")"

										if alreadyseen[exportstr .. fromName] ~= 1 and (isCivSelected(fromPid) or isCivSelected(toPid)) and isKeySelected(keyType.research) then
											--logger:trace("   " .. exportstr .. " [fromName = " .. fromName .. ", toName = " .. toName .. ", thisPid = " .. thisPid .. "]")
											research[fromPid] = research[fromPid] .. exportstr
											alreadyseen[exportstr .. fromName] = 1
										end

										local firstPid = fromPid
										local secondPid = toPid
										
										if firstPid > secondPid then
											firstPid = toPid
											secondPid = fromPid
										end

										local check = "research:" .. firstPid .. "-" .. secondPid
										
										if alreadyseen[check] ~= 1 then
											if isKeySelected(keyType.research) then
												showConnector(fromPid, toPid, research_color)
											end

											alreadyseen[check] = 1
										end

									-- Deal is resources
									elseif TradeableItems.TRADE_ITEM_RESOURCES == itemType and isHuman then
										local resourceName = L(GameInfo.Resources[data1].Description)
										local iconstr = GameInfo.Resources[data1].IconString
										local exportstr = tooltipPad .. iconstr .. iconPad .. resourceName .. " " .. L("TXT_KEY_DO_GR_TT_TO") .. " " .. toName .. " (" .. turnsLeft .. ")"
										local importstr = tooltipPad .. iconstr .. iconPad .. resourceName .. " " .. L("TXT_KEY_DO_GR_TT_FROM") .. " " .. fromName .. " (" .. turnsLeft .. ")"

										-- Check to see if this is a strategic resource. If it is, the number traded is included in the
										-- tooltip.

										if GameInfo.Resources[data1].ResourceUsage == 1 then
											local amount = data2
											
											exportstr = tooltipPad .. iconstr .. iconPad .. data2 .. " " .. resourceName .. " " .. L("TXT_KEY_DO_GR_TT_TO") .. " " .. toName .. " (" .. turnsLeft .. ")"
											importstr = tooltipPad .. iconstr .. iconPad .. data2 .. " " .. resourceName .. " " .. L("TXT_KEY_DO_GR_TT_FROM") .. " " .. fromName .. " (" .. turnsLeft .. ")"
										end

										--logger:debug("   " .. exportstr)
										--logger:debug("   " .. importstr)

										if (isCivSelected(fromPid) or isCivSelected(toPid)) and isKeySelected(keyType.resource) then
											exports[fromPid][exportstr] = turnsLeft
										end

										if (isCivSelected(fromPid) or isCivSelected(toPid)) and isKeySelected(keyType.resource) then
											imports[toPid][importstr] = turnsLeft
										end

										local firstPid = fromPid
										local secondPid = toPid
										
										if firstPid > secondPid then
											firstPid = toPid
											secondPid = fromPid
										end

										local check = "resource:" .. firstPid .. "-" .. secondPid
			
										if alreadyseen[check] ~= 1 then
											if isKeySelected(keyType.resource) then
												showConnector(fromPid, toPid, resource_color)
											end

											alreadyseen[check] = 1
										end
									end
								end
							end

							itemType, duration, finalTurn, data1, data2, data3, flag1, fromPidDeal = m_Deal:GetNextItem()
			
						until( itemType == nil )
					end

					if hackGuard > hackGuardPissed then
						--logger:debug("SUP SUP, I'm the hack guard!  hackGuard = " .. hackGuard .. ", hackGuardPissed = " .. hackGuardPissed)
					end

				until(repeatcheck == true or hackGuard > hackGuardPissed)
			end
		end
	end

	-- Grab the data for any established trade routes and show connectors for them. Build strings for the tooltips
	-- while we're at it.

	-- color checker for one-sided trade routes
	local colorPlayerTable = {}
	
	for thisPid = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		colorPlayerTable[thisPid] = {}

		if hasMetCiv(thisPid) and Players[thisPid]:IsAlive() then 
			local thisPlayer = Players[thisPid]
			--logger:debug("Looking at thisPid = " .. thisPid .. " for established trade routes")

			local tradeRoutesTable = thisPlayer:GetTradeRoutes()
			
			for i = 1, table.count(tradeRoutesTable), 1 do
				local toPid = tradeRoutesTable[i].ToID
				local toPlayer = Players[toPid]
				local toName = L( GameInfo.Civilizations[ toPlayer:GetCivilizationType() ].ShortDescription )
				local isHuman = (thisPid == Game.GetActivePlayer() or toPid == Game.GetActivePlayer()) --RJG

				if not toPlayer:IsMinorCiv() and toPlayer:IsEverAlive() and hasMetCiv(toPid) and thisPid ~= toPid and isHuman then
					local turnsLeft = tradeRoutesTable[i].TurnsLeft
					local gold = math.floor(tradeRoutesTable[i].FromGPT / 100)
					local science = math.floor(tradeRoutesTable[i].FromScience / 100)
					local str = tooltipPad .. "[ICON_TURNS_REMAINING]" .. iconPad .. toName .. "," .. iconPad

					if gold > 0 then
						str = str .. gold .. "[ICON_GOLD]"
					end

					-- Comma if both are listed
					if gold > 0 and science > 0 then
						str = str .. "," .. iconPad
					end

					if science > 0 then
						str = str .. science .. "[ICON_RESEARCH]"
					end

					-- nice space padding and the number of turns left
					str = str .. iconPad .. "(" .. turnsLeft .. ")"
					
					colorPlayerTable[thisPid][toPid] = true
					
					if (isCivSelected(thisPid) or isCivSelected(toPid)) and isKeySelected(keyType.traderoute) then
						if traderoutes[thisPid] == nil then
							traderoutes[thisPid] = {}
						end
						
						traderoutes[thisPid][str] = turnsLeft
						--logger:debug("traderoute string = " .. str)
					end

					-- Show connector
					local firstPid = thisPid
					local secondPid = toPid
					
					if firstPid > secondPid then
						firstPid = toPid
						secondPid = thisPid
					end

					local check = "traderoute:" .. firstPid .. "-" .. secondPid
					print("TRADE_ROUTES", check)	
					if alreadyseen[check] ~= 1 then
						if isKeySelected(keyType.traderoute) then
							if colorCheckerA and colorCheckerB then
								--showConnector(thisPid, toPid, traderoute_color)
							elseif colorCheckerA or colorCheckerB then
								--showConnector(thisPid, toPid, traderouteHalf_color)
							end
						end

						alreadyseen[check] = 1
					end
				end
			end
		end
	end
	
	for first, innertable in pairs(colorPlayerTable) do
		for second, value in pairs(innertable) do
			print(first, second, value);
			if colorPlayerTable[first][second] and colorPlayerTable[second][first] then
				print("SETTING_CONNECTIONS_MUTUAL")
				showConnector(first, second, traderoute_color)
				colorPlayerTable[first][second] = false
				colorPlayerTable[second][first] = false
			elseif colorPlayerTable[first][second] then
				print("SETTING_CONNECTIONS_ONE_SIDED")
				showConnector(first, second, traderouteHalf_color)
			end
		end
	end
	
	-- Now that we've collected all the data, tooltips can be built. First, we build the export and import
	-- strings from a sorted version of the export and import tables.
	for thisPid = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		if hasMetCiv(thisPid) and Players[thisPid]:IsAlive() then
			function sortExportsByTurnsLeft(a, b)
				return exports[thisPid][a] < exports[thisPid][b]
			end

			function sortImportsByTurnsLeft(a, b)
				return imports[thisPid][a] < imports[thisPid][b]
			end

			function sortTradeRoutesByTurnsLeft(a, b)
				return traderoutes[thisPid][a] < traderoutes[thisPid][b]
			end

			local exportstr = ""
			local importstr = ""
			local traderoutesstr = ""
    
			if exports[thisPid] ~= nil then
				local exportTable = {}
			
				for string, _ in pairs(exports[thisPid]) do table.insert(exportTable, string) end
				table.sort(exportTable, sortExportsByTurnsLeft)
				for _, string in ipairs(exportTable) do exportstr = exportstr .. string end
			end

			if imports[thisPid] ~= nil then
				local importTable = {}
				
				for string, _ in pairs(imports[thisPid]) do table.insert(importTable, string) end
				table.sort(importTable, sortImportsByTurnsLeft)
				for _, string in ipairs(importTable) do importstr = importstr .. string end
			end

			if traderoutes[thisPid] ~= nil then
				local traderouteTable = {}
				
				for string, _ in pairs(traderoutes[thisPid]) do table.insert(traderouteTable, string) end
				table.sort(traderouteTable, sortTradeRoutesByTurnsLeft)
				for _, string in ipairs(traderouteTable) do traderoutesstr = traderoutesstr .. string end
			end

			--logger:debug("Building tooltip for " .. thisPid)
			local str = ""

			-- First, the main civ name
			str = str .. "[COLOR_POSITIVE_TEXT]" .. getFullLeaderTitle(thisPid) .. "[ENDCOLOR]"

			-- Any exports?
			if exportstr ~= "" then
			str = str .. "[NEWLINE]" .. export_text .. L("TXT_KEY_DO_GR_TT_EXPORTS") .. ":[ENDCOLOR] " .. exportstr
			end

			-- Any imports?
			if importstr ~= "" then
				str = str .. "[NEWLINE]" .. import_text .. L("TXT_KEY_DO_GR_TT_IMPORTS") .. ":[ENDCOLOR] " .. importstr
			end

			-- Any trade routes?
			if traderoutesstr ~= "" then
				str = str .. "[NEWLINE]" .. traderoute_text .. L("TXT_KEY_DO_GR_TT_TRADEROUTES") .. ":[ENDCOLOR] " .. traderoutesstr
			end
			-- Any research?
			if research[thisPid] ~= nil and research[thisPid] ~= "" then
				str = str .. "[NEWLINE]" .. research_text .. L("TXT_KEY_DO_GR_TT_RESEARCH_AGREEMENTS") .. ":[ENDCOLOR] " .. research[thisPid]
			end

			local icon = getIconPosition(thisPid)
			local iconname = "IARelIconButton-" .. icon
			local iconcontrol = Controls[iconname]
			iconcontrol:SetToolTipString(str)

			--logger:debug("Tooltip: " .. str)

		end
	end
end

-- Given a pair of civs, illuminate their connector with the given color. This
-- function doesn't do any error checking on whether the civ actually exists or
-- not. Color is passed in as a vector4 color. The connectorCount table is checked
-- to see if more than one connection between icons is being asked for. If we go 
-- over the max connections between icons, a warning is spit out and no line
-- is drawn. Finally, this the point where the civSelected table is queried to see
-- if the lines should actually be drawn or not.
function showConnector(civ1, civ2, color)
	if not isCivSelected(civ1) and not isCivSelected(civ2) then
		return false
	end

	local icon1 = getIconPosition(civ1)
	local icon2 = getIconPosition(civ2)

	if icon1 > icon2 then
		local temp = icon1
		
		icon1 = icon2
		icon2 = temp
	end

	local cid = "iac" .. icon1 .. "-" .. icon2
	local count = connectorCount[cid]

	if count == nil then
		connectorCount[cid] = 0
		count = 0
	end

	if count > maxConnections - 1 then
		--logger:warn("Max connections between " .. icon1 .. " and " .. icon2 .. " has been reached")
		--logger:warn("Cannot draw a new line")
		return false
	end
  
	local connector = cid .. "." .. count
	--logger:debug("Unhiding " .. connector)
	local connectorcontrol = Controls[connector]
	connectorcontrol:SetHide(false)
	connectorcontrol:SetColor(color)

	connectorCount[cid] = connectorCount[cid] + 1
end

-- test function to turn on all visible civs' connections
function allConnectionsOn()
	--logger:warn("Turning on all visible civ connectors")
	local white = Vector4(1,1,1,1)

	for iThisCiv = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		if hasMetCiv(iThisCiv) then
			for iTargetCiv = iThisCiv + 1, GameDefines.MAX_MAJOR_CIVS-1, 1 do
				if hasMetCiv(iTargetCiv) then
					showConnector(iThisCiv, iTargetCiv, white)
				end
			end
		end
	end
end

-- Turn all connections off and clear the connectorCount table.
function resetAllConnections()
	--logger:debug("Hiding all connections")
	connectorCount = {}

	for firstIcon = 0, iconCount -1, 1 do
		for secondIcon = firstIcon + 1, iconCount - 1, 1 do
			for subid = 0, maxConnections-1, 1 do
				local connector = "iac" .. firstIcon .. "-" .. secondIcon .. "." .. subid
				local connectorcontrol = Controls[connector]
				
				connectorcontrol:SetHide(true)
			end
		end
	end
end

-- Reset all tooltips to nothing.
function resetAllTooltips()
	--logger:debug("Resetting icon tooltips")
	for icon = 0, iconCount -1, 1 do
		local iconname = "IARelIconButton-" .. icon
		local iconcontrol = Controls[iconname]

		iconcontrol:SetToolTipString("")
	end
end

-- Check to see if any icon at all has been selected.
function isAnyCivSelected()
	-- Checking icon selection 
	local check = false

	for pid, selected in ipairs(civSelected) do
		if selected == true then
			check = true
		end
	end

	return check
end

-- Check to see if a civ is selected. If no civs have been selected at all
-- this function always returns true.
function isCivSelected(pid)
	return (not isAnyCivSelected() or (isAnyCivSelected() and civSelected[pid]))
end


-- The OnKey function sets the selection state for the various types of keys
-- that can be selected from the bottom right corner.
function OnKey(key)
  --logger:debug("OnKey(" .. key .. ") just got called")
	if keySelected[key] == false then
		keySelected[key] = true
	else
		keySelected[key] = false
	end

	BuildView(lastView)
end

Controls.WarKeyButton:SetVoid1(keyType.war)
Controls.WarKeyButton:RegisterCallback( Mouse.eLClick, OnKey)

Controls.DefensiveKeyButton:SetVoid1(keyType.defensive)
Controls.DefensiveKeyButton:RegisterCallback( Mouse.eLClick, OnKey)

Controls.DenounceKeyButton:SetVoid1(keyType.denounce)
Controls.DenounceKeyButton:RegisterCallback( Mouse.eLClick, OnKey)

Controls.DoFKeyButton:SetVoid1(keyType.DoF)
Controls.DoFKeyButton:RegisterCallback( Mouse.eLClick, OnKey)

Controls.BordersKeyButton:SetVoid1(keyType.borders)
Controls.BordersKeyButton:RegisterCallback( Mouse.eLClick, OnKey)

Controls.ResearchKeyButton:SetVoid1(keyType.research)
Controls.ResearchKeyButton:RegisterCallback( Mouse.eLClick, OnKey)

Controls.TradeRouteKeyButton:SetVoid1(keyType.traderoute)
Controls.TradeRouteKeyButton:RegisterCallback( Mouse.eLClick, OnKey)

Controls.GPTKeyButton:SetVoid1(keyType.GPT)
Controls.GPTKeyButton:RegisterCallback( Mouse.eLClick, OnKey)

Controls.ResourceKeyButton:SetVoid1(keyType.resource)
Controls.ResourceKeyButton:RegisterCallback( Mouse.eLClick, OnKey)

-- Check to see if any key at all has been selected.
function isAnyKeySelected()
	-- Checking icon selection 
	local check = false

	for key, selected in ipairs(keySelected) do
		if selected == true then
			check = true
		end
	end

	return check
end

-- Check to see if a key is selected. If no keys are select at all, this function
-- will return true.
function isKeySelected(key)
	return (not isAnyKeySelected() or (isAnyKeySelected() and keySelected[key]))
end

-- Shows and hides the key bars based on whether they have been selected or not.
function keyBarHandler()
	for key, keyBarControl in ipairs(keyBarControl) do
		if isKeySelected(key) then
			keyBarControl:SetAlpha(1)
		else
			keyBarControl:SetAlpha(0)
		end
	end
	
	for key, keyBarExtControl in ipairs(keyBarExtControl) do
		if isKeySelected(key) then
			keyBarExtControl:SetAlpha(1)
		else
			keyBarExtControl:SetAlpha(0)
		end
	end
end

-- Shows or hides the reset button depending on whether anything selected.
function selectionResetShowHide()
	if isAnyKeySelected() or isAnyCivSelected() then
		Controls.SelectionResetButton:SetHide(false)
	else
		Controls.SelectionResetButton:SetHide(true)
	end
end

-- The SelectionResetButton will clear all reset states and redraws the last graph.
function OnSelectionReset()
	initKeySelected()
	initCivSelected()
	BuildView(lastView)
end
Controls.SelectionResetButton:RegisterCallback( Mouse.eLClick, OnSelectionReset)

-- The OnStuff functions register the buttons at the bottom of the screen to
-- draw the appropriate graphs when clicked. They also highlight the button that
-- was just selected using the HighlightSelected function. Did I just copy this
-- comment exactly from InfoAddictHistoricalData.lua? Damn straight I did.
function HighlightSelected(type)
	if (type == "political") then
		Controls.PoliticalSelectHighlight:SetHide(false)
		Controls.PoliticalKey:SetHide(false)
	else
		Controls.PoliticalSelectHighlight:SetHide(true)
		Controls.PoliticalKey:SetHide(true)
	end

	if (type == "economic") then
		Controls.EconomicSelectHighlight:SetHide(false)
		Controls.EconomicKey:SetHide(false)
	else
		Controls.EconomicSelectHighlight:SetHide(true)
		Controls.EconomicKey:SetHide(true)
	end 
end

function OnPolitical()
	OnSelectionReset()
	BuildView("political")
	HighlightSelected("political")
end
Controls.PoliticalButton:RegisterCallback(Mouse.eLClick, OnPolitical)

function OnEconomic()
	OnSelectionReset()
	BuildView("economic")
	HighlightSelected("economic")
end
Controls.EconomicButton:RegisterCallback(Mouse.eLClick, OnEconomic)

-- Re-draw the last view when the windows pops up just in case
-- we've met someone recently.
function OnShowHide(bIsHide, bInitState)
	if not bInitState then
		if not bIsHide then
			BuildView(lastView)
		end
	end
end
ContextPtr:SetShowHideHandler(OnShowHide)

-- Certain events should cause the graphs to redraw themselves
function turnStartHandler()
	BuildView(lastView)
end
Events.ActivePlayerTurnStart.Add(turnStartHandler)

function teamMetHandler()
	--logger:debug("New leader encountered, redrawing relations")
	BuildView(lastView)
end
Events.TeamMet.Add(teamMetHandler)

-- Update view after leaving leader diplo screen
function OnLeavingLeader()
    BuildView(lastView)
end
Events.LeavingLeaderViewMode.Add(OnLeavingLeader)

-- Initialize the display to the political view and redraw the current
-- view at the beginning of each turn.
OnPolitical()
