----------------------------------------

INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 				TileType,	Asset)
VALUES	('ART_DEF_UNIT_TORPEDOBOAT',	'Unit', 	'SV_Torpedo.dds');
	
INSERT INTO ArtDefine_UnitInfos 
		(Type, 								DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_TORPEDOBOAT', 	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_SUBMARINE'; 

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,						UnitMemberInfoType,						 NumMembers)
SELECT	'ART_DEF_UNIT_TORPEDOBOAT', 	'ART_DEF_UNIT_MEMBER_TORPEDOBOAT', NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_SUBMARINE';

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,							EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_TORPEDOBOAT',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_SUBMARINE';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,							"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_TORPEDOBOAT',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_SUBMARINE';

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 										Scale, ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_TORPEDOBOAT',	0.06, -0.5, Domain, 'SMSElster.fxsxml',  MaterialTypeTag, MaterialTypeSoundOverrideTag  ------ 0.05, ZOffset 
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_SUBMARINE';	
---------------------------------------------------
-- Unit
----------------------------------------------------
INSERT INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn) VALUES
('TORPEDO_UNIT_ATLAS',256,'NavalModIcon256.dds', 4, 3),
('TORPEDO_UNIT_ATLAS',128,'NavalModIcon128.dds', 4, 3),
('TORPEDO_UNIT_ATLAS',80,'NavalModIcon080.dds', 4, 3),
('TORPEDO_UNIT_ATLAS',64,'NavalModIcon064.dds', 4, 3),
('TORPEDO_UNIT_ATLAS',45,'NavalModIcon045.dds', 4, 3);

INSERT INTO IconTextureAtlases 
			(Atlas, 							IconSize, 	Filename, 							IconsPerRow, 	IconsPerColumn)
VALUES	('UNIT_PTBOAT_FLAG_ATLAS', 			32, 		'Torpedo_UnitFlagAtlas.dds', 				1, 				1);


INSERT INTO UnitClasses (Type, Description, MaxPlayerInstances, DefaultUnit)
VALUES ('UNITCLASS_TORPEDO', 'TXT_KEY_UNIT_TORPEDO', -1, 'UNIT_TORPEDO');

INSERT INTO Units
	(Type, Class, Domain, CombatClass, PrereqTech, ObsoleteTech, DefaultUnitAI,
	Description, Civilopedia, Strategy, Help, CombatLimit, 
	Cost, FaithCost, ExtraMaintenanceCost, Combat, Moves, RangedCombat, Range, AirInterceptRange, BaseSightRange,
	MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, Mechanized,
	AdvancedStartCost, MinAreaSize, XPValueAttack, XPValueDefense, MoveRate,
	BaseLandAirDefense, PurchaseCooldown, HurryCostModifier,
	UnitArtInfo, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex, RangeAttackOnlyInDomain)
VALUES
	('UNIT_TORPEDO', 'UNITCLASS_TORPEDO', 'DOMAIN_SEA', 'UNITCOMBAT_SUBMARINE', 'TECH_INDUSTRIALIZATION', 'TECH_PLASTIC', 'UNITAI_ASSAULT_SEA',
	'TXT_KEY_UNIT_TORPEDO', 'TXT_KEY_UNIT_TORPEDO_PEDIA', 'TXT_KEY_UNIT_TORPEDO_STRATEGY', 'TXT_KEY_UNIT_TORPEDO_HELP', 0,
	900, 700, 0, 30, 5, 40, 1, 0, 2,
	1, 1, 1, 0, 0,
	0, 10, 0, 0, 'BOAT',
	0, 1, 0,
  'ART_DEF_UNIT_TORPEDOBOAT', 'UNIT_PTBOAT_FLAG_ATLAS', 0, 'TORPEDO_UNIT_ATLAS', 12, 1);


	

	
INSERT INTO UnitGameplay2DScripts (UnitType, SelectionSound, FirstSelectionSound)
VALUES ('UNIT_TORPEDO', 'AS2D_SELECT_IRONCLAD', 'AS2D_BIRTH_IRONCLAD');


INSERT INTO Unit_ClassUpgrades (UnitType, UnitClassType)
VALUES ('UNIT_TORPEDO', 'UNITCLASS_SUBMARINE');


