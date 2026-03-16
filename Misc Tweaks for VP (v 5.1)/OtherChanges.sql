----------------------------------------------------
-- Inquisitor strength
----------------------------------------------------
UPDATE Defines SET Value = 75 WHERE Name = 'INQUISITION_EFFECTIVENESS';

---------------------------------------------------------------------------------------------------------------
-- Restore espionage spy ranks (only for Bletchley Park)
---------------------------------------------------------------------------------------------------------------
UPDATE Defines SET Value = 10 WHERE Name = 'ESPIONAGE_NP_PER_SPY_RANK';

UPDATE CityEventChoices SET CityDefenseModifier = 10 WHERE Type = 'ESPIONAGE_EVENT_CHOICE_COUNTERSPY_DEFENSE';

UPDATE Buildings SET GlobalSpySecurityModifier = 10, SpyRankChange = 1, InstantSpyRankChange = 1 WHERE Type = 'BUILDING_BLETCHLEY_PARK';

UPDATE Language_en_US
SET Text = 'Requires completion of [COLOR_MAGENTA]Rationalism[ENDCOLOR] Branch. Receive a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Research Lab in the City in which it is built, and all [ICON_VP_SCIENTIST] Scientists gain +1 [ICON_RESEARCH] Science. Receive 200 [ICON_VP_SPY_POINTS] Spy Points, and all your existing [ICON_SPY] Spies are leveled up. +10 [ICON_SPY] City Security in all Cities.'
WHERE Tag = 'TXT_KEY_BUILDING_BLETCHLEY_PARK_HELP';