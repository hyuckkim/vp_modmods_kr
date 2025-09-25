--=====================================
--2023.09.03 CAYM 12.14 edited
--=====================================

--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
-- IconTextureAtlases
------------------------------

DELETE FROM IconTextureAtlases WHERE Atlas='BUILDING_CEMETERY_ATLAS';


INSERT INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn) VALUES
('BUILDING_CEMETERY_ATLAS',256,'Building_Cemetery_256.dds',2,1),
('BUILDING_CEMETERY_ATLAS',128,'Building_Cemetery_128.dds',2,1),
('BUILDING_CEMETERY_ATLAS',80, 'Building_Cemetery_80.dds', 2,1),
('BUILDING_CEMETERY_ATLAS',64, 'Building_Cemetery_64.dds', 2,1),
('BUILDING_CEMETERY_ATLAS',45, 'Building_Cemetery_45.dds', 2,1),
('BUILDING_CEMETERY_ATLAS',32, 'Building_Cemetery_32.dds', 2,1);

-- 프로세스 본문
INSERT OR REPLACE INTO Processes
    (Type, Description, Help, Strategy, TechPrereq, IconAtlas, PortraitIndex)
VALUES
    ('PROCESS_PRAYER', 'TXT_KEY_PROCESS_PRAYER', 'TXT_KEY_PROCESS_PRAYER_HELP',
     'TXT_KEY_PROCESS_PRAYER_STRATEGY', 'TECH_THEOLOGY', 'BUILDING_CEMETERY_ATLAS', 1);

-- 생산 → 신앙 전환 (10%)
INSERT OR REPLACE INTO Process_ProductionYields
    (ProcessType,      YieldType,     Yield)
VALUES
    ('PROCESS_PRAYER', 'YIELD_FAITH', 10);


INSERT OR REPLACE INTO Process_Flavors (ProcessType, FlavorType, Flavor)
VALUES
    ('PROCESS_PRAYER','FLAVOR_RELIGION',8);

-- 텍스트 (영어)
INSERT OR REPLACE INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_PROCESS_PRAYER',           'Faith'),
('TXT_KEY_PROCESS_PRAYER_HELP',      'Converts [ICON_PRODUCTION] Production into [ICON_PEACE] Faith. Unlocked at Theology.'),
('TXT_KEY_PROCESS_PRAYER_STRATEGY',  'Use this process to increase your Faith generation when buildings or units are not urgently required.');

-- 텍스트 (한국어)
INSERT OR REPLACE INTO Language_ko_KR (Tag, Text) VALUES
('TXT_KEY_PROCESS_PRAYER',           '신앙'),
('TXT_KEY_PROCESS_PRAYER_HELP',      '[ICON_PRODUCTION] 생산력을 [ICON_PEACE] 신앙으로 전환합니다. 신학 연구 시 해금됩니다.'),
('TXT_KEY_PROCESS_PRAYER_STRATEGY',  '급한 건설이 없을 때 생산력을 신앙으로 돌려 종교를 강화하십시오.');


--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	

UPDATE Buildings
SET PrereqTech = 'TECH_CIVIL_SERVICE'
WHERE Type = 'BUILDING_MINT';

UPDATE Buildings
SET PrereqTech = 'TECH_GUILDS',
    Cost       = 350
WHERE Type = 'BUILDING_GARDEN';

UPDATE Buildings
SET PrereqTech = 'TECH_GUILDS',
    Cost       = 350
WHERE Type = 'BUILDING_CANDI';

-- BuildingClasses
INSERT INTO BuildingClasses 	
		(Type, 								DefaultBuilding, 			Description,							NoLimit)
VALUES	('BUILDINGCLASS_CEMETERY',			'BUILDING_CEMETERY',		'TXT_KEY_BUILDING_CEMETERY',			0),
		('BUILDINGCLASS_CEMETERY_DUMMY', 	'BUILDING_CEMETERY_DUMMY',	'TXT_KEY_BUILDING_CEMETERY_DUMMY',		1);
		
------------
-- Buildings
INSERT INTO Buildings
		(Type, 					BuildingClass, 				Cost,	HurryCostModifier,	ReligiousUnrestFlatReduction,	GoldMaintenance,	PrereqTech,		IconAtlas, 					PortraitIndex,	Description,					Help,								Civilopedia,			 NukeImmune,	ConquestProb,	NeverCapture)
SELECT 	'BUILDING_CEMETERY',	'BUILDINGCLASS_CEMETERY',	Cost,	HurryCostModifier,	1,								GoldMaintenance,	'TECH_THEOLOGY',		'BUILDING_CEMETERY_ATLAS',	0,		'TXT_KEY_BUILDING_CEMETERY','TXT_KEY_BUILDING_CEMETERY_HELP',	'TXT_KEY_BUILDING_CEMETERY_TEXT',	1,		ConquestProb,				1
FROM Buildings WHERE Type = 'BUILDING_UNIVERSITY';

