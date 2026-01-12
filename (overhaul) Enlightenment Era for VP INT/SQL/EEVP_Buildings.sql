------------------------------------------------
-- 4UC
------------------------------------------------
-- TODO: 이것들을 위의 올바른 위치에 분류하세요

-- 쉬첸슈탄드
UPDATE Language_ko_KR
SET Text = '화약 유닛 [ICON_PRODUCTION] 생산량 +30% 증가, 기타 모든 지상 [ICON_PRODUCTION] 유닛 생산량 +20% 증가, 추가로 경험치를 +15 획득합니다. [ICON_WAR] 군사 보급 제한이 +2 증가합니다.[NEWLINE][NEWLINE]이 도시에서 유닛을 생산할 때마다 해당 유닛 [ICON_PRODUCTION] 생산 비용의 10%에 해당하는 [ICON_RESEARCH] 과학을 획득합니다.[NEWLINE][NEWLINE][ICON_CITY_STATE] 도시 국가 [COLOR_CYAN]동맹[ENDCOLOR] 보너스: [ICON_PRODUCTION] 생산력 +1, [ICON_CULTURE] 문화 +1[NEWLINE][NEWLINE][ICON_RES_IRON] 철: [ICON_PRODUCTION] 생산력 +2[NEWLINE][ICON_RES_COAL] 석탄: [ICON_PRODUCTION] 생산력 +1, [ICON_RESEARCH] 과학 +1'
WHERE Tag = 'TXT_KEY_BUILDING_SCHUTZENSTAND_HELP';
UPDATE Language_ko_KR
SET Text = '쉬첸슈탄드는 오스트리아 고유의 건물로, {TXT_KEY_BUILDING_EE_GUNSMITH}를 대체합니다. 이는 {TXT_KEY_BUILDING_EE_GUNSMITH}보다 저렴하며, 도시에서 지상 유닛의 훈련을 더 빠르고 효율적으로 진행할 수 있도록 해줍니다. 또한 현재 동맹을 맺고 있는 도시 국가 하나당 [ICON_PRODUCTION] 생산력 +1, [ICON_CULTURE] 문화 +1이 증가합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_SCHUTZENSTAND_STRATEGY';

------------------------------------------
-- 스페인 투우장
UPDATE Language_ko_KR
SET Text = '완공 시 [ICON_RESEARCH] 과학 +500을 추가합니다. 인근 정글, 숲, 야영지, 목장에서 [ICON_TOURISM] 관광 +1, [ICON_CULTURE] 문화 +1 증가합니다.[NEWLINE][NEWLINE]이 도시에서 [COLOR_POSITIVE_TEXT]공공 사업 프로젝트[ENDCOLOR]가 끝날 때마다 "[COLOR_POSITIVE_TEXT]국왕 경축일[ENDCOLOR]" 이벤트가 발생합니다. "[COLOR_POSITIVE_TEXT]국왕 경축일[ENDCOLOR]"을 시작할 때마다 [ICON_CULTURE] 문화 +100, [ICON_PEACE] 신앙 +100, [ICON_GOLD] 골드 +100을 얻습니다. (시대에 따라 보정)[NEWLINE][NEWLINE][ICON_CULTURE] 무료로 인한 [ICON_HAPPINESS_3] 불행이 -1 감소합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_BULLRING_HELP';

UPDATE Language_ko_KR
SET Text = '투우장은 스페인의 독특한 건축물로, 동물원보다 가격이 저렴하고 더 일찍 만들 수 있습니다. 동물원이 야영지에 제공하는 보너스 외에도 투우장은 목장에 보너스를 제공합니다. 자원을 연결하거나 공공 사업을 건설하여 "국왕 경축일" 이벤트를 많이 발생시키도록 노력하면 추가적인 수익을 얻을 수 있습니다.'
WHERE Tag = 'TXT_KEY_BUILDING_BULLRING_STRATEGY';

