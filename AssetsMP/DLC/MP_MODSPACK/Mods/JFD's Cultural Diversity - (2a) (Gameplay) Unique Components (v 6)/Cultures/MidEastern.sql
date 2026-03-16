-- ============================
-- Baglah (Caravel)
-- Highly mobile anti-ship
-- ==============================
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 				TileType,	Asset)
VALUES	('ART_DEF_UNIT_MC_BAGHLAH', 	'Unit', 	'sv_baghlah.dds');
--==========================================================================================================================
-- ArtDefine_UnitInfos
--==========================================================================================================================			
INSERT INTO ArtDefine_UnitInfos 
			(Type, 							DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_MC_BAGHLAH'),	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE	(Type = 'ART_DEF_UNIT_CARAVEL');
--==========================================================================================================================
-- ArtDefine_UnitInfoMemberInfos
--==========================================================================================================================	
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,					UnitMemberInfoType,					NumMembers)
SELECT		('ART_DEF_UNIT_MC_BAGHLAH'), 	('ART_DEF_UNIT_MEMBER_MC_BAGHLAH'),	1
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_CARAVEL');
--==========================================================================================================================
-- ArtDefine_UnitMemberInfos
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 				Scale,  ZOffset, Domain, Model, 		MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_MC_BAGHLAH'),	Scale,	ZOffset, Domain, ('baghlah.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_CARAVEL');
--==========================================================================================================================
-- ArtDefine_UnitMemberCombats
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_MC_BAGHLAH'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_CARAVEL');
--==========================================================================================================================
-- ArtDefine_UnitMemberCombatWeapons
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_MC_BAGHLAH'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_CARAVEL');
--==========================================================================================================================

UPDATE Units SET
Combat = Combat + 1,
MoveAfterPurchase = 1
WHERE Type = 'UNIT_CD_BAGHLAH';

INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
VALUES
	('UNIT_CD_BAGHLAH', 'PROMOTION_CAN_MOVE_AFTER_ATTACKING'),
	('UNIT_CD_BAGHLAH', 'PROMOTION_BOARDING_PARTY_1'),
	('UNIT_CD_BAGHLAH', 'PROMOTION_PIRACY');

REPLACE INTO Language_en_US 
	(Tag, Text)
SELECT
	'TXT_KEY_UNIT_CD_BAGHLAH_HELP', 'Requires the [ICON_CULTURE_JFD_MID_EASTERN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_MID_EASTERN_SHORT_DESC}[ENDCOLOR] Cultural Group.'
FROM Language_en_US WHERE Tag = 'TXT_KEY_UNIT_HELP_CARAVEL';		

--  Is slightly stronger than the Caravel that it replaces and can move after attacking. Starts with the [COLOR_POSITIVE_TEXT]Piracy[ENDCOLOR] Promotion, gaining [ICON_GOLD] Gold from defeating Units and attacking Cities.

-- =======================
-- Petrochemical Plant (Refinery)
-- =======================

REPLACE INTO Language_en_US 
	(Tag, Text)
SELECT
	'TXT_KEY_BUILDING_CD_PETROCHEMICAL_PLANT_HELP', 'Requires the [ICON_CULTURE_JFD_MID_EASTERN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_MID_EASTERN_SHORT_DESC}[ENDCOLOR] Cultural Group.';

INSERT INTO Building_ImprovementYieldChanges
	(BuildingType, ImprovementType, YieldType, Yield)
VALUES
	('BUILDING_CD_PETROCHEMICAL_PLANT', 'IMPROVEMENT_WELL', 'YIELD_GOLD', 4),
	('BUILDING_CD_PETROCHEMICAL_PLANT', 'IMPROVEMENT_WELL', 'YIELD_SCIENCE', 4),
	('BUILDING_CD_PETROCHEMICAL_PLANT', 'IMPROVEMENT_OFFSHORE_PLATFORM', 'YIELD_GOLD', 4),
	('BUILDING_CD_PETROCHEMICAL_PLANT', 'IMPROVEMENT_OFFSHORE_PLATFORM', 'YIELD_SCIENCE', 4);

INSERT INTO Building_ResourcePlotsToPlace
	(BuildingType, ResourceType, NumPlots, ResourceQuantityToPlace)
VALUES
	('BUILDING_CD_PETROCHEMICAL_PLANT', 'RESOURCE_OIL', 2, 2);

UPDATE Buildings SET
TradeRouteRecipientBonus = 5,
TradeRouteTargetBonus = 5
WHERE Type = 'BUILDING_CD_PETROCHEMICAL_PLANT';

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CD_PETROCHEMICAL_PLANT', 'YIELD_GOLD', 3),
	('BUILDING_CD_PETROCHEMICAL_PLANT', 'YIELD_SCIENCE', 3);
