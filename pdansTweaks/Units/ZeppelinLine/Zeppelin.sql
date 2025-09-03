UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'PROMOTIONS_VARIABLE_RECON';
--=====================================================================================================================--
--Unit ArtDefines--
--=====================================================================================================================--
--Zeppelin
INSERT INTO ArtDefine_UnitInfos(Type, DamageStates) 
VALUES ('ART_DEF_UNIT_WWI_ZEPPELIN', 1); 

INSERT INTO ArtDefine_UnitInfoMemberInfos(UnitInfoType, UnitMemberInfoType, NumMembers) 
VALUES ('ART_DEF_UNIT_WWI_ZEPPELIN', 'ART_DEF_UNIT_MEMBER_WWI_ZEPPELIN', 1); 

INSERT INTO ArtDefine_UnitMemberInfos(Type, Scale, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag) 
VALUES ('ART_DEF_UNIT_MEMBER_WWI_ZEPPELIN', 0.10, 50.0, 'Hover', 'UnitLines/ZeppelinLine/Zeppelin/ZeppelinTC.fxsxml', 'METAL', 'METALLRG'); 

INSERT INTO ArtDefine_UnitMemberCombats(UnitMemberType, EnableActions, TargetRadius, TargetHeight, HasShortRangedAttack, HasLeftRightAttack, HasRefaceAfterCombat, HasIndependentWeaponFacing) 
VALUES ('ART_DEF_UNIT_MEMBER_WWI_ZEPPELIN', 'Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady AttackSurfaceToAir', 1.0, 65.0, 0, 0, 0, 0); 

--INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, HitEffect, HitRadius, ContinuousFire, WeaponTypeTag, WeaponTypeSoundOverrideTag) 
--VALUES ('ART_DEF_UNIT_MEMBER_WWI_ZEPPELIN', 0, 0, 'ART_DEF_VEFFECT_ANTIAIR_IMPACT_$(TERRAIN)', 32.0, 1, 'BULLETHC', 'BULLETHC'); 

--INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, HitEffect, HitRadius, WeaponTypeTag, WeaponTypeSoundOverrideTag) 
--VALUES ('ART_DEF_UNIT_MEMBER_WWI_ZEPPELIN', 1, 0, 'ART_DEF_VEFFECT_ANTIAIR_IMPACT_$(TERRAIN)', 16.0, 'BULLETHC', 'BULLETHC'); 

--INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, HitRadius, WeaponTypeTag, WeaponTypeSoundOverrideTag) 
--VALUES ('ART_DEF_UNIT_MEMBER_WWI_ZEPPELIN', 0, 0, 15.0, 25.0, 0.899999976158142, 10.0, 'BULLETHC', 'BULLETHC'); 

INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, HitRadius, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag) 
VALUES ('ART_DEF_UNIT_MEMBER_WWI_ZEPPELIN', 0, 0, 15.0, 25.0, 0.899999976158142, 10.0, 1, 1, 'EXPLOSIVE', 'EXPLOSION200POUND'); 

INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, HitEffect, WeaponTypeTag, WeaponTypeSoundOverrideTag) 
VALUES ('ART_DEF_UNIT_MEMBER_WWI_ZEPPELIN', 1, 0, 25.0, 50.0, 'ART_DEF_VEFFECT_ARTILLERY_IMPACT_$(TERRAIN)', 'EXPLOSIVE', 'EXPLOSION20POUND'); 

INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset) 
VALUES ('ART_DEF_UNIT_WWI_ZEPPELIN', 'Unit', 'WWI_Zeppelin_SV.dds'); 

-- =======================================================================================================
--		Predator Drone Art Defines
-- =======================================================================================================
-- Unit Art Defines
INSERT INTO ArtDefine_UnitInfos 
		(Type, DamageStates, Formation) 
VALUES 	('ART_DEF_UNIT_PREDATOR_DRONE', 1, "FighterWing");

INSERT INTO ArtDefine_UnitInfoMemberInfos 
		(UnitInfoType, UnitMemberInfoType, NumMembers)
VALUES 	('ART_DEF_UNIT_PREDATOR_DRONE', 'ART_DEF_UNIT_MEMBER_PREDATOR_DRONE', 1);

INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, TileType, Asset) 
VALUES 	('ART_DEF_UNIT_PREDATOR_DRONE', 'Unit', 'UAV_SV.dds');

-- Unit Member Art Defines
INSERT INTO ArtDefine_UnitMemberInfos 
		(Type, Scale, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
VALUES 	('ART_DEF_UNIT_MEMBER_PREDATOR_DRONE', 0.13, "Air", 'SMAN_UAV_Predator.fxsxml', "METAL", "METALLRG");

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType, EnableActions, AttackRadius, MoveRate, TurnRateMin, TurnRateMax, HasRefaceAfterCombat)
VALUES 	('ART_DEF_UNIT_MEMBER_PREDATOR_DRONE', "Idle Attack Bombard Death Run", 135.0, 2.0, 0.25, 0.5, 0);

INSERT INTO ArtDefine_UnitMemberCombatWeapons 
		(UnitMemberType, "Index", SubIndex, ProjectileSpeed, HitEffect, HitRadius, WeaponTypeTag, WeaponTypeSoundOverrideTag)
