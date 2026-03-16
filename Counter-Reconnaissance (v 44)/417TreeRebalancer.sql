--surv1
UPDATE UnitPromotions
SET EnemyHealChange = 0, NeutralHealChange = 0, DefenseMod = 0, RangedDefenseMod = 0, RoughFromMod = 0, OpenDefense = 10
WHERE Type='PROMOTION_SURVIVALISM_1';
/*
INSERT INTO UnitPromotions_Features
		(PromotionType,				FeatureType,		Defense)
VALUES	('PROMOTION_SURVIVALISM_1',	'FEATURE_FOREST',	10),
		('PROMOTION_SURVIVALISM_1',	'FEATURE_JUNGLE',	10);

INSERT INTO UnitPromotions_Terrains
		(PromotionType,				TerrainType,		Defense)
VALUES	('PROMOTION_SURVIVALISM_1',	'TERRAIN_HILL',		10);
*/
UPDATE Language_en_US
SET Text = REPLACE (Text, '+25% [ICON_STRENGTH] Combat Strength when defending.[NEWLINE]+5 HP when Healing [COLOR_POSITIVE_TEXT]Outside of Friendly Territory[ENDCOLOR].', '+10% [ICON_STRENGTH] Defence in [COLOR_POSITIVE_TEXT]Open[ENDCOLOR] terrain.')
WHERE Tag = 'TXT_KEY_PROMOTION_SURVIVALISM_1_HELP';

--surv2
UPDATE UnitPromotions
SET EnemyHealChange = 0, NeutralHealChange = 0, OpenDefense = 0, DefenseMod = 0, RangedDefenseMod = 10, HPHealedIfDestroyEnemy = 0, StrongerDamaged = 0, NearbyImprovementCombatBonus = 0, NearbyImprovementBonusRange = 0, IsNearbyPromotion = 0, NearbyRange = 3, NearbyFriendlyCityCombatMod = 10
WHERE Type='PROMOTION_SURVIVALISM_2';

UPDATE Language_en_US
SET Text = REPLACE (Text, '+25% [ICON_STRENGTH] Combat Strength when defending.[NEWLINE]+5 HP when Healing [COLOR_POSITIVE_TEXT]Outside of Friendly Territory[ENDCOLOR].', '+10% [ICON_STRENGTH] Defense against [COLOR_POSITIVE_TEXT]Ranged[ENDCOLOR] Attacks. +10% [ICON_STRENGTH] Combat Strength within 3 plots of a [COLOR_POSITIVE_TEXT]Friendly City[ENDCOLOR].')
WHERE Tag = 'TXT_KEY_PROMOTION_SURVIVALISM_2_HELP';

--surv3
UPDATE UnitPromotions
SET EmbarkExtraVisibility = 1, VisibilityChange = 1, AlwaysHeal = 1, NoAdjacentUnitMod = 10, StrongerDamaged = 0
WHERE Type='PROMOTION_SURVIVALISM_3';

UPDATE Language_en_US
SET Text = '+1 [ICON_VP_VISION] Sight.[NEWLINE]+10% [ICON_STRENGTH] Combat Strength if not adjacent to any friendly unit. '||Text
WHERE Tag = 'TXT_KEY_PROMOTION_SURVIVALISM_3_HELP';

--tb1
UPDATE UnitPromotions
SET EmbarkExtraVisibility = 0, VisibilityChange = 0, AttackWoundedMod = 0
WHERE Type='PROMOTION_WOODLAND_TRAILBLAZER_1';

UPDATE UnitPromotions_Features
SET Attack = 10
WHERE PromotionType = 'PROMOTION_WOODLAND_TRAILBLAZER_1';

UPDATE UnitPromotions_Terrains
SET Attack = 10
WHERE PromotionType = 'PROMOTION_WOODLAND_TRAILBLAZER_1';

