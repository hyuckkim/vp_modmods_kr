--=============================
-- Iberian revolution (Unique Project)
--=============================
-- Not Yet Implemented, need some DLL
/*
INSERT INTO Projects
	(Type, Description, Help, Civilopedia, Strategy,
	CivilizationType, PortraitIndex, IconAtlas, MaxPlayerInstances, 
	Cost, IdeologyRequired)
VALUES
	('PROJECT_IBERIA', 'TXT_KEY_PROJECT_IBERIA', 'TXT_KEY_PROJECT_IBERIA_HELP', 'TXT_KEY_PROJECT_IBERIA_TEXT', 'TXT_KEY_PROJECT_IBERIA_STRATEGY',
	'CIVILIZATION_SPAIN', 34, 'CD_MILITARY_ATLAS', 1, 
	2500, 1);

INSERT INTO Language_en_US
	(Tag, Text)
VALUES
	('TXT_KEY_PROJECT_IBERIA', 'Iberian Revolution'),
	('TXT_KEY_PROJECT_IBERIA_HELP', 'Get bonus X, Y, and Z'),
	('TXT_KEY_PROJECT_IBERIA_TEXT', 'Portugal and Spain go poof'),
	('TXT_KEY_PROJECT_IBERIA_STRATEGY', 'Gives bonuses');
*/

-- ============================
-- Condor Legion (Great War Bomber)
-- ==============================
-- ArtDefine_StrategicView
-------------------------------
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 							TileType,	Asset)
VALUES		('ART_DEF_UNIT_UC_CONDOR', 			'Unit', 	'sv_Condor.dds');
------------------------------	
-- ArtDefine_UnitInfos
------------------------------		
INSERT INTO ArtDefine_UnitInfos 
			(Type, 								DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_UC_CONDOR'),		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_WW1_BOMBER');
------------------------------	
-- ArtDefine_UnitInfoMemberInfos
------------------------------		
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,						UnitMemberInfoType,							NumMembers)
SELECT		('ART_DEF_UNIT_UC_CONDOR'),		('ART_DEF_UNIT_MEMBER_UC_CONDOR'),		NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_WW1_BOMBER');
------------------------------	
-- ArtDefine_UnitMemberCombats
------------------------------	
INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,							EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_UC_CONDOR'),		EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_WW1_BOMBER');
------------------------------	
-- ArtDefine_UnitMemberCombatWeapons
------------------------------		
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,							"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_UC_CONDOR'),		"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_WW1_BOMBER');
------------------------------	
-- ArtDefine_UnitMemberInfos
------------------------------	
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 										Scale, ZOffset, Domain, Model, 									MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_UC_CONDOR'),		Scale, ZOffset, Domain, ('Heinkel_He-111_Spain.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_WW1_BOMBER');
--====================================================================================================

UPDATE Units SET
RangedCombat = RangedCombat + 4,
MinorCivGift = 1 -- for now...
WHERE Type = 'UNIT_CD_CONDOR_LEGION';

INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
VALUES
	('UNIT_CD_CONDOR_LEGION', 'PROMOTION_CD_CONDOR'),  
	('UNIT_CD_CONDOR_LEGION', 'PROMOTION_AIR_TARGETING_1');

-- ============================
-- International Brigade (Unique)
-- ==============================
--==========================================================================================================================
-- ArtDefine_StrategicView
--==========================================================================================================================
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 			TileType,	Asset)
VALUES		('ART_DEF_UNIT_GH_BRIGADE', 	'Unit', 	'sv_Brigade.dds');
--==========================================================================================================================
-- ArtDefine_UnitInfos
--==========================================================================================================================			
INSERT INTO ArtDefine_UnitInfos 
			(Type, 							DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_GH_BRIGADE'), 	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_MARINE');
--==========================================================================================================================
-- ArtDefine_UnitInfoMemberInfos
--==========================================================================================================================
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,					UnitMemberInfoType,						NumMembers)
SELECT		('ART_DEF_UNIT_GH_BRIGADE'), 	('ART_DEF_UNIT_MEMBER_GH_BRIGADE'), 	1
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_MARINE');
--==========================================================================================================================
-- ArtDefine_UnitMemberCombats
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_GH_BRIGADE'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_MARINE');
--==========================================================================================================================
-- ArtDefine_UnitMemberCombatWeapons
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_GH_BRIGADE'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_MARINE');
--==========================================================================================================================
-- ArtDefine_UnitMemberInfos
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 									Scale,  ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_GH_BRIGADE'),	Scale,	ZOffset, Domain, ('International_Brigades.fxsxml'),		MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_MARINE');
--====================================================================================================

