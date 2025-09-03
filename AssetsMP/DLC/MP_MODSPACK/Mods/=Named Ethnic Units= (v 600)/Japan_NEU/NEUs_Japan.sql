-- written by GAIA using Notepad++
CREATE TABLE IF NOT EXISTS Sapiens_DBUpdates (Name TEXT PRIMARY KEY, Value INTEGER DEFAULT 0);
INSERT OR IGNORE INTO Sapiens_DBUpdates (Name) VALUES ('NEUs_Japan');
--=======================================================================================================================
-- UNIQUE COMPONENTS
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS GAIA_EU_Config (EU_Civ TEXT NOT NULL, EU_Type TEXT NOT NULL, 
	EU_Name TEXT, EU_Model TEXT, EU_Art TEXT, EU_Member TEXT, EU_NumMembers INTEGER DEFAULT 1, 
	PRIMARY KEY (EU_Civ, EU_Type)
);
INSERT INTO GAIA_EU_Config 
(EU_Civ,			EU_Type,				EU_Model,						EU_NumMembers) VALUES
('_JAPAN',			'SWORDSMAN',			'Scout_Japan',					12),
('_JAPAN',			'INFANTRY',				'Infantry_Japan_v3',			12),
('_JAPAN',			'HORSEMAN',				'Horseman_Japan',				5),
('_JAPAN',			'KNIGHT',				'Knight_Japan',					5),
('_JAPAN',			'CROSSBOWMAN',			'Longbowman_Japan',				12),
('_JAPAN',			'PIKEMAN',				'Spearman_Japan',				12);

--=======================================================================================================================
UPDATE Sapiens_DBUpdates SET Value = 1 WHERE Name = 'NEUs_Japan';
