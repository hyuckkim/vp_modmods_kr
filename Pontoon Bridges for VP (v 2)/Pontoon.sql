UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_PLOT';

UPDATE Language_en_US
	SET Text = Text || '[NEWLINE][NEWLINE]Upgrade nearby Pontoon Bridge with Roads to Railroads if [COLOR_CYAN]Railroads[ENDCOLOR] has been researched.'
	WHERE Tag = 'TXT_KEY_PROJECT_PUBLIC_WORKS_HELP';

INSERT OR REPLACE INTO LocalizedText
	(Language, Tag, Text)
VALUES
	('en_US', 'TXT_KEY_PROMOTION_PONTOON_BRIDGE', 'On Pontoon Bridge'),
	('en_US', 'TXT_KEY_PROMOTION_PONTOON_BRIDGE_HELP', 'Eliminates combat penalty for attacking from the sea or over a river. -10% [COLOR_NEGATIVE_TEXT]Defense[ENDCOLOR] against all [COLOR_POSITIVE_TEXT]Ranged Attacks[ENDCOLOR]. -25% [COLOR_NEGATIVE_TEXT]Combat Strength[ENDCOLOR] vs [COLOR_POSITIVE_TEXT]Cities[ENDCOLOR]'),
	('en_US', 'TXT_KEY_PONTOON_BRIDGE', 'Pontoon Bridge'),
	('en_US', 'TXT_KEY_PONTOON_BRIDGE_HELP', 'Allows land units to traverse this Coast tile. May only be constructed in a Coast tile with 2 or more land tiles adjacent to it. For tiles with 2 or 3 adjacent land tiles, the land tiles may not be contiguous. Constructed by an embarked Worker, who is consumed by the construction of the Pontoon Bridge.[NEWLINE][NEWLINE] Grants various yields when constructed over Atolls or unlocked certain technologies are unlocked. You may connect cities with this Improvement.'),
	('en_US', 'TXT_KEY_PONTOON_BRIDGE_TEXT', 'Pontoon (or "floating") bridges are used to allow the rapid crossing of narrow, shallow bodies of water by infantry, artillery and wagons.'),
	('en_US', 'TXT_KEY_BUILD_PONTOON_BRIDGE', 'Construct a [LINK=IMPROVEMENT_PONTOON_BRIDGE]Pontoon Bridge[\LINK]'),
	('en_US', 'TXT_KEY_BUILD_PONTOON_BRIDGE_REC', 'It will allow land units to traverse this hex at a minor combat penalty.');

INSERT INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn)
SELECT 'PONTOON_BUILD_ICON_ATLAS', 45, 'UnitAction45_Expansion_Civil_War.dds', 1, 1 UNION ALL
SELECT 'PONTOON_BUILD_ICON_ATLAS', 64, 'UnitAction64_Expansion_Civil_War.dds', 1, 1 UNION ALL
SELECT 'PONTOON_IMPROVEMENT_ICON_ATLAS', 256, 'TerrainIcons256_Expansion_Civil_War.dds', 1, 1 UNION ALL
SELECT 'PONTOON_IMPROVEMENT_ICON_ATLAS', 64, 'TerrainIcons64_Expansion_Civil_War.dds', 1, 1 UNION ALL
SELECT 'TOON_ATLAS', '256', 'TOON_256.dds', 1, 1 UNION ALL
SELECT 'TOON_ATLAS', '64', 'TOON_064.dds', 1, 1 UNION ALL
SELECT 'TOON_ATLAS', '45', 'TOON_045.dds', 1, 1 UNION ALL
SELECT 'TOON_ATLAS', '32', 'TOON_032.dds', 1, 1 UNION ALL
SELECT 'TOON_ATLAS', '16', 'TOON_016.dds', 1, 1;

INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)
SELECT 'ART_DEF_IMPROVEMENT_PONTOON_BRIDGE', 'Improvement', 'SV_Pontoon_Bridge.dds';
	
INSERT INTO Improvements (Type, Description, Civilopedia, Help, Water, AllowsWalkWater, OutsideBorders, RequiresXAdjacentLand, DestroyedWhenPillaged, DisplacePillager, ArtDefineTag, PortraitIndex, IconAtlas, UnitFreePromotion, OwnerOnly, NoTwoAdjacent)
SELECT 'IMPROVEMENT_PONTOON_BRIDGE', 'TXT_KEY_PONTOON_BRIDGE', 'TXT_KEY_PONTOON_BRIDGE_TEXT', 'TXT_KEY_PONTOON_BRIDGE_HELP', 1, 1, 1, 2, 0, 1, 'ART_DEF_IMPROVEMENT_PONTOON_BRIDGE', 0, 'PONTOON_IMPROVEMENT_ICON_ATLAS', 'PROMOTION_PONTOON_BRIDGE', 0, 1;

INSERT INTO Improvement_ValidTerrains (ImprovementType, TerrainType)
SELECT 'IMPROVEMENT_PONTOON_BRIDGE', 'TERRAIN_COAST';

INSERT INTO Improvement_ValidFeatures (ImprovementType, FeatureType)
SELECT 'IMPROVEMENT_PONTOON_BRIDGE', 'FEATURE_ATOLL';

