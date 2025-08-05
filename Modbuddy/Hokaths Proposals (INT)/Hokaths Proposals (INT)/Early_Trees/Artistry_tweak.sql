UPDATE Language_ko_KR
SET Text = '[COLOR_POSITIVE_TEXT]National Treasure[ENDCOLOR][NEWLINE][ICON_BULLET]Expending a [ICON_GREAT_PEOPLE] Great Person grants 75 [ICON_GOLD] Gold, scaling with Era.[NEWLINE][ICON_BULLET]A [ICON_GREAT_PEOPLE] Great Person of your choice appears near your [ICON_CAPITAL] Capital.[NEWLINE][ICON_BULLET]Gain 250 [ICON_GOLD] Gold when you construct [ICON_WONDER] World Wonders, scaling with Era.'
WHERE Tag = 'TXT_KEY_POLICY_ARTISTIC_GENIUS_HELP';

UPDATE Language_ko_KR
SET Text = Replace(Text, '+3 [ICON_RESEARCH] Science from [ICON_RES_ARTIFACTS] Landmarks.', '+3 [ICON_RESEARCH] Science from [ICON_RES_ARTIFACTS] Landmarks and [ICON_VP_ARTIFACT] Artifacts.')
WHERE Tag = 'TXT_KEY_POLICY_BRANCH_AESTHETICS_HELP';