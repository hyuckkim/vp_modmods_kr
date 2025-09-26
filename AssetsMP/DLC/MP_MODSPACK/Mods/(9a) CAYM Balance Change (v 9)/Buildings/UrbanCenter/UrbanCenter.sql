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
VALUES	('ATLAS_URBAN_CENTER', 				256, 		'UrbanCenter256.dds',				1,				1),
		('ATLAS_URBAN_CENTER',				128, 		'UrbanCenter128.dds',				1, 				1),
		('ATLAS_URBAN_CENTER',				80, 		'UrbanCenter80.dds',				1, 				1),
		('ATLAS_URBAN_CENTER', 				64, 		'UrbanCenter64.dds',				1, 				1),
		('ATLAS_URBAN_CENTER', 				45, 		'UrbanCenter45.dds',				1, 				1);
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
-- BuildingClasses
INSERT INTO BuildingClasses 		
		(Type, 						 DefaultBuilding, 	  Description)
VALUES	
('BUILDINGCLASS_URBAN_CENTER',   'BUILDING_URBAN_CENTER',  'TXT_KEY_BUILDING_URBAN_CENTER');

------------
-- Buildings
INSERT INTO Buildings (Type,                   BuildingClass,                Cost,  HurryCostModifier, GoldMaintenance, MutuallyExclusiveGroup,PrereqTech,      ConquestProb,  IconAtlas,           PortraitIndex, Description,                   Help,                             Civilopedia,	                     NoUnhappfromXSpecialists)
VALUES
                      ('BUILDING_URBAN_CENTER',  'BUILDINGCLASS_URBAN_CENTER',     2250,  -20,               11,               310,                 'TECH_ECOLOGY',      66,         'ATLAS_URBAN_CENTER',        0,        'TXT_KEY_BUILDING_URBAN_CENTER', 'TXT_KEY_BUILDING_URBAN_CENTER_HELP', 'TXT_KEY_BUILDING_URBAN_CENTER_TEXT',    2);

-- Building_ClassesNeededInCity
INSERT INTO Building_ClassesNeededInCity(BuildingType, BuildingClassType)
SELECT 'BUILDING_URBAN_CENTER', 'BUILDINGCLASS_HOTEL';


INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_URBAN_CENTER', 'YIELD_GOLDEN_AGE_POINTS', 2);
	
INSERT INTO Building_YieldChangesPerPop	
	(BuildingType, YieldType, Yield) VALUES
	('BUILDING_URBAN_CENTER', 'YIELD_CULTURE', 20),
	('BUILDING_URBAN_CENTER', 'YIELD_TOURISM', 20);
	
-- Building_BuildingClassLocalYieldChanges
INSERT INTO Building_BuildingClassLocalYieldChanges
	(BuildingType, BuildingClassType, YieldType, YieldChange)
VALUES
	('BUILDING_URBAN_CENTER', 'BUILDINGCLASS_STADIUM',		'YIELD_TOURISM', 2),
	('BUILDING_URBAN_CENTER', 'BUILDINGCLASS_AIRPORT',     	'YIELD_TOURISM', 2),
	('BUILDING_URBAN_CENTER', 'BUILDINGCLASS_HOTEL',		'YIELD_TOURISM', 2);

-- Building_YieldFromYieldPercent
INSERT INTO Building_YieldFromYieldPercent
	(BuildingType, YieldIn, YieldOut, Value)
VALUES
	('BUILDING_URBAN_CENTER', 	'YIELD_TOURISM', 'YIELD_GOLD', 5);

-- Building_Flavors
INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor)
VALUES
	('BUILDING_URBAN_CENTER', 	'FLAVOR_GOLD',		    30),
	('BUILDING_URBAN_CENTER', 	'FLAVOR_CULTURE',		15);

