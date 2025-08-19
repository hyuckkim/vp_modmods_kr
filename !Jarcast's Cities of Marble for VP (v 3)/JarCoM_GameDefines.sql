--=======================================================================================================================
-- Building_FreeBuildingClassFoundedCity
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS Building_FreeBuildingClassFoundedCity (
	BuildingType text,
	BuildingClassType text,
	FOREIGN KEY (BuildingType) REFERENCES Buildings(Type),
	FOREIGN KEY (BuildingClassType) REFERENCES BuildingClasses(Type)
);
--=======================================================================================================================
-- CustomModOptions
--=======================================================================================================================
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'GLOBAL_CITY_AUTOMATON_WORKERS';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'BUILDINGS_CITY_AUTOMATON_WORKERS';
--=======================================================================================================================
-- ART DEFINES
--=======================================================================================================================
-- Icon Atlases
-------------------------------------------------------------------------------------------------------------------------	
INSERT INTO IconTextureAtlases 
(Atlas, 						IconSize, 	Filename, 					IconsPerRow, 	IconsPerColumn) VALUES
('JAR_NATWON_ATLAS', 			256, 		'JarCoM_Atlas_256.dds',		4, 				4),
('JAR_NATWON_ATLAS', 			128, 		'JarCoM_Atlas_128.dds',		4, 				4),
('JAR_NATWON_ATLAS', 			80, 		'JarCoM_Atlas_80.dds',		4, 				4),
('JAR_NATWON_ATLAS', 			64, 		'JarCoM_Atlas_64.dds',		4, 				4),
('JAR_NATWON_ATLAS', 			45, 		'JarCoM_Atlas_45.dds',		4, 				4);
--======================================================================================================================
-- NEW BUILDINGS
--======================================================================================================================
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO BuildingClasses
(DefaultBuilding, 			Type,							Description) VALUES
('BUILDING_JAR_DURUNTASH',	'BUILDINGCLASS_JAR_DURUNTASH',	'TXT_KEY_BUILDING_JAR_DURUNTASH'),
('BUILDING_JAR_WATERWORKS',	'BUILDINGCLASS_JAR_WATERWORKS',	'TXT_KEY_BUILDING_JAR_WATERWORKS'),
('BUILDING_JAR_JOUSTING',	'BUILDINGCLASS_JAR_JOUSTING',	'TXT_KEY_BUILDING_JAR_JOUSTING'),
('BUILDING_JAR_DIPLOMIS',	'BUILDINGCLASS_JAR_DIPLOMIS',	'TXT_KEY_BUILDING_JAR_DIPLOMIS'),
('BUILDING_JAR_NATTHEATRE',	'BUILDINGCLASS_JAR_NATTHEATRE',	'TXT_KEY_BUILDING_JAR_NATTHEATRE'),
('BUILDING_JAR_NATAQUARIUM','BUILDINGCLASS_JAR_NATAQUARIUM','TXT_KEY_BUILDING_JAR_NATAQUARIUM'),
('BUILDING_JAR_NATSTADIUM',	'BUILDINGCLASS_JAR_NATSTADIUM',	'TXT_KEY_BUILDING_JAR_NATSTADIUM'),
('BUILDING_JAR_POLYTECHNIC','BUILDINGCLASS_JAR_POLYTECHNIC','TXT_KEY_BUILDING_JAR_POLYTECHNIC'),
('BUILDING_JAR_GWAYSTATION','BUILDINGCLASS_JAR_GWAYSTATION','TXT_KEY_BUILDING_JAR_GWAYSTATION'),
('BUILDING_JAR_CENTRALBANK','BUILDINGCLASS_JAR_CENTRALBANK','TXT_KEY_BUILDING_JAR_CENTRALBANK'),
('BUILDING_JAR_STATEARCHIVES','BUILDINGCLASS_JAR_STATEARCHIVES','TXT_KEY_BUILDING_JAR_STATEARCHIVES'),
('BUILDING_JAR_INDUSTRYCONFED','BUILDINGCLASS_JAR_INDUSTRYCONFED','TXT_KEY_BUILDING_JAR_INDUSTRYCONFED'),
('BUILDING_JAR_CONCERT_HALL','BUILDINGCLASS_JAR_CONCERT_HALL','TXT_KEY_BUILDING_JAR_CONCERT_HALL');

UPDATE BuildingClasses SET MaxPlayerInstances=1 WHERE Type IN
('BUILDINGCLASS_JAR_DURUNTASH', 'BUILDINGCLASS_JAR_WATERWORKS', 'BUILDINGCLASS_JAR_JOUSTING','BUILDINGCLASS_JAR_DIPLOMIS', 
'BUILDINGCLASS_JAR_NATTHEATRE', 'BUILDINGCLASS_JAR_NATAQUARIUM', 'BUILDINGCLASS_JAR_NATSTADIUM','BUILDINGCLASS_JAR_POLYTECHNIC', 
'BUILDINGCLASS_JAR_GWAYSTATION', 'BUILDINGCLASS_JAR_CENTRALBANK', 'BUILDINGCLASS_JAR_STATEARCHIVES','BUILDINGCLASS_JAR_INDUSTRYCONFED','BUILDINGCLASS_JAR_CONCERT_HALL');

INSERT OR REPLACE INTO Buildings
		(Type, 						BuildingClass, 					PrereqTech, 		Cost,	 Description, 						Civilopedia, 							Strategy, 									Help, 									MinAreaSize, ConquestProb, ArtDefineTag, IconAtlas, 			PortraitIndex)
SELECT	'BUILDING_JAR_DURUNTASH',	'BUILDINGCLASS_JAR_DURUNTASH',	'TECH_AGRICULTURE',	110,	'TXT_KEY_BUILDING_JAR_DURUNTASH',	'TXT_KEY_BUILDING_JAR_DURUNTASH_PEDIA',	'TXT_KEY_BUILDING_JAR_DURUNTASH_STRATEGY',	'TXT_KEY_BUILDING_JAR_DURUNTASH_HELP',	MinAreaSize, ConquestProb, ArtDefineTag, 'JAR_NATWON_ATLAS', 0 FROM Buildings WHERE Type='BUILDING_SHRINE' UNION ALL
SELECT	'BUILDING_JAR_WATERWORKS',	'BUILDINGCLASS_JAR_WATERWORKS',	'TECH_POTTERY',		110,	'TXT_KEY_BUILDING_JAR_WATERWORKS',	'TXT_KEY_BUILDING_JAR_WATERWORKS_PEDIA',	'TXT_KEY_BUILDING_JAR_WATERWORKS_STRATEGY',	'TXT_KEY_BUILDING_JAR_WATERWORKS_HELP',	MinAreaSize, ConquestProb, ArtDefineTag, 'JAR_NATWON_ATLAS', 1 FROM Buildings WHERE Type='BUILDING_SHRINE' UNION ALL
SELECT	'BUILDING_JAR_JOUSTING',	'BUILDINGCLASS_JAR_JOUSTING',	'TECH_AGRICULTURE',	110,	'TXT_KEY_BUILDING_JAR_JOUSTING',	'TXT_KEY_BUILDING_JAR_JOUSTING_PEDIA',	'TXT_KEY_BUILDING_JAR_JOUSTING_STRATEGY',	'TXT_KEY_BUILDING_JAR_JOUSTING_HELP',	MinAreaSize, ConquestProb, ArtDefineTag, 'JAR_NATWON_ATLAS', 2 FROM Buildings WHERE Type='BUILDING_ARMORY' UNION ALL
SELECT	'BUILDING_JAR_DIPLOMIS',	'BUILDINGCLASS_JAR_DIPLOMIS',	'TECH_AGRICULTURE',	110,	'TXT_KEY_BUILDING_JAR_DIPLOMIS',	'TXT_KEY_BUILDING_JAR_DIPLOMIS_PEDIA',	'TXT_KEY_BUILDING_JAR_DIPLOMIS_STRATEGY',	'TXT_KEY_BUILDING_JAR_DIPLOMIS_HELP',	MinAreaSize, ConquestProb, ArtDefineTag, 'JAR_NATWON_ATLAS', 3 FROM Buildings WHERE Type='BUILDING_CONSTABLE' UNION ALL
SELECT	'BUILDING_JAR_NATTHEATRE',	'BUILDINGCLASS_JAR_NATTHEATRE',	'TECH_PRINTING_PRESS',	110,	'TXT_KEY_BUILDING_JAR_NATTHEATRE',	'TXT_KEY_BUILDING_JAR_NATTHEATRE_PEDIA',	'TXT_KEY_BUILDING_JAR_NATTHEATRE_STRATEGY',	'TXT_KEY_BUILDING_JAR_NATTHEATRE_HELP',	MinAreaSize, ConquestProb, ArtDefineTag, 'JAR_NATWON_ATLAS', 4 FROM Buildings WHERE Type='BUILDING_AMPHITHEATER' UNION ALL
SELECT	'BUILDING_JAR_NATAQUARIUM',	'BUILDINGCLASS_JAR_NATAQUARIUM','TECH_AGRICULTURE',	110,	'TXT_KEY_BUILDING_JAR_NATAQUARIUM',	'TXT_KEY_BUILDING_JAR_NATAQUARIUM_PEDIA',	'TXT_KEY_BUILDING_JAR_NATAQUARIUM_STRATEGY',	'TXT_KEY_BUILDING_JAR_NATAQUARIUM_HELP',MinAreaSize, ConquestProb, ArtDefineTag, 'JAR_NATWON_ATLAS', 5 FROM Buildings WHERE Type='BUILDING_THEATRE' UNION ALL
SELECT	'BUILDING_JAR_NATSTADIUM',	'BUILDINGCLASS_JAR_NATSTADIUM',	'TECH_AGRICULTURE',	110,	'TXT_KEY_BUILDING_JAR_NATSTADIUM',	'TXT_KEY_BUILDING_JAR_NATSTADIUM_PEDIA',	'TXT_KEY_BUILDING_JAR_NATSTADIUM_STRATEGY',	'TXT_KEY_BUILDING_JAR_NATSTADIUM_HELP',	MinAreaSize, ConquestProb, ArtDefineTag, 'JAR_NATWON_ATLAS', 6 FROM Buildings WHERE Type='BUILDING_STADIUM' UNION ALL
SELECT	'BUILDING_JAR_POLYTECHNIC',	'BUILDINGCLASS_JAR_POLYTECHNIC','TECH_AGRICULTURE',	110,	'TXT_KEY_BUILDING_JAR_POLYTECHNIC',	'TXT_KEY_BUILDING_JAR_POLYTECHNIC_PEDIA',	'TXT_KEY_BUILDING_JAR_POLYTECHNIC_STRATEGY',	'TXT_KEY_BUILDING_JAR_POLYTECHNIC_HELP',MinAreaSize, ConquestProb, ArtDefineTag, 'JAR_NATWON_ATLAS', 7 FROM Buildings WHERE Type='BUILDING_PUBLIC_SCHOOL' UNION ALL
SELECT	'BUILDING_JAR_GWAYSTATION',	'BUILDINGCLASS_JAR_GWAYSTATION','TECH_AGRICULTURE',	110,	'TXT_KEY_BUILDING_JAR_GWAYSTATION',	'TXT_KEY_BUILDING_JAR_GWAYSTATION_PEDIA',	'TXT_KEY_BUILDING_JAR_GWAYSTATION_STRATEGY',	'TXT_KEY_BUILDING_JAR_GWAYSTATION_HELP',MinAreaSize, ConquestProb, ArtDefineTag, 'JAR_NATWON_ATLAS', 8 FROM Buildings WHERE Type='BUILDING_CARAVANSARY' UNION ALL
SELECT	'BUILDING_JAR_CENTRALBANK',	'BUILDINGCLASS_JAR_CENTRALBANK','TECH_AGRICULTURE',	110,	'TXT_KEY_BUILDING_JAR_CENTRALBANK',	'TXT_KEY_BUILDING_JAR_CENTRALBANK_PEDIA',	'TXT_KEY_BUILDING_JAR_CENTRALBANK_STRATEGY',	'TXT_KEY_BUILDING_JAR_CENTRALBANK_HELP',MinAreaSize, ConquestProb, ArtDefineTag, 'JAR_NATWON_ATLAS', 9 FROM Buildings WHERE Type='BUILDING_BANK' UNION ALL
SELECT	'BUILDING_JAR_STATEARCHIVES',	'BUILDINGCLASS_JAR_STATEARCHIVES','TECH_AGRICULTURE',	110,	'TXT_KEY_BUILDING_JAR_STATEARCHIVES',	'TXT_KEY_BUILDING_JAR_STATEARCHIVES_PEDIA',	'TXT_KEY_BUILDING_JAR_STATEARCHIVES_STRATEGY',	'TXT_KEY_BUILDING_JAR_STATEARCHIVES_HELP',MinAreaSize, ConquestProb, ArtDefineTag, 'JAR_NATWON_ATLAS', 10 FROM Buildings WHERE Type='BUILDING_MUSEUM' UNION ALL
SELECT	'BUILDING_JAR_INDUSTRYCONFED',	'BUILDINGCLASS_JAR_INDUSTRYCONFED','TECH_AGRICULTURE',	110,	'TXT_KEY_BUILDING_JAR_INDUSTRYCONFED',	'TXT_KEY_BUILDING_JAR_INDUSTRYCONFED_PEDIA',	'TXT_KEY_BUILDING_JAR_INDUSTRYCONFED_STRATEGY',	'TXT_KEY_BUILDING_JAR_INDUSTRYCONFED_HELP',MinAreaSize, ConquestProb, ArtDefineTag, 'JAR_NATWON_ATLAS', 11 FROM Buildings WHERE Type='BUILDING_FACTORY' UNION ALL
SELECT	'BUILDING_JAR_CONCERT_HALL',	'BUILDINGCLASS_JAR_CONCERT_HALL','TECH_AGRICULTURE',	110,	'TXT_KEY_BUILDING_JAR_CONCERT_HALL',	'TXT_KEY_BUILDING_JAR_CONCERT_HALL_PEDIA',	'TXT_KEY_BUILDING_JAR_CONCERT_HALL_STRATEGY',	'TXT_KEY_BUILDING_JAR_CONCERT_HALL_HELP',MinAreaSize, ConquestProb, ArtDefineTag, 'JAR_NATWON_ATLAS', 12 FROM Buildings WHERE Type='BUILDING_OPERA_HOUSE';

