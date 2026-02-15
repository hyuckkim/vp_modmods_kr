print("[CAYM] 'Improvement - Attack Trench' mod script.")

-- =====================================================================
-- Config / IDs
-- =====================================================================
local iBuildAttackTrench       = GameInfoTypes.BUILD_ATTACK_TRENCH
local iImprovementAttackTrench = GameInfoTypes.IMPROVEMENT_ATTACK_TRENCH
local iWorker                  = GameInfoTypes.UNIT_WORKER
local iLegion                  = GameInfoTypes.UNIT_ROMAN_LEGION or -1
local FRONT_RADIUS             = 7

-- Cache for per-turn, per-player, per-plot frontline checks
local g_CanBuildFrontline = {}

-- =====================================================================
-- Frontline check for AI
-- Returns true if the plot is within FRONT_RADIUS tiles of any enemy city.
-- Minor civs are blocked here as well.
-- =====================================================================
local function CanBuildTrench_AI_Frontline(iPlayer, iPlotX, iPlotY)
  local pPlayer = Players[iPlayer]
  if not pPlayer then return false end

  -- Block minor civs entirely
  if pPlayer:IsMinorCiv() then
    return false
  end

  local pTeam = Teams[pPlayer:GetTeam()]
  if pTeam:GetAtWarCount(false) == 0 then
    return false
  end

  local pPlot = Map.GetPlot(iPlotX, iPlotY)
  if not pPlot then
    return false
  end

  -- Memoize result for this turn/player/plot to avoid recomputation
  local turn = Game.GetGameTurn()
  local gridX = Map.GetGridSizeX()
  local plotIndex = iPlotY * gridX + iPlotX

  g_CanBuildFrontline[turn] = g_CanBuildFrontline[turn] or {}
  local tTurn = g_CanBuildFrontline[turn]
  tTurn[iPlayer] = tTurn[iPlayer] or {}

  if tTurn[iPlayer][plotIndex] ~= nil then
    return tTurn[iPlayer][plotIndex]
  end

  local allow = false
  for iLoopPlayer = 0, GameDefines.MAX_CIV_PLAYERS - 1 do
    local pEnemy = Players[iLoopPlayer]
    if pEnemy and pEnemy:IsAlive() and pTeam:IsAtWar(pEnemy:GetTeam()) then
      -- If you want to ignore minor-civ cities as frontlines, wrap the city loop with:
      -- if not pEnemy:IsMinorCiv() then ... end

      for pCity in pEnemy:Cities() do
        if Map.PlotDistance(iPlotX, iPlotY, pCity:GetX(), pCity:GetY()) <= FRONT_RADIUS then
          allow = true
          break
        end
      end

      if allow then break end
    end
  end

  tTurn[iPlayer][plotIndex] = allow
  return allow
end

-- =====================================================================
-- Final build permission hook (human/AI). Blocks minor civs entirely.
-- Also enforces the frontline condition for majors.
-- =====================================================================
GameEvents.PlayerCanBuild.Add(function(playerID, plotX, plotY, buildType)
  -- Only handle the trench build; allow others
  if buildType ~= iBuildAttackTrench then
    return true
  end

  local p = Players[playerID]
  if not p then
    return false
  end

  -- Hard block: minor civs cannot build the trench
  if p:IsMinorCiv() then
    return false
  end

  -- Apply frontline condition for majors
  return CanBuildTrench_AI_Frontline(playerID, plotX, plotY)

  -- If you prefer to ignore the frontline condition and let majors always build:
  -- return true
end)

print("Trench.lua loaded successfully with minor-civ block.")
