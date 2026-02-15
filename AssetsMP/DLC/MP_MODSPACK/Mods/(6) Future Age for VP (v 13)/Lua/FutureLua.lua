print("Loading FutureLua.lua from VP-FW mod");

-- FW_DummyGuards.lua
-- Civ5 VP/CP for Civ5 VP/CP mods: check existence of SQL/Lua types + safety guards + ID cache
-- From other Lua, include("FW_DummyGuards.lua") FW.ids / FW.has / FW.vp use.

local function GI(k) return GameInfoTypes[k] end
local function present(id) return (id ~= nil and id > 0) end
local function warn(tag, key)
  print(string.format("[FW] MISSING %-12s : %s", tag, key))
end

-- Detect VP/CP features
local vp = {
  hasBattleJoined = (GameEvents and GameEvents.BattleJoined ~= nil),
}

-- /dummy//// ID cache
local ids = {
  -- World Security / Cyber Police line (new/old compatibility guard)
  BUILDING_FW_WORLD_SECURITY        = GI("BUILDING_FW_WORLD_SECURITY") or GI("BUILDING_FW_CYBERPOLICE"),
  BUILDING_FW_WORLD_SECURITY_DUMMY  = GI("BUILDING_FW_WORLD_SECURITY_DUMMY") or GI("BUILDING_WORLD_SECURITY_DUMMY"),

  -- Biomod / Ectogenesis stack dummy
  BUILDING_DUMMY_BIOMOD_POP         = GI("BUILDING_DUMMY_BIOMOD_POP"),
  BUILDING_FW_BIOMOD_TANK           = GI("BUILDING_FW_BIOMOD_TANK"),
  BUILDING_DUMMY_MIL10_STACK        = GI("BUILDING_DUMMY_MIL10_STACK"),
  BUILDING_FW_ECTOGENESIS_POD       = GI("BUILDING_FW_ECTOGENESIS_POD"),

  -- Angelnet
  BUILDING_FW_ANGELNET              = GI("BUILDING_FW_ANGELNET"),
  PROMOTION_FW_ANGELNET             = GI("PROMOTION_FW_ANGELNET"),

  -- Mnemosyne
  BUILDING_FW_MNEMOSYNE             = GI("BUILDING_FW_MNEMOSYNE"),

  -- Laputa
  BUILDING_FW_LAPUTA                = GI("BUILDING_FW_LAPUTA"),
  BUILDING_FW_LAPUTA_DUMMY          = GI("BUILDING_FW_LAPUTA_DUMMY"),

  -- Splash line promotion(/)
  PROMOTION_FW_SPLASH_DAMAGE_1      = GI("PROMOTION_FW_SPLASH_DAMAGE_1"),
  PROMOTION_FW_SPLASH_DAMAGE_2      = GI("PROMOTION_FW_SPLASH_DAMAGE_2"),
  PROMOTION_FW_SPLASH_DAMAGE_3      = GI("PROMOTION_FW_SPLASH_DAMAGE_3"),
  PROMOTION_FW_SPLASH_DAMAGE_4      = GI("PROMOTION_FW_SPLASH_DAMAGE_4"),
  PROMOTION_FW_SPLASH_DAMAGE_5      = GI("PROMOTION_FW_SPLASH_DAMAGE_5"),

  -- God Rod / missile line
  UNIT_FW_GOD_ROD                   = GI("UNIT_FW_GOD_ROD"),
  UNIT_FW_GOD_ROD2                  = GI("UNIT_FW_GOD_ROD2"),

  -- FX (harmless if missing)
  UNIT_FW_PLASMA_BOMBER             = GI("UNIT_FW_PLASMA_BOMBER"),
  UNIT_FW_SPACEMARINES              = GI("UNIT_FW_SPACEMARINES"),

  -- Undersea Tunnel(improvement/build) / Keys
  IMPROVEMENT_FW_UNDERSEA_TUNNEL    = GI("IMPROVEMENT_FW_UNDERSEA_TUNNEL") or GI("IMPROVEMENT_UNDERSEA_TUNNEL"),
  BUILD_FW_UNDERSEA_TUNNEL          = GI("BUILD_FW_UNDERSEA_TUNNEL")       or GI("BUILD_UNDERSEA_TUNNEL"),

  -- other recently corrected items(e.g., )
  BUILDING_FW_BRAIN_UPLOADING       = GI("BUILDING_FW_BRAIN_UPLOADING"),
}

-- existence flags(for safe branching in other scripts)
local has = {}
for k, v in pairs(ids) do has[k] = present(v) end

-- one-time self diagnostic log (once at turn 0)
local function SelfCheck()
  print("[FW] ===== Dummy Guards / ID Self-Check =====")
  local groups = {
    {"BUILDING", {
      "BUILDING_FW_WORLD_SECURITY",
      "BUILDING_FW_WORLD_SECURITY_DUMMY",
      "BUILDING_DUMMY_BIOMOD_POP",
      "BUILDING_FW_BIOMOD_TANK",
      "BUILDING_DUMMY_MIL10_STACK",
      "BUILDING_FW_ECTOGENESIS_POD",
      "BUILDING_FW_ANGELNET",
      "BUILDING_FW_MNEMOSYNE",
      "BUILDING_FW_LAPUTA",
      "BUILDING_FW_LAPUTA_DUMMY",
      "BUILDING_FW_BRAIN_UPLOADING",
    }},
    {"PROMOTION", {
      "PROMOTION_FW_ANGELNET",
      "PROMOTION_FW_SPLASH_DAMAGE_1",
      "PROMOTION_FW_SPLASH_DAMAGE_2",
      "PROMOTION_FW_SPLASH_DAMAGE_3",
      "PROMOTION_FW_SPLASH_DAMAGE_4",
      "PROMOTION_FW_SPLASH_DAMAGE_5",
    }},
    {"UNIT", {
      "UNIT_FW_GOD_ROD",
      "UNIT_FW_GOD_ROD2",
      "UNIT_FW_PLASMA_BOMBER",
      "UNIT_FW_SPACEMARINES",
    }},
    {"IMPROV/BUILD", {
      "IMPROVEMENT_FW_UNDERSEA_TUNNEL",
      "BUILD_FW_UNDERSEA_TUNNEL",
    }},
  }

  for _, grp in ipairs(groups) do
    local tag, list = grp[1], grp[2]
    for _, key in ipairs(list) do
      if not has[key] then warn(tag, key) end
    end
  end
  print(string.format("[FW] VP: BattleJoined=%s", tostring(vp.hasBattleJoined)))
  print("[FW] ========================================")
