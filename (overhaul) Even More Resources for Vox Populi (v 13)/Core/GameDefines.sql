--==========================================================================================================================	
-- CUSTOM MOD OPTIONS
--==========================================================================================================================	
-- CustomModOptions
------------------------------	
UPDATE CustomModOptions
SET Value = 1
WHERE Name = 'RESOURCES_PRODUCTION_COST_MODIFIERS';

/* Maize and Rice are now included in VP, so we won't need this anymore
UPDATE CustomModOptions
SET Value = 1
WHERE Name = 'EVENTS_TILE_IMPROVEMENTS';
*/

--==========================================================================================================================
-- RESOURCES
--==========================================================================================================================
---- Resources
----------------------------------------------------------------------------------------------------------------------------
-- City state luxuries
--- Define types
INSERT INTO Resources
		(Type, ResourceClassType)
VALUES	('RESOURCE_BEER', 'RESOURCECLASS_LUXURY'),
		('RESOURCE_BIRDS_NEST', 'RESOURCECLASS_LUXURY'),
		('RESOURCE_CHAMPAGNE', 'RESOURCECLASS_LUXURY'),
		('RESOURCE_CHEESE', 'RESOURCECLASS_LUXURY'),
		('RESOURCE_HONEY', 'RESOURCECLASS_LUXURY'),
		('RESOURCE_MANUSCRIPTS', 'RESOURCECLASS_LUXURY');

--- Shared settings
UPDATE Resources SET
	OnlyMinorCivs = 1,
	Happiness = 2,
	PlacementOrder = 3,
	ConstAppearance = 50,
	RandApp1 = 25,
	RandApp2 = 25,
	ResourceUsage = 2,
	AIObjective = 3,
	MinAreaSize = 1500,
	MaxLatitude = 90,
	Hills = 0,
	Flatlands = 1,
	Player = 67,
	IsMonopoly = 1
WHERE Type IN('RESOURCE_BEER', 'RESOURCE_BIRDS_NEST', 'RESOURCE_CHAMPAGNE', 'RESOURCE_CHEESE', 'RESOURCE_HONEY', 'RESOURCE_MANUSCRIPTS');

--- Beer
UPDATE Resources SET
	Description = 'TXT_KEY_RESOURCE_BEER',
	Civilopedia = 'TXT_KEY_CIV5_RESOURCE_BEER_TEXT',
	Help = 'TXT_KEY_RESOURCE_BEER_HELP',
	ArtDefineTag = 'ART_DEF_RESOURCE_BEER',
	IconString = '[ICON_RES_BEER]',
	PortraitIndex = 0,
	IconAtlas = 'EVEN_MORE_RESOURCES_ATLAS_A',
	MonopolyHappiness = 6
WHERE Type = 'RESOURCE_BEER';

--- Bird's nest
UPDATE Resources SET
	Description = 'TXT_KEY_RESOURCE_BIRDS_NEST',
	Civilopedia = 'TXT_KEY_CIV5_RESOURCE_BIRDS_NEST_TEXT',
	Help = 'TXT_KEY_RESOURCE_BIRDS_NEST_HELP',
	ArtDefineTag = 'ART_DEF_RESOURCE_BIRDS_NEST',
	IconString = '[ICON_RES_BIRDS_NEST]',
	PortraitIndex = 4,
	IconAtlas = 'EVEN_MORE_RESOURCES_ATLAS_A'
WHERE Type = 'RESOURCE_BIRDS_NEST';

--- Champagne
UPDATE Resources SET
	Description = 'TXT_KEY_RESOURCE_CHAMPAGNE',
	Civilopedia = 'TXT_KEY_CIV5_RESOURCE_CHAMPAGNE_TEXT',
	Help = 'TXT_KEY_RESOURCE_CHAMPAGNE_HELP',
	ArtDefineTag = 'ART_DEF_RESOURCE_CHAMPAGNE',
	IconString = '[ICON_RES_CHAMPAGNE]',
	PortraitIndex = 2,
	IconAtlas = 'EVEN_MORE_RESOURCES_ATLAS_A'
WHERE Type = 'RESOURCE_CHAMPAGNE';

--- Cheese
UPDATE Resources SET
	Description = 'TXT_KEY_RESOURCE_CHEESE',
	Civilopedia = 'TXT_KEY_CIV5_RESOURCE_CHEESE_TEXT',
	Help = 'TXT_KEY_RESOURCE_CHEESE_HELP',
	ArtDefineTag = 'ART_DEF_RESOURCE_CHEESE',
	IconString = '[ICON_RES_CHEESE]',
	PortraitIndex = 3,
	IconAtlas = 'EVEN_MORE_RESOURCES_ATLAS_A'
WHERE Type = 'RESOURCE_CHEESE';

--- Honey
UPDATE Resources SET
	Description = 'TXT_KEY_RESOURCE_HONEY',
	Civilopedia = 'TXT_KEY_CIV5_RESOURCE_HONEY_TEXT',
	Help = 'TXT_KEY_RESOURCE_HONEY_HELP',
	ArtDefineTag = 'ART_DEF_RESOURCE_HONEY',
	IconString = '[ICON_RES_HONEY]',
	PortraitIndex = 1,
	IconAtlas = 'EVEN_MORE_RESOURCES_ATLAS_A'
WHERE Type = 'RESOURCE_HONEY';

--- Manuscripts
UPDATE Resources SET
	Description = 'TXT_KEY_RESOURCE_MANUSCRIPTS',
	Civilopedia = 'TXT_KEY_CIV5_RESOURCE_MANUSCRIPTS_TEXT',
	Help = 'TXT_KEY_RESOURCE_MANUSCRIPTS_HELP',
	ArtDefineTag = 'ART_DEF_RESOURCE_MANUSCRIPTS',
	IconString = '[ICON_RES_MANUSCRIPTS]',
	PortraitIndex = 2,
	IconAtlas = 'EXPANSION_SCEN_TECH_ATLAS'
WHERE Type = 'RESOURCE_MANUSCRIPTS';

-- Luxuries
--- Define types
INSERT INTO Resources
		(Type, ResourceClassType)
VALUES	('RESOURCE_LAVENDER', 'RESOURCECLASS_LUXURY'),
		('RESOURCE_OBSIDIAN', 'RESOURCECLASS_LUXURY'),
		('RESOURCE_PLATINUM', 'RESOURCECLASS_LUXURY'),
		('RESOURCE_POPPY', 'RESOURCECLASS_LUXURY'),
		('RESOURCE_TIN', 'RESOURCECLASS_LUXURY');

--- Shared settings
UPDATE Resources SET
	Happiness = 2,
	PlacementOrder = 4,
	ConstAppearance = 50,
	RandApp1 = 25,
	RandApp2 = 25,
	ResourceUsage = 2,
	MinAreaSize = 3,
	MaxLatitude = 90,
	Player = 67,
	IsMonopoly = 1
WHERE Type IN('RESOURCE_LAVENDER', 'RESOURCE_OBSIDIAN', 'RESOURCE_PLATINUM', 'RESOURCE_POPPY', 'RESOURCE_TIN');

