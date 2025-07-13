---------------------------------------
-- some actual sea power for manannan
---------------------------------------
UPDATE Language_ko_KR SET
Text = '+3 [ICON_FOOD] Food, [ICON_PRODUCTION] Production, and [ICON_GOLD] Gold if the City is [COLOR_POSITIVE]Coastal[ENDCOLOR]. +1 [ICON_PRODUCTION] Production from Water tiles and +1 [ICON_CULTURE] Culture and [ICON_GREAT_ADMIRAL] Great Admiral Point from Fishing Boats. Eligible Units receive the [COLOR_POSITIVE_TEXT]Amphibious[ENDCOLOR] Promotion. +2 [ICON_GREAT_ADMIRAL] Great Admiral Points from Ceilidh Hall.'
WHERE Tag = 'TXT_KEY_BELIEF_MANANNAN';

---------------------------------------
-- ogma, key bonus is kinda shit compared to bran
---------------------------------------
UPDATE Language_ko_KR SET
Text = '+2 [ICON_RESEARCH] Science and [ICON_CULTURE] Culture from Libraries and the Palace. +1 [ICON_FOOD] Food, [ICON_RESEARCH] Science, and [ICON_CULTURE] Culture from [ICON_GREAT_WORK] Great Works, [ICON_VP_SCIENTIST] Scientists, and [ICON_VP_WRITER] Writers. +3 [ICON_GREAT_SCIENTIST] Great Scientist Points and [ICON_GREAT_WRITER] Great Writer Points in your [ICON_CAPITAL] Capital/Holy City. +3 [ICON_RESEARCH] Science from Ceilidh Hall.'
WHERE Tag = 'TXT_KEY_BELIEF_OGMA';

---------------------------------------
-- cernunnos unimproved feature yields idea
---------------------------------------
UPDATE Language_ko_KR SET
Text = '+1 [ICON_FOOD] Food and [ICON_PRODUCTION] Production from every [COLOR_NEGATIVE_TEXT]unimproved[ENDCOLOR] Feature. +1 [ICON_GOLD] Gold from Forests and Jungles. +1 [ICON_RESEARCH] Science and [ICON_CULTURE] Culture from Camps and Plantations. +2 [ICON_CULTURE] Culture from Ceilidh Hall.'
WHERE Tag = 'TXT_KEY_BELIEF_CERNUNNOS';

---------------------------------------
-- rhiannon with natural wonders 
---------------------------------------
UPDATE Language_ko_KR SET
Text = '+1 [COLOR_POSITIVE_TEXT]All Yields[ENDCOLOR] if the City has at least 4 [ICON_CITIZEN] Citizens. +3 [COLOR_POSITIVE_TEXT]All Yields[ENDCOLOR] from Natural Wonders. Settler Units receive the [COLOR_POSITIVE_TEXT]Rhiannon''s Path[ENDCOLOR] Promotion. +1 [COLOR_POSITIVE_TEXT]All Yields[ENDCOLOR] from Ceilidh Hall.'
WHERE Tag = 'TXT_KEY_BELIEF_RHIANNON';

INSERT INTO Language_ko_KR
	(Tag, Text)
VALUES
	('TXT_KEY_PROMOTION_RHIANNON', 'Rhiannon''s Path'),
	('TXT_KEY_PROMOTION_RHIANNON_HELP', '+2 [ICON_MOVES] Movement.[NEWLINE]Ignores Terrain Costs, Zone of Control, and rival borders.[NEWLINE]Can use enemy Routes.');

---------------------------------------
-- revert bran dagda healing swap c.f. pdan thread
---------------------------------------
UPDATE Language_ko_KR SET
Text = '+25% [ICON_FOOD] Growth and +1 [ICON_HAPPINESS_1] Happiness. +12 [ICON_PRODUCTION] Production, [ICON_GOLD] Gold, and [ICON_CULTURE] Culture when a [ICON_CITIZEN] Citizen is born, scaling with Era. Units heal [COLOR_POSITIVE_TEXT]+10 HP[ENDCOLOR] per turn in owned Territory. +5 [ICON_FOOD] Food from Ceilidh Hall.'
WHERE Tag = 'TXT_KEY_BELIEF_DAGDA';

---------------------------------------
-- and buff bran so it has something for a non-capital bonus
---------------------------------------
UPDATE Language_ko_KR SET
Text = '+1 [ICON_PRODUCTION] Production, [ICON_GOLD] Gold, [ICON_RESEARCH] Science, and [ICON_CULTURE] Culture from Walls and the Palace. +4 [ICON_PRODUCTION] Production, [ICON_GOLD] Gold, [ICON_RESEARCH] Science, and [ICON_CULTURE] Culture in your [ICON_CAPITAL] Capital/Holy City for every 5 Followers of your [ICON_RELIGION_PANTHEON] Pantheon in owned Cities. +25% City [ICON_RANGE_STRENGTH] Ranged Combat Strength. +2 [ICON_HAPPINESS_1] Happiness from Ceilidh Hall.'
WHERE Tag = 'TXT_KEY_BELIEF_BRAN';

---------------------------------------
-- Cailleach, the Hag
---------------------------------------
UPDATE Language_ko_KR SET
Text = '+1 [ICON_FOOD] Food, [ICON_PRODUCTION] Production, and [ICON_GOLD] Gold for every 2 Tundra tiles worked by the City. +2 [ICON_FOOD] Food, [ICON_PRODUCTION] Production, and [ICON_GOLD] Gold from Snow tiles with Resources. +1 [ICON_PRODUCTION] Production and [ICON_CULTURE] Culture from Quarries and Mines on Resources. +4 [ICON_PRODUCTION] Production from Ceilidh Hall.'
WHERE Tag = 'TXT_KEY_BELIEF_CAILLEACH';