VALUES 	('ART_DEF_UNIT_MEMBER_PREDATOR_DRONE', 0, 0, 3.0, 'ART_DEF_VEFFECT_FIGHTER_MACHINE_GUN_HIT_$(TERRAIN)', 15.0, "BULLETHC", "BULLETHC");

INSERT INTO ArtDefine_UnitMemberCombatWeapons 
		(UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, HitEffect, HitRadius, WeaponTypeTag, WeaponTypeSoundOverrideTag)
VALUES 	('ART_DEF_UNIT_MEMBER_PREDATOR_DRONE', 1, 0, 1.0, 1.0, 'ART_DEF_VEFFECT_FIGHTER_MACHINE_GUN_HIT_$(TERRAIN)', 15.0, "BULLETHC", "BULLETHC");

INSERT INTO ArtDefine_UnitMemberCombatWeapons 
		(UnitMemberType, "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, WeaponTypeTag, WeaponTypeSoundOverrideTag)
VALUES 	('ART_DEF_UNIT_MEMBER_PREDATOR_DRONE', 1, 1, 'PROJECTILE', 25.0, 50.0, 3.0, 'EXPLOSIVE', 'EXPLOSION200POUND');
------------------------------
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
			(Atlas, 							IconSize, 	Filename, 							IconsPerRow, 	IconsPerColumn)
VALUES		('UNIT_TWEAKS_ATLAS', 				256, 		'PDanUnitTweaksAtlas_256.dds',		3,				1),
			('UNIT_TWEAKS_ATLAS', 				128, 		'PDanUnitTweaksAtlas_128.dds',		3, 				1),
			('UNIT_TWEAKS_ATLAS', 				80, 		'PDanUnitTweaksAtlas_080.dds',		3, 				1),
			('UNIT_TWEAKS_ATLAS', 				64, 		'PDanUnitTweaksAtlas_064.dds',		3, 				1),
			('UNIT_TWEAKS_ATLAS', 				45, 		'PDanUnitTweaksAtlas_045.dds',		3, 				1),
			('UNIT_ZEPPELIN_FLAG_ATLAS', 		32, 		'WWI_Zeppelin_Flag.dds', 			1, 				1),
			('UNIT_UAV_FLAG_ATLAS', 			32, 		'UAV_UnitFlag32.dds', 				1, 				1);
--==========================================================================================================================	
-- UNITS
--==========================================================================================================================	
--------------------------------
-- UnitCombats
--------------------------------
INSERT INTO UnitCombatInfos
		(Type, 					Description)
VALUES	('UNITCOMBAT_AIRSHIP', 	'TXT_KEY_UNITCOMBAT_AIRSHIP');
--------------------------------
-- UnitClasses
--------------------------------
INSERT INTO UnitClasses
		(Type, 							Description, 					DefaultUnit)
VALUES	('UNITCLASS_ZEPPELIN', 			'TXT_KEY_UNIT_ZEPPELIN_CBP', 	'UNIT_ZEPPELIN'),
		('UNITCLASS_WWI_ZEPPELIN', 		'TXT_KEY_UNIT_WWI_ZEPPELIN', 	'UNIT_WWI_ZEPPELIN'),
		('UNITCLASS_PREDATOR_DRONE', 	'TXT_KEY_UNIT_PREDATOR_DRONE', 	'UNIT_PREDATOR_DRONE');

--------------------------------	
-- Units
--------------------------------	
INSERT INTO Units
		(Class, 						Type, 					Combat, Cost, 	FaithCost, 	RequiresFaithPurchaseEnabled, 	Moves, 	BaseSightRange, BaseLandAirDefense, 	PrereqTech, 		ObsoleteTech, 	CombatClass, 			Domain, 		NoBadGoodies, 	DefaultUnitAI, 		Description, 					Civilopedia, 							Strategy, 									Help, 								GoodyHutUpgradeUnitClass, 		Pillage, 	MilitarySupport, 	MilitaryProduction, Mechanized, AdvancedStartCost, 	XPValueAttack, 	XPValueDefense, UnitArtInfo, 									UnitFlagAtlas, 						UnitFlagIconOffset, PortraitIndex, 	IconAtlas, 						MoveRate, 	PurchaseCooldown)
VALUES	('UNITCLASS_ZEPPELIN', 			'UNIT_ZEPPELIN', 		40, 	700, 	600, 		1, 								3, 		4, 				2, 						'TECH_STEAM_POWER', 'TECH_RADIO', 	'UNITCOMBAT_AIRSHIP', 	'DOMAIN_LAND', 	1, 				'UNITAI_EXPLORE', 	'TXT_KEY_UNIT_ZEPPELIN_CBP', 	'TXT_KEY_CIV5_ZEPPELIN_TEXT_CBP', 		'TXT_KEY_UNIT_ZEPPELIN_STRATEGY_CBP', 		'TXT_KEY_UNIT_HELP_ZEPPELIN_CBP', 	'UNITCLASS_WWI_ZEPPELIN', 		1, 			1, 					1, 					1, 			30, 				3, 				3, 				'ART_DEF_UNIT_SMOKEY_STEAM_AIRSHIP_LEVEL_1', 	'EXPANSION_SCEN_UNIT_FLAG_ATLAS', 	7, 					7, 				'EXPANSION_SCEN_UNIT_ATLAS', 	'WHEELED', 	1),
		('UNITCLASS_WWI_ZEPPELIN', 		'UNIT_WWI_ZEPPELIN', 	60, 	1400, 	700, 		1, 								3, 		4, 				3, 						'TECH_RADIO', 		'TECH_TELECOM', 'UNITCOMBAT_AIRSHIP', 	'DOMAIN_LAND', 	1, 				'UNITAI_EXPLORE', 	'TXT_KEY_UNIT_WWI_ZEPPELIN', 	'TXT_KEY_UNIT_WWI_ZEPPELIN_TEXT', 		'TXT_KEY_UNIT_WWI_ZEPPELIN_STRATEGY', 		'TXT_KEY_UNIT_WWI_ZEPPELIN_HELP', 	'UNITCLASS_PREDATOR_DRONE', 	1, 			1, 					1, 					1, 			30, 				3, 				3, 				'ART_DEF_UNIT_WWI_ZEPPELIN', 					'UNIT_ZEPPELIN_FLAG_ATLAS', 		0, 					17, 			'COMMUNITY_2_ATLAS', 			'WHEELED', 	1);

INSERT INTO Units
		(Class, 						Type, 					Combat, Cost, 	FaithCost, 	RequiresFaithPurchaseEnabled, 	Moves, 	BaseSightRange, BaseLandAirDefense, 	PrereqTech, 						CombatClass, 			Domain, 		NoBadGoodies, 	DefaultUnitAI, 		Description, 					Civilopedia, 							Strategy, 									Help, 																Pillage, 	MilitarySupport, 	MilitaryProduction, Mechanized, AdvancedStartCost, 	XPValueAttack, 	XPValueDefense, UnitArtInfo, 									UnitFlagAtlas, 						UnitFlagIconOffset, PortraitIndex, 	IconAtlas, 						MoveRate, 	PurchaseCooldown)
VALUES	('UNITCLASS_PREDATOR_DRONE', 	'UNIT_PREDATOR_DRONE', 	70, 	1750, 	1000, 		1, 								4, 		4, 				5, 						'TECH_TELECOM', 					'UNITCOMBAT_AIRSHIP', 	'DOMAIN_LAND', 	1, 				'UNITAI_EXPLORE', 	'TXT_KEY_UNIT_PREDATOR_DRONE', 	'TXT_KEY_UNIT_PREDATOR_DRONE_TEXT', 	'TXT_KEY_UNIT_PREDATOR_DRONE_STRATEGY', 	'TXT_KEY_UNIT_PREDATOR_DRONE_HELP', 								1, 			1, 					1, 					1, 			30, 				3, 				3, 				'ART_DEF_UNIT_PREDATOR_DRONE', 					'UNIT_UAV_FLAG_ATLAS', 				0, 					18, 			'COMMUNITY_2_ATLAS', 			'WHEELED', 	1);

--------------------------------	
-- Unit_Flavors
--------------------------------	
INSERT INTO		Unit_Flavors
		(UnitType, 				FlavorType,				Flavor)
VALUES	('UNIT_ZEPPELIN',		'FLAVOR_NAVAL_RECON',	10),
		('UNIT_ZEPPELIN',		'FLAVOR_RANGED',		5),
		('UNIT_ZEPPELIN',		'FLAVOR_OFFENSE',		5),
		('UNIT_ZEPPELIN',		'FLAVOR_RECON',			10),
		('UNIT_WWI_ZEPPELIN',	'FLAVOR_NAVAL_RECON',	10),
		('UNIT_WWI_ZEPPELIN',	'FLAVOR_RANGED',		5),
		('UNIT_WWI_ZEPPELIN',	'FLAVOR_OFFENSE',		5),
		('UNIT_WWI_ZEPPELIN',	'FLAVOR_RECON',			10),
		('UNIT_PREDATOR_DRONE',	'FLAVOR_NAVAL_RECON',	10),
		('UNIT_PREDATOR_DRONE',	'FLAVOR_RANGED',		5),
		('UNIT_PREDATOR_DRONE',	'FLAVOR_OFFENSE',		5),
		('UNIT_PREDATOR_DRONE',	'FLAVOR_RECON',			10);
--------------------------------	
-- Unit_BuildingClassPurchaseRequireds
--------------------------------	
INSERT INTO	Unit_BuildingClassPurchaseRequireds
			(UnitType, 				BuildingClassType)
VALUES		('UNIT_ZEPPELIN',		'BUILDINGCLASS_ARMORY'),
			('UNIT_WWI_ZEPPELIN',	'BUILDINGCLASS_MILITARY_ACADEMY'),
			('UNIT_PREDATOR_DRONE',	'BUILDINGCLASS_MILITARY_BASE');
--------------------------------	
-- UnitGameplay2DScripts
--------------------------------		
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT		'UNIT_WWI_ZEPPELIN',	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_ZEPPELIN';

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 				SelectionSound, 		FirstSelectionSound)
VALUES		('UNIT_PREDATOR_DRONE',	'AS2D_SELECT_FIGHTER', 	'AS2D_BIRTH_FIGHTER');
--------------------------------	
-- Unit_AITypes
--------------------------------		
INSERT INTO Unit_AITypes 	
			(UnitType, 				UnitAIType)
