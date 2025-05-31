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
-- Drydock
-- New ability:
--		Any navals docked within the city border at a start of a turn gets additional bonuses.
--		It only works if the city or the plot is not blockaded.
--------------------------------------------

function EE_Drydock(iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlayer and pPlayer:IsAlive() and iPlayer == iPlayerDrydock then
		--print("EE_Drydock: Check for Player	-", pPlayer:GetCivilizationShortDescription());
		for pCity in pPlayer:Cities() do
			if pCity and pCity:IsHasBuildingClass(iBuildingClassDrydock) then
				local iCityArea = pCity:GetNumCityPlots() - 1
				--print("EE_Drydock: This City has Drydock	-", pCity:GetName(), "- X: " .. pCity:GetX() .. " - Y: " .. pCity:GetY());
				for iCityPlotIndex = 0, iCityArea do
					local pCityPlot = pCity:GetCityIndexPlot(iCityPlotIndex);
					if pCityPlot and pCityPlot:GetOwner() == iPlayer then
						--print("EE_Drydock: Look for units on city plot	-", pCity:GetName(), "-	X: " .. pCityPlot:GetX() .. " - Y: " .. pCityPlot:GetY());
						for pUnit in pPlayer:Units() do
							if pUnit and pUnit:GetDomainType() == DomainTypes.DOMAIN_SEA and pUnit:IsCombatUnit() then
								if pUnit:GetPlot() == pCityPlot then
									--local iUnitMoves = pUnit:GetMoves();
									--print("EE_Drydock: Naval Unit on city plot chosen	-", pUnit:GetName(), "- X: " .. pCityPlot:GetX() .. " - Y: " .. pCityPlot:GetY());
									if (not pCity:IsBlockadedTest()) then
										--print("EE_Drydock: Naval Unit is INSIDE the city border	-", pUnit:GetName(), "- X: " .. pUnit:GetX() .. " - Y: " .. pUnit:GetY());
										-- The promotion only lasts 2 turns, but it needs to reset if the unit is still in the plot
										-- The only way to do it is to set this to false, and then to true again
										pUnit:SetHasPromotion(iPromotionDrydock, false);
										pUnit:SetHasPromotion(iPromotionDrydock, true);
										--pUnit:SetMoves(iUnitMoves + 60); -- 60 is +1 Movement point somehow
									elseif (not pCity:IsBlockadedTest()) and pCity:IsPlotBlockaded(pCityPlot) then
										--print("EE_Drydock: Naval Unit is INSIDE the city border, but the plot is blockaded	-", pUnit:GetName(), "- X: " .. pUnit:GetX() .. " - Y: " .. pUnit:GetY());
										pUnit:SetHasPromotion(iPromotionDrydock, false);
									elseif pCity:IsBlockadedTest() then
										--print("EE_Drydock: Naval Unit is INSIDE the city border, but the city is blockaded	-", pUnit:GetName(), "- X: " .. pUnit:GetX() .. " - Y: " .. pUnit:GetY());
										pUnit:SetHasPromotion(iPromotionDrydock, false);
									end
								end
							end
						end
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoneTurn.Add(EE_Drydock)

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
-- Versailles: Extends WLTKD duration by 50%
--------------------------------------------
function EE_Versailles(iPlayer, iPlotX, iPlotY, iChange)
	local pPlayer = Players[iPlayer]
	if pPlayer:IsAlive() and pPlayer:CountNumBuildings(iBuildingVersailles) > 0 then
		local pPlot = Map.GetPlot(iPlotX, iPlotY)
		if pPlot then
			local pCity = pPlot:GetPlotCity()
			if pCity then
				local iWLTKDTurns = pCity:GetWeLoveTheKingDayCounter() + (iChange * 50 / 100) -- the hook is called after the game has already increased the WLTKD turns in the city
				pCity:SetWeLoveTheKingDayCounter(iWLTKDTurns) -- DO NOT use pCity:ChangeWeLoveTheKingDayCounter as it will call the hook again, resulting in an infinite loop
			end
		end
	end
end
GameEvents.CityBeginsWLTKD.Add(EE_Versailles) -- city starts celebrating WLTKD
GameEvents.CityExtendsWLTKD.Add(EE_Versailles) -- city already celebrating WLTKD, which then gets extended

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