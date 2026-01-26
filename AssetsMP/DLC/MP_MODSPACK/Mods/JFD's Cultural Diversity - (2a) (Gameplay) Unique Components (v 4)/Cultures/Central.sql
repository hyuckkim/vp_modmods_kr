-- =============================================================
-- Slaganz (Warrior)
-- Barbarians are friends, not food
--==========================================================================================================================
-- ArtDefine_UnitInfos
--==========================================================================================================================
INSERT INTO ArtDefine_UnitInfos 
			(Type, 							DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_JFD_SLAGANZ'),	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT__WARRIOR');
--==========================================================================================================================
-- ArtDefine_UnitInfoMemberInfos
--==========================================================================================================================
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,					UnitMemberInfoType,						NumMembers)
SELECT		('ART_DEF_UNIT_JFD_SLAGANZ'),	('ART_DEF_UNIT_JFD_MEMBER_SLAGANZ'),	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT__WARRIOR');
--==========================================================================================================================
-- ArtDefine_UnitMemberCombats
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_JFD_MEMBER_SLAGANZ'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_WARRIOR');
--==========================================================================================================================
-- ArtDefine_UnitMemberCombatWeapons
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_JFD_MEMBER_SLAGANZ'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_WARRIOR');
--==========================================================================================================================
-- ArtDefine_UnitMemberInfos
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 									Scale,  ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_JFD_MEMBER_SLAGANZ'),	Scale,	ZOffset, Domain, ('BearWarrior.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_WARRIOR');
--==========================================================================================================================
INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
  VALUES ('ART_DEF_UNIT_JFD_SLAGANZ', 'Unit', 'sv_slaganz.dds');
-- ======================================================================

UPDATE Units SET
Combat = Combat + 1,
PolicyType = NULL,  -- cant get a free one without this, but for a unit we dont need it
RivalTerritory = 1
WHERE Type = 'UNIT_CD_SLAGANZ';

INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
VALUES
	('UNIT_CD_SLAGANZ', 'PROMOTION_CD_WARCHIEF');

UPDATE Language_en_US SET
Text = 'Requires the [ICON_CULTURE_JFD_CENTRAL] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_CENTRAL_SHORT_DESC}[ENDCOLOR] Cultural Group.'
WHERE Tag = 'TXT_KEY_UNIT_CD_SLAGANZ_HELP';

--  Is slightly stronger than the Warrior that it replaces. Has the [COLOR_POSITIVE_TEXT]Warchief[ENDCOLOR] Promotion that increases [ICON_STRENGTH] Combat Strength within 3 tiles of [COLOR_POSITIVE_TEXT]Friendly[ENDCOLOR] Cities, and when attacking [COLOR_POSITIVE_TEXT]Fortified Units[ENDCOLOR]. Can enter [COLOR_YIELD_FOOD]Rival Territory[ENDCOLOR]. 

--Adjacent Enemy Units that start their turn below [COLOR_NEGATIVE_TEXT]35 HP[ENDCOLOR] convert to [ICON_TEAM_2] Barbarians. When defeating Barbarians you gain [ICON_FOOD] Food and [ICON_CULTURE_LOCAL] Border Growth Points.

-- =======================
-- Teutonic Order (Heroic Epic)
-- =======================
REPLACE INTO Language_en_US 
	(Tag, Text)
SELECT
	'TXT_KEY_BUILDING_CD_TEUTONIC_ORDER_HELP', 'Requires the [ICON_CULTURE_JFD_CENTRAL] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_CENTRAL_SHORT_DESC}[ENDCOLOR] Cultural Group. ' || Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_BUILDING_HEROIC_EPIC_HELP';

UPDATE Buildings SET
GlobalDefenseMod = 10,
CitySupplyFlatGlobal = 1,
FreePromotion = 'PROMOTION_CD_TEUTONIC',
NumCityCostMod = 10
WHERE Type = 'BUILDING_CD_TEUTONIC_ORDER';

INSERT INTO Building_BuildingClassYieldChanges
	(BuildingType,	BuildingClassType,	YieldType,	YieldChange)
VALUES			
	('BUILDING_CD_TEUTONIC_ORDER', 'BUILDINGCLASS_BARRACKS',  'YIELD_FAITH', 2);

--INSERT INTO Building_BuildingClassYieldChanges
--	(BuildingType,	BuildingClassType,	YieldType,	YieldChange)
--SELECT			
--	'BUILDING_CD_TEUTONIC_ORDER', BuildingClass,  'YIELD_PRODUCTION', 1
--FROM Buildings WHERE Cost = -1 AND FaithCost > 0 
--UNION ALL
--SELECT			
--	'BUILDING_CD_TEUTONIC_ORDER', BuildingClass,  'YIELD_GOLD', 1
--FROM Buildings WHERE Cost = -1 AND FaithCost > 0;

-- and all Buildings that must be purchased with [ICON_PEACE] Faith generate +1 [ICON_PRODUCTION] Production and [ICON_GOLD] Gold.

--INSERT INTO Building_YieldFromVictoryGlobal
--	(BuildingType, YieldType, Yield)
--VALUES	
--	('BUILDING_CD_TEUTONIC_ORDER', 'YIELD_FAITH', 15);

UPDATE Language_en_US SET
Text = Replace(Text, 'Cultural Group. ', 'Cultural Group.')
WHERE Tag = 'TXT_KEY_BUILDING_CD_TEUTONIC_ORDER_HELP';

-- +10% [ICON_STRENGTH] Defense and +1 [ICON_SILVER_FIST] Military Supply in all Cities.  All Barracks in the Empire generate +2 [ICON_PEACE] Faith.[NEWLINE][NEWLINE]All Melee and Mounted Units in the Empire receive the [COLOR_POSITIVE_TEXT]General Chapter[ENDCOLOR] Promotion, adding [ICON_PRODUCTION] Production and [ICON_GOLD] Gold to Cities and Fortifications in which they are stationed, gaining [ICON_PEACE] Faith from XP, and [ICON_STRENGTH] Combat Strength against Barbarians.[NEWLINE][NEWLINE]

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CD_TEUTONIC_ORDER', 'YIELD_CULTURE', 1),
	('BUILDING_CD_TEUTONIC_ORDER', 'YIELD_PRODUCTION', 1),
	('BUILDING_CD_TEUTONIC_ORDER', 'YIELD_FAITH', 1);

