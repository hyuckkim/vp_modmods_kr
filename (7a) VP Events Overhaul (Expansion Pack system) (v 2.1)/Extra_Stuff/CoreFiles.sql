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
