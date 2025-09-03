

--Building Classes
INSERT INTO BuildingClasses
		(Type,									DefaultBuilding,			     Description)
VALUES  ('BUILDINGCLASS_IA_ORNAMENT_WORKSHOP', 'BUILDING_IA_ORNAMENT_WORKSHOP', 'TXT_KEY_BUILDING_IA_ORNAMENT_WORKSHOP');


--Building
INSERT INTO Buildings (Type,								 BuildingClass,						   Cost,  HurryCostModifier,  PrereqTech,		   ConquestProb, NeverCapture,  IconAtlas,             PortraitIndex,  Description,								Help,										  Civilopedia,						    	    Strategy) VALUES
					  ('BUILDING_IA_ORNAMENT_WORKSHOP',     'BUILDINGCLASS_IA_ORNAMENT_WORKSHOP',  200,  -20,                 'TECH_ENGINEERING',  0,            1,             'ATLAS_IA_MONOPOLY',   6,              'TXT_KEY_BUILDING_IA_ORNAMENT_WORKSHOP', 'TXT_KEY_BUILDING_IA_ORNAMENT_WORKSHOP_HELP', 'TXT_KEY_BUILDING_IA_ORNAMENT_WORKSHOP_TEXT', 'TXT_KEY_BUILDING_IA_ORNAMENT_WORKSHOP_STRATEGY');


--Monopoly Detection
INSERT INTO Building_ResourceMonopolyOrs
		(BuildingType,					   ResourceType)
VALUES  ('BUILDING_IA_ORNAMENT_WORKSHOP', 'RESOURCE_MARBLE'),
		('BUILDING_IA_ORNAMENT_WORKSHOP', 'RESOURCE_SILVER'),
		('BUILDING_IA_ORNAMENT_WORKSHOP', 'RESOURCE_IVORY'),
		('BUILDING_IA_ORNAMENT_WORKSHOP', 'RESOURCE_GLASS'),
		('BUILDING_IA_ORNAMENT_WORKSHOP', 'RESOURCE_PORCELAIN');


-- Building_LocalResourceOrs
INSERT INTO Building_LocalResourceOrs
		(BuildingType,					   ResourceType)
VALUES  ('BUILDING_IA_ORNAMENT_WORKSHOP', 'RESOURCE_MARBLE'),
		('BUILDING_IA_ORNAMENT_WORKSHOP', 'RESOURCE_SILVER'),
		('BUILDING_IA_ORNAMENT_WORKSHOP', 'RESOURCE_IVORY'),
		('BUILDING_IA_ORNAMENT_WORKSHOP', 'RESOURCE_GLASS'),
		('BUILDING_IA_ORNAMENT_WORKSHOP', 'RESOURCE_PORCELAIN');


-- Building_ResourceYieldChanges
INSERT INTO Building_ResourceYieldChanges
			(BuildingType,						 ResourceType,				 YieldType,				Yield)
VALUES		('BUILDING_IA_ORNAMENT_WORKSHOP',	'RESOURCE_MARBLE',			'YIELD_PRODUCTION',			1),
			('BUILDING_IA_ORNAMENT_WORKSHOP',	'RESOURCE_IVORY',			'YIELD_PRODUCTION',			1),
			('BUILDING_IA_ORNAMENT_WORKSHOP',	'RESOURCE_SILVER',			'YIELD_PRODUCTION',			1);


--Building_YieldChanges
INSERT INTO Building_YieldChanges
			(BuildingType,								YieldType,				Yield)
VALUES		('BUILDING_IA_ORNAMENT_WORKSHOP',			'YIELD_GOLD',			1);



--Building_BuildingClassLocalYieldChanges
INSERT INTO Building_BuildingClassLocalYieldChanges
		(BuildingType,						 BuildingClassType,				YieldType,		   YieldChange)
VALUES	('BUILDING_IA_ORNAMENT_WORKSHOP',	 'BUILDINGCLASS_AMPHITHEATER',	'YIELD_CULTURE',   1),
		('BUILDING_IA_ORNAMENT_WORKSHOP',	 'BUILDINGCLASS_OPERA_HOUSE',	'YIELD_CULTURE',   1),
		('BUILDING_IA_ORNAMENT_WORKSHOP',	 'BUILDINGCLASS_TEMPLE',		'YIELD_CULTURE',   1);


--Flavors
INSERT INTO	Building_Flavors
			(BuildingType,						FlavorType,				Flavor)
VALUES		('BUILDING_IA_ORNAMENT_WORKSHOP',	'FLAVOR_PRODUCTION',	12),
			('BUILDING_IA_ORNAMENT_WORKSHOP',	'FLAVOR_CULTURE',		12),
			('BUILDING_IA_ORNAMENT_WORKSHOP',	'FLAVOR_GOLD',			5);


-- Text
INSERT INTO Language_en_US (Tag, Text)
VALUES
('TXT_KEY_BUILDING_IA_ORNAMENT_WORKSHOP', 'Ornament Workshop'),
('TXT_KEY_BUILDING_IA_ORNAMENT_WORKSHOP_HELP', '+1 [ICON_GOLD] Gold, and +1 [ICON_CULTURE] Culture to Amphitheaters, Opera Houses, and Temples in the City.[NEWLINE][NEWLINE]Nearby [ICON_RES_MARBLE] Marble: +1 [ICON_PRODUCTION] Production.[NEWLINE]Nearby [ICON_RES_SILVER] Silver: +1 [ICON_PRODUCTION] Production.[NEWLINE]Nearby [ICON_RES_IVORY] Ivory: +1 [ICON_PRODUCTION] Production.[NEWLINE][NEWLINE]Requires a Monopoly on at least one of these: [ICON_RES_MARBLE] Marble, [ICON_RES_SILVER] Silver, [ICON_RES_IVORY] Ivory, [ICON_RES_PORCELAIN] Porcelain, or [ICON_RES_GLASS] Glass.[NEWLINE][NEWLINE]Requires one of these resources to be improved near the City.'),
('TXT_KEY_BUILDING_IA_ORNAMENT_WORKSHOP_TEXT', 'Ornament Workshops are places where skillful craftmakers work to create household objects for ordinary people. While they are mostly decorative, they often have some significance to the owner, such as a religious idol, a famous statue, or a family heirloom. These types of objects can be found in almost every region of the world, and artifacts can be found from nearly all time periods. Even today, many personal home ornaments are sold, however they are often made not by a skilled crafter but by a machine. Either way, we can see that for many, many years people have made and crafted these beautiful objects around the globe.'),
('TXT_KEY_BUILDING_IA_ORNAMENT_WORKSHOP_STRATEGY', 'The Ornament Workshop slightly increases the [ICON_GOLD] Gold of the City, and provides [ICON_CULTURE] Culture if you build the required buildings. Additionally, it increases the [ICON_PRODUCTION] Production of [ICON_RES_MARBLE] Marble, [ICON_RES_SILVER] Silver and [ICON_RES_IVORY] Ivory near the city. Build it if you have a Monopoly on [ICON_RES_MARBLE] Marble, [ICON_RES_SILVER] Silver, [ICON_RES_IVORY] Ivory, [ICON_RES_PORCELAIN] Porcelain, or [ICON_RES_GLASS] Glass to boost [ICON_CULTURE] Culture and [ICON_PRODUCTION] Production.');
