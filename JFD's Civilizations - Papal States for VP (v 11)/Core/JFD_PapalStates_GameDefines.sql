--==========================================================================================================================	
-- CUSTOM MOD OPTIONS
--==========================================================================================================================	
-- CustomModOptions
------------------------------	
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'YIELD_MODIFIER_FROM_UNITS';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_GREAT_PEOPLE';
--==========================================================================================================================	
-- LANGUAGE_EN_US
--==========================================================================================================================	
-- Language_en_US
--------------------------------	
DELETE FROM Language_en_US WHERE Tag = 'TXT_KEY_GREAT_WORK_REQUIEM'; -- 16/08/20 version of VP added a Requiem great work of music
--=======================================================================================================================
-- BUILDINGCLASSES
--=======================================================================================================================
-- BuildingClasses
------------------------------	
INSERT INTO BuildingClasses 	
		(Type, 						 		DefaultBuilding, 				Description)
VALUES	('BUILDINGCLASS_JFD_CHAPEL_WRITING','BUILDING_JFD_CHAPEL_WRITING',	'TXT_KEY_BUILDING_JFD_CHAPEL_WRITING'),
		('BUILDINGCLASS_JFD_CHAPEL_ART',	'BUILDING_JFD_CHAPEL_ART',		'TXT_KEY_BUILDING_JFD_CHAPEL_ART'),
		('BUILDINGCLASS_JAR_EMBASSY_D', 	'BUILDING_JAR_EMBASSY_D',		'TXT_KEY_BUILDING_JAR_EMBASSY_D');
UPDATE BuildingClasses SET NoLimit=1 WHERE Type='BUILDINGCLASS_JAR_EMBASSY_D';
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------
INSERT OR REPLACE INTO Buildings
(Type, 						 BuildingClass, 				IsDummy,	Cost,	FaithCost,	GreatWorkCount,	PrereqTech,	MinAreaSize,	Description) VALUES
('BUILDING_JAR_EMBASSY_D', 	'BUILDINGCLASS_JAR_EMBASSY_D',		1,		-1,		-1,			-1,				null,		-1,				'TXT_KEY_BUILDING_JAR_EMBASSY_D');

INSERT INTO Buildings 	
		(Type, 							BuildingClass,	GreatWorkSlotType, 			GreatWorkCount,	PrereqTech, Cost,		GoldMaintenance,	HurryCostModifier, MinAreaSize, Description, 							Civilopedia, 						Help, 									Strategy,									ArtDefineTag, PortraitIndex, 	IconAtlas,					MaxStartEra, ReligiousPressureModifier, ReligiousUnrestFlatReduction)
SELECT	('BUILDING_JFD_CHAPEL_MUSIC'),	BuildingClass,	('GREAT_WORK_SLOT_MUSIC'),  2, 				PrereqTech, Cost*0.75,	0,					HurryCostModifier, MinAreaSize, ('TXT_KEY_BUILDING_JFD_CHAPEL_MUSIC'), 	('TXT_KEY_CIV5_JFD_CHAPEL_TEXT'),   ('TXT_KEY_BUILDING_JFD_CHAPEL_HELP'), 	('TXT_KEY_BUILDING_JFD_CHAPEL_STRATEGY'),	ArtDefineTag, 4, 				('JFD_PAPAL_STATES_ATLAS'),	MaxStartEra, ReligiousPressureModifier, ReligiousUnrestFlatReduction
FROM Buildings WHERE Type = 'BUILDING_TEMPLE';	

INSERT INTO Buildings 	
		(Type, 							BuildingClass,						GreatWorkSlotType, 				   GreatWorkCount,	PrereqTech, Cost,		GoldMaintenance,	HurryCostModifier, MinAreaSize, Description, 							Civilopedia, 						Help, 										Strategy,									ArtDefineTag, PortraitIndex, 	IconAtlas,					MaxStartEra, ReligiousPressureModifier)
SELECT	('BUILDING_JFD_CHAPEL_ART'),	('BUILDINGCLASS_JFD_CHAPEL_ART'),	('GREAT_WORK_SLOT_ART_ARTIFACT'),  2, 				PrereqTech,	Cost*0.75,	0,					HurryCostModifier, MinAreaSize, ('TXT_KEY_BUILDING_JFD_CHAPEL_ART'), 	('TXT_KEY_CIV5_JFD_CHAPEL_TEXT'),   ('TXT_KEY_BUILDING_JFD_CHAPEL_ART_HELP'), 	('TXT_KEY_BUILDING_JFD_CHAPEL_STRATEGY'),	ArtDefineTag, 4, 				('JFD_PAPAL_STATES_ATLAS'),	MaxStartEra, ReligiousPressureModifier
FROM Buildings WHERE Type = 'BUILDING_TEMPLE';		

INSERT INTO Buildings 	
		(Type, 								BuildingClass,							GreatWorkSlotType, 				GreatWorkCount,	PrereqTech, Cost,		GoldMaintenance,	HurryCostModifier, MinAreaSize, Description, 								Civilopedia, 						Help, 											Strategy,									ArtDefineTag, PortraitIndex, 	IconAtlas,					MaxStartEra, ReligiousPressureModifier)
SELECT	('BUILDING_JFD_CHAPEL_WRITING'),	('BUILDINGCLASS_JFD_CHAPEL_WRITING'),	('GREAT_WORK_SLOT_LITERATURE'),	2, 				PrereqTech, Cost*0.75,	0,					HurryCostModifier, MinAreaSize, ('TXT_KEY_BUILDING_JFD_CHAPEL_WRITING'), 	('TXT_KEY_CIV5_JFD_CHAPEL_TEXT'),   ('TXT_KEY_BUILDING_JFD_CHAPEL_WRITING_HELP'), 	('TXT_KEY_BUILDING_JFD_CHAPEL_STRATEGY'),	ArtDefineTag, 4, 				('JFD_PAPAL_STATES_ATLAS'),	MaxStartEra, ReligiousPressureModifier
FROM Buildings WHERE Type = 'BUILDING_TEMPLE';

UPDATE Buildings SET CivilizationRequired = 'CIVILIZATION_JFD_PAPAL_STATES' WHERE Type IN ('BUILDING_JFD_CHAPEL_ART', 'BUILDING_JFD_CHAPEL_WRITING');
UPDATE Buildings SET ThemingBonusHelp = 'TXT_KEY_JFD_CHAPEL_MUSIC_THEMING_BONUS_HELP' WHERE Type = 'BUILDING_JFD_CHAPEL_MUSIC';
UPDATE Buildings SET ThemingBonusHelp = 'TXT_KEY_JFD_CHAPEL_ART_THEMING_BONUS_HELP' WHERE Type = 'BUILDING_JFD_CHAPEL_ART';
UPDATE Buildings SET ThemingBonusHelp = 'TXT_KEY_JFD_CHAPEL_WRITING_THEMING_BONUS_HELP' WHERE Type = 'BUILDING_JFD_CHAPEL_WRITING';
------------------------------
-- Building_YieldChanges
------------------------------
INSERT INTO Building_YieldChanges 
		(BuildingType, YieldType, Yield)
SELECT	'BUILDING_JFD_CHAPEL_MUSIC', YieldType, 2
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_TEMPLE'
UNION ALL
SELECT	'BUILDING_JFD_CHAPEL_WRITING', YieldType, 2
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_TEMPLE'
UNION ALL
SELECT	'BUILDING_JFD_CHAPEL_ART', YieldType, 2
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_TEMPLE';
------------------------------	
-- Building_ClassesNeededInCity
------------------------------	
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 					BuildingClassType)
SELECT	('BUILDING_JFD_CHAPEL_MUSIC'),	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_TEMPLE';	

INSERT INTO Building_ClassesNeededInCity 	
			(BuildingType, 				BuildingClassType)
VALUES	('BUILDING_JFD_CHAPEL_ART',		'BUILDINGCLASS_TEMPLE'),
		('BUILDING_JFD_CHAPEL_WRITING',	'BUILDINGCLASS_TEMPLE');
