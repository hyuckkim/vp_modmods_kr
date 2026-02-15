


--Building Classes
INSERT INTO BuildingClasses
		(Type,							 DefaultBuilding,		   Description)
VALUES  ('BUILDINGCLASS_IA_APOTHECARY', 'BUILDING_IA_APOTHECARY', 'TXT_KEY_BUILDING_IA_APOTHECARY');


--Building
INSERT INTO Buildings (Type,						  BuildingClass,					 Cost,  HurryCostModifier,  PrereqTech,			   ConquestProb, NeverCapture,  IconAtlas,            PortraitIndex,  Description,						  Help,									Civilopedia,						   Strategy) VALUES
					  ('BUILDING_IA_APOTHECARY',     'BUILDINGCLASS_IA_APOTHECARY',      350,  -20,                 'TECH_CIVIL_SERVICE',  0,            1,            'ATLAS_IA_MONOPOLY',   0,             'TXT_KEY_BUILDING_IA_APOTHECARY', 'TXT_KEY_BUILDING_IA_APOTHECARY_HELP', 'TXT_KEY_BUILDING_IA_APOTHECARY_TEXT', 'TXT_KEY_BUILDING_IA_APOTHECARY_STRATEGY');


--Monopoly Detection
INSERT INTO Building_ResourceMonopolyOrs
		(BuildingType,				ResourceType)
VALUES  ('BUILDING_IA_APOTHECARY', 'RESOURCE_TOBACCO'),
		('BUILDING_IA_APOTHECARY', 'RESOURCE_SALT'),
		('BUILDING_IA_APOTHECARY', 'RESOURCE_CORAL');


-- Building_LocalResourceOrs
INSERT INTO Building_LocalResourceOrs
		(BuildingType,				   ResourceType)
VALUES  ('BUILDING_IA_APOTHECARY', 'RESOURCE_TOBACCO'),
		('BUILDING_IA_APOTHECARY', 'RESOURCE_SALT'),
		('BUILDING_IA_APOTHECARY', 'RESOURCE_CORAL');


-- Building_ResourceYieldChanges
INSERT INTO Building_ResourceYieldChanges
			(BuildingType,				 ResourceType,			 YieldType,					Yield)
VALUES		('BUILDING_IA_APOTHECARY',	'RESOURCE_TOBACCO',		'YIELD_SCIENCE',			1),
			('BUILDING_IA_APOTHECARY',	'RESOURCE_SALT',		'YIELD_SCIENCE',			1),
			('BUILDING_IA_APOTHECARY',	'RESOURCE_CORAL',		'YIELD_SCIENCE',			1);


--Building_YieldFromTech
INSERT INTO Building_YieldFromTech
		(BuildingType,				YieldType,			Yield)
VALUES	('BUILDING_IA_APOTHECARY',	'YIELD_CULTURE',	5);


--Flavors
INSERT INTO	Building_Flavors
			(BuildingType,				FlavorType,				Flavor)
VALUES		('BUILDING_IA_APOTHECARY',	'FLAVOR_CULTURE',		15),
			('BUILDING_IA_APOTHECARY',	'FLAVOR_SCIENCE',		15);
				

-- Text
INSERT INTO Language_en_US (Tag, Text)
VALUES
('TXT_KEY_BUILDING_IA_APOTHECARY', 'Apothecary'),
('TXT_KEY_BUILDING_IA_APOTHECARY_HELP', '+5 [ICON_CULTURE] Culture every time you research a technology, scaling with era.[NEWLINE][NEWLINE]Nearby [ICON_RES_TOBACCO] Tobacco: +1 [ICON_RESEARCH] Science.[NEWLINE]Nearby [ICON_RES_SALT] Salt: +1 [ICON_RESEARCH] Science.[NEWLINE]Nearby [ICON_RES_CORAL] Coral: +1 [ICON_RESEARCH] Science.[NEWLINE][NEWLINE]Requires a Monopoly on at least one of these: [ICON_RES_TOBACCO] Tobacco, [ICON_RES_SALT] Salt, or [ICON_RES_CORAL] Coral.[NEWLINE][NEWLINE]Requires one of these resources to be improved near the City.'),
('TXT_KEY_BUILDING_IA_APOTHECARY_TEXT', 'An Apothecary is a place where Medicine, particularly herbal medicine, is made and dispensed for use by physicians, surgeons, and regular patients. Apothecaries have existed in ancient times, being found in ancient Egypt, Babylon, and China. In medieval times, apothecaries became places with skilled practitioners working in them. However, due to little knowledge of chemistry or biology, the effectiveness of most medicines was dubious. While many did work, nobody knew why, and many did not work but were used anyway. In 17th century England, Apothecaries even controlled the Tobacco trade, for use as Medicine.'),
('TXT_KEY_BUILDING_IA_APOTHECARY_STRATEGY', 'The Apothecary increases the [ICON_RESEARCH] Science of the Resources it requires. Additionally, it gives [ICON_CULTURE] Culture every time you research a technology. Build it if you have a Monopoly on those resources to boost the [ICON_RESEARCH] Science in Cities with those Resources, and research technologies to gain [ICON_CULTURE] Culture.');