VALUES		('UNIT_ZEPPELIN',		'UNITAI_EXPLORE_SEA'),
			('UNIT_ZEPPELIN',		'UNITAI_EXPLORE'),
			('UNIT_ZEPPELIN',		'UNITAI_CITY_BOMBARD'),
			('UNIT_WWI_ZEPPELIN',	'UNITAI_EXPLORE_SEA'),
			('UNIT_WWI_ZEPPELIN',	'UNITAI_EXPLORE'),
			('UNIT_WWI_ZEPPELIN',	'UNITAI_CITY_BOMBARD'),
			('UNIT_PREDATOR_DRONE',	'UNITAI_EXPLORE_SEA'),
			('UNIT_PREDATOR_DRONE',	'UNITAI_EXPLORE'),
			('UNIT_PREDATOR_DRONE',	'UNITAI_CITY_BOMBARD');
--------------------------------	
-- Unit_ClassUpgrades
--------------------------------
INSERT INTO Unit_ClassUpgrades 
		(UnitType, UnitClassType) 
VALUES	('UNIT_ZEPPELIN', 		'UNITCLASS_WWI_ZEPPELIN'),
		('UNIT_WWI_ZEPPELIN', 	'UNITCLASS_PREDATOR_DRONE');
--------------------------------	
-- Unit_FreePromotions
--------------------------------	
INSERT INTO		Unit_FreePromotions
		(UnitType,				PromotionType)
