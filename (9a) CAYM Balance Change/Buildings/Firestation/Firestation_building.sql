--=====================================
--2023.09.03 CAYM
--=====================================
-- Original Author : CAYM
--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn) VALUES
('FIRESTATION_ATLAS',256,'Fire Truck_256.dds',1,1),
('FIRESTATION_ATLAS',128,'Fire Truck_128.dds',1,1),
('FIRESTATION_ATLAS',80,'Fire Truck_80.dds',1,1),
('FIRESTATION_ATLAS',64,'Fire Truck_64.dds',1,1),
('FIRESTATION_ATLAS',45,'Fire Truck_45.dds',1,1);
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
-- BuildingClasses
INSERT INTO BuildingClasses 	
		(Type, 								DefaultBuilding, 			Description)			
VALUES	('BUILDINGCLASS_FIRESTATION', 'BUILDING_FIRESTATION', 'TXT_KEY_BUILDING_FIRESTATION');

---------------------
-- Buildings
INSERT INTO Buildings (Type, BuildingClass, Cost, HurryCostModifier, GoldMaintenance, PrereqTech, EnhancedYieldTech, ConquestProb, IconAtlas, PortraitIndex, Description, Help, Civilopedia, Strategy, NeverCapture, ScienceMedianModifier,	CultureMedianModifier, BasicNeedsMedianModifier, 	GoldMedianModifier, 	ReligiousUnrestModifier)
SELECT  'BUILDING_FIRESTATION', 'BUILDINGCLASS_FIRESTATION', 1800, -20, 7, 'TECH_REPLACEABLE_PARTS', 'TECH_REFRIGERATION', 0, 'FIRESTATION_ATLAS', 0, 'TXT_KEY_BUILDING_FIRESTATION', 'TXT_KEY_BUILDING_FIRESTATION_HELP', 'TXT_KEY_BUILDING_FIRESTATION_TEXT', 'TXT_KEY_BUILDING_FIRESTATION_STRATEGY', 1, 0, 0, 0,0, 0;

-- Building_ClassesNeededInCity
INSERT INTO Building_ClassesNeededInCity(BuildingType, BuildingClassType)
SELECT 'BUILDING_FIRESTATION', 'BUILDINGCLASS_AQUEDUCT';

-- Building_TechEnhancedYieldChanges
INSERT INTO Building_TechEnhancedYieldChanges(BuildingType, YieldType, Yield)
SELECT 'BUILDING_FIRESTATION', 'YIELD_GOLD', 2;

-- Building_Flavors
INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor)
VALUES
	('BUILDING_FIRESTATION', 'FLAVOR_GREAT_PEOPLE',	 5),
	('BUILDING_FIRESTATION', 'FLAVOR_HAPPINESS',     5);


INSERT INTO Building_YieldFromYieldPercent
	(BuildingType, YieldIn, YieldOut, Value)
VALUES
	('BUILDING_FIRESTATION', 	'YIELD_PRODUCTION', 'YIELD_GOLDEN_AGE_POINTS', 5);

------------------------------------------------
---Text (en_US)
-------------------------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES
('TXT_KEY_BUILDING_FIRESTATION','Fire Station'),
('TXT_KEY_BUILDING_FIRESTATION_HELP',"The construction speed of city tile facilities is increased by [COLOR_POSITIVE_TEXT]25%[ENDCOLOR]. Converts [COLOR_POSITIVE_TEXT]5%[ENDCOLOR] of [ICON_PRODUCTION] production each turn into [ICON_GOLDEN_AGE] Golden Age points."),
('TXT_KEY_BUILDING_FIRESTATION_STRATEGY',"Building a fire brigade increases the city's tile construction speed, accelerating the Golden Age of your civilization."),
('TXT_KEY_BUILDING_FIRESTATION_TEXT',"In the 19th century, the practice of fire brigades refusing to put out fires in buildings that were uninsured led to the demand of central command for fire companies. Cities began to form their own fire departments as a civil service to the public, obliging private fire companies to shut down, many merging their fire stations into the city's fire department. In 1833, London's ten independent brigades all merged to form the London Fire Engine Establishment (LFEE), with James Braidwood as the Chief Officer. Braidwood had previously been the fire chief in Edinburgh, where the world's first municipal fire service was founded in 1824, and he is now regarded, along with Van der Heyden, as one of founders of modern firefighting. The LFEE then was incorporated into the city's Metropolitan Fire Brigade in 1865 under Eyre Massey Shaw.");

------------------------------------------------
---Text (ko_KR)
-------------------------------------------------
INSERT INTO Language_ko_KR (Tag, Text)
VALUES
('TXT_KEY_BUILDING_FIRESTATION','소방대'),
('TXT_KEY_BUILDING_FIRESTATION_HELP','도시의 타일 시설의 건설 속도가 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR] 빨라집니다. 매턴 [ICON_PRODUCTION]생산의 [COLOR_POSITIVE_TEXT]5%[ENDCOLOR]를 [ICON_GOLDEN_AGE]황금기 점수로 전환합니다. [NEWLINE][NEWLINE]도시에 [COLOR_YELLOW]송수로[ENDCOLOR]가 있어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FIRESTATION_STRATEGY','소방대를 건설하면 도시의 타일 건설 속도가 빨라집니다. 문명의 황금기를 더 빠르게 오게 합니다.'),
('TXT_KEY_BUILDING_FIRESTATION_TEXT',"19세기에는 소방대가 보험에 가입되지 않은 건물의 화재 진압을 거부하는 관행이 소방대에 대한 중앙 지휘권을 요구하게 되었다. 도시들은 대중을 위한 공무원으로서 자체 소방서를 구성하기 시작했고, 민간 소방회사를 폐쇄하도록 의무화했으며, 많은 소방서를 시의 소방서로 통합했습니다. 1833년, 런던의 10개 독립 여단이 모두 합쳐져 런던 소방차 시설(LFEE)이 형성되었고 제임스 브레이드우드(James Braidwood)가 최고 책임자가 되었습니다. Braidwood는 이전에 1824년 세계 최초의 지방 소방대가 설립된 에딘버러의 소방서장을 역임했으며 현재 Van der Heyden과 함께 현대 소방의 창시자 중 한 명으로 간주됩니다. LFEE는 1865년 Eyre Massey Shaw 휘하의 도시 소방대(Metropolitan Fire Brigade)에 통합되었습니다.");
