INSERT INTO Language_ko_KR 
	(Tag, Text)
VALUES
	--Theriolatry
	('TXT_KEY_BELIEF_HOLY_COW_SHORT', 'Sacred Bull'),
	('TXT_KEY_BELIEF_HOLY_COW', '+1 [COLOR_POSITIVE_TEXT]All Yields[ENDCOLOR] from [ICON_RES_COW] Cattle.'),

	('TXT_KEY_BELIEF_EXODUS_SHORT', 'Exodus'),
	('TXT_KEY_BELIEF_EXODUS', 'Expending a [ICON_GREAT_ADMIRAL] Great Admiral grants 25 [ICON_PEACE] Faith and [ICON_GOLDEN_AGE] Golden Age Points for every City following this [ICON_RELIGION] Religion (max 20 Cities). Settler and Religious Units gain the [COLOR_POSITIVE_TEXT]Diaspora[ENDCOLOR] Promotion. +2 [ICON_CULTURE] Culture and [ICON_GREAT_ADMIRAL] Great Admiral Points if the City is Coastal.'),

	('TXT_KEY_BELIEF_CARGO_CULT_SHORT', 'Cargo Cult'),
	('TXT_KEY_BELIEF_CARGO_CULT', 'May purchase Airports with [ICON_PEACE] Faith. Double yields from Natural Wonders. +5 [ICON_GOLDEN_AGE] Golden Age Points in the Holy City for every known [ICON_RELIGION_PANTHEON] Pantheon founded (caps at 8 Pantheons).'),

	('TXT_KEY_BELIEF_SACRED_GEOMETRY_SHORT', 'Sacred Geometry'),
	('TXT_KEY_BELIEF_SACRED_GEOMETRY', 'Expending a [ICON_GREAT_ENGINEER] Great Engineer grants 25 [ICON_RESEARCH] Science and [ICON_PEACE] Faith for every City following this [ICON_RELIGION] Religion (max 20 Cities). +2 [ICON_GOLD] Gold and [ICON_CULTURE] Culture from all [ICON_WONDER] World Wonders. +5 [ICON_GREAT_MUSICIAN] Great Musician points in the Holy City.');

-------------------------
-- founders 
--------------------------
-- theocratic rule/world church/pilgrimage
UPDATE Language_ko_KR SET 
Text = Replace(Text, '"We Love the King Day" boosts the [ICON_PEACE] Faith, [ICON_CULTURE] Culture, and [ICON_GOLD] Gold output of a City by 15%.', '+1 [ICON_GOLD] Gold, [ICON_PEACE] Faith, and [ICON_TOURISM] Tourism in the Holy City for every 4 Followers of this [ICON_RELIGION] Religion in Foreign Cities (max 400 Followers).') 
WHERE Tag = 'TXT_KEY_BELIEF_WORLD_CHURCH';
UPDATE Language_ko_KR SET Text = 'Pilgrimage' WHERE Tag = 'TXT_KEY_BELIEF_WORLD_CHURCH_SHORT';

-- divine inheritence/peace loving
UPDATE Language_ko_KR
SET Text = Replace(Text, 'Holy City produces +20% of its Yields when your Empire is in a [ICON_GOLDEN_AGE] Golden Age.', '+1 [ICON_FOOD] Food, [ICON_CULTURE_LOCAL] Border Growth Points, and [ICON_GOLDEN_AGE] Golden Age Points in the Holy City for every 4 Followers of this [ICON_RELIGION] Religion in owned Cities (max 400 Followers).')
WHERE Tag = 'TXT_KEY_BELIEF_PEACE_LOVING';

------------------
-- exodus
-------------------
INSERT INTO Language_ko_KR
	(Tag, Text)
VALUES
	('TXT_KEY_PROMOTION_EXODUS', 'Diaspora'),
	('TXT_KEY_PROMOTION_EXODUS_HELP', '+2 [ICON_MOVES] Naval Movement.[NEWLINE]+1 [ICON_VISION] Vision while [COLOR_POSITIVE_TEXT]Embarked[ENDCOLOR].[NEWLINE]Embarking and Disembarking cost only 1 [ICON_MOVES] Movement.');

------------------
-- golden age yields move
-------------------
-- orthodoxy yields during GA, following pdan beliefs
UPDATE Language_ko_KR
SET Text = 'Ecumenism'
WHERE Tag = 'TXT_KEY_BELIEF_HOLY_ORDER_SHORT';
		
UPDATE Language_ko_KR
SET Text = 'Holy City gains +15% [COLOR_POSITIVE_TEXT]All Yields[ENDCOLOR] during a [ICON_GOLDEN_AGE] Golden Age. [ICON_RELIGION] Religion spreads 20% faster (50% with Printing Press), and to Cities 20% further away.'
WHERE Tag = 'TXT_KEY_BELIEF_HOLY_ORDER';

------------------
-- WLTKD yields  move
-------------------
UPDATE Language_ko_KR
SET Text = 'Annual Festivals'
WHERE Tag = 'TXT_KEY_BELIEF_MISSIONARY_ZEAL_SHORT';

