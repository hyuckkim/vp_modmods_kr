UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_PLOT';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'IMPROVEMENTS_EXTENSIONS';
------------------------------
-- Builds
------------------------------
INSERT INTO Builds
		(Type, 						ImprovementType, 				Kill,	EntityEvent, HotKey, OrderPriority, Description, 						Help, 								Recommendation, 					IconIndex, IconAtlas)
SELECT	'BUILD_JAR_STRATOUTPOST',	'IMPROVEMENT_JAR_STRATOUTPOST',	1,		EntityEvent, HotKey, OrderPriority, 'TXT_KEY_BUILD_JAR_STRATOUTPOST', 	'TXT_KEY_JAR_STRATOUTPOST_HELP', 	'TXT_KEY_BUILD_JAR_STRATOUTPOST_REC', 1, 'JAR_STRATOUTPOST_ATLAS'
FROM Builds WHERE Type='BUILD_MINE';

UPDATE Builds SET PrereqTech = (SELECT PrereqTech FROM Units Where Type='UNIT_PARATROOPER') WHERE Type='BUILD_JAR_STRATOUTPOST';
------------------------------
-- BuildFeatures
------------------------------
INSERT INTO BuildFeatures
		(BuildType, 				FeatureType,	PrereqTech,	Time,	Production, Remove)
SELECT	'BUILD_JAR_STRATOUTPOST',	FeatureType,	PrereqTech,	Time,	Production,	Remove
FROM BuildFeatures WHERE BuildType = 'BUILD_ACADEMY';
------------------------------
-- Units
------------------------------
UPDATE Units SET Workrate= 1
WHERE Class in ('UNITCLASS_PARATROOPER','UNITCLASS_MARINE','UNITCLASS_XCOM_SQUAD');
------------------------------
-- Unit_Builds
------------------------------
INSERT INTO Unit_Builds (UnitType, BuildType)
SELECT Type, 'BUILD_JAR_STRATOUTPOST' FROM Units
WHERE Class in ('UNITCLASS_PARATROOPER','UNITCLASS_MARINE','UNITCLASS_XCOM_SQUAD');
------------------------------
-- Improvements
------------------------------
INSERT INTO Improvements
		(Type,							Description,				Civilopedia, 						Help,								ArtDefineTag,							IconAtlas,	PortraitIndex)
SELECT	'IMPROVEMENT_JAR_STRATOUTPOST',	'TXT_KEY_JAR_STRATOUTPOST',	'TXT_KEY_JAR_STRATOUTPOST_TEXT',	'TXT_KEY_JAR_STRATOUTPOST_HELP',	'ART_DEF_IMPROVEMENT_JAR_STRATOUTPOST1',	'JAR_STRATOUTPOST_ATLAS',	0
FROM Improvements WHERE Type = 'IMPROVEMENT_CUSTOMS_HOUSE';

UPDATE Improvements SET OutsideBorders=1, Permanent=1, DefenseModifier=10, GrantsVisionXTiles=1, NewOwner=1
WHERE Type='IMPROVEMENT_JAR_STRATOUTPOST';
------------------------------
-- Improvement_ResourceTypes
------------------------------
INSERT INTO Improvement_ResourceTypes
		(ImprovementType, 				ResourceType, ResourceMakesValid, ResourceTrade)
SELECT 	'IMPROVEMENT_JAR_STRATOUTPOST', Type, 		  1, 					1
FROM Resources WHERE ResourceClassType in ('RESOURCECLASS_RUSH','RESOURCECLASS_MODERN')
AND NOT Type in ('RESOURCE_ARTIFACTS','RESOURCE_HIDDEN_ARTIFACTS');
------------------------------
-- Improvement_ResourceType_Yields
------------------------------
INSERT INTO Improvement_ResourceType_Yields
		(ImprovementType, ResourceType, YieldType, Yield)
SELECT	'IMPROVEMENT_JAR_STRATOUTPOST', ResourceType, YieldType, Yield FROM Improvement_ResourceType_Yields WHERE ImprovementType='IMPROVEMENT_WELL' UNION ALL
SELECT	'IMPROVEMENT_JAR_STRATOUTPOST', ResourceType, YieldType, Yield FROM Improvement_ResourceType_Yields WHERE ImprovementType='IMPROVEMENT_PASTURE' AND ResourceType='RESOURCE_HORSE' UNION ALL
--SELECT	'IMPROVEMENT_JAR_STRATOUTPOST', 'RESOURCE_IRON', 	'YIELD_PRODUCTION', 1 UNION ALL
--SELECT	'IMPROVEMENT_JAR_STRATOUTPOST', 'RESOURCE_URANIUM', 'YIELD_PRODUCTION', 1 UNION ALL
SELECT	'IMPROVEMENT_JAR_STRATOUTPOST', ResourceType, YieldType, Yield
FROM Improvement_ResourceType_Yields WHERE ResourceType in ('RESOURCE_ALUMINUM','RESOURCE_COAL','RESOURCE_IRON','RESOURCE_URANIUM');
------------------------------
-- Policy_ImprovementYieldChanges
------------------------------
INSERT INTO Policy_ImprovementYieldChanges
		(PolicyType,	ImprovementType,				YieldType,	Yield)
SELECT	 PolicyType,	'IMPROVEMENT_JAR_STRATOUTPOST',	YieldType,	Yield
from Policy_ImprovementYieldChanges where ImprovementType = 'IMPROVEMENT_MINE';
------------------------------
-- Improvement_TechYieldChanges
------------------------------
INSERT INTO Improvement_TechYieldChanges
		(ImprovementType,				TechType,	YieldType, Yield)
