--=======================================================================================================================	
-- IMPROVEMENTS
--=======================================================================================================================
-- Improvements
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Improvements
		(Type,							Description, Civilopedia, Help,	ArtDefineTag, 							CreatedByGreatPerson, RequiresImprovement, IgnoreOwnership, PortraitIndex, IconAtlas, HappinessOnConstruction)
SELECT	'IMPROVEMENT_LANDMARK_EURO',	Description, Civilopedia, Help,	'ART_DEF_IMPROVEMENT_MONOLITH_EURO', 	CreatedByGreatPerson, RequiresImprovement, IgnoreOwnership, PortraitIndex, IconAtlas, HappinessOnConstruction FROM Improvements WHERE Type='IMPROVEMENT_LANDMARK' UNION ALL
SELECT	'IMPROVEMENT_LANDMARK_ASIA',	Description, Civilopedia, Help,	'ART_DEF_IMPROVEMENT_MONOLITH_ASIA', 	CreatedByGreatPerson, RequiresImprovement, IgnoreOwnership, PortraitIndex, IconAtlas, HappinessOnConstruction FROM Improvements WHERE Type='IMPROVEMENT_LANDMARK' UNION ALL
SELECT	'IMPROVEMENT_LANDMARK_AMER',	Description, Civilopedia, Help,	'ART_DEF_IMPROVEMENT_MONOLITH_AMER', 	CreatedByGreatPerson, RequiresImprovement, IgnoreOwnership, PortraitIndex, IconAtlas, HappinessOnConstruction FROM Improvements WHERE Type='IMPROVEMENT_LANDMARK' UNION ALL
SELECT	'IMPROVEMENT_LANDMARK_AFRI',	Description, Civilopedia, Help,	'ART_DEF_IMPROVEMENT_MONOLITH_AFRI', 	CreatedByGreatPerson, RequiresImprovement, IgnoreOwnership, PortraitIndex, IconAtlas, HappinessOnConstruction FROM Improvements WHERE Type='IMPROVEMENT_LANDMARK';
------------------------------------------------------------------------------------------------------------------------
-- Improvement_Yields
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Improvement_Yields
		(ImprovementType, 				YieldType, Yield)
SELECT	'IMPROVEMENT_LANDMARK_EURO',	YieldType, Yield FROM Improvement_Yields WHERE ImprovementType ='IMPROVEMENT_LANDMARK' UNION ALL
SELECT	'IMPROVEMENT_LANDMARK_ASIA',	YieldType, Yield FROM Improvement_Yields WHERE ImprovementType ='IMPROVEMENT_LANDMARK' UNION ALL
SELECT	'IMPROVEMENT_LANDMARK_AMER',	YieldType, Yield FROM Improvement_Yields WHERE ImprovementType ='IMPROVEMENT_LANDMARK' UNION ALL
SELECT	'IMPROVEMENT_LANDMARK_AFRI',	YieldType, Yield FROM Improvement_Yields WHERE ImprovementType ='IMPROVEMENT_LANDMARK';

CREATE TRIGGER IF NOT EXISTS JarLandmarkCV01 AFTER INSERT ON Improvement_Yields
WHEN NEW.ImprovementType = 'IMPROVEMENT_LANDMARK'
BEGIN
	INSERT INTO Improvement_Yields
			(ImprovementType,			YieldType,			Yield)
	SELECT  'IMPROVEMENT_LANDMARK_EURO',NEW.YieldType,	NEW.Yield UNION ALL
	SELECT  'IMPROVEMENT_LANDMARK_ASIA',NEW.YieldType,	NEW.Yield UNION ALL
	SELECT  'IMPROVEMENT_LANDMARK_AMER',NEW.YieldType,	NEW.Yield UNION ALL
	SELECT  'IMPROVEMENT_LANDMARK_AFRI',NEW.YieldType,	NEW.Yield;
END;
--------------------------------------------------------------------------------------------------------------------------
-- Improvement_TechYieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Improvement_TechYieldChanges
		(ImprovementType,			TechType, YieldType, Yield)
