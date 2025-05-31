----------------------------------------------------
-- Enlightenment Era (Vox Populi)
-- UNIT PROMOTIONS
-- 2018-02-01 Reworked by Infixo from EE & VP-EE mods
----------------------------------------------------

----------------------------------------------------
-- Generic info
----------------------------------------------------

INSERT INTO UnitPromotions (Type, PediaType, IconAtlas, PortraitIndex, Sound) VALUES
('PROMOTION_2HANDER',        'PEDIA_MELEE',      'vpee_promoAtlas', 00,'AS2D_IF_LEVELUP'),
('PROMOTION_CBOEE_SKIRMISH', 'PEDIA_ATTRIBUTES', 'vpee_promoAtlas', 05,'AS2D_IF_LEVELUP'),
('PROMOTION_EE_FIRST_RATE',  'PEDIA_NAVAL',      'vpee_promoAtlas', 04,'AS2D_IF_LEVELUP'),
('PROMOTION_EE_DRYDOCK',     'PEDIA_NAVAL',      'vpee_promoAtlas', 06, NULL),
('PROMOTION_EE_ADVENTURER',  'PEDIA_SCOUTING',   'vpee_promoAtlas', 01, NULL),
('PROMOTION_EE_FASIL_GHEBBI','PEDIA_SHARED',     'vpee_promoAtlas', 02, NULL);

UPDATE UnitPromotions
SET Description = 'TXT_KEY_'||Type, Help = 'TXT_KEY_'||Type||'_HELP', PediaEntry = 'TXT_KEY_'||Type, CannotBeChosen = 1
WHERE Type IN (
'PROMOTION_2HANDER',
'PROMOTION_CBOEE_SKIRMISH',
'PROMOTION_EE_FIRST_RATE',
'PROMOTION_EE_DRYDOCK',
'PROMOTION_EE_ADVENTURER',
'PROMOTION_EE_FASIL_GHEBBI');

----------------------------------------------------
-- Promotions' unique features
----------------------------------------------------

UPDATE UnitPromotions SET CombatPercent = 5, FriendlyHealChange = 5, MovesChange = 1, PromotionDuration = 1 WHERE Type = 'PROMOTION_EE_DRYDOCK';
UPDATE UnitPromotions SET ExtraNavalMovement = 1, EmbarkExtraVisibility = 2 WHERE Type = 'PROMOTION_EE_ADVENTURER';
UPDATE UnitPromotions SET CombatPercent = 25 WHERE Type = 'PROMOTION_EE_FASIL_GHEBBI';

UPDATE UnitPromotions SET LostWithUpgrade = 1, HillsDoubleMove = 1 WHERE Type = 'PROMOTION_CBOEE_SKIRMISH';
INSERT INTO UnitPromotions_Features(PromotionType, FeatureType, DoubleMove) VALUES
('PROMOTION_CBOEE_SKIRMISH', 'FEATURE_FOREST', 1),
('PROMOTION_CBOEE_SKIRMISH', 'FEATURE_JUNGLE', 1);

UPDATE UnitPromotions SET LostWithUpgrade = 1 WHERE Type = 'PROMOTION_2HANDER';
INSERT INTO UnitPromotions_UnitClasses (PromotionType, UnitClassType, Attack) VALUES
('PROMOTION_2HANDER', 'UNITCLASS_PIKEMAN', 33),
('PROMOTION_2HANDER', 'UNITCLASS_SPEARMAN', 33),
('PROMOTION_2HANDER', 'UNITCLASS_LANDSKNECHT', 33),
('PROMOTION_2HANDER', 'UNITCLASS_TERCIO', 33);

UPDATE UnitPromotions SET IsNearbyPromotion = 1, NearbyRange = 1, GiveDomain = 'DOMAIN_SEA', GiveDefenseMod = 20 WHERE Type = 'PROMOTION_EE_FIRST_RATE'; -- note that the nearby promotion logic requires CORE_AREA_EFFECT_PROMOTIONS in CustomModOptions

----------------------------------------------------
-- Eligible combats
----------------------------------------------------

