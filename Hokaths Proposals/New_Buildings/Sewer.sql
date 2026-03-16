INSERT INTO BuildingClasses 	
			(Type,							DefaultBuilding,		Description)
VALUES		('BUILDINGCLASS_SEWER',	'BUILDING_SEWER',	'TXT_KEY_BUILDING_SEWER');

INSERT INTO	 Buildings
		(Type,						Description,						Civilopedia,							Strategy,									Help,									GoldMaintenance, 	Cost, HurryCostModifier, 	MinAreaSize, 	ConquestProb, 	BuildingClass, 					ArtDefineTag, 				PrereqTech, 			PortraitIndex, 	IconAtlas)
VALUES	('BUILDING_SEWER',	'TXT_KEY_BUILDING_SEWER', 	'TXT_KEY_BUILDING_SEWER_TEXT',	'TXT_KEY_BUILDING_SEWER_STRATEGY',	'TXT_KEY_BUILDING_SEWER_HELP',	5, 				1000, -20, 					-1, 			80, 			'BUILDINGCLASS_SEWER', 	'ART_DEF_BUILDING_MARKET', 	'TECH_STEAM_POWER', 	31,				'CORP2_ATLAS');

--UPDATE Buildings SET PrereqTech = 'TECH_RIFLING' WHERE BuildingClass = 'BUILDINGCLASS_THEATRE';

UPDATE Buildings SET
	FoodKept = 10,
	PovertyFlatReduction = 1
WHERE BuildingClass = 'BUILDINGCLASS_SEWER';

UPDATE Buildings SET
PovertyFlatReduction = 0
WHERE BuildingClass = 'BUILDINGCLASS_GROCER';

UPDATE Language_en_US
SET Text = Replace(Text,  '[NEWLINE][NEWLINE]-1 [ICON_HAPPINESS_3] Unhappiness from [ICON_GOLD] Poverty.', '')
WHERE Tag = 'TXT_KEY_BUILDING_GROCER_HELP';

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_SEWER', 'YIELD_SCIENCE', 1);

INSERT INTO Building_FeatureYieldChanges
	(BuildingType, 	FeatureType, YieldType, Yield)
VALUES
	('BUILDING_SEWER', 'FEATURE_MARSH', 'YIELD_SCIENCE', 2);

INSERT INTO Building_RiverPlotYieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_SEWER', 'YIELD_PRODUCTION', 1);

--INSERT INTO Building_GoldenAgeYieldMod
--	(BuildingType, YieldType, Yield)
--VALUES
--	('BUILDING_SEWER', 'YIELD_FOOD', 10);
-- +10% [ICON_FOOD] Food in the City during [ICON_GOLDEN_AGE] Golden Ages. 

INSERT INTO Building_GrowthExtraYield
	(BuildingType, YieldType, Yield)
SELECT
	Type, 'YIELD_FOOD', 50
FROM Buildings
WHERE BuildingClass = 'BUILDINGCLASS_SEWER';

DELETE FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_HOSPITAL';

INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 			BuildingClassType)
VALUES
	('BUILDING_SEWER', 'BUILDINGCLASS_GROCER'),
	('BUILDING_HOSPITAL', 'BUILDINGCLASS_SEWER');

INSERT INTO Building_Flavors 
	(BuildingType, FlavorType, Flavor)
VALUES
	('BUILDING_SEWER', 'FLAVOR_GROWTH', 30),
	('BUILDING_SEWER', 'FLAVOR_SCIENCE', 5);

------------------------------
-- Text
------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES	('TXT_KEY_BUILDING_SEWER',			'Sewer'),
		('TXT_KEY_BUILDING_SEWER_TEXT',		'Archaeological discoveries have shown that some of the earliest sewer systems were developed in the third millennium BCE in the ancient cities of Harappa and Mohenjo-daro in present-day Pakistan. The primitive sewers were carved in the ground alongside buildings. Before modern sewers were invented, cesspools that collected human waste were the most widely used sanitation system. In the Middle Ages waste was collected into cesspools that were periodically emptied by workers known as "rakers" who would often sell it as fertilizer to farmers outside the city.[NEWLINE][NEWLINE]Modern sewerage systems were first built in the mid-nineteenth century as a reaction to the exacerbation of sanitary conditions brought on by heavy industrialization and urbanization. Due to the contaminated water supply, cholera outbreaks occurred in 1832, 1849 and 1855 in London, killing tens of thousands of people. This led Joseph Bazalgette to construct a vast underground sewage system for the safe removal of waste. Bazalgette''s system, and others later built in Continental Europe, did not pump the sewage onto farm land for use as fertilizer; it was simply piped to a natural waterway away from population centres, and pumped back into the environment.'),
		('TXT_KEY_BUILDING_SEWER_STRATEGY',	'The Sewer comes in the line of buildings that carry Food over after a Citizen is born, fighting the exponential scaling of increasing population. In addition, it increases the raw Food output of the City during Golden Ages and whenever a [ICON_CITIZEN] Citizen is born, as well as fighting the resulting Poverty. Additionally it confers Food and also Science to nearby Marshes, Lakes, and Oases. The final benefit, Production on River tiles, will help pay for the construction costs over time. Use the Sewer to take advantage of the strong population scaling of Buildings that become available in the Industrial Era.'),
		('TXT_KEY_BUILDING_SEWER_HELP',		'');

-- 10% of [ICON_FOOD] Food is carried over, and 50% of the [ICON_FOOD] Food output of the City is added as an instant boost when a [ICON_CITIZEN] Citizen is born in this City.[NEWLINE][NEWLINE]Nearby Marshes: +2 [ICON_RESEARCH] Science.[NEWLINE]River Tiles: +1 [ICON_PRODUCTION] Production.[NEWLINE][NEWLINE]-1 [ICON_HAPPINESS_3] Unhappiness from [ICON_GOLD] Poverty.

