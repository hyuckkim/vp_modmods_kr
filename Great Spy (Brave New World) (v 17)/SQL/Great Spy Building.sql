--Buildings
INSERT INTO Buildings 
		(Type,																				 BuildingClass,	   Cost,		  PrereqTech,								        Description,											   Help,                                                 Civilopedia,													     Strategy,				ArtDefineTag,		MinAreaSize,	HurryCostModifier,		                IconAtlas,		     PortraitIndex,		     NeverCapture)
SELECT	'BUILDING_TOMATEKH_SPY_TAVERN',						           'BUILDINGCLASS_TOMATEKH_SPY_TAVERN',		120,	'TECH_MACHINERY',		'TXT_KEY_BUILDING_TOMATEKH_SPY_TAVERN_DESC',		'TXT_KEY_BUILDING_TOMATEKH_SPY_TAVERN_HELP',			     'TXT_KEY_BUILDING_TOMATEKH_SPY_TAVERN_TEXT',			      'TXT_KEY_BUILDING_TOMATEKH_SPY_TAVERN_STRATEGY',				     'FORGE',			     -1,			       25,		     'TOMATEKH_SPY_ATLAS',                       3,                      1
WHERE NOT EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_EE_TAVERN');

INSERT INTO BuildingClasses
		(Type,																			   DefaultBuilding,										     Description)
SELECT	'BUILDINGCLASS_TOMATEKH_SPY_TAVERN',		                        'BUILDING_TOMATEKH_SPY_TAVERN',		      'TXT_KEY_BUILDING_TOMATEKH_SPY_TAVERN_DESC'
WHERE NOT EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_EE_TAVERN');

--
INSERT INTO Buildings
		(Type,							BuildingClass,						Cost, 			PrereqTech,						Help,											Description,					Civilopedia,						Quote,									ArtDefineTag,	NukeImmune,			HurryCostModifier,		MinAreaSize,		ConquestProb,		DisplayPosition,	IconAtlas,			PortraitIndex,		WonderSplashImage,					               WonderSplashAudio)
Values	('BUILDING_SPY_KREMLIN',		'BUILDINGCLASS_SPY_KREMLIN',		750,			'TECH_MILITARY_SCIENCE', 		'TXT_KEY_WONDER_KREMLIN_HELP_SPY_OVERRIDE',		'TXT_KEY_BUILDING_KREMLIN',		'TXT_KEY_WONDER_KREMLIN_DESC',      'TXT_KEY_WONDER_KREMLIN_QUOTE',			'KREMLIN',		1,					-1,						-1,					100,				1,					'BW_ATLAS_2',		13,					'WonderConceptKremlin.dds',			'AS2D_WONDER_SPEECH_THE_KREMLIN');

INSERT INTO BuildingClasses 
		(Type,											              DefaultBuilding,				           Description,		MaxGlobalInstances)
VALUES	('BUILDINGCLASS_SPY_KREMLIN',						   'BUILDING_SPY_KREMLIN',			'TXT_KEY_BUILDING_KREMLIN',						 1);

INSERT INTO Building_FreeUnits 
		(BuildingType,											              UnitType,				NumUnits)
VALUES	('BUILDING_SPY_KREMLIN',						           'UNIT_TOMATEKH_SPY',					   1);

--
INSERT INTO Building_Flavors
		(BuildingType,															 FlavorType,						 Flavor)
SELECT	'BUILDING_TOMATEKH_SPY_TAVERN',								     'FLAVOR_ESPIONAGE',							  20
WHERE NOT EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_EE_TAVERN');

INSERT INTO Building_Flavors
		(BuildingType,															 FlavorType,						 Flavor)
SELECT	'BUILDING_TOMATEKH_SPY_TAVERN',								          'FLAVOR_GOLD',							  10
WHERE NOT EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_EE_TAVERN');

INSERT INTO Building_Flavors
		(BuildingType,															 FlavorType,						 Flavor)
SELECT	'BUILDING_TOMATEKH_SPY_TAVERN',								  'FLAVOR_GREAT_PEOPLE',							   1
WHERE NOT EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_EE_TAVERN');

INSERT INTO Building_Flavors
		(BuildingType,															 FlavorType,						 Flavor)
Values	('BUILDING_WALLS',								                 'FLAVOR_ESPIONAGE',							  5),
		('BUILDING_CASTLE',					                             'FLAVOR_ESPIONAGE',						      5),
		('BUILDING_ARSENAL',								             'FLAVOR_ESPIONAGE',							  5),
		('BUILDING_MILITARY_BASE',					                     'FLAVOR_ESPIONAGE',						      5),
		('BUILDING_CONSTABLE',								          'FLAVOR_GREAT_PEOPLE',							  1),
		('BUILDING_POLICE_STATION',					                  'FLAVOR_GREAT_PEOPLE',						      1);

INSERT INTO Building_Flavors
		(BuildingType,															 FlavorType,						 Flavor)
Values	('BUILDING_TERRACOTTA_ARMY',								     'FLAVOR_ESPIONAGE',							  5),
		('BUILDING_HIMEJI_CASTLE',								         'FLAVOR_ESPIONAGE',							  5),
		('BUILDING_GREAT_WALL',								             'FLAVOR_ESPIONAGE',							  2),
		('BUILDING_RED_FORT',								             'FLAVOR_ESPIONAGE',							  5),
		('BUILDING_ALHAMBRA',								             'FLAVOR_ESPIONAGE',							  5),			
		('BUILDING_SPY_KREMLIN',								         'FLAVOR_ESPIONAGE',							 25),
		('BUILDING_SPY_KREMLIN',								            'FLAVOR_WONDER',							 25),
		('BUILDING_SPY_KREMLIN',					                  'FLAVOR_GREAT_PEOPLE',						      5);

