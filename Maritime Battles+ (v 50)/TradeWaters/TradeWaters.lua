--variables

local iLH = GameInfoTypes.IMPROVEMENT_LIGHTHOUSE;
local iLHbuild = GameInfoTypes.BUILD_LIGHTHOUSE;
local sLHbuildingClass = 'BUILDINGCLASS_LIGHTHOUSE';
local iGLH = GameInfoTypes.BUILDING_GREAT_LIGHTHOUSE;
local iLHbuildingClass = GameInfoTypes.BUILDINGCLASS_LIGHTHOUSE;
local iMaritimeSchool = GameInfoTypes.BUILDING_MARITIME_SCHOOL;
local iTWlandPreCombatPromo = GameInfoTypes.PROMOTION_SAFE_WATERS;
local iTWlandPostCombatPromo = GameInfoTypes.PROMOTION_UNSAFE_WATERS;
local iTWnavalPreCombatPromo = GameInfoTypes.PROMOTION_SAFE_WATERS_NAVAL;
local iTWnavalPostCombatPromo = GameInfoTypes.PROMOTION_UNSAFE_WATERS_NAVAL;
local iTWdmgPropPromo = GameInfoTypes.PROMOTION_DAMAGED_PROP;
local iNoFeature = FeatureTypes.NO_FEATURE;

local cargoUnitCombat = GameInfoTypes.UNITCOMBAT_CARGO;
local iHarbor = GameInfoTypes.IMPROVEMENT_HARBOR;
local iHarborBuild = GameInfoTypes.BUILD_HARBOR;
local iFeatureAtoll = GameInfoTypes.FEATURE_ATOLL;
local iFeatureSafeWaters = GameInfoTypes.FEATURE_SAFE_WATERS;
local iFishingBoats = GameInfoTypes.IMPROVEMENT_FISHING_BOATS;

local tTRwaters = {};
local tDiscoveredWaters = {};
local tLastTRwaters = {};
local iTWwaterCount = 0;

--event hooks
GameEvents.PlayerCanBuild.Add(function(iPlayer, iUnit, iPlotX, iPlotY, iBuild)
	if iBuild == iLHbuild then
		local pPlot = Map.GetPlot(iPlotX, iPlotY);
		if pPlot and pPlot:IsLake() then
			return false;
		end
	end
	return true;
end);

GameEvents.CityCanConstruct.Add(function(iPlayer, iCity, iBuildingType)
	return (iBuildingType ~= iMaritimeSchool) or CanBuildMaritimeSchool(iPlayer);
end);

GameEvents.UnitSetXY.Add(function(iPlayer, iUnitID, iX, iY)
	local pPlayer = Players[iPlayer];
	if not pPlayer then return end
	local uUnit = pPlayer:GetUnitByID(iUnitID);
	if not uUnit then return
	elseif uUnit:GetUnitCombatType() == cargoUnitCombat then
		local pPlot = Map.GetPlot(iX, iY);
		if not pPlot then return end
		local iPlotIndex = pPlot:GetPlotIndex();
		if not tTRwaters[iPlayer][iPlotIndex] then
			table.insert(tTRwaters[iPlayer], iPlotIndex, pPlot);
		end
		local iTRindex = uUnit:GetTradeRouteIndex();
		if iTRindex and iTRindex > -1 then
			local iTRdestinationPlayer = Game.GetTradeRoute(iTRindex).ToID;
			if iTRdestinationPlayer and iTRdestinationPlayer ~= iPlayer then
				if not tTRwaters[iTRdestinationPlayer][iPlotIndex] then
					table.insert(tTRwaters[iTRdestinationPlayer], iPlotIndex, pPlot);
				end
			end
		end
		if pPlot:IsAdjacentToImprovement(iHarbor) then
		else
			for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
				local pAdjacentPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), direction);
				if pAdjacentPlot:HasImprovement(iHarbor) or pAdjacentPlot:IsAdjacentToImprovement(iHarbor) then
				elseif pAdjacentPlot:IsWater() and pAdjacentPlot:CanBuild(iHarborBuild) then
					if pAdjacentPlot:IsOwned() or pAdjacentPlot:IsAdjacentOwned() then
					else
						pAdjacentPlot:ChangeBuildProgress(iHarborBuild, 1, pPlayer:GetTeam());
						break;
					end
				end
			end
		end
	end
end)

GameEvents.TileRevealed.Add(function(iX, iY, iTeam, iFromTeam, bFirst, iUnitOwner, iUnit)
	local pPlot = Map.GetPlot(iX, iY);
	if not pPlot then
	elseif pPlot:IsWater() then
		tDiscoveredWaters[iTeam] = tDiscoveredWaters[iTeam] + 1;
	end
end)

