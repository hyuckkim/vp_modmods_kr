----------------------------------------------------------
-- 승급
----------------------------------------------------------
UPDATE Language_ko_KR
SET Text = Text||'[NEWLINE][COLOR_MENU_BLUE]폭풍[ENDCOLOR]으로 인한  [ICON_MOVES] [COLOR_POSITIVE_TEXT]이동[ENDCOLOR] 페널티에 면역'
WHERE Tag = 'TXT_KEY_PROMOTION_INVISIBLE_SUBMARINE_HELP';

UPDATE Language_ko_KR
SET Text = Text||'[NEWLINE][COLOR_MENU_BLUE]폭풍[ENDCOLOR]으로 인해 [ICON_STRENGTH] [COLOR_NEGATIVE_TEXT]공격력[ENDCOLOR] -20% 및 추가 [ICON_MOVES] [COLOR_NEGATIVE_TEXT]이동 비용[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_PROMOTION_HOVERING_UNIT_HELP';

UPDATE Language_ko_KR
SET Text = Text||'[NEWLINE][COLOR_MENU_BLUE]폭풍[ENDCOLOR]으로 인해 추가 [ICON_MOVES] [COLOR_NEGATIVE_TEXT]이동 비용[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_PROMOTION_RECON_EXPERIENCE_HELP';

UPDATE Language_ko_KR
SET Text = Text||'[NEWLINE][COLOR_MENU_BLUE]폭풍[ENDCOLOR]으로 인해 추가 [ICON_MOVES] [COLOR_NEGATIVE_TEXT]이동 비용[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_PROMOTION_ALLWATER_EMBARKATION_HELP';

UPDATE Language_ko_KR
SET Text = Text||'[NEWLINE][COLOR_MENU_BLUE]폭풍[ENDCOLOR]으로 인해 추가 [ICON_MOVES] [COLOR_NEGATIVE_TEXT]이동 비용[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_PROMOTION_EMBARKATION_HELP';

UPDATE Language_ko_KR
SET Text = Text||'[NEWLINE][COLOR_MENU_BLUE]폭풍[ENDCOLOR]으로 인한 [ICON_MOVES] [COLOR_POSITIVE_TEXT]이동 비용[ENDCOLOR] 절반으로 감소'
WHERE Tag = 'TXT_KEY_PROMOTION_NAVIGATOR_2_HELP';

UPDATE Language_ko_KR
SET Text = Text||'[NEWLINE][COLOR_MENU_BLUE]폭풍[ENDCOLOR]으로 인한 [ICON_MOVES] [COLOR_POSITIVE_TEXT]이동 비용[ENDCOLOR] 절반으로 감소'
WHERE Tag = 'TXT_KEY_PROMOTION_FROGMAN_HELP';
----------------------------------------------------------
-- 텍스트 키
----------------------------------------------------------
INSERT INTO Language_ko_KR	(Tag,										Text)
	VALUES					('TXT_KEY_IMPROVEMENT_STORM',				'폭풍'),
							('TXT_KEY_CIV5_IMPROVEMENTS_STORM_HELP',	'폭풍은 자연환경이나 대기가 교란되는 상태를 말합니다. 강풍, 토네이도, 우박, 천둥과 번개(뇌우), 호강수(눈보라, 폭우), 어는 비(착빙성 폭풍우), 강풍(열대성 저기압, 폭풍), 모래 폭풍과 같이 대기를 통해 어떤 물질을 운반하는 바람 등 정상적인 조건에 심각한 교란이 발생하는 경우를 말합니다.  폭풍은 생명과 재산에 피해를 줄 수 있으며, 인간의 이동과 시야를 제한할 수도 있습니다.'),
							('TXT_KEY_CIV5_IMPROVEMENTS_STORM_TEXT',	'폭풍은 대양과 해안 지역에서 자연스럽게 발생합니다.'),
							('TXT_KEY_FEATURE_STORM',					'시야 및 이동 제한'),
							('TXT_KEY_CIV5_WASHOUT',					'[COLOR_MENU_BLUE]유실[ENDCOLOR]'),
							('TXT_KEY_PROMOTION_AIR_WEATHER',			'민감한 날씨'),
							('TXT_KEY_PROMOTION_AIR_WEATHER_HELP',		'[COLOR_MENU_BLUE]폭풍[ENDCOLOR] 속에서 [ICON_WAR] [COLOR_NEGATIVE_TEXT]공격력[ENDCOLOR]이 -20% 감소하고 추가 [ICON_MOVES] [COLOR_NEGATIVE_TEXT]이동 비용[ENDCOLOR]이 발생합니다.');