SELECT	'IMPROVEMENT_LANDMARK_EURO',TechType, YieldType, Yield FROM Improvement_TechYieldChanges WHERE ImprovementType='IMPROVEMENT_LANDMARK' UNION ALL
SELECT	'IMPROVEMENT_LANDMARK_ASIA',TechType, YieldType, Yield FROM Improvement_TechYieldChanges WHERE ImprovementType='IMPROVEMENT_LANDMARK' UNION ALL
SELECT	'IMPROVEMENT_LANDMARK_AMER',TechType, YieldType, Yield FROM Improvement_TechYieldChanges WHERE ImprovementType='IMPROVEMENT_LANDMARK' UNION ALL
SELECT	'IMPROVEMENT_LANDMARK_AFRI',TechType, YieldType, Yield FROM Improvement_TechYieldChanges WHERE ImprovementType='IMPROVEMENT_LANDMARK';

CREATE TRIGGER IF NOT EXISTS JarLandmarkCV02 AFTER INSERT ON Improvement_TechYieldChanges
WHEN NEW.ImprovementType = 'IMPROVEMENT_LANDMARK'
BEGIN
	INSERT INTO Improvement_TechYieldChanges
			(ImprovementType,			TechType, 		YieldType,		Yield)
	SELECT  'IMPROVEMENT_LANDMARK_EURO',NEW.TechType, NEW.YieldType,NEW.Yield UNION ALL
	SELECT  'IMPROVEMENT_LANDMARK_ASIA',NEW.TechType, NEW.YieldType,NEW.Yield UNION ALL
	SELECT  'IMPROVEMENT_LANDMARK_AMER',NEW.TechType, NEW.YieldType,NEW.Yield UNION ALL
	SELECT  'IMPROVEMENT_LANDMARK_AFRI',NEW.TechType, NEW.YieldType,NEW.Yield;
END;
--------------------------------------------------------------------------------------------------------------------------
-- Improvement_YieldPerEra
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Improvement_YieldPerEra
		(ImprovementType,     		YieldType, Yield)
SELECT	'IMPROVEMENT_LANDMARK_EURO',YieldType, Yield FROM Improvement_YieldPerEra WHERE ImprovementType='IMPROVEMENT_LANDMARK' UNION ALL
SELECT	'IMPROVEMENT_LANDMARK_ASIA',YieldType, Yield FROM Improvement_YieldPerEra WHERE ImprovementType='IMPROVEMENT_LANDMARK' UNION ALL
SELECT	'IMPROVEMENT_LANDMARK_AMER',YieldType, Yield FROM Improvement_YieldPerEra WHERE ImprovementType='IMPROVEMENT_LANDMARK' UNION ALL
SELECT	'IMPROVEMENT_LANDMARK_AFRI',YieldType, Yield FROM Improvement_YieldPerEra WHERE ImprovementType='IMPROVEMENT_LANDMARK';

CREATE TRIGGER IF NOT EXISTS JarLandmarkCV03 AFTER INSERT ON Improvement_YieldPerEra
WHEN NEW.ImprovementType = 'IMPROVEMENT_LANDMARK'
BEGIN
	INSERT INTO Improvement_YieldPerEra
			(ImprovementType,			YieldType,			Yield)
	SELECT  'IMPROVEMENT_LANDMARK_EURO',NEW.YieldType,	NEW.Yield UNION ALL
	SELECT  'IMPROVEMENT_LANDMARK_ASIA',NEW.YieldType,	NEW.Yield UNION ALL
	SELECT  'IMPROVEMENT_LANDMARK_AMER',NEW.YieldType,	NEW.Yield UNION ALL
	SELECT  'IMPROVEMENT_LANDMARK_AFRI',NEW.YieldType,	NEW.Yield;
END;
--=======================================================================================================================	
-- TRAITS
--=======================================================================================================================
-- Trait_ImprovementYieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Trait_ImprovementYieldChanges
		(TraitType, ImprovementType,     		YieldType, Yield)
SELECT	 TraitType, 'IMPROVEMENT_LANDMARK_EURO',YieldType, Yield FROM Trait_ImprovementYieldChanges WHERE ImprovementType='IMPROVEMENT_LANDMARK' UNION ALL
SELECT	 TraitType, 'IMPROVEMENT_LANDMARK_ASIA',YieldType, Yield FROM Trait_ImprovementYieldChanges WHERE ImprovementType='IMPROVEMENT_LANDMARK' UNION ALL
SELECT	 TraitType, 'IMPROVEMENT_LANDMARK_AMER',YieldType, Yield FROM Trait_ImprovementYieldChanges WHERE ImprovementType='IMPROVEMENT_LANDMARK' UNION ALL
SELECT	 TraitType, 'IMPROVEMENT_LANDMARK_AFRI',YieldType, Yield FROM Trait_ImprovementYieldChanges WHERE ImprovementType='IMPROVEMENT_LANDMARK';

