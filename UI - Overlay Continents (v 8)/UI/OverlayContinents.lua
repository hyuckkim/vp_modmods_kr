include("FLuaVector")

local highlights = { Red     = Vector4(1.0, 0.0, 0.0, 1.0), 
                     Green   = Vector4(0.0, 1.0, 0.0, 1.0), 
                     Blue    = Vector4(0.0, 0.0, 1.0, 1.0),
                     Cyan    = Vector4(0.0, 1.0, 1.0, 1.0),
                     Yellow  = Vector4(1.0, 1.0, 0.0, 1.0),
                     Magenta = Vector4(1.0, 0.0, 1.0, 1.0),
                     Black   = Vector4(0.5, 0.5, 0.5, 1.0)}             

local colourAmerica = highlights["Green"]
local colourAsia    = highlights["Yellow"]
local colourAfrica  = highlights["Magenta"]
local colourEurope  = highlights["Blue"]

-- From MapGenerator.lua, 0=Ocean, 1=America, 2=Asia, 3=Africa, 4=Europe
local colours = {colourAmerica, colourAsia, colourAfrica, colourEurope}

local continentsInfo = {
    {Name="TXT_KEY_CONTINENT_AMERICA", Color={R=colourAmerica.x, G=colourAmerica.y, B=colourAmerica.z}},
    {Name="TXT_KEY_CONTINENT_ASIA",    Color={R=colourAsia.x,    G=colourAsia.y,    B=colourAsia.z}},
    {Name="TXT_KEY_CONTINENT_AFRICA",  Color={R=colourAfrica.x,  G=colourAfrica.y,  B=colourAfrica.z}},
    {Name="TXT_KEY_CONTINENT_EUROPE",  Color={R=colourEurope.x,  G=colourEurope.y,  B=colourEurope.z}}
}

function highlightNone()
  Events.ClearHexHighlights()
end

function highlightContinents()
  for iPlot = 0, Map.GetNumPlots()-1, 1 do
    local pPlot = Map.GetPlotByIndex(iPlot)

    if (not pPlot:IsWater()) then
      local highlight = colours[pPlot:GetContinentArtType()]

	  if (highlight ~= nil) then
        highlightPlot(pPlot, highlight)
      end
    end
  end
end

function highlightPlot(pPlot, highlight)
  Events.SerialEventHexHighlight(ToHexFromGrid(Vector2(pPlot:GetX(), pPlot:GetY())), true, highlight)
end


function OnContinentsDisplay(bShow)
  if (bShow) then
    highlightContinents()

	-- Uncomment the following to display the legend key
    -- LuaEvents.MiniMapOverlayLegend("TXT_KEY_OVERLAY_CONTINENTS", continentsInfo)
  else
    highlightNone()
  end

end
LuaEvents.ContinentsDisplay.Add(OnContinentsDisplay) 
