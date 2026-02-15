print("Loading VPEE_Functions.lua from VP-EE mod");
--------------------------------------------
-- Locals
--------------------------------------------
local iBuildingFasil = GameInfoTypes["BUILDING_EE_FASIL_GHEBBI"]
local iPromotionFasil = GameInfoTypes["PROMOTION_EE_FASIL_GHEBBI"]
local iRangeFasil = 3
local bHasFasil = false
local iPlayerFasil
local iPlotXFasil -- City which built Fasil Ghebbi
local iPlotYFasil -- City which built Fasil Ghebbi
local iKronborg = GameInfoTypes["BUILDING_EE_KRONBORG"]
local iKronborgDummy = GameInfoTypes["BUILDING_EE_KRONBORG_DUMMY"]
local bHasKronborg = false
local iPlayerKronborg
local iPlotXKronborg -- City which built Kronborg
local iPlotYKronborg -- City which built Kronborg
local iBuildingVersailles = GameInfoTypes["BUILDING_EE_VERSAILLES"]
local iBuildingDrydock = GameInfoTypes["BUILDING_EE_DRYDOCK"]
local iBuildingClassDrydock = GameInfoTypes["BUILDINGCLASS_EE_DRYDOCK"]
local iPromotionDrydock = GameInfoTypes["PROMOTION_EE_DRYDOCK"]
--local bHasDrydock = false
local iPlayerDrydock
--local iPlotXDrydock -- City which built Drydock
--local iPlotYDrydock -- City which built Drydock
print("Kronborg is", iKronborg, "Kronborg Dummy is", iKronborgDummy, "Versailles is ", iBuildingVersailles, "Drydock is ", iBuildingDrydock);

--------------------------------------------
-- Fasil Ghebbi
-- Infixo: rewritten, not using PlotIterators, should be much faster
-- HungryForFood: Use Lua hook UnitSetXY instead of PlayerDoTurn
--------------------------------------------

function CBOEE_Fasil(iPlayer, iUnit, iPlotX, iPlotY)
	--print("CBOEE_Fasil() for player; aura range is", iPlayer, iRangeFasil);
	if bHasFasil then
		local pPlayer = Players[iPlayer]
		if pPlayer and pPlayer:IsAlive() and iPlayer == iPlayerFasil then
			--print("Player owns Fasil");
			local pUnit = pPlayer:GetUnitByID(iUnit)
			if pUnit and pUnit:IsCombatUnit() then
				if (Map.PlotDistance(iPlotX, iPlotY, iPlotXFasil, iPlotYFasil) <= iRangeFasil) then
					--print("Unit IN range of Fasil", unit:GetName());
					pUnit:SetHasPromotion(iPromotionFasil, true);
				else
					--print("Unit OUT OF range of Fasil", unit:GetName());
					pUnit:SetHasPromotion(iPromotionFasil, false);
				end
			end
		end
	end
end
GameEvents.UnitSetXY.Add(CBOEE_Fasil)

--------------------------------------------
-- Kronborg, Versailles: load game, check if they are built
--------------------------------------------
function OnLoadScreenClose()
	for i = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
		local pPlayer = Players[i]
		if pPlayer:IsEverAlive() then
			for pCity in pPlayer:Cities() do
				if pCity then
					if pCity:IsHasBuilding(iKronborg) then
						bHasKronborg = true
						iPlotXKronborg = pCity:GetX()
						iPlotYKronborg = pCity:GetY()
						iPlayerKronborg = i
					end
					if pCity:IsHasBuilding(iBuildingFasil) then
						bHasFasil = true
						iPlotXFasil = pCity:GetX()
						iPlotYFasil = pCity:GetY()
						iPlayerFasil = i
					end
					if pCity:IsHasBuilding(iBuildingDrydock) then
						--bHasDrydock = true
						--iPlotXDrydock = pCity:GetX()
						--iPlotYDrydock = pCity:GetY()
						iPlayerDrydock = i
					end
				end
			end

		end
	end
end
Events.LoadScreenClose.Add(OnLoadScreenClose)

