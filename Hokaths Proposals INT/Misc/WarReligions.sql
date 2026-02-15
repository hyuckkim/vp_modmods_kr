-- this is odd-one-out for yields, buff it
UPDATE Language_ko_KR
SET Text = Replace(Text, '+5 [ICON_PEACE] Faith', '+3 [ICON_CULTURE] Culture, +5 [ICON_PEACE] Faith')
WHERE Tag = 'TXT_KEY_BELIEF_CEREMONIAL_BURIAL';

-----------------------------------------------------------------------------------------------

-- hero worship/interfaith dialogue/ritual sacrifice
UPDATE Language_ko_KR
SET Text = '+1 [ICON_FOOD] Food and [ICON_PRODUCTION] Production in the Holy City for every 2 Followers of other [ICON_RELIGION] Religions in owned Cities (max 100 Followers). Receive 50 [ICON_PEACE] Faith and [ICON_GOLDEN_AGE] Golden Age Points per converted [ICON_CITIZEN] Citizen when [ICON_INQUISITOR] Removing Heresy.[NEWLINE]Unlocks [COLOR_POSITIVE_TEXT]Great Altar National Wonder[ENDCOLOR] (+5 [ICON_PRODUCTION] Production and [ICON_PEACE] Faith; [ICON_FOOD]/[ICON_PRODUCTION] Yields on Kill when in [ICON_GOLDEN_AGE] Golden Age; +5 [ICON_PRODUCTION] Production from [ICON_RELIGION] Holy Sites; unlocks [COLOR_POSITIVE_TEXT]Reformation Belief[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_BELIEF_INTERFAITH_DIALOGUE';

UPDATE Language_ko_KR
SET Text = 'During a [ICON_GOLDEN_AGE] Golden Age, gain 20 [ICON_FOOD] Food and [ICON_PRODUCTION] Production in the City when an Enemy Unit is defeated in battle, scaling with Era.[NEWLINE][NEWLINE]+5 [ICON_PRODUCTION] Production from all [ICON_RELIGION] Holy Sites.[NEWLINE][NEWLINE]May only be constructed in a Holy City, and only if at least 15% of the global population follows your [ICON_RELIGION] Religion (scaling with map size). -1 [ICON_HAPPINESS_3] Unhappiness from Religious Unrest, and allows you to select a [COLOR_POSITIVE_TEXT]Reformation Belief[ENDCOLOR].[NEWLINE][NEWLINE]Boosts Pressure of [ICON_RELIGION] Religious Majority emanating from this City by 25%, and increases the City''s resistance to conversion by 20%.[NEWLINE][NEWLINE]Receive 1 [COLOR_POSITIVE_TEXT]Additional[ENDCOLOR] [ICON_DIPLOMAT] Delegate in the World Congress for every 10 Cities following your [ICON_RELIGION] Religion.'
WHERE Tag = 'TXT_KEY_BUILDING_GREAT_ALTAR_HELP';

-----------------------------------------------------------------------------------------------

-- buff inquisition, yield is too low
UPDATE Belief_YieldFromRemoveHeresy SET Yield = 75 WHERE BeliefType = 'BELIEF_RELIGIOUS_TEXTS';
UPDATE Language_ko_KR
SET Text = '[ICON_INQUISITOR] Inquisitors cost 33% less [ICON_PEACE] Faith, and generate 75 [ICON_GOLD] Gold per converted [ICON_CITIZEN] Citizen when Removing Heresy. Your [ICON_SPY] Spies exert +52 Religious Pressure on the Cities they occupy (Standard Speed), and +2 [ICON_HAPPINESS_1] Happiness if stationed in a foreign City.'
WHERE Tag = 'TXT_KEY_BELIEF_RELIGIOUS_TEXTS';

