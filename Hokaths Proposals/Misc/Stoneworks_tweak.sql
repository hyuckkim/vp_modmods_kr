-- Stone Works
DELETE FROM Building_LocalResourceOrs WHERE BuildingType IN (SELECT a.Type FROM Buildings a WHERE a.BuildingClass = 'BUILDINGCLASS_STONE_WORKS');
DELETE FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_COLOSSEUM';
DELETE FROM Building_YieldChanges WHERE BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_STONE_WORKS') AND YieldType = 'YIELD_PRODUCTION';

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_STONE_WORKS', 'YIELD_CULTURE', 1),
	('BUILDING_MUD_PYRAMID_MOSQUE', 'YIELD_CULTURE', 2);

INSERT INTO Building_YieldFromBorderGrowth
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_STONE_WORKS', 'YIELD_PRODUCTION', 10),
	('BUILDING_MUD_PYRAMID_MOSQUE', 'YIELD_PRODUCTION', 10);

UPDATE Buildings SET
AllowsProductionTradeRoutes = 0
WHERE BuildingClass = 'BUILDINGCLASS_STONE_WORKS';

UPDATE Language_en_US
SET Text = Replace(Text, '[NEWLINE][NEWLINE]City must have at least one of these resources improved.', '')
WHERE Tag IN (SELECT Help FROM Buildings WHERE Type = 'BUILDING_STONE_WORKS');

UPDATE Language_en_US
SET Text = 'Stone Works increases [ICON_PRODUCTION] Production and [ICON_CULTURE] Culture, increases the output of most Quarry Resources. As with all effects that generate yields from border expansion, the Stone Works effectively increases the value of Culture to your City.'
WHERE Tag = 'TXT_KEY_BUILDING_STONE_WORKS_STRATEGY';

UPDATE Language_en_US
SET Text = 'Unique Songhai replacement for the {TXT_KEY_BUILDING_STONE_WORKS}. Increases the {TXT_KEY_BUILDING_STONE_WORKS}'' bonuses, {TXT_KEY_BUILDING_MUD_PYRAMID_MOSQUE_DESC} generating additional [ICON_CULTURE] Culture and [ICON_PRODUCTION] Production. Along with a +10% boost to constructing Buildings, the {TXT_KEY_BUILDING_MUD_PYRAMID_MOSQUE_DESC} boosts the Production of all River tiles, greatly increasing the development of Cities along waterways.'
WHERE Tag = 'TXT_KEY_BUILDING_MUD_PYRAMID_MOSQUE_STRATEGY';

INSERT INTO Unit_BuildOnFound
	(UnitType, BuildingClassType)
SELECT
	Type, 'BUILDINGCLASS_STONE_WORKS'
FROM Units WHERE Class IN ('UNITCLASS_PIONEER', 'UNITCLASS_COLONIST');

-- forge 
UPDATE Buildings SET
AllowsProductionTradeRoutes = 1
WHERE BuildingClass = 'BUILDINGCLASS_FORGE';

UPDATE Language_en_US
SET Text = Replace(Text, 'Workshop', 'Forge')
WHERE Tag IN (SELECT Strategy FROM Units WHERE Type IN ('UNIT_CARAVAN', 'UNIT_CARGO_SHIP'));

UPDATE Language_en_US
SET Text = 'The Forge improves sources of [ICON_RES_IRON] Iron and [ICON_RES_COPPER] Copper nearby, and boosts the [ICON_PRODUCTION] Production of Mines. It also allowed Production to be moved between Cities, which can be key to getting new settlements up and running in good time.'
WHERE Tag = 'TXT_KEY_BUILDING_FORGE_STRATEGY';

-- workshop
UPDATE Buildings SET
AllowsProductionTradeRoutes = 0
WHERE BuildingClass = 'BUILDINGCLASS_WORKSHOP';

