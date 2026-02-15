--==========================================================================================================================
-- SETTINGS
--==========================================================================================================================	
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'PROMOTIONS_CROSS_ICE';
UPDATE CustomModOptions SET	Value = 1 WHERE	Name = 'EVENTS_TILE_IMPROVEMENTS';

UPDATE Leaders SET PrimaryVictoryPursuit = NULL WHERE Type = 'LEADER_CLEKEUHNICK';
------------------------------
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
			(Atlas, 						IconSize, 	Filename, 					IconsPerRow, 	IconsPerColumn)
VALUES		('BUILDING_IGLOO_ATLAS', 		256, 		'igloo256.dds',				1,				1),
			('BUILDING_IGLOO_ATLAS', 		128, 		'igloo128.dds',				1,				1),
			('BUILDING_IGLOO_ATLAS', 		64, 		'igloo64.dds',				1,				1),
			('BUILDING_IGLOO_ATLAS', 		45, 		'igloo45.dds',				1,				1),
			('UNIT_QAMUTIIK_ATLAS', 		256, 		'Qamutiik256.dds',			1,				1),
			('UNIT_QAMUTIIK_ATLAS', 		128, 		'Qamutiik128.dds',			1,				1),
			('UNIT_QAMUTIIK_ATLAS', 		80, 		'Qamutiik80.dds',			1,				1),
			('UNIT_QAMUTIIK_ATLAS', 		64, 		'Qamutiik64.dds',			1,				1),
			('UNIT_QAMUTIIK_ATLAS', 		45, 		'Qamutiik45.dds',			1,				1),
			('QAMUTIIK_UNIT_FLAG_ATLAS', 	32, 		'QamutiikAlphaAtlas.dds',	1, 				1),
			('INUIT_PROMOTION_ATLAS', 		16, 		'inuit_PI_016.dds',			2,				1),
			('INUIT_PROMOTION_ATLAS', 		32, 		'inuit_PI_032.dds',			2,				1),
			('INUIT_PROMOTION_ATLAS', 		45, 		'inuit_PI_045.dds',			2,				1),
			('INUIT_PROMOTION_ATLAS', 		64, 		'inuit_PI_064.dds',			2,				1),
			('INUIT_PROMOTION_ATLAS', 		256, 		'inuit_PI_256.dds',			2,				1);
--==========================================================================================================================	
--==========================================================================================================================
-- UNIT GRAPHICS
--==========================================================================================================================	
INSERT INTO ArtDefine_UnitInfos(Type, DamageStates, Formation)
  VALUES ('ART_DEF_UNIT_CLINUIT_QAMUTIIK', 1, 'ChariotElephant');
INSERT INTO ArtDefine_UnitInfoMemberInfos(UnitInfoType, UnitMemberInfoType, NumMembers)
  VALUES ('ART_DEF_UNIT_CLINUIT_QAMUTIIK', 'ART_DEF_UNIT_MEMBER_CLINUIT_QAMUTIIK', 1);
INSERT INTO ArtDefine_UnitMemberInfos(Type, Scale, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_CLINUIT_QAMUTIIK', 0.11, 'sledo.fxsxml', 'CLOTH', 'WOODSM');
INSERT INTO ArtDefine_UnitMemberCombats(UnitMemberType, EnableActions, ShortMoveRadius, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasStationaryMelee, HasRefaceAfterCombat, ReformBeforeCombat, OnlyTurnInMovementActions)
  VALUES ('ART_DEF_UNIT_MEMBER_CLINUIT_QAMUTIIK', 'Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady Walk', 24.0, 0.349999994039536, 0.5, 0.75, 15.0, 20.0, 12.0, 1, 1, 1, 1, 1, 1);
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, WeaponTypeTag, WeaponTypeSoundOverrideTag, MissTargetSlopRadius)
  VALUES ('ART_DEF_UNIT_MEMBER_CLINUIT_QAMUTIIK', 0, 0, 'ARROW', 'ARROW', 10.0);
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, WeaponTypeTag, MissTargetSlopRadius)
  VALUES ('ART_DEF_UNIT_MEMBER_CLINUIT_QAMUTIIK', 1, 0, 10.0, 20.0, 'FLAMING_ARROW', 10.0);
