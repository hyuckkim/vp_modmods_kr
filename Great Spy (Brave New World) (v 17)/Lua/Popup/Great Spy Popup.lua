print ("Spy Popup")

include("IconSupport");
include("InstanceManager");
include("InfoTooltipInclude");

--SaveUtils
WARN_NOT_SHARED = false; include( "SaveUtils" ); MY_MOD_NAME = "Great Spy Popup";

--Stuff
local speed = Game.GetGameSpeedType();

local Barbarians = Players[63]
local bTeam = Barbarians:GetTeam();

local ucSpy = GameInfoTypes.UNITCLASS_TOMATEKH_SPY;

local pSpy = GameInfoTypes.PROMOTION_TOMATEKH_SPY;
local pSpy1 = GameInfoTypes.PROMOTION_TOMATEKH_SPY_XP1;
local pSpy2 = GameInfoTypes.PROMOTION_TOMATEKH_SPY_XP2;
local pSpy3 = GameInfoTypes.PROMOTION_TOMATEKH_SPY_XP3;
local pSpyNull = GameInfoTypes.PROMOTION_TOMATEKH_SPY_NULL;

directions = {DirectionTypes.DIRECTION_NORTHEAST, DirectionTypes.DIRECTION_EAST, DirectionTypes.DIRECTION_SOUTHEAST,
              DirectionTypes.DIRECTION_SOUTHWEST, DirectionTypes.DIRECTION_WEST, DirectionTypes.DIRECTION_NORTHWEST}

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

local rAluminum = GameInfoTypes.RESOURCE_ALUMINUM;
local rCoal = GameInfoTypes.RESOURCE_COAL;
local rIron = GameInfoTypes.RESOURCE_IRON;
local rOil = GameInfoTypes.RESOURCE_OIL;
local rUranium = GameInfoTypes.RESOURCE_URANIUM;
local rHorse = GameInfoTypes.RESOURCE_HORSE;

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

local bSpyDummy1 = GameInfoTypes.BUILDING_TOMATEKH_SPY_DUMMY_1;
local bSpyDummy2 = GameInfoTypes.BUILDING_TOMATEKH_SPY_DUMMY_2;

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

-------------------------------------------------------------------------------
local SpyID = GameInfo.Units["UNIT_TOMATEKH_SPY"].ID;

local sCitizen = GameInfo.Specialists.SPECIALIST_CITIZEN.ID;

local bSpyCount1 = GameInfoTypes.BUILDING_TOMATEKH_SPY_DUMMY_1S;
local bSpyCount10 = GameInfoTypes.BUILDING_TOMATEKH_SPY_DUMMY_10S;
local bSpyCount100 = GameInfoTypes.BUILDING_TOMATEKH_SPY_DUMMY_100S;
local bSpyCount1000 = GameInfoTypes.BUILDING_TOMATEKH_SPY_DUMMY_1000S;
local bSpyCount10000 = GameInfoTypes.BUILDING_TOMATEKH_SPY_DUMMY_10000S;
local bSpyCountMAX = GameInfoTypes.BUILDING_TOMATEKH_SPY_DUMMY_MAX;
local bSpySpawn = GameInfoTypes.BUILDING_TOMATEKH_SPY_DUMMY_4;

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
					if not Players[oCity:GetOriginalOwner()]:IsMinorCiv() then
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
					if not Players[mCity:GetOriginalOwner()]:IsMinorCiv() then
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
			if not pPlayer:IsMinorCiv() then
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
			local IPT = math.ceil(pPlayer:GetTotalFaithPerTurn() * 0.1);
			IntelPoints = IntelPoints + IPT;
		end
	end
	--
	TurnIntel = IntelPoints;
	return TurnIntel;
end

-------------------------------------------------------------------------------
function GetOperative(pPlayer)
	local pUnit;
	for sUnit in pPlayer:Units() do
		if sUnit:GetUnitClassType() == ucSpy then
			if sUnit:IsHasPromotion(pSpyNull) then
				pUnit = sUnit;
				break;
			end
		end
	end
	return pUnit;
end

function PromoteGreatSpy(pUnit)
	if pUnit:IsHasPromotion(pSpy2) then
		pUnit:SetHasPromotion(pSpy2, false)	
		pUnit:SetHasPromotion(pSpy3, true)	
	elseif pUnit:IsHasPromotion(pSpy1) then
		pUnit:SetHasPromotion(pSpy1, false)	
		pUnit:SetHasPromotion(pSpy2, true)			
	elseif pUnit:IsHasPromotion(pSpy) then
		pUnit:SetHasPromotion(pSpy, false)	
		pUnit:SetHasPromotion(pSpy1, true)						
	end
end

function GetTargetCity(pUnit, pPlot)
	local CityCheck = 0;
	for loop, direction in ipairs(directions) do
		local adjPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), direction);
		if adjPlot then
			if (adjPlot:IsCity()) then
				pCity = adjPlot:GetPlotCity();
				if pCity:GetOwner() ~= pUnit:GetOwner() then
					CityCheck = 1;
				end
			end
		end
	end
	return CityCheck;
end

function GetTargetCapital(pUnit, pPlot)
	local CityCheck = 0;
	for loop, direction in ipairs(directions) do
		local adjPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), direction);
		if adjPlot then
			if (adjPlot:IsCity()) then
				pCity = adjPlot:GetPlotCity();
				if pCity:GetOwner() ~= pUnit:GetOwner() then
					if pCity:IsCapital() then
						CityCheck = 1;
					end
				end
			end
		end
	end
	return CityCheck;
end

function GetNearestAdjacentCity(pPlayer, pUnit, pPlot)
	local tPlayer = Players[pPlot:GetOwner()];
	local tCity = tPlayer:GetCapitalCity();
	for loop, direction in ipairs(directions) do
		local adjPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), direction);
		if adjPlot then
			if (adjPlot:IsCity()) then
				pCity = adjPlot:GetPlotCity();
				if pCity:GetOwner() ~= pUnit:GetOwner() then
					tCity = pCity;
				end
			end
		end
	end
	return tCity;
end

function GetNearestTargetCity(pPlayer, pUnit, pPlot)
	local tPlayer = Players[pPlot:GetOwner()];
	local tCity = tPlayer:GetCapitalCity();
	local pNearestCity = nil;
	local iNearestDistance = 1000000;
	for cityIndex = 0, tPlayer:GetNumCities() - 1, 1 do
		local pCity = tPlayer:GetCityByID(cityIndex);
		if (pCity ~= nil) then
			iDistance = Map.PlotDistance(pPlot:GetX(), pPlot:GetY(), pCity:GetX(), pCity:GetY());
			if (iDistance < iNearestDistance) then
				iNearestDistance = iDistance;
				pNearestCity = pCity;
			end
		end
	end
	if (pNearestCity ~= nil) then
		tCity = pNearestCity;
	end
	return tCity;
end

function GetCityEspionageDefense(pPlayer, pUnit, pPlot, tCity)
	local EspionageLevel = 0;
	if tCity:IsHasBuilding(bEspBuild1) then
		EspionageLevel = EspionageLevel + 1;
	end
	if tCity:IsHasBuilding(bEspBuild2) then
		EspionageLevel = EspionageLevel + 1;
	end
	if tCity:IsHasBuilding(bEspBuild3) then
		EspionageLevel = EspionageLevel + 2;
	end
	if tCity:IsHasBuilding(bEspBuild4) then
		EspionageLevel = EspionageLevel + 2;
	end
	local tPlayer = Players[tCity:GetOwner()];
	if tPlayer:GetCivilizationType() == cTimurids then
		if tCity:IsHasBuilding(bMaydan) then
			EspionageLevel = EspionageLevel + 1;
		end	
	end			
	return EspionageLevel;
end

------------------------------
function GetMission1Gold(pPlayer, pUnit, pPlot)
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
	local tCity = GetNearestAdjacentCity(pPlayer, pUnit, pPlot);
	local EspionageLevel = GetCityEspionageDefense(pPlayer, pUnit, pPlot, tCity);
	if EspionageLevel == 1 then
		Gold = (Gold * 0.95);
	end
	if EspionageLevel == 2 then
		Gold = (Gold * 0.9);
	end
	if EspionageLevel == 3 then
		Gold = (Gold * 0.85);
	end
	if EspionageLevel >= 4 then
		Gold = (Gold * 0.8);
	end
	local tPlayer = Players[pPlot:GetOwner()];
	local tReserves = (tPlayer:GetGold());
	if (tReserves - 1) <= Gold then
		Gold = tReserves
	end
	if Gold <= 1 then
		Gold = 1;
	end
	return math.ceil(Gold)
end

function GetMission1Chance(pPlayer, pUnit, pPlot)
	local Chance = 50;
	if pUnit:IsHasPromotion(pSpy1) then
		Chance = 33;
	end
	if pUnit:IsHasPromotion(pSpy2) then
		Chance = 25;
	end
	if pUnit:IsHasPromotion(pSpy3) then
		Chance = 20;
	end
	local tCity = GetNearestAdjacentCity(pPlayer, pUnit, pPlot);
	local EspionageLevel = GetCityEspionageDefense(pPlayer, pUnit, pPlot, tCity);
	Chance = (Chance - (EspionageLevel * 2.5));
	if pPlayer:GetBuildingClassCount(bcSpyKremlin) >= 1 then
		Chance = Chance + 10;
	end
	if Chance <= 1 then
		Chance = 1;
	end
	if Chance >= 99 then
		Chance = 99;
	end
	return math.floor(Chance);
end

function CheckSpyMission1(pPlayer, pUnit, pPlot)
	local MissionCheck = 0;
	if pPlot:GetOwner() ~= -1 then
		if pPlot:GetOwner() ~= pUnit:GetOwner() then
			local CityCheck = GetTargetCity(pUnit, pPlot);
			if CityCheck == 1 then
				MissionCheck = 1;
			end
		end
	end
	local tPlayer = Players[pPlot:GetOwner()];
	if tPlayer:GetBuildingClassCount(Counterespionage) >= 1 then
		MissionCheck = 0
	end
	return MissionCheck;
