
--------------------------------------------------------------------------------------------------
--Unit builds 
--------------------------------------------------------------------------------------------------
INSERT INTO Unit_Builds		(UnitType,			BuildType)
	VALUES					('UNIT_WORKER',		'BUILD_BURNT');

--------------------------------------------------------------------------------------------------
--Builds
--------------------------------------------------------------------------------------------------
INSERT INTO Builds		(Type,			Description,				Help,						HotKey,	ImprovementType,		EntityEvent,				IconIndex,	IconAtlas,					ShowInTechTree)
	VALUES				('BUILD_BURNT',	'TXT_KEY_BUILD_BURNT',		'TXT_KEY_BUILD_BURNT_HELP',	'KB_F',	'IMPROVEMENT_BURNT',	'ENTITY_EVENT_IRRIGATE',	1,			'BUILDBURNT_ICON_ATLAS',	0);

--------------------------------------------------------------------------------------------------
-- BuildFeatures
--------------------------------------------------------------------------------------------------
INSERT INTO BuildFeatures	(BuildType,		FeatureType,		Time,	Production,	Cost,	Remove,	RemoveOnly)
	VALUES					('BUILD_BURNT',	'FEATURE_JUNGLE',	0,		0,			0,		0,		0),
							('BUILD_BURNT',	'FEATURE_FOREST',	0,		0,			0,		0,		0);

--------------------------------------------------------------------------------------------------
--Improvement_ValidImprovements
--------------------------------------------------------------------------------------------------
INSERT INTO Improvement_ValidImprovements	(ImprovementType,		PrereqImprovement)
	VALUES									('IMPROVEMENT_BURNT',	'IMPROVEMENT_WILDFIRE');

--------------------------------------------------------------------------------------------------
--Improvements 
--------------------------------------------------------------------------------------------------
INSERT INTO Improvements	(Type,						DestroyedWhenPillaged,	OutsideBorders,	IgnoreOwnership,	GraphicalOnly,	Description,							Help,								Civilopedia,									ArtDefineTag,						FeatureGrowth,	IconAtlas,	PortraitIndex,	CreatesFeature,		RemoveWhenComplete,	OwnerOnly)
SELECT						'IMPROVEMENT_GROW_FOREST',	1,						1,				1,					1,				'TXT_KEY_CIV5_IMPROVEMENT_GROW_FOREST',	'TXT_KEY_IMPROVEMENT_YOUNG_FOREST',	'TXT_KEY_CIV5_IMPROVEMENT_YOUNG_FOREST_HELP',	'ART_DEF_IMPROVEMENT_YOUNG_FOREST',	1,				'TG_ATLAS',	0,				'FEATURE_FOREST',	1,					0			UNION ALL
SELECT						'IMPROVEMENT_GROW_JUNGLE',	1,						1,				1,					1,				'TXT_KEY_CIV5_IMPROVEMENT_GROW_JUNGLE',	'TXT_KEY_IMPROVEMENT_TROPICAL_VEG',	'TXT_KEY_CIV5_IMPROVEMENT_TROPICAL_VEG_HELP',	'ART_DEF_IMPROVEMENT_TROPICAL_VEG',	1,				'TG_ATLAS',	0,				'FEATURE_JUNGLE',	1,					0;

INSERT INTO Improvements	(Type,						DestroyedWhenPillaged,	OutsideBorders,	IgnoreOwnership,	GraphicalOnly,	Description,						Help,								Civilopedia,									ArtDefineTag,						ImprovementUpgrade,			UpgradeTime,	DefenseModifier,	PillageGold,	IconAtlas,	PortraitIndex,	RemoveWhenComplete,	OwnerOnly)
SELECT						'IMPROVEMENT_YOUNG_FOREST',	1,						1,				1,					1,				'TXT_KEY_IMPROVEMENT_YOUNG_FOREST',	'TXT_KEY_IMPROVEMENT_YOUNG_FOREST',	'TXT_KEY_CIV5_IMPROVEMENT_YOUNG_FOREST_HELP',	'ART_DEF_IMPROVEMENT_YOUNG_FOREST',	'IMPROVEMENT_GROW_FOREST',	10,				10,					0,				'TG_ATLAS',	0,				0,					0			UNION ALL
SELECT						'IMPROVEMENT_TROPICAL_VEG',	1,						1,				1,					1,				'TXT_KEY_IMPROVEMENT_TROPICAL_VEG',	'TXT_KEY_IMPROVEMENT_TROPICAL_VEG',	'TXT_KEY_CIV5_IMPROVEMENT_TROPICAL_VEG_HELP',	'ART_DEF_IMPROVEMENT_TROPICAL_VEG',	'IMPROVEMENT_GROW_JUNGLE',	10,				10,					0,				'TG_ATLAS',	0,				0,					0;

