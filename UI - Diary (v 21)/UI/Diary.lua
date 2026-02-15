print("This is the 'UI - Diary' mod script.")

local bIsRegistered = false

-- Even though we don't put the Diary in the SummaryBar, we'll borrow the saved data file to persist our options
local savedData = Modding.OpenUserData("SummaryBar", 2)
local userData  = Modding.OpenSaveData()

-- Defaults set here, saved values loaded at end of file
local g_bAbsoluteTurn = false
local g_iEntryLimit = 10
local g_iTurnLimit = 50


--
-- Database helper functions
--
function setToggle(sKey, bValue)
  local iValue = 0
  if (bValue == true) then iValue = 1 end

  savedData.SetValue(sKey, iValue)
end

function isToggle(sKey, bDefault)
  local value = savedData.GetValue(sKey)

  if (value == nil) then
    setToggle(sKey, bDefault)
    return bDefault
  else
    return (value == 1)
  end
end

function setValue(sKey, iValue)
  savedData.SetValue(sKey, iValue)
end

function getValue(sKey, iDefault)
  local value = savedData.GetValue(sKey)

  if (value == nil) then
    return iDefault
  else
    return value
  end
end


--
-- Diary entry functions
--
function GetPolicyEntry(pPlayer, diary)
  if (isToggle("DIARY_OPTION_INCLUDE_POLICIES") == true) then
  	if (Game.IsOption(GameOptionTypes.GAMEOPTION_NO_POLICIES) == false) then
    	if (pPlayer:GetTotalJONSCulturePerTurn() > 0) then
        local iTurns = 0
		    local iCultureNeeded = pPlayer:GetNextPolicyCost() - pPlayer:GetJONSCulture()

        if (iCultureNeeded > 0) then
	  			iTurns = math.floor((iCultureNeeded / pPlayer:GetTotalJONSCulturePerTurn()) + 1)
          table.insert(diary, {icon="CULTURE", turn=iTurns, text=Locale.Lookup("TXT_KEY_DIARY_NEXT_POLICY_CHOICE")})
			  end
	    end
    end
  end
end

function GetTechEntry(pPlayer, diary)
  if (isToggle("DIARY_OPTION_INCLUDE_TECHS") == true) then
  	if (Game.IsOption(GameOptionTypes.GAMEOPTION_NO_SCIENCE) == false) then
      if (pPlayer:GetNumCities() > 0 and pPlayer:GetScience() > 0) then
        if (pPlayer:GetLengthResearchQueue() == 1) then
          local iTech = pPlayer:GetCurrentResearch()
          local iTurns = pPlayer:GetResearchTurnsLeft(iTech, true)
          table.insert(diary, {icon="RESEARCH", turn=iTurns, text=Locale.Lookup("TXT_KEY_DIARY_RESEARCH_COMPLETE", GameInfo.Technologies[iTech].Description)})
        else
          local techQ = {}
          for tech in GameInfo.Technologies() do
            local iPos = pPlayer:GetQueuePosition(tech.ID)
            if (iPos ~= -1) then
              techQ[iPos] = tech
            end
          end

          local iTotalTurns = 0
          for i, tech in ipairs(techQ) do
            iTotalTurns = iTotalTurns + pPlayer:GetResearchTurnsLeft(tech.ID, true)
            if (i == 1) then
              table.insert(diary, {icon="RESEARCH", turn=iTotalTurns, text=Locale.Lookup("TXT_KEY_DIARY_RESEARCH_COMPLETE", tech.Description)})
            else
              table.insert(diary, {icon="RESEARCH", turn=iTotalTurns, text=string.format("[COLOR:164:164:164:255]%s[/COLOR]", Locale.Lookup("TXT_KEY_DIARY_RESEARCH_COMPLETE", tech.Description))})
            end
          end
        end
      end
    end
  end
end

function GetGoldenAgeEntry(pPlayer, diary)
  if (isToggle("DIARY_OPTION_INCLUDE_GA") == true) then
  	if (Game.IsOption(GameOptionTypes.GAMEOPTION_NO_HAPPINESS) == false) then
	  	if (pPlayer:GetGoldenAgeTurns() > 0) then
        table.insert(diary, {icon="HAPPINESS_1", turn=pPlayer:GetGoldenAgeTurns(), text=Locale.Lookup("TXT_KEY_DIARY_GA_END")})
		  else
        local iHappiness = pPlayer:GetExcessHappiness()
			  if (iHappiness > 0) then
          local iTurns = math.floor(((pPlayer:GetGoldenAgeProgressThreshold() - pPlayer:GetGoldenAgeProgressMeter()) / iHappiness) + 1)
          table.insert(diary, {icon="HAPPINESS_1", turn=iTurns, text=Locale.Lookup("TXT_KEY_DIARY_GA_START")})
  			end
			end
		end
	end
