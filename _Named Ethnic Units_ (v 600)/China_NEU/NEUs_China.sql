-- written by GAIA using Notepad++
CREATE TABLE IF NOT EXISTS Sapiens_DBUpdates (Name TEXT PRIMARY KEY, Value INTEGER DEFAULT 0);
INSERT OR IGNORE INTO Sapiens_DBUpdates (Name) VALUES ('NEUs_China');
--=======================================================================================================================
-- UNIQUE COMPONENTS
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS GAIA_EU_Config (EU_Civ TEXT NOT NULL, EU_Type TEXT NOT NULL, 
	EU_Name TEXT, EU_Model TEXT, EU_Art TEXT, EU_Member TEXT, EU_NumMembers INTEGER DEFAULT 1, 
	PRIMARY KEY (EU_Civ, EU_Type)
);
INSERT INTO GAIA_EU_Config 
(EU_Civ,			EU_Type,				EU_Model,						EU_NumMembers) VALUES
('_CHINA',			'ARCHER',				'Archer_China',					12),
('_CHINA',			'SPEARMAN',				'Spearman_China_v2',			12),
('_CHINA',			'SWORDSMAN',			'Swordsman_China_v2',			12),
('_CHINA',			'KNIGHT',				'Knight_China',					5),
('_CHINA',			'LONGSWORDSMAN',		'Longswordsman_China_v3',		12),
('_CHINA',			'PIKEMAN',				'Halberdier_China',				12),
('_CHINA',			'RIFLEMAN',				'civ5_chirm2',					12),
('_CHINA',			'GREAT_WAR_INFANTRY',	'japgw1',						12),
('_CHINA',			'IRONCLAD',				'Connecticut_BB',				1),
('_CHINA',			'MECHANIZED_INFANTRY',	'BMP2GreenTeam',				3),
('_CHINA',			'PARATROOPER',			'Paratrooper_China_MG',			10);

--=======================================================================================================================
UPDATE Sapiens_DBUpdates SET Value = 1 WHERE Name = 'NEUs_China';