UPDATE Language_en_US
SET Text = REPLACE (Text, '+1 [ICON_VP_VISION] Sight and Embarked Sight.[NEWLINE]', ' +10% [ICON_WAR] Attack Strength in [COLOR_POSITIVE_TEXT]Forest[ENDCOLOR], [COLOR_POSITIVE_TEXT]Jungle[ENDCOLOR], and [COLOR_POSITIVE_TEXT]Hill[ENDCOLOR]. ')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_1_HELP';

--tb2
UPDATE UnitPromotions
SET RoughFromMod = 10, AttackBelowEqual50HealthMod = 0, NearbyImprovementCombatBonus = 0, NearbyImprovementBonusRange = 0, NearbyRange = 0, NearbyEnemyCityCombatMod = 0, IsNearbyPromotion = 0, DamageReductionCityAssault = 10
WHERE Type='PROMOTION_WOODLAND_TRAILBLAZER_2';
/**
UPDATE UnitPromotions_Features
SET Attack = 10
WHERE PromotionType = 'PROMOTION_WOODLAND_TRAILBLAZER_2';

INSERT INTO UnitPromotions_Features
		(PromotionType,							FeatureType,		Attack)
VALUES	('PROMOTION_WOODLAND_TRAILBLAZER_2',	'FEATURE_OASIS',	10);
**/
UPDATE Language_en_US
SET Text = '+10% [ICON_STRENGTH] Combat Strength from [COLOR_POSITIVE_TEXT]Rough terrain[ENDCOLOR]. -10% Damage from Cities. '||Text
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_2_HELP';

--tb3
UPDATE UnitPromotions
SET EmbarkExtraVisibility = 1, VisibilityChange = 1, AttackBelowEqual50HealthMod = 0, OutsideFriendlyLandsModifier = 0, NoAdjacentUnitMod = 0, AllowsEmbarkation = 0, CanCrossMountains = 0
WHERE Type='PROMOTION_WOODLAND_TRAILBLAZER_3';

INSERT INTO UnitPromotions_Features
		(PromotionType,							FeatureType,		DoubleHeal)
VALUES	('PROMOTION_WOODLAND_TRAILBLAZER_3',	'FEATURE_FOREST',	1),
		('PROMOTION_WOODLAND_TRAILBLAZER_3',	'FEATURE_JUNGLE',	1),
		('PROMOTION_WOODLAND_TRAILBLAZER_3',	'FEATURE_OASIS',	1),
		('PROMOTION_WOODLAND_TRAILBLAZER_3',	'FEATURE_MARSH',	1);

INSERT INTO UnitPromotions_CombatModPerAdjacentUnitCombat
		(PromotionType,							UnitCombatType,		Modifier)
VALUES	('PROMOTION_WOODLAND_TRAILBLAZER_3',	'UNITCOMBAT_RECON',	10);

UPDATE Language_en_US
SET Text = REPLACE (Text, '+20% [ICON_STRENGTH] Combat Strength [COLOR_POSITIVE_TEXT]Outside of Friendly Territory[ENDCOLOR].[NEWLINE]', '+1 [ICON_VP_VISION] Sight.[NEWLINE]+10% [ICON_STRENGTH] Combat Strength per [COLOR_POSITIVE_TEXT]adjacent[ENDCOLOR] recon. Double Heal in [COLOR_POSITIVE_TEXT]Forest, Jungle, Marsh, Oasis[ENDCOLOR].')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_3_HELP';