------------------------------	
-- Building_Flavors
------------------------------	
INSERT INTO Building_Flavors 	
			(BuildingType, FlavorType, Flavor)
SELECT		'BUILDING_JFD_CHAPEL_MUSIC', FlavorType, Flavor+5
FROM Building_Flavors WHERE BuildingType = 'BUILDING_TEMPLE'
UNION ALL
SELECT		'BUILDING_JFD_CHAPEL_ART', FlavorType, Flavor+5
FROM Building_Flavors WHERE BuildingType = 'BUILDING_TEMPLE'
UNION ALL
SELECT		'BUILDING_JFD_CHAPEL_WRITING', FlavorType, Flavor+5
FROM Building_Flavors WHERE BuildingType = 'BUILDING_TEMPLE';
------------------------------
-- Building_ResourceYieldChanges 
------------------------------
INSERT INTO Building_ResourceYieldChanges
			(BuildingType, ResourceType, YieldType, Yield)
SELECT		'BUILDING_JFD_CHAPEL_MUSIC', ResourceType, YieldType, Yield
FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_TEMPLE';
--------------------------------	
-- Building_YieldFromYieldPercent
--------------------------------
INSERT INTO Building_YieldFromYieldPercent
		(BuildingType, 					YieldIn, 		YieldOut, 			Value)
VALUES	('BUILDING_JFD_CHAPEL_MUSIC', 	'YIELD_FAITH', 	'YIELD_PRODUCTION', 7),
		('BUILDING_JFD_CHAPEL_ART', 	'YIELD_FAITH', 	'YIELD_FOOD', 		7),
		('BUILDING_JFD_CHAPEL_WRITING', 'YIELD_FAITH', 	'YIELD_SCIENCE',	7); --
------------------------------
-- Building_ThemingBonuses 
------------------------------
INSERT INTO Building_ThemingBonuses
			(BuildingType, Description, Bonus, MustBeArt, RequiresOwner, AIPriority)
VALUES		('BUILDING_JFD_CHAPEL_MUSIC', 'TXT_KEY_THEMING_BONUS_CHAPEL_MUSIC', 3, null, 1, 2),
			('BUILDING_JFD_CHAPEL_ART', 'TXT_KEY_THEMING_BONUS_CHAPEL_ART', 3, 1, 1, 2),
			('BUILDING_JFD_CHAPEL_WRITING', 'TXT_KEY_THEMING_BONUS_CHAPEL_WRITING', 3, null, 1, 2);
------------------------------
-- Building_ThemingYieldBonus 
------------------------------
INSERT INTO Building_ThemingYieldBonus
			(BuildingType, YieldType, Yield)
VALUES		('BUILDING_JFD_CHAPEL_MUSIC', 'YIELD_CULTURE', 3),
			('BUILDING_JFD_CHAPEL_ART', 'YIELD_GOLDEN_AGE_POINTS', 3),
			('BUILDING_JFD_CHAPEL_WRITING', 'YIELD_GOLD', 3);
--------------------------------
-- Building_ImprovementYieldChanges
--------------------------------
INSERT INTO Building_ImprovementYieldChanges
		(BuildingType, 				ImprovementType,		YieldType, 		Yield)
VALUES	('BUILDING_JAR_EMBASSY_D', 'IMPROVEMENT_HOLY_SITE',	'YIELD_GOLD', 		1),
		('BUILDING_JAR_EMBASSY_D', 'IMPROVEMENT_HOLY_SITE',	'YIELD_PRODUCTION', 1);
--==========================================================================================================================
-- GREAT WORKS
--==========================================================================================================================
-- GreatWorks
------------------------------
INSERT INTO GreatWorks 
			(Type, 															GreatWorkClassType,			Description,														Quote,																		Audio,																Image)
