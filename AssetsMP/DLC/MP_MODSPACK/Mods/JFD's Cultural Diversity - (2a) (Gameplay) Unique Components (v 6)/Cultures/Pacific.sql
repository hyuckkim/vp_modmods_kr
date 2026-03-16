-- ============================
-- Txatkunee'xs (Spearman)
-- Killerwhale with Fins All Around
-- ==============================
--==========================================================================================================================
-- ArtDefine_StrategicView
--==========================================================================================================================
INSERT INTO ArtDefine_StrategicView
            (StrategicViewType,						TileType,   Asset)
VALUES      ('ART_DEF_UNIT_MC_HAIDA_TLUU_TSEEII',   'Unit',     'sv_txatkuneexs.dds');
--==========================================================================================================================
-- ArtDefine_UnitInfos
--==========================================================================================================================           
INSERT INTO ArtDefine_UnitInfos
            (Type,									DamageStates,   Formation)
SELECT      ('ART_DEF_UNIT_MC_HAIDA_TLUU_TSEEII'),	DamageStates,   Formation
FROM ArtDefine_UnitInfos WHERE  (Type = 'ART_DEF_UNIT_PIKEMAN');
--==========================================================================================================================
-- ArtDefine_UnitInfos
--==========================================================================================================================   
INSERT INTO ArtDefine_UnitInfoMemberInfos  
            (UnitInfoType,							UnitMemberInfoType,								NumMembers)
