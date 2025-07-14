----------------------------------------------------
-- Enlightenment Era (Vox Populi)
-- UNIT PROMOTIONS
-- 2018-02-01 Reworked by Infixo from EE & VP-EE mods
-- 2022-11-28 kr patched
-- 2023-11-06 Updated by CAYM to be compatible with VP 4.2.7
----------------------------------------------------

----------------------------------------------------
-- Generic info
----------------------------------------------------

INSERT INTO UnitPromotions (Type, PediaType, IconAtlas, PortraitIndex, Sound) VALUES
('PROMOTION_2HANDER',        'PEDIA_MELEE',      'vpee_promoAtlas', 00,'AS2D_IF_LEVELUP'),
('PROMOTION_EE_FIRST_RATE',  'PEDIA_NAVAL',      'vpee_promoAtlas', 04,'AS2D_IF_LEVELUP'),
('PROMOTION_EE_DRYDOCK',     'PEDIA_NAVAL',      'vpee_promoAtlas', 06, NULL),
('PROMOTION_EE_ADVENTURER',  'PEDIA_SCOUTING',   'vpee_promoAtlas', 01, NULL),
('PROMOTION_EE_FASIL_GHEBBI','PEDIA_SHARED',     'vpee_promoAtlas', 02, NULL);

UPDATE UnitPromotions
SET Description = 'TXT_KEY_'||Type, Help = 'TXT_KEY_'||Type||'_HELP', PediaEntry = 'TXT_KEY_'||Type, CannotBeChosen = 1
WHERE Type IN (
'PROMOTION_2HANDER',
'PROMOTION_EE_FIRST_RATE',
'PROMOTION_EE_DRYDOCK',
'PROMOTION_EE_ADVENTURER',
'PROMOTION_EE_FASIL_GHEBBI');

----------------------------------------------------
-- Promotions' unique features
----------------------------------------------------

UPDATE UnitPromotions SET LostWithUpgrade = 1 WHERE Type = 'PROMOTION_2HANDER';
INSERT INTO UnitPromotions_UnitClasses (PromotionType, UnitClassType, Attack) VALUES
('PROMOTION_2HANDER', 'UNITCLASS_PIKEMAN', 33),
('PROMOTION_2HANDER', 'UNITCLASS_SPEARMAN', 33),
('PROMOTION_2HANDER', 'UNITCLASS_TERCIO', 33),
('PROMOTION_2HANDER', 'UNITCLASS_FCOMPANY', 33);

UPDATE UnitPromotions SET CombatPercent = 15 WHERE Type = 'PROMOTION_EE_DRYDOCK';
UPDATE UnitPromotions SET ExtraNavalMovement = 1, EmbarkExtraVisibility = 2 WHERE Type = 'PROMOTION_EE_ADVENTURER';
UPDATE UnitPromotions SET CombatPercent = 25 WHERE Type = 'PROMOTION_EE_FASIL_GHEBBI';

UPDATE UnitPromotions SET IsNearbyPromotion = 1, NearbyRange = 1, GiveDomain = 'DOMAIN_SEA', GiveDefenseMod = 20 WHERE Type = 'PROMOTION_EE_FIRST_RATE'; -- note that the nearby promotion logic requires CORE_AREA_EFFECT_PROMOTIONS in CustomModOptions

----------------------------------------------------
-- Eligible combats
----------------------------------------------------

INSERT INTO UnitPromotions_UnitCombats (PromotionType, UnitCombatType) VALUES
('PROMOTION_EE_ADVENTURER','UNITCOMBAT_RECON'),
('PROMOTION_EE_ADVENTURER','UNITCOMBAT_ARCHER'),
('PROMOTION_EE_ADVENTURER','UNITCOMBAT_MOUNTED'),
('PROMOTION_EE_ADVENTURER','UNITCOMBAT_MELEE'),
('PROMOTION_EE_ADVENTURER','UNITCOMBAT_SIEGE'),
('PROMOTION_EE_ADVENTURER','UNITCOMBAT_GUN'),
('PROMOTION_EE_ADVENTURER','UNITCOMBAT_ARMOR'),
('PROMOTION_EE_ADVENTURER','UNITCOMBAT_HELICOPTER'),
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