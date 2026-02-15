--------------------------------------------------------------------------------------------------
--Improvements
--------------------------------------------------------------------------------------------------

--whaling mwhale resource
INSERT INTO Improvements	(Type,						RemovesResource,	RequiresImprovement,	Water,	DestroyedWhenPillaged,	BuildableOnResources,	OutsideBorders,	InAdjacentFriendly,	IgnoreOwnership,	GraphicalOnly,	Description,						Civilopedia,									Help,											ArtDefineTag,							Permanent,	PortraitIndex,	DefenseModifier,	IconAtlas,						RemoveWhenComplete,	OwnerOnly)
	VALUES					('IMPROVEMENT_WHALING',		1,					0,						1,		1,						1,						0,				0,					1,					0,				'TXT_KEY_IMPROVEMENT_FISHWHALING',	'TXT_KEY_CIV5_IMPROVEMENT_FISHWHALING_TEXT',	'TXT_KEY_CIV5_IMPROVEMENT_FISHWHALING_HELP',	'ART_DEF_IMPROVEMENT_FISHING_BOATS',	0,			42,				0,					'WILDLIFE_ATLAS',				1,					0);

INSERT INTO Improvement_ResourceTypes		(ImprovementType,		ResourceType,				ResourceMakesValid,	ResourceTrade,	DiscoveryRand,	QuantityRequirement)
	VALUES									('IMPROVEMENT_WHALING',	'RESOURCE_MIGRATORY_WHALE',	1,					0,				0,				0);

INSERT INTO Builds		(Type,				Description,						Help,											HotKey,	Kill,	Water,	CanBeEmbarked,	ImprovementType,		EntityEvent,				IconIndex,	IconAtlas,					ShowInTechTree)
	VALUES				('BUILD_WHALING',	'TXT_KEY_IMPROVEMENT_FISHWHALING',	'TXT_KEY_CIV5_IMPROVEMENT_FISHWHALING_HELP',	'KB_F',	1,		1,		1,				'IMPROVEMENT_WHALING',	'ENTITY_EVENT_BUILD',		35,			'UNIT_ACTION_ATLAS',		0);

INSERT INTO Unit_Builds		(UnitType,				BuildType)
	VALUES					('UNIT_WORKBOAT',		'BUILD_WHALING');

INSERT INTO Improvement_Yields	(ImprovementType,		YieldType,			Yield) 
	VALUES						('IMPROVEMENT_WHALING',	'YIELD_PRODUCTION',	1),
								('IMPROVEMENT_WHALING',	'YIELD_FOOD',		1),
								('IMPROVEMENT_WHALING',	'YIELD_GOLD',		1),
								('IMPROVEMENT_WHALING',	'YIELD_SCIENCE',	1),
								('IMPROVEMENT_WHALING',	'YIELD_CULTURE',	1);

--whaling fish resource
INSERT INTO Improvements	(Type,						RequiresImprovement,	Water,	DestroyedWhenPillaged,	BuildableOnResources,	OutsideBorders,	InAdjacentFriendly,	IgnoreOwnership,	GraphicalOnly,	Description,						Civilopedia,									Help,											ArtDefineTag,							Permanent,	PortraitIndex,	DefenseModifier,	IconAtlas,						RemoveWhenComplete,	OwnerOnly)
	VALUES					('IMPROVEMENT_FISHWHALING',	1,						1,		1,						1,						0,				0,					1,					0,				'TXT_KEY_IMPROVEMENT_FISHWHALING',	'TXT_KEY_CIV5_IMPROVEMENT_FISHWHALING_TEXT',	'TXT_KEY_CIV5_IMPROVEMENT_FISHWHALING_HELP',	'ART_DEF_IMPROVEMENT_FISHING_BOATS',	0,			42,				0,					'WILDLIFE_ATLAS',				1,					0);

INSERT INTO Improvement_ValidImprovements	(ImprovementType,			PrereqImprovement)
	VALUES									('IMPROVEMENT_FISHWHALING',	'IMPROVEMENT_MWHALE');

INSERT INTO Builds		(Type,					Description,						Help,											HotKey,	Kill,	Water,	CanBeEmbarked,	ImprovementType,			EntityEvent,				IconIndex,	IconAtlas,					ShowInTechTree)
	VALUES				('BUILD_FISHWHALING',	'TXT_KEY_IMPROVEMENT_FISHWHALING',	'TXT_KEY_CIV5_IMPROVEMENT_FISHWHALING_HELP',	'KB_F',	1,		1,		1,				'IMPROVEMENT_FISHWHALING',	'ENTITY_EVENT_BUILD',		35,			'UNIT_ACTION_ATLAS',		0);

INSERT INTO Unit_Builds		(UnitType,				BuildType)
	VALUES					('UNIT_WORKBOAT',		'BUILD_FISHWHALING');

