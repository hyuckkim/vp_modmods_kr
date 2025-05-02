print("Loading DiploCityStateStatus.lua from TOfVP")
--------------------------------------------------------------
-- New Trade Opportunities panel
-- Dec 13, 2017: Retrofitted for Vox Populi, Infixo
-- Jan 14, 2020: Improved, adan_eslavo
--------------------------------------------------------------
include("IconSupport")
include("SupportFunctions")
include("InstanceManager")
include("InfoTTInclude")
include("CityStateStatusHelper")

local L = Locale.ConvertTextKey

local g_CsIM = InstanceManager:new("CsStatusInstance", "CsBox", Controls.CsStack)
local g_CsControls

local g_SortTable
local g_sLastSort = "influence"
local g_bReverseSort = true

local g_sColorMagenta = "[COLOR_MAGENTA]"
local g_sColorDarkGreen = "[COLOR:0:135:0:255]"
local g_sColorLightGreen = "[COLOR:125:255:0:255]"
local g_sColorYellowGreen = "[COLOR:200:180:0:255]"
local g_sColorRed = "[COLOR_NEGATIVE_TEXT]"
local g_sColorFadingRed = "[COLOR_FADING_NEGATIVE_TEXT]"
local g_sColorCyan = "[COLOR_CYAN]"	
local g_sColorLightOrange = "[COLOR_PLAYER_LIGHT_ORANGE_TEXT]"

local g_sColorWar = "[COLOR_NEGATIVE_TEXT]"
local g_sColorFriendly = "[COLOR_POSITIVE_TEXT]"
local g_sColorGuarded = "[COLOR_YELLOW]"
local g_sColorAfraid = "[COLOR_YIELD_FOOD]"
local g_sColorDenounce = "[COLOR_MAGENTA]"

local g_sCsName = ""

local g_tNotIdleSpyStates = {
	["TXT_KEY_SPY_STATE_TRAVELLING"]		= true,
	["TXT_KEY_SPY_STATE_RIGGING_ELECTION"]	= true,
	["TXT_KEY_SPY_STATE_SURVEILLANCE"]		= true,
	["TXT_KEY_SPY_STATE_SCHMOOZING"]		= true,	
	["TXT_KEY_SPY_STATE_COUNTER_INTEL"]		= true,
	["TXT_KEY_SPY_STATE_UNASSIGNED"]		= false	
}

local g_iNeutralThreshold = GameDefines.FRIENDSHIP_THRESHOLD_NEUTRAL
local g_iFriendThreshold = GameDefines.FRIENDSHIP_THRESHOLD_FRIENDS
local g_iAllyThreshold = GameDefines.FRIENDSHIP_THRESHOLD_ALLIES

local g_tCsCoordinates = {}



-- defining and looking for Austria (marriages)	
local eCivAustria = GameInfoTypes.CIVILIZATION_AUSTRIA
local eAustria = -1

for eplayer = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
	local pPlayer = Players[eplayer]
	
	if pPlayer:GetCivilizationType() == eCivAustria then
		eAustria = eplayer
	end
end



function ShowHideHandler(bIsHide, bIsInit)
	if not bIsInit and not bIsHide then
		InitCsList()
	end
end
ContextPtr:SetShowHideHandler(ShowHideHandler)

function InitCsList()
	local ePlayer = Game.GetActivePlayer()
	local pPlayer = Players[ePlayer]
	local eTeam   = pPlayer:GetTeam()
	local pTeam   = Teams[eTeam]

	local iCount = 0

	g_CsIM:ResetInstances()
	g_CsControls = {}

	g_SortTable = {}

	-- Don't include the Barbarians (so -2)
	for eCs = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_PLAYERS-2, 1 do
		local pCs = Players[eCs]
			
		if pCs:IsAlive() and pTeam:IsHasMet(pCs:GetTeam()) then
			GetCsControl(g_CsIM, eCs, ePlayer)
			iCount = iCount + 1
		end
	end
  
	if iCount == 0 then
		Controls.CsNoneMetText:SetHide(false)
		Controls.CsScrollPanel:SetHide(true)
	else
		OnSortCs()
		Controls.CsStack:CalculateSize()
		Controls.CsStack:ReprocessAnchoring()
		Controls.CsScrollPanel:CalculateInternalSize()

		Controls.CsNoneMetText:SetHide(true)
		Controls.CsScrollPanel:SetHide(false)
	end
end

