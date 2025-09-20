----- Units Sound
INSERT INTO Audio_Sounds (SoundID, Filename, LoadType)
SELECT 'SND_UNIT_GOTHA_RUN', 'gotharun', 'DynamicResident' UNION ALL
SELECT 'SND_UNIT_GOTHA_TURN', 'gothaturn', 'DynamicResident' UNION ALL
SELECT 'SND_SELECT_GOTHA', 'gothaselect', 'DynamicResident' UNION ALL
SELECT 'SND_UNIT_VICK_RUN', 'vwrun', 'DynamicResident' UNION ALL
SELECT 'SND_UNIT_VICK_TURN', 'vwturn', 'DynamicResident' UNION ALL
SELECT 'SND_SELECT_VICK', 'vwselect', 'DynamicResident' UNION ALL
SELECT 'SND_UNIT_AVROL_RUN', 'avroLrun', 'DynamicResident' UNION ALL
SELECT 'SND_UNIT_AVROL_TURN', 'avroLturn', 'DynamicResident' UNION ALL
SELECT 'SND_SELECT_AVROL', 'avroLselect', 'DynamicResident' UNION ALL
SELECT 'SND_UNIT_B17_RUN', 'b17run', 'DynamicResident' UNION ALL
SELECT 'SND_UNIT_B17_TURN', 'b17turn', 'DynamicResident' UNION ALL
SELECT 'SND_SELECT_B17', 'b17select', 'DynamicResident' UNION ALL
SELECT 'SND_UNIT_TU95_RUN', 'tu95run', 'DynamicResident' UNION ALL
SELECT 'SND_UNIT_TU95_TURN', 'tu95turn', 'DynamicResident' UNION ALL
SELECT 'SND_SELECT_TU95', 'tu95select', 'DynamicResident' UNION ALL
SELECT 'SND_UNIT_B52_RUN', 'b52run', 'DynamicResident' UNION ALL
SELECT 'SND_UNIT_B52_TURN', 'b52turn', 'DynamicResident' UNION ALL
SELECT 'SND_SELECT_B52', 'b52select', 'DynamicResident' UNION ALL
SELECT 'SND_UNIT_B1_RUN', 'b1run', 'DynamicResident' UNION ALL
SELECT 'SND_UNIT_B1_TURN', 'b1turn', 'DynamicResident' UNION ALL
SELECT 'SND_SELECT_B1', 'b1select', 'DynamicResident' UNION ALL
SELECT 'SND_SELECT_B2', 'b2select', 'DynamicResident' UNION ALL
SELECT 'SND_UNIT_FOK_RUN', 'fokrun', 'DynamicResident' UNION ALL
SELECT 'SND_UNIT_FOK_TURN', 'fokturn', 'DynamicResident' UNION ALL
SELECT 'SND_SELECT_FOK', 'fokselect', 'DynamicResident' UNION ALL
SELECT 'SND_UNIT_P11_RUN', 'p11run', 'DynamicResident' UNION ALL
SELECT 'SND_UNIT_P11_TURN', 'p11turn', 'DynamicResident' UNION ALL
SELECT 'SND_SELECT_P11', 'p11select', 'DynamicResident';

INSERT INTO Audio_3DSounds (ScriptID, SoundID, SoundType, MaxVolume,	MinVolume)
SELECT 'AS3D_UNIT_GOTHA_RUN', 'SND_UNIT_GOTHA_RUN', 'GAME_SFX', 22, 10 UNION ALL
SELECT 'AS3D_UNIT_GOTHA_TURN', 'SND_UNIT_GOTHA_TURN', 'GAME_SFX', 35, 17 UNION ALL
SELECT 'AS3D_UNIT_VICK_RUN', 'SND_UNIT_VICK_RUN', 'GAME_SFX', 41, 15 UNION ALL
SELECT 'AS3D_UNIT_VICK_TURN', 'SND_UNIT_VICK_TURN', 'GAME_SFX', 44, 20 UNION ALL
SELECT 'AS3D_UNIT_AVROL_RUN', 'SND_UNIT_AVROL_RUN', 'GAME_SFX', 53, 25 UNION ALL
SELECT 'AS3D_UNIT_AVROL_TURN', 'SND_UNIT_AVROL_TURN', 'GAME_SFX', 27, 12 UNION ALL
SELECT 'AS3D_UNIT_B17_RUN', 'SND_UNIT_B17_RUN', 'GAME_SFX', 37, 18 UNION ALL
SELECT 'AS3D_UNIT_B17_TURN', 'SND_UNIT_B17_TURN', 'GAME_SFX', 70, 38 UNION ALL
SELECT 'AS3D_UNIT_TU95_RUN', 'SND_UNIT_TU95_RUN', 'GAME_SFX', 35, 10 UNION ALL
SELECT 'AS3D_UNIT_TU95_TURN', 'SND_UNIT_TU95_TURN', 'GAME_SFX', 55, 20 UNION ALL
SELECT 'AS3D_UNIT_B52_RUN', 'SND_UNIT_B52_RUN', 'GAME_SFX', 43, 19 UNION ALL
SELECT 'AS3D_UNIT_B52_TURN', 'SND_UNIT_B52_TURN', 'GAME_SFX', 62, 26 UNION ALL
SELECT 'AS3D_UNIT_B1_RUN', 'SND_UNIT_B1_RUN', 'GAME_SFX', 46, 23 UNION ALL
SELECT 'AS3D_UNIT_B1_TURN', 'SND_UNIT_B1_TURN', 'GAME_SFX', 61, 33 UNION ALL
SELECT 'AS3D_UNIT_FOK_RUN', 'SND_UNIT_FOK_RUN', 'GAME_SFX', 31, 11 UNION ALL
SELECT 'AS3D_UNIT_FOK_TURN', 'SND_UNIT_FOK_TURN', 'GAME_SFX', 49, 28 UNION ALL
SELECT 'AS3D_UNIT_P11_RUN', 'SND_UNIT_P11_RUN', 'GAME_SFX', 35, 19 UNION ALL
SELECT 'AS3D_UNIT_P11_TURN', 'SND_UNIT_P11_TURN', 'GAME_SFX', 47, 24;

