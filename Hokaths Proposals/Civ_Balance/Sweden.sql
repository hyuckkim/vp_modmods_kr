--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
-- ArtDefine_StrategicView
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 			TileType,	Asset)
VALUES	('ART_DEF_UNIT_JFD_HUSKARL',	'Unit', 	'sv_Huskarl.dds');
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO ArtDefine_UnitInfos 
		(Type, 							DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_HUSKARL',		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_SWORDSMAN';

INSERT INTO ArtDefine_UnitInfos 
		(Type, 							DamageStates,	Formation, IconAtlas, PortraitIndex)
SELECT	'ART_DEF_UNIT_JFD_HUSKARL_INDUSTRIAL',		DamageStates, 	Formation, 'CORP2_ATLAS', 14
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_SWORDSMAN';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,					UnitMemberInfoType,						NumMembers)
VALUES	('ART_DEF_UNIT_JFD_HUSKARL', 	'ART_DEF_UNIT_MEMBER_JFD_HUSKARL',		1);

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,					UnitMemberInfoType,						NumMembers)
VALUES	('ART_DEF_UNIT_JFD_HUSKARL_INDUSTRIAL', 	'ART_DEF_UNIT_MEMBER_U_DANISH_SKY_INFANTRY',		1);
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombats
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_HUSKARL',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_SWORDSMAN';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_HUSKARL',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_SWORDSMAN';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 								Scale,	ZOffset, Domain, Model, 			 MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_HUSKARL',	Scale,	ZOffset, Domain, 'Huskarl.fxsxml',	 MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_SWORDSMAN';	
--==========================================================================================================================
-- ICON ATLASES
--==========================================================================================================================	
-- IconTextureAtlases
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 							IconSize, 	Filename, 									IconsPerRow, 	IconsPerColumn)
VALUES	
		('HUSKARL_FLAG_ATLAS',		32, 		'JFD_Swedes_UnitFlagAtlas_32.dds',			1, 				1);
---------------------------------------------
-- unit def
---------------------------------------------
INSERT INTO UnitCombatInfos
	(Type, Description)
VALUES
	('UNITCOMBAT_JARL', 'TXT_KEY_UNIT_SWEDISH_JARL');

INSERT INTO Units 
	(Class, Special, Type, PrereqTech, Combat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, 
	Description, Civilopedia, Strategy, Help, 
	MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, GoodyHutUpgradeUnitClass, AdvancedStartCost, PurchaseCooldown, WorkRate, UnitEraUpgrade,
	GlobalFaithPurchaseCooldown,
	UnitArtInfo, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex, UnitArtInfoEraVariation)
VALUES
	('UNITCLASS_GREAT_GENERAL', 'SPECIALUNIT_PEOPLE', 'UNIT_SWEDISH_JARL', NULL, 16, -1, 0, 1, 2, 'UNITCOMBAT_JARL', 'DOMAIN_LAND', 'UNITAI_ATTACK',
	'TXT_KEY_UNIT_SWEDISH_JARL',	'TXT_KEY_UNIT_SWEDISH_JARL_TEXT', 'TXT_KEY_UNIT_SWEDISH_JARL_STRATEGY', 'TXT_KEY_UNIT_SWEDISH_JARL_HELP',
	1, 1, 1, NULL, NULL, 25, 1, 1, 1,
	5,
	'ART_DEF_UNIT_JFD_HUSKARL', 'HUSKARL_FLAG_ATLAS', 0, 'CORP2_ATLAS', 13, 1);

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_SWEDISH_JARL',		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_SWORDSMAN';

INSERT INTO Unit_AITypes
	(UnitType, UnitAIType)
VALUES
	('UNIT_SWEDISH_JARL', 'UNITAI_GENERAL'),
	('UNIT_SWEDISH_JARL', 'UNITAI_ATTACK'),
	('UNIT_SWEDISH_JARL', 'UNITAI_DEFENSE');

UPDATE Units SET
MinorCivGift = 1
WHERE Type = 'UNIT_SWEDISH_HAKKAPELIITTA';

DELETE FROM Civilization_UnitClassOverrides WHERE CivilizationType = 'CIVILIZATION_SWEDEN' AND UnitClassType = 'UNITCLASS_LANCER';

INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 			UnitClassType, 			UnitType)
SELECT	'CIVILIZATION_SWEDEN', 	'UNITCLASS_GREAT_GENERAL', 'UNIT_SWEDISH_JARL';