end

function GetMission2Chance(pPlayer, pUnit, pPlot)
	local Chance = 33;
	if pUnit:IsHasPromotion(pSpy1) then
		Chance = 25;
	end
	if pUnit:IsHasPromotion(pSpy2) then
		Chance = 20;
	end
	if pUnit:IsHasPromotion(pSpy3) then
		Chance = 15;
	end
	local tCity = GetNearestAdjacentCity(pPlayer, pUnit, pPlot);
	local EspionageLevel = GetCityEspionageDefense(pPlayer, pUnit, pPlot, tCity);
	Chance = (Chance - (EspionageLevel * 2.5));
	if pPlayer:GetBuildingClassCount(bcSpyKremlin) >= 1 then
		Chance = Chance + 10;
	end
	if Chance <= 1 then
		Chance = 1;
	end
	if Chance >= 99 then
		Chance = 99;
	end
	return math.floor(Chance);
end

function CheckSpyMission2(pPlayer, pUnit, pPlot)
	local MissionCheck = 0;
	if pPlot:GetOwner() ~= -1 then
		if pPlot:GetOwner() ~= pUnit:GetOwner() then
			local CityCheck = GetTargetCity(pUnit, pPlot);
			if CityCheck == 1 then
				MissionCheck = 1;
			end
		end
	end
	local tPlayer = Players[pPlot:GetOwner()];
	if tPlayer:GetBuildingClassCount(Counterespionage) >= 1 then
		MissionCheck = 0
	end
	return MissionCheck;
end

function CheckGreatSlots(pPlayer, pUnit, pPlot)
	local tPlayer = Players[pPlot:GetOwner()];
	local tCity = GetNearestAdjacentCity(pPlayer, pUnit, pPlot);
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

function GetMission3Chance(pPlayer, pUnit, pPlot)
	local Chance = 10;
	if pUnit:IsHasPromotion(pSpy1) then
		Chance = 5;
	end
	if pUnit:IsHasPromotion(pSpy2) then
		Chance = 2;
	end
	if pUnit:IsHasPromotion(pSpy3) then
		Chance = 1;
	end
	local tCity = GetNearestAdjacentCity(pPlayer, pUnit, pPlot);
	local EspionageLevel = GetCityEspionageDefense(pPlayer, pUnit, pPlot, tCity);
	Chance = (Chance - (EspionageLevel * 2.5));
	if pPlayer:GetBuildingClassCount(bcSpyKremlin) >= 1 then
		Chance = Chance + 10;
	end
	if Chance <= 1 then
		Chance = 1;
	end
	if Chance >= 99 then
		Chance = 99;
	end
	return math.floor(Chance);
end

function GetMission3Cost(pPlayer, pUnit, pPlot)
	local MissionCost = 0;
	local pcCity = GetPlayersOriginalCity(pPlayer);
	local SpyThreshold = GetSpyThreshold(pPlayer);
	local tCity = GetNearestAdjacentCity(pPlayer, pUnit, pPlot);
	local EspionageLevel = GetCityEspionageDefense(pPlayer, pUnit, pPlot, tCity);
	local tMult = 0.25;
	tMult = (tMult + (EspionageLevel * 0.025));
	local iCost = math.ceil(SpyThreshold * tMult);
	MissionCost = iCost;
	return MissionCost;
end

function CheckSpyMission3(pPlayer, pUnit, pPlot)
	local MissionCheck = 0;
	if pPlot:GetOwner() ~= -1 then
		if pPlot:GetOwner() ~= pUnit:GetOwner() then
			local CityCheck = GetTargetCity(pUnit, pPlot);
			if CityCheck == 1 then
				local MissionCost = GetMission3Cost(pPlayer, pUnit, pPlot);
				MissionCost = math.floor(MissionCost);
				if MissionCost ~= 0 then
					local pcCity = GetPlayersOriginalCity(pPlayer);
					local IntelPool = GetIntelPool(pPlayer);
					if IntelPool >= MissionCost then
						local SlotCheck = CheckGreatSlots(pPlayer, pUnit, pPlot);
						if SlotCheck >= 1 then
							MissionCheck = 1;
						end
					end
				end
			end
		end
	end
	local tPlayer = Players[pPlot:GetOwner()];
	if tPlayer:GetBuildingClassCount(Counterespionage) >= 1 then
		MissionCheck = 0
	end
	return MissionCheck;
end

function GetMission4Cost(pPlayer, pUnit, pPlot)
	local MissionCost = 0;
	local pcCity = GetPlayersOriginalCity(pPlayer);
	local SpyThreshold = GetSpyThreshold(pPlayer);
	local tCity = GetNearestAdjacentCity(pPlayer, pUnit, pPlot);
	local EspionageLevel = GetCityEspionageDefense(pPlayer, pUnit, pPlot, tCity);
	local tMult = 0.5;
	tMult = (tMult + (EspionageLevel * 0.025));
	local iCost = math.ceil(SpyThreshold * tMult);
	MissionCost = iCost;
	return MissionCost;
end

function CheckSpyMission4(pPlayer, pUnit, pPlot)
	local MissionCheck = 0;
	if pPlot:GetOwner() ~= -1 then
		if pPlot:GetOwner() ~= pUnit:GetOwner() then
			if (pPlot:GetImprovementType() == iAcademy) or (pPlot:GetImprovementType() == iCustoms) or (pPlot:GetImprovementType() == iFactory) or (pPlot:GetImprovementType() == iCitadel) or (pPlot:GetImprovementType() == iShrine) or (pPlot:GetImprovementType() == iHospital) or (pPlot:GetImprovementType() == iFair) then			
				local MissionCost = GetMission4Cost(pPlayer, pUnit, pPlot);
				MissionCost = math.floor(MissionCost);
				if MissionCost ~= 0 then
					local pcCity = GetPlayersOriginalCity(pPlayer);
					local IntelPool = GetIntelPool(pPlayer);
					if IntelPool >= MissionCost then
						MissionCheck = 1;
					end
				end
			end
		end
	end
	local tPlayer = Players[pPlot:GetOwner()];
	if tPlayer:GetBuildingClassCount(Counterespionage) >= 1 then
		MissionCheck = 0
	end
	return MissionCheck;
end

function GetMission5Chance(pPlayer, pUnit, pPlot)
	local Chance = 20;
	if pUnit:IsHasPromotion(pSpy1) then
		Chance = 15;
	end
	if pUnit:IsHasPromotion(pSpy2) then
		Chance = 10;
	end
	if pUnit:IsHasPromotion(pSpy3) then
		Chance = 5;
	end
	local tCity = GetNearestTargetCity(pPlayer, pUnit, pPlot);
	local EspionageLevel = GetCityEspionageDefense(pPlayer, pUnit, pPlot, tCity);
	Chance = (Chance - (EspionageLevel * 2.5));
	if pPlayer:GetBuildingClassCount(bcSpyKremlin) >= 1 then
		Chance = Chance + 10;
	end
	if Chance <= 1 then
		Chance = 1;
	end
	if Chance >= 99 then
		Chance = 99;
	end
	return math.floor(Chance);
end

function GetMission5Cost(pPlayer, pUnit, pPlot)
	local MissionCost = 0;
	local pcCity = GetPlayersOriginalCity(pPlayer);
	local SpyThreshold = GetSpyThreshold(pPlayer);
	local tCity = GetNearestAdjacentCity(pPlayer, pUnit, pPlot);
	local EspionageLevel = GetCityEspionageDefense(pPlayer, pUnit, pPlot, tCity);
	local tMult = 0.125;
	tMult = (tMult + (EspionageLevel * 0.025));
	local iCost = math.ceil(SpyThreshold * tMult);
	MissionCost = iCost;
	return MissionCost;
end

function CheckSpyMission5(pPlayer, pUnit, pPlot)
	local pTeam = pPlayer:GetTeam();
	local MissionCheck = 0;
	if pPlot:GetOwner() ~= -1 then
		if pPlot:GetOwner() ~= pUnit:GetOwner() then
			if (pPlot:GetResourceType() ~= -1) then
				local pResource = pPlot:GetResourceType();
				if (pResource == rAluminum) or (pResource == rCoal) or (pResource == rIron) or (pResource == rOil) or (pResource == rUranium) or (pResource == rHorse) then
					local rReveal = GameInfo.Resources[pResource].TechReveal;
					local rTech = GameInfo.Technologies["" .. rReveal .. ""].ID
					if (Teams[pTeam]:IsHasTech(rTech)) then
						local MissionCost = GetMission5Cost(pPlayer, pUnit, pPlot);
						MissionCost = math.floor(MissionCost);
						if MissionCost ~= 0 then
							local pcCity = GetPlayersOriginalCity(pPlayer);
							local IntelPool = GetIntelPool(pPlayer);
							if IntelPool >= MissionCost then
								MissionCheck = 1;
							end
						end
					end
				end
			end
		end
	end
	local tPlayer = Players[pPlot:GetOwner()];
	if tPlayer:GetBuildingClassCount(Counterespionage) >= 1 then
		MissionCheck = 0
	end
	return MissionCheck;
end

function GetMission6Chance(pPlayer, pUnit, pPlot)
	local Chance = 25;
	if pUnit:IsHasPromotion(pSpy1) then
		Chance = 20;
	end
	if pUnit:IsHasPromotion(pSpy2) then
		Chance = 15;
	end
	if pUnit:IsHasPromotion(pSpy3) then
		Chance = 10;
	end
	local tCity = GetNearestAdjacentCity(pPlayer, pUnit, pPlot);
	local EspionageLevel = GetCityEspionageDefense(pPlayer, pUnit, pPlot, tCity);
	Chance = (Chance - (EspionageLevel * 2.5));
	if pPlayer:GetBuildingClassCount(bcSpyKremlin) >= 1 then
		Chance = Chance + 10;
	end
	if Chance <= 1 then
		Chance = 1;
	end
	if Chance >= 99 then
		Chance = 99;
	end
	return math.floor(Chance);
