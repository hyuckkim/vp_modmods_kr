INSERT INTO BuildingClasses 	
			(Type,							DefaultBuilding,		Description)
VALUES		('BUILDINGCLASS_ARCADE',	'BUILDING_ARCADE',	'TXT_KEY_BUILDING_ARCADE');

INSERT INTO	Buildings
		(Type,	Description,	Civilopedia,	Strategy,	
		Help,		GoldMaintenance, Cost, HurryCostModifier, 	MinAreaSize, 	ConquestProb, 	BuildingClass, 			
		ArtDefineTag, 	PrereqTech, 	PortraitIndex, 	IconAtlas, EnhancedYieldTech)
VALUES	
	('BUILDING_ARCADE',	'TXT_KEY_BUILDING_ARCADE', 	'TXT_KEY_BUILDING_ARCADE_TEXT',	'TXT_KEY_BUILDING_ARCADE_STRATEGY',	'TXT_KEY_BUILDING_ARCADE_HELP',	8, 		2250, -20, 		-1, 	80, 		'BUILDINGCLASS_ARCADE', 
	'ART_DEF_BUILDING_MARKET', 	'TECH_COMPUTERS', 	30,				'CORP2_ATLAS', 'TECH_INTERNET');

UPDATE Buildings
SET
	BoredomFlatReduction = 1
WHERE BuildingClass = 'BUILDINGCLASS_ARCADE';

-- flavor
INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_ARCADE', 'YIELD_CULTURE', 2),	
	('BUILDING_ARCADE', 'YIELD_GOLD', 2),
	('BUILDING_ARCADE', 'YIELD_SCIENCE', 2);

INSERT INTO Building_YieldFromTech
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_ARCADE', 'YIELD_CULTURE', 100);

INSERT INTO Building_YieldFromBirth
	(BuildingType, YieldType, Yield, IsEraScaling)
VALUES
	('BUILDING_ARCADE', 'YIELD_SCIENCE', 35, 1);

INSERT INTO Building_TechEnhancedYieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_ARCADE', 'YIELD_GOLD', 8),	
	('BUILDING_ARCADE', 'YIELD_SCIENCE', 8),
	('BUILDING_ARCADE', 'YIELD_CULTURE', 8);

INSERT INTO	 Building_Flavors
		(BuildingType,			FlavorType,	Flavor)
VALUES
	('BUILDING_ARCADE',	'FLAVOR_CULTURE', 40),	
	('BUILDING_ARCADE',	'FLAVOR_GOLD', 20),	
	('BUILDING_ARCADE',	'FLAVOR_SCIENCE', 35);

INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 				BuildingClassType)
VALUES	('BUILDING_ARCADE',	'BUILDINGCLASS_STADIUM');
------------------------------
-- Text
------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES	('TXT_KEY_BUILDING_ARCADE',			'Arcade'),
		('TXT_KEY_BUILDING_ARCADE_TEXT',		'An amusement arcade is a venue where people play arcade games, including arcade video games, pinball machines, electro-mechanical games, redemption games, merchandisers (such as claw cranes), or coin-operated billiards or air hockey tables. In some countries, some types of arcades are also legally permitted to provide gambling machines such as slot machines or pachinko machines. Games are usually housed in cabinets. Video games were introduced in amusement arcades in the late 1970s and were most popular during the golden age of arcade video games, the early 1980s.[NEWLINE][NEWLINE]Originating with the penny arcades of the early 1900s, where simple mechanical devices that were coin-operated were available for amusement. This included the earliest forms of slot machine that now fill much of modern Casino buildings. These later became electro-mechanical and finally fully computerized with titles such as Pac-Man, Space Invaders, and Pong. In the 1990s multiplayer fighting games like Mortal Kombat, as well as sports titles like NFL Blitz rose in popularity. Eventually advances in computer hardware would produce the first at-home consoles, and the popularity of the amusement arcade declined precipitously. Today consoles are almost only seen in dive bars, casinos, and other betting establishments.'),
		('TXT_KEY_BUILDING_ARCADE_STRATEGY',	'The Arcade is built to defend against the Cultural Victory. The building accomplishes this in two ways. Firstly it produces Culture to fight foreign Tourism, and you can boost this by discovering more Technologies, which the Arcade helps toward. Secondly it lowers Unhappiness due to Boredom, which would otherwise increase foreign Tourism by a percentage. Will you hold out long enough to win by other means, or will your people be wearing the blue jeans of the enemy?'),
		('TXT_KEY_BUILDING_ARCADE_HELP',		'Receive 35 [ICON_RESEARCH] Science when a new [ICON_CITIZEN] Citizen is born in the City, scaling with Era. Gain 100 [ICON_CULTURE] Culture when you unlock a new Tech, scaling with Era. +8 [ICON_GOLD] Gold, [ICON_RESEARCH] Science, and [ICON_CULTURE] Culture once [COLOR_CYAN]The Internet[ENDCOLOR] is discovered.[NEWLINE][NEWLINE]-1 [ICON_HAPPINESS_3] Unhappiness from [ICON_CULTURE] Boredom.');
