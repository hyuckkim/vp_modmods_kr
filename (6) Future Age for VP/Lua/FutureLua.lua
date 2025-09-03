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

print("FloatingIslands is", iFloatingIslands, "FloatingIslands Dummy is", iFloatingIslandsDummy);

--------------------------------------------
-- Floating Islands: Human-only sync helpers
--------------------------------------------
local function HumanID() return Game.GetActivePlayer() end

local function ApplyFloatingDummyToPlayer(iTargetPlayer)
	local p = Players[iTargetPlayer]
	if not p or not p:IsAlive() then return end
	for city in p:Cities() do
		city:SetNumRealBuilding(iFloatingIslandsDummy, 1)
	end
end

local function ClearFloatingDummyFromPlayer(iTargetPlayer)
	local p = Players[iTargetPlayer]
	if not p or not p:IsAlive() then return end
	for city in p:Cities() do
		if city:GetNumRealBuilding(iFloatingIslandsDummy) > 0 then
			city:SetNumRealBuilding(iFloatingIslandsDummy, 0)
		end
	end
end

local function HumanOwnsFloatingIslands()
	return bHasFloatingIslands and iPlayerFloatingIslands == HumanID()
end


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
					
	-- Human-only sync on load
	if HumanOwnsFloatingIslands() then
		ApplyFloatingDummyToPlayer(HumanID())
	else
		ClearFloatingDummyFromPlayer(HumanID())
	end
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
		-- Human-only: only apply if city belongs to human and human currently owns the wonder
		if iPlayer == HumanID() and HumanOwnsFloatingIslands() then
			local pPlot = Map.GetPlot(iX, iY)
			if pPlot then
				local pCity = pPlot:GetPlotCity()
				if pCity then
					pCity:SetNumRealBuilding (iFloatingIslandsDummy, 1)
				end
			end
		end
	end
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
-- Floating Islands: capture sync (human-only)
--------------------------------------------
function OnCityCaptureCompleteFW (oldOwner, bIsCapital, iX, iY, newOwner, bConquest)
	local pPlot = Map.GetPlot(iX, iY)
	if not pPlot then return end
	local pCity = pPlot:GetPlotCity()
	if not pCity then return end
	if pCity:IsHasBuilding(iFloatingIslands) then
		-- Update current owner of the Wonder
		iPlayerFloatingIslands = newOwner
		-- Human-only re-sync
		if newOwner == HumanID() then
			ApplyFloatingDummyToPlayer(HumanID())
		else
			ClearFloatingDummyFromPlayer(HumanID())
		end
	end
