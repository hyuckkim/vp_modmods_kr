----------------------------
-- Daoguan building with spy rebalance
----------------------------
REPLACE INTO Language_ko_KR
	(Tag, Text)
VALUES
	('TXT_KEY_BELIEF_DAOGUAN_SHORT', 'Daoguans'),
	('TXT_KEY_BELIEF_DAOGUAN', 'Use [ICON_PEACE] Faith to purchase Daoguans.'),
	('TXT_KEY_BUILDING_DAOGUAN', 'Daoguan'),
	('TXT_KEY_BUILDING_DAOGUAN_PEDIA', 'A Daoguan is a place of worship in Taoism. The structure and function of a Daoguan can vary according to the Taoist school the temple belongs to. For example, guan of the Quanzhen School are monasteries where celibate daoshi live.'),
	('TXT_KEY_BUILDING_DAOGUAN_HELP', '+10 [ICON_SPY] City Security and +10 [ICON_VP_SPY_POINTS] Spy Points. Boost Pressure of [ICON_RELIGION] Religious Majority emanating from this City by +25%, and increases the City''s resistance to [ICON_RELIGION] Religious conversion by 10%.[NEWLINE][NEWLINE]1 Specialist in this City no longer produces [ICON_HAPPINESS_3] Unhappiness from Urbanization.[NEWLINE][NEWLINE]Contains 1 slot for a [ICON_GREAT_WORK] Great Work of Writing.'),
	('TXT_KEY_BUILDING_DAOGUAN_STRATEGY', 'Can only be built in cities following a religion with the Daoguans belief. Construct this building by purchasing it with [ICON_PEACE] Faith. The Daoguan offers bonuses towards Great People generation and Spies. It is one of the only ways to leverage a large empire to boost your Espionage.'),
	('TXT_KEY_BUILDING_DAOGUAN_TOOLTIP', '+4 [ICON_PEACE] Faith[NEWLINE][NEWLINE]{TXT_KEY_BUILDING_DAOGUAN_HELP}');

------------------------------
-- Add espionage interactions to some founders
------------------------------
UPDATE Language_ko_KR
SET Text = '+1 [ICON_SPY] City Security for every 3 [ICON_CITIZEN] Citizens in the City.[NEWLINE][NEWLINE]' || Text
WHERE Tag = 'TXT_KEY_BUILDING_RELIGIOUS_LIBRARY_HELP';

UPDATE Language_ko_KR
SET Text = 'When you research a Technology, gain +2 [ICON_GOLDEN_AGE] Golden Age Points, [ICON_PEACE] Faith, and [ICON_CULTURE] Culture for every Follower of your [ICON_RELIGION] Religion (max 250 Followers).[NEWLINE]Unlocks [COLOR_POSITIVE_TEXT]Chartarium National Wonder[ENDCOLOR] (+1 [ICON_SPY] City Security for every 3 [ICON_CITIZEN] Citizens; +5 [ICON_RESEARCH] Science from [ICON_RELIGION] Holy Sites; unlocks [COLOR_POSITIVE_TEXT]Reformation Belief[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_BELIEF_TITHE';

-- council, control the church
UPDATE Language_ko_KR
SET Text = '+50 [ICON_VP_SPY_POINTS] Spy Points.[NEWLINE][NEWLINE]' || Text
WHERE Tag = 'TXT_KEY_BUILDING_HOLY_COUNCIL_HELP';

UPDATE Language_ko_KR
SET Text = 'When a City adopts your [ICON_RELIGION] Religion for the first time, gain 20 [ICON_RESEARCH] Science and [ICON_PRODUCTION] Production in your Holy City, scaling gradually based on the number of Cities following your [ICON_RELIGION] Religion (bonus caps at 25 Cities).[NEWLINE]Unlocks [COLOR_POSITIVE_TEXT]Holy Council National Wonder[ENDCOLOR] (+4 [ICON_PEACE] Faith, +5 [ICON_FOOD] Food, +50 [ICON_VP_SPY_POINTS] Spy Points; +5 [ICON_RESEARCH] Science from [ICON_RELIGION] Holy Sites; unlocks [COLOR_POSITIVE_TEXT]Reformation Belief[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_BELIEF_PAPAL_PRIMACY';

-- court, establish security
UPDATE Language_ko_KR
SET Text = '+8 [ICON_SPY] City Security in all Cities.[NEWLINE][NEWLINE]' || Text
WHERE Tag = 'TXT_KEY_BUILDING_DIVINE_COURT_HELP';