INSERT INTO Improvement_Yields	(ImprovementType,			YieldType,			Yield) 
	VALUES						('IMPROVEMENT_FISHWHALING',	'YIELD_PRODUCTION',	1),
								('IMPROVEMENT_FISHWHALING',	'YIELD_FOOD',		1),
								('IMPROVEMENT_FISHWHALING',	'YIELD_GOLD',		1),
								('IMPROVEMENT_FISHWHALING',	'YIELD_SCIENCE',	1),
								('IMPROVEMENT_FISHWHALING',	'YIELD_CULTURE',	1);

INSERT INTO Language_en_US
		(Tag,											Text)
VALUES	('TXT_KEY_IMPROVEMENT_FISHWHALING',				'Whaling'),
		('TXT_KEY_CIV5_IMPROVEMENT_FISHWHALING_TEXT',	'Whales are aquatic mammals that spawn in Coastal Water Tiles but can move on the deep oceans. Killing a Whale nets +2 [ICON_FOOD] Food in the nearest city.'),
		('TXT_KEY_CIV5_IMPROVEMENT_FISHWHALING_HELP',	'Whales are aquatic mammals that spawn in Coastal Water Tiles but can move on the deep oceans. Killing a Whale nets +2 [ICON_FOOD] Food in the nearest city.');

--whale
INSERT INTO Improvements	(Type,						Water,	DestroyedWhenPillaged,	BuildableOnResources,	OutsideBorders,	InAdjacentFriendly,		IgnoreOwnership,	GraphicalOnly,	Description,					Civilopedia,								Help,							ArtDefineTag,					Permanent,	PortraitIndex,	DefenseModifier,	IconAtlas,				OwnerOnly,	RequiresResource)
	VALUES					('IMPROVEMENT_MWHALE',		1,		1,						1,						1,				0,						1,					0,				'TXT_KEY_IMPROVEMENT_MWHALE',	'TXT_KEY_CIV5_IMPROVEMENT_MWHALE_HELP',		'TXT_KEY_IMPROVEMENT_MWHALE',	NULL,							0,			10,				0,					'RESOURCE_ATLAS',		0,			0);

INSERT INTO Language_en_US
		(Tag,											Text)
VALUES	('TXT_KEY_IMPROVEMENT_MWHALE',					'[ICON_RES_WHALE] Whales'),
		('TXT_KEY_CIV5_IMPROVEMENT_MWHALE_HELP',		'Whales are aquatic mammals that spawn in Coastal Water Tiles but can move on the deep oceans. Killing a Whale nets +2 [ICON_FOOD] Food in the nearest city.');

INSERT INTO Improvement_ResourceType_Yields	(ImprovementType,		ResourceType,		YieldType,			Yield) 
	VALUES									('IMPROVEMENT_MWHALE',	'RESOURCE_FISH',	'YIELD_FOOD',		-1);

--------------------------------------------------------------------------------------------------
--Resources
--------------------------------------------------------------------------------------------------

INSERT INTO Language_en_US
		(Tag,											Text)
VALUES	('TXT_KEY_RESOURCE_MIGRATORY_WHALE',			'Migratory Whales'),
		('TXT_KEY_CIV5_RESOURCE_MIGRATORY_WHALE_TEXT',	'Migratory whales are aquatic mammals that spawn from Whale resource plots. A migratory whale may convert a fish resource into new whale breeding waters.');

INSERT INTO Resource_YieldChanges
		(ResourceType,					YieldType,		Yield)
VALUES	('RESOURCE_MIGRATORY_WHALE',	'YIELD_FOOD',	-1);

--------------------------------------------------------------------------------------------------
--Units
--------------------------------------------------------------------------------------------------

