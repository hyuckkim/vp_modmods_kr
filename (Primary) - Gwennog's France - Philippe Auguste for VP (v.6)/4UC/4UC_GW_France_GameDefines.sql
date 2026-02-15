--==========================================================================================================================	
-- Civilization_UnitClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_UnitClassOverrides
		(CivilizationType,			UnitClassType, 		UnitType)
SELECT	'CIVILIZATION_GW_FRANCE',	'UNITCLASS_CANNON',	'UNIT_GW_FRANCE_CANNON_GRIBEAUVAL'
WHERE EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_GERMANY_TEUTONIC_ORDER');
--------------------------------
-- Civilization_BuildingClassOverrides
--------------------------------
INSERT INTO Civilization_BuildingClassOverrides
		(CivilizationType,			BuildingClassType,				BuildingType)
SELECT	'CIVILIZATION_GW_FRANCE',	'BUILDINGCLASS_PUBLIC_SCHOOL',	'BUILDING_FRANCE_GRANDE_ECOLE'
WHERE EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_GERMANY_TEUTONIC_ORDER');
--==========================================================================================================================	
-- ArtDefine_StrategicView
--==========================================================================================================================
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 						TileType,	Asset)
SELECT	'ART_DEF_UNIT_GW_FRANCE_CANNON_GRIBEAUVAL',	TileType,	'SV_GW_France_Canon_Gribeauval.dds'
FROM ArtDefine_StrategicView WHERE StrategicViewType = 'ART_DEF_UNIT_CANNON';	
------------------------------
-- ArtDefine_UnitInfos
------------------------------
INSERT INTO ArtDefine_UnitInfos 
			(Type, 										DamageStates,	Formation)
SELECT		'ART_DEF_UNIT_GW_FRANCE_CANNON_GRIBEAUVAL',	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_CANNON';
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,								UnitMemberInfoType,									NumMembers)
SELECT	'ART_DEF_UNIT_GW_FRANCE_CANNON_GRIBEAUVAL',	'ART_DEF_UNIT_MEMBER_GW_FRANCE_CANNON_GRIBEAUVAL',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_CANNON';
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,										EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_GW_FRANCE_CANNON_GRIBEAUVAL',		EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_CANNON';
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,									"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_GW_FRANCE_CANNON_GRIBEAUVAL',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_CANNON';
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 													Scale,  ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_GW_FRANCE_CANNON_GRIBEAUVAL',		Scale,	ZOffset, Domain, 'NapoleonCannon.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_CANNON';
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
------------------------------
-- UnitPromotions
------------------------------	
INSERT INTO UnitPromotions
		(Type,								CannotBeChosen, MultiAttackBonus,	PortraitIndex,	IconAtlas,						PediaType,		PediaEntry,										Description,								Help,	Sound)
SELECT	'PROMOTION_GW_FRANCE_FEU_NOURRI',	CannotBeChosen,	MultiAttackBonus,	3,				'GW_FRANCE_PROMOTION_ATLAS',	'PEDIA_RANGED',	'TXT_KEY_PROMOTION_GW_FRANCE_FEU_NOURRI',		'TXT_KEY_PROMOTION_GW_FRANCE_FEU_NOURRI',	Help,	Sound
FROM UnitPromotions WHERE Type = 'PROMOTION_FOCUS_FIRE';	

INSERT INTO UnitPromotions
		(Type,									CannotBeChosen, AlwaysHeal,	LostWithUpgrade,	PortraitIndex,	IconAtlas,						PediaType,		PediaEntry,										Description,									Help,												Sound)
