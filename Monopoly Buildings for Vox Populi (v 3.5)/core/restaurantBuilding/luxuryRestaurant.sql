

--Building Classes
INSERT INTO BuildingClasses
		(Type,							 DefaultBuilding,		   Description)
VALUES  ('BUILDINGCLASS_IA_RESTAURANT', 'BUILDING_IA_RESTAURANT', 'TXT_KEY_BUILDING_IA_RESTAURANT');


--Building
INSERT INTO Buildings (Type,						  BuildingClass,					 Cost,  HurryCostModifier,  PrereqTech,		  ConquestProb, NeverCapture,  IconAtlas,            PortraitIndex,   Description,						Help,								   Civilopedia,							  Strategy) VALUES
					  ('BUILDING_IA_RESTAURANT',     'BUILDINGCLASS_IA_RESTAURANT',      600,  -20,                'TECH_ECONOMICS',  0,            1,            'ATLAS_IA_MONOPOLY',   8,              'TXT_KEY_BUILDING_IA_RESTAURANT', 'TXT_KEY_BUILDING_IA_RESTAURANT_HELP', 'TXT_KEY_BUILDING_IA_RESTAURANT_TEXT', 'TXT_KEY_BUILDING_IA_RESTAURANT_STRATEGY');


--Monopoly Detection
INSERT INTO Building_ResourceMonopolyOrs
		(BuildingType,				ResourceType)
VALUES  ('BUILDING_IA_RESTAURANT', 'RESOURCE_WINE'),
		('BUILDING_IA_RESTAURANT', 'RESOURCE_COFFEE'),
		('BUILDING_IA_RESTAURANT', 'RESOURCE_TRUFFLES');


-- Building_LocalResourceOrs
INSERT INTO Building_LocalResourceOrs
		(BuildingType,				ResourceType)
VALUES  ('BUILDING_IA_RESTAURANT', 'RESOURCE_WINE'),
		('BUILDING_IA_RESTAURANT', 'RESOURCE_COFFEE'),
		('BUILDING_IA_RESTAURANT', 'RESOURCE_TRUFFLES');


--Building_YieldChanges
INSERT INTO Building_YieldChanges
			(BuildingType,				 YieldType,			Yield)
VALUES		('BUILDING_IA_RESTAURANT',	'YIELD_GOLD',		6);


--Building_YieldChangesPerPop
INSERT INTO Building_YieldChangesPerPop	
		(BuildingType,				YieldType,			Yield) 
VALUES  ('BUILDING_IA_RESTAURANT', 'YIELD_CULTURE', 	33);


-- Culture for Resources
INSERT INTO Building_ResourceYieldChanges
			(BuildingType,				 ResourceType,			 YieldType,					Yield)
VALUES		('BUILDING_IA_RESTAURANT',	'RESOURCE_WINE',		'YIELD_CULTURE',			1),
			('BUILDING_IA_RESTAURANT',	'RESOURCE_COFFEE',		'YIELD_CULTURE',			1),
			('BUILDING_IA_RESTAURANT',	'RESOURCE_TRUFFLES',	'YIELD_CULTURE',			1),
			('BUILDING_IA_RESTAURANT',	'RESOURCE_WINE',		'YIELD_GOLD',				1),
			('BUILDING_IA_RESTAURANT',	'RESOURCE_COFFEE',		'YIELD_GOLD',				1),
			('BUILDING_IA_RESTAURANT',	'RESOURCE_TRUFFLES',	'YIELD_GOLD',				1);

--Flavors
INSERT INTO	Building_Flavors
			(BuildingType,					 FlavorType,			Flavor)
VALUES		('BUILDING_IA_RESTAURANT',		'FLAVOR_CULTURE',		25),
			('BUILDING_IA_RESTAURANT',		'FLAVOR_GOLD',			15);
				

-- Text
INSERT INTO Language_en_US (Tag, Text)
VALUES
('TXT_KEY_BUILDING_IA_RESTAURANT', 'Restaurant'),
('TXT_KEY_BUILDING_IA_RESTAURANT_HELP', '+6 [ICON_GOLD] Gold in the City and +1 [ICON_CULTURE] Culture for every 3 [ICON_CITIZEN] Citizens.[NEWLINE][NEWLINE]Nearby [ICON_RES_WINE] Wine: +1 [ICON_CULTURE] Culture and [ICON_GOLD] Gold.[NEWLINE]Nearby [ICON_RES_COFFEE] Coffee: +1 [ICON_CULTURE] Culture and [ICON_GOLD] Gold.[NEWLINE]Nearby [ICON_RES_TRUFFLES] Truffles: +1 [ICON_CULTURE] Culture and [ICON_GOLD] Gold.[NEWLINE][NEWLINE]Requires a Monopoly on at least one of these: [ICON_RES_WINE] Wine, [ICON_RES_COFFEE] Coffee, or [ICON_RES_TRUFFLES] Truffles.[NEWLINE][NEWLINE]Requires one of these resources to be improved near the City.'),
('TXT_KEY_BUILDING_IA_RESTAURANT_TEXT', 'Restaurants are places that serve prepared food. They often feature a skilled chef that works on the best dishes they can prepare. These restaurants, depending on their quality, can become quite famous and gain popularity across the region or even internationally. There are often high-class food critics that work to review these restaurants and hold them to a high standard. The restaurants often try to give a luxurious experience to the customer, beyond just food.'),
('TXT_KEY_BUILDING_IA_RESTAURANT_STRATEGY', 'The Restaurant boosts your [ICON_GOLD] Gold in the City and provides more [ICON_CULTURE] Culture and [ICON_GOLD] Gold for the Resources it requires. Additionally, it gives [ICON_CULTURE] Culture for every 3 [ICON_CITIZEN] Citizens. Build it if you have a Monopoly on those resources to give a boost to [ICON_GOLD] Gold and [ICON_CULTURE] Culture.');