UPDATE Units SET
Class = 'UNITCLASS_CD_INTERNATIONAL_BRIGADE', -- max of 6
Cost = 950, 
Combat = 60,
PrereqTech = 'TECH_FLIGHT',
ObsoleteTech = 'TECH_MOBILE_TACTICS',
PurchaseOnly = 1,
MoveAfterPurchase = 1,
PurchaseCooldown = 0,
NoSupply = 1
WHERE Type = 'UNIT_CD_INTERNATIONAL_BRIGADE';

UPDATE Unit_ClassUpgrades SET UnitClassType = 'UNITCLASS_INFANTRY' WHERE UnitType = 'UNIT_CD_INTERNATIONAL_BRIGADE';

INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
VALUES
	('UNIT_CD_INTERNATIONAL_BRIGADE', 'PROMOTION_CD_BRIGADE'),  -- combat bonus
	('UNIT_CD_INTERNATIONAL_BRIGADE', 'PROMOTION_CD_BRIGADE_2');  -- tourism bonus (lost)

-- foreign legions will upgrade into them!
INSERT INTO Trait_UnitClassUpgrade
	(TraitType, UnitClassType, UnitType)
SELECT
	lt.TraitType, 'UNITCLASS_CD_INTERNATIONAL_BRIGADE', 'UNIT_FRENCH_FOREIGNLEGION'
FROM Civilization_JFD_CultureTypes c, Leader_Traits lt, Civilization_Leaders cl
WHERE 
c.SubCultureType = 'SUBCULTURE_CD_WESTERN_IBERIAN' AND 
c.CivilizationType = cl.CivilizationType AND 
cl.LeaderheadType = lt.LeaderType;

CREATE TRIGGER BrigadeTrait
AFTER INSERT ON Civilization_JFD_CultureTypes WHEN NEW.SubCultureType = 'SUBCULTURE_CD_WESTERN_IBERIAN'
BEGIN
	INSERT INTO Trait_UnitClassUpgrade
		(TraitType, UnitClassType, UnitType)
	SELECT
		lt.TraitType, 'UNITCLASS_CD_INTERNATIONAL_BRIGADE', 'UNIT_FRENCH_FOREIGNLEGION'
	FROM Leader_Traits lt, Civilization_Leaders cl
	WHERE 
	NEW.CivilizationType = cl.CivilizationType AND 
	cl.LeaderheadType = lt.LeaderType;
END;

--===============
-- event
-- When you adopt an ideology, you will receive 6 for free
--===============

INSERT INTO Events 
	(Type, Description, Help, EventClass, 
	NumChoices, RandomChance, RequiredPolicy, IgnoresGlobalCooldown, EventCooldown, RequiresWar, RequiredEra)
VALUES
	('EVENT_INTERNATIONAL_BRIGADE', 'TXT_KEY_INTERNATIONAL_BRIGADE_EVENT', 'TXT_KEY_INTERNATIONAL_BRIGADE_EVENT_HELP', 'EVENT_CLASS_CIV_SPECIFIC', 
	1, 100, 'POLICY_CD_WESTERN_IBERIAN', 1, 0, 1, 'ERA_MODERN');

INSERT INTO EventChoices
	(Type, Description, Help, EventDuration, IsOneShot, CapitalEffectOnly)
VALUES
	('EVENT_INTERNATIONAL_BRIGADE_CHOICE', 'TXT_KEY_INTERNATIONAL_BRIGADE_EVENT', 'TXT_KEY_INTERNATIONAL_BRIGADE_EVENT_HELP', 30, 1, 1);

INSERT INTO Event_ParentEvents
	(EventChoiceType, EventType)
VALUES
	('EVENT_INTERNATIONAL_BRIGADE_CHOICE', 'EVENT_INTERNATIONAL_BRIGADE');

INSERT INTO EventChoice_FreeUnits
	(EventChoiceType, UnitType, Quantity)
VALUES
	('EVENT_INTERNATIONAL_BRIGADE_CHOICE', 'UNIT_CD_INTERNATIONAL_BRIGADE', 6);

INSERT INTO Language_en_US
	(Tag, Text)
VALUES
	('TXT_KEY_INTERNATIONAL_BRIGADE_EVENT', 'Popular Front'),
	('TXT_KEY_INTERNATIONAL_BRIGADE_EVENT_HELP', 'Receive 6 [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] International Brigade in the [ICON_CAPITAL] Capital.');

---------------------------------------------------------------------
-- Commandery (Castle)
---------------------------------------------------------------------

