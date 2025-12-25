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
Text = Replace(Text, '문화 그룹이 필요합니다. ', '문화 그룹이 필요합니다.[NEWLINE]도시 근처에 [ICON_RES_COCA] 코카 자원을 최대 1개 배치합니다.')
WHERE Tag = 'TXT_KEY_BUILDING_CD_YATIRI_HELP';

-- 파일 / Bantu.sql
REPLACE INTO Language_ko_KR 
  (Tag, Text)
SELECT
  'TXT_KEY_UNIT_CD_KOLOLO_HELP', '[ICON_CULTURE_JFD_BANTU] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_BANTU_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.'
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_UNIT_COLONIST_HELP';

REPLACE INTO Language_ko_KR 
	(Tag, Text)
SELECT
	'TXT_KEY_BUILDING_CD_KGOTLA_HELP', '[ICON_CULTURE_JFD_BANTU] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_BANTU_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다. ' || Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_CONSTABLE_HELP';

-- 파일 / Bharata.sql
UPDATE Language_ko_KR SET
Text = '이 유닛을 사용하려면 [ICON_CULTURE_JFD_BHARATA] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_BHARATA_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.'
WHERE Tag = 'TXT_KEY_UNIT_CD_SEPOY_HELP';

REPLACE INTO Language_ko_KR 
  (Tag, Text)
SELECT
  'TXT_KEY_BUILDING_CD_GHAT_HELP', '이 건물을 건설하려면 [ICON_CULTURE_JFD_BHARATA] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_BHARATA_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.';

-- 파일 / Celtic.sql
UPDATE Language_ko_KR SET
Text = '이 유닛을 사용하려면 [ICON_CULTURE_JFD_NORTHERN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_CD_CELTIC_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.'
WHERE Tag = 'TXT_KEY_UNIT_CD_HIGHLANDER_HELP';

REPLACE INTO Language_ko_KR 
  (Tag, Text)
SELECT
  'TXT_KEY_BUILDING_CD_METALSMITH_HELP', '이 건물을 건설하려면 [ICON_CULTURE_JFD_NORTHERN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_CD_CELTIC_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다. ' || Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_WORKSHOP_HELP';

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

REPLACE INTO Language_ko_KR 
  (Tag, Text)
SELECT
  'TXT_KEY_BUILDING_CD_TEUTONIC_ORDER_HELP', '[ICON_CULTURE_JFD_CENTRAL] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_CENTRAL_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.' || Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_HEROIC_EPIC_HELP';

UPDATE Language_ko_KR SET
Text = Replace(Text, '문화 그룹이 필요합니다.', '문화 그룹이 필요합니다.[NEWLINE][NEWLINE]모든 도시의 [ICON_STRENGTH] 방어력이 10% 증가하고 [ICON_SILVER_FIST] 군사 보급을 +1 제공합니다. 제국의 모든 연병장에서 [ICON_PEACE] 신앙을 +2 생성합니다.[NEWLINE][NEWLINE]제국의 모든 근접 및 기승 유닛이 [COLOR_POSITIVE_TEXT]총회 지부[ENDCOLOR] 승급을 얻습니다. 이 승급은 유닛이 도시나 요새에 주둔할 때 [ICON_PRODUCTION] 생산력과 [ICON_GOLD] 금을 추가하며, 획득한 경험치에 비례해 [ICON_PEACE] 신앙을 얻고 야만인을 상대로 [ICON_STRENGTH] 전투력 보너스를 얻습니다.[NEWLINE][NEWLINE]')
WHERE Tag = 'TXT_KEY_BUILDING_CD_TEUTONIC_ORDER_HELP';

-- 파일 / Classical.sql
UPDATE Language_ko_KR SET
Text = '이 유닛을 사용하려면 [ICON_CULTURE_JFD_CLASSICAL] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_CLASSICAL_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.'
WHERE Tag = 'TXT_KEY_UNIT_CD_ARCU_HELP';

REPLACE INTO Language_ko_KR 
  (Tag, Text)
SELECT
  'TXT_KEY_BUILDING_CD_NATIONAL_EXHIBIT_HELP', '[ICON_CULTURE_JFD_CLASSICAL] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_CLASSICAL_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.'
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_HERMITAGE_HELP';

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

UPDATE Language_ko_KR
SET Text = '공중강습 레인저는 공수부대보다 훨씬 더 강인합니다. 특히 생존주의 I과 DFPs 승급 덕분에 맷집이 훨씬 좋아졌으며, 낙하한 지점을 훨씬 효과적으로 사수할 수 있습니다. 이 유닛을 공격에 성공적으로 투입한다면 막대한 양의 황금기 점수를 보상으로 얻게 될 것입니다. 레인저가 앞장섭니다!'
WHERE Tag = 'TXT_KEY_UNIT_BRAZILIAN_PRACINHA_STRATEGY';