SELECT 	'IMPROVEMENT_JAR_STRATOUTPOST',	TechType,	YieldType, Yield
FROM Improvement_TechYieldChanges WHERE ImprovementType='IMPROVEMENT_MINE';
--==========================================================================================================================
-- ICON ATLASES
--==========================================================================================================================
-- IconTextureAtlases
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 						IconSize, 	Filename, 						IconsPerRow, 	IconsPerColumn)
VALUES	('JAR_STRATOUTPOST_ATLAS', 		256, 		'Jar_StratOutpost_256.dds',		2,				1),
		('JAR_STRATOUTPOST_ATLAS', 		128, 		'Jar_StratOutpost_128.dds',		2, 				1),
		('JAR_STRATOUTPOST_ATLAS', 		80, 		'Jar_StratOutpost_80.dds',		2, 				1),
		('JAR_STRATOUTPOST_ATLAS', 		64, 		'Jar_StratOutpost_64.dds',		2, 				1),
		('JAR_STRATOUTPOST_ATLAS', 		45, 		'Jar_StratOutpost_45.dds',		2, 				1),
		('JAR_STRATOUTPOST_ATLAS', 		32, 		'Jar_StratOutpost_32.dds',		2, 				1),
		('JAR_STRATOUTPOST_ATLAS', 		16, 		'Jar_StratOutpost_16.dds',		2, 				1);
--==========================================================================================================================
-- ArtDefine_LandmarkTypes
--==========================================================================================================================
INSERT INTO ArtDefine_LandmarkTypes 
		(Type, 									LandmarkType,	FriendlyName)
VALUES	('ART_DEF_IMPROVEMENT_JAR_STRATOUTPOST1','Improvement', 	'JARCAST_STRATOUTPOST'),
		('ART_DEF_IMPROVEMENT_JAR_STRATOUTPOST2','Improvement', 	'JARCAST_STRATOUTPOST');
------------------------------
-- ArtDefine_StrategicView
------------------------------	
INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)
SELECT 'ART_DEF_IMPROVEMENT_JAR_STRATOUTPOST1', 'Improvement', 'sv_StratOutpost.dds' UNION ALL
SELECT 'ART_DEF_IMPROVEMENT_JAR_STRATOUTPOST2', 'Improvement', 'sv_StratOutpost.dds';
--==========================================================================================================================
-- ArtDefine_Landmarks
--==========================================================================================================================
INSERT INTO ArtDefine_Landmarks 
		(ImprovementType, 							Era,	State,				 Scale, LayoutHandler,	ResourceType,			Model,			TerrainContour)
VALUES	('ART_DEF_IMPROVEMENT_JAR_STRATOUTPOST1',	'Any', 	'UnderConstruction', 0.8,	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL', 'Depot Postapocalyptic HB.fxsxml', 1),
		('ART_DEF_IMPROVEMENT_JAR_STRATOUTPOST1',	'Any', 	'Constructed',		 0.8,	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL', 'Depot Postapocalyptic B.fxsxml', 1),
		('ART_DEF_IMPROVEMENT_JAR_STRATOUTPOST1',	'Any', 	'Pillaged',			 0.8,	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL', 'Depot Postapocalyptic PL.fxsxml', 1);

INSERT INTO ArtDefine_Landmarks 
		(ImprovementType, 							Era,	State,				 Scale, LayoutHandler,	ResourceType,			Model,				TerrainContour)
VALUES	('ART_DEF_IMPROVEMENT_JAR_STRATOUTPOST2',	'Any', 	'UnderConstruction', 1.0,	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL', 'Outpost3_HB.fxsxml', 	1),
		('ART_DEF_IMPROVEMENT_JAR_STRATOUTPOST2',	'Any', 	'Constructed',		 1.0,	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL', 'Outpost3.fxsxml', 		1),
		('ART_DEF_IMPROVEMENT_JAR_STRATOUTPOST2',	'Any', 	'Pillaged',			 1.0,	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL', 'Outpost3_PL.fxsxml', 	1);
--==========================================================================================================================
INSERT OR REPLACE INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_JAR_STRATOUTPOST', 'Extraction Outpost'),
('TXT_KEY_JAR_STRATOUTPOST_HELP', 'May only be constructed on Strategic Resources.'),
('TXT_KEY_JAR_STRATOUTPOST_TEXT', ''),
('TXT_KEY_BUILD_JAR_STRATOUTPOST', 'Construct an [LINK=IMPROVEMENT_JAR_STRATOUTPOST]Extraction Outpost[\LINK]'),
('TXT_KEY_BUILD_JAR_STRATOUTPOST_REC', 'It will improve and connect any Strategic Resource on the tile to your Empire.');

INSERT OR REPLACE INTO Language_ko_KR (Tag, Text) VALUES
('TXT_KEY_JAR_STRATOUTPOST', '자원 추출기지'),
('TXT_KEY_JAR_STRATOUTPOST_HELP', '전략 자원에서만 건설할 수 있습니다.'),
('TXT_KEY_JAR_STRATOUTPOST_TEXT', ''),
('TXT_KEY_BUILD_JAR_STRATOUTPOST', '[LINK=IMPROVEMENT_JAR_STRATOUTPOST]자원 추출기지[\LINK] 건설'),
('TXT_KEY_BUILD_JAR_STRATOUTPOST_REC', '타일에 있는 모든 전략 자원을 개선하고 문명과 연결해줍니다.');
--==========================================================================================================================
--==========================================================================================================================