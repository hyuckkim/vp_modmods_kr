
--============================
-- Varangian (Swordsman)
-- Rivers and Money
-- ===========================
------------------------------
-- ArtDefine_UnitInfos
------------------------------	
INSERT INTO ArtDefine_UnitInfos 
		(Type, 								DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_VARANGIAN', 		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE	Type = 'ART_DEF_UNIT_SWORDSMAN';
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,						UnitMemberInfoType,							NumMembers)
SELECT	'ART_DEF_UNIT_JFD_VARANGIAN', 		'ART_DEF_UNIT_MEMBER_JFD_VARANGIAN', 		NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_SWORDSMAN';
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_VARANGIAN',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_SWORDSMAN';
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_VARANGIAN',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_SWORDSMAN';
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale,	ZOffset, Domain, Model,						MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_VARANGIAN',	Scale,	ZOffset, Domain, 'VarangianGuard.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_SWORDSMAN';
--==========================================================================================================================

UPDATE Units SET
Combat = Combat + 2,
PurchaseOnly = 1,
MoveAfterPurchase = 1
WHERE Type = 'UNIT_CD_VARANGIAN';

INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
VALUES
	('UNIT_CD_VARANGIAN', 'PROMOTION_CD_VARANGIAN'),
	('UNIT_CD_VARANGIAN', 'PROMOTION_VIKING'),
	('UNIT_CD_VARANGIAN', 'PROMOTION_ATTACK_BONUS_SWEDEN');

UPDATE Language_en_US SET
Text = 'Requires the [ICON_CULTURE_JFD_EASTERN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_EASTERN_SHORT_DESC}[ENDCOLOR] Cultural Group.'
WHERE Tag = 'TXT_KEY_UNIT_CD_VARANGIAN_HELP';

-- =======================
-- Sobor (Grand Temple)
-- =======================
REPLACE INTO Language_en_US 
	(Tag, Text)
SELECT
	'TXT_KEY_BUILDING_CD_SOBOR_HELP', 'Requires the [ICON_CULTURE_JFD_EASTERN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_EASTERN_SHORT_DESC}[ENDCOLOR] Cultural Group. ' || Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_BUILDING_GRAND_TEMPLE_HELP';

--  In all Cities 50% of [ICON_PEACE] Faith output is added as [ICON_CULTURE_LOCAL] Border Growth Points every turn. All [ICON_GREAT_WORK] Great Works yield +1 [ICON_GOLD] Gold. Boosts Pressure of [ICON_RELIGION] Religious Majority emanating from all Cities by 25%.[NEWLINE][NEWLINE]

UPDATE Buildings SET
GreatWorkCount = 2,
GreatWorkSlotType = 'GREAT_WORK_SLOT_MUSIC',
SpecialistType = 'SPECIALIST_MUSICIAN',
SpecialistCount = 1,
GreatPeopleRateChange = 1,
ThemingBonusHelp = 'TXT_KEY_THEMING_BONUS_CD_SOBOR_HELP',
BasePressureModifierGlobal = 25,
NumCityCostMod = 10
WHERE Type = 'BUILDING_CD_SOBOR';

INSERT INTO Building_YieldFromYieldPercentGlobal
	(BuildingType, YieldOut, YieldIn, Value)
VALUES
	('BUILDING_CD_SOBOR', 'YIELD_CULTURE_LOCAL', 'YIELD_FAITH', 50);

INSERT INTO Building_GreatWorkYieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CD_SOBOR', 'YIELD_GOLD', 1);

INSERT INTO Language_en_US
	(Tag, Text)
VALUES
	('TXT_KEY_THEMING_BONUS_CD_SOBOR_1', 'Znamennyj Chants'),
	('TXT_KEY_THEMING_BONUS_CD_SOBOR_2', 'Obikhod Polyphony'),
	('TXT_KEY_THEMING_BONUS_CD_SOBOR_3', 'Sticherarion Canon'),
	('TXT_KEY_THEMING_BONUS_CD_SOBOR_HELP', 'To maximize your bonus, make sure the Great Work Slots are filled with Works of Music created by you and from the same Era.');

INSERT INTO Building_ThemingBonuses
	(BuildingType, Description, Bonus, 
	SameEra, UniqueEras, MustBeArt, MustBeArtifact, MustBeEqualArtArtifact, 
	RequiresOwner, RequiresAnyButOwner, RequiresSamePlayer, RequiresUniquePlayers, 
	AIPriority, ConsecutiveEras)
VALUES
	('BUILDING_CD_SOBOR', 'TXT_KEY_THEMING_BONUS_CD_SOBOR_3', 16, 
	1, 0, 0, 0, 0, 
	1, 0, 0, 0, 
	4, 0),
	('BUILDING_CD_SOBOR', 'TXT_KEY_THEMING_BONUS_CD_SOBOR_2', 12, 
	0, 1, 0, 0, 0, 
	1, 0, 0, 0, 
	3, 1),
	('BUILDING_CD_SOBOR', 'TXT_KEY_THEMING_BONUS_CD_SOBOR_1', 8, 
	0, 1, 0, 0, 0, 
	1, 0, 0, 0, 
	2, 0);
-- it is important that these are in this order

INSERT INTO Building_ThemingYieldBonus
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CD_SOBOR', 'YIELD_FAITH', 3),
	('BUILDING_CD_SOBOR', 'YIELD_CULTURE', 3);

UPDATE Language_en_US SET
Text = Text || '[NEWLINE]Possible Theming Bonuses
[NEWLINE][ICON_BULLET]+16 [ICON_CULTURE] and [ICON_TOURISM] for two [COLOR_POSITIVE_TEXT]Domestic[ENDCOLOR] [ICON_GW_MUSIC] Great Works of Music from the [COLOR_CYAN]same Era[ENDCOLOR].
[NEWLINE][ICON_BULLET]+12 [ICON_CULTURE] and [ICON_TOURISM] for two [COLOR_POSITIVE_TEXT]Domestic[ENDCOLOR] [ICON_GW_MUSIC] Great Works of Music from [COLOR_CYAN]consecutive Eras[ENDCOLOR].
[NEWLINE][ICON_BULLET]+8 [ICON_CULTURE] and [ICON_TOURISM] for two [COLOR_POSITIVE_TEXT]Domestic[ENDCOLOR] [ICON_GW_MUSIC] Great Works of Music from [COLOR_CYAN]different Eras[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_BUILDING_CD_SOBOR_HELP';

INSERT INTO Building_BuildingClassYieldChanges
	(BuildingType,	BuildingClassType,	YieldType,	YieldChange)
SELECT			
	'BUILDING_CD_SOBOR', BuildingClass,  'YIELD_FAITH', 2
FROM Buildings WHERE Cost = -1 AND FaithCost > 0 
UNION ALL
SELECT			
	'BUILDING_CD_SOBOR', BuildingClass,  'YIELD_GOLD', 1
FROM Buildings WHERE Cost = -1 AND FaithCost > 0;

INSERT INTO Building_BuildingClassYieldChanges
	(BuildingType,	BuildingClassType,	YieldType,	YieldChange)
VALUES
	('BUILDING_CD_SOBOR', 'BUILDINGCLASS_MUSICIANS_GUILD', 'YIELD_FAITH', 2),
	('BUILDING_CD_SOBOR', 'BUILDINGCLASS_MUSICIANS_GUILD', 'YIELD_GOLD', 1);

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CD_SOBOR', 'YIELD_CULTURE', 1);

