


--Building Classes
INSERT INTO BuildingClasses
		(Type,							    DefaultBuilding,		     Description)
VALUES  ('BUILDINGCLASS_IA_LAKE_EXTRACTOR', 'BUILDING_IA_LAKE_EXTRACTOR', 'TXT_KEY_BUILDING_IA_LAKE_EXTRACTOR');


--Building
INSERT INTO Buildings (Type,						     BuildingClass,					       Cost,  HurryCostModifier,   PrereqTech,		   ConquestProb,  IconAtlas,        PortraitIndex,  Description,						  Help,										 Civilopedia,							   Strategy) VALUES
					  ('BUILDING_IA_LAKE_EXTRACTOR',     'BUILDINGCLASS_IA_LAKE_EXTRACTOR',    500,  -20,				  'TECH_CHEMISTRY',    66,           'IA_LAKE_ATLAS',   3,             'TXT_KEY_BUILDING_IA_LAKE_EXTRACTOR', 'TXT_KEY_BUILDING_IA_LAKE_EXTRACTOR_HELP', 'TXT_KEY_BUILDING_IA_LAKE_EXTRACTOR_TEXT', 'TXT_KEY_BUILDING_IA_LAKE_EXTRACTOR_STRATEGY');


-- Building_ResourceYieldChanges
INSERT INTO Building_ResourceYieldChanges
			(BuildingType,					 ResourceType,			     YieldType,				Yield)
VALUES		('BUILDING_IA_LAKE_EXTRACTOR',	'RESOURCE_IA_SALT_LAKE',	'YIELD_PRODUCTION',			2);

			
-- Building_LakePlotYieldChanges
INSERT INTO Building_LakePlotYieldChanges
			(BuildingType,			         YieldType,				Yield)
VALUES		('BUILDING_IA_LAKE_EXTRACTOR',	'YIELD_FOOD',			2),
			('BUILDING_IA_LAKE_EXTRACTOR',	'YIELD_GOLD',			1);


--Building_YieldChanges
INSERT INTO Building_YieldChanges
			(BuildingType,						 YieldType,			Yield)
VALUES		('BUILDING_IA_LAKE_EXTRACTOR',		'YIELD_PRODUCTION',		2),
			('BUILDING_IA_LAKE_EXTRACTOR',		'YIELD_FOOD',			2),
			('BUILDING_IA_LAKE_EXTRACTOR',		'YIELD_GOLD',			3);


--Flavors
INSERT INTO	Building_Flavors
			(BuildingType,					FlavorType,				Flavor)
VALUES		('BUILDING_IA_LAKE_EXTRACTOR',	'FLAVOR_GROWTH',		10),
			('BUILDING_IA_LAKE_EXTRACTOR',	'FLAVOR_PRODUCTION',	15);
				

-- Text
INSERT INTO Language_ko_KR (Tag, Text)
VALUES
('TXT_KEY_BUILDING_IA_LAKE_EXTRACTOR', '염전'),
('TXT_KEY_BUILDING_IA_LAKE_EXTRACTOR_HELP', '[ICON_PRODUCTION] 생산, [ICON_FOOD] 식량 +2[NEWLINE][ICON_GOLD] 골드 +3.[NEWLINE][NEWLINE]호수: [ICON_FOOD] 식량 +2,[ICON_GOLD] 골드 +1.[NEWLINE] [ICON_RES_IA_SALT_LAKE] 염호: [ICON_PRODUCTION] 생산 +2.[NEWLINE][NEWLINE]도시가 호수 근처에 있어야 합니다.'),
('TXT_KEY_BUILDING_IA_LAKE_EXTRACTOR_TEXT', '호수에는 종종 유용한 목적으로 추출할 수 있는 다양한 광물이 포함되어 있습니다. 염전에서 종종 농업, 제조 또는 화학 산업에 사용하기 위해 호수에서 이러한 광물을 추출합니다. 염호는 특히 염화나트륨뿐만 아니라 칼륨(염화칼륨), 브롬, 마그네슘 및 기타 화학 물질을 생산해냅니다. 많은 호수에는 화학 물질을 추출하는 추출장이 있습니다.'),
('TXT_KEY_BUILDING_IA_LAKE_EXTRACTOR_STRATEGY', '염전은 호수의 [ICON_FOOD] 식량과 [ICON_GOLD] 골드를 증가시키고 염호의 [ICON_PRODUCTION] 생산을 증가시킵니다. 호수 근처, 특히 염호 근처 도시에 이 건물을 건설하십시오.');