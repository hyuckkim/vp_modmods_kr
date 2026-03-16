-- 파일 / DummyPolicies.sql
INSERT INTO Language_ko_KR
  (Tag, Text)
VALUES
  ('TXT_KEY_PLACEHOLDER', '특정 문화 그룹');

-- 파일 / Reassignments.sql
INSERT INTO Language_ko_KR
  (Tag, Text)
VALUES
  ('TXT_KEY_CULTURE_CD_PATAGONIAN_SHORT_DESC', '파타고니아'),
  ('TXT_KEY_CULTURE_CD_CELTIC_SHORT_DESC', '켈트');

UPDATE Language_ko_KR SET
Text = '중앙유럽'
WHERE Tag = 'TXT_KEY_CULTURE_JFD_CENTRAL_SHORT_DESC';

UPDATE Language_ko_KR SET
Text = '동아시아'
WHERE Tag = 'TXT_KEY_CULTURE_JFD_FAR_EASTERN_SHORT_DESC';

UPDATE Language_ko_KR SET
Text = '동유럽'
WHERE Tag = 'TXT_KEY_CULTURE_JFD_EASTERN_SHORT_DESC';

UPDATE Language_ko_KR SET
Text = '서유럽'
WHERE Tag = 'TXT_KEY_CULTURE_JFD_WESTERN_SHORT_DESC';

UPDATE Language_ko_KR SET
Text = '남유럽'
WHERE Tag = 'TXT_KEY_CULTURE_JFD_SOUTHERN_SHORT_DESC';

UPDATE Language_ko_KR SET
Text = '스칸디나비아'
WHERE Tag = 'TXT_KEY_CULTURE_JFD_NORTHERN_SHORT_DESC';

UPDATE Language_ko_KR SET
Text = '기니'
WHERE Tag = 'TXT_KEY_CULTURE_JFD_CENTRAL_AFRICAN_SHORT_DESC';

UPDATE Language_ko_KR SET
Text = '레반트'
WHERE Tag = 'TXT_KEY_CULTURE_JFD_MESOPOTAMIC_SHORT_DESC';

UPDATE Language_ko_KR SET
Text = '사하라'
WHERE Tag = 'TXT_KEY_CULTURE_JFD_WEST_AFRICAN_SHORT_DESC';

-- 파일 / Denmark.sql
/*
UPDATE Language_ko_KR SET
Text = 'Unique Danish Dreadnought. Has higher [ICON_RANGE_STRENGTH] Attack and significantly higher [ICON_STRENGTH] Melee and [ICON_AIRSTRIKE_DEFENSE] Air Defense, but only moves at [COLOR_NEGATIVE_TEXT]half speed[ENDCOLOR] in [COLOR_POSITIVE_TEXT]Ocean[ENDCOLOR] tiles. Can [COLOR_POSITIVE_TEXT]Move After Attacking[ENDCOLOR]. Starts with the [COLOR_POSITIVE_TEXT]Harbor Defense[ENDCOLOR] Promotion, which increases the [ICON_STRENGTH] Defense of adjacent Cities, and the [COLOR_POSITIVE_TEXT]Targeting I[ENDCOLOR] Promotion.'
WHERE Tag = 'TXT_KEY_UNIT_CD_TROLLE_HELP';
*/

-- 파일 / India.sql
REPLACE INTO Language_ko_KR 
  (Tag, Text)
SELECT
  'TXT_KEY_BUILDING_HARAPPAN_RESERVOIR_HELP', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_WATERMILL_HELP';

UPDATE Language_ko_KR SET
Text = '도시가 [COLOR_POSITIVE_TEXT]담수[ENDCOLOR] 공급원 역할을 합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_HARAPPAN_RESERVOIR_HELP';

UPDATE Language_ko_KR SET
Text = '{TXT_KEY_BUILDING_WELL} 및 {TXT_KEY_BUILDING_WATERMILL}을 대체하는 인도 고유 건물입니다. 물레방아의 산출량과 성장성을 갖추었지만, 우물처럼 일찍 건설할 수 있으며 비용도 저렴합니다. 별도의 입지 제한이 없는 대신, 주변 타일에 담수를 공급하여 관개 시설이 없는 농장의 산출량을 높여줍니다. 특히 게임 초반에 농장에서 얻는 생산력 보너스는 매우 강력합니다. 마지막으로, 이 건물은 도시 내 다수 [ICON_RELIGION] 종교의 영향력에 비례하여 [ICON_FOOD] 식량 생산량을 증가시키며, 본토의 종교를 잘 유지한다면 게임 전체에 걸쳐 효과가 강화됩니다.'
WHERE Tag = 'TXT_KEY_BUILDING_HARAPPAN_RESERVOIR_STRATEGY';

UPDATE Language_ko_KR SET
Text = '킬라(Qila)는 능보 요새를 대체하는 인도 고유 건물입니다. 요새의 일반적인 보너스 외에도, 도시는 추가 체력을 얻으며 보유한 국가 불가사의나 세계 불가사의 하나당 방어력이 증가합니다. 가장 장엄하게 발전한 도시는 적이 함락시키기 더욱 어려워질 것입니다. 또한, 킬라는 문화와 위대한 예술가 점수를 생성하며, 도시가 더 많이 발전할수록 더 많은 점수를 제공합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_MUGHAL_FORT_STRATEGY';

/*
UPDATE Language_ko_KR SET
Text = 'Damage from all sources against this City is reduced by 2. +1 [ICON_WAR] Military Supply, and +5% [ICON_SILVER_FIST] Military Supply from Population. Allows City to [ICON_RANGE_STRENGTH] Strike over obstacles.[NEWLINE][NEWLINE]Garrisoned Units receive an additional 5 Health when healing in this City.[NEWLINE][NEWLINE]+1 [ICON_STRENGTH] City Strength for every 2 National or [ICON_WONDER] World Wonders built in this City. 20% of [ICON_STRENGTH] City Defense is converted to [ICON_CULTURE] Culture very turn. When you complete a building gain 5% progress towards a [ICON_GREAT_ARTIST] Great Artist.[NEWLINE][NEWLINE][ICON_CITY_STATE] Empire Size Modifier is reduced by 5% in this City.'
WHERE Tag = 'TXT_KEY_BUILDING_MUGHAL_FORT_HELP';
*/

-- 파일 / Songhai.sql
UPDATE Language_ko_KR SET
Text = '봉합 카누'
WHERE Tag = 'TXT_KEY_PROMOTION_WAR_CANOES';

-- 파일 / Amazonian.sql
REPLACE INTO Language_ko_KR 
	(Tag, Text)
SELECT
	'TXT_KEY_UNIT_CD_CURARE_DART_HELP', '이 유닛을 사용하려면 [ICON_CULTURE_JFD_AMAZONIAN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_AMAZONIAN_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.'
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_UNIT_HELP_CHARIOR_ARCHER'; 

REPLACE INTO Language_ko_KR 
  (Tag, Text)
SELECT
  'TXT_KEY_BUILDING_CD_CASSAVA_PIT_HELP', '이 건물을 건설하려면 [ICON_CULTURE_JFD_AMAZONIAN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_AMAZONIAN_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다. ' || Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_GRANARY_HELP';

-- 파일 / Andean.sql
UPDATE Language_ko_KR SET
Text = '이 유닛을 사용하려면 [ICON_CULTURE_JFD_ANDEAN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_ANDEAN_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.'
WHERE Tag = 'TXT_KEY_UNIT_CD_TUPAMARISTA_HELP';

REPLACE INTO Language_ko_KR 
  (Tag, Text)
SELECT
  'TXT_KEY_BUILDING_CD_YATIRI_HELP', '[ICON_CULTURE_JFD_ANDEAN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_ANDEAN_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다. '
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_GROCER_HELP';

UPDATE Language_ko_KR SET
Text = Replace(Text, '문화 그룹이 필요합니다. ', '문화 그룹이 필요합니다.')
WHERE Tag = 'TXT_KEY_BUILDING_CD_YATIRI_HELP';
-- [NEWLINE]Place up to 1 copy of [ICON_RES_COCA] Coca near the City.
--  Land Units in this City heal [COLOR_POSITIVE_TEXT]10[ENDCOLOR] HP per turn, whether or not they take an action. City gains +1 [ICON_PEACE] Faith for every 2 Mountains within 3 tiles.

-- 파일 / Bantu.sql
REPLACE INTO Language_ko_KR 
  (Tag, Text)
SELECT
  'TXT_KEY_UNIT_CD_KOLOLO_HELP', '[ICON_CULTURE_JFD_BANTU] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_BANTU_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.'
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_UNIT_COLONIST_HELP';

