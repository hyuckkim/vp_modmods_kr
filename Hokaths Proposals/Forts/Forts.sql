-- Fort
UPDATE Improvements SET
--AI will only do tiles that touch it 
OutsideBorders = 0,
GoldMaintenance = 2
WHERE Type = 'IMPROVEMENT_FORT';

--INSERT INTO Improvement_Yields
--	(ImprovementType, YieldType, Yield)
--VALUES
--	('IMPROVEMENT_FORT', 'YIELD_GOLD', 1);

-- fort connects strategics in your territory
INSERT INTO Improvement_ResourceTypes
	(ImprovementType, ResourceType, ResourceMakesValid, ResourceTrade, DiscoveryRand, QuantityRequirement)
SELECT
	'IMPROVEMENT_FORT', ResourceType, ResourceMakesValid, ResourceTrade, DiscoveryRand, QuantityRequirement
FROM Improvement_ResourceTypes WHERE ImprovementType = 'IMPROVEMENT_CELTS_OPPIDUM';

UPDATE Language_en_US
SET Text = 'A fort is a special improvement that can be built outside your borders and improves the defensive bonus of the tile by 50% for units stationed in that tile. However, forts do not provide a defensive bonus to units in enemy territory and [COLOR_NEGATIVE_TEXT]costs[ENDCOLOR] 2 [ICON_GOLD] Gold per turn to maintain. Cannot be built adjacent to one another. Contains [COLOR_POSITIVE_TEXT]Fortifications[ENDCOLOR], allowing owned Units to stay stationed in this tile after attacking and a [COLOR_POSITIVE_TEXT]Canal[ENDCOLOR], allowing friendly [COLOR_POSITIVE_TEXT]Sea[ENDCOLOR] Units to traverse through it.'
WHERE Tag = 'TXT_KEY_CIV5_IMPROVEMENTS_FORT_TEXT';

UPDATE Language_en_US
SET Text = '[COLOR_NEGATIVE_TEXT]Costs[ENDCOLOR] 2 [ICON_GOLD] Gold per turn to maintain. +50% [ICON_STRENGTH] Defensive Strength for any Unit stationed in this tile. Contains [COLOR_POSITIVE_TEXT]Fortifications[ENDCOLOR], allowing owned Units to stay stationed in this tile after attacking and a [COLOR_POSITIVE_TEXT]Canal[ENDCOLOR], allowing friendly [COLOR_POSITIVE_TEXT]Sea[ENDCOLOR] Units to traverse through it.'
WHERE Tag = 'TXT_KEY_BUILD_FORT_HELP';

-- airbase. Fort upgrade that amongst other things claims the tile it is on!
INSERT INTO BuildFeatures
		(BuildType, 		FeatureType,	PrereqTech,	Time,	Production, Remove)
SELECT	'BUILD_FORT_2',	FeatureType,	PrereqTech,	Time,	Production,	Remove
FROM BuildFeatures WHERE BuildType = 'BUILD_FORT';

INSERT INTO Unit_Builds
	(UnitType,		BuildType)
VALUES
	('UNIT_WORKER',	'BUILD_FORT_2');

INSERT INTO Improvement_ValidTerrains
		(ImprovementType, 		TerrainType)
SELECT
	'IMPROVEMENT_FORT_2', TerrainType
FROM Improvement_ValidTerrains WHERE ImprovementType = 'IMPROVEMENT_FORT';

INSERT INTO Improvement_ValidImprovements
	(ImprovementType, PrereqImprovement)
VALUES
	('IMPROVEMENT_FORT_2', 'IMPROVEMENT_FORT');

INSERT INTO Improvement_ResourceTypes
	(ImprovementType, ResourceType, ResourceMakesValid, ResourceTrade, DiscoveryRand, QuantityRequirement)
SELECT
	'IMPROVEMENT_FORT_2', ResourceType, ResourceMakesValid, ResourceTrade, DiscoveryRand, QuantityRequirement
FROM Improvement_ResourceTypes WHERE ImprovementType = 'IMPROVEMENT_FORT';

INSERT INTO Policy_ImprovementYieldChanges
		(PolicyType, ImprovementType, 		YieldType, Yield)
