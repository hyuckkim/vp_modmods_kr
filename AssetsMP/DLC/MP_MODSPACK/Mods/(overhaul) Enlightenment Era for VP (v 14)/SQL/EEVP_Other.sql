----------------------------------------------------
-- Enlightenment Era (Vox Populi)
-- UNITS
-- 2018-02-01 Reworked by Infixo from EE & VP-EE mods
-- 2023-11-06 Updated by CAYM to be compatible with VP 4.2.7
----------------------------------------------------

----------------------------------------------------
-- CUSTOM MOD OPTIONS
----------------------------------------------------
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'CORE_AREA_EFFECT_PROMOTIONS';

----------------------------------------------------
-- WORLD CONGRESS
----------------------------------------------------

INSERT INTO LeagueSpecialSessions
	(Type, Description, Help, SessionSplashImage,
	EraTrigger, ImmediateProposal, TurnsBetweenSessions, CivDelegates, HostDelegates, CityStateDelegates)
VALUES
	('LEAGUE_SPECIAL_SESSION_WORLD_ASSEMBLY', 'TXT_KEY_LEAGUE_SPECIAL_SESSION_WORLD_ASSEMBLY','TXT_KEY_LEAGUE_SPECIAL_SESSION_WORLD_ASSEMBLY_HELP','WorldCongress.dds',
	'ERA_MODERN', 'RESOLUTION_CHANGE_LEAGUE_HOST', 10, 3, 2, 1);

INSERT INTO LeagueNames (Type, NameKey)
VALUES ('LEAGUE_NAME_ASSEMBLY', 'TXT_KEY_LEAGUE_WORLD_CONGRESS_4');

UPDATE LeagueSpecialSessions SET EraTrigger = 'ERA_ENLIGHTENMENT' WHERE Type = 'LEAGUE_SPECIAL_SESSION_WELCOME_CITY_STATES';
UPDATE LeagueSpecialSessions SET EraTrigger = 'ERA_INDUSTRIAL' WHERE Type = 'LEAGUE_SPECIAL_SESSION_LEADERSHIP_COUNCIL';
UPDATE LeagueSpecialSessions SET TurnsBetweenSessions = 15 WHERE EraTrigger = 'ERA_INDUSTRIAL';


----------------------------------------------------
-- Other RER tweaks
----------------------------------------------------
-- Landsknecht

--UPDATE ArtDefine_StrategicView
--SET Asset = 'sv_Landsknecht.dds'
--WHERE StrategicViewType = 'ART_DEF_UNIT_U_GERMAN_LANDSKNECHT';

--UPDATE Units
--SET UnitFlagIconOffset = 0, UnitFlagAtlas = 'UNIT_FLAG_LANDSKNECHT_ATLAS'
--WHERE Type = 'UNIT_GERMAN_LANDSKNECHT';

-- Tercio
UPDATE ArtDefine_UnitMemberInfos
SET Model = 'TER_PIKE_piquero.fxsxml'
WHERE Type = 'ART_DEF_UNIT_MEMBER_U_SPANISH_TERCIO_PIQUERO';

-- Pikeman
UPDATE ArtDefine_UnitMemberInfos
SET Model = 'RER_PIKE.fxsxml'
WHERE Type = 'ART_DEF_UNIT_MEMBER_PIKEMAN';

-- New icon for Cuirassier
UPDATE Units
SET PortraitIndex = 1, IconAtlas = 'RER_UNITS_ATLAS'
WHERE Type = 'UNIT_CUIRASSIER';

----------------------------------------------------
-- ArtDef
----------------------------------------------------
UPDATE Units SET PortraitIndex = '0', IconAtlas = 'RER_BOMBARD_ATLAS', UnitFlagAtlas = 'RER_BOMBARD_FLAG_ATLAS', UnitFlagIconOffset = 0 WHERE Type = 'UNIT_CANNON';
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.13, Model = 'RER_bombard.fxsxml' WHERE Type = 'ART_DEF_UNIT_MEMBER_CANNON';
UPDATE ArtDefine_StrategicView SET Asset = 'sv_Bombard.dds' WHERE StrategicViewType = 'ART_DEF_UNIT_CANNON';

-----------------------------
-- HOWITZER PORTRAIT CHANGED
------------------------------
INSERT INTO IconTextureAtlases 
	    (Atlas, 	               		IconSize, 	           Filename, 			IconsPerRow, 	IconsPerColumn)
