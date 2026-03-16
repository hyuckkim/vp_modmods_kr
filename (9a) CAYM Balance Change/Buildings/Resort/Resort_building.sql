--=====================================
--2023.09.03 CAYM
--=====================================
-- Original Author : Gwennog
--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases
		(Atlas, 						IconSize,	Filename,						IconsPerRow,	IconsPerColumn)
VALUES	('BUILDING_RESORT_ATLAS',		256,		'Building_Resort_256.dds',		2,				1),
		('BUILDING_RESORT_ATLAS',		128,		'Building_Resort_128.dds',		2,				1),
		('BUILDING_RESORT_ATLAS',		80,			'Building_Resort_80.dds',		2,				1),
		('BUILDING_RESORT_ATLAS',		64,			'Building_Resort_64.dds',		2,				1),
		('BUILDING_RESORT_ATLAS',		45,			'Building_Resort_45.dds',		2,				1);
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
-- BuildingClasses
INSERT INTO BuildingClasses
		(Type, 							DefaultBuilding,		Description)
VALUES	('BUILDINGCLASS_SKI_RESORT',	'BUILDING_SKI_RESORT',	'TXT_KEY_SKI_RESORT'),
		('BUILDINGCLASS_MARINA', 		'BUILDING_MARINA', 		'TXT_KEY_MARINA');

------------
-- Buildings
INSERT INTO Buildings
		(Type, 					BuildingClass, 				Cost,	HurryCostModifier,		GoldMaintenance,	MutuallyExclusiveGroup,	MinAreaSize,	 UnmoddedHappiness, DistressFlatReduction, PovertyFlatReduction,	PrereqTech,				IconAtlas, 			PortraitIndex,	    Description,		        	Help,					            	Civilopedia,					NearbyTerrainRequired,	Water,	NeverCapture,	ConquestProb)
VALUES 	('BUILDING_SKI_RESORT', 'BUILDINGCLASS_SKI_RESORT',	2250,	-20,					11,					310,					0,				 2,                   2,			                 	0,	        'TECH_ECOLOGY',	'BUILDING_RESORT_ATLAS',		1,				'TXT_KEY_BUILDING_SKI_RESORT',	'TXT_KEY_BUILDING_SKI_RESORT_HELP',	'TXT_KEY_BUILDING_SKI_RESORT_TEXT',	'TERRAIN_MOUNTAIN',		0,		0,				66),
		('BUILDING_MARINA', 	'BUILDINGCLASS_MARINA',		2250,	-20,					11,					310,					10,				 2,                   0,			                	2,		    'TECH_ECOLOGY',	'BUILDING_RESORT_ATLAS',		0,				'TXT_KEY_BUILDING_MARINA',		'TXT_KEY_BUILDING_MARINA_HELP',		'TXT_KEY_BUILDING_MARINA_TEXT',		  null,					1,		0,				66);

-- Building_ClassesNeededInCity
INSERT INTO Building_ClassesNeededInCity(BuildingType, BuildingClassType)
SELECT 'BUILDING_SKI_RESORT', 'BUILDINGCLASS_HOTEL';

INSERT INTO Building_ClassesNeededInCity(BuildingType, BuildingClassType)
SELECT 'BUILDING_MARINA',     'BUILDINGCLASS_HOTEL';


-- Building_YieldPerXTerrainTimes100
INSERT INTO Building_YieldPerXTerrainTimes100
	(BuildingType, TerrainType, YieldType, Yield)
VALUES 
	('BUILDING_SKI_RESORT', 'TERRAIN_MOUNTAIN',	'YIELD_TOURISM',    100),		
	('BUILDING_SKI_RESORT', 'TERRAIN_MOUNTAIN',	'YIELD_CULTURE',    100);			

-- Building_TerrainYieldChanges
INSERT INTO Building_TerrainYieldChanges
	(BuildingType, TerrainType, YieldType, Yield)
VALUES
	('BUILDING_MARINA', 'TERRAIN_COAST',	'YIELD_TOURISM', 1),
	('BUILDING_MARINA', 'TERRAIN_COAST',	'YIELD_CULTURE', 1);

-- Building_YieldFromYieldPercent
INSERT INTO Building_YieldFromYieldPercent
	(BuildingType, YieldIn, YieldOut, Value)
VALUES
	('BUILDING_SKI_RESORT', 'YIELD_TOURISM', 'YIELD_GOLD',    5),
	('BUILDING_MARINA', 	'YIELD_TOURISM', 'YIELD_GOLD',    5);
	
-- Building_BuildingClassLocalYieldChanges
INSERT INTO Building_BuildingClassLocalYieldChanges
	(BuildingType, BuildingClassType, YieldType, YieldChange)