function GetCsControl(im, eCs, ePlayer)
	local pPlayer = Players[ePlayer]
	local eTeam = pPlayer:GetTeam()
	local pTeam = Teams[eTeam]

	local pCs = Players[eCs]
	local sCsTrait = GameInfo.MinorCivilizations[pCs:GetMinorCivType()].MinorCivTrait
        
	local controlTable = im:GetInstance()
	g_CsControls[eCs] = controlTable

	local sortEntry = {}
	g_SortTable[tostring(controlTable.CsBox)] = sortEntry

	local pCsCity = pCs:GetCapitalCity()
	g_tCsCoordinates[eCs] = {
		iX = pCsCity:GetX(),
		iY = pCsCity:GetY()
	}

	-- Trait
	controlTable.CsTraitIcon:SetTexture(GameInfo.MinorCivTraits[sCsTrait].TraitIcon)
	local primaryColor, secondaryColor = pCs:GetPlayerColors()
	controlTable.CsTraitIcon:SetColor({x = secondaryColor.x, y = secondaryColor.y, z = secondaryColor.z, w = 1})
	sortEntry.trait = sCsTrait
	
	-- Name
	local sName = pCs:GetName()
	sortEntry.name = sName
	
	local bIsMarried = pCs:IsMarried(eAustria)
	local bMetAustria = pTeam:IsHasMet(eAustria)

	if bIsMarried and bMetAustria then
		sName = g_sColorMagenta .. sName .. '[ENDCOLOR]'
	end

	local sExpandedName = sName
	
	for row in GameInfo.Religions{ID=pCsCity:GetReligiousMajority()} do
		sExpandedName = sExpandedName .. " " .. GameInfo.Religions[row.Type].IconString 
	end

	controlTable.CsName:SetText(sExpandedName)
	
	g_sCsName = GetCsApproach(pCs, pPlayer, sName)
	
	controlTable.CsButton:SetVoid1(eCs)
	controlTable.CsButton:RegisterCallback(Mouse.eLClick, OnCsSelectedGetInto)
	
	local sNameTooltip = ""

	for row in GameInfo.Resources() do
		if row.ResourceUsage > 0 then
			if IsCsNearResource(pCs, row.ID) or IsCsHasResource(pCs, row.ID) then
				if sNameTooltip == "" then
					sNameTooltip = row.IconString
				else
					sNameTooltip = sNameTooltip .. ", " .. row.IconString
				end
			end
		end
	end

	if bIsMarried and bMetAustria then
		sNameTooltip = sNameTooltip .. L("TXT_KEY_DO_CS_STATUS_MARRIAGE_TT")
	end

	controlTable.CsButton:SetToolTipString(sNameTooltip)

	-- Influence
	local iSortInfluence, iInfluence, sInfluence, iNeededInfluence, sNeededInfluence = GetInfluence(pCs, pPlayer)
	controlTable.CsInfluence:SetText(sInfluence)
	controlTable.CsInfluence:SetToolTipString(sNeededInfluence)
	sortEntry.influence = iSortInfluence
	if iNeededInfluence ~= 0 then
		sortEntry.neededInfluence = iNeededInfluence
	else
		sortEntry.neededInfluence = iSortInfluence + 1000
	end
	
	-- Personality
	local sPersonality = ""
	local sPersonalityTT = ""
	sortEntry.personality = pCs:GetPersonality()
	
	if sortEntry.personality == 0 then
		sPersonality = L("TXT_KEY_DO_CS_GREEN_FLAG")
		sPersonalityTT = L("TXT_KEY_DO_CS_STATUS_PERSONALITY_FRIEND_TT")
	elseif sortEntry.personality == 1 then
		sPersonality = L("TXT_KEY_DO_CS_WHITE_FLAG")
		sPersonalityTT = L("TXT_KEY_DO_CS_STATUS_PERSONALITY_NEUTRAL_TT")
	elseif sortEntry.personality == 2 then
		sPersonality = L("TXT_KEY_DO_CS_RED_FLAG")
		sPersonalityTT = L("TXT_KEY_DO_CS_STATUS_PERSONALITY_HOSTILE_TT")
	else
		sPersonality = L("TXT_KEY_DO_CS_PINK_FLAG")
		sPersonalityTT = L("TXT_KEY_DO_CS_STATUS_PERSONALITY_IRRATIONAL_TT")
	end
	
	controlTable.CsPersonality:SetText(sPersonality)
	controlTable.CsPersonality:SetToolTipString(sPersonalityTT)
	
	-- Flag
	local iSortFlag, sFlag, sFlagTT = GetUnitSpawnFlag(controlTable.CsStartStopSpawning, pCs, pPlayer)
	controlTable.CsUnits:SetText(sFlag)
	if sFlagTT ~= "" then
		controlTable.CsUnits:SetToolTipString(sFlagTT)
	end
	sortEntry.units = iSortFlag
	
	-- Spy
	local iSortSpy, sSpy, sSpyToolTip = GetSpy(controlTable.CsSpyWindowShow, pCs, pPlayer)
	controlTable.CsSpy:SetText(sSpy)
	if sSpyToolTip ~= "" then
		controlTable.CsSpy:SetToolTipString(sSpyToolTip)
	end
	sortEntry.spy = iSortSpy
	
	-- War
	local iSortWar, sWar, sWarTT = SetWarPeaceIcon(controlTable.CsWarPeace, pCs, pPlayer, false)
	controlTable.CsWar:SetText(sWar)
	if sWarTT ~= "" then
		controlTable.CsWar:SetToolTipString(sWarTT)
	end
	sortEntry.war = iSortWar
	
	-- Allied with anyone?
	local iSortAlly, sAlly = GetAlly(pCs, pPlayer)
	controlTable.CsAlly:SetText(sAlly)
	controlTable.CsAlly:SetToolTipString(sNeededInfluence)
	sortEntry.ally = iSortAlly
	
	-- Possible protection
	local iSortPossProtect, sPossProtect, sPossProtectToolTip = GetPossProtect(controlTable.CsPledgeRevoke, pCs, pPlayer)
	controlTable.CsPossibleProtection:SetText(sPossProtect)
	if sPossProtectToolTip ~= "" then
		controlTable.CsPossibleProtection:SetToolTipString(sPossProtectToolTip)
	end
	sortEntry.possprotect = iSortPossProtect
	
	-- Protected by anyone?
	local iSortProtected, sProtectingPlayers, sProtectingPlayersTT = GetProtectingPlayers(pCs, pPlayer)
	controlTable.CsProtect:SetText(sProtectingPlayers)
	if sProtectingPlayers ~= "" then
		controlTable.CsProtect:SetToolTipString(sProtectingPlayersTT)
	end
	sortEntry.protected = iSortProtected
	
	-- Anyone established an Embassy?
	local sEmbassyOwner = ""
	local bEmbassy = false

	for cityPlot = 1, pCsCity:GetNumCityPlots() - 1, 1 do
		local pPlot = pCsCity:GetCityIndexPlot(cityPlot)
		
		bEmbassy = pPlot and pPlot:IsImprovementEmbassy()

		if bEmbassy then
			controlTable.CsEmbassy:SetText("[ICON_CITY_STATE]")

			local eEmbassyOwner = pPlot:GetPlayerThatBuiltImprovement()

			if pTeam:IsHasMet(eEmbassyOwner) then
				sEmbassyOwner = Players[eEmbassyOwner]:GetCivilizationDescription()
			else
				sEmbassyOwner = L("TXT_KEY_DO_CS_STATUS_UNKNOWN_PLAYER")
			end

			controlTable.CsEmbassy:SetToolTipString(L("TXT_KEY_DO_CS_STATUS_EMBASSY_TT", sEmbassyOwner))
			sortEntry.embassy = sEmbassyOwner
			break
		end
	end	

	if not bEmbassy then
		controlTable.CsEmbassy:SetText("")
		sortEntry.embassy = "ZZZ"
	end	

	-- Anyone has a Sphere of Influence over this CS?
	local sSphereOwner = ""
	local bSphereOfInfluence = Game.IsResolutionPassed(GameInfoTypes.RESOLUTION_SPHERE_OF_INFLUENCE, eCs)
	
	if bSphereOfInfluence then
		controlTable.CsSphere:SetText("[ICON_LOCKED]")
		sSphereOwner = Players[pCs:GetPermanentAlly()]:GetCivilizationDescription()
		controlTable.CsSphere:SetToolTipString(L("TXT_KEY_DO_CS_STATUS_SPHERE_TT", sSphereOwner))
		sortEntry.sphere = sSphereOwner
	else
		controlTable.CsSphere:SetText("")
		sortEntry.sphere = "ZZZ"
	end		

	-- Distance
	local iMinDistance, sClosestCity = CheckDistance(pPlayer, pCs)
	controlTable.CsDistance:SetText(iMinDistance)
	controlTable.CsDistance:SetToolTipString(L("TXT_KEY_DO_CS_STATUS_DISTANCE_TT", sClosestCity, g_sCsName))
	sortEntry.distance = iMinDistance
	
	controlTable.CsCenter:SetVoid1(eCs)
	controlTable.CsCenter:RegisterCallback(Mouse.eLClick, OnCsCenter)

	-- Quests
	iSortQuests = SetQuests(controlTable.CsQuest, pCs, pPlayer, false)
	sortEntry.quests = iSortQuests

	Controls.Refresh:RegisterCallback(Mouse.eLClick, OnRefresh)
	
	return controlTable
