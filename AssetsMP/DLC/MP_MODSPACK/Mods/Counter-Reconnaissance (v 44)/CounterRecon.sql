--recon xp promo

INSERT INTO UnitPromotions
        (Type,						Description,						Help,									PortraitIndex,	IconAtlas,							Sound,				CannotBeChosen,	RoughTerrainEndsTurn,	EnemyHealChange,	NeutralHealChange,	FriendlyHealChange,	AdjacentTileHealChange,	VisibilityChange,	MovesChange,	PlagueID,	HasPostCombatPromotions,	PromotionDuration,	PediaType,		PediaEntry)
VALUES	('PROMOTION_SCREENED',		'TXT_KEY_PROMOTION_SCREENED',		'TXT_KEY_PROMOTION_SCREENED_HELP',		5,				'KRIS_SWORDSMAN_PROMOTION_ATLAS',	'AS2D_IF_LEVELUP',	1,				1,						0,					0,					0,					0,						-10,				0,				318,		1,							2,					'PEDIA_SHARED',	'TXT_KEY_PEDIA_PROMOTION_SCREENED');

INSERT INTO UnitPromotions
        (Type,					Description,					Help,								PortraitIndex,	IconAtlas,							Sound,				CannotBeChosen,	IsLostOnMove,	RoughTerrainEndsTurn,	EnemyHealChange,	NeutralHealChange,	FriendlyHealChange,	AdjacentTileHealChange,	VisibilityChange,	MovesChange,	RangedDefenseMod,	FortifyEffectiveness,	PlagueID,	HasPostCombatPromotions,	PromotionDuration,	PediaType,		PediaEntry)
VALUES	('PROMOTION_RECONHEAL',	'TXT_KEY_PROMOTION_RECONHEAL',	'TXT_KEY_PROMOTION_RECONHEAL_HELP',	31,				'promoVP_atlas_03',					'AS2D_IF_LEVELUP',	1,				1,				0,						5,					5,					0,					0,						0,					0,				0,					100,					319,		1,							1,					'PEDIA_SHARED',	'TXT_KEY_PEDIA_PROMOTION_RECONHEAL'),
		('PROMOTION_SABOTAGED',	'TXT_KEY_PROMOTION_SABOTAGED',	'TXT_KEY_PROMOTION_SABOTAGED_HELP',	6,				'KRIS_SWORDSMAN_PROMOTION_ATLAS',	'AS2D_IF_LEVELUP',	1,				1,				0,						0,					-5,					-5,					0,						0,					0,				0,					75,						317,		1,							2,					'PEDIA_SHARED',	'TXT_KEY_PEDIA_PROMOTION_SABOTAGED');
/**
INSERT INTO UnitPromotions_Features
		(PromotionType,			FeatureType,		ExtraMove)
VALUES	('PROMOTION_SCREENED',	'FEATURE_FOREST',	1),
		('PROMOTION_SCREENED',	'FEATURE_JUNGLE',	1),
		('PROMOTION_SCREENED',	'FEATURE_OASIS',	1),
		('PROMOTION_SCREENED',	'FEATURE_MARSH',	1);

INSERT INTO UnitPromotions_Terrains
		(PromotionType,			TerrainType,		ExtraMove)
VALUES	('PROMOTION_SCREENED',	'TERRAIN_HILL',		1);

INSERT INTO UnitPromotions_BlockedPromotions
		(PromotionType,							BlockedPromotionType)
VALUES	('PROMOTION_WOODLAND_TRAILBLAZER_3',	'PROMOTION_SURVIVALISM_3'),
		('PROMOTION_WOODLAND_TRAILBLAZER_3',	'PROMOTION_MEDIC_II'),
		('PROMOTION_SURVIVALISM_3',				'PROMOTION_WOODLAND_TRAILBLAZER_3'),
		('PROMOTION_SURVIVALISM_3',				'PROMOTION_MEDIC_II'),
		('PROMOTION_MEDIC_II',					'PROMOTION_WOODLAND_TRAILBLAZER_3'),
		('PROMOTION_MEDIC_II',					'PROMOTION_SURVIVALISM_3'),
		('PROMOTION_TB_FINISHER',				'PROMOTION_SCOUTING_FINISHER'),
		('PROMOTION_SURV_FINISHER',				'PROMOTION_SCOUTING_FINISHER'),
		('PROMOTION_MEDIC_FINISHER',			'PROMOTION_SCOUTING_FINISHER'),
		('PROMOTION_SCOUTING_FINISHER',			'PROMOTION_TB_FINISHER'),
		('PROMOTION_SCOUTING_FINISHER',			'PROMOTION_SURV_FINISHER'),
		('PROMOTION_SCOUTING_FINISHER',			'PROMOTION_MEDIC_FINISHER');
**/
INSERT INTO UnitPromotions_UnitCombatMods
		(PromotionType,			UnitCombatType,		Modifier)
