-- Event Manager
-- Author: Tekamthi, FiresForever
-- DateCreated: 27/08/2012
--------------------------------------------------------------

include( "TreeGrowth.lua" );

local iFirePromo = GameInfoTypes.PROMOTION_WILDFIRE;
local iSmokePromo = GameInfoTypes.PROMOTION_SMOKE;
local tForestImprovement = GameInfoTypes.IMPROVEMENT_YOUNG_FOREST;
local tJungleImprovement = GameInfoTypes.IMPROVEMENT_TROPICAL_VEG;
local tFireImprovement = GameInfoTypes.IMPROVEMENT_WILDFIRE;
local tSmokeImprovement = GameInfoTypes.IMPROVEMENT_SMOKE;
local tBurntImprovement = GameInfoTypes.IMPROVEMENT_BURNT;
local tLumbermillImprovement = GameInfoTypes.IMPROVEMENT_LUMBERMILL;
local iBurntBuild = GameInfoTypes.BUILD_BURNT;

function TreeGrowth_Events(iPlayer)
	local iTurn = Game.GetGameTurn();
	local iNumPlayers = Game.CountCivPlayersEverAlive() - PreGame.GetNumMinorCivs() - 1;
	if (iPlayer == math.fmod(iTurn, iNumPlayers)) then
		print ("Start TG Events")
		-- Lets run the plot based events
		plotEvents()
	end
end

GameEvents.PlayerDoTurn.Add(TreeGrowth_Events);

GameEvents.UnitCanPillage.Add(function(iUnitOwner, iUnit, iImprovement, iRoute)
	if (iImprovement == tForestImprovement) or (iImprovement == tJungleImprovement) or (iImprovement == tFireImprovement) or (iImprovement == tSmokeImprovement) or (iImprovement == tBurntImprovement) then
		return false;
	end
	return true;
end)


local bForestFirePillageEventActivated = false;
local iForestFirePillagePlayer = -1;

GameEvents.CityEventChoiceActivated.Add(function(iPlayer, iCityID, iChoice)
	if (iChoice == GameInfoTypes.CITY_EVENT_FIREFIRE_CHOICE_1) and doesForestFireEventSpawnsWildfire() then
		local pFirePlayer = Players[iPlayer];
		local cFireCity = pFirePlayer:GetCityByID(iCityID);
		local ForestJunglePlots = {};
		for i = 0, cFireCity:GetNumCityPlots()-1, 1 do
			local pLoopPlot = cFireCity:GetCityIndexPlot(i);
			--if we're allowed to burn pillaged improvements, lets check if there is at least one lumbermill that will be pillaged by the event
			if (pLoopPlot:GetImprovementType() == tLumbermillImprovement) and allowFireOnPillagedWorkerForestJungleImprovements() then
				bForestFirePillageEventActivated = true;
				iForestFirePillagePlayer = iPlayer;
			--if the plot isn't a lumbermill and it can burn, lets save it for later
			elseif canBurn(pLoopPlot) then
				table.insert(ForestJunglePlots, pLoopPlot);
			end
		end
		--if there are no lumbermills (or we're not allowed to burn them) but there are other plots that can burn, lets set one on fire
		if not bForestFirePillageEventActivated and #ForestJunglePlots > 0 then
			setBurnPlot(ForestJunglePlots[Map.Rand(#ForestJunglePlots, "TreeGrowth - Randomized choice of plot for fire spawn in forest fire event") + 1]);
		end
	end
end)

GameEvents.TileImprovementChanged.Add(function(iPlotX, iPlotY, iPlotOwner, iOldImprovement, iNewImprovement, bPillaged)
	--an improvement has changed, is the fire event activated?
	if bForestFirePillageEventActivated then
		--does this plot belong to the fire event player?
		if (iForestFirePillagePlayer == iPlotOwner) then
			-- lets make a boolean that returns true if the old and new improvement is lumbermill
			local bMill = (iOldImprovement == tLumbermillImprovement) and (iNewImprovement == tLumbermillImprovement);
			--if its a lumbermill and its pillaged, lets check if we can burn it
			if bMill and bPillaged then
				local pImprovementPlot = Map.GetPlot(iPlotX, iPlotY);
				--if it can burn, set it on fire and turn off the event boolean
				if canBurn(pImprovementPlot) then
					setBurnPlot(pImprovementPlot);
					bForestFirePillageEventActivated = false;
					iForestFirePillagePlayer = -1;
				end
			--if its not a mill or its not pillaged, something must have gone wrong with the event triggers, lets turn off the event flag
			else
				bForestFirePillageEventActivated = false;
				iForestFirePillagePlayer = -1;
			end
		--if this plot doesn't belong to the event player, something must have gone wrong so lets turn off the event boolean
		else
			bForestFirePillageEventActivated = false;
			iForestFirePillagePlayer = -1;
		end
	elseif (iOldImprovement == tFireImprovement) then
		removeTGpromos(Map.GetPlot(iPlotX, iPlotY), iFirePromo);
	elseif (iOldImprovement == tSmokeImprovement) then
		removeTGpromos(Map.GetPlot(iPlotX, iPlotY), iSmokePromo);
	end
end)

GameEvents.PlayerBuilt.Add(function(iPlayer, iUnit, iX, iY, iBuild) 
	if (iBuild == iBurntBuild) then
		local pPlot = Map.GetPlot(iX, iY);
		setBurntPlot(pPlot, false);
		removeTGpromos(pPlot, iFirePromo);
		Players[iPlayer]:GetUnitByID(iUnit):SetDamage(99);
	end
end)

function TGbuildBlocker(iPlayer, iUnit, iPlotX, iPlotY, iBuild)
	--print("checking for burn/burnt to block build");
	local pPlot = Map.GetPlot(iPlotX, iPlotY);
	if iBuild ~= iBurntBuild and (pPlot:HasImprovement(tFireImprovement) or pPlot:HasImprovement(tBurntImprovement)) then
		return false;
	else
		return true;
	end
end

GameEvents.PlayerCanBuild.Add(TGbuildBlocker);

function TGcityBlocker(iPlayer, iPlotX, iPlotY)
	local pPlot = Map.GetPlot(iPlotX, iPlotY);
	if (pPlot == nil) then
		return
	elseif pPlot:HasImprovement(tFireImprovement) then
		return false;
	else
		return true;
	end
end

GameEvents.PlayerCanFoundCity.Add(TGcityBlocker);