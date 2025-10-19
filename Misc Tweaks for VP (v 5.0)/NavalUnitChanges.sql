----------------------------------------------------
-- Combat Strength
----------------------------------------------------

UPDATE Units SET Combat = 50 WHERE Type = 'UNIT_IRONCLAD';
UPDATE Units SET Combat = 53 WHERE Type = 'UNIT_AMAZONAS';
UPDATE Units SET Combat = 55 WHERE Type = 'UNIT_MONITOR';
UPDATE Units SET Combat = 60 WHERE Type = 'UNIT_DESTROYER';
UPDATE Units SET Combat = 72 WHERE Type = 'UNIT_FLEET_DESTROYER';
UPDATE Units SET Combat = 78 WHERE Type = 'UNIT_JFD_KAGERO';
UPDATE Units SET Combat = 86 WHERE Type = 'UNIT_SENSOR_COMBAT_SHIP';

UPDATE Units SET Combat = 50, RangedCombat = 50 WHERE Type = 'UNIT_CRUISER';
UPDATE Units SET Combat = 50, RangedCombat = 50 WHERE Type = 'UNIT_JFD_MIKASA';
UPDATE Units SET Combat = 60, RangedCombat = 58 WHERE Type = 'UNIT_DREADNOUGHT';
UPDATE Units SET Combat = 85, RangedCombat = 66 WHERE Type = 'UNIT_BATTLESHIP';
UPDATE Units SET Combat = 95, RangedCombat = 71 WHERE Type = 'UNIT_YAMATO';
UPDATE Units SET Combat = 100, RangedCombat = 71 WHERE Type = 'UNIT_JFD_YAMATO';
UPDATE Units SET Combat = 105, RangedCombat = 80 WHERE Type = 'UNIT_MISSILE_CRUISER';

UPDATE Units SET Combat = 40, RangedCombat = 70, Moves = 5 WHERE Type = 'UNIT_SUBMARINE';
UPDATE Units SET Combat = 54, RangedCombat = 85 WHERE Type = 'UNIT_ATTACK_SUBMARINE';
UPDATE Units SET Combat = 70, RangedCombat = 105 WHERE Type = 'UNIT_NUCLEAR_SUBMARINE';

UPDATE Units SET Combat = 70, RangedCombat = 30 WHERE Type = 'UNIT_CARRIER';
UPDATE Units SET Combat = 120, RangedCombat = 60 WHERE Type = 'UNIT_SUPERCARRIER';

----------------------------------------------------
-- Heavy Fire
----------------------------------------------------

INSERT INTO UnitPromotions
	(Type, Description, Help, Sound, LostWithUpgrade, CannotBeChosen, PortraitIndex, IconAtlas, PediaType, PediaEntry)
VALUES
	('PROMOTION_HEAVY_FIRE', 'TXT_KEY_PROMOTION_HEAVY_FIRE', 'TXT_KEY_PROMOTION_HEAVY_FIRE_HELP', 'AS2D_IF_LEVELUP', 1, 1, 28, 'PROMOTION_ATLAS_VP_06', 'PEDIA_NAVAL', 'TXT_KEY_PROMOTION_HEAVY_FIRE');

INSERT INTO UnitPromotions_UnitClasses
	(PromotionType, UnitClassType, Attack)
VALUES
	('PROMOTION_HEAVY_FIRE', 'UNITCLASS_GALLEY', 50),
	('PROMOTION_HEAVY_FIRE', 'UNITCLASS_TRIREME', 50),
	('PROMOTION_HEAVY_FIRE', 'UNITCLASS_CARAVEL', 50),
	('PROMOTION_HEAVY_FIRE', 'UNITCLASS_PRIVATEER', 50),
	('PROMOTION_HEAVY_FIRE', 'UNITCLASS_IRONCLAD', 50),
	('PROMOTION_HEAVY_FIRE', 'UNITCLASS_DESTROYER', 50),
	('PROMOTION_HEAVY_FIRE', 'UNITCLASS_FLEET_DESTROYER', 50),
	('PROMOTION_HEAVY_FIRE', 'UNITCLASS_SENSOR_COMBAT_SHIP', 50);

INSERT INTO Language_en_US (Tag, Text)
VALUES
	('TXT_KEY_PROMOTION_HEAVY_FIRE', 'Heavy Fire'),
	('TXT_KEY_PROMOTION_HEAVY_FIRE_HELP', '+50% [ICON_STRENGTH] Combat Strength when attacking [COLOR_POSITIVE_TEXT]Naval Melee Units[ENDCOLOR].');

----------------------------------------------------
-- Promotions
----------------------------------------------------

-- tweak Depth Charges values
UPDATE UnitPromotions_UnitClasses
SET Attack = 0, Defense = 0, Modifier = 33
WHERE PromotionType = 'PROMOTION_ANTI_SUBMARINE_I';

UPDATE UnitPromotions_UnitClasses
SET Attack = 0, Defense = 0, Modifier = 66
WHERE PromotionType = 'PROMOTION_ANTI_SUBMARINE_II';

UPDATE Language_en_US
SET Text = '+33% [ICON_STRENGTH] Combat Strength VS [COLOR_POSITIVE_TEXT]Submarine Units[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_PROMOTION_ANTI_SUBMARINE_I_HELP';

UPDATE Language_en_US
SET Text = '+66% [ICON_STRENGTH] Combat Strength VS [COLOR_POSITIVE_TEXT]Submarine Units[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_PROMOTION_ANTI_SUBMARINE_II_HELP';

DELETE FROM Unit_FreePromotions
WHERE UnitType = 'UNIT_MISSILE_CRUISER' AND PromotionType = 'PROMOTION_ARMOR_PLATING_1';

INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
VALUES
	('UNIT_DREADNOUGHT', 'PROMOTION_HEAVY_FIRE'),
	('UNIT_BATTLESHIP', 'PROMOTION_HEAVY_FIRE'),
	('UNIT_JAPAN_YAMATO', 'PROMOTION_HEAVY_FIRE'),
	('UNIT_JFD_YAMATO', 'PROMOTION_HEAVY_FIRE'),
	('UNIT_MISSILE_CRUISER', 'PROMOTION_HEAVY_FIRE');

-- Naval Ranged promotion rework
UPDATE UnitPromotions SET PromotionPrereqOr2 = 'PROMOTION_BROADSIDE' WHERE Type = 'PROMOTION_LOGISTICS';
UPDATE UnitPromotions SET PromotionPrereqOr1 = 'PROMOTION_TARGETING_3' WHERE Type = 'PROMOTION_BROADSIDE';
UPDATE UnitPromotions SET PromotionPrereqOr3 = 'PROMOTION_BOMBARDMENT_3' WHERE Type = 'PROMOTION_INDOMITABLE';
