--=======================================================================================================================
-- MASTER TABLES
--=======================================================================================================================
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_UNIT_CREATED';
-------------------------------------------------------------------------------------------------------------------------
--======================================================================================================================================--
-- HELP
--======================================================================================================================================--
-- Water - city must be built NEXT TO a COAST tile or LAKE tile (MinAreaSize=10 is Sea, MinAreaSize=1 is Lake)
-- River - city must be built NEXT TO a RIVER
-- FreshWater - city must be built next to a RIVER or adjacent to a LAKE or OASIS tile
-- Mountain - city must be built NEXT TO a MOUNTAIN tile
-- NearbyMountainRequired - city must be built WITHIN 2 TILES OF a MOUNTAIN tile, Mountain must be within cultural borders
-- Hill - city must be built ON a HILL tile
-- Flat - city MUST NOT be built ON a HILL tile
-- HolyCity
-- (VP) IsNoWater - restricts Fresh Water (River, Lake)
-- (VP) IsNoRiver
-- (VP) AnyWater - requires any type of water (Lake, Coast, River)
-- (VP) CapitalOnly
-- (VP) ResourceType - allows for Building to be unlocked by a specific resource being owned (can be strategic or luxury)
-- (VP) RequiresRail - rail connection
--======================================================================================================================================--
-- ANCIENT ERA
--======================================================================================================================================--
-- NIPISAT
------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings SET
	Cost = (SELECT Cost FROM Buildings WHERE Type='BUILDING_PETRA'),
	NumPoliciesNeeded = (SELECT NumPoliciesNeeded FROM Buildings WHERE Type='BUILDING_PETRA'),
	PrereqTech = 'TECH_SAILING', MaxStartEra = 'ERA_CLASSICAL',
	Water = 1, MinAreaSize = 10, NearbyTerrainRequired = 'TERRAIN_TUNDRA',
	EnhancedYieldTech = (SELECT EnhancedYieldTech FROM Buildings WHERE Type='BUILDING_PETRA')
WHERE Type = 'BUILDING_NIPISAT';
	
INSERT INTO Building_TechEnhancedYieldChanges (BuildingType,YieldType,	Yield) 
SELECT	'BUILDING_NIPISAT', YieldType,	Yield FROM Building_TechEnhancedYieldChanges WHERE BuildingType='BUILDING_PETRA';

INSERT INTO Building_YieldChanges (BuildingType,YieldType,	Yield)
SELECT	'BUILDING_NIPISAT', YieldType,	Yield FROM Building_YieldChanges WHERE BuildingType='BUILDING_PETRA'; 

INSERT INTO Building_TerrainYieldChanges 
		(BuildingType,			TerrainType,		YieldType,		Yield) 
VALUES	('BUILDING_NIPISAT',	'TERRAIN_TUNDRA',	'YIELD_GOLD',	1),
		('BUILDING_NIPISAT',	'TERRAIN_SNOW',		'YIELD_GOLD',	1),
		('BUILDING_NIPISAT',	'TERRAIN_SNOW',		'YIELD_FOOD',	1);
		
INSERT INTO Building_ImprovementYieldChangesGlobal
		(BuildingType,			ImprovementType,			YieldType,			Yield) 
VALUES	('BUILDING_NIPISAT',	'IMPROVEMENT_FISHING_BOATS','YIELD_PRODUCTION',	1),
		('BUILDING_NIPISAT',	'IMPROVEMENT_FISHING_BOATS','YIELD_CULTURE_LOCAL',	1);

INSERT INTO Building_ResourceYieldChangesGlobal 
(BuildingType,			ResourceType,		YieldType,			Yield) VALUES
('BUILDING_NIPISAT', 	'RESOURCE_DEER',	'YIELD_PRODUCTION',	1),
('BUILDING_NIPISAT', 	'RESOURCE_DEER',	'YIELD_CULTURE',	1);

INSERT INTO Building_Flavors 	
		(BuildingType, 			FlavorType,						Flavor)
VALUES	('BUILDING_NIPISAT',	'FLAVOR_NAVAL_GROWTH', 				10),
		('BUILDING_NIPISAT',	'FLAVOR_GOLD', 						20),		
		('BUILDING_NIPISAT',	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	15),
		('BUILDING_NIPISAT',	'FLAVOR_PRODUCTION', 				10);
--======================================================================================================================================--
-- CLASSICAL ERA
--======================================================================================================================================--
-- TEMPLE OF HERACLES AKRAGATOS
------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings SET
	Cost = (SELECT Cost FROM Buildings WHERE Type='BUILDING_ORACLE'),
	NumPoliciesNeeded = (SELECT NumPoliciesNeeded FROM Buildings WHERE Type='BUILDING_ORACLE'),
	PrereqTech = (SELECT PrereqTech FROM Buildings WHERE Type='BUILDING_ORACLE'),
	MaxStartEra = (SELECT MaxStartEra FROM Buildings WHERE Type='BUILDING_ORACLE'),
	Hill = 1, EnhancedYieldTech ='TECH_ARCHAEOLOGY', TechEnhancedTourism= 3
WHERE Type = 'BUILDING_AKRAGATOS';	
		
INSERT INTO Building_BuildingClassYieldChanges 
		(BuildingType,			BuildingClassType,		YieldType,			YieldChange) 
VALUES	('BUILDING_AKRAGATOS',	'BUILDINGCLASS_SHRINE',	'YIELD_GOLDEN_AGE_POINTS',	1),
		('BUILDING_AKRAGATOS',	'BUILDINGCLASS_SHRINE',	'YIELD_CULTURE',			1),
		('BUILDING_AKRAGATOS',	'BUILDINGCLASS_SHRINE',	'YIELD_FOOD',				1);
		
INSERT INTO Building_YieldChanges 
		(BuildingType,			YieldType,		Yield) 
VALUES	('BUILDING_AKRAGATOS',	'YIELD_CULTURE',2),
		('BUILDING_AKRAGATOS',	'YIELD_FAITH',	4);

INSERT INTO Building_FreeUnits 
(BuildingType,			UnitType,		NumUnits) VALUES
('BUILDING_AKRAGATOS',	'UNIT_SETTLER',	1);
		
INSERT INTO Building_Flavors 	
		(BuildingType, 			FlavorType,			Flavor)
VALUES	('BUILDING_AKRAGATOS',	'FLAVOR_CULTURE', 	15),
		('BUILDING_AKRAGATOS',	'FLAVOR_EXPANSION', 20),
		('BUILDING_AKRAGATOS',	'FLAVOR_RELIGION', 	30);
------------------------------------------------------------------------------------------------------------------------------------------
-- PISCINA MIRABILIS
------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings SET
	Cost = (SELECT Cost FROM Buildings WHERE Type='BUILDING_GREAT_WALL'),
	NumPoliciesNeeded = (SELECT NumPoliciesNeeded FROM Buildings WHERE Type='BUILDING_GREAT_WALL'),
	PrereqTech = (SELECT PrereqTech FROM Buildings WHERE Type='BUILDING_GREAT_WALL'),
	MaxStartEra = (SELECT MaxStartEra FROM Buildings WHERE Type='BUILDING_GREAT_WALL'),
	Water = 1, MinAreaSize = 10, SpecialistType = 'SPECIALIST_ENGINEER', GreatPeopleRateChange = 1
WHERE Type = 'BUILDING_PISCINA_MIR';

INSERT INTO Building_ClassesNeededInCity 
		(BuildingType,			BuildingClassType) 
SELECT	'BUILDING_PISCINA_MIR',	'BUILDINGCLASS_AQUEDUCT';

INSERT INTO Building_YieldFromYieldPercentGlobal
		(BuildingType,				YieldIn,		YieldOut,						Value) 
VALUES	('BUILDING_PISCINA_MIR',	'YIELD_FOOD',	'YIELD_GREAT_ADMIRAL_POINTS',	10);

INSERT INTO Building_BuildingClassYieldChanges 
		(BuildingType,				BuildingClassType,			YieldType,		YieldChange) 
VALUES	('BUILDING_PISCINA_MIR',	'BUILDINGCLASS_AQUEDUCT',	'YIELD_PRODUCTION',	2);

INSERT INTO Building_YieldChanges 
		(BuildingType,				YieldType,		Yield) 
VALUES	('BUILDING_PISCINA_MIR',	'YIELD_FOOD',	3),
		('BUILDING_PISCINA_MIR',	'YIELD_GREAT_ADMIRAL_POINTS',	2);

INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType,			Flavor)
VALUES	('BUILDING_PISCINA_MIR',	'FLAVOR_NAVAL', 		15),
		('BUILDING_PISCINA_MIR',	'FLAVOR_NAVAL_GROWTH', 20),
		('BUILDING_PISCINA_MIR',	'FLAVOR_PRODUCTION', 	5);
------------------------------------------------------------------------------------------------------------------------------------------
-- BANAUE RICE TERRACES
------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings SET
	Cost = (SELECT Cost FROM Buildings WHERE Type='BUILDING_ANGKOR_WAT'),
	NumPoliciesNeeded = (SELECT NumPoliciesNeeded FROM Buildings WHERE Type='BUILDING_ANGKOR_WAT'),
	PrereqTech = (SELECT PrereqTech FROM Buildings WHERE Type='BUILDING_ANGKOR_WAT'),
	MaxStartEra = (SELECT MaxStartEra FROM Buildings WHERE Type='BUILDING_ANGKOR_WAT'),
	NearbyMountainRequired = 1
WHERE Type = 'BUILDING_BANAUE';

INSERT INTO Building_YieldChanges 
		(BuildingType,		YieldType,		Yield) 
VALUES	('BUILDING_BANAUE',	'YIELD_FOOD',		3);

INSERT INTO Building_BuildingClassYieldChanges 
		(BuildingType,		BuildingClassType,			YieldType,		YieldChange) 
VALUES	('BUILDING_BANAUE',	'BUILDINGCLASS_GRANARY',	'YIELD_FOOD',	2);

INSERT INTO Building_YieldModifiers
		(BuildingType, YieldType, Yield)
VALUES	('BUILDING_BANAUE', 'YIELD_FOOD', 10);

INSERT INTO Building_ResourceYieldChangesGlobal 
(BuildingType,			ResourceType,		YieldType,			Yield) VALUES
('BUILDING_BANAUE', 	'RESOURCE_RICE',	'YIELD_FOOD',		1),
('BUILDING_BANAUE', 	'RESOURCE_RICE',	'YIELD_CULTURE',	2);
--======================================================================================================================================--
-- MEDIEVAL ERA
--======================================================================================================================================--
-- KELDUR HALL
------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings SET
	Cost = (SELECT Cost FROM Buildings WHERE Type='BUILDING_FORBIDDEN_PALACE'),	PrereqTech = 'TECH_GUILDS',
	NumPoliciesNeeded = (SELECT NumPoliciesNeeded FROM Buildings WHERE Type='BUILDING_FORBIDDEN_PALACE'),
	MaxStartEra = (SELECT MaxStartEra FROM Buildings WHERE Type='BUILDING_FORBIDDEN_PALACE'),
	NearbyTerrainRequired = 'TERRAIN_TUNDRA', ProhibitedCityTerrain ='TERRAIN_PLAINS'
WHERE Type = 'BUILDING_KELDUR_HALL';

