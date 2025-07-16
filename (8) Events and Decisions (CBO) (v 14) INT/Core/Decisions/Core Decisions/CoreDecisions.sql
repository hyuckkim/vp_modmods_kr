--==========================================================================================================================
-- Resources
--==========================================================================================================================
INSERT INTO Resources 
			(Type,						Description,						Civilopedia, 						Help,										ResourceClassType, 		AIStopTradingEra,	ResourceUsage, 	IconString, 			PortraitIndex, 	IconAtlas)
VALUES		('RESOURCE_MAGISTRATES',	'TXT_KEY_RESOURCE_MAGISTRATES',		'TXT_KEY_CIV5_MAGISTRATES_TEXT',	'TXT_KEY_RESOURCE_MAGISTRATES_HELP',		'RESOURCECLASS_RUSH',	'ERA_ANCIENT',		0,				'[ICON_MAGISTRATES]',	3, 				'CORE_DECISIONS_ATLAS');
INSERT INTO Resources 
			(Type,						Description,						Civilopedia, 						Help,										ResourceClassType, 		AIStopTradingEra,	ResourceUsage, 	IconString, 			PortraitIndex, 	IconAtlas)
VALUES		('RESOURCE_MORALITY',	'TXT_KEY_RESOURCE_MORALITY',		'TXT_KEY_CIV5_MORALITY_TEXT',	'TXT_KEY_RESOURCE_MORALITY_HELP',		'RESOURCECLASS_RUSH',	'ERA_ANCIENT',		0,				'[ICON_STAR]',	3, 				'CORE_DECISIONS_ATLAS');
--==========================================================================================================================		
-- CONCEPTS
--==========================================================================================================================
INSERT INTO Concepts	
		(Type, 								Topic,							Description,					Summary,						Advisor,	CivilopediaHeaderType)
VALUES	('CONCEPT_ED_EVENTS',				'TXT_KEY_TOPIC_SOCIALPOLICY',	'TXT_KEY_ED_EVENTS_TITLE',		'TXT_KEY_ED_EVENTS_BODY',		'ECONOMIC',	'HEADER_POLICIES'),
		('CONCEPT_ED_DECISIONS',			'TXT_KEY_TOPIC_SOCIALPOLICY',	'TXT_KEY_ED_DECISIONS_TITLE',	'TXT_KEY_ED_DECISIONS_BODY',	'ECONOMIC',	'HEADER_POLICIES');

INSERT OR REPLACE INTO Language_en_US (Tag, Text)
VALUES
	(
		'TXT_KEY_ED_EVENTS_TITLE',
		'Events'
	),
	(
		'TXT_KEY_ED_EVENTS_BODY',
		'[ICON_ED_EVENTS] Events may randomly occur throughout the course of play. There are a whole range of Events in the game, which can result in positive, negative and mixed outcomes for a player''s country. They take the form of a pop-up notification on the player''s screen, which may present a player with a choice, or may simply inform the player of the consequences and require they acknowledge the Event has occurred.'
	),
	(
		'TXT_KEY_ED_DECISIONS_TITLE',
		'Decisions'
	),
	(
		'TXT_KEY_ED_DECISIONS_BODY',
		'[ICON_ED_DECISIONS] Decisions are a set of choices a nation can make if certain conditions are met. Each Decision has consequences, which can be both positive and negative. A nation never has to take a Decision it is always at the players discretion whether to accept a Decision or not. Some Decisions are nation specific, some are religion specific and some are more generic.'
	);
UPDATE Language_en_US
	SET Text = '+1 [ICON_RES_PAPER] Paper. +10% [ICON_PRODUCTION] Production of Diplomatic Units. Can only be constructed in a Capital. The cost goes up the more cities there are in the empire. [NEWLINE][NEWLINE] +10% of the [ICON_PRODUCTION] Production of the City is added to the current [ICON_PRODUCTION] Production amount every time the city gains a [ICON_CITIZEN] Citizen. Provides 1 [ICON_MAGISTRATES] Magistrates on completion and 1 [ICON_MAGISTRATES] Magistrates when entering a new era.'
	WHERE Tag = 'TXT_KEY_BUILDING_COURT_SCRIBE_HELP';
