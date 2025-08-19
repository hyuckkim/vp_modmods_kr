UPDATE Language_ko_KR
SET Text = '+1 [ICON_MOVES] Movement for Naval and Embarked Units, and -25% Naval Unit [ICON_GOLD] Gold maintenance. +15 [ICON_SPY] City Security in all owned Cities. [ICON_SPY] Spies travel to any City in 1 turn and operate one Rank higher. Starts with a [ICON_SPY] Spy.'
WHERE Tag = 'TXT_KEY_TRAIT_OCEAN_MOVEMENT';

---------------------------------------------------------------------------------------------------------------
-- Other espionage stuff (temporarily placed here until I feel like moving it)
---------------------------------------------------------------------------------------------------------------
UPDATE Language_ko_KR
SET Text = 'Requires completion of [COLOR_MAGENTA]Rationalism[ENDCOLOR] Branch. Receive a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Research Lab in the City in which it is built, and all [ICON_VP_SCIENTIST] Scientists gain +1 [ICON_RESEARCH] Science. Receive 200 [ICON_VP_SPY_POINTS] Spy Points, and all your existing [ICON_SPY] Spies are leveled up. +10 [ICON_SPY] City Security in all Cities.'
WHERE Tag = 'TXT_KEY_BUILDING_BLETCHLEY_PARK_HELP';