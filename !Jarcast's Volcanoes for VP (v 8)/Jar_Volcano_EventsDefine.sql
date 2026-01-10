--=======================================================================================================================
-- COMPATIBILITY
--=======================================================================================================================
DELETE FROM CityEvents WHERE Type IN ('CITY_EVENT_VOLCANO','CITY_EVENT_VOLCANO_SPECIAL')
AND EXISTS (SELECT * FROM CityEvents WHERE Type = 'CITY_EVENT_VOLCANO');

CREATE TRIGGER IF NOT EXISTS JarVolcanoDeleteEvent AFTER INSERT ON CityEvents
WHEN NEW.Type='CITY_EVENT_VOLCANO' OR NEW.Type='CITY_EVENT_VOLCANO_SPECIAL'
BEGIN
	DELETE FROM CityEvents WHERE Type= NEW.Type;
END;
--=======================================================================================================================
-- CITY EVENTS
--=======================================================================================================================
INSERT INTO CityEvents(Type) VALUES
('CITY_EVENT_JAR_VOLCANO_1'), ('CITY_EVENT_JAR_VOLCANO_2');

UPDATE CityEvents SET Description= 'TXT_KEY_CITY_EVENT_JAR_VOLCANO_1_DESC', Help= 'TXT_KEY_CITY_EVENT_JAR_VOLCANO_1_HELP',
	EventClass= 'EVENT_CLASS_BAD', NearbyFeature= 'FEATURE_JAR_VOLCANO', EraScaling= 1,
	CityEventArt= 'EventEruption.dds', CityEventAudio= 'AS2D_EVENT_NOTIFICATION_VERY_BAD',
	RandomChance= 12, RandomChanceDelta= 1, EventCooldown= 50, NumChoices= 2, MinimumCityPopulation= 6
WHERE Type IN ('CITY_EVENT_JAR_VOLCANO_1', 'CITY_EVENT_JAR_VOLCANO_2');

-- Heavier eruption
UPDATE CityEvents SET Description= 'TXT_KEY_CITY_EVENT_JAR_VOLCANO_2_DESC', RandomChance= 4, RandomChanceDelta= 0
WHERE Type = 'CITY_EVENT_JAR_VOLCANO_2';

INSERT INTO CityEvent_ParentEvents
(CityEventChoiceType,					CityEventType) VALUES
('CITY_EVENT_JAR_VOLCANO_1_CHOICE_1',	'CITY_EVENT_JAR_VOLCANO_1'),
('CITY_EVENT_JAR_VOLCANO_1_CHOICE_2',	'CITY_EVENT_JAR_VOLCANO_1'),
('CITY_EVENT_JAR_VOLCANO_2_CHOICE_1',	'CITY_EVENT_JAR_VOLCANO_2'),
('CITY_EVENT_JAR_VOLCANO_2_CHOICE_2',	'CITY_EVENT_JAR_VOLCANO_2');

INSERT INTO CityEventChoices
(Type,									Description,										Help) VALUES
('CITY_EVENT_JAR_VOLCANO_1_CHOICE_1',	'TXT_KEY_CITY_EVENT_JAR_VOLCANO_1_CHOICE_1_DESC', 'TXT_KEY_CITY_EVENT_JAR_VOLCANO_1_CHOICE_1_HELP'),
('CITY_EVENT_JAR_VOLCANO_1_CHOICE_2',	'TXT_KEY_CITY_EVENT_JAR_VOLCANO_1_CHOICE_2_DESC', 'TXT_KEY_CITY_EVENT_JAR_VOLCANO_1_CHOICE_2_HELP'),
('CITY_EVENT_JAR_VOLCANO_2_CHOICE_1',	'TXT_KEY_CITY_EVENT_JAR_VOLCANO_1_CHOICE_1_DESC', 'TXT_KEY_CITY_EVENT_JAR_VOLCANO_2_CHOICE_1_HELP'),
('CITY_EVENT_JAR_VOLCANO_2_CHOICE_2',	'TXT_KEY_CITY_EVENT_JAR_VOLCANO_1_CHOICE_2_DESC', 'TXT_KEY_CITY_EVENT_JAR_VOLCANO_1_CHOICE_2_HELP');

UPDATE CityEventChoices SET
	EventChoiceAudio= 'AS2D_EVENT_CHOICE', EventDuration= 30,
	CityWideBuildingDestructionChance = 5, ResistanceTurns= 1
