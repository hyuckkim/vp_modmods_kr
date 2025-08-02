print ("Spy Scripts")

--SaveUtils
WARN_NOT_SHARED = false; include( "SaveUtils" ); MY_MOD_NAME = "Great Spy Scripts";

local bSpyDummy1 = GameInfoTypes.BUILDING_TOMATEKH_SPY_DUMMY_1;
local bSpyDummy2 = GameInfoTypes.BUILDING_TOMATEKH_SPY_DUMMY_2;

local bPlayer = Players[63];
local bTeam = bPlayer:GetTeam();

local SpyID = GameInfo.Units["UNIT_TOMATEKH_SPY"].ID;
local ucSpy = GameInfoTypes.UNITCLASS_TOMATEKH_SPY;
local pSpyNull = GameInfoTypes.PROMOTION_TOMATEKH_SPY_NULL;

local sCitizen = GameInfo.Specialists.SPECIALIST_CITIZEN.ID;

local bSpyCount1 = GameInfoTypes.BUILDING_TOMATEKH_SPY_DUMMY_1S;
local bSpyCount10 = GameInfoTypes.BUILDING_TOMATEKH_SPY_DUMMY_10S;
local bSpyCount100 = GameInfoTypes.BUILDING_TOMATEKH_SPY_DUMMY_100S;
local bSpyCount1000 = GameInfoTypes.BUILDING_TOMATEKH_SPY_DUMMY_1000S;
local bSpyCount10000 = GameInfoTypes.BUILDING_TOMATEKH_SPY_DUMMY_10000S;

local bSpyCountMAX = GameInfoTypes.BUILDING_TOMATEKH_SPY_DUMMY_MAX;
local bSpySpawn = GameInfoTypes.BUILDING_TOMATEKH_SPY_DUMMY_4;

local speed = Game.GetGameSpeedType();

local BaseThreshold = 250;
local BaseMultiplier = 125;
if speed == GameInfo.GameSpeeds['GAMESPEED_QUICK'].ID then
	BaseThreshold = 168;
	BaseMultiplier = 84;
elseif speed == GameInfo.GameSpeeds['GAMESPEED_STANDARD'].ID then
	BaseThreshold = 250;
	BaseMultiplier = 125;
elseif speed == GameInfo.GameSpeeds['GAMESPEED_EPIC'].ID then
	BaseThreshold = 375;
	BaseMultiplier = 188;
elseif speed == GameInfo.GameSpeeds['GAMESPEED_MARATHON'].ID then
	BaseThreshold = 750;
	BaseMultiplier = 375;
else
	BaseThreshold = 750;
	BaseMultiplier = 375;
end

local pMilitaryCaste = GameInfoTypes.POLICY_MILITARY_CASTE;

local bcWalls = GameInfoTypes.BUILDINGCLASS_WALLS;
local bcCastle = GameInfoTypes.BUILDINGCLASS_CASTLE;
local bcArsenal = GameInfoTypes.BUILDINGCLASS_ARSENAL;
local bcMilitaryBase = GameInfoTypes.BUILDINGCLASS_MILITARY_BASE;

local bcConstabulary = GameInfoTypes.BUILDINGCLASS_CONSTABLE; 
local bcPolice = GameInfoTypes.BUILDINGCLASS_POLICE_STATION;

local bcTavern = GameInfoTypes.BUILDINGCLASS_TOMATEKH_SPY_DUMMY_1_MOD; 
local isEE = (GameInfoTypes.BUILDINGCLASS_EE_TAVERN ~= nil);
if not isEE then
	bcTavern = GameInfoTypes.BUILDINGCLASS_TOMATEKH_SPY_TAVERN
elseif isEE then
	bcTavern = GameInfoTypes.BUILDINGCLASS_EE_TAVERN; 
	--	local bcBastion = GameInfoTypes.BUILDINGCLASS_EE_BASTION; 
	--	local bcFasil = GameInfoTypes.BUILDINGCLASS_EE_FASIL_GHEBBI; 
end

local bIntelAgency = GameInfoTypes.BUILDING_INTELLIGENCE_AGENCY;

local bcIntelAgency = GameInfoTypes.BUILDINGCLASS_INTELLIGENCE_AGENCY; 
local bcTArmy = GameInfoTypes.BUILDINGCLASS_TERRACOTTA_ARMY; 
local bcAlhambra = GameInfoTypes.BUILDINGCLASS_ALHAMBRA; 
local bcHCastle = GameInfoTypes.BUILDINGCLASS_HIMEJI_CASTLE; 
local bcGreatWall = GameInfoTypes.BUILDINGCLASS_GREAT_WALL; 
local bcRedFort = GameInfoTypes.BUILDINGCLASS_RED_FORT; 
local bcFirewall = GameInfoTypes.BUILDINGCLASS_GREAT_FIREWALL;

local bcSpyKremlin = GameInfoTypes.BUILDINGCLASS_SPY_KREMLIN; 

local isCiD = (GameInfoTypes.BUILDINGCLASS_JFD_JAIL ~= nil);

--	local bcLondon = GameInfoTypes.BUILDINGCLASS_JFD_TOWER_LONDON; 
--	local bcJail = GameInfoTypes.BUILDINGCLASS_JFD_JAIL; 

local isTim = (GameInfoTypes.CIVILIZATION_TIMURIDS_MOD ~= nil);

local bModBonus = GameInfoTypes.BUILDING_TOMATEKH_SPY_DUMMY_1_MOD;

--Stuff
function DecompilePlotID(sKey)
    iBreak = string.find(sKey, "Y")
    iX = tonumber(string.sub(sKey, 1, iBreak - 1))
    iY = tonumber(string.sub(sKey, iBreak + 1))
    pPlot = Map.GetPlot(iX, iY)
    return pPlot
end

function CompilePlotID(pPlot)
    iX = pPlot:GetX()
    iY = pPlot:GetY()
    return(iX .. "Y" .. iY)
end

--Store Plots
local CapitalPlots = {}

--Get Original Capital Plots at Game Start or Capital Settle
for iPlot = 0, Map.GetNumPlots() - 1, 1 do
    local pPlot = Map.GetPlotByIndex(iPlot)
	for oPlayer=0, GameDefines.MAX_MAJOR_CIVS-1 do
		local oPlayer = Players[oPlayer];
		if oPlayer:IsAlive() then
			for oCity in oPlayer:Cities() do
				if oCity:IsOriginalCapital() then
					if not Players[oCity:GetOriginalOwner()]:IsMinorCiv() and not Players[oCity:GetOriginalOwner()]:IsBarbarian() then
						local oPlot = oCity:Plot();
						if pPlot == oPlot then
							local sKey = CompilePlotID(pPlot)
							CapitalPlots[sKey] = -1
						end
					end
				end
			end
		end
    end
	for i = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS - 2 do 
		local mPlayer = Players[i];
		if mPlayer:IsAlive() then
			for mCity in mPlayer:Cities() do
				if mCity:IsOriginalCapital() then
					if not Players[mCity:GetOriginalOwner()]:IsMinorCiv() and not Players[mCity:GetOriginalOwner()]:IsBarbarian() then
						local mPlot = mCity:Plot();
						if pPlot == mPlot then
							local sKey = CompilePlotID(pPlot)
							CapitalPlots[sKey] = -1
						end
					end
				end
			end
		end
	end
end

GameEvents.PlayerCityFounded.Add(
function(iPlayer, iCityX, iCityY)
	local pPlayer = Players[iPlayer];
	local pPlot = Map.GetPlot(iCityX, iCityY);
	local pCity = pPlot:GetPlotCity();
	if (pPlayer:IsAlive()) then
		if pCity:IsOriginalCapital() then
			if not pPlayer:IsMinorCiv() and not pPlayer:IsBarbarian() then
				local sKey = CompilePlotID(pPlot)
				CapitalPlots[sKey] = -1
			end
		end
	end
end)

--Find Player's First City
function GetPlayersOriginalCity(pPlayer)
	local pcCity = pPlayer:GetCapitalCity();
	for sKey, tTable in pairs(CapitalPlots) do
		local pPlot = DecompilePlotID(sKey)
		if pPlot:IsCity() then
			local pCity = pPlot:GetPlotCity();
			local iOldOwner = pCity:GetOriginalOwner();
			local oPlayer = Players[iOldOwner];
			if pPlayer == oPlayer then
				pcCity = pCity;
				break;
			end
		end
	end
	return pcCity;
end

--Get Intel Pool
function GetIntelPool(pPlayer)
	pcCity = GetPlayersOriginalCity(pPlayer);

	local IntelPool = 0;
	local TenThousands = (pcCity:GetNumBuilding(bSpyCount10000) * 10000);
	local Thousands = (pcCity:GetNumBuilding(bSpyCount1000) * 1000);
	local Hundreds = (pcCity:GetNumBuilding(bSpyCount100) * 100);
	local Tens = (pcCity:GetNumBuilding(bSpyCount10) * 10);
	local Ones = pcCity:GetNumBuilding(bSpyCount1);
	IntelPool = (Ones + Tens + Hundreds + Thousands + TenThousands);

	return IntelPool;
end

function SaveIntelPool(pPlayer, TurnIntel)
	pcCity = GetPlayersOriginalCity(pPlayer);
	IntelPool = GetIntelPool(pPlayer);

	local NewBase = (IntelPool + TurnIntel);
	local New10000s = math.floor(NewBase / 10000);
	local Base1000s = (NewBase - (New10000s * 10000));
	local New1000s = math.floor(Base1000s / 1000);
	local Base100s = (Base1000s - (New1000s * 1000));
	local New100s = math.floor(Base100s / 100);
	local Base10s = (Base100s - (New100s * 100));
	local New10s = math.floor(Base10s / 10);
	local Base1s = (Base10s - (New10s * 10));
	local New1s = Base1s;

	pcCity:SetNumRealBuilding(bSpyCount10000, 0);
	pcCity:SetNumRealBuilding(bSpyCount1000, 0);
	pcCity:SetNumRealBuilding(bSpyCount100, 0);
	pcCity:SetNumRealBuilding(bSpyCount10, 0);
	pcCity:SetNumRealBuilding(bSpyCount1, 0);

	pcCity:SetNumRealBuilding(bSpyCount10000, New10000s);
	pcCity:SetNumRealBuilding(bSpyCount1000, New1000s);
	pcCity:SetNumRealBuilding(bSpyCount100, New100s);
	pcCity:SetNumRealBuilding(bSpyCount10, New10s);
	pcCity:SetNumRealBuilding(bSpyCount1, New1s);

