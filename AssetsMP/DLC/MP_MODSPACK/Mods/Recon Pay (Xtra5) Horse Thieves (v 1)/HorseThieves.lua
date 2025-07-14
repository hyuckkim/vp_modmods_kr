local iHorseThievesPromo = GameInfoTypes.PROMOTION_HORSE_THIEVES;
local iHorseTheftPromo = GameInfoTypes.PROMOTION_HORSE_THEFT;
local iHorseResource = GameInfoTypes.RESOURCE_HORSE;
local iMountedUnitType = GameInfoTypes.UNITCOMBAT_MOUNTED;

function AddHorseTheft(uUnit, pPlayer, iPlayer, pPlot)
	if not uUnit:IsHasPromotion(iHorseTheftPromo) then
		uUnit:SetHasPromotion(iHorseTheftPromo, true);
		HorseTheftNotifier(pPlayer, iPlayer, pPlot)
	end
end

function HorseTheftNotifier(pPlayer, iPlayer, pPlot)
	if pPlayer:IsHuman() then
		pPlot:AddPopupMessage(Locale.ConvertTextKey("TXT_KEY_PROMOTION_HORSE_THEFT"), 0, iPlayer);
	end
end

function HorseThievesPillageCheck(iPlotX, iPlotY, iPlotOwner, iOldImprovement, iNewImprovement, bPillaged)
	--print("improvement change hooked");
	if bPillaged then
		print("improvement pillaged");
		local pPlot = Map.GetPlot(iPlotX, iPlotY);
		if pPlot == nil then return end
		if pPlot:HasResource(iHorseResource) then
			for i = 0, pPlot:GetNumUnits() - 1 do
				local uUnit = pPlot:GetUnit(i);
				if uUnit:IsHasPromotion(iHorseThievesPromo) then
					local iUnitOwner = uUnit:GetOwner();
					AddHorseTheft(uUnit, Players[iUnitOwner], iUnitOwner, pPlot)
				end
			end
		else
			for i = 0, pPlot:GetNumUnits() - 1 do
				local uUnit = pPlot:GetUnit(i);
				if uUnit:IsHasPromotion(iHorseTheftPromo) then
					uUnit:SetHasPromotion(iHorseTheftPromo, false);
					local iMaxUnitMoves = uUnit:MaxMoves();
					if uUnit:GetMoves() > iMaxUnitMoves then
						uUnit:SetMoves(iMaxUnitMoves);
					end
				end
			end
		end
	end
end
GameEvents.TileImprovementChanged.Add(HorseThievesPillageCheck)

function HorseThievesPostCombat (iAttackingPlayer, iAttackingUnit, iAttackerDamage, iAttackerFinalDamage, iAttackerMaxHP, iDefendingPlayer, iDefendingUnit, iDefenderDamage, iDefenderFinalDamage, iDefenderMaxHP, iInterceptingPlayer, iInterceptingUnit, iInterceptorDamage, iPlotX, iPlotY)
	local pAttackingPlayer = Players[ iAttackingPlayer ];
	if pAttackingPlayer == nil then return end
	local uAttackingUnit = pAttackingPlayer:GetUnitByID( iAttackingUnit );
	if uAttackingUnit == nil then return end
	if uAttackingUnit:IsHasPromotion(iHorseThievesPromo) then
		local pDefendingPlayer = Players[iDefendingPlayer];
		if pDefendingPlayer == nil then return end
		local uDefendingUnit = pDefendingPlayer:GetUnitByID(iDefendingUnit);
		if uDefendingUnit == nil then return end
		if uDefendingUnit:GetUnitCombatType() == iMountedUnitType then
			AddHorseTheft(uAttackingUnit, pAttackingPlayer, iAttackingPlayer, uAttackingUnit:GetPlot())
		end
	end
end
GameEvents.CombatEnded.Add(HorseThievesPostCombat)

function playerHasHorsesToSteal(pPlayer)
	return (pPlayer:GetNumResourceTotal(iHorseResource, true) > 0) and (pPlayer:GetNumResourceAvailable(iHorseResource, true) >= 0);
end

function playerAllPlotsHorsesAvailable(pUnitPlayer, iUnitPlayer, pPlotOwner, iPlotOwner)
	if playerHasHorsesToSteal(pPlotOwner) then
		if iUnitPlayer == iPlotOwner or pUnitPlayer:IsHasDefensivePactWithPlayer(iPlotOwner) then 
			return true 
		else
			return false
		end
	else
		return false
	end
end

function UnitIsAdjacentToHorseSource(uUnit, pPlot)
	if pPlot:HasResource(iHorseResource) or pPlot:IsAdjacentToResource(iHorseResource) or uUnit:IsAdjacentToUnitCombatType(iMountedUnitType, true, false) then
		return true
	else
		return false
	end
end

function HorseThievesEval(uUnit, pUnitPlayer, iUnitPlayer)
	local pPlot = uUnit:GetPlot();
	if pPlot == nil then return end
	if pPlot:IsWater() then
		if uUnit:IsEmbarked() or pPlot:IsFeatureIce() then
			uUnit:SetHasPromotion(iHorseTheftPromo, false);
		end
	else
		local iPlotOwner = pPlot:GetOwner();
		-- owned land
		if iPlotOwner >= 0 then
			local pPlotOwner = Players[iPlotOwner]
			--allied land
			if playerAllPlotsHorsesAvailable(pUnitPlayer, iUnitPlayer, pPlotOwner, iPlotOwner) then
				AddHorseTheft(uUnit, pUnitPlayer, iUnitPlayer, pPlot)
			--unallied land
			elseif UnitIsAdjacentToHorseSource(uUnit, pPlot) then
				AddHorseTheft(uUnit, pUnitPlayer, iUnitPlayer, pPlot)
			elseif pPlot:IsCity() then
				local cPlotCity = pPlot:GetPlotCity();
				if cPlotCity:GetDamage() == 0 and not cPlotCity:IsBlockaded() and not cPlotCity:IsResistance() and playerHasHorsesToSteal(pPlotOwner) then
					AddHorseTheft(uUnit, pUnitPlayer, iUnitPlayer, pPlot)
				end
			end
		-- unowned land
		elseif UnitIsAdjacentToHorseSource(uUnit, pPlot) then
			AddHorseTheft(uUnit, pUnitPlayer, iUnitPlayer, pPlot)
		end
	end
end

function HorseThievesTurnCheck (iPlayer)
	local pPlayer = Players[iPlayer];
	if pPlayer == nil then return end
	if not pPlayer:IsAlive() then return end
	for uUnit in pPlayer:Units() do
		if uUnit:IsHasPromotion(GameInfoTypes.PROMOTION_HORSE_THIEVES) then
			HorseThievesEval(uUnit, pPlayer, iPlayer)
			uUnit:SetMoves(uUnit:MaxMoves());
		end
	end
end
GameEvents.PlayerDoTurn.Add(HorseThievesTurnCheck)

function HorseThievesMovementCheck(playerID, unitID, iPlotX, iPlotY)
	local pPlayer = Players[playerID];
	if pPlayer == nil then return end
	local uUnit = pPlayer:GetUnitByID(unitID);
	if uUnit == nil then return end
	if uUnit:IsHasPromotion(GameInfoTypes.PROMOTION_HORSE_THIEVES) then
		HorseThievesEval(uUnit, pPlayer, playerID)
	end
end
GameEvents.UnitSetXY.Add(HorseThievesMovementCheck)