INSERT INTO Unit_Builds 
	(UnitType, BuildType)
SELECT
	'UNIT_SWEDISH_JARL', 'BUILD_CITADEL';

INSERT INTO Unit_EraCombatStrength 	
		(UnitType, 			EraType,			CombatStrength)
SELECT	'UNIT_SWEDISH_JARL',	'ERA_MEDIEVAL',		Combat FROM Units WHERE Type='UNIT_LONGSWORDSMAN' UNION ALL
SELECT	'UNIT_SWEDISH_JARL',	'ERA_RENAISSANCE',	Combat+3 FROM Units WHERE Type='UNIT_SPANISH_TERCIO' UNION ALL
SELECT	'UNIT_SWEDISH_JARL',	'ERA_ENLIGHTENMENT',	Combat+3 FROM Units WHERE Type='UNIT_LANCER' AND EXISTS (SELECT * FROM Eras WHERE Type = 'ERA_ENLIGHTENMENT') UNION ALL
SELECT	'UNIT_SWEDISH_JARL',	'ERA_INDUSTRIAL',	Combat FROM Units WHERE Type='UNIT_RIFLEMAN' UNION ALL
SELECT	'UNIT_SWEDISH_JARL',	'ERA_MODERN',		Combat FROM Units WHERE Type='UNIT_GREAT_WAR_INFANTRY' UNION ALL
SELECT	'UNIT_SWEDISH_JARL',	'ERA_POSTMODERN',		Combat FROM Units WHERE Type='UNIT_INFANTRY' UNION ALL
SELECT	'UNIT_SWEDISH_JARL',	'ERA_FUTURE',		Combat FROM Units WHERE Type='UNIT_MECHANIZED_INFANTRY';

INSERT INTO Unit_FreePromotions 	
	(UnitType, 	PromotionType)
SELECT	
	'UNIT_SWEDISH_JARL',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_GREAT_GENERAL';

INSERT INTO UnitPromotions
	(Type, Description, Help, PediaEntry,
	PediaType, PortraitIndex, IconAtlas, IsVisibleAboveFlag, CannotBeChosen, PromotionPrereq, TechPrereq,
	CanCrossMountains, CanCrossIce, IgnoreTerrainCost, EmbarkedAllWater, VisibilityChange, EmbarkExtraVisibility, Amphib, 
	GreatGeneralModifier, AuraRangeChange, AlwaysHeal, InfluenceFromCombatXpTimes100, StrongerDamaged, FriendlyLandsModifier, VsUnhappyMod)