end

--Get Current Spy Threshold
function GetSpyThreshold(pPlayer)
	pcCity = GetPlayersOriginalCity(pPlayer);
	local SpyThreshold = BaseThreshold;
	local SpyNum = pcCity:GetNumBuilding(bSpyCountMAX);
	if SpyNum == 0 then 
		SpyThreshold = BaseThreshold;
	elseif SpyNum >= 1 then 
		local SpySequence = BaseThreshold;
		for num = 1, SpyNum do
			SpySequence = (SpySequence + (BaseMultiplier * num));
		end
		SpyThreshold = SpySequence;
	end
	return SpyThreshold;
end

--Calculate Intel per Turn
function CalculateIntelTurn(pPlayer)
	local TurnIntel = 0;	
	local IntelPoints = 0;
	for pCity in pPlayer:Cities() do
		local pPlot = pCity:Plot();
		local pMercArmy = GameInfoTypes.POLICY_TRADE_UNIONS; 
		--
		if isTim then
			local bMaydan = GameInfoTypes.BUILDING_TIMURID_MADRASAH_MOD; 
			if pCity:IsHasBuilding(bMaydan) then
				IntelPoints = IntelPoints + 1;
			end
		end
		--
		if pPlot:IsUnit() then
			if pPlayer:HasPolicy(pMilitaryCaste) then
				local pUnit = pPlot:GetUnit();
				if pUnit:IsCombatUnit() then
					IntelPoints = IntelPoints + 1;
				end
			end
		end
		--
		local ModBonus = pCity:GetNumBuilding(bModBonus);
		IntelPoints = IntelPoints + ModBonus;
		--		
		for pBuilding in GameInfo.Buildings() do
			if pCity:IsHasBuilding(pBuilding.ID) then
				if (pBuilding.BuildingClass == "BUILDINGCLASS_CONSTABLE") then
					IntelPoints = IntelPoints + (pCity:GetSpecialistCount(sCitizen));
				end
				if (pBuilding.BuildingClass == "BUILDINGCLASS_POLICE_STATION") then
					IntelPoints = IntelPoints + (pCity:GetSpecialistCount(sCitizen));
				end
				--
				if (pBuilding.BuildingClass == "BUILDINGCLASS_WALLS") then
					IntelPoints = IntelPoints + 1;
				end
				if (pBuilding.BuildingClass == "BUILDINGCLASS_CASTLE") then
					IntelPoints = IntelPoints + 1;
				end
				if (pBuilding.BuildingClass == "BUILDINGCLASS_ARSENAL") then
					IntelPoints = IntelPoints + 1;
				end
				if (pBuilding.BuildingClass == "BUILDINGCLASS_MILITARY_BASE") then
					IntelPoints = IntelPoints + 1;
				end
				--
				if (pBuilding.BuildingClass == "BUILDINGCLASS_ALHAMBRA") then
					IntelPoints = IntelPoints + 1;
				end
				if (pBuilding.BuildingClass == "BUILDINGCLASS_GREAT_WALL") then
					IntelPoints = IntelPoints + 1;
				end
				if (pBuilding.BuildingClass == "BUILDINGCLASS_PENTAGON") then
					IntelPoints = IntelPoints + 1;
				end
				if (pBuilding.BuildingClass == "BUILDINGCLASS_TERRACOTTA_ARMY") then
					IntelPoints = IntelPoints + 2;
				end
				if (pBuilding.BuildingClass == "BUILDINGCLASS_HIMEJI_CASTLE") then
					IntelPoints = IntelPoints + 2;
				end
				if (pBuilding.BuildingClass == "BUILDINGCLASS_RED_FORT") then
					IntelPoints = IntelPoints + 2;
				end
				if (pBuilding.BuildingClass == "BUILDINGCLASS_GREAT_FIREWALL") then
					IntelPoints = IntelPoints + 3;
				end
				if (pBuilding.BuildingClass == "BUILDINGCLASS_INTELLIGENCE_AGENCY") then
					IntelPoints = IntelPoints + 4;
				end
				--
				if isCid then
					if (pBuilding.BuildingClass == "BUILDINGCLASS_JFD_TOWER_LONDON") then
						IntelPoints = IntelPoints + 2;
					end
					if (pBuilding.BuildingClass == "BUILDINGCLASS_JFD_JAIL") then
						IntelPoints = IntelPoints + 1;
					end
				end
				--
				if not isEE then
					if (pBuilding.BuildingClass == "BUILDINGCLASS_TOMATEKH_SPY_TAVERN") then
						IntelPoints = IntelPoints + 2;
						if pPlayer:HasPolicy(pMercArmy) then
							IntelPoints = IntelPoints + 1;
						end
					end
				elseif isEE then
					if (pBuilding.BuildingClass == "BUILDINGCLASS_EE_FASIL_GHEBBI") then
						IntelPoints = IntelPoints + 2;
					end
					if (pBuilding.BuildingClass == "BUILDINGCLASS_EE_BASTION") then
						IntelPoints = IntelPoints + 1;
					end
					if (pBuilding.BuildingClass == "BUILDINGCLASS_EE_TAVERN") then
						IntelPoints = IntelPoints + 2;
						if pPlayer:HasPolicy(pMercArmy) then
							IntelPoints = IntelPoints + 1;
						end
					end
				end
				--
			end
		end
	end
	--
	local CityMult = 1;
	if pPlayer:GetBuildingClassCount(bcSpyKremlin) >= 1 then
		CityMult = 1.2;
	end
	IntelPoints = math.floor(IntelPoints * CityMult);
	--
	local Negative = GameInfoTypes.BELIEF_SPY_NEGATIVE_THEOLOGY;
	local eReligion = -1;
	for rPlayer=0, GameDefines.MAX_MAJOR_CIVS-1 do
		local rPlayer = Players[rPlayer];
		if rPlayer:GetReligionCreatedByPlayer() >= 1 then
			local rReligion = rPlayer:GetReligionCreatedByPlayer();
			for i,v in ipairs(Game.GetBeliefsInReligion(rReligion)) do
				local belief = GameInfo.Beliefs[v];
				if (belief ~= nil) then
					if belief.ID == Negative then
						eReligion = rReligion;
						break;
					end
				end
			end
		end
	end
	if eReligion >= 1 then
		if (pPlayer:HasReligionInMostCities(eReligion)) then
			local FPT = pPlayer:GetTotalFaithPerTurn();
			local IPT = math.ceil(pPlayer:GetTotalFaithPerTurn() * 0.15);
			IntelPoints = IntelPoints + IPT;
		end
	end
	--
	TurnIntel = IntelPoints;
	return TurnIntel;
end

--Do
GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) and (pPlayer:GetNumCities() > 0) and not pPlayer:IsMinorCiv() and not pPlayer:IsBarbarian() then
		local pcCity = pPlayer:GetCapitalCity();
		if (pcCity ~= nil) then
			local AntiCount = pcCity:GetNumBuilding(bSpyDummy2);
			if AntiCount <= 0 then
				if pcCity:IsHasBuilding(bSpyDummy1) then
					pcCity:SetNumRealBuilding(bSpyDummy1, 0);
				end
			elseif AntiCount >= 1 then	
				local AntiChange = (AntiCount - 1);
				pcCity:SetNumRealBuilding(bSpyDummy2, AntiChange);
			end
		end
	end
	if pPlayer:IsAlive() and not pPlayer:IsMinorCiv() and not pPlayer:IsBarbarian() then
		for pUnit in pPlayer:Units() do
			if pUnit:GetUnitClassType() == ucSpy then
				if pUnit:IsHasPromotion(pSpyNull) then
					pUnit:SetHasPromotion(pSpyNull, false)		
				end
			end
		end
	end
end)

function OnHumanPlayerTurnEnd()
	local pPlayer = Players[Game.GetActivePlayer()];
	local pTeam = pPlayer:GetTeam();

	local title = "Great Person born";
	local descr = "A Great Person has been born in your civilization!";

	if (pPlayer:IsAlive()) and (pPlayer:GetNumCities() >= 1) and (pPlayer:IsHuman()) and not pPlayer:IsMinorCiv() and not pPlayer:IsBarbarian() then 

		local intCity = pPlayer:GetCapitalCity();
		if pPlayer:GetBuildingClassCount(bcIntelAgency) >= 1 then
			for pCity in pPlayer:Cities() do
				if pCity:IsHasBuilding(bIntelAgency) then
					intCity = pCity;
					break;
				end
			end
		end

		local pcCity = GetPlayersOriginalCity(pPlayer);
		local TurnIntel = CalculateIntelTurn(pPlayer);
		SaveIntelPool(pPlayer, TurnIntel);
		local IntelPool = GetIntelPool(pPlayer);
		local SpyThreshold = GetSpyThreshold(pPlayer);
		if IntelPool >= SpyThreshold then			
			intCity:SetNumRealBuilding(bSpySpawn, 1);
			intCity:SetNumRealBuilding(bSpySpawn, 0);
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER, descr, title, intCity:GetX(), intCity:GetY(), SpyID, -1);
			local TotalSpyCount = pcCity:GetNumBuilding(bSpyCountMAX);
			pcCity:SetNumRealBuilding(bSpyCount10000, 0);
			pcCity:SetNumRealBuilding(bSpyCount1000, 0);
			pcCity:SetNumRealBuilding(bSpyCount100, 0);
			pcCity:SetNumRealBuilding(bSpyCount10, 0);
			pcCity:SetNumRealBuilding(bSpyCount1, 0);
			pcCity:SetNumRealBuilding(bSpyCountMAX, 0);
			pcCity:SetNumRealBuilding(bSpyCountMAX, (TotalSpyCount + 1));
		end

	end
end
Events.ActivePlayerTurnEnd.Add(OnHumanPlayerTurnEnd);

