--==========================================================================================================================
-- CULTURES
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- JFD_CultureTypes
--------------------------------------------------------------------------------------------------------------------------		
UPDATE JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_INCAN'
WHERE Type = 'CULTURE_JFD_ANDEAN';
	
UPDATE JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_INDIAN'
WHERE Type IN ('CULTURE_JFD_BHARATA', 'CULTURE_JFD_HIMALAYAN');

UPDATE JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_GERMAN'
WHERE Type IN ('CULTURE_JFD_CENTRAL', 'CULTURE_JFD_TOTALITARIAN');

UPDATE JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_AMERICAN'
WHERE Type = 'CULTURE_JFD_COLONIAL';

UPDATE JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_RUSSIAN'
WHERE Type = 'CULTURE_JFD_EASTERN';

UPDATE JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_ETHIOPIAN'
WHERE Type = 'CULTURE_JFD_EAST_AFRICAN';

UPDATE JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_KHMER'
WHERE Type = 'CULTURE_JFD_EAST_INDIES';

UPDATE JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_CHINESE'
WHERE Type = 'CULTURE_JFD_FAR_EASTERN';

UPDATE JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_NATIVE_AMERICAN'
WHERE Type IN ('CULTURE_JFD_GREAT_PLAINS', 'CULTURE_JFD_PACIFIC', 'CULTURE_JFD_WOODLANDS');

UPDATE JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_SIAMESE'
WHERE Type = 'CULTURE_JFD_INDOCHINA';

UPDATE JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_AZTEC'
WHERE Type = 'CULTURE_JFD_MESOAMERICAN';

UPDATE JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_ARABIC'
WHERE Type = 'CULTURE_JFD_MID_EASTERN';

UPDATE JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_SUMERIAN'
WHERE Type = 'CULTURE_JFD_MESOPOTAMIC';

UPDATE JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_VIKING'
WHERE Type = 'CULTURE_JFD_NORTHERN';

UPDATE JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_ITALIAN'
WHERE Type = 'CULTURE_JFD_SOUTHERN';

UPDATE JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_MONGOL'
WHERE Type = 'CULTURE_JFD_STEPPE';

UPDATE JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_ENGLISH'
WHERE Type = 'CULTURE_JFD_WESTERN';

UPDATE JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_MALINESE'
WHERE Type = 'CULTURE_JFD_WEST_AFRICAN';
--------------------------------------------------------------------------------------------------------------------------
-- JFD_CultureSubTypes
--------------------------------------------------------------------------------------------------------------------------		
UPDATE JFD_CultureSubTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_ROMAN'
WHERE Type = 'SUBCULTURE_JFD_CLASSICAL_ROMAN';

UPDATE JFD_CultureSubTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_LATINO'
WHERE Type = 'SUBCULTURE_JFD_COLONIAL_LATIN';

UPDATE JFD_CultureSubTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_BYZANTINE'
WHERE Type = 'SUBCULTURE_JFD_EASTERN_BYZANTINE';

UPDATE JFD_CultureSubTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_JAPANESE'
WHERE Type = 'SUBCULTURE_JFD_FAR_EASTERN_JAPANESE';

UPDATE JFD_CultureSubTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_EGYPTIAN'
WHERE Type = 'SUBCULTURE_JFD_MESOPOTAMIC_EGYPTIAN';

UPDATE JFD_CultureSubTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_PERSIAN'
WHERE Type = 'SUBCULTURE_JFD_MESOPOTAMIC_PERSIAN';

UPDATE JFD_CultureSubTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_OTTOMAN'
WHERE Type = 'SUBCULTURE_JFD_MID_EASTERN_OTTOMAN';

UPDATE JFD_CultureSubTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_CELTIC'
WHERE Type = 'SUBCULTURE_JFD_NORTHERN_CELTIC';

UPDATE JFD_CultureSubTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_ROMAN'
WHERE Type = 'SUBCULTURE_JFD_SOUTHERN_PAPAL';

UPDATE JFD_CultureSubTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_OTTOMAN'
WHERE Type = 'SUBCULTURE_JFD_STEPPE_TURKIC';
--==========================================================================================================================
-- CIVILIZATIONS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_CultureTypes
--------------------------------------------------------------------------------------------------------------------------		
UPDATE Civilization_JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_AMERICAN'
WHERE CivilizationType = 'CIVILIZATION_AMERICA';

UPDATE Civilization_JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_ARABIC'
WHERE CivilizationType IN ('CIVILIZATION_ARABIA', 'CIVILIZATION_MOROCCO');

UPDATE Civilization_JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_BABYLONIAN'
WHERE CivilizationType IN ('CIVILIZATION_ASSYRIA', 'CIVILIZATION_BABYLON');

