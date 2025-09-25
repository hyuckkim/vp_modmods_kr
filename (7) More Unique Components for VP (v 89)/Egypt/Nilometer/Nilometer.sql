--==========================================================================================================================
-- CIVILIZATIONS (PATCH)
--==========================================================================================================================
DELETE FROM Civilization_BuildingClassOverrides
WHERE BuildingType = 'BUILDING_FLOATING_GARDENS';

DELETE FROM Civilization_BuildingClassOverrides
WHERE CivilizationType = 'CIVILIZATION_AZTEC'
  AND BuildingClassType IN ('BUILDINGCLASS_WELL','BUILDINGCLASS_WATERMILL');

INSERT OR REPLACE INTO Civilization_BuildingClassOverrides
        (CivilizationType,     BuildingClassType,    BuildingType)
VALUES  ('CIVILIZATION_EGYPT', 'BUILDINGCLASS_WATERMILL', 'BUILDING_FLOATING_GARDENS');

INSERT OR REPLACE INTO Civilization_BuildingClassOverrides
        (CivilizationType,     BuildingClassType,         BuildingType)
VALUES  ('CIVILIZATION_EGYPT', 'BUILDINGCLASS_WELL', NULL);
--==========================================================================================================================


--==========================================================================================================================
-- BUILDINGS (PATCH)
--==========================================================================================================================
UPDATE Buildings
SET BuildingClass = 'BUILDINGCLASS_WATERMILL',
    Description   = 'TXT_KEY_BUILDING_EGYPT_NILOMETER',
    Civilopedia   = 'TXT_KEY_CIV5_BUILDINGS_NILOMETER_TEXT',
    Strategy      = 'TXT_KEY_BUILDING_EGYPT_NILOMETER_STRATEGY',
    Help          = 'TXT_KEY_BUILDING_EGYPT_NILOMETER_HELP',
    IconAtlas     = 'BUILDING_EGYPT_ATLAS',
    PortraitIndex = 2
WHERE Type = 'BUILDING_FLOATING_GARDENS';

DELETE FROM Building_LakePlotYieldChanges
WHERE BuildingType = 'BUILDING_FLOATING_GARDENS';

DELETE FROM Building_YieldChangesPerPop
WHERE BuildingType = 'BUILDING_FLOATING_GARDENS';

INSERT INTO Building_YieldChangesPerPop
        (BuildingType,              YieldType,         Yield)
VALUES  ('BUILDING_FLOATING_GARDENS','YIELD_PRODUCTION', 40);

--==========================================================================================================================
DELETE FROM Building_RiverPlotYieldChanges
WHERE BuildingType='BUILDING_FLOATING_GARDENS' AND YieldType='YIELD_FOOD';

INSERT INTO Building_RiverPlotYieldChanges (BuildingType, YieldType, Yield)
SELECT 'BUILDING_FLOATING_GARDENS','YIELD_FOOD',1
WHERE EXISTS (SELECT 1 FROM sqlite_master WHERE name='Building_RiverPlotYieldChanges');

DELETE FROM Building_GoldenAgeYieldMod
WHERE BuildingType='BUILDING_FLOATING_GARDENS' AND YieldType='YIELD_FOOD';

INSERT INTO Building_GoldenAgeYieldMod (BuildingType, YieldType, Yield)
SELECT 'BUILDING_FLOATING_GARDENS','YIELD_FOOD',10
WHERE EXISTS (SELECT 1 FROM sqlite_master WHERE name='Building_GoldenAgeYieldMod');



--==========================================================================================================================
-- ARTDEFINES (PATCH)
--==========================================================================================================================
INSERT OR IGNORE INTO IconTextureAtlases
        (Atlas,                    IconSize, Filename,                                   IconsPerRow, IconsPerColumn)
VALUES  ('BUILDING_EGYPT_ATLAS',  256,      'BuildingPortraits256_DLC_WonderPack.dds',   2,           2),
        ('BUILDING_EGYPT_ATLAS',  128,      'BuildingPortraits128_DLC_WonderPack.dds',   2,           2),
        ('BUILDING_EGYPT_ATLAS',  64,       'BuildingPortraits64_DLC_WonderPack.dds',    2,           2),
        ('BUILDING_EGYPT_ATLAS',  45,       'BuildingPortraits45_DLC_WonderPack.dds',    2,           2);
--==========================================================================================================================
