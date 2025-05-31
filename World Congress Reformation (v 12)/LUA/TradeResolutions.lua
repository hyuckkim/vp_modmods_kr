--[[local iDomainWater = GameInfoTypes.DOMAIN_SEA
local iDomainLand = GameInfoTypes.DOMAIN_LAND
local WaterResolution = GameInfoTypes.RESOLUTION_INTERNATIONAL_WATER_TRADE
local LandResolution = GameInfoTypes.RESOLUTION_CLOSED_BORDERS

function TerritorialWaterTrade(iFromPlayer, iFromCity, iToPlayer, iToCity, iDomain, iConnectionType)
	if (iFromPlayer ~= iToPlayer and iDomain == iDomainWater) then
		print("Cannot trade here boy.")
		return false
	end
	return true
end

function TerritorialLandTrade(iFromPlayer, iFromCity, iToPlayer, iToCity, iDomain, iConnectionType)
	if (iFromPlayer ~= iToPlayer and iDomain == iDomainLand) then
		print("Cannot trade here boy.")
		return false
	end
	return true
end


function ResolutionPassed(iResolution, iChoice, bEnact, bPassed)
	if WaterResolution then
		if bEnact and bPassed then
			GameEvents.PlayerCanCreateTradeRoute.Add(TerritorialWaterTrade)
			print("Adding in the Territorial Water Trade function.")
		end
		if not bEnact and bPassed then
			GameEvents.PlayerCanCreateTradeRoute.Remove(TerritorialWaterTrade)
			print("Removing the Territorial Water Trade function.")
		end
	end
	if LandResolution then
		if bEnact and bPassed then
			GameEvents.PlayerCanCreateTradeRoute.Add(TerritorialLandTrade)
			print("Adding in the Territorial Land Trade function.")
		end
		if not bEnact and bPassed then
			GameEvents.PlayerCanCreateTradeRoute.Remove(TerritorialLandTrade)
			print("Removing the Territorial Land Trade function.")
		end
	end
	if MerchantInsurance then
		if bEnact and bPassed then
			GameEvents.PlayerPlunderedTradeRoute.Add(MerchantInsurance)
			print("Adding in the Merchant Insurance function.")
		end
		if not bEnact and bPassed then
			GameEvents.PlayerPlunderedTradeRoute.Remove(MerchantInsurance)
			print("Removing the Merchant Insurance function.")
		end
	end
end

function MerchantInsurance(iPlayer, iUnit, iPlunderedGold, iFromPlayer, iFromCity, iToPlayer, iToCity, iRouteType, iRouteDomain)
	local GoldReceived = iPlunderedGold*0.75
	if GoldReceived == 0 or GoldReceived == 0 then
		GoldReceived = Game.GetTurn()+25
	end
	if GoldReceived > 300 then
		GoldReceived = 300
	end
	print("The owner got" .. GoldReceived)
	iFromPlayer:ChangeGold(GoldReceived)
end
--   GameEvents.PlayerCanSpreadReligion.Add(function(iPlayer, iUnit, iPlotX, iPlotY) return true end) -->
--   GameEvents.PlayerCanRemoveHeresy.Add(function(iPlayer, iUnit, iPlotX, iPlotY) return true end) -->
--   GameEvents.CityTrained.Add(function(iPlayer, iCity, iUnit, bGold, bFaith) end) -->
--   GameEvents.CityConstructed.Add(function(iPlayer, iCity, iBuilding, bGold, bFaith) end) -->
--   GameEvents.CityCreated.Add(function(iPlayer, iCity, iProject, bGold, bFaith) end) -->
--   GameEvents.CityPrepared.Add(function(iPlayer, iCity, iSpecialist, bGold, bFaith) end) (v33) -->
--   GameEvents.CitySoldBuilding.Add(function(iPlayer, iCity, iBuilding) end) -->
--   GameEvents.PlayerCanFoundCity.Add(function(iPlayer, iPlotX, iPlotY) return true end) -->
GameEvents.ResolutionResult.Add(ResolutionPassed)]]