print("Loading FutureLua.lua from VP-FW mod");


--==========================================================
-- Buildings
---==========================================================
-------------------------------------------------------------
-- Ectogenesis Pod : 군사 10개당 더미 스택 부여 (상한 12)
--   - 트리거 건물이 있는 도시에만 적용
--   - 안정성 위해 PlayerDoTurn에서만 갱신
----------------------------------------------------------------

local iDummy       = GameInfoTypes.BUILDING_DUMMY_MIL10_STACK   -- 스택용 더미(스택 1개 = 효과 1단)
local UNITS_PER    = 10                                         -- 군사 10개당 1스택
local STACK_CAP    = 20                                         -- 스택 상한

-- 효과 받을 트리거 건물들(원하면 여기 추가)
local TRIGGERS = {
  [GameInfoTypes.BUILDING_FW_ECTOGENESIS_POD] = true,
  -- [GameInfoTypes.BUILDING_FW_HIVE] = true,
  -- [GameInfoTypes.BUILDING_FW_CENTRAL_COMMAND] = true,
}

-- 군사 유닛 판별: 전투 유닛이면서 민간 아님
local function IsMilitaryUnit(u)
  return u and u:IsCombatUnit() and not u:IsCivilianUnit()
end

-- 플레이어의 군사 유닛 총수
local function CountMilitaryUnits(p)
  local n = 0
  for u in p:Units() do
    if IsMilitaryUnit(u) then
      n = n + 1
    end
  end
  return n
end

-- 도시에 트리거 건물이 있는가?
local function CityHasTrigger(city)
  for b, _ in pairs(TRIGGERS) do
    if city:GetNumRealBuilding(b) > 0 then
      return true
    end
  end
  return false
end

-- 스택 갱신: 군사 수 → 스택 계산 → 트리거 도시만 더미 부여
local function UpdateStacks(p)
  if not p or not p:IsAlive() then return end

  local stacks = math.floor(CountMilitaryUnits(p) / UNITS_PER)
  if STACK_CAP then
    stacks = math.min(stacks, STACK_CAP)
  end

  for city in p:Cities() do
    local want = CityHasTrigger(city) and stacks or 0
    if city:GetNumRealBuilding(iDummy) ~= want then
      city:SetNumRealBuilding(iDummy, want)  -- 더미 "붙이기/떼기"
    end
  end
end

-- 매 턴 시작에만 갱신(안정성 최우선)
GameEvents.PlayerDoTurn.Add(function(iPlayer)
  UpdateStacks(Players[iPlayer])
end)

-- 즉시 반영이 필요하면 아래 이벤트를 해제해 사용(안정성은 PlayerDoTurn 단독이 더 좋음)
-- GameEvents.UnitCreated.Add(function(iPlayer) UpdateStacks(Players[iPlayer]) end)
-- GameEvents.UnitPrekill.Add(function(iPlayer) UpdateStacks(Players[iPlayer]) end)
-- GameEvents.CityConstructed.Add(function(iPlayer) UpdateStacks(Players[iPlayer]) end)
-- GameEvents.CitySoldBuilding.Add(function(iPlayer) UpdateStacks(Players[iPlayer]) end)


-----------------------------------------------------------------
-- BIOMOD : 인구 10당 스택(장군, 제독 점수+1, 황금기+2) - 상한 12
-----------------------------------------------------------------
local iDummyBiomod   = GameInfoTypes.BUILDING_DUMMY_BIOMOD_POP
local POP_PER_STACK  = 10
local BIOMOD_STACK_CAP = 20   -- ★ 추가: 최대 12스택

local TRIGGER_BIOMOD = GameInfoTypes.BUILDING_FW_BIOMOD_TANK

local function UpdateBiomodPopStacks(pPlayer)
  if not pPlayer or not pPlayer:IsAlive() then return end
  for city in pPlayer:Cities() do
    local want = 0
    if city:GetNumRealBuilding(TRIGGER_BIOMOD) > 0 then
      local pop = city:GetPopulation()
      want = math.floor(pop / POP_PER_STACK)
      want = math.min(want, BIOMOD_STACK_CAP)   -- ★ 상한 적용
    end
    if city:GetNumRealBuilding(iDummyBiomod) ~= want then
      city:SetNumRealBuilding(iDummyBiomod, want)
    end
  end
end

GameEvents.PlayerDoTurn.Add(function(iPlayer)
  UpdateBiomodPopStacks(Players[iPlayer])
end)

-- 즉시 반영 훅이 필요하면 아래를 해제(안정성은 턴당 갱신만으로도 충분)
-- GameEvents.CityConstructed.Add(function(iPlayer) UpdateBiomodPopStacks(Players[iPlayer]) end)
-- GameEvents.CitySoldBuilding.Add(function(iPlayer) UpdateBiomodPopStacks(Players[iPlayer]) end)
-- GameEvents.CityCaptureComplete.Add(function(oldOwner, isCap, x, y, newOwner)
--   UpdateBiomodPopStacks(Players[newOwner])
-- end)

--==========================================================
-- Wonders
---==========================================================
--==========================================================
-- Laputa (Space Station) : owner-wide dummy distribution
--  - 라퓨타 보유 문명의 모든 도시에 더미 1개
--  - 원더 상실 시 즉시 제거
--  - 점령/이양 시 양쪽 즉시 재분배
--  - 해안 여부 무관
--==========================================================

