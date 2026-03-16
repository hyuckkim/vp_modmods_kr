--======================
-- 특성 변경
--======================
--UPDATE Language_ko_KR
--SET Text = '[ICON_WAR] 공격력 +1[NEWLINE][COLOR_POSITIVE_TEXT]승급시[ENDCOLOR] [ICON_CULTURE] 문화를 획득합니다.'
--WHERE Tag = 'TXT_KEY_PROMOTION_MONGOL_TERROR_HELP';

UPDATE Language_ko_KR
SET Text = '스커미셔 유닛이 한 번 더 [ICON_WAR] 공격할 기회를 가집니다. [ICON_RES_HORSE] 말, 마구간, 기업형 농장에서 [ICON_FOOD] 식량 +1, [ICON_CULTURE] 문화 +1, [ICON_CULTURE_LOCAL] 국경 성장 점수 +1, [ICON_GREAT_GENERAL] 위대한 장군 점수 +1 증가합니다.'
WHERE Tag = 'TXT_KEY_TRAIT_TERROR';

UPDATE Language_ko_KR
SET Text = '키모리'
WHERE Tag = 'TXT_KEY_TRAIT_TERROR_SHORT';

--==================
-- 고유 건물 변화
--==================
INSERT INTO Language_ko_KR (Tag, Text)
VALUES	('TXT_KEY_BUILDING_MONGOLIA_TUVAN',			'투바 아일'),
		('TXT_KEY_BUILDING_MONGOLIA_TUVAN_TEXT',		'투바와 몽골의 복합음 창법, 흐미라고 알려진 이 주요 기법은 투바와 몽골 사람들이 연습하는 창법입니다. 배음 창법이 포함된 것으로 유명합니다. 2009년에는 유네스코 인류 무형문화유산 대표목록에 포함되었습니다. 투바의 탁 트인 지형 덕분에 소리는 아주 먼 곳까지 전달됩니다. 이 지역의 복합음 창법에 대해 연구하는 민족음악학자들은 흐미가 오늘날에도 여전히 실천되고 있는 고대 목축 정령신앙에서 필수적인 부분이라고 지적합니다.[NEWLINE][NEWLINE]투바인은 대부분 야외에서 공연하며, 가수들은 종종 적절한 강을 찾아 시골 먼 곳까지 여행을 떠나거나 산비탈의 대초원까지 올라가서 목으로 노래하기에 적합한 환경을 조성합니다. 가장 전통적이고 친밀한 장소는 "아일"인데, 이는 마을, 야영지 또는 가족 야영지를 의미하는 투르크어와 몽골어 단어입니다.투바인과 키르기스인의 맥락에서 이 단어는 구체적으로 대초원에 있는 소규모 유목민 공동체나 대가족이 모여 사는 유르트(게르) 집단을 가리킵니다. 노래는 종종 게르 안에서 이루어지는데, 특히 가족 모임, 이야기 나누기, 축하 행사 때 많이 합니다. 펠트로 덮인 게르의 음향은 목으로 노래할 때의 공명을 강화합니다.'),
		('TXT_KEY_BUILDING_MONGOLIA_TUVAN_STRATEGY',	'음악가 길드의 일반적인 보너스 외에도, 투바 아일은 도시의 위치에 따라 증폭되는 추가 보너스를 생성합니다. 산, 평야나 초원, 목장은 모두 문화, 신앙, 관광 등 수익성 있는 산출을 포함한 큰 보너스로 이어집니다. 여러분의 문명에서 이 건물은 제한된 수의 인스턴스만 존재하므로, 최대의 효과를 위해 신중하게 도시를 선택해 건설하고, 여러분의 위대한 전략에 적용하세요!'),
		('TXT_KEY_BUILDING_MONGOLIA_TUVAN_HELP',		'');

------------------------------------------------
--UPDATE Language_ko_KR
--SET Text = '{TXT_KEY_BUILDING_SMOKEHOUSE}을 대체하는 몽골의 고유 건물입니다. {TXT_KEY_BUILDING_SMOKEHOUSE}의 보너스 외에도 {TXT_KEY_BUILDING_GER}는 [ICON_GOLD] 골드를 생산하고, 목장를 늘리고, 국경이 확장될 때 [ICON_PRODUCTION] 생산력을 제공하며, 국경이 더 빨리 확장되도록 합니다.'
--WHERE Tag = 'TXT_KEY_BUILDING_GER_STRATEGY';