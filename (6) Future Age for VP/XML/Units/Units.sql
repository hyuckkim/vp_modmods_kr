
--------------------------------	
-- Unit_FreePromotions
--------------------------------	
INSERT INTO		Unit_FreePromotions
		(UnitType,				PromotionType)
VALUES	
    ('UNIT_CARAVAN_BLIMP',           'PROMOTION_FW_MOVE_ALL_TERRAIN'),
    ('UNIT_CARGO_SHIP_BLIMP',           'PROMOTION_FW_MOVE_ALL_TERRAIN');


INSERT INTO Defines (Name, Value) SELECT 'FW_MODERN_COLONIST_POPULATION_CHANGE', '5';
INSERT INTO Defines (Name, Value) SELECT 'FW_MODERN_COLONIST_EXTRA_PLOTS', '5';
INSERT INTO Defines (Name, Value) SELECT 'FW_MODERN_COLONIST_FOOD_PERCENT', '50';
INSERT INTO Defines (Name, Value) SELECT 'FW_SPACE_COLONIST_POPULATION_CHANGE', '5';
INSERT INTO Defines (Name, Value) SELECT 'FW_SPACE_COLONIST_EXTRA_PLOTS', '5';
INSERT INTO Defines (Name, Value) SELECT 'FW_SPACE_COLONIST_FOOD_PERCENT', '50';


-- =======================================================================================================
--		Moderen Colonist
-- =======================================================================================================
INSERT INTO ArtDefine_UnitInfos	(Type, DamageStates, Formation)
VALUES
	('ART_DEF_UNIT_FW_MODERN_COLONIST',		1,	'Vehicle');

INSERT INTO ArtDefine_UnitInfoMemberInfos	(UnitInfoType, UnitMemberInfoType, NumMembers)
VALUES 
	('ART_DEF_UNIT_FW_MODERN_COLONIST',		'ART_DEF_UNIT_MEMBER_FW_MODERN_COLONIST2', 	1),     
	('ART_DEF_UNIT_FW_MODERN_COLONIST',		'ART_DEF_UNIT_MEMBER_FW_MODERN_COLONIST3', 	1),     
	('ART_DEF_UNIT_FW_MODERN_COLONIST',		'ART_DEF_UNIT_MEMBER_FW_MODERN_COLONIST4', 	1);

INSERT INTO ArtDefine_UnitMemberInfos	(Type, Scale, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag, Domain)
VALUES 
	('ART_DEF_UNIT_MEMBER_FW_MODERN_COLONIST2', 0.08, 'GreatArtist_Late.fxsxml', 'CLOTH', 'FLESH',   NULL),  
	('ART_DEF_UNIT_MEMBER_FW_MODERN_COLONIST3', 0.05, 'Caravan_Late.fxsxml',     'CLOTH', 'FLESH',   NULL),  
	('ART_DEF_UNIT_MEMBER_FW_MODERN_COLONIST4', 0.05, 'Caravan_Late.fxsxml',     'CLOTH', 'FLESH',   NULL);  

