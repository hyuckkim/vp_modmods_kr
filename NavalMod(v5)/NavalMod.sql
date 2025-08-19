INSERT INTO ArtDefine_UnitInfos (Type,DamageStates,Formation)
	SELECT	('ART_DEF_UNIT_BB_SHIP_OF_THE_LINE'), 3, Formation
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_FRIGATE');
	
INSERT INTO ArtDefine_UnitInfoMemberInfos VALUES	('ART_DEF_UNIT_BB_SHIP_OF_THE_LINE', 'ART_DEF_UNIT_MEMBER_BB_SHIP_OF_THE_LINE', "1");
	
INSERT INTO ArtDefine_UnitMemberCombats (UnitMemberType, EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
	SELECT	('ART_DEF_UNIT_MEMBER_BB_SHIP_OF_THE_LINE'), EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
	FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_FRIGATE');

INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
	SELECT ('ART_DEF_UNIT_MEMBER_BB_SHIP_OF_THE_LINE'), "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
	FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_FRIGATE');

INSERT INTO ArtDefine_UnitMemberInfos (Type, Scale, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
	SELECT	('ART_DEF_UNIT_MEMBER_BB_SHIP_OF_THE_LINE'), Scale, ZOffset, Domain, ('shipoftheline.fxsxml'), MaterialTypeTag, MaterialTypeSoundOverrideTag
	FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_FRIGATE');

INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType,						TileType,			Asset) 
VALUES	('ART_DEF_UNIT_BB_SHIP_OF_THE_LINE',			'Unit',				'sv_ShipoftheLine.dds');

----------------------------------------

INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 				TileType,	Asset)
VALUES	('ART_DEF_UNIT_JFD_STEAM_FRIGATE',	'Unit', 	'sv_SteamFrigate.dds');
	
INSERT INTO ArtDefine_UnitInfos 
		(Type, 								DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_STEAM_FRIGATE', 	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_FRIGATE'; 

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,						UnitMemberInfoType,						 NumMembers)
SELECT	'ART_DEF_UNIT_JFD_STEAM_FRIGATE', 	'ART_DEF_UNIT_MEMBER_JFD_STEAM_FRIGATE', NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_FRIGATE';

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,							EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_STEAM_FRIGATE',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_FRIGATE';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,							"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_STEAM_FRIGATE',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_FRIGATE';

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 										Scale, ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_STEAM_FRIGATE',	Scale, ZOffset, Domain, 'SteamFrigate.fxsxml',  MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_FRIGATE';
------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 				TileType,	Asset)
VALUES	('ART_DEF_UNIT_HEAVY_CRUISER',	'Unit', 	'SV_HeavyCruiser');
	
INSERT INTO ArtDefine_UnitInfos 
		(Type, 								DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_HEAVY_CRUISER', 	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_BATTLESHIP'; 

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,						UnitMemberInfoType,						 NumMembers)
SELECT	'ART_DEF_UNIT_HEAVY_CRUISER', 	'ART_DEF_UNIT_MEMBER_HEAVY_CRUISER', NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_BATTLESHIP';

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,							EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_HEAVY_CRUISER',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_BATTLESHIP';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,							"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_HEAVY_CRUISER',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_BATTLESHIP';

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 										Scale, ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_HEAVY_CRUISER', Scale, ZOffset, Domain, 'Scharnhorst_Class.fxsxml',  MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_BATTLESHIP';
---------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn) VALUES
('NAVALMOD_UNIT_FLAG_ATLAS',32,'Naval_UnitFlags_32.dds',4,3),
('NAVALMOD_UNIT_ATLAS',256,'Naval_Units_256.dds',4,3),
('NAVALMOD_UNIT_ATLAS',128,'Naval_Units_128.dds',4,3),
('NAVALMOD_UNIT_ATLAS',80,'Naval_Units_80.dds',4,3),
('NAVALMOD_UNIT_ATLAS',64,'Naval_Units_64.dds',4,3),
('NAVALMOD_UNIT_ATLAS',45,'Naval_Units_45.dds',4,3),
('naval_promoAtlas', 256, 'NAVAL_promo_icons_256.dds', 8, 1),
('naval_promoAtlas', 064, 'NAVAL_promo_icons_064.dds', 8, 1),
('naval_promoAtlas', 045, 'NAVAL_promo_icons_045.dds', 8, 1),
('naval_promoAtlas', 032, 'NAVAL_promo_icons_032.dds', 8, 1),
('naval_promoAtlas', 016, 'NAVAL_promo_icons_016.dds', 8, 1),
('MA_STEAMFRIGATE_ATLAS',        256,'MA_steamfrigate_Units_256.dds',2,2),
('MA_STEAMFRIGATE_ATLAS',        128,'MA_steamfrigate_Units_128.dds',2,2),
('MA_STEAMFRIGATE_ATLAS',         80,'MA_steamfrigate_Units_80.dds',2,2),
('MA_STEAMFRIGATE_ATLAS',         64,'MA_steamfrigate_Units_64.dds',2,2),
('MA_STEAMFRIGATE_ATLAS',         45,'MA_steamfrigate_Units_45.dds',2,2),
('MA_STEAMFRIGATE_FLAG_ATLAS',    32,'Steamfrigate_UnitFlag.dds',	1,1),
('HVCRUISER_FLAG_ATLAS',    32,'Flag_HeavyCruiser.dds',	1,1);

----------------------------------------------------------------------------------------------------------------------------
-- Naval Capital Ranged promotion tree drawn using ASCIIFlow      
--                                                                Splash Damage I
-- N Artillery I─┬───► N Artillery II──┬───► N Artillery III ─┬─► Firing Doctrine  ────────────────────┐
--               │                     │                      │                                        │
--               │                     │                      └───────────────────────────┐            │
--               │                     │                                                  │            │
--               │                     └────────────────────────────────────┐             │            │
--               │                                                          │             │            │
--               ├─┬─► Belt Armor ───► Armor Plating III  ─► Supply         │             │            │
--               │ │                                                        ├──► Indirect ├───►  Range ├──► Flagship
--               └─┼───────────────────┬─► F Engagement I─► F Engagement II │             │            │
--                 │                   │                                    │             │            │
--                 │                   │ ┌──────────────────────────────────┘             │            │
--                 │                   │ │                                                │            │
--                 │                   │ │                    ┌───────────────────────────┘            │
--                 │                   │ │                    │                                        │
--    Hull I   ────┴─►     Hull II    ─┴─┴─►   Hull III   ────┴─► Shore Bombardment ───────────────────┘
--                                                                Battlecruiser
--                                                                
----------------------------------------------------------------------------------------------------------------------------
UPDATE Language_en_US SET Text = 'Naval Capital Units' WHERE Tag = 'TXT_KEY_UNITCOMBAT_CARRIER';
UPDATE	Language_en_US SET
		Text = REPLACE(Text, 'Carriers', 'Capital Ships')
		WHERE Tag IN ('TXT_KEY_LEAGUE_PROJECT_REWARD_TREASURE_FLEET_3_HELP', 'TXT_KEY_BUILDING_GRAND_CANAL_HELP','TXT_KEY_PROMOTIONS_PEDIA_CARSUB');
-----------------------------------------------------------------------------
INSERT INTO UnitPromotions
	(Type, Description, Help, Sound, LostWithUpgrade, CannotBeChosen, PortraitIndex, IconAtlas, PediaType, PediaEntry, RankList, RankNumber, OrderPriority, FlagPromoOrder)
