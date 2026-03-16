--=====================================
--2023.09.03 CAYM
--=====================================
-- Original Author : Asterix Rage
--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn) VALUES
('BUILDING_POLAR_STATION_ATLAS',256,'building_PS_256.dds',1,1),
('BUILDING_POLAR_STATION_ATLAS',128,'building_PS_128.dds',1,1),
('BUILDING_POLAR_STATION_ATLAS',80,'building_PS_080.dds',1,1),
('BUILDING_POLAR_STATION_ATLAS',64,'building_PS_064.dds',1,1),
('BUILDING_POLAR_STATION_ATLAS',45,'building_PS_045.dds',1,1);
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
-- BuildingClasses
INSERT INTO BuildingClasses (Type, DefaultBuilding, Description)
SELECT 'BUILDINGCLASS_POLAR_STATION', 'BUILDING_POLAR_STATION', 'TXT_KEY_POLAR_STATION';

------------
-- Buildings
INSERT INTO Buildings (Type, BuildingClass, Cost, HurryCostModifier, GoldMaintenance, PrereqTech, ConquestProb, IconAtlas, PortraitIndex, Description, Help, Civilopedia, NearbyTerrainRequired, NeverCapture)
SELECT 'BUILDING_POLAR_STATION', 'BUILDINGCLASS_POLAR_STATION', 2250, -20, 9, 'TECH_ROCKETRY', 80, 'BUILDING_POLAR_STATION_ATLAS', 0, 'TXT_KEY_BUILDING_POLAR_STATION', 'TXT_KEY_BUILDING_POLAR_STATION_HELP', 'TXT_KEY_BUILDINGS_POLAR_STATION_TEXT', 'TERRAIN_SNOW', 0;

-- Building_YieldChanges
INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_POLAR_STATION', 'YIELD_SCIENCE', 5);

INSERT INTO Building_YieldFromYieldPercent
	(BuildingType, YieldIn, YieldOut, Value)
VALUES
('BUILDING_POLAR_STATION', 		'YIELD_PRODUCTION', 		'YIELD_SCIENCE', 	10);

INSERT INTO Building_InstantYield
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_POLAR_STATION', 'YIELD_SCIENCE', 1200);

-- Building_TerrainYieldChanges
INSERT INTO Building_TerrainYieldChanges(BuildingType, TerrainType, YieldType, Yield)
SELECT 'BUILDING_POLAR_STATION', 'TERRAIN_SNOW', 'YIELD_SCIENCE', 2;

-- Building_Flavors
INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor)
SELECT 'BUILDING_POLAR_STATION', 'FLAVOR_SCIENCE', 60;

------------------------------------------------
---Text (en_US)
-------------------------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES
('TXT_KEY_BUILDING_POLAR_STATION', 'Polar Station'),
('TXT_KEY_BUILDING_POLAR_STATION_HELP', 'Instantly receive [ICON_RESEARCH]Science [COLOR_POSITIVE_TEXT]1200[ENDCOLOR] in the City in which it is built. +2 [ICON_RESEARCH] Science from all Snow tiles worked by the City. 10% of [ICON_PRODUCTION] Prodcution created by the City counts as [ICON_RESEARCH] Science Per Turn. [NEWLINE][NEWLINE]City must be built on or next to Snow.'),
('TXT_KEY_BUILDINGS_POLAR_STATION_TEXT', "Polar exploration became the focus of international efforts during the beginning of the 20th century, later becoming known as the Heroic Age to recognise the adversities faced by expeditioners and resulted in intensive scientific and geographical exploration of the polar regions. Many countries from around the world have since established stations in these remote landscapes to conduct a broad range of scientific research from meteorology and biology to cosmic radiation and climate change.");

------------------------------------------------
---Text (ko_KR)
-------------------------------------------------
INSERT INTO Language_ko_KR (Tag, Text)
VALUES
('TXT_KEY_BUILDING_POLAR_STATION', '극지연구소'),
('TXT_KEY_BUILDING_POLAR_STATION_HELP', '건설을 완료하면 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]1200[ENDCOLOR] 증가합니다. 도시 주변 설원 타일의 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. 매턴 [ICON_PRODUCTION]생산의 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR]를 [ICON_RESEARCH] 과학으로 전환합니다. [NEWLINE][NEWLINE][COLOR_YELLOW]설원과 인접한 도시[ENDCOLOR]에만 건설할 수 있습니다.'),
('TXT_KEY_BUILDINGS_POLAR_STATION_TEXT', "20세기 초반, 극지 탐사는 국제적 노력의 중심이 되었고, 이를 인정하여 이 시대를 영웅의 시대라고 불렀습니다. 이 시대는 극지 지역에 대한 철저한 과학적, 지리적 탐구의 시기였습니다. 이후로, 전 세계의 많은 나라들이 이 외딴 지역에 연구소를 설립하여 다양한 과학 연구를 수행하고 있습니다. 이러한 연구는 기상 패턴과 생물학적 생태계의 연구에서부터 우주 방사선과 기후 변화의 광범위한 영향까지 다양합니다.");