VALUES		--Artists
			('GREAT_WORK_THE_CRUCIFIXTION_OF_SAINT_PETER', 					'GREAT_WORK_ART',			'TXT_KEY_GREAT_WORK_THE_CRUCIFIXTION_OF_SAINT_PETER',				null,																		'AS2D_DISCIPLE_ARTIST_WRITER',										'GW_Caravaggio--The_Crucifixtion_of_Saint_Peter.dds'),
			('GREAT_WORK_THE_NUN', 											'GREAT_WORK_ART',			'TXT_KEY_GREAT_WORK_THE_NUN',										null,																		'AS2D_DISCIPLE_ARTIST_WRITER',										'GW_Gwen_John--The_Nun.dds'),
			('GREAT_WORK_PAINTING_OF_SAINT_DOMINIC', 						'GREAT_WORK_ART',			'TXT_KEY_GREAT_WORK_PAINTING_OF_ST_DOMINIC',						null,																		'AS2D_DISCIPLE_ARTIST_WRITER',										'GW_Fra_Angelico--St_Dominic.dds'),
			('GREAT_WORK_LAST_JUDGEMENT', 									'GREAT_WORK_ART',			'TXT_KEY_GREAT_WORK_LAST_JUDGEMENT',								null,																		'AS2D_DISCIPLE_ARTIST_WRITER',										'GW_Memling--Last_Judgement.dds'),
			('GREAT_WORK_MADONNA', 											'GREAT_WORK_ART',			'TXT_KEY_GREAT_WORK_MADONNA',										null,																		'AS2D_DISCIPLE_ARTIST_WRITER',										'GW_Raphael--Madonna.dds'),
			('GREAT_WORK_THE_ANNUNCIATION', 								'GREAT_WORK_ART',			'TXT_KEY_GREAT_WORK_THE_ANNUNCIATION',								null,																		'AS2D_DISCIPLE_ARTIST_WRITER',										'GW_Paolo_de_Matteis--The_Annunciation.dds'),
			('GREAT_WORK_MAN_OF_SORROWS', 									'GREAT_WORK_ART',			'TXT_KEY_GREAT_WORK_MAN_OF_SORROWS',								null,																		'AS2D_DISCIPLE_ARTIST_WRITER',										'GW_Man_of_Sorrows_Meister_Francke.dds'),
			('GREAT_WORK_LIBERATION_OF_SAINT_PETER', 						'GREAT_WORK_ART',			'TXT_KEY_GREAT_WORK_THE_LIBERATION_OF_SAINT_PETER',					null,																		'AS2D_DISCIPLE_ARTIST_WRITER',										'GW_Bartolomew_Esteban_Murillo--Liberation_of_St_Peter.dds'),
			('GREAT_WORK_SAINT_PETER_IN_PENITENCE', 						'GREAT_WORK_ART',			'TXT_KEY_GREAT_WORK_SAINT_PETER_IN_PENITENCE',						null,																		'AS2D_DISCIPLE_ARTIST_WRITER',										'GW_El_Greco--Saint_Peter_in_Penitence.dds'),
			('GREAT_WORK_LAMENTATION', 										'GREAT_WORK_ART',			'TXT_KEY_GREAT_WORK_LAMENTATION',									null,																		'AS2D_DISCIPLE_ARTIST_WRITER',										'GW_Scipione_Pulzone--Lamentation.dds'),
			('GREAT_WORK_FRESCO_OF_THE_LAST_JUDGEMENT', 					'GREAT_WORK_ART',			'TXT_KEY_GREAT_WORK_FRESCO_OF_THE_LAST_JUDGEMENT',					null,																		'AS2D_DISCIPLE_ARTIST_WRITER',										'GW_Michelangelo--Fresco_of_the_Last_Judgement.dds'),
			('GREAT_WORK_ADORATION_OF_THE_MAGI', 							'GREAT_WORK_ART',			'TXT_KEY_GREAT_WORK_ADORATION_OF_THE_MAGI',							null,																		'AS2D_DISCIPLE_ARTIST_WRITER',										'GW_Rembrant--Adoration_of_the_Magi.dds'),
			('GREAT_WORK_MADONNA_OF_HUMILITY', 								'GREAT_WORK_ART',			'TXT_KEY_GREAT_WORK_MADONNA_OF_HUMILITY',							null,																		'AS2D_DISCIPLE_ARTIST_WRITER',										'GW_Fra_Angelico--Madonna_of_Humility.dds'),
			('GREAT_WORK_PAINTING_OF_SAINT_SEBASTIAN', 						'GREAT_WORK_ART',			'TXT_KEY_GREAT_WORK_PAINTING_OF_SAINT_SEBASTIAN',					null,																		'AS2D_DISCIPLE_ARTIST_WRITER',										'GW_Sandro_Botticellii--St.Sebastian.dds'),
			('GREAT_WORK_THE_WEDDING_AT_CANA', 								'GREAT_WORK_ART',			'TXT_KEY_GREAT_WORK_THE_WEDDING_AT_CANA',							null,																		'AS2D_DISCIPLE_ARTIST_WRITER',										'GW_Paolo_Veronese--The_Weddeding_at_Cana.dds'),
			('GREAT_WORK_IMMACULATE_CONCEPTION', 							'GREAT_WORK_ART',			'TXT_KEY_GREAT_WORK_IMMACULATE_CONCEPTION',							null,																		'AS2D_DISCIPLE_ARTIST_WRITER',										'GW_Murillo--Immaculate_Conception.dds'),
			--Musicians
			('GREAT_WORK_MISEREREI_MEI_DEUS', 								'GREAT_WORK_MUSIC',			'TXT_KEY_GREAT_WORK_MISEREREI_MEI_DEUS',							null,																		'AS2D_GREAT_MUSICIAN_ALLEGRIS_MISEREREI_MEI_DEUS',					'GreatMusician_Background.dds'),
			('GREAT_WORK_ALMA_REDEMPTORIS_MATER', 							'GREAT_WORK_MUSIC',			'TXT_KEY_GREAT_WORK_ALMA_REDEMPTORIS_MATER',						null,																		'AS2D_GREAT_MUSICIAN_PALESTRINAS_ALMA_REDEMPTORIS_MATER',			'GreatMusician_Background.dds'),
			('GREAT_WORK_MISSA_ET_ECCE_TERRAE_MOTUS_GLORIA',				'GREAT_WORK_MUSIC',			'TXT_KEY_GREAT_WORK_MISSA_ET_ECCE_TERRAE_MOTUS_GLORIA',				null,																		'AS2D_GREAT_MUSICIAN_BRUMELS_MISSA_ET_ECCE_TERRAE_MOTUS_GLORIA',	'GreatMusician_Background.dds'),
			('GREAT_WORK_MISSA_PAPAE_MARCELLI_CREDO', 						'GREAT_WORK_MUSIC',			'TXT_KEY_GREAT_WORK_MISSA_PAPAE_MARCELLI_CREDO',					null,																		'AS2D_GREAT_MUSICIAN_PALESTRINAS_MISSA_PAPAE_MARCELLI_CREDO',		'GreatMusician_Background.dds'),
			('GREAT_WORK_O_MORS_INEVITABILIS', 								'GREAT_WORK_MUSIC',			'TXT_KEY_GREAT_WORK_O_MORS_INEVITABILIS',							null,																		'AS2D_GREAT_MUSICIAN_VANDERS_O_MORS_INEVITABILIS',					'GreatMusician_Background.dds'),
			('GREAT_WORK_MEDIA_VITA', 										'GREAT_WORK_MUSIC',			'TXT_KEY_GREAT_WORK_MEDIA_VITA',									null,																		'AS2D_GREAT_MUSICIAN_SHEPPARDS_MEDIA_VITA',							'GreatMusician_Background.dds'),
			('GREAT_WORK_INTEMERATA', 										'GREAT_WORK_MUSIC',			'TXT_KEY_GREAT_WORK_INTEMERATA',									null,																		'AS2D_GREAT_MUSICIAN_OCKEGHEMS_INTEMERATA',							'GreatMusician_Background.dds'),
			('GREAT_WORK_AVE_MARIA', 										'GREAT_WORK_MUSIC',			'TXT_KEY_GREAT_WORK_AVE_MARIA',										null,																		'AS2D_GREAT_MUSICIAN_SCHUBERTS_AVE_MARIA',							'GreatMusician_Background.dds'),
			('GREAT_WORK_REQUIEM_DIES_IRAE', 								'GREAT_WORK_MUSIC',			'TXT_KEY_GREAT_WORK_REQUIEM_DIES_IRAE',								null,																		'AS2D_GREAT_MUSICIAN_VERDIS_REQUIEM',								'GreatMusician_Background.dds'),
			('GREAT_WORK_REQUIEM', 											'GREAT_WORK_MUSIC',			'TXT_KEY_GREAT_WORK_REQUIEM',										null,																		'AS2D_GREAT_MUSICIAN_MOZARTS_REQUIEM',								'GreatMusician_Background.dds'),
			--Writers
			('GREAT_WORK_HOW_TO_DRESS_FOR_EVERY_OCCASSION_BY_THE_POPE', 	'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_HOW_TO_DRESS_FOR_EVERY_OCCASSION_BY_THE_POPE',	'TXT_KEY_GREAT_WORK_QUOTE_HOW_TO_DRESS_FOR_EVERY_OCCASSION_BY_THE_POPE',	'AS2D_DISCIPLE_ARTIST_WRITER',										'GreatWriter_Background.dds'),
			('GREAT_WORK_THE_SOULS_JOURNEY_TO_GOD', 						'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_THE_SOULS_JOURNEY_TO_GOD',						'TXT_KEY_GREAT_WORK_QUOTE_THE_SOULS_JOURNEY_TO_GOD',						'AS2D_DISCIPLE_ARTIST_WRITER',										'GreatWriter_Background.dds'),
			('GREAT_WORK_THE_PRACTICE_OF_THE_PRESCENCE_OF_GOD', 			'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_THE_PRACTICE_OF_THE_PRESCENCE_OF_GOD',			'TXT_KEY_GREAT_WORK_QUOTE_THE_PRACTICE_OF_THE_PRESCENCE_OF_GOD',			'AS2D_DISCIPLE_ARTIST_WRITER',										'GreatWriter_Background.dds'),
			('GREAT_WORK_THE_PARSONS_TALE', 								'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_THE_PARSONS_TALE',								'TXT_KEY_GREAT_WORK_QUOTE_THE_PARSONS_TALE',								'AS2D_DISCIPLE_ARTIST_WRITER',										'GreatWriter_Background.dds'),
			('GREAT_WORK_THE_LETTERS_OF_SAINT_CATHERINE_OF_SIENA', 			'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_THE_LETTERS_OF_SAINT_CATHERINE_OF_SIENA',		'TXT_KEY_GREAT_WORK_QUOTE_THE_LETTERS_OF_SAINT_CATHERINE_OF_SIENAE',		'AS2D_DISCIPLE_ARTIST_WRITER',										'GreatWriter_Background.dds'),
			('GREAT_WORK_THE_DIVINE_COMEDY', 								'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_THE_DIVINE_COMEDY',								'TXT_KEY_GREAT_WORK_QUOTE_HE_DIVINE_COMEDY',								'AS2D_DISCIPLE_ARTIST_WRITER',										'GreatWriter_Background.dds'),
			('GREAT_WORK_THE_BETHROTHED', 									'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_THE_BETHROTHED',								'TXT_KEY_GREAT_WORK_QUOTE_THE_BETHROTHED',									'AS2D_DISCIPLE_ARTIST_WRITER',										'GreatWriter_Background.dds'),
			('GREAT_WORK_THE_LIFE_OF_SAINT_TERESA_OF_AVILA_BY_HERSELF', 	'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_THE_LIFE_OF_SAINT_TERESA_OF_AVILA_BY_HERSELF',	'TXT_KEY_GREAT_WORK_QUOTE_THE_LIFE_OF_SAINT_TERESA_OF_AVILA_BY_HERSELF',	'AS2D_DISCIPLE_ARTIST_WRITER',										'GreatWriter_Background.dds'),
			('GREAT_WORK_INTRODUCTION_TO_THE_DEVOUT_LIFE', 					'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_INTRODUCTION_TO_THE_DEVOUT_LIFE',				'TXT_KEY_GREAT_WORK_QUOTE_INTRODUCTION_TO_THE_DEVOUT_LIFE',					'AS2D_DISCIPLE_ARTIST_WRITER',										'GreatWriter_Background.dds'),
			('GREAT_WORK_ASCENT_OF_MOUNT_CARMEL', 							'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_ASCENT_OF_MOUNT_CARMEL',						'TXT_KEY_GREAT_WORK_QUOTE_ASCENT_OF_MOUNT_CARMEL',							'AS2D_DISCIPLE_ARTIST_WRITER',										'GreatWriter_Background.dds'),
			('GREAT_WORK_DIES_IRAE', 										'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_DIES_IRAE',										'TXT_KEY_GREAT_WORK_QUOTE_DIES_IRAE',										'AS2D_DISCIPLE_ARTIST_WRITER',										'GreatWriter_Background.dds'),
			('GREAT_WORK_SUMMA_THEOLOGICA', 								'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_SUMMA_THEOLOGICA',								'TXT_KEY_GREAT_WORK_QUOTE_SUMMA_THEOLOGICA',								'AS2D_DISCIPLE_ARTIST_WRITER',										'GreatWriter_Background.dds'),
			('GREAT_WORK_STORY_OF_A_SOUL', 									'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_STORY_OF_A_SOUL',								'TXT_KEY_GREAT_WORK_QUOTE_STORY_OF_A_SOUL',									'AS2D_DISCIPLE_ARTIST_WRITER',										'GreatWriter_Background.dds'),
			('GREAT_WORK_THE_BOOK_OF_PASTORAL_RULE', 						'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_THE_BOOK_OF_PASTORAL_RULE',						'TXT_KEY_GREAT_WORK_QUOTE_THE_BOOK_OF_PASTORAL_RULE',						'AS2D_DISCIPLE_ARTIST_WRITER',										'GreatWriter_Background.dds'),
			('GREAT_WORK_CITY_OF_GOD', 										'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_CITY_OF_GOD',									'TXT_KEY_GREAT_WORK_QUOTE_CITY_OF_GOD',										'AS2D_DISCIPLE_ARTIST_WRITER',										'GreatWriter_Background.dds');
			
