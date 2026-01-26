INSERT INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn)
SELECT 'BuildingPMOD_ICON_ATLAS', '256', 'BuildingPIconAtlas256.dds', 3, 3 UNION ALL
SELECT 'BuildingPMOD_ICON_ATLAS', '128', 'BuildingPIconAtlas128.dds', 3, 3 UNION ALL
SELECT 'BuildingPMOD_ICON_ATLAS', '80', 'BuildingPIconAtlas80.dds', 3, 3 UNION ALL
SELECT 'BuildingPMOD_ICON_ATLAS', '64', 'BuildingPIconAtlas64.dds', 3, 3 UNION ALL
SELECT 'BuildingPMOD_ICON_ATLAS', '45', 'BuildingPIconAtlas45.dds', 3, 3;
----------------------------- SCURVY ----------------------------------------


INSERT INTO UnitPromotions
		(Type,								Description,								Help, 					EnemyDamageChance,		EnemyDamage, NeutralDamageChance,	NeutralDamage,	IsLostOnMove,	CannotBeChosen,	PortraitIndex,	   IconAtlas, 			PediaType, 			        PediaEntry,              OrderPriority, FlagPromoOrder)
SELECT	'PROMOTION_SCURVY',				'TXT_KEY_PROMOTION_SCURVY', 			'TXT_KEY_PROMOTION_SCURVY_HELP', 	25,							5,			 25,					5,				1,				1,				50,		    'PROMOTION_ATLAS_VP_06',	     'PEDIA_SHARED',		'TXT_KEY_PROMOTION_SCURVY',	11,         11;	 

INSERT INTO UnitPromotions
		(Type,								Description,								Help, 									 NegatesPromotion,			Sound,		OrderPriority,	FlagPromoOrder, CannotBeChosen,	PortraitIndex,	     IconAtlas, 							PediaType, 			PediaEntry)
SELECT	'PROMOTION_SCURVY_IMMUNITY',	'TXT_KEY_PROMOTION_SCURVY_IMMUNITY', 	'TXT_KEY_PROMOTION_SCURVY_IMMUNITY_HELP',	'PROMOTION_SCURVY',		'AS2D_IF_LEVELUP',			9999,	    9999,         1,				4,				'PROMOTION_ATLAS_VP_06',	            'PEDIA_SHARED',		'TXT_KEY_PROMOTION_SCURVY_IMMUNITY';	


UPDATE UnitPromotions SET ShowInUnitPanel = 0 WHERE Type = 'PROMOTION_SCURVY_IMMUNITY';

UPDATE Terrains SET LocationUnitFreePromotion = 'PROMOTION_SCURVY' WHERE Type = 'TERRAIN_OCEAN';



INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_PROMOTION_SCURVY_IMMUNITY', 'Seamanship'),
('TXT_KEY_PROMOTION_SCURVY_IMMUNITY_HELP', 'Immunity to Attrition from Ocean Tiles.');

UPDATE Language_en_US
SET Text = 'May Takes Damage in Ocean Tiles If Ends Turn Outside Friendly Territory.'
WHERE Tag = 'TXT_KEY_PROMOTION_SCURVY_HELP';

INSERT INTO UnitPromotions_UnitCombats (PromotionType, UnitCombatType) VALUES
	('PROMOTION_SCURVY_IMMUNITY', 		'UNITCOMBAT_SUBMARINE'),
	('PROMOTION_SCURVY_IMMUNITY', 		'UNITCOMBAT_CARRIER'),
	('PROMOTION_SCURVY_IMMUNITY', 		'UNITCOMBAT_NAVALRANGED'),
    ('PROMOTION_SCURVY_IMMUNITY', 		'UNITCOMBAT_NAVALMELEE'),
	('PROMOTION_SCURVY', 		'UNITCOMBAT_SUBMARINE'),
	('PROMOTION_SCURVY', 		'UNITCOMBAT_CARRIER'),
	('PROMOTION_SCURVY', 		'UNITCOMBAT_NAVALRANGED'),
    ('PROMOTION_SCURVY', 		'UNITCOMBAT_NAVALMELEE');

INSERT INTO Unit_FreePromotions
		(UnitType,								PromotionType)
VALUES	  ('UNIT_PORTUGUESE_NAU',		'PROMOTION_SCURVY_IMMUNITY');


