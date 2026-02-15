--=======================================================================================================================
-- CORE DEFINES
--=======================================================================================================================
-- Defines
------------------------------
-- The DLL function GetDirectiveArtist waits (AI_HOMELAND_GREAT_PERSON_TURNS_TO_WAIT / 2) turns before assigning the unit to create Golden Age.
-- Since the value is set to 3 in VP, you will get 1 turn as decimals are truncated.
-- This is an issue as due to the way AI moves are processed, the AI only uses Disciples the turn after they are purchased, so they will always end up being popped for GA.
-- Side effect is AI faith bought Great Artist will always create Great Works if they have a slot, due to how GetDirectiveArtist works (not very sophisticated at all).
UPDATE Defines SET Value = '4' WHERE Name = 'AI_HOMELAND_GREAT_PERSON_TURNS_TO_WAIT';
--==========================================================================================================================	
-- CUSTOM MOD OPTIONS
--==========================================================================================================================	
-- CustomModOptions
------------------------------	
UPDATE CustomModOptions
SET Value = '1'
WHERE Name = 'YIELD_MODIFIER_FROM_UNITS';
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
			(Type, 						 		 		DefaultBuilding, 						Description)
VALUES		('BUILDINGCLASS_JFD_CHAPEL_WRITING', 		'BUILDING_JFD_CHAPEL_WRITING',			'TXT_KEY_BUILDING_JFD_CHAPEL_WRITING'),
			('BUILDINGCLASS_JFD_CHAPEL_ART', 			'BUILDING_JFD_CHAPEL_ART',				'TXT_KEY_BUILDING_JFD_CHAPEL_ART'),
			('BUILDINGCLASS_JFD_PAPAL_EXTRA_SPREADS', 	'BUILDING_JFD_PAPAL_EXTRA_SPREADS', 	'TXT_KEY_BUILDING_JFD_PAPAL_EXTRA_SPREADS');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------		
INSERT INTO Buildings 	
			(Type, 							BuildingClass,	GreatWorkSlotType, 			GreatWorkCount,	PrereqTech, Cost,		GoldMaintenance,	HurryCostModifier, MinAreaSize, ConquestProb,	NeverCapture, 	Description, 							Civilopedia, 						Help, 									Strategy,									ArtDefineTag, PortraitIndex, 	IconAtlas,					MaxStartEra, ReligiousPressureModifier, ReligiousUnrestFlatReduction)
SELECT		('BUILDING_JFD_CHAPEL_MUSIC'),	BuildingClass,	('GREAT_WORK_SLOT_MUSIC'),  2, 				PrereqTech, Cost*0.75,	0,					HurryCostModifier, MinAreaSize, 100,			NeverCapture,	('TXT_KEY_BUILDING_JFD_CHAPEL_MUSIC'), 	('TXT_KEY_CIV5_JFD_CHAPEL_TEXT'),   ('TXT_KEY_BUILDING_JFD_CHAPEL_HELP'), 	('TXT_KEY_BUILDING_JFD_CHAPEL_STRATEGY'),	ArtDefineTag, 4, 				('JFD_PAPAL_STATES_ATLAS'),	MaxStartEra, ReligiousPressureModifier, ReligiousUnrestFlatReduction
FROM Buildings WHERE Type = 'BUILDING_TEMPLE';	

INSERT INTO Buildings 	
			(Type, 							BuildingClass,						GreatWorkSlotType, 				   GreatWorkCount,	PrereqTech, Cost,		GoldMaintenance,	HurryCostModifier, MinAreaSize, ConquestProb,	NeverCapture, 	Description, 							Civilopedia, 						Help, 										Strategy,									ArtDefineTag, PortraitIndex, 	IconAtlas,					MaxStartEra, ReligiousPressureModifier)
SELECT		('BUILDING_JFD_CHAPEL_ART'),	('BUILDINGCLASS_JFD_CHAPEL_ART'),	('GREAT_WORK_SLOT_ART_ARTIFACT'),  2, 				PrereqTech,	Cost*0.75,	0,					HurryCostModifier, MinAreaSize, 100,			NeverCapture,	('TXT_KEY_BUILDING_JFD_CHAPEL_ART'), 	('TXT_KEY_CIV5_JFD_CHAPEL_TEXT'),   ('TXT_KEY_BUILDING_JFD_CHAPEL_ART_HELP'), 	('TXT_KEY_BUILDING_JFD_CHAPEL_STRATEGY'),	ArtDefineTag, 4, 				('JFD_PAPAL_STATES_ATLAS'),	MaxStartEra, ReligiousPressureModifier
FROM Buildings WHERE Type = 'BUILDING_TEMPLE';		

INSERT INTO Buildings 	
			(Type, 								BuildingClass,							GreatWorkSlotType, 				GreatWorkCount,	PrereqTech, Cost,		GoldMaintenance,	HurryCostModifier, MinAreaSize, ConquestProb,	NeverCapture, 	Description, 								Civilopedia, 						Help, 											Strategy,									ArtDefineTag, PortraitIndex, 	IconAtlas,					MaxStartEra, ReligiousPressureModifier)
