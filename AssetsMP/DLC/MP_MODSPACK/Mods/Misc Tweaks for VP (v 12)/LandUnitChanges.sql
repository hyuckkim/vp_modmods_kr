----------------------------------------------------
-- Earlier Pikeman
----------------------------------------------------
UPDATE Units
SET
	PrereqTech = 'TECH_METAL_CASTING',
	Cost = 110,
	FaithCost = 250
WHERE Class = 'UNITCLASS_PIKEMAN';

UPDATE Units SET Combat = 20 WHERE Type = 'UNIT_FCOMPANY';

UPDATE Language_en_US
SET Text = 'The {TXT_KEY_UNIT_DANISH_BERSERKER} is the Danish unique unit, replacing the {TXT_KEY_UNIT_PIKEMAN}. It can cross rivers and attack while embarked with no penalty, and has a [ICON_STRENGTH] Combat Strength bonus against wounded units. It is also faster, allowing it to catch up to wounded units to deal the final strike.'
WHERE Tag = 'TXT_KEY_CIV5_DENMARK_BERSERKER_STRATEGY';

----------------------------------------------------
-- Alternate Composite Bowman unlock
----------------------------------------------------
UPDATE Units SET PrereqTech = 'TECH_ENGINEERING' WHERE Class = 'UNITCLASS_COMPOSITE_BOWMAN' AND PrereqTech = 'TECH_CURRENCY';

----------------------------------------------------
-- Altitude Training nerf
----------------------------------------------------
UPDATE UnitPromotions SET HillsDoubleMove = 0 WHERE Type = 'PROMOTION_ALTITUDE_TRAINING';

UPDATE Language_en_US
SET Text = '+10% [ICON_STRENGTH] Combat Strength when defending in or attacking a Unit in [COLOR_POSITIVE_TEXT]Hill[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_PROMOTION_ALTITUDE_TRAINING_HELP';

----------------------------------------------------
-- Good recon promotions
----------------------------------------------------
INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
SELECT
	Type, 'PROMOTION_IGNORE_TERRAIN_COST'
FROM Units
WHERE CombatClass = 'UNITCOMBAT_RECON';

UPDATE Units SET Moves = 2 WHERE CombatClass = 'UNITCOMBAT_RECON';
UPDATE Units SET Moves = 3 WHERE Class IN ('UNITCLASS_EXPLORER', 'UNITCLASS_COMMANDO');

INSERT INTO UnitPromotions_UnitCombats
	(PromotionType, UnitCombatType)
VALUES
	('PROMOTION_SCOUTING_3', 'UNITCOMBAT_RECON');

UPDATE UnitPromotions
SET
	VisibilityChange = 0,
	EmbarkExtraVisibility = 0,
	OutsideFriendlyLandsModifier = 10
WHERE Type = 'PROMOTION_WOODLAND_TRAILBLAZER_1';

UPDATE UnitPromotions
SET
	MovesChange = 0,
	ExtraNavalMovement = 0,
	River = 0,
	OutsideFriendlyLandsModifier = 10,
	IgnoreZOC = 1
WHERE Type = 'PROMOTION_WOODLAND_TRAILBLAZER_2';

UPDATE UnitPromotions
SET
	OutsideFriendlyLandsModifier = 10,
	IgnoreZOC = 0
WHERE Type = 'PROMOTION_WOODLAND_TRAILBLAZER_3';

UPDATE UnitPromotions
SET
	EmbarkDefenseModifier = 0,
	River = 1
WHERE Type = 'PROMOTION_FROGMAN';

UPDATE UnitPromotions
SET
	OutsideFriendlyLandsModifier = 10,
	IgnoreZOC = 0
WHERE Type = 'PROMOTION_SCOUTING_1';

UPDATE UnitPromotions
SET
	MovesChange = 0,
	ExtraNavalMovement = 0,
	VisibilityChange = 1,
	EmbarkExtraVisibility = 1,
	PortraitIndex = 37
WHERE Type = 'PROMOTION_SCOUTING_2';

UPDATE UnitPromotions
SET
	ExtraNavalMovement = 1,
	RankList = 'SCOUTING',
	RankNumber = 3,
	PortraitIndex = 33,
	OrderPriority = 301,
	CannotBeChosen = 0
WHERE Type = 'PROMOTION_SCOUTING_3';

INSERT INTO UnitPromotions_Features
	(PromotionType, FeatureType, DoubleMove)
VALUES
	('PROMOTION_WOODLAND_TRAILBLAZER_1', 'FEATURE_JUNGLE', 1),
	('PROMOTION_WOODLAND_TRAILBLAZER_1', 'FEATURE_FOREST', 1);

INSERT INTO UnitPromotions_Terrains
	(PromotionType, TerrainType, DoubleMove)
VALUES
	('PROMOTION_WOODLAND_TRAILBLAZER_2', 'TERRAIN_DESERT', 1),
	('PROMOTION_WOODLAND_TRAILBLAZER_2', 'TERRAIN_SNOW', 1);

UPDATE Language_en_US
SET Text = '+10% [ICON_STRENGTH] Combat Strength [COLOR_POSITIVE_TEXT]Outside of Friendly Territory[ENDCOLOR].[NEWLINE]Double [ICON_MOVES] Movement in [COLOR_POSITIVE_TEXT]Forest[ENDCOLOR] and [COLOR_POSITIVE_TEXT]Jungle[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_1_HELP';

UPDATE Language_en_US
SET Text = '+10% [ICON_STRENGTH] Combat Strength [COLOR_POSITIVE_TEXT]Outside of Friendly Territory[ENDCOLOR].[NEWLINE]Double [ICON_MOVES] Movement in [COLOR_POSITIVE_TEXT]Desert[ENDCOLOR] and [COLOR_POSITIVE_TEXT]Snow[ENDCOLOR].[NEWLINE]Ignore [COLOR_POSITIVE_TEXT]Zone of Control[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_2_HELP';

UPDATE Language_en_US
SET Text = '+10% [ICON_STRENGTH] Combat Strength [COLOR_POSITIVE_TEXT]Outside of Friendly Territory[ENDCOLOR].[NEWLINE]Can Embark, cross Mountains, and use Enemy Roads/Railroads.'
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_3_HELP';

UPDATE Language_en_US
SET Text = 'Eliminate combat penalties for attacking from the sea or over a river.[NEWLINE]Embarking and Disembarking cost only 1 [ICON_MOVES] Movement.'
WHERE Tag = 'TXT_KEY_PROMOTION_FROGMAN_HELP';

UPDATE Language_en_US
SET Text = '+1 [ICON_VP_VISION] Sight and Embarked Sight.'
WHERE Tag = 'TXT_KEY_PROMOTION_SCOUTING_2_HELP';

UPDATE Language_en_US
SET Text = '+1 [ICON_MOVES] Movement and Embarked Movement.'
WHERE Tag = 'TXT_KEY_PROMOTION_SCOUTING_3_HELP';