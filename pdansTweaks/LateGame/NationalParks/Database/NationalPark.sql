--------------------------------------------------------------------------------------------------
--Improvements 
--------------------------------------------------------------------------------------------------
INSERT INTO Improvements (Type,		DestroyedWhenPillaged,	RequiresFeature,	BuildableOnResources, 	Description,							Civilopedia,								ArtDefineTag,							IconAtlas,				PortraitIndex)
SELECT 'IMPROVEMENT_NATIONAL_PARK',	1,						1,					1, 						'TXT_KEY_IMPROVEMENT_NATIONAL_PARK',	'TXT_KEY_IMPROVEMENT_NATIONAL_PARK_TEXT',	'ART_DEF_IMPROVEMENT_NATIONAL_PARK',	'NATIONAL_PARK_ATLAS',	0;
--------------------------------------------------------------------------------------------------
--Improvement Terrains
--------------------------------------------------------------------------------------------------
INSERT INTO Improvement_ValidTerrains (ImprovementType,	TerrainType)
SELECT 'IMPROVEMENT_NATIONAL_PARK',						'TERRAIN_PLAINS' UNION ALL
SELECT 'IMPROVEMENT_NATIONAL_PARK',						'TERRAIN_GRASS' UNION ALL
SELECT 'IMPROVEMENT_NATIONAL_PARK',						'TERRAIN_TUNDRA' UNION ALL
SELECT 'IMPROVEMENT_NATIONAL_PARK',						'TERRAIN_SNOW';
--------------------------------------------------------------------------------------------------
--Improvement Features
--------------------------------------------------------------------------------------------------
INSERT INTO Improvement_ValidFeatures (ImprovementType,	FeatureType)
SELECT 'IMPROVEMENT_NATIONAL_PARK',						'FEATURE_FOREST' UNION ALL
SELECT 'IMPROVEMENT_NATIONAL_PARK',						'FEATURE_JUNGLE' UNION ALL
SELECT 'IMPROVEMENT_NATIONAL_PARK',						'FEATURE_MARSH';
--------------------------------------------------------------------------------------------------
--Improvement Yields
--------------------------------------------------------------------------------------------------
INSERT INTO Improvement_Yields 	(ImprovementType,				YieldType,				Yield)
VALUES							('IMPROVEMENT_NATIONAL_PARK',	'YIELD_CULTURE',		1),
								('IMPROVEMENT_NATIONAL_PARK',	'YIELD_SCIENCE',		1),
								('IMPROVEMENT_NATIONAL_PARK',	'YIELD_TOURISM',		1);
------------------------------
-- Improvement_TechYieldChanges
------------------------------
INSERT INTO Improvement_TechYieldChanges
			(ImprovementType,				TechType,			YieldType,			Yield)
VALUES		('IMPROVEMENT_NATIONAL_PARK',	'TECH_ECOLOGY',		'YIELD_CULTURE',		2),
			('IMPROVEMENT_NATIONAL_PARK',	'TECH_ECOLOGY',		'YIELD_SCIENCE',		2),
			('IMPROVEMENT_NATIONAL_PARK',	'TECH_ECOLOGY',		'YIELD_TOURISM',		2);
--------------------------------------------------------------------------------------------------
--Improvement Yields
--------------------------------------------------------------------------------------------------
INSERT INTO Improvement_YieldAdjacentSameType 	
		(ImprovementType,				YieldType,			Yield)
VALUES	('IMPROVEMENT_NATIONAL_PARK',	'YIELD_CULTURE',	1),
		('IMPROVEMENT_NATIONAL_PARK',	'YIELD_SCIENCE',	1);
------------------------------
-- Improvement_AdjacentFeatureYieldChanges
------------------------------
INSERT INTO Improvement_AdjacentFeatureYieldChanges	(ImprovementType, FeatureType, YieldType, Yield) SELECT 'IMPROVEMENT_NATIONAL_PARK', Type, 'YIELD_CULTURE', 2 FROM Features WHERE NaturalWonder = 1;
INSERT INTO Improvement_AdjacentFeatureYieldChanges	(ImprovementType, FeatureType, YieldType, Yield) SELECT 'IMPROVEMENT_NATIONAL_PARK', Type, 'YIELD_SCIENCE', 2 FROM Features WHERE NaturalWonder = 1;
--------------------------------------------------------------------------------------------------
--Builds 
--------------------------------------------------------------------------------------------------
INSERT INTO Builds (Type,		PrereqTech,			Time,	ImprovementType,				Description,					Help,								Recommendation,						EntityEvent,				HotKey,		OrderPriority,	IconAtlas,						IconIndex)
SELECT 'BUILD_NATIONAL_PARK',	'TECH_BIOLOGY',		500,	'IMPROVEMENT_NATIONAL_PARK',	'TXT_KEY_BUILD_NATIONAL_PARK',	'TXT_KEY_BUILD_NATIONAL_PARK_HELP',	'TXT_KEY_BUILD_NATIONAL_PARK_REC',	'ENTITY_EVENT_IRRIGATE',	'KB_F',		37,				'UNIT_ACTION_NATIONAL_PARK_ATLAS',	0;
--------------------------------------------------------------------------------------------------
--Unit Builds 
--------------------------------------------------------------------------------------------------
INSERT INTO Unit_Builds (UnitType,	BuildType) 
SELECT	Type, 'BUILD_NATIONAL_PARK'
FROM Units WHERE Class = 'UNITCLASS_WORKER';
--------------------------------------------------------------------------------------------------
--Artdefines
-------------------------------------------------------------------------------------------------- 
INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType,			Asset)
SELECT 'ART_DEF_IMPROVEMENT_NATIONAL_PARK',				'Improvement',		'SV_PlantForest.dds';