end

function OnCsSelectedGetInto(eCs)
	Events.SerialEventGameMessagePopup({Type=ButtonPopupTypes.BUTTONPOPUP_CITY_STATE_DIPLO, Data1=eCs})
end

function OnCsCenter(eCs)
	local pPlot = Map.GetPlot(g_tCsCoordinates[eCs].iX, g_tCsCoordinates[eCs].iY)
   
	if pPlot ~= nil then
		UI.LookAt(pPlot)
	end
end

function OnRefresh()
	InitCsList()
end

function CheckDistance(pPlayer, pCs)
	local iMinDistance = 10000
	local sClosestCity = ""
	local eCs = pCs:GetID()

	for city in pPlayer:Cities() do
		local iCityX = city:GetX()
		local iCityY = city:GetY()
		 
		local iPlotDistance = Map.PlotDistance(iCityX, iCityY, g_tCsCoordinates[eCs].iX, g_tCsCoordinates[eCs].iY)
		
		if iPlotDistance < iMinDistance then
			iMinDistance = iPlotDistance
			sClosestCity = city:GetName()
		end
	end

	return iMinDistance, sClosestCity
end

function GetUnitSpawnFlag(pIcon, pCs, pPlayer)
	local eCs = pCs:GetID()
	local sFlag = ""
	local sFlagTT = ""
	local iSort = 6
	local ePlayer = pPlayer:GetID()
	
	if pCs:GetMinorCivTrait() == MinorCivTraitTypes.MINOR_CIV_TRAIT_MILITARISTIC then
		if pCs:IsFriends(ePlayer) then
			if pCs:IsMinorCivUnitSpawningDisabled(ePlayer) then
				-- Unit spawning is off
				if pCs:IsAllies(ePlayer) then
					iSort = 0
					sFlag = L("TXT_KEY_DO_CS_RED_FLAG")
					sFlagTT = L("TXT_KEY_DO_CS_STATUS_MILITARY_ALLY_DIS_TT", g_sCsName)
				else
					iSort = 1
					sFlag = L("TXT_KEY_DO_CS_ORANGE_FLAG")
					sFlagTT = L("TXT_KEY_DO_CS_STATUS_MILITARY_FRIEND_DIS_TT", g_sCsName)
				end
				
				pIcon:SetVoid1(eCs)
				pIcon:RegisterCallback(Mouse.eLClick, OnSpawnChangeSelected)
			 else
				-- Unit spawning is on
				if pCs:IsAllies(ePlayer) then
					iSort = 2
					sFlag = L("TXT_KEY_DO_CS_CYAN_FLAG")
					sFlagTT = L("TXT_KEY_DO_CS_STATUS_MILITARY_ALLY_EN_TT", g_sCsName)
				else
					iSort = 3
					sFlag = L("TXT_KEY_DO_CS_GREEN_FLAG")
					sFlagTT = L("TXT_KEY_DO_CS_STATUS_MILITARY_FRIEND_EN_TT", g_sCsName)
				end

				pIcon:SetVoid1(eCs)
				pIcon:RegisterCallback(Mouse.eLClick, OnSpawnChangeSelected)
			end
		else
			local iInfluence = pCs:GetMinorCivFriendshipWithMajor(ePlayer)
			
			if iInfluence >= 0 then
				iSort = 4
				sFlag = L("TXT_KEY_DO_CS_WHITE_FLAG")
				sFlagTT = L("TXT_KEY_DO_CS_STATUS_MILITARY_NOBODY_TT", g_sCsName)
			else
				iSort = 5
				sFlag = L("TXT_KEY_DO_CS_BLACK_FLAG")
				sFlagTT = L("TXT_KEY_DO_CS_STATUS_MILITARY_NOBODY_ANGRY_TT", g_sCsName)
			end
		end

		local unit = GameInfo.Units[pCs:GetMinorCivUniqueUnit()]
		local sEra, sTech
		
		for tech in GameInfo.Technologies{Type=unit.PrereqTech} do
			for era in GameInfo.Eras{Type=tech.Era} do
				sEra = L(era.Description)
				sTech = L(tech.Description)
			end
		end
		
		sFlagTT = sFlagTT .. L("TXT_KEY_DO_CS_STATUS_MILITARY_UNIT_TT", sEra, sTech, L(unit.Description), L(unit.Help))
	end
	
	return iSort, sFlag, sFlagTT