-- =======================================================================================================
--  Space Colonist 
-- =======================================================================================================
INSERT INTO ArtDefine_UnitInfos (Type, DamageStates, Formation)
VALUES ('ART_DEF_UNIT_FW_SPACE_COLONIST', 1, 'ThreeBigGuns');
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
VALUES ('ART_DEF_UNIT_FW_SPACE_COLONIST', 'ART_DEF_UNIT_MEMBER_FW_SPACE_COLONIST', 3);
INSERT INTO ArtDefine_UnitMemberInfos (Type, Scale, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_FW_SPACE_COLONIST', 0.130000001490116, 'rangedmarine01.fxsxml', 'CLOTH', 'FLESH');
INSERT INTO ArtDefine_UnitMemberCombats (UnitMemberType, EnableActions, HasShortRangedAttack, HasStationaryMelee, HasRefaceAfterCombat, ReformBeforeCombat, HasOpponentTracking)
VALUES ('ART_DEF_UNIT_MEMBER_FW_SPACE_COLONIST', 'Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady', 1, 1, 1, 1, 1);
INSERT INTO ArtDefine_UnitMemberCombatWeapons  (UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, HitEffect, WeaponTypeTag, WeaponTypeSoundOverrideTag)
VALUES  ('ART_DEF_UNIT_MEMBER_FW_SPACE_COLONIST', 0, 0, 25.0, 50.0, 'ART_DEF_VEFFECT_TANK_IMPACT_$(TERRAIN)', 'EXPLOSIVE', 'EXPLOSION20POUND');

-- =======================================================================================================
--  Diplomat
-- =======================================================================================================
-- ArtDefine_UnitInfos
INSERT INTO ArtDefine_UnitInfos (Type, DamageStates, Formation)
VALUES ('ART_DEF_UNIT_FW_AUGMENTED_DIPLOMAT', 1, 'UnFormed');

INSERT INTO ArtDefine_UnitInfos (Type, DamageStates, Formation)
VALUES ('ART_DEF_UNIT_SAS_SCRIBE', 1, 'EarlyGreatArtist');

-- ArtDefine_UnitInfoMemberInfos
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
VALUES ('ART_DEF_UNIT_FW_AUGMENTED_DIPLOMAT', 'ART_DEF_UNIT_MEMBER_SAS_SCRIBE', 1);

INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
VALUES ('ART_DEF_UNIT_SAS_SCRIBE', 'ART_DEF_UNIT_MEMBER_SAS_SCRIBE', 1);

-- ArtDefine_UnitMemberInfos
INSERT INTO ArtDefine_UnitMemberInfos
  (Type,                           Scale, Model,              Domain, MaterialTypeTag, MaterialTypeSoundOverrideTag)
VALUES
  ('ART_DEF_UNIT_MEMBER_SAS_SCRIBE', 0.12, 'BOSScribe.fxsxml', 'Land', 'CLOTH',        'FLESH');

-- ArtDefine_UnitMemberCombats
INSERT INTO ArtDefine_UnitMemberCombats
  (UnitMemberType,                    EnableActions,                                 DisableActions, HasRefaceAfterCombat, HasShortRangedAttack, HasLongRangedAttack, HasStationaryMelee, HasIndependentWeaponFacing, RushAttackFormation)
VALUES
  ('ART_DEF_UNIT_MEMBER_SAS_SCRIBE', 'Idle Fidget Run Death Fortify CombatReady',    NULL,           1,                   0,                    0,                   0,                  0,                         NULL);


 -- ================================================================================================================================================================
UPDATE Units SET ObsoleteTech = 'TECH_IMPLANTS' WHERE Class = 'UNITCLASS_AMBASSADOR'; 
UPDATE Units SET ObsoleteTech = 'TECH_COMPUTERS' WHERE Class = 'UNITCLASS_COLONIST';

INSERT INTO Trait_NoTrain
	(TraitType, UnitClassType)
VALUES
	('TRAIT_SUPER_CITY_STATE', 'UNITCLASS_FW_MODERN_COLONIST'),
	('TRAIT_SUPER_CITY_STATE', 'UNITCLASS_FW_SPACE_COLONIST');

INSERT INTO Unit_ClassUpgrades
	(UnitType, UnitClassType)
VALUES
	('UNIT_COLONIST', 		 			'UNITCLASS_FW_MODERN_COLONIST'),
	('UNIT_FW_MODERN_COLONIST', 		'UNITCLASS_FW_SPACE_COLONIST'),
	('UNIT_AMBASSADOR', 		 		'UNITCLASS_FW_AUGMENTED_DIPLOMAT');

INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
VALUES
	('UNIT_FW_AUGMENTED_DIPLOMAT', 	'PROMOTION_AUGMENTED'),
	('UNIT_FW_AUGMENTED_DIPLOMAT', 	'PROMOTION_FW_CHAMELEON'),
	('UNIT_FW_MODERN_COLONIST', 	'PROMOTION_EXTRA_SIGHT_I'),
	('UNIT_FW_MODERN_COLONIST', 	'PROMOTION_DEFENSIVE_EMBARKATION'),
	('UNIT_FW_MODERN_COLONIST', 	'PROMOTION_OCEAN_MOVEMENT'),
	('UNIT_FW_SPACE_COLONIST', 		'PROMOTION_EXTRA_SIGHT_I'),
	('UNIT_FW_SPACE_COLONIST', 		'PROMOTION_DEFENSIVE_EMBARKATION'),
	('UNIT_FW_SPACE_COLONIST', 		'PROMOTION_OCEAN_MOVEMENT'),
	('UNIT_FW_SPACE_COLONIST', 		'PROMOTION_EXTENDED_PARADROP');


INSERT INTO Unit_BuildOnFound
	(UnitType, BuildingClassType)
VALUES
	('UNIT_FW_MODERN_COLONIST', 'BUILDINGCLASS_AMPHITHEATER'),
	('UNIT_FW_MODERN_COLONIST', 'BUILDINGCLASS_AQUEDUCT'),
	('UNIT_FW_MODERN_COLONIST', 'BUILDINGCLASS_COLOSSEUM'),
	('UNIT_FW_MODERN_COLONIST', 'BUILDINGCLASS_BARRACKS'),
	('UNIT_FW_MODERN_COLONIST', 'BUILDINGCLASS_GROVE'),
	('UNIT_FW_MODERN_COLONIST', 'BUILDINGCLASS_FORGE'),
	('UNIT_FW_MODERN_COLONIST', 'BUILDINGCLASS_GRANARY'),
	('UNIT_FW_MODERN_COLONIST', 'BUILDINGCLASS_HERBALIST'),
	('UNIT_FW_MODERN_COLONIST', 'BUILDINGCLASS_LIBRARY'),
	('UNIT_FW_MODERN_COLONIST', 'BUILDINGCLASS_LIGHTHOUSE'),
	('UNIT_FW_MODERN_COLONIST', 'BUILDINGCLASS_LODGE'),
	('UNIT_FW_MODERN_COLONIST', 'BUILDINGCLASS_HARBOR'),
	('UNIT_FW_MODERN_COLONIST', 'BUILDINGCLASS_MARKET'),
	('UNIT_FW_MODERN_COLONIST', 'BUILDINGCLASS_MONUMENT'),
	('UNIT_FW_MODERN_COLONIST', 'BUILDINGCLASS_SHRINE'),
	('UNIT_FW_MODERN_COLONIST', 'BUILDINGCLASS_TEMPLE'),
	('UNIT_FW_MODERN_COLONIST', 'BUILDINGCLASS_WATERMILL'),
	('UNIT_FW_MODERN_COLONIST', 'BUILDINGCLASS_WELL'),
	('UNIT_FW_MODERN_COLONIST', 'BUILDINGCLASS_WINDMILL'),
	('UNIT_FW_MODERN_COLONIST', 'BUILDINGCLASS_WORKSHOP'),
	('UNIT_FW_MODERN_COLONIST', 'BUILDINGCLASS_MILITARY_ACADEMY'),
	('UNIT_FW_MODERN_COLONIST', 'BUILDINGCLASS_MUSEUM'),
	('UNIT_FW_MODERN_COLONIST', 'BUILDINGCLASS_BROADCAST_TOWER'),
	('UNIT_FW_MODERN_COLONIST', 'BUILDINGCLASS_STOCK_EXCHANGE'),
	('UNIT_FW_SPACE_COLONIST', 'BUILDINGCLASS_AMPHITHEATER'),
	('UNIT_FW_SPACE_COLONIST', 'BUILDINGCLASS_AQUEDUCT'),
	('UNIT_FW_SPACE_COLONIST', 'BUILDINGCLASS_COLOSSEUM'),
	('UNIT_FW_SPACE_COLONIST', 'BUILDINGCLASS_BARRACKS'),
	('UNIT_FW_SPACE_COLONIST', 'BUILDINGCLASS_GROVE'),
	('UNIT_FW_SPACE_COLONIST', 'BUILDINGCLASS_FORGE'),
	('UNIT_FW_SPACE_COLONIST', 'BUILDINGCLASS_GRANARY'),
	('UNIT_FW_SPACE_COLONIST', 'BUILDINGCLASS_HERBALIST'),
	('UNIT_FW_SPACE_COLONIST', 'BUILDINGCLASS_LIBRARY'),
	('UNIT_FW_SPACE_COLONIST', 'BUILDINGCLASS_LIGHTHOUSE'),
	('UNIT_FW_SPACE_COLONIST', 'BUILDINGCLASS_LODGE'),
	('UNIT_FW_SPACE_COLONIST', 'BUILDINGCLASS_HARBOR'),
	('UNIT_FW_SPACE_COLONIST', 'BUILDINGCLASS_MARKET'),
	('UNIT_FW_SPACE_COLONIST', 'BUILDINGCLASS_MONUMENT'),
	('UNIT_FW_SPACE_COLONIST', 'BUILDINGCLASS_SHRINE'),
	('UNIT_FW_SPACE_COLONIST', 'BUILDINGCLASS_TEMPLE'),
	('UNIT_FW_SPACE_COLONIST', 'BUILDINGCLASS_WATERMILL'),
	('UNIT_FW_SPACE_COLONIST', 'BUILDINGCLASS_WELL'),
	('UNIT_FW_SPACE_COLONIST', 'BUILDINGCLASS_WINDMILL'),
	('UNIT_FW_SPACE_COLONIST', 'BUILDINGCLASS_WORKSHOP'),
	('UNIT_FW_SPACE_COLONIST', 'BUILDINGCLASS_MILITARY_ACADEMY'),
	('UNIT_FW_SPACE_COLONIST', 'BUILDINGCLASS_MUSEUM'),
	('UNIT_FW_SPACE_COLONIST', 'BUILDINGCLASS_BROADCAST_TOWER'),
	('UNIT_FW_SPACE_COLONIST', 'BUILDINGCLASS_STOCK_EXCHANGE'),
	('UNIT_FW_SPACE_COLONIST', 'BUILDINGCLASS_AIRPORT'),
	('UNIT_FW_SPACE_COLONIST', 'BUILDINGCLASS_STADIUM'),
	('UNIT_FW_SPACE_COLONIST', 'BUILDINGCLASS_BOMB_SHELTER'),
	('UNIT_FW_SPACE_COLONIST', 'BUILDINGCLASS_MILITARY_BASE'),
	('UNIT_FW_SPACE_COLONIST', 'BUILDINGCLASS_POLICE_STATION');


-- =======================================================================================================
--		New unit line - AirRecon
-- =======================================================================================================
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
		(Class, 						Type, 					Combat, Cost, 	FaithCost, 	RequiresFaithPurchaseEnabled, 	Moves, 	BaseSightRange, BaseLandAirDefense, 	PrereqTech, 		ObsoleteTech, 	                   CombatClass, 			Domain, 	NoBadGoodies, 	DefaultUnitAI, 		Description, 					Civilopedia, 							Strategy, 									Help, 								Pillage, 	MilitarySupport, 	MilitaryProduction, Mechanized, AdvancedStartCost, 	XPValueAttack, 	XPValueDefense, UnitArtInfo, 									UnitFlagAtlas, 						UnitFlagIconOffset, PortraitIndex, 	IconAtlas, 						MoveRate, 	PurchaseCooldown)
VALUES	('UNITCLASS_ZEPPELIN', 			'UNIT_ZEPPELIN', 		32, 	700, 	600, 		1, 								3, 		4, 				2, 						'TECH_STEAM_POWER', 'TECH_PLASTIC', 	            'UNITCOMBAT_HELICOPTER', 	'DOMAIN_LAND', 	1, 				'UNITAI_EXPLORE', 	'TXT_KEY_UNIT_ZEPPELIN_CBP', 	'TXT_KEY_CIV5_ZEPPELIN_TEXT_CBP', 		'TXT_KEY_UNIT_ZEPPELIN_STRATEGY_CBP', 		'TXT_KEY_UNIT_HELP_ZEPPELIN_CBP', 	1, 			1, 					1, 					1, 			30, 				3, 				3, 				'ART_DEF_UNIT_SMOKEY_STEAM_AIRSHIP_LEVEL_1', 	'EXPANSION_SCEN_UNIT_FLAG_ATLAS', 	7, 					7, 				'EXPANSION_SCEN_UNIT_ATLAS', 	'WHEELED', 	1),
		('UNITCLASS_WWI_ZEPPELIN', 		'UNIT_WWI_ZEPPELIN', 	42, 	1000, 	900, 		1, 								3, 		4, 				3, 						'TECH_PLASTIC',     'TECH_SATELLITES',              'UNITCOMBAT_HELICOPTER', 	'DOMAIN_LAND', 	1, 				'UNITAI_EXPLORE', 	'TXT_KEY_UNIT_WWI_ZEPPELIN', 	'TXT_KEY_UNIT_WWI_ZEPPELIN_TEXT', 		'TXT_KEY_UNIT_WWI_ZEPPELIN_STRATEGY', 		'TXT_KEY_UNIT_WWI_ZEPPELIN_HELP', 	1, 			1, 					1, 					1, 			30, 				3, 				3, 				'ART_DEF_UNIT_SMOKEY_STEAM_AIRSHIP', 		    'EXPANSION_SCEN_UNIT_FLAG_ATLAS', 	8, 					8, 		    	'EXPANSION_SCEN_UNIT_ATLAS', 	'WHEELED', 	1),
        ('UNITCLASS_PREDATOR_DRONE', 	'UNIT_PREDATOR_DRONE', 	65, 	1800, 	1400, 		1, 								4, 		4, 				25, 					'TECH_SATELLITES',  'TECH_SUPERCOMPUTERS', 			'UNITCOMBAT_HELICOPTER', 	'DOMAIN_LAND',  1, 				'UNITAI_EXPLORE', 	'TXT_KEY_UNIT_PREDATOR_DRONE', 	'TXT_KEY_UNIT_PREDATOR_DRONE_TEXT', 	'TXT_KEY_UNIT_PREDATOR_DRONE_STRATEGY', 	'TXT_KEY_UNIT_PREDATOR_DRONE_HELP', 1, 			1, 					1, 					1, 			30, 				3, 				3, 				'ART_DEF_UNIT_PREDATOR_DRONE', 				    'UNIT_UAV_FLAG_ATLAS', 		       	0, 					63, 				'TCS_MOD_ICON_ATLAS', 		'WHEELED', 	1);

--------------------------------	
-- Unit_BuildingClassPurchaseRequireds
--------------------------------	
INSERT INTO	Unit_BuildingClassPurchaseRequireds
			(UnitType, 				BuildingClassType)
VALUES		('UNIT_ZEPPELIN',		'BUILDINGCLASS_ARMORY'),
			('UNIT_WWI_ZEPPELIN',	'BUILDINGCLASS_ARMORY'),
			('UNIT_PREDATOR_DRONE',	'BUILDINGCLASS_MILITARY_BASE');

--------------------------------	
-- Unit_ Resource need
--------------------------------	
INSERT INTO Unit_ResourceQuantityRequirements (UnitType, ResourceType, Cost) VALUES
  ('UNIT_ZEPPELIN',       'RESOURCE_COAL',       1),
  ('UNIT_WWI_ZEPPELIN',   'RESOURCE_OIL',        1),
  ('UNIT_PREDATOR_DRONE', 'RESOURCE_ALUMINUM',   1);


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
			('UNIT_WWI_ZEPPELIN',	'UNITAI_EXPLORE_SEA'),
			('UNIT_WWI_ZEPPELIN',	'UNITAI_EXPLORE'),
			('UNIT_PREDATOR_DRONE',	'UNITAI_EXPLORE_SEA'),
			('UNIT_PREDATOR_DRONE',	'UNITAI_EXPLORE');
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
VALUES	
    ('UNIT_ZEPPELIN',           'PROMOTION_FLAT_MOVEMENT_COST'),
    ('UNIT_ZEPPELIN',           'PROMOTION_ANTI_TANK'),
    ('UNIT_ZEPPELIN',           'PROMOTION_HOVERING_UNIT'),
    ('UNIT_ZEPPELIN',           'PROMOTION_NO_DEFENSIVE_BONUSES'),
    ('UNIT_WWI_ZEPPELIN',       'PROMOTION_SEE_INVISIBLE_SUBMARINE'),
    ('UNIT_WWI_ZEPPELIN',       'PROMOTION_FLAT_MOVEMENT_COST'),
    ('UNIT_WWI_ZEPPELIN',       'PROMOTION_ANTI_TANK'),
    ('UNIT_WWI_ZEPPELIN',       'PROMOTION_HOVERING_UNIT'),
    ('UNIT_WWI_ZEPPELIN',       'PROMOTION_NO_DEFENSIVE_BONUSES'),
    ('UNIT_PREDATOR_DRONE',     'PROMOTION_SEE_INVISIBLE_SUBMARINE'),
    ('UNIT_PREDATOR_DRONE',     'PROMOTION_FLAT_MOVEMENT_COST'),
    ('UNIT_PREDATOR_DRONE',     'PROMOTION_ANTI_TANK'),
    ('UNIT_PREDATOR_DRONE',     'PROMOTION_HOVERING_UNIT'),
    ('UNIT_PREDATOR_DRONE',     'PROMOTION_NO_DEFENSIVE_BONUSES');

--------------------------------	
-- Unit_Flavors
--------------------------------	
INSERT INTO		Unit_Flavors
		(UnitType, 				FlavorType,				Flavor)
VALUES	('UNIT_ZEPPELIN',		'FLAVOR_NAVAL_RECON',	10),
		('UNIT_ZEPPELIN',		'FLAVOR_OFFENSE',		5),
		('UNIT_ZEPPELIN',		'FLAVOR_RECON',			10),
		('UNIT_WWI_ZEPPELIN',	'FLAVOR_NAVAL_RECON',	10),
		('UNIT_WWI_ZEPPELIN',	'FLAVOR_OFFENSE',		5),
		('UNIT_WWI_ZEPPELIN',	'FLAVOR_RECON',			10),
		('UNIT_PREDATOR_DRONE',	'FLAVOR_NAVAL_RECON',	10),
		('UNIT_PREDATOR_DRONE',	'FLAVOR_OFFENSE',		5),
		('UNIT_PREDATOR_DRONE',	'FLAVOR_RECON',			10);

----------------
-- FLAVOR 
----------------

INSERT INTO Technology_Flavors (TechType, FlavorType, Flavor)
VALUES
	('TECH_STEAM_POWER', 'FLAVOR_RECON', 10),
	('TECH_PLASTIC',     'FLAVOR_RECON', 10),
	('TECH_SATELLITES',  'FLAVOR_RECON', 10);

-----------------------------------------------------------------
-- Barbarians cannot use/spawn these classes
-----------------------------------------------------------------
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType)
SELECT 'CIVILIZATION_BARBARIAN', Type
FROM UnitClasses
WHERE Type IN (
  'UNITCLASS_ZEPPELIN',
  'UNITCLASS_WWI_ZEPPELIN',
  'UNITCLASS_PREDATOR_DRONE',
);

----------------
-- PROMOTION CHANGE
----------------

INSERT INTO UnitPromotions_UnitClasses
	(PromotionType, UnitClassType, Modifier)
VALUES
	('PROMOTION_ANTI_HELICOPTER', 'UNITCLASS_ZEPPELIN', 150),
	('PROMOTION_ANTI_HELICOPTER', 'UNITCLASS_WWI_ZEPPELIN', 150),
	('PROMOTION_ANTI_HELICOPTER', 'UNITCLASS_PREDATOR_DRONE', 150);