VALUES
	 ('PROMOTION_DEEP_DRAFT', 'TXT_KEY_PROMOTION_DEEP_DRAFT', 'TXT_KEY_PROMOTION_DEEP_DRAFT_HELP', 'AS2D_IF_LEVELUP', 1, 0, 10, 'promoVP_atlas_01', 'PEDIA_CARSUB', 'TXT_KEY_PROMOTION_DEEP_DRAFT', NULL, 0, 903, 903),
	('PROMOTION_ESCORT', 'TXT_KEY_PROMOTION_ESCORT', 'TXT_KEY_PROMOTION_ESCORT_HELP', 'AS2D_IF_LEVELUP', 1, 1, 34, 'promoVP_atlas_01', 'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_ESCORT', NULL, 0, 830, 830),
    ('PROMOTION_FIRE_CONTROL', 'TXT_KEY_PROMOTION_FIRE_CONTROL', 'TXT_KEY_PROMOTION_FIRE_CONTROL_HELP', 'AS2D_IF_LEVELUP', 1, 1, 59, 'promoVP_atlas_03', 'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_FIRE_CONTROL', NULL, 0, 830, 830),
    ('PROMOTION_BATTLE_LINE_MOD', 'TXT_KEY_PROMOTION_BATTLE_LINE_MOD', 'TXT_KEY_PROMOTION_BATTLE_LINE_MOD_HELP', 'AS2D_IF_LEVELUP', 1, 1, 3, 'naval_promoAtlas', 'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_BATTLE_LINE_MOD', NULL, 0, 830, 830),
    ('PROMOTION_ALL_BIG_GUN', 'TXT_KEY_PROMOTION_ALL_BIG_GUN', 'TXT_KEY_PROMOTION_ALL_BIG_GUN_HELP', 'AS2D_IF_LEVELUP', 1, 1, 63, 'promoVP_atlas_03', 'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_ALL_BIG_GUN', NULL, 0, 830, 830),
    ('PROMOTION_IRON_HULL', 'TXT_KEY_PROMOTION_IRON_HULL', 'TXT_KEY_PROMOTION_IRON_HULL_HELP', 'AS2D_IF_LEVELUP', 1, 1, 30, 'extraPromo_Atlas', 'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_IRON_HULL', NULL, 0, 830, 830),
	('PROMOTION_WARSHIP', 'TXT_KEY_PROMOTION_WARSHIP', 'TXT_KEY_PROMOTION_WARSHIP_HELP', 'AS2D_IF_LEVELUP', 1, 1, 2, 'naval_promoAtlas', 'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_WARSHIP', NULL, 0, 827, 827),
	('PROMOTION_HEAVY_FIRE', 'TXT_KEY_PROMOTION_HEAVY_FIRE', 'TXT_KEY_PROMOTION_HEAVY_FIRE_HELP', 'AS2D_IF_LEVELUP', 1, 1, 6, 'promoVP_atlas_00', 'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_HEAVY_FIRE', NULL, 0, 828, 828),
    ('PROMOTION_HIGH_P_ROUND', 'TXT_KEY_PROMOTION_HIGH_P_ROUND', 'TXT_KEY_PROMOTION_HIGH_P_ROUND_HELP', 'AS2D_IF_LEVELUP', 1, 1, 2, 'promoVP_atlas_00', 'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_HIGH_P_ROUND', NULL, 0, 829, 829),
	 ('PROMOTION_FLAGSHIP', 'TXT_KEY_PROMOTION_FLAGSHIP', 'TXT_KEY_PROMOTION_FLAGSHIP_HELP', 'AS2D_IF_LEVELUP', 0, 0, 4, 'naval_promoAtlas', 'PEDIA_CARSUB', 'TXT_KEY_PROMOTION_FLAGSHIP', NULL, 0, 337, 337),
	('PROMOTION_S_BOMBARDMENT', 'TXT_KEY_PROMOTION_S_BOMBARDMENT', 'TXT_KEY_PROMOTION_S_BOMBARDMENT_HELP', 'AS2D_IF_LEVELUP', 0, 0, 55, 'PROMOTION_ATLAS', 'PEDIA_CARSUB', 'TXT_KEY_PROMOTION_S_BOMBARDMENT', NULL, 0, 341, 341),
    ('PROMOTION_BATTLECRUISER', 'TXT_KEY_PROMOTION_BATTLECRUISER', 'TXT_KEY_PROMOTION_BATTLECRUISER_HELP', 'AS2D_IF_LEVELUP', 0, 0, 6, 'naval_promoAtlas', 'PEDIA_CARSUB', 'TXT_KEY_PROMOTION_BATTLECRUISER', NULL, 0, 339, 339),
    ('PROMOTION_BELT_ARMOR', 'TXT_KEY_PROMOTION_BELT_ARMOR', 'TXT_KEY_PROMOTION_BELT_ARMOR_HELP', 'AS2D_IF_LEVELUP', 0, 0, 13, 'EXPANSION2_PROMOTION_ATLAS', 'PEDIA_CARSUB', 'TXT_KEY_PROMOTION_BELT_ARMOR', 'ARMOR_PLATING', 2, 109, 109),
    ('PROMOTION_FLEET_ENG_I', 'TXT_KEY_PROMOTION_FLEET_ENG_I', 'TXT_KEY_PROMOTION_FLEET_ENG_I_HELP', 'AS2D_IF_LEVELUP', 0, 0, 48, 'extraPromo_Atlas', 'PEDIA_CARSUB', 'TXT_KEY_PROMOTION_FLEET_ENG_I', 'FLEET_ENG', 1, 102, 102),
    ('PROMOTION_FLEET_ENG_II', 'TXT_KEY_PROMOTION_FLEET_ENG_II', 'TXT_KEY_PROMOTION_FLEET_ENG_II_HELP', 'AS2D_IF_LEVELUP', 0, 0, 49, 'extraPromo_Atlas', 'PEDIA_CARSUB', 'TXT_KEY_PROMOTION_FLEET_ENG_II', 'FLEET_ENG', 2, 102, 102),
    ('PROMOTION_NAVAL_ARTL_I', 'TXT_KEY_PROMOTION_NAVAL_ARTL_I', 'TXT_KEY_PROMOTION_NAVAL_ARTL_I_HELP', 'AS2D_IF_LEVELUP', 0, 0, 0, 'promoVP_atlas_03', 'PEDIA_CARSUB', 'TXT_KEY_PROMOTION_NAVAL_ARTL_I', 'NAVAL_ARTL', 1, 101, 101),
    ('PROMOTION_NAVAL_ARTL_II', 'TXT_KEY_PROMOTION_NAVAL_ARTL_II', 'TXT_KEY_PROMOTION_NAVAL_ARTL_II_HELP', 'AS2D_IF_LEVELUP', 0, 0, 1, 'promoVP_atlas_03', 'PEDIA_CARSUB', 'TXT_KEY_PROMOTION_NAVAL_ARTL_II', 'NAVAL_ARTL', 2, 101, 101),
    ('PROMOTION_NAVAL_ARTL_III', 'TXT_KEY_PROMOTION_NAVAL_ARTL_III', 'TXT_KEY_PROMOTION_NAVAL_ARTL_III_HELP', 'AS2D_IF_LEVELUP', 0, 0, 2, 'promoVP_atlas_03', 'PEDIA_CARSUB', 'TXT_KEY_PROMOTION_NAVAL_ARTL_III', 'NAVAL_ARTL', 3, 101, 101);
------------------------------------------------------
INSERT INTO UnitPromotions_UnitCombats
		(PromotionType,					UnitCombatType,			PediaType)
 VALUES ('PROMOTION_COASTAL_RAIDER_1', 'UNITCOMBAT_CARRIER',	null),
	    ('PROMOTION_COASTAL_RAIDER_2', 'UNITCOMBAT_CARRIER',	null),
	    ('PROMOTION_COASTAL_RAIDER_3', 'UNITCOMBAT_CARRIER',	null),
	    ('PROMOTION_RANGE', 'UNITCOMBAT_CARRIER',	null),
        ('PROMOTION_INDIRECT_FIRE', 'UNITCOMBAT_CARRIER',	null),
	    ('PROMOTION_SPLASH_1', 'UNITCOMBAT_CARRIER',	null),
	    ('PROMOTION_BARRAGE_4', 'UNITCOMBAT_CARRIER',	null),
        ('PROMOTION_FLAGSHIP',			'UNITCOMBAT_CARRIER',	null),
        ('PROMOTION_FLEET_ENG_I',			'UNITCOMBAT_CARRIER',	null),
        ('PROMOTION_FLEET_ENG_II',			'UNITCOMBAT_CARRIER',	null),
        ('PROMOTION_S_BOMBARDMENT',			'UNITCOMBAT_CARRIER',	null),
        ('PROMOTION_BATTLECRUISER',			'UNITCOMBAT_CARRIER',	null),
        ('PROMOTION_BELT_ARMOR',			'UNITCOMBAT_CARRIER',	null),
        ('PROMOTION_NAVAL_ARTL_I',			'UNITCOMBAT_CARRIER',	null),
        ('PROMOTION_NAVAL_ARTL_II',			'UNITCOMBAT_CARRIER',	null),
		('PROMOTION_NAVAL_ARTL_III',		'UNITCOMBAT_CARRIER',	null);
----------------------------------------------------------------		
UPDATE UnitPromotions SET OutsideFriendlyLandsModifier = 10 WHERE Type = 'PROMOTION_FLEET_ENG_I' OR Type = 'PROMOTION_FLEET_ENG_II';

INSERT INTO UnitPromotions_Terrains
	(PromotionType, TerrainType, Attack)
VALUES
    ('PROMOTION_FLEET_ENG_I', 'TERRAIN_OCEAN', 10),		
    ('PROMOTION_FLEET_ENG_II', 'TERRAIN_OCEAN', 10);	
	
	
UPDATE UnitPromotions SET CityAttack = 50, AttackFortifiedMod = 50 WHERE Type = 'PROMOTION_S_BOMBARDMENT';		

UPDATE UnitPromotions SET CombatPercent = -10, MovesChange = 1 WHERE Type = 'PROMOTION_BATTLECRUISER';
	
INSERT INTO UnitPromotions_Domains
		(PromotionType, DomainType, Defense)
VALUES	('PROMOTION_BELT_ARMOR', 'DOMAIN_SEA', 25);	

UPDATE UnitPromotions
SET AttackAbove50HealthMod = 10
WHERE RankList = 'NAVAL_ARTL';

INSERT INTO UnitPromotions_Domains
	(PromotionType, DomainType, Attack)
SELECT
	Type, 'DOMAIN_LAND', 10
