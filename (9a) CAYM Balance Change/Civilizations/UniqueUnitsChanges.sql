
INSERT INTO COMMUNITY	
		(Type,			Value)
VALUES	('MUCfVP-CAYM', 2);

UPDATE COMMUNITY
SET Value = '1'
WHERE Type = 'MUCfVP-CAYM' AND EXISTS (SELECT * FROM Buildings WHERE Type='BUILDING_EE_DRYDOCK') AND NOT EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-CAYM' AND Value= 0);

--==========================================================================================================================	
-- Arabia Rework
--==========================================================================================================================

-- Moved CAYM UNIT CHANGE MODE (2023.08.31)

--==========================================================================================================================	
-- China Rework
--==========================================================================================================================
--Chu-Ko-Nu gets logistics back
UPDATE Units SET RangedCombat = '19' WHERE Type = 'UNIT_CHINESE_CHUKONU';
UPDATE Units SET Combat = '15' WHERE Type = 'UNIT_CHINESE_CHUKONU';

DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_CHINESE_CHUKONU' AND PromotionType = 'PROMOTION_REPEATER';

INSERT INTO Unit_FreePromotions
		(UnitType, 				 PromotionType)
VALUES	('UNIT_CHINESE_CHUKONU', 'PROMOTION_LOGISTICS');

--remove XP from 2nd attack
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'BALANCE_CORE_XP_ON_FIRST_ATTACK';

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
UPDATE Units SET PrereqTech = 'TECH_MACHINERY' 				WHERE Type = 'UNIT_KOREAN_HWACHA';
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
		('UNIT_KOREAN_HWACHA', 	'PROMOTION_FIELD_1');
------------------------------
-- Turtle ship defense upgrade 
------------------------------
INSERT INTO		Unit_FreePromotions
				(UnitType, 					PromotionType)
VALUES			('UNIT_KOREAN_TURTLE_SHIP', 'PROMOTION_ARMOR_PLATING_1');		

--==========================================================================================================================	
-- Shoshone Rework
--==========================================================================================================================

-- Moved CAYM UNIT CHANGE MODE (2023.08.31)

--==========================================================
--TEXT (en_US)
--==========================================================

--------------------
-- China
--------------------
UPDATE Language_en_US
SET Text = 'The Chu-Ko-Nu is the Chinese unique unit, replacing the Crossbowman. The Chu-Ko-Nu can attack twice, giving it a hefty punch on offense and defense.'
WHERE Tag = 'TXT_KEY_UNIT_CHINESE_CHUKONU_STRATEGY';

UPDATE Language_en_US
SET Text = 'Medieval ranged infantry Unit. Only the Chinese may build it. Gains [COLOR_POSITIVE_TEXT]Logistics[ENDCOLOR] promotion for free.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_CHUKONU';
--------------------
-- Korea
--------------------
UPDATE Language_en_US
SET Text = 'Korean replacement for the Cannon. Does not require [ICON_RES_IRON] Iron[NEWLINE][NEWLINE]Benefits from terrain defense and has the [COLOR_POSITIVE_TEXT]Field I[ENDCOLOR] promotion for free, but does not have a bonus against Cities.[NEWLINE][NEWLINE]Gains bonus [ICON_STRENGTH] Ranged Attack Strength when adjacent to or in a [COLOR_POSITIVE_TEXT]City[ENDCOLOR]. When attacking an enemy unit, deals 5 bonus splash damage to hostile Units adjacent to the target and within range.'
WHERE Tag = 'TXT_KEY_CIV5_KOREA_HWACHA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-CAYM' AND Value= 2);

UPDATE Language_en_US
SET Text = 'Korean replacement for the Bombard. Does not require [ICON_RES_IRON] Iron[NEWLINE][NEWLINE]Benefits from terrain defense and has the [COLOR_POSITIVE_TEXT]Field I[ENDCOLOR] promotion for free, but does not have a bonus against Cities.[NEWLINE][NEWLINE]Gains bonus [ICON_STRENGTH] Ranged Attack Strength when adjacent to or in a [COLOR_POSITIVE_TEXT]City[ENDCOLOR]. When attacking an enemy unit, deals 5 bonus splash damage to hostile Units adjacent to the target and within range.'
WHERE Tag = 'TXT_KEY_CIV5_KOREA_HWACHA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-CAYM' AND Value= 1);