INSERT INTO Building_YieldChanges
(BuildingType, 			YieldType, Yield) VALUES
('BUILDING_KELDUR_HALL', 'YIELD_SCIENCE', 5),
('BUILDING_KELDUR_HALL', 'YIELD_CULTURE', 2);

INSERT INTO Building_ImprovementYieldChangesGlobal
(BuildingType,				ImprovementType,			YieldType,		Yield)	VALUES
('BUILDING_KELDUR_HALL',	'IMPROVEMENT_TRADING_POST',	'YIELD_FOOD',	2);

INSERT INTO Building_YieldFromYieldPercentGlobal
(BuildingType,				YieldIn,			YieldOut,		Value) VALUES
('BUILDING_KELDUR_HALL',	'YIELD_SCIENCE',	'YIELD_FOOD',	10);

INSERT INTO Building_TerrainYieldChanges
(BuildingType, 			TerrainType,		YieldType, Yield) VALUES
('BUILDING_KELDUR_HALL', 'TERRAIN_TUNDRA',	'YIELD_FOOD', 		1),
('BUILDING_KELDUR_HALL', 'TERRAIN_TUNDRA',	'YIELD_PRODUCTION', 1);

INSERT INTO Building_YieldPerXTerrainTimes100
		(BuildingType,			TerrainType,			YieldType,			Yield) 
SELECT	'BUILDING_KELDUR_HALL',	'TERRAIN_SNOW',		'YIELD_FOOD',		100 UNION ALL
SELECT	'BUILDING_KELDUR_HALL',	'TERRAIN_SNOW',		'YIELD_PRODUCTION',	100;

INSERT INTO Building_Flavors 	
(BuildingType, 				FlavorType,			Flavor) VALUES
('BUILDING_KELDUR_HALL',	'FLAVOR_GROWTH', 	30),
('BUILDING_KELDUR_HALL',	'FLAVOR_PRODUCTION', 20),
('BUILDING_KELDUR_HALL',	'FLAVOR_CULTURE', 	10);
------------------------------------------------------------------------------------------------------------------------------------------
-- SAINT CATHERINE'S MONASTERY
------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings SET
	Cost = (SELECT Cost FROM Buildings WHERE Type='BUILDING_HAGIA_SOPHIA'),
	NumPoliciesNeeded = (SELECT NumPoliciesNeeded FROM Buildings WHERE Type='BUILDING_HAGIA_SOPHIA'),
	PrereqTech = (SELECT PrereqTech FROM Buildings WHERE Type='BUILDING_HAGIA_SOPHIA'),
	MaxStartEra = (SELECT MaxStartEra FROM Buildings WHERE Type='BUILDING_HAGIA_SOPHIA'),
	HolyCity = 1, FreeBuildingThisCity = 'BUILDINGCLASS_MONASTERY', SpecialistType = 'SPECIALIST_WRITER', GreatPeopleRateChange = 4,
	GreatWorkSlotType = 'GREAT_WORK_SLOT_LITERATURE', GreatWorkCount = 2, ThemingBonusHelp = 'TXT_KEY_THEMING_BONUS_ST_CATHERINE_HELP'
WHERE Type = 'BUILDING_ST_CATHERINE';


INSERT INTO Building_GreatWorkYieldChangesLocal
(BuildingType, YieldType, Yield) VALUES
('BUILDING_ST_CATHERINE', 'YIELD_FAITH', 2),
('BUILDING_ST_CATHERINE', 'YIELD_CULTURE', 2);

INSERT INTO Building_ThemingBonuses
(BuildingType,				Description,					Bonus,	RequiresOwner,	AIPriority)	VALUES
('BUILDING_ST_CATHERINE', 'TXT_KEY_THEMING_BONUS_ST_CATHERINE', 7,		1,				5);

INSERT INTO Building_ThemingYieldBonus
(BuildingType,		YieldType,			Yield) VALUES
('BUILDING_ST_CATHERINE', 'YIELD_FOOD',		4),
('BUILDING_ST_CATHERINE', 'YIELD_FAITH',	4);

INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType,				Flavor)
VALUES	('BUILDING_ST_CATHERINE',	'FLAVOR_RELIGION', 		10),
		('BUILDING_ST_CATHERINE',	'FLAVOR_CULTURE', 		40);
------------------------------------------------------------------------------------------------------------------------------------------
-- SONGYUE PAGODA
------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings SET
	Cost = (SELECT Cost FROM Buildings WHERE Type='BUILDING_HAGIA_SOPHIA'),
	NumPoliciesNeeded = (SELECT NumPoliciesNeeded FROM Buildings WHERE Type='BUILDING_HAGIA_SOPHIA'),
	PrereqTech = (SELECT PrereqTech FROM Buildings WHERE Type='BUILDING_HAGIA_SOPHIA'),
	MaxStartEra = (SELECT MaxStartEra FROM Buildings WHERE Type='BUILDING_HAGIA_SOPHIA'),
	HolyCity = 1, FreeBuildingThisCity = 'BUILDINGCLASS_PAGODA',
	SpecialistType = 'SPECIALIST_SCIENTIST', SpecialistCount = 1
WHERE Type = 'BUILDING_SONGYUE_PAGODA';

INSERT INTO Building_YieldChanges 
(BuildingType,				YieldType,		Yield) VALUES
('BUILDING_SONGYUE_PAGODA',	'YIELD_FAITH',2);

INSERT INTO Building_SpecialistYieldChanges
(BuildingType,				SpecialistType,			YieldType,		Yield) VALUES
('BUILDING_SONGYUE_PAGODA',	'SPECIALIST_SCIENTIST',	'YIELD_FAITH',	2);
	
INSERT INTO Building_ImprovementYieldChangesGlobal 
(BuildingType,				ImprovementType,			YieldType,			Yield) VALUES
('BUILDING_SONGYUE_PAGODA',	'IMPROVEMENT_HOLY_SITE',	'YIELD_SCIENCE',	3);

INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType,				Flavor)
VALUES	('BUILDING_SONGYUE_PAGODA',	'FLAVOR_RELIGION', 		10),
		('BUILDING_SONGYUE_PAGODA',	'FLAVOR_SCIENCE', 		30);

INSERT INTO Building_FreeUnits 
(BuildingType,				UnitType,			NumUnits) VALUES
('BUILDING_SONGYUE_PAGODA',	'UNIT_JAR_HESHANG',	1);

INSERT INTO UnitClasses
		(Type, 						DefaultUnit,		  Description)
SELECT	'UNITCLASS_JAR_HESHANG',	'UNIT_JAR_HESHANG', 'TXT_KEY_UNIT_JAR_HESHANG';

INSERT INTO Units 	
		(Type, 				Class,						CombatClass, Cost, FaithCost,	Combat, MoveAfterPurchase, RangedCombat, Range, RequiresFaithPurchaseEnabled, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	Description, 				ShowInPedia, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, UnitArtInfo, 					UnitFlagAtlas, 				UnitFlagIconOffset, IconAtlas,						PortraitIndex)
SELECT	'UNIT_JAR_HESHANG',	'UNITCLASS_JAR_HESHANG',	CombatClass, -1, 	-1, 		Combat, MoveAfterPurchase, RangedCombat, Range, RequiresFaithPurchaseEnabled, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	'TXT_KEY_UNIT_JAR_HESHANG',			0, 	 OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, 'ART_DEF_UNIT_JAR_HESHANG',	'FLAG_UNIT_JAR_HESHANG',	0,					'UNIT_JAR_HESHANG_ICON_ATLAS',	0
FROM Units WHERE Type = 'UNIT_WORKER';

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 			SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JAR_HESHANG',	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_MISSIONARY';

INSERT INTO Unit_AITypes 	
		(UnitType, 			UnitAIType)
SELECT	'UNIT_JAR_HESHANG',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_WORKER';

INSERT INTO Unit_Flavors 	
		(UnitType, 			FlavorType, Flavor)
SELECT	'UNIT_JAR_HESHANG',	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_WORKER';

INSERT INTO Unit_Builds 
		(UnitType,			BuildType)
SELECT	'UNIT_JAR_HESHANG',	'BUILD_HOLY_SITE';

INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType,				TileType,	Asset)
VALUES	('ART_DEF_UNIT_JAR_HESHANG',	'Unit',		'sv_Heshang.dds');

INSERT INTO ArtDefine_UnitInfos
        (Type,                       DamageStates,  Formation)
VALUES  ('ART_DEF_UNIT_JAR_HESHANG', 1,            'EarlyGreatMerchant');

INSERT INTO ArtDefine_UnitInfoMemberInfos
        (UnitInfoType,              UnitMemberInfoType, NumMembers)
SELECT	'ART_DEF_UNIT_JAR_HESHANG', UnitMemberInfoType,	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_MISSIONARY';

INSERT INTO IconTextureAtlases 
		(Atlas, 						IconSize, 	Filename, 					IconsPerRow, 	IconsPerColumn)
VALUES	('UNIT_JAR_HESHANG_ICON_ATLAS', 256, 		'atlas_Heshang256.dds',		1, 				1),
		('UNIT_JAR_HESHANG_ICON_ATLAS', 128, 		'atlas_Heshang128.dds',		1, 				1),
		('UNIT_JAR_HESHANG_ICON_ATLAS', 80, 		'atlas_Heshang080.dds',		1, 				1),
		('UNIT_JAR_HESHANG_ICON_ATLAS', 64, 		'atlas_Heshang064.dds',		1, 				1),
		('UNIT_JAR_HESHANG_ICON_ATLAS', 45, 		'atlas_Heshang045.dds',		1, 				1),
		('FLAG_UNIT_JAR_HESHANG',		32, 		'flag_Heshang.dds',			1, 				1);
------------------------------------------------------------------------------------------------------------------------------------------
-- HORYU-JI
------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings SET
	Cost = (SELECT Cost FROM Buildings WHERE Type='BUILDING_HAGIA_SOPHIA'),
	NumPoliciesNeeded = (SELECT NumPoliciesNeeded FROM Buildings WHERE Type='BUILDING_HAGIA_SOPHIA'),
	PrereqTech = (SELECT PrereqTech FROM Buildings WHERE Type='BUILDING_HAGIA_SOPHIA'),
	MaxStartEra = (SELECT MaxStartEra FROM Buildings WHERE Type='BUILDING_HAGIA_SOPHIA'), River= 1, Flat= 1, ReligiousPressureModifier= 25,
	FreeBuildingThisCity = 'BUILDINGCLASS_PAGODA', SpecialistType = 'SPECIALIST_WRITER', SpecialistCount=1, GreatPeopleRateChange = 1
WHERE Type = 'BUILDING_HORYUJI';

INSERT INTO Building_YieldChanges 
(BuildingType,			YieldType,		Yield) VALUES
('BUILDING_HORYUJI',	'YIELD_CULTURE',1),
('BUILDING_HORYUJI',	'YIELD_FAITH',1);

INSERT INTO Building_SpecialistYieldChanges
		(BuildingType,			SpecialistType,			YieldType,		Yield) 
VALUES	('BUILDING_HORYUJI',	'SPECIALIST_WRITER',	'YIELD_FAITH',	2);
------------------------------------------------------------------------------------------------------------------------------------------
-- GREAT KYZ KALA
------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings SET
	Cost = (SELECT Cost FROM Buildings WHERE Type='BUILDING_ALHAMBRA'),
	NumPoliciesNeeded = (SELECT NumPoliciesNeeded FROM Buildings WHERE Type='BUILDING_ALHAMBRA'),
	PrereqTech = (SELECT PrereqTech FROM Buildings WHERE Type='BUILDING_ALHAMBRA'),
	MaxStartEra = (SELECT MaxStartEra FROM Buildings WHERE Type='BUILDING_ALHAMBRA'),
	SpecialistType = 'SPECIALIST_CIVIL_SERVANT', SpecialistCount=1, FreeBuildingThisCity = 'BUILDINGCLASS_CASTLE', Defense = 500