GameEvents.PlayerDoTurn.Add(
function(iPlayer)	
	local pPlayer = Players[iPlayer];
	local pTeam = pPlayer:GetTeam();

	if (pPlayer:IsAlive()) and (pPlayer:GetNumCities() >= 1) and not pPlayer:IsHuman() and not pPlayer:IsMinorCiv() and not pPlayer:IsBarbarian() then 

		local intCity = pPlayer:GetCapitalCity();
		if pPlayer:GetBuildingClassCount(bcIntelAgency) >= 1 then
			for pCity in pPlayer:Cities() do
				if pCity:IsHasBuilding(bIntelAgency) then
					intCity = pCity;
					break;
				end
			end
		end

		local pcCity = GetPlayersOriginalCity(pPlayer);
		local TurnIntel = CalculateIntelTurn(pPlayer);
		SaveIntelPool(pPlayer, TurnIntel);
		local IntelPool = GetIntelPool(pPlayer);
		local SpyThreshold = GetSpyThreshold(pPlayer);
		if IntelPool >= SpyThreshold then			
			intCity:SetNumRealBuilding(bSpySpawn, 1);
			intCity:SetNumRealBuilding(bSpySpawn, 0);
			local TotalSpyCount = pcCity:GetNumBuilding(bSpyCountMAX);
			pcCity:SetNumRealBuilding(bSpyCount10000, 0);
			pcCity:SetNumRealBuilding(bSpyCount1000, 0);
			pcCity:SetNumRealBuilding(bSpyCount100, 0);
			pcCity:SetNumRealBuilding(bSpyCount10, 0);
			pcCity:SetNumRealBuilding(bSpyCount1, 0);
			pcCity:SetNumRealBuilding(bSpyCountMAX, 0);
			pcCity:SetNumRealBuilding(bSpyCountMAX, (TotalSpyCount + 1));
		end

	end
end)

--
----
--

local isBNW = (GameInfoTypes.UNITCOMBAT_SUBMARINE ~= nil)

local tSpecialists = {}
for tSpecialist in GameInfo.Specialists() do
	if tSpecialist.ID == GameInfoTypes.SPECIALIST_CITIZEN then
		table.insert(tSpecialists, tSpecialist.ID);
	end
end

local Tavern = GameInfoTypes.BUILDING_TOMATEKH_SPY_DUMMY_1_MOD;
if not isEE then
	Tavern = GameInfoTypes.BUILDING_TOMATEKH_SPY_TAVERN;
elseif isEE then
	Tavern = GameInfoTypes.BUILDING_EE_TAVERN; 
end

local TavernDisplay = GameInfoTypes.BUILDING_TOMATEKH_SPY_TAVERN_DISPLAY;
local TavernGold = GameInfoTypes.BUILDING_TOMATEKH_SPY_TAVERN_GOLD;

local Agency = GameInfoTypes.BUILDING_INTELLIGENCE_AGENCY;
local AgencyDisplay = GameInfoTypes.BUILDING_INTELLIGENCE_AGENCY_SPY_DISPLAY;
local AgencyScience = GameInfoTypes.BUILDING_INTELLIGENCE_AGENCY_SPY_SCIENCE;

local Mystery = GameInfoTypes.BELIEF_SPY_MYSTERY_CULTS;
local MysteryDisplay = GameInfoTypes.BUILDING_TOMATEKH_SPY_MYSTERY_DISPLAY;
local MysteryFaith = GameInfoTypes.BUILDING_TOMATEKH_SPY_MYSTERY_FAITH;

function ResetSpecialists(pCity)
	pCity:SetNumRealBuilding(TavernGold, 0);
	pCity:SetNumRealBuilding(AgencyScience, 0);
	pCity:SetNumRealBuilding(MysteryFaith, 0);

	local pPlayer = Players[pCity:GetOwner()];

	if (pCity:GetNumBuilding(Tavern) > 0) then
		local cSpecialists = 0
		for iKey, iSpecialist in ipairs(tSpecialists) do
			cSpecialists = cSpecialists + pCity:GetSpecialistCount(iSpecialist);
		end
		pCity:SetNumRealBuilding(TavernGold, cSpecialists);
	end
	if (pCity:GetNumBuilding(Agency) > 0) then
		local cSpecialists = 0
		for iKey, iSpecialist in ipairs(tSpecialists) do
			cSpecialists = cSpecialists + pCity:GetSpecialistCount(iSpecialist);
		end
		pCity:SetNumRealBuilding(AgencyScience, cSpecialists);
	end
	if pCity:GetReligiousMajority() ~= -1 then
		if pCity:GetReligiousMajority() == 0 then
			if pPlayer:GetBeliefInPantheon() == Mystery then
				local cSpecialists = 0
				for iKey, iSpecialist in ipairs(tSpecialists) do
					cSpecialists = cSpecialists + pCity:GetSpecialistCount(iSpecialist);
				end
				pCity:SetNumRealBuilding(MysteryFaith, cSpecialists);
			end
		elseif pCity:GetReligiousMajority() >= 1 then
			local eReligion = pCity:GetReligiousMajority();
			for i,v in ipairs(Game.GetBeliefsInReligion(eReligion)) do
				local belief = GameInfo.Beliefs[v];
				if (belief ~= nil) then
					--if (i == 1) then
						if belief.ID == Mystery then
							local cSpecialists = 0
							for iKey, iSpecialist in ipairs(tSpecialists) do
								cSpecialists = cSpecialists + pCity:GetSpecialistCount(iSpecialist);
							end
							pCity:SetNumRealBuilding(MysteryFaith, cSpecialists);
						end
					--end
				end
			end
		end
	end
end

function PlayerDoTurn_ResetSpecialists(iPlayer)
	local pPlayer = Players[iPlayer]
	if not pPlayer:IsMinorCiv() and not pPlayer:IsBarbarian() then
		if pPlayer:GetNumCities() > 0 then
			for pCity in pPlayer:Cities() do
				ResetSpecialists(pCity);
			end
		end
	end
end
if isBNW then GameEvents.PlayerDoTurn.Add(PlayerDoTurn_ResetSpecialists) end

local iSpecialistUpdateType = CityUpdateTypes.CITY_UPDATE_TYPE_SPECIALISTS;

function SpecificCityInfoDirty_ResetSpecialists(iPlayer, iCity, iUpdateType)
	if iUpdateType ~= iSpecialistUpdateType then return end
	local iPlayer = Game.GetActivePlayer()
	local pPlayer = Players[iPlayer]
	if not(pPlayer:IsTurnActive()) then	return end	
	local pCity = pPlayer:GetCityByID(iCity)
	if (pCity ~= nil) then
		ResetSpecialists(pCity);
	end
end
if isBNW then Events.SpecificCityInfoDirty.Add(SpecificCityInfoDirty_ResetSpecialists) end

function RemoveCitizenDisplay()
    local iPlayer = Game.GetActivePlayer()
	local pPlayer = Players[iPlayer] 
    if (pPlayer:IsAlive()) then
		if (pPlayer:IsHuman()) then
			if pPlayer:GetNumCities() > 0 then
				for pCity in pPlayer:Cities() do
					if (pCity:GetNumBuilding(TavernDisplay) > 0) then
						pCity:SetNumRealBuilding(TavernDisplay, 0);
					end
					if (pCity:GetNumBuilding(AgencyDisplay) > 0) then
						pCity:SetNumRealBuilding(AgencyDisplay, 0);
					end
					if (pCity:GetNumBuilding(MysteryDisplay) > 0) then
						pCity:SetNumRealBuilding(MysteryDisplay, 0);
					end
					ResetSpecialists(pCity);
				end
			end
		end
	end
end
if isBNW then Events.SerialEventExitCityScreen.Add(RemoveCitizenDisplay) end

function AddCitizenDisplay()
	local pCity = UI.GetHeadSelectedCity();
	local iPlayer = Game.GetActivePlayer()
	local pPlayer = Players[iPlayer]
    if (pPlayer:IsAlive()) then
		if (pPlayer:IsHuman()) then
			if (pCity ~= nil) then
				if (pCity:GetNumBuilding(TavernDisplay) > 0) then
					pCity:SetNumRealBuilding(TavernDisplay, 0);
				end
				if (pCity:GetNumBuilding(AgencyDisplay) > 0) then
					pCity:SetNumRealBuilding(AgencyDisplay, 0);
				end
				if (pCity:GetNumBuilding(MysteryDisplay) > 0) then
					pCity:SetNumRealBuilding(MysteryDisplay, 0);
				end

				if (pCity:GetNumBuilding(Tavern) > 0) then
					pCity:SetNumRealBuilding(TavernDisplay, 1);
				end
				if (pCity:GetNumBuilding(Agency) > 0) then
					pCity:SetNumRealBuilding(AgencyDisplay, 1);
				end
				if pCity:GetReligiousMajority() ~= -1 then
					if pCity:GetReligiousMajority() == 0 then
						if pPlayer:GetBeliefInPantheon() == Mystery then
							pCity:SetNumRealBuilding(MysteryDisplay, 1);
						end
					elseif pCity:GetReligiousMajority() >= 1 then
						local eReligion = pCity:GetReligiousMajority();
						for i,v in ipairs(Game.GetBeliefsInReligion(eReligion)) do
							local belief = GameInfo.Beliefs[v];
							if (belief ~= nil) then		
								--if (i == 1) then
									if belief.ID == Mystery then
										pCity:SetNumRealBuilding(MysteryDisplay, 1);
									end
								--end
							end
						end
					end
				end
				ResetSpecialists(pCity);
			end
		end
	end
end
if isBNW then Events.SerialEventEnterCityScreen.Add(AddCitizenDisplay) end

--------
local rHorse = GameInfo.Resources["RESOURCE_HORSE"].ID;
local rIron = GameInfo.Resources["RESOURCE_IRON"].ID;
local rCoal = GameInfo.Resources["RESOURCE_COAL"].ID;
local rAluminum = GameInfo.Resources["RESOURCE_ALUMINUM"].ID;
local rOil = GameInfo.Resources["RESOURCE_OIL"].ID;
local rUranium = GameInfo.Resources["RESOURCE_URANIUM"].ID;

