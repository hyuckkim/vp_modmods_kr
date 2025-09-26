--=====================================
--2023.09.03 CAYM
--=====================================

--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn) VALUES
('SHOPPINGMALL_ATLAS',256,'Shoppingmall_256.dds',1,1),
('SHOPPINGMALL_ATLAS',128,'Shoppingmall_128.dds',1,1),
('SHOPPINGMALL_ATLAS',80, 'Shoppingmall_080.dds',1,1),
('SHOPPINGMALL_ATLAS',64, 'Shoppingmall_064.dds',1,1),
('SHOPPINGMALL_ATLAS',45, 'Shoppingmall_045.dds',1,1);

--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
---------------------

-- BuildingClasses
INSERT INTO BuildingClasses (Type, DefaultBuilding, Description)
SELECT 'BUILDINGCLASS_SHOPPINGMALL', 'BUILDING_SHOPPINGMALL', 'TXT_KEY_BUILDING_SHOPPINGMALL';

---------------------
-- Buildings
INSERT INTO Buildings (Type, BuildingClass, Cost, HurryCostModifier, GoldMaintenance,	MutuallyExclusiveGroup, PrereqTech, EnhancedYieldTech, ConquestProb, IconAtlas, PortraitIndex, Description, Help, Civilopedia, Strategy, NeverCapture, Happiness, BasicNeedsMedianModifier)
SELECT 'BUILDING_SHOPPINGMALL', 'BUILDINGCLASS_SHOPPINGMALL', 1800, -20, 7, 3197,'TECH_CORPORATIONS', 'TECH_TELECOM', 0, 'SHOPPINGMALL_ATLAS', 0, 'TXT_KEY_BUILDING_SHOPPINGMALL', 'TXT_KEY_BUILDING_SHOPPINGMALL_HELP', 'TXT_KEY_BUILDING_SHOPPINGMALL_TEXT', 'TXT_KEY_BUILDING_SHOPPINGMALL_STRATEGY', 1, 2, 10;

-- Building_ClassesNeededInCity
INSERT INTO Building_ClassesNeededInCity(BuildingType, BuildingClassType)
SELECT 'BUILDING_SHOPPINGMALL', 'BUILDINGCLASS_HOTEL';

-- Building_BuildingClassLocalYieldChanges
INSERT INTO Building_BuildingClassLocalYieldChanges
	(BuildingType, BuildingClassType, YieldType, YieldChange)
VALUES
('BUILDING_SHOPPINGMALL', 'BUILDINGCLASS_FIRAXITE_MATERIALS_FRANCHISE', 'YIELD_GOLD', 5),
('BUILDING_SHOPPINGMALL', 'BUILDINGCLASS_TRADER_SIDS_FRANCHISE', 'YIELD_GOLD', 5),
('BUILDING_SHOPPINGMALL', 'BUILDINGCLASS_LANDSEA_EXTRACTORS_FRANCHISE', 'YIELD_GOLD', 5),
('BUILDING_SHOPPINGMALL', 'BUILDINGCLASS_HEXXON_REFINERY_FRANCHISE', 'YIELD_GOLD', 5),
('BUILDING_SHOPPINGMALL', 'BUILDINGCLASS_GIORGIO_ARMEIER_FRANCHISE', 'YIELD_GOLD', 5),
('BUILDING_SHOPPINGMALL', 'BUILDINGCLASS_TWOKAY_FOODS_FRANCHISE', 'YIELD_GOLD', 5),
('BUILDING_SHOPPINGMALL', 'BUILDINGCLASS_CIVILIZED_JEWELERS_FRANCHISE', 'YIELD_GOLD', 5),
('BUILDING_SHOPPINGMALL', 'BUILDINGCLASS_FIRAXITE_MATERIALS_FRANCHISE', 'YIELD_TOURISM', 2),
('BUILDING_SHOPPINGMALL', 'BUILDINGCLASS_TRADER_SIDS_FRANCHISE', 'YIELD_TOURISM', 2),
('BUILDING_SHOPPINGMALL', 'BUILDINGCLASS_LANDSEA_EXTRACTORS_FRANCHISE', 'YIELD_TOURISM', 2),
('BUILDING_SHOPPINGMALL', 'BUILDINGCLASS_HEXXON_REFINERY_FRANCHISE', 'YIELD_TOURISM', 2),
('BUILDING_SHOPPINGMALL', 'BUILDINGCLASS_GIORGIO_ARMEIER_FRANCHISE', 'YIELD_TOURISM', 2),
('BUILDING_SHOPPINGMALL', 'BUILDINGCLASS_TWOKAY_FOODS_FRANCHISE', 'YIELD_TOURISM', 2),
('BUILDING_SHOPPINGMALL', 'BUILDINGCLASS_CIVILIZED_JEWELERS_FRANCHISE', 'YIELD_TOURISM', 2);

UPDATE Buildings
SET MinAreaSize = 10, TradeRouteRecipientBonus = 2
WHERE Type = 'BUILDING_SHOPPINGMALL';

