DELETE FROM Trait_YieldFromImport WHERE YieldType = 'YIELD_CULTURE' AND TraitType = 'TRAIT_LUXURY_RETENTION';
UPDATE Trait_YieldFromImport SET Yield = 4 WHERE YieldType = 'YIELD_GOLD' AND TraitType = 'TRAIT_LUXURY_RETENTION';

UPDATE Trait_YieldFromExport SET Yield = 4 WHERE YieldType = 'YIELD_GOLD' AND TraitType = 'TRAIT_LUXURY_RETENTION';
DELETE FROM Trait_YieldFromExport WHERE YieldType = 'YIELD_CULTURE' AND TraitType = 'TRAIT_LUXURY_RETENTION';

INSERT INTO Trait_ResourceYieldChanges
	(TraitType, ResourceType, YieldType, Yield)
SELECT
	'TRAIT_LUXURY_RETENTION', Type, 'YIELD_CULTURE', 1
FROM Resources
WHERE Happiness > 0;

INSERT INTO Trait_ResourceYieldChanges
	(TraitType, ResourceType, YieldType, Yield)
SELECT
	'TRAIT_LUXURY_RETENTION', Type, 'YIELD_GOLD', 1
FROM Resources
WHERE Happiness > 0;

UPDATE Language_en_US
SET Text = '+1 [ICON_GOLD] and [ICON_CULTURE] Culture for every Luxury worked by your Cities. +4 [ICON_GOLD] Gold for each unique Luxury you import and/or export, scaling with Era. Can import duplicate Luxuries from Civilizations which count toward [ICON_VP_MONOPOLY] Monopolies.'
WHERE Tag = 'TXT_KEY_TRAIT_LUXURY_RETENTION';

UPDATE Improvements SET
RequiresXAdjacentLand = 2
WHERE Type = 'IMPROVEMENT_POLDER_WATER';

UPDATE Language_en_US
SET Text = 'Can only be built on Marsh tiles or on featureless Lake/Coast tiles adjacent to at least 2 land tiles. Polders built on water can be traversed by land units without embarkation, as if they are land tiles.'
WHERE Tag = 'TXT_KEY_CIV5_IMPROVEMENTS_POLDER_HELP';