INSERT INTO ArtDefine_LandmarkTypes (Type,				LandmarkType,		FriendlyName)
SELECT 'ART_DEF_IMPROVEMENT_NATIONAL_PARK',				'Improvement',		'Park';

 INSERT INTO ArtDefine_Landmarks(Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
 SELECT 'Any', 'UnderConstruction', 0.55,  'ART_DEF_IMPROVEMENT_NATIONAL_PARK', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'WatchTower_HB.fxsxml', 1 UNION ALL
 SELECT 'Any', 'Constructed',       0.55,  'ART_DEF_IMPROVEMENT_NATIONAL_PARK', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'WatchTower.fxsxml',    1;
-------------------------------------------------------------------------------------------------- 
--Zoo Changes
-------------------------------------------------------------------------------------------------- 
UPDATE Buildings SET FinishLandTRTourism = 0 WHERE BuildingClass = 'BUILDINGCLASS_THEATRE';
UPDATE Buildings SET FinishSeaTRTourism = 0 WHERE BuildingClass = 'BUILDINGCLASS_THEATRE';
DELETE FROM Building_FeatureYieldChanges WHERE YieldType = 'YIELD_TOURISM' AND BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_THEATRE');
UPDATE Building_FeatureYieldChanges SET Yield = 1 WHERE YieldType = 'YIELD_CULTURE' AND BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_THEATRE');

DELETE FROM Building_ImprovementYieldChanges WHERE BuildingType = 'BUILDING_SPAIN_BULLRING' AND EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_SPAIN_BULLRING');

INSERT INTO Building_ImprovementYieldChanges
		(BuildingType, 					ImprovementType, 				YieldType, 			Yield)
VALUES	('BUILDING_THEATRE', 			'IMPROVEMENT_NATIONAL_PARK', 	'YIELD_TOURISM', 	2);

INSERT INTO Building_ImprovementYieldChanges
		(BuildingType, 				ImprovementType, 				YieldType, 			Yield)
SELECT 	'BUILDING_SPAIN_BULLRING', 	'IMPROVEMENT_NATIONAL_PARK', 	'YIELD_TOURISM', 	2 WHERE EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_SPAIN_BULLRING');
INSERT INTO Building_ImprovementYieldChanges
		(BuildingType, 				ImprovementType, 				YieldType, 			Yield)
SELECT 	'BUILDING_SPAIN_BULLRING', 	'IMPROVEMENT_PASTURE', 			'YIELD_TOURISM', 	2 WHERE EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_SPAIN_BULLRING');
INSERT INTO Building_ImprovementYieldChanges
		(BuildingType, 				ImprovementType, 				YieldType, 			Yield)
SELECT 	'BUILDING_SPAIN_BULLRING', 	'IMPROVEMENT_PASTURE', 			'YIELD_CULTURE', 	1 WHERE EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_SPAIN_BULLRING');

UPDATE Language_en_US
SET Text = '+500 [ICON_RESEARCH] Science when completed. +1 [ICON_CULTURE] Culture from nearby Jungle and Forest and +2 [ICON_TOURISM] Tourism from nearby National Parks.[NEWLINE][NEWLINE]-1 [ICON_HAPPINESS_3] Unhappiness from [ICON_CULTURE] Boredom. Requires a Circus in the City.'
WHERE Tag = 'TXT_KEY_BUILDING_THEATRE_HELP';

UPDATE Language_en_US
SET Text = '+500 [ICON_RESEARCH] Science when completed. +1 [ICON_CULTURE] Culture from nearby Jungle and Forest tiles. +2 [ICON_TOURISM] Tourism from nearby National Parks. +1 [ICON_CULTURE] Culture and +2 [ICON_TOURISM] Tourism from Nearby Pastures.[NEWLINE][NEWLINE]Trigger a "We Love the King Day" in this city whenever it completes a [COLOR_POSITIVE_TEXT]Public Works Project[ENDCOLOR]. Gain 100 [ICON_CULTURE] Culture, [ICON_PEACE] Faith, and [ICON_GOLD] Gold whenever a "We Love the King Day" begins, Scaling with Era.[NEWLINE][NEWLINE]-1 [ICON_HAPPINESS_3] Unhappiness from [ICON_CULTURE] Boredom.'
WHERE Tag = 'TXT_KEY_BUILDING_SPAIN_BULLRING_HELP' AND EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_SPAIN_BULLRING');
-------------------------------------------------------------------------------------------------- 
--Compatibility
-------------------------------------------------------------------------------------------------- 
CREATE TRIGGER NationalParkMod_01
AFTER INSERT ON Units
WHEN NEW.Class = 'UNITCLASS_WORKER' 
BEGIN
	INSERT INTO Unit_Builds (UnitType,	BuildType) 
	VALUES (NEW.Type,	'BUILD_NATIONAL_PARK');
END;
--------------------------------------------------------------------------------------------------
--Icon Atlas 
--------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas,								IconSize,		IconsPerRow,	IconsPerColumn,	Filename)
VALUES 	('NATIONAL_PARK_ATLAS',				256,			1,				1,				'ForestAtlas256.dds'),
		('NATIONAL_PARK_ATLAS',				64,				1,				1,				'ForestAtlas64.dds'),
		('UNIT_ACTION_NATIONAL_PARK_ATLAS',	64,				1,				1,				'UnitAction64_Forest.dds'),
		('UNIT_ACTION_NATIONAL_PARK_ATLAS',	45,				1,				1,				'UnitAction45_Forest.dds');