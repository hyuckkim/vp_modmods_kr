----------------------------------------------------
-- Enlightenment Era (Vox Populi)
-- BUILDINGS
-- 2018-01-31 Reworked by Infixo from EE & VP-EE mods
-- 2022-11-09 Updated by N.Core to be compatible with VP 3.0
-- 2022-08-24 Updated by CAYM to be compatible with VP 3.8
-- 2022-09-22 Updated by CAYM to be compatible with VP 3.10
-- 2023-11-06 Updated by CAYM to be compatible with VP 4.2.7
-- 2025-05-28 Updated by Hokath pre-5.0
----------------------------------------------------

----------------------------------------------------
-- Generic info
----------------------------------------------------
INSERT INTO Buildings (Type, PrereqTech, ArtDefineTag, PortraitIndex, IconAtlas) VALUES
('BUILDING_EE_ACADEMY',    'TECH_EE_HUMANISM',     'FORGE',  3,'ENLIGHTENMENT_BUILDING_ATLAS'),
('BUILDING_EE_CLOTH_MILL', 'TECH_EE_MANUFACTURING','FORGE',  4,'ENLIGHTENMENT_BUILDING_ATLAS'),
('BUILDING_EE_DRYDOCK',    'TECH_EE_WARSHIPS',    'HARBOR',  6,'ENLIGHTENMENT_BUILDING_ATLAS'),
('BUILDING_EE_GUNSMITH',   'TECH_EE_FLINTLOCK',    'FORGE',  0,'ENLIGHTENMENT_BUILDING_ATLAS'),
('BUILDING_EE_MANOR',      'TECH_EE_SOVEREIGNTY',  'FORGE',  1,'ENLIGHTENMENT_BUILDING_ATLAS'),
('BUILDING_EE_MENAGERIE',  'TECH_EE_FORTIFICATION','THEATRE',  5,'ENLIGHTENMENT_BUILDING_ATLAS'),  -- placement needs to remember it is prereq for zoo
('BUILDING_EE_SEMINARY',   'TECH_EE_HUMANISM',     'FORGE',  2,'ENLIGHTENMENT_BUILDING_ATLAS'),
('BUILDING_EE_SALON',      'TECH_NAVIGATION',      'FORGE',  4,'EXPANSION_BW_ATLAS_1'),
('BUILDING_EE_TAVERN',     'TECH_EE_EXPLORATION',  'FORGE',  7,'ENLIGHTENMENT_BUILDING_ATLAS'),
('BUILDING_EE_WEIGH_HOUSE','TECH_ECONOMICS',       'FORGE', 27,'BW_ATLAS_1');

UPDATE Buildings
SET BuildingClass = 'BUILDINGCLASS_'||SUBSTR(Type,10), Description = 'TXT_KEY_'||Type,
	Civilopedia = 'TXT_KEY_'||Type||'_PEDIA', Strategy = 'TXT_KEY_'||Type||'_STRATEGY', Help = 'TXT_KEY_'||Type||'_HELP',
	MinAreaSize = -1, HurryCostModifier = -20, ConquestProb = 66
WHERE Type IN (
'BUILDING_EE_ACADEMY',
'BUILDING_EE_CLOTH_MILL',
'BUILDING_EE_DRYDOCK',
'BUILDING_EE_GUNSMITH',
'BUILDING_EE_MANOR',
'BUILDING_EE_MENAGERIE',
'BUILDING_EE_SEMINARY',
'BUILDING_EE_SALON',
'BUILDING_EE_TAVERN',
'BUILDING_EE_WEIGH_HOUSE');

INSERT INTO BuildingClasses (Type, DefaultBuilding, Description)
SELECT 'BUILDINGCLASS_'||SUBSTR(Type,10), Type, 'TXT_KEY_'||Type
FROM Buildings
WHERE Type IN (
'BUILDING_EE_ACADEMY',
'BUILDING_EE_CLOTH_MILL',
'BUILDING_EE_DRYDOCK',
'BUILDING_EE_GUNSMITH',
'BUILDING_EE_MANOR',
'BUILDING_EE_MENAGERIE',
'BUILDING_EE_SEMINARY',
'BUILDING_EE_SALON',
'BUILDING_EE_TAVERN',
'BUILDING_EE_WEIGH_HOUSE');

------------------------------------------------------------------------------------------------------------------------	
-- Building Lines
-- Castle -> Bastion -> Arsenal
-- Garden -> Manor
-- Harbor -> Tavern
-- University + Temple -> Seminary
-- University + Armory -> Polytechnic
-- Harbor -> Drydock
-- Armory -> Gunsmith
-- Circus -> Menagerie -> Zoo
-- Workshop -> Cloth Mill -> Factory
-- Customs House -> Weigh House -> Stock Exchange
-- Customs House -> Cafe
------------------------------------------------------------------------------------------------------------------------	

INSERT INTO Building_ClassesNeededInCity (BuildingType, BuildingClassType) VALUES
('BUILDING_EE_DRYDOCK', 'BUILDINGCLASS_HARBOR'),
('BUILDING_EE_GUNSMITH', 'BUILDINGCLASS_ARMORY'),
('BUILDING_EE_TAVERN', 'BUILDINGCLASS_HARBOR'),
('BUILDING_EE_MENAGERIE', 'BUILDINGCLASS_CIRCUS'),
('BUILDING_EE_CLOTH_MILL', 'BUILDINGCLASS_WINDMILL'),
('BUILDING_EE_WEIGH_HOUSE', 'BUILDINGCLASS_BANK'),
('BUILDING_EE_ACADEMY', 'BUILDINGCLASS_UNIVERSITY'),
('BUILDING_EE_SEMINARY', 'BUILDINGCLASS_UNIVERSITY'),
('BUILDING_EE_ACADEMY', 'BUILDINGCLASS_ARMORY'),
('BUILDING_EE_SEMINARY', 'BUILDINGCLASS_TEMPLE'),
('BUILDING_EE_SALON', 'BUILDINGCLASS_MINT'),
('BUILDING_EE_MANOR', 'BUILDINGCLASS_GARDEN');

------------------------
-- Flavors
------------------------

INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) VALUES
('BUILDING_EE_ACADEMY', 'FLAVOR_SCIENCE', 20),
('BUILDING_EE_ACADEMY', 'FLAVOR_DEFENSE', 10),
('BUILDING_EE_SEMINARY', 'FLAVOR_RELIGION', 20),
('BUILDING_EE_SEMINARY', 'FLAVOR_CULTURE', 10),
('BUILDING_EE_CLOTH_MILL', 'FLAVOR_PRODUCTION', 20),
('BUILDING_EE_CLOTH_MILL', 'FLAVOR_GOLD', 20),
('BUILDING_EE_DRYDOCK', 'FLAVOR_NAVAL', 20),
('BUILDING_EE_DRYDOCK', 'FLAVOR_MILITARY_TRAINING', 25),
('BUILDING_EE_GUNSMITH', 'FLAVOR_SCIENCE', 15),
('BUILDING_EE_GUNSMITH', 'FLAVOR_MILITARY_TRAINING', 30),
('BUILDING_EE_MANOR', 'FLAVOR_EXPANSION', 15),
('BUILDING_EE_SALON', 'FLAVOR_CULTURE', 35),
('BUILDING_EE_WEIGH_HOUSE', 'FLAVOR_GOLD', 25),
('BUILDING_EE_WEIGH_HOUSE', 'FLAVOR_I_SEA_TRADE_ROUTE', 20),
('BUILDING_EE_WEIGH_HOUSE', 'FLAVOR_I_TRADE_DESTINATION', 20),
('BUILDING_EE_WEIGH_HOUSE', 'FLAVOR_I_TRADE_ORIGIN', 25),
('BUILDING_EE_MENAGERIE', 'FLAVOR_HAPPINESS', 10),
('BUILDING_EE_MENAGERIE', 'FLAVOR_CULTURE', 20),
('BUILDING_EE_WEIGH_HOUSE', 'FLAVOR_I_TRADE_ORIGIN', 10),
('BUILDING_EE_TAVERN', 'FLAVOR_RECON', 25),
('BUILDING_EE_TAVERN', 'FLAVOR_OFFENSE', 5),
('BUILDING_EE_TAVERN', 'FLAVOR_GROWTH', 15);