UPDATE Language_ko_KR
SET Text = '"레인저"라는 용어는 17세기부터 특수 정예 경보병을 묘사하는 데 사용되었습니다. 오늘날 미국의 제75레인저연대는 미국 육군 특수작전사령부(USASOC) 산하의 정예 공중강습 경보병 전투 부대입니다. 이들은 제2차 세계 대전 당시 창설된 6개 대대 중 3개 대대, 그리고 동남아시아 전선에서 활약한 "메릴의 약탈자들"로 알려진 제5307 혼성 부대의 혈통을 잇고 있습니다. 현대 레인저의 6개 대대는 한국, 베트남, 그레나다, 파나마, 아프가니스탄, 이라크 등에 투입되었습니다.[NEWLINE][NEWLINE]이와 유사하게 남미에서는 "흡연하는 코브라(Cobras Fumantes)"라는 별명을 가진 브라질 원정군이 제2차 세계 대전 지중해 전선에서 연합군의 일원으로 참전한 브라질 육군 및 공군 부대로 활약했습니다. 이들은 보병 사단, 연락 비행대, 전투기 대대를 포함하여 약 25,900명의 병력으로 구성되었습니다. 종전까지 이들은 2명의 장군과 약 900명의 장교를 포함하여 20,573명의 추축군 포로를 잡아들이는 전과를 올렸습니다.'
WHERE Tag = 'TXT_KEY_CIV5_BRAZILIAN_PRACINHA_TEXT';

INSERT INTO Language_ko_KR
  (Tag, Text)
VALUES
  ('TXT_KEY_CITY_EVENT_CD_VINTAGE', '훌륭한 빈티지'),
  ('TXT_KEY_CITY_EVENT_CD_VINTAGE_HELP', '주류 산업이 충분히 정착되어 생산량의 일부를 숙성시킴으로써 더 깊고 복합적인 풍미를 만들어내기 시작했습니다.[NEWLINE][NEWLINE]인근 증류소가 [ICON_GOLD] 금과 [ICON_CULTURE] 문화을 +3씩 얻습니다. {4_GPChange}만큼 획득합니다.');

-- 파일 / EastAfrican.sql
UPDATE Language_ko_KR SET
Text = '이 유닛을 사용하려면 [ICON_CULTURE_JFD_EAST_AFRICAN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_EAST_AFRICAN_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.'
WHERE Tag = 'TXT_KEY_UNIT_CD_AGIRU_HELP';

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
WHERE Tag = 'TXT_KEY_UNIT_CD_VOI_HELP';

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

REPLACE INTO Language_ko_KR 
  (Tag, Text)
SELECT
  'TXT_KEY_BUILDING_CD_PALM_MILL_HELP', '[ICON_CULTURE_JFD_EAST_INDIES] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_EAST_INDIES_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다. ' || Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_REFINERY_HELP';

-- 파일 / FarEastern.sql
UPDATE Language_ko_KR SET
Text = '이 유닛을 사용하려면 [ICON_CULTURE_JFD_FAR_EASTERN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_FAR_EASTERN_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.'
WHERE Tag = 'TXT_KEY_UNIT_CD_TUNTIAN_HELP';

REPLACE INTO Language_ko_KR 
  (Tag, Text)
SELECT
  'TXT_KEY_BUILDING_CD_KARAOKE_LOUNGE_HELP', '[ICON_CULTURE_JFD_FAR_EASTERN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_FAR_EASTERN_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다. ' || Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_STADIUM_HELP';

-- 파일 / GreatPlains.sql
UPDATE Language_ko_KR SET
Text = '[COLOR_POSITIVE_TEXT]우군 영토[ENDCOLOR]에서 [ICON_STRENGTH] 전투력이 15% 증가합니다.[NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]유닛 업그레이드 시 사라집니다[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_PROMOTION_HOMELAND_GUARDIAN_BOOGALOO_HELP';

UPDATE Language_ko_KR SET
Text = '이 유닛을 사용하려면 [ICON_CULTURE_JFD_GREAT_PLAINS] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_GREAT_PLAINS_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.'
WHERE Tag = 'TXT_KEY_UNIT_CD_INDIAN_SCOUT_HELP';

REPLACE INTO Language_ko_KR 
  (Tag, Text)
SELECT
  'TXT_KEY_BUILDING_CD_SUN_DANCE_HELP', '[ICON_CULTURE_JFD_GREAT_PLAINS] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_GREAT_PLAINS_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다. ' || Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_CIRCUS_MAXIMUS_HELP';

UPDATE Language_ko_KR SET
Text = Replace(Text, '골드 +2를 얻습니다.', '골드 +2를 얻으며 모든 서커스에서 신앙 +3을 얻습니다.[NEWLINE][NEWLINE]모든 도시의 [ICON_CULTURE_LOCAL] 국경 확장 속도가 25% 증가합니다. 이 도시에서 생산된 근접, 화약, 정찰 유닛은 [COLOR_POSITIVE_TEXT]태양의 춤꾼[ENDCOLOR] 승급을 얻습니다. 이 도시에서 공공 시설 프로젝트를 완료하면 20턴 동안 "왕의 날"이 시작됩니다.')
WHERE Tag = 'TXT_KEY_BUILDING_CD_SUN_DANCE_HELP';

