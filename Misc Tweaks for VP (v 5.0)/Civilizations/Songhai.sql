UPDATE UnitPromotions
SET River = 1
WHERE Type = 'PROMOTION_WAR_CANOES';

DELETE FROM Trait_FreePromotionUnitCombats WHERE TraitType = 'TRAIT_AMPHIB_WARLORD';

INSERT INTO Trait_FreePromotions
VALUES
	('TRAIT_AMPHIB_WARLORD', 'PROMOTION_WAR_CANOES');

INSERT INTO UnitPromotions_UnitCombats
	(PromotionType, UnitCombatType)
VALUES
	('PROMOTION_WAR_CANOES', 'UNITCOMBAT_MELEE'),
	('PROMOTION_WAR_CANOES', 'UNITCOMBAT_GUN'),
	('PROMOTION_WAR_CANOES', 'UNITCOMBAT_MOUNTED'),
	('PROMOTION_WAR_CANOES', 'UNITCOMBAT_ARMOR'),
	('PROMOTION_WAR_CANOES', 'UNITCOMBAT_ARCHER'),
	('PROMOTION_WAR_CANOES', 'UNITCOMBAT_SIEGE'),
	('PROMOTION_WAR_CANOES', 'UNITCOMBAT_RECON');

INSERT INTO UnitPromotions_CivilianUnitType
	(PromotionType, UnitType)
SELECT
	'PROMOTION_WAR_CANOES', Type
FROM Units
WHERE CivilianAttackPriority IS NOT NULL;

UPDATE Language_en_US
SET Text = 'Triple [ICON_GOLD] Gold from destroying Encampments and plundering Cities. Land Units gain the [COLOR_POSITIVE_TEXT]{TXT_KEY_PROMOTION_WAR_CANOES}[ENDCOLOR] Promotion.'
WHERE Tag = 'TXT_KEY_TRAIT_AMPHIB_WARLORD';

UPDATE Language_en_US
SET Text = 'Eliminate penalties for attacking or moving across a River. Double [ICON_MOVES] Movement when moving along Rivers.'
WHERE Tag = 'TXT_KEY_PROMOTION_WAR_CANOES_HELP';
