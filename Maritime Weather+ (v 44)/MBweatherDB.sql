----------------------------------------------------------
-- Unit Fixes
----------------------------------------------------------
UPDATE Units
SET MoveRate = 'WOODEN_BOAT'
WHERE Class = 'UNITCLASS_CARAVEL' OR Class = 'UNITCLASS_KOREAN_TURTLE_SHIP';

----------------------------------------------------------
-- ArtDefine Landmarks
----------------------------------------------------------
INSERT INTO ArtDefine_LandmarkTypes	(Type,							LandmarkType,	FriendlyName)
	SELECT							'ART_DEF_IMPROVEMENT_STORM',	'Improvement',	'Storm';

INSERT INTO ArtDefine_Landmarks	(Era,	State,	Scale,	ImprovementType,				LayoutHandler,	ResourceType,				Model,			TerrainContour)
	SELECT						'Any',	'Any',	1,		'ART_DEF_IMPROVEMENT_STORM',	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL',		'Cloud.fxsxml',	1;

INSERT INTO ArtDefine_StrategicView	(StrategicViewType,				TileType,		Asset)
	SELECT							'ART_DEF_IMPROVEMENT_STORM',	'Improvement',	'StormSV_256.dds';

INSERT INTO ArtDefine_LandmarkTypes	(Type,								LandmarkType,	FriendlyName)
	SELECT							'ART_DEF_IMPROVEMENT_STORM_ANIM',	'Improvement',	'Storm';

INSERT INTO ArtDefine_Landmarks	(Era,	State,	Scale,	ImprovementType,					LayoutHandler,	ResourceType,				Model,			TerrainContour)
	SELECT						'Any',	'Any',	1,		'ART_DEF_IMPROVEMENT_STORM_ANIM',	'ANIMATED',		'ART_DEF_RESOURCE_ALL',		'Cloud.fxsxml',	1;

INSERT INTO ArtDefine_StrategicView	(StrategicViewType,					TileType,		Asset)
	SELECT							'ART_DEF_IMPROVEMENT_STORM_ANIM',	'Improvement',	'StormSV_256.dds';

----------------------------------------------------------
-- Promotions
----------------------------------------------------------

INSERT INTO UnitPromotions
		(Type,							Description,							Help,										PortraitIndex,	IconAtlas,				OrderPriority,	Sound,				CannotBeChosen,	LostWithUpgrade,	NotWithUpgrade,	IgnoreTerrainCost,	FreePillageMoves,	OnlyDefensive,	RangedSupportFire,	CanMoveAfterAttacking,	EnemyHealChange,	NeutralHealChange,	FriendlyHealChange,	AdjacentTileHealChange,	VisibilityChange,	CityAttack,	CombatPercent,	AttackMod,	DefenseMod,	RangedDefenseMod,	AttackFortifiedMod,	MovesChange,	RangeChange,	PediaType,			PediaEntry)
VALUES	('PROMOTION_AIR_WEATHER',		'TXT_KEY_PROMOTION_AIR_WEATHER',		'TXT_KEY_PROMOTION_AIR_WEATHER_HELP',		57,				'ABILITY_ATLAS',		9999,			'AS2D_IF_LEVELUP',	1,				0,					0,				0,					0,					0,				0,					0,						0,					0,					0,					0,						0,					0,			0,				0,			0,			0,					0,					0,				0,				'PEDIA_AIR',		'TXT_KEY_PROMOTION_AIR_WEATHER');

INSERT INTO UnitPromotions
		(Type,							Description,							Help,										PortraitIndex,	IconAtlas,				OrderPriority,	Sound,				CannotBeChosen,	LostWithUpgrade,	NotWithUpgrade,	IgnoreTerrainCost,	FreePillageMoves,	OnlyDefensive,	RangedSupportFire,	CanMoveAfterAttacking,	EnemyHealChange,	NeutralHealChange,	FriendlyHealChange,	AdjacentTileHealChange,	VisibilityChange,	CityAttack,	CombatPercent,	AttackMod,	DefenseMod,	RangedDefenseMod,	AttackFortifiedMod,	MovesChange,	RangeChange,	TechPrereq,			PromotionPrereqOr1,		PromotionPrereqOr2,		PromotionPrereqOr3,		PromotionPrereqOr4,	PromotionPrereqOr5,		PediaType,			PediaEntry)