-- Teocalli effect
UPDATE Language_ko_KR SET
Text = '+20 [ICON_GOLDEN_AGE] Golden Age Points when a Unit created in this City defeats an Enemy Unit in battle, scaling with Era. +20% [ICON_PRODUCTION] Production towards Land Units. Boosts Pressure of [ICON_RELIGION] Religious Majority emanating from this City by 50%.[NEWLINE][NEWLINE]-1 [ICON_HAPPINESS_3] Unhappiness from [ICON_FOOD] and [ICON_PRODUCTION] Distress.'
WHERE Tag = 'TXT_KEY_BUILDING_TEOCALLI_HELP';

-- Buff Order Faith to 25%
UPDATE Language_ko_KR SET 
Text = Replace(Text, 'Faith equal to 10%', 'Faith equal to 25%') 
WHERE Tag = 'TXT_KEY_BUILDING_ORDER_HELP';

-- move military supply to gurdwara
UPDATE Language_ko_KR SET 
Text = Replace(Text, 'City by 25%.', 'City by 25%. Increases [ICON_SILVER_FIST] Military Unit Supply Cap by 1.') 
WHERE Tag = 'TXT_KEY_BUILDING_GURDWARA_HELP';
-----------------------------------------------------------------------------------------------
INSERT INTO Language_ko_KR 
	(Tag, Text)
