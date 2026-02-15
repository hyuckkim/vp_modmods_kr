local PinType = {
  Capital   = 8,  -- Capital Icon
  CityState = 7,  -- CS Icon
  Resource  = 10, -- Star Icon
  Wonder    = 9,  -- Happy Icon
}

local g_Pins = {}


function AddPinForWonder(iFeature)
  print(string.format("AddPinForWonder(%i)", iFeature))
  for iPlot = 0, Map.GetNumPlots()-1, 1 do
    local pPlot = Map.GetPlotByIndex(iPlot)

    if (pPlot:GetFeatureType() == iFeature) then
      if PlotHasPin(pPlot, PinType.Wonder) then
        -- Plot already has a feature pin, this can occur when a game is re-loaded the turn the feature was revealed
        return nil
      end
      
      -- Special case handling for the Great Barrier Reef as its twin may already have a pin
      if (iFeature == GameInfoTypes.FEATURE_REEF) then
        local numDirections = DirectionTypes.NUM_DIRECTION_TYPES
        for iDirection = 0, numDirections-1, 1 do
          local pAdjacentPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), iDirection)

          if (pAdjacentPlot ~= nil and pAdjacentPlot:GetFeatureType() == iFeature) then
            if (not PlotHasPin(pAdjacentPlot, PinType.Wonder)) then
              -- Neither reef plot has a pin, decide which one to pin based on visibility
              if (pPlot:IsRevealed(Game.GetActiveTeam())) then
                return AddPinForPlot(pPlot, PinType.Wonder, GameInfo.Features[iFeature].Description)
              else
                return AddPinForPlot(pAdjacentPlot, PinType.Wonder, GameInfo.Features[iFeature].Description)
              end
            end

            return nil
          end
        end

        -- Should never get here as the GBR should always have a twin, but allow for custom maps where it doesn't
      end

      return AddPinForPlot(pPlot, PinType.Wonder, GameInfo.Features[iFeature].Description)
    end
  end

  return nil
end

function AddPinForCityState(sTitle)
  print(string.format("AddPinForCityState(%s)", sTitle))
  -- First, parse out the CS name from the notification text
  local sPattern = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_MET_MINOR_CIV", "###")
  local iStart, iEnd = string.find(sPattern, "###")

  local sCsName = string.sub(sTitle, iStart)

  if (iEnd ~= string.len(sPattern)) then
    sCsName = string.sub(sCsName, 1, (string.len(sCsName) - (string.len(sPattern) - iEnd)))
  end
  print(string.format("AddPinForCityState(%s)", sCsName))

  -- Second, find the minor civ with that name
  for iCs = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS-2 do
    local pCs = Players[iCs]

    if (pCs:IsAlive() and pCs:GetName() == sCsName) then
      return AddPinForCapital(iCs)
    end
  end

  return nil
end

function AddPinForCapital(iPlayer)
  print(string.format("AddPinForCapital(%i)", iPlayer))
  local pPlayer = Players[iPlayer]
  local pCapital = pPlayer:GetCapitalCity()

  if (pCapital ~= nil) then
    local iType = pPlayer:IsMinorCiv() and PinType.CityState or PinType.Capital

    if PlotHasPin(pCapital, iType) then
      -- Plot already has a capital pin, this can occur when a game is re-loaded the turn the civilization was revealed
      return nil
    end
      
    return AddPinForPlot(pCapital, iType, pPlayer:GetCivilizationDescriptionKey())
  end
end

function AddPinsForResource(iResource)
  print(string.format("AddPinsForResource(%i)", iResource))
  local iPlayer = Game.GetActivePlayer()

  for iPlot = 0, Map.GetNumPlots()-1, 1 do
    local pPlot = Map.GetPlotByIndex(iPlot)

    if (pPlot:GetResourceType() == iResource and iPlayer == pPlot:GetOwner()) then
      if not (PlotHasCorrectImprovement(pPlot, iResource) or PlotHasPin(pPlot, PinType.Resource)) then
        AddPinForPlot(pPlot, PinType.Resource, Locale.ConvertTextKey("TXT_KEY_MAPPINS_AUTO_UNIMPROVED_RESOURCE", GameInfo.Resources[iResource].Description))
      end
    end
  end
end

function AddPinForPlot(pPlot, iType, sText)
  print(string.format("AddPinForPlot((%i, %i), %i, %s)", pPlot:GetX(), pPlot:GetY(), iType, sText))
  local response = {}
  LuaEvents.MapPins_Add(response, pPlot, sText, iType)

  return response.pinID
end


function PlotHasPin(pPlot, iType, sText)
  for _,pin in pairs(g_Pins) do
    if (pin.plot.x == pPlot:GetX() and pin.plot.y == pPlot:GetY()) then
      if (iType ~= nil and pin.type ~= iType) then
        return false
      end

      if (sText ~= nil and pin.text ~= sText) then
        return false
      end

      return true
    end
  end

  return false
end

function PlotHasCorrectImprovement(pPlot, iResource)
  local improvement = GameInfo.Improvements[pPlot:GetImprovementType()]

  if (improvement ~= nil) then
    for row in GameInfo.Improvement_ResourceTypes{ResourceType=GameInfo.Resources[iResource].Type} do
      if (row.ImprovementType == improvement.Type) then
        return true
      end
    end
  end

  return false
end


function OnNotificationAdded(iNotificationId, iNotificationType, sDescription, sTitle, iData1, iData2, iPlayer)
  -- print(string.format("OnNotificationAdded(%i, %i, %s, %s, %i, %i, %i)", iNotificationId, iNotificationType, (sDescription or ""), (sTitle or ""), (iData1 or 0), (iData2 or 0), iPlayer))
  if (iNotificationType == NotificationTypes.NOTIFICATION_EXPLORATION_RACE) then
    AddPinForWonder(iData1)
  elseif (iNotificationType == NotificationTypes.NOTIFICATION_MET_MINOR) then
    AddPinForCityState(sTitle)
  elseif (iNotificationType == NotificationTypes.NOTIFICATION_DISCOVERED_STRATEGIC_RESOURCE) then
    AddPinsForResource(iData1)
  end
end
Events.NotificationAdded.Add(OnNotificationAdded)


function OnPinsChange()
  g_Pins = {}
  LuaEvents.MapPins_Get(g_Pins)
end
LuaEvents.MapPins_ListDirty.Add(OnPinsChange)

OnPinsChange()
