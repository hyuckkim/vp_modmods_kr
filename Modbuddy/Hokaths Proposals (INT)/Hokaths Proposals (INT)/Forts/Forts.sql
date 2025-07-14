-- 요새
UPDATE Language_ko_KR
SET Text = '요새는 국경 바깥에 지을 수 있는 특별한 시설로, 해당 타일에 주둔한 유닛의 방어 보너스를 50% 향상시킵니다. 그러나 요새는 적 영토에 있는 유닛에게 방어 보너스를 제공하지 않으며 [COLOR_NEGATIVE_TEXT]유지비[ENDCOLOR]로 턴당 2 [ICON_GOLD] 골드가 필요합니다. 서로 인접하여 지을 수 없습니다. 공격 후에도 소유한 유닛이 이 타일에 주둔할 수 있는 [COLOR_POSITIVE_TEXT]요새[ENDCOLOR]와 아군 [COLOR_POSITIVE_TEXT]해상[ENDCOLOR] 유닛이 통과할 수 있는 [COLOR_POSITIVE_TEXT]운하[ENDCOLOR]가 포함되어 있습니다.'
WHERE Tag = 'TXT_KEY_CIV5_IMPROVEMENTS_FORT_TEXT';

UPDATE Language_ko_KR
SET Text = '[COLOR_NEGATIVE_TEXT]유지비[ENDCOLOR]로 턴당 2 [ICON_GOLD] 골드가 필요합니다. 이 타일에 주둔한 모든 유닛의 [ICON_STRENGTH] 방어력이 50% 증가합니다. 공격 후에도 소유한 유닛이 이 타일에 주둔할 수 있는 [COLOR_POSITIVE_TEXT]요새[ENDCOLOR]와 아군 [COLOR_POSITIVE_TEXT]해상[ENDCOLOR] 유닛이 통과할 수 있는 [COLOR_POSITIVE_TEXT]운하[ENDCOLOR]가 포함되어 있습니다.'
WHERE Tag = 'TXT_KEY_BUILD_FORT_HELP';