--- Lavender
UPDATE Resources SET
	Description = 'TXT_KEY_RESOURCE_LAVENDER',
	Civilopedia = 'TXT_KEY_CIV5_RESOURCE_LAVENDER_TEXT',
	Help = 'TXT_KEY_RESOURCE_LAVENDER_HELP',
	ArtDefineTag = 'ART_DEF_RESOURCE_LAVENDER',
	IconString = '[ICON_RES_LAVENDER]',
	PortraitIndex = 2,
	IconAtlas = 'EVEN_MORE_RESOURCES_ATLAS_B',
	Hills = 1,
	Flatlands = 1,
	TechCityTrade = 'TECH_CALENDAR'
WHERE Type = 'RESOURCE_LAVENDER';

--- Obsidian
UPDATE Resources SET
	Description = 'TXT_KEY_RESOURCE_OBSIDIAN',
	Civilopedia = 'TXT_KEY_CIV5_RESOURCE_OBSIDIAN_TEXT',
	Help = 'TXT_KEY_RESOURCE_OBSIDIAN_HELP',
	ArtDefineTag = 'ART_DEF_RESOURCE_OBSIDIAN',
	IconString = '[ICON_RES_OBSIDIAN]',
	PortraitIndex = 0,
	IconAtlas = 'EVEN_MORE_RESOURCES_ATLAS_B',
	Hills = 1,
	Flatlands = 1,
	TechCityTrade = 'TECH_MASONRY'--,
	--MonopolyAttackBonus = 10 -- Hardcoded to work with strategic monopolies on strategic resources only, we'll need lua or a new table
WHERE Type = 'RESOURCE_OBSIDIAN';

--- Platinum
UPDATE Resources SET
	Description = 'TXT_KEY_RESOURCE_PLATINUM',
	Civilopedia = 'TXT_KEY_CIV5_RESOURCE_PLATINUM_TEXT',
	Help = 'TXT_KEY_RESOURCE_PLATINUM_HELP',
	ArtDefineTag = 'ART_DEF_RESOURCE_PLATINUM',
	ArtDefineTagHeavy = 'ART_DEF_RESOURCE_PLATINUM_HEAVY',
	IconString = '[ICON_RES_PLATINUM]',
	PortraitIndex = 7,
	IconAtlas = 'EVEN_MORE_RESOURCES_ATLAS_A',
	Hills = 1,
	Flatlands = 1,
	TechCityTrade = 'TECH_MINING'
WHERE Type = 'RESOURCE_PLATINUM';

--- Poppy
UPDATE Resources SET
	Description = 'TXT_KEY_RESOURCE_POPPY',
	Civilopedia = 'TXT_KEY_CIV5_RESOURCE_POPPY_TEXT',
	Help = 'TXT_KEY_RESOURCE_POPPY_HELP',
	ArtDefineTag = 'ART_DEF_RESOURCE_POPPY',
	IconString = '[ICON_RES_POPPY]',
	PortraitIndex = 1,
	IconAtlas = 'EVEN_MORE_RESOURCES_ATLAS_B',
	TechCityTrade = 'TECH_CALENDAR',
	Hills = 1,
	Flatlands = 1--,
	--MonopolyHappiness = 6 -- Now gives great person rate
WHERE Type = 'RESOURCE_POPPY';

--- Tin
UPDATE Resources SET
	Description = 'TXT_KEY_RESOURCE_TIN',
	Civilopedia = 'TXT_KEY_CIV5_RESOURCE_TIN_TEXT',
	Help = 'TXT_KEY_RESOURCE_TIN_HELP',
	ArtDefineTag = 'ART_DEF_RESOURCE_TIN',
	IconString = '[ICON_RES_TIN]',
	PortraitIndex = 9,
	IconAtlas = 'EVEN_MORE_RESOURCES_ATLAS_A',
	Hills = 1,
	Flatlands = 1,
	TechCityTrade = 'TECH_MINING'
WHERE Type = 'RESOURCE_TIN';

-- Bonus
--- Define types
INSERT INTO Resources
		(Type, ResourceClassType)
VALUES	('RESOURCE_COCONUT', 'RESOURCECLASS_BONUS'),
		('RESOURCE_HARDWOOD', 'RESOURCECLASS_BONUS'),
		('RESOURCE_LEAD', 'RESOURCECLASS_BONUS'),
		('RESOURCE_PINEAPPLE', 'RESOURCECLASS_BONUS'),
		('RESOURCE_POTATO', 'RESOURCECLASS_BONUS'),
		('RESOURCE_RUBBER', 'RESOURCECLASS_BONUS'),
		('RESOURCE_SULFUR', 'RESOURCECLASS_BONUS'),
		('RESOURCE_TITANIUM', 'RESOURCECLASS_BONUS');

--- Shared settings
UPDATE Resources SET
	PlacementOrder = 4,
	ConstAppearance = 50,
	RandApp1 = 25,
	RandApp2 = 25,
	MinAreaSize = 3,
	MaxLatitude = 90,
	IsMonopoly = 0
WHERE Type IN('RESOURCE_COCONUT', 'RESOURCE_HARDWOOD', 'RESOURCE_LEAD', 'RESOURCE_PINEAPPLE', 'RESOURCE_POTATO', 'RESOURCE_RUBBER', 'RESOURCE_SULFUR', 'RESOURCE_TITANIUM');

--- Coconut
UPDATE Resources SET
	Description = 'TXT_KEY_RESOURCE_COCONUT',
	Civilopedia = 'TXT_KEY_CIV5_RESOURCE_COCONUT_TEXT',
	--Help = 'TXT_KEY_RESOURCE_COCONUT_HELP',
	ArtDefineTag = 'ART_DEF_RESOURCE_COCONUT',
	IconString = '[ICON_RES_COCONUT]',
	PortraitIndex = 13,
	IconAtlas = 'EVEN_MORE_RESOURCES_ATLAS_A',
	Hills = 0,
	Flatlands = 1,
	TechReveal = 'TECH_AGRICULTURE',
	TechCityTrade = 'TECH_CALENDAR'
WHERE Type = 'RESOURCE_COCONUT';

--- Hardwood
UPDATE Resources SET
	Description = 'TXT_KEY_RESOURCE_HARDWOOD',
	Civilopedia = 'TXT_KEY_CIV5_RESOURCE_HARDWOOD_TEXT',
	Help = 'TXT_KEY_RESOURCE_HARDWOOD_HELP',
	ArtDefineTag = 'ART_DEF_RESOURCE_HARDWOOD',
	IconString = '[ICON_RES_HARDWOOD]',
	PortraitIndex = 3,
	IconAtlas = 'EVEN_MORE_RESOURCES_ATLAS_B',
	Hills = 1,
	Flatlands = 1,
	TechReveal = 'TECH_MINING',
	TechCityTrade = 'TECH_METAL_CASTING'
WHERE Type = 'RESOURCE_HARDWOOD';

--- Lead
UPDATE Resources SET
	Description = 'TXT_KEY_RESOURCE_LEAD',
	Civilopedia = 'TXT_KEY_CIV5_RESOURCE_LEAD_TEXT',
	Help = 'TXT_KEY_RESOURCE_LEAD_HELP',
	ArtDefineTag = 'ART_DEF_RESOURCE_LEAD',
	--ArtDefineTagHeavy = 'ART_DEF_RESOURCE_LEAD_HEAVY',
	IconString = '[ICON_RES_LEAD]',
	PortraitIndex = 5,
	IconAtlas = 'EVEN_MORE_RESOURCES_ATLAS_A',
	Hills = 1,
	Flatlands = 1,
	TechReveal = 'TECH_MINING',
	TechCityTrade = 'TECH_MINING'
