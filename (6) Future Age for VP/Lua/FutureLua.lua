print("Loading FutureLua.lua from VP-FW mod");
--------------------------------------------
-- Locals
--------------------------------------------
local iBuildingAngelnet = GameInfoTypes["BUILDING_FW_ANGELNET"]
local iPromotionAngelnet = GameInfoTypes["PROMOTION_FW_ANGELNET"]
local iRangeAngelnet = 5
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

-- Obsolet with 'ProhibitedCityTerrain'
-- local tValidIsNoCoastBuildings = {
-- 	[GameInfo.Buildings.BUILDING_FW_DEFENSE_FIELD.ID] = true,
-- 	[GameInfo.Buildings.BUILDING_FW_JURASSIC_PARK.ID] = true,
-- }
-- -- checks if city is NOT near COAST
-- function IsNoCoastFW(ePlayer, eCity, eBuilding)
-- 	if not tValidIsNoCoastBuildings[eBuilding] then return true end
-- 	local pPlayer = Players[ePlayer]
-- 	if not pPlayer:IsAlive() then return false end
-- 	local pCity = pPlayer:GetCityByID(eCity)
-- 	local iCityX = pCity:GetX()
-- 	local iCityY = pCity:GetY()
-- 	if pCity:IsCoastal(10) then
-- 		return false
-- 	end
-- 	return true
-- end
-- GameEvents.CityCanConstruct.Add(IsNoCoastFW)

-- checks if city has enough citizens
local tValidIsHasCitizens = {
	[GameInfo.Buildings.BUILDING_FW_BRAIN_UPLOADING.ID] = 75,
	[GameInfo.Buildings.BUILDING_FW_DIGITAL_EMANCIPATION.ID] = 75,
	[GameInfo.Buildings.BUILDING_FW_ANGELNET.ID] = 45
}
function IsHasCitizensFW(ePlayer, eCity, eBuilding)
	if not tValidIsHasCitizens[eBuilding] then return true end
	local pPlayer = Players[ePlayer]
	if not pPlayer:IsAlive() then return false end
	local iCitizens = tValidIsHasCitizens[eBuilding]
	local pCity = pPlayer:GetCityByID(eCity)
	if pCity:GetPopulation() >= iCitizens then
		return true
	end
	return false
end
GameEvents.CityCanConstruct.Add(IsHasCitizensFW)

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
		if iNewXP > 200 then
			iNewXP = 200
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

--------------------------------------------
-- Implant Clinic - Spaceship Factory
--------------------------------------------
function AddPromotionBuildingsFW(iPlayer, iCity, iUnit, bGold, bFaith)
	local tEligibleCombats = {
		GameInfoTypes.UNITCOMBAT_RECON,
		GameInfoTypes.UNITCOMBAT_GUN,
		GameInfoTypes.UNITCOMBAT_MOUNTED,
		GameInfoTypes.UNITCOMBAT_MELEE
	}
	
	local tEligibleUnits = {
		GameInfoTypes.UNIT_FW_BIOSHIP,
		GameInfoTypes.UNIT_FW_NEXUS,
		GameInfoTypes.UNIT_FW_SPACE_FIGHTER,
		GameInfoTypes.UNIT_FW_SPACE_BOMBER,
		GameInfoTypes.UNIT_XCOM,
		GameInfoTypes.UNIT_FW_SPACEMARINES,
		GameInfoTypes.UNIT_FW_ORBITAL_DROP_SHOCK_TROOPER
	}
	
	local iImplantClinic = GameInfoTypes.BUILDING_FW_IMPLANT_CLINIC
	local iPromotion1 = GameInfoTypes.PROMOTION_FW_IMPLANTS_I
	local iPromotion2 = GameInfoTypes.PROMOTION_FW_IMPLANTS_II
	local iPromotion3 = GameInfoTypes.PROMOTION_FW_IMPLANTS_III
	
	local iSpaceshipFactory = GameInfoTypes.BUILDING_SPACESHIP_FACTORY
	local iSpaceshipPromotion = GameInfoTypes.PROMOTION_FW_SPACESHIP

	local pPlayer = Players[iPlayer]
    if pPlayer:GetCityByID(iCity):IsHasBuilding(iImplantClinic) then
        if JFD_GetRandomFW(1, 5) >= 4 then
            local pUnit = pPlayer:GetUnitByID(iUnit)
            for i, iUnitCombatType in pairs(tEligibleCombats) do
                if pUnit and pUnit:GetUnitCombatType() == iUnitCombatType then
                    if JFD_GetRandomFW(1, 3) == 1 then
                        pUnit:SetHasPromotion(iPromotion3,true)
                    elseif JFD_GetRandomFW(1, 3) == 2 then
                        pUnit:SetHasPromotion(iPromotion2,true)
                    else
                        pUnit:SetHasPromotion(iPromotion1,true)
                    end
                end
            end
        end
    end
	if pPlayer:GetCityByID(iCity):IsHasBuilding(iSpaceshipFactory) then
		local pUnit = pPlayer:GetUnitByID(iUnit)
		local iUnitType = pUnit:GetUnitType()
		for i, iUnitTypeCur in pairs(tEligibleUnits) do
			if pUnit and iUnitType == iUnitTypeCur then
				pUnit:SetHasPromotion(iSpaceshipPromotion,true)
				break
			end
		end
	end
end
GameEvents.CityTrained.Add(AddPromotionBuildingsFW)


--======================================================================================================================
-- Apex Centre - checks number of CS ALLIES (APEX CENTRE)
--======================================================================================================================
local tValidIsHasCsAllies = {
	[GameInfo.Buildings.BUILDING_FW_APEX_CENTRE.ID] = 4
}
function IsHasCsAlliesFW(ePlayer, eCity, eBuilding)
	if not tValidIsHasCsAllies[eBuilding] then return true end
	local pPlayer = Players[ePlayer]
	if not pPlayer:IsAlive() then return false end
	local iRequiredCsAllies = tValidIsHasCsAllies[eBuilding]
	local iCurrentCsAllies = 0
	for eCs = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_PLAYERS - 2, 1 do
		local pCs = Players[eCs]
		if not pCs:IsEverAlive() then break end
		if pCs:IsAlive() and pCs:IsAllies(ePlayer) then
			iCurrentCsAllies = iCurrentCsAllies + 1
			if iCurrentCsAllies >= iRequiredCsAllies then
				return true
			end
		end
	end
	return false
end
GameEvents.CityCanConstruct.Add(IsHasCsAlliesFW)

--======================================================================================================================
-- Gene Vault - checks if player is at PEACE (Utsade Gene Vault)
--======================================================================================================================
local tValidIsAtPeaceFw = {
	[GameInfo.Buildings.BUILDING_FW_GENE_VAULT.ID] = true
}
function IsAtPeaceFW(ePlayer, eCity, eBuilding)
	if not tValidIsAtPeaceFw[eBuilding] then return true end
	local pPlayer = Players[ePlayer]
	if not pPlayer:IsAlive() then return false end
	local pTeam = Teams[pPlayer:GetTeam()]
	local iCountWars = pTeam:GetAtWarCount(false)
	if iCountWars > 0 then
		return false
	end
	return true
end
GameEvents.CityCanConstruct.Add(IsAtPeaceFW)


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

--======================================================================================================================





print("Finished loading FutureLua.lua from VP-FW mod");

