-- ============================
-- Baghatur (Unique, starts Horseman)
-- hero
-- ==============================
-- multiple unit arts for era progression
--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
-- ArtDefine_StrategicView
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 			TileType,	Asset)
VALUES	('ART_DEF_UNIT_BATIR',	'Unit', 	'sv_baghatur.dds');
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO ArtDefine_UnitInfos 
		(Type, 							DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_BATIR',	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_HORSEMAN';

INSERT INTO ArtDefine_UnitInfos 
		(Type, 							DamageStates,	Formation, IconAtlas, PortraitIndex)
SELECT	'ART_DEF_UNIT_BATIR_RENAISSANCE',		DamageStates, 	Formation, 'CD_MILITARY_ATLAS', 51
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_LANCER';

INSERT INTO ArtDefine_UnitInfos 
		(Type, 							DamageStates,	Formation, IconAtlas, PortraitIndex)
SELECT	'ART_DEF_UNIT_BATIR_POSTMODERN',		DamageStates, 	Formation, 'CD_MILITARY_ATLAS', 43
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_TANK';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,			UnitMemberInfoType,			NumMembers)
VALUES	('ART_DEF_UNIT_BATIR', 			'ART_DEF_UNIT_MEMBER_BATIR',			1);

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,			UnitMemberInfoType,			NumMembers)
VALUES	('ART_DEF_UNIT_BATIR_RENAISSANCE', 	'ART_DEF_UNIT_MEMBER_BATIR_RENAISSANCE',	1);

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,			UnitMemberInfoType,			NumMembers)
VALUES	('ART_DEF_UNIT_BATIR_POSTMODERN', 		'ART_DEF_UNIT_MEMBER_BATIR_POSTMODERN',		1);
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombats
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
	(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	
	'ART_DEF_UNIT_MEMBER_BATIR',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_HORSEMAN';

INSERT INTO ArtDefine_UnitMemberCombats 
	(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	
	'ART_DEF_UNIT_MEMBER_BATIR_RENAISSANCE',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_LANCER';

INSERT INTO ArtDefine_UnitMemberCombats 
	(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	
	'ART_DEF_UNIT_MEMBER_BATIR_POSTMODERN',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_TANK';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
	(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	
	'ART_DEF_UNIT_MEMBER_BATIR',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_HORSEMAN';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
	(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	
	'ART_DEF_UNIT_MEMBER_BATIR_RENAISSANCE',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_LANCER';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
	(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	
	'ART_DEF_UNIT_MEMBER_BATIR_POSTMODERN',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_TANK';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
	(Type, 					Scale,	ZOffset, Domain, Model, 			 MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	
	'ART_DEF_UNIT_MEMBER_BATIR',	Scale,	ZOffset, Domain, 'Horseman_Turkey.fxsxml',	 MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_HORSEMAN';

INSERT INTO ArtDefine_UnitMemberInfos 	
	(Type, 					Scale,	ZOffset, Domain, Model, 			 MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	
	'ART_DEF_UNIT_MEMBER_BATIR_RENAISSANCE',	Scale,	ZOffset, Domain, 'er_kalmyk_xazg.fxsxml',	 MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_LANCER';

INSERT INTO ArtDefine_UnitMemberInfos 	
	(Type, 					Scale,	ZOffset, Domain, Model, 			 MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	
	'ART_DEF_UNIT_MEMBER_BATIR_POSTMODERN',	Scale,	ZOffset, Domain, 'IS-3.fxsxml',			 MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_TANK';
--=====================================================
UPDATE Civilization_UnitClassOverrides SET
UnitClassType = 'UNITCLASS_CD_BAGHATUR'
WHERE UnitType = 'UNIT_CD_BAGHATUR';

UPDATE Units SET
Combat = 13,
Moves = 4,
Cost = 100,
ProductionCostAddedPerEra = 150,
FaithCost = 0,  -- you cant buy this with faith
IsMounted = 1,
--PolicyType = NULL,
Class = 'UNITCLASS_CD_BAGHATUR',
PrereqTech = 'TECH_ARCHERY',
ObsoleteTech = NULL,
GoodyHutUpgradeUnitClass = NULL,
UnitArtInfoEraVariation = 1,
UnitEraUpgrade = 1,
HurryCostModifier = -1  -- cannot purchase
WHERE Type = 'UNIT_CD_BAGHATUR';

DELETE FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_CD_BAGHATUR';
DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_CD_BAGHATUR';
DELETE FROm Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_CD_BAGHATUR';

-- its really good to have one and it needs to scale
UPDATE Unit_Flavors SET Flavor = Flavor * 10 WHERE UnitType = 'UNIT_CD_BAGHATUR';

INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
VALUES
	('UNIT_CD_BAGHATUR', 'PROMOTION_CAN_MOVE_AFTER_ATTACKING'),
	('UNIT_CD_BAGHATUR', 'PROMOTION_CD_BATIR');

INSERT INTO Unit_EraCombatType
	(UnitType, UnitCombatType, EraType, Value)
VALUES
	('UNIT_CD_BAGHATUR', 'UNITCOMBAT_ARMOR', 'ERA_POSTMODERN', 1);

-- not compatible with EraCombatStrength atm it seems
--INSERT INTO Unit_EraUnitPromotions
--	(UnitType, PromotionType, EraType, Value)
--VALUES
--	('UNIT_CD_BAGHATUR', 'PROMOTION_UNIT_MONGOLIA_MINGGHAN', 'ERA_RENAISSANCE', 1),
--	('UNIT_CD_BAGHATUR', 'PROMOTION_ARMOR_PLATING_1', 'ERA_POSTMODERN', 1),
--	('UNIT_CD_BAGHATUR', 'PROMOTION_MOBILITY', 'ERA_POSTMODERN', 1);

INSERT INTO Unit_EraCombatStrength 	
		(UnitType, 	EraType,			CombatStrength)
SELECT	'UNIT_CD_BAGHATUR',	'ERA_CLASSICAL',	Combat FROM Units WHERE Type='UNIT_SWORDSMAN' UNION ALL
SELECT	'UNIT_CD_BAGHATUR',	'ERA_MEDIEVAL',		Combat FROM Units WHERE Type='UNIT_KNIGHT' UNION ALL
SELECT	'UNIT_CD_BAGHATUR',	'ERA_RENAISSANCE',	Combat-2 FROM Units WHERE Type='UNIT_LANCER' UNION ALL
SELECT	'UNIT_CD_BAGHATUR',	'ERA_ENLIGHTENMENT',	Combat+3 FROM Units WHERE Type='UNIT_LANCER' AND EXISTS (SELECT * FROM Eras WHERE Type = 'ERA_ENLIGHTENMENT') UNION ALL
SELECT	'UNIT_CD_BAGHATUR',	'ERA_INDUSTRIAL',	Combat+2 FROM Units WHERE Type='UNIT_CAVALRY' UNION ALL
SELECT	'UNIT_CD_BAGHATUR',	'ERA_MODERN',		Combat FROM Units WHERE Type='UNIT_WWI_TANK' UNION ALL
SELECT	'UNIT_CD_BAGHATUR',	'ERA_POSTMODERN',	Combat FROM Units WHERE Type='UNIT_TANK' UNION ALL
SELECT	'UNIT_CD_BAGHATUR',	'ERA_FUTURE',		Combat FROM Units WHERE Type='UNIT_MODERN_ARMOR';

--Starts with the [COLOR_POSITIVE_TEXT]Mingghan[ENDCOLOR] Promotion if born after entering the [COLOR_CYAN]Renaissance Era[ENDCOLOR], and both the [COLOR_POSITIVE_TEXT]Armor Plating I[ENDCOLOR] and [COLOR_POSITIVE_TEXT]Mobility[ENDCOLOR] Promotions if after the [COLOR_CYAN]Atomic Era[ENDCOLOR], where it also counts as an Armor Unit.

UPDATE Language_en_US SET
Text = 'Requires the [ICON_CULTURE_JFD_STEPPE] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_STEPPE_SHORT_DESC}[ENDCOLOR] Cultural Group.[NEWLINE]Must be trained with [ICON_PRODUCTION] Production.'
WHERE Tag = 'TXT_KEY_UNIT_CD_BAGHATUR_HELP';

-- =======================
-- Festival Plaza (Hotel)
-- =======================

REPLACE INTO Language_en_US 
	(Tag, Text)
SELECT
	'TXT_KEY_BUILDING_CD_BOKH_PLAZA_HELP', 'Requires the [ICON_CULTURE_JFD_STEPPE] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_STEPPE_SHORT_DESC}[ENDCOLOR] Cultural Group. ' || Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_BUILDING_HOTEL_HELP';

UPDATE Buildings
SET
	Happiness = 1,
	-- MilitaryProductionModifier = 15,  -- overkill for these civs we think
	TrainedFreePromotion = 'PROMOTION_CD_BOKH'
WHERE Type = 'BUILDING_CD_BOKH_PLAZA';

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CD_BOKH_PLAZA', 'YIELD_CULTURE', 4),
	('BUILDING_CD_BOKH_PLAZA', 'YIELD_TOURISM', 2);

INSERT INTO Building_BuildingClassYieldModifiers
	(BuildingType, BuildingClassType, YieldType, Modifier)
VALUES
	('BUILDING_CD_BOKH_PLAZA', 'BUILDINGCLASS_COLOSSEUM', 'YIELD_CULTURE', 5),
	('BUILDING_CD_BOKH_PLAZA', 'BUILDINGCLASS_STADIUM', 'YIELD_CULTURE', 5),
	('BUILDING_CD_BOKH_PLAZA', 'BUILDINGCLASS_COLOSSEUM', 'YIELD_FOOD', 5),
	('BUILDING_CD_BOKH_PLAZA', 'BUILDINGCLASS_STADIUM', 'YIELD_FOOD', 5);

INSERT INTO Building_BuildingClassLocalHappiness
	(BuildingType, BuildingClassType, Happiness)
VALUES
	('BUILDING_CD_BOKH_PLAZA', 'BUILDINGCLASS_COLOSSEUM', 1),
	('BUILDING_CD_BOKH_PLAZA', 'BUILDINGCLASS_STADIUM', 1);

INSERT INTO Building_GrowthExtraYield
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CD_BOKH_PLAZA', 'YIELD_PRODUCTION', 25);

INSERT INTO Building_YieldFromUnitProduction
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CD_BOKH_PLAZA', 'YIELD_TOURISM', 15);


