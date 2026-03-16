-- ============================
-- Penjapap (Corvette)
-- yarrr me hearties
-- ==============================
-- ======================================================================================================
-- UNIT ART
-- ======================================================================================================
-- ArtDefine_StrategicView
--------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 		         TileType,		 Asset)
VALUES	('ART_DEF_UNIT_THP_PANGAYAW',		'Unit', 		'sv_penjajap.dds');
----------------------
-- ArtDefine_UnitInfos
----------------------
INSERT INTO ArtDefine_UnitInfos
          (Type,                               DamageStates,    Formation)
SELECT    'ART_DEF_UNIT_THP_PANGAYAW',         DamageStates,    'Flotilla'
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_CARAVEL';
--------------------------------
-- ArtDefine_UnitInfoMemberInfos
--------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos
          (UnitInfoType,                    UnitMemberInfoType,                    NumMembers)
SELECT    'ART_DEF_UNIT_THP_PANGAYAW',     'ART_DEF_UNIT_MEMBER_THP_PANGAYAW',     1
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_CARAVEL';

INSERT INTO ArtDefine_UnitInfoMemberInfos
          (UnitInfoType,                    UnitMemberInfoType,                    NumMembers)
SELECT    'ART_DEF_UNIT_THP_PANGAYAW',     'ART_DEF_UNIT_MEMBER_THP_PANGAYAW_KAKAP',     2
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_CARAVEL';
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats
(UnitMemberType,                                 EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT    'ART_DEF_UNIT_MEMBER_THP_PANGAYAW',    EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax,   LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack,    HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat,  ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack,      AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_CARAVEL';

INSERT INTO ArtDefine_UnitMemberCombats
(UnitMemberType,                                 EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT    'ART_DEF_UNIT_MEMBER_THP_PANGAYAW_KAKAP',    EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax,   LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack,    HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat,  ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack,      AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_WORKBOAT';
------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons
(UnitMemberType,                                 "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT    'ART_DEF_UNIT_MEMBER_THP_PANGAYAW',    "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_CARAVEL';

INSERT INTO ArtDefine_UnitMemberCombatWeapons
(UnitMemberType,                                 "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT    'ART_DEF_UNIT_MEMBER_THP_PANGAYAW_KAKAP',    "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_WORKBOAT';
----------------------------
-- ArtDefine_UnitMemberInfos
----------------------------
INSERT INTO ArtDefine_UnitMemberInfos
(Type,                                           Scale,    ZOffset, Domain, Model,                    MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT    'ART_DEF_UNIT_MEMBER_THP_PANGAYAW',    Scale*0.5,    ZOffset, Domain, 'WarJunk.fxsxml',    MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_CARAVEL';

INSERT INTO ArtDefine_UnitMemberInfos
(Type,  Scale,  ZOffset, Domain, Model,  MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT    'ART_DEF_UNIT_MEMBER_THP_PANGAYAW_KAKAP',    Scale*0.5,    ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_WORKBOAT';
--================================================================

UPDATE Units SET
Moves = 5
WHERE Type = 'UNIT_CD_PENJAJAP';

INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
VALUES
	('UNIT_CD_PENJAJAP', 'PROMOTION_SHALLOW_DRAFT'),
	('UNIT_CD_PENJAJAP', 'PROMOTION_CAN_MOVE_AFTER_ATTACKING'),
	('UNIT_CD_PENJAJAP', 'PROMOTION_NAVIGATOR_1'),
	('UNIT_CD_PENJAJAP', 'PROMOTION_CD_KAKAP');

UPDATE Language_en_US SET
Text = 'Requires the [ICON_CULTURE_JFD_EAST_INDIES] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_EAST_INDIES_SHORT_DESC}[ENDCOLOR] Cultural Group.'
WHERE Tag = 'TXT_KEY_UNIT_CD_PENJAJAP_HELP';

--  Is faster in Coast but slower in Ocean than the Caravel it replaces. Has +1 [ICON_VISION] Sight, is Invisible to non-adjacent, non-attacked Units, and heals in Neutral Territory. Can move after attacking. Starts with the [COLOR_POSITIVE_TEXT]Navigator I[ENDCOLOR] Promotion. 

-- =======================
-- Palm Mill (Refinery)
-- =======================

REPLACE INTO Language_en_US 
	(Tag, Text)
SELECT
	'TXT_KEY_BUILDING_CD_PALM_MILL_HELP', 'Requires the [ICON_CULTURE_JFD_EAST_INDIES] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_EAST_INDIES_SHORT_DESC}[ENDCOLOR] Cultural Group. ' || Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_BUILDING_REFINERY_HELP';

-- turns out this is not very AI friendly
--INSERT INTO Building_LocalFeatureOrs
--	(BuildingType, FeatureType)
--VALUES
--	('BUILDING_CD_PALM_MILL', 'FEATURE_JUNGLE');

--UPDATE Language_en_US SET
--Text = Text || ' Requires a nearby Jungle.'
--WHERE Tag = 'TXT_KEY_BUILDING_CD_PALM_MILL_HELP';

INSERT INTO Building_ImprovementYieldChanges
	(BuildingType, ImprovementType, YieldType, Yield)
VALUES
	('BUILDING_CD_PALM_MILL', 'IMPROVEMENT_LUMBERMILL', 'YIELD_GOLD', 2),
	('BUILDING_CD_PALM_MILL', 'IMPROVEMENT_LUMBERMILL', 'YIELD_PRODUCTION', 2),
	('BUILDING_CD_PALM_MILL', 'IMPROVEMENT_PLANTATION', 'YIELD_GOLD', 4),
	('BUILDING_CD_PALM_MILL', 'IMPROVEMENT_PLANTATION', 'YIELD_SCIENCE', 4);

INSERT INTO Building_FeatureYieldChanges
	(BuildingType, FeatureType, YieldType, Yield)
VALUES
	('BUILDING_CD_PALM_MILL', 'FEATURE_JUNGLE', 'YIELD_FOOD', -2);

UPDATE Buildings SET
FinishSeaTRTourism = 10,
TradeRouteSeaGoldBonus = 600
WHERE Type = 'BUILDING_CD_PALM_MILL';

INSERT INTO Building_ResourceQuantityFromPOP
	(BuildingType, ResourceType, Modifier)
VALUES
	('BUILDING_CD_PALM_MILL', 'RESOURCE_OIL', 10);

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CD_PALM_MILL', 'YIELD_GOLD', 5),
	('BUILDING_CD_PALM_MILL', 'YIELD_SCIENCE', 5);
