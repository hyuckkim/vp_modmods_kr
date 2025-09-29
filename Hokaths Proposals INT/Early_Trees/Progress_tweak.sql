UPDATE Language_ko_KR
SET Text = '[COLOR_POSITIVE_TEXT]Organization[ENDCOLOR][NEWLINE][ICON_BULLET]+2 [ICON_PRODUCTION] Production in every City.[NEWLINE][ICON_BULLET]-5% [ICON_GOLD] Gold cost for purchasing Units.[NEWLINE][ICON_BULLET]+1 [ICON_MOVES] Movement for Workers.'
WHERE Tag = 'TXT_KEY_POLICY_COLLECTIVE_RULE_HELP';

UPDATE Language_ko_KR
SET Text = Replace(Text, '[ICON_BULLET]+1 [ICON_HAPPINESS_1] Happiness in every City and +1 [ICON_HAPPINESS_1] Happiness for every 15 [ICON_CITIZEN] Citizens in a City.', '[ICON_BULLET]+1 [ICON_PRODUCTION] Production, [ICON_GOLD] Gold, and [ICON_GOLDEN_AGE] Golden Age Point from [ICON_CONNECTED] City Connections.[NEWLINE][ICON_BULLET]+1 [ICON_HAPPINESS_1] Happiness in every City.')
WHERE Tag = 'TXT_KEY_POLICY_REPRESENTATION_HELP';