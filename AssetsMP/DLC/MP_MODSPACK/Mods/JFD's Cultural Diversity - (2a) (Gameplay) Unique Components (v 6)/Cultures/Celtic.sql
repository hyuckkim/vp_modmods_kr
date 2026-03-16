--==========================================================================================================================
-- UNIT GRAPHICS
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 				TileType,	Asset)
VALUES	('ART_DEF_UNIT_JFD_HIGHLANDER', 	'Unit', 	'sv_Highlander.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------			
INSERT INTO ArtDefine_UnitInfos 
		(Type, 								DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_HIGHLANDER', 		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE	Type = 'ART_DEF_UNIT_RIFLEMAN';
------------------------------
-- ArtDefine_UnitInfos
------------------------------	
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,						UnitMemberInfoType,							NumMembers)
SELECT	'ART_DEF_UNIT_JFD_HIGHLANDER', 		'ART_DEF_UNIT_MEMBER_JFD_HIGHLANDER_1',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_RIFLEMAN';

--INSERT INTO ArtDefine_UnitInfoMemberInfos 	
--		(UnitInfoType,						UnitMemberInfoType,							NumMembers)
--SELECT	'ART_DEF_UNIT_JFD_HIGHLANDER', 		'ART_DEF_UNIT_MEMBER_JFD_HIGHLANDER_2',	NumMembers
--FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_RIFLEMAN';

--INSERT INTO ArtDefine_UnitInfoMemberInfos 	
--		(UnitInfoType,						UnitMemberInfoType,							NumMembers)
--SELECT	'ART_DEF_UNIT_JFD_HIGHLANDER', 		'ART_DEF_UNIT_MEMBER_JFD_HIGHLANDER_3',	NumMembers
--FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_RIFLEMAN';
------------------------------
-- ArtDefine_UnitInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_HIGHLANDER_1',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_HIGHLANDER_2',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_HIGHLANDER_3',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_HIGHLANDER_1',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_HIGHLANDER_2',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_HIGHLANDER_3',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';
------------------------------
-- ArtDefine_UnitInfos
------------------------------	
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale, ZOffset, Domain, Model, 				MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_HIGHLANDER_1',	Scale, ZOffset, Domain, 'celrm1.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale, ZOffset, Domain, Model, 				MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_HIGHLANDER_2',	Scale, ZOffset, Domain, 'celrm2.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale, ZOffset, Domain, Model, 				MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_HIGHLANDER_3',	Scale, ZOffset, Domain, 'celrm3.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';
--==========================================================================================================================	
--==========================================================================================================================	
-- Highlander (Gatling Gun [Marksman])
--========================

UPDATE Units SET
Combat = Combat + 4
WHERE Type = 'UNIT_CD_HIGHLANDER';

DELETE FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_CD_HIGHLANDER';

INSERT INTO UnitGameplay2DScripts 
	(UnitType, SelectionSound, FirstSelectionSound)
SELECT
	'UNIT_CD_HIGHLANDER', SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_RIFLEMAN';

DELETE FROM Unit_FreePromotions WHERE PromotionType = 'PROMOTION_COVERING_FIRE_1' AND UnitType = 'UNIT_CD_HIGHLANDER';

INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
VALUES
	('UNIT_CD_HIGHLANDER', 'PROMOTION_SKI_INFANTRY'),
	('UNIT_CD_HIGHLANDER', 'PROMOTION_CD_BAGPIPES');

UPDATE UnitPromotions SET NearbyEnemyCombatMod = -20, NearbyEnemyCombatRange = 2 WHERE Type = 'PROMOTION_CD_BAGPIPES';
INSERT INTO UnitPromotions_UnitCombatMods
	(PromotionType, UnitCombatType, Modifier)
VALUES
	('PROMOTION_CD_BAGPIPES', 'UNITCOMBAT_ARMOR', -50);

UPDATE Language_en_US SET
Text = 'Requires the [ICON_CULTURE_JFD_NORTHERN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_CD_CELTIC_SHORT_DESC}[ENDCOLOR] Cultural Group.'
WHERE Tag = 'TXT_KEY_UNIT_CD_HIGHLANDER_HELP';

--  Has more [ICON_STRENGTH] Combat Strength than the Gatling Gun it replaces. Instead of [COLOR_NEGATIVE_TEXT]Covering Fire I[ENDCOLOR] has the [COLOR_POSITIVE_TEXT]Bagpipes[ENDCOLOR] Promotion, which does not reduce attack against [COLOR_POSITIVE_TEXT]Cities[ENDCOLOR] and [COLOR_POSITIVE_TEXT]Fortified Units[ENDCOLOR], and shares a stronger defensive bonus with adjacent [COLOR_POSITIVE_TEXT]Friendly Units[ENDCOLOR]. Starts with the [COLOR_POSITIVE_TEXT]Highlander[ENDCOLOR] Promotion. 

-- =======================
-- Metalsmith (Workshop)
-- =======================

REPLACE INTO Language_en_US 
	(Tag, Text)
SELECT
	'TXT_KEY_BUILDING_CD_METALSMITH_HELP', 'Requires the [ICON_CULTURE_JFD_NORTHERN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_CD_CELTIC_SHORT_DESC}[ENDCOLOR] Cultural Group. ' || Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_BUILDING_WORKSHOP_HELP';

INSERT INTO Building_ImprovementYieldChanges
	(BuildingType, ImprovementType, YieldType, Yield)
VALUES
	('BUILDING_CD_METALSMITH', 'IMPROVEMENT_MINE', 'YIELD_CULTURE', 1),
	('BUILDING_CD_METALSMITH', 'IMPROVEMENT_MINE', 'YIELD_PRODUCTION', 1);

INSERT INTO Building_BuildingClassLocalYieldChanges
	(BuildingType, BuildingClassType, YieldType, YieldChange)
VALUES
	('BUILDING_CD_METALSMITH', 'BUILDINGCLASS_GALLERY', 'YIELD_CULTURE', 2),
	('BUILDING_CD_METALSMITH', 'BUILDINGCLASS_CONSTABLE', 'YIELD_PRODUCTION', 2),
	('BUILDING_CD_METALSMITH', 'BUILDINGCLASS_BANK', 'YIELD_GOLD', 2);

INSERT INTO Building_YieldChangesPerPop
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CD_METALSMITH', 'YIELD_GOLD', 25);

--incompatible with EE
--UPDATE Language_en_US SET
--Text = Replace(Text, '+1 [ICON_PRODUCTION] Production for every 4 [ICON_CITIZEN] Citizens in the City', 
--			'+1 [ICON_PRODUCTION] Production and [ICON_GOLD] Gold for every 4 [ICON_CITIZEN] Citizens in the City')
--WHERE Tag = 'TXT_KEY_BUILDING_CD_METALSMITH_HELP';

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CD_METALSMITH', 'YIELD_CULTURE', 1),
	('BUILDING_CD_METALSMITH', 'YIELD_GOLD', 1);

-- -----------------------
-- Metalsmith event
-- -----------------------
INSERT INTO CityEvents 
	(Type, EventClass, NumChoices, RandomChance, RequiredBuildingClass, RequiredPolicy, PrereqTech, IgnoresGlobalCooldown)
VALUES
	('CITY_EVENT_METALSMITH_1', 'EVENT_CLASS_CIV_SPECIFIC', 1, 100, 'BUILDINGCLASS_WINDMILL', 'POLICY_CD_CELTIC', NULL, 1),
	('CITY_EVENT_METALSMITH_2', 'EVENT_CLASS_CIV_SPECIFIC', 1, 100, 'BUILDINGCLASS_WINDMILL', 'POLICY_CD_CELTIC', NULL, 1),
	('CITY_EVENT_METALSMITH_3', 'EVENT_CLASS_CIV_SPECIFIC', 1, 100, 'BUILDINGCLASS_WINDMILL', 'POLICY_CD_CELTIC', NULL, 1),
	('CITY_EVENT_METALSMITH_4', 'EVENT_CLASS_CIV_SPECIFIC', 1, 100, 'BUILDINGCLASS_WINDMILL', 'POLICY_CD_CELTIC', NULL, 1),
	('CITY_EVENT_METALSMITH_5', 'EVENT_CLASS_CIV_SPECIFIC', 1, 100, 'BUILDINGCLASS_WINDMILL', 'POLICY_CD_CELTIC', 'TECH_INDUSTRIALIZATION', 1);

INSERT INTO CityEventChoices
	(Type, Description, Help, EventDuration)
VALUES
	('CITY_EVENT_METALSMITH_1_CHOICE', 'TXT_KEY_CITY_EVENT_METALSMITH', 'TXT_KEY_CITY_EVENT_METALSMITH_1_HELP', 9999),
	('CITY_EVENT_METALSMITH_2_CHOICE', 'TXT_KEY_CITY_EVENT_METALSMITH', 'TXT_KEY_CITY_EVENT_METALSMITH_2_HELP', 9999),
	('CITY_EVENT_METALSMITH_3_CHOICE', 'TXT_KEY_CITY_EVENT_METALSMITH', 'TXT_KEY_CITY_EVENT_METALSMITH_3_HELP', 9999),
	('CITY_EVENT_METALSMITH_4_CHOICE', 'TXT_KEY_CITY_EVENT_METALSMITH', 'TXT_KEY_CITY_EVENT_METALSMITH_4_HELP', 9999),
	('CITY_EVENT_METALSMITH_5_CHOICE', 'TXT_KEY_CITY_EVENT_METALSMITH', 'TXT_KEY_CITY_EVENT_METALSMITH_5_HELP', 9999);

INSERT INTO CityEvent_ParentEvents
	(CityEventChoiceType, CityEventType)
VALUES
	('CITY_EVENT_METALSMITH_1_CHOICE', 'CITY_EVENT_METALSMITH_1'),
	('CITY_EVENT_METALSMITH_2_CHOICE', 'CITY_EVENT_METALSMITH_2'),
	('CITY_EVENT_METALSMITH_3_CHOICE', 'CITY_EVENT_METALSMITH_3'),
	('CITY_EVENT_METALSMITH_4_CHOICE', 'CITY_EVENT_METALSMITH_4'),
	('CITY_EVENT_METALSMITH_5_CHOICE', 'CITY_EVENT_METALSMITH_5');

INSERT INTO CityEventChoice_ResourceQuantity
	(CityEventChoiceType, ResourceType, Quantity)
VALUES
	('CITY_EVENT_METALSMITH_1_CHOICE', 'RESOURCE_IRON', 1),
	('CITY_EVENT_METALSMITH_2_CHOICE', 'RESOURCE_COPPER', 1),
	('CITY_EVENT_METALSMITH_3_CHOICE', 'RESOURCE_SILVER', 1),
	('CITY_EVENT_METALSMITH_4_CHOICE', 'RESOURCE_GOLD', 1),
	('CITY_EVENT_METALSMITH_5_CHOICE', 'RESOURCE_ALUMINUM', 1);

INSERT INTO CityEvent_EventLinks
	(CityEventType, CityEventChoice, CheckOnlyEventCity, CheckForActive)
VALUES
	('CITY_EVENT_METALSMITH_1', 'CITY_EVENT_METALSMITH_2_CHOICE', 1, 0),
	('CITY_EVENT_METALSMITH_1', 'CITY_EVENT_METALSMITH_3_CHOICE', 1, 0),
	('CITY_EVENT_METALSMITH_1', 'CITY_EVENT_METALSMITH_4_CHOICE', 1, 0),
	('CITY_EVENT_METALSMITH_1', 'CITY_EVENT_METALSMITH_5_CHOICE', 1, 0),

	('CITY_EVENT_METALSMITH_2', 'CITY_EVENT_METALSMITH_1_CHOICE', 1, 0),
	('CITY_EVENT_METALSMITH_2', 'CITY_EVENT_METALSMITH_3_CHOICE', 1, 0),
	('CITY_EVENT_METALSMITH_2', 'CITY_EVENT_METALSMITH_4_CHOICE', 1, 0),
	('CITY_EVENT_METALSMITH_2', 'CITY_EVENT_METALSMITH_5_CHOICE', 1, 0),

	('CITY_EVENT_METALSMITH_3', 'CITY_EVENT_METALSMITH_1_CHOICE', 1, 0),
	('CITY_EVENT_METALSMITH_3', 'CITY_EVENT_METALSMITH_2_CHOICE', 1, 0),
	('CITY_EVENT_METALSMITH_3', 'CITY_EVENT_METALSMITH_4_CHOICE', 1, 0),
	('CITY_EVENT_METALSMITH_3', 'CITY_EVENT_METALSMITH_5_CHOICE', 1, 0),

	('CITY_EVENT_METALSMITH_4', 'CITY_EVENT_METALSMITH_1_CHOICE', 1, 0),
	('CITY_EVENT_METALSMITH_4', 'CITY_EVENT_METALSMITH_2_CHOICE', 1, 0),
	('CITY_EVENT_METALSMITH_4', 'CITY_EVENT_METALSMITH_3_CHOICE', 1, 0),
	('CITY_EVENT_METALSMITH_4', 'CITY_EVENT_METALSMITH_5_CHOICE', 1, 0),

	('CITY_EVENT_METALSMITH_5', 'CITY_EVENT_METALSMITH_1_CHOICE', 1, 0),
	('CITY_EVENT_METALSMITH_5', 'CITY_EVENT_METALSMITH_2_CHOICE', 1, 0),
	('CITY_EVENT_METALSMITH_5', 'CITY_EVENT_METALSMITH_3_CHOICE', 1, 0),
	('CITY_EVENT_METALSMITH_5', 'CITY_EVENT_METALSMITH_4_CHOICE', 1, 0);

INSERT INTO Language_en_US
	(Tag, Text)
VALUES
	('TXT_KEY_CITY_EVENT_METALSMITH', 'Artisanal Crafts'),
	('TXT_KEY_CITY_EVENT_METALSMITH_1_HELP', 'Local metalsmiths have come to prefer working with hard and durable metal.[NEWLINE][NEWLINE]Receive a copy of [ICON_RES_IRON] Iron.'),
	('TXT_KEY_CITY_EVENT_METALSMITH_2_HELP', 'Local metalsmiths have come to prefer ornaments developing a complex patina.[NEWLINE][NEWLINE]Receive a copy of [ICON_RES_COPPER] Copper.'),
	('TXT_KEY_CITY_EVENT_METALSMITH_3_HELP', 'Local metalsmiths have come to prefer pieces with a bright lustre.[NEWLINE][NEWLINE]Receive a copy of [ICON_RES_SILVER] Silver.'),
	('TXT_KEY_CITY_EVENT_METALSMITH_4_HELP', 'Local metalsmiths have come to prefer expense and opulence.[NEWLINE][NEWLINE]Receive a copy of [ICON_RES_GOLD] Gold.'),
	('TXT_KEY_CITY_EVENT_METALSMITH_5_HELP', 'Local metalsmiths have come to prefer a modern, lightweight material.[NEWLINE][NEWLINE]Receive a copy of [ICON_RES_ALUMINUM] Aluminum.');

UPDATE Language_en_US SET
Text = Replace(Text, 'Cultural Group. ', 'Cultural Group.[NEWLINE]Receive a copy of a random [COLOR_POSITIVE_TEXT]Metal Resource[ENDCOLOR]. ')
WHERE Tag = 'TXT_KEY_BUILDING_CD_METALSMITH_HELP';

