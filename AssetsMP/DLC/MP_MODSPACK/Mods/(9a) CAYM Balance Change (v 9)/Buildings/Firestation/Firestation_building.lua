include("[CAYM] Firestation.lua")

-- ▼ 설정
local BUILDING_FIRESTATION = GameInfoTypes.BUILDING_FIRESTATION
local UNITCLASS_WORKER     = GameInfoTypes.UNITCLASS_WORKER
local BOOST_PERCENT        = 25   -- 작업 속도 +25%

-- 도시 소유 플롯 집합 만들기
local function CollectBoostPlots(pPlayer)
  local owned = {}  -- key "x,y" -> true
  for city in pPlayer:Cities() do
    if city:IsHasBuilding(BUILDING_FIRESTATION) then
      local n = city:GetNumCityPlots() or 0
      for i = 0, n - 1 do
        local plot = city:GetCityIndexPlot(i)
        if plot then owned[plot:GetX()..","..plot:GetY()] = true end
      end
    end
  end
  return owned
end

-- 진행도 가속
local function TryBoostWorker(u, ownedPlots)
  if not u or u:IsDelayedDeath() then return end
  if u:GetUnitClassType() ~= UNITCLASS_WORKER then return end
  local plot = u:GetPlot(); if not plot then return end
  -- 대상 타일 판정: 소방서 있는 '우리 도시' 소유 타일인가?
  if not ownedPlots[plot:GetX()..","..plot:GetY()] then return end
  -- 현재 작업 중인가?
  if not u.IsWork or not u:IsWork() then return end    -- (VP/CP에 존재)
  local build = u.GetBuildType and u:GetBuildType()
  if not build or build == -1 then return end
  -- 진행도 추가 (승급 없이 순수 가속)
  if plot.ChangeBuildProgress then
    local base = u.GetWorkRate and u:GetWorkRate() or 0
    local extra = math.floor(base * BOOST_PERCENT / 100)
    if extra > 0 then plot:ChangeBuildProgress(build, extra, u:GetOwner()) end
  end
end

GameEvents.PlayerDoTurn.Add(function(playerID)
  local p = Players[playerID]; if not p or p:IsBarbarian() then return end
  local ownedPlots = CollectBoostPlots(p)
  for u in p:Units() do TryBoostWorker(u, ownedPlots) end
end)

GameEvents.UnitSetXY.Add(function(playerID, unitID)
  local p = Players[playerID]; if not p or p:IsBarbarian() then return end
  local ownedPlots = CollectBoostPlots(p)
  local u = p:GetUnitByID(unitID); TryBoostWorker(u, ownedPlots)
end)

print("[CAYM] Firestation building is in game")