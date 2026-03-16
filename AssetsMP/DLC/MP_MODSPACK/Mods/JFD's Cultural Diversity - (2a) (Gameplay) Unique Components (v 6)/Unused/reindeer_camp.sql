
INSERT INTO Trait_BuildsUnitClasses
	(TraitType, UnitClassType, BuildType)
SELECT
	Type, 'UNITCLASS_WORKER', 'BUILD_CAMP_REINDEER' 
FROM Traits a, Leader_Traits b, Civilization_Leaders c, Civilization_JFD_CultureTypes d
WHERE a.Type = b.TraitType AND b.LeaderType = c.LeaderheadType AND 
c.CivilizationType = d.CivilizationType AND d.CultureType = 'CULTURE_JFD_POLAR';

-- this is a UI workaround
REPLACE INTO Language_en_US 
	(Tag, Text)
SELECT
	'TXT_KEY_BUILDING_D_FOR_REINDEER_HELP', 'Requires the [ICON_CULTURE_JFD_POLAR] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_POLAR_SHORT_DESC}[ENDCOLOR] Cultural Group. After researching [COLOR_CYAN]Trapping[ENDCOLOR], your Workers can create Camps on [COLOR_POSITIVE_TEXT]Tundra[ENDCOLOR] and [COLOR_POSITIVE_TEXT]Snow[ENDCOLOR] without Resources that place a copy of the [ICON_RES_REINDEER] Reindeer Bonus Resource on the tile.';


		<Row Tag="TXT_KEY_IMPROVEMENT_CAMP_REINDEER">
			<Text>[COLOR_POSITIVE_TEXT](Polar)[ENDCOLOR] Camp</Text>
		</Row>
		<Row Tag="TXT_KEY_IMPROVEMENT_CAMP_REINDEER_HELP">
			<Text>The Camp action of [ICON_CULTURE_JFD_POLAR] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_POLAR_SHORT_DESC}[ENDCOLOR] Workers on Tundra or Snow tiles places the [ICON_RES_REINDEER] Reindeer Bonus Resource.</Text>
		</Row>
		<Row Tag="TXT_KEY_IMPROVEMENT_CAMP_REINDEER_TEXT">
			<Text>The Camp action of [ICON_CULTURE_JFD_POLAR] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_POLAR_SHORT_DESC}[ENDCOLOR] Workers on Tundra or Snow tiles places the [ICON_RES_REINDEER] Reindeer Bonus Resource.[NEWLINE][NEWLINE]The reindeer or caribou is a species of deer with circumpolar distribution, native to Arctic, subarctic, tundra, boreal, and mountainous regions of Northern Europe, Siberia, and North America. Reindeer occur in both migratory and sedentary populations, and their herd sizes vary greatly in different regions. The tundra subspecies are adapted for extreme cold, and some are adapted for long-distance migration. They are unique among deer (Cervidae) in that females may have antlers. Reindeer are the only successfully semi-domesticated deer on a large scale in the world. Both wild and domestic reindeer have been an important source of food, clothing, and shelter for Arctic people from prehistorical times. They are still herded and hunted today.</Text>
		</Row>
		<Row Tag="TXT_KEY_BUILD_CAMP_REINDEER">
			<Text>Construct a [LINK=IMPROVEMENT_CAMP_REINDEER]Camp[\LINK]</Text>
		</Row>
		<Row Tag="TXT_KEY_BUILD_CAMP_REINDEER_HELP">
			<Text>Unlocked at the discovery of Trapping.</Text>
		</Row>
		<Row Tag="TXT_KEY_BUILD_CAMP_REINDEER_REC">
			<Text>It will place a copy of [ICON_RES_REINDEER] Reindeer Bonus Resource, and increase the amount of [ICON_FOOD] Food, [ICON_PRODUCTION] Production, [ICON_Culture] Culture provided by this tile, and later [ICON_GOLD] Gold.</Text>
		</Row>


