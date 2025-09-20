-- Base supply from pop halved (was 20%)
UPDATE HandicapInfos
SET UnitSupplyPopulationPercent = 10,
    AIUnitSupplyPopulationPercent = 10,
    CityStateUnitSupplyPopulationPercent = 10;

-- Base flat supply reduced by 2
UPDATE HandicapInfos
SET UnitSupplyBase = UnitSupplyBase - 2,
    AIUnitSupplyBase = AIUnitSupplyBase - 2,
    CityStateUnitSupplyBase = CityStateUnitSupplyBase - 2 WHERE TYPE IS NOT "HANDICAP_AI_DEFAULT";

-- Uncomment and tweak the values below to modify city defense & hp, barbarian spawns, military unit costs, CS unit gifts etc. remove double dashes (--) for single lines, /* and */ for multi lines

-- Less Barbs
-- UPDATE GameSpeeds SET BarbPercent = (ROUND((BarbPercent * 1.5) / 10, 0) * 10); 

-- Tall vs Wide tweaks
-- Remove Barracks from Colonists & Pioneers to nerf Wide a bit. Conquistador keeps Barracks but loses Armory.
/*
DELETE FROM Unit_BuildOnFound WHERE BuildingClassType = "BUILDINGCLASS_ARMORY";
DELETE FROM Unit_BuildOnFound WHERE BuildingClassType = "BUILDINGCLASS_BARRACKS" AND UnitType != "UNIT_SPANISH_CONQUISTADOR";
*/
-- Military Units
-- Military unit costs increased by 50% for balance
-- UPDATE Units SET Cost = Cost * 1.5 WHERE CivilianAttackPriority IS NULL and Cost > 0 ;

/*
-- This doubles resource quantity (except nuclear missiles, who require 50% more)
UPDATE Unit_ResourceQuantityRequirements SET Cost = Cost * 2 WHERE UnitType NOT IN ("UNIT_SS_STASIS_CHAMBER", "UNIT_SS_ENGINE", "UNIT_SS_COCKPIT", "UNIT_SS_BOOSTER", "UNIT_DIPLOMAT", "UNIT_AMBASSADOR","UNIT_EMISSARY", "UNIT_ENVOY", "UNIT_NUCLEAR_MISSILE") AND ResourceType NOT IN ('RESOURCE_SAILORS');
UPDATE Unit_ResourceQuantityRequirements SET Cost = Cost * 1.5 WHERE UnitType IS "UNIT_NUCLEAR_MISSILE";
*/

-- Cities
-- Building HP bonuses * 0.66, and Defense * 0.75, both rounded down
/*
UPDATE Buildings SET Defense = (ROUND((Defense * 0.75) / 100, 0) * 100) WHERE Defense > 0 AND BuildingClass IS NOT "BUILDINGCLASS_PALACE"; 
UPDATE Buildings SET ExtraCityHitPoints = (ROUND((ExtraCityHitPoints * 0.66) / 10, 0) * 10) WHERE ExtraCityHitPoints > 0; 

UPDATE Buildings SET GlobalDefenseMod = (ROUND(GlobalDefenseMod * 0.7)) WHERE GlobalDefenseMod > 0; 
UPDATE Buildings SET BuildingDefenseModifier = (ROUND(BuildingDefenseModifier * 0.7)) WHERE BuildingDefenseModifier > 0; 
*/

/*

-- Reduce defensive bonuses of Fort, Citadel and Jungles, off by default
UPDATE Improvements SET DefenseModifier = DefenseModifier - 5 WHERE DefenseModifier < 49 and DefenseModifier > 10 and Type IS NOT "IMPROVEMENT_BARBARIAN_CAMP"; -- Uniques give 5 less
UPDATE Improvements SET DefenseModifier = ROUND(DefenseModifier * 0.8) WHERE DefenseModifier > 49; -- Citadel gives 80, Forts and uniques 40
UPDATE Features SET Defense = ROUND(Defense * 0.8) WHERE Defense > 20; -- Jungle and Forest gives 20 (was 25)

*/

-- Military CS unit gift cooldown doubled
-- UPDATE Defines SET Value = Value * 2 WHERE Name = "FRIENDS_BASE_TURNS_UNIT_SPAWN"; -- Default 19
