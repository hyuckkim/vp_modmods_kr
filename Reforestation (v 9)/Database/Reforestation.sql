--------------------------------------------------------------------------------------------------
--Improvements 
--------------------------------------------------------------------------------------------------
INSERT INTO Improvements (Type,		DestroyedWhenPillaged,	OutsideBorders,	Description,						Help,											Civilopedia,									ArtDefineTag,						IconAtlas,			PortraitIndex)
SELECT 'IMPROVEMENT_PLANT_FOREST',	1,						1,				'TXT_KEY_IMPROVEMENT_PLANT_FOREST',	'TXT_KEY_CIV5_IMPROVEMENTS_PLANT_FOREST_HELP',	'TXT_KEY_CIV5_IMPROVEMENTS_PLANT_FOREST_TEXT',	'ART_DEF_IMPROVEMENT_PLANT_FOREST',	'REFOREST_ATLAS',	0;

--------------------------------------------------------------------------------------------------
--Improvement Yields
--------------------------------------------------------------------------------------------------
INSERT INTO Improvement_Yields (ImprovementType,		YieldType,				Yield)
SELECT 'IMPROVEMENT_PLANT_FOREST',						'YIELD_PRODUCTION',		1;

--------------------------------------------------------------------------------------------------
--Improvement Terrains
--------------------------------------------------------------------------------------------------
INSERT INTO Improvement_ValidTerrains (ImprovementType,	TerrainType)
SELECT 'IMPROVEMENT_PLANT_FOREST',						'TERRAIN_PLAINS' UNION ALL
SELECT 'IMPROVEMENT_PLANT_FOREST',						'TERRAIN_GRASS' UNION ALL
SELECT 'IMPROVEMENT_PLANT_FOREST',						'TERRAIN_TUNDRA' UNION ALL
SELECT 'IMPROVEMENT_PLANT_FOREST',						'TERRAIN_SNOW';

--------------------------------------------------------------------------------------------------
--Improvement Features
--------------------------------------------------------------------------------------------------
INSERT INTO Improvement_ValidFeatures (ImprovementType,	FeatureType)
SELECT 'IMPROVEMENT_PLANT_FOREST',						'FEATURE_FOREST' UNION ALL
SELECT 'IMPROVEMENT_PLANT_FOREST',						'FEATURE_MARSH';

--------------------------------------------------------------------------------------------------
--Improvement Features
--------------------------------------------------------------------------------------------------
INSERT INTO Improvement_Flavors (ImprovementType,		FlavorType,				Flavor)
SELECT 'IMPROVEMENT_PLANT_FOREST',						'FLAVOR_PRODUCTION',	5;

--------------------------------------------------------------------------------------------------
--Builds 
--------------------------------------------------------------------------------------------------
INSERT INTO Builds (Type,	PrereqTech,				Time,	ImprovementType,			Description,			Help,							Recommendation,				EntityEvent,				HotKey,		OrderPriority,	IconAtlas,						IconIndex)
SELECT 'BUILD_FOREST',		'TECH_FERTILIZER',		900,	'IMPROVEMENT_PLANT_FOREST',	'TXT_KEY_BUILD_FOREST',	'TXT_KEY_BUILD_FOREST_HELP',	'TXT_KEY_BUILD_FOREST_REC',	'ENTITY_EVENT_IRRIGATE',	'KB_F',		37,				'UNIT_ACTION_REFOREST_ATLAS',	0;

--------------------------------------------------------------------------------------------------
--Build Features 
--------------------------------------------------------------------------------------------------
INSERT INTO BuildFeatures (BuildType,	FeatureType,		PrereqTech,				Time,   Production,	Remove)
SELECT 'BUILD_FOREST',					'FEATURE_FOREST',	'TECH_FERTILIZER',		900,	40,			1 UNION ALL
SELECT 'BUILD_FOREST',					'FEATURE_MARSH',	'TECH_FERTILIZER',		900,	0,			1;

--------------------------------------------------------------------------------------------------
--Unit Builds 
--------------------------------------------------------------------------------------------------
INSERT INTO Unit_Builds (UnitType,	BuildType) 
SELECT	Type, 'BUILD_FOREST'
FROM Units WHERE Class = 'UNITCLASS_WORKER';

--------------------------------------------------------------------------------------------------
--Icon Atlas 
--------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases (Atlas,	IconSize,	IconsPerRow,	IconsPerColumn,	Filename)
SELECT 'REFOREST_ATLAS',				256,		1,				1,				'ForestAtlas256.dds' UNION ALL
SELECT 'REFOREST_ATLAS',				64,			1,				1,				'ForestAtlas64.dds' UNION ALL
SELECT 'UNIT_ACTION_REFOREST_ATLAS',	64,			1,				1,				'UnitAction64_Forest.dds' UNION ALL
SELECT 'UNIT_ACTION_REFOREST_ATLAS',	45,			1,				1,				'UnitAction45_Forest.dds';

--------------------------------------------------------------------------------------------------
--Artdefines
-------------------------------------------------------------------------------------------------- 
INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType,			Asset)
SELECT 'ART_DEF_IMPROVEMENT_PLANT_FOREST',				'Improvement',		'SV_PlantForest.dds';

INSERT INTO ArtDefine_LandmarkTypes (Type,				LandmarkType,		FriendlyName)
SELECT 'ART_DEF_IMPROVEMENT_PLANT_FOREST',				'Improvement',		'PlantForest';

INSERT INTO ArtDefine_Landmarks (Era,	State,		Scale,	ImprovementType,					LayoutHandler,	ResourceType,				Model,						TerrainContour)
SELECT 'Any',							'Any',		1.0,	'ART_DEF_IMPROVEMENT_PLANT_FOREST', 'SNAPSHOT',		'ART_DEF_RESOURCE_NONE',	'resource_timber.fxsxml',	1;

-------------------------------------------------------------------------------------------------- 
--Compatibility
-------------------------------------------------------------------------------------------------- 
CREATE TRIGGER ReforestationMod_01
AFTER INSERT ON Units
WHEN NEW.Class = 'UNITCLASS_WORKER' 
BEGIN
	INSERT INTO Unit_Builds (NEW.Type,	'BUILD_FOREST')
END;