VALUES	('PROMOTION_SCREENED',	'UNITCOMBAT_RECON',	-10);

INSERT INTO UnitPromotions
		(Type,							Description,							Help,										PortraitIndex,	IconAtlas,				OrderPriority,	FlagPromoOrder,	RankList,		RankNumber,	Sound,				CannotBeChosen,	LostWithUpgrade,	NotWithUpgrade,	IgnoreTerrainCost,	FreePillageMoves,	OnlyDefensive,	RangedSupportFire,	CanMoveAfterAttacking,	EnemyHealChange,	NeutralHealChange,	FriendlyHealChange,	AdjacentTileHealChange,	VisibilityChange,	CityAttack,	AoEHealOnPillage,	FortifyEffectiveness,	CombatPercent,	AdjacentMod,	AttackMod,	DefenseMod,	RangedDefenseMod,	AttackFortifiedMod,	MovesChange,	RangeChange,	PlagueChance,	PlaguePromotion,		AdjacentEnemySapMovement,	NoAdjacentUnitMod,	PartialHealOnPillage,	AttackFullyHealedMod,	AttackAbove50HealthMod,	AttackBelowEqual50HealthMod,	AttackWoundedMod,	HasPostCombatPromotions,	AoEWhileFortified,	AoEDamageOnMove,	NearbyEnemyDamage,	PromotionDuration,	IsLostOnMove,	HPHealedIfDestroyEnemy,	ExtraWithdrawal,	EmbarkExtraVisibility,	ExtraAttacks,	IgnoreZOC,	PromotionPrereqOr1,					Invisible,				PediaType,			PediaEntry,										ShowInUnitPanel,	IsVisibleAboveFlag)
