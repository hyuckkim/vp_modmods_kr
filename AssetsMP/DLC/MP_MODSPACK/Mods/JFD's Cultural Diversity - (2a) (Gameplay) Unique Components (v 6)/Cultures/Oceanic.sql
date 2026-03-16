--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_StrategicView
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 			TileType,	Asset)
VALUES	('ART_DEF_UNIT_JFD_KAIMILOA',	'Unit', 	'sv_kaimiloa.dds');
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO ArtDefine_UnitInfos 
		(Type, 							DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_KAIMILOA',	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_CRUISER';	
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,					UnitMemberInfoType,						NumMembers)
SELECT	'ART_DEF_UNIT_JFD_KAIMILOA', 	'ART_DEF_UNIT_MEMBER_JFD_KAIMILOA',		NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_CRUISER';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombats
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_KAIMILOA',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_CRUISER';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_KAIMILOA',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_CRUISER';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 								Scale,	ZOffset, Domain, Model, 			   MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_KAIMILOA',	Scale,	ZOffset, Domain, 'IroncladBB.fxsxml',  MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_IRONCLAD';	
--==========================================================================================================================

UPDATE Units SET
CulExpOnDisbandUpgrade = 1,
RivalTerritory = 1
WHERE Type = 'UNIT_CD_KAIMILOA';

DELETE FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_CD_KAIMILOA';

REPLACE INTO Language_en_US 
	(Tag, Text)
SELECT
	'TXT_KEY_UNIT_CD_KAIMILOA_HELP', 'Requires the [ICON_CULTURE_JFD_OCEANIC] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_OCEANIC_SHORT_DESC}[ENDCOLOR] Cultural Group.[NEWLINE]When you gain your first Kaimiloa, all [ICON_MUSICIAN] Musicians generate +2 [ICON_GREAT_ADMIRAL] Great Admiral Points for 20 turns.';

--===============
-- event for Kaimiloa

INSERT INTO Events 
	(Type, Description, Help, EventClass, NumChoices, RandomChance, RequiredPolicy, IgnoresGlobalCooldown, EventCooldown, UnitClassRequired)
VALUES
	('EVENT_KAIMILOA', 'TXT_KEY_KAIMILOA_EVENT', 'TXT_KEY_KAIMILOA_EVENT_HELP', 'EVENT_CLASS_CIV_SPECIFIC', 1, 100, 'POLICY_CD_OCEANIC', 1, 0, 'UNITCLASS_CRUISER');

INSERT INTO EventChoices
	(Type, Description, Help, EventDuration, IsOneShot, Expires)
VALUES
	('EVENT_KAIMILOA_CHOICE', 'TXT_KEY_KAIMILOA_EVENT', 'TXT_KEY_KAIMILOA_EVENT_HELP', 20, 1, 1);

INSERT INTO Event_ParentEvents
	(EventChoiceType, EventType)
VALUES
	('EVENT_KAIMILOA_CHOICE', 'EVENT_KAIMILOA');

INSERT INTO EventChoice_SpecialistYieldChange
	(EventChoiceType, SpecialistType, YieldType, YieldChange)
VALUES
	('EVENT_KAIMILOA_CHOICE', 'SPECIALIST_MUSICIAN', 'YIELD_GREAT_ADMIRAL_POINTS', 2);

INSERT INTO Language_en_US
	(Tag, Text)
VALUES
	('TXT_KEY_KAIMILOA_EVENT', 'One Who Seeks Afar'),
	('TXT_KEY_KAIMILOA_EVENT_HELP', 'In training the ship''s crew we have pressganged an unusually high number of musically-inclined youngsters. They have formed an impressive military band.[NEWLINE][NEWLINE]For the next {4_Turns} all [ICON_MUSICIAN] Musicians generate +2 [ICON_GREAT_ADMIRAL] Great Admiral Points.');

--========================
-- Faikava (Grocer)
-- Sounds tasty
--========================

REPLACE INTO Language_en_US 
	(Tag, Text)
SELECT
	'TXT_KEY_BUILDING_CD_FAIKAVA_HELP', 'Requires the [ICON_CULTURE_JFD_OCEANIC] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_OCEANIC_SHORT_DESC}[ENDCOLOR] Cultural Group.';

INSERT INTO Building_InstantYieldFromWLTKDStart
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CD_FAIKAVA', 'YIELD_TOURISM', 100),
	('BUILDING_CD_FAIKAVA', 'YIELD_FOOD', 100);

UPDATE Buildings SET
SpecialistType = 'SPECIALIST_MUSICIAN',
SpecialistCount = 1,
NoUnhappfromXSpecialists = 1
WHERE Type = 'BUILDING_CD_FAIKAVA';

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CD_FAIKAVA', 'YIELD_FOOD', 3),
	('BUILDING_CD_FAIKAVA', 'YIELD_CULTURE', 1),
	('BUILDING_CD_FAIKAVA', 'YIELD_TOURISM', 2);