function GetPreReqTech(pResource)
	local rReveal = GameInfo.Resources[pResource].TechReveal;
	local rTech = GameInfo.Technologies["" .. rReveal .. ""].ID
	return rTech;
end

local iAnimalHusbandry = GetPreReqTech(rHorse);
local iBronze = GetPreReqTech(rIron);
local iIndustry = GetPreReqTech(rCoal);
local iElectricty = GetPreReqTech(rAluminum);
local iBio = GetPreReqTech(rOil);
local iAtomic = GetPreReqTech(rUranium);

local HorsePlots = {}
local IronPlots = {}
local CoalPlots = {}
local AluminumPlots = {}
local OilPlots = {}
local UraniumPlots = {}

for iPlot = 0, Map.GetNumPlots() - 1, 1 do
    local pPlot = Map.GetPlotByIndex(iPlot)
	if pPlot:GetResourceType() == rHorse then
		local sKey = CompilePlotID(pPlot)
		HorsePlots[sKey] = -1
    end
	if pPlot:GetResourceType() == rIron then
		local sKey = CompilePlotID(pPlot)
		IronPlots[sKey] = -1
    end
	if pPlot:GetResourceType() == rCoal then
		local sKey = CompilePlotID(pPlot)
		CoalPlots[sKey] = -1
    end
	if pPlot:GetResourceType() == rAluminum then
		local sKey = CompilePlotID(pPlot)
		AluminumPlots[sKey] = -1
    end
	if pPlot:GetResourceType() == rOil then
		local sKey = CompilePlotID(pPlot)
		OilPlots[sKey] = -1
    end
	if pPlot:GetResourceType() == rUranium then
		local sKey = CompilePlotID(pPlot)
		UraniumPlots[sKey] = -1
    end
end

directions = {DirectionTypes.DIRECTION_NORTHEAST, DirectionTypes.DIRECTION_EAST, DirectionTypes.DIRECTION_SOUTHEAST,
              DirectionTypes.DIRECTION_SOUTHWEST, DirectionTypes.DIRECTION_WEST, DirectionTypes.DIRECTION_NORTHWEST}

local FakeHorse = GameInfoTypes.IMPROVEMENT_FAKE_HORSE_MOD;
local FakeIron = GameInfoTypes.IMPROVEMENT_FAKE_IRON_MOD;
local FakeCoal = GameInfoTypes.IMPROVEMENT_FAKE_COAL_MOD;
local FakeAluminum = GameInfoTypes.IMPROVEMENT_FAKE_ALUM_MOD;
local FakeOil = GameInfoTypes.IMPROVEMENT_FAKE_OIL_MOD;
local FakeUranium = GameInfoTypes.IMPROVEMENT_FAKE_URAN_MOD;

function OnHumanPlayerTurnEnd2()
	local pPlayer = Players[Game.GetActivePlayer()];
	local pTeam = pPlayer:GetTeam();
	local EraCount = (Teams[pTeam]:GetCurrentEra());
	if (pPlayer:IsAlive()) and (pPlayer:GetNumCities() >= 1) and pPlayer:IsHuman() and not pPlayer:IsMinorCiv() and not pPlayer:IsBarbarian() then 
		local pcCity = GetPlayersOriginalCity(pPlayer);
		local IntelPool = GetIntelPool(pPlayer);
		local SpyThreshold = GetSpyThreshold(pPlayer);
		local SpyNum = pcCity:GetNumBuilding(bSpyCountMAX);
		if IntelPool >= (math.ceil(SpyThreshold / 2)) then
			if (load(pPlayer, "SPY_LEVEL_BONUS_" .. SpyNum) ~= true) then
				save(pPlayer, "SPY_LEVEL_BONUS_" .. SpyNum, true)
				local TestPlots = nil;
				local Resource = nil;
				local ResourceID = nil;
				if not (Teams[pTeam]:IsHasTech(iAnimalHusbandry)) then
					TestPlots = HorsePlots;
					Resource = FakeHorse;
					ResourceID = rHorse;
				elseif not (Teams[pTeam]:IsHasTech(iBronze)) then
					TestPlots = IronPlots;
					Resource = FakeIron;
					ResourceID = rIron;
				elseif not (Teams[pTeam]:IsHasTech(iIndustry)) and (load(pPlayer, "SPY_LEVEL_BONUS_COAL") ~= true) then
					save(pPlayer, "SPY_LEVEL_BONUS_COAL", true)
					TestPlots = CoalPlots;
					Resource = FakeCoal;
					ResourceID = rCoal;
				elseif not (Teams[pTeam]:IsHasTech(iBio)) and (load(pPlayer, "SPY_LEVEL_BONUS_OIL") ~= true) then
					save(pPlayer, "SPY_LEVEL_BONUS_OIL", true)
					TestPlots = OilPlots;
					Resource = FakeOil;
					ResourceID = rOil;
				elseif not (Teams[pTeam]:IsHasTech(iElectricty)) then
					save(pPlayer, "SPY_LEVEL_BONUS_COAL", false)
					save(pPlayer, "SPY_LEVEL_BONUS_COAL", false)
					TestPlots = AluminumPlots;
					Resource = FakeAluminum;
					ResourceID = rAluminum;
				elseif not (Teams[pTeam]:IsHasTech(iAtomic)) and (EraCount >= 4) then
					TestPlots = UraniumPlots;
					Resource = FakeUranium;
					ResourceID = rUranium;
				end
				local rPlot = nil;
				if TestPlots ~= nil then
					local pNearestCity = nil;
					local iNearestDistance = 1000000;
					for sKey, tTable in pairs(TestPlots) do
						local pPlot = DecompilePlotID(sKey)
						if pPlot:GetResourceType() ~= -1 then
							if pPlot:GetImprovementType() == -1 and not pPlot:IsCity() then								
								iDistance = Map.PlotDistance(pPlot:GetX(), pPlot:GetY(), pcCity:GetX(), pcCity:GetY());
								if (iDistance < iNearestDistance) then
									iNearestDistance = iDistance;
									pNearestCity = pPlot;
								end
							end
						end
					end
					if pNearestCity ~= nil then
						rPlot = pNearestCity;
					end
				end
				if rPlot ~= nil then
					if rPlot:GetResourceType() ~= -1 then
						local rResource = rPlot:GetResourceType();
						rPlot:SetImprovementType(Resource);
						rPlot:SetRevealed(pTeam, true);						
						for loop, direction in ipairs(directions) do
							local adjPlot = Map.PlotDirection(rPlot:GetX(), rPlot:GetY(), direction);						
							adjPlot:SetRevealed(pTeam, true);
						end
						if ResourceID ~= nil then
							local pID = pPlayer:GetID();
							local pResourceInfo = GameInfo.Resources[rPlot:GetResourceType()];
							local ResourceName = Locale.ConvertTextKey(pResourceInfo.Description);
							local title = "Unknown resource discovered";
							local descr = "Your intelligence network has revealed the location of an unknown resource! You must still research the resource's prerequisite technology in order to improve the tile.";					
							local DummyID = GameInfo.Units["UNIT_SPY_DUMMY"].ID;
							pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER, descr, title, rPlot:GetX(), rPlot:GetY(), DummyID, -1);
						end
					end
				end
			end
		end
	end
end
Events.ActivePlayerTurnEnd.Add(OnHumanPlayerTurnEnd2);

--cleanup
function GetHuman()	
	local hPlayer = 0;
	for iPlayer=0, GameDefines.MAX_MAJOR_CIVS-1 do
		local oPlayer = Players[iPlayer];
		if oPlayer:IsEverAlive() then
			if oPlayer:IsHuman() then
				hPlayer = oPlayer;
				break;
			end
		end
	end
	return hPlayer;
end

GameEvents.TeamSetHasTech.Add(
function(iTeam, iTech, bAdopted) 
	if (iTeam ~= bTeam) and not Teams[iTeam]:IsMinorCiv() and not Teams[iTeam]:IsBarbarian() then
		local TestPlots = nil;
		local Resource = nil;
		if iTech == iAnimalHusbandry then
			TestPlots = HorsePlots;
			Resource = FakeHorse;
		elseif iTech == iBronze then
			TestPlots = IronPlots;
			Resource = FakeIron;
		elseif iTech == iIndustry then
			TestPlots = CoalPlots;
			Resource = FakeCoal;
		elseif iTech == iBio then
			TestPlots = OilPlots;
			Resource = FakeOil;
		elseif iTech == iElectricty then
			TestPlots = AluminumPlots;
			Resource = FakeAluminum;
		elseif iTech == iAtomic then
			TestPlots = UraniumPlots;
			Resource = FakeUranium;
		end
		if TestPlots ~= nil then
			for sKey, tTable in pairs(TestPlots) do
				local pPlot = DecompilePlotID(sKey)
				if pPlot:GetImprovementType() == Resource then
					if pPlot:GetOwner() ~= -1 then
						local plotPlayer = Players[pPlot:GetOwner()];
						local plotTeam = plotPlayer:GetTeam();
						if plotTeam == iTeam then
							pPlot:SetImprovementType(-1)
						end
					end
				end
			end
			local hPlayer = GetHuman();
			local hTeam = hPlayer:GetTeam();
			if hTeam == iTeam then
				for sKey, tTable in pairs(TestPlots) do
					local pPlot = DecompilePlotID(sKey)
					if pPlot:GetImprovementType() == Resource then
						pPlot:SetImprovementType(-1);
					end
				end
			end
		end
	end
end)

local FakeImp = { 
	FakeHorse, 
	FakeIron, 
	FakeCoal, 
	FakeOil,
	FakeAluminum, 
	FakeUranium
	}

GameEvents.PlayerCityFounded.Add(
function(iPlayer, iCityX, iCityY)
	local pPlayer = Players[iPlayer];
	local pTeam = pPlayer:GetTeam();
	local pPlot = Map.GetPlot(iCityX, iCityY);
	local pCity = pPlot:GetPlotCity();
	if (pPlayer:IsAlive()) then
		for _, pImprovement in pairs(FakeImp) do
			if pPlot:GetImprovementType() == pImprovement then
				pPlot:SetImprovementType(-1);
			end
		end
	end
end)

