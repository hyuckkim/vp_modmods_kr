



--Building Classes
INSERT INTO BuildingClasses
		(Type,						DefaultBuilding,	 Description)
VALUES  ('BUILDINGCLASS_IA_LODGE', 'BUILDING_IA_LODGE', 'TXT_KEY_BUILDING_IA_LODGE');


--Building
INSERT INTO Buildings (Type,					 BuildingClass,				   Cost,  HurryCostModifier,  PrereqTech,      ConquestProb, NeverCapture,  IconAtlas,            PortraitIndex,  Description,					Help,							  Civilopedia,						Strategy) VALUES
					  ('BUILDING_IA_LODGE',     'BUILDINGCLASS_IA_LODGE',      300,  -20,                 'TECH_PHYSICS',  0,            1,            'ATLAS_IA_MONOPOLY',   4,              'TXT_KEY_BUILDING_IA_LODGE', 'TXT_KEY_BUILDING_IA_LODGE_HELP', 'TXT_KEY_BUILDING_IA_LODGE_TEXT', 'TXT_KEY_BUILDING_IA_LODGE_STRATEGY');


--Monopoly Detection
INSERT INTO Building_ResourceMonopolyOrs
		(BuildingType,		   ResourceType)
VALUES  ('BUILDING_IA_LODGE', 'RESOURCE_CRAB'),
		('BUILDING_IA_LODGE', 'RESOURCE_FUR'),
		('BUILDING_IA_LODGE', 'RESOURCE_PEARLS');


-- Building_LocalResourceOrs
INSERT INTO Building_LocalResourceOrs
		(BuildingType,		   ResourceType)
VALUES  ('BUILDING_IA_LODGE', 'RESOURCE_CRAB'),
		('BUILDING_IA_LODGE', 'RESOURCE_FUR'),
		('BUILDING_IA_LODGE', 'RESOURCE_PEARLS');


-- Building_ResourceYieldChanges
INSERT INTO Building_ResourceYieldChanges
			(BuildingType,			 ResourceType,			 YieldType,				Yield)
VALUES		('BUILDING_IA_LODGE',	'RESOURCE_CRAB',		'YIELD_GOLD',			1),
			('BUILDING_IA_LODGE',	'RESOURCE_FUR',			'YIELD_GOLD',			1),
			('BUILDING_IA_LODGE',	'RESOURCE_PEARLS',		'YIELD_GOLD',			1);


--Building_YieldChanges
INSERT INTO Building_YieldChanges
			(BuildingType,				 YieldType,				Yield)
VALUES		('BUILDING_IA_LODGE',		'YIELD_CULTURE',		2),
			('BUILDING_IA_LODGE',		'YIELD_GOLD',			3);


--Building_WLTKDYieldMod
INSERT INTO Building_WLTKDYieldMod	
			(BuildingType,			 YieldType,			Yield)
VALUES		('BUILDING_IA_LODGE',	'YIELD_GOLD',		10);


--Flavors
INSERT INTO	Building_Flavors
			(BuildingType,			 FlavorType,			Flavor)
VALUES		('BUILDING_IA_LODGE',	'FLAVOR_CULTURE',		5),
			('BUILDING_IA_LODGE',	'FLAVOR_GOLD',			20);
				

-- Text
INSERT INTO Language_en_US (Tag, Text)
VALUES
('TXT_KEY_BUILDING_IA_LODGE', 'Hunter''s Cabin'),
('TXT_KEY_BUILDING_IA_LODGE_HELP', '+2 [ICON_CULTURE] Culture and +3 [ICON_GOLD] Gold. +10% [ICON_GOLD] Gold during We Love the King Day.[NEWLINE][NEWLINE]Nearby [ICON_RES_CRAB] Crab: +1 [ICON_GOLD] Gold.[NEWLINE]Nearby [ICON_RES_FUR] Furs: +1 [ICON_GOLD] Gold.[NEWLINE]Nearby [ICON_RES_PEARLS] Pearls: +1 [ICON_GOLD] Gold.[NEWLINE][NEWLINE]Requires a Monopoly on at least one of these: [ICON_RES_CRAB] Crab, [ICON_RES_FUR] Furs, or [ICON_RES_PEARLS] Pearls.[NEWLINE][NEWLINE]Requires one of these resources to be improved near the City.'),
('TXT_KEY_BUILDING_IA_LODGE_TEXT', 'Hunter''s Cabins can describe a very wide range of buildings, but generally they are places where hunters go to catch game. In particular situations, these hunters were very important, such as the Fur Trade, where many Beavers, Otters, and other animals were killed for their furs in places such as North America and Siberia. It can also include aquatic hunting. Hunting is still very popular today, with people around the world participating. However, sometimes it is done illegally, such as the illegal Ivory poachers that kill endangered Elephants for their tusks. But however it is done, hunting has been a major factor in human societies, around the world.'),
('TXT_KEY_BUILDING_IA_LODGE_STRATEGY', 'The Hunter''s Cabin slightly increases [ICON_CULTURE] Culture and [ICON_GOLD] Gold in the City, and gives +1 [ICON_GOLD] Gold to [ICON_RES_CRAB] Crab, [ICON_RES_FUR] Furs, and [ICON_RES_PEARLS] Pearls. Additionally, it increases the [ICON_GOLD] Gold output of the City by 10% when the City is in We Love the King Day. Build this if you have a Monopoly on the required resources to boost the [ICON_CULTURE] Culture and [ICON_GOLD] Gold in the city, and try to gain more turns of We Love the King Day by trading resources.');