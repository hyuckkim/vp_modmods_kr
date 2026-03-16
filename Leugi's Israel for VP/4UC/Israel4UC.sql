------------------------------	
-- Civilization_UnitClassOverrides
------------------------------	
INSERT INTO	Civilization_UnitClassOverrides
		(CivilizationType,				UnitClassType,				UnitType)
SELECT	'CIVILIZATION_LEUGI_ISRAEL', 	'UNITCLASS_GREAT_GENERAL', 	'UNIT_ISRAEL_SHOPHET'
WHERE EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_GERMANY_TEUTONIC_ORDER');
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
--------------------------------	
-- UnitPromotions
--------------------------------	
INSERT INTO UnitPromotions
		(Type,							Description,							Help,										CannotBeChosen,	Sound,				PortraitIndex,		IconAtlas,					PediaType,		PediaEntry,								AuraEffectChange, 	LostWithUpgrade, 	BarbarianCombatBonus)
VALUES	('PROMOTION_SHOFAR',			'TXT_KEY_PROMOTION_SHOFAR',				'TXT_KEY_PROMOTION_SHOFAR_HELP',			1,				'AS2D_IF_LEVELUP',	3,					'ISRAEL_PROMOTION_ATLAS',	'PEDIA_SHARED',	'TXT_KEY_PROMOTION_SHOFAR',				0, 					0, 					0),
		('PROMOTION_SHOPHET',			'TXT_KEY_PROMOTION_SHOPHET',			'TXT_KEY_PROMOTION_SHOPHET_HELP',			1,				'AS2D_IF_LEVELUP',	1,					'ISRAEL_PROMOTION_ATLAS',	'PEDIA_SHARED',	'TXT_KEY_PROMOTION_SHOPHET',			0, 					0, 					0);
--------------------------------	
-- Unit_FreePromotions
--------------------------------	
INSERT INTO Unit_FreePromotions 	
		(UnitType, 			PromotionType)
SELECT	'UNIT_ISRAEL_SHOPHET', PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_GREAT_GENERAL';	

INSERT INTO Unit_FreePromotions
		(UnitType, 					PromotionType)
VALUES	('UNIT_ISRAEL_SHOPHET',		'PROMOTION_SHOPHET'),
		('UNIT_ISRAEL_SHOPHET',		'PROMOTION_SHOFAR');