WHERE Type = 'BUILDING_KYZ_KALA';

INSERT INTO Building_LocalFeatureOrs 
		(BuildingType,				FeatureType) 
SELECT	'BUILDING_KYZ_KALA',	'FEATURE_OASIS';

INSERT INTO Building_YieldChanges 
		(BuildingType,			YieldType,		Yield) 
VALUES	('BUILDING_KYZ_KALA',	'YIELD_CULTURE',2),
		('BUILDING_KYZ_KALA',	'YIELD_GREAT_GENERAL_POINTS',	2);
		
INSERT INTO Building_YieldFromConstruction
		(BuildingType, 			YieldType, Yield)
VALUES	('BUILDING_KYZ_KALA', 'YIELD_FOOD', 25);

INSERT INTO	Policies
		(Type, 				Description, 					IsDummy)
VALUES	('POLICY_KYZ_KALA',	'TXT_KEY_BUILDING_KYZ_KALA',	1);

INSERT INTO Policy_FeatureYieldChanges
		(PolicyType, 		FeatureType, 		YieldType, Yield)
VALUES	('POLICY_KYZ_KALA', 'FEATURE_OASIS', 'YIELD_CULTURE', 1),
		('POLICY_KYZ_KALA', 'FEATURE_OASIS', 'YIELD_PRODUCTION', 1),
		('POLICY_KYZ_KALA', 'FEATURE_OASIS', 'YIELD_GOLDEN_AGE_POINTS', 1);
		
INSERT INTO Building_Flavors 	
		(BuildingType, 			FlavorType,			Flavor)
VALUES	('BUILDING_KYZ_KALA',	'FLAVOR_CITY_DEFENSE', 	45),
		('BUILDING_KYZ_KALA',	'FLAVOR_CULTURE', 		5),
		('BUILDING_KYZ_KALA',	'FLAVOR_DIPLOMACY', 	15);
------------------------------------------------------------------------------------------------------------------------------------------
-- SHAOLIN TEMPLE
------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings SET
	Cost = (SELECT Cost FROM Buildings WHERE Type='BUILDING_ALHAMBRA'),
	NumPoliciesNeeded = (SELECT NumPoliciesNeeded FROM Buildings WHERE Type='BUILDING_ALHAMBRA'),
	PrereqTech = (SELECT PrereqTech FROM Buildings WHERE Type='BUILDING_ALHAMBRA'),
	MaxStartEra = (SELECT MaxStartEra FROM Buildings WHERE Type='BUILDING_ALHAMBRA'), NearbyMountainRequired = 1,
	FreeBuilding = 'BUILDINGCLASS_DUMMY_SHAOLIN', FreeBuildingThisCity = 'BUILDINGCLASS_ORDER'
WHERE Type = 'BUILDING_SHAOLIN';

INSERT INTO Building_YieldChanges 
		(BuildingType,			YieldType,		Yield) 
VALUES	('BUILDING_SHAOLIN',	'YIELD_FAITH',	3);

INSERT INTO Building_YieldFromYieldPercentGlobal
		(BuildingType,			YieldIn,		YieldOut,						Value) 
VALUES	('BUILDING_SHAOLIN',	'YIELD_FAITH',	'YIELD_GREAT_GENERAL_POINTS',	10);
		
INSERT OR REPLACE INTO BuildingClasses
(DefaultBuilding, 			Type,							Description) VALUES	
('BUILDING_DUMMY_SHAOLIN',	'BUILDINGCLASS_DUMMY_SHAOLIN',	'TXT_KEY_BUILDING_SHAOLIN');

INSERT OR REPLACE INTO Buildings
(Type, 						BuildingClass, 					IsDummy,	Cost,	FaithCost,	GreatWorkCount,	PrereqTech,	MinAreaSize,	Description) VALUES	
('BUILDING_DUMMY_SHAOLIN', 	'BUILDINGCLASS_DUMMY_SHAOLIN',	1,			-1,		-1,			-1,				null,		-1,				'TXT_KEY_BUILDING_SHAOLIN');
INSERT INTO Building_DomainFreeExperiences
		(BuildingType, 			DomainType, Experience)
VALUES	('BUILDING_DUMMY_SHAOLIN', 'DOMAIN_LAND', 20),
		('BUILDING_DUMMY_SHAOLIN', 'DOMAIN_SEA', 20),
		('BUILDING_DUMMY_SHAOLIN', 'DOMAIN_AIR', 20);
------------------------------------------------------------------------------------------------------------------------------------------
-- BASILICA OF SAINT FRANCIS OF ASSISI
------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings SET
	Cost = (SELECT Cost FROM Buildings WHERE Type='BUILDING_FORBIDDEN_PALACE'),
	NumPoliciesNeeded = (SELECT NumPoliciesNeeded FROM Buildings WHERE Type='BUILDING_FORBIDDEN_PALACE'),
	PrereqTech = (SELECT PrereqTech FROM Buildings WHERE Type='BUILDING_FORBIDDEN_PALACE'),
	MaxStartEra = (SELECT MaxStartEra FROM Buildings WHERE Type='BUILDING_FORBIDDEN_PALACE'),
	FreeBuildingThisCity = 'BUILDINGCLASS_CATHEDRAL', Hill = 1, IsNoCoast= 1,
	GreatWorkSlotType = 'GREAT_WORK_SLOT_ART_ARTIFACT',	GreatWorkCount = 1,
	SpecialistType = 'SPECIALIST_ARTIST', SpecialistCount=1, GreatPeopleRateChange = 1
WHERE Type = 'BUILDING_ASSISI';

INSERT OR REPLACE INTO Building_YieldChanges
		(BuildingType, 		YieldType, 		Yield)
SELECT	'BUILDING_ASSISI', 	'YIELD_CULTURE', 	3 UNION ALL
SELECT	'BUILDING_ASSISI', 	'YIELD_TOURISM', 	3 UNION ALL
SELECT	'BUILDING_ASSISI', 	'YIELD_FAITH', 		3;
		
INSERT INTO Building_BuildingClassYieldChanges
				(BuildingType, 		BuildingClassType,	YieldType, YieldChange)
SELECT DISTINCT	'BUILDING_ASSISI', a.Type, 				'YIELD_GOLD', 1
FROM BuildingClasses a, Buildings b, Building_YieldChanges c
WHERE a.Type = b.BuildingClass AND b.Type = c.BuildingType AND a.DefaultBuilding = b.Type
AND a.MaxGlobalInstances = -1 AND a.MaxPlayerInstances = -1 AND b.IsDummy = 0 AND c.YieldType = 'YIELD_FAITH';

INSERT INTO Building_Flavors 	
		(BuildingType, 		FlavorType,			Flavor)
VALUES	('BUILDING_ASSISI',	'FLAVOR_RELIGION', 	30),
		('BUILDING_ASSISI',	'FLAVOR_CULTURE', 	25),
		('BUILDING_ASSISI',	'FLAVOR_GOLD', 		20);
------------------------------------------------------------------------------------------------------------------------------------------
-- CHURCH OF THE NATIVITY
------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings SET
	Cost = (SELECT Cost FROM Buildings WHERE Type='BUILDING_FORBIDDEN_PALACE'),	PrereqTech = 'TECH_COMPASS',
	NumPoliciesNeeded = (SELECT NumPoliciesNeeded FROM Buildings WHERE Type='BUILDING_FORBIDDEN_PALACE'),
	MaxStartEra = (SELECT MaxStartEra FROM Buildings WHERE Type='BUILDING_FORBIDDEN_PALACE'), 
	Hill=1, FreeBuildingThisCity = 'BUILDINGCLASS_CHURCH' 
WHERE Type = 'BUILDING_CHURCH_NATIVITY';

INSERT OR REPLACE INTO Building_YieldChanges
		(BuildingType, 				YieldType, 		Yield)
SELECT	'BUILDING_CHURCH_NATIVITY', 'YIELD_TOURISM', 	2 UNION ALL
SELECT	'BUILDING_CHURCH_NATIVITY', 'YIELD_CULTURE', 	2 UNION ALL
SELECT	'BUILDING_CHURCH_NATIVITY', 'YIELD_FAITH', 		2;

INSERT INTO	Policies
(Type, 						Description, 					IsDummy) VALUES
('POLICY_CHURCH_NATIVITY',	'TXT_KEY_BUILDING_CHURCH_NATIVITY',		1);

INSERT INTO Policy_YieldChangesPerReligion
		(PolicyType, 			YieldType, 			Yield)
SELECT 'POLICY_CHURCH_NATIVITY', 'YIELD_PRODUCTION', 200 UNION ALL
SELECT 'POLICY_CHURCH_NATIVITY', 'YIELD_FAITH', 	200;

INSERT INTO Building_Flavors 	
		(BuildingType, 					FlavorType,			Flavor)
VALUES	('BUILDING_CHURCH_NATIVITY',	'FLAVOR_RELIGION', 	30),
		('BUILDING_CHURCH_NATIVITY',	'FLAVOR_PRODUCTION', 25);
------------------------------------------------------------------------------------------------------------------------------------------
-- HOSPITAL OF ST. JOHN
------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings SET
	Cost = (SELECT Cost FROM Buildings WHERE Type='BUILDING_FORBIDDEN_PALACE'),
	NumPoliciesNeeded = (SELECT NumPoliciesNeeded FROM Buildings WHERE Type='BUILDING_FORBIDDEN_PALACE'),
	PrereqTech = (SELECT PrereqTech FROM Buildings WHERE Type='BUILDING_FORBIDDEN_PALACE'),
	MaxStartEra = (SELECT MaxStartEra FROM Buildings WHERE Type='BUILDING_FORBIDDEN_PALACE'),
	FreeBuildingThisCity = 'BUILDINGCLASS_ORDER', AlwaysHeal=10, ExtraCityHitPoints=100, HolyCity = 1
WHERE Type = 'BUILDING_HOSPITAL_STJOHN';

INSERT INTO Building_YieldFromYieldPercentGlobal
(BuildingType, YieldIn, YieldOut, Value) VALUES
('BUILDING_HOSPITAL_STJOHN', 'YIELD_FAITH', 'YIELD_FOOD', 15);

INSERT INTO Building_YieldChanges 
		(BuildingType,					YieldType,		Yield) 
VALUES	('BUILDING_HOSPITAL_STJOHN',	'YIELD_FAITH',	2),
		('BUILDING_HOSPITAL_STJOHN',	'YIELD_GREAT_GENERAL_POINTS',	2);
------------------------------------------------------------------------------------------------------------------------------------------
-- TLACHIHUALTEPETL
------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings SET
	Cost = (SELECT Cost FROM Buildings WHERE Type='BUILDING_FORBIDDEN_PALACE'),
	PrereqTech = (SELECT PrereqTech FROM Buildings WHERE Type='BUILDING_FORBIDDEN_PALACE'),
	NumPoliciesNeeded = (SELECT NumPoliciesNeeded FROM Buildings WHERE Type='BUILDING_FORBIDDEN_PALACE'),
	MaxStartEra = (SELECT MaxStartEra FROM Buildings WHERE Type='BUILDING_FORBIDDEN_PALACE'),
	HolyCity = 1, FreeBuildingThisCity = 'BUILDINGCLASS_TEOCALLI', SpecialistType = 'SPECIALIST_ENGINEER', GreatPeopleRateChange = 2
