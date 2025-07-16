INSERT OR REPLACE INTO UnitCombatInfos 
			(Type, Description) 
VALUES		
	('UNITCOMBAT_MISSILE', 'TXT_KEY_UNITCOMBAT_MISSILE');

UPDATE Units SET CombatClass = 'UNITCOMBAT_MISSILE' WHERE Special ='SPECIALUNIT_MISSILE';

INSERT OR REPLACE INTO Language_en_US 
			(Tag,	Text) 
VALUES	
	('TXT_KEY_UNITCOMBAT_MISSILE', 'Missiles');


-- Change Menin Gate yields
DELETE FROM Building_YieldFromDeath WHERE BuildingType = 'BUILDING_MENIN_GATE';

INSERT INTO Building_YieldFromDeath
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_MENIN_GATE', 'YIELD_CULTURE', 20),
	('BUILDING_MENIN_GATE', 'YIELD_GOLDEN_AGE_POINTS', 20);

INSERT OR REPLACE INTO Language_en_US 
			(Tag,	Text) 
VALUES	
	('TXT_KEY_BUILDING_MENIN_GATE_HELP', 'May only be built collaboratively through the World Congress. Receive +2 [ICON_HAPPINESS_1] Happiness in the City in which it is built.[NEWLINE][NEWLINE]Receive 20 [ICON_CULTURE] Culture and [ICON_GOLDEN_AGE] Golden Age Points whenever an owned unit is killed, scaling with Era. Forts, Citadels and Landmarks provide +2 [ICON_CULTURE] Culture and [ICON_GOLDEN_AGE] Golden Age Points when worked.'),
('TXT_KEY_LEAGUE_PROJECT_REWARD_WARGAMES_3_HELP', 'Menin Gate wonder appears in [ICON_CAPITAL] Capital. (Receive +2 [ICON_HAPPINESS_1] Happiness in the City in which it is built. Receive 20 [ICON_CULTURE] Culture and [ICON_GOLDEN_AGE] Golden Age Points whenever an owned unit is killed, scaling with Era. Forts, Citadels and Landmarks provide +2 [ICON_CULTURE] Culture and [ICON_GOLDEN_AGE] Golden Age Points when worked.)'),
	('TXT_KEY_LEAGUE_PROJECT_REWARD_WARGAMES_3_HELP', 'Menin Gate wonder appears in [ICON_CAPITAL] Capital. (Receive +2 [ICON_HAPPINESS_1] Happiness in the City in which it is built. Receive 20 [ICON_CULTURE] Culture and [ICON_GOLDEN_AGE] Golden Age Points whenever an owned unit is killed, scaling with Era. Forts, Citadels and Landmarks provide +2 [ICON_CULTURE] Culture and [ICON_GOLDEN_AGE] Golden Age Points when worked.)');

-- change score from GWs
UPDATE Defines SET Value = '10' WHERE Name = 'SCORE_GREAT_WORK_MULTIPLIER';
-- base is 4

-- SUG for new units
CREATE TABLE IF NOT EXISTS  ArtDefine_USnF (
						  	USnF_id INTEGER PRIMARY KEY AUTOINCREMENT, 
							USnF_Type TEXT DEFAULT NULL, 
							USnF_UnitInfo TEXT NOT NULL, 
							USnF_UnitMemberInfo TEXT NOT NULL, 
							USnF_Domain TEXT DEFAULT NULL, 
							USnF_ModMod TEXT DEFAULT NULL, 
							USnF_Scale FLOAT DEFAULT 0, 
							USnF_NumMembers INTEGER DEFAULT -1, 
							USnF_Formation TEXT DEFAULT NULL, 
							USnF_ScaleMultiplier FLOAT DEFAULT 1);
							
CREATE TABLE IF NOT EXISTS  ArtDefine_USnFModCompatibility (
						  	USnF_id INTEGER PRIMARY KEY AUTOINCREMENT, 
							USnF_ModMod TEXT UNIQUE ON CONFLICT IGNORE);
													
INSERT  INTO ArtDefine_USnF
(USnF_UnitInfo, 			USnF_UnitMemberInfo, USnF_Type, USnF_Domain, USnF_ModMod, USnF_Scale, USnF_NumMembers) VALUES
('ART_DEF_UNIT_HARMONY_PEACEKEEPER',	'ART_DEF_UNIT_MEMBER_HARMONY_PEACEKEEPER',	'RED',	'LAND',	'SemperFidelis',   0.078, 	15),
('ART_DEF_UNIT_HARMONY_PEACEKEEPER',	'ART_DEF_UNIT_MEMBER_HARMONY_PEACEKEEPER',	'RUG',	'LAND',	'SemperFidelis',   0.162, 	3),
('ART_DEF_UNIT_HARMONY_PEACEKEEPER',	'ART_DEF_UNIT_MEMBER_HARMONY_PEACEKEEPER',	'SUG',	'LAND',	'SemperFidelis',   0.25, 	1),

('ART_DEF_UNIT_LS_DUR_MUJAHIDEEN',	'ART_DEF_UNIT_MEMBER_LS_DUR_MUJAHIDEEN',	'RED',	'LAND',	'SemperFidelis',   0.078, 	15),
('ART_DEF_UNIT_LS_DUR_MUJAHIDEEN',	'ART_DEF_UNIT_MEMBER_LS_DUR_MUJAHIDEEN',	'RUG',	'LAND',	'SemperFidelis',   0.162, 	3),
('ART_DEF_UNIT_LS_DUR_MUJAHIDEEN',	'ART_DEF_UNIT_MEMBER_LS_DUR_MUJAHIDEEN',	'SUG',	'LAND',	'SemperFidelis',   0.25, 	1);

INSERT INTO ArtDefine_USnFModCompatibility (USnF_ModMod)
SELECT 'SemperFidelis';