-- ============================
-- Boita (Trireme)
-- mini Nau
-- ==============================
--==========================================================================================================================
-- UNIT GRAPHICS
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 						TileType,	Asset)
VALUES	('ART_DEF_UNIT_GT_BOITA', 	'Unit', 	'sv_boita.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------	
INSERT INTO ArtDefine_UnitInfos (Type,DamageStates,Formation)
    SELECT  ('ART_DEF_UNIT_GT_BOITA'), 3, Formation
    FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_TRIREME');
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,								UnitMemberInfoType,										NumMembers)
SELECT	('ART_DEF_UNIT_GT_BOITA'),	('ART_DEF_UNIT_MEMBER_GT_BOITA'),		NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_TRIREME');
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,									EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	('ART_DEF_UNIT_MEMBER_GT_BOITA'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_TRIREME');
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,									"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_GT_BOITA'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_TRIREME');
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 	Scale,  ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_GT_BOITA'),	1.6*Scale,	ZOffset, Domain, 'kadatpadai.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_TRIREME');
--=========================================================================================================================

UPDATE Units SET
Cost = Cost + 20,
FaithCost = FaithCost + 50,
Combat = Combat + 3,
NumExoticGoods = 1,
CulExpOnDisbandUpgrade = 1
WHERE Type = 'UNIT_CD_BOITA';

REPLACE INTO Language_en_US 
	(Tag, Text)
SELECT
	'TXT_KEY_UNIT_CD_BOITA_HELP', 'Requires the [ICON_CULTURE_JFD_INDOCHINA] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_INDOCHINA_SHORT_DESC}[ENDCOLOR] Cultural Group.'
FROM Language_en_US WHERE Tag = 'TXT_KEY_UNIT_HELP_TRIREME';	

--  Is stronger and more expensive than the Trireme it replaces. Has an Exotic Cargo that it can sell when adjacent to a foreign tile, earning up to 400 [ICON_GOLD] Gold and 30 XP scaling with the distance from your [ICON_CAPITAL] Capital. When a Boita is disbanded or upgraded, receive [ICON_CULTURE] Culture equal to its total XP.

-- =======================
-- Floating Market (Market)
-- =======================

REPLACE INTO Language_en_US 
	(Tag, Text)
SELECT
	'TXT_KEY_BUILDING_CD_FLOATING_MARKET_HELP', 'Requires the [ICON_CULTURE_JFD_INDOCHINA] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_INDOCHINA_SHORT_DESC}[ENDCOLOR] Cultural Group. ' || Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_BUILDING_MARKET_HELP';

INSERT INTO Building_YieldFromInternalTR
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CD_FLOATING_MARKET', 'YIELD_FOOD', 4);

INSERT INTO Building_RiverPlotYieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CD_FLOATING_MARKET', 'YIELD_GOLD', 1);

UPDATE Language_en_US SET
Text = Replace(Text, 'Cultural Group. ', 'Cultural Group. +1 [ICON_GOLD] Gold on every tile next to a River. Lakes produce +1 [ICON_GOLD] Gold. Internal [ICON_FOOD] Food [ICON_INTERNATIONAL_TRADE] Trade Routes from this City generate +4 [ICON_FOOD] Food.[NEWLINE][NEWLINE]')
WHERE Tag = 'TXT_KEY_BUILDING_CD_FLOATING_MARKET_HELP';

INSERT INTO Building_LakePlotYieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CD_FLOATING_MARKET', 'YIELD_GOLD', 1);

INSERT INTO Building_ResourceYieldChanges
	(BuildingType, ResourceType, YieldType, Yield)
VALUES
	('BUILDING_CD_FLOATING_MARKET', 'RESOURCE_RICE', 'YIELD_GOLD', 1),
	('BUILDING_CD_FLOATING_MARKET', 'RESOURCE_MAIZE', 'YIELD_GOLD', 1),
	('BUILDING_CD_FLOATING_MARKET', 'RESOURCE_WHEAT', 'YIELD_GOLD', 1),
	('BUILDING_CD_FLOATING_MARKET', 'RESOURCE_BANANA', 'YIELD_FOOD', 1),
	('BUILDING_CD_FLOATING_MARKET', 'RESOURCE_FISH', 'YIELD_PRODUCTION', 1);

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CD_FLOATING_MARKET', 'YIELD_FOOD', 2),
	('BUILDING_CD_FLOATING_MARKET', 'YIELD_CULTURE', 1);


