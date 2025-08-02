print ("Spy UI")

include("IconSupport")

WARN_NOT_SHARED = false; include( "SaveUtils" ); MY_MOD_NAME = "Great Spy UI";

local activePlayerID = Game.GetActivePlayer();
local activePlayer = Players[activePlayerID];
local pPlayer = activePlayer;

local bIntAgency = GameInfoTypes.BUILDING_INTELLIGENCE_AGENCY;
local bcIntAgency = GameInfoTypes.BUILDINGCLASS_INTELLIGENCE_AGENCY;
local bcSpyDummy2 = GameInfoTypes.BUILDINGCLASS_TOMATEKH_SPY_DUMMY_2;

local uSpy = GameInfoTypes.UNITCLASS_TOMATEKH_SPY;
local ucSpy = GameInfoTypes.UNITCLASS_TOMATEKH_SPY;

local sSci = GameInfo.Specialists.SPECIALIST_SCIENTIST.ID
local sSci2 = GameInfoTypes.UNITCLASS_SCIENTIST;
local bEspBuild1 = GameInfoTypes.BUILDING_CONSTABLE;
local bEspBuild2 = GameInfoTypes.BUILDING_POLICE_STATION;

local bSpyDummy1 = GameInfoTypes.BUILDING_TOMATEKH_SPY_DUMMY_1;
local bSpyDummy2 = GameInfoTypes.BUILDING_TOMATEKH_SPY_DUMMY_2;

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

-------------------------------------------------------------------------------
function SurveillanceCheck(pPlayer)
	local sCheck = 0;
	for pUnit in pPlayer:Units() do
		if pUnit:GetUnitClassType() == ucSpy then
			local pPlot = pUnit:GetPlot();
			if pPlot:GetOwner() ~= -1 then
				if pUnit:GetOwner() ~= pPlot:GetOwner() then
					sCheck = 1;
					break;
				end
			end
		end
	end
	return sCheck;
end

function GSCountCheck(pPlayer)
	local GSCount = 0;
	for pUnit in pPlayer:Units() do
		if pUnit:GetUnitClassType() == ucSpy then
			local pPlot = pUnit:GetPlot();
			if pPlot:GetOwner() ~= -1 then
				if pUnit:GetOwner() ~= pPlot:GetOwner() then
					GSCount = GSCount + 1;
				end
			end
		end
	end
	return GSCount;
