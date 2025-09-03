----------------------------------------------------
-- Inquisitor strength
----------------------------------------------------
UPDATE Defines SET Value = 75 WHERE Name = 'INQUISITION_EFFECTIVENESS';

----------------------------------------------------
-- Supply
----------------------------------------------------
UPDATE HandicapInfos
SET
	UnitSupplyPopulationPercent = 20,
	AIUnitSupplyPopulationPercent = 20,
	CityStateUnitSupplyPopulationPercent = 20
WHERE Type <> 'HANDICAP_AI_DEFAULT';
