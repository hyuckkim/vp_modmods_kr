--============================================--
-- PROMOTIONS
--============================================--
INSERT INTO Language_ko_KR 
			(Tag,								Text) 
VALUES		('TXT_KEY_PROMOTION_FLETCHER',		'예르바 데 라 플레체'),
			('TXT_KEY_PROMOTION_FLETCHER_HELP',	'[COLOR:255:230:85:255]부상당한 유닛[ENDCOLOR]을 상대로 원거리 공격 [ICON_RANGE_STRENGTH] 전투력 +50%');
--============================================--
-- BUILDINGS
--============================================--
INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_FLETCHER',			'화살 장인'),
			('TXT_KEY_BUILDING_FLETCHER_PEDIA',		'TODO'),
			('TXT_KEY_BUILDING_FLETCHER_HELP',		'모든 궁술 유닛에게 [COLOR_POSITIVE_TEXT]예르바 데 라 플레체[ENDCOLOR] 승급을 부여합니다. 이 도시에서 궁술 유닛 생산 시 [ICON_PRODUCTION] 생산력이 +10% 증가합니다.[NEWLINE][NEWLINE][ICON_RES_TROPICAL_FISH] 열대어: [ICON_PRODUCTION] 생산력 +2'),
			('TXT_KEY_BUILDING_SEAFOOD',			'해산물 식당'),
			('TXT_KEY_BUILDING_SEAFOOD_PEDIA',		'TODO'),
			('TXT_KEY_BUILDING_SEAFOOD_HELP',		'매 턴 도시의 [ICON_FOOD] 식량 5%를 [ICON_TOURISM] 관광으로 전환합니다. [ICON_GREAT_WORK] 걸작 음악 슬롯 1개를 포함합니다.[NEWLINE][NEWLINE][ICON_CULTURE] 무료로 인한 불행이 -1[ICON_HAPPINESS_3] 감소합니다.[NEWLINE][NEWLINE][ICON_RES_FISH] 물고기: [ICON_FOOD] 식량 +1[NEWLINE][ICON_RES_CRAB] 게: [ICON_FOOD] 식량 +1, [ICON_TOURISM] 관광 +1[NEWLINE][ICON_RES_TROPICAL_FISH] 열대어: [ICON_FOOD] 식량 +1, [ICON_TOURISM] 관광 +1');
--============================================--
-- COMPATIBILITY
--============================================--
-- Louisiana
UPDATE Language_ko_KR SET Text = Text||'[NEWLINE][ICON_RES_SHRIMP] 새우: [ICON_FOOD] 식량 +1, [ICON_TOURISM] 관광 +1' WHERE Tag = 'TXT_KEY_BUILDING_SEAFOOD_HELP' AND EXISTS (SELECT * FROM BuildingClasses WHERE Type='BUILDINGCLASS_DUMMY_LOUISIANA');