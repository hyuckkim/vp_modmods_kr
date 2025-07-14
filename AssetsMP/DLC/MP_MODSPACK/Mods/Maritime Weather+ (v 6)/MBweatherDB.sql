----------------------------------------------------------
-- ArtDefine Landmarks
----------------------------------------------------------
INSERT INTO ArtDefine_LandmarkTypes	(Type,							LandmarkType,	FriendlyName)
	SELECT							'ART_DEF_IMPROVEMENT_STORM',	'Improvement',	'Storm';

INSERT INTO ArtDefine_Landmarks	(Era,	State,	Scale,	ImprovementType,				LayoutHandler,	ResourceType,				Model,			TerrainContour)
	SELECT						'Any',	'Any',	1,		'ART_DEF_IMPROVEMENT_STORM',	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL',		'Cloud.fxsxml',	1;

INSERT INTO ArtDefine_StrategicView	(StrategicViewType,				TileType,		Asset)
	SELECT							'ART_DEF_IMPROVEMENT_STORM',	'Improvement',	'StormSV_256.dds';

----------------------------------------------------------
-- Promotions
----------------------------------------------------------

INSERT INTO UnitPromotions
		(Type,							Description,							Help,										PortraitIndex,	IconAtlas,				OrderPriority,	FlagPromoOrder,	RankList,		RankNumber,	Sound,				CannotBeChosen,	LostWithUpgrade,	NotWithUpgrade,	IgnoreTerrainCost,	FreePillageMoves,	OnlyDefensive,	RangedSupportFire,	CanMoveAfterAttacking,	EnemyHealChange,	NeutralHealChange,	FriendlyHealChange,	AdjacentTileHealChange,	VisibilityChange,	CityAttack,	FortifyEffectiveness,	CombatPercent,	AttackMod,	DefenseMod,	RangedDefenseMod,	AttackFortifiedMod,	MovesChange,	RangeChange,	PlagueChance,	PlaguePromotion,		AdjacentEnemySapMovement,	NoAdjacentUnitMod,	AttackFullyHealedMod,	AttackAbove50HealthMod,	AttackBelowEqual50HealthMod,	AttackWoundedMod,	HasPostCombatPromotions,	AoEWhileFortified,	AoEDamageOnMove,	NearbyEnemyDamage,	PromotionDuration,	IsLostOnMove,	ExtraWithdrawal,	ExtraAttacks,	IgnoreZOC,	PromotionPrereqOr1,					Invisible,				PediaType,			PediaEntry,										ShowInUnitPanel,	IsVisibleAboveFlag)
VALUES	('PROMOTION_AIR_WEATHER',		'TXT_KEY_PROMOTION_AIR_WEATHER',		'TXT_KEY_PROMOTION_AIR_WEATHER_HELP',		57,				'ABILITY_ATLAS',		9999,			9999,			'',				0,			'AS2D_IF_LEVELUP',	1,				0,					0,				0,					0,					0,				0,					0,						0,					0,					0,					0,						0,					0,			100,					0,				0,			0,			0,					0,					0,				0,				0,				NULL,					0,							0,					0,						0,						0,								0,					0,							0,					0,					0,					0,					0,				0,					0,				0,			NULL,								NULL,					'PEDIA_AIR',		'TXT_KEY_PROMOTION_AIR_WEATHER',				0,					0);

INSERT INTO UnitPromotions_Features
		(PromotionType,							FeatureType,						Attack,	Defense,	DoubleMove,	IgnoreTerrainCostFrom,	ExtraMove)
VALUES	('PROMOTION_INVISIBLE_SUBMARINE',		'FEATURE_RESTRICTED_VISIBILITY',	0,		0,			0,			1,						0),
		('PROMOTION_HOVERING_UNIT',				'FEATURE_RESTRICTED_VISIBILITY',	-20,	-20,		0,			0,						1),
		('PROMOTION_AIR_WEATHER',				'FEATURE_RESTRICTED_VISIBILITY',	-20,	0,			0,			0,						1),
		('PROMOTION_RECON_EXPERIENCE',			'FEATURE_RESTRICTED_VISIBILITY',	0,		0,			0,			0,						1),
		('PROMOTION_ALLWATER_EMBARKATION',		'FEATURE_RESTRICTED_VISIBILITY',	0,		0,			0,			0,						1),
		('PROMOTION_EMBARKATION',				'FEATURE_RESTRICTED_VISIBILITY',	0,		0,			0,			0,						1),
		('PROMOTION_NAVIGATOR_2',				'FEATURE_RESTRICTED_VISIBILITY',	0,		0,			1,			0,						0),
		('PROMOTION_FROGMAN',					'FEATURE_RESTRICTED_VISIBILITY',	0,		0,			1,			0,						0);