WHERE Type = 'RESOURCE_LEAD';

--- Pineapple
UPDATE Resources SET
	Description = 'TXT_KEY_RESOURCE_PINEAPPLE',
	Civilopedia = 'TXT_KEY_CIV5_RESOURCE_PINEAPPLE_TEXT',
	--Help = 'TXT_KEY_RESOURCE_PINEAPPLE_HELP',
	ArtDefineTag = 'ART_DEF_RESOURCE_PINEAPPLE',
	IconString = '[ICON_RES_PINEAPPLE]',
	PortraitIndex = 15,
	IconAtlas = 'EVEN_MORE_RESOURCES_ATLAS_A',
	Hills = 1,
	Flatlands = 1,
	TechReveal = 'TECH_AGRICULTURE',
	TechCityTrade = 'TECH_CALENDAR'
WHERE Type = 'RESOURCE_PINEAPPLE';

--- Potato
UPDATE Resources SET
	Description = 'TXT_KEY_RESOURCE_POTATO',
	Civilopedia = 'TXT_KEY_CIV5_RESOURCE_POTATO_TEXT',
	--Help = 'TXT_KEY_RESOURCE_POTATO_HELP',
	ArtDefineTag = 'ART_DEF_RESOURCE_POTATO',
	IconString = '[ICON_RES_POTATO]',
	PortraitIndex = 10,
	IconAtlas = 'EVEN_MORE_RESOURCES_ATLAS_A',
	Hills = 1,
	Flatlands = 1,
	TechReveal = 'TECH_AGRICULTURE',
	TechCityTrade = 'TECH_CALENDAR'
WHERE Type = 'RESOURCE_POTATO';

--- Rubber
UPDATE Resources SET
	Description = 'TXT_KEY_RESOURCE_RUBBER',
	Civilopedia = 'TXT_KEY_CIV5_RESOURCE_RUBBER_TEXT',
	Help = 'TXT_KEY_RESOURCE_RUBBER_HELP',
	ArtDefineTag = 'ART_DEF_RESOURCE_RUBBER',
	IconString = '[ICON_RES_RUBBER]',
	PortraitIndex = 14,
	IconAtlas = 'EVEN_MORE_RESOURCES_ATLAS_A',
	Hills = 1,
	Flatlands = 1,
	TechReveal = 'TECH_CHEMISTRY',
	TechCityTrade = 'TECH_CHEMISTRY'
WHERE Type = 'RESOURCE_RUBBER';

--- Sulfur
UPDATE Resources SET
	Description = 'TXT_KEY_RESOURCE_SULFUR',
	Civilopedia = 'TXT_KEY_CIV5_RESOURCE_SULFUR_TEXT',
	Help = 'TXT_KEY_RESOURCE_SULFUR_HELP',
	ArtDefineTag = 'ART_DEF_RESOURCE_SULFUR',
	IconString = '[ICON_RES_SULFUR]',
	PortraitIndex = 8,
	IconAtlas = 'EVEN_MORE_RESOURCES_ATLAS_A',
	Hills = 1,
	Flatlands = 1,
	TechReveal = 'TECH_THE_WHEEL',
	TechCityTrade = 'TECH_MASONRY'
WHERE Type = 'RESOURCE_SULFUR';

--- Titanium
UPDATE Resources SET
	Description = 'TXT_KEY_RESOURCE_TITANIUM',
	Civilopedia = 'TXT_KEY_CIV5_RESOURCE_TITANIUM_TEXT',
	Help = 'TXT_KEY_RESOURCE_TITANIUM_HELP',
	ArtDefineTag = 'ART_DEF_RESOURCE_TITANIUM',
	AltArtDefineTag = 'ART_DEF_RESOURCE_TITANIUM_MARSH',
	ArtDefineTagHeavy = 'ART_DEF_RESOURCE_TITANIUM_HEAVY',
	AltArtDefineTagHeavy = 'ART_DEF_RESOURCE_TITANIUM_HEAVY_MARSH',
	IconString = '[ICON_RES_TITANIUM]',
	PortraitIndex = 6,
	IconAtlas = 'EVEN_MORE_RESOURCES_ATLAS_A',
	Hills = 1,
	Flatlands = 1,
	TechReveal = 'TECH_PLASTIC',
	TechCityTrade = 'TECH_PLASTIC'
WHERE Type = 'RESOURCE_TITANIUM';

UPDATE Resources SET LandResource=1 WHERE IconAtlas IN ('EVEN_MORE_RESOURCES_ATLAS_A','EVEN_MORE_RESOURCES_ATLAS_B');
UPDATE Resources SET AnimalResource=1 WHERE Type IN ('RESOURCE_BIRDS_NEST','RESOURCE_CHEESE','RESOURCE_HONEY');
UPDATE Resources SET PlantResource=1 WHERE Type IN ('RESOURCE_BEER','RESOURCE_CHAMPAGNE','RESOURCE_LAVENDER','RESOURCE_POPPY', 'RESOURCE_COCONUT','RESOURCE_HARDWOOD','RESOURCE_PINEAPPLE','RESOURCE_POTATO','RESOURCE_RUBBER');
UPDATE Resources SET RockResource=1 WHERE Type IN ('RESOURCE_OBSIDIAN','RESOURCE_PLATINUM','RESOURCE_TIN','RESOURCE_LEAD','RESOURCE_SULFUR','RESOURCE_TITANIUM');
--------------------------------------------------------------------------------------------------------------------------
---- Resource_YieldChanges
--------------------------------------------------------------------------------------------------------------------------
-- City state luxuries
--- Change existing resources
DELETE FROM Resource_YieldChanges WHERE ResourceType IN('RESOURCE_GLASS', 'RESOURCE_JEWELRY', 'RESOURCE_PORCELAIN');

INSERT INTO Resource_YieldChanges
		(ResourceType, YieldType, Yield)
VALUES	('RESOURCE_GLASS', 'YIELD_GOLD', 1),
		('RESOURCE_GLASS', 'YIELD_SCIENCE', 1),
		('RESOURCE_JEWELRY', 'YIELD_GOLD', 1),
		('RESOURCE_JEWELRY', 'YIELD_CULTURE', 1),
		('RESOURCE_PORCELAIN', 'YIELD_GOLD', 1),
		('RESOURCE_PORCELAIN', 'YIELD_PRODUCTION', 1);

--- New resources
INSERT INTO Resource_YieldChanges
		(ResourceType, YieldType, Yield)
VALUES	('RESOURCE_BEER', 'YIELD_CULTURE', 1),
		('RESOURCE_BIRDS_NEST', 'YIELD_GOLD', 2),
		('RESOURCE_CHAMPAGNE', 'YIELD_GOLD', 1),
		('RESOURCE_CHAMPAGNE', 'YIELD_CULTURE', 1),
		('RESOURCE_CHEESE', 'YIELD_FOOD', 1),
		('RESOURCE_CHEESE', 'YIELD_CULTURE', 1),
		('RESOURCE_HONEY', 'YIELD_FOOD', 1),
		('RESOURCE_HONEY', 'YIELD_GOLD', 1),
		('RESOURCE_MANUSCRIPTS', 'YIELD_CULTURE', 1),
		('RESOURCE_MANUSCRIPTS', 'YIELD_FAITH', 1);

