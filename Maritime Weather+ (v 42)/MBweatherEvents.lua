include( "MBweather.lua" );

local iStormUpdateFrequency = MBPgetStormUpdateFrequency();
local tStormImprovement = GameInfoTypes.IMPROVEMENT_STORM;
local tStormImprovementAnim = GameInfoTypes.IMPROVEMENT_STORM_ANIM;
local tWeatherFeature = GameInfoTypes.FEATURE_RESTRICTED_VISIBILITY;
local tOceanCrossTech = GameInfoTypes.TECH_ASTRONOMY;
local tOceanTerrain = TerrainTypes.TERRAIN_OCEAN;
local tCoastTerrain = TerrainTypes.TERRAIN_COAST;
local cPolynesia = GameInfoTypes.CIVILIZATION_POLYNESIA;
local bOceanCrossFunctionAvailable;

function MBPstormFix(iPlayer)
	--print("MBPstormFixer activated");
	local prevPlayer = iPlayer - 1;
	if prevPlayer < 0 then
		prevPlayer = Game.CountCivPlayersEverAlive() - 1
	end
	while (not Players[prevPlayer]:IsAlive()) do
		if prevPlayer < 0 then
			prevPlayer = Game.CountCivPlayersEverAlive() - 1
		else
			prevPlayer = prevPlayer - 1
		end
	end
	local pPlayer = Players[prevPlayer];
	local tTeam = Teams[pPlayer:GetTeam()];
	if not tTeam:IsHasTech(tOceanCrossTech) and not (pPlayer:GetCivilizationType() == cPolynesia) then
		--print("MBPstormFixer: pre-astro player found");
		local adjDirections = {DirectionTypes.DIRECTION_NORTHEAST, DirectionTypes.DIRECTION_EAST, DirectionTypes.DIRECTION_SOUTHEAST, DirectionTypes.DIRECTION_SOUTHWEST, DirectionTypes.DIRECTION_WEST, DirectionTypes.DIRECTION_NORTHWEST};
		local pCapitalPlot = pPlayer:GetStartingPlot();
		local iCapitalX = pCapitalPlot:GetX();
		local iCapitalY = pCapitalPlot:GetY();
		for uUnit in pPlayer:Units() do
			local pPlot = uUnit:GetPlot();
			local bCanCrossOceans = false;
			if bOceanCrossFunctionAvailable then
				bCanCrossOceans = uUnit:CanCrossOceans();
			end
			if (pPlot:GetTerrainType() == tOceanTerrain) and (pPlot:GetFeatureType() == tWeatherFeature) and not bCanCrossOceans then
				print("MBPstormFixer: invalid ocean unit found");
				while (pPlot:GetTerrainType() == tOceanTerrain) do
					local oceanMovePlot = nil;
					local coastMovePlot = nil;
					for loop, direction in ipairs(adjDirections) do
						local adjPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), direction);
						if (adjPlot:GetTerrainType() == tCoastTerrain) then
							if coastMovePlot == nil then
								coastMovePlot = adjPlot;
							elseif Map.PlotDistance(adjPlot:GetX(), adjPlot:GetY(), iCapitalX, iCapitalY) < Map.PlotDistance(coastMovePlot:GetX(), coastMovePlot:GetY(), iCapitalX, iCapitalY) then
								coastMovePlot = adjPlot;
							end
						elseif (adjPlot:GetTerrainType() == tOceanTerrain) then
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
					
					if (pPlot:GetFeatureType() == tWeatherFeature) then
						pPlot:SetFeatureType(FeatureTypes.NO_FEATURE, -1);
						MBPstormArtRemover(pPlot);
					end
					pPlot = uUnit:GetPlot();
				end
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(MBPstormFix);

function MBPweatherTurn(iPlayer)
	local pPlayer = Players[iPlayer];
	local pTeam = Teams[pPlayer:GetTeam()];
	local iTurn = Game.GetGameTurn();
	local iNumPlayers = Game.CountCivPlayersEverAlive() - PreGame.GetNumMinorCivs() - 1;

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

