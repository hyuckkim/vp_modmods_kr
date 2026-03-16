-- ============================
-- Arcuballistarium (Crossbowman)
-- early unlock
-- ==============================
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 				TileType,	Asset)
VALUES	('ART_DEF_UNIT_DMS_GASTRAPHETES',	'Unit', 	'sv_gastraphetes.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------	
INSERT INTO ArtDefine_UnitInfos 
		(Type, 										DamageStates,	Formation)
SELECT	('ART_DEF_UNIT_DMS_GASTRAPHETES'),			DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_COMPOSITE_BOWMAN');
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,								UnitMemberInfoType,								NumMembers)
SELECT	('ART_DEF_UNIT_DMS_GASTRAPHETES'),			('ART_DEF_UNIT_MEMBER_DMS_GASTRAPHETES'),		NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_COMPOSITE_BOWMAN');
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,								EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	('ART_DEF_UNIT_MEMBER_DMS_GASTRAPHETES'),		EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_COMPOSITE_BOWMAN');
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,								"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_DMS_GASTRAPHETES'),		"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_COMPOSITE_BOWMAN');
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 											Scale,  ZOffset, Domain, Model,							MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_DMS_GASTRAPHETES'),		Scale,	ZOffset, Domain, ('Crossbowman_Rome.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_COMPOSITE_BOWMAN');
--==========================================================================================================================	

UPDATE Units SET
PrereqTech = 'TECH_PHYSICS',
Cost = Cost - 30,
FaithCost = FaithCost - 50,
Combat = Combat - 1,
RangedCombat = RangedCombat - 1
WHERE Type = 'UNIT_CD_ARCU';

INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
VALUES
	('UNIT_CD_ARCU', 'PROMOTION_CD_ARCU');

UPDATE CustomModOptions SET Value = 1 WHERE Name='PROMOTIONS_IMPROVEMENT_BONUS';

UPDATE Language_en_US SET
Text = 'Requires the [ICON_CULTURE_JFD_CLASSICAL] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_CLASSICAL_SHORT_DESC}[ENDCOLOR] Cultural Group.'
WHERE Tag = 'TXT_KEY_UNIT_CD_ARCU_HELP';

--  Unlocks earlier, is cheaper, and is slightly weaker than the Crossbowman it replaces. Starts with the [COLOR_POSITIVE_TEXT]Vantage[ENDCOLOR] Promotion, which increases [ICON_VISION] Sight, and increases [ICON_STRENGTH] Combat Strength when [COLOR_POSITIVE_TEXT]within 1 tile of a Fort or Friendly City[ENDCOLOR] (stacking).

-- =======================
-- National Exhibit (Hermitage)
-- =======================

REPLACE INTO Language_en_US 
	(Tag, Text)
SELECT
	'TXT_KEY_BUILDING_CD_NATIONAL_EXHIBIT_HELP', 'Requires the [ICON_CULTURE_JFD_CLASSICAL] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_CLASSICAL_SHORT_DESC}[ENDCOLOR] Cultural Group.';

INSERT INTO Building_BuildingClassYieldChanges
	(BuildingType, BuildingClassType, YieldType, YieldChange)
VALUES
	('BUILDING_CD_NATIONAL_EXHIBIT', 'BUILDINGCLASS_MUSEUM', 'YIELD_GOLDEN_AGE_POINTS', 3),
	('BUILDING_CD_NATIONAL_EXHIBIT', 'BUILDINGCLASS_GALLERY', 'YIELD_GOLD', 3);

INSERT INTO Building_GreatWorkYieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CD_NATIONAL_EXHIBIT', 'YIELD_TOURISM', 1);

UPDATE Buildings SET 
FreeBuildingThisCity = 'BUILDINGCLASS_MUSEUM',
GreatWorkCount = 4,
ThemingBonusHelp = 'TXT_KEY_THEMING_BONUS_CD_NATIONAL_EXHIBIT_HELP',
BoredomFlatReductionGlobal = 1,
NumCityCostMod = 10
WHERE Type = 'BUILDING_CD_NATIONAL_EXHIBIT';

INSERT INTO Language_en_US
	(Tag, Text)
VALUES
	('TXT_KEY_THEMING_BONUS_CD_NATIONAL_EXHIBIT_F', 'City of Marble'),  -- all artifacts
	('TXT_KEY_THEMING_BONUS_CD_NATIONAL_EXHIBIT_FC', 'Heritage of Genius'),  -- all artifacts consec
	('TXT_KEY_THEMING_BONUS_CD_NATIONAL_EXHIBIT_A', 'Great Parade'),  -- all art
	('TXT_KEY_THEMING_BONUS_CD_NATIONAL_EXHIBIT_AC', 'Patronage of Ages'),  -- all art consec
	('TXT_KEY_THEMING_BONUS_CD_NATIONAL_EXHIBIT_AF', 'Fulcrum of the Renaissance'),  -- art and artifact
	('TXT_KEY_THEMING_BONUS_CD_NATIONAL_EXHIBIT_AFC', 'Cradle of Western Civilization'),  -- art and artifact consec
	('TXT_KEY_THEMING_BONUS_CD_NATIONAL_EXHIBIT_HELP', 'To maximize your bonus, make sure the Great Work Slots are filled with 2 Artifacts and 2 Works of Art created by you and from consecutive Eras.');

