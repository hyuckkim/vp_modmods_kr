UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_PLOT';

INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)
SELECT 'ART_DEF_IMPROVEMENT_UNDERSEA_TUNNEL', 'Improvement', 'SV_Tunnel.dds';
	
INSERT INTO Improvements (Type,              Description,             Civilopedia,                    Help,                Water, AllowsWalkWater, OutsideBorders, RequiresXAdjacentLand, DestroyedWhenPillaged, DisplacePillager, ArtDefineTag, PortraitIndex, IconAtlas, UnitFreePromotion, OwnerOnly, NoTwoAdjacent)
SELECT 'IMPROVEMENT_UNDERSEA_TUNNEL', 'TXT_KEY_UNDERSEA_TUNNEL', 'TXT_KEY_UNDERSEA_TUNNEL_HELP', 'TXT_KEY_UNDERSEA_TUNNEL_TEXT', 1,       1,              0,                 2,                       0,                   1,          'ART_DEF_IMPROVEMENT_FW_NETWORK_NODE', 30, 'FW_IMPROVEMENTS_ATLAS', 'PROMOTION_UNDERSEA_TUNNEL', 0, 1;

INSERT INTO Builds (Type,                PrereqTech,                   ImprovementType,          RouteType,           Description,                Help,                             Recommendation, Water, CanBeEmbarked, Time, EntityEvent, HotKey, OrderPriority, IconIndex, IconAtlas)
SELECT 'BUILD_UNDERSEA_TUNNEL', 'TECH_QUANTUM_COMPUTERS',    'IMPROVEMENT_UNDERSEA_TUNNEL',    'ROUTE_RAILROAD' , 'TXT_KEY_BUILD_UNDERSEA_TUNNEL', 'TXT_KEY_UNDERSEA_TUNNEL_HELP', 'TXT_KEY_BUILD_UNDERSEA_TUNNEL_REC', 1, 1, 300, 'ENTITY_EVENT_CHOP', 'KB_Z', 98, 31, 'FW_IMPROVEMENTS_ATLAS';

INSERT INTO Improvement_ValidTerrains (ImprovementType, TerrainType)
SELECT 'IMPROVEMENT_UNDERSEA_TUNNEL', 'TERRAIN_COAST';

INSERT INTO Improvement_Yields (ImprovementType, YieldType, Yield)
SELECT 'IMPROVEMENT_UNDERSEA_TUNNEL', 'YIELD_GOLD', 5;

INSERT INTO Improvement_Yields (ImprovementType, YieldType, Yield)
SELECT 'IMPROVEMENT_UNDERSEA_TUNNEL', 'YIELD_PRODUCTION', 3;

------------------------------	
-- Improvement_Flavors
------------------------------		
INSERT INTO Improvement_Flavors	
			(ImprovementType, 					FlavorType,				Flavor)
VALUES		('IMPROVEMENT_UNDERSEA_TUNNEL',	'FLAVOR_PRODUCTION',		 10),
			('IMPROVEMENT_UNDERSEA_TUNNEL',	'FLAVOR_GOLD',          	  5),
			('IMPROVEMENT_UNDERSEA_TUNNEL', 'FLAVOR_TILE_IMPROVEMENT',   10);

INSERT INTO Unit_Builds (UnitType, BuildType)
SELECT 'UNIT_WORKER',       'BUILD_UNDERSEA_TUNNEL';

UPDATE Builds 
SET 
	Water = 1,
	CanBeEmbarked = 1
WHERE Type = 'BUILD_UNDERSEA_TUNNEL';

UPDATE Improvements
SET DefenseModifier = -25
WHERE Type = 'IMPROVEMENT_UNDERSEA_TUNNEL';