FROM UnitPromotions
WHERE RankList = 'NAVAL_ARTL';

INSERT INTO UnitPromotions_Domains
	(PromotionType, DomainType, Attack)
SELECT
	Type, 'DOMAIN_SEA', 10
FROM UnitPromotions
WHERE RankList = 'NAVAL_ARTL';

UPDATE UnitPromotions SET PlagueIDImmunity = 1 WHERE Type = 'PROMOTION_WARSHIP';	
   
INSERT INTO UnitPromotions_Terrains
	(PromotionType, TerrainType, ExtraMove)
VALUES
    ('PROMOTION_DEEP_DRAFT', 'TERRAIN_COAST', 1);  

UPDATE UnitPromotions SET MaxHitPointsChange = 20 WHERE Type = 'PROMOTION_WARSHIP';

INSERT INTO UnitPromotions_UnitCombatMods
	(PromotionType, UnitCombatType, Modifier)
VALUES
    ('PROMOTION_HEAVY_FIRE', 'UNITCOMBAT_NAVALMELEE', 33);

INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
VALUES
    ('UNIT_GALLEASS', 'PROMOTION_HEAVY_FIRE'),
	('UNIT_VENETIAN_GALLEASS', 'PROMOTION_HEAVY_FIRE'),
	('UNIT_MISSILE_CRUISER', 'PROMOTION_HEAVY_FIRE'),
	('UNIT_BATTLESHIP', 'PROMOTION_HEAVY_FIRE'),
    ('UNIT_DREADNOUGHT', 'PROMOTION_HEAVY_FIRE'),
	('UNIT_CRUISER', 'PROMOTION_HEAVY_FIRE'),
	('UNIT_FRIGATE', 'PROMOTION_HEAVY_FIRE');

INSERT INTO UnitPromotions_CombatModPerAdjacentUnitCombat
	(PromotionType, UnitCombatType, Defense)
VALUES
   ('PROMOTION_BATTLE_LINE_MOD', 'UNITCOMBAT_NAVALRANGED', 10),
    ('PROMOTION_BATTLE_LINE_MOD', 'UNITCOMBAT_NAVALMELEE', 10),
   ('PROMOTION_BATTLE_LINE_MOD', 'UNITCOMBAT_CARRIER', 10);  
   
UPDATE UnitPromotions SET AttackFullyHealedMod = 20 WHERE Type = 'PROMOTION_ALL_BIG_GUN';

UPDATE UnitPromotions SET AttackMod = 10 WHERE Type = 'PROMOTION_FIRE_CONTROL';
	
INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
SELECT
	Type, 'PROMOTION_ESCORT'
FROM Units
WHERE CombatClass = 'UNITCOMBAT_NAVALMELEE';

INSERT INTO UnitPromotions_CombatModPerAdjacentUnitCombat
	(PromotionType, UnitCombatType, Modifier)
VALUES
   ('PROMOTION_ESCORT', 'UNITCOMBAT_NAVALRANGED', 5),
   ('PROMOTION_ESCORT', 'UNITCOMBAT_CARRIER', 5);
		
---------------------------------------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES
	('TXT_KEY_PROMOTION_DEEP_DRAFT', 'Deep Draft'),
    ('TXT_KEY_PROMOTION_DEEP_DRAFT_HELP', 'Entering [COLOR_NEGATIVE_TEXT]Coastal[ENDCOLOR] costs +1 [ICON_MOVES] Movement (does not stack).'),
	('TXT_KEY_PROMOTION_HIGH_P_ROUND', 'High Penetration Rounds'),
    ('TXT_KEY_PROMOTION_HIGH_P_ROUND_HELP', '+25% [ICON_STRENGTH] Combat Strength when attacking [COLOR_POSITIVE_TEXT]Naval Capital Units except Carriers[ENDCOLOR].'),
    ('TXT_KEY_PROMOTION_WARSHIP', 'Warship'),
    ('TXT_KEY_PROMOTION_WARSHIP_HELP', '+20 Hit Points.[NEWLINE]Immune to the [COLOR_POSITIVE_TEXT]Boarded[ENDCOLOR] status.'),
	('TXT_KEY_PROMOTION_HEAVY_FIRE', 'Bonus vs Naval Melee Units (33)'),
    ('TXT_KEY_PROMOTION_HEAVY_FIRE_HELP', '+33% [ICON_STRENGTH] Combat Strength VS [COLOR_POSITIVE_TEXT]Naval Melee[ENDCOLOR] Units.'),
	('TXT_KEY_PROMOTION_FLAGSHIP', 'FlagShip'),
    ('TXT_KEY_PROMOTION_FLAGSHIP_HELP', '+15% [ICON_STRENGTH] Combat Strength for [COLOR_POSITIVE_TEXT]Naval Units[ENDCOLOR] within 2 tiles of this Unit.'),
	('TXT_KEY_PROMOTION_ESCORT', 'Escort'),
    ('TXT_KEY_PROMOTION_ESCORT_HELP', '+5% [ICON_STRENGTH] Combat Strength per [COLOR_POSITIVE_TEXT]Adjacent Owned Naval Ranged and Naval Capital Units[ENDCOLOR].'),
	('TXT_KEY_PROMOTION_FIRE_CONTROL', 'Fire Control'),
    ('TXT_KEY_PROMOTION_FIRE_CONTROL_HELP', '+10% [ICON_STRENGTH] Combat Strength when attacking.'),
	('TXT_KEY_PROMOTION_BATTLE_LINE_MOD', 'Battle Line'),
    ('TXT_KEY_PROMOTION_BATTLE_LINE_MOD_HELP', '+10% [ICON_STRENGTH] Combat Strength per [COLOR_POSITIVE_TEXT]Adjacent Ships[ENDCOLOR] when defending.[NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]Lost on Upgrade.[ENDCOLOR]'),
	('TXT_KEY_PROMOTION_ALL_BIG_GUN', 'All Big Gun'),
    ('TXT_KEY_PROMOTION_ALL_BIG_GUN_HELP', '+20% [ICON_STRENGTH] Combat Strength when attacking [COLOR_POSITIVE_TEXT]Full Health Units[ENDCOLOR].[NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]Lost on Upgrade.[ENDCOLOR]'),
	('TXT_KEY_PROMOTION_IRON_HULL', 'Plated Hull'),
    ('TXT_KEY_PROMOTION_IRON_HULL_HELP', '+10% [ICON_STRENGTH] Combat Strength VS [COLOR_POSITIVE_TEXT]Wooden Ships[ENDCOLOR].[NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]Lost on Upgrade.[ENDCOLOR]'),
	('TXT_KEY_PROMOTION_FLEET_ENG_I', 'Fleet Engagement I'),
	('TXT_KEY_PROMOTION_FLEET_ENG_II', 'Fleet Engagement II'),
	('TXT_KEY_PROMOTION_FLEET_ENG_I_HELP', '+10% [ICON_STRENGTH] Combat Strength [COLOR_POSITIVE_TEXT]Outside of Friendly Territory[ENDCOLOR].[NEWLINE]+10% [ICON_STRENGTH] Combat Strength when attacking Units in [COLOR_POSITIVE_TEXT]Ocean Tiles[ENDCOLOR].'),
	('TXT_KEY_PROMOTION_FLEET_ENG_II_HELP', '+10% [ICON_STRENGTH] Combat Strength [COLOR_POSITIVE_TEXT]Outside of Friendly Territory[ENDCOLOR].[NEWLINE]+10% [ICON_STRENGTH] Combat Strength when attacking Units in [COLOR_POSITIVE_TEXT]Ocean Tiles[ENDCOLOR].'),
    ('TXT_KEY_PROMOTION_BELT_ARMOR', 'Belt Armor'),
    ('TXT_KEY_PROMOTION_BELT_ARMOR_HELP', '+25% [ICON_STRENGTH] Combat Strength when defending against [COLOR_POSITIVE_TEXT]Naval Units[ENDCOLOR].'),
    ('TXT_KEY_PROMOTION_BATTLECRUISER', 'Battlecruiser'),
    ('TXT_KEY_PROMOTION_BATTLECRUISER_HELP', '-10% [ICON_STRENGTH] Combat Strength.[NEWLINE]+1 [ICON_MOVES] Movement.'),
    ('TXT_KEY_PROMOTION_S_BOMBARDMENT', 'Shore Bombardment'),
    ('TXT_KEY_PROMOTION_S_BOMBARDMENT_HELP', '+50% [ICON_STRENGTH] Combat Strength when attacking [COLOR_POSITIVE_TEXT]Fortified Units[ENDCOLOR] and [COLOR_POSITIVE_TEXT]Cities[ENDCOLOR].'),	
    ('TXT_KEY_PROMOTION_NAVAL_ARTL_I', 'Naval Artillery I'),
	('TXT_KEY_PROMOTION_NAVAL_ARTL_II', 'Naval Artillery II'),
	('TXT_KEY_PROMOTION_NAVAL_ARTL_III', 'Naval Artillery III'),
	('TXT_KEY_PROMOTION_NAVAL_ARTL_I_HELP', '+10% [ICON_STRENGTH] Combat Strength when attacking [COLOR_POSITIVE_TEXT]Naval[ENDCOLOR] and [COLOR_POSITIVE_TEXT]Land Units[ENDCOLOR].[NEWLINE]+10% [ICON_STRENGTH] Combat Strength when attacking [COLOR_POSITIVE_TEXT]Units above 50% HP[ENDCOLOR].'),
	('TXT_KEY_PROMOTION_NAVAL_ARTL_II_HELP', '+10% [ICON_STRENGTH] Combat Strength when attacking [COLOR_POSITIVE_TEXT]Naval[ENDCOLOR] and [COLOR_POSITIVE_TEXT]Land Units[ENDCOLOR].[NEWLINE]+10% [ICON_STRENGTH] Combat Strength when attacking [COLOR_POSITIVE_TEXT]Units above 50% HP[ENDCOLOR].'),
	('TXT_KEY_PROMOTION_NAVAL_ARTL_III_HELP', '+10% [ICON_STRENGTH] Combat Strength when attacking [COLOR_POSITIVE_TEXT]Naval[ENDCOLOR] and [COLOR_POSITIVE_TEXT]Land Units[ENDCOLOR].[NEWLINE]+10% [ICON_STRENGTH] Combat Strength when attacking [COLOR_POSITIVE_TEXT]Units above 50% HP[ENDCOLOR].');

