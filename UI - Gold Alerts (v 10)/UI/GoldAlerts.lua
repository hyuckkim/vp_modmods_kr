print("This is the 'UI - Gold Alerts' mod script.")

local gActivePlayer = 0
local gGoldAlerts = {}
local iGoldAlertTrigger = 0
local iGoldDefaultAmount = 500

local iLastAlertPlayer = -1
local iLastAlertTurn = -1

local bIsRegistered = false

local gModDB = Modding.OpenSaveData()

function CheckGold()
  local iTurn = Game.GetGameTurn()
  local iPlayer = Game.GetActivePlayer()

  if (iPlayer >= 0) then
    local pPlayer = Players[iPlayer]
    local iPlayerGold = pPlayer:GetGold()

	if (gGoldAlerts[gActivePlayer].Amount == -1 and iGoldAlertTrigger ~= 0) then
	  iGoldAlertTrigger = getAlertAmount(gActivePlayer)
	end

    if (iGoldAlertTrigger ~= 0) then
      if (iPlayerGold >= iGoldAlertTrigger) then
        if (not(iTurn == iLastAlertTurn and iPlayer == iLastAlertPlayer)) then
          UI.AddPopup({Type=ButtonPopupTypes.BUTTONPOPUP_TEXT, Data1=800, Option1=true, Text=string.format(gGoldAlerts[gActivePlayer].Text, iGoldAlertTrigger)})
          iGoldAlertTrigger = 0

          iLastAlertPlayer = iPlayer
          iLastAlertTurn = iTurn
        end
      end
    else
      if (iPlayerGold < getAlertAmount(gActivePlayer)) then
        iGoldAlertTrigger = getAlertAmount(gActivePlayer)
      end
    end
  end
end

function getAlertAmount(iPlayer)
  local iAmount = gGoldAlerts[iPlayer].Amount

  if (iAmount == -1) then
    if (Players[iPlayer]:GetCapitalCity()) then
	  iAmount = Players[iPlayer]:GetCapitalCity():GetUnitPurchaseCost(GameInfoTypes.UNIT_SETTLER)
	  gGoldAlerts[iPlayer].Amount = iAmount
      gModDB.SetValue(string.format("GoldAlerts_%i_Amount", iPlayer), iAmount)
	else
      iAmount = iGoldDefaultAmount
	end
  end

  return iAmount
end

function Validate(sValue, control, bFire)
  local sMessage = string.gsub(Controls.GoldAlertMessage:GetText(), " ", "")
  local iAmount = tonumber(Controls.GoldAlertAmount:GetText())

  local bValid = (iAmount and sMessage:len() > 0)
  Controls.OK:SetDisabled(not bValid)
end
Controls.GoldAlertMessage:RegisterCallback(Validate)
Controls.GoldAlertAmount:RegisterCallback(Validate)

function OnOK()
  Controls.GoldAlertDialog:SetHide(true)
  
  local iAlertAmount = tonumber(Controls.GoldAlertAmount:GetText()) or -1
  local sAlertText = Controls.GoldAlertMessage:GetText()

  gGoldAlerts[gActivePlayer].Text = sAlertText
  gGoldAlerts[gActivePlayer].Amount = iAlertAmount

  gModDB.SetValue(string.format("GoldAlerts_%i_Text", gActivePlayer), sAlertText)
  gModDB.SetValue(string.format("GoldAlerts_%i_Amount", gActivePlayer), iAlertAmount)

  iGoldAlertTrigger = (getAlertAmount(gActivePlayer) > Players[gActivePlayer]:GetGold()) and getAlertAmount(gActivePlayer) or 0
end
Controls.OK:RegisterCallback(Mouse.eLClick, OnOK)

function OnGold()
  Controls.GoldAlertMessage:SetText(gGoldAlerts[gActivePlayer].Text)
  Controls.GoldAlertAmount:SetText(gGoldAlerts[gActivePlayer].Amount)

  Controls.GoldAlertDialog:SetHide(false)
  Validate()
end
LuaEvents.GoldAlertsDisplay.Add(OnGold)

function OnGetGoldAlertTriggerAmount(res)
  res.value = iGoldAlertTrigger
end
LuaEvents.GetGoldAlertTriggerAmount.Add(OnGetGoldAlertTriggerAmount)

function SetActivePlayer(iPlayer, iPrevPlayer)
  if (not bIsRegistered) then
    -- This doesn't want to play nicely at load time!
	local control = ContextPtr:LookUpControl("/InGame/TopPanel/GoldPerTurn")
    
	if (control) then
	  control:RegisterCallback(Mouse.eLClick, OnGold)
	  bIsRegistered = true
	end
  end
  
  Controls.GoldAlertDialog:SetHide(true)
  gActivePlayer = iPlayer

  if (gGoldAlerts[gActivePlayer] == nil) then
    local sText = gModDB.GetValue(string.format("GoldAlerts_%i_Text", gActivePlayer)) or Locale.ConvertTextKey("TXT_KEY_GOLD_ALERT_DEFAULT_MESSAGE")
    local tmpAmount = gModDB.GetValue(string.format("GoldAlerts_%i_Amount", gActivePlayer))
	local iAmount = tonumber(tmpAmount)
	if not iAmount then
		iAmount = 90
	end
	
    gGoldAlerts[gActivePlayer] = {Amount=iAmount, Text=sText}
  end

  iGoldAlertTrigger = gGoldAlerts[gActivePlayer].Amount
  
  CheckGold()
end
Events.GameplaySetActivePlayer.Add(SetActivePlayer)

SetActivePlayer(0)

-- This has to be after SetActivePlayer(0)
Events.SerialEventGameDataDirty.Add(CheckGold)


function OnAdditionalInformationDropdownGatherEntries(additionalEntries)
  table.insert(additionalEntries, {text=Locale.ConvertTextKey("TXT_KEY_GOLD_ALERT_HEADING"), call=OnGold})
end
LuaEvents.AdditionalInformationDropdownGatherEntries.Add(OnAdditionalInformationDropdownGatherEntries)
LuaEvents.RequestRefreshAdditionalInformationDropdownEntries()
