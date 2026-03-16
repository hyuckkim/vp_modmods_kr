-- ============================
-- Agiru (Spearman)
-- imma giraffe
-- ==============================
-- ======================================================================================================
-- UNIT ART
-- ======================================================================================================
-- ArtDefine_StrategicView
--------------------------
INSERT INTO ArtDefine_StrategicView 
	(StrategicViewType, 		TileType,	Asset)
VALUES	('ART_DEF_UNIT_MC_MORAN',	'Unit', 	'sv_agiru.dds');
--=========================================================================================================================
-- ArtDefine_UnitInfos
------------------------------		
INSERT INTO ArtDefine_UnitInfos 
	(Type, 				DamageStates,	Formation)
SELECT		
	('ART_DEF_UNIT_MC_MORAN'), 	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_SCOUT');
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
	(UnitInfoType,			UnitMemberInfoType,		NumMembers)
SELECT		
	('ART_DEF_UNIT_MC_MORAN'), ('ART_DEF_UNIT_MEMBER_MC_MORAN'), 	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_SCOUT');
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_MC_MORAN'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_ZULU_IMPI_WARRIOR');
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_MC_MORAN'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_ZULU_IMPI_WARRIOR');
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 									Scale, ZOffset, Domain, Model, 						MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_MC_MORAN'),	Scale, ZOffset, Domain, ('Maasai_Moran.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_U_ZULU_IMPI_WARRIOR');
--========================================================================================================================

INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
VALUES
	('UNIT_CD_AGIRU', 'PROMOTION_MOBILITY');

INSERT INTO Unit_Builds
	(UnitType, BuildType)
VALUES
	('UNIT_CD_AGIRU', 'BUILD_PASTURE');

INSERT INTO Unit_AITypes
	(UnitType, UnitAIType)
VALUES
	('UNIT_CD_AGIRU', 'UNITAI_WORKER');

UPDATE Units SET
WorkRate = 100, 
PolicyType = NULL  -- cant get a free one without this, but for a unit we dont need it
WHERE Type = 'UNIT_CD_AGIRU';

REPLACE INTO Language_en_US 
	(Tag, Text)
SELECT
	'TXT_KEY_UNIT_CD_AGIRU_HELP', 'Requires the [ICON_CULTURE_JFD_EAST_AFRICAN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_EAST_AFRICAN_SHORT_DESC}[ENDCOLOR] Cultural Group.'
FROM Language_en_US WHERE Tag = 'TXT_KEY_UNIT_HELP_WARRIOR';	

--  Starts with the [COLOR_POSITIVE_TEXT]Mobility[ENDCOLOR] Promotion, which gives it an additional [ICON_MOVES] Movement and is kept on Upgrade. Unlike the Warrior, it can Build Pastures.

-- =======================
-- Jumbe (Great Merchant)
-- =======================

UPDATE UNITS SET
BaseGoldTurnsToCount = 3,  -- up from 2
BaseWLTKDTurns = 5
WHERE Type = 'UNIT_CD_JUMBE';

INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
VALUES
	('UNIT_CD_JUMBE', 'PROMOTION_LITERACY'),
	('UNIT_CD_JUMBE', 'PROMOTION_ENVOY'),
	('UNIT_CD_JUMBE', 'PROMOTION_NOBILITY');

INSERT INTO Trait_GreatPersonProgressFromPolicyUnlock
	(TraitType, GreatPersonType, Value)
SELECT
	lt.TraitType, 'GREATPERSON_MERCHANT', 10
FROM Civilization_JFD_CultureTypes c, Leader_Traits lt, Civilization_Leaders cl
WHERE 
c.CultureType = 'CULTURE_JFD_EAST_AFRICAN' AND 
c.CivilizationType = cl.CivilizationType AND 
cl.LeaderheadType = lt.LeaderType;

CREATE TRIGGER JumbeTrait
AFTER INSERT ON Civilization_JFD_CultureTypes WHEN NEW.CultureType = 'CULTURE_JFD_EAST_AFRICAN'
BEGIN
	INSERT INTO Trait_GreatPersonProgressFromPolicyUnlock
		(TraitType, GreatPersonType, Value)
	SELECT
		lt.TraitType, 'GREATPERSON_MERCHANT', 10
	FROM Leader_Traits lt, Civilization_Leaders cl
	WHERE 
	NEW.CivilizationType = cl.CivilizationType AND 
	cl.LeaderheadType = lt.LeaderType;
