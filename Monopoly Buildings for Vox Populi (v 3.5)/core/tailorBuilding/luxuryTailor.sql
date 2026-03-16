

--Building Classes
INSERT INTO BuildingClasses
		(Type,                       DefaultBuilding,      Description)
VALUES  ('BUILDINGCLASS_IA_TAILOR', 'BUILDING_IA_TAILOR', 'TXT_KEY_BUILDING_IA_TAILOR');


--Building
INSERT INTO Buildings (Type,                      BuildingClass,                 Cost,  HurryCostModifier,  PrereqTech,			    ConquestProb, NeverCapture,  IconAtlas,            PortraitIndex,  Description,                   Help,                              Civilopedia,                        Strategy) VALUES
					  ('BUILDING_IA_TAILOR',     'BUILDINGCLASS_IA_TAILOR',      500,  -20,                 'TECH_PRINTING_PRESS',  0,            1,            'ATLAS_IA_MONOPOLY',   9,              'TXT_KEY_BUILDING_IA_TAILOR', 'TXT_KEY_BUILDING_IA_TAILOR_HELP', 'TXT_KEY_BUILDING_IA_TAILOR_TEXT', 'TXT_KEY_BUILDING_IA_TAILOR_STRATEGY');


--Monopoly Detection
INSERT INTO Building_ResourceMonopolyOrs
		(BuildingType,          ResourceType)
VALUES  ('BUILDING_IA_TAILOR', 'RESOURCE_SILK'),
		('BUILDING_IA_TAILOR', 'RESOURCE_COTTON'),
		('BUILDING_IA_TAILOR', 'RESOURCE_DYE');


-- Building_LocalResourceOrs
INSERT INTO Building_LocalResourceOrs
		(BuildingType,          ResourceType)
VALUES  ('BUILDING_IA_TAILOR', 'RESOURCE_SILK'),
		('BUILDING_IA_TAILOR', 'RESOURCE_COTTON'),
		('BUILDING_IA_TAILOR', 'RESOURCE_DYE');


--Building_YieldChanges
INSERT INTO Building_YieldChanges
			(BuildingType,					YieldType,			Yield)
VALUES		('BUILDING_IA_TAILOR',			'YIELD_GOLD',		2);


INSERT INTO Building_YieldFromYieldPercent
			(BuildingType, 			 YieldIn, 			 YieldOut, 		Value)
VALUES		('BUILDING_IA_TAILOR', 	'YIELD_CULTURE', 	'YIELD_GOLD', 	15);


-- Culture for Resources
INSERT INTO Building_ResourceYieldChanges
			(BuildingType,			 ResourceType,				 YieldType,					Yield)
VALUES		('BUILDING_IA_TAILOR',	'RESOURCE_SILK',			'YIELD_CULTURE',			1),
			('BUILDING_IA_TAILOR',  'RESOURCE_COTTON',			'YIELD_CULTURE',			1),
			('BUILDING_IA_TAILOR',	'RESOURCE_DYE',				'YIELD_CULTURE',			1);

--Flavors
INSERT INTO	Building_Flavors
			(BuildingType,				 FlavorType,			Flavor)
VALUES		('BUILDING_IA_TAILOR',		'FLAVOR_CULTURE',		15),
			('BUILDING_IA_TAILOR',		'FLAVOR_GOLD',			15);
				

-- Text
INSERT INTO Language_en_US (Tag, Text)
VALUES
('TXT_KEY_BUILDING_IA_TAILOR', 'Clothier'),
('TXT_KEY_BUILDING_IA_TAILOR_HELP', '+2 [ICON_GOLD] Gold in the City and 15% of [ICON_CULTURE] Culture is added to the [ICON_GOLD] Gold in the City.[NEWLINE][NEWLINE]Nearby [ICON_RES_SILK] Silk: +1 [ICON_CULTURE] Culture.[NEWLINE]Nearby [ICON_RES_DYE] Dyes: +1 [ICON_CULTURE] Culture.[NEWLINE]Nearby [ICON_RES_COTTON] Cotton: +1 [ICON_CULTURE] Culture.[NEWLINE][NEWLINE]Requires a Monopoly on at least one of these: [ICON_RES_COTTON] Cotton, [ICON_RES_SILK] Silk, or [ICON_RES_DYE] Dyes.[NEWLINE][NEWLINE]Requires one of these resources to be improved near the City.'),
('TXT_KEY_BUILDING_IA_TAILOR_TEXT', 'A Clothier, also called a Tailor, is someone who professionally makes and designs clothing, especially suits and other high-class clothes. First becoming popular in the late 18th century, Clothiers usually fashion clothes fit to the person buying the clothes, making them more exact (and expensive) than traditional clothes. Throughout history, tailoring has evolved, starting with local tailors but now also including distance tailors or traveling tailors. To this day, people use Clothiers to make high end clothes that fit them perfectly.'),
('TXT_KEY_BUILDING_IA_TAILOR_STRATEGY', 'The Clothier boosts the culture of [ICON_RES_COTTON] Cotton, [ICON_RES_SILK] Silk, and [ICON_RES_DYE] Dyes. Additionally, it converts 15% of the [ICON_CULTURE] Culture in the City into [ICON_GOLD] Gold, and slightly increases the [ICON_GOLD] Gold in the City. Build it if you have a Monopoly on those resources to boost the [ICON_GOLD] Gold and [ICON_CULTURE] Culture in Cities with those Resources.');