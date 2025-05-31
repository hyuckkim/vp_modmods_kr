INSERT INTO UnitPromotions_UnitCombats (PromotionType, UnitCombatType)
SELECT 'PROMOTION_GENERAL_STACKING', 'UNITCOMBAT_RECON' UNION ALL
SELECT 'PROMOTION_GENERAL_STACKING', 'UNITCOMBAT_ARCHER' UNION ALL
SELECT 'PROMOTION_GENERAL_STACKING', 'UNITCOMBAT_MOUNTED' UNION ALL
SELECT 'PROMOTION_GENERAL_STACKING', 'UNITCOMBAT_MELEE' UNION ALL
SELECT 'PROMOTION_GENERAL_STACKING', 'UNITCOMBAT_SIEGE' UNION ALL
SELECT 'PROMOTION_GENERAL_STACKING', 'UNITCOMBAT_GUN' UNION ALL
SELECT 'PROMOTION_GENERAL_STACKING', 'UNITCOMBAT_ARMOR';

INSERT INTO Building_SpecialistYieldChanges (BuildingType, SpecialistType, YieldType, Yield)
SELECT 'BUILDING_FA_CENTRAL_BANK', 'SPECIALIST_MERCHANT', 'YIELD_GOLD', 1 WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_FA_CENTRAL_BANK');

INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield)
SELECT 'BUILDING_FA_CENTRAL_BANK', 'YIELD_GOLD', 4 WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_FA_CENTRAL_BANK') UNION ALL
SELECT 'BUILDING_FA_WAR_ACADEMY', 'YIELD_GREAT_GENERAL_POINTS', 1 WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_FA_WAR_ACADEMY') UNION ALL
SELECT 'BUILDING_FA_SEA_ACADEMY', 'YIELD_GREAT_ADMIRAL_POINTS', 1 WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_FA_SEA_ACADEMY');

UPDATE Building_Flavors
SET Flavor = 0
WHERE BuildingType = 'BUILDING_FA_ELECTRIC_CO' AND FlavorType = 'FLAVOR_HAPPINESS';

UPDATE Building_BuildingClassHappiness
SET Happiness = 0
WHERE BuildingClassType = 'BUILDINGCLASS_FA_ELECTRIC_POWER' AND BuildingType = 'BUILDING_FA_ELECTRIC_CO';

UPDATE Building_YieldChanges
SET Yield = 0
WHERE BuildingType = 'BUILDING_FA_WAR_ACADEMY' AND YieldType = 'YIELD_FOOD';

DELETE FROM Building_PrereqBuildingClasses
WHERE BuildingType = 'BUILDING_FA_CENTRAL_BANK';

DELETE FROM Building_PrereqBuildingClasses
WHERE BuildingType = 'BUILDING_FA_CENTRAL_STATION';

DELETE FROM Building_PrereqBuildingClasses
WHERE BuildingType = 'BUILDING_FA_WAR_ACADEMY';

UPDATE Building_ClassesNeededInCity
SET BuildingClassType = 'BUILDINGCLASS_HARBOR'
WHERE BuildingType = 'BUILDING_FA_SEA_ACADEMY';

UPDATE Building_ClassesNeededInCity
SET BuildingClassType = 'BUILDINGCLASS_TRAINSTATION'
WHERE BuildingType = 'BUILDING_FA_CENTRAL_STATION';

INSERT INTO Building_ClassesNeededInCity (BuildingType, BuildingClassType)
SELECT 'BUILDING_FA_CENTRAL_BANK', 'BUILDINGCLASS_BANK' WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_FA_CENTRAL_BANK');

UPDATE Building_YieldChanges
SET Yield = 0
WHERE BuildingType = 'BUILDING_FA_WAR_ACADEMY' AND YieldType = 'YIELD_FOOD';

DELETE FROM Building_DomainFreeExperiences
WHERE BuildingType = 'BUILDING_FA_WAR_ACADEMY';

DELETE FROM Building_DomainProductionModifiers
WHERE BuildingType = 'BUILDING_FA_WAR_ACADEMY';

DELETE FROM Building_DomainFreeExperiences
WHERE BuildingType = 'BUILDING_FA_SEA_ACADEMY';

DELETE FROM Building_DomainProductionModifiers
WHERE BuildingType = 'BUILDING_FA_SEA_ACADEMY';