--==========================================================================================================================
-- BUILDS
--==========================================================================================================================
INSERT OR REPLACE INTO Builds		
	(Type,			PrereqTech,	ImprovementType, 	Description, 							Help, 	
	Recommendation, 	Time, 		EntityEvent, 		OrderPriority, 	IconIndex, 	IconAtlas, ShowInTechTree, ShowInPedia)
SELECT 	
	'BUILD_CAMP_REINDEER',	PrereqTech,	'IMPROVEMENT_CAMP_REINDEER', 	'TXT_KEY_BUILD_CAMP_REINDEER', 'TXT_KEY_BUILD_CAMP_REINDEER_HELP',	
	'TXT_KEY_BUILD_CAMP_REINDEER_REC',	Time, EntityEvent, 90,	61, 	'CD_ECONOMIC_ATLAS', 0, 0
FROM Builds WHERE Type = 'BUILD_CAMP';

INSERT INTO BuildFeatures 
	(BuildType, FeatureType, PrereqTech, Time, Production, Remove)
VALUES
	('BUILD_CAMP_REINDEER', 'FEATURE_FOREST', 'TECH_MINING', 400, 40, 1);

--=======================================================================================================================
-- IMPROVEMENT
--=======================================================================================================================
INSERT OR REPLACE INTO Improvements
		(Type,							Description,							Civilopedia, 								Help,										ArtDefineTag,	ImprovementResource, ImprovementResourceQuantity,PillageGold,	IconAtlas,			PortraitIndex)
SELECT	'IMPROVEMENT_CAMP_REINDEER',	'TXT_KEY_IMPROVEMENT_CAMP_REINDEER',	'TXT_KEY_IMPROVEMENT_CAMP_REINDEER_TEXT',	'TXT_KEY_IMPROVEMENT_CAMP_REINDEER_HELP',	ArtDefineTag,	'RESOURCE_REINDEER',	 1,						 PillageGold,	'CD_ECONOMIC_ATLAS',	60
FROM Improvements  WHERE Type = 'IMPROVEMENT_CAMP';
UPDATE Improvements SET NoTwoAdjacent=1 WHERE Type='IMPROVEMENT_CAMP_REINDEER';

INSERT OR REPLACE INTO Improvement_ValidTerrains 	
		(ImprovementType,				TerrainType)
SELECT	'IMPROVEMENT_CAMP_REINDEER', 	'TERRAIN_TUNDRA' UNION ALL
SELECT	'IMPROVEMENT_CAMP_REINDEER', 	'TERRAIN_SNOW';

INSERT OR REPLACE INTO Improvement_ResourceTypes
(ImprovementType,				ResourceType,			ResourceMakesValid, ResourceTrade,	DiscoveryRand,	QuantityRequirement) 
VALUES
('IMPROVEMENT_CAMP_REINDEER',	'RESOURCE_REINDEER',	1,					1,				0,				0);

INSERT OR REPLACE  INTO Improvement_ResourceType_Yields
(ImprovementType,				ResourceType,			YieldType,			Yield) VALUES
('IMPROVEMENT_CAMP_REINDEER',	'RESOURCE_REINDEER',	'YIELD_CULTURE',	1),
('IMPROVEMENT_CAMP_REINDEER',	'RESOURCE_REINDEER',	'YIELD_FOOD',		1);

INSERT OR REPLACE INTO Improvement_TechYieldChanges
		(ImprovementType,			TechType, YieldType, Yield)
SELECT 	'IMPROVEMENT_CAMP_REINDEER',TechType, YieldType, Yield
FROM Improvement_TechYieldChanges WHERE ImprovementType = 'IMPROVEMENT_CAMP';

INSERT OR REPLACE INTO Policy_ImprovementYieldChanges
		(PolicyType,	ImprovementType,			YieldType,	Yield)
SELECT	 PolicyType,	'IMPROVEMENT_CAMP_REINDEER',YieldType,	Yield
FROM Policy_ImprovementYieldChanges WHERE ImprovementType = 'IMPROVEMENT_CAMP';