WHERE Type = 'BUILDING_TLACHIHUALTEPETL';

INSERT INTO Building_YieldChanges 
(BuildingType,					YieldType,		Yield) VALUES
('BUILDING_TLACHIHUALTEPETL',	'YIELD_FAITH',		2),
('BUILDING_TLACHIHUALTEPETL',	'YIELD_CULTURE',	2),
('BUILDING_TLACHIHUALTEPETL',	'YIELD_PRODUCTION',	2),
('BUILDING_TLACHIHUALTEPETL',	'YIELD_GOLDEN_AGE_POINTS',	2);

INSERT INTO	Policies
(Type, 						Description, 					IsDummy) VALUES
('POLICY_TLACHIHUALTEPETL',	'TXT_KEY_BUILDING_TLACHIHUALTEPETL',		1);

INSERT INTO Policy_YieldFromConstruction
(PolicyType, 			YieldType, Yield) VALUES 
('POLICY_TLACHIHUALTEPETL', 'YIELD_FAITH', 10),
('POLICY_TLACHIHUALTEPETL', 'YIELD_GREAT_GENERAL_POINTS', 5),
('POLICY_TLACHIHUALTEPETL', 'YIELD_GOLDEN_AGE_POINTS', 5);
------------------------------------------------------------------------------------------------------------------------------------------
-- OLD NEW SYNAGOGUE
------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings SET
	Cost = (SELECT Cost FROM Buildings WHERE Type='BUILDING_FORBIDDEN_PALACE'),	PrereqTech = 'TECH_COMPASS',
	NumPoliciesNeeded = (SELECT NumPoliciesNeeded FROM Buildings WHERE Type='BUILDING_FORBIDDEN_PALACE'),
	MaxStartEra = (SELECT MaxStartEra FROM Buildings WHERE Type='BUILDING_FORBIDDEN_PALACE'),
	FreeBuildingThisCity = 'BUILDINGCLASS_SYNAGOGUE', River=1,
	SpecialistType = 'SPECIALIST_MERCHANT', SpecialistCount=1, WLTKDTurns= 15 -- requirement: minority with >=4 followers
WHERE Type = 'BUILDING_OLD_NEW_SYNAGOGUE';

INSERT INTO Building_YieldChanges 
(BuildingType,					YieldType,	Yield) VALUES
('BUILDING_OLD_NEW_SYNAGOGUE',	'YIELD_FAITH',	2),
('BUILDING_OLD_NEW_SYNAGOGUE',	'YIELD_GOLD',	3);

INSERT INTO	Policies
(Type, 						Description, 						IsDummy) VALUES
('POLICY_OLD_NEW_SYNAGOGUE','TXT_KEY_BUILDING_OLD_NEW_SYNAGOGUE',	1);

INSERT INTO Policy_WLTKDYieldMod
(PolicyType, 				YieldType, 			Yield) VALUES
('POLICY_OLD_NEW_SYNAGOGUE','YIELD_FAITH', 		10),
('POLICY_OLD_NEW_SYNAGOGUE','YIELD_CULTURE',	10),
('POLICY_OLD_NEW_SYNAGOGUE','YIELD_GOLD',		10);
------------------------------------------------------------------------------------------------------------------------------------------
-- JETAVANARAMAYA
------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings SET
	Cost = (SELECT Cost FROM Buildings WHERE Type='BUILDING_FORBIDDEN_PALACE'),	PrereqTech = 'TECH_COMPASS',
	NumPoliciesNeeded = (SELECT NumPoliciesNeeded FROM Buildings WHERE Type='BUILDING_FORBIDDEN_PALACE'),
	MaxStartEra = (SELECT MaxStartEra FROM Buildings WHERE Type='BUILDING_FORBIDDEN_PALACE'),
	SpecialistType = 'SPECIALIST_ENGINEER', GreatPeopleRateChange = 2, FoodKept= 10, 
	FreeBuilding = 'BUILDINGCLASS_DUMMY_JETAVANARAMAYA', FreeBuildingThisCity = 'BUILDINGCLASS_STUPA' -- requirement Village   
WHERE Type = 'BUILDING_JETAVANARAMAYA';

INSERT INTO Building_LocalFeatureOrs 
		(BuildingType,				FeatureType)
SELECT	'BUILDING_JETAVANARAMAYA',	'FEATURE_FOREST' UNION ALL
SELECT	'BUILDING_JETAVANARAMAYA',	'FEATURE_JUNGLE';

INSERT INTO Building_YieldChanges 
(BuildingType,				YieldType,	Yield) VALUES
('BUILDING_JETAVANARAMAYA',	'YIELD_FOOD',	3),
('BUILDING_JETAVANARAMAYA',	'YIELD_FAITH',	1);

INSERT INTO Building_ImprovementYieldChangesGlobal
(BuildingType,				ImprovementType,			YieldType,		Yield)	VALUES
('BUILDING_JETAVANARAMAYA',	'IMPROVEMENT_TRADING_POST',	'YIELD_FAITH',	2);

INSERT OR REPLACE INTO BuildingClasses
(DefaultBuilding, 					Type,										Description) VALUES	
('BUILDING_DUMMY_JETAVANARAMAYA',	'BUILDINGCLASS_DUMMY_JETAVANARAMAYA',		'TXT_KEY_BUILDING_JETAVANARAMAYA');

INSERT OR REPLACE INTO Buildings
(Type, 						 		BuildingClass, 							IsDummy,	Cost,	FaithCost,	GreatWorkCount,	PrereqTech,	MinAreaSize,	Description) VALUES	
('BUILDING_DUMMY_JETAVANARAMAYA', 	'BUILDINGCLASS_DUMMY_JETAVANARAMAYA',	1,			-1,		-1,			-1,				null,		-1,				'TXT_KEY_BUILDING_JETAVANARAMAYA');
UPDATE Buildings SET FoodKept= 10 WHERE TYPE = 'BUILDING_DUMMY_JETAVANARAMAYA';
--======================================================================================================================================--
-- RENAISSANCE ERA
--======================================================================================================================================--
-- BOTANICAL GARDEN OF PADUA
------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings SET
	Cost = (SELECT Cost FROM Buildings WHERE Type='BUILDING_GLOBE_THEATER'), PrereqTech = 'TECH_BANKING',
	NumPoliciesNeeded = (SELECT NumPoliciesNeeded FROM Buildings WHERE Type='BUILDING_GLOBE_THEATER'),
	MaxStartEra = (SELECT MaxStartEra FROM Buildings WHERE Type='BUILDING_GLOBE_THEATER'),
	SpecialistType = 'SPECIALIST_SCIENTIST', SpecialistCount=1
WHERE Type = 'BUILDING_PADUA_GARDEN';

INSERT INTO Building_LocalResourceOrs 
		(BuildingType,				ResourceType) 
SELECT	'BUILDING_PADUA_GARDEN',	Type FROM Resources WHERE PlantResource=1;

INSERT INTO Building_ClassesNeededInCity 
		(BuildingType,				BuildingClassType) 
SELECT	'BUILDING_PADUA_GARDEN',	'BUILDINGCLASS_GARDEN';

INSERT OR REPLACE INTO Building_YieldChanges
		(BuildingType, 				YieldType, 		Yield)
SELECT	'BUILDING_PADUA_GARDEN', 	'YIELD_CULTURE', 	3 UNION ALL
SELECT	'BUILDING_PADUA_GARDEN', 	'YIELD_FOOD', 		3;

INSERT INTO Building_BuildingClassYieldChanges
		(BuildingType, 			BuildingClassType,		YieldType, YieldChange)
SELECT 	'BUILDING_PADUA_GARDEN', 'BUILDINGCLASS_GARDEN', 'YIELD_FOOD', 2 UNION ALL
SELECT 	'BUILDING_PADUA_GARDEN', 'BUILDINGCLASS_GARDEN', 'YIELD_SCIENCE', 2;

INSERT INTO Building_ImprovementYieldChangesGlobal 
(BuildingType,				ImprovementType,		YieldType,		Yield) VALUES
('BUILDING_PADUA_GARDEN',	'IMPROVEMENT_ACADEMY',	'YIELD_FOOD',	3);

INSERT INTO Building_ResourceYieldChangesGlobal 
		(BuildingType,			ResourceType,	YieldType,			Yield) 
SELECT DISTINCT	'BUILDING_PADUA_GARDEN',Type,		'YIELD_SCIENCE',	1 FROM Resources WHERE PlantResource=1;

CREATE TRIGGER IF NOT EXISTS JarPaduaGarden AFTER INSERT ON Resources WHEN NEW.PlantResource= 1
BEGIN
	INSERT INTO Building_ResourceYieldChangesGlobal 
			(BuildingType,				ResourceType,	YieldType,		Yield) 
	SELECT 	'BUILDING_PADUA_GARDEN',	NEW.Type,	'YIELD_SCIENCE',	1;
	
	INSERT INTO Building_LocalResourceOrs 
			(BuildingType,				ResourceType) 
	SELECT	'BUILDING_PADUA_GARDEN',	NEW.Type;
END;

INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType,			Flavor)
VALUES	('BUILDING_PADUA_GARDEN',	'FLAVOR_SCIENCE', 	45),
		('BUILDING_PADUA_GARDEN',	'FLAVOR_GROWTH', 	35),
		('BUILDING_PADUA_GARDEN',	'FLAVOR_CULTURE', 	5);
------------------------------------------------------------------------------------------------------------------------------------------
-- CHANGDEOKGUNG
------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings SET
	Cost = (SELECT Cost FROM Buildings WHERE Type='BUILDING_GLOBE_THEATER'),
	NumPoliciesNeeded = (SELECT NumPoliciesNeeded FROM Buildings WHERE Type='BUILDING_GLOBE_THEATER'),
	PrereqTech = (SELECT PrereqTech FROM Buildings WHERE Type='BUILDING_GLOBE_THEATER'),
	MaxStartEra = (SELECT MaxStartEra FROM Buildings WHERE Type='BUILDING_GLOBE_THEATER'),
	SpecialistType = 'SPECIALIST_CIVIL_SERVANT', SpecialistCount=1, GreatPeopleRateChange = 1, Hill=1, FreeGreatPeople = 1
WHERE Type = 'BUILDING_CHANGDEOKGUNG';

INSERT OR REPLACE INTO Building_YieldChanges
		(BuildingType, 				YieldType, 		Yield)
SELECT	'BUILDING_CHANGDEOKGUNG', 	'YIELD_CULTURE', 	2 UNION ALL
SELECT	'BUILDING_CHANGDEOKGUNG', 	'YIELD_SCIENCE', 	2;

INSERT INTO Building_SpecialistYieldChanges
		(BuildingType,				SpecialistType,				YieldType,				Yield) 
VALUES	('BUILDING_CHANGDEOKGUNG',	'SPECIALIST_CIVIL_SERVANT',	'YIELD_PRODUCTION',			2),
		('BUILDING_CHANGDEOKGUNG',	'SPECIALIST_CIVIL_SERVANT',	'YIELD_GOLDEN_AGE_POINTS',	2);
		