-- 파일 / Himalayan.sql
UPDATE Language_ko_KR SET
Text = '이 유닛을 사용하려면 [ICON_CULTURE_JFD_HIMALAYAN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_HIMALAYAN_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.[NEWLINE][ICON_PEACE] 신앙으로 구매할 수 있습니다.'
WHERE Tag = 'TXT_KEY_UNIT_CD_DAPON_HELP';

-- 파일 / Mandala.sql
UPDATE Language_ko_KR SET
Text = '이 유닛을 사용하려면 [ICON_CULTURE_JFD_INDOCHINA] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_INDOCHINA_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.'
WHERE Tag = 'TXT_KEY_UNIT_CD_BOITA_HELP';

UPDATE Language_ko_KR SET
Text = Text || '[NEWLINE][NEWLINE]대체하는 삼단노선보다 강력하지만 생산 비용이 더 비쌉니다. 외국 타일에 인접했을 때 판매할 수 있는 이국적인 화물을 보유하며, [ICON_CAPITAL] 수도와의 거리에 비례하여 최대 400 [ICON_GOLD] 금과 30 XP를 획득합니다. 보이타를 해체하거나 업그레이드할 때, 해당 유닛이 보유한 총 XP만큼의 [ICON_CULTURE] 문화을 획득합니다.'
WHERE Tag = 'TXT_KEY_UNIT_CD_BOITA_HELP';

REPLACE INTO Language_ko_KR 
  (Tag, Text)
SELECT
  'TXT_KEY_BUILDING_CD_FLOATING_MARKET_HELP', '[ICON_CULTURE_JFD_INDOCHINA] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_INDOCHINA_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다. 강에 인접한 모든 타일에서 [ICON_GOLD] 골드 +1을 얻습니다. 호수 타일은 [ICON_GOLD] 골드 +1을 생산합니다. 이 도시에서 출발하는 내부 식량 [ICON_INTERNATIONAL_TRADE] 교역로는 [ICON_FOOD] 식량 +4를 추가로 생성합니다.[NEWLINE][NEWLINE]' || Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_MARKET_HELP';

-- 파일 / Mesoamerican.sql
UPDATE Language_ko_KR SET
Text = '이 유닛을 사용하려면 [ICON_CULTURE_JFD_MESOAMERICAN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_MESOAMERICAN_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.[NEWLINE][ICON_PEACE] 신앙으로 구매할 수 있습니다.'
WHERE Tag = 'TXT_KEY_UNIT_CD_CRUZOB_HELP';

REPLACE INTO Language_ko_KR 
  (Tag, Text)
SELECT
  'TXT_KEY_BUILDING_CD_MILPA_HELP', '[ICON_CULTURE_JFD_MESOAMERICAN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_MESOAMERICAN_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다. ' || Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_AGRIBUSINESS_HELP';

UPDATE Language_ko_KR SET
Text = Replace(Text, '[ICON_PRODUCTION] 생산력 및 [ICON_GOLD] 골드', '[ICON_PRODUCTION] 생산력, [ICON_GOLD] 골드, [ICON_CULTURE] 문화 및 [ICON_PEACE] 신앙')
WHERE Tag = 'TXT_KEY_BUILDING_CD_MILPA_HELP';

-- 파일 / Mesopotamic.sql
UPDATE Language_ko_KR SET
Text = '이 유닛을 사용하려면 [ICON_CULTURE_CD_CRESCENT] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_MESOPOTAMIC_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.'
WHERE Tag = 'TXT_KEY_UNIT_CD_IRAQ_LEVY_HELP';

UPDATE Language_ko_KR SET
Text = Text || '[NEWLINE][NEWLINE]대체하는 라이플병보다 약간 저렴합니다. [COLOR:255:230:150:255]부족 분과[ENDCOLOR] 승급을 보유하여 [COLOR_POSITIVE_TEXT]사막[ENDCOLOR] 타일에서 지형 비용을 무시하고 회복량이 두 배가 되며, [COLOR_POSITIVE_TEXT]강[ENDCOLOR]을 건너 공격할 때의 페널티가 없고 강을 따라 이동할 때 [ICON_MOVES] 이동력이 두 배가 됩니다.[NEWLINE][NEWLINE]이 유닛을 훈련하는 동안 도시의 [ICON_FOOD] 성장이 정지됩니다. 유닛이 완성되면 도시의 [ICON_CITIZEN] 인구가 1 감소합니다.'
WHERE Tag = 'TXT_KEY_UNIT_CD_IRAQ_LEVY_HELP';

REPLACE INTO Language_ko_KR 
  (Tag, Text)
SELECT
  'TXT_KEY_BUILDING_CD_ARCH_PARK_HELP', '[ICON_CULTURE_CD_CRESCENT] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_MESOPOTAMIC_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.'
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_MUSEUM_HELP';