UPDATE Buildings SET NationalPopRequired = 5, NeverCapture=1, Cost = 70,
NumCityCostMod = (SELECT NumCityCostMod FROM Buildings WHERE Type = 'BUILDING_NATIONAL_COLLEGE'),
HurryCostModifier = (SELECT HurryCostModifier FROM Buildings WHERE Type = 'BUILDING_NATIONAL_EPIC')
WHERE Type IN ('BUILDING_JAR_DURUNTASH', 'BUILDING_JAR_WATERWORKS');

UPDATE Buildings SET NeverCapture=1, UnitUpgradeCostMod= -15, CitySupplyFlat = 2,
NumCityCostMod = (SELECT NumCityCostMod FROM Buildings WHERE Type = 'BUILDING_NATIONAL_COLLEGE'),
Cost = (SELECT Cost FROM Buildings WHERE Type = 'BUILDING_OXFORD_UNIVERSITY'),
PrereqTech = (SELECT PrereqTech FROM Buildings WHERE Type = 'BUILDING_ARMORY'),
NationalPopRequired = (SELECT NationalPopRequired FROM Buildings WHERE Type = 'BUILDING_OXFORD_UNIVERSITY'),
HurryCostModifier = (SELECT HurryCostModifier FROM Buildings WHERE Type = 'BUILDING_OXFORD_UNIVERSITY')
WHERE Type ='BUILDING_JAR_JOUSTING';

UPDATE Buildings SET SingleLeagueVotes=2, ExtraSpies=1, NeverCapture=1,
SpecialistType='SPECIALIST_CIVIL_SERVANT', GreatPeopleRateChange=1, SpecialistCount = 1,
NumCityCostMod = (SELECT NumCityCostMod FROM Buildings WHERE Type = 'BUILDING_PRINTING_PRESS'),
Cost = (SELECT Cost FROM Buildings WHERE Type = 'BUILDING_PRINTING_PRESS'),
PrereqTech = (SELECT PrereqTech FROM Buildings WHERE Type = 'BUILDING_CONSTABLE'),
NationalPopRequired = (SELECT NationalPopRequired FROM Buildings WHERE Type = 'BUILDING_PRINTING_PRESS'),
HurryCostModifier = (SELECT HurryCostModifier FROM Buildings WHERE Type = 'BUILDING_PRINTING_PRESS')
WHERE Type ='BUILDING_JAR_DIPLOMIS';

UPDATE Buildings SET NeverCapture=1, SpecialistType='SPECIALIST_WRITER', GreatPeopleRateChange=3,
NumCityCostMod = (SELECT NumCityCostMod FROM Buildings WHERE Type = 'BUILDING_PRINTING_PRESS'),
Cost = (SELECT Cost FROM Buildings WHERE Type = 'BUILDING_PRINTING_PRESS'),
NationalPopRequired = (SELECT NationalPopRequired FROM Buildings WHERE Type = 'BUILDING_PRINTING_PRESS'),
HurryCostModifier = (SELECT HurryCostModifier FROM Buildings WHERE Type = 'BUILDING_PRINTING_PRESS')
WHERE Type ='BUILDING_JAR_NATTHEATRE';

UPDATE Buildings SET NeverCapture=1,
NumCityCostMod = (SELECT NumCityCostMod FROM Buildings WHERE Type = 'BUILDING_PRINTING_PRESS'),
Cost = (SELECT round(Cost*1.1) FROM Buildings WHERE Type = 'BUILDING_HERMITAGE'), NationalPopRequired = 40,
PrereqTech = (SELECT PrereqTech FROM Buildings WHERE Type = 'BUILDING_THEATRE'),
HurryCostModifier = (SELECT HurryCostModifier FROM Buildings WHERE Type = 'BUILDING_PRINTING_PRESS')
WHERE Type ='BUILDING_JAR_NATAQUARIUM';

UPDATE Buildings SET NeverCapture=1, SpecialistType='SPECIALIST_SCIENTIST', GreatPeopleRateChange=3,
NumCityCostMod = (SELECT NumCityCostMod FROM Buildings WHERE Type = 'BUILDING_FOREIGN_OFFICE'),
Cost = (SELECT round(Cost*1.1) FROM Buildings WHERE Type = 'BUILDING_HERMITAGE'), NationalPopRequired = 40,
PrereqTech = (SELECT PrereqTech FROM Buildings WHERE Type = 'BUILDING_PUBLIC_SCHOOL'),
HurryCostModifier = (SELECT HurryCostModifier FROM Buildings WHERE Type = 'BUILDING_FOREIGN_OFFICE')
WHERE Type ='BUILDING_JAR_POLYTECHNIC';

UPDATE Buildings SET NeverCapture=1, GoldenAge=1, GoldenAgeModifier=25,
NumCityCostMod = (SELECT NumCityCostMod FROM Buildings WHERE Type = 'BUILDING_FOREIGN_OFFICE'),
Cost = 850, NationalPopRequired = 45,
PrereqTech = (SELECT PrereqTech FROM Buildings WHERE Type = 'BUILDING_STADIUM'),
HurryCostModifier = (SELECT HurryCostModifier FROM Buildings WHERE Type = 'BUILDING_FOREIGN_OFFICE')
WHERE Type ='BUILDING_JAR_NATSTADIUM';

UPDATE Buildings SET Defense=200 WHERE Type='BUILDING_JAR_DURUNTASH';
UPDATE Buildings SET FoodKept= 10 WHERE Type='BUILDING_JAR_WATERWORKS';
-------------------------------------------------------------------------------------------------------
UPDATE Buildings SET NeverCapture=1, NumCityCostMod = (SELECT NumCityCostMod FROM Buildings WHERE Type = 'BUILDING_NATIONAL_COLLEGE'),
Cost = (SELECT Cost FROM Buildings WHERE Type = 'BUILDING_NATIONAL_COLLEGE'),
PrereqTech = (SELECT PrereqTech FROM Buildings WHERE Type = 'BUILDING_CARAVANSARY'),
NationalPopRequired = (SELECT NationalPopRequired FROM Buildings WHERE Type = 'BUILDING_NATIONAL_COLLEGE'),
HurryCostModifier = (SELECT HurryCostModifier FROM Buildings WHERE Type = 'BUILDING_NATIONAL_COLLEGE'),
SpecialistType= 'SPECIALIST_MERCHANT', SpecialistCount = 1
WHERE Type ='BUILDING_JAR_GWAYSTATION';

UPDATE Buildings SET Cost = 320, NeverCapture=1, NumCityCostMod = (SELECT NumCityCostMod FROM Buildings WHERE Type = 'BUILDING_PRINTING_PRESS'),
PrereqTech = 'TECH_ECONOMICS', NationalPopRequired = (SELECT NationalPopRequired FROM Buildings WHERE Type = 'BUILDING_PRINTING_PRESS'),
HurryCostModifier = (SELECT HurryCostModifier FROM Buildings WHERE Type = 'BUILDING_PRINTING_PRESS'), 
SpecialistType= 'SPECIALIST_MERCHANT',  SpecialistCount = 1, GreatPeopleRateChange = 1
WHERE Type = 'BUILDING_JAR_CENTRALBANK';

UPDATE Buildings SET Cost = 650, NeverCapture=1,
NumCityCostMod = (SELECT NumCityCostMod FROM Buildings WHERE Type = 'BUILDING_PRINTING_PRESS'),
PrereqTech = (SELECT PrereqTech FROM Buildings WHERE Type = 'BUILDING_MUSEUM'),
NationalPopRequired = (SELECT NationalPopRequired FROM Buildings WHERE Type = 'BUILDING_PRINTING_PRESS'),
HurryCostModifier = (SELECT HurryCostModifier FROM Buildings WHERE Type = 'BUILDING_PRINTING_PRESS'), 
SpecialistType='SPECIALIST_CIVIL_SERVANT', SpecialistCount = 1, GreatPeopleRateChange = 1
WHERE Type = 'BUILDING_JAR_STATEARCHIVES';

UPDATE Buildings SET Cost = 700, NeverCapture=1, PrereqTech = 'TECH_CORPORATIONS',
NumCityCostMod = (SELECT NumCityCostMod FROM Buildings WHERE Type = 'BUILDING_FOREIGN_OFFICE'),
NationalPopRequired = (SELECT NationalPopRequired FROM Buildings WHERE Type = 'BUILDING_FOREIGN_OFFICE'),
HurryCostModifier = (SELECT HurryCostModifier FROM Buildings WHERE Type = 'BUILDING_FOREIGN_OFFICE'),
GlobalCityAutomatonWorkersChange = 1, FreeBuilding = 'BUILDINGCLASS_DUMMY_INDUSTRYCONFED'
WHERE Type = 'BUILDING_JAR_INDUSTRYCONFED';