INSERT INTO Improvements	(Type,						DestroyedWhenPillaged,	OutsideBorders,	IgnoreOwnership,	GraphicalOnly,	Description,					Civilopedia,								Help,							ArtDefineTag,					Permanent,	PortraitIndex,	DefenseModifier,	IconAtlas,				UnitFreePromotion,		OwnerOnly)
	VALUES					('IMPROVEMENT_WILDFIRE',	1,						1,				1,					0,				'TXT_KEY_IMPROVEMENT_WILDFIRE',	'TXT_KEY_CIV5_IMPROVEMENT_WILDFIRE_HELP',	'TXT_KEY_IMPROVEMENT_WILDFIRE',	'ART_DEF_IMPROVEMENT_WILDFIRE',	0,			0,				-15,				'WILDFIRE_ICON_ATLAS',	'PROMOTION_WILDFIRE',	0);

INSERT INTO Improvements	(Type,					DestroyedWhenPillaged,	OutsideBorders,	IgnoreOwnership,	GraphicalOnly,	Description,					Civilopedia,							Help,									ArtDefineTag,					Permanent,	PortraitIndex,	IconAtlas,			UnitFreePromotion,		OwnerOnly)
	VALUES					('IMPROVEMENT_SMOKE',	1,						1,				1,					1,				'TXT_KEY_IMPROVEMENT_SMOKE',	'TXT_KEY_CIV5_IMPROVEMENT_SMOKE_TEXT',	'TXT_KEY_CIV5_IMPROVEMENT_SMOKE_HELP',	'ART_DEF_IMPROVEMENT_SMOKE',	0,			0,				'SMOKE_ICON_ATLAS',	'PROMOTION_SMOKE',		0);

INSERT INTO Improvements	(Type,					RequiresImprovement,	DestroyedWhenPillaged,	BuildableOnResources,	OutsideBorders,	InAdjacentFriendly,	IgnoreOwnership,	GraphicalOnly,	Description,					Civilopedia,							Help,									ArtDefineTag,					Permanent,	PortraitIndex,	DefenseModifier,	IconAtlas,				OwnerOnly)
	VALUES					('IMPROVEMENT_BURNT',	1,						1,						1,						0,				0,					1,					0,				'TXT_KEY_IMPROVEMENT_BURNT',	'TXT_KEY_CIV5_IMPROVEMENT_BURNT_TEXT',	'TXT_KEY_CIV5_IMPROVEMENT_BURNT_HELP',	'ART_DEF_IMPROVEMENT_BURNT',	0,			0,				-10,				'BURNT_ICON_ATLAS',		0);

--------------------------------------------------------------------------------------------------
--Promotions
--------------------------------------------------------------------------------------------------

INSERT INTO UnitPromotions
		(Type,					Description,					Help,								PortraitIndex,	IconAtlas,			Sound,				CannotBeChosen,	LostWithUpgrade,	NoDefensiveBonus,	RangedAttackModifier,	RangedDefenseMod,	VisibilityChange,	EnemyHealChange,	NeutralHealChange,	FriendlyHealChange,	ExtraFlankPower,	PediaType,		PediaEntry,						IsLostOnMove)
VALUES	('PROMOTION_WILDFIRE',	'TXT_KEY_PROMOTION_WILDFIRE',	'TXT_KEY_PROMOTION_WILDFIRE_HELP',	31,				'promoVP_atlas_00',	'AS2D_IF_LEVELUP',	1,				0,					1,					-10,					10,					-4,					-25,				-25,				-25,				-1,					'PEDIA_SHARED',	'TXT_KEY_PROMOTION_WILDFIRE',	1);

