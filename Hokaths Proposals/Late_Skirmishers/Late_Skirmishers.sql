--==========================================================================================================================	
------------------------
-- Armored Ford
------------------------
INSERT INTO ArtDefine_UnitInfos (Type,DamageStates,Formation)
	SELECT	('ART_DEF_UNIT_ARMORED_FORD'), DamageStates, 'Vehicle'
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_WW1_TANK');

INSERT INTO ArtDefine_UnitInfoMemberInfos 
	(UnitInfoType, UnitMemberInfoType, NumMembers)
SELECT
	'ART_DEF_UNIT_ARMORED_FORD', 'ART_DEF_UNIT_MEMBER_ARMORED_FORD', NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_WW1_TANK';

INSERT INTO ArtDefine_UnitMemberCombats (UnitMemberType, EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
	SELECT	('ART_DEF_UNIT_MEMBER_ARMORED_FORD'), EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
	FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_WW1_TANK');

INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
	SELECT ('ART_DEF_UNIT_MEMBER_ARMORED_FORD'), "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
	FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_MACHINEGUN');

INSERT INTO ArtDefine_UnitMemberInfos (Type, Scale, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
	SELECT	('ART_DEF_UNIT_MEMBER_ARMORED_FORD'), Scale*1.3, ZOffset, Domain, ('FordFTBDesert.fxsxml'), MaterialTypeTag, MaterialTypeSoundOverrideTag
	FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_WW1_TANK');
----------------------------------
-- Helicopter
----------------------------------=
INSERT INTO ArtDefine_UnitInfos (Type,DamageStates,Formation)
	SELECT	('ART_DEF_UNIT_UTILITY_HELICOPTER'), DamageStates, Formation
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_HELICOPTER_GUNSHIP');

INSERT INTO ArtDefine_UnitInfoMemberInfos 
	(UnitInfoType, UnitMemberInfoType, NumMembers)
SELECT
	'ART_DEF_UNIT_UTILITY_HELICOPTER', 'ART_DEF_UNIT_MEMBER_UTILITY_HELICOPTER', NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_HELICOPTER_GUNSHIP';

INSERT INTO ArtDefine_UnitMemberCombats (UnitMemberType, EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
	SELECT	('ART_DEF_UNIT_MEMBER_UTILITY_HELICOPTER'), EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
	FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_HELICOPTERGUNSHIP');

INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
	SELECT ('ART_DEF_UNIT_MEMBER_UTILITY_HELICOPTER'), "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
	FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_HELICOPTERGUNSHIP');

INSERT INTO ArtDefine_UnitMemberInfos (Type, Scale, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
	SELECT	('ART_DEF_UNIT_MEMBER_UTILITY_HELICOPTER'), Scale*0.75, ZOffset, Domain, ('UH1_team.fxsxml'), MaterialTypeTag, MaterialTypeSoundOverrideTag
	FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_HELICOPTERGUNSHIP');	
------------------------------
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType,		TileType,		Asset)
VALUES	('ART_DEF_UNIT_ARMORED_FORD',		'Unit', 		'sv_armoredford.dds');

INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType,		TileType,		Asset)
VALUES	('ART_DEF_UNIT_UTILITY_HELICOPTER',		'Unit', 		'sv_UH1.dds');
--=========================================================================================================================
-- Atlases for icons and flags
--=========================================================================================================================
INSERT INTO IconTextureAtlases 
	(Atlas,	   IconSize,  	Filename, 		IconsPerRow, 	IconsPerColumn)
VALUES	
	('Armored_Ford_Flag', 32,  'unitflag_armoredford.dds',	1, 		1),
	('UH1_Flag', 	      32,  'unitflag_UH1.dds',		1, 		1),
	('Late_Skirmishers', 256,  'Late_Skirmishers_256.dds',	2, 		1),
	('Late_Skirmishers', 128,  'Late_Skirmishers_128.dds',	2, 		1),
	('Late_Skirmishers',  80,   'Late_Skirmishers_80.dds',	2, 		1),
	('Late_Skirmishers',  64,   'Late_Skirmishers_64.dds',	2, 		1),
	('Late_Skirmishers',  45,   'Late_Skirmishers_45.dds',	2, 		1);
--=========================================================================================================================
-- Update art and text on Light Tank (Anti-Tank Gun)
------------------------------------------------------------------------------------
UPDATE Units SET
	IconAtlas = 'Late_Skirmishers',
	PortraitIndex = 1,
	UnitArtInfo = 'ART_DEF_UNIT_ARMORED_FORD',
	UnitFlagAtlas = 'Armored_Ford_Flag',
	UnitFlagIconOffset = 0
WHERE Type = 'UNIT_ANTI_TANK_GUN';

UPDATE Language_en_US
SET Text = 'Armored Car'
WHERE Tag = 'TXT_KEY_UNIT_AT_GUN';

UPDATE Language_en_US
SET Text = 'The Armored Car is a specialized combat unit designed for hit-and-run tactics. Back them up with Zone of Control and other forms of support for a potent Modern Era fighting force.'
WHERE Tag = 'TXT_KEY_UNIT_AT_GUN_STRATEGY';

-- A light tank is a tank variant initially designed for rapid movement, and now primarily employed in the reconnaissance role, or in support of expeditionary forces where main battle tanks cannot be made available. Early light tanks were generally armed and armored similar to an armored car, but used tracks in order to provide better cross-country mobility. The fast light tank was a major feature of the pre-WWII buildup, where it was expected they would be used to exploit breakthroughs in enemy lines created by slower, heavier tanks. Numerous small tank designs and "tankettes" were developed during this period and known under a variety of names, including the ''combat car''.

UPDATE Language_en_US
SET Text = 'An armored car is a wheeled armoured fighting vehicle, historically employed for reconnaissance, internal security, armed escort, and other subordinate battlefield tasks. With the gradual decline of mounted cavalry, armored cars were developed for carrying out duties formerly assigned to light cavalry. Following the invention of the tank, the armoured car remained popular due to its faster speed, comparatively simple maintenance and low production cost. in WWII, some cars equipped with heavier armament could even substitute for tracked combat vehicles in favorable conditions—such as pursuit or flanking maneuvers during the North African campaign.'
WHERE Tag = 'TXT_KEY_CIV5_INDUSTRIAL_ANTITANKGUN_TEXT';

------------------------------------------------------------------------------------
-- Push back gunship and adjust cost
------------------------------------------------------------------------------------

UPDATE Units SET
PrereqTech = 'TECH_LASERS',
Cost = 2500,
FaithCost = 2000
WHERE Type = 'UNIT_HELICOPTER_GUNSHIP';

------------------------------------------------------------------------------------
-- Insert New Hover Unit
------------------------------------------------------------------------------------
INSERT INTO Units (Type, Class, PrereqTech, Combat, Moves, RequiresFaithPurchaseEnabled, CombatClass, Domain, DefaultUnitAI, AdvancedStartCost, UnitFlagIconOffset, PortraitIndex, GoodyHutUpgradeUnitClass) VALUES
('UNIT_UTILITY_HELICOPTER',  'UNITCLASS_UTILITY_HELICOPTER',  'TECH_NUCLEAR_FISSION',  64, 5, 1,  'UNITCOMBAT_ARCHER', 'DOMAIN_LAND', 'UNITAI_RANGED',     10, 0, 0, 'UNITCLASS_HELICOPTER_GUNSHIP');

INSERT INTO UnitClasses (Type, DefaultUnit, Description)
SELECT 'UNITCLASS_'||SUBSTR(Type,6), Type, 'TXT_KEY_'||Type
FROM Units
WHERE Type IN (
'UNIT_UTILITY_HELICOPTER');

UPDATE Units
SET Class = 'UNITCLASS_'||SUBSTR(Type,6), Description = 'TXT_KEY_'||Type,
	Civilopedia = 'TXT_KEY_'||Type||'_PEDIA', Strategy = 'TXT_KEY_'||Type||'_STRATEGY', Help = 'TXT_KEY_'||Type||'_HELP',
	MilitarySupport = 1, Pillage = 1, MilitaryProduction = 1, XPValueAttack = 3, XPValueDefense = 3, PurchaseCooldown = 1,
	UnitArtInfo = 'ART_DEF_'||Type, UnitFlagAtlas = 'UH1_Flag', IconAtlas = 'Late_Skirmishers'
WHERE Type IN (
'UNIT_UTILITY_HELICOPTER');

INSERT INTO UnitGameplay2DScripts
	(UnitType, SelectionSound, FirstSelectionSound)
SELECT
	'UNIT_UTILITY_HELICOPTER', SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_HELICOPTER_GUNSHIP';

UPDATE Units SET
RangedCombat = 60,
Range = 1,
Cost = 1500,
FaithCost = 1200,
IsMounted = 1,
BaseLandAirDefense = 8
WHERE Type = 'UNIT_UTILITY_HELICOPTER';

INSERT INTO Unit_BuildingClassPurchaseRequireds
	(UnitType, BuildingClassType)
VALUES
	('UNIT_UTILITY_HELICOPTER', 'BUILDINGCLASS_AIRFIELD'),
	('UNIT_UTILITY_HELICOPTER', 'BUILDINGCLASS_MILITARY_ACADEMY');

INSERT INTO Unit_ClassUpgrades (UnitType, UnitClassType)
SELECT Type, GoodyHutUpgradeUnitClass
FROM Units
WHERE Type IN (
'UNIT_UTILITY_HELICOPTER');

UPDATE Units SET
ObsoleteTech = 'TECH_COMPUTERS'
WHERE Type = 'UNIT_ANTI_TANK_GUN';

UPDATE Units SET
GoodyHutUpgradeUnitClass = 'UNITCLASS_UTILITY_HELICOPTER'
WHERE Class = 'UNITCLASS_ANTI_TANK_GUN';

UPDATE Unit_ClassUpgrades SET
UnitClassType = 'UNITCLASS_UTILITY_HELICOPTER'
WHERE UnitType IN (SELECT Type FROM Units WHERE Class = 'UNITCLASS_ANTI_TANK_GUN');

-- TODO unique light tanks obsolete tech

INSERT INTO Unit_ResourceQuantityRequirements
	(UnitType, ResourceType, Cost)
SELECT
	'UNIT_UTILITY_HELICOPTER', 'RESOURCE_ALUMINUM', 1;

INSERT INTO Unit_FreePromotions
VALUES
	('UNIT_UTILITY_HELICOPTER', 'PROMOTION_SKIRMISHER_DOCTRINE'),
	('UNIT_UTILITY_HELICOPTER', 'PROMOTION_FLAT_MOVEMENT_COST'),
	('UNIT_UTILITY_HELICOPTER', 'PROMOTION_HOVERING_UNIT'),
	('UNIT_UTILITY_HELICOPTER', 'PROMOTION_CAN_MOVE_AFTER_ATTACKING'),
	('UNIT_UTILITY_HELICOPTER', 'PROMOTION_CITY_PENALTY'),
	('UNIT_UTILITY_HELICOPTER', 'PROMOTION_NAVAL_TARGET_PENALTY'),
	('UNIT_UTILITY_HELICOPTER', 'PROMOTION_NO_DEFENSIVE_BONUSES'),
	('UNIT_UTILITY_HELICOPTER', 'PROMOTION_ONLY_DEFENSIVE');

INSERT INTO UnitPromotions_UnitClasses
	(PromotionType, UnitClassType, Modifier)
VALUES
	('PROMOTION_ANTI_HELICOPTER', 'UNITCLASS_UTILITY_HELICOPTER', 150);

----------------------------------------------------
-- Unit AI
----------------------------------------------------
INSERT INTO Unit_Flavors
	(UnitType, FlavorType, Flavor)
VALUES
	('UNIT_UTILITY_HELICOPTER', 'FLAVOR_OFFENSE', 15),
	('UNIT_UTILITY_HELICOPTER', 'FLAVOR_DEFENSE', 15),
	('UNIT_UTILITY_HELICOPTER', 'FLAVOR_RANGED', 13),
	('UNIT_UTILITY_HELICOPTER', 'FLAVOR_MOBILE', 15);

INSERT INTO Unit_AITypes 
	(UnitType, UnitAIType) 
VALUES
	('UNIT_UTILITY_HELICOPTER', 'UNITAI_RANGED'),
	('UNIT_UTILITY_HELICOPTER', 'UNITAI_COUNTER');

--=========================================================================================================================
-- Text 
------------------------------------------------------
INSERT INTO Language_en_US
	(Tag, Text)
VALUES
	('TXT_KEY_UNIT_UTILITY_HELICOPTER', 'Utility Helicopter'),
	('TXT_KEY_UNIT_UTILITY_HELICOPTER_HELP', ''),  -- Highly mobile Skirmisher Unit. Is capable of hovering over Mountains and Coast.
	('TXT_KEY_UNIT_UTILITY_HELICOPTER_STRATEGY', 'As the first hovering Unit, you can use the Helicopter to attack across new terrain that was previously impassable. This includes coastal regions and therefore even allows you to leverage your force of Skirmisher units to aid your Navy, or defend against those of the enemy.'),
	('TXT_KEY_UNIT_UTILITY_HELICOPTER_PEDIA', 'The first turbine-powered helicopter in service with the United States military was the Bell UH-1 Iroquois (nickname Huey). Development of the Iroquois started in the early 1950s, a major impetus being a requirement issued by the United States Army for a new medical evacuation and utility helicopter. In military terms, a utility helicopter is an aircraft designed to transport troops, but is versatile in performing various combat roles. These tasks include command and control, logistics, casualty evacuation, and fire support. Their lightweight frames make them capable of quick maneuvers, but the cost of construction is also considerable.');

DELETE FROM Concepts WHERE Type = 'CONCEPT_AIR_POWER_HELICOPTER_GUNSHIPS_ANTI_TANK'; -- outdated even in VP since Bazooka exists for starters
DELETE FROM Concepts WHERE Type = 'CONCEPT_AIR_POWER_HELICOPTER_GUNSHIPS_MOVEMENT'; -- redundent with other entry, also incorrect
DELETE FROM Concepts_RelatedConcept WHERE ConceptType IN ('CONCEPT_AIR_POWER_HELICOPTER_GUNSHIPS_ANTI_TANK', 'CONCEPT_AIR_POWER_HELICOPTER_GUNSHIPS_MOVEMENT');
DELETE FROM Concepts_RelatedConcept WHERE RelatedConcept IN ('CONCEPT_AIR_POWER_HELICOPTER_GUNSHIPS_ANTI_TANK', 'CONCEPT_AIR_POWER_HELICOPTER_GUNSHIPS_MOVEMENT');

UPDATE Language_en_US SET
Text = 'Hovering Units'
WHERE Tag = 'TXT_KEY_AIRPOWER_HELIGUNSHIPS_HEADING2_TITLE';

UPDATE Language_en_US SET
Text = 'Hovering Units, such as the Utility Helicopter and Helicopter Gunship, move over both Land and Coastal tiles at the cost of 1[ICON_MOVES] Movement. This includes normally Impassable Terrain. As a result, Hovering Units can attack enemies from novel and possible undefended locations and retreat behind natural barriers and bodies of water to avoid counterattack. However they cannot attack while over Ocean tiles.'
WHERE Tag = 'TXT_KEY_AIRPOWER_HELIGUNSHIPS_HEADING2_BODY';

UPDATE Language_en_US SET
Text = Replace(Text, ' gunships', 's')  -- so it says helicopters
WHERE Tag = 'TXT_KEY_AIRPOWER_AIRUNITS_HEADING2_BODY';
