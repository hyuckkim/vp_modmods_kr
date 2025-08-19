-- written by GAIA using Notepad++
CREATE TABLE IF NOT EXISTS Sapiens_DBUpdates (Name TEXT PRIMARY KEY, Value INTEGER DEFAULT 0);
INSERT OR IGNORE INTO Sapiens_DBUpdates (Name) VALUES ('NEUs_Songhai');
--=======================================================================================================================
-- UNIQUE COMPONENTS
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS GAIA_EU_Config (EU_Civ TEXT NOT NULL, EU_Type TEXT NOT NULL, 
	EU_Name TEXT, EU_Model TEXT, EU_Art TEXT, EU_Member TEXT, EU_NumMembers INTEGER DEFAULT 1, 
	PRIMARY KEY (EU_Civ, EU_Type)
);
INSERT INTO GAIA_EU_Config 
(EU_Civ,			EU_Type,				EU_Model,						EU_NumMembers) VALUES
('_SONGHAI',		'SCOUT',				'SonghaiScout',					7),
('_SONGHAI',		'SWORDSMAN',			'MakuriaSwordsman',				12),
('_SONGHAI',		'LONGSWORDSMAN',		'SudanSwordsman',				12),
('_SONGHAI',		'PIKEMAN',				'SonghaiPikeman',				12),
('_SONGHAI',		'SPEARMAN',				'SonghaiSpearman',				12),
('_SONGHAI',		'MODERN_ARMOR',			'T55Mali',						3);

--=======================================================================================================================
UPDATE Sapiens_DBUpdates SET Value = 1 WHERE Name = 'NEUs_Songhai';