--  Founds new Cities with advanced infrastructure and additional [ICON_CITIZEN] Population. Unlike the Colonist that it replaces, it has a [ICON_RANGE_STRENGTH] Ranged Attack and [ICON_STRENGTH] Combat Strength. Can move after attacking and gains [ICON_FOOD] Food, [ICON_PRODUCTION] Production, and [ICON_CULTURE_LOCAL] Border Growth Points from [ICON_RAZING] Pillaging Improvements. Starts with the [COLOR_POSITIVE_TEXT]Buffalo Chest[ENDCOLOR], [COLOR_POSITIVE_TEXT]Horns[ENDCOLOR], and [COLOR_POSITIVE_TEXT]Loins[ENDCOLOR] Promotions.[NEWLINE][NEWLINE]The [ICON_FOOD] Growth of the City is stopped while this Unit is being Trained. Reduces the City''s [ICON_CITIZEN] Population by 1 when completed.

REPLACE INTO Language_ko_KR 
	(Tag, Text)
SELECT
	'TXT_KEY_BUILDING_CD_KGOTLA_HELP', '[ICON_CULTURE_JFD_BANTU] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_BANTU_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다. ' || Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_CONSTABLE_HELP';

-- 파일 / Bharata.sql
UPDATE Language_ko_KR SET
Text = '이 유닛을 사용하려면 [ICON_CULTURE_JFD_BHARATA] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_BHARATA_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.'
WHERE Tag = 'TXT_KEY_UNIT_CD_SEPOY_HELP';

--  Has higher [ICON_STRENGTH] Combat Strength than the Musketman it replaces. Starts with the [COLOR_POSITIVE_TEXT]Izzat[ENDCOLOR] Promotion, which randomly assigns one of four [COLOR_POSITIVE_TEXT]Caste Promotions[ENDCOLOR] after the first combat; gain [ICON_RANGE_STRENGTH] Attack based on how many other Units of that Caste have attacked in the same turn; Cities and Fortifications gain yields when a Unit with a Caste Promotion is stationed there.

REPLACE INTO Language_ko_KR 
  (Tag, Text)
SELECT
  'TXT_KEY_BUILDING_CD_GHAT_HELP', '이 건물을 건설하려면 [ICON_CULTURE_JFD_BHARATA] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_BHARATA_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.';

--UPDATE Language_ko_KR SET
--Text = Replace(Text, 'Can only be built in a City next to fresh water.', 'Can only be built in a City next to a River.')
--WHERE Tag = 'TXT_KEY_BUILDING_CD_GHAT_HELP';

-- 파일 / Celtic.sql
UPDATE Language_ko_KR SET
Text = '이 유닛을 사용하려면 [ICON_CULTURE_JFD_NORTHERN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_CD_CELTIC_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.'
WHERE Tag = 'TXT_KEY_UNIT_CD_HIGHLANDER_HELP';

--  Has more [ICON_STRENGTH] Combat Strength than the Gatling Gun it replaces. Instead of [COLOR_NEGATIVE_TEXT]Covering Fire I[ENDCOLOR] has the [COLOR_POSITIVE_TEXT]Bagpipes[ENDCOLOR] Promotion, which does not reduce attack against [COLOR_POSITIVE_TEXT]Cities[ENDCOLOR] and [COLOR_POSITIVE_TEXT]Fortified Units[ENDCOLOR], and shares a stronger defensive bonus with adjacent [COLOR_POSITIVE_TEXT]Friendly Units[ENDCOLOR]. Starts with the [COLOR_POSITIVE_TEXT]Highlander[ENDCOLOR] Promotion. 

REPLACE INTO Language_ko_KR 
  (Tag, Text)
SELECT
  'TXT_KEY_BUILDING_CD_METALSMITH_HELP', '이 건물을 건설하려면 [ICON_CULTURE_JFD_NORTHERN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_CD_CELTIC_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다. ' || Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_WORKSHOP_HELP';

--incompatible with EE
--UPDATE Language_ko_KR SET
--Text = Replace(Text, '+1 [ICON_PRODUCTION] Production for every 4 [ICON_CITIZEN] Citizens in the City', 
--			'+1 [ICON_PRODUCTION] Production and [ICON_GOLD] Gold for every 4 [ICON_CITIZEN] Citizens in the City')
--WHERE Tag = 'TXT_KEY_BUILDING_CD_METALSMITH_HELP';

INSERT INTO Language_ko_KR
  (Tag, Text)
VALUES
  ('TXT_KEY_CITY_EVENT_METALSMITH', '장인 공예'),
  ('TXT_KEY_CITY_EVENT_METALSMITH_1_HELP', '지역 금속 세공인들이 단단하고 내구성이 강한 금속으로 작업하는 것을 선호하게 되었습니다.[NEWLINE][NEWLINE][ICON_RES_IRON] 철 자원 1개를 얻습니다.'),
  ('TXT_KEY_CITY_EVENT_METALSMITH_2_HELP', '지역 금속 세공인들이 복잡한 고색이 감도는 장식물을 만드는 것을 선호하게 되었습니다.[NEWLINE][NEWLINE][ICON_RES_COPPER] 구리 자원 1개를 얻습니다.'),
  ('TXT_KEY_CITY_EVENT_METALSMITH_3_HELP', '지역 금속 세공인들이 밝은 광택을 내는 작품을 만드는 것을 선호하게 되었습니다.[NEWLINE][NEWLINE][ICON_RES_SILVER] 은 자원 1개를 얻습니다.'),
  ('TXT_KEY_CITY_EVENT_METALSMITH_4_HELP', '지역 금속 세공인들이 비싸고 호화로운 재료를 선호하게 되었습니다.[NEWLINE][NEWLINE][ICON_RES_GOLD] 금 자원 1개를 얻습니다.'),
  ('TXT_KEY_CITY_EVENT_METALSMITH_5_HELP', '지역 금속 세공인들이 현대적이고 가벼운 재료를 선호하게 되었습니다.[NEWLINE][NEWLINE][ICON_RES_ALUMINUM] 알루미늄 자원 1개를 얻습니다.');

UPDATE Language_ko_KR SET
Text = Replace(Text, '문화 그룹이 필요합니다. ', '문화 그룹이 필요합니다.[NEWLINE]무작위 [COLOR_POSITIVE_TEXT]금속 자원[ENDCOLOR] 1개를 얻습니다. ')
WHERE Tag = 'TXT_KEY_BUILDING_CD_METALSMITH_HELP';

-- 파일 / Central.sql
UPDATE Language_ko_KR SET
Text = '이 유닛을 사용하려면 [ICON_CULTURE_JFD_CENTRAL] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_CENTRAL_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.'
WHERE Tag = 'TXT_KEY_UNIT_CD_SLAGANZ_HELP';

--  Is slightly stronger than the Warrior that it replaces. Has the [COLOR_POSITIVE_TEXT]Warchief[ENDCOLOR] Promotion that increases [ICON_STRENGTH] Combat Strength within 3 tiles of [COLOR_POSITIVE_TEXT]Friendly[ENDCOLOR] Cities, and when attacking [COLOR_POSITIVE_TEXT]Fortified Units[ENDCOLOR]. Can enter [COLOR_YIELD_FOOD]Rival Territory[ENDCOLOR]. 

--Adjacent Enemy Units that start their turn below [COLOR_NEGATIVE_TEXT]35 HP[ENDCOLOR] convert to [ICON_TEAM_2] Barbarians. When defeating Barbarians you gain [ICON_FOOD] Food and [ICON_CULTURE_LOCAL] Border Growth Points.

REPLACE INTO Language_ko_KR 
  (Tag, Text)
SELECT
  'TXT_KEY_BUILDING_CD_TEUTONIC_ORDER_HELP', '[ICON_CULTURE_JFD_CENTRAL] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_CENTRAL_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.' || Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_HEROIC_EPIC_HELP';

UPDATE Language_ko_KR SET
Text = Replace(Text, '문화 그룹이 필요합니다. ', '문화 그룹이 필요합니다.')
WHERE Tag = 'TXT_KEY_BUILDING_CD_TEUTONIC_ORDER_HELP';

-- +10% [ICON_STRENGTH] Defense and +1 [ICON_SILVER_FIST] Military Supply in all Cities.  All Barracks in the Empire generate +2 [ICON_PEACE] Faith.[NEWLINE][NEWLINE]All Melee and Mounted Units in the Empire receive the [COLOR_POSITIVE_TEXT]General Chapter[ENDCOLOR] Promotion, adding [ICON_PRODUCTION] Production and [ICON_GOLD] Gold to Cities and Fortifications in which they are stationed, gaining [ICON_PEACE] Faith from XP, and [ICON_STRENGTH] Combat Strength against Barbarians.[NEWLINE][NEWLINE]

-- 파일 / Classical.sql
UPDATE Language_ko_KR SET
Text = '이 유닛을 사용하려면 [ICON_CULTURE_JFD_CLASSICAL] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_CLASSICAL_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.'
WHERE Tag = 'TXT_KEY_UNIT_CD_ARCU_HELP';