INSERT INTO Building_BuildingClassHappiness
		(BuildingType,				BuildingClassType,	Happiness)
VALUES	('BUILDING_CHANGDEOKGUNG',	'BUILDINGCLASS_GARDEN', 1),
		('BUILDING_CHANGDEOKGUNG',	'BUILDINGCLASS_BATH', 1);

INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType,			Flavor)
VALUES	('BUILDING_CHANGDEOKGUNG',	'FLAVOR_GREAT_PEOPLE', 	45),
		('BUILDING_CHANGDEOKGUNG',	'FLAVOR_HAPPINESS', 	35),
		('BUILDING_CHANGDEOKGUNG',	'FLAVOR_DIPLOMACY', 	15);
------------------------------------------------------------------------------------------------------------------------------------------
-- HARMANDIR SAHIB
------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings SET
	Cost = (SELECT Cost FROM Buildings WHERE Type='BUILDING_CHICHEN_ITZA'),
	NumPoliciesNeeded = (SELECT NumPoliciesNeeded FROM Buildings WHERE Type='BUILDING_CHICHEN_ITZA'),
	PrereqTech = (SELECT PrereqTech FROM Buildings WHERE Type='BUILDING_CHICHEN_ITZA'),
	MaxStartEra = (SELECT MaxStartEra FROM Buildings WHERE Type='BUILDING_CHICHEN_ITZA'),
	HolyCity = 1, FreeBuildingThisCity = 'BUILDINGCLASS_GURDWARA', ReligiousUnrestFlatReductionGlobal= 1
WHERE Type = 'BUILDING_HARMANDIR_SAHIB';

INSERT INTO Building_YieldChanges 
		(BuildingType,				YieldType,		Yield) 
VALUES	('BUILDING_HARMANDIR_SAHIB','YIELD_FAITH',	2),
		('BUILDING_HARMANDIR_SAHIB','YIELD_GOLDEN_AGE_POINTS',2);

INSERT INTO Building_BuildingClassYieldChanges
		(BuildingType, 				BuildingClassType,		YieldType, YieldChange)
SELECT 	'BUILDING_HARMANDIR_SAHIB', 'BUILDINGCLASS_BATH', 	'YIELD_FOOD', 2 UNION ALL
SELECT DISTINCT	'BUILDING_HARMANDIR_SAHIB', a.Type, 		'YIELD_FOOD', 2
FROM BuildingClasses a, Buildings b, Building_YieldChanges c
WHERE a.Type = b.BuildingClass AND b.Type = c.BuildingType AND a.DefaultBuilding = b.Type
AND a.MaxGlobalInstances = -1 AND a.MaxPlayerInstances = -1 AND b.IsDummy = 0 AND c.YieldType = 'YIELD_FAITH';

INSERT INTO Building_Flavors 	
		(BuildingType, 		FlavorType,			Flavor)
VALUES	('BUILDING_HARMANDIR_SAHIB',	'FLAVOR_RELIGION', 	30),
		('BUILDING_HARMANDIR_SAHIB',	'FLAVOR_GROWTH', 	20),
		('BUILDING_HARMANDIR_SAHIB',	'FLAVOR_HAPPINESS', 10);
		
CREATE TRIGGER IF NOT EXISTS JarHarmandirSahib AFTER INSERT ON Belief_BuildingClassFaithPurchase WHEN NEW.BuildingClassType IS NOT NULL
AND NEW.BeliefType IN (SELECT Type FROM Beliefs WHERE Follower= 1)
BEGIN
	INSERT INTO Building_BuildingClassYieldChanges
			(BuildingType, 				BuildingClassType,		YieldType, YieldChange)
	SELECT 	'BUILDING_HARMANDIR_SAHIB', NEW.BuildingClassType, 	'YIELD_FOOD', 2;
END;
------------------------------------------------------------------------------------------------------------------------------------------
-- LARABANGA MOSQUE
------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings SET
	Cost = (SELECT Cost FROM Buildings WHERE Type='BUILDING_CHICHEN_ITZA'),
	NumPoliciesNeeded = (SELECT NumPoliciesNeeded FROM Buildings WHERE Type='BUILDING_CHICHEN_ITZA'),
	PrereqTech = (SELECT PrereqTech FROM Buildings WHERE Type='BUILDING_CHICHEN_ITZA'),
	MaxStartEra = (SELECT MaxStartEra FROM Buildings WHERE Type='BUILDING_CHICHEN_ITZA'),
	NearbyTerrainRequired = 'TERRAIN_PLAINS', FreeBuildingThisCity = 'BUILDINGCLASS_MOSQUE',
	GreatWorkSlotType = 'GREAT_WORK_SLOT_LITERATURE', GreatWorkCount = 1, TradeReligionModifier = 100
WHERE Type = 'BUILDING_LARABANGA';

INSERT INTO Building_ClassesNeededInCity 
		(BuildingType,			BuildingClassType) 
SELECT	'BUILDING_LARABANGA',	'BUILDINGCLASS_MINT';

INSERT INTO Building_YieldChanges 
		(BuildingType,			YieldType,		Yield) 
VALUES	('BUILDING_LARABANGA','YIELD_FAITH',	2),
		('BUILDING_LARABANGA','YIELD_CULTURE',	2);

INSERT INTO	Policies
(Type, 					Description, 					IsDummy) VALUES
('POLICY_LARABANGA',	'TXT_KEY_BUILDING_LARABANGA',	1);
UPDATE Policies SET SeaTradeRouteGoldChange = 300, LandTradeRouteGoldChange = 300 WHERE Type = 'POLICY_LARABANGA';

INSERT INTO Policy_TradeRouteYieldChange
		(PolicyType, 			DomainType,			YieldType, 			Yield)
SELECT 	'POLICY_LARABANGA', 	'DOMAIN_LAND',		'YIELD_FAITH',	3 UNION ALL
SELECT 	'POLICY_LARABANGA', 	'DOMAIN_SEA',		'YIELD_FAITH',	3 ;
------------------------------------------------------------------------------------------------------------------------------------------
-- DAMNOEN SADUAK
------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings SET
	Cost = (SELECT Cost FROM Buildings WHERE Type='BUILDING_UFFIZI'),
	NumPoliciesNeeded = (SELECT NumPoliciesNeeded FROM Buildings WHERE Type='BUILDING_UFFIZI'),
	PrereqTech = 'TECH_NAVIGATION', MaxStartEra = 'ERA_INDUSTRIAL',
	SpecialistType = 'SPECIALIST_MERCHANT', SpecialistCount=1, GreatPeopleRateChange = 2, River=1
WHERE Type = 'BUILDING_DAMNOEN_SADUAK';

INSERT INTO Building_ClassesNeededInCity 
		(BuildingType,				BuildingClassType) 
SELECT	'BUILDING_DAMNOEN_SADUAK',	'BUILDINGCLASS_GROCER';

INSERT INTO Building_FreeUnits 
(BuildingType,				UnitType,		NumUnits) VALUES
('BUILDING_DAMNOEN_SADUAK',	'UNIT_MERCHANT',	1);

INSERT INTO Building_RiverPlotYieldChanges
		(BuildingType,				YieldType,		Yield) 
VALUES	('BUILDING_DAMNOEN_SADUAK',	'YIELD_FOOD',	1),
		('BUILDING_DAMNOEN_SADUAK',	'YIELD_GOLD',	1),
		('BUILDING_DAMNOEN_SADUAK',	'YIELD_CULTURE',1);
		
INSERT INTO Building_SpecialistYieldChanges
		(BuildingType,				SpecialistType,				YieldType,		Yield) 
VALUES	('BUILDING_DAMNOEN_SADUAK',	'SPECIALIST_MERCHANT',	'YIELD_FOOD',		2),
		('BUILDING_DAMNOEN_SADUAK',	'SPECIALIST_MERCHANT',	'YIELD_CULTURE',	2);

INSERT INTO Building_BuildingClassYieldChanges
		(BuildingType, 			BuildingClassType,			YieldType, YieldChange)
SELECT 	'BUILDING_DAMNOEN_SADUAK', 'BUILDINGCLASS_MARKET', 'YIELD_CULTURE', 2 UNION ALL
SELECT 	'BUILDING_DAMNOEN_SADUAK', 'BUILDINGCLASS_MARKET', 'YIELD_GOLD', 	2 UNION ALL
SELECT 	'BUILDING_DAMNOEN_SADUAK', 'BUILDINGCLASS_GROCER', 'YIELD_CULTURE', 2 UNION ALL
SELECT 	'BUILDING_DAMNOEN_SADUAK', 'BUILDINGCLASS_GROCER', 'YIELD_GOLD', 	2;

INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType,			Flavor)
VALUES	('BUILDING_DAMNOEN_SADUAK',	'FLAVOR_GOLD', 		45),
		('BUILDING_DAMNOEN_SADUAK',	'FLAVOR_GROWTH', 	35),
		('BUILDING_DAMNOEN_SADUAK',	'FLAVOR_CULTURE', 	15);
------------------------------------------------------------------------------------------------------------------------------------------
-- PARO TAKTSANG
------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings SET
	Cost = (SELECT Cost FROM Buildings WHERE Type='BUILDING_SISTINE_CHAPEL'),
	NumPoliciesNeeded = (SELECT NumPoliciesNeeded FROM Buildings WHERE Type='BUILDING_SISTINE_CHAPEL'),
	PrereqTech = (SELECT PrereqTech FROM Buildings WHERE Type='BUILDING_SISTINE_CHAPEL'),
	MaxStartEra = (SELECT MaxStartEra FROM Buildings WHERE Type='BUILDING_SISTINE_CHAPEL'),
	NearbyMountainRequired = 1, FreeBuildingThisCity = 'BUILDINGCLASS_MONASTERY', UnmoddedHappiness= 3,
	SpecialistType = 'SPECIALIST_ENGINEER', GreatPeopleRateChange = 2, ReligiousPressureModifier= 25
WHERE Type = 'BUILDING_TAKTSANG';
------------------------------------------------------------------------------------------------------------------------------------------
-- KESHGARH QILA
------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings SET
	Cost = (SELECT Cost FROM Buildings WHERE Type='BUILDING_SISTINE_CHAPEL'),
	NumPoliciesNeeded = (SELECT NumPoliciesNeeded FROM Buildings WHERE Type='BUILDING_SISTINE_CHAPEL'),
	PrereqTech = (SELECT PrereqTech FROM Buildings WHERE Type='BUILDING_SISTINE_CHAPEL'),
	MaxStartEra = (SELECT MaxStartEra FROM Buildings WHERE Type='BUILDING_SISTINE_CHAPEL'),
	NearbyTerrainRequired = 'TERRAIN_GRASS', -- requirement Fort
	FreeBuildingThisCity = 'BUILDINGCLASS_GURDWARA', Defense= 500, ReligiousPressureModifier= 25, CitySupplyFlat = 5
WHERE Type = 'BUILDING_KESHGARH_QILA';

INSERT INTO Building_YieldChanges
(BuildingType, YieldType, Yield) VALUES
('BUILDING_VICTORIA_TERMINUS','YIELD_FAITH',3),
('BUILDING_VICTORIA_TERMINUS','YIELD_GREAT_GENERAL_POINTS',5);

