-- Landmines_AI
-- Author: FramedArchitecture
-- DateCreated: 7/12/2013
--------------------------------------------------------------------
include("Landmines_Functions.lua");
include("PlotIterators.lua");
--------------------------------------------------------------------
local bDisablePrint	= true
local print			= bDisablePrint and function() end or print
local maxLandmines	= g_MaxLandmines; 
local landmineID	= g_LandmineID;
local buildMineID	= g_LandmineBuildID;
local leaderAIValue	= {}	--cache for AI leader flavor
local unitAITargets	= {}	--cache for units moving to build targets
local AIAction		= 26	--threshold for AI build action
local AIMinorMod	= 1.2	--increases chance minors will build mines
local maxCityDist	= 5		--max tiles from closest city unit will build a mine
local maxBuildDist	= 4		--max tiles a unit will travel to build a mine
--------------------------------------------------------------------
function DoLandminesAI()
	if #unitAITargets > 0 then DoAIMissionUpdate() end
	for iPlayer = 0, GameDefines.MAX_CIV_PLAYERS-1, 1 do
		local player = Players[iPlayer]
		if IsValidAIPlayer(player) then
			if IsAINeedsDefense(player) then
				local bShuffle = math.random(1,100) < 30
				DoAIUnitBuildNewLandmine(player, bShuffle)
			end
		end
	end
end
--------------------------------------------------------------------
function DoAIUnitBuildNewLandmine(player, bShuffle)
	local playerID = player:GetID()
	local builds = GetAvailableBuilds(playerID, buildMineID)
	if bShuffle then builds = builds + 3 end
	for unit in player:Units() do
		if builds > 0 then 
			if unit and IsCanBuild(unit, buildMineID) and IsAvailableBuild(unit) then
				local unitPlot = unit:GetPlot();
				local buildPlot = GetAIBestBuildPlot(player, unitPlot, maxBuildDist);
				if buildPlot then
					local x, y = buildPlot:GetX(), buildPlot:GetY()
					if (buildPlot == unitPlot)  then
						SetAIBuildLandmine(playerID, x, y, landmineID);
						builds = builds - 1
					elseif IsAdjacentBuildPlot(unit:GetX(), unit:GetY(), buildPlot) then
						unit:SetXY(x, y);
						print(player:GetName(), "build in adjacent tile", x, y )
						SetAIBuildLandmine(playerID, x, y, landmineID);
						builds = builds - 1
					else
						SetAIMoveToBuildPlot(unit, x, y);
						table.insert(unitAITargets, {AIplayer = player, AIunit = unit, GoToX = x, GoToY = y, turns = 3})
						builds = builds - 1
					end
				end
			end
		else
			break;
		end
	end
end
--------------------------------------------------------------------
function DoAIMissionUpdate()
	table.sort(unitAITargets, function(a, b) return a.turns > b.turns end)
	for i = #unitAITargets, 1, -1 do
		local turns = unitAITargets[i].turns
		if turns == 0 then
			table.remove(unitAITargets, i);
		else
			local player = unitAITargets[i].AIplayer
			if player:IsAlive() then
				local playerID = player:GetID()
				local unit = unitAITargets[i].AIunit
				local x = unitAITargets[i].GoToX
				local y = unitAITargets[i].GoToY
				if unit then
					local bCanBuild = (GetSlotsUsed(playerID) > 0)
					if bCanBuild then
						if unit:GetX() == x and unit:GetY() == y then
							SetAIBuildLandmine(playerID, x, y, landmineID);
							table.remove(unitAITargets, i);
						else
							SetAIMoveToBuildPlot(unit, x, y);
							unitAITargets[i].turns = turns - 1
						end
					else
						table.remove(unitAITargets, i);
					end
				else
					table.remove(unitAITargets, i);
				end
			else
				table.remove(unitAITargets, i);
			end
		end
	end