--  Unlocks earlier, is cheaper, and is slightly weaker than the Crossbowman it replaces. Starts with the [COLOR_POSITIVE_TEXT]Vantage[ENDCOLOR] Promotion, which increases [ICON_VISION] Sight, and increases [ICON_STRENGTH] Combat Strength when [COLOR_POSITIVE_TEXT]within 1 tile of a Fort or Friendly City[ENDCOLOR] (stacking).

REPLACE INTO Language_ko_KR 
  (Tag, Text)
SELECT
  'TXT_KEY_BUILDING_CD_NATIONAL_EXHIBIT_HELP', '[ICON_CULTURE_JFD_CLASSICAL] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_CLASSICAL_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.'

INSERT INTO Language_ko_KR
  (Tag, Text)
VALUES
  ('TXT_KEY_THEMING_BONUS_CD_NATIONAL_EXHIBIT_F', '대리석의 도시'),
  ('TXT_KEY_THEMING_BONUS_CD_NATIONAL_EXHIBIT_FC', '천재의 유산'),
  ('TXT_KEY_THEMING_BONUS_CD_NATIONAL_EXHIBIT_A', '위대한 행렬'),
  ('TXT_KEY_THEMING_BONUS_CD_NATIONAL_EXHIBIT_AC', '시대의 후원'),
  ('TXT_KEY_THEMING_BONUS_CD_NATIONAL_EXHIBIT_AF', '르네상스의 축'),
  ('TXT_KEY_THEMING_BONUS_CD_NATIONAL_EXHIBIT_AFC', '서구 문명의 요람'),
  ('TXT_KEY_THEMING_BONUS_CD_NATIONAL_EXHIBIT_HELP', '보너스를 최대화하려면 걸작 슬롯을 자신이 직접 발굴/제작하고 연속된 시대에 속하는 유물 2개와 예술품 2개로 채우십시오.');

UPDATE Language_ko_KR SET
Text = Text || '[NEWLINE]가능한 테마 보너스:
[NEWLINE][ICON_BULLET][COLOR:255:230:150:255]연속된 시대[ENDCOLOR]의 [COLOR_POSITIVE_TEXT]자국[ENDCOLOR] 예술품 2개와 유물 2개 배치 시 [ICON_CULTURE] 및 [ICON_TOURISM] +25.
[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]자국[ENDCOLOR] 예술품 2개와 유물 2개 배치 시 [ICON_CULTURE] 및 [ICON_TOURISM] +20.
[NEWLINE][ICON_BULLET][COLOR:255:230:150:255]연속된 시대[ENDCOLOR]의 [COLOR_POSITIVE_TEXT]자국[ENDCOLOR] 유물 4개 배치 시 [ICON_CULTURE] 및 [ICON_TOURISM] +20.
[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]자국[ENDCOLOR] 유물 4개 배치 시 [ICON_CULTURE] 및 [ICON_TOURISM] +15.
[NEWLINE][ICON_BULLET][COLOR:255:230:150:255]연속된 시대[ENDCOLOR]의 [COLOR_POSITIVE_TEXT]자국[ENDCOLOR] 예술품 4개 배치 시 [ICON_CULTURE] 및 [ICON_TOURISM] +20.
[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]자국[ENDCOLOR] 예술품 4개 배치 시 [ICON_CULTURE] 및 [ICON_TOURISM] +15.'
WHERE Tag = 'TXT_KEY_BUILDING_CD_NATIONAL_EXHIBIT_HELP';

-- 파일 / Colonical.sql
UPDATE Language_ko_KR
SET Text = '공중 강습 레인저'
WHERE Tag = 'TXT_KEY_UNIT_BRAZILIAN_PRACINHA';

UPDATE Language_ko_KR
SET Text = '[ICON_CULTURE_JFD_COLONIAL] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_COLONIAL_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_BRAZILIAN_PRACINHA';

-- Is stronger than the Paratrooper it replaces, and starts with the [COLOR_POSITIVE_TEXT]DFPs[ENDCOLOR] Promotion usually given to Gun Units like an Infantry. Starts with the [COLOR_POSITIVE_TEXT]Survivalism I[ENDCOLOR] Promotion. Earns [ICON_GOLDEN_AGE] Golden Age Points equal to 10x the [ICON_STRENGTH] Combat Strength of defeated Enemy Units.

UPDATE Language_ko_KR
SET Text = '공중 강습 레인저는 공수부대보다 훨씬 더 강인합니다. 특히 생존주의 I과 DFPs 승급 덕분에 맷집이 훨씬 좋아졌으며, 낙하한 지점을 훨씬 효과적으로 사수할 수 있습니다. 이 유닛을 공격에 성공적으로 투입한다면 막대한 양의 황금기 점수를 보상으로 얻게 될 것입니다. 레인저가 앞장섭니다!'
WHERE Tag = 'TXT_KEY_UNIT_BRAZILIAN_PRACINHA_STRATEGY';

UPDATE Language_ko_KR
SET Text = '"레인저"라는 용어는 17세기부터 특수 정예 경보병을 묘사하는 데 사용되었습니다. 오늘날 미국의 제75레인저연대는 미국 육군 특수작전사령부(USASOC) 산하의 정예 공중강습 경보병 전투 부대입니다. 이들은 제2차 세계 대전 당시 창설된 6개 대대 중 3개 대대, 그리고 동남아시아 전선에서 활약한 "메릴의 약탈자들"로 알려진 제5307 혼성 부대의 혈통을 잇고 있습니다. 현대 레인저의 6개 대대는 한국, 베트남, 그레나다, 파나마, 아프가니스탄, 이라크 등에 투입되었습니다.[NEWLINE][NEWLINE]이와 유사하게 남미에서는 "흡연하는 코브라(Cobras Fumantes)"라는 별명을 가진 브라질 원정군이 제2차 세계 대전 지중해 전선에서 연합군의 일원으로 참전한 브라질 육군 및 공군 부대로 활약했습니다. 이들은 보병 사단, 연락 비행대, 전투기 대대를 포함하여 약 25,900명의 병력으로 구성되었습니다. 종전까지 이들은 2명의 장군과 약 900명의 장교를 포함하여 20,573명의 추축군 포로를 잡아들이는 전과를 올렸습니다.'
WHERE Tag = 'TXT_KEY_CIV5_BRAZILIAN_PRACINHA_TEXT';
/*
INSERT INTO Language_ko_KR
  (Tag, Text)
VALUES
  ('TXT_KEY_CITY_EVENT_CD_VINTAGE', '훌륭한 빈티지'),
  ('TXT_KEY_CITY_EVENT_CD_VINTAGE_HELP', '주류 산업이 충분히 정착되어 생산량의 일부를 숙성시킴으로써 더 깊고 복합적인 풍미를 만들어내기 시작했습니다.[NEWLINE][NEWLINE]인근 증류소가 [ICON_GOLD] 금과 [ICON_CULTURE] 문화을 +3씩 얻습니다. {4_GPChange}만큼 획득합니다.');
*/

-- 파일 / EastAfrican.sql
REPLACE INTO Language_ko_KR
	(Tag, Text)
SELECT
	'TXT_KEY_UNIT_CD_AGIRU_HELP', '이 유닛을 사용하려면 [ICON_CULTURE_JFD_EAST_AFRICAN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_EAST_AFRICAN_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.'
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_UNIT_HELP_WARRIOR';	

--  Starts with the [COLOR_POSITIVE_TEXT]Mobility[ENDCOLOR] Promotion, which gives it an additional [ICON_MOVES] Movement and is kept on Upgrade. Unlike the Warrior, it can Build Pastures.

UPDATE Language_ko_KR SET
Text = '[ICON_CULTURE_JFD_EAST_AFRICAN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_EAST_AFRICAN_SHORT_DESC}[ENDCOLOR] 문화 그룹의 [ICON_GREAT_MERCHANT] 위대한 상인을 대체합니다. [COLOR_MAGENTA]정책[ENDCOLOR]을 채택할 때마다 [ICON_CAPITAL] 수도에서 [ICON_GREAT_MERCHANT] 줌베 생산을 위한 진행도를 10% 획득합니다.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]읽기 쓰기 능력[ENDCOLOR], [COLOR_POSITIVE_TEXT]숙련자[ENDCOLOR], [COLOR_POSITIVE_TEXT]귀족[ENDCOLOR] 승급을 보유한 상태로 시작합니다. 줌베의 통상 사절단 임무는 기본 [ICON_GOLD] 금을 50% 더 많이 생성합니다.[NEWLINE][NEWLINE]줌베를 소모하면 제국의 모든 전략 자원이 [ICON_GOLDEN_AGE] 황금기 점수 +1을 얻고, 모든 [ICON_MERCHANT] 상인은 [ICON_FOOD] 식량 +1을 얻으며, 모든 도시는 [ICON_TOURISM] 관광 +1을 얻습니다.'
WHERE Tag = 'TXT_KEY_UNIT_CD_JUMBE_HELP';

