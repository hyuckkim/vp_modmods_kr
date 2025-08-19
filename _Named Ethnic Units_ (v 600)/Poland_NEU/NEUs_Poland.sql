-- written by GAIA using Notepad++
CREATE TABLE IF NOT EXISTS Sapiens_DBUpdates (Name TEXT PRIMARY KEY, Value INTEGER DEFAULT 0);
INSERT OR IGNORE INTO Sapiens_DBUpdates (Name) VALUES ('NEUs_Poland');
--=======================================================================================================================
-- UNIQUE COMPONENTS
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS GAIA_EU_Config (EU_Civ TEXT NOT NULL, EU_Type TEXT NOT NULL, 
	EU_Name TEXT, EU_Model TEXT, EU_Art TEXT, EU_Member TEXT, EU_NumMembers INTEGER DEFAULT 1, 
	PRIMARY KEY (EU_Civ, EU_Type)
);
INSERT INTO GAIA_EU_Config 
(EU_Civ,			EU_Type,				EU_Model,						EU_NumMembers) VALUES
('_POLAND',			'KNIGHT',				'Vitez',						5),
('_POLAND',			'SWORDSMAN',			'civ5_russm1',					12),
('_POLAND',			'CROSSBOWMAN',			'Crossbowman_Russia',			12),
('_POLAND',			'HEAVYHORSEARCHER',		'Horseman_Viking',				5),
('_POLAND',			'LONGSWORDSMAN',		'Longswordsman_Russia',			12),
('_POLAND',			'TANK',					'10TP',							3),
('_POLAND',			'FIGHTER',				'PZL_P.23_Karas',				2);

--=======================================================================================================================
UPDATE Sapiens_DBUpdates SET Value = 1 WHERE Name = 'NEUs_Poland';
