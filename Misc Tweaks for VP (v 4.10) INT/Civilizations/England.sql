UPDATE Language_ko_KR
SET Text = '해상 전투 및 승선 유닛의 [ICON_MOVES] 이동력이 +1 증가하고, 해상 전투 유닛 [ICON_GOLD] 골드 유지비가 -25% 감소합니다. 자신이 소유한 모든 도시의 [ICON_SPY] 도시 보안이 +15 증가합니다. [ICON_SPY] 스파이는 1턴 안에 어느 도시로든 이동하며, 한 등급 높은 임무를 수행합니다. [ICON_SPY] 스파이를 가지고 시작합니다.'
WHERE Tag = 'TXT_KEY_TRAIT_OCEAN_MOVEMENT';

---------------------------------------------------------------------------------------------------------------
-- 기타 스파이 관련 자료(옮길 생각이 들 때까지 임시로 여기에 보관)
---------------------------------------------------------------------------------------------------------------
UPDATE Language_ko_KR
SET Text = '[COLOR_MAGENTA]합리주의[ENDCOLOR] 정책을 완성해야 합니다. 건설된 도시에 [COLOR_POSITIVE_TEXT]무료[ENDCOLOR] 연구소를 제공하고, 모든 [ICON_VP_SCIENTIST] 과학자는 [ICON_RESEARCH] 과학을 +1 얻습니다. [ICON_VP_SPY_POINTS] 스파이 점수 200점을 받으면 기존의 [ICON_SPY] 스파이 모두 레벨이 올라갑니다. 모든 도시에서 [ICON_SPY] 도시 보안이 +10 증가합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_BLETCHLEY_PARK_HELP';