INSERT INTO UnitPromotions
		(Type,				Description,				Help,							PortraitIndex,	IconAtlas,			Sound,				CannotBeChosen,	LostWithUpgrade,	RangedAttackModifier,	RangedDefenseMod,	VisibilityChange,	EnemyHealChange,	NeutralHealChange,	FriendlyHealChange,	ExtraFlankPower,	PediaType,		PediaEntry,					IsLostOnMove)
VALUES	('PROMOTION_SMOKE',	'TXT_KEY_PROMOTION_SMOKE',	'TXT_KEY_PROMOTION_SMOKE_HELP',	29,				'promoVP_atlas_00',	'AS2D_IF_LEVELUP',	1,				0,					-10,					10,					-4,					0,					0,					0,					0,					'PEDIA_SHARED',	'TXT_KEY_PROMOTION_SMOKE',	1);

INSERT INTO UnitPromotions_UnitCombats
		(PromotionType,				UnitCombatType)
VALUES	('PROMOTION_WILDFIRE',		'UNITCOMBAT_ARCHER'),
		('PROMOTION_WILDFIRE',		'UNITCOMBAT_MOUNTED'),
		('PROMOTION_WILDFIRE',		'UNITCOMBAT_MELEE'),
		('PROMOTION_WILDFIRE',		'UNITCOMBAT_SIEGE'),
		('PROMOTION_WILDFIRE',		'UNITCOMBAT_GUN'),
		('PROMOTION_WILDFIRE',		'UNITCOMBAT_ARMOR'),
		('PROMOTION_WILDFIRE',		'UNITCOMBAT_RECON'),
		('PROMOTION_WILDFIRE',		'UNITCOMBAT_SETTLER'),
		('PROMOTION_WILDFIRE',		'UNITCOMBAT_WORKER'),
		('PROMOTION_WILDFIRE',		'UNITCOMBAT_CARAVAN'),
		('PROMOTION_WILDFIRE',		'UNITCOMBAT_INQUISITOR'),
		('PROMOTION_WILDFIRE',		'UNITCOMBAT_MISSIONARY'),
		('PROMOTION_WILDFIRE',		'UNITCOMBAT_DIPLOMACY'),
		('PROMOTION_SMOKE',			'UNITCOMBAT_ARCHER'),
		('PROMOTION_SMOKE',			'UNITCOMBAT_MOUNTED'),
		('PROMOTION_SMOKE',			'UNITCOMBAT_MELEE'),
		('PROMOTION_SMOKE',			'UNITCOMBAT_SIEGE'),
		('PROMOTION_SMOKE',			'UNITCOMBAT_GUN'),
		('PROMOTION_SMOKE',			'UNITCOMBAT_ARMOR'),
		('PROMOTION_SMOKE',			'UNITCOMBAT_RECON'),
		('PROMOTION_SMOKE',			'UNITCOMBAT_NAVALMELEE'),
		('PROMOTION_SMOKE',			'UNITCOMBAT_CARRIER'),
		('PROMOTION_SMOKE',			'UNITCOMBAT_NAVALRANGED'),
		('PROMOTION_SMOKE',			'UNITCOMBAT_SETTLER'),
		('PROMOTION_SMOKE',			'UNITCOMBAT_WORKER'),
		('PROMOTION_SMOKE',			'UNITCOMBAT_CARAVAN'),
		('PROMOTION_SMOKE',			'UNITCOMBAT_INQUISITOR'),
		('PROMOTION_SMOKE',			'UNITCOMBAT_MISSIONARY'),
		('PROMOTION_SMOKE',			'UNITCOMBAT_DIPLOMACY'),
		('PROMOTION_SMOKE',			'UNITCOMBAT_WORKBOAT'),
		('PROMOTION_SMOKE',			'UNITCOMBAT_CARGO');