end

function GetFinanceEntries(pPlayer, diary)
  local bIncludeFinance = (isToggle("DIARY_OPTION_INCLUDE_FINANCES") == true)

  if (bIncludeFinance) then
		local iTotalGold = pPlayer:GetGold()
		local iGoldPerTurn = pPlayer:CalculateGoldRate()

    if (iGoldPerTurn < 0) then
      if (iTotalGold > 0) then
        local iTurns = math.ceil(iTotalGold / (-1 * iGoldPerTurn))
        table.insert(diary, {icon="GOLD", turn=iTurns, text=Locale.Lookup("TXT_KEY_DIARY_FINANCES_BANKRUPT")})
      end
    elseif (iGoldPerTurn > 0) then
      local res = {}
      LuaEvents.GetGoldAlertTriggerAmount(res)
      local iAlertAmount = res.value
      if (iAlertAmount ~= nil and iAlertAmount > 0) then
        local iTurns = math.max(0, math.ceil((iAlertAmount - iTotalGold) / iGoldPerTurn))
        table.insert(diary, {icon="GOLD", turn=iTurns, text=Locale.Lookup("TXT_KEY_DIARY_FINANCES_SAVINGS", iAlertAmount)})
      end
    end
  end
end

function GetCityEntries(pPlayer, diary)
  if (isToggle("DIARY_OPTION_INCLUDE_CITIES") == true) then
    for pCity in pPlayer:Cities() do
	  if (pCity:IsResistance()) then
        table.insert(diary, {icon="RESISTANCE", turn=pCity:GetResistanceTurns(), text=Locale.Lookup("TXT_KEY_DIARY_CITY_RESISTANCE", pCity:GetName())})
	  end
    end
  end
end

function GetWonderEntries(pPlayer, diary)
  if (isToggle("DIARY_OPTION_INCLUDE_WONDERS") == true) then
    for pCity in pPlayer:Cities() do
	  	local iBuilding = pCity:GetProductionBuilding()
			local iProject = pCity:GetProductionProject()
      		
      if (iBuilding ~= -1 or iProject ~= -1) then
        local iTurns = pCity:GetProductionTurnsLeft()

        if (iTurns > 0) then
          if (iBuilding ~= -1) then
    		  	local building = GameInfo.Buildings[iBuilding]
            local class = GameInfo.BuildingClasses[building.BuildingClass]

            if (class.MaxGlobalInstances == 1) then
              table.insert(diary, {icon="PRODUCTION", turn=iTurns, text=Locale.Lookup("TXT_KEY_DIARY_WW_COMPLETE", building.Description)})
            elseif (class.MaxPlayerInstances == 1 or class.MaxTeamInstances == 1) then
              table.insert(diary, {icon="PRODUCTION", turn=iTurns, text=Locale.Lookup("TXT_KEY_DIARY_NW_COMPLETE", building.Description)})
            end
          else
    		  	local project = GameInfo.Projects[iProject]
            table.insert(diary, {icon="PRODUCTION", turn=iTurns, text=Locale.Lookup("TXT_KEY_DIARY_PROJECT_COMPLETE", project.Description)})
          end
        end
      end
    end
  end
end

