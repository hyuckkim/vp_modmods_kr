--=====================================
--2023.09.03 CAYM
--=====================================
-- Original creator : CAYM
--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn) VALUES
('BUILDING_BRC_LAB_ATLAS',256,'building_BRC_256.dds',1,1),
('BUILDING_BRC_LAB_ATLAS',128,'building_BRC_128.dds',1,1),
('BUILDING_BRC_LAB_ATLAS',80,'building_BRC_080.dds',1,1),
('BUILDING_BRC_LAB_ATLAS',64,'building_BRC_064.dds',1,1),
('BUILDING_BRC_LAB_ATLAS',45,'building_BRC_045.dds',1,1);
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
-- BuildingClasses
INSERT INTO BuildingClasses (Type, DefaultBuilding, Description) VALUES
('BUILDINGCLASS_BRC_LAB', 'BUILDING_BRC_LAB', 'TXT_KEY_BUILDING_BRC_LAB');

------------
-- Buildings
INSERT INTO Buildings (Type, BuildingClass, Cost, HurryCostModifier, GoldMaintenance, PrereqTech, ConquestProb, IconAtlas, PortraitIndex, Description, Help, Civilopedia, Strategy, NeverCapture) VALUES
('BUILDING_BRC_LAB', 'BUILDINGCLASS_BRC_LAB', 2250, -20, 9, 'TECH_PENICILIN', 66, 'BUILDING_BRC_LAB_ATLAS', 0, 'TXT_KEY_BUILDING_BRC_LAB', 'TXT_KEY_BUILDING_BRC_LAB_HELP', 'TXT_KEY_BUILDING_BRC_LAB_CIVILOPEDIA', 'TXT_KEY_BUILDING_BRC_LAB_STRATEGY', 0);

-- Building_ClassesNeededInCity
INSERT INTO Building_ClassesNeededInCity (BuildingType, BuildingClassType) VALUES
('BUILDING_BRC_LAB', 'BUILDINGCLASS_LABORATORY');

-- Building_YieldChanges
INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_BRC_LAB', 'YIELD_FOOD', 3),
('BUILDING_BRC_LAB', 'YIELD_SCIENCE', 4);

INSERT INTO Building_ResourceYieldChanges
	(BuildingType, ResourceType, YieldType, Yield)
VALUES
	('BUILDING_BRC_LAB', 'RESOURCE_WHEAT', 'YIELD_FOOD', 2),
	('BUILDING_BRC_LAB', 'RESOURCE_BANANA', 'YIELD_FOOD', 2),
	('BUILDING_BRC_LAB', 'RESOURCE_MAIZE', 'YIELD_FOOD', 2),
	('BUILDING_BRC_LAB', 'RESOURCE_RICE', 'YIELD_FOOD', 2);

INSERT INTO Building_ImprovementYieldChanges
	(BuildingType, 						ImprovementType, 						YieldType, 		Yield)
VALUES
	('BUILDING_BRC_LAB', 			 'IMPROVEMENT_FARM',   		        'YIELD_FOOD', 		1),
    ('BUILDING_BRC_LAB', 			 'IMPROVEMENT_PASTURE',   	    	'YIELD_FOOD', 		1),
	('BUILDING_BRC_LAB', 			 'IMPROVEMENT_TERRACE_FARM',   		'YIELD_FOOD', 		1),
	('BUILDING_BRC_LAB', 			 'IMPROVEMENT_PLANTATION',   		'YIELD_FOOD', 		1),
	('BUILDING_BRC_LAB', 			 'IMPROVEMENT_POLDER',   	    	'YIELD_FOOD', 		1);

UPDATE Buildings
SET DistressFlatReduction = 1
WHERE Type = 'BUILDING_BRC_LAB';

INSERT INTO Building_ImprovementYieldChanges
    (BuildingType, 						ImprovementType, 						YieldType, 		Yield)
SELECT 'BUILDING_BRC_LAB', 'IMPROVEMENT_ROME_LATIFUNDIUM', 'YIELD_FOOD',      1
WHERE EXISTS (SELECT 1 FROM Improvements WHERE Type='IMPROVEMENT_ROME_LATIFUNDIUM');