--------------------------------------------------------------------------------------------------
--Improvement Terrains/features
--------------------------------------------------------------------------------------------------
INSERT INTO Improvement_ValidTerrains	(ImprovementType,			TerrainType)
SELECT									'IMPROVEMENT_YOUNG_FOREST',	'TERRAIN_PLAINS' UNION ALL
SELECT									'IMPROVEMENT_YOUNG_FOREST',	'TERRAIN_GRASS' UNION ALL
SELECT									'IMPROVEMENT_YOUNG_FOREST',	'TERRAIN_TUNDRA' UNION ALL
SELECT									'IMPROVEMENT_TROPICAL_VEG',	'TERRAIN_PLAINS' UNION ALL
SELECT									'IMPROVEMENT_TROPICAL_VEG',	'TERRAIN_GRASS';

INSERT INTO Improvement_ValidFeatures	(ImprovementType,			FeatureType) 
	VALUES								('IMPROVEMENT_WILDFIRE',	'FEATURE_JUNGLE'),
										('IMPROVEMENT_WILDFIRE',	'FEATURE_FOREST');

INSERT INTO Improvement_ValidTerrains	(ImprovementType,		TerrainType)
SELECT									'IMPROVEMENT_SMOKE',	'TERRAIN_PLAINS'	UNION ALL
SELECT									'IMPROVEMENT_SMOKE',	'TERRAIN_GRASS'		UNION ALL
SELECT									'IMPROVEMENT_SMOKE',	'TERRAIN_DESERT'	UNION ALL
SELECT									'IMPROVEMENT_SMOKE',	'TERRAIN_SNOW'		UNION ALL
SELECT									'IMPROVEMENT_SMOKE',	'TERRAIN_COAST'		UNION ALL
SELECT									'IMPROVEMENT_SMOKE',	'TERRAIN_OCEAN'		UNION ALL
SELECT									'IMPROVEMENT_SMOKE',	'TERRAIN_TUNDRA';

INSERT INTO Feature_TerrainBooleans	(FeatureType,		TerrainType) 
	VALUES							('FEATURE_SMOKE',	'TERRAIN_PLAINS'),
									('FEATURE_SMOKE',	'TERRAIN_GRASS'),
									('FEATURE_SMOKE',	'TERRAIN_DESERT'),
									('FEATURE_SMOKE',	'TERRAIN_SNOW'),
									('FEATURE_SMOKE',	'TERRAIN_COAST'),
									('FEATURE_SMOKE',	'TERRAIN_OCEAN'),
									('FEATURE_SMOKE',	'TERRAIN_TUNDRA');

INSERT INTO Features	(Type,				Description,				Civilopedia,					ArtDefineTag,	Movement,	SeeThrough,	PortraitIndex,	IconAtlas)
	VALUES				('FEATURE_SMOKE',	'TXT_KEY_FEATURE_SMOKE',	'TXT_KEY_PROMOTION_SMOKE_HELP',	NULL,			1,			2,			0,				'SMOKE_ICON_ATLAS'),
						('FEATURE_SMOKE2',	'TXT_KEY_FEATURE_SMOKE',	'TXT_KEY_PROMOTION_SMOKE_HELP',	NULL,			2,			2,			0,				'SMOKE_ICON_ATLAS');

--------------------------------------------------------------------------------------------------
--Improvement yields
--------------------------------------------------------------------------------------------------

INSERT INTO Improvement_Yields	(ImprovementType,			YieldType,			Yield) 
	VALUES						('IMPROVEMENT_WILDFIRE',	'YIELD_PRODUCTION',		-10),
								('IMPROVEMENT_WILDFIRE',	'YIELD_FOOD',			-10),
								('IMPROVEMENT_WILDFIRE',	'YIELD_GOLD',		-10),
								('IMPROVEMENT_BURNT',		'YIELD_SCIENCE',		1)/**,
								('IMPROVEMENT_BURNT',		'YIELD_CULTURE',		1),
								('IMPROVEMENT_BURNT',		'YIELD_PRODUCTION',		1)**/;