--
UPDATE Buildings
SET HELP = 'TXT_KEY_BUILDING_WALLS_HELP_SPY_OVERRIDE'
WHERE Type = 'BUILDING_WALLS';

--
UPDATE Buildings
SET HELP = 'TXT_KEY_BUILDING_CASTLE_HELP_SPY_OVERRIDE'
WHERE Type = 'BUILDING_CASTLE';

--
UPDATE Buildings
SET Help = 'TXT_KEY_BUILDING_ARSENAL_HELP_SPY_OVERRIDE'
WHERE Type = 'BUILDING_ARSENAL'
AND NOT EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_EE_BASTION');

UPDATE Buildings
SET Help = 'TXT_KEY_BUILDING_ARSENAL_HELP_SPY_OVERRIDE_EE'
WHERE Type = 'BUILDING_ARSENAL'
AND EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_EE_BASTION');

--
UPDATE Buildings
SET HELP = 'TXT_KEY_BUILDING_MILITARY_BASE_HELP_SPY_OVERRIDE'
WHERE Type = 'BUILDING_MILITARY_BASE';

--
UPDATE Buildings
SET Cost = 200
WHERE Type = 'BUILDING_CONSTABLE';

UPDATE Buildings
SET HELP = 'TXT_KEY_BUILDING_CONSTABLE_HELP_SPY_OVERRIDE'
WHERE Type = 'BUILDING_CONSTABLE' 
AND NOT EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_JFD_PRISON');

UPDATE Buildings
SET Strategy = 'TXT_KEY_BUILDING_CONSTABLE_STRATEGY_SPY_OVERRIDE'
WHERE Type = 'BUILDING_CONSTABLE' 
AND NOT EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_JFD_PRISON');

----CiD
UPDATE Buildings
SET HELP = 'TXT_KEY_BUILDING_CONSTABLE_HELP_SPY_OVERRIDE_CID'
WHERE Type = 'BUILDING_CONSTABLE' 
AND EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_JFD_PRISON');

UPDATE Buildings
SET Strategy = 'TXT_KEY_BUILDING_CONSTABLE_STRATEGY_SPY_OVERRIDE_CID'
WHERE Type = 'BUILDING_CONSTABLE' 
AND EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_JFD_PRISON');

--
UPDATE Buildings
SET HELP = 'TXT_KEY_BUILDING_POLICE_STATION_HELP_SPY_OVERRIDE'
WHERE Type = 'BUILDING_POLICE_STATION' 
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_TOMATEKH_SPY');

UPDATE Buildings
SET Strategy = 'TXT_KEY_BUILDING_POLICE_STATION_STRATEGY_SPY_OVERRIDE'
WHERE Type = 'BUILDING_POLICE_STATION' 
AND NOT EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_JFD_PRISON');

----CiD
UPDATE Buildings
SET Strategy = 'TXT_KEY_BUILDING_POLICE_STATION_STRATEGY_SPY_OVERRIDE_CID'
WHERE Type = 'BUILDING_POLICE_STATION' 
AND EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_JFD_PRISON');

--Timurids
UPDATE Buildings
SET Help = 'TXT_KEY_BUILDING_TIMURID_MADRASAH_MOD_HELP_SPY_OVERRIDE'
WHERE Type = 'BUILDING_TIMURID_MADRASAH_MOD'
AND EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_TIMURID_MADRASAH_MOD');

CREATE TRIGGER GSModTimBackup
AFTER INSERT ON Buildings WHEN 'BUILDING_TIMURID_MADRASAH_MOD' = NEW.Type
BEGIN

	UPDATE Buildings
	SET Help = 'TXT_KEY_BUILDING_TIMURID_MADRASAH_MOD_HELP_SPY_OVERRIDE'
	WHERE Type = 'BUILDING_TIMURID_MADRASAH_MOD'
	AND EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_TIMURID_MADRASAH_MOD');

END;

--
UPDATE Buildings
SET Help = 'TXT_KEY_WONDER_STATUE_LIBERTY_HELP_SPY_OVERRIDE'
WHERE Type = 'BUILDING_STATUE_OF_LIBERTY';

--
--UPDATE Buildings
--SET Help = 'TXT_KEY_WONDER_PRORA_RESORT_HELP_SPY_OVERRIDE'
--WHERE Type = 'BUILDING_PRORA_RESORT';

--
UPDATE Buildings
SET Help = 'TXT_KEY_WONDER_MOTHERLAND_HELP_SPY_OVERRIDE'
WHERE Type = 'BUILDING_KREMLIN';

UPDATE Buildings
SET Description = 'TXT_KEY_BUILDING_MOTHERLAND_STATUE_SPY_OVERRIDE'
WHERE Type = 'BUILDING_KREMLIN';

UPDATE Buildings
SET Civilopedia = 'TXT_KEY_CIV5_BUILDINGS_MOTHERLAND_STATUE_TEXT_SPY_OVERRIDE'
WHERE Type = 'BUILDING_KREMLIN';

UPDATE Buildings
SET Quote = 'TXT_KEY_BUILDING_MOTHERLAND_SPY_QUOTE'
WHERE Type = 'BUILDING_KREMLIN';

UPDATE Buildings
SET DisplayPosition = 0
WHERE Type = 'BUILDING_KREMLIN';