-- Luxuries
INSERT INTO Resource_YieldChanges
		(ResourceType, YieldType, Yield)
VALUES	('RESOURCE_LAVENDER', 'YIELD_CULTURE', 1),
		('RESOURCE_OBSIDIAN', 'YIELD_PRODUCTION', 1),
		('RESOURCE_PLATINUM', 'YIELD_GOLD', 1),
		('RESOURCE_POPPY', 'YIELD_GOLD', 1),
		('RESOURCE_TIN', 'YIELD_GOLD', 1);
		
-- Bonus
INSERT INTO Resource_YieldChanges
		(ResourceType, YieldType, Yield)
VALUES	('RESOURCE_COCONUT', 'YIELD_FOOD', 1),
		('RESOURCE_HARDWOOD', 'YIELD_GOLD', 1),
		('RESOURCE_LEAD', 'YIELD_PRODUCTION', 1),
		('RESOURCE_PINEAPPLE', 'YIELD_GOLD', 1),
		('RESOURCE_POTATO', 'YIELD_FOOD', 1),
		('RESOURCE_RUBBER', 'YIELD_PRODUCTION', 1),
		('RESOURCE_RUBBER', 'YIELD_GOLD', 2),
		('RESOURCE_SULFUR', 'YIELD_PRODUCTION', 1),
		('RESOURCE_TITANIUM', 'YIELD_PRODUCTION', 1),
		('RESOURCE_TITANIUM', 'YIELD_SCIENCE', 1);
--------------------------------------------------------------------------------------------------------------------------
---- Resource_Flavors
--------------------------------------------------------------------------------------------------------------------------
-- City state luxuries
INSERT INTO Resource_Flavors 	
		(ResourceType, FlavorType, Flavor)
SELECT	Type, 'FLAVOR_HAPPINESS', 10
FROM Resources WHERE Type IN ('RESOURCE_BEER', 'RESOURCE_BIRDS_NEST', 'RESOURCE_CHAMPAGNE', 'RESOURCE_HONEY', 'RESOURCE_MANUSCRIPTS');

-- Luxuries
INSERT INTO Resource_Flavors 	
		(ResourceType, FlavorType, Flavor)
SELECT	Type, 'FLAVOR_HAPPINESS', 10
FROM Resources WHERE Type IN ('RESOURCE_LAVENDER', 'RESOURCE_OBSIDIAN', 'RESOURCE_PLATINUM', 'RESOURCE_POPPY', 'RESOURCE_TIN');

-- Bonus
INSERT INTO Resource_Flavors
		(ResourceType, FlavorType, Flavor)
VALUES	('RESOURCE_COCONUT', 'FLAVOR_GROWTH', 4),
		('RESOURCE_COCONUT', 'FLAVOR_PRODUCTION', 6),
		('RESOURCE_HARDWOOD', 'FLAVOR_PRODUCTION', 9),
		('RESOURCE_HARDWOOD', 'FLAVOR_GOLD', 1),
		('RESOURCE_LEAD', 'FLAVOR_PRODUCTION', 10),
		('RESOURCE_PINEAPPLE', 'FLAVOR_GROWTH', 3),
		('RESOURCE_PINEAPPLE', 'FLAVOR_GOLD', 7),
		('RESOURCE_POTATO', 'FLAVOR_GROWTH', 10),
		('RESOURCE_RUBBER', 'FLAVOR_PRODUCTION', 4),
		('RESOURCE_RUBBER', 'FLAVOR_GOLD', 6),
		('RESOURCE_SULFUR', 'FLAVOR_PRODUCTION', 10),
		('RESOURCE_TITANIUM', 'FLAVOR_PRODUCTION', 5),
		('RESOURCE_TITANIUM', 'FLAVOR_SCIENCE', 5);
--------------------------------------------------------------------------------------------------------------------------
---- Resource_FeatureBooleans
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Resource_FeatureBooleans
		(ResourceType, FeatureType)
VALUES
-- Luxuries
		('RESOURCE_LAVENDER', 'FEATURE_FOREST'),
		('RESOURCE_OBSIDIAN', 'FEATURE_FOREST'),
		('RESOURCE_OBSIDIAN', 'FEATURE_JUNGLE'),
		('RESOURCE_OBSIDIAN', 'FEATURE_MARSH'),
		('RESOURCE_PLATINUM', 'FEATURE_FOREST'),
		('RESOURCE_PLATINUM', 'FEATURE_JUNGLE'),
		('RESOURCE_PLATINUM', 'FEATURE_MARSH'),
		('RESOURCE_POPPY', 'FEATURE_FOREST'),
		('RESOURCE_POPPY', 'FEATURE_FLOOD_PLAINS'),
		('RESOURCE_TIN', 'FEATURE_FOREST'),
		('RESOURCE_TIN', 'FEATURE_JUNGLE'),
		('RESOURCE_TIN', 'FEATURE_MARSH'),
-- Bonus
		('RESOURCE_COCONUT', 'FEATURE_JUNGLE'),
		('RESOURCE_HARDWOOD', 'FEATURE_FOREST'),
		('RESOURCE_HARDWOOD', 'FEATURE_JUNGLE'),
		('RESOURCE_LEAD', 'FEATURE_FOREST'),
		('RESOURCE_LEAD', 'FEATURE_JUNGLE'),
		('RESOURCE_LEAD', 'FEATURE_MARSH'),
		('RESOURCE_RUBBER', 'FEATURE_JUNGLE'),
		('RESOURCE_SULFUR', 'FEATURE_FOREST'),
		('RESOURCE_SULFUR', 'FEATURE_JUNGLE'),
		('RESOURCE_TITANIUM', 'FEATURE_FOREST'),
		('RESOURCE_TITANIUM', 'FEATURE_JUNGLE'),
		('RESOURCE_TITANIUM', 'FEATURE_MARSH');
--------------------------------------------------------------------------------------------------------------------------
---- Resource_FeatureTerrainBooleans
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Resource_FeatureTerrainBooleans
		(ResourceType, TerrainType)
VALUES
-- Luxuries
		('RESOURCE_LAVENDER', 'TERRAIN_GRASS'),
		('RESOURCE_LAVENDER', 'TERRAIN_PLAINS'),
		('RESOURCE_OBSIDIAN', 'TERRAIN_GRASS'),
		('RESOURCE_OBSIDIAN', 'TERRAIN_PLAINS'),
		('RESOURCE_OBSIDIAN', 'TERRAIN_DESERT'),
		('RESOURCE_OBSIDIAN', 'TERRAIN_TUNDRA'),
		('RESOURCE_OBSIDIAN', 'TERRAIN_SNOW'),
		('RESOURCE_PLATINUM', 'TERRAIN_GRASS'),
		('RESOURCE_PLATINUM', 'TERRAIN_PLAINS'),
		('RESOURCE_PLATINUM', 'TERRAIN_DESERT'),
		('RESOURCE_PLATINUM', 'TERRAIN_TUNDRA'),
		('RESOURCE_PLATINUM', 'TERRAIN_SNOW'),
		('RESOURCE_POPPY', 'TERRAIN_GRASS'),
		('RESOURCE_POPPY', 'TERRAIN_PLAINS'),
		('RESOURCE_TIN', 'TERRAIN_GRASS'),
		('RESOURCE_TIN', 'TERRAIN_PLAINS'),
		('RESOURCE_TIN', 'TERRAIN_DESERT'),
		('RESOURCE_TIN', 'TERRAIN_TUNDRA'),
		('RESOURCE_TIN', 'TERRAIN_SNOW'),
