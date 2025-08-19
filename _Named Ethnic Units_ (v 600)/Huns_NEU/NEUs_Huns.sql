-- written by GAIA using Notepad++
CREATE TABLE IF NOT EXISTS Sapiens_DBUpdates (Name TEXT PRIMARY KEY, Value INTEGER DEFAULT 0);
INSERT OR IGNORE INTO Sapiens_DBUpdates (Name) VALUES ('NEUs_Huns');
--=======================================================================================================================
-- UNIQUE COMPONENTS
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS GAIA_EU_Config (EU_Civ TEXT NOT NULL, EU_Type TEXT NOT NULL, 
	EU_Name TEXT, EU_Model TEXT, EU_Art TEXT, EU_Member TEXT, EU_NumMembers INTEGER DEFAULT 1, 
	PRIMARY KEY (EU_Civ, EU_Type)
);
INSERT INTO GAIA_EU_Config 
(EU_Civ,			EU_Type,				EU_Model,						EU_NumMembers) VALUES
('_HUNS',			'SPEARMAN',				'HunWarrior',					12),
('_HUNS',			'SWORDSMAN',			'HunWarrior2',					12),
('_HUNS',			'HORSEMAN',				'u_cuman_chabani',				5),
('_HUNS',			'KNIGHT',				'u_cuman_mamluk',				5),
('_HUNS',			'LANCER',				'hunhu1',						5),
('_HUNS',			'GREAT_WAR_INFANTRY',	'Persian_WW1',					12);

--=======================================================================================================================
UPDATE Sapiens_DBUpdates SET Value = 1 WHERE Name = 'NEUs_Huns';
