--=====================================
--2023.09.03 CAYM
--=====================================
-- Original Author : CAYM
--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 						IconSize, 	 Filename, 						IconsPerRow, 	IconsPerColumn)
VALUES	('ATLAS_SAFARI_PARK', 				256, 		'Safaripark_256.dds',				1,				1),
		('ATLAS_SAFARI_PARK',			    128, 		'Safaripark_128.dds',				1, 				1),
		('ATLAS_SAFARI_PARK',			    80, 		'Safaripark_80.dds',				1, 				1),
		('ATLAS_SAFARI_PARK', 				64, 		'Safaripark_64.dds',				1, 				1),
		('ATLAS_SAFARI_PARK', 				45, 		'Safaripark_45.dds',				1, 				1);
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
-- BuildingClasses
INSERT INTO BuildingClasses 		
		(Type, 						 DefaultBuilding, 	  Description)
VALUES	
('BUILDINGCLASS_SAFARI_PARK',   'BUILDING_SAFARI_PARK',  'TXT_KEY_BUILDING_SAFARI_PARK');

------------
-- Buildings
INSERT INTO Buildings (Type,                   BuildingClass,                Cost,  HurryCostModifier, GoldMaintenance, MutuallyExclusiveGroup,PrereqTech,      ConquestProb,  IconAtlas,           PortraitIndex, Description,                   Help,                             Civilopedia,	                     IlliteracyFlatReduction,	 UnmoddedHappiness)
VALUES
                      ('BUILDING_SAFARI_PARK',  'BUILDINGCLASS_SAFARI_PARK',     2250,  -20,               11,               310,                 'TECH_ECOLOGY',      66,         'ATLAS_SAFARI_PARK',        0,        'TXT_KEY_BUILDING_SAFARI_PARK', 'TXT_KEY_BUILDING_SAFARI_PARK_HELP', 'TXT_KEY_BUILDING_SAFARI_PARK_TEXT',    2, 2);

-- Building_ClassesNeededInCity
INSERT INTO Building_ClassesNeededInCity(BuildingType, BuildingClassType)
SELECT 'BUILDING_SAFARI_PARK', 'BUILDINGCLASS_HOTEL';


INSERT INTO Building_FeatureYieldChanges
	(BuildingType, FeatureType, YieldType, Yield)
VALUES
	('BUILDING_SAFARI_PARK',    	'FEATURE_FOREST', 'YIELD_TOURISM', 1),
	('BUILDING_SAFARI_PARK',    	'FEATURE_FOREST', 'YIELD_CULTURE', 1),
	('BUILDING_SAFARI_PARK',    	'FEATURE_JUNGLE', 'YIELD_TOURISM', 1),
	('BUILDING_SAFARI_PARK',    	'FEATURE_JUNGLE', 'YIELD_CULTURE', 1),
	('BUILDING_SAFARI_PARK', 		'FEATURE_MARSH',  'YIELD_TOURISM', 1),
	('BUILDING_SAFARI_PARK', 		'FEATURE_MARSH',  'YIELD_CULTURE', 1);

-- Building_BuildingClassLocalYieldChanges
INSERT INTO Building_BuildingClassLocalYieldChanges
	(BuildingType, BuildingClassType, YieldType, YieldChange)
VALUES
	('BUILDING_SAFARI_PARK', 'BUILDINGCLASS_THEATRE',		'YIELD_TOURISM', 2),
	('BUILDING_SAFARI_PARK', 'BUILDINGCLASS_CIRCUS',      	'YIELD_TOURISM', 2),
	('BUILDING_SAFARI_PARK', 'BUILDINGCLASS_HOTEL',			'YIELD_TOURISM', 2);

-- Building_YieldFromYieldPercent
INSERT INTO Building_YieldFromYieldPercent
	(BuildingType, YieldIn, YieldOut, Value)
VALUES
	('BUILDING_SAFARI_PARK', 	'YIELD_TOURISM', 'YIELD_GOLD', 5);

-- Building_Flavors
INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor)
VALUES
	('BUILDING_SAFARI_PARK', 	'FLAVOR_GOLD',		           30),
	('BUILDING_SAFARI_PARK', 	'FLAVOR_TILE_IMPROVEMENT',		5),
	('BUILDING_SAFARI_PARK', 	'FLAVOR_CULTURE',		       15);

