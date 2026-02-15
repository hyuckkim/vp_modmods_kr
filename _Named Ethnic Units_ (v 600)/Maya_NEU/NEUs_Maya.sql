-- written by GAIA using Notepad++
CREATE TABLE IF NOT EXISTS Sapiens_DBUpdates (Name TEXT PRIMARY KEY, Value INTEGER DEFAULT 0);
INSERT OR IGNORE INTO Sapiens_DBUpdates (Name) VALUES ('NEUs_Maya');
--=======================================================================================================================
-- UNIQUE COMPONENTS
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS GAIA_EU_Config (EU_Civ TEXT NOT NULL, EU_Type TEXT NOT NULL, 
	EU_Name TEXT, EU_Model TEXT, EU_Art TEXT, EU_Member TEXT, EU_NumMembers INTEGER DEFAULT 1, 
	PRIMARY KEY (EU_Civ, EU_Type)
);
INSERT INTO GAIA_EU_Config 
(EU_Civ,			EU_Type,				EU_Model,						EU_NumMembers) VALUES
('_MAYA',			'COMPOSITE_BOWMAN',		'Composite_Bowman_Maya',		12),
('_MAYA',			'CROSSBOWMAN',			'Longbowman_Maya',				12),
('_MAYA',			'PIKEMAN',				'Pikeman_Maya',					12),
('_MAYA',			'LONGSWORDSMAN',		'Longswordsman_Maya',			12),
('_MAYA',			'SWORDSMAN',			'Swordsman_Maya',				12),
('_MAYA',			'SPEARMAN',				'Spearman_Maya',				12);

--=======================================================================================================================
UPDATE Sapiens_DBUpdates SET Value = 1 WHERE Name = 'NEUs_Maya';