GameEvents.TileImprovementChanged.Add(function(iPlotX, iPlotY, iPlotOwner, iOldImprovement, iNewImprovement, bPillaged)
	local plot = Map.GetPlot(iPlotX, iPlotY);
	if not plot then return end
	if iNewImprovement == iLH or iNewImprovement == iHarbor then
		if not bPillaged then
			LighthouseBuilt(plot);
		else
			LighthouseDestroyed(plot);
		end
	elseif iOldImprovement == iLH or iOldImprovement == iHarbor then
		LighthouseDestroyed(plot);
		if iOldImprovement == iHarbor then
			plot:SetOwner(-1, -1, false, false);
		end
	elseif plot:IsWater() then
		if iNewImprovement == -1 or bPillaged then
			TWremover(plot);
		else
			TWadder(plot);
		end
	end
	if bPillaged then
		for i = 0, plot:GetNumUnits() - 1 do
			local uUnit = plot:GetUnit(i);
			if uUnit then
				if uUnit:IsHasPromotion(iTWnavalPostCombatPromo) or uUnit:IsHasPromotion(iTWnavalPreCombatPromo) then
					uUnit:SetHasPromotion(iTWnavalPreCombatPromo, false)
					uUnit:SetHasPromotion(iTWnavalPostCombatPromo, false)
					uUnit:SetHasPromotion(iTWnavalPostCombatPromo, true)
				elseif uUnit:IsHasPromotion(iTWlandPostCombatPromo) or uUnit:IsHasPromotion(iTWlandPreCombatPromo) then
					uUnit:SetHasPromotion(iTWlandPreCombatPromo, false)
					uUnit:SetHasPromotion(iTWlandPostCombatPromo, false)
					uUnit:SetHasPromotion(iTWlandPostCombatPromo, true)
				end
			end
		end
	end
end)

GameEvents.TileFeatureChanged.Add(function(iPlotX, iPlotY, iPlotOwner, iOldFeature, iNewFeature)
	if iNewFeature ~= iNoFeature then return end
	local plot = Map.GetPlot(iPlotX, iPlotY);
	if plot == nil then return end
	if plot:IsCity() then return end
	if plot:IsAdjacentToImprovement(iHarbor) or plot:IsAdjacentToImprovement(iLH) then
		TWadder(plot);
	end
end)

GameEvents.CityCaptureComplete.Add(function(iOldOwner, bCapital, iPlotX, iPlotY, iNewOwner, iOldPop, bConquest)
	local pPlot = Map.GetPlot(iPlotX, iPlotY);
	if pPlot == nil then return end
	local cCity = pPlot:GetPlotCity();
	if cCity == nil then return end
	if not cCity:IsHasBuildingClass(iLHbuildingClass) then
		LighthouseDestroyed(pPlot);
	end
end)

GameEvents.CityConstructed.Add(function(playerID, cityID, buildingType, bIncludeGold, bIncludeFaithOrCulture)
	local constructPlayer = Players[playerID];
	if buildingType == constructPlayer:GetSpecificBuildingType(sLHbuildingClass) or buildingType == iGLH then
		local ConstructCity = constructPlayer:GetCityByID(cityID);
		local pPlot = Map.GetPlot(ConstructCity:GetX(), ConstructCity:GetY());
		LighthouseBuilt(pPlot);
	end
end)

GameEvents.CitySoldBuilding.Add(function(playerID, cityID, eBuilding)
	local salePlayer = Players[playerID];
	if eBuilding == salePlayer:GetSpecificBuildingType(sLHbuildingClass) then
		local SoldCity = salePlayer:GetCityByID(cityID);
		local pPlot = Map.GetPlot(SoldCity:GetX(), SoldCity:GetY());
		LighthouseDestroyed(pPlot);
	end
end)

GameEvents.CityRazed.Add(function(iCityOwner, iPlotX, iPlotY)
	LighthouseDestroyed(Map.GetPlot(iPlotX, iPlotY));
end)

GameEvents.TileOwnershipChanged.Add(function(iPlotX, iPlotY, iNewOwner, iOldOwner)
	local pPlot = Map.GetPlot(iPlotX, iPlotY);
	if not pPlot then return end
	local iHarborProgress = pPlot:GetBuildProgress(iHarborBuild);
	if (iHarborProgress > 0) then
		pPlot:ChangeBuildProgress(iHarborBuild, -(iHarborProgress + 1), iNewOwner);
	end
	for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
		local pAdjacentPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), direction);
		if pAdjacentPlot then
			iHarborProgress = pAdjacentPlot:GetBuildProgress(iHarborBuild);
			if (iHarborProgress > 0) then
				pAdjacentPlot:ChangeBuildProgress(iHarborBuild, -(iHarborProgress + 1), iNewOwner);
			end
		end
	end