end

function CheckSpyMission6(pPlayer, pUnit, pPlot)
	local MissionCheck = 0;
	if pPlot:GetOwner() ~= -1 then
		if pPlot:GetOwner() ~= pUnit:GetOwner() then
			local CityCheck = GetTargetCity(pUnit, pPlot);
			if CityCheck == 1 then
				MissionCheck = 1;
			end
		end
	end
	local tPlayer = Players[pPlot:GetOwner()];
	if tPlayer:GetBuildingClassCount(Counterespionage) >= 1 then
		MissionCheck = 0
	end
	return MissionCheck;
end

function GetMission7Chance(pPlayer, pUnit, pPlot)
	local Chance = 33;
	if pUnit:IsHasPromotion(pSpy1) then
		Chance = 25;
	end
	if pUnit:IsHasPromotion(pSpy2) then
		Chance = 20;
	end
	if pUnit:IsHasPromotion(pSpy3) then
		Chance = 15;
	end
	local tCity = GetNearestAdjacentCity(pPlayer, pUnit, pPlot);
	local EspionageLevel = GetCityEspionageDefense(pPlayer, pUnit, pPlot, tCity);
	Chance = (Chance - (EspionageLevel * 2.5));
	if pPlayer:GetBuildingClassCount(bcSpyKremlin) >= 1 then
		Chance = Chance + 10;
	end
	if Chance <= 1 then
		Chance = 1;
	end
	if Chance >= 99 then
		Chance = 99;
	end
	return math.floor(Chance);
end

function CheckSpyMission7(pPlayer, pUnit, pPlot)
	local MissionCheck = 0;
	if pPlot:GetOwner() ~= -1 then
		if pPlot:GetOwner() ~= pUnit:GetOwner() then
			local CityCheck = GetTargetCity(pUnit, pPlot);
			if CityCheck == 1 then
				MissionCheck = 1;
			end
		end
	end
	local tPlayer = Players[pPlot:GetOwner()];
	if tPlayer:GetBuildingClassCount(Counterespionage) >= 1 then
		MissionCheck = 0
	end
	return MissionCheck;
end

function GetMission8Turns(pPlayer, pUnit, pPlot)
	local Turns = ResistLength;
	return Turns;
end

function GetMission8Chance(pPlayer, pUnit, pPlot)
	local Chance = 75;
	if pUnit:IsHasPromotion(pSpy1) then
		Chance = 66;
	end
	if pUnit:IsHasPromotion(pSpy2) then
		Chance = 50;
	end
	if pUnit:IsHasPromotion(pSpy3) then
		Chance = 33;
	end
	local tCity = GetNearestAdjacentCity(pPlayer, pUnit, pPlot);
	local EspionageLevel = GetCityEspionageDefense(pPlayer, pUnit, pPlot, tCity);
	Chance = (Chance - (EspionageLevel * 2.5));
	if pPlayer:GetBuildingClassCount(bcSpyKremlin) >= 1 then
		Chance = Chance + 10;
	end
	if Chance <= 1 then
		Chance = 1;
	end
	if Chance >= 99 then
		Chance = 99;
	end
	return math.floor(Chance);
end

function CheckSpyMission8(pPlayer, pUnit, pPlot)
	local MissionCheck = 0;
	if pPlot:GetOwner() ~= -1 then
		if pPlot:GetOwner() ~= pUnit:GetOwner() then
			local CityCheck = GetTargetCity(pUnit, pPlot);
			if CityCheck == 1 then
				MissionCheck = 1;
			end
		end
	end
	local tPlayer = Players[pPlot:GetOwner()];
	if tPlayer:GetBuildingClassCount(Counterespionage) >= 1 then
		MissionCheck = 0
	end
	return MissionCheck;
end

function GetMission9Turns(pPlayer, pUnit, pPlot)
	local Turns = GABonusLength;
	local GATimer = GABonusLength;
	if pPlayer:GetBuildingClassCount(Itza) >= 1 and not pPlayer:HasPolicy(Suffrage) then
		GATimer = GATimer * 1.5;
	end
	if pPlayer:GetBuildingClassCount(Itza) <= 0 and pPlayer:HasPolicy(Suffrage) then
		GATimer = GATimer * 1.5;
	end
	if pPlayer:GetBuildingClassCount(Itza) >= 1 and pPlayer:HasPolicy(Suffrage) then
		GATimer = GATimer * 2;
	end
	Turns = math.floor(GATimer / 3);
	Turns = Turns + 1;
	return Turns;
end

function CheckSpyMission9(pPlayer, pUnit, pPlot)
	local MissionCheck = 0;
	if pPlot:GetOwner() ~= -1 then
		if pPlot:GetOwner() ~= pUnit:GetOwner() then
			local CityCheck = GetTargetCapital(pUnit, pPlot);
			if CityCheck == 1 then
				MissionCheck = 1;
			end
		end
	end
	local tPlayer = Players[pPlot:GetOwner()];
	if tPlayer:GetBuildingClassCount(Counterespionage) >= 1 then
		MissionCheck = 0
	end
	return MissionCheck;
end

function GetMission10Chance(pPlayer, pUnit, pPlot)
	local Chance = 15;
	if pUnit:IsHasPromotion(pSpy1) then
		Chance = 10;
	end
	if pUnit:IsHasPromotion(pSpy2) then
		Chance = 5;
	end
	if pUnit:IsHasPromotion(pSpy3) then
		Chance = 1;
	end
	local tCity = GetNearestAdjacentCity(pPlayer, pUnit, pPlot);
	local EspionageLevel = GetCityEspionageDefense(pPlayer, pUnit, pPlot, tCity);
	Chance = (Chance - (EspionageLevel * 2.5));
	if pPlayer:GetBuildingClassCount(bcSpyKremlin) >= 1 then
		Chance = Chance + 10;
	end
	if Chance <= 1 then
		Chance = 1;
	end
	if Chance >= 99 then
		Chance = 99;
	end
	return math.floor(Chance);
end

function GetMission10Cost(pPlayer, pUnit, pPlot)
	local MissionCost = 0;
	local pcCity = GetPlayersOriginalCity(pPlayer);
	local SpyThreshold = GetSpyThreshold(pPlayer);
	local tCity = GetNearestAdjacentCity(pPlayer, pUnit, pPlot);
	local EspionageLevel = GetCityEspionageDefense(pPlayer, pUnit, pPlot, tCity);
	local tMult = 0.25;
	tMult = (tMult + (EspionageLevel * 0.025));
	local iCost = math.ceil(SpyThreshold * tMult);
	MissionCost = iCost;
	return MissionCost;
end

function CheckSpyMission10(pPlayer, pUnit, pPlot)
	local MissionCheck = 0;
	if pPlot:GetOwner() ~= -1 then
		if pPlot:GetOwner() ~= pUnit:GetOwner() then
			local CityCheck = GetTargetCity(pUnit, pPlot);
			if CityCheck == 1 then
				local MissionCost = GetMission10Cost(pPlayer, pUnit, pPlot);
				MissionCost = math.floor(MissionCost);
				if MissionCost ~= 0 then
					local pcCity = GetPlayersOriginalCity(pPlayer);
					local IntelPool = GetIntelPool(pPlayer);
					if IntelPool >= MissionCost then
						MissionCheck = 1;
					end
				end
			end
		end
	end
	local tPlayer = Players[pPlot:GetOwner()];
	if tPlayer:GetBuildingClassCount(Counterespionage) >= 1 then
		MissionCheck = 0
	end
	return MissionCheck;
end

function GetMission11Chance(pPlayer, pUnit, pPlot)
	local Chance = 66;
	if pUnit:IsHasPromotion(pSpy1) then
		Chance = 50;
	end
	if pUnit:IsHasPromotion(pSpy2) then
		Chance = 25;
	end
	if pUnit:IsHasPromotion(pSpy3) then
		Chance = 20;
	end
	local tCity = GetNearestAdjacentCity(pPlayer, pUnit, pPlot);
	local EspionageLevel = GetCityEspionageDefense(pPlayer, pUnit, pPlot, tCity);
	Chance = (Chance - (EspionageLevel * 2.5));
	if pPlayer:GetBuildingClassCount(bcSpyKremlin) >= 1 then
		Chance = Chance + 10;
	end
	if Chance <= 1 then
		Chance = 1;
	end
	if Chance >= 99 then
		Chance = 99;
	end
	return math.floor(Chance);
end

function CheckSpyMission11(pPlayer, pUnit, pPlot)
	local MissionCheck = 0;
	if pPlot:GetOwner() ~= -1 then
		if pPlot:GetOwner() ~= pUnit:GetOwner() then
			local CityCheck = GetTargetCapital(pUnit, pPlot);
			if CityCheck == 1 then
				MissionCheck = 1;
			end
		end
	end
	local tPlayer = Players[pPlot:GetOwner()];
	if tPlayer:GetBuildingClassCount(Counterespionage) >= 1 then
		MissionCheck = 0
	end
	return MissionCheck;
end

function GetMission12Cost(pPlayer, pUnit, pPlot)
	local MissionCost = 0;
	local pcCity = GetPlayersOriginalCity(pPlayer);
	local SpyPool = GetIntelPool(pPlayer);
	local SpyThreshold = GetSpyThreshold(pPlayer);
	local SpyNum = pcCity:GetNumBuilding(bSpyCountMAX);
	if SpyPool < BaseThreshold then
		MissionCost = BaseThreshold;
	elseif SpyPool >= BaseThreshold then
		local SpyNum = pcCity:GetNumBuilding(bSpyCountMAX);
		if (SpyNum == 0) or (SpyNum == 1) then 
			MissionCost = BaseThreshold;
		elseif SpyNum > 1 then
			local SellMax = BaseThreshold;
			if (SpyThreshold % BaseThreshold) == 0 then
				SellMax = (SpyThreshold - BaseThreshold);
			else 
				SellMax = ((math.floor(SpyThreshold / BaseThreshold)) * BaseThreshold);
			end
			if SpyPool >= SellMax then
				MissionCost = SellMax;
			elseif SpyPool < SellMax then
				MissionCost = ((math.floor(SpyPool / BaseThreshold)) * BaseThreshold);
			end
		end
	end
	return MissionCost;
