-- list of civilians
CREATE TABLE IF NOT EXISTS 
COMMUNITY (
    Type                                        text                                        default null,
    Value                                       integer                                     default 0);

UPDATE Units SET Capture = 'UNITCLASS_SETTLER' WHERE Type = 'UNIT_SETTLER';
UPDATE Units SET Capture = 'UNITCLASS_ARCHAEOLOGIST' WHERE Type = 'UNIT_ARCHAEOLOGIST';
UPDATE Units SET Capture = 'UNITCLASS_GREAT_GENERAL' WHERE Type = 'UNIT_GREAT_GENERAL';
UPDATE Units SET Capture = 'UNITCLASS_GREAT_GENERAL' WHERE Type = 'UNIT_MONGOLIAN_KHAN';
UPDATE Units SET Capture = 'UNITCLASS_GREAT_ADMIRAL' WHERE Type = 'UNIT_GREAT_ADMIRAL';
UPDATE Units SET Capture = 'UNITCLASS_GREAT_DIPLOMAT' WHERE Type = 'UNIT_GREAT_DIPLOMAT';
UPDATE Units SET Capture = 'UNITCLASS_ENGINEER' WHERE Type = 'UNIT_ENGINEER';
UPDATE Units SET Capture = 'UNITCLASS_MERCHANT' WHERE Type = 'UNIT_MERCHANT';
UPDATE Units SET Capture = 'UNITCLASS_MERCHANT' WHERE Type = 'UNIT_VENETIAN_MERCHANT';
UPDATE Units SET Capture = 'UNITCLASS_SCIENTIST' WHERE Type = 'UNIT_SCIENTIST';
UPDATE Units SET Capture = 'UNITCLASS_ARTIST' WHERE Type = 'UNIT_ARTIST';
UPDATE Units SET Capture = 'UNITCLASS_MUSICIAN' WHERE Type = 'UNIT_MUSICIAN';
UPDATE Units SET Capture = 'UNITCLASS_WRITER' WHERE Type = 'UNIT_WRITER';
UPDATE Units SET Capture = 'UNITCLASS_INQUISITOR' WHERE Type = 'UNIT_INQUISITOR';
UPDATE Units SET Capture = 'UNITCLASS_MISSIONARY' WHERE Type = 'UNIT_MISSIONARY';
UPDATE Units SET Capture = 'UNITCLASS_PROPHET' WHERE Type = 'UNIT_PROPHET';
UPDATE Units SET Capture = 'UNITCLASS_SS_STASIS_CHAMBER' WHERE Type = 'UNIT_SS_STASIS_CHAMBER';
UPDATE Units SET Capture = 'UNITCLASS_SS_ENGINE' WHERE Type = 'UNIT_SS_ENGINE';
UPDATE Units SET Capture = 'UNITCLASS_SS_COCKPIT' WHERE Type = 'UNIT_SS_COCKPIT';
UPDATE Units SET Capture = 'UNITCLASS_SS_BOOSTER' WHERE Type = 'UNIT_SS_BOOSTER';
UPDATE Units SET Capture = 'UNITCLASS_WORKBOAT' WHERE Type = 'UNIT_WORKBOAT';

/*
VP-CBP compatibility patch!
0 = Disabled disregarding if its detects VP-CBP by many.
1 = Enabled if it detects the VP-CBP by many.
2 = Disabled until it detects something! (Default)
*/

INSERT INTO COMMUNITY	
		(Type,			Value)
VALUES	('CAP-VP-CBP', 	2);

UPDATE COMMUNITY
SET Value = '1'
WHERE Type = 'CAP-VP-CBP' AND EXISTS (SELECT * FROM Units WHERE Type='UNIT_COLONIST') AND NOT EXISTS (SELECT * FROM COMMUNITY WHERE Type='CAP-VP-CBP' AND Value= 0);

UPDATE Units SET Capture = 'UNITCLASS_COLONIST' WHERE Type = 'UNIT_COLONIST' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CAP-VP-CBP' AND Value= 1);
UPDATE Units SET Capture = 'UNITCLASS_PIONEER' WHERE Type = 'UNIT_PIONEER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CAP-VP-CBP' AND Value= 1);

/*
VP-CSD compatibility patch!
0 = Disabled disregarding if its detects VP-CSD by many.
1 = Enabled if it detects the VP-CSD by many.
2 = Disabled until it detects something! (Default)
*/

INSERT INTO COMMUNITY	
		(Type,			Value)
