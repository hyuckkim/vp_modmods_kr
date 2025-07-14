local iReconUnitCombat = GameInfoTypes.UNITCOMBAT_RECON;
local iSurvFinish = GameInfoTypes.PROMOTION_SURV_FINISHER;
local iSurvCombat = GameInfoTypes.PROMOTION_SURV_COMBAT;
local iTBfinish = GameInfoTypes.PROMOTION_TB_FINISHER;
local iTBplague = GameInfoTypes.PROMOTION_SCREENED;
local iParaClass = GameInfoTypes.UNITCLASS_PARATROOPER;
local iParaCS = GameInfo.Units[GameInfoTypes.UNIT_PARATROOPER].Combat;
local iReconCombatPromo = GameInfoTypes.PROMOTION_RECON_COMBAT;
local iReconPeacePromo = GameInfoTypes.PROMOTION_CCDCONCEALED;
local iExplorationBalancePromo = GameInfoTypes.PROMOTION_PATHFINDER_2;
local iReconHealPromo = GameInfoTypes.PROMOTION_RECONHEAL;
local iReconSabotagedPromo = GameInfoTypes.PROMOTION_SABOTAGED;
local iMed2Promo = GameInfoTypes.PROMOTION_MEDIC_II;
local iMedFinish = GameInfoTypes.PROMOTION_MEDIC_FINISHER;
local iMedCombat = GameInfoTypes.PROMOTION_MEDIC_COMBAT;
local iFortImprovement = GameInfoTypes.IMPROVEMENT_FORT;
local iCitadelImprovement = GameInfoTypes.IMPROVEMENT_CITADEL;
local iSurv1Promo = GameInfoTypes.PROMOTION_SURVIVALISM_1;
local iSurv2Promo = GameInfoTypes.PROMOTION_SURVIVALISM_2;
local iSurv3Promo = GameInfoTypes.PROMOTION_SURVIVALISM_3;
local iForestFeature = GameInfoTypes.FEATURE_FOREST;
local iJungleFeature = GameInfoTypes.FEATURE_JUNGLE;
local iMarshFeature = GameInfoTypes.FEATURE_MARSH;
local iOasisFeature = GameInfoTypes.FEATURE_OASIS;
local iTB3Promo = GameInfoTypes.PROMOTION_WOODLAND_TRAILBLAZER_3;
local iTB2Promo = GameInfoTypes.PROMOTION_WOODLAND_TRAILBLAZER_2;
local iTB1Promo = GameInfoTypes.PROMOTION_WOODLAND_TRAILBLAZER_1;
local iReconEmbarkPromo = GameInfoTypes.PROMOTION_RECON_EMBARKED;
local iScout3Promo = GameInfoTypes.PROMOTION_SCOUTING_FINISHER;
local iScoutCombatPromo = GameInfoTypes.PROMOTION_SCOUTING_COMBAT;

function CRpreCombat(uUnit)
	uUnit:SetHasPromotion(iReconPeacePromo, true);
	uUnit:SetBaseRangedCombatStrength(math.floor(uUnit:GetBaseCombatStrength()/2));
	local iPlayer = uUnit:GetOwner();
	if Game.GetActivePlayer() == iPlayer and Players[iPlayer]:IsHuman() then
		uUnit:GetPlot():AddPopupMessage(Locale.ConvertTextKey("TXT_KEY_PROMOTION_CCDCONCEALED"), 0, iPlayer);
	end
	print("added concealed")
end

function CRpostCombat(uUnit)
	local bExplorationBalancePromo = uUnit:IsHasPromotion(iExplorationBalancePromo);
	uUnit:SetBaseRangedCombatStrength(0);
	local uNewUnit = uUnit:UpgradeTo(uUnit:GetUnitType(), true);
	if bExplorationBalancePromo then
		uNewUnit:SetHasPromotion(iExplorationBalancePromo, true);
	end
	print('upgrading unit to make visible and reset range strength to default');
	return uNewUnit;
end