------------------------------------------------
---Text (en_US)
-------------------------------------------------
INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_BUILDING_SAFARI_PARK', 'Safari'),
('TXT_KEY_BUILDING_SAFARI_PARK_HELP', "+2 [ICON_HAPPINESS_1] Happiness in the City.+1 [ICON_TOURISM] Tourism  and +1 [ICON_CULTURE] Culture from all Forest or Marsh or Jungle tiles worked by the City.[NEWLINE][NEWLINE]5% of [ICON_TOURISM] Tourism created by the City is added as [ICON_GOLD] Gold per turn. Zoo, Circus and Hotel in the City gain +2 [ICON_TOURISM] Tourism.[NEWLINE][NEWLINE]-2 [ICON_HAPPINESS_3] Unhappiness from [ICON_RESEARCH] Illiteracy. [NEWLINE][NEWLINE]City cannot have a [COLOR_NEGATIVE_TEXT]Ski Resort, Urban Center, Marina[ENDCOLOR]."),
('TXT_KEY_BUILDING_SAFARI_PARK_TEXT', "In modern times, natural reserves like safari parks have become popular destinations for eco-tourism and outdoor recreation, augmenting their role as crucial havens for biodiversity. Countries around the world have invested not only in conservation efforts but also in amenities that enhance outdoor experiences, from camping facilities to wildlife education centers. Areas like the Serengeti in Tanzania or Yellowstone National Park in the United States boast state-of-the-art camping zones and educational hubs, making them must-visit locations for anyone interested in nature and wildlife.[NEWLINE][NEWLINE]Thus, in addition to their primary function as ecological sanctuaries, places like safari parks now serve as gateways to broader outdoor and educational experiences. This transformation highlights a symbiotic relationship between conservation initiatives and the thriving eco-tourism industry, each enhancing the value of the other.");

------------------------------------------------
---Text (ko_KR)
-------------------------------------------------
INSERT INTO Language_ko_KR (Tag, Text) VALUES
('TXT_KEY_BUILDING_SAFARI_PARK', '사파리'),
('TXT_KEY_BUILDING_SAFARI_PARK_HELP', "도시 주변 숲, 정글 및 습지 타일의 [ICON_TOURISM] 관광과 [ICON_CULTURE] 문화가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 도시의 서커스, 동물원, 호텔의 [ICON_TOURISM] 관광이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR]증가합니다. 매 턴 [ICON_TOURISM] 관광의 [COLOR_POSITIVE_TEXT]5%[ENDCOLOR]를 [ICON_GOLD]골드로 전환합니다. 전역 [ICON_HAPPINESS_1]행복이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR]증가합니다.[NEWLINE][NEWLINE][ICON_RESEARCH]문맹에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 감소합니다. [NEWLINE][NEWLINE]도시에 [COLOR_YELLOW]호텔[ENDCOLOR]이 있어야 하고 [COLOR_NEGATIVE_TEXT]스키 리조트, 마리나, 번화가[ENDCOLOR]가 없어야 건설할 수 있습니다."),
('TXT_KEY_BUILDING_SAFARI_PARK_TEXT', "현대에는 사파리 공원 같은 자연 보호구역이 생태 관광과 야외 레크리에이션을 위한 인기 목적지가 되었고, 그들이 생물 다양성을 위한 중요한 피난처 역할을 보완하고 있다. 전 세계의 여러 나라는 보존 노력뿐만 아니라 캠핑 시설이나 야생동물 교육 센터 같은 야외 활동을 향상시키는 편의 시설에도 투자하고 있다. 탄자니아의 세렝게티나 미국의 옐로스톤 국립 공원 같은 지역은 최첨단 캠핑 구역과 교육 허브를 자랑하며, 자연과 야생동물에 관심 있는 모든 이들에게 꼭 방문해야 할 명소가 되고 있다.[NEWLINE][NEWLINE]따라서, 사파리 공원과 같은 장소들은 생태 보호구역으로서의 기본 기능을 넘어 더 넓은 야외 및 교육 경험을 위한 관문 역할을 하고 있다. 이러한 변화는 보존 캠페인과 활발한 생태 관광 산업 사이에 상생 관계를 보여 주며, 각각이 상대방의 가치를 높여주고 있다.");