VALUES	('PROMOTION_RECON_COMBAT',		'TXT_KEY_PROMOTION_RECON_COMBAT',		'TXT_KEY_PROMOTION_RECON_COMBAT_HELP',		20,				'promoVP_atlas_01',		399,			399,			'RECON',		2,			'AS2D_IF_LEVELUP',	1,				0,					0,				0,					0,					0,				0,					0,						0,					0,					0,					0,						-10,				-20,		0,					100,					0,				0,				0,			0,			0,					-20,				0,				0,				0,				NULL,					0,							0,					0,						-20,					-20,					0,								0,					1,							0,					0,					0,					1,					0,				0,						100,				0,						0,				0,			NULL,								NULL,					'PEDIA_SCOUTING',	'TXT_KEY_PEDIA_PROMOTION_RECON_COMBAT',			1,					1),
		('PROMOTION_TB_FINISHER',		'TXT_KEY_PROMOTION_TB_FINISHER',		'TXT_KEY_PROMOTION_TB_FINISHER_HELP',		29,				'promoVP_atlas_03',		101,			101,			'TRAILBLAZER',	4,			'AS2D_IF_LEVELUP',	0,				0,					0,				0,					0,					0,				0,					0,						0,					0,					0,					0,						0,					0,			0,					100,					0,				0,				5,			0,			0,					0,					0,				0,				0,				NULL,					0,							0,					0,						0,						0,						0,								0,					0,							0,					0,					0,					0,					0,				0,						0,					0,						0,				0,			'PROMOTION_WOODLAND_TRAILBLAZER_3',	NULL,					'PEDIA_SCOUTING',	'TXT_KEY_PEDIA_PROMOTION_TB_FINISHER',			1,					1),
		('PROMOTION_SURV_FINISHER',		'TXT_KEY_PROMOTION_SURV_FINISHER',		'TXT_KEY_PROMOTION_SURV_FINISHER_HELP',		20,				'extraPromo_Atlas',		102,			102,			'SURVIVALISM',	4,			'AS2D_IF_LEVELUP',	0,				0,					0,				0,					0,					0,				0,					0,						0,					0,					0,					0,						0,					0,			0,					100,					0,				0,				0,			5,			0,					0,					0,				0,				0,				NULL,					0,							0,					0,						0,						0,						0,								0,					1,							0,					0,					0,					0,					0,				0,						100,				0,						0,				0,			'PROMOTION_SURVIVALISM_3',			NULL,					'PEDIA_SCOUTING',	'TXT_KEY_PEDIA_PROMOTION_SURV_FINISHER',		1,					1),
		('PROMOTION_SURV_COMBAT',		'TXT_KEY_PROMOTION_SURV_COMBAT',		'TXT_KEY_PROMOTION_SURV_COMBAT_HELP',		21,				'extraPromo_Atlas',		102,			102,			'SURVIVALISM',	4,			'AS2D_IF_LEVELUP',	1,				0,					0,				0,					0,					0,				0,					0,						0,					0,					0,					0,						0,					0,			0,					100,					0,				0,				0,			10,			0,					0,					0,				0,				0,				NULL,					0,							0,					0,						0,						0,						0,								0,					1,							0,					0,					5,					1,					0,				5,						0,					0,						0,				0,			NULL,								NULL,					'PEDIA_SCOUTING',	'TXT_KEY_PEDIA_PROMOTION_SURV_COMBAT',			1,					1),
		('PROMOTION_CCDCONCEALED',		'TXT_KEY_PROMOTION_CCDCONCEALED',		'TXT_KEY_PROMOTION_CCDCONCEALED_HELP',		60,				'promoVP_atlas_02',		399,			399,			'RECON',		1,			'AS2D_IF_LEVELUP',	1,				1,					1,				0,					0,					1,				0,					0,						0,					0,					0,					0,						0,					-10,		0,					100,					0,				0,				0,			0,			100,				-10,				0,				1,				0,				NULL,					0,							0,					0,						-10,					-10,					0,								0,					1,							0,					0,					0,					0,					0,				0,						0,					0,						0,				0,			NULL,								'INVISIBLE_SUBMARINE',	'PEDIA_SCOUTING',	'TXT_KEY_PEDIA_PROMOTION_CCDCONCEALED',			1,					1),
		('PROMOTION_MEDIC_FINISHER',	'TXT_KEY_PROMOTION_MEDIC_FINISHER',		'TXT_KEY_PROMOTION_MEDIC_FINISHER_HELP',	40,				'promoVP_atlas_03',		305,			305,			'MEDIC',		3,			'AS2D_IF_LEVELUP',	0,				0,					0,				0,					0,					0,				0,					0,						0,					0,					0,					0,						0,					0,			0,					125,					0,				5,				0,			0,			0,					0,					0,				0,				0,				NULL,					0,							0,					0,						0,						0,						0,								0,					1,							0,					0,					0,					0,					0,				0,						0,					0,						0,				0,			'PROMOTION_MEDIC_II',				NULL,					'PEDIA_SCOUTING',	'TXT_KEY_PEDIA_PROMOTION_MEDIC_FINISHER',		1,					1),
		('PROMOTION_MEDIC_COMBAT',		'TXT_KEY_PROMOTION_MEDIC_COMBAT',		'TXT_KEY_PROMOTION_MEDIC_COMBAT_HELP',		36,				'promoVP_atlas_01',		305,			305,			'MEDIC',		3,			'AS2D_IF_LEVELUP',	1,				0,					0,				0,					0,					0,				0,					0,						0,					0,					0,					0,						0,					0,			0,					150,					0,				0,				0,			0,			0,					0,					0,				0,				0,				NULL,					1,							0,					0,						0,						0,						0,								0,					1,							0,					0,					0,					1,					0,				0,						0,					0,						0,				0,			NULL,								NULL,					'PEDIA_SCOUTING',	'TXT_KEY_PEDIA_PROMOTION_MEDIC_COMBAT',			1,					1),
		('PROMOTION_SCOUTING_COMBAT',	'TXT_KEY_PROMOTION_SCOUTING_COMBAT',	'TXT_KEY_PROMOTION_SCOUTING_COMBAT_HELP',	53,				'promoVP_atlas_01',		301,			301,			'SCOUTING',		3,			'AS2D_IF_LEVELUP',	1,				0,					0,				0,					0,					0,				0,					0,						0,					0,					0,					0,						0,					0,			0,					100,					0,				0,				0,			0,			0,					5,					0,				0,				0,				NULL,					0,							0,					5,						0,						0,						0,								0,					1,							0,					0,					0,					1,					0,				0,						0,					0,						0,				1,			NULL,								NULL,					'PEDIA_SCOUTING',	'TXT_KEY_PEDIA_PROMOTION_SCOUTING_COMBAT',		1,					1),
		('PROMOTION_RECON_EMBARKED',	'TXT_KEY_PROMOTION_RECON_EMBARKED',		'TXT_KEY_PROMOTION_RECON_EMBARKED_HELP',	1,				'promoVP_atlas_04',		399,			399,			'RECON',		1,			'AS2D_IF_LEVELUP',	1,				0,					0,				0,					0,					0,				0,					0,						0,					0,					0,					0,						0,					-20,		0,					100,					0,				0,				0,			0,			0,					-20,				0,				0,				0,				NULL,					0,							0,					0,						-20,					-20,					0,								0,					1,							0,					0,					0,					0,					0,				0,						0,					0,						0,				0,			NULL,								NULL,					'PEDIA_SCOUTING',	'TXT_KEY_PEDIA_PROMOTION_RECON_EMBARKED',		1,					1),
		('PROMOTION_SCOUTING_FINISHER',	'TXT_KEY_PROMOTION_SCOUTING_FINISHER',	'TXT_KEY_PROMOTION_SCOUTING_FINISHER_HELP',	54,				'promoVP_atlas_01',		301,			301,			'SCOUTING',		3,			'AS2D_IF_LEVELUP',	0,				0,					0,				0,					0,					0,				0,					0,						0,					0,					0,					0,						0,					0,			5,					100,					0,				0,				0,			0,			0,					5,					0,				0,				0,				NULL,					0,							0,					0,						0,						0,						0,								0,					1,							0,					0,					0,					0,					0,				0,						0,					0,						0,				0,			'PROMOTION_SCOUTING_2',				NULL,					'PEDIA_SCOUTING',	'TXT_KEY_PEDIA_PROMOTION_SCOUTING_FINISHER',	1,					1);