WHERE Type IN ('CITY_EVENT_JAR_VOLCANO_1_CHOICE_1', 'CITY_EVENT_JAR_VOLCANO_1_CHOICE_2',
'CITY_EVENT_JAR_VOLCANO_2_CHOICE_1', 'CITY_EVENT_JAR_VOLCANO_2_CHOICE_2');

UPDATE CityEventChoices SET CityWideBuildingDestructionChance= 15
WHERE Type IN ('CITY_EVENT_JAR_VOLCANO_2_CHOICE_1','CITY_EVENT_JAR_VOLCANO_2_CHOICE_2');

UPDATE CityEventChoices SET RequiredBuildingClass= 'BUILDINGCLASS_VOLCANO_OBSERVATORY'
WHERE Type IN ('CITY_EVENT_JAR_VOLCANO_1_CHOICE_2','CITY_EVENT_JAR_VOLCANO_2_CHOICE_2');

-- Increased Science with a Volcano Observatory
INSERT INTO CityEventChoice_InstantYield
(CityEventChoiceType,					YieldType,		Yield) VALUES
('CITY_EVENT_JAR_VOLCANO_1_CHOICE_1',	'YIELD_SCIENCE',	50),
('CITY_EVENT_JAR_VOLCANO_2_CHOICE_1',	'YIELD_SCIENCE',	50),
('CITY_EVENT_JAR_VOLCANO_1_CHOICE_2',	'YIELD_SCIENCE',	100),
('CITY_EVENT_JAR_VOLCANO_2_CHOICE_2',	'YIELD_SCIENCE',	100);

-- Population loss without Volcano Observatory
INSERT INTO CityEventChoice_EventCostYield
(CityEventChoiceType,					YieldType,			Yield) VALUES
('CITY_EVENT_JAR_VOLCANO_1_CHOICE_1',	'YIELD_POPULATION',	1),
('CITY_EVENT_JAR_VOLCANO_2_CHOICE_1',	'YIELD_POPULATION',	3);

INSERT INTO CityEventChoiceFlavors
(CityEventChoiceType,					FlavorType,		Flavor) VALUES
('CITY_EVENT_JAR_VOLCANO_1_CHOICE_2',	'FLAVOR_GROWTH', 5),
('CITY_EVENT_JAR_VOLCANO_1_CHOICE_2',	'FLAVOR_SCIENCE',25),
('CITY_EVENT_JAR_VOLCANO_2_CHOICE_2',	'FLAVOR_GROWTH', 5),
('CITY_EVENT_JAR_VOLCANO_2_CHOICE_2',	'FLAVOR_SCIENCE',25);
--======================================================================================================================
-- Language_en_US
--======================================================================================================================
INSERT OR REPLACE INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_CITY_EVENT_JAR_VOLCANO_1_DESC', 'Volcano Eruption!'),
('TXT_KEY_CITY_EVENT_JAR_VOLCANO_2_DESC', 'Big Volcano Eruption!'),
('TXT_KEY_CITY_EVENT_JAR_VOLCANO_1_HELP', 'A nearby Volcano erupted. The explosion of lava, ash and lapilli has reached the City and the surrounding countryside!'),
('TXT_KEY_CITY_EVENT_JAR_VOLCANO_1_CHOICE_1_DESC', 'There''s nothing we can do!'),
('TXT_KEY_CITY_EVENT_JAR_VOLCANO_1_CHOICE_1_HELP', '+{2_InstantYield}. The City has lost 1 [ICON_CITIZEN] Population, some Improvements are damaged, and many City buildings are destroyed!'),
('TXT_KEY_CITY_EVENT_JAR_VOLCANO_2_CHOICE_1_HELP', '+{2_InstantYield}. The City has lost 3 [ICON_CITIZEN] Population, some Improvements are damaged, and many City buildings are destroyed!'),
('TXT_KEY_CITY_EVENT_JAR_VOLCANO_1_CHOICE_2_DESC', 'The Volcano Observatory recorded warning signs of the volcanic activity, allowing to alert the population on time!'),
('TXT_KEY_CITY_EVENT_JAR_VOLCANO_1_CHOICE_2_HELP', '+{2_InstantYield}. Citizens were successfully evacuated, but some Improvements are damaged, and many City buildings are destroyed!');
--=======================================================================================================================
--=======================================================================================================================