------------------------------
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 				TileType,	Asset)
VALUES	('ART_DEF_UNIT_CLINUIT_QAMUTIIK', 	'Unit', 	'sv_Qamutiik.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------		
--INSERT INTO ArtDefine_UnitInfos 
--		(Type, 								DamageStates,	Formation)
--SELECT	'ART_DEF_UNIT_CLINUIT_QAMUTIIK',	DamageStates, 	Formation
--FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_CHARIOT_ARCHER';
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
--INSERT INTO ArtDefine_UnitInfoMemberInfos 	
--		(UnitInfoType,						UnitMemberInfoType,						NumMembers)
--SELECT	'ART_DEF_UNIT_CLINUIT_QAMUTIIK',	'ART_DEF_UNIT_MEMBER_CLINUIT_QAMUTIIK',	NumMembers
--FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_CHARIOT_ARCHER';
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
--INSERT INTO ArtDefine_UnitMemberCombats 
--		(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
--SELECT	'ART_DEF_UNIT_MEMBER_CLINUIT_QAMUTIIK',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
--FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_CHARIOTARCHER';
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
--INSERT INTO ArtDefine_UnitMemberCombatWeapons	
--		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
--SELECT	'ART_DEF_UNIT_MEMBER_CLINUIT_QAMUTIIK',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
--FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_CHARIOTARCHER';
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
--INSERT INTO ArtDefine_UnitMemberInfos 	
--		(Type, 									Scale,  ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
--SELECT	'ART_DEF_UNIT_MEMBER_CLINUIT_QAMUTIIK',	Scale,	ZOffset, Domain, 'sledo.fxsxml',						MaterialTypeTag, MaterialTypeSoundOverrideTag
--FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_CHARIOTARCHER';
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
			(Type, 					Description, 				Help, 								Sound, 				DefenseMod, RangeChange, 	PlagueChance, 	PlaguePromotion, 			OrderPriority, 	LostWithUpgrade,	CannotBeChosen, PortraitIndex, 	IconAtlas, 					PediaType, 		PediaEntry)
VALUES		('PROMOTION_UNAAK', 	'TXT_KEY_PROMOTION_UNAAK',	'TXT_KEY_PROMOTION_UNAAK_HELP', 	'AS2D_IF_LEVELUP',	25,			-1, 			100, 			'PROMOTION_UNAAK_ON_UNIT',	10, 			0,					1, 				1, 				'INUIT_PROMOTION_ATLAS', 	'PEDIA_MELEE', 'TXT_KEY_PROMOTION_UNAAK');

INSERT INTO UnitPromotions 
			(Type, 					Description, 				Help, 								Sound, 				CanCrossIce, 	LostWithUpgrade,	CannotBeChosen, PortraitIndex, 	IconAtlas, 					PediaType, 		PediaEntry)
VALUES		('PROMOTION_TALLUK', 	'TXT_KEY_PROMOTION_TALLUK',	'TXT_KEY_PROMOTION_TALLUK_HELP', 	'AS2D_IF_LEVELUP',	1, 				0,					1, 				0, 				'INUIT_PROMOTION_ATLAS',	'PEDIA_MELEE', 'TXT_KEY_PROMOTION_TALLUK');

INSERT INTO UnitPromotions 
			(Type, 							Description, 						Help, 									Sound, 				MovesChange,	AttackMod,	PromotionDuration, 	PlagueID, 	PlaguePriority, OrderPriority, 	LostWithUpgrade,	CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 		PediaEntry)
VALUES		('PROMOTION_UNAAK_ON_UNIT', 	'TXT_KEY_PROMOTION_UNAAK_ON_UNIT',	'TXT_KEY_PROMOTION_UNAAK_ON_UNIT_HELP', 'AS2D_IF_LEVELUP',	-2,				0,			1, 					2, 			0, 				30, 			0,					1, 				41, 			'promoVP_atlas_03', 'PEDIA_MELEE', 	'TXT_KEY_PROMOTION_UNAAK_ON_UNIT');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================		
--------------------------------
-- UnitPromotions_Terrains
--------------------------------
INSERT INTO UnitPromotions_Terrains
			(PromotionType,			TerrainType,	DoubleMove)
VALUES		('PROMOTION_TALLUK', 	'TERRAIN_SNOW',	1);
--------------------------------	
-- Trait_FreePromotionUnitCombats
--------------------------------
INSERT INTO Trait_FreePromotionUnitCombats
	(TraitType, UnitCombatType, PromotionType)
VALUES
	('TRAIT_UNTILTHEICEBREAKS', 'UNITCOMBAT_RECON', 		'PROMOTION_TALLUK'),
	('TRAIT_UNTILTHEICEBREAKS', 'UNITCOMBAT_ARCHER', 		'PROMOTION_TALLUK'),
	('TRAIT_UNTILTHEICEBREAKS', 'UNITCOMBAT_MELEE', 		'PROMOTION_TALLUK'),
	('TRAIT_UNTILTHEICEBREAKS', 'UNITCOMBAT_SIEGE', 		'PROMOTION_TALLUK'),
	('TRAIT_UNTILTHEICEBREAKS', 'UNITCOMBAT_GUN', 			'PROMOTION_TALLUK'),
	('TRAIT_UNTILTHEICEBREAKS', 'UNITCOMBAT_HELICOPTER', 	'PROMOTION_TALLUK'),
	('TRAIT_UNTILTHEICEBREAKS', 'UNITCOMBAT_MOUNTED', 		'PROMOTION_TALLUK'),
	('TRAIT_UNTILTHEICEBREAKS', 'UNITCOMBAT_ARMOR', 		'PROMOTION_TALLUK'),
	('TRAIT_UNTILTHEICEBREAKS', 'UNITCOMBAT_DIPLOMACY', 	'PROMOTION_TALLUK'),
	('TRAIT_UNTILTHEICEBREAKS', 'UNITCOMBAT_CARGO', 		'PROMOTION_TALLUK'),
	('TRAIT_UNTILTHEICEBREAKS', 'UNITCOMBAT_WORKER', 		'PROMOTION_TALLUK'),
	('TRAIT_UNTILTHEICEBREAKS', 'UNITCOMBAT_SETTLER', 		'PROMOTION_TALLUK'),
	('TRAIT_UNTILTHEICEBREAKS', 'UNITCOMBAT_MISSIONARY', 	'PROMOTION_TALLUK'),
	('TRAIT_UNTILTHEICEBREAKS', 'UNITCOMBAT_INQUISITOR', 	'PROMOTION_TALLUK');
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------
INSERT INTO Units 	
		(Type, 						PrereqTech,			Class, Combat, 		RangedCombat, 	CombatClass, Cost, 		FaithCost, RequiresFaithPurchaseEnabled, Moves, Range, Domain, DefaultUnitAI, Description, 						Civilopedia, 							Strategy, 									Help, 									Pillage, ObsoleteTech,		GoodyHutUpgradeUnitClass, HurryCostModifier, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueAttack, XPValueDefense, Conscription, UnitArtInfo, 						UnitFlagIconOffset,	UnitFlagAtlas,				PortraitIndex, 	IconAtlas,				MoveRate, BaseSightRange, PurchaseCooldown, BaseLandAirDefense, IsMounted)
SELECT	'UNIT_CLINUIT_QAMUTIIK', 	'TECH_AGRICULTURE',	Class, 7, 			7, 				CombatClass, Cost-20, 	FaithCost, RequiresFaithPurchaseEnabled, 3, 	Range, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_CLINUIT_QAMUTIIK',	'TXT_KEY_UNIT_CLINUIT_QAMUTIIK_TEXT', 	'TXT_KEY_UNIT_CLINUIT_QAMUTIIK_STRATEGY', 	'TXT_KEY_UNIT_HELP_CLINUIT_QAMUTIIK', 	Pillage, 'TECH_PHYSICS',	GoodyHutUpgradeUnitClass, HurryCostModifier, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueAttack, XPValueDefense, Conscription, 'ART_DEF_UNIT_CLINUIT_QAMUTIIK',	0,					'QAMUTIIK_UNIT_FLAG_ATLAS',	0, 				'UNIT_QAMUTIIK_ATLAS',	MoveRate, BaseSightRange, PurchaseCooldown, BaseLandAirDefense, IsMounted
FROM Units WHERE Type = 'UNIT_CHARIOT_ARCHER';

INSERT INTO Units 	
		(Type, 						PrereqTech,	Class, Combat, 		RangedCombat, 	CombatClass, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, Range, Domain, DefaultUnitAI, Description, 						Civilopedia, 							Strategy, 									Help, 									Pillage, ObsoleteTech,		GoodyHutUpgradeUnitClass, HurryCostModifier, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueAttack, XPValueDefense, Conscription, UnitArtInfo, 					UnitFlagIconOffset,	UnitFlagAtlas,	PortraitIndex, 	IconAtlas,		MoveRate, BaseSightRange, PurchaseCooldown, BaseLandAirDefense, IsMounted)
SELECT	'UNIT_CLINUIT_UNATATTIK',	PrereqTech,	Class, Combat+3, 	RangedCombat+1, CombatClass, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, Range, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_CLINUIT_UNATATTIK',	'TXT_KEY_UNIT_CLINUIT_UNATATTIK_TEXT', 	'TXT_KEY_UNIT_CLINUIT_UNATATTIK_STRATEGY', 	'TXT_KEY_UNIT_HELP_CLINUIT_UNATATTIK', 	Pillage, 'TECH_METALLURGY',	GoodyHutUpgradeUnitClass, HurryCostModifier, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueAttack, XPValueDefense, Conscription, 'ART_DEF_UNIT_INUIT_UNAAQ',	0,					'UNAAQ_FLAG',	0, 				'UNAAQ_ICON',	MoveRate, BaseSightRange, PurchaseCooldown, BaseLandAirDefense, IsMounted
FROM Units WHERE Type = 'UNIT_CROSSBOWMAN';
--------------------------------
-- UnitGameplay2DScripts
--------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	'UNIT_CLINUIT_QAMUTIIK',	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_CHARIOT_ARCHER';	

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	'UNIT_CLINUIT_UNATATTIK',	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_CROSSBOWMAN';	
--------------------------------
-- Unit_AITypes
--------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_CLINUIT_QAMUTIIK',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_CHARIOT_ARCHER';

INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_CLINUIT_UNATATTIK',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_CROSSBOWMAN';
--------------------------------
-- Unit_ClassUpgrades
--------------------------------	
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 					UnitClassType)
SELECT	'UNIT_CLINUIT_QAMUTIIK',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_CHARIOT_ARCHER';

INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 					UnitClassType)
SELECT	'UNIT_CLINUIT_UNATATTIK',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_CROSSBOWMAN';
--------------------------------
-- Unit_Flavors
--------------------------------
INSERT INTO Unit_Flavors
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_CLINUIT_QAMUTIIK',	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_CHARIOT_ARCHER';

INSERT INTO Unit_Flavors
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_CLINUIT_UNATATTIK',	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_CROSSBOWMAN';
--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
VALUES	('UNIT_CLINUIT_QAMUTIIK',	'PROMOTION_CAN_MOVE_AFTER_ATTACKING'),
		('UNIT_CLINUIT_QAMUTIIK',	'PROMOTION_NO_DEFENSIVE_BONUSES'),
		('UNIT_CLINUIT_QAMUTIIK',	'PROMOTION_CITY_PENALTY'),
		('UNIT_CLINUIT_QAMUTIIK',	'PROMOTION_NAVAL_MISFIRE'),
		('UNIT_CLINUIT_QAMUTIIK',	'PROMOTION_ONLY_DEFENSIVE'),
		('UNIT_CLINUIT_QAMUTIIK',	'PROMOTION_RECON_EXPERIENCE'),
		('UNIT_CLINUIT_UNATATTIK',	'PROMOTION_UNAAK'),
		('UNIT_CLINUIT_UNATATTIK',	'PROMOTION_IGNORE_TERRAIN_COST'),
		('UNIT_CLINUIT_UNATATTIK',	'PROMOTION_ONLY_DEFENSIVE');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
------------------------------
-- Buildings
------------------------------	
INSERT INTO Buildings 	
			(Type,						FreeBuildingThisCity, 	BuildingClass, FinishLandTRTourism, GoldMaintenance, Cost, FaithCost, TradeRouteLandGoldBonus, TradeRouteLandDistanceModifier, TradeRouteRecipientBonus, TradeRouteTargetBonus, EnhancedYieldTech, TechEnhancedTourism, AllowsRangeStrike, ExtraCityHitPoints, TrainedFreePromotion, CitySupplyFlat, NumCityCostMod, GreatPeopleRateModifier, GreatWorkSlotType, GreatWorkCount, FreshWater, FreeStartEra, Happiness, NeverCapture, PrereqTech, ArtDefineTag, SpecialistType, SpecialistCount, MinAreaSize, ConquestProb, HurryCostModifier,	Help,									Description,						Civilopedia,							Strategy,									IconAtlas,				PortraitIndex)
SELECT		'BUILDING_CLINUIT_IGLOO',	FreeBuildingThisCity, 	BuildingClass, FinishLandTRTourism, GoldMaintenance, Cost, FaithCost, TradeRouteLandGoldBonus, TradeRouteLandDistanceModifier, TradeRouteRecipientBonus, TradeRouteTargetBonus, EnhancedYieldTech, TechEnhancedTourism, AllowsRangeStrike, ExtraCityHitPoints, TrainedFreePromotion, CitySupplyFlat, NumCityCostMod, GreatPeopleRateModifier, GreatWorkSlotType, GreatWorkCount, FreshWater, FreeStartEra, Happiness, NeverCapture, PrereqTech, ArtDefineTag, SpecialistType, SpecialistCount, MinAreaSize, ConquestProb, HurryCostModifier,	'TXT_KEY_BUILDING_CLINUIT_IGLOO_HELP',	'TXT_KEY_BUILDING_CLINUIT_IGLOO', 	'TXT_KEY_BUILDING_CLINUIT_IGLOO_TEXT',	'TXT_KEY_BUILDING_CLINUIT_IGLOO_STRATEGY',	'BUILDING_IGLOO_ATLAS',	0
FROM Buildings WHERE Type = 'BUILDING_CARAVANSARY';	
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
			(BuildingType, 				FlavorType,					Flavor)
VALUES		('BUILDING_CLINUIT_IGLOO',	'FLAVOR_GOLD',				50),
			('BUILDING_CLINUIT_IGLOO',	'FLAVOR_PRODUCTION',		20),
			('BUILDING_CLINUIT_IGLOO',	'FLAVOR_CULTURE',			30),
			('BUILDING_CLINUIT_IGLOO',	'FLAVOR_I_TRADE_ORIGIN',	20);
------------------------------	
-- Building_ClassesNeededInCity
------------------------------		
INSERT INTO Building_ClassesNeededInCity 	
			(BuildingType, 				BuildingClassType)
SELECT		'BUILDING_CLINUIT_IGLOO',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_CARAVANSARY';
--------------------------------	
-- Building_ResourceYieldChanges
--------------------------------	
INSERT INTO Building_ResourceYieldChanges
			(BuildingType,				ResourceType, YieldType, Yield)
SELECT		'BUILDING_CLINUIT_IGLOO',	ResourceType, YieldType, Yield
FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_CARAVANSARY';
--------------------------------	
-- Building_SpecialistYieldChangesLocal
--------------------------------	
INSERT INTO Building_SpecialistYieldChangesLocal
			(BuildingType, 				SpecialistType, YieldType, Yield)
SELECT		'BUILDING_CLINUIT_IGLOO',	SpecialistType, YieldType, Yield
FROM Building_SpecialistYieldChangesLocal WHERE BuildingType = 'BUILDING_CARAVANSARY';
--------------------------------	
-- Building_YieldPerXTerrainTimes100
--------------------------------	
INSERT INTO Building_YieldPerXTerrainTimes100
			(BuildingType, 				TerrainType, 		YieldType, 		Yield)
VALUES		
			('BUILDING_CLINUIT_IGLOO',	'TERRAIN_COAST', 	'YIELD_FOOD',	50),
			('BUILDING_CLINUIT_IGLOO',	'TERRAIN_COAST', 	'YIELD_GOLD',	50),
			('BUILDING_CLINUIT_IGLOO',	'TERRAIN_OCEAN', 	'YIELD_FOOD',	50),
			('BUILDING_CLINUIT_IGLOO',	'TERRAIN_OCEAN', 	'YIELD_GOLD',	50),
			('BUILDING_CLINUIT_IGLOO',	'TERRAIN_DESERT', 	'YIELD_FOOD',	50),
			('BUILDING_CLINUIT_IGLOO',	'TERRAIN_DESERT', 	'YIELD_GOLD',	50),
			('BUILDING_CLINUIT_IGLOO',	'TERRAIN_SNOW', 	'YIELD_FOOD',	50),
			('BUILDING_CLINUIT_IGLOO',	'TERRAIN_SNOW', 	'YIELD_GOLD',	50),
			('BUILDING_CLINUIT_IGLOO',	'TERRAIN_TUNDRA', 	'YIELD_FOOD',	50),
			('BUILDING_CLINUIT_IGLOO',	'TERRAIN_TUNDRA', 	'YIELD_GOLD',	50);
------------------------------	
-- Building_YieldChanges
------------------------------		
INSERT INTO Building_YieldChanges 	
			(BuildingType, 				YieldType, Yield)
SELECT		'BUILDING_CLINUIT_IGLOO',	YieldType, Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_CARAVANSARY';
------------------------------	
-- Improvement_AdjacentTerrainYieldChanges
------------------------------				
INSERT INTO Improvement_AdjacentTerrainYieldChanges
	(ImprovementType, TerrainType, YieldType, Yield)
VALUES
	('IMPROVEMENT_INUKSUK', 'TERRAIN_SNOW', 	'YIELD_PRODUCTION', 1),
	('IMPROVEMENT_INUKSUK', 'TERRAIN_TUNDRA', 	'YIELD_PRODUCTION', 1);
------------------------------	
-- Improvement_TechYieldChanges
------------------------------		
INSERT INTO Improvement_TechYieldChanges
	(ImprovementType, TechType, YieldType, Yield)
VALUES
	('IMPROVEMENT_INUKSUK', 'TECH_COMPASS', 	'YIELD_CULTURE', 2),
	('IMPROVEMENT_INUKSUK', 'TECH_NAVIGATION', 	'YIELD_GOLD', 1),
	('IMPROVEMENT_INUKSUK', 'TECH_NAVIGATION', 	'YIELD_FOOD', 1),
	('IMPROVEMENT_INUKSUK', 'TECH_BIOLOGY', 	'YIELD_FOOD', 1),
	('IMPROVEMENT_INUKSUK', 'TECH_BIOLOGY', 	'YIELD_PRODUCTION', 1);
------------------------------	
-- Policy_ImprovementYieldChanges
------------------------------	
INSERT INTO Policy_ImprovementYieldChanges
(PolicyType, ImprovementType, YieldType, Yield)
SELECT PolicyType, 'IMPROVEMENT_INUKSUK', YieldType, Yield
FROM Policy_ImprovementYieldChanges WHERE ImprovementType = 'IMPROVEMENT_ENCAMPMENT_SHOSHONE';
------------------------------	
-- Improvement_ValidTerrains
------------------------------	
DELETE FROM Improvement_ValidTerrains WHERE TerrainType = 'TERRAIN_SNOW' AND ImprovementType = 'IMPROVEMENT_MOAI';
DELETE FROM Improvement_ValidTerrains WHERE TerrainType = 'TERRAIN_SNOW' AND ImprovementType = 'IMPROVEMENT_FEITORIA';
DELETE FROM Improvement_ValidTerrains WHERE TerrainType = 'TERRAIN_SNOW' AND ImprovementType = 'IMPROVEMENT_CHATEAU';
DELETE FROM Improvement_ValidTerrains WHERE TerrainType = 'TERRAIN_SNOW' AND ImprovementType = 'IMPROVEMENT_SPAIN_HACIENDA';
DELETE FROM Improvement_ValidTerrains WHERE TerrainType = 'TERRAIN_SNOW' AND ImprovementType = 'IMPROVEMENT_KASBAH';
DELETE FROM Improvement_ValidTerrains WHERE TerrainType = 'TERRAIN_SNOW' AND ImprovementType = 'IMPROVEMENT_ENCAMPMENT_SHOSHONE';
DELETE FROM Improvement_ValidTerrains WHERE TerrainType = 'TERRAIN_SNOW' AND ImprovementType = 'IMPROVEMENT_EKI';
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
--------------------------------
-- Civilization_Unit/BuildingClassOverrides
--------------------------------	
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 		UnitClassType, 		UnitType)
VALUES		('CIVILIZATION_CLINUIT',	'UNITCLASS_CROSSBOWMAN', 'UNIT_CLINUIT_UNATATTIK');

INSERT INTO Civilization_UnitClassOverrides
		(CivilizationType, UnitClassType, UnitType)
SELECT	'CIVILIZATION_CLINUIT', 'UNITCLASS_CHARIOT_ARCHER', 'UNIT_CLINUIT_QAMUTIIK'
WHERE EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_GERMANY_TEUTONIC_ORDER');

INSERT INTO Civilization_BuildingClassOverrides
		(CivilizationType, BuildingClassType, BuildingType)
SELECT	'CIVILIZATION_CLINUIT', 'BUILDINGCLASS_CARAVANSARY', 'BUILDING_CLINUIT_IGLOO'
WHERE EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_GERMANY_TEUTONIC_ORDER');