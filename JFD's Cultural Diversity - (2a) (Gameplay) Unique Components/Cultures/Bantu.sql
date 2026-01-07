-- ============================
-- Kololo (Gatling Gun)
-- tbd
-- ==============================
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_StrategicView
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 			TileType,		Asset)
VALUES ('ART_DEF_UNIT_TRANQ_KOLOLO', 	'Unit', 		'sv_Kololo.dds');
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO ArtDefine_UnitInfos 
		(Type, 							DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_TRANQ_KOLOLO',	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_RIFLEMAN';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,					UnitMemberInfoType,					NumMembers)
SELECT	'ART_DEF_UNIT_TRANQ_KOLOLO', 	'ART_DEF_UNIT_MEMBER_TRANQ_KOLOLO',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_RIFLEMAN';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_TRANQ_KOLOLO',		EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_TRANQ_KOLOLO',		"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale,	ZOffset, Domain, Model,				MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_TRANQ_KOLOLO',		Scale,	ZOffset, Domain, 'Nevonda.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';
--===============================================================================================

UPDATE Units SET
Food = 1,
HurryCostModifier = -1,
Found = 1,
FoundLate = 1,
CombatClass = 'UNITCOMBAT_ARCHER',
Combat = 30,
RangedCombat = 40,
Range = 2,
Moves = 2,
Pillage = 1,
DefaultUnitAI = 'UNITAI_RANGED'
WHERE Type = 'UNIT_CD_KOLOLO';

INSERT INTO Unit_BuildOnFound
	(UnitType, BuildingClassType)
SELECT
	'UNIT_CD_KOLOLO', BuildingClassType
FROM Unit_BuildOnFound WHERE UnitType = 'UNIT_COLONIST';

INSERT INTO Unit_BuildOnFound
	(UnitType, BuildingClassType)
VALUES
	('UNIT_CD_KOLOLO', 'BUILDINGCLASS_CONSTABLE');

INSERT INTO Unit_Flavors
	(UnitType, FlavorType, Flavor)
VALUES
	('UNIT_CD_KOLOLO', 'FLAVOR_OFFENSE', 9),
	('UNIT_CD_KOLOLO', 'FLAVOR_DEFENSE', 9),
	('UNIT_CD_KOLOLO', 'FLAVOR_RANGED', 10);

INSERT INTO Unit_AITypes
	(UnitType, UnitAIType)
VALUES
	('UNIT_CD_KOLOLO', 'UNITAI_RANGED');

DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_CD_KOLOLO';

INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
VALUES
	('UNIT_CD_KOLOLO', 'PROMOTION_CAN_MOVE_AFTER_ATTACKING'),
	('UNIT_CD_KOLOLO', 'PROMOTION_CD_MFECANE'),
	('UNIT_CD_KOLOLO', 'PROMOTION_BUFFALO_CHEST'),
	('UNIT_CD_KOLOLO', 'PROMOTION_BUFFALO_HORNS'),
	('UNIT_CD_KOLOLO', 'PROMOTION_BUFFALO_LOINS');

REPLACE INTO Language_en_US 
	(Tag, Text)
SELECT
	'TXT_KEY_UNIT_CD_KOLOLO_HELP', 'Requires the [ICON_CULTURE_JFD_BANTU] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_BANTU_SHORT_DESC}[ENDCOLOR] Cultural Group.'
FROM Language_en_US WHERE Tag = 'TXT_KEY_UNIT_COLONIST_HELP';

--  Founds new Cities with advanced infrastructure and additional [ICON_CITIZEN] Population. Unlike the Colonist that it replaces, it has a [ICON_RANGE_STRENGTH] Ranged Attack and [ICON_STRENGTH] Combat Strength. Can move after attacking and gains [ICON_FOOD] Food, [ICON_PRODUCTION] Production, and [ICON_CULTURE_LOCAL] Border Growth Points from [ICON_RAZING] Pillaging Improvements. Starts with the [COLOR_POSITIVE_TEXT]Buffalo Chest[ENDCOLOR], [COLOR_POSITIVE_TEXT]Horns[ENDCOLOR], and [COLOR_POSITIVE_TEXT]Loins[ENDCOLOR] Promotions.[NEWLINE][NEWLINE]The [ICON_FOOD] Growth of the City is stopped while this Unit is being Trained. Reduces the City''s [ICON_CITIZEN] Population by 1 when completed.

-- =======================
-- Kgotla (Constabulary)
-- =======================

REPLACE INTO Language_en_US 
	(Tag, Text)
SELECT
	'TXT_KEY_BUILDING_CD_KGOTLA_HELP', 'Requires the [ICON_CULTURE_JFD_BANTU] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_BANTU_SHORT_DESC}[ENDCOLOR] Cultural Group. ' || Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_BUILDING_CONSTABLE_HELP';

UPDATE Buildings SET
Happiness = 1
WHERE Type = 'BUILDING_CD_KGOTLA';

INSERT INTO Building_SpecialistYieldChangesLocal
	(BuildingType, SpecialistType, YieldType, Yield)
VALUES
	('BUILDING_CD_KGOTLA', 'SPECIALIST_MERCHANT', 'YIELD_CULTURE', 1),
	('BUILDING_CD_KGOTLA', 'SPECIALIST_SCIENTIST', 'YIELD_CULTURE', 1),
	('BUILDING_CD_KGOTLA', 'SPECIALIST_ENGINEER', 'YIELD_CULTURE', 1),
	('BUILDING_CD_KGOTLA', 'SPECIALIST_CIVIL_SERVANT', 'YIELD_CULTURE', 1);

INSERT INTO Building_BuildingClassYieldChanges
	(BuildingType, BuildingClassType, YieldType, YieldChange)
VALUES
	('BUILDING_CD_KGOTLA', 'BUILDINGCLASS_COURTHOUSE', 'YIELD_PRODUCTION', 1);

INSERT INTO Building_ImprovementYieldChanges
	(BuildingType, ImprovementType, YieldType, Yield)
VALUES
	('BUILDING_CD_KGOTLA', 'IMPROVEMENT_PASTURE', 'YIELD_FOOD', 3);

-- base yields of the civil servant + food
INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CD_KGOTLA', 'YIELD_GOLD', 2),
	('BUILDING_CD_KGOTLA', 'YIELD_SCIENCE', 2),
	('BUILDING_CD_KGOTLA', 'YIELD_CULTURE', 1);
