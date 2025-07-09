-- text correction
UPDATE Language_en_US SET
Text = 'Gain 5 XP when [ICON_RAZING] Pillaging.'
WHERE Tag = 'TXT_KEY_PROMOTION_SCOUT_XP_PILLAGE_HELP';

-- organize the civilopedia better: mainline scout promos should be together 
UPDATE UnitPromotions SET
PediaType = 'PEDIA_SCOUTING'
WHERE Type IN ('PROMOTION_SURVIVALISM_1', 'PROMOTION_SURVIVALISM_2', 'PROMOTION_SURVIVALISM_3');

UPDATE UnitPromotions SET
PediaType = 'PEDIA_ATTRIBUTES'
WHERE Type = 'PROMOTION_IGNORE_TERRAIN_COSTS';

-- trailblazer line combat oriented
UPDATE Language_en_US SET
Text = '+10% [ICON_STRENGTH] Combat Strength [COLOR_POSITIVE_TEXT]Outside of Friendly Territory[ENDCOLOR].[NEWLINE]+25% [ICON_STRENGTH] Attack in Forest and Jungle.'
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_1_HELP';

UPDATE UnitPromotions SET VisibilityChange = 0, EmbarkExtraVisibility = 0, OutsideFriendlyLandsModifier = 10 WHERE Type = 'PROMOTION_WOODLAND_TRAILBLAZER_1';

UPDATE Language_en_US SET
Text = '+10% [ICON_STRENGTH] Combat Strength [COLOR_POSITIVE_TEXT]Outside of Friendly Territory[ENDCOLOR].[NEWLINE]+20% [ICON_STRENGTH] Defense in Desert and Tundra.'
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_2_HELP';

UPDATE UnitPromotions SET MovesChange = 0, ExtraNavalMovement = 0, River = 0, OutsideFriendlyLandsModifier = 10 WHERE Type = 'PROMOTION_WOODLAND_TRAILBLAZER_2';

UPDATE Language_en_US SET
Text = '+1 [ICON_MOVES] Movement.[NEWLINE]Can move after attacking.[NEWLINE]Ignore [COLOR_POSITIVE_TEXT]Zone of Control[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_3_HELP';

UPDATE UnitPromotions
SET
	OutsideFriendlyLandsModifier = 0,
	AllowsEmbarkation = 0,
	CanCrossMountains = 0,
	EnemyRoute = 0,
	CanMoveAfterAttacking = 1,
	MovesChange = 1
	--, IgnoreZOC = 1
WHERE Type = 'PROMOTION_WOODLAND_TRAILBLAZER_3';

DELETE FROM UnitPromotions_Features WHERE PromotionType IN ('PROMOTION_WOODLAND_TRAILBLAZER_1', 'PROMOTION_WOODLAND_TRAILBLAZER_2');

INSERT INTO UnitPromotions_Features
	(PromotionType, FeatureType, Attack)
VALUES
	('PROMOTION_WOODLAND_TRAILBLAZER_1', 'FEATURE_JUNGLE', 25),
	('PROMOTION_WOODLAND_TRAILBLAZER_1', 'FEATURE_FOREST', 25);

DELETE FROM UnitPromotions_Terrains WHERE PromotionType IN ('PROMOTION_WOODLAND_TRAILBLAZER_1', 'PROMOTION_WOODLAND_TRAILBLAZER_2');

INSERT INTO UnitPromotions_Terrains
	(PromotionType, TerrainType, Defense)
VALUES
	('PROMOTION_WOODLAND_TRAILBLAZER_2', 'TERRAIN_DESERT', 20),
	('PROMOTION_WOODLAND_TRAILBLAZER_2', 'TERRAIN_TUNDRA', 20);

-- now niche promos
-- messes with civilopedia if promo has same name as unit!
UPDATE Language_en_US SET
Text = 'Tactical Retreat'
WHERE Tag = 'TXT_KEY_PROMOTION_COMMANDO';

UPDATE UnitPromotions SET
CannotBeChosen = 0,
LostWithUpgrade = 0,
TechPrereq = 'TECH_RAILROAD',
PediaType = 'PEDIA_SCOUTING',
PromotionPrereqOr1 = 'PROMOTION_SURVIVALISM_3', 
PromotionPrereqOr2 = 'PROMOTION_WOODLAND_TRAILBLAZER_3'
WHERE Type = 'PROMOTION_COMMANDO';

DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_COMMANDO' AND PromotionType = 'PROMOTION_COMMANDO';
-- but Klepht keeps it
UPDATE Language_en_US SET
Text = 'Industrial-era exploration Unit. Has additional strength when Attacking. Gains Experience from pillaging non-road Improvements.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_COMMANDO_CBP';

UPDATE Language_en_US SET
Text = '[COLOR_POSITIVE_TEXT]Withdraw from Melee Attack[ENDCOLOR] if there is an open tile behind this Unit, once per turn.'
WHERE Tag = 'TXT_KEY_PROMOTION_COMMANDO_HELP';

-- make some existing branch promos available
INSERT INTO UnitPromotions_UnitCombats
	(PromotionType, UnitCombatType)
VALUES
	--('PROMOTION_COMMANDO', 'UNITCOMBAT_RECON'),
	--('PROMOTION_AMPHIBIOUS', 'UNITCOMBAT_RECON'),
	('PROMOTION_AMBUSH_1', 'UNITCOMBAT_RECON'),
	('PROMOTION_AMBUSH_2', 'UNITCOMBAT_RECON');

UPDATE UnitPromotions SET 
PromotionPrereqOr3 = 'PROMOTION_SURVIVALISM_2', PromotionPrereqOr4 = 'PROMOTION_WOODLAND_TRAILBLAZER_1',
PediaType = 'PEDIA_SHARED', TechPrereq = 'TECH_OPTICS'
WHERE Type = 'PROMOTION_AMPHIBIOUS';

UPDATE UnitPromotions SET PromotionPrereqOr4 = 'PROMOTION_SURVIVALISM_2', PromotionPrereqOr5 = 'PROMOTION_WOODLAND_TRAILBLAZER_2',
PediaType = 'PEDIA_SHARED'
WHERE Type = 'PROMOTION_AMBUSH_1';

UPDATE UnitPromotions SET 
PediaType = 'PEDIA_SHARED'
WHERE Type = 'PROMOTION_AMBUSH_2';

-- balance altitude training and make it available
-- in new promotions there is an upgrade to this
DELETE FROM UnitPromotions_Terrains WHERE PromotionType = 'PROMOTION_ALTITUDE_TRAINING';

UPDATE UnitPromotions SET 
HillsDoubleMove = 0,
HillsAttack = 20,
CanCrossMountains = 1,
PromotionPrereqOr1 = 'PROMOTION_SURVIVALISM_1', 
PromotionPrereqOr2 = 'PROMOTION_WOODLAND_TRAILBLAZER_2',
PediaType = 'PEDIA_SCOUTING',
RankList = 'ALPINE',
RankNumber = 1,
CannotBeChosen = 0
WHERE Type = 'PROMOTION_ALTITUDE_TRAINING';

UPDATE Language_en_US SET
Text = '+20% [ICON_STRENGTH] Attack in [COLOR_POSITIVE_TEXT]Hills[ENDCOLOR].[NEWLINE]Can cross [COLOR_POSITIVE_TEXT]Mountains[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_PROMOTION_ALTITUDE_TRAINING_HELP';

-- make frogman the upgrade to amphibious
UPDATE UnitPromotions SET 
PromotionPrereqOr1 = 'PROMOTION_AMPHIBIOUS', 
PromotionPrereqOr2 = NULL,
Amphib = 0,
ExtraNavalMovement = 1,
RankList = 'AMPHIB',
RankNumber = 2
WHERE Type = 'PROMOTION_FROGMAN';

UPDATE UnitPromotions SET
RankList = 'AMPHIB',
RankNumber = 1
WHERE Type = 'PROMOTION_AMPHIBIOUS';

UPDATE Language_en_US SET
Text = '+1 [ICON_MOVES] Embarked Movement.[NEWLINE]Embarking and Disembarking cost only 1 [ICON_MOVES] Movement.[NEWLINE]+50% [ICON_STRENGTH] Defense when Embarked.'
WHERE Tag = 'TXT_KEY_PROMOTION_FROGMAN_HELP';

-- make coup de grace available
UPDATE UnitPromotions SET
PromotionPrereqOr2 = 'PROMOTION_ASSASSIN_2'
WHERE Type = 'PROMOTION_SKIRMISHER_POWER';

-- make infiltrators available
UPDATE UnitPromotions SET
PromotionPrereqOr4 = 'PROMOTION_ASSASSIN_2'
WHERE Type = 'PROMOTION_ACCURACY_4';