UPDATE Buildings
SET ArtDefineTag = 'ART_DEF_BUILDING_MOTHERLAND_STATUE'
WHERE Type = 'BUILDING_KREMLIN';

UPDATE Buildings
SET IconAtlas = 'TOMATEKH_SPY_ATLAS'
WHERE Type = 'BUILDING_KREMLIN';

UPDATE Buildings
SET PortraitIndex = 4
WHERE Type = 'BUILDING_KREMLIN';

UPDATE Buildings
SET WonderSplashImage = 'motherland_splash.dds'
WHERE Type = 'BUILDING_KREMLIN';

UPDATE Buildings
SET WonderSplashAudio = 'AS2D_SOUND_TOMATEKH_MOTHERLAND'
WHERE Type = 'BUILDING_KREMLIN';

--
UPDATE Buildings
SET Help = 'TXT_KEY_WONDER_TERRA_COTTA_ARMY_HELP_SPY_OVERRIDE'
WHERE Type = 'BUILDING_TERRACOTTA_ARMY';

--
UPDATE Buildings
SET Help = 'TXT_KEY_WONDER_HIMEJI_CASTLE_HELP_SPY_OVERRIDE'
WHERE Type = 'BUILDING_HIMEJI_CASTLE';

UPDATE Buildings
SET GreatPeopleRateChange = 1
WHERE Type = 'BUILDING_HIMEJI_CASTLE';

--
UPDATE Buildings
SET Help = 'TXT_KEY_WONDER_GREAT_WALL_HELP_SPY_OVERRIDE'
WHERE Type = 'BUILDING_GREAT_WALL'
AND NOT EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_JFD_GREAT_DOCTOR');

UPDATE Buildings
SET Help = 'TXT_KEY_WONDER_GREAT_WALL_HELP_SPY_OVERRIDE_CID'
WHERE Type = 'BUILDING_GREAT_WALL'
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_JFD_GREAT_DOCTOR');

DELETE FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_GREAT_WALL';

--
UPDATE Buildings
SET Help = 'TXT_KEY_WONDER_RED_FORT_HELP_SPY_OVERRIDE'
WHERE Type = 'BUILDING_RED_FORT';

--
UPDATE Buildings
SET Help = 'TXT_KEY_WONDER_ALHAMBRA_HELP_SPY_OVERRIDE'
WHERE Type = 'BUILDING_ALHAMBRA'
AND NOT EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_JFD_GREAT_DOCTOR');

UPDATE Buildings
SET Help = 'TXT_KEY_WONDER_ALHAMBRA_HELP_SPY_OVERRIDE_CID'
WHERE Type = 'BUILDING_ALHAMBRA'
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_JFD_GREAT_DOCTOR');

DELETE FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_ALHAMBRA';

--
UPDATE Buildings
SET Help = 'TXT_KEY_WONDER_PENTAGON_HELP_SPY_OVERRIDE'
WHERE Type = 'BUILDING_PENTAGON'
AND NOT EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_JFD_TOWER_LONDON');

UPDATE Buildings
SET Help = 'TXT_KEY_WONDER_PENTAGON_HELP_SPY_OVERRIDE_CID'
WHERE Type = 'BUILDING_PENTAGON'
AND EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_JFD_TOWER_LONDON');

DELETE FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_PENTAGON';

--
UPDATE Buildings
SET Help = 'TXT_KEY_WONDER_GREAT_FIREWALL_HELP_SPY_OVERRIDE'
WHERE Type = 'BUILDING_GREAT_FIREWALL';

--
UPDATE Buildings
SET GlobalEspionageModifier = -10
WHERE Type = 'BUILDING_INTELLIGENCE_AGENCY';

--UPDATE Buildings
--SET EspionageModifier = 0
--WHERE Type = 'BUILDING_INTELLIGENCE_AGENCY';

UPDATE Buildings
SET Help = 'TXT_KEY_WONDER_INT_AGENCY_HELP_SPY_OVERRIDE'
WHERE Type = 'BUILDING_INTELLIGENCE_AGENCY'
AND NOT EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_JFD_JAIL');

UPDATE Buildings
SET Help = 'TXT_KEY_WONDER_INT_AGENCY_HELP_SPY_OVERRIDE_CID'
WHERE Type = 'BUILDING_INTELLIGENCE_AGENCY'
AND EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_JFD_JAIL');

CREATE TRIGGER GSModIntAgencyBackup
AFTER INSERT ON Buildings WHEN 'BUILDING_JFD_JAIL' = NEW.Type
BEGIN

	UPDATE Buildings
	SET Help = 'TXT_KEY_WONDER_INT_AGENCY_HELP_SPY_OVERRIDE_CID'
	WHERE Type = 'BUILDING_INTELLIGENCE_AGENCY'
	AND EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_JFD_JAIL');

END;

--
UPDATE Buildings
SET Help = 'TXT_KEY_BUILDING_BABYLON_HELP_SPY_OVERRIDE_CID'
WHERE Type = 'BUILDING_WALLS_OF_BABYLON'
AND EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_WALLS_OF_BABYLON')
AND NOT EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_BABYLON_HAMMURABI');

UPDATE Buildings
SET Help = 'TXT_KEY_BUILDING_INDIA_FORT_HELP_SPY_OVERRIDE_CID'
WHERE Type = 'BUILDING_MUGHAL_FORT'
AND NOT EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_MC_MUGHAL');

