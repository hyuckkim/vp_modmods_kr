/*
VPEE 호환 패치!
0 = Infixo의 VPEE를 감지하더라도 무시하고 비활성화됩니다.
1 = Infixo의 VPEE를 감지하면 활성화됩니다.
2 = 감지될 때까지 비활성화됩니다! (기본값)
*/
INSERT INTO COMMUNITY
		(Type,			Value)
VALUES	('MUCfVP-EE', 2);

UPDATE COMMUNITY
SET Value = '1'
WHERE Type = 'MUCfVP-EE' AND EXISTS (SELECT * FROM Eras WHERE Type='ERA_ENLIGHTENMENT') AND NOT EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 0);

	-- 보선
	UPDATE Language_ko_KR SET 
	Text = '거대한 계몽 시대의 해군 유닛으로 갤리온을 대체하는 중국의 고유 유닛입니다. [COLOR_POSITIVE_TEXT]선체 III[ENDCOLOR] 승급을 보유합니다.[NEWLINE][NEWLINE][ICON_CITY_STATE] 도시 국가의 국경에 주둔하면 매 턴마다 [ICON_INFLUENCE] 영향력을 생성합니다.'
	WHERE Tag = 'TXT_KEY_UNIT_CHINA_XIAFAN_GUANJUN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);

	UPDATE Language_ko_KR SET 
	Text = '보선은 중국의 고유한 유닛입니다. 갤리온보다 훨씬 견고합니다. 보선을 사용하여 도시 국가를 지배하거나 도시에 대한 보너스를 활용하고 해안 제국을 지배할 수 있습니다.'
	WHERE Tag = 'TXT_KEY_UNIT_CHINA_XIAFAN_GUANJUN_STRATEGY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	
	-- 아르마다
	UPDATE Language_ko_KR
	SET Text = '갤리온을 대체하는 스페인의 고유 유닛입니다. [NEWLINE][NEWLINE]대체하는 갤리온보다 더 비쌉니다. HP가 최대치일 때 추가 힘을 얻고, 적 유닛을 물리칠 때 [ICON_GREAT_ADMIRAL] 위대한 제독 점수를 생성합니다.'
	WHERE Tag = 'TXT_KEY_UNIT_SPAIN_ARMADA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);

	UPDATE Language_ko_KR
	SET Text = '아르마다는 그 시대의 강력한 배입니다. 적을 추격할 가능성은 없지만 뛰어난 기동력으로 교전을 펼칠 수 있습니다. 체력이 가득 차 있을 때 훨씬 더 강합니다. 적이 원거리 공격을 하기 전에 적과 접촉해야 합니다. 그렇지 않으면 초반 전투에서 많은 힘을 잃게 됩니다.'
	WHERE Tag = 'TXT_KEY_UNIT_SPAIN_ARMADA_STRATEGY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);

	-- 카사도르
	UPDATE Language_ko_KR
	SET Text = '명사수를 대체하는 포르투갈의 고유 유닛입니다. 레벨이 오를 때마다 [COLOR_PLAYER_PURPLE]개척[ENDCOLOR] 또는 [COLOR_PLAYER_PURPLE]생존[ENDCOLOR] 계열에서 무작위로 승급을 얻습니다.'
	WHERE Tag = 'TXT_KEY_UNIT_PORTUGUESE_CACADORES_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);

	UPDATE Language_ko_KR
	SET Text = '카사도르는 명사수를 대체하는 포르투갈의 고유 유닛입니다. 승급을 통해 정찰 승급을 획득하여 적대적인 지형에서 뛰어난 능력을 발휘합니다.'
	WHERE Tag = 'TXT_KEY_UNIT_PORTUGUESE_CACADORES_STRATEGY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);

	-- 오하무페
	UPDATE Language_ko_KR
	SET Text = Replace(Text, '대형 I', '대형 I, 대형 II')
	WHERE Tag = 'TXT_KEY_UNIT_SHOSHONE_YELLOW_BROW_HELP';

	-- 유니콘
	UPDATE Language_ko_KR
	SET Text = '야전포를 대체하는 러사아의 고유 유닛입니다. 적 영토에서 기동성이 뛰어나고, 공격 후 이동할 수 있습니다. 근접 유닛과 화약 유닛에 대해 매우 효과적입니다.'
	WHERE Tag = 'TXT_KEY_UNIT_RUSSIA_LICORNE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);

	-- 쓰아멉
	UPDATE Language_ko_KR
	SET Text = '곡사포를 대체하는 시암의 고유 유닛입니다. 해상 유닛 공격 시 [ICON_STRENGTH]전투력 보너스를 가지지만, 도시 공격 시에는 보너스가 없습니다.[NEWLINE][NEWLINE]해당 턴에 움직이지 않는다면 추가 피해를 입힐 수 있습니다.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]엄폐 I[ENDCOLOR] 승급과 [COLOR_POSITIVE_TEXT]엄폐 II[ENDCOLOR] 승급을 보유합니다.'
	WHERE Tag = "TXT_KEY_UNIT_SIAM_SEIR_MORB_HELP" AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);

	--------------------------------------------
	-- 건물
	--------------------------------------------
	-- 사격장
	UPDATE Language_ko_KR
	SET Text = '모든 지상 유닛을 생산할 때 [ICON_PRODUCTION] 생산보너스가 [COLOR_POSITIVE_TEXT]20%[ENDCOLOR] 증가하고, 추가로 화약 유닛을 생산할 때 [ICON_PRODUCTION] 생산보너스가 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR] 추가로 증가합니다. [ICON_WAR] 지역 군사 보급 한도가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE]도시에서 유닛을 생산할 때 유닛 [ICON_PRODUCTION] 생산비용의 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR]를 [ICON_RESEARCH] 과학으로 전환합니다.[NEWLINE][NEWLINE][ICON_CITY_STATE] 도시 국가 [COLOR_CYAN]동맹[ENDCOLOR] 보너스: [ICON_PRODUCTION] 생산력 +1, [ICON_CULTURE] 문화 +1[NEWLINE][NEWLINE][ICON_RES_IRON] 철: [ICON_PRODUCTION] 생산력 +2[NEWLINE][ICON_RES_COAL] 석탄: [ICON_PRODUCTION] 생산력 +1, [ICON_RESEARCH] 과학 +1'
	WHERE Tag = 'TXT_KEY_BUILDING_AUSTRIA_STANDSCHUTZEN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
	UPDATE Language_ko_KR
	SET Text = '스탠드슈첸은 {TXT_KEY_BUILDING_EE_GUNSMITH}를 대체하는 오스트리아의 고유한 건물입니다. {TXT_KEY_BUILDING_EE_GUNSMITH} 보다 저렴하고, 지상 전투 유닛의 더 빠르고 더 나은 훈련이 가능해집니다. 또한, 현재 동맹을 맺은 모든 도시 국가에 대해 [ICON_PRODUCTION] 생산력 +1, [ICON_CULTURE] 문화 +1을 제공합니다.'
	WHERE Tag = 'TXT_KEY_BUILDING_AUSTRIA_STANDSCHUTZEN_STRATEGY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);

	-- 스페인 투우장
	UPDATE Language_ko_KR
	SET Text = '도시에 전략 자원을 연결하거나 [COLOR_POSITIVE_TEXT]공공사업 프로젝트[ENDCOLOR]를 완료하면 "국왕 경축일"을 맞이합니다. "국왕 경축일"을 맞이하면 [ICON_CULTURE]문화, [ICON_PEACE]신앙, [ICON_GOLD]골드를 [COLOR_POSITIVE_TEXT]100[ENDCOLOR][COLOR:105:105:105:255](시대별 보정)[ENDCOLOR] 얻습니다. [NEWLINE][NEWLINE]목장 및 야영지의 [ICON_CULTURE]문화와 [ICON_TOURISM]관광이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.건설을 완료하면 [ICON_RESEARCH] 과학을 [COLOR_POSITIVE_TEXT]500[ENDCOLOR] 제공합니다. 도시 주변 정글 및 숲 타일의 [ICON_CULTURE]문화와 [ICON_TOURISM]관광이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE][ICON_CULTURE]무료에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.'
	WHERE Tag = 'TXT_KEY_BUILDING_SPAIN_BULLRING_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);

	UPDATE Language_ko_KR
	SET Text = '투우장은 동물원보다 저렴하고 일찍 등장하는 스페인의 고유한 건물입니다. 동물원이 야영지에 주는 보너스 외에도, 투우장은 목초지에 보너스를 줍니다. 추가 산출량을 얻으려면 자원을 연결하거나 공공 사업을 건설하여 "국왕 경축일"을 많이 실행하는 것에 집중하세요.'
	WHERE Tag = 'TXT_KEY_BUILDING_SPAIN_BULLRING_STRATEGY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);

	-- 모로코 리아드
	UPDATE Language_ko_KR
	SET Text = '건설을 완료하면 도시에 이미 건설된 건물과 불가사의 8개마다 [ICON_GOLD] 골드와 [ICON_CULTURE] 문화가 증가합니다. 각 시대마다 [ICON_GOLD] 골드와 [ICON_CULTURE] 문화가  [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 이 도시에서 유닛을 구매하거나 건물에 투자할 때, [ICON_PRODUCTION]생산비용의 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR]가 [ICON_TOURISM] 관광으로 전환합니다.[NEWLINE][NEWLINE]도시 주변 설원과 3타일 이내의 신 1개마다 [ICON_GOLD] 골드와 [ICON_TOURISM] 관광이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 도시 주변의 오아시스 타일의 [ICON_TOURISM] 관광이 [COLOR_POSITIVE_TEXT]5[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][ICON_WONDER] 세계 불가사의 및 타일이 제공하는 [ICON_CULTURE]문화의 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR]가 도시의 [ICON_TOURISM]관광에 추가됩니다. [ICON_GREAT_WORK]걸작에서 오는 [ICON_TOURISM]관광이 [COLOR_POSITIVE_TEXT]34%[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]이 도시에서 다른 문명으로 출발하는 [ICON_CARAVAN]/[ICON_CARGO_SHIP]교역로가 완료되면 [COLOR_POSITIVE_TEXT]역사적 사건[ENDCOLOR]을 발동시킵니다. '
	WHERE Tag = 'TXT_KEY_BUILDING_MOROCCO_RIAD_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);

	-- 살롱
	UPDATE Language_ko_KR SET 
	Text = '9개의 고유한 테마 보너스가 있습니다. [COLOR_YELLOW]테마 보너스를 달성하면[ENDCOLOR] [ICON_CULTURE]문화가 추가로 [COLOR_POSITIVE_TEXT]5[ENDCOLOR]증가하고 [ICON_GREAT_PEOPLE]위인 점수를 얻습니다.[COLOR:105:105:105:255]([ICON_GREAT_PEOPLE]위인의 테마에 따라 다름)[ENDCOLOR]테마 보너스를 달성한 도시는 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]3[ENDCOLOR]증가하고 [ICON_GREAT_PEOPLE]위인 출현율이 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]도시의 [ICON_GREAT_WORK] 걸작에서 오는 [ICON_TOURISM] 관광이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.  도시의 장원, 이국 박람회, 카페의 [ICON_CULTURE] 문화와 [ICON_GOLDEN_AGE] 황금기 점수가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[ICON_GREAT_WORK] 걸작 예술품 또는 [ICON_VP_ARTIFACT]유물 슬롯 [COLOR_POSITIVE_TEXT]1개[ENDCOLOR]를 포함합니다. [NEWLINE][NEWLINE][ICON_GREAT_ARTIST] 위대한 예술가의 출현율이 [COLOR_POSITIVE_TEXT]33%[ENDCOLOR]증가합니다.'
	WHERE Tag = 'TXT_KEY_BUILDING_FRANCE_SALON_HELP';

	UPDATE Language_ko_KR SET 
	Text = '살롱은 갤러리를 대체하는 프랑스의 고유 건물입니다. 갤러리의 일반적인 보너스 외에도 살롱은 과학을 제공하고 도시에서 활성화된 각 테마 보너스에 따라 위인 생성 속도를 증가시킵니다.'
	WHERE Tag = 'TXT_KEY_BUILDING_FRANCE_SALON_STRATEGY';

	-- 삼바 축제장
	UPDATE Language_ko_KR
	SET Text ='매턴 [ICON_CULTURE]문화의 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR]를 [ICON_GOLDEN_AGE]황금기 점수로 전환합니다. 건설이 완료되면 [COLOR_POSITIVE_TEXT]10턴[ENDCOLOR] 동안 [COLOR_POSITIVE_TEXT]카니발[ENDCOLOR]이 시작됩니다. [NEWLINE][NEWLINE][ICON_CITIZEN]시민 3명마다 [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 도시의 [ICON_GREAT_WORK]걸작 음악에서 오는 [ICON_TOURISM]관광이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[ICON_GREAT_WORK]걸작 음악 슬롯 [COLOR_POSITIVE_TEXT]1개[ENDCOLOR]를 포함합니다.[NEWLINE][NEWLINE][ICON_GREAT_MUSICIAN]위대한 음악가 출현율이 [COLOR_POSITIVE_TEXT]33%[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][ICON_RES_MARBLE] 대리석: [ICON_CULTURE] 문화 +1, [ICON_TOURISM] 관광 +1[NEWLINE][ICON_RES_CRAB] 게: [ICON_FOOD] 식량 +1, [ICON_GOLD] 골드 +1, [ICON_TOURISM] 관광 +1[NEWLINE][ICON_RES_WINE] 와인: [ICON_FOOD] 식량, [ICON_GOLD] 골드, [ICON_CULTURE] 문화 +1[NEWLINE][ICON_RES_TRUFFLES] 송로버섯: [ICON_GOLD] 골드 +1,  [ICON_TOURISM] 관광 +2[NEWLINE][ICON_RES_OLIVE] 올리브: [ICON_FOOD] 식량 +1, [ICON_CULTURE] 문화 +1'
	WHERE Tag = 'TXT_KEY_BUILDING_BRAZIL_SAMBADROME_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);

	-- 가부키 극장
	UPDATE Language_ko_KR
	SET Text = '모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]음악가 길드, 작가 길드, 예술가 길드[ENDCOLOR]의 [ICON_GOLD] 골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 이 도시로 연결된 국내 [ICON_INTERNATIONAL_TRADE] 무역로가 완료될 때마다 [COLOR_POSITIVE_TEXT]50[ENDCOLOR][COLOR:105:105:105:255](시대별 보정)[ENDCOLOR]제공합니다. [NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]위대한 음악가[ENDCOLOR]가 태어날 때 제국의 매 턴 [ICON_TOURISM] 관광 산출량에 해당하는 [ICON_PEACE] 신앙을 획득합니다.[NEWLINE][COLOR_POSITIVE_TEXT]위대한 예술가[ENDCOLOR]가 태어날 때 예술가의 잠재적 [ICON_GOLDEN_AGE] 황금기 점수의 2%에 해당하는 [ICON_RESEARCH] 과학을 획득합니다.[NEWLINE][COLOR_POSITIVE_TEXT]위대한 작가[ENDCOLOR]가 태어날 때 작가의 잠재적 [ICON_CULTURE] 문화의 5%에 해당하는 [ICON_GOLD] 골드를 획득합니다.[NEWLINE][NEWLINE][ICON_CITIZEN]시민 6명마다 [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 도시의 [ICON_GREAT_WORK]걸작 음악에서 오는 [ICON_TOURISM]관광이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[ICON_GREAT_WORK]걸작 음악 슬롯 [COLOR_POSITIVE_TEXT]1개[ENDCOLOR]를 포함합니다.[NEWLINE][NEWLINE][ICON_GREAT_MUSICIAN]위대한 음악가 출현율이 [COLOR_POSITIVE_TEXT]33%[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][ICON_RES_MARBLE] 대리석: [ICON_CULTURE] 문화 +1, [ICON_TOURISM] 관광 +1[NEWLINE][ICON_RES_CRAB] 게: [ICON_FOOD] 식량 +1, [ICON_GOLD] 골드 +1, [ICON_TOURISM] 관광 +1[NEWLINE][ICON_RES_WINE] 와인: [ICON_FOOD] 식량, [ICON_GOLD] 골드, [ICON_CULTURE] 문화 +1[NEWLINE][ICON_RES_TRUFFLES] 송로버섯: [ICON_GOLD] 골드 +1,  [ICON_TOURISM] 관광 +2[NEWLINE][ICON_RES_OLIVE] 올리브: [ICON_FOOD] 식량 +1, [ICON_CULTURE] 문화 +1'
	WHERE Tag = 'TXT_KEY_BUILDING_JAPAN_KABUKI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);

	-- 브로이하우스
	UPDATE Language_ko_KR
	SET Text = '채택한 정책 9개마다 [ICON_HAPPINESS_1]행복이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [ICON_CITY_STATE]도시 국가에 군사 유닛을 선물할 때마다 해당 건물이 있는 도시에 [ICON_CULTURE]문화를 [COLOR_POSITIVE_TEXT]10[ENDCOLOR][COLOR:105:105:105:255](시대별 보정)[ENDCOLOR]을 얻습니다.[NEWLINE][NEWLINE][COLOR_MAGENTA]이념[ENDCOLOR] 채택 시 추가 보너스 제공:[NEWLINE][ICON_BULLET][ICON_IDEOLOGY_FREEDOM][COLOR_MAGENTA]자유[ENDCOLOR]: 정책 채택할 때마다 [ICON_RESEARCH]과학 [COLOR_POSITIVE_TEXT]10[ENDCOLOR] 획득, [ICON_CITY_STATE]도시 국가에 군사 유닛 선물할 때마다 [ICON_GOLDEN_AGE]황금기 점수 [COLOR_POSITIVE_TEXT]10[ENDCOLOR] 획득[COLOR:105:105:105:255](시대별 보정)[ENDCOLOR][NEWLINE][ICON_BULLET][ICON_IDEOLOGY_ORDER][COLOR_MAGENTA]질서[ENDCOLOR]: 정책 채택할 때마다 [ICON_PRODUCTION]생산 [COLOR_POSITIVE_TEXT]10[ENDCOLOR] 획득, [ICON_CITY_STATE]도시 국가에 군사 유닛 선물할 때마다 [ICON_FOOD]식량 [COLOR_POSITIVE_TEXT]10[ENDCOLOR] 획득[COLOR:105:105:105:255](시대별 보정)[ENDCOLOR][NEWLINE][ICON_BULLET][ICON_IDEOLOGY_AUTOCRACY][COLOR_MAGENTA]독재[ENDCOLOR]: 정책을 채택할 때마다 [ICON_CULTURE]문화 [COLOR_POSITIVE_TEXT]10[ENDCOLOR] 획득, [ICON_CITY_STATE]도시 국가에 군사 유닛 선물할 때마다 [ICON_GOLD]골드 [COLOR_POSITIVE_TEXT]10[ENDCOLOR] 획득[COLOR:105:105:105:255](시대별 보정)[ENDCOLOR][NEWLINE][NEWLINE]도시 주변 습지 타일의 [ICON_PRODUCTION]생산과 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]타일 [ICON_RAZING]약탈 시 [ICON_GOLD]골드와 [ICON_TOURISM]관광 [COLOR_POSITIVE_TEXT]15[ENDCOLOR][COLOR:105:105:105:255](시대별 보정)[ENDCOLOR]를 제공합니다. 정찰유닛을 생산할 때 [ICON_PRODUCTION] 생산 보너스를 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR] 제공합니다. 도시에서 생산하는 정찰유닛의 경험치가 [COLOR_POSITIVE_TEXT]30[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][ICON_RES_FISH] 물고기: [ICON_FOOD] 식량 +1, [ICON_GOLD] 골드 +1[NEWLINE][ICON_RES_COW] 소: [ICON_GOLD] 골드  +1, [ICON_TOURISM] 관광 +1[NEWLINE][ICON_RES_WHEAT] 밀, [ICON_RES_MAIZE] 옥수수, [ICON_RES_RICE] 쌀: [ICON_GOLD] 골드 +2 '
	WHERE Tag = 'TXT_KEY_BUILDING_GERMANY_BEER_HALL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);

	UPDATE Language_ko_KR
	SET Text = '브로이하우스는 항구(따라서 해안 도시)가 필요 없는 태번을 대체하는 고유한 독일식 건물입니다. 태번의 표준 보너스 외에도, 브로이하우스는 행복에 대한 보너스를 제공하는데, 이 보너스는 당신이 채택한 정책의 수가 많을수록 더욱 강력해집니다. 문명의 각 브로이하우스는 도시 국가에 군사 유닛을 선물할 때마다 즉시 문화를 증가시켜줍니다. 브로이하우스의 정책 채택과 유닛 증여에 대한 보상은 이념을 채택한 후에 더욱 강력해지며, 채택한 이념에 따라 산출 보너스가 달라집니다.도시 국가와 동맹을 맺어 문화를 우선시하면 브로이하우스의 힘이 강화됩니다.'
	WHERE Tag = 'TXT_KEY_BUILDING_GERMANY_BEER_HALL_STRATEGY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);

	-- 킬라 
	UPDATE Language_ko_KR SET
	Text = '킬라는 성형 요새를 대체하는 고유한 인도식 건물입니다. 요새의 일반적인 보너스 외에도 도시는 모든 국가 또는 세계 불가사의에 대해 추가 체력과 방어력을 얻습니다. 가장 웅장한 도시조차도 점령하기가 더 어려워집니다. 또한, 킬라는 문화 점수와 위대한 예술가 점수를 생산하는데, 더 발전된 도시에서 더 많은 점수를 얻을 수 있습니다.'
	WHERE Tag = 'TXT_KEY_BUILDING_INDIA_QILA_STRATEGY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);

	UPDATE Language_ko_KR SET
	Text = '도시의 국가 또는 세계 불가사의 2개 마다 [ICON_STRENGTH]방어력이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 매 턴  도시 [ICON_STRENGTH]방어력의 [COLOR_POSITIVE_TEXT]20%[ENDCOLOR] 만큼 [ICON_CULTURE]문화를 제공합니다. [ICON_WAR] 지역 군사 보급 한도가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]도시가 받는 모든 피해를 [COLOR_POSITIVE_TEXT] 2 [ENDCOLOR]감소시킵니다. 도시가 시야에 상관 없이 [ICON_RANGE_STRENGTH] 범위 공격을 할 수 있습니다. 주둔한 유닛이 체력을 추가로 [COLOR_POSITIVE_TEXT]5[ENDCOLOR] 회복합니다. [ICON_SILVER_FIST] 지역 군사 보급 한도가 시민의 [COLOR_POSITIVE_TEXT] 10%[ENDCOLOR]만큼 증가합니다. [NEWLINE][NEWLINE][ICON_CITY_STATE] 도시 규모 요구치가 [COLOR_POSITIVE_TEXT]5%[ENDCOLOR] 감소합니다.'
	WHERE Tag = 'TXT_KEY_BUILDING_INDIA_QILA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);

	-- 반 창  => 호카쓰 이넘 잘난체만 개호구.. 뉘미 진짜
	UPDATE Buildings SET 
	BuildingProductionModifier = 15
	WHERE Type = 'BUILDING_SIAM_BAAN_CHANG' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);