INSERT INTO Language_ko_KR
  (Tag, Text)
VALUES
  ('TXT_KEY_JUMBE_EVENT', '오피르의 선물'),
  ('TXT_KEY_JUMBE_EVENT_HELP', '[ICON_BULLET] 제국의 전략 자원이 [ICON_GOLDEN_AGE] 황금기 점수 +1을 얻습니다.[NEWLINE][ICON_BULLET] 모든 항구가 [ICON_FOOD] 식량 +2를 얻습니다.[NEWLINE][ICON_BULLET] [ICON_CAPITAL] 수도가 [ICON_TOURISM] 관광 +3을 생산합니다.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]이 효과들은 중첩됩니다.[ENDCOLOR]');

-- 파일 / Eastern.sql
UPDATE Language_ko_KR SET
Text = '이 유닛을 사용하려면 [ICON_CULTURE_JFD_EASTERN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_EASTERN_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.'
WHERE Tag = 'TXT_KEY_UNIT_CD_VARANGIAN_HELP';

REPLACE INTO Language_ko_KR 
  (Tag, Text)
SELECT
  'TXT_KEY_BUILDING_CD_SOBOR_HELP', '[ICON_CULTURE_JFD_EASTERN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_EASTERN_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다. ' || Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_GRAND_TEMPLE_HELP';

INSERT INTO Language_ko_KR
  (Tag, Text)
VALUES
  ('TXT_KEY_THEMING_BONUS_CD_SOBOR_1', '즈나메니 성가'),
  ('TXT_KEY_THEMING_BONUS_CD_SOBOR_2', '오비코드 다성음악'),
  ('TXT_KEY_THEMING_BONUS_CD_SOBOR_3', '스티케라리온 정전'),
  ('TXT_KEY_THEMING_BONUS_CD_SOBOR_HELP', '보너스를 최대화하려면 걸작 음악 슬롯을 자신이 직접 제작하고 같은 시대에 속하는 음악 작품들로 채우십시오.');

UPDATE Language_ko_KR SET
Text = Text || '[NEWLINE]가능한 테마 보너스:
[NEWLINE][ICON_BULLET][COLOR:255:230:150:255]같은 시대[ENDCOLOR]의 [COLOR_POSITIVE_TEXT]자국[ENDCOLOR] [ICON_GW_MUSIC] 음악 작품 2개 배치 시 [ICON_CULTURE] 및 [ICON_TOURISM] +16.
[NEWLINE][ICON_BULLET][COLOR:255:230:150:255]연속된 시대[ENDCOLOR]의 [COLOR_POSITIVE_TEXT]자국[ENDCOLOR] [ICON_GW_MUSIC] 음악 작품 2개 배치 시 [ICON_CULTURE] 및 [ICON_TOURISM] +12.
[NEWLINE][ICON_BULLET][COLOR:255:230:150:255]서로 다른 시대[ENDCOLOR]의 [COLOR_POSITIVE_TEXT]자국[ENDCOLOR] [ICON_GW_MUSIC] 음악 작품 2개 배치 시 [ICON_CULTURE] 및 [ICON_TOURISM] +8.'
WHERE Tag = 'TXT_KEY_BUILDING_CD_SOBOR_HELP';

-- 파일 / EastIndies.sql
UPDATE Language_ko_KR SET
Text = '이 유닛을 사용하려면 [ICON_CULTURE_JFD_EAST_INDIES] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_EAST_INDIES_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.'
WHERE Tag = 'TXT_KEY_UNIT_CD_PENJAJAP_HELP';

--  Is faster in Coast but slower in Ocean than the Caravel it replaces. Has +1 [ICON_VISION] Sight, is Invisible to non-adjacent, non-attacked Units, and heals in Neutral Territory. Can move after attacking. Starts with the [COLOR_POSITIVE_TEXT]Navigator I[ENDCOLOR] Promotion. 

REPLACE INTO Language_ko_KR 
	(Tag, Text)
SELECT
	'TXT_KEY_BUILDING_CD_PALM_MILL_HELP', '[ICON_CULTURE_JFD_EAST_INDIES] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_EAST_INDIES_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다. ' || Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_REFINERY_HELP';

--UPDATE Language_ko_KR SET
--Text = Text || ' Requires a nearby Jungle.'
--WHERE Tag = 'TXT_KEY_BUILDING_CD_PALM_MILL_HELP';

-- 파일 / FarEastern.sql
REPLACE INTO Language_ko_KR 
	(Tag, Text)
SELECT
	'이 유닛을 사용하려면 [ICON_CULTURE_JFD_FAR_EASTERN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_FAR_EASTERN_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.'
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_UNIT_HELP_RIFLEMAN';

-- Is cheaper than the Rifleman it replaces. Can build Roads, Farms, Pastures, and Repair like a [ICON_WORKER] Worker. Founds new Cities with advanced infrastructure and additional [ICON_CITIZEN] Population.

--[NEWLINE][NEWLINE]The [ICON_FOOD] Growth of the City is stopped while this Unit is being Trained. Reduces the City''s [ICON_CITIZEN] Population by 1 when completed.

REPLACE INTO Language_ko_KR 
	(Tag, Text)
SELECT
	'TXT_KEY_BUILDING_CD_KARAOKE_LOUNGE_HELP', '[ICON_CULTURE_JFD_FAR_EASTERN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_FAR_EASTERN_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다. ' || Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_STADIUM_HELP';

-- 파일 / GreatPlains.sql
UPDATE Language_ko_KR SET
Text = '[COLOR_POSITIVE_TEXT]우군 영토[ENDCOLOR]에서 [ICON_STRENGTH] 전투력이 15% 증가합니다.[NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]유닛 업그레이드 시 사라집니다[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_PROMOTION_HOMELAND_GUARDIAN_BOOGALOO_HELP';

REPLACE INTO Language_ko_KR 
	(Tag, Text)
SELECT
	'이 유닛을 사용하려면 [ICON_CULTURE_JFD_GREAT_PLAINS] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_GREAT_PLAINS_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.'
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_UNIT_HELP_COMMANDO_CBP';	

-- Is stronger than the Commando that it replaces. Starts with the [COLOR_POSITIVE_TEXT]Scouting I[ENDCOLOR], and [COLOR_POSITIVE_TEXT]Scouting II[ENDCOLOR] Promotions. Fights with +15% [ICON_STRENGTH] Combat Strength in [COLOR_POSITIVE_TEXT]Friendly Territory[ENDCOLOR]. 

REPLACE INTO Language_ko_KR 
  (Tag, Text)
SELECT
  'TXT_KEY_BUILDING_CD_SUN_DANCE_HELP', '[ICON_CULTURE_JFD_GREAT_PLAINS] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_GREAT_PLAINS_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다. ' || Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_CIRCUS_MAXIMUS_HELP';

-- All Cities generate +25% [ICON_CULTURE_LOCAL] Border Growth Points. Melee, Gun, and Recon Units born in this City start with the [COLOR_POSITIVE_TEXT]Sun Dancer[ENDCOLOR] Promotion. Completing a Public Works Project in this City starts 20 turns of "We Love the King Day".[NEWLINE][NEWLINE]

UPDATE Language_ko_KR SET
Text = Replace(Text, '골드 +2를 얻습니다.', '골드 +2를 얻으며 모든 서커스에서 신앙 +3을 얻습니다.[NEWLINE][NEWLINE]모든 도시의 [ICON_CULTURE_LOCAL] 국경 확장 속도가 25% 증가합니다. 이 도시에서 생산된 근접, 화약, 정찰 유닛은 [COLOR_POSITIVE_TEXT]태양의 춤꾼[ENDCOLOR] 승급을 얻습니다. 이 도시에서 공공 시설 프로젝트를 완료하면 20턴 동안 "왕의 날"이 시작됩니다.')
WHERE Tag = 'TXT_KEY_BUILDING_CD_SUN_DANCE_HELP';

-- 파일 / Iberian.sql
INSERT INTO Language_ko_KR
	(Tag, Text)
VALUES
	('TXT_KEY_INTERNATIONAL_BRIGADE_EVENT', '인민전선'),
	('TXT_KEY_INTERNATIONAL_BRIGADE_EVENT_HELP', '수도에서 [COLOR_POSITIVE_TEXT]무료[ENDCOLOR] 국제여단 6개를 획득합니다.');
	