end

function OnSpawnChangeSelected(eCs)
	local bSpawnDisabled = Players[eCs]:IsMinorCivUnitSpawningDisabled(Game.GetActivePlayer())
	Network.SendMinorNoUnitSpawning(eCs, not bSpawnDisabled)
end

function GetSpy(pIcon, pCs, pPlayer)
	local sSpy = ""
	local sSpyTT = ""
	local iSort = 0
	local bIdleSpy = false
	local eCs = pCs:GetID()
		
	for _, spy in ipairs(pPlayer:GetEspionageSpies()) do
		if spy.CityX == g_tCsCoordinates[eCs].iX and spy.CityY == g_tCsCoordinates[eCs].iY then
			local sRank = "[COLOR_POSITIVE_TEXT]" .. Locale.Lookup(spy.Rank)
			local sName = Locale.Lookup(spy.Name) .. "[ENDCOLOR]"
			
			iSort = -1
			sSpy = "[ICON_DIPLOMAT]"
			sSpyTT = L("TXT_KEY_CITY_SPY_CITY_STATE_TT", sRank, sName, g_sCsName, sRank, sName)

			pIcon:RegisterCallback(Mouse.eLClick, OnSpySelected)
		end
		
		if not g_tNotIdleSpyStates[spy.State] then
			bIdleSpy = true
		end
	end

	if sSpy == "" and bIdleSpy then
		sSpy = "[ICON_SPY]"
		sSpyTT = "There is at lest 1 idle spy. You can still rig elections in " .. g_sCsName

		pIcon:RegisterCallback(Mouse.eLClick, OnSpySelected)
	end

	return iSort, sSpy, sSpyTT
end