INSERT INTO UnitPromotions_PostCombatRandomPromotion
		(PromotionType,					NewPromotion)
VALUES	('PROMOTION_CCDCONCEALED',		'PROMOTION_RECON_COMBAT'),
		('PROMOTION_SURV_FINISHER',		'PROMOTION_SURV_COMBAT'),
		('PROMOTION_SURV_COMBAT',		'PROMOTION_SURV_COMBAT'),
		('PROMOTION_RECON_COMBAT',		'PROMOTION_RECON_COMBAT'),
		('PROMOTION_SABOTAGED',			'PROMOTION_SABOTAGED'),
		('PROMOTION_MEDIC_FINISHER',	'PROMOTION_MEDIC_COMBAT'),
		('PROMOTION_MEDIC_COMBAT',		'PROMOTION_MEDIC_COMBAT'),
		('PROMOTION_SCOUTING_FINISHER',	'PROMOTION_SCOUTING_COMBAT'),
		('PROMOTION_SCOUTING_COMBAT',	'PROMOTION_SCOUTING_COMBAT'),
		('PROMOTION_RECON_EMBARKED',	'PROMOTION_RECON_COMBAT');
/**
INSERT INTO UnitPromotions_Plagues
		(PromotionType,					PlaguePromotionType,	DomainType,		ApplyOnAttack,	ApplyOnDefense,	ApplyChance)
VALUES	('PROMOTION_TB_FINISHER',		'PROMOTION_SCREENED',	'DOMAIN_LAND',	1,				0,				100),
		('PROMOTION_MEDIC_FINISHER',	'PROMOTION_SABOTAGED',	'DOMAIN_LAND',	1,				0,				100),
		('PROMOTION_SABOTAGED',			'PROMOTION_RECONHEAL',	'DOMAIN_LAND',	0,				1,				100);
**/
INSERT INTO UnitPromotions_UnitCombats
		(PromotionType,							UnitCombatType)