INSERT INTO UnitPromotions_UnitCombats (PromotionType, UnitCombatType) VALUES
-- domain sea
('PROMOTION_EE_DRYDOCK','UNITCOMBAT_NAVALRANGED'),
('PROMOTION_EE_DRYDOCK','UNITCOMBAT_NAVALMELEE'),
('PROMOTION_EE_DRYDOCK','UNITCOMBAT_SUBMARINE'),
('PROMOTION_EE_DRYDOCK','UNITCOMBAT_CARRIER'),
-- all except planes
('PROMOTION_EE_FASIL_GHEBBI','UNITCOMBAT_RECON'),
('PROMOTION_EE_FASIL_GHEBBI','UNITCOMBAT_ARCHER'),
('PROMOTION_EE_FASIL_GHEBBI','UNITCOMBAT_MOUNTED'),
('PROMOTION_EE_FASIL_GHEBBI','UNITCOMBAT_MELEE'),
('PROMOTION_EE_FASIL_GHEBBI','UNITCOMBAT_SIEGE'),
('PROMOTION_EE_FASIL_GHEBBI','UNITCOMBAT_GUN'),
('PROMOTION_EE_FASIL_GHEBBI','UNITCOMBAT_ARMOR'),
('PROMOTION_EE_FASIL_GHEBBI','UNITCOMBAT_HELICOPTER'),
('PROMOTION_EE_FASIL_GHEBBI','UNITCOMBAT_NAVALRANGED'),
('PROMOTION_EE_FASIL_GHEBBI','UNITCOMBAT_NAVALMELEE'),
('PROMOTION_EE_FASIL_GHEBBI','UNITCOMBAT_SUBMARINE'),
('PROMOTION_EE_FASIL_GHEBBI','UNITCOMBAT_CARRIER');

----------------------------------------------------
-- Text (en_US)
----------------------------------------------------

INSERT INTO Language_en_US (Tag, Text) VALUES
-- Two Hander
('TXT_KEY_PROMOTION_2HANDER', 'Two Hander'),
('TXT_KEY_PROMOTION_2HANDER_HELP', '+33% [ICON_STRENGTH] Attack vs Spearman, Pikeman, Tercio and Landsknecht. [COLOR_NEGATIVE_TEXT]Lost with upgrade[ENDCOLOR].'),
-- Light Skirmish
('TXT_KEY_PROMOTION_CBOEE_SKIRMISH', 'Light Skirmish'),
('TXT_KEY_PROMOTION_CBOEE_SKIRMISH_HELP', 'Double Movement on Hills and in Forest/Jungle. [COLOR_NEGATIVE_TEXT]Lost with upgrade[ENDCOLOR].'),
-- Fasil Ghebbi Aura
('TXT_KEY_PROMOTION_EE_FASIL_GHEBBI', 'Fasil Ghebbi Aura'),
('TXT_KEY_PROMOTION_EE_FASIL_GHEBBI_HELP', '+25% [ICON_STRENGTH] Combat Strength when in 3-tile range of [COLOR_CYAN]Fasil Ghebbi[ENDCOLOR].'),
-- Flagship
('TXT_KEY_PROMOTION_EE_FIRST_RATE', 'Flagship'),
('TXT_KEY_PROMOTION_EE_FIRST_RATE_HELP', 'Naval Units beginning [COLOR_POSITIVE_TEXT]adjacent[ENDCOLOR] to a unit with this promotion have +20% [ICON_STRENGTH] Defense.'),
-- Adventurer
('TXT_KEY_PROMOTION_EE_ADVENTURER', 'Adventurer'),
('TXT_KEY_PROMOTION_EE_ADVENTURER_HELP', '+1 [ICON_MOVES] Movement Point and +2 Sight while embarked.'),
-- Drydock
('TXT_KEY_PROMOTION_EE_DRYDOCK', 'Drydock'),
('TXT_KEY_PROMOTION_EE_DRYDOCK_HELP', '+1 [ICON_MOVES] Movement Point, +5% [ICON_STRENGTH] Combat Strength, and Heal +5 HP per turn [COLOR_POSITIVE_TEXT]Inside of Friendly Territory.[NEWLINE][COLOR_NEGATIVE_TEXT]Promotion last 1 turn.[ENDCOLOR]');