VALUES
	('BUILDING_SKI_RESORT', 'BUILDINGCLASS_MARKET',			'YIELD_TOURISM', 2),
	('BUILDING_SKI_RESORT', 'BUILDINGCLASS_COALING_STATION','YIELD_TOURISM', 2),
	('BUILDING_SKI_RESORT', 'BUILDINGCLASS_HOTEL',			'YIELD_TOURISM', 2),
	('BUILDING_MARINA', 	'BUILDINGCLASS_LIGHTHOUSE',		'YIELD_TOURISM', 2),
	('BUILDING_MARINA', 	'BUILDINGCLASS_HARBOR',			'YIELD_TOURISM', 2),
	('BUILDING_MARINA', 	'BUILDINGCLASS_HOTEL',			'YIELD_TOURISM', 2);
	
-- Building_Flavors
INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor)
VALUES
	('BUILDING_SKI_RESORT', 'FLAVOR_GOLD',		        15),
	('BUILDING_SKI_RESORT', 'FLAVOR_CULTURE',		    15),
	('BUILDING_SKI_RESORT', 'FLAVOR_TILE_IMPROVEMENT',	5),
	('BUILDING_MARINA',     'FLAVOR_TILE_IMPROVEMENT',	5),
	('BUILDING_MARINA',     'FLAVOR_CULTURE',	        15),
	('BUILDING_MARINA', 	'FLAVOR_GOLD',		        15);

------------------------------------------------
---Text (en_US)
-------------------------------------------------
INSERT INTO Language_en_US (Tag, Text) 
VALUES
('TXT_KEY_BUILDING_SKI_RESORT','Ski Resort'),
('TXT_KEY_BUILDING_SKI_RESORT_HELP','+2 [ICON_HAPPINESS_1] Happiness in the City.+1 [ICON_TOURISM] Tourism  and +1 [ICON_CULTURE] Culture from all Mountain tiles within the workable territory of the City.[NEWLINE][NEWLINE]5% of [ICON_TOURISM] Tourism created by the City is added as [ICON_GOLD] Gold per turn. Market, Train Station and Hotel in the City gain +2 [ICON_TOURISM] Tourism.[NEWLINE][NEWLINE]-2 [ICON_HAPPINESS_3] Unhappiness from [ICON_FOOD]/[ICON_PRODUCTION] Distress.[NEWLINE][NEWLINE]City must be built on or next to Mountain. City cannot have a [COLOR_NEGATIVE_TEXT]Marina, Safari, Urban Center[ENDCOLOR].'),
('TXT_KEY_BUILDING_SKI_RESORT_TEXT',"A ski resort is a resort developed for skiing, snowboarding, and other winter sports. In Europe, most ski resorts are towns or villages in or adjacent to a ski area ? a mountainous area with pistes (ski trails) and a ski lift system. In North America, it is more common for ski areas to exist well away from towns, so ski resorts usually are destination resorts, often purpose-built and self-contained, where skiing is the main activity.");

INSERT INTO Language_en_US (Tag, Text) 
VALUES
('TXT_KEY_BUILDING_MARINA','Marina'),
('TXT_KEY_BUILDING_MARINA_HELP','+2 [ICON_HAPPINESS_1] Happiness in the City.+1 [ICON_TOURISM] Tourism and +1 [ICON_CULTURE] Culture from all Coast or Lake tiles worked by the City.[NEWLINE][NEWLINE]5% of [ICON_TOURISM] Tourism created by the City is added as [ICON_GOLD] Gold per turn. Lighthouse, Harbor and Hotel in the City gain +2 [ICON_TOURISM] Tourism.[NEWLINE][NEWLINE]-2 [ICON_HAPPINESS_3] Unhappiness from [ICON_GOLD] Poverty. [NEWLINE][NEWLINE]City must be built by Sea or Lake. City cannot have a [COLOR_NEGATIVE_TEXT]Ski Resort, Safari, Urban Center[ENDCOLOR].'),
('TXT_KEY_BUILDING_MARINA_TEXT',"A Marina is more than just a simple dock or basin; it''s a well-equipped haven for boaters, yachtsmen, and various other water enthusiasts. Often strategically located along the banks of rivers, lakes, or sea coasts, marinas offer a range of mooring options, from simple tie-up spots to advanced docking systems equipped with electricity, water, and other essential utilities. Many modern marinas are integrated into larger resort complexes or coastal developments, offering not only essential nautical services but also a broad array of amenities aimed at both boaters and general tourists. These may include restaurants, shops, hotels, and leisure facilities like swimming pools, gyms, and even golf courses. Marinas often feature repair and maintenance services, boat rental opportunities, and sailing schools for those interested in improving their nautical skills.Security is another key feature of well-designed marinas, which usually provide gated access, surveillance cameras, and on-site personnel to ensure the safety of both the boats and their owners. Additionally, marinas often serve as launching points for fishing expeditions, water sports, and scenic boat tours, making them versatile hubs of water-based activity.");