UPDATE Language_ko_KR
SET Text = Replace(Text, '이 타일을 통해.', '이 타일을 통해, 그리고 [COLOR_POSITIVE_TEXT]요새[ENDCOLOR]를 통해, 소유한 유닛이 공격 후 이 타일에 주둔할 수 있습니다.')
WHERE Tag = 'TXT_KEY_CIV5_IMPROVEMENTS_FEITORIA_HELP';

UPDATE Language_ko_KR
SET Text = Replace(Text, '이 타일을 통해.', '이 타일을 통해, 그리고 [COLOR_POSITIVE_TEXT]요새[ENDCOLOR]를 통해, 소유한 유닛이 공격 후 이 타일에 주둔할 수 있습니다.')
WHERE Tag = 'TXT_KEY_BUILD_FEITORIA_HELP';

-- 파일 / Himalayan.sql
UPDATE Language_ko_KR SET
Text = '이 유닛을 사용하려면 [ICON_CULTURE_JFD_HIMALAYAN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_HIMALAYAN_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.[NEWLINE][ICON_PEACE] 신앙으로 구매할 수 있습니다.'
WHERE Tag = 'TXT_KEY_UNIT_CD_DAPON_HELP';

--   Is stronger than the Composite Bowman it replaces. Starts with the [COLOR_POSITIVE_TEXT]Kha Shed[ENDCOLOR] Promotion, which increases strength for every adjacent friendly Archery Unit, and earns [ICON_TOURISM] Tourism when gaining XP.[NEWLINE]

-- 파일 / Mandala.sql
REPLACE INTO Language_ko_KR 
	(Tag, Text)
SELECT
	'이 유닛을 사용하려면 [ICON_CULTURE_JFD_INDOCHINA] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_INDOCHINA_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.'
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_UNIT_HELP_TRIREME';

--  Is stronger and more expensive than the Trireme it replaces. Has an Exotic Cargo that it can sell when adjacent to a foreign tile, earning up to 400 [ICON_GOLD] Gold and 30 XP scaling with the distance from your [ICON_CAPITAL] Capital. When a Boita is disbanded or upgraded, receive [ICON_CULTURE] Culture equal to its total XP.

REPLACE INTO Language_ko_KR 
  (Tag, Text)
SELECT
  'TXT_KEY_BUILDING_CD_FLOATING_MARKET_HELP', '[ICON_CULTURE_JFD_INDOCHINA] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_INDOCHINA_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.' || Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_MARKET_HELP';

UPDATE Language_ko_KR SET
Text = Replace(Text, '문화 그룹이 필요합니다. ', '문화 그룹이 필요합니다. 강에 인접한 모든 타일에서 [ICON_GOLD] 골드 +1을 얻습니다. 호수 타일은 [ICON_GOLD] 골드 +1을 생산합니다. 이 도시에서 출발하는 내부 식량 [ICON_INTERNATIONAL_TRADE] 교역로는 [ICON_FOOD] 식량 +4를 추가로 생성합니다.[NEWLINE][NEWLINE]')
WHERE Tag = 'TXT_KEY_BUILDING_CD_FLOATING_MARKET_HELP';

-- 파일 / Mesoamerican.sql
UPDATE Language_ko_KR SET
Text = '이 유닛을 사용하려면 [ICON_CULTURE_JFD_MESOAMERICAN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_MESOAMERICAN_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.[NEWLINE][ICON_PEACE] 신앙으로 구매할 수 있습니다.'
WHERE Tag = 'TXT_KEY_UNIT_CD_CRUZOB_HELP';

-- Is slightly weaker than the Commando it replaces but starts with the [COLOR_POSITIVE_TEXT]Shock I[ENDCOLOR], [COLOR_POSITIVE_TEXT]II[ENDCOLOR], and [COLOR_POSITIVE_TEXT]III[ENDCOLOR] Promotions.[NEWLINE] Can move immediately after being purchased.[NEWLINE][NEWLINE]Cruzob stationed in Cities reduce foreign Missionary and Prophet spread power by 50%.

REPLACE INTO Language_ko_KR 
  (Tag, Text)
SELECT
  'TXT_KEY_BUILDING_CD_MILPA_HELP', '[ICON_CULTURE_JFD_MESOAMERICAN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_MESOAMERICAN_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다. ' || Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_AGRIBUSINESS_HELP';

UPDATE Language_ko_KR SET
Text = Replace(Text, '[ICON_PRODUCTION] 생산력 및 [ICON_GOLD] 골드', '[ICON_PRODUCTION] 생산력, [ICON_GOLD] 골드, [ICON_CULTURE] 문화 및 [ICON_PEACE] 신앙')
WHERE Tag = 'TXT_KEY_BUILDING_CD_MILPA_HELP';

-- 파일 / Mesopotamic.sql
REPLACE INTO Language_ko_KR 
	(Tag, Text)
SELECT
	'TXT_KEY_UNIT_CD_IRAQ_LEVY_HELP', '이 유닛을 사용하려면 [ICON_CULTURE_CD_CRESCENT] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_MESOPOTAMIC_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.'
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_UNIT_HELP_RIFLEMAN';			

--  대체하는 라이플병보다 약간 저렴합니다. [COLOR:255:230:150:255]부족 분과[ENDCOLOR] 승급을 보유하여 [COLOR_POSITIVE_TEXT]사막[ENDCOLOR] 타일에서 지형 비용을 무시하고 회복량이 두 배가 되며, [COLOR_POSITIVE_TEXT]강[ENDCOLOR]을 건너 공격할 때의 페널티가 없고 강을 따라 이동할 때 [ICON_MOVES] 이동력이 두 배가 됩니다.[NEWLINE][NEWLINE]이 유닛을 훈련하는 동안 도시의 [ICON_FOOD] 성장이 정지됩니다. 유닛이 완성되면 도시의 [ICON_CITIZEN] 인구가 1 감소합니다.'

REPLACE INTO Language_ko_KR 
	(Tag, Text)
SELECT
	'TXT_KEY_BUILDING_CD_ARCH_PARK_HELP', '[ICON_CULTURE_CD_CRESCENT] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_MESOPOTAMIC_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.'

UPDATE Language_ko_KR SET
Text = Text || '[NEWLINE]가능한 테마 보너스:
  [NEWLINE][ICON_BULLET] [COLOR:255:230:150:255]같은 시대[ENDCOLOR]의 [COLOR_POSITIVE_TEXT]자국[ENDCOLOR] [ICON_GW_ART] 예술품 2개: [ICON_CULTURE] 및 [ICON_TOURISM] +10.
  [NEWLINE][ICON_BULLET] [COLOR:255:230:150:255]같은 시대[ENDCOLOR]의 [COLOR_POSITIVE_TEXT]자국[ENDCOLOR] [ICON_ARTIFACT] 유물 2개: [ICON_CULTURE] 및 [ICON_TOURISM] +20.
  [NEWLINE][ICON_BULLET] [COLOR:255:230:150:255]같은 시대[ENDCOLOR]의 [COLOR_POSITIVE_TEXT]자국[ENDCOLOR] 예술품 1개와 유물 1개 쌍: [ICON_CULTURE] 및 [ICON_TOURISM] +12.
  [NEWLINE][ICON_BULLET] 시대와 상관없는 [COLOR_POSITIVE_TEXT]자국[ENDCOLOR] [ICON_GW_ART] 예술품 2개: [ICON_CULTURE] 및 [ICON_TOURISM] +8.
  [NEWLINE][ICON_BULLET] 시대와 상관없는 [COLOR_POSITIVE_TEXT]자국[ENDCOLOR] [ICON_ARTIFACT] 유물 2개: [ICON_CULTURE] 및 [ICON_TOURISM] +16.
  [NEWLINE]위의 모든 보너스는 [COLOR_POSITIVE_TEXT]외국[ENDCOLOR] 걸작일 경우 [COLOR_NEGATIVE_TEXT]절반[ENDCOLOR]의 수치로 적용됩니다.'
WHERE Tag = 'TXT_KEY_BUILDING_CD_ARCH_PARK_HELP';

--   [NEWLINE][ICON_BULLET] +5 [ICON_CULTURE] and [ICON_TOURISM] for two [COLOR_POSITIVE_TEXT]Foreign[ENDCOLOR] [ICON_GW_ART] Great Works of Art from the [COLOR_CYAN]same Era[ENDCOLOR].
--  [NEWLINE][ICON_BULLET] +10 [ICON_CULTURE] and [ICON_TOURISM] for two [COLOR_POSITIVE_TEXT]Foreign[ENDCOLOR] [ICON_ARTIFACT] Artifacts from the [COLOR_CYAN]same Era[ENDCOLOR].
--  [NEWLINE][ICON_BULLET] +4 [ICON_CULTURE] and [ICON_TOURISM] for a pair of [COLOR_POSITIVE_TEXT]Foreign[ENDCOLOR] one [ICON_GW_ART] Great Work of Art and an [ICON_ARTIFACT] Artifact from the [COLOR_CYAN]same Era[ENDCOLOR].
--  [NEWLINE][ICON_BULLET] +4 [ICON_CULTURE] and [ICON_TOURISM] for two [COLOR_POSITIVE_TEXT]Foreign[ENDCOLOR] [ICON_GW_ART] Great Works of Art.
--  [NEWLINE][ICON_BULLET] +8 [ICON_CULTURE] and [ICON_TOURISM] for two [COLOR_POSITIVE_TEXT]Foreign[ENDCOLOR] [ICON_ARTIFACT] Artifacts.