end

-- once at turn 0 action
local function OnTurn(pID)
  local p = Players[pID]
  if p and p:IsHuman() and p:GetID() == 0 and Game.GetGameTurn() == 0 then
    SelfCheck()
    GameEvents.PlayerDoTurn.Remove(OnTurn)
  end
end
GameEvents.PlayerDoTurn.Add(OnTurn)

-- external exposure ( Lua FW.ids / FW.has / FW.vp use)
FW = FW or {}
FW.ids = ids
FW.has = has
FW.vp  = vp


include("PlotIterators.lua")

--==========================================================
-- Buildings
---==========================================================
------------------------------------------------------------
-- World Security (ally-based dummy stack)
------------------------------------------------------------
print("[FW] Future building Dummy loader: World Security")

local DEBUG = false

-- dummy/gate building IDs: prefer new tags, old tags(CYBERPOLICE) fallback allowed
local iBldgDummy =
    GameInfoTypes.BUILDING_FW_WORLD_SECURITY_DUMMY or
    GameInfoTypes.BUILDING_WORLD_SECURITY_DUMMY or
    GameInfoTypes.BUILDING_CYBER_POLICE_DUMMY

local iGateBldgType =
    GameInfoTypes.BUILDING_FW_WORLD_SECURITY or
    GameInfoTypes.BUILDING_FW_CYBERPOLICE

if not iBldgDummy or not iGateBldgType then
  print("[World Security][ERROR] Missing IDs. Dummy:", iBldgDummy, "GateType:", iGateBldgType)
else
  -- player's number of allies(ally) count
  local function GetAllyCount(iPlayer)
    local cnt = 0
    for iMinor = 0, GameDefines.MAX_MINOR_CIVS - 1 do
      local pMinor = Players[iMinor + GameDefines.MAX_MAJOR_CIVS]
      if pMinor and pMinor:IsAlive() and pMinor:IsMinorCiv() then
        if pMinor:GetAlly() == iPlayer then
          cnt = cnt + 1
        end
      end
    end
    return cnt
  end

  -- ally 1 dummy 1, 0
  local function RefreshWorldSecurity(iPlayer)
    local pPlayer = Players[iPlayer]
    if not pPlayer or not pPlayer:IsAlive() or pPlayer:IsBarbarian() or pPlayer:IsMinorCiv() then return end

    local hasAnyAlly = (GetAllyCount(iPlayer) > 0)
    local stacks = hasAnyAlly and 1 or 0

    for city in pPlayer:Cities() do
      if city:IsHasBuilding(iGateBldgType) then
        if DEBUG then
          print(string.format("[WS] %s: allies? %s -> dummy=%d",
            city:GetName(), tostring(hasAnyAlly), stacks))
        end
        city:SetNumRealBuilding(iBldgDummy, stacks)
      else
        if city:GetNumRealBuilding(iBldgDummy) > 0 then
          city:SetNumRealBuilding(iBldgDummy, 0)
        end
      end
    end
  end

  -- (comment translated to English)
  GameEvents.PlayerDoTurn.Add(RefreshWorldSecurity)

  -- / ( )
  if GameEvents.CityConstructed then
    GameEvents.CityConstructed.Add(function(iPlayer, ...)
      RefreshWorldSecurity(iPlayer)
    end)
  end

  -- city-state ally change apply immediately
  if GameEvents.MinorAlliesChanged then
    GameEvents.MinorAlliesChanged.Add(function(iMinor, iOldAlly, iNewAlly)
      if iOldAlly and iOldAlly >= 0 then RefreshWorldSecurity(iOldAlly) end
      if iNewAlly and iNewAlly >= 0 then RefreshWorldSecurity(iNewAlly) end
    end)
  end

  -- initialization
  Events.SequenceGameInitComplete.Add(function()
    for iPlayer = 0, GameDefines.MAX_PLAYERS - 1 do
      RefreshWorldSecurity(iPlayer)
    end
  end)
end

