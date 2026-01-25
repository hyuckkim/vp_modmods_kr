-- ============================
-- Bolas Rider (Cuirassier)
-- yeetus deletus
-- ==============================
-- ======================================================================================================
-- UNIT ART
-- ======================================================================================================
-- ArtDefine_StrategicView
--------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 		         TileType,		 Asset)
VALUES	('ART_DEF_UNIT_THP_HALIAGANEK',		'Unit', 		'sv_bolas.dds');
----------------------
-- ArtDefine_UnitInfos
----------------------
INSERT INTO ArtDefine_UnitInfos
          (Type,                                 DamageStates,     Formation)
SELECT    'ART_DEF_UNIT_THP_HALIAGANEK',         DamageStates,     Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_HEAVY_SKIRMISHER';
--------------------------------
-- ArtDefine_UnitInfoMemberInfos
--------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos
          (UnitInfoType,                      UnitMemberInfoType,                      NumMembers)
SELECT    'ART_DEF_UNIT_THP_HALIAGANEK',     'ART_DEF_UNIT_MEMBER_THP_HALIAGANEK',     NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_HEAVY_SKIRMISHER';
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats
(UnitMemberType,                                   EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT    'ART_DEF_UNIT_MEMBER_THP_HALIAGANEK',    EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax,   LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack,    HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat,  ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack,      AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_HEAVY_SKIRMISHER';
------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons
(UnitMemberType,                                   "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT    'ART_DEF_UNIT_MEMBER_THP_HALIAGANEK',    "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_HEAVY_SKIRMISHER';
----------------------------
-- ArtDefine_UnitMemberInfos
----------------------------
INSERT INTO ArtDefine_UnitMemberInfos
(Type,                                             Scale,    ZOffset, Domain, Model,                       MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT    'ART_DEF_UNIT_MEMBER_THP_HALIAGANEK',    Scale,    ZOffset, Domain, 'civ5_irohm5.fxsxml',    MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_HEAVY_SKIRMISHER';
--==========================================================================================================================
-- PROMOTIONS
--==========================================================================================================================
-- Promotions
--------------------------------

UPDATE Units SET
Combat = Combat + 2,
RangedCombat = RangedCombat + 2
WHERE Type = 'UNIT_CD_BOLAS_RIDER';

INSERT INTO UnitPromotions_Terrains
	(PromotionType, TerrainType, ExtraMove)
SELECT
	'PROMOTION_DMS_BOLAS_HIT', Type, 2
FROM Terrains WHERE Water = 0;

INSERT INTO Unit_FreePromotions 	
	(UnitType, 			PromotionType)
VALUES	
	('UNIT_CD_BOLAS_RIDER', 	'PROMOTION_DMS_BOLAS'),
	('UNIT_CD_BOLAS_RIDER', 	'PROMOTION_ACCURACY_1');

REPLACE INTO Language_en_US 
	(Tag, Text)
SELECT
	'TXT_KEY_UNIT_CD_BOLAS_RIDER_HELP', 'Requires the [ICON_CULTURE_CD_PATAGONIAN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_CD_PATAGONIAN_SHORT_DESC}[ENDCOLOR] Cultural Group.'
FROM Language_en_US WHERE Tag = 'TXT_KEY_UNIT_CUIRASSIER_HELP';	

--  Is stronger than the Cuirassier that it replaces. Has +15% [ICON_RANGED_STRENGTH] Attack against Units in [COLOR_POSITIVE_TEXT]Open Terrain[ENDCOLOR], and Land Units hit by a Bola have their Movement Costs increased by 2 for 1 turn. Starts with the [COLOR_POSITIVE_TEXT]Accuracy I[ENDCOLOR] Promotion.

--==========================================================================================================================
-- Art Defines
--==========================================================================================================================
-- ArtDefine_UnitInfos
-----------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 		     TileType,		 Asset)
VALUES	('ART_DEF_UNIT_GT_YEKAMUSH',		'Unit', 		'xon_sv.dds');
----------------------
-- ArtDefine_UnitInfos
----------------------
INSERT INTO ArtDefine_UnitInfos (Type,		DamageStates,		Formation)
SELECT	'ART_DEF_UNIT_GT_YEKAMUSH',				DamageStates,		Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_GREAT_PROPHET';
--------------------------------
-- ArtDefine_UnitInfoMemberInfos
--------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType,	UnitMemberInfoType,							NumMembers)
SELECT	('ART_DEF_UNIT_GT_YEKAMUSH'),							('ART_DEF_UNIT_MEMBER_GT_YEKAMUSH'),	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_GREAT_PROPHET';
------------------------------	
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats (UnitMemberType,	EnableActions,	DisableActions,	MoveRadius,	ShortMoveRadius,	ChargeRadius,	AttackRadius,	RangedAttackRadius,	MoveRate,	ShortMoveRate,	TurnRateMin,	TurnRateMax,	TurnFacingRateMin,	TurnFacingRateMax,	RollRateMin,	RollRateMax,	PitchRateMin,	PitchRateMax,	LOSRadiusScale,	TargetRadius,	TargetHeight,	HasShortRangedAttack,	HasLongRangedAttack,	HasLeftRightAttack,	HasStationaryMelee,	HasStationaryRangedAttack,	HasRefaceAfterCombat,	ReformBeforeCombat,	HasIndependentWeaponFacing,	HasOpponentTracking,	HasCollisionAttack,	AttackAltitude,	AltitudeDecelerationDistance,	OnlyTurnInMovementActions,	RushAttackFormation)
SELECT	('ART_DEF_UNIT_MEMBER_GT_YEKAMUSH'),			EnableActions,	DisableActions,	MoveRadius,	ShortMoveRadius,	ChargeRadius,	AttackRadius,	RangedAttackRadius,	MoveRate,	ShortMoveRate,	TurnRateMin,	TurnRateMax,	TurnFacingRateMin,	TurnFacingRateMax,	RollRateMin,	RollRateMax,	PitchRateMin,	PitchRateMax,	LOSRadiusScale,	TargetRadius,	TargetHeight,	HasShortRangedAttack,	HasLongRangedAttack,	HasLeftRightAttack,	HasStationaryMelee,	HasStationaryRangedAttack,	HasRefaceAfterCombat,	ReformBeforeCombat,	HasIndependentWeaponFacing,	HasOpponentTracking,	HasCollisionAttack,	AttackAltitude,	AltitudeDecelerationDistance,	OnlyTurnInMovementActions,	RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREAT_PROPHET';
------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons ('UnitMemberType',	'Index', 'SubIndex', 'ID', 'VisKillStrengthMin', 'VisKillStrengthMax', 'ProjectileSpeed', 'ProjectileTurnRateMin', 'ProjectileTurnRateMax', 'HitEffect', 'HitEffectScale', 'HitRadius', 'ProjectileChildEffectScale', 'AreaDamageDelay', 'ContinuousFire', 'WaitForEffectCompletion', 'TargetGround', 'IsDropped', 'WeaponTypeTag', 'WeaponTypeSoundOverrideTag')
SELECT ('ART_DEF_UNIT_MEMBER_GT_YEKAMUSH'),						"Index", "SubIndex", "ID", "VisKillStrengthMin", "VisKillStrengthMax", "ProjectileSpeed", "ProjectileTurnRateMin", "ProjectileTurnRateMax", "HitEffect", "HitEffectScale", "HitRadius", "ProjectileChildEffectScale", "AreaDamageDelay", "ContinuousFire", "WaitForEffectCompletion", "TargetGround", "IsDropped", "WeaponTypeTag", "WeaponTypeSoundOverrideTag"
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREAT_PROPHET');
----------------------------
-- ArtDefine_UnitMemberInfos
----------------------------
INSERT INTO ArtDefine_UnitMemberInfos (Type,		Scale,		ZOffset,		Domain,		Model,						MaterialTypeTag,	 MaterialTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_GT_YEKAMUSH'),	Scale,		ZOffset,		Domain,		('yekamush_model.fxsxml'),			MaterialTypeTag,	 MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_GREAT_PROPHET';

-- =======================
-- Xon (Great Prophet)
-- =======================

UPDATE Language_en_US SET
Text = 'Replaces the [ICON_PROPHET] Great Prophet for the [ICON_CULTURE_CD_PATAGONIAN] [COLOR:182:17:254:255]{TXT_KEY_CULTURE_CD_PATAGONIAN_SHORT_DESC}[ENDCOLOR] Cultural Group.[NEWLINE]In addition to the usual abilities of the Great Prophet, expending a Xon triggers the next in a series of 7 permanent Empire-wide bonuses.'
WHERE Tag = 'TXT_KEY_UNIT_CD_XON_HELP';

-- -----------------------
-- Xon event chain
-- -----------------------
INSERT INTO Events 
	(Type, Description, Help, EventClass, NumChoices, RandomChance, RequiredPolicy, IgnoresGlobalCooldown, EventCooldown)
VALUES
	('EVENT_XON', 'TXT_KEY_XON_EVENT', 'TXT_KEY_XON_EVENT_HELP', 'EVENT_CLASS_CIV_SPECIFIC', 7, -1, 'POLICY_CD_PATAGONIAN', 1, 0);

INSERT INTO EventChoices
	(Type, Description, Help, EventDuration, IsOneShot, GoldenAgeTurns, EventPromotion, Expires)
VALUES
	('EVENT_XON_CHOICE_1', 'TXT_KEY_EVENT_XON_CHOICE_1', 'TXT_KEY_EVENT_XON_CHOICE_1_HELP', 30, 1, 0, NULL, 0),
	('EVENT_XON_CHOICE_2', 'TXT_KEY_EVENT_XON_CHOICE_2', 'TXT_KEY_EVENT_XON_CHOICE_2_HELP', 30, 1, 0, NULL, 0),
	('EVENT_XON_CHOICE_3', 'TXT_KEY_EVENT_XON_CHOICE_3', 'TXT_KEY_EVENT_XON_CHOICE_3_HELP', 30, 1, 0, NULL, 0),
	('EVENT_XON_CHOICE_4', 'TXT_KEY_EVENT_XON_CHOICE_4', 'TXT_KEY_EVENT_XON_CHOICE_4_HELP', 30, 1, 0, 'PROMOTION_CD_XON_WAR', 0),
	('EVENT_XON_CHOICE_5', 'TXT_KEY_EVENT_XON_CHOICE_5', 'TXT_KEY_EVENT_XON_CHOICE_5_HELP', 30, 1, 0, 'PROMOTION_CD_XON_HEAL', 0),
	('EVENT_XON_CHOICE_6', 'TXT_KEY_EVENT_XON_CHOICE_6', 'TXT_KEY_EVENT_XON_CHOICE_6_HELP', 30, 1, 0, NULL, 0),
	('EVENT_XON_CHOICE_7', 'TXT_KEY_EVENT_XON_CHOICE_7', 'TXT_KEY_EVENT_XON_CHOICE_7_HELP', 30, 1, 10, NULL, 0);

INSERT INTO Event_ParentEvents
	(EventChoiceType, EventType)
VALUES
	('EVENT_XON_CHOICE_1', 'EVENT_XON'),
	('EVENT_XON_CHOICE_2', 'EVENT_XON'),
	('EVENT_XON_CHOICE_3', 'EVENT_XON'),
	('EVENT_XON_CHOICE_4', 'EVENT_XON'),
	('EVENT_XON_CHOICE_5', 'EVENT_XON'),
	('EVENT_XON_CHOICE_6', 'EVENT_XON'),
	('EVENT_XON_CHOICE_7', 'EVENT_XON');

INSERT INTO EventChoice_EventLinks
	(EventChoiceType, EventChoiceLinker, CheckForActive)
VALUES
	('EVENT_XON_CHOICE_2', 'EVENT_XON_CHOICE_1', 1),
	('EVENT_XON_CHOICE_3', 'EVENT_XON_CHOICE_2', 1),
	('EVENT_XON_CHOICE_4', 'EVENT_XON_CHOICE_3', 1),
	('EVENT_XON_CHOICE_5', 'EVENT_XON_CHOICE_4', 1),
	('EVENT_XON_CHOICE_6', 'EVENT_XON_CHOICE_5', 1),
	('EVENT_XON_CHOICE_7', 'EVENT_XON_CHOICE_6', 1);

INSERT INTO EventChoice_BuildingClassYieldModifier
	(EventChoiceType, BuildingClassType, YieldType, Modifier)
VALUES
	('EVENT_XON_CHOICE_2', 'BUILDINGCLASS_TEMPLE', 'YIELD_PRODUCTION', 10);

INSERT INTO EventChoice_FeatureYieldChange
	(EventChoiceType, FeatureType, YieldType, YieldChange)
SELECT
	'EVENT_XON_CHOICE_1', Type, 'YIELD_CULTURE_LOCAL', 1
FROM Features;

UPDATE EventChoice_FeatureYieldChange SET
YieldChange = 5
WHERE FeatureType IN (SELECT Type FROM Features WHERE NaturalWonder = 1) AND
EventChoiceType = 'EVENT_XON_CHOICE_1';

INSERT INTO EventChoice_ResourceYieldChange
	(EventChoiceType, ResourceType, YieldType, YieldChange)
SELECT
	'EVENT_XON_CHOICE_3', Type, 'YIELD_FOOD', 1
FROM Resources
WHERE IsMonopoly = 0 AND Type NOT IN ('RESOURCE_ARTIFACTS', 'RESOURCE_HIDDEN_ARTIFACTS');

INSERT INTO EventChoice_SpecialistYieldChange
	(EventChoiceType, SpecialistType, YieldType, YieldChange)
SELECT
	'EVENT_XON_CHOICE_6', Type, 'YIELD_SCIENCE', 1
FROM Specialists;

INSERT INTO EventChoice_ImprovementYieldChange
	(EventChoiceType, ImprovementType, YieldType, YieldChange)
VALUES
	('EVENT_XON_CHOICE_1', 'IMPROVEMENT_HOLY_SITE', 'YIELD_CULTURE', 2),
	('EVENT_XON_CHOICE_2', 'IMPROVEMENT_HOLY_SITE', 'YIELD_PRODUCTION', 2),
	('EVENT_XON_CHOICE_3', 'IMPROVEMENT_HOLY_SITE', 'YIELD_FOOD', 3),
	('EVENT_XON_CHOICE_4', 'IMPROVEMENT_HOLY_SITE', 'YIELD_GREAT_GENERAL_POINTS', 1),
	('EVENT_XON_CHOICE_5', 'IMPROVEMENT_HOLY_SITE', 'YIELD_FAITH', 3),
	('EVENT_XON_CHOICE_6', 'IMPROVEMENT_HOLY_SITE', 'YIELD_SCIENCE', 4),
	('EVENT_XON_CHOICE_7', 'IMPROVEMENT_HOLY_SITE', 'YIELD_GOLDEN_AGE_POINTS', 5);

INSERT INTO Language_en_US
	(Tag, Text)
VALUES
	('TXT_KEY_XON_EVENT', 'The Next World'),
	('TXT_KEY_XON_EVENT_HELP', 'The body of our Xon lies undisturbed as their spirit travels to achieve wonderful deeds. Before they passed, they spoke to our people of a dream. A dream in which, together, we live on in a new world. This vision has much to teach us, let us act.'),

	('TXT_KEY_EVENT_XON_CHOICE_1', 'Follow the [ICON_CULTURE_LOCAL] Dream of a New Land'),
	('TXT_KEY_EVENT_XON_CHOICE_1_HELP', 'All Features in the Empire yield +1 [ICON_CULTURE_LOCAL] Border Growth Points, increased to +5 [ICON_CULTURE_LOCAL] Border Growth Points for Natural Wonders.[NEWLINE]Holy Sites in the Empire yield +2 [ICON_CULTURE] Culture.'),

	('TXT_KEY_EVENT_XON_CHOICE_2', 'Build the [ICON_PRODUCTION] Dream of Home'),
	('TXT_KEY_EVENT_XON_CHOICE_2_HELP', 'All Temples in the Empire increase [ICON_PRODUCTION] Production by +10%.[NEWLINE]Holy Sites in the Empire yield +2 [ICON_PRODUCTION] Production.'),

	('TXT_KEY_EVENT_XON_CHOICE_3', 'Chase the [ICON_FOOD] Dream of the Hunt'),
	('TXT_KEY_EVENT_XON_CHOICE_3_HELP', 'All Bonus Resources in the Empire yield +1 [ICON_FOOD] Food.[NEWLINE]Holy Sites in the Empire yield +3 [ICON_FOOD] Food.'),

	('TXT_KEY_EVENT_XON_CHOICE_4', 'Fight the [ICON_GREAT_GENERAL] Dream of War'),
	('TXT_KEY_EVENT_XON_CHOICE_4_HELP', 'All Melee and Gun Units receive the [COLOR_POSITIVE_TEXT]Dream Warrior[ENDCOLOR] Promotion, fighting stronger when Damaged and when near Holy Sites.[NEWLINE]Holy Sites in the Empire yield +1 [ICON_GREAT_GENERAL] Great General Point.'),

	('TXT_KEY_EVENT_XON_CHOICE_5', 'Embrace the [ICON_TOURISM] Dream of Healing'),
	('TXT_KEY_EVENT_XON_CHOICE_5_HELP', 'All non-Armor Land Units receive the [COLOR_POSITIVE_TEXT]Surge of Life[ENDCOLOR] Promotion, doubling healing on [COLOR_POSITIVE_TEXT]Plains[ENDCOLOR] tiles.[NEWLINE]Holy Sites in the Empire yield +3 [ICON_PEACE] Faith.'),

	('TXT_KEY_EVENT_XON_CHOICE_6', 'Accept the [ICON_RESEARCH] Dream of Awakening'),
	('TXT_KEY_EVENT_XON_CHOICE_6_HELP', 'All Specialists gain +1 [ICON_RESEARCH] Science.[NEWLINE]Holy Sites in the Empire yield +4 [ICON_RESEARCH] Science.'),

	('TXT_KEY_EVENT_XON_CHOICE_7', 'Find the [ICON_GOLDEN_AGE] Path to the Next World'),
	('TXT_KEY_EVENT_XON_CHOICE_7_HELP', 'A [ICON_GOLDEN_AGE] Golden Age begins.[NEWLINE]Holy Sites in the Empire yield +5 [ICON_GOLDEN_AGE] Golden Age Points.');


UPDATE Language_en_US SET
Text = Text || '[NEWLINE][NEWLINE]Bonuses are unlocked as follows:[NEWLINE][ICON_BULLET]{TXT_KEY_EVENT_XON_CHOICE_1_HELP}[NEWLINE][ICON_BULLET]{TXT_KEY_EVENT_XON_CHOICE_2_HELP}[NEWLINE][ICON_BULLET]{TXT_KEY_EVENT_XON_CHOICE_3_HELP}[NEWLINE][ICON_BULLET]{TXT_KEY_EVENT_XON_CHOICE_4_HELP}[NEWLINE][ICON_BULLET]{TXT_KEY_EVENT_XON_CHOICE_5_HELP}[NEWLINE][ICON_BULLET]{TXT_KEY_EVENT_XON_CHOICE_6_HELP}[NEWLINE][ICON_BULLET]{TXT_KEY_EVENT_XON_CHOICE_7_HELP}'
WHERE Tag = 'TXT_KEY_UNIT_CD_XON_STRATEGY';



