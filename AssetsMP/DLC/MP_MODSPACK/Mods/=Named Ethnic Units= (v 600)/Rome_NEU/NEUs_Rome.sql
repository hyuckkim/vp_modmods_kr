-- written by GAIA using Notepad++
CREATE TABLE IF NOT EXISTS Sapiens_DBUpdates (Name TEXT PRIMARY KEY, Value INTEGER DEFAULT 0);
INSERT OR IGNORE INTO Sapiens_DBUpdates (Name) VALUES ('NEUs_Rome');
--=======================================================================================================================
-- UNIQUE COMPONENTS
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS GAIA_EU_Config (EU_Civ TEXT NOT NULL, EU_Type TEXT NOT NULL, 
	EU_Name TEXT, EU_Model TEXT, EU_Art TEXT, EU_Member TEXT, EU_NumMembers INTEGER DEFAULT 1, 
	PRIMARY KEY (EU_Civ, EU_Type)
);
INSERT INTO GAIA_EU_Config 
(EU_Civ,			EU_Type,				EU_Model,						EU_NumMembers) VALUES
('_ROME',			'COMPOSITE_BOWMAN',		'Composite_Bowman_Rome',		12),
('_ROME',			'SPEARMAN',				'Spearman_Rome',				12),
('_ROME',			'HORSEMAN',				'Horseman_Rome_v2',				5),
('_ROME',			'KNIGHT',				'Knight_Rome',					5),
('_ROME',			'PIKEMAN',				'Pikeman_Rome',					12),
('_ROME',			'CROSSBOWMAN',			'Crossbowman_Rome',				12);

--=======================================================================================================================
UPDATE Sapiens_DBUpdates SET Value = 1 WHERE Name = 'NEUs_Rome';