-- ============================================================
-- Biomod & Ectogenesis (player-owns-trigger only)
-- - 동작 조건: 해당 문명이 트리거 건물을 1개 이상 보유할 때만
-- - 바바/도시국가 제외, 옵션으로 인간만
-- - 상한 유지
-- ============================================================
do
  -- ===== 공통 설정 =====
  local ONLY_HUMAN = false     -- true면 인간(플레이어)만 적용
  local DEBUG      = true      -- 검증 끝나면 false

  local function IsValidPlayer(p)
    if not p or not p.IsAlive or not p:IsAlive() then return false end
    if p.IsBarbarian and p:IsBarbarian() then return false end
    if p.IsMinorCiv and p:IsMinorCiv() then return false end
    if ONLY_HUMAN and p.IsHuman and not p:IsHuman() then return false end
    return true
  end

  -- ===== 캐시: 문명이 트리거 건물을 보유했는지 =====
  MapModData = MapModData or {}
  MapModData.ECTO_HAS_TRIGGER   = MapModData.ECTO_HAS_TRIGGER   or {} -- playerId -> bool
  MapModData.BIOMOD_HAS_TRIGGER = MapModData.BIOMOD_HAS_TRIGGER or {} -- playerId -> bool

  local function RecalcHasTriggerFor(p, triggerBuildingID, cacheTable, tag)
    local has = false
    if p and p.Cities then
      for city in p:Cities() do
        if city:IsHasBuilding(triggerBuildingID) then has = true break end
      end
    end
    cacheTable[p:GetID()] = has
    if DEBUG then
      print(string.format("[%s] Player %d trigger=%s", tag, p:GetID(), tostring(has)))
    end
    return has
  end

  -- ====== BIOMOD (인구 10당 스택, 도시별 적용) ======
  local POP_PER_STACK  = 10
  local BIOMOD_CAP     = 20
  local iDummyBiomod   = GameInfoTypes.BUILDING_DUMMY_BIOMOD_POP
  local iTriggerBiomod = GameInfoTypes.BUILDING_FW_BIOMOD_TANK
  if not iDummyBiomod   then print("[Biomod][ERROR] Dummy BUILDING_DUMMY_BIOMOD_POP not found") end
  if not iTriggerBiomod then print("[Biomod][ERROR] Trigger BUILDING_FW_BIOMOD_TANK not found") end

  local function UpdateBiomodForPlayer(p)
    if not IsValidPlayer(p) then return end
    local has = MapModData.BIOMOD_HAS_TRIGGER[p:GetID()]
    if has == nil then
      has = RecalcHasTriggerFor(p, iTriggerBiomod, MapModData.BIOMOD_HAS_TRIGGER, "Biomod")
    end
    if not has then return end  -- ★ 트리거 없으면 계산/적용 스킵

    for city in p:Cities() do
      local want = 0
      if city:IsHasBuilding(iTriggerBiomod) then
        want = math.floor((city:GetPopulation() or 0) / POP_PER_STACK)
        if BIOMOD_CAP then want = math.min(want, BIOMOD_CAP) end
      end
      if iDummyBiomod then
        local cur = city:GetNumRealBuilding(iDummyBiomod)
        if cur ~= want then
          city:SetNumRealBuilding(iDummyBiomod, want)
          if DEBUG then
            print(string.format("[Biomod] %s pop=%d -> stacks %d (was %d)",
              city:GetName(), city:GetPopulation(), want, cur))
          end
        end
      end
    end
  end

  -- ====== ECTO (군사 10당 스택, 트리거 도시들에 적용) ======
  local UNITS_PER   = 10
  local ECTO_CAP    = 20
  local iDummyEcto  = GameInfoTypes.BUILDING_DUMMY_MIL10_STACK
  local iTriggerEcto= GameInfoTypes.BUILDING_FW_ECTOGENESIS_POD
  if not iDummyEcto   then print("[Ecto][ERROR] Dummy BUILDING_DUMMY_MIL10_STACK not found") end
  if not iTriggerEcto then print("[Ecto][ERROR] Trigger BUILDING_FW_ECTOGENESIS_POD not found") end

  local function IsMilitaryUnit(u)
    if not u then return false end
    if u.IsCombatUnit and u:IsCombatUnit() then
      if u.IsCivilianUnit and u:IsCivilianUnit() then return false end
      return true
    end
    if u.GetCombatStrength and u:GetCombatStrength() > 0 then return true end
    return false
  end

  local function CountMilitaryUnits(p)
    local n = 0
    for u in p:Units() do
      if IsMilitaryUnit(u) then n = n + 1 end
    end
    return n
  end

  local function UpdateEctoForPlayer(p)
    if not IsValidPlayer(p) then return end
    local has = MapModData.ECTO_HAS_TRIGGER[p:GetID()]
    if has == nil then
      has = RecalcHasTriggerFor(p, iTriggerEcto, MapModData.ECTO_HAS_TRIGGER, "Ecto")
    end
    if not has then return end  -- ★ 트리거 없으면 스킵

    local total  = CountMilitaryUnits(p)
    local stacks = math.floor(total / UNITS_PER)
    if ECTO_CAP then stacks = math.min(stacks, ECTO_CAP) end

    if DEBUG then
      print(string.format("[Ecto] Player %d mil=%d -> stacks=%d", p:GetID(), total, stacks))
    end

    if iDummyEcto then
      for city in p:Cities() do
        local want = city:IsHasBuilding(iTriggerEcto) and stacks or 0
        local cur  = city:GetNumRealBuilding(iDummyEcto)
        if cur ~= want then
          city:SetNumRealBuilding(iDummyEcto, want)
          if DEBUG then
            print(string.format("[Ecto]  %s set %d (was %d)", city:GetName(), want, cur))
          end
        end
      end
    end
  end

  -- ====== 이벤트 훅 ======

  -- 턴 시작: 두 시스템 모두, "트리거 가진 플레이어만" 업데이트
  GameEvents.PlayerDoTurn.Add(function(iPlayer)
    local p = Players and Players[iPlayer] or nil
    if not IsValidPlayer(p) then return end
    if MapModData.BIOMOD_HAS_TRIGGER[iPlayer] then UpdateBiomodForPlayer(p) end
    if MapModData.ECTO_HAS_TRIGGER[iPlayer]  then UpdateEctoForPlayer(p)   end
  end)

  -- 게임 시작 시 1회 트리거 보유 스캔
  if Events and Events.SequenceGameInitComplete then
    Events.SequenceGameInitComplete.Add(function()
      for iPlayer = 0, GameDefines.MAX_CIV_PLAYERS - 1 do
        local p = Players and Players[iPlayer] or nil
        if IsValidPlayer(p) then
          RecalcHasTriggerFor(p, iTriggerBiomod, MapModData.BIOMOD_HAS_TRIGGER, "Biomod")
          RecalcHasTriggerFor(p, iTriggerEcto,  MapModData.ECTO_HAS_TRIGGER,  "Ecto")
        end
      end
    end)
  end

  -- 건물 지어짐/판매: 해당 캐시 갱신 후 즉시 재적용
  if GameEvents and GameEvents.CityConstructed then
    GameEvents.CityConstructed.Add(function(iPlayer, iCity, iBuildingType, bGold, bFaith)
      local p = Players and Players[iPlayer] or nil
      if not IsValidPlayer(p) then return end
      if iBuildingType == iTriggerBiomod then
        MapModData.BIOMOD_HAS_TRIGGER[iPlayer] = true
        UpdateBiomodForPlayer(p)
      elseif iBuildingType == iTriggerEcto then
        MapModData.ECTO_HAS_TRIGGER[iPlayer] = true
        UpdateEctoForPlayer(p)
      end
    end)
  end

  if GameEvents and GameEvents.CitySoldBuilding then
    GameEvents.CitySoldBuilding.Add(function(iPlayer, iCity, iBuildingType)
      local p = Players and Players[iPlayer] or nil
      if not IsValidPlayer(p) then return end

      if iBuildingType == iTriggerBiomod then
        local still = RecalcHasTriggerFor(p, iTriggerBiomod, MapModData.BIOMOD_HAS_TRIGGER, "Biomod")
        if not still and iDummyBiomod then
          -- 잔여 더미 정리
          for city in p:Cities() do
            local cur = city:GetNumRealBuilding(iDummyBiomod)
            if cur ~= 0 then
              city:SetNumRealBuilding(iDummyBiomod, 0)
              if DEBUG then
                print(string.format("[Biomod]  %s cleared dummy (was %d)", city:GetName(), cur))
              end
            end
          end
        else
          UpdateBiomodForPlayer(p)
        end
      elseif iBuildingType == iTriggerEcto then
        local still = RecalcHasTriggerFor(p, iTriggerEcto, MapModData.ECTO_HAS_TRIGGER, "Ecto")
        if not still and iDummyEcto then
          for city in p:Cities() do
            local cur = city:GetNumRealBuilding(iDummyEcto)
            if cur ~= 0 then
              city:SetNumRealBuilding(iDummyEcto, 0)
              if DEBUG then
                print(string.format("[Ecto]  %s cleared dummy (was %d)", city:GetName(), cur))
              end
            end
          end
        else
          UpdateEctoForPlayer(p)
        end
      end
    end)
  end