INSERT INTO Building_ImprovementYieldChanges
    (BuildingType, 						ImprovementType, 						YieldType, 		Yield)
SELECT 'BUILDING_BRC_LAB', 'IMPROVEMENT_ROME_LATIFUNDIUM', 'YIELD_GOLD',      1
WHERE EXISTS (SELECT 1 FROM Improvements WHERE Type='IMPROVEMENT_ROME_LATIFUNDIUM');

INSERT INTO Building_ImprovementYieldChanges
    (BuildingType, ImprovementType,          YieldType,   Yield)
SELECT 'BUILDING_BRC_LAB', 'IMPROVEMENT_FW_BIOWELL',      'YIELD_FOOD', 1
WHERE EXISTS (SELECT 1 FROM Units WHERE Type = 'UNIT_FW_SPACE_COLONIST')
  AND NOT EXISTS (
      SELECT 1 FROM Building_ImprovementYieldChanges
      WHERE BuildingType = 'BUILDING_BRC_LAB'
        AND ImprovementType = 'IMPROVEMENT_FW_BIOWELL'
        AND YieldType = 'YIELD_FOOD'
  );

INSERT INTO Building_ImprovementYieldChanges
    (BuildingType, ImprovementType,          YieldType,   Yield)
SELECT 'BUILDING_BRC_LAB', 'IMPROVEMENT_FW_HYDROPONICS_DOME', 'YIELD_FOOD', 1
WHERE EXISTS (SELECT 1 FROM Units WHERE Type = 'UNIT_FW_SPACE_COLONIST')
  AND NOT EXISTS (
      SELECT 1 FROM Building_ImprovementYieldChanges
      WHERE BuildingType = 'BUILDING_BRC_LAB'
        AND ImprovementType = 'IMPROVEMENT_FW_HYDROPONICS_DOME'
        AND YieldType = 'YIELD_FOOD'
  );


  -- Building_Flavors
INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) VALUES
('BUILDING_BRC_LAB', 'FLAVOR_GROWTH', 50),
('BUILDING_BRC_LAB', 'FLAVOR_SCIENCE', 15);

------------------------------------------------
---Text (en_US)
-------------------------------------------------
INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_BUILDING_BRC_LAB', 'Breeding Research Center'),
('TXT_KEY_BUILDING_BRC_LAB_STRATEGY', 'The BRC Lab is a late game building which provides a boost to [ICON_FOOD] Food and [ICON_PRODUCTION] Production. The City must have a Labaratory in order to construct a BRC Lab.'),
('TXT_KEY_BUILDING_BRC_LAB_CIVILOPEDIA', 'A breeding research Center is generally a scientific research facility focused on studying and improving the genetic characteristics of plants. Utilizing various methods such as genetic editing, cross-breeding, and genetic analysis, these Centers aim to develop plants or animals with desired traits such as higher yield, disease resistance, or improved nutritional value. Breeding research plays a critical role in agriculture, livestock farming, food supply, and sustainable development. These institutes are typically staffed by scientists and researchers and often collaborate with universities, governmental agencies, or private companies for research endeavors.'),
('TXT_KEY_BUILDING_BRC_LAB_HELP', '+1 [ICON_FOOD] Food for each Farm,Pasture, Polder, Terrace Farm, Plantation on City. [NEWLINE][NEWLINE] -1 [ICON_HAPPINESS_3] Unhappiness from [ICON_FOOD]/[ICON_PRODUCTION] Distress.[NEWLINE][NEWLINE][ICON_RES_WHEAT]Wheat:+2[ICON_FOOD]Food[NEWLINE][ICON_RES_BANANA]Banana:+2[ICON_FOOD]Food[NEWLINE][ICON_RES_RICE]Rice:+2[ICON_FOOD]Food[NEWLINE][ICON_RES_MAIZE]Maize:+2[ICON_FOOD]Food');