function GetAgreementsEntries(pPlayer, diary)
  local bIncludeRA = (isToggle("DIARY_OPTION_INCLUDE_RA") == true)
  local bIncludePeace = (isToggle("DIARY_OPTION_INCLUDE_PEACE") == true)
  local bIncludeFinance = (isToggle("DIARY_OPTION_INCLUDE_FINANCES") == true)

  if (bIncludeRA or bIncludePeace or bIncludeFinance) then
    local iPlayer = pPlayer:GetID()
    local iCurrentTurn = Game.GetGameTurn()
    local iNumCurrentDeals = UI.GetNumCurrentDeals(iPlayer)

    if (iNumCurrentDeals > 0) then
	  local gptPlayerTurn = {}
      local scratchDeal = UI.GetScratchDeal()

      for iDeal = 0, iNumCurrentDeals - 1 do
        UI.LoadCurrentDeal(iPlayer, iDeal) -- into the scratch deal

        local pOtherPlayer = Players[scratchDeal:GetOtherPlayer(iPlayer)]

        local iBeginTurn = scratchDeal:GetStartTurn()
        local iTradeItem, iFinalTurn, iFromPlayer

        scratchDeal:ResetIterator()

        iTradeItem, _, iFinalTurn, _, _, _, _, iFromPlayer = scratchDeal:GetNextItem()

        while (iTradeItem ~= nil) do
          local iTurns = (iFinalTurn - iCurrentTurn) + 1

          if (iTurns > 0) then
		    if (iFromPlayer == iPlayer) then
              if (TradeableItems.TRADE_ITEM_PEACE_TREATY == iTradeItem and bIncludePeace) then
                table.insert(diary, {icon="INFLUENCE", turn=iTurns, text=Locale.Lookup("TXT_KEY_DIARY_PEACE_END", pOtherPlayer:GetCivilizationShortDescriptionKey())})
              elseif (TradeableItems.TRADE_ITEM_RESEARCH_AGREEMENT == iTradeItem and bIncludeRA) then
                table.insert(diary, {icon="RESEARCH", turn=iTurns, text=Locale.Lookup("TXT_KEY_DIARY_RA_COMPLETE", pOtherPlayer:GetCivilizationShortDescriptionKey())})
              end
			else
              if (TradeableItems.TRADE_ITEM_GOLD == iTradeItem and bIncludeFinance) then
                table.insert(diary, {icon="GOLD", turn=iTurns, text=Locale.Lookup("TXT_KEY_DIARY_GOLD_TRADE_END", pOtherPlayer:GetCivilizationShortDescriptionKey())})
              elseif (TradeableItems.TRADE_ITEM_GOLD_PER_TURN == iTradeItem and bIncludeFinance) then
			    local txtKey = pOtherPlayer:GetCivilizationShortDescriptionKey()
			    if (gptPlayerTurn[txtKey] == nil) then
				  gptPlayerTurn[txtKey] = {}
				end
				
				gptPlayerTurn[txtKey][iTurns] = (gptPlayerTurn[txtKey][iTurns] or 0) + 1
			  end
			end
          end

          iTradeItem, _, iFinalTurn, _, _, _, _, iFromPlayer = scratchDeal:GetNextItem()
        end
      end

      for txtKey, gptPlayer in pairs(gptPlayerTurn) do
	    for iTurn, iCount in pairs(gptPlayer)do
	      if (iCount == 1) then
		    table.insert(diary, {icon="GOLD", turn=iTurn, text=Locale.Lookup("TXT_KEY_DIARY_GPT_TRADE_END", txtKey)})
		  else
		    table.insert(diary, {icon="GOLD", turn=iTurn, text=Locale.Lookup("TXT_KEY_DIARY_GPT_TRADE_MULTIPLE_END", txtKey, iCount)})
		  end
		end
      end	  
    end
  end
end

function GetEspionageEntries(pPlayer, diary)
  local bIncludeSpies = (isToggle("DIARY_OPTION_INCLUDE_SPIES") == true)

  if (bIncludeSpies) then
    local riggingByTurn = {}
	
    for _, agent in ipairs(pPlayer:GetEspionageSpies()) do
      local iTurns = agent.TurnsLeft or 0

      if (iTurns > 0) then
  		  local sCiv = Players[Map.GetPlot(agent.CityX, agent.CityY):GetPlotCity():GetOwner()]:GetCivilizationShortDescriptionKey()

        if (agent.State == "TXT_KEY_SPY_STATE_GATHERING_INTEL") then
          table.insert(diary, {icon="SPY", turn=iTurns, text=Locale.Lookup("TXT_KEY_DIARY_SPY_STEAL_TECH", agent.Name, sCiv)})
        elseif (agent.State == "TXT_KEY_SPY_STATE_RIGGING_ELECTION") then
		  if (riggingByTurn[iTurns] == nil) then
		    riggingByTurn[iTurns] = Locale.ConvertTextKey(sCiv)
		  else
		    riggingByTurn[iTurns] = riggingByTurn[iTurns] .. ", " .. Locale.ConvertTextKey(sCiv)
		  end
        end
      end
    end
	
	for iTurns, sCiv in pairs(riggingByTurn) do
	  -- Find the last comma
	  local iComma = string.find(string.reverse(sCiv), ",")
	  
	  if (iComma) then
	    iComma = string.len(sCiv) - iComma + 1
	    sCiv = string.sub(sCiv, 1, iComma-1) .. " and" .. string.sub(sCiv, iComma+1)
	  end
	  
      table.insert(diary, {icon="SPY", turn=iTurns, text=Locale.Lookup("TXT_KEY_DIARY_SPY_RIGGING_ELECTION", "", sCiv)})
	end
  end
