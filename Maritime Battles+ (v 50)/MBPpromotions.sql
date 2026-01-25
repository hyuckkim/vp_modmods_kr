/*----------------------------------------------------
-- Travel & Engagement Promos
----------------------------------------------------*/

INSERT INTO UnitPromotions
		(Type,							Description,							Help,										PortraitIndex,	IconAtlas,							Sound,				CannotBeChosen,	LostWithUpgrade,	HasPostCombatPromotions,	MovesChange,		PediaType,		PediaEntry,									PromotionDuration)
VALUES	('PROMOTION_DAMAGED_PROP',		'TXT_KEY_PROMOTION_DAMAGED_PROP',		'TXT_KEY_PROMOTION_DAMAGED_PROP_HELP',		4,				'KRIS_SWORDSMAN_PROMOTION_ATLAS',	'AS2D_IF_LEVELUP',	1,				0,					0,							-1,					'PEDIA_NAVAL',	'TXT_KEY_PEDIA_PROMOTION_DAMAGED_PROP',		0);

INSERT INTO Language_en_US 
		(Tag,										Text)
VALUES	('TXT_KEY_PROMOTION_DAMAGED_PROP',			'[COLOR_NEGATIVE_TEXT]Damaged Propulsion[ENDCOLOR]'),
		('TXT_KEY_PROMOTION_DAMAGED_PROP_HELP',		'Propulsion systems damaged, slowing unit. -1 [ICON_MOVES] [COLOR_NEGATIVE_TEXT]movement[ENDCOLOR] until health is [COLOR_POSITIVE_TEXT]above[ENDCOLOR] 50'),
		('TXT_KEY_PEDIA_PROMOTION_DAMAGED_PROP',	'Damaged Propulsion');

/*----------------------------------------------------
-- Ocean restriction promo
----------------------------------------------------*/
/* NO EFFECT IN VP 3.7
INSERT INTO UnitPromotions
		(Type,							Description,							Help,										PortraitIndex,	IconAtlas,			Sound,				CannotBeChosen,	LostWithUpgrade,	PediaType,		PediaEntry,									ShowInUnitPanel)
VALUES	('PROMOTION_NO_EARLY_OCEAN',	'TXT_KEY_PROMOTION_NO_EARLY_OCEAN',		'TXT_KEY_PROMOTION_NO_EARLY_OCEAN_HELP',	50,				'PROMOTION_ATLAS_VP_06',	'AS2D_IF_LEVELUP',	1,				1,					'PEDIA_SHARED',	'TXT_KEY_PEDIA_PROMOTION_NO_EARLY_OCEAN',	1);

INSERT INTO Language_en_US 
		(Tag,										Text)
VALUES	('TXT_KEY_PROMOTION_NO_EARLY_OCEAN',		'[COLOR_NEGATIVE_TEXT]Ocean Impassable before Astronomy[ENDCOLOR]'),
		('TXT_KEY_PROMOTION_NO_EARLY_OCEAN_HELP',	'Unit cannot enter ocean until the discovery of astronomy'),
		('TXT_KEY_PEDIA_PROMOTION_NO_EARLY_OCEAN',	'Ocean Impassable before Astronomy');

INSERT INTO UnitPromotions_Terrains
		(PromotionType,					TerrainType,		Impassable)		
VALUES	('PROMOTION_NO_EARLY_OCEAN',	'TERRAIN_OCEAN',	true);

INSERT INTO UnitPromotions_Features
        (PromotionType,					FeatureType,						Impassable)
VALUES	('PROMOTION_NO_EARLY_OCEAN',	'FEATURE_RESTRICTED_VISIBILITY',	true);*/