end

function CheckSpyMission12(pPlayer, pUnit, pPlot)
	local MissionCheck = 0;
	if pPlot:GetOwner() ~= -1 then
		if pPlot:GetOwner() ~= pUnit:GetOwner() then
			local CityCheck = GetTargetCity(pUnit, pPlot);
			if CityCheck == 1 then
				local MissionCost = GetMission12Cost(pPlayer, pUnit, pPlot);
				MissionCost = math.floor(MissionCost);
				if MissionCost ~= 0 then
					local pcCity = GetPlayersOriginalCity(pPlayer);
					local IntelPool = GetIntelPool(pPlayer);
					if IntelPool >= MissionCost then
						MissionCheck = 1;
					end
				end
			end
		end
	end
	local tPlayer = Players[pPlot:GetOwner()];
	if tPlayer:GetBuildingClassCount(Counterespionage) >= 1 then
		MissionCheck = 0
	end
	return MissionCheck;
end

-------------------------------------------------------------------------------
local m_PopupInfo = nil;

local activePlayerID = Game.GetActivePlayer()
local activePlayer = Players[activePlayerID]
local numSpyMissions = 13

local g_PopupInfo = nil;

ButtonPopupTypes.BUTTONPOPUP_TOMATEKH_CHOOSE_SPY_MISSION = "BUTTONPOPUP_TOMATEKH_CHOOSE_SPY_MISSION"
g_PopupInfo = {["Type"] = ButtonPopupTypes.BUTTONPOPUP_TOMATEKH_CHOOSE_SPY_MISSION}
 
local g_ItemManager = InstanceManager:new( "ItemInstance", "Button", Controls.ItemStack );
local g_SelectedMission = nil
function DisplayPopup()
	g_ItemManager:ResetInstances();

	local pPlayer = activePlayer;
	local pUnit = GetOperative(pPlayer);
	local pPlot = pUnit:GetPlot();

	for num = 1, numSpyMissions do

		local controlTable = g_ItemManager:GetInstance();
		local portraitAtlas = "TOMATEKH_SPY_MISSION_ATLAS"
		IconHookup( num, 64, portraitAtlas, controlTable.Icon64 );

		if num == 1 then
			controlTable.Name:LocalizeAndSetText("TXT_KEY_SPY_MISSION_TITLE_1");
			local Gold = GetMission1Gold(pPlayer, pUnit, pPlot);
			local Chance = GetMission1Chance(pPlayer, pUnit, pPlot);
			controlTable.Button:SetToolTipString(Locale.ConvertTextKey("TXT_KEY_SPY_BODY_TITLE_1", Gold, Chance));
			local MissionCheck = CheckSpyMission1(pPlayer, pUnit, pPlot);
			if MissionCheck == 0 then
				controlTable.Name:LocalizeAndSetText("[COLOR_NEGATIVE_TEXT]" .. Locale.ConvertTextKey("TXT_KEY_SPY_MISSION_TITLE_1") .. "[ENDCOLOR]");
				controlTable.Button:SetDisabled(true)
			else
				controlTable.Button:SetDisabled(false)
			end
		elseif num == 2 then
			controlTable.Name:LocalizeAndSetText("TXT_KEY_SPY_MISSION_TITLE_2");
			local Chance = GetMission2Chance(pPlayer, pUnit, pPlot);
			controlTable.Button:SetToolTipString(Locale.ConvertTextKey("TXT_KEY_SPY_BODY_TITLE_2", Chance));
			local MissionCheck = CheckSpyMission2(pPlayer, pUnit, pPlot);
			if MissionCheck == 0 then
				controlTable.Name:LocalizeAndSetText("[COLOR_NEGATIVE_TEXT]" .. Locale.ConvertTextKey("TXT_KEY_SPY_MISSION_TITLE_2") .. "[ENDCOLOR]");
				controlTable.Button:SetDisabled(true)
			else
				controlTable.Button:SetDisabled(false)
			end
		elseif num == 3 then
			controlTable.Name:LocalizeAndSetText("TXT_KEY_SPY_MISSION_TITLE_3");
			local Cost = GetMission3Cost(pPlayer, pUnit, pPlot);
			Cost = math.ceil(Cost);
			local Chance = GetMission3Chance(pPlayer, pUnit, pPlot);
			controlTable.Button:SetToolTipString(Locale.ConvertTextKey("TXT_KEY_SPY_BODY_TITLE_3", Chance, Cost));
			local MissionCheck = CheckSpyMission3(pPlayer, pUnit, pPlot);
			if MissionCheck == 0 then
				controlTable.Name:LocalizeAndSetText("[COLOR_NEGATIVE_TEXT]" .. Locale.ConvertTextKey("TXT_KEY_SPY_MISSION_TITLE_3") .. "[ENDCOLOR]");
				controlTable.Button:SetDisabled(true)
			else
				controlTable.Button:SetDisabled(false)
			end
		elseif num == 4 then
			controlTable.Name:LocalizeAndSetText("TXT_KEY_SPY_MISSION_TITLE_4");
			local Cost = GetMission4Cost(pPlayer, pUnit, pPlot);
			Cost = math.ceil(Cost);
			controlTable.Button:SetToolTipString(Locale.ConvertTextKey("TXT_KEY_SPY_BODY_TITLE_4", Cost));
			local MissionCheck = CheckSpyMission4(pPlayer, pUnit, pPlot);
			if MissionCheck == 0 then
				controlTable.Name:LocalizeAndSetText("[COLOR_NEGATIVE_TEXT]" .. Locale.ConvertTextKey("TXT_KEY_SPY_MISSION_TITLE_4") .. "[ENDCOLOR]");
				controlTable.Button:SetDisabled(true)
			else
				controlTable.Button:SetDisabled(false)
			end
		elseif num == 5 then
			controlTable.Name:LocalizeAndSetText("TXT_KEY_SPY_MISSION_TITLE_5");
			local Copy = 3;
			local tCity = GetNearestTargetCity(pPlayer, pUnit, pPlot);
			local EspionageLevel = GetCityEspionageDefense(pPlayer, pUnit, pPlot, tCity);
			if EspionageLevel >= 4 then
				Copy = Copy - 1;
			end
			local Cost = GetMission5Cost(pPlayer, pUnit, pPlot);
			Cost = math.ceil(Cost);
			local Chance = GetMission5Chance(pPlayer, pUnit, pPlot);
			controlTable.Button:SetToolTipString(Locale.ConvertTextKey("TXT_KEY_SPY_BODY_TITLE_5", Copy, Chance, Cost));
			local MissionCheck = CheckSpyMission5(pPlayer, pUnit, pPlot);
			if MissionCheck == 0 then
				controlTable.Name:LocalizeAndSetText("[COLOR_NEGATIVE_TEXT]" .. Locale.ConvertTextKey("TXT_KEY_SPY_MISSION_TITLE_5") .. "[ENDCOLOR]");
				controlTable.Button:SetDisabled(true)
			else
				controlTable.Button:SetDisabled(false)
			end		
		elseif num == 6 then
			controlTable.Name:LocalizeAndSetText("TXT_KEY_SPY_MISSION_TITLE_6");
			local Chance = GetMission6Chance(pPlayer, pUnit, pPlot);
			controlTable.Button:SetToolTipString(Locale.ConvertTextKey("TXT_KEY_SPY_BODY_TITLE_6", Chance));
			local MissionCheck = CheckSpyMission6(pPlayer, pUnit, pPlot);
			if MissionCheck == 0 then
				controlTable.Name:LocalizeAndSetText("[COLOR_NEGATIVE_TEXT]" .. Locale.ConvertTextKey("TXT_KEY_SPY_MISSION_TITLE_6") .. "[ENDCOLOR]");
				controlTable.Button:SetDisabled(true)
			else
				controlTable.Button:SetDisabled(false)
			end		
		elseif num == 7 then
			controlTable.Name:LocalizeAndSetText("TXT_KEY_SPY_MISSION_TITLE_7");
			local Pop = 2;
			local Pup = 4;
			local Chance = GetMission7Chance(pPlayer, pUnit, pPlot);
			controlTable.Button:SetToolTipString(Locale.ConvertTextKey("TXT_KEY_SPY_BODY_TITLE_7", Pop, Pup, Chance));
			local MissionCheck = CheckSpyMission7(pPlayer, pUnit, pPlot);
			if MissionCheck == 0 then
				controlTable.Name:LocalizeAndSetText("[COLOR_NEGATIVE_TEXT]" .. Locale.ConvertTextKey("TXT_KEY_SPY_MISSION_TITLE_7") .. "[ENDCOLOR]");
				controlTable.Button:SetDisabled(true)
			else
				controlTable.Button:SetDisabled(false)
			end
		elseif num == 8 then
			controlTable.Name:LocalizeAndSetText("TXT_KEY_SPY_MISSION_TITLE_8");
			local Turns = GetMission8Turns(pPlayer, pUnit, pPlot);
			local Chance = GetMission8Chance(pPlayer, pUnit, pPlot);
			controlTable.Button:SetToolTipString(Locale.ConvertTextKey("TXT_KEY_SPY_BODY_TITLE_8", Turns, Chance));
			local MissionCheck = CheckSpyMission8(pPlayer, pUnit, pPlot);
			if MissionCheck == 0 then
				controlTable.Name:LocalizeAndSetText("[COLOR_NEGATIVE_TEXT]" .. Locale.ConvertTextKey("TXT_KEY_SPY_MISSION_TITLE_8") .. "[ENDCOLOR]");
				controlTable.Button:SetDisabled(true)
			else
				controlTable.Button:SetDisabled(false)
			end		
		elseif num == 9 then
			controlTable.Name:LocalizeAndSetText("TXT_KEY_SPY_MISSION_TITLE_9");
			local Turns = GetMission9Turns(pPlayer, pUnit, pPlot);
			controlTable.Button:SetToolTipString(Locale.ConvertTextKey("TXT_KEY_SPY_BODY_TITLE_9", Turns));
			local MissionCheck = CheckSpyMission9(pPlayer, pUnit, pPlot);
			if MissionCheck == 0 then
				controlTable.Name:LocalizeAndSetText("[COLOR_NEGATIVE_TEXT]" .. Locale.ConvertTextKey("TXT_KEY_SPY_MISSION_TITLE_9") .. "[ENDCOLOR]");
				controlTable.Button:SetDisabled(true)
			else
				controlTable.Button:SetDisabled(false)
			end
		elseif num == 10 then
			controlTable.Name:LocalizeAndSetText("TXT_KEY_SPY_MISSION_TITLE_10");
			local Cost = GetMission10Cost(pPlayer, pUnit, pPlot);
			Cost = math.ceil(Cost);
			local Chance = GetMission10Chance(pPlayer, pUnit, pPlot);
			controlTable.Button:SetToolTipString(Locale.ConvertTextKey("TXT_KEY_SPY_BODY_TITLE_10", Chance, Cost));
			local MissionCheck = CheckSpyMission10(pPlayer, pUnit, pPlot);
			if MissionCheck == 0 then
				controlTable.Name:LocalizeAndSetText("[COLOR_NEGATIVE_TEXT]" .. Locale.ConvertTextKey("TXT_KEY_SPY_MISSION_TITLE_10") .. "[ENDCOLOR]");
				controlTable.Button:SetDisabled(true)
			else
				controlTable.Button:SetDisabled(false)
			end
		elseif num == 11 then
			controlTable.Name:LocalizeAndSetText("TXT_KEY_SPY_MISSION_TITLE_11");
			local Turns = AntiLength;
			local Chance = GetMission11Chance(pPlayer, pUnit, pPlot);
			controlTable.Button:SetToolTipString(Locale.ConvertTextKey("TXT_KEY_SPY_BODY_TITLE_11", Turns, Chance));
			local MissionCheck = CheckSpyMission11(pPlayer, pUnit, pPlot);
			if MissionCheck == 0 then
				controlTable.Name:LocalizeAndSetText("[COLOR_NEGATIVE_TEXT]" .. Locale.ConvertTextKey("TXT_KEY_SPY_MISSION_TITLE_11") .. "[ENDCOLOR]");
				controlTable.Button:SetDisabled(true)
			else
				controlTable.Button:SetDisabled(false)
			end
		elseif num == 12 then
			controlTable.Name:LocalizeAndSetText("TXT_KEY_SPY_MISSION_TITLE_12");
			local Cost = GetMission12Cost(pPlayer, pUnit, pPlot);
			Cost = math.ceil(Cost);
			local Chance = 99;
			controlTable.Button:SetToolTipString(Locale.ConvertTextKey("TXT_KEY_SPY_BODY_TITLE_12", Chance, Cost));
			local MissionCheck = CheckSpyMission12(pPlayer, pUnit, pPlot);
			if MissionCheck == 0 then
				controlTable.Name:LocalizeAndSetText("[COLOR_NEGATIVE_TEXT]" .. Locale.ConvertTextKey("TXT_KEY_SPY_MISSION_TITLE_12") .. "[ENDCOLOR]");
				controlTable.Button:SetDisabled(true)
			else
				controlTable.Button:SetDisabled(false)
			end
		elseif num == 13 then
			controlTable.Name:LocalizeAndSetText("TXT_KEY_SPY_MISSION_TITLE_13");
			controlTable.Button:SetToolTipString(Locale.ConvertTextKey("TXT_KEY_SPY_BODY_TITLE_13"));
			local MissionCheck = 1;
			if MissionCheck == 0 then
				controlTable.Name:LocalizeAndSetText("[COLOR_NEGATIVE_TEXT]" .. Locale.ConvertTextKey("TXT_KEY_SPY_MISSION_TITLE_13") .. "[ENDCOLOR]");
				controlTable.Button:SetDisabled(true)
			else
				controlTable.Button:SetDisabled(false)
			end
		end

		local selectionAnim = controlTable.SelectionAnim;
		controlTable.Button:SetVoid1(num)
		controlTable.Button:RegisterCallback(Mouse.eLClick, function()  
			g_SelectedMission = num
			DisplayPopup()
		end);
		if g_SelectedMission then
			if g_SelectedMission == num then
				controlTable.SelectionAnim:SetHide(false)
			else
				controlTable.SelectionAnim:SetHide(true)
			end
		else
			controlTable.SelectionAnim:SetHide(true)
		end
	end

	Controls.ItemStack:CalculateSize();
	Controls.ItemStack:ReprocessAnchoring();
	Controls.ItemScrollPanel:CalculateInternalSize();
	Controls.ConfirmButton:SetDisabled(true);
	ContextPtr:SetHide(false); 
	if g_SelectedMission then
		Controls.ConfirmButton:SetDisabled(false);
	end	
