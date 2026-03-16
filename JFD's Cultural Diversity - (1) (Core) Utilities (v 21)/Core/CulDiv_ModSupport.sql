--==========================================================================================================================
-- CIVILIZATIONS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations
--------------------------------------------------------------------------------------------------------------------------
UPDATE Civilizations
SET CultureType = (SELECT CultureType FROM Civilization_JFD_CultureTypes WHERE CivilizationType = Type)
WHERE CultureType IS NULL;

UPDATE Civilizations
SET CultureSubType = (SELECT SubCultureType FROM Civilization_JFD_CultureTypes WHERE CivilizationType = Type AND SubCultureType IS NOT NULL)
WHERE CultureSubType IS NULL;
--------------------------------------------------------------------------------------------------------------------------
CREATE TRIGGER JFD_CulDiv_Core_Civilizations
AFTER INSERT ON Civilization_JFD_CultureTypes
BEGIN
	UPDATE Civilizations
	SET CultureType = (SELECT CultureType FROM Civilization_JFD_CultureTypes WHERE CivilizationType = Type)
	WHERE CultureType IS NULL AND Type = NEW.CivilizationType;

	UPDATE Civilizations
	SET CultureSubType = (SELECT SubCultureType FROM Civilization_JFD_CultureTypes WHERE CivilizationType = Type AND SubCultureType IS NOT NULL)
	WHERE CultureSubType IS NULL AND Type = NEW.CivilizationType;
END;
--==========================================================================================================================
-- MINOR CIVILIZATIONS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- MinorCivilizations
--------------------------------------------------------------------------------------------------------------------------
UPDATE MinorCivilizations
SET CultureType = (SELECT CultureType FROM MinorCivilization_JFD_CultureTypes WHERE MinorCivilizationType = Type AND CultureType IN (SELECT Type FROM JFD_CultureTypes))
WHERE CultureType IS NULL;
--------------------------------------------------------------------------------------------------------------------------
CREATE TRIGGER JFD_CulDiv_Core_MinorCivilizations
AFTER INSERT ON MinorCivilization_JFD_CultureTypes
BEGIN
	UPDATE MinorCivilizations
	SET CultureType = (SELECT CultureType FROM MinorCivilization_JFD_CultureTypes WHERE MinorCivilizationType = Type)
	WHERE CultureType IS NULL AND Type = NEW.MinorCivilizationType;
END;
--==========================================================================================================================
--==========================================================================================================================