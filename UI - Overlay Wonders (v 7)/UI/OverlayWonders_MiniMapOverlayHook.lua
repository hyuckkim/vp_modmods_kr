function OnMiniMapOverlayNextPreviousHook(bNext)
  -- print("Wonders_OnMiniMapOverlayNextPreviousHook()")

  if (bNext) then
    LuaEvents.WondersDisplayNext()
  else
    LuaEvents.WondersDisplayPrevious()
  end
end

function OnMiniMapOverlayHook(bShow)
  -- print("Wonders_OnMiniMapOverlayHook()")

  LuaEvents.WondersDisplay(bShow) 
end

LuaEvents.MiniMapOverlayAddin(
  {
    text="TXT_KEY_WONDER_OVERLAY_WONDERS", 
    group="terrain", 
    call=OnMiniMapOverlayHook, 
    nav=OnMiniMapOverlayNextPreviousHook,
    next_tt="TXT_KEY_NEXT_WONDER_TT",
    prev_tt="TXT_KEY_PREVIOUS_WONDER_TT"
  }
) 