------------------------------------------------------------------------------------------------------------------------------------------------

UPDATE UnitPromotions SET PromotionPrereqOr1 = 'PROMOTION_FLEET_ENG_I' WHERE Type = 'PROMOTION_FLEET_ENG_II';
UPDATE UnitPromotions SET PromotionPrereqOr1 = 'PROMOTION_NAVAL_ARTL_I', PromotionPrereqOr2 = 'PROMOTION_COASTAL_RAIDER_2' WHERE Type = 'PROMOTION_FLEET_ENG_I';
UPDATE UnitPromotions SET PromotionPrereqOr1 = 'PROMOTION_NAVAL_ARTL_I' WHERE Type = 'PROMOTION_NAVAL_ARTL_II';
UPDATE UnitPromotions SET PromotionPrereqOr1 = 'PROMOTION_NAVAL_ARTL_II' WHERE Type = 'PROMOTION_NAVAL_ARTL_III';
UPDATE UnitPromotions SET PromotionPrereqOr1 = 'PROMOTION_COASTAL_RAIDER_1', PromotionPrereqOr2 = 'PROMOTION_NAVAL_ARTL_I', TechPrereq = 'TECH_INDUSTRIALIZATION' WHERE Type = 'PROMOTION_BELT_ARMOR';
UPDATE UnitPromotions SET PromotionPrereqOr1 = 'PROMOTION_COASTAL_RAIDER_3' WHERE Type = 'PROMOTION_BATTLECRUISER' OR Type = 'PROMOTION_S_BOMBARDMENT';	

UPDATE CustomModOptions SET Value = 1 WHERE Name = 'CORE_AREA_EFFECT_PROMOTIONS';	
UPDATE UnitPromotions SET PromotionPrereqOr1 = 'PROMOTION_BARRAGE_4', PromotionPrereqOr2 = 'PROMOTION_S_BOMBARDMENT' WHERE Type = 'PROMOTION_FLAGSHIP';
UPDATE UnitPromotions SET IsNearbyPromotion = 1, NearbyRange = 2, GiveDomain = 'DOMAIN_SEA', GiveCombatMod = 15 WHERE Type = 'PROMOTION_FLAGSHIP';
  
UPDATE UnitPromotions SET PromotionPrereqOr1 = 'PROMOTION_ANTI_AIR' WHERE Type IN ('PROMOTION_ARMOR_PLATING_1', 'PROMOTION_FLIGHT_DECK_1');
UPDATE UnitPromotions SET PromotionPrereqOr1 = 'PROMOTION_ARMOR_PLATING_2', PromotionPrereqOr2 = 'PROMOTION_BELT_ARMOR', TechPrereq = 'TECH_NUCLEAR_FISSION', PromotionPrereq = NULL WHERE Type = 'PROMOTION_ARMOR_PLATING_3';		
UPDATE UnitPromotions SET CannotBeChosen = 0, PromotionPrereqOr1 = 'PROMOTION_COASTAL_RAIDER_2', PromotionPrereqOr2 = 'PROMOTION_NAVAL_ARTL_II' WHERE Type = 'PROMOTION_INDIRECT_FIRE';		
UPDATE UnitPromotions SET PromotionPrereqOr3 = 'PROMOTION_NAVAL_ARTL_III' WHERE Type = 'PROMOTION_SPLASH_1' OR Type = 'PROMOTION_BARRAGE_4';
UPDATE UnitPromotions SET PromotionPrereqOr3 = 'PROMOTION_COASTAL_RAIDER_3', PromotionPrereqOr4 = 'PROMOTION_NAVAL_ARTL_III' WHERE Type = 'PROMOTION_RANGE';
UPDATE UnitPromotions SET PromotionPrereqOr1 = 'PROMOTION_WARSHIP' WHERE Type = 'PROMOTION_COASTAL_RAIDER_1' OR Type = 'PROMOTION_NAVAL_ARTL_I';
UPDATE UnitPromotions SET PromotionPrereqOr2 = 'PROMOTION_ESCORT' WHERE Type = 'PROMOTION_COASTAL_RAIDER_1';


------------------------------------------------------------------------------
-- SHIP_OF_THE_LINE
----------------------------------------------------

	
INSERT INTO UnitClasses (Type, Description, MaxPlayerInstances, DefaultUnit, InstanceCostModifier)
VALUES ('UNITCLASS_BB_SHIP_OF_THE_LINE', 'TXT_KEY_UNIT_BB_SHIP_OF_THE_LINE', -1, 'UNIT_BB_SHIP_OF_THE_LINE', 5);

INSERT INTO Civilization_UnitClassOverrides
		(CivilizationType, 			UnitClassType, 					UnitType)
SELECT	'CIVILIZATION_BARBARIAN',	'UNITCLASS_BB_SHIP_OF_THE_LINE',	null;

INSERT INTO Civilization_UnitClassOverrides
		(CivilizationType, 		UnitClassType, 					UnitType)
SELECT	'CIVILIZATION_MINOR',	'UNITCLASS_BB_SHIP_OF_THE_LINE',	null;



INSERT INTO Units
	(Type, Class, Domain, CombatClass, PrereqTech, ObsoleteTech, DefaultUnitAI,
	Description, Civilopedia, Strategy, Help, CombatLimit, 
	Cost, FaithCost, ExtraMaintenanceCost, Combat, Moves, RangedCombat, Range, AirInterceptRange, BaseSightRange,
	MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, Mechanized,
	AdvancedStartCost, MinAreaSize, XPValueAttack, XPValueDefense, MoveRate,
	BaseLandAirDefense, PurchaseCooldown, HurryCostModifier,
	UnitArtInfo, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex, RangeAttackOnlyInDomain)
VALUES
	('UNIT_BB_SHIP_OF_THE_LINE', 'UNITCLASS_BB_SHIP_OF_THE_LINE', 'DOMAIN_SEA', 'UNITCOMBAT_CARRIER', 'TECH_NAVIGATION', 'TECH_DYNAMITE', 'UNITAI_ASSAULT_SEA',
	'TXT_KEY_UNIT_BB_SHIP_OF_THE_LINE', 'TXT_KEY_UNIT_BB_SHIP_OF_THE_LINE_PEDIA', 'TXT_KEY_UNIT_BB_SHIP_OF_THE_LINE_STRATEGY', 'TXT_KEY_UNIT_BB_SHIP_OF_THE_LINE_HELP', 0,
	500, 500, 1, 35, 4, 40, 2, 0, 2,
	1, 1, 1, 0, 0,
	0, 10, 0, 0, 'BOAT',
	0, 1, 5,
  'ART_DEF_UNIT_BB_SHIP_OF_THE_LINE', 'NAVALMOD_UNIT_FLAG_ATLAS', 8, 'UNIT_ATLAS_2', 9, 0);


	
INSERT INTO UnitGameplay2DScripts (UnitType, SelectionSound, FirstSelectionSound)
VALUES ('UNIT_BB_SHIP_OF_THE_LINE', 'AS2D_SELECT_FRIGATE', 'AS2D_BIRTH_FRIGATE');


INSERT INTO Unit_ClassUpgrades (UnitType, UnitClassType)
VALUES ('UNIT_BB_SHIP_OF_THE_LINE', 'UNITCLASS_BB_IRONCLAD');


INSERT INTO Unit_BuildingClassPurchaseRequireds (UnitType, BuildingClassType)
VALUES ('UNIT_BB_SHIP_OF_THE_LINE','BUILDINGCLASS_HARBOR');

INSERT INTO Unit_ResourceQuantityRequirements (UnitType, ResourceType, Cost)
VALUES ('UNIT_BB_SHIP_OF_THE_LINE', 'RESOURCE_IRON', 1);

