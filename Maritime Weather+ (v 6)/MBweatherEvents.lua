include( "MBweather.lua" );

local iStormUpdateFrequency = MBPgetStormUpdateFrequency();
local tStormImprovement = GameInfoTypes.IMPROVEMENT_STORM;
local tWeatherFeature = GameInfoTypes.FEATURE_RESTRICTED_VISIBILITY;

GameEvents.UnitCanPillage.Add(function(iUnitOwner, iUnit, iImprovement, iRoute)
	if iImprovement == tStormImprovement then
		return false;
	end
	return true;
end)

function MBPstormFix(iPlayer)
	--print("MBPstormFixer activated");
	local pPlayer = Players[iPlayer];
	local tTeam = Teams[pPlayer:GetTeam()];
	if not tTeam:IsHasTech(GameInfoTypes.TECH_ASTRONOMY) and not pPlayer:IsBarbarian() then
		--print("MBPstormFixer: pre-astro player found");
		local adjDirections = {DirectionTypes.DIRECTION_NORTHEAST, DirectionTypes.DIRECTION_EAST, DirectionTypes.DIRECTION_SOUTHEAST, DirectionTypes.DIRECTION_SOUTHWEST, DirectionTypes.DIRECTION_WEST, DirectionTypes.DIRECTION_NORTHWEST};
		local pCapitalPlot = pPlayer:GetOriginalCapitalPlot();
		local iCapitalX = pCapitalPlot:GetX();
		local iCapitalY = pCapitalPlot:GetY();
		for uUnit in pPlayer:Units() do
			if uUnit:IsEmbarked() and uUnit:IsOnTerrain(TerrainTypes.TERRAIN_OCEAN) and uUnit:IsOnFeature(tWeatherFeature) and not (uUnit:CanCrossOceans() or pPlayer:HasTrait(GameInfoTypes.TRAIT_WAYFINDING)) then
				print("MBPstormFixer: invalid ocean unit found");
				while uUnit:IsOnTerrain(TerrainTypes.TERRAIN_OCEAN) do
					local pPlot = uUnit:GetPlot();
					local oceanMovePlot = nil;
					local coastMovePlot = nil;
					for loop, direction in ipairs(adjDirections) do
						local adjPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), direction);
						if adjPlot:IsTerrainCoast() then
							if coastMovePlot == nil then
								coastMovePlot = adjPlot;
							elseif Map.PlotDistance(adjPlot:GetX(), adjPlot:GetY(), iCapitalX, iCapitalY) < Map.PlotDistance(coastMovePlot:GetX(), coastMovePlot:GetY(), iCapitalX, iCapitalY) then
								coastMovePlot = adjPlot;
							end
						elseif adjPlot:IsTerrainOcean() then
							if oceanMovePlot == nil then
								oceanMovePlot = adjPlot;
							elseif Map.PlotDistance(adjPlot:GetX(), adjPlot:GetY(), iCapitalX, iCapitalY) < Map.PlotDistance(oceanMovePlot:GetX(), oceanMovePlot:GetY(), iCapitalX, iCapitalY) then
								oceanMovePlot = adjPlot;
							end
						end
					end
					if coastMovePlot ~= nil then
						uUnit:SetXY(coastMovePlot:GetX(), coastMovePlot:GetY());
					else
						uUnit:SetXY(oceanMovePlot:GetX(), oceanMovePlot:GetY());
					end
					
					local plotFeature = pPlot:GetFeatureType();
					
					if (plotFeature == tWeatherFeature) then
						pPlot:SetFeatureType(FeatureTypes.NO_FEATURE, -1);
						if pPlot:GetImprovementType() == tStormImprovement then
							pPlot:SetImprovementType(-1);
						end
					end
				end
			end
		end
	end
end

GameEvents.PlayerEndTurnCompleted.Add(MBPstormFix);

function MBPweatherTurn(iPlayer)
	local pPlayer = Players[iPlayer];
	local pTeam = Teams[pPlayer:GetTeam()];
	local iTurn = Game.GetGameTurn();
	local iNumPlayers = Game.CountCivPlayersEverAlive() - PreGame.GetNumMinorCivs() - 1;

	if not MBPinit then
		MBPwaterCounter();
	end

	if iTurn == 0 and iPlayer == 1 then
		for i = 1, Map.GetWorldSize() + 1 do
			MBPsummer(true, false);
			MBPfall(true, false);
			MBPwinter(true, false);
			MBPspring(true, false);
		end
	elseif iPlayer == math.fmod((iTurn/iStormUpdateFrequency), iNumPlayers) then
		local MBPseason = MBPgetSeason();
		if MBPseason == 0 then
			MBPsummer(true, true);
		elseif MBPseason == 1 then
			MBPfall(true, true);
		elseif MBPseason == 2 then
			MBPwinter(true, true);
		elseif MBPseason == 3 then
			MBPspring(true, true);
		end
	end
end

GameEvents.PlayerDoTurn.Add(MBPweatherTurn);

function MBPbuildBlocker(iPlayer, iUnit, iPlotX, iPlotY, iBuild)
	--print("checking for burn/burnt to block build");
	local pPlot = Map.GetPlot(iPlotX, iPlotY);
	if (pPlot:GetImprovementType() == tStormImprovement) and (pPlot:GetFeatureType() == tWeatherFeature) then
		return false;
	end
	return true;
end

GameEvents.PlayerCanBuild.Add(MBPbuildBlocker);
--[[
function MBPcityBlocker(iPlayer, iPlotX, iPlotY)
	local pPlot = Map.GetPlot(iPlotX, iPlotY);
	if (pPlot == nil) then
		return false;
	elseif pPlot:GetImprovementType() == tStormImprovement and pPlot:GetFeatureType() == tWeatherFeature then
		return false;
	end
	return true;
end

GameEvents.PlayerCanFoundCity.Add(MBPcityBlocker);
]]--