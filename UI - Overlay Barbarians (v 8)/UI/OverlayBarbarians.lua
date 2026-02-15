include("FLuaVector")

local highlights = { Red     = Vector4(1.0, 0.0, 0.0, 1.0), 
                     Green   = Vector4(0.0, 1.0, 0.0, 1.0), 
                     Blue    = Vector4(0.0, 0.0, 1.0, 1.0),
                     Cyan    = Vector4(0.0, 1.0, 1.0, 1.0),
                     Yellow  = Vector4(1.0, 1.0, 0.0 ,1.0),
                     Magenta = Vector4(1.0, 0.0, 1.0, 1.0),
                     Black   = Vector4(0.5, 0.5, 0.5, 1.0)}             

local colourBarbCamp = highlights["Magenta"]
local colourBarbUnit = highlights["Red"]

local barbInfo = {
    {Name="TXT_KEY_BARB_LEGEND_CAMP", Color={R=colourBarbCamp.x, G=colourBarbCamp.y, B=colourBarbCamp.z}},
    {Name="TXT_KEY_BARB_LEGEND_UNIT", Color={R=colourBarbUnit.x, G=colourBarbUnit.y, B=colourBarbUnit.z}}
}

pBarbarianPlots = {}
iBarbarianIndex = 0

function lookatBarbarian(iPlayer, iOffset)
  if (iBarbarianIndex > 0) then
    seekBarbarianIndex(iPlayer, iBarbarianIndex, iOffset)
  end

  if (iBarbarianIndex >= 1 and iBarbarianIndex <= #pBarbarianPlots) then
    local pPlot = pBarbarianPlots[iBarbarianIndex]

    if (pPlot ~= nil) then
      UI.LookAt(pPlot)
    end
  end
end

function seekBarbarianIndex(iPlayer, iStart, iOffset)
  repeat
    iBarbarianIndex = iBarbarianIndex + iOffset

    if (iBarbarianIndex < 1) then
      iBarbarianIndex = #pBarbarianPlots
    elseif (iBarbarianIndex > #pBarbarianPlots) then
      iBarbarianIndex = 1
    end
  until (iBarbarianIndex == iStart or isVisibleBarb(iPlayer, pBarbarianPlots[iBarbarianIndex]))
end

function isVisibleBarb(iPlayer, pPlot)
  local pPlayer = Players[iPlayer]
  local iTeam = pPlayer:GetTeam()

  -- Any revealed camp
  if (pPlot:GetImprovementType() == GameInfoTypes["IMPROVEMENT_BARBARIAN_CAMP"]) then
    if (pPlot:IsVisible(iTeam) or (pPlayer:HasPolicy(GameInfoTypes["POLICY_HONOR"]) and pPlot:IsRevealed(iTeam))) then
      return true
    end
  end

  -- Any visible unit
  if (pPlot:IsVisible(iTeam)) then
    for iUnit = 0, pPlot:GetNumUnits()-1, 1 do
      local pUnit = pPlot:GetUnit(iUnit)
      if (pUnit:IsBarbarian()) then
        return true
      end
    end
  end

  return false
end

function clearBarbarianCache()
  pBarbarianPlots = {}
  iBarbarianIndex = 0
end

function cacheBarbarianPlots(iPlayer)
  pBarbarianPlots = {}
  iBarbarianIndex = 1

  local iPlotCount = 1
  local iIndexDistance = 999
  local pCentrePlot = Map.GetPlot(UI.GetMouseOverHex())

  for iPlot = 0, Map.GetNumPlots()-1, 1 do
    local pPlot = Map.GetPlotByIndex(iPlot)

    if (isVisibleBarb(iPlayer, pPlot)) then
      table.insert(pBarbarianPlots, pPlot)
      iPlotCount = iPlotCount + 1

      if (pCentrePlot ~= nil) then
        local iDistance = Map.PlotDistance(pCentrePlot:GetX(), pCentrePlot:GetY(), pPlot:GetX(), pPlot:GetY())

        if (iDistance < iIndexDistance) then
          iBarbarianIndex = iPlotCount
          iIndexDistance = iDistance
        end
      end
    end
  end

  iBarbarianIndex = math.min(iBarbarianIndex, #pBarbarianPlots)

  LuaEvents.MiniMapOverlayHideLegendNav(iBarbarianIndex == 0)
end

function highlightNone()
  Events.ClearHexHighlights()
end

function highlightAllBarbarians(iPlayer)
  local iTeam = Players[iPlayer]:GetTeam()

  highlightBarbarianUnits(iTeam)
  highlightBarbarianCamps(iTeam)
end

function highlightBarbarianCamps(iTeam)
  local iCampType = GameInfoTypes["IMPROVEMENT_BARBARIAN_CAMP"]

  for _, pPlot in ipairs(pBarbarianPlots) do
    if (pPlot:GetImprovementType() == iCampType) then
      highlightPlot(iTeam, pPlot, colourBarbCamp)
    end
  end
end

function highlightBarbarianUnits(iTeam)
  for _, pPlot in ipairs(pBarbarianPlots) do
    for iUnit = 0, pPlot:GetNumUnits()-1, 1 do
      if (pPlot:GetUnit(iUnit):IsBarbarian()) then
        highlightPlot(iTeam, pPlot, colourBarbUnit)
        break
      end
    end
  end
end

function highlightPlot(iTeam, pPlot, highlight)
  Events.SerialEventHexHighlight(ToHexFromGrid(Vector2(pPlot:GetX(), pPlot:GetY())), true, highlight)
end


function OnBarbariansDisplay(bShow, bOmitLegend)
  if (bShow) then
    local iPlayer = Game.GetActivePlayer()
    cacheBarbarianPlots(iPlayer)
    highlightAllBarbarians(iPlayer)

    if (not bOmitLegend) then
      LuaEvents.MiniMapOverlayLegend("TXT_KEY_BARB_OVERLAY_BARBARIANS", barbInfo)
	end
  else
    highlightNone()
  end

end
LuaEvents.BarbariansDisplay.Add(OnBarbariansDisplay) 

function OnNextBarbarian()
  lookatBarbarian(Game.GetActivePlayer(), 1)
end
LuaEvents.BarbariansDisplayNext.Add(OnNextBarbarian) 

function OnPreviousBarbarian()
  lookatBarbarian(Game.GetActivePlayer(), -1)
end
LuaEvents.BarbariansDisplayPrevious.Add(OnPreviousBarbarian) 
