--==========================================================================================================================
-- REQUESTED RESOURCES
--==========================================================================================================================
-- Civilizations_AegeanRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AegeanRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AegeanRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_AegeanStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_AfricaLargeRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AfricaLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AfricaLargeRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_AfricaLargeStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_AmericasRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AmericasRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AmericasRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_AmericasStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_ApennineRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_ApennineRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_ApennineRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_ApennineStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_AsiaRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AsiaRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AsiaRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_AsiaStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_CaribbeanRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_CaribbeanRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_CaribbeanRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_CaribbeanStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_BritishIslesRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_BritishIslesRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_BritishIslesRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_BritishIslesStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_EastAsiaRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EastAsiaRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EastAsiaRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_EastAsiaStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_EuroGiantRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroGiantRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_EuroGiantStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_MediterraneanRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_MediterraneanRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_MediterraneanRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_MediterraneanStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_MesopotamiaRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_MesopotamiaRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_MesopotamiaRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_MesopotamiaStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_NileValleyRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NileValleyRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NileValleyRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_NileValleyStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_NorthAtlanticRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthAtlanticRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_NorthAtlanticStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_NorthEastAsiaRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthEastAsiaRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthEastAsiaRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_NorthEastAsiaStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_NorthWestEuropeRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthWestEuropeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthWestEuropeRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_NorthWestEuropeStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_PacificRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_PacificRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_PacificRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_PacificStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_SouthPacificRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_SouthPacificRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_SouthPacificRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_SouthPacificStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_AdriaticRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AdriaticRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AdriaticRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_AdriaticStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_AfriAsiaAustRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AfriAsiaAustRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AfriAsiaAustRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_AfriAsiaAustStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_AfriGiantRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AfriGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AfriGiantRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_AfriGiantStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_AfriSouthEuroRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AfriSouthEuroRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AfriSouthEuroRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_AfriSouthEuroStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_AmericasGiantRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AmericasGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AmericasGiantRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_AmericasGiantStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_AsiaSmallRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AsiaSmallRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AsiaSmallRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_AsiaSmallStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_AsiaSteppeGiantRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AsiaSteppeGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AsiaSteppeGiantRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_AsiaSteppeGiantStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_AustralasiaGiantRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AustralasiaGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AustralasiaGiantRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_AustralasiaGiantStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_CaucasusRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_CaucasusRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_CaucasusRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_CaucasusStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_CentralAsiaRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_CentralAsiaRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_CentralAsiaRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_CentralAsiaStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_EuroEasternRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroEasternRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroEasternRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_EuroEasternStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_EuroLargeNewRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeNewRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeNewRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_EuroLargeNewStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_IndiaGiantRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_IndiaGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_IndiaGiantRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_IndiaGiantStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_MesopotamiaGiantRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_MesopotamiaGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_MesopotamiaGiantRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_MesopotamiaGiantStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_NorthAmericaGiantRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAmericaGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthAmericaGiantRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_NorthAmericaGiantStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_NorthAmericaHugeRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAmericaHugeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthAmericaHugeRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_NorthAmericaHugeStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_NorthSeaEuropeRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthSeaEuropeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthSeaEuropeRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_NorthSeaEuropeStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_ScotlandIrelandHugeRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_ScotlandIrelandHugeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_ScotlandIrelandHugeRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_ScotlandIrelandHugeStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_SouthAmericaGiantRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_SouthAmericaGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_SouthAmericaGiantRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_SouthAmericaGiantStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_SouthAmericaLargeRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_SouthAmericaLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_SouthAmericaLargeRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_SouthAmericaLargeStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_SouthAmericaCentralHugeRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_SouthAmericaCentralHugeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_SouthAmericaCentralHugeRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_SouthAmericaCentralHugeStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_SouthAmericaCentralGiantRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_SouthAmericaCentralGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_SouthAmericaCentralGiantRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_SouthAmericaCentralGiantStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_SouthAsiaHugeRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_SouthAsiaHugeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_SouthAsiaHugeRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_SouthAsiaHugeStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_SouthPacificGiantRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_SouthPacificGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_SouthPacificGiantRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_SouthPacificGiantStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_WestAfricaRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_WestAfricaRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_WestAfricaRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_WestAfricaStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_IndianOceanRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_IndianOceanRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_IndianOceanRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_IndianOceanStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_AtlanticGiantRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AtlanticGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AtlanticGiantRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_AtlanticGiantStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_AustraliaRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AustraliaRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AustraliaRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_AustraliaStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_CaribbeanHugeRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_CaribbeanHugeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_CaribbeanHugeRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_CaribbeanHugeStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_CentralAfricaLargeRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_CentralAfricaLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_CentralAfricaLargeRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_CentralAfricaLargeStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_DenmarkRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_DenmarkRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_DenmarkRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_DenmarkStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_EarthMk3RequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EarthMk3RequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EarthMk3RequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_EarthMk3StartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_GermanyHugeRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GermanyHugeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GermanyHugeRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_GermanyHugeStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_IberiaRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_IberiaRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_IberiaRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_IberiaStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_IndiaRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_IndiaRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_IndiaRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_IndiaStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_IndonesiaRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_IndonesiaRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_IndonesiaRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_IndonesiaStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_JapanHugeRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_JapanHugeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_JapanHugeRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_JapanHugeStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_MediterraneanHugeRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_MediterraneanHugeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_MediterraneanHugeRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_MediterraneanHugeStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_NetherlandsRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NetherlandsRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NetherlandsRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_NetherlandsStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_NorthSeaGiantRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthSeaGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthSeaGiantRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_NorthSeaGiantStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_OrientRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_OrientRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_OrientRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_OrientStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_RussiaLargeRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_RussiaLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_RussiaLargeRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_RussiaLargeStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_PatagoniaRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_PatagoniaRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_PatagoniaRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_PatagoniaStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_SeaOfJapanRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_SeaOfJapanRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_SeaOfJapanRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_SeaOfJapanStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_SouthernAfricaRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_SouthernAfricaRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_SouthernAfricaRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_SouthernAfricaStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_TexcocoRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_TexcocoRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_TexcocoRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_TexcocoStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_VietnamRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_VietnamRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_VietnamRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_VietnamStartPosition);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_WalesRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_WalesRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_WalesRequestedResource 
		(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4) 
