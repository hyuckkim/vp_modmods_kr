--print("EH loaded")
local EHexploredLandCounts = {};
local EHinitialized = false;

function EHTurnStart(iPlayer)
	--print("EH Turn Start")
	local pPlayer = Players[iPlayer];
	if not pPlayer:IsMinorCiv() then
		--print("EH non-minor civ found")
		if pPlayer:IsBarbarian() or not EHinitialized then
			EHexploredLandCounter();
		end
		if not pPlayer:IsBarbarian() then
			--print("Major evaluated for EH");
			local iTotalReconXP = SumActiveReconXP(pPlayer);
			for uUnit in pPlayer:Units() do
				evalReconXP(uUnit, iTotalReconXP);
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(EHTurnStart)

function EHexploredLandCounter()
	EHexploredLandCounts = {};
	collectgarbage();
	for i = 0, Map.GetNumPlots()-1, 1 do
		local plot = Map.GetPlotByIndex(i);
		if not plot:IsWater() then
			for iPlayer = 0, GameDefines.MAX_CIV_PLAYERS-1, 1 do
				local pPlayer = Players[iPlayer];
				local tTeam = Teams[pPlayer:GetTeam()];
				if plot:IsRevealed(iTeam) then
					if EHexploredLandCounts[iPlayer] then
						EHexploredLandCounts[iPlayer] = EHexploredLandCounts[iPlayer] + 1;
					else
						EHexploredLandCounts[iPlayer] = 1;
					end
				end
			end
		end
	end
	EHinitialized = true;
	--print("EH Discovered Land Counts Updated");
end

function evalReconXP(pUnit, iTotalReconXP)
	if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_EXPLORATION_HERITAGE) and pUnit:GetCurrHitPoints() == pUnit:GetMaxHitPoints() then
		local pUnitClass = pUnit:GetUnitClassType();
		local pUnitType = pUnit:GetUnitType();
		if (GameInfo.Units[pUnitType].Combat >= GameInfo.Units[GameInfoTypes.UNIT_PARATROOPER].Combat) or pUnitClass == GameInfoTypes.UNITCLASS_PARATROOPER then
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_EXPLORATION_HERITAGE, false);
			--print("EH promo removed");
		else
			addReconXP(pUnit, iTotalReconXP);
			--print("EH eligible unit found");
		end
	end
end

function addReconXP(uUnit, iTotalReconXP)
	local iTeam = uUnit:GetTeam();
	local iPlayer = uUnit:GetOwner();
	local pPlayer = Players[iPlayer];
	local unusedReconXP = EHexploredLandCounts[iPlayer] - iTotalReconXP;
	if unusedReconXP > 0 then
		local iPlotX = uUnit:GetX();
		local iPlotY = uUnit:GetY();
		local cCapital = pPlayer:GetCapitalCity();
		local iCapitalX = cCapital:GetX();
		local iCapitalY = cCapital:GetY();

		local iReconXP = math.floor(Map.PlotDistance(iPlotX, iPlotY, iCapitalX, iCapitalY) / 2);
		if iReconXP > 0 then
			local iCurrentXP = uUnit:GetExperience();
			uUnit:SetExperience(iReconXP + iCurrentXP);
			if pPlayer:IsHuman() then
				local sUnitName = uUnit:GetName();
				-- local sXPtext = Locale.ConvertTextKey("TXT_KEY_RECON_PRETEXT") .. " " .. iReconXP .. " " .. Locale.ConvertTextKey("TXT_KEY_RECON_ENDTEXT") .. " " .. sUnitName .. "!";
				local sXPheader = Locale.ConvertTextKey("TXT_KEY_RECON_HEADER");
				-- pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, sXPtext, sXPheader, iPlotX, iPlotY, -1, -1);
				-- uUnit:AddMessage(sXPheader);
				local pPlot = Map.GetPlot(iPlotX, iPlotY);
				pPlot:AddPopupMessage("[COLOR_XP_BLUE]" .. sXPheader .. "[ENDCOLOR]", 0, iPlayer);
			end
		end
	end
end

function SumActiveReconXP(pPlayer)
	local iActiveReconXP = 0;
	for pUnit in pPlayer:Units() do
		local pUnitCombat = pUnit:GetUnitCombatType();
		if (pUnitCombat == GameInfoTypes.UNITCOMBAT_RECON) then
			iActiveReconXP = iActiveReconXP + pUnit:GetExperience();
		end
	end
	--print("EH active recon XP summed");
	return iActiveReconXP;
end