INSERT INTO Unit_UniqueNames 
			(UnitType, 			UniqueName,													GreatWorkType)
VALUES		--Artists
			('UNIT_ARTIST', 	'TXT_KEY_GREAT_PERSON_JFD_CARAVAGGIO_DESC',					'GREAT_WORK_THE_CRUCIFIXTION_OF_SAINT_PETER'),
			('UNIT_ARTIST', 	'TXT_KEY_GREAT_PERSON_JFD_GWEN_JOHN_DESC',					'GREAT_WORK_THE_NUN'),
			('UNIT_ARTIST', 	'TXT_KEY_GREAT_PERSON_JFD_FRA_ANGELICO_DESC',				'GREAT_WORK_PAINTING_OF_SAINT_DOMINIC'),
			('UNIT_ARTIST', 	'TXT_KEY_GREAT_PERSON_JFD_RAPHAEL_DESC',					'GREAT_WORK_MADONNA'),
			('UNIT_ARTIST', 	'TXT_KEY_GREAT_PERSON_JFD_MEMLING_DESC',					'GREAT_WORK_LAST_JUDGEMENT'),
			('UNIT_ARTIST', 	'TXT_KEY_GREAT_PERSON_JFD_PAOLO_DE_MATTEIS_DESC',			'GREAT_WORK_THE_ANNUNCIATION'),
			('UNIT_ARTIST', 	'TXT_KEY_GREAT_PERSON_JFD_MEISTER_FRANCKE_DESC',			'GREAT_WORK_MAN_OF_SORROWS'),
			('UNIT_ARTIST', 	'TXT_KEY_GREAT_PERSON_JFD_BARTOLOME_ESTEBAN_MURILLO_DESC',	'GREAT_WORK_LIBERATION_OF_SAINT_PETER'),
			('UNIT_ARTIST', 	'TXT_KEY_GREAT_PERSON_JFD_MICHELANGELO_DESC',				'GREAT_WORK_FRESCO_OF_THE_LAST_JUDGEMENT'),
			('UNIT_ARTIST', 	'TXT_KEY_GREAT_PERSON_JFD_SCIPIONE_PULZONE_DESC',			'GREAT_WORK_LAMENTATION'),
			('UNIT_ARTIST', 	'TXT_KEY_GREAT_PERSON_JFD_EL_GRECO_DESC',					'GREAT_WORK_SAINT_PETER_IN_PENITENCE'),
			('UNIT_ARTIST', 	'TXT_KEY_GREAT_PERSON_JFD_REMBRANT_2_DESC',					'GREAT_WORK_ADORATION_OF_THE_MAGI'),
			('UNIT_ARTIST', 	'TXT_KEY_GREAT_PERSON_JFD_FRA_ANGELICO_2_DESC',				'GREAT_WORK_MADONNA_OF_HUMILITY'),
			('UNIT_ARTIST', 	'TXT_KEY_GREAT_PERSON_JFD_SANDRO_BOTTICELLI_DESC',			'GREAT_WORK_PAINTING_OF_SAINT_SEBASTIAN'),
			('UNIT_ARTIST', 	'TXT_KEY_GREAT_PERSON_JFD_PAOLO_VERONESE_DESC',				'GREAT_WORK_THE_WEDDING_AT_CANA'),
			('UNIT_ARTIST', 	'TXT_KEY_GREAT_PERSON_JFD_MURILLO_DESC',					'GREAT_WORK_IMMACULATE_CONCEPTION'),
			--Musicians
			('UNIT_MUSICIAN', 	'TXT_KEY_GREAT_PERSON_JFD_PALESTRINA_DESC',					'GREAT_WORK_ALMA_REDEMPTORIS_MATER'),
			('UNIT_MUSICIAN', 	'TXT_KEY_GREAT_PERSON_JFD_GREGORIO_ALLEGRI_DESC',			'GREAT_WORK_MISEREREI_MEI_DEUS'),
			('UNIT_MUSICIAN', 	'TXT_KEY_GREAT_PERSON_JFD_PALESTRINA_2_DESC',				'GREAT_WORK_MISSA_PAPAE_MARCELLI_CREDO'),
			('UNIT_MUSICIAN', 	'TXT_KEY_GREAT_PERSON_JFD_JHERONIMUS_VINDERS_DESC',			'GREAT_WORK_O_MORS_INEVITABILIS'),
			('UNIT_MUSICIAN', 	'TXT_KEY_GREAT_PERSON_JFD_ANTOINE_BRUMEL_DESC',				'GREAT_WORK_MISSA_ET_ECCE_TERRAE_MOTUS_GLORIA'),
			('UNIT_MUSICIAN', 	'TXT_KEY_GREAT_PERSON_JFD_JOHN_SHEPPARD_DESC',				'GREAT_WORK_MEDIA_VITA'),
			('UNIT_MUSICIAN', 	'TXT_KEY_GREAT_PERSON_JFD_JOHANNES_OCKEGHEM_DESC',			'GREAT_WORK_INTEMERATA'),
			('UNIT_MUSICIAN', 	'TXT_KEY_GREAT_PERSON_JFD_FRANZ_SCHUBERT_DESC',				'GREAT_WORK_AVE_MARIA'),
			('UNIT_MUSICIAN', 	'TXT_KEY_GREAT_PERSON_JFD_VERDI_DESC',						'GREAT_WORK_REQUIEM_DIES_IRAE'),
			('UNIT_MUSICIAN', 	'TXT_KEY_GREAT_PERSON_JFD_MOZART_2_DESC',					'GREAT_WORK_REQUIEM'),
			--Writers
			('UNIT_WRITER', 	'TXT_KEY_GREAT_PERSON_JFD_THE_POPE_DESC',					'GREAT_WORK_HOW_TO_DRESS_FOR_EVERY_OCCASSION_BY_THE_POPE'),
			('UNIT_WRITER', 	'TXT_KEY_GREAT_PERSON_JFD_SAINT_BONEVENTURE_DESC',			'GREAT_WORK_THE_SOULS_JOURNEY_TO_GOD'),
			('UNIT_WRITER', 	'TXT_KEY_GREAT_PERSON_JFD_BROTHER_LAWRENCE_DESC',			'GREAT_WORK_THE_PRACTICE_OF_THE_PRESCENCE_OF_GOD'),
			('UNIT_WRITER', 	'TXT_KEY_GREAT_PERSON_JFD_GEOFFREY_CHAUCER_DESC',			'GREAT_WORK_THE_PARSONS_TALE'),
			('UNIT_WRITER', 	'TXT_KEY_GREAT_PERSON_JFD_SAINT_CATHERINE_OF_SIENA_DESC',	'GREAT_WORK_THE_LETTERS_OF_SAINT_CATHERINE_OF_SIENA'),
			('UNIT_WRITER', 	'TXT_KEY_GREAT_PERSON_JFD_DANTE_DESC',						'GREAT_WORK_THE_DIVINE_COMEDY'),
			('UNIT_WRITER', 	'TXT_KEY_GREAT_PERSON_JFD_ALESSANDRO_MANZONI_DESC',			'GREAT_WORK_THE_BETHROTHED'),
			('UNIT_WRITER', 	'TXT_KEY_GREAT_PERSON_JFD_TERESA_OF_AVILA_DESC',			'GREAT_WORK_THE_LIFE_OF_SAINT_TERESA_OF_AVILA_BY_HERSELF'),
			('UNIT_WRITER', 	'TXT_KEY_GREAT_PERSON_JFD_ST_FRANCOIS_DE_SALES_DESC',		'GREAT_WORK_INTRODUCTION_TO_THE_DEVOUT_LIFE'),
			('UNIT_WRITER', 	'TXT_KEY_GREAT_PERSON_JFD_SAINT_JOHN_OF_THE_CROSS_DESC',	'GREAT_WORK_ASCENT_OF_MOUNT_CARMEL'),
			('UNIT_WRITER', 	'TXT_KEY_GREAT_PERSON_JFD_THOMAS_OF_CELANO_DESC',			'GREAT_WORK_DIES_IRAE'),
			('UNIT_WRITER', 	'TXT_KEY_GREAT_PERSON_JFD_SAINT_AUGUSTINE_OF_HIPPO_DESC',	'GREAT_WORK_CITY_OF_GOD'),
			('UNIT_WRITER', 	'TXT_KEY_GREAT_PERSON_JFD_SAINT_THOMAS_AQUINAS_DESC',		'GREAT_WORK_SUMMA_THEOLOGICA'),
			('UNIT_WRITER', 	'TXT_KEY_GREAT_PERSON_JFD_SAINT_THERESA_DE_LISIEUX_DESC',	'GREAT_WORK_STORY_OF_A_SOUL'),
			('UNIT_WRITER', 	'TXT_KEY_GREAT_PERSON_JFD_SAINT_GREGORY_THE_GREAT_DESC',	'GREAT_WORK_THE_BOOK_OF_PASTORAL_RULE');
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
			(Type, 				Description, 				Civilopedia, 							CivilopediaTag, 						ArtDefineTag, 		VictoryCompetitiveness,	WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES		('LEADER_JULIUS_II', 'TXT_KEY_LEADER_JULIUS_II', 	'TXT_KEY_LEADER_JULIUS_II_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JULIUS_II', 'JFD_PapalStatesJuliusII_Scene.xml',	9, 						8, 						8, 							8, 			8, 				9, 				7, 						4, 				7, 			4, 			8, 				8, 			1, 			'JFD_PAPAL_STATES_ATLAS', 	1);

-- Bypass VP's leader compatibility trigger
UPDATE Leaders SET VictoryCompetitiveness = 9, WonderCompetitiveness = 8, MinorCivCompetitiveness = 8, Boldness = 8, DiploBalance = 8, WarmongerHate = 9, DenounceWillingness = 7, DoFWillingness = 4, Loyalty = 7, Neediness = 4, Forgiveness = 8, Chattiness = 8, Meanness = 1 WHERE Type = 'LEADER_JULIUS_II';
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------					
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 		MajorCivApproachType, 				Bias)
VALUES		('LEADER_JULIUS_II', 'MAJOR_CIV_APPROACH_WAR', 			2),
			('LEADER_JULIUS_II', 'MAJOR_CIV_APPROACH_HOSTILE', 		2),
			('LEADER_JULIUS_II', 'MAJOR_CIV_APPROACH_DECEPTIVE', 	3),
			('LEADER_JULIUS_II', 'MAJOR_CIV_APPROACH_GUARDED', 		3),
			('LEADER_JULIUS_II', 'MAJOR_CIV_APPROACH_AFRAID', 		3),
			('LEADER_JULIUS_II', 'MAJOR_CIV_APPROACH_FRIENDLY', 	6),
			('LEADER_JULIUS_II', 'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------					
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 		MinorCivApproachType, 				Bias)
VALUES		('LEADER_JULIUS_II', 'MINOR_CIV_APPROACH_IGNORE', 		2),
			('LEADER_JULIUS_II', 'MINOR_CIV_APPROACH_FRIENDLY', 	8),
			('LEADER_JULIUS_II', 'MINOR_CIV_APPROACH_PROTECTIVE', 	8),
			('LEADER_JULIUS_II', 'MINOR_CIV_APPROACH_CONQUEST', 	2),
			('LEADER_JULIUS_II', 'MINOR_CIV_APPROACH_BULLY', 		4);
