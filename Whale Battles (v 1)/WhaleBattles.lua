local iAggressiveWhaleChance = 50;
--simple turn counter for how often a new whale spawns from eligible plot
local iWhaleSpawnFrequency = 1 + Map.GetClimate() + (3 - Game.GetGameSpeedType()) + (2 - Map.GetSeaLevel()) + (5 - Map.GetWorldSize());
--this helps determine how many resources per turn get converted to whale units; higher values result in more whale units per turn
local maxResToWhaleRoll = ((5 - Map.GetClimate()) + Map.GetSeaLevel()) * ((1 + Map.GetWorldSize()) + Game.GetGameSpeedType()) + 9;
--this is used as a multiplier limiting how often whale units die before converting back to resource; higher values reduce death rates
local iMortality = ((3 + (5-Map.GetWorldSize()) + Map.GetSeaLevel()) / (1 + (5-Map.GetWorldSize())));

local WBinit = false;
local iWhaleResource = GameInfoTypes.RESOURCE_WHALE;
local iFishResource = GameInfoTypes.RESOURCE_FISH;
local iMigratoryWhaleResource = GameInfoTypes.RESOURCE_MIGRATORY_WHALE;
local iMigratoryWhaleImprovement = GameInfoTypes.IMPROVEMENT_MWHALE;
local iMigratoryWhaleUnit = GameInfoTypes.UNIT_WHALE_MWB;
local iWorkboat = GameInfoTypes.UNIT_WORKBOAT;
local iWorker = GameInfoTypes.UNIT_WORKER;
local iWhaler = GameInfoTypes.UNIT_WHALER;
local iFishingBoatImp = GameInfoTypes.IMPROVEMENT_FISHING_BOATS;
local iCetaceanPromo = GameInfoTypes.PROMOTION_WHALE_MWB;
local iFishwhalingBuild = GameInfoTypes.BUILD_FISHWHALING;
local iWhalingBuild = GameInfoTypes.BUILD_WHALING;

local WBwhales = {};
local WBmigratoryWhaleRes = {};
local WBmigratoryWhaleImp = {};
local WBmigratoryWhaleUnits = {};

function WBwhaleFinder(pPlayer)
	for i = 0, Map.GetNumPlots()-1, 1 do
		local pPlot = Map.GetPlotByIndex(i);
		if pPlot:HasResource(iWhaleResource) then
			table.insert(WBwhales, pPlot);
		elseif pPlot:HasResource(iMigratoryWhaleResource) then
			table.insert(WBmigratoryWhaleRes, pPlot);
		elseif pPlot:HasImprovement(iMigratoryWhaleImprovement) then
			table.insert(WBmigratoryWhaleImp, pPlot);
		end
	end
	for uUnit in pPlayer:Units() do
		if uUnit:GetUnitType() == iMigratoryWhaleUnit then
			table.insert(WBmigratoryWhaleUnits, uUnit);
		end
	end
	WBinit = true;
end

function WBwhaleSpawn(pPlayer)
	for i, whaleResPlot in pairs(WBwhales) do
		if (whaleResPlot:GetImprovementType() == -1) or whaleResPlot:IsImprovementPillaged() then
			table.insert(WBmigratoryWhaleUnits, pPlayer:InitUnit(iMigratoryWhaleUnit, whaleResPlot:GetX(), whaleResPlot:GetY(), UNITAI_EXPLORE_SEA));
			print("new resource whale");
		end
	end
end

function WBmwhaleSpawn(pPlayer)
	local newWBmigratoryWhaleImp = {};
	for i, whaleImpPlot in pairs(WBmigratoryWhaleImp) do
		if (whaleImpPlot:GetImprovementType() == iMigratoryWhaleImprovement) then
			if (math.fmod(whaleImpPlot:GetImprovementDuration(), iWhaleSpawnFrequency) == 0) then
				table.insert(WBmigratoryWhaleUnits, pPlayer:InitUnit(iMigratoryWhaleUnit, whaleImpPlot:GetX(), whaleImpPlot:GetY(), UNITAI_EXPLORE_SEA));
				print("new improvement whale");
			end
			table.insert(newWBmigratoryWhaleImp, whaleImpPlot);
		end
	end
	WBmigratoryWhaleImp = newWBmigratoryWhaleImp;
end