VALUES
	('PROMOTION_SWEDISH_LION', 'TXT_KEY_PROMOTION_SWEDISH_LION', 'TXT_KEY_PROMOTION_SWEDISH_LION_HELP', 'TXT_KEY_PROMOTION_SWEDISH_LION',
	'PEDIA_ATTRIBUTES', 2, 'promoVP_atlas_04', 1, 1, NULL, NULL,
	 0, 0, 0, 0, 0, 0, 0,
	 0, 0, 0, 0, 0, 0, 0),
	('PROMOTION_SWEDISH_LION_1', 'TXT_KEY_PROMOTION_SWEDISH_LION_1', 'TXT_KEY_PROMOTION_SWEDISH_LION_1_HELP', 'TXT_KEY_PROMOTION_SWEDISH_LION_1',
	'PEDIA_ATTRIBUTES', 44, 'promoVP_atlas_00', 1, 0, 'PROMOTION_SWEDISH_LION', NULL,
	 0, 0, 0, 0, 0, 0, 0,
	 200, 0, 0, 0, 0, 0, 0),
	('PROMOTION_SWEDISH_LION_2', 'TXT_KEY_PROMOTION_SWEDISH_LION_2', 'TXT_KEY_PROMOTION_SWEDISH_LION_2_HELP', 'TXT_KEY_PROMOTION_SWEDISH_LION_2',
	'PEDIA_ATTRIBUTES', 49, 'promoVP_atlas_02', 1, 0, 'PROMOTION_SWEDISH_LION', 'TECH_DRAMA',
	 1, 1, 1, 1, 0, 0, 1,
	 0, 0, 0, 0, 0, 0, 0),
	('PROMOTION_SWEDISH_LION_3', 'TXT_KEY_PROMOTION_SWEDISH_LION_3', 'TXT_KEY_PROMOTION_SWEDISH_LION_3_HELP', 'TXT_KEY_PROMOTION_SWEDISH_LION_3',
	'PEDIA_ATTRIBUTES', 47, 'promoVP_atlas_00', 1, 0, 'PROMOTION_SWEDISH_LION', 'TECH_METALLURGY',
	 0, 0, 0, 0, 0, 0, 0,
	 0, 1, 1, 0, 0, 0, 0),
	('PROMOTION_SWEDISH_LION_4', 'TXT_KEY_PROMOTION_SWEDISH_LION_4', 'TXT_KEY_PROMOTION_SWEDISH_LION_4_HELP', 'TXT_KEY_PROMOTION_SWEDISH_LION_4',
	'PEDIA_ATTRIBUTES', 37, 'promoVP_atlas_02', 1, 0, 'PROMOTION_SWEDISH_LION', 'TECH_GUILDS',
	 0, 0, 0, 0, 0, 0, 0,
	 0, 0, 0, 2, 0, 0, 0),
	('PROMOTION_SWEDISH_LION_5', 'TXT_KEY_PROMOTION_SWEDISH_LION_5', 'TXT_KEY_PROMOTION_SWEDISH_LION_5_HELP', 'TXT_KEY_PROMOTION_SWEDISH_LION_5',
	'PEDIA_ATTRIBUTES', 16, 'promoVP_atlas_02', 1, 0, 'PROMOTION_SWEDISH_LION', 'TECH_PRINTING_PRESS',
	 0, 0, 0, 0, 0, 0, 0,
	 0, 0, 0, 0, 1, 0, 0),
	('PROMOTION_SWEDISH_LION_6', 'TXT_KEY_PROMOTION_SWEDISH_LION_6', 'TXT_KEY_PROMOTION_SWEDISH_LION_6_HELP', 'TXT_KEY_PROMOTION_SWEDISH_LION_6',
	'PEDIA_ATTRIBUTES', 6, 'promoVP_atlas_01', 1, 0, 'PROMOTION_SWEDISH_LION', 'TECH_CHIVALRY',
	 0, 0, 0, 0, 2, 2, 0,
	 0, 0, 0, 0, 0, 20, 20);

INSERT INTO UnitPromotions_UnitCombats
	(PromotionType, UnitCombatType)
VALUES
	('PROMOTION_EMBARKATION', 'UNITCOMBAT_JARL'),
	('PROMOTION_SWEDISH_LION_1', 'UNITCOMBAT_JARL'),
	('PROMOTION_SWEDISH_LION_2', 'UNITCOMBAT_JARL'),
	('PROMOTION_SWEDISH_LION_3', 'UNITCOMBAT_JARL'),
	('PROMOTION_SWEDISH_LION_4', 'UNITCOMBAT_JARL'),
	('PROMOTION_SWEDISH_LION_5', 'UNITCOMBAT_JARL'),
	('PROMOTION_SWEDISH_LION_6', 'UNITCOMBAT_JARL');

-- this doesnt work yet, but will replace the custom unitcombat
INSERT INTO UnitPromotions_BlockedPromotions
	(PromotionType, BlockedPromotionType)
VALUES
	('PROMOTION_SWEDISH_LION', 'PROMOTION_DRILL_1'),
	('PROMOTION_SWEDISH_LION', 'PROMOTION_SHOCK_1');

INSERT INTO UnitPromotions_CombatModPerAdjacentUnitCombat
	(PromotionType, UnitCombatType, Modifier, Attack, Defense)
SELECT
	'PROMOTION_SWEDISH_LION', Type, 10, 0, 0
FROM UnitCombatInfos WHERE IsMilitary = 1 AND IsNaval = 0 AND IsAerial = 0;

INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
VALUES	
	('UNIT_SWEDISH_JARL', 'PROMOTION_SWEDISH_LION');

INSERT INTO Unit_EraUnitPromotions
	(UnitType, PromotionType, EraType, Value)
VALUES
	('UNIT_SWEDISH_JARL', 'PROMOTION_ALPINE', 'ERA_INDUSTRIAL', 1);

-- Ignores Terrain Costs.[NEWLINE][NEWLINE]Can cross [COLOR_POSITIVE_TEXT]Mountains[ENDCOLOR] and [COLOR_POSITIVE_TEXT]Ice[ENDCOLOR].

INSERT INTO UnitPromotions_InstantYields
	(PromotionType, YieldType, Yield, IsEraScaling)