end

-------------------------
function SpyEscapePlan(pPlayer, pID, pUnit, pPlot, tPlayer, Chance, pcCity)
	local Escape = EscapeChance(1, 100);
	if Escape > Chance then
		if (pPlayer:IsHuman()) and (pID == Game.GetActivePlayer()) then
			Events.GameplayAlertMessage("[COLOR_NEGATIVE_TEXT]" .. Locale.ConvertTextKey(pUnit:GetName()) .. " was captured en route from " .. Locale.ConvertTextKey(tPlayer:GetCivilizationShortDescription()) .. "![ENDCOLOR]");	
		end
		pUnit:Kill(true);
	elseif Escape <= Chance then
		pUnit:SetXY(pcCity:GetX(), pcCity:GetY());
		pUnit:JumpToNearestValidPlot();
		pUnit:SetMoves(0);
		if (pPlayer:IsHuman()) and (pID == Game.GetActivePlayer()) then
			Events.GameplayAlertMessage("[COLOR_POSITIVE_TEXT]" .. Locale.ConvertTextKey(pUnit:GetName()) .. " has escaped to the city of " .. Locale.ConvertTextKey(pcCity:GetName()) .. "![ENDCOLOR]");	
		end
	end
end

------------------------
function StealGoldMission(pPlayer, pID, pUnit, pPlot, tPlayer, tID, pcCity)
	local Gold = GetMission1Gold(pPlayer, pUnit, pPlot);
	pPlayer:ChangeGold(Gold);
	tPlayer:ChangeGold(-Gold);
	if tPlayer:GetGold() <= 0 then
		tPlayer:SetGold(1);
	end
	if (pPlayer:IsHuman()) and (pID == Game.GetActivePlayer()) then
		Events.GameplayAlertMessage("[COLOR_POSITIVE_TEXT]" .. Locale.ConvertTextKey(pUnit:GetName()) .. " has successfully stolen " .. Gold .. " [ICON_GOLD] Gold from " .. Locale.ConvertTextKey(tPlayer:GetCivilizationShortDescription()) .. "![ENDCOLOR]");	
	end
	if (tPlayer:IsHuman()) and (tID == Game.GetActivePlayer()) then
		Events.GameplayAlertMessage("[COLOR_NEGATIVE_TEXT]A " .. Locale.ConvertTextKey(pPlayer:GetCivilizationAdjective()) .. " Great Spy has stolen " .. Gold .. " [ICON_GOLD] Gold from your Treasury ![ENDCOLOR]");	
	end
end

function SpreadPropagandaMission(pPlayer, pID, pUnit, pPlot, tPlayer, tID, pcCity)
	local tCulture = tPlayer:GetJONSCulture();
	local nCulture = math.ceil(tCulture / 4);
	if (tCulture - nCulture) <= 0 then
		tPlayer:SetJONSCulture(1)
		nCulture = 1;
	else
		tPlayer:ChangeJONSCulture(-nCulture);
	end
	local tGAPoints = tPlayer:GetGoldenAgeProgressMeter();
	local nGAPoints = math.ceil(tGAPoints / 4);
	if (tGAPoints - nGAPoints) <= 0 then
		tPlayer:SetGoldenAgeProgressMeter(1);
		nGAPoints = 1;
	else
		tPlayer:ChangeGoldenAgeProgressMeter(-nGAPoints);
	end
	if (pPlayer:IsHuman()) and (pID == Game.GetActivePlayer()) then
		Events.GameplayAlertMessage("[COLOR_POSITIVE_TEXT]Propaganda spread by " .. Locale.ConvertTextKey(pUnit:GetName()) .. " has reduced " .. Locale.ConvertTextKey(tPlayer:GetCivilizationAdjective()) .. " [ICON_CULTURE] Culture progress by " .. nCulture .. " and [ICON_GOLDEN_AGE] Golden Age progress by " .. nGAPoints .."![ENDCOLOR]");	
	end
	if (tPlayer:IsHuman()) and (tID == Game.GetActivePlayer()) then
		Events.GameplayAlertMessage("[COLOR_NEGATIVE_TEXT]" .. Locale.ConvertTextKey(pPlayer:GetCivilizationAdjective()) .. " propaganda has reduced your [ICON_CULTURE] Culture progress by " .. nCulture .. " and your [ICON_GOLDEN_AGE] Golden Age progress by " .. nGAPoints .."![ENDCOLOR]");	
	end
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