/**
INSERT INTO Improvement_AdjacentFeatureYieldChanges	(ImprovementType,			FeatureType,			YieldType,			Yield) 
	VALUES											('IMPROVEMENT_WILDFIRE',	'FEATURE_FLOOD_PLAINS',	'YIELD_FOOD',		-1);

INSERT INTO Improvement_AdjacentTerrainYieldChanges	(ImprovementType,			TerrainType,			YieldType,			Yield) 
	VALUES											('IMPROVEMENT_WILDFIRE',	'TERRAIN_GRASS',		'YIELD_FOOD',		-1),
													('IMPROVEMENT_WILDFIRE',	'TERRAIN_PLAINS',		'YIELD_PRODUCTION',	-1);


INSERT INTO Improvement_AdjacentImprovementYieldChanges	(ImprovementType,			OtherImprovementType,		YieldType,			Yield) 
	VALUES												('IMPROVEMENT_WILDFIRE',	'IMPROVEMENT_FARM',			'YIELD_FOOD',		-1),
														('IMPROVEMENT_WILDFIRE',	'IMPROVEMENT_MINE',			'YIELD_PRODUCTION',	-1),
														('IMPROVEMENT_WILDFIRE',	'IMPROVEMENT_PLANTATION',	'YIELD_FOOD',		-1),
														('IMPROVEMENT_WILDFIRE',	'IMPROVEMENT_CAMP',			'YIELD_GOLD',		-1),
														('IMPROVEMENT_WILDFIRE',	'IMPROVEMENT_PASTURE',		'YIELD_FOOD',		-1),
														('IMPROVEMENT_WILDFIRE',	'IMPROVEMENT_QUARRY',		'YIELD_PRODUCTION',	-1),
														('IMPROVEMENT_WILDFIRE',	'IMPROVEMENT_WELL',			'YIELD_PRODUCTION',	-1),
														('IMPROVEMENT_WILDFIRE',	'IMPROVEMENT_LUMBERMILL',	'YIELD_PRODUCTION',	-1),
														('IMPROVEMENT_WILDFIRE',	'IMPROVEMENT_TRADING_POST',	'YIELD_GOLD',		-1);
**/
--------------------------------------------------------------------------------------------------
--Improvement Flavors
--------------------------------------------------------------------------------------------------
INSERT INTO Improvement_Flavors (ImprovementType,			FlavorType,				Flavor)
SELECT							'IMPROVEMENT_YOUNG_FOREST',	'FLAVOR_PRODUCTION',	5	UNION ALL
SELECT							'IMPROVEMENT_YOUNG_FOREST',	'FLAVOR_DEFENSE',		5	UNION ALL
SELECT							'IMPROVEMENT_TROPICAL_VEG',	'FLAVOR_PRODUCTION',	5	UNION ALL
SELECT							'IMPROVEMENT_TROPICAL_VEG',	'FLAVOR_DEFENSE',		5	UNION ALL
SELECT							'IMPROVEMENT_BURNT',		'FLAVOR_SCIENCE',		5	UNION ALL
--SELECT							'IMPROVEMENT_BURNT',		'FLAVOR_PRODUCTION',	5	UNION ALL
--SELECT							'IMPROVEMENT_BURNT',		'FLAVOR_CULTURE',		5	UNION ALL
SELECT							'IMPROVEMENT_WILDFIRE',		'FLAVOR_PRODUCTION',	-5	UNION ALL
SELECT							'IMPROVEMENT_WILDFIRE',		'FLAVOR_EXPANSION',		-5	UNION ALL
SELECT							'IMPROVEMENT_WILDFIRE',		'FLAVOR_DEFENSE',		-5;

--------------------------------------------------------------------------------------------------
--Icon Atlas 
--------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases (Atlas,			IconSize,	IconsPerRow,	IconsPerColumn,	Filename)
SELECT							'TG_ATLAS',		256,		1,				1,				'ForestAtlas256.dds'		UNION ALL
SELECT							'TG_ATLAS',		64,			1,				1,				'ForestAtlas64.dds';