INSERT OR REPLACE INTO BuildingClasses
(DefaultBuilding, 					Type,									Description) VALUES	
('BUILDING_DUMMY_INDUSTRYCONFED',	'BUILDINGCLASS_DUMMY_INDUSTRYCONFED',	'TXT_KEY_BUILDING_DUMMY_INDUSTRYCONFED');

INSERT OR REPLACE INTO Buildings
(Type, 								BuildingClass, 							IsDummy,	Cost,	FaithCost,	GreatWorkCount,	PrereqTech,	MinAreaSize,	Description) VALUES	
('BUILDING_DUMMY_INDUSTRYCONFED', 	'BUILDINGCLASS_DUMMY_INDUSTRYCONFED',	1,			-1,		-1,			-1,				null,		-1,				'TXT_KEY_BUILDING_DUMMY_INDUSTRYCONFED');
UPDATE Buildings SET NearbyTerrainRequired = 'TERRAIN_SNOW' WHERE Type = 'BUILDING_DUMMY_INDUSTRYCONFED';

INSERT INTO Building_TerrainYieldChanges 
		(BuildingType,						TerrainType,		YieldType,		Yield) 
VALUES	('BUILDING_DUMMY_INDUSTRYCONFED',	'TERRAIN_SNOW',		'YIELD_PRODUCTION',	2);

UPDATE Buildings SET NeverCapture=1, NumCityCostMod = (SELECT NumCityCostMod FROM Buildings WHERE Type = 'BUILDING_HERMITAGE'),
PrereqTech = (SELECT PrereqTech FROM Buildings WHERE Type = 'BUILDING_OPERA_HOUSE'),
Cost = (SELECT Cost FROM Buildings WHERE Type = 'BUILDING_HERMITAGE'),
NationalPopRequired = (SELECT NationalPopRequired FROM Buildings WHERE Type = 'BUILDING_HERMITAGE'),
HurryCostModifier = (SELECT HurryCostModifier FROM Buildings WHERE Type = 'BUILDING_HERMITAGE'),
GreatWorkSlotType = 'GREAT_WORK_SLOT_MUSIC', GreatWorkCount = 3, ThemingBonusHelp = 'TXT_KEY_THEMING_BONUS_CONCERT_HALL_HELP',
SpecialistType = 'SPECIALIST_MUSICIAN', SpecialistCount = 1, GreatPeopleRateChange = 3, FreeBuilding = 'BUILDINGCLASS_DUMMY_CONCERT_HALL'
WHERE Type = 'BUILDING_JAR_CONCERT_HALL';

INSERT OR REPLACE INTO BuildingClasses
(DefaultBuilding, 				Type,								Description) VALUES	
('BUILDING_DUMMY_CONCERT_HALL',	'BUILDINGCLASS_DUMMY_CONCERT_HALL',	'TXT_KEY_BUILDING_DUMMY_CONCERT_HALL');

INSERT OR REPLACE INTO Buildings
(Type, 								BuildingClass, 							IsDummy,	Cost,	FaithCost,	GreatWorkCount,	PrereqTech,	MinAreaSize,	Description) VALUES	
('BUILDING_DUMMY_CONCERT_HALL', 	'BUILDINGCLASS_DUMMY_CONCERT_HALL',	1,		-1,		-1,			-1,				null,		-1,				'TXT_KEY_BUILDING_DUMMY_CONCERT_HALL');
		
INSERT INTO Building_GoldenAgeYieldMod
		(BuildingType, 							YieldType, 			Yield)
VALUES	('BUILDINGCLASS_DUMMY_CONCERT_HALL', 	'YIELD_TOURISM', 		10);
------------------------------------------------------------------------------------------------------------------------
-- Building_Flavors
------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO Building_Flavors
(BuildingType,						FlavorType,			Flavor)
SELECT	'BUILDING_JAR_DURUNTASH',	'FLAVOR_CITY_DEFENSE',	10 UNION ALL
SELECT	'BUILDING_JAR_DURUNTASH',	'FLAVOR_RELIGION',	50 UNION ALL
SELECT	'BUILDING_JAR_WATERWORKS',	'FLAVOR_GROWTH',	50 UNION ALL
SELECT	'BUILDING_JAR_WATERWORKS',	'FLAVOR_EXPANSION',	15 UNION ALL
SELECT	'BUILDING_JAR_JOUSTING',	'FLAVOR_MILITARY_TRAINING',	50 UNION ALL
SELECT	'BUILDING_JAR_JOUSTING',	'FLAVOR_OFFENSE',	10 UNION ALL
SELECT	'BUILDING_JAR_JOUSTING',	'FLAVOR_DEFENSE',	10 UNION ALL
SELECT	'BUILDING_JAR_JOUSTING',	'FLAVOR_GOLD',		10 UNION ALL
SELECT	'BUILDING_JAR_DIPLOMIS',	'FLAVOR_DIPLOMACY',	10 UNION ALL
SELECT	'BUILDING_JAR_DIPLOMIS',	'FLAVOR_ESPIONAGE',		10 UNION ALL
SELECT	'BUILDING_JAR_DIPLOMIS',	'FLAVOR_GREAT_PEOPLE',	10 UNION ALL
SELECT	'BUILDING_JAR_NATTHEATRE',	'FLAVOR_CULTURE',		10 UNION ALL
SELECT	'BUILDING_JAR_NATTHEATRE',	'FLAVOR_GREAT_PEOPLE',	10 UNION ALL
SELECT	'BUILDING_JAR_NATAQUARIUM',	'FLAVOR_SCIENCE',		10 UNION ALL
SELECT	'BUILDING_JAR_NATAQUARIUM',	'FLAVOR_HAPPINESS',		50 UNION ALL
SELECT	'BUILDING_JAR_POLYTECHNIC',	'FLAVOR_SCIENCE',		30 UNION ALL
SELECT	'BUILDING_JAR_POLYTECHNIC',	'FLAVOR_GREAT_PEOPLE',	10 UNION ALL
SELECT	'BUILDING_JAR_NATSTADIUM',	'FLAVOR_HAPPINESS',		50 UNION ALL
SELECT	'BUILDING_JAR_GWAYSTATION',	'FLAVOR_GOLD',			30 UNION ALL
SELECT	'BUILDING_JAR_GWAYSTATION',	'FLAVOR_I_TRADE_ORIGIN',10 UNION ALL
SELECT	'BUILDING_JAR_GWAYSTATION',	'FLAVOR_I_LAND_TRADE_ROUTE',10 UNION ALL
SELECT	'BUILDING_JAR_GWAYSTATION',	'FLAVOR_I_SEA_TRADE_ROUTE', 10 UNION ALL
SELECT	'BUILDING_JAR_GWAYSTATION',	'FLAVOR_CULTURE',		10 UNION ALL
SELECT	'BUILDING_JAR_GWAYSTATION',	'FLAVOR_GROWTH',		10 UNION ALL
SELECT	'BUILDING_JAR_CENTRALBANK',	'FLAVOR_GOLD',			30 UNION ALL
SELECT	'BUILDING_JAR_CENTRALBANK',	'FLAVOR_PRODUCTION',	30 UNION ALL
SELECT	'BUILDING_JAR_STATEARCHIVES',	'FLAVOR_SCIENCE',	60 UNION ALL
SELECT	'BUILDING_JAR_STATEARCHIVES',	'FLAVOR_CULTURE',	30 UNION ALL
SELECT	'BUILDING_JAR_STATEARCHIVES',	'FLAVOR_DIPLOMACY',	20 UNION ALL
SELECT	'BUILDING_JAR_INDUSTRYCONFED',	'FLAVOR_PRODUCTION',60 UNION ALL
SELECT	'BUILDING_JAR_INDUSTRYCONFED',	'FLAVOR_INFRASTRUCTURE',40 UNION ALL
SELECT	'BUILDING_JAR_INDUSTRYCONFED',	'FLAVOR_GROWTH',	50 UNION ALL
SELECT	'BUILDING_JAR_INDUSTRYCONFED',	'FLAVOR_GOLD',		30 UNION ALL
SELECT	'BUILDING_JAR_CONCERT_HALL',	'FLAVOR_CULTURE',	60 UNION ALL
SELECT	'BUILDING_JAR_CONCERT_HALL',	'FLAVOR_HAPPINESS',	30;
------------------------------------------------------------------------------------------------------------------------
-- Building_ClassesNeededInCity
------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO Building_ClassesNeededInCity
(BuildingType, 				BuildingClassType) VALUES
('BUILDING_JAR_DURUNTASH', 	'BUILDINGCLASS_SHRINE'),
('BUILDING_JAR_JOUSTING', 	'BUILDINGCLASS_ARMORY'),
('BUILDING_JAR_DIPLOMIS', 	'BUILDINGCLASS_CONSTABLE'),
('BUILDING_JAR_NATTHEATRE', 'BUILDINGCLASS_AMPHITHEATER'),
('BUILDING_JAR_NATAQUARIUM', 'BUILDINGCLASS_THEATRE'),
('BUILDING_JAR_NATSTADIUM', 'BUILDINGCLASS_STADIUM'),
('BUILDING_JAR_POLYTECHNIC', 'BUILDINGCLASS_PUBLIC_SCHOOL'),
('BUILDING_JAR_WATERWORKS', 'BUILDINGCLASS_GRANARY'),
('BUILDING_JAR_GWAYSTATION', 'BUILDINGCLASS_CARAVANSARY'),
('BUILDING_JAR_CENTRALBANK', 'BUILDINGCLASS_BANK'),
('BUILDING_JAR_STATEARCHIVES', 'BUILDINGCLASS_MUSEUM'),
('BUILDING_JAR_INDUSTRYCONFED', 'BUILDINGCLASS_FACTORY'),
('BUILDING_JAR_CONCERT_HALL', 'BUILDINGCLASS_OPERA_HOUSE');
------------------------------------------------------------------------------------------------------------------------
-- Building_ThemingBonuses
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_ThemingBonuses 
		(BuildingType,					Description,							Bonus,	RequiresOwner,	AIPriority)
VALUES	('BUILDING_JAR_CONCERT_HALL',	'TXT_KEY_THEMING_BONUS_CONCERT_HALL',	20,		1,				2);
------------------------------------------------------------------------------------------------------------------------
-- Building_ThemingYieldBonus
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_ThemingYieldBonus
		(BuildingType, 					YieldType, Yield)
VALUES	('BUILDING_JAR_CONCERT_HALL', 'YIELD_CULTURE', 5),
		('BUILDING_JAR_CONCERT_HALL', 'YIELD_GOLDEN_AGE_POINTS', 5);