VALUES	('UNIT_ZEPPELIN', 		'PROMOTION_AIRSHIP'),
		('UNIT_ZEPPELIN', 		'PROMOTION_RECON_SHORT_RANGE'),
		('UNIT_ZEPPELIN', 		'PROMOTION_ONLY_ATTACKS_CITIES'),
		('UNIT_ZEPPELIN', 		'PROMOTION_SCOUT_XP_SPOTTING'),
		('UNIT_ZEPPELIN', 		'PROMOTION_SEE_INVISIBLE_SUBMARINE'),
		('UNIT_ZEPPELIN', 		'PROMOTION_AMPHIBIOUS'),
		('UNIT_WWI_ZEPPELIN', 	'PROMOTION_AIRSHIP'),
		('UNIT_WWI_ZEPPELIN', 	'PROMOTION_RECON_SHORT_RANGE'),
		('UNIT_WWI_ZEPPELIN', 	'PROMOTION_ONLY_ATTACKS_CITIES'),
		('UNIT_WWI_ZEPPELIN', 	'PROMOTION_SCOUT_XP_SPOTTING'),
		('UNIT_WWI_ZEPPELIN', 	'PROMOTION_SEE_INVISIBLE_SUBMARINE'),
		('UNIT_WWI_ZEPPELIN', 	'PROMOTION_AMPHIBIOUS'),
		('UNIT_PREDATOR_DRONE', 'PROMOTION_RECON_DRONE'),
		('UNIT_PREDATOR_DRONE', 'PROMOTION_AIR_RECON'),
		('UNIT_PREDATOR_DRONE', 'PROMOTION_ONLY_ATTACKS_CITIES'),
		('UNIT_PREDATOR_DRONE', 'PROMOTION_SCOUT_XP_SPOTTING'),
		('UNIT_PREDATOR_DRONE', 'PROMOTION_SEE_INVISIBLE_SUBMARINE'),
		('UNIT_PREDATOR_DRONE', 'PROMOTION_AMPHIBIOUS');
--------------------------------	
-- Civilization_UnitClassOverrides
--------------------------------
INSERT INTO Civilization_UnitClassOverrides
	(CivilizationType, UnitClassType, UnitType)
VALUES
	('CIVILIZATION_MINOR', 'UNITCLASS_ZEPPELIN', 		NULL),
	('CIVILIZATION_MINOR', 'UNITCLASS_WWI_ZEPPELIN', 	NULL),
	('CIVILIZATION_MINOR', 'UNITCLASS_PREDATOR_DRONE', 	NULL);
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
--------------------------------	
-- Airship free Promotions and interactions with Interception
--------------------------------	
INSERT INTO UnitPromotions
			(Type,						Description,						Help,									LostWithUpgrade,	CannotBeChosen,		Recon, 	DefenseMod, IgnoreTerrainCost, 	CanMoveImpassable, 	CanMoveAllTerrain, 	HoveringUnit, 	NoDefensiveBonus, 	Sound,				PortraitIndex,	IconAtlas,			PediaType,		PediaEntry)