CREATE TRIGGER IF NOT EXISTS JarLandmarkCV04 AFTER INSERT ON Trait_ImprovementYieldChanges
WHEN NEW.ImprovementType = 'IMPROVEMENT_LANDMARK'
BEGIN
	INSERT INTO Trait_ImprovementYieldChanges
			(TraitType,	ImprovementType,			YieldType,			Yield)
	SELECT NEW.TraitType,'IMPROVEMENT_LANDMARK_EURO',NEW.YieldType,	NEW.Yield UNION ALL
	SELECT NEW.TraitType,'IMPROVEMENT_LANDMARK_ASIA',NEW.YieldType,	NEW.Yield UNION ALL
	SELECT NEW.TraitType,'IMPROVEMENT_LANDMARK_AMER',NEW.YieldType,	NEW.Yield UNION ALL
	SELECT NEW.TraitType,'IMPROVEMENT_LANDMARK_AFRI',NEW.YieldType,	NEW.Yield;
END;
--------------------------------------------------------------------------------------------------------------------------
-- Trait_ImprovementYieldChangesFromGoldenAge
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Trait_ImprovementYieldChangesFromGoldenAge
		(TraitType, ImprovementType,     		YieldType, Yield, YieldCap)
SELECT	 TraitType, 'IMPROVEMENT_LANDMARK_EURO',YieldType, Yield, YieldCap FROM Trait_ImprovementYieldChangesFromGoldenAge WHERE ImprovementType='IMPROVEMENT_LANDMARK' UNION ALL
SELECT	 TraitType, 'IMPROVEMENT_LANDMARK_ASIA',YieldType, Yield, YieldCap FROM Trait_ImprovementYieldChangesFromGoldenAge WHERE ImprovementType='IMPROVEMENT_LANDMARK' UNION ALL
SELECT	 TraitType, 'IMPROVEMENT_LANDMARK_AMER',YieldType, Yield, YieldCap FROM Trait_ImprovementYieldChangesFromGoldenAge WHERE ImprovementType='IMPROVEMENT_LANDMARK' UNION ALL
SELECT	 TraitType, 'IMPROVEMENT_LANDMARK_AFRI',YieldType, Yield, YieldCap FROM Trait_ImprovementYieldChangesFromGoldenAge WHERE ImprovementType='IMPROVEMENT_LANDMARK';

CREATE TRIGGER IF NOT EXISTS JarLandmarkCV05 AFTER INSERT ON Trait_ImprovementYieldChangesFromGoldenAge
WHEN NEW.ImprovementType = 'IMPROVEMENT_LANDMARK'
BEGIN
	INSERT INTO Trait_ImprovementYieldChangesFromGoldenAge
			(TraitType,	ImprovementType,			YieldType,			Yield, YieldCap)
	SELECT NEW.TraitType,'IMPROVEMENT_LANDMARK_EURO',NEW.YieldType,	NEW.Yield, NEW.YieldCap UNION ALL
	SELECT NEW.TraitType,'IMPROVEMENT_LANDMARK_ASIA',NEW.YieldType,	NEW.Yield, NEW.YieldCap UNION ALL
	SELECT NEW.TraitType,'IMPROVEMENT_LANDMARK_AMER',NEW.YieldType,	NEW.Yield, NEW.YieldCap UNION ALL
	SELECT NEW.TraitType,'IMPROVEMENT_LANDMARK_AFRI',NEW.YieldType,	NEW.Yield, NEW.YieldCap;
END;
--------------------------------------------------------------------------------------------------------------------------
-- Trait_YieldChangesPerImprovementBuilt
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Trait_YieldChangesPerImprovementBuilt
		(TraitType, ImprovementType,     		YieldType, Yield)
