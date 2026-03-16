-- ============================
-- Tuntian Troop (Rifleman)
-- worker hybrid
-- ==============================
--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_StrategicView
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 					TileType,		Asset)
VALUES	('ART_DEF_UNIT_JFD_PEKING_FORCE', 		'Unit', 		'sv_PekingForce.dds');
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO ArtDefine_UnitInfos 
		(Type, 									DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_PEKING_FORCE',		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_RIFLEMAN';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,							UnitMemberInfoType,							NumMembers)
SELECT	'ART_DEF_UNIT_JFD_PEKING_FORCE', 		'ART_DEF_UNIT_MEMBER_JFD_PEKING_FORCE',		NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_RIFLEMAN';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_PEKING_FORCE',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_PEKING_FORCE',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale,	ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_PEKING_FORCE',	Scale,	ZOffset, Domain, 'pekingfieldforce.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';

INSERT INTO Unit_Builds
	(UnitType, BuildType)
VALUES
	('UNIT_CD_TUNTIAN', 'BUILD_ROAD'),
	('UNIT_CD_TUNTIAN', 'BUILD_FARM'),
	('UNIT_CD_TUNTIAN', 'BUILD_PASTURE'),
	('UNIT_CD_TUNTIAN', 'BUILD_REPAIR');

UPDATE Units SET
--Food = 1,  -- you lose 1 pop 
--HurryCostModifier = -1,
Found = 1,
FoundLate = 1,
WorkRate = 100,
Cost = Cost - 100
WHERE Type = 'UNIT_CD_TUNTIAN';

INSERT INTO Unit_BuildOnFound
	(UnitType, BuildingClassType)
SELECT
	'UNIT_CD_TUNTIAN', BuildingClassType
FROM Unit_BuildOnFound
WHERE UnitType = 'UNIT_COLONIST';

INSERT INTO Unit_BuildOnFound
	(UnitType, BuildingClassType)
VALUES
	('UNIT_CD_TUNTIAN', 'BUILDINGCLASS_ARMORY'),
	('UNIT_CD_TUNTIAN', 'BUILDINGCLASS_GROCER'),
	('UNIT_CD_TUNTIAN', 'BUILDINGCLASS_STABLE');

INSERT INTO Unit_AITypes
	(UnitType, UnitAIType)
VALUES
	('UNIT_CD_TUNTIAN', 'UNITAI_WORKER'),
	('UNIT_CD_TUNTIAN', 'UNITAI_SETTLE');

REPLACE INTO Language_en_US 
	(Tag, Text)
SELECT
	'TXT_KEY_UNIT_CD_TUNTIAN_HELP', 'Requires the [ICON_CULTURE_JFD_FAR_EASTERN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_FAR_EASTERN_SHORT_DESC}[ENDCOLOR] Cultural Group.'
FROM Language_en_US WHERE Tag = 'TXT_KEY_UNIT_HELP_RIFLEMAN';

-- Is cheaper than the Rifleman it replaces. Can build Roads, Farms, Pastures, and Repair like a [ICON_WORKER] Worker. Founds new Cities with advanced infrastructure and additional [ICON_CITIZEN] Population.

--[NEWLINE][NEWLINE]The [ICON_FOOD] Growth of the City is stopped while this Unit is being Trained. Reduces the City''s [ICON_CITIZEN] Population by 1 when completed.

-- =======================
-- Karaoke Lounge (Stadium)
-- =======================

REPLACE INTO Language_en_US 
	(Tag, Text)
SELECT
	'TXT_KEY_BUILDING_CD_KARAOKE_LOUNGE_HELP', 'Requires the [ICON_CULTURE_JFD_FAR_EASTERN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_FAR_EASTERN_SHORT_DESC}[ENDCOLOR] Cultural Group. ' || Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_BUILDING_STADIUM_HELP';

UPDATE Buildings SET
Happiness = 1
WHERE Type = 'BUILDING_CD_KARAOKE_LOUNGE';

INSERT INTO Building_SpecialistYieldChangesLocal
	(BuildingType, SpecialistType, YieldType, Yield)
VALUES
	('BUILDING_CD_KARAOKE_LOUNGE', 'SPECIALIST_MUSICIAN', 'YIELD_GOLD', 3),
	('BUILDING_CD_KARAOKE_LOUNGE', 'SPECIALIST_MUSICIAN', 'YIELD_TOURISM', 3);

INSERT INTO Building_SpecificGreatPersonRateModifier
	(BuildingType, SpecialistType, Modifier)
VALUES
	('BUILDING_CD_KARAOKE_LOUNGE', 'SPECIALIST_MUSICIAN', 33);

INSERT INTO Building_InstantYield
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CD_KARAOKE_LOUNGE', 'YIELD_TOURISM', 400);

INSERT INTO Building_GrowthExtraYield
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CD_KARAOKE_LOUNGE', 'YIELD_TOURISM', 100);

INSERT INTO Building_BuildingClassYieldChanges
	(BuildingType, BuildingClassType, YieldType, YieldChange)
VALUES
	('BUILDING_CD_KARAOKE_LOUNGE', 'BUILDINGCLASS_MUSICIANS_GUILD', 'YIELD_GOLD', 1),
	('BUILDING_CD_KARAOKE_LOUNGE', 'BUILDINGCLASS_MUSICIANS_GUILD', 'YIELD_TOURISM', 1);

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CD_KARAOKE_LOUNGE', 'YIELD_CULTURE', 4),
	('BUILDING_CD_KARAOKE_LOUNGE', 'YIELD_GOLD', 3),
	('BUILDING_CD_KARAOKE_LOUNGE', 'YIELD_TOURISM', 2);