----CiD
--
UPDATE Buildings
SET Help = 'TXT_KEY_BUILDING_JAIL_HELP_SPY_OVERRIDE_CID'
WHERE Type = 'BUILDING_JFD_JAIL'
AND EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_JFD_JAIL');

--
UPDATE Buildings
SET Help = 'TXT_KEY_WONDER_TOWER_LONDON_HELP_SPY_OVERRIDE_CID'
WHERE Type = 'BUILDING_JFD_TOWER_LONDON'
AND EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_JFD_TOWER_LONDON');

---- EE ----
--
UPDATE Buildings
SET Help = 'TXT_KEY_BUILDING_EE_TAVERN_HELP_SPY_OVERRIDE'
WHERE Type = 'BUILDING_EE_TAVERN'
AND EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_EE_TAVERN');

UPDATE Buildings
SET Strategy = 'TXT_KEY_BUILDING_EE_TAVERN_STRATEGY_SPY_OVERRIDE'
WHERE Type = 'BUILDING_EE_TAVERN'
AND EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_EE_TAVERN');

UPDATE Buildings
SET Cost = 160
WHERE Type = 'BUILDING_EE_TAVERN'
AND EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_EE_TAVERN');

UPDATE Buildings
SET Happiness = 1
WHERE Type = 'BUILDING_EE_TAVERN'
AND EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_EE_TAVERN');

UPDATE Buildings
SET GoldMaintenance = 0
WHERE Type = 'BUILDING_EE_TAVERN'
AND EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_EE_TAVERN');

INSERT INTO Building_Flavors
		(BuildingType,															 FlavorType,						 Flavor)
SELECT	'BUILDING_EE_TAVERN',								             'FLAVOR_ESPIONAGE',							  20
WHERE EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_EE_TAVERN');

INSERT INTO Building_Flavors
		(BuildingType,															 FlavorType,						 Flavor)
SELECT	'BUILDING_EE_TAVERN',												  'FLAVOR_GOLD',							  10
WHERE EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_EE_TAVERN');

INSERT INTO Building_Flavors
		(BuildingType,															 FlavorType,						 Flavor)
SELECT	'BUILDING_EE_TAVERN',								          'FLAVOR_GREAT_PEOPLE',							   1
WHERE EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_EE_TAVERN');

DELETE FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_EE_TAVERN' AND EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_EE_TAVERN');

--
CREATE TRIGGER GSModEEBackup
AFTER INSERT ON Building_ClassesNeededInCity WHEN 'BUILDINGCLASS_EE_TAVERN' = NEW.BuildingClassType
BEGIN

	UPDATE Buildings
	SET Help = 'TXT_KEY_BUILDING_EE_TAVERN_HELP_SPY_OVERRIDE'
	WHERE Type = 'BUILDING_EE_TAVERN'
	AND EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_EE_TAVERN');

	UPDATE Buildings
	SET Strategy = 'TXT_KEY_BUILDING_EE_TAVERN_STRATEGY_SPY_OVERRIDE'
	WHERE Type = 'BUILDING_EE_TAVERN'
	AND EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_EE_TAVERN');

	UPDATE Buildings
	SET Cost = 160
	WHERE Type = 'BUILDING_EE_TAVERN'
	AND EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_EE_TAVERN');

	UPDATE Buildings
	SET Happiness = 1
	WHERE Type = 'BUILDING_EE_TAVERN'
	AND EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_EE_TAVERN');

	UPDATE Buildings
	SET GoldMaintenance = 0
	WHERE Type = 'BUILDING_EE_TAVERN'
	AND EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_EE_TAVERN');

	INSERT INTO Building_Flavors
			(BuildingType,															 FlavorType,						 Flavor)
	SELECT	'BUILDING_EE_TAVERN',								             'FLAVOR_ESPIONAGE',							  20
	WHERE EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_EE_TAVERN');

	INSERT INTO Building_Flavors
			(BuildingType,															 FlavorType,						 Flavor)
	SELECT	'BUILDING_EE_TAVERN',												  'FLAVOR_GOLD',							  10
	WHERE EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_EE_TAVERN');

	INSERT INTO Building_Flavors
			(BuildingType,															 FlavorType,						 Flavor)
	SELECT	'BUILDING_EE_TAVERN',								          'FLAVOR_GREAT_PEOPLE',							   1
	WHERE EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_EE_TAVERN');

	DELETE FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_EE_TAVERN' AND EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_EE_TAVERN');

	DELETE FROM Buildings WHERE Type = 'BUILDING_TOMATEKH_SPY_TAVERN';

	DELETE FROM BuildingClasses WHERE Type = 'BUILDINGCLASS_TOMATEKH_SPY_TAVERN';

	DELETE FROM Building_Flavors WHERE BuildingType = 'BUILDING_TOMATEKH_SPY_TAVERN';

END;
---- EE ----

--
UPDATE Buildings
SET Help = 'TXT_KEY_BUILDING_BASTION_HELP_SPY_OVERRIDE_EE'
WHERE Type = 'BUILDING_EE_BASTION'
AND EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_EE_BASTION');

--
UPDATE Buildings
SET Help = 'TXT_KEY_WONDER_FASIL_GHEBBI_HELP_SPY_OVERRIDE_EE'
WHERE Type = 'BUILDING_EE_FASIL_GHEBBI'
AND EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_EE_FASIL_GHEBBI');

--
UPDATE Policies
SET CulturePerGarrisonedUnit = 1
WHERE Type = 'POLICY_MILITARY_CASTE';

