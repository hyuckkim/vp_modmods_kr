----------------------------------------------------
-- Enlightenment Era (Vox Populi)
-- RER Unit 2 Hander and other RER tweaks
-- 2018-01-30 Reworked by Infixo
----------------------------------------------------

----------------------------------------------------
-- ArtDef
----------------------------------------------------

INSERT INTO ArtDefine_UnitInfos 
			(Type, 							DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_2HANDER'),		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_LONGSWORDSMAN');

INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 										Scale,  ZOffset, Domain, Model, 			MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_2HANDER'),	Scale,	ZOffset, Domain, ('2hswordsman_black.fxsxml'),	('ARMOR'), ('ARMOR')
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_LONGSWORDSMAN');

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,							UnitMemberInfoType,			NumMembers)
SELECT		('ART_DEF_UNIT_2HANDER'),		('ART_DEF_UNIT_MEMBER_2HANDER'),	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_LONGSWORDSMAN');

INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,							EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_2HANDER'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_LONGSWORDSMAN');

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_2HANDER'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, ('METAL'), ('SWORD')
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_LONGSWORDSMAN');

INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 			TileType,	Asset)
VALUES		('ART_DEF_UNIT_2HANDER', 		'Unit', 	'sv_2hander.dds');

----------------------------------------------------
-- Icons
----------------------------------------------------

INSERT INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn) VALUES
('RER_UNITS_ATLAS',	256, 'RER_UNITS_atlas_256.dds', 2, 1),
('RER_UNITS_ATLAS',	128, 'RER_UNITS_atlas_128.dds', 2, 1),
('RER_UNITS_ATLAS',	 80, 'RER_UNITS_atlas_80.dds',  2, 1),
('RER_UNITS_ATLAS',	 64, 'RER_UNITS_atlas_64.dds',  2, 1),
('RER_UNITS_ATLAS',	 45, 'RER_UNITS_atlas_45.dds',  2, 1);

----------------------------------------------------
-- Unit
----------------------------------------------------

INSERT INTO UnitClasses (Type, DefaultUnit, Description)
VALUES ('UNITCLASS_2HANDER', 'UNIT_2HANDER', 'TXT_KEY_UNIT_2HANDER');

INSERT INTO Units 
	(Class, Type, PrereqTech, Combat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, 
	Description, Civilopedia, Strategy, Help,
	MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, GoodyHutUpgradeUnitClass, AdvancedStartCost, PurchaseCooldown,
	XPValueAttack, XPValueDefense, Conscription, UnitArtInfo, UnitFlagIconOffset, IconAtlas, PortraitIndex)
VALUES
	('UNITCLASS_2HANDER', 'UNIT_2HANDER','TECH_CHEMISTRY', 26, 300, 400, 1, 2, 'UNITCOMBAT_MELEE', 'DOMAIN_LAND', 'UNITAI_ATTACK',
	'TXT_KEY_UNIT_2HANDER',	'TXT_KEY_CIV5_2HANDER_TEXT', 'TXT_KEY_UNIT_2HANDER_STRATEGY', 'TXT_KEY_UNIT_HELP_2HANDER',
	1, 1, 1, 'TECH_EE_FLINTLOCK', 'UNITCLASS_EE_LINE_INFANTRY', 25, 1,
	3, 3, 3, 'ART_DEF_UNIT_2HANDER', 33, 'RER_UNITS_ATLAS', 0);

INSERT INTO UnitGameplay2DScripts (UnitType, SelectionSound, FirstSelectionSound)
VALUES ('UNIT_2HANDER', 'AS2D_SELECT_SWORDSMAN', 'AS2D_BIRTH_SWORDSMAN');

INSERT INTO Unit_ClassUpgrades (UnitType, UnitClassType)
VALUES ('UNIT_2HANDER', 'UNITCLASS_EE_LINE_INFANTRY');

-- update Longswordsman
UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_2HANDER'
WHERE UnitType IN (SELECT Type FROM Units WHERE Class = 'UNITCLASS_LONGSWORDSMAN' AND Type != 'UNIT_JAPANESE_SAMURAI');

