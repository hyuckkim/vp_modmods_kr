--swap a food to a science
DELETE FROM Improvement_ResourceType_Yields WHERE ResourceType = 'RESOURCE_BANANA' AND YieldType = 'YIELD_FOOD';

INSERT INTO Improvement_ResourceType_Yields
	(ImprovementType, ResourceType, YieldType, Yield)
VALUES
	('IMPROVEMENT_PLANTATION', 'RESOURCE_BANANA', 'YIELD_FOOD', 2),
	('IMPROVEMENT_PLANTATION', 'RESOURCE_BANANA', 'YIELD_SCIENCE', 1);