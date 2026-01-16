
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_GREAT_PEOPLE';

UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_PLOT';

UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'BUGFIX_DUMMY_POLICIES';

CREATE TABLE IF NOT EXISTS 
CDDummies(
	ID  	integer 	primary key autoincrement,
	PolicyType 	text		default null,
	CultureType 	text		default null);

-- this needs to match the order of the icon atlas 
INSERT INTO CDDummies
		(PolicyType, CultureType)
VALUES		
		('POLICY_CD_ABORIGINAL', 'CULTURE_JFD_ABORIGINAL'),
		('POLICY_CD_AMAZONIAN', 'CULTURE_JFD_AMAZONIAN'),
		('POLICY_CD_ANDEAN', 'CULTURE_JFD_ANDEAN'),
		('POLICY_CD_PATAGONIAN', 'CULTURE_CD_PATAGONIAN'),
		('POLICY_CD_BANTU', 'CULTURE_JFD_BANTU'),
		('POLICY_CD_BHARATA', 'CULTURE_JFD_BHARATA'),
		('POLICY_CD_CENTRAL', 'CULTURE_JFD_CENTRAL'),
		('POLICY_CD_CENTRAL_AFRICAN', 'CULTURE_JFD_CENTRAL_AFRICAN'),
		('POLICY_CD_CLASSICAL', 'CULTURE_JFD_CLASSICAL'),
		('POLICY_CD_COLONIAL', 'CULTURE_JFD_COLONIAL'),
		('POLICY_CD_EASTERN', 'CULTURE_JFD_EASTERN'),
		('POLICY_CD_EAST_AFRICAN', 'CULTURE_JFD_EAST_AFRICAN'),
		('POLICY_CD_EAST_INDIES', 'CULTURE_JFD_EAST_INDIES'),
		('POLICY_CD_FAR_EASTERN', 'CULTURE_JFD_FAR_EASTERN'),
		('POLICY_CD_GREAT_PLAINS', 'CULTURE_JFD_GREAT_PLAINS'),
		('POLICY_CD_HIMALAYAN', 'CULTURE_JFD_HIMALAYAN'),
		('POLICY_CD_INDOCHINA', 'CULTURE_JFD_INDOCHINA'),
		('POLICY_CD_LEVANTINE', 'CULTURE_JFD_LEVANTINE'),
		('POLICY_CD_MESOAMERICAN', 'CULTURE_JFD_MESOAMERICAN'),
		('POLICY_CD_MESOPOTAMIC', 'CULTURE_JFD_MESOPOTAMIC'),
		('POLICY_CD_MID_EASTERN', 'CULTURE_JFD_MID_EASTERN'),
		('POLICY_CD_CELTIC', 'CULTURE_CD_CELTIC'),
		('POLICY_CD_NORTHERN', 'CULTURE_JFD_NORTHERN'),
		('POLICY_CD_OCEANIC', 'CULTURE_JFD_OCEANIC'),
		('POLICY_CD_PACIFIC', 'CULTURE_JFD_PACIFIC'),
		('POLICY_CD_POLAR', 'CULTURE_JFD_POLAR'),
		('POLICY_CD_SOUTHERN', 'CULTURE_JFD_SOUTHERN'),
		('POLICY_CD_STEPPE', 'CULTURE_JFD_STEPPE'),
		('POLICY_CD_WEST_AFRICAN', 'CULTURE_JFD_WEST_AFRICAN'),
		('POLICY_CD_WESTERN', 'CULTURE_JFD_WESTERN'),
		('POLICY_CD_WOODLANDS', 'CULTURE_JFD_WOODLANDS');

INSERT INTO Policies
	(Type, Description, IsDummy)
SELECT
	PolicyType, 'TXT_KEY_PLACEHOLDER', 1
FROM CDDummies;

INSERT INTO Language_en_US
	(Tag, Text)
VALUES
	('TXT_KEY_PLACEHOLDER', 'a particular Cultural Grouping');

UPDATE Buildings
SET PolicyType = (
    SELECT PolicyType FROM CDDummies
    WHERE CDDummies.ID = Buildings.PortraitIndex + 1
)
WHERE IconAtlas = 'CD_ECONOMIC_ATLAS';