-- Building_Flavors
INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor)
SELECT 'BUILDING_SHOPPINGMALL', 'FLAVOR_GOLD', 50;

------------------------------------------------
---Text (en_US)
-------------------------------------------------

INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_BUILDING_SHOPPINGMALL','Shoppingm Mall'),
('TXT_KEY_BUILDING_SHOPPINGMALL_HELP',' [ICON_INTERNATIONAL_TRADE] Trade Routes to this City generate +2 [ICON_GOLD] Gold. All Corporate Franchises in this City generate +5 [ICON_GOLD] Gold and +2 [ICON_TOURISM] Tourism.[NEWLINE][NEWLINE]Increases [ICON_HAPPINESS_3] Unhappiness from [ICON_GOLD] Poverty slightly. '),
('TXT_KEY_BUILDING_SHOPPINGMALL_STRATEGY','The SHOPPINGMALL is a mid-game building which increases [ICON_GOLD] Gold output and reduces [ICON_HAPPINESS_3] Boredom, but increases [ICON_HAPPINESS_3] Poverty. A Hotel is required in the City before a SHOPPINGMALL can be constructed.'),
('TXT_KEY_BUILDING_SHOPPINGMALL_TEXT','The word "SHOPPINGMALL" is of Italian origin; the root "casa" means "house". The term may refer to a small country villa, summerhouse, or social club. During the 19th century, this came to include other public buildings where pleasurable activities took place; such edifices were usually built on the grounds of a larger Italian villa or palazzo, and were used to host civic town functions, including dancing, gambling, music listening, and sports.[NEWLINE][NEWLINE]The first known European gambling house was called the Ridotto, established in Venice in 1638 to provide controlled gambling during the carnival season. It was closed in 1770 as the city government perceived it to impoverish the local gentry.[NEWLINE][NEWLINE]Whilst the precise origin of gambling is unknown, the Chinese recorded the first official account of the practice in 2300 BC, but it is generally believed that gambling in some form or another has been seen in almost every society in history. From the Ancient Greeks and Romans to Napoleon''s France and Elizabethan England, much of history is filled with stories of entertainment based on games of chance.');

------------------------------------------------
---Text (ko_KR)
-------------------------------------------------
INSERT INTO Language_ko_KR (Tag, Text) VALUES
('TXT_KEY_BUILDING_SHOPPINGMALL','쇼핑몰'),
('TXT_KEY_BUILDING_SHOPPINGMALL_HELP','이 도시로 향하는 [ICON_ARROW_LEFT]교역로마다 [ICON_GOLD] 골드가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR]증가합니다. 이 도시의 모든 기업 프랜차이즈는 [ICON_GOLD] 골드가 [COLOR_POSITIVE_TEXT]5[ENDCOLOR]와 [ICON_TOURISM] 관광이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR]증가합니다. 전역 [ICON_HAPPINESS_1] 행복이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR]증가합니다. [NEWLINE][NEWLINE][ICON_FOOD]/[ICON_PRODUCTION] 낙후로 인한 [ICON_HAPPINESS_3]불행이 약간 증가합니다. [NEWLINE][NEWLINE]도시에 [COLOR_YELLOW]호텔[ENDCOLOR]이 있어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_SHOPPINGMALL_STRATEGY','쇼핑몰은 기업 프랜차이즈와 무역로가 있는 도시에 가장 적합합니다. 그러나 이것은 낙후의 불행 증가하는 대가를 치릅니다.'),
('TXT_KEY_BUILDING_SHOPPINGMALL_TEXT','쇼핑몰(또는 단순히 몰)은 대부분 백화점으로 구성된 큰 실내 쇼핑 센터입니다. "몰"이라는 용어는 원래 상점들이 양쪽에 있는 보행자 전용 산책로를 의미했지만, 1960년대 후반에는 그 당시 흔해지고 있던 큰 실내 쇼핑 센터를 일반적으로 지칭하기 위해 사용되기 시작했습니다.[NEWLINE][NEWLINE]20세기 동안 자동차의 등장은 사람들이 한 지역에 살면서 다른 곳에서 쇼핑, 놀이, 일을 할 수 있는 도시와 교외 지역을 만들었습니다. 쇼핑몰은 선택, 편의, 그리고 근접성을 제공하여 이동 거리를 크게 줄여줍니다. 과거에는 사람들이 식료품을 사기 위해 20마일 이상을 이동했던 것과 달리, 그 거리가 크게 줄어들었습니다.[NEWLINE][NEWLINE]큰 소매 개발의 열렬한 지지자들은 종종 몰이 타운십 쇼퍼들에게 편의, 선택, 안전을 제공한다고 주장합니다. 그들은 더 나아가 몰이 종종 황폐하고 안전하지 않은 공간의 도시 재생을 초래한다고 덧붙입니다. 그러나 몰에서 발생하는 이익은 거의 타운십 커뮤니티와 현지 비즈니스로 유입되지 않고 투자자와 주주에게 채널링되어 불평등의 차이를 더욱 확대시킵니다.');