VALUES		('PROMOTION_AIRSHIP',		'TXT_KEY_PROMOTION_AIRSHIP',		'TXT_KEY_PROMOTION_AIRSHIP_HELP',		1,					1,					1, 			33, 		1, 					1, 					1, 					1, 				1, 					'AS2D_IF_LEVELUP',	17,				'promoVP_atlas_01',	'PEDIA_AIR',	'TXT_KEY_PROMOTION_AIRSHIP'),
			('PROMOTION_RECON_DRONE',	'TXT_KEY_PROMOTION_RECON_DRONE',	'TXT_KEY_PROMOTION_RECON_DRONE_HELP',	1,					1,					1, 			33, 		1, 					1, 					1, 					1, 				1, 					'AS2D_IF_LEVELUP',	17,				'promoVP_atlas_01',	'PEDIA_AIR',	'TXT_KEY_PROMOTION_RECON_DRONE');

INSERT INTO UnitPromotions_UnitCombatMods
		(PromotionType, UnitCombatType, Modifier)
VALUES	('PROMOTION_INTERCEPTION_1', 	'UNITCOMBAT_AIRSHIP', 	33),
		('PROMOTION_INTERCEPTION_2', 	'UNITCOMBAT_AIRSHIP', 	33),
		('PROMOTION_INTERCEPTION_3', 	'UNITCOMBAT_AIRSHIP', 	33),
		('PROMOTION_INTERCEPTION_I', 	'UNITCOMBAT_AIRSHIP', 	33),
		('PROMOTION_INTERCEPTION_II', 	'UNITCOMBAT_AIRSHIP', 	33),
		('PROMOTION_INTERCEPTION_III', 	'UNITCOMBAT_AIRSHIP', 	33),
		('PROMOTION_INTERCEPTION_IV', 	'UNITCOMBAT_AIRSHIP', 	33);
--------------------------------
-- Airship Promotion Line
--------------------------------
INSERT INTO UnitPromotions
			(Type,							Description,							Help,										LostWithUpgrade,	CannotBeChosen,	CityAttack, Sound,				PortraitIndex,	IconAtlas,			PediaType,		PediaEntry)
VALUES		('PROMOTION_NIGHT_RAID_I',		'TXT_KEY_PROMOTION_NIGHT_RAID_I',		'TXT_KEY_PROMOTION_NIGHT_RAID_I_HELP',		0,					0,				50, 		'AS2D_IF_LEVELUP',	40,				'PROMOTION_ATLAS',	'PEDIA_AIR',	'TXT_KEY_PROMOTION_NIGHT_RAID_I'),
			('PROMOTION_SURVEILLANCE_I',	'TXT_KEY_PROMOTION_SURVEILLANCE_I',		'TXT_KEY_PROMOTION_SURVEILLANCE_I_HELP',	0,					0,				0, 			'AS2D_IF_LEVELUP',	47,				'extraPromo_Atlas',	'PEDIA_AIR',	'TXT_KEY_PROMOTION_SURVEILLANCE_I');


INSERT INTO UnitPromotions
			(Type,							Description,							Help,										LostWithUpgrade,	CannotBeChosen,		CityAttack, SameTileHealChange, 	MovesChange, 	VisibilityChange, 	DefenseMod, ChangeDamageValue, 	IgnoreZOC, 	PromotionPrereqOr1, 			Sound,				PortraitIndex,	IconAtlas,			PediaType,		PediaEntry)
VALUES		('PROMOTION_SURVEILLANCE_II',	'TXT_KEY_PROMOTION_SURVEILLANCE_II',	'TXT_KEY_PROMOTION_SURVEILLANCE_II_HELP',	0,					0,					0, 			0, 						1, 				1, 					0, 			0, 					0, 			'PROMOTION_SURVEILLANCE_I', 	'AS2D_IF_LEVELUP',	48,				'extraPromo_Atlas',	'PEDIA_AIR',	'TXT_KEY_PROMOTION_SURVEILLANCE_II'),
			('PROMOTION_SURVEILLANCE_III',	'TXT_KEY_PROMOTION_SURVEILLANCE_III',	'TXT_KEY_PROMOTION_SURVEILLANCE_III_HELP',	0,					0,					0, 			0, 						0, 				0, 					33, 		0, 					1, 			'PROMOTION_SURVEILLANCE_II', 	'AS2D_IF_LEVELUP',	49,				'extraPromo_Atlas',	'PEDIA_AIR',	'TXT_KEY_PROMOTION_SURVEILLANCE_III'),
			('PROMOTION_NIGHT_RAID_II',		'TXT_KEY_PROMOTION_NIGHT_RAID_II',		'TXT_KEY_PROMOTION_NIGHT_RAID_II_HELP',		0,					0,					50, 		0, 						0, 				0, 					0, 			0, 					0, 			'PROMOTION_NIGHT_RAID_I', 		'AS2D_IF_LEVELUP',	41,				'PROMOTION_ATLAS',	'PEDIA_AIR',	'TXT_KEY_PROMOTION_NIGHT_RAID_II'),
			('PROMOTION_NIGHT_RAID_III',	'TXT_KEY_PROMOTION_NIGHT_RAID_III',		'TXT_KEY_PROMOTION_NIGHT_RAID_III_HELP',	0,					0,					50, 		0, 						0, 				0, 					0, 			0, 					0, 			'PROMOTION_NIGHT_RAID_II', 		'AS2D_IF_LEVELUP',	42,				'PROMOTION_ATLAS',	'PEDIA_AIR',	'TXT_KEY_PROMOTION_NIGHT_RAID_III'),
			('PROMOTION_NIGHT_RAID_IV',		'TXT_KEY_PROMOTION_NIGHT_RAID_IV',		'TXT_KEY_PROMOTION_NIGHT_RAID_IV_HELP',		0,					0,					100, 		5, 						0, 				0, 					0, 			0, 					0, 			'PROMOTION_NIGHT_RAID_III', 	'AS2D_IF_LEVELUP',	42,				'PROMOTION_ATLAS',	'PEDIA_AIR',	'TXT_KEY_PROMOTION_NIGHT_RAID_IV'),
			('PROMOTION_HIGH_ALTITUDE',		'TXT_KEY_PROMOTION_HIGH_ALTITUDE',		'TXT_KEY_PROMOTION_HIGH_ALTITUDE_HELP',		0,					0,					0, 			0, 						0, 				0, 					0, 			-10, 				0, 			'PROMOTION_SURVEILLANCE_III', 	'AS2D_IF_LEVELUP',	42,				'PROMOTION_ATLAS',	'PEDIA_AIR',	'TXT_KEY_PROMOTION_HIGH_ALTITUDE');

