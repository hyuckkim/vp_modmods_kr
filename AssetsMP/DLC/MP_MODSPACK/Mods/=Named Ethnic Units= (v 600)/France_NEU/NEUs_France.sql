-- written by GAIA using Notepad++
CREATE TABLE IF NOT EXISTS Sapiens_DBUpdates (Name TEXT PRIMARY KEY, Value INTEGER DEFAULT 0);
INSERT OR IGNORE INTO Sapiens_DBUpdates (Name) VALUES ('NEUs_France');
--=======================================================================================================================
-- UNIQUE COMPONENTS
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS GAIA_EU_Config (EU_Civ TEXT NOT NULL, EU_Type TEXT NOT NULL, 
	EU_Name TEXT, EU_Model TEXT, EU_Art TEXT, EU_Member TEXT, EU_NumMembers INTEGER DEFAULT 1, 
	PRIMARY KEY (EU_Civ, EU_Type)
);
INSERT INTO GAIA_EU_Config 
(EU_Civ,			EU_Type,				EU_Model,						EU_NumMembers) VALUES
('_FRANCE',			'TRIPLANE',				'Nieuport_17',					3),
('_FRANCE',			'RIFLEMAN',				'civ5_frerm',					12),
('_FRANCE',			'KNIGHT',				'Knight_France',				5),
('_FRANCE',			'GREAT_WAR_INFANTRY',	'fregw1',						12),
('_FRANCE',			'MODERN_ARMOR',			'Leclerc',						3),
('_FRANCE',			'CAVALRY',				'freca1',						5),
('_FRANCE',			'COMPOSITE_BOWMAN',		'Composite_Bowman_France',		12);

--=======================================================================================================================
UPDATE Sapiens_DBUpdates SET Value = 1 WHERE Name = 'NEUs_France';