SELECT		('BUILDING_JFD_CHAPEL_WRITING'),	('BUILDINGCLASS_JFD_CHAPEL_WRITING'),	('GREAT_WORK_SLOT_LITERATURE'),	2, 				PrereqTech, Cost*0.75,	0,					HurryCostModifier, MinAreaSize, 100,			NeverCapture,	('TXT_KEY_BUILDING_JFD_CHAPEL_WRITING'), 	('TXT_KEY_CIV5_JFD_CHAPEL_TEXT'),   ('TXT_KEY_BUILDING_JFD_CHAPEL_WRITING_HELP'), 	('TXT_KEY_BUILDING_JFD_CHAPEL_STRATEGY'),	ArtDefineTag, 4, 				('JFD_PAPAL_STATES_ATLAS'),	MaxStartEra, ReligiousPressureModifier
FROM Buildings WHERE Type = 'BUILDING_TEMPLE';

UPDATE Buildings SET CivilizationRequired = 'CIVILIZATION_JFD_PAPAL_STATES' WHERE Type IN ('BUILDING_JFD_CHAPEL_ART', 'BUILDING_JFD_CHAPEL_WRITING');

UPDATE Buildings SET ThemingBonusHelp = 'TXT_KEY_JFD_CHAPEL_MUSIC_THEMING_BONUS_HELP' WHERE Type = 'BUILDING_JFD_CHAPEL_MUSIC';
UPDATE Buildings SET ThemingBonusHelp = 'TXT_KEY_JFD_CHAPEL_ART_THEMING_BONUS_HELP' WHERE Type = 'BUILDING_JFD_CHAPEL_ART';
UPDATE Buildings SET ThemingBonusHelp = 'TXT_KEY_JFD_CHAPEL_WRITING_THEMING_BONUS_HELP' WHERE Type = 'BUILDING_JFD_CHAPEL_WRITING';

-- JJ: Dummy building for the extra missionary spreads
INSERT INTO Buildings		
			(Type,									BuildingClass, 			  					Cost, 	FaithCost,	GreatWorkCount,	 Help,												Description, 									ExtraMissionarySpreads,	NeverCapture,	IsDummy)
VALUES		('BUILDING_JFD_PAPAL_EXTRA_SPREADS', 	'BUILDINGCLASS_JFD_PAPAL_EXTRA_SPREADS', 	-1, 	-1,			-1,				 'TXT_KEY_BUILDING_JFD_PAPAL_EXTRA_SPREADS_HELP',	'TXT_KEY_BUILDING_JFD_PAPAL_EXTRA_SPREADS', 	1,						1,				1);
------------------------------
-- Building_YieldChanges
------------------------------
INSERT INTO Building_YieldChanges 
			(BuildingType, YieldType, Yield)
SELECT		'BUILDING_JFD_CHAPEL_MUSIC', YieldType, Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_TEMPLE'
UNION ALL
SELECT		'BUILDING_JFD_CHAPEL_WRITING', YieldType, Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_TEMPLE'
UNION ALL
SELECT		'BUILDING_JFD_CHAPEL_ART', YieldType, Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_TEMPLE';
------------------------------	
-- Building_ClassesNeededInCity
------------------------------	
INSERT INTO Building_ClassesNeededInCity 	
			(BuildingType, 					BuildingClassType)
SELECT		('BUILDING_JFD_CHAPEL_MUSIC'),	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_TEMPLE';	

INSERT INTO Building_ClassesNeededInCity 	
			(BuildingType, 					BuildingClassType)
VALUES		('BUILDING_JFD_CHAPEL_ART',		'BUILDINGCLASS_TEMPLE'),
			('BUILDING_JFD_CHAPEL_WRITING',	'BUILDINGCLASS_JFD_CHAPEL_ART');
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
-- Building_ResourceYieldChanges (NEW)
------------------------------
INSERT INTO Building_ResourceYieldChanges
			(BuildingType, ResourceType, YieldType, Yield)
SELECT		'BUILDING_JFD_CHAPEL_MUSIC', ResourceType, YieldType, Yield
FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_TEMPLE';

-- Trigger to make sure any new resources added (by others mods or future VP updates) will get the yields
/*CREATE TRIGGER JFD_PapalStates_Chapel_ResourceYieldChanges
AFTER INSERT ON Building_ResourceYieldChanges
WHEN NEW.BuildingType = 'BUILDING_TEMPLE'
BEGIN
	DELETE FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_JFD_CHAPEL_MUSIC'; -- JJ: Because the below will select ALL entries with BuildingType = 'BUILDING_TEMPLE', so this will prevent duplicate entries

	INSERT INTO Building_ResourceYieldChanges
				(BuildingType, ResourceType, YieldType, Yield)
	SELECT		'BUILDING_JFD_CHAPEL_MUSIC', ResourceType, YieldType, Yield
	FROM Building_ResourceYieldChanges BuildingType Type = 'BUILDING_TEMPLE';
END;*/
------------------------------
-- Building_ThemingBonuses (NEW)
------------------------------
INSERT INTO Building_ThemingBonuses
			(BuildingType, Description, Bonus, MustBeArt, RequiresOwner, AIPriority)
VALUES		('BUILDING_JFD_CHAPEL_MUSIC', 'TXT_KEY_THEMING_BONUS_CHAPEL_MUSIC', 3, null, 1, 2),
			('BUILDING_JFD_CHAPEL_ART', 'TXT_KEY_THEMING_BONUS_CHAPEL_ART', 3, 1, 1, 2),
			('BUILDING_JFD_CHAPEL_WRITING', 'TXT_KEY_THEMING_BONUS_CHAPEL_WRITING', 3, null, 1, 2);