------------------------------------------------------------------------------------------------------------------------
-- Building_YieldChanges
------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO Building_YieldChanges
(BuildingType, 				YieldType, 			Yield) VALUES
('BUILDING_JAR_DURUNTASH', 	'YIELD_FAITH', 		4),
('BUILDING_JAR_WATERWORKS', 'YIELD_FOOD', 		4),
('BUILDING_JAR_JOUSTING', 	'YIELD_GREAT_GENERAL_POINTS', 2),
('BUILDING_JAR_DIPLOMIS', 	'YIELD_CULTURE', 	2),
('BUILDING_JAR_NATTHEATRE', 'YIELD_CULTURE', 	4),
('BUILDING_JAR_NATTHEATRE', 'YIELD_GOLDEN_AGE_POINTS', 	2),
('BUILDING_JAR_NATAQUARIUM', 'YIELD_CULTURE', 	1),
('BUILDING_JAR_NATAQUARIUM', 'YIELD_SCIENCE', 	1), --+
('BUILDING_JAR_NATAQUARIUM', 'YIELD_TOURISM', 	3), --+
('BUILDING_JAR_NATSTADIUM', 'YIELD_CULTURE', 	1),
('BUILDING_JAR_NATSTADIUM', 'YIELD_TOURISM', 	3), --+
('BUILDING_JAR_POLYTECHNIC', 'YIELD_CULTURE', 	1),
('BUILDING_JAR_GWAYSTATION', 'YIELD_GOLD', 		5),
('BUILDING_JAR_CENTRALBANK', 'YIELD_GOLD', 		5),
('BUILDING_JAR_CENTRALBANK', 'YIELD_SCIENCE', 	3),
('BUILDING_JAR_STATEARCHIVES', 'YIELD_SCIENCE', 3),
('BUILDING_JAR_STATEARCHIVES', 'YIELD_CULTURE', 3),
('BUILDING_JAR_CONCERT_HALL', 'YIELD_CULTURE', 	5),
('BUILDING_JAR_CONCERT_HALL', 'YIELD_TOURISM', 	2);
------------------------------------------------------------------------------------------------------------------------
-- Building_BuildingClassYieldChanges
------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO Building_BuildingClassYieldChanges
(BuildingType, 				BuildingClassType,		YieldType, 	YieldChange) VALUES
('BUILDING_JAR_DURUNTASH',	'BUILDINGCLASS_SHRINE','YIELD_CULTURE_LOCAL',	1),
('BUILDING_JAR_WATERWORKS',	'BUILDINGCLASS_GRANARY','YIELD_PRODUCTION',		1),
('BUILDING_JAR_WATERWORKS',	'BUILDINGCLASS_GRANARY','YIELD_FOOD',			1),
('BUILDING_JAR_JOUSTING',	'BUILDINGCLASS_BARRACKS','YIELD_CULTURE',		1),
('BUILDING_JAR_JOUSTING',	'BUILDINGCLASS_ARMORY',	'YIELD_CULTURE',		1),
('BUILDING_JAR_NATTHEATRE',	'BUILDINGCLASS_AMPHITHEATER','YIELD_SCIENCE',	1),
('BUILDING_JAR_NATTHEATRE',	'BUILDINGCLASS_AMPHITHEATER','YIELD_GOLDEN_AGE_POINTS',	1),
('BUILDING_JAR_NATAQUARIUM','BUILDINGCLASS_THEATRE','YIELD_SCIENCE',		2), --+
('BUILDING_JAR_POLYTECHNIC','BUILDINGCLASS_UNIVERSITY','YIELD_PRODUCTION',	2), --+
('BUILDING_JAR_GWAYSTATION','BUILDINGCLASS_MARKET','YIELD_FOOD',	1),
('BUILDING_JAR_GWAYSTATION','BUILDINGCLASS_MARKET','YIELD_PRODUCTION',	1),
('BUILDING_JAR_GWAYSTATION','BUILDINGCLASS_MARKET','YIELD_CULTURE_LOCAL',	1),
('BUILDING_JAR_GWAYSTATION','BUILDINGCLASS_CARAVANSARY','YIELD_FOOD',	1),
('BUILDING_JAR_GWAYSTATION','BUILDINGCLASS_CARAVANSARY','YIELD_PRODUCTION',	1),
('BUILDING_JAR_GWAYSTATION','BUILDINGCLASS_CARAVANSARY','YIELD_CULTURE_LOCAL',	1),
('BUILDING_JAR_CENTRALBANK','BUILDINGCLASS_BANK','YIELD_GOLD',	2),
('BUILDING_JAR_CENTRALBANK','BUILDINGCLASS_BANK','YIELD_CULTURE',	2),
('BUILDING_JAR_CONCERT_HALL','BUILDINGCLASS_OPERA_HOUSE','YIELD_TOURISM',	2);
------------------------------------------------------------------------------------------------------------------------
-- Building_BuildingClassYieldModifiers
------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO Building_BuildingClassYieldModifiers
(BuildingType, 					BuildingClassType,		YieldType, 	Modifier) VALUES
('BUILDING_JAR_INDUSTRYCONFED',	'BUILDINGCLASS_FACTORY','YIELD_GOLD',	5),
('BUILDING_JAR_INDUSTRYCONFED',	'BUILDINGCLASS_FACTORY','YIELD_FOOD',	5);
------------------------------------------------------------------------------------------------------------------------
-- Building_YieldFromGPExpend
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldFromGPExpend
(BuildingType,				YieldType,			Yield) VALUES
('BUILDING_JAR_NATTHEATRE',	'YIELD_CULTURE',	25);
------------------------------------------------------------------------------------------------------------------------
-- Building_YieldChangesFromPassingTR
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldChangesFromPassingTR
(BuildingType,					YieldType,			Yield) VALUES
('BUILDING_JAR_GWAYSTATION',	'YIELD_GOLD',		1),
('BUILDING_JAR_GWAYSTATION',	'YIELD_CULTURE',	1),
('BUILDING_JAR_GWAYSTATION',	'YIELD_SCIENCE',	1);
------------------------------------------------------------------------------------------------------------------------
-- Building_YieldFromYieldPercentGlobal
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldFromYieldPercentGlobal
(BuildingType, 					YieldIn, 				YieldOut, 		Value) VALUES
('BUILDING_JAR_STATEARCHIVES', 	'YIELD_SCIENCE', 		'YIELD_TOURISM', 5),
('BUILDING_JAR_NATAQUARIUM', 	'YIELD_SCIENCE', 		'YIELD_GOLDEN_AGE_POINTS', 5),
('BUILDING_JAR_POLYTECHNIC', 	'YIELD_PRODUCTION', 	'YIELD_SCIENCE', 5),
('BUILDING_JAR_CENTRALBANK', 	'YIELD_GOLD', 			'YIELD_PRODUCTION', 5);
------------------------------------------------------------------------------------------------------------------------
-- Building_SpecialistYieldChanges
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_SpecialistYieldChanges (BuildingType, SpecialistType, YieldType, Yield)
SELECT 'BUILDING_JAR_GWAYSTATION', 'SPECIALIST_MERCHANT', 'YIELD_FOOD', 1 UNION ALL
SELECT 'BUILDING_JAR_GWAYSTATION', 'SPECIALIST_MERCHANT', 'YIELD_CULTURE', 1 UNION ALL
SELECT 'BUILDING_JAR_CENTRALBANK', 'SPECIALIST_MERCHANT', 'YIELD_PRODUCTION', 1 UNION ALL
SELECT 'BUILDING_JAR_CENTRALBANK', 'SPECIALIST_MERCHANT', 'YIELD_SCIENCE', 1;
------------------------------------------------------------------------------------------------------------------------
-- Building_GreatWorkYieldChanges
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_GreatWorkYieldChanges
		(BuildingType, YieldType, Yield)
VALUES	('BUILDING_JAR_STATEARCHIVES', 'YIELD_SCIENCE', 1),
		('BUILDING_JAR_CONCERT_HALL', 'YIELD_GOLDEN_AGE_POINTS', 1);
------------------------------------------------------------------------------------------------------------------------
-- Building_YieldFromPolicyUnlock
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldFromPolicyUnlock
		(BuildingType, 				YieldType, Yield)
SELECT	'BUILDING_JAR_STATEARCHIVES', 'YIELD_SCIENCE', 75;
------------------------------------------------------------------------------------------------------------------------
-- Building_ResourceQuantity
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_ResourceQuantity
		(BuildingType, ResourceType, Quantity)
VALUES	('BUILDING_JAR_INDUSTRYCONFED', 'RESOURCE_COAL', 2);
------------------------------------------------------------------------------------------------------------------------
-- Building_FreeBuildingClassFoundedCity
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_FreeBuildingClassFoundedCity
		(BuildingType,		BuildingClassType)
SELECT 	Type, 				'BUILDINGCLASS_WALLS' FROM Buildings WHERE BuildingClass='BUILDINGCLASS_COURT_SCRIBE' UNION ALL
SELECT 	Type, 				'BUILDINGCLASS_BARRACKS' FROM Buildings WHERE BuildingClass='BUILDINGCLASS_HEROIC_EPIC' UNION ALL
SELECT 	Type, 				'BUILDINGCLASS_MONUMENT' FROM Buildings WHERE BuildingClass='BUILDINGCLASS_NATIONAL_EPIC' UNION ALL
SELECT 	Type, 				'BUILDINGCLASS_LIBRARY' FROM Buildings WHERE BuildingClass='BUILDINGCLASS_NATIONAL_COLLEGE' UNION ALL
SELECT 	Type, 				'BUILDINGCLASS_COLOSSEUM' FROM Buildings WHERE BuildingClass='BUILDINGCLASS_CIRCUS_MAXIMUS' UNION ALL
SELECT 	Type, 				'BUILDINGCLASS_WORKSHOP' FROM Buildings WHERE BuildingClass='BUILDINGCLASS_IRONWORKS' UNION ALL
SELECT 	Type, 				'BUILDINGCLASS_UNIVERSITY' FROM Buildings WHERE BuildingClass='BUILDINGCLASS_OXFORD_UNIVERSITY' UNION ALL
SELECT 	Type, 				'BUILDINGCLASS_GALLERY' FROM Buildings WHERE BuildingClass='BUILDINGCLASS_HERMITAGE' UNION ALL
SELECT 	Type, 				'BUILDINGCLASS_CHANCERY' FROM Buildings WHERE BuildingClass='BUILDINGCLASS_PRINTING_PRESS' UNION ALL
SELECT 	Type, 				'BUILDINGCLASS_WIRE_SERVICE' FROM Buildings WHERE BuildingClass='BUILDINGCLASS_FOREIGN_OFFICE' UNION ALL
SELECT 	Type, 				'BUILDINGCLASS_MINT' FROM Buildings WHERE BuildingClass='BUILDINGCLASS_NATIONAL_TREASURY' UNION ALL
SELECT 	Type, 				'BUILDINGCLASS_TEMPLE' FROM Buildings WHERE BuildingClass='BUILDINGCLASS_GRAND_TEMPLE' AND Type != 'BUILDING_LEUGI_JERUSALEM_TEMPLE' UNION ALL
SELECT 	Type, 				'BUILDINGCLASS_POLICE_STATION' FROM Buildings WHERE BuildingClass='BUILDINGCLASS_INTELLIGENCE_AGENCY' UNION ALL
SELECT 	Type, 				'BUILDINGCLASS_HARBOR' FROM Buildings WHERE BuildingClass='BUILDINGCLASS_FA_SEA_ACADEMY' AND EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_FA_SEA_ACADEMY')  UNION ALL
SELECT 	Type, 				'BUILDINGCLASS_CASTLE' FROM Buildings WHERE BuildingClass='BUILDINGCLASS_FA_WAR_ACADEMY' AND EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_FA_WAR_ACADEMY')  UNION ALL
SELECT 	Type, 				'BUILDINGCLASS_MILITARY_ACADEMY' FROM Buildings WHERE BuildingClass='BUILDINGCLASS_FA_AIR_ACADEMY' AND EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_FA_AIR_ACADEMY')  UNION ALL
SELECT 	Type, 				'BUILDINGCLASS_EE_MANOR' FROM Buildings WHERE BuildingClass='BUILDINGCLASS_EE_SUMMER_PALACE' AND EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_EE_SUMMER_PALACE')  UNION ALL
SELECT 	'BUILDING_JAR_DIPLOMIS', 	'BUILDINGCLASS_CONSTABLE' UNION ALL
SELECT 	'BUILDING_JAR_NATTHEATRE', 	'BUILDINGCLASS_AMPHITHEATER' UNION ALL
SELECT 	'BUILDING_JAR_JOUSTING', 	'BUILDINGCLASS_ARMORY' UNION ALL
SELECT 	'BUILDING_JAR_NATAQUARIUM', 'BUILDINGCLASS_CIRCUS' UNION ALL
SELECT 	'BUILDING_JAR_NATSTADIUM', 	'BUILDINGCLASS_THEATRE' UNION ALL
SELECT 	'BUILDING_JAR_POLYTECHNIC',	'BUILDINGCLASS_PUBLIC_SCHOOL' UNION ALL
SELECT 	'BUILDING_JAR_GWAYSTATION', 'BUILDINGCLASS_CARAVANSARY' UNION ALL
SELECT 	'BUILDING_JAR_CENTRALBANK', 'BUILDINGCLASS_BANK' UNION ALL
SELECT 	'BUILDING_JAR_STATEARCHIVES', 'BUILDINGCLASS_MUSEUM' UNION ALL
SELECT 	'BUILDING_JAR_INDUSTRYCONFED', 'BUILDINGCLASS_FACTORY' UNION ALL
SELECT 	'BUILDING_JAR_CONCERT_HALL', 'BUILDINGCLASS_OPERA_HOUSE';
--======================================================================================================================
-- LEGALISM POLICY compatibility
--======================================================================================================================
INSERT INTO Policy_BuildingClassHappiness
		(PolicyType, BuildingClassType, Happiness)