INSERT INTO Unit_AITypes (UnitType, UnitAIType)
VALUES
	('UNIT_BB_SHIP_OF_THE_LINE', 'UNITAI_ASSAULT_SEA'),
	('UNIT_BB_SHIP_OF_THE_LINE', 'UNITAI_ATTACK_SEA'),
	('UNIT_BB_SHIP_OF_THE_LINE', 'UNITAI_RESERVE_SEA');

INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)
VALUES
	('UNIT_BB_SHIP_OF_THE_LINE', 'FLAVOR_NAVAL', 32),
	('UNIT_BB_SHIP_OF_THE_LINE', 'FLAVOR_NAVAL_RECON', 10);

INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
VALUES
   ('UNIT_BB_SHIP_OF_THE_LINE', 'PROMOTION_WARSHIP'),
	('UNIT_BB_SHIP_OF_THE_LINE', 'PROMOTION_DEEP_DRAFT'),   
	('UNIT_BB_SHIP_OF_THE_LINE', 'PROMOTION_ONLY_DEFENSIVE'),
	('UNIT_BB_SHIP_OF_THE_LINE', 'PROMOTION_HIGH_P_ROUND'),
	('UNIT_BB_SHIP_OF_THE_LINE', 'PROMOTION_BATTLE_LINE_MOD');

	

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_UNIT_BB_SHIP_OF_THE_LINE', 'Ship of the Line');

-- Pedia: Historical Info (bottom)
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_UNIT_BB_SHIP_OF_THE_LINE_PEDIA', 'A ship of the line was a type of naval warship constructed during the Age of Sail from the 17th century to the mid-19th century. The ship of the line was designed for the naval tactic known as the line of battle, which involved the two columns of opposing warships manoeuvering to volley fire with the cannons along their broadsides.');

-- Pedia: Strategy (middle)
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_UNIT_BB_SHIP_OF_THE_LINE_HELP', 'Powerful Renaissance-era naval capital unit. Excels in direct combat with other ships and supports coastal assaults.');

-- Pedia: Game Info (top)
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_UNIT_BB_SHIP_OF_THE_LINE_STRATEGY', 'Dominating the seas in the Age of Sail, the Ship of the Line is a heavily armed and armored warship designed to engage enemy fleets and provide devastating broadsides against coastal targets.');
---------------------------------------------------
-- English First Rate (ranged)

UPDATE Units SET
    Cost = 500,
    Class = 'UNITCLASS_BB_SHIP_OF_THE_LINE',
	CombatClass = 'UNITCOMBAT_CARRIER',
	PrereqTech = 'TECH_NAVIGATION', 
	IconAtlas = 'NAVALMOD_UNIT_ATLAS',
	PortraitIndex = 8,
	Combat = (SELECT Combat FROM Units WHERE Type = 'UNIT_BB_SHIP_OF_THE_LINE') + 5,
	RangedCombat = (SELECT RangedCombat FROM Units WHERE Type = 'UNIT_BB_SHIP_OF_THE_LINE') + 5,
	BaseSightRange = (SELECT BaseSightRange FROM Units WHERE Type = 'UNIT_BB_SHIP_OF_THE_LINE') + 1
WHERE Type = 'UNIT_ENGLISH_SHIPOFTHELINE';

UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_BB_IRONCLAD'
WHERE UnitType = 'UNIT_ENGLISH_SHIPOFTHELINE';

UPDATE Civilization_UnitClassOverrides
SET UnitClassType = 'UNITCLASS_BB_SHIP_OF_THE_LINE'
WHERE UnitType = 'UNIT_ENGLISH_SHIPOFTHELINE';

DELETE FROM Unit_AITypes WHERE UnitAIType = 'UNITAI_ESCORT_SEA' AND UnitType = 'UNIT_ENGLISH_SHIPOFTHELINE';
DELETE FROM Unit_Flavors WHERE UnitType = 'UNIT_ENGLISH_SHIPOFTHELINE';

INSERT INTO Unit_AITypes (UnitType, UnitAIType)
VALUES
	('UNIT_ENGLISH_SHIPOFTHELINE', 'UNITAI_ATTACK_SEA');

INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)
VALUES
	('UNIT_ENGLISH_SHIPOFTHELINE', 'FLAVOR_NAVAL', 34),
	('UNIT_ENGLISH_SHIPOFTHELINE', 'FLAVOR_NAVAL_RECON', 16);

DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_ENGLISH_SHIPOFTHELINE';
 
INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
VALUES
  	('UNIT_ENGLISH_SHIPOFTHELINE', 'PROMOTION_WARSHIP'),
	('UNIT_ENGLISH_SHIPOFTHELINE', 'PROMOTION_DEEP_DRAFT'),	 
	('UNIT_ENGLISH_SHIPOFTHELINE', 'PROMOTION_ONLY_DEFENSIVE'),
	('UNIT_ENGLISH_SHIPOFTHELINE', 'PROMOTION_HIGH_P_ROUND'),
    ('UNIT_ENGLISH_SHIPOFTHELINE', 'PROMOTION_BATTLE_LINE_MOD'),
    ('UNIT_ENGLISH_SHIPOFTHELINE', 'PROMOTION_SPLASH_1'),
	('UNIT_ENGLISH_SHIPOFTHELINE', 'PROMOTION_SPLASH_2');
	
INSERT INTO Unit_ResourceQuantityRequirements (UnitType, ResourceType, Cost)
VALUES ('UNIT_ENGLISH_SHIPOFTHELINE', 'RESOURCE_IRON', 1);	

UPDATE Language_en_US
SET Text = 'First Rate'
WHERE Tag = 'TXT_KEY_UNIT_ENGLISH_SHIPOFTHELINE';

UPDATE Language_en_US
SET Text = 'Unique English {TXT_KEY_UNIT_BB_SHIP_OF_THE_LINE} that specializes in wresting control of sea and coast with extra vision and splash damage. Starts with [COLOR_POSITIVE_TEXT]{TXT_KEY_PROMOTION_SPLASH_1}[ENDCOLOR] and [COLOR_POSITIVE_TEXT]{TXT_KEY_PROMOTION_SPLASH_2}[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_UNIT_HELP_SHIPOFTHELINE';

UPDATE Language_en_US
SET Text = 'The {TXT_KEY_UNIT_ENGLISH_SHIPOFTHELINE} is the English unique unit, replacing the {TXT_KEY_UNIT_BB_SHIP_OF_THE_LINE}. It can deal splash damage to clear out masses of enemy ships and land units on coastal tiles. It can also see further, allowing it to spot enemies in a significantly larger section of ocean.'
WHERE Tag = 'TXT_KEY_UNIT_ENGLISH_SHIPOFTHELINE_STRATEGY';

UPDATE Language_en_US
SET Text = '"First-rate" is the classification used for the largest ships of the line maintained by the British Royal Navy.  Throughout the existence of the rating system, the threshold armament and crew for a ship to be considered first-rate changed.  However, it was established in the early 1700s that a first-rate ship loaded for wartime carried at least 100 guns.  First-rates were very expensive, heavy and slow in exchange for their massive firepower.  As a result, few were maintained at any given time, and they often served as flagships. HMS Victory, Admrial Nelson''s famous flagship from the Battle of Trafalgar, is the only surviving first-rate.'
WHERE Tag = 'TXT_KEY_CIVILOPEDIA_UNITS_RENAISSANCE_SHIPOFTHELINE_TEXT';
---------------------------------------------------
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.1260000005364414 WHERE Type = 'ART_DEF_UNIT_MEMBER_CONFEDERATE_IRONCLAD';

--Gun Boat + Steam Frigate
UPDATE Units SET
    UnitArtInfo = 'ART_DEF_UNIT_CONFEDERATE_IRONCLAD', 
	UnitFlagAtlas = 'UNIT_FLAG_ATLAS', 
	UnitFlagIconOffset = 53, 
	IconAtlas = 'CIVIL_WAR_UNIT_ATLAS', 
	PortraitIndex = 3
WHERE Type = 'UNIT_IRONCLAD';

UPDATE Units SET
    UnitArtInfo = 'ART_DEF_UNIT_JFD_STEAM_FRIGATE', 
	UnitFlagAtlas = 'MA_STEAMFRIGATE_FLAG_ATLAS', 
	UnitFlagIconOffset = 0, 
	IconAtlas = 'MA_STEAMFRIGATE_ATLAS', 
	PortraitIndex = 2
WHERE Type = 'UNIT_CRUISER';

UPDATE Language_en_US
SET Text = 'Gun Boat'
WHERE Tag = 'TXT_KEY_UNIT_IRONCLAD';

UPDATE Language_en_US
SET Text = 'In the later 19th century and early 20th century, gunboat was the common name for smaller armed vessels. These could be classified, from the smallest to the largest, into river gunboats, river monitors, coastal-defense gunboats , and full-fledged monitors for coastal bombardments.'
WHERE Tag = 'TXT_KEY_CIVILOPEDIA_UNITS_RENAISSANCE_IRONCLAD_TEXT';

