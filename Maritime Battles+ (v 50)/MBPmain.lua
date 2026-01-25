function HasTradeRoute(pPlot, pPlayer)
	return (#pPlayer:GetInternationalTradeRoutePlotToolTip(pPlot) > 0)
end

function MBPwaterCounter()
	for i = 0, Map.GetNumPlots()-1, 1 do
		local pPlot = Map.GetPlotByIndex(i);
		if plot:IsTerrainOcean() then
			local iLatitude = pPlot.GetY();
			if iLatitude < iCancer and iLatitude > iCapricorn then
				table.insert(MBPtropicOcean, plot)
			else
				table.insert(MBPocean, plot);
			end
		elseif plot:IsTerrainCoast() then
			table.insert(MBPcoast, plot);
		end
		local plotFeature = plot:GetFeatureType();
		if ((plotFeature == tWeatherFeature) or (plotFeature == tWeatherFeatureCoast)) then
			table.insert(MBPstorms, plot);
		end
	end
	MBPinit = true;
end



--[[
Events.SequenceGameInitComplete.Add(function()
	if Game.GetGameTurn() > Game.GetStartTurn() then return end
	for i = 0, Map.GetNumPlots()-1, 1 do
		local plot = Map.GetPlotByIndex(i);
		if plot:GetFeatureType() == GameInfoTypes.FEATURE_SHALLOW_ROCKS then
			return;
		end
	end
	for i = 0, Map.GetNumPlots()-1, 1 do
		local plot = Map.GetPlotByIndex(i);
		if plot:IsTerrainCoast() and plot:GetFeatureType() == FeatureTypes.NO_FEATURE and plot:GetNumResource() < 1 and Map.Rand(15, "shoal spawn roll") == 1 then
			plot:SetFeatureType(GameInfoTypes.FEATURE_SHALLOW_ROCKS);
		end
	end
end)
]]--

function MBPTurnStart(iPlayer)
	local pPlayer = Players[iPlayer];
	local pTeam = Teams[pPlayer:GetTeam()];
	local iTurn = Game.GetGameTurn();
	local iNumPlayers = Game.CountCivPlayersEverAlive() - PreGame.GetNumMinorCivs() - 1;

	if not MBPinit then
		MBPwaterCounter();
	end

	if iTurn == 0 and iPlayer == 1 then
		MBPsummer();
	elseif iPlayer == math.fmod(iTurn, iNumPlayers) then
		local MBPseason = math.fmod(iTurn, 4);
		if MBPseason == 0 then
			MBPsummer();
		else
			MBPfallWinter();
		end
	end
	
	local bHasOptics = pTeam:IsHasTech(GameInfoTypes.TECH_OPTICS);
	-- local bHasAstro = pTeam:IsHasTech(GameInfoTypes.TECH_ASTRONOMY);
	-- print ("Starting MBP promo checks")
	for pUnit in pPlayer:Units() do
		local pUnitDomain = pUnit:GetDomainType();
		
		if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_TREASURE_FLEET) and pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_TREASURE_FLEET_VISION) then
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_TREASURE_FLEET_VISION, false);
			pUnit:ChangeMoves(60);
			-- print ("removed TF vision promo x1");
		elseif pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_TREASURE_FLEET_VISION) then
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_TREASURE_FLEET, true);
			pUnit:SetMoves(pUnit:MaxMoves());
			-- print ("added TF promo x1");
		end

		if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_MAGELLAN_VISION) and pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_MAGELLAN) then
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_MAGELLAN_VISION, false);
			pUnit:ChangeMoves(60);
			-- print ("removed Mag vision Promo x1");
		elseif pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_MAGELLAN_VISION) then
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_MAGELLAN, true);
			pUnit:SetMoves(pUnit:MaxMoves());
			-- print ("added Mag promo x1");
		end

		if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_GREAT_LIGHTHOUSE_VISION) and pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_GREAT_LIGHTHOUSE) then
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_GREAT_LIGHTHOUSE_VISION, false);
			pUnit:ChangeMoves(60);
			-- print ("removed GL vision Promo x1");
		elseif pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_GREAT_LIGHTHOUSE_VISION) then
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_GREAT_LIGHTHOUSE, true);
			pUnit:SetMoves(pUnit:MaxMoves());
			-- print ("added GL Promo x1");
		end

		local hasMarSchool = pPlayer:HasBuilding(GameInfoTypes.BUILDING_MARITIME_SCHOOL);

		if hasMarSchool then
			if (pUnitDomain == DomainTypes.DOMAIN_SEA) then
				if not pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNSAFE_WATERS_NAVAL) and not pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_OCEAN_NAVIGATION) then
					pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_OCEAN_NAVIGATION, true)
					-- print ("Added MAnaval promo x1")
				end
			--[[elseif pUnitDomain == DomainTypes.DOMAIN_HOVER or pUnitDomain == DomainTypes.DOMAIN_AIR then
			elseif GameInfo.Units[pUnit:GetUnitType()].CannotEmbark == 0 then
				if not pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_MARITIME_NAVIGATION) and not pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNSAFE_WATERS) and not pUnit:IsImmobile() then
					pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_MARITIME_NAVIGATION, true)
					-- print ("Added MA promo x1")
				end]]--
			end
		end
		
		if bHasOptics then
			if pPlayer:IsMinorCiv() then
				if pUnitDomain == DomainTypes.DOMAIN_HOVER or pUnitDomain == DomainTypes.DOMAIN_AIR then
				elseif not hasMarSchool and not pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_COASTAL_NAVIGATION) and not pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNSAFE_WATERS_NAVAL) and not pUnit:IsImmobile() then
					pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_COASTAL_NAVIGATION, true)
					-- print ("Added TWminor promo x1")
				end
			elseif not pPlayer:IsBarbarian() then
				if (pUnitDomain == DomainTypes.DOMAIN_SEA) and not (GameInfo.Units[pUnit:GetUnitType()].Combat == 0) then
					if not hasMarSchool and not pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_SAFE_WATERS_NAVAL) and not pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNSAFE_WATERS_NAVAL) and not pUnit:IsImmobile() then
						pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_SAFE_WATERS_NAVAL, true)
						-- print ("Added TWNaval promo x1")
					end
				elseif pUnitDomain == DomainTypes.DOMAIN_HOVER or pUnitDomain == DomainTypes.DOMAIN_AIR then
				elseif GameInfo.Units[pUnit:GetUnitType()].CannotEmbark == 0 then
					if not pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_SAFE_WATERS) and not pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UNSAFE_WATERS) and not pUnit:IsImmobile() then
						pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_SAFE_WATERS, true)
						-- print ("Added TW promo x1")
					end
				end
			end
		end
		if (pUnitDomain == DomainTypes.DOMAIN_SEA) and ((pUnit:GetCurrHitPoints()) <= 50) and not pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_DAMAGED_PROP) then
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_DAMAGED_PROP, true)
			pUnit:ChangeMoves(-60)
			-- print ("Added DmgProp promo x1")
		elseif (pUnitDomain == DomainTypes.DOMAIN_SEA) and ((pUnit:GetCurrHitPoints()) > 50) and pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_DAMAGED_PROP) then
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_DAMAGED_PROP, false)
			pUnit:ChangeMoves(60)
			-- print ("Removed DmgProp promo x1")
		end
		--[[
		if not bHasAstro then
			if pUnitDomain == DomainTypes.DOMAIN_LAND and not pUnit:CanCrossOceans() and not pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_NO_EARLY_OCEAN) then
				pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_NO_EARLY_OCEAN, true);
			end
		elseif pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_NO_EARLY_OCEAN) then
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_NO_EARLY_OCEAN, false);
		end
		]]--
	end
	-- print ("MBP promo checks complete")
end

GameEvents.PlayerDoTurn.Add(MBPTurnStart)

function GetCivSpecificUnit(pPlayer, sUnitClass)
  local sUnitType = nil
  local sCivType = GameInfo.Civilizations[pPlayer:GetCivilizationType()].Type

  for pOverride in GameInfo.Civilization_UnitClassOverrides{CivilizationType = sCivType, UnitClassType = sUnitClass} do
    sUnitType = pOverride.UnitType
    break
  end

  if (sUnitType == nil) then
    sUnitType = GameInfo.UnitClasses[sUnitClass].DefaultUnit
  end

  return sUnitType
end