UPDATE UnitPromotions SET PromotionPrereqOr8 = 'PROMOTION_SURVEILLANCE_II' 	WHERE Type = 'PROMOTION_MEDIC';
UPDATE UnitPromotions SET PromotionPrereqOr9 = 'PROMOTION_NIGHT_RAID_II' 	WHERE Type = 'PROMOTION_MEDIC';
UPDATE UnitPromotions SET PromotionPrereqOr4 = 'PROMOTION_SURVEILLANCE_III' WHERE Type = 'PROMOTION_AIR_REPAIR';
UPDATE UnitPromotions SET PromotionPrereqOr9 = 'PROMOTION_SURVEILLANCE_I' 	WHERE Type = 'PROMOTION_ANTIAIR_LAND_I';

INSERT INTO UnitPromotions_Terrains
	(PromotionType, TerrainType, DoubleMove)
VALUES
	('PROMOTION_SURVEILLANCE_I', 'TERRAIN_OCEAN', 1),
	('PROMOTION_SURVEILLANCE_I', 'TERRAIN_COAST', 1);

INSERT INTO	Trait_FreePromotionUnitCombats
			(TraitType,				UnitCombatType, 			PromotionType)
VALUES		('TRAIT_GREAT_EXPANSE',	'UNITCOMBAT_AIRSHIP', 	'PROMOTION_HOMELAND_GUARDIAN_BOOGALOO');

INSERT INTO UnitPromotions_UnitCombats
		(PromotionType, 				UnitCombatType)
VALUES	('PROMOTION_NIGHT_RAID_I', 		'UNITCOMBAT_AIRSHIP'),
		('PROMOTION_NIGHT_RAID_II', 	'UNITCOMBAT_AIRSHIP'),
		('PROMOTION_NIGHT_RAID_III', 	'UNITCOMBAT_AIRSHIP'),
		('PROMOTION_NIGHT_RAID_IV', 	'UNITCOMBAT_AIRSHIP'),
		('PROMOTION_SURVEILLANCE_I', 	'UNITCOMBAT_AIRSHIP'),
		('PROMOTION_SURVEILLANCE_II', 	'UNITCOMBAT_AIRSHIP'),
		('PROMOTION_SURVEILLANCE_III', 	'UNITCOMBAT_AIRSHIP'),
		('PROMOTION_HIGH_ALTITUDE', 	'UNITCOMBAT_AIRSHIP'),
	
		('PROMOTION_MEDIC', 			'UNITCOMBAT_AIRSHIP'),
		('PROMOTION_MEDIC_II', 			'UNITCOMBAT_AIRSHIP'),
		('PROMOTION_AIR_REPAIR', 		'UNITCOMBAT_AIRSHIP'),
		('PROMOTION_ANTIAIR_LAND_I', 	'UNITCOMBAT_AIRSHIP'),
		('PROMOTION_ANTIAIR_LAND_II', 	'UNITCOMBAT_AIRSHIP'),
		('PROMOTION_ANTIAIR_LAND_III', 	'UNITCOMBAT_AIRSHIP'),
	
		('PROMOTION_HIMEJI_CASTLE', 	'UNITCOMBAT_AIRSHIP'),
		('PROMOTION_STATUE_ZEUS', 		'UNITCOMBAT_AIRSHIP'),
		('PROMOTION_MORALE', 			'UNITCOMBAT_AIRSHIP'),
		('PROMOTION_KILL_HEAL', 		'UNITCOMBAT_AIRSHIP'),
		('PROMOTION_HONOR_BONUS', 		'UNITCOMBAT_AIRSHIP'),
		('PROMOTION_NATIONALISM', 		'UNITCOMBAT_AIRSHIP'),
		('PROMOTION_HOMELAND_GUARDIAN_BOOGALOO', 	'UNITCOMBAT_AIRSHIP');