function WBresToWhale(pPlayer)
	local newWBmigratoryWhaleRes = {};
	local rollThreshold = #WBmigratoryWhaleRes;
	for i, whaleResPlot in pairs(WBmigratoryWhaleRes) do
		if (whaleResPlot:GetResourceType() == iMigratoryWhaleResource) then
			if whaleResPlot:GetNumUnits() <= 0 and (Game.Rand((maxResToWhaleRoll + rollThreshold), "resource to whale") > rollThreshold) then
				if Game.Rand(100, "aggressive whale") < iAggressiveWhaleChance then
					table.insert(WBmigratoryWhaleUnits, pPlayer:InitUnit(iMigratoryWhaleUnit, whaleResPlot:GetX(), whaleResPlot:GetY(), UNITAI_ATTACK_SEA));
					print("resource to attack whale");
				else
					table.insert(WBmigratoryWhaleUnits, pPlayer:InitUnit(iMigratoryWhaleUnit, whaleResPlot:GetX(), whaleResPlot:GetY(), UNITAI_EXPLORE_SEA));
					print("resource to explore whale");
				end
				whaleResPlot:SetResourceType(-1);
			else
				table.insert(newWBmigratoryWhaleRes, whaleResPlot);
			end
		end
	end
	WBmigratoryWhaleRes = newWBmigratoryWhaleRes;
end