INSERT INTO IconTextureAtlases	(Atlas,					IconSize,	Filename,				IconsPerRow,	IconsPerColumn)
	SELECT						'WILDFIRE_ICON_ATLAS',	256,		'WildfireIcon_256.dds',	1,				1				UNION ALL
	SELECT						'WILDFIRE_ICON_ATLAS',	128,		'WildfireIcon_128.dds',	1,				1				UNION ALL
	SELECT						'WILDFIRE_ICON_ATLAS',	80,			'WildfireIcon_80.dds',	1,				1				UNION ALL
	SELECT						'WILDFIRE_ICON_ATLAS',	64,			'WildfireIcon_64.dds',	1,				1				UNION ALL
	SELECT						'WILDFIRE_ICON_ATLAS',	45,			'WildfireIcon_45.dds',	1,				1				UNION ALL
	SELECT						'WILDFIRE_ICON_ATLAS',	32,			'WildfireIcon_32.dds',	1,				1;

INSERT INTO IconTextureAtlases	(Atlas,				IconSize,	Filename,				IconsPerRow,	IconsPerColumn)
	SELECT						'SMOKE_ICON_ATLAS',	256,		'SmokeIcon_256.dds',	1,				1				UNION ALL
	SELECT						'SMOKE_ICON_ATLAS',	128,		'SmokeIcon_128.dds',	1,				1				UNION ALL
	SELECT						'SMOKE_ICON_ATLAS',	80,			'SmokeIcon_80.dds',		1,				1				UNION ALL
	SELECT						'SMOKE_ICON_ATLAS',	64,			'SmokeIcon_64.dds',		1,				1				UNION ALL
	SELECT						'SMOKE_ICON_ATLAS',	45,			'SmokeIcon_45.dds',		1,				1				UNION ALL
	SELECT						'SMOKE_ICON_ATLAS',	32,			'SmokeIcon_32.dds',		1,				1;

INSERT INTO IconTextureAtlases	(Atlas,				IconSize,	Filename,				IconsPerRow,	IconsPerColumn)
	SELECT						'BURNT_ICON_ATLAS',	256,		'BurntIcon_256.dds',	1,				1				UNION ALL
	SELECT						'BURNT_ICON_ATLAS',	128,		'BurntIcon_128.dds',	1,				1				UNION ALL
	SELECT						'BURNT_ICON_ATLAS',	80,			'BurntIcon_80.dds',		1,				1				UNION ALL
	SELECT						'BURNT_ICON_ATLAS',	64,			'BurntIcon_64.dds',		1,				1				UNION ALL
	SELECT						'BURNT_ICON_ATLAS',	45,			'BurntIcon_45.dds',		1,				1				UNION ALL
	SELECT						'BURNT_ICON_ATLAS',	32,			'BurntIcon_32.dds',		1,				1;

INSERT INTO IconTextureAtlases	(Atlas,						IconSize,	Filename,					IconsPerRow,	IconsPerColumn)
	SELECT						'BUILDBURNT_ICON_ATLAS',	256,		'BuildBurntIcon_256.dds',	1,				2				UNION ALL
	SELECT						'BUILDBURNT_ICON_ATLAS',	128,		'BuildBurntIcon_128.dds',	1,				2				UNION ALL
	SELECT						'BUILDBURNT_ICON_ATLAS',	80,			'BuildBurntIcon_80.dds',	1,				2				UNION ALL
	SELECT						'BUILDBURNT_ICON_ATLAS',	64,			'BuildBurntIcon_64.dds',	1,				2				UNION ALL
	SELECT						'BUILDBURNT_ICON_ATLAS',	45,			'BuildBurntIcon_45.dds',	1,				2				UNION ALL
	SELECT						'BUILDBURNT_ICON_ATLAS',	32,			'BuildBurntIcon_32.dds',	1,				2;


--------------------------------------------------------------------------------------------------
--Artdefines
-------------------------------------------------------------------------------------------------- 
--successional growth
INSERT INTO ArtDefine_StrategicView	(StrategicViewType,					TileType,			Asset)
SELECT								'ART_DEF_IMPROVEMENT_YOUNG_FOREST',	'Improvement',		'PreForestSV_256.dds'	UNION ALL
SELECT								'ART_DEF_IMPROVEMENT_TROPICAL_VEG',	'Improvement',		'PreJungleSV_256.dds';