--==========================================================================================================================	
-- Text
--==========================================================================================================================	
UPDATE Language_en_US
SET Text = '+15% Chance to [COLOR_POSITIVE_TEXT]Intercept[ENDCOLOR] Enemy Air Units.[NEWLINE]Negates the Damage Reduction on [COLOR_POSITIVE_TEXT]Airship Units[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_PROMOTION_INTERCEPTION_I_HELP';

UPDATE Language_en_US
SET Text = '+15% Chance to [COLOR_POSITIVE_TEXT]Intercept[ENDCOLOR] Enemy Air Units.[NEWLINE]+50% vs [COLOR_POSITIVE_TEXT]Airship Units[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_PROMOTION_INTERCEPTION_II_HELP'; 

UPDATE Language_en_US
SET Text = '+15% Chance to [COLOR_POSITIVE_TEXT]Intercept[ENDCOLOR] Enemy Air Units.[NEWLINE]+50% vs [COLOR_POSITIVE_TEXT]Airship Units[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_PROMOTION_INTERCEPTION_III_HELP'; 

UPDATE Language_en_US
SET Text = '+15% Chance to [COLOR_POSITIVE_TEXT]Intercept[ENDCOLOR] Enemy Air Units.[NEWLINE]+50% vs [COLOR_POSITIVE_TEXT]Airship Units[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_PROMOTION_INTERCEPTION_IV_HELP';

UPDATE Language_en_US
SET Text = '+33% Chance to [COLOR_POSITIVE_TEXT]Intercept[ENDCOLOR] Enemy Air Units.[NEWLINE]Negates the Damage Reduction on vs [COLOR_POSITIVE_TEXT]Airship Units[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_PROMOTION_INTERCEPTION_1_HELP';
	
UPDATE Language_en_US
SET Text = '+33% Chance to [COLOR_POSITIVE_TEXT]Intercept[ENDCOLOR] Enemy Air Units.[NEWLINE]+33% [ICON_STRENGTH] Combat Strength when [COLOR_POSITIVE_TEXT]Intercepting[ENDCOLOR] Enemy aircraft.[NEWLINE]+50% vs [COLOR_POSITIVE_TEXT]Airship Units[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_PROMOTION_INTERCEPTION_2_HELP';
	
UPDATE Language_en_US
SET Text = '+34% Chance to [COLOR_POSITIVE_TEXT]Intercept[ENDCOLOR] Enemy Air Units.[NEWLINE]+33% [ICON_STRENGTH] Combat Strength when [COLOR_POSITIVE_TEXT]Intercepting[ENDCOLOR] Enemy aircraft. [NEWLINE]+1 operational range.[NEWLINE]+50% vs [COLOR_POSITIVE_TEXT]Airship Units[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_PROMOTION_INTERCEPTION_3_HELP';
	

