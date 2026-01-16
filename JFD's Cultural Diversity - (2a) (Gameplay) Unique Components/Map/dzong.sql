--==========================================================================================================================
-- IMPROVEMENT GRAPHICS
--==========================================================================================================================
-- ArtDefine_LandmarkTypes
----------------------------------------------------------
INSERT INTO ArtDefine_LandmarkTypes (Type,	LandmarkType,	FriendlyName) VALUES
('ART_DEF_IMPROVEMENT_JAR_DZONG',				'Improvement',	'Dzong'	);
----------------------------------------------------------
-- ArtDefine_StrategicView
----------------------------------------------------------
INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset) VALUES
('ART_DEF_IMPROVEMENT_JAR_DZONG',			'Improvement',	'sv_dzong.dds'	);
----------------------------------------------------------
-- ArtDefine_Landmarks
----------------------------------------------------------
INSERT INTO ArtDefine_Landmarks
(Era, 	State, 					Scale,	ImprovementType,				LayoutHandler,	ResourceType,			Model,				TerrainContour) VALUES
('Any', 'UnderConstruction',	1.3,  'ART_DEF_IMPROVEMENT_JAR_DZONG',	'RANDOM',		'ART_DEF_RESOURCE_ALL',	'DZONG_HB.fxsxml',	1	),
('Any', 'Constructed',			1.3,  'ART_DEF_IMPROVEMENT_JAR_DZONG',	'RANDOM',		'ART_DEF_RESOURCE_ALL',	'DZONG_B.fxsxml',	1	),
('Any', 'Pillaged',				1.3,  'ART_DEF_IMPROVEMENT_JAR_DZONG',	'RANDOM',		'ART_DEF_RESOURCE_ALL',	'DZONG_PL.fxsxml',	1	);

--==========================================================================================================================
-- Improvements
--==========================================================================================================================
-- Improvements
--------------------------------
INSERT INTO Improvements
	(Type,						Description,			Civilopedia, 		Help,		ArtDefineTag,		ConnectsAllResources,	MountainsMakesValid, 
	BuildableOnResources, InAdjacentFriendly, NoTwoAdjacent, CreatedByGreatPerson, DefenseModifier, NearbyEnemyDamage, NoFollowUp,
	 PillageGold, Permanent, CultureBombRadius, MakesPassable, GrantsVisionXTiles, IconAtlas,			PortraitIndex)
SELECT	
	'IMPROVEMENT_JAR_DZONG',	'TXT_KEY_IMPROVEMENT_JAR_DZONG',	'TXT_KEY_IMPROVEMENT_JAR_DZONG_TEXT',	'TXT_KEY_IMPROVEMENT_JAR_DZONG_HELP',	'ART_DEF_IMPROVEMENT_JAR_DZONG', 1, 1,
	BuildableOnResources, InAdjacentFriendly, NoTwoAdjacent, CreatedByGreatPerson, DefenseModifier, NearbyEnemyDamage, NoFollowUp,
	 PillageGold,	Permanent, CultureBombRadius, MakesPassable, 2, 				 'CD_ECONOMIC_ATLAS',	54
FROM Improvements  WHERE Type= 'IMPROVEMENT_CITADEL';
------------------------------	
-- Improvement_Flavors
------------------------------		
INSERT INTO Improvement_Flavors	
(ImprovementType, 			FlavorType,			Flavor) VALUES
('IMPROVEMENT_JAR_DZONG',	'FLAVOR_OFFENSE',	20),
('IMPROVEMENT_JAR_DZONG',	'FLAVOR_DEFENSE',	20),
('IMPROVEMENT_JAR_DZONG',	'FLAVOR_CULTURE',	20),
('IMPROVEMENT_JAR_DZONG',	'FLAVOR_SCIENCE',	30),
('IMPROVEMENT_JAR_DZONG',	'FLAVOR_RELIGION',	30);
------------------------------	
-- Improvement_ValidTerrains
------------------------------		
INSERT INTO Improvement_ValidTerrains 	
		(ImprovementType,				TerrainType)
SELECT	'IMPROVEMENT_JAR_DZONG', 		'TERRAIN_MOUNTAIN' UNION ALL
SELECT	'IMPROVEMENT_JAR_DZONG',		TerrainType
FROM Improvement_ValidTerrains WHERE ImprovementType = 'IMPROVEMENT_CITADEL';
------------------------------	
-- Improvement_Yields
------------------------------		
INSERT INTO Improvement_Yields
		(ImprovementType,			YieldType,			Yield)
