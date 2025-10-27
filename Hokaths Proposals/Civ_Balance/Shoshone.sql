INSERT INTO Improvement_ResourceTypes
	(ImprovementType, ResourceType)
SELECT	
	'IMPROVEMENT_ENCAMPMENT_SHOSHONE', ResourceType
FROM Improvement_ResourceTypes WHERE ImprovementType = 'IMPROVEMENT_CAMP';