-- Bonus
		('RESOURCE_COCONUT', 'TERRAIN_GRASS'),
		('RESOURCE_COCONUT', 'TERRAIN_PLAINS'),
		('RESOURCE_COCONUT', 'TERRAIN_DESERT'),
		('RESOURCE_HARDWOOD', 'TERRAIN_GRASS'),
		('RESOURCE_HARDWOOD', 'TERRAIN_PLAINS'),
		('RESOURCE_HARDWOOD', 'TERRAIN_TUNDRA'),
		('RESOURCE_LEAD', 'TERRAIN_GRASS'),
		('RESOURCE_LEAD', 'TERRAIN_PLAINS'),
		('RESOURCE_LEAD', 'TERRAIN_DESERT'),
		('RESOURCE_LEAD', 'TERRAIN_TUNDRA'),
		('RESOURCE_LEAD', 'TERRAIN_SNOW'),
		('RESOURCE_RUBBER', 'TERRAIN_GRASS'),
		('RESOURCE_RUBBER', 'TERRAIN_PLAINS'),
		('RESOURCE_SULFUR', 'TERRAIN_GRASS'),
		('RESOURCE_SULFUR', 'TERRAIN_PLAINS'),
		('RESOURCE_SULFUR', 'TERRAIN_DESERT'),
		('RESOURCE_SULFUR', 'TERRAIN_TUNDRA'),
		('RESOURCE_SULFUR', 'TERRAIN_SNOW'),
		('RESOURCE_TITANIUM', 'TERRAIN_GRASS'),
		('RESOURCE_TITANIUM', 'TERRAIN_PLAINS'),
		('RESOURCE_TITANIUM', 'TERRAIN_DESERT'),
		('RESOURCE_TITANIUM', 'TERRAIN_TUNDRA'),
		('RESOURCE_TITANIUM', 'TERRAIN_SNOW');
--------------------------------------------------------------------------------------------------------------------------
---- Resource_FeatureTerrainBooleans
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Resource_TerrainBooleans
		(ResourceType, TerrainType)
VALUES
-- Luxuries
		('RESOURCE_LAVENDER', 'TERRAIN_GRASS'),
		('RESOURCE_LAVENDER', 'TERRAIN_PLAINS'),
		('RESOURCE_OBSIDIAN', 'TERRAIN_GRASS'),
		('RESOURCE_OBSIDIAN', 'TERRAIN_PLAINS'),
		('RESOURCE_OBSIDIAN', 'TERRAIN_DESERT'),
		('RESOURCE_OBSIDIAN', 'TERRAIN_TUNDRA'),
		('RESOURCE_OBSIDIAN', 'TERRAIN_SNOW'),
		('RESOURCE_PLATINUM', 'TERRAIN_GRASS'),
		('RESOURCE_PLATINUM', 'TERRAIN_PLAINS'),
		('RESOURCE_PLATINUM', 'TERRAIN_DESERT'),
		('RESOURCE_PLATINUM', 'TERRAIN_TUNDRA'),
		('RESOURCE_PLATINUM', 'TERRAIN_SNOW'),
		('RESOURCE_POPPY', 'TERRAIN_GRASS'),
		('RESOURCE_POPPY', 'TERRAIN_PLAINS'),
		('RESOURCE_TIN', 'TERRAIN_GRASS'),
		('RESOURCE_TIN', 'TERRAIN_PLAINS'),
		('RESOURCE_TIN', 'TERRAIN_DESERT'),
		('RESOURCE_TIN', 'TERRAIN_TUNDRA'),
		('RESOURCE_TIN', 'TERRAIN_SNOW'),
-- Bonus
		('RESOURCE_COCONUT', 'TERRAIN_GRASS'),
		('RESOURCE_COCONUT', 'TERRAIN_PLAINS'),
		('RESOURCE_COCONUT', 'TERRAIN_DESERT'),
		('RESOURCE_HARDWOOD', 'TERRAIN_GRASS'),
		('RESOURCE_HARDWOOD', 'TERRAIN_PLAINS'),
		('RESOURCE_HARDWOOD', 'TERRAIN_TUNDRA'),
		('RESOURCE_LEAD', 'TERRAIN_GRASS'),
		('RESOURCE_LEAD', 'TERRAIN_PLAINS'),
		('RESOURCE_LEAD', 'TERRAIN_DESERT'),
		('RESOURCE_LEAD', 'TERRAIN_TUNDRA'),
		('RESOURCE_LEAD', 'TERRAIN_SNOW'),
		('RESOURCE_RUBBER', 'TERRAIN_GRASS'),
		('RESOURCE_RUBBER', 'TERRAIN_PLAINS'),
		('RESOURCE_SULFUR', 'TERRAIN_GRASS'),
		('RESOURCE_SULFUR', 'TERRAIN_PLAINS'),
		('RESOURCE_SULFUR', 'TERRAIN_DESERT'),
		('RESOURCE_SULFUR', 'TERRAIN_TUNDRA'),
		('RESOURCE_SULFUR', 'TERRAIN_SNOW'),
		('RESOURCE_TITANIUM', 'TERRAIN_GRASS'),
		('RESOURCE_TITANIUM', 'TERRAIN_PLAINS'),
		('RESOURCE_TITANIUM', 'TERRAIN_DESERT'),
		('RESOURCE_TITANIUM', 'TERRAIN_TUNDRA'),
		('RESOURCE_TITANIUM', 'TERRAIN_SNOW');
--------------------------------------------------------------------------------------------------------------------------
---- Resource_CityYieldModFromMonopoly
--------------------------------------------------------------------------------------------------------------------------
-- City state luxuries
INSERT INTO Resource_CityYieldModFromMonopoly
		(ResourceType, YieldType, Yield)
VALUES	('RESOURCE_BIRDS_NEST', 'YIELD_GOLD', 10),
		('RESOURCE_CHAMPAGNE', 'YIELD_CULTURE', 10),
		('RESOURCE_CHEESE', 'YIELD_CULTURE', 10),
		('RESOURCE_HONEY', 'YIELD_FOOD', 10),
		('RESOURCE_MANUSCRIPTS', 'YIELD_FAITH', 20);

-- Luxuries
INSERT INTO Resource_CityYieldModFromMonopoly
		(ResourceType, YieldType, Yield)
VALUES	('RESOURCE_LAVENDER', 'YIELD_CULTURE', 10),
		('RESOURCE_PLATINUM', 'YIELD_SCIENCE', 10);
--------------------------------------------------------------------------------------------------------------------------
---- Resource_YieldChangeFromMonopoly
--------------------------------------------------------------------------------------------------------------------------
-- Luxuries
INSERT INTO Resource_YieldChangeFromMonopoly
		(ResourceType, YieldType, Yield)
