function OnMiniMapOverlayNextPreviousHook(bNext)
  -- print("Resources_OnMiniMapOverlayNextPreviousHook()")

  if (bNext) then
    LuaEvents.ResourcesDisplayNext()
  else
    LuaEvents.ResourcesDisplayPrevious()
  end
end

function OnMiniMapOverlayHook(bShow)
  -- print("Resources_OnMiniMapOverlayHook()")

  LuaEvents.ResourcesDisplay(bShow) 
end

LuaEvents.MiniMapOverlayAddin(
  {
    text="TXT_KEY_SV_OVERLAY_RESOURCES", 
    group="resources", 
    call=OnMiniMapOverlayHook, 
    nav=OnMiniMapOverlayNextPreviousHook,
    next_tt="TXT_KEY_NEXT_RESOURCE_TT",
    prev_tt="TXT_KEY_PREVIOUS_RESOURCE_TT"
  }
) 