SELECT	'PROMOTION_GW_FRANCE_STANDARDISATION',	CannotBeChosen,	AlwaysHeal,	1,					4,				'GW_FRANCE_PROMOTION_ATLAS',	'PEDIA_RANGED',	'TXT_KEY_PROMOTION_GW_FRANCE_STANDARDISATION',	'TXT_KEY_PROMOTION_GW_FRANCE_STANDARDISATION',	'TXT_KEY_PROMOTION_GW_FRANCE_STANDARDISATION_HELP',	Sound
FROM UnitPromotions WHERE Type = 'PROMOTION_REPAIR';
------------------------------
-- Units
------------------------------
INSERT INTO Units 	
		(Type, 								Class, 	PrereqTech,	Combat,		RangedCombat,	Cost,	FaithCost,	RequiresFaithPurchaseEnabled,	Moves, Range,	BaseSightRange,	CombatClass, Domain, DefaultUnitAI, Description, 							Civilopedia, 								Strategy, 										Help, 										MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, Pillage, XPValueAttack,	XPValueDefense,	MoveRate,	ObsoleteTech,		GoodyHutUpgradeUnitClass, PurchaseCoolDown,	UnitArtInfoEraVariation, UnitArtInfo, 									UnitFlagIconOffset, UnitFlagAtlas,			PortraitIndex, 	IconAtlas)
SELECT	'UNIT_GW_FRANCE_CANNON_GRIBEAUVAL',	Class,	PrereqTech,	Combat+2,	RangedCombat+1,	Cost,	FaithCost,	RequiresFaithPurchaseEnabled,	Moves, Range,	BaseSightRange,	CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_GW_FRANCE_CANNON_GRIBEAUVAL',	'TXT_KEY_GW_FRANCE_CANNON_GRIBEAUVAL_TEXT',	'TXT_KEY_GW_FRANCE_CANNON_GRIBEAUVAL_STRATEGY',	'TXT_KEY_GW_FRANCE_CANNON_GRIBEAUVAL_HELP',	MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, Pillage, XPValueAttack,	XPValueDefense,	MoveRate,	'TECH_BALLISTICS',	GoodyHutUpgradeUnitClass, PurchaseCoolDown,	UnitArtInfoEraVariation, 'ART_DEF_UNIT_GW_FRANCE_CANNON_GRIBEAUVAL',	1,					'GW_FRANCE_UNIT_FLAG',	4, 				'GW_FRANCE_ATLAS'
FROM Units WHERE Type = 'UNIT_CANNON';
------------------------------	
-- Unit_ResourceQuantityRequirements
------------------------------		
INSERT INTO Unit_ResourceQuantityRequirements 	
		(UnitType, 					ResourceType)
SELECT	'UNIT_GW_FRANCE_CANNON_GRIBEAUVAL',	ResourceType
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_CANNON';
--------------------------------
-- UnitGameplay2DScripts
--------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 							SelectionSound, FirstSelectionSound)
SELECT	'UNIT_GW_FRANCE_CANNON_GRIBEAUVAL',	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_CANNON';	
--------------------------------
-- Unit_AITypes
--------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_GW_FRANCE_CANNON_GRIBEAUVAL',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_CANNON';
--------------------------------
-- Unit_Flavors
--------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 							FlavorType, Flavor)
SELECT	'UNIT_GW_FRANCE_CANNON_GRIBEAUVAL',	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_CANNON';
--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_GW_FRANCE_CANNON_GRIBEAUVAL',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_CANNON';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 						PromotionType)
VALUES	('UNIT_GW_FRANCE_CANNON_GRIBEAUVAL', 	'PROMOTION_GW_FRANCE_FEU_NOURRI'),
		('UNIT_GW_FRANCE_CANNON_GRIBEAUVAL', 	'PROMOTION_GW_FRANCE_STANDARDISATION');
--------------------------------
-- Unit_ClassUpgrades
--------------------------------
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 							UnitClassType)
SELECT	'UNIT_GW_FRANCE_CANNON_GRIBEAUVAL',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_CANNON';
--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================
--------------------------------
-- Buildings
--------------------------------
INSERT INTO	Buildings
		(Type,							Description,							Civilopedia,									Strategy,											Help,											GoldMaintenance, Cost, FaithCost, HurryCostModifier, MinAreaSize, ConquestProb, BuildingClass, ArtDefineTag, PrereqTech, PortraitIndex, IconAtlas,			GreatWorkYieldType,	UnlockedByBelief, SpecialistCount, SpecialistType, IlliteracyFlatReduction, NoUnhappfromXSpecialists,	GreatPeopleRateModifier)
