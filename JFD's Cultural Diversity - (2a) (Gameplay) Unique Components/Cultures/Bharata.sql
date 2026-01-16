-- ============================
-- Sepoy (Musketman)
-- cheap
-- ==============================
------------------------------
-- ArtDefine_UnitInfos
------------------------------		
INSERT INTO ArtDefine_UnitInfos 
			(Type, 								DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_MC_MARATHAN_SEPOY'), 		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_U_OTTOMAN_JANISSARY');
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,						UnitMemberInfoType,						NumMembers)
SELECT		('ART_DEF_UNIT_MC_MARATHAN_SEPOY'), 		('ART_DEF_UNIT_MEMBER_MC_MARATHAN_SEPOY'), 	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_U_OTTOMAN_JANISSARY');
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_MC_MARATHAN_SEPOY'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_OTTOMAN_JANISSARY');
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_MC_MARATHAN_SEPOY'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_OTTOMAN_JANISSARY');
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 										Scale, ZOffset, Domain, Model, 				MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_MC_MARATHAN_SEPOY'),	Scale, ZOffset, Domain, ('Sepoy.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_U_OTTOMAN_JANISSARY');
------------------------------
-- ArtDefine_StrategicView
------------------------------
INSERT OR REPLACE INTO ArtDefine_StrategicView 
			(StrategicViewType, 					TileType,	Asset)
SELECT		('ART_DEF_UNIT_MC_MARATHAN_SEPOY'), 	TileType, 	('sv_sepoy.dds')
FROM ArtDefine_StrategicView WHERE (StrategicViewType = 'ART_DEF_UNIT_U_OTTOMAN_JANISSARY');
--===================================================================

UPDATE Units SET
Combat = Combat + 3
WHERE Type = 'UNIT_CD_SEPOY';

INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
VALUES
	('UNIT_CD_SEPOY', 'PROMOTION_CD_IZZAT');

UPDATE Language_en_US SET
Text = 'Requires the [ICON_CULTURE_JFD_BHARATA] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_BHARATA_SHORT_DESC}[ENDCOLOR] Cultural Group.'
WHERE Tag = 'TXT_KEY_UNIT_CD_SEPOY_HELP';

--  Has higher [ICON_STRENGTH] Combat Strength than the Musketman it replaces. Starts with the [COLOR_POSITIVE_TEXT]Izzat[ENDCOLOR] Promotion, which randomly assigns one of four [COLOR_POSITIVE_TEXT]Caste Promotions[ENDCOLOR] after the first combat; gain [ICON_RANGE_STRENGTH] Attack based on how many other Units of that Caste have attacked in the same turn; Cities and Fortifications gain yields when a Unit with a Caste Promotion is stationed there.

-- =======================
-- Ghat (Bath)
-- =======================

REPLACE INTO Language_en_US 
	(Tag, Text)
SELECT
	'TXT_KEY_BUILDING_CD_GHAT_HELP', 'Requires the [ICON_CULTURE_JFD_BHARATA] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_BHARATA_SHORT_DESC}[ENDCOLOR] Cultural Group.';

-- give all bharata civs river bias
REPLACE INTO Civilization_Start_Along_River
	(CivilizationType, StartAlongRiver)
SELECT
	CivilizationType, 1 
FROM Civilization_JFD_CultureTypes WHERE CultureType = 'CULTURE_JFD_BHARATA';

UPDATE Buildings SET
FreshWater = 1
WHERE Type = 'BUILDING_CD_GHAT';

--UPDATE Language_en_US SET
--Text = Replace(Text, 'Can only be built in a City next to fresh water.', 'Can only be built in a City next to a River.')
--WHERE Tag = 'TXT_KEY_BUILDING_CD_GHAT_HELP';

--INSERT INTO Building_YieldChangeWorldWonder
--	(BuildingType, YieldType, Yield)
--VALUES
--	('BUILDING_CD_GHAT', 'YIELD_GOLD', 1),
--	('BUILDING_CD_GHAT', 'YIELD_CULTURE', 1);

INSERT INTO Building_BuildingClassLocalYieldChanges
	(BuildingType, BuildingClassType, YieldType, YieldChange)
SELECT
	'BUILDING_CD_GHAT', a.BuildingClass, b.Type, 1
FROM Buildings a, Yields b WHERE b.Type IN ('YIELD_GOLD', 'YIELD_CULTURE')
AND a.Cost = -1 AND a.FaithCost > 0;

INSERT INTO Building_RiverPlotYieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CD_GHAT', 'YIELD_FAITH', 1);

DELETE FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_CD_GHAT';

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CD_GHAT', 'YIELD_FAITH', 1),
	('BUILDING_CD_GHAT', 'YIELD_GOLD', 1),
	('BUILDING_CD_GHAT', 'YIELD_CULTURE', 2);