SELECT	'POLICY_LEGALISM', Type, 1					FROM BuildingClasses WHERE Type IN 
('BUILDINGCLASS_JAR_DURUNTASH', 'BUILDINGCLASS_JAR_WATERWORKS', 'BUILDINGCLASS_JAR_JOUSTING','BUILDINGCLASS_JAR_DIPLOMIS', 
'BUILDINGCLASS_JAR_NATTHEATRE', 'BUILDINGCLASS_JAR_NATAQUARIUM', 'BUILDINGCLASS_JAR_NATSTADIUM','BUILDINGCLASS_JAR_POLYTECHNIC', 
'BUILDINGCLASS_JAR_GWAYSTATION', 'BUILDINGCLASS_JAR_CENTRALBANK', 'BUILDINGCLASS_JAR_STATEARCHIVES','BUILDINGCLASS_JAR_INDUSTRYCONFED','BUILDINGCLASS_JAR_CONCERT_HALL');

INSERT INTO Policy_BuildingClassProductionModifiers
		(PolicyType, BuildingClassType, ProductionModifier)
SELECT	'POLICY_LEGALISM', Type, 25					FROM BuildingClasses WHERE Type IN 
('BUILDINGCLASS_JAR_DURUNTASH', 'BUILDINGCLASS_JAR_WATERWORKS', 'BUILDINGCLASS_JAR_JOUSTING','BUILDINGCLASS_JAR_DIPLOMIS', 
'BUILDINGCLASS_JAR_NATTHEATRE', 'BUILDINGCLASS_JAR_NATAQUARIUM', 'BUILDINGCLASS_JAR_NATSTADIUM','BUILDINGCLASS_JAR_POLYTECHNIC', 
'BUILDINGCLASS_JAR_GWAYSTATION', 'BUILDINGCLASS_JAR_CENTRALBANK', 'BUILDINGCLASS_JAR_STATEARCHIVES','BUILDINGCLASS_JAR_INDUSTRYCONFED','BUILDINGCLASS_JAR_CONCERT_HALL');
--======================================================================================================================
-- Language_en_US
--======================================================================================================================
UPDATE Language_en_US SET Text = Text||' [NEWLINE]Newly founded Cities start with [COLOR_POSITIVE_TEXT]{TXT_KEY_BUILDING_BARRACKS}[ENDCOLOR].'
WHERE Tag IN (SELECT Help FROM Buildings WHERE BuildingClass='BUILDINGCLASS_HEROIC_EPIC');
UPDATE Language_en_US SET Text = Text||' [NEWLINE]Newly founded Cities start with a [COLOR_POSITIVE_TEXT]{TXT_KEY_BUILDING_MONUMENT_DESC}[ENDCOLOR].'
WHERE Tag IN (SELECT Help FROM Buildings WHERE BuildingClass='BUILDINGCLASS_NATIONAL_EPIC');
UPDATE Language_en_US SET Text = Text||' [NEWLINE]Newly founded Cities start with a [COLOR_POSITIVE_TEXT]{TXT_KEY_BUILDING_LIBRARY}[ENDCOLOR].'
WHERE Tag IN (SELECT Help FROM Buildings WHERE BuildingClass='BUILDINGCLASS_NATIONAL_COLLEGE');
UPDATE Language_en_US SET Text = Text||' [NEWLINE]Newly founded Cities start with an [COLOR_POSITIVE_TEXT]{TXT_KEY_BUILDING_COLOSSEUM}[ENDCOLOR].'
WHERE Tag IN (SELECT Help FROM Buildings WHERE BuildingClass='BUILDINGCLASS_CIRCUS_MAXIMUS');
UPDATE Language_en_US SET Text = Text||' [NEWLINE]Newly founded Cities start with a [COLOR_POSITIVE_TEXT]{TXT_KEY_BUILDING_WORKSHOP}[ENDCOLOR].'
WHERE Tag IN (SELECT Help FROM Buildings WHERE BuildingClass='BUILDINGCLASS_IRONWORKS');
UPDATE Language_en_US SET Text = Text||' [NEWLINE]Newly founded Cities start with a [COLOR_POSITIVE_TEXT]{TXT_KEY_BUILDING_EE_MANOR}[ENDCOLOR].'
WHERE Tag IN (SELECT Help FROM Buildings WHERE BuildingClass='BUILDINGCLASS_EE_SUMMER_PALACE')
AND EXISTS (SELECT * FROM Buildings WHERE Type='BUILDING_EE_MANOR');
UPDATE Language_en_US SET Text = Text||' [NEWLINE]Newly founded Cities start with a [COLOR_POSITIVE_TEXT]{TXT_KEY_BUILDING_UNIVERSITY}[ENDCOLOR].'
WHERE Tag IN (SELECT Help FROM Buildings WHERE BuildingClass='BUILDINGCLASS_OXFORD_UNIVERSITY');
UPDATE Language_en_US SET Text = Text||' [NEWLINE]Newly founded Cities start with a [COLOR_POSITIVE_TEXT]{TXT_KEY_BUILDING_GALLERY}[ENDCOLOR].'
WHERE Tag IN (SELECT Help FROM Buildings WHERE BuildingClass='BUILDINGCLASS_HERMITAGE');
UPDATE Language_en_US SET Text = Text||' [NEWLINE]Newly founded Cities start with a [COLOR_POSITIVE_TEXT]{TXT_KEY_BUILDING_CHANCERY}[ENDCOLOR].'
WHERE Tag IN (SELECT Help FROM Buildings WHERE BuildingClass='BUILDINGCLASS_PRINTING_PRESS');
UPDATE Language_en_US SET Text = Text||' [NEWLINE]Newly founded Cities start with a [COLOR_POSITIVE_TEXT]{TXT_KEY_BUILDING_WIRE_SERVICE}[ENDCOLOR].'
WHERE Tag IN (SELECT Help FROM Buildings WHERE BuildingClass='BUILDINGCLASS_FOREIGN_OFFICE');
UPDATE Language_en_US SET Text = Text||' [NEWLINE]Newly founded Cities start with a [COLOR_POSITIVE_TEXT]{TXT_KEY_BUILDING_MINT}[ENDCOLOR].'
WHERE Tag IN (SELECT Help FROM Buildings WHERE BuildingClass='BUILDINGCLASS_NATIONAL_TREASURY');
UPDATE Language_en_US SET Text = Text||' [NEWLINE]Newly founded Cities start with a [COLOR_POSITIVE_TEXT]{TXT_KEY_BUILDING_TEMPLE_DESC}[ENDCOLOR].'
WHERE Tag IN (SELECT Help FROM Buildings WHERE BuildingClass='BUILDINGCLASS_GRAND_TEMPLE' AND Type != 'BUILDING_LEUGI_JERUSALEM_TEMPLE');
UPDATE Language_en_US SET Text = Text||' [NEWLINE]Newly founded Cities start with a [COLOR_POSITIVE_TEXT]{TXT_KEY_BUILDING_POLICE_STATION}[ENDCOLOR].'
WHERE Tag IN (SELECT Help FROM Buildings WHERE BuildingClass='BUILDINGCLASS_INTELLIGENCE_AGENCY');
UPDATE Language_en_US SET Text = Text||' [NEWLINE]Newly founded Cities start with a [COLOR_POSITIVE_TEXT]Harbor[ENDCOLOR].'
WHERE Tag IN (SELECT Help FROM Buildings WHERE BuildingClass='BUILDINGCLASS_FA_SEA_ACADEMY')
 AND EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_FA_SEA_ACADEMY');
UPDATE Language_en_US SET Text = Text||' [NEWLINE]Newly founded Cities start with [COLOR_POSITIVE_TEXT]Castle[ENDCOLOR].'
WHERE Tag IN (SELECT Help FROM Buildings WHERE BuildingClass='BUILDINGCLASS_FA_WAR_ACADEMY')
 AND EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_FA_WAR_ACADEMY');
UPDATE Language_en_US SET Text = Text||' [NEWLINE]Newly founded Cities start with [COLOR_POSITIVE_TEXT]Military Academy[ENDCOLOR].'
WHERE Tag IN (SELECT Help FROM Buildings WHERE BuildingClass='BUILDINGCLASS_FA_AIR_ACADEMY')
 AND EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_FA_AIR_ACADEMY');
UPDATE Language_en_US SET Text = Text||' [NEWLINE]Newly founded Cities start with [COLOR_POSITIVE_TEXT]Walls[ENDCOLOR].'
WHERE Tag IN (SELECT Help FROM Buildings WHERE BuildingClass='BUILDINGCLASS_COURT_SCRIBE');
 
