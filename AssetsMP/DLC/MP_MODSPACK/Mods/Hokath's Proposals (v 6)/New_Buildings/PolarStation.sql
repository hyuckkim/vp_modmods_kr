------------------
-- BuildingClasses
INSERT INTO BuildingClasses (Type, DefaultBuilding, Description)
SELECT 'BUILDINGCLASS_POLAR_STATION', 'BUILDING_POLAR_STATION', 'TXT_KEY_POLAR_STATION';

------------
-- Buildings
INSERT INTO Buildings (Type, BuildingClass, Cost, HurryCostModifier, GoldMaintenance, PrereqTech, ConquestProb, IconAtlas, PortraitIndex, Description, Help, Civilopedia, Strategy, NearbyTerrainRequired, NeverCapture)
SELECT 'BUILDING_POLAR_STATION', 'BUILDINGCLASS_POLAR_STATION', 2250, -20, 8, 'TECH_NUCLEAR_FISSION', 80, 'CORP2_ATLAS', 26, 'TXT_KEY_BUILDING_POLAR_STATION', 'TXT_KEY_BUILDING_POLAR_STATION_HELP', 'TXT_KEY_CIV5_BUILDINGS_POLAR_STATION_TEXT', 'TXT_KEY_BUILDING_POLAR_STATION_STRATEGY', 'TERRAIN_SNOW', 0;

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_POLAR_STATION', 'YIELD_FOOD', 5),
	('BUILDING_POLAR_STATION', 'YIELD_SCIENCE', 5);

-- Building_GlobalYieldModifiers, i.e. temple of artemis only atm
INSERT INTO Building_GlobalYieldModifiers(BuildingType, YieldType, Yield)
SELECT 'BUILDING_POLAR_STATION', 'YIELD_SCIENCE', 5;

-- Building_TerrainYieldChanges
INSERT INTO Building_TerrainYieldChanges(BuildingType, TerrainType, YieldType, Yield)
SELECT 'BUILDING_POLAR_STATION', 'TERRAIN_SNOW', 'YIELD_SCIENCE', 3;

INSERT INTO Building_SeaPlotYieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_POLAR_STATION', 'YIELD_SCIENCE', 1);

-- you want science, building this NOW
INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor)
SELECT 'BUILDING_POLAR_STATION', 'FLAVOR_SCIENCE', 90;

--------
-- text 
--------
INSERT INTO Language_en_US
	(Tag, Text)
VALUES
	('TXT_KEY_BUILDING_POLAR_STATION', 'Ice Station'),	
	('TXT_KEY_BUILDING_POLAR_STATION_HELP', '+5% [ICON_RESEARCH] Science in [COLOR_POSITIVE_TEXT]all Cities[ENDCOLOR]. +3 [ICON_RESEARCH] Science from all Snow tiles worked by the City. +1 [ICON_RESEARCH] Science from all Sea Tiles worked by this City.[NEWLINE][NEWLINE]City must be built on or next to Snow.'),
	('TXT_KEY_BUILDING_POLAR_STATION_STRATEGY', 'Cities by the Snow are rarely very useful, but sometimes we have to build them whether it is because we have run out of space, we need to grab a Strategic or Luxury Resource, or because we captured them from from ours foes. However, if you find yourself with such Cities upon the advent of Nuclear Fission, you can use the Ice Station building to turn them into beacons of Science for your whole Empire! Who knows, perhaps now you will be founding more Cities in the frozen wastes?'),
	('TXT_KEY_CIV5_BUILDINGS_POLAR_STATION_TEXT', 'Polar exploration became the focus of international efforts during the beginning of the 20th century, later becoming known as the Heroic Age to recognise the adversities faced by expeditioners and resulted in intensive scientific and geographical exploration of the polar regions. Many countries from around the world have since established stations in these remote landscapes to conduct a broad range of scientific research from meteorology and biology to cosmic radiation and climate change.');