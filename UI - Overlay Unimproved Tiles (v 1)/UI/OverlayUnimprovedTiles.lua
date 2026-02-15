include("FLuaVector")

local iRouteRoad = GameInfoTypes.ROUTE_ROAD
local iTechRail

local bVisible = false

local highlights = { Red     = Vector4(1.0, 0.0, 0.0, 1.0),
                     Green   = Vector4(0.0, 1.0, 0.0, 1.0),
                     Blue    = Vector4(0.0, 0.0, 1.0, 1.0),
                     Cyan    = Vector4(0.0, 1.0, 1.0, 1.0),
                     Yellow  = Vector4(1.0, 1.0, 0.0 ,1.0),
                     Magenta = Vector4(1.0, 0.0, 1.0, 1.0),
                     Black   = Vector4(0.5, 0.5, 0.5, 1.0)}

-- If changing these colours, you'll also need to change the colours of the text in UIUnimprovedTiles.xml
local tileColours = {
  RESOURCECLASS_LUXURY = highlights["Yellow"],
  RESOURCECLASS_RUSH   = highlights["Blue"],
  RESOURCECLASS_MODERN = highlights["Blue"],
  RESOURCECLASS_BONUS  = highlights["Green"],
  OTHER                = highlights["Cyan"],
  ROAD                 = highlights["Magenta"]
}

local pUnimprovedPlots = {}
local iUnimprovedIndex = 0