INSERT OR REPLACE INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_BUILDING_JAR_DURUNTASH', 'Dur Untash'),	
('TXT_KEY_BUILDING_JAR_DURUNTASH_PEDIA', 'Dur Untash, also known as Chogha Zanbil, is an ancient Elamite complex located near Susa in modern-day Iran. Constructed around 1250 BCE by the king Untash-Napirisha, Dur Untash stands as a remarkable testament to the architectural and engineering prowess of the Elamite civilization. The complex is primarily composed of a massive ziggurat, dedicated to the god Inshushinak, and is surrounded by a well-planned city with residential areas, temples, and other structures. Despite its grandeur, Dur Untash was abandoned relatively soon after its completion, possibly due to political instability and the fall of the Elamite civilization. The site was rediscovered in the 19th century and in 1979 it was recognized as a UNESCO World Heritage site, providing valuable insights into the ancient Elamite culture and its religious practices. [NEWLINE][NEWLINE]Dur Untash''s ziggurat is an outstanding example of Elamite architecture, featuring a unique design with square terraces and a cylindrical core. The construction involved the use of mud bricks and baked bricks, and the ziggurat once soared to a height of about 52 meters. The site''s archaeological significance extends beyond its architectural marvels, as it also contains inscriptions and artifacts that offer glimpses into the religious beliefs and rituals of the Elamite people. Despite the site''s historical importance, Dur Untash faces challenges such as environmental decay and the need for preservation efforts to ensure its continued existence as a valuable cultural heritage site.'),	
('TXT_KEY_BUILDING_JAR_DURUNTASH_STRATEGY', 'Constructing this building is crucial to found a religion faster. A City must have a {TXT_KEY_BUILDING_SHRINE} before it can construct the {TXT_KEY_BUILDING_JAR_DURUNTASH}.'),	
('TXT_KEY_BUILDING_JAR_DURUNTASH_HELP', 'All Shrines gain +1 [ICON_CULTURE_LOCAL] Border Growth. [NEWLINE][NEWLINE]The [ICON_PRODUCTION] Production Cost and [ICON_CITIZEN] Population Requirements increase based on the number of Cities you own.'),	
('TXT_KEY_BUILDING_JAR_WATERWORKS', 'Waterworks'),	
('TXT_KEY_BUILDING_JAR_WATERWORKS_PEDIA', 'The origins of sanitation and waterworks can be traced back to ancient civilizations that recognized the vital importance of clean water and effective waste management. One of the earliest examples is found in the ancient Indus Valley Civilization (circa 3300–1300 BCE), where urban centers like Mohenjo-daro featured an advanced urban planning system that included a sophisticated network of brick-lined sewers. Homes in these cities were equipped with private bathrooms and toilets, connected to a comprehensive sewage system that reflected a high level of understanding regarding the necessity of sanitation for public health. The Indus people''s emphasis on maintaining clean and efficient water systems is a testament to their early recognition of the connection between hygiene and overall well-being. [NEWLINE][NEWLINE]In ancient Mesopotamia, the Sumerians developed innovative water management practices, constructing canals and irrigation systems to harness the waters of the Tigris and Euphrates rivers for agricultural purposes. The Code of Hammurabi, dating back to around 1754 BCE, even contained regulations related to water usage and sanitation. Meanwhile, the ancient Egyptians demonstrated a profound understanding of water control through the construction of canals, reservoirs, and drainage systems, particularly along the Nile River. These early efforts laid the groundwork for subsequent civilizations to refine and expand upon the principles of sanitation and waterworks, ultimately shaping the evolution of urban infrastructure and public health.'),	
('TXT_KEY_BUILDING_JAR_WATERWORKS_STRATEGY', 'A National Wonder granting a population growth boost to the City where it is constructed and to future Cities. A City must have a {TXT_KEY_BUILDING_GRANARY} before it can construct the {TXT_KEY_BUILDING_JAR_WATERWORKS}.'),	
('TXT_KEY_BUILDING_JAR_WATERWORKS_HELP', '10% of [ICON_FOOD] Food is carried over after a new [ICON_CITIZEN] Citizen is born. [NEWLINE]All Granaries gain +1 [ICON_FOOD] Food, +1 [ICON_PRODUCTION] Production. [NEWLINE]Newly founded Cities start with +1 [ICON_CITIZEN] Citizen. [NEWLINE][NEWLINE]The [ICON_PRODUCTION] Production Cost and [ICON_CITIZEN] Population Requirements increase based on the number of Cities you own.'),
('TXT_KEY_BUILDING_JAR_JOUSTING', 'National Joust'),	
('TXT_KEY_BUILDING_JAR_JOUSTING_PEDIA', 'Emerging in feudal Europe, jousting evolved from the practical need for knights to hone their combat skills. The earliest recorded tournaments took place in 11th-century France, where knights engaged in mock battles to sharpen their abilities in warfare. Over time, jousting became a highly stylized and ritualized spectacle, often held during festive occasions or as part of royal celebrations. The pinnacle of jousting''s popularity occurred during the High Middle Ages, with tournaments attracting participants from across Europe, showcasing chivalry, honor, and martial prowess. [NEWLINE][NEWLINE]Jousting tournaments typically involved two knights on horseback charging at each other with lances, aiming to unseat their opponent or break their lance on the opponent''s shield or armor. The events also included melee combat and other contests of skill. Jousting''s decline began in the late 16th century due to changes in warfare, shifting social values, and the rise of firearms. Despite its waning popularity, the legacy of medieval jousting endures in contemporary portrayals of chivalry and tournaments, highlighting its enduring impact on the cultural imagination of the Middle Ages.'),	
('TXT_KEY_BUILDING_JAR_JOUSTING_STRATEGY', 'A building granting some nifty military bonuses. A City must have an {TXT_KEY_BUILDING_ARMORY} before it can construct the {TXT_KEY_BUILDING_JAR_JOUSTING}.'),	
('TXT_KEY_BUILDING_JAR_JOUSTING_HELP', '+2 [ICON_GREAT_GENERAL] Great General Points. [NEWLINE]Increase [ICON_SILVER_FIST] Military Unit Supply Cap by 2. [NEWLINE]-15% [ICON_GOLD] Gold cost to upgrade Military Units. [NEWLINE]All Barracks and Armories gain +1 [ICON_CULTURE] Culture. [NEWLINE][NEWLINE]The [ICON_PRODUCTION] Production Cost and [ICON_CITIZEN] Population Requirements increase based on the number of Cities you own. [NEWLINE]Newly founded Cities start with an [COLOR_POSITIVE_TEXT]{TXT_KEY_BUILDING_ARMORY}[ENDCOLOR].'),	
('TXT_KEY_BUILDING_JAR_DIPLOMIS', 'Diplomatic Mission'),	
('TXT_KEY_BUILDING_JAR_DIPLOMIS_PEDIA', 'The formal establishment of permanent embassies as recognized diplomatic missions began to take shape during the Renaissance in the 15th and 16th centuries. The first modern embassy is often considered to be the Spanish Embassy in Venice, established in 1487. This marked a shift from ad-hoc diplomatic missions to a more structured and permanent system of representation. Over time, European nations formalized diplomatic practices, and embassies became essential institutions for fostering diplomatic relations, negotiating treaties, and promoting economic and cultural ties between states. [NEWLINE][NEWLINE]The concept of diplomatic immunity also emerged during this period, ensuring that diplomats could perform their duties without fear of arrest or interference. The Peace of Westphalia in 1648 further solidified the principles of modern diplomacy, recognizing the independence and equality of states. As the world became more interconnected, embassies proliferated globally, serving as hubs for international relations and playing a crucial role in maintaining peaceful interactions and resolving conflicts between nations. Today, embassies continue to be central to the conduct of international diplomacy, providing a physical presence for countries to engage with one another and navigate the complexities of the global political landscape.'),	
('TXT_KEY_BUILDING_JAR_DIPLOMIS_STRATEGY', 'A building that increases your geopolitic weight in the world as well as the defenses against foreign secret agents. A City must have a {TXT_KEY_BUILDING_CONSTABLE} before it can construct the {TXT_KEY_BUILDING_JAR_DIPLOMIS}.'),	
('TXT_KEY_BUILDING_JAR_DIPLOMIS_HELP', '+1 [ICON_SPY] Spy.[NEWLINE]+2 [ICON_DIPLOMAT] Delegates.[NEWLINE][NEWLINE]The [ICON_PRODUCTION] Production Cost and [ICON_CITIZEN] Population Requirements increase based on the number of Cities you own. [NEWLINE]Newly founded Cities start with a [COLOR_POSITIVE_TEXT]{TXT_KEY_BUILDING_CONSTABLE}[ENDCOLOR].'),
('TXT_KEY_BUILDING_JAR_NATTHEATRE', 'National Theater'),	
('TXT_KEY_BUILDING_JAR_NATTHEATRE_PEDIA', 'One of the earliest national theaters is the Comédie-Francaise in Paris, established in 1680, which served as a model for similar institutions. However, the idea of a dedicated national theater gained prominence in the 19th century as many European nations sought to establish cultural identity and foster a sense of unity. For instance, the National Theatre in London, founded in 1847, was established with the aim of providing a venue for high-quality drama that reflected the cultural heritage and aspirations of the British people.'),	
('TXT_KEY_BUILDING_JAR_NATTHEATRE_STRATEGY', 'This National Wonder boosts culture and prosperity empire-wide. A City must have an {TXT_KEY_BUILDING_AMPHITHEATER} before it can construct the {TXT_KEY_BUILDING_JAR_NATTHEATRE}.'),	
('TXT_KEY_BUILDING_JAR_NATTHEATRE_HELP', '+2 [ICON_GOLDEN_AGE] Golden Age Points. [NEWLINE]25 [ICON_CULTURE] Culture on Great Person expending scaling with Era. [NEWLINE]All owned Amphitheaters gain +1 [ICON_RESEARCH] Science, +1 [ICON_GOLDEN_AGE] Golden Age Point. [NEWLINE][NEWLINE]The [ICON_PRODUCTION] Production Cost and [ICON_CITIZEN] Population Requirements increase based on the number of Cities you own. [NEWLINE]Newly founded Cities start with an [COLOR_POSITIVE_TEXT]{TXT_KEY_BUILDING_AMPHITHEATER}[ENDCOLOR].'),
('TXT_KEY_BUILDING_JAR_NATAQUARIUM', 'National Aquarium'),	
('TXT_KEY_BUILDING_JAR_NATAQUARIUM_PEDIA', 'The world''s first national aquarium is often attributed to the Marine Biological Association of the United Kingdom, which opened its doors in 1887. This institution aimed to showcase marine specimens for scientific research and public education. The concept of national aquaria gained momentum in the 20th century, with many countries establishing their own facilities to promote marine awareness, research, and conservation. These institutions often play a dual role, serving as both educational centers for the public and hubs for scientific research to better understand and protect aquatic ecosystems. [NEWLINE][NEWLINE]Today, national aquaria around the world continue to evolve, incorporating advanced technologies and interactive exhibits to engage visitors and raise awareness about marine biodiversity and conservation issues. Many national aquaria also participate in breeding programs for endangered species, research initiatives, and collaborate with marine scientists to contribute valuable data to global efforts aimed at preserving the health of our oceans.'),	
('TXT_KEY_BUILDING_JAR_NATAQUARIUM_STRATEGY', 'Constructing this building boosts research and prosperity empire-wide. A City must have a {TXT_KEY_BUILDING_THEATRE} before it can construct the {TXT_KEY_BUILDING_JAR_NATAQUARIUM}.'),	
('TXT_KEY_BUILDING_JAR_NATAQUARIUM_HELP', '5% of [ICON_RESEARCH] Science output in all Cities is added as [ICON_GOLDEN_AGE] Golden Age Points Per Turn. [NEWLINE]All Zoos gain +2 [ICON_RESEARCH] Science. [NEWLINE]Newly founded Cities start with a [COLOR_POSITIVE_TEXT]Circus[ENDCOLOR].'),
('TXT_KEY_BUILDING_JAR_NATSTADIUM', 'Olympic Stadium'),	
('TXT_KEY_BUILDING_JAR_NATSTADIUM_PEDIA', 'One of the earliest national stadiums is the Helsinki Olympic Stadium in Finland, completed in 1938. The stadium was initially constructed for the 1940 Summer Olympics, which were later canceled due to World War II. However, the Helsinki Olympic Stadium played a crucial role in hosting subsequent Olympic Games and became a symbol of national pride. This early example set the precedent for other nations to invest in large-scale, multipurpose stadiums that could host not only sports events but also cultural and national celebrations. [NEWLINE][NEWLINE]In the post-war era, many countries around the world followed suit, constructing national stadiums to host major sporting events and symbolize collective achievements. These venues often serve as iconic landmarks and focal points for national celebrations, hosting a variety of events ranging from sports competitions and concerts to political gatherings. As the demand for modern and state-of-the-art facilities increased, national stadiums evolved to incorporate advanced technologies, seating capacities, and amenities to meet the needs of diverse events and activities.'),	
('TXT_KEY_BUILDING_JAR_NATSTADIUM_STRATEGY', 'This National Wonder boosts duration of Golden Ages. A City must have a {TXT_KEY_BUILDING_STADIUM_DESC} before it can construct the {TXT_KEY_BUILDING_JAR_NATSTADIUM}.'),	
('TXT_KEY_BUILDING_JAR_NATSTADIUM_HELP', 'Starts a [ICON_GOLDEN_AGE] Golden Age.[NEWLINE][ICON_GOLDEN_AGE] Golden Ages last 25% longer. [NEWLINE][NEWLINE]Newly founded Cities start with a [COLOR_POSITIVE_TEXT]{TXT_KEY_BUILDING_THEATRE}[ENDCOLOR].'),
('TXT_KEY_BUILDING_JAR_POLYTECHNIC', 'Polytechnic Institute'),
('TXT_KEY_BUILDING_JAR_POLYTECHNIC_EE', 'National Academy'),
('TXT_KEY_BUILDING_JAR_POLYTECHNIC_PEDIA', 'The concept of polytechnic education emerged as a response to the increasing demand for professionals trained in engineering, technology, and applied sciences. The world''s first polytechnic institute, École Polytechnique in France, founded in 1794, set the standard for institutions that focused on practical and hands-on learning to prepare individuals for careers in industry and innovation. The success of École Polytechnique inspired the establishment of similar institutions globally, with each adapting to the unique needs and priorities of their respective countries. [NEWLINE][NEWLINE]Several prominent polytechnic institutes have gained international recognition for their contributions to education, research, and technological advancements. Institutions like the Massachusetts Institute of Technology (MIT) in the United States, the Swiss Federal Institute of Technology (ETH Zurich) in Switzerland, and the Tokyo Institute of Technology in Japan have emerged as leaders in providing cutting-edge education and fostering innovation. These institutes have played a pivotal role in shaping the landscape of technology and engineering on a global scale, producing graduates who have made significant contributions to various industries and fields of study.'),	
('TXT_KEY_BUILDING_JAR_POLYTECHNIC_STRATEGY', 'A National Wonder affecting production and research. A City must have a {TXT_KEY_BUILDING_PUBLIC_SCHOOL} before it can construct the {TXT_KEY_BUILDING_JAR_POLYTECHNIC}.'),	
('TXT_KEY_BUILDING_JAR_POLYTECHNIC_HELP', '5% of [ICON_PRODUCTION] Production output in all Cities is added as [ICON_RESEARCH] Science Per Turn. [NEWLINE]All Universities gain +2 [ICON_PRODUCTION] Production. [NEWLINE]Newly founded Cities start with a [COLOR_POSITIVE_TEXT]{TXT_KEY_BUILDING_PUBLIC_SCHOOL}[ENDCOLOR].'),
('TXT_KEY_BUILDING_JAR_GWAYSTATION', 'Grand Waystation'),
('TXT_KEY_BUILDING_JAR_GWAYSTATION_PEDIA', 'Dating back to early civilizations such as the Persian Empire, which established the Royal Road with waystations for royal couriers, these facilities enabled efficient movement across empires. In ancient China, similar stations supported the imperial postal system, while in the Roman Empire, mutationes and mansiones provided services for official messengers and travelers. Throughout the medieval period, especially along the Silk Road and pilgrimage routes, waystations continued to offer shelter and logistical support for merchants, diplomats, and pilgrims. These stops were crucial for maintaining long-distance connectivity, fostering economic and cultural exchange, and supporting the infrastructure of states and empires.'),
('TXT_KEY_BUILDING_JAR_GWAYSTATION_STRATEGY', 'Constructing this National Wonder provides benefits for trade and Merchant specialists. A City must have a {TXT_KEY_BUILDING_CARAVANSARY} before it can construct the {TXT_KEY_BUILDING_JAR_GWAYSTATION}.'),
('TXT_KEY_BUILDING_JAR_GWAYSTATION_HELP', '+1 [ICON_GOLD] Gold, [ICON_CULTURE] Culture and [ICON_RESEARCH] Science for every [ICON_INTERNATIONAL_TRADE] Trade Unit passing through the City. [NEWLINE]All Markets and Caravansaries gain +1 [ICON_FOOD] Food, [ICON_PRODUCTION] Production and [ICON_CULTURE_LOCAL] Border Growth. [NEWLINE]+1 [ICON_FOOD] Food and [ICON_CULTURE] Culture from all the [ICON_VP_MERCHANT] Merchant Specialists in the Empire. [NEWLINE][NEWLINE]The [ICON_PRODUCTION] Production Cost and [ICON_CITIZEN] Population Requirements increase based on the number of Cities you own. [NEWLINE]Newly founded Cities start with a [COLOR_POSITIVE_TEXT]{TXT_KEY_BUILDING_CARAVANSARY}[ENDCOLOR].'),
('TXT_KEY_BUILDING_JAR_CENTRALBANK', 'Central Bank'),
('TXT_KEY_BUILDING_JAR_CENTRALBANK_PEDIA', 'The history of central banking dates back to the 17th century, with the establishment of Sweden’s Sveriges Riksbank in 1668, widely regarded as the world''s first central bank. However, the model for modern central banking was shaped significantly by the founding of the Bank of England in 1694, created to finance government debt during wartime. Early central banks were primarily established to serve the fiscal needs of their governments, including managing public debt and issuing banknotes. Over time, their roles expanded to include regulating currency and credit, stabilizing national financial systems, and acting as lenders of last resort during crises. [NEWLINE][NEWLINE]In the 20th century, central banks evolved further into independent institutions tasked with broader economic mandates, such as controlling inflation, maintaining employment, and ensuring financial stability. The U.S. Federal Reserve System, founded in 1913, became a key model for this transformation, particularly after the Great Depression and the 2008 financial crisis, which underscored the central bank’s critical role in crisis management and monetary policy. As globalization increased, central banks also began coordinating policies internationally, especially through forums like the Bank for International Settlements (BIS). Today, while their specific functions may vary by country, central banks are central to economic planning and stability in nearly every modern economy.'),
('TXT_KEY_BUILDING_JAR_CENTRALBANK_STRATEGY', 'This National Wonder boosts Production and Merchant specialists across the empire. A City must have a {TXT_KEY_BUILDING_BANK} before it can construct the {TXT_KEY_BUILDING_JAR_CENTRALBANK}.'),
('TXT_KEY_BUILDING_JAR_CENTRALBANK_HELP', '5% of [ICON_GOLD] Gold output in all Cities is added as [ICON_PRODUCTION] Production Per Turn. [NEWLINE]All Banks gain +2 [ICON_GOLD] Gold and [ICON_CULTURE] Culture. [NEWLINE]+1 [ICON_PRODUCTION] Production and [ICON_RESEARCH] Science from all the [ICON_VP_MERCHANT] Merchant Specialists in the Empire. [NEWLINE][NEWLINE]The [ICON_PRODUCTION] Production Cost and [ICON_CITIZEN] Population Requirements increase based on the number of Cities you own. [NEWLINE]Newly founded Cities start with a [COLOR_POSITIVE_TEXT]{TXT_KEY_BUILDING_BANK}[ENDCOLOR].'),
('TXT_KEY_BUILDING_JAR_STATEARCHIVES', 'State Archives'),
('TXT_KEY_BUILDING_JAR_STATEARCHIVES_PEDIA', 'State archives can be traced to ancient civilizations, where recordkeeping was vital for administration, law, and governance. Early examples include clay tablets stored in temple archives in Mesopotamia and the official records kept by ancient Egyptian and Chinese bureaucracies. However, the concept of a centralized national archive emerged more clearly in the modern era, particularly in Europe during the Enlightenment. The French Revolution marked a turning point with the establishment of the Archives Nationales in 1790, aimed at preserving public records as national property and ensuring transparency and accountability in governance. This model influenced the development of similar institutions across Europe and later in newly formed nation-states. [NEWLINE][NEWLINE]By the 19th and 20th centuries, as governments expanded and literacy increased, national and state archives evolved into formal institutions tasked with preserving not only legal and administrative documents but also cultural heritage and historical memory. Advances in archival science, along with technological innovations, transformed archival practices and access, making it possible to systematically collect, catalog, and preserve vast volumes of materials. Today, national and state archives serve as custodians of public records and play a critical role in historical research, public accountability, and cultural preservation, often balancing traditional preservation with digital archiving and public outreach.'),
('TXT_KEY_BUILDING_JAR_STATEARCHIVES_STRATEGY', 'A building boosting Science and Tourism. A City must have a {TXT_KEY_BUILDING_MUSEUM} before it can construct the {TXT_KEY_BUILDING_JAR_STATEARCHIVES}.'),
('TXT_KEY_BUILDING_JAR_STATEARCHIVES_HELP', '+75 [ICON_RESEARCH] Science whenever you unlock a Policy, scaling with Era. [NEWLINE]5% of [ICON_RESEARCH] Science output in all Cities is added as [ICON_TOURISM] Tourism Per Turn. [NEWLINE]+1 [ICON_RESEARCH] Science to all [ICON_GREAT_WORK] Great Works in the Empire. [NEWLINE][NEWLINE]The [ICON_PRODUCTION] Production Cost and [ICON_CITIZEN] Population Requirements increase based on the number of Cities you own. [NEWLINE]Newly founded Cities start with a [COLOR_POSITIVE_TEXT]{TXT_KEY_BUILDING_MUSEUM}[ENDCOLOR].'),
('TXT_KEY_BUILDING_JAR_INDUSTRYCONFED', 'Confederation of Industry'),
('TXT_KEY_BUILDING_DUMMY_INDUSTRYCONFED', 'DummyConfedIndustry'),	
('TXT_KEY_BUILDING_JAR_INDUSTRYCONFED_PEDIA', 'National industry confederations emerged in the late 19th and early 20th centuries as countries industrialized and business leaders sought organized representation to influence economic policy and labor relations. These confederations typically brought together various sectoral trade associations and chambers of commerce to form unified national voices for industry. In Europe, early examples include Germany’s Reichsverband der Deutschen Industrie (1904) and Italy’s Confindustria (1910), while in the United States, the National Association of Manufacturers (founded in 1895) played a similar role. These organizations aimed to advocate for pro-business legislation, standardize industrial practices, and counter the growing influence of labor unions and socialist movements during the industrial era. [NEWLINE][NEWLINE]As governments became more involved in economic planning—especially during and after the World Wars—national industry confederations grew in importance. They collaborated with states on issues like economic reconstruction, infrastructure development, and trade policy, often participating in tripartite dialogues alongside labor unions and governments. In the postwar period, especially in developed economies, they became key players in shaping industrial strategy, tax policy, education and training programs, and global trade negotiations. Today, these confederations continue to act as influential intermediaries between the private sector and the state, promoting competitiveness, innovation, and economic growth at both national and international levels.'),
('TXT_KEY_BUILDING_JAR_INDUSTRYCONFED_STRATEGY', 'This National Wonder improves production and gold productivity across the empire. A City must have a {TXT_KEY_BUILDING_FACTORY} before it can construct the National {TXT_KEY_BUILDING_JAR_INDUSTRYCONFED}.'),
('TXT_KEY_BUILDING_JAR_INDUSTRYCONFED_HELP', 'Provides 2 [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] [ICON_RES_COAL] Coal. [NEWLINE]Every City gains an Automated [ICON_CITIZEN] Citizen. [NEWLINE]All Factories gain +5% [ICON_FOOD] Food and [ICON_GOLD] Gold. [NEWLINE]+2 [ICON_PRODUCTION] Production on Snow tiles in the Empire. [NEWLINE][NEWLINE]The [ICON_PRODUCTION] Production Cost and [ICON_CITIZEN] Population Requirements increase based on the number of Cities you own. [NEWLINE]Newly founded Cities start with a [COLOR_POSITIVE_TEXT]{TXT_KEY_BUILDING_FACTORY}[ENDCOLOR].'),
('TXT_KEY_BUILDING_JAR_CONCERT_HALL', 'Grand Concert Hall'),
('TXT_KEY_BUILDING_DUMMY_CONCERT_HALL', 'DummyConcertHall'),	
('TXT_KEY_BUILDING_JAR_CONCERT_HALL_PEDIA', 'The concept of the concert hall evolved alongside the development of public musical performance in Europe during the 17th and 18th centuries. Prior to this, music was largely performed in private salons, royal courts, or religious settings. As interest in secular music grew and orchestras expanded, the need for dedicated performance spaces led to the creation of early concert halls. One of the earliest known purpose-built venues was the Holywell Music Room in Oxford, England, opened in 1748. By the 19th century, the rise of the middle class and increased public access to the arts spurred the construction of grand concert halls across Europe, such as the Gewandhaus in Leipzig and the Musikverein in Vienna, designed not only for acoustical excellence but also as architectural symbols of civic pride. [NEWLINE][NEWLINE]In the 20th and 21st centuries, concert halls became global cultural landmarks, with advances in acoustical engineering and design allowing for increasingly sophisticated and flexible performance environments. Iconic modern examples include the Sydney Opera House, completed in 1973, and the Elbphilharmonie in Hamburg, opened in 2017. These venues often serve as homes to major orchestras and are designed to host a wide range of musical genres, from classical to contemporary. Today, concert halls continue to play a central role in cultural life, acting as venues for artistic expression, community gathering, and international prestige, while adapting to changing technologies and audience expectations.'),
('TXT_KEY_BUILDING_JAR_CONCERT_HALL_STRATEGY', 'Constructing this building will improve the culture and tourism rate across the empire. A City must have an {TXT_KEY_BUILDING_OPERA_HOUSE} before it can construct the {TXT_KEY_BUILDING_JAR_CONCERT_HALL}.'),
('TXT_KEY_BUILDING_JAR_CONCERT_HALL_HELP', '+10% [ICON_TOURISM] Tourism in the Empire during [ICON_GOLDEN_AGE] Golden Ages. [NEWLINE]+1 [ICON_GOLDEN_AGE] Golden Age Point to all [ICON_GREAT_WORK] Great Works in the Empire. [NEWLINE]All Opera Houses gain +2 [ICON_TOURISM] Tourism. [NEWLINE]+5 [ICON_CULTURE] Culture and [ICON_GOLDEN_AGE] Golden Age Points if [COLOR_POSITIVE_TEXT]Themed[ENDCOLOR]. [NEWLINE][NEWLINE]The [ICON_PRODUCTION] Production Cost and [ICON_CITIZEN] Population Requirements increase based on the number of Cities you own. [NEWLINE]Newly founded Cities start with an [COLOR_POSITIVE_TEXT]{TXT_KEY_BUILDING_OPERA_HOUSE}[ENDCOLOR].'),
('TXT_KEY_THEMING_BONUS_CONCERT_HALL', 'Popular Orchestral Symphonies'),
('TXT_KEY_THEMING_BONUS_CONCERT_HALL_HELP', 'To maximize your bonus, make sure all the Great Work Slots are all filled with Music created by you.');

