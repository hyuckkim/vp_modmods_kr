

--Building Classes
INSERT INTO BuildingClasses
		(Type,								DefaultBuilding,			   Description)
VALUES  ('BUILDINGCLASS_IA_FARMERS_MARKET', 'BUILDING_IA_FARMERS_MARKET', 'TXT_KEY_BUILDING_IA_FARMERS_MARKET');


--Building
INSERT INTO Buildings (Type,							  BuildingClass,					 PovertyFlatReduction,	Cost,	HurryCostModifier,  PrereqTech,          ConquestProb, NeverCapture,  IconAtlas,            PortraitIndex,  Description,						   Help,								      Civilopedia,								 Strategy) VALUES
					  ('BUILDING_IA_FARMERS_MARKET',     'BUILDINGCLASS_IA_FARMERS_MARKET',  1,						600,	-20,                'TECH_NAVIGATION',	 0,            1,            'ATLAS_IA_MONOPOLY',   2,              'TXT_KEY_BUILDING_IA_FARMERS_MARKET', 'TXT_KEY_BUILDING_IA_FARMERS_MARKET_HELP', 'TXT_KEY_BUILDING_IA_FARMERS_MARKET_TEXT', 'TXT_KEY_BUILDING_IA_FARMERS_MARKET_STRATEGY');

--Monopoly Detection
INSERT INTO Building_ResourceMonopolyOrs
		(BuildingType,				    ResourceType)
VALUES	('BUILDING_IA_FARMERS_MARKET', 'RESOURCE_TEA'),
		('BUILDING_IA_FARMERS_MARKET', 'RESOURCE_CITRUS'),
		('BUILDING_IA_FARMERS_MARKET', 'RESOURCE_OLIVE');


-- Building_LocalResourceOrs
INSERT INTO Building_LocalResourceOrs
		(BuildingType,				    ResourceType)
VALUES	('BUILDING_IA_FARMERS_MARKET', 'RESOURCE_TEA'),
		('BUILDING_IA_FARMERS_MARKET', 'RESOURCE_CITRUS'),
		('BUILDING_IA_FARMERS_MARKET', 'RESOURCE_OLIVE');


--Building_YieldChanges
INSERT INTO Building_YieldChanges
			(BuildingType,							 YieldType,			Yield)
VALUES		('BUILDING_IA_FARMERS_MARKET',			'YIELD_GOLD',		3);

-- Building_ResourceYieldChanges
INSERT INTO Building_ResourceYieldChanges
			(BuildingType,					 ResourceType,			 YieldType,				Yield)
VALUES		('BUILDING_IA_FARMERS_MARKET',	'RESOURCE_TEA',			'YIELD_FOOD',			1),
			('BUILDING_IA_FARMERS_MARKET',	'RESOURCE_CITRUS',		'YIELD_FOOD',			1),
			('BUILDING_IA_FARMERS_MARKET',	'RESOURCE_OLIVE',		'YIELD_FOOD',			1),
			('BUILDING_IA_FARMERS_MARKET',	'RESOURCE_TEA',			'YIELD_GOLD',			1),
			('BUILDING_IA_FARMERS_MARKET',	'RESOURCE_CITRUS',		'YIELD_GOLD',			1),
			('BUILDING_IA_FARMERS_MARKET',	'RESOURCE_OLIVE',		'YIELD_GOLD',			1);


--Flavors
INSERT INTO	Building_Flavors
			(BuildingType,						 FlavorType,			Flavor)
VALUES		('BUILDING_IA_FARMERS_MARKET',		'FLAVOR_GROWTH',		30),
			('BUILDING_IA_FARMERS_MARKET',		'FLAVOR_HAPPINESS',		10),
			('BUILDING_IA_FARMERS_MARKET',		'FLAVOR_GOLD',			15);


-- Text
INSERT INTO Language_en_US (Tag, Text)
VALUES
('TXT_KEY_BUILDING_IA_FARMERS_MARKET', 'Farmers'' Market'),
('TXT_KEY_BUILDING_IA_FARMERS_MARKET_HELP', '+3 [ICON_GOLD] Gold in the City, and +1 [ICON_FOOD] Food in the City for every 3 nearby owned farms.[NEWLINE][NEWLINE]-1 [ICON_HAPPINESS_3] Unhappiness from [ICON_GOLD] Poverty.[NEWLINE][NEWLINE]Nearby [ICON_RES_TEA] Tea: +1 [ICON_FOOD] Food and [ICON_GOLD] Gold.[NEWLINE]Nearby [ICON_RES_CITRUS] Citrus: +1 [ICON_FOOD] Food and [ICON_GOLD] Gold.[NEWLINE]Nearby [ICON_RES_OLIVE] Olives: +1 [ICON_FOOD] Food and [ICON_GOLD] Gold.[NEWLINE][NEWLINE]Requires a Monopoly on one of these resources: [ICON_RES_TEA] Tea, [ICON_RES_CITRUS] Citrus, or [ICON_RES_OLIVE] Olives.[NEWLINE][NEWLINE]Requires one of these resources to be improved near the City.'),
('TXT_KEY_BUILDING_IA_FARMERS_MARKET_TEXT', 'Farmers'' Markets are places where farmers can sell their produce directly to consumers. It is often set up as many stands where local produce is shown off and sold. While General Stores and the like offered a wide variety of products from many places, Farmers'' Markets allowed local farmers to sell their produce directly to consumers, boosting the local economy and benefiting the farmers, as they got a much larger share of the profit, not having to split it with the shop or spend it on shipping fees. Additionally, consumers are much more pleased with a fresh product. All these factors have led to the growth of Farmers'' Markets, which continue to sell local products around the world today.'),
('TXT_KEY_BUILDING_IA_FARMERS_MARKET_STRATEGY', 'The Farmers'' Market boosts [ICON_GOLD] Gold in the City and grants [ICON_FOOD] Food and [ICON_GOLD] Gold for nearby [ICON_RES_TEA] Tea, [ICON_RES_CITRUS] Citrus, and [ICON_RES_OLIVE] Olives. Additionally, it gives [ICON_FOOD] Food for every 3 Farms near the City, and reduces [ICON_HAPPINESS_3] Distress. Build it if you have a Monopoly on those resources to get more [ICON_FOOD] Food and [ICON_GOLD] Gold, and to help with Unhappiness.');