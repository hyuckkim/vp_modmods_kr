-- written by GAIA using Notepad++
CREATE TABLE IF NOT EXISTS Sapiens_DBUpdates (Name TEXT PRIMARY KEY, Value INTEGER DEFAULT 0);
INSERT OR IGNORE INTO Sapiens_DBUpdates (Name) VALUES ('NEUs_Greece');
--=======================================================================================================================
-- UNIQUE COMPONENTS
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS GAIA_EU_Config (EU_Civ TEXT NOT NULL, EU_Type TEXT NOT NULL, 
	EU_Name TEXT, EU_Model TEXT, EU_Art TEXT, EU_Member TEXT, EU_NumMembers INTEGER DEFAULT 1, 
	PRIMARY KEY (EU_Civ, EU_Type)
);
INSERT INTO GAIA_EU_Config 
(EU_Civ,			EU_Type,				EU_Model,						EU_NumMembers) VALUES
('_GREECE',			'SWORDSMAN',			'Swordsman_Greece',				12),
('_GREECE',			'ARCHER',				'Archer_Greece',				12),
('_GREECE',			'COMPOSITE_BOWMAN',		'Composite_Bowman_Greek',		12),
('_GREECE',			'CROSSBOWMAN',			'Longbowman_Greece',			12),
('_GREECE',			'KNIGHT',				'Knight_Greece_v2',				5),
('_GREECE',			'LONGSWORDSMAN',		'Longswordsman_Greece',			12);

--=======================================================================================================================
UPDATE Sapiens_DBUpdates SET Value = 1 WHERE Name = 'NEUs_Greece';