INSERT INTO Audio_2DSounds (ScriptID, SoundID, SoundType, MaxVolume, MinVolume)
SELECT 'AS2D_SELECT_GOTHA',	'SND_SELECT_GOTHA', 'GAME_SFX', 40, 33 UNION ALL
SELECT 'AS2D_SELECT_VICK',	'SND_SELECT_VICK', 'GAME_SFX', 50, 30 UNION ALL
SELECT 'AS2D_SELECT_AVROL',	'SND_SELECT_AVROL', 'GAME_SFX', 40, 33 UNION ALL
SELECT 'AS2D_SELECT_B17',	'SND_SELECT_B17', 'GAME_SFX', 49, 29 UNION ALL
SELECT 'AS2D_SELECT_TU95',	'SND_SELECT_TU95', 'GAME_SFX', 38, 22 UNION ALL
SELECT 'AS2D_SELECT_B52',	'SND_SELECT_B52', 'GAME_SFX', 50, 34 UNION ALL
SELECT 'AS2D_SELECT_B1',	'SND_SELECT_B1', 'GAME_SFX', 50, 34 UNION ALL
SELECT 'AS2D_SELECT_B2',	'SND_SELECT_B2', 'GAME_SFX', 40, 26 UNION ALL
SELECT 'AS2D_SELECT_FOK',	'SND_SELECT_FOK', 'GAME_SFX', 37, 24 UNION ALL
SELECT 'AS2D_SELECT_P11',	'SND_SELECT_P11', 'GAME_SFX', 37, 24;


--------------------------------
-- Strategic bomber
--------------------------------

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, SelectionSound, FirstSelectionSound)
SELECT		('UNIT_EARLYJET'), SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_JET_FIGHTER');

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, SelectionSound, FirstSelectionSound)
VALUES	('UNIT_EARLYMONOPLAN', 'AS2D_SELECT_P11', 'AS2D_SELECT_P11');
	

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JET27'), SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_JET_FIGHTER');

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, SelectionSound, FirstSelectionSound)
SELECT		('UNIT_MIG29'), SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_JET_FIGHTER');


INSERT INTO UnitGameplay2DScripts 	
			(UnitType, SelectionSound, FirstSelectionSound)
SELECT		('UNIT_ADVJET'), SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_JET_FIGHTER');	
	
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, SelectionSound, FirstSelectionSound)
VALUES ('UNIT_LIGHTBOMBER', 'AS2D_SELECT_VICK', 'AS2D_SELECT_VICK');
	

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, SelectionSound, FirstSelectionSound)
VALUES ('UNIT_STRBOMB', 'AS2D_SELECT_TU95', 'AS2D_SELECT_TU95');

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, SelectionSound, FirstSelectionSound)
VALUES ('UNIT_B52', 'AS2D_SELECT_B52', 'AS2D_SELECT_B52');



INSERT INTO UnitGameplay2DScripts
			(UnitType, SelectionSound, FirstSelectionSound)
VALUES ('UNIT_ULTJETBOMB', 'AS2D_SELECT_B1', 'AS2D_SELECT_B1');





-----------------------------------------------------------------------------------------------------------
----- UnitGameplay2DScripts / Audio_3DSounds UPDATE

UPDATE UnitGameplay2DScripts SET SelectionSound = 'AS2D_SELECT_GOTHA', FirstSelectionSound = 'AS2D_SELECT_GOTHA' WHERE UnitType = 'UNIT_WWI_BOMBER'; -- was vanilla UNIT_BOMBER sound
UPDATE UnitGameplay2DScripts SET SelectionSound = 'AS2D_SELECT_AVROL', FirstSelectionSound = 'AS2D_SELECT_AVROL' WHERE UnitType = 'UNIT_BOMBER'; -- was vanilla UNIT_BOMBER sound
UPDATE UnitGameplay2DScripts SET SelectionSound = 'AS2D_SELECT_B17', FirstSelectionSound = 'AS2D_SELECT_B17' WHERE UnitType = 'UNIT_AMERICAN_B17'; -- was vanilla UNIT_BOMBER sound
UPDATE UnitGameplay2DScripts SET SelectionSound = 'AS2D_SELECT_B2', FirstSelectionSound = 'AS2D_SELECT_B2' WHERE UnitType = 'UNIT_STEALTH_BOMBER'; -- was weird!
UPDATE UnitGameplay2DScripts SET SelectionSound = 'AS2D_SELECT_FOK', FirstSelectionSound = 'AS2D_SELECT_FOK' WHERE UnitType = 'UNIT_TRIPLANE'; -- was vanilla UNIT_FIGHTER

UPDATE Audio_3DSounds SET MaxVolume = 59,	MinVolume = 41 WHERE ScriptID = 'AS3D_UNIT_STEALTH_BOMBER_STEALTH_BOMBER_TURN' AND SoundID = 'SND_UNIT_STEALTH_BOMBER_TURN' AND SoundType = 'GAME_SFX'; -- was 75,75
