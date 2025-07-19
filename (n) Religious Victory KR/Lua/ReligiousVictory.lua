-- ReligiousVictory
-- Author: Stephen
-- DateCreated: 6/12/2014 9:25:15 PM
--------------------------------------------------------------
-- Global Tables
g_EVCReligiousSpread = {};

-- Global Variables
g_EVCReligiousVictoryWon = false;

-- Persistent Data
local db = Modding.OpenSaveData();
local eSage = GameInfoTypes.UNIT_SAGE;
local eAscend = GameInfoTypes.BUILD_SAGE;
local eDominant = GameInfoTypes.BUILDING_D_RV;
local eHS = GameInfoTypes.IMPROVEMENT_HOLY_SITE;
local GreatSageDiploModifier = GameInfoTypes.DIPLOMODIFIER_GREATSAGE


-- Check to see if the victory is enabled
local religiousVictory = GameInfo.Victories["VICTORY_RELIGIOUS"];
local bVictoryEnabled = true;
if db.GetValue("EVC_VICTORY_"..religiousVictory.ID) == 0 then
	bVictoryEnabled = false;
end
-- bVictoryEnabled is true by default, to make it compatible with previous version saves

-- Populates the global variables when the game starts or is reloaded
function InitializeReligiousVictoryProgress()
	if bVictoryEnabled then
		GetReligionSpread();
	end
end

Events.SequenceGameInitComplete.Add(InitializeReligiousVictoryProgress);


-- Calculates Religious Victory progress at the start of each players' turn
function CalculateReligiousVictoryProgress(iPlayer)
	if bVictoryEnabled then
		GetReligionSpread();
		local pPlayer = Players[iPlayer];

		-- Allows the player to purchase great sages if they are dominant
		local eReligion = pPlayer:GetOwnedReligion()
		if eReligion ~= -1 then
			--print("Testing for Religious Victory");
			--print("Player "..iPlayer.." Spread: "..g_EVCReligiousSpread[eReligion]);
			local iDenominator = GetDenominator(pPlayer);
			local pCapital = pPlayer:GetCapitalCity()
			iDominant = pCapital:GetNumBuilding(eDominant)
			if (g_EVCReligiousSpread[eReligion] >= iDenominator) and (iDominant == 0) then
				pCapital:SetNumRealBuilding(eDominant, 1)
				if pPlayer:IsHuman() then
					Events.GameplayAlertMessage(Locale.ConvertTextKey("이제 당신의 종교가 지배적입니다! 수도에서 현자를 구매할 수 있습니다!"))
				end
			elseif (g_EVCReligiousSpread[eReligion] <= iDenominator) and (iDominant == 1) then
				pCapital:SetNumRealBuilding(eDominant, 0)
				if pPlayer:IsHuman() then
					Events.GameplayAlertMessage(Locale.ConvertTextKey("당신의 종교는 더 이상 지배적이지 않습니다..."))
				end
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(CalculateReligiousVictoryProgress);


--when the meditation finishes, win the game!
print("load declare religious winner");
function DeclareReligiousWinner(iPlayer, iUnit, iX, iY, iBuild)
	local pPlayer = Players[iPlayer]
	if not pPlayer:IsAlive() then return end
	if iBuild == eAscend then
		print("Religious Victory Declared!");
		g_EVCReligiousVictoryWon = true;
		Game.SetWinner(pPlayer:GetTeam(), GameInfo.Victories["VICTORY_RELIGIOUS"].ID);
	end
end

GameEvents.PlayerBuilt.Add(DeclareReligiousWinner);


-- Updates the spread table with the new percentages for each religion
function GetReligionSpread()
	--print("GetReligionSpread fires");

	for iPlayerLoop = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		
		local pPlayer = Players[iPlayerLoop];

		if pPlayer:IsEverAlive() then
			local eReligion = pPlayer:GetOwnedReligion()
			if eReligion ~= -1 then				
				--local religion = GameInfo.Religions[eReligion];
				--print(religion.Description);
				local iCitiesFollowing = Game.GetNumCitiesFollowing(eReligion);
				--print("Cities Following: "..iCitiesFollowing);
				local iTotalCities = Game.GetNumCities();
				--print("Total Cities: "..iTotalCities);
				local fSpread = round((iCitiesFollowing/iTotalCities)*100);
				--print("Spread: "..fSpread);

				g_EVCReligiousSpread[eReligion] = fSpread;
			end
		end
	end