VALUES	('CAP-VP-CSD', 	2);

UPDATE COMMUNITY
SET Value = '1'
WHERE Type = 'CAP-VP-CSD' AND EXISTS (SELECT * FROM Units WHERE Type='UNIT_EMISSARY') AND NOT EXISTS (SELECT * FROM COMMUNITY WHERE Type='CAP-VP-CSD' AND Value= 0);

UPDATE Units SET Capture = 'UNITCLASS_EMISSARY' WHERE Type = 'UNIT_EMISSARY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CAP-VP-CSD' AND Value= 1);
UPDATE Units SET Capture = 'UNITCLASS_ENVOY' WHERE Type = 'UNIT_ENVOY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CAP-VP-CSD' AND Value= 1);
UPDATE Units SET Capture = 'UNITCLASS_DIPLOMAT' WHERE Type = 'UNIT_DIPLOMAT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CAP-VP-CSD' AND Value= 1);
UPDATE Units SET Capture = 'UNITCLASS_AMBASSADOR' WHERE Type = 'UNIT_AMBASSADOR' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CAP-VP-CSD' AND Value= 1);
	
/*
MUCfVP compatibility patch!
0 = Disabled disregarding if its detects MUCfVP by many.
1 = Enabled if it detects the MUCfVP by many.
2 = Disabled until it detects something! (Default)
*/

INSERT INTO COMMUNITY	
		(Type,			Value)
VALUES	('CAP-MUCfVP', 	2);

UPDATE COMMUNITY
SET Value = '1'
WHERE Type = 'CAP-MUCfVP' AND EXISTS (SELECT * FROM Units WHERE Type='UNIT_CARTHAGE_SHOPHET') AND NOT EXISTS (SELECT * FROM COMMUNITY WHERE Type='CAP-MUCfVP' AND Value= 0);

UPDATE Units SET Capture = 'UNITCLASS_GREAT_GENERAL' WHERE Type = 'UNIT_CARTHAGE_SHOPHET' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CAP-MUCfVP' AND Value= 1);
UPDATE Units SET Capture = 'UNITCLASS_GREAT_GENERAL' WHERE Type = 'UNIT_ZULU_INDABA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CAP-MUCfVP' AND Value= 1);

/*
VPEE compatibility patch!
0 = Disabled disregarding if its detects VPEE by Infixo.
1 = Enabled if it detects the VPEE by Infixo.
2 = Disabled until it detects something! (Default)
*/

INSERT INTO COMMUNITY	
		(Type,		Value)
VALUES	('CAP-EE', 	2);

UPDATE COMMUNITY
SET Value = '1'
WHERE Type = 'CAP-EE' AND EXISTS (SELECT * FROM Buildings WHERE Type='BUILDING_EE_BASTION') AND NOT EXISTS (SELECT * FROM COMMUNITY WHERE Type='CAP-EE' AND Value= 0);

UPDATE Units SET Capture = 'UNITCLASS_SETTLER' WHERE Type = 'UNIT_JFD_SETTLER_OCEANIC' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CAP-EE' AND Value= 1);
UPDATE Units SET Capture = 'UNITCLASS_SUPERSETTLER' WHERE Type = 'UNIT_SUPERSETTLER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CAP-EE' AND Value= 1);

/*
Compatibility patch for additional civilizations!
0 = Disabled disregarding if its detects Civilization.
1 = Enabled if it detects Civilization.
2 = Disabled until it detects something! (Default)
*/

INSERT INTO COMMUNITY	
		(Type,			Value)
VALUES	('CAP-CIV-ISR', 2);

UPDATE COMMUNITY
SET Value = '1'
WHERE Type = 'CAP-CIV-ISR' AND EXISTS (SELECT * FROM Units WHERE Type='UNIT_ISRAEL_SHOPHET') AND NOT EXISTS (SELECT * FROM COMMUNITY WHERE Type='CAP-CIV-ISR' AND Value= 0);

UPDATE Units SET Capture = 'UNITCLASS_GREAT_GENERAL' WHERE Type = 'UNIT_ISRAEL_SHOPHET' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CAP-MUCfVP' AND Value= 1);

--==============================================================================================================================================================================--
--==============================================================================================================================================================================--
-- setting countering "Prisoners of War"
UPDATE Units SET WorkRate = '100' WHERE Special = 'SPECIALUNIT_PEOPLE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='CAP-VP-CBP' AND Value= 1);