--=============================
-- Herluf Trolle Class (Destroyer)
--=======================================================================================================================
-- ART DEFINES
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_StrategicView
------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO ArtDefine_StrategicView 
		(StrategicViewType, 						TileType,	Asset)
VALUES		('ART_DEF_UNIT_JFD_HERLUF_TROLLE_CLASS',	'Unit', 	'sv_trolle.dds');
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO ArtDefine_UnitInfos 
		(Type, 										DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_HERLUF_TROLLE_CLASS', 	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_BATTLESHIP'; 	
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,								UnitMemberInfoType,								NumMembers)
SELECT	'ART_DEF_UNIT_JFD_HERLUF_TROLLE_CLASS', 	'ART_DEF_UNIT_MEMBER_JFD_HERLUF_TROLLE_CLASS',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_BATTLESHIP';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,								EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_HERLUF_TROLLE_CLASS',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_BATTLESHIP';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,								"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_HERLUF_TROLLE_CLASS',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_BATTLESHIP';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO ArtDefine_UnitMemberInfos 	
		(Type, 											Scale, ZOffset, Domain, Model, 					     MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_HERLUF_TROLLE_CLASS',	Scale, ZOffset, Domain, 'Herluftrolleclass.fxsxml',  MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_BATTLESHIP';
--=======================================================================================================================

DELETE FROM Civilization_UnitClassOverrides WHERE CivilizationType = 'CIVILIZATION_DENMARK' AND UnitType = 'UNIT_LONGSHIP';

UPDATE Units SET MinorCivGift = 1 WHERE Type = 'UNIT_LONGSHIP';

INSERT INTO Civilization_UnitClassOverrides
	(CivilizationType, UnitClassType, UnitType)
VALUES
	('CIVILIZATION_DENMARK', 'UNITCLASS_DREADNOUGHT', 'UNIT_CD_TROLLE');

UPDATE Units SET
Combat = Combat + 10,
RangedCombat = RangedCombat + 5,
BaseLandAirDefense = BaseLandAirDefense + 5
--, WLTKDFromBirth = 1  -- only works for GPs sadly
--, Moves = 4
WHERE Type = 'UNIT_CD_TROLLE';

INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
VALUES
	('UNIT_CD_TROLLE', 'PROMOTION_TARGETING_1'),
	('UNIT_CD_TROLLE', 'PROMOTION_HARBOR_DEFENSE'), 
	('UNIT_CD_TROLLE', 'PROMOTION_SHALLOW_DRAFT'),
	('UNIT_CD_TROLLE', 'PROMOTION_CAN_MOVE_AFTER_ATTACKING');

/*
UPDATE Language_en_US SET
Text = 'Unique Danish Dreadnought. Has higher [ICON_RANGE_STRENGTH] Attack and significantly higher [ICON_STRENGTH] Melee and [ICON_AIRSTRIKE_DEFENSE] Air Defense, but only moves at [COLOR_NEGATIVE_TEXT]half speed[ENDCOLOR] in [COLOR_POSITIVE_TEXT]Ocean[ENDCOLOR] tiles. Can [COLOR_POSITIVE_TEXT]Move After Attacking[ENDCOLOR]. Starts with the [COLOR_POSITIVE_TEXT]Harbor Defense[ENDCOLOR] Promotion, which increases the [ICON_STRENGTH] Defense of adjacent Cities, and the [COLOR_POSITIVE_TEXT]Targeting I[ENDCOLOR] Promotion.'
WHERE Tag = 'TXT_KEY_UNIT_CD_TROLLE_HELP';
*/
