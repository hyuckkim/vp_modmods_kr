--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses
		(Type,									DefaultBuilding,					Description,								MaxPlayerInstances,		MaxGlobalInstances)
VALUES	('BUILDINGCLASS_JFD_HIGH_COURT',		'BUILDING_JFD_HIGH_COURT',			'TXT_KEY_BUILDING_JFD_HIGH_COURT',			-1,						-1),
		('BUILDINGCLASS_JFD_MAGISTRATE_COURT',	'BUILDING_JFD_MAGISTRATE_COURT',	'TXT_KEY_BUILDING_JFD_MAGISTRATE_COURT',	-1,						-1),
        ('BUILDINGCLASS_JFD_SUPREME_COURT',		'BUILDING_JFD_SUPREME_COURT',		'TXT_KEY_BUILDING_JFD_SUPREME_COURT',		1,						-1);

--------------------------------------------------------------------------------------------------------------------------
-- Buildings
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Buildings
		(Type, 								Cost, 	FaithCost, 	GoldMaintenance,	EmpireSizeModifierReduction,	Espionage,	SpySecurityModifier,	PrereqTech,			        BuildingClass, 							Description, 								Help,											Strategy,											Civilopedia,									MinAreaSize,	HurryCostModifier,	NumCityCostMod,	ConquestProb,	NukeImmune, NeverCapture,	IconAtlas,							PortraitIndex)
VALUES	('BUILDING_JFD_HIGH_COURT',			600,	-1,			4,					-5,								0,			0,						'TECH_ECONOMICS',	        'BUILDINGCLASS_JFD_HIGH_COURT',			'TXT_KEY_BUILDING_JFD_HIGH_COURT',			'TXT_KEY_BUILDING_JFD_HIGH_COURT_HELP',			'TXT_KEY_BUILDING_JFD_HIGH_COURT_STRATEGY',			'TXT_KEY_BUILDING_JFD_HIGH_COURT_TEXT',			-1,				5,					0,				66,				0,			0,				'JFD_SOVEREIGNTY_BUILDING_ATLAS',	1),
		('BUILDING_JFD_MAGISTRATE_COURT',	200,	-1,			1,					-5,								0,			0,						'TECH_PHILOSOPHY',	        'BUILDINGCLASS_JFD_MAGISTRATE_COURT',	'TXT_KEY_BUILDING_JFD_MAGISTRATE_COURT',	'TXT_KEY_BUILDING_JFD_MAGISTRATE_COURT_HELP',	'TXT_KEY_BUILDING_JFD_MAGISTRATE_COURT_STRATEGY',	'TXT_KEY_BUILDING_JFD_MAGISTRATE_COURT_TEXT',	-1,				5,					0,				66,				0,			0,				'JFD_SOVEREIGNTY_BUILDING_ATLAS',	0);


INSERT INTO Buildings
		(Type,							    Cost,   NationalPopRequired,    PrereqTech,	                BuildingClass,                          Description,								  Help, 										Strategy, 											Civilopedia,									MinAreaSize,	HurryCostModifier,  NumCityCostMod,	  NukeImmune, NeverCapture,   IconAtlas, 							PortraitIndex,  Happiness, EmpireSizeModifierReductionGlobal)
VALUES	('BUILDING_JFD_SUPREME_COURT',	    137,    '30',               	'TECH_SCIENTIFIC_THEORY',	'BUILDINGCLASS_JFD_SUPREME_COURT',      'TXT_KEY_BUILDING_JFD_SUPREME_COURT',		  'TXT_KEY_BUILDING_JFD_SUPREME_COURT_HELP', 	'TXT_KEY_BUILDING_JFD_SUPREME_COURT_STRATEGY',		'TXT_KEY_BUILDING_JFD_SUPREME_COURT_TEXT',		-5,         	5,                  10,				  1,			1,		        'JFD_SOVEREIGNTY_BUILDING_ATLAS',	2,              1,         -10);


INSERT INTO Building_YieldChanges
	    (BuildingType,                     YieldType,          Yield)
VALUES	('BUILDING_JFD_MAGISTRATE_COURT', 'YIELD_CULTURE',      1),
    	('BUILDING_JFD_HIGH_COURT',       'YIELD_CULTURE',      2);