GameEvents.PlayerDoTurn.Add(function(iPlayer)
	local pPlayer = Players[iPlayer];
	if pPlayer == nil then return end
	local iCurrentTurn = Game.GetGameTurn();
	for uUnit in pPlayer:Units() do
		if uUnit:GetUnitCombatType() == iReconUnitCombat then
			if (GameInfo.Units[uUnit:GetUnitType()].Combat < iParaCS) and not (uUnit:GetUnitClassType() == iParaClass) then
				if uUnit:IsHasPromotion(iReconCombatPromo) and (iCurrentTurn - uUnit:GetTurnPromotionGained(iReconCombatPromo) > 1) then
					if uUnit:IsEmbarked() or uUnit:IsOnTerrain(TerrainTypes.TERRAIN_MOUNTAIN) then
						uUnit:SetHasPromotion(iReconEmbarkPromo, true);
					else
						CRpreCombat(uUnit);
					end
				end
			elseif uUnit:GetInvisibleType() == 0 then
				uUnit:SetHasPromotion(iReconPeacePromo, false);
				CRpostCombat(uUnit);
			else
				uUnit:SetHasPromotion(iReconEmbarkPromo, false);
				uUnit:SetHasPromotion(iReconCombatPromo, false);
			end
			if uUnit:IsHasPromotion(iSurvCombat) and (iCurrentTurn - uUnit:GetTurnPromotionGained(iSurvCombat) > 1) then
				uUnit:SetHasPromotion(iSurvFinish, true);
				print("added surv4")
			end
			if uUnit:IsHasPromotion(iScoutCombatPromo) and (iCurrentTurn - uUnit:GetTurnPromotionGained(iScoutCombatPromo) > 1) then
				uUnit:SetHasPromotion(iScout3Promo, true);
				print("added scout3")
			end
			if uUnit:IsHasPromotion(iMedCombat) and (iCurrentTurn - uUnit:GetTurnPromotionGained(iMedCombat) > 1) then
				uUnit:SetHasPromotion(iMedFinish, true);
				print("added med3")
			end
		end
	end
end)

function CRendTurn(iPlayer)
	local pPlayer = Players[iPlayer];
	if pPlayer == nil then return end
	for uUnit in pPlayer:Units() do
		if uUnit:GetUnitCombatType() == iReconUnitCombat then
			if (GameInfo.Units[uUnit:GetUnitType()].Combat < iParaCS) and not (uUnit:GetUnitClassType() == iParaClass) then
				if uUnit:IsEmbarked() or uUnit:IsOnTerrain(TerrainTypes.TERRAIN_MOUNTAIN) then
					if uUnit:GetInvisibleType() == 0 then
						uUnit:SetHasPromotion(iReconPeacePromo, false);
						local pMissionPlot = uUnit:LastMissionPlot()
						local uEmbarkUnit = CRpostCombat(uUnit);
						uEmbarkUnit:SetMoves(uEmbarkUnit:MaxMoves());
						uEmbarkUnit:SetHasPromotion(iReconEmbarkPromo, true);
						if pMissionPlot ~= nil then
							uEmbarkUnit:PushMission(MissionTypes.MISSION_MOVE_TO, pMissionPlot:GetX(), pMissionPlot:GetY(), 0, 0, 1, MissionTypes.MISSION_MOVE_TO, Map.GetPlot(pMissionPlot:GetX(), pMissionPlot:GetY()), uEmbarkUnit)
						end
						if Game.GetActivePlayer() == iPlayer and pPlayer:IsHuman() then
							uEmbarkUnit:AddPopupMessage(Locale.ConvertTextKey("TXT_KEY_PROMOTION_RECON_EMBARKED"), 0, iPlayer);
						end
					end
				else
					if uUnit:IsHasPromotion(iReconPeacePromo) then
					elseif not uUnit:IsHasPromotion(iReconCombatPromo) then
						uUnit:SetHasPromotion(iReconEmbarkPromo, false);
						CRpreCombat(uUnit);
					end
				end
			end
		end
	end
end
GameEvents.PlayerEndTurnCompleted.Add(CRendTurn);
--GameEvents.PlayerDoneTurn.Add(CRendTurn);