end)

GameEvents.PlayerDoTurn.Add(function(iPlayer)
	local pPlayer = Players[iPlayer];
	if not pPlayer then return end
	local iTeam = pPlayer:GetTeam();
	--print("Team " .. iTeam .. ": " .. tDiscoveredWaters[iTeam] .. " out of " .. iTWwaterCount .. " water plots discovered");
	local pTeam = Teams[iTeam];
	local bHasOptics = pTeam:IsHasTech(GameInfoTypes.TECH_OPTICS);
	local hasMarSchool = pPlayer:HasBuilding(iMaritimeSchool);
	local iCurrentTurn = Game.GetGameTurn();
	-- print ("Starting MBP promo checks")
	
	for _, TWlastPlot in pairs(tLastTRwaters) do
		if not TWlastPlot then
		elseif TWlastPlot:GetFeatureType() == iFeatureSafeWaters then
			TWlastPlot:SetFeatureType(-1)
		end
	end
	tLastTRwaters = {};
	if hasMarSchool then
		local TWplotTable = tTRwaters[iPlayer];
		tTRwaters[iPlayer] = {};
		for plotIndex, TWplot in pairs(TWplotTable) do
			if TWplotHasTradeRoute(TWplot, pPlayer) then
				table.insert(tTRwaters[iPlayer], TWplot);
				if TWplot:GetFeatureType() == -1 then
					TWplot:SetFeatureType(iFeatureSafeWaters);
					table.insert(tLastTRwaters, TWplot);
				end
			end
		end
	end
	for pUnit in pPlayer:Units() do
		local pUnitDomain = pUnit:GetDomainType();
		
		if bHasOptics then
			if not pPlayer:IsBarbarian() and not pUnit:IsImmobile() then
				local iUnitType = pUnit:GetUnitType();
				if (pUnitDomain == DomainTypes.DOMAIN_SEA) and not (GameInfo.Units[iUnitType].Combat == 0) then
					local bTWnavalPostCombat = pUnit:IsHasPromotion(iTWnavalPostCombatPromo);
					if	(bTWnavalPostCombat and (iCurrentTurn - pUnit:GetTurnPromotionGained(iTWnavalPostCombatPromo) > 1))
					or not (bTWnavalPostCombat or pUnit:IsHasPromotion(iTWnavalPreCombatPromo)) then
						pUnit:SetHasPromotion(iTWnavalPreCombatPromo, true)
						-- print ("Added TWNaval promo x1")
					end
				elseif pUnitDomain == DomainTypes.DOMAIN_HOVER or pUnitDomain == DomainTypes.DOMAIN_AIR then
				elseif not GameInfo.Units[iUnitType].CannotEmbark then
					local bTWlandPostCombat = pUnit:IsHasPromotion(iTWlandPostCombatPromo);
					if (bTWlandPostCombat and (iCurrentTurn - pUnit:GetTurnPromotionGained(iTWlandPostCombatPromo) > 1))
					or not (bTWlandPostCombat or pUnit:IsHasPromotion(iTWlandPreCombatPromo)) then
						pUnit:SetHasPromotion(iTWlandPreCombatPromo, true)
						-- print ("Added TW promo x1")
					end
				end
			end
		end
		if (pUnitDomain == DomainTypes.DOMAIN_SEA) and ((pUnit:GetCurrHitPoints()) <= 33) and not pUnit:IsHasPromotion(iTWdmgPropPromo) then
			pUnit:SetHasPromotion(iTWdmgPropPromo, true)
			pUnit:ChangeMoves(-60)
			-- print ("Added DmgProp promo x1")
		elseif (pUnitDomain == DomainTypes.DOMAIN_SEA) and ((pUnit:GetCurrHitPoints()) > 33) and pUnit:IsHasPromotion(iTWdmgPropPromo) then
			pUnit:SetHasPromotion(iTWdmgPropPromo, false)
			pUnit:ChangeMoves(60)
			-- print ("Removed DmgProp promo x1")
		end
	end
	-- print ("MBP promo checks complete")
end)

