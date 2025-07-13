---------------------------------------
-- 마나난을 위한 실제 해상 전력
---------------------------------------
UPDATE Language_ko_KR SET
Text = '도시가 [COLOR_POSITIVE]연안[ENDCOLOR]에 있을 경우 [ICON_FOOD] 식량 +3, [ICON_PRODUCTION] 생산 +3, [ICON_GOLD] 골드 +3 증가합니다. 물 타일에서 [ICON_PRODUCTION] 생산 +1, 어선에서 [ICON_CULTURE] 문화 +1, [ICON_GREAT_ADMIRAL] 위대한 제독 점수 +1 증가합니다. 자격을 갖춘 유닛은 [COLOR_POSITIVE_TEXT]수륙양용[ENDCOLOR] 승급을 받습니다. 연회장에서 [ICON_GREAT_ADMIRAL] 위대한 제독 점수 +2 증가합니다.'
WHERE Tag = 'TXT_KEY_BELIEF_MANANNAN';

---------------------------------------
-- 오그마, 키 보너스는 브랜에 비하면 좀 엉터리야
---------------------------------------
UPDATE Language_ko_KR SET
Text = '도서관과 궁전에서 [ICON_RESEARCH]과학 +2, [ICON_CULTURE] 문화 +2 증가합니다. [ICON_GREAT_WORK] 걸작, [ICON_VP_SCIENTIST] 과학자, [ICON_VP_WRITER] 작가로부터 [ICON_FOOD] 음식 +1, [ICON_RESEARCH] 과학 +1, [ICON_CULTURE] 문화 +1. 수도/성지에 [ICON_GREAT_SCIENTIST] 위대한 과학자 점수 +3, [ICON_GREAT_WRITER] 위대한 작가 점수 +3 추가됩니다. 연회장에서 [ICON_RESEARCH] 과학 +3 증가합니다.'
WHERE Tag = 'TXT_KEY_BELIEF_OGMA';

---------------------------------------
-- 시설이 지어지지 않은 특징이 있는 지형의 케르눈노스 아이디어
---------------------------------------
UPDATE Language_ko_KR SET
Text = '[COLOR_NEGATIVE_TEXT]시설이 없는[ENDCOLOR] 모든 특징 지형에서 [ICON_FOOD] 식량 +1, [ICON_PRODUCTION] 생산 +1 증가합니다. 숲과 정글에서 [ICON_GOLD] 골드가 +1 증가합니다. 야영지와 재배지에서 [ICON_RESEARCH] 과학 +1, [ICON_CULTURE] 문화 +1 증가합니다. 연회장에서 [ICON_CULTURE] 문화 +2 증가합니다.'
WHERE Tag = 'TXT_KEY_BELIEF_CERNUNNOS';

---------------------------------------
-- 리아논과 자연경관 
---------------------------------------
UPDATE Language_ko_KR SET
Text = '도시에 [ICON_CITIZEN] 시민이 4명 이상이면 [COLOR_POSITIVE_TEXT]모든 산출량[ENDCOLOR]이 +1 증가합니다. 자연경관에서 얻는 [COLOR_POSITIVE_TEXT]모든 산출량[ENDCOLOR]이 +3 증가합니다. 개척자 유닛이 [COLOR_POSITIVE_TEXT]리아논의 길[ENDCOLOR] 승급을 받습니다. 연회장에서 [COLOR_POSITIVE_TEXT]모든 산출량[ENDCOLOR]이 +1 증가합니다.'
WHERE Tag = 'TXT_KEY_BELIEF_RHIANNON';

INSERT INTO Language_ko_KR
	(Tag, Text)
VALUES
	('TXT_KEY_PROMOTION_RHIANNON', '리아논의 길'),
	('TXT_KEY_PROMOTION_RHIANNON_HELP', '[ICON_MOVES] 이동력이 +2 증가합니다.[NEWLINE] 지형 비용, 통제 구역(ZOC), 경쟁자의 국경을 무시합니다.[NEWLINE]적의 경로를 이용할 수 있습니다.');

---------------------------------------
-- revert bran dagda healing swap c.f. pdan thread
---------------------------------------
UPDATE Language_ko_KR SET
Text = '+25% [ICON_FOOD] Growth and +1 [ICON_HAPPINESS_1] Happiness. +12 [ICON_PRODUCTION] Production, [ICON_GOLD] Gold, and [ICON_CULTURE] Culture when a [ICON_CITIZEN] Citizen is born, scaling with Era. Units heal [COLOR_POSITIVE_TEXT]+10 HP[ENDCOLOR] per turn in owned Territory. +5 [ICON_FOOD] Food from Ceilidh Hall.'
WHERE Tag = 'TXT_KEY_BELIEF_DAGDA';

---------------------------------------
-- and buff bran so it has something for a non-capital bonus
---------------------------------------
UPDATE Language_ko_KR SET
Text = '+1 [ICON_PRODUCTION] Production, [ICON_GOLD] Gold, [ICON_RESEARCH] Science, and [ICON_CULTURE] Culture from Walls and the Palace. +4 [ICON_PRODUCTION] Production, [ICON_GOLD] Gold, [ICON_RESEARCH] Science, and [ICON_CULTURE] Culture in your [ICON_CAPITAL] Capital/Holy City for every 5 Followers of your [ICON_RELIGION_PANTHEON] Pantheon in owned Cities. +25% City [ICON_RANGE_STRENGTH] Ranged Combat Strength. +2 [ICON_HAPPINESS_1] Happiness from Ceilidh Hall.'
WHERE Tag = 'TXT_KEY_BELIEF_BRAN';