end

function GetFaithEntries(pPlayer, diary)
  local bIncludeFaith = (isToggle("DIARY_OPTION_INCLUDE_FAITH") == true)

  if (bIncludeFaith) then
    if (pPlayer:HasCreatedPantheon() and pPlayer:HasCreatedReligion()) then
      local iFaithType = pPlayer:GetFaithPurchaseType()
  
      if (iFaithType ~= FaithPurchaseTypes.NO_AUTOMATIC_FAITH_PURCHASE) then
        local iFaithIndex = pPlayer:GetFaithPurchaseIndex()
        local iFaithCost, sFaithItem

	      if (iFaithType == FaithPurchaseTypes.FAITH_PURCHASE_SAVE_PROPHET) then
	        iFaithCost = pPlayer:GetMinimumFaithNextGreatProphet()
          sFaithItem = GameInfo.Units.UNIT_PROPHET.Description
  	    elseif (iFaithType == FaithPurchaseTypes.FAITH_PURCHASE_UNIT) then
	        iFaithCost = pPlayer:GetCapitalCity():GetUnitFaithPurchaseCost(iFaithIndex, true)
          sFaithItem = GameInfo.Units[iFaithIndex].Description
	      else
	        iFaithCost = pPlayer:GetCapitalCity():GetBuildingFaithPurchaseCost(iFaithIndex, true)
          sFaithItem = GameInfo.Buildings[iFaithIndex].Description
	      end

        local iTurns = math.ceil((iFaithCost - pPlayer:GetFaith()) / pPlayer:GetTotalFaithPerTurn())

        if (iTurns > 0) then
          table.insert(diary, {icon="PEACE", turn=iTurns, text=Locale.Lookup("TXT_KEY_DIARY_FAITH_NEXT_PURCHASE", sFaithItem)})
        end
	  end
    end
  end
end

function GetDiploEntries(pPlayer, diary)
  local bIncludeDiplo = (isToggle("DIARY_OPTION_INCLUDE_DIPLO") == true)

  if (bIncludeDiplo) then
    local iGameTurn = Game.GetGameTurn()
    local sQuery = string.format("SELECT Turn, WithPlayer, AgainstPlayer FROM UIDiary_CoopWar WHERE Player = %d AND Turn >= %d", pPlayer:GetID(), Game.GetGameTurn())
    for row in userData.Query(sQuery) do
      local iTurns = row.Turn - iGameTurn

      if (iTurns > 0) then
  		  local sCivWith = Players[row.WithPlayer]:GetCivilizationShortDescriptionKey()
  		  local sCivAgainst = Players[row.AgainstPlayer]:GetCivilizationShortDescriptionKey()

        table.insert(diary, {icon="INFLUENCE", turn=iTurns, text=Locale.Lookup("TXT_KEY_DIARY_DIPLO_COOP_WAR", sCivWith, sCivAgainst)})
      end
    end
  end
end

function GetVotingEntries(pPlayer, diary)
  if (isToggle("DIARY_OPTION_INCLUDE_VOTING") == true) then
    if (Game.GetNumActiveLeagues() > 0) then
      local pLeague = Game.GetActiveLeague()
      if (pLeague ~= nil) then
        local iLeagueCountdown = pLeague:GetTurnsUntilSession()
        if (iLeagueCountdown > 0) then
          local sText = Game.IsUnitedNationsActive() and Locale.Lookup("TXT_KEY_DIARY_UN_VOTE") or Locale.Lookup("TXT_KEY_DIARY_LEAGUE_VOTE")

          if (PreGame.IsVictory(GameInfoTypes.VICTORY_DIPLOMATIC) and Game.IsUnitedNationsActive()) then
            table.insert(diary, {icon="INFLUENCE", turn=pLeague:GetTurnsUntilVictorySession(), text=sText})
          end

	      if (iLeagueCountdown ~= pLeague:GetTurnsUntilVictorySession()) then
            table.insert(diary, {icon="INFLUENCE", turn=iLeagueCountdown, text=sText})
          end
        end
      end
    end
  end
