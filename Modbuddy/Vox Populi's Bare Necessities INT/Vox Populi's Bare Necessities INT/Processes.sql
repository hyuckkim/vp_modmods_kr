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
	--('ko_KR', 'TXT_KEY_PROCESS_TOURISM', '선전'),
	--('ko_KR', 'TXT_KEY_PROCESS_TOURISM_HELP', '[COLOR_POSITIVE_TEXT]선전[ENDCOLOR] 이 도시 [ICON_PRODUCTION] 생산량의 15%를 [ICON_TOURISM] 관광으로 전환합니다.[NEWLINE][NEWLINE]사회주의 리얼리즘 주의를 해제해야 합니다.'),
	--('ko_KR', 'TXT_KEY_PROCESS_TOURISM_STRATEGY', '{TXT_KEY_PROCESS_TOURISM_HELP}[NEWLINE][NEWLINE]선전에 생산을 투자하는 것은 세계에 대한 도시의 영향력을 높이는 좋은 방법으로, 현재 혁명의 물결을 타고 있거나 다른 문명이 혁명을 경험하도록 강요하려는 경우에 유용할 수 있습니다.'),
	('ko_KR', 'TXT_KEY_PROCESS_GOLDEN_AGE', '번성'),
	('ko_KR', 'TXT_KEY_PROCESS_GOLDEN_AGE_HELP', '[COLOR_POSITIVE_TEXT]번성[ENDCOLOR]은 이 도시의 [ICON_PRODUCTION] 생산량의 25%를 [ICON_GOLDEN_AGE] 황금기 점수로 전환하고, [ICON_PRODUCTION] 생산량의 5%를 [ICON_GOLD] 골드, [ICON_RESEARCH] 과학, [ICON_CULTURE] 문화, [ICON_FOOD] 식량, [ICON_PEACE] 신앙으로 전환합니다. 또한 필요한 [ICON_GOLD] 골드, [ICON_RESEARCH] 과학, [ICON_CULTURE] 문화, [ICON_FOOD]/[ICON_PRODUCTION] 기본 자원, [ICON_RELIGION] 종교적 불안이 5% 감소합니다.'),
	('ko_KR', 'TXT_KEY_PROCESS_GOLDEN_AGE_STRATEGY', '번성에 생산을 투자하는 것은 국가의 생산, 과학, 문화, 그리고 부를 증진하는 좋은 방법입니다. 이는 사람들이 살아갈 유토피아 사회를 형성하는 데에도 유용합니다.'),
	('ko_KR', 'TXT_KEY_PROCESS_FAITH', '기도'),
	('ko_KR', 'TXT_KEY_PROCESS_FAITH_HELP', '[COLOR_POSITIVE_TEXT]기도[ENDCOLOR]는 이 도시 [ICON_PRODUCTION] 생산량의 25%를 [ICON_PEACE] 신앙으로 전환하고, [ICON_RELIGION] 종교적 불안이 25% 감소합니다.'),
	('ko_KR', 'TXT_KEY_PROCESS_FAITH_STRATEGY', '기도에 생산을 투자하면 도시의 신앙 생산량을 늘리는 데 도움이 되며, 선교사나 종교재판관이 필요하거나 도시에서 위인을 배출해야 할 때 유용합니다! 또한 종교 불안도 감소시킵니다.');


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