UPDATE Language_en_US
	SET Text = 'This National Wonder is unique, in that players may build it in their Capital without any other prerequisites. It gives a small production boost when building diplomatic units in the capital, and one [ICON_RES_PAPER] Paper resource. Build this building if you want to secure a city-state ally or two during the first few eras of the game. The additional [ICON_PRODUCTION] Production granted upon City growth makes it important to build this building early on to maximize the boost. Also provides 1 [ICON_MAGISTRATES] Magistrates upon completion, as well as an additional [ICON_MAGISTRATES] Magistrates for each new era.'
	WHERE Tag = 'TXT_KEY_BUILDING_COURT_SCRIBE_STRATEGY';
UPDATE Language_en_US
	SET Text = '+1 [ICON_RESEARCH] Science for every 3 [ICON_CITIZEN] Citizens in the City. Contains 1 slot for a Great Work of Art.[NEWLINE][NEWLINE]When one of the following [COLOR_POSITIVE_TEXT]Historic Events[ENDCOLOR] is completed, receive a [ICON_TOURISM] Tourism boost with all known Civs based on your recent [ICON_CULTURE] Culture output:[NEWLINE][ICON_BULLET] Earn a [ICON_GREAT_PEOPLE] Great Person[NEWLINE][ICON_BULLET] Build a [ICON_GOLDEN_AGE] World Wonder[NEWLINE][ICON_BULLET] Win a [ICON_WAR] War[NEWLINE][ICON_BULLET] Enter a new [ICON_RESEARCH] Era[NEWLINE][NEWLINE][ICON_CONNECTED] Connecting other Cities to the [ICON_CAPITAL] Capital by Road will produce additional [ICON_GOLD] Gold.[NEWLINE][NEWLINE]Provides 2 [ICON_MAGISTRATES] Magistrates at the start of the game.'
	WHERE Tag = 'TXT_KEY_BUILDING_PALACE_HELP';
UPDATE Language_en_US
	SET Text = 'Receive 1 free Great Diplomat when completed. +1 [ICON_RES_PAPER] Paper. +20% [ICON_PRODUCTION] Production of Diplomatic Units. All Diplomatic Units receive the [COLOR_POSITIVE_TEXT]Nobility[ENDCOLOR] Promotion.[NEWLINE][NEWLINE]Provides 1 [ICON_MAGISTRATES] Magistrates when completed.'
	WHERE Tag = 'TXT_KEY_BUILDING_SUMMER_PALACE_HELP';
UPDATE Language_en_US
	SET Text = '+1 [ICON_RES_PAPER] Paper. +20% [ICON_PRODUCTION] Production of Diplomatic Units. All Diplomatic Units receive the [COLOR_POSITIVE_TEXT]Imperial Seal[ENDCOLOR] Promotion. [NEWLINE][NEWLINE]Provides 1 [ICON_MAGISTRATES] Magistrates when completed.'
	WHERE Tag = 'TXT_KEY_BUILDING_FORUM_HELP';
UPDATE Language_en_US
	SET Text = '+1 [ICON_RES_PAPER] Paper. +20% [ICON_PRODUCTION] Production of Diplomatic Units. All Diplomatic Units receive the [COLOR_POSITIVE_TEXT]Literacy[ENDCOLOR] Promotion.[NEWLINE][NEWLINE]Must have built a Chancery in all cities. The cost goes up the more cities there are in the empire.[NEWLINE][NEWLINE]Provides 1 [ICON_MAGISTRATES] Magistrates when completed.'
	WHERE Tag = 'TXT_KEY_BUILDING_PRINTING_PRESS_HELP';
UPDATE Language_en_US
	SET Text = '+2 [ICON_RES_PAPER] Paper. +20% [ICON_PRODUCTION] Production of Diplomatic Units. All Diplomatic Units receive the [COLOR_POSITIVE_TEXT]Diplomatic Immunity[ENDCOLOR] Promotion.[NEWLINE][NEWLINE]Must have built a Wire Service in all cities. The cost goes up the more cities there are in the empire.[NEWLINE][NEWLINE]Provides 1 [ICON_MAGISTRATES] Magistrates when completed.'
	WHERE Tag = 'TXT_KEY_BUILDING_FOREIGN_OFFICE_HELP';
--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================	
INSERT INTO BuildingClasses 	
			(Type, 						 		 			DefaultBuilding, 							Description, 									MaxGlobalInstances, MaxPlayerInstances)
