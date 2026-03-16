include("FLuaVector")

local directions = {DirectionTypes.DIRECTION_NORTHEAST, DirectionTypes.DIRECTION_EAST, DirectionTypes.DIRECTION_SOUTHEAST,
                    DirectionTypes.DIRECTION_SOUTHWEST, DirectionTypes.DIRECTION_WEST, DirectionTypes.DIRECTION_NORTHWEST}

local highlights = { Red     = Vector4(1.0, 0.0, 0.0, 1.0), 
                     Green   = Vector4(0.0, 1.0, 0.0, 1.0), 
                     Blue    = Vector4(0.0, 0.0, 1.0, 1.0),
                     Cyan    = Vector4(0.0, 1.0, 1.0, 1.0),
                     Yellow  = Vector4(1.0, 1.0, 0.0, 1.0),
                     Magenta = Vector4(1.0, 0.0, 1.0, 1.0),
                     Black   = Vector4(0.5, 0.5, 0.5, 1.0)}             

local colourHuman = highlights["Green"]
local colourAI    = highlights["Red"]
local colourCS    = highlights["Cyan"]

local cityInfo = {
    {Name="TXT_KEY_CL_LEGEND_CITY_HUMAN", Color={R=colourHuman.x, G=colourHuman.y, B=colourHuman.z}},
    {Name="TXT_KEY_CL_LEGEND_CITY_AI",    Color={R=colourAI.x,    G=colourAI.y,    B=colourAI.z}},
    {Name="TXT_KEY_CL_LEGEND_CITY_CS",    Color={R=colourCS.x,    G=colourCS.y,    B=colourCS.z}}
}

function highlightNone()
  Events.ClearHexHighlights()
end

function highlightAllCities()
  local iActivePlayer = Game.GetActivePlayer()

  -- Order dependant
  highlightCSCities(iActivePlayer)
  highlightAICities(iActivePlayer)
  highlightHumanCities(iActivePlayer)
end

function highlightHumanCities(iActivePlayer)
  highlightPlayerCities(iActivePlayer, Players[iActivePlayer], colourHuman)
end

function highlightAICities(iActivePlayer)
  for i = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
    local pPlayer = Players[i]

    if (i ~= iActivePlayer and pPlayer:IsEverAlive()) then
      highlightPlayerCities(iActivePlayer, pPlayer, colourAI)
    end
  end
end

function highlightCSCities(iActivePlayer)
  for i = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS - 1 do
    local pPlayer = Players[i]

    if pPlayer:IsEverAlive() then
      highlightPlayerCities(iActivePlayer, pPlayer, colourCS)
    end
  end
end

function highlightPlayerCities(iActivePlayer, pPlayer, highlight)
  local iActiveTeam = Players[iActivePlayer]:GetTeam()

  for pCity in pPlayer:Cities() do
    highlightCity(iActiveTeam, pCity, highlight)
  end
end

function highlightCity(iActiveTeam, pCity, highlight)
  local pPlot = pCity:Plot()

  if (pPlot:IsRevealed(iActiveTeam)) then
    highlightPlot(pPlot, highlight)

	-- This assumes inter-city distance hasn't been changed from 3
    for loop, direction in ipairs(directions) do
      local pPlotOneAway = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), direction)
      local pPlotTwoAway = Map.PlotDirection(pPlotOneAway:GetX(), pPlotOneAway:GetY(), direction)

      highlightCell(pPlotTwoAway, highlight)
    end
  end
end

function highlightCell(pPlot, highlight)
  highlightPlot(pPlot, highlight)

  for loop, direction in ipairs(directions) do
    highlightPlot(Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), direction), highlight)
  end
end

function highlightPlot(pPlot, highlight)
  Events.SerialEventHexHighlight(ToHexFromGrid(Vector2(pPlot:GetX(), pPlot:GetY())), true, highlight)
end

function OnCityLimitsDisplay(bShow)
  if (bShow) then
    highlightAllCities()

    LuaEvents.MiniMapOverlayLegend("TXT_KEY_CL_OVERLAY_CITY_LIMITS", cityInfo)
  else
    highlightNone()
  end
end
LuaEvents.CityLimitsDisplay.Add(OnCityLimitsDisplay) 
