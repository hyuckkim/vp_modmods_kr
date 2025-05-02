


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
INSERT INTO Language_en_US (Tag, Text)
VALUES
('TXT_KEY_BUILDING_IA_LAKE_EXTRACTOR', 'Lake Mineral Extractor'),
('TXT_KEY_BUILDING_IA_LAKE_EXTRACTOR_HELP', '+2 [ICON_PRODUCTION] Production and [ICON_FOOD] Food, and +3 [ICON_GOLD] Gold. [NEWLINE][NEWLINE]Nearby Lakes: +2 [ICON_FOOD] Food, +1 [ICON_GOLD] Gold.[NEWLINE]Nearby [ICON_RES_IA_SALT_LAKE] Salt Lakes: +2 [ICON_PRODUCTION] Production.[NEWLINE][NEWLINE]Requires a Lake near the City.'),
('TXT_KEY_BUILDING_IA_LAKE_EXTRACTOR_TEXT', 'Lakes often have many different minerals in them that can be extracted for useful purposes. Lake Mineral Extractors extract these minerals from lakes, often for use in agricultural, manufacturing, or chemical industries. Saline Lakes particularly are not only a source of sodium chloride, but also potash (potassium chloride), bromine, magnesium, and other chemicals. Many lakes have such extractors to take the chemicals from the lake.'),
('TXT_KEY_BUILDING_IA_LAKE_EXTRACTOR_STRATEGY', 'The Lake Mineral Extractor boosts the [ICON_FOOD] Food and [ICON_GOLD] Gold of all lakes and increases the [ICON_PRODUCTION] Production of nearby Salt Lakes. Build it if you have lakes nearby, particularly Salt Lakes.');