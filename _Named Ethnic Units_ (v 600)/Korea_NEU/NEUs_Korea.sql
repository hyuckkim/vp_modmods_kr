-- written by GAIA using Notepad++
CREATE TABLE IF NOT EXISTS Sapiens_DBUpdates (Name TEXT PRIMARY KEY, Value INTEGER DEFAULT 0);
INSERT OR IGNORE INTO Sapiens_DBUpdates (Name) VALUES ('NEUs_Korea');
--=======================================================================================================================
-- UNIQUE COMPONENTS
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS GAIA_EU_Config (EU_Civ TEXT NOT NULL, EU_Type TEXT NOT NULL, 
	EU_Name TEXT, EU_Model TEXT, EU_Art TEXT, EU_Member TEXT, EU_NumMembers INTEGER DEFAULT 1, 
	PRIMARY KEY (EU_Civ, EU_Type)
);
INSERT INTO GAIA_EU_Config 
(EU_Civ,			EU_Type,				EU_Model,						EU_NumMembers) VALUES
('_KOREA',			'ARCHER',				'Archer_Korea',					12),
('_KOREA',			'HORSEMAN',				'Horseman_Korea',				5),
('_KOREA',			'SPEARMAN',				'Spearman_Korea',				12),
('_KOREA',			'SWORDSMAN',			'Scout_Korea',					12),
('_KOREA',			'CANNON',				'bombardTurk',					1),
('_KOREA',			'JET_FIGHTER',			'F4DKorea',						2);

--=======================================================================================================================
UPDATE Sapiens_DBUpdates SET Value = 1 WHERE Name = 'NEUs_Korea';