INSERT INTO Buildings 		
		(Type,							BuildingClass,						Description,						GoldMaintenance,	Cost,	FaithCost,	GreatWorkCount, NeverCapture,	NukeImmune, ConquestProb,	HurryCostModifier,	IconAtlas,					PortraitIndex, IsDummy)
VALUES	('BUILDING_CEMETERY_DUMMY',		'BUILDINGCLASS_CEMETERY_DUMMY',		'TXT_KEY_BUILDING_CEMETERY_DUMMY',	0,					-1,		-1,			-1,				1,				1,			0,				-1,					'BUILDING_CEMETERY_ATLAS',	0,				1);

-- Building_YieldChanges
INSERT INTO Building_YieldChanges
		(BuildingType,				YieldType,		 	Yield)
VALUES	('BUILDING_CEMETERY', 		'YIELD_FAITH',		1),
		('BUILDING_CEMETERY_DUMMY', 'YIELD_FAITH',	    1);

-- Building_Flavors
INSERT INTO Building_Flavors
		(BuildingType, FlavorType, Flavor)
VALUES	('BUILDING_CEMETERY', 'FLAVOR_RELIGION',	10),
		('BUILDING_CEMETERY', 'FLAVOR_CULTURE',		10);
------------------------------------------------
---Text (en_US)
-------------------------------------------------

INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_BUILDING_CEMETERY','Cemetery'),
('TXT_KEY_BUILDING_CEMETERY_DUMMY','Cemetery Dummy'),
('TXT_KEY_BUILDING_CEMETERY_HELP','Whenever a civilian or military unit dies near a city with a Cemetery, the owner gains +1 [ICON_PEACE] Faith, scaling with Era. Additionally, if the unit is a [ICON_GREAT_PEOPLE] Great Person, City gains +1 [ICON_PEACE] Faith [COLOR_POSITIVE_TEXT]permanently[ENDCOLOR].[NEWLINE][NEWLINE]-1 [ICON_HAPPINESS_3] Unhappiness from [ICON_PEACE] Religious Unrest.'),
('TXT_KEY_BUILDING_CEMETERY_TEXT','A cemetery is a place where the remains of dead people are buried or otherwise interred. The intact or cremated remains of people may be interred in a grave, commonly referred to as burial, or in a tomb, an "above-ground grave" (resembling a sarcophagus), a mausoleum, columbarium, niche, or other edifice. [NEWLINE][NEWLINE]In Western cultures, funeral ceremonies are often observed in cemeteries. These ceremonies or rites of passage differ according to cultural practices and religious beliefs. Modern cemeteries often include crematoria, and some grounds previously used for both, continue as crematoria as a principal use long after the interment areas have been filled.');

------------------------------------------------
---Text (ko_KR)
-------------------------------------------------

INSERT INTO Language_ko_KR (Tag, Text) VALUES
('TXT_KEY_BUILDING_CEMETERY','공동묘지'),
('TXT_KEY_BUILDING_CEMETERY_DUMMY','공동묘지 더미'),
('TXT_KEY_BUILDING_CEMETERY_HELP','도시 근처에서 아군 유닛이 사망할 때 [ICON_PEACE] 신앙 [COLOR_POSITIVE_TEXT]1[ENDCOLOR][COLOR:105:105:105:255](시대별 보정)[ENDCOLOR]을 제공합니다. [ICON_GREAT_PEOPLE]위인을 소모할 때 [COLOR_POSITIVE_TEXT]영구적으로[ENDCOLOR] [ICON_PEACE]신앙이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[COLOR:105:105:105:255](중첩 가능)[ENDCOLOR][NEWLINE][NEWLINE][ICON_PEACE]종교 분쟁에서 오는 [ICON_HAPPINESS_3] 불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.'),
('TXT_KEY_BUILDING_CEMETERY_TEXT','공동묘지는 죽은 사람의 유해를 토지에 매장하거나 다른 방법으로 매장하는 장소입니다. 온전한 또는 화장된 사람들의 유해는 일반적으로 매장이라고 불리는 무덤, 또는 무덤, "지상 무덤"(석관과 유사), 영묘, 납골당, 벽감 또는 기타 건물에 안치될 수 있습니다. [NEWLINE][NEWLINE]서구 문화에서는 장례식이 묘지에서 거행되는 경우가 많습니다. 이러한 의례나 통과의례는 문화적 관행과 종교적 신념에 따라 다릅니다. 현대 묘지에는 화장터가 포함되는 경우가 많으며, 이전에 두 묘지 모두에 사용되었던 일부 부지는 안치 구역이 채워진 후에도 오랫동안 주요 용도로 화장터로 계속 사용됩니다.');

