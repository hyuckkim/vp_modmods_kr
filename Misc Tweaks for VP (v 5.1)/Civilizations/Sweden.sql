UPDATE UnitPromotions
SET
	AttackAbove50HealthMod = 30,
	AttackFullyHealedMod = 0
WHERE Type = 'PROMOTION_HAKKAA_PAALLE';

UPDATE Language_en_US
SET Text = '+30% [ICON_STRENGTH] Combat Strength when attacking [COLOR_POSITIVE_TEXT]Units above 50% HP[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_PROMOTION_HAKKAA_PAALLE_HELP';