------------------------------------------------
---Text (en_US)
-------------------------------------------------
INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_BUILDING_URBAN_CENTER', 'Urban Center'),
('TXT_KEY_BUILDING_URBAN_CENTER_HELP', "+2[ICON_GOLDEN_AGE] Golden Age Point,  +1[ICON_CULTURE] Culture and [ICON_TOURISM]Tourism every 5[ICON_CITIZEN] Citizens in the City. 5% of [ICON_TOURISM] Tourism created by the City is added as [ICON_GOLD] Gold per turn. Temple, Stadium, Airport and Hotel in the City gain +2 [ICON_TOURISM] Tourism.[NEWLINE][NEWLINE]2 Specialist in this City no longer produces [ICON_HAPPINESS_3] Unhappiness from [ICON_URBANIZATION] Urbanization.[NEWLINE][NEWLINE]20% of [ICON_TOURISM] Tourism created by the City is added as [ICON_GOLD] Gold per turn. Market, Grocer, Train Station and Hotel in the City gain +2 [ICON_TOURISM] Tourism.[NEWLINE][NEWLINE]+2 [ICON_HAPPINESS_1] Happiness in the City. [NEWLINE][NEWLINE]City cannot have a [COLOR_NEGATIVE_TEXT]Marina, Ski Resort[ENDCOLOR]."),
('TXT_KEY_BUILDING_URBAN_CENTER_TEXT', "In contemporary society, bustling districts have evolved into focal points for a myriad of leisure and tourism activities, amplifying their status beyond mere commercial zones. Cities across the globe, from New York to Seoul to London, have not only capitalized on commercial successes but also invested in infrastructure that heightens the tourism experience—from cutting-edge theaters to high-end shopping destinations. These urban hubs attract tourists and locals alike with their wide array of entertainment and cultural amenities, such as world-class shopping malls, theatres, and museums. Cities like Tokyo, Hong Kong, and Sydney feature some of the globe’s premier shopping and cultural centers, making them indispensable destinations for anyone with a zest for shopping, dining, and culture. In essence, these bustling districts serve not just as commercial centers, but as cultural and entertainment meccas that symbiotically enhance the touristic allure of the cities they are in.");

------------------------------------------------
---Text (ko_KR)
-------------------------------------------------
INSERT INTO Language_ko_KR (Tag, Text) VALUES
('TXT_KEY_BUILDING_URBAN_CENTER', '번화가'),
('TXT_KEY_BUILDING_URBAN_CENTER_HELP', "[ICON_CITIZEN]시민 5명마다 [ICON_CULTURE]문화와 [ICON_TOURISM]관광이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]씩 증가합니다. 도시의 경기장, 공항, 호텔의 [ICON_TOURISM]관광이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR]증가합니다. 매 턴 [ICON_TOURISM] 관광의 [COLOR_POSITIVE_TEXT]5%[ENDCOLOR]가 [ICON_GOLD] 골드로 전환합니다. [NEWLINE][NEWLINE]전문가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR]명이 더이상 [ICON_URBANIZATION] 도시화에서 오는 [ICON_HAPPINESS_3] 불행을 증가시키지 않습니다.[NEWLINE][NEWLINE]도시에 [COLOR_YELLOW]호텔[ENDCOLOR]이 있어야 하고 [COLOR_NEGATIVE_TEXT]마리나, 스키 리조트, 사파리[ENDCOLOR]가 없어야 건설할 수 있습니다."),
('TXT_KEY_BUILDING_URBAN_CENTER_TEXT', "현대 사회에서 번화가는 단순한 상업 지역을 넘어 다양한 여가와 관광 활동의 중심지로 발전하고 있습니다. 뉴욕에서 서울, 런던에 이르기까지 세계 각지의 도시들은 상업적 성공을 활용하는 것뿐만 아니라, 종교 시설, 첨단 극장부터 고급 쇼핑 명소까지 관광 경험을 높일 수 있는 인프라에도 투자하고 있습니다. 이러한 도심의 중심지는 세계 수준의 쇼핑몰, 극장, 박물관 등 다양한 엔터테인먼트와 문화 시설로 관광객과 현지인 모두를 끌어들입니다. 도쿄, 홍콩, 시드니와 같은 도시들은 세계 최고의 쇼핑과 문화 중심지를 자랑하며, 쇼핑, 식사, 문화에 관심이 있는 누구에게나 반드시 방문해야 할 목적지입니다. 본질적으로 이러한 번화가는 단순한 상업 중심지를 넘어 문화와 엔터테인먼트의 메카로서, 그들이 속한 도시의 관광 매력을 상호적으로 높이고 있습니다.");