-- 파일 / MidEastern.sql
REPLACE INTO Language_ko_KR 
	(Tag, Text)
SELECT
	'TXT_KEY_UNIT_CD_BAGHLAH_HELP', '이 유닛을 사용하려면 [ICON_CULTURE_JFD_MID_EASTERN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_MID_EASTERN_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.'
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_UNIT_HELP_CARAVEL';		

--  대체하는 캐러밸보다 약간 더 강력하며 공격 후 이동할 수 있습니다. [COLOR_POSITIVE_TEXT]해적질[ENDCOLOR] 승급을 보유한 상태로 시작하여, 적 유닛을 처치하거나 도시를 공격할 때 [ICON_GOLD] 금을 획득합니다.'

REPLACE INTO Language_ko_KR 
	(Tag, Text)
SELECT
	'TXT_KEY_BUILDING_CD_PETROCHEMICAL_PLANT_HELP', '[ICON_CULTURE_JFD_MID_EASTERN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_MID_EASTERN_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.'

-- 파일 / Oceanic.sql
REPLACE INTO Language_ko_KR 
	(Tag, Text)
SELECT
	'TXT_KEY_UNIT_CD_KAIMILOA_HELP', '이 유닛을 사용하려면 [ICON_CULTURE_JFD_OCEANIC] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_OCEANIC_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.[NEWLINE]첫 번째 카이미로아를 획득하면 20턴 동안 모든 [ICON_MUSICIAN] 음악가가 [ICON_GREAT_ADMIRAL] 위대한 제독 점수를 +2 생성합니다.';

INSERT INTO Language_ko_KR
	(Tag, Text)
VALUES
	('TXT_KEY_KAIMILOA_EVENT', '멀리 찾는 자'),
	('TXT_KEY_KAIMILOA_EVENT_HELP', '선원들을 훈련하는 과정에서 음악적 소질이 있는 젊은이들을 이례적으로 많이 징집했습니다. 이들은 인상적인 군악대를 결성했습니다.[NEWLINE][NEWLINE]향후 {4_Turns} 동안 모든 [ICON_MUSICIAN] 음악가가 [ICON_GREAT_ADMIRAL] 위대한 제독 점수를 +2 생성합니다.');

REPLACE INTO Language_ko_KR 
	(Tag, Text)
SELECT
	'TXT_KEY_BUILDING_CD_FAIKAVA_HELP', '[ICON_CULTURE_JFD_OCEANIC] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_OCEANIC_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.'

-- 파일 / Pacific.sql
REPLACE INTO Language_ko_KR 
	(Tag, Text)
SELECT
	'TXT_KEY_UNIT_CD_TXATKUNEEXS_HELP', '이 유닛을 사용하려면 [ICON_CULTURE_JFD_PACIFIC] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_PACIFIC_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.'
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_UNIT_HELP_SPEARMAN';	

-- 대체하는 창병보다 강력하며, 소모되지 않고 해상 자원을 개발할 수 있습니다. [COLOR_POSITIVE_TEXT]수륙양용[ENDCOLOR] 승급과 [COLOR_POSITIVE_TEXT]불꽃바늘 연고[ENDCOLOR] 승급을 보유하여 [COLOR_YELLOW]중립[ENDCOLOR] 및 [COLOR_NEGATIVE_TEXT]적대[ENDCOLOR] 영토에서 더 많이 회복할 수 있습니다.'

REPLACE INTO Language_ko_KR 
  (Tag, Text)
SELECT
  'TXT_KEY_BUILDING_CD_POTLATCH_HOUSE_HELP', '[ICON_CULTURE_JFD_PACIFIC] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_PACIFIC_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다. ' || Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_CIRCUS_HELP';

INSERT INTO Language_ko_KR
  (Tag, Text)
VALUES
  ('TXT_KEY_CITY_EVENT_POTLATCH', '포틀래치 의식'),
  ('TXT_KEY_CITY_EVENT_POTLATCH_HELP', '부유한 가문이 포틀래치 하우스에서 호화로운 모임을 주최했습니다. {2_InstantYield} 및 [ICON_DIPLOMAT] 위대한 외교관 점수를 획득합니다.');

UPDATE Language_ko_KR SET
Text = Text || '[NEWLINE]50턴마다 50 [ICON_GOLD] 금을 [COLOR_NEGATIVE_TEXT]소모[ENDCOLOR]하여 50 [ICON_CULTURE] 문화, 25 [ICON_GOLDEN_AGE] 황금기 점수 및 [ICON_DIPLOMAT] 위대한 외교관 점수를 획득합니다. (시대에 비례)'
WHERE Tag = 'TXT_KEY_BUILDING_CD_POTLATCH_HOUSE_HELP';

-- 파일 / Patagonian.sql
REPLACE INTO Language_ko_KR 
	(Tag, Text)
SELECT
	'TXT_KEY_UNIT_CD_BOLAS_RIDER_HELP', '이 유닛을 사용하려면 [ICON_CULTURE_CD_PATAGONIAN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_CD_PATAGONIAN_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.'
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_UNIT_CUIRASSIER_HELP';	

UPDATE Language_ko_KR SET
Text = '[ICON_CULTURE_CD_PATAGONIAN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_CD_PATAGONIAN_SHORT_DESC}[ENDCOLOR] 문화 그룹의 [ICON_PROPHET] 위대한 예연자를 대체합니다.[NEWLINE]위대한 예언자의 일반적인 능력 외에도, 손(Xon)을 소모하면 제국 전체에 적용되는 7가지 고유 보너스 중 다음 단계를 순차적으로 활성화합니다.'
WHERE Tag = 'TXT_KEY_UNIT_CD_XON_HELP';

INSERT INTO Language_ko_KR
	(Tag, Text)
VALUES
	('TXT_KEY_XON_EVENT', '내세(The Next World)'),
	('TXT_KEY_XON_EVENT_HELP', '우리 손(xon)의 육신은 평온히 누워 있으나, 그 영혼은 경이로운 업적을 이루기 위해 여행 중입니다. 그는 떠나기 전 우리 백성에게 새로운 세상에서 살아가는 꿈에 대해 이야기했습니다. 이 환상은 우리에게 가르침을 줍니다. 이제 행동합시다.'),

	('TXT_KEY_EVENT_XON_CHOICE_1', '[ICON_CULTURE_LOCAL] 새로운 땅의 꿈을 따름'),
	('TXT_KEY_EVENT_XON_CHOICE_1_HELP', '제국 내 모든 지형 특성에서 [ICON_CULTURE_LOCAL] 국경 확장 점수를 +1 얻으며, 자연경관의 경우 +5를 얻습니다.[NEWLINE]제국 내 성지 타일에서 [ICON_CULTURE] 문화 +2를 얻습니다.'),

	('TXT_KEY_EVENT_XON_CHOICE_2', '[ICON_PRODUCTION] 고향의 꿈을 건설함'),
	('TXT_KEY_EVENT_XON_CHOICE_2_HELP', '제국 내 모든 사원의 [ICON_PRODUCTION] 생산력이 10% 증가합니다.[NEWLINE]제국 내 성지 타일에서 [ICON_PRODUCTION] 생산력 +2를 얻습니다.'),

	('TXT_KEY_EVENT_XON_CHOICE_3', '[ICON_FOOD] 사냥의 꿈을 쫓음'),
	('TXT_KEY_EVENT_XON_CHOICE_3_HELP', '제국 내 모든 보너스 자원에서 [ICON_FOOD] 식량 +1을 얻습니다.[NEWLINE]제국 내 성지 타일에서 [ICON_FOOD] 식량 +3을 얻습니다.'),

	('TXT_KEY_EVENT_XON_CHOICE_4', '[ICON_GREAT_GENERAL] 전쟁의 꿈에 맞섬'),
	('TXT_KEY_EVENT_XON_CHOICE_4_HELP', '모든 근접 및 화약 유닛이 [COLOR_POSITIVE_TEXT]꿈의 전사[ENDCOLOR] 승급을 획득하여, 피해를 입었을 때와 성지 근처에서 더 강력하게 싸웁니다.[NEWLINE]제국 내 성지 타일에서 [ICON_GREAT_GENERAL] 위대한 장군 점수 +1을 얻습니다.'),

	('TXT_KEY_EVENT_XON_CHOICE_5', '[ICON_TOURISM] 치유의 꿈을 수용함'),
	('TXT_KEY_EVENT_XON_CHOICE_5_HELP', '기갑을 제외한 모든 지상 유닛이 [COLOR_POSITIVE_TEXT]생명의 파동[ENDCOLOR] 승급을 획득하여, [COLOR_POSITIVE_TEXT]평원[ENDCOLOR] 타일에서 회복량이 두 배가 됩니다.[NEWLINE]제국 내 성지 타일에서 [ICON_PEACE] 신앙 +3을 얻습니다.'),

	('TXT_KEY_EVENT_XON_CHOICE_6', '[ICON_RESEARCH] 각성의 꿈을 받아들임'),
	('TXT_KEY_EVENT_XON_CHOICE_6_HELP', '모든 전문가가 [ICON_RESEARCH] 과학 +1을 얻습니다.[NEWLINE]제국 내 성지 타일에서 [ICON_RESEARCH] 과학 +4를 얻습니다.'),

	('TXT_KEY_EVENT_XON_CHOICE_7', '[ICON_GOLD_AGE] 내세로 향하는 길을 찾음'),
	('TXT_KEY_EVENT_XON_CHOICE_7_HELP', '[ICON_GOLDEN_AGE] 황금기가 시작됩니다.[NEWLINE]제국 내 성지 타일에서 [ICON_GOLDEN_AGE] 황금기 점수 +5를 얻습니다.');

