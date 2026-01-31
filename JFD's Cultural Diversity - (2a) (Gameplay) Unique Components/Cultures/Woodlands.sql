-- ============================
-- Ma-har-o-luk'ti (Horseman and Knight)
-- no horses allowed
-- ==============================
--==========================================================================================================================
-- ArtDefine_StrategicView
--==========================================================================================================================
INSERT INTO ArtDefine_StrategicView
            (StrategicViewType,					TileType,   Asset)
VALUES      ('ART_DEF_UNIT_MC_LENAPE_MAHAROLUKTI',		'Unit',     'maharolukti_sv.dds');
--==========================================================================================================================
-- ArtDefine_UnitInfos
--==========================================================================================================================           
INSERT INTO ArtDefine_UnitInfos
            (Type,					DamageStates,   Formation)
SELECT      'ART_DEF_UNIT_MC_LENAPE_MAHAROLUKTI',	DamageStates,   Formation
FROM ArtDefine_UnitInfos WHERE  (Type = 'ART_DEF_UNIT_PIKEMAN');
--==========================================================================================================================
-- ArtDefine_UnitInfoMemberInfos
--==========================================================================================================================   
INSERT INTO ArtDefine_UnitInfoMemberInfos  
            (UnitInfoType,								UnitMemberInfoType,		NumMembers)