----------------------------------------------
-- Tavern
-- Hokath: answer to the Recon-being-bad after Reconnaissance problem
----------------------------------------------
INSERT INTO Building_YieldFromPillage
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_EE_TAVERN', 'YIELD_GOLD', 15),
	('BUILDING_EE_TAVERN', 'YIELD_TOURISM', 15);

INSERT INTO Building_UnitCombatFreeExperiences
	(BuildingType, UnitCombatType, Experience)
VALUES
	('BUILDING_EE_TAVERN', 'UNITCOMBAT_RECON', 30);

INSERT INTO Building_UnitCombatProductionModifiers
	(BuildingType, UnitCombatType, Modifier)
VALUES
	('BUILDING_EE_TAVERN', 'UNITCOMBAT_RECON', 15);

INSERT INTO Building_ResourceYieldChanges 
	(BuildingType, ResourceType, YieldType, Yield) 
VALUES
	('BUILDING_EE_TAVERN', 'RESOURCE_WHALE', 'YIELD_SCIENCE', 1),
	('BUILDING_EE_TAVERN', 'RESOURCE_WHALE', 'YIELD_GOLD', 2),

	('BUILDING_EE_TAVERN', 'RESOURCE_FISH',  'YIELD_FOOD', 1),
	('BUILDING_EE_TAVERN', 'RESOURCE_FISH',  'YIELD_GOLD', 1),

	('BUILDING_EE_TAVERN', 'RESOURCE_CRAB',       'YIELD_FOOD', 1),
	('BUILDING_EE_TAVERN', 'RESOURCE_CRAB',       'YIELD_GOLD', 1),
	('BUILDING_EE_TAVERN', 'RESOURCE_CRAB',       'YIELD_TOURISM', 1);

----------------------------------------------
-- Menagerie
-- Hokath: better than the park, have also improved icon
----------------------------------------------
UPDATE Buildings SET 
BoredomFlatReduction = 1
WHERE Type = 'BUILDING_EE_MENAGERIE';

UPDATE Building_ClassesNeededInCity
SET BuildingClassType = 'BUILDINGCLASS_EE_MENAGERIE'
WHERE BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_THEATRE');

INSERT INTO Building_InstantYield
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_EE_MENAGERIE', 'YIELD_TOURISM', 250);

INSERT INTO Building_YieldChangesPerPop (BuildingType, YieldType, Yield) VALUES
('BUILDING_EE_MENAGERIE',  'YIELD_TOURISM', 17);

INSERT INTO Building_ResourceYieldChanges 
	(BuildingType, ResourceType, YieldType, Yield) 
VALUES
	('BUILDING_EE_MENAGERIE', 'RESOURCE_BISON',    'YIELD_FOOD', 1),
	('BUILDING_EE_MENAGERIE', 'RESOURCE_BISON',    'YIELD_CULTURE', 1),

	('BUILDING_EE_MENAGERIE', 'RESOURCE_HORSE',    'YIELD_PRODUCTION', 1),
	('BUILDING_EE_MENAGERIE', 'RESOURCE_HORSE',    'YIELD_CULTURE', 1),

	('BUILDING_EE_MENAGERIE', 'RESOURCE_BANANA', 'YIELD_GOLD', 1),
	('BUILDING_EE_MENAGERIE', 'RESOURCE_BANANA', 'YIELD_TOURISM', 1),

	('BUILDING_EE_MENAGERIE', 'RESOURCE_CORAL',	'YIELD_SCIENCE', 1),
	('BUILDING_EE_MENAGERIE', 'RESOURCE_CORAL',	'YIELD_CULTURE', 1),

	('BUILDING_EE_MENAGERIE', 'RESOURCE_IVORY',  'YIELD_TOURISM', 2),
	('BUILDING_EE_MENAGERIE', 'RESOURCE_IVORY',  'YIELD_PRODUCTION', 2);