------------------------------------------
-- 모로코 리아드
UPDATE Language_ko_KR
SET Text = '완공 시, 이 도시에 이미 건설된 건물 및 불가사의 8개마다 [ICON_GOLD] 골드와 [ICON_CULTURE] 문화를 획득합니다. 매 시대마다 [ICON_GOLD] 골드 +1, [ICON_CULTURE] 문화 +1이 증가합니다. 도시는 설원과 작업 가능한 타일 내의 산 하나당 [ICON_GOLD] 골드 +1, [ICON_TOURISM] 관광 +1이 증가합니다. 이 도시에서 작업 중인 오아시스에서 [ICON_TOURISM] 관광 +5를 얻습니다.[NEWLINE][NEWLINE]이 도시에서 [ICON_INVEST] 골드를 사용하여 유닛을 구매하거나 건물에 투자할 경우, 비용의 10%가 [ICON_TOURISM] 관광 산출량으로 전환됩니다.[NEWLINE][NEWLINE][ICON_WONDER] 세계 불가사의와 타일에서 비롯된 [ICON_CULTURE] 문화의 50%가 도시 [ICON_TOURISM]관광 산출량에 더해집니다. 걸작으로 인한 [ICON_TOURISM] 관광 산출량이 +25% 증가합니다.[NEWLINE][NEWLINE]이곳에서 시작하여 다른 문명을 목표로 하는 [ICON_CARAVAN]/[ICON_CARGO_SHIP] 교역로를 완성하면 [COLOR_POSITIVE_TEXT]역사적 이벤트[ENDCOLOR]가 발생하거나 기존 이벤트가 강화됩니다.'
WHERE Tag = 'TXT_KEY_BUILDING_RIAD_HELP';

------------------------------------------
-- 가부키 극장
UPDATE Language_ko_KR
SET Text = Replace(Text, '도시에서 문화가 +5% [ICON_CULTURE] 증가합니다.', '도시에서 [ICON_CITIZEN] 시민 5명당 [ICON_CULTURE] 문화가 +1 증가합니다.') || '[NEWLINE][NEWLINE][ICON_RES_CRAB] 게: [ICON_FOOD] 식량 +1, [ICON_GOLD] 골드 +1, [ICON_TOURISM] 관광 +1[NEWLINE][ICON_RES_WINE] 와인: [ICON_FOOD] 식량 +1, [ICON_GOLD] 골드 +1, [ICON_CULTURE] 문화 +1[NEWLINE][ICON_RES_TRUFFLES] 송로버섯: [ICON_GOLD] 골드 +1, [ICON_TOURISM] 관광 +2[NEWLINE][ICON_RES_OLIVE] 올리브: [ICON_FOOD] 식량 +1, [ICON_CULTURE] 문화 +1[NEWLINE][ICON_RES_MARBLE] 대리석: [ICON_CULTURE] 문화 +1, [ICON_PEACE] 신앙 +1, [ICON_TOURISM] 관광 +1'
WHERE Tag = 'TXT_KEY_BUILDING_KABUKI_THEATER_HELP';