--------------------------------	
-- Leader_Flavors
--------------------------------					
INSERT INTO Leader_Flavors 
			(LeaderType, 		FlavorType, 						Flavor)
VALUES		('LEADER_JULIUS_II', 'FLAVOR_OFFENSE', 					2),
			('LEADER_JULIUS_II', 'FLAVOR_DEFENSE', 					5),
			('LEADER_JULIUS_II', 'FLAVOR_CITY_DEFENSE', 			8),
			('LEADER_JULIUS_II', 'FLAVOR_MILITARY_TRAINING', 		3),
			('LEADER_JULIUS_II', 'FLAVOR_RECON', 					3),
			('LEADER_JULIUS_II', 'FLAVOR_RANGED', 					2),
			('LEADER_JULIUS_II', 'FLAVOR_MOBILE', 					3),
			('LEADER_JULIUS_II', 'FLAVOR_NAVAL', 					3),
			('LEADER_JULIUS_II', 'FLAVOR_NAVAL_RECON', 				3),
			('LEADER_JULIUS_II', 'FLAVOR_NAVAL_GROWTH', 			3),
			('LEADER_JULIUS_II', 'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	10),
			('LEADER_JULIUS_II', 'FLAVOR_AIR', 						3),
			('LEADER_JULIUS_II', 'FLAVOR_EXPANSION', 				2),
			('LEADER_JULIUS_II', 'FLAVOR_GROWTH', 					8),
			('LEADER_JULIUS_II', 'FLAVOR_TILE_IMPROVEMENT', 		7),
			('LEADER_JULIUS_II', 'FLAVOR_INFRASTRUCTURE', 			8),
			('LEADER_JULIUS_II', 'FLAVOR_PRODUCTION', 				6),
			('LEADER_JULIUS_II', 'FLAVOR_GOLD', 					7),
			('LEADER_JULIUS_II', 'FLAVOR_SCIENCE', 					5),
			('LEADER_JULIUS_II', 'FLAVOR_CULTURE', 					8),
			('LEADER_JULIUS_II', 'FLAVOR_HAPPINESS', 				6),
			('LEADER_JULIUS_II', 'FLAVOR_GREAT_PEOPLE', 			8),
			('LEADER_JULIUS_II', 'FLAVOR_WONDER', 					8),
			('LEADER_JULIUS_II', 'FLAVOR_RELIGION', 				10),
			('LEADER_JULIUS_II', 'FLAVOR_DIPLOMACY', 				9),
			('LEADER_JULIUS_II', 'FLAVOR_SPACESHIP', 				3),
			('LEADER_JULIUS_II', 'FLAVOR_WATER_CONNECTION', 		4),
			('LEADER_JULIUS_II', 'FLAVOR_NUKE', 					1),
			('LEADER_JULIUS_II', 'FLAVOR_USE_NUKE', 				1),
			('LEADER_JULIUS_II', 'FLAVOR_ESPIONAGE', 				7),
			('LEADER_JULIUS_II', 'FLAVOR_AIRLIFT', 					1),
			('LEADER_JULIUS_II', 'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_JULIUS_II', 'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_JULIUS_II', 'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_JULIUS_II', 'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_JULIUS_II', 'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_JULIUS_II', 'FLAVOR_AIR_CARRIER', 				5);
--------------------------------	
-- Leader_Traits
--------------------------------				
INSERT INTO Leader_Traits 
			(LeaderType, 		TraitType)
VALUES		('LEADER_JULIUS_II', 'TRAIT_JFD_PAPAL_STATES');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
			(Type, 						Description, 						ShortDescription,						SharedReligionTourismModifier,	ExtraMissionaryStrength)
VALUES		('TRAIT_JFD_PAPAL_STATES', 	'TXT_KEY_TRAIT_JFD_PAPAL_STATES', 	'TXT_KEY_TRAIT_JFD_PAPAL_STATES_SHORT',	50,								50);
--------------------------------
-- Trait_BuildingClassYieldChanges 
--------------------------------
-- JJ: Tradition buildings are excluded (too much Faith too early)
INSERT INTO Trait_BuildingClassYieldChanges
			(TraitType, BuildingClassType, YieldType, YieldChange)
SELECT		'TRAIT_JFD_PAPAL_STATES', Type, 'YIELD_FAITH', 2
FROM BuildingClasses WHERE MaxPlayerInstances = 1 AND NOT Type IN
('BUILDINGCLASS_PALACE_THRONE_ROOM', 'BUILDINGCLASS_STATE_TREASURY', 'BUILDINGCLASS_ROYAL_GUARDHOUSE', 'BUILDINGCLASS_PALACE_GARDEN', 'BUILDINGCLASS_COURT_CHAPEL', 'BUILDINGCLASS_ROYAL_ASTROLOGER');

-- Trigger to make sure any new national wonders added (by others mods or future VP updates) will get the additional faith
CREATE TRIGGER JFD_PapalStates_NationalWonder_YieldChanges
AFTER INSERT ON BuildingClasses
WHEN NEW.MaxPlayerInstances = 1
BEGIN
	INSERT INTO Trait_BuildingClassYieldChanges
			(TraitType, BuildingClassType, YieldType, YieldChange)
	SELECT	'TRAIT_JFD_PAPAL_STATES', Type, 'YIELD_FAITH', 2
	FROM BuildingClasses WHERE Type = NEW.Type AND NOT Type IN
	('BUILDINGCLASS_PALACE_THRONE_ROOM', 'BUILDINGCLASS_STATE_TREASURY', 'BUILDINGCLASS_ROYAL_GUARDHOUSE', 'BUILDINGCLASS_PALACE_GARDEN', 'BUILDINGCLASS_COURT_CHAPEL', 'BUILDINGCLASS_ROYAL_ASTROLOGER');
END;
--------------------------------
-- Trait_YieldChangeWorldWonder 
--------------------------------
INSERT INTO Trait_YieldChangeWorldWonder
			(TraitType, YieldType, Yield)
VALUES		('TRAIT_JFD_PAPAL_STATES', 'YIELD_FAITH', 2);
--------------------------------
-- Trait_GreatWorkYieldChanges 
--------------------------------
INSERT INTO Trait_GreatWorkYieldChanges
			(TraitType, YieldType, Yield)
VALUES		('TRAIT_JFD_PAPAL_STATES', 'YIELD_FAITH', 2);
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
		(Type, 										Description, 									Help, 												Sound, 				CannotBeChosen,	LostWithUpgrade,	DefenseMod, 	HPHealedIfDestroyEnemy, PortraitIndex, 	IconAtlas, 						PediaType, 			PediaEntry)
VALUES	('PROMOTION_JFD_SWISS_GUARD', 				'TXT_KEY_PROMOTION_SWISS_GUARD', 				'TXT_KEY_PROMOTION_SWISS_GUARD_HELP', 				'AS2D_IF_LEVELUP', 	1, 				0,					20, 			25, 					0, 				'JFD_PAPAL_STATES_PI_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_SWISS_GUARD');
------------------------------
-- UnitPromotions_YieldModifiers 
------------------------------
INSERT INTO UnitPromotions_YieldModifiers
		(PromotionType, YieldType, Yield)
VALUES	('PROMOTION_JFD_SWISS_GUARD', 'YIELD_TOURISM', 10);
--==========================================================================================================================	
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------	
INSERT INTO Units 	
		(Type, 						PrereqTech, CivilianAttackPriority, Class, Cost, Moves, FaithCost, RequiresFaithPurchaseEnabled, Special, CombatLimit, Domain, DefaultUnitAI, BaseGold, Description, 						Civilopedia, 								Help, 									Strategy,										RestingPointChange, 	AdvancedStartCost, WorkRate, NumInfPerEra, BaseHurry, PurchaseCooldown, GlobalFaithPurchaseCooldown, BaseLandAirDefense, HurryMultiplier, Pillage, IgnoreBuildingDefense, UnitArtInfo,							UnitFlagIconOffset,	UnitFlagAtlas,						MoveRate,	PortraitIndex, 	IconAtlas)
SELECT	'UNIT_DJ_APOCRISIARIUS', 	PrereqTech, CivilianAttackPriority, Class, Cost, Moves, FaithCost, RequiresFaithPurchaseEnabled, Special, CombatLimit, Domain, DefaultUnitAI, BaseGold, ('TXT_KEY_UNIT_DJ_APOCRISIARIUS'), ('TXT_KEY_CIV5_UNITS_DJ_APOCRISIARIUS_TEXT'), ('TXT_KEY_UNIT_DJ_APOCRISIARIUS_HELP'), ('TXT_KEY_UNIT_DJ_APOCRISIARIUS_STRATEGY'),	RestingPointChange, 	AdvancedStartCost, WorkRate, NumInfPerEra, BaseHurry, PurchaseCooldown, GlobalFaithPurchaseCooldown, BaseLandAirDefense, HurryMultiplier, Pillage, IgnoreBuildingDefense, ('ART_DEF_UNIT_DJ_APOCRISIARIUS'),  	0,					'UNIT_FLAG_DJ_APOCRISIARIUS_ATLAS',	MoveRate,	2, 				'JFD_PAPAL_STATES_ATLAS'
FROM Units WHERE Type = 'UNIT_GREAT_DIPLOMAT';

INSERT INTO Units 	
		(Type, 					Class,	CombatClass, Cost, PrereqTech,	Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled,	Moves, PurchaseOnly, PurchaseCooldown,	GlobalFaithPurchaseCooldown, MoveAfterPurchase,	CivilianAttackPriority, Special, Domain, DefaultUnitAI,	Description, 					Help, 						  		Strategy, 								Civilopedia, 						ShowInPedia, Pillage, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, UnitArtInfo, 						UnitFlagAtlas, 						UnitFlagIconOffset,		IconAtlas,				PortraitIndex)
SELECT	'UNIT_JFD_SWISS_GUARD',	Class,	CombatClass, Cost, PrereqTech,	Combat, RangedCombat, Range, FaithCost, 0,								Moves, PurchaseOnly, PurchaseCooldown,	GlobalFaithPurchaseCooldown, 1,					CivilianAttackPriority, Special, Domain, DefaultUnitAI,	'TXT_KEY_UNIT_JFD_SWISS_GUARD', 'TXT_KEY_UNIT_HELP_JFD_SWISS_GUARD','TXT_KEY_UNIT_JFD_SWISS_GUARD_STRATEGY','TXT_KEY_CIV5_JFD_SWISS_GUARD_TEXT',ShowInPedia, Pillage, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, 'ART_DEF_UNIT_JFD_SWISS_GUARD',	'JFD_UNIT_FLAG_SWISS_GUARD_ATLAS',	0,						'JFD_PAPAL_STATES_ATLAS',	3
FROM Units WHERE Type = 'UNIT_SPANISH_TERCIO';
--------------------------------
-- UnitGameplay2DScripts
--------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	'UNIT_DJ_APOCRISIARIUS', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_GREAT_DIPLOMAT';	

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	('UNIT_JFD_SWISS_GUARD'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_SPANISH_TERCIO');
--------------------------------
-- Unit_AITypes
--------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_DJ_APOCRISIARIUS', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_GREAT_DIPLOMAT';
	
INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	('UNIT_JFD_SWISS_GUARD'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_SPANISH_TERCIO');
--------------------------------
-- Unit_Flavors
--------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_JFD_SWISS_GUARD',	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_SPANISH_TERCIO';

INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_DJ_APOCRISIARIUS',	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_GREAT_DIPLOMAT';
--------------------------------
-- Unit_ClassUpgrades
--------------------------------
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_JFD_SWISS_GUARD',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_SPANISH_TERCIO';

UPDATE Units SET
ObsoleteTech = (select a.ObsoleteTech from Units a, Unit_ClassUpgrades b, UnitClasses c WHERE b.UnitType='UNIT_JFD_SWISS_GUARD' and b.UnitClassType=c.Type and c.DefaultUnit=a.Type)
WHERE Type = 'UNIT_JFD_SWISS_GUARD';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_Builds
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Builds 	
		(UnitType, 				BuildType)
SELECT	'UNIT_DJ_APOCRISIARIUS',BuildType
FROM Unit_Builds WHERE (UnitType = 'UNIT_GREAT_DIPLOMAT');
--------------------------------------------------------------------------------------------------------------------------
-- Unit_ResourceQuantityExpended
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ResourceQuantityExpended 	
		(UnitType, 					ResourceType, 	Amount)
SELECT	'UNIT_DJ_APOCRISIARIUS',	ResourceType, 	Amount
FROM Unit_ResourceQuantityExpended WHERE (UnitType = 'UNIT_GREAT_DIPLOMAT');
--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions
		(UnitType, 				PromotionType)
SELECT	'UNIT_DJ_APOCRISIARIUS',PromotionType FROM Unit_FreePromotions WHERE UnitType = 'UNIT_GREAT_DIPLOMAT' UNION ALL
SELECT	'UNIT_JFD_SWISS_GUARD',	PromotionType FROM Unit_FreePromotions WHERE UnitType = 'UNIT_SPANISH_TERCIO';

INSERT INTO Unit_FreePromotions 
		(UnitType, 					PromotionType)
VALUES	('UNIT_JFD_SWISS_GUARD', 	'PROMOTION_JFD_SWISS_GUARD');
--------------------------------
-- Unit_UniqueNames
--------------------------------
INSERT INTO Unit_UniqueNames
			(UnitType,					UniqueName)
VALUES		('UNIT_DJ_APOCRISIARIUS',	'TXT_KEY_NAME_DJ_APOCRISIARIUS_0'),
			('UNIT_DJ_APOCRISIARIUS',	'TXT_KEY_NAME_DJ_APOCRISIARIUS_1'),
			('UNIT_DJ_APOCRISIARIUS',	'TXT_KEY_NAME_DJ_APOCRISIARIUS_2'),
			('UNIT_DJ_APOCRISIARIUS',	'TXT_KEY_NAME_DJ_APOCRISIARIUS_3'),
			('UNIT_DJ_APOCRISIARIUS',	'TXT_KEY_NAME_DJ_APOCRISIARIUS_4'),
			('UNIT_DJ_APOCRISIARIUS',	'TXT_KEY_NAME_DJ_APOCRISIARIUS_5'),
			('UNIT_DJ_APOCRISIARIUS',	'TXT_KEY_NAME_DJ_APOCRISIARIUS_6'),
			('UNIT_DJ_APOCRISIARIUS',	'TXT_KEY_NAME_DJ_APOCRISIARIUS_7'),
			('UNIT_DJ_APOCRISIARIUS',	'TXT_KEY_NAME_DJ_APOCRISIARIUS_8'),
			('UNIT_DJ_APOCRISIARIUS',	'TXT_KEY_NAME_DJ_APOCRISIARIUS_9'),
			('UNIT_DJ_APOCRISIARIUS',	'TXT_KEY_NAME_DJ_APOCRISIARIUS_10'),
			('UNIT_DJ_APOCRISIARIUS',	'TXT_KEY_NAME_DJ_APOCRISIARIUS_11'),
			('UNIT_DJ_APOCRISIARIUS',	'TXT_KEY_NAME_DJ_APOCRISIARIUS_12'),
			('UNIT_DJ_APOCRISIARIUS',	'TXT_KEY_NAME_DJ_APOCRISIARIUS_13'),
			('UNIT_DJ_APOCRISIARIUS',	'TXT_KEY_NAME_DJ_APOCRISIARIUS_14'),
			('UNIT_DJ_APOCRISIARIUS',	'TXT_KEY_NAME_DJ_APOCRISIARIUS_15'),
			('UNIT_DJ_APOCRISIARIUS',	'TXT_KEY_NAME_DJ_APOCRISIARIUS_16'),
			('UNIT_DJ_APOCRISIARIUS',	'TXT_KEY_NAME_DJ_APOCRISIARIUS_17'),
			('UNIT_DJ_APOCRISIARIUS',	'TXT_KEY_NAME_DJ_APOCRISIARIUS_18');
--==========================================================================================================================	
-- MINOR CIVILIZATIONS
--==========================================================================================================================	
INSERT INTO MajorBlocksMinor
		(MajorCiv, 						MinorCiv)
SELECT 	'CIVILIZATION_JFD_PAPAL_STATES','MINOR_CIV_VATICAN_CITY';
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations 	
		(Type, 								Description,						ShortDescription, 							Adjective, 							Civilopedia, 								CivilopediaTag, 					DefaultPlayerColor, 				ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 					PortraitIndex, 	AlphaIconAtlas, 					SoundtrackTag, 	MapImage, 								DawnOfManQuote, 						DawnOfManImage)
SELECT	('CIVILIZATION_JFD_PAPAL_STATES'), 	('TXT_KEY_JFD_PAPAL_STATES_DESC'),	('TXT_KEY_JFD_PAPAL_STATES_SHORT_DESC'),	('TXT_KEY_JFD_PAPAL_STATES_ADJ'),	('TXT_KEY_CIV5_JFD_PAPAL_STATES_TEXT_1'), 	('TXT_KEY_CIV5_JFD_PAPAL_STATES'), 	('PLAYERCOLOR_JFD_PAPAL_STATES'), 	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('JFD_PAPAL_STATES_ATLAS'), 0, 				('JFD_PAPAL_STATES_ALPHA_ATLAS'), 	('JFD_Papal'), 	('JFD_MapPapalStatesJuliusII512.dds'),	('TXT_KEY_CIV5_DOM_JULIUS_II_TEXT'), 	('JFD_DOM_PapalStatesJuliusII.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_ROME');
--------------------------------	
-- Civilization_CityNames
--------------------------------
UPDATE Civilization_CityNames SET CityName='TXT_KEY_CITY_NAME_JFD_ROMA'
WHERE CivilizationType='CIVILIZATION_ROME' AND CityName='TXT_KEY_CITY_NAME_ROME';
	
INSERT INTO Civilization_CityNames 
			(CivilizationType, 					CityName)
VALUES		('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_ROMA'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_BENEVENTO'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_PONTECORVO'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_ASCOLI'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_AVIGNON'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_RAVENNA'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_BOLOGNA'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_FERRARA'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_CIVITAVECCHIA'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_PERUGIA'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_ASSISI'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_ORVIETO'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_SINIGAGLIA'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_ANCONA'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_GUBBIO'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_CAMERINO'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_FERMO'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_RIMINI'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_URBINO'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_RIETI'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_TODI'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_VELLETRI'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_VITERBO');
--------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 					BuildingClassType)
SELECT		('CIVILIZATION_JFD_PAPAL_STATES'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_ROME');
--------------------------------	
-- Civilization_FreeTechs
--------------------------------		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 					TechType)
SELECT		('CIVILIZATION_JFD_PAPAL_STATES'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_ROME');
--------------------------------	
-- Civilization_FreeUnits
--------------------------------		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_JFD_PAPAL_STATES'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_ROME');
--------------------------------	
-- Civilization_Leaders
--------------------------------		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 					LeaderheadType)
VALUES		('CIVILIZATION_JFD_PAPAL_STATES', 	'LEADER_JULIUS_II');
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 				UnitClassType, 					UnitType)
SELECT		'CIVILIZATION_JFD_PAPAL_STATES', 'UNITCLASS_TERCIO', 			'UNIT_JFD_SWISS_GUARD' UNION ALL
SELECT		'CIVILIZATION_JFD_PAPAL_STATES', 'UNITCLASS_GREAT_DIPLOMAT',	'UNIT_DJ_APOCRISIARIUS';
--------------------------------	
-- Civilization_BuildingClassOverrides
--------------------------------	
INSERT INTO Civilization_BuildingClassOverrides
		(CivilizationType,					BuildingClassType,			BuildingType)