GameEvents.CombatEnded.Add(function(iAttackingPlayer, iAttackingUnit, iAttackerDamage, iAttackerFinalDamage, iAttackerMaxHP, iDefendingPlayer, iDefendingUnit, iDefenderDamage, iDefenderFinalDamage, iDefenderMaxHP, iInterceptingPlayer, iInterceptingUnit, iInterceptorDamage, iPlotX, iPlotY)
	local pAttackingPlayer = Players[ iAttackingPlayer ];
	local pDefendingPlayer = Players[ iDefendingPlayer ];
	local uDefendingUnit = pDefendingPlayer:GetUnitByID( iDefendingUnit );
	local uAttackingUnit = pAttackingPlayer:GetUnitByID( iAttackingUnit );

	if pAttackingPlayer then
		local attackerHealth = iAttackerMaxHP - iAttackerFinalDamage;
		-- outofattacks check needed if rangedsupportfire is enabled (not enabled in v5)
		if attackerHealth > 0 and uAttackingUnit:IsOutOfAttacks() then
			if uAttackingUnit:GetUnitCombatType() == iReconUnitCombat then
				if (GameInfo.Units[uAttackingUnit:GetUnitType()].Combat < iParaCS) and not (uAttackingUnit:GetUnitClassType() == iParaClass) then
					if uAttackingUnit:IsEmbarked() and not uAttackingUnit:IsHasPromotion(iReconCombatPromo) then
						uAttackingUnit:SetHasPromotion(iReconCombatPromo, true);
						if Game.GetActivePlayer() == iAttackingPlayer and pAttackingPlayer:IsHuman() then
							uAttackingUnit:GetPlot():AddPopupMessage(Locale.ConvertTextKey("TXT_KEY_PROMOTION_RECON_COMBAT"), 0, iAttackingPlayer);
						end
					end
					if uAttackingUnit:GetInvisibleType() == 0 and not uAttackingUnit:IsHasPromotion(iReconPeacePromo) then
						local uNewAUnit = CRpostCombat(uAttackingUnit);
					end
				end
				if not (uDefendingUnit:IsOnImprovement(iFortImprovement) or uDefendingUnit:IsOnImprovement(iCitadelImprovement) or uDefendingUnit:IsGarrisoned()) then
					if uAttackingUnit:IsHasPromotion(iTBfinish) then
						uDefendingUnit:SetHasPromotion(iTBplague, true);
						print("added screened")
					end
					if uAttackingUnit:IsHasPromotion(iMedCombat) then
						uDefendingUnit:SetHasPromotion(iReconSabotagedPromo, true);
						print("added sabotaged")
					end
				end
				if uAttackingUnit:IsHasPromotion(iTBfinish) and (iDefenderFinalDamage >= iDefenderMaxHP) then
					uAttackingUnit:ChangeMoves(1);
				end
			end
		end
	end

	if pDefendingPlayer then
		local defenderHealth = iDefenderMaxHP - iDefenderFinalDamage;
		if defenderHealth > 0 then
			if uDefendingUnit:GetUnitCombatType() == iReconUnitCombat then
				if (GameInfo.Units[uDefendingUnit:GetUnitType()].Combat < iParaCS) and not (uDefendingUnit:GetUnitClassType() == iParaClass) then
					if uDefendingUnit:IsRanged() and uDefendingUnit:GetFortifyTurns() > -1 then
						uDefendingUnit:SetHasPromotion(iReconPeacePromo, true);
						uDefendingUnit:SetHasPromotion(iReconCombatPromo, false);
					end
					if uDefendingUnit:IsEmbarked() and not uDefendingUnit:IsHasPromotion(iReconCombatPromo) then
						uDefendingUnit:SetHasPromotion(iReconCombatPromo, true);
						if Game.GetActivePlayer() == iDefendingPlayer and pDefendingPlayer:IsHuman() then
							uDefendingUnit:GetPlot():AddPopupMessage(Locale.ConvertTextKey("TXT_KEY_PROMOTION_RECON_COMBAT"), 0, iDefendingPlayer);
						end
					end
					if uDefendingUnit:GetInvisibleType() == 0 and not uDefendingUnit:IsHasPromotion(iReconPeacePromo) then
						local uNewDUnit = CRpostCombat(uDefendingUnit);
						uNewDUnit:SetMoves(uNewDUnit:MaxMoves());
					end
				end
			end
		end
		if uDefendingUnit:IsHasPromotion(iReconSabotagedPromo) then
			if not uAttackingUnit:IsRanged() then
				uAttackingUnit:SetHasPromotion(iReconHealPromo, true);
				print("added recon heal")
			end
		end
	end
end)

