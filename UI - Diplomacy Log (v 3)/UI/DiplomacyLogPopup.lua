print("This is the 'UI - Diplomacy Log' mod script.")

include("IconSupport")
include("InstanceManager")
local g_LogInstanceManager = InstanceManager:new("LogEntry", "Button", Controls.LogEntryStack)

-----------------
-----------------

local modDB = Modding.OpenSaveData()

function DbQuery(sQuery, ...)
  return modDB.Query(sQuery, ...)
end

function DbExec(...)
  for _ in DbQuery(...) do end
end

DbExec("CREATE TABLE IF NOT EXISTS DiploLog('Player' integer NOT NULL, 'AI' integer NOT NULL, 'DiploMessage' integer NOT NULL, 'DiploEvent' integer DEFAULT -1, 'Button' integer DEFAULT 0, PRIMARY KEY (Player, AI, DiploMessage))")

-----------------
-----------------

function RefreshList()
  local iPlayer = Game.GetActivePlayer()
  local pPlayer = Players[iPlayer]

  CivIconHookup(iPlayer, 64, Controls.CivIcon, Controls.CivIconBG, Controls.CivIconShadow, false, true)
  
  g_LogInstanceManager:ResetInstances()

  local playerLog = pPlayer:GetDiplomacyLog()
  for i = #playerLog, 1, -1 do
    local e = playerLog[i]
    AddMessage(iPlayer, e.Turn, e.Message, e.OtherPlayer, e.Data1, e.Data2)
  end
  
  Controls.LogEntryStack:CalculateSize()
  Controls.LogEntryStack:ReprocessAnchoring()
  Controls.LogScrollPanel:CalculateInternalSize()
end

function AddMessage(iPlayer, iTurn, sMsg, iOtherPlayer, iDiploUIState, iDiploMessage)
  local bIgnoring = getReply(iPlayer, iOtherPlayer, iDiploMessage)
  local controlTable = g_LogInstanceManager:GetInstance()

  CivIconHookup(iOtherPlayer, 32, controlTable.OtherIcon, controlTable.OtherIconBG, controlTable.OtherIconShadow, false, true)
  
  controlTable.LogText:SetText(sMsg)
  controlTable.LogTurn:SetText(Locale.ConvertTextKey("TXT_KEY_TP_TURN_COUNTER", iTurn))
  
  local sTooltip = nil
  if (bIgnoring) then
    controlTable.LogText:SetColorByName("Gray_Black")
	
    sTooltip = Locale.ConvertTextKey("TXT_KEY_DL_REINSTATE_TT")
    controlTable.Button:RegisterCallback(Mouse.eLClick, OnReinstateMessage)
  else
    controlTable.LogText:SetColorByName("Beige_Black_Alpha")
	
    if (iDiploUIState == DiploUIStateTypes.DIPLO_UI_STATE_BLANK_DISCUSSION or
        iDiploUIState == DiploUIStateTypes.DIPLO_UI_STATE_BLANK_DISCUSSION_MEAN_HUMAN or
        iDiploUIState == DiploUIStateTypes.DIPLO_UI_STATE_BLANK_DISCUSSION_MEAN_AI) then
	  sTooltip = Locale.ConvertTextKey("TXT_KEY_DL_IGNORE_TT")
      controlTable.Button:RegisterCallback(Mouse.eLClick, OnIgnoreMessage)
	else
      controlTable.Button:ClearCallback(Mouse.eLClick)
	end
  end
  controlTable.Button:SetVoids(iOtherPlayer, iDiploMessage)
  -- sTooltip = (sTooltip and (sTooltip .. "[NEWLINE]") or "") .. string.format("From=%i, Dstate=%i, Dmsg=%i", iOtherPlayer, iDiploUIState, iDiploMessage) -- DEBUG
  controlTable.Button:SetToolTipString(sTooltip)
    
  controlTable.TextStack:CalculateSize()
  controlTable.TextStack:ReprocessAnchoring()
    
  local sizeY = controlTable.TextStack:GetSizeY()
  controlTable.Button:SetSizeY(sizeY)
  controlTable.TextAnim:SetSizeY(sizeY)
  controlTable.TextHL:SetSizeY(sizeY)
end

function OnReinstateMessage(iAI, iDiploMessage)
  OnWanted((UIManager:GetControl() and -1 or iAI), iDiploMessage)
  RefreshList()
end

function OnIgnoreMessage(iAI, iDiploMessage)
  OnIgnore((UIManager:GetControl() and -1 or iAI), iDiploMessage)
  RefreshList()
end

function OnClose ()
  ContextPtr:SetHide(true)
end
Controls.CloseButton:RegisterCallback(Mouse.eLClick, OnClose)

function InputHandler(uiMsg, wParam, lParam)
  if (uiMsg == KeyEvents.KeyDown) then
    if (wParam == Keys.VK_ESCAPE or wParam == Keys.VK_RETURN) then
      OnClose()
      return true
    end
  end
end
ContextPtr:SetInputHandler(InputHandler)

function ShowHideHandler(bIsHide, bInitState)
  if (not bInitState and not bIsHide) then
    RefreshList()
  end
