print ("Spy Button 2")

--Support
include("IconSupport.lua")

--Stuff
local ucSpy = GameInfoTypes.UNITCLASS_TOMATEKH_SPY;
local pSpyNull = GameInfoTypes.PROMOTION_TOMATEKH_SPY_NULL;

local cBarbarian = GameInfoTypes.CIVILIZATION_BARBARIAN;

local cShang = GameInfoTypes.CIVILIZATION_BARBARIAN;
local isShang = (GameInfoTypes.CIVILIZATION_SHANG_MOD ~= nil);
if isShang then 
	cShang = GameInfoTypes.CIVILIZATION_SHANG_MOD;
end

local cPoverty = GameInfoTypes.CIVILIZATION_BARBARIAN;
local isPoverty = (GameInfoTypes.CIVILIZATION_POVERTY_POINT_MOD ~= nil);
if isPoverty then 
	cPoverty = GameInfoTypes.CIVILIZATION_POVERTY_POINT_MOD;
end

local cGC = GameInfoTypes.CIVILIZATION_BARBARIAN;
local isGC = (GameInfoTypes.CIVILIZATION_PG_GRANCOLOMBIA ~= nil);
if isGC then 
	cGC = GameInfoTypes.CIVILIZATION_PG_GRANCOLOMBIA;
end

directions = {DirectionTypes.DIRECTION_NORTHEAST, DirectionTypes.DIRECTION_EAST, DirectionTypes.DIRECTION_SOUTHEAST,
              DirectionTypes.DIRECTION_SOUTHWEST, DirectionTypes.DIRECTION_WEST, DirectionTypes.DIRECTION_NORTHWEST}

local iAcademy = GameInfoTypes.IMPROVEMENT_ACADEMY;
local iCustoms = GameInfoTypes.IMPROVEMENT_CUSTOMS_HOUSE;
local iFactory= GameInfoTypes.IMPROVEMENT_MANUFACTORY;
local iCitadel = GameInfoTypes.IMPROVEMENT_CITADEL;
local iShrine = GameInfoTypes.IMPROVEMENT_HOLY_SITE;

local iHospital = GameInfoTypes.IMPROVEMENT_ACADEMY;
local isHospital = (GameInfoTypes.IMPROVEMENT_JFD_SANATORIUM ~= nil);
if isHospital then
	iHospital = GameInfoTypes.IMPROVEMENT_JFD_SANATORIUM;
end

local iFair = GameInfoTypes.IMPROVEMENT_ACADEMY;
local isFair = (GameInfoTypes.IMPROVEMENT_FAIRGROUNDS ~= nil);
if isFair then
	iFair = GameInfoTypes.IMPROVEMENT_FAIRGROUNDS;
end

local rAluminum = GameInfoTypes.RESOURCE_ALUMINUM;
local rCoal = GameInfoTypes.RESOURCE_COAL;
local rIron = GameInfoTypes.RESOURCE_IRON;
local rOil = GameInfoTypes.RESOURCE_OIL;
local rUranium = GameInfoTypes.RESOURCE_URANIUM;
local rHorse = GameInfoTypes.RESOURCE_HORSE;

local eINDUSTRIAL = GameInfoTypes.ERA_INDUSTRIAL;

--UI
function MyButtonFunction2()
	local plot = selUnit:GetPlot()
	local playerID = selUnit:GetOwner()
	local player = Players[playerID]
	local pPlayer = player;
	local pTeam = player:GetTeam();
	local pPlot = plot;
	local pUnit = selUnit;

	if selUnit:GetMoves() > 0 then
		if (selUnit:GetUnitClassType() == ucSpy) then

			local EnableButton = 0
			local pCity = 999999;

			if plot:GetOwner() ~= -1 then
				if plot:GetOwner() ~= selUnit:GetOwner() then
					local oPlayer = Players[plot:GetOwner()]
					if not oPlayer:IsMinorCiv() and not oPlayer:IsBarbarian() then
						if (plot:GetImprovementType() == iAcademy) or (plot:GetImprovementType() == iCustoms) or (plot:GetImprovementType() == iFactory) or (plot:GetImprovementType() == iCitadel) or (plot:GetImprovementType() == iShrine) or (plot:GetImprovementType() == iHospital) or (plot:GetImprovementType() == iFair) then
							EnableButton = 1;
						end
						if (plot:GetResourceType() ~= -1) then
							local pResource = plot:GetResourceType();
							if (pResource == rAluminum) or (pResource == rCoal) or (pResource == rIron) or (pResource == rOil) or (pResource == rUranium) or (pResource == rHorse) then
								local rReveal = GameInfo.Resources[pResource].TechReveal;
								local rTech = GameInfo.Technologies["" .. rReveal .. ""].ID
								if (Teams[pTeam]:IsHasTech(rTech)) then
									EnableButton = 1;
								end
							end
						end
						local CityCheck = 0;
						for loop, direction in ipairs(directions) do
							local adjPlot = Map.PlotDirection(plot:GetX(), plot:GetY(), direction);
							if adjPlot then
								if (adjPlot:IsCity()) then
									pCity = adjPlot:GetPlotCity();
									PlotCity = adjPlot:GetPlotCity();
									if PlotCity:GetOwner() ~= selUnit:GetOwner() then
										CityCheck = 1;
									end
								end
							end
						end
						if CityCheck == 1 then
							EnableButton = 1;
						end
					end
				end
			end

			if EnableButton >= 1 then
			
				if (Teams[pTeam]:GetCurrentEra() < eINDUSTRIAL) then
					Events.AudioPlay2DSound("AS2D_SOUND_TOMATEKH_SPY_OLD");
				elseif (Teams[pTeam]:GetCurrentEra() >= eINDUSTRIAL) then
					Events.AudioPlay2DSound("AS2D_SOUND_TOMATEKH_SPY");
				end

				if not selUnit:IsHasPromotion(pSpyNull) then
					selUnit:SetHasPromotion(pSpyNull, true)		
				end

				LuaEvents.Tomatekh_GreatSpyMissionsPopup()	

			end
		end
	end
end

Controls.SpyButton2:RegisterCallback(Mouse.eLClick, MyButtonFunction2 )
IconHookup(0, 45, "TOMATEKH_SPY_ACTION_ATLAS", Controls.SpyImage2 )
Controls.SpyBackground2:SetHide(true)

function Selection2(player, unitID, x, y, a5, bool)
	if bool then
		local cUnit = Players[player]:GetUnitByID(unitID);
		local plot = cUnit:GetPlot()

		if (Players[player]:GetCivilizationType() == cBarbarian) or (Players[player]:GetCivilizationType() == cShang) or (Players[player]:GetCivilizationType() == cPoverty) or (Players[player]:GetCivilizationType() == cGC) then
			if (cUnit:GetUnitClassType() == ucSpy) then
	
				Controls.SpyBackground2:SetHide(false)
				selUnit = cUnit;
				Controls.SpyButton2:SetDisabled(false)

				local SpyToolTip = Locale.ConvertTextKey("TXT_KEY_TOMATEKH_SPY_BUTTON")
				Controls.SpyButton2:LocalizeAndSetToolTip("" .. SpyToolTip .. "")

			end
		end

	else
		Controls.SpyBackground2:SetHide(true)
		selUnit = nil;
	end
end
Events.UnitSelectionChanged.Add(Selection2);