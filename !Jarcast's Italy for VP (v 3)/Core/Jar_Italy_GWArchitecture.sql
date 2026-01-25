--=======================================================================================================================
-- Great Works of Architecture (90)
--=======================================================================================================================
-- BuildingClasses
--------------------------------
INSERT OR REPLACE INTO BuildingClasses
		(DefaultBuilding, 			Type, 						Description)
VALUES	('BUILDING_JAR_GWA_000',	'BUILDINGCLASS_JAR_GWA',	'TXT_KEY_BUILDING_JAR_GWA_000');
--------------------------------
-- Buildings
--------------------------------
DROP TABLE IF EXISTS Jar_Helper;
CREATE TEMP TABLE Jar_Helper (GWArcID INTEGER );
INSERT INTO Jar_Helper (GWArcID)
VALUES 	(1),(2),(3),(4),(5),(6),(7),(8),(9),(10),
		(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),
		(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),
		(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),
		(41),(42),(43),(44),(45),(46),(47),(48),(49),(50),
		(51),(52),(53),(54),(55),(56),(57),(58),(59),(60),
		(61),(62),(63),(64),(65),(66),(67),(68),(69),(70),
		(71),(72),(73),(74),(75),(76),(77),(78),(79),(80),
		(81),(82),(83),(84),(85),(86),(87),(88),(89),(90);

INSERT OR REPLACE INTO Buildings
		(Type, 							BuildingClass, 				PortraitIndex, 	IconAtlas,				Quote,												WonderSplashImage,				WonderSplashAnchor,	Cost,	FaithCost,	PrereqTech,			ConquestProb,	NukeImmune,	MinAreaSize,	Description,		Help)
SELECT	'BUILDING_JAR_GWA_00'||GWArcID, 'BUILDINGCLASS_JAR_GWA',	GWArcID-1,		'JAR_ITALY_GWA_ATLAS',	'TXT_KEY_BUILDING_JAR_GWA_00'||GWArcID||'_QUOTE',	'GWA_Splash_00'||GWArcID||'.dds','R,T',				-1,		-1,			'TECH_FUTURE_TECH',	100,			1,			-1,				'TXT_KEY_BUILDING_JAR_GWA_00'||GWArcID, 'TXT_KEY_BUILDING_JAR_GWA_HELP'
FROM Jar_Helper WHERE GWArcID<10;

INSERT OR REPLACE INTO Buildings
		(Type, 							BuildingClass, 				PortraitIndex, 	IconAtlas,				Quote,												WonderSplashImage,				WonderSplashAnchor,	Cost,	FaithCost,	PrereqTech,			ConquestProb,	NukeImmune,	MinAreaSize,	Description,		Help)
SELECT	'BUILDING_JAR_GWA_0'||GWArcID, 	'BUILDINGCLASS_JAR_GWA',	GWArcID-1,		'JAR_ITALY_GWA_ATLAS',	'TXT_KEY_BUILDING_JAR_GWA_0'||GWArcID||'_QUOTE',	'GWA_Splash_0'||GWArcID||'.dds','R,T',				-1,		-1,			'TECH_FUTURE_TECH',	100,			1,			-1,				'TXT_KEY_BUILDING_JAR_GWA_0'||GWArcID, 'TXT_KEY_BUILDING_JAR_GWA_HELP'
FROM Jar_Helper WHERE GWArcID>9;

CREATE TABLE IF NOT EXISTS Jar_GWArchitecture(BuildingType, EraType);
INSERT INTO Jar_GWArchitecture
		(BuildingType,					EraType)
SELECT	'BUILDING_JAR_GWA_00'||GWArcID,	'ERA_ANCIENT' 		FROM Jar_Helper WHERE GWArcID<=5 UNION ALL
SELECT	'BUILDING_JAR_GWA_00'||GWArcID,	'ERA_CLASSICAL' 	FROM Jar_Helper WHERE GWArcID> 5 AND GWArcID<=9 UNION ALL
SELECT	'BUILDING_JAR_GWA_0'||GWArcID,	'ERA_CLASSICAL' 	FROM Jar_Helper WHERE GWArcID> 9 AND GWArcID<=15 UNION ALL
SELECT	'BUILDING_JAR_GWA_0'||GWArcID,	'ERA_MEDIEVAL' 		FROM Jar_Helper WHERE GWArcID>15 AND GWArcID<=35 UNION ALL
SELECT	'BUILDING_JAR_GWA_0'||GWArcID,	'ERA_RENAISSANCE' 	FROM Jar_Helper WHERE GWArcID>35 AND GWArcID<=55 UNION ALL
SELECT	'BUILDING_JAR_GWA_0'||GWArcID,	'ERA_RENAISSANCE' 	FROM Jar_Helper WHERE GWArcID>55 AND GWArcID<=65 UNION ALL
SELECT	'BUILDING_JAR_GWA_0'||GWArcID,	'ERA_INDUSTRIAL' 	FROM Jar_Helper WHERE GWArcID>65 AND GWArcID<=75 UNION ALL
SELECT	'BUILDING_JAR_GWA_0'||GWArcID,	'ERA_MODERN' 		FROM Jar_Helper WHERE GWArcID>75 AND GWArcID<=80 UNION ALL
SELECT	'BUILDING_JAR_GWA_0'||GWArcID,	'ERA_POSTMODERN' 	FROM Jar_Helper WHERE GWArcID>80 AND GWArcID<=85 UNION ALL
SELECT	'BUILDING_JAR_GWA_0'||GWArcID,	'ERA_FUTURE' 		FROM Jar_Helper WHERE GWArcID>85 AND GWArcID<=90;
--------------------------------
-- Building_YieldChanges
--------------------------------
INSERT INTO Building_YieldChanges
		(BuildingType,	YieldType, Yield)