UPDATE Language_en_US
SET Text = 'Industrial-era melee naval unit. Supports fleet operations by engaging enemy ships directly and protecting ranged units.'
WHERE Tag = 'TXT_KEY_UNIT_IRONCLAD_STRATEGY';

UPDATE Language_en_US
SET Text = 'A very powerful melee naval unit, the Gun Boat is essential in protecting the huge steamships.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_IRONCLAD';

UPDATE Language_en_US
SET Text = 'Steam Frigate'
WHERE Tag = 'TXT_KEY_DESC_CRUISER';

UPDATE Language_en_US
SET Text = 'Steam Frigates (including screw frigates) and the smaller steam corvettes, steam sloops, steam gunboats and steam schooners, were steam-powered warships that were not meant to stand in the line of battle. The first such ships were paddle steamers. Later on the invention of screw propulsion enabled construction of screw-powered versions of the traditional frigates, corvettes, sloops and gunboats.'
WHERE Tag = 'TXT_KEY_CIV5_CRUISER_PEDIA';

UPDATE Language_en_US
SET Text = 'Industrial-era ranged naval unit. Delivers sustained fire support against ships and cities from a safe distance. Vulnerable to melee ships and torpedo boats.'
WHERE Tag = 'TXT_KEY_CIV5_CRUISER_STRATEGY';



------------------------------------------------------------------------------
-- IRONCLAD
----------------------------------------------------
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.12502 WHERE Type = 'ART_DEF_UNIT_MEMBER_IRONCLAD';
	
INSERT INTO UnitClasses (Type, Description, MaxPlayerInstances, DefaultUnit, InstanceCostModifier)
VALUES ('UNITCLASS_BB_IRONCLAD', 'TXT_KEY_UNIT_BB_IRONCLAD', -1, 'UNIT_BB_IRONCLAD', 5);

INSERT INTO Civilization_UnitClassOverrides
		(CivilizationType, 			UnitClassType, 					UnitType)
SELECT	'CIVILIZATION_BARBARIAN',	'UNITCLASS_BB_IRONCLAD',	null;

INSERT INTO Civilization_UnitClassOverrides
		(CivilizationType, 		UnitClassType, 					UnitType)
SELECT	'CIVILIZATION_MINOR',	'UNITCLASS_BB_IRONCLAD',	null;



INSERT INTO Units
	(Type, Class, Domain, CombatClass, PrereqTech, ObsoleteTech, DefaultUnitAI,
	Description, Civilopedia, Strategy, Help, CombatLimit, 
	Cost, FaithCost, ExtraMaintenanceCost, Combat, Moves, RangedCombat, Range, AirInterceptRange, BaseSightRange,
	MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, Mechanized,
	AdvancedStartCost, MinAreaSize, XPValueAttack, XPValueDefense, MoveRate,
	BaseLandAirDefense, PurchaseCooldown, HurryCostModifier,
	UnitArtInfo, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex, RangeAttackOnlyInDomain)
VALUES
	('UNIT_BB_IRONCLAD', 'UNITCLASS_BB_IRONCLAD', 'DOMAIN_SEA', 'UNITCOMBAT_CARRIER', 'TECH_DYNAMITE', 'TECH_RADIO', 'UNITAI_ASSAULT_SEA',
	'TXT_KEY_UNIT_BB_IRONCLAD', 'TXT_KEY_UNIT_BB_IRONCLAD_PEDIA', 'TXT_KEY_UNIT_BB_IRONCLAD_STRATEGY', 'TXT_KEY_UNIT_BB_IRONCLAD_HELP', 0,
	1100, 700, 1, 50, 4, 60, 2, 0, 2,
	1, 1, 1, 0, 0,
	0, 10, 0, 0, 'BOAT',
	0, 1, 5,
  'ART_DEF_UNIT_IRONCLAD', 'CIVIL_WAR_UNIT_FLAG_ATLAS', 1, 'UNIT_ATLAS_2', 10, 0);


	
INSERT INTO UnitGameplay2DScripts (UnitType, SelectionSound, FirstSelectionSound)
VALUES ('UNIT_BB_IRONCLAD', 'AS2D_SELECT_IRONCLAD', 'AS2D_BIRTH_IRONCLAD');


INSERT INTO Unit_ClassUpgrades (UnitType, UnitClassType)
VALUES ('UNIT_BB_IRONCLAD', 'UNITCLASS_BB_DREADNOUGHT');


INSERT INTO Unit_BuildingClassPurchaseRequireds (UnitType, BuildingClassType)
VALUES ('UNIT_BB_IRONCLAD','BUILDINGCLASS_SEAPORT');

INSERT INTO Unit_ResourceQuantityRequirements (UnitType, ResourceType, Cost)
VALUES ('UNIT_BB_IRONCLAD', 'RESOURCE_COAL', 1);

INSERT INTO Unit_AITypes (UnitType, UnitAIType)
VALUES
	('UNIT_BB_IRONCLAD', 'UNITAI_ASSAULT_SEA'),
	('UNIT_BB_IRONCLAD', 'UNITAI_ATTACK_SEA'),
	('UNIT_BB_IRONCLAD', 'UNITAI_RESERVE_SEA');

INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)
VALUES
	('UNIT_BB_IRONCLAD', 'FLAVOR_NAVAL', 36),
	('UNIT_BB_IRONCLAD', 'FLAVOR_NAVAL_RECON', 14);

INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
VALUES
    ('UNIT_BB_IRONCLAD', 'PROMOTION_WARSHIP'),
	('UNIT_BB_IRONCLAD', 'PROMOTION_DEEP_DRAFT'), 
	('UNIT_BB_IRONCLAD', 'PROMOTION_ONLY_DEFENSIVE'),
	('UNIT_BB_IRONCLAD', 'PROMOTION_HIGH_P_ROUND'), 
	('UNIT_BB_IRONCLAD', 'PROMOTION_IRON_HULL');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_UNIT_BB_IRONCLAD', 'Ironclad');

-- Pedia: Historical Info (bottom)
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_UNIT_BB_IRONCLAD_PEDIA', 'An ironclad was a steam-propelled warship protected by steel or iron armor constructed from 1859 to the early 1890s. The ironclad was developed as a result of the vulnerability of wooden warships to explosive or incendiary shells');

-- Pedia: Strategy (middle)
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_UNIT_BB_IRONCLAD_HELP', 'Heavily armored naval unit effective in ship-to-ship combat and coastal bombardment.');

-- Pedia: Game Info (top)
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_UNIT_BB_IRONCLAD_STRATEGY', 'The Ironclad is a powerful Industrial-era ranged capital ship. It excels at engaging enemy naval units head-on and supporting attacks on coastal cities. Ironclads are more durable than steam frigates but less mobile, and benefit from unique promotions focused on survivability and ship-to-ship firepower.');
---------------------------------------------------
--Cruiser
UPDATE Units SET
    UnitArtInfo = 'ART_DEF_UNIT_CRUISER', 
	UnitFlagAtlas = 'CRUISER_FLAG_ATLAS', 
	UnitFlagIconOffset = 0, 
	IconAtlas = 'ICON_ATLAS_ENW', 
	PortraitIndex = 11
WHERE Type = 'UNIT_DREADNOUGHT';

UPDATE Language_en_US
SET Text = 'Cruiser'
WHERE Tag = 'TXT_KEY_UNIT_DREADNOUGHT';

UPDATE Language_en_US
SET Text = 'A cruiser is a type of warship. The term has been in use for several hundred years, and has had different meanings throughout this period. During the Age of Sail, the term cruising referred to certain kinds of missions: independent scouting, raiding or commerce protection fulfilled by a frigate or sloop, which were the cruising warships of a fleet. In the middle of the 19th century, cruiser came to be a classification for the ships intended for this kind of role, though cruisers came in a wide variety of sizes, from the small protected cruiser to armored cruisers which were as large (though not as powerful) as a battleship. By the early 20th century, cruisers could be placed on a consistent scale of warship size, smaller than a battleship but larger than a destroyer. In 1922, the Washington Naval Treaty placed a formal limit on cruisers, which were defined as warships of up to 10,000 tons displacement carrying guns no larger than 8 inches in calibre. These limits shaped cruisers up until the end of World War II. The very large battlecruisers of the World War I era were now classified, along with battleships, as capital ships.'
WHERE Tag = 'TXT_KEY_UNIT_DREADNOUGHT_PEDIA';

UPDATE Language_en_US
SET Text = 'Modern-era ranged naval unit. Designed for long-range engagements against ships and cities. Must be protected from close-quarters threats.[NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]Land attacks can only be performed on Coastal tiles.[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_UNIT_DREADNOUGHT_HELP';

UPDATE Language_en_US
SET Text = 'The Cruiser is a ranged naval unit of the Modern Era. It specializes in long-range attacks against enemy ships and cities, dealing high damage while staying out of melee range. Cruisers are vulnerable to submarines and melee ships, and benefit from advanced targeting and bombardment promotions.'
WHERE Tag = 'TXT_KEY_UNIT_DREADNOUGHT_STRATEGY';

