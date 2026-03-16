-- ============================
-- Tupamarista (Lancer)
-- revolutionary
-- ==============================
--=========================================================================================================================
-- UNIT/RESOURCE GRAPHICS
--=======================================================================================================================
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 					TileType,		Asset)
VALUES	('ART_DEF_UNIT_PG_LLANERO',				'Unit', 		'sv_tupamarista.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------			
INSERT INTO ArtDefine_UnitInfos (Type,DamageStates,Formation)
	SELECT	('ART_DEF_UNIT_PG_LLANERO'), DamageStates, Formation
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_LANCER');

INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType,UnitMemberInfoType,NumMembers)
	SELECT	('ART_DEF_UNIT_PG_LLANERO'), ('ART_DEF_UNIT_MEMBER_GRANCOLOMBIA_LLANERO'), NumMembers
	FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_LANCER');

INSERT INTO ArtDefine_UnitMemberCombats (UnitMemberType, EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
	SELECT	('ART_DEF_UNIT_MEMBER_GRANCOLOMBIA_LLANERO'), EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
	FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_LANCER');

INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
	SELECT ('ART_DEF_UNIT_MEMBER_GRANCOLOMBIA_LLANERO'), "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
	FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_LANCER');

INSERT INTO ArtDefine_UnitMemberInfos (Type, Scale, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
	SELECT	('ART_DEF_UNIT_MEMBER_GRANCOLOMBIA_LLANERO'), Scale, ZOffset, Domain, ('Llanero.fxsxml'), MaterialTypeTag, MaterialTypeSoundOverrideTag
	FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_LANCER');
--=========================================================================================================================
	
UPDATE Units SET
MoveAfterPurchase = 1,
Combat = Combat - 2,
Cost = Cost - 35,
FaithCost = FaithCost - 50
WHERE Type = 'UNIT_CD_TUPAMARISTA';

INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
VALUES
	('UNIT_CD_TUPAMARISTA', 'PROMOTION_MOVEMENT_TO_GENERAL'),
	('UNIT_CD_TUPAMARISTA', 'PROMOTION_CD_INKARRI'),
	('UNIT_CD_TUPAMARISTA', 'PROMOTION_SCAVENGER');

DELETE FROM Unit_BuildingClassPurchaseRequireds WHERE UnitType = 'UNIT_CD_TUPAMARISTA';

UPDATE Language_en_US SET
Text = 'Requires the [ICON_CULTURE_JFD_ANDEAN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_ANDEAN_SHORT_DESC}[ENDCOLOR] Cultural Group.'
WHERE Tag = 'TXT_KEY_UNIT_CD_TUPAMARISTA_HELP';

--  Is slightly weaker than the Lancer it replaces but is cheaper and does not require a Stable or Armory to purchase. Great Generals that are stacked with this Unit start the turn with an equal amount of [ICON_MOVES] Movement. Starts with the [COLOR_POSITIVE_TEXT]Scavenger[ENDCOLOR] Promotion, and the [COLOR_POSITIVE_TEXT]Inkarri[ENDCOLOR] Promotion, which grants [ICON_CULTURE] Culture and heals in an area when [ICON_RAZING] Pillaging.[NEWLINE][NEWLINE]Can move immediately after being purchased.

-- =======================
-- Yatiri  (Grocer)
-- =======================

REPLACE INTO Language_en_US 
	(Tag, Text)
SELECT
	'TXT_KEY_BUILDING_CD_YATIRI_HELP', 'Requires the [ICON_CULTURE_JFD_ANDEAN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_ANDEAN_SHORT_DESC}[ENDCOLOR] Cultural Group. '
FROM Language_en_US WHERE Tag = 'TXT_KEY_BUILDING_GROCER_HELP';

UPDATE Buildings SET
AlwaysHeal = 10,
UnlockedByBelief = 0,
FaithCost = 400
WHERE Type = 'BUILDING_CD_YATIRI';

INSERT INTO Building_YieldPerXTerrainTimes100
	(BuildingType, TerrainType, YieldType, Yield)
VALUES
	('BUILDING_CD_YATIRI', 'TERRAIN_MOUNTAIN', 'YIELD_FAITH', 50);

-- i hate this table.
INSERT INTO Building_ResourcePlotsToPlace
	(BuildingType, ResourceType, NumPlots, ResourceQuantityToPlace)
VALUES
	('BUILDING_CD_YATIRI', 'RESOURCE_COCA', 1, 1);

UPDATE Language_en_US SET
Text = Replace(Text, 'Cultural Group. ', 'Cultural Group.')
WHERE Tag = 'TXT_KEY_BUILDING_CD_YATIRI_HELP';
-- [NEWLINE]Place up to 1 copy of [ICON_RES_COCA] Coca near the City.
--  Land Units in this City heal [COLOR_POSITIVE_TEXT]10[ENDCOLOR] HP per turn, whether or not they take an action. City gains +1 [ICON_PEACE] Faith for every 2 Mountains within 3 tiles.

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CD_YATIRI', 'YIELD_FAITH', 2),
	('BUILDING_CD_YATIRI', 'YIELD_SCIENCE', 1),
	('BUILDING_CD_YATIRI', 'YIELD_CULTURE', 1);

INSERT INTO Building_ResourceYieldChanges
	(BuildingType,	ResourceType, YieldType, Yield)
SELECT
	a.Type, 'RESOURCE_COCA', b.Type, 1
FROM Buildings a, Yields b
WHERE a.BuildingClass  = 'BUILDINGCLASS_GROCER' AND
b.Type IN ('YIELD_FAITH', 'YIELD_SCIENCE');