VALUES	('RESOURCE_TIN', 'YIELD_GOLD', 3);
--------------------------------------------------------------------------------------------------------------------------
---- Resource_MonopolyCombatModifiers
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Resource_MonopolyCombatModifiers
		(ResourceType, IsGlobalMonopoly, IsStrategicMonopoly, Attack, Defense)
VALUES	('RESOURCE_OBSIDIAN', 1, 0, 10, 0);
--------------------------------------------------------------------------------------------------------------------------
---- Resource_MonopolyGreatPersonRateModifiers
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Resource_MonopolyGreatPersonRateModifiers
		(ResourceType, SpecialistType, IsGlobalMonopoly, IsStrategicMonopoly, Modifier)
SELECT	'RESOURCE_POPPY', Type, 1, 0, 25
FROM Specialists WHERE GreatPeopleRateChange > 0;
--------------------------------------------------------------------------------------------------------------------------
---- Resource_UnitCombatProductionCostModifiersLocal
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Resource_UnitCombatProductionCostModifiersLocal
		(ResourceType, UnitCombatType, RequiredEra, ObsoleteEra, CostModifier)
VALUES	('RESOURCE_HARDWOOD', 'UNITCOMBAT_NAVALRANGED', null, 'ERA_INDUSTRIAL', -20),
		('RESOURCE_HARDWOOD', 'UNITCOMBAT_NAVALMELEE', null, 'ERA_INDUSTRIAL', -20),
		('RESOURCE_HARDWOOD', 'UNITCOMBAT_SIEGE', null, 'ERA_RENAISSANCE', -20),
		('RESOURCE_RUBBER', 'UNITCOMBAT_SETTLER', null, null, -20),
		('RESOURCE_RUBBER', 'UNITCOMBAT_WORKER', null, null, -20),
		('RESOURCE_RUBBER', 'UNITCOMBAT_WORKBOAT', null, null, -20),
		('RESOURCE_RUBBER', 'UNITCOMBAT_CARGO', null, null, -20),
		('RESOURCE_RUBBER', 'UNITCOMBAT_CARAVAN', null, null, -20),
		('RESOURCE_SULFUR', 'UNITCOMBAT_GUN', 'ERA_RENAISSANCE', null, -20),
		('RESOURCE_SULFUR', 'UNITCOMBAT_SIEGE', 'ERA_RENAISSANCE', null, -20),
		('RESOURCE_TITANIUM', 'UNITCOMBAT_FIGHTER', 'ERA_MODERN', null, -20),
		('RESOURCE_TITANIUM', 'UNITCOMBAT_BOMBER', 'ERA_MODERN', null, -20);
--------------------------------------------------------------------------------------------------------------------------
---- Resource_BuildingProductionCostModifiersLocal
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Resource_BuildingProductionCostModifiersLocal
		(ResourceType, RequiredEra, ObsoleteEra, CostModifier)
VALUES	('RESOURCE_LEAD', null, 'ERA_MEDIEVAL', -10);
--==========================================================================================================================
-- IMPROVEMENTS
--==========================================================================================================================
---- Improvement_ResourceTypes
----------------------------------------------------------------------------------------------------------------------------
-- Luxuries
INSERT INTO Improvement_ResourceTypes
		(ResourceType, ImprovementType)
SELECT	Type, 'IMPROVEMENT_MINE'
FROM Resources WHERE Type IN ('RESOURCE_PLATINUM', 'RESOURCE_TIN');

INSERT INTO Improvement_ResourceTypes
		(ResourceType, ImprovementType)
SELECT	Type, 'IMPROVEMENT_PLANTATION'
FROM Resources WHERE Type IN ('RESOURCE_LAVENDER', 'RESOURCE_POPPY');

INSERT INTO Improvement_ResourceTypes
		(ResourceType, ImprovementType)
SELECT	Type, 'IMPROVEMENT_QUARRY'
FROM Resources WHERE Type IN ('RESOURCE_OBSIDIAN');

INSERT INTO Improvement_ResourceTypes -- this is just to prevent the bug where the resource graphic shows up when you put a GPTI on the tile
		(ResourceType, ImprovementType)
SELECT	r.Type, i.Type
FROM Resources r, Improvements i WHERE r.Type IN('RESOURCE_LAVENDER', 'RESOURCE_OBSIDIAN', 'RESOURCE_PLATINUM', 'RESOURCE_POPPY', 'RESOURCE_TIN') AND i.CreatedByGreatPerson = 1;
-- Bonus
INSERT INTO Improvement_ResourceTypes
		(ResourceType, ImprovementType)
SELECT	Type, 'IMPROVEMENT_MINE'
FROM Resources WHERE Type IN ('RESOURCE_LEAD', 'RESOURCE_TITANIUM');

INSERT INTO Improvement_ResourceTypes
		(ResourceType, ImprovementType)
SELECT	Type, 'IMPROVEMENT_PLANTATION'
FROM Resources WHERE Type IN ('RESOURCE_COCONUT', 'RESOURCE_PINEAPPLE', 'RESOURCE_POTATO', 'RESOURCE_RUBBER');

INSERT INTO Improvement_ResourceTypes
		(ResourceType, ImprovementType)
SELECT	Type, 'IMPROVEMENT_QUARRY'
FROM Resources WHERE Type IN ('RESOURCE_SULFUR');

INSERT INTO Improvement_ResourceTypes
		(ResourceType, ImprovementType)
SELECT	Type, 'IMPROVEMENT_LUMBERMILL'
FROM Resources WHERE Type IN ('RESOURCE_HARDWOOD');

INSERT INTO Improvement_ResourceTypes -- this is just to prevent the bug where the resource graphic shows up when you put a GPTI on the tile
		(ResourceType, ImprovementType)
SELECT	r.Type, i.Type
FROM Resources r, Improvements i WHERE r.Type IN('RESOURCE_COCONUT', 'RESOURCE_HARDWOOD', 'RESOURCE_LEAD', 'RESOURCE_PINEAPPLE', 'RESOURCE_POTATO', 'RESOURCE_RUBBER', 'RESOURCE_SULFUR', 'RESOURCE_TITANIUM') AND i.CreatedByGreatPerson = 1;
----------------------------------------------------------------------------------------------------------------------------
---- Improvement_ResourceType_Yields
----------------------------------------------------------------------------------------------------------------------------
-- Luxuries
INSERT INTO Improvement_ResourceType_Yields
		(ImprovementType, ResourceType, YieldType, Yield)
VALUES	('IMPROVEMENT_PLANTATION', 'RESOURCE_LAVENDER', 'YIELD_GOLD', 2),
		('IMPROVEMENT_QUARRY', 'RESOURCE_OBSIDIAN', 'YIELD_SCIENCE', 2),
		('IMPROVEMENT_MINE', 'RESOURCE_PLATINUM', 'YIELD_GOLD', 2),
		('IMPROVEMENT_PLANTATION', 'RESOURCE_POPPY', 'YIELD_GOLD', 1),
		('IMPROVEMENT_PLANTATION', 'RESOURCE_POPPY', 'YIELD_SCIENCE', 1),
		('IMPROVEMENT_MINE', 'RESOURCE_TIN', 'YIELD_GOLD', 1),
		('IMPROVEMENT_MINE', 'RESOURCE_TIN', 'YIELD_PRODUCTION', 1);
