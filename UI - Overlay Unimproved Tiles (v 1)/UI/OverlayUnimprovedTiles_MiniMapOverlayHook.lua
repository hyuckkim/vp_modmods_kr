function OnMiniMapOverlayNextPreviousHook(bNext)
  -- print("UnimprovedTiles_OnMiniMapOverlayNextPreviousHook()")

  if (bNext) then
    LuaEvents.UnimprovedTilesDisplayNext()
  else
    LuaEvents.UnimprovedTilesDisplayPrevious()
  end
end

function OnMiniMapOverlayHook(bShow)
  -- print("UnimprovedTiles_OnMiniMapOverlayHook()")

  LuaEvents.UnimprovedTilesDisplay(bShow) 
end

LuaEvents.MiniMapOverlayAddin(
  {
    text="TXT_KEY_SV_OVERLAY_UNIMPROVED_TILES", 
    group="other", 
    call=OnMiniMapOverlayHook, 
    nav=OnMiniMapOverlayNextPreviousHook,
    next_tt="TXT_KEY_NEXT_UNIMPROVED_TILE_TT",
    prev_tt="TXT_KEY_PREVIOUS_UNIMPROVED_TILE_TT"
  }
) 