function StealGreatWorkMission(pPlayer, pID, pUnit, pPlot, tPlayer, tID, pcCity, SlotCheck)
	local tCity = GetNearestAdjacentCity(pPlayer, pUnit, pPlot);
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
	if (pPlayer:IsHuman()) and (pID == Game.GetActivePlayer()) then
		Events.GameplayAlertMessage("[COLOR_POSITIVE_TEXT]" .. Locale.ConvertTextKey(pUnit:GetName()) .. " has successfully smuggled the Great Work ''" .. WorkName .. "'' out of " .. Locale.ConvertTextKey(tPlayer:GetCivilizationShortDescription()) .. "![ENDCOLOR]");	
	end
	if (tPlayer:IsHuman()) and (tID == Game.GetActivePlayer()) then
		Events.GameplayAlertMessage("[COLOR_NEGATIVE_TEXT]A " .. Locale.ConvertTextKey(pPlayer:GetCivilizationAdjective()) .. " Great Spy has stolen the Great Work ''" .. WorkName .. "'' from " .. Locale.ConvertTextKey(tCity:GetName()) .. "![ENDCOLOR]");	
	end
end

function KidnapGreatPersonMission(pPlayer, pID, pUnit, pPlot, tPlayer, tID, pcCity)
	local Name = Locale.ConvertTextKey(pUnit:GetName());
	local Type = "Academy";
	if (pPlot:GetImprovementType() == iAcademy) then
		pPlot:SetImprovementType(-1);
		bUnit = pPlayer:InitUnit(iScientist, pcCity:GetX(), pcCity:GetY(), UNITAI_SCIENTIST);
		bUnit:JumpToNearestValidPlot();
		bUnit:SetMoves(0);
		Name = Locale.ConvertTextKey(bUnit:GetName());
		Type = "Academy";
	elseif (pPlot:GetImprovementType() == iCustoms) then
		pPlot:SetImprovementType(-1);
		bUnit = pPlayer:InitUnit(iMerchant, pcCity:GetX(), pcCity:GetY(), UNITAI_MERCHANT);
		bUnit:JumpToNearestValidPlot();
		bUnit:SetMoves(0);
		Name = Locale.ConvertTextKey(bUnit:GetName());
		Type = "Customs House";
	elseif (pPlot:GetImprovementType() == iFactory) then
		pPlot:SetImprovementType(-1);
		bUnit = pPlayer:InitUnit(iEngineer, pcCity:GetX(), pcCity:GetY(), UNITAI_ENGINEER);
		bUnit:JumpToNearestValidPlot();
		bUnit:SetMoves(0);
		Name = Locale.ConvertTextKey(bUnit:GetName());
		Type = "Manufactory";
	elseif (pPlot:GetImprovementType() == iCitadel) then
		pPlot:SetImprovementType(-1);
		bUnit = pPlayer:InitUnit(iGeneral, pcCity:GetX(), pcCity:GetY(), UNITAI_GENERAL);
		bUnit:JumpToNearestValidPlot();
		bUnit:SetMoves(0);
		Name = Locale.ConvertTextKey(bUnit:GetName());
		Type = "Citadel";
	elseif (pPlot:GetImprovementType() == iShrine) then
		pPlot:SetImprovementType(-1);
		bUnit = pPlayer:InitUnit(iProphet, pcCity:GetX(), pcCity:GetY(), UNITAI_PROPHET);
		bUnit:JumpToNearestValidPlot();
		bUnit:SetMoves(0);
		Name = Locale.ConvertTextKey(bUnit:GetName());
		Type = "Holy Site";
	end
	if isHospital then
		if (pPlot:GetImprovementType() == iHospital) then
			pPlot:SetImprovementType(-1);
			bUnit = pPlayer:InitUnit(iDoctor, pcCity:GetX(), pcCity:GetY(), UNITAI_MERCHANT);
			bUnit:JumpToNearestValidPlot();
			bUnit:SetMoves(0);
			Name = Locale.ConvertTextKey(bUnit:GetName());
			Type = "Sanatorium";
		end
	end
	if isFair then
		if (pPlot:GetImprovementType() == iFair) then
			pPlot:SetImprovementType(-1);
			bUnit = pPlayer:InitUnit(iEntertainer, pcCity:GetX(), pcCity:GetY(), UNITAI_MUSICIAN);
			bUnit:JumpToNearestValidPlot();
			bUnit:SetMoves(0);
			Name = Locale.ConvertTextKey(bUnit:GetName());
			Type = "Fairgrounds";
		end
	end
	if (pPlayer:IsHuman()) and (pID == Game.GetActivePlayer()) then
		Events.GameplayAlertMessage("[COLOR_POSITIVE_TEXT]" .. Name .. " has defected from " .. Locale.ConvertTextKey(tPlayer:GetCivilizationShortDescription()) .. " and joined your empire![ENDCOLOR]");	
	end
	if (tPlayer:IsHuman()) and (tID == Game.GetActivePlayer()) then
		Events.GameplayAlertMessage("[COLOR_NEGATIVE_TEXT]A " .. Locale.ConvertTextKey(pPlayer:GetCivilizationAdjective()) .. " Great Spy has destroyed a " .. Type .. "![ENDCOLOR]");	
	end
end

function DestroyResourceMission(pPlayer, pID, pUnit, pPlot, tPlayer, tID, pcCity, Copy)
	local ResourceName = "";
	if pPlot:GetResourceType() ~= -1 then
		if pPlot:GetImprovementType() ~= 1 then
			local pImprovment = pPlot:GetImprovementType();
			pPlot:SetImprovementType(-1);
			local pResource = pPlot:GetResourceType();
			ResourceName = Locale.ConvertTextKey(GameInfo.Resources[pPlot:GetResourceType()].Description);
			local rCount = pPlot:GetNumResource();
			if rCount <= Copy then	
				pPlot:SetResourceType(-1);
			elseif rCount > Copy then	
				local rDif = (rCount - Copy);
				pPlot:SetNumResource(rDif);
			end
			if pImprovment == iMound then
				pPlot:SetImprovementType(pImprovment);
			end
		else
			local pResource = pPlot:GetResourceType();
			ResourceName = Locale.ConvertTextKey(GameInfo.Resources[pPlot:GetResourceType()].Description);
			local rCount = pPlot:GetNumResource();
			if rCount <= Copy then	
				pPlot:SetResourceType(-1);
			elseif rCount > Copy then	
				local rDif = (rCount - Copy);
				pPlot:SetNumResource(rDif);
			end
		end
	end
	if (pPlayer:IsHuman()) and (pID == Game.GetActivePlayer()) then
		Events.GameplayAlertMessage("[COLOR_POSITIVE_TEXT]" .. Locale.ConvertTextKey(pUnit:GetName()) .. " has successfully sabotaged a " .. Locale.ConvertTextKey(tPlayer:GetCivilizationAdjective()) .. " source of " .. ResourceName .. "![ENDCOLOR]");	
	end
	if (tPlayer:IsHuman()) and (tID == Game.GetActivePlayer()) then
		Events.GameplayAlertMessage("[COLOR_NEGATIVE_TEXT]A " .. Locale.ConvertTextKey(pPlayer:GetCivilizationAdjective()) .. " Great Spy has sabotaged a source of " .. ResourceName .. "![ENDCOLOR]");	
	end
end

function SabotageProductionMission(pPlayer, pID, pUnit, pPlot, tPlayer, tID, pcCity)
	for tCity in tPlayer:Cities() do
		if tCity:GetProduction() >= 1 then
			if tCity:GetProductionBuilding() ~= -1 then
				local pBuilding = tCity:GetProductionBuilding();
				local BClass = GameInfo.Buildings[pBuilding].BuildingClass;
				local BWonder = GameInfo.BuildingClasses["" .. BClass .. ""].MaxGlobalInstances;
				local BNational = GameInfo.BuildingClasses["" .. BClass .. ""].MaxPlayerInstances;
				if (BWonder == 1) or (BNational == 1) then
					local cProduction = tCity:GetProduction();
					local dProduction = math.floor(cProduction / 3);
					if (cProduction - dProduction) >= 1 then
						tCity:ChangeProduction(-dProduction)
					end
				end
			end
			if tCity:GetProductionProject() ~= -1 then
				local pProject = tCity:GetProductionProject();
				local cProduction = tCity:GetProduction();
				local dProduction = math.floor(cProduction / 3);
				if (cProduction - dProduction) >= 1 then
					tCity:ChangeProduction(-dProduction)
				end
			end
		end
	end
	local tProgress = tPlayer:GetResearchProgress(tPlayer:GetCurrentResearch());
	local dProgress = math.floor(tProgress / 3);
	if (tProgress - dProgress) >= 1 then
		local tTeamTechs = Teams[tPlayer:GetTeam()]:GetTeamTechs()
		tTeamTechs:ChangeResearchProgress(tPlayer:GetCurrentResearch(), -dProgress, tPlayer:GetID());
	end
	if (pPlayer:IsHuman()) and (pID == Game.GetActivePlayer()) then
		Events.GameplayAlertMessage("[COLOR_POSITIVE_TEXT]" .. Locale.ConvertTextKey(pUnit:GetName()) .. " has successfully destroyed " .. dProgress .. " [ICON_RESEARCH] Research and sabotaged Wonder [ICON_PRODUCTION] Production in " .. Locale.ConvertTextKey(tPlayer:GetCivilizationShortDescription()) .. "![ENDCOLOR]");	
	end
	if (tPlayer:IsHuman()) and (tID == Game.GetActivePlayer()) then
		Events.GameplayAlertMessage("[COLOR_NEGATIVE_TEXT]A " .. Locale.ConvertTextKey(pPlayer:GetCivilizationAdjective()) .. " Great Spy has destroyed " .. dProgress .. " [ICON_RESEARCH] Research and sabotaged Wonder [ICON_PRODUCTION] Production![ENDCOLOR]");	
	end
end