UPDATE Language_ko_KR
SET Text = '"We Love the King Day" boosts the [ICON_PEACE] Faith, [ICON_CULTURE] Culture, and [ICON_GOLD] Gold output of a City by 10%. +33% [ICON_CULTURE_LOCAL] Border Growth Rate. [ICON_MISSIONARY] Missionaries of this Religion are 25% stronger.'
WHERE Tag = 'TXT_KEY_BELIEF_MISSIONARY_ZEAL';
--+1 [ICON_HAPPINESS_1] Happiness from every Luxury Resource.

--------------------------------------
-- symbolism gain GP during GA from sacred calendar
--------------------------------------
UPDATE Language_ko_KR
SET Text = 'Reduce minimum Policy requirement for [ICON_WONDER] World Wonders by 1 and gain +2 [ICON_HAPPINESS_1] Happiness for every 8 Cities following this Religion (max 24 Cities). +33% [ICON_GREAT_PEOPLE] Great Person Rate in Holy City during [ICON_GOLDEN_AGE] Golden Ages.'
WHERE Tag = 'TXT_KEY_BELIEF_ITINERANT_PREACHERS';

-- and make sure the reduction is removed from prophecy (which is v strong anyway)
UPDATE Language_ko_KR
SET Text = Replace(Text, 'Reduces minimum Policy requirement for Wonders by 1. ', '')
WHERE Tag = 'TXT_KEY_BELIEF_MESSIAH';

----------------------------
-- buff universalism
----------------------------
UPDATE Language_ko_KR
SET Text = '+1 [ICON_RESEARCH] Science and [ICON_PRODUCTION] Production in the Holy City for every 4 followers of other Religions in owned Cities. +1 [ICON_GOLD] Gold and [ICON_PEACE] Faith in Holy City for every 5 followers of this [ICON_RELIGION] Religion in Foreign Cities.'
WHERE Tag = 'TXT_KEY_BELIEF_RELIGIOUS_UNITY';

------------------------------------------------------
-- Follower Yield Beliefs
------------------------------------------------------
UPDATE Language_ko_KR
SET Text = '+1 [ICON_FOOD] Food for every 2 followers in the City. +4 [ICON_FOOD] Food if the City has a Specialist.'
WHERE Tag = 'TXT_KEY_BELIEF_ASCETISM';

UPDATE Language_ko_KR
SET Text = '+1 [ICON_PRODUCTION] Production for every 2 followers in the City. +2 [ICON_PRODUCTION] Production per active [ICON_INTERNATIONAL_TRADE] Trade Route to or from the City.'
WHERE Tag = 'TXT_KEY_BELIEF_RELIGIOUS_COMMUNITY';

UPDATE Language_ko_KR
SET Text = '+1 [ICON_GOLD] Gold for every 2 followers in the City. +1 [ICON_GOLD] Gold from [COLOR_POSITIVE_TEXT]Bonus Resources[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_BELIEF_FEED_WORLD';

UPDATE Language_ko_KR
SET Text = '+1 [ICON_CULTURE] Culture for every 3 followers in the City. +1 [ICON_CULTURE] Culture from [ICON_GREAT_WORK] Great Works.'
WHERE Tag = 'TXT_KEY_BELIEF_DIVINE_INSPIRATION';

UPDATE Language_ko_KR
SET Text = '+1 [ICON_RESEARCH] Science for every 3 followers in the City. +2 [ICON_RESEARCH] Science from Universities.'
WHERE Tag = 'TXT_KEY_BELIEF_CHORAL_MUSIC';
------------------
-- cooperation to match
UPDATE Language_ko_KR
SET Text = '[ICON_FOOD] Food and [ICON_PRODUCTION] Production Internal Trade Routes generate +3 of their respective yields, scaling with Era. +2 [ICON_FOOD] Food and [ICON_PRODUCTION] Production if the City has a Specialist.'
WHERE Tag = 'TXT_KEY_BELIEF_COMMUNALISM';

-- mastery/abstinence include labourers for custom civ options
UPDATE Language_ko_KR
SET Text = 'Specialists and [ICON_CITIZEN_RED] Labourers generate +1 [ICON_GOLDEN_AGE] Golden Age Point and +1 of their primary Yield ([ICON_SCIENTIST]:[ICON_RESEARCH], [ICON_MERCHANT]/[ICON_CIVIL_SERVANT]:[ICON_GOLD], [ICON_ENGINEER]/[ICON_CITIZEN_RED]:[ICON_PRODUCTION], [ICON_WRITER]/[ICON_ARTIST]/[ICON_MUSICIAN]:[ICON_CULTURE]).'
WHERE Tag = 'TXT_KEY_BELIEF_RELIGIOUS_ART';

---------------------
-- update reformations to have gallery and observatory
---------------------
-- gallery
UPDATE Language_ko_KR
SET Text = Replace(Text, 'Amphitheaters,', 'Amphitheaters, Galleries,')
WHERE Tag = 'TXT_KEY_BELIEF_UNDERGROUND_SECT';

-- observatory
UPDATE Language_ko_KR
SET Text = Replace(Text, 'Universities,', 'Universities, Observatories,')
WHERE Tag = 'TXT_KEY_BELIEF_JESUIT_EDUCATION';