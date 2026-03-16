-- ============================
-- Viking (Pioneer)
-- Combat settler unit to cross ocean
-- ==============================
--==========================================================================================================================
-- UNIT GRAPHICS
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 				TileType,		Asset)
VALUES	('ART_DEF_UNIT_PB_JOMS_MERCENARY', 		'Unit', 		'viking_sv.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------			
INSERT INTO ArtDefine_UnitInfos 
		(Type, 								DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_PB_JOMS_MERCENARY',			DamageStates, 	'UnFormed'
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_SWORDSMAN';
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,						UnitMemberInfoType,					NumMembers)
SELECT	'ART_DEF_UNIT_PB_JOMS_MERCENARY', 		'ART_DEF_UNIT_MEMBER_PB_JOMS_MERCENARY',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_SWORDSMAN';
------------------------
-- ArtDefine_UnitMemberCombats
------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_PB_JOMS_MERCENARY',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_SWORDSMAN';
------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_PB_JOMS_MERCENARY',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_SWORDSMAN';
------------------------
-- ArtDefine_UnitMemberInfos
------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 								Scale,	ZOffset, Domain, Model, 			MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_PB_JOMS_MERCENARY',	Scale,	ZOffset, Domain, 'Longswordsman_Viking.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_SWORDSMAN';
--===================================================================================
UPDATE Units SET
Moves = 3,
Food = 1,
HurryCostModifier = -1,
Found = 1,
FoundMid = 1,
-- FoundAbroad = 1,  -- replaces the pioneer so too restrictive
CombatClass = 'UNITCOMBAT_MELEE',
Combat = 20,
Pillage = 1,
PrereqTech = 'TECH_THEOLOGY',
ObsoleteTech = 'TECH_RIFLING',
DefaultUnitAI = 'UNITAI_FAST_ATTACK'
WHERE Type = 'UNIT_CD_VIKING';

INSERT INTO Unit_BuildOnFound
	(UnitType, BuildingClassType)
VALUES
	('UNIT_CD_VIKING', 'BUILDINGCLASS_MONUMENT'),
	('UNIT_CD_VIKING', 'BUILDINGCLASS_SHRINE'),
	('UNIT_CD_VIKING', 'BUILDINGCLASS_GRANARY'),
	('UNIT_CD_VIKING', 'BUILDINGCLASS_COUNCIL'),
	('UNIT_CD_VIKING', 'BUILDINGCLASS_SMOKEHOUSE'),
	('UNIT_CD_VIKING', 'BUILDINGCLASS_BARRACKS'),
	('UNIT_CD_VIKING', 'BUILDINGCLASS_LIGHTHOUSE'),
	('UNIT_CD_VIKING', 'BUILDINGCLASS_COLOSSEUM');

INSERT INTO Unit_Flavors
	(UnitType, FlavorType, Flavor)
VALUES
	('UNIT_CD_VIKING', 'FLAVOR_OFFENSE', 8),
	('UNIT_CD_VIKING', 'FLAVOR_DEFENSE', 8);

INSERT INTO Unit_AITypes
	(UnitType, UnitAIType)
VALUES
	('UNIT_CD_VIKING', 'UNITAI_SETTLE'),
	('UNIT_CD_VIKING', 'UNITAI_EXPLORE');

UPDATE Unit_ClassUpgrades SET UnitClassType = 'UNITCLASS_RIFLEMAN' WHERE UnitType = 'UNIT_CD_VIKING';

-- this prevents them being recruited by Honor, which could be gamebreaking
INSERT INTO Unit_ResourceQuantityRequirements
   (UnitType,  ResourceType)
VALUES		
    ('UNIT_CD_VIKING', 	'RESOURCE_IRON');

INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
VALUES
	('UNIT_CD_VIKING', 'PROMOTION_AMPHIBIOUS'),
	--('UNIT_CD_VIKING', 'PROMOTION_EMBARKED_SIGHT'),  -- spicier this way
	('UNIT_CD_VIKING', 'PROMOTION_OCEAN_EXPLORER'),
	('UNIT_CD_VIKING', 'PROMOTION_OCEAN_MOVEMENT');

REPLACE INTO Language_en_US 
	(Tag, Text)
SELECT
	'TXT_KEY_UNIT_CD_VIKING_HELP', 'Requires the [ICON_CULTURE_CD_SCANDINAVIAN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_NORTHERN_SHORT_DESC}[ENDCOLOR] Cultural Group.'
FROM Language_en_US WHERE Tag = 'TXT_KEY_UNIT_HELP_PIONEER';

--  Founds new Cities with advanced infrastructure and additional [ICON_CITIZEN] Population. Unlike the Pioneer that it replaces, it has signficant [ICON_STRENGTH] Combat Strength and can cross [COLOR_POSITIVE_TEXT]Ocean[ENDCOLOR] immediately.[NEWLINE][NEWLINE]The [ICON_FOOD] Growth of the City is stopped while this Unit is being Trained. Reduces the City''s [ICON_CITIZEN] Population by 1 when completed.

-- =======================
-- Mead Hall (Arena)
-- =======================

REPLACE INTO Language_en_US 
	(Tag, Text)
SELECT
	'TXT_KEY_BUILDING_CD_MEAD_HALL_HELP', 'Requires the [ICON_CULTURE_CD_SCANDINAVIAN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_NORTHERN_SHORT_DESC}[ENDCOLOR] Cultural Group. ' || Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_BUILDING_COLOSSEUM_HELP';

INSERT INTO Building_ResourceYieldChanges
	(BuildingType, ResourceType, YieldType, Yield)
VALUES
	('BUILDING_CD_MEAD_HALL', 'RESOURCE_RICE', 'YIELD_GOLDEN_AGE_POINTS', 1),
	('BUILDING_CD_MEAD_HALL', 'RESOURCE_MAIZE', 'YIELD_GOLDEN_AGE_POINTS', 1),
	('BUILDING_CD_MEAD_HALL', 'RESOURCE_WHEAT', 'YIELD_GOLDEN_AGE_POINTS', 1);

UPDATE Language_en_US SET
Text = Text || '[NEWLINE]Nearby [ICON_RES_RICE] Rice, [ICON_RES_MAIZE] Maize, [ICON_RES_WHEAT] Wheat: +1 [ICON_GOLDEN_AGE] Golden Age Point.'
WHERE Tag = 'TXT_KEY_BUILDING_CD_MEAD_HALL_HELP';

INSERT INTO Building_YieldFromCombatExperienceTimes100
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CD_MEAD_HALL', 'YIELD_GOLDEN_AGE_POINTS', 100);

INSERT INTO Building_YieldChangesPerGoldenAge
	(BuildingType, YieldType, Yield, YieldCap)
VALUES
	('BUILDING_CD_MEAD_HALL', 'YIELD_CULTURE', 1, 10),
	('BUILDING_CD_MEAD_HALL', 'YIELD_TOURISM', 1, 10);


