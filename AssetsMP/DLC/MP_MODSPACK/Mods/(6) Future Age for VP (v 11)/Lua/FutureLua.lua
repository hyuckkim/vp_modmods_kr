print("Loading FutureLua.lua from VP-FW mod");
--------------------------------------------
-- Locals
--------------------------------------------
local iBuildingAngelnet = GameInfoTypes["BUILDING_FW_ANGELNET"]
local iPromotionAngelnet = GameInfoTypes["PROMOTION_FW_ANGELNET"]
local iRangeAngelnet = 4
local bHasAngelnet = false
local iPlayerAngelnet
local iPlotXAngelnet -- City which built Angelnet Ghebbi
local iPlotYAngelnet -- City which built Angelnet Ghebbi
local iFloatingIslands = GameInfoTypes["BUILDING_FW_FLOATINGISLANDS"]
local iFloatingIslandsDummy = GameInfoTypes["BUILDING_FW_FLOATINGISLANDS_DUMMY"]
local bHasFloatingIslands = false
local iPlayerFloatingIslands
local iPlotXFloatingIslands -- City which built FloatingIslands
local iPlotYFloatingIslands -- City which built FloatingIslands
local iBuildingMnemosyne = GameInfoTypes["BUILDING_FW_MNEMOSYNE"]

print("FloatingIslands is", iFloatingIslands, "FloatingIslands Dummy is", iFloatingIslandsDummyck);

--------------------------------------------
-- Angelnet
--------------------------------------------
function AngelnetFW(iPlayer, iUnit, iPlotX, iPlotY)
	--print("CBOEE_Angelnet() for player; aura range is", iPlayer, iRangeAngelnet);
	if bHasAngelnet then
		local pPlayer = Players[iPlayer]
		if pPlayer and pPlayer:IsAlive() and iPlayer == iPlayerAngelnet then
			--print("Player owns Angelnet");
			local pUnit = pPlayer:GetUnitByID(iUnit)
			if pUnit and pUnit:IsCombatUnit() then
				if (Map.PlotDistance(iPlotX, iPlotY, iPlotXAngelnet, iPlotYAngelnet) <= iRangeAngelnet) then
					--print("Unit IN range of Angelnet", unit:GetName());
					pUnit:SetHasPromotion(iPromotionAngelnet, true);
				else
					--print("Unit OUT OF range of Angelnet", unit:GetName());
					pUnit:SetHasPromotion(iPromotionAngelnet, false);
				end
			end
		end
	end
end
GameEvents.UnitSetXY.Add(AngelnetFW)

--------------------------------------------
--Angelnet, FloatingIslands: load game, check if they are built 
--------------------------------------------
function OnLoadScreenCloseFW()
	for i = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
		local pPlayer = Players[i]
		if pPlayer:IsEverAlive() then
			for pCity in pPlayer:Cities() do
				if pCity then
					if pCity:IsHasBuilding(iBuildingAngelnet) then
						bHasAngelnet = true
						iPlotXAngelnet = pCity:GetX()
						iPlotYAngelnet = pCity:GetY()
						iPlayerAngelnet = i
					end
					if pCity:IsHasBuilding(iFloatingIslands) then
						bHasFloatingIslands = true
						iPlotXFloatingIslands = pCity:GetX()
						iPlotYFloatingIslands = pCity:GetY()
						iPlayerFloatingIslands = i
					end
				end
			end
		
		end
	end
end
Events.LoadScreenClose.Add(OnLoadScreenCloseFW)
--------------------------------------------
-- FloatingIsands, Angelnet: check if wonder was built
--------------------------------------------
function OnCityConstructedFW (iPlayer, iCity, iBuilding, bGold, bFaith) 
	if iBuilding == iFloatingIslands then
		print("FloatingIslands constructed by player "..iPlayer.." in city "..iCity);
		bHasFloatingIslands = true
		iPlayerFloatingIslands = iPlayer
		local pPlayer = Players[iPlayer]
		if pPlayer then
			local pCity = pPlayer:GetCityByID(iCity)
			if pCity then
				iPlotXFloatingIslands = pCity:GetX()
				iPlotYFloatingIslands = pCity:GetY()
			end
			for pCity in pPlayer:Cities() do
				if pCity:IsCoastal(10) then
					print("City "..pCity:GetName().." is coastal, so granting Floating Islands Dummy...");
					pCity:SetNumRealBuilding (iFloatingIslandsDummy, 1);
					--if pCity:GetNumRealBuilding(iFloatingIslandsDummy) > 0 then print("...granted ok"); end
				else
					print("City "..pCity:GetName().." is NOT coastal");
				end
			end
		end
	elseif iBuilding == iBuildingAngelnet then
		print("Angelnet constructed by player "..iPlayer.." in city "..iCity);
		bHasAngelnet = true
		iPlayerAngelnet = iPlayer
		local pPlayer = Players[iPlayer]
		if pPlayer then
			local pCity = pPlayer:GetCityByID(iCity)
			if pCity then
				iPlotXAngelnet = pCity:GetX()
				iPlotYAngelnet = pCity:GetY()
			end
		end
	end
end
GameEvents.CityConstructed.Add(OnCityConstructedFW)

--------------------------------------------
-- Floating Islands: check if new city has effects
--------------------------------------------
function OnPlayerCityFoundedFW (iPlayer, iX, iY)
	if bHasFloatingIslands then
		if iPlayer == iPlayerFloatingIslands then
			local pPlot = Map.GetPlot(iX, iY)
			local pCity = pPlot:GetPlotCity()
			if pCity:IsCoastal(10) then
				pCity:SetNumRealBuilding (iFloatingIslandsDummy, 1)
			end
		end
	end