end
ContextPtr:SetShowHideHandler(ShowHideHandler)

-----------------
-----------------

local replies = nil

function cacheReplies()
  replies = {}
  
  for row in DbQuery("SELECT Player, AI, DiploMessage, DiploEvent, Button FROM DiploLog") do
    getPlayerReplies(row.Player, row.AI)[row.DiploMessage] = {row.DiploEvent, row.Button}
  end
end

function persistReply(iPlayer, iAI, iDiploMessage)
  local reply = replies[iPlayer][iAI][iDiploMessage]
  if (reply) then
    DbExec("INSERT OR REPLACE INTO DiploLog(Player, AI, DiploMessage, DiploEvent, Button) VALUES(?, ?, ?, ?, ?)", iPlayer, iAI, iDiploMessage, reply[1], reply[2])
  else
    DbExec("DELETE FROM DiploLog WHERE Player=? AND AI=? AND DiploMessage=?", iPlayer, iAI, iDiploMessage)
  end
end

function getPlayerReplies(iPlayer, iAI)
  if (not replies) then
    cacheReplies()
  end
  
  if (replies[iPlayer] == nil) then
    replies[iPlayer] = {}
  end
  
  if (replies[iPlayer][iAI] == nil) then
    replies[iPlayer][iAI] = {}
  end
  
  return replies[iPlayer][iAI]
end

function getReply(iPlayer, iAI, iDiploMessage)
  return getPlayerReplies(iPlayer, iAI)[iDiploMessage]
end

function setReply(iPlayer, iAI, iDiploMessage, reply)
  if (iAI == -1) then
    for iPlayerLoop = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
	  local pPlayerLoop = Players[iPlayerLoop]
	  if (pPlayerLoop:IsEverAlive() and not pPlayerLoop:IsHuman()) then
	    if (reply) then
          getPlayerReplies(iPlayer, iPlayerLoop)[iDiploMessage] = {reply[1], reply[2]}
		else
          getPlayerReplies(iPlayer, iPlayerLoop)[iDiploMessage] = nil
		end
		
		persistReply(iPlayer, iPlayerLoop, iDiploMessage)
	  end
	end
  else
    getPlayerReplies(iPlayer, iAI)[iDiploMessage] = reply
    persistReply(iPlayer, iAI, iDiploMessage)
  end
end

function setIgnore(iPlayer, iAI, iDiploMessage, iFromUIDiploEvent, iButton)
  setReply(iPlayer, iAI, iDiploMessage, {iFromUIDiploEvent, iButton})
end


function OnRemember(iAI, iDiploMessage, iFromUIDiploEvent, iButton)
  print(string.format("OnRemember(%i, %i, %i, %i)", iAI, iDiploMessage, iFromUIDiploEvent, iButton))
  setReply(Game.GetActivePlayer(), iAI, iDiploMessage, {iFromUIDiploEvent, iButton})
end
LuaEvents.Diplomacy_Remember.Add(OnRemember)

function OnWanted(iAI, iDiploMessage)
  print(string.format("OnWanted(%i, %i)", iAI, iDiploMessage))
  setReply(Game.GetActivePlayer(), iAI, iDiploMessage, nil)
end
LuaEvents.Diplomacy_Wanted.Add(OnWanted)

function OnIgnore(iAI, iDiploMessage)
  print(string.format("OnIgnore(%i, %i)", iAI, iDiploMessage))
  OnRemember(iAI, iDiploMessage, -1, 0)
end
LuaEvents.Diplomacy_Ignore.Add(OnIgnore)


function OnDiplomacyStfu(iAI, iResponseType, iDiploMessage)
  print(string.format("OnDiplomacyStfu: iAI=%i, iResponseType=%i, iDiploMessage=%i", iAI, iResponseType, iDiploMessage))

  local reply = getReply(Game.GetActivePlayer(), iAI, iDiploMessage)
  if (reply) then
	if (reply[1] ~= -1) then
	  print(string.format("  - Game.DoFromUIDiploEvent(%i, %i, %i, %i)", reply[1], iAI, reply[2], 0))
      Game.DoFromUIDiploEvent(reply[1], iAI, reply[2], 0)
	end

	print(string.format("  - Ignore"))
    return GameInfoTypes.STFU_IGNORE
  end
  
  print(string.format("  - Default"))
  return GameInfoTypes.STFU_DEFAULT
end
GameEvents.DiplomacyStfu.Add(OnDiplomacyStfu)

-----------------
-----------------

function OnDiploCornerPopup()
  ContextPtr:SetHide(false)
end

function OnAdditionalInformationDropdownGatherEntries(additionalEntries)
  table.insert(additionalEntries, {text=Locale.ConvertTextKey("TXT_KEY_POP_DIPLOMACY_LOG"), call=OnDiploCornerPopup})
end
LuaEvents.AdditionalInformationDropdownGatherEntries.Add(OnAdditionalInformationDropdownGatherEntries)
LuaEvents.RequestRefreshAdditionalInformationDropdownEntries()

Events.GameplaySetActivePlayer.Add(OnClose)

ContextPtr:SetHide(true)