function IdentifySVicon(hexX, hexY, createImprovementType, createImprovementRRType, createImprovementState)
	local x, y = ToGridFromHex(hexX, hexY)
	local pPlot = Map.GetPlot(x, y)
	if pPlot:GetImprovementType() == tStormImprovement then
		print("attempting to update storm SVicon ID")
		if createImprovementType then
			MBPupdateSViconID(createImprovementType)
			Events.SerialEventImprovementIconCreated.Remove(IdentifySVicon)
			pPlot:SetImprovementType(-1)
			print("snapshot improvement removed");
			MBPartInitialized()
		end
	end
end
Events.SerialEventImprovementIconCreated.Add(IdentifySVicon)

function IdentifySnapshotModel(hexX, hexY, continent1, continent2, PlayerID, createImprovementType, createImprovementRRType, ResourceType, NumResource, ImprovementEra)
	--print(hexX)
	--print(hexY)
	--print(continent1)
	--print(continent2)
	--print(PlayerID)
	--print(createImprovementType)
	--print(createImprovementRRType)
	--print(ResourceType)
	--print(NumResource)
	--print(ImprovementEra)
	local x, y = ToGridFromHex(hexX, hexY)
	local pPlot = Map.GetPlot(x, y)
	if pPlot:GetImprovementType() == tStormImprovement then
		print("attempting to update storm snapshot createType ID")
		if createImprovementType then
			MBPupdateSnapshotID(createImprovementType)
			Events.SerialEventImprovementCreated.Remove(IdentifySnapshotModel)
			pPlot:SetImprovementType(-1)
			print("snapshot improvement removed");
			MBPartInitialized()
		end
	end
end
Events.SerialEventImprovementCreated.Add(IdentifySnapshotModel)

function IdentifyAnimModel(hexX, hexY, continent1, continent2, PlayerID, createImprovementType, createImprovementRRType, ResourceType, NumResource, ImprovementEra)
	local x, y = ToGridFromHex(hexX, hexY)
	local pPlot = Map.GetPlot(x, y)
	if pPlot:GetImprovementType() == tStormImprovementAnim then
		print("attempting to update storm anim createType ID")
		if createImprovementType then
			MBPupdateAnimID(createImprovementType)
			Events.SerialEventImprovementCreated.Remove(IdentifyAnimModel)
			pPlot:SetImprovementType(-1)
			print("anim improvement removed");
			MBPartInitialized()
		end
	end
end
Events.SerialEventImprovementCreated.Add(IdentifyAnimModel)

function TestArtModel()
	MBPmapResourceLayoutHandlers();
	print("initializing search for storm art")
	local iActiveTeam = Game.GetActiveTeam();
	local snapshotPlaced = false;
	local snapshot2Placed = false;
	local unitTestComplete = false;
	for i = 0, Map.GetNumPlots()-1, 1 do
		local pPlot = Map.GetPlotByIndex(i);
		-- lets find the IDs of the createTypes for the serialEvent
		if (not unitTestComplete) and (pPlot:GetNumUnits() == 0) then
			bOceanCrossFunctionAvailable = MBPOceanCrossFunctionAvailable();
			print("unit ocean crossing checker function available: " .. tostring(bOceanCrossFunctionAvailable))
			unitTestComplete = true;
		elseif (pPlot:IsVisible(iActiveTeam)) and (pPlot:GetImprovementType() == -1) and (pPlot:GetResourceType() == -1) and (not pPlot:IsOwned()) then
			if not snapshotPlaced then		--add improvement for snapshot identification
				print("placing snapshot improvement in test plot")
				pPlot:SetImprovementType(tStormImprovement);
				snapshotPlaced = true;
			elseif not snapshot2Placed then		--add improvement for icon identification
				print("placing 2nd snapshot improvement in test plot")
				pPlot:SetImprovementType(tStormImprovement);
				snapshot2Placed = true;
			else		--add improvement for anim identification and end the loop
				print("placing anim improvement in test plot")
				pPlot:SetImprovementType(tStormImprovementAnim);
				break;
			end
		end
	end
	Events.SequenceGameInitComplete.Remove(TestArtModel)
end
Events.SequenceGameInitComplete.Add(TestArtModel)