SELECT 	Type, 			'YIELD_CULTURE',			3 FROM Buildings where BuildingClass = 'BUILDINGCLASS_JAR_GWA' UNION ALL
SELECT 	Type, 			'YIELD_TOURISM',			3 FROM Buildings where BuildingClass = 'BUILDINGCLASS_JAR_GWA';
--------------------------------
-- Policy_BuildingClassYieldChanges
--------------------------------
INSERT INTO Policy_BuildingClassYieldChanges
		(PolicyType, BuildingClassType, 	YieldType, YieldChange)
SELECT	PolicyType, 'BUILDINGCLASS_JAR_GWA',YieldType, Yield
FROM Policy_GreatWorkYieldChanges;
--------------------------------
-- Belief_BuildingClassYieldChanges
--------------------------------
INSERT INTO Belief_BuildingClassYieldChanges
		(BeliefType, BuildingClassType, 	YieldType, YieldChange)
SELECT	BeliefType, 'BUILDINGCLASS_JAR_GWA',YieldType, Yield
FROM Belief_GreatWorkYieldChanges;
--------------------------------
-- Building_BuildingClassYieldChanges
--------------------------------
INSERT INTO Building_BuildingClassYieldChanges 
		(BuildingType,			BuildingClassType,		YieldType,	YieldChange) 
SELECT DISTINCT BuildingType,	'BUILDINGCLASS_JAR_GWA',YieldType,	Yield
FROM Building_GreatWorkYieldChanges;
--------------------------------
-- SQL TRIGGERS
--------------------------------
CREATE TRIGGER IF NOT EXISTS JarGWAPolicy AFTER INSERT ON Policy_GreatWorkYieldChanges
WHEN NEW.PolicyType IS NOT NULL
BEGIN
	INSERT INTO Policy_BuildingClassYieldChanges
			(PolicyType, BuildingClassType, 		YieldType, YieldChange)
	SELECT	NEW.PolicyType, 'BUILDINGCLASS_JAR_GWA', NEW.YieldType, NEW.Yield;
END;
--
CREATE TRIGGER IF NOT EXISTS JarGWABelief AFTER INSERT ON Belief_GreatWorkYieldChanges
WHEN NEW.BeliefType IS NOT NULL
BEGIN
	INSERT INTO Belief_BuildingClassYieldChanges
			(BeliefType, BuildingClassType, 		YieldType, YieldChange)
	SELECT	NEW.BeliefType, 'BUILDINGCLASS_JAR_GWA', NEW.YieldType, NEW.Yield;
END;
--
CREATE TRIGGER IF NOT EXISTS JarGWABuilding AFTER INSERT ON Building_GreatWorkYieldChanges
WHEN NEW.BuildingType IS NOT NULL
BEGIN
	INSERT INTO Building_BuildingClassYieldChanges
			(BuildingType, BuildingClassType, 		YieldType, YieldChange)
	SELECT	NEW.BuildingType, 'BUILDINGCLASS_JAR_GWA', NEW.YieldType, NEW.Yield;
END;
--==========================================================================================================================
-- IconTextureAtlases
--==========================================================================================================================
INSERT INTO IconTextureAtlases 
		(Atlas, 						IconSize, 	Filename, 			IconsPerRow, 	IconsPerColumn)
VALUES	('JAR_ITALY_GWA_ATLAS', 		256, 		'GWA_atlas256.dds',	10, 				10),
		('JAR_ITALY_GWA_ATLAS', 		128, 		'GWA_atlas128.dds',	10, 				10),
		('JAR_ITALY_GWA_ATLAS', 		80, 		'GWA_atlas80.dds',	10, 				10),
		('JAR_ITALY_GWA_ATLAS', 		64, 		'GWA_atlas64.dds',	10, 				10),
		('JAR_ITALY_GWA_ATLAS', 		45, 		'GWA_atlas45.dds',	10, 				10),
		('JAR_ITALY_GWA_ATLAS', 		32, 		'GWA_atlas32.dds',	10, 				10),
		('JAR_ITALY_GWA_ATLAS', 		24, 		'GWA_atlas24.dds',	10, 				10);