/*----------------------------------------------------
-- Coastal Fortress Range Promos
----------------------------------------------------

INSERT INTO UnitPromotions
		(Type,					Description,					Help,								PortraitIndex,	IconAtlas,			Sound,				CannotBeChosen,	LostWithUpgrade,	HasPostCombatPromotions,	RangeChange,		PediaType,		PediaEntry)
VALUES	('PROMOTION_TWCF1',		'TXT_KEY_PROMOTION_TWCF1',		'TXT_KEY_PROMOTION_TWCF1_HELP',		9,				'PROMOTION_ATLAS_VP_06',	'AS2D_IF_LEVELUP',	1,				0,					0,							1,					'PEDIA_NAVAL',	'TXT_KEY_PEDIA_PROMOTION_TWCF1'),
		('PROMOTION_TWCF2',		'TXT_KEY_PROMOTION_TWCF1',		'TXT_KEY_PROMOTION_TWCF1_HELP',		10,				'PROMOTION_ATLAS_VP_06',	'AS2D_IF_LEVELUP',	1,				0,					0,							2,					'PEDIA_NAVAL',	'TXT_KEY_PEDIA_PROMOTION_TWCF1');

INSERT INTO Language_en_US 
		(Tag,								Text)
VALUES	('TXT_KEY_PROMOTION_TWCF1',			'Coastal Fortress Ranged Attack'),
		('TXT_KEY_PROMOTION_TWCF1_HELP',	'Extra [COLOR_POSITIVE_TEXT]range[ENDCOLOR] from garrison in coastal fortress'),
		('TXT_KEY_PEDIA_PROMOTION_TWCF1',	'Coastal Fortress Ranged Attack');
*/
/*----------------------------------------------------
-- Great Lighthouse & TF: move bonus during peace, vision during combat
----------------------------------------------------

UPDATE UnitPromotions
SET HasPostCombatPromotions = 1, ExtraNavalMovement = 1, VisibilityChange = 0, MovesChange = 0, EmbarkDefenseModifier = 0 
WHERE Type = 'PROMOTION_GREAT_LIGHTHOUSE';

UPDATE UnitPromotions
SET HasPostCombatPromotions = 1, ExtraNavalMovement = 1, VisibilityChange = 0, AttackMod = 0, GoldenAgeValueFromKills = 1, EmbarkDefenseModifier = 0
WHERE Type = 'PROMOTION_TREASURE_FLEET';

INSERT INTO UnitPromotions
		(Type,									Description,									Help,												PortraitIndex,	IconAtlas,							Sound,				CannotBeChosen,	LostWithUpgrade,	HealOutsideFriendly,	HasPostCombatPromotions,	ExtraNavalMovement,	VisibilityChange,	MovesChange,	GoldenAgeValueFromKills,	PediaType,		PediaEntry,												PromotionDuration)
VALUES	('PROMOTION_GREAT_LIGHTHOUSE_VISION',	'TXT_KEY_PROMOTION_GREAT_LIGHTHOUSE_VISION',	'TXT_KEY_PROMOTION_GREAT_LIGHTHOUSE_VISION_HELP',	4,				'PROMOTION_ATLAS_VP_06',					'AS2D_IF_LEVELUP',	1,				0,					0,						0,							-1,					1,					0,				0,							'PEDIA_NAVAL',	'TXT_KEY_PEDIA_PROMOTION_GREAT_LIGHTHOUSE_VISION',		0),
		('PROMOTION_TREASURE_FLEET_VISION',		'TXT_KEY_PROMOTION_TREASURE_FLEET_VISION',		'TXT_KEY_PROMOTION_TREASURE_FLEET_VISION_HELP',		7,				'SMAN_EXOTIC_UNIT_PROMOTION_ATLAS',	'AS2D_IF_LEVELUP',	1,				0,					0,						0,							-1,					1,					0,				1,							'PEDIA_NAVAL',	'TXT_KEY_PEDIA_PROMOTION_TREASURE_FLEET_VISION',		0);
*/
INSERT INTO UnitPromotions_PostCombatRandomPromotion
		(PromotionType,							NewPromotion)
