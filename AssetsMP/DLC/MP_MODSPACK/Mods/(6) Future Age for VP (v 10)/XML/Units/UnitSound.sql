
INSERT INTO UnitGameplay2DScripts (UnitType, SelectionSound, FirstSelectionSound)
VALUES 
 ('UNIT_FW_ARSENAL_SHIP',      'AS2D_SELECT_BATTLESHIP', 'AS2D_BIRTH_BATTLESHIP'),
 ('UNIT_FW_RAILGUN_DESTROYER', 'AS2D_SELECT_BATTLESHIP', 'AS2D_BIRTH_BATTLESHIP'),
 ('UNIT_FW_BIO_DESTROYER',     'AS2D_SELECT_BATTLESHIP', 'AS2D_BIRTH_BATTLESHIP'),
 ('UNIT_FW_RAILGUN_CRUISER',   'AS2D_SELECT_BATTLESHIP', 'AS2D_BIRTH_BATTLESHIP'),
 ('UNIT_FW_BIO_CRUISER',       'AS2D_SELECT_BATTLESHIP', 'AS2D_BIRTH_BATTLESHIP');

INSERT INTO UnitGameplay2DScripts (UnitType, SelectionSound, FirstSelectionSound)
VALUES ('UNIT_FW_NEODESTROYER', 'AS2D_SELECT_BATTLESHIP', 'AS2D_BIRTH_BATTLESHIP');

 INSERT INTO UnitGameplay2DScripts
			(UnitType, SelectionSound, FirstSelectionSound)
VALUES
 ('UNIT_FW_AIRBORNE_FORCES',             'AS2D_SELECT_PARATROOPER', 'AS2D_SELECT_PARATROOPER'),
 ('UNIT_FW_ORBITAL_DROP_SHOCK_TROOPER',  'AS2D_SELECT_PARATROOPER', 'AS2D_SELECT_PARATROOPER'),
 ('UNIT_FW_SPACEMARINES',                'AS2D_SELECT_PARATROOPER', 'AS2D_SELECT_PARATROOPER');

INSERT INTO UnitGameplay2DScripts
	(UnitType, SelectionSound, FirstSelectionSound)
VALUES
	('UNIT_FW_CLONETROOPER',         'AS2D_SELECT_INFANTRY', 'AS2D_BIRTH_INFANTRY'),
	('UNIT_FW_BIOTROOPER',           'AS2D_SELECT_INFANTRY', 'AS2D_BIRTH_INFANTRY'),
	('UNIT_FW_SUPERSOLDIERS',        'AS2D_SELECT_INFANTRY', 'AS2D_BIRTH_INFANTRY'),
	('UNIT_FW_BIOINFANTRY',          'AS2D_SELECT_INFANTRY', 'AS2D_BIRTH_INFANTRY'),
	('UNIT_FW_ELITE_MERCENARIES',    'AS2D_SELECT_INFANTRY', 'AS2D_BIRTH_INFANTRY'),
	('UNIT_FW_ENHANCED_MERCENARIES', 'AS2D_SELECT_INFANTRY', 'AS2D_BIRTH_INFANTRY'),
	('UNIT_FW_BIO_MERCENARIES',      'AS2D_SELECT_INFANTRY', 'AS2D_BIRTH_INFANTRY');

INSERT INTO UnitGameplay2DScripts
	(UnitType, SelectionSound, FirstSelectionSound)
VALUES
	('UNIT_FW_POWER_ARMOR_INFANTRY', 'AS2D_SELECT_MECH_INFANTRY', 'AS2D_BIRTH_MECH_INFANTRY'),
	('UNIT_FW_BATTLESUIT', 'AS2D_SELECT_MECH_INFANTRY', 'AS2D_BIRTH_MECH_INFANTRY'),
	('UNIT_FW_GUNDAM', 'AS2D_SELECT_MECH_INFANTRY', 'AS2D_BIRTH_MECH_INFANTRY');

INSERT INTO UnitGameplay2DScripts
	(UnitType, SelectionSound, FirstSelectionSound)