--UPDATE Language_ko_KR SET
--Text = 'Cailleach, the Hag'
--WHERE Tag = 'TXT_KEY_BELIEF_CAILLEACH_SHORT';

---------------------------------------
-- Epona, the Great Mare
---------------------------------------
UPDATE Language_ko_KR SET
Text = '+3 [ICON_CULTURE_LOCAL] Border Growth from Pastures. +1 [ICON_HAPPINESS_1] Happiness from Stables and can purchase them with [ICON_PEACE] Faith. Gain +8 [ICON_FOOD] Food, [ICON_PRODUCTION] Production, [ICON_RESEARCH] Science, and [ICON_CULTURE] Culture every time the City expands its borders naturally, scaling with Era. +5 [ICON_CULTURE_LOCAL] Border Growth from Ceilidh Hall.'
WHERE Tag = 'TXT_KEY_BELIEF_EPONA';

---------------------------------------
-- Lugh: Egypt is going a different way can buff this
---------------------------------------
UPDATE Language_ko_KR SET
Text = '+2 [ICON_FOOD] Food, [ICON_GOLD] Gold, [ICON_RESEARCH] Science, [ICON_CULTURE] Culture, and [ICON_TOURISM] Tourism if the City has a Specialist. +25% [ICON_PRODUCTION] Production towards [ICON_WONDER] Wonders. +2 [ICON_CULTURE] Culture and [ICON_TOURISM] Tourism from [ICON_WONDER] World Wonders. +5 [ICON_TOURISM] Tourism from Ceilidh Hall.'
WHERE Tag = 'TXT_KEY_BELIEF_LUGH';

---------------------------------------
-- Morrigan, typo and added last effect
---------------------------------------
UPDATE Language_ko_KR SET
Text = '+1 [ICON_GREAT_GENERAL] Great General Point from Strategic Resources. Gain [ICON_GOLD] Gold, [ICON_CULTURE] Culture, and [ICON_GOLDEN_AGE] Golden Age Points from killing enemy units equal to 200% of its [ICON_STRENGTH] Strength, and gain 20 of each yield when you [COLOR_POSITIVE_TEXT]pillaging improvements[ENDCOLOR], scaling with Era. +2 [ICON_GREAT_GENERAL] Great General Points from Ceilidh Hall.'
WHERE Tag = 'TXT_KEY_BELIEF_MORRIGAN';

---------------------------------------
-- nuada has no culture. add small amount through theme
---------------------------------------
UPDATE Language_ko_KR SET
Text = '+10% [ICON_GOLD] Gold, [ICON_RESEARCH] Science, and [ICON_CULTURE] Culture during "[COLOR_POSITIVE_TEXT]We Love the King Day[ENDCOLOR]". +3 [ICON_GOLD] Gold, [ICON_RESEARCH] Science, and [ICON_GOLDEN_AGE] Golden Age Points in your [ICON_CAPITAL] Capital/Holy City for every unique Luxury Resource owned or imported, and per active Trade Route [ICON_ARROW_LEFT] to or [ICON_ARROW_RIGHT] from the City. +5 [ICON_GOLD] Gold from Ceilidh Hall.'
WHERE Tag = 'TXT_KEY_BELIEF_NUADA';

-----------------------------
-- gwyn who is a mix with idris the giant and the grey king
-----------------------------
UPDATE Language_ko_KR SET
Text = '+20% [ICON_STRENGTH] Attack in Hills.[NEWLINE]Can cross Mountains.'
WHERE Tag = 'TXT_KEY_PROMOTION_ALTITUDE_TRAINING_HELP';

INSERT INTO Language_ko_KR
	(Tag, Text)
VALUES
	('TXT_KEY_BELIEF_GWYN', '+1 [ICON_FOOD] Food, [ICON_RESEARCH] Science, and [ICON_CULTURE] Culture for every 2 Mountains within 3 tiles of the City (capping at the City''s population). Eligible Units receive the [COLOR_POSITIVE_TEXT]Altitude Training[ENDCOLOR] Promotion. Gain [ICON_PEACE] Faith when an enemy Unit is killed or an owned Unit dies equal to 200% of its [ICON_STRENGTH] Strength. +3 [ICON_PEACE] Faith from Ceilidh Hall.'),
	('TXT_KEY_BELIEF_GWYN_SHORT', 'Gwyn, Monarch of the Mists');

----------------------------------------
-- olwen a sun-type diety for the desert
----------------------------------------
INSERT INTO Language_ko_KR
	(Tag, Text)
VALUES
	('TXT_KEY_BELIEF_OLWEN', '+1 [ICON_FOOD] Food and [ICON_PRODUCTION] Production from Desert tiles [COLOR_NEGATIVE_TEXT]without[ENDCOLOR] Flood Plains, and for every 2 Plains or 2 Flood Plains tiles worked by the City. +1 [ICON_RESEARCH] Science and [ICON_GOLDEN_AGE] Golden Age Point from Farms. +10% [ICON_CULTURE] Culture during [ICON_GOLDEN_AGE] Golden Ages. +5 [ICON_GOLDEN_AGE] Golden Age Points from Ceilidh Hall.'),
	('TXT_KEY_BELIEF_OLWEN_SHORT', 'Olwen, the Golden Wheel');