function lookatUnimprovedTile(iTeam, iOffset)
  if (iUnimprovedIndex > 0) then
    seekUnimprovedIndex(iTeam, iUnimprovedIndex, iOffset)
  end

  if (iUnimprovedIndex >= 1 and iUnimprovedIndex <= #pUnimprovedPlots) then
    local pPlot = pUnimprovedPlots[iUnimprovedIndex]

    if (pPlot ~= nil) then
      UI.LookAt(pPlot)
    end
  end
end

function seekUnimprovedIndex(iTeam, iStart, iOffset)
  repeat
    iUnimprovedIndex = iUnimprovedIndex + iOffset

    if (iUnimprovedIndex < 1) then
      iUnimprovedIndex = #pUnimprovedPlots
    elseif (iUnimprovedIndex > #pUnimprovedPlots) then
      iUnimprovedIndex = 1
    end
  until (iUnimprovedIndex == iStart or pUnimprovedPlots[iUnimprovedIndex]:IsRevealed(iTeam))
end

function clearUnimprovedCache()
  pUnimprovedPlots = {}
  iUnimprovedIndex = 0
end

function cacheUnimprovedPlots(iTeam)
  pUnimprovedPlots = {}
  iUnimprovedIndex = 1

  local iPlotCount = 1
  local iIndexDistance = 999
  local pCentrePlot = Map.GetPlot(UI.GetMouseOverHex())
  
  local bCheckRail = Controls.UnimprovedRoads:IsChecked() and Teams[iTeam]:IsHasTech(iTechRail)

  for iPlot = 0, Map.GetNumPlots()-1, 1 do
    local bCachePlot = false
    local pPlot = Map.GetPlotByIndex(iPlot)

	if (pPlot:GetTeam() == iTeam and not pPlot:IsCity()) then
	  local iResource = pPlot:GetResourceType(iTeam)

	  -- Only interested in plots that our team owns that are not improved
	  if (pPlot:GetImprovementType() == -1) then
		-- Are we within working range of a city
		if (pPlot:IsWithinTeamCityRadius(iTeam, -1)) then
		  -- Doesn't matter what's here, we can improve it
		  if (iResource ~= -1) then
			if (GameInfo.Resources[iResource].ResourceClassType == "RESOURCECLASS_LUXURY") then
		      bCachePlot = Controls.UnimprovedLuxuries:IsChecked()
			elseif (GameInfo.Resources[iResource].ResourceClassType == "RESOURCECLASS_BONUS") then
		      bCachePlot = Controls.UnimprovedBonuses:IsChecked()
			else
		      bCachePlot = Controls.UnimprovedStrategics:IsChecked()
			end
		  elseif (not (pPlot:IsWater() or pPlot:IsImpassable())) then
		    bCachePlot = Controls.UnimprovedOther:IsChecked()
		  end
		else
		  if (iResource ~= -1 and GameInfo.Resources[iResource].ResourceClassType ~= "RESOURCECLASS_BONUS") then
	        -- We can always improve luxuries or strategics
			if (GameInfo.Resources[iResource].ResourceClassType == "RESOURCECLASS_LUXURY") then
		      bCachePlot = Controls.UnimprovedLuxuries:IsChecked()
			else
		      bCachePlot = Controls.UnimprovedStrategics:IsChecked()
			end
		  end
		end
	  elseif (iResource ~= -1 and not pPlot:IsResourceConnectedByImprovement(pPlot:GetImprovementType())) then
		-- We have an improvement on a resource, but it's the wrong one (farm on horses, etc)
		if (GameInfo.Resources[iResource].ResourceClassType == "RESOURCECLASS_LUXURY") then
		  bCachePlot = Controls.UnimprovedLuxuries:IsChecked()
		elseif (GameInfo.Resources[iResource].ResourceClassType == "RESOURCECLASS_BONUS") then
		  bCachePlot = Controls.UnimprovedBonuses:IsChecked()
		else
		  bCachePlot = Controls.UnimprovedStrategics:IsChecked()
		end
	  end

      -- And plots that we need to upgrade to a railway
	  if (not bCachePlot and bCheckRail and pPlot:GetRouteType() == iRouteRoad) then
		bCachePlot = true
	  end
	else
	  -- Unless we're responsible for the road here
	  if (bCheckRail and pPlot:GetRouteType() == iRouteRoad) then
		local iResponsiblePlayer = pPlot.GetPlayerResponsibleForRoute and pPlot:GetPlayerResponsibleForRoute() or -1

	    if (iResponsiblePlayer ~= -1 and Players[iResponsiblePlayer]:GetTeam() == iTeam) then
		  bCachePlot = true
		end
	  end
	end

	if (bCachePlot) then
      table.insert(pUnimprovedPlots, pPlot)
      iPlotCount = iPlotCount + 1

	  if (pCentrePlot ~= nil) then
        local iDistance = Map.PlotDistance(pCentrePlot:GetX(), pCentrePlot:GetY(), pPlot:GetX(), pPlot:GetY())

	  	if (iDistance < iIndexDistance) then
		  iUnimprovedIndex = iPlotCount
		  iIndexDistance = iDistance
		end
      end
	end
  end

  iUnimprovedIndex = math.min(iUnimprovedIndex, #pUnimprovedPlots)

  LuaEvents.MiniMapOverlayHideLegendNav(iUnimprovedIndex == 0)
end


function highlightNone()
  Events.ClearHexHighlights()
end

function highlightPlot(iTeam, pPlot, highlight)
  Events.SerialEventHexHighlight(ToHexFromGrid(Vector2(pPlot:GetX(), pPlot:GetY())), true, highlight)
end

function OnUnimprovedOptionsOffset(offsetX, offsetY)
  Controls.UnimprovedOptions:SetOffsetVal(offsetX, offsetY+5)
end

function OnUnimprovedTilesDisplay(bShow)
  if (bShow) then
    LuaEvents.MiniMapOverlayLegend("TXT_KEY_SV_OVERLAY_UNIMPROVED_TILES", {})

    Show()

    LuaEvents.MiniMapOverlayResizeLegendOptions(Controls.UnimprovedOptions:GetSizeX(), Controls.UnimprovedOptions:GetSizeY(), OnUnimprovedOptionsOffset)

    OnUnimprovedChecked(true)
  else
    highlightNone()

    Hide()
  end

end
LuaEvents.UnimprovedTilesDisplay.Add(OnUnimprovedTilesDisplay)

function OnUnimprovedChecked(bIsChecked)
  local iTeam = Game.GetActiveTeam()

  highlightNone()
  cacheUnimprovedPlots(iTeam)

  local bCheckRail = Controls.UnimprovedRoads:IsChecked() and Teams[iTeam]:IsHasTech(iTechRail)
  
  for _, pPlot in ipairs(pUnimprovedPlots) do
    if (bCheckRail and pPlot:GetRouteType() == iRouteRoad) then
      highlightPlot(iTeam, pPlot, tileColours["ROAD"])
    else
	  local iResource = pPlot:GetResourceType(iTeam)
	  
      if (iResource ~= -1) then
        highlightPlot(iTeam, pPlot, tileColours[GameInfo.Resources[iResource].ResourceClassType])
	  else
        highlightPlot(iTeam, pPlot, tileColours["OTHER"])
	  end
	end
  end
end

function OnNextUnimprovedTile()
  lookatUnimprovedTile(Game.GetActiveTeam(), 1)
end
LuaEvents.UnimprovedTilesDisplayNext.Add(OnNextUnimprovedTile)

function OnPreviousUnimprovedTile()
  lookatUnimprovedTile(Game.GetActiveTeam(), -1)
end
LuaEvents.UnimprovedTilesDisplayPrevious.Add(OnPreviousUnimprovedTile)

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
  Controls.UnimprovedLuxuries:RegisterCheckHandler(OnUnimprovedChecked)
  Controls.UnimprovedStrategics:RegisterCheckHandler(OnUnimprovedChecked)
  Controls.UnimprovedBonuses:RegisterCheckHandler(OnUnimprovedChecked)
  Controls.UnimprovedOther:RegisterCheckHandler(OnUnimprovedChecked)
  Controls.UnimprovedRoads:RegisterCheckHandler(OnUnimprovedChecked)
  
  for row in DB.Query("SELECT t.ID FROM Technologies t, Builds b, Routes r WHERE r.Industrial=1 AND r.Type=b.RouteType AND b.PrereqTech=t.Type") do
    iTechRail = row.ID
  end

  Hide()
end

Init()
