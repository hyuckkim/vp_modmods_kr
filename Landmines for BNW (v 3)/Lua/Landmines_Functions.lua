-- Landmines_Functions
-- Author: FramedArchitecture
-- DateCreated: 7/12/2013
--------------------------------------------------------------------
g_TechUnlockID		= GameInfo.Technologies["TECH_DYNAMITE"].ID;
g_LandmineID		= GameInfo.Improvements["IMPROVEMENT_LANDMINE"].ID;
g_LandmineBuildID	= GameInfo.Builds["BUILD_LANDMINE"].ID;
g_Landmines			= {} --cache for active landmines
g_MaxLandmines		= 3; --max simultaneous number on map
--------------------------------------------------------------------
local bDisablePrint	= true
local print			= bDisablePrint and function() end or print
local saveData		= Modding.OpenSaveData();
local maxLandmines	= g_MaxLandmines; 
local techUnlockID	= g_TechUnlockID;
local landmineID	= g_LandmineID;
local landmines		= g_Landmines;
--------------------------------------------------------------------
function UpdateLandmineData(iPlayer, iX, iY, bInsert)
	local slots = GetSlotsUsed(iPlayer);
	if bInsert then
		if (slots == maxLandmines) then
			for i = 1, slots, 1 do
				local x, y = GetLandmineData(iPlayer, i)
				if (i == 1) then
					DeleteLandmine(x, y)
				else
					SaveLandmineData(iPlayer, (i - 1), x, y)
				end
			end
			slots = slots - 1
		else
			SetSlotsUsed(iPlayer, (slots + 1))
		end
		SaveLandmineData(iPlayer, (slots + 1), iX, iY);
		table.insert(landmines, {player = iPlayer, x = iX, y = iY});
	else
		local bResetSlot = false
		for i = 1, slots, 1 do
			local x, y = GetLandmineData(iPlayer, i);
			if bResetSlot then	
				SaveLandmineData(iPlayer, (i - 1), x, y);
			elseif (iX == x) and (iY == y) then
				DeleteLandmine(x, y);
				SetSlotsUsed(iPlayer, (slots - 1));
				bResetSlot = true
			end
		end
	end
end
--------------------------------------------------------------------
function UpdateLandmines()
	if #landmines > 0 then
		table.sort(landmines, function(a, b) return a.player > b.player end)
		print("UpdateLandmines()")
		print("*****************")
		local removed = 0
		for i = #landmines, 1, -1 do
			local this = landmines[i]
			local thisPlayer = this.player
			local x, y = this.x, this.y
			local plot = Map.GetPlot(x, y);
			if plot then
				if Players[thisPlayer]:IsAlive() then
					--this is attempt to rectify unseen AI action
					if i > 1 then
						local next = landmines[i - 1]
						if thisPlayer == next.player then
							local nextX, nextY = next.x, next.y
							if (x == nextX) and (y == nextY) then
								table.remove(landmines, i);
								UpdateLandmineData(thisPlayer, x, y, false);
								print("Removed duplicate record", thisPlayer, x, y)
								removed = removed + 1
							end
						end
					end
				
					if	plot:GetImprovementType() ~= landmineID or
						(plot:IsOwned() and (plot:GetOwner() ~= thisPlayer)) then 
						table.remove(landmines, i);
						UpdateLandmineData(thisPlayer, x, y, false);
						removed = removed + 1
					end
				else
					plot:SetImprovementType(-1);
					table.remove(landmines, i);
					UpdateLandmineData(thisPlayer, x, y, false);
					removed = removed + 1
				end
			else
				table.remove(landmines, i);
			end
			print(Players[thisPlayer]:GetName(), x, y)
		end
		print(removed, "invalid mines removed.")
		print("*****************")
	end
end
--------------------------------------------------------------------
function DeleteLandmine(x, y)
	for i, v in ipairs(landmines) do
		if (v.x == x) and (v.y == y) then
			local plot = Map.GetPlot(x, y)
			if plot then plot:SetImprovementType(-1) end
			table.remove(landmines, i);
			print("Landmine Removed:", x, y)
			break;
		end
	end
end
--------------------------------------------------------------------
function GetLandmineOwner(x, y)
	for _, v in ipairs(landmines) do
		if (v.x == x) then
			if (v.y == y) then
				return v.player;
			end
		end
	end
	return nil;
end
--------------------------------------------------------------------
function SaveLandmineData(iPlayer, iSlot, x, y)
	SetPersistentProperty(string.format("Player%iMineSlot%iX", iPlayer, iSlot), x)
	SetPersistentProperty(string.format("Player%iMineSlot%iY", iPlayer, iSlot), y)
end
--------------------------------------------------------------------
function GetLandmineData(iPlayer, iSlot)
	local x = GetPersistentProperty(string.format("Player%iMineSlot%iX", iPlayer, iSlot))
	local y = GetPersistentProperty(string.format("Player%iMineSlot%iY", iPlayer, iSlot))
	return x, y
end
--------------------------------------------------------------------
function SetSlotsUsed(iPlayer, iNum)
	SetPersistentProperty(string.format("Player%iMineSlots", iPlayer), iNum)
end
--------------------------------------------------------------------
function GetSlotsUsed(iPlayer)
	local iSlots = GetPersistentProperty(string.format("Player%iMineSlots", iPlayer)) or 0
	return iSlots
