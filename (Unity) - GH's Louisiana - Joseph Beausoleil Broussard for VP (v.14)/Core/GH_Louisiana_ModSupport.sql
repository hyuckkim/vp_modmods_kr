--==========================================================================================================================
-- Civilization_JFD_CultureTypes
--==========================================================================================================================	
-- CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SubCultureType, ArtDefineTag, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag,    SoundtrackTag, UnitDialogueTag);
-- INSERT INTO Civilization_JFD_CultureTypes
		-- (CivilizationType, 				ArtDefineTag, CultureType, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
-- SELECT	'CIVILIZATION_GH_LOUISIANA',	ArtDefineTag, CultureType, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
-- FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_AMERICA';

CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes(
    CivilizationType                            text    REFERENCES Civilizations(Type)          default null,
    CultureType                                 text                                            default null,
	SubCultureType								text											default null,
    ArtDefineTag                                text                                            default null,
    SplashScreenTag                             text                                            default null,
    SoundtrackTag                               text                                            default null,
    UnitDialogueTag                             text                                            default null);

INSERT INTO Civilization_JFD_CultureTypes
        (CivilizationType,				CultureType,			SubCultureType,						UnitDialogueTag)
VALUES  ('CIVILIZATION_GH_LOUISIANA',	'CULTURE_JFD_COLONIAL',	'SUBCULTURE_JFD_COLONIAL_AMERICAN',	'AS2D_SOUND_JFD_FRENCH');
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------    
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType,						CultureType, CultureEra)
SELECT 	'CIVILIZATION_GH_LOUISIANA',	CultureType, CultureEra
FROM ML_CivCultures WHERE CivType = 'CIVILIZATION_AMERICA';