VALUES
	('PROMOTION_SWEDISH_LION_1', 'YIELD_FOOD', 40, 1),
	('PROMOTION_SWEDISH_LION_1', 'YIELD_CULTURE', 40, 1),
	('PROMOTION_SWEDISH_LION_1', 'YIELD_GREAT_GENERAL_POINTS', 40, 1);

INSERT INTO UnitPromotions_GarrisonYield
	(PromotionType, YieldType, Yield)
VALUES
	('PROMOTION_SWEDISH_LION_4', 'YIELD_GOLD', 2),
	('PROMOTION_SWEDISH_LION_4', 'YIELD_TOURISM', 2),
	('PROMOTION_SWEDISH_LION_4', 'YIELD_GOLDEN_AGE_POINTS', 2);

INSERT INTO UnitPromotions_FortificationYield
VALUES
	('PROMOTION_SWEDISH_LION_4', 'YIELD_GOLD', 2),
	('PROMOTION_SWEDISH_LION_4', 'YIELD_TOURISM', 2),
	('PROMOTION_SWEDISH_LION_4', 'YIELD_GOLDEN_AGE_POINTS', 2);

INSERT INTO UnitPromotions_YieldFromKills
	(PromotionType, YieldType, Yield)
VALUES
	('PROMOTION_SWEDISH_LION_5', 'YIELD_FAITH', 100);

-- not working yet
--INSERT INTO UnitPromotions_YieldFromCombatExperienceTimes100
--	(PromotionType, YieldType, Yield)
--VALUES
--	('PROMOTION_SWEDISH_LION_5', 'YIELD_FAITH', 300);

-- AI wont comprehend this. could set scouting AI but... ye no.
--INSERT INTO UnitPromotions_YieldFromScouting
--	(PromotioNType, YieldType, Yield)
--VALUES
--	('PROMOTION_SWEDISH_LION_2', 'YIELD_CULTURE', 2),
--	('PROMOTION_SWEDISH_LION_2', 'YIELD_SCIENCE', 2);

INSERT INTO Language_en_US
	(Tag, Text)
VALUES
	('TXT_KEY_PROMOTION_SWEDISH_LION', 'Swedish Lion'),
	('TXT_KEY_PROMOTION_SWEDISH_LION_HELP', '+10% [ICON_STRENGTH] Combat Strength per [COLOR_POSITIVE_TEXT]Adjacent Owned Land Unit[ENDCOLOR].[NEWLINE]Unlocks a unique set of [COLOR_POSITIVE_TEXT]Promotions[ENDCOLOR].'),

	('TXT_KEY_PROMOTION_SWEDISH_LION_1', 'Primogeniture'),
	('TXT_KEY_PROMOTION_SWEDISH_LION_1_HELP', 'Receive 40 [ICON_FOOD] Food, [ICON_CULTURE] Culture, [ICON_GREAT_GENERAL] Great General Points in the Jarl''s origin City when chosen, scaling with Era.[NEWLINE]+200% [ICON_GREAT_GENERAL] Great General Points from combat.'),

	('TXT_KEY_PROMOTION_SWEDISH_LION_2', 'Saga'),
	('TXT_KEY_PROMOTION_SWEDISH_LION_2_HELP', 'Ignore Terrain Costs.[NEWLINE]Can cross [COLOR_POSITIVE_TEXT]Mountains[ENDCOLOR], [COLOR_POSITIVE_TEXT]Ice[ENDCOLOR], and [COLOR_POSITIVE_TEXT]Ocean[ENDCOLOR].[NEWLINE]Eliminate combat penalties for attacking from the sea.[NEWLINE][NEWLINE]Available once you have researched [COLOR_CYAN]Drama and Poetry[ENDCOLOR].'),

	('TXT_KEY_PROMOTION_SWEDISH_LION_3', 'Manifesto of War'),
	('TXT_KEY_PROMOTION_SWEDISH_LION_3_HELP', '+1 Radius on the Jarl''s Leadership aura.[NEWLINE]Unit will [COLOR_POSITIVE_TEXT]Heal Every Turn[ENDCOLOR], even if it performs an action.[NEWLINE][NEWLINE]Available once you have researched [COLOR_CYAN]Metallurgy[ENDCOLOR].'),

