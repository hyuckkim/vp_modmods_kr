-- Public School
UPDATE Language_ko_KR
SET Text = '+1 [ICON_RESEARCH] Science for every 4 [ICON_CITIZEN] Citizens in the City.[NEWLINE][NEWLINE]-1 [ICON_HAPPINESS_3] Unhappiness from [ICON_RESEARCH] Illiteracy.'
WHERE Tag = 'TXT_KEY_BUILDING_PUBLIC_SCHOOL_HELP';

-- Broadcast Tower
UPDATE Language_ko_KR
SET Text = '+1 [ICON_CULTURE] Culture and [ICON_TOURISM] Tourism for every 4 [ICON_CITIZEN] Citizens in the City. [ICON_GREAT_WORK] Great Works in the City produce +2 [ICON_TOURISM] Tourism.[NEWLINE][NEWLINE]-1 [ICON_HAPPINESS_3] Unhappiness from [ICON_CULTURE] Boredom.[NEWLINE][NEWLINE]+10 [ICON_GOLD] Gold if [COLOR_POSITIVE_TEXT]Themed[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_BUILDING_BROADCAST_TOWER_HELP';