SELECT
	PolicyType, 'IMPROVEMENT_FORT_2', YieldType, Yield
FROM Policy_ImprovementYieldChanges WHERE ImprovementType = 'IMPROVEMENT_FORT';

-- copying tech changes makes the tech tree look nasty. Don't need to copy the ones before it unlocks
INSERT INTO Improvement_Yields
		(ImprovementType, 		YieldType, 		Yield)
VALUES
	('IMPROVEMENT_FORT_2', 'YIELD_CULTURE_LOCAL', 3),
	('IMPROVEMENT_FORT_2', 'YIELD_SCIENCE', 3);
-- this is an extra +1 sci so that the ai considers upgrading the improvement. will have to revisit

-- the ones after it unlocks we just move onto the airbase
DELETE FROM Improvement_TechYieldChanges WHERE ImprovementType = 'IMPROVEMENT_FORT' AND TechType IN ('TECH_STEALTH', 'TECH_ELECTRONICS');

INSERT INTO Improvement_TechYieldChanges
		(ImprovementType, 		TechType,			YieldType, 		Yield)
VALUES
	('IMPROVEMENT_FORT_2', 'TECH_STEALTH', 'YIELD_SCIENCE', 4),
	('IMPROVEMENT_FORT_2', 'TECH_ELECTRONICS', 'YIELD_CULTURE_LOCAL', 4);

-- art defines
INSERT INTO ArtDefine_LandmarkTypes(Type, LandmarkType, FriendlyName)
VALUES ('ART_DEF_IMPROVEMENT_FORT_2', 'Improvement', 'airbase');

-- don't need this anymore, we can use the nice hangar model from DJS
-- fort art will never update. airbase will use the current modern fort art
DELETE FROM ArtDefine_Landmarks WHERE Era = 'Industrial' AND ImprovementType = 'IMPROVEMENT_FORT';

--INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
--VALUES 
--	('Any', 'UnderConstruction', 0.8,  'ART_DEF_IMPROVEMENT_FORT_2', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'Assets/Buildings/Improvements/Fort/Modern/HB_Fort_MOD.fxsxml', 1),
--	('Any', 'Constructed', 0.8,  'ART_DEF_IMPROVEMENT_FORT_2', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'Assets/Buildings/Improvements/Fort/Modern/Fort_MOD.fxsxml', 1),
--	('Any', 'Pillaged', 0.6,  'ART_DEF_IMPROVEMENT_FORT_2', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'Assets/Buildings/Improvements/Fort/Modern/PL_Fort_MOD.fxsxml', 1);

INSERT INTO ArtDefine_Landmarks (Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
VALUES 
	('Any', 'UnderConstruction', 0.9,  'ART_DEF_IMPROVEMENT_FORT_2', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'Depot Postapocalyptic HB.fxsxml', 1),
	('Any', 'Constructed', 0.9,  'ART_DEF_IMPROVEMENT_FORT_2', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'Depot Postapocalyptic B.fxsxml', 1),
	('Any', 'Pillaged', 0.8,  'ART_DEF_IMPROVEMENT_FORT_2', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'Depot Postapocalyptic PL.fxsxml', 1);
	
INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)
VALUES ('ART_DEF_IMPROVEMENT_FORT_2', 'Improvement', 'SV_Fort.dds');

--Naval Base
-- I wonder if we could improve atolls? Let's use the fort as a test
--INSERT INTO Improvement_ValidFeatures
--	(ImprovementType, FeatureType)
--VALUES
--	('IMPROVEMENT_FORT', 'FEATURE_ATOLL');

--CultureBombRadius=1

--Being able to station airplanes would be nice
--UPDATE CustomModOptions SET Value = 1 WHERE Name ='EVENTS_REBASE';
--AllowsRebaseTo = 1,
--Seems it needs some kind of lua fuckery. Sadge.

--AllowsWalkWater = 1,
--Water = 1,

--UPDATE Builds SET
--Water = 1,
--CanBeEmbarked = 1
--WHERE Type = 'BUILD_FORT';

--UPDATE Features SET
--NoImprovement = 0
--WHERE Type = 'FEATURE_ATOLL';


