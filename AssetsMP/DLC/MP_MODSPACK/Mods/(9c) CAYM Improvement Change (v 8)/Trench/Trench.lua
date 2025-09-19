print("[CAYM] 'Improvement - Attack Trench' mod script.")
-- =====================================================================
-- Config / IDs
-- =====================================================================
local iBuildAttackTrench       = GameInfoTypes.BUILD_ATTACK_TRENCH
local iImprovementAttackTrench = GameInfoTypes.IMPROVEMENT_ATTACK_TRENCH
local iWorker                  = GameInfoTypes.UNIT_WORKER
local iLegion                  = GameInfoTypes.UNIT_ROMAN_LEGION or -1  -- 로마 군단병(있으면 체크)
local FRONT_RADIUS             = 7  -- AI 전선 판정 반경 (6~8 권장)

-- 턴별/타일별 캐시: g_CanBuildFrontline[turn][iPlayer][plotIndex] = bool
local g_CanBuildFrontline = {}

-- =====================================================================
-- Frontline check for AI (거리 기반, 캐시 적용)
-- =====================================================================
local function CanBuildTrench_AI_Frontline(iPlayer, iPlotX, iPlotY)
  local pPlayer = Players[iPlayer]
  local pTeam   = Teams[pPlayer:GetTeam()]

  -- 평시엔 바로 불가
  if pTeam:GetAtWarCount(false) == 0 then
    return false
  end

  local pPlot = Map.GetPlot(iPlotX, iPlotY)
  if not pPlot then
    return false
  end

  -- 캐시 키 계산
  local turn = Game.GetGameTurn()
  local gridX = Map.GetGridSizeX()
  local plotIndex = iPlotY * gridX + iPlotX

  g_CanBuildFrontline[turn] = g_CanBuildFrontline[turn] or {}
  local tTurn = g_CanBuildFrontline[turn]
  tTurn[iPlayer] = tTurn[iPlayer] or {}

  if tTurn[iPlayer][plotIndex] ~= nil then
    return tTurn[iPlayer][plotIndex]
  end

  -- 적 도시가 FRONT_RADIUS 이내에 있으면 전선으로 간주
  local allow = false
  for iLoopPlayer = 0, GameDefines.MAX_CIV_PLAYERS - 1 do
    local pEnemy = Players[iLoopPlayer]
    if pEnemy and pEnemy:IsAlive() and pTeam:IsAtWar(pEnemy:GetTeam()) then
      -- 도시국가 제외하고 싶다면 아래 조건문 사용:
      -- if pEnemy:IsMinorCiv() then goto continueEnemy end

      for pCity in pEnemy:Cities() do
        if Map.PlotDistance(iPlotX, iPlotY, pCity:GetX(), pCity:GetY()) <= FRONT_RADIUS then
          allow = true
          break
        end
      end

      if allow then break end
    end
    -- ::continueEnemy:: -- GOTO 제거됨
  end

  -- 캐시 저장
  tTurn[iPlayer][plotIndex] = allow
  return allow
end

-- =====================================================================
-- 기타 기능 연결하고 싶다면 여기에 추가
-- =====================================================================
-- 예: 유닛이 자동으로 도랑을 파는 행동, AI 사용 조건 등등

-- print("Trench.lua loaded successfully.") -- 로그 확인용
