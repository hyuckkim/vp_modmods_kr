-- written by GAIA using Notepad++
CREATE TABLE IF NOT EXISTS Sapiens_DBUpdates (Name TEXT PRIMARY KEY, Value INTEGER DEFAULT 0);
INSERT OR IGNORE INTO Sapiens_DBUpdates (Name) VALUES ('NEUs_England');
--=======================================================================================================================
-- UNIQUE COMPONENTS
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS GAIA_EU_Config (EU_Civ TEXT NOT NULL, EU_Type TEXT NOT NULL, 
	EU_Name TEXT, EU_Model TEXT, EU_Art TEXT, EU_Member TEXT, EU_NumMembers INTEGER DEFAULT 1, 
	PRIMARY KEY (EU_Civ, EU_Type)
);
INSERT INTO GAIA_EU_Config 
(EU_Civ,			EU_Type,				EU_Model,						EU_NumMembers) VALUES
('_ENGLAND',		'PARATROOPER',			'Paratrooper_UK',				10),
('_ENGLAND',		'MARINE',				'RM_Commando',					10),
('_ENGLAND',		'BATTLESHIP',			'King_George_V_Class',			1),
('_ENGLAND',		'LINEINFANTRY',			'redcoat',						12),
('_ENGLAND',		'RIFLEMAN',				'civ5_engrm1',					12),
('_ENGLAND',		'KNIGHT',				'Knight_England',				5),
('_ENGLAND',		'WWI_BOMBER',			'ShortBomber',					1);

--=======================================================================================================================
UPDATE Sapiens_DBUpdates SET Value = 1 WHERE Name = 'NEUs_England';