INSERT INTO Language_en_US (Tag, Text)
VALUES
	('TXT_KEY_UNITCOMBAT_AIRSHIP',				'Airship Unit'),
	('TXT_KEY_PROMOTION_AIRSHIP',				'Airship'),
	('TXT_KEY_PROMOTION_AIRSHIP_HELP',			'Hovering Unit.[NEWLINE]Ignores Terrain Costs.[NEWLINE]Has Unobstructed vision in a 4 Tile radius.[NEWLINE]No Defensive Terrain Bonuses.[NEWLINE]Can only attack [COLOR_NEGATIVE_TEXT]Cities[ENDCOLOR].[NEWLINE][NEWLINE]-33% Defense. Defensive bonus is negated by [COLOR_NEGATIVE_TEXT]Interception[ENDCOLOR] Promotion.'),
	('TXT_KEY_PROMOTION_RECON_DRONE',			'Reconnaissance Drone'),
	('TXT_KEY_PROMOTION_RECON_DRONE_HELP',		'Hovering Unit.[NEWLINE]Ignores Terrain Costs.[NEWLINE]Has Unobstructed vision in a 4 Tile radius.[NEWLINE]No Defensive Terrain Bonuses.[NEWLINE]Can only attack [COLOR_NEGATIVE_TEXT]Cities[ENDCOLOR].[NEWLINE][NEWLINE]-33% Defense. Defensive bonus is negated by [COLOR_NEGATIVE_TEXT]Interception[ENDCOLOR] Promotion.'),
	('TXT_KEY_UNIT_ZEPPELIN_CBP',				'Dirigible'),
	('TXT_KEY_CIV5_ZEPPELIN_TEXT_CBP',			'The oldest means of powered flight were lighter than air craft called dirigibles, or navigable balloons. These craft were used to observe and communicate over active battlefields, first seeing military action in the US Civil War.'),
	('TXT_KEY_UNIT_ZEPPELIN_STRATEGY_CBP',		'Dirigibles are a tough Industrial-era reconnaissance unit that doubles as a potent city attacker. Use Dirigbles to monitor your borders, detect enemy submarines, or to strike undefended enemy cities.'),
	('TXT_KEY_UNIT_HELP_ZEPPELIN_CBP',			'Industrial-era ranged exploration unit. Use these Units to monitor your borders and detect Submarines. It is capable of hovering over Mountains and Ocean. Can only attack Cities.'),
	('TXT_KEY_UNIT_WWI_ZEPPELIN',				'Zeppelin'), 
	('TXT_KEY_UNIT_WWI_ZEPPELIN_TEXT',			'A Zeppelin was a type of rigid airship named after the German Count Ferdinand von Zeppelin who pioneered rigid airship development at the beginning of the 20th century. Zeppelin''s ideas were first formulated in 1874 and developed in detail in 1893. They were patented in Germany in 1895 and in the United States in 1899. After the outstanding success of the Zeppelin design, the word zeppelin came to be commonly used to refer to all rigid airships. Zeppelins were first flown commercially in 1910 by Deutsche Luftschiffahrts-AG (DELAG), the world''s first airline in revenue service. By mid-1914, DELAG had carried over 10,000 fare-paying passengers on over 1,500 flights. During World War I the German military made extensive use of Zeppelins as bombers and scouts, killing over 500 people in bombing raids in Britain.'), 
	('TXT_KEY_UNIT_WWI_ZEPPELIN_STRATEGY',		'Zeppelins are a tough modern-era reconnaissance unit that doubles as a potent city attacker. Use Zeppelins to monitor your borders, detect enemy submarines, or to strike undefended enemy cities.'), 
	('TXT_KEY_UNIT_WWI_ZEPPELIN_HELP',			'Modern-era ranged exploration unit. Use these Units to monitor your borders and detect Submarines. It is capable of hovering over Mountains and Ocean. Can only attack Cities.'), 
	('TXT_KEY_UNIT_PREDATOR_DRONE',				'UAV'), 
	('TXT_KEY_UNIT_PREDATOR_DRONE_TEXT',		'Unmanned Aerial Vehicles, commonly known as UAVs or Drones, are aircraft remotely controlled without an on board human pilot. Used in situations deemed too dull, dirty, or dangerous for a human, UAVs have seen wide use by modern militaries in both reconaissance and as mobile strike platforms. Nations on the cutting edge of military technology predict that future military engagements will rely more and more on drones for military intelligence and combat.'), 
	('TXT_KEY_UNIT_PREDATOR_DRONE_STRATEGY',	'UAVs are the ultimate reconnaissance unit, with unblocked vision of everything within 6 tiles and able to detect Submarines. Use UAVs as your eyes on the battlefield.'), 
	('TXT_KEY_UNIT_PREDATOR_DRONE_HELP',		'Information-era ranged exploration unit. Use these Units to monitor your borders and detect Submarines. It is capable of hovering over Mountains and Ocean and has unobstructed vision in a 6-Tile radius. Can only attack Cities.'), 
	('TXT_KEY_PROMOTION_NIGHT_RAID_I',			'Night Raid I'),
	('TXT_KEY_PROMOTION_NIGHT_RAID_I_HELP',		'+50% [ICON_RANGE_STRENGTH] Ranged Combat Strength when attacking [COLOR_POSITIVE_TEXT]Cities[ENDCOLOR].'),
	('TXT_KEY_PROMOTION_NIGHT_RAID_II',			'Night Raid II'),
	('TXT_KEY_PROMOTION_NIGHT_RAID_II_HELP',	'+50% [ICON_RANGE_STRENGTH] Ranged Combat Strength when attacking [COLOR_POSITIVE_TEXT]Cities[ENDCOLOR].'),
	('TXT_KEY_PROMOTION_NIGHT_RAID_III',		'Night Raid III'),
	('TXT_KEY_PROMOTION_NIGHT_RAID_III_HELP',	'+50% [ICON_RANGE_STRENGTH] Ranged Combat Strength when attacking [COLOR_POSITIVE_TEXT]Cities[ENDCOLOR].'),
	('TXT_KEY_PROMOTION_NIGHT_RAID_IV',			'Night Terror'),
	('TXT_KEY_PROMOTION_NIGHT_RAID_IV_HELP',	'+100% [ICON_RANGE_STRENGTH] Ranged Combat Strength when attacking [COLOR_POSITIVE_TEXT]Cities[ENDCOLOR].[NEWLINE][COLOR_POSITIVE_TEXT]Heals 5 Additional HP[ENDCOLOR] per turn.'),
	('TXT_KEY_PROMOTION_SURVEILLANCE_I',		'Surveillance I'),
	('TXT_KEY_PROMOTION_SURVEILLANCE_I_HELP',	'Double movement rate through [COLOR_POSITIVE_TEXT]Ocean[ENDCOLOR].'),
	('TXT_KEY_PROMOTION_SURVEILLANCE_II',		'Surveillance II'),
	('TXT_KEY_PROMOTION_SURVEILLANCE_II_HELP',	'+1 [ICON_MOVES] Movement and Sight.'),
	('TXT_KEY_PROMOTION_SURVEILLANCE_III',		'Surveillance III'),
	('TXT_KEY_PROMOTION_SURVEILLANCE_III_HELP',	'+33%[ICON_STRENGTH] Strength when [COLOR_POSITIVE_TEXT]Defending[ENDCOLOR].[NEWLINE]Ignores Zone of Control.'),
	('TXT_KEY_PROMOTION_HIGH_ALTITUDE',			'High Altitude'),
	('TXT_KEY_PROMOTION_HIGH_ALTITUDE_HELP',	'Damage from all sources reduced by 10.');