INSERT INTO Building_UnitCombatProductionModifiersGlobal
(BuildingType, 				UnitCombatType, Modifier) VALUES
('BUILDING_KESHGARH_QILA', 'UNITCOMBAT_MELEE', 		25),
('BUILDING_KESHGARH_QILA', 'UNITCOMBAT_GUN', 		25),
('BUILDING_KESHGARH_QILA', 'UNITCOMBAT_MOUNTED', 	25);
--======================================================================================================================================--
-- INDUSTRIAL ERA
--======================================================================================================================================--
-- CITADELLE LAFERRIÈRE
------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings SET
	Cost = (SELECT Cost FROM Buildings WHERE Type='BUILDING_NEUSCHWANSTEIN'),
	NumPoliciesNeeded = (SELECT NumPoliciesNeeded FROM Buildings WHERE Type='BUILDING_NEUSCHWANSTEIN'),
	PrereqTech = 'TECH_RIFLING', MaxStartEra = 'ERA_MODERN', FreePromotion = 'PROMOTION_LAFERRIERE',
	Water = 1, MinAreaSize = 10, Hill = 1, Defense = 1000, SpecialistType = 'SPECIALIST_ENGINEER', GreatPeopleRateChange = 2
WHERE Type = 'BUILDING_LAFERRIERE';

INSERT INTO Building_FreeUnits 
		(BuildingType,			UnitType,				NumUnits)
VALUES	('BUILDING_LAFERRIERE', 'UNIT_GREAT_GENERAL',	1);

INSERT INTO UnitPromotions 
		(Type,						Description,					Help,									Sound,				CannotBeChosen, LostWithUpgrade,	PortraitIndex,	IconAtlas,		PediaType,		PediaEntry) 
VALUES	('PROMOTION_LAFERRIERE',	'TXT_KEY_PROMOTION_LAFERRIERE',	'TXT_KEY_PROMOTION_LAFERRIERE_HELP',	'AS2D_IF_LEVELUP',	1,				0,					59,			'ABILITY_ATLAS',	'PEDIA_SHARED', 'TXT_KEY_PROMOTION_LAFERRIERE');

UPDATE UnitPromotions SET AttackMod= 25, DefenseMod= 25, MovesChange= 1, CanMoveAfterAttacking= 1
WHERE Type = 'PROMOTION_LAFERRIERE';

INSERT INTO UnitPromotions_UnitCombatMods
		(PromotionType,			UnitCombatType, 	Modifier)
SELECT	'PROMOTION_LAFERRIERE',	UnitCombatType, 	25 FROM UnitPromotions_UnitCombatMods WHERE PromotionType='PROMOTION_NAVAL_PENALTY';

INSERT INTO UnitPromotions_UnitCombats
		(PromotionType,				UnitCombatType)
VALUES	('PROMOTION_LAFERRIERE',	'UNITCOMBAT_SIEGE');
	
INSERT INTO Building_ImprovementYieldChangesGlobal 
		(BuildingType,			ImprovementType,	YieldType,			Yield) 
VALUES	('BUILDING_LAFERRIERE',	'IMPROVEMENT_FORT',	'YIELD_PRODUCTION',	2),
		('BUILDING_LAFERRIERE',	'IMPROVEMENT_FORT',	'YIELD_FOOD',		2),
		('BUILDING_LAFERRIERE',	'IMPROVEMENT_FORT',	'YIELD_CULTURE',	2),
		('BUILDING_LAFERRIERE',	'IMPROVEMENT_CITADEL',	'YIELD_PRODUCTION',	2),
		('BUILDING_LAFERRIERE',	'IMPROVEMENT_CITADEL',	'YIELD_FOOD',		2),
		('BUILDING_LAFERRIERE',	'IMPROVEMENT_CITADEL',	'YIELD_CULTURE',	2),
		('BUILDING_LAFERRIERE',	'IMPROVEMENT_CITADEL_JAR_ATOLL',	'YIELD_PRODUCTION',	2),
		('BUILDING_LAFERRIERE',	'IMPROVEMENT_CITADEL_JAR_ATOLL',	'YIELD_FOOD',		2),
		('BUILDING_LAFERRIERE',	'IMPROVEMENT_CITADEL_JAR_ATOLL',	'YIELD_CULTURE',	2),
		('BUILDING_LAFERRIERE',	'IMPROVEMENT_MONGOLIA_ORDO',	'YIELD_PRODUCTION',	2),
		('BUILDING_LAFERRIERE',	'IMPROVEMENT_MONGOLIA_ORDO',	'YIELD_FOOD',		2),
		('BUILDING_LAFERRIERE',	'IMPROVEMENT_MONGOLIA_ORDO',	'YIELD_CULTURE',	2),
		('BUILDING_LAFERRIERE',	'IMPROVEMENT_ZULU_KRAAL',	'YIELD_PRODUCTION',	2),
		('BUILDING_LAFERRIERE',	'IMPROVEMENT_ZULU_KRAAL',	'YIELD_FOOD',		2),
		('BUILDING_LAFERRIERE',	'IMPROVEMENT_ZULU_KRAAL',	'YIELD_CULTURE',	2),
		('BUILDING_LAFERRIERE',	'IMPROVEMENT_TOMATEKH_BENIN_IYA',	'YIELD_PRODUCTION',	2),
		('BUILDING_LAFERRIERE',	'IMPROVEMENT_TOMATEKH_BENIN_IYA',	'YIELD_FOOD',		2),
		('BUILDING_LAFERRIERE',	'IMPROVEMENT_TOMATEKH_BENIN_IYA',	'YIELD_CULTURE',	2),
		('BUILDING_LAFERRIERE',	'IMPROVEMENT_HININ_IMAZIGHEN_IMAJAL',	'YIELD_PRODUCTION',	2),
		('BUILDING_LAFERRIERE',	'IMPROVEMENT_HININ_IMAZIGHEN_IMAJAL',	'YIELD_FOOD',		2),
		('BUILDING_LAFERRIERE',	'IMPROVEMENT_HININ_IMAZIGHEN_IMAJAL',	'YIELD_CULTURE',	2),
		('BUILDING_LAFERRIERE',	'IMPROVEMENT_AINU_CASI',	'YIELD_PRODUCTION',	2),
		('BUILDING_LAFERRIERE',	'IMPROVEMENT_AINU_CASI',	'YIELD_FOOD',		2),
		('BUILDING_LAFERRIERE',	'IMPROVEMENT_AINU_CASI',	'YIELD_CULTURE',	2);

INSERT INTO Building_Flavors 	
		(BuildingType, 			FlavorType,				Flavor)
VALUES	('BUILDING_LAFERRIERE',	'FLAVOR_CITY_DEFENSE', 		45),
		('BUILDING_LAFERRIERE',	'FLAVOR_DEFENSE', 			25),
		('BUILDING_LAFERRIERE',	'FLAVOR_OFFENSE', 			25),
		('BUILDING_LAFERRIERE',	'FLAVOR_TILE_IMPROVEMENT', 	15);
------------------------------------------------------------------------------------------------------------------------------------------
-- VICTORIA TERMINUS
------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings SET
	Cost = (SELECT Cost FROM Buildings WHERE Type='BUILDING_NEUSCHWANSTEIN'),
	NumPoliciesNeeded = (SELECT NumPoliciesNeeded FROM Buildings WHERE Type='BUILDING_NEUSCHWANSTEIN'),
	PrereqTech = (SELECT PrereqTech FROM Buildings WHERE Type='BUILDING_COALING_STATION'),
	MaxStartEra = 'ERA_MODERN', RequiresIndustrialCityConnection = 1, -- Requires 18 Citizens in City
	FreeBuildingThisCity = 'BUILDINGCLASS_COALING_STATION', CityConnectionTradeRouteModifier = 15,
	SpecialistType = 'SPECIALIST_ENGINEER', GreatPeopleRateChange = 3
WHERE Type = 'BUILDING_VICTORIA_TERMINUS';

INSERT INTO Building_YieldChanges
(BuildingType, YieldType, Yield) VALUES
('BUILDING_VICTORIA_TERMINUS','YIELD_CULTURE',3),
('BUILDING_VICTORIA_TERMINUS','YIELD_GOLD',3);

INSERT INTO	Policies
(Type, 							Description, 							IsDummy) VALUES
('POLICY_VICTORIA_TERMINUS',	'TXT_KEY_BUILDING_VICTORIA_TERMINUS',	1);
UPDATE Policies SET InternalTradeRouteYieldModifier = 100
WHERE Type = 'POLICY_VICTORIA_TERMINUS';

INSERT INTO Policy_YieldChangeTradeRoute
		(PolicyType, YieldType, Yield)
SELECT 	'POLICY_VICTORIA_TERMINUS', 'YIELD_CULTURE', 	5;

INSERT INTO Building_ResourceQuantity
(BuildingType, ResourceType, Quantity) VALUES
('BUILDING_VICTORIA_TERMINUS', 'RESOURCE_COAL', 1);

INSERT INTO Building_ClassNeededNowhere
(BuildingType,					BuildingClassType) VALUES
('BUILDING_VICTORIA_TERMINUS',	'BUILDINGCLASS_SIBERIAN_RAILWAY'),
('BUILDING_VICTORIA_TERMINUS',	'BUILDINGCLASS_AUTOBAHN'),
('BUILDING_VICTORIA_TERMINUS',	'BUILDINGCLASS_INTERSTATE'),
('BUILDING_VICTORIA_TERMINUS',	'BUILDINGCLASS_CONCORDE'),
('BUILDING_VICTORIA_TERMINUS',	'BUILDINGCLASS_DARJEELING'),
('BUILDING_DARJEELING',			'BUILDINGCLASS_VICTORIA_TERMINUS'),
('BUILDING_SIBERIAN_RAILWAY',	'BUILDINGCLASS_VICTORIA_TERMINUS'),
('BUILDING_AUTOBAHN',			'BUILDINGCLASS_VICTORIA_TERMINUS'),
('BUILDING_INTERSTATE',			'BUILDINGCLASS_VICTORIA_TERMINUS'),
('BUILDING_CONCORDE',			'BUILDINGCLASS_VICTORIA_TERMINUS');
------------------------------------------------------------------------------------------------------------------------------------------
-- CAPITOLINE MUSEUMS
------------------------------------------------------------------------------------------------------------------------------------------
-- Archaeologists can be purchased with [ICON_GOLD] Gold, gain +1 [ICON_MOVES] Movement and double Work rate. 
UPDATE Buildings SET
	Cost = (SELECT Cost FROM Buildings WHERE Type='BUILDING_LOUVRE'),
	NumPoliciesNeeded = (SELECT NumPoliciesNeeded FROM Buildings WHERE Type='BUILDING_LOUVRE'),
	PrereqTech = (SELECT PrereqTech FROM Buildings WHERE Type='BUILDING_LOUVRE'),
	MaxStartEra = (SELECT MaxStartEra FROM Buildings WHERE Type='BUILDING_LOUVRE'), Hill = 1,
	FreeBuildingThisCity = 'BUILDINGCLASS_MUSEUM', GreatWorkSlotType = 'GREAT_WORK_SLOT_ART_ARTIFACT',	GreatWorkCount = 4,
	ThemingBonusHelp = 'TXT_KEY_THEMING_BONUS_CAPITOLINE_HELP', SpecialistType = 'SPECIALIST_ARTIST', GreatPeopleRateChange = 3
WHERE Type = 'BUILDING_CAPITOLINE';