function OnSpySelected()
	Events.SerialEventGameMessagePopup({Type=ButtonPopupTypes.BUTTONPOPUP_ESPIONAGE_OVERVIEW})
	--UIManager:QueuePopup(ContextPtr, PopupPriority.eUtmost)
	--Events.SerialEventGameMessagePopupProcessed.CallImmediate({Type=ButtonPopupTypes.BUTTONPOPUP_DIPLOMATIC_OVERVIEW}, 0 )
end

function SetWarPeaceIcon(pIcon, pCs, pPlayer, bForcePeace)
	local eTeam = pPlayer:GetTeam()
	local pTeam = Teams[eTeam]
	local eCs = pCs:GetID()
	local sWar = ""
	local sWarTT = ""
	local iSort = 2

	local bWar = (not bForcePeace and pTeam:IsAtWar(pCs:GetTeam()))
	local bCanMakePeace = (bWar and not pCs:IsPeaceBlocked(eTeam))
		
	if bCanMakePeace then
		iSort = 0
		sWar = "[ICON_PEACE]"
		sWarTT = L("TXT_KEY_DO_CS_STATUS_PEACE_TT", g_sCsName)

		pIcon:SetVoid1(eCs)
		pIcon:RegisterCallback(Mouse.eLClick, OnMakePeaceSelected)
	elseif bWar then
		iSort = 1
		sWar = "[ICON_WAR]"
		sWarTT = L("TXT_KEY_DO_CS_STATUS_WAR_TT", g_sCsName)
	end

	return iSort, sWar, sWarTT
end

-- If we spend money with the CS, the list is updated in OnGameDataDirty, 
-- If we make peace/war with the CS, the list is updated in OnWarStateChanged
function OnMakePeaceSelected(eCs)
	Network.SendChangeWar(Players[eCs]:GetTeam(), false)
end

function GetAlly(pCs, pActivePlayer)
	local eActivePlayer = pActivePlayer:GetID()
	local eTeam = pActivePlayer:GetTeam()
	local pTeam = Teams[eTeam]
	local sAlly = ""
	local iSort = "ZZZZ"

	if pCs:IsAllies(eActivePlayer) then
		iSort = "AAAA"
		sAlly = L("TXT_KEY_DO_CS_YOU")
	else
		local eAlly = pCs:GetAlly() or -1
		local pAlly = Players[eAlly]
		local bIsMet = pTeam:IsHasMet(eAlly)

		if eAlly ~= -1 then
			sAlly = L(pAlly:GetCivilizationShortDescriptionKey())
			
			if bIsMet then
				sAlly = GetApproach(pActivePlayer, pAlly, sAlly)
				iSort = sAlly
			else
				sAlly = L("TXT_KEY_DO_CS_STATUS_UNKNOWN")
				iSort = "ZZYY"
			end
		end
	end

	return iSort, sAlly
end

function GetPossProtect(pIcon, pCs, pPlayer)
	local ePlayer = pPlayer:GetID()
	local eCs = pCs:GetID()
	local sPossProtect = ""
	local sPossProtectTT = ""
	local iSort = 0
		
	if pCs:CanMajorStartProtection(ePlayer) then
		iSort = -2
		sPossProtect = "[ICON_IDEOLOGY_AUTOCRACY]"
		sPossProtectTT = L("TXT_KEY_DO_CS_STATUS_PROTECTION_PLEDGE_TT", g_sCsName)

		pIcon:SetVoid1(eCs)
		pIcon:RegisterCallback(Mouse.eLClick, OnPledgeProtectionSelected)
	elseif pPlayer:IsProtectingMinor(eCs) then
		iSort = -1
		sPossProtect = "[ICON_STRENGTH]"
		sPossProtectTT = L("TXT_KEY_DO_CS_STATUS_PROTECTION_REVOKE_TT", g_sCsName)

		pIcon:SetVoid1(eCs)
		pIcon:RegisterCallback(Mouse.eLClick, OnPledgeProtectionSelected)
	end

	return iSort, sPossProtect, sPossProtectTT
end

function OnPledgeProtectionSelected(eCs)
	local bPledgeProtect = Players[Game.GetActivePlayer()]:IsProtectingMinor(eCs)
	Network.SendPledgeMinorProtection(eCs, not bPledgeProtect)
end

function GetProtectingPlayers(pCs, pActivePlayer)
	local pTeam = Teams[pActivePlayer:GetTeam()]
	
	local sProtecting = ""
	local sProtectingTT = ""
	local eCs = pCs:GetID()
	local eActivePlayer = pActivePlayer:GetID()
	local iSortNumber = 0
	
	for iCivPlayer = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		pCivPlayer = Players[iCivPlayer]
		
		if pCivPlayer:IsAlive() then
			if pCivPlayer:IsProtectingMinor(eCs) then
				if sProtecting ~= "" then
					sProtecting = sProtecting .. ", "
				end
				
				if iCivPlayer == eActivePlayer then
					sProtecting = sProtecting .. L("TXT_KEY_DO_CS_YOU")
				elseif not pTeam:IsHasMet(iCivPlayer) then
					sProtecting = sProtecting .. L("TXT_KEY_DO_CS_STATUS_UNKNOWN")
				else
					sProtecting = sProtecting .. GetApproach(pActivePlayer, pCivPlayer, L(Players[iCivPlayer]:GetCivilizationShortDescriptionKey()))
				end
				
				iSortNumber = iSortNumber + 1
			end
		end
	end
	
	if sProtecting ~= "" then
		sProtectingTT = L("TXT_KEY_DO_CS_STATUS_PROTECT_TT", g_sCsName, sProtecting)
	end
	
	return -iSortNumber, sProtecting, sProtectingTT