end

--
-- Diplo Events handler
--
function OnUiDiploEvent(iDiploEvent, iPlayerWith, iButton, iPlayerAgainst)
  print(string.format("OnUiDiploEvent(%d, %d, %d, %d)", iDiploEvent, iPlayerWith, iButton, iPlayerAgainst))
  
  if (iDiploEvent == FromUIDiploEventTypes.FROM_UI_DIPLO_EVENT_COOP_WAR_RESPONSE) then
    if (iButton == 3) then
	    -- The player clicked the "Give us 10 turns to prepare" button (and yes, the 10 really is hard-coded into the TXT_KEY_)
	    local iPlayer = Game.GetActivePlayer()
	    local iTurn = Game.GetGameTurn() + 10
	  
	    local sQuery = string.format("INSERT INTO UIDiary_CoopWar(Turn, Player, WithPlayer, AgainstPlayer) VALUES(%d, %d, %d, %d)", iTurn, iPlayer, iPlayerWith, iPlayerAgainst)
	    for _ in userData.Query(sQuery) do end
	  end
  end
end
GameEvents.UiDiploEvent.Add(OnUiDiploEvent)


--
-- Diary sort and display functions
--
function DiarySort(a, b)
  local valueA = a.turn
  local valueB = b.turn

  if (valueA == valueB) then
    valueA = a.icon
    valueB = b.icon

    if (valueA == valueB) then
      valueA = a.text
      valueB = b.text
    end
  end

  return valueA < valueB
end

