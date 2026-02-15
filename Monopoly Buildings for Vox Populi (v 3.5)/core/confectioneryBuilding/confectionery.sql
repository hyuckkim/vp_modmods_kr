

--Building Classes
INSERT INTO BuildingClasses
		(Type,								DefaultBuilding,			 Description)
VALUES  ('BUILDINGCLASS_IA_CONFECTIONERY', 'BUILDING_IA_CONFECTIONERY', 'TXT_KEY_BUILDING_IA_CONFECTIONERY');


--Building
INSERT INTO Buildings (Type,							 BuildingClass,						   Cost,  HurryCostModifier,  PrereqTech,		ConquestProb, NeverCapture,	IconAtlas,				PortraitIndex,  Description,						  Help,										Civilopedia,							  Strategy) VALUES
					  ('BUILDING_IA_CONFECTIONERY',     'BUILDINGCLASS_IA_CONFECTIONERY',      500,  -20,                 'TECH_BANKING',	0,            1,			'ATLAS_IA_MONOPOLY',	1,              'TXT_KEY_BUILDING_IA_CONFECTIONERY', 'TXT_KEY_BUILDING_IA_CONFECTIONERY_HELP', 'TXT_KEY_BUILDING_IA_CONFECTIONERY_TEXT', 'TXT_KEY_BUILDING_IA_CONFECTIONERY_STRATEGY');


--Monopoly Detection
INSERT INTO Building_ResourceMonopolyOrs
		(BuildingType,				   ResourceType)
VALUES  ('BUILDING_IA_CONFECTIONERY', 'RESOURCE_SUGAR'),
		('BUILDING_IA_CONFECTIONERY', 'RESOURCE_COCOA'),
		('BUILDING_IA_CONFECTIONERY', 'RESOURCE_SPICES');


-- Building_LocalResourceOrs
INSERT INTO Building_LocalResourceOrs
		(BuildingType,				   ResourceType)
VALUES  ('BUILDING_IA_CONFECTIONERY', 'RESOURCE_SUGAR'),
		('BUILDING_IA_CONFECTIONERY', 'RESOURCE_COCOA'),
		('BUILDING_IA_CONFECTIONERY', 'RESOURCE_SPICES');


--Building_YieldChanges
INSERT INTO Building_YieldChanges
			(BuildingType,						YieldType,			Yield)
VALUES		('BUILDING_IA_CONFECTIONERY',		'YIELD_GOLD',		4);


-- Culture for Resources
INSERT INTO Building_ResourceYieldChanges
			(BuildingType,					 ResourceType,			 YieldType,					Yield)
VALUES		('BUILDING_IA_CONFECTIONERY',	'RESOURCE_SUGAR',		'YIELD_CULTURE',			1),
			('BUILDING_IA_CONFECTIONERY',	'RESOURCE_COCOA',		'YIELD_CULTURE',			1),
			('BUILDING_IA_CONFECTIONERY',	'RESOURCE_SPICES',		'YIELD_CULTURE',			1);


--Building_YieldFromBirth
INSERT INTO Building_YieldFromBirth 	
			(BuildingType,					YieldType,			Yield)
VALUES		('BUILDING_IA_CONFECTIONERY',	'YIELD_CULTURE',	8);


--Flavors
INSERT INTO	Building_Flavors
			(BuildingType,					FlavorType,				Flavor)
VALUES		('BUILDING_IA_CONFECTIONERY',	'FLAVOR_CULTURE',		15),
			('BUILDING_IA_CONFECTIONERY',	'FLAVOR_GOLD',			15);
				

-- Text
INSERT INTO Language_en_US (Tag, Text)
VALUES
('TXT_KEY_BUILDING_IA_CONFECTIONERY', 'Confectioner'),
('TXT_KEY_BUILDING_IA_CONFECTIONERY_HELP', '+4 [ICON_GOLD] Gold in the City. Gain [ICON_CULTURE] Culture whenever a [ICON_CITIZEN] Citizen is born in the City.[NEWLINE][NEWLINE]Nearby [ICON_RES_SUGAR] Sugar: +1 [ICON_CULTURE] Culture.[NEWLINE]Nearby [ICON_RES_COCOA] Cocoa: +1 [ICON_CULTURE] Culture.[NEWLINE]Nearby [ICON_RES_SPICES] Cinnamon: +1 [ICON_CULTURE] Culture.[NEWLINE][NEWLINE]Requires a Monopoly on at least one of these: [ICON_RES_SUGAR] Sugar, [ICON_RES_COCOA] Cocoa, or [ICON_RES_SPICES] Cinnamon.[NEWLINE][NEWLINE]Requires one of these resources to be improved near the City.'),
('TXT_KEY_BUILDING_IA_CONFECTIONERY_TEXT', 'A Confectioner is a place where very sweet candies and other confections are made. These confections come in many different forms, such as chocolates, hard candies, pastries, doughnuts, cookies, cotton candy, and more. Confections have been made since ancient times, originally using honey before sugar was available. During Medieval times, it was first the doctors who used sugar as one of their herbal remedies. But gradually, it became more distinct and the confectioner profession became a separate trade. Today, confections are mass produced for people around the world to enjoy, but people try to be aware of the health risks of consuming too much sugar.'),
('TXT_KEY_BUILDING_IA_CONFECTIONERY_STRATEGY', 'The Confectioner boosts the [ICON_CULTURE] Culture of [ICON_RES_SUGAR] Sugar, [ICON_RES_COCOA] Cocoa, and [ICON_RES_SPICES] Cinnamon. Additionally, it slightly increases the [ICON_GOLD] Gold in the City, and gives [ICON_CULTURE] Culture when a new [ICON_CITIZEN] Citizen is born. Build it if you have a Monopoly on those resources to boost the [ICON_GOLD] Gold and [ICON_CULTURE] Culture in Cities with those Resources.');