INSERT INTO Unit_BuildingClassPurchaseRequireds (UnitType, BuildingClassType)
VALUES ('UNIT_TORPEDO','BUILDINGCLASS_SEAPORT');

INSERT INTO Unit_ResourceQuantityRequirements (UnitType, ResourceType, Cost)
VALUES ('UNIT_TORPEDO', 'RESOURCE_ALUMINUM', 1);

INSERT INTO Unit_AITypes (UnitType, UnitAIType)
VALUES
	('UNIT_TORPEDO', 'UNITAI_ASSAULT_SEA'),
	('UNIT_TORPEDO', 'UNITAI_RESERVE_SEA');

INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor)
VALUES
	('UNIT_TORPEDO', 'FLAVOR_NAVAL', 20),
	('UNIT_TORPEDO', 'FLAVOR_NAVAL_RECON', 20);

INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
VALUES
    ('UNIT_TORPEDO', 'PROMOTION_SILENT_HUNTER'),
	('UNIT_TORPEDO', 'PROMOTION_ONLY_DEFENSIVE'),
	('UNIT_TORPEDO', 'PROMOTION_BIG_CITY_PENALTY'),
	('UNIT_TORPEDO', 'PROMOTION_CAN_MOVE_AFTER_ATTACKING');	


----------------------------------------------------
-- Text (en_US)
----------------------------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_UNIT_TORPEDO', 'Torpedo Boat');

-- Pedia: Historical Info (bottom)
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_UNIT_TORPEDO_PEDIA', 'A Torpedo Boat is a relatively small, nimble vessels originally equipped with explosive spar torpedoes, later designs utilize self-propelled torpedoes, and can devastate cumbersome fleets.');

-- Pedia: Strategy (middle)
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_UNIT_TORPEDO_STRATEGY', 'The Torpedo Boat is a high-speed attack boat used primarily on coastal tiles.');

-- Pedia: Game Info (top)
INSERT INTO Language_en_US (Tag, Text)
VALUES ('TXT_KEY_UNIT_TORPEDO_HELP', 'The Torpedo Boat is a vigilant defender of the high seas. Fast and deadly is essential for naval sorties.');




-------------------------NAVAL_BONUS-----------------------------------------------------
UPDATE UnitPromotions SET OrderPriority = 824, FlagPromoOrder = 824, PortraitIndex = 31, IconAtlas = 'extraPromo_Atlas' WHERE Type = 'PROMOTION_NAVAL_BONUS';
DELETE FROM UnitPromotions_UnitCombatMods WHERE PromotionType = 'PROMOTION_NAVAL_BONUS';

UPDATE UnitPromotions SET Help = 'TXT_KEY_PROMOTION_NAVAL_BONUS_HELP', PediaEntry = 'TXT_KEY_PROMOTION_NAVAL_BONUS', SimpleHelpText = 0 WHERE Type = 'PROMOTION_NAVAL_BONUS';
UPDATE Language_en_US SET Text = 'Naval Ambush' WHERE Tag = 'TXT_KEY_PROMOTION_NAVAL_BONUS';
UPDATE Language_en_US SET Text = '+25% [ICON_STRENGTH] Combat Strength VS [COLOR_POSITIVE_TEXT]Naval Ranged Units[ENDCOLOR].[NEWLINE]+10% [ICON_STRENGTH] Combat Strength when attacking Units in [COLOR_POSITIVE_TEXT]Coastal Tiles[ENDCOLOR].[NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]Lost on Upgrade.[ENDCOLOR]' WHERE Tag = 'TXT_KEY_PROMOTION_NAVAL_BONUS_HELP';


INSERT INTO UnitPromotions_UnitCombatMods
	(PromotionType, UnitCombatType, Modifier)
VALUES
    ('PROMOTION_NAVAL_BONUS', 'UNITCOMBAT_NAVALRANGED', 25);

INSERT INTO UnitPromotions_Terrains
	(PromotionType, TerrainType, Attack)
VALUES
    ('PROMOTION_NAVAL_BONUS', 'TERRAIN_COAST', 10);



INSERT INTO UnitPromotions
	(Type, Description, Help, Sound, LostWithUpgrade, CannotBeChosen, PortraitIndex, IconAtlas, PediaType, PediaEntry, OrderPriority, FlagPromoOrder)