end

function GetQuests(pCs, pPlayer, bForcePeace)
	local iMajor = pPlayer:GetID()
	local iMinor = pCs:GetID()

	local sQuests = GetActiveQuestText(iMajor, iMinor)
	local iQuests = 0
	
	for bracket in string.gmatch(sQuests, "[%[]") do
		iQuests = iQuests + 1
	end
	
	return sQuests, GetActiveQuestToolTip(iMajor, iMinor), iQuests
end

function SetQuests(pText, pCs, pPlayer, bForcePeace)
	local sCsQuests, sCsQuestsDesc, iQuests = GetQuests(pCs, pPlayer, bForcePeace)
	local iSort = 0

	if sCsQuests ~= "" then
		pText:SetText(sCsQuests)
		pText:SetToolTipString(L("TXT_KEY_DO_CS_STATUS_QUEST_TT", sCsQuestsDesc))
		iSort = -iQuests
	else
		pText:SetText("")
		pText:SetToolTipString(L("TXT_KEY_DO_CS_STATUS_NO_QUEST_TT", g_sCsName))
	end

	return iSort
end

function GetInfluence(pCs, pPlayer)
	local iInfluence = pCs:GetMinorCivFriendshipWithMajor(ePlayer)
	local sInfluence = iInfluence
	local iInfluenceChange = pCs:GetFriendshipChangePerTurnTimes100(ePlayer)
	local iNeededInfluence, sNeededInfluence, iSortInfluence = GetNeededInfluence(pCs, pPlayer)
	local sNeed = ""
	local sChange = ""
	
	if iNeededInfluence > 0 then
		sNeed = " (" ..iNeededInfluence .. ")"
	end	

	if iInfluenceChange ~= 0 then
		sChange = (" (%+2.2g / "):format(iInfluenceChange / 100) .. "Turn)"
	end	
	
	sInfluence = GetCsApproach(pCs, pPlayer, L("TXT_KEY_DO_CS_INFLUENCE_VALUE", iInfluence, sNeed, sChange))
	
	return iSortInfluence, iInfluence, sInfluence, iNeededInfluence, sNeededInfluence
end

function GetNeededInfluence(pCs, pPlayer)
	local pTeam = Teams[pPlayer:GetTeam()]
	
	local iNeededInfluence = 0
	local sNeededInfluence = ""	
	local iSortInfluence
	local iPlayerInfluence = pCs:GetMinorCivFriendshipWithMajor(pPlayer:GetID())
	local eAlly = pCs:GetAlly()
	local sAlly = ""

	if eAlly ~= nil and eAlly ~= -1 then
		if eAlly ~= pPlayer:GetID() then
			local pAlly = Players[eAlly]
			local iAllyInfluence = pCs:GetMinorCivFriendshipWithMajor(eAlly)
			
			if pTeam:IsHasMet(eAlly) then
				sAlly = L(pAlly:GetCivilizationShortDescriptionKey())
				sAlly = GetApproach(pPlayer, pAlly, sAlly)
			else
				sAlly = L("TXT_KEY_DO_CS_STATUS_UNKNOWN_PLAYER")
			end

			iNeededInfluence = iAllyInfluence - iPlayerInfluence + 1
			sNeededInfluence = L("TXT_KEY_DO_CS_STATUS_INFLUENCE_TT", sAlly, g_sCsName, iNeededInfluence)
		end
	else
		iNeededInfluence = g_iAllyThreshold - iPlayerInfluence
		sNeededInfluence = L("TXT_KEY_DO_CS_STATUS_INFLUENCE_NOBODY_TT", g_sCsName, iNeededInfluence)
	end
	
	if pPlayer:GetID() == eAlly then
		iSortInfluence = 10000 * iPlayerInfluence -- Ally; top of the table by my current influence
	elseif iPlayerInfluence >= g_iFriendThreshold then
		iSortInfluence = 1000 * iPlayerInfluence - iNeededInfluence -- Friend; middle of the table by influence needed to make ally
	else
		iSortInfluence = 100 * iPlayerInfluence - iNeededInfluence -- Nothing; bottom of the table by influence needed
	end
	
	return iNeededInfluence, sNeededInfluence, iSortInfluence
end