local iLaputa      = GameInfoTypes.BUILDING_FW_SPACE_STATION          -- 라퓨타 원더
local iLaputaDummy = GameInfoTypes.BUILDING_FW_FLOATINGISLANDS_DUMMY  -- 도시용 더미(1개=효과 1단)

local function RefreshLaputaForPlayer(pPlayer)
  if not pPlayer or not pPlayer:IsAlive() then return end
  local has = (pPlayer:CountNumBuildings(iLaputa) > 0)
  local want = has and 1 or 0
  for city in pPlayer:Cities() do
    if city:GetNumRealBuilding(iLaputaDummy) ~= want then
      city:SetNumRealBuilding(iLaputaDummy, want)
    end
  end
end

-- 원더 완성 시: 그 플레이어에게 즉시 분배
GameEvents.CityConstructed.Add(function(iPlayer, iCity, iBuilding)
  if iBuilding == iLaputa then
    RefreshLaputaForPlayer(Players[iPlayer])
  end
end)

-- 새 도시 생김(개척/해방/합병 등): 해당 플레이어 상태로 동기화
GameEvents.PlayerCityFounded.Add(function(iPlayer)
  RefreshLaputaForPlayer(Players[iPlayer])
end)

-- 도시 점령/이양: 양쪽 모두 재분배 (먹힌 도시는 더미 0, 탈환 시 1)
GameEvents.CityCaptureComplete.Add(function(iOldOwner, bIsCapital, iX, iY, iNewOwner)
  RefreshLaputaForPlayer(Players[iOldOwner])
  RefreshLaputaForPlayer(Players[iNewOwner])
end)

-- 로딩 안정화 + 매턴 동기화(안전망)
Events.LoadScreenClose.Add(function()
  for i = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
    RefreshLaputaForPlayer(Players[i])
  end
end)

GameEvents.PlayerDoTurn.Add(function(iPlayer)
  RefreshLaputaForPlayer(Players[iPlayer])
end)


--------------------------------------------
-- Mnemosyne : 최고 레벨 기반 XP 지급
--------------------------------------------

local iBuildingMnemosyne = GameInfoTypes.BUILDING_FW_MNEMOSYNE

GameEvents.CityTrained.Add(function(iPlayer, iCity, iUnitID)
  local pPlayer = Players[iPlayer]; if not pPlayer or not pPlayer:IsAlive() then return end
  local pCity   = pPlayer:GetCityByID(iCity); if not pCity then return end
  if not pCity:IsHasBuilding(iBuildingMnemosyne) then return end

  local pUnit = pPlayer:GetUnitByID(iUnitID)
  if not pUnit or not pUnit:IsCombatUnit() then return end

  local cap = 250
  local xp  = math.min(cap, pPlayer:GetHighestUnitLevel() * 10)
  pUnit:ChangeExperience(xp)
end)

--==========================================================
-- Angelnet : 오라 프로모션 부여/해제
--   - 앤젤넷 보유자만 대상
--   - 앤젤넷이 있는 '그 도시' 중심 반경 iRange 칸
--   - 도시 점령/이양/로딩에도 상태 유지
--==========================================================

local iBuildingAngelnet  = GameInfoTypes.BUILDING_FW_ANGELNET         -- 앤젤넷 원더
local iPromotionAngelnet = GameInfoTypes.PROMOTION_FW_ANGELNET        -- 부여할 프로모션
local iRangeAngelnet     = 4                                          -- 오라 반경

local g_AngelOwner   = nil
local g_AngelCityX   = nil
local g_AngelCityY   = nil

-- 앤젤넷 보유자/좌표 재탐색
local function RefindAngelnet()
  g_AngelOwner, g_AngelCityX, g_AngelCityY = nil, nil, nil
  for i = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
    local p = Players[i]
    if p and p:IsEverAlive() then
      for city in p:Cities() do
        if city and city:IsHasBuilding(iBuildingAngelnet) then
          g_AngelOwner = i
          g_AngelCityX = city:GetX()
          g_AngelCityY = city:GetY()
          return
        end
      end
    end
  end
end

-- 유닛 하나 프로모션 갱신
local function RefreshUnitAngel(u)
  if not g_AngelOwner or not g_AngelCityX then return end
  if not u or not u:IsCombatUnit() then return end
  local p = u:GetOwner()
  if p ~= g_AngelOwner then
    if u:IsHasPromotion(iPromotionAngelnet) then
      u:SetHasPromotion(iPromotionAngelnet, false)
    end
    return
  end
  local plot = u:GetPlot()
  if plot and Map.PlotDistance(plot:GetX(), plot:GetY(), g_AngelCityX, g_AngelCityY) <= iRangeAngelnet then
    if not u:IsHasPromotion(iPromotionAngelnet) then
      u:SetHasPromotion(iPromotionAngelnet, true)
    end
  else
    if u:IsHasPromotion(iPromotionAngelnet) then
      u:SetHasPromotion(iPromotionAngelnet, false)
    end
  end
end

-- 소유자의 모든 유닛 일괄 갱신(턴 시작 안정화용)
local function RefreshAllAngel()
  if not g_AngelOwner then return end
  local p = Players[g_AngelOwner]; if not p or not p:IsAlive() then return end
  for u in p:Units() do RefreshUnitAngel(u) end
