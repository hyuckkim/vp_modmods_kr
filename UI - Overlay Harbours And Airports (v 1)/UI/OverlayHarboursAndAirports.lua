include("FLuaVector")

local highlights = { Red     = Vector4(1.0, 0.0, 0.0, 1.0), 
                     Green   = Vector4(0.0, 1.0, 0.0, 1.0), 
                     Blue    = Vector4(0.0, 0.0, 1.0, 1.0),
                     Cyan    = Vector4(0.0, 1.0, 1.0, 1.0),
                     Yellow  = Vector4(1.0, 1.0, 0.0 ,1.0),
                     Magenta = Vector4(1.0, 0.0, 1.0, 1.0),
                     Black   = Vector4(0.5, 0.5, 0.5, 1.0)}             

local colourAirport = highlights["Blue"]
local colourHarbour = highlights["Yellow"]
local colourBoth = highlights["Green"]

local portInfo = {
    {Name="TXT_KEY_PORTS_LEGEND_HARBOUR", Color={R=colourHarbour.x, G=colourHarbour.y, B=colourHarbour.z}},
    {Name="TXT_KEY_PORTS_LEGEND_AIRPORT", Color={R=colourAirport.x, G=colourAirport.y, B=colourAirport.z}},
    {Name="TXT_KEY_PORTS_LEGEND_BOTH",    Color={R=colourBoth.x,    G=colourBoth.y,    B=colourBoth.z}}
}

pPortsPlots = {}
iPortsIndex = 0

function lookatPort(iPlayer, iOffset)
  if (iPortsIndex > 0) then
    seekPortIndex(iPlayer, iPortsIndex, iOffset)
  end

  if (iPortsIndex >= 1 and iPortsIndex <= #pPortsPlots) then
    local pPlot = pPortsPlots[iPortsIndex]

    if (pPlot ~= nil) then
      UI.LookAt(pPlot)
    end
  end
end

function seekPortIndex(iPlayer, iStart, iOffset)
  repeat
    iPortsIndex = iPortsIndex + iOffset

    if (iPortsIndex < 1) then
      iPortsIndex = #pPortsPlots
    elseif (iPortsIndex > #pPortsPlots) then
      iPortsIndex = 1
    end
  until (iPortsIndex == iStart or isRevealedPort(iPlayer, pPortsPlots[iPortsIndex]))
end

function hasHarbour(pCity)
	for building in GameInfo.Buildings() do
		if (pCity:IsHasBuilding(building.ID)) then
			if (building.AllowsWaterRoutes) then
				return true
			end
		end
	end
	
	return false
end

function hasAirport(pCity)
	for building in GameInfo.Buildings() do
		if (pCity:IsHasBuilding(building.ID)) then
			if (building.Airlift) then
				return true
			end
		end
	end
	
	return false
end

function isRevealedPort(iPlayer, pPlot)
  local pPlayer = Players[iPlayer]
  local iTeam = pPlayer:GetTeam()

  -- Any revealed plot ...
  if (pPlot:IsRevealed(iTeam)) then
	local pCity = pPlot:GetPlotCity()
	if (pCity ~= nil and pCity:GetTeam() == iTeam) then
      return hasHarbour(pCity) or hasAirport(pCity)
    end
  end

  return false
end

function clearPortCache()
  pPortsPlots = {}
  iPortsIndex = 0
end

function cachePortPlots(iPlayer)
  pPortsPlots = {}
  iPortsIndex = 1

  local iPlotCount = 1
  local iIndexDistance = 999
  local pCentrePlot = Map.GetPlot(UI.GetMouseOverHex())

  for iPlot = 0, Map.GetNumPlots()-1, 1 do
    local pPlot = Map.GetPlotByIndex(iPlot)

    if (isRevealedPort(iPlayer, pPlot)) then
      table.insert(pPortsPlots, pPlot)
      iPlotCount = iPlotCount + 1

      if (pCentrePlot ~= nil) then
        local iDistance = Map.PlotDistance(pCentrePlot:GetX(), pCentrePlot:GetY(), pPlot:GetX(), pPlot:GetY())

        if (iDistance < iIndexDistance) then
          iPortsIndex = iPlotCount
          iIndexDistance = iDistance
        end
      end
    end
  end

  iPortsIndex = math.min(iPortsIndex, #pPortsPlots)

  LuaEvents.MiniMapOverlayHideLegendNav(iPortsIndex == 0)
end

function highlightNone()
  Events.ClearHexHighlights()
end

function highlightAllPorts(iPlayer)
  local iTeam = Players[iPlayer]:GetTeam()

  highlightPorts(iTeam)
end

function highlightPorts(iTeam)
  for _, pPlot in ipairs(pPortsPlots) do
	local pCity = pPlot:GetPlotCity()
    if (pCity ~= nil) then
	  if (hasHarbour(pCity) and hasAirport(pCity)) then
        highlightPlot(iTeam, pPlot, colourBoth)
	  elseif (hasAirport(pCity)) then
        highlightPlot(iTeam, pPlot, colourAirport)
	  else
        highlightPlot(iTeam, pPlot, colourHarbour)
	  end
    end
  end
end

function highlightPlot(iTeam, pPlot, highlight)
  Events.SerialEventHexHighlight(ToHexFromGrid(Vector2(pPlot:GetX(), pPlot:GetY())), true, highlight)
end


function OnPortsDisplay(bShow)
  if (bShow) then
    cachePortPlots(Game.GetActivePlayer())
    highlightAllPorts(Game.GetActivePlayer())

    LuaEvents.MiniMapOverlayLegend("TXT_KEY_PORTS_OVERLAY_PORTS", portInfo)
  else
    highlightNone()
  end

end
LuaEvents.PortsDisplay.Add(OnPortsDisplay) 

function OnNextPort()
  lookatPort(Game.GetActivePlayer(), 1)
end
LuaEvents.PortsDisplayNext.Add(OnNextPort) 

function OnPreviousPort()
  lookatPort(Game.GetActivePlayer(), -1)
end
LuaEvents.PortsDisplayPrevious.Add(OnPreviousPort) 
