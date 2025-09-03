function OnMiniMapOverlayNextPreviousHook(bNext)
  -- print("Barbarians_OnMiniMapOverlayNextPreviousHook()")

  if (bNext) then
    LuaEvents.BarbariansDisplayNext()
  else
    LuaEvents.BarbariansDisplayPrevious()
  end
end

function OnMiniMapOverlayHook(bShow)
  -- print("Barbarians_OnMiniMapOverlayHook()")

  LuaEvents.BarbariansDisplay(bShow) 
end

LuaEvents.MiniMapOverlayAddin(
  {
    text="TXT_KEY_BARB_OVERLAY_BARBARIANS", 
    group="other", 
    call=OnMiniMapOverlayHook, 
    nav=OnMiniMapOverlayNextPreviousHook,
    next_tt="TXT_KEY_NEXT_BARBARIAN_TT",
    prev_tt="TXT_KEY_PREVIOUS_BARBARIAN_TT"
  }
) 