--------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions
		(Type,								Description,								Help, 						Sound,		ExperiencePercent,	CannotBeChosen,	LostWithUpgrade,  PortraitIndex,	     IconAtlas, 				PediaType, 			PediaEntry,                          OrderPriority, FlagPromoOrder)
SELECT	'PROMOTION_FA_SEA_ACADEMY',	'TXT_KEY_PROMOTION_FA_SEA_ACADEMY', 	'TXT_KEY_PROMOTION_FA_SEA_ACADEMY_HELP',	'AS2D_IF_LEVELUP',		50,	          1,				1,                 58,				'PROMOTION_ATLAS_VP_06',	            'PEDIA_SHARED',		'TXT_KEY_PROMOTION_FA_SEA_ACADEMY',	200,         200;
INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_PROMOTION_FA_SEA_ACADEMY', 'Naval Academy'),
('TXT_KEY_PROMOTION_FA_SEA_ACADEMY_HELP', '+50% Experience gained from combat.[NEWLINE][COLOR_NEGATIVE_TEXT]Lost on upgrade.[ENDCOLOR]');

INSERT INTO UnitPromotions_UnitCombats (PromotionType, UnitCombatType) VALUES
	('PROMOTION_FA_SEA_ACADEMY', 		'UNITCOMBAT_SUBMARINE'),
	('PROMOTION_FA_SEA_ACADEMY', 		'UNITCOMBAT_CARRIER'),
	('PROMOTION_FA_SEA_ACADEMY', 		'UNITCOMBAT_NAVALRANGED'),
    ('PROMOTION_FA_SEA_ACADEMY', 		'UNITCOMBAT_NAVALMELEE');

---------------------------NAVIGATION_SCHOOL-----------------------------------------------

INSERT INTO BuildingClasses
			(Type,										Description,							DefaultBuilding,						MaxPlayerInstances)
VALUES	('BUILDINGCLASS_NAVIGATION_SCHOOL',			'TXT_KEY_NEWWORLD_SCENARIO_BUILDING_NAVIGATION_SCHOOL',	'BUILDING_NAVIGATION_SCHOOL',			1);

INSERT INTO Civilization_BuildingClassOverrides
	(CivilizationType, BuildingClassType, BuildingType)
VALUES
	('CIVILIZATION_MINOR', 'BUILDINGCLASS_NAVIGATION_SCHOOL', NULL),
	('CIVILIZATION_BARBARIAN', 'BUILDINGCLASS_NAVIGATION_SCHOOL', NULL);

INSERT INTO Buildings
			(Type,								BuildingClass,							Description,							                              Help, 											Civilopedia, 												                           Strategy, 											ArtDefineTag, 					Cost,	FaithCost,	NumCityCostMod, NeverCapture,	NukeImmune, ConquestProb,	HurryCostModifier,	MinAreaSize, Water,	IconAtlas,	PortraitIndex)
VALUES		('BUILDING_NAVIGATION_SCHOOL',	'BUILDINGCLASS_NAVIGATION_SCHOOL',		'TXT_KEY_NEWWORLD_SCENARIO_BUILDING_NAVIGATION_SCHOOL',	'TXT_KEY_NEWWORLD_SCENARIO_BUILDING_NAVIGATION_SCHOOL_HELP',		'TXT_KEY_NEWWORLD_SCENARIO_BUILDING_NAVIGATION_SCHOOL_TEXT', 	'TXT_KEY_NEWWORLD_SCENARIO_BUILDING_NAVIGATION_SCHOOL_STRATEGY',		'ART_DEF_BUILDING_UNIVERSITY',	     400,	0,			25, 					1,				1,			0,				-10,		     10,		1,  'BuildingPMOD_ICON_ATLAS',	5);

UPDATE Language_en_US
SET Text = 'Removes scurvy from all naval units built by empire. +10% [ICON_SILVER_FIST] Military Supply from Population.
City must be built on the coast.'
WHERE Tag = 'TXT_KEY_NEWWORLD_SCENARIO_BUILDING_NAVIGATION_SCHOOL_HELP';

