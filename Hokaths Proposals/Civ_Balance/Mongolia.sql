--======================
-- Trait Changes 
--======================
DELETE FROM Trait_YieldFromMinorDemand WHERE TraitType = 'TRAIT_TERROR';

INSERT INTO Trait_ResourceYieldChanges
	(TraitType, ResourceType, YieldType, Yield)
VALUES	
	('TRAIT_TERROR', 'RESOURCE_HORSE', 'YIELD_FOOD', 1),
	('TRAIT_TERROR', 'RESOURCE_HORSE', 'YIELD_CULTURE', 1),	
	('TRAIT_TERROR', 'RESOURCE_HORSE', 'YIELD_GREAT_GENERAL_POINTS', 1),
	('TRAIT_TERROR', 'RESOURCE_HORSE', 'YIELD_CULTURE_LOCAL', 1);

INSERT INTO Trait_BuildingClassYieldChanges
	(TraitType, BuildingClassType, YieldType, YieldChange)
SELECT
	'TRAIT_TERROR', bc.Type, y.Type, 1
FROM BuildingClasses bc, Yields y
WHERE bc.Type IN ('BUILDINGCLASS_STABLE', 'BUILDINGCLASS_STOCKYARD') AND
y.Type IN ('YIELD_FOOD', 'YIELD_CULTURE', 'YIELD_GREAT_GENERAL_POINTS', 'YIELD_CULTURE_LOCAL');

--INSERT INTO Trait_FreeResourceFirstXCities
--	(TraitType, ResourceType, ResourceQuantity, NumCities)
--VALUES
--	('TRAIT_TERROR', 'RESOURCE_HORSE', 1, 99);
--Create a single [ICON_RES_HORSE] Horse Resource on the Tile when settling a City. 

--UPDATE Language_en_US
--SET Text = '+1 [ICON_WAR] Attack[NEWLINE]Gain [ICON_CULTURE] Culture [COLOR_POSITIVE_TEXT]on Promotion[ENDCOLOR].'
--WHERE Tag = 'TXT_KEY_PROMOTION_MONGOL_TERROR_HELP';

--Units generate [ICON_CULTURE] Culture [COLOR_POSITIVE_TEXT]on Promotion[ENDCOLOR]. 
--INSERT INTO Trait_YieldFromLevelUp
--	(TraitType, YieldType, Yield)
--VALUES
--	('TRAIT_TERROR', 'YIELD_CULTURE', 5);

UPDATE Language_en_US
SET Text = 'Skirmisher Units have an extra [ICON_WAR] Attack. +1 [ICON_FOOD] Food, [ICON_CULTURE] Culture, [ICON_CULTURE_LOCAL] Border Growth Point, and [ICON_GREAT_GENERAL] Great General Point from [ICON_RES_HORSE] Horse Resources, Stables, and Agribusinesses.'
WHERE Tag = 'TXT_KEY_TRAIT_TERROR';

UPDATE Language_en_US
SET Text = 'Khiimori'
WHERE Tag = 'TXT_KEY_TRAIT_TERROR_SHORT';

--==================
-- UB Changes
--==================

DELETE FROM Civilization_BuildingClassOverrides WHERE BuildingClassType = 'BUILDINGCLASS_LODGE' AND CivilizationType = 'CIVILIZATION_MONGOL';

INSERT INTO Civilization_BuildingClassOverrides 
	(CivilizationType, BuildingClassType, BuildingType)
VALUES	
	('CIVILIZATION_MONGOL', 'BUILDINGCLASS_MUSICIANS_GUILD', 'BUILDING_MONGOLIA_TUVAN');

INSERT INTO Buildings
	(Type,	Description,	Civilopedia,	Strategy, Help,	
	GoldMaintenance, 	Cost, HurryCostModifier, MinAreaSize, 	ConquestProb, 	BuildingClass, 	ArtDefineTag, 	PrereqTech, NeverCapture,
	PortraitIndex, 	IconAtlas, SpecialistType, GreatPeopleRateChange, NoUnhappfromXSpecialists, SpecialistCount)
