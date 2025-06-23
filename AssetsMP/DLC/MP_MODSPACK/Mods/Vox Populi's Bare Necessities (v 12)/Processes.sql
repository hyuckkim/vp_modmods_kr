INSERT OR REPLACE INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn)
VALUES ('TECHPRIEST_ATLAS', 256, 'FaithTourismAtlas256.dds', 8, 1);

INSERT OR REPLACE INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn)
VALUES ('TECHPRIEST_ATLAS', 128, 'FaithTourismAtlas128.dds', 8, 1);

INSERT OR REPLACE INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn)
VALUES ('TECHPRIEST_ATLAS', 80, 'FaithTourismAtlas80.dds', 8, 1);

INSERT OR REPLACE INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn)
VALUES ('TECHPRIEST_ATLAS', 64, 'FaithTourismAtlas64.dds', 8, 1);

INSERT OR REPLACE INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn)
VALUES ('TECHPRIEST_ATLAS', 45, 'FaithTourismAtlas45.dds', 8, 1);

INSERT OR REPLACE INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn)
VALUES ('TECHPRIEST_ATLAS', 32, 'FaithTourismAtlas32.dds', 8, 1);

INSERT OR REPLACE INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn)
VALUES ('REALLYBASED_ATLAS', 64, 'ReallyBased64.dds', 1, 3);

INSERT OR REPLACE INTO LocalizedText
	(Language, Tag, Text)
VALUES
	--('en_US', 'TXT_KEY_PROCESS_TOURISM', 'Propaganda'),
	--('en_US', 'TXT_KEY_PROCESS_TOURISM_HELP', '[COLOR_POSITIVE_TEXT]Propaganda[ENDCOLOR] converts 15% of the [ICON_PRODUCTION] Production of this City into [ICON_TOURISM] Tourism.[NEWLINE][NEWLINE]Requires the Socialist Realism Tenet to be unlocked.'),
	--('en_US', 'TXT_KEY_PROCESS_TOURISM_STRATEGY', '{TXT_KEY_PROCESS_TOURISM_HELP}[NEWLINE][NEWLINE]Investing production in propaganda is a good way to boost your City''s influence in the world, which can be useful if you are currently in a revolutionary wave, or if you want to force other Civilizations to experience one.'),
	('en_US', 'TXT_KEY_PROCESS_GOLDEN_AGE', 'Prosperity'),
	('en_US', 'TXT_KEY_PROCESS_GOLDEN_AGE_HELP', '[COLOR_POSITIVE_TEXT]Prosperity[ENDCOLOR] converts 25% of [ICON_PRODUCTION] Production of this City into [ICON_GOLDEN_AGE] Golden Age Points and 5% of [ICON_PRODUCTION] Production into [ICON_GOLD] Gold, [ICON_RESEARCH] Science, [ICON_CULTURE] Culture, [ICON_FOOD] Food, and [ICON_PEACE] Faith. It also reduces [ICON_GOLD] Gold Needs by 5%. [ICON_RESEARCH] Science Needs, [ICON_CULTURE] Culture Need, [ICON_FOOD]/[ICON_PRODUCTION] Basic Needs, and [ICON_RELIGION] Religious Unrest by 5%.'),
	('en_US', 'TXT_KEY_PROCESS_GOLDEN_AGE_STRATEGY', 'Investing production in prosperity is a good way to boost your nation''s production, science, culture, and wealth. Which is useful for forming an utopian society for the people to live in.'),
	('en_US', 'TXT_KEY_PROCESS_FAITH', 'Prayer'),
	('en_US', 'TXT_KEY_PROCESS_FAITH_HELP', '[COLOR_POSITIVE_TEXT]Prayer[ENDCOLOR] converts 25% of [ICON_PRODUCTION] Production of this City into [ICON_PEACE] Faith, and reduces [ICON_RELIGION] Religious Unrest by 25%.'),
	('en_US', 'TXT_KEY_PROCESS_FAITH_STRATEGY', 'Investing production in prayer is a good way to boost your City''s faith output, which can be useful if you are currently in need of missionaires and inquisitors or if your cities need to birth Great People! Also reduce Religious Unrest.');


INSERT OR REPLACE INTO Processes (Type, Description, Help, Strategy, TechPrereq, IconAtlas, PortraitIndex)
SELECT 	'PROCESS_FAITH', 'TXT_KEY_PROCESS_FAITH', 'TXT_KEY_PROCESS_FAITH_HELP', 'TXT_KEY_PROCESS_FAITH_STRATEGY', 'TECH_PHILOSOPHY', 'TECHPRIEST_ATLAS', 0 UNION ALL
SELECT	'PROCESS_GOLDEN_AGE', 'TXT_KEY_PROCESS_GOLDEN_AGE', 'TXT_KEY_PROCESS_GOLDEN_AGE_HELP', 'TXT_KEY_PROCESS_GOLDEN_AGE_STRATEGY', 'TECH_ECOLOGY', 'TECHPRIEST_ATLAS', 2;-- UNION ALL
--SELECT	'PROCESS_TOURISM', 'TXT_KEY_PROCESS_TOURISM', 'TXT_KEY_PROCESS_TOURISM_HELP', 'TXT_KEY_PROCESS_TOURISM_STRATEGY', NULL, 'TECHPRIEST_ATLAS', 1;

INSERT OR REPLACE INTO Process_ProductionYields (ProcessType, YieldType, Yield)
SELECT 'PROCESS_FAITH', 'YIELD_FAITH', 25 UNION ALL
SELECT 'PROCESS_GOLDEN_AGE', 'YIELD_GOLDEN_AGE_POINTS', 25 UNION ALL
SELECT 'PROCESS_GOLDEN_AGE', 'YIELD_GOLD', 5 UNION ALL
SELECT 'PROCESS_GOLDEN_AGE', 'YIELD_SCIENCE', 5 UNION ALL
SELECT 'PROCESS_GOLDEN_AGE', 'YIELD_CULTURE', 5 UNION ALL
SELECT 'PROCESS_GOLDEN_AGE', 'YIELD_FOOD', 5 UNION ALL
SELECT 'PROCESS_GOLDEN_AGE', 'YIELD_FAITH', 5;-- UNION ALL
--SELECT 'PROCESS_TOURISM', 'YIELD_TOURISM', 15;