INSERT INTO Improvement_Yields (ImprovementType, YieldType, Yield)
SELECT 'IMPROVEMENT_PONTOON_BRIDGE', 'YIELD_CULTURE', 1 UNION ALL
SELECT 'IMPROVEMENT_PONTOON_BRIDGE', 'YIELD_CULTURE_LOCAL', 1;

INSERT INTO Improvement_FeatureYieldChanges (ImprovementType, FeatureType, YieldType, Yield)
SELECT 'IMPROVEMENT_PONTOON_BRIDGE', 'FEATURE_ATOLL', 'YIELD_PRODUCTION', 2;

INSERT INTO Improvement_TechYieldChanges (ImprovementType, TechType, YieldType, Yield)
SELECT 'IMPROVEMENT_PONTOON_BRIDGE', 'TECH_COMPASS', 'YIELD_CULTURE_LOCAL', 1 UNION ALL
SELECT 'IMPROVEMENT_PONTOON_BRIDGE', 'TECH_COMPASS', 'YIELD_CULTURE', 1 UNION ALL
SELECT 'IMPROVEMENT_PONTOON_BRIDGE', 'TECH_NAVIGATION', 'YIELD_CULTURE_LOCAL', -2 UNION ALL
SELECT 'IMPROVEMENT_PONTOON_BRIDGE', 'TECH_NAVIGATION', 'YIELD_CULTURE', 1 UNION ALL
SELECT 'IMPROVEMENT_PONTOON_BRIDGE', 'TECH_RAILROAD', 'YIELD_GOLD', 1 UNION ALL
SELECT 'IMPROVEMENT_PONTOON_BRIDGE', 'TECH_RADIO', 'YIELD_TOURISM', 1 UNION ALL
SELECT 'IMPROVEMENT_PONTOON_BRIDGE', 'TECH_COMBINED_ARMS', 'YIELD_PRODUCTION', 2 UNION ALL
SELECT 'IMPROVEMENT_PONTOON_BRIDGE', 'TECH_MOBILE_TACTICS', 'YIELD_GOLD', 2;

INSERT INTO UnitPromotions (Type, Description, Help, Sound, CannotBeChosen, IsLostOnMove, Amphib, RangedDefenseMod, CityAttack, PortraitIndex, IconAtlas, PediaType, PediaEntry)
SELECT 'PROMOTION_PONTOON_BRIDGE', 'TXT_KEY_PROMOTION_PONTOON_BRIDGE', 'TXT_KEY_PROMOTION_PONTOON_BRIDGE_HELP', 'AS2D_IF_LEVELUP', 'true', 'true', 'true', -10, -25, 0, 'TOON_ATLAS', 'PEDIA_RANGED', 'TXT_KEY_PROMOTION_PONTOON_BRIDGE';

INSERT INTO UnitPromotions_UnitCombats (PromotionType, UnitCombatType)
SELECT 'PROMOTION_PONTOON_BRIDGE', 'UNITCOMBAT_ARMOR' UNION ALL
SELECT 'PROMOTION_PONTOON_BRIDGE', 'UNITCOMBAT_RECON' UNION ALL
SELECT 'PROMOTION_PONTOON_BRIDGE', 'UNITCOMBAT_MOUNTED' UNION ALL
SELECT 'PROMOTION_PONTOON_BRIDGE', 'UNITCOMBAT_MELEE' UNION ALL
SELECT 'PROMOTION_PONTOON_BRIDGE', 'UNITCOMBAT_GUN' UNION ALL
SELECT 'PROMOTION_PONTOON_BRIDGE', 'UNITCOMBAT_ARCHER' UNION ALL
SELECT 'PROMOTION_PONTOON_BRIDGE', 'UNITCOMBAT_SIEGE';

INSERT INTO Builds (Type, PrereqTech, ImprovementType, RouteType, Description, Help, Recommendation, Water, CanBeEmbarked, Kill, EntityEvent, HotKey, OrderPriority, IconIndex, IconAtlas)
SELECT 'BUILD_PONTOON_BRIDGE', 'TECH_ENGINEERING', 'IMPROVEMENT_PONTOON_BRIDGE', 'ROUTE_ROAD', 'TXT_KEY_BUILD_PONTOON_BRIDGE', 'TXT_KEY_PONTOON_BRIDGE_HELP', 'TXT_KEY_BUILD_PONTOON_BRIDGE_REC', 1, 1, 1, 'ENTITY_EVENT_BUILD', 'KB_Z', 98, 0, 'PONTOON_BUILD_ICON_ATLAS' UNION ALL
SELECT 'BUILD_PONTOON_BRIDGE2', 'TECH_RAILROAD', 'IMPROVEMENT_PONTOON_BRIDGE', 'ROUTE_RAILROAD', 'TXT_KEY_BUILD_PONTOON_BRIDGE', 'TXT_KEY_PONTOON_BRIDGE_HELP', 'TXT_KEY_BUILD_PONTOON_BRIDGE_REC', 1, 1, 1, 'ENTITY_EVENT_BUILD', 'KB_Z', 98, 0, 'PONTOON_BUILD_ICON_ATLAS';

UPDATE Builds SET ObsoleteTech = 'TECH_RAILROAD' WHERE Type = 'BUILD_PONTOON_BRIDGE';

INSERT INTO Unit_Builds (UnitType, BuildType)
SELECT 'UNIT_WORKER', 'BUILD_PONTOON_BRIDGE' UNION ALL
SELECT 'UNIT_WORKER', 'BUILD_PONTOON_BRIDGE2';
