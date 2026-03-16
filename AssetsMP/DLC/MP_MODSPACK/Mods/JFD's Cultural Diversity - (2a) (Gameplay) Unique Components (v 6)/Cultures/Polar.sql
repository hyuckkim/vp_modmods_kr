-- ============================
-- Umiak (Liburna)
-- economic and scouting aspects
-- ==============================
-- Art Defines
--==========================================================================================================================
-- ArtDefine_StrategicView 
-----------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 		TileType,		 Asset)
VALUES	('ART_DEF_UNIT_GT_ANAN',		'Unit', 		'umiak_sv.dds');
----------------------
-- ArtDefine_UnitInfos
----------------------
INSERT INTO ArtDefine_UnitInfos 
		(Type, 		DamageStates,	 Formation)
VALUES	('ART_DEF_UNIT_GT_ANAN',  1, 	            'TwoBigGuns');
--------------------------------
-- ArtDefine_UnitInfoMemberInfos
--------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,				 UnitMemberInfoType,		        NumMembers)
SELECT	'ART_DEF_UNIT_GT_ANAN', 	'ART_DEF_UNIT_MEMBER_GT_ANAN',    NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_TRIREME';
------------------------------	
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
    (UnitMemberType,		EnableActions, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasRefaceAfterCombat, HasIndependentWeaponFacing)
VALUES	('ART_DEF_UNIT_MEMBER_GT_ANAN',	'Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady AttackSurfaceToAir',    1,   1,   1,   0,   1);
------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,	"Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, WeaponTypeTag, WeaponTypeSoundOverrideTag)
VALUES	('ART_DEF_UNIT_MEMBER_GT_ANAN',	0,       0,        0.0,                0.0,                     'ARROW',              'ARROW');
----------------------------
-- ArtDefine_UnitMemberInfos
----------------------------
INSERT INTO ArtDefine_UnitMemberInfos
(Type,                                       Scale,                 Domain, Model,          MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT  'ART_DEF_UNIT_MEMBER_GT_ANAN',    Scale,   'Sea',  'anan_model.fxsxml', 'WOOD', 'WOODLRG'
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_TRIREME';
--==========================================================================================================================

INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
VALUES
	('UNIT_CD_UMIAK', 'PROMOTION_CD_UMIAK'),
	('UNIT_CD_UMIAK', 'PROMOTION_RECONNAISSANCE');

INSERT INTO Unit_Builds
	(UnitType, BuildType)
VALUES
	('UNIT_CD_UMIAK', 'BUILD_FISHING_BOATS_NO_KILL');

INSERT INTO Unit_AITypes
	(UnitType, UnitAIType)
VALUES
	('UNIT_CD_UMIAK', 'UNITAI_WORKER');

UPDATE Units SET
WorkRate = 100,
CanChangePort = 1  -- doesnt work on military apparently
WHERE Type = 'UNIT_CD_UMIAK';

REPLACE INTO Language_en_US 
	(Tag, Text)
SELECT
	'TXT_KEY_UNIT_CD_UMIAK_HELP', 'Requires the [ICON_CULTURE_JFD_POLAR] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_POLAR_SHORT_DESC}[ENDCOLOR] Cultural Group.[NEWLINE]Can change Port, like a [ICON_GREAT_ADMIRAL] Great Admiral.'
FROM Language_en_US WHERE Tag = 'TXT_KEY_UNIT_CD_UMIAK_HELP';	

--  Can improve [COLOR_POSITIVE_TEXT]Sea Resources[ENDCOLOR] without being expended, enter [COLOR_POSITIVE_TEXT]Ice[ENDCOLOR] Features, and earns [ICON_FOOD] Food in the nearest City from Scouting. Starts with the [COLOR_POSITIVE_TEXT]Reconnaissance[ENDCOLOR] Promotion, which earns XP from Scouting.

-- =======================
-- Reindeer (Unique Camp Resource Placer)
-- =======================

DELETE FROM Building_ResourceQuantityRequirements WHERE BuildingType = 'BUILDING_CD_REINDEER_DISTRICT';

INSERT INTO Building_ResourcePlotsToPlace
	(BuildingType, ResourceType, NumPlots, ResourceQuantityToPlace)
VALUES
	('BUILDING_CD_REINDEER_DISTRICT', 'RESOURCE_REINDEER', 2, 1);

INSERT INTO Building_ResourceYieldChanges
	(BuildingType, ResourceType, YieldType, Yield)
VALUES
	('BUILDING_CD_REINDEER_DISTRICT', 'RESOURCE_REINDEER', 'YIELD_TOURISM', 2),
	('BUILDING_CD_REINDEER_DISTRICT', 'RESOURCE_REINDEER', 'YIELD_GOLD', 2);

INSERT INTO Building_ImprovementYieldChanges
	(BuildingType, ImprovementType, YieldType, Yield)
SELECT
	'BUILDING_CD_REINDEER_DISTRICT', 'IMPROVEMENT_CAMP', YieldType, Yield
FROM Building_ImprovementYieldChanges WHERE BuildingType = 'BUILDING_AGRIBUSINESS' AND ImprovementType = 'IMPROVEMENT_PASTURE';

INSERT INTO Building_YieldPerXTerrainTimes100
	(BuildingType, TerrainType, YieldType, Yield)
VALUES
	('BUILDING_CD_REINDEER_DISTRICT', 'TERRAIN_TUNDRA', 'YIELD_FOOD', 75),
	('BUILDING_CD_REINDEER_DISTRICT', 'TERRAIN_TUNDRA', 'YIELD_GOLD', 75),
	('BUILDING_CD_REINDEER_DISTRICT', 'TERRAIN_SNOW', 'YIELD_FOOD', 75),
	('BUILDING_CD_REINDEER_DISTRICT', 'TERRAIN_SNOW', 'YIELD_GOLD', 75);

INSERT INTO Building_YieldChanges 
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CD_REINDEER_DISTRICT', 'YIELD_CULTURE', 3),
	('BUILDING_CD_REINDEER_DISTRICT', 'YIELD_CULTURE_LOCAL', 10);