UPDATE Buildings SET
FaithCost = 300,
ConversionModifier = -15,
ReligiousPressureModifier = 15,
TrainedFreePromotion = 'PROMOTION_CD_TEUTONIC'
WHERE Type = 'BUILDING_CD_COMMANDERY';

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CD_COMMANDERY', 'YIELD_CULTURE', 1),
	('BUILDING_CD_COMMANDERY', 'YIELD_FAITH', 2);

INSERT INTO Building_BonusFromAccomplishments
	(BuildingType, AccomplishmentType, UnitCombatType, UnitProductionModifier)
SELECT
	'BUILDING_CD_COMMANDERY', a.Type, uc.Type, 4
FROM Accomplishments a, UnitCombatInfos uc
WHERE a.ID IN (5, 6, 7, 8)
AND uc.Type IN ('UNITCOMBAT_MELEE', 'UNITCOMBAT_MOUNTED');

------------------------
-- feitoria tweak
UPDATE Improvements SET NoFollowUp = 1 WHERE Type = 'IMPROVEMENT_FEITORIA'; -- so it works with general chapter

UPDATE Language_en_US
SET Text = Replace(Text, 'through this tile.', 'through this tile, and [COLOR_POSITIVE_TEXT]Fortifications[ENDCOLOR], allowing owned Units to stay stationed in this tile after attacking.')
WHERE Tag = 'TXT_KEY_CIV5_IMPROVEMENTS_FEITORIA_HELP';

UPDATE Language_en_US
SET Text = Replace(Text, 'through this tile.', 'through this tile, and [COLOR_POSITIVE_TEXT]Fortifications[ENDCOLOR], allowing owned Units to stay stationed in this tile after attacking.')
WHERE Tag = 'TXT_KEY_BUILD_FEITORIA_HELP';

---------------------
-- clear their main-culture assignment 
---------------------
DELETE FROM Civilization_UnitClassOverrides WHERE CivilizationType IN (
SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SubCultureType = 'SUBCULTURE_CD_WESTERN_IBERIAN')
AND UnitType IN (
SELECT Type FROM Units WHERE IconAtlas IN ('CD_ECONOMIC_ATLAS', 'CD_MILITARY_ATLAS')
);

DELETE FROM Civilization_BuildingClassOverrides WHERE CivilizationType IN (
SELECT CivilizationType FROM Civilization_JFD_CultureTypes WHERE SubCultureType = 'SUBCULTURE_CD_WESTERN_IBERIAN')
AND BuildingType IN (
SELECT Type FROM Buildings WHERE IconAtlas IN ('CD_ECONOMIC_ATLAS', 'CD_MILITARY_ATLAS')
);

--------------------
-- and add the new ones 
--------------------
INSERT INTO Civilization_UnitClassOverrides
	(CivilizationType, UnitClassType, UnitType)
SELECT
	CivilizationType, 'UNITCLASS_CD_INTERNATIONAL_BRIGADE', 'UNIT_CD_INTERNATIONAL_BRIGADE'
FROM Civilization_JFD_CultureTypes WHERE SubCultureType = 'SUBCULTURE_CD_WESTERN_IBERIAN';

INSERT INTO Civilization_BuildingClassOverrides
	(CivilizationType, BuildingClassType, BuildingType)
SELECT
	c.CivilizationType, b.BuildingClass, 'BUILDING_CD_COMMANDERY'
FROM Civilization_JFD_CultureTypes c, Buildings b WHERE 
c.SubCultureType = 'SUBCULTURE_CD_WESTERN_IBERIAN'
AND
b.Type = 'BUILDING_CD_COMMANDERY';

--------------------
-- compatibility with future iberian custom civs
--------------------
CREATE TRIGGER IberianComponents
AFTER INSERT ON Civilization_JFD_CultureTypes WHEN NEW.SubCultureType = 'SUBCULTURE_CD_WESTERN_IBERIAN'
BEGIN
	INSERT INTO Civilization_UnitClassOverrides
		(CivilizationType, UnitClassType, UnitType)
	SELECT
		NEW.CivilizationType, 'UNITCLASS_CD_INTERNATIONAL_BRIGADE', 'UNIT_CD_INTERNATIONAL_BRIGADE';

	INSERT INTO Civilization_BuildingClassOverrides
		(CivilizationType, BuildingClassType, BuildingType)
	SELECT
		NEW.CivilizationType, BuildingClass, 'BUILDING_CD_COMMANDERY'
	FROM Buildings WHERE Type = 'BUILDING_CD_COMMANDERY';
END;