UPDATE Language_en_US
SET Text = Text||'[NEWLINE]Immune to [ICON_MOVES] [COLOR_POSITIVE_TEXT]Movement penalty[ENDCOLOR] from [COLOR_MENU_BLUE]Storms[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_PROMOTION_INVISIBLE_SUBMARINE_HELP';

UPDATE Language_en_US
SET Text = Text||'[NEWLINE]-20% [ICON_STRENGTH] [COLOR_NEGATIVE_TEXT]Combat Strength[ENDCOLOR] & Extra [ICON_MOVES] [COLOR_NEGATIVE_TEXT]Movement cost[ENDCOLOR] in [COLOR_MENU_BLUE]Storms[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_PROMOTION_HOVERING_UNIT_HELP';

UPDATE Language_en_US
SET Text = Text||'[NEWLINE]Extra [ICON_MOVES] [COLOR_NEGATIVE_TEXT]Movement cost[ENDCOLOR] in [COLOR_MENU_BLUE]Storms[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_PROMOTION_RECON_EXPERIENCE_HELP';

UPDATE Language_en_US
SET Text = Text||'[NEWLINE]Extra [ICON_MOVES] [COLOR_NEGATIVE_TEXT]Movement cost[ENDCOLOR] in [COLOR_MENU_BLUE]Storms[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_PROMOTION_ALLWATER_EMBARKATION_HELP';

UPDATE Language_en_US
SET Text = Text||'[NEWLINE]Extra [ICON_MOVES] [COLOR_NEGATIVE_TEXT]Movement cost[ENDCOLOR] in [COLOR_MENU_BLUE]Storms[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_PROMOTION_EMBARKATION_HELP';

UPDATE Language_en_US
SET Text = Text||'[NEWLINE]Half [ICON_MOVES] [COLOR_POSITIVE_TEXT]Movement cost[ENDCOLOR] in [COLOR_MENU_BLUE]Storms[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_PROMOTION_NAVIGATOR_2_HELP';

UPDATE Language_en_US
SET Text = Text||'[NEWLINE]Half [ICON_MOVES] [COLOR_POSITIVE_TEXT]Movement cost[ENDCOLOR] in [COLOR_MENU_BLUE]Storms[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_PROMOTION_FROGMAN_HELP';

INSERT INTO Unit_FreePromotions (UnitType,			PromotionType)
SELECT							Type,				'PROMOTION_AIR_WEATHER'
FROM Units WHERE Domain = 'DOMAIN_AIR';

----------------------------------------------------------
-- Improvements
----------------------------------------------------------
INSERT INTO Improvements	(Type,					Description,					Civilopedia,							Help,									ArtDefineTag,					Permanent,	GraphicalOnly,	DestroyedWhenPillaged,	PortraitIndex,	IconAtlas,							MovesChange,	OwnerOnly,	IgnoreOwnership,	OutsideBorders)
	VALUES					('IMPROVEMENT_STORM',	'TXT_KEY_IMPROVEMENT_STORM',	'TXT_KEY_CIV5_IMPROVEMENTS_STORM_TEXT',	'TXT_KEY_CIV5_IMPROVEMENTS_STORM_HELP',	'ART_DEF_IMPROVEMENT_STORM',	0,			1,				1,						0,				'IMPROVEMENTS_STORM_ICON_ATLAS',	-1,				0,			1,					1);

INSERT INTO Improvement_ValidTerrains	(ImprovementType,		TerrainType) 
	VALUES								('IMPROVEMENT_STORM',	'TERRAIN_OCEAN'),
										('IMPROVEMENT_STORM',	'TERRAIN_COAST');

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
							('TXT_KEY_FEATURE_STORM',					'Restricted Visibility & Movement'),
							('TXT_KEY_CIV5_WASHOUT',					'[COLOR_MENU_BLUE]Washout[ENDCOLOR]'),
							('TXT_KEY_PROMOTION_AIR_WEATHER',			'Weather Sensitive'),
							('TXT_KEY_PROMOTION_AIR_WEATHER_HELP',		'-20% [ICON_WAR] [COLOR_NEGATIVE_TEXT]Attack Strength[ENDCOLOR] & Extra [ICON_MOVES] [COLOR_NEGATIVE_TEXT]Movement cost[ENDCOLOR] in [COLOR_MENU_BLUE]Storms[ENDCOLOR]');

UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_PLOT';
--UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_CITY_FOUNDING';
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_RED_TURN';
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_UNIT_ACTIONS';