function WBwhaleToRes(pPlayer)
	local rollThreshold = (#WBmigratoryWhaleRes + #WBmigratoryWhaleUnits) 
	for i, whaleUnit in pairs(WBmigratoryWhaleUnits) do
		if not (whaleUnit == nil) then
			if Game.Rand((maxResToWhaleRoll + rollThreshold), "resource to whale") > ((iMortality * maxResToWhaleRoll) + #WBwhales + #WBmigratoryWhaleImp) then
				whaleUnit:Kill(true, whaleUnit:GetOwner());
				print("whale died")
			else
				WBwhaletoResourceConverter(whaleUnit, whaleUnit:GetPlot());
			end
		end
	end
	WBmigratoryWhaleUnits = {};
end

function WBwhaletoResourceConverter(uUnit, pPlot)
	if not (pPlot == nil) then
		if pPlot:GetResourceType() == -1 and pPlot:IsWater() then
			pPlot:SetResourceType(iMigratoryWhaleResource, 1);
			uUnit:Kill(true, uUnit:GetOwner());
			table.insert(WBmigratoryWhaleRes, pPlot);
			print("Whale to resource");
			return;
		end

		local directions = {DirectionTypes.DIRECTION_NORTHEAST, DirectionTypes.DIRECTION_EAST, DirectionTypes.DIRECTION_SOUTHEAST, DirectionTypes.DIRECTION_SOUTHWEST, DirectionTypes.DIRECTION_WEST, DirectionTypes.DIRECTION_NORTHWEST};

		while #directions > 0 do
			-- Pick random index
			local i = math.random(#directions)
			local dir = directions[i]

			-- Remove from list (avoid retrying)
			table.remove(directions, i)

			-- Try that direction
			local adjPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), dir)
			if adjPlot and adjPlot:IsWater() and adjPlot:GetResourceType() == -1 then
				adjPlot:SetResourceType(iMigratoryWhaleResource, 1);
				uUnit:Kill(true, uUnit:GetOwner());
				table.insert(WBmigratoryWhaleRes, adjPlot);
				print("Whale to resource");
				return;
			end
		end
	end
	print("No valid adjacent plot found for whale resource");
	uUnit:Kill(true, uUnit:GetOwner());
end

function WBturnStart(iPlayer)
	local iTurn = Game.GetGameTurn();
	if iTurn > iWhaleSpawnFrequency then
		local pPlayer = Players[iPlayer];
		if pPlayer:IsBarbarian() then
			if not WBinit then
				WBwhaleFinder(pPlayer);
			end
			if math.fmod(iTurn, iWhaleSpawnFrequency) == 0 then
				WBwhaleSpawn(pPlayer);
			end
			WBmwhaleSpawn(pPlayer);
			WBresToWhale(pPlayer);
		end
	end
end

GameEvents.PlayerDoTurn.Add(WBturnStart);

function WBturnEnd(iPlayer)
	local pPlayer = Players[iPlayer];
	if pPlayer:IsBarbarian() then
		WBwhaleToRes(pPlayer);
	end
end

GameEvents.PlayerDoneTurn.Add(WBturnEnd);
--GameEvents.PlayerEndTurnCompleted.Add(WBturnEnd);

function WBmoveInto(iPlayer, iUnit, iPlotX, iPlotY, bAttack, bDeclareWar) 
	local pPlayer = Players[iPlayer];
	local uUnit = pPlayer:GetUnitByID(iUnit);
	if uUnit:GetUnitType() == iMigratoryWhaleUnit then
		local pPlot = Map.GetPlot(iPlotX, iPlotY);
		if pPlot == nil then return false end
		if (pPlot:GetNumUnits() == nil) then
		elseif (pPlot == uUnit:GetPlot()) then
		elseif (pPlot:GetNumUnits() > 0) then
			return false;
		end
	end
	return true;
end

GameEvents.CanMoveInto.Add(WBmoveInto);

GameEvents.UnitCanPillage.Add(function(iUnitOwner, iUnit, iImprovement, iRoute)
	if iImprovement == iMigratoryWhaleImprovement then
		return false;
	end
	local pPlayer = Players[iUnitOwner];
	local uUnit = pPlayer:GetUnitByID(iUnit);
	if uUnit:GetUnitType() == iMigratoryWhaleUnit then
		if iImprovement ~= iFishingBoatImp then
			return false;
		end
	end
	if iImprovement == iMigratoryWhaleImprovement then
		return false;
	end
	return true;
end)

function WBsetXY(iPlayer, iUnit, iX, iY)
	local pPlayer = Players[iPlayer];
	if pPlayer == nil then return end
	local uUnit = pPlayer:GetUnitByID(iUnit);
	if uUnit == nil then return end
	if pPlayer:IsBarbarian() then
		if uUnit:GetUnitType() == iMigratoryWhaleUnit then
			local pPlot = Map.GetPlot(iX, iY);
			if pPlot == nil then
			elseif pPlot:HasResource(iFishResource) and (pPlot:GetImprovementType() == -1) then
				pPlot:SetImprovementType(iMigratoryWhaleImprovement);
				uUnit:Kill(true, iPlayer);
				table.insert(WBmigratoryWhaleImp, pPlot);
				print("whale improvement created");
			end
		end
	end
	if uUnit:GetUnitType() == iWhaler then
		local pPlot = Map.GetPlot(iX, iY);
		if pPlot:IsCity() and pPlot:GetOwner() == iPlayer then
			uUnit:Kill(false, iPlayer);
			local iCity = pPlot:GetPlotCity():GetID();
			pPlayer:DoInstantYield(0, 1, true, iCity);
			pPlayer:DoInstantYield(1, 1, true, iCity);
			pPlayer:DoInstantYield(2, 1, true, iCity);
			pPlayer:DoInstantYield(3, 1, true, iCity);
			pPlayer:DoInstantYield(4, 1, true, iCity);
			local newUnit = pPlayer:InitUnit(iWorkboat, iX, iY, UNITAI_WORKER_SEA);
			newUnit:SetMoves(0);
		end
	end
end
GameEvents.UnitSetXY.Add(WBsetXY);

--[[
function WBrangeAttack(iUnitOwner, iUnit, iPlotX, iPlotY, bNeedWar)
	local pPlayer = Players[iUnitOwner];
	local uUnit = pPlayer:GetUnitByID(iUnit);
	if uUnit:GetUnitType() == iMigratoryWhaleUnit then
		local pPlot = Map.GetPlot(iPlotX, iPlotY);
		if not pPlot:IsWater() then
			return false;
		elseif pPlot:GetUnitPower() > 0 then
			return false;
		end
	end
	return true;
end

GameEvents.UnitCanRangeAttackAt.Add(WBrangeAttack);
]]--

GameEvents.PlayerBuilt.Add(function(iPlayer, iUnit, iPlotX, iPlotY, iBuild)
	local bWhaling = (iBuild == iFishwhalingBuild) or (iBuild == iWhalingBuild);
	if bWhaling then
		local pPlayer = Players[iPlayer];
		if pPlayer ~= nil then
			local uUnit = pPlayer:InitUnit(iWhaler, iPlotX, iPlotY, UNITAI_TREASURE);
			uUnit:SetMoves(0);
			print("new whaler");
		end
	end
end)

function WBbuildBlocker(iPlayer, iUnit, iPlotX, iPlotY, iBuild)
	--print("checking for burn/burnt to block build");
	local pPlot = Map.GetPlot(iPlotX, iPlotY);
	if iBuild ~= iFishwhalingBuild and pPlot:HasImprovement(iMigratoryWhaleImprovement) then
		return false;
	end
	return true;
end

GameEvents.PlayerCanBuild.Add(WBbuildBlocker);