--==========================================================================================================================	
-- Language_en_US
--==========================================================================================================================
INSERT OR REPLACE INTO Language_en_US (Tag, Text)
SELECT 'TXT_KEY_BUILDING_JAR_GWA_HELP', ' ' UNION ALL
SELECT 'TXT_KEY_BUILDING_JAR_GWA_HELP_CUT', ' ' UNION ALL
SELECT 'TXT_KEY_BUILDING_JAR_GWA_00'||GWArcID, ' ' FROM Jar_Helper WHERE GWArcID<10 UNION ALL
SELECT 'TXT_KEY_BUILDING_JAR_GWA_0'||GWArcID,  ' ' FROM Jar_Helper WHERE GWArcID>9 UNION ALL
SELECT 'TXT_KEY_BUILDING_JAR_GWA_00'||GWArcID||'_QUOTE', ' ' FROM Jar_Helper WHERE GWArcID<10 UNION ALL
SELECT 'TXT_KEY_BUILDING_JAR_GWA_0'||GWArcID||'_QUOTE',  ' ' FROM Jar_Helper WHERE GWArcID>9;

UPDATE Language_en_US SET Text='[ICON_WONDER] Sassi'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_001';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Sassi. [NEWLINE][TAB][TAB]Matera, 7000 BC.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_001_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Palù di Livenza'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_002';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Pile-dwelling sites of Palù di Livenza. [NEWLINE][TAB][TAB]Polcenigo, 47th-35th centuries BC.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_002_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Terramara di Montale'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_003';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Terramara di Montale. [NEWLINE][TAB][TAB]Castelnuovo Rangone, 17th-12th century BC.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_003_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Su Nuraxi'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_004';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Su Nuraxi. [NEWLINE][TAB][TAB]Barumini, 16th-14th century BC.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_004_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Necropolis of Pantalica'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_005';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Necropolis of Pantalica. [NEWLINE][TAB][TAB]Syracuse, 13th-7th centuries BC.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_005_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Necropolis of the Banditaccia'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_006';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Necropolis of the Banditaccia. [NEWLINE][TAB][TAB]Cerveteri, 9th-3rd century BC.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_006_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Temple of Poseidon'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_007';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Temple of Poseidon. [NEWLINE][TAB][TAB]Paestum, 460-450 BC.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_007_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Temple of Concordia'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_008';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Temple of Concordia. [NEWLINE][TAB][TAB]Agrigento,440-430 BC.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_008_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Theatre of Syracuse'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_009';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Theatre. [NEWLINE][TAB][TAB]Syracuse, 3rd century BC.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_009_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Arena of Verona'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_010';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Arena. [NEWLINE][TAB][TAB]Verona, 30 AD.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_010_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Villa of the Mysteries'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_011';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Villa of the Mysteries. [NEWLINE][TAB][TAB]Pompeii, 79 AD.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_011_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Pantheon'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_012';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Pantheon. [NEWLINE][TAB][TAB]Rome, 124 AD.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_012_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Hadrian''s Villa'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_013';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Hadrian''s Villa. [NEWLINE][TAB][TAB]Tivoli, 121 AD.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_013_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Villa of Casale'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_014';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Villa of Casale. [NEWLINE][TAB][TAB]Piazza Armerina, 4th century AD.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_014_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Basilica of San Vitale'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_015';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Basilica of San Vitale. [NEWLINE][TAB][TAB]Ravenna, 547 AD.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_015_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Oratory of Santa Maria in Valle'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_016';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Oratory of Santa Maria in Valle. [NEWLINE][TAB][TAB]Cividale del Friuli, 8th century AD.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_016_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Cattolica di Stilo'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_017';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Cattolica di Stilo. [NEWLINE][TAB][TAB]Stilo, 10th-11th century AD.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_017_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Santa Maria Assunta'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_018';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Basilica di Santa Maria Assunta. [NEWLINE][TAB][TAB]Aquileia, 1031.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_018_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Otranto Cathedral'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_019';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Basilica Cattedrale di Santa Maria Annunziata. [NEWLINE][TAB][TAB]Otranto, 1088.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_019_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] St. Mark Basilica'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_020';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]St. Mark Basilica. [NEWLINE][TAB][TAB]Venice, 1092.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_020_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Asinelli Tower'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_021';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Asinelli Tower. [NEWLINE][TAB][TAB]Bologna, 1119.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_021_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] La Lanterna'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_022';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Lanterna di Genova. [NEWLINE][TAB][TAB]Genoa, 1128.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_022_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Norman Palace'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_023';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Norman Palace. [NEWLINE][TAB][TAB]Palermo, 1130.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_023_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Baptistery of St. John'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_024';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Battistero di San Giovanni. [NEWLINE][TAB][TAB]Pisa, 1152.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_024_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Modena Cathedral'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_025';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Duomo di Modena. [NEWLINE][TAB][TAB]Modena, 1184.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_025_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Castel del Monte'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_026';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Castel del Monte. [NEWLINE][TAB][TAB]Andria, 1240.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_026_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] San Francesco d''Assisi'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_027';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Basilica di San Francesco d''Assisi. [NEWLINE][TAB][TAB]Assisi, 1253.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_027_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Cefalù Cathedral'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_028';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Duomo di Cefalù. [NEWLINE][TAB][TAB]Cefalù, 1267.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_028_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Castel Nuovo'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_029';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Castel Nuovo. [NEWLINE][TAB][TAB]Naples, 1282.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_029_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Palazzo Vecchio'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_030';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Palazzo Vecchio. [NEWLINE][TAB][TAB]Florence, 1299.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_030_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Scrovegni Chapel'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_031';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Cappella degli Scrovegni. [NEWLINE][TAB][TAB]Padua, 1305.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_031_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Torre Grossa'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_032';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Torre Grossa. [NEWLINE][TAB][TAB]San Gimignano, 1310.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_032_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Piazza del Campo'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_033';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Piazza del Campo. [NEWLINE][TAB][TAB]Siena, 1349.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_033_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Milan Cathedral'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_034';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Duomo di Milano. [NEWLINE][TAB][TAB]Milan, started in 1387, completed in 1965.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_034_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Scaliger Tombs'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_035';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Arche scaligere. [NEWLINE][TAB][TAB]Verona, 14th century.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_035_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Santa Maria Novella'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_036';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Basilica di Santa Maria Novella. [NEWLINE][TAB][TAB]Florence, 1420.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_036_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Santa Maria del Fiore'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_037';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Cattedrale di Santa Maria del Fiore. [NEWLINE][TAB][TAB]Florence, 1436.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_037_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Ducal Palace of Urbino'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_038';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Ducal Palace. [NEWLINE][TAB][TAB]Urbino, 1454.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_038_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Palazzo Medici Riccardi'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_039';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Palazzo Medici Riccardi. [NEWLINE][TAB][TAB]Florence, 1460.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_039_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Piazza Pio II'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_040';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Piazza Pio II. [NEWLINE][TAB][TAB]Pienza, 1462.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_040_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Santa Maria delle Grazie'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_041';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Santa Maria delle Grazie. [NEWLINE][TAB][TAB]Milan, 1469.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_041_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Sacred Mountain of Varallo'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_042';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Sacro Monte di Varallo. [NEWLINE][TAB][TAB]Varallo, 1480.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_042_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Castello Sforzesco'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_043';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Castello Sforzesco. [NEWLINE][TAB][TAB]Milan, 1499.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_043_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Palazzo dei Diamanti'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_044';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Palazzo dei Diamanti. [NEWLINE][TAB][TAB]Ferrara, 1503.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_044_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Medici Villa'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_045';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Villa medicea di Poggio a Caiano. [NEWLINE][TAB][TAB]Poggio a Caiano, 1520.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_045_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Botanical Garden of Padua'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_046';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Orto botanico di Padova. [NEWLINE][TAB][TAB]Padua, 1545.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_046_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Palazzo Te'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_047';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Palazzo Te. [NEWLINE][TAB][TAB] Mantua, 1534.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_047_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Villa d''Este'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_048';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Villa d''Este. [NEWLINE][TAB][TAB]Tivoli, 1560.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_048_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Biblioteca Marciana'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_049';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Biblioteca Marciana. [NEWLINE][TAB][TAB]Venice, 1588.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_049_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Palmanova'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_050';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Fortified city of Palmanova. [NEWLINE][TAB][TAB]Palmanova, 1593.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_050_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Villa La Rotonda'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_051';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Villa La Rotonda. [NEWLINE][TAB][TAB]Vicenza, 1605.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_051_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] St. Peter''s Basilica'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_052';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Basilica di San Pietro. [NEWLINE][TAB][TAB]Rome, 1626.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_052_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Trulli of Alberobello'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_053';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Trulli. [NEWLINE][TAB][TAB]Alberobello, 1635.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_053_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Basilica of Santa Croce'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_054';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Basilica di Santa Croce. [NEWLINE][TAB][TAB]Lecce, 1646.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_054_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Palazzo Stefano Balbi'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_055';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Palazzo Stefano Balbi. [NEWLINE][TAB][TAB]Genoa, 1650.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_055_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Portico di San Luca'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_056';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Portico di San Luca. [NEWLINE][TAB][TAB]Bologna, 1721.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_056_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Piazza di Spagna'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_057';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Piazza di Spagna. [NEWLINE][TAB][TAB]Rome, 1725.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_057_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Stupinigi'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_058';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Palazzina di caccia of Stupinigi. [NEWLINE][TAB][TAB]Turin, 1737.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_058_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] San Carlo Theatre'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_059';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Real Teatro di San Carlo. [NEWLINE][TAB][TAB]Naples, 1737.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_059_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Royal Palace of Caserta'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_060';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Reggia di Caserta. [NEWLINE][TAB][TAB]Caserta, 1752.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_060_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Catania Cathedral'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_061';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Cattedrale di Sant''Agata. [NEWLINE][TAB][TAB]Catania, 1761.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_061_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Trevi Fountain'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_062';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Fontana di Trevi. [NEWLINE][TAB][TAB]Rome, 1762.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_062_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] La Scala'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_063';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Teatro alla Scala. [NEWLINE][TAB][TAB]Milan, 1778.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_063_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Bourbon Hospice for the Poor'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_064';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Real Albergo dei Poveri. [NEWLINE][TAB][TAB]Naples, started in 1751, unfinished.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_064_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Certosa di Padula'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_065';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Certosa di San Lorenzo di Padula.[NEWLINE][TAB][TAB]Padula, 1779.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_065_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Palazzina Cinese'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_066';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Palazzina Cinese. [NEWLINE][TAB][TAB]Palermo, 1806.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_066_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Piazza del Popolo'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_067';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Piazza del Popolo. [NEWLINE][TAB][TAB]Rome, 1818.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_067_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Villa Pignatelli'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_068';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Villa Pignatelli. [NEWLINE][TAB][TAB]Naples, 1830.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_068_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Tempio Canoviano'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_069';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Tempio Canoviano. [NEWLINE][TAB][TAB]Possagno, 1832.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_069_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Cisternoni of Livorno'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_070';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Cisternone. [NEWLINE][TAB][TAB]Livorno, 1842.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_070_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] San Francesco di Paola'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_071';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Basilica di San Francesco di Paola. [NEWLINE][TAB][TAB]Naples, 1846.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_071_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] San Paolo fuori le mura'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_072';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Basilica di San Paolo fuori le mura. [NEWLINE][TAB][TAB]Rome, 1840; rebuilt after a fire in 1854.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_072_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Galleria Vittorio Emanuele II'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_073';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Galleria Vittorio Emanuele II. [NEWLINE][TAB][TAB]Milan, 1867.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_073_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Crespi d''Adda'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_074';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Crespi d''Adda. [NEWLINE][TAB][TAB]Capriate San Gervasio, 1877.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_074_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Mole Antonelliana'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_075';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Mole Antonelliana. [NEWLINE][TAB][TAB]Turin, 1889.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_075_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Villino Florio'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_076';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Villino Florio. [NEWLINE][TAB][TAB]Palermo, 1902.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_076_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Palazzo Castiglioni'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_077';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Palazzo Castiglioni. [NEWLINE][TAB][TAB]Milan, 1904.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_077_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Vittoriano'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_078';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Vittoriano, or Altare della Patria. [NEWLINE][TAB][TAB]Rome, 1911.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_078_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Lingotto'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_079';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Lingotto. [NEWLINE][TAB]Turin, 1923.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_079_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Palazzo della Civiltà Italiana'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_080';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Palazzo della Civiltà Italiana. [NEWLINE][TAB][TAB]Rome, 1938.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_080_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Casa del Girasole'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_081';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Casa del Girasole. [NEWLINE][TAB][TAB]Rome, 1950.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_081_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Pirelli Tower'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_082';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Grattacielo Pirelli. [NEWLINE][TAB][TAB]Milan, 1958.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_082_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Industrial City of Ivrea'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_083';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Complesso Olivetti. [NEWLINE][TAB][TAB]Ivrea, founded in 1896, completed in the 1960s.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_083_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] San Giovanni Battista'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_084';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Chiesa di San Giovanni Battista. [NEWLINE][TAB][TAB]Campi Bisenzio, 1964.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_084_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Teatro del Mondo'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_085';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Teatro del Mondo. [NEWLINE][TAB][TAB]Venice, 1979.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_085_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Stadio San Nicola'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_086';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Stadio San Nicola. [NEWLINE][TAB][TAB]Bari, 1990.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_086_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Mosque of Rome'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_087';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Grande Moschea di Roma. [NEWLINE][TAB][TAB]Rome, 1995.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_087_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Stazioni dell''arte'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_088';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Art Stations of Naples Metro. [NEWLINE][TAB][TAB]Naples,2001.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_088_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Fiera Milano Rho'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_089';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Fiera Milano Rho complex. [NEWLINE][TAB][TAB]Rho, 2005.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_089_QUOTE';