end

--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetRandom
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandomFW(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end

--------------------------------------------
-- Helpers
--------------------------------------------
local function CanHostAirUnits(pPlot)
    if not pPlot then return false end
    if pPlot:IsCity() then return true end
    -- TODO: /missile
    return false
end

local function SpawnAirSafely(pPlayer, iUnitType, pPlot)
    if CanHostAirUnits(pPlot) then
        return pPlayer:InitUnit(iUnitType, pPlot:GetX(), pPlot:GetY())
    end
    local cap = pPlayer:GetCapitalCity()
    if cap then
        return pPlayer:InitUnit(iUnitType, cap:GetX(), cap:GetY())
    end
    return pPlayer:InitUnit(iUnitType, pPlot:GetX(), pPlot:GetY())
end

--------------------------------------------
-- Crawler unit (minimal changes)
--------------------------------------------
local iChanceMissileProduction = 25
local iGuidemissile = GameInfoTypes.UNIT_GUIDED_MISSILE

function CrawlerEffectsFW(iPlayer)
	local pPlayer = Players[iPlayer]
	for pUnit in pPlayer:Units() do
		if (pUnit:GetUnitType() == GameInfoTypes["UNIT_FW_CRAWLER"]) then
			--print("Crawler found")
			local iCheckForMissileProduction = JFD_GetRandomFW(1, 100)
			-- CHANGED: < -> <= ( 25%)
			if (iCheckForMissileProduction <= iChanceMissileProduction) then
				local pPlot = pUnit:GetPlot()
				if (pPlot ~= nil) then
					local iNumMissiles = 0
					for iVal = 0,(pPlot:GetNumUnits() - 1) do
						local loopUnit = pPlot:GetUnit(iVal)
						-- CHANGED: constants use (/ )
						if (loopUnit:GetUnitType() == iGuidemissile) then
							--print("Missile found")
							iNumMissiles = iNumMissiles + 1
						end
					end
					--print("Total missiles: " .. iNumMissiles)
					if (iNumMissiles < 3) then
						local pNewUnit = pPlayer:InitUnit(iGuidemissile, pPlot:GetX(), pPlot:GetY())
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(CrawlerEffectsFW)


--------------------------------------------
-- Angel unit (minimal changes)
--------------------------------------------
local iChanceMissileProduction = 25
local iThermomissile = GameInfoTypes.UNIT_FW_THERMOMISSILE
local iNanohivePromotion = GameInfoTypes.PROMOTION_FW_NANOHIVE_PROMOTION

function AngelEffectsFW(iPlayer)
	local pPlayer = Players[iPlayer]
	for pUnit in pPlayer:Units() do
		if (pUnit:GetUnitType() == GameInfoTypes["UNIT_FW_ANGEL"]) then
			--print("Angel found")
			local iCheckForMissileProduction = JFD_GetRandomFW(1, 100)
			-- CHANGED: < -> <=
			if (iCheckForMissileProduction <= iChanceMissileProduction) then
				local pPlot = pUnit:GetPlot()
				if (pPlot ~= nil) then
					local iNumMissiles = 0
					for iVal = 0,(pPlot:GetNumUnits() - 1) do
						local loopUnit = pPlot:GetUnit(iVal)
						-- CHANGED: constants use
						if (loopUnit:GetUnitType() == iThermomissile) then
							--print("Missile found")
							iNumMissiles = iNumMissiles + 1
						end
					end
					--print("Total missiles: " .. iNumMissiles)
					if (iNumMissiles < 1) then
						local pNewUnit = pPlayer:InitUnit(iThermomissile, pPlot:GetX(), pPlot:GetY())
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
  local pUnit = pPlayer:GetUnitByID(iUnit); if not pUnit then return end   -- nil
  local bToxin = pUnit:IsHasPromotion(iToxinModPromotion)                  -- local
  if not bToxin then return end
  local pPlot = pUnit:GetPlot(); if not pPlot then return end              -- nil
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
  local pUnit = pPlayer:GetUnitByID(iUnit); if not pUnit then return end   -- nil
  local bNuclear = pUnit:IsHasPromotion(iNuclearModPromotion)              -- local
  if not bNuclear then return end
  local pPlot = pUnit:GetPlot(); if not pPlot then return end              -- nil
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

print("[FW]Bio/Gene bonus promotion handler (priority by UnitCombat) loaded")

-- ===== settings: promotion( ON/OFF ) =====
local PROMO_BIO_MODE_ID  = GameInfoTypes["PROMOTION_FW_BIOMODS"]
local PROMO_GENE_MODE_ID = GameInfoTypes["PROMOTION_FW_GENGINEERED"]

-- ===== settings: / =====
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

-- ===== settings: manually chosen promotions (automatic/building-granted ignore) =====
local IsChoosablePromo = {}
for row in GameInfo.UnitPromotions() do
  if row and (row.CannotBeChosen == false or row.CannotBeChosen == 0 or row.CannotBeChosen == nil) then
    IsChoosablePromo[row.ID] = true
  end
end
local function ban(p) local id = GI(p); if id then IsChoosablePromo[id] = nil end end
-- +
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

-- ===== priority per unit-combat =====
-- * gun infantry(gunners) = Bio
-- * mounted, melee, (airship/hover ) Gene
local PreferBioFirst  = {}
local PreferGeneFirst = {}

local UC_GUN      = GI("UNITCOMBAT_GUN")
local UC_MOUNTED  = GI("UNITCOMBAT_MOUNTED")
local UC_MELEE    = GI("UNITCOMBAT_MELEE")
local UC_HOVER    = GI("UNITCOMBAT_HOVER")  -- use

if UC_GUN     then PreferBioFirst[UC_GUN] = true end
if UC_MOUNTED then PreferGeneFirst[UC_MOUNTED] = true end
if UC_MELEE   then PreferGeneFirst[UC_MELEE]   = true end
if UC_HOVER   then PreferGeneFirst[UC_HOVER]   = true end

local function WhichFirstForUnit(unit)
  local uc = unit:GetUnitCombatType()
  if PreferBioFirst[uc]  then return "bio" end
  if PreferGeneFirst[uc] then return "gene" end
  return "bio"  -- if no mapping default to Bio first
end

-- ===== helpers =====
local lastProcessedLevel = {}  -- playerID_unitID -> level
local function keyPU(pID, uID) return tostring(pID).."_"..tostring(uID) end

local function GrantFirstMissingFromList(unit, idList)
  if not idList or #idList == 0 then return false end
  for _, promoID in ipairs(idList) do
    if not unit:IsHasPromotion(promoID) then
      unit:SetHasPromotion(promoID, true) -- XP
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

-- ===== main event =====
GameEvents.UnitPromoted.Add(function(iPlayer, iUnit, iPromotion)
  local player = Players[iPlayer]
  if not player or not player:IsAlive() then return end
  local unit = player:GetUnitByID(iUnit)
  if not unit or unit:IsDelayedDeath() then return end

  -- trigger only on manually chosen promotions
  if not IsChoosablePromo[iPromotion] then return end

  -- (uncomment below to apply only to human)
  -- if not player:IsHuman() then return end

  -- prevent duplicates on the same level
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
    Events.GameplayAlertMessage("[COLOR_POSITIVE_TEXT]" .. name .. "[ENDCOLOR] was granted an additional promotion.")
  end
end)


--=====================================================================
-- Splash missile  (Short range missile)
--=====================================================================
print("[FW]Short-range splash (L1~L3, r=3) loaded")

-- do not redefine if already defined
local iUnitVaultRack = GameInfoTypes["UNIT_FW_VAULT_RACK"]

-- promotion(1~3 use)
local PROMO_TYPES = {
  [1] = "PROMOTION_FW_SPLASH_DAMAGE_1",
  [2] = "PROMOTION_FW_SPLASH_DAMAGE_2",
  [3] = "PROMOTION_FW_SPLASH_DAMAGE_3",
}
local PROMO_IDS = {}; for i=1,3 do PROMO_IDS[i] = GameInfoTypes[PROMO_TYPES[i]] end

-- use
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

-- radius/damage(center 0, 1~3)
local LEVELS = {
  [1] = { radius = 3, center = 0, ring = { 20, 10, 5 } },
  [2] = { radius = 3, center = 0, ring = { 30, 15, 8 } },
  [3] = { radius = 3, center = 0, ring = { 40, 20, 10 } },
}
local FRIENDLY_FIRE = false

-- war/friendly check
local function IsValidTarget(attID, tgtID)
  if tgtID == -1 then return false end
  if attID == tgtID then return FRIENDLY_FIRE end
  local A, T = Players[attID], Players[tgtID]
  if not A or not T then return false end
  return Teams[A:GetTeam()]:IsAtWar(T:GetTeam()) or FRIENDLY_FIRE
end

-- ring generation (PlotIterators )
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

-- apply damage to plot(/)
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

-- (31)
local function GetLevelFromUnit(u)
  for lvl=3,1,-1 do
    local id = PROMO_IDS[lvl]
    if id and u:IsHasPromotion(id) then return lvl end
  end
end

-- dedup key
local _fired = {}
local function OnUnitPrekill(iPlayer, iUnitID, iUnitType, iX, iY, bDelay, iByPlayer)
  local key = iPlayer..":"..iUnitID..":"..(iX or -1)..":"..(iY or -1)
  if _fired[key] then return end

  local pPlayer = Players[iPlayer]; if not pPlayer then return end
  local u = pPlayer:GetUnitByID(iUnitID)  -- short-range usually still alive

  -- : ()
  local lvl = (u and GetLevelFromUnit(u)) or UNIT_SPLASH_LEVEL[iUnitType]
  if not lvl or lvl <= 0 then return end

  local cfg = LEVELS[math.min(lvl,3)] or LEVELS[1]
  local center = Map.GetPlot(iX, iY); if not center then return end

  -- center(0 no-op)
  DoSplashAtPlot(iPlayer, center, cfg.center or 0)

  -- (1..radius)
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
-- FW ICBM splash target-plot capture via BattleJoined (for Vox Populi)
--   Paste this AFTER your current splash modules.
-- =====================================================================
print("[FW]ICBM target-capture route loaded")

-- : ICBM ( )
local FW_ICBM_TYPES = {
  [GameInfoTypes.UNIT_FW_GOD_ROD]  = true,
  [GameInfoTypes.UNIT_FW_GOD_ROD2] = true,
}

-- /option
local FW_ICBM_RING1_DMG      = 20      -- 6 ( 4/5 )
local FW_PROMO_L4            = GameInfoTypes.PROMOTION_FW_SPLASH_DAMAGE_4
local FW_PROMO_L5            = GameInfoTypes.PROMOTION_FW_SPLASH_DAMAGE_5
local FW_DMGL4, FW_DMGL5     = 40, 50
local FW_FRIENDLY_FIRE       = false   -- true

-- (comment translated to English)
local FW_UNIT_VAULT_RACK     = GameInfoTypes.UNIT_FW_VAULT_RACK

-- war/friendly
local function FW_IsValidTarget(attID, tgtID)
  if tgtID == -1 then return false end
  if attID == tgtID then return FW_FRIENDLY_FIRE end
  local A, T = Players[attID], Players[tgtID]
  if not A or not T then return false end
  return Teams[A:GetTeam()]:IsAtWar(T:GetTeam()) or FW_FRIENDLY_FIRE
end

-- 6
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
-- A) "target plot"
-- -----------------------------
-- ID -> center Plot
local pendingTargets = {}     -- [attackerUnitID] = Plot
-- ID ( )
local currentAtkUnit = {}     -- [playerID] = unitID