end

-- 이벤트 훅
Events.LoadScreenClose.Add(function() RefindAngelnet(); RefreshAllAngel() end)

GameEvents.CityConstructed.Add(function(iPlayer, iCity, iBuilding)
  if iBuilding == iBuildingAngelnet then
    RefindAngelnet(); RefreshAllAngel()
  end
end)

GameEvents.CityCaptureComplete.Add(function(iOld, bCap, x, y, iNew)
  -- 점령으로 소유자/좌표가 바뀔 수 있으니 재탐색
  RefindAngelnet()
  -- 양쪽 유닛 모두 자연정리: 오너만 턴마다 정리되도록 유지
end)

GameEvents.UnitSetXY.Add(function(iPlayer, iUnit)
  -- 움직인 유닛만 즉시 갱신
  local p = Players[iPlayer]; if not p or not p:IsAlive() then return end
  RefreshUnitAngel(p:GetUnitByID(iUnit))
end)

GameEvents.PlayerDoTurn.Add(function(iPlayer)
  if g_AngelOwner == iPlayer then RefreshAllAngel() end
end)

-----------------------------------
-- Unit
----------------------------------
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetRandom
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandomFW(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end

--------------------------------------------
-- Crawler unit
--------------------------------------------
local iChanceMissileProduction = 25
local iHypermissile = GameInfoTypes.UNIT_FW_HYPERMISSILE

function CrawlerEffectsFW(iPlayer)
	local pPlayer = Players[iPlayer]
	for pUnit in pPlayer:Units() do
		if (pUnit:GetUnitType() == GameInfoTypes["UNIT_FW_CRAWLER"]) then
			--print("Crawler found")
			local iCheckForMissileProduction = JFD_GetRandomFW(1, 100)
			if (iCheckForMissileProduction < iChanceMissileProduction) then
				local pPlot = pUnit:GetPlot()
				if (pPlot ~= nil) then
					local iNumMissiles = 0
					for iVal = 0,(pPlot:GetNumUnits() - 1) do
						local loopUnit = pPlot:GetUnit(iVal)
						if (loopUnit:GetUnitType() == GameInfoTypes["UNIT_GUIDED_MISSILE"]) then
							--print("Missile found")
							iNumMissiles = iNumMissiles + 1
						end
					end
					--print("Total missiles: " .. iNumMissiles)
					if (iNumMissiles < 3) then
						local pNewUnit = pPlayer:InitUnit(iHypermissile, pPlot:GetX(), pPlot:GetY())
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(CrawlerEffectsFW)


--------------------------------------------
-- Angel unit
--------------------------------------------
local iChanceMissileProduction = 25
local iHypermissile = GameInfoTypes.UNIT_FW_HYPERMISSILE
local iNanohivePromotion = GameInfoTypes.PROMOTION_FW_NANOHIVE_PROMOTION

function AngelEffectsFW(iPlayer)
	local pPlayer = Players[iPlayer]
	for pUnit in pPlayer:Units() do
		if (pUnit:GetUnitType() == GameInfoTypes["UNIT_FW_ANGEL"]) then
			--print("Angel found")
			local iCheckForMissileProduction = JFD_GetRandomFW(1, 100)
			if (iCheckForMissileProduction < iChanceMissileProduction) then
				local pPlot = pUnit:GetPlot()
				if (pPlot ~= nil) then
					local iNumMissiles = 0
					for iVal = 0,(pPlot:GetNumUnits() - 1) do
						local loopUnit = pPlot:GetUnit(iVal)
						if (loopUnit:GetUnitType() == GameInfoTypes["UNIT_FW_HYPERMISSILE"]) then
							--print("Missile found")
							iNumMissiles = iNumMissiles + 1
						end
					end
					--print("Total missiles: " .. iNumMissiles)
					if (iNumMissiles < 1) then
						local pNewUnit = pPlayer:InitUnit(iHypermissile, pPlot:GetX(), pPlot:GetY())
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(AngelEffectsFW)

--------------------------------------------
-- PROMOTION
--------------------------------------------
-- Toxin
local iToxinModPromotion = GameInfoTypes.PROMOTION_FW_TOXIN_MOD
local function FWUnitDestroyed(iPlayer, iUnit, iUnitType, iX, iY, bDelay, iByPlayer)
  if iPlayer == iByPlayer or iByPlayer == -1 then return end
  local pPlayer = Players[iPlayer]; if not pPlayer then return end
  local pUnit = pPlayer:GetUnitByID(iUnit); if not pUnit then return end   -- ★ nil 가드
  local bToxin = pUnit:IsHasPromotion(iToxinModPromotion)                  -- ★ local
  if not bToxin then return end
  local pPlot = pUnit:GetPlot(); if not pPlot then return end              -- ★ nil 가드
  for pAdj in PlotAreaSweepIterator(pPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
    for i=0, pAdj:GetNumUnits()-1 do
      local u = pAdj:GetUnit(i)
      if u and u:GetOwner() ~= iPlayer then
        if Teams[Players[iPlayer]:GetTeam()]:IsAtWar(Players[u:GetOwner()]:GetTeam()) then
          u:ChangeDamage(10)
        end
      end
    end
  end
end

-- Nuclear SMR
local iNuclearModPromotion = GameInfoTypes.PROMOTION_FW_NUCLEAR_SMR
local function FWUnitDestroyed2(iPlayer, iUnit, iUnitType, iX, iY, bDelay, iByPlayer)
  if iPlayer == iByPlayer or iByPlayer == -1 then return end
  local pPlayer = Players[iPlayer]; if not pPlayer then return end
  local pUnit = pPlayer:GetUnitByID(iUnit); if not pUnit then return end   -- ★ nil 가드
  local bNuclear = pUnit:IsHasPromotion(iNuclearModPromotion)              -- ★ local
  if not bNuclear then return end
  local pPlot = pUnit:GetPlot(); if not pPlot then return end              -- ★ nil 가드
  for pAdj in PlotAreaSweepIterator(pPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
    for i=0, pAdj:GetNumUnits()-1 do
      local u = pAdj:GetUnit(i)
      if u and u:GetOwner() ~= iPlayer then
        if Teams[Players[iPlayer]:GetTeam()]:IsAtWar(Players[u:GetOwner()]:GetTeam()) then
          u:ChangeDamage(20)
        end
      end
    end
  end
end

--=====================================================================
-- Splash missile  (Short range missile)
--=====================================================================
print("[FW] Short-range splash (L1~L3, r=3) loaded")

-- 외부에서 이미 정의됐다면 재정의 금지
local iUnitVaultRack = GameInfoTypes["UNIT_FW_VAULT_RACK"]

-- 프로모션(1~3만 사용)
local PROMO_TYPES = {
  [1] = "PROMOTION_FW_SPLASH_DAMAGE_1",
  [2] = "PROMOTION_FW_SPLASH_DAMAGE_2",
  [3] = "PROMOTION_FW_SPLASH_DAMAGE_3",
}
local PROMO_IDS = {}; for i=1,3 do PROMO_IDS[i] = GameInfoTypes[PROMO_TYPES[i]] end

-- 유닛 타입에 무료 프로모가 박혀 있다면 그걸 최고 레벨로 사용
local UNIT_SPLASH_LEVEL = (function()
  local best = {}
  for lvl = 1, 3 do
    local pType = PROMO_TYPES[lvl]
    local pid   = pType and GameInfoTypes[pType]
    if pid then
      for row in GameInfo.Unit_FreePromotions() do
        if row.PromotionType == pType then
          local ut = GameInfoTypes[row.UnitType]
          if ut then best[ut] = math.max(best[ut] or 0, lvl) end
        end
      end
    end
  end
  return best
end)()

-- 반경/데미지(중심 0, 링1~3)
local LEVELS = {
  [1] = { radius = 3, center = 0, ring = { 20, 10, 5 } },
  [2] = { radius = 3, center = 0, ring = { 30, 15, 8 } },
  [3] = { radius = 3, center = 0, ring = { 40, 20, 10 } },
}
local FRIENDLY_FIRE = false

-- 전쟁/우호 판정
local function IsValidTarget(attID, tgtID)
  if tgtID == -1 then return false end
  if attID == tgtID then return FRIENDLY_FIRE end
  local A, T = Players[attID], Players[tgtID]
  if not A or not T then return false end
  return Teams[A:GetTeam()]:IsAtWar(T:GetTeam()) or FRIENDLY_FIRE
end

-- 링 생성 (PlotIterators 없이)
local dirs = {
  DirectionTypes.DIRECTION_NORTHEAST, DirectionTypes.DIRECTION_EAST,
  DirectionTypes.DIRECTION_SOUTHEAST, DirectionTypes.DIRECTION_SOUTHWEST,
  DirectionTypes.DIRECTION_WEST,      DirectionTypes.DIRECTION_NORTHWEST
}
local function Rings(center, R)
  local visited={[center]=true}; local rings={}; local frontier={center}
  for r=1, R do
    local nxt, ring = {}, {}
    for _,p in ipairs(frontier) do
      for _,d in ipairs(dirs) do
        local q = Map.PlotDirection(p:GetX(), p:GetY(), d)
        if q and not visited[q] then
          visited[q] = true; nxt[#nxt+1] = q; ring[#ring+1] = q
        end
      end
    end
    rings[r]=ring; frontier=nxt
  end
  return rings
end

-- 타일에 피해 적용(유닛/도시)
local function DoSplashAtPlot(attID, plot, dmg)
  if dmg<=0 then return end
  for i=0, plot:GetNumUnits()-1 do
    local u = plot:GetUnit(i)
    if u and not (iUnitVaultRack and u:GetUnitType()==iUnitVaultRack) then
      if IsValidTarget(attID, u:GetOwner()) then u:ChangeDamage(dmg) end
    end
  end
  local city = plot:GetPlotCity()
  if city and IsValidTarget(attID, city:GetOwner()) then city:ChangeDamage(dmg) end
end

-- 유닛 인스턴스에서 최고 레벨(3→1) 탐색
local function GetLevelFromUnit(u)
  for lvl=3,1,-1 do
    local id = PROMO_IDS[lvl]
    if id and u:IsHasPromotion(id) then return lvl end
  end
end

-- 중복 방지 키
local _fired = {}
local function OnUnitPrekill(iPlayer, iUnitID, iUnitType, iX, iY, bDelay, iByPlayer)
  local key = iPlayer..":"..iUnitID..":"..(iX or -1)..":"..(iY or -1)
  if _fired[key] then return end

  local pPlayer = Players[iPlayer]; if not pPlayer then return end
  local u = pPlayer:GetUnitByID(iUnitID)  -- 단거리는 보통 살아있음

  -- 레벨: 인스턴스 → 타입 무료프로모 → 없음(리턴)
  local lvl = (u and GetLevelFromUnit(u)) or UNIT_SPLASH_LEVEL[iUnitType]
  if not lvl or lvl <= 0 then return end

  local cfg = LEVELS[math.min(lvl,3)] or LEVELS[1]
  local center = Map.GetPlot(iX, iY); if not center then return end

  -- 중심(0이므로 보통 no-op)
  DoSplashAtPlot(iPlayer, center, cfg.center or 0)

  -- 모든 링 적용 (1..radius)
  if (cfg.radius or 0) >= 1 then
    local rings = Rings(center, cfg.radius)
    for r=1, cfg.radius do
      local dmg = (cfg.ring and cfg.ring[r]) or 0
      if dmg > 0 and rings[r] then
        for _,p in ipairs(rings[r]) do
          DoSplashAtPlot(iPlayer, p, dmg)
        end
      end
    end
  end

  _fired[key] = true
  print(string.format("[FW] Short-range splash L%d @(%d,%d) r=%d ring=%s",
    lvl, iX or -1, iY or -1, cfg.radius or 0, table.concat(cfg.ring or {}, ",")))
end
GameEvents.UnitPrekill.Add(OnUnitPrekill)



-- =====================================================================
-- FW ICBM splash — target-plot capture via BattleJoined (for Vox Populi)
--   Paste this AFTER your current splash modules.
-- =====================================================================
print("[FW][ICBM] target-capture route loaded")

-- 화이트리스트: ICBM로 처리할 장거리 유닛 (원하면 추가)
local FW_ICBM_TYPES = {
  [GameInfoTypes.UNIT_FW_GOD_ROD]  = true,
  [GameInfoTypes.UNIT_FW_GOD_ROD2] = true,
}

-- 피해/옵션
local FW_ICBM_RING1_DMG      = 20      -- 인접 6헥스 피해(프로모 4/5 있으면 아래에서 오버라이드)
local FW_PROMO_L4            = GameInfoTypes.PROMOTION_FW_SPLASH_DAMAGE_4
local FW_PROMO_L5            = GameInfoTypes.PROMOTION_FW_SPLASH_DAMAGE_5
local FW_DMGL4, FW_DMGL5     = 40, 50
local FW_FRIENDLY_FIRE       = false   -- 테스트 때만 true 권장

-- 랙 제외
local FW_UNIT_VAULT_RACK     = GameInfoTypes.UNIT_FW_VAULT_RACK

-- 전쟁/우호
local function FW_IsValidTarget(attID, tgtID)
  if tgtID == -1 then return false end
  if attID == tgtID then return FW_FRIENDLY_FIRE end
  local A, T = Players[attID], Players[tgtID]
  if not A or not T then return false end
  return Teams[A:GetTeam()]:IsAtWar(T:GetTeam()) or FW_FRIENDLY_FIRE
end

-- 인접 6헥스
local __dirs = {
  DirectionTypes.DIRECTION_NORTHEAST, DirectionTypes.DIRECTION_EAST,
  DirectionTypes.DIRECTION_SOUTHEAST, DirectionTypes.DIRECTION_SOUTHWEST,
  DirectionTypes.DIRECTION_WEST,      DirectionTypes.DIRECTION_NORTHWEST
}
local function FW_Ring1(center)
  local t = {}
  for _,d in ipairs(__dirs) do
    local p = Map.PlotDirection(center:GetX(), center:GetY(), d)
    if p then t[#t+1] = p end
  end
  return t
end

local function FW_DoPlot(attID, pPlot, dmg)
  if dmg <= 0 then return 0,0 end
  local uHits, cHits = 0, 0
  for i=0, pPlot:GetNumUnits()-1 do
    local u = pPlot:GetUnit(i)
    if u and not (FW_UNIT_VAULT_RACK and u:GetUnitType()==FW_UNIT_VAULT_RACK) then
      if FW_IsValidTarget(attID, u:GetOwner()) then
        u:ChangeDamage(dmg); uHits = uHits + 1
      end
    end
  end
  local c = pPlot:GetPlotCity()
  if c and FW_IsValidTarget(attID, c:GetOwner()) then
    c:ChangeDamage(dmg); cHits = cHits + 1
  end
  return uHits, cHits
end

-- -----------------------------
-- A) 전투 훅으로 "목표칸" 캐치
-- -----------------------------
-- 공격자 유닛ID -> 방어자 중심 Plot
local pendingTargets = {}     -- [attackerUnitID] = Plot
-- 플레이어별 “이번 전투의 공격자 유닛ID” (역할쌍 매칭용)
local currentAtkUnit = {}     -- [playerID] = unitID

-- iRole 값은 DLL에서 넘겨주는 공격/방어 역할 인덱스.
-- 환경마다 숫자값이 다를 수 있어, 아래처럼 "두 번 호출 조합"으로 안전하게 매칭한다.
local function OnBattleJoined(iPlayer, iUnitOrCity, iRole, bIsCity)
  local pPlayer = Players[iPlayer]; if not pPlayer then return end

  if not bIsCity then
    local u = pPlayer:GetUnitByID(iUnitOrCity)
    if u then
      local utype = u:GetUnitType()
      -- 1) 우리 쪽 공격 유닛(신의지팡이/2) 등장 → "이 플레이어의 공격자"로 기억
      if FW_ICBM_TYPES[utype] then
        currentAtkUnit[iPlayer] = iUnitOrCity
        -- 디버그
        print(string.format("[FW][ICBM] BattleJoined ATK? p=%d unit=%d type=%d", iPlayer, iUnitOrCity, utype))
        return
      end
    end
  end

  -- 2) 상대방(방어자) 등장 타이밍에, 방금 기록된 "공격자 유닛ID"가 있다면 그 좌표를 타겟으로 기록
  local atkUnitID = currentAtkUnit[iPlayer]           -- 같은 플레이어 소유 공격자일 수도 있고
  if not atkUnitID then
    -- 혹시 바로 '상대 플레이어'에 기록됐을 수 있으니 전체 탐색(소수 플레이어이므로 부담 경미)
    for pid=0, GameDefines.MAX_MAJOR_CIVS-1 do
      if currentAtkUnit[pid] then atkUnitID = currentAtkUnit[pid]; break end
    end
  end
  if not atkUnitID then return end

  local center
  if bIsCity then
    -- 도시 방어자
    local c = pPlayer:GetCityByID(iUnitOrCity)
    if c then center = c:Plot() end
  else
    -- 유닛 방어자
    local def = pPlayer:GetUnitByID(iUnitOrCity)
    if def then center = def:GetPlot() end
  end

  if center then
    pendingTargets[atkUnitID] = center
    -- 한 번 매칭했으면 비워준다(동일 전투 중 중복 방지)
    currentAtkUnit[iPlayer] = nil
    print(string.format("[FW][ICBM] target lock by battle: atkUnit=%d at (%d,%d)",
      atkUnitID, center:GetX(), center:GetY()))
  end
end

if GameEvents.BattleJoined then
  GameEvents.BattleJoined.Add(OnBattleJoined)
  print("[FW][ICBM] BattleJoined hook active")
else
  print("[FW][ICBM] BattleJoined not available (CP DLL events off)")
end

-- ----------------------------------------
-- B) Prekill에서 캡쳐된 '목표칸'으로 스플래시
-- ----------------------------------------
local fired = {}
local function OnUnitPrekill_ICBM(iPlayer, iUnitID, iUnitType, iX, iY, bDelay, iByPlayer)
  if not FW_ICBM_TYPES[iUnitType] then return end
  local key = iPlayer..":"..iUnitID..":"..(iX or -1)..":"..(iY or -1)
  if fired[key] then return end

  -- 피해량: L5 > L4 > 기본
  local dmg = FW_ICBM_RING1_DMG
  local u = Players[iPlayer] and Players[iPlayer]:GetUnitByID(iUnitID)
  if u then
    if FW_PROMO_L5 and u:IsHasPromotion(FW_PROMO_L5) then dmg = FW_DMGL5
    elseif FW_PROMO_L4 and u:IsHasPromotion(FW_PROMO_L4) then dmg = FW_DMGL4 end
  end

  -- 1순위: BattleJoined에서 잠가둔 목표칸
  local center = pendingTargets[iUnitID]
  -- 2순위: 전달된 좌표(대개 발사칸/요격칸) → 전선 장거리면 비어있을 수 있음
  if not center and type(iX)=="number" and iX>=0 and type(iY)=="number" and iY>=0 then
    center = Map.GetPlot(iX, iY)
    print("[FW][ICBM] fallback to prekill coords")
  end
  -- 3순위: 유닛 좌표 폴백
  if not center and u then
    center = Map.GetPlot(u:GetX(), u:GetY())
    print("[FW][ICBM] fallback to unit XY")
  end
  if not center then
    print("[FW][ICBM] ERROR no center plot; abort")
    return
  end

  -- 반경1 적용
  local totalU, totalC = 0, 0
  for _,p in ipairs(FW_Ring1(center)) do
    local hu, hc = FW_DoPlot(iPlayer, p, dmg); totalU = totalU + hu; totalC = totalC + hc
  end

  -- 한 번 사용 후 타겟 제거
  pendingTargets[iUnitID] = nil
  fired[key] = true

  print(string.format("[FW][ICBM] splash @(%d,%d) ring1=%d hits u=%d c=%d (bDelay=%s)",
    center:GetX(), center:GetY(), dmg, totalU, totalC, tostring(bDelay)))
end
GameEvents.UnitPrekill.Add(OnUnitPrekill_ICBM)


--======================================================================================================================
-- Improvement
--======================================================================================================================

-- Vault
local iImprovementVault = GameInfoTypes.IMPROVEMENT_FW_VAULT
local iMaxMissilesPerSilo = 3

-- CanLoadAt() is only called for plots that are neither a city nor have a cargo carrying unit in them
-- It should be used to ascertain if the plot can hold aircraft anyway (usually in an improvement)
function OnCanLoadNukesAt(iPlayer, iUnit, iPlotX, iPlotY)
  local pPlot = Map.GetPlot(iPlotX, iPlotY)
  local pUnit = Players[iPlayer]:GetUnitByID(iUnit)
  local unit = GameInfo.Units[pUnit:GetUnitType()]

  if (pPlot:GetImprovementType() == iImprovementVault) then
    print(string.format("Nuclear silo found at (%i, %i)", iPlotX, iPlotY))
	return not pPlot:IsImprovementPillaged()
  end
  
  return false
end
GameEvents.CanLoadAt.Add(OnCanLoadNukesAt)

-- CanRebaseTo() is only called for non-city plots without a unit that can take cargo
-- It should be used to ascertain if the plot can take our aircraft anyway
-- The city equivalent is CanRebaseInCity()
function OnCanRebaseNukesTo(iPlayer, iUnit, iPlotX, iPlotY)
	local pPlot = Map.GetPlot(iPlotX, iPlotY)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)

	if (pPlot:GetImprovementType() == iImprovementVault and not pPlot:IsImprovementPillaged() and CanSiloAt(pPlot, pUnit)) then
		 print(string.format("Found a viable missile silo at (%i, %i) - checking missile limit", iPlotX, iPlotY))
		 return (CountMissiles(pPlot, pUnit) < iMaxMissilesPerSilo)
	end

	return false
