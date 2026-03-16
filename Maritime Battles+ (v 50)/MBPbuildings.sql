/*----------------------------------------------------
-- Coastal Fortress
----------------------------------------------------

INSERT INTO BuildingClasses 
		(Type,								Description,							DefaultBuilding, 				MaxGlobalInstances,	MaxTeamInstances,	MaxPlayerInstances,	ExtraPlayerInstances,	NoLimit,	Monument)
VALUES 	('BUILDINGCLASS_COASTAL_FORTRESS',	'TXT_KEY_BUILDING_COASTAL_FORTRESS',	'BUILDING_COASTAL_FORTRESS',	-1,					-1,					-1,					0,						0,			0		);

INSERT INTO	Building_ClassesNeededInCity
		(BuildingType,						BuildingClassType)
VALUES 	('BUILDING_COASTAL_FORTRESS',		'BUILDINGCLASS_HARBOR');

INSERT INTO Building_Flavors
		(BuildingType,					FlavorType,				Flavor)
VALUES	('BUILDING_COASTAL_FORTRESS',	'FLAVOR_CITY_DEFENSE',	50);

INSERT INTO Buildings
		(Type,							Description,							Civilopedia,									Strategy,										Help,										GoldMaintenance,	Water,	Cost,	HurryCostModifier,	MinAreaSize,	ConquestProb,	Defense,	ExtraCityHitPoints,	BuildingClass,						ArtDefineTag,				PrereqTech,			ObsoleteTech,		PortraitIndex,	WonderSplashAnchor,	IconAtlas,					BorderObstacleWater,	GreatWorkYieldType)
VALUES	('BUILDING_COASTAL_FORTRESS',	'TXT_KEY_BUILDING_COASTAL_FORTRESS',	'TXT_KEY_CIV5_BUILDINGS_COASTAL_FORTRESS_TEXT',	'TXT_KEY_BUILDING_COASTAL_FORTRESS_STRATEGY',	'TXT_KEY_BUILDING_COASTAL_FORTRESS_HELP',	4,					1,		600,	-20,				10,				15,				200,		0,					'BUILDINGCLASS_COASTAL_FORTRESS',	'ART_DEF_BUILDING_GARDEN',	'TECH_METALLURGY',	'TECH_ROCKETRY',	16,				'R,T',				'SMAN_EXOTIC_UNIT_ATLAS',	0,						'YIELD_CULTURE');

INSERT INTO Building_ResourceQuantityRequirements
		(BuildingType,					ResourceType,		Cost)
VALUES	('BUILDING_COASTAL_FORTRESS',	'RESOURCE_IRON',	1);

--EE compatibility
UPDATE Buildings
SET PrereqTech = 'TECH_EE_FORTRESS'
WHERE Type = 'BUILDING_COASTAL_FORTRESS'
AND EXISTS (SELECT Type FROM Technologies WHERE Type = 'TECH_EE_FORTRESS');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_COASTAL_FORTRESS', 'Coastal Fortress');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_COASTAL_FORTRESS_HELP', 'When both city and defender are above 50% health, defender will return fire on attacking ranged enemy naval units if within range.  +2 City defense strength. [NEWLINE][NEWLINE]City must be built on the coast.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_BUILDING_COASTAL_FORTRESS_STRATEGY', 'A coastal fortress is a Renaissance-era building which can only be constructed if you have already built a Harbor in the City. A coastal fortress increases coastal city defense by +2, and allows garrisoned coastal cities to return fire on ranged naval attacks.  Obsolete at rocketry.');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_CIV5_BUILDINGS_COASTAL_FORTRESS_TEXT', 'Coastal fortifcations are measures taken to provide protection against military attack at or near a coastline (or other shoreline). Because an invading enemy normally requires a port or harbour to sustain operations, such defences are usually concentrated around such facilities, or places where such facilities could be constructed.  Coastal fortifications became a significant military consideration as reinforced construction methods improved, and larger calibre artillery was deployed to hinder the advance of heavily gunned navies & maritime invaders.[NEWLINE][NEWLINE]Ancient coastal fortifications, such as the shoreline defensive structures at Ashdod-Yam from the period of Assyrian dominance, or the "Three Fetters" of Greece of the Hellenistic era, were akin to conventionally walled, coastal cities, supported by garrisons and navies.  Rather than the beach assault of modern amphibious operations, seaborne assaults of the classical and medieval age more often took the form of raiders sailing up river and landing well inland of the coast. Prior to the invention of naval artillery that could damage hostile ships, the most that coastal defence could do was act as an early warning system, that could alert local naval or ground forces of the impending attack. For example, in the late Roman period the Saxon Shore was a system of forts at the mouths of navigable rivers, and watch towers along the coast of Britannia and Gaul.[NEWLINE][NEWLINE]Later in Anglo-Saxon Wessex, protection against Viking raiders took the form of:  coast watchers whose duty was to alert the local militia; the navy, which would attempt to intercept the raider''s ships or failing that to destroy them after they had beached (to smaller raiding forces, the threat of losing their ships and thus their way home with their loot, was often enough to force them to curtail their attack); and a system of fortified towns (these burghs were positioned at choke points along navigable rivers to prevent raiders from sailing inland).  The walls around coastal cities, such as at Southampton, had evolved from simpler Norman fortifications by the start of the 13th century. Later, King Edward I was a prolific castle builder and sites such as Conwy Castle, built 1283 to 1289, defended river approaches as well as the surrounding land.  Coastal fortifications in the United Kingdom were continuously developed from this period on through the 2nd World War.[NEWLINE][NEWLINE]China first established formal coastal defences during the early Ming dynasty (14th century) to protect against attacks by pirates. Coastal defences were maintained through both the Ming dynasty and the Qing dynasty that followed, protecting the coast against pirates, and against the Portuguese and other European powers that sought to impose their will on China.  Fortification of the Maltese Islands, begun in the 13th century by their then-Arabian rulers, were reinforced and battle-tested by the Order of St. John against the Ottoman Empire in the 16th century, and continued to be developed right through to the 2nd World War as the British took over control.  The defence of American coasts was a major concern for the United States from the onset of its independence. Prior to the American Revolution, many coastal fortifications already dotted the Atlantic coast, established as protection from pirate raids and foreign incursions. The Revolution led to the construction of many additional fortifications, mostly comprising simple earthworks erected to meet specific threats, but eventually evolving into sophisticated coastal batteries & structures over the following centuries.');
*/