UPDATE Language_en_US
SET Text = 'The Hwacha is able to provide covering fire for your field armies, with additional splash damage and attack strength against wounded enemy units. Use these advantages to wear out your adversaries with continuous salvos, or mass Hwachas against their cities to bring them down while benefiting from surrounding terrain.'
WHERE Tag = 'TXT_KEY_CIV5_KOREA_HWACHA_STRATEGY';

UPDATE Language_en_US
SET Text = 'Singijeon'
WHERE Tag = 'TXT_KEY_PROMOTION_REPEATER';

--==========================================================
--TEXT (ko_KR)
--==========================================================

--------------------
-- China
--------------------
UPDATE Language_ko_KR
SET Text = '연노병은 석궁병을 대체하는 중국 고유 유닛입니다. 연노병은 두 번 공격할 수 있어 공격과 방어에 강력합니다.'
WHERE Tag = 'TXT_KEY_UNIT_CHINESE_CHUKONU_STRATEGY';

UPDATE Language_ko_KR
SET Text = '중세 원거리 보병 유닛. 중국의 고유 유닛입니다. [COLOR_POSITIVE_TEXT]병참[ENDCOLOR] 승급이 있습니다.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_CHUKONU'; 

--------------------
-- Korea
--------------------
UPDATE Language_ko_KR
SET Text = '대포를 대체하는 한국의 고유 유닛입니다. [COLOR_YELLOW][ICON_RES_IRON]철[ENDCOLOR]이 필요하지 않습니다. [NEWLINE][NEWLINE]도시와 도시 주변을 공격 시 추가 공격력과 주변에 5의 피해를 줍니다. 적 영토에서 이동 속도가 두 배 느려집니다. [COLOR_POSITIVE_TEXT]야전 I[ENDCOLOR] 승급과 [COLOR_PLAYER_PURPLE]신기전[ENDCOLOR] 승급을 가지고 있습니다. 한 시대 먼저 생산이 가능합니다.'
WHERE Tag = 'TXT_KEY_CIV5_KOREA_HWACHA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-CAYM' AND Value= 2);

UPDATE Language_ko_KR
SET Text = '사석포를 대체하는 한국의 고유 유닛입니다. [COLOR_YELLOW][ICON_RES_IRON]철[ENDCOLOR]이 필요하지 않습니다. [NEWLINE][NEWLINE]도시와 도시 주변을 공격 시 추가 공격력과 주변에 5의 피해를 줍니다. 적 영토에서 이동 속도가 두 배 느려집니다. [COLOR_POSITIVE_TEXT]야전 I[ENDCOLOR] 승급과 [COLOR_PLAYER_PURPLE]신기전[ENDCOLOR] 승급을 가지고 있습니다. 한 시대 먼저 생산이 가능합니다.'
WHERE Tag = 'TXT_KEY_CIV5_KOREA_HWACHA_HELP'AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-CAYM' AND Value= 1);

UPDATE Language_ko_KR
SET Text = '화차는 엄호 사격을 제공할 수 있으며 적 유닛에 대한 추가적인 스플래쉬 데미지와 도시와 도시 주변 공격 시 추가 공격력을 제공합니다. 이러한 이점을 활용하여 지속적인 일제사격으로 적을 지치게 하거나, 주변 지형의 이점을 누리면서 도시에 대규모 화차를 투입하여 무너뜨리십시오.'
WHERE Tag = 'TXT_KEY_CIV5_KOREA_HWACHA_STRATEGY';

UPDATE Language_ko_KR
SET Text = '신기전'
WHERE Tag = 'TXT_KEY_PROMOTION_REPEATER';

UPDATE Language_ko_KR
SET Text = '도시 안/도시와 인접한 타일 주둔 시 [ICON_STRENGTH]원거리 전투력 보너스 [COLOR_POSITIVE_TEXT]+25%[ENDCOLOR][NEWLINE]목표 유닛과 인접한 모든 적 유닛에 피해 [COLOR_POSITIVE_TEXT]5[ENDCOLOR] [COLOR:105:105:105:255]([ICON_RANGE_STRENGTH]사거리 이내)[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_PROMOTION_REPEATER_HELP';

