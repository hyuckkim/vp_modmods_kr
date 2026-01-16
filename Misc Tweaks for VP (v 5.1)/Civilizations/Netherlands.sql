DELETE FROM Trait_LuxuryYieldChanges WHERE TraitType = 'TRAIT_LUXURY_RETENTION';
DELETE FROM Trait_YieldFromImport WHERE TraitType = 'TRAIT_LUXURY_RETENTION';
DELETE FROM Trait_YieldFromExport WHERE TraitType = 'TRAIT_LUXURY_RETENTION';

UPDATE Traits
SET ImportsCountTowardsMonopolies = 0
WHERE Type = 'TRAIT_LUXURY_RETENTION';

INSERT INTO Trait_YieldFromImport
	(TraitType, YieldType, Yield)
VALUES
	('TRAIT_LUXURY_RETENTION', 'YIELD_GOLD', 3),
	('TRAIT_LUXURY_RETENTION', 'YIELD_CULTURE', 2);

INSERT INTO Trait_YieldFromExport
	(TraitType, YieldType, Yield)
VALUES
	('TRAIT_LUXURY_RETENTION', 'YIELD_GOLD', 3),
	('TRAIT_LUXURY_RETENTION', 'YIELD_CULTURE', 2);

UPDATE Language_en_US
SET Text = '+3 [ICON_GOLD] Gold and +2 [ICON_CULTURE] Culture for each unique Luxury Resource you import or export from/to other Civilizations and [ICON_CITY_STATE] City-States, scaling with Era.'
WHERE Tag = 'TXT_KEY_TRAIT_LUXURY_RETENTION';