end
GameEvents.CanRebaseTo.Add(OnCanRebaseNukesTo)


function CanSiloAt(pPlot, pUnit)
  local iPlayer = pUnit:GetOwner()

  -- Check the units on the tile (if any) 
  for i = 0, pPlot:GetNumUnits()-1, 1 do
    local pPlotUnit = pPlot:GetUnit(i)
	
	if (pPlotUnit:GetOwner() == iPlayer) then
	  return true -- Any of our own is good
	else
	  return false -- Any not ours is bad
	end
  end
  
  -- No units, so check ownership of the tile
  local iOwner = pPlot:GetOwner()
  if (iOwner == iPlayer or iOwner == -1 or Players[iPlayer]:GetTeam() == Players[iOwner]:GetTeam()) then
    return (pUnit.NukeDamageLevel == 2) -- only nukes allowed
  end

  local pOwner = Players[iOwner]
  if (pOwner:IsMinor() and pOwner:GetAlly() == iPlayer) then
    return (pUnit.NukeDamageLevel == 2) -- only nukes allowed
  end

  return false
end

function CountMissiles(pPlot, pUnit)
  local iMissiles = 0
  local iPlayer = pUnit:GetOwner()
  
  for i = 0, pPlot:GetNumUnits()-1, 1 do
    local pPlotUnit = pPlot:GetUnit(i)
	
	if (pPlotUnit:GetOwner() == iPlayer and pPlotUnit:GetSpecialUnitType() == 2) then
	  iMissiles = iMissiles + 1
	end
  end
  
  return iMissiles