UPDATE Language_ko_KR SET
Text = Text || '[NEWLINE][NEWLINE]보너스는 다음과 같은 방식으로 잠금 해제:[NEWLINE][ICON_BULLET]{TXT_KEY_EVENT_XON_CHOICE_1_HELP}[NEWLINE][ICON_BULLET]{TXT_KEY_EVENT_XON_CHOICE_2_HELP}[NEWLINE][ICON_BULLET]{TXT_KEY_EVENT_XON_CHOICE_3_HELP}[NEWLINE][ICON_BULLET]{TXT_KEY_EVENT_XON_CHOICE_4_HELP}[NEWLINE][ICON_BULLET]{TXT_KEY_EVENT_XON_CHOICE_5_HELP}[NEWLINE][ICON_BULLET]{TXT_KEY_EVENT_XON_CHOICE_6_HELP}[NEWLINE][ICON_BULLET]{TXT_KEY_EVENT_XON_CHOICE_7_HELP}'
WHERE Tag = 'TXT_KEY_UNIT_CD_XON_STRATEGY';

-- 파일 / Polar.sql
REPLACE INTO Language_ko_KR 
	(Tag, Text)
SELECT
	'TXT_KEY_UNIT_CD_UMIAK_HELP', '이 유닛을 사용하려면 [ICON_CULTURE_JFD_POLAR] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_POLAR_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.[NEWLINE][ICON_GREAT_ADMIRAL] 위대한 제독처럼 항구를 이동할 수 있습니다.'
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_UNIT_CD_UMIAK_HELP';	

-- 소모되지 않고 [COLOR_POSITIVE_TEXT]해상 자원[ENDCOLOR]을 개발할 수 있으며, [COLOR_POSITIVE_TEXT]빙하[ENDCOLOR] 타일에 진입할 수 있습니다. 정찰을 통해 가장 가까운 도시에 [ICON_FOOD] 식량을 제공합니다. 정찰 시 XP를 획득하는 [COLOR_POSITIVE_TEXT]정찰[ENDCOLOR] 승급을 보유한 상태로 시작합니다.'

-- 파일 / Saharan.sql
UPDATE Language_ko_KR SET
Text = '이 유닛을 사용하려면 [ICON_CULTURE_JFD_WEST_AFRICAN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_WEST_AFRICAN_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.'
WHERE Tag = 'TXT_KEY_UNIT_CD_MOUKAHLA_HELP';

-- 대체하는 전열보병보다 약간 더 강력합니다. [COLOR_POSITIVE_TEXT]사막 전사[ENDCOLOR] 승급을 보유하여 [COLOR_POSITIVE_TEXT]사막[ENDCOLOR] 타일에서 전투력이 증가하며, [COLOR_POSITIVE_TEXT]페잔 약탈자[ENDCOLOR] 승급을 통해 사막에서 [ICON_MOVES] 이동력이 두 배가 되고 도시로부터 받는 피해가 감소하며 도시를 공격할 때 입힌 피해만큼 [ICON_GOLD] 금을 훔쳐옵니다.'

UPDATE Language_ko_KR SET
Text = '이 유닛을 사용하려면 [ICON_CULTURE_JFD_WEST_AFRICAN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_WEST_AFRICAN_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.[NEWLINE]이 유닛으로 무역 임무를 수행하면 [ICON_INFLUENCE] 영향력뿐만 아니라 100 [ICON_GOLD] 금을 추가로 획득합니다.'
WHERE Tag = 'TXT_KEY_UNIT_CD_WANGARA_TRADER_HELP';

-- [COLOR_POSITIVE_TEXT]{TXT_KEY_PROMOTION_CD_WANGARA}[ENDCOLOR] 승급을 보유하여 [COLOR_POSITIVE_TEXT]사막[ENDCOLOR]에서 [ICON_MOVES] 이동력이 두 배가 되며, 무역 임무 수행 시 20 [ICON_CULTURE] 문화와 [ICON_TOURISM] 관광을 일시불로 획득합니다.'

-- 파일 / Scandinavian.sql
REPLACE INTO Language_ko_KR 
	(Tag, Text)
SELECT
	'TXT_KEY_UNIT_CD_VIKING_HELP', '이 유닛을 사용하려면 [ICON_CULTURE_CD_SCANDINAVIAN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_NORTHERN_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.'
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_UNIT_HELP_PIONEER';

-- 진보된 기반 시설과 추가 [ICON_CITIZEN] 인구를 가진 새로운 도시를 건설합니다. 대체하는 개척자(Pioneer)와 달리 상당한 [ICON_STRENGTH] 전투력을 보유하고 있으며, 즉시 [COLOR_POSITIVE_TEXT]대양[ENDCOLOR]을 건널 수 있습니다.[NEWLINE][NEWLINE]이 유닛을 훈련하는 동안 도시의 [ICON_FOOD] 성장이 정지됩니다. 유닛이 완성되면 도시의 [ICON_CITIZEN] 인구가 1 감소합니다.'

REPLACE INTO Language_ko_KR 
	(Tag, Text)
SELECT
	'TXT_KEY_BUILDING_CD_MEAD_HALL_HELP', '[ICON_CULTURE_CD_SCANDINAVIAN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_NORTHERN_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다. ' || Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_COLOSSEUM_HELP';

UPDATE Language_ko_KR SET
Text = Text || '[NEWLINE]인근의 [ICON_RES_RICE] 쌀, [ICON_RES_MAIZE] 옥수수, [ICON_RES_WHEAT] 밀에서 [ICON_GOLDEN_AGE] 황금기 점수 +1을 얻습니다.'
WHERE Tag = 'TXT_KEY_BUILDING_CD_MEAD_HALL_HELP';

-- 파일 / Southern.sql
REPLACE INTO Language_ko_KR 
	(Tag, Text)
SELECT
	'TXT_KEY_UNIT_CD_MAHAROLUKTI_HELP', '이 유닛을 사용하려면 [ICON_CULTURE_JFD_SOUTHERN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_SOUTHERN_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.[NEWLINE][ICON_GOLD] 금 또는 [ICON_PEACE] 신앙으로만 구매할 수 있습니다.'
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_UNIT_HELP_KNIGHT';	

-- 대체하는 중기병보다 약간 더 강력합니다. [COLOR_POSITIVE_TEXT]매복 I[ENDCOLOR] 및 [COLOR_POSITIVE_TEXT]매복 II[ENDCOLOR] 승급을 보유하여 [COLOR_POSITIVE_TEXT]험지[ENDCOLOR] 공격 시 유리합니다. 또한 [COLOR_POSITIVE_TEXT]자크마르야(Gjakmarrja)[ENDCOLOR] 승급을 통해 적 처치 시 [ICON_GOLD] 금과 [ICON_CULTURE] 문화를 획득하며 체력을 30 회복합니다.'

REPLACE INTO Language_ko_KR 
	(Tag, Text)
SELECT
	'TXT_KEY_BUILDING_CD_BANCO_DEI_CAMBI_HELP', '[ICON_CULTURE_JFD_SOUTHERN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_SOUTHERN_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.'

-- 파일 / Steppe.sql

