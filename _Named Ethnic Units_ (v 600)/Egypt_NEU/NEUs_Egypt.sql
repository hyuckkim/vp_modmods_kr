-- written by GAIA using Notepad++
CREATE TABLE IF NOT EXISTS Sapiens_DBUpdates (Name TEXT PRIMARY KEY, Value INTEGER DEFAULT 0);
INSERT OR IGNORE INTO Sapiens_DBUpdates (Name) VALUES ('NEUs_Egypt');
--=======================================================================================================================
-- UNIQUE COMPONENTS
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS GAIA_EU_Config (EU_Civ TEXT NOT NULL, EU_Type TEXT NOT NULL, 
	EU_Name TEXT, EU_Model TEXT, EU_Art TEXT, EU_Member TEXT, EU_NumMembers INTEGER DEFAULT 1, 
	PRIMARY KEY (EU_Civ, EU_Type)
);
INSERT INTO GAIA_EU_Config 
(EU_Civ,			EU_Type,				EU_Model,						EU_NumMembers) VALUES
('_EGYPT',			'COMPOSITE_BOWMAN',		'Composite_Bowman_Egypt',		12),
('_EGYPT',			'SWORDSMAN',			'EgyptSwordsman',				12),
('_EGYPT',			'LONGSWORDSMAN',		'Longswordsman_Egypt',			12),
('_EGYPT',			'PIKEMAN',				'Pikeman_Egypt',				12),
('_EGYPT',			'ARCHER',				'Archer_Egypt',					12),
('_EGYPT',			'SPEARMAN',				'Spearman_Egypt',				12),
('_EGYPT',			'SCOUT',				'egyption_scout',				6);

--=======================================================================================================================
UPDATE Sapiens_DBUpdates SET Value = 1 WHERE Name = 'NEUs_Egypt';
