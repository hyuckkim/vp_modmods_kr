-- this must load first before the appending occurs
UPDATE Language_ko_KR
SET Text = 'Gain 10 [ICON_SPY] City Security, plus 1 for every four [ICON_CITIZEN] Citizens in the City.[NEWLINE][NEWLINE]-1 [ICON_HAPPINESS_3] Unhappiness from [ICON_FOOD] and [ICON_PRODUCTION] Distress.'
WHERE Tag = 'TXT_KEY_BUILDING_CONSTABLE_HELP';

UPDATE Language_ko_KR
SET Text = 'Gain 10 [ICON_SPY] City Security, plus 1 for every four [ICON_CITIZEN] Citizens in the City. When you capture or identify a foreign Spy in this City, gain 50 [ICON_CULTURE] Culture, scaling with Era.[NEWLINE][NEWLINE]+1 [ICON_GOLD] Gold, [ICON_CULTURE] Culture, and [ICON_RESEARCH] Science in this City for every Global Monopoly on Empire.[NEWLINE][NEWLINE]Contains 1 slot for a [ICON_GREAT_WORK] Great Work of Art or Artifact. -1 [ICON_HAPPINESS_3] Unhappiness from [ICON_FOOD] and [ICON_PRODUCTION] Distress.'
WHERE Tag = 'TXT_KEY_BUILDING_NETHERLANDS_SCHUTTERIJ_HELP';

UPDATE Language_ko_KR
SET Text = 'Use this unit to construct new cities. It cannot defend itself, so accompany it with a combat unit. When founded, cities built by Colonists start with 5 Citizens, claim additional territory, and automatically receive the following selection of buildings:[NEWLINE][NEWLINE][ICON_BULLET] Amphitheater[NEWLINE][ICON_BULLET] Aqueduct[NEWLINE][ICON_BULLET] Arena[NEWLINE][ICON_BULLET] Barracks[NEWLINE][ICON_BULLET] Council[NEWLINE][ICON_BULLET] Forge[NEWLINE][ICON_BULLET] Granary[NEWLINE][ICON_BULLET] Harbor[NEWLINE][ICON_BULLET] Herbalist[NEWLINE][ICON_BULLET] Library[NEWLINE][ICON_BULLET] Lighthouse[NEWLINE][ICON_BULLET] Market[NEWLINE][ICON_BULLET] Monument[NEWLINE][ICON_BULLET] Shrine[NEWLINE][ICON_BULLET] Smokehouse[NEWLINE][ICON_BULLET] Temple[NEWLINE][ICON_BULLET] Water Mill (if applicable)[NEWLINE][ICON_BULLET] Well (if applicable)[NEWLINE][ICON_BULLET] Windmill[NEWLINE][ICON_BULLET] Workshop[NEWLINE][ICON_BULLET] Prison[NEWLINE][NEWLINE]Note: the bonuses for constructing buildings from the Progress and Industry policy branches do not apply to the buildings constructed by Colonists!'
WHERE Tag = 'TXT_KEY_UNIT_COLONIST_STRATEGY';