-- written by GAIA using Notepad++
CREATE TABLE IF NOT EXISTS Sapiens_DBUpdates (Name TEXT PRIMARY KEY, Value INTEGER DEFAULT 0);
INSERT OR IGNORE INTO Sapiens_DBUpdates (Name) VALUES ('NEUs_Polynesia');
--=======================================================================================================================
-- UNIQUE COMPONENTS
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS GAIA_EU_Config (EU_Civ TEXT NOT NULL, EU_Type TEXT NOT NULL, 
	EU_Name TEXT, EU_Model TEXT, EU_Art TEXT, EU_Member TEXT, EU_NumMembers INTEGER DEFAULT 1, 
	PRIMARY KEY (EU_Civ, EU_Type)
);
INSERT INTO GAIA_EU_Config 
(EU_Civ,			EU_Type,				EU_Model,						EU_NumMembers) VALUES
('_POLYNESIA',		'COMPOSITE_BOWMAN',		'matatoa',						12),
('_POLYNESIA',		'ARCHER',				'hawaii_ikaika',				12),
('_POLYNESIA',		'SWORDSMAN',			'PolynesianFootman',			12),
('_POLYNESIA',		'PRIVATEER',			'Eia',							1),
('_POLYNESIA',		'WARRIOR',				'Oceanic_warrior',				12),
('_POLYNESIA',		'TRIREME',				NULL,							1);

--=======================================================================================================================
UPDATE Sapiens_DBUpdates SET Value = 1 WHERE Name = 'NEUs_Polynesia';