-- the order of these entries matters
INSERT INTO Building_ThemingBonuses
	(BuildingType, Description, Bonus, 
	SameEra, UniqueEras, MustBeArt, MustBeArtifact, MustBeEqualArtArtifact, 
	RequiresOwner, RequiresAnyButOwner, RequiresSamePlayer, RequiresUniquePlayers, 
	AIPriority, ConsecutiveEras)
VALUES
	('BUILDING_CD_NATIONAL_EXHIBIT', 'TXT_KEY_THEMING_BONUS_CD_NATIONAL_EXHIBIT_AFC', 25, 
	0, 0, 0, 0, 1, 
	1, 0, 0, 0, 
	7, 1),
	('BUILDING_CD_NATIONAL_EXHIBIT', 'TXT_KEY_THEMING_BONUS_CD_NATIONAL_EXHIBIT_AF', 20, 
	0, 0, 0, 0, 1, 
	1, 0, 0, 0, 
	6, 0),
	('BUILDING_CD_NATIONAL_EXHIBIT', 'TXT_KEY_THEMING_BONUS_CD_NATIONAL_EXHIBIT_FC', 20, 
	0, 0, 0, 1, 0, 
	1, 0, 0, 0, 
	6, 1),
	('BUILDING_CD_NATIONAL_EXHIBIT', 'TXT_KEY_THEMING_BONUS_CD_NATIONAL_EXHIBIT_F', 15, 
	0, 0, 0, 1, 0, 
	1, 0, 0, 0, 
	5, 0),
	('BUILDING_CD_NATIONAL_EXHIBIT', 'TXT_KEY_THEMING_BONUS_CD_NATIONAL_EXHIBIT_AC', 20, 
	0, 0, 1, 0, 0, 
	1, 0, 0, 0, 
	6, 1),
	('BUILDING_CD_NATIONAL_EXHIBIT', 'TXT_KEY_THEMING_BONUS_CD_NATIONAL_EXHIBIT_A', 15, 
	0, 0, 1, 0, 0, 
	1, 0, 0, 0, 
	5, 0);

INSERT INTO Building_ThemingYieldBonus
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CD_NATIONAL_EXHIBIT', 'YIELD_CULTURE', 4),
	('BUILDING_CD_NATIONAL_EXHIBIT', 'YIELD_TOURISM', 4),
	('BUILDING_CD_NATIONAL_EXHIBIT', 'YIELD_GOLDEN_AGE_POINTS', 4);

INSERT INTO Building_YieldChangesPerLocalTheme
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CD_NATIONAL_EXHIBIT', 'YIELD_CULTURE', 2),
	('BUILDING_CD_NATIONAL_EXHIBIT', 'YIELD_TOURISM', 2),
	('BUILDING_CD_NATIONAL_EXHIBIT', 'YIELD_GOLDEN_AGE_POINTS', 2);

UPDATE Language_en_US SET
Text = Text || '[NEWLINE]Possible Theming Bonuses:
[NEWLINE][ICON_BULLET]+25 [ICON_CULTURE] and [ICON_TOURISM] for a [COLOR_POSITIVE_TEXT]Domestic[ENDCOLOR] group of two [ICON_GW_ART] Great Works of Art and two [ICON_ARTIFACT] Artifacts from [COLOR_CYAN]consecutive Eras[ENDCOLOR].
[NEWLINE][ICON_BULLET]+20 [ICON_CULTURE] and [ICON_TOURISM] for a [COLOR_POSITIVE_TEXT]Domestic[ENDCOLOR] group of two [ICON_GW_ART] Great Works of Art and two [ICON_ARTIFACT] Artifacts.
[NEWLINE][ICON_BULLET]+20 [ICON_CULTURE] and [ICON_TOURISM] for four [COLOR_POSITIVE_TEXT]Domestic[ENDCOLOR] [ICON_ARTIFACT] Artifacts from [COLOR_CYAN]consecutive Eras[ENDCOLOR].
[NEWLINE][ICON_BULLET]+15 [ICON_CULTURE] and [ICON_TOURISM] for four [COLOR_POSITIVE_TEXT]Domestic[ENDCOLOR] [ICON_ARTIFACT] Artifacts.
[NEWLINE][ICON_BULLET]+20 [ICON_CULTURE] and [ICON_TOURISM] for four [COLOR_POSITIVE_TEXT]Domestic[ENDCOLOR] [ICON_GW_ART] Great Works of Art from [COLOR_CYAN]consecutive Eras[ENDCOLOR].
[NEWLINE][ICON_BULLET]+15 [ICON_CULTURE] and [ICON_TOURISM] for four [COLOR_POSITIVE_TEXT]Domestic[ENDCOLOR] [ICON_GW_ART] Great Works of Art.'
WHERE Tag = 'TXT_KEY_BUILDING_CD_NATIONAL_EXHIBIT_HELP';

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CD_NATIONAL_EXHIBIT', 'YIELD_CULTURE', 2),  -- has 2 already
	('BUILDING_CD_NATIONAL_EXHIBIT', 'YIELD_TOURISM', 4),
	('BUILDING_CD_NATIONAL_EXHIBIT', 'YIELD_GOLDEN_AGE_POINTS', 4);


