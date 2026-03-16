function OnMiniMapOverlayHook(bShow)
  LuaEvents.ContinentsDisplay(bShow) 
end

LuaEvents.MiniMapOverlayAddin({text="TXT_KEY_OVERLAY_CONTINENTS", call=OnMiniMapOverlayHook})