INSERT INTO Policy_BuildingClassHappiness
	(PolicyType, BuildingClassType, Happiness)
VALUES ('POLICY_LEGALISM', 'BUILDINGCLASS_JFD_SUPREME_COURT', 1);

INSERT INTO Building_BuildingClassYieldChanges
	(BuildingType, BuildingClassType, YieldType, YieldChange)
VALUES ('BUILDING_JFD_SUPREME_COURT', 'BUILDINGCLASS_JFD_HIGH_COURT', 'YIELD_GOLD', 2);

------------------------------------------------------------------------------------------------------------------------
-- Building_ClassesNeededInCity
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_ClassesNeededInCity
		(BuildingType, 						BuildingClassType)
VALUES	('BUILDING_JFD_HIGH_COURT', 		'BUILDINGCLASS_JFD_MAGISTRATE_COURT'),
		('BUILDING_JFD_SUPREME_COURT',		'BUILDINGCLASS_JFD_HIGH_COURT');
------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_SovereigntyMods
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_JFD_SovereigntyMods
		(BuildingType, 						GovernmentCooldownModPerCity,	GovernmentCooldownModPerCitizen,	ReformCooldownModPerCity,	ReformCooldownModPerCitizen)
VALUES	('BUILDING_JFD_MAGISTRATE_COURT',	0,								0,									-10,						-10),
		('BUILDING_JFD_HIGH_COURT',			0,								0,									-15,						-15),
		('BUILDING_JFD_SUPREME_COURT',		0,								0,									-25,						-25);

INSERT INTO Building_JFD_SovereigntyMods
		(BuildingType, 					    GovernmentCooldownModPerCity,	GovernmentCooldownModPerCitizen)
SELECT	Type, 							    -15,	                        -15
FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_CHANCERY', 'BUILDINGCLASS_WIRE_SERVICE');

INSERT INTO Building_JFD_SovereigntyMods
		(BuildingType, 					    GovernmentCooldownModPerCity,	GovernmentCooldownModPerCitizen)
SELECT	Type, 							    -25,	                        -25
FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_PRINTING_PRESS');


UPDATE Language_en_US SET Text = 'Cities and [ICON_CITIZEN] Population decrease [ICON_JFD_GOVERNMENT_COOLDOWN] Legislature Cooldown by 25% less.[NEWLINE][NEWLINE]' || Text WHERE Tag IN (SELECT Help FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_PRINTING_PRESS')); --'TXT_KEY_BUILDING_PRINTING_PRESS_HELP';
UPDATE Language_en_US SET Text = 'Cities and [ICON_CITIZEN] Population decrease [ICON_JFD_GOVERNMENT_COOLDOWN] Legislature Cooldown by 15% less.[NEWLINE][NEWLINE]' || Text WHERE Tag IN (SELECT Help FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_CHANCERY', 'BUILDINGCLASS_WIRE_SERVICE')); --='TXT_KEY_BUILDING_CHANCERY_HELP';
--UPDATE Language_en_US SET Text = 'Cities and [ICON_CITIZEN] Population decrease [ICON_JFD_GOVERNMENT_COOLDOWN] Legislature Cooldown by 15% less.[NEWLINE][NEWLINE]' || Text WHERE Tag ='TXT_KEY_BUILDING_WIRE_SERVICE_HELP';

------------------------------------------------------------------------------------------------------------------------
-- Building_Flavors
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_Flavors
		(BuildingType, 						FlavorType,						Flavor)
VALUES	('BUILDING_JFD_HIGH_COURT',			'FLAVOR_CULTURE',	    		20),
        ('BUILDING_JFD_HIGH_COURT',			'FLAVOR_HAPPINESS',   			10),
        ('BUILDING_JFD_MAGISTRATE_COURT',	'FLAVOR_CULTURE',	    		10),
        ('BUILDING_JFD_MAGISTRATE_COURT',	'FLAVOR_HAPPINESS', 			10),
		('BUILDING_JFD_SUPREME_COURT',		'FLAVOR_WONDER',				10),
		('BUILDING_JFD_SUPREME_COURT',		'FLAVOR_HAPPINESS',	    		40),
		('BUILDING_JFD_SUPREME_COURT',		'FLAVOR_CULTURE',				20);
--==========================================================================================================================
--==========================================================================================================================