--------------------------------------------------------------------------------------------------
--Icon Atlas 
--------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases (Atlas,	IconSize,	IconsPerRow,	IconsPerColumn,	Filename)
SELECT 'LANDMINES_ATLAS',				256,		1,				1,				'LandmineAtlas256.dds' UNION ALL
SELECT 'LANDMINES_ATLAS',				64,			1,				1,				'LandmineAtlas64.dds' UNION ALL
SELECT 'LANDMINE_ACTION_ATLAS',			64,			1,				1,				'LandmineAction64.dds' UNION ALL
SELECT 'LANDMINE_ACTION_ATLAS',			45,			1,				1,				'LandmineAction45.dds';
--------------------------------------------------------------------------------------------------
--Improvements
--------------------------------------------------------------------------------------------------
INSERT INTO Improvements (Type,		DestroyedWhenPillaged,	OutsideBorders,	InAdjacentFriendly,	DefenseModifier,	Description,						Help,									Civilopedia,							ArtDefineTag,					IconAtlas,			PortraitIndex)
SELECT 'IMPROVEMENT_LANDMINE',		1,						1,				1,					10,					'TXT_KEY_IMPROVEMENT_LANDMINE',		'TXT_KEY_IMPROVEMENT_LANDMINE_HELP',	'TXT_KEY_IMPROVEMENT_LANDMINE_TEXT',	'ART_DEF_IMPROVEMENT_LANDMINE',	'LANDMINES_ATLAS',	0;

INSERT INTO Improvement_ValidTerrains (ImprovementType,		TerrainType)
SELECT 'IMPROVEMENT_LANDMINE',								'TERRAIN_GRASS' UNION ALL
SELECT 'IMPROVEMENT_LANDMINE',								'TERRAIN_SNOW' UNION ALL
SELECT 'IMPROVEMENT_LANDMINE',								'TERRAIN_DESERT' UNION ALL
SELECT 'IMPROVEMENT_LANDMINE',								'TERRAIN_TUNDRA' UNION ALL
SELECT 'IMPROVEMENT_LANDMINE',								'TERRAIN_PLAINS';

INSERT INTO Improvement_Flavors (ImprovementType,			FlavorType,					Flavor)
SELECT 'IMPROVEMENT_LANDMINE',								'FLAVOR_CITY_DEFENSE',		4 UNION ALL
SELECT 'IMPROVEMENT_LANDMINE',								'FLAVOR_RECON',				2 UNION ALL
SELECT 'IMPROVEMENT_LANDMINE',								'FLAVOR_OFFENSE',			2 UNION ALL
SELECT 'IMPROVEMENT_LANDMINE',								'FLAVOR_DEFENSE',			3;
--------------------------------------------------------------------------------------------------
--Builds
--------------------------------------------------------------------------------------------------
INSERT INTO Builds (Type,		PrereqTech,			Time,	ImprovementType,		Description,				Help,							Recommendation,					EntityEvent,			HotKey,		OrderPriority,	IconAtlas,					IconIndex)
SELECT 'BUILD_LANDMINE',		'TECH_DYNAMITE',	500,	'IMPROVEMENT_LANDMINE',	'TXT_KEY_BUILD_LANDMINE',	'TXT_KEY_BUILD_LANDMINE_HELP',	'TXT_KEY_BUILD_LANDMINE_REC',	'ENTITY_EVENT_BUILD',	'KB_M',		40,				'LANDMINE_ACTION_ATLAS',	0;

INSERT INTO BuildFeatures (BuildType,	FeatureType,		PrereqTech,				Time,   Remove)
SELECT 'BUILD_LANDMINE',				'FEATURE_MARSH',	'TECH_DYNAMITE',		200,	0 UNION ALL
SELECT 'BUILD_LANDMINE',				'FEATURE_JUNGLE',	'TECH_DYNAMITE',		200,	0;
--------------------------------------------------------------------------------------------------
--Units 
--------------------------------------------------------------------------------------------------
INSERT INTO Unit_Builds (BuildType,		UnitType)
SELECT 'BUILD_LANDMINE',				'UNIT_GREAT_WAR_INFANTRY' UNION ALL
SELECT 'BUILD_LANDMINE',				'UNIT_FRENCH_FOREIGNLEGION' UNION ALL
SELECT 'BUILD_LANDMINE',				'UNIT_MACHINE_GUN' UNION ALL
SELECT 'BUILD_LANDMINE',				'UNIT_INFANTRY' UNION ALL
SELECT 'BUILD_LANDMINE',				'UNIT_BRAZILIAN_PRACINHA' UNION ALL
SELECT 'BUILD_LANDMINE',				'UNIT_MARINE' UNION ALL
SELECT 'BUILD_LANDMINE',				'UNIT_PARATROOPER' UNION ALL
SELECT 'BUILD_LANDMINE',				'UNIT_MECHANIZED_INFANTRY' UNION ALL
SELECT 'BUILD_LANDMINE',				'UNIT_XCOM_SQUAD';

