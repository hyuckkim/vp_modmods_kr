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
  {Name="TXT_KEY_RESOURCES_SECTION_0", Color={R=highlights["Green"].x, G=highlights["Green"].y, B=highlights["Green"].z}},
  {Name="TXT_KEY_RESOURCES_SECTION_1", Color={R=highlights["Blue"].x, G=highlights["Blue"].y, B=highlights["Blue"].z}}
  -- {Name="TXT_KEY_RESOURCES_SECTION_2", Color={R=highlights["Yellow"].x, G=highlights["Yellow"].y, B=highlights["Yellow"].z}}
}

local pResourcePlots = {}
local iResourceIndex = 0

function lookatResource(iTeam, iOffset)
  if (iResourceIndex > 0) then
    seekResourceIndex(iTeam, iResourceIndex, iOffset)
  end

  if (iResourceIndex >= 1 and iResourceIndex <= #pResourcePlots) then
    local pPlot = pResourcePlots[iResourceIndex]

    if (pPlot ~= nil) then
      UI.LookAt(pPlot)
    end
  end
end

function seekResourceIndex(iTeam, iStart, iOffset)
  repeat
    iResourceIndex = iResourceIndex + iOffset

    if (iResourceIndex < 1) then
      iResourceIndex = #pResourcePlots
    elseif (iResourceIndex > #pResourcePlots) then
      iResourceIndex = 1
    end
  until (iResourceIndex == iStart or pResourcePlots[iResourceIndex]:IsRevealed(iTeam))
end

function clearResourceCache()
  pResourcePlots = {}
  iResourceIndex = 0
end

function cacheResourcePlots(iTeam)
  pResourcePlots = {}
  iResourceIndex = 1

  local iPlotCount = 1
  local iIndexDistance = 999
  local pCentrePlot = Map.GetPlot(UI.GetMouseOverHex())

  for iPlot = 0, Map.GetNumPlots()-1, 1 do
    local pPlot = Map.GetPlotByIndex(iPlot)
    local pResource = GameInfo.Resources[pPlot:GetResourceType(iTeam)]

    if (pResource ~= nil) then
	    local control = Controls[pResource.Type]

	    if (control ~= nil and control:IsChecked()) then
        table.insert(pResourcePlots, pPlot)
        iPlotCount = iPlotCount + 1

	      if (pCentrePlot ~= nil) then
          local iDistance = Map.PlotDistance(pCentrePlot:GetX(), pCentrePlot:GetY(), pPlot:GetX(), pPlot:GetY())

	  	    if (iDistance < iIndexDistance) then
		        iResourceIndex = iPlotCount
		        iIndexDistance = iDistance
		      end
        end
	    end
    end
  end

  iResourceIndex = math.min(iResourceIndex, #pResourcePlots)

  LuaEvents.MiniMapOverlayHideLegendNav(iResourceIndex == 0)
end


function highlightNone()
  Events.ClearHexHighlights()
end

function highlightPlot(iTeam, pPlot, highlight)
  Events.SerialEventHexHighlight(ToHexFromGrid(Vector2(pPlot:GetX(), pPlot:GetY())), true, highlight)
end

function OnResourcesOptionsOffset(offsetX, offsetY)
  Controls.ResourcesOptions:SetOffsetVal(offsetX, offsetY+5)
end

function OnResourcesDisplay(bShow)
  if (bShow) then
    LuaEvents.MiniMapOverlayLegend("TXT_KEY_SV_OVERLAY_RESOURCES", resourceInfo)

    Show()

    LuaEvents.MiniMapOverlayResizeLegendOptions(Controls.ResourcesOptions:GetSizeX(), Controls.ResourcesOptions:GetSizeY(), OnResourcesOptionsOffset)

    OnResourceChecked(true)
  else
    highlightNone()

    Hide()
  end

end
LuaEvents.ResourcesDisplay.Add(OnResourcesDisplay) 

function OnResourceChecked(bIsChecked)
  local iTeam = Game.GetActiveTeam()

  highlightNone()
  cacheResourcePlots(iTeam)

  for _, pPlot in ipairs(pResourcePlots) do
    highlightPlot(iTeam, pPlot, resourceColours[GameInfo.Resources[pPlot:GetResourceType()].ResourceClassType])
  end
end

function OnNextResource()
  lookatResource(Game.GetActiveTeam(), 1)
end
LuaEvents.ResourcesDisplayNext.Add(OnNextResource) 

function OnPreviousResource()
  lookatResource(Game.GetActiveTeam(), -1)
end
LuaEvents.ResourcesDisplayPrevious.Add(OnPreviousResource) 

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
  for pResource in GameInfo.Resources() do
    local control = Controls[pResource.Type]

    if (control ~= nil) then
      control:SetToolTipString(Locale.ConvertTextKey(pResource.Description))
      control:RegisterCheckHandler(OnResourceChecked)
    end 
  end

  Hide()
end

Init()
