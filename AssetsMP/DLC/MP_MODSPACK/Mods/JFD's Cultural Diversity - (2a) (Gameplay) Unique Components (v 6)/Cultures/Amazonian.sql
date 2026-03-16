--=======================================
-- Curare Dartblower (Chariot Archer)
-- fast and debuff
--=======================================
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType,		TileType,		Asset)
VALUES	('ART_DEF_UNIT_PG_GUARANI',		'Unit', 		'sv_dartblower.dds');
------------------------
-- ArtDefine_UnitMemberInfos
------------------------
-- These art defines are from an older version, so they are not as well ordered as the rest of this doc xD
INSERT INTO ArtDefine_UnitInfos (Type,DamageStates,Formation)
	SELECT	('ART_DEF_UNIT_PG_GUARANI'), DamageStates, 'LooseCivilian'
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_ARCHER');

INSERT INTO ArtDefine_UnitInfoMemberInfos 
	(UnitInfoType, UnitMemberInfoType, NumMembers)
SELECT
	'ART_DEF_UNIT_PG_GUARANI', 'ART_DEF_UNIT_MEMBER_GUARANI', NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_ARCHER';

INSERT INTO ArtDefine_UnitMemberCombats (UnitMemberType, EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
	SELECT	('ART_DEF_UNIT_MEMBER_GUARANI'), EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
	FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_ARCHER');

INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
	SELECT ('ART_DEF_UNIT_MEMBER_GUARANI'), "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
	FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_ARCHER');

INSERT INTO ArtDefine_UnitMemberInfos (Type, Scale, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
	SELECT	('ART_DEF_UNIT_MEMBER_GUARANI'), Scale, ZOffset, Domain, ('guarani.fxsxml'), MaterialTypeTag, MaterialTypeSoundOverrideTag
	FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_ARCHER');	
--=========================================================================================================================

UPDATE Units SET
Moves = 2,
RangedCombat = RangedCombat + 1,
IsMounted = 0
WHERE Type = 'UNIT_CD_CURARE_DART';

DELETE FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_CD_CURARE_DART';

DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_CD_CURARE_DART' AND PromotionType IN ('PROMOTION_BEAM_AXLE', 'PROMOTION_NO_DEFENSIVE_BONUSES');

INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
VALUES
	('UNIT_CD_CURARE_DART', 'PROMOTION_CD_AMAZONIAN'),
	('UNIT_CD_CURARE_DART', 'PROMOTION_CD_DARTS');

REPLACE INTO Language_en_US 
	(Tag, Text)
SELECT
	'TXT_KEY_UNIT_CD_CURARE_DART_HELP', 'Requires the [ICON_CULTURE_JFD_AMAZONIAN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_AMAZONIAN_SHORT_DESC}[ENDCOLOR] Cultural Group.'
FROM Language_en_US WHERE Tag = 'TXT_KEY_UNIT_HELP_CHARIOR_ARCHER';	

-- Has one higher ranged attack than the Chariot Archer that it replaces, and does not suffer the same penalties. Has the [COLOR_POSITIVE_TEXT]Blowpipe[ENDCOLOR] Promotion, which inflicts the [COLOR_NEGATIVE_TEXT]Venom[ENDCOLOR] Plague, reducing Healing. Starts with the [COLOR_POSITIVE_TEXT]Rainforest Hunter[ENDCOLOR] Promotion which increases [ICON_STRENGTH] Combat Strength and boosts [ICON_MOVES] Movement in [COLOR_POSITIVE_TEXT]Jungle[ENDCOLOR].

--===========================
-- Casava Pit (Granary)
--===========================
REPLACE INTO Language_en_US 
	(Tag, Text)
SELECT
	'TXT_KEY_BUILDING_CD_CASSAVA_PIT_HELP', 'Requires the [ICON_CULTURE_JFD_AMAZONIAN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_AMAZONIAN_SHORT_DESC}[ENDCOLOR] Cultural Group. ' || Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_BUILDING_GRANARY_HELP';

UPDATE Buildings SET
EnhancedYieldTech = 'TECH_REFRIGERATION',
FoodKept = FoodKept + 5
WHERE Type = 'BUILDING_CD_CASSAVA_PIT'; 

INSERT INTO Building_TechEnhancedYieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CD_CASSAVA_PIT', 'YIELD_GOLD', 8),	
	('BUILDING_CD_CASSAVA_PIT', 'YIELD_TOURISM', 8);

INSERT INTO Building_ResourceYieldChanges
	(BuildingType, ResourceType, YieldType, Yield)
SELECT
	'BUILDING_CD_CASSAVA_PIT', ResourceType, 'YIELD_CULTURE', 1
FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_GRANARY';

DELETE FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_CD_CASSAVA_PIT';

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CD_CASSAVA_PIT', 'YIELD_FOOD', 4);  -- has 1 already