SELECT	
	'BUILDING_MONGOLIA_TUVAN',	'TXT_KEY_BUILDING_MONGOLIA_TUVAN', 	'TXT_KEY_BUILDING_MONGOLIA_TUVAN_TEXT',	'TXT_KEY_BUILDING_MONGOLIA_TUVAN_STRATEGY',	'TXT_KEY_BUILDING_MONGOLIA_TUVAN_HELP',	
	GoldMaintenance, 	Cost, HurryCostModifier, MinAreaSize, 	ConquestProb, 	BuildingClass, 	ArtDefineTag, 	PrereqTech, NeverCapture, 
	18,	'CORP2_ATLAS', SpecialistType, GreatPeopleRateChange, NoUnhappfromXSpecialists, SpecialistCount
FROM Buildings WHERE Type = 'BUILDING_MUSICIANS_GUILD';

--INSERT INTO Building_YieldChanges
--	(BuildingType, YieldType, Yield)
--VALUES
--	('BUILDING_MONGOLIA_TUVAN', 'YIELD_FOOD', 1),
--	('BUILDING_MONGOLIA_TUVAN', 'YIELD_CULTURE', 1),
--	('BUILDING_MONGOLIA_TUVAN', 'YIELD_CULTURE_LOCAL', 1),
--	('BUILDING_MONGOLIA_TUVAN', 'YIELD_GREAT_GENERAL_POINTS', 1);

INSERT INTO Building_ImprovementYieldChanges
	(BuildingType, ImprovementType, YieldType, Yield)
VALUES
	('BUILDING_MONGOLIA_TUVAN', 'IMPROVEMENT_PASTURE', 'YIELD_FOOD', 2),
	('BUILDING_MONGOLIA_TUVAN', 'IMPROVEMENT_PASTURE', 'YIELD_CULTURE', 2),
	('BUILDING_MONGOLIA_TUVAN', 'IMPROVEMENT_PASTURE', 'YIELD_CULTURE_LOCAL', 2),
	('BUILDING_MONGOLIA_TUVAN', 'IMPROVEMENT_PASTURE', 'YIELD_GREAT_GENERAL_POINTS', 2);

INSERT INTO Building_TerrainYieldChanges
	(BuildingType, TerrainType, YieldType, Yield)
VALUES
	('BUILDING_MONGOLIA_TUVAN', 'TERRAIN_GRASS', 'YIELD_FOOD', 1),
	('BUILDING_MONGOLIA_TUVAN', 'TERRAIN_GRASS', 'YIELD_TOURISM', 1),
	('BUILDING_MONGOLIA_TUVAN', 'TERRAIN_PLAINS', 'YIELD_PRODUCTION', 1),
	('BUILDING_MONGOLIA_TUVAN', 'TERRAIN_PLAINS', 'YIELD_FAITH', 1);

INSERT INTO Building_YieldPerXTerrainTimes100
	(BuildingType, TerrainType, YieldType, Yield)
VALUES
	('BUILDING_MONGOLIA_TUVAN', 'TERRAIN_MOUNTAIN', 'YIELD_CULTURE', 300),
	('BUILDING_MONGOLIA_TUVAN', 'TERRAIN_MOUNTAIN', 'YIELD_TOURISM', 300),
	('BUILDING_MONGOLIA_TUVAN', 'TERRAIN_MOUNTAIN', 'YIELD_FAITH', 300);

INSERT INTO Building_SpecialistYieldChangesLocal
	(BuildingType, SpecialistType, YieldType, Yield)
