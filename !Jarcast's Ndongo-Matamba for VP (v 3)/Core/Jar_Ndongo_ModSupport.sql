--==========================================================================================================================
-- MASTER TABLES
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS CustomModOptions(Name Text, Value INTEGER, Class INTEGER, DbUpdates INTEGER);
CREATE TABLE IF NOT EXISTS COMMUNITY (Type TEXT, Value INTEGER);
CREATE TABLE IF NOT EXISTS Civilization_JFD_ColonialCityNames(CivilizationType text, ColonyName text, LinguisticType text);
CREATE TABLE IF NOT EXISTS Civilization_JFD_Governments(CivilizationType text, CultureType text, LegislatureName text, OfficeTitle text, GovernmentType text, Weight integer);
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResource(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
CREATE TABLE IF NOT EXISTS MinorCivilizations_YnAEMP(MinorCivType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
--==========================================================================================================================
-- BrutalSamurai's Ethnic Units/Gedemon's R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------
UPDATE Civilizations
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_ZULU' )
    THEN '_ZULU'
    ELSE '_AFRI' END)
WHERE TYPE = 'CIVILIZATION_JAR_NDONGO';
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType,					CultureType, CultureEra)
SELECT	'CIVILIZATION_JAR_NDONGO',	CultureType, CultureEra
FROM ML_CivCultures WHERE CivType = 'CIVILIZATION_ZULU';
--=======================================================================================================================	
-- Historical Religions Support
--=======================================================================================================================	
UPDATE Civilization_Religions 
SET ReligionType = 'RELIGION_NZAMBIISM'
WHERE CivilizationType = 'CIVILIZATION_JAR_NDONGO' AND EXISTS (SELECT * FROM Religions WHERE Type = 'RELIGION_NZAMBIISM');
--==========================================================================================================================
-- Civilizations_YnAEMP
--==========================================================================================================================	
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,			MapPrefix,		X,		Y,		AltX,	AltY)
		-- v23/24
VALUES	('CIVILIZATION_JAR_NDONGO',	'Yagem',		25,		23,		null,	null),
		('CIVILIZATION_JAR_NDONGO',	'Yahem',		66,		26,		null,	null),
		('CIVILIZATION_JAR_NDONGO',	'Cordiform',	37,		9,		null,	null),
		('CIVILIZATION_JAR_NDONGO',	'GreatestEarth',53,		14,		null,	null),
		('CIVILIZATION_JAR_NDONGO',	'AfricaLarge',	34,		26,		null,	null),
		('CIVILIZATION_JAR_NDONGO',	'AfriGiant', 	67,		55,		null,	null),
		('CIVILIZATION_JAR_NDONGO',	'SouthernAfrica',50,	93,		null,	null),
		('CIVILIZATION_JAR_NDONGO',	'AfriAsiaAust',  30,	29,		null,	null),
		('CIVILIZATION_JAR_NDONGO',	'AfriSouthEuro', 38,	23,		null,	null),
		-- v25
		('CIVILIZATION_JAR_NDONGO',	'EarthMk3',		28,		22,		null,	null);
------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResource
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,			MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JAR_NDONGO',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YnAEMPRequestedResource WHERE CivilizationType = 'CIVILIZATION_ZULU';
--==========================================================================================================================
-- Civilization_JFD_CultureTypes
--==========================================================================================================================	
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SubCultureType, ArtDefineTag, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag,	SoundtrackTag, UnitDialogueTag);
INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,			ArtDefineTag, CultureType, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_JAR_NDONGO',	ArtDefineTag, CultureType, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_ZULU';
--=======================================================================================================================
--=======================================================================================================================

