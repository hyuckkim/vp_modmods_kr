INSERT INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn)
VALUES ('TECHPRIEST_ATLAS', 256, 'FaithTourismAtlas256.dds', 8, 1);

INSERT INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn)
VALUES ('TECHPRIEST_ATLAS', 128, 'FaithTourismAtlas128.dds', 8, 1);

INSERT INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn)
VALUES ('TECHPRIEST_ATLAS', 80, 'FaithTourismAtlas80.dds', 8, 1);

INSERT INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn)
VALUES ('TECHPRIEST_ATLAS', 64, 'FaithTourismAtlas64.dds', 8, 1);

INSERT INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn)
VALUES ('TECHPRIEST_ATLAS', 45, 'FaithTourismAtlas45.dds', 8, 1);

INSERT INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn)
VALUES ('TECHPRIEST_ATLAS', 32, 'FaithTourismAtlas32.dds', 8, 1);

INSERT INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn)
VALUES ('REALLYBASED_ATLAS', 64, 'ReallyBased64.dds', 1, 3);

INSERT INTO LocalizedText
	(Language, Tag, Text)
VALUES
	('en_US', 'TXT_KEY_PROCESS_TOURISM', '선전'),
	('en_US', 'TXT_KEY_PROCESS_TOURISM_HELP', '도시 [ICON_PRODUCTION]생산의 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR]를 [ICON_TOURISM]관광으로 전환합니다.'),
	('en_US', 'TXT_KEY_PROCESS_TOURISM_STRATEGY', 'Investing production in propaganda is a good way to boost your City''s influence in the world, which can be useful if you are currently in a revolutionary wave, or if you want to force other civilizations to be in a revolutionary wave.'),
	('en_US', 'TXT_KEY_PROCESS_GOLDEN_AGE', '번성'),
	('en_US', 'TXT_KEY_PROCESS_GOLDEN_AGE_HELP', '도시 [ICON_PRODUCTION]생산의 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR]를 [ICON_GOLDEN_AGE]황금기 점수로 전환합니다.'),
	('en_US', 'TXT_KEY_PROCESS_GOLDEN_AGE_STRATEGY', 'Investing production in prosperity is a good way to boost your nation''s production, science, culture, and wealth. Which is useful for forming an utopian society for the people to live in.'),
	('en_US', 'TXT_KEY_PROCESS_FAITH', '기도'),
	('en_US', 'TXT_KEY_PROCESS_FAITH_HELP', '도시 [ICON_PRODUCTION]생산의 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR]를 [ICON_PEACE]신앙으로 전환하고 도시의 [ICON_PEACE]종교 분쟁 수치를 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR] 감소시킵니다.'),
	('en_US', 'TXT_KEY_PROCESS_FAITH_STRATEGY', 'Investing production in prayer is a good way to boost your City''s faith output, which can be useful if you are currently in need of missionaires and inquisitors or if your cities need to birth Great People! Also reduce Religious Unrest.');


INSERT INTO Processes (Type, Description, Help, Strategy, TechPrereq, IconAtlas, PortraitIndex)
SELECT 	'PROCESS_FAITH', 'TXT_KEY_PROCESS_FAITH', 'TXT_KEY_PROCESS_FAITH_HELP', 'TXT_KEY_PROCESS_FAITH_STRATEGY', 'TECH_PHILOSOPHY', 'TECHPRIEST_ATLAS', 0 UNION ALL
SELECT	'PROCESS_GOLDEN_AGE', 'TXT_KEY_PROCESS_GOLDEN_AGE', 'TXT_KEY_PROCESS_GOLDEN_AGE_HELP', 'TXT_KEY_PROCESS_GOLDEN_AGE_STRATEGY', 'TECH_GLOBALIZATION', 'TECHPRIEST_ATLAS', 2 UNION ALL
SELECT	'PROCESS_TOURISM', 'TXT_KEY_PROCESS_TOURISM', 'TXT_KEY_PROCESS_TOURISM_HELP', 'TXT_KEY_PROCESS_TOURISM_STRATEGY', 'TECH_RADIO', 'TECHPRIEST_ATLAS', 1;

INSERT INTO Process_ProductionYields (ProcessType, YieldType, Yield)
SELECT 'PROCESS_FAITH', 'YIELD_FAITH', 25 UNION ALL
SELECT 'PROCESS_GOLDEN_AGE', 'YIELD_GOLDEN_AGE_POINTS', 10 UNION ALL
SELECT 'PROCESS_TOURISM', 'YIELD_TOURISM', 15;