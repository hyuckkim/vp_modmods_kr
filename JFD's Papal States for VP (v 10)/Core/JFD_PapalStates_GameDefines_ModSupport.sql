--==========================================================================================================================
-- BrutalSamurai's Ethnic Units/Gedemon's R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_ROME' )
	THEN '_ROME'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_JFD_PAPAL_STATES';
--==========================================================================================================================
-- Gedemon's YnAEMP
--==========================================================================================================================
-- Civilizations_YnAEMP
----------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,					MapPrefix, X, Y, AltX, AltY, AltCapitalName)
SELECT	'CIVILIZATION_JFD_PAPAL_STATES', 	MapPrefix, X, Y, AltX, AltY, AltCapitalName
FROM Civilizations_YnAEMP WHERE CivilizationType = 'CIVILIZATION_ROME';
----------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResource
----------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResource(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,					MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_PAPAL_STATES',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YnAEMPRequestedResource WHERE CivilizationType = 'CIVILIZATION_ROME';
----------------------------------------------------------------------------------------------------------------------------
-- MinorCivilizations_YnAEMP
----------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MinorCivilizations_YnAEMP(MinorCivType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
INSERT OR REPLACE INTO MinorCivilizations_YnAEMP
		( MinorCivType,					MapPrefix,				X,		Y,		AltX,	AltY,	AltCapitalName)
VALUES	('MINOR_CIV_VATICAN_CITY',		'AfriAsiaAust',			30,		78,		null,	null,	null),
		-- ('MINOR_CIV_VATICAN_CITY',	'AfricaLarge',			0,		0,		null,	null,	null),
		('MINOR_CIV_VATICAN_CITY',		'AfriSouthEuro',		36,		72,		null,	null,	null),
		-- ('MINOR_CIV_VATICAN_CITY',	'Americas',				0,		0,		null,	null,	null),
		-- ('MINOR_CIV_VATICAN_CITY',	'Asia',					0,		0,		null,	null,	null),
		('MINOR_CIV_VATICAN_CITY',		'Cordiform',			38,		24,		null,	null,	null),
		('MINOR_CIV_VATICAN_CITY',		'EarthMk3',				22,		55,		null,	null,	null),
		-- ('MINOR_CIV_VATICAN_CITY',	'EastAsia',				0,		0,		null,	null,	null),
		('MINOR_CIV_VATICAN_CITY',		'EuroLarge',			37,		34,		null,	null,	null),
		('MINOR_CIV_VATICAN_CITY',		'EuroLargeNew',			40,		26,		null,	null,	null),
		('MINOR_CIV_VATICAN_CITY',		'GreatestEarth',		51,		43,		null,	null,	null),
		-- ('MINOR_CIV_VATICAN_CITY',	'IndianOcean',			0,		0,		null,	null,	null),
		('MINOR_CIV_VATICAN_CITY',		'Mediterranean',		43,		46,		null,	null,	null),
		-- ('MINOR_CIV_VATICAN_CITY',	'Mesopotamia',			0,		0,		null,	null,	null),
		-- ('MINOR_CIV_VATICAN_CITY',	'NorthAtlantic',		0,		0,		null,	null,	null),
		-- ('MINOR_CIV_VATICAN_CITY',	'NorthEastAsia',		0,		0,		null,	null,	null),
		-- ('MINOR_CIV_VATICAN_CITY',	'NorthWestEurope',		0,		0,		null,	null,	null),
		('MINOR_CIV_VATICAN_CITY',		'Orient',				12,		75,		null,	null,	null),
		-- ('MINOR_CIV_VATICAN_CITY',	'SouthPacific',			0,		0,		null,	null,	null),
		('MINOR_CIV_VATICAN_CITY',		'Yagem',				21,		60,		null,	null,	null),
		('MINOR_CIV_VATICAN_CITY',		'Yahem',				63,		54,		null,	null,	null);
--==========================================================================================================================
-- Hazel's Map Labels
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,							CultureType,		CultureEra)
VALUES		('CIVILIZATION_JFD_PAPAL_STATES',	'MEDITERRANEAN',	'ANY');
--==========================================================================================================================
-- JFD's Cultural Diversity
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SubCultureType, ArtDefineTag, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag,	SoundtrackTag, UnitDialogueTag);
INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,					ArtDefineTag, CultureType, SubCultureType, 						DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_JFD_PAPAL_STATES',	ArtDefineTag, CultureType, 'CULTURE_SUB_JFD_SOUTHERN_PAPAL', 	DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, 'AS2D_SOUND_JFD_ROMAN'
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_VENICE';
--==========================================================================================================================
-- Sukritact's Decisions
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_PapalStates_Decisions.lua');
------------------------------
-- Policies
------------------------------
INSERT INTO Policies 
		(Type,												Description,										FaithCostModifier) 
VALUES	('POLICY_DECISIONS_JFD_PAPAL_STATES_SOCIETAS_JESU',	'TXT_KEY_DECISIONS_JFD_PAPAL_STATES_SOCIETAS_JESU',	-15);
--==========================================================================================================================
--==========================================================================================================================