------------------------------------------------------------------------------
-- DREADNOUGHT
----------------------------------------------------

	
INSERT INTO UnitClasses (Type, Description, MaxPlayerInstances, DefaultUnit, InstanceCostModifier)
VALUES ('UNITCLASS_BB_DREADNOUGHT', 'TXT_KEY_UNIT_BB_DREADNOUGHT', -1, 'UNIT_BB_DREADNOUGHT', 5);

INSERT INTO Civilization_UnitClassOverrides
		(CivilizationType, 			UnitClassType, 					UnitType)
SELECT	'CIVILIZATION_BARBARIAN',	'UNITCLASS_BB_DREADNOUGHT',	null;

INSERT INTO Civilization_UnitClassOverrides
		(CivilizationType, 		UnitClassType, 					UnitType)
SELECT	'CIVILIZATION_MINOR',	'UNITCLASS_BB_DREADNOUGHT',	null;



INSERT INTO Units
	(Type, Class, Domain, CombatClass, PrereqTech, ObsoleteTech, DefaultUnitAI,
	Description, Civilopedia, Strategy, Help, CombatLimit, 
	Cost, FaithCost, ExtraMaintenanceCost, Combat, Moves, RangedCombat, Range, AirInterceptRange, BaseSightRange,
	MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, Mechanized,
	AdvancedStartCost, MinAreaSize, XPValueAttack, XPValueDefense, MoveRate,
	BaseLandAirDefense, PurchaseCooldown, HurryCostModifier,
	UnitArtInfo, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex, RangeAttackOnlyInDomain)
VALUES
	('UNIT_BB_DREADNOUGHT', 'UNITCLASS_BB_DREADNOUGHT', 'DOMAIN_SEA', 'UNITCOMBAT_CARRIER', 'TECH_RADIO', 'TECH_NUCLEAR_FISSION', 'UNITAI_ASSAULT_SEA',
	'TXT_KEY_UNIT_BB_DREADNOUGHT', 'TXT_KEY_UNIT_BB_DREADNOUGHT_PEDIA', 'TXT_KEY_UNIT_BB_DREADNOUGHT_STRATEGY', 'TXT_KEY_UNIT_BB_DREADNOUGHT_HELP', 0,
	1550, 900, 2, 65, 4, 70, 2, 0, 2,
	1, 1, 1, 0, 0,
	0, 10, 0, 0, 'BOAT',
	5, 1, 5,
  'ART_DEF_UNIT_DREADNOUGHT', 'FLAG_ATLAS_ENW', 2, 'ICON_ATLAS_ENW', 2, 0);


	
INSERT INTO UnitGameplay2DScripts (UnitType, SelectionSound, FirstSelectionSound)
VALUES ('UNIT_BB_DREADNOUGHT', 'AS2D_SELECT_BATTLESHIP', 'AS2D_BIRTH_BATTLESHIP');


INSERT INTO Unit_ClassUpgrades (UnitType, UnitClassType)
VALUES ('UNIT_BB_DREADNOUGHT', 'UNITCLASS_BB_BATTLESHIP');


INSERT INTO Unit_BuildingClassPurchaseRequireds (UnitType, BuildingClassType)
VALUES ('UNIT_BB_DREADNOUGHT','BUILDINGCLASS_SEAPORT');

INSERT INTO Unit_ResourceQuantityRequirements (UnitType, ResourceType, Cost)
VALUES ('UNIT_BB_DREADNOUGHT', 'RESOURCE_IRON', 1),
       ('UNIT_BB_DREADNOUGHT', 'RESOURCE_COAL', 1);
	   
INSERT INTO Unit_AITypes (UnitType, UnitAIType)
VALUES
	('UNIT_BB_DREADNOUGHT', 'UNITAI_ASSAULT_SEA'),
	('UNIT_BB_DREADNOUGHT', 'UNITAI_ATTACK_SEA'),
	('UNIT_BB_DREADNOUGHT', 'UNITAI_RESERVE_SEA');

INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)
VALUES
	('UNIT_BB_DREADNOUGHT', 'FLAVOR_NAVAL', 42),
	('UNIT_BB_DREADNOUGHT', 'FLAVOR_NAVAL_RECON', 18);

INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
VALUES
    ('UNIT_BB_DREADNOUGHT', 'PROMOTION_WARSHIP'),	
	('UNIT_BB_DREADNOUGHT', 'PROMOTION_DEEP_DRAFT'),
    ('UNIT_BB_DREADNOUGHT', 'PROMOTION_ONLY_DEFENSIVE'),	
	('UNIT_BB_DREADNOUGHT', 'PROMOTION_HIGH_P_ROUND'),
	('UNIT_BB_DREADNOUGHT', 'PROMOTION_ALL_BIG_GUN') ;
	

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_UNIT_BB_DREADNOUGHT', 'Dreadnought');

-- Pedia: Historical Info (bottom)
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_UNIT_BB_DREADNOUGHT_PEDIA', 'The Dreadnought was the predominant type of battleship in the early 20th century. Its design had two revolutionary features: an "all-big-gun" armament scheme, with more heavy-caliber guns than previous ships, and steam turbine propulsion. The first of its kind, the Royal Navy''s "Dreadnought" mounted ten 12-inch (305 mm) guns. The US Navy was the first to adopt oil-firing, deciding to do so in 1910 and ordering oil-fired boilers for the Nevada class, in 1911. Other major navies retained mixed coal-and-oil firing until the end of World War I.[NEWLINE][NEWLINE]Within five years of the commissioning of "Dreadnought", a new generation of more powerful "super-dreadnoughts" was being built. The first super-dreadnoughts are generally considered to be the British "Orion" class. What made them "super" was the introduction of the heavier 13.5-inch (343 mm) guns and the placement of all the main armament on the centerline. In 1917, the Japanese "Nagato" class was ordered, the first dreadnoughts to mount 16-inch (406 mm) guns, making them arguably the most powerful warships in the world.');

-- Pedia: Strategy (middle)
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_UNIT_BB_DREADNOUGHT_HELP', 'Modern-era capital ship. Combines heavy firepower and thick armor, ideal for dominating naval battles and bombarding coastal cities.');

-- Pedia: Game Info (top)
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_UNIT_BB_DREADNOUGHT_STRATEGY', 'The Dreadnought marks a turning point in naval warfare — an all-big-gun battleship capable of overwhelming any earlier vessel. It leads fleets with devastating long-range firepower and thick armor, but requires support to protect against faster ships and submarines.');
---------------------------------------------------
--Heavy Cruiser
UPDATE Units SET
    UnitArtInfo = 'ART_DEF_UNIT_HEAVY_CRUISER', 
	UnitFlagAtlas = 'HVCRUISER_FLAG_ATLAS', 
	UnitFlagIconOffset = 0, 
	IconAtlas = 'MA_STEAMFRIGATE_ATLAS', 
	PortraitIndex = 0
WHERE Type = 'UNIT_BATTLESHIP';


DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_BATTLESHIP' AND PromotionType = 'PROMOTION_INDIRECT_FIRE';


UPDATE Language_en_US
SET Text = 'Heavy Cruiser'
WHERE Tag = 'TXT_KEY_UNIT_BATTLESHIP';

UPDATE Language_en_US
SET Text = 'A heavy cruiser was a type of cruiser, a naval warship designed for long range and high speed, armed generally with naval guns of roughly 203 mm (8 inches) in calibre, whose design parameters were dictated by the Washington Naval Treaty of 1922 and the London Naval Treaty of 1930. Heavy cruisers were generally larger, more heavily armed and more heavily armoured than light cruisers while being smaller, faster, and more lightly armed and armoured than battlecruisers and battleships.'
WHERE Tag = 'TXT_KEY_CIV5_INDUSTRIAL_BATTLESHIP_TEXT';

UPDATE Language_en_US
SET Text = 'Heavily armed cruiser that provides ranged naval fire support. Effective against ships and coastal targets.[NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]Land attacks can only be performed on Coastal tiles.[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_UNIT_HELP_BATTLESHIP';

UPDATE Language_en_US
SET Text = 'The Heavy Cruiser is a powerful warship with a mighty Combat Strength but is vulnerable to air and submarine attacks.'
WHERE Tag = 'TXT_KEY_UNIT_BATTLESHIP_STRATEGY';

------------------------------------------------------------------------------
-- BATTLESHIP
----------------------------------------------------
UPDATE Units SET
    RangedCombat = RangedCombat+5
WHERE Type = 'UNIT_MISSILE_CRUISER';
	
INSERT INTO UnitClasses (Type, Description, MaxPlayerInstances, DefaultUnit, InstanceCostModifier)
VALUES ('UNITCLASS_BB_BATTLESHIP', 'TXT_KEY_UNIT_BB_BATTLESHIP', -1, 'UNIT_BB_BATTLESHIP', 5);

INSERT INTO Civilization_UnitClassOverrides
		(CivilizationType, 			UnitClassType, 					UnitType)
SELECT	'CIVILIZATION_BARBARIAN',	'UNITCLASS_BB_BATTLESHIP',	null;

