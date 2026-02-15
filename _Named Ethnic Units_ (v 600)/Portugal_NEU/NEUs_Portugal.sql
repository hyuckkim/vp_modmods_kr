-- written by GAIA using Notepad++
CREATE TABLE IF NOT EXISTS Sapiens_DBUpdates (Name TEXT PRIMARY KEY, Value INTEGER DEFAULT 0);
INSERT OR IGNORE INTO Sapiens_DBUpdates (Name) VALUES ('NEUs_Portugal');
--=======================================================================================================================
-- UNIQUE COMPONENTS
--=======================================================================================================================
INSERT INTO GAIA_EU_Config 
(EU_Civ,			EU_Type,				EU_Model,						EU_NumMembers) VALUES
('_PORTUGAL',		'SPEARMAN',				'PortugalSpearman',				12),
('_PORTUGAL',		'LONGSWORDSMAN',		'Portugal_longsw8',				12),
('_PORTUGAL',		'JET_FIGHTER',			'A-7Portugal',					2),
('_PORTUGAL',		'WARRIOR',				'Caetranann',					12),
('_PORTUGAL',		'GALLEON',				'portuguese_galleon',			1),
('_PORTUGAL',		'TANK',					'A12_Matilda_II_5',				3);

--=======================================================================================================================
UPDATE Sapiens_DBUpdates SET Value = 1 WHERE Name = 'NEUs_Portugal';