UPDATE Language_en_US SET Text='[ICON_WONDER] Bosco Verticale'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_090';
UPDATE Language_en_US SET Text='[NEWLINE][TAB][TAB]Bosco Verticale. [NEWLINE][TAB][TAB]Milan, 2014.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_090_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 사시'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_001';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]사시. [NEWLINE][TAB][TAB]마테라, 기원전 7000년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_001_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 리벤차 습지'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_002';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]리벤차 습지의 말뚝가옥 유적. [NEWLINE][TAB][TAB]폴체니고, 기원전 47~35세기.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_002_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 몬탈레 테라마라'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_003';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]몬탈레 테라마라. [NEWLINE][TAB][TAB]카스텔누오보 랑고네, 기원전 17~12세기.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_003_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 수 누라지'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_004';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]수 누라지. [NEWLINE][TAB][TAB]바루미니, 기원전 16~14세기.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_004_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 판탈리카 네크로폴리스'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_005';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]판탈리카의 네크로폴리스. [NEWLINE][TAB][TAB]시라쿠사, 기원전 13~7세기.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_005_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 반디타차 네크로폴리스'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_006';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]반디타차의 네크로폴리스. [NEWLINE][TAB][TAB]체르베테리, 기원전 9~3세기.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_006_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 포세이돈 신전'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_007';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]포세이돈 신전. [NEWLINE][TAB][TAB]파에스툼, 기원전 460~450년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_007_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 콩코르디아 신전'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_008';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]콩코르디아 신전. [NEWLINE][TAB][TAB]아그리젠토, 기원전 440~430년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_008_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 시라쿠사 극장'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_009';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]극장. [NEWLINE][TAB][TAB]시라쿠사, 기원전 3세기.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_009_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 베로나 원형경기장'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_010';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]원형경기장. [NEWLINE][TAB][TAB]베로나, 서기 30년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_010_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 신비의 빌라'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_011';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]신비의 빌라. [NEWLINE][TAB][TAB]폼페이, 서기 79년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_011_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 판테온'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_012';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]판테온. [NEWLINE][TAB][TAB]로마, 서기 124년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_012_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 하드리아누스의 빌라'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_013';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]하드리아누스의 빌라. [NEWLINE][TAB][TAB]티볼리, 서기 121년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_013_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 카살레 빌라'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_014';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]카살레 빌라. [NEWLINE][TAB][TAB]피아차 아르메리나, 서기 4세기.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_014_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 산 비탈레 대성당'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_015';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]산 비탈레 대성당. [NEWLINE][TAB][TAB]라벤나, 서기 547년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_015_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 산타 마리아 인 발레 경당'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_016';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]산타 마리아 인 발레 경당. [NEWLINE][TAB][TAB]치비달레 델 프리울리, 서기 8세기.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_016_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 스틸로의 카톨리카'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_017';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]스틸로의 카톨리카. [NEWLINE][TAB][TAB]스틸로, 서기 10~11세기.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_017_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 산타 마리아 아순타 대성당'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_018';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]산타 마리아 아순타 대성당. [NEWLINE][TAB][TAB]아퀼레이아, 서기 1031년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_018_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 오트란토 대성당'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_019';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]산타 마리아 안눈치아타 대성당. [NEWLINE][TAB][TAB]오트란토, 1088년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_019_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 산 마르코 대성당'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_020';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]산 마르코 대성당. [NEWLINE][TAB][TAB]베네치아, 1092년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_020_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 아시넬리 탑'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_021';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]아시넬리 탑. [NEWLINE][TAB][TAB]볼로냐, 1119년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_021_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 라 란테르나'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_022';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]제노바의 등대. [NEWLINE][TAB][TAB]제노바, 1128년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_022_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 노르만 궁전'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_023';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]노르만 궁전. [NEWLINE][TAB][TAB]팔레르모, 1130년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_023_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 세례당 성 요한'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_024';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]산 조반니 세례당. [NEWLINE][TAB][TAB]피사, 1152년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_024_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 모데나 대성당'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_025';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]모데나 대성당. [NEWLINE][TAB][TAB]모데나, 1184년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_025_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 카스텔 델 몬테'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_026';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]카스텔 델 몬테. [NEWLINE][TAB][TAB]안드리아, 1240년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_026_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 산 프란체스코 다시시'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_027';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]산 프란체스코 다시시 대성당. [NEWLINE][TAB][TAB]아시시, 1253년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_027_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 체팔루 대성당'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_028';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]체팔루 대성당. [NEWLINE][TAB][TAB]체팔루, 1267년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_028_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 카스텔 누오보'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_029';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]카스텔 누오보. [NEWLINE][TAB][TAB]나폴리, 1282년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_029_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 팔라초 베키오'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_030';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]팔라초 베키오. [NEWLINE][TAB][TAB]피렌체, 1299년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_030_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 스크로베니 예배당'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_031';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]스크로베니 예배당. [NEWLINE][TAB][TAB]파도바, 1305년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_031_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 토레 그로사'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_032';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]토레 그로사. [NEWLINE][TAB][TAB]산 지미냐노, 1310년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_032_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 캄포 광장'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_033';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]캄포 광장. [NEWLINE][TAB][TAB]시에나, 1349년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_033_QUOTE';
UPDATE Language_ko_KR SET Text='[ICON_WONDER] 밀라노 대성당'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_034';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]두오모 디 밀라노. [NEWLINE][TAB][TAB]밀라노, 1387년 착공, 1965년 완공.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_034_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 스칼리제르 무덤'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_035';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]아르케 스칼리제레. [NEWLINE][TAB][TAB]베로나, 14세기.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_035_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 산타 마리아 노벨라'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_036';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]산타 마리아 노벨라 대성당. [NEWLINE][TAB][TAB]피렌체, 1420년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_036_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 산타 마리아 델 피오레'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_037';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]산타 마리아 델 피오레 대성당. [NEWLINE][TAB][TAB]피렌체, 1436년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_037_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 우르비노 공국 궁전'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_038';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]우르비노 공작 궁전. [NEWLINE][TAB][TAB]우르비노, 1454년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_038_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 메디치 리카르디 궁전'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_039';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]팔라초 메디치 리카르디. [NEWLINE][TAB][TAB]피렌체, 1460년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_039_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 피오 2세 광장'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_040';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]피오 2세 광장. [NEWLINE][TAB][TAB]피엔차, 1462년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_040_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 산타 마리아 델레 그라치에'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_041';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]산타 마리아 델레 그라치에. [NEWLINE][TAB][TAB]밀라노, 1469년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_041_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 바랄로의 성산'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_042';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]사크로 몬테 디 바랄로. [NEWLINE][TAB][TAB]바랄로, 1480년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_042_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 스포르체스코 성'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_043';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]카스텔로 스포르체스코. [NEWLINE][TAB][TAB]밀라노, 1499년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_043_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 디아만티 궁전'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_044';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]팔라초 데이 디아만티. [NEWLINE][TAB][TAB]페라라, 1503년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_044_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 메디치 빌라'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_045';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]포조 아 카이아노의 메디치 빌라. [NEWLINE][TAB][TAB]포조 아 카이아노, 1520년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_045_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 파도바 식물원'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_046';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]파도바 식물원. [NEWLINE][TAB][TAB]파도바, 1545년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_046_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 팔라초 테'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_047';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]팔라초 테. [NEWLINE][TAB][TAB]만토바, 1534년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_047_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 빌라 데스테'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_048';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]빌라 데스테. [NEWLINE][TAB][TAB]티볼리, 1560년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_048_QUOTE';
UPDATE Language_ko_KR SET Text='[ICON_WONDER] 마르치아나 도서관'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_049';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]마르치아나 도서관. [NEWLINE][TAB][TAB]베네치아, 1588년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_049_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 팔마노바'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_050';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]팔마노바 요새 도시. [NEWLINE][TAB][TAB]팔마노바, 1593년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_050_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 빌라 라 로톤다'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_051';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]빌라 라 로톤다. [NEWLINE][TAB][TAB]비첸차, 1605년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_051_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 성 베드로 대성당'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_052';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]성 베드로 대성당. [NEWLINE][TAB][TAB]로마, 1626년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_052_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 알베로벨로의 트룰리'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_053';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]트룰리. [NEWLINE][TAB][TAB]알베로벨로, 1635년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_053_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 산타 크로체 대성당'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_054';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]산타 크로체 대성당. [NEWLINE][TAB][TAB]레체, 1646년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_054_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 스테파노 발비 궁전'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_055';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]스테파노 발비 궁전. [NEWLINE][TAB][TAB]제노바, 1650년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_055_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 산 루카 회랑'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_056';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]산 루카 회랑. [NEWLINE][TAB][TAB]볼로냐, 1721년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_056_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 스파냐 광장'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_057';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]스파냐 광장. [NEWLINE][TAB][TAB]로마, 1725년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_057_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 스투피니지'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_058';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]스투피니지 사냥 별궁. [NEWLINE][TAB][TAB]토리노, 1737년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_058_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 산 카를로 극장'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_059';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]산 카를로 왕립 극장. [NEWLINE][TAB][TAB]나폴리, 1737년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_059_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 카세르타 왕궁'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_060';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]카세르타 왕궁. [NEWLINE][TAB][TAB]카세르타, 1752년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_060_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 카타니아 대성당'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_061';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]성 아가타 대성당. [NEWLINE][TAB][TAB]카타니아, 1761년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_061_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 트레비 분수'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_062';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]트레비 분수. [NEWLINE][TAB][TAB]로마, 1762년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_062_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 라 스칼라'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_063';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]라 스칼라 극장. [NEWLINE][TAB][TAB]밀라노, 1778년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_063_QUOTE';
UPDATE Language_ko_KR SET Text='[ICON_WONDER] 부르봉 빈민 구호소'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_064';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]레알 알베르고 데이 포베리. [NEWLINE][TAB][TAB]나폴리, 1751년 착공, 미완성.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_064_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 파둘라 대수도원'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_065';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]파둘라의 산 로렌초 대수도원. [NEWLINE][TAB][TAB]파둘라, 1779년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_065_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 팔라치나 친레제'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_066';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]팔라치나 친레제. [NEWLINE][TAB][TAB]팔레르모, 1806년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_066_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 포폴로 광장'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_067';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]포폴로 광장. [NEWLINE][TAB][TAB]로마, 1818년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_067_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 피냐텔리 빌라'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_068';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]피냐텔리 빌라. [NEWLINE][TAB][TAB]나폴리, 1830년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_068_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 카노바 신전'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_069';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]카노바 신전. [NEWLINE][TAB][TAB]포사뇨, 1832년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_069_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 리보르노의 치스테르노네'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_070';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]치스테르노네. [NEWLINE][TAB][TAB]리보르노, 1842년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_070_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 산 프란체스코 디 파올라 성당'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_071';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]산 프란체스코 디 파올라 대성당. [NEWLINE][TAB][TAB]나폴리, 1846년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_071_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 성 바오로 성당'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_072';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]성 바오로 성당 (성벽 밖). [NEWLINE][TAB][TAB]로마, 1840년; 1854년 화재 후 재건.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_072_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 비토리오 에마누엘레 2세 갤러리아'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_073';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]비토리오 에마누엘레 2세 갤러리아. [NEWLINE][TAB][TAB]밀라노, 1867년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_073_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 크레스피 달다'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_074';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]크레스피 달다. [NEWLINE][TAB][TAB]카프리아테 산 제르바시오, 1877년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_074_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 안토넬리아나 탑'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_075';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]몰레 안토넬리아나. [NEWLINE][TAB][TAB]토리노, 1889년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_075_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 플로리오 저택'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_076';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]플로리오 저택. [NEWLINE][TAB][TAB]팔레르모, 1902년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_076_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 카스틸리오니 궁전'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_077';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]카스틸리오니 궁전. [NEWLINE][TAB][TAB]밀라노, 1904년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_077_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 비토리아노'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_078';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]비토리아노, 혹은 조국의 제단. [NEWLINE][TAB][TAB]로마, 1911년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_078_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 링고토'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_079';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]링고토. [NEWLINE][TAB]토리노, 1923년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_079_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 이탈리아 문명의 궁전'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_080';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]이탈리아 문명의 궁전. [NEWLINE][TAB][TAB]로마, 1938년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_080_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 해바라기 하우스'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_081';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]카사 델 지라솔레. [NEWLINE][TAB][TAB]로마, 1950년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_081_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 피렐리 타워'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_082';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]피렐리 고층 빌딩. [NEWLINE][TAB][TAB]밀라노, 1958년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_082_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 이브레아 산업 도시'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_083';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]올리베티 단지. [NEWLINE][TAB][TAB]이브레아, 1896년 창립, 1960년대 완공.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_083_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 성 요한 세례자 교회'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_084';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]산 조반니 바티스타 교회. [NEWLINE][TAB][TAB]캄피 비센치오, 1964년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_084_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 세계 극장'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_085';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]테아트로 델 몬도. [NEWLINE][TAB][TAB]베네치아, 1979년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_085_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 산 니콜라 경기장'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_086';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]산 니콜라 경기장. [NEWLINE][TAB][TAB]바리, 1990년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_086_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 로마 대모스크'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_087';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]로마 대모스크. [NEWLINE][TAB][TAB]로마, 1995년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_087_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 예술의 지하철역'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_088';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]나폴리 지하철 예술역. [NEWLINE][TAB][TAB]나폴리, 2001년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_088_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 피에라 밀라노 로'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_089';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]피에라 밀라노 로 단지. [NEWLINE][TAB][TAB]로, 2005년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_089_QUOTE';

UPDATE Language_ko_KR SET Text='[ICON_WONDER] 수직 숲'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_090';
UPDATE Language_ko_KR SET Text='[NEWLINE][TAB][TAB]보스코 베르티칼레. [NEWLINE][TAB][TAB]밀라노, 2014년.'
WHERE Tag='TXT_KEY_BUILDING_JAR_GWA_090_QUOTE';
--=======================================================================================================================
--=======================================================================================================================