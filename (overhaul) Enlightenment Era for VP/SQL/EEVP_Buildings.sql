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
('BUILDING_EE_MENAGERIE',  'TECH_EE_EXPLORATION','THEATRE',  5,'ENLIGHTENMENT_BUILDING_ATLAS'),  -- has to be this early to be on prereq for zoo
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
('BUILDING_EE_CLOTH_MILL', 'BUILDINGCLASS_WORKSHOP'),
('BUILDING_EE_WEIGH_HOUSE', 'BUILDINGCLASS_BANK'),
('BUILDING_EE_ACADEMY', 'BUILDINGCLASS_UNIVERSITY'),
('BUILDING_EE_SEMINARY', 'BUILDINGCLASS_UNIVERSITY'),
('BUILDING_EE_ACADEMY', 'BUILDINGCLASS_ARMORY'),
('BUILDING_EE_SEMINARY', 'BUILDINGCLASS_TEMPLE'),
('BUILDING_EE_SALON', 'BUILDINGCLASS_MINT'),
('BUILDING_EE_MANOR', 'BUILDINGCLASS_GARDEN');

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
	('BUILDING_EE_MENAGERIE', 'RESOURCE_HORSE',    'YIELD_PRODUCTION', 1),
	('BUILDING_EE_MENAGERIE', 'RESOURCE_HORSE',    'YIELD_CULTURE', 1),

	('BUILDING_EE_MENAGERIE', 'RESOURCE_CORAL',	'YIELD_SCIENCE', 1),
	('BUILDING_EE_MENAGERIE', 'RESOURCE_CORAL',	'YIELD_CULTURE', 1),

	('BUILDING_EE_MENAGERIE', 'RESOURCE_WHALE',	'YIELD_SCIENCE', 2),

	('BUILDING_EE_MENAGERIE', 'RESOURCE_BANANA', 'YIELD_GOLD', 2),
	('BUILDING_EE_MENAGERIE', 'RESOURCE_BANANA', 'YIELD_TOURISM', 1),

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
	('BUILDING_EE_ACADEMY', 'SPECIALIST_ENGINEER', 20),
	('BUILDING_EE_ACADEMY', 'SPECIALIST_MERCHANT', 20),
	('BUILDING_EE_ACADEMY', 'SPECIALIST_CIVIL_SERVANT', 20);

INSERT INTO Building_YieldChangesPerPop 
	(BuildingType, YieldType, Yield) 
VALUES
	('BUILDING_EE_ACADEMY', 'YIELD_SCIENCE', 17),
	('BUILDING_EE_SEMINARY', 'YIELD_FAITH', 17);

UPDATE Buildings SET
ExtraMissionaryStrengthGlobal = 5
WHERE Type = 'BUILDING_EE_SEMINARY';

INSERT INTO Building_YieldFromTech
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_EE_SEMINARY', 'YIELD_GOLDEN_AGE_POINTS', 20),
	('BUILDING_EE_SEMINARY', 'YIELD_FAITH', 10),
	('BUILDING_EE_SEMINARY', 'YIELD_SCIENCE', 20),
	('BUILDING_EE_SEMINARY', 'YIELD_GREAT_GENERAL_POINTS', 10);

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
	('BUILDING_EE_SALON', 'RESOURCE_CITRUS', 	'YIELD_FOOD', 2),
	('BUILDING_EE_SALON', 'RESOURCE_CITRUS', 	'YIELD_SCIENCE', 1),

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
SpecialistType = 'SPECIALIST_MERCHANT', SpecialistCount = 1, 
TradeRouteRecipientBonus = 1, TradeRouteTargetBonus = 2, 
FreeStartEra = 'ERA_FUTURE'
WHERE Type = 'BUILDING_EE_WEIGH_HOUSE';

UPDATE Buildings
SET PovertyFlatReduction = 1, SpecialistType = 'SPECIALIST_ENGINEER', SpecialistCount = 1
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
UPDATE Buildings SET PrereqTech = 'TECH_EE_FORTIFICATION' WHERE BuildingClass = 'BUILDINGCLASS_FORTRESS'; -- Includes Ostrog (BUILDING_KREPOST)
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
	('BUILDING_EE_TAVERN', 'RESOURCE_COW',  'YIELD_GOLD', 1),
	('BUILDING_EE_TAVERN', 'RESOURCE_COW',  'YIELD_TOURISM', 1),

	('BUILDING_EE_TAVERN', 'RESOURCE_FISH',  'YIELD_FOOD', 1),
	('BUILDING_EE_TAVERN', 'RESOURCE_FISH',  'YIELD_GOLD', 1),

	('BUILDING_EE_TAVERN', 'RESOURCE_WHEAT',  'YIELD_GOLD', 2),
	('BUILDING_EE_TAVERN', 'RESOURCE_RICE',   'YIELD_GOLD', 2),
	('BUILDING_EE_TAVERN', 'RESOURCE_MAIZE',  'YIELD_GOLD', 2);

----------------------------------------------
-- Manor
-- Hokath: This is mostly for resources like cafe
----------------------------------------------

UPDATE Buildings SET 
Happiness = 1
WHERE Type = 'BUILDING_EE_MANOR';

