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
Text = '+2 [ICON_PEACE] Faith[NEWLINE]+1 [ICON_HAPPINESS_1] Happiness[NEWLINE][NEWLINE]+20 [ICON_GOLDEN_AGE] Golden Age Points when a Unit from this City defeats a Military Unit.[NEWLINE][NEWLINE]+20% [ICON_PRODUCTION] Production towards Military Units.[NEWLINE][NEWLINE]+50% Religious Pressure towards other Cities if this Religion is the Majority Religion of the City.[NEWLINE][NEWLINE]-1 [ICON_HAPPINESS_3] Unhappiness from [ICON_FOOD] and [ICON_PRODUCTION] Distress.'
WHERE Tag = 'TXT_KEY_BUILDING_TEOCALLI_TOOLTIP';

-- Buff Order Faith to 25%
UPDATE Language_ko_KR SET 
Text = Replace(Text, 'Faith equal to 10%', 'Faith equal to 25%') 
WHERE Tag = 'TXT_KEY_BUILDING_ORDER_TOOLTIP';

-- +2 [ICON_PEACE] Faith[NEWLINE]+3 [ICON_GOLD] Gold[NEWLINE][NEWLINE]Gain [ICON_PEACE] Faith equal to 10% of [ICON_PRODUCTION] Production cost when completing production of a Military Unit.[NEWLINE][NEWLINE]+10% [ICON_RANGE_STRENGTH] City Strike Strength.[NEWLINE][NEWLINE]All existing and future eligible Units trained in this City gain the [COLOR_POSITIVE_TEXT]{TXT_KEY_PROMOTION_MORALE}[ENDCOLOR] Promotion.[NEWLINE][NEWLINE]+25% Religious Pressure towards other Cities if this Religion is the Majority Religion of the City.[NEWLINE][NEWLINE]-1 [ICON_HAPPINESS_3] Unhappiness from [ICON_FOOD] and [ICON_PRODUCTION] Distress.

-- move military supply to gurdwara
UPDATE Language_ko_KR SET 
Text = Replace(Text, '[NEWLINE][NEWLINE]+10% [ICON_STRENGTH] City Strength from Buildings.', '[NEWLINE][NEWLINE]Increases [ICON_SILVER_FIST] Military Unit Supply Cap by 1.[NEWLINE][NEWLINE]+10% [ICON_STRENGTH] City Strength from Buildings.') 
WHERE Tag = 'TXT_KEY_BUILDING_GURDWARA_TOOLTIP';
-----------------------------------------------------------------------------------------------
INSERT INTO Language_ko_KR 
	(Tag, Text)
VALUES
	('TXT_KEY_BELIEF_GONGFU_SHORT', 'Mastery'),
	('TXT_KEY_BELIEF_GONGFU', '+1 [ICON_HAPPINESS_1] for every 8 Followers of your [ICON_RELIGION] Religion in [COLOR_NEGATIVE_TEXT]non-Enemy[ENDCOLOR] Foreign Cities, and +1 [ICON_RESEARCH] Science and [ICON_CULTURE] Culture for every 2 Followers in [ICON_CITY_STATE] City-States (max 80 Followers).[NEWLINE]Unlocks [COLOR_POSITIVE_TEXT]Martial Sanctum National Wonder[ENDCOLOR] (+3 [ICON_PRODUCTION] Production, [ICON_PEACE] Faith, and [ICON_GREAT_GENERAL] Great General Points; +15 XP to Units created in the City; +5 [ICON_GREAT_GENERAL] Great General Points from [ICON_RELIGION] Holy Sites; unlocks [COLOR_POSITIVE_TEXT]Reformation Belief[ENDCOLOR]).'),
	('TXT_KEY_BUILDING_MARTIAL_SANCTUM', 'Martial Sanctum'),
	('TXT_KEY_BUILDING_MARTIAL_SANCTUM_PEDIA', 'Buddhism, Taoism, and Hinduism at least!'),
	('TXT_KEY_BUILDING_MARTIAL_SANCTUM_HELP', ''),