UPDATE Language_ko_KR SET
Text = Text || '[NEWLINE][NEWLINE]이 도시에서 훈련된 고고학자는 사막에서 지형 비용을 무시하는 특수 승급을 얻으며, 고고학자 생산 속도가 50% 증가합니다. 랜드마크 시설에서 [ICON_CULTURE] 문화, [ICON_TOURISM] 관광, [ICON_GOLD] 금을 각각 +4씩 추가로 얻습니다.[NEWLINE][NEWLINE]가능한 테마 보너스:
  [NEWLINE][ICON_BULLET] [COLOR:255:230:150:255]같은 시대[ENDCOLOR]의 [COLOR_POSITIVE_TEXT]자국[ENDCOLOR] [ICON_GW_ART] 예술품 2개: [ICON_CULTURE] 및 [ICON_TOURISM] +10.
  [NEWLINE][ICON_BULLET] [COLOR:255:230:150:255]같은 시대[ENDCOLOR]의 [COLOR_POSITIVE_TEXT]자국[ENDCOLOR] [ICON_ARTIFACT] 유물 2개: [ICON_CULTURE] 및 [ICON_TOURISM] +20.
  [NEWLINE][ICON_BULLET] [COLOR:255:230:150:255]같은 시대[ENDCOLOR]의 [COLOR_POSITIVE_TEXT]자국[ENDCOLOR] 예술품 1개와 유물 1개 쌍: [ICON_CULTURE] 및 [ICON_TOURISM] +12.
  [NEWLINE][ICON_BULLET] 시대와 상관없는 [COLOR_POSITIVE_TEXT]자국[ENDCOLOR] [ICON_GW_ART] 예술품 2개: [ICON_CULTURE] 및 [ICON_TOURISM] +8.
  [NEWLINE][ICON_BULLET] 시대와 상관없는 [COLOR_POSITIVE_TEXT]자국[ENDCOLOR] [ICON_ARTIFACT] 유물 2개: [ICON_CULTURE] 및 [ICON_TOURISM] +16.
  [NEWLINE]위의 모든 보너스는 [COLOR_POSITIVE_TEXT]외국[ENDCOLOR] 걸작일 경우 [COLOR_NEGATIVE_TEXT]절반[ENDCOLOR]의 수치로 적용됩니다.'
WHERE Tag = 'TXT_KEY_BUILDING_CD_ARCH_PARK_HELP';

-- 파일 / MidEastern.sql
UPDATE Language_ko_KR SET
Text = '이 유닛을 사용하려면 [ICON_CULTURE_JFD_MID_EASTERN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_MID_EASTERN_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.'
WHERE Tag = 'TXT_KEY_UNIT_CD_BAGHLAH_HELP';

UPDATE Language_ko_KR SET
Text = Text || '[NEWLINE][NEWLINE]대체하는 캐러밸보다 약간 더 강력하며 공격 후 이동할 수 있습니다. [COLOR_POSITIVE_TEXT]해적질[ENDCOLOR] 승급을 보유한 상태로 시작하여, 적 유닛을 처치하거나 도시를 공격할 때 [ICON_GOLD] 금을 획득합니다.'
WHERE Tag = 'TXT_KEY_UNIT_CD_BAGHLAH_HELP';

REPLACE INTO Language_ko_KR 
  (Tag, Text)
SELECT
  'TXT_KEY_BUILDING_CD_PETROCHEMICAL_PLANT_HELP', '[ICON_CULTURE_JFD_MID_EASTERN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_MID_EASTERN_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다. 석유 우물 및 해상 플랫폼에서 [ICON_GOLD] 금 +4와 [ICON_SCIENCE] 과학 +4를 제공합니다. 건설 시 인근 타일 2곳에 [ICON_RES_OIL] 석유 자원을 생성합니다. 교역로를 보내거나 받을 때 추가 보너스를 제공합니다.'
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_REFINERY_HELP';

-- 파일 / Oceanic.sql
UPDATE Language_ko_KR SET
Text = '이 유닛을 사용하려면 [ICON_CULTURE_JFD_OCEANIC] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_OCEANIC_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.[NEWLINE]첫 번째 카이미로아를 획득하면 20턴 동안 모든 [ICON_MUSICIAN] 음악가가 [ICON_GREAT_ADMIRAL] 위대한 제독 점수를 +2 생성합니다.'
WHERE Tag = 'TXT_KEY_UNIT_CD_KAIMILOA_HELP';

INSERT INTO Language_ko_KR
  (Tag, Text)
VALUES
  ('TXT_KEY_KAIMILOA_EVENT', '멀리 찾는 자'),
  ('TXT_KEY_KAIMILOA_EVENT_HELP', '선원들을 훈련하는 과정에서 음악적 소질이 있는 젊은이들을 이례적으로 많이 징집했습니다. 이들은 인상적인 군악대를 결성했습니다.[NEWLINE][NEWLINE]향후 {4_Turns} 동안 모든 [ICON_MUSICIAN] 음악가가 [ICON_GREAT_ADMIRAL] 위대한 제독 점수를 +2 생성합니다.');

REPLACE INTO Language_ko_KR 
  (Tag, Text)
SELECT
  'TXT_KEY_BUILDING_CD_FAIKAVA_HELP', '[ICON_CULTURE_JFD_OCEANIC] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_OCEANIC_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다. "왕의 날"이 시작될 때마다 [ICON_TOURISM] 관광 100과 [ICON_FOOD] 식량 100을 즉시 획득합니다. 음악가 전문가 슬롯 1개를 제공하며, 이 전문가로 인한 [ICON_HAPPINESS_4] 불행이 발생하지 않습니다.'
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_GROCER_HELP';