VALUES
   ('PROMOTION_COAST_GUARD_1', 'TXT_KEY_PROMOTION_COAST_GUARD_1', 'TXT_KEY_PROMOTION_COAST_GUARD_1_HELP', 'AS2D_IF_LEVELUP', 1, 1, 28, 'extraPromo_Atlas', 'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_COAST_GUARD_1', 825, 825);
   

   
UPDATE UnitPromotions SET FriendlyLandsAttackModifier = 10 WHERE Type = 'PROMOTION_COAST_GUARD_1';   

 INSERT INTO Language_en_US (Tag, Text)
VALUES
    ('TXT_KEY_PROMOTION_COAST_GUARD_1', 'Patrol I'),
    ('TXT_KEY_PROMOTION_COAST_GUARD_1_HELP', '+10% [ICON_STRENGTH] Combat Strength when attacking [COLOR_POSITIVE_TEXT]Inside of Friendly Territory[ENDCOLOR].[NEWLINE][COLOR_NEGATIVE_TEXT]Lost on Upgrade.[ENDCOLOR]');

INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
VALUES
    ('UNIT_TORPEDO', 'PROMOTION_OCEAN_HALF_MOVES'),
	('UNIT_TORPEDO', 'PROMOTION_COAST_GUARD_1'),
    ('UNIT_TORPEDO', 'PROMOTION_NAVAL_BONUS');
	
----------------------------------------------------
-- MELEE PROMO 
----------------------------------------------------
INSERT INTO UnitPromotions
	(Type, Description, Help, Sound, LostWithUpgrade, CannotBeChosen, PortraitIndex, IconAtlas, PediaType, PediaEntry, OrderPriority, FlagPromoOrder)
VALUES
 ('PROMOTION_CONVOY', 'TXT_KEY_PROMOTION_CONVOY', 'TXT_KEY_PROMOTION_CONVOY_HELP', 'AS2D_IF_LEVELUP', 0, 0, 27, 'extraPromo_Atlas', 'PEDIA_NAVAL', 'TXT_KEY_PROMOTION_CONVOY', 317, 317);
 
INSERT INTO UnitPromotions_UnitCombats
		(PromotionType,					UnitCombatType,			PediaType)
VALUES	('PROMOTION_CONVOY',			'UNITCOMBAT_NAVALMELEE',	null); 

UPDATE UnitPromotions SET PromotionPrereqOr1 = 'PROMOTION_NAVIGATOR_1', PromotionPrereqOr2 = 'PROMOTION_NAVIGATOR_2', 
PromotionPrereqOr3 = 'PROMOTION_IMPERIALISM_OPENER', PromotionPrereqOr4 = 'PROMOTION_TREASURE_FLEET', 
VisibilityChange = -1, TechPrereq = 'TECH_RADIO', SeeInvisible = 'INVISIBLE_SUBMARINE', 
CombatBonusFromNearbyUnitClass = 'UNITCLASS_CARGO_SHIP', NearbyUnitClassBonusRange = 2, NearbyUnitClassBonus = 15 WHERE Type = 'PROMOTION_CONVOY';

INSERT INTO UnitPromotions_CombatModPerAdjacentUnitCombat
	(PromotionType, UnitCombatType, Modifier)
VALUES
  ('PROMOTION_CONVOY', 'UNITCOMBAT_NAVALMELEE', 5);
   