-- update Longswordsman
UPDATE Units
SET ObsoleteTech = 'TECH_CHEMISTRY', GoodyHutUpgradeUnitClass = 'UNITCLASS_2HANDER'
WHERE Type = 'UNIT_LONGSWORDSMAN';

----------------------------------------------------
-- Promotions
----------------------------------------------------


INSERT INTO Unit_FreePromotions (UnitType, PromotionType) VALUES
('UNIT_2HANDER', 'PROMOTION_COVER_1'),
('UNIT_2HANDER', 'PROMOTION_2HANDER');

----------------------------------------------------
-- Other features
----------------------------------------------------

INSERT INTO Unit_ResourceQuantityRequirements (UnitType, ResourceType, Cost)
VALUES ('UNIT_2HANDER', 'RESOURCE_IRON', 1);



----------------------------------------------------
-- AI
----------------------------------------------------

INSERT INTO Unit_AITypes (UnitType, UnitAIType) VALUES
('UNIT_2HANDER', 'UNITAI_ATTACK'),
('UNIT_2HANDER', 'UNITAI_DEFENSE');

INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor) VALUES
('UNIT_2HANDER', 'FLAVOR_OFFENSE', 7),
('UNIT_2HANDER', 'FLAVOR_DEFENSE', 6);

----------------------------------------------------
-- Text (en_US)
----------------------------------------------------

INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_UNIT_2HANDER', 'Two-Handed Swordsman'),
('TXT_KEY_CIV5_2HANDER_TEXT', 'Renaissance two-handed swords are monstrous weapons, longer and larger than even the medieval great swords, with a hilt of over a foot and a blade that measures nearly five feet in length, taller than some people. They are primarily in use during the early decades of the 16th century. These swords represent the final stage in the trend of increasing size that started in the 14th century. They can be used to fight against pike formations and cut off pike heads.'),
('TXT_KEY_UNIT_2HANDER_STRATEGY', 'Two-Handed Swordsman is much stronger than the Longswordsman, and gains a devastating combat bonus against Spearmen, Pikemen, Tercio and Landsknecht.'),
('TXT_KEY_UNIT_HELP_2HANDER', 'Early Renaissance Era melee unit. Additional +33% [ICON_WAR] Attack against Spearmen, Pikemen, Tercio and Landsknecht.');
--('TXT_KEY_PROMOTION_2HANDER', 'Two Hander'),
--('TXT_KEY_PROMOTION_2HANDER_HELP', '+33% [ICON_WAR] Attack vs Spearmen, Pikemen, Tercio and Landsknecht.');


----------------------------------------------------
-- Other RER tweaks
----------------------------------------------------

-- Landsknecht
INSERT INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn)
VALUES ('UNIT_FLAG_LANDSKNECHT_ATLAS', 32, 'LandsknechtFlag.dds', 1, 1);

UPDATE ArtDefine_StrategicView
SET Asset = 'sv_Landsknecht.dds'
WHERE StrategicViewType = 'ART_DEF_UNIT_U_GERMAN_LANDSKNECHT';

UPDATE Units
SET UnitFlagIconOffset = 0, UnitFlagAtlas = 'UNIT_FLAG_LANDSKNECHT_ATLAS'
WHERE Type = 'UNIT_GERMAN_LANDSKNECHT';

-- Tercio
UPDATE ArtDefine_UnitMemberInfos
SET Model = 'TER_PIKE_piquero.fxsxml'
WHERE Type = 'ART_DEF_UNIT_MEMBER_U_SPANISH_TERCIO_PIQUERO';

-- Pikeman
UPDATE ArtDefine_UnitMemberInfos
SET Model = 'RER_PIKE.fxsxml'
WHERE Type = 'ART_DEF_UNIT_MEMBER_PIKEMAN';

-- New icon for Cuirassier
UPDATE Units
SET PortraitIndex = 1, IconAtlas = 'RER_UNITS_ATLAS'
WHERE Type = 'UNIT_CUIRASSIER';