UPDATE Policies
SET Help = 'TXT_KEY_POLICY_MILITARY_CASTE_HELP_SPY_OVERRIDE'
WHERE Type = 'POLICY_MILITARY_CASTE'
AND NOT EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_JFD_LOYALTY');

UPDATE Policies
SET Help = 'TXT_KEY_POLICY_MILITARY_CASTE_HELP_SPY_OVERRIDE_CID'
WHERE Type = 'POLICY_MILITARY_CASTE'
AND EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_JFD_LOYALTY');

--
UPDATE Policies
SET Help = 'TXT_KEY_POLICY_MERC_ARMY_HELP_SPY_OVERRIDE'
WHERE Type = 'POLICY_TRADE_UNIONS'
AND NOT EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_JFD_BLACK_RIDER');

UPDATE Policies
SET Help = 'TXT_KEY_POLICY_MERC_ARMY_HELP_SPY_OVERRIDE_RTP'
WHERE Type = 'POLICY_TRADE_UNIONS'
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_JFD_BLACK_RIDER');

--
INSERT INTO Policy_Flavors 
		(PolicyType,					FlavorType,				Flavor)											
VALUES	('POLICY_MILITARY_CASTE',		'FLAVOR_ESPIONAGE',		     5),
		('POLICY_TRADE_UNIONS',			'FLAVOR_ESPIONAGE',		     5);

--Dummy
INSERT INTO Buildings 
		(Type,																				      BuildingClass,	  Cost,		FaithCost,		PrereqTech,		GreatWorkCount,												   Description,	                                                    Civilopedia,													    Strategy,				                ArtDefineTag,		GlobalEspionageModifier, MinAreaSize,	HurryCostModifier,		                  IconAtlas,		     PortraitIndex,		     NeverCapture,		NukeImmune)
VALUES	('BUILDING_TOMATEKH_SPY_DUMMY_1',						           'BUILDINGCLASS_TOMATEKH_SPY_DUMMY_1',		-1,			   -1,		     NULL,			        -1,			        'TXT_KEY_BUILDING_TOMATEKH_SPY_DUMMY_DESC',					     'TXT_KEY_BUILDING_TOMATEKH_SPY_DUMMY_TEXT',			      'TXT_KEY_BUILDING_TOMATEKH_SPY_DUMMY_STRATEGY',	  'ART_DEF_BUILDING_INTELLIGENCE_AGENCY',			                -50,	      -1,			       25,		     'EXPANSION_BW_ATLAS_1',                        11,                     1,               1),
		('BUILDING_TOMATEKH_SPY_DUMMY_2',						           'BUILDINGCLASS_TOMATEKH_SPY_DUMMY_2',		-1,			   -1,		     NULL,			        -1,			      'TXT_KEY_BUILDING_TOMATEKH_SPY_DUMMY_2_DESC',					     'TXT_KEY_BUILDING_TOMATEKH_SPY_DUMMY_TEXT',			      'TXT_KEY_BUILDING_TOMATEKH_SPY_DUMMY_STRATEGY',	  'ART_DEF_BUILDING_INTELLIGENCE_AGENCY',			                  0,	      -1,			       25,		     'EXPANSION_BW_ATLAS_1',                        11,                     1,               1);

INSERT INTO Buildings 
		(Type,																				      BuildingClass,	  Cost,		FaithCost,		PrereqTech,		GreatWorkCount,												   Description,	                                                    Civilopedia,													    Strategy,				                ArtDefineTag,			MinAreaSize,	HurryCostModifier,		                  IconAtlas,		     PortraitIndex,		     NeverCapture,		ConquestProb,	NukeImmune)
VALUES	('BUILDING_TOMATEKH_SPY_DUMMY_4',						           'BUILDINGCLASS_TOMATEKH_SPY_DUMMY_4',		-1,			   -1,		     NULL,			        -1,			      'TXT_KEY_BUILDING_TOMATEKH_SPY_DUMMY_4_DESC',					     'TXT_KEY_BUILDING_TOMATEKH_SPY_DUMMY_TEXT',			      'TXT_KEY_BUILDING_TOMATEKH_SPY_DUMMY_STRATEGY',	  'ART_DEF_BUILDING_INTELLIGENCE_AGENCY',					 -1,			       25,		     'EXPANSION_BW_ATLAS_1',                        11,                     1,                 0,            1);

INSERT INTO Buildings 
		(Type,																				      BuildingClass,	  Cost,		FaithCost,		PrereqTech,		GreatWorkCount,												   Description,	                                                    Civilopedia,													    Strategy,				                ArtDefineTag,			MinAreaSize,	HurryCostModifier,		                  IconAtlas,		     PortraitIndex,		     NeverCapture,		ConquestProb,	NukeImmune)
VALUES	('BUILDING_TOMATEKH_SPY_DUMMY_1_MOD',						   'BUILDINGCLASS_TOMATEKH_SPY_DUMMY_1_MOD',		-1,			   -1,		     NULL,			        -1,			  'TXT_KEY_BUILDING_TOMATEKH_SPY_DUMMY_1_MOD_DESC',					     'TXT_KEY_BUILDING_TOMATEKH_SPY_DUMMY_TEXT',			      'TXT_KEY_BUILDING_TOMATEKH_SPY_DUMMY_STRATEGY',	  'ART_DEF_BUILDING_INTELLIGENCE_AGENCY',					 -1,			       25,		     'EXPANSION_BW_ATLAS_1',                        11,                     0,               100,            1);