--AI
local GABonusLength = 8;
local ResistLength = 3;
local AntiLength = 20;
if speed == GameInfo.GameSpeeds['GAMESPEED_QUICK'].ID then
	GABonusLength = 6;
	ResistLength = 2;
	AntiLength = 15;
elseif speed == GameInfo.GameSpeeds['GAMESPEED_STANDARD'].ID then
	GABonusLength = 8;
	ResistLength = 3;
	AntiLength = 20;
elseif speed == GameInfo.GameSpeeds['GAMESPEED_EPIC'].ID then
	GABonusLength = 10;
	ResistLength = 4;
	AntiLength = 25;
elseif speed == GameInfo.GameSpeeds['GAMESPEED_MARATHON'].ID then
	GABonusLength = 16;
	ResistLength = 6;
	AntiLength = 40;
else
	GABonusLength = 16;
	ResistLength = 6;
	AntiLength = 40;
end

function EscapeChance(lower, upper)
    return (Game.Rand((upper + 1) - lower, "")) + lower
end

local bcSpyDummy2 = GameInfoTypes.BUILDINGCLASS_TOMATEKH_SPY_DUMMY_2;

local Barbarians = Players[63]

local pSpy = GameInfoTypes.PROMOTION_TOMATEKH_SPY;
local pSpy1 = GameInfoTypes.PROMOTION_TOMATEKH_SPY_XP1;
local pSpy2 = GameInfoTypes.PROMOTION_TOMATEKH_SPY_XP2;
local pSpy3 = GameInfoTypes.PROMOTION_TOMATEKH_SPY_XP3;
local pSpyNull = GameInfoTypes.PROMOTION_TOMATEKH_SPY_NULL;

local iAcademy = GameInfoTypes.IMPROVEMENT_ACADEMY;
local iCustoms = GameInfoTypes.IMPROVEMENT_CUSTOMS_HOUSE;
local iFactory= GameInfoTypes.IMPROVEMENT_MANUFACTORY;
local iCitadel = GameInfoTypes.IMPROVEMENT_CITADEL;
local iShrine = GameInfoTypes.IMPROVEMENT_HOLY_SITE;

local iScientist = GameInfoTypes.UNIT_SCIENTIST;
local iMerchant = GameInfoTypes.UNIT_MERCHANT;
local iEngineer = GameInfoTypes.UNIT_ENGINEER;
local iGeneral = GameInfoTypes.UNIT_GREAT_GENERAL;
local iProphet = GameInfoTypes.UNIT_PROPHET;

local iHospital = GameInfoTypes.IMPROVEMENT_ACADEMY;
local iDoctor = GameInfoTypes.UNIT_SCIENTIST;
local isHospital = (GameInfoTypes.IMPROVEMENT_JFD_SANATORIUM ~= nil);
if isHospital then
	iHospital = GameInfoTypes.IMPROVEMENT_JFD_SANATORIUM;
	iDoctor = GameInfoTypes.UNIT_JFD_GREAT_DOCTOR;
end

local iFair = GameInfoTypes.IMPROVEMENT_ACADEMY;
local iEntertainer = GameInfoTypes.UNIT_SCIENTIST;
local isFair = (GameInfoTypes.IMPROVEMENT_FAIRGROUNDS ~= nil);
if isFair then
	iFair = GameInfoTypes.IMPROVEMENT_FAIRGROUNDS;
	iEntertainer = GameInfoTypes.UNIT_ENTERTAINER;
end

local bEspBuild1 = GameInfoTypes.BUILDING_CONSTABLE;
local bEspBuild2 = GameInfoTypes.BUILDING_POLICE_STATION;
local bEspBuild3 = GameInfoTypes.BUILDING_INTELLIGENCE_AGENCY;
local bEspBuild4 = GameInfoTypes.BUILDING_GREAT_FIREWALL;

local greatWorkSlotMusicID = GameInfoTypes["GREAT_WORK_SLOT_MUSIC"];
local greatWorkSlotWritingID = GameInfoTypes["GREAT_WORK_SLOT_LITERATURE"];
local greatWorkSlotArtID = GameInfoTypes["GREAT_WORK_SLOT_ART_ARTIFACT"];

local cTimurids = GameInfoTypes.CIVILIZATION_BARBARIAN;
local bMaydan = GameInfoTypes.BUILDING_UNIVERSITY;

local isTimurids = (GameInfoTypes.CIVILIZATION_TIMURIDS_MOD ~= nil);
if isTimurids then 
	cTimurids = GameInfoTypes.CIVILIZATION_TIMURIDS_MOD;
	bMaydan = GameInfoTypes.BUILDING_TIMURID_MADRASAH_MOD;
end

local Itza = GameInfoTypes.BUILDINGCLASS_CHICHEN_ITZA;
local Counterespionage = GameInfoTypes.BUILDINGCLASS_TOMATEKH_SPY_DUMMY_1;
local Suffrage = GameInfoTypes.POLICY_UNIVERSAL_SUFFRAGE;

local iMound = GameInfoTypes.IMPROVEMENT_GOODY_HUT;
local isPoverty = (GameInfoTypes.CIVILIZATION_POVERTY_POINT_MOD ~= nil);
if isPoverty then
	iMound = GameInfoTypes.IMPROVEMENT_CEREMONIAL_MOUND_MOD;
end

local uMech = GameInfoTypes.UNIT_MECHANIZED_INFANTRY;
local uInfantry = GameInfoTypes.UNIT_INFANTRY;
local uGWInfantry = GameInfoTypes.UNIT_GREAT_WAR_INFANTRY;
local uRifle = GameInfoTypes.UNIT_RIFLEMAN;
local uMusket = GameInfoTypes.UNIT_MUSKETMAN;
local uPike = GameInfoTypes.UNIT_PIKEMAN;
local uSpear = GameInfoTypes.UNIT_SPEARMAN;
local uAxe = GameInfoTypes.UNIT_WARRIOR;

local uLine = GameInfoTypes.UNIT_GREAT_WAR_INFANTRY;
local isEE = (GameInfoTypes.UNIT_EE_LINE_INFANTRY ~= nil);
if isEE then
	uLine = GameInfoTypes.UNIT_EE_LINE_INFANTRY;
end

local LandInfantry = { 
	uMech, 
	uInfantry, 
	uGWInfantry, 
	uLine,
	uRifle, 
	uMusket, 
	uPike, 
	uSpear, 
	uAxe
	}

---------
local GpImprovementPlots = {}
local GpResourcePlots = {}

for iPlot = 0, Map.GetNumPlots() - 1, 1 do
    local pPlot = Map.GetPlotByIndex(iPlot)
	if (pPlot:GetImprovementType() == iCustoms) or (pPlot:GetImprovementType() == iAcademy) or  (pPlot:GetImprovementType() == iCitadel) or (pPlot:GetImprovementType() == iFactory) or (pPlot:GetImprovementType() == iShrine) then
		local sKey = CompilePlotID(pPlot)
		GpImprovementPlots[sKey] = -1
    end
	if (pPlot:GetResourceType() == rHorse) or (pPlot:GetResourceType() == rIron) or (pPlot:GetResourceType() == rCoal) or (pPlot:GetResourceType() == rAluminum) or (pPlot:GetResourceType() == rOil) or (pPlot:GetResourceType() == rUranium) then
		local sKey = CompilePlotID(pPlot)
		GpResourcePlots[sKey] = -1
	end
end

GameEvents.BuildFinished.Add(function(iPlayer, x, y, eImprovement) 
	local pPlayer = Players[iPlayer];
	local pPlot = Map.GetPlot(x, y);
	if (eImprovement == iCustoms) or (eImprovement == iAcademy) or (eImprovement == iCitadel) or (eImprovement == iFactory) or (eImprovement == iShrine) then
		local sKey = CompilePlotID(pPlot)
		GpImprovementPlots[sKey] = -1
	end
end)

function CounterMission(pcCity, tPlayer, pPlayer)
	if not pcCity:IsHasBuilding(bSpyDummy1) then
		pcCity:SetNumRealBuilding(bSpyDummy1, 1);
	end
	if pcCity:GetNumBuilding(bSpyDummy2) == 0 then
		pcCity:SetNumRealBuilding(bSpyDummy2, AntiLength);
	elseif pcCity:GetNumBuilding(bSpyDummy2) >= 1 then
		local TurnCount = ((pcCity:GetNumBuilding(bSpyDummy2)) + AntiLength);
		pcCity:SetNumRealBuilding(bSpyDummy2, TurnCount);
	end
	if (tPlayer:IsHuman()) then
		Events.GameplayAlertMessage("[COLOR_NEGATIVE_TEXT]Our intelligence network is having difficulty tracking " .. Locale.ConvertTextKey(pPlayer:GetCivilizationAdjective()) .. " spies![ENDCOLOR]");	
	end
end

function CounterMissionAI(pcCity, pPlayer)
	if not pcCity:IsHasBuilding(bSpyDummy1) then
		pcCity:SetNumRealBuilding(bSpyDummy1, 1);
	end
	if pcCity:GetNumBuilding(bSpyDummy2) == 0 then
		pcCity:SetNumRealBuilding(bSpyDummy2, AntiLength);
	elseif pcCity:GetNumBuilding(bSpyDummy2) >= 1 then
		local TurnCount = ((pcCity:GetNumBuilding(bSpyDummy2)) + AntiLength);
		pcCity:SetNumRealBuilding(bSpyDummy2, TurnCount);
	end
end

function GetMission1Gold(pPlayer, tPlayer)
	local pTeam = pPlayer:GetTeam();
	local Gold = 100;
	if speed == GameInfo.GameSpeeds['GAMESPEED_QUICK'].ID then
		Gold = (100 + ((Teams[pTeam]:GetCurrentEra()) * 33));
	elseif speed == GameInfo.GameSpeeds['GAMESPEED_STANDARD'].ID then
		Gold = (150 + ((Teams[pTeam]:GetCurrentEra()) * 50));
	elseif speed == GameInfo.GameSpeeds['GAMESPEED_EPIC'].ID then
		Gold = (225 + ((Teams[pTeam]:GetCurrentEra()) * 75));
	elseif speed == GameInfo.GameSpeeds['GAMESPEED_MARATHON'].ID then
		Gold = (450 + ((Teams[pTeam]:GetCurrentEra()) * 150));
	else
		Gold = (450 + ((Teams[pTeam]:GetCurrentEra()) * 150));
	end
	local tReserves = (tPlayer:GetGold());
	if (tReserves - 1) <= Gold then
		Gold = tReserves
	end
	if Gold <= 1 then
		Gold = 1;
	end
	return math.ceil(Gold)