------------------------------
-- Building_ThemingYieldBonus (NEW)
------------------------------
INSERT INTO Building_ThemingYieldBonus
			(BuildingType, YieldType, Yield)
VALUES		('BUILDING_JFD_CHAPEL_MUSIC', 'YIELD_CULTURE', 3),
			('BUILDING_JFD_CHAPEL_ART', 'YIELD_GOLDEN_AGE_POINTS', 3),
			('BUILDING_JFD_CHAPEL_WRITING', 'YIELD_GOLD', 3);
--==========================================================================================================================
-- GREAT WORKS
--==========================================================================================================================
-- GreatWorks
------------------------------
DELETE FROM GreatWorks WHERE Type IN('GREAT_WORK_REQUIEM'); -- 16/08/20 version of VP added a Requiem great work of music

INSERT INTO GreatWorks 
			(Type, 															GreatWorkClassType,			Description,														Quote,																		Audio,																Image)
VALUES		--Artists
			('GREAT_WORK_THE_CRUCIFIXTION_OF_SAINT_PETER', 					'GREAT_WORK_ART',			'TXT_KEY_GREAT_WORK_THE_CRUCIFIXTION_OF_SAINT_PETER',				null,																		'AS2D_DISCIPLE_ARTIST_WRITER',										'GW_Caravaggio--The_Crucifixtion_of_Saint_Peter.dds'),
			('GREAT_WORK_CORONATION_OF_THE_VIRGIN', 						'GREAT_WORK_ART',			'TXT_KEY_GREAT_WORK_CORONATION_OF_THE_VIRGIN',						null,																		'AS2D_DISCIPLE_ARTIST_WRITER',										'GW_Enguerrand_Quarton--Coronation_of_the_Virgin.dds'),
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
			('GREAT_WORK_THE_STONING_OF_SAINT_STEPHEN', 					'GREAT_WORK_ART',			'TXT_KEY_GREAT_WORK_THE_STONING_OF_SAINT_STEPHEN',					null,																		'AS2D_DISCIPLE_ARTIST_WRITER',										'GW_Rembrant--The_Stoning_of_Saint_Stephen.dds'),
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
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
			(Type, 				Description, 				Civilopedia, 							CivilopediaTag, 						ArtDefineTag, 		VictoryCompetitiveness,	WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES		('LEADER_JULIUS_II', 'TXT_KEY_LEADER_JULIUS_II', 	'TXT_KEY_LEADER_JULIUS_II_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JULIUS_II', 'JFD_PapalStatesJuliusII_Scene.xml',	9, 						8, 						8, 							8, 			8, 				9, 				7, 						4, 				7, 			4, 			8, 				8, 			1, 			'JFD_PAPAL_STATES_ATLAS', 	1);

-- Bypass VP's leader compatibility trigger
UPDATE Leaders SET VictoryCompetitiveness = 9, WonderCompetitiveness = 8, MinorCivCompetitiveness = 8, Boldness = 8, DiploBalance = 8, WarmongerHate = 9, DenounceWillingness = 7, DoFWillingness = 4, Loyalty = 7, Neediness = 4, Forgiveness = 8, Chattiness = 8, Meanness = 1, Personality = 'PERSONALITY_COALITION' WHERE Type = 'LEADER_JULIUS_II';
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
			(Type, 						Description, 						ShortDescription,						SharedReligionTourismModifier,	ExtraMissionaryStrength/*,	FreeBuilding*/)
VALUES		('TRAIT_JFD_PAPAL_STATES', 	'TXT_KEY_TRAIT_JFD_PAPAL_STATES', 	'TXT_KEY_TRAIT_JFD_PAPAL_STATES_SHORT',	50,								50/*,						'BUILDING_JFD_PAPAL_EXTRA_SPREADS'*/);
--------------------------------
-- Trait_BuildingClassYieldChanges (NEW)
--------------------------------
-- JJ: Tradition buildings are excluded (too much Faith too early)
INSERT INTO Trait_BuildingClassYieldChanges
			(TraitType, BuildingClassType, YieldType, YieldChange)
SELECT		'TRAIT_JFD_PAPAL_STATES', Type, 'YIELD_FAITH', 2
FROM BuildingClasses WHERE MaxPlayerInstances = 1 AND NOT Type IN ('BUILDINGCLASS_PALACE_THRONE_ROOM', 'BUILDINGCLASS_PALACE_TREASURY', 'BUILDINGCLASS_CAPITAL_ENGINEER', 'BUILDINGCLASS_PALACE_GARDEN', 'BUILDINGCLASS_PALACE_COURT_CHAPEL', 'BUILDINGCLASS_PALACE_ASTROLOGER');

-- Trigger to make sure any new national wonders added (by others mods or future VP updates) will get the additional faith
CREATE TRIGGER JFD_PapalStates_NationalWonder_YieldChanges
AFTER INSERT ON BuildingClasses
WHEN NEW.MaxPlayerInstances = 1
BEGIN
	INSERT INTO Trait_BuildingClassYieldChanges
				(TraitType, BuildingClassType, YieldType, YieldChange)
	SELECT		'TRAIT_JFD_PAPAL_STATES', Type, 'YIELD_FAITH', 2
	FROM BuildingClasses WHERE Type = NEW.Type AND NOT Type IN ('BUILDINGCLASS_PALACE_THRONE_ROOM', 'BUILDINGCLASS_PALACE_TREASURY', 'BUILDINGCLASS_CAPITAL_ENGINEER', 'BUILDINGCLASS_PALACE_GARDEN', 'BUILDINGCLASS_PALACE_COURT_CHAPEL', 'BUILDINGCLASS_PALACE_ASTROLOGER');
END;
--------------------------------
-- Trait_YieldChangeWorldWonder (NEW)
--------------------------------
INSERT INTO Trait_YieldChangeWorldWonder
			(TraitType, YieldType, Yield)
VALUES		('TRAIT_JFD_PAPAL_STATES', 'YIELD_FAITH', 2);
--------------------------------
-- Trait_GreatWorkYieldChanges (NEW)
--------------------------------
INSERT INTO Trait_GreatWorkYieldChanges
			(TraitType, YieldType, Yield)
VALUES		('TRAIT_JFD_PAPAL_STATES', 'YIELD_FAITH', 2);
--==========================================================================================================================	
-- POLICIES
--==========================================================================================================================	
-- Policies
--------------------------------	
/*INSERT INTO Policies -- JJ: Replaces with new trait for SharedReligionTourismModifier
			(Type,						Description,						SharedReligionTourismModifier)
VALUES		('POLICY_JFD_PAPAL_STATES', 'TXT_KEY_TRAIT_JFD_PAPAL_STATES',	50);*/
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
			(Type, 										Description, 									Help, 												Sound, 				CannotBeChosen,	LostWithUpgrade,	DefenseMod, 	HPHealedIfDestroyEnemy, PortraitIndex, 	IconAtlas, 						PediaType, 			PediaEntry)
VALUES		('PROMOTION_JFD_SWISS_GUARD', 				'TXT_KEY_PROMOTION_SWISS_GUARD', 				'TXT_KEY_PROMOTION_SWISS_GUARD_HELP', 				'AS2D_IF_LEVELUP', 	1, 				0,					20, 			25, 					0, 				'JFD_PAPAL_STATES_PI_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_SWISS_GUARD');
------------------------------
-- UnitPromotions_YieldModifiers (NEW)
------------------------------
INSERT INTO UnitPromotions_YieldModifiers
			(PromotionType, YieldType, Yield)
VALUES		('PROMOTION_JFD_SWISS_GUARD', 'YIELD_TOURISM', 10);
--==========================================================================================================================	
-- UNITCLASSES (NEW)
--==========================================================================================================================
-- UnitClasses (NEW)
------------------------------
INSERT INTO UnitClasses
			(Type, Description, DefaultUnit)
VALUES		('UNITCLASS_JFD_DISCIPLE', 'TXT_KEY_UNIT_JFD_DISCIPLE', null),
			('UNITCLASS_JFD_SWISS_GUARD', 'TXT_KEY_UNIT_JFD_SWISS_GUARD', null);
--==========================================================================================================================	
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------	
INSERT INTO Units 	
			(Class, 					Type, 				CivilianAttackPriority,				Cost,	FaithCost,	Moves,	Domain,			DefaultUnitAI,		Description, 					Civilopedia,						Strategy,								Help,								ShowInPedia, 	AdvancedStartCost,	UnitArtInfo, 					UnitFlagIconOffset,		UnitFlagAtlas,					PortraitIndex,	IconAtlas, 					MoveRate)
VALUES		('UNITCLASS_JFD_DISCIPLE',	'UNIT_JFD_DISCIPLE', 'CIVILIAN_ATTACK_PRIORITY_HIGH',	-1,		200,		2,		'DOMAIN_LAND',	'UNITAI_ARTIST',	'TXT_KEY_UNIT_JFD_DISCIPLE',	'TXT_KEY_CIV5_JFD_DISCIPLE_TEXT',	'TXT_KEY_UNIT_JFD_DISCIPLE_STRATEGY',	'TXT_KEY_UNIT_HELP_JFD_DISCIPLE',	1,				-1,					'ART_DEF_UNIT_JFD_DISCIPLE',	0,						'JFD_UNIT_FLAG_DISCIPLE_ATLAS',	2, 				'JFD_PAPAL_STATES_ATLAS',	'GREAT_PERSON');

UPDATE Units SET LocalFaithPurchaseCooldown = 8 WHERE Type = 'UNIT_JFD_DISCIPLE';

UPDATE Units SET BaseTurnsForGAPToCount = (SELECT BaseTurnsForGAPToCount FROM Units WHERE Type = 'UNIT_ARTIST') WHERE Type = 'UNIT_JFD_DISCIPLE';
UPDATE Units SET ScaleFromNumThemes = (SELECT ScaleFromNumThemes FROM Units WHERE Type = 'UNIT_ARTIST') WHERE Type = 'UNIT_JFD_DISCIPLE';

-- JJ: Swiss Guard is disabled and only gifted by city states
INSERT INTO Units 	
			(Class,							Type, 						PrereqTech, Combat, Cost,		FaithCost,		RequiresFaithPurchaseEnabled,	PurchaseOnly, 	MoveAfterPurchase, Moves, CombatClass, Domain, DefaultUnitAI, Description, 						Civilopedia, 							Strategy, 									Help, 									MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, XPValueDefense, UnitArtInfoEraVariation, UnitArtInfo, 						UnitFlagIconOffset, UnitFlagAtlas,						 PortraitIndex, 	IconAtlas,					MinorCivGift)
SELECT		('UNITCLASS_JFD_SWISS_GUARD'), 	('UNIT_JFD_SWISS_GUARD'), 	PrereqTech, Combat, Cost,		Cost+Cost+40,	0,								PurchaseOnly,	MoveAfterPurchase, Moves, CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_JFD_SWISS_GUARD'), ('TXT_KEY_CIV5_JFD_SWISS_GUARD_TEXT'), 	('TXT_KEY_UNIT_JFD_SWISS_GUARD_STRATEGY'), 	('TXT_KEY_UNIT_HELP_JFD_SWISS_GUARD'), 	MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, XPValueDefense, UnitArtInfoEraVariation, ('ART_DEF_UNIT_JFD_SWISS_GUARD'), 	0,					('JFD_UNIT_FLAG_SWISS_GUARD_ATLAS'), 3, 				('JFD_PAPAL_STATES_ATLAS'),	1
FROM Units WHERE (Type = 'UNIT_GERMAN_LANDSKNECHT');
--------------------------------
-- UnitGameplay2DScripts
--------------------------------
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_DISCIPLE'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_MISSIONARY');	

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_SWISS_GUARD'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_PIKEMAN');
--------------------------------
-- Unit_AITypes
--------------------------------
INSERT INTO Unit_AITypes 	
			(UnitType, 				UnitAIType)