-- Bonus
INSERT INTO Improvement_ResourceType_Yields
		(ImprovementType, ResourceType, YieldType, Yield)
VALUES	('IMPROVEMENT_PLANTATION', 'RESOURCE_COCONUT', 'YIELD_FOOD', 1),
		('IMPROVEMENT_PLANTATION', 'RESOURCE_COCONUT', 'YIELD_PRODUCTION', 1),
		('IMPROVEMENT_LUMBERMILL', 'RESOURCE_HARDWOOD', 'YIELD_PRODUCTION', 1),
		('IMPROVEMENT_MINE', 'RESOURCE_LEAD', 'YIELD_SCIENCE', 1),
		('IMPROVEMENT_PLANTATION', 'RESOURCE_PINEAPPLE', 'YIELD_FOOD', 1),
		('IMPROVEMENT_PLANTATION', 'RESOURCE_PINEAPPLE', 'YIELD_GOLD', 2),
		('IMPROVEMENT_PLANTATION', 'RESOURCE_POTATO', 'YIELD_FOOD', 3),
		('IMPROVEMENT_PLANTATION', 'RESOURCE_RUBBER', 'YIELD_PRODUCTION', 2),
		('IMPROVEMENT_PLANTATION', 'RESOURCE_RUBBER', 'YIELD_GOLD', 2),
		('IMPROVEMENT_QUARRY', 'RESOURCE_SULFUR', 'YIELD_PRODUCTION', 1),
		('IMPROVEMENT_QUARRY', 'RESOURCE_SULFUR', 'YIELD_SCIENCE', 1),
		('IMPROVEMENT_MINE', 'RESOURCE_TITANIUM', 'YIELD_PRODUCTION', 2),
		('IMPROVEMENT_MINE', 'RESOURCE_TITANIUM', 'YIELD_SCIENCE', 2);
--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================
---- Building_ResourceYieldChanges
----------------------------------------------------------------------------------------------------------------------------
-- Luxuries
--- Basic buildings
INSERT INTO Building_ResourceYieldChanges
		(BuildingType, ResourceType, YieldType, Yield)
VALUES	('BUILDING_WINDMILL', 'RESOURCE_LAVENDER', 'YIELD_CULTURE', 3),
		('BUILDING_HERBALIST', 'RESOURCE_OBSIDIAN', 'YIELD_FAITH', 2),
		('BUILDING_PUBLIC_SCHOOL', 'RESOURCE_PLATINUM', 'YIELD_SCIENCE', 3),
		('BUILDING_GARDEN', 'RESOURCE_POPPY', 'YIELD_SCIENCE', 2),
		('BUILDING_FORGE', 'RESOURCE_TIN', 'YIELD_PRODUCTION', 1),
		('BUILDING_FORGE', 'RESOURCE_TIN', 'YIELD_SCIENCE', 1);
--- Unique buildings
INSERT INTO Building_ResourceYieldChanges
		(BuildingType, ResourceType, YieldType, Yield)
