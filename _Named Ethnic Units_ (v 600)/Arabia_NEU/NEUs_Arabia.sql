-- written by GAIA using Notepad++
CREATE TABLE IF NOT EXISTS Sapiens_DBUpdates (Name TEXT PRIMARY KEY, Value INTEGER DEFAULT 0);
INSERT OR IGNORE INTO Sapiens_DBUpdates (Name) VALUES ('NEUs_Arabia');
--=======================================================================================================================
-- UNIQUE COMPONENTS
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS GAIA_EU_Config (EU_Civ TEXT NOT NULL, EU_Type TEXT NOT NULL, 
	EU_Name TEXT, EU_Model TEXT, EU_Art TEXT, EU_Member TEXT, EU_NumMembers INTEGER DEFAULT 1, 
	PRIMARY KEY (EU_Civ, EU_Type)
);
INSERT INTO GAIA_EU_Config 
(EU_Civ,			EU_Type,				EU_Model,						EU_NumMembers) VALUES
('_ARABIA',			'RIFLEMAN',				'ararm1',						12),
('_ARABIA',			'COMPOSITE_BOWMAN',		'Composite_Bowman_Arabia',		12),
('_ARABIA',			'KNIGHT',				'Knight_Arabia',				5),
('_ARABIA',			'LONGSWORDSMAN',		'Longswordsman_Arabia',			12),
('_ARABIA',			'SPEARMAN',				'Spearman_Arabia',				12),
('_ARABIA',			'CROSSBOWMAN',			'Longbowman_Arabia',			12);

--=======================================================================================================================
UPDATE Sapiens_DBUpdates SET Value = 1 WHERE Name = 'NEUs_Arabia';