function FormatDiaryEntries(pPlayer, diary, bAbsoluteTurns, iEntryLimit, iTurnLimit)
  local sDiary = nil
  local iCurrentTurn = Game.GetGameTurn()

  table.sort(diary, DiarySort)

  for i=1, math.min(#diary, iEntryLimit), 1 do
    local iTurn = diary[i].turn

    if (iTurnLimit == 0 or iTurn <= iTurnLimit) then
      local sPrefix = "TXT_KEY_DIARY_PREFIX"

      if (bAbsoluteTurns) then
        sPrefix = ""
        iTurn = iTurn + iCurrentTurn
      end

      if (sDiary == nil) then
        sDiary = ""
      else
        sDiary = sDiary .. "[NEWLINE]"
      end

      sDiary = sDiary .. Locale.Lookup("TXT_KEY_DIARY_FORMAT", string.format("[ICON_%s]", diary[i].icon), sPrefix, iTurn, diary[i].text)
    end
  end

  if (pPlayer:IsUsingMayaCalendar()) then
    local year = Game.GetGameTurnYear()
    local date = Locale.Lookup(((year < 0) and "TXT_KEY_TIME_BC" or "TXT_KEY_TIME_AD"), math.abs(year))

    if (sDiary == nil) then
      sDiary = ""
    else
      sDiary = sDiary .. Locale.Lookup("TXT_KEY_DIARY_MAYAN_SEP")
    end

    sDiary = sDiary .. Locale.Lookup("TXT_KEY_MAYA_DATE_TOOLTIP", pPlayer:GetMayaCalendarLongString(), date)
  end

  if (sDiary == nil) then
    sDiary = Locale.Lookup("TXT_KEY_DIARY_NOTHING")
  end

  return sDiary
end

local diaryTable = {}
TTManager:GetTypeControlTable("TooltipTypeTopPanel", diaryTable)

function OnUpdateDiaryToolTip(control)
  local pPlayer = Players[Game.GetActivePlayer()]
  local diary = {}

  GetPolicyEntry(pPlayer, diary)
  GetTechEntry(pPlayer, diary)
  GetGoldenAgeEntry(pPlayer, diary)
  GetFinanceEntries(pPlayer, diary)
  GetCityEntries(pPlayer, diary)
  GetWonderEntries(pPlayer, diary)
  GetAgreementsEntries(pPlayer, diary)
  GetDiploEntries(pPlayer, diary)
  GetVotingEntries(pPlayer, diary)
  GetEspionageEntries(pPlayer, diary)
  GetFaithEntries(pPlayer, diary)

  diaryTable.TooltipLabel:SetText(FormatDiaryEntries(pPlayer, diary, g_bAbsoluteTurn, g_iEntryLimit, g_iTurnLimit))
  diaryTable.TopPanelMouseover:DoAutoSize()
end
LuaEvents.DiaryToolTip.Add(OnUpdateDiaryToolTip)


--
-- Diary options panel functions
--
function OnDiaryOptions()
  Controls.IncludeGA:SetCheck(isToggle("DIARY_OPTION_INCLUDE_GA", true))
  Controls.IncludeFinances:SetCheck(isToggle("DIARY_OPTION_INCLUDE_FINANCES", true))
  Controls.IncludeCities:SetCheck(isToggle("DIARY_OPTION_INCLUDE_CITIES", true))
  Controls.IncludeWonders:SetCheck(isToggle("DIARY_OPTION_INCLUDE_WONDERS", true))
  Controls.IncludePolicies:SetCheck(isToggle("DIARY_OPTION_INCLUDE_POLICIES", true))
  Controls.IncludeTechs:SetCheck(isToggle("DIARY_OPTION_INCLUDE_TECHS", true))
  Controls.IncludeRA:SetCheck(isToggle("DIARY_OPTION_INCLUDE_RA", true))
  Controls.IncludePeace:SetCheck(isToggle("DIARY_OPTION_INCLUDE_PEACE", true))
  Controls.IncludeDiplo:SetCheck(isToggle("DIARY_OPTION_INCLUDE_DIPLO", true))
  Controls.IncludeSpies:SetCheck(isToggle("DIARY_OPTION_INCLUDE_SPIES", true))
  Controls.IncludeFaith:SetCheck(isToggle("DIARY_OPTION_INCLUDE_FAITH", true))
  Controls.IncludeVoting:SetCheck(isToggle("DIARY_OPTION_INCLUDE_VOTING", true))

  Controls.DiaryEntriesText:SetText(getValue("DIARY_OPTION_ENTRY_LIMIT", g_iEntryLimit))
  Controls.DiaryTurnsText:SetText(getValue("DIARY_OPTION_TURN_LIMIT", g_iTurnLimit))
  Controls.AbsoluteTurn:SetCheck(isToggle("DIARY_OPTION_ABSOLUTE_TURN", g_bAbsoluteTurn))

  Controls.OptionsPanel:SetHide(false)
end
LuaEvents.DiaryOptions.Add(OnDiaryOptions)

function OnIncludeGAChecked(bIsChecked)
  setToggle("DIARY_OPTION_INCLUDE_GA", bIsChecked)
end
Controls.IncludeGA:RegisterCheckHandler(OnIncludeGAChecked)

function OnIncludeFinancesChecked(bIsChecked)
  setToggle("DIARY_OPTION_INCLUDE_FINANCES", bIsChecked)
end
Controls.IncludeFinances:RegisterCheckHandler(OnIncludeFinancesChecked)

function OnIncludeCitiesChecked(bIsChecked)
  setToggle("DIARY_OPTION_INCLUDE_CITIES", bIsChecked)
end
Controls.IncludeCities:RegisterCheckHandler(OnIncludeCitiesChecked)

function OnIncludeWondersChecked(bIsChecked)
  setToggle("DIARY_OPTION_INCLUDE_WONDERS", bIsChecked)
end
Controls.IncludeWonders:RegisterCheckHandler(OnIncludeWondersChecked)

function OnIncludePoliciesChecked(bIsChecked)
  setToggle("DIARY_OPTION_INCLUDE_POLICIES", bIsChecked)
end
Controls.IncludePolicies:RegisterCheckHandler(OnIncludePoliciesChecked)

function OnIncludeTechsChecked(bIsChecked)
  setToggle("DIARY_OPTION_INCLUDE_TECHS", bIsChecked)
end
Controls.IncludeTechs:RegisterCheckHandler(OnIncludeTechsChecked)

function OnIncludeRAChecked(bIsChecked)
  setToggle("DIARY_OPTION_INCLUDE_RA", bIsChecked)
end
Controls.IncludeRA:RegisterCheckHandler(OnIncludeRAChecked)

function OnIncludePeaceChecked(bIsChecked)
  setToggle("DIARY_OPTION_INCLUDE_PEACE", bIsChecked)
end
Controls.IncludePeace:RegisterCheckHandler(OnIncludePeaceChecked)

function OnIncludeDiploChecked(bIsChecked)
  setToggle("DIARY_OPTION_INCLUDE_DIPLO", bIsChecked)
end
Controls.IncludeDiplo:RegisterCheckHandler(OnIncludeDiploChecked)

function OnIncludeSpiesChecked(bIsChecked)
  setToggle("DIARY_OPTION_INCLUDE_SPIES", bIsChecked)
end
Controls.IncludeSpies:RegisterCheckHandler(OnIncludeSpiesChecked)

function OnIncludeFaithChecked(bIsChecked)
  setToggle("DIARY_OPTION_INCLUDE_FAITH", bIsChecked)
end
Controls.IncludeFaith:RegisterCheckHandler(OnIncludeFaithChecked)

function OnIncludeVotingChecked(bIsChecked)
  setToggle("DIARY_OPTION_INCLUDE_VOTING", bIsChecked)
end
Controls.IncludeVoting:RegisterCheckHandler(OnIncludeVotingChecked)

function OnDiaryEntriesChanged(sText)
  g_iEntryLimit = tonumber(sText)
  setValue("DIARY_OPTION_ENTRY_LIMIT", g_iEntryLimit)
end
Controls.DiaryEntriesText:RegisterCallback(OnDiaryEntriesChanged)

function OnDiaryTurnsChanged(sText)
  g_iTurnLimit = tonumber(sText)
  setValue("DIARY_OPTION_TURN_LIMIT", g_iTurnLimit)
end
Controls.DiaryTurnsText:RegisterCallback(OnDiaryTurnsChanged)

function OnAbsoluteTurnChecked(bIsChecked)
  g_bAbsoluteTurn = bIsChecked
  setToggle("DIARY_OPTION_ABSOLUTE_TURN", g_bAbsoluteTurn)
end
Controls.AbsoluteTurn:RegisterCheckHandler(OnAbsoluteTurnChecked)

function OnClose()
  Controls.OptionsPanel:SetHide(true)
end
Controls.OptionsClose:RegisterCallback(Mouse.eLClick, OnClose)


function SetActivePlayer(iPlayer, iPrevPlayer)
  if (not bIsRegistered) then
    -- This doesn't want to play nicely at load time!
	local control = ContextPtr:LookUpControl("/InGame/TopPanel/CurrentDate")
    
	if (control) then
      control:SetToolTipType("TooltipTypeTopPanel")
      control:SetToolTipCallback(OnUpdateDiaryToolTip)

	  control = ContextPtr:LookUpControl("/InGame/TopPanel/CurrentTurn")
      control:SetToolTipType("TooltipTypeTopPanel")
      control:SetToolTipCallback(OnUpdateDiaryToolTip)

	  bIsRegistered = true
      Events.GameplaySetActivePlayer.Remove(SetActivePlayer)
	else
	  print("/InGame/TopPanel/CurrentDate is nil!")
	end
  end
end
Events.GameplaySetActivePlayer.Add(SetActivePlayer)


--
-- Initialise
--
g_bAbsoluteTurn = (isToggle("DIARY_OPTION_ABSOLUTE_TURN") == true)
g_iEntryLimit = getValue("DIARY_OPTION_ENTRY_LIMIT", g_iEntryLimit)
g_iTurnLimit = getValue("DIARY_OPTION_TURN_LIMIT", g_iTurnLimit)

local sQuery = "CREATE TABLE IF NOT EXISTS UIDiary_CoopWar(Turn INTEGER NOT NULL, Player INTEGER NOT NULL, WithPlayer INTEGER NOT NULL, AgainstPlayer INTEGER NOT NULL)"
for _ in userData.Query(sQuery) do end

SetActivePlayer(0)


function OnAdditionalInformationDropdownGatherEntries(additionalEntries)
  table.insert(additionalEntries, {text=Locale.ConvertTextKey("TXT_KEY_DIARY_DIPLO_CORNER_HOOK"), call=OnDiaryOptions, art="EUI_DC45_Diary.dds"})
end
LuaEvents.AdditionalInformationDropdownGatherEntries.Add(OnAdditionalInformationDropdownGatherEntries)
LuaEvents.RequestRefreshAdditionalInformationDropdownEntries()
