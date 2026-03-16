--==========================================================================================================================
-- CULTURES
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- JFD_CultureTypes
--------------------------------------------------------------------------------------------------------------------------		
UPDATE JFD_CultureTypes
SET DefeatScreenTag = 'DefeatScreen_' || LowerTag
WHERE LowerTag IS NOT NULL;
--------------------------------------------------------------------------------------------------------------------------
-- JFD_CultureSubTypes
--------------------------------------------------------------------------------------------------------------------------				
UPDATE JFD_CultureSubTypes
SET DefeatScreenEarlyTag = 'DefeatScreen_JFD_ClassicalRomanEarly'
WHERE Type = 'SUBCULTURE_JFD_CLASSICAL_ROMAN';
	
UPDATE JFD_CultureSubTypes
SET DefeatScreenLateTag = 'DefeatScreen_JFD_ColonialAmericanLate'
WHERE Type = 'SUBCULTURE_JFD_COLONIAL_AMERICAN';

UPDATE JFD_CultureSubTypes
SET DefeatScreenLateTag = 'DefeatScreen_JFD_ColonialLatinLate'
WHERE Type = 'SUBCULTURE_JFD_COLONIAL_LATIN';

UPDATE JFD_CultureSubTypes
SET DefeatScreenMidTag = 'DefeatScreen_JFD_EastAfricanEthiopianMid'
WHERE Type = 'SUBCULTURE_JFD_EAST_AFRICAN_ETHIOPIAN';

UPDATE JFD_CultureSubTypes
SET DefeatScreenMidTag = 'DefeatScreen_JFD_EasternByzantineMid'
WHERE Type = 'SUBCULTURE_JFD_EASTERN_BYZANTINE';

UPDATE JFD_CultureSubTypes
SET DefeatScreenLateTag = 'DefeatScreen_JFD_FarEasternJapaneseLate'
WHERE Type = 'SUBCULTURE_JFD_FAR_EASTERN_JAPANESE';

UPDATE JFD_CultureSubTypes
SET DefeatScreenEarlyTag = 'DefeatScreen_JFD_MesopotamicEgyptianEarly'
WHERE Type = 'SUBCULTURE_JFD_MESOPOTAMIC_EGYPTIAN';

UPDATE JFD_CultureSubTypes
SET DefeatScreenEarlyTag = 'DefeatScreen_JFD_MesopotamicPersianEarly'
WHERE Type = 'SUBCULTURE_JFD_MESOPOTAMIC_PERSIAN';

UPDATE JFD_CultureSubTypes
SET DefeatScreenMidTag = 'DefeatScreen_JFD_MidEasternOttomanMid'
WHERE Type = 'SUBCULTURE_JFD_MID_EASTERN_OTTOMAN';

UPDATE JFD_CultureSubTypes
SET DefeatScreenMidTag = 'DefeatScreen_JFD_NorthernCelticMid'
WHERE Type = 'SUBCULTURE_JFD_NORTHERN_CELTIC';

UPDATE JFD_CultureSubTypes
SET DefeatScreenMidTag = 'DefeatScreen_JFD_SouthernPapalMid'
WHERE Type = 'SUBCULTURE_JFD_SOUTHERN_PAPAL';

UPDATE JFD_CultureSubTypes
SET DefeatScreenLateTag = 'DefeatScreen_JFD_SteppeTurkicLate'
WHERE Type = 'SUBCULTURE_JFD_STEPPE_TURKIC';

UPDATE JFD_CultureSubTypes
SET DefeatScreenLateTag = 'DefeatScreen_JFD_WesternBritishLate'
WHERE Type = 'SUBCULTURE_JFD_WESTERN_BRITISH';
--==========================================================================================================================
--==========================================================================================================================