-- 파일 / Pacific.sql
UPDATE Language_ko_KR SET
Text = '이 유닛을 사용하려면 [ICON_CULTURE_JFD_PACIFIC] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_PACIFIC_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.'
WHERE Tag = 'TXT_KEY_UNIT_CD_TXATKUNEEXS_HELP';

UPDATE Language_ko_KR SET
Text = Text || '[NEWLINE][NEWLINE]대체하는 창병보다 강력하며, 소모되지 않고 해상 자원을 개발할 수 있습니다. [COLOR_POSITIVE_TEXT]수륙양용[ENDCOLOR] 승급과 [COLOR_POSITIVE_TEXT]불꽃바늘 연고[ENDCOLOR] 승급을 보유하여 [COLOR_YELLOW]중립[ENDCOLOR] 및 [COLOR_NEGATIVE_TEXT]적대[ENDCOLOR] 영토에서 더 많이 회복할 수 있습니다.'
WHERE Tag = 'TXT_KEY_UNIT_CD_TXATKUNEEXS_HELP';

REPLACE INTO Language_ko_KR 
  (Tag, Text)
SELECT
  'TXT_KEY_BUILDING_CD_POTLATCH_HOUSE_HELP', '[ICON_CULTURE_JFD_PACIFIC] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_PACIFIC_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다. ' || Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_CIRCUS_HELP';

UPDATE Language_ko_KR SET
Text = Text || '[NEWLINE]50턴마다 50 [ICON_GOLD] 금을 [COLOR_NEGATIVE_TEXT]소모[ENDCOLOR]하여 50 [ICON_CULTURE] 문화, 25 [ICON_GOLDEN_AGE] 황금기 점수 및 [ICON_DIPLOMAT] 위대한 외교관 점수를 획득합니다. (시대에 비례)'
WHERE Tag = 'TXT_KEY_BUILDING_CD_POTLATCH_HOUSE_HELP';

INSERT INTO Language_ko_KR
  (Tag, Text)
VALUES
  ('TXT_KEY_CITY_EVENT_POTLATCH', '포틀래치 의식'),
  ('TXT_KEY_CITY_EVENT_POTLATCH_HELP', '부유한 가문이 포틀래치 하우스에서 호화로운 모임을 주최했습니다. {2_InstantYield} 및 [ICON_DIPLOMAT] 위대한 외교관 점수를 획득합니다.');

-- 파일 / Patagonian.sql
UPDATE Language_ko_KR SET
Text = '이 유닛을 사용하려면 [ICON_CULTURE_CD_PATAGONIAN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_CD_PATAGONIAN_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.'
WHERE Tag = 'TXT_KEY_UNIT_CD_BOLAS_RIDER_HELP';

UPDATE Language_ko_KR SET
Text = Text || '[NEWLINE][NEWLINE]대체하는 흉갑기병보다 강력합니다. [COLOR_POSITIVE_TEXT]개활지[ENDCOLOR]에 있는 유닛을 공격할 때 [ICON_RANGED_STRENGTH] 원거리 전투력이 15% 증가하며, 이 유닛의 볼라(Bola)에 맞은 지상 유닛은 1턴 동안 이동 비용이 2만큼 증가합니다. [COLOR_POSITIVE_TEXT]명중 I[ENDCOLOR] 승급을 보유한 상태로 시작합니다.'
WHERE Tag = 'TXT_KEY_UNIT_CD_BOLAS_RIDER_HELP';

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

-- 파일 / Polar.sql
UPDATE Language_ko_KR SET
Text = '이 유닛을 사용하려면 [ICON_CULTURE_JFD_POLAR] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_POLAR_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.[NEWLINE][ICON_GREAT_ADMIRAL] 위대한 제독처럼 항구를 이동할 수 있습니다.'
WHERE Tag = 'TXT_KEY_UNIT_CD_UMIAK_HELP';

UPDATE Language_ko_KR SET
Text = Text || '[NEWLINE][NEWLINE]소모되지 않고 [COLOR_POSITIVE_TEXT]해상 자원[ENDCOLOR]을 개발할 수 있으며, [COLOR_POSITIVE_TEXT]빙하[ENDCOLOR] 타일에 진입할 수 있습니다. 정찰을 통해 가장 가까운 도시에 [ICON_FOOD] 식량을 제공합니다. 정찰 시 XP를 획득하는 [COLOR_POSITIVE_TEXT]정찰[ENDCOLOR] 승급을 보유한 상태로 시작합니다.'
WHERE Tag = 'TXT_KEY_UNIT_CD_UMIAK_HELP';

REPLACE INTO Language_ko_KR 
  (Tag, Text)
SELECT
  'TXT_KEY_BUILDING_CD_REINDEER_DISTRICT_HELP', '[ICON_CULTURE_JFD_POLAR] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_POLAR_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다. 툰드라 및 눈원 타일에서 [ICON_FOOD] 식량과 [ICON_GOLD] 금 보너스를 제공합니다. 순록 자원에서 [ICON_TOURISM] 관광과 [ICON_GOLD] 금을 추가로 얻으며, 모든 야영지 시설의 산출량이 증가합니다.[NEWLINE][NEWLINE]' || Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_AGRIBUSINESS_HELP';