INSERT INTO ArtDefine_LandmarkTypes (Type,				LandmarkType,		FriendlyName)
SELECT 'ART_DEF_IMPROVEMENT_YOUNG_FOREST',				'Improvement',		'Shrubland'			UNION ALL
SELECT 'ART_DEF_IMPROVEMENT_TROPICAL_VEG',				'Improvement',		'Tropical Shrubland';

INSERT INTO ArtDefine_Landmarks (Era,	State,		Scale,	ImprovementType,					LayoutHandler,	ResourceType,				Model,						TerrainContour)
SELECT							'Any',	'Any',		1.0,	'ART_DEF_IMPROVEMENT_YOUNG_FOREST', 'SNAPSHOT',		'ART_DEF_RESOURCE_ALL',		'resource_timber.fxsxml',	1	UNION ALL
SELECT							'Any',	'Any',		1.0,	'ART_DEF_IMPROVEMENT_TROPICAL_VEG', 'SNAPSHOT',		'ART_DEF_RESOURCE_ALL',		'coconuttrees.fxsxml',		1;

--wildfire
INSERT INTO ArtDefine_LandmarkTypes	(Type,							LandmarkType,	FriendlyName)
	SELECT							'ART_DEF_IMPROVEMENT_WILDFIRE',	'Improvement',	'Wildfire';

INSERT INTO ArtDefine_Landmarks	(Era,	State,	Scale,	ImprovementType,				LayoutHandler,	ResourceType,				Model,				TerrainContour)
	SELECT						'Any',	'Any',	0.7,	'ART_DEF_IMPROVEMENT_WILDFIRE',	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL',		'Wildfire.fxsxml',	1;

INSERT INTO ArtDefine_StrategicView	(StrategicViewType,				TileType,		Asset)
	SELECT							'ART_DEF_IMPROVEMENT_WILDFIRE',	'Improvement',	'WildfireSV_256.dds';

--smoke
INSERT INTO ArtDefine_LandmarkTypes	(Type,							LandmarkType,	FriendlyName)
	SELECT							'ART_DEF_IMPROVEMENT_SMOKE',	'Improvement',	'Smoke';

INSERT INTO ArtDefine_Landmarks	(Era,	State,	Scale,	ImprovementType,				LayoutHandler,	ResourceType,				Model,				TerrainContour)
	SELECT						'Any',	'Any',	1,		'ART_DEF_IMPROVEMENT_SMOKE',	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL',		'Smoke.fxsxml',		1;

INSERT INTO ArtDefine_StrategicView	(StrategicViewType,				TileType,		Asset)
	SELECT							'ART_DEF_IMPROVEMENT_SMOKE',	'Improvement',	'SmokeSV_256.dds';

--burnt
INSERT INTO ArtDefine_LandmarkTypes	(Type,							LandmarkType,	FriendlyName)
	SELECT							'ART_DEF_IMPROVEMENT_BURNT',	'Improvement',	'Fire Scar';

INSERT INTO ArtDefine_Landmarks	(Era,	State,	Scale,	ImprovementType,				LayoutHandler,	ResourceType,				Model,						TerrainContour)
	SELECT						'Any',	'Any',	1,		'ART_DEF_IMPROVEMENT_BURNT',	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL',		'scorched_trees.fxsxml',	1;

INSERT INTO ArtDefine_StrategicView	(StrategicViewType,				TileType,		Asset)
	SELECT							'ART_DEF_IMPROVEMENT_BURNT',	'Improvement',	'BurntSV_256.dds';

--------------------------------------------------------------------------------------------------
--Text
-------------------------------------------------------------------------------------------------- 

INSERT INTO Language_en_US
		(Tag,											Text)