end
GameEvents.PlayerCityFounded.Add(OnPlayerCityFoundedFW)


local tValidIsNoCoastBuildings = {
	[GameInfo.Buildings.BUILDING_FW_DEFENSE_FIELD.ID] = true,
	[GameInfo.Buildings.BUILDING_FW_JURASSIC_PARK.ID] = true,
}
-- checks if city is NOT near COAST
function IsNoCoastFW(ePlayer, eCity, eBuilding)
	if not tValidIsNoCoastBuildings[eBuilding] then return true end
	local pPlayer = Players[ePlayer]
	if not pPlayer:IsAlive() then return false end
	local pCity = pPlayer:GetCityByID(eCity)
	local iCityX = pCity:GetX()
	local iCityY = pCity:GetY()
	if pCity:IsCoastal(10) then
		return false
	end
	return true
end
GameEvents.CityCanConstruct.Add(IsNoCoastFW)

--------------------------------------------
-- Mnemosyne 
--------------------------------------------
function MnemosyneBonusFW(iPlayer, iCity, iUnitID, bGold, bFaithOrCulture)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnitID)
	local pCity = pPlayer:GetCityByID(iCity)
	if pCity:IsHasBuilding(iBuildingMnemosyne) then
		local iHighestUnitLevel = pPlayer:GetHighestUnitLevel()
		local iNewXP = iHighestUnitLevel * 10
		if iNewXP > 100 then
			iNewXP = 100
		end
		if pUnit:IsCombatUnit() then
			pUnit:ChangeExperience(iNewXP)
		end
	end
end
GameEvents.CityTrained.Add(MnemosyneBonusFW)


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
						if (loopUnit:GetUnitType() == GameInfoTypes["UNIT_FW_HYPERMISSILE"]) then
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
local iToxinModPromotion = GameInfoTypes.PROMOTION_FW_TOXIN_MOD
local iToxinModPromotion = GameInfoTypes.PROMOTION_FW_TOXIN_MOD

function FWUnitDestroyed(iPlayer, iUnit, iUnitType, iX, iY, bDelay, iByPlayer)

	local pPlayer = Players[iPlayer]
	local teamID = pPlayer:GetTeam()
	local pPlayerTeam = Teams[teamID]
	local pUnit = pPlayer:GetUnitByID(iUnit)

	print("Unit destroyed")

	print("iPlayer = " .. iPlayer)
	print("iByPlayer = " .. iByPlayer)

	-- Must have been killed by another Player
	if iPlayer == iByPlayer then return end
	if iByPlayer == -1 then return end

	-- Must have the Toxin Promotion
	bToxin = pUnit:IsHasPromotion(iToxinModPromotion)

	if not(bToxin) then return end
	print("Has Toxin")

	local pPlot = pUnit:GetPlot()	
	for pAdjacentPlot in PlotAreaSweepIterator(pPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
	    print("Checking plot")
	    for iVal = 0,(pAdjacentPlot:GetNumUnits() - 1) do
			print("Checking unit")	
		    local loopUnit = pAdjacentPlot:GetUnit(iVal)
			if loopUnit:GetOwner() ~= iPlayer then
			    print("Not same owner")
				local loopUnitOwner = loopUnit:GetOwner()
				local otherPlayer = Players[loopUnitOwner]
				local otherTeamID = otherPlayer:GetTeam()
				if pPlayerTeam:IsAtWar(otherTeamID) then
					if (bToxin) then
						loopUnit:ChangeDamage(10)
						end
					end
				end
			end
		end	
end
GameEvents.UnitPrekill.Add(FWUnitDestroyed)

local iNuclearModPromotion = GameInfoTypes.PROMOTION_FW_NUCLEAR_SMR
local iNuclearModPromotion = GameInfoTypes.PROMOTION_FW_NUCLEAR_SMR

function FWUnitDestroyed2(iPlayer, iUnit, iUnitType, iX, iY, bDelay, iByPlayer)

	local pPlayer = Players[iPlayer]
	local teamID = pPlayer:GetTeam()
	local pPlayerTeam = Teams[teamID]
	local pUnit = pPlayer:GetUnitByID(iUnit)

	print("Unit destroyed")

	print("iPlayer = " .. iPlayer)
	print("iByPlayer = " .. iByPlayer)

	-- Must have been killed by another Player
	if iPlayer == iByPlayer then return end
	if iByPlayer == -1 then return end

	-- Must have the SMR Promotion
	bNuclear = pUnit:IsHasPromotion(iNuclearModPromotion)

	if not(bNuclear) then return end
	print("Has Nuclear")

	local pPlot = pUnit:GetPlot()	
	for pAdjacentPlot in PlotAreaSweepIterator(pPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
	    print("Checking plot")
	    for iVal = 0,(pAdjacentPlot:GetNumUnits() - 1) do
			print("Checking unit")	
		    local loopUnit = pAdjacentPlot:GetUnit(iVal)
			if loopUnit:GetOwner() ~= iPlayer then
			    print("Not same owner")
				local loopUnitOwner = loopUnit:GetOwner()
				local otherPlayer = Players[loopUnitOwner]
				local otherTeamID = otherPlayer:GetTeam()
				if pPlayerTeam:IsAtWar(otherTeamID) then
					if (bNuclear) then
						loopUnit:ChangeDamage(20)
						end
					end
				end
			end
		end	
end
GameEvents.UnitPrekill.Add(FWUnitDestroyed2)


--======================================================================================================================
-- VAULT
--======================================================================================================================
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



print("Finished loading FutureLua.lua from VP-FW mod");

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