VALUES
	('UNIT_FW_RAILGUN_TANK', 'AS2D_SELECT_MECH', 'AS2D_BIRTH_MECH'),
	('UNIT_FW_ZEKE',         'AS2D_SELECT_MECH', 'AS2D_BIRTH_MECH');

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 					   SelectionSound, 		FirstSelectionSound)
VALUES		
    ('UNIT_FW_HYBRID_DRONE', 'AS2D_SELECT_FIGHTER', 	'AS2D_BIRTH_FIGHTER'),
	('UNIT_FW_BIODRONE',	 'AS2D_SELECT_FIGHTER', 	'AS2D_BIRTH_FIGHTER');

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 					   SelectionSound, 		FirstSelectionSound)
VALUES		
    ('UNIT_FW_HIMARS',         'AS2D_SELECT_ROCKET_ARTILLERY', 	'AS2D_BIRTH_ROCKET_ARTILLERY'),
    ('UNIT_FW_MECH_ARTILLERY', 'AS2D_SELECT_ROCKET_ARTILLERY', 	'AS2D_BIRTH_ROCKET_ARTILLERY'),
	('UNIT_FW_ANGEL',	       'AS2D_SELECT_ROCKET_ARTILLERY', 	'AS2D_BIRTH_ROCKET_ARTILLERY');

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 					   SelectionSound, 		FirstSelectionSound)
VALUES	
    ('UNIT_FW_MECHASUB',         'AS2D_SELECT_NUCLEAR_SUBMARINE', 	'AS2D_BIRTH_NUCLEAR_SUBMARINE'),
    ('UNIT_FW_CYBERSUB',         'AS2D_SELECT_NUCLEAR_SUBMARINE', 	'AS2D_BIRTH_NUCLEAR_SUBMARINE');

INSERT INTO UnitGameplay2DScripts
			(UnitType, SelectionSound, FirstSelectionSound)
VALUES
 ('UNIT_FW_DRONE_FIGHTER_2', 'AS2D_SELECT_JET_FIGHTER', 'AS2D_SELECT_JET_FIGHTER'),
 ('UNIT_FW_PLASMA_FIGHTER',  'AS2D_SELECT_JET_FIGHTER', 'AS2D_SELECT_JET_FIGHTER'),
 ('UNIT_FW_SPACE_FIGHTER',   'AS2D_SELECT_JET_FIGHTER', 'AS2D_SELECT_JET_FIGHTER');

INSERT INTO UnitGameplay2DScripts (UnitType, SelectionSound, FirstSelectionSound)
VALUES 
 ('UNIT_FW_SUBORBITAL_BOMBER', 'AS2D_SELECT_STEALTH_BOMBER', 'AS2D_SELECT_STEALTH_BOMBER'),
 ('UNIT_FW_PLASMA_BOMBER',     'AS2D_SELECT_STEALTH_BOMBER', 'AS2D_SELECT_STEALTH_BOMBER'),
 ('UNIT_FW_SPACE_BOMBER',      'AS2D_SELECT_STEALTH_BOMBER', 'AS2D_SELECT_STEALTH_BOMBER');

INSERT INTO UnitGameplay2DScripts
			(UnitType, SelectionSound, FirstSelectionSound)
VALUES
 ('UNIT_FW_HELICARRIER', 'AS2D_SELECT_CARRIER', 'AS2D_SELECT_CARRIER'),
 ('UNIT_FW_NEXUS',  'AS2D_SELECT_CARRIER', 'AS2D_SELECT_CARRIER');

INSERT INTO UnitGameplay2DScripts (UnitType, SelectionSound, FirstSelectionSound)
	SELECT 'UNIT_FW_JAVELIN', SelectionSound, FirstSelectionSound
	FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_ARTILLERY');

INSERT INTO UnitGameplay2DScripts (UnitType, SelectionSound, FirstSelectionSound)
	SELECT 'UNIT_FW_ATGM', SelectionSound, FirstSelectionSound
	FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_ARTILLERY');

INSERT INTO UnitGameplay2DScripts (UnitType, SelectionSound, FirstSelectionSound)
	SELECT 'UNIT_FW_AUTOMATON', SelectionSound, FirstSelectionSound
	FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_ARTILLERY');

INSERT INTO UnitGameplay2DScripts (UnitType, SelectionSound, FirstSelectionSound)
	SELECT 'UNIT_FW_ROBOT_INFANTRY', SelectionSound, FirstSelectionSound
	FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_ARTILLERY');

INSERT INTO UnitGameplay2DScripts (UnitType, SelectionSound, FirstSelectionSound)
	SELECT 'UNIT_FW_COLOSSUS', SelectionSound, FirstSelectionSound
	FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_ARTILLERY');

INSERT INTO UnitGameplay2DScripts (UnitType, SelectionSound, FirstSelectionSound)
	SELECT 'UNIT_FW_APACHE', SelectionSound, FirstSelectionSound
	FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_HELICOPTER_GUNSHIP');

INSERT INTO UnitGameplay2DScripts (UnitType, SelectionSound, FirstSelectionSound)
	SELECT 'UNIT_FW_VERTOL', SelectionSound, FirstSelectionSound
	FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_HELICOPTER_GUNSHIP');