end
--------------------------------------------------------------------
function SetPlayerCanBuildLandmines(iPlayer, bBoolean)
	SetPersistentProperty(string.format("Player%iBuildMines", iPlayer), bBoolean)
end
--------------------------------------------------------------------
function IsPlayerCanBuildLandmines(iPlayer)
	return GetPersistentProperty(string.format("Player%iBuildMines", iPlayer))
end
--------------------------------------------------------------------
function SetLandminesEnabled(bBoolean)
	SetPersistentProperty("MinesEnabled", bBoolean)
	print("Landmines enabled by Tech Discovery")
end
--------------------------------------------------------------------
function IsLandminesEnabled()
	return GetPersistentProperty("MinesEnabled")
end
--------------------------------------------------------------------
function GetPersistentProperty(name)
	if(g_Properties == nil) then
		g_Properties = {};
	end
	if(g_Properties[name] == nil) then
		g_Properties[name] = saveData.GetValue(name);
	end
	return g_Properties[name];
end
--------------------------------------------------------------------
function SetPersistentProperty(name, value)
	if(g_Properties == nil) then
		g_Properties = {};
	end
	saveData.SetValue(name, value);
	g_Properties[name] = value;
end
--------------------------------------------------------------------
function SetAoEDamage(iPlayer, iX, iY)
	for i = 0, 5 do
		local adjPlot = Map.PlotDirection(iX, iY, i)
		if adjPlot then
			local unit = adjPlot:GetUnit(0)
			if unit and (unit:GetOwner() == iPlayer) then
				if not IsLandmineImmune(unit) then
					local iMaxHP = unit:GetMaxHitPoints();
					local iDamageLevel = (9 - unit:GetLevel())
					local iPercent = (iDamageLevel > 0) and (iDamageLevel / 10) or (1 / 10)
					local iChange = math.floor( iMaxHP * iPercent )
					local iNewDamage = unit:GetDamage() + iChange
					--cannot be killed by aoe damage
					if (iNewDamage >= iMaxHP) then
						iNewDamage = iMaxHP - 1
					end
					unit:SetDamage(iNewDamage)
					print(unit:GetName() .." took landmine damage.")
				end
			end
		end
	end
end
--------------------------------------------------------------------
function IsLandmineImmune(unit)
	local domain = unit:GetDomainType()
	return (domain == DomainTypes.DOMAIN_HOVER) or (domain == DomainTypes.DOMAIN_SEA)
end
--------------------------------------------------------------------
function CountWorkers(player)
	local iWorkers = 0
	for unit in player:Units() do
		if unit and (unit:GetUnitClassType() == GameInfoTypes["UNITCLASS_WORKER"]) then
			iWorkers = iWorkers + 1
		end
	end
	return iWorkers;
end
--------------------------------------------------------------------
function OnBeginNewGame()
	local bEnableMines = false
	local newUnit;
	local targetWorkers = GameInfo.Eras[PreGame.GetEra()].StartingWorkerUnits
	for iPlayer = 0, GameDefines.MAX_CIV_PLAYERS-1, 1 do
		local player = Players[iPlayer]
		if player and player:IsEverAlive() then
			--fix for advanced starts
			local workerCount = CountWorkers(player)
			for unit in player:Units() do
				if workerCount < targetWorkers then
					if unit and unit:GetBaseCombatStrength() > 0 then
						newUnit = player:InitUnit (GameInfoTypes["UNIT_WORKER"], unit:GetX(), unit:GetY());
						unit:Kill(true, -1);
						workerCount = workerCount + 1
					end
				else
					break;
				end
			end
			--check for game event processing
			if Teams[player:GetTeam()]:IsHasTech(techUnlockID) then	
				SetPlayerCanBuildLandmines(iPlayer, true)
				bEnableMines = true
			end
		end
	end

	if bEnableMines then SetLandminesEnabled(true) end

	SetPersistentProperty("Landmines_Init", true)
	print("+--Landmines Mod Initialized--+");

	return bEnableMines;
end
--------------------------------------------------------------------
function OnLoadSavedGame()
	local removed = 0
	--rebuild the cache from saved data
	for iPlayer = 0, GameDefines.MAX_CIV_PLAYERS - 1, 1 do
		local player = Players[iPlayer]
		if player and player:IsEverAlive() then
			local slots = GetSlotsUsed(iPlayer);
			if slots > 0 then
				for i = 1, slots, 1 do
					local iX, iY = GetLandmineData(iPlayer, i)
					local plot = Map.GetPlot(iX, iY)
					if plot and (plot:GetImprovementType() == landmineID) then
						if player:IsAlive() then
							table.insert(landmines, {player = iPlayer, x = iX, y = iY})
						else
							plot:SetImprovementType(-1);
							UpdateLandmineData(iPlayer, iX, iY, false);
							removed = removed + 1
						end
					end
				end
			end
		end
	end
	--clean up any unsaved landmines
	for plotLoop = 0, Map.GetNumPlots() - 1, 1 do
		local plot = Map.GetPlotByIndex(plotLoop);
		if (plot:GetImprovementType() == landmineID) then
			local mineOwner = GetLandmineOwner(plot:GetX(), plot:GetY())
			if not mineOwner then 
				plot:SetImprovementType(-1);
				removed = removed + 1
			end
		end
	end
	print("Landmines restored:",#landmines);
	print("Landmines removed:",removed);
	print("+--Landmines Mod Loaded--+");
	return true;
end
--------------------------------------------------------------------