SELECT		('UNIT_JFD_DISCIPLE'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_ARTIST');
	
INSERT INTO Unit_AITypes 	
			(UnitType, 					UnitAIType)
SELECT		('UNIT_JFD_SWISS_GUARD'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_PIKEMAN');
--------------------------------
-- Unit_Flavors
--------------------------------
INSERT INTO Unit_Flavors 	
			(UnitType, 				FlavorType, Flavor)
SELECT		('UNIT_JFD_DISCIPLE'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_ARTIST');	

UPDATE Unit_Flavors SET Flavor = 10 WHERE FlavorType = 'FLAVOR_CULTURE' AND UnitType = 'UNIT_JFD_DISCIPLE';
	
INSERT INTO Unit_Flavors 	
			(UnitType, 					FlavorType, Flavor)
SELECT		('UNIT_JFD_SWISS_GUARD'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_PIKEMAN');

INSERT INTO Unit_Flavors 
			(UnitType, 					FlavorType, 		Flavor)
VALUES		('UNIT_JFD_SWISS_GUARD', 	'FLAVOR_CULTURE', 	3);
--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions
			(UnitType, 					PromotionType)
SELECT		'UNIT_JFD_SWISS_GUARD',		PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_GERMAN_LANDSKNECHT';

INSERT INTO Unit_FreePromotions 
			(UnitType, 					PromotionType)
VALUES		('UNIT_JFD_SWISS_GUARD', 	'PROMOTION_JFD_SWISS_GUARD');
--------------------------------
-- Unit_UniqueNames
--------------------------------
DELETE FROM Unit_UniqueNames WHERE GreatWorkType IN('GREAT_WORK_REQUIEM'); -- 16/08/20 version of VP added a Requiem great work of music

INSERT INTO Unit_UniqueNames 
			(UnitType, 				UniqueName,													GreatWorkType)
VALUES		--Artists
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_CARAVAGGIO_DESC',					'GREAT_WORK_THE_CRUCIFIXTION_OF_SAINT_PETER'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_GWEN_JOHN_DESC',					'GREAT_WORK_THE_NUN'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_FRA_ANGELICO_DESC',				'GREAT_WORK_PAINTING_OF_SAINT_DOMINIC'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_ENGUERRAND_QUARTON_DESC',			'GREAT_WORK_CORONATION_OF_THE_VIRGIN'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_RAPHAEL_DESC',					'GREAT_WORK_MADONNA'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_MEMLING_DESC',					'GREAT_WORK_LAST_JUDGEMENT'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_PAOLO_DE_MATTEIS_DESC',			'GREAT_WORK_THE_ANNUNCIATION'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_MEISTER_FRANCKE_DESC',			'GREAT_WORK_MAN_OF_SORROWS'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_BARTOLOME_ESTEBAN_MURILLO_DESC',	'GREAT_WORK_LIBERATION_OF_SAINT_PETER'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_MICHELANGELO_DESC',				'GREAT_WORK_FRESCO_OF_THE_LAST_JUDGEMENT'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_SCIPIONE_PULZONE_DESC',			'GREAT_WORK_LAMENTATION'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_EL_GRECO_DESC',					'GREAT_WORK_SAINT_PETER_IN_PENITENCE'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_REMBRANT_DESC',					'GREAT_WORK_THE_STONING_OF_SAINT_STEPHEN'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_REMBRANT_2_DESC',					'GREAT_WORK_ADORATION_OF_THE_MAGI'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_FRA_ANGELICO_2_DESC',				'GREAT_WORK_MADONNA_OF_HUMILITY'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_SANDRO_BOTTICELLI_DESC',			'GREAT_WORK_PAINTING_OF_SAINT_SEBASTIAN'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_PAOLO_VERONESE_DESC',				'GREAT_WORK_THE_WEDDING_AT_CANA'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_MURILLO_DESC',					'GREAT_WORK_IMMACULATE_CONCEPTION'),
			--Musicians
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_PALESTRINA_DESC',					'GREAT_WORK_ALMA_REDEMPTORIS_MATER'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_GREGORIO_ALLEGRI_DESC',			'GREAT_WORK_MISEREREI_MEI_DEUS'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_PALESTRINA_2_DESC',				'GREAT_WORK_MISSA_PAPAE_MARCELLI_CREDO'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_JHERONIMUS_VINDERS_DESC',			'GREAT_WORK_O_MORS_INEVITABILIS'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_ANTOINE_BRUMEL_DESC',				'GREAT_WORK_MISSA_ET_ECCE_TERRAE_MOTUS_GLORIA'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_JOHN_SHEPPARD_DESC',				'GREAT_WORK_MEDIA_VITA'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_JOHANNES_OCKEGHEM_DESC',			'GREAT_WORK_INTEMERATA'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_FRANZ_SCHUBERT_DESC',				'GREAT_WORK_AVE_MARIA'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_VERDI_DESC',						'GREAT_WORK_REQUIEM_DIES_IRAE'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_MOZART_2_DESC',					'GREAT_WORK_REQUIEM'),
			--Writers
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_THE_POPE_DESC',					'GREAT_WORK_HOW_TO_DRESS_FOR_EVERY_OCCASSION_BY_THE_POPE'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_SAINT_BONEVENTURE_DESC',			'GREAT_WORK_THE_SOULS_JOURNEY_TO_GOD'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_BROTHER_LAWRENCE_DESC',			'GREAT_WORK_THE_PRACTICE_OF_THE_PRESCENCE_OF_GOD'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_GEOFFREY_CHAUCER_DESC',			'GREAT_WORK_THE_PARSONS_TALE'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_SAINT_CATHERINE_OF_SIENA_DESC',	'GREAT_WORK_THE_LETTERS_OF_SAINT_CATHERINE_OF_SIENA'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_DANTE_DESC',						'GREAT_WORK_THE_DIVINE_COMEDY'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_ALESSANDRO_MANZONI_DESC',			'GREAT_WORK_THE_BETHROTHED'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_TERESA_OF_AVILA_DESC',			'GREAT_WORK_THE_LIFE_OF_SAINT_TERESA_OF_AVILA_BY_HERSELF'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_ST_FRANCOIS_DE_SALES_DESC',		'GREAT_WORK_INTRODUCTION_TO_THE_DEVOUT_LIFE'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_SAINT_JOHN_OF_THE_CROSS_DESC',	'GREAT_WORK_ASCENT_OF_MOUNT_CARMEL'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_THOMAS_OF_CELANO_DESC',			'GREAT_WORK_DIES_IRAE'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_SAINT_AUGUSTINE_OF_HIPPO_DESC',	'GREAT_WORK_CITY_OF_GOD'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_SAINT_THOMAS_AQUINAS_DESC',		'GREAT_WORK_SUMMA_THEOLOGICA'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_SAINT_THERESA_DE_LISIEUX_DESC',	'GREAT_WORK_STORY_OF_A_SOUL'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_SAINT_GREGORY_THE_GREAT_DESC',	'GREAT_WORK_THE_BOOK_OF_PASTORAL_RULE');
--------------------------------
-- Unit_BuildingClassRequireds
--------------------------------
INSERT INTO Unit_BuildingClassRequireds
			(UnitType, BuildingClassType)
VALUES
			('UNIT_JFD_DISCIPLE','BUILDINGCLASS_PALACE');
--------------------------------
-- Unit_ClassUpgrades
--------------------------------
INSERT INTO Unit_ClassUpgrades
			(UnitType, UnitClassType)
SELECT		'UNIT_JFD_SWISS_GUARD', UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_GERMAN_LANDSKNECHT';
--==========================================================================================================================	
-- MINOR CIVILIZATIONS
--==========================================================================================================================	
-- MinorCivilizations
--------------------------------	
UPDATE MinorCivilizations
SET Description = 'TXT_KEY_CITYSTATE_JFD_KARYES_DESC', ShortDescription = 'TXT_KEY_CITYSTATE_JFD_KARYES_SHORT_DESC', Adjective = 'TXT_KEY_CITYSTATE_JFD_KARYES_ADJECTIVE', Civilopedia = 'TXT_KEY_CIV5_JFD_KARYES_TEXT_1'
WHERE Type = 'MINOR_CIV_VATICAN_CITY';	
--------------------------------	
-- MinorCivilization_CityNames
--------------------------------	
DELETE FROM MinorCivilization_CityNames WHERE MinorCivType = 'MINOR_CIV_VATICAN_CITY';
INSERT INTO MinorCivilization_CityNames
			(MinorCivType, 				CityName)
VALUES		('MINOR_CIV_VATICAN_CITY', 	'TXT_KEY_CITYSTATE_JFD_KARYES');
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations 	
			(Type, 								Description,						ShortDescription, 							Adjective, 							Civilopedia, 								CivilopediaTag, 					DefaultPlayerColor, 				ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 					PortraitIndex, 	AlphaIconAtlas, 					SoundtrackTag, 	MapImage, 								DawnOfManQuote, 						DawnOfManImage)
SELECT		('CIVILIZATION_JFD_PAPAL_STATES'), 	('TXT_KEY_JFD_PAPAL_STATES_DESC'),	('TXT_KEY_JFD_PAPAL_STATES_SHORT_DESC'),	('TXT_KEY_JFD_PAPAL_STATES_ADJ'),	('TXT_KEY_CIV5_JFD_PAPAL_STATES_TEXT_1'), 	('TXT_KEY_CIV5_JFD_PAPAL_STATES'), 	('PLAYERCOLOR_JFD_PAPAL_STATES'), 	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('JFD_PAPAL_STATES_ATLAS'), 0, 				('JFD_PAPAL_STATES_ALPHA_ATLAS'), 	('JFD_Papal'), 	('JFD_MapPapalStatesJuliusII512.dds'),	('TXT_KEY_CIV5_DOM_JULIUS_II_TEXT'), 	('JFD_DOM_PapalStatesJuliusII.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_ROME');
--------------------------------	
-- Civilization_CityNames
--------------------------------	
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
			(CivilizationType, 					UnitClassType, 				UnitType)
VALUES		('CIVILIZATION_JFD_PAPAL_STATES', 	'UNITCLASS_JFD_DISCIPLE',	'UNIT_JFD_DISCIPLE');
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------	
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 					BuildingClassType, 					BuildingType)
VALUES		('CIVILIZATION_JFD_PAPAL_STATES', 	'BUILDINGCLASS_TEMPLE',				'BUILDING_JFD_CHAPEL_MUSIC');
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
			(Type, 							BuildingClass, GreatWorkSlotType, GreatWorkCount,	PrereqTech, Cost, NumCityCostMod, GoldMaintenance, HurryCostModifier, MinAreaSize, ConquestProb, NeverCapture, NukeImmune, NationalPopRequired, Description, 							Civilopedia, 								Help, 										Strategy,										ArtDefineTag, PortraitIndex, 	IconAtlas,							MaxStartEra)
SELECT		('BUILDING_VATICAN_MUSEUMS'),	BuildingClass, GreatWorkSlotType, GreatWorkCount+1,	PrereqTech, Cost, NumCityCostMod, GoldMaintenance, HurryCostModifier, MinAreaSize, ConquestProb, NeverCapture, NukeImmune, NationalPopRequired, ('TXT_KEY_BUILDING_VATICAN_MUSEUMS'), 	('TXT_KEY_BUILDING_VATICAN_MUSEUMS_PEDIA'),	('TXT_KEY_BUILDING_VATICAN_MUSEUMS_HELP'), 	('TXT_KEY_BUILDING_VATICAN_MUSEUMS_STRATEGY'),	ArtDefineTag, 0, 				('JFD_PAPAL_STATES_FOR_VP_ATLAS'),	MaxStartEra
FROM Buildings WHERE Type = 'BUILDING_HERMITAGE';

UPDATE Buildings SET CultureRateModifier = 25, GlobalLandmarksTourismPercent = 25, GlobalGreatWorksTourismModifier = 25, ThemingBonusHelp = 'TXT_KEY_VATICAN_MUSEUMS_THEMING_BONUS_HELP' WHERE Type = 'BUILDING_VATICAN_MUSEUMS' ;
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
			(BuildingType, Description, Bonus, UniqueEras, MustBeArt, RequiresUniquePlayers, AIPriority)
SELECT		'BUILDING_VATICAN_MUSEUMS', 'TXT_KEY_THEMING_BONUS_VATICAN_MUSEUMS', 10, UniqueEras, MustBeArt, RequiresUniquePlayers, AIPriority
FROM Building_ThemingBonuses WHERE BuildingType = 'BUILDING_HERMITAGE';
--------------------------------
-- Building_ThemingYieldBonus
--------------------------------
INSERT INTO Building_ThemingYieldBonus
			(BuildingType, YieldType, Yield)
SELECT		'BUILDING_VATICAN_MUSEUMS', 'YIELD_GOLD', 10;
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
--------------------------------
-- Units
--------------------------------
UPDATE Units SET MinorCivGift = 0 WHERE Type = 'UNIT_JFD_SWISS_GUARD' ;
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------
INSERT INTO Civilization_UnitClassOverrides
		(CivilizationType, UnitClassType, UnitType)
SELECT	'CIVILIZATION_JFD_PAPAL_STATES', 'UNITCLASS_JFD_SWISS_GUARD', 'UNIT_JFD_SWISS_GUARD';
--------------------------------	
-- Civilization_BuildingClassOverrides
--------------------------------	
INSERT INTO Civilization_BuildingClassOverrides
		(CivilizationType, BuildingClassType, BuildingType)
SELECT	'CIVILIZATION_JFD_PAPAL_STATES', 'BUILDINGCLASS_HERMITAGE', 'BUILDING_VATICAN_MUSEUMS';
--------------------------------	
-- Trigger for the above (mysterious load order issues with 4UC)
--------------------------------
CREATE TRIGGER JFDPapalStatesForVP_4UC
AFTER INSERT ON Buildings 
WHEN NEW.Type = 'BUILDING_GERMANY_TEUTONIC_ORDER'
BEGIN
	INSERT INTO Buildings 	
				(Type, 							BuildingClass, GreatWorkSlotType, GreatWorkCount,	PrereqTech, Cost, NumCityCostMod, GoldMaintenance, HurryCostModifier, MinAreaSize, ConquestProb, NeverCapture, NukeImmune, NationalPopRequired, Description, 							Civilopedia, 								Help, 										Strategy,										ArtDefineTag, PortraitIndex, 	IconAtlas,							MaxStartEra)
	SELECT		('BUILDING_VATICAN_MUSEUMS'),	BuildingClass, GreatWorkSlotType, GreatWorkCount+1,	PrereqTech, Cost, NumCityCostMod, GoldMaintenance, HurryCostModifier, MinAreaSize, ConquestProb, NeverCapture, NukeImmune, NationalPopRequired, ('TXT_KEY_BUILDING_VATICAN_MUSEUMS'), 	('TXT_KEY_BUILDING_VATICAN_MUSEUMS_PEDIA'),	('TXT_KEY_BUILDING_VATICAN_MUSEUMS_HELP'), 	('TXT_KEY_BUILDING_VATICAN_MUSEUMS_STRATEGY'),	ArtDefineTag, 0, 				('JFD_PAPAL_STATES_FOR_VP_ATLAS'),	MaxStartEra
	FROM Buildings WHERE Type = 'BUILDING_HERMITAGE';

	UPDATE Buildings SET CultureRateModifier = 25, GlobalLandmarksTourismPercent = 25, GlobalGreatWorksTourismModifier = 25, ThemingBonusHelp = 'TXT_KEY_VATICAN_MUSEUMS_THEMING_BONUS_HELP' WHERE Type = 'BUILDING_VATICAN_MUSEUMS';

	INSERT INTO Building_YieldChangesPerPop
				(BuildingType, YieldType, Yield)
	VALUES		('BUILDING_VATICAN_MUSEUMS', 'YIELD_CULTURE', 50);

	INSERT INTO Building_ThemingBonuses
				(BuildingType, Description, Bonus, UniqueEras, MustBeArt, RequiresUniquePlayers, AIPriority)
	SELECT		'BUILDING_VATICAN_MUSEUMS', 'TXT_KEY_THEMING_BONUS_VATICAN_MUSEUMS', 10, UniqueEras, MustBeArt, RequiresUniquePlayers, AIPriority
	FROM Building_ThemingBonuses WHERE BuildingType = 'BUILDING_HERMITAGE';

	INSERT INTO Building_ThemingYieldBonus
				(BuildingType, YieldType, Yield)
	VALUES		('BUILDING_VATICAN_MUSEUMS', 'YIELD_GOLD', 10);

	INSERT INTO Building_BuildingClassYieldChanges
				(BuildingType, BuildingClassType, YieldType, YieldChange)
	SELECT		'BUILDING_VATICAN_MUSEUMS', Type, 'YIELD_TOURISM', 2
	FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_TEMPLE', 'BUILDINGCLASS_JFD_CHAPEL_ART', 'BUILDINGCLASS_JFD_CHAPEL_WRITING');

	INSERT INTO Building_FreeUnits
				(BuildingType, UnitType, NumUnits)
	VALUES		('BUILDING_VATICAN_MUSEUMS', 'UNIT_ARTIST', 1);

	UPDATE Units SET MinorCivGift = 0 WHERE Type = 'UNIT_JFD_SWISS_GUARD';

	INSERT INTO Civilization_UnitClassOverrides
			(CivilizationType, UnitClassType, UnitType)
	VALUES	('CIVILIZATION_JFD_PAPAL_STATES', 'UNITCLASS_JFD_SWISS_GUARD', 'UNIT_JFD_SWISS_GUARD');

	INSERT INTO Civilization_BuildingClassOverrides
			(CivilizationType, BuildingClassType, BuildingType)
	VALUES	('CIVILIZATION_JFD_PAPAL_STATES', 'BUILDINGCLASS_HERMITAGE', 'BUILDING_VATICAN_MUSEUMS');

	INSERT INTO Trait_FreePromotionUnitCombats (TraitType, UnitCombatType, PromotionType)
	SELECT	'TRAIT_JFD_PAPAL_STATES','UNITCOMBAT_MELEE','PROMOTION_JFD_SWISS_GUARD'
	WHERE EXISTS (SELECT * FROM Trait_FreePromotionUnitClass WHERE TraitType ='TRAIT_CARNIVAL' AND UnitClassType = 'UNITCLASS_PATHFINDER');

	INSERT INTO Trait_FreePromotionUnitCombats (TraitType, UnitCombatType, PromotionType)
	SELECT	'TRAIT_JFD_PAPAL_STATES','UNITCOMBAT_GUN','PROMOTION_JFD_SWISS_GUARD'
	WHERE EXISTS (SELECT * FROM Trait_FreePromotionUnitClass WHERE TraitType ='TRAIT_CARNIVAL' AND UnitClassType = 'UNITCLASS_PATHFINDER');
END;
--==========================================================================================================================
-- UNIQUE UNIT LINE + MORE UNIQUE COMPONENTS FOR VP (NEW)
--==========================================================================================================================
INSERT INTO Trait_FreePromotionUnitCombats (TraitType, UnitCombatType, PromotionType)
SELECT	'TRAIT_JFD_PAPAL_STATES','UNITCOMBAT_MELEE','PROMOTION_JFD_SWISS_GUARD'
WHERE EXISTS (SELECT * FROM Trait_FreePromotionUnitClass WHERE TraitType ='TRAIT_CARNIVAL' AND UnitClassType = 'UNITCLASS_PATHFINDER' ) ;

INSERT INTO Trait_FreePromotionUnitCombats (TraitType, UnitCombatType, PromotionType)
SELECT	'TRAIT_JFD_PAPAL_STATES','UNITCOMBAT_GUN','PROMOTION_JFD_SWISS_GUARD'
WHERE EXISTS (SELECT * FROM Trait_FreePromotionUnitClass WHERE TraitType ='TRAIT_CARNIVAL' AND UnitClassType = 'UNITCLASS_PATHFINDER' ) ;
--==========================================================================================================================
--==========================================================================================================================