SELECT	'CIVILIZATION_JFD_PAPAL_STATES',	'BUILDINGCLASS_HERMITAGE',	'BUILDING_VATICAN_MUSEUMS' UNION ALL
SELECT	'CIVILIZATION_JFD_PAPAL_STATES', 	'BUILDINGCLASS_TEMPLE',		'BUILDING_JFD_CHAPEL_MUSIC';
--------------------------------	
-- Civilization_Religions
--------------------------------		
INSERT INTO Civilization_Religions 
			(CivilizationType, 					ReligionType)
VALUES		('CIVILIZATION_JFD_PAPAL_STATES', 	'RELIGION_CHRISTIANITY');
--------------------------------	
-- Civilization_SpyNames
--------------------------------	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 					SpyName)
VALUES		('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_SPY_NAME_JFD_PAPAL_STATES_0'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_SPY_NAME_JFD_PAPAL_STATES_1'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_SPY_NAME_JFD_PAPAL_STATES_2'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_SPY_NAME_JFD_PAPAL_STATES_3'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_SPY_NAME_JFD_PAPAL_STATES_4'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_SPY_NAME_JFD_PAPAL_STATES_5'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_SPY_NAME_JFD_PAPAL_STATES_6'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_SPY_NAME_JFD_PAPAL_STATES_7'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_SPY_NAME_JFD_PAPAL_STATES_8'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_SPY_NAME_JFD_PAPAL_STATES_9'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_SPY_NAME_JFD_PAPAL_STATES_10'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_SPY_NAME_JFD_PAPAL_STATES_11'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_SPY_NAME_JFD_PAPAL_STATES_12'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_SPY_NAME_JFD_PAPAL_STATES_13'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_SPY_NAME_JFD_PAPAL_STATES_14');
--------------------------------	
-- Civilization_Start_Region_Priority
--------------------------------	
INSERT INTO Civilization_Start_Region_Priority 
		(CivilizationType, 					RegionType)
