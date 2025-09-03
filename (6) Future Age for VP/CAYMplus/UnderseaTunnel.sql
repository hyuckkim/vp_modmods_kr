UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_PLOT';

INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)
SELECT 'ART_DEF_IMPROVEMENT_PONTOON_BRIDGE', 'Improvement', 'SV_Tunnel.dds';
	
INSERT INTO Improvements (Type,              Description,             Civilopedia,                    Help,                Water, AllowsWalkWater, OutsideBorders, RequiresXAdjacentLand, DestroyedWhenPillaged, DisplacePillager, ArtDefineTag, PortraitIndex, IconAtlas, UnitFreePromotion, OwnerOnly, NoTwoAdjacent)
SELECT 'IMPROVEMENT_PONTOON_BRIDGE', 'TXT_KEY_PONTOON_BRIDGE', 'TXT_KEY_PONTOON_BRIDGE_HELP', 'TXT_KEY_PONTOON_BRIDGE_TEXT', 1,       1,              0,                 2,                       0,                   1,          'ART_DEF_IMPROVEMENT_FW_NETWORK_NODE', 30, 'FW_IMPROVEMENTS_ATLAS', 'PROMOTION_PONTOON_BRIDGE', 0, 1;

INSERT INTO Builds (Type,                PrereqTech,                   ImprovementType,          RouteType,           Description,                Help,                             Recommendation, Water, CanBeEmbarked, Time, EntityEvent, HotKey, OrderPriority, IconIndex, IconAtlas)
SELECT 'BUILD_PONTOON_BRIDGE2', 'TECH_QUANTUM_COMPUTERS',    'IMPROVEMENT_PONTOON_BRIDGE', 'ROUTE_RAILROAD', 'TXT_KEY_BUILD_PONTOON_BRIDGE', 'TXT_KEY_PONTOON_BRIDGE_HELP', 'TXT_KEY_BUILD_PONTOON_BRIDGE_REC', 1, 1, 300, 'ENTITY_EVENT_CHOP', 'KB_Z', 98, 31, 'FW_IMPROVEMENTS_ATLAS';

INSERT INTO Improvement_ValidTerrains (ImprovementType, TerrainType)
SELECT 'IMPROVEMENT_PONTOON_BRIDGE', 'TERRAIN_COAST';

INSERT INTO Improvement_Yields (ImprovementType, YieldType, Yield)
SELECT 'IMPROVEMENT_PONTOON_BRIDGE', 'YIELD_GOLD', 5;

INSERT INTO Improvement_Yields (ImprovementType, YieldType, Yield)
SELECT 'IMPROVEMENT_PONTOON_BRIDGE', 'YIELD_PRODUCTION', 3;

------------------------------	
-- Improvement_Flavors
------------------------------		
INSERT INTO Improvement_Flavors	
			(ImprovementType, 					FlavorType,				Flavor)
VALUES		('IMPROVEMENT_PONTOON_BRIDGE',	'FLAVOR_PRODUCTION',		10),
			('IMPROVEMENT_PONTOON_BRIDGE',	'FLAVOR_GOLD',          	 5),
			('IMPROVEMENT_PONTOON_BRIDGE', 'FLAVOR_TILE_IMPROVEMENT',   10);

INSERT INTO Unit_Builds (UnitType, BuildType)
SELECT 'UNIT_WORKER',       'BUILD_PONTOON_BRIDGE2';

UPDATE Builds 
SET 
	Water = 1,
	CanBeEmbarked = 1
WHERE Type = 'BUILD_PONTOON_BRIDGE2';

UPDATE Improvements
SET DefenseModifier = -25
WHERE Type = 'IMPROVEMENT_PONTOON_BRIDGE';