UPDATE Buildings
SET Cost = (SELECT Cost FROM Buildings WHERE Type = 'BUILDING_PRINTING_PRESS'), NumCityCostMod = (SELECT NumCityCostMod FROM Buildings WHERE Type = 'BUILDING_PRINTING_PRESS'), NationalPopRequired = (SELECT NationalPopRequired FROM Buildings WHERE Type = 'BUILDING_PRINTING_PRESS'), TrainedFreePromotion = 'PROMOTION_GENERAL_STACKING', GreatGeneralRateModifier = 0, CitySupplyModifier = 10, HurryCostModifier = (SELECT HurryCostModifier FROM Buildings WHERE Type = 'BUILDING_PRINTING_PRESS'), FreeBuildingThisCity = NULL
WHERE Type = 'BUILDING_FA_WAR_ACADEMY';

UPDATE Buildings
SET Cost = (SELECT Cost FROM Buildings WHERE Type = 'BUILDING_HERMITAGE'), NumCityCostMod = (SELECT NumCityCostMod FROM Buildings WHERE Type = 'BUILDING_HERMITAGE'), NationalPopRequired = (SELECT NationalPopRequired FROM Buildings WHERE Type = 'BUILDING_HERMITAGE'), FreePromotion = 'PROMOTION_FA_SEA_ACADEMY', TrainedFreePromotion = NULL, CitySupplyFlat = 2, HurryCostModifier = (SELECT HurryCostModifier FROM Buildings WHERE Type = 'BUILDING_HERMITAGE')
WHERE Type = 'BUILDING_FA_SEA_ACADEMY';

UPDATE Buildings
SET Cost = ((SELECT Cost FROM Buildings WHERE Type = 'BUILDING_HERMITAGE')+(SELECT Cost FROM Buildings WHERE Type = 'BUILDING_FOREIGN_OFFICE'))/2, NumCityCostMod = (SELECT NumCityCostMod FROM Buildings WHERE Type = 'BUILDING_FOREIGN_OFFICE'), NationalPopRequired = ((SELECT NationalPopRequired FROM Buildings WHERE Type = 'BUILDING_HERMITAGE')+(SELECT NationalPopRequired FROM Buildings WHERE Type = 'BUILDING_FOREIGN_OFFICE'))/2, GreatPeopleRateChange = 1, HurryCostModifier = (SELECT HurryCostModifier FROM Buildings WHERE Type = 'BUILDING_FOREIGN_OFFICE')
WHERE Type = 'BUILDING_FA_CENTRAL_BANK';

UPDATE Buildings
SET Cost = ((SELECT Cost FROM Buildings WHERE Type = 'BUILDING_HERMITAGE')+(SELECT Cost FROM Buildings WHERE Type = 'BUILDING_FOREIGN_OFFICE'))/2, NumCityCostMod = (SELECT NumCityCostMod FROM Buildings WHERE Type = 'BUILDING_FOREIGN_OFFICE'), NationalPopRequired = ((SELECT NationalPopRequired FROM Buildings WHERE Type = 'BUILDING_HERMITAGE')+(SELECT NationalPopRequired FROM Buildings WHERE Type = 'BUILDING_FOREIGN_OFFICE'))/2, CityConnectionTradeRouteModifier = 25, HurryCostModifier = (SELECT HurryCostModifier FROM Buildings WHERE Type = 'BUILDING_FOREIGN_OFFICE')
WHERE Type = 'BUILDING_FA_CENTRAL_STATION';

UPDATE Buildings
SET Cost = (SELECT Cost FROM Buildings WHERE Type = 'BUILDING_FOREIGN_OFFICE'), NumCityCostMod = (SELECT NumCityCostMod FROM Buildings WHERE Type = 'BUILDING_FOREIGN_OFFICE'), NationalPopRequired = (SELECT NationalPopRequired FROM Buildings WHERE Type = 'BUILDING_FOREIGN_OFFICE'), HurryCostModifier = (SELECT HurryCostModifier FROM Buildings WHERE Type = 'BUILDING_FOREIGN_OFFICE')
WHERE Type = 'BUILDING_FA_AIR_ACADEMY';

UPDATE Buildings
SET Cost = (SELECT Cost FROM Buildings WHERE Type = 'BUILDING_INTELLIGENCE_AGENCY'), NumCityCostMod = (SELECT NumCityCostMod FROM Buildings WHERE Type = 'BUILDING_INTELLIGENCE_AGENCY'), NationalPopRequired = (SELECT NationalPopRequired FROM Buildings WHERE Type = 'BUILDING_INTELLIGENCE_AGENCY'), FreeBuilding = 'BUILDINGCLASS_FA_ELECTRIC_POWER', HurryCostModifier = (SELECT HurryCostModifier FROM Buildings WHERE Type = 'BUILDING_INTELLIGENCE_AGENCY'), GoldMaintenance = 0, FreeBuildingThisCity = 'BUILDINGCLASS_HYDRO_PLANT'
WHERE Type = 'BUILDING_FA_ELECTRIC_CO';