SELECT		'ART_DEF_UNIT_MC_LENAPE_MAHAROLUKTI',		'ART_DEF_UNIT_MEMBER_MC_LENAPE_MAHAROLUKTI',		NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE  (UnitInfoType = 'ART_DEF_UNIT_PIKEMAN');
--==========================================================================================================================
-- ArtDefine_UnitMemberCombats
--==========================================================================================================================
--Model 1
INSERT INTO ArtDefine_UnitMemberCombats
            (UnitMemberType,								EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT      'ART_DEF_UNIT_MEMBER_MC_LENAPE_MAHAROLUKTI',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_PIKEMAN');
--==========================================================================================================================
-- ArtDefine_UnitMemberCombatWeapons
--==========================================================================================================================
--Model 1
INSERT INTO ArtDefine_UnitMemberCombatWeapons  
            (UnitMemberType,								"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT     'ART_DEF_UNIT_MEMBER_MC_LENAPE_MAHAROLUKTI',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_PIKEMAN');
--==========================================================================================================================
-- ArtDefine_UnitMemberInfos
--==========================================================================================================================   
INSERT INTO ArtDefine_UnitMemberInfos  
            (Type,												Scale, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT      'ART_DEF_UNIT_MEMBER_MC_LENAPE_MAHAROLUKTI',		Scale, ZOffset, Domain, 'civ5_iropi1.fxsxml', MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_PIKEMAN');
--==========================================================================================================================

CREATE TRIGGER WoodlandsHorse
AFTER INSERT ON Civilization_JFD_CultureTypes WHEN NEW.CultureType = 'CULTURE_JFD_COLONIAL'
BEGIN
	INSERT INTO Civilization_UnitClassOverrides
		(CivilizationType, UnitClassType, UnitType)
	SELECT
		NEW.CivilizationType, 'UNITCLASS_KNIGHT', NULL
	FROM Civilization_JFD_CultureTypes WHERE CultureType = 'CULTURE_JFD_WOODLANDS';
END;

INSERT INTO Civilization_UnitClassOverrides
	(CivilizationType, UnitClassType, UnitType)
SELECT
	CivilizationType, 'UNITCLASS_KNIGHT', NULL
FROM Civilization_JFD_CultureTypes WHERE CultureType = 'CULTURE_JFD_WOODLANDS';

DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_CD_MAHAROLUKTI' AND PromotionType IN ('PROMOTION_NO_DEFENSIVE_BONUSES');

INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
VALUES
	('UNIT_CD_MAHAROLUKTI', 'PROMOTION_CD_STOMP');

UPDATE Units SET
Moves = 2,
IsMounted = 0,
Combat = 13,
Cost = 80,
ProductionCostAddedPerEra = 35,
UnitEraUpgrade = 1
WHERE Type = 'UNIT_CD_MAHAROLUKTI';

UPDATE Unit_ClassUpgrades SET UnitClassType = 'UNITCLASS_LANCER' WHERE UnitType = 'UNIT_CD_MAHAROLUKTI';

DELETE FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_CD_MAHAROLUKTI';

INSERT INTO Unit_EraCombatStrength 	
	(UnitType, 			EraType,			CombatStrength)
SELECT	'UNIT_CD_MAHAROLUKTI',	'ERA_CLASSICAL',	16 UNION ALL
SELECT	'UNIT_CD_MAHAROLUKTI',	'ERA_MEDIEVAL',		24 ;

REPLACE INTO Language_en_US 
	(Tag, Text)
SELECT
	'TXT_KEY_UNIT_CD_MAHAROLUKTI_HELP', 'Requires the [ICON_CULTURE_JFD_WOODLANDS] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_WOODLANDS_SHORT_DESC}[ENDCOLOR] Cultural Group.'
FROM Language_en_US WHERE Tag = 'TXT_KEY_UNIT_HELP_KNIGHT';	

--  Is slower and does not require [ICON_RES_HORSE] Horses like the Horseman or Knight it replaces; while it can gain defensive bonuses, it still counts as Mounted Unit for Promotions. Starts with the [COLOR_POSITIVE_TEXT]Stomp Dance[ENDCOLOR] Promotion that makes it much faster and stronger fighting near Rivers, and earns [ICON_INFLUENCE] Influence from XP.[NEWLINE][NEWLINE]To replace both Mounted Units, it has a [ICON_STRENGTH] Combat Strength and [ICON_PRODUCTION] Cost that increases with Era: gaining +3 [ICON_STRENGTH]/+35 [ICON_PRODUCTION] in the Classical and another +8 [ICON_STRENGTH]/+35 [ICON_PRODUCTION] in the Medieval.

-- =======================
-- Baggataway Field (Zoo)
-- =======================

REPLACE INTO Language_en_US 
	(Tag, Text)
SELECT
	'TXT_KEY_BUILDING_CD_BAGGATAWAY_HELP', 'Requires the [ICON_CULTURE_JFD_WOODLANDS] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_WOODLANDS_SHORT_DESC}[ENDCOLOR] Cultural Group. ' || Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_BUILDING_THEATRE_HELP';

UPDATE Buildings SET
MinorFriendshipChange = 10,
TrainedFreePromotion = 'PROMOTION_PROXENOS'
WHERE Type = 'BUILDING_CD_BAGGATAWAY';

INSERT INTO Building_TerrainYieldChanges
	(BuildingType, TerrainType, YieldType, Yield)
VALUES
	('BUILDING_CD_BAGGATAWAY', 'TERRAIN_PLAINS', 'YIELD_CULTURE', 1);

INSERT INTO Building_WLTKDYieldMod
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CD_BAGGATAWAY', 'YIELD_TOURISM', 15);

INSERT INTO Building_BonusFromAccomplishments
	(BuildingType, AccomplishmentType, UnitCombatType, UnitProductionModifier)
SELECT
	'BUILDING_CD_BAGGATAWAY', 'ACCOMPLISHMENT_DIPLOMATIC_MISSION_BOOST', Type, 1
FROM UnitCombatInfos WHERE Type IN ('UNITCOMBAT_RECON', 'UNITCOMBAT_GUN', 'UNITCOMBAT_ARCHER');

DELETE FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_CD_BAGGATAWAY'; -- or it doesnt show in TT

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CD_BAGGATAWAY', 'YIELD_TOURISM', 2),
	('BUILDING_CD_BAGGATAWAY', 'YIELD_CULTURE', 4),
	('BUILDING_CD_BAGGATAWAY', 'YIELD_FAITH', 2);
