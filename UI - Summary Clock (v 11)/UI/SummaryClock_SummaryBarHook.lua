local g_button = nil

function OnSummaryClockGetButton(retVal)
  retVal.button = g_button
end
LuaEvents.SummaryClockGetButton.Add(OnSummaryClockGetButton)

function OnGetTextHook(iPlayer, bShort)
  local retVal = {}
  LuaEvents.SummaryClockGetText(iPlayer, bShort, retVal) 
  return retVal.text
end

function OnClickHook(iButtonOffsetX, button)
  LuaEvents.SummaryClockClick(iButtonOffsetX, button)
end

function OnCallbackHook(button)
  g_button = button
  LuaEvents.SummaryClockCallback(button)
end

LuaEvents.SummaryBarAddin({
  id="Clock",
  priority=-100,
  text=OnGetTextHook,
  tip="TXT_KEY_CLOCK_SET_OPTIONS",
  click=OnClickHook,
  callback=OnCallbackHook
})