INSERT INTO Building_YieldFromBorderGrowth (BuildingType, YieldType, Yield)
SELECT 'BUILDING_EE_MANOR', 'YIELD_GOLDEN_AGE_POINTS', 20;

INSERT INTO Building_LakePlotYieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_EE_MANOR', 'YIELD_GOLD', 2),
	('BUILDING_EE_MANOR', 'YIELD_TOURISM', 1);

INSERT INTO Building_ImprovementYieldChanges
	(BuildingType, ImprovementType, YieldType, Yield)
VALUES
	('BUILDING_EE_MANOR', 'IMPROVEMENT_TRADING_POST', 'YIELD_PRODUCTION', 1),
	('BUILDING_EE_MANOR', 'IMPROVEMENT_TRADING_POST', 'YIELD_GOLDEN_AGE_POINTS', 1);	

INSERT INTO Building_ResourceYieldChanges 
	(BuildingType, ResourceType, YieldType, Yield) 
VALUES
	('BUILDING_EE_MANOR', 'RESOURCE_JADE',		'YIELD_CULTURE', 1),
	('BUILDING_EE_MANOR', 'RESOURCE_JADE',		'YIELD_GOLDEN_AGE_POINTS', 2),

	('BUILDING_EE_MANOR', 'RESOURCE_AMBER',		'YIELD_CULTURE', 1),
	('BUILDING_EE_MANOR', 'RESOURCE_AMBER',		'YIELD_FAITH', 1),

	('BUILDING_EE_MANOR', 'RESOURCE_INCENSE',	'YIELD_FAITH', 2),

	('BUILDING_EE_MANOR', 'RESOURCE_PEARLS',	'YIELD_CULTURE', 1),
	('BUILDING_EE_MANOR', 'RESOURCE_PEARLS',	'YIELD_TOURISM', 1),

	('BUILDING_EE_MANOR', 'RESOURCE_LAPIS',		'YIELD_CULTURE', 1),
	('BUILDING_EE_MANOR', 'RESOURCE_LAPIS',		'YIELD_FAITH', 1),
	('BUILDING_EE_MANOR', 'RESOURCE_LAPIS',		'YIELD_GOLDEN_AGE_POINTS', 1),

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

----------------------------------------------
-- Japan's UA
----------------------------------------------

INSERT INTO Trait_BuildingClassYieldChanges
		(TraitType, BuildingClassType, YieldType, YieldChange)
SELECT DISTINCT bcyc.TraitType, bc.Type, bcyc.YieldType, bcyc.YieldChange
FROM BuildingClasses bc, Trait_BuildingClassYieldChanges bcyc
WHERE bc.Type IN('BUILDINGCLASS_EE_GUNSMITH', 'BUILDINGCLASS_EE_DRYDOCK') AND bcyc.TraitType = 'TRAIT_FIGHT_WELL_DAMAGED';

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

-- public school
UPDATE Buildings SET
Cost = 850,
GoldMaintenance = 4
WHERE BuildingClass = 'BUILDINGCLASS_PUBLIC_SCHOOL';

-- grocer (apothecary)
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
	('BUILDING_OPERA_HOUSE', 'RESOURCE_MARBLE',	'YIELD_CULTURE', 1),
	('BUILDING_OPERA_HOUSE', 'RESOURCE_MARBLE',	'YIELD_FAITH', 1),
	('BUILDING_OPERA_HOUSE', 'RESOURCE_MARBLE',	'YIELD_TOURISM', 1),

	('BUILDING_OPERA_HOUSE', 'RESOURCE_OLIVE',  	'YIELD_FOOD', 1),
	('BUILDING_OPERA_HOUSE', 'RESOURCE_OLIVE',  	'YIELD_CULTURE', 1),

	('BUILDING_OPERA_HOUSE', 'RESOURCE_TRUFFLES',   'YIELD_GOLD', 1),
	('BUILDING_OPERA_HOUSE', 'RESOURCE_TRUFFLES',  	'YIELD_TOURISM', 2),

	('BUILDING_OPERA_HOUSE', 'RESOURCE_CRAB',       'YIELD_FOOD', 1),
	('BUILDING_OPERA_HOUSE', 'RESOURCE_CRAB',       'YIELD_GOLD', 1),
	('BUILDING_OPERA_HOUSE', 'RESOURCE_CRAB',       'YIELD_TOURISM', 1),

	('BUILDING_OPERA_HOUSE', 'RESOURCE_WINE',		'YIELD_FOOD', 1),
	('BUILDING_OPERA_HOUSE', 'RESOURCE_WINE',		'YIELD_GOLD', 1),
	('BUILDING_OPERA_HOUSE', 'RESOURCE_WINE',		'YIELD_CULTURE', 1);

UPDATE Building_YieldChangesPerPop SET Yield = 25 WHERE BuildingType IN ('BUILDING_BROADCAST_TOWER');

----------------------------------
-- Public School
----------------------------------

INSERT INTO Building_GrowthExtraYield
	(BuildingType, YieldType, Yield)
SELECT
	Type, 'YIELD_SCIENCE', 25
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_PUBLIC_SCHOOL';

UPDATE Building_YieldChangesPerPop SET Yield = 25 WHERE BuildingType = 'BUILDING_PUBLIC_SCHOOL';






