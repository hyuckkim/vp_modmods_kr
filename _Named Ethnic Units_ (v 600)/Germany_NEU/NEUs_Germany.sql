-- written by GAIA using Notepad++
CREATE TABLE IF NOT EXISTS Sapiens_DBUpdates (Name TEXT PRIMARY KEY, Value INTEGER DEFAULT 0);
INSERT OR IGNORE INTO Sapiens_DBUpdates (Name) VALUES ('NEUs_Germany');
--=======================================================================================================================
-- UNIQUE COMPONENTS
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS GAIA_EU_Config (EU_Civ TEXT NOT NULL, EU_Type TEXT NOT NULL, 
	EU_Name TEXT, EU_Model TEXT, EU_Art TEXT, EU_Member TEXT, EU_NumMembers INTEGER DEFAULT 1, 
	PRIMARY KEY (EU_Civ, EU_Type)
);
INSERT INTO GAIA_EU_Config 
(EU_Civ,			EU_Type,				EU_Model,						EU_NumMembers) VALUES
('_GERMANY',		'SKIRMISHER',			'jaeger',						12),
('_GERMANY',		'LINEINFANTRY',			'civ5_gerrm',					12),
('_GERMANY',		'GREAT_WAR_INFANTRY',	'gergw1',						12),
('_GERMANY',		'INFANTRY',				'Infantry_German_v2',			12),
('_GERMANY',		'BATTLESHIP',			'Bismark_Class',				1),
('_GERMANY',		'KNIGHT',				'Knight_German',				5);

--=======================================================================================================================
UPDATE Sapiens_DBUpdates SET Value = 1 WHERE Name = 'NEUs_Germany';
