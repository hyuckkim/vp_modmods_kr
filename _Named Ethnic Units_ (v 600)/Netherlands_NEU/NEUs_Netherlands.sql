-- written by GAIA using Notepad++
CREATE TABLE IF NOT EXISTS Sapiens_DBUpdates (Name TEXT PRIMARY KEY, Value INTEGER DEFAULT 0);
INSERT OR IGNORE INTO Sapiens_DBUpdates (Name) VALUES ('NEUs_Netherlands');
--=======================================================================================================================
-- UNIQUE COMPONENTS
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS GAIA_EU_Config (EU_Civ TEXT NOT NULL, EU_Type TEXT NOT NULL, 
	EU_Name TEXT, EU_Model TEXT, EU_Art TEXT, EU_Member TEXT, EU_NumMembers INTEGER DEFAULT 1, 
	PRIMARY KEY (EU_Civ, EU_Type)
);
INSERT INTO GAIA_EU_Config 
(EU_Civ,			EU_Type,				EU_Model,						EU_NumMembers) VALUES
('_NETHERLANDS',	'PIKEMAN',				'GAIA_Goedendag',				12),
('_NETHERLANDS',	'PARATROOPER',			'Paratrooper_Dutch_MG',			10),
('_NETHERLANDS',	'MODERN_ARMOR',			'Leopard1_Netherlands',			3),
('_NETHERLANDS',	'SPEARMAN',				'BatavianSpearman',				12),
('_NETHERLANDS',	'DESTROYER',			'Admiralen_Class',				1),
('_NETHERLANDS',	'RIFLEMAN',				'civ5_dutrm1',					12),
('_NETHERLANDS',	'TANK',					'MTSL-1GI4',					3);

--=======================================================================================================================
UPDATE Sapiens_DBUpdates SET Value = 1 WHERE Name = 'NEUs_Netherlands';
