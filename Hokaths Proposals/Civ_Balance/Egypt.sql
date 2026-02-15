INSERT INTO Trait_SpecialistYieldChanges
	(TraitType, SpecialistType, YieldType, Yield)
VALUES
	('TRAIT_WONDER_BUILDER', 'SPECIALIST_CITIZEN', 'YIELD_PRODUCTION', 1),
	('TRAIT_WONDER_BUILDER', 'SPECIALIST_CITIZEN', 'YIELD_SCIENCE', 1),
	('TRAIT_WONDER_BUILDER', 'SPECIALIST_CITIZEN', 'YIELD_CULTURE', 1),
	('TRAIT_WONDER_BUILDER', 'SPECIALIST_CITIZEN', 'YIELD_GOLDEN_AGE_POINTS', 1);

--UPDATE Traits SET
--	IsOddEraScaler = 1
--WHERE Type = 'TRAIT_WONDER_BUILDER';

DELETE FROM Trait_ArtifactYieldChanges WHERE TraitType = 'TRAIT_WONDER_BUILDER';
DELETE FROM Trait_ImprovementYieldChanges WHERE TraitType = 'TRAIT_WONDER_BUILDER';

UPDATE Language_en_US SET
Text = Replace(Text, '[ICON_VP_ARTIFACT] Artifacts gain +5 [ICON_RESEARCH] Science and [ICON_CULTURE] Culture, and Landmarks gain +5 [ICON_GOLD] Gold and [ICON_TOURISM] Tourism.', '')
WHERE Tag = 'TXT_KEY_TRAIT_WONDER_BUILDER';

UPDATE Language_en_US SET
Text = Text || ' [ICON_CITIZEN_RED] Labourers generate +1 [ICON_PRODUCTION] Production, [ICON_RESEARCH] Science, [ICON_CULTURE] Culture, and [ICON_GOLDEN_AGE] Golden Age Point.'
WHERE Tag = 'TXT_KEY_TRAIT_WONDER_BUILDER';

--increasing by +1 in Medieval, Industrial, and Atomic Eras