VALUES	('PROMOTION_ALL_WEATHER',		'TXT_KEY_PROMOTION_ALL_WEATHER',		'TXT_KEY_PROMOTION_ALL_WEATHER_HELP',		59,				'ABILITY_ATLAS',		9999,			'AS2D_IF_LEVELUP',	0,				0,					0,				0,					0,					0,				0,					0,						0,					0,					0,					0,						0,					0,			0,				0,			0,			0,					0,					0,				0,				'TECH_STEAM_POWER',	'PROMOTION_AMPHIBIOUS',	'PROMOTION_BARRAGE_2',	'PROMOTION_ACCURACY_3',	'PROMOTION_CHARGE',	'PROMOTION_SCOUTING_2',	'PEDIA_SHARED',		'TXT_KEY_PROMOTION_ALL_WEATHER');

INSERT INTO UnitPromotions
		(Type,							Description,							Help,										PortraitIndex,	IconAtlas,				OrderPriority,	Sound,				CannotBeChosen,	LostWithUpgrade,	NotWithUpgrade,	IgnoreTerrainCost,	FreePillageMoves,	OnlyDefensive,	RangedSupportFire,	CanMoveAfterAttacking,	EnemyHealChange,	NeutralHealChange,	FriendlyHealChange,	AdjacentTileHealChange,	ExtraNavalMovement,	VisibilityChange,	CityAttack,	CombatPercent,	AttackMod,	DefenseMod,	RangedDefenseMod,	AttackFortifiedMod,	MovesChange,	RangeChange,	EmbarkExtraVisibility,	PediaType,			PediaEntry)
VALUES	('PROMOTION_WEATHERED',			'TXT_KEY_PROMOTION_WEATHERED',			'TXT_KEY_PROMOTION_WEATHERED_HELP',			57,				'ABILITY_ATLAS',		9999,			'AS2D_IF_LEVELUP',	1,				0,					0,				0,					0,					0,				0,					0,						0,					0,					0,					0,						-1,					-1,					0,			0,				0,			0,			0,					0,					-1,				0,				-1,						'PEDIA_SHARED',		'TXT_KEY_PROMOTION_WEATHERED');

INSERT INTO UnitPromotions_Features
		(PromotionType,							FeatureType,							Attack,	Defense,	DoubleMove, Impassable)
VALUES	('PROMOTION_HOVERING_UNIT',				'FEATURE_RESTRICTED_VISIBILITY',		-20,	-20,		0,			0),
		('PROMOTION_HOVERING_UNIT',				'FEATURE_RESTRICTED_VISIBILITY_LAND',	-20,	-20,		0,			0),
		('PROMOTION_HOVERING_UNIT',				'FEATURE_ATOLL_STORM',					-20,	-20,		0,			0),
		('PROMOTION_HOVERING_UNIT',				'FEATURE_FLOOD_PLAINS_STORM',			-20,	-20,		0,			0),
		('PROMOTION_AIR_WEATHER',				'FEATURE_RESTRICTED_VISIBILITY',		-20,	0,			0,			0),
		('PROMOTION_AIR_WEATHER',				'FEATURE_RESTRICTED_VISIBILITY_LAND',	-20,	0,			0,			0),
		('PROMOTION_AIR_WEATHER',				'FEATURE_ATOLL_STORM',					-20,	0,			0,			0),
		('PROMOTION_AIR_WEATHER',				'FEATURE_FLOOD_PLAINS_STORM',			-20,	0,			0,			0),
		('PROMOTION_INVISIBLE_SUBMARINE',		'FEATURE_ATOLL',						0,		0,			0,			1),
		('PROMOTION_INVISIBLE_SUBMARINE',		'FEATURE_ATOLL_STORM',					0,		0,			0,			1),
		('PROMOTION_ALL_WEATHER',				'FEATURE_RESTRICTED_VISIBILITY',		0,		0,			1,			0),
		('PROMOTION_ALL_WEATHER',				'FEATURE_RESTRICTED_VISIBILITY_LAND',	0,		0,			1,			0),
		('PROMOTION_ALL_WEATHER',				'FEATURE_ATOLL_STORM',					0,		0,			1,			0),
		('PROMOTION_ALL_WEATHER',				'FEATURE_FLOOD_PLAINS_STORM',			0,		0,			1,			0);

UPDATE Language_en_US
SET Text = Text||'[NEWLINE]Reduced [ICON_MOVES] [COLOR_POSITIVE_TEXT]Movement penalty[ENDCOLOR] from [COLOR_MENU_BLUE]Storms[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_PROMOTION_INVISIBLE_SUBMARINE_HELP';