INSERT OR REPLACE INTO Belief_ImprovementYieldChanges
		(BeliefType, 	ImprovementType, 			YieldType, Yield)
SELECT	 BeliefType,	'IMPROVEMENT_CAMP_REINDEER',YieldType, Yield
FROM Belief_ImprovementYieldChanges WHERE ImprovementType = 'IMPROVEMENT_CAMP';

INSERT OR REPLACE INTO Building_ImprovementYieldChanges
		(BuildingType, ImprovementType, 			YieldType, Yield)
SELECT	BuildingType, 'IMPROVEMENT_CAMP_REINDEER', 	YieldType, Yield
FROM Building_ImprovementYieldChangesGlobal WHERE ImprovementType='IMPROVEMENT_CAMP';

INSERT OR REPLACE INTO Building_ImprovementYieldChangesGlobal
		(BuildingType, ImprovementType, 			YieldType, Yield)
SELECT	BuildingType, 'IMPROVEMENT_CAMP_REINDEER', 	YieldType, Yield
FROM Building_ImprovementYieldChangesGlobal WHERE ImprovementType='IMPROVEMENT_CAMP';
--------------------------------------------
-- SQL TRIGGERS for strong compatibility
--------------------------------------------
CREATE TRIGGER Jar_Reindeer05
AFTER INSERT ON Improvement_TechYieldChanges WHEN (NEW.ImprovementType ='IMPROVEMENT_CAMP')
BEGIN
	INSERT OR REPLACE  INTO Improvement_TechYieldChanges
			(ImprovementType, 			TechType, YieldType, Yield)
	SELECT	'IMPROVEMENT_CAMP_REINDEER', NEW.TechType, NEW.YieldType, NEW.Yield;
END;

CREATE TRIGGER Jar_Reindeer06
AFTER INSERT ON Policy_ImprovementYieldChanges WHEN (NEW.ImprovementType ='IMPROVEMENT_CAMP')
BEGIN
	INSERT OR REPLACE  INTO Policy_ImprovementYieldChanges
			(ImprovementType, 			PolicyType, YieldType, Yield)
	SELECT	'IMPROVEMENT_CAMP_REINDEER', NEW.PolicyType, NEW.YieldType, NEW.Yield;
END;

CREATE TRIGGER Jar_Reindeer07
AFTER INSERT ON Belief_ImprovementYieldChanges WHEN (NEW.ImprovementType ='IMPROVEMENT_CAMP')
BEGIN
	INSERT OR REPLACE  INTO Belief_ImprovementYieldChanges
			(ImprovementType, 			BeliefType, YieldType, Yield)
	SELECT	'IMPROVEMENT_CAMP_REINDEER', NEW.BeliefType, NEW.YieldType, NEW.Yield;
END;

CREATE TRIGGER Jar_Reindeer08
AFTER INSERT ON Building_ImprovementYieldChanges WHEN (NEW.ImprovementType ='IMPROVEMENT_CAMP')
BEGIN
	INSERT OR REPLACE  INTO Building_ImprovementYieldChanges
			(ImprovementType, 			BuildingType, YieldType, Yield)
	SELECT	'IMPROVEMENT_CAMP_REINDEER', NEW.BuildingType, NEW.YieldType, NEW.Yield;
END;

CREATE TRIGGER Jar_Reindeer09
AFTER INSERT ON Building_ImprovementYieldChangesGlobal WHEN (NEW.ImprovementType ='IMPROVEMENT_CAMP')
BEGIN
	INSERT OR REPLACE  INTO Building_ImprovementYieldChangesGlobal
			(ImprovementType, 			BuildingType, YieldType, Yield)
	SELECT	'IMPROVEMENT_CAMP_REINDEER', NEW.BuildingType, NEW.YieldType, NEW.Yield;
END;
--=======================================================================================================================
--=======================================================================================================================