--  or a Fortification
	('TXT_KEY_PROMOTION_SWEDISH_LION_4', 'High Chancellor'),
	('TXT_KEY_PROMOTION_SWEDISH_LION_4_HELP', 'Generates +1 [ICON_GOLD] Gold, [ICON_TOURISM] Tourism, and [ICON_GOLDEN_AGE] Golden Age Point for every 8 [ICON_STRENGTH] Combat Strength if stationed in a City or Fortification.[NEWLINE][COLOR_GREY]+2 [ICON_INFLUENCE] Influence with the nearest [ICON_CITY_STATE] City-State for every XP earned in combat.[ENDCOLOR][NEWLINE][NEWLINE]Available once you have researched [COLOR_CYAN]Guilds[ENDCOLOR].'),

-- [ICON_PEACE] Faith for every XP earned in combat.
	('TXT_KEY_PROMOTION_SWEDISH_LION_5', 'Gott mit Uns'),
	('TXT_KEY_PROMOTION_SWEDISH_LION_5_HELP', 'Gain 100% of the [ICON_STRENGTH] Combat Strength of defeated Enemy Units as [ICON_PEACE] Faith.[NEWLINE]+1% [ICON_STRENGTH] Combat Strength for every 3 HP below maximum health instead of a penalty.[NEWLINE][NEWLINE]Available once you have researched [COLOR_CYAN]Printing Press[ENDCOLOR].'),

	('TXT_KEY_PROMOTION_SWEDISH_LION_6', 'Riksföreståndare'),
	('TXT_KEY_PROMOTION_SWEDISH_LION_6_HELP', '+20% [ICON_STRENGTH] Combat Strength in [COLOR_POSITIVE_TEXT]Friendly Territory[ENDCOLOR].[NEWLINE]+20% [ICON_STRENGTH] Combat Strength against [ICON_HAPPINESS_3] Unhappy Empires.[NEWLINE]+2 [ICON_VP_VISION] Sight and Embarked Sight.[NEWLINE][NEWLINE]Available once you have researched [COLOR_CYAN]Chivalry[ENDCOLOR].'),

	('TXT_KEY_UNIT_SWEDISH_JARL', 'Jarl'),
	('TXT_KEY_UNIT_SWEDISH_JARL_TEXT', 'Jarl was a rank of the nobility in Scandinavia during the Viking Age and Early Middle Ages. The institution evolved over time and varied by region. In Old Norse, it meant "chieftain", specifically one appointed to rule a territory in a king''s stead. It could also denote a sovereign prince. For example, during the Viking age, the rulers of several of the petty kingdoms of Norway held the title of jarl, often wielding no less power than their neighboring kings. In later medieval Sweden and Norway, there was typically only one jarl in the kingdom, second in authority only to the king. The title became obsolete in the Middle Ages and was replaced by the rank of duke (hertig), which was itself abolished in 1618 when Gustav II Adolph was consolidating his hold over the country.[NEWLINE][NEWLINE]In 1772, King Gustav III reinstated the appointment of dukes, now non-hereditary, for his brothers as courtesy titles, which added to their international prestige and domestic influence. Since then, all Swedish princes have been created dukes of a province at birth, as well as one Great Prince or Grand Duke of Finland (who died in infancy). As with many European monarchies, the royal family have close ties to the military, with many dukes participating in training and serving in the Swedish Armed Forces. This tradition includes the current Crown Princess, who began military training in 2024.'),
	('TXT_KEY_UNIT_SWEDISH_JARL_STRATEGY', 'Whereas other Generals lead their army from the safety of a ranged encampment or otherwise defensible location, the Swedish Jarl leads the army from the frontline! By ignoring terrain costs they can easily be maneuvered into the optimal position, and then gain strength by being surrounded by their troops on all sides to punch a hole in the enemy line. As you progress through the game all your Jarls will naturally increase in strength so you don''t even have to worry about upgrading them! In addition to the [COLOR_POSITIVE_TEXT]Swedish Lion[ENDCOLOR] Promotion, there are 6 additional choices upon level up that unlock progressively throughout the early game, allowing you to customize your heroic Jarl to suit your needs, be they military, exploratory, or civilian.'),
	('TXT_KEY_UNIT_SWEDISH_JARL_HELP', 'Unique Swedish Great General that behaves like a Melee Land Unit. It fights with a scaling [ICON_STRENGTH] Strength appropriate to the [COLOR_CYAN]Era[ENDCOLOR] you are currently in. In addition to usual Leadership bonuses, it has access to a set of unique [COLOR_POSITIVE_TEXT]Promotions[ENDCOLOR]. Starts with the [COLOR_POSITIVE_TEXT]Swedish Lion[ENDCOLOR] Promotion, and additionally the [COLOR_POSITIVE_TEXT]Ski Infantry[ENDCOLOR] Promotion if born after entering the [COLOR_CYAN]Industrial Era[ENDCOLOR].[NEWLINE][NEWLINE]Can be expended to construct a [COLOR_POSITIVE_TEXT]Citadel[ENDCOLOR] improvement which gives a big defensive bonus to any Unit occuping it, damages Enemy Units that finish their turn adjacent to it, puts all adjacent tiles into your territory, and increases your Military Unit Supply Cap by 1.');