-- [COLOR_CYAN]르네상스 시대[ENDCOLOR] 이후에 탄생하면 [COLOR_POSITIVE_TEXT]밍간(Mingghan)[ENDCOLOR] 승급을 얻으며, [COLOR_CYAN]원자력 시대[ENDCOLOR] 이후에는 [COLOR_POSITIVE_TEXT]장갑 보강 I[ENDCOLOR] 및 [COLOR_POSITIVE_TEXT]기동성[ENDCOLOR] 승급을 얻고 기갑 유닛으로 취급됩니다.'

UPDATE Language_ko_KR SET
Text = '이 유닛을 사용하려면 [ICON_CULTURE_JFD_STEPPE] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_STEPPE_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.[NEWLINE][ICON_PRODUCTION] 생산력을 통해서만 훈련할 수 있습니다.'
WHERE Tag = 'TXT_KEY_UNIT_CD_BAGHATUR_HELP';

REPLACE INTO Language_ko_KR 
  (Tag, Text)
SELECT
  'TXT_KEY_BUILDING_CD_BOKH_PLAZA_HELP', '[ICON_CULTURE_JFD_STEPPE] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_STEPPE_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다. ' || Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_HOTEL_HELP';

-- 파일 / WestAfrican.sql
REPLACE INTO Language_ko_KR 
	(Tag, Text)
SELECT
	'TXT_KEY_UNIT_CD_GOLEYO_HELP','이 유닛을 사용하려면 [ICON_CULTURE_JFD_CENTRAL_AFRICAN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_CENTRAL_AFRICAN_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.'
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_UNIT_HELP_CHARIOR_ARCHER';	

-- 대체하는 전차 궁수보다 [ICON_RANGE_STRENGTH] 원거리 공격력은 낮지만 [ICON_STRENGTH] 전투력은 훨씬 높습니다. 전차 궁수와 달리 지형 페널티를 받지 않으며 [ICON_RES_HORSE] 전략 자원(말)이 필요하지 않습니다. [COLOR_POSITIVE_TEXT]숲의 지킴이[ENDCOLOR] 승급을 보유한 상태로 시작합니다.'

REPLACE INTO Language_ko_KR 
	(Tag, Text)
SELECT
	'TXT_KEY_UNIT_CD_DJELI_HELP', '이 유닛을 사용하려면 [ICON_CULTURE_JFD_CENTRAL_AFRICAN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_CENTRAL_AFRICAN_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다. 적 유닛을 처치할 때마다 [ICON_CAPITAL] 수도에서 다음 [ICON_GREAT_MUSICIAN] 젤리(Djeli) 탄생에 필요한 점수의 2%를 획득합니다. 젤리를 소모하면 15 턴 동안 모든 [ICON_GREAT_WORK] 걸작에 [ICON_CULTURE] 문화 +3, 모든 국가 불가사의에 [ICON_PEACE] 신앙 +2, 그리고 모든 [ICON_MUSICIAN] 음악가 및 음악가 길드에 [ICON_TOURISM] 관광 +5 보너스를 부여합니다.'
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_UNIT_HELP_WARRIOR';	

INSERT INTO Language_ko_KR
  (Tag, Text)
VALUES
  ('TXT_KEY_DJELI_EVENT', '음유시인의 영감'),
  ('TXT_KEY_DJELI_EVENT_HELP', '향후 {4_Turns} 동안:[NEWLINE][ICON_BULLET] 모든 [ICON_MUSICIAN] 음악가 및 음악가 길드에서 [ICON_TOURISM] 관광 +5를 생성합니다.[NEWLINE][ICON_BULLET] 모든 [ICON_GREAT_WORK] 걸작에서 [ICON_CULTURE] 문화 +3을 얻습니다.[NEWLINE][ICON_BULLET] 모든 국가 불가사의에서 [ICON_PEACE] 신앙 +2를 생산합니다.[NEWLINE][NEWLINE]추가로 활성화하면 지속 시간이 연장됩니다.');

-- 파일 / Western.sql

--UPDATE Language_en_US SET
--Text = Replace(Text, 'Ship of the Line', 'Man-of-War')
--WHERE Tag = 'TXT_KEY_UNIT_ENGLISH_SHIPOFTHELINE';

UPDATE Language_ko_KR SET
Text = '이 유닛을 사용하려면 [ICON_CULTURE_JFD_WESTERN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_WESTERN_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_SHIPOFTHELINE';

UPDATE Language_ko_KR SET
Text = Replace(Text, '{TXT_KEY_UNIT_ENGLISH_SHIPOFTHELINE}은 영국의 고유 유닛으로, {TXT_KEY_UNIT_FRIGATE}를 대체합니다.', '{TXT_KEY_UNIT_ENGLISH_SHIPOFTHELINE}은 [ICON_CULTURE_JFD_WESTERN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_WESTERN_SHORT_DESC}[ENDCOLOR] 문화권의 고유 유닛으로, {TXT_KEY_UNIT_FRIGATE}를 대체합니다.')
WHERE Tag = 'TXT_KEY_UNIT_ENGLISH_SHIPOFTHELINE_STRATEGY';

UPDATE Language_ko_KR SET
Text = '{TXT_KEY_BUILDING_IRONWORKS}를 대체하는 카르타고의 고유 건물입니다. {TXT_KEY_BUILDING_IRONWORKS}의 모든 보너스에 더해, {TXT_KEY_BUILDING_GREAT_COTHON}은 다음과 같은 혜택을 제공합니다: 모든 해안 도시의 {TXT_KEY_BUILDING_HARBOR} 무료 제공, 추가 [ICON_INTERNATIONAL_TRADE] 교역로 2개 확보, 교역로의 기점과 종점 도시에 추가 [ICON_GOLD] 금 제공 및 건설된 도시의 빈곤(Poverty) 수치 감소, 제국 내 모든 등대와 항만 시설 강화 등이 있습니다. {TXT_KEY_BUILDING_IRONWORKS}와 달리 [COLOR_CYAN]고전 시대[ENDCOLOR]의 [COLOR_CYAN]{TXT_KEY_TECH_CURRENCY_TITLE}[ENDCOLOR] 연구 시 해제됩니다. 별도의 건물 요구 조건은 없으나 반드시 해안 도시에만 건설할 수 있습니다.'
WHERE Tag = 'TXT_KEY_BUILDING_GREAT_COTHON_STRATEGY';

REPLACE INTO Language_ko_KR 
  (Tag, Text)
SELECT
  'TXT_KEY_BUILDING_CD_EAST_INDIA_HELP', '[ICON_CULTURE_JFD_WESTERN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_WESTERN_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다. ' || Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_NATIONAL_TREASURY_HELP';

-- 파일 / Woodnlands.sql
REPLACE INTO Language_ko_KR 
	(Tag, Text)
SELECT
	'TXT_KEY_UNIT_CD_MAHAROLUKTI_HELP', '이 유닛을 사용하려면 [ICON_CULTURE_JFD_WOODLANDS] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_WOODLANDS_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.'
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_UNIT_HELP_KNIGHT';	

-- 대체하는 기병 및 기사와 달리 속도가 느리고 [ICON_RES_HORSE] 전략 자원(말)이 필요하지 않습니다. 방어 보너스를 받을 수 있지만, 승급 계산 시에는 여전히 기갑 유닛으로 취급됩니다. [COLOR_POSITIVE_TEXT]스톰프 댄스(Stomp Dance)[ENDCOLOR] 승급을 보유하여 강 근처에서 전투력과 이동력이 크게 상승하며, 획득한 경험치에 비례해 [ICON_INFLUENCE] 영향력을 얻습니다.[NEWLINE][NEWLINE]두 기병 유닛을 모두 대체하기 위해 시대에 따라 [ICON_STRENGTH] 전투력과 [ICON_PRODUCTION] 생산 비용이 증가합니다. 고전 시대에 +3 [ICON_STRENGTH]/+35 [ICON_PRODUCTION], 중세 시대에 추가로 +7 [ICON_STRENGTH]/+35 [ICON_PRODUCTION] 보너스를 얻습니다.'

REPLACE INTO Language_ko_KR 
  (Tag, Text)
SELECT
  'TXT_KEY_BUILDING_CD_BAGGATAWAY_HELP', '[ICON_CULTURE_JFD_WOODLANDS] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_WOODLANDS_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다. ' || Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_THEATRE_HELP';

-- 파일 / reindeer_camp.sql
UPDATE Language_ko_KR SET
Text = Text || '[NEWLINE]인근의 [ICON_RES_REINDEER] 순록: [ICON_FOOD] 식량 +1.'
WHERE Tag IN (SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_SMOKEHOUSE');

-- 파일 / Voi.sql
/*
REPLACE INTO Language_ko_KR 
	(Tag, Text)
SELECT
	'TXT_KEY_UNIT_CD_VOI_HELP', 'Requires the [ICON_CULTURE_JFD_EASTERN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_EASTERN_SHORT_DESC}[ENDCOLOR] Cultural Group.';
*/