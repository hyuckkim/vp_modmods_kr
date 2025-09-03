--==========================================================================================================================	
-- Korea Rework
--==========================================================================================================================

---------------------
--Hwacha rework
---------------------
DELETE FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_KOREAN_HWACHA';
UPDATE Civilization_UnitClassOverrides SET UnitClassType = 'UNITCLASS_CANNON' WHERE UnitType = 'UNIT_KOREAN_HWACHA';
UPDATE Units SET Class = 'UNITCLASS_CANNON' 				WHERE Type = 'UNIT_KOREAN_HWACHA';
UPDATE Units SET Cost = 350 								WHERE Type = 'UNIT_KOREAN_HWACHA';
UPDATE Units SET FaithCost = 400 							WHERE Type = 'UNIT_KOREAN_HWACHA';
UPDATE Units SET PrereqTech = 'TECH_GUNPOWDER' 				WHERE Type = 'UNIT_KOREAN_HWACHA';
UPDATE Units SET ObsoleteTech = 'TECH_BALLISTICS' 			WHERE Type = 'UNIT_KOREAN_HWACHA';
UPDATE Units SET Combat = 16								WHERE Type = 'UNIT_KOREAN_HWACHA';
UPDATE Units SET RangedCombat = 32 							WHERE Type = 'UNIT_KOREAN_HWACHA';
UPDATE Units SET GoodyHutUpgradeUnitClass = 'UNITCLASS_FIELD_GUN' 	WHERE Type = 'UNIT_KOREAN_HWACHA';
UPDATE Unit_ClassUpgrades SET UnitClassType = 'UNITCLASS_FIELD_GUN' WHERE UnitType = 'UNIT_KOREAN_HWACHA';
UPDATE Unit_BuildingClassPurchaseRequireds SET BuildingClassType = 'BUILDINGCLASS_ARMORY' WHERE UnitType = 'UNIT_KOREAN_HWACHA';

DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_KOREAN_HWACHA' AND PromotionType = 'PROMOTION_LOGISTICS';
DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_KOREAN_HWACHA' AND PromotionType = 'PROMOTION_NO_DEFENSIVE_BONUSES';

INSERT INTO Unit_FreePromotions
		(UnitType, 				 PromotionType)
VALUES	('UNIT_KOREAN_HWACHA', 	'PROMOTION_REPEATER'),
		('UNIT_KOREAN_HWACHA', 	'PROMOTION_FIELD_I');
		
--==========================================================
--TEXT
--==========================================================
UPDATE Language_en_US
SET Text = 'Korean replacement for the Cannon. Does not require [ICON_RES_IRON] Iron[NEWLINE][NEWLINE]Benefits from terrain defense and has the [COLOR_POSITIVE_TEXT]Field I[ENDCOLOR] promotion for free, but does not have a bonus against Cities.[NEWLINE][NEWLINE]Gains bonus [ICON_STRENGTH] Ranged Attack Strength when adjacent to or in a [COLOR_POSITIVE_TEXT]City[ENDCOLOR]. When attacking an enemy unit, deals 5 bonus splash damage to hostile Units adjacent to the target and within range.'
WHERE Tag = 'TXT_KEY_CIV5_KOREA_HWACHA_HELP';

UPDATE Language_en_US
SET Text = 'The Hwacha is able to provide covering fire for your field armies, with additional splash damage and attack strength against wounded enemy units. Use these advantages to wear out your adversaries with continuous salvos, or mass Hwachas against their cities to bring them down while benefiting from surrounding terrain.'
WHERE Tag = 'TXT_KEY_CIV5_KOREA_HWACHA_STRATEGY';

UPDATE Language_en_US
SET Text = 'Singijeon'
WHERE Tag = 'TXT_KEY_PROMOTION_REPEATER';