SELECT	'IMPROVEMENT_JAR_DZONG',	YieldType,			Yield
FROM Improvement_Yields WHERE ImprovementType = 'IMPROVEMENT_CITADEL' UNION ALL
SELECT	'IMPROVEMENT_JAR_DZONG',	YieldType,			Yield
FROM Improvement_Yields WHERE ImprovementType = 'IMPROVEMENT_HOLY_SITE';
-------------------------------------
-- Improvement_AdjacentMountainYieldChanges
-------------------------------------
INSERT INTO Improvement_AdjacentMountainYieldChanges
	(ImprovementType, YieldType, Yield)
VALUES
	('IMPROVEMENT_JAR_DZONG', 'YIELD_FOOD', 1);
------------------------------
-- Improvement_YieldPerXAdjacentImprovement
------------------------------
INSERT INTO Improvement_YieldPerXAdjacentImprovement
			(ImprovementType,		OtherImprovementType,		YieldType,			Yield,	NumRequired)
SELECT	'IMPROVEMENT_JAR_DZONG', 	'IMPROVEMENT_TRADING_POST', 'YIELD_CULTURE', 1, 1 UNION ALL
SELECT	'IMPROVEMENT_JAR_DZONG', 	'IMPROVEMENT_TRADING_POST', 'YIELD_FAITH', 1, 1;
------------------------------
-- Improvement_TechYieldChanges
------------------------------
INSERT INTO Improvement_TechYieldChanges
		(ImprovementType,			TechType, YieldType, Yield)
SELECT 	'IMPROVEMENT_JAR_DZONG',	TechType, YieldType, Yield
FROM Improvement_TechYieldChanges WHERE ImprovementType = 'IMPROVEMENT_CITADEL' UNION ALL
SELECT 	'IMPROVEMENT_JAR_DZONG',	TechType, YieldType, Yield
FROM Improvement_TechYieldChanges WHERE ImprovementType = 'IMPROVEMENT_HOLY_SITE';
------------------------------
-- Policy_ImprovementYieldChanges
------------------------------
INSERT INTO Policy_ImprovementYieldChanges
		(PolicyType,	ImprovementType,			YieldType,			Yield)
SELECT	 PolicyType,	'IMPROVEMENT_JAR_DZONG',	YieldType,			Yield
FROM Policy_ImprovementYieldChanges WHERE ImprovementType = 'IMPROVEMENT_CITADEL' UNION ALL
SELECT	 PolicyType,	'IMPROVEMENT_JAR_DZONG',	YieldType,			Yield
FROM Policy_ImprovementYieldChanges WHERE ImprovementType = 'IMPROVEMENT_HOLY_SITE';
------------------------------
-- Belief_ImprovementYieldChanges
------------------------------	
INSERT INTO Belief_ImprovementYieldChanges
		(BeliefType, 	ImprovementType, 			YieldType, Yield)
SELECT	 BeliefType,	'IMPROVEMENT_JAR_DZONG',	YieldType, Yield
FROM Belief_ImprovementYieldChanges WHERE ImprovementType = 'IMPROVEMENT_CITADEL' UNION ALL
SELECT	 BeliefType,	'IMPROVEMENT_JAR_DZONG',	YieldType, Yield
FROM Belief_ImprovementYieldChanges WHERE ImprovementType = 'IMPROVEMENT_HOLY_SITE';

--==========================================================================================================================
-- Builds
--==========================================================================================================================
INSERT INTO Builds		
		(Type,				Kill, ImprovementType, 			Description, 				Help, 							Recommendation, Time, EntityEvent, 	OrderPriority, 	IconIndex, 	IconAtlas, ShowInTechTree)
SELECT 	'BUILD_JAR_DZONG',	Kill, 'IMPROVEMENT_JAR_DZONG',	'TXT_KEY_BUILD_JAR_DZONG',	'TXT_KEY_BUILD_JAR_DZONG_HELP',	Recommendation,	Time, EntityEvent,	90,			55,	'CD_ECONOMIC_ATLAS', 0
FROM Builds WHERE Type='BUILD_CITADEL';
--------------------------------
-- BuildFeatures
--------------------------------
INSERT INTO BuildFeatures
		(BuildType, 		FeatureType, PrereqTech, Production, Time, Remove)
SELECT	('BUILD_JAR_DZONG'),FeatureType, PrereqTech, Production, Time, Remove
FROM BuildFeatures WHERE BuildType = 'BUILD_CITADEL';