-- 파일 / Saharan.sql
UPDATE Language_ko_KR SET
Text = '이 유닛을 사용하려면 [ICON_CULTURE_JFD_WEST_AFRICAN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_WEST_AFRICAN_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.'
WHERE Tag = 'TXT_KEY_UNIT_CD_MOUKAHLA_HELP';

UPDATE Language_ko_KR SET
Text = Text || '[NEWLINE][NEWLINE]대체하는 전열보병보다 약간 더 강력합니다. [COLOR_POSITIVE_TEXT]사막 전사[ENDCOLOR] 승급을 보유하여 [COLOR_POSITIVE_TEXT]사막[ENDCOLOR] 타일에서 전투력이 증가하며, [COLOR_POSITIVE_TEXT]페잔 약탈자[ENDCOLOR] 승급을 통해 사막에서 [ICON_MOVES] 이동력이 두 배가 되고 도시로부터 받는 피해가 감소하며 도시를 공격할 때 입힌 피해만큼 [ICON_GOLD] 금을 훔쳐옵니다.'
WHERE Tag = 'TXT_KEY_UNIT_CD_MOUKAHLA_HELP';

UPDATE Language_ko_KR SET
Text = '이 유닛을 사용하려면 [ICON_CULTURE_JFD_WEST_AFRICAN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_WEST_AFRICAN_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.[NEWLINE]이 유닛으로 무역 임무를 수행하면 [ICON_INFLUENCE] 영향력뿐만 아니라 100 [ICON_GOLD] 금을 추가로 획득합니다.'
WHERE Tag = 'TXT_KEY_UNIT_CD_WANGARA_TRADER_HELP';

UPDATE Language_ko_KR SET
Text = Text || '[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]{TXT_KEY_PROMOTION_CD_WANGARA}[ENDCOLOR] 승급을 보유하여 [COLOR_POSITIVE_TEXT]사막[ENDCOLOR]에서 [ICON_MOVES] 이동력이 두 배가 되며, 무역 임무 수행 시 20 [ICON_CULTURE] 문화와 [ICON_TOURISM] 관광을 일시불로 획득합니다.'
WHERE Tag = 'TXT_KEY_UNIT_CD_WANGARA_TRADER_HELP';

-- 파일 / Scandinavian.sql
UPDATE Language_ko_KR SET
Text = '이 유닛을 사용하려면 [ICON_CULTURE_CD_SCANDINAVIAN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_NORTHERN_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.'
WHERE Tag = 'TXT_KEY_UNIT_CD_VIKING_HELP';

UPDATE Language_ko_KR SET
Text = Text || '[NEWLINE][NEWLINE]진보된 기반 시설과 추가 [ICON_CITIZEN] 인구를 가진 새로운 도시를 건설합니다. 대체하는 개척자(Pioneer)와 달리 상당한 [ICON_STRENGTH] 전투력을 보유하고 있으며, 즉시 [COLOR_POSITIVE_TEXT]대양[ENDCOLOR]을 건널 수 있습니다.[NEWLINE][NEWLINE]이 유닛을 훈련하는 동안 도시의 [ICON_FOOD] 성장이 정지됩니다. 유닛이 완성되면 도시의 [ICON_CITIZEN] 인구가 1 감소합니다.'
WHERE Tag = 'TXT_KEY_UNIT_CD_VIKING_HELP';

REPLACE INTO Language_ko_KR 
  (Tag, Text)
SELECT
  'TXT_KEY_BUILDING_CD_MEAD_HALL_HELP', '[ICON_CULTURE_CD_SCANDINAVIAN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_NORTHERN_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다. ' || Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_COLOSSEUM_HELP';

UPDATE Language_ko_KR SET
Text = Text || '[NEWLINE]인근의 [ICON_RES_RICE] 쌀, [ICON_RES_MAIZE] 옥수수, [ICON_RES_WHEAT] 밀에서 [ICON_GOLDEN_AGE] 황금기 점수 +1을 얻습니다. 유닛이 전투 경험치를 얻을 때마다 [ICON_GOLDEN_AGE] 황금기 점수를 획득하며, 황금기가 시작될 때마다 [ICON_CULTURE] 문화와 [ICON_TOURISM] 관광 산출량이 영구적으로 증가합니다(최대 10).'
WHERE Tag = 'TXT_KEY_BUILDING_CD_MEAD_HALL_HELP';

-- 파일 / Southern.sql
UPDATE Language_ko_KR SET
Text = '이 유닛을 사용하려면 [ICON_CULTURE_JFD_SOUTHERN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_SOUTHERN_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.[NEWLINE][ICON_GOLD] 금 또는 [ICON_PEACE] 신앙으로만 구매할 수 있습니다.'
WHERE Tag = 'TXT_KEY_UNIT_CD_STRADIOTI_HELP';