VALUES	('PROMOTION_SCREENED',					'UNITCOMBAT_ARCHER'),
		('PROMOTION_SCREENED',					'UNITCOMBAT_MOUNTED'),
		('PROMOTION_SCREENED',					'UNITCOMBAT_MELEE'),
		('PROMOTION_SCREENED',					'UNITCOMBAT_SIEGE'),
		('PROMOTION_SCREENED',					'UNITCOMBAT_GUN'),
		('PROMOTION_SCREENED',					'UNITCOMBAT_ARMOR'),
		('PROMOTION_SCREENED',					'UNITCOMBAT_RECON'),
		('PROMOTION_RECONHEAL',					'UNITCOMBAT_ARCHER'),
		('PROMOTION_RECONHEAL',					'UNITCOMBAT_MOUNTED'),
		('PROMOTION_RECONHEAL',					'UNITCOMBAT_MELEE'),
		('PROMOTION_RECONHEAL',					'UNITCOMBAT_SIEGE'),
		('PROMOTION_RECONHEAL',					'UNITCOMBAT_GUN'),
		('PROMOTION_RECONHEAL',					'UNITCOMBAT_ARMOR'),
		('PROMOTION_RECONHEAL',					'UNITCOMBAT_RECON'),
		('PROMOTION_SABOTAGED',					'UNITCOMBAT_ARCHER'),
		('PROMOTION_SABOTAGED',					'UNITCOMBAT_MOUNTED'),
		('PROMOTION_SABOTAGED',					'UNITCOMBAT_MELEE'),
		('PROMOTION_SABOTAGED',					'UNITCOMBAT_SIEGE'),
		('PROMOTION_SABOTAGED',					'UNITCOMBAT_GUN'),
		('PROMOTION_SABOTAGED',					'UNITCOMBAT_ARMOR'),
		('PROMOTION_SABOTAGED',					'UNITCOMBAT_RECON'),
		('PROMOTION_RECON_COMBAT',				'UNITCOMBAT_RECON'),
		('PROMOTION_SURV_FINISHER',				'UNITCOMBAT_RECON'),
		('PROMOTION_SURV_COMBAT',				'UNITCOMBAT_RECON'),
		('PROMOTION_TB_FINISHER',				'UNITCOMBAT_RECON'),
		('PROMOTION_CCDCONCEALED',				'UNITCOMBAT_RECON'),
		('PROMOTION_MEDIC_FINISHER',			'UNITCOMBAT_RECON'),
		('PROMOTION_SCOUTING_COMBAT',			'UNITCOMBAT_RECON'),
		('PROMOTION_MEDIC_COMBAT',				'UNITCOMBAT_RECON'),
		('PROMOTION_SCOUTING_FINISHER',			'UNITCOMBAT_RECON');

UPDATE UnitPromotions
SET PromotionPrereqOr2 = 'PROMOTION_SURVIVALISM_1', PromotionPrereqOr4 = 'PROMOTION_WOODLAND_TRAILBLAZER_1'
WHERE Type = 'PROMOTION_MEDIC';