function PoisonWaterMission(pPlayer, pID, pUnit, pPlot, tPlayer, tID, pcCity, Pop, Pup)
	local tCity = GetNearestAdjacentCity(pPlayer, pUnit, pPlot);
	local Poison = EscapeChance(Pop, Pup);
	if tCity:GetPopulation() >= (Poison + 1) then
		tCity:ChangePopulation(-Poison, true);
	elseif tCity:GetPopulation() <= (Poison) then
		local Default = (tCity:GetPopulation() - 1);
		tCity:ChangePopulation(-Default, true);				
	end
	local tTrade = tPlayer:GetTradeRoutes();
	for i,v in ipairs(tTrade) do
		if v.FromCity == tCity then
			if v.ToCity:GetOwner() == tCity:GetOwner() then
				local pChance = EscapeChance(1, 2);
				if pChance == 1 then
					if v.ToCity:GetPopulation() >= 2 then
						v.ToCity:ChangePopulation(-1, true);
					end
				end
			end
		end
		if v.ToCity == tCity then
			if v.FromCity:GetOwner() == tCity:GetOwner() then
				local pChance = EscapeChance(1, 2);
				if pChance == 1 then
					if v.FromCity:GetPopulation() >= 2 then
						v.FromCity:ChangePopulation(-1, true);
					end
				end
			end
		end
	end
	if (pPlayer:IsHuman()) and (pID == Game.GetActivePlayer()) then
		Events.GameplayAlertMessage("[COLOR_POSITIVE_TEXT]" .. Locale.ConvertTextKey(pUnit:GetName()) .. " has successfully poisoned the water supply of " .. Locale.ConvertTextKey(tCity:GetName()) .. "![ENDCOLOR]");	
	end
	if (tPlayer:IsHuman()) and (tID == Game.GetActivePlayer()) then
		Events.GameplayAlertMessage("[COLOR_NEGATIVE_TEXT]A " .. Locale.ConvertTextKey(pPlayer:GetCivilizationAdjective()) .. " Great Spy has poisoned the water supply of " .. Locale.ConvertTextKey(tCity:GetName()) .. "![ENDCOLOR]");	
	end
end

function InciteCityMission(pPlayer, pID, pUnit, pPlot, tPlayer, tID, pcCity, Turns)
	local tCity = GetNearestAdjacentCity(pPlayer, pUnit, pPlot);
	tCity:ChangeResistanceTurns(Turns);
	if (pPlayer:IsHuman()) and (pID == Game.GetActivePlayer()) then
		Events.GameplayAlertMessage("[COLOR_POSITIVE_TEXT]" .. Locale.ConvertTextKey(pUnit:GetName()) .. " has incited riots in " .. Locale.ConvertTextKey(tCity:GetName()) .. "![ENDCOLOR]");	
	end
	if (tPlayer:IsHuman()) and (tID == Game.GetActivePlayer()) then
		Events.GameplayAlertMessage("[COLOR_NEGATIVE_TEXT]A " .. Locale.ConvertTextKey(pPlayer:GetCivilizationAdjective()) .. " Great Spy has incited riots in " .. Locale.ConvertTextKey(tCity:GetName()) .. "![ENDCOLOR]");	
	end
end

function CauseAnarchyMission(pPlayer, pID, pUnit, pPlot, tPlayer, tID, pcCity, Turns)
	if tPlayer:IsAnarchy() then
		tPlayer:ChangeAnarchyNumTurns(Turns);
	else
		tPlayer:SetAnarchyNumTurns(Turns);
	end
	if (pPlayer:IsHuman()) and (pID == Game.GetActivePlayer()) then
		Events.GameplayAlertMessage("[COLOR_POSITIVE_TEXT]" .. Locale.ConvertTextKey(pUnit:GetName()) .. " is causing [ICON_RAZING] Anarchy in " .. Locale.ConvertTextKey(tPlayer:GetCivilizationShortDescription()) .. "![ENDCOLOR]");	
	end
	if (tPlayer:IsHuman()) and (tID == Game.GetActivePlayer()) then
		Events.GameplayAlertMessage("[COLOR_NEGATIVE_TEXT]A " .. Locale.ConvertTextKey(pPlayer:GetCivilizationAdjective()) .. " Great Spy is causing [ICON_RAZING] Anarchy![ENDCOLOR]");	
	end
end

function SpawnPartisian(pPlayer, pID, pUnit, tPlot, tPlayer, tID, pcCity, Resist, tCity, iUnit)
	bUnit = Barbarians:InitUnit(iUnit, tPlot:GetX(), tPlot:GetY())
	bUnit:JumpToNearestValidPlot()
end

function RecruitPartisiansMission(pPlayer, pID, pUnit, pPlot, tPlayer, tID, pcCity)
	local Resist = EscapeChance(1, 4);
	local tCity = GetNearestAdjacentCity(pPlayer, pUnit, pPlot);
	local tPlot = pPlot;
	pUnit:SetXY(pcCity:GetX(), pcCity:GetY());
	pUnit:JumpToNearestValidPlot();
	for _, iUnit in pairs(LandInfantry) do
		if pcCity:CanTrain(iUnit) then
			SpawnPartisian(pPlayer, pID, pUnit, tPlot, tPlayer, tID, pcCity, Resist, tCity, iUnit);
			SpawnPartisian(pPlayer, pID, pUnit, tPlot, tPlayer, tID, pcCity, Resist, tCity, iUnit);					
			break
		end
	end
	if Resist == 2 then
		for _, iUnit in pairs(LandInfantry) do
			if pcCity:CanTrain(iUnit) then
				SpawnPartisian(pPlayer, pID, pUnit, tPlot, tPlayer, tID, pcCity, Resist, tCity, iUnit);			
				break
			end
		end
	elseif Resist == 3 then
		for _, iUnit in pairs(LandInfantry) do
			if pcCity:CanTrain(iUnit) then
				SpawnPartisian(pPlayer, pID, pUnit, tPlot, tPlayer, tID, pcCity, Resist, tCity, iUnit);	
				SpawnPartisian(pPlayer, pID, pUnit, tPlot, tPlayer, tID, pcCity, Resist, tCity, iUnit);			
				break
			end
		end
	elseif Resist == 4 then
		for _, iUnit in pairs(LandInfantry) do
			if pcCity:CanTrain(iUnit) then
				SpawnPartisian(pPlayer, pID, pUnit, tPlot, tPlayer, tID, pcCity, Resist, tCity, iUnit);	
				SpawnPartisian(pPlayer, pID, pUnit, tPlot, tPlayer, tID, pcCity, Resist, tCity, iUnit);	
				SpawnPartisian(pPlayer, pID, pUnit, tPlot, tPlayer, tID, pcCity, Resist, tCity, iUnit);	
				break
			end
		end
	end
	if (pPlayer:IsHuman()) and (pID == Game.GetActivePlayer()) then
		Events.GameplayAlertMessage("[COLOR_POSITIVE_TEXT]" .. Locale.ConvertTextKey(pUnit:GetName()) .. " has successfully recruited partisans to pillage near " .. Locale.ConvertTextKey(tCity:GetName()) .. "![ENDCOLOR]");	
	end
	if (tPlayer:IsHuman()) and (tID == Game.GetActivePlayer()) then
		Events.GameplayAlertMessage("[COLOR_NEGATIVE_TEXT]A " .. Locale.ConvertTextKey(pPlayer:GetCivilizationAdjective()) .. " Great Spy has recruited partisans to pillage near " .. Locale.ConvertTextKey(tCity:GetName()) .. "![ENDCOLOR]");	
	end
end

function CounterEspionageMission(pPlayer, pID, pUnit, pPlot, tPlayer, tID, pcCity, Turns)
	if not pcCity:IsHasBuilding(bSpyDummy1) then
		pcCity:SetNumRealBuilding(bSpyDummy1, 1);
	end
	if pcCity:GetNumBuilding(bSpyDummy2) == 0 then
		pcCity:SetNumRealBuilding(bSpyDummy2, Turns);
	elseif pcCity:GetNumBuilding(bSpyDummy2) >= 1 then
		local TurnCount = ((pcCity:GetNumBuilding(bSpyDummy2)) + Turns);
		pcCity:SetNumRealBuilding(bSpyDummy2, TurnCount);
	end
	if (pPlayer:IsHuman()) and (pID == Game.GetActivePlayer()) then
		Events.GameplayAlertMessage("[COLOR_POSITIVE_TEXT]" .. Locale.ConvertTextKey(pUnit:GetName()) .. " has successfully increased the strength of our intelligence network![ENDCOLOR]");	
	end
	if (tPlayer:IsHuman()) and (tID == Game.GetActivePlayer()) then
		Events.GameplayAlertMessage("[COLOR_NEGATIVE_TEXT]Our intelligence network is having difficulty tracking " .. Locale.ConvertTextKey(pPlayer:GetCivilizationAdjective()) .. " spies![ENDCOLOR]");	
	end
end

function SellInfoMission(pPlayer, pID, pUnit, pPlot, tPlayer, tID, pcCity, Cost)
	local ScoreBonus = math.ceil(Cost / BaseThreshold);
	local BonusMult = (ScoreBonus * 2);
	pPlayer:ChangeScoreFromFutureTech(BonusMult);
	if (pPlayer:IsHuman()) and (pID == Game.GetActivePlayer()) then
		Events.GameplayAlertMessage("[COLOR_POSITIVE_TEXT]" .. Locale.ConvertTextKey(pUnit:GetName()) .. " has successfully sold information to his contacts![ENDCOLOR]");	
	end
	if (tPlayer:IsHuman()) and (tID == Game.GetActivePlayer()) then
		Events.GameplayAlertMessage("[COLOR_NEGATIVE_TEXT]A " .. Locale.ConvertTextKey(pPlayer:GetCivilizationAdjective()) .. " Great Spy is selling intelligence to our enemies![ENDCOLOR]");	
	end
end