--------------------------------------------
-- Kronborg, Fasil: check if wonder was built
--------------------------------------------
function OnCityConstructed (iPlayer, iCity, iBuilding, bGold, bFaith)
	if iBuilding == iKronborg then
		print("Kronborg constructed by player "..iPlayer.." in city "..iCity);
		bHasKronborg = true
		iPlayerKronborg = iPlayer
		local pPlayer = Players[iPlayer]
		if pPlayer then
			local pCity = pPlayer:GetCityByID(iCity)
			if pCity then
				iPlotXKronborg = pCity:GetX()
				iPlotYKronborg = pCity:GetY()
			end
			for pCity in pPlayer:Cities() do
				if pCity:IsCoastal(10) then
					print("City "..pCity:GetName().." is coastal, so granting Kronborg Dummy...");
					pCity:SetNumRealBuilding (iKronborgDummy, 1);
					--if pCity:GetNumRealBuilding(iKronborgDummy) > 0 then print("...granted ok"); end
				else
					print("City "..pCity:GetName().." is NOT coastal");
				end
			end
		end
	elseif iBuilding == iBuildingFasil then
		print("Fasil Ghebbi constructed by player "..iPlayer.." in city "..iCity);
		bHasFasil = true
		iPlayerFasil = iPlayer
		local pPlayer = Players[iPlayer]
		if pPlayer then
			local pCity = pPlayer:GetCityByID(iCity)
			if pCity then
				iPlotXFasil = pCity:GetX()
				iPlotYFasil = pCity:GetY()
			end
		end
	elseif iBuilding == iBuildingDrydock then
		print("Drydock constructed by player "..iPlayer.." in city "..iCity);
		--bHasDrydock = true
		iPlayerDrydock = iPlayer
		--[[local pPlayer = Players[iPlayer]
		if pPlayer then
			local pCity = pPlayer:GetCityByID(iCity)
			if pCity then
				iPlotXDrydock = pCity:GetX()
				iPlotYDrydock = pCity:GetY()
			end
		end]]
	end
end
GameEvents.CityConstructed.Add(OnCityConstructed)

--------------------------------------------
-- Kronborg: check if wonder conquered by another player
--------------------------------------------
function OnCityCaptureComplete (iOldOwner, bIsCapital, iX, iY, iNewOwner, iPop, bConquest)
	if bHasKronborg then
		local pPlot = Map.GetPlot(iX, iY)
		local pConqCity = pPlot:GetPlotCity()
		if iPlotXKronborg == iX and iPlotYKronborg == iY then
			local pOldOwner = Players[iOldOwner]
			for pCity in pOldOwner:Cities() do
				if pCity:IsCoastal(10) then
					pCity:SetNumRealBuilding (iKronborgDummy, 0)
				end
			end
			local pNewOwner = Players[iNewOwner]
			iPlayerKronborg = iNewOwner
			for pCity in pNewOwner:Cities() do
				if pCity:IsCoastal(10) then
					pCity:SetNumRealBuilding (iKronborgDummy, 1)
				end
			end
		else
			if iNewOwner == iPlayerKronborg and pConqCity:IsCoastal(10) then
				pConqCity:SetNumRealBuilding (iKronborgDummy, 1)
			end
		end
	end
end
GameEvents.CityCaptureComplete.Add(OnCityCaptureComplete) -- note that city ID changes when a city changes owners

--------------------------------------------
-- Kronborg: check if new city has effects
--------------------------------------------
function OnPlayerCityFounded (iPlayer, iX, iY)
	if bHasKronborg then
		if iPlayer == iPlayerKronborg then
			local pPlot = Map.GetPlot(iX, iY)
			local pCity = pPlot:GetPlotCity()
			if pCity:IsCoastal(10) then
				pCity:SetNumRealBuilding (iKronborgDummy, 1)
			end
		end
	end
end
GameEvents.PlayerCityFounded.Add(OnPlayerCityFounded)

print("Finished loading VPEE_Functions.lua from VP-EE mod");