UPDATE UnitPromotions
SET PromotionPrereqOr3 = 'PROMOTION_MEDIC_II', PromotionPrereqOr4 = 'PROMOTION_SCOUTING_2'
WHERE Type = 'PROMOTION_SCREENING';

UPDATE UnitPromotions
SET PromotionPrereqOr3 = 'PROMOTION_MEDIC_II', PromotionPrereqOr4 = 'PROMOTION_SCOUTING_2'
WHERE Type = 'PROMOTION_FROGMAN';

UPDATE Unit_FreePromotions
SET PromotionType = 'PROMOTION_SCOUTING_1'
WHERE UnitType = 'UNIT_BANDEIRANTES' AND PromotionType = 'PROMOTION_SURVIVALISM_3';

INSERT INTO Unit_AITypes	(UnitType,			UnitAIType)
SELECT						Type,				'UNITAI_FAST_ATTACK'
FROM Units WHERE CombatClass = 'UNITCOMBAT_RECON' AND Combat < (SELECT Combat FROM Units WHERE Type='UNIT_PARATROOPER') AND NOT Class='UNITCLASS_PARATROOPER';

UPDATE Units
SET RangeAttackOnlyInDomain = 1
WHERE CombatClass = 'UNITCOMBAT_RECON' AND Combat < (SELECT Combat FROM Units WHERE Type='UNIT_PARATROOPER') AND NOT Class='UNITCLASS_PARATROOPER';
/**
INSERT INTO UnitPromotions_Domains
		(PromotionType,				DomainType,		Attack,	Defense)
VALUES	('PROMOTION_CCDCONCEALED',	'DOMAIN_SEA',	-10,	0);
**/
INSERT INTO Language_en_US
        (Tag,													Text)
