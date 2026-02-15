function OnMiniMapOverlayNextPreviousHook(bNext)
  -- print("HarboursAndAirports_OnMiniMapOverlayNextPreviousHook()")

  if (bNext) then
    LuaEvents.PortsDisplayNext()
  else
    LuaEvents.PortsDisplayPrevious()
  end
end

function OnMiniMapOverlayHook(bShow)
  -- print("HarboursAndAirports_OnMiniMapOverlayHook()")

  LuaEvents.PortsDisplay(bShow) 
end

LuaEvents.MiniMapOverlayAddin(
  {
    text="TXT_KEY_PORTS_OVERLAY_PORTS", 
    group="terrain", 
    call=OnMiniMapOverlayHook, 
    nav=OnMiniMapOverlayNextPreviousHook,
    next_tt="TXT_KEY_NEXT_PORTS_TT",
    prev_tt="TXT_KEY_PREVIOUS_PORTS_TT"
  }
) 
