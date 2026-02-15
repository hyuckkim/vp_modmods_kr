
-- 1) Base: make sure all custom units have a 2D script (deterministic)
INSERT OR IGNORE INTO UnitGameplay2DScripts (UnitType, SelectionSound, FirstSelectionSound) VALUES
  ('UNIT_ADVJET',        'AS2D_SELECT_FIGHTER', 'AS2D_BIRTH_FIGHTER'),
  ('UNIT_EARLYJET',      'AS2D_SELECT_FIGHTER', 'AS2D_BIRTH_FIGHTER'),
  ('UNIT_JET27',         'AS2D_SELECT_FIGHTER', 'AS2D_BIRTH_FIGHTER'),
  ('UNIT_MIG29',         'AS2D_SELECT_FIGHTER', 'AS2D_BIRTH_FIGHTER'),
  ('UNIT_EARLYMONOPLAN', 'AS2D_SELECT_FIGHTER', 'AS2D_BIRTH_FIGHTER'),
  ('UNIT_B52',           'AS2D_SELECT_BOMBER',  'AS2D_BIRTH_BOMBER'),
  ('UNIT_LIGHTBOMBER',   'AS2D_SELECT_BOMBER',  'AS2D_BIRTH_BOMBER'),
  ('UNIT_STRBOMB',       'AS2D_SELECT_BOMBER',  'AS2D_BIRTH_BOMBER'),
  ('UNIT_ULTJETBOMB',    'AS2D_SELECT_BOMBER',  'AS2D_BIRTH_BOMBER');

-- 2) Per-unit overrides (no conflict, just update)
-- fighters you want to point to specific 2D scripts:
UPDATE UnitGameplay2DScripts SET SelectionSound='AS2D_SELECT_P11', FirstSelectionSound='AS2D_SELECT_P11'
WHERE UnitType='UNIT_EARLYMONOPLAN';

-- bombers custom overrides you already had:
UPDATE UnitGameplay2DScripts SET SelectionSound='AS2D_SELECT_GOTHA', FirstSelectionSound='AS2D_SELECT_GOTHA'
WHERE UnitType='UNIT_WWI_BOMBER';

UPDATE UnitGameplay2DScripts SET SelectionSound='AS2D_SELECT_AVROL', FirstSelectionSound='AS2D_SELECT_AVROL'
WHERE UnitType='UNIT_BOMBER';

UPDATE UnitGameplay2DScripts SET SelectionSound='AS2D_SELECT_B17', FirstSelectionSound='AS2D_SELECT_B17'
WHERE UnitType='UNIT_AMERICAN_B17';

UPDATE UnitGameplay2DScripts SET SelectionSound='AS2D_SELECT_B2', FirstSelectionSound='AS2D_SELECT_B2'
WHERE UnitType='UNIT_STEALTH_BOMBER';

UPDATE UnitGameplay2DScripts SET SelectionSound='AS2D_SELECT_FOK', FirstSelectionSound='AS2D_SELECT_FOK'
WHERE UnitType='UNIT_TRIPLANE';

-----------------------------------------------------------------------------------------------------------
----- UnitGameplay2DScripts / Audio_3DSounds UPDATE

UPDATE UnitGameplay2DScripts SET SelectionSound = 'AS2D_SELECT_GOTHA', FirstSelectionSound = 'AS2D_SELECT_GOTHA' WHERE UnitType = 'UNIT_WWI_BOMBER'; -- was vanilla UNIT_BOMBER sound
UPDATE UnitGameplay2DScripts SET SelectionSound = 'AS2D_SELECT_AVROL', FirstSelectionSound = 'AS2D_SELECT_AVROL' WHERE UnitType = 'UNIT_BOMBER'; -- was vanilla UNIT_BOMBER sound
UPDATE UnitGameplay2DScripts SET SelectionSound = 'AS2D_SELECT_B17', FirstSelectionSound = 'AS2D_SELECT_B17' WHERE UnitType = 'UNIT_AMERICAN_B17'; -- was vanilla UNIT_BOMBER sound
UPDATE UnitGameplay2DScripts SET SelectionSound = 'AS2D_SELECT_B2', FirstSelectionSound = 'AS2D_SELECT_B2' WHERE UnitType = 'UNIT_STEALTH_BOMBER'; -- was weird!
UPDATE UnitGameplay2DScripts SET SelectionSound = 'AS2D_SELECT_FOK', FirstSelectionSound = 'AS2D_SELECT_FOK' WHERE UnitType = 'UNIT_TRIPLANE'; -- was vanilla UNIT_FIGHTER

UPDATE Audio_3DSounds SET MaxVolume = 59,	MinVolume = 41 WHERE ScriptID = 'AS3D_UNIT_STEALTH_BOMBER_STEALTH_BOMBER_TURN' AND SoundID = 'SND_UNIT_STEALTH_BOMBER_TURN' AND SoundType = 'GAME_SFX'; -- was 75,75


