-- ==========================================================
-- Undersea Tunnel: 설치 즉시 Railroad 생성 (바다+육지≤6칸 조건)
--  - 두 이벤트 모두 훅: TileImprovementChanged + BuildFinished
--  - 상수명 방어: GameInfoTypes nil 체크
--  - 1턴 내 누락 보정용 미니 큐 (선택)
-- ==========================================================
local TUNNEL_IMP_KEYS = {
  "IMPROVEMENT_UNDERSEA_TUNNEL",
  "IMPROVEMENT_FW_UNDERSEA_TUNNEL",     -- 다른 네이밍 대비
}
local TUNNEL_BUILD_KEYS = {
  "BUILD_UNDERSEA_TUNNEL",
  "BUILD_FW_UNDERSEA_TUNNEL",
}
local RAIL_KEY = "ROUTE_RAILROAD"

local iRouteRailroad = GameInfoTypes[RAIL_KEY]
if not iRouteRailroad then
  print("ERROR: ROUTE_RAILROAD not found.")
  return
end

-- 실제로 존재하는 터널 Improvement/Build만 수집
local TunnelImprovementIDs = {}
for _, k in ipairs(TUNNEL_IMP_KEYS) do
  local id = GameInfoTypes[k]
  if id then TunnelImprovementIDs[id] = true end
end
local TunnelBuildIDs = {}
for _, k in ipairs(TUNNEL_BUILD_KEYS) do
  local id = GameInfoTypes[k]
  if id then TunnelBuildIDs[id] = true end
end

if (next(TunnelImprovementIDs) == nil) and (next(TunnelBuildIDs) == nil) then
  print("ERROR: No Undersea Tunnel Improvement/Build IDs found.")
  return
end

-- 옵션: 육지 근접 범위
local NEAR_LAND_RANGE = 6

local function IsWithinRangeOfLand(plot, range)
  if not plot then return false end
  local x, y = plot:GetX(), plot:GetY()
  for dx = -range, range do
    for dy = -range, range do
      local nx, ny = x + dx, y + dy
      local nPlot = Map.GetPlot(nx, ny)
      if nPlot and Map.PlotDistance(x, y, nx, ny) <= range then
        if not nPlot:IsWater() then
          return true
        end
      end
    end
  end
  return false
end

local function TryLayRailOnPlot(plot)
  if not plot then return end
  -- 조건 1: 바다여야 하고(호수 제외)
  if (not plot:IsWater()) or plot:IsLake() then return end
  -- 조건 2: 주변 육지 ≤ NEAR_LAND_RANGE
  if not IsWithinRangeOfLand(plot, NEAR_LAND_RANGE) then return end
  -- 실행: 철도 지정
  plot:SetRouteType(iRouteRailroad, true)
end

-- 누락 보정용 큐 (일부 모드/환경에서 개선 변경 이벤트 타이밍 이슈 대비)
local pendingPlots = {}   -- [plotIndex] = true
local function EnqueuePlot(x, y)
  local p = Map.GetPlot(x, y)
  if p then
    pendingPlots[p:GetPlotIndex()] = true
  end
end

-- A) 개선 변경 훅(가장 직관적)
local function OnTileImprovementChanged(x, y, oldImp, newImp)
  if newImp and TunnelImprovementIDs[newImp] then
    local plot = Map.GetPlot(x, y)
    TryLayRailOnPlot(plot)
    -- 혹시 엔진 타이밍 문제로 반영 안되면 보정 큐에 넣는다
    EnqueuePlot(x, y)
  end
end
GameEvents.TileImprovementChanged.Add(OnTileImprovementChanged)

-- B) 빌드 완료 훅(환경/모드에 따라 A가 안 올 때를 대비한 백업)
if GameEvents.BuildFinished then
  local function OnBuildFinished(iPlayer, x, y, iBuildType, bGold, bFaith)
    if iBuildType and TunnelBuildIDs[iBuildType] then
      local plot = Map.GetPlot(x, y)
      TryLayRailOnPlot(plot)
      EnqueuePlot(x, y)
    end
  end
  GameEvents.BuildFinished.Add(OnBuildFinished)
end

-- C) 1턴 내 보정: 큐에 담긴 플롯 재시도 후 비움
local function OnPlayerDoTurn(iPlayer)
  if next(pendingPlots) == nil then return end
  for plotIndex, _ in pairs(pendingPlots) do
    local plot = Map.GetPlotByIndex(plotIndex)
    TryLayRailOnPlot(plot)
    pendingPlots[plotIndex] = nil
  end
end
GameEvents.PlayerDoTurn.Add(OnPlayerDoTurn)