VALUES		
            ('UNIT_HOWITZER_ATLAS', 			256, 		'Howitzer_256.dds',		1, 				1),
	    ('UNIT_HOWITZER_ATLAS', 			128, 		'Howitzer_128.dds',		1, 				1),
	    ('UNIT_HOWITZER_ATLAS', 			80, 		'Howitzer_080.dds',		1, 				1),
	    ('UNIT_HOWITZER_ATLAS', 			64, 		'Howitzer_064.dds',		1, 				1),
	    ('UNIT_HOWITZER_ATLAS', 			45, 		'Howitzer_045.dds',		1, 				1);

UPDATE Units SET PortraitIndex = '0', IconAtlas = 'UNIT_HOWITZER_ATLAS' WHERE Type = 'UNIT_FIELD_GUN';

---------------------------
-- Grocer with Era-appropriate icon and name
---------------------------
UPDATE Language_en_US
SET Text = 'Apothecary'
WHERE Tag = 'TXT_KEY_BUILDING_GROCER';

UPDATE Buildings SET 
PortraitIndex = 8, 
IconAtlas = 'ENLIGHTENMENT_BUILDING_ATLAS'
WHERE Type = 'BUILDING_GROCER';

----------------------------------------------------
-- ICONS
----------------------------------------------------
INSERT INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn) VALUES
('TECH_ATLAS_DLC_07',256,'TechnologyAtlas256_DLC_07.dds',3,3),
('TECH_ATLAS_DLC_07',214,'TechnologyAtlas214_DLC_07.dds',3,3),
('TECH_ATLAS_DLC_07',128,'TechnologyAtlas128_DLC_07.dds',3,3),
('TECH_ATLAS_DLC_07',80,'TechnologyAtlas80_DLC_07.dds',3,3),
('TECH_ATLAS_DLC_07',64,'TechnologyAtlas64_DLC_07.dds',3,3),
('TECH_ATLAS_DLC_07',45,'TechnologyAtlas45_DLC_07.dds',3,3),
('ENLIGHTENMENT_UNIT_FLAG_ATLAS',32,'Enlightenment_UnitFlags_32.dds',4,3),
('ENLIGHTENMENT_WONDER_ATLAS',256,'Enlightenment_Wonders_256.dds',5,2),
('ENLIGHTENMENT_WONDER_ATLAS',128,'Enlightenment_Wonders_128.dds',5,2),
('ENLIGHTENMENT_WONDER_ATLAS',80,'Enlightenment_Wonders_80.dds',5,2),
('ENLIGHTENMENT_WONDER_ATLAS',64,'Enlightenment_Wonders_64.dds',5,2),
('ENLIGHTENMENT_WONDER_ATLAS',45,'Enlightenment_Wonders_45.dds',5,2),
('ENLIGHTENMENT_TECH_ATLAS',256,'Enlightenment_Techs_256.dds',4,3),
('ENLIGHTENMENT_TECH_ATLAS',214,'Enlightenment_Techs_214.dds',4,3),
('ENLIGHTENMENT_TECH_ATLAS',128,'Enlightenment_Techs_128.dds',4,3),
('ENLIGHTENMENT_TECH_ATLAS',80,'Enlightenment_Techs_80.dds',4,3),
('ENLIGHTENMENT_TECH_ATLAS',64,'Enlightenment_Techs_64.dds',4,3),
('ENLIGHTENMENT_TECH_ATLAS',45,'Enlightenment_Techs_45.dds',4,3),
('ENLIGHTENMENT_BUILDING_ATLAS',256,'Enlightenment_Buildings_256.dds',4,3),
('ENLIGHTENMENT_BUILDING_ATLAS',128,'Enlightenment_Buildings_128.dds',4,3),
('ENLIGHTENMENT_BUILDING_ATLAS',80,'Enlightenment_Buildings_80.dds',4,3),
('ENLIGHTENMENT_BUILDING_ATLAS',64,'Enlightenment_Buildings_64.dds',4,3),
('ENLIGHTENMENT_BUILDING_ATLAS',45,'Enlightenment_Buildings_45.dds',4,3),
('ENLIGHTENMENT_UNIT_ATLAS',256,'Enlightenment_Units_256.dds',4,3),
('ENLIGHTENMENT_UNIT_ATLAS',128,'Enlightenment_Units_128.dds',4,3),
('ENLIGHTENMENT_UNIT_ATLAS',80,'Enlightenment_Units_80.dds',4,3),
('ENLIGHTENMENT_UNIT_ATLAS',64,'Enlightenment_Units_64.dds',4,3),
('ENLIGHTENMENT_UNIT_ATLAS',45,'Enlightenment_Units_45.dds',4,3),
('CIVIL_WAR_RESOURCE_ATLAS_EXP2',214,'EE_Flintlock_214.dds',1,1), -- these are missing in vanilla game
('CIVIL_WAR_RESOURCE_ATLAS_EXP2',128,'EE_Flintlock_128.dds',1,1), -- these are missing in vanilla game
('EECBO_ICON_ATLAS',256,'Mausoleum256.dds',1,1),
('EECBO_ICON_ATLAS',128,'Mausoleum128.dds',1,1),
('EECBO_ICON_ATLAS',64,'Mausoleum64.dds',1,1),
('EECBO_ICON_ATLAS',45,'Mausoleum45.dds',1,1),
('vpee_promoAtlas', 256, 'VPEE_promo_icons_256.dds', '8', '1'),
('vpee_promoAtlas', 064, 'VPEE_promo_icons_064.dds', '8', '1'),
('vpee_promoAtlas', 045, 'VPEE_promo_icons_045.dds', '8', '1'),
('vpee_promoAtlas', 032, 'VPEE_promo_icons_032.dds', '8', '1'),
('vpee_promoAtlas', 016, 'VPEE_promo_icons_016.dds', '8', '1'),
('RER_UNITS_ATLAS', 256, 'RER_UNITS_atlas_256.dds', 2, 1),
('RER_UNITS_ATLAS', 128, 'RER_UNITS_atlas_128.dds', 2, 1),
('RER_UNITS_ATLAS', 80, 'RER_UNITS_atlas_80.dds',  2, 1),
('RER_UNITS_ATLAS', 64, 'RER_UNITS_atlas_64.dds',  2, 1),
('RER_UNITS_ATLAS', 45, 'RER_UNITS_atlas_45.dds',  2, 1),
('vpee_promoAtlas', 256, 'VPEE_promo_icons_256.dds', '8', '1'),
('vpee_promoAtlas', 64, 'VPEE_promo_icons_064.dds', '8', '1'),
('vpee_promoAtlas', 45, 'VPEE_promo_icons_045.dds', '8', '1'),
('vpee_promoAtlas', 32, 'VPEE_promo_icons_032.dds', '8', '1'),
('vpee_promoAtlas', 16, 'VPEE_promo_icons_016.dds', '8', '1'),
('UNIT_FLAG_LANDSKNECHT_ATLAS', 32, 'LandsknechtFlag.dds', 1, 1),
('RER_BOMBARD_ATLAS', 256, 'Bombard_256.dds', 1, 1),
('RER_BOMBARD_ATLAS', 128, 'Bombard_128.dds', 1, 1),
('RER_BOMBARD_ATLAS', 80, 'Bombard_080.dds',  1, 1),
('RER_BOMBARD_ATLAS', 64, 'Bombard_064.dds',  1, 1),
('RER_BOMBARD_ATLAS', 45, 'Bombard_045.dds',  1, 1),
('RER_BOMBARD_FLAG_ATLAS', 32, 'BombardFlag.dds',  1, 1);