--whaler boat
INSERT INTO Units	(Type,				Description,	Civilopedia,	Strategy,	Help,	Requirements,	Combat,	RangedCombat,	Cost,	FaithCost,	Moves,	Immobile,	Range,	BaseSightRange,	Class,	Special,	Capture,	CombatClass,	Domain,	CivilianAttackPriority,	DefaultUnitAI,			Food,	NoBadGoodies,	RivalTerritory,	MilitarySupport,	MilitaryProduction,	Pillage,	Found,	FoundAbroad,	CultureBombRadius,	GoldenAgeTurns,	IgnoreBuildingDefense,	PrereqResources,	Mechanized,	Suicide,	CaptureWhileEmbarked,	PrereqTech,	ObsoleteTech,	GoodyHutUpgradeUnitClass,	HurryCostModifier,	AdvancedStartCost,	MinAreaSize,	AirUnitCap,	NukeDamageLevel,	WorkRate,	NumFreeTechs,	RushBuilding,	BaseHurry,	HurryMultiplier,	BaseGold,	NumGoldPerEra,	SpreadReligion,	CombatLimit,	RangeAttackOnlyInDomain,	RangeAttackIgnoreLOS,	RangedCombatLimit,	XPValueAttack,	XPValueDefense,	SpecialCargo,	DomainCargo,	Conscription,	ExtraMaintenanceCost,	NoMaintenance,	Unhappiness,	UnitArtInfo,				UnitArtInfoCulturalVariation,	UnitArtInfoEraVariation,	ProjectPrereq,	SpaceshipProject,	LeaderPromotion,	LeaderExperience,	DontShowYields,	ShowInPedia,	MoveRate,	UnitFlagIconOffset,	PortraitIndex,	IconAtlas, UnitFlagAtlas)
	SELECT			('UNIT_WHALER'),	('Whaler'),		Civilopedia,	Strategy,	Help,	Requirements,	Combat,	RangedCombat,	(-1),	(-1),		Moves,	Immobile,	Range,	BaseSightRange,	Class,	Special,	Capture,	CombatClass,	Domain,	CivilianAttackPriority,	('UNITAI_TREASURE'),	Food,	NoBadGoodies,	RivalTerritory,	MilitarySupport,	MilitaryProduction,	Pillage,	Found,	FoundAbroad,	CultureBombRadius,	GoldenAgeTurns,	IgnoreBuildingDefense,	PrereqResources,	Mechanized,	Suicide,	CaptureWhileEmbarked,	PrereqTech,	ObsoleteTech,	GoodyHutUpgradeUnitClass,	HurryCostModifier,	AdvancedStartCost,	MinAreaSize,	AirUnitCap,	NukeDamageLevel,	WorkRate,	NumFreeTechs,	RushBuilding,	BaseHurry,	HurryMultiplier,	BaseGold,	NumGoldPerEra,	SpreadReligion,	CombatLimit,	RangeAttackOnlyInDomain,	RangeAttackIgnoreLOS,	RangedCombatLimit,	XPValueAttack,	XPValueDefense,	SpecialCargo,	DomainCargo,	Conscription,	ExtraMaintenanceCost,	NoMaintenance,	Unhappiness,	UnitArtInfo,				UnitArtInfoCulturalVariation,	UnitArtInfoEraVariation,	ProjectPrereq,	SpaceshipProject,	LeaderPromotion,	LeaderExperience,	DontShowYields,	ShowInPedia,	MoveRate,	('0'),				PortraitIndex,	IconAtlas, ('WHALE_FLAG')
	FROM Units WHERE (Type = 'UNIT_WORKBOAT');

INSERT INTO Unit_Flavors
		(UnitType,			FlavorType,							Flavor)
VALUES	('UNIT_WHALER',		'FLAVOR_GROWTH',					10),
		('UNIT_WHALER',		'FLAVOR_NAVAL_TILE_IMPROVEMENT',	10),
		('UNIT_WHALER',		'FLAVOR_GOLD',						5),
		('UNIT_WHALER',		'FLAVOR_PRODUCTION',				5),
		('UNIT_WHALER',		'FLAVOR_SCIENCE',					5),
		('UNIT_WHALER',		'FLAVOR_CULTURE',					5);

INSERT INTO Unit_AITypes
		(UnitType,			UnitAIType)
VALUES	('UNIT_WHALER',		'UNITAI_TREASURE');

--whale
INSERT INTO UnitClasses
		(Type,					Description,				DefaultUnit)
VALUES	('UNITCLASS_WHALE_MWB',	'TXT_KEY_UNIT_WHALE_MWB',	'UNIT_WHALE_MWB');

INSERT INTO Units
		(Type,				Description,				Civilopedia,					Strategy,							Help,							Combat,	RangedCombat,	Cost,	FaithCost,	Moves,	Range,	BaseSightRange,	Class,					CombatClass,				Domain,			DefaultUnitAI,			RivalTerritory,	MilitarySupport,	MilitaryProduction,	Pillage,	Mechanized,	AdvancedStartCost,	MinAreaSize,	RangeAttackOnlyInDomain,	XPValueAttack,	XPValueDefense,	NoMaintenance,	UnitArtInfo,				MoveRate,		UnitFlagIconOffset,		PortraitIndex,	IconAtlas,			UnitFlagAtlas,	HighSeaRaider,	SendCanMoveIntoEvent,	NoMinorCivGift) 