GameEvents.CityTrained.Add(function(iCityOwner, iCity, iUnit, bGold, bFaith)
	local pPlayer = Players[ iCityOwner ];
	if pPlayer == nil then return end
	local uUnit = pPlayer:GetUnitByID( iUnit );
	if uUnit == nil then return end
	if uUnit:GetUnitCombatType() == iReconUnitCombat then
		if (GameInfo.Units[uUnit:GetUnitType()].Combat < iParaCS) and not (uUnit:GetUnitClassType() == iParaClass) then
			local cCity = pPlayer:GetCityByID(iCity);
			if cCity == nil then
				CRpreCombat(uUnit);
			elseif cCity:GetDamage() == 0 and not cCity:IsBlockaded() and not cCity:IsResistance() then
				CRpreCombat(uUnit);
			else
				uUnit:SetHasPromotion(iReconCombatPromo, true);
				if Game.GetActivePlayer() == iCityOwner and pPlayer:IsHuman() then
					uUnit:GetPlot():AddPopupMessage(Locale.ConvertTextKey("TXT_KEY_PROMOTION_RECON_COMBAT"), 0, iCityOwner);
				end
			end
		end
	end
end)

GameEvents.TileImprovementChanged.Add( function (iPlotX, iPlotY, iPlotOwner, iOldImprovement, iNewImprovement, bPillaged)
	if bPillaged then
		local pPlot = Map.GetPlot(iPlotX, iPlotY);
		if pPlot and not pPlot:IsWater() then
			for i = 0, pPlot:GetNumUnits() - 1 do
				local uUnit = pPlot:GetUnit(i);
				local iMovesLeft = uUnit:GetMoves()-60;
				if uUnit:IsHasPromotion(iReconPeacePromo) or uUnit:IsHasPromotion(iReconEmbarkPromo) then
					uUnit:SetHasPromotion(iReconPeacePromo, false);
					uUnit:SetHasPromotion(iReconEmbarkPromo, false);
					local uNewPUnit = CRpostCombat(uUnit);
					uUnit = uNewPUnit;
					uUnit:SetHasPromotion(iReconCombatPromo, true);
					if Game.GetActivePlayer() == iPlotOwner and Players[iPlotOwner]:IsHuman() then
						pPlot:AddPopupMessage(Locale.ConvertTextKey("TXT_KEY_PROMOTION_RECON_COMBAT"), 0, iPlotOwner);
					end
					uUnit:SetMoves(math.max(0, iMovesLeft));
				elseif uUnit:IsHasPromotion(iReconCombatPromo) then
					uUnit:SetHasPromotion(iReconCombatPromo, false);
					uUnit:SetHasPromotion(iReconCombatPromo, true);
				end
				if uUnit:IsHasPromotion(iScout3Promo) or uUnit:IsHasPromotion(iScoutCombatPromo) then
					iMovesLeft = iMovesLeft + 30;
					uUnit:SetMoves(math.max(0, iMovesLeft));
				end
			end
		end
	end
end)