VALUES	('CIVILIZATION_JFD_PAPAL_STATES', 	'REGION_HILLS');
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_Start_Region_Avoid
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_Start_Region_Avoid
		(CivilizationType, 					RegionType)
VALUES	('CIVILIZATION_JFD_PAPAL_STATES', 	'REGION_JUNGLE'),
		('CIVILIZATION_JFD_PAPAL_STATES', 	'REGION_DESERT');
--==========================================================================================================================
-- MORE UNIQUE COMPONENTS FOR VP
--==========================================================================================================================
-- Buildings
--------------------------------
INSERT INTO Buildings 	
			(Type, 							BuildingClass, BoredomFlatReductionGlobal, GreatWorkSlotType, GreatWorkCount,	PrereqTech, Cost, NumCityCostMod, GoldMaintenance, HurryCostModifier, MinAreaSize, ConquestProb, NeverCapture, NukeImmune, Description, 							Civilopedia, 								Help, 										Strategy,										ArtDefineTag, PortraitIndex, 	IconAtlas,					MaxStartEra)
SELECT		('BUILDING_VATICAN_MUSEUMS'),	BuildingClass, BoredomFlatReductionGlobal, GreatWorkSlotType, GreatWorkCount,	PrereqTech, Cost, NumCityCostMod, GoldMaintenance, HurryCostModifier, MinAreaSize, ConquestProb, NeverCapture, NukeImmune, ('TXT_KEY_BUILDING_VATICAN_MUSEUMS'), 	('TXT_KEY_BUILDING_VATICAN_MUSEUMS_PEDIA'),	('TXT_KEY_BUILDING_VATICAN_MUSEUMS_HELP'), 	('TXT_KEY_BUILDING_VATICAN_MUSEUMS_STRATEGY'),	ArtDefineTag, 5, 				('JFD_PAPAL_STATES_ATLAS'),	MaxStartEra
FROM Buildings WHERE Type = 'BUILDING_HERMITAGE';