VALUES
	('BUILDING_MONGOLIA_TUVAN', 'SPECIALIST_MUSICIAN', 'YIELD_FOOD', 2),
	('BUILDING_MONGOLIA_TUVAN', 'SPECIALIST_MUSICIAN', 'YIELD_CULTURE', 2),
	('BUILDING_MONGOLIA_TUVAN', 'SPECIALIST_MUSICIAN', 'YIELD_CULTURE_LOCAL', 2),
	('BUILDING_MONGOLIA_TUVAN', 'SPECIALIST_MUSICIAN', 'YIELD_GREAT_GENERAL_POINTS', 2);

INSERT INTO Language_en_US (Tag, Text)
VALUES	('TXT_KEY_BUILDING_MONGOLIA_TUVAN',			'Tuvan Ail'),
		('TXT_KEY_BUILDING_MONGOLIA_TUVAN_TEXT',		'Tuvan-Mongol throat singing, the main technique of which is known as khoomei is a style of singing practiced by people in Tuva and Mongolia. It is noted for including overtone singing. In 2009, it was included in the Representative List of the Intangible Cultural Heritage of Humanity of UNESCO. The open landscape of Tuva allows for the sounds to carry a great distance. Ethnomusicologists studying throat singing in these areas mark khoomei as an integral part in the ancient pastoral animism still practiced today.[NEWLINE][NEWLINE]Tuvan is most often performed outdoors, and often singers travel far into the countryside looking for the right river, or go up to the steppes of the mountainside to create the proper environment for throat singing. The most traditional and intimate venue is the "Ail",  an Turkic and Mongolic word meaning village, encampment, or family camp. In Tuvan and Kyrgyz contexts, it refers specifically to the cluster of yurts (gers) of a small nomadic community or extended family settlement on the steppe. Singing often happens inside a ger, especially during family gatherings, storytelling, or celebrations, where the acoustics of a felt-covered ger enhance the resonance of throat singing.'),
		('TXT_KEY_BUILDING_MONGOLIA_TUVAN_STRATEGY',	'Beyond the usual bonuses of the Musicians Guild, the Tuvan Ali generates additional bonuses which are amplified based on the location of the City. Mountains, abundant Plains or Grassland, and Pastures all lead to large bonuses including the lucrative yields of Culture, Faith, and Tourism. It has only limited instances in your Empire, so choose the Cities in which you build it carefully for maximum effect to play into your grand strategy!'),
		('TXT_KEY_BUILDING_MONGOLIA_TUVAN_HELP',		'+2 [ICON_FOOD] Food, [ICON_CULTURE] Culture, and [ICON_CULTURE_LOCAL] Border Growth Points, and [ICON_GREAT_GENERAL] Great General Points from [ICON_VP_MUSICIAN] Musicians and Pastures worked by the City. +3 [ICON_CULTURE] Culture, [ICON_PEACE] Faith, and [ICON_TOURISM] Tourism for every Mountain within the workable tiles.[NEWLINE][NEWLINE]Nearby Grassland: +1 [ICON_FOOD] Food and [ICON_TOURISM] Tourism.[NEWLINE]Nearby Plains: +1 [ICON_PRODUCTION] Production and [ICON_PEACE] Faith.[NEWLINE][NEWLINE]1 Specialist in this City no longer produces [ICON_HAPPINESS_3] Unhappiness from [ICON_URBANIZATION] Urbanization.[NEWLINE][NEWLINE]Maximum of 3 of these Buildings in your Empire.');

------------------------------------------------
--UPDATE Building_YieldChanges SET
--YieldType = 'YIELD_GOLD'
--WHERE BuildingType = 'BUILDING_YURT' AND Yield = 1;

--UPDATE Language_en_US
--SET Text = 'Unique MONGOLIA replacement for the {TXT_KEY_BUILDING_LODGE}. In addition to the {TXT_KEY_BUILDING_LODGE}''s bonuses, {TXT_KEY_BUILDING_YURT} generates [ICON_GOLD] Gold; boosts pastures; provides [ICON_PRODUCTION] Production when borders expand; and makes borders expand faster.'
--WHERE Tag = 'TXT_KEY_BUILDING_YURT_STRATEGY';

