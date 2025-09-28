print("[CAYM] Prospecting Lua loaded")

include("FLuaVector.lua")

-- ===============================
-- IDs
-- ===============================
local iMine     = GameInfoTypes.IMPROVEMENT_MINE
local iPasture  = GameInfoTypes.IMPROVEMENT_PASTURE
local iWell     = GameInfoTypes.IMPROVEMENT_WELL
local iPlatform = GameInfoTypes.IMPROVEMENT_OFFSHORE_PLATFORM

local iCoal = GameInfoTypes.RESOURCE_COAL
local iHorse = GameInfoTypes.RESOURCE_HORSE
local iIron = GameInfoTypes.RESOURCE_IRON
local iOil  = GameInfoTypes.RESOURCE_OIL

local iProspectCoal     = GameInfoTypes.IMPROVEMENT_PROSPECT_COAL
local iProspectHorse    = GameInfoTypes.IMPROVEMENT_PROSPECT_HORSE
local iProspectIron     = GameInfoTypes.IMPROVEMENT_PROSPECT_IRON
local iProspectOilLand  = GameInfoTypes.IMPROVEMENT_PROSPECT_OIL
local iProspectOilSea   = GameInfoTypes.IMPROVEMENT_PROSPECT_OIL_SEA

-- ===============================
-- Rules (per improvement)
-- ===============================
local CAP = 12
local ProspectRules = {
  [iProspectCoal]    = { resource=iCoal,  amount=4, placeImp=iMine,     requireWater=false, name="COAL"  },
  [iProspectHorse]   = { resource=iHorse, amount=4, placeImp=iPasture,  requireWater=false, name="HORSE" },
  [iProspectIron]    = { resource=iIron,  amount=4, placeImp=iMine,     requireWater=false, name="IRON"  },
  [iProspectOilLand] = { resource=iOil,   amount=4, placeImp=iWell,     requireWater=false, name="OIL"   },
  [iProspectOilSea]  = { resource=iOil,   amount=4, placeImp=iPlatform, requireWater=true,  name="OIL"   },
}

-- ===============================
-- Helpers
-- ===============================
local function GetTotal(playerID, resID)
  local p = Players[playerID]
  if not p then return 0 end
  return p:GetNumResourceTotal(resID, true) or 0
end

-- ===============================
-- 1) PREVENT CLICK (disable button) + notify once per turn
-- ===============================
-- We notify only once per player per resource per turn to avoid spam.
local g_Notified = {}  -- g_Notified[turn] = { [playerID] = { [resID] = true } }

GameEvents.PlayerCanBuild.Add(function(playerID, plotX, plotY, buildType)
  local rule = ProspectRules[buildType]
  if not rule then
    return true -- not a prospect action; allow default behavior
  end

  local pPlayer = Players[playerID]
  if not pPlayer then return false end

  local plot = Map.GetPlot(plotX, plotY)
  if not plot then return false end

  -- Enforce water/land requirement
  if rule.requireWater and not plot:IsWater() then
    return false
  end
  if (not rule.requireWater) and plot:IsWater() then
    return false
  end

  -- Must not already have a resource here
  if plot:GetResourceType() ~= -1 then
    return false
  end

  -- Hard cap check
  local total = GetTotal(playerID, rule.resource)
  if total > CAP then
    -- One-time notification per turn
    if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
      local turn = Game.GetGameTurn()
      g_Notified[turn] = g_Notified[turn] or {}
      g_Notified[turn][playerID] = g_Notified[turn][playerID] or {}
      if not g_Notified[turn][playerID][rule.resource] then
        pPlayer:AddNotification(
          NotificationTypes.NOTIFICATION_GENERIC,
          string.format("Prospecting blocked: You currently have more than %d %s.", CAP, rule.name),
          "Prospecting Blocked"
        )
        g_Notified[turn][playerID][rule.resource] = true
      end
    end
    return false
  end

  return true
end)

-- ===============================
-- 2) ON BUILD CREATED: convert prospect improv. -> resource + proper improvement
-- ===============================
local function MakeResourceFromProspect(plot, playerID, buildImpID)
  local rule = ProspectRules[buildImpID]
  if not rule then return end

  -- Double-check cap and tile validity (safety)
  if plot:GetResourceType() ~= -1 then return end
  if rule.requireWater and not plot:IsWater() then return end
  if (not rule.requireWater) and plot:IsWater() then return end

  local total = GetTotal(playerID, rule.resource)
  if total > CAP then
    print(string.format("[Prospect Blocked] Player %d has too much %s (%d)", playerID, rule.name, total))
    return
  end

  -- Perform conversion
  plot:SetImprovementType(-1)
  plot:SetResourceType(rule.resource, rule.amount)
  plot:SetImprovementType(rule.placeImp)

  print(string.format("[Prospect] Player %d created %s (total before: %d)", playerID, rule.name, total))
end

-- Single handler for all prospect improvements
Events.SerialEventImprovementCreated.Add(function(HexX, HexY, _, _, iPlayer, iImprovement)
  local plot = Map.GetPlot(ToGridFromHex(HexX, HexY))
  if not plot then return end
  if ProspectRules[iImprovement] then
    MakeResourceFromProspect(plot, iPlayer, iImprovement)
  end
end)

print("[CAYM] Prospecting Lua gated with cap & notifications")
