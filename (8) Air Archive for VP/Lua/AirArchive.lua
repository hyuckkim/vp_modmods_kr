-- EAW_AirOpsToggle.lua (수정본)
print("AirArchive: EAW_AirOpsToggle loading...")

local carrierRow = GameInfo.UnitPromotions["PROMOTION_CARRIER_OPS"]
local airbaseRow = GameInfo.UnitPromotions["PROMOTION_AIRBASE_OPS"]
local PROMO_CARRIER = carrierRow and carrierRow.ID
local PROMO_AIRBASE = airbaseRow and airbaseRow.ID

if not (PROMO_CARRIER and PROMO_AIRBASE) then
  print("AirArchive: EAW_AirOpsToggle: promotions not found, aborting.")
  return
else
  print(string.format("AirArchive: promos ok (carrier=%d, airbase=%d)", PROMO_CARRIER, PROMO_AIRBASE))
end

-- 대상 유닛(있으면 적용, 없으면 무시)
local TARGET_UNIT = {}
for t in pairs({
  UNIT_TRIPLANE=true, UNIT_EARLYMONOPLAN=true, UNIT_FIGHTER=true, UNIT_JAPANESE_ZERO=true,
  UNIT_EARLYJET=true, UNIT_JET27=true, UNIT_MIG29=true, UNIT_JET_FIGHTER=true, UNIT_ADVJET=true,
  UNIT_WWI_BOMBER=true, UNIT_LIGHTBOMBER=true, UNIT_BOMBER=true, UNIT_AMERICAN_B17=true,
  UNIT_STRBOMB=true, UNIT_B52=true, UNIT_ULTJETBOMB=true, UNIT_STEALTH_BOMBER=true,
  UNIT_FW_DRONE_FIGHTER_2=true, UNIT_FW_PLASMA_FIGHTER=true, UNIT_FW_SPACE_FIGHTER=true
}) do
  local row = GameInfo.Units[t]
  if row then TARGET_UNIT[row.ID] = true end
end

local function ApplyAirOpsPromo(unit)
  if not unit then return end
  if not TARGET_UNIT[unit:GetUnitType()] then return end

  -- 1) 항모에 적재되어 있으면 함재 승급
  local carrier = unit:GetTransportUnit()
  if carrier and carrier:GetOwner() == unit:GetOwner() then
    if not unit:IsHasPromotion(PROMO_CARRIER) then unit:SetHasPromotion(PROMO_CARRIER, true) end
    if unit:IsHasPromotion(PROMO_AIRBASE) then unit:SetHasPromotion(PROMO_AIRBASE, false) end
    return
  end

  -- 2) 도시 타일 위면 공항 주둔 승급
  local plot = unit:GetPlot()
  if plot and plot:IsCity() then
    if not unit:IsHasPromotion(PROMO_AIRBASE) then unit:SetHasPromotion(PROMO_AIRBASE, true) end
    if unit:IsHasPromotion(PROMO_CARRIER) then unit:SetHasPromotion(PROMO_CARRIER, false) end
    return
  end

  -- 3) 둘 다 아니면 둘 다 제거
  if unit:IsHasPromotion(PROMO_CARRIER) then unit:SetHasPromotion(PROMO_CARRIER, false) end
  if unit:IsHasPromotion(PROMO_AIRBASE) then unit:SetHasPromotion(PROMO_AIRBASE, false) end
end

-- 턴 시작에 전부 정리
GameEvents.PlayerDoTurn.Add(function(playerID)
  local p = Players[playerID]
  if not p or not p:IsAlive() then return end
  for unit in p:Units() do
    ApplyAirOpsPromo(unit)
  end
end)

-- 좌표 이동 시 즉시 갱신
GameEvents.UnitSetXY.Add(function(playerID, unitID, x, y)
  local p = Players[playerID]; if not p then return end
  local u = p:GetUnitByID(unitID); if not u then return end
  ApplyAirOpsPromo(u)
end)

-- 재배치 시(있으면) 갱신
if Events and Events.SerialEventUnitRebased then
  Events.SerialEventUnitRebased.Add(function(playerID, unitID)
    local p = Players[playerID]; if not p then return end
    local u = p:GetUnitByID(unitID); if not u then return end
    ApplyAirOpsPromo(u)
  end)
end

-- 생산 직후 시드
GameEvents.CityTrained.Add(function(playerID, cityID, unitID, bGold, bFaith)
  local p = Players[playerID]; if not p then return end
  local u = p:GetUnitByID(unitID); if not u then return end
  ApplyAirOpsPromo(u)
end)

print("AirArchive: EAW_AirOpsToggle loaded.")