UPDATE Language_en_US
SET Text = 'Build the Navigation School national wonder to ensure that all naval units will not suffer from the Scurvy promotion.'
WHERE Tag = 'TXT_KEY_NEWWORLD_SCENARIO_BUILDING_NAVIGATION_SCHOOL_STRATEGY';

UPDATE Buildings SET
	PrereqTech 						= 'TECH_STEAM_POWER',
	FreePromotion 					= 'PROMOTION_SCURVY_IMMUNITY',
	TrainedFreePromotion 			= 'PROMOTION_FA_SEA_ACADEMY',
	CitySupplyModifier = 10,
	NationalPopRequired = 35
WHERE Type = 'BUILDING_NAVIGATION_SCHOOL';

	
INSERT INTO Building_ClassesNeededInCity
	(BuildingType, BuildingClassType)
VALUES
	('BUILDING_NAVIGATION_SCHOOL', 'BUILDINGCLASS_UNIVERSITY'),
	('BUILDING_NAVIGATION_SCHOOL', 'BUILDINGCLASS_HARBOR');	
	
INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield)
SELECT 'BUILDING_NAVIGATION_SCHOOL', 'YIELD_CULTURE', 1 UNION ALL
SELECT 'BUILDING_NAVIGATION_SCHOOL', 'YIELD_GREAT_ADMIRAL_POINTS', 1;


INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) VALUES
('BUILDING_NAVIGATION_SCHOOL', 'FLAVOR_WONDER', 10),
('BUILDING_NAVIGATION_SCHOOL', 'FLAVOR_GREAT_PEOPLE', 2),
('BUILDING_NAVIGATION_SCHOOL', 'FLAVOR_MILITARY_TRAINING', 10),
('BUILDING_NAVIGATION_SCHOOL', 'FLAVOR_NAVAL', 35);


	
INSERT INTO Policy_BuildingClassHappiness (PolicyType, BuildingClassType, Happiness)
SELECT DISTINCT PolicyType, 'BUILDINGCLASS_NAVIGATION_SCHOOL', Happiness
FROM Policy_BuildingClassHappiness WHERE PolicyType = 'POLICY_LEGALISM';

INSERT INTO Policy_BuildingClassProductionModifiers (PolicyType, BuildingClassType, ProductionModifier)
SELECT DISTINCT PolicyType, 'BUILDINGCLASS_NAVIGATION_SCHOOL', ProductionModifier
FROM Policy_BuildingClassProductionModifiers WHERE PolicyType = 'POLICY_LEGALISM';


---------------------------MILITATY_PORT-----------------------------------------------
INSERT INTO UnitPromotions
	(Type, Description, Help, Sound, LostWithUpgrade, CannotBeChosen, PortraitIndex, IconAtlas, PediaType, PediaEntry, OrderPriority, FlagPromoOrder)
VALUES
   ('PROMOTION_COAST_GUARD_2', 'TXT_KEY_PROMOTION_COAST_GUARD_2', 'TXT_KEY_PROMOTION_COAST_GUARD_2_HELP', 'AS2D_IF_LEVELUP', 0, 1, 29, 'PROMOTION_ATLAS_VP_06', 'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_COAST_GUARD_2', 160, 160);
   

   
UPDATE UnitPromotions SET FriendlyLandsModifier = 10 WHERE Type = 'PROMOTION_COAST_GUARD_2';   

 INSERT INTO Language_en_US (Tag, Text)
VALUES
    ('TXT_KEY_PROMOTION_COAST_GUARD_2', 'Patrol II'),
    ('TXT_KEY_PROMOTION_COAST_GUARD_2_HELP', '+10% [ICON_STRENGTH] Combat Strength [COLOR_POSITIVE_TEXT]Inside of Friendly Territory[ENDCOLOR].');




INSERT INTO BuildingClasses
			(Type,										Description,							DefaultBuilding)
VALUES	('BUILDINGCLASS_MILITATY_PORT',			'TXT_KEY_NEWWORLD_SCENARIO_BUILDING_MILITATY_PORT',	'BUILDING_MILITATY_PORT');



INSERT INTO Buildings
			(Type,								BuildingClass,							Description,						 Help, 											Civilopedia, 					   Strategy, 			              Cost,	GoldMaintenance, ConquestProb,	HurryCostModifier,	MinAreaSize, Water,	IconAtlas,				PortraitIndex)