-- iRole DLL / .
-- environment , "two-call combination" .
local function OnBattleJoined(iPlayer, iUnitOrCity, iRole, bIsCity)
  local pPlayer = Players[iPlayer]; if not pPlayer then return end

  if not bIsCity then
    local u = pPlayer:GetUnitByID(iUnitOrCity)
    if u then
      local utype = u:GetUnitType()
      -- 1) (/2) "this player's attacker"
      if FW_ICBM_TYPES[utype] then
        currentAtkUnit[iPlayer] = iUnitOrCity
        -- (comment translated to English)
        print(string.format("[FW][ICBM] BattleJoined ATK? p=%d unit=%d type=%d", iPlayer, iUnitOrCity, utype))
        return
      end
    end
  end

  -- 2) () , "attacker unit ID"
  local atkUnitID = currentAtkUnit[iPlayer]           -- (comment translated to English)
  if not atkUnitID then
    -- 'opposing player' ( )
    for pid=0, GameDefines.MAX_MAJOR_CIVS-1 do
      if currentAtkUnit[pid] then atkUnitID = currentAtkUnit[pid]; break end
    end
  end
  if not atkUnitID then return end

  local center
  if bIsCity then
    -- (comment translated to English)
    local c = pPlayer:GetCityByID(iUnitOrCity)
    if c then center = c:Plot() end
  else
    -- (comment translated to English)
    local def = pPlayer:GetUnitByID(iUnitOrCity)
    if def then center = def:GetPlot() end
  end

  if center then
    pendingTargets[atkUnitID] = center
    -- ( )
    currentAtkUnit[iPlayer] = nil
    print(string.format("[FW][ICBM] target lock by battle: atkUnit=%d at (%d,%d)",
      atkUnitID, center:GetX(), center:GetY()))
  end
