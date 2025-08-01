-- Default defense buildings that are changed with Better City Defenses mod, so revert it to VP values
-- I put it on top so you can easily adjust this in case there are new changes around these buildings from VP

-- Revert to VP values
UPDATE  Buildings SET GoldMaintenance = 2
        WHERE Type = 'BUILDING_CASTLE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_DEFENSES' AND Value= 1);

UPDATE  Buildings SET Cost = 1800, GoldMaintenance = 8, PrereqTech = 'TECH_RIFLING'
        WHERE Type = 'BUILDING_ARSENAL' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_DEFENSES' AND Value= 1);

UPDATE  Buildings SET GoldMaintenance = 10
        WHERE Type = 'BUILDING_MILITARY_BASE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_DEFENSES' AND Value= 1);

-- Better City Defenses value changes
UPDATE  Buildings SET Cost = 65, HurryCostModifier = 5, Defense = 400, ExtraCityHitPoints = 75, CitySupplyModifier = 5
        WHERE Type = 'BUILDING_PALISADES' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_DEFENSES' AND Value= 1);

DELETE  FROM Building_ClassesNeededInCity
        WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type = 'CBPMC_DEFENSES' AND Value = 1)
        AND BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WALLS');

INSERT  OR REPLACE INTO Building_ClassesNeededInCity (BuildingType, BuildingClassType)
        SELECT DISTINCT Type, 'BUILDINGCLASS_PALISADES' FROM Buildings
        WHERE Type IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WALLS')
        AND EXISTS (SELECT * FROM COMMUNITY WHERE Type = 'CBPMC_DEFENSES' AND Value = 1);

UPDATE  Buildings SET Cost = 2000, GoldMaintenance = 7, HurryCostModifier = 5, Defense = 1600, ExtraCityHitPoints = 100, CitySupplyModifier = 50, CityAirStrikeDefense = 10, EmpireSizeModifierReduction = -10
        WHERE Type = 'BUILDING_WEAPONS_DEPOT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_DEFENSES' AND Value= 1);

UPDATE  Building_ClassesNeededInCity SET BuildingClassType = 'BUILDINGCLASS_ARSENAL'
        WHERE BuildingType = 'BUILDING_WEAPONS_DEPOT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_DEFENSES' AND Value= 1);

UPDATE  Buildings SET Cost = 2750, GoldMaintenance = 12, HurryCostModifier = 5, Defense = 1000, ExtraCityHitPoints = 0, RangedStrikeModifier = 15, CityAirStrikeDefense = 20, CityRangedStrikeRange = 2, CityIndirectFire = 1, NukeInterceptionChance = 20
        WHERE Type = 'BUILDING_DEFENSE_SATELLITE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_DEFENSES' AND Value= 1);

UPDATE  Building_ClassesNeededInCity SET BuildingClassType = 'BUILDINGCLASS_MILITARY_BASE'
        WHERE BuildingType = 'BUILDING_DEFENSE_SATELLITE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_DEFENSES' AND Value= 1);

UPDATE  Buildings SET NationalPopRequired = 80
        WHERE Type = 'BUILDING_SATELLITE_NETWORK' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_DEFENSES' AND Value= 1);

DELETE  FROM Building_PrereqBuildingClasses
        WHERE BuildingType = 'BUILDING_SATELLITE_NETWORK' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_DEFENSES' AND Value= 1 );