UPDATE Buildings SET CultureRateModifier = 25, GlobalLandmarksTourismPercent = 25, GlobalGreatWorksTourismModifier = 25,
ThemingBonusHelp = 'TXT_KEY_VATICAN_MUSEUMS_THEMING_BONUS_HELP' WHERE Type = 'BUILDING_VATICAN_MUSEUMS';
------------------------------
-- Building_YieldChanges
------------------------------
INSERT INTO Building_YieldChanges 
		(BuildingType, YieldType, Yield)
SELECT	'BUILDING_VATICAN_MUSEUMS', YieldType, Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_HERMITAGE';
--------------------------------
-- Building_YieldChangesPerPop
--------------------------------
INSERT INTO Building_YieldChangesPerPop
			(BuildingType, YieldType, Yield)
SELECT		'BUILDING_VATICAN_MUSEUMS', 'YIELD_CULTURE', 50;
--------------------------------
-- Building_ThemingBonuses
--------------------------------
INSERT INTO Building_ThemingBonuses
			(BuildingType,				Description,							Bonus,	UniqueEras, MustBeArt, RequiresUniquePlayers, AIPriority)
SELECT		'BUILDING_VATICAN_MUSEUMS', 'TXT_KEY_THEMING_BONUS_VATICAN_MUSEUMS',Bonus,	UniqueEras, MustBeArt, RequiresUniquePlayers, AIPriority
FROM Building_ThemingBonuses WHERE BuildingType = 'BUILDING_HERMITAGE';
--------------------------------
-- Building_ThemingYieldBonus
--------------------------------
INSERT INTO Building_ThemingYieldBonus
			(BuildingType,				YieldType, Yield)
SELECT		'BUILDING_VATICAN_MUSEUMS', Type, 		3 FROM Yields WHERE Type IN ('YIELD_GOLD', 'YIELD_CULTURE', 'YIELD_SCIENCE');
--------------------------------
-- Building_BuildingClassYieldChanges
--------------------------------
INSERT INTO Building_BuildingClassYieldChanges
			(BuildingType, BuildingClassType, YieldType, YieldChange)
SELECT		'BUILDING_VATICAN_MUSEUMS', Type, 'YIELD_TOURISM', 2
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_TEMPLE', 'BUILDINGCLASS_JFD_CHAPEL_ART', 'BUILDINGCLASS_JFD_CHAPEL_WRITING');
--------------------------------
-- Building_FreeUnits
--------------------------------
INSERT INTO Building_FreeUnits
			(BuildingType, UnitType, NumUnits)
SELECT		'BUILDING_VATICAN_MUSEUMS', 'UNIT_ARTIST', 1;
--==========================================================================================================================
--==========================================================================================================================