VALUES	('TXT_KEY_PROMOTION_RECON_COMBAT',						'[COLOR_WARNING_TEXT]Contact [ENDCOLOR][ICON_VP_VISION]'),
		('TXT_KEY_PROMOTION_RECON_COMBAT_HELP',					'Sight [ICON_VP_VISION] reduced to 1.[NEWLINE]-20% [ICON_WAR] Attack Strength against Cities & Units that are Fortified, at Full HP, or above 50% HP. Withdraws from 1st melee attack. Expires after 1 turn combat-free.'),
		/**('TXT_KEY_PROMOTION_RECON_COMBAT_HELP',					'-20% [ICON_WAR] Attack Strength against Cities & Units that are Fortified, at Full HP, or above 50% HP. Withdraws from 1st melee attack. Expires after 1 turn combat-free.'),
		**/
		('TXT_KEY_PEDIA_PROMOTION_RECON_COMBAT',				'Contact'),
		('TXT_KEY_PROMOTION_SCREENED',							'Screened'),
        ('TXT_KEY_PROMOTION_SCREENED_HELP',						'Local intel & supplies compromised![NEWLINE]Sight [ICON_VP_VISION] reduced to 1.[NEWLINE]-10% [ICON_STRENGTH] Combat Strength against Recon. Rough terrain [ICON_MOVES] [COLOR_NEGATIVE_TEXT]ends turn[ENDCOLOR]! Lost after combat.'),
        ('TXT_KEY_PEDIA_PROMOTION_SCREENED',					'Screened'),
		('TXT_KEY_PROMOTION_TB_FINISHER',						'Blaze'),
        ('TXT_KEY_PROMOTION_TB_FINISHER_HELP',					'+5% [ICON_WAR] Attack Strength. On attack, restricts enemy movement, sight and combat strength. Can move after kill.[NEWLINE]Blocks selection of Scout promotion.'),
        ('TXT_KEY_PEDIA_PROMOTION_TB_FINISHER',					'Blaze'),
		('TXT_KEY_PROMOTION_SURV_FINISHER',						'Survivalist'),
        ('TXT_KEY_PROMOTION_SURV_FINISHER_HELP',				'+5% [ICON_STRENGTH] Defense Strength. Withdraws from 1st melee attack. After combat: damages adjacent enemies, defense increases, heals on kill.[NEWLINE]Blocks selection of Scout promotion.'),
        ('TXT_KEY_PEDIA_PROMOTION_SURV_FINISHER',				'Survivalist'),
		('TXT_KEY_PROMOTION_SURV_COMBAT',						'Attrit'),
        ('TXT_KEY_PROMOTION_SURV_COMBAT_HELP',					'+10% [ICON_STRENGTH] Defense Strength. +5 HP on kill. Adjacent enemy effect: 5 damage. Lost after 1 turn combat-free.'),
        ('TXT_KEY_PEDIA_PROMOTION_SURV_COMBAT',					'Attrit'),
		('TXT_KEY_PROMOTION_CCDCONCEALED',						'[COLOR_PROJECT_TEXT]Concealed [ENDCOLOR][ICON_VIEW_CITY]'),
        ('TXT_KEY_PROMOTION_CCDCONCEALED_HELP',					'Strict camouflage, concealment and decoy discipline conceals the unit from rival detection.[NEWLINE]-10% [ICON_WAR] Attack Strength against Cities & Units that are Fortified, at Full HP, or above 50% HP. Ranged [ICON_RANGE_STRENGTH] Attack enabled. Lost after combat.'),
        ('TXT_KEY_PEDIA_PROMOTION_CCDCONCEALED',				'Concealed'),
		('TXT_KEY_PROMOTION_RECONHEAL',							'Resupplied'),
        ('TXT_KEY_PROMOTION_RECONHEAL_HELP',					'Acquired supplies from enemy unit. [COLOR_POSITIVE_TEXT]+5 Heal[ENDCOLOR]. Lost after combat or move.'),
        ('TXT_KEY_PEDIA_PROMOTION_RECONHEAL',					'Resupplied'),
		('TXT_KEY_PROMOTION_SABOTAGED',							'Interdicted'),
        ('TXT_KEY_PROMOTION_SABOTAGED_HELP',					'Enemy recon has compromised this position.[NEWLINE]-5% [ICON_STRENGTH] defense while fortified. [COLOR_NEGATIVE_TEXT]-5 Heal[ENDCOLOR] outside enemy territory. Lost after move or 1 turn combat-free.'),
        ('TXT_KEY_PEDIA_PROMOTION_SABOTAGED',					'Interdicted'),
		('TXT_KEY_PROMOTION_MEDIC_FINISHER',					'Interdiction'),
        ('TXT_KEY_PROMOTION_MEDIC_FINISHER_HELP',				'+5% [ICON_STRENGTH] strength while fortified & from adjacent friendly units. On attack, sabotages enemy healing, providing extra healing to any attacker temporarily. After combat, sap adjacent enemy [ICON_MOVES] Movement by 1.[NEWLINE]Blocks selection of Scout promotion.'),
        ('TXT_KEY_PEDIA_PROMOTION_MEDIC_FINISHER',				'Interdiction'),
		('TXT_KEY_PROMOTION_RECON_EMBARKED',					'[COLOR_WATER_TEXT]Exposed [ENDCOLOR][ICON_VP_VISION]'),
        ('TXT_KEY_PROMOTION_RECON_EMBARKED_HELP',				'Unit has not been in combat, but is not concealed due to terrain. -20% [ICON_WAR] Attack Strength against Cities & Units that are Fortified, at Full HP, or above 50% HP. Lost after combat.'),
        ('TXT_KEY_PEDIA_PROMOTION_RECON_EMBARKED',				'Exposed'),
		('TXT_KEY_PROMOTION_SCOUTING_COMBAT',					'Exfiltrate'),
        ('TXT_KEY_PROMOTION_SCOUTING_COMBAT_HELP',				'+5% [ICON_WAR] Attack Strength against fortified units. Half-cost pillage moves. +5 HP on pillage. Ignores enemy unit [COLOR_UNIT_TEXT]Zone of Control[ENDCOLOR]. Lost after 1 turn combat free.'),
        ('TXT_KEY_PEDIA_PROMOTION_SCOUTING_COMBAT',				'Exfiltrate'),
		('TXT_KEY_PROMOTION_MEDIC_COMBAT',						'Interdicting'),
        ('TXT_KEY_PROMOTION_MEDIC_COMBAT_HELP',					'+10% [ICON_STRENGTH] strength while fortified. On attack, sabotages enemy unit healing, providing extra healing to any attacker temporarily. Saps adjacent enemy movement by 1. Lost after 1 turn combat free.'),
        ('TXT_KEY_PEDIA_PROMOTION_MEDIC_COMBAT',				'Interdicting'),
		('TXT_KEY_PROMOTION_SCOUTING_FINISHER',					'Scout'),
        ('TXT_KEY_PROMOTION_SCOUTING_FINISHER_HELP',			'+5% [ICON_WAR] Attack Strength against fortified units. Half-cost pillage moves. +5 HP to adjacent units on pillage. After combat, ignores enemy unit [COLOR_UNIT_TEXT]Zone of Control[ENDCOLOR].[NEWLINE]Blocks selection of Blaze, Survivalist, Interdiction.'),
        ('TXT_KEY_PEDIA_PROMOTION_SCOUTING_FINISHER',			'Scout');