VALUES	('TXT_KEY_IMPROVEMENT_YOUNG_FOREST',			'Shrubland'),
		('TXT_KEY_CIV5_IMPROVEMENT_YOUNG_FOREST_HELP',	'An early-successional shrubland is a mix of native shrubs, sapling trees, and native herbaceous vegetation near intact forest and residual mature trees. The height and density of the shrubland vegetation is varied and patchy. Ecologists recognize four phases of forest succession: (i) stand initiation, (ii) stem exclusion, (iii) understory reinitiation, and (iv) steady state, or mature forest. Shrublands are young forests that have not yet reached later phases of forest development.[NEWLINE][NEWLINE]Grants 10% defense bonus, grows into Forest after 10 turns.'),
		('TXT_KEY_IMPROVEMENT_TROPICAL_VEG',			'Tropical Shrubland'),
		('TXT_KEY_CIV5_IMPROVEMENT_TROPICAL_VEG_HELP',	'Early-successional tropical shrubland occurs in climates that are warm year-round, and is in general more biologically diverse than in other latitudes. Tropical vegetation that receives abundant rain the whole year round often becomes overgrown with trees and tangled vegetation. Ecologists recognize four phases of forest succession: (i) stand initiation, (ii) stem exclusion, (iii) understory reinitiation, and (iv) steady state. Tropical shrublands in warm, wet environments tend to experience intensified stand initiation and understory reinitiation phases.[NEWLINE][NEWLINE]Grants 10% defense bonus, grows into Jungle after 10 turns.'),
		('TXT_KEY_CIV5_IMPROVEMENT_GROW_JUNGLE',		'[COLOR_CITY_GREEN]Steady-state Jungle[ENDCOLOR]'),
		('TXT_KEY_CIV5_IMPROVEMENT_GROW_FOREST',		'[COLOR_CITY_GREEN]Steady-state Forest[ENDCOLOR]'),
		('TXT_KEY_CIV5_SUCCESSIONAL_VEGETATION',		'[COLOR_CITY_GREEN]Successional Vegetation[ENDCOLOR]'),
		('TXT_KEY_CIV5_IMPROVEMENT_WILDFIRE',			'[COLOR_WARNING_TEXT]Wildfire[ENDCOLOR]'),
		('TXT_KEY_CIV5_BURN_FOREST',					'[COLOR_WARNING_TEXT]Deforestation[ENDCOLOR]'),
		('TXT_KEY_CIV5_FIRE_PILLAGE',					'[ICON_RAZING]'),
		('TXT_KEY_IMPROVEMENT_WILDFIRE',				'Wildfire'),
		('TXT_KEY_CIV5_IMPROVEMENT_WILDFIRE_HELP',		'An out-of-control fire consumes wide areas of vegetation.'),
		('TXT_KEY_PROMOTION_WILDFIRE',					'Wildfire'),
		('TXT_KEY_PROMOTION_WILDFIRE_HELP',				'[COLOR_NEGATIVE_TEXT]Obstructed[ENDCOLOR] vision, healing, defence, and flanking support'),
		('TXT_KEY_PROMOTION_SMOKE',						'Smoke'),
		('TXT_KEY_PROMOTION_SMOKE_HELP',				'[COLOR_NEGATIVE_TEXT]Obstructed[ENDCOLOR] vision'),
		('TXT_KEY_FEATURE_SMOKE',						'Restricted Visibility'),
		('TXT_KEY_IMPROVEMENT_SMOKE',					'Smoke'),
		('TXT_KEY_CIV5_IMPROVEMENT_SMOKE_HELP',			'An out-of-control fire generates smoke.'),
		('TXT_KEY_CIV5_IMPROVEMENT_SMOKE_TEXT',			'Wildfire generates smoke spontaneously in forest and jungle tiles.'),
		('TXT_KEY_IMPROVEMENT_BURNT',					'Fire Scar'),
		('TXT_KEY_CIV5_IMPROVEMENT_BURNT_HELP',			'Visibly blackened land surface left after a wildfire has burned through vegetation.'),
		('TXT_KEY_CIV5_IMPROVEMENT_BURNT_TEXT',			'Extinguished wildfire leaves behind charred vegetation in forest and jungle tiles.'),
		('TXT_KEY_BUILD_BURNT',							'Extinguish Wildfire'),
		('TXT_KEY_BUILD_BURNT_HELP',					'A Fire Scar will be left behind. Unit reduced to 1 HP. +1 [ICON_RESEARCH] Science temporarily.');

UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_TILE_IMPROVEMENTS';
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_UNIT_ACTIONS';
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_PLOT';
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_CITY_FOUNDING';
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'IMPROVEMENTS_EXTENSIONS';
