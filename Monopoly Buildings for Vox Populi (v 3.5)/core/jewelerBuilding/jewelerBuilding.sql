

--Building Classes
INSERT INTO BuildingClasses
		(Type,                        DefaultBuilding,       Description)
VALUES  ('BUILDINGCLASS_IA_JEWELER', 'BUILDING_IA_JEWELER', 'TXT_KEY_BUILDING_IA_JEWELER');


--Building
INSERT INTO Buildings (Type,                      BuildingClass,                   Cost,  HurryCostModifier,  PrereqTech,            ConquestProb, NeverCapture,  IconAtlas,           PortraitIndex,   Description,                   Help,                              Civilopedia,                        Strategy) VALUES
					  ('BUILDING_IA_JEWELER',     'BUILDINGCLASS_IA_JEWELER',      200,  -20,                 'TECH_METAL_CASTING',  0,            1,           'ATLAS_IA_MONOPOLY',   3,              'TXT_KEY_BUILDING_IA_JEWELER', 'TXT_KEY_BUILDING_IA_JEWELER_HELP', 'TXT_KEY_BUILDING_IA_JEWELER_TEXT', 'TXT_KEY_BUILDING_IA_JEWELER_STRATEGY');


--Monopoly Detection
INSERT INTO Building_ResourceMonopolyOrs
		(BuildingType,           ResourceType)
VALUES  ('BUILDING_IA_JEWELER', 'RESOURCE_JADE'),
		('BUILDING_IA_JEWELER', 'RESOURCE_AMBER'),
		('BUILDING_IA_JEWELER', 'RESOURCE_JEWELRY'),
		('BUILDING_IA_JEWELER', 'RESOURCE_LAPIS'),
		('BUILDING_IA_JEWELER', 'RESOURCE_GEMS');


-- Building_LocalResourceOrs
INSERT INTO Building_LocalResourceOrs
		(BuildingType,           ResourceType)
VALUES  ('BUILDING_IA_JEWELER', 'RESOURCE_JADE'),
		('BUILDING_IA_JEWELER', 'RESOURCE_AMBER'),
		('BUILDING_IA_JEWELER', 'RESOURCE_LAPIS'),
		('BUILDING_IA_JEWELER', 'RESOURCE_GEMS');


--Building_YieldChanges
INSERT INTO Building_YieldChanges
			(BuildingType,					YieldType,			Yield)
VALUES		('BUILDING_IA_JEWELER',			'YIELD_GOLD',		2),
			('BUILDING_IA_JEWELER',			'YIELD_CULTURE',	2);


-- Gold for Resources
INSERT INTO Building_ResourceYieldChanges
			(BuildingType,			 ResourceType,			 YieldType,				Yield)
VALUES		('BUILDING_IA_JEWELER',	'RESOURCE_JADE',		'YIELD_GOLD',			1),
			('BUILDING_IA_JEWELER',	'RESOURCE_AMBER',		'YIELD_GOLD',			1),
			('BUILDING_IA_JEWELER',	'RESOURCE_LAPIS',		'YIELD_GOLD',			1),
			('BUILDING_IA_JEWELER',	'RESOURCE_GEMS',		'YIELD_GOLD',			1);


--Flavors
INSERT INTO	Building_Flavors
			(BuildingType,				 FlavorType,			Flavor)
VALUES		('BUILDING_IA_JEWELER',		'FLAVOR_CULTURE',		5),
			('BUILDING_IA_JEWELER',		'FLAVOR_GOLD',			25);
				

-- Text
INSERT INTO Language_en_US (Tag, Text)
VALUES
('TXT_KEY_BUILDING_IA_JEWELER', 'Jeweler'),
('TXT_KEY_BUILDING_IA_JEWELER_HELP', '+2 [ICON_GOLD] Gold and +2 [ICON_CULTURE] Culture in the City.[NEWLINE][NEWLINE]Nearby [ICON_RES_JADE] Jade, [ICON_RES_AMBER] Amber, [ICON_RES_LAPIS] Lapis Lazuli, and [ICON_RES_GEMS] Gems: +1 [ICON_GOLD] Gold, and also +1 [ICON_TOURISM] Tourism at [COLOR_RESEARCH_STORED]Archaeology[ENDCOLOR].[NEWLINE][NEWLINE]Requires a Monopoly on at least one of these: [ICON_RES_JADE] Jade, [ICON_RES_AMBER] Amber, [ICON_RES_JEWELRY] Jewelry, [ICON_RES_LAPIS] Lapis Lazuli, or [ICON_RES_GEMS] Gems.[NEWLINE][NEWLINE]Requires one of these resources to be improved near the City.'),
('TXT_KEY_BUILDING_IA_JEWELER_TEXT', 'A Jeweler is someone who specializes in making and repairing jewelry. Jewelry has been used since ancient times to adorn people, often as a showing of beauty and also potentially to show the wearer''s high status. It is one of the most common artifacts found by archaeologists today, as so many different civilizations over time have made it. It is often made of precious metals inset with different valuable stones. To this day, Jewelery is still made and sold worldwide in many different forms.'),
('TXT_KEY_BUILDING_IA_JEWELER_STRATEGY', 'The Jeweler increases [ICON_GOLD] Gold and [ICON_CULTURE] Culture in the City. It requires a Monopoly on [ICON_RES_JADE] Jade, [ICON_RES_AMBER] Amber, [ICON_RES_JEWELRY] Jewelry, [ICON_RES_LAPIS] Lapis Lazuli, or [ICON_RES_GEMS] Gems; and gives [ICON_GOLD] Gold to those resources. It also gives these resources [ICON_TOURISM] Tourism after researching Archaeology. So it is a good idea if you have a Monopoly on those resources to build it in Cities with those resources to gain [ICON_GOLD] Gold and [ICON_CULTURE] Culture, and later [ICON_TOURISM] Tourism.');