SELECT	'BUILDING_FRANCE_GRANDE_ECOLE', 'TXT_KEY_BUILDING_FRANCE_GRANDE_ECOLE',	'TXT_KEY_BUILDING_FRANCE_GRANDE_ECOLE_TEXT',	'TXT_KEY_BUILDING_FRANCE_GRANDE_ECOLE_STRATEGY',	'TXT_KEY_BUILDING_FRANCE_GRANDE_ECOLE_HELP',	GoldMaintenance, Cost, FaithCost, HurryCostModifier, MinAreaSize, ConquestProb, BuildingClass, ArtDefineTag, PrereqTech, 2,				'GW_FRANCE_ATLAS',	GreatWorkYieldType,	UnlockedByBelief, SpecialistCount, SpecialistType, IlliteracyFlatReduction, 1,							25
FROM Buildings WHERE Type = 'BUILDING_PUBLIC_SCHOOL';
--------------------------------
-- Building_Flavors
--------------------------------
INSERT INTO	Building_Flavors
		(BuildingType,						FlavorType,				Flavor)
VALUES	('BUILDING_FRANCE_GRANDE_ECOLE',	'FLAVOR_SCIENCE',		80),
		('BUILDING_FRANCE_GRANDE_ECOLE',	'FLAVOR_GREAT_PEOPLE',	50),
		('BUILDING_FRANCE_GRANDE_ECOLE',	'FLAVOR_GROWTH',		40),
		('BUILDING_FRANCE_GRANDE_ECOLE',	'FLAVOR_CULTURE',		50),
		('BUILDING_FRANCE_GRANDE_ECOLE',	'FLAVOR_PRODUCTION',	40);			
--------------------------------
-- Building_ClassesNeededInCity
--------------------------------
INSERT INTO Building_ClassesNeededInCity
		(BuildingType,					BuildingClassType)
SELECT	'BUILDING_FRANCE_GRANDE_ECOLE', BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_PUBLIC_SCHOOL';
--------------------------------
-- Building_YieldChanges
--------------------------------
INSERT INTO Building_YieldChanges
		(BuildingType,						YieldType,			Yield)
VALUES	('BUILDING_FRANCE_GRANDE_ECOLE',	'YIELD_CULTURE',	3),
		('BUILDING_FRANCE_GRANDE_ECOLE',	'YIELD_SCIENCE',	3);
--------------------------------
-- Building_ImprovementYieldChanges
--------------------------------
INSERT INTO Building_ImprovementYieldChanges 	
		(BuildingType, 					ImprovementType,	YieldType,			Yield)
SELECT	'BUILDING_FRANCE_GRANDE_ECOLE',	Type,				'YIELD_SCIENCE',	1 FROM Improvements WHERE CreatedByGreatPerson = 1 UNION ALL
SELECT	'BUILDING_FRANCE_GRANDE_ECOLE',	Type,				'YIELD_TOURISM',	1 FROM Improvements WHERE CreatedByGreatPerson = 1;
--------------------------------
-- Building_SpecialistYieldChangesLocal
--------------------------------
INSERT INTO Building_SpecialistYieldChangesLocal
		(BuildingType,					SpecialistType,		YieldType,			Yield)
SELECT	'BUILDING_FRANCE_GRANDE_ECOLE',	Type,				'YIELD_CULTURE',	1 FROM Specialists WHERE GreatPeopleUnitClass IS NOT NULL UNION ALL
SELECT	'BUILDING_FRANCE_GRANDE_ECOLE',	Type,				'YIELD_TOURISM',	1 FROM Specialists WHERE GreatPeopleUnitClass IS NOT NULL;