end
--------------------------------------------------------------------
function IsAINeedsDefense(player)
	local warModifier = (Teams[player:GetTeam()]:GetAtWarCount(false) + 1)
	if warModifier > 2 then return true end

	local valueMines = 2 * GetSlotsUsed(player:GetID());
	local valueFlavor = GetAIDefenseFlavor(player)
	local iValue = (valueFlavor - valueMines) * warModifier
	
	if player:IsMinorCiv() then iValue = (iValue * AIMinorMod) end

	if iValue > AIAction then
		return true ;
	elseif iValue > (AIAction / 1.7) then
		iValue = iValue + GetAIPrepareHostility(player)
		return iValue > AIAction  
	else
		return false;
	end
end
--------------------------------------------------------------------
function GetAIPrepareHostility(player)
	local teamID = player:GetTeam()
	local capitalPlot = player:GetCapitalCity():Plot()
	local playerPower = player:GetPower();
	local prepareScore = 2 * (player:GetCitiesLost() - Teams[teamID]:GetDefensivePactCount())
	for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local otherPlayer = Players[iPlayer]
		if otherPlayer and otherPlayer:IsAlive() and (player ~= otherPlayer) then
			local otherTeam = Teams[otherPlayer:GetTeam()]
			if otherTeam:IsHasMet(teamID) and not otherTeam:IsAtWar(teamID) then
				if otherPlayer:GetPower() > playerPower then
					prepareScore = prepareScore + 2
				end
				prepareScore = prepareScore + GetNumNearbyCities(otherPlayer, capitalPlot, 12)
			end
		end
	end
	return prepareScore;
end
--------------------------------------------------------------------
function IsAdjacentBuildPlot(x, y, plot)
	for i = 0, 5 do
		local adjPlot = Map.PlotDirection(x, y, i)
		if adjPlot and (adjPlot == plot) then
			if not adjPlot:GetUnit(0) then
				return true;
			end
		end
	end
	return false;
end
--------------------------------------------------------------------
function SetAIBuildLandmine(playerID, x, y, buildID)
	Map.GetPlot(x, y):SetImprovementType(buildID);
	LuaEvents.LandmineComplete(playerID, x, y, buildID);
	print(Players[playerID]:GetName(), "new AI landmine at", x, y )
end
--------------------------------------------------------------------
function SetAIMoveToBuildPlot(unit, x, y)
	unit:PopMission();
	unit:PushMission(MissionTypes.MISSION_MOVE_TO, x, y, 0, 0, 1, MissionTypes.MISSION_MOVE_TO, unit:GetPlot(), unit);
end
--------------------------------------------------------------------
function IsValidAIPlayer(player)
	return player:IsAlive() and not player:IsHuman() and IsPlayerCanBuildLandmines(player:GetID()) and player:GetNumMilitaryUnits() > 0 