INSERT INTO Buildings 
		(Type,																				      BuildingClass,	  Cost,		FaithCost,		PrereqTech,		GreatWorkCount,												   Description,	                                                    Civilopedia,													    Strategy,				                ArtDefineTag,			MinAreaSize,	HurryCostModifier,		                  IconAtlas,		     PortraitIndex,		     NeverCapture,		ConquestProb,	NukeImmune)
VALUES	('BUILDING_TOMATEKH_SPY_DUMMY_1S',						          'BUILDINGCLASS_TOMATEKH_SPY_DUMMY_1S',		-1,			   -1,		     NULL,			        -1,			     'TXT_KEY_BUILDING_TOMATEKH_SPY_DUMMY_1S_DESC',					     'TXT_KEY_BUILDING_TOMATEKH_SPY_DUMMY_TEXT',			      'TXT_KEY_BUILDING_TOMATEKH_SPY_DUMMY_STRATEGY',	  'ART_DEF_BUILDING_INTELLIGENCE_AGENCY',					 -1,			       25,		     'EXPANSION_BW_ATLAS_1',                        11,                     0,               100,            1),
		('BUILDING_TOMATEKH_SPY_DUMMY_10S',						         'BUILDINGCLASS_TOMATEKH_SPY_DUMMY_10S',		-1,			   -1,		     NULL,			        -1,			    'TXT_KEY_BUILDING_TOMATEKH_SPY_DUMMY_10S_DESC',					     'TXT_KEY_BUILDING_TOMATEKH_SPY_DUMMY_TEXT',			      'TXT_KEY_BUILDING_TOMATEKH_SPY_DUMMY_STRATEGY',	  'ART_DEF_BUILDING_INTELLIGENCE_AGENCY',					 -1,			       25,		     'EXPANSION_BW_ATLAS_1',                        11,                     0,               100,            1),
		('BUILDING_TOMATEKH_SPY_DUMMY_100S',						    'BUILDINGCLASS_TOMATEKH_SPY_DUMMY_100S',		-1,			   -1,		     NULL,			        -1,			   'TXT_KEY_BUILDING_TOMATEKH_SPY_DUMMY_100S_DESC',					     'TXT_KEY_BUILDING_TOMATEKH_SPY_DUMMY_TEXT',			      'TXT_KEY_BUILDING_TOMATEKH_SPY_DUMMY_STRATEGY',	  'ART_DEF_BUILDING_INTELLIGENCE_AGENCY',					 -1,			       25,		     'EXPANSION_BW_ATLAS_1',                        11,                     0,               100,            1),
		('BUILDING_TOMATEKH_SPY_DUMMY_1000S',						   'BUILDINGCLASS_TOMATEKH_SPY_DUMMY_1000S',		-1,			   -1,		     NULL,			        -1,			  'TXT_KEY_BUILDING_TOMATEKH_SPY_DUMMY_1000S_DESC',					     'TXT_KEY_BUILDING_TOMATEKH_SPY_DUMMY_TEXT',			      'TXT_KEY_BUILDING_TOMATEKH_SPY_DUMMY_STRATEGY',	  'ART_DEF_BUILDING_INTELLIGENCE_AGENCY',					 -1,			       25,		     'EXPANSION_BW_ATLAS_1',                        11,                     0,               100,            1),
		('BUILDING_TOMATEKH_SPY_DUMMY_10000S',						  'BUILDINGCLASS_TOMATEKH_SPY_DUMMY_10000S',		-1,			   -1,		     NULL,			        -1,			 'TXT_KEY_BUILDING_TOMATEKH_SPY_DUMMY_10000S_DESC',					     'TXT_KEY_BUILDING_TOMATEKH_SPY_DUMMY_TEXT',			      'TXT_KEY_BUILDING_TOMATEKH_SPY_DUMMY_STRATEGY',	  'ART_DEF_BUILDING_INTELLIGENCE_AGENCY',					 -1,			       25,		     'EXPANSION_BW_ATLAS_1',                        11,                     0,               100,            1),
		('BUILDING_TOMATEKH_SPY_DUMMY_MAX',						         'BUILDINGCLASS_TOMATEKH_SPY_DUMMY_MAX',		-1,			   -1,		     NULL,			        -1,				'TXT_KEY_BUILDING_TOMATEKH_SPY_DUMMY_MAX_DESC',					     'TXT_KEY_BUILDING_TOMATEKH_SPY_DUMMY_TEXT',			      'TXT_KEY_BUILDING_TOMATEKH_SPY_DUMMY_STRATEGY',	  'ART_DEF_BUILDING_INTELLIGENCE_AGENCY',					 -1,			       25,		     'EXPANSION_BW_ATLAS_1',                        11,                     0,               100,            1);

INSERT INTO BuildingClasses
		(Type,																			    DefaultBuilding,										     Description)
Values	('BUILDINGCLASS_TOMATEKH_SPY_DUMMY_1',		                        'BUILDING_TOMATEKH_SPY_DUMMY_1',		      'TXT_KEY_BUILDING_TOMATEKH_SPY_DUMMY_DESC'),
		('BUILDINGCLASS_TOMATEKH_SPY_DUMMY_2',		                        'BUILDING_TOMATEKH_SPY_DUMMY_2',		    'TXT_KEY_BUILDING_TOMATEKH_SPY_DUMMY_2_DESC'),
		('BUILDINGCLASS_TOMATEKH_SPY_DUMMY_4',		                        'BUILDING_TOMATEKH_SPY_DUMMY_4',		    'TXT_KEY_BUILDING_TOMATEKH_SPY_DUMMY_4_DESC');

