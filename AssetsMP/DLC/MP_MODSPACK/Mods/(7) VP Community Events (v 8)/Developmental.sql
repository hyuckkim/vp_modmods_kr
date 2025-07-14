-- WARNING THIS IS VERY DEVELOPMENTAL TAMPERING IS BAD BAD UNLESS YOU KNOW WHAT YOU'RE DOING THEN FEEL FREE TO DO SO.
UPDATE Defines
SET Value = 9
WHERE Name = 'EVENT_MIN_DURATION_BETWEEN';

UPDATE Defines
SET Value = 24
WHERE Name = 'CITY_EVENT_MIN_DURATION_BETWEEN';

INSERT INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn)
SELECT 'CE123_ATLAS', '256', 'cedummy256.dds', '1', '1' UNION ALL
SELECT 'CE123_ATLAS', '128', 'cedummy128.dds', '1', '1' UNION ALL
SELECT 'CE123_ATLAS', '80', 'cedummy80.dds', '1', '1' UNION ALL
SELECT 'CE123_ATLAS', '64', 'cedummy64.dds', '1', '1' UNION ALL
SELECT 'CE123_ATLAS', '45', 'cedummy45.dds', '1', '1';

INSERT INTO COMMUNITY (Type, Value)
VALUES ('COMMUNITY_CE', 1);

CREATE TRIGGER Event_RenaissanceGreatPerson
AFTER INSERT ON EventChoices
BEGIN
	UPDATE EventChoices
	SET RequiredEra = 'ERA_RENAISSANCE'
	WHERE RequiredEra = 'ERA_MEDIEVAL' AND FreeGreatPeople = 1 AND EventDuration = 150;
END;

/*CREATE TRIGGER Buildings_Tourism
AFTER INSERT ON Civilization_BuildingClassOverrides
WHEN EXISTS (SELECT BuildingType FROM Civilization_BuildingClassOverrides WHERE BuildingType = NEW.BuildingType) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value= 1)
BEGIN

	UPDATE Buildings
	SET EventTourism = (SELECT EventTourism FROM Buildings WHERE Type IN (SELECT DefaultBuilding FROM BuildingClasses WHERE Type = NEW.BuildingClassType)),
	    FinishLandTRTourism = (SELECT FinishLandTRTourism FROM Buildings WHERE Type IN (SELECT DefaultBuilding FROM BuildingClasses WHERE Type = NEW.BuildingClassType)),
	    FinishSeaTRTourism = (SELECT FinishSeaTRTourism FROM Buildings WHERE Type IN (SELECT DefaultBuilding FROM BuildingClasses WHERE Type = NEW.BuildingClassType))
	WHERE Type = New.BuildingType;
	
END;
*/