-- written by GAIA using Notepad++
CREATE TABLE IF NOT EXISTS Sapiens_DBUpdates (Name TEXT PRIMARY KEY, Value INTEGER DEFAULT 0);
INSERT OR IGNORE INTO Sapiens_DBUpdates (Name) VALUES ('NEUs_Carthage');
--=======================================================================================================================
-- UNIQUE COMPONENTS
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS GAIA_EU_Config (EU_Civ TEXT NOT NULL, EU_Type TEXT NOT NULL, 
	EU_Name TEXT, EU_Model TEXT, EU_Art TEXT, EU_Member TEXT, EU_NumMembers INTEGER DEFAULT 1, 
	PRIMARY KEY (EU_Civ, EU_Type)
);
INSERT INTO GAIA_EU_Config 
(EU_Civ,			EU_Type,				EU_Model,						EU_NumMembers) VALUES
('_CARTHAGE',		'WARRIOR',				'CarthageWarrior',				12),
('_CARTHAGE',		'PIKEMAN',				'SacredBand',					12),
('_CARTHAGE',		'SPEARMAN',				'CarthageSpearman',				12),
('_CARTHAGE',		'SWORDSMAN',			'CarthageSwordsman',			12),
('_CARTHAGE',		'KNIGHT',				'Carthage_Med_Horseman',		5),
('_CARTHAGE',		'SCOUT',				'CarthageScout',				7);

--=======================================================================================================================
UPDATE Sapiens_DBUpdates SET Value = 1 WHERE Name = 'NEUs_Carthage';