UPDATE  Language_en_US
        SET Text = Text || '[NEWLINE][NEWLINE]The city must possess Palisades before this building can be constructed.'
        WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_DEFENSES' AND Value= 1 )
        AND Tag IN (SELECT Strategy FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WALLS');

UPDATE  Language_en_US
        SET Text = Text || '[NEWLINE][NEWLINE][ICON_SILVER_FIST] Military Units Supplied by this City''s population increased by 5%.'
        WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_DEFENSES' AND Value= 1 )
        AND Tag = 'TXT_KEY_BUILDING_PALISADES_HELP';

UPDATE  Language_en_US
        SET Text = 'Palisades increase city''s Defense Strength and Hit Points, making the city harder to capture on early-game. Also Increases Military Units supplied by this City''s population by 5%.[NEWLINE][NEWLINE]Palisades are the first step in building a city''s defense along a civilization''s frontier.'
        WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_DEFENSES' AND Value= 1 )
        AND Tag = 'TXT_KEY_BUILDING_PALISADES_STRATEGY';

UPDATE  Language_en_US
        SET Text = '+10[ICON_STRENGTH] Damage to Air Units during Air Strikes on City. [ICON_SILVER_FIST] Military Units Supplied by this City''s population increased by 50%.[NEWLINE][NEWLINE]Empire [ICON_HAPPINESS_3] Needs Modifier is reduced by 10% in this City.'
        WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_DEFENSES' AND Value= 1 )
        AND Tag = 'TXT_KEY_BUILDING_WEAPONS_DEPOT_HELP';

UPDATE  Language_en_US
        SET Text = 'The Weapons Depot is a building which increase city''s Defensive Strength and Hit Points. +20[ICON_STRENGTH] Damage to Air Units during Air Strikes on City. Increases Military Units supplied by this City''s population by 50%. Also helps with managing the Empire Needs Modifier in this City. The city must possess an {TXT_KEY_BUILDING_ARSENAL} before a Weapons Depot can be constructed.'
        WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_DEFENSES' AND Value= 1 )
        AND Tag = 'TXT_KEY_BUILDING_WEAPONS_DEPOT_STRATEGY';

UPDATE  Language_en_US
        SET Text = '+20[ICON_STRENGTH] Damage to Air Units during Air Strikes on City. Increase City''s [ICON_RANGE_STRENGTH] Ranged Strike Range by 2 and [ICON_RANGE_STRENGTH] Ranged Strike Damage by 15%. 20% chance to detonate nuclear weapons [COLOR_POSITIVE_TEXT]without damaging the city or surrounding tiles[ENDCOLOR].'
        WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_DEFENSES' AND Value= 1 )
        AND Tag = 'TXT_KEY_BUILDING_DEFENSE_SATELLITE_HELP';

UPDATE  Language_en_US
        SET Text = 'Defense Satellites is a late-game building which increase a city''s Defense Strength and has the ability to defend against air units effectively. Increases the City''s [ICON_RANGE_STRENGTH] Ranged Strike Range by 2 and Damage by 15%, so it covers the whole radius around the city, also inflicts extra damage to the enemy. Also have a 20% chance to detonate nuclear weapons without damaging the city or surrounding tiles (with total of 70% chance when stacked with {TXT_KEY_BUILDING_BOMB_SHELTER}). The city must possess a {TXT_KEY_BUILDING_MILITARY_BASE} before Defense Satellites can be constructed.'
        WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_DEFENSES' AND Value= 1 )
        AND Tag = 'TXT_KEY_BUILDING_DEFENSE_SATELLITE_STRATEGY';

UPDATE  Language_en_US
        SET Text = Text || '[NEWLINE][NEWLINE]The [ICON_PRODUCTION] Production Cost and [ICON_CITIZEN] Population Requirements increase based on the number of cities you own.'
        WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_DEFENSES' AND Value= 1 )
        AND Tag = 'TXT_KEY_SATELLITE_NETWORK_HELP';

CREATE TRIGGER BCD_ClassesNeededInCity
AFTER INSERT ON Civilization_BuildingClassOverrides 
WHEN EXISTS (SELECT * FROM COMMUNITY WHERE Type = 'CBPMC_DEFENSES' AND Value= 1)
AND NEW.BuildingClassType = 'BUILDINGCLASS_WALLS'
AND NEW.BuildingType IS NOT NULL
BEGIN
        INSERT  OR REPLACE INTO Building_ClassesNeededInCity (BuildingType, BuildingClassType)
        SELECT  DISTINCT NEW.BuildingType, 'BUILDINGCLASS_PALISADES';
END;

/* -- It's not working
CREATE TRIGGER BCD_RequirePalisadesText_AfterInsert
AFTER INSERT ON Language_en_US 
WHEN EXISTS (SELECT * FROM COMMUNITY WHERE Type = 'CBPMC_DEFENSES' AND Value= 1)
AND NEW.Tag = (
        SELECT Strategy
        FROM Buildings
        WHERE BuildingClass = (
                        SELECT BuildingClassType
                        FROM Civilization_BuildingClassOverrides
                        WHERE BuildingClassType = 'BUILDINGCLASS_WALLS'
                                AND BuildingType IS NOT NULL
                        )
                )
BEGIN
        UPDATE  LocalizedText
                SET Text = Text || '[NEWLINE][NEWLINE]The city must possess Palisades before this building can be constructed.'
                WHERE Language = 'en_US' AND Tag = NEW.Tag;
END;*/

-- Add additional defense buildings to Military-Industrial Complex (Autocracy) tenet
INSERT INTO Policy_BuildingClassYieldChanges
	(PolicyType, BuildingClassType, YieldType, YieldChange)
        SELECT DISTINCT bcyc.PolicyType, bc.Type, bcyc.YieldType, bcyc.YieldChange
        FROM BuildingClasses bc, Policy_BuildingClassYieldChanges bcyc
        WHERE bc.Type IN ('BUILDINGCLASS_PALISADES', 'BUILDINGCLASS_WEAPONS_DEPOT', 'BUILDINGCLASS_DEFENSE_SATELLITE')
        AND bcyc.PolicyType = 'POLICY_MOBILIZATION'
        AND EXISTS (SELECT * FROM COMMUNITY WHERE Type = 'CBPMC_DEFENSES' AND Value= 1);

-- Add additional defense buildings to Defender of Faith belief
-- +1 Faith and +2 Culture for all of these buildings.
INSERT  INTO Belief_BuildingClassYieldChanges
        (BeliefType, BuildingClassType, YieldType, YieldChange)
        SELECT DISTINCT bcyc.BeliefType, bc.Type, bcyc.YieldType, bcyc.YieldChange
        FROM BuildingClasses bc, Belief_BuildingClassYieldChanges bcyc
        WHERE bc.Type IN ('BUILDINGCLASS_PALISADES', 'BUILDINGCLASS_WEAPONS_DEPOT', 'BUILDINGCLASS_DEFENSE_SATELLITE')
        AND bcyc.BeliefType = 'BELIEF_DEFENDER_FAITH'
        AND EXISTS (SELECT * FROM COMMUNITY WHERE Type = 'CBPMC_DEFENSES' AND Value= 1);

-- Add additional defense buildings to Oda Nobunaga's Ubique Ability (Japan)
-- +1 Faith and Culture for all of these buildings.
INSERT  INTO Trait_BuildingClassYieldChanges
        (TraitType, BuildingClassType, YieldType, YieldChange)
        SELECT DISTINCT bcyc.TraitType, bc.Type, bcyc.YieldType, bcyc.YieldChange
        FROM BuildingClasses bc, Trait_BuildingClassYieldChanges bcyc
        WHERE bc.Type IN ('BUILDINGCLASS_PALISADES', 'BUILDINGCLASS_WEAPONS_DEPOT', 'BUILDINGCLASS_DEFENSE_SATELLITE')
        AND bcyc.TraitType = 'TRAIT_FIGHT_WELL_DAMAGED'
        AND EXISTS (SELECT * FROM COMMUNITY WHERE Type = 'CBPMC_DEFENSES' AND Value= 1);