SELECT      ('ART_DEF_UNIT_MC_HAIDA_TLUU_TSEEII'),	('ART_DEF_UNIT_MEMBER_MC_HAIDA_TLUU_TSEEII'),	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_PIKEMAN');
--==========================================================================================================================
-- ArtDefine_UnitInfos
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberCombats
            (UnitMemberType,								EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT      ('ART_DEF_UNIT_MEMBER_MC_HAIDA_TLUU_TSEEII'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_PIKEMAN');
--==========================================================================================================================
-- ArtDefine_UnitMemberCombatWeapons
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberCombatWeapons  
            (UnitMemberType,								"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT      ('ART_DEF_UNIT_MEMBER_MC_HAIDA_TLUU_TSEEII'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_PIKEMAN');
--==========================================================================================================================
-- ArtDefine_UnitInfos
--==========================================================================================================================   
INSERT INTO ArtDefine_UnitMemberInfos  
            (Type,											Scale, ZOffset, Domain, Model,							MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT      ('ART_DEF_UNIT_MEMBER_MC_HAIDA_TLUU_TSEEII'),	Scale, ZOffset, Domain, ('pooky_tluu_tseeii.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_PIKEMAN');
--==========================================================================================================================
--==========================================================================================================================

INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
VALUES
	('UNIT_CD_TXATKUNEEXS', 'PROMOTION_CD_FIREWEED'),
	('UNIT_CD_TXATKUNEEXS', 'PROMOTION_AMPHIBIOUS');

INSERT INTO Unit_Builds
	(UnitType, BuildType)
VALUES
	('UNIT_CD_TXATKUNEEXS', 'BUILD_FISHING_BOATS_NO_KILL');

UPDATE Units SET
Combat = Combat + 1,
WorkRate = 100
WHERE Type = 'UNIT_CD_TXATKUNEEXS';

REPLACE INTO Language_en_US 
	(Tag, Text)
SELECT
	'TXT_KEY_UNIT_CD_TXATKUNEEXS_HELP', 'Requires the [ICON_CULTURE_JFD_PACIFIC] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_PACIFIC_SHORT_DESC}[ENDCOLOR] Cultural Group.'
FROM Language_en_US WHERE Tag = 'TXT_KEY_UNIT_HELP_SPEARMAN';	

--  Is stronger than the Spearman that it replaces, and can improve Sea Resources without being expended. Starts with the [COLOR_POSITIVE_TEXT]Amphibious[ENDCOLOR] Promotion and the [COLOR_POSITIVE_TEXT]Fireweed Salve[ENDCOLOR] Promotion that allows it to heal for more in [COLOR_YELLOW]Neutral[ENDCOLOR] and [COLOR_NEGATIVE_TEXT]Enemy[ENDCOLOR] Territory.

-- =======================
-- Potlatch House (Circus)
-- =======================

REPLACE INTO Language_en_US 
	(Tag, Text)
SELECT
	'TXT_KEY_BUILDING_CD_POTLATCH_HOUSE_HELP', 'Requires the [ICON_CULTURE_JFD_PACIFIC] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_PACIFIC_SHORT_DESC}[ENDCOLOR] Cultural Group. ' || Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_BUILDING_CIRCUS_HELP';

INSERT INTO Building_ResourceYieldChanges
	(BuildingType, ResourceType, YieldType, Yield)
VALUES
	('BUILDING_CD_POTLATCH_HOUSE', 'RESOURCE_FISH', 'YIELD_GOLD', 2),
	('BUILDING_CD_POTLATCH_HOUSE', 'RESOURCE_FISH', 'YIELD_FAITH', 1),
	('BUILDING_CD_POTLATCH_HOUSE', 'RESOURCE_DEER', 'YIELD_GOLD', 2),
	('BUILDING_CD_POTLATCH_HOUSE', 'RESOURCE_DEER', 'YIELD_TOURISM', 1);

-- -----------------------
-- Potlatch Ceremony event
-- -----------------------
DELETE FROM Building_InstantYield WHERE BuildingType = 'BUILDING_CD_POTLATCH_HOUSE';

INSERT INTO CityEvents 
	(Type, EventClass, NumChoices, RandomChance, RequiredBuildingClass, RequiredPolicy)
VALUES
	('CITY_EVENT_POTLATCH', 'EVENT_CLASS_CIV_SPECIFIC', 1, 100, 'BUILDINGCLASS_CIRCUS', 'POLICY_CD_PACIFIC');

INSERT INTO CityEventChoices
	(Type, Description, Help, EraScaling, EventDuration, EventDurationScaling)
VALUES
	('CITY_EVENT_POTLATCH_CHOICE', 'TXT_KEY_CITY_EVENT_POTLATCH', 'TXT_KEY_CITY_EVENT_POTLATCH_HELP', 1, 50, 1);

INSERT INTO CityEvent_ParentEvents
	(CityEventChoiceType, CityEventType)
VALUES
	('CITY_EVENT_POTLATCH_CHOICE', 'CITY_EVENT_POTLATCH');

INSERT INTO CityEventChoice_InstantYield
	(CityEventChoiceType, YieldType, Yield)
VALUES
	('CITY_EVENT_POTLATCH_CHOICE', 'YIELD_GOLD', -50),
	('CITY_EVENT_POTLATCH_CHOICE', 'YIELD_GOLDEN_AGE_POINTS', 25),
	('CITY_EVENT_POTLATCH_CHOICE', 'YIELD_CULTURE', 50);

INSERT INTO CityEventChoice_GreatPersonPoints
	(CityEventChoiceType, SpecialistType, Points)
VALUES
	('CITY_EVENT_POTLATCH_CHOICE', 'SPECIALIST_CIVIL_SERVANT', 25);

INSERT INTO Language_en_US
	(Tag, Text)
VALUES
	('TXT_KEY_CITY_EVENT_POTLATCH', 'Potlatch Ceremony'),
	('TXT_KEY_CITY_EVENT_POTLATCH_HELP', 'A wealthy numaym has hosted a lavish gathering in the Potlatch House. {2_InstantYield} and [ICON_DIPLOMAT] Great Diplomat Points.');

UPDATE Language_en_US SET
Text = Text || '[NEWLINE]Every 50 turns, gain 50 [ICON_CULTURE] Culture, 25 [ICON_GOLDEN_AGE] Golden Age Points and [ICON_DIPLOMAT] Great Diplomat Points at the [COLOR_NEGATIVE_TEXT]cost[ENDCOLOR] of 50 [ICON_GOLD] Gold, scaling with Era.'
WHERE Tag = 'TXT_KEY_BUILDING_CD_POTLATCH_HOUSE_HELP';

