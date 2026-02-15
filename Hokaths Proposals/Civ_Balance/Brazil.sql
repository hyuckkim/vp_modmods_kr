--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings
	(Type, BuildingClass,	Cost,	GoldMaintenance,	FaithCost,	IlliteracyFlatReduction, PrereqTech,		
	Help,		Description,	Civilopedia,	
	Strategy,	ArtDefineTag,	MinAreaSize,	HurryCostModifier,	NeverCapture,	IconAtlas,			PortraitIndex,
	SpecialistType, SpecialistCount, UnlockedByBelief)
SELECT	('BUILDING_BRAZIL_EMBRAPA'), BuildingClass,	Cost,	GoldMaintenance,	FaithCost,		IlliteracyFlatReduction,	PrereqTech,		('TXT_KEY_BUILDING_BRAZIL_EMBRAPA_HELP'),	('TXT_KEY_BUILDING_BRAZIL_EMBRAPA'),	('TXT_KEY_BUILDING_BRAZIL_EMBRAPA_TEXT'),	('TXT_KEY_BUILDING_BRAZIL_EMBRAPA_STRATEGY'), 	ArtDefineTag,	MinAreaSize,	HurryCostModifier,	1,	('CORP2_ATLAS'),	8,
	SpecialistType, SpecialistCount, UnlockedByBelief
FROM Buildings WHERE (Type = 'BUILDING_LABORATORY');

UPDATE Units SET 
	IconAtlas = 'CORP2_ATLAS',
	PortraitIndex = 15
WHERE Type = 'UNIT_BRAZIL_AMAZONAS';
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType,		Flavor)
SELECT	('BUILDING_BRAZIL_EMBRAPA'),	'FLAVOR_CULTURE',	10 UNION ALL
SELECT	('BUILDING_BRAZIL_EMBRAPA'),	 FlavorType,		Flavor+10
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_LABORATORY');
------------------------------	
-- Building_YieldChanges
------------------------------		
INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_BRAZIL_EMBRAPA', 'YIELD_SCIENCE', 4),
	('BUILDING_BRAZIL_EMBRAPA', 'YIELD_TOURISM', 2),
	('BUILDING_BRAZIL_EMBRAPA', 'YIELD_GOLD', 2);
------------------------------------------------------------------------------------------------------------------------
-- Building_YieldFromYieldPercent
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldFromYieldPercent
	(BuildingType, 					YieldIn, 		YieldOut, 		Value) 
VALUES
	('BUILDING_BRAZIL_EMBRAPA', 	'YIELD_FOOD', 	'YIELD_TOURISM', 5);

INSERT INTO Building_ImprovementYieldChanges
	(BuildingType, ImprovementType, YieldType, Yield)
VALUES
	('BUILDING_BRAZIL_EMBRAPA', 'IMPROVEMENT_ACADEMY', 'YIELD_SCIENCE', 4),
	('BUILDING_BRAZIL_EMBRAPA', 'IMPROVEMENT_PASTURE', 'YIELD_SCIENCE', 2),	
	('BUILDING_BRAZIL_EMBRAPA', 'IMPROVEMENT_PASTURE', 'YIELD_CULTURE', 2),	
	('BUILDING_BRAZIL_EMBRAPA', 'IMPROVEMENT_PASTURE', 'YIELD_GOLD', 2),
	('BUILDING_BRAZIL_EMBRAPA', 'IMPROVEMENT_BRAZILWOOD_CAMP', 'YIELD_SCIENCE', 2),	
	('BUILDING_BRAZIL_EMBRAPA', 'IMPROVEMENT_BRAZILWOOD_CAMP', 'YIELD_CULTURE', 2),	
	('BUILDING_BRAZIL_EMBRAPA', 'IMPROVEMENT_BRAZILWOOD_CAMP', 'YIELD_GOLD', 2);

INSERT INTO Building_BuildingClassLocalYieldChanges
	(BuildingType, BuildingClassType, YieldType, YieldChange)
SELECT
	BuildingType, BuildingClassType, 'YIELD_SCIENCE', 4
FROM Building_BuildingClassLocalYieldChanges 
WHERE BuildingType = 'BUILDINGCLASS_LABORATORY';

INSERT INTO Building_SpecificGreatPersonRateModifier
	(BuildingType, SpecialistType, Modifier)
VALUES
	('BUILDING_BRAZIL_EMBRAPA', 'SPECIALIST_SCIENTIST', 33);

INSERT INTO Building_ResourceYieldChanges
	(BuildingType, ResourceType, YieldType, Yield)