end

function StealGoldMission(pPlayer, tPlayer)
	local Gold = GetMission1Gold(pPlayer, tPlayer);
	pPlayer:ChangeGold(Gold);
	tPlayer:ChangeGold(-Gold);
	if tPlayer:GetGold() <= 0 then
		tPlayer:SetGold(1);
	end
	if (tPlayer:IsHuman()) then
		Events.GameplayAlertMessage("[COLOR_NEGATIVE_TEXT]A " .. Locale.ConvertTextKey(pPlayer:GetCivilizationAdjective()) .. " Great Spy has stolen " .. Gold .. " [ICON_GOLD] Gold from your Treasury ![ENDCOLOR]");	
	end
end

function InciteCityMission(pPlayer, tPlayer)
	local tCity = tPlayer:GetCapitalCity();
	tCity:ChangeResistanceTurns(ResistLength);
	if (tPlayer:IsHuman()) then
		Events.GameplayAlertMessage("[COLOR_NEGATIVE_TEXT]A " .. Locale.ConvertTextKey(pPlayer:GetCivilizationAdjective()) .. " Great Spy has incited riots in " .. Locale.ConvertTextKey(tCity:GetName()) .. "![ENDCOLOR]");	
	end
end

function SpreadPropagandaMission(pPlayer, tPlayer)
	local tCulture = tPlayer:GetJONSCulture();
	local nCulture = math.floor(tCulture / 4);
	if (tCulture - nCulture) <= 0 then
		tPlayer:SetJONSCulture(1)
		nCulture = 1;
	else
		tPlayer:ChangeJONSCulture(-nCulture);
	end
	local tGAPoints = tPlayer:GetGoldenAgeProgressMeter();
	local nGAPoints = math.floor(tGAPoints / 4);
	if (tGAPoints - nGAPoints) <= 0 then
		tPlayer:SetGoldenAgeProgressMeter(1);
		nGAPoints = 1;
	else
		tPlayer:ChangeGoldenAgeProgressMeter(-nGAPoints);
	end
	if (tPlayer:IsHuman()) then
		Events.GameplayAlertMessage("[COLOR_NEGATIVE_TEXT]" .. Locale.ConvertTextKey(pPlayer:GetCivilizationAdjective()) .. " propaganda has reduced your [ICON_CULTURE] Culture progress by " .. nCulture .. " and your [ICON_GOLDEN_AGE] Golden Age progress by " .. nGAPoints .."![ENDCOLOR]");	
	end
end

function PoisonWaterMission(pPlayer, tPlayer)
	local tCity = tPlayer:GetCapitalCity();
	local Poison = EscapeChance(2, 4);
	if tCity:GetPopulation() >= (Poison + 1) then
		tCity:ChangePopulation(-Poison, true);
	elseif tCity:GetPopulation() <= (Poison) then
		local Default = (tCity:GetPopulation() - 1);
		tCity:ChangePopulation(-Default, true);				
	end
	if (tPlayer:IsHuman()) then
		Events.GameplayAlertMessage("[COLOR_NEGATIVE_TEXT]A " .. Locale.ConvertTextKey(pPlayer:GetCivilizationAdjective()) .. " Great Spy has poisoned the water supply of " .. Locale.ConvertTextKey(tCity:GetName()) .. "![ENDCOLOR]");	
	end
end

function CauseAnarchyMission(pPlayer, tPlayer)
	local Turns = math.floor(GABonusLength / 3);
	--local Turns = math.floor(GABonusLength / 4);
	if tPlayer:IsAnarchy() then
		tPlayer:ChangeAnarchyNumTurns(Turns);
	else
		tPlayer:SetAnarchyNumTurns(Turns);
	end
	if (tPlayer:IsHuman()) then
		Events.GameplayAlertMessage("[COLOR_NEGATIVE_TEXT]A " .. Locale.ConvertTextKey(pPlayer:GetCivilizationAdjective()) .. " Great Spy is causing [ICON_RAZING] Anarchy![ENDCOLOR]");	
	end
end

function SabotageProductionMission(pPlayer, tPlayer)
	for tCity in tPlayer:Cities() do
		if tCity:GetProduction() >= 1 then
			if tCity:GetProductionBuilding() ~= -1 then
				local pBuilding = tCity:GetProductionBuilding();
				local BClass = GameInfo.Buildings[pBuilding].BuildingClass;
				local BWonder = GameInfo.BuildingClasses["" .. BClass .. ""].MaxGlobalInstances;
				local BNational = GameInfo.BuildingClasses["" .. BClass .. ""].MaxPlayerInstances;
				if (BWonder == 1) or (BNational == 1) then
					local cProduction = tCity:GetProduction();
					local dProduction = math.floor(cProduction / 4);
					if (cProduction - dProduction) >= 1 then
						tCity:ChangeProduction(-dProduction)
					end
				end
			end
			if tCity:GetProductionProject() ~= -1 then
				local pProject = tCity:GetProductionProject();
				local cProduction = tCity:GetProduction();
				local dProduction = math.floor(cProduction / 4);
				if (cProduction - dProduction) >= 1 then
					tCity:ChangeProduction(-dProduction)
				end
			end
		end
	end
	local tProgress = tPlayer:GetResearchProgress(tPlayer:GetCurrentResearch());
	local dProgress = math.floor(tProgress / 4);
	if (tProgress - dProgress) >= 1 then
		local tTeamTechs = Teams[tPlayer:GetTeam()]:GetTeamTechs()
		tTeamTechs:ChangeResearchProgress(tPlayer:GetCurrentResearch(), -dProgress, tPlayer:GetID());
	end
	if (tPlayer:IsHuman()) then
		Events.GameplayAlertMessage("[COLOR_NEGATIVE_TEXT]A " .. Locale.ConvertTextKey(pPlayer:GetCivilizationAdjective()) .. " Great Spy has destroyed " .. dProgress .. " [ICON_RESEARCH] Research and sabotaged Wonder [ICON_PRODUCTION] Production![ENDCOLOR]");	
	end
end

function SpawnPartisian(tPlot, iUnit)
	bUnit = Barbarians:InitUnit(iUnit, tPlot:GetX(), tPlot:GetY())
	bUnit:JumpToNearestValidPlot()
end

function RecruitPartisiansMission(pPlayer, tPlayer)
	local pcCity = pPlayer:GetCapitalCity();
	local tCity = tPlayer:GetCapitalCity();
	local tPlot = nil;
	local tnPlot = nil;
	local plotX = tCity:GetX();
	local plotY = tCity:GetY();
	for iDX = -3, 3 do
		for iDY = -3, 3 do
			local pTargetPlot = Map.PlotXYWithRangeCheck(plotX, plotY, iDX, iDY, 3);
			if pTargetPlot then
				if (pTargetPlot:GetOwner() == tCity:GetOwner()) then
					if not pTargetPlot:IsUnit() then
						tPlot = pTargetPlot;
						break;
					end
				end
			end
		end
	end
	if tPlot ~= nil then
		local Resist = EscapeChance(1, 2);
		for _, iUnit in pairs(LandInfantry) do
			if pcCity:CanTrain(iUnit) then
				SpawnPartisian(tPlot, iUnit);
				SpawnPartisian(tPlot, iUnit);
				break;
			end
		end
		if Resist == 2 then
			for _, iUnit in pairs(LandInfantry) do
				if pcCity:CanTrain(iUnit) then
					SpawnPartisian(tPlot, iUnit);		
					break;
				end
			end
		end
	elseif tPlot == nil then
		for pCity in tPlayer:Cities() do
			local plotX = pCity:GetX();
			local plotY = pCity:GetY();
			for iDX = -3, 3 do
				for iDY = -3, 3 do
					local pTargetPlot = Map.PlotXYWithRangeCheck(plotX, plotY, iDX, iDY, 3);
					if pTargetPlot then
						if (pTargetPlot:GetOwner() == pCity:GetOwner()) then
							if not pTargetPlot:IsUnit() then
								tnPlot = pTargetPlot;
								break;
							end
						end
					end
				end
			end
		end
		if tnPlot ~= nil then
			local Resist = EscapeChance(1, 2);
			for _, iUnit in pairs(LandInfantry) do
				if pcCity:CanTrain(iUnit) then
					SpawnPartisian(tnPlot, iUnit);
					SpawnPartisian(tnPlot, iUnit);
					break;
				end
			end
			if Resist == 2 then
				for _, iUnit in pairs(LandInfantry) do
					if pcCity:CanTrain(iUnit) then
						SpawnPartisian(tnPlot, iUnit);		
						break;
					end
				end
			end
		end
	end
	if tPlot ~= nil then
		if (tPlayer:IsHuman()) then
			Events.GameplayAlertMessage("[COLOR_NEGATIVE_TEXT]A " .. Locale.ConvertTextKey(pPlayer:GetCivilizationAdjective()) .. " Great Spy has recruited partisans to pillage near " .. Locale.ConvertTextKey(tCity:GetName()) .. "![ENDCOLOR]");	
		end
	elseif (tPlot == nil) and (tnPlot ~= nil) then
		if (tPlayer:IsHuman()) then
			Events.GameplayAlertMessage("[COLOR_NEGATIVE_TEXT]A " .. Locale.ConvertTextKey(pPlayer:GetCivilizationAdjective()) .. " Great Spy has recruited partisans to pillage your territory![ENDCOLOR]");	
		end
	elseif (tPlot == nil) and (tnPlot == nil) then
		CounterMission(pcCity, tPlayer, pPlayer);
	end
end