INSERT INTO BuildingClasses
		(Type,																			    DefaultBuilding,										     Description)
Values	('BUILDINGCLASS_TOMATEKH_SPY_DUMMY_1_MOD',		                'BUILDING_TOMATEKH_SPY_DUMMY_1_MOD',		'TXT_KEY_BUILDING_TOMATEKH_SPY_DUMMY_1_MOD_DESC');

INSERT INTO BuildingClasses
		(Type,																			    DefaultBuilding,										          Description)
Values	('BUILDINGCLASS_TOMATEKH_SPY_DUMMY_1S',		                       'BUILDING_TOMATEKH_SPY_DUMMY_1S',		        'TXT_KEY_BUILDING_TOMATEKH_SPY_DUMMY_1S_DESC'),
		('BUILDINGCLASS_TOMATEKH_SPY_DUMMY_10S',		                  'BUILDING_TOMATEKH_SPY_DUMMY_10S',		       'TXT_KEY_BUILDING_TOMATEKH_SPY_DUMMY_10S_DESC'),
		('BUILDINGCLASS_TOMATEKH_SPY_DUMMY_100S',		                 'BUILDING_TOMATEKH_SPY_DUMMY_100S',		      'TXT_KEY_BUILDING_TOMATEKH_SPY_DUMMY_100S_DESC'),
		('BUILDINGCLASS_TOMATEKH_SPY_DUMMY_1000S',		                'BUILDING_TOMATEKH_SPY_DUMMY_1000S',		     'TXT_KEY_BUILDING_TOMATEKH_SPY_DUMMY_1000S_DESC'),
		('BUILDINGCLASS_TOMATEKH_SPY_DUMMY_10000S',		               'BUILDING_TOMATEKH_SPY_DUMMY_10000S',		    'TXT_KEY_BUILDING_TOMATEKH_SPY_DUMMY_10000S_DESC'),
		('BUILDINGCLASS_TOMATEKH_SPY_DUMMY_MAX',		                  'BUILDING_TOMATEKH_SPY_DUMMY_MAX',		       'TXT_KEY_BUILDING_TOMATEKH_SPY_DUMMY_MAX_DESC');

INSERT INTO Building_FreeUnits 
		(BuildingType,											              UnitType,				NumUnits)
VALUES	('BUILDING_TOMATEKH_SPY_DUMMY_4',						   'UNIT_TOMATEKH_SPY',					   1);

--
DELETE FROM Building_SpecialistYieldChanges WHERE BuildingType = 'BUILDING_STATUE_OF_LIBERTY' AND SpecialistType = 'SPECIALIST_CITIZEN';

INSERT INTO Buildings 
		(Type,																				      BuildingClass,	  Cost,		FaithCost,		PrereqTech,		GreatWorkCount,												     Description,	                                                    Civilopedia,													    Strategy,				                ArtDefineTag,			MinAreaSize,	HurryCostModifier,		                  IconAtlas,		     PortraitIndex,		     NeverCapture,		NukeImmune)
VALUES	('BUILDING_TOMATEKH_SPY_TAVERN_GOLD',				           'BUILDINGCLASS_TOMATEKH_SPY_TAVERN_GOLD',		-1,			   -1,		     NULL,			        -1,			  'TXT_KEY_BUILDING_TOMATEKH_CITIZEN_DISPLAY_1_DESC',					     'TXT_KEY_BUILDING_TOMATEKH_SPY_DUMMY_TEXT',			      'TXT_KEY_BUILDING_TOMATEKH_SPY_DUMMY_STRATEGY',	  'ART_DEF_BUILDING_INTELLIGENCE_AGENCY',					 -1,			       25,		     'EXPANSION_BW_ATLAS_1',                        11,                     1,               1),
		('BUILDING_INTELLIGENCE_AGENCY_SPY_SCIENCE',		    'BUILDINGCLASS_INTELLIGENCE_AGENCY_SPY_SCIENCE',		-1,			   -1,		     NULL,			        -1,			  'TXT_KEY_BUILDING_TOMATEKH_CITIZEN_DISPLAY_2_DESC',					     'TXT_KEY_BUILDING_TOMATEKH_SPY_DUMMY_TEXT',			      'TXT_KEY_BUILDING_TOMATEKH_SPY_DUMMY_STRATEGY',	  'ART_DEF_BUILDING_INTELLIGENCE_AGENCY',					 -1,			       25,		     'EXPANSION_BW_ATLAS_1',                        11,                     1,               1),
		('BUILDING_TOMATEKH_SPY_MYSTERY_FAITH',				         'BUILDINGCLASS_TOMATEKH_SPY_MYSTERY_FAITH',		-1,			   -1,		     NULL,			        -1,			  'TXT_KEY_BUILDING_TOMATEKH_CITIZEN_DISPLAY_3_DESC',					     'TXT_KEY_BUILDING_TOMATEKH_SPY_DUMMY_TEXT',			      'TXT_KEY_BUILDING_TOMATEKH_SPY_DUMMY_STRATEGY',	  'ART_DEF_BUILDING_INTELLIGENCE_AGENCY',					 -1,			       25,		     'EXPANSION_BW_ATLAS_1',                        11,                     1,               1);

INSERT INTO BuildingClasses
		(Type,																			    DefaultBuilding,										       Description)