end

function GetDenominator(pPlayer)
	local iHS = pPlayer:GetImprovementCount(eHS, true)
	if pPlayer:HasTrait(GameInfoTypes.TRAIT_JAR_TIBET) then
		iHS = pPlayer:GetImprovementCount(GameInfoTypes.IMPROVEMENT_JAR_DZONG, true)
	end
	local iEra = pPlayer:GetCurrentEra()
	local iDenominator = 100 - 2 * iEra - 3 * iHS
	return iDenominator
end


function WarnOfGreatSage(iPlayer, iUnit, iUnitType, iPlotX, iPlotY)
	if iUnitType ~= eSage then return end
	print("great sage detected");
	local pPlayer = Players[iPlayer]
	local pCapital = pPlayer:GetCapitalCity()
	local sName = pCapital:GetName()
	for iOtherPlayer = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do 
		local pOtherPlayer = Players[iOtherPlayer]
		-- check to make sure we're not looking at ourselves and that both people are alive
		if ((pPlayer ~= pOtherPlayer) and (pPlayer:IsAlive()) and (pOtherPlayer:IsAlive())) then
			if pOtherPlayer:IsHuman() then 	
				pOtherPlayer:AddNotification(NotificationTypes.NOTIFICATION_INSTANT_YIELD, 
				'현자가 탄생한 도시: '..sName..'',
				'현자의 위치: '..sName, 
				iPlotX, iPlotY, pCapital:GetID())
			else
				local eApproach = pPlayer:GetMajorCivApproach(iOtherPlayer)
				--print(eApproach)
				if eApproach < MajorCivApproachTypes.MAJOR_CIV_APPROACH_FRIENDLY then
					local otherplayerteam_ID = pOtherPlayer:GetTeam();
					local otherplayerteam = Teams[otherplayerteam_ID];
					--not allowed to declare if you are someone's vassal
					if not otherplayerteam:IsVassalOfSomeone() then
						local playerteam_ID = pPlayer:GetTeam();
						local playerteam = Teams[playerteam_ID];
						otherplayerteam:Meet( playerteam, true );
						playerteam:Meet( otherplayerteam, true );
						otherplayerteam:DeclareWar( playerteam, true );
					end
				end
			end
		end
	end
end

GameEvents.UnitCreated.Add(WarnOfGreatSage);


function Jar_GreatSageDiploModifier(iDiploModifier, iFromPlayer, iToPlayer)
    local iModifier = 0
    local pToPlayer = Players[iToPlayer]
    local pFromPlayer = Players[iFromPlayer];
    if iDiploModifier == GreatSageDiploModifier then
        --if pToPlayer:GetUnitClassCount(GameInfoTypes.UNITCLASS_SAGE) > 0 then
        --    iModifier = 150 -- any positive number is a negative diplo
        --end
	-- get the ToPlayer's religion
	local eReligion = pToPlayer:GetOwnedReligion()
	if eReligion == -1 then
		return iModifier  -- will be zero
	end
	-- negative if the religion is too spread, less if u follow it too
	local iEra = pToPlayer:GetCurrentEra();
	local iDenominator = GetDenominator(pToPlayer);
	-- make it 70 but reduced by holy sites
	local threshold = iDenominator + iEra * 2 - 30
	local spread = g_EVCReligiousSpread[eReligion]
	local multiplier = 1
	if spread >= iDenominator then
		multiplier = 2
	end
	if spread >= threshold and pFromPlayer:HasReligionInMostCities(eReligion) then
		iModifier = 30 * multiplier
	elseif spread >= threshold then
		iModifier = 75 * multiplier
	end
    end
    return iModifier
end

GameEvents.GetDiploModifier.Add(Jar_GreatSageDiploModifier);

-- Handy function (borrowed) for rounding numbers, so we can turn floats into integers
function round(num, idp)
  local mult = 10^(idp or 0)
  return math.floor(num * mult + 0.5) / mult
end

print("everything loaded")