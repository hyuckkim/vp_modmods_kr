--==========================================================================================================================
-- UTI MODEL GRAPHICS SETTING
--==========================================================================================================================
INSERT INTO COMMUNITY	
		(Type,					Value)
VALUES	('JAR_OUTPOST_GRAPHICS', 	1);

-- Substitute value above:
--					0 means simpler model and less memory consumed (DEFAULT)
--					1 means richer and more complex model that requires more memory

UPDATE Improvements SET ArtDefineTag= 'ART_DEF_IMPROVEMENT_JAR_STRATOUTPOST2'
WHERE Type='IMPROVEMENT_JAR_STRATOUTPOST' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='JAR_OUTPOST_GRAPHICS' AND Value= 1 );
--==========================================================================================================================
--==========================================================================================================================