VALUES	('PROMOTION_SAFE_WATERS',				'PROMOTION_UNSAFE_WATERS'),
		('PROMOTION_UNSAFE_WATERS',				'PROMOTION_UNSAFE_WATERS'),
		('PROMOTION_SAFE_WATERS_NAVAL',			'PROMOTION_UNSAFE_WATERS_NAVAL'),
		('PROMOTION_UNSAFE_WATERS_NAVAL',		'PROMOTION_UNSAFE_WATERS_NAVAL');
/*
DELETE FROM UnitPromotions_UnitCombats
		WHERE PromotionType="PROMOTION_GREAT_LIGHTHOUSE";

INSERT INTO UnitPromotions_UnitCombats
		(PromotionType,							UnitCombatType)
VALUES	('PROMOTION_GREAT_LIGHTHOUSE',			'UNITCOMBAT_NAVALRANGED'),
		('PROMOTION_GREAT_LIGHTHOUSE',			'UNITCOMBAT_NAVALMELEE'),
		('PROMOTION_GREAT_LIGHTHOUSE_VISION',	'UNITCOMBAT_NAVALRANGED'),
		('PROMOTION_GREAT_LIGHTHOUSE_VISION',	'UNITCOMBAT_NAVALMELEE'),
		('PROMOTION_TREASURE_FLEET_VISION',		'UNITCOMBAT_NAVALRANGED'),
		('PROMOTION_TREASURE_FLEET_VISION',		'UNITCOMBAT_NAVALMELEE');

INSERT INTO Language_en_US 
		(Tag,												Text)
VALUES	('TXT_KEY_PROMOTION_GREAT_LIGHTHOUSE_VISION',		''),
		('TXT_KEY_PROMOTION_GREAT_LIGHTHOUSE_VISION_HELP',	'[COLOR_UNIT_TEXT]Great Vision[ENDCOLOR][NEWLINE][NEWLINE]+1 [COLOR_POSITIVE_TEXT]Visibility[ENDCOLOR] Range'),
		('TXT_KEY_PEDIA_PROMOTION_GREAT_LIGHTHOUSE_VISION',	'Great Lighthouse Vision'),
		('TXT_KEY_PROMOTION_TREASURE_FLEET_VISION',			''),
		('TXT_KEY_PROMOTION_TREASURE_FLEET_VISION_HELP',	'[COLOR_UNIT_TEXT]Fleet Vision[ENDCOLOR][NEWLINE][NEWLINE]+1 [COLOR_POSITIVE_TEXT]Visibility[ENDCOLOR]. +1 [ICON_GOLDEN_AGE] Golden Age point from kills.'),
		('TXT_KEY_PEDIA_PROMOTION_TREASURE_FLEET_VISION',	'Treasure Fleet Vision');

UPDATE Language_en_US
SET Text = 'May only be built collaboratively through the World Congress. Receive 1 [COLOR_POSITIVE_TEXT]Additional[ENDCOLOR] [ICON_INTERNATIONAL_TRADE] Trade Route. Grants all Naval Units except Submarines and Carriers the [COLOR_POSITIVE_TEXT]Treasure Fleet[ENDCOLOR] Promotion, which grants +1 Sight and +1 Golden-age point on kills temporarily after combat, or +1 [ICON_MOVES] Movement and the ability to heal [COLOR_POSITIVE_TEXT]Outside of Friendly Territory[ENDCOLOR] when out-of-combat.'
WHERE Tag = 'TXT_KEY_BUILDING_GRAND_CANAL_HELP';

UPDATE Language_en_US
SET Text = '+1 [ICON_MOVES] Naval Movement if out-of-combat for at least a turn, and +1 Sight temporarily during combat turns. +1 [ICON_GOLDEN_AGE] Golden Age Points from kills.'
WHERE Tag = 'TXT_KEY_PROMOTION_TREASURE_FLEET_HELP';
*/