SELECT	 TraitType, 'IMPROVEMENT_LANDMARK_EURO',YieldType, Yield FROM Trait_YieldChangesPerImprovementBuilt WHERE ImprovementType='IMPROVEMENT_LANDMARK' UNION ALL
SELECT	 TraitType, 'IMPROVEMENT_LANDMARK_ASIA',YieldType, Yield FROM Trait_YieldChangesPerImprovementBuilt WHERE ImprovementType='IMPROVEMENT_LANDMARK' UNION ALL
SELECT	 TraitType, 'IMPROVEMENT_LANDMARK_AMER',YieldType, Yield FROM Trait_YieldChangesPerImprovementBuilt WHERE ImprovementType='IMPROVEMENT_LANDMARK' UNION ALL
SELECT	 TraitType, 'IMPROVEMENT_LANDMARK_AFRI',YieldType, Yield FROM Trait_YieldChangesPerImprovementBuilt WHERE ImprovementType='IMPROVEMENT_LANDMARK';

CREATE TRIGGER IF NOT EXISTS JarLandmarkCV06 AFTER INSERT ON Trait_YieldChangesPerImprovementBuilt
WHEN NEW.ImprovementType = 'IMPROVEMENT_LANDMARK'
BEGIN
	INSERT INTO Trait_YieldChangesPerImprovementBuilt
			(TraitType,	ImprovementType,			YieldType,			Yield)
	SELECT NEW.TraitType,'IMPROVEMENT_LANDMARK_EURO',NEW.YieldType,	NEW.Yield UNION ALL
	SELECT NEW.TraitType,'IMPROVEMENT_LANDMARK_ASIA',NEW.YieldType,	NEW.Yield UNION ALL
	SELECT NEW.TraitType,'IMPROVEMENT_LANDMARK_AMER',NEW.YieldType,	NEW.Yield UNION ALL
	SELECT NEW.TraitType,'IMPROVEMENT_LANDMARK_AFRI',NEW.YieldType,	NEW.Yield;
END;
--=======================================================================================================================	
-- BUILDINGS
--=======================================================================================================================
-- Building_ImprovementYieldChanges
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_ImprovementYieldChanges
		(BuildingType, ImprovementType, 			YieldType, Yield)
SELECT	 BuildingType, 'IMPROVEMENT_LANDMARK_EURO', YieldType, Yield FROM Building_ImprovementYieldChanges WHERE ImprovementType='IMPROVEMENT_LANDMARK' UNION ALL
SELECT	 BuildingType, 'IMPROVEMENT_LANDMARK_ASIA', YieldType, Yield FROM Building_ImprovementYieldChanges WHERE ImprovementType='IMPROVEMENT_LANDMARK' UNION ALL
SELECT	 BuildingType, 'IMPROVEMENT_LANDMARK_AMER', YieldType, Yield FROM Building_ImprovementYieldChanges WHERE ImprovementType='IMPROVEMENT_LANDMARK' UNION ALL
SELECT	 BuildingType, 'IMPROVEMENT_LANDMARK_AFRI', YieldType, Yield FROM Building_ImprovementYieldChanges WHERE ImprovementType='IMPROVEMENT_LANDMARK';

CREATE TRIGGER IF NOT EXISTS JarLandmarkCV07 AFTER INSERT ON Building_ImprovementYieldChanges
WHEN NEW.ImprovementType = 'IMPROVEMENT_LANDMARK'
BEGIN
	INSERT INTO Building_ImprovementYieldChanges
			(BuildingType,	ImprovementType,			YieldType,			Yield)
	SELECT NEW.BuildingType,'IMPROVEMENT_LANDMARK_EURO',NEW.YieldType,	NEW.Yield UNION ALL
	SELECT NEW.BuildingType,'IMPROVEMENT_LANDMARK_ASIA',NEW.YieldType,	NEW.Yield UNION ALL
	SELECT NEW.BuildingType,'IMPROVEMENT_LANDMARK_AMER',NEW.YieldType,	NEW.Yield UNION ALL
	SELECT NEW.BuildingType,'IMPROVEMENT_LANDMARK_AFRI',NEW.YieldType,	NEW.Yield;
END;
--------------------------------------------------------------------------------------------------------------------------
-- Building_ImprovementYieldChangesGlobal
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_ImprovementYieldChangesGlobal
		(BuildingType,	ImprovementType,			YieldType, Yield) 