--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
------------------------------
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset )
	VALUES	('ART_DEF_UNIT_ISRAEL_SHOPHET', 'Unit', 'SV_IsraelLS.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------		
INSERT INTO ArtDefine_UnitInfos 
		(Type,							DamageStates,Formation)
SELECT	('ART_DEF_UNIT_ISRAEL_SHOPHET'), DamageStates, Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_U_ZULU_IMPI_WARRIOR');
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 
		(UnitInfoType,					UnitMemberInfoType,					NumMembers)
SELECT	('ART_DEF_UNIT_ISRAEL_SHOPHET'), ('ART_DEF_UNIT_ISRAEL_SHOPHET_MEMBER'), 1
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_U_ZULU_IMPI_WARRIOR');
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType, 						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	('ART_DEF_UNIT_ISRAEL_SHOPHET_MEMBER'), EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_MISSIONARY_01');
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons 
		(UnitMemberType, 						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT 	('ART_DEF_UNIT_ISRAEL_SHOPHET_MEMBER'), "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_MISSIONARY_01');
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 
		(Type, 									Scale, 			ZOffset, Domain, Model, 						MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_ISRAEL_SHOPHET_MEMBER'), Scale+0.005, 	ZOffset, Domain, 'Swordsman_Babylon.fxsxml', 	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_MISSIONARY_01');
------------------------------
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
			(Atlas, 							IconSize, 	Filename, 						IconsPerRow, 	IconsPerColumn)
VALUES		('UNIT_ISRAEL_SHOPHET_ATLAS', 		256, 		'ISRAEL_SHOFET_256.dds',		1, 				1),
			('UNIT_ISRAEL_SHOPHET_ATLAS', 		128, 		'ISRAEL_SHOFET_128.dds',		1, 				1),
			('UNIT_ISRAEL_SHOPHET_ATLAS', 		80, 		'ISRAEL_SHOFET_080.dds',		1, 				1),
			('UNIT_ISRAEL_SHOPHET_ATLAS', 		64, 		'ISRAEL_SHOFET_064.dds',		1, 				1),
			('UNIT_ISRAEL_SHOPHET_ATLAS', 		45, 		'ISRAEL_SHOFET_045.dds',		1, 				1),
			('UNIT_ISRAEL_SHOPHET_FLAG_ATLAS', 	32, 		'IsraelUnitAlphaAtlas.dds',		1, 				1);
--------------------------------	
-- Units
--------------------------------
INSERT INTO Units 	
		(Type, 					Class, MinorCivGift, 	DontShowYields, WorkRate, CivilianAttackPriority, SupplyCapBoost, 	PrereqTech, RangedCombat, Range, Special, Combat, Cost, ObsoleteTech, GoodyHutUpgradeUnitClass, FaithCost, RequiresFaithPurchaseEnabled, Moves,	CombatClass, Domain,	DefaultUnitAI,	Help, 								Description, 					Civilopedia, 						Strategy, 		 							Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfoEraVariation, UnitArtInfo, 					UnitFlagIconOffset,	UnitFlagAtlas,						PortraitIndex, 		IconAtlas,						MoveRate, PurchaseCooldown, GlobalFaithPurchaseCooldown)
SELECT	'UNIT_ISRAEL_SHOPHET',	Class, 0, 				DontShowYields, WorkRate, CivilianAttackPriority, SupplyCapBoost, 	PrereqTech, RangedCombat, Range, Special, Combat, Cost, ObsoleteTech, GoodyHutUpgradeUnitClass, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain,	DefaultUnitAI,  'TXT_KEY_UNIT_ISRAEL_SHOPHET_HELP',	'TXT_KEY_UNIT_ISRAEL_SHOPHET',  'TXT_KEY_UNIT_ISRAEL_SHOPHET_TEXT',	'TXT_KEY_UNIT_ISRAEL_SHOPHET_STRATEGY',  	Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfoEraVariation, 'ART_DEF_UNIT_ISRAEL_SHOPHET',	0,					'UNIT_ISRAEL_SHOPHET_FLAG_ATLAS',	0, 					'UNIT_ISRAEL_SHOPHET_ATLAS', 	MoveRate, PurchaseCooldown, GlobalFaithPurchaseCooldown
FROM Units WHERE Type = 'UNIT_GREAT_GENERAL';
--------------------------------	
-- Unit_Builds
--------------------------------
INSERT INTO Unit_Builds 	
		(UnitType, 				BuildType)
SELECT	'UNIT_ISRAEL_SHOPHET',	'BUILD_CITADEL';
--------------------------------	
-- UnitGameplay2DScripts
--------------------------------		
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_ISRAEL_SHOPHET', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_GREAT_GENERAL';
--------------------------------		
-- Unit_AITypes
--------------------------------		
INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_ISRAEL_SHOPHET', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_GREAT_GENERAL';
--------------------------------	
-- Unit_Flavors
--------------------------------		
INSERT INTO Unit_Flavors 	
			(UnitType, 				FlavorType, Flavor)
SELECT		'UNIT_ISRAEL_SHOPHET', FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_GREAT_GENERAL';
--------------------------------
-- Unit_UniqueNames
--------------------------------
INSERT INTO Unit_UniqueNames 
		(UnitType, 				UniqueName)
VALUES	('UNIT_ISRAEL_SHOPHET',	'TXT_KEY_UNIT_ISRAEL_SHOPHET_1'),
		('UNIT_ISRAEL_SHOPHET',	'TXT_KEY_UNIT_ISRAEL_SHOPHET_2'),
		('UNIT_ISRAEL_SHOPHET',	'TXT_KEY_UNIT_ISRAEL_SHOPHET_3'),
		('UNIT_ISRAEL_SHOPHET',	'TXT_KEY_UNIT_ISRAEL_SHOPHET_4'),
		('UNIT_ISRAEL_SHOPHET',	'TXT_KEY_UNIT_ISRAEL_SHOPHET_5'),
		('UNIT_ISRAEL_SHOPHET',	'TXT_KEY_UNIT_ISRAEL_SHOPHET_6'),
		('UNIT_ISRAEL_SHOPHET',	'TXT_KEY_UNIT_ISRAEL_SHOPHET_7'),
		('UNIT_ISRAEL_SHOPHET',	'TXT_KEY_UNIT_ISRAEL_SHOPHET_8'),
		('UNIT_ISRAEL_SHOPHET',	'TXT_KEY_UNIT_ISRAEL_SHOPHET_9'),
		('UNIT_ISRAEL_SHOPHET',	'TXT_KEY_UNIT_ISRAEL_SHOPHET_10'),
		('UNIT_ISRAEL_SHOPHET',	'TXT_KEY_UNIT_ISRAEL_SHOPHET_11'),
		('UNIT_ISRAEL_SHOPHET',	'TXT_KEY_UNIT_ISRAEL_SHOPHET_12'),
		('UNIT_ISRAEL_SHOPHET',	'TXT_KEY_UNIT_ISRAEL_SHOPHET_13'),
		('UNIT_ISRAEL_SHOPHET',	'TXT_KEY_UNIT_ISRAEL_SHOPHET_14'),
		('UNIT_ISRAEL_SHOPHET',	'TXT_KEY_UNIT_ISRAEL_SHOPHET_15'),
		('UNIT_ISRAEL_SHOPHET',	'TXT_KEY_UNIT_ISRAEL_SHOPHET_16'),
		('UNIT_ISRAEL_SHOPHET',	'TXT_KEY_UNIT_ISRAEL_SHOPHET_17'),
		('UNIT_ISRAEL_SHOPHET',	'TXT_KEY_UNIT_ISRAEL_SHOPHET_18'),
		('UNIT_ISRAEL_SHOPHET',	'TXT_KEY_UNIT_ISRAEL_SHOPHET_19'),
		('UNIT_ISRAEL_SHOPHET',	'TXT_KEY_UNIT_ISRAEL_SHOPHET_20'),
		('UNIT_ISRAEL_SHOPHET',	'TXT_KEY_UNIT_ISRAEL_SHOPHET_21'),
		('UNIT_ISRAEL_SHOPHET',	'TXT_KEY_UNIT_ISRAEL_SHOPHET_22');
--==========================================================================================================================
-- Builds
--==========================================================================================================================
INSERT INTO Builds
		(Type, 			PrereqTech, 		ImprovementType, 		Time,	Description, 				Help, 							Recommendation,				 EntityEvent, HotKey, OrderPriority, CtrlDown, IconIndex, IconAtlas)
SELECT	'BUILD_KIBBUTZ','TECH_FERTILIZER',	'IMPROVEMENT_KIBBUTZ',	Time,	'TXT_KEY_BUILD_KIBBUTZ',	'TXT_KEY_BUILD_KIBBUTZ_HELP',	'TXT_KEY_BUILD_KIBBUTZ_REC', EntityEvent, HotKey, OrderPriority, CtrlDown, 4, 'CIV_COLOR_ATLAS_ISRAEL'
FROM Builds WHERE Type='BUILD_FARM' AND EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_GERMANY_TEUTONIC_ORDER');
------------------------------
-- BuildFeatures
------------------------------
INSERT INTO BuildFeatures
		(BuildType, 		FeatureType,	PrereqTech,	Time,	Production, Remove)
SELECT	'BUILD_KIBBUTZ',	FeatureType,	PrereqTech,	Time,	Production,	Remove
FROM BuildFeatures WHERE BuildType = 'BUILD_FARM'
AND EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_GERMANY_TEUTONIC_ORDER');
------------------------------				
-- Unit_Builds
------------------------------
DELETE FROM Unit_Builds	WHERE BuildType = 'BUILD_KIBBUTZ';
INSERT INTO Unit_Builds
		(UnitType,		BuildType)
SELECT 	'UNIT_WORKER',	'BUILD_KIBBUTZ' WHERE EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_GERMANY_TEUTONIC_ORDER');
--==========================================================================================================================
-- Improvements
--==========================================================================================================================
INSERT INTO Improvements
		(Type, 					Description, 					Civilopedia, 						ArtDefineTag, 					Help, 							SpecificCivRequired, CivilizationType, 				PillageGold, 	RequiresImprovement, 	NoTwoAdjacent, 	FreshWaterMakesValid, 	RequiresFlatlandsOrFreshWater, 	PortraitIndex, IconAtlas)
SELECT	'IMPROVEMENT_KIBBUTZ',	'TXT_KEY_IMPROVEMENT_KIBBUTZ', 'TXT_KEY_IMPROVEMENT_KIBBUTZ_TEXT', 'ART_DEF_IMPROVEMENT_KIBBUTZ', 	'TXT_KEY_BUILD_KIBBUTZ_HELP', 	1, 					'CIVILIZATION_LEUGI_ISRAEL', 	40, 			1, 						1, 				1, 						1, 								3, 'CIV_COLOR_ATLAS_ISRAEL'
WHERE EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_GERMANY_TEUTONIC_ORDER');
------------------------------
-- Improvement_ValidImprovements
------------------------------
INSERT INTO Improvement_ValidImprovements
		(ImprovementType, 		PrereqImprovement)
SELECT 	'IMPROVEMENT_KIBBUTZ', 'IMPROVEMENT_FARM' WHERE EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_GERMANY_TEUTONIC_ORDER');
------------------------------
-- Improvement_Yields
------------------------------
INSERT INTO Improvement_Yields
		(ImprovementType, 		YieldType, 		Yield)
SELECT 	'IMPROVEMENT_KIBBUTZ', 'YIELD_CULTURE', 3 WHERE EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_GERMANY_TEUTONIC_ORDER') UNION ALL
SELECT 	'IMPROVEMENT_KIBBUTZ', 'YIELD_SCIENCE', 3 WHERE EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_GERMANY_TEUTONIC_ORDER') UNION ALL
SELECT 	'IMPROVEMENT_KIBBUTZ', 'YIELD_PRODUCTION', 3 WHERE EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_GERMANY_TEUTONIC_ORDER') UNION ALL
SELECT 	'IMPROVEMENT_KIBBUTZ', 'YIELD_FOOD', 	 8 WHERE EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_GERMANY_TEUTONIC_ORDER');
------------------------------
-- Improvement_ResourceTypes
------------------------------
INSERT INTO Improvement_ResourceTypes
		(ImprovementType, 		ResourceType)
SELECT	'IMPROVEMENT_KIBBUTZ',	ResourceType
FROM Improvement_ResourceTypes WHERE ImprovementType='IMPROVEMENT_FARM'
AND EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_GERMANY_TEUTONIC_ORDER');
------------------------------
-- Improvement_TechYieldChanges
------------------------------
INSERT INTO Improvement_TechYieldChanges
		(ImprovementType, 		TechType,			YieldType, 		Yield)
SELECT 	'IMPROVEMENT_KIBBUTZ', 'TECH_BALLISTICS',	'YIELD_SCIENCE', 1 WHERE EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_GERMANY_TEUTONIC_ORDER') UNION ALL
SELECT 	'IMPROVEMENT_KIBBUTZ', 'TECH_BALLISTICS',	'YIELD_CULTURE', 1 WHERE EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_GERMANY_TEUTONIC_ORDER') UNION ALL
SELECT 	'IMPROVEMENT_KIBBUTZ', 'TECH_BALLISTICS',	'YIELD_PRODUCTION', 1 WHERE EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_GERMANY_TEUTONIC_ORDER') UNION ALL
SELECT 	'IMPROVEMENT_KIBBUTZ', 'TECH_MOBILE_TACTICS',	'YIELD_SCIENCE', 1 WHERE EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_GERMANY_TEUTONIC_ORDER') UNION ALL
SELECT 	'IMPROVEMENT_KIBBUTZ', 'TECH_MOBILE_TACTICS',	'YIELD_CULTURE', 1 WHERE EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_GERMANY_TEUTONIC_ORDER') UNION ALL
SELECT 	'IMPROVEMENT_KIBBUTZ', 'TECH_MOBILE_TACTICS',	'YIELD_PRODUCTION', 1 WHERE EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_GERMANY_TEUTONIC_ORDER');
------------------------------
-- Improvement_ValidTerrains
------------------------------
INSERT INTO Improvement_ValidTerrains
		(ImprovementType, 		TerrainType)
SELECT	'IMPROVEMENT_KIBBUTZ',	'TERRAIN_DESERT' WHERE EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_GERMANY_TEUTONIC_ORDER');
------------------------------
-- Improvement_AdjacentYieldChanges
------------------------------
/* OLD TABLE
INSERT INTO Improvement_AdjacentImprovementYieldChanges
		(ImprovementType,		OtherImprovementType,	YieldType,			Yield)
SELECT 	'IMPROVEMENT_KIBBUTZ',	'IMPROVEMENT_FARM',		'YIELD_PRODUCTION',	1 WHERE EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_GERMANY_TEUTONIC_ORDER');

INSERT INTO Improvement_AdjacentImprovementYieldChanges
		(ImprovementType,		OtherImprovementType,	YieldType,			Yield)
SELECT	'IMPROVEMENT_KIBBUTZ', 	Type, 					'YIELD_PRODUCTION', 1
FROM Improvements WHERE CreatedByGreatPerson = 1
AND EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_GERMANY_TEUTONIC_ORDER');*/

INSERT INTO Improvement_YieldPerXAdjacentImprovement
		(ImprovementType, 			OtherImprovementType, 	YieldType, Yield, NumRequired)
SELECT	'IMPROVEMENT_FARM', 		'IMPROVEMENT_KIBBUTZ', 'YIELD_PRODUCTION', 1, 1 WHERE EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_GERMANY_TEUTONIC_ORDER') UNION ALL
SELECT	Type, 						'IMPROVEMENT_KIBBUTZ', 'YIELD_PRODUCTION', 1, 1 FROM Improvements WHERE CreatedByGreatPerson = 1
AND EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_GERMANY_TEUTONIC_ORDER');
------------------------------
-- Policy_ImprovementYieldChanges
------------------------------		
INSERT INTO Policy_ImprovementYieldChanges
		(PolicyType, ImprovementType, 		YieldType, Yield)
SELECT 	PolicyType, 'IMPROVEMENT_KIBBUTZ', 	YieldType, Yield
FROM Policy_ImprovementYieldChanges WHERE ImprovementType = 'IMPROVEMENT_ENCAMPMENT_SHOSHONE'
AND EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_GERMANY_TEUTONIC_ORDER');
--==========================================================================================================================
-- ArtDefine_LandmarkTypes
--==========================================================================================================================
INSERT INTO ArtDefine_LandmarkTypes(Type, LandmarkType, FriendlyName)
SELECT 'ART_DEF_IMPROVEMENT_KIBBUTZ', 'Improvement', 'KIBBUTZ' WHERE EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_GERMANY_TEUTONIC_ORDER');
------------------------------
-- ArtDefine_Landmarks
------------------------------	
INSERT INTO ArtDefine_Landmarks(Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
SELECT 'Any', 'UnderConstruction', 0.8,  'ART_DEF_IMPROVEMENT_KIBBUTZ', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'kibbutz_hb.fxsxml', 1 WHERE EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_GERMANY_TEUTONIC_ORDER') UNION ALL
SELECT 'Any', 'Constructed', 0.8,  'ART_DEF_IMPROVEMENT_KIBBUTZ', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'kibbutz.fxsxml', 1 WHERE EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_GERMANY_TEUTONIC_ORDER') UNION ALL
SELECT 'Any', 'Pillaged', 0.6,  'ART_DEF_IMPROVEMENT_KIBBUTZ', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'kibbutz_pl.fxsxml', 1 WHERE EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_GERMANY_TEUTONIC_ORDER');
------------------------------
-- ArtDefine_StrategicView
------------------------------	
INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
SELECT 'ART_DEF_IMPROVEMENT_KIBBUTZ', 'Improvement', 'sv_KIBBUTZ.dds' WHERE EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_GERMANY_TEUTONIC_ORDER');
--==========================================================================================================================
--==========================================================================================================================