INSERT INTO Building_YieldChanges
(BuildingType, YieldType, Yield) VALUES
('BUILDING_CAPITOLINE','YIELD_CULTURE',2),
('BUILDING_CAPITOLINE','YIELD_SCIENCE',2),
('BUILDING_CAPITOLINE','YIELD_GOLD',2);

INSERT INTO Building_PlotYieldChanges 
		(BuildingType,			PlotType,		YieldType,		Yield) 
VALUES	('BUILDING_CAPITOLINE',	'PLOT_HILLS',	'YIELD_CULTURE',	2),
		('BUILDING_CAPITOLINE',	'PLOT_HILLS',	'YIELD_GOLDEN_AGE_POINTS',	2);

INSERT INTO Building_ThemingBonuses 
		(BuildingType,			Description,						Bonus,	UniqueEras,	RequiresUniquePlayers,	AIPriority)
SELECT	'BUILDING_CAPITOLINE',	'TXT_KEY_THEMING_BONUS_CAPITOLINE',	15,		0,			0,						7;

INSERT INTO Building_ThemingYieldBonus 
		(BuildingType,					YieldType,			Yield)
SELECT	'BUILDING_CAPITOLINE',	'YIELD_CULTURE',	4  UNION ALL
SELECT	'BUILDING_CAPITOLINE',	'YIELD_SCIENCE',	4  UNION ALL
SELECT	'BUILDING_CAPITOLINE',	'YIELD_TOURISM',	4;

INSERT INTO Building_Flavors 	
		(BuildingType, 			FlavorType,				Flavor)
VALUES	('BUILDING_CAPITOLINE',	'FLAVOR_CULTURE', 		40),
		('BUILDING_CAPITOLINE',	'FLAVOR_ARCHAEOLOGY', 	30);

INSERT INTO UnitClasses
		(Type, 						DefaultUnit,			  Description, MaxPlayerInstances)
SELECT	'UNITCLASS_ARCHAEOLOGIST_CM','UNIT_ARCHAEOLOGIST_CM', Description, MaxPlayerInstances
FROM UnitClasses WHERE Type='UNITCLASS_ARCHAEOLOGIST';

INSERT INTO Units
		(Type,					Class, 							ShowInPedia, Moves,		Cost, FaithCost, RequiresFaithPurchaseEnabled, Description, Civilopedia, Strategy, Help, MoveAfterPurchase, BaseSightRange, Capture, CombatClass, Domain, CivilianAttackPriority, DefaultUnitAI, PrereqTech, HurryCostModifier, WorkRate, UnitArtInfo, UnitArtInfoEraVariation, MoveRate, UnitFlagIconOffset, PortraitIndex, IconAtlas, UnitFlagAtlas, MaxHitPoints, PurchaseCooldown)
SELECT	'UNIT_ARCHAEOLOGIST_CM','UNITCLASS_ARCHAEOLOGIST_CM',	0,			 Moves+1,	Cost, FaithCost, RequiresFaithPurchaseEnabled, Description, Civilopedia, Strategy, Help, 1,				 	BaseSightRange, Capture, CombatClass, Domain, CivilianAttackPriority, DefaultUnitAI, PrereqTech, 0,					WorkRate*2, UnitArtInfo, UnitArtInfoEraVariation, MoveRate, UnitFlagIconOffset, PortraitIndex, IconAtlas, UnitFlagAtlas, MaxHitPoints, PurchaseCooldown
FROM Units WHERE Type = 'UNIT_ARCHAEOLOGIST';

INSERT INTO Belief_SpecificFaithUnitPurchase
		(BeliefType, UnitType)
SELECT	'BELIEF_UNITY_OF_PROPHETS', Type
FROM Units WHERE Class = 'UNITCLASS_ARCHAEOLOGIST_CM';

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_ARCHAEOLOGIST_CM',SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_ARCHAEOLOGIST';

INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_ARCHAEOLOGIST_CM',UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_ARCHAEOLOGIST';

INSERT INTO Unit_Flavors
       (UnitType,          		FlavorType, Flavor)
SELECT 'UNIT_ARCHAEOLOGIST_CM', FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_ARCHAEOLOGIST';

INSERT INTO Unit_BuildingClassRequireds
		(UnitType, 				BuildingClassType)
SELECT	'UNIT_ARCHAEOLOGIST_CM',BuildingClassType
FROM Unit_BuildingClassRequireds WHERE UnitType = 'UNIT_ARCHAEOLOGIST';

INSERT INTO Unit_Builds 	
		(UnitType, 			 	BuildType)
SELECT	'UNIT_ARCHAEOLOGIST_CM',BuildType
FROM Unit_Builds WHERE UnitType = 'UNIT_ARCHAEOLOGIST';
------------------------------------------------------------------------------------------------------------------------------------------
-- MUZIBU AZAALA MPANGA
------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings SET
	Cost = (SELECT Cost FROM Buildings WHERE Type='BUILDING_LOUVRE'),
	NumPoliciesNeeded = (SELECT NumPoliciesNeeded FROM Buildings WHERE Type='BUILDING_LOUVRE'),
	PrereqTech = (SELECT PrereqTech FROM Buildings WHERE Type='BUILDING_LOUVRE'),
	MaxStartEra = (SELECT MaxStartEra FROM Buildings WHERE Type='BUILDING_LOUVRE')
WHERE Type = 'BUILDING_KASUBI_TOMBS';

INSERT INTO Building_YieldChanges
(BuildingType, YieldType, Yield) VALUES
('BUILDING_KASUBI_TOMBS','YIELD_FAITH',3),
('BUILDING_KASUBI_TOMBS','YIELD_GOLDEN_AGE_POINTS',3),
('BUILDING_KASUBI_TOMBS','YIELD_CULTURE',3),
('BUILDING_KASUBI_TOMBS','YIELD_FOOD',3);

INSERT INTO Building_LakePlotYieldChanges 
(BuildingType,				YieldType,			Yield)	VALUES
('BUILDING_KASUBI_TOMBS',	'YIELD_TOURISM',	2);

INSERT INTO Building_LakePlotYieldChangesGlobal 
(BuildingType,				YieldType,					Yield)	VALUES
('BUILDING_KASUBI_TOMBS',	'YIELD_FOOD',					2),
('BUILDING_KASUBI_TOMBS',	'YIELD_GOLDEN_AGE_POINTS',		2),
('BUILDING_KASUBI_TOMBS',	'YIELD_GREAT_GENERAL_POINTS',	2);

INSERT INTO Building_YieldFromGPExpend
(BuildingType, YieldType, Yield) VALUES
('BUILDING_KASUBI_TOMBS', 'YIELD_FAITH', 75);
------------------------------------------------------------------------------------------------------------------------------------------
-- TE TII MARAE
------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings SET
	Cost = (SELECT Cost FROM Buildings WHERE Type='BUILDING_BRANDENBURG_GATE'),
	NumPoliciesNeeded = (SELECT NumPoliciesNeeded FROM Buildings WHERE Type='BUILDING_BRANDENBURG_GATE'),
	PrereqTech = (SELECT PrereqTech FROM Buildings WHERE Type='BUILDING_BRANDENBURG_GATE'),
	MaxStartEra = (SELECT MaxStartEra FROM Buildings WHERE Type='BUILDING_BRANDENBURG_GATE'),
	GreatWorkSlotType = 'GREAT_WORK_SLOT_LITERATURE', GreatWorkCount = 1, FreeGreatWork = 'GREAT_WORK_TREATY_WATANGI'
WHERE Type = 'BUILDING_TE_TII_MARAE';

INSERT INTO Building_ClassNeededAnywhere
		(BuildingType,				BuildingClassType)
VALUES	('BUILDING_TE_TII_MARAE',	'BUILDINGCLASS_COURTHOUSE');

INSERT INTO Building_BuildingClassHappiness
		(BuildingType, 				BuildingClassType, 	Happiness)
VALUES	('BUILDING_TE_TII_MARAE', 'BUILDINGCLASS_COURTHOUSE', 1);

INSERT INTO Building_BuildingClassYieldChanges
		(BuildingType, 			BuildingClassType,			YieldType, YieldChange)
SELECT 	'BUILDING_TE_TII_MARAE', 'BUILDINGCLASS_COURTHOUSE', 'YIELD_PRODUCTION', 3;

INSERT INTO GreatWorks
		(Type,						Description,						GreatWorkClassType,			Image,							Quote) 
VALUES	('GREAT_WORK_TREATY_WATANGI','TXT_KEY_GREAT_WORK_TREATY_WATANGI','GREAT_WORK_LITERATURE',	'GreatWriter_Background.dds',	'TXT_KEY_GREAT_WORK_TREATY_WATANGI_QUOTE');

INSERT INTO Building_DomainFreeExperiencePerGreatWorkGlobal
		(BuildingType, 				DomainType, Experience)
VALUES	('BUILDING_TE_TII_MARAE', 	'DOMAIN_LAND', 5),
		('BUILDING_TE_TII_MARAE', 	'DOMAIN_SEA', 5),
		('BUILDING_TE_TII_MARAE', 	'DOMAIN_AIR', 5);
		
INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType,				Flavor)
VALUES	('BUILDING_TE_TII_MARAE',	'FLAVOR_HAPPINESS', 		45),
		('BUILDING_TE_TII_MARAE',	'FLAVOR_PRODUCTION', 		25),
		('BUILDING_TE_TII_MARAE',	'FLAVOR_OFFENSE', 			25),
		('BUILDING_TE_TII_MARAE',	'FLAVOR_CULTURE', 			15),
		('BUILDING_TE_TII_MARAE',	'FLAVOR_MILITARY_TRAINING', 25);
--======================================================================================================================================--
-- MODERN ERA
--======================================================================================================================================--
-- GOLDEN GATE BRIDGE
------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings SET
	Cost = (SELECT Cost FROM Buildings WHERE Type='BUILDING_BROADWAY'),
	NumPoliciesNeeded = (SELECT NumPoliciesNeeded FROM Buildings WHERE Type='BUILDING_BROADWAY'),
	PrereqTech = (SELECT PrereqTech FROM Buildings WHERE Type='BUILDING_BROADWAY'),
	MaxStartEra = (SELECT MaxStartEra FROM Buildings WHERE Type='BUILDING_BROADWAY'), Water = 1, MinAreaSize = 10,
	/*NumTradeRouteBonus = 1,*/ SpecialistType = 'SPECIALIST_ENGINEER', GreatPeopleRateChange = 4
WHERE Type = 'BUILDING_GOLDEN_GATE';

INSERT INTO Building_FreeUnits 
		(BuildingType,			UnitType,			NumUnits)
VALUES	('BUILDING_GOLDEN_GATE', 'UNIT_ENGINEER',	1);

INSERT INTO Building_YieldChanges
(BuildingType, YieldType, Yield) VALUES
('BUILDING_GOLDEN_GATE','YIELD_CULTURE',3),
('BUILDING_GOLDEN_GATE','YIELD_TOURISM',3),
('BUILDING_GOLDEN_GATE','YIELD_GOLD',4);

INSERT INTO Building_GlobalYieldModifiers
(BuildingType,				YieldType,				Yield) VALUES
('BUILDING_GOLDEN_GATE',	'YIELD_PRODUCTION',		10);

INSERT INTO	Policies
(Type, 					Description, 					InfluenceGPExpend,	IsDummy) VALUES
('POLICY_GOLDEN_GATE',	'TXT_KEY_BUILDING_GOLDEN_GATE',	10,					1);

