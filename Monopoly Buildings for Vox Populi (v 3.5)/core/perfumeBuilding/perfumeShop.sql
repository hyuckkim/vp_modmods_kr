

--Building Classes
INSERT INTO BuildingClasses
		(Type,							DefaultBuilding,	     Description)
VALUES  ('BUILDINGCLASS_IA_PERFUMERY', 'BUILDING_IA_PERFUMERY', 'TXT_KEY_BUILDING_IA_PERFUMERY');


--Building
INSERT INTO Buildings (Type,						 BuildingClass,					   DistressFlatReduction,	Cost,	HurryCostModifier,  PrereqTech,			ConquestProb, NeverCapture,		IconAtlas,				PortraitIndex,	Description,						Help,									Civilopedia,							Strategy) VALUES
					  ('BUILDING_IA_PERFUMERY',     'BUILDINGCLASS_IA_PERFUMERY',      1,						500,	-20,                 'TECH_CHEMISTRY',	0,            1,				'ATLAS_IA_MONOPOLY',	7,				'TXT_KEY_BUILDING_IA_PERFUMERY',	'TXT_KEY_BUILDING_IA_PERFUMERY_HELP',	'TXT_KEY_BUILDING_IA_PERFUMERY_TEXT',	'TXT_KEY_BUILDING_IA_PERFUMERY_STRATEGY');


--Monopoly Detection
INSERT INTO Building_ResourceMonopolyOrs
		(BuildingType,			   ResourceType)
VALUES  ('BUILDING_IA_PERFUMERY', 'RESOURCE_PERFUME'),
		('BUILDING_IA_PERFUMERY', 'RESOURCE_WHALE'),
		('BUILDING_IA_PERFUMERY', 'RESOURCE_INCENSE');


-- Building_LocalResourceOrs
INSERT INTO Building_LocalResourceOrs
		(BuildingType,			   ResourceType)
VALUES  ('BUILDING_IA_PERFUMERY', 'RESOURCE_PERFUME'),
		('BUILDING_IA_PERFUMERY', 'RESOURCE_WHALE'),
		('BUILDING_IA_PERFUMERY', 'RESOURCE_INCENSE');


--Building_YieldChanges
INSERT INTO Building_YieldChanges
			(BuildingType,				 YieldType,			Yield)
VALUES		('BUILDING_IA_PERFUMERY',	'YIELD_GOLD',		1),
			('BUILDING_IA_PERFUMERY',	'YIELD_CULTURE',	1);


-- Building_ResourceYieldChanges
INSERT INTO Building_ResourceYieldChanges
			(BuildingType,				 ResourceType,			 YieldType,					Yield)
VALUES		('BUILDING_IA_PERFUMERY',	'RESOURCE_PERFUME',		'YIELD_CULTURE',			1),
			('BUILDING_IA_PERFUMERY',	'RESOURCE_WHALE',		'YIELD_CULTURE',			1),
			('BUILDING_IA_PERFUMERY',	'RESOURCE_INCENSE',		'YIELD_GOLD',				1),
			('BUILDING_IA_PERFUMERY',	'RESOURCE_PERFUME',		'YIELD_GOLD',				1),
			('BUILDING_IA_PERFUMERY',	'RESOURCE_WHALE',		'YIELD_GOLD',				1),
			('BUILDING_IA_PERFUMERY',	'RESOURCE_INCENSE',		'YIELD_GOLD',				1);


--Flavors
INSERT INTO	Building_Flavors
			(BuildingType,				 FlavorType,			Flavor)
VALUES		('BUILDING_IA_PERFUMERY',	'FLAVOR_CULTURE',		10),
			('BUILDING_IA_PERFUMERY',	'FLAVOR_GOLD',			10),
			('BUILDING_IA_PERFUMERY',	'FLAVOR_HAPPINESS',		15);
				

-- Text
INSERT INTO Language_en_US (Tag, Text)
VALUES
('TXT_KEY_BUILDING_IA_PERFUMERY', 'Perfumery'),
('TXT_KEY_BUILDING_IA_PERFUMERY_HELP', '+1 [ICON_GOLD] Gold and +1 [ICON_CULTURE] Culture. -1 [ICON_HAPPINESS_3] Unhappiness from [ICON_FOOD] / [ICON_PRODUCTION] Distress.[NEWLINE][NEWLINE]Nearby [ICON_RES_PERFUME] Perfume: +1 [ICON_CULTURE] Culture and [ICON_GOLD] Gold.[NEWLINE]Nearby [ICON_RES_INCENSE] Incense: +1 [ICON_CULTURE] Culture and [ICON_GOLD] Gold.[NEWLINE]Nearby [ICON_RES_WHALE] Whales: +1 [ICON_CULTURE] Culture and [ICON_GOLD] Gold.[NEWLINE][NEWLINE]Requires a Monopoly on at least one of these: [ICON_RES_PERFUME] Perfume, [ICON_RES_INCENSE] Incense, or [ICON_RES_WHALE] Whales.[NEWLINE][NEWLINE]Requires one of these resources to be improved near the City.'),
('TXT_KEY_BUILDING_IA_PERFUMERY_TEXT', 'Perfume Shops are places where perfume, and other things that smell good, are sold. People buy these products for a variety of reasons, to impress others, to make themselves smell nice, or to apply a nice scent to a room. Perfume and Incense has been used since ancient times, but modern perfumery emerged around the late 19th century, with better understanding of the chemistry and coupounds of perfumery, as well as being able to synthesize chemicals better. Today, a variety of perfumes are sold, with different scents, strengths, longevities, and concentrations.'),
('TXT_KEY_BUILDING_IA_PERFUMERY_STRATEGY', 'The Perfume Shop boosts the [ICON_GOLD] Gold and [ICON_CULTURE] Culture, and gives [ICON_CULTURE] Culture and [ICON_GOLD] Gold to the Resources it requires. Additionally, it decreases [ICON_HAPPINESS_3] Unhappiness from [ICON_FOOD] / [ICON_PRODUCTION] Distress. Build it if you have a Monoply on one of those resources to boost your [ICON_CULTURE] Culture, [ICON_GOLD] Gold and [ICON_HAPPINESS_1] Happiness.');