UPDATE Language_ko_KR SET
Text = Text || '[NEWLINE][NEWLINE]대체하는 중기병보다 약간 더 강력합니다. [COLOR_POSITIVE_TEXT]매복 I[ENDCOLOR] 및 [COLOR_POSITIVE_TEXT]매복 II[ENDCOLOR] 승급을 보유하여 [COLOR_POSITIVE_TEXT]험지[ENDCOLOR] 공격 시 유리합니다. 또한 [COLOR_POSITIVE_TEXT]자크마르야(Gjakmarrja)[ENDCOLOR] 승급을 통해 적 처치 시 [ICON_GOLD] 금과 [ICON_CULTURE] 문화를 획득하며 체력을 30 회복합니다.'
WHERE Tag = 'TXT_KEY_UNIT_CD_STRADIOTI_HELP';

REPLACE INTO Language_ko_KR 
  (Tag, Text)
SELECT
  'TXT_KEY_BUILDING_CD_BANCO_DEI_CAMBI_HELP', '[ICON_CULTURE_JFD_SOUTHERN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_SOUTHERN_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다. 도시의 [ICON_GOLD] 금 변환(Process) 효율이 15% 증가하며, 해상 유닛 생산 시 [ICON_PRODUCTION] 생산력 보너스 +20%를 얻습니다. 전문가 [ICON_CITIZEN] 상인이 [ICON_CULTURE] 문화를 생산하며, 항만 및 항구 건물에서 추가 [ICON_GOLD] 금과 [ICON_TOURISM] 관광을 제공합니다.'
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_BANK_HELP';

-- 파일 / Steppe.sql
UPDATE Language_ko_KR SET
Text = '이 유닛을 사용하려면 [ICON_CULTURE_JFD_STEPPE] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_STEPPE_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.[NEWLINE][ICON_PRODUCTION] 생산력을 통해서만 훈련할 수 있습니다.'
WHERE Tag = 'TXT_KEY_UNIT_CD_BAGHATUR_HELP';

UPDATE Language_ko_KR SET
Text = Text || '[NEWLINE][NEWLINE]시대에 따라 전투력이 자동으로 강화되는 강력한 영웅 유닛입니다. [COLOR_CYAN]르네상스 시대[ENDCOLOR] 이후에 탄생하면 [COLOR_POSITIVE_TEXT]밍간(Mingghan)[ENDCOLOR] 승급을 얻으며, [COLOR_CYAN]원자력 시대[ENDCOLOR] 이후에는 [COLOR_POSITIVE_TEXT]장갑 보강 I[ENDCOLOR] 및 [COLOR_POSITIVE_TEXT]기동성[ENDCOLOR] 승급을 얻고 기갑 유닛으로 취급됩니다.'
WHERE Tag = 'TXT_KEY_UNIT_CD_BAGHATUR_HELP';

REPLACE INTO Language_ko_KR 
  (Tag, Text)
SELECT
  'TXT_KEY_BUILDING_CD_BOKH_PLAZA_HELP', '[ICON_CULTURE_JFD_STEPPE] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_STEPPE_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다. ' || Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_HOTEL_HELP';

UPDATE Language_ko_KR SET
Text = Text || '[NEWLINE]도시의 [ICON_HAPPINESS_4] 행복도를 1 증가시키며, 이 도시에서 생산되는 유닛에게 [COLOR_POSITIVE_TEXT]보흐(Bokh)[ENDCOLOR] 승급을 부여합니다. 원형 경기장 및 경기장 건물의 [ICON_CULTURE] 문화와 [ICON_FOOD] 식량 출력을 5% 강화하고 추가 [ICON_HAPPINESS_4] 행복을 제공합니다. 또한 도시 인구가 성장할 때마다 [ICON_PRODUCTION] 생산력을 획득하며, 유닛 생산 시 [ICON_TOURISM] 관광을 생성합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_CD_BOKH_PLAZA_HELP';

-- 파일 / WestAfrican.sql
UPDATE Language_ko_KR SET
Text = '이 유닛을 사용하려면 [ICON_CULTURE_JFD_CENTRAL_AFRICAN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_CENTRAL_AFRICAN_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.'
WHERE Tag = 'TXT_KEY_UNIT_CD_GOLEYO_HELP';

UPDATE Language_ko_KR SET
Text = Text || '[NEWLINE][NEWLINE]대체하는 전차 궁수보다 [ICON_RANGE_STRENGTH] 원거리 공격력은 낮지만 [ICON_STRENGTH] 전투력은 훨씬 높습니다. 전차 궁수와 달리 지형 페널티를 받지 않으며 [ICON_RES_HORSE] 전략 자원(말)이 필요하지 않습니다. [COLOR_POSITIVE_TEXT]숲의 지킴이[ENDCOLOR] 승급을 보유한 상태로 시작합니다.'
WHERE Tag = 'TXT_KEY_UNIT_CD_GOLEYO_HELP';

UPDATE Language_ko_KR SET
Text = '이 유닛을 사용하려면 [ICON_CULTURE_JFD_CENTRAL_AFRICAN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_CENTRAL_AFRICAN_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다. 적 유닛을 처치할 때마다 [ICON_CAPITAL] 수도에서 다음 [ICON_GREAT_MUSICIAN] 젤리(Djeli) 탄생에 필요한 점수의 2%를 획득합니다. 젤리를 소모하면 15턴 동안 모든 [ICON_GREAT_WORK] 걸작에 [ICON_CULTURE] 문화 +3, 모든 국가 불가사의에 [ICON_PEACE] 신앙 +2, 그리고 모든 [ICON_MUSICIAN] 음악가 및 음악가 길드에 [ICON_TOURISM] 관광 +5 보너스를 부여합니다.'
WHERE Tag = 'TXT_KEY_UNIT_CD_DJELI_HELP';