function GetApproach(pActivePlayer, pPlayer, sPlayerName)
	local sApproach = ""

	if pActivePlayer:GetID() ~= pPlayer:GetID() then
		if Teams[pActivePlayer:GetTeam()]:IsAtWar(pPlayer:GetTeam()) then
			sApproach = L("TXT_KEY_DO_CS_GET_APPROACH", g_sColorWar, sPlayerName)
		elseif pPlayer:IsDenouncingPlayer(pActivePlayer:GetID()) then
			sApproach = L("TXT_KEY_DO_CS_GET_APPROACH", g_sColorDenounce, sPlayerName)
		else
			local iApproach = pActivePlayer:GetApproachTowardsUsGuess(pPlayer:GetID())
  
			if iApproach == MajorCivApproachTypes.MAJOR_CIV_APPROACH_WAR then
				sApproach = L("TXT_KEY_DO_CS_GET_APPROACH", g_sColorWar, sPlayerName)
			elseif iApproach == MajorCivApproachTypes.MAJOR_CIV_APPROACH_HOSTILE then
				sApproach = L("TXT_KEY_DO_CS_GET_APPROACH", g_sColorWar, sPlayerName)
			elseif iApproach == MajorCivApproachTypes.MAJOR_CIV_APPROACH_GUARDED then
				sApproach = L("TXT_KEY_DO_CS_GET_APPROACH", g_sColorGuarded, sPlayerName)
			elseif iApproach == MajorCivApproachTypes.MAJOR_CIV_APPROACH_NEUTRAL then
				sApproach = sPlayerName
			elseif iApproach == MajorCivApproachTypes.MAJOR_CIV_APPROACH_FRIENDLY then
				sApproach = L("TXT_KEY_DO_CS_GET_APPROACH", g_sColorFriendly, sPlayerName)
			elseif iApproach == MajorCivApproachTypes.MAJOR_CIV_APPROACH_AFRAID then
				sApproach = L("TXT_KEY_DO_CS_GET_APPROACH", g_sColorAfraid, sPlayerName)
			end
		end
	end

	if sApproach ~= "" then
		sApproach = sApproach
	end

	return sApproach
end

function GetCsApproach(pCs, pPlayer, sText)
	local ePlayer = pPlayer:GetID()
	local eTeam = pPlayer:GetTeam()
	local bWar = Teams[eTeam]:IsAtWar(pCs:GetTeam())
	local iInfluence = pCs:GetMinorCivFriendshipWithMajor(ePlayer)
	local iNeededInfluence, _, _ = GetNeededInfluence(pCs, pPlayer)
	
	local iPercentForAlly = (iInfluence / (iNeededInfluence + iInfluence)) * 100
	local iPercentForFriend = (iInfluence / g_iFriendThreshold) * 100
		
	if pCs:IsAllies(ePlayer) then
		sText = L("TXT_KEY_DO_CS_GET_APPROACH", g_sColorCyan, sText)
	elseif pCs:IsMinorPermanentWar(eTeam) or bWar then
		sText = L("TXT_KEY_DO_CS_GET_APPROACH", g_sColorRed, sText)
	elseif pCs:IsPeaceBlocked(eTeam) then
		sText = L("TXT_KEY_DO_CS_GET_APPROACH", g_sColorFadingRed, sText)
	elseif pCs:IsFriends(ePlayer) and iPercentForAlly > 75 then
		sText = L("TXT_KEY_DO_CS_GET_APPROACH", g_sColorDarkGreen, sText)
	elseif pCs:IsFriends(ePlayer) and iPercentForAlly <= 75 then
		sText = L("TXT_KEY_DO_CS_GET_APPROACH", g_sColorLightGreen, sText)
	elseif iInfluence < g_iFriendThreshold and pCs:CanMajorBullyGold(ePlayer) then
		sText = L("TXT_KEY_DO_CS_GET_APPROACH", g_sColorLightOrange, sText)
	elseif iPercentForFriend > 75 then
		sText = L("TXT_KEY_DO_CS_GET_APPROACH", g_sColorYellowGreen, sText)
	elseif iInfluence < g_iNeutralThreshold and not pCs:CanMajorBullyGold(ePlayer) then
		sText = L("TXT_KEY_DO_CS_GET_APPROACH", g_sColorMagenta, sText)
	end
	
	return sText
end

function OnSortCs(sSort)
	if sSort then
		if g_sLastSort == sSort then
			g_bReverseSort = not g_bReverseSort
		else
			g_bReverseSort = (sSort == "influence")
		end 

		g_sLastSort = sSort
	end

	Controls.CsStack:SortChildren(ByMethod)
end


function ByMethod(a, b)
	local entryA = g_SortTable[tostring(a)]
	local entryB = g_SortTable[tostring(b)]

	local bReverse = g_bReverseSort

	if entryA == nil or entryB == nil then 
		if entryA ~= nil and entryB == nil then
			if bReverse then
				return false
			else
				return true
			end
		elseif entryA == nil and entryB ~= nil then
			if (bReverse) then
				return true
			else
				return false
			end
		else
			-- gotta do something!
			if bReverse then
				return (tostring(a) >= tostring(b))
			else
				return (tostring(a) < tostring(b))
			end
		end
	end

	local valueA = entryA[g_sLastSort]
	local valueB = entryB[g_sLastSort]

	if valueA == valueB and g_sLastSort == "influence" then
		valueA = entryA.neededInfluence
		valueB = entryB.neededInfluence
	end

	if valueA == valueB then
		valueA = entryA.name
		valueB = entryB.name

		bReverse = false
	end

	if bReverse then
		return (valueA >= valueB)
	else
		return (valueA < valueB)
	end
