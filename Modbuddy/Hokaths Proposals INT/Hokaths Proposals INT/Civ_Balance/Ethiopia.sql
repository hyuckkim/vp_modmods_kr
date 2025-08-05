UPDATE Language_ko_KR
SET Text = '정책 분야를 완료하거나, 새로운 신념을 채택하거나, 첫 번째 이념을 선택하면 [COLOR_POSITIVE_TEXT]무료[ENDCOLOR] 기술 1개를 받습니다. 전략 자원으로부터 [ICON_PEACE] 신앙이 +1 증가합니다. [ICON_GOLDEN_AGE] 황금기 동안 [ICON_PEACE] 신앙이 +25% 증가합니다.'
WHERE Tag = 'TXT_KEY_TRAIT_BONUS_AGAINST_TECH';

UPDATE Language_ko_KR
SET Text = '{TXT_KEY_BUILDING_MONUMENT_DESC}를 대체하는 고유한 에티오피아 건물입니다. {TXT_KEY_BUILDING_MONUMENT_DESC}의 보너스에 더해, {TXT_KEY_BUILDING_STELE}이 {TXT_KEY_BUILDING_SHRINE}와 마찬가지로 [ICON_PEACE] 신앙을 생성합니다. 또한 새로운 기술을 발견하면 [ICON_GOLDEN_AGE] 황금기의 속도가 빨라지고, 고유 능력과 함께 선순환이 이루어집니다.'
WHERE Tag = 'TXT_KEY_BUILDING_STELE_STRATEGY';

UPDATE Language_ko_KR
SET Text = '[COLOR_CYAN]기술[ENDCOLOR]을 발견하면 [ICON_GOLDEN_AGE] 황금기 점수 10을 얻습니다. [COLOR:105:105:105:255](시대별 보정)[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_BUILDING_STELE_HELP';