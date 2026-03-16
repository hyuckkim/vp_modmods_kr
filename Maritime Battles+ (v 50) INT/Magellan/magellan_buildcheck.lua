--[[local magDB = Modding.OpenSaveData()
local cNavigators = magDB.GetValue("cNavTrack") or ""
local magBuilt = magDB.GetValue("magTrack") or false--]]

local iMagellanBuilding = GameInfoTypes.BUILDING_MAGELLAN;

local magBuilt = Game.AnyoneHasBuilding(iMagellanBuilding);
local cNavigators = Game.IsCircumnavigated();
local iHarborClass = GameInfoTypes.BUILDINGCLASS_HARBOR;

function MagellanSpawner (iPlayer, iCity)
	local pPlayer = Players[iPlayer]
	if not pPlayer then return end
	local pEra = pPlayer:GetCurrentEra()
	local pCapital = pPlayer:GetCityByID(iCity)
	local pCapX = pCapital:GetX()
	local pCapY = pCapital:GetY()
	local sUnitType = nil
	local pUnit = nil
	local sUnitClass = nil
	if (pEra > GameInfo.Eras["ERA_MEDIEVAL"].ID) then
		sUnitClass = "UNITCLASS_EXPLORER"
	elseif (pEra > GameInfo.Eras["ERA_CLASSICAL"].ID) then
		sUnitClass = "UNITCLASS_SCOUT"
	else
		sUnitClass = "UNITCLASS_PATHFINDER"
	end
	sUnitType = GetCivSpecificUnit(pPlayer, sUnitClass)
	pUnit = pPlayer:InitUnit(GameInfoTypes[sUnitType], pCapX, pCapY, UNITAI_EXPLORE)
	if pUnit then
		pUnit:JumpToNearestValidPlot()
		pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_NAVIGATOR_2, true)
		pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_OCEAN_EXPLORER, true)
		pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_EMBARKED_SIGHT, true)
		local iExpDiv = math.max(pPlayer:GetNumCities(), 10);
		pUnit:SetExperience(math.ceil(MBPmapRevealed(iTeam)/iExpDiv))
		pUnit:SetDamage(90);
		pUnit:SetName("Magellan-Elcano Expedition");
	end
end

function isMagellanBuilt (playerID, cityID, buildingType, bIncludeGold, bIncludeFaithOrCulture)
	if buildingType == iMagellanBuilding then
		magBuilt = true
		--magDB.SetValue("magTrack", magBuilt)

		local pPlayer = Players[playerID]
		local iTeam = pPlayer:GetTeam();
		local pTeam = Teams[iTeam]

		for pID = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
			local lPlayer = Players[pID]
			local lTeam = lPlayer:GetTeam()
			for lCity in lPlayer:Cities() do
				if not (lPlayer:IsMinorCiv() or lPlayer:IsBarbarian()) and not pTeam:IsAtWar(lTeam) then
					if lCity:HasBuildingClass(iHarborClass) then
						lCity:SetRevealed(iTeam, true)
						directions = {DirectionTypes.DIRECTION_NORTHEAST, DirectionTypes.DIRECTION_EAST, DirectionTypes.DIRECTION_SOUTHEAST, DirectionTypes.DIRECTION_SOUTHWEST, DirectionTypes.DIRECTION_WEST, DirectionTypes.DIRECTION_NORTHWEST}
						for loop, direction in ipairs(directions) do
							local adjPlot = Map.PlotDirection(lCity:GetX(), lCity:GetY(), direction)
							if adjPlot:IsWater() then
								adjPlot:SetRevealed(iTeam, true)
							end
						end
					end
				end
			end
		end
		MagellanSpawner(playerID, cityID);
		GameEvents.CityConstructed.Remove(isMagellanBuilt)
		GameEvents.CityCanConstruct.Remove(MagellanBuild)
	end
end

if (not magBuilt) then
	GameEvents.CityConstructed.Add(isMagellanBuilt)
	GameEvents.CityCanConstruct.Add(MagellanBuild)
end

function MagellanCircumnavigate (iTeam)
	cNavigators = true;
	for playerID = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local pPlayer = Players[playerID]
		if pPlayer:IsAlive() and pPlayer:IsHuman() then
			local nTeam = pPlayer:GetTeam();
			local pTeam = Teams[nTeam];
			local sHead = Locale.ConvertTextKey("TXT_KEY_MAGELLAN_HEAD");
			local sText;
			if nTeam == iTeam then
				if pTeam:IsHasTech(GameInfoTypes.TECH_COMPASS) then
					sText = Locale.ConvertTextKey("TXT_KEY_MAGELLAN_TEXT_YOU")
				else
					sText = Locale.ConvertTextKey("TXT_KEY_MAGELLAN_TEXT_YOU_PRE")
				end
			else
				if pTeam:IsHasTech(GameInfoTypes.TECH_COMPASS) then
					sText = Locale.ConvertTextKey("TXT_KEY_MAGELLAN_TEXT_OTHER_TECH")
				else
					sText = Locale.ConvertTextKey("TXT_KEY_MAGELLAN_TEXT_OTHER_NOTECH")
				end
			end
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, sText, sHead, pCapX, pCapY, -1, -1)
		end
	end
	GameEvents.CircumnavigatedGlobe.Remove(MagellanCircumnavigate)
end

if (not cNavigators) then
	GameEvents.CircumnavigatedGlobe.Add(MagellanCircumnavigate)
end

function MBPmapRevealed(teamID)
	local iRevealed = 0;
	for i = 0, Map.GetNumPlots()-1, 1 do
		local plot = Map.GetPlotByIndex(i)
		if plot:IsRevealed(teamID) then
			iRevealed = iRevealed + 1
		end
	end
	return iRevealed
end

function GetCivSpecificUnit(pPlayer, sUnitClass)
  local sUnitType = nil
  local sCivType = GameInfo.Civilizations[pPlayer:GetCivilizationType()].Type

  for pOverride in GameInfo.Civilization_UnitClassOverrides{CivilizationType = sCivType, UnitClassType = sUnitClass} do
    sUnitType = pOverride.UnitType
    break
  end

  if (sUnitType == nil) then
    sUnitType = GameInfo.UnitClasses[sUnitClass].DefaultUnit
  end

  return sUnitType
end

function MagellanBuild (iPlayer, iCity, iBuilding) 
	return (iBuilding ~= iMagellanBuilding) or cNavigators;
end