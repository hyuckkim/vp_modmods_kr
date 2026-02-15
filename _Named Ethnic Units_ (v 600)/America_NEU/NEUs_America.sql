-- written by GAIA using Notepad++
CREATE TABLE IF NOT EXISTS Sapiens_DBUpdates (Name TEXT PRIMARY KEY, Value INTEGER DEFAULT 0);
INSERT OR IGNORE INTO Sapiens_DBUpdates (Name) VALUES ('NEUs_America');
--=======================================================================================================================
-- UNIQUE COMPONENTS
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS GAIA_EU_Config (EU_Civ TEXT NOT NULL, EU_Type TEXT NOT NULL, 
	EU_Name TEXT, EU_Model TEXT, EU_Art TEXT, EU_Member TEXT, EU_NumMembers INTEGER DEFAULT 1, 
	PRIMARY KEY (EU_Civ, EU_Type)
);
INSERT INTO GAIA_EU_Config 
(EU_Civ,			EU_Type,				EU_Model,						EU_NumMembers) VALUES
('_AMERICA',		'MODERN_ARMOR',			'M1Abrams',						3),
('_AMERICA',		'FIGHTER',				'P-51_Mustang',					3),
('_AMERICA',		'JET_FIGHTER',			'F15',							3),
('_AMERICA',		'DESTROYER',			'Fletcher_Class',				1),
('_AMERICA',		'BATTLESHIP',			'Iowa_Class',					1),
('_AMERICA',		'TANK',					'M4A3E8_Sherman_Easy_Eight',	3);

--=======================================================================================================================
UPDATE Sapiens_DBUpdates SET Value = 1 WHERE Name = 'NEUs_America';