----------------------------------------------
-- Polytechnic (rename Academy since that's an improvement)
-- Hokath: introduce Seminary as another Faith building to be exclusive with it
----------------------------------------------

UPDATE Buildings SET MutuallyExclusiveGroup = 17 WHERE Type = 'BUILDING_EE_ACADEMY' OR Type = 'BUILDING_EE_SEMINARY';

INSERT INTO Building_HurryModifiersLocal
	(BuildingType, HurryType, HurryCostModifier)
VALUES
	('BUILDING_EE_ACADEMY', 'HURRY_GOLD', -10);

INSERT INTO Building_YieldFromFaithPurchase
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_EE_SEMINARY', 'YIELD_FAITH', 10);

INSERT INTO Building_YieldChanges 
	(BuildingType, YieldType, Yield) 
VALUES
	('BUILDING_EE_ACADEMY', 'YIELD_SCIENCE', 2),
	('BUILDING_EE_SEMINARY',   'YIELD_FAITH', 2);

INSERT INTO Building_SpecificGreatPersonRateModifier 
	(BuildingType, SpecialistType, Modifier) 
VALUES
	('BUILDING_EE_ACADEMY', 'SPECIALIST_SCIENTIST', 20),
	('BUILDING_EE_ACADEMY', 'SPECIALIST_ENGINEER', 20);

INSERT INTO Building_YieldChangesPerPop 
	(BuildingType, YieldType, Yield) 
VALUES
	('BUILDING_EE_ACADEMY', 'YIELD_SCIENCE', 17),
	('BUILDING_EE_SEMINARY', 'YIELD_FAITH', 17);

UPDATE Buildings SET
ExtraMissionaryStrengthGlobal = 5
WHERE Type = 'BUILDING_EE_SEMINARY';

INSERT INTO Building_YieldFromBirth
	(BuildingType, YieldType, Yield, IsEraScaling)
VALUES
	('BUILDING_EE_SEMINARY', 'YIELD_GOLDEN_AGE_POINTS', 20, 0),
	('BUILDING_EE_SEMINARY', 'YIELD_FAITH', 10, 1),
	('BUILDING_EE_ACADEMY', 'YIELD_SCIENCE', 15, 1),
	('BUILDING_EE_ACADEMY', 'YIELD_GREAT_GENERAL_POINTS', 10, 0);

----------------------------------------------
-- Cafe (hokaths take on the Salon)
----------------------------------------------

UPDATE Buildings SET 
NoUnhappfromXSpecialists = 1
WHERE Type = 'BUILDING_EE_SALON';

INSERT INTO Building_SpecificGreatPersonRateModifier 
	(BuildingType, SpecialistType, Modifier) 
VALUES
	('BUILDING_EE_SALON', 'SPECIALIST_WRITER', 20),
	('BUILDING_EE_SALON', 'SPECIALIST_ARTIST', 20),
	('BUILDING_EE_SALON', 'SPECIALIST_MUSICIAN', 20);

INSERT INTO Building_YieldChangesPerPop (BuildingType, YieldType, Yield) VALUES
('BUILDING_EE_SALON',  'YIELD_FOOD', 17);

INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_EE_SALON', 'YIELD_FOOD', 2);

INSERT INTO Building_ResourceYieldChanges 
	(BuildingType, ResourceType, YieldType, Yield) 
VALUES
	('BUILDING_EE_SALON', 'RESOURCE_COCOA',   	'YIELD_GOLD', 2),
	('BUILDING_EE_SALON', 'RESOURCE_COCOA',   	'YIELD_TOURISM', 1),

	('BUILDING_EE_SALON', 'RESOURCE_SPICES',	'YIELD_GOLD', 1),
	('BUILDING_EE_SALON', 'RESOURCE_SPICES',	'YIELD_FOOD', 1),
	('BUILDING_EE_SALON', 'RESOURCE_SPICES',	'YIELD_TOURISM', 1),

	('BUILDING_EE_SALON', 'RESOURCE_COFFEE',   	'YIELD_GOLD', 2),
	('BUILDING_EE_SALON', 'RESOURCE_COFFEE',   	'YIELD_CULTURE', 1),

	('BUILDING_EE_SALON', 'RESOURCE_TEA',   	'YIELD_FOOD', 2),
	('BUILDING_EE_SALON', 'RESOURCE_TEA',		'YIELD_CULTURE', 1),

	('BUILDING_EE_SALON', 'RESOURCE_SUGAR',   	'YIELD_FOOD', 2),
	('BUILDING_EE_SALON', 'RESOURCE_SUGAR',   	'YIELD_GOLD', 2);

----------------------------------------------
-- Weigh House and Cloth Mill
----------------------------------------------

UPDATE Buildings SET
SpecialistType = 'SPECIALIST_MERCHANT', SpecialistCount = 0, 
TradeRouteRecipientBonus = 1, TradeRouteTargetBonus = 2, 
FreeStartEra = 'ERA_FUTURE'
WHERE Type = 'BUILDING_EE_WEIGH_HOUSE';

UPDATE Buildings
SET PovertyFlatReduction = 1, SpecialistType = 'SPECIALIST_ENGINEER', SpecialistCount = 0
WHERE Type = 'BUILDING_EE_CLOTH_MILL';

INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_EE_CLOTH_MILL',  'YIELD_PRODUCTION', 3),
('BUILDING_EE_WEIGH_HOUSE', 'YIELD_GOLD',       3);

INSERT INTO Building_YieldChangesPerPop (BuildingType, YieldType, Yield) VALUES
('BUILDING_EE_CLOTH_MILL',  'YIELD_PRODUCTION', 17), 
('BUILDING_EE_WEIGH_HOUSE', 'YIELD_GOLD',       17);

UPDATE Building_ClassesNeededInCity
SET BuildingClassType = 'BUILDINGCLASS_EE_CLOTH_MILL'
WHERE BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_FACTORY');

UPDATE Building_ClassesNeededInCity
SET BuildingClassType = 'BUILDINGCLASS_EE_WEIGH_HOUSE'
WHERE BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_STOCK_EXCHANGE');

INSERT INTO Building_ResourceYieldChanges 
	(BuildingType, ResourceType, YieldType, Yield) 
VALUES
	('BUILDING_EE_CLOTH_MILL', 'RESOURCE_SHEEP',		'YIELD_PRODUCTION', 1),
	('BUILDING_EE_CLOTH_MILL', 'RESOURCE_SHEEP',		'YIELD_GOLD', 1),

	('BUILDING_EE_CLOTH_MILL', 'RESOURCE_COTTON',		'YIELD_GOLD', 3),

	('BUILDING_EE_CLOTH_MILL', 'RESOURCE_DYE',		'YIELD_GOLD', 2),
	('BUILDING_EE_CLOTH_MILL', 'RESOURCE_DYE',		'YIELD_CULTURE', 1),

	('BUILDING_EE_CLOTH_MILL', 'RESOURCE_SILK',		'YIELD_GOLD', 2),
	('BUILDING_EE_CLOTH_MILL', 'RESOURCE_SILK',		'YIELD_TOURISM', 1),

	('BUILDING_EE_CLOTH_MILL', 'RESOURCE_FUR', 		'YIELD_GOLD', 1),
	('BUILDING_EE_CLOTH_MILL', 'RESOURCE_FUR',  		'YIELD_TOURISM', 2);

INSERT INTO Building_ResourceYieldChanges 
	(BuildingType, ResourceType, YieldType, Yield) 
VALUES
	('BUILDING_EE_WEIGH_HOUSE', 'RESOURCE_GOLD',	        'YIELD_GOLD', 2),
	('BUILDING_EE_WEIGH_HOUSE', 'RESOURCE_GOLD',	        'YIELD_CULTURE', 1),

	('BUILDING_EE_WEIGH_HOUSE', 'RESOURCE_GEMS',		'YIELD_GOLD', 3),

	('BUILDING_EE_WEIGH_HOUSE', 'RESOURCE_SILVER',		'YIELD_SCIENCE', 1),
	('BUILDING_EE_WEIGH_HOUSE', 'RESOURCE_SILVER',	        'YIELD_GOLD', 2),

	('BUILDING_EE_WEIGH_HOUSE', 'RESOURCE_COPPER',	        'YIELD_GOLD', 2),
	('BUILDING_EE_WEIGH_HOUSE', 'RESOURCE_COPPER',	        'YIELD_PRODUCTION', 2),

	('BUILDING_EE_WEIGH_HOUSE', 'RESOURCE_SALT',	        'YIELD_GOLD', 1),
	('BUILDING_EE_WEIGH_HOUSE', 'RESOURCE_SALT',		'YIELD_FOOD', 1),
	('BUILDING_EE_WEIGH_HOUSE', 'RESOURCE_SALT',		'YIELD_SCIENCE', 1);	

INSERT INTO Building_RiverPlotYieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_EE_CLOTH_MILL', 'YIELD_GOLD', 1);

UPDATE Building_YieldChangesPerPop SET Yield = 25 WHERE BuildingType = 'BUILDING_STOCK_EXCHANGE';

---------------------------------------------
UPDATE Buildings SET PrereqTech = 'TECH_EE_FORTIFICATION' WHERE BuildingClass = 'BUILDINGCLASS_BASTION_FORT'; -- Includes Ostrog (BUILDING_KREPOST)

----------------------------------------------
-- Manor
-- Hokath: This is mostly for resources like cafe
----------------------------------------------

--UPDATE Buildings SET 
--Happiness = 1
--WHERE Type = 'BUILDING_EE_MANOR';

INSERT INTO Building_YieldFromBorderGrowth (BuildingType, YieldType, Yield)
SELECT 'BUILDING_EE_MANOR', 'YIELD_FOOD', 	10;

INSERT INTO Building_LakePlotYieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_EE_MANOR', 'YIELD_GOLD', 2),
	('BUILDING_EE_MANOR', 'YIELD_TOURISM', 1);

INSERT INTO Building_SpecificGreatPersonRateModifier 
	(BuildingType, SpecialistType, Modifier) 
VALUES
	('BUILDING_EE_MANOR', 'SPECIALIST_MERCHANT', 20),
	('BUILDING_EE_MANOR', 'SPECIALIST_CIVIL_SERVANT', 20);

INSERT INTO Building_ResourceYieldChanges 
	(BuildingType, ResourceType, YieldType, Yield) 
VALUES
	('BUILDING_EE_MANOR', 'RESOURCE_JADE',		'YIELD_CULTURE', 1),
	('BUILDING_EE_MANOR', 'RESOURCE_JADE',		'YIELD_PRODUCTION', 2),

	('BUILDING_EE_MANOR', 'RESOURCE_PERFUME',	'YIELD_CULTURE', 1),
	('BUILDING_EE_MANOR', 'RESOURCE_PERFUME',	'YIELD_GOLDEN_AGE_POINTS', 2),

	('BUILDING_EE_MANOR', 'RESOURCE_PEARLS',	'YIELD_CULTURE', 1),
	('BUILDING_EE_MANOR', 'RESOURCE_PEARLS',	'YIELD_TOURISM', 1),

	('BUILDING_EE_MANOR', 'RESOURCE_LAPIS',		'YIELD_PRODUCTION', 2),
	('BUILDING_EE_MANOR', 'RESOURCE_LAPIS',		'YIELD_GOLDEN_AGE_POINTS', 2),

	('BUILDING_EE_MANOR', 'RESOURCE_DEER',    'YIELD_FOOD', 1),
	('BUILDING_EE_MANOR', 'RESOURCE_DEER',    'YIELD_CULTURE', 1);

----------------------------------------------
-- Drydock
----------------------------------------------

UPDATE Buildings SET 
TrainedFreePromotion = 'PROMOTION_EE_DRYDOCK', 
CitySupplyModifier = 5
WHERE Type = 'BUILDING_EE_DRYDOCK';

INSERT INTO Building_DomainProductionModifiers 
	(BuildingType, DomainType, Modifier) 
VALUES
	('BUILDING_EE_DRYDOCK', 'DOMAIN_SEA', 15);

UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_PLAYER_TURN';

INSERT INTO Building_BuildingClassLocalYieldChanges
	(BuildingType, BuildingClassType, YieldType, YieldChange)
SELECT
	a.Type, b.Type, c.Type, 2
FROM Buildings a, BuildingClasses b, Yields c
WHERE 
a.BuildingClass = 'BUILDINGCLASS_EE_DRYDOCK' AND
b.Type IN ('BUILDINGCLASS_EE_WEIGH_HOUSE', 'BUILDINGCLASS_EE_TAVERN', 'BUILDINGCLASS_SEAPORT') AND 
c.Type IN ('YIELD_GOLD', 'YIELD_PRODUCTION');

----------------------------------------------
-- Gunsmith
----------------------------------------------

UPDATE Buildings
SET CitySupplyFlat = 1
WHERE Type = 'BUILDING_EE_GUNSMITH';

INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_EE_GUNSMITH', 'YIELD_SCIENCE', 2),
('BUILDING_EE_GUNSMITH', 'YIELD_PRODUCTION', 2);

INSERT INTO Building_YieldFromUnitProduction
SELECT 'BUILDING_EE_GUNSMITH', 'YIELD_SCIENCE', 10;

INSERT INTO Building_DomainProductionModifiers (BuildingType, DomainType, Modifier) VALUES
('BUILDING_EE_GUNSMITH', 'DOMAIN_LAND', 15);

UPDATE Building_ClassesNeededInCity
SET BuildingClassType = 'BUILDINGCLASS_EE_GUNSMITH'
WHERE BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_MILITARY_ACADEMY');

INSERT INTO Building_ResourceYieldChanges 
	(BuildingType, ResourceType, YieldType, Yield) 
VALUES
	('BUILDING_EE_GUNSMITH', 'RESOURCE_IRON',		'YIELD_PRODUCTION', 2),

	('BUILDING_EE_GUNSMITH', 'RESOURCE_COAL',		'YIELD_PRODUCTION', 1),
	('BUILDING_EE_GUNSMITH', 'RESOURCE_COAL',		'YIELD_SCIENCE', 1);

-----------------------------
-- adjusting existing buildings
-----------------------------

-- lenses unlocked camera obscura, which revolutionized painting
UPDATE Buildings SET
PrereqTech = 'TECH_EE_REFRACTION',
Cost = 600,
GoldMaintenance = 3
WHERE BuildingClass = 'BUILDINGCLASS_GALLERY';

-- musicians guilds pre-date opera houses by a lot, and they are too late with acoustics moved
UPDATE Buildings SET
PrereqTech = 'TECH_ARCHITECTURE',
Cost = 600,
GoldMaintenance = 3
WHERE BuildingClass = 'BUILDINGCLASS_MUSICIANS_GUILD';

-- move zoo to industrial as appropriate, away from menagerie and the public school (also science)
UPDATE Buildings SET
PrereqTech = 'TECH_EE_ROMANTICISM',
Cost = 1000,
GoldMaintenance = 5
WHERE BuildingClass = 'BUILDINGCLASS_THEATRE';
-- see hotel_zoo_swap.sql for more

-- grocer (pharmacy)
INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
SELECT
	Type, 'YIELD_FAITH', 1
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_GROCER';

INSERT INTO Building_GrowthExtraYield
	(BuildingType, YieldType, Yield)
SELECT
	Type, 'YIELD_FAITH', 25
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_GROCER';

INSERT INTO Building_FeatureYieldChanges
	(BuildingType, FeatureType, YieldType, Yield)
SELECT
	Type, 'FEATURE_MARSH', 'YIELD_SCIENCE', 1
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_GROCER';

INSERT INTO Building_FeatureYieldChanges
	(BuildingType, FeatureType, YieldType, Yield)
SELECT
	Type, 'FEATURE_MARSH', 'YIELD_FAITH', 1
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_GROCER';

DELETE FROM Building_YieldChangesPerPop WHERE BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_GROCER');

UPDATE Buildings SET
FoodKept = 10,
Happiness = 0
WHERE BuildingClass = 'BUILDINGCLASS_GROCER';

INSERT INTO	 Building_Flavors
		(BuildingType,			FlavorType, 	Flavor)
SELECT	Type,	'FLAVOR_RELIGION',	5
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_GROCER';

----------------------------------
-- Public School
----------------------------------

INSERT INTO Building_GrowthExtraYield
	(BuildingType, YieldType, Yield)
SELECT
	Type, 'YIELD_SCIENCE', 25
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_PUBLIC_SCHOOL';

UPDATE Building_YieldChangesPerPop SET Yield = 25 WHERE BuildingType = 'BUILDING_PUBLIC_SCHOOL';
UPDATE Buildings SET
Cost = 850,
GoldMaintenance = 4,
SpecialistCount = 0
WHERE BuildingClass = 'BUILDINGCLASS_PUBLIC_SCHOOL';

INSERT INTO Building_ResourceYieldChanges 
	(BuildingType, ResourceType, YieldType, Yield) 
VALUES
	('BUILDING_PUBLIC_SCHOOL', 'RESOURCE_AMBER',	'YIELD_SCIENCE', 2),

	('BUILDING_PUBLIC_SCHOOL', 'RESOURCE_CITRUS', 	'YIELD_FOOD', 2),
	('BUILDING_PUBLIC_SCHOOL', 'RESOURCE_CITRUS', 	'YIELD_SCIENCE', 1),

	('BUILDING_PUBLIC_SCHOOL', 'RESOURCE_COW',  'YIELD_PRODUCTION', 1),
	('BUILDING_PUBLIC_SCHOOL', 'RESOURCE_COW',  'YIELD_SCIENCE', 1),

	('BUILDING_PUBLIC_SCHOOL', 'RESOURCE_WHEAT',  'YIELD_FOOD', 1),
	('BUILDING_PUBLIC_SCHOOL', 'RESOURCE_WHEAT',  'YIELD_SCIENCE', 1),
	('BUILDING_PUBLIC_SCHOOL', 'RESOURCE_RICE',   'YIELD_FOOD', 1),
	('BUILDING_PUBLIC_SCHOOL', 'RESOURCE_RICE',   'YIELD_SCIENCE', 1),
	('BUILDING_PUBLIC_SCHOOL', 'RESOURCE_MAIZE',  'YIELD_FOOD', 1),
	('BUILDING_PUBLIC_SCHOOL', 'RESOURCE_MAIZE',  'YIELD_SCIENCE', 1);

----------------------------------------------
-- Opera House and Gallery (rebalance)
----------------------------------------------
INSERT INTO Building_BuildingClassLocalYieldChanges
	(BuildingType, BuildingClassType, YieldType, YieldChange)
SELECT
	a.Type, b.Type, c.Type, 1
FROM Buildings a, BuildingClasses b, Yields c
WHERE 
a.BuildingClass = 'BUILDINGCLASS_GALLERY' AND
b.Type IN ('BUILDINGCLASS_EE_SALON', 'BUILDINGCLASS_EE_MENAGERIE', 'BUILDINGCLASS_EE_MANOR') AND 
c.Type IN ('YIELD_CULTURE', 'YIELD_GOLDEN_AGE_POINTS');

-- the 5% modifier is weird and we want less culture to balance all the new sources
UPDATE Buildings SET 
CultureRateModifier = 0,
Cost = 850,
GoldMaintenance = 4
WHERE BuildingClass = 'BUILDINGCLASS_OPERA_HOUSE';

INSERT INTO Building_YieldChangesPerPop (BuildingType, YieldType, Yield) VALUES
('BUILDING_OPERA_HOUSE',  'YIELD_CULTURE', 17);

UPDATE Building_YieldChanges SET Yield = 2 WHERE BuildingType = 'BUILDING_OPERA_HOUSE';  

INSERT INTO Building_ResourceYieldChanges 
	(BuildingType, ResourceType, YieldType, Yield) 
VALUES
	('BUILDING_OPERA_HOUSE', 'RESOURCE_TOBACCO',	'YIELD_CULTURE', 1),
	('BUILDING_OPERA_HOUSE', 'RESOURCE_TOBACCO',	'YIELD_GOLD', 2),

	('BUILDING_OPERA_HOUSE', 'RESOURCE_OLIVE',  	'YIELD_FOOD', 1),
	('BUILDING_OPERA_HOUSE', 'RESOURCE_OLIVE',  	'YIELD_CULTURE', 1),

	('BUILDING_OPERA_HOUSE', 'RESOURCE_TRUFFLES',   'YIELD_GOLD', 1),
	('BUILDING_OPERA_HOUSE', 'RESOURCE_TRUFFLES',  	'YIELD_TOURISM', 2),

	('BUILDING_OPERA_HOUSE', 'RESOURCE_INCENSE',   'YIELD_GOLD', 2),
	('BUILDING_OPERA_HOUSE', 'RESOURCE_INCENSE',  	'YIELD_TOURISM', 1),

	('BUILDING_OPERA_HOUSE', 'RESOURCE_WINE',		'YIELD_FOOD', 1),
	('BUILDING_OPERA_HOUSE', 'RESOURCE_WINE',		'YIELD_GOLD', 1),
	('BUILDING_OPERA_HOUSE', 'RESOURCE_WINE',		'YIELD_CULTURE', 1);

UPDATE Building_YieldChangesPerPop SET Yield = 25 WHERE BuildingType IN ('BUILDING_BROADCAST_TOWER');


------------------------------------------------
-- 4UC
------------------------------------------------
-- TODO: sort these into the correct places above

-- Schutzenstand
UPDATE Civilization_BuildingClassOverrides SET BuildingClassType = 'BUILDINGCLASS_EE_GUNSMITH' WHERE BuildingType = 'BUILDING_SCHUTZENSTAND';

UPDATE Buildings SET 
BuildingClass = 'BUILDINGCLASS_EE_GUNSMITH', 
PrereqTech = (SELECT PrereqTech FROM Buildings WHERE Type = 'BUILDING_EE_GUNSMITH'),
Cost = (SELECT Cost FROM Buildings WHERE Type = 'BUILDING_EE_GUNSMITH'),
GoldMaintenance = (SELECT GoldMaintenance FROM Buildings WHERE Type = 'BUILDING_EE_GUNSMITH'),
Defense = (SELECT Defense FROM Buildings WHERE Type = 'BUILDING_EE_GUNSMITH'),
ExtraCityHitPoints = (SELECT ExtraCityHitPoints FROM Buildings WHERE Type = 'BUILDING_EE_GUNSMITH'),
CitySupplyModifier = (SELECT CitySupplyModifier FROM Buildings WHERE Type = 'BUILDING_EE_GUNSMITH'),
CitySupplyFlat = (SELECT CitySupplyFlat FROM Buildings WHERE Type = 'BUILDING_EE_GUNSMITH') + 1,
AllowsRangeStrike = (SELECT AllowsRangeStrike FROM Buildings WHERE Type = 'BUILDING_EE_GUNSMITH'),
HealRateChange = (SELECT HealRateChange FROM Buildings WHERE Type = 'BUILDING_EE_GUNSMITH'),
CityRangedStrikeRange = (SELECT CityRangedStrikeRange FROM Buildings WHERE Type = 'BUILDING_EE_GUNSMITH'),
CityIndirectFire = (SELECT CityIndirectFire FROM Buildings WHERE Type = 'BUILDING_EE_GUNSMITH'),
EmpireSizeModifierReduction = (SELECT EmpireSizeModifierReduction FROM Buildings WHERE Type = 'BUILDING_EE_GUNSMITH'),
MinAreaSize = (SELECT MinAreaSize FROM Buildings WHERE Type = 'BUILDING_EE_GUNSMITH'),
ArtDefineTag = (SELECT ArtDefineTag FROM Buildings WHERE Type = 'BUILDING_EE_GUNSMITH'),
ConquestProb = (SELECT ConquestProb FROM Buildings WHERE Type = 'BUILDING_EE_GUNSMITH'),
NeverCapture = (SELECT NeverCapture FROM Buildings WHERE Type = 'BUILDING_EE_GUNSMITH'),
GreatWorkYieldType = (SELECT GreatWorkYieldType FROM Buildings WHERE Type = 'BUILDING_EE_GUNSMITH') 
WHERE Type = 'BUILDING_SCHUTZENSTAND';

--UPDATE Buildings SET BlockScienceTheft = '0' WHERE Type = 'BUILDING_SCHUTZENSTAND';
UPDATE Building_ClassesNeededInCity SET BuildingClassType = (SELECT BuildingClassType FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_EE_GUNSMITH') WHERE BuildingType = 'BUILDING_SCHUTZENSTAND';
UPDATE Building_Flavors SET FlavorType = 'FLAVOR_MILITARY_TRAINING' WHERE BuildingType = 'BUILDING_SCHUTZENSTAND' AND FlavorType = 'FLAVOR_CITY_DEFENSE';

UPDATE Building_UnitCombatProductionModifiers SET Modifier = '10' WHERE BuildingType = 'BUILDING_SCHUTZENSTAND';
DELETE FROM Building_UnitCombatProductionModifiers WHERE BuildingType = 'BUILDING_SCHUTZENSTAND' AND UnitCombatType != 'UNITCOMBAT_GUN';

INSERT INTO Building_DomainProductionModifiers
SELECT 'BUILDING_SCHUTZENSTAND', DomainType, Modifier + 5 FROM Building_DomainProductionModifiers
WHERE BuildingType = 'BUILDING_EE_GUNSMITH'
;

DELETE FROM Building_UnitCombatFreeExperiences WHERE BuildingType = 'BUILDING_SCHUTZENSTAND';
INSERT INTO Building_DomainFreeExperiences
SELECT 'BUILDING_SCHUTZENSTAND', DomainType, Experience + 15 FROM Building_DomainFreeExperiences
WHERE BuildingType = 'BUILDING_EE_GUNSMITH'
;

INSERT INTO Building_YieldFromUnitProduction
SELECT 'BUILDING_SCHUTZENSTAND', YieldType, Yield FROM Building_YieldFromUnitProduction
WHERE BuildingType = 'BUILDING_EE_GUNSMITH'
;

INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) SELECT
'BUILDING_SCHUTZENSTAND', YieldType, Yield + 1
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_EE_GUNSMITH' AND YieldType = 'YIELD_SCIENCE'
;

INSERT INTO Building_ResourceYieldChanges 
(BuildingType, ResourceType, YieldType, Yield) 
SELECT
'BUILDING_SCHUTZENSTAND', ResourceType, YieldType, Yield
FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_EE_GUNSMITH'
;

UPDATE Language_en_US
SET Text = '+30% [ICON_PRODUCTION] Production of Gunpowder Units, and +20% [ICON_PRODUCTION] Production to all other Land Units, which also receive additional +15 XP. +2 [ICON_WAR] Military Supply.[NEWLINE][NEWLINE]When you construct a Unit in this City, gain [ICON_RESEARCH] Science equal to 10% of the Unit''s [ICON_PRODUCTION] Production cost.[NEWLINE][NEWLINE][ICON_CITY_STATE] City-State [COLOR_CYAN]Ally[ENDCOLOR] Bonus: +1 [ICON_PRODUCTION] Production and +1 [ICON_CULTURE] Culture each.[NEWLINE][NEWLINE]Nearby [ICON_RES_IRON] Iron: +2 [ICON_PRODUCTION] Production.[NEWLINE]Nearby [ICON_RES_COAL] Coal: +1 [ICON_PRODUCTION] Production and +1 [ICON_RESEARCH] Science.'
WHERE Tag = 'TXT_KEY_BUILDING_SCHUTZENSTAND_HELP';
UPDATE Language_en_US
SET Text = 'The Schützenstand is an Austrian unique building, replacing the {TXT_KEY_BUILDING_EE_GUNSMITH}. It is cheaper than the {TXT_KEY_BUILDING_EE_GUNSMITH}, and allows for faster and better training of Land Units in the City. It also provides +1 [ICON_PRODUCTION] Production and +1 [ICON_CULTURE] Culture for every City-State you''re currently Allied with.'
WHERE Tag = 'TXT_KEY_BUILDING_SCHUTZENSTAND_STRATEGY';

------------------------------------------
-- spanish bullring
UPDATE Buildings
SET
FinishLandTRTourism = 0,
FinishSeaTRTourism = 0,
Cost = (SELECT Cost FROM Buildings WHERE Type = 'BUILDING_THEATRE'),
GoldMaintenance = (SELECT GoldMaintenance FROM Buildings WHERE Type = 'BUILDING_THEATRE')
WHERE Type = 'BUILDING_BULLRING';

INSERT INTO Building_ImprovementYieldChanges
(BuildingType, ImprovementType, YieldType, Yield)
SELECT
'BUILDING_BULLRING', 'IMPROVEMENT_CAMP', Type, 1
FROM Yields WHERE Type IN ('YIELD_CULTURE', 'YIELD_TOURISM');

UPDATE Language_en_US
SET Text = '+500 [ICON_RESEARCH] Science when completed. Nearby Jungle, Forest, Camps, and Pastures gain +1 [ICON_TOURISM] Tourism and [ICON_CULTURE] Culture.[NEWLINE][NEWLINE]Trigger a "[COLOR_POSITIVE_TEXT]We Love the King Day[ENDCOLOR]" in this city whenever it completes a [COLOR_POSITIVE_TEXT]Public Works Project[ENDCOLOR]. Gain 100 [ICON_CULTURE] Culture, [ICON_PEACE] Faith, and [ICON_GOLD] Gold whenever a "[COLOR_POSITIVE_TEXT]We Love the King Day[ENDCOLOR]" begins, Scaling with Era.[NEWLINE][NEWLINE]-1 [ICON_HAPPINESS_3] Unhappiness from [ICON_CULTURE] Boredom.'
WHERE Tag = 'TXT_KEY_BUILDING_BULLRING_HELP';

UPDATE Language_en_US
SET Text = 'The Bullring is a Spanish Unique Building that is cheaper and is available earlier than the Zoo. In addition to the Zoo''s bonuses to Camps, the Bullring gives bonuses to Pastures. Try to focus on triggering many "We Love the King Days" by connecting Resources or building Public Works in order to get additional Yields.'
WHERE Tag = 'TXT_KEY_BUILDING_BULLRING_STRATEGY';

------------------------------------------
-- moroccan riad
UPDATE Buildings SET
FinishLandTRTourism = 5,
FinishSeaTRTourism = 5,
LandmarksTourismPercent = 50,
Cost = (SELECT Cost FROM Buildings WHERE Type = 'BUILDING_HOTEL'),
GoldMaintenance = (SELECT GoldMaintenance FROM Buildings WHERE Type = 'BUILDING_HOTEL')
WHERE Type = 'BUILDING_RIAD';

INSERT INTO Building_FeatureYieldChanges
(BuildingType, FeatureType, YieldType, Yield)
SELECT
Type, 'FEATURE_OASIS', 'YIELD_TOURISM', 5
FROM Buildings WHERE Type = 'BUILDING_RIAD';

INSERT INTO Building_YieldPerXTerrainTimes100
(BuildingType, TerrainType, YieldType, Yield)
SELECT
Type, 'TERRAIN_MOUNTAIN', 'YIELD_GOLD', 100
FROM Buildings WHERE Type = 'BUILDING_RIAD';

INSERT INTO Building_YieldPerXTerrainTimes100
(BuildingType, TerrainType, YieldType, Yield)
SELECT
Type, 'TERRAIN_MOUNTAIN', 'YIELD_TOURISM', 100
FROM Buildings WHERE Type = 'BUILDING_RIAD';

INSERT INTO Building_ClassesNeededInCity 
(BuildingType, BuildingClassType)
SELECT
Type, 'BUILDINGCLASS_EE_SALON'
FROM Buildings WHERE Type = 'BUILDING_RIAD';

INSERT INTO Building_TerrainYieldChanges
(BuildingType, TerrainType, YieldType, Yield)
SELECT 
Type, 'TERRAIN_SNOW', 'YIELD_GOLD', 1
FROM Buildings WHERE Type = 'BUILDING_RIAD'
UNION ALL
SELECT 
Type, 'TERRAIN_SNOW', 'YIELD_TOURISM', 1
FROM Buildings WHERE Type = 'BUILDING_RIAD';

/*
UPDATE Language_en_US
SET Text = 'When completed, gains [ICON_GOLD] Gold and [ICON_CULTURE] Culture for every 8 Buildings and Wonders already constructed in this city. Gains +1 [ICON_GOLD] Gold and [ICON_CULTURE] Culture every Era. City gains +1 [ICON_GOLD] Gold and [ICON_TOURISM] Tourism on Snow and for every Mountain within the workable Tiles. +5 [ICON_TOURISM] Tourism from Oases worked by this City.[NEWLINE][NEWLINE]When you spend [ICON_INVEST] Gold to purchase Units or invest in Buildings in this City, 10% of the cost is converted into [ICON_TOURISM] Tourism.[NEWLINE][NEWLINE]50% of the [ICON_CULTURE] Culture from [ICON_WONDER] World Wonders and Tiles is added to the [ICON_TOURISM] Tourism output of the City. [ICON_TOURISM] Tourism output from Great Works +25%.[NEWLINE][NEWLINE]Completing a [ICON_CARAVAN]/[ICON_CARGO_SHIP] Trade Route originating here and targeting another Civilization, triggers a (or strengthens an existing) [COLOR_POSITIVE_TEXT]Historic Event[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_BUILDING_RIAD_HELP';
*/

------------------------------------------
-- Kabuki Theatre
UPDATE Buildings SET 
CultureRateModifier = 0,
Cost = (SELECT Cost FROM Buildings WHERE Type = 'BUILDING_OPERA_HOUSE'),
GoldMaintenance = (SELECT GoldMaintenance FROM Buildings WHERE Type = 'BUILDING_OPERA_HOUSE')
WHERE Type = 'BUILDING_KABUKI_THEATER';

INSERT INTO Building_YieldChangesPerPop (BuildingType, YieldType, Yield) SELECT
'BUILDING_KABUKI_THEATER',  YieldType, Yield
FROM Building_YieldChangesPerPop WHERE BuildingType = 'BUILDING_OPERA_HOUSE';

INSERT INTO Building_ResourceYieldChanges 
(BuildingType, ResourceType, YieldType, Yield) 
SELECT
'BUILDING_KABUKI_THEATER', ResourceType, YieldType, Yield
FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_OPERA_HOUSE';

UPDATE Language_en_US
SET Text = Replace(Text, '+5% [ICON_CULTURE] Culture in the City.', '+1 [ICON_CULTURE] Culture for every 5 [ICON_CITIZEN] Citizens in the City.') || '[NEWLINE][NEWLINE]Nearby [ICON_RES_CRAB] Crab: +1 [ICON_FOOD] Food, [ICON_GOLD] Gold, and [ICON_TOURISM] Tourism.[NEWLINE]Nearby [ICON_RES_WINE] Wine: +1 [ICON_FOOD] Food, [ICON_GOLD] Gold, and [ICON_CULTURE] Culture.[NEWLINE]Nearby [ICON_RES_TRUFFLES] Truffles: +1 [ICON_GOLD] Gold and +2 [ICON_TOURISM] Tourism.[NEWLINE]Nearby [ICON_RES_OLIVE] Olives: +1 [ICON_FOOD] Food and [ICON_CULTURE] Culture.[NEWLINE]Nearby [ICON_RES_MARBLE] Marble: +1 [ICON_CULTURE] Culture, [ICON_PEACE] Faith, and [ICON_TOURISM] Tourism.'
WHERE Tag = 'TXT_KEY_BUILDING_KABUKI_THEATER_HELP';

------------------------------------------
-- Beer Hall
UPDATE Civilization_BuildingClassOverrides SET BuildingClassType = 'BUILDINGCLASS_EE_TAVERN' 
WHERE BuildingType = 'BUILDING_BREWHOUSE';

UPDATE Buildings SET 
BuildingClass = 'BUILDINGCLASS_EE_TAVERN', 
PrereqTech = (SELECT PrereqTech FROM Buildings WHERE Type = 'BUILDING_EE_TAVERN'),
Cost = (SELECT Cost FROM Buildings WHERE Type = 'BUILDING_EE_TAVERN'),
GoldMaintenance = (SELECT GoldMaintenance FROM Buildings WHERE Type = 'BUILDING_EE_TAVERN'),
MinAreaSize = (SELECT MinAreaSize FROM Buildings WHERE Type = 'BUILDING_EE_TAVERN'),
ArtDefineTag = (SELECT ArtDefineTag FROM Buildings WHERE Type = 'BUILDING_EE_TAVERN'),
ConquestProb = (SELECT ConquestProb FROM Buildings WHERE Type = 'BUILDING_EE_TAVERN'),
NeverCapture = (SELECT NeverCapture FROM Buildings WHERE Type = 'BUILDING_EE_TAVERN'),
GreatWorkYieldType = (SELECT GreatWorkYieldType FROM Buildings WHERE Type = 'BUILDING_EE_TAVERN'),
BuildingProductionModifier = (SELECT BuildingProductionModifier FROM Buildings WHERE Type = 'BUILDING_EE_TAVERN')
WHERE Type = 'BUILDING_BREWHOUSE';

DELETE FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_BREWHOUSE';

--INSERT INTO Building_ClassesNeededInCity 
--(BuildingType, BuildingClassType)
--VALUES
--('BUILDING_BREWHOUSE', 'BUILDINGCLASS_HARBOR');

DELETE FROM Building_FeatureYieldChanges WHERE BuildingType = 'BUILDING_BREWHOUSE';

INSERT INTO Building_ResourceYieldChanges
(BuildingType,			ResourceType,		YieldType,		Yield)
SELECT		'BUILDING_BREWHOUSE',	ResourceType,		YieldType,		Yield
FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_EE_TAVERN';

DELETE FROM Building_BuildingClassLocalYieldChanges WHERE BuildingType = 'BUILDING_BREWHOUSE';

INSERT INTO Building_YieldFromPillage
(BuildingType, YieldType, Yield)
SELECT 'BUILDING_BREWHOUSE',YieldType,Yield
FROM Building_YieldFromPillage WHERE BuildingType = 'BUILDING_EE_TAVERN';

INSERT INTO Building_UnitCombatFreeExperiences
(BuildingType, UnitCombatType, Experience)
SELECT 'BUILDING_BREWHOUSE',UnitCombatType, Experience
FROM Building_UnitCombatFreeExperiences WHERE BuildingType = 'BUILDING_EE_TAVERN';

INSERT INTO Building_UnitCombatProductionModifiers
(BuildingType, UnitCombatType, Modifier)
SELECT 'BUILDING_BREWHOUSE', UnitCombatType, Modifier
FROM Building_UnitCombatProductionModifiers WHERE BuildingType = 'BUILDING_EE_TAVERN';

UPDATE Language_en_US
SET Text = Replace(Text, '+15% [ICON_PRODUCTION] Production when constructing Buildings. Grocers, Granaries, and Nearby [ICON_RES_WHEAT] Wheat, [ICON_RES_MAIZE] Maize, and [ICON_RES_RICE] Rice Resources produce +1 [ICON_FOOD] Food and [ICON_CULTURE] Culture. Nearby Marshes and Lakes produce +2 [ICON_PRODUCTION] Production and [ICON_GOLD] Gold.[NEWLINE][NEWLINE]+1 [ICON_HAPPINESS_1] Happiness for every 9 Policies you have adopted. Gain 10 [ICON_CULTURE] Culture in this City whenever you gift a military unit to a City-State, Scaling with Era.', 
'When a Unit [COLOR_POSITIVE_TEXT]created by this City[ENDCOLOR] [ICON_RAZING] Pillages a tile, gain 15 [ICON_GOLD] Gold and [ICON_TOURISM] Tourism, scaling with Era. +15% [ICON_PRODUCTION] Production when training [COLOR_POSITIVE_TEXT]Recon Units[ENDCOLOR], and they receive +30 XP.[NEWLINE][NEWLINE]+1 [ICON_HAPPINESS_1] Happiness for every 9 Policies you have adopted. Gain 10 [ICON_CULTURE] Culture in this City whenever you gift a military Unit to a City-State, scaling with Era.[NEWLINE][NEWLINE]Nearby [ICON_RES_FISH] Fish: +1 [ICON_FOOD] Food and [ICON_GOLD] Gold.[NEWLINE]Nearby [ICON_RES_CRAB] Crab: +1 [ICON_FOOD] Food, [ICON_GOLD] Gold, and [ICON_TOURISM] Tourism.[NEWLINE]Nearby [ICON_RES_WHALE] Whales: +2 [ICON_GOLD] Gold and +1 [ICON_RESEARCH] Science.')
WHERE Tag = 'TXT_KEY_BUILDING_BREWHOUSE_HELP';

UPDATE Language_en_US
SET Text = 'The Brewhouse is the unique German replacement for the Tavern, which does not require the Harbor (and therefore a Coastal City). In addition to the standard bonuses of a Tavern, the Brewhouse provides bonuses to Happiness, which grow stronger with the number of Policies you have adopted. Each Brewhouse on Empire provides an instant boost of Culture whenever you gift a Military Unit to a City-State. The Brewhouse'' rewards for policy adoption and unit gifting both get stronger after you adopt an Ideology, with different yield bonuses depending on what Ideology you adopt. Prioritize culture via allying with City-States in order to increase the power of your Bräuhauser.'
WHERE Tag = 'TXT_KEY_BUILDING_BREWHOUSE_STRATEGY';

------------------------------------------
-- Qila to Bastion Fort
UPDATE Civilization_BuildingClassOverrides SET BuildingClassType = 'BUILDINGCLASS_BASTION_FORT' 
WHERE BuildingType = 'BUILDING_MUGHAL_FORT';

UPDATE Buildings SET 
BuildingClass = 'BUILDINGCLASS_BASTION_FORT',
CitySupplyModifier = 5, 
CitySupplyFlat = 1,
GreatWorkSlotType = NULL,
GreatWorkCount = 0,
Cost = (SELECT Cost FROM Buildings WHERE Type = 'BUILDING_BASTION_FORT'),
GoldMaintenance = (SELECT GoldMaintenance FROM Buildings WHERE Type = 'BUILDING_BASTION_FORT'),
HealRateChange = 5,
Defense = 1000,
ExtraCityHitPoints = 0,
PrereqTech = 'TECH_NAVIGATION',
CityIndirectFire = 1
WHERE Type = 'BUILDING_MUGHAL_FORT';

UPDATE Building_ClassesNeededInCity SET BuildingClassType = 'BUILDINGCLASS_CASTLE' WHERE BuildingType = 'BUILDING_MUGHAL_FORT';
DELETE FROM Building_ImprovementYieldChanges WHERE BuildingType = 'BUILDING_MUGHAL_FORT';
DELETE FROM Building_BuildingClassLocalYieldChanges WHERE BuildingType = 'BUILDING_MUGHAL_FORT';  -- for subterfuge

DELETE FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_MUGHAL_FORT';
INSERT INTO Building_YieldChanges
(BuildingType, YieldType, Yield)
SELECT
'BUILDING_MUGHAL_FORT', 'YIELD_TOURISM', 2;

DELETE FROM Building_GreatPersonProgressFromConstruction WHERE BuildingType = 'BUILDING_MUGHAL_FORT';
INSERT INTO Building_GreatPersonProgressFromConstruction
(BuildingType, GreatPersonType, EraType, Value)
SELECT
'BUILDING_MUGHAL_FORT', 'GREATPERSON_ARTIST', 'ERA_ANCIENT', 2;

UPDATE Language_en_US SET
Text = 'The Qila is the unique Indian replacement for the Bastion Fort. In addition to the normal bonuses of the Fort, the City gains additional health and also increased Defense for every National or World Wonder. Your most magnificent cities also become more difficult to capture. Further, the Qila generates Culture and Great Artist Points, with more coming from your more developed Cities.'
WHERE Tag = 'TXT_KEY_BUILDING_MUGHAL_FORT_STRATEGY';

UPDATE Language_en_US SET
Text = 'Damage from all sources against this City is reduced by 2. +1 [ICON_WAR] Military Supply, and +5% [ICON_SILVER_FIST] Military Supply from Population. Allows City to [ICON_RANGE_STRENGTH] Strike over obstacles.[NEWLINE][NEWLINE]Garrisoned Units receive an additional 5 Health when healing in this City.[NEWLINE][NEWLINE]+1 [ICON_STRENGTH] City Strength for every 2 National or [ICON_WONDER] World Wonders built in this City. 20% of [ICON_STRENGTH] City Defense is converted to [ICON_CULTURE] Culture very turn. When you complete a building gain 2% progress towards a [ICON_GREAT_ARTIST] Great Artist.[NEWLINE][NEWLINE][ICON_CITY_STATE] Empire Size Modifier is reduced by 5% in this City.'
WHERE Tag = 'TXT_KEY_BUILDING_MUGHAL_FORT_HELP';



