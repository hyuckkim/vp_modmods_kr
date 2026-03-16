---------------------------------------------------------------------------------------------------------------
-- Restore espionage spy ranks (only for Bletchley Park)
---------------------------------------------------------------------------------------------------------------
UPDATE Language_ko_KR
SET Text = '[COLOR_MAGENTA]합리주의[ENDCOLOR] 정책을 완성해야 합니다. 건설된 도시에 연구소를 [COLOR_POSITIVE_TEXT]무료[ENDCOLOR]로 획득하고, 모든 [ICON_VP_SCIENTIST] 과학자의 [ICON_RESEARCH] 과학이 +1 증가합니다. [ICON_VP_SPY_POINTS] 스파이 점수를 200 획득하고, 기존 [ICON_SPY] 스파이의 레벨이 상승합니다. 모든 [ICON_SPY] 도시의 보안이 +10 증가합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_BLETCHLEY_PARK_HELP';