end

if GameEvents.BattleJoined then
  GameEvents.BattleJoined.Add(OnBattleJoined)
  print("[FW]ICBM BattleJoined hook active")
else
  print("[FW]ICBM BattleJoined not available (CP DLL events off)")
end

-- ----------------------------------------
-- B) Prekill 'target plot'
-- ----------------------------------------
local fired = {}
local function OnUnitPrekill_ICBM(iPlayer, iUnitID, iUnitType, iX, iY, bDelay, iByPlayer)
  if not FW_ICBM_TYPES[iUnitType] then return end
  local key = iPlayer..":"..iUnitID..":"..(iX or -1)..":"..(iY or -1)
  if fired[key] then return end

  -- : L5 > L4 >
  local dmg = FW_ICBM_RING1_DMG
  local u = Players[iPlayer] and Players[iPlayer]:GetUnitByID(iUnitID)
  if u then
    if FW_PROMO_L5 and u:IsHasPromotion(FW_PROMO_L5) then dmg = FW_DMGL5
    elseif FW_PROMO_L4 and u:IsHasPromotion(FW_PROMO_L4) then dmg = FW_DMGL4 end
  end

  -- 1: BattleJoined
  local center = pendingTargets[iUnitID]
  -- 2: ( /)
  if not center and type(iX)=="number" and iX>=0 and type(iY)=="number" and iY>=0 then
    center = Map.GetPlot(iX, iY)
    print("[FW][ICBM] fallback to prekill coords")
  end
  -- 3: fallback
  if not center and u then
    center = Map.GetPlot(u:GetX(), u:GetY())
    print("[FW][ICBM] fallback to unit XY")
  end
  if not center then
    print("[FW][ICBM] ERROR no center plot; abort")
    return
  end

  -- radius1
  local totalU, totalC = 0, 0
  for _,p in ipairs(FW_Ring1(center)) do
    local hu, hc = FW_DoPlot(iPlayer, p, dmg); totalU = totalU + hu; totalC = totalC + hc
  end

  -- use
  pendingTargets[iUnitID] = nil
  fired[key] = true

  print(string.format("[FW][ICBM] splash @(%d,%d) ring1=%d hits u=%d c=%d (bDelay=%s)",
    center:GetX(), center:GetY(), dmg, totalU, totalC, tostring(bDelay)))
end
GameEvents.UnitPrekill.Add(OnUnitPrekill_ICBM)


--======================================================================================================================
-- Improvement
--======================================================================================================================
print("[FW] Undersea Tunnel script loaded")

-- ==========================================================
-- Undersea Tunnel: on placement Railroad create (water+land6 condition)
-- - events: TileImprovementChanged + BuildFinished(backup) + PlayerDoTurn(correction)
-- - constants/ID : GameInfoTypes nil , safe skip if key missing
-- - return use
-- ==========================================================

