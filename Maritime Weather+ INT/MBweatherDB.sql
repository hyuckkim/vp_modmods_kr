----------------------------------------------------------
-- 승급
----------------------------------------------------------
UPDATE Language_ko_KR
SET Text = Text||'[NEWLINE][COLOR_MENU_BLUE]폭풍[ENDCOLOR]으로 인해  [ICON_MOVES] [COLOR_POSITIVE_TEXT]이동[ENDCOLOR] 페널티 감소'
WHERE Tag = 'TXT_KEY_PROMOTION_INVISIBLE_SUBMARINE_HELP';

UPDATE Language_ko_KR
SET Text = Text||'[NEWLINE][COLOR_MENU_BLUE]폭풍[ENDCOLOR]으로 인해 [ICON_STRENGTH] [COLOR_NEGATIVE_TEXT]전투력[ENDCOLOR] -20% 감소'
WHERE Tag = 'TXT_KEY_PROMOTION_HOVERING_UNIT_HELP';

----------------------------------------------------------
-- 텍스트 키
----------------------------------------------------------
INSERT INTO Language_ko_KR	(Tag,										Text)
	VALUES					('TXT_KEY_IMPROVEMENT_STORM',				'폭풍'),
							('TXT_KEY_CIV5_IMPROVEMENTS_STORM_HELP',	'폭풍은 자연 환경이나 대기의 교란된 상태를 말합니다. 폭풍은 강풍, 토네이도, 우박, 천둥과 번개(뇌우), 호강수(눈보라, 폭우), 어는 비(착빙성 폭풍우), 강풍(열대성 저기압, 폭풍), 모래 폭풍과 같이 대기를 통해 물질을 운반하는 바람 등 정상적인 상황에 상당한 혼란을 초래하는 여러 형태의 악천후로 나타날 수 있습니다. 폭풍은 인명과 재산에 피해를 줄 수 있으며, 사람들의 이동과 시야를 제한할 수 있습니다.'),
							('TXT_KEY_CIV5_IMPROVEMENTS_STORM_TEXT',	'폭풍은 대양 및 해안 타일에서 자연적으로 발생합니다.'),
							('TXT_KEY_FEATURE_STORM',					'폭풍'),
							/*('TXT_KEY_FEATURE_ICE_STORM',				'폭풍, 빙하'),*/
							('TXT_KEY_FEATURE_ATOLL_STORM',				'폭풍, 산호섬'),
							('TXT_KEY_FEATURE_FLOOD_PLAINS_STORM',		'폭풍, 범람원'),
							('TXT_KEY_PROMOTION_AIR_WEATHER',			'민감한 날씨'),
							('TXT_KEY_PROMOTION_AIR_WEATHER_HELP',		'[COLOR_MENU_BLUE]폭풍[ENDCOLOR]으로 인해 [ICON_WAR] [COLOR_NEGATIVE_TEXT]공격력[ENDCOLOR]이 -20% 감소합니다.');
							('TXT_KEY_PROMOTION_ALL_WEATHER',			'전천후'),
							('TXT_KEY_PROMOTION_ALL_WEATHER_HELP',		'[COLOR_MENU_BLUE]폭풍[ENDCOLOR]으로 인해 [ICON_MOVES] [COLOR_POSITIVE_TEXT]이동력[ENDCOLOR]이 2배가 됩니다.'),
							('TXT_KEY_PROMOTION_WEATHERED',				'제한적인 날씨'),
							('TXT_KEY_PROMOTION_WEATHERED_HELP',		'[COLOR_MENU_BLUE]폭풍[ENDCOLOR]으로 인해 [ICON_MOVES] [COLOR_NEGATIVE_TEXT]이동력[ENDCOLOR]과 [COLOR_NEGATIVE_TEXT]시야[ENDCOLOR]가 -1 감소합니다.');