VALUES	('UNIT_WHALE_MWB',	'TXT_KEY_UNIT_WHALE_MWB',	'TXT_KEY_UNIT_WHALE_MWB_PEDIA',	'TXT_KEY_UNIT_WHALE_MWB_STRATEGY',	'TXT_KEY_UNIT_WHALE_MWB_HELP',	1,		1,				-1,		-1,			5,		1,		1,				'UNITCLASS_WHALE_MWB',	'UNITCOMBAT_NAVALMELEE',	'DOMAIN_SEA',	'UNITAI_ATTACK_SEA',	1,				0,					0,					1,			0,			30,					10,				1,							3,				3,				1,				'ART_DEF_UNIT_WHALE_MWB',	'WOODEN_BOAT',	0,						42,				'WILDLIFE_ATLAS',	'WHALE_FLAG',	0,				1,						1);

INSERT INTO Unit_Flavors
		(UnitType,			FlavorType,			Flavor)
VALUES	('UNIT_WHALE_MWB',	'FLAVOR_OFFENSE',	10);

INSERT INTO Unit_AITypes
		(UnitType,			UnitAIType)
VALUES	('UNIT_WHALE_MWB',	'UNITAI_ASSAULT_SEA'),
		('UNIT_WHALE_MWB',	'UNITAI_EXPLORE_SEA');

INSERT INTO IconTextureAtlases
		(Atlas,			IconSize,	Filename,				IconsPerRow,	IconsPerColumn)
VALUES	('WHALE_FLAG',	32,			'WhaleUnitIcon.dds',	1,				1);

INSERT INTO Language_en_US
		(Tag,								Text)
VALUES	('TXT_KEY_UNIT_WHALE_MWB',			'Whale'),
		('TXT_KEY_UNIT_WHALE_MWB_PEDIA',	'Migratory whales are aquatic mammals that spawn from Whale resource plots. A migratory whale may convert a fish resource into new whale breeding waters.'),
		('TXT_KEY_UNIT_WHALE_MWB_STRATEGY',	'Whale'),
		('TXT_KEY_UNIT_WHALE_MWB_HELP',		'Migratory whales are aquatic mammals that spawn from Whale resource plots. A migratory whale may convert a fish resource into new whale breeding waters.');

--workboat change port
UPDATE Units
SET CanChangePort = 1
WHERE CombatClass = 'UNITCOMBAT_WORKBOAT';

UPDATE Units
SET CanRepairFleet = 1, CanChangePort = 1
WHERE Class = 'UNITCLASS_GREAT_ADMIRAL';

--------------------------------------------------------------------------------------------------
--Promotions
--------------------------------------------------------------------------------------------------

INSERT INTO UnitPromotions
		(Type,					Description,					Help,								PortraitIndex,	IconAtlas,			Sound,				CannotBeChosen,	LostWithUpgrade,	NoDefensiveBonus,	HealOutsideFriendly,	IgnoreTerrainCost,	NoCapture,	OnlyDefensive,	HiddenNationality,	AlwaysHostile,	NoRevealMap,	HealOnPillage,	IgnoreGreatGeneralBenefit,	IgnoreZOC,	EnemyDamageChance,	NeutralDamageChance,	EnemyDamage,	NeutralDamage,	CannotBeCaptured,	BarbarianOnly,	NoSupply,	GainsXPFromPillaging,	XPFromPillaging,	TileDamageIfNotMoved,	CanCrossIce,	CanCrossOceans,	ExtraWithdrawal,	Invisible,				PediaType,		PediaEntry)
VALUES	('PROMOTION_WHALE_MWB',	'TXT_KEY_PROMOTION_WHALE_MWB',	'TXT_KEY_PROMOTION_WHALE_MWB_HELP',	31,				'promoVP_atlas_00',	'AS2D_IF_LEVELUP',	1,				0,					0,					1,						1,					1,			1,				1,					0,				1,				1,				1,							1,			100,				100,					15,				15,				1,					0,				1,			1,						3,					15,						1,				1,				100,				'INVISIBLE_SUBMARINE',	'PEDIA_SHARED',	'TXT_KEY_PROMOTION_WHALE_MWB');

INSERT INTO Unit_FreePromotions
		(UnitType,			PromotionType)
VALUES	('UNIT_WHALE_MWB',	'PROMOTION_WHALE_MWB');

INSERT INTO Language_en_US
		(Tag,											Text)
VALUES	('TXT_KEY_PROMOTION_WHALE_MWB',					'Cetacean'),
		('TXT_KEY_PROMOTION_WHALE_MWB_HELP',			'Roams around looking for fish. [COLOR_NEGATIVE_TEXT]May attack Fishing Boats and Civilians![ENDCOLOR]');


UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_CAN_MOVE_INTO';
--UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_RED_TURN';
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_PLAYER_TURN';
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_UNIT_ACTIONS';
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'IMPROVEMENTS_EXTENSIONS';
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_PLOT';
UPDATE CustomModOptions    SET Value = 1 WHERE Name = 'GLOBAL_SEPARATE_GREAT_ADMIRAL';