------------------------------------------
-- 맥주 홀
UPDATE Language_ko_KR
SET Text = Replace(Text, '건물 건설 시 [ICON_PRODUCTION] 생산량이 15% 증가합니다. 식료품점, 곡창, 그리고 근처의 [ICON_RES_WHEAT] 밀, [ICON_RES_MAIZE] 옥수수, [ICON_RES_RICE] 쌀 자원은 [ICON_FOOD] 식량과 [ICON_CULTURE] 문화에 보너스를 +1 제공합니다. 습지와 호수 근처에서 [ICON_PRODUCTION] 생산량과 [ICON_GOLD] 골드가 +2 증가합니다.[NEWLINE][NEWLINE]채택한 정책 9개당 [ICON_HAPPINESS_1] 행복이 +1씩 증가합니다. 도시 국가에 군사 유닛을 선물할 때마다 이 도시에서 [ICON_CULTURE] 문화 10을 획득합니다. (시대에 따라 보정)', 
'[COLOR_POSITIVE_TEXT]이 도시에서 생산된 유닛[ENDCOLOR]이 타일을 [ICON_RAZING] 약탈할 때마다 [ICON_GOLD] 골드 15, [ICON_TOURISM] 관광 15를 얻습니다. (시대에 따라 보정) [COLOR_POSITIVE_TEXT]정찰 유닛[ENDCOLOR] 훈련 시 [ICON_PRODUCTION] 생산력이 +15% 증가하고, 경험치 +30을 추가로 획득합니다.[NEWLINE][NEWLINE]채택한 정책 9개당 [ICON_HAPPINESS_1] 행복이 +1씩 증가합니다. 도시 국가에 군사 유닛을 선물할 때마다 이 도시에서 [ICON_CULTURE] 문화 10을 획득합니다. (시대에 따라 보정)[NEWLINE][NEWLINE][ICON_RES_FISH] 물고기: [ICON_FOOD] 식량 +1, [ICON_GOLD] 골드 +1[NEWLINE][ICON_RES_CRAB] 게: [ICON_FOOD] 식량 +1, [ICON_GOLD] 골드 +1, [ICON_TOURISM] 관광 +1[NEWLINE][ICON_RES_WHALE] 고래: [ICON_GOLD] 골드 +2, [ICON_RESEARCH] 과학 +1')
WHERE Tag = 'TXT_KEY_BUILDING_BREWHOUSE_HELP';

UPDATE Language_ko_KR
SET Text = '양조장은 항만(따라서 해안 도시)를 요구하지 않고 태번을 대체하는 독일의 고유한 건물입니다. 태번의 기본 보너스 외에도 양조장은 행복도 보너스를 제공하며, 채택한 정책의 수가 많을수록 이 보너스가 강해집니다. 문명의 각 양조장은 도시 국가에 군사 유닛을 선물할 때마다 즉시 문화를 증가해 줍니다. 양조장의 정책 채택 및 유닛 선물 보상은 이념을 채택한 후 강화되며, 채택한 이념에 따라 생산량 보너스가 달라집니다. 양조장의 힘을 키우려면 도시 국가와 동맹을 맺어 문화를 우선시하세요.'
WHERE Tag = 'TXT_KEY_BUILDING_BREWHOUSE_STRATEGY';

------------------------------------------
-- 킬라에서 보루 요새
UPDATE Language_ko_KR SET
Text = '킬라는 인도에서 유일하게 성형 요새를 대체하는 건물입니다. 요새의 일반적인 보너스 외에도, 도시는 국가 불가사의 또는 세계 불가사의를 하나씩 건설할 때마다 추가 체력과 방어력을 얻습니다. 당신의 가장 웅장한 도시들을 점령하는 것 또한 더욱 어려워집니다. 또한, 킬라는 문화 및 위대한 예술가 점수를 생성하며, 도시가 더 발전할수록 더 많은 점수를 얻을 수 있습니다.'
WHERE Tag = 'TXT_KEY_BUILDING_MUGHAL_FORT_STRATEGY';

UPDATE Language_ko_KR SET
Text = '이 도시에 대한 모든 공격으로부터의 피해가 2 감소합니다. [ICON_WAR] 군사 보급 제한이 +1 증가하고, 인구로부터 [ICON_SILVER_FIST] 군사 보급 제한이 +5% 증가합니다. 도시가 장애물을 넘어 [ICON_RANGE_STRENGTH] 공격할 수 있도록 합니다.[NEWLINE][NEWLINE]이 도시에 주둔한 유닛은 회복 시 추가로 체력 5를 회복합니다.[NEWLINE][NEWLINE]이 도시에 국가 불가사의 또는 [ICON_WONDER] 세계 불가사의 2개를 건설할 때마다 도시의 [ICON_STRENGTH] 전투력이 +1 증가합니다. [ICON_STRENGTH] 도시 방어력의 20%가 매 턴마다 [ICON_CULTURE] 문화로 전환됩니다. 건물을 완공하면 [ICON_GREAT_ARTIST] 위대한 예술가 진행률이 2% 증가합니다.[NEWLINE][NEWLINE][ICON_CITY_STATE] 이 도시에서는 문명 규모 보정치가 5% 감소합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_MUGHAL_FORT_HELP';