------------------------------------------------
---Text (ko_KR)
-------------------------------------------------
INSERT INTO Language_ko_KR (Tag, Text) VALUES
('TXT_KEY_BUILDING_BRC_LAB', '육종연구소'),
('TXT_KEY_BUILDING_BRC_LAB_STRATEGY', '육종연구소는 게임 후기 건물로, [ICON_FOOD] 식량과 [ICON_RESERCH]과학을 향상시킵니다. 이 육종연구소를 건설하기 위해서는 도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]연구소[ENDCOLOR]가 있어야 합니다.'),
('TXT_KEY_BUILDING_BRC_LAB_CIVILOPEDIA', '육종연구소는 일반적으로 식물의 유전자 특성을 연구하고 개량하는 과학 연구 기관입니다. 이러한 연구소에서는 유전자 편집, 교배, 유전적 분석과 같은 다양한 방법을 사용하여 높은 수율, 질병 저항성, 더 나은 영양 가치와 같은 원하는 특성을 지닌 식물이나 동물을 개발합니다. 육종연구는 농업, 축산, 식품 공급, 그리고 지속 가능한 발전에 중요한 역할을 합니다. 이 연구소는 대게 과학자들과 연구원들로 구성되어 있으며, 종종 대학, 정부 기관, 또는 민간 기업과 협력하여 연구를 수행합니다.'),
('TXT_KEY_BUILDING_BRC_LAB_HELP', '도시의 농장, 목장, 계단식 농장, 간척지, 재배지의 [ICON_FOOD]식량이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]증가합니다.[NEWLINE][NEWLINE][ICON_FOOD]/[ICON_PRODUCTION]낙후에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.[NEWLINE][NEWLINE][ICON_RES_WHEAT]밀:+2[ICON_FOOD]식량[NEWLINE][ICON_RES_BANANA]바나나:+2[ICON_FOOD]식량[NEWLINE][ICON_RES_RICE]쌀:+2[ICON_FOOD]식량[NEWLINE][ICON_RES_MAIZE]옥수수:+2[ICON_FOOD]식량[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]연구소[ENDCOLOR]가 있어야 건설할 수 있습니다.');


UPDATE Language_en_US 
SET Text = '+1 [ICON_FOOD] Food for each  Farm, Pasture, Polder, Terrace Farm, Plantation, Eco-Commune, Hydroponic Dome on City. [NEWLINE][NEWLINE] -1 [ICON_HAPPINESS_3] Unhappiness from [ICON_FOOD]/[ICON_PRODUCTION] Distress[NEWLINE][NEWLINE][ICON_RES_WHEAT]Wheat:+2[ICON_FOOD]Food[NEWLINE][ICON_RES_BANANA]Banana:+2[ICON_FOOD]Food[NEWLINE][ICON_RES_RICE]Rice:+2[ICON_FOOD]Food[NEWLINE][ICON_RES_MAIZE]Maize:+2[ICON_FOOD]Food.'
WHERE Tag = 'TXT_KEY_BUILDING_BRC_LAB_HELP'AND EXISTS (SELECT * FROM Units WHERE TYPE = 'UNIT_FW_SPACE_COLONIST');

UPDATE Language_ko_KR 
SET Text = '농장, 목장, 계단식 농장, 간척지, 재배지, 친환경마을, 수경재배지구의 [ICON_FOOD]식량이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][ICON_FOOD]/[ICON_PRODUCTION]낙후에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.[NEWLINE][NEWLINE][ICON_RES_WHEAT]밀:+2[ICON_FOOD]식량[NEWLINE][ICON_RES_BANANA]바나나:+2[ICON_FOOD]식량[NEWLINE][ICON_RES_RICE]쌀:+2[ICON_FOOD]식량[NEWLINE][ICON_RES_MAIZE]옥수수:+2[ICON_FOOD]식량[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]연구소[ENDCOLOR]가 있어야 건설할 수 있습니다.'
WHERE Tag = 'TXT_KEY_BUILDING_BRC_LAB_HELP'AND EXISTS (SELECT * FROM Units WHERE TYPE = 'UNIT_FW_SPACE_COLONIST');