INSERT INTO Building_ResourceYieldChanges (BuildingType, ResourceType, YieldType, Yield)
SELECT
  'BUILDING_SIAM_BAAN_CHANG',
  src.ResourceType, src.YieldType, src.Yield
FROM Building_ResourceYieldChanges AS src
WHERE src.BuildingType = 'BUILDING_WORKSHOP'
  AND src.ResourceType = 'RESOURCE_STONE'
  AND src.YieldType IN ('YIELD_GOLDEN_AGE_POINTS','YIELD_PRODUCTION')
  AND EXISTS (SELECT 1 FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value=1);

INSERT INTO Building_GrowthExtraYield (BuildingType, YieldType, Yield)
SELECT
  'BUILDING_SIAM_BAAN_CHANG' AS BuildingType,
  g.YieldType,
  g.Yield
FROM Building_GrowthExtraYield AS g
WHERE g.BuildingType = 'BUILDING_WORKSHOP'
  AND g.YieldType    = 'YIELD_PRODUCTION'
  AND EXISTS (SELECT 1 FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value=1);



	-- 반 창 (구, 코끼리 야영지)
	UPDATE Language_ko_KR SET
    Text = '야영지의 [ICON_PEACE]신앙이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR], 제재소의 [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 동맹인 도시국가로부터 받는 전략자원 2개마다 [ICON_GOLD]골드와 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 도시국가에 유닛을 선물하면 [ICON_PRODUCTION]생산과 [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]10[ENDCOLOR][COLOR:105:105:105:255](시대별 보정)[ENDCOLOR]을 받습니다.[NEWLINE][NEWLINE]도시 주변 숲 타일의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]증가합니다. 건물을 건설할 때 [ICON_PRODUCTION]생산 보너스를 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR] 제공합니다. [ICON_CITIZEN]시민이 증가할 때 현재 [ICON_PRODUCTION]생산 산출량의 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR]를 즉시 제공합니다. [NEWLINE][NEWLINE]이 도시에서 출발하는 국내 [ICON_INTERNATIONAL_TRADE] 교역로의 [ICON_PRODUCTION] 생산이 [COLOR_POSITIVE_TEXT]4[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE][ICON_RES_STONE] 석재: [ICON_GOLDEN_AGE]황금기 점수 +1, [ICON_PRODUCTION]생산 +1'
	WHERE Tag = 'TXT_KEY_BUILDING_SIAM_BAAN_CHANG_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-EE' AND Value= 1);