INSERT INTO Policy_TradeRouteYieldChange
		(PolicyType, 			DomainType,			YieldType, 			Yield)
SELECT 	'POLICY_GOLDEN_GATE', 	'DOMAIN_LAND',		'YIELD_GOLDEN_AGE_POINTS', 	5 UNION ALL
SELECT 	'POLICY_GOLDEN_GATE', 	'DOMAIN_SEA',		'YIELD_GOLDEN_AGE_POINTS', 	5 ;
------------------------------------------------------------------------------------------------------------------------------------------
-- JOHNS HOPKINS HOSPITAL
------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings SET
	Cost = (SELECT Cost FROM Buildings WHERE Type='BUILDING_EMPIRE_STATE_BUILDING'),
	NumPoliciesNeeded = (SELECT NumPoliciesNeeded FROM Buildings WHERE Type='BUILDING_EMPIRE_STATE_BUILDING'),
	PrereqTech = (SELECT PrereqTech FROM Buildings WHERE Type='BUILDING_HOSPITAL'),
	MaxStartEra = (SELECT MaxStartEra FROM Buildings WHERE Type='BUILDING_EMPIRE_STATE_BUILDING'),
	FreeBuilding = 'BUILDINGCLASS_DUMMY_JOHNS_HOPKINS', FreeBuildingThisCity = 'BUILDINGCLASS_HOSPITAL', Flat= 1
WHERE Type = 'BUILDING_JOHNS_HOPKINS';

INSERT INTO Building_YieldChanges
(BuildingType,				YieldType,	Yield) VALUES
('BUILDING_JOHNS_HOPKINS',	'YIELD_FOOD',	10),
('BUILDING_JOHNS_HOPKINS',	'YIELD_SCIENCE', 4);

INSERT INTO Building_ImprovementYieldChangesGlobal
(BuildingType,				ImprovementType,		YieldType,		Yield)	VALUES
('BUILDING_JOHNS_HOPKINS',	'IMPROVEMENT_ACADEMY',	'YIELD_FOOD',	3);
		
INSERT INTO Building_SpecialistYieldChanges
		(BuildingType,				SpecialistType,			YieldType,		Yield) 
VALUES	('BUILDING_JOHNS_HOPKINS',	'SPECIALIST_SCIENTIST',	'YIELD_FOOD',		3);

INSERT INTO Building_BuildingClassYieldChanges
		(BuildingType, 				BuildingClassType,		YieldType, YieldChange)
SELECT 	'BUILDING_JOHNS_HOPKINS', 'BUILDINGCLASS_HOSPITAL', 'YIELD_SCIENCE', 2;

INSERT OR REPLACE INTO BuildingClasses
(DefaultBuilding, 					Type,										Description) VALUES	
('BUILDING_DUMMY_JOHNS_HOPKINS',	'BUILDINGCLASS_DUMMY_JOHNS_HOPKINS',		'TXT_KEY_BUILDING_JETAVANARAMAYA');

INSERT OR REPLACE INTO Buildings
(Type, 						 		BuildingClass, 							IsDummy,	Cost,	FaithCost,	GreatWorkCount,	PrereqTech,	MinAreaSize,	Description) VALUES	
('BUILDING_DUMMY_JOHNS_HOPKINS', 	'BUILDINGCLASS_DUMMY_JOHNS_HOPKINS',	1,			-1,		-1,			-1,				null,		-1,				'TXT_KEY_BUILDING_JOHNS_HOPKINS');

INSERT	INTO Building_YieldFromTech (BuildingType, YieldType, Yield)
SELECT 'BUILDING_DUMMY_JOHNS_HOPKINS', 'YIELD_FOOD', 75;
--======================================================================================================================================--
-- ATOMIC ERA
--======================================================================================================================================--
-- CHANGI AIRPORT
------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings SET
	Cost = 2100, NumPoliciesNeeded = 22,
	PrereqTech = (SELECT PrereqTech FROM Buildings WHERE Type='BUILDING_AIRPORT'),	
	FreeBuildingThisCity = 'BUILDINGCLASS_AIRPORT', CapitalOnly = 1
WHERE Type = 'BUILDING_CHANGI_AIRPORT';

INSERT INTO Building_YieldChanges
(BuildingType, YieldType, Yield) VALUES
('BUILDING_CHANGI_AIRPORT','YIELD_CULTURE',2),
('BUILDING_CHANGI_AIRPORT','YIELD_GOLD',2);

INSERT INTO Building_BuildingClassYieldChanges
		(BuildingType, 				BuildingClassType,		YieldType, YieldChange)
SELECT 	'BUILDING_CHANGI_AIRPORT', 'BUILDINGCLASS_AIRPORT', 'YIELD_PRODUCTION', 2 UNION ALL
SELECT 	'BUILDING_CHANGI_AIRPORT', 'BUILDINGCLASS_AIRPORT', 'YIELD_GOLD', 		2 UNION ALL
SELECT 	'BUILDING_CHANGI_AIRPORT', 'BUILDINGCLASS_AIRPORT', 'YIELD_GOLDEN_AGE_POINTS', 2 UNION ALL
SELECT 	'BUILDING_CHANGI_AIRPORT', 'BUILDINGCLASS_AIRPORT', 'YIELD_TOURISM', 	2;

INSERT INTO Building_FreeUnits 
(BuildingType,				UnitType,			NumUnits) VALUES
('BUILDING_CHANGI_AIRPORT',	'UNIT_MERCHANT',	1);

INSERT INTO	Policies
(Type, 						Description, 						MaxAirUnitsChangeGlobal,	IsDummy) VALUES
('POLICY_CHANGI_AIRPORT',	'TXT_KEY_BUILDING_CHANGI_AIRPORT',	1,							1);
------------------------------------------------------------------------------------------------------------------------------------------
-- WATSON RESEARCH CENTER
------------------------------------------------------------------------------------------------------------------------------------------
UPDATE Buildings SET
	Cost = 2350, PrereqTech = 'TECH_COMPUTERS', NumPoliciesNeeded = 24, Flat = 1,
	SpecialistType = 'SPECIALIST_SCIENTIST', GreatPeopleRateChange = 2, SpecialistCount = 2
WHERE Type = 'BUILDING_WATSON_RC';

INSERT INTO Building_ClassesNeededInCity 
		(BuildingType,			BuildingClassType) 
SELECT	'BUILDING_WATSON_RC',	'BUILDINGCLASS_LABORATORY';

INSERT INTO Building_YieldChanges
(BuildingType, YieldType, Yield) VALUES
('BUILDING_WATSON_RC','YIELD_SCIENCE',5),
('BUILDING_WATSON_RC','YIELD_GOLD',2);

INSERT INTO Building_GlobalYieldModifiers
		(BuildingType,			YieldType,		Yield)
VALUES	('BUILDING_WATSON_RC', 'YIELD_SCIENCE',	10);

INSERT INTO Building_YieldFromYieldPercentGlobal
(BuildingType, YieldIn, YieldOut, Value) VALUES
('BUILDING_WATSON_RC', 'YIELD_SCIENCE', 'YIELD_PRODUCTION', 15);

INSERT INTO Building_ImprovementYieldChangesGlobal
		(BuildingType,			ImprovementType,			YieldType,			Yield) 
VALUES	('BUILDING_WATSON_RC',	'IMPROVEMENT_CUSTOMS_HOUSE','YIELD_SCIENCE',	4),
		('BUILDING_WATSON_RC',	'IMPROVEMENT_MANUFACTORY',	'YIELD_SCIENCE',	4);
--======================================================================================================================================--
-- RELIGIOUS WONDERS (MUST BE BUILT IN HOLY CITY)
--======================================================================================================================================--
INSERT OR REPLACE INTO Building_ClassNeededNowhere
		(BuildingType,	BuildingClassType)
SELECT	DISTINCT a.Type,	b.BuildingClass 	FROM Buildings a, Buildings b  WHERE a.HolyCity = 1 AND b.HolyCity = 1
AND a.BuildingClass != b.BuildingClass AND a.Cost>0 AND b.Cost>0 AND a.FaithCost=0 AND b.FaithCost=0 AND a.UnlockedByBelief=0 AND b.UnlockedByBelief=0;

CREATE TRIGGER IF NOT EXISTS JarHolyWonders AFTER INSERT ON Buildings
WHEN NEW.Cost>0 AND NEW.FaithCost=0 AND NEW.HolyCity = 1 AND NEW.UnlockedByBelief=0
BEGIN
	INSERT INTO Building_ClassNeededNowhere
			(BuildingType,	BuildingClassType)
	SELECT DISTINCT NEW.Type,	BuildingClass FROM Buildings WHERE Cost>0 AND FaithCost=0 AND HolyCity = 1 AND UnlockedByBelief=0 UNION ALL
	SELECT DISTINCT Type,	NEW.BuildingClass FROM Buildings WHERE Cost>0 AND FaithCost=0 AND HolyCity = 1 AND UnlockedByBelief=0;
END;

INSERT INTO Building_ClassNeededNowhere
		(BuildingType,		BuildingClassType) 
SELECT DISTINCT Type,		'BUILDINGCLASS_EL_GHRIBA' FROM Buildings WHERE Cost>0 AND FaithCost=0 AND HolyCity =1 AND UnlockedByBelief=0 UNION ALL
SELECT DISTINCT Type,		'BUILDINGCLASS_NABAWI'	  FROM Buildings WHERE Cost>0 AND FaithCost=0 AND HolyCity =1 AND UnlockedByBelief=0 UNION ALL
SELECT DISTINCT Type,		'BUILDINGCLASS_KARLSTEJN' FROM Buildings WHERE Cost>0 AND FaithCost=0 AND HolyCity =1 AND UnlockedByBelief=0 UNION ALL
SELECT DISTINCT Type,		'BUILDINGCLASS_ST_PETERS' FROM Buildings WHERE Cost>0 AND FaithCost=0 AND HolyCity =1 AND UnlockedByBelief=0 UNION ALL
SELECT DISTINCT Type,		'BUILDINGCLASS_MEENAKSHI' FROM Buildings WHERE Cost>0 AND FaithCost=0 AND HolyCity =1 AND UnlockedByBelief=0 UNION ALL
SELECT DISTINCT 'BUILDING_EL_GHRIBA',	BuildingClass FROM Buildings WHERE Cost>0 AND FaithCost=0 AND HolyCity =1 AND UnlockedByBelief=0 UNION ALL
SELECT DISTINCT 'BUILDING_NABAWI',		BuildingClass FROM Buildings WHERE Cost>0 AND FaithCost=0 AND HolyCity =1 AND UnlockedByBelief=0 UNION ALL
SELECT DISTINCT 'BUILDING_KARLSTEJN',	BuildingClass FROM Buildings WHERE Cost>0 AND FaithCost=0 AND HolyCity =1 AND UnlockedByBelief=0 UNION ALL
SELECT DISTINCT 'BUILDING_ST_PETERS',	BuildingClass FROM Buildings WHERE Cost>0 AND FaithCost=0 AND HolyCity =1 AND UnlockedByBelief=0 UNION ALL
SELECT DISTINCT 'BUILDING_MEENAKSHI',	BuildingClass FROM Buildings WHERE Cost>0 AND FaithCost=0 AND HolyCity =1 AND UnlockedByBelief=0;
--======================================================================================================================================--
--======================================================================================================================================--