local TUNNEL_IMP_KEYS = {
  "IMPROVEMENT_UNDERSEA_TUNNEL",
  "IMPROVEMENT_FW_UNDERSEA_TUNNEL", -- alternative naming
}
local TUNNEL_BUILD_KEYS = {
  "BUILD_UNDERSEA_TUNNEL",
  "BUILD_FW_UNDERSEA_TUNNEL",
}

local RAIL_KEY = "ROUTE_RAILROAD"
local iRouteRailroad = GameInfoTypes[RAIL_KEY]

if not iRouteRailroad then
  print("[FW][UnderseaTunnel] ERROR: ROUTE_RAILROAD not found. Skipping tunnel automation.")
else
  -- actually existing Improvement/Build collect
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

  local hasAnyTunnelKey = (next(TunnelImprovementIDs) ~= nil) or (next(TunnelBuildIDs) ~= nil)
  if not hasAnyTunnelKey then
    print("[FW][UnderseaTunnel] ERROR: No Undersea Tunnel Improvement/Build IDs found. Skipping.")
  else
    -- option: land melee
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
      -- condition 1: water( )
      if (not plot:IsWater()) or plot:IsLake() then return end
      -- condition 2: surrounding land NEAR_LAND_RANGE
      if not IsWithinRangeOfLand(plot, NEAR_LAND_RANGE) then return end
      -- action: set railroad
      plot:SetRouteType(iRouteRailroad, true)
    end

    -- correction ( environment events correction)
    local pendingPlots = {} -- [plotIndex] = true
    local function EnqueuePlot(x, y)
      local p = Map.GetPlot(x, y)
      if p then
        pendingPlots[p:GetPlotIndex()] = true
      end
    end

    -- A) improvement change hook(most straightforward)
    local function OnTileImprovementChanged(x, y, oldImp, newImp)
      if newImp and TunnelImprovementIDs[newImp] then
        local plot = Map.GetPlot(x, y)
        TryLayRailOnPlot(plot)
        -- correction
        EnqueuePlot(x, y)
      end
    end
    GameEvents.TileImprovementChanged.Add(OnTileImprovementChanged)

    -- B) build finished hook(environment/depending on mod A when not called fallback for backup)
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

    -- C) 1 correction: retry then clear
    local function OnPlayerDoTurn(iPlayer)
      if next(pendingPlots) == nil then return end
      for plotIndex, _ in pairs(pendingPlots) do
        local plot = Map.GetPlotByIndex(plotIndex)
        TryLayRailOnPlot(plot)
        pendingPlots[plotIndex] = nil
      end
    end
    GameEvents.PlayerDoTurn.Add(OnPlayerDoTurn)

    print("[FW][UnderseaTunnel] Registered.")
  end
end



print("[FW]Vault loading check")

--======================================================================================================================
-- Constants
--======================================================================================================================
local iImprovementVault        = GameInfoTypes.IMPROVEMENT_FW_VAULT or -1
local iMaxMissilesPerSilo      = 3
local iSpecial_Missile         = GameInfoTypes.SPECIALUNIT_MISSILE or -1

--======================================================================================================================
-- Helpers
--======================================================================================================================
local function CanSiloAt(pPlot, pUnit)
  if not (pPlot and pUnit) then return false end
  local iPlayer = pUnit:GetOwner()

  -- if units present, allow ours only
  for i = 0, pPlot:GetNumUnits()-1 do
    local u = pPlot:GetUnit(i)
    if u then
      if u:GetOwner() == iPlayer then
        return true
      else
        return false
      end
    end
  end

  -- if no unit, check tile ownership
  local iOwner = pPlot:GetOwner()
  if (iOwner == iPlayer) or (iOwner == -1) or (Teams[Players[iPlayer]:GetTeam()]:IsAtWar(Players[iOwner]:GetTeam()) == false and Players[iPlayer]:GetTeam() == Players[iOwner]:GetTeam()) then
    -- "nukes only" check: special unit check (magic number 2 use )
    return (pUnit:GetSpecialUnitType() == iSpecial_Missile)
  end

  local pOwner = Players[iOwner]
  if pOwner and pOwner:IsMinorCiv() and (pOwner:GetAlly() == iPlayer) then
    return (pUnit:GetSpecialUnitType() == iSpecial_Missile)
  end

  return false
end

local function CountMissiles(pPlot, pUnit)
  if not (pPlot and pUnit) then return 0 end
  local iMissiles = 0
  local iPlayer   = pUnit:GetOwner()
  for i = 0, pPlot:GetNumUnits()-1 do
    local u = pPlot:GetUnit(i)
    if u and u:GetOwner() == iPlayer and u:GetSpecialUnitType() == iSpecial_Missile then
      iMissiles = iMissiles + 1
    end
  end
  return iMissiles
end

--======================================================================================================================
-- Event Handlers (with nil-guards)
--======================================================================================================================
local function OnCanLoadNukesAt(iPlayer, iUnit, iPlotX, iPlotY)
  local pPlot = Map.GetPlot(iPlotX, iPlotY)
  if not pPlot then return false end

  local pPlayer = Players[iPlayer]
  if not pPlayer then return false end

  local pUnit = pPlayer:GetUnitByID(iUnit)
  if not pUnit then return false end

  if iImprovementVault ~= -1 and pPlot:GetImprovementType() == iImprovementVault then
    -- print(string.format("Nuclear silo found at (%i, %i)", iPlotX, iPlotY))
    return not pPlot:IsImprovementPillaged()
  end
  return false
end

local function OnCanRebaseNukesTo(iPlayer, iUnit, iPlotX, iPlotY)
  local pPlot = Map.GetPlot(iPlotX, iPlotY)
  if not pPlot then return false end

  local pPlayer = Players[iPlayer]
  if not pPlayer then return false end

  local pUnit = pPlayer:GetUnitByID(iUnit)
  if not pUnit then return false end

  if (iImprovementVault ~= -1) and (pPlot:GetImprovementType() == iImprovementVault) and (not pPlot:IsImprovementPillaged()) and CanSiloAt(pPlot, pUnit) then
    -- print(string.format("Found a viable missile silo at (%i, %i) - checking missile limit", iPlotX, iPlotY))
    return (CountMissiles(pPlot, pUnit) < iMaxMissilesPerSilo)
  end
  return false