UPDATE Civilization_JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_GERMAN'
WHERE CivilizationType IN ('CIVILIZATION_AUSTRIA', 'CIVILIZATION_GERMANY');

UPDATE Civilization_JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_AZTEC'
WHERE CivilizationType = 'CIVILIZATION_AZTEC';

UPDATE Civilization_JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_PORTUGUESE'
WHERE CivilizationType IN ('CIVILIZATION_BRAZIL', 'CIVILIZATION_PORTUGAL');

UPDATE Civilization_JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_BYZANTINE'
WHERE CivilizationType = 'CIVILIZATION_BYZANTIUM';

UPDATE Civilization_JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_CARTHAGINIAN'
WHERE CivilizationType = 'CIVILIZATION_CARTHAGE';

UPDATE Civilization_JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_CELTIC'
WHERE CivilizationType = 'CIVILIZATION_CELTS';

UPDATE Civilization_JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_CHINESE'
WHERE CivilizationType = 'CIVILIZATION_CHINA';

UPDATE Civilization_JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_VIKING'
WHERE CivilizationType = 'CIVILIZATION_DENMARK';

UPDATE Civilization_JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_EGYPTIAN'
WHERE CivilizationType = 'CIVILIZATION_EGYPT';

UPDATE Civilization_JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_ENGLISH'
WHERE CivilizationType = 'CIVILIZATION_ENGLAND';

UPDATE Civilization_JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_ETHIOPIAN'
WHERE CivilizationType = 'CIVILIZATION_ETHIOPIA';

UPDATE Civilization_JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_FRENCH'
WHERE CivilizationType = 'CIVILIZATION_FRANCE';

UPDATE Civilization_JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_GREEK'
WHERE CivilizationType = 'CIVILIZATION_GREECE';

UPDATE Civilization_JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_HUNNIC'
WHERE CivilizationType = 'CIVILIZATION_HUNS';

UPDATE Civilization_JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_INCAN'
WHERE CivilizationType = 'CIVILIZATION_INCA';

UPDATE Civilization_JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_INDIAN'
WHERE CivilizationType = 'CIVILIZATION_INDIA';

UPDATE Civilization_JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_MOHAWK'
WHERE CivilizationType = 'CIVILIZATION_IROQUOIS';

UPDATE Civilization_JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_JAPANESE'
WHERE CivilizationType = 'CIVILIZATION_JAPAN';

UPDATE Civilization_JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_KOREAN'
WHERE CivilizationType = 'CIVILIZATION_KOREA';

UPDATE Civilization_JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_MAYAN'
WHERE CivilizationType = 'CIVILIZATION_MAYA';

UPDATE Civilization_JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_MONGOL'
WHERE CivilizationType = 'CIVILIZATION_MONGOL';

UPDATE Civilization_JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_DUTCH'
WHERE CivilizationType = 'CIVILIZATION_NETHERLANDS';

UPDATE Civilization_JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_OTTOMAN'
WHERE CivilizationType = 'CIVILIZATION_OTTOMAN';

UPDATE Civilization_JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_PERSIAN'
WHERE CivilizationType = 'CIVILIZATION_PERSIA';

UPDATE Civilization_JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_POLISH'
WHERE CivilizationType = 'CIVILIZATION_POLAND';

UPDATE Civilization_JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_ROMAN'
WHERE CivilizationType = 'CIVILIZATION_ROME';

UPDATE Civilization_JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_RUSSIAN'
WHERE CivilizationType = 'CIVILIZATION_RUSSIA';

UPDATE Civilization_JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_SIAMESE'
WHERE CivilizationType = 'CIVILIZATION_SIAM';

UPDATE Civilization_JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_MALINESE'
WHERE CivilizationType = 'CIVILIZATION_SONGHAI';

UPDATE Civilization_JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_SPANISH'
WHERE CivilizationType = 'CIVILIZATION_SPAIN';

UPDATE Civilization_JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_SWEDISH'
WHERE CivilizationType = 'CIVILIZATION_SWEDEN';

UPDATE Civilization_JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_ITALIAN'
WHERE CivilizationType = 'CIVILIZATION_VENICE';

UPDATE Civilization_JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_ZULU'
WHERE CivilizationType = 'CIVILIZATION_ZULU';
--------------------------------------------------------------------------------------------------------------------------
UPDATE Civilization_JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_SUMERIAN'
WHERE CivilizationType = 'CIVILIZATION_AKKADIAN_MOD';

UPDATE Civilization_JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_KHMER'
WHERE CivilizationType = 'CIVILIZATION_KHMER';

UPDATE Civilization_JFD_CultureTypes
SET UnitDialogueTag = 'AS2D_SOUND_JFD_SIOUX'
WHERE CivilizationType = 'CIVILIZATION_SIOUX_MOD';
--==========================================================================================================================
--==========================================================================================================================