end
GameEvents.CityCaptureComplete.Add(OnCityCaptureCompleteFW)
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
-----------------------------------
-- Random util
-----------------------------------
function JFD_GetRandomFW(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end

-----------------------------------
-- Config (조정 지점)
-----------------------------------
local UNIT_CRAWLER          = GameInfoTypes.UNIT_FW_CRAWLER
local UNIT_ANGEL            = GameInfoTypes.UNIT_FW_ANGEL
local UNIT_MISSILE_SPAWNED  = GameInfoTypes.UNIT_FW_HYPERMISSILE
-- Crawler 타일에서 “이미 있는 미사일”을 셀 때 기준 유닛(원코드에 맞춤)
local UNITTYPE_TO_COUNT_FOR_CRAWLER = GameInfoTypes.UNIT_GUIDED_MISSILE
-- Angel 타일에서 “이미 있는 미사일” 셀 때 기준 유닛(원코드에 맞춤)
local UNITTYPE_TO_COUNT_FOR_ANGEL   = GameInfoTypes.UNIT_FW_HYPERMISSILE

local CRAWLER_SPAWN_CHANCE = 25   -- %
local CRAWLER_TILE_CAP     = 3    -- 타일에 허용할 미사일 수(해당 체크 유닛 기준)
local ANGEL_SPAWN_CHANCE   = 25   -- %
local ANGEL_TILE_CAP       = 1

-- 바바리안/시민국가 제외하고 싶으면 true
local EXCLUDE_BARBARIANS   = true
local EXCLUDE_MINOR_CS     = false

-----------------------------------
-- 공용 스폰 함수
-----------------------------------
local function TrySpawnMissileOnPlot(pPlayer, pPlot, unitTypeToSpawn, tileCap, unitTypeToCount)
    if not pPlot then return end
    if not unitTypeToSpawn then return end
    if not unitTypeToCount then unitTypeToCount = unitTypeToSpawn end

    -- 현재 타일의 해당 타입 유닛 수 세기
    local count = 0
    local n = pPlot:GetNumUnits()
    for i = 0, n - 1 do
        local u = pPlot:GetUnit(i)
        if u and u:GetUnitType() == unitTypeToCount then
            count = count + 1
            if count >= tileCap then
                return -- 이미 cap
            end
        end
    end

    -- 기술/자원/생산 조건 무시 생성
    local newUnit = pPlayer:InitUnit(unitTypeToSpawn, pPlot:GetX(), pPlot:GetY())
    if newUnit then
        -- 만약 타일이 유효하지 않다면 근처로 점프
        newUnit:JumpToNearestValidPlot()
    end
end

-----------------------------------
-- Angel/Crawler 공용 처리
-----------------------------------
local function HandleUnitMissileTick(pPlayer, pUnit, spawnChance, tileCap, unitTypeToCount)
    if not pUnit or pUnit:IsDelayedDeath() then return end
    if JFD_GetRandomFW(1, 100) > spawnChance then return end

    local pPlot = pUnit:GetPlot()
    if not pPlot then return end

    TrySpawnMissileOnPlot(pPlayer, pPlot, UNIT_MISSILE_SPAWNED, tileCap, unitTypeToCount)
end

-----------------------------------
-- 메인 턴 훅
-----------------------------------
local function OnPlayerDoTurn_FW(iPlayer)
    local pPlayer = Players[iPlayer]
    if not pPlayer or not pPlayer:IsAlive() then return end
    if EXCLUDE_BARBARIANS and pPlayer:IsBarbarian() then return end
    if EXCLUDE_MINOR_CS and pPlayer:IsMinorCiv() then return end

    for pUnit in pPlayer:Units() do
        local uType = pUnit:GetUnitType()
        if uType == UNIT_CRAWLER then
            -- Crawler: GUIDED_MISSILE 기준으로 타일 cap 체크(원래 코드 유지)
            HandleUnitMissileTick(pPlayer, pUnit, CRAWLER_SPAWN_CHANCE, CRAWLER_TILE_CAP, UNITTYPE_TO_COUNT_FOR_CRAWLER)

        elseif uType == UNIT_ANGEL then
            -- Angel: HYPERMISSILE 기준으로 타일 cap 체크(원래 코드 유지)
            HandleUnitMissileTick(pPlayer, pUnit, ANGEL_SPAWN_CHANCE, ANGEL_TILE_CAP, UNITTYPE_TO_COUNT_FOR_ANGEL)
        end
    end
end
GameEvents.PlayerDoTurn.Add(OnPlayerDoTurn_FW)


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
-- VAULT (Airbase + Missile Silo)
-- - 항공기(전투기/폭격기 등 DOMAIN_AIR) + 미사일(SPECIALUNIT_MISSILE) 모두 재배치 허용
-- - 수용 한도: 항공기/미사일 별도 + 총합
-- - 내 팀(같은 팀)만 사용 가능, 파손 시 불가
--======================================================================================================================
local iImprovementVault     = GameInfoTypes.IMPROVEMENT_FW_VAULT
local SPECIAL_MISSILE       = "SPECIALUNIT_MISSILE"

-- 한도 (원하는 값으로 조정)
local iMaxAircraftPerVault  = 2    -- 전투기/폭격기 등 항공기
local iMaxMissilesPerVault  = 3    -- 유도/핵 미사일
local iMaxTotalPerVault     = 3    -- 총합 상한 (원하면 -1로 끄기)

local function isSameTeam(iPlayerA, iPlayerB)
  if iPlayerA == -1 or iPlayerB == -1 then return false end
  local tA = Players[iPlayerA]:GetTeam()
  local tB = Players[iPlayerB]:GetTeam()
  return tA == tB
end

function OnCanLoadAt_VaultAirbase(iPlayer, iUnit, iPlotX, iPlotY)
  local pPlayer = Players[iPlayer]; if not pPlayer then return false end
  local pUnit   = pPlayer:GetUnitByID(iUnit); if not pUnit then return false end
  local pPlot   = Map.GetPlot(iPlotX, iPlotY); if not pPlot then return false end

  -- 도시/운반유닛이 없는 타일만 이벤트가 온다. 금고 + 비파괴 체크
  if pPlot:GetImprovementType() ~= iImprovementVault then return false end
  if pPlot:IsImprovementPillaged() then return false end

  -- 소유자 팀(같은 팀만 허용; 필요하면 동맹/개방경계까지 넓히세요)
  local ownerID = pPlot:GetOwner()
  if ownerID == -1 or not isSameTeam(iPlayer, ownerID) then return false end

  -- 항공 유닛만 허용 (전투기/폭격기/핵폭탄/유도미사일 등)
  if pUnit:GetDomainType() ~= DomainTypes.DOMAIN_AIR then
    return false
  end

  -- 종류 판별(미사일 여부)
  local unitInfo = GameInfo.Units[pUnit:GetUnitType()]
  local isMissile = (unitInfo and unitInfo.Special == SPECIAL_MISSILE)

  -- 현재 타일의 항공기/미사일 수 카운트
  local aircraftCount, missileCount, totalCount = 0, 0, 0
  local n = pPlot:GetNumUnits()
  for i = 0, n - 1 do
    local u = pPlot:GetUnit(i)
    if u and u:GetDomainType() == DomainTypes.DOMAIN_AIR then
      totalCount = totalCount + 1
      local info = GameInfo.Units[u:GetUnitType()]
      if info and info.Special == SPECIAL_MISSILE then
        missileCount = missileCount + 1
      else
        aircraftCount = aircraftCount + 1
      end
    end
  end

  -- 한도 체크
  if isMissile then
    if iMaxMissilesPerVault >= 0 and missileCount >= iMaxMissilesPerVault then return false end
  else
    if iMaxAircraftPerVault >= 0 and aircraftCount >= iMaxAircraftPerVault then return false end
  end
  if iMaxTotalPerVault >= 0 and totalCount >= iMaxTotalPerVault then return false end

  return true
end
GameEvents.CanLoadAt.Add(OnCanLoadAt_VaultAirbase)


--======================================================================================================================





print("Finished loading FutureLua.lua from VP-FW mod");

