INSERT INTO Language_ko_KR 
	(Tag, Text)
VALUES
	('TXT_KEY_BELIEF_UNITY_OF_PROPHETS_ANCIENT_SHORT', 'Radical Sects'),
	('TXT_KEY_BELIEF_UNITY_OF_PROPHETS_ANCIENT', '+1 [ICON_CULTURE] Culture and [ICON_PEACE] Faith from [ICON_VP_ENGINEER] Engineers, [ICON_CITIZEN_RED] Labourers, and [ICON_VP_WRITER] Writers. Gain 15 [ICON_FOOD] Food, [ICON_CULTURE] Culture, and [ICON_PEACE] Faith every time the City expands its borders naturally, scaling with Era.'),

	('TXT_KEY_BELIEF_UNITY_OF_PROPHETS_INDUSTRIAL_SHORT', 'Charitable Fundraising'),
	('TXT_KEY_BELIEF_UNITY_OF_PROPHETS_INDUSTRIAL', '+1 [ICON_GOLD] Gold and [ICON_PEACE] Faith from [ICON_VP_SCIENTIST] Scientists, [ICON_CITIZEN_RED] Labourers, and [ICON_VP_MERCHANT] Merchants. +1 [ICON_FOOD] Food in a City for every 10 [ICON_GOLD] Gold per turn it produces, capped at half the number of Followers in the City. +8 [ICON_GOLD] Gold and [ICON_PEACE] Faith when a Building is constructed, scaling with Era.');

--------------------------
-- split to the glory of god 
--------------------------
UPDATE Language_ko_KR
SET Text = '+1 [ICON_PEACE] Faith and [ICON_TOURISM] Tourism from [ICON_VP_ARTIST] Artists, [ICON_CSD_CIVIL_SERVANT] Civil Servants, and [ICON_VP_MUSICIAN] Musicians. When you expend a [ICON_GREAT_PEOPLE] Great Person, gain 5 [ICON_GOLD] Gold, [ICON_RESEARCH] Science, and [ICON_CULTURE] Culture per City following your Religion (max 30 Cities).'
WHERE Tag = 'TXT_KEY_BELIEF_TO_GLORY_OF_GOD';

---------------------------
-- change scaling on GP and improvement/GWork/etc
---------------------------
UPDATE Language_ko_KR SET
Text = Replace(Text, '10%', '4%')
WHERE Tag = 'TXT_KEY_BUILD_CONSUMED_HELP_ACADEMY';

UPDATE Language_ko_KR SET
Text = Replace(Text, '10%', '4%')
WHERE Tag = 'TXT_KEY_SPECIALISTSANDGP_GREATSCIENTIST_HEADING3_BODY';

UPDATE Language_ko_KR SET
Text = Replace(Text, '10%', '4%')
WHERE Tag = 'TXT_KEY_MISSION_DISCOVER_TECH_HELP';

UPDATE Language_ko_KR SET
Text = Replace(Text, '3%', '1%')
WHERE Tag = 'TXT_KEY_SPECIALISTSANDGP_GREATWRITER_HEADING3_BODY';

UPDATE Language_ko_KR SET
Text = Replace(Text, '3%', '1%')
WHERE Tag = 'TXT_KEY_MISSION_GIVE_POLICIES_HELP';

UPDATE Language_ko_KR SET
Text = Replace(Text, '20%', '10%')
WHERE Tag = 'TXT_KEY_MISSION_START_GOLDENAGE_HELP';