GameEvents.CityTrained.Add(function(iCityOwner, iCity, iUnit, bGold, bFaith)
	local pPlayer = Players[ iCityOwner ];
	if not pPlayer then return end
	local uUnit = pPlayer:GetUnitByID( iUnit );
	if not uUnit then return end
	local iTeam = pPlayer:GetTeam();
	local pTeam = Teams[iTeam];
	if not pTeam then return end
	local bHasOptics = pTeam:IsHasTech(GameInfoTypes.TECH_OPTICS);
	if bHasOptics then
		if not uUnit:IsImmobile() then
			local iUnitType = uUnit:GetUnitType();
			local iUnitDomain = uUnit:GetDomainType();
			local cCity = pPlayer:GetCityByID(iCity);
			if (iUnitDomain == DomainTypes.DOMAIN_SEA) and not (GameInfo.Units[iUnitType].Combat == 0) then
				if cCity and cCity:GetDamage() > 0 then
					uUnit:SetHasPromotion(iTWnavalPostCombatPromo, true)
				else
					uUnit:SetHasPromotion(iTWnavalPreCombatPromo, true)
				end
			elseif iUnitDomain == DomainTypes.DOMAIN_HOVER or iUnitDomain == DomainTypes.DOMAIN_AIR then
			elseif not GameInfo.Units[iUnitType].CannotEmbark then
				if cCity and cCity:GetDamage() > 0 then
					uUnit:SetHasPromotion(iTWlandPostCombatPromo, true)
				else
					uUnit:SetHasPromotion(iTWlandPreCombatPromo, true)
				end
			end
		end
	end
end)

--mod functions
function CanBuildMaritimeSchool(iPlayer)
	local pPlayer = Players[iPlayer];
	if not pPlayer then return end
	local iTeam = pPlayer:GetTeam();
	--print(iDiscoveryPercent);
	return ((tDiscoveredWaters[iTeam]/iTWwaterCount) >= 0.8) or (pPlayer:IsMinorCiv());
end

function LighthouseBuilt(plot)
	TWadder(plot);
	for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
		local pAdjacentPlot = Map.PlotDirection(plot:GetX(), plot:GetY(), direction);
		TWadder(pAdjacentPlot);
	end
end

function LighthouseDestroyed(plot)
	TWremover(plot);
	for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
		local pAdjacentPlot = Map.PlotDirection(plot:GetX(), plot:GetY(), direction);
		TWremover(pAdjacentPlot);
	end
end

function TWadder(plot)
	if plot:IsWater() and (plot:GetFeatureType() == iNoFeature) then
		plot:SetFeatureType(iFeatureSafeWaters);
	end
end

function TWremover(plot)
	if (plot:GetFeatureType() == iFeatureSafeWaters) and ((plot:GetImprovementType() == -1) or plot:IsImprovementPillaged()) and not TWisPlotAdjacentValid(plot) then
		plot:SetFeatureType(iNoFeature, -1);
	end
end

function TWisPlotAdjacentValid(plot)
	return (plot:IsAdjacentToImprovement(iLH) or plot:IsAdjacentToImprovement(iHarbor) or TWisAdjacentCityLighthouse(plot));
end

function TWisAdjacentCityLighthouse(plot)
	for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
		local pAdjacentPlot = Map.PlotDirection(plot:GetX(), plot:GetY(), direction);
		if pAdjacentPlot:IsCity() then
			local cCity = pAdjacentPlot:GetPlotCity();
			if cCity:IsHasBuildingClass(iLHbuildingClass) then
				return true;
			end
		end
	end
	return false;
end

function TWplotHasTradeRoute(pPlot, pPlayer)
	return (#pPlayer:GetInternationalTradeRoutePlotToolTip(pPlot) > 0)
end

function TWallPlotsCheck()
	for iPlayer = 0, GameDefines.MAX_PLAYERS-1, 1 do
		local player = Players[iPlayer];
		if player ~= nil then
			tTRwaters[iPlayer] = {};
			tDiscoveredWaters[player:GetTeam()] = 0;
		end
	end
	for i = 0, Map.GetNumPlots()-1, 1 do
		local plot = Map.GetPlotByIndex(i);
		if not plot then
		elseif plot:IsWater() then
			iTWwaterCount = iTWwaterCount + 1;
			if plot:GetFeatureType() == iFeatureSafeWaters and not (TWisPlotAdjacentValid(plot) or (plot:GetImprovementType() > -1 and not plot:IsImprovementPillaged())) then
				table.insert(tLastTRwaters, plot);
			end
			for iPlayer = 0, GameDefines.MAX_CIV_PLAYERS-1, 1 do
				local player = Players[iPlayer];
				if player ~= nil then
					if TWplotHasTradeRoute(plot, player) then
						table.insert(tTRwaters[iPlayer], plot:GetPlotIndex(), plot)
					end
					local iTeam = player:GetTeam();
					if plot:IsVisible(iTeam) then
						tDiscoveredWaters[iTeam] = tDiscoveredWaters[iTeam] + 1;
					end
				end
			end
		end
	end
	print(iTWwaterCount .. " water tiles found");
end
TWallPlotsCheck();