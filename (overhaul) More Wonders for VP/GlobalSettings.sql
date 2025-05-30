--============================================--
-- MANUAL SETTINGS
--============================================--
/*
Two versions of new quote recordings for wonders!
0 = Man (Default);
1 = Woman;
*/

INSERT INTO COMMUNITY	
		(Type,					Value)
VALUES	('MW-SETTING-SPEECH', 	0);
--------------------------------------------------------------
/*
New HELP texts!
0 = Normal World Wonder tooltip texts made with VP standard;
1 = Improved World Wonder tooltip texts. (Default)
*/

INSERT INTO COMMUNITY	
		(Type,					Value)
VALUES	('MW-SETTING-HELP', 	1);
--------------------------------------------------------------
/*
Maximum Era restriction!
0 = No restriction regarding Eras;
1 = You cannot build World Wonders from 2 Eras behind and further (Default);
*/

INSERT INTO COMMUNITY	
		(Type,						Value)
VALUES	('MW-SETTING-MAX-ERA', 		1);
--------------------------------------------------------------
/*
World Wonder's restrictions!
0 = No restrictions for building World Wonders (unused; do not set!);
1 = Light restrictions added; sort of what you saw in base VP;
2 = Hard restrictions added - maximum attention and no "aiming" for all WWs within the eyesight (Default);
*/

INSERT INTO COMMUNITY	
		(Type,							Value)
VALUES	('MW-SETTING-REQUIREMENT', 		2);
--============================================--
-- AUTOMATED COMPATIBILITIES
--============================================--
/*
EE compatibility patch!
0 = Disabled disregarding if its detects EE by Infixo and Padre.
1 = Enabled if it detects the EE by Infixo and Padre.
2 = Disabled until it detects something! (Default)
*/

INSERT INTO COMMUNITY	
		(Type,			Value)
VALUES	('MW-EE', 		0); -- disabled because of outdated EE

UPDATE COMMUNITY
SET Value = '1'
WHERE Type = 'MW-EE' AND EXISTS (SELECT * FROM UnitPromotions WHERE Type='PROMOTION_2HANDER') AND NOT EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value= 0);

/*
Civilizations compatibility patch!
0 = Disabled disregarding if its detects any Civilization.
1 = Enabled if it detects any Civilization.
2 = Disabled until it detects something! (Default)
*/

INSERT INTO COMMUNITY	
		(Type,			Value)
VALUES	('MW-CIV-LOI', 		2);

UPDATE COMMUNITY
SET Value = '1'
WHERE Type = 'MW-CIV-LOI' AND EXISTS (SELECT * FROM Resources WHERE Type='RESOURCE_SHRIMP') AND NOT EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-CIV-LOI' AND Value= 0);
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