INSERT INTO Language_en_US (Tag, Text)
VALUES
    ('TXT_KEY_PROMOTION_CONVOY', 'Convoy'),
    ('TXT_KEY_PROMOTION_CONVOY_HELP', '+15% [ICON_STRENGTH] Combat Strength if [COLOR_POSITIVE_TEXT]within 2 tiles of Owned Cargo Ship Unit[ENDCOLOR].[NEWLINE]+5% [ICON_STRENGTH] Combat Strength per [COLOR_POSITIVE_TEXT]Adjacent Owned Naval Melee Units[ENDCOLOR].
	[NEWLINE][COLOR_POSITIVE_TEXT]Reveal Invisible Submarines[ENDCOLOR] within [ICON_VP_VISION] Sight Range.[NEWLINE]-1 [ICON_VP_VISION] [COLOR_NEGATIVE_TEXT]Sight[ENDCOLOR].'); 


----------------------------------------------------
-- ANTI SUB 
----------------------------------------------------



-- Rename silent Hunter, Invisible and See Invisible
-- See Invisible JUST FREE  

UPDATE Language_en_US SET Text = 'Torpedo Attack' WHERE Tag = 'TXT_KEY_PROMOTION_SILENT_HUNTER';
UPDATE UnitPromotions SET CannotBeCaptured = 1 WHERE Type = 'PROMOTION_SILENT_HUNTER';
UPDATE UnitPromotions SET PromotionPrereqOr1 = NULL, PromotionPrereqOr2 = NULL, TechPrereq = NULL, CannotBeChosen = 1, PediaEntry = 'TXT_KEY_PROMOTION_SEE_INVISIBLE_SUBMARINE' WHERE Type = 'PROMOTION_SEE_INVISIBLE_SUBMARINE';
UPDATE Language_en_US SET Text = 'Sonar' WHERE Tag = 'TXT_KEY_PROMOTION_SEE_INVISIBLE_SUBMARINE';
DELETE FROM UnitPromotions_UnitCombats WHERE PromotionType = 'PROMOTION_SEE_INVISIBLE_SUBMARINE';



UPDATE UnitPromotions SET Help = 'TXT_KEY_PROMOTION_INVISIBLE_SUBMARINE_HELP', PediaEntry = 'TXT_KEY_PROMOTION_INVISIBLE_SUBMARINE', SimpleHelpText = 0 WHERE Type = 'PROMOTION_INVISIBLE_SUBMARINE';
UPDATE Language_en_US SET Text = 'Silent Hunter' WHERE Tag = 'TXT_KEY_PROMOTION_INVISIBLE_SUBMARINE';

INSERT INTO Language_en_US
			(Tag,															Text)
VALUES		('TXT_KEY_PROMOTION_INVISIBLE_SUBMARINE_HELP',	'Unit [COLOR_POSITIVE_TEXT]is Invisible[ENDCOLOR] when not adjacent to an Enemy Units without special ability.');


-------------------------------------------------------------------------------------------------------------------------------------------------------------

	
----------------------------------------------------------------------------------------------------------------------------
-- Naval Raider promotion tree drawn using ASCIIFlow
--
--                              ┌───► Commerce Raider
--                              │
--                              ├───► Minelayer
--                              │
--                              ├───► Interdictor   ┌───► Night Attack
--                              │                   │
-- Torpedo I ──┬──► Torpedo II ─┴───► Torpedo III ──┼───► Predator
--             │                                    │
--             │                                    ├───► Infiltrators
--             │                                    │
--             └──► Navigator I ───► Navigator II   └───► End Around
--  
----------------------------------------------------------------------------------------------------------------------------   
-- Extra promotion lines for Submarine
--
-- Dive I ────► Dive II
--
-- Supply ────► Wolfpack                                             
----------------------------------------------------------------------------------------------------------------------------

-- Add plague promo
UPDATE Language_en_US SET Text = 'Lost Contact' WHERE Tag = 'TXT_KEY_PROMOTION_SIGHT_PENALTY';
UPDATE Language_en_US SET Text = '-1 [ICON_VP_VISION] Sight.[NEWLINE]-2 [ICON_MOVES] Movement.[NEWLINE]Lasts for 1 turn.' WHERE Tag = 'TXT_KEY_PROMOTION_SIGHT_PENALTY_HELP';
UPDATE UnitPromotions SET LostWithUpgrade = 0, PromotionDuration = 1, MovesChange = -2, PlagueID = 10, FlagPromoOrder = 4, OrderPriority = 4, PediaEntry = 'TXT_KEY_PROMOTION_SIGHT_PENALTY' WHERE Type = 'PROMOTION_SIGHT_PENALTY';

--Change Hunter Killer
UPDATE UnitPromotions SET PromotionPrereqOr1 = 'PROMOTION_WOLFPACK_3', SeeInvisible = NULL, PlaguePromotion = 'PROMOTION_SIGHT_PENALTY', PlagueChance = 100, SplashDamage = 10, PortraitIndex = 61, IconAtlas = 'extraPromo_Atlas' WHERE Type = 'PROMOTION_HUNTER_KILLER';
UPDATE Language_en_US SET Text = 'Inflict the [COLOR_POSITIVE_TEXT]{TXT_KEY_PROMOTION_SIGHT_PENALTY}[ENDCOLOR] status on Enemy Naval Units when attacking, reducing their [ICON_MOVES] Movement by 2 and [ICON_VP_VISION] Sight by 1 for 1 Turn.
[NEWLINE]Deal [COLOR_POSITIVE_TEXT]10 Damage[ENDCOLOR] to all Enemy Units [COLOR_POSITIVE_TEXT]adjacent to[ENDCOLOR] the target Unit (within [ICON_RANGE_STRENGTH] Range) when attacking.
[NEWLINE]This Damage ignores damage reduction, but does not affect Units in [COLOR_NEGATIVE_TEXT]Cities[ENDCOLOR] and [COLOR_NEGATIVE_TEXT]Fortifications[ENDCOLOR].' WHERE Tag = 'TXT_KEY_PROMOTION_HUNTER_KILLER_HELP';
UPDATE Language_en_US SET Text = 'Night Attack' WHERE Tag = 'TXT_KEY_PROMOTION_HUNTER_KILLER';
DELETE FROM UnitPromotions_UnitCombatMods WHERE PromotionType = 'PROMOTION_HUNTER_KILLER';



-- Change Periscope Depth
UPDATE UnitPromotions SET PromotionPrereqOr1 = 'PROMOTION_INVISIBLE_SUBMARINE', PortraitIndex = 0, IconAtlas = 'ENW_PI_ATLAS', RankList = 'DIVE', RankNumber = 1, OrderPriority = 310, FlagPromoOrder = 310 WHERE Type = 'PROMOTION_PERISCOPE_DEPTH';
UPDATE UnitPromotions SET RangedDefenseMod = 0, ChangeDamageValue = -3 WHERE Type = 'PROMOTION_PERISCOPE_DEPTH';
UPDATE Language_en_US SET Text = 'Dive I' WHERE Tag = 'TXT_KEY_PROMOTION_PERISCOPE_DEPTH';
UPDATE Language_en_US SET Text = '-3 Damage from all sources.[NEWLINE]Withdraw from Melee Attack if there is an open tile behind this Unit, once per turn.' WHERE Tag = 'TXT_KEY_PROMOTION_PERISCOPE_DEPTH_HELP';


------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions
	(Type, Description, Help, Sound, LostWithUpgrade, CannotBeChosen, PortraitIndex, IconAtlas, PediaType, PediaEntry, RankList, RankNumber, OrderPriority, FlagPromoOrder)
VALUES
  ('PROMOTION_DIVE', 'TXT_KEY_PROMOTION_DIVE', 'TXT_KEY_PROMOTION_DIVE_HELP', 'AS2D_IF_LEVELUP', 0, 0, 1, 'ENW_PI_ATLAS', 'PEDIA_CARSUB', 'TXT_KEY_PROMOTION_DIVE', 'DIVE', 2, 310, 310);
	
UPDATE UnitPromotions SET PromotionPrereqOr1 = 'PROMOTION_PERISCOPE_DEPTH', PlagueIDImmunity = 1, ChangeDamageValue = -3 WHERE Type = 'PROMOTION_DIVE';


INSERT INTO UnitPromotions_UnitCombats
		(PromotionType,					UnitCombatType,			PediaType)
VALUES	('PROMOTION_DIVE',			'UNITCOMBAT_SUBMARINE',	null);	

INSERT INTO Language_en_US (Tag, Text)
VALUES
    ('TXT_KEY_PROMOTION_DIVE', 'Dive II'),
    ('TXT_KEY_PROMOTION_DIVE_HELP', '-3 Damage from all sources.[NEWLINE]Immune to the [COLOR_POSITIVE_TEXT]Boarded[ENDCOLOR] status.');
  
-- Move Suply
UPDATE UnitPromotions SET PromotionPrereqOr3 = 'PROMOTION_INVISIBLE_SUBMARINE' WHERE Type = 'PROMOTION_SUPPLY';	


--------------------------MORE PROMO--------------------------------------------
INSERT INTO UnitPromotions
	(Type, Description, Help, Sound, LostWithUpgrade, CannotBeChosen, PortraitIndex, IconAtlas, PediaType, PediaEntry, OrderPriority, FlagPromoOrder)
VALUES
   ('PROMOTION_INTERDICTOR', 'TXT_KEY_PROMOTION_INTERDICTOR', 'TXT_KEY_PROMOTION_INTERDICTOR_HELP', 'AS2D_IF_LEVELUP', 0, 0, 55, 'extraPromo_Atlas', 'PEDIA_CARSUB', 'TXT_KEY_PROMOTION_INTERDICTOR', 337, 337),
    ('PROMOTION_END_AROUND', 'TXT_KEY_PROMOTION_END_AROUND', 'TXT_KEY_PROMOTION_END_AROUND_HELP', 'AS2D_IF_LEVELUP', 0, 0, 10, 'promoVP_atlas_04', 'PEDIA_CARSUB', 'TXT_KEY_PROMOTION_END_AROUND', 338, 338);
	
INSERT INTO UnitPromotions_UnitCombats
		(PromotionType,					UnitCombatType,			PediaType)
VALUES	('PROMOTION_INTERDICTOR',		'UNITCOMBAT_SUBMARINE',	null),
        ('PROMOTION_END_AROUND',		'UNITCOMBAT_SUBMARINE',	null);	

UPDATE UnitPromotions SET PromotionPrereqOr1 = 'PROMOTION_WOLFPACK_2' WHERE Type = 'PROMOTION_INTERDICTOR';			
	
UPDATE UnitPromotions SET MoraleBreakChance = 100, RangedFlankAttack = 1, PromotionPrereqOr1 = 'PROMOTION_WOLFPACK_3' WHERE Type = 'PROMOTION_END_AROUND';		

INSERT INTO UnitPromotions_Domains
	(PromotionType, DomainType, Attack)
VALUES
	('PROMOTION_INTERDICTOR', 'DOMAIN_LAND', 50);	

INSERT INTO Language_en_US (Tag, Text)
VALUES
    ('TXT_KEY_PROMOTION_INTERDICTOR', 'Interdictor'),
    ('TXT_KEY_PROMOTION_INTERDICTOR_HELP', '+50% [ICON_STRENGTH] Combat Strength when attacking [COLOR_POSITIVE_TEXT]Embarked Units[ENDCOLOR].'),
	('TXT_KEY_PROMOTION_END_AROUND', 'End Around'),
    ('TXT_KEY_PROMOTION_END_AROUND_HELP', 'Benefit from [COLOR_POSITIVE_TEXT]Flanking[ENDCOLOR] when ranged attacking Units (does not factor in Adjacent Enemy Units).[NEWLINE]Force an enemy Unit to retreat after taking [ICON_RANGE_STRENGTH] Ranged Damage. If the Unit cannot retreat, it takes [COLOR_POSITIVE_TEXT]50%[ENDCOLOR] more damage than normal.');

	
-- Move Wolfpack
UPDATE UnitPromotions SET PromotionPrereqOr1 = 'PROMOTION_SUPPLY' WHERE Type = 'PROMOTION_TRUE_WOLFPACK';

-- Remove Indomitable
DELETE FROM UnitPromotions_UnitCombats WHERE PromotionType = 'PROMOTION_TARGETING_4' AND UnitCombatType = 'UNITCOMBAT_SUBMARINE';
UPDATE UnitPromotions SET PromotionPrereqOr2 = NULL WHERE Type = 'PROMOTION_TARGETING_4';

-- Add Minelayer
UPDATE UnitPromotions SET PromotionPrereqOr2 = 'PROMOTION_WOLFPACK_2' WHERE Type = 'PROMOTION_MINELAYER';

INSERT INTO UnitPromotions_UnitCombats
		(PromotionType,					UnitCombatType,			PediaType)
VALUES	('PROMOTION_MINELAYER',		'UNITCOMBAT_SUBMARINE',	null);

--------------------------Scavenger & HighSeaRaider----------------------------------------------------
UPDATE Units SET HighSeaRaider = 1 WHERE Type IN ('UNIT_SUBMARINE', 'UNIT_ATTACK_SUBMARINE', 'UNIT_NUCLEAR_SUBMARINE');

INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
VALUES
    ('UNIT_SUBMARINE', 'PROMOTION_SCOUT_XP_PILLAGE'),
	('UNIT_ATTACK_SUBMARINE', 'PROMOTION_SCOUT_XP_PILLAGE'),
	('UNIT_NUCLEAR_SUBMARINE', 'PROMOTION_SCOUT_XP_PILLAGE');
--------------------------TXT----------------------------------------------------

UPDATE Language_en_US SET Text = 'Naval Raider Units' WHERE Tag = 'TXT_KEY_UNITCOMBAT_SUBMARINE';

UPDATE	Language_en_US SET
		Text = REPLACE(Text, 'Submarine', 'Naval Raider')
		WHERE Tag = 'TXT_KEY_PROMOTION_TRUE_WOLFPACK_HELP';
		
UPDATE	Language_en_US SET
		Text = REPLACE(Text, 'Submarines', 'Naval Raiders')
		WHERE Tag IN ('TXT_KEY_LEAGUE_PROJECT_REWARD_TREASURE_FLEET_3_HELP', 'TXT_KEY_BUILDING_GRAND_CANAL_HELP', 'TXT_KEY_PROMOTIONS_PEDIA_CARSUB');
		
-----------------------------------------------------------------------

UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.08, Model = 'Porte-Avions_2.fxsxml' WHERE Type = 'ART_DEF_UNIT_MEMBER_SUPERCARRIER';

----------------------------------NUCLEAR SUB-------------------------------------

INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
VALUES
	('UNIT_NUCLEAR_SUBMARINE', 'PROMOTION_SEE_INVISIBLE_SUBMARINE'),
	('UNIT_NUCLEAR_SUBMARINE', 'PROMOTION_REPAIR');
	

UPDATE Units SET
Combat = 65,
RangedCombat = 90,
Range = 2
WHERE Type = 'UNIT_NUCLEAR_SUBMARINE';	

UPDATE Units 
SET ObsoleteTech = NULL 
WHERE Type = 'UNIT_ATTACK_SUBMARINE';

UPDATE Unit_ResourceQuantityRequirements 
SET ResourceType = 'RESOURCE_URANIUM' 
WHERE UnitType = 'UNIT_NUCLEAR_SUBMARINE';

--------------------------------------------------------------

UPDATE Units SET IconAtlas = 'TORPEDO_UNIT_ATLAS', PortraitIndex = 11 WHERE Type = 'UNIT_ROCKET_MISSILE';



UPDATE Units SET IconAtlas = 'TORPEDO_UNIT_ATLAS', PortraitIndex = 0 WHERE Type = 'UNIT_SUPERCARRIER';
UPDATE Units SET IconAtlas = 'TORPEDO_UNIT_ATLAS', PortraitIndex = 6 WHERE Type = 'UNIT_LIBURNA';





UPDATE Units SET IconAtlas = 'TORPEDO_UNIT_ATLAS', PortraitIndex = 9 WHERE Type = 'UNIT_ATTACK_SUBMARINE';
UPDATE Units SET IconAtlas = 'TORPEDO_UNIT_ATLAS', PortraitIndex = 7 WHERE Type = 'UNIT_TORPEDO';




UPDATE Units SET IconAtlas = 'TORPEDO_UNIT_ATLAS', PortraitIndex = 10 WHERE Type = 'UNIT_MISSILE_DESTROYER';
UPDATE Units SET IconAtlas = 'TORPEDO_UNIT_ATLAS', PortraitIndex = 8 WHERE Type = 'UNIT_EARLY_DESTROYER';



UPDATE Units SET IconAtlas = 'TORPEDO_UNIT_ATLAS', PortraitIndex = 2 WHERE Type = 'UNIT_FCOMPANY';
UPDATE Units SET IconAtlas = 'TORPEDO_UNIT_ATLAS', PortraitIndex = 4 WHERE Type = 'UNIT_COMMANDO';
UPDATE Units SET IconAtlas = 'TORPEDO_UNIT_ATLAS', PortraitIndex = 5 WHERE Type = 'UNIT_ANTI_TANK_GUN';







	