SELECT 	 Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type IN (SELECT Type FROM Civilizations_WalesStartPosition);
--==========================================================================================================================
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMPRequestedResource
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResource(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'Adriatic'  
FROM Civilizations_AdriaticRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'Aegean'  
FROM Civilizations_AegeanRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'AfriAsiaAust'  
FROM Civilizations_AfriAsiaAustRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'AfricaLarge'  
FROM Civilizations_AfricaLargeRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'AfriGiant'  
FROM Civilizations_AfriGiantRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'AfriSouthEuro'  
FROM Civilizations_AfriSouthEuroRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'AmericasGiant'  
FROM Civilizations_AmericasGiantRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'Americas'  
FROM Civilizations_AmericasRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'Apennine'  
FROM Civilizations_ApennineRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'AsiaSmall'  
FROM Civilizations_AsiaSmallRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'Asia'  
FROM Civilizations_AsiaRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'AsiaSteppeGiant'  
FROM Civilizations_AsiaSteppeGiantRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'AtlanticGiant'  
FROM Civilizations_AtlanticGiantRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'Australia'  
FROM Civilizations_AustraliaRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'AustralasiaGiant'  
FROM Civilizations_AustralasiaGiantRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'BritishIsles'  
FROM Civilizations_BritishIslesRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'CaribbeanHuge'  
FROM Civilizations_CaribbeanHugeRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'Caribbean'  
FROM Civilizations_CaribbeanRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'Caucasus'  
FROM Civilizations_CaucasusRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'CentralAfricaLarge'  
FROM Civilizations_CentralAfricaLargeRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'CentralAsia'  
FROM Civilizations_CentralAsiaRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'Cordiform'  
FROM Civilizations_CordiformRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'Denmark'  
FROM Civilizations_DenmarkRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'EarthMk3'  
FROM Civilizations_EarthMk3RequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'EastAsia'  
FROM Civilizations_EastAsiaRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'EuroEastern'  
FROM Civilizations_EuroEasternRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'EuroGiant'  
FROM Civilizations_EuroGiantRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'EuroLargeNew'  
FROM Civilizations_EuroLargeNewRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'EuroLarge'  
FROM Civilizations_EuroLargeRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'GermanyHuge'  
FROM Civilizations_GermanyHugeRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'GreatestEarth'  
FROM Civilizations_GreatestEarthRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'Iberia'  
FROM Civilizations_IberiaRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'IndiaGiant'  
FROM Civilizations_IndiaGiantRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'India'  
FROM Civilizations_IndiaRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'IndianOcean'  
FROM Civilizations_IndianOceanRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'Indonesia'  
FROM Civilizations_IndonesiaRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'JapanHuge'  
FROM Civilizations_JapanHugeRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'MediterraneanHuge'  
FROM Civilizations_MediterraneanHugeRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'Mediterranean'  
FROM Civilizations_MediterraneanRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'MesopotamiaGiant'  
FROM Civilizations_MesopotamiaGiantRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'Mesopotamia'  
FROM Civilizations_MesopotamiaRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'Netherlands'  
FROM Civilizations_NetherlandsRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'NileValley'  
FROM Civilizations_NileValleyRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'NorthAmericaGiant'  
FROM Civilizations_NorthAmericaGiantRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'NorthAmericaHuge'  
FROM Civilizations_NorthAmericaHugeRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'NorthAtlantic'  
FROM Civilizations_NorthAtlanticRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'NorthEastAsia'  
FROM Civilizations_NorthEastAsiaRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'NorthSeaEurope'  
FROM Civilizations_NorthSeaEuropeRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'NorthSeaGiant'  
FROM Civilizations_NorthSeaGiantRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'NorthWestEurope'  
FROM Civilizations_NorthWestEuropeRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'Orient'  
FROM Civilizations_OrientRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'Pacific'  
FROM Civilizations_PacificRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'Patagonia'  
FROM Civilizations_PatagoniaRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'RussiaLarge'  
FROM Civilizations_RussiaLargeRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'SeaOfJapan'  
FROM Civilizations_SeaOfJapanRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'ScotlandIrelandHuge'  
FROM Civilizations_ScotlandIrelandHugeRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'SouthAmericaCentralGiant'  
FROM Civilizations_SouthAmericaCentralGiantRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'SouthAmericaCentralHuge'  
FROM Civilizations_SouthAmericaCentralHugeRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'SouthAmericaGiant'  
FROM Civilizations_SouthAmericaGiantRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'SouthAmericaLarge'  
FROM Civilizations_SouthAmericaLargeRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'SouthAsiaHuge'  
FROM Civilizations_SouthAsiaHugeRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'SouthernAfrica'  
FROM Civilizations_SouthernAfricaRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'SouthPacificGiant'  
FROM Civilizations_SouthPacificGiantRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'SouthPacific'  
FROM Civilizations_SouthPacificRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'Texcoco'  
FROM Civilizations_TexcocoRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'Vietnam'  
FROM Civilizations_VietnamRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'Wales'  
FROM Civilizations_WalesRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'WestAfrica'  
FROM Civilizations_WestAfricaRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'Yagem'  
FROM Civilizations_YagemRequestedResource;

INSERT INTO Civilizations_YnAEMPRequestedResource
		(CivilizationType,  Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, MapPrefix)
SELECT	 Type, 				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, 'Yahem'  
FROM Civilizations_YahemRequestedResource;
--==========================================================================================================================
--==========================================================================================================================