end

--======================================================================================================================
-- Safe registration (DLL events )
--======================================================================================================================
if GameEvents and GameEvents.CanLoadAt and GameEvents.CanRebaseTo then
  GameEvents.CanLoadAt.Add(OnCanLoadNukesAt)
  GameEvents.CanRebaseTo.Add(OnCanRebaseNukesTo)
  print("[FW]Vault handlers registered.")
else
  print("[FW]Vault required GameEvents not available (VP/CP DLL missing or wrong load order).")
end


--==========================================================
-- Wonders
---==========================================================

--------------------------------------------
-- Mnemosyne : XP based on highest level
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
-- Angelnet : promotion /
-- - owner only
-- - 'the city' center radius iRange
-- - city capture/transfer/persist across loading
--==========================================================

local iBuildingAngelnet  = GameInfoTypes.BUILDING_FW_ANGELNET         -- (comment translated to English)
local iPromotionAngelnet = GameInfoTypes.PROMOTION_FW_ANGELNET        -- promotion
local iRangeAngelnet     = 4                                          -- radius

local g_AngelOwner   = nil
local g_AngelCityX   = nil
local g_AngelCityY   = nil

-- re-scan owner/coordinates
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

-- promotion
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

-- refresh all owner's units(for start-of-turn stabilization)
local function RefreshAllAngel()
  if not g_AngelOwner then return end
  local p = Players[g_AngelOwner]; if not p or not p:IsAlive() then return end
  for u in p:Units() do RefreshUnitAngel(u) end
end

-- events
Events.LoadScreenClose.Add(function() RefindAngelnet(); RefreshAllAngel() end)

GameEvents.CityConstructed.Add(function(iPlayer, iCity, iBuilding)
  if iBuilding == iBuildingAngelnet then
    RefindAngelnet(); RefreshAllAngel()
  end
end)

GameEvents.CityCaptureComplete.Add(function(iOld, bCap, x, y, iNew)
  -- re-scan in case capture changed owner/coords
  RefindAngelnet()
  -- natural cleanup for both sides: keep only owner cleaned per turn
end)

GameEvents.UnitSetXY.Add(function(iPlayer, iUnit)
  -- refresh moved unit immediately
  local p = Players[iPlayer]; if not p or not p:IsAlive() then return end
  RefreshUnitAngel(p:GetUnitByID(iUnit))
end)

GameEvents.PlayerDoTurn.Add(function(iPlayer)
  if g_AngelOwner == iPlayer then RefreshAllAngel() end
end)


--=================================================================================================

-- =========================================================
-- Laputa_AntiPillageOnly.lua
-- - Laputa(BUILDING_FW_LAPUTA) in all cities of the owning civ dummy(option) sync
-- - Laputa block pillage attempts(if possible)

print("[FW]Laputa_DummySyncOnly loaded")

-- [Keys: match your SQL/XML]
local BUILDING_LAPUTA       = GameInfoTypes.BUILDING_FW_LAPUTA
local BUILDING_LAPUTA_DUMMY = GameInfoTypes.BUILDING_FW_LAPUTA_DUMMY  -- nil is fine if missing

if not BUILDING_LAPUTA then
  print("[Laputa] ERROR: BUILDING_FW_LAPUTA not found in DB.")
  else
  if not BUILDING_LAPUTA_DUMMY then
     print("[Laputa] NOTE: Dummy building not found. Dummy sync will be skipped.")
  end
end
-- [Laputa ownership cache]
local hasLaputa = {}  -- [playerID] = bool

local function PlayerHasLaputa(p)
  return p and p.IsAlive and p:IsAlive() and (p:CountNumBuildings(BUILDING_LAPUTA) > 0)
end

local function RefreshHasLaputa(iPlayer)
  local p = Players[iPlayer]
  hasLaputa[iPlayer] = PlayerHasLaputa(p)
end

-- [ dummy sync(option)]
local function SyncLaputaDummyForPlayer(p)
  if not BUILDING_LAPUTA_DUMMY then return end
  if not p or not p.IsAlive or not p:IsAlive() then return end
  local want = PlayerHasLaputa(p) and 1 or 0
  for city in p:Cities() do
    if city:GetNumRealBuilding(BUILDING_LAPUTA_DUMMY) ~= want then
      city:SetNumRealBuilding(BUILDING_LAPUTA_DUMMY, want)
    end
  end
end

-- [events ]
Events.SequenceGameInitComplete.Add(function()
  for i = 0, GameDefines.MAX_PLAYERS - 1 do
    RefreshHasLaputa(i)
    SyncLaputaDummyForPlayer(Players[i])
  end
end)

GameEvents.CityConstructed.Add(function(iPlayer, iCity, iBuilding)
  if iBuilding ~= BUILDING_LAPUTA then return end
  RefreshHasLaputa(iPlayer)
  SyncLaputaDummyForPlayer(Players[iPlayer])
end)

GameEvents.PlayerCityFounded.Add(function(iPlayer)
  SyncLaputaDummyForPlayer(Players[iPlayer])
end)

GameEvents.CityCaptureComplete.Add(function(iOld, bIsCapital, iX, iY, iNew)
  if iOld ~= -1 then
    RefreshHasLaputa(iOld)
    SyncLaputaDummyForPlayer(Players[iOld])
  end
  if iNew ~= -1 then
    RefreshHasLaputa(iNew)
    SyncLaputaDummyForPlayer(Players[iNew])
  end
end)

if GameEvents.CityAcquiredAndKept then
  GameEvents.CityAcquiredAndKept.Add(function(iPlayer, iCityID)
    SyncLaputaDummyForPlayer(Players[iPlayer])
  end)
end

GameEvents.PlayerDoTurn.Add(function(iPlayer)
  RefreshHasLaputa(iPlayer)
  SyncLaputaDummyForPlayer(Players[iPlayer])
end)


print("Finished loading FutureLua.lua from VP-FW mod");