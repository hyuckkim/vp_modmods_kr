--============================================--
-- 진급
--============================================--
INSERT INTO Language_ko_KR 
			(Tag,								Text) 
VALUES		('TXT_KEY_PROMOTION_FLETCHER',		'예르바 데 라 플레체'),
			('TXT_KEY_PROMOTION_FLETCHER_HELP',	'[COLOR:255:230:85:255]부상당한 유닛에게[ENDCOLOR] +50%[ICON_RANGE_STRENGTH] 공격 원거리 전투력.');
--============================================--
-- 건물
--============================================--
INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_FLETCHER',			'활 제작소'),
			('TXT_KEY_BUILDING_FLETCHER_PEDIA',		'작성 필요'),
			('TXT_KEY_BUILDING_FLETCHER_HELP',		'모든 궁수 유닛에게 [COLOR_POSITIVE_TEXT]예르바 데 라 플레체[ENDCOLOR] 진급 부여. 이 도시에서 궁수 유닛에 대한 [ICON_PRODUCTION] 생산력 +10%.[NEWLINE][NEWLINE]인접한 [ICON_RES_TROPICAL_FISH] 열대어: [ICON_PRODUCTION] 생산력 +2.'),
			('TXT_KEY_BUILDING_SEAFOOD',			'해산물 식당'),
			('TXT_KEY_BUILDING_SEAFOOD_PEDIA',		'작성 필요'),
			('TXT_KEY_BUILDING_SEAFOOD_HELP',		'도시의 [ICON_FOOD] 식량 5%가 매 턴 [ICON_TOURISM] 관광으로 전환됩니다. [ICON_GREAT_WORK] 위대한 음악 작품 슬롯 1개를 포함합니다.[NEWLINE][NEWLINE][ICON_CULTURE] 지루함으로 인한 [ICON_HAPPINESS_3] 불행 -1.[NEWLINE][NEWLINE]인접한 [ICON_RES_FISH] 물고기: [ICON_FOOD] 식량 +1.[NEWLINE]인접한 [ICON_RES_CRAB] 게: [ICON_FOOD] 식량 +1 및 [ICON_TOURISM] 관광 +1.[NEWLINE]인접한 [ICON_RES_TROPICAL_FISH] 열대어: [ICON_FOOD] 식량 +1 및 [ICON_TOURISM] 관광 +1.');
--============================================--
-- 호환성
--============================================--
-- 루이지애나
UPDATE Language_ko_KR SET Text = Text||'[NEWLINE]인접한 [ICON_RES_SHRIMP] 새우: [ICON_FOOD] 식량 +1 및 [ICON_TOURISM] 관광 +1.' WHERE Tag = 'TXT_KEY_BUILDING_SEAFOOD_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-CIV-LOI' AND Value= 1);