----------------------------------------------------
-- SOUNDS
----------------------------------------------------

INSERT INTO Audio_Sounds (SoundID, Filename, LoadType) VALUES
('SND_TECH_EE_FLINTLOCK', 'Flintlock', 'DynamicResident'),
('SND_TECH_EE_FORTIFICATION', 'Fortification', 'DynamicResident'),
('SND_TECH_EE_HUMANISM', 'Humanism', 'DynamicResident'),
('SND_TECH_EE_MANUFACTURING', 'Manufacturing', 'DynamicResident'),
('SND_TECH_EE_ROMANTICISM', 'Romanticism', 'DynamicResident'),
('SND_TECH_EE_SOVEREIGNTY', 'Sovereignty', 'DynamicResident'),
('SND_ERA_SPEECH_ENLIGHTENMENT_ERA01', 'EnlightenmentEra01', 'DynamicResident'),
('SND_ERA_SPEECH_ENLIGHTENMENT_ERA02', 'EnlightenmentEra02', 'DynamicResident'),
('SND_ERA_SPEECH_ENLIGHTENMENT_ERA03', 'EnlightenmentEra03', 'DynamicResident'),
('SND_ERA_SPEECH_ENLIGHTENMENT_ERA04', 'TechMedHumanism', 'DynamicResident'),
('SND_WONDER_SPEECH_EE_TOPKAPI', 'TopkapiAudio', 'DynamicResident'),
('SND_WONDER_SPEECH_EE_TORRE', 'TorreDelOroAudio', 'DynamicResident'),
('SND_WONDER_SPEECH_EE_WAT_PHRA_KAEW', 'WatPhraKaewAudio', 'DynamicResident'),
('SND_WONDER_SPEECH_EE_KRONBORG', 'KronborgAudio', 'DynamicResident'),
('SND_WONDER_SPEECH_EE_FASIL_GHEBBI', 'FasilGhebbiAudio', 'DynamicResident'),
('SND_WONDER_SPEECH_EE_VERSAILLES', 'VersaillesAudio', 'DynamicResident'),
('SND_WONDER_SPEECH_EE_CRYSTAL_PALACE', 'CrystalPalaceAudio', 'DynamicResident'),
('SND_WONDER_SPEECH_EE_SMITHSONIAN', 'SmithsonianAudio', 'DynamicResident');