-- +15 XP to all Units created in this City.[NEWLINE][NEWLINE]+5 [ICON_GREAT_GENERAL] Great General Points from all [ICON_RELIGION] Holy Sites.[NEWLINE][NEWLINE]May only be constructed in a Holy City, and only if at least 15% of the global population follows your [ICON_RELIGION] Religion (scaling with map size). -1 [ICON_HAPPINESS_3] Unhappiness from Religious Unrest, and allows you to select a [COLOR_POSITIVE_TEXT]Reformation Belief[ENDCOLOR].[NEWLINE][NEWLINE]Boosts Pressure of [ICON_RELIGION] Religious Majority emanating from this City by 25%, and increases the City''s resistance to conversion by 20%.[NEWLINE][NEWLINE]Receive 1 [COLOR_POSITIVE_TEXT]Additional[ENDCOLOR] [ICON_DIPLOMAT] Delegate in the World Congress for every 10 Cities following your [ICON_RELIGION] Religion.
	('TXT_KEY_BUILDING_MARTIAL_SANCTUM_STRATEGY', 'Unlike other Religious bonuses, which focus on gaining yields for being successful in war, the Martial Sanctum actually improves your capabilities, by allowing you to train a more highly promoted cadre of soldiers. Since it is limited to your Holy City, make sure to build other important military infrastructure there, or invest in bonuses like the Order to bring them to you.'),

	('TXT_KEY_BELIEF_ETERNAL_GLORY_SHORT', 'Eternal Glory'),
	('TXT_KEY_BELIEF_ETERNAL_GLORY', '+4 [ICON_PRODUCTION] Production, [ICON_PEACE] Faith, and [ICON_CULTURE_LOCAL] Border Growth Points from Courthouses, and +2 in the Holy City for every Foreign City following your [ICON_RELIGION] Religion (max 40 Cities).[NEWLINE]Unlocks [COLOR_POSITIVE_TEXT]Heavenly Stair National Wonder[ENDCOLOR] (+4 [ICON_PEACE] Faith, +8 [ICON_CULTURE_LOCAL] Border Growth Points; [ICON_PEACE]/[ICON_CULTURE_LOCAL] Yields on Kill in all Cities; +5 [ICON_GREAT_ADMIRAL] Great Admiral Points from [ICON_RELIGION] Holy Sites; unlocks [COLOR_POSITIVE_TEXT]Reformation Belief[ENDCOLOR]).'),
	('TXT_KEY_BUILDING_STAIRWAY_TO_HEAVEN', 'Heavenly Stair'),
	('TXT_KEY_BUILDING_STAIRWAY_TO_HEAVEN_PEDIA', 'Mount Olympus, Bifrost, Shrine of the Ascension'),
	('TXT_KEY_BUILDING_STAIRWAY_TO_HEAVEN_HELP', ''),
-- +2 [ICON_PEACE] Faith and [ICON_CULTURE_LOCAL] Border Growth Points in all Cities when an Enemy Unit is defeated in battle.[NEWLINE][NEWLINE]+5 [ICON_GREAT_ADMIRAL] Great Admiral Points from all [ICON_RELIGION] Holy Sites.[NEWLINE][NEWLINE]May only be constructed in a Holy City, and only if at least 15% of the global population follows your [ICON_RELIGION] Religion (scaling with map size). -1 [ICON_HAPPINESS_3] Unhappiness from Religious Unrest, and allows you to select a [COLOR_POSITIVE_TEXT]Reformation Belief[ENDCOLOR].[NEWLINE][NEWLINE]Boosts Pressure of [ICON_RELIGION] Religious Majority emanating from this City by 25%, and increases the City''s resistance to conversion by 20%.[NEWLINE][NEWLINE]Receive 1 [COLOR_POSITIVE_TEXT]Additional[ENDCOLOR] [ICON_DIPLOMAT] Delegate in the World Congress for every 10 Cities following your [ICON_RELIGION] Religion.
	('TXT_KEY_BUILDING_STAIRWAY_TO_HEAVEN_STRATEGY', 'Eternal Glory is a Founder Belief geared to war. Only by conquering can you construct Courthouses, and converting Foreign Cities will likely lead to conflict. In this, the Heavenly Stair directs you in bringing Faith and expanding the Borders of your Empire as you cut through both believer and non-believer alike in your search for Valhalla, or whatever afterlife awaits your religion. The widest, most warlike Empires will reap the greatest reward in the annals of history, and the eyes of (the) God(s)!'),

	('TXT_KEY_BELIEF_CREMATION_SHORT', 'Cremation'),
	('TXT_KEY_BELIEF_CREMATION', 'Gain [ICON_PEACE] Faith when an owned Unit dies equal to 200% of its [ICON_STRENGTH] Strength. +1 [ICON_HAPPINESS_1] Happiness in Cities on Rivers. +10 [ICON_CULTURE] Culture when a [ICON_CITIZEN] Citizen is born, scaling with Era.'),

	('TXT_KEY_BELIEF_DHARMA_WAR_SHORT', 'Dharma-yuddha'),
	('TXT_KEY_BELIEF_DHARMA_WAR', 'Receive 100 [ICON_PEACE] Faith and [ICON_GOLDEN_AGE] Golden Age Points when you conquer a City, as well as 25 [ICON_GREAT_GENERAL] Great General Points (if City is landlocked) or [ICON_GREAT_ADMIRAL] Great Admiral Points (if Coastal). Bonus scales with City [ICON_CITIZEN] Population and Era. Gain [ICON_TOURISM] Tourism from killing enemy Units equal to 200% of their [ICON_STRENGTH] Strength.');

UPDATE Language_ko_KR SET Text = 'Abstinence' WHERE Tag = 'TXT_KEY_BELIEF_RELIGIOUS_ART_SHORT';

UPDATE Language_ko_KR SET Text = 'Remedy' WHERE Tag = 'TXT_KEY_BELIEF_ASCETISM_SHORT';