VALUES		('BUILDINGCLASS_DECISION_EFFECT', 				'BUILDING_DECISIONS_WEIGHTSFORMAL', 		'TXT_KEY_DECISIONS_WEIGHTSFORMAL',   			-1,					-1),
			('BUILDINGCLASS_DECISIONS_PUBLICTRANSPORT', 	'BUILDING_DECISIONS_PUBLICTRANSPORT', 		'TXT_KEY_DECISIONS_PUBLICTRANSPORT',    		-1,					-1),			
			('BUILDINGCLASS_DECISIONS_CODEOFLAWS', 			'BUILDING_DECISIONS_CODEOFLAWS', 			'TXT_KEY_DECISIONS_CODEOFLAWS',    				-1,					1);
--==========================================================================================================================	
-- Buildings: Invisible
--==========================================================================================================================
INSERT INTO Buildings 	
			(Type, 						 					BuildingClass, 						Description,									GreatWorkCount, Cost, FaithCost, PrereqTech, 	NeverCapture)
VALUES		('BUILDING_DECISIONS_WEIGHTSFORMAL', 			'BUILDINGCLASS_DECISION_EFFECT',	'TXT_KEY_DECISIONS_WEIGHTSFORMAL',				-1, 			-1,   -1, 		 null,			1),
			('BUILDING_DECISIONS_UNIVERSITYGRANTS', 		'BUILDINGCLASS_DECISION_EFFECT',	'TXT_KEY_DECISIONS_UNIVERSITYGRANTS',			-1, 			-1,   -1, 		 null,			1),
			('BUILDING_DECISIONS_NATIONALISEUTILITIES', 	'BUILDINGCLASS_DECISION_EFFECT',	'TXT_KEY_DECISIONS_NATIONALISEUTILITIES',		-1, 			-1,   -1, 		 null,			1);
UPDATE Buildings
	SET Cost = 150
	WHERE Type = 'BUILDING_COURT_SCRIBE';		
UPDATE Buildings
	SET FreeTechs = 1
	WHERE Type = 'BUILDING_DECISIONS_UNIVERSITYGRANTS';
UPDATE Buildings
	SET FreeBuildingThisCity = 'BUILDINGCLASS_FACTORY'
	WHERE Type = 'BUILDING_DECISIONS_NATIONALISEUTILITIES';
--==========================================================================================================================	
-- Buildings: Regular
--==========================================================================================================================
INSERT INTO Buildings 	
			(Type, 						 					BuildingClass, 								Description,									Civilopedia,												Help,													Strategy,										Cost, PrereqTech, 				NeverCapture,	IconAtlas, 				PortraitIndex)
VALUES		('BUILDING_DECISIONS_CODEOFLAWS', 				'BUILDINGCLASS_DECISIONS_CODEOFLAWS',		'TXT_KEY_DECISIONS_BUILDING_CODEOFLAWS',		'TXT_KEY_DECISIONS_BUILDING_CODEOFLAWS_CIVILOPEDIA',		'TXT_KEY_DECISIONS_BUILDING_CODEOFLAWS_HELP',			null,											-1,   null,						0,				'CORE_DECISIONS_ATLAS',	1),
			('BUILDING_DECISIONS_PUBLICTRANSPORT', 			'BUILDINGCLASS_DECISIONS_PUBLICTRANSPORT',	'TXT_KEY_DECISIONS_BUILDING_PUBLICTRANSPORT',	'TXT_KEY_DECISIONS_BUILDING_PUBLICTRANSPORT_CIVILOPEDIA',	'TXT_KEY_DECISIONS_BUILDING_PUBLICTRANSPORT_HELP',		null,											-1,   'TECH_RADIO',		0,				'CORE_DECISIONS_ATLAS',	4);

UPDATE Buildings
	SET Happiness = 1, GoldenAgeModifier = 20, ConquestProb = 100, NukeImmune = 1
	WHERE Type = 'BUILDING_DECISIONS_CODEOFLAWS';
	
UPDATE Buildings
	SET ConquestProb = 100, NukeImmune = 1
	WHERE Type = 'BUILDING_DECISIONS_PUBLICTRANSPORT';
--==========================================================================================================================	
-- Building_YieldChanges
--==========================================================================================================================		
INSERT INTO Building_YieldChanges 	
			(BuildingType, 									YieldType, 				Yield)