END;

UPDATE Language_en_US SET
Text = 'Replaces the [ICON_GREAT_MERCHANT] Great Merchant for the [ICON_CULTURE_JFD_EAST_AFRICAN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_JFD_EAST_AFRICAN_SHORT_DESC}[ENDCOLOR] Cultural Group. Receive 10% progress towards a [ICON_GREAT_MERCHANT] Jumbe in the [ICON_CAPITAL] Capital whenever you adopt a [COLOR_MAGENTA]Policy[ENDCOLOR].[NEWLINE][NEWLINE]Starts with the [COLOR_POSITIVE_TEXT]Literacy[ENDCOLOR], [COLOR_POSITIVE_TEXT]Adept[ENDCOLOR], and [COLOR_POSITIVE_TEXT]Noble[ENDCOLOR] Promotions. Trade Missions from the Jumbe generate 50% more base [ICON_GOLD] Gold.[NEWLINE][NEWLINE]When you expend a Jumbe, all Strategic Resources in the Empire gain +1 [ICON_GOLDEN_AGE] Golden Age Point, all Harbors gain +2 [ICON_FOOD] Food, and the [ICON_CAPITAL] Capital gains +3 [ICON_TOURISM] Tourism.'
WHERE Tag = 'TXT_KEY_UNIT_CD_JUMBE_HELP';

-- -----------------------
-- Jumbe event
-- -----------------------
INSERT INTO Events 
	(Type, Description, Help, EventClass, NumChoices, RandomChance, RequiredPolicy, IgnoresGlobalCooldown, EventCooldown)
VALUES
	('EVENT_JUMBE', 'TXT_KEY_JUMBE_EVENT', 'TXT_KEY_JUMBE_EVENT_HELP', 'EVENT_CLASS_CIV_SPECIFIC', 1, -1, 'POLICY_CD_EAST_AFRICAN', 1, 0);

INSERT INTO EventChoices
	(Type, Description, Help, EventDuration, IsOneShot)
VALUES
	('EVENT_JUMBE_CHOICE', 'TXT_KEY_JUMBE_EVENT', 'TXT_KEY_JUMBE_EVENT_HELP', -1, 0);

INSERT INTO Event_ParentEvents
	(EventChoiceType, EventType)
VALUES
	('EVENT_JUMBE_CHOICE', 'EVENT_JUMBE');

INSERT INTO EventChoice_ResourceYieldChange
	(EventChoiceType, ResourceType, YieldType, YieldChange)
SELECT
	'EVENT_JUMBE_CHOICE', Type, 'YIELD_GOLDEN_AGE_POINTS', 1
FROM Resources WHERE ResourceUsage = 1;

/*
INSERT INTO EventChoice_SpecialistYieldChange
	(EventChoiceType, SpecialistType, YieldType, YieldChange)
VALUES
	('EVENT_JUMBE_CHOICE', 'SPECIALIST_MERCHANT', 'YIELD_FOOD', 1);
*/

INSERT INTO EventChoice_BuildingClassYieldChange
	(EventChoiceType, BuildingClassType, YieldType, YieldChange)
VALUES
	('EVENT_JUMBE_CHOICE', 'BUILDINGCLASS_PALACE', 'YIELD_TOURISM', 3),
	('EVENT_JUMBE_CHOICE', 'BUILDINGCLASS_HARBOR', 'YIELD_FOOD', 2);

INSERT INTO Language_en_US
	(Tag, Text)
VALUES
	('TXT_KEY_JUMBE_EVENT', 'Gifts from Ophir'),
	('TXT_KEY_JUMBE_EVENT_HELP', '[ICON_BULLET] Strategic Resources in the Empire gain +1 [ICON_GOLDEN_AGE] Golden Age Points.[NEWLINE][ICON_BULLET] All Harbors gain +2 [ICON_FOOD] Food.[NEWLINE][ICON_BULLET] The [ICON_CAPITAL] Capital produces +3 [ICON_TOURISM] Tourism.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]These effects stack.[ENDCOLOR]');