----- Units Sound
-- === Units Sound ===
INSERT INTO Audio_Sounds (SoundID, Filename, LoadType) VALUES
('SND_UNIT_GOTHA_RUN','gotharun','DynamicResident'),
('SND_UNIT_GOTHA_TURN','gothaturn','DynamicResident'),
('SND_SELECT_GOTHA','gothaselect','DynamicResident'),
('SND_UNIT_VICK_RUN','vwrun','DynamicResident'),
('SND_UNIT_VICK_TURN','vwturn','DynamicResident'),
('SND_SELECT_VICK','vwselect','DynamicResident'),
('SND_UNIT_AVROL_RUN','avroLrun','DynamicResident'),
('SND_UNIT_AVROL_TURN','avroLturn','DynamicResident'),
('SND_SELECT_AVROL','avroLselect','DynamicResident'),
('SND_UNIT_B17_RUN','b17run','DynamicResident'),
('SND_UNIT_B17_TURN','b17turn','DynamicResident'),
('SND_SELECT_B17','b17select','DynamicResident'),
('SND_UNIT_TU95_RUN','tu95run','DynamicResident'),
('SND_UNIT_TU95_TURN','tu95turn','DynamicResident'),
('SND_SELECT_TU95','tu95select','DynamicResident'),
('SND_UNIT_B52_RUN','b52run','DynamicResident'),
('SND_UNIT_B52_TURN','b52turn','DynamicResident'),
('SND_SELECT_B52','b52select','DynamicResident'),
('SND_UNIT_B1_RUN','b1run','DynamicResident'),
('SND_UNIT_B1_TURN','b1turn','DynamicResident'),
('SND_SELECT_B1','b1select','DynamicResident'),
('SND_SELECT_B2','b2select','DynamicResident'),
('SND_UNIT_FOK_RUN','fokrun','DynamicResident'),
('SND_UNIT_FOK_TURN','fokturn','DynamicResident'),
('SND_SELECT_FOK','fokselect','DynamicResident'),
('SND_UNIT_P11_RUN','p11run','DynamicResident'),
('SND_UNIT_P11_TURN','p11turn','DynamicResident'),
('SND_SELECT_P11','p11select','DynamicResident');

-- === 3D Sounds ===
INSERT INTO Audio_3DSounds (ScriptID, SoundID, SoundType, MaxVolume, MinVolume) VALUES
('AS3D_UNIT_GOTHA_RUN','SND_UNIT_GOTHA_RUN','GAME_SFX',22,10),
('AS3D_UNIT_GOTHA_TURN','SND_UNIT_GOTHA_TURN','GAME_SFX',35,17),
('AS3D_UNIT_VICK_RUN','SND_UNIT_VICK_RUN','GAME_SFX',41,15),
('AS3D_UNIT_VICK_TURN','SND_UNIT_VICK_TURN','GAME_SFX',44,20),
('AS3D_UNIT_AVROL_RUN','SND_UNIT_AVROL_RUN','GAME_SFX',53,25),
('AS3D_UNIT_AVROL_TURN','SND_UNIT_AVROL_TURN','GAME_SFX',27,12),
('AS3D_UNIT_B17_RUN','SND_UNIT_B17_RUN','GAME_SFX',37,18),
('AS3D_UNIT_B17_TURN','SND_UNIT_B17_TURN','GAME_SFX',70,38),
('AS3D_UNIT_TU95_RUN','SND_UNIT_TU95_RUN','GAME_SFX',35,10),
('AS3D_UNIT_TU95_TURN','SND_UNIT_TU95_TURN','GAME_SFX',55,20),
('AS3D_UNIT_B52_RUN','SND_UNIT_B52_RUN','GAME_SFX',43,19),
('AS3D_UNIT_B52_TURN','SND_UNIT_B52_TURN','GAME_SFX',62,26),
('AS3D_UNIT_B1_RUN','SND_UNIT_B1_RUN','GAME_SFX',46,23),
('AS3D_UNIT_B1_TURN','SND_UNIT_B1_TURN','GAME_SFX',61,33),
('AS3D_UNIT_FOK_RUN','SND_UNIT_FOK_RUN','GAME_SFX',31,11),
('AS3D_UNIT_FOK_TURN','SND_UNIT_FOK_TURN','GAME_SFX',49,28),
('AS3D_UNIT_P11_RUN','SND_UNIT_P11_RUN','GAME_SFX',35,19),
('AS3D_UNIT_P11_TURN','SND_UNIT_P11_TURN','GAME_SFX',47,24);

-- === 2D Select Sounds ===
INSERT INTO Audio_2DSounds (ScriptID, SoundID, SoundType, MaxVolume, MinVolume) VALUES
('AS2D_SELECT_GOTHA','SND_SELECT_GOTHA','GAME_SFX',40,33),
('AS2D_SELECT_VICK','SND_SELECT_VICK','GAME_SFX',50,30),
('AS2D_SELECT_AVROL','SND_SELECT_AVROL','GAME_SFX',40,33),
('AS2D_SELECT_B17','SND_SELECT_B17','GAME_SFX',49,29),
('AS2D_SELECT_TU95','SND_SELECT_TU95','GAME_SFX',38,22),
('AS2D_SELECT_B52','SND_SELECT_B52','GAME_SFX',50,34),
('AS2D_SELECT_B1','SND_SELECT_B1','GAME_SFX',50,34),
('AS2D_SELECT_B2','SND_SELECT_B2','GAME_SFX',40,26),
('AS2D_SELECT_FOK','SND_SELECT_FOK','GAME_SFX',37,24),
('AS2D_SELECT_P11','SND_SELECT_P11','GAME_SFX',37,24);

