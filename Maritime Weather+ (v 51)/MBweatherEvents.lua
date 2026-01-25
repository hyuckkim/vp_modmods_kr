include( "MBweather.lua" );

function MBPweatherTurn(iPlayer)

	local pPlayer = Players[iPlayer];
	local iTeam = pPlayer:GetTeam();
	local iTurn = Game.GetGameTurn();
	local iNumPlayers = Game.CountCivPlayersEverAlive() - PreGame.GetNumMinorCivs() - 1;
	local bAlive = pPlayer:IsAlive();

	--[[if bAlive then
		local iPrevPlayer = MBPgetPrevPlayer(iPlayer);
		local iPrevTeam = Players[iPrevPlayer]:GetTeam();
		MBPturnVisFixer(iPrevPlayer, iPrevTeam, false);
	end--]]
	MBPupdateSurveillanceCities(iTeam, iPlayer, pPlayer);

	if iPlayer == math.fmod((iTurn/MBPgetStormUpdateFrequency()), iNumPlayers) then
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
		MBPspawnScaler();
		--MBPupdateFoW(); -- also done in turnfixer
	end

	if bAlive then
		MBPstormFix(iPlayer);
		--MBPturnVisFixer(iPlayer, iTeam, true);
	end
end
GameEvents.PlayerDoTurn.Add(MBPweatherTurn);

function IdentifySVicon(hexX, hexY, createImprovementType, createImprovementRRType, createImprovementState)
	local x, y = ToGridFromHex(hexX, hexY)
	local pPlot = Map.GetPlot(x, y)
	if MBPisStormImprovement(pPlot, true) then
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
	local x, y = ToGridFromHex(hexX, hexY)
	local pPlot = Map.GetPlot(x, y)
	if MBPisStormImprovement(pPlot, true) then
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
	if MBPisStormImprovement(pPlot, false) then
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

function StormPromoCheck(iPlayer, iUnitID, iX, iY)
	local uUnit = Players[iPlayer]:GetUnitByID(iUnitID);
	if uUnit then
		local pPlot = Map.GetPlot(iX, iY);
		if pPlot then
			MBPpromoAddRemoveOnMove(uUnit, pPlot);
		end
	end
end
GameEvents.UnitSetXY.Add(StormPromoCheck)

MBPtestArtModel();
MBPwaterCounter();