INSERT INTO Language_ko_KR
  (Tag, Text)
VALUES
  ('TXT_KEY_DJELI_EVENT', '음유시인의 영감'),
  ('TXT_KEY_DJELI_EVENT_HELP', '향후 {4_Turns} 동안:[NEWLINE][ICON_BULLET] 모든 [ICON_MUSICIAN] 음악가 및 음악가 길드에서 [ICON_TOURISM] 관광 +5를 생성합니다.[NEWLINE][ICON_BULLET] 모든 [ICON_GREAT_WORK] 걸작에서 [ICON_CULTURE] 문화 +3을 얻습니다.[NEWLINE][ICON_BULLET] 모든 국가 불가사의에서 [ICON_PEACE] 신앙 +2를 생산합니다.[NEWLINE][NEWLINE]추가로 활성화하면 지속 시간이 연장됩니다.');

-- 파일 / Western.sql
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

UPDATE Language_ko_KR SET
Text = Text || '[NEWLINE]해상 교역로에서 [ICON_GOLD] 금 보너스를 400% 획득하며, 제국 전체의 빈곤 수치를 줄이고 자원 다양성 보너스를 25% 증가시킵니다. 도시의 전문가 [ICON_CITIZEN] 상인이 모든 종류의 산출량(+1)을 추가로 생산하며 위대한 상인 출현 속도가 20% 빨라집니다. 또한 독점 중인 자원 하나당 [ICON_FOOD] 식량, [ICON_TOURISM] 관광, 위대한 제독 점수를 획득하며, 전 세계에 배치되는 모든 해상 유닛이 추가 경험치를 얻습니다.'
WHERE Tag = 'TXT_KEY_BUILDING_CD_EAST_INDIA_HELP';

-- 파일 / Woodnlands.sql
UPDATE Language_ko_KR SET
Text = '이 유닛을 사용하려면 [ICON_CULTURE_JFD_WOODLANDS] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_WOODLANDS_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다.'
WHERE Tag = 'TXT_KEY_UNIT_CD_MAHAROLUKTI_HELP';

UPDATE Language_ko_KR SET
Text = Text || '[NEWLINE][NEWLINE]대체하는 기병 및 기사와 달리 속도가 느리고 [ICON_RES_HORSE] 전략 자원(말)이 필요하지 않습니다. 방어 보너스를 받을 수 있지만, 승급 계산 시에는 여전히 기갑 유닛으로 취급됩니다. [COLOR_POSITIVE_TEXT]스톰프 댄스(Stomp Dance)[ENDCOLOR] 승급을 보유하여 강 근처에서 전투력과 이동력이 크게 상승하며, 획득한 경험치에 비례해 [ICON_INFLUENCE] 영향력을 얻습니다.[NEWLINE][NEWLINE]두 기병 유닛을 모두 대체하기 위해 시대에 따라 [ICON_STRENGTH] 전투력과 [ICON_PRODUCTION] 생산 비용이 증가합니다. 고전 시대에 +3 [ICON_STRENGTH]/+35 [ICON_PRODUCTION], 중세 시대에 추가로 +7 [ICON_STRENGTH]/+35 [ICON_PRODUCTION] 보너스를 얻습니다.'
WHERE Tag = 'TXT_KEY_UNIT_CD_MAHAROLUKTI_HELP';

REPLACE INTO Language_ko_KR 
  (Tag, Text)
SELECT
  'TXT_KEY_BUILDING_CD_BAGGATAWAY_HELP', '[ICON_CULTURE_JFD_WOODLANDS] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_WOODLANDS_SHORT_DESC}[ENDCOLOR] 문화 그룹이 필요합니다. ' || Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_THEATRE_HELP';

UPDATE Language_ko_KR SET
Text = Text || '[NEWLINE]모든 도시 국가와의 우호도가 10 증가하며, 이 도시에서 훈련된 유닛은 [COLOR_POSITIVE_TEXT]프록세노스(Proxenos)[ENDCOLOR] 승급을 얻습니다. 평원 타일에서 [ICON_CULTURE] 문화를 제공하고, "왕의 사랑을 받는 날(WLTKD)" 동안 [ICON_TOURISM] 관광 산출량이 15% 증가합니다. 또한 외교 임무 수행 시 정찰, 화약, 궁수 유닛의 생산 보너스를 얻습니다.'
WHERE Tag = 'TXT_KEY_BUILDING_CD_BAGGATAWAY_HELP';

-- 파일 / reindeer_camp.sql
UPDATE Language_ko_KR SET
Text = Text || '[NEWLINE]인근의 [ICON_RES_REINDEER] 순록: [ICON_FOOD] 식량 +1.'
WHERE Tag IN (SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_SMOKEHOUSE');