SELECT	 BuildingType, 'IMPROVEMENT_LANDMARK_EURO', YieldType, Yield FROM Building_ImprovementYieldChangesGlobal WHERE ImprovementType='IMPROVEMENT_LANDMARK' UNION ALL
SELECT	 BuildingType, 'IMPROVEMENT_LANDMARK_ASIA', YieldType, Yield FROM Building_ImprovementYieldChangesGlobal WHERE ImprovementType='IMPROVEMENT_LANDMARK' UNION ALL
SELECT	 BuildingType, 'IMPROVEMENT_LANDMARK_AMER', YieldType, Yield FROM Building_ImprovementYieldChangesGlobal WHERE ImprovementType='IMPROVEMENT_LANDMARK' UNION ALL
SELECT	 BuildingType, 'IMPROVEMENT_LANDMARK_AFRI', YieldType, Yield FROM Building_ImprovementYieldChangesGlobal WHERE ImprovementType='IMPROVEMENT_LANDMARK';

CREATE TRIGGER IF NOT EXISTS JarLandmarkCV08 AFTER INSERT ON Building_ImprovementYieldChangesGlobal
WHEN NEW.ImprovementType = 'IMPROVEMENT_LANDMARK'
BEGIN
	INSERT INTO Building_ImprovementYieldChangesGlobal
			(BuildingType,	ImprovementType,			YieldType,			Yield)
	SELECT NEW.BuildingType,'IMPROVEMENT_LANDMARK_EURO',NEW.YieldType,	NEW.Yield UNION ALL
	SELECT NEW.BuildingType,'IMPROVEMENT_LANDMARK_ASIA',NEW.YieldType,	NEW.Yield UNION ALL
	SELECT NEW.BuildingType,'IMPROVEMENT_LANDMARK_AMER',NEW.YieldType,	NEW.Yield UNION ALL
	SELECT NEW.BuildingType,'IMPROVEMENT_LANDMARK_AFRI',NEW.YieldType,	NEW.Yield;
END;
--=======================================================================================================================	
-- POLICIES
--=======================================================================================================================
-- Policy_ImprovementCultureChanges
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_ImprovementCultureChanges
		(PolicyType, ImprovementType,				CultureChange)
SELECT	 PolicyType, 'IMPROVEMENT_LANDMARK_EURO',	CultureChange FROM Policy_ImprovementCultureChanges WHERE ImprovementType='IMPROVEMENT_LANDMARK' UNION ALL
SELECT	 PolicyType, 'IMPROVEMENT_LANDMARK_ASIA',	CultureChange FROM Policy_ImprovementCultureChanges WHERE ImprovementType='IMPROVEMENT_LANDMARK' UNION ALL
SELECT	 PolicyType, 'IMPROVEMENT_LANDMARK_AMER',	CultureChange FROM Policy_ImprovementCultureChanges WHERE ImprovementType='IMPROVEMENT_LANDMARK' UNION ALL
SELECT	 PolicyType, 'IMPROVEMENT_LANDMARK_AFRI',	CultureChange FROM Policy_ImprovementCultureChanges WHERE ImprovementType='IMPROVEMENT_LANDMARK';

CREATE TRIGGER IF NOT EXISTS JarLandmarkCV09 AFTER INSERT ON Policy_ImprovementCultureChanges
WHEN NEW.ImprovementType = 'IMPROVEMENT_LANDMARK'
BEGIN
	INSERT INTO Policy_ImprovementCultureChanges
			(PolicyType,	ImprovementType,			CultureChange)
	SELECT NEW.PolicyType,'IMPROVEMENT_LANDMARK_EURO',	NEW.CultureChange UNION ALL
	SELECT NEW.PolicyType,'IMPROVEMENT_LANDMARK_ASIA',	NEW.CultureChange UNION ALL
	SELECT NEW.PolicyType,'IMPROVEMENT_LANDMARK_AMER',	NEW.CultureChange UNION ALL
	SELECT NEW.PolicyType,'IMPROVEMENT_LANDMARK_AFRI',	NEW.CultureChange;
END;
--------------------------------------------------------------------------------------------------------------------------
-- Policy_ImprovementYieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_ImprovementYieldChanges
		(PolicyType, ImprovementType,     		 YieldType, Yield)