------------------------------------------------
---Text (ko_KR)
-------------------------------------------------
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES
('TXT_KEY_BUILDING_SKI_RESORT','스키 리조트'),
('TXT_KEY_BUILDING_SKI_RESORT_HELP','도시 주변 3타일 이내의 산 1개마다 [ICON_TOURISM]관광과 [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.  도시의 시장, 석탄 저장소, 호텔의 [ICON_TOURISM] 관광이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR]증가합니다. 매 턴 [ICON_TOURISM] 관광의 [COLOR_POSITIVE_TEXT]5%[ENDCOLOR]를 [ICON_GOLD]골드로 전환합니다. 전역 [ICON_HAPPINESS_1]행복이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR]증가합니다.[NEWLINE][NEWLINE][ICON_FOOD]/[ICON_PRODUCTION]낙후에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 감소합니다.[NEWLINE][NEWLINE]도시는 [COLOR_YELLOW]산과 인접한 도시[ENDCOLOR]에만 건설할 수 있습니다. 도시에 [COLOR_YELLOW]호텔[ENDCOLOR]이 있어야 하고 [COLOR_NEGATIVE_TEXT]마리나, 사파리, 번화가[ENDCOLOR]가 없어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_SKI_RESORT_TEXT',"스키 리조트는 스키, 스노보드 및 기타 겨울 스포츠를 위해 개발된 리조트입니다. 유럽에서는 대부분의 스키 리조트가 스키 지역인 산안이나 인근의 마을이나 마을입니다. 북미에서는 스키 지역이 마을에서 멀리 떨어져 있을 확률이 높아, 스키 리조트는 주로 목적지 리조트로, 종종 목적을 가지고 독립적으로 건설되며 스키가 주요 활동입니다.");

INSERT INTO Language_ko_KR (Tag, Text) 
VALUES
('TXT_KEY_BUILDING_MARINA','마리나'),
('TXT_KEY_BUILDING_MARINA_HELP','도시 주변 호수 및 연안 타일의 [ICON_TOURISM]관광과[ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 도시의 등대, 항만, 호텔의 [ICON_TOURISM] 관광이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR]증가합니다. 매 턴 [ICON_TOURISM] 관광의 [COLOR_POSITIVE_TEXT]5%[ENDCOLOR]를 [ICON_GOLD]골드로 전환합니다. 전역 [ICON_HAPPINESS_1]행복이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR]증가합니다. [NEWLINE][NEWLINE][ICON_GOLD]빈곤에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 감소합니다. [NEWLINE][NEWLINE]도시는 [COLOR_YELLOW]호수나 해안 도시[ENDCOLOR]에만 건설할 수 있습니다. 도시에 [COLOR_YELLOW]호텔[ENDCOLOR]이 있어야 하고 [COLOR_NEGATIVE_TEXT]스키 리조트, 사파리, 번화가[ENDCOLOR]가 없어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_MARINA_TEXT',"마리나는 단순한 부두나 항구를 넘어 다양한 수상 스포츠 애호가와 요트맨을 위한 잘 갖춰진 피난처입니다. 대부분의 마리나는 강변, 호수, 또는 해안가와 같은 전략적으로 중요한 위치에 자리하고 있으며, 간단한 계류부터 전기, 물, 그리고 기타 필수 시설이 갖춰진 첨단 도킹 시스템까지 다양한 계류 옵션을 제공합니다. 현대의 많은 마리나는 더 큰 리조트 단지나 해안 개발 프로젝트와 통합되어 있어, 보트와 요트뿐만 아니라 일반 관광객을 위한 다양한 편의 시설도 함께 제공합니다. 이러한 시설로는 식당, 상점, 호텔, 수영장, 체육관, 심지어 골프 코스까지 포함될 수 있습니다. 마리나는 수상 기술을 향상시키고자 하는 이들을 위한 보트 수리 및 유지 보수 서비스, 보트 렌탈, 그리고 항해 학교도 자주 운영합니다.보안도 잘 설계된 마리나의 중요한 특징 중 하나로, 대게는 출입 통제, 감시 카메라, 그리고 현장 인력을 통해 보트와 소유주의 안전을 보장합니다. 또한, 마리나는 종종 낚시 원정, 수상 스포츠, 그리고 경치 좋은 보트 투어의 출발점으로 활용되어, 다양한 수상 활동의 중심지로 작용합니다.");