UPDATE Units
SET PolicyType = (
    SELECT PolicyType FROM CDDummies
    WHERE CDDummies.ID = Units.PortraitIndex + 1
)
WHERE IconAtlas = 'CD_ECONOMIC_ATLAS';

UPDATE Units
SET PolicyType = (
    SELECT PolicyType FROM CDDummies
    WHERE CDDummies.ID = Units.PortraitIndex + 1
)
WHERE IconAtlas = 'CD_MILITARY_ATLAS';

-- =================
-- set civ overrides
-- =================
INSERT INTO Civilization_UnitClassOverrides
	(CivilizationType, UnitClassType, UnitType)
SELECT
	c.CivilizationType, b.Class, b.Type
FROM Civilization_JFD_CultureTypes c, Units b, CDDummies d
WHERE c.CultureType = d.CultureType AND d.PolicyType = b.PolicyType AND 
b.IconAtlas IN ('CD_ECONOMIC_ATLAS', 'CD_MILITARY_ATLAS');

CREATE TRIGGER CDDummyOverrideUnits
AFTER INSERT ON Civilization_JFD_CultureTypes
BEGIN
	INSERT INTO Civilization_UnitClassOverrides
		(CivilizationType, UnitClassType, UnitType)
	SELECT
		NEW.CivilizationType, b.Class, b.Type
	FROM Units b, CDDummies d
	WHERE 
	  (CASE
		WHEN NEW.CivilizationType = 'CIVILIZATION_CL_NIGERIA' THEN 'CULTURE_JFD_CENTRAL_AFRICAN'
		WHEN NEW.CivilizationType = 'CIVILIZATION_ANCIENT_LIBYA_MOD' THEN 'CULTURE_JFD_WEST_AFRICAN'
		WHEN NEW.CultureType = 'CULTURE_JFD_LEVANTINE' THEN 'CULTURE_JFD_MESOPOTAMIC'
		ELSE NEW.CultureType 
 	  END) = d.CultureType 
	AND d.PolicyType = b.PolicyType AND 
	b.IconAtlas IN ('CD_ECONOMIC_ATLAS', 'CD_MILITARY_ATLAS');

	UPDATE Civilization_JFD_CultureTypes 
	SET CultureType = 'CULTURE_JFD_CENTRAL_AFRICAN'
	WHERE CivilizationType IN ('CIVILIZATION_CL_NIGERIA');

	UPDATE Civilization_JFD_CultureTypes 
	SET CultureType = 'CULTURE_JFD_WEST_AFRICAN'
	WHERE CivilizationType IN ('CIVILIZATION_ANCIENT_LIBYA_MOD');

	-- need some hardcoding for warriors due to the starting units issue
	INSERT INTO Civilization_UnitClassOverrides
		(CivilizationType, UnitClassType, UnitType)
	SELECT
		NEW.CivilizationType, 'UNITCLASS_WARRIOR', 'UNIT_CD_SLAGANZ'
	WHERE NEW.CultureType = 'CULTURE_JFD_CENTRAL';

	INSERT INTO Civilization_UnitClassOverrides
		(CivilizationType, UnitClassType, UnitType)
	SELECT
		NEW.CivilizationType, 'UNITCLASS_WARRIOR', 'UNIT_CD_AGIRU'
	WHERE NEW.CultureType = 'CULTURE_JFD_EAST_AFRICAN';
END;

INSERT INTO Civilization_BuildingClassOverrides
	(CivilizationType, BuildingClassType, BuildingType)
SELECT
	c.CivilizationType, b.BuildingClass, b.Type
FROM Civilization_JFD_CultureTypes c, Buildings b, CDDummies d
WHERE c.CultureType = d.CultureType AND d.PolicyType = b.PolicyType AND 
b.IconAtlas = 'CD_ECONOMIC_ATLAS';

CREATE TRIGGER CDDummyOverrideBuildings
AFTER INSERT ON Civilization_JFD_CultureTypes
BEGIN	
	INSERT INTO Civilization_BuildingClassOverrides
		(CivilizationType, BuildingClassType, BuildingType)
	SELECT
		NEW.CivilizationType, b.BuildingClass, b.Type
	FROM Buildings b, CDDummies d
	WHERE NEW.CultureType = d.CultureType AND d.PolicyType = b.PolicyType AND 
	b.IconAtlas = 'CD_ECONOMIC_ATLAS';
END;
