function OnMiniMapOverlayNextPreviousHook(bNext)
  -- print("Luxuries_OnMiniMapOverlayNextPreviousHook()")

  if (bNext) then
    LuaEvents.LuxuriesDisplayNext()
  else
    LuaEvents.LuxuriesDisplayPrevious()
  end
end

function OnMiniMapOverlayHook(bShow)
  -- print("Luxuries_OnMiniMapOverlayHook()")

  LuaEvents.LuxuriesDisplay(bShow) 
end

LuaEvents.MiniMapOverlayAddin(
  {
    text="TXT_KEY_SV_OVERLAY_LUXURIES", 
    group="luxuries", 
    call=OnMiniMapOverlayHook, 
    nav=OnMiniMapOverlayNextPreviousHook,
    next_tt="TXT_KEY_NEXT_LUXURY_TT",
    prev_tt="TXT_KEY_PREVIOUS_LUXURY_TT"
  }
) 
