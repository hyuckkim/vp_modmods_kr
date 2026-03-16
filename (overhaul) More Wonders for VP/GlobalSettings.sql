--============================================--
-- MANUAL SETTINGS
--============================================--
/*
World Wonder's restrictions!
0 = No restrictions for building World Wonders (unused; do not set!);
1 = Light restrictions added; sort of what you saw in base VP;
2 = Hard restrictions added - maximum attention and no "aiming" for all WWs within the eyesight (default);
*/

INSERT INTO COMMUNITY	
		(Type,							Value)
VALUES	('MW-SETTING-REQUIREMENT', 		2);
--------------------------------------------------------------
/*
More World Wonders for each Policy tree!
0 = 3 World Wonders per Policy tree;
1 = 4 World Wonders per Policy tree (default);
*/

INSERT INTO COMMUNITY	
		(Type,							Value)
VALUES	('MW-SETTING-POLICIES', 		1);
--------------------------------------------------------------
/*
Maximum Era restriction!
0 = No restriction regarding Eras;
1 = You cannot build World Wonders from 2 Eras behind and further (default);
*/

INSERT INTO COMMUNITY	
		(Type,							Value)
VALUES	('MW-SETTING-MAX-ERA', 			1);
--------------------------------------------------------------
/*
Two versions of new quote recordings for wonders!
0 = Man (default);
1 = Woman;
*/

INSERT INTO COMMUNITY	
		(Type,							Value)
VALUES	('MW-SETTING-SPEECH', 			0);
--------------------------------------------------------------
/*
New HELP texts!
0 = Normal World Wonder tooltip texts made with VP standard (default);
1 = Improved World Wonder tooltip texts;
*/

INSERT INTO COMMUNITY	
		(Type,							Value)
VALUES	('MW-SETTING-HELP', 			0);
--============================================--
-- AUTOMATED COMPATIBILITIES SQL
--============================================--
/* Enlightenment Era */
INSERT INTO BuildingClasses (Type)
SELECT		'BUILDINGCLASS_DUMMY_EE'
WHERE EXISTS (SELECT * FROM Buildings WHERE Type='BUILDING_EE_SUMMER_PALACE');

CREATE TRIGGER IF NOT EXISTS MWCompatibilityEE
AFTER INSERT ON Buildings
WHEN NEW.Type = 'BUILDING_EE_SUMMER_PALACE'
BEGIN
    INSERT INTO BuildingClasses (Type)
	VALUES		('BUILDINGCLASS_DUMMY_EE');
END;

/* Louisiana (Shrimp) */
INSERT INTO BuildingClasses (Type)
SELECT		'BUILDINGCLASS_DUMMY_LOUISIANA'
WHERE EXISTS (SELECT * FROM Resources WHERE Type='RESOURCE_SHRIMP');

CREATE TRIGGER IF NOT EXISTS MWCompatibilityLouisiana
AFTER INSERT ON Resources
WHEN NEW.Type = 'RESOURCE_SHRIMP'
BEGIN
    INSERT INTO BuildingClasses (Type)
	VALUES		('BUILDINGCLASS_DUMMY_LOUISIANA');
END;
--============================================--
-- CUSTOM_MOD_OPTIONS
--============================================--
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_RED_COMBAT';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_RED_COMBAT_RESULT';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_RED_COMBAT_ENDED';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'PROMOTIONS_CROSS_MOUNTAINS';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_UNIT_UPGRADES';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_UNIT_CONVERTS';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'PLOTS_EXTENSIONS';
--============================================--
-- VP FIXES
--============================================--
-- temporary resource fix:
UPDATE Resources SET Hills = 1  WHERE Type = 'RESOURCE_SALT';
UPDATE Resources SET Hills = 1  WHERE Type = 'RESOURCE_COPPER';
UPDATE Resources SET Flatlands = 1  WHERE Type = 'RESOURCE_COAL';
-- additional combat classes for promotions
INSERT OR REPLACE INTO Language_en_US 
			(Tag,										Text) 
VALUES		('TXT_KEY_UNITCOMBAT_SPECIAL_PEOPLE',		'Great People'),
			('TXT_KEY_UNITCOMBAT_SPACESHIP_PART',		'Space Parts'),
			('TXT_KEY_UNITCOMBAT_MISSILE',				'Missiles'),
			('TXT_KEY_UNITCOMBAT_ARCHAEOLOGIST',		'Archaeologists');

INSERT OR REPLACE INTO UnitCombatInfos 
			(Type,							Description) 
VALUES		('UNITCOMBAT_SPECIAL_PEOPLE',	'TXT_KEY_UNITCOMBAT_SPECIAL_PEOPLE'),
			('UNITCOMBAT_SPACESHIP_PART',	'TXT_KEY_UNITCOMBAT_SPACESHIP_PART'),
			('UNITCOMBAT_MISSILE',			'TXT_KEY_UNITCOMBAT_MISSILE'),
			('UNITCOMBAT_ARCHAEOLOGIST',	'TXT_KEY_UNITCOMBAT_ARCHAEOLOGIST');

UPDATE Units SET CombatClass = 'UNITCOMBAT_ARCHAEOLOGIST'	WHERE Type ='UNIT_ARCHAEOLOGIST';
UPDATE Units SET CombatClass = 'UNITCOMBAT_SIEGE'			WHERE Type ='UNIT_ASSYRIAN_SIEGE_TOWER';
UPDATE Units SET CombatClass = 'UNITCOMBAT_SPECIAL_PEOPLE'	WHERE Special ='SPECIALUNIT_PEOPLE';
UPDATE Units SET CombatClass = 'UNITCOMBAT_MISSILE'			WHERE Special ='SPECIALUNIT_MISSILE';
UPDATE Units SET CombatClass = 'UNITCOMBAT_MISSILE'			WHERE Type ='UNIT_ATOMIC_BOMB';
UPDATE Units SET CombatClass = 'UNITCOMBAT_SPACESHIP_PART' WHERE DefaultUnitAI ='UNITAI_SPACESHIP_PART';
--------------------------------------------------------------
--------------------------------------------------------------