INSERT INTO Civilization_UnitClassOverrides
		(CivilizationType, 		UnitClassType, 					UnitType)
SELECT	'CIVILIZATION_MINOR',	'UNITCLASS_BB_BATTLESHIP',	null;



INSERT INTO Units
	(Type, Class, Domain, CombatClass, PrereqTech, ObsoleteTech, DefaultUnitAI,
	Description, Civilopedia, Strategy, Help, CombatLimit, 
	Cost, FaithCost, ExtraMaintenanceCost, Combat, Moves, RangedCombat, Range, AirInterceptRange, BaseSightRange,
	MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, Mechanized,
	AdvancedStartCost, MinAreaSize, XPValueAttack, XPValueDefense, MoveRate,
	BaseLandAirDefense, PurchaseCooldown, HurryCostModifier,
	UnitArtInfo, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex, RangeAttackOnlyInDomain)
VALUES
	('UNIT_BB_BATTLESHIP', 'UNITCLASS_BB_BATTLESHIP', 'DOMAIN_SEA', 'UNITCOMBAT_CARRIER', 'TECH_NUCLEAR_FISSION', 'TECH_ROBOTICS', 'UNITAI_ASSAULT_SEA',
	'TXT_KEY_UNIT_BB_BATTLESHIP', 'TXT_KEY_UNIT_BB_BATTLESHIP_PEDIA', 'TXT_KEY_UNIT_BB_BATTLESHIP_STRATEGY', 'TXT_KEY_UNIT_BB_BATTLESHIP_HELP', 0,
	2250, 1200, 3, 85, 4, 80, 2, 0, 2,
	1, 1, 1, 0, 0,
	0, 10, 0, 0, 'BOAT',
	10, 1, 5,
  'ART_DEF_UNIT_BATTLESHIP', 'UNIT_FLAG_ATLAS', 68, 'UNIT_ATLAS_2', 21, 0);


	
INSERT INTO UnitGameplay2DScripts (UnitType, SelectionSound, FirstSelectionSound)
VALUES ('UNIT_BB_BATTLESHIP', 'AS2D_SELECT_BATTLESHIP', 'AS2D_BIRTH_BATTLESHIP');

INSERT INTO Unit_BuildingClassPurchaseRequireds (UnitType, BuildingClassType)
VALUES ('UNIT_BB_BATTLESHIP','BUILDINGCLASS_MILITARY_ACADEMY'),
       ('UNIT_BB_BATTLESHIP','BUILDINGCLASS_SEAPORT');
	   
INSERT INTO Unit_ResourceQuantityRequirements (UnitType, ResourceType, Cost)
VALUES ('UNIT_BB_BATTLESHIP', 'RESOURCE_IRON', 1),
       ('UNIT_BB_BATTLESHIP', 'RESOURCE_OIL', 1);
	   
INSERT INTO Unit_AITypes (UnitType, UnitAIType)
VALUES
	('UNIT_BB_BATTLESHIP', 'UNITAI_ASSAULT_SEA'),
	('UNIT_BB_BATTLESHIP', 'UNITAI_ATTACK_SEA'),
	('UNIT_BB_BATTLESHIP', 'UNITAI_RESERVE_SEA');

INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)
VALUES
	('UNIT_BB_BATTLESHIP', 'FLAVOR_NAVAL', 48),
	('UNIT_BB_BATTLESHIP', 'FLAVOR_NAVAL_RECON', 20);

INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
VALUES
    ('UNIT_BB_BATTLESHIP', 'PROMOTION_WARSHIP'),
	('UNIT_BB_BATTLESHIP', 'PROMOTION_DEEP_DRAFT'),
	('UNIT_BB_BATTLESHIP', 'PROMOTION_ONLY_DEFENSIVE'),
	('UNIT_BB_BATTLESHIP', 'PROMOTION_HIGH_P_ROUND'),
    ('UNIT_BB_BATTLESHIP', 'PROMOTION_FIRE_CONTROL');

INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_UNIT_BB_BATTLESHIP', 'Battleship');

-- Pedia: Historical Info (bottom)
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_UNIT_BB_BATTLESHIP_PEDIA', 'A battleship is a large, heavily armored warship with a main battery consisting of large guns, designed to serve as a capital ship. From their advent in the late 1880s, battleships were among the largest and most formidable weapon systems ever built, until they were surpassed by aircraft carriers beginning in the 1940s.');

-- Pedia: Strategy (middle)
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_UNIT_BB_BATTLESHIP_HELP', 'Powerful ranged capital ship. Excels at leading fleets with devastating naval artillery and strong defenses.');

-- Pedia: Game Info (top)
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_UNIT_BB_BATTLESHIP_STRATEGY', 'With unrivaled firepower and armor, the Battleship excels at striking enemy fleets and surviving the fiercest naval battles.');
---------------------------------------------------------
UPDATE LeagueProjectRewards
SET FreeUnitClass = 'UNITCLASS_BB_SHIP_OF_THE_LINE'
WHERE Type = 'LEAGUE_PROJECT_REWARD_TREASURE_FLEET_1';

UPDATE Language_en_US
SET Text = 'Receive one Ship of the Line. 300 points towards next [ICON_GOLDEN_AGE] Golden Age.'
WHERE Tag IN ('TXT_KEY_LEAGUE_PROJECT_REWARD_TREASURE_FLEET_1_HELP');



-----------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions_UnitClasses
	(PromotionType, UnitClassType, Modifier)
SELECT DISTINCT
	'PROMOTION_IRON_HULL', Class, 10
FROM Units
WHERE (Domain = 'DOMAIN_SEA' AND (Combat > 0) AND PrereqTech IN (SELECT Type FROM Technologies
																WHERE Era IN ('ERA_ANCIENT', 'ERA_CLASSICAL', 'ERA_MEDIEVAL', 'ERA_RENAISSANCE'))) OR Class = 'UNITCLASS_CRUISER';	
																
UPDATE UnitPromotions SET CannotBeCaptured = 1 WHERE Type IN ('PROMOTION_IRON_HULL', 'PROMOTION_ALL_BIG_GUN', 'PROMOTION_FIRE_CONTROL');	
														
---------------------------------------------------------------

INSERT INTO UnitPromotions_UnitClasses
	(PromotionType, UnitClassType, Attack)
VALUES
    ('PROMOTION_HIGH_P_ROUND', 'UNITCLASS_BB_SHIP_OF_THE_LINE', 25),	
    ('PROMOTION_HIGH_P_ROUND', 'UNITCLASS_BB_IRONCLAD', 25),	
    ('PROMOTION_HIGH_P_ROUND', 'UNITCLASS_BB_DREADNOUGHT', 25),
	('PROMOTION_HIGH_P_ROUND', 'UNITCLASS_BB_BATTLESHIP', 25);

---------------------------------------------------------------
INSERT INTO UnitPromotions_UnitClasses (PromotionType, UnitClassType, Modifier)
SELECT * FROM (
    SELECT 'PROMOTION_NAVAL_BONUS', 'UNITCLASS_BB_SHIP_OF_THE_LINE', 25 UNION ALL
    SELECT 'PROMOTION_NAVAL_BONUS', 'UNITCLASS_BB_IRONCLAD', 25 UNION ALL
    SELECT 'PROMOTION_NAVAL_BONUS', 'UNITCLASS_BB_DREADNOUGHT', 25 UNION ALL
    SELECT 'PROMOTION_NAVAL_BONUS', 'UNITCLASS_BB_BATTLESHIP', 25
) AS sub
WHERE EXISTS (SELECT 1 FROM Units WHERE Type = 'UNIT_TORPEDO');



UPDATE	Language_en_US SET
		Text = REPLACE(Text, 'Naval Ranged Units', 'Naval Ranged and Capital Units except Carriers')
		WHERE Tag = 'TXT_KEY_PROMOTION_NAVAL_BONUS_HELP' AND EXISTS (SELECT * FROM Units WHERE Type='UNIT_TORPEDO');
	

	
--------------------EXP--------------------------------------------	

--Combat = Melee+Ranged/2, RangedCombat = RCS Ranged + 5

UPDATE Units SET Combat = 35, RangedCombat = 40 WHERE Type = 'UNIT_BB_SHIP_OF_THE_LINE'; --25/35--40
UPDATE Units SET Combat = 40, RangedCombat = 45 WHERE Type = 'UNIT_ENGLISH_SHIPOFTHELINE'; --28/38
UPDATE Units SET Combat = 50, RangedCombat = 60 WHERE Type = 'UNIT_BB_IRONCLAD'; --40/55 -- 55
UPDATE Units SET Combat = 60, RangedCombat = 70 WHERE Type = 'UNIT_BB_DREADNOUGHT';--50/65 --70
UPDATE Units SET Combat = 70, RangedCombat = 80 WHERE Type = 'UNIT_BB_BATTLESHIP';--60/75 --80
UPDATE Units SET Combat = 75, RangedCombat = 80 WHERE Type = 'UNIT_MISSILE_CRUISER';--75/80--