SELECT	DISTINCT bco.BuildingType, r.Type, ryc.YieldType, ryc.Yield
FROM Buildings b, Resources r, Civilization_BuildingClassOverrides bco, Building_ResourceYieldChanges ryc
WHERE r.Type IN('RESOURCE_LAVENDER', 'RESOURCE_OBSIDIAN', 'RESOURCE_PLATINUM', 'RESOURCE_POPPY', 'RESOURCE_TIN') AND ryc.ResourceType = r.Type AND b.Type = ryc.BuildingType AND bco.BuildingClassType = b.BuildingClass;
-- Bonus
--- Basic buildings
--UPDATE Building_ResourceYieldChanges SET YieldType = 'YIELD_GOLD' WHERE ResourceType = 'RESOURCE_WHEAT' AND YieldType = 'YIELD_FOOD' AND BuildingType IN(SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_GRANARY');

INSERT INTO Building_ResourceYieldChanges
		(BuildingType, ResourceType, YieldType, Yield)
VALUES	('BUILDING_WORKSHOP', 'RESOURCE_COCONUT', 'YIELD_PRODUCTION', 2),
		('BUILDING_WORKSHOP', 'RESOURCE_HARDWOOD', 'YIELD_PRODUCTION', 1),
		('BUILDING_WORKSHOP', 'RESOURCE_HARDWOOD', 'YIELD_GOLD', 1),
		('BUILDING_FORGE', 'RESOURCE_LEAD', 'YIELD_PRODUCTION', 2),
		--('BUILDING_GROVE', 'RESOURCE_MAIZE', 'YIELD_PRODUCTION', 1),
		('BUILDING_MARKET', 'RESOURCE_PINEAPPLE', 'YIELD_GOLD', 2),
		('BUILDING_GROCER', 'RESOURCE_PINEAPPLE', 'YIELD_GOLD', 3),
		('BUILDING_WATERMILL', 'RESOURCE_POTATO', 'YIELD_FOOD', 1),
		('BUILDING_WELL', 'RESOURCE_POTATO', 'YIELD_FOOD', 1),
		('BUILDING_GROCER', 'RESOURCE_POTATO', 'YIELD_FOOD', 2),
		('BUILDING_GROCER', 'RESOURCE_POTATO', 'YIELD_GOLD', 1),
		--('BUILDING_WATERMILL', 'RESOURCE_RICE', 'YIELD_FOOD', 1),
		--('BUILDING_WELL', 'RESOURCE_RICE', 'YIELD_FOOD', 1),
		('BUILDING_FACTORY', 'RESOURCE_RUBBER', 'YIELD_GOLD', 3),
		('BUILDING_FACTORY', 'RESOURCE_SULFUR', 'YIELD_PRODUCTION', 3),
		('BUILDING_LABORATORY', 'RESOURCE_TITANIUM', 'YIELD_PRODUCTION', 1),
		('BUILDING_LABORATORY', 'RESOURCE_TITANIUM', 'YIELD_SCIENCE', 3);
/* the code now is on EEVP file
---- Enlightenment Era Tavern
INSERT INTO Building_ResourceYieldChanges
		(BuildingType, ResourceType, YieldType, Yield)
SELECT	'BUILDING_EE_TAVERN', r.Type, 'YIELD_FOOD', 1
FROM Resources r
WHERE r.Type IN('RESOURCE_MAIZE', 'RESOURCE_RICE') AND EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_EE_TAVERN');
*/
--- Unique buildings
INSERT INTO Building_ResourceYieldChanges
		(BuildingType, ResourceType, YieldType, Yield)
SELECT	DISTINCT bco.BuildingType, r.Type, ryc.YieldType, ryc.Yield
FROM Buildings b, Resources r, Civilization_BuildingClassOverrides bco, Building_ResourceYieldChanges ryc
WHERE r.Type IN('RESOURCE_COCONUT', 'RESOURCE_HARDWOOD', 'RESOURCE_LEAD', /*'RESOURCE_MAIZE',*/ 'RESOURCE_PINEAPPLE', 'RESOURCE_POTATO', /*'RESOURCE_RICE',*/ 'RESOURCE_RUBBER', 'RESOURCE_SULFUR', 'RESOURCE_TITANIUM') AND ryc.ResourceType = r.Type AND b.Type = ryc.BuildingType AND bco.BuildingClassType = b.BuildingClass AND bco.BuildingType IS NOT NULL;

-- Compatibility (with custom civs, 4UC, etc)
CREATE TRIGGER EvenMoreResourcesForVP_BuildingResourceYields
AFTER INSERT ON Civilization_BuildingClassOverrides 
WHEN NEW.BuildingClassType
IN(
	SELECT b.BuildingClass
	FROM Buildings b, Resources r, Building_ResourceYieldChanges ryc
	WHERE r.Type IN('RESOURCE_LAVENDER', 'RESOURCE_OBSIDIAN', 'RESOURCE_PLATINUM', 'RESOURCE_POPPY', 'RESOURCE_TIN', 'RESOURCE_COCONUT', 'RESOURCE_HARDWOOD', 'RESOURCE_LEAD', /*'RESOURCE_MAIZE',*/ 'RESOURCE_PINEAPPLE', 'RESOURCE_POTATO', /*'RESOURCE_RICE',*/ 'RESOURCE_RUBBER', 'RESOURCE_SULFUR', 'RESOURCE_TITANIUM', 'RESOURCE_WHEAT')
	AND ryc.ResourceType = r.Type
	AND b.Type = ryc.BuildingType
)
AND NEW.BuildingType IS NOT NULL
BEGIN
	INSERT INTO Building_ResourceYieldChanges
					(BuildingType, ResourceType, YieldType, Yield)
	SELECT DISTINCT	NEW.BuildingType, r.Type, ryc.YieldType, ryc.Yield
	FROM Resources r, Building_ResourceYieldChanges ryc, BuildingClasses bc
	WHERE r.Type IN('RESOURCE_LAVENDER', 'RESOURCE_OBSIDIAN', 'RESOURCE_PLATINUM', 'RESOURCE_POPPY', 'RESOURCE_TIN', 'RESOURCE_COCONUT', 'RESOURCE_HARDWOOD', 'RESOURCE_LEAD', /*'RESOURCE_MAIZE',*/ 'RESOURCE_PINEAPPLE', 'RESOURCE_POTATO', /*'RESOURCE_RICE',*/ 'RESOURCE_RUBBER', 'RESOURCE_SULFUR', 'RESOURCE_TITANIUM') AND ryc.ResourceType = r.Type AND bc.Type = NEW.BuildingClassType AND ryc.BuildingType = bc.DefaultBuilding;

	UPDATE Building_ResourceYieldChanges SET YieldType = 'YIELD_GOLD' WHERE ResourceType = 'RESOURCE_WHEAT' AND YieldType = 'YIELD_FOOD' AND Yield = 1 AND BuildingType = NEW.BuildingType AND BuildingType IN(SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_GRANARY');
END;
----------------------------------------------------------------------------------------------------------------------------
---- Building_LocalResourceOrs
----------------------------------------------------------------------------------------------------------------------------
-- Basic buildings
INSERT INTO Building_LocalResourceOrs
		(BuildingType, ResourceType)
SELECT	'BUILDING_STONE_WORKS', Type
FROM Resources WHERE Type IN('RESOURCE_OBSIDIAN', 'RESOURCE_SULFUR');

-- Unique buildings
INSERT INTO Building_LocalResourceOrs
		(BuildingType, ResourceType)
SELECT	DISTINCT bco.BuildingType, r.Type
FROM Buildings b, Resources r, Civilization_BuildingClassOverrides bco, Building_LocalResourceOrs lro
WHERE r.Type IN('RESOURCE_OBSIDIAN', 'RESOURCE_SULFUR') AND lro.ResourceType = r.Type AND b.Type = lro.BuildingType AND bco.BuildingClassType = b.BuildingClass AND bco.BuildingType NOT IN('BUILDING_MUD_PYRAMID_MOSQUE');

-- Compatibility (with custom civs, 4UC, etc)
CREATE TRIGGER EvenMoreResourcesForVP_LocalResourceOrs
AFTER INSERT ON Civilization_BuildingClassOverrides 
WHEN NEW.BuildingClassType
IN(
	SELECT DISTINCT b.BuildingClass
	FROM Buildings b, Resources r, Building_LocalResourceOrs lro
	WHERE r.Type IN('RESOURCE_OBSIDIAN', 'RESOURCE_SULFUR')
	AND lro.ResourceType = r.Type
	AND b.Type = lro.BuildingType
)
AND NEW.BuildingType IS NOT NULL
BEGIN
	INSERT INTO Building_LocalResourceOrs
					(BuildingType, ResourceType)
	SELECT DISTINCT	NEW.BuildingType, r.Type
	FROM Resources r
	WHERE r.Type IN('RESOURCE_OBSIDIAN', 'RESOURCE_SULFUR');
END;
--==========================================================================================================================
-- CORPORATIONS
--==========================================================================================================================
---- Corporation_ResourceMonopolyOrs
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO Corporation_ResourceMonopolyOrs
		(CorporationType, ResourceType)
VALUES	-- City state luxuries
		('CORPORATION_TWOKAY_FOODS', 'RESOURCE_BEER'),
		('CORPORATION_LANDSEA_EXTRACTORS', 'RESOURCE_BIRDS_NEST'),
		('CORPORATION_GIORGIO_ARMEIER', 'RESOURCE_CHAMPAGNE'),
		('CORPORATION_TRADER_SIDS', 'RESOURCE_CHEESE'),
		('CORPORATION_TWOKAY_FOODS', 'RESOURCE_HONEY'),
		('CORPORATION_CIVILIZED_JEWELERS', 'RESOURCE_MANUSCRIPTS'),
		-- Luxuries
		('CORPORATION_GIORGIO_ARMEIER', 'RESOURCE_LAVENDER'),
		('CORPORATION_FIRAXITE_MATERIALS', 'RESOURCE_OBSIDIAN'),
		('CORPORATION_CIVILIZED_JEWELERS', 'RESOURCE_PLATINUM'),
		('CORPORATION_TRADER_SIDS', 'RESOURCE_POPPY'),
		('CORPORATION_FIRAXITE_MATERIALS', 'RESOURCE_TIN');
----------------------------------------------------------------------------------------------------------------------------
---- Corporation_ResourceYieldChanges
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO Corporation_ResourceYieldChanges
		(CorporationType, ResourceType, YieldType, Yield)
SELECT	DISTINCT rmo.CorporationType, rmo.ResourceType, ryc.YieldType, ryc.Yield
FROM Corporation_ResourceMonopolyOrs rmo, Corporation_ResourceYieldChanges ryc
WHERE rmo.ResourceType IN('RESOURCE_BEER', 'RESOURCE_BIRDS_NEST', 'RESOURCE_CHAMPAGNE', 'RESOURCE_CHEESE', 'RESOURCE_HONEY', 'RESOURCE_MANUSCRIPTS', 'RESOURCE_LAVENDER', 'RESOURCE_OBSIDIAN', 'RESOURCE_PLATINUM', 'RESOURCE_POPPY', 'RESOURCE_TIN') AND ryc.CorporationType = rmo.CorporationType;

-- Not expecting mods to add new corporation types, so not doing a trigger

-- VP now has Rice & Maize and adds granary bonuses to them, revert that
-- DELETE FROM Building_ResourceYieldChanges WHERE BuildingType IN ('BUILDING_GRANARY', 'BUILDING_YURT') AND ResourceType IN ('RESOURCE_MAIZE', 'RESOURCE_RICE');