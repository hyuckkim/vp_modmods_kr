-- written by GAIA using Notepad++
CREATE TABLE IF NOT EXISTS Sapiens_DBUpdates (Name TEXT PRIMARY KEY, Value INTEGER DEFAULT 0);
INSERT OR IGNORE INTO Sapiens_DBUpdates (Name) VALUES ('NEUs_Assyria');
--=======================================================================================================================
-- UNIQUE COMPONENTS
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS GAIA_EU_Config (EU_Civ TEXT NOT NULL, EU_Type TEXT NOT NULL, 
	EU_Name TEXT, EU_Model TEXT, EU_Art TEXT, EU_Member TEXT, EU_NumMembers INTEGER DEFAULT 1, 
	PRIMARY KEY (EU_Civ, EU_Type)
);
INSERT INTO GAIA_EU_Config 
(EU_Civ,			EU_Type,				EU_Model,						EU_NumMembers) VALUES
('_ASSYRIA',		'PIKEMAN',				'Pikeman_Babylon',				12),
('_ASSYRIA',		'ARCHER',				'Archer_Babylon',				12),
('_ASSYRIA',		'SWORDSMAN',			'Swordsman_Babylon',			12),
('_ASSYRIA',		'KNIGHT',				'Knight_Babylon',				5),
('_ASSYRIA',		'WARRIOR',				'Mesopotamic_warrior_tc',		12),
('_ASSYRIA',		'CROSSBOWMAN',			'Longbowman_Babylon',			12);

--=======================================================================================================================
UPDATE Sapiens_DBUpdates SET Value = 1 WHERE Name = 'NEUs_Assyria';
