function OnMiniMapOverlayHook(bShow)
  -- print("CityLimits_OnMiniMapOverlayHook()")

  LuaEvents.CityLimitsDisplay(bShow) 
end

LuaEvents.MiniMapOverlayAddin(
  {
    text="TXT_KEY_CL_OVERLAY_CITY_LIMITS", 
    group="other", 
    call=OnMiniMapOverlayHook, 
  }
) 