UPDATE Language_en_US
SET Text = '+1 [ICON_GOLD] Gold to Merchants in all Cities.[NEWLINE][NEWLINE]Must be built in the [ICON_CAPITAL] Capital. The [ICON_PRODUCTION] Production Cost and [ICON_CITIZEN] Population Requirements increase based on the number of cities you own.'
WHERE Tag = 'TXT_KEY_BUILDING_FA_CENTRAL_BANK_HELP';

UPDATE Language_en_US
SET Text = '+25% [ICON_GOLD] Gold from [ICON_TRADE] City Connections. +1 [ICON_GOLD] Gold to Factories.[NEWLINE][NEWLINE]The [ICON_PRODUCTION] Production Cost and [ICON_CITIZEN] Population Requirements increase based on the number of cities you own.'
WHERE Tag = 'TXT_KEY_BUILDING_FA_CENTRAL_STATION_HELP';

UPDATE Language_en_US
SET Text = '+25% [ICON_GOLD] Gold from [ICON_TRADE] City Connections. +1 [ICON_GOLD] Gold to Factories.[NEWLINE][NEWLINE]The [ICON_PRODUCTION] Production Cost and [ICON_CITIZEN] Population Requirements increase based on the number of cities you own.'
WHERE Tag = 'TXT_KEY_BUILDING_FA_CENTRAL_STATION2_HELP';

UPDATE Language_en_US
SET Text = 'Provides a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] {TXT_KEY_BUILDING_HYDRO_PLANT}. All cities receive [COLOR_POSITIVE_TEXT]Electric Power[ENDCOLOR] which increases [ICON_RESEARCH] Science, [ICON_GOLD] Gold, and [ICON_PRODUCTION] Production in all cities.[NEWLINE][NEWLINE]Must be built in a city on a river. The [ICON_PRODUCTION] Production Cost and [ICON_CITIZEN] Population Requirements increase based on the number of cities you own.'
WHERE Tag = 'TXT_KEY_BUILDING_FA_ELECTRIC_CO_HELP';

UPDATE Language_en_US
SET Text = 'All cities receive [COLOR_POSITIVE_TEXT]Electric Power[ENDCOLOR] which increases [ICON_RESEARCH] Science, [ICON_GOLD] Gold, and [ICON_PRODUCTION] Production in all cities.[NEWLINE][NEWLINE]Must be built in a city on a river. The [ICON_PRODUCTION] Production Cost and [ICON_CITIZEN] Population Requirements increase based on the number of cities you own.'
WHERE Tag = 'TXT_KEY_BUILDING_FA_ELECTRIC_CO2_HELP';

UPDATE Language_en_US
SET Text = 'All Land Units created by this City (past or future) receive the [COLOR_POSITIVE_TEXT]{TXT_KEY_PROMOTION_GENERAL_STACKING}[ENDCOLOR] Promotion ({TXT_KEY_PROMOTION_GENERAL_STACKING_HELP}). [ICON_SILVER_FIST] Military Units Supplied by this City''s population increased by 10%.[NEWLINE][NEWLINE]The [ICON_PRODUCTION] Production Cost and [ICON_CITIZEN] Population Requirements increase based on the number of cities you own.'
WHERE Tag = 'TXT_KEY_BUILDING_FA_WAR_ACADEMY_HELP';

UPDATE Language_en_US
SET Text = 'Increase [ICON_SILVER_FIST] Military Unit Supply Cap by 2. All Naval units may receive the [COLOR_POSITIVE_TEXT]{TXT_KEY_PROMOTION_FA_SEA_ACADEMY}[ENDCOLOR] Promotion ({TXT_KEY_PROMOTION_FA_SEA_ACADEMY_HELP}).[NEWLINE][NEWLINE]The [ICON_PRODUCTION] Production Cost and [ICON_CITIZEN] Population Requirements increase based on the number of cities you own.'
WHERE Tag = 'TXT_KEY_BUILDING_FA_SEA_ACADEMY_HELP';

UPDATE Language_en_US
SET Text = '+25% [ICON_PRODUCTION] Production for all Air Units. All air units trained in this city may receive the [COLOR_POSITIVE_TEXT]{TXT_KEY_PROMOTION_EVASION}[ENDCOLOR] Promotion ({TXT_KEY_PROMOTION_EVASION_HELP}).[NEWLINE][NEWLINE]The [ICON_PRODUCTION] Production Cost and [ICON_CITIZEN] Population Requirements increase based on the number of cities you own.'
WHERE Tag = 'TXT_KEY_BUILDING_FA_AIR_ACADEMY_HELP';