end

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
function JFD_ActivePlayerTurnStart()

	if not (pPlayer:IsHuman()) then return end
	if (pPlayer:GetNumCities() < 1) then return end	
		
	IconHookup(0, 52, "TOMATEKH_SPY_UI_ATLAS", Controls.IconImage) 
	Controls.IconFrame:SetHide(true)

	local pcCity = pPlayer:GetCapitalCity();

	local CenterTitle = "";
	local CenterCap = "";
	local CenterCap2 = "";
	local CenterCity = "";
	local CenterPoints = "";
	local CenterAnti = "";
	local BodyTitle = "";
	local BodyNone = "";
	local BodyCiv = "";
	local BodyCount = "";
	
	local pTeam = pPlayer:GetTeam()
	if (pPlayer:GetNumCities() >= 1) then 
		
		local IntCenter = "";
		CenterTitle = Locale.ConvertTextKey("TXT_KEY_GREAT_SPY_UI_TITLE_1");
		if pPlayer:GetBuildingClassCount(bcIntAgency) < 1 then
			CenterCap = Locale.ConvertTextKey("TXT_KEY_GREAT_SPY_UI_TITLE_CAP");
			CenterCap2 = " ";
			IntCenter = Locale.ConvertTextKey(pcCity:GetName());
		elseif pPlayer:GetBuildingClassCount(bcIntAgency) >= 1 then
			for pCity in pPlayer:Cities() do
				if pCity:IsHasBuilding(bIntAgency) then
					IntCenter = Locale.ConvertTextKey(pCity:GetName());
					if pCity:IsCapital() then
						CenterCap = Locale.ConvertTextKey("TXT_KEY_GREAT_SPY_UI_TITLE_CAP");
						CenterCap2 = " ";
					end
				end
			end
		end

		local Low = GetIntelPool(pPlayer);
		local High = GetSpyThreshold(pPlayer);
		local Turn = CalculateIntelTurn(pPlayer);

		CenterCity = Locale.ConvertTextKey("TXT_KEY_GREAT_SPY_UI_TITLE_CENTER_CITY", IntCenter, Low, High, Turn);

		if pPlayer:GetBuildingClassCount(bcSpyDummy2) >= 1 then
			local AntiTurns = pPlayer:GetBuildingClassCount(bcSpyDummy2);
			CenterAnti = Locale.ConvertTextKey("TXT_KEY_GREAT_SPY_UI_TITLE_TURNS", AntiTurns);
		end
	
		BodyTitle = Locale.ConvertTextKey("TXT_KEY_GREAT_SPY_UI_TITLE_2");

		local sCheck = SurveillanceCheck(pPlayer);

		if (pPlayer:GetUnitClassCount(ucSpy) < 1) or (sCheck == 0) then
			BodyNone = Locale.ConvertTextKey("TXT_KEY_GREAT_SPY_UI_TITLE_EMPTY");
		end

		if sCheck >= 1 then
			for pUnit in pPlayer:Units() do
				if pUnit:GetUnitClassType() == ucSpy then
					local pPlot = pUnit:GetPlot();
					if pPlot:GetOwner() ~= -1 then
						if pUnit:GetOwner() ~= pPlot:GetOwner() then
							local oID = pPlot:GetOwner();
							local oPlayer = Players[oID];
							local oTeam = oPlayer:GetTeam();
							if not oPlayer:IsMinorCiv() then
								if (load(pPlayer, "GREAT_SPY_UI_" .. oID) ~= true) then
									save(pPlayer, "GREAT_SPY_UI_" .. oID, true)
									local oPlayer = Players[pPlot:GetOwner()];

									local Civ = Locale.ConvertTextKey(oPlayer:GetCivilizationShortDescription());
									local iTech = oPlayer:GetCurrentResearch();
									local Tech = "[COLOR_NEGATIVE_TEXT]Choosing Research[ENDCOLOR]";
									local TechLow = "0";
									local TechHigh = "0";
									if iTech ~= -1 then
										local TechName = GameInfo.Technologies[iTech].Description;
										Tech = Locale.ConvertTextKey("".. TechName .."");
										TechLow = oPlayer:GetResearchProgress(oPlayer:GetCurrentResearch());
										TechHigh = oPlayer:GetResearchCost(oPlayer:GetCurrentResearch());
									end
									--
									local TechPace = oPlayer:GetScience();

									local Face = "";
									local iApproach = pPlayer:GetApproachTowardsUsGuess(oID);

									local CulLow = oPlayer:GetJONSCulture();
									local CulHigh = oPlayer:GetNextPolicyCost();
									local CulPace = oPlayer:GetTotalJONSCulturePerTurn();

									if (iApproach == MajorCivApproachTypes.MAJOR_CIV_APPROACH_WAR) or (Teams[pTeam]:IsAtWar(oTeam)) then
										Face = "[ICON_WAR]";
									elseif (iApproach == MajorCivApproachTypes.MAJOR_CIV_APPROACH_HOSTILE) then
										Face = "[ICON_HAPPINESS_4]";
									elseif (iApproach == MajorCivApproachTypes.MAJOR_CIV_APPROACH_GUARDED) then
										Face = "[ICON_SPY_FACE_BLUE]";
									elseif (iApproach == MajorCivApproachTypes.MAJOR_CIV_APPROACH_AFRAID) then
										Face = "[ICON_HAPPINESS_3]";
									elseif (iApproach == MajorCivApproachTypes.MAJOR_CIV_APPROACH_FRIENDLY) then
										Face = "[ICON_HAPPINESS_1]";
									elseif (iApproach == MajorCivApproachTypes.MAJOR_CIV_APPROACH_NEUTRAL) then
										Face = "[ICON_SPY_FACE_GREY]";
									elseif (iApproach == MajorCivApproachTypes.MAJOR_CIV_APPROACH_DECEPTIVE) then
										Face = "[ICON_SPY_FACE_PURPLE]";
									else
										Face = "[ICON_SPY_FACE_GREY]";
									end

									if oPlayer:GetBuildingClassCount(bcSpyDummy2) >= 1 then
										local xTurns = oPlayer:GetBuildingClassCount(bcSpyDummy2);
										BodyCiv = BodyCiv .. Locale.ConvertTextKey("TXT_KEY_GREAT_SPY_UI_TITLE_BODY_NULL", Face, Civ, xTurns) .. ""
									elseif oPlayer:GetBuildingClassCount(bcSpyDummy2) < 1 then
										BodyCiv = BodyCiv .. Locale.ConvertTextKey("TXT_KEY_GREAT_SPY_UI_TITLE_BODY", Face, Civ, Tech, TechLow, TechHigh, TechPace, CulLow, CulHigh, CulPace) .. ""
									end
								end
							end
						end
					end
				end
			end

			local GSCount = GSCountCheck(pPlayer);
			if GSCount == 1 then
				BodyCount = Locale.ConvertTextKey("TXT_KEY_GREAT_SPY_UI_TITLE_BODY_COUNT_ONE", GSCount);
			else
				BodyCount = Locale.ConvertTextKey("TXT_KEY_GREAT_SPY_UI_TITLE_BODY_COUNT", GSCount);
			end

		end
	end

	for oID=0, GameDefines.MAX_MAJOR_CIVS-1 do
		if (load(pPlayer, "GREAT_SPY_UI_" .. oID) == true) then
			save(pPlayer, "GREAT_SPY_UI_" .. oID, false)
		end
	end

	text = CenterTitle .. CenterCap .. CenterCap2 .. CenterCity .. CenterPoints .. CenterAnti .. BodyTitle .. BodyNone .. BodyCiv .. BodyCount .."[ENDCOLOR]"

	Controls.IconImage:LocalizeAndSetToolTip(text, activePlayer:GetName(), activePlayer:GetCivilizationShortDescription())
	Controls.IconFrame:SetHide(false)

end
Events.ActivePlayerTurnStart.Add(JFD_ActivePlayerTurnStart)

--City Screen stuff
function JFD_OnEnterCityScreen()
	Controls.IconFrame:SetHide(true)
end
Events.SerialEventEnterCityScreen.Add(JFD_OnEnterCityScreen)

function JFD_OnExitCityScreen()
	JFD_ActivePlayerTurnStart()
end
Events.SerialEventExitCityScreen.Add(JFD_OnExitCityScreen)

----
----
--function TestUpdateOne(player, unitID, x, y, a5, bool)
--	if bool then
--		if (Players[player]:IsHuman()) then
--			JFD_ActivePlayerTurnStart()
--		end
--	end
--end
--Events.UnitSelectionChanged.Add(TestUpdateOne)