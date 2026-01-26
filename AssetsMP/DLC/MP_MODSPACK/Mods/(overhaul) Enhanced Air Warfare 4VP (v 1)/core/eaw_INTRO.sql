/*

rev 7

----- eaw_i_ATLAS
0. Medium Bomber. Vicker Wellington           UNITCLASS_MEDIUMBOMBER - UNIT_MEDIUMBOMBER - mediumBomb.sql
1. B-52                                       UNITCLASS_B52 - UNIT_B52 - B52.sql
2. Jet Bomber. B-1 Lancer                     UNITCLASS_ULTJETBOMB - UNIT_ULTJETBOMB - ultJetBomb.sql
3. Monoplane. PZL.11                          UNITCLASS_EARLYMONOPLAN - UNIT_EARLYMONOPLAN - earlyMono.sql
4. P-80 Shooting Star                         UNITCLASS_EARLYJET - UNIT_EARLYJET - earlyJet.sql
5. Advanced Jet Fighter. Su57                 UNITCLASS_ADVJET - UNIT_ADVJET - advJet.sql
6. Jet Fighter. Mirage 2000                   UNITCLASS_JET27 - UNIT_JET27 - jetfight.sql
7. MiG-29                                     UNITCLASS_MIG29 - UNIT_MIG29 - MiG29.sql
8. Strategic Bomber. Tu-95                    UNITCLASS_STRBOMB - UNIT_STRBOMB - strBomb.sql
9.

----- eaw_PI_ATLAS
0. Shooting Star                              PROMOTION_JET_DOM - P-80 Shooting Star
1. Light Air Cover                            PROMOTION_ANTIAIR_LIGHT - Guerilla

*/

----- Atlas
INSERT INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn)
VALUES		
  ('eaw_i_ATLAS', 256, 'EAW_i_256.dds', 9,1),
  ('eaw_i_ATLAS', 128, 'EAW_i_128.dds', 9,1),
  ('eaw_i_ATLAS', 080, 'EAW_i_080.dds', 9,1),
  ('eaw_i_ATLAS', 064, 'EAW_i_064.dds', 9,1),
  ('eaw_i_ATLAS', 045, 'EAW_i_045.dds', 9,1),
  
  ('eaw_PI_ATLAS', 256, 'eaw_PI_256.dds', 2, 1),
  ('eaw_PI_ATLAS', 064, 'eaw_PI_064.dds', 2, 1),
  ('eaw_PI_ATLAS', 045, 'eaw_PI_045.dds', 2, 1),
  ('eaw_PI_ATLAS', 032, 'eaw_PI_032.dds', 2, 1),
  ('eaw_PI_ATLAS', 016, 'eaw_PI_016.dds', 2, 1),
  
  ('eaw_flag_ATLAS', 32, 'EAW_flag_32.dds', 9, 1);

----- Promo
INSERT INTO UnitPromotions (Type, Description, Help, Sound, OrderPriority, CannotBeChosen, InterceptionDefenseDamageModifier, EvasionChange, LostWithUpgrade, PortraitIndex, IconAtlas, PediaType, PediaEntry)
VALUES
  ('PROMOTION_JET_DOM', 'TXT_KEY_PROMOTION_JET_DOM', 'TXT_KEY_PROMOTION_JET_DOM_HELP', 'AS2D_IF_LEVELUP', 1, 'true', -10, 10, 0, 0, 'eaw_PI_ATLAS', 'PEDIA_AIR', 'TXT_KEY_PEDIA_PROMOTION_JET_DOM');

INSERT INTO UnitPromotions_UnitCombatMods	(PromotionType, UnitCombatType, Modifier)
VALUES
	('PROMOTION_JET_DOM', 'UNITCOMBAT_FIGHTER', 10);
	
	

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