Values	('BUILDINGCLASS_TOMATEKH_SPY_TAVERN_GOLD',		                'BUILDING_TOMATEKH_SPY_TAVERN_GOLD',		'TXT_KEY_BUILDING_TOMATEKH_CITIZEN_DISPLAY_1_DESC'),
		('BUILDINGCLASS_INTELLIGENCE_AGENCY_SPY_SCIENCE',		 'BUILDING_INTELLIGENCE_AGENCY_SPY_SCIENCE',		'TXT_KEY_BUILDING_TOMATEKH_CITIZEN_DISPLAY_2_DESC'),
		('BUILDINGCLASS_TOMATEKH_SPY_MYSTERY_FAITH',		          'BUILDING_TOMATEKH_SPY_MYSTERY_FAITH',		'TXT_KEY_BUILDING_TOMATEKH_CITIZEN_DISPLAY_3_DESC');

INSERT INTO Building_YieldChanges 
		(BuildingType,											                  YieldType,						  Yield)
VALUES	('BUILDING_TOMATEKH_SPY_TAVERN_GOLD',				                   'YIELD_GOLD',							  1),
		('BUILDING_INTELLIGENCE_AGENCY_SPY_SCIENCE',				        'YIELD_SCIENCE',							  1),
		('BUILDING_TOMATEKH_SPY_MYSTERY_FAITH',				                  'YIELD_FAITH',							  1);

INSERT INTO Buildings 
		(Type,																				      BuildingClass,	  Cost,		FaithCost,		PrereqTech,		GreatWorkCount,												      Description,	                                                    Civilopedia,													    Strategy,				                ArtDefineTag,			MinAreaSize,	HurryCostModifier,		                  IconAtlas,		     PortraitIndex,		     NeverCapture,		NukeImmune)
VALUES	('BUILDING_TOMATEKH_SPY_TAVERN_DISPLAY',				    'BUILDINGCLASS_TOMATEKH_SPY_TAVERN_DISPLAY',		-1,			   -1,		     NULL,			        -1,			  'TXT_KEY_BUILDING_TOMATEKH_CITIZEN_DISPLAY_1A_DESC',					     'TXT_KEY_BUILDING_TOMATEKH_SPY_DUMMY_TEXT',			      'TXT_KEY_BUILDING_TOMATEKH_SPY_DUMMY_STRATEGY',	  'ART_DEF_BUILDING_INTELLIGENCE_AGENCY',					 -1,			       25,		     'EXPANSION_BW_ATLAS_1',                        11,                     1,               1),
		('BUILDING_INTELLIGENCE_AGENCY_SPY_DISPLAY',		    'BUILDINGCLASS_INTELLIGENCE_AGENCY_SPY_DISPLAY',		-1,			   -1,		     NULL,			        -1,			  'TXT_KEY_BUILDING_TOMATEKH_CITIZEN_DISPLAY_2A_DESC',					     'TXT_KEY_BUILDING_TOMATEKH_SPY_DUMMY_TEXT',			      'TXT_KEY_BUILDING_TOMATEKH_SPY_DUMMY_STRATEGY',	  'ART_DEF_BUILDING_INTELLIGENCE_AGENCY',					 -1,			       25,		     'EXPANSION_BW_ATLAS_1',                        11,                     1,               1),
		('BUILDING_TOMATEKH_SPY_MYSTERY_DISPLAY',				   'BUILDINGCLASS_TOMATEKH_SPY_MYSTERY_DISPLAY',		-1,			   -1,		     NULL,			        -1,			  'TXT_KEY_BUILDING_TOMATEKH_CITIZEN_DISPLAY_3A_DESC',					     'TXT_KEY_BUILDING_TOMATEKH_SPY_DUMMY_TEXT',			      'TXT_KEY_BUILDING_TOMATEKH_SPY_DUMMY_STRATEGY',	  'ART_DEF_BUILDING_INTELLIGENCE_AGENCY',					 -1,			       25,		     'EXPANSION_BW_ATLAS_1',                        11,                     1,               1);

INSERT INTO BuildingClasses
		(Type,																			    DefaultBuilding,										        Description)
Values	('BUILDINGCLASS_TOMATEKH_SPY_TAVERN_DISPLAY',		         'BUILDING_TOMATEKH_SPY_TAVERN_DISPLAY',		'TXT_KEY_BUILDING_TOMATEKH_CITIZEN_DISPLAY_1A_DESC'),
		('BUILDINGCLASS_INTELLIGENCE_AGENCY_SPY_DISPLAY',		 'BUILDING_INTELLIGENCE_AGENCY_SPY_DISPLAY',		'TXT_KEY_BUILDING_TOMATEKH_CITIZEN_DISPLAY_2A_DESC'),
		('BUILDINGCLASS_TOMATEKH_SPY_MYSTERY_DISPLAY',		        'BUILDING_TOMATEKH_SPY_MYSTERY_DISPLAY',		'TXT_KEY_BUILDING_TOMATEKH_CITIZEN_DISPLAY_3A_DESC');

INSERT INTO Building_SpecialistYieldChanges 
		(BuildingType,												  SpecialistType,              YieldType,           Yield)
VALUES	('BUILDING_TOMATEKH_SPY_TAVERN_DISPLAY',				'SPECIALIST_CITIZEN',			'YIELD_GOLD',			    1),
		('BUILDING_INTELLIGENCE_AGENCY_SPY_DISPLAY',			'SPECIALIST_CITIZEN',	     'YIELD_SCIENCE',			    1),
		('BUILDING_TOMATEKH_SPY_MYSTERY_DISPLAY',			    'SPECIALIST_CITIZEN',	       'YIELD_FAITH',			    1);













