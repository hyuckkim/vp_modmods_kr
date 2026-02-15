function RPTCexplorationLimiter(iPlotX, iPlotY, iTeam, iFromTeam, bFirst, iUnitOwner, iUnit)
	--print(iUnitOwner);
	local pPlayer = Players[iUnitOwner];
	if pPlayer == nil then return end
	local uUnit = pPlayer:GetUnitByID(iUnit);
	if uUnit == nil then return end
	if uUnit:GetUnitCombatType() ~= GameInfoTypes.UNITCOMBAT_RECON then
		uUnit:SetMoves(0);
	end
end

GameEvents.TileRevealed.Add(RPTCexplorationLimiter);