VALUES
	('BUILDING_BRAZIL_EMBRAPA', 'RESOURCE_OIL', 'YIELD_SCIENCE', 4),
	('BUILDING_BRAZIL_EMBRAPA', 'RESOURCE_ALUMINUM', 'YIELD_SCIENCE', 4),
	('BUILDING_BRAZIL_EMBRAPA', 'RESOURCE_URANIUM', 'YIELD_SCIENCE', 4),
	('BUILDING_BRAZIL_EMBRAPA', 'RESOURCE_BANANA', 'YIELD_SCIENCE', 2),
	('BUILDING_BRAZIL_EMBRAPA', 'RESOURCE_BANANA', 'YIELD_CULTURE', 2),
	('BUILDING_BRAZIL_EMBRAPA', 'RESOURCE_BANANA', 'YIELD_GOLD', 2),
	('BUILDING_BRAZIL_EMBRAPA', 'RESOURCE_RICE', 'YIELD_SCIENCE', 2),
	('BUILDING_BRAZIL_EMBRAPA', 'RESOURCE_RICE', 'YIELD_CULTURE', 2),
	('BUILDING_BRAZIL_EMBRAPA', 'RESOURCE_RICE', 'YIELD_GOLD', 2),
	('BUILDING_BRAZIL_EMBRAPA', 'RESOURCE_MAIZE', 'YIELD_SCIENCE', 2),
	('BUILDING_BRAZIL_EMBRAPA', 'RESOURCE_MAIZE', 'YIELD_CULTURE', 2),
	('BUILDING_BRAZIL_EMBRAPA', 'RESOURCE_MAIZE', 'YIELD_GOLD', 2),
	('BUILDING_BRAZIL_EMBRAPA', 'RESOURCE_WHEAT', 'YIELD_SCIENCE', 2),
	('BUILDING_BRAZIL_EMBRAPA', 'RESOURCE_WHEAT', 'YIELD_CULTURE', 2),
	('BUILDING_BRAZIL_EMBRAPA', 'RESOURCE_WHEAT', 'YIELD_GOLD', 2);

INSERT INTO Building_FeatureYieldChanges
	(BuildingType, FeatureType, YieldType, Yield)
VALUES
	('BUILDING_BRAZIL_EMBRAPA', 'FEATURE_FOREST', 'YIELD_SCIENCE', 1),
	('BUILDING_BRAZIL_EMBRAPA', 'FEATURE_FOREST', 'YIELD_TOURISM', 1),	
	('BUILDING_BRAZIL_EMBRAPA', 'FEATURE_JUNGLE', 'YIELD_SCIENCE', 1),
	('BUILDING_BRAZIL_EMBRAPA', 'FEATURE_JUNGLE', 'YIELD_TOURISM', 1);
------------------------------	
-- Building_ClassesNeededInCity
------------------------------		
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 			BuildingClassType)
SELECT	'BUILDING_BRAZIL_EMBRAPA',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_LABORATORY';
--==========================================================================================================================	
-- Civilization_BuildingClassOverrides
--==========================================================================================================================		
DELETE FROM Civilization_BuildingClassOverrides WHERE BuildingType = 'BUILDING_BRAZIL_SAMBADROME';

INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 			BuildingClassType, 			BuildingType)
SELECT	'CIVILIZATION_BRAZIL', 	'BUILDINGCLASS_LABORATORY',		'BUILDING_BRAZIL_EMBRAPA'
WHERE EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_GERMANY_TEUTONIC_ORDER');

INSERT INTO Language_en_US (Tag, Text)
VALUES	('TXT_KEY_BUILDING_BRAZIL_EMBRAPA',			'Embrapa'),
		('TXT_KEY_BUILDING_BRAZIL_EMBRAPA_TEXT',		'Embrapa is a state-owned research corporation affiliated with the Brazilian Ministry of Agriculture. Since its inception on April 26, 1973, it has been devoted to developing technologies, knowledge and technical-scientific information aimed at Brazilian agriculture, including livestock. Embrapa''s organizational structure is composed of 46 centers that can be divided into Research Units or Service Units, and of 17 Central Units that comprise the corporation''s headquarters. Such research centers are distributed throughout the country in nearly all Brazilian states.'),
		('TXT_KEY_BUILDING_BRAZIL_EMBRAPA_STRATEGY',	'The Embrapa provides bonuses to Tourism, Culture, and even Gold, on top of Science bonuses like the Research Lab, which it replaces. Brazilwood Camps, as well as the Jungle and/or Forest tiles on which they are built receive additional Science as well as either Tourism or Culture and Gold. Pastures and the plant bonuses resources are also boosted like the Brazilwood Camp. These bonuses are most effective for a large empire with many Brazilwood Camps and ways of turning Culture on tiles into Tourism. Finally Cities gain Tourism from a percentage of their total Food, increasing its value to your Empire.'),
		('TXT_KEY_BUILDING_BRAZIL_EMBRAPA_HELP', '+4 [ICON_RESEARCH] Science from [ICON_RES_OIL] Oil, [ICON_RES_ALUMINUM] Aluminum, [ICON_RES_URANIUM] Uranium, and Academies worked by this City.[NEWLINE][NEWLINE]+2 [ICON_GOLD] Gold, [ICON_RESEARCH] Science, and [ICON_CULTURE] Culture from Brazilwood Camps, Pastures, [ICON_RES_BANANA] Bananas, [ICON_RES_RICE] Rice, [ICON_RES_MAIZE] Maize, and [ICON_RES_WHEAT] Wheat worked by this City. +1 [ICON_RESEARCH] Science and [ICON_TOURISM] Tourism from Forest and Jungle tiles worked by this City. 5% of [ICON_FOOD] Food created by the City counts as [ICON_TOURISM] Tourism.[NEWLINE][NEWLINE]+4 [ICON_RESEARCH] Science from Hospitals, Factories, and Medical Labs, and [ICON_GREAT_SCIENTIST] Great Scientists are produced 33% more quickly in this City.[NEWLINE][NEWLINE]-1 [ICON_HAPPINESS_3] Unhappiness from [ICON_RESEARCH] Illiteracy.');