INSERT INTO UnitGameplay2DScripts (UnitType, SelectionSound, FirstSelectionSound)
	SELECT 'UNIT_FW_HOVERTANK', SelectionSound, FirstSelectionSound
	FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_HELICOPTER_GUNSHIP');
	
INSERT INTO UnitGameplay2DScripts
			(UnitType, SelectionSound, FirstSelectionSound)
VALUES
 ('UNIT_FW_MODERN_MOBILE_SAM', 'AS2D_SELECT_MOBILE_SAM', 'AS2D_BIRTH_MOBILE_SAM'),
 ('UNIT_FW_CYBERSAM',          'AS2D_SELECT_MOBILE_SAM', 'AS2D_BIRTH_MOBILE_SAM'),
 ('UNIT_FW_CRAWLER',           'AS2D_SELECT_MOBILE_SAM', 'AS2D_BIRTH_MOBILE_SAM');


INSERT INTO UnitGameplay2DScripts (UnitType, SelectionSound, FirstSelectionSound)
VALUES 
 ('UNIT_FW_RAILGUN_MISSILE',              'AS2D_SELECT_NUCLEAR_MISSILE', 'AS2D_BIRTH_NUCLEAR_MISSILE'),
 ('UNIT_FW_HYPERMISSILE',                 'AS2D_SELECT_NUCLEAR_MISSILE', 'AS2D_BIRTH_NUCLEAR_MISSILE'),
 ('UNIT_FW_HYDROGEN_BOMB',                'AS2D_SELECT_NUCLEAR_MISSILE', 'AS2D_BIRTH_NUCLEAR_MISSILE'),
 ('UNIT_FW_THEMONUCLEAR_BOMB',            'AS2D_SELECT_NUCLEAR_MISSILE', 'AS2D_BIRTH_NUCLEAR_MISSILE'),
 ('UNIT_FW_ADVANCED_MISSILE_GUIDED',      'AS2D_SELECT_NUCLEAR_MISSILE', 'AS2D_BIRTH_NUCLEAR_MISSILE');

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT		'UNIT_FW_RAPTOR',	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_CARTHAGINIAN_FOREST_ELEPHANT';	

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT		'UNIT_FW_TRICERATOPS',	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_CARTHAGINIAN_FOREST_ELEPHANT';	

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT		'UNIT_FW_TREX',	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_CARTHAGINIAN_FOREST_ELEPHANT';	

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT		'UNIT__FW_CHIMERA',	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_CARTHAGINIAN_FOREST_ELEPHANT';	

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT		'UNIT_FW_SWARM',	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_CARTHAGINIAN_FOREST_ELEPHANT';	

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT		'UNIT_FW_HYDRA',	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_CARTHAGINIAN_FOREST_ELEPHANT';	

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT		'UNIT_FW_MUTANT',	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_CARTHAGINIAN_FOREST_ELEPHANT';	



----- Units Sound
INSERT OR REPLACE INTO Audio_Sounds
		(SoundID,				           Filename,	             LoadType)
VALUES	
 ('SND_UNIT_VELOCIRAPTOR_ATTACK',	'VelociraptorAttack',	'DynamicResident'),
 ('SND_UNIT_TREX',              	'trex',              	'DynamicResident'),
 ('SND_UNIT_TREX_STEP',             'trexstep',             'DynamicResident');

INSERT OR REPLACE INTO Audio_3DSounds
		(ScriptID,			                	SoundID,			 SoundType, 	MaxVolume,	MinVolume)
VALUES	
 ('AS3D_UNIT_VELOCIRAPTOR_ATTACK',	'SND_UNIT_VELOCIRAPTOR_ATTACK',	'GAME_SFX',      45,			35),
 ('AS3D_UNIT_TREX',	                'SND_UNIT_TREX',	            'GAME_SFX',      45,			35),
 ('AS3D_UNIT_TREX_STEP',	        'SND_UNIT_TREX_STEP',	        'GAME_SFX',      30,			15);

INSERT OR REPLACE INTO Audio_Sounds
		(SoundID,				           Filename,	             LoadType)
VALUES	
 ('SND_SELECT_CLONETROOPER',	'Clonetrooper_Select',	'DynamicResident'),

INSERT OR REPLACE INTO Audio_2DSounds
		(ScriptID,				      SoundID,			        SoundType,	  MaxVolume,	MinVolume)
VALUES	('AS2D_SELECT_CLONETROOPER', 'SND_SELECT_CLONETROOPER',	'GAME_SFX',    45,			35);
 

