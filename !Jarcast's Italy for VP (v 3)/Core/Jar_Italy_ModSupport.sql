--==========================================================================================================================
-- MASTER TABLES
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
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
SET ArtStyleSuffix = (CASE WHEN EXISTS (SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_VENICE' )
	THEN '_VENICE'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_JAR_ITALY';
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS ML_CivCultures(CivType, CultureType, CultureEra);
INSERT OR REPLACE INTO ML_CivCultures
		(CivType,					CultureType,	CultureEra)
VALUES	('CIVILIZATION_JAR_ITALY',	'MEDITERRANEAN',	'ANY');
--==========================================================================================================================
-- Civilizations_YnAEMP
--==========================================================================================================================	
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,			MapPrefix,	X,	Y,	AltX, AltY,	AltCapitalName)
SELECT	'CIVILIZATION_JAR_ITALY',	MapPrefix,	X,	Y,	AltX, AltY,	AltCapitalName
FROM Civilizations_YnAEMP WHERE CivilizationType = 'CIVILIZATION_ROME';
------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResource
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,			MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JAR_ITALY',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YnAEMPRequestedResource WHERE CivilizationType = 'CIVILIZATION_ROME';
--==========================================================================================================================
-- Civilization_JFD_CultureTypes
--==========================================================================================================================	
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SubCultureType, ArtDefineTag, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag,	SoundtrackTag, UnitDialogueTag);
INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,			ArtDefineTag, CultureType, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_JAR_ITALY',	ArtDefineTag, CultureType, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_VENICE';
--=======================================================================================================================
--=======================================================================================================================