INSERT INTO Unit_UniqueNames 
			(UnitType, 				UniqueName)
VALUES			('UNIT_SWEDISH_JARL',	'TXT_KEY_UNIT_SWEDISH_JARL_1'),
			('UNIT_SWEDISH_JARL',	'TXT_KEY_UNIT_SWEDISH_JARL_2'),
			('UNIT_SWEDISH_JARL',	'TXT_KEY_UNIT_SWEDISH_JARL_3'),
			('UNIT_SWEDISH_JARL',	'TXT_KEY_UNIT_SWEDISH_JARL_4'),
			('UNIT_SWEDISH_JARL',	'TXT_KEY_UNIT_SWEDISH_JARL_5'),
			('UNIT_SWEDISH_JARL',	'TXT_KEY_UNIT_SWEDISH_JARL_6'),
			('UNIT_SWEDISH_JARL',	'TXT_KEY_UNIT_SWEDISH_JARL_7'),
			('UNIT_SWEDISH_JARL',	'TXT_KEY_UNIT_SWEDISH_JARL_8'),
			('UNIT_SWEDISH_JARL',	'TXT_KEY_UNIT_SWEDISH_JARL_9'),
			('UNIT_SWEDISH_JARL',	'TXT_KEY_UNIT_SWEDISH_JARL_10'),
			('UNIT_SWEDISH_JARL',	'TXT_KEY_UNIT_SWEDISH_JARL_11'),
			('UNIT_SWEDISH_JARL',	'TXT_KEY_UNIT_SWEDISH_JARL_12'),
			('UNIT_SWEDISH_JARL',	'TXT_KEY_UNIT_SWEDISH_JARL_13'),
			('UNIT_SWEDISH_JARL',	'TXT_KEY_UNIT_SWEDISH_JARL_14'),
			('UNIT_SWEDISH_JARL',	'TXT_KEY_UNIT_SWEDISH_JARL_15'),
			('UNIT_SWEDISH_JARL',	'TXT_KEY_UNIT_SWEDISH_JARL_16'),
			('UNIT_SWEDISH_JARL',	'TXT_KEY_UNIT_SWEDISH_JARL_17');

INSERT INTO Language_en_US
	(Tag, Text)
VALUES
	('TXT_KEY_UNIT_SWEDISH_JARL_1', 'Birger Brosa'),
	('TXT_KEY_UNIT_SWEDISH_JARL_2', 'Johan Sverkersson'),
	('TXT_KEY_UNIT_SWEDISH_JARL_3', 'Knut Birgersson'),
	('TXT_KEY_UNIT_SWEDISH_JARL_4', 'Folke Birgersson'),
	('TXT_KEY_UNIT_SWEDISH_JARL_5', 'Karl the Deaf'),
	('TXT_KEY_UNIT_SWEDISH_JARL_6', 'Ulf Fase'),
	('TXT_KEY_UNIT_SWEDISH_JARL_7', 'Birger Magnusson'),
	('TXT_KEY_UNIT_SWEDISH_JARL_8', 'Ulf Tostesson'),
	('TXT_KEY_UNIT_SWEDISH_JARL_9', 'Ragnvald Ulfsson'),
	('TXT_KEY_UNIT_SWEDISH_JARL_10', 'Nikolaus August'),
	('TXT_KEY_UNIT_SWEDISH_JARL_11', 'John of Östergötland'),
	('TXT_KEY_UNIT_SWEDISH_JARL_12', 'Oscar Bernadotte'),
	('TXT_KEY_UNIT_SWEDISH_JARL_13', 'Bertil of Halland'),
	('TXT_KEY_UNIT_SWEDISH_JARL_14', 'Carl Gustaf'),
	('TXT_KEY_UNIT_SWEDISH_JARL_15', 'The Blue Prince'),  -- son was a rotter, dont want to confuse
	('TXT_KEY_UNIT_SWEDISH_JARL_16', 'Carl of Öland'),
	('TXT_KEY_UNIT_SWEDISH_JARL_17', 'Carolus');