function CheckGreatSlots(pPlayer, tPlayer)
	local tCity = tPlayer:GetCapitalCity();
	local SlotCheck = 0;
	if pPlayer:HasAvailableGreatWorkSlot(greatWorkSlotMusicID) then
		for pBuilding in GameInfo.Buildings() do
			if (pBuilding.GreatWorkCount > 0) then
				if (pBuilding.GreatWorkSlotType == "GREAT_WORK_SLOT_MUSIC") then
					if (tCity:IsHasBuilding(pBuilding.ID)) then
						for pClass in GameInfo.BuildingClasses() do
							if pClass.Type == pBuilding.BuildingClass then								
								if tCity:GetNumGreatWorksInBuilding(pClass.ID) > 0 then
									local iWorkSlot;
									for iWorkSlot = 0, pBuilding.GreatWorkCount-1, 1 do
										local iWork = tCity:GetBuildingGreatWork(pClass.ID, slot)
										if (iWork ~= -1) then
											SlotCheck = 1;
											break;
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
	if SlotCheck == 0 then
		if pPlayer:HasAvailableGreatWorkSlot(greatWorkSlotWritingID) then
			for pBuilding in GameInfo.Buildings() do
				if (pBuilding.GreatWorkCount > 0) then
					if (pBuilding.GreatWorkSlotType == "GREAT_WORK_SLOT_LITERATURE") then
						if (tCity:IsHasBuilding(pBuilding.ID)) then
							for pClass in GameInfo.BuildingClasses() do
								if pClass.Type == pBuilding.BuildingClass then								
									if tCity:GetNumGreatWorksInBuilding(pClass.ID) > 0 then
										local iWorkSlot;
										for iWorkSlot = 0, pBuilding.GreatWorkCount-1, 1 do
											local iWork = tCity:GetBuildingGreatWork(pClass.ID, slot)
											if (iWork ~= -1) then
												SlotCheck = 2;
												break;
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
	if SlotCheck == 0 then
		if pPlayer:HasAvailableGreatWorkSlot(greatWorkSlotArtID) then
			for pBuilding in GameInfo.Buildings() do
				if (pBuilding.GreatWorkCount > 0) then
					if (pBuilding.GreatWorkSlotType == "GREAT_WORK_SLOT_ART_ARTIFACT") then
						if (tCity:IsHasBuilding(pBuilding.ID)) then
							for pClass in GameInfo.BuildingClasses() do
								if pClass.Type == pBuilding.BuildingClass then								
									if tCity:GetNumGreatWorksInBuilding(pClass.ID) > 0 then
										local iWorkSlot;
										for iWorkSlot = 0, pBuilding.GreatWorkCount-1, 1 do
											local iWork = tCity:GetBuildingGreatWork(pClass.ID, slot)
											if (iWork ~= -1) then
												SlotCheck = 3;
												break;
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end		
	return SlotCheck;
end

function GetNextFreeSlot(pCity, iBuilding)
    local sBuilding = GameInfo.Buildings[iBuilding]
    local iAvailableSlots = sBuilding.GreatWorkCount   
    for iSlot = 0, iAvailableSlots-1, 1 do
			local iWork = pCity:GetBuildingGreatWork(GameInfoTypes[sBuilding.BuildingClass], iSlot)
			if (iWork == -1) then
			return iSlot
		end
    end
end

function StealGreatWorkMission(pPlayer, tPlayer, SlotCheck, pcCity)
	local tCity = tPlayer:GetCapitalCity();
	local iCapX = pcCity:GetX();
	local iCapY = pcCity:GetY();
	local WorkName = "";
	if SlotCheck == 1 then
		local pCity = pPlayer:GetCityOfClosestGreatWorkSlot(iCapX, iCapY, greatWorkSlotMusicID);
        local iBuilding = pPlayer:GetBuildingOfClosestGreatWorkSlot(iCapX, iCapY, greatWorkSlotMusicID);
        local iBuildingClass = GameInfoTypes[GameInfo.Buildings[iBuilding].BuildingClass];
		local iSlot = GetNextFreeSlot(pCity, iBuilding);
		for pBuilding in GameInfo.Buildings() do
			if (pBuilding.GreatWorkCount > 0) then
				if (pBuilding.GreatWorkSlotType == "GREAT_WORK_SLOT_MUSIC") then
					if (tCity:IsHasBuilding(pBuilding.ID)) then
						for pClass in GameInfo.BuildingClasses() do
							if pClass.Type == pBuilding.BuildingClass then								
								if tCity:GetNumGreatWorksInBuilding(pClass.ID) > 0 then
									local iOtherSlot;
									for iOtherSlot = 0, pBuilding.GreatWorkCount-1, 1 do
										local iOtherWork = tCity:GetBuildingGreatWork(pClass.ID, iOtherSlot);
										if (iOtherWork ~= -1) then
											WorkName = Locale.Lookup(Game.GetGreatWorkName(iOtherWork));										
											pCity:SetBuildingGreatWork(iBuildingClass,iSlot,iOtherWork);
											tCity:SetBuildingGreatWork(pClass.ID,iOtherSlot,-1);
											break;
										end
									end
								end
							end
						end
					end
				end
			end
		end
	elseif SlotCheck == 2 then
		local pCity = pPlayer:GetCityOfClosestGreatWorkSlot(iCapX, iCapY, greatWorkSlotWritingID);
        local iBuilding = pPlayer:GetBuildingOfClosestGreatWorkSlot(iCapX, iCapY, greatWorkSlotWritingID);
        local iBuildingClass = GameInfoTypes[GameInfo.Buildings[iBuilding].BuildingClass];
		local iSlot = GetNextFreeSlot(pCity, iBuilding);
		for pBuilding in GameInfo.Buildings() do
			if (pBuilding.GreatWorkCount > 0) then
				if (pBuilding.GreatWorkSlotType == "GREAT_WORK_SLOT_LITERATURE") then
					if (tCity:IsHasBuilding(pBuilding.ID)) then
						for pClass in GameInfo.BuildingClasses() do
							if pClass.Type == pBuilding.BuildingClass then								
								if tCity:GetNumGreatWorksInBuilding(pClass.ID) > 0 then
									local iOtherSlot;
									for iOtherSlot = 0, pBuilding.GreatWorkCount-1, 1 do
										local iOtherWork = tCity:GetBuildingGreatWork(pClass.ID, iOtherSlot);
										if (iOtherWork ~= -1) then	
											WorkName = Locale.Lookup(Game.GetGreatWorkName(iOtherWork));						
											pCity:SetBuildingGreatWork(iBuildingClass,iSlot,iOtherWork);
											tCity:SetBuildingGreatWork(pClass.ID,iOtherSlot,-1);
											break;
										end
									end
								end
							end
						end
					end
				end
			end
		end
	elseif SlotCheck == 3 then
		local pCity = pPlayer:GetCityOfClosestGreatWorkSlot(iCapX, iCapY, greatWorkSlotArtID);
        local iBuilding = pPlayer:GetBuildingOfClosestGreatWorkSlot(iCapX, iCapY, greatWorkSlotArtID);
        local iBuildingClass = GameInfoTypes[GameInfo.Buildings[iBuilding].BuildingClass];
		local iSlot = GetNextFreeSlot(pCity, iBuilding);
		for pBuilding in GameInfo.Buildings() do
			if (pBuilding.GreatWorkCount > 0) then
				if (pBuilding.GreatWorkSlotType == "GREAT_WORK_SLOT_ART_ARTIFACT") then
					if (tCity:IsHasBuilding(pBuilding.ID)) then
						for pClass in GameInfo.BuildingClasses() do
							if pClass.Type == pBuilding.BuildingClass then								
								if tCity:GetNumGreatWorksInBuilding(pClass.ID) > 0 then
									local iOtherSlot;
									for iOtherSlot = 0, pBuilding.GreatWorkCount-1, 1 do
										local iOtherWork = tCity:GetBuildingGreatWork(pClass.ID, iOtherSlot);
										if (iOtherWork ~= -1) then	
											WorkName = Locale.Lookup(Game.GetGreatWorkName(iOtherWork));					
											pCity:SetBuildingGreatWork(iBuildingClass,iSlot,iOtherWork);
											tCity:SetBuildingGreatWork(pClass.ID,iOtherSlot,-1);
											break;
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
	if (tPlayer:IsHuman()) then
		Events.GameplayAlertMessage("[COLOR_NEGATIVE_TEXT]A " .. Locale.ConvertTextKey(pPlayer:GetCivilizationAdjective()) .. " Great Spy has stolen the Great Work ''" .. WorkName .. "'' from " .. Locale.ConvertTextKey(tCity:GetName()) .. "![ENDCOLOR]");	
	end
end

function KidnapGreatPersonMission(pPlayer, tPlayer, impPlot, pcCity)
	local Type = "Academy";
	if (impPlot:GetImprovementType() == iAcademy) then
		impPlot:SetImprovementType(-1);
		bUnit = pPlayer:InitUnit(iScientist, pcCity:GetX(), pcCity:GetY(), UNITAI_SCIENTIST);
		bUnit:JumpToNearestValidPlot();
		bUnit:SetMoves(0);
		Type = "Academy";
	elseif (impPlot:GetImprovementType() == iCustoms) then
		impPlot:SetImprovementType(-1);
		bUnit = pPlayer:InitUnit(iMerchant, pcCity:GetX(), pcCity:GetY(), UNITAI_MERCHANT);
		bUnit:JumpToNearestValidPlot();
		bUnit:SetMoves(0);
		Type = "Customs House";
	elseif (impPlot:GetImprovementType() == iFactory) then
		impPlot:SetImprovementType(-1);
		bUnit = pPlayer:InitUnit(iEngineer, pcCity:GetX(), pcCity:GetY(), UNITAI_ENGINEER);
		bUnit:JumpToNearestValidPlot();
		bUnit:SetMoves(0);
		Type = "Manufactory";
	elseif (impPlot:GetImprovementType() == iCitadel) then
		impPlot:SetImprovementType(-1);
		bUnit = pPlayer:InitUnit(iGeneral, pcCity:GetX(), pcCity:GetY(), UNITAI_GENERAL);
		bUnit:JumpToNearestValidPlot();
		bUnit:SetMoves(0);
		Type = "Citadel";
	elseif (impPlot:GetImprovementType() == iShrine) then
		impPlot:SetImprovementType(-1);
		bUnit = pPlayer:InitUnit(iProphet, pcCity:GetX(), pcCity:GetY(), UNITAI_PROPHET);
		bUnit:JumpToNearestValidPlot();
		bUnit:SetMoves(0);
		Type = "Holy Site";
	end
	if (tPlayer:IsHuman()) then
		Events.GameplayAlertMessage("[COLOR_NEGATIVE_TEXT]A " .. Locale.ConvertTextKey(pPlayer:GetCivilizationAdjective()) .. " Great Spy has destroyed a " .. Type .. "![ENDCOLOR]");	
	end