UPDATE UnitPromotions
SET FreePillageMoves = 0
WHERE Type = 'PROMOTION_SURVIVALISM_3';
/*
UPDATE Language_en_US
SET Text = REPLACE (Text, 'Pilum', 'Fortify')
WHERE Tag = 'TXT_KEY_MISC_YOU_UNIT_WAS_DAMAGED_AOE_STRIKE_FORTIFY';

UPDATE Language_en_US
SET Text = REPLACE (Text, 'Rend', 'Move')
WHERE Tag = 'TXT_KEY_MISC_YOU_UNIT_WAS_DAMAGED_AOE_STRIKE_ON_MOVE';
*/
UPDATE Language_en_US
SET Text = REPLACE (Text, 'Pillaging costs no [ICON_MOVES] Movement.', '')
WHERE Tag = 'TXT_KEY_PROMOTION_SURVIVALISM_3_HELP';

UPDATE Language_en_US
SET Text = Text||'[NEWLINE] Blocks selection of Trailblazer III, Medic II'
WHERE Tag = 'TXT_KEY_PROMOTION_SURVIVALISM_3_HELP';

UPDATE Language_en_US
SET Text = Text||' [COLOR_POSITIVE_TEXT]+1 HP[ENDCOLOR] from Fresh Water during non-combat turns.'
WHERE Tag = 'TXT_KEY_PROMOTION_SURVIVALISM_2_HELP';

UPDATE Language_en_US
SET Text = Text||' [COLOR_POSITIVE_TEXT]+1 HP[ENDCOLOR] from Rivers during non-combat turns.'
WHERE Tag = 'TXT_KEY_PROMOTION_SURVIVALISM_1_HELP';

UPDATE Language_en_US
SET Text = Text||' [COLOR_POSITIVE_TEXT]+1 HP[ENDCOLOR] from Marsh & Oasis during non-combat turns.'
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_2_HELP';

UPDATE Language_en_US
SET Text = Text||'[NEWLINE] Blocks selection of Survivalism III, Medic II'
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_3_HELP';

UPDATE Language_en_US
SET Text = Text||' [COLOR_POSITIVE_TEXT]+1 HP[ENDCOLOR] from Forest & Jungle during non-combat turns.'
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_1_HELP';

UPDATE Language_en_US
SET Text = Text||'[NEWLINE] Blocks selection of Survivalism III, Trailblazer III'
WHERE Tag = 'TXT_KEY_PROMOTION_MEDIC_II_HELP';

UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_RED_COMBAT';
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_RED_COMBAT_ENDED';
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_RED_TURN';
--UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_PLAYER_TURN';
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_CITY';
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_TILE_IMPROVEMENTS';
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_UNIT_UPGRADES';