---------------------------------------
-- Cailleach, the Hag
---------------------------------------
UPDATE Language_ko_KR SET
Text = '+1 [ICON_FOOD] Food, [ICON_PRODUCTION] Production, and [ICON_GOLD] Gold for every 2 Tundra tiles worked by the City. +2 [ICON_FOOD] Food, [ICON_PRODUCTION] Production, and [ICON_GOLD] Gold from Snow tiles with Resources. +1 [ICON_PRODUCTION] Production and [ICON_CULTURE] Culture from Quarries and Mines on Resources. +4 [ICON_PRODUCTION] Production from Ceilidh Hall.'
WHERE Tag = 'TXT_KEY_BELIEF_CAILLEACH';

--UPDATE Language_ko_KR SET
--Text = 'Cailleach, the Hag'
--WHERE Tag = 'TXT_KEY_BELIEF_CAILLEACH_SHORT';

---------------------------------------
-- Epona, the Great Mare
---------------------------------------
UPDATE Language_ko_KR SET
Text = '+3 [ICON_CULTURE_LOCAL] Border Growth from Pastures. +1 [ICON_HAPPINESS_1] Happiness from Stables and can purchase them with [ICON_PEACE] Faith. Gain +8 [ICON_FOOD] Food, [ICON_PRODUCTION] Production, [ICON_RESEARCH] Science, and [ICON_CULTURE] Culture every time the City expands its borders naturally, scaling with Era. +5 [ICON_CULTURE_LOCAL] Border Growth from Ceilidh Hall.'
WHERE Tag = 'TXT_KEY_BELIEF_EPONA';

---------------------------------------
-- Lugh: Egypt is going a different way can buff this
---------------------------------------
UPDATE Language_ko_KR SET
Text = '+2 [ICON_FOOD] Food, [ICON_GOLD] Gold, [ICON_RESEARCH] Science, [ICON_CULTURE] Culture, and [ICON_TOURISM] Tourism if the City has a Specialist. +25% [ICON_PRODUCTION] Production towards [ICON_WONDER] Wonders. +2 [ICON_CULTURE] Culture and [ICON_TOURISM] Tourism from [ICON_WONDER] World Wonders. +5 [ICON_TOURISM] Tourism from Ceilidh Hall.'
WHERE Tag = 'TXT_KEY_BELIEF_LUGH';

---------------------------------------
-- Morrigan, typo and added last effect
---------------------------------------
UPDATE Language_ko_KR SET
Text = '+1 [ICON_GREAT_GENERAL] Great General Point from Strategic Resources. Gain [ICON_GOLD] Gold, [ICON_CULTURE] Culture, and [ICON_GOLDEN_AGE] Golden Age Points from killing enemy units equal to 200% of its [ICON_STRENGTH] Strength, and gain 20 of each yield when you [COLOR_POSITIVE_TEXT]pillaging improvements[ENDCOLOR], scaling with Era. +2 [ICON_GREAT_GENERAL] Great General Points from Ceilidh Hall.'
WHERE Tag = 'TXT_KEY_BELIEF_MORRIGAN';

---------------------------------------
-- nuada has no culture. add small amount through theme
---------------------------------------
UPDATE Language_ko_KR SET
Text = '+10% [ICON_GOLD] Gold, [ICON_RESEARCH] Science, and [ICON_CULTURE] Culture during "[COLOR_POSITIVE_TEXT]We Love the King Day[ENDCOLOR]". +3 [ICON_GOLD] Gold, [ICON_RESEARCH] Science, and [ICON_GOLDEN_AGE] Golden Age Points in your [ICON_CAPITAL] Capital/Holy City for every unique Luxury Resource owned or imported, and per active Trade Route [ICON_ARROW_LEFT] to or [ICON_ARROW_RIGHT] from the City. +5 [ICON_GOLD] Gold from Ceilidh Hall.'
WHERE Tag = 'TXT_KEY_BELIEF_NUADA';

-----------------------------
-- gwyn who is a mix with idris the giant and the grey king
-----------------------------
UPDATE Language_ko_KR SET
Text = '+20% [ICON_STRENGTH] Attack in Hills.[NEWLINE]Can cross Mountains.'
WHERE Tag = 'TXT_KEY_PROMOTION_ALTITUDE_TRAINING_HELP';

INSERT INTO Language_ko_KR
	(Tag, Text)
VALUES
	('TXT_KEY_BELIEF_GWYN', '+1 [ICON_FOOD] Food, [ICON_RESEARCH] Science, and [ICON_CULTURE] Culture for every 2 Mountains within 3 tiles of the City (capping at the City''s population). Eligible Units receive the [COLOR_POSITIVE_TEXT]Altitude Training[ENDCOLOR] Promotion. Gain [ICON_PEACE] Faith when an enemy Unit is killed or an owned Unit dies equal to 200% of its [ICON_STRENGTH] Strength. +3 [ICON_PEACE] Faith from Ceilidh Hall.'),
	('TXT_KEY_BELIEF_GWYN_SHORT', 'Gwyn, Monarch of the Mists');

----------------------------------------
-- olwen a sun-type diety for the desert
----------------------------------------
INSERT INTO Language_ko_KR
	(Tag, Text)
VALUES
	('TXT_KEY_BELIEF_OLWEN', '+1 [ICON_FOOD] Food and [ICON_PRODUCTION] Production from Desert tiles [COLOR_NEGATIVE_TEXT]without[ENDCOLOR] Flood Plains, and for every 2 Plains or 2 Flood Plains tiles worked by the City. +1 [ICON_RESEARCH] Science and [ICON_GOLDEN_AGE] Golden Age Point from Farms. +10% [ICON_CULTURE] Culture during [ICON_GOLDEN_AGE] Golden Ages. +5 [ICON_GOLDEN_AGE] Golden Age Points from Ceilidh Hall.'),
	('TXT_KEY_BELIEF_OLWEN_SHORT', 'Olwen, the Golden Wheel');