INSERT INTO Unit_Flavors (FlavorType,	Flavor, UnitType)
SELECT 'FLAVOR_TILE_IMPROVEMENT',		1,		'UNIT_GREAT_WAR_INFANTRY' UNION ALL
SELECT 'FLAVOR_TILE_IMPROVEMENT',		1,		'UNIT_FRENCH_FOREIGNLEGION' UNION ALL
SELECT 'FLAVOR_TILE_IMPROVEMENT',		1,		'UNIT_MACHINE_GUN' UNION ALL
SELECT 'FLAVOR_TILE_IMPROVEMENT',		1,		'UNIT_INFANTRY' UNION ALL
SELECT 'FLAVOR_TILE_IMPROVEMENT',		1,		'UNIT_BRAZILIAN_PRACINHA' UNION ALL
SELECT 'FLAVOR_TILE_IMPROVEMENT',		1,		'UNIT_MARINE' UNION ALL
SELECT 'FLAVOR_TILE_IMPROVEMENT',		1,		'UNIT_PARATROOPER' UNION ALL
SELECT 'FLAVOR_TILE_IMPROVEMENT',		1,		'UNIT_MECHANIZED_INFANTRY' UNION ALL
SELECT 'FLAVOR_TILE_IMPROVEMENT',		1,		'UNIT_XCOM_SQUAD';
--------------------------------------------------------------------------------------------------
--Promotions
--------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions (Type,	CannotBeChosen,	LostWithUpgrade,	Description,					Help,								PediaEntry,						IconAtlas,			PortraitIndex,	Sound,				PediaType)
SELECT 'PROMOTION_LANDMINES',		1,				1,					'TXT_KEY_PROMOTION_LANDMINES',	'TXT_KEY_PROMOTION_LANDMINES_HELP',	'TXT_KEY_PROMOTION_LANDMINES',	'PROMOTION_ATLAS',	12,				'AS2D_IF_LEVELUP',	'PEDIA_SHARED';

INSERT INTO Unit_FreePromotions (PromotionType,	UnitType)
SELECT 'PROMOTION_LANDMINES',					'UNIT_GREAT_WAR_INFANTRY' UNION ALL
SELECT 'PROMOTION_LANDMINES',					'UNIT_FRENCH_FOREIGNLEGION' UNION ALL
SELECT 'PROMOTION_LANDMINES',					'UNIT_MACHINE_GUN' UNION ALL
SELECT 'PROMOTION_LANDMINES',					'UNIT_INFANTRY' UNION ALL
SELECT 'PROMOTION_LANDMINES',					'UNIT_BRAZILIAN_PRACINHA' UNION ALL
SELECT 'PROMOTION_LANDMINES',					'UNIT_MARINE' UNION ALL
SELECT 'PROMOTION_LANDMINES',					'UNIT_PARATROOPER' UNION ALL
SELECT 'PROMOTION_LANDMINES',					'UNIT_MECHANIZED_INFANTRY' UNION ALL
SELECT 'PROMOTION_LANDMINES',					'UNIT_XCOM_SQUAD';
--------------------------------------------------------------------------------------------------
--Artdefines
-------------------------------------------------------------------------------------------------- 
INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType,			Asset)
SELECT 'ART_DEF_IMPROVEMENT_LANDMINE',					'Improvement',		'SV_Landmine.dds';

INSERT INTO ArtDefine_LandmarkTypes (Type,				LandmarkType,		FriendlyName)
SELECT 'ART_DEF_IMPROVEMENT_LANDMINE',					'Improvement',		'Landmine';

INSERT INTO ArtDefine_Landmarks (ImprovementType,	Scale,	State,	Era,	LayoutHandler,	ResourceType,			Model,							TerrainContour)
SELECT 'ART_DEF_IMPROVEMENT_LANDMINE',				0.1,	'Any',	'Any',	'RANDOM',		'ART_DEF_RESOURCE_ALL',	'Barbarian_Village2.fxsxml',	1;
--------------------------------------------------------------------------------------------------
--Unit Updates 
--------------------------------------------------------------------------------------------------
UPDATE Units SET WorkRate = 100 WHERE Type IN ( 'UNIT_INFANTRY', 'UNIT_FRENCH_FOREIGNLEGION', 'UNIT_MARINE', 'UNIT_PARATROOPER', 'UNIT_MECHANIZED_INFANTRY' );
UPDATE Units SET WorkRate = 100 WHERE Type IN ( 'UNIT_GREAT_WAR_INFANTRY', 'UNIT_MACHINE_GUN' );
UPDATE Units SET WorkRate = 100 WHERE Type IN ( 'UNIT_BRAZILIAN_PRACINHA', 'UNIT_XCOM_SQUAD' );