UPDATE Language_ko_KR
SET Text = 'When you unlock a Policy, gain 5 [ICON_PEACE] Faith, [ICON_RESEARCH] Science, and [ICON_GOLD] Gold for every Follower of your [ICON_RELIGION] Religion (max 250 Followers).[NEWLINE]Unlocks [COLOR_POSITIVE_TEXT]Divine Court National Wonder[ENDCOLOR] (+4 [ICON_PEACE] Faith, +6 [ICON_GOLD] Gold, +8 [ICON_SPY] City Security in all Cities; +5 [ICON_CULTURE] Culture from [ICON_RELIGION] Holy Sites; unlocks [COLOR_POSITIVE_TEXT]Reformation Belief[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_BELIEF_CHURCH_PROPERTY';

-- throne, aquire eunuchs. 80 has china in mind
UPDATE Language_ko_KR
SET Text = '+80 [ICON_VP_SPY_POINTS] Spy Points.[NEWLINE][NEWLINE]' || Text
WHERE Tag = 'TXT_KEY_BUILDING_HEAVENLY_THRONE_HELP';

UPDATE Language_ko_KR
SET Text = 'Holy City produces +20% of its Yields when your Empire is in a [ICON_GOLDEN_AGE] Golden Age.[NEWLINE]Unlocks [COLOR_POSITIVE_TEXT]Celestial Throne National Wonder[ENDCOLOR] (+2 [ICON_PEACE] Faith, [ICON_CULTURE] Culture, [ICON_FOOD] Food, [ICON_RESEARCH] Science, [ICON_GOLD] Gold, and [ICON_PRODUCTION] Production, +80 [ICON_VP_SPY_POINTS] Spy Points.; +5 [ICON_GOLDEN_AGE] Golden Age Points from [ICON_RELIGION] Holy Sites; unlocks [COLOR_POSITIVE_TEXT]Reformation Belief[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_BELIEF_PEACE_LOVING';

-- mausoleum has an effect

-- palace 
UPDATE Language_ko_KR
SET Text = '+1 [ICON_TOURISM] Tourism for every 3 [ICON_CITIZEN] Citizens in the City. ' || Text
WHERE Tag = 'TXT_KEY_BUILDING_APOSTOLIC_PALACE_HELP';

UPDATE Language_ko_KR
SET Text = 'When you spread your [ICON_RELIGION] Religion to foreign Cities, gain +15 [ICON_FOOD] Food in Holy City, scaling with the number of new Followers of your [ICON_RELIGION] Religion, and 15 [ICON_TOURISM] Tourism, scaling with the number of Followers of other [ICON_RELIGION] Religions in the City.[NEWLINE]Unlocks [COLOR_POSITIVE_TEXT]Apostolic Palace National Wonder[ENDCOLOR] (+4 [ICON_PEACE] Faith, +4 [ICON_GOLDEN_AGE] Golden Age Points and +1 [ICON_TOURISM] Tourism for every 3 [ICON_CITIZEN] Citizens; +5 [ICON_TOURISM] Tourism from [ICON_RELIGION] Holy Sites; unlocks [COLOR_POSITIVE_TEXT]Reformation Belief[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_BELIEF_PILGRIMAGE';

-- sacred garden
UPDATE Language_ko_KR
SET Text = 'All Gardens provide +10% [ICON_FOOD] Growth in the City in which they are built.[NEWLINE][NEWLINE]' || Text
WHERE Tag = 'TXT_KEY_BUILDING_SACRED_GARDEN_HELP';

UPDATE Language_ko_KR
SET Text = 'When you enter a new Era, Holy City gains 12 of every Yield for each City following your [ICON_RELIGION] Religion (max 25 Cities), scaling with Era.[NEWLINE]Unlocks [COLOR_POSITIVE_TEXT]Sacred Garden National Wonder[ENDCOLOR] (+3 [ICON_PEACE] Faith, +5 [ICON_CULTURE] Culture, +10% [ICON_FOOD] Growth from Gardens; +5 [ICON_FOOD] Food from [ICON_RELIGION] Holy Sites; unlocks [COLOR_POSITIVE_TEXT]Reformation Belief[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_BELIEF_INITIATION_RITES';

-- great altar has an effect

-- ossurary
UPDATE Language_ko_KR
SET Text = '+5 [ICON_GOLD] Gold, [ICON_CULTURE] Culture, and [ICON_TOURISM] Tourism is a [ICON_INTERNATIONAL_TRADE] Trade Route passes through the City.[NEWLINE][NEWLINE]' || Text
WHERE Tag = 'TXT_KEY_BUILDING_GRAND_OSSUARY_HELP';

UPDATE Language_ko_KR
SET Text = Replace(Text, '+10 [ICON_PEACE] Faith', '+10 [ICON_PEACE] Faith; [ICON_GOLD]/[ICON_CULTURE]/[ICON_TOURISM] Yields if a [ICON_INTERNATIONAL_TRADE] Trade Route passes the City')
WHERE Tag = 'TXT_KEY_BELIEF_WORLD_CHURCH';