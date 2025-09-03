-- written by GAIA using Notepad++
CREATE TABLE IF NOT EXISTS Sapiens_DBUpdates (Name TEXT PRIMARY KEY, Value INTEGER DEFAULT 0);
INSERT OR IGNORE INTO Sapiens_DBUpdates (Name) VALUES ('NEUs_Siam');
--=======================================================================================================================
-- UNIQUE COMPONENTS
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS GAIA_EU_Config (EU_Civ TEXT NOT NULL, EU_Type TEXT NOT NULL, 
	EU_Name TEXT, EU_Model TEXT, EU_Art TEXT, EU_Member TEXT, EU_NumMembers INTEGER DEFAULT 1, 
	PRIMARY KEY (EU_Civ, EU_Type)
);
INSERT INTO GAIA_EU_Config 
(EU_Civ,			EU_Type,				EU_Model,						EU_NumMembers) VALUES
('_SIAM',			'RIFLEMAN',				'civ5_siarm1',					12),
('_SIAM',			'JET_FIGHTER',			'A-7',							2),
('_SIAM',			'ARTILLERY',			'155mmDeBang',					2),
('_SIAM',			'HORSEMAN',				'Horseman_Russia_v2',			5),
('_SIAM',			'MUSKETMAN',			'Siamese_Musketman',			12),
('_SIAM',			'CARABINIER',			'Siamese_Mounted_Arquebus',		5);

--=======================================================================================================================
UPDATE Sapiens_DBUpdates SET Value = 1 WHERE Name = 'NEUs_Siam';