--======================================================================================================================
-- Civ compatibility
--======================================================================================================================
CREATE TRIGGER IF NOT EXISTS JarCityMarbleCivCompatibility01 AFTER INSERT ON Civilization_BuildingClassOverrides
WHEN NEW.BuildingClassType='BUILDINGCLASS_HEROIC_EPIC' AND NEW.BuildingType IS NOT NULL
BEGIN
	INSERT INTO Building_FreeBuildingClassFoundedCity
			(BuildingType,		BuildingClassType)
	SELECT 	NEW.BuildingType,	'BUILDINGCLASS_BARRACKS';
END;

CREATE TRIGGER IF NOT EXISTS JarCityMarbleCivCompatibility02 AFTER INSERT ON Civilization_BuildingClassOverrides
WHEN NEW.BuildingClassType='BUILDINGCLASS_NATIONAL_EPIC' AND NEW.BuildingType IS NOT NULL
BEGIN
	INSERT INTO Building_FreeBuildingClassFoundedCity
			(BuildingType,		BuildingClassType)
	SELECT 	NEW.BuildingType,	'BUILDINGCLASS_MONUMENT';
END;

CREATE TRIGGER IF NOT EXISTS JarCityMarbleCivCompatibility03 AFTER INSERT ON Civilization_BuildingClassOverrides
WHEN NEW.BuildingClassType='BUILDINGCLASS_NATIONAL_COLLEGE' AND NEW.BuildingType IS NOT NULL
BEGIN
	INSERT INTO Building_FreeBuildingClassFoundedCity
			(BuildingType,		BuildingClassType)
	SELECT 	NEW.BuildingType,	'BUILDINGCLASS_LIBRARY';