UPDATE Language_en_US
SET Text = '+50% Experience gained from Combat. +1 [ICON_MOVES] Movement.'
WHERE Tag = 'TXT_KEY_PROMOTION_FA_SEA_ACADEMY_HELP';

UPDATE UnitPromotions
SET ExperiencePercent = 50, MovesChange = 1, PortraitIndex = 34, IconAtlas = 'promoVP_atlas_01'
WHERE Type = 'PROMOTION_FA_SEA_ACADEMY';

DELETE FROM UnitPromotions_Domains 
WHERE PromotionType = 'PROMOTION_FA_SEA_ACADEMY';

DELETE FROM UnitPromotions_Terrains
WHERE PromotionType = 'PROMOTION_FA_SEA_ACADEMY';

DELETE FROM UnitPromotions_UnitCombats
WHERE PromotionType = 'PROMOTION_FA_SEA_ACADEMY' AND UnitCombatType = 'UNITCOMBAT_NAVAL';

DELETE FROM UnitPromotions_UnitCombats
WHERE PromotionType = 'PROMOTION_FA_SEA_ACADEMY' AND UnitCombatType = 'UNITCOMBAT_NAVAL';

DELETE FROM Building_FreeUnits
WHERE BuildingType = 'BUILDING_FA_CENTRAL_STATION' AND UnitType = 'UNIT_FA_CENTRAL_STATION';

DELETE FROM Building_FreeUnits
WHERE BuildingType = 'BUILDING_FA_ELECTRIC_CO' AND UnitType = 'UNIT_FA_ELECTRIC_CO';

DELETE FROM Units
WHERE Type = 'UNIT_FA_ELECTRIC_CO';

DELETE FROM Units
WHERE Type = 'UNIT_FA_CENTRAL_STATION';

DELETE FROM Building_FreeUnits
WHERE BuildingType = 'BUILDING_FA_SEA_ACADEMY' AND UnitType = 'UNIT_GREAT_ADMIRAL';

INSERT INTO Policy_BuildingClassHappiness (PolicyType, BuildingClassType, Happiness)
SELECT 'POLICY_LEGALISM', 'BUILDINGCLASS_FA_AIR_ACADEMY', 1 WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_FA_AIR_ACADEMY') UNION ALL
SELECT 'POLICY_LEGALISM', 'BUILDINGCLASS_FA_ELECTRIC_CO', 1 WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_FA_ELECTRIC_CO') UNION ALL
SELECT 'POLICY_LEGALISM', 'BUILDINGCLASS_FA_CENTRAL_BANK', 1 WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_FA_CENTRAL_BANK') UNION ALL
SELECT 'POLICY_LEGALISM', 'BUILDINGCLASS_FA_CENTRAL_STATION', 1 WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_FA_CENTRAL_STATION') UNION ALL
SELECT 'POLICY_LEGALISM', 'BUILDINGCLASS_FA_WAR_ACADEMY', 1 WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_FA_WAR_ACADEMY') UNION ALL
SELECT 'POLICY_LEGALISM', 'BUILDINGCLASS_FA_SEA_ACADEMY', 1 WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_FA_SEA_ACADEMY');

INSERT INTO Policy_BuildingClassProductionModifiers (PolicyType, BuildingClassType, ProductionModifier)
SELECT 'POLICY_LEGALISM', 'BUILDINGCLASS_FA_AIR_ACADEMY', 25 WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_FA_AIR_ACADEMY') UNION ALL
SELECT 'POLICY_LEGALISM', 'BUILDINGCLASS_FA_ELECTRIC_CO', 25 WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_FA_ELECTRIC_CO') UNION ALL
SELECT 'POLICY_LEGALISM', 'BUILDINGCLASS_FA_CENTRAL_BANK', 25 WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_FA_CENTRAL_BANK') UNION ALL
SELECT 'POLICY_LEGALISM', 'BUILDINGCLASS_FA_CENTRAL_STATION', 25 WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_FA_CENTRAL_STATION') UNION ALL
SELECT 'POLICY_LEGALISM', 'BUILDINGCLASS_FA_WAR_ACADEMY', 25 WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_FA_WAR_ACADEMY') UNION ALL
SELECT 'POLICY_LEGALISM', 'BUILDINGCLASS_FA_SEA_ACADEMY', 25 WHERE EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_FA_SEA_ACADEMY');