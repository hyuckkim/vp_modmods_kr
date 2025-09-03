-- written by GAIA using Notepad++
CREATE TABLE IF NOT EXISTS Sapiens_DBUpdates (Name TEXT PRIMARY KEY, Value INTEGER DEFAULT 0);
INSERT OR IGNORE INTO Sapiens_DBUpdates (Name) VALUES ('NEUs_Celts');
--=======================================================================================================================
-- UNIQUE COMPONENTS
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS GAIA_EU_Config (EU_Civ TEXT NOT NULL, EU_Type TEXT NOT NULL, 
	EU_Name TEXT, EU_Model TEXT, EU_Art TEXT, EU_Member TEXT, EU_NumMembers INTEGER DEFAULT 1, 
	PRIMARY KEY (EU_Civ, EU_Type)
);
INSERT INTO GAIA_EU_Config 
(EU_Civ,			EU_Type,				EU_Model,						EU_NumMembers) VALUES
('_CELTS',			'WARRIOR',				'CelticWarrior',				12),
('_CELTS',			'LONGSWORDSMAN',		'wales_longsw1',				12),
('_CELTS',			'SCOUT',				'EuroScout',					6),
('_CELTS',			'SWORDSMAN',			'GaulMerc',						12),
('_CELTS',			'RIFLEMAN',				'celrm1',						12),
('_CELTS',			'CROSSBOWMAN',			NULL,							12);

--=======================================================================================================================
UPDATE Sapiens_DBUpdates SET Value = 1 WHERE Name = 'NEUs_Celts';
