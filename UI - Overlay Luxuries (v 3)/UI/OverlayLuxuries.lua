include("FLuaVector")

local bVisible = false

local highlights = { Red     = Vector4(1.0, 0.0, 0.0, 1.0), 
                     Green   = Vector4(0.0, 1.0, 0.0, 1.0), 
                     Blue    = Vector4(0.0, 0.0, 1.0, 1.0),
                     Cyan    = Vector4(0.0, 1.0, 1.0, 1.0),
                     Yellow  = Vector4(1.0, 1.0, 0.0 ,1.0),
                     Magenta = Vector4(1.0, 0.0, 1.0, 1.0),
                     Black   = Vector4(0.5, 0.5, 0.5, 1.0)}             

local resourceColours = {
  RESOURCECLASS_BONUS  = highlights["Green"],
  RESOURCECLASS_RUSH   = highlights["Blue"],
  RESOURCECLASS_MODERN = highlights["Blue"],
  RESOURCECLASS_LUXURY = highlights["Yellow"]
}

local resourceInfo = {
--  {Name="TXT_KEY_RESOURCES_SECTION_0", Color={R=highlights["Green"].x, G=highlights["Green"].y, B=highlights["Green"].z}},
--  {Name="TXT_KEY_RESOURCES_SECTION_1", Color={R=highlights["Blue"].x, G=highlights["Blue"].y, B=highlights["Blue"].z}},
  {Name="TXT_KEY_RESOURCES_SECTION_2", Color={R=highlights["Yellow"].x, G=highlights["Yellow"].y, B=highlights["Yellow"].z}}
}

local pLuxuryPlots = {}
local iLuxuryIndex = 0

function lookatLuxury(iTeam, iOffset)
  if (iLuxuryIndex > 0) then
    seekLuxuryIndex(iTeam, iLuxuryIndex, iOffset)
  end

  if (iLuxuryIndex >= 1 and iLuxuryIndex <= #pLuxuryPlots) then
    local pPlot = pLuxuryPlots[iLuxuryIndex]

    if (pPlot ~= nil) then
      UI.LookAt(pPlot)
    end
  end
end

function seekLuxuryIndex(iTeam, iStart, iOffset)
  repeat
    iLuxuryIndex = iLuxuryIndex + iOffset

    if (iLuxuryIndex < 1) then
      iLuxuryIndex = #pLuxuryPlots
    elseif (iLuxuryIndex > #pLuxuryPlots) then
      iLuxuryIndex = 1
    end
  until (iLuxuryIndex == iStart or pLuxuryPlots[iLuxuryIndex]:IsRevealed(iTeam))
end

function clearLuxuryCache()
  pLuxuryPlots = {}
  iLuxuryIndex = 0
end

function cacheLuxuryPlots(iTeam)
  pLuxuryPlots = {}
  iLuxuryIndex = 1

  local iPlotCount = 1
  local iIndexDistance = 999
  local pCentrePlot = Map.GetPlot(UI.GetMouseOverHex())

  for iPlot = 0, Map.GetNumPlots()-1, 1 do
    local pPlot = Map.GetPlotByIndex(iPlot)
    local pLuxury = GameInfo.Resources[pPlot:GetResourceType(iTeam)]

    if (pLuxury ~= nil) then
	    local control = Controls[pLuxury.Type]

	    if (control ~= nil and control:IsChecked()) then
        table.insert(pLuxuryPlots, pPlot)
        iPlotCount = iPlotCount + 1

	      if (pCentrePlot ~= nil) then
          local iDistance = Map.PlotDistance(pCentrePlot:GetX(), pCentrePlot:GetY(), pPlot:GetX(), pPlot:GetY())

	  	    if (iDistance < iIndexDistance) then
		        iLuxuryIndex = iPlotCount
		        iIndexDistance = iDistance
		      end
        end
	    end
    end
  end

  iLuxuryIndex = math.min(iLuxuryIndex, #pLuxuryPlots)

  LuaEvents.MiniMapOverlayHideLegendNav(iLuxuryIndex == 0)
end


function highlightNone()
  Events.ClearHexHighlights()
end

function highlightPlot(iTeam, pPlot, highlight)
  Events.SerialEventHexHighlight(ToHexFromGrid(Vector2(pPlot:GetX(), pPlot:GetY())), true, highlight)
end

function OnLuxuriesOptionsOffset(offsetX, offsetY)
  Controls.LuxuriesOptions:SetOffsetVal(offsetX, offsetY+5)
end

function OnLuxuriesDisplay(bShow)
  if (bShow) then
    LuaEvents.MiniMapOverlayLegend("TXT_KEY_SV_OVERLAY_LUXURIES", resourceInfo)

    Show()

    LuaEvents.MiniMapOverlayResizeLegendOptions(Controls.LuxuriesOptions:GetSizeX(), Controls.LuxuriesOptions:GetSizeY(), OnLuxuriesOptionsOffset)

    OnLuxuryChecked(true)
  else
    highlightNone()

    Hide()
  end

end
LuaEvents.LuxuriesDisplay.Add(OnLuxuriesDisplay) 

function OnLuxuryChecked(bIsChecked)
  local iTeam = Game.GetActiveTeam()

  highlightNone()
  cacheLuxuryPlots(iTeam)

  for _, pPlot in ipairs(pLuxuryPlots) do
    highlightPlot(iTeam, pPlot, resourceColours[GameInfo.Resources[pPlot:GetResourceType()].ResourceClassType])
  end
end

function OnNextLuxury()
  lookatLuxury(Game.GetActiveTeam(), 1)
end
LuaEvents.LuxuriesDisplayNext.Add(OnNextLuxury) 

function OnPreviousLuxury()
  lookatLuxury(Game.GetActiveTeam(), -1)
end
LuaEvents.LuxuriesDisplayPrevious.Add(OnPreviousLuxury) 

function ShowHideHandler(bIsHide, bIsInit)
  if (not bIsHide and not bIsInit) then
  end
end
ContextPtr:SetShowHideHandler(ShowHideHandler)

function Hide()
  ContextPtr:SetHide(true)
  bVisible = false
end

function Show()
  ContextPtr:SetHide(false)
  bVisible = true
end

function OnEnterCityScreen()
  ContextPtr:SetHide(true)
end
Events.SerialEventEnterCityScreen.Add(OnEnterCityScreen)

function OnExitCityScreen()
  if (bVisible) then
    ContextPtr:SetHide(false)
  end
end
Events.SerialEventExitCityScreen.Add(OnExitCityScreen)

function Init()
  for pLuxury in GameInfo.Resources() do
    local control = Controls[pLuxury.Type]

    if (control ~= nil) then
      control:SetToolTipString(Locale.ConvertTextKey(pLuxury.Description))
      control:RegisterCheckHandler(OnLuxuryChecked)
    end 
  end

  Hide()
end

Init()
