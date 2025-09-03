print("This is the 'UI - Summary Clock' mod script.")

local savedData = Modding.OpenUserData("SummaryBar", 2)

local g_button = nil

-----
----- Clock Summary -----
-----
function getClockText()
  local sFormat
  
  if (isToggle("CLOCK_OPTION_MODE24")) then
    sFormat = Locale.ConvertTextKey("TXT_KEY_CLOCK_MODE_24")
  elseif (isToggle("CLOCK_OPTION_MODEAMPM")) then
    sFormat = Locale.ConvertTextKey("TXT_KEY_CLOCK_MODE_12_AM")
  else
    sFormat = Locale.ConvertTextKey("TXT_KEY_CLOCK_MODE_12")
  end

  return os.date(sFormat)
end

function OnContextUpdate()
  if (g_button == nil) then
    local retVal = {}
    LuaEvents.SummaryClockGetButton(retVal)
    g_button = retVal.button
  end

  if (g_button ~= nil) then
    g_button:SetText(getClockText())
  end
end
ContextPtr:SetUpdate(OnContextUpdate)

function OnSummaryClockCallback(button)
  g_button = button
end
LuaEvents.SummaryClockCallback.Add(OnSummaryClockCallback)

function OnSummaryClockGetText(iPlayer, bShort, retVal)
  retVal.text = getClockText()
end
LuaEvents.SummaryClockGetText.Add(OnSummaryClockGetText)

function OnSummaryClockClick(iButtonOffsetX, button)
  local iFrameWidthX = 5
  local iOffsetX = iButtonOffsetX - Controls.OptionsPanel:GetSizeX() + iFrameWidthX
  local iOffsetY = Controls.OptionsPanel:GetOffsetY()
  Controls.OptionsPanel:SetOffsetVal(iOffsetX, iOffsetY)

  Controls.OptionsPanel:SetHide(false)

  UpdateOptionsPanel()
end
LuaEvents.SummaryClockClick.Add(OnSummaryClockClick)


-----
----- Helper Functions -----
-----
function setToggle(sKey, bValue)
  local iValue = 0
  if (bValue == true) then iValue = 1 end

  savedData.SetValue(sKey, iValue)
end

function isToggle(sKey)
  local value = savedData.GetValue(sKey)

  return (value ~= nil and value == 1)
end


-----
----- Options Functions -----
-----
function UpdateOptionsPanel()
  Controls.Mode24Hour:SetCheck(isToggle("CLOCK_OPTION_MODE24"))
  Controls.ModeAmPm:SetCheck(isToggle("CLOCK_OPTION_MODEAMPM"))
end

function OnOptionsClose()
  Controls.OptionsPanel:SetHide(true)
end
Controls.OptionsClose:RegisterCallback(Mouse.eLClick, OnOptionsClose)

function InputHandler(uiMsg, wParam, lParam)
  if Controls.OptionsPanel:IsHidden() then return end
  
  if (uiMsg == KeyEvents.KeyDown) then
    if (wParam == Keys.VK_ESCAPE) then
      OnOptionsClose()
      return true
    end
  end
end
ContextPtr:SetInputHandler(InputHandler)


function OnMode24HourChecked(bIsChecked)
  setToggle("CLOCK_OPTION_MODE24", bIsChecked)
  OnContextUpdate()
end
Controls.Mode24Hour:RegisterCheckHandler(OnMode24HourChecked)

function OnModeAmPmChecked(bIsChecked)
  setToggle("CLOCK_OPTION_MODEAMPM", bIsChecked)
  OnContextUpdate()
end
Controls.ModeAmPm:RegisterCheckHandler(OnModeAmPmChecked)