VALUES		('BUILDING_DECISIONS_CODEOFLAWS', 				'YIELD_CULTURE', 		1);
UPDATE Building_YieldChanges
	SET Yield = 2
	WHERE BuildingType = 'BUILDING_COURT_SCRIBE' AND YieldType = 'YIELD_CULTURE';
--==========================================================================================================================	
-- Building_YieldModifiers
--==========================================================================================================================		
INSERT INTO Building_YieldModifiers 	
			(BuildingType, 									YieldType, 				Yield)
VALUES		('BUILDING_DECISIONS_WEIGHTSFORMAL', 			'YIELD_GOLD', 			10),
			('BUILDING_DECISIONS_PUBLICTRANSPORT', 			'YIELD_GOLD', 			10),
			('BUILDING_DECISIONS_PUBLICTRANSPORT', 			'YIELD_PRODUCTION', 	10);
--==========================================================================================================================	
-- Building_BuildingClassYieldChanges
--==========================================================================================================================		
INSERT INTO Building_BuildingClassYieldChanges 	
			(BuildingType, 									BuildingClassType,			YieldType, 				YieldChange)
VALUES		('BUILDING_DECISIONS_NATIONALISEUTILITIES', 	'BUILDINGCLASS_POTTER',	'YIELD_PRODUCTION', 	1);
--==========================================================================================================================	
-- Building_ResourcePerEra
--==========================================================================================================================		
INSERT INTO Building_ResourcePerEra 	
			(BuildingType, 									ResourceType,			Quantity, 	InitialQuantity)
VALUES		('BUILDING_PALACE', 							'RESOURCE_MAGISTRATES',	0, 			2),
			('BUILDING_PALACE', 							'RESOURCE_MORALITY',	0, 			50),
			('BUILDING_COURT_SCRIBE', 						'RESOURCE_MAGISTRATES',	1, 			1),
			('BUILDING_PRINTING_PRESS', 					'RESOURCE_MAGISTRATES',	0, 			1),
			('BUILDING_FOREIGN_OFFICE', 					'RESOURCE_MAGISTRATES',	0, 			1),
			('BUILDING_FORUM', 								'RESOURCE_MAGISTRATES',	0, 			1),
			('BUILDING_SUMMER_PALACE', 						'RESOURCE_MAGISTRATES',	0, 			1);
CREATE Trigger AnyUniquePalaceWorks
AFTER INSERT ON Buildings
WHEN 'BUILDINGCLASS_PALACE'=NEW.BuildingClass AND EXISTS (SELECT Type FROM Buildings WHERE BuildingClass='BUILDINGCLASS_PALACE')
BEGIN
  INSERT INTO Building_ResourcePerEra (BuildingType, ResourceType, Quantity, InitialQuantity)
    VALUES(NEW.Type, 'RESOURCE_MAGISTRATES', 0, 2);
  INSERT INTO Building_ResourcePerEra (BuildingType, ResourceType, Quantity, InitialQuantity)
    VALUES(NEW.Type, 'RESOURCE_MORALITY', 0, 50);
END;
--==========================================================================================================================	
-- Building_Flavors
--==========================================================================================================================
INSERT INTO Building_Flavors 	
			(BuildingType, 									FlavorType, 				Flavor)
VALUES		('BUILDING_COURT_SCRIBE', 						'FLAVOR_GOLD', 				10),
			('BUILDING_COURT_SCRIBE', 						'FLAVOR_SCIENCE', 			10),
			('BUILDING_COURT_SCRIBE', 						'FLAVOR_GROWTH', 			5);
UPDATE Building_Flavors
	SET Flavor = 15
	WHERE BuildingType = 'BUILDING_COURT_SCRIBE' AND FlavorType = 'FLAVOR_CULTURE';
--==========================================================================================================================	
-- Building_Flavors
--==========================================================================================================================
UPDATE Civilization_BuildingClassOverrides
SET BuildingType = null
WHERE BuildingClassType = 'BUILDINGCLASS_COURT_SCRIBE' and CivilizationType = 'CIVILIZATION_BARBARIAN';
UPDATE Civilization_BuildingClassOverrides
SET BuildingType = null
WHERE BuildingClassType = 'BUILDINGCLASS_COURT_SCRIBE' and CivilizationType = 'CIVILIZATION_MINOR';
--==========================================================================================================================
--==========================================================================================================================