---------------------------------
function OnConfirm()
    ContextPtr:SetHide(true); 

	local pPlayer = activePlayer;
	local pID = pPlayer:GetID();
	local pcCity = pPlayer:GetCapitalCity();
	local pUnit = GetOperative(pPlayer);
	local pPlot = pUnit:GetPlot();
	local tPlayer = Players[pPlot:GetOwner()];
	local tID = tPlayer:GetID();

	local RepeatCheck = 0

	if g_SelectedMission == 1 then
		local MissionCheck = CheckSpyMission1(pPlayer, pUnit, pPlot);
		if MissionCheck == 1 then
			PromoteGreatSpy(pUnit);
			StealGoldMission(pPlayer, pID, pUnit, pPlot, tPlayer, tID, pcCity);
			local Chance = GetMission1Chance(pPlayer, pUnit, pPlot);
			SpyEscapePlan(pPlayer, pID, pUnit, pPlot, tPlayer, Chance, pcCity);		
		elseif MissionCheck == 0 then
			RepeatCheck = 1;
		end
	elseif g_SelectedMission == 2 then
		local MissionCheck = CheckSpyMission2(pPlayer, pUnit, pPlot);
		if MissionCheck == 1 then
			PromoteGreatSpy(pUnit);
			SpreadPropagandaMission(pPlayer, pID, pUnit, pPlot, tPlayer, tID, pcCity);
			local Chance = GetMission2Chance(pPlayer, pUnit, pPlot);
			SpyEscapePlan(pPlayer, pID, pUnit, pPlot, tPlayer, Chance, pcCity);	
		elseif MissionCheck == 0 then
			RepeatCheck = 1;
		end
	elseif g_SelectedMission == 3 then
		local MissionCheck = CheckSpyMission3(pPlayer, pUnit, pPlot);
		if MissionCheck == 1 then
			PromoteGreatSpy(pUnit);
			local Cost = GetMission3Cost(pPlayer, pUnit, pPlot);
			Cost = math.floor(Cost);
			SaveIntelPool(pPlayer, -Cost);
			local SlotCheck = CheckGreatSlots(pPlayer, pUnit, pPlot);
			StealGreatWorkMission(pPlayer, pID, pUnit, pPlot, tPlayer, tID, pcCity, SlotCheck)
			local Chance = GetMission3Chance(pPlayer, pUnit, pPlot);
			SpyEscapePlan(pPlayer, pID, pUnit, pPlot, tPlayer, Chance, pcCity);	
		elseif MissionCheck == 0 then
			RepeatCheck = 1;
		end
	elseif g_SelectedMission == 4 then
		local MissionCheck = CheckSpyMission4(pPlayer, pUnit, pPlot);
		if MissionCheck == 1 then
			PromoteGreatSpy(pUnit);
			local Cost = GetMission4Cost(pPlayer, pUnit, pPlot);
			Cost = math.floor(Cost);
			SaveIntelPool(pPlayer, -Cost);
			KidnapGreatPersonMission(pPlayer, pID, pUnit, pPlot, tPlayer, tID, pcCity);
			local Chance = 0;
			SpyEscapePlan(pPlayer, pID, pUnit, pPlot, tPlayer, Chance, pcCity);	
		elseif MissionCheck == 0 then
			RepeatCheck = 1;
		end
	elseif g_SelectedMission == 5 then
		local MissionCheck = CheckSpyMission5(pPlayer, pUnit, pPlot);
		if MissionCheck == 1 then
			PromoteGreatSpy(pUnit);
			local Cost = GetMission5Cost(pPlayer, pUnit, pPlot);
			Cost = math.floor(Cost);
			SaveIntelPool(pPlayer, -Cost);
			local Copy = 3;
			local tCity = GetNearestTargetCity(pPlayer, pUnit, pPlot);
			local EspionageLevel = GetCityEspionageDefense(pPlayer, pUnit, pPlot, tCity);
			if EspionageLevel >= 4 then
				Copy = Copy - 1;
			end		
			DestroyResourceMission(pPlayer, pID, pUnit, pPlot, tPlayer, tID, pcCity, Copy);			
			local Chance = GetMission5Chance(pPlayer, pUnit, pPlot);
			SpyEscapePlan(pPlayer, pID, pUnit, pPlot, tPlayer, Chance, pcCity);	
		elseif MissionCheck == 0 then
			RepeatCheck = 1;
		end
	elseif g_SelectedMission == 6 then
		local MissionCheck = CheckSpyMission6(pPlayer, pUnit, pPlot);
		if MissionCheck == 1 then
			PromoteGreatSpy(pUnit);
			SabotageProductionMission(pPlayer, pID, pUnit, pPlot, tPlayer, tID, pcCity);
			local Chance = GetMission6Chance(pPlayer, pUnit, pPlot);
			SpyEscapePlan(pPlayer, pID, pUnit, pPlot, tPlayer, Chance, pcCity);	
		elseif MissionCheck == 0 then
			RepeatCheck = 1;
		end
	elseif g_SelectedMission == 7 then
		local MissionCheck = CheckSpyMission7(pPlayer, pUnit, pPlot);
		if MissionCheck == 1 then
			PromoteGreatSpy(pUnit);
			local Pop = 2;
			local Pup = 4;
			PoisonWaterMission(pPlayer, pID, pUnit, pPlot, tPlayer, tID, pcCity, Pop, Pup);
			local Chance = GetMission7Chance(pPlayer, pUnit, pPlot);
			SpyEscapePlan(pPlayer, pID, pUnit, pPlot, tPlayer, Chance, pcCity);	
		elseif MissionCheck == 0 then
			RepeatCheck = 1;
		end
	elseif g_SelectedMission == 8 then
		local MissionCheck = CheckSpyMission8(pPlayer, pUnit, pPlot);
		if MissionCheck == 1 then
			PromoteGreatSpy(pUnit);
			local Turns = GetMission8Turns(pPlayer, pUnit, pPlot);
			InciteCityMission(pPlayer, pID, pUnit, pPlot, tPlayer, tID, pcCity, Turns);
			local Chance = GetMission8Chance(pPlayer, pUnit, pPlot);
			SpyEscapePlan(pPlayer, pID, pUnit, pPlot, tPlayer, Chance, pcCity);	
		elseif MissionCheck == 0 then
			RepeatCheck = 1;
		end
	elseif g_SelectedMission == 9 then
		local MissionCheck = CheckSpyMission9(pPlayer, pUnit, pPlot);
		if MissionCheck == 1 then
			PromoteGreatSpy(pUnit);
			local Turns = GetMission9Turns(pPlayer, pUnit, pPlot);
			CauseAnarchyMission(pPlayer, pID, pUnit, pPlot, tPlayer, tID, pcCity, Turns);
			local Chance = 0;
			SpyEscapePlan(pPlayer, pID, pUnit, pPlot, tPlayer, Chance, pcCity);	
		elseif MissionCheck == 0 then
			RepeatCheck = 1;
		end
	elseif g_SelectedMission == 10 then
		local MissionCheck = CheckSpyMission10(pPlayer, pUnit, pPlot);
		if MissionCheck == 1 then
			PromoteGreatSpy(pUnit);
			local Cost = GetMission10Cost(pPlayer, pUnit, pPlot);
			Cost = math.floor(Cost);
			SaveIntelPool(pPlayer, -Cost);
			RecruitPartisiansMission(pPlayer, pID, pUnit, pPlot, tPlayer, tID, pcCity);
			local Chance = GetMission10Chance(pPlayer, pUnit, pPlot);
			SpyEscapePlan(pPlayer, pID, pUnit, pPlot, tPlayer, Chance, pcCity);	
		elseif MissionCheck == 0 then
			RepeatCheck = 1;
		end
	elseif g_SelectedMission == 11 then
		local MissionCheck = CheckSpyMission11(pPlayer, pUnit, pPlot);
		if MissionCheck == 1 then
			PromoteGreatSpy(pUnit);
			local Turns = AntiLength;
			CounterEspionageMission(pPlayer, pID, pUnit, pPlot, tPlayer, tID, pcCity, Turns);
			local Chance = GetMission11Chance(pPlayer, pUnit, pPlot);
			SpyEscapePlan(pPlayer, pID, pUnit, pPlot, tPlayer, Chance, pcCity);	
		elseif MissionCheck == 0 then
			RepeatCheck = 1;
		end
	elseif g_SelectedMission == 12 then
		local MissionCheck = CheckSpyMission12(pPlayer, pUnit, pPlot);
		if MissionCheck == 1 then
			--PromoteGreatSpy(pUnit);
			local Cost = GetMission12Cost(pPlayer, pUnit, pPlot);
			Cost = math.floor(Cost);
			SaveIntelPool(pPlayer, -Cost);
			SellInfoMission(pPlayer, pID, pUnit, pPlot, tPlayer, tID, pcCity, Cost);
			local Chance = 100;
			SpyEscapePlan(pPlayer, pID, pUnit, pPlot, tPlayer, Chance, pcCity);	
		elseif MissionCheck == 0 then
			RepeatCheck = 1;
		end
	elseif g_SelectedMission == 13 then
		RepeatCheck = 0;
	end

	if RepeatCheck == 0 then
		if pUnit:IsHasPromotion(pSpyNull) then
			pUnit:SetHasPromotion(pSpyNull, false)		
		end
	elseif RepeatCheck >= 1 then
		DisplayPopup();
	end

end
Controls.ConfirmButton:RegisterCallback( Mouse.eLClick, OnConfirm );

-------------------------------------------------------------------------------
function ShowGreatSpyMissionsPopup()
	DisplayPopup();
end 
LuaEvents.Tomatekh_GreatSpyMissionsPopup.Add(ShowGreatSpyMissionsPopup)

-------------------------------------------------------------------------------
function OnActivePlayerChanged( iActivePlayer, iPrevActivePlayer )
	if (not ContextPtr:IsHidden()) then
		ContextPtr:SetHide(true);
	end
end
Events.GameplaySetActivePlayer.Add(OnActivePlayerChanged);

UIManager:QueuePopup(ContextPtr, PopupPriority.SocialPolicy)
UIManager:DequeuePopup(ContextPtr)