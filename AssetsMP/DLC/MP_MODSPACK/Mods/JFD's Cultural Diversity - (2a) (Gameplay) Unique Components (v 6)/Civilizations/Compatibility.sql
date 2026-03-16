INSERT OR REPLACE INTO Civilization_JFD_CultureTypes
	(CivilizationType,	CultureType,				UnitDialogueTag)
SELECT	
	Type,	'CULTURE_JFD_INDOCHINA', 	'AS2D_SOUND_JFD_SIAMESE'
FROM Civilizations WHERE Type = 'CIVILIZATION_LS_VIETNAM';