end

print("Finished loading FutureLua.lua from VP-FW mod");


--=================================================================================================
print("Bio/Gene bonus promotion handler (priority by UnitCombat) loaded")

-- ===== 설정: 마커 프로모션(모드 ON/OFF 구분용) =====
local PROMO_BIO_MODE_ID  = GameInfoTypes["PROMOTION_FW_BIOMODS"]
local PROMO_GENE_MODE_ID = GameInfoTypes["PROMOTION_FW_GENGINEERED"]

-- ===== 설정: 바이오/유전자 보너스 승급 목록 =====
local function GI(n) return GameInfoTypes[n] end
local function addIf(out, name)
  local id = GI(name)
  if id then out[#out+1] = id else print("!! Missing promotion:", name) end
end

local BioListIDs = {}
addIf(BioListIDs, "PROMOTION_FW_IMPACT_MOD")
addIf(BioListIDs, "PROMOTION_FW_BOOST_MOD")
addIf(BioListIDs, "PROMOTION_FW_BIOREGENERATION_MOD")
addIf(BioListIDs, "PROMOTION_FW_SYNTHETIC_LUNGS_MOD")
addIf(BioListIDs, "PROMOTION_FW_VISION_ENHANCEMENT_MOD")
addIf(BioListIDs, "PROMOTION_FW_REFLEX_MOD")
addIf(BioListIDs, "PROMOTION_FW_TOXIN_MOD")
addIf(BioListIDs, "PROMOTION_FW_SHOCK_WAVE_SHIELD_MOD")

local GeneListIDs = {}
addIf(GeneListIDs, "PROMOTION_FW_ADRENAL_GLANDS")
addIf(GeneListIDs, "PROMOTION_FW_PREDATOR_INSTINCT")
addIf(GeneListIDs, "PROMOTION_FW_ENHANCED_REFLEXES")
addIf(GeneListIDs, "PROMOTION_FW_ENHANCED_VISION")
addIf(GeneListIDs, "PROMOTION_FW_ENHANCED_MUSCLES")
addIf(GeneListIDs, "PROMOTION_FW_URBAN_WARFARE")
addIf(GeneListIDs, "PROMOTION_FW_CHAMELEON")

-- ===== 설정: “수동 선택 승급”만 트리거로 인정 (자동/건물 부여 무시) =====
local IsChoosablePromo = {}
for row in GameInfo.UnitPromotions() do
  if row and (row.CannotBeChosen == false or row.CannotBeChosen == 0 or row.CannotBeChosen == nil) then
    IsChoosablePromo[row.ID] = true
  end
end
local function ban(p) local id = GI(p); if id then IsChoosablePromo[id] = nil end end
-- 모드 마커 + 보너스들 전부 트리거 제외
ban("PROMOTION_FW_BIOMODS")
ban("PROMOTION_FW_GENGINEERED")
ban("PROMOTION_FW_IMPACT_MOD")
ban("PROMOTION_FW_BOOST_MOD")
ban("PROMOTION_FW_BIOREGENERATION_MOD")
ban("PROMOTION_FW_SYNTHETIC_LUNGS_MOD")
ban("PROMOTION_FW_VISION_ENHANCEMENT_MOD")
ban("PROMOTION_FW_REFLEX_MOD")
ban("PROMOTION_FW_TOXIN_MOD")
ban("PROMOTION_FW_SHOCK_WAVE_SHIELD_MOD")
ban("PROMOTION_FW_ADRENAL_GLANDS")
ban("PROMOTION_FW_PREDATOR_INSTINCT")
ban("PROMOTION_FW_ENHANCED_REFLEXES")
ban("PROMOTION_FW_ENHANCED_VISION")
ban("PROMOTION_FW_ENHANCED_MUSCLES")
ban("PROMOTION_FW_URBAN_WARFARE")
ban("PROMOTION_FW_CHAMELEON")

-- ===== 유닛컴뱃별 우선순위 =====
--  * 보병(총병) = Bio 먼저
--  * 기마, 근접, (비행선/호버가 있다면) Gene 먼저
local PreferBioFirst  = {}
local PreferGeneFirst = {}

local UC_GUN      = GI("UNITCOMBAT_GUN")
local UC_MOUNTED  = GI("UNITCOMBAT_MOUNTED")
local UC_MELEE    = GI("UNITCOMBAT_MELEE")
local UC_HOVER    = GI("UNITCOMBAT_HOVER")  -- 있으면 사용

if UC_GUN     then PreferBioFirst[UC_GUN] = true end
if UC_MOUNTED then PreferGeneFirst[UC_MOUNTED] = true end
if UC_MELEE   then PreferGeneFirst[UC_MELEE]   = true end
if UC_HOVER   then PreferGeneFirst[UC_HOVER]   = true end

local function WhichFirstForUnit(unit)
  local uc = unit:GetUnitCombatType()
  if PreferBioFirst[uc]  then return "bio" end
  if PreferGeneFirst[uc] then return "gene" end
  return "bio"  -- 매핑없으면 기본 바이오 우선
end

-- ===== 도우미 =====
local lastProcessedLevel = {}  -- playerID_unitID -> level
local function keyPU(pID, uID) return tostring(pID).."_"..tostring(uID) end

local function GrantFirstMissingFromList(unit, idList)
  if not idList or #idList == 0 then return false end
  for _, promoID in ipairs(idList) do
    if not unit:IsHasPromotion(promoID) then
      unit:SetHasPromotion(promoID, true) -- XP 변화 없이 즉시 부여
      return true, promoID
    end
  end
  return false
end

local function GrantByPriority(unit, hasBio, hasGene)
  local first = WhichFirstForUnit(unit)
  local ok, givenID

  if first == "bio" then
    if hasBio then
      ok, givenID = GrantFirstMissingFromList(unit, BioListIDs)
      if not ok and hasGene then ok, givenID = GrantFirstMissingFromList(unit, GeneListIDs) end
    elseif hasGene then
      ok, givenID = GrantFirstMissingFromList(unit, GeneListIDs)
    end
  else -- first == "gene"
    if hasGene then
      ok, givenID = GrantFirstMissingFromList(unit, GeneListIDs)
      if not ok and hasBio then ok, givenID = GrantFirstMissingFromList(unit, BioListIDs) end
    elseif hasBio then
      ok, givenID = GrantFirstMissingFromList(unit, BioListIDs)
    end
  end
  return ok, givenID
end

-- ===== 본 이벤트 =====
GameEvents.UnitPromoted.Add(function(iPlayer, iUnit, iPromotion)
  local player = Players[iPlayer]
  if not player or not player:IsAlive() then return end
  local unit = player:GetUnitByID(iUnit)
  if not unit or unit:IsDelayedDeath() then return end

  -- 플레이어가 직접 선택한 승급만 트리거
  if not IsChoosablePromo[iPromotion] then return end

  -- (사람만 적용하려면 아래 주석 해제)
  -- if not player:IsHuman() then return end

  -- 같은 레벨에서 중복 지급 방지
  local lvl = unit:GetLevel()
  local k   = keyPU(iPlayer, iUnit)
  if (lastProcessedLevel[k] or 0) == lvl then return end

  local hasBio  = PROMO_BIO_MODE_ID  and unit:IsHasPromotion(PROMO_BIO_MODE_ID)
  local hasGene = PROMO_GENE_MODE_ID and unit:IsHasPromotion(PROMO_GENE_MODE_ID)
  if not hasBio and not hasGene then return end

  local ok, givenID = GrantByPriority(unit, hasBio, hasGene)
  lastProcessedLevel[k] = lvl

  if ok and givenID then
    local row  = GameInfo.UnitPromotions[givenID]
    local name = row and Locale.ConvertTextKey(row.Description) or "Bonus Promotion"
    Events.GameplayAlertMessage("[COLOR_POSITIVE_TEXT]" .. name .. "[ENDCOLOR] 승급을 추가로 획득했습니다.")
  end
end)