INSERT INTO Audio_2DSounds (ScriptID,SoundID,SoundType,MinVolume,MaxVolume) VALUES
('AS2D_TECH_EE_FLINTLOCK', 'SND_TECH_EE_FLINTLOCK', 'GAME_SPEECH',80,80),
('AS2D_TECH_EE_FORTIFICATION', 'SND_TECH_EE_FORTIFICATION', 'GAME_SPEECH',80,80),
('AS2D_TECH_EE_HUMANISM', 'SND_TECH_EE_HUMANISM', 'GAME_SPEECH',80,80),
('AS2D_TECH_EE_MANUFACTURING', 'SND_TECH_EE_MANUFACTURING', 'GAME_SPEECH',80,80),
('AS2D_TECH_EE_ROMANTICISM', 'SND_TECH_EE_ROMANTICISM', 'GAME_SPEECH',80,80),
('AS2D_TECH_EE_SOVEREIGNTY', 'SND_TECH_EE_SOVEREIGNTY', 'GAME_SPEECH',80,80),
('AS2D_ERA_SPEECH_ENLIGHTENMENT_ERA01', 'SND_ERA_SPEECH_ENLIGHTENMENT_ERA01', 'GAME_SPEECH',80,80),
('AS2D_ERA_SPEECH_ENLIGHTENMENT_ERA02', 'SND_ERA_SPEECH_ENLIGHTENMENT_ERA02', 'GAME_SPEECH',80,80),
('AS2D_ERA_SPEECH_ENLIGHTENMENT_ERA03', 'SND_ERA_SPEECH_ENLIGHTENMENT_ERA03', 'GAME_SPEECH',80,80),
('AS2D_ERA_SPEECH_ENLIGHTENMENT_ERA04', 'SND_ERA_SPEECH_ENLIGHTENMENT_ERA04', 'GAME_SPEECH',80,80),
('AS2D_WONDER_SPEECH_EE_TOPKAPI', 'SND_WONDER_SPEECH_EE_TOPKAPI', 'GAME_SPEECH',80,80),
('AS2D_WONDER_SPEECH_EE_TORRE', 'SND_WONDER_SPEECH_EE_TORRE', 'GAME_SPEECH',80,80),
('AS2D_WONDER_SPEECH_EE_WAT_PHRA_KAEW', 'SND_WONDER_SPEECH_EE_WAT_PHRA_KAEW', 'GAME_SPEECH',80,80),
('AS2D_WONDER_SPEECH_EE_KRONBORG', 'SND_WONDER_SPEECH_EE_KRONBORG', 'GAME_SPEECH',80,80),
('AS2D_WONDER_SPEECH_EE_FASIL_GHEBBI', 'SND_WONDER_SPEECH_EE_FASIL_GHEBBI', 'GAME_SPEECH',80,80),
('AS2D_WONDER_SPEECH_EE_VERSAILLES', 'SND_WONDER_SPEECH_EE_VERSAILLES', 'GAME_SPEECH',80,80),
('AS2D_WONDER_SPEECH_EE_CRYSTAL_PALACE', 'SND_WONDER_SPEECH_EE_CRYSTAL_PALACE', 'GAME_SPEECH',80,80),
('AS2D_WONDER_SPEECH_EE_SMITHSONIAN', 'SND_WONDER_SPEECH_EE_SMITHSONIAN', 'GAME_SPEECH',80,80);
