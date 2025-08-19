-- written by GAIA using Notepad++
CREATE TABLE IF NOT EXISTS Sapiens_DBUpdates (Name TEXT PRIMARY KEY, Value INTEGER DEFAULT 0);
INSERT OR IGNORE INTO Sapiens_DBUpdates (Name) VALUES ('NEUs_Iroquois');
--=======================================================================================================================
-- UNIQUE COMPONENTS
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS GAIA_EU_Config (EU_Civ TEXT NOT NULL, EU_Type TEXT NOT NULL, 
	EU_Name TEXT, EU_Model TEXT, EU_Art TEXT, EU_Member TEXT, EU_NumMembers INTEGER DEFAULT 1, 
	PRIMARY KEY (EU_Civ, EU_Type)
);
INSERT INTO GAIA_EU_Config 
(EU_Civ,			EU_Type,				EU_Model,						EU_NumMembers) VALUES
('_IROQUOIS',		'ARCHER',				'civ5_iroco1',					12),
('_IROQUOIS',		'HORSEMAN',				'civ5_irohm3',					5),
('_IROQUOIS',		'SCOUT',				'civ5_irosc1',					6),
('_IROQUOIS',		'MUSKETMAN',			'civ5_iromu1',					12),
('_IROQUOIS',		'SPEARMAN',				'civ5_irosp2',					12),
('_IROQUOIS',		'PIKEMAN',				'civ5_iropi1',					12);

--=======================================================================================================================
UPDATE Sapiens_DBUpdates SET Value = 1 WHERE Name = 'NEUs_Iroquois';