VALUES		('BUILDING_MILITATY_PORT',	'BUILDINGCLASS_MILITATY_PORT',		'TXT_KEY_BUILDING_MILITATY_PORT',	'TXT_KEY_BUILDING_MILITATY_PORT_HELP',		'TXT_KEY_BUILDING_MILITATY_PORT_PEDIA', 	'TXT_KEY_BUILDING_MILITATY_PORT_STRATEGY',	 1250,	6, 						0,				-10,		     10,		1,  'BuildingPMOD_ICON_ATLAS',	7);



UPDATE Buildings SET
	PrereqTech 						= 'TECH_INDUSTRIALIZATION',
	CitySupplyFlat 					= 1, 
	TrainedFreePromotion 			= 'PROMOTION_COAST_GUARD_2',
	RangedStrikeModifier 			= 10
WHERE Type = 'BUILDING_MILITATY_PORT';

INSERT INTO UnitPromotions_UnitCombats
		(PromotionType,					UnitCombatType,			PediaType)
VALUES	('PROMOTION_COAST_GUARD_2',			'UNITCOMBAT_NAVALMELEE',	null); 

INSERT INTO Building_DomainProductionModifiers (BuildingType, DomainType, Modifier) VALUES
('BUILDING_MILITATY_PORT', 'DOMAIN_SEA', 15);

INSERT INTO Building_UnitCombatFreeExperiences
	(BuildingType, UnitCombatType, Experience)
VALUES
	('BUILDING_MILITATY_PORT', 'UNITCOMBAT_CARRIER', 5),
	('BUILDING_SEAPORT', 'UNITCOMBAT_CARRIER', 5);
	
INSERT INTO Building_ClassesNeededInCity
	(BuildingType, BuildingClassType)
VALUES
	('BUILDING_MILITATY_PORT', 'BUILDINGCLASS_SEAPORT');	
	
INSERT INTO Building_ClassNeededAnywhere
	(BuildingType, BuildingClassType)
VALUES
	('BUILDING_MILITATY_PORT', 'BUILDINGCLASS_NAVIGATION_SCHOOL');	
	
INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield)
SELECT 'BUILDING_MILITATY_PORT', 'YIELD_SCIENCE', 2;

INSERT INTO Unit_BuildingClassRequireds
	(UnitType, BuildingClassType)
VALUES
	('UNIT_CARRIER', 'BUILDINGCLASS_SEAPORT'),
	('UNIT_SUPERCARRIER', 'BUILDINGCLASS_SEAPORT'),
	('UNIT_BB_IRONCLAD', 'BUILDINGCLASS_SEAPORT'),
	('UNIT_BB_DREADNOUGHT', 'BUILDINGCLASS_SEAPORT'),
	('UNIT_YAMATO', 'BUILDINGCLASS_SEAPORT'),
    ('UNIT_BB_BATTLESHIP', 'BUILDINGCLASS_SEAPORT');	

INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) VALUES
('BUILDING_MILITATY_PORT', 'FLAVOR_NAVAL', 15),
('BUILDING_MILITATY_PORT', 'FLAVOR_MILITARY_TRAINING', 10),
('BUILDING_MILITATY_PORT', 'FLAVOR_CITY_DEFENSE', 10),
('BUILDING_MILITATY_PORT', 'FLAVOR_PRODUCTION', 10);


INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_BUILDING_MILITATY_PORT', 'Naval Base'),
('TXT_KEY_BUILDING_MILITATY_PORT_HELP', ''),
('TXT_KEY_BUILDING_MILITATY_PORT_STRATEGY', 'The Naval Base is a building which improves defense and naval production alson increases Military Units supplied by this City''s by 1.'),
('TXT_KEY_BUILDING_MILITATY_PORT_PEDIA', 'A Naval Base is a military base, where warships and naval ships are docked when they have no mission at sea or need to restock. Ships may also undergo repairs. Some naval bases are temporary homes to aircraft that usually stay on ships but are undergoing maintenance while the ship is in port.');
	
-------------- Seaport

DELETE FROM Building_DomainProductionModifiers WHERE BuildingType = 'BUILDING_SEAPORT';

UPDATE Buildings
SET
 CitySupplyModifier = 0
WHERE BuildingClass = 'BUILDINGCLASS_SEAPORT';