UPDATE Language_en_US
SET Text = REPLACE (Text, ' Embark, cross Mountains,', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_3_HELP';

UPDATE Language_en_US
SET Text = REPLACE (Text, 'Can Embark, cross Mountains.', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_3_HELP';

UPDATE Language_en_US
SET Text = REPLACE (Text, 'Can Embark and cross Mountains.', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_3_HELP';

UPDATE Language_en_US
SET Text = REPLACE (Text, 'Can cross Mountains.', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_3_HELP';

UPDATE Language_en_US
SET Text = REPLACE (Text, ' cross Mountains,', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_3_HELP';

UPDATE Language_en_US
SET Text = REPLACE (Text, 'Can Embark.', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_3_HELP';

UPDATE Language_en_US
SET Text = REPLACE (Text, ' Embark,', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_3_HELP';

--scouting1
UPDATE UnitPromotions
SET PortraitIndex = 34, IconAtlas = 'promoVP_atlas_01', EmbarkExtraVisibility = 0, VisibilityChange = 0, AlwaysHeal = 0, AllowsEmbarkation = 1, CanCrossMountains = 1, AttackBelowEqual50HealthMod = 10
WHERE Type='PROMOTION_SCOUTING_1';

UPDATE Language_en_US
SET Text = REPLACE (Text, '+1 [ICON_VP_VISION] Sight and Embarked Sight.', '+10% [ICON_WAR] Attack Strength against units under half HP. Can Embark and cross Mountains.')
WHERE Tag = 'TXT_KEY_PROMOTION_SCOUTING_1_HELP';

--scouting2
UPDATE UnitPromotions
SET IgnoreZOC = 0
WHERE Type = 'PROMOTION_SURVIVALISM_1';

UPDATE Language_en_US
SET Text = REPLACE (Text, '[NEWLINE]Ignore [COLOR_POSITIVE_TEXT]Zone of Control[ENDCOLOR].', '')
WHERE Tag = 'TXT_KEY_PROMOTION_SURVIVALISM_1_HELP';

UPDATE UnitPromotions
SET IgnoreZOC = 0
WHERE Type = 'PROMOTION_SURVIVALISM_2';

UPDATE Language_en_US
SET Text = REPLACE (Text, '[NEWLINE]Ignore [COLOR_POSITIVE_TEXT]Zone of Control[ENDCOLOR].', '')
WHERE Tag = 'TXT_KEY_PROMOTION_SURVIVALISM_2_HELP';

UPDATE UnitPromotions
SET IgnoreZOC = 0
WHERE Type = 'PROMOTION_SURVIVALISM_3';

UPDATE Language_en_US
SET Text = REPLACE (Text, '[NEWLINE]Ignore [COLOR_POSITIVE_TEXT]Zone of Control[ENDCOLOR].', '')
WHERE Tag = 'TXT_KEY_PROMOTION_SURVIVALISM_3_HELP';

UPDATE UnitPromotions
SET IgnoreZOC = 0
WHERE Type = 'PROMOTION_WOODLAND_TRAILBLAZER_1';

UPDATE Language_en_US
SET Text = REPLACE (Text, '[NEWLINE]Ignore [COLOR_POSITIVE_TEXT]Zone of Control[ENDCOLOR].', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_1_HELP';

UPDATE UnitPromotions
SET IgnoreZOC = 0
WHERE Type = 'PROMOTION_WOODLAND_TRAILBLAZER_2';

UPDATE Language_en_US
SET Text = REPLACE (Text, '[NEWLINE]Ignore [COLOR_POSITIVE_TEXT]Zone of Control[ENDCOLOR].', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_2_HELP';

UPDATE UnitPromotions
SET IgnoreZOC = 0
WHERE Type = 'PROMOTION_WOODLAND_TRAILBLAZER_3';

UPDATE Language_en_US
SET Text = REPLACE (Text, '[NEWLINE]Ignore [COLOR_POSITIVE_TEXT]Zone of Control[ENDCOLOR].', '')
WHERE Tag = 'TXT_KEY_PROMOTION_WOODLAND_TRAILBLAZER_3_HELP';

UPDATE UnitPromotions
SET IgnoreZOC = 0, AttackWoundedMod = 10
WHERE Type = 'PROMOTION_SCOUTING_2';

UPDATE Language_en_US
SET Text = Text||' +10% [ICON_WAR] Attack Strength against wounded units.'
WHERE Tag = 'TXT_KEY_PROMOTION_SCOUTING_2_HELP';