end
--------------------------------------------------------------------
function GetAIBestBuildPlot(player, plot, distance)
	local bestPlot = nil
	local iPlayer = player:GetID();
	if GetNumNearbyCities(player, plot, maxCityDist) > 0 then
		local targetPlots = {}
		local unitX, unitY = plot:GetX(), plot:GetY()
		for targetPlot in PlotAreaSpiralIterator(plot, distance, SECTOR_SOUTH, DIRECTION_ANTICLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
			if targetPlot and IsValidMinePlot(iPlayer, targetPlot) then
				--sets up a valuation system for target plots
				--weighted for distance, adjacent to owned, improvement, terrain, feature
				local iValue = 0
				if targetPlot == plot then
					iValue = iValue + 5
				else
					local targetPlotDistance = Map.PlotDistance(unitX, unitY, targetPlot:GetX(), targetPlot:GetY())
					iValue = iValue + (distance - targetPlotDistance)
				end
				if targetPlot:IsAdjacentPlayer(iPlayer, true) then
					iValue = iValue + 5
				end
				if (targetPlot:GetImprovementType() == NO_IMPROVEMENT) then
					iValue = iValue + 3
				elseif targetPlot:IsRoute() then
					iValue = iValue - 2
				end
				local featureType = targetPlot:GetFeatureType()
				if featureType == FeatureTypes.FEATURE_JUNGLE or featureType == FeatureTypes.FEATURE_FOREST then
					iValue = iValue + 1
				end
				if targetPlot:GetTerrainType() == TerrainTypes.TERRAIN_HILL then
					iValue = iValue + 1
				end
				if iValue > 5 then
					table.insert(targetPlots, {value = iValue, plot = targetPlot})
				end
			end
		end
		if #targetPlots > 0 then
			table.sort(targetPlots, function(a, b) return a.value > b.value end)
			bestPlot = targetPlots[1].plot
		end
	end
	return bestPlot
end
--------------------------------------------------------------------
function IsValidMinePlot(iPlayer, plot)
	local plotType = plot:GetPlotType()
	if plotType == PlotTypes.PLOT_OCEAN then return false end
	if plotType == PlotTypes.PLOT_MOUNTAIN then return false end
	if plot:GetImprovementType() == landmineID then return false end
	if plot:GetNumResource() > 0 then return false end
	if plot:IsCity() then return false end
	if plot:IsBeingWorked() then return false end
	
	local plotOwner = plot:GetOwner()
	if plotOwner == iPlayer or plotOwner == -1 then return true end

	return false;
end
--------------------------------------------------------------------
function GetNumNearbyCities(player, plot, targetDist)
	local x, y = plot:GetX(), plot:GetY()
	local cities = 0
	for city in player:Cities() do
		local dist = Map.PlotDistance(x, y, city:GetX(), city:GetY())
		if dist <= targetDist then
			cities = cities + 1
		end
	end
	return cities;
end
--------------------------------------------------------------------
function IsCanBuild(unit, actionID)
	local unitType = GameInfo.Units[unit:GetUnitType()].Type
	for row in GameInfo.Unit_Builds("UnitType='" .. unitType .. "'") do
		if row.BuildType == GameInfo.Builds[actionID].Type then
			return true;
		end
	end
	return false;
end
--------------------------------------------------------------------
function IsAvailableBuild(unit)
	if unit:GetBuildType() == buildMineID then return false end  
	if unit:IsEmbarked() then return false end 
	if unit:IsEnemyInMovementRange(false, false) then return false end 
	if unit:IsEnemyCityAdjacent() then return false end 	
	local activityType = unit:GetActivityType();
	if	unit:IsGarrisoned() or
		unit:GetFortifyTurns() > 0 or
		activityType == ActivityTypes.ACTIVITY_SENTRY or
		activityType == ActivityTypes.ACTIVITY_AWAKE then
		return true 
	end
	return false;
end
--------------------------------------------------------------------
function GetAvailableBuilds(iPlayer, buildID)
	local builds = GetSlotsUsed(iPlayer)
	for unit in Players[iPlayer]:Units() do
		if unit:GetBuildType() == buildID then
			builds = builds + 1
		end
	end
	local available = maxLandmines - builds
	return available > 0 and available or 0
end
--------------------------------------------------------------------
function GetAIDefenseFlavor(player)
	for _, v in ipairs(leaderAIValue) do
		if v.AIplayer == player then
			return v.AIflavor
		end
	end
	return 0;
end
--------------------------------------------------------------------
function UpdateAIDefenseFlavor()
	for iPlayer = 0, GameDefines.MAX_CIV_PLAYERS-1, 1 do
		local player = Players[iPlayer];
		if player and player:IsEverAlive() then
			local leaderFlavor = 0
			local leaderType = GameInfo.Leaders[player:GetLeaderType()].Type
			for row in GameInfo.Leader_Flavors("LeaderType='" .. leaderType .. "'") do
				if row.FlavorType == "FLAVOR_DEFENSE" then
					leaderFlavor = leaderFlavor + row.Flavor
				elseif row.FlavorType == "FLAVOR_CITY_DEFENSE" then
					leaderFlavor = leaderFlavor + row.Flavor
				elseif row.FlavorType == "FLAVOR_RECON" then
					leaderFlavor = leaderFlavor + row.Flavor
				end
			end
			table.insert(leaderAIValue, {AIplayer = player, AIflavor = leaderFlavor})
		end
	end
end
--------------------------------------------------------------------
UpdateAIDefenseFlavor();

print("Landmines_AI loaded...")