GameEvents.UnitSetXY.Add(function (playerID, unitID, iPlotX, iPlotY)
	local pPlayer = Players[playerID];
	if pPlayer == nil then return end
	local uUnit = pPlayer:GetUnitByID(unitID);
	if uUnit == nil then return end
	if uUnit:IsHasPromotion(iReconSabotagedPromo) then
		uUnit:SetHasPromotion(iReconSabotagedPromo, false);
	end
	if uUnit:IsHasPromotion(iReconHealPromo) then
		uUnit:SetHasPromotion(iReconHealPromo, false);
	end
	if uUnit:IsEmbarked() then
	else
		if not uUnit:IsHasPromotion(iReconCombatPromo) then
			if uUnit:IsHasPromotion(iTB1Promo) then
				local plot = uUnit:GetPlot();
				if plot == nil then return end
				local plotFeature = plot:GetFeatureType();
				if plotFeature == iForestFeature or plotFeature == iJungleFeature then
					uUnit:SetDamage((uUnit:GetDamage()-1));
					print('1 hp from forest/jungle');
				end
			end
			if uUnit:IsHasPromotion(iTB2Promo) then
				if uUnit:IsOnFeature(iMarshFeature) or uUnit:IsOnFeature(iOasisFeature) then
					uUnit:SetDamage((uUnit:GetDamage()-1));
					print('1 hp from marsh/oasis');
				end
			end
			if uUnit:IsHasPromotion(iSurv2Promo) and uUnit:GetPlot():IsFreshWater() then
				uUnit:SetDamage((uUnit:GetDamage()-1));
				print('1 hp from fresh water');
			elseif uUnit:IsHasPromotion(iSurv1Promo) and uUnit:GetPlot():IsRiver() then
				uUnit:SetDamage((uUnit:GetDamage()-1));
				print('1 hp from river');
			end
		end
	end
end)

GameEvents.CanHavePromotion.Add(function(iUnitOwner, iUnit, iPromotion)
	local promoPlayer = Players[iUnitOwner];
	local promoUnit = promoPlayer:GetUnitByID(iUnit);
	if promoUnit:GetUnitCombatType() == GameInfoTypes.UNITCOMBAT_RECON then
		if iPromotion == iSurv3Promo and (promoUnit:IsHasPromotion(iTB3Promo) or promoUnit:IsHasPromotion(iMed2Promo)) then
			return false;
		elseif iPromotion == iTB3Promo and (promoUnit:IsHasPromotion(iSurv3Promo) or promoUnit:IsHasPromotion(iMed2Promo)) then
			return false;
		elseif iPromotion == iMed2Promo and (promoUnit:IsHasPromotion(iSurv3Promo) or promoUnit:IsHasPromotion(iTB3Promo)) then
			return false;
		elseif iPromotion == iScout3Promo and (promoUnit:IsHasPromotion(iSurvFinish) or promoUnit:IsHasPromotion(iTBfinish) or promoUnit:IsHasPromotion(iMedFinish)) then
			return false;
		elseif iPromotion == iSurvFinish and (promoUnit:IsHasPromotion(iScout3Promo) or promoUnit:IsHasPromotion(iTBfinish) or promoUnit:IsHasPromotion(iMedFinish)) then
			return false;
		elseif iPromotion == iTBfinish and (promoUnit:IsHasPromotion(iSurvFinish) or promoUnit:IsHasPromotion(iScout3Promo) or promoUnit:IsHasPromotion(iMedFinish)) then
			return false;
		elseif iPromotion == iMedFinish and (promoUnit:IsHasPromotion(iSurvFinish) or promoUnit:IsHasPromotion(iTBfinish) or promoUnit:IsHasPromotion(iScout3Promo)) then
			return false;
		end
	end
	return true;
end)
--buggy
--[[
function CRunitSelect(PlayerID, UnitID, hexX, hexY, k, isSelected, arg6)
	if isSelected then
		if Game.GetActivePlayer() == PlayerID then
			local pPlayer = Players[PlayerID];
			if pPlayer:IsHuman() then
				local uUnit = pPlayer:GetUnitByID(UnitID);
				if uUnit:IsHasPromotion(iReconPeacePromo) then
					uUnit:GetPlot():AddPopupMessage(Locale.ConvertTextKey("TXT_KEY_PROMOTION_CCDCONCEALED"), 0, PlayerID);
				elseif uUnit:IsHasPromotion(iReconCombatPromo) then
					uUnit:GetPlot():AddPopupMessage(Locale.ConvertTextKey("TXT_KEY_PROMOTION_RECON_COMBAT"), 0, PlayerID);
				elseif uUnit:IsHasPromotion(iReconEmbarkPromo) then
					uUnit:GetPlot():AddPopupMessage(Locale.ConvertTextKey("TXT_KEY_PROMOTION_RECON_EMBARKED"), 0, PlayerID);
				end
			end
		end
	end
end

Events.UnitSelectionChanged.Add(CRunitSelect)
]]--