end

function SellInfoMission(pPlayer, tPlayer)
	pPlayer:ChangeScoreFromFutureTech(4);
	if (tPlayer:IsHuman()) then
		Events.GameplayAlertMessage("[COLOR_NEGATIVE_TEXT]A " .. Locale.ConvertTextKey(pPlayer:GetCivilizationAdjective()) .. " Great Spy is selling intelligence to our enemies![ENDCOLOR]");	
	end
end

function DestroyResourceMission(pPlayer, tPlayer, recPlot)
	local ResourceName = "";
	if recPlot:GetResourceType() ~= -1 then
		if recPlot:GetImprovementType() ~= 1 then
			local pImprovment = recPlot:GetImprovementType();
			recPlot:SetImprovementType(-1);
			local pResource = recPlot:GetResourceType();
			ResourceName = Locale.ConvertTextKey(GameInfo.Resources[recPlot:GetResourceType()].Description);
			local rCount = recPlot:GetNumResource();
			if rCount <= 2 then	
				recPlot:SetResourceType(-1);
			elseif rCount > 2 then	
				local rDif = (rCount - 2);
				recPlot:SetNumResource(rDif);
			end
			if pImprovment == iMound then
				pPlot:SetImprovementType(pImprovment);
			end
		else
			local pResource = recPlot:GetResourceType();
			ResourceName = Locale.ConvertTextKey(GameInfo.Resources[recPlot:GetResourceType()].Description);
			local rCount = recPlot:GetNumResource();
			if rCount <= 2 then	
				recPlot:SetResourceType(-1);
			elseif rCount > 2 then	
				local rDif = (rCount - 2);
				recPlot:SetNumResource(rDif);
			end
		end
	end
	if (tPlayer:IsHuman()) then
		Events.GameplayAlertMessage("[COLOR_NEGATIVE_TEXT]A " .. Locale.ConvertTextKey(pPlayer:GetCivilizationAdjective()) .. " Great Spy has sabotaged a source of " .. ResourceName .. "![ENDCOLOR]");	
	end
end

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local pPlayer = Players[iPlayer];
	local pTeam = pPlayer:GetTeam();
	local pID = pPlayer:GetID();
	if (pPlayer:IsAlive()) and (pPlayer:GetNumCities() >= 1) and (pPlayer:GetUnitClassCount(ucSpy) >= 1) and not pPlayer:IsHuman() and not pPlayer:IsMinorCiv() and not pPlayer:IsBarbarian() then
		local pcCity = pPlayer:GetCapitalCity();
		local IntelPool = GetIntelPool(pPlayer);
		local SpyThreshold = GetSpyThreshold(pPlayer);
		if IntelPool >= math.floor(SpyThreshold * 0.2) then
			local PossibleCount = 0;
			for iPlayer=0, GameDefines.MAX_MAJOR_CIVS-1 do
				local oPlayer = Players[iPlayer];
				local oTeam = oPlayer:GetTeam();
				local oID = oPlayer:GetID();
				if oPlayer:IsAlive() and (oPlayer ~= pPlayer) and (oPlayer ~= bPlayer) then
					if (Teams[pTeam]:IsHasMet(oTeam)) and (oPlayer:GetNumCities() >= 1) then
						local iApproach = oPlayer:GetApproachTowardsUsGuess(pID);
						if iApproach < 5 or (Teams[pTeam]:IsAtWar(oTeam)) then
							if oPlayer:GetBuildingClassCount(bcSpyDummy2) <= 0 then
								if (not oPlayer:IsHuman() and (oPlayer:GetScore() >= (math.floor(pPlayer:GetScore() * 0.9)))) or (oPlayer:IsHuman() and (oPlayer:GetScore() >= (math.floor(pPlayer:GetScore() * 0.9)))) then
									PossibleCount = PossibleCount + 1 
								end
							end
						end
					end
				end
			end
			local pUnit = nil;			
			for sUnit in pPlayer:Units() do
				if sUnit:GetUnitClassType() == ucSpy then
					pUnit = sUnit;
					break;
				end
			end
			if pUnit ~= nil then	
				if PossibleCount == 0 then
					--
					pUnit:Kill(true);
					local Cost = math.floor(SpyThreshold * 0.1);
					SaveIntelPool(pPlayer, -Cost);
					--
					CounterMissionAI(pcCity, pPlayer);
				elseif PossibleCount >= 1 then	
					local ChooseTarget = 0;
					local Target = EscapeChance(1, PossibleCount);
					local tPlayer = pPlayer;
					for iPlayer=0, GameDefines.MAX_MAJOR_CIVS-1 do
						local oPlayer = Players[iPlayer];
						local oTeam = oPlayer:GetTeam();
						local oID = oPlayer:GetID();
						if oPlayer:IsAlive() and (oPlayer ~= pPlayer) and (oPlayer ~= bPlayer) then
							if (Teams[pTeam]:IsHasMet(oTeam)) and (oPlayer:GetNumCities() >= 1) then
								local iApproach = oPlayer:GetApproachTowardsUsGuess(pID);
								if iApproach < 5 or (Teams[pTeam]:IsAtWar(oTeam)) then
									if oPlayer:GetBuildingClassCount(bcSpyDummy2) <= 0 then
										if (not oPlayer:IsHuman() and (oPlayer:GetScore() >= (math.floor(pPlayer:GetScore() * 0.9)))) or (oPlayer:IsHuman() and (oPlayer:GetScore() >= (math.floor(pPlayer:GetScore() * 0.9)))) then
											ChooseTarget = ChooseTarget + 1;
											if ChooseTarget == Target then
												tPlayer = oPlayer;
												break;
											end
										end
									end
								end
							end
						end
					end
					if tPlayer ~= pPlayer then
						local tID = tPlayer:GetID();
						--
						pUnit:Kill(true);
						local Cost = math.floor(SpyThreshold * 0.1);
						SaveIntelPool(pPlayer, -Cost);
						--
						local ran = 16
						if not tPlayer:IsHuman() then
							ran = 12
						end
						local ChooseMission = EscapeChance(1, ran);
						if (ChooseMission == 1) then
							CounterMission(pcCity, tPlayer, pPlayer);
						elseif (ChooseMission == 2) or (ChooseMission == 3) then
							StealGoldMission(pPlayer, tPlayer);
						elseif (ChooseMission == 4) or (ChooseMission == 5) then
							InciteCityMission(pPlayer, tPlayer);
						elseif (ChooseMission == 6) or (ChooseMission == 7) then
							PoisonWaterMission(pPlayer, tPlayer);
						elseif (ChooseMission == 8) or (ChooseMission == 9) then
							SellInfoMission(pPlayer, tPlayer);
						elseif ChooseMission == 10 then
							SpreadPropagandaMission(pPlayer, tPlayer);
						elseif ChooseMission == 11 then
							SabotageProductionMission(pPlayer, tPlayer);
						elseif ChooseMission == 12 then
							CauseAnarchyMission(pPlayer, tPlayer);
						elseif ChooseMission == 13 then
							RecruitPartisiansMission(pPlayer, tPlayer);
						elseif ChooseMission == 14 then
							local SlotCheck = CheckGreatSlots(pPlayer, tPlayer);
							if SlotCheck >= 1 then
								StealGreatWorkMission(pPlayer, tPlayer, SlotCheck, pcCity);
							elseif SlotCheck <= 0 then
								CounterMission(pcCity, tPlayer, pPlayer);
							end
						elseif ChooseMission == 15 then
							local impPlot = nil;
							for sKey, tTable in pairs(GpImprovementPlots) do
								local tempPlot = DecompilePlotID(sKey)
								if tempPlot:GetOwner() == tID then
									if (tempPlot:GetImprovementType() == iCustoms) or (tempPlot:GetImprovementType() == iAcademy) or  (tempPlot:GetImprovementType() == iCitadel) or (tempPlot:GetImprovementType() == iFactory) or (tempPlot:GetImprovementType() == iShrine) then
										impPlot = tempPlot;
										break;
									end
								end
							end
							if impPlot ~= nil then
								KidnapGreatPersonMission(pPlayer, tPlayer, impPlot, pcCity);
							elseif impPlot == nil then
								CounterMission(pcCity, tPlayer, pPlayer);
							end
						elseif ChooseMission == 16 then
							local recPlot = nil;
							for sKey, tTable in pairs(GpResourcePlots) do
								local tempPlot = DecompilePlotID(sKey)
								if tempPlot:GetOwner() == tID then
									if (tempPlot:GetResourceType() == rHorse) or (tempPlot:GetResourceType() == rIron) or (tempPlot:GetResourceType() == rCoal) or (tempPlot:GetResourceType() == rAluminum) or (tempPlot:GetResourceType() == rOil) or (tempPlot:GetResourceType() == rUranium) then
										local pResource = tempPlot:GetResourceType();
										local pTeam = pPlayer:GetTeam();
										local tTeam = tPlayer:GetTeam();
										local rReveal = GameInfo.Resources[pResource].TechReveal;
										local rTech = GameInfo.Technologies["" .. rReveal .. ""].ID
										if (Teams[pTeam]:IsHasTech(rTech)) then
											if (load(tPlayer, "TARGET_AI_RESOURCE_" .. pResource) ~= true) then
												recPlot = tempPlot;
												break;
											end
										end
									end
								end
							end
							if recPlot ~= nil then
								local pResource = recPlot:GetResourceType();
								save(tPlayer, "TARGET_AI_RESOURCE_" .. pResource, true)
								DestroyResourceMission(pPlayer, tPlayer, recPlot);
							elseif recPlot == nil then
								CounterMission(pcCity, tPlayer, pPlayer);
							end
						end
					end
				end
			end			
		end			
	end
end)