end

function OnSortCsTrait()
	OnSortCs("trait")
end
Controls.SortCsTrait:RegisterCallback(Mouse.eLClick, OnSortCsTrait)

function OnSortCsName()
	OnSortCs("name")
end
Controls.SortCsName:RegisterCallback(Mouse.eLClick, OnSortCsName)

function OnSortCsPersonality()
	OnSortCs("personality")
end
Controls.SortCsPersonality:RegisterCallback(Mouse.eLClick, OnSortCsPersonality)

function OnSortCsInfluence()
	OnSortCs("influence")
end
Controls.SortCsInfluence:RegisterCallback(Mouse.eLClick, OnSortCsInfluence)

function OnSortCsNeededInfluence()
	OnSortCs("neededInfluence")
end
Controls.SortCsInfluence:RegisterCallback(Mouse.eRClick, OnSortCsNeededInfluence)

function OnSortCsUnits()
	OnSortCs("units")
end
Controls.SortCsUnits:RegisterCallback(Mouse.eLClick, OnSortCsUnits)

function OnSortCsSpy()
	OnSortCs("spy")
end
Controls.SortCsSpy:RegisterCallback(Mouse.eLClick, OnSortCsSpy)

function OnSortCsWar()
	OnSortCs("war")
end
Controls.SortCsWar:RegisterCallback(Mouse.eLClick, OnSortCsWar)

function OnSortCsAlly()
	OnSortCs("ally")
end
Controls.SortCsAlly:RegisterCallback(Mouse.eLClick, OnSortCsAlly)

function OnSortCsPossibleProtection()
	OnSortCs("possprotect")
end
Controls.SortCsPossibleProtection:RegisterCallback(Mouse.eLClick, OnSortCsPossibleProtection)

function OnSortCsProtected()
	OnSortCs("protected")
end
Controls.SortCsProtected:RegisterCallback(Mouse.eLClick, OnSortCsProtected)

function OnSortCsEmbassy()
	OnSortCs("embassy")
end
Controls.SortCsEmbassy:RegisterCallback(Mouse.eLClick, OnSortCsEmbassy)

function OnSortCsSphere()
	OnSortCs("sphere")
end
Controls.SortCsSphere:RegisterCallback(Mouse.eLClick, OnSortCsSphere)

function OnSortCsDistance()
	OnSortCs("distance")
end
Controls.SortCsDistance:RegisterCallback(Mouse.eLClick, OnSortCsDistance)

function OnSortCsQuests()
	OnSortCs("quests")
end
Controls.SortCsQuests:RegisterCallback(Mouse.eLClick, OnSortCsQuests)

-- Catch changes in war/peace that will affect Quests, Influence, Status, Gifts et al
function OnWarStateChanged(iTeam1, iTeam2, bWar)
	if not ContextPtr:IsHidden() then
		InitCsList()
	end
end
Events.WarStateChanged.Add(OnWarStateChanged)
--------------------------------------------------------------
--------------------------------------------------------------
print("Loaded DiploCityStateStatus.lua from TOfVP")
--------------------------------------------------------------
--------------------------------------------------------------


-- checking nearby resources
function IsCsNearResource(pCs, eResource)
	local iCs = pCs:GetID()
	local pCapital = pCs:GetCapitalCity()
	
	if pCapital ~= nil then
		local iThisX = pCapital:GetX()
		local iThisY = pCapital:GetY()
		
		local iRange = 5
		local iCloseRange = 2
		
		for iDX = -iRange, iRange, 1 do
			for iDY = -iRange, iRange, 1 do
				local pTargetPlot = Map.GetPlotXY(iThisX, iThisY, iDX, iDY)
        
				if pTargetPlot ~= nil then
					local eOwner = pTargetPlot:GetOwner()
          
					if eOwner == iCs or eOwner == -1 then
						local plotDistance = Map.PlotDistance(iThisX, iThisY, pTargetPlot:GetX(), pTargetPlot:GetY())
            
						if plotDistance <= iRange and (plotDistance <= iCloseRange or eOwner == iCs) then
							if pTargetPlot:GetResourceType(Game.GetActiveTeam()) == eResource then
								return true
							end
						end
					end
				end
			end
		end
	end
end

-- checks for CS resources
function IsCsHasResource(pCs, eResource)
	return (GetCsResourceCount(pCs, eResource) > 0)
end

-- subfunction
function GetCsResourceCount(pCs, eResource)
	return pCs:GetNumResourceTotal(eResource, false) + pCs:GetResourceExport(eResource)
end