END;

CREATE TRIGGER IF NOT EXISTS JarCityMarbleCivCompatibility04 AFTER INSERT ON Civilization_BuildingClassOverrides
WHEN NEW.BuildingClassType='BUILDINGCLASS_CIRCUS_MAXIMUS' AND NEW.BuildingType IS NOT NULL
BEGIN
	INSERT INTO Building_FreeBuildingClassFoundedCity
			(BuildingType,		BuildingClassType)
	SELECT 	NEW.BuildingType,	'BUILDINGCLASS_COLOSSEUM';
END;

CREATE TRIGGER IF NOT EXISTS JarCityMarbleCivCompatibility05 AFTER INSERT ON Civilization_BuildingClassOverrides
WHEN NEW.BuildingClassType='BUILDINGCLASS_IRONWORKS' AND NEW.BuildingType IS NOT NULL
BEGIN
	INSERT INTO Building_FreeBuildingClassFoundedCity
			(BuildingType,		BuildingClassType)
	SELECT 	NEW.BuildingType,	'BUILDINGCLASS_WORKSHOP';
	
	UPDATE Building_FreeBuildingClassFoundedCity SET BuildingClassType= 'BUILDINGCLASS_WINDMILL'
	WHERE BuildingType = NEW.BuildingType AND (SELECT PrereqTech FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WINDMILL') = 'TECH_MACHINERY';
END;

CREATE TRIGGER IF NOT EXISTS JarCityMarbleCivCompatibility06 AFTER INSERT ON Civilization_BuildingClassOverrides
WHEN NEW.BuildingClassType='BUILDINGCLASS_OXFORD_UNIVERSITY' AND NEW.BuildingType IS NOT NULL
BEGIN
	INSERT  INTO Building_FreeBuildingClassFoundedCity
			(BuildingType,		BuildingClassType)
	SELECT 	NEW.BuildingType,	'BUILDINGCLASS_UNIVERSITY';
END;

CREATE TRIGGER IF NOT EXISTS JarCityMarbleCivCompatibility07 AFTER INSERT ON Civilization_BuildingClassOverrides
WHEN NEW.BuildingClassType='BUILDINGCLASS_HERMITAGE' AND NEW.BuildingType IS NOT NULL
BEGIN
	INSERT INTO Building_FreeBuildingClassFoundedCity
			(BuildingType,		BuildingClassType)
	SELECT 	NEW.BuildingType,	'BUILDINGCLASS_GALLERY';
END;

CREATE TRIGGER IF NOT EXISTS JarCityMarbleCivCompatibility08 AFTER INSERT ON Civilization_BuildingClassOverrides
WHEN NEW.BuildingClassType='BUILDINGCLASS_PRINTING_PRESS' AND NEW.BuildingType IS NOT NULL
BEGIN
	INSERT INTO Building_FreeBuildingClassFoundedCity
			(BuildingType,		BuildingClassType)
	SELECT 	NEW.BuildingType,	'BUILDINGCLASS_CHANCERY';
END;

CREATE TRIGGER IF NOT EXISTS JarCityMarbleCivCompatibility09 AFTER INSERT ON Civilization_BuildingClassOverrides
WHEN NEW.BuildingClassType='BUILDINGCLASS_FOREIGN_OFFICE' AND NEW.BuildingType IS NOT NULL
BEGIN
	INSERT INTO Building_FreeBuildingClassFoundedCity
			(BuildingType,		BuildingClassType)
	SELECT 	NEW.BuildingType,	'BUILDINGCLASS_WIRE_SERVICE';
END;

CREATE TRIGGER IF NOT EXISTS JarCityMarbleCivCompatibility10 AFTER INSERT ON Civilization_BuildingClassOverrides
WHEN NEW.BuildingClassType='BUILDINGCLASS_NATIONAL_TREASURY' AND NEW.BuildingType IS NOT NULL
BEGIN
	INSERT INTO Building_FreeBuildingClassFoundedCity
			(BuildingType,		BuildingClassType)
	SELECT 	NEW.BuildingType,	'BUILDINGCLASS_MINT';
END;

CREATE TRIGGER IF NOT EXISTS JarCityMarbleCivCompatibility11 AFTER INSERT ON Civilization_BuildingClassOverrides
WHEN NEW.BuildingClassType='BUILDINGCLASS_GRAND_TEMPLE' AND NEW.BuildingType IS NOT NULL AND NEW.BuildingType != 'BUILDING_LEUGI_JERUSALEM_TEMPLE'
BEGIN
	INSERT INTO Building_FreeBuildingClassFoundedCity
			(BuildingType,		BuildingClassType)
	SELECT 	NEW.BuildingType,	'BUILDINGCLASS_TEMPLE';
END;
--======================================================================================================================
--======================================================================================================================
UPDATE Language_en_US SET Text = REPLACE(Text, '{TXT_KEY_BUILDING_WORKSHOP}', '{TXT_KEY_BUILDING_WINDMILL}')
WHERE Tag IN (SELECT Help FROM Buildings WHERE BuildingClass='BUILDINGCLASS_IRONWORKS')
AND (SELECT PrereqTech FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WINDMILL') = 'TECH_MACHINERY';

UPDATE Language_en_US SET Text = REPLACE(Text, 'Polytechnic Institute', 'National Academy')
WHERE Tag = 'TXT_KEY_BUILDING_JAR_POLYTECHNIC' AND EXISTS (SELECT * FROM Buildings WHERE Type='BUILDING_EE_ACADEMY');

CREATE TRIGGER IF NOT EXISTS JarCityMarbleEEraCompatibility01 AFTER INSERT ON Buildings
WHEN NEW.Type='BUILDING_EE_ACADEMY'
BEGIN
	UPDATE Buildings SET Description = 'TXT_KEY_BUILDING_JAR_POLYTECHNIC_EE'
	WHERE Type ='BUILDING_JAR_POLYTECHNIC';
END;

UPDATE Building_FreeBuildingClassFoundedCity SET BuildingClassType =  'BUILDINGCLASS_WINDMILL'
WHERE BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass='BUILDINGCLASS_IRONWORKS')
AND (SELECT PrereqTech FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WINDMILL') = 'TECH_MACHINERY';

CREATE TRIGGER IF NOT EXISTS JarCityMarbleEEraCompatibility02 AFTER UPDATE OF PrereqTech ON Buildings
WHEN OLD.BuildingClass ='BUILDINGCLASS_WINDMILL' AND NEW.PrereqTech = 'TECH_MACHINERY'
BEGIN
	UPDATE Building_FreeBuildingClassFoundedCity SET BuildingClassType =  'BUILDINGCLASS_WINDMILL'
	WHERE BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass='BUILDINGCLASS_IRONWORKS');
END;
--======================================================================================================================
--======================================================================================================================
DELETE FROM Buildings WHERE BuildingClass='BUILDINGCLASS_FA_CENTRAL_BANK'
AND EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_FA_CENTRAL_BANK');

CREATE TRIGGER IF NOT EXISTS JarCityMarbleCivCompatibility12 AFTER INSERT ON Buildings
WHEN NEW.BuildingClass ='BUILDINGCLASS_FA_CENTRAL_BANK'
BEGIN
	DELETE FROM Buildings WHERE BuildingClass= NEW.BuildingClass;
END;
--======================================================================================================================
--======================================================================================================================