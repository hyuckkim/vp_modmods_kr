-- written by GAIA using Notepad++
CREATE TABLE IF NOT EXISTS Sapiens_DBUpdates (Name TEXT PRIMARY KEY, Value INTEGER DEFAULT 0);
INSERT OR IGNORE INTO Sapiens_DBUpdates (Name) VALUES ('NEUs_Persia');
--=======================================================================================================================
-- UNIQUE COMPONENTS
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS GAIA_EU_Config (EU_Civ TEXT NOT NULL, EU_Type TEXT NOT NULL, 
	EU_Name TEXT, EU_Model TEXT, EU_Art TEXT, EU_Member TEXT, EU_NumMembers INTEGER DEFAULT 1, 
	PRIMARY KEY (EU_Civ, EU_Type)
);
INSERT INTO GAIA_EU_Config 
(EU_Civ,			EU_Type,				EU_Model,						EU_NumMembers) VALUES
('_PERSIA',			'ARCHER',				'Archer_Persia',				12),
('_PERSIA',			'PIKEMAN',				'Pikeman_Persia',				12),
('_PERSIA',			'RIFLEMAN',				'civ5_perrm',					12),
('_PERSIA',			'SPEARMAN',				'Spearman_Persia',				12),
('_PERSIA',			'LANCER',				'Qizilbash',					5),
('_PERSIA',			'MODERN_ARMOR',			'T72_Iran',						3);

--=======================================================================================================================
UPDATE Sapiens_DBUpdates SET Value = 1 WHERE Name = 'NEUs_Persia';
