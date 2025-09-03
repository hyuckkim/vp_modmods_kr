-- written by GAIA using Notepad++
CREATE TABLE IF NOT EXISTS Sapiens_DBUpdates (Name TEXT PRIMARY KEY, Value INTEGER DEFAULT 0);
INSERT OR IGNORE INTO Sapiens_DBUpdates (Name) VALUES ('NEUs_Ottoman');
--=======================================================================================================================
-- UNIQUE COMPONENTS
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS GAIA_EU_Config (EU_Civ TEXT NOT NULL, EU_Type TEXT NOT NULL, 
	EU_Name TEXT, EU_Model TEXT, EU_Art TEXT, EU_Member TEXT, EU_NumMembers INTEGER DEFAULT 1, 
	PRIMARY KEY (EU_Civ, EU_Type)
);
INSERT INTO GAIA_EU_Config 
(EU_Civ,			EU_Type,				EU_Model,						EU_NumMembers) VALUES
('_OTTOMAN',		'RIFLEMAN',				'civ5_ottrm',					12),
('_OTTOMAN',		'PIKEMAN',				'Pikeman_Turkey',				12),
('_OTTOMAN',		'GREAT_WAR_INFANTRY',	'ottgw1',						12),
('_OTTOMAN',		'HORSEMAN',				'Horseman_Turkey',				5),
('_OTTOMAN',		'CROSSBOWMAN',			'Crossbowman_Turkey',			12),
('_OTTOMAN',		'LONGSWORDSMAN',		'Longswordsman_Turkey_v2',		12);

--=======================================================================================================================
UPDATE Sapiens_DBUpdates SET Value = 1 WHERE Name = 'NEUs_Ottoman';
