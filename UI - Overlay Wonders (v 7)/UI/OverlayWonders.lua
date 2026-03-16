include("FLuaVector")

local highlights = { Red     = Vector4(1.0, 0.0, 0.0, 1.0), 
                     Green   = Vector4(0.0, 1.0, 0.0, 1.0), 
                     Blue    = Vector4(0.0, 0.0, 1.0, 1.0),
                     Cyan    = Vector4(0.0, 1.0, 1.0, 1.0),
                     Yellow  = Vector4(1.0, 1.0, 0.0 ,1.0),
                     Magenta = Vector4(1.0, 0.0, 1.0, 1.0),
                     Black   = Vector4(0.5, 0.5, 0.5, 1.0)}             

local colourWonderNatural = highlights["Green"]
local colourWonderWorld = highlights["Magenta"]

local wonderInfo = {
    {Name="TXT_KEY_WONDER_LEGEND_NATURAL", Color={R=colourWonderNatural.x, G=colourWonderNatural.y, B=colourWonderNatural.z}},
    {Name="TXT_KEY_WONDER_LEGEND_WORLD",   Color={R=colourWonderWorld.x,   G=colourWonderWorld.y,   B=colourWonderWorld.z}}
}

pWonderPlots = {}
iWonderIndex = 0

function lookatWonder(iPlayer, iOffset)
  if (iWonderIndex > 0) then
    seekWonderIndex(iPlayer, iWonderIndex, iOffset)
  end

  if (iWonderIndex >= 1 and iWonderIndex <= #pWonderPlots) then
    local pPlot = pWonderPlots[iWonderIndex]

    if (pPlot ~= nil) then
      UI.LookAt(pPlot)
    end
  end
end

function seekWonderIndex(iPlayer, iStart, iOffset)
  repeat
    iWonderIndex = iWonderIndex + iOffset

    if (iWonderIndex < 1) then
      iWonderIndex = #pWonderPlots
    elseif (iWonderIndex > #pWonderPlots) then
      iWonderIndex = 1
    end
  until (iWonderIndex == iStart or isRevealedWonder(iPlayer, pWonderPlots[iWonderIndex]))
end

function isRevealedWonder(iPlayer, pPlot)
  local pPlayer = Players[iPlayer]
  local iTeam = pPlayer:GetTeam()

  -- Any revealed plot ...
  if (pPlot:IsRevealed(iTeam)) then
    -- ... with a natural wonder
    local iFeature = pPlot:GetFeatureType()
    if (iFeature ~= -1 and GameInfo.Features[iFeature].NaturalWonder == true) then
      return true
    end

    -- ... or a city with a world wonder
	local pCity = pPlot:GetPlotCity()
	if (pCity ~= nil and pCity:GetNumWorldWonders() > 0) then
      return true
    end
  end

  return false
end

function clearWonderCache()
  pWonderPlots = {}
  iWonderIndex = 0
end

function cacheWonderPlots(iPlayer)
  pWonderPlots = {}
  iWonderIndex = 1

  local iPlotCount = 1
  local iIndexDistance = 999
  local pCentrePlot = Map.GetPlot(UI.GetMouseOverHex())

  for iPlot = 0, Map.GetNumPlots()-1, 1 do
    local pPlot = Map.GetPlotByIndex(iPlot)

    if (isRevealedWonder(iPlayer, pPlot)) then
      table.insert(pWonderPlots, pPlot)
      iPlotCount = iPlotCount + 1

      if (pCentrePlot ~= nil) then
        local iDistance = Map.PlotDistance(pCentrePlot:GetX(), pCentrePlot:GetY(), pPlot:GetX(), pPlot:GetY())

        if (iDistance < iIndexDistance) then
          iWonderIndex = iPlotCount
          iIndexDistance = iDistance
        end
      end
    end
  end

  iWonderIndex = math.min(iWonderIndex, #pWonderPlots)

  LuaEvents.MiniMapOverlayHideLegendNav(iWonderIndex == 0)
end

function highlightNone()
  Events.ClearHexHighlights()
end

function highlightAllWonders(iPlayer)
  local iTeam = Players[iPlayer]:GetTeam()

  highlightWondersNatural(iTeam)
  highlightWondersWorld(iTeam)
end

function highlightWondersNatural(iTeam)
  for _, pPlot in ipairs(pWonderPlots) do
    local iFeature = pPlot:GetFeatureType()
    if (iFeature ~= -1 and GameInfo.Features[iFeature].NaturalWonder == true) then
      highlightPlot(iTeam, pPlot, colourWonderNatural)
    end
  end
end

function highlightWondersWorld(iTeam)
  for _, pPlot in ipairs(pWonderPlots) do
    if (pPlot:GetPlotCity() ~= nil) then
      highlightPlot(iTeam, pPlot, colourWonderWorld)
    end
  end
end

function highlightPlot(iTeam, pPlot, highlight)
  Events.SerialEventHexHighlight(ToHexFromGrid(Vector2(pPlot:GetX(), pPlot:GetY())), true, highlight)
end


function OnWondersDisplay(bShow)
  if (bShow) then
    cacheWonderPlots(Game.GetActivePlayer())
    highlightAllWonders(Game.GetActivePlayer())

    LuaEvents.MiniMapOverlayLegend("TXT_KEY_WONDER_OVERLAY_WONDERS", wonderInfo)
  else
    highlightNone()
  end

end
LuaEvents.WondersDisplay.Add(OnWondersDisplay) 

function OnNextWonder()
  lookatWonder(Game.GetActivePlayer(), 1)
end
LuaEvents.WondersDisplayNext.Add(OnNextWonder) 

function OnPreviousWonder()
  lookatWonder(Game.GetActivePlayer(), -1)
end
LuaEvents.WondersDisplayPrevious.Add(OnPreviousWonder) 