VALUES
	('TXT_KEY_BELIEF_GONGFU_SHORT', 'Mastery'),
	('TXT_KEY_BELIEF_GONGFU', '+1 [ICON_HAPPINESS_1] for every 8 Followers of your [ICON_RELIGION] Religion in [COLOR_NEGATIVE_TEXT]non-Enemy[ENDCOLOR] Foreign Cities, and +1 [ICON_RESEARCH] Science and [ICON_CULTURE] Culture for every 2 Followers in [ICON_CITY_STATE] City-States (max 80 Followers).[NEWLINE]Unlocks [COLOR_POSITIVE_TEXT]Martial Sanctum National Wonder[ENDCOLOR] (+3 [ICON_PRODUCTION] Production, [ICON_PEACE] Faith, and [ICON_GREAT_GENERAL] Great General Points; +15 XP to Units created in the City; +5 [ICON_GREAT_GENERAL] Great General Points from [ICON_RELIGION] Holy Sites; unlocks [COLOR_POSITIVE_TEXT]Reformation Belief[ENDCOLOR]).'),
	('TXT_KEY_BUILDING_MARTIAL_SANCTUM', 'Martial Sanctum'),
	('TXT_KEY_BUILDING_MARTIAL_SANCTUM_PEDIA', 'Buddhism, Taoism, and Hinduism at least!'),
	('TXT_KEY_BUILDING_MARTIAL_SANCTUM_HELP', '+15 XP to all Units created in this City.[NEWLINE][NEWLINE]+5 [ICON_GREAT_GENERAL] Great General Points from all [ICON_RELIGION] Holy Sites.[NEWLINE][NEWLINE]May only be constructed in a Holy City, and only if at least 15% of the global population follows your [ICON_RELIGION] Religion (scaling with map size). -1 [ICON_HAPPINESS_3] Unhappiness from Religious Unrest, and allows you to select a [COLOR_POSITIVE_TEXT]Reformation Belief[ENDCOLOR].[NEWLINE][NEWLINE]Boosts Pressure of [ICON_RELIGION] Religious Majority emanating from this City by 25%, and increases the City''s resistance to conversion by 20%.[NEWLINE][NEWLINE]Receive 1 [COLOR_POSITIVE_TEXT]Additional[ENDCOLOR] [ICON_DIPLOMAT] Delegate in the World Congress for every 10 Cities following your [ICON_RELIGION] Religion.'),
	('TXT_KEY_BUILDING_MARTIAL_SANCTUM_STRATEGY', 'Build it, moron'),

	('TXT_KEY_BELIEF_ETERNAL_GLORY_SHORT', 'Eternal Glory'),
	('TXT_KEY_BELIEF_ETERNAL_GLORY', '+4 [ICON_PRODUCTION] Production, [ICON_PEACE] Faith, and [ICON_CULTURE_LOCAL] Border Growth Points from Courthouses, and +2 in the Holy City for every Foreign City following your [ICON_RELIGION] Religion (max 40 Cities).[NEWLINE]Unlocks [COLOR_POSITIVE_TEXT]Heavenly Stair National Wonder[ENDCOLOR] (+4 [ICON_PEACE] Faith, +8 [ICON_CULTURE_LOCAL] Border Growth Points; [ICON_PEACE]/[ICON_CULTURE_LOCAL] Yields on Kill in all Cities; +5 [ICON_GREAT_ADMIRAL] Great Admiral Points from [ICON_RELIGION] Holy Sites; unlocks [COLOR_POSITIVE_TEXT]Reformation Belief[ENDCOLOR]).'),
	('TXT_KEY_BUILDING_STAIRWAY_TO_HEAVEN', 'Heavenly Stair'),
	('TXT_KEY_BUILDING_STAIRWAY_TO_HEAVEN_PEDIA', 'Mount Olympus, Bifrost, Shrine of the Ascension'),
	('TXT_KEY_BUILDING_STAIRWAY_TO_HEAVEN_HELP', '+2 [ICON_PEACE] Faith and [ICON_CULTURE_LOCAL] Border Growth Points in all Cities when an Enemy Unit is defeated in battle.[NEWLINE][NEWLINE]+5 [ICON_GREAT_ADMIRAL] Great Admiral Points from all [ICON_RELIGION] Holy Sites.[NEWLINE][NEWLINE]May only be constructed in a Holy City, and only if at least 15% of the global population follows your [ICON_RELIGION] Religion (scaling with map size). -1 [ICON_HAPPINESS_3] Unhappiness from Religious Unrest, and allows you to select a [COLOR_POSITIVE_TEXT]Reformation Belief[ENDCOLOR].[NEWLINE][NEWLINE]Boosts Pressure of [ICON_RELIGION] Religious Majority emanating from this City by 25%, and increases the City''s resistance to conversion by 20%.[NEWLINE][NEWLINE]Receive 1 [COLOR_POSITIVE_TEXT]Additional[ENDCOLOR] [ICON_DIPLOMAT] Delegate in the World Congress for every 10 Cities following your [ICON_RELIGION] Religion.'),
	('TXT_KEY_BUILDING_STAIRWAY_TO_HEAVEN_STRATEGY', 'Build it, moron'),

	('TXT_KEY_BELIEF_CREMATION_SHORT', 'Cremation'),
	('TXT_KEY_BELIEF_CREMATION', 'Gain [ICON_PEACE] Faith when an owned Unit dies equal to 200% of its [ICON_STRENGTH] Strength. +1 [ICON_HAPPINESS_1] Happiness in Cities on Rivers. +10 [ICON_CULTURE] Culture when a [ICON_CITIZEN] Citizen is born, scaling with Era.'),

	('TXT_KEY_BELIEF_DHARMA_WAR_SHORT', 'Dharma-yuddha'),
	('TXT_KEY_BELIEF_DHARMA_WAR', 'Receive 100 [ICON_PEACE] Faith and [ICON_GOLDEN_AGE] Golden Age Points when you conquer a City, as well as 25 [ICON_GREAT_GENERAL] Great General Points (if City is landlocked) or [ICON_GREAT_ADMIRAL] Great Admiral Points (if Coastal). Bonus scales with City [ICON_CITIZEN] Population and Era. Gain [ICON_TOURISM] Tourism from killing enemy Units equal to 200% of their [ICON_STRENGTH] Strength.');

UPDATE Language_ko_KR SET Text = 'Abstinence' WHERE Tag = 'TXT_KEY_BELIEF_RELIGIOUS_ART_SHORT';

UPDATE Language_ko_KR SET Text = 'Remedy' WHERE Tag = 'TXT_KEY_BELIEF_ASCETISM_SHORT';