UPDATE Language_en_US
SET Text = Text||'[NEWLINE]-20% [ICON_STRENGTH] [COLOR_NEGATIVE_TEXT]Combat Strength[ENDCOLOR] in [COLOR_MENU_BLUE]Storms[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_PROMOTION_HOVERING_UNIT_HELP';

INSERT INTO Unit_FreePromotions (UnitType,			PromotionType)
SELECT							Type,				'PROMOTION_AIR_WEATHER'
FROM Units WHERE Domain = 'DOMAIN_AIR';

INSERT INTO Unit_FreePromotions (UnitType,			PromotionType)
SELECT							Type,				'PROMOTION_ALL_WEATHER'
FROM Units WHERE MoveRate = 'BOAT';

INSERT INTO Unit_FreePromotions (UnitType,			PromotionType)
SELECT							Type,				'PROMOTION_IGNORE_TERRAIN_COST'
FROM Units WHERE CombatClass = 'UNITCOMBAT_SUBMARINE';

INSERT INTO UnitPromotions_UnitCombats
		(PromotionType,							UnitCombatType)
VALUES	('PROMOTION_ALL_WEATHER',				'UNITCOMBAT_ARCHER'),
		('PROMOTION_ALL_WEATHER',				'UNITCOMBAT_MOUNTED'),
		('PROMOTION_ALL_WEATHER',				'UNITCOMBAT_MELEE'),
		('PROMOTION_ALL_WEATHER',				'UNITCOMBAT_SIEGE'),
		('PROMOTION_ALL_WEATHER',				'UNITCOMBAT_GUN'),
		('PROMOTION_ALL_WEATHER',				'UNITCOMBAT_ARMOR'),
		('PROMOTION_ALL_WEATHER',				'UNITCOMBAT_RECON');

----------------------------------------------------------
-- Improvements
----------------------------------------------------------
INSERT INTO Improvements	(Type,						Description,					Civilopedia,							Help,									ArtDefineTag,						Permanent,	GraphicalOnly,	DestroyedWhenPillaged,	PortraitIndex,	IconAtlas,							IgnoreOwnership,	OutsideBorders)
	VALUES					('IMPROVEMENT_STORM',		'TXT_KEY_IMPROVEMENT_STORM',	'TXT_KEY_CIV5_IMPROVEMENTS_STORM_TEXT',	'TXT_KEY_CIV5_IMPROVEMENTS_STORM_HELP',	'ART_DEF_IMPROVEMENT_STORM',		0,			1,				0,						0,				'IMPROVEMENTS_STORM_ICON_ATLAS',	1,					1),
							('IMPROVEMENT_STORM_ANIM',	'TXT_KEY_IMPROVEMENT_STORM',	'TXT_KEY_CIV5_IMPROVEMENTS_STORM_TEXT',	'TXT_KEY_CIV5_IMPROVEMENTS_STORM_HELP',	'ART_DEF_IMPROVEMENT_STORM_ANIM',	0,			1,				0,						0,				'IMPROVEMENTS_STORM_ICON_ATLAS',	1,					1);

----------------------------------------------------------
-- Features
----------------------------------------------------------
INSERT INTO Features	(Type,									Description,							Civilopedia,							ArtDefineTag,					Movement,	SeeThrough,		PortraitIndex,	NoImprovement,	IconAtlas)
	VALUES				('FEATURE_RESTRICTED_VISIBILITY',		'TXT_KEY_FEATURE_STORM',				'TXT_KEY_CIV5_IMPROVEMENTS_STORM_HELP',	NULL,							5,			3,				0,				1,				'IMPROVEMENTS_STORM_ICON_ATLAS'),
						('FEATURE_RESTRICTED_VISIBILITY_LAND',	'TXT_KEY_FEATURE_STORM',				'TXT_KEY_CIV5_IMPROVEMENTS_STORM_HELP',	NULL,							3,			3,				0,				1,				'IMPROVEMENTS_STORM_ICON_ATLAS'),
						('FEATURE_FLOOD_PLAINS_STORM',			'TXT_KEY_FEATURE_FLOOD_PLAINS_STORM',	'TXT_KEY_CIV5_IMPROVEMENTS_STORM_HELP',	'ART_DEF_FEATURE_FLOOD_PLAINS',	3,			3,				0,				1,				'IMPROVEMENTS_STORM_ICON_ATLAS'),
						('FEATURE_ATOLL_STORM',					'TXT_KEY_FEATURE_ATOLL_STORM',			'TXT_KEY_CIV5_IMPROVEMENTS_STORM_HELP',	'ART_DEF_FEATURE_ATOLL',		5,			3,				0,				1,				'IMPROVEMENTS_STORM_ICON_ATLAS')/*,
						('FEATURE_FOREST_STORM',				'TXT_KEY_FEATURE_FOREST_STORM',			'TXT_KEY_CIV5_IMPROVEMENTS_STORM_HELP',	'ART_DEF_FEATURE_FOREST',		4,			3,				0,				1,				'IMPROVEMENTS_STORM_ICON_ATLAS'),
						('FEATURE_JUNGLE_STORM',				'TXT_KEY_FEATURE_JUNGLE_STORM',			'TXT_KEY_CIV5_IMPROVEMENTS_STORM_HELP',	'ART_DEF_FEATURE_JUNGLE',		4,			3,				0,				1,				'IMPROVEMENTS_STORM_ICON_ATLAS'),
						('FEATURE_ICE_STORM',					'TXT_KEY_FEATURE_ICE_STORM',			'TXT_KEY_CIV5_IMPROVEMENTS_STORM_HELP',	'ART_DEF_FEATURE_ICE',			4,			3,				0,				1,				'IMPROVEMENTS_STORM_ICON_ATLAS')*/;

----------------------------------------------------------
-- Atlases
----------------------------------------------------------
INSERT INTO IconTextureAtlases	(Atlas,								IconSize,		Filename,			IconsPerRow,	IconsPerColumn)
	SELECT						'IMPROVEMENTS_STORM_ICON_ATLAS',	256,			'Storm_256.dds',	1,				1				UNION ALL
	SELECT						'IMPROVEMENTS_STORM_ICON_ATLAS',	128,			'Storm_128.dds',	1,				1				UNION ALL
	SELECT						'IMPROVEMENTS_STORM_ICON_ATLAS',	80,				'Storm_80.dds',		1,				1				UNION ALL
	SELECT						'IMPROVEMENTS_STORM_ICON_ATLAS',	64,				'Storm_64.dds',		1,				1				UNION ALL
	SELECT						'IMPROVEMENTS_STORM_ICON_ATLAS',	45,				'Storm_45.dds',		1,				1;

----------------------------------------------------------
-- Text Keys
----------------------------------------------------------
INSERT INTO Language_en_US	(Tag,										Text)
	VALUES					('TXT_KEY_IMPROVEMENT_STORM',				'Storm'),
							('TXT_KEY_CIV5_IMPROVEMENTS_STORM_HELP',	'A storm is any disturbed state of the natural environment or the atmosphere.  It may be marked by significant disruptions to normal conditions such as strong wind, tornadoes, hail, thunder and lightning (a thunderstorm), heavy precipitation (snowstorm, rainstorm), heavy freezing rain (ice storm), strong winds (tropical cyclone, windstorm), wind transporting some substance through the atmosphere such as in a dust storm, among other forms of severe weather.  Storms have the potential to harm lives and property, and limit human mobility and visibility.'),
							('TXT_KEY_CIV5_IMPROVEMENTS_STORM_TEXT',	'Storms develop spontaneously in ocean and coast tiles.'),
							('TXT_KEY_FEATURE_STORM',					'Storm'),
							/*('TXT_KEY_FEATURE_ICE_STORM',				'Storm, Ice'),*/
							('TXT_KEY_FEATURE_ATOLL_STORM',				'Storm, Atoll'),
							('TXT_KEY_FEATURE_FLOOD_PLAINS_STORM',		'Storm, Flood Plains'),
							('TXT_KEY_PROMOTION_AIR_WEATHER',			'Weather Sensitive'),
							('TXT_KEY_PROMOTION_AIR_WEATHER_HELP',		'-20% [ICON_WAR] [COLOR_NEGATIVE_TEXT]Attack Strength[ENDCOLOR] in [COLOR_MENU_BLUE]Storms[ENDCOLOR]'),
							('TXT_KEY_PROMOTION_ALL_WEATHER',			'All-Weather'),
							('TXT_KEY_PROMOTION_ALL_WEATHER_HELP',		'Double [ICON_MOVES] [COLOR_POSITIVE_TEXT]movement[ENDCOLOR] in [COLOR_MENU_BLUE]Storms[ENDCOLOR]'),
							('TXT_KEY_PROMOTION_WEATHERED',				'Weather Limited'),
							('TXT_KEY_PROMOTION_WEATHERED_HELP',		'-1 [ICON_MOVES] [COLOR_NEGATIVE_TEXT]movement[ENDCOLOR] and [COLOR_NEGATIVE_TEXT]vision[ENDCOLOR] due to [COLOR_MENU_BLUE]Storm[ENDCOLOR]');