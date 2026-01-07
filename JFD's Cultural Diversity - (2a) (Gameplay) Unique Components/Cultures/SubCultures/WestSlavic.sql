-- ============================
-- Voivode (Great General)
-- ==============================
--==========================================================================================================================
-- ArtDefine_StrategicView
--==========================================================================================================================
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 			TileType,	Asset)
VALUES		('ART_DEF_UNIT_JFD_VOIVODE', 	'Unit', 	'sv_voivode.dds');
--==========================================================================================================================
-- ArtDefine_UnitInfos
--==========================================================================================================================			
INSERT INTO ArtDefine_UnitInfos 
			(Type, 							DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_JFD_VOIVODE'), 	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_GENERAL_KHAN');
--==========================================================================================================================
-- ArtDefine_UnitInfoMemberInfos
--==========================================================================================================================
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,					UnitMemberInfoType,						NumMembers)
SELECT		('ART_DEF_UNIT_JFD_VOIVODE'), 	('ART_DEF_UNIT_MEMBER_JFD_VOIVODE'), 	1
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_GENERAL_KHAN');
--==========================================================================================================================
-- ArtDefine_UnitMemberCombats
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_VOIVODE'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREATGENERAL_KHAN');
--==========================================================================================================================
-- ArtDefine_UnitMemberCombatWeapons
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_VOIVODE'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREATGENERAL_KHAN');
--==========================================================================================================================
-- ArtDefine_UnitMemberInfos
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 									Scale,  ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_VOIVODE'),	Scale,	ZOffset, Domain, ('Voivode_v2.fxsxml'),		MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_GREATGENERAL_KHAN');
--====================================================================================================

UPDATE Units SET
Moves = 2
WHERE Type = 'UNIT_CD_VOIVODE';

INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
VALUES
	('UNIT_CD_VOIVODE', 'PROMOTION_CD_VOIVODE'),
	('UNIT_CD_VOIVODE', 'PROMOTION_CD_VOIVODE_2');

--  Land Units within 2 tiles gain +20% [ICON_STRENGTH] Combat Strength when Defending, and heal 15 HP if they kill an enemy Unit. If stationed in a City, grants +25% [ICON_PRODUCTION] Production to Military Units.[NEWLINE]When a Voivode is near a City, the City gains 10% [ICON_STRENGTH] Combat Strength.

---------------------------------------------------------------------
-- Dwor (Gallery, Manor in EE)
---------------------------------------------------------------------

UPDATE Buildings SET
FreeBuildingThisCity = 'BUILDINGCLASS_OPERA_HOUSE',
Cost = Cost * 1.5  -- like Barbican
WHERE Type = 'BUILDING_CD_DWOR';

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CD_DWOR', 'YIELD_CULTURE', 2),
	('BUILDING_CD_DWOR', 'YIELD_FAITH', 2);

INSERT INTO Building_YieldFromPolicyUnlock
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CD_DWOR', 'YIELD_FOOD', 50),
	('BUILDING_CD_DWOR', 'YIELD_PRODUCTION', 50),
	('BUILDING_CD_DWOR', 'YIELD_CULTURE_LOCAL', 50);

INSERT INTO Building_YieldFromBorderGrowth
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CD_DWOR', 'YIELD_FOOD', 10),
	('BUILDING_CD_DWOR', 'YIELD_PRODUCTION', 10),
	('BUILDING_CD_DWOR', 'YIELD_GOLD', 10);

---------------------
-- clear their main-culture assignment 
---------------------
DELETE FROM Civilization_UnitClassOverrides WHERE CivilizationType IN (
SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SubCultureType = 'SUBCULTURE_JFD_CENTRAL_SLAVIC')
AND UnitType IN (
SELECT Type FROM Units WHERE IconAtlas IN ('CD_ECONOMIC_ATLAS', 'CD_MILITARY_ATLAS')
);

DELETE FROM Civilization_BuildingClassOverrides WHERE CivilizationType IN (
SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SubCultureType = 'SUBCULTURE_JFD_CENTRAL_SLAVIC')
AND BuildingType IN (
SELECT Type FROM Buildings WHERE IconAtlas IN ('CD_ECONOMIC_ATLAS', 'CD_MILITARY_ATLAS')
);

--------------------
-- and add the new ones 
--------------------
INSERT INTO Civilization_UnitClassOverrides
	(CivilizationType, UnitClassType, UnitType)
SELECT
	CivilizationType, 'UNITCLASS_GREAT_GENERAL', 'UNIT_CD_VOIVODE'
FROM Civilization_JFD_CultureTypes WHERE SubCultureType = 'SUBCULTURE_JFD_CENTRAL_SLAVIC';

INSERT INTO Civilization_BuildingClassOverrides
	(CivilizationType, BuildingClassType, BuildingType)
SELECT
	c.CivilizationType, b.BuildingClass, 'BUILDING_CD_DWOR'
FROM Civilization_JFD_CultureTypes c, Buildings b WHERE 
c.SubCultureType = 'SUBCULTURE_JFD_CENTRAL_SLAVIC'
AND
b.Type = 'BUILDING_CD_DWOR';

--------------------
-- compatibility with future west slavic custom civs
--------------------
CREATE TRIGGER WestSlavicComponents
AFTER INSERT ON Civilization_JFD_CultureTypes WHEN NEW.SubCultureType = 'SUBCULTURE_JFD_CENTRAL_SLAVIC'
BEGIN
	INSERT INTO Civilization_UnitClassOverrides
		(CivilizationType, UnitClassType, UnitType)
	SELECT
		NEW.CivilizationType, 'UNITCLASS_GREAT_GENERAL', 'UNIT_CD_VOIVODE';

	INSERT INTO Civilization_BuildingClassOverrides
		(CivilizationType, BuildingClassType, BuildingType)
	SELECT
		NEW.CivilizationType, BuildingClass, 'BUILDING_CD_DWOR'
	FROM Buildings WHERE Type = 'BUILDING_CD_DWOR';
END;

