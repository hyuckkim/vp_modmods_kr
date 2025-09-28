-- Cemetery_Ceremony.lua (VFS = true)
include("FLuaVector.lua")

local unitClassAdmiralID   = GameInfoTypes.UNITCLASS_GREAT_ADMIRAL
local unitClassArtistID    = GameInfoTypes.UNITCLASS_ARTIST
local unitClassDiplomatID  = GameInfoTypes.UNITCLASS_GREAT_DIPLOMAT
local unitClassEngineerID  = GameInfoTypes.UNITCLASS_ENGINEER
local unitClassGeneralID   = GameInfoTypes.UNITCLASS_GREAT_GENERAL
local unitClassMerchantID  = GameInfoTypes.UNITCLASS_MERCHANT
local unitClassMusicianID  = GameInfoTypes.UNITCLASS_MUSICIAN
local unitClassProphetID   = GameInfoTypes.UNITCLASS_PROPHET
local unitClassScientistID = GameInfoTypes.UNITCLASS_SCIENTIST
local unitClassWriterID    = GameInfoTypes.UNITCLASS_WRITER

local unitClassCargoShipID = GameInfoTypes.UNITCLASS_CARGO_SHIP
local unitClassCaravanID   = GameInfoTypes.UNITCLASS_CARAVAN

local BUILDING_CEMETERY         = GameInfoTypes.BUILDING_CEMETERY
local BUILDING_CEMETERY_DUMMY   = GameInfoTypes.BUILDING_CEMETERY_DUMMY

local function KilledNearestCity(plot, player)
  local bestCity, bestDist
  for city in player:Cities() do
    local d = Map.PlotDistance(plot:GetX(), plot:GetY(), city:GetX(), city:GetY())
    if not bestDist or d < bestDist then
      bestDist, bestCity = d, city
    end
  end
  return bestCity
end

local function CemeteryCeremony(playerID, unitID, iUnitType, plotX, plotY, isDelay)
  if isDelay then return end

  local pPlayer = Players[playerID]
  if not pPlayer then return end

  local pUnit = pPlayer:GetUnitByID(unitID)
  if not pUnit then return end

  local uClass = pUnit:GetUnitClassType()
  if uClass == unitClassCargoShipID or uClass == unitClassCaravanID then return end

  local GPDead =
       uClass == unitClassAdmiralID   or uClass == unitClassArtistID
    or uClass == unitClassDiplomatID  or uClass == unitClassEngineerID
    or uClass == unitClassGeneralID   or uClass == unitClassMerchantID
    or uClass == unitClassMusicianID  or uClass == unitClassProphetID
    or uClass == unitClassScientistID or uClass == unitClassWriterID

  local gameSpeedFaith = (GameInfo.GameSpeeds[Game.GetGameSpeedType()].FaithPercent or 100) / 100
  local iEraModifier   = math.max(pPlayer:GetCurrentEra() or 1, 1)
  local GainFaith      = math.floor(gameSpeedFaith * iEraModifier)

  local pUnitPlot = Map.GetPlot(plotX, plotY)
  if not pUnitPlot then return end

  if pUnit:GetOwner() ~= playerID then return end

  local pCity = KilledNearestCity(pUnitPlot, pPlayer)
  if not pCity then return end
  if not pCity:IsHasBuilding(BUILDING_CEMETERY) then return end

  pPlayer:ChangeFaith(GainFaith)

  if GPDead then
    local cur = pCity:GetNumRealBuilding(BUILDING_CEMETERY_DUMMY)
    pCity:SetNumRealBuilding(BUILDING_CEMETERY_DUMMY, cur + 1)
  end

  if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
    local iX, iY = pCity:GetX(), pCity:GetY()
    Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iX, iY))), "[COLOR_WHITE]+".. GainFaith .." [ICON_PEACE][ENDCOLOR]", 1)
    if GPDead then
      local sCityName = pCity:GetName()
      pPlayer:AddNotification(
        NotificationTypes.NOTIFICATION_INSTANT_YIELD,
        'Funerals of a [ICON_GREAT_PEOPLE] personality:[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]'.. sCityName ..': [ENDCOLOR]+1 [ICON_PEACE] Faith [COLOR_POSITIVE_TEXT]permanently[ENDCOLOR] in '.. sCityName,
        'Permanent City Bonus',
        iX, iY, pCity:GetID()
      )
    end
  end
end

GameEvents.UnitPrekill.Add(CemeteryCeremony)

print("Cemetery ceremony handler loaded.")