SELECT	 PolicyType, 'IMPROVEMENT_LANDMARK_EURO',YieldType, Yield FROM Policy_ImprovementYieldChanges WHERE ImprovementType='IMPROVEMENT_LANDMARK' UNION ALL
SELECT	 PolicyType, 'IMPROVEMENT_LANDMARK_ASIA',YieldType, Yield FROM Policy_ImprovementYieldChanges WHERE ImprovementType='IMPROVEMENT_LANDMARK' UNION ALL
SELECT	 PolicyType, 'IMPROVEMENT_LANDMARK_AMER',YieldType, Yield FROM Policy_ImprovementYieldChanges WHERE ImprovementType='IMPROVEMENT_LANDMARK' UNION ALL
SELECT	 PolicyType, 'IMPROVEMENT_LANDMARK_AFRI',YieldType, Yield FROM Policy_ImprovementYieldChanges WHERE ImprovementType='IMPROVEMENT_LANDMARK';

CREATE TRIGGER IF NOT EXISTS JarLandmarkCV10 AFTER INSERT ON Policy_ImprovementYieldChanges
WHEN NEW.ImprovementType = 'IMPROVEMENT_LANDMARK'
BEGIN
	INSERT INTO Policy_ImprovementYieldChanges
			(PolicyType,	ImprovementType,			YieldType,			Yield)
	SELECT NEW.PolicyType,'IMPROVEMENT_LANDMARK_EURO',	NEW.YieldType,	NEW.Yield UNION ALL
	SELECT NEW.PolicyType,'IMPROVEMENT_LANDMARK_ASIA',	NEW.YieldType,	NEW.Yield UNION ALL
	SELECT NEW.PolicyType,'IMPROVEMENT_LANDMARK_AMER',	NEW.YieldType,	NEW.Yield UNION ALL
	SELECT NEW.PolicyType,'IMPROVEMENT_LANDMARK_AFRI',	NEW.YieldType,	NEW.Yield;
END;
--=======================================================================================================================	
-- BELIEFS
--=======================================================================================================================
-- Belief_ImprovementYieldChanges
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Belief_ImprovementYieldChanges
		(BeliefType, ImprovementType,     		 YieldType, Yield)
SELECT	 BeliefType, 'IMPROVEMENT_LANDMARK_EURO',YieldType, Yield FROM Belief_ImprovementYieldChanges WHERE ImprovementType='IMPROVEMENT_LANDMARK' UNION ALL
SELECT	 BeliefType, 'IMPROVEMENT_LANDMARK_ASIA',YieldType, Yield FROM Belief_ImprovementYieldChanges WHERE ImprovementType='IMPROVEMENT_LANDMARK' UNION ALL
SELECT	 BeliefType, 'IMPROVEMENT_LANDMARK_AMER',YieldType, Yield FROM Belief_ImprovementYieldChanges WHERE ImprovementType='IMPROVEMENT_LANDMARK' UNION ALL
SELECT	 BeliefType, 'IMPROVEMENT_LANDMARK_AFRI',YieldType, Yield FROM Belief_ImprovementYieldChanges WHERE ImprovementType='IMPROVEMENT_LANDMARK';

CREATE TRIGGER IF NOT EXISTS JarLandmarkCV11 AFTER INSERT ON Belief_ImprovementYieldChanges
WHEN NEW.ImprovementType = 'IMPROVEMENT_LANDMARK'
BEGIN
	INSERT INTO Belief_ImprovementYieldChanges
			(BeliefType,	ImprovementType,			YieldType,			Yield)
	SELECT NEW.BeliefType,'IMPROVEMENT_LANDMARK_EURO',	NEW.YieldType,	NEW.Yield UNION ALL
	SELECT NEW.BeliefType,'IMPROVEMENT_LANDMARK_ASIA',	NEW.YieldType,	NEW.Yield UNION ALL
	SELECT NEW.BeliefType,'IMPROVEMENT_LANDMARK_AMER',	NEW.YieldType,	NEW.Yield UNION ALL
	SELECT NEW.BeliefType,'IMPROVEMENT_LANDMARK_AFRI',	NEW.YieldType,	NEW.Yield;
END;
--=======================================================================================================================
--=======================================================================================================================
