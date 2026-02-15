function OnMiniMapOverlayHook(bShow)
  -- print("RoadAndRail_OnMiniMapOverlayHook()")

  LuaEvents.RoutesDisplay(bShow) 
end

LuaEvents.MiniMapOverlayAddin(
  {
    text="TXT_KEY_RANDR_OVERLAY_RANDR", 
    group="routes", 
    call=OnMiniMapOverlayHook
  }
) 
