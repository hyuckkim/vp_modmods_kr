------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_StrategicView
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 			TileType,		Asset)
SELECT
	'ART_DEF_UNIT_HOKATH_ZEPPELIN', 	TileType,		Asset
FROM ArtDefine_StrategicView WHERE StrategicViewType = 'ART_DEF_UNIT_SMOKEY_STEAM_AIRSHIP_LEVEL_1';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO ArtDefine_UnitInfos 
		(Type, 							DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_HOKATH_ZEPPELIN',	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_BOMBER';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,					UnitMemberInfoType,					NumMembers)
SELECT	'ART_DEF_UNIT_HOKATH_ZEPPELIN', 	'ART_DEF_UNIT_MEMBER_HOKATH_ZEPPELIN',	1  -- multiple zeppelins is a bit odd
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_BOMBER';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)  -- set it faster than I would have it, but matches current VP standard
SELECT	'ART_DEF_UNIT_MEMBER_HOKATH_ZEPPELIN',		EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, 1.5, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_BOMBER';

------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_HOKATH_ZEPPELIN',		"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_BOMBER';

------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale,	ZOffset, Domain, Model,				MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_HOKATH_ZEPPELIN',		0.14,	ZOffset, Domain, 'ZeppelinTC.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_BOMBER';
--===============================================================================================

INSERT INTO UnitClasses 
	(Type, Description, DefaultUnit)
VALUES 
	('UNITCLASS_HOKATH_ZEPPELIN', 'TXT_KEY_DESC_HOKATH_ZEPPELIN', 'UNIT_HOKATH_ZEPPELIN');

INSERT INTO Units 
	(Type,		Description,				Civilopedia,						Strategy,		Help,							Requirements, Combat, RangedCombat, Cost, Moves, Immobile, Range, BaseSightRange, Class,									Special, Capture, CombatClass, Domain, CivilianAttackPriority, DefaultUnitAI,	Food, NoBadGoodies, RivalTerritory, MilitarySupport, MilitaryProduction, Pillage, Found, FoundAbroad, CultureBombRadius, GoldenAgeTurns, IgnoreBuildingDefense, PrereqResources, Mechanized, Suicide, CaptureWhileEmbarked, PrereqTech,	ObsoleteTech, GoodyHutUpgradeUnitClass,	HurryCostModifier, AdvancedStartCost, MinAreaSize, AirUnitCap, NukeDamageLevel, WorkRate, NumFreeTechs, RushBuilding, BaseHurry, HurryMultiplier, BaseGold, AirInterceptRange,	NumGoldPerEra, SpreadReligion, CombatLimit, RangeAttackOnlyInDomain, RangeAttackIgnoreLOS, RangedCombatLimit, XPValueAttack, XPValueDefense, SpecialCargo, DomainCargo, Conscription, ExtraMaintenanceCost, NoMaintenance, Unhappiness, UnitArtInfo,										UnitArtInfoCulturalVariation, UnitArtInfoEraVariation, ProjectPrereq, SpaceshipProject, LeaderPromotion, LeaderExperience, DontShowYields, ShowInPedia, MoveRate, UnitFlagIconOffset,	PortraitIndex,	IconAtlas,						UnitFlagAtlas)
SELECT	
	('UNIT_HOKATH_ZEPPELIN'), ('TXT_KEY_DESC_HOKATH_ZEPPELIN'),	('TXT_KEY_CIV5_HOKATH_ZEPPELIN_TEXT') ,	('TXT_KEY_STRATEGY_HOKATH_ZEPPELIN'), ('TXT_KEY_CIV5_HOKATH_ZEPPELIN_HELP'),	Requirements, Combat, 40, 450, Moves, Immobile, 6, BaseSightRange, ('UNITCLASS_HOKATH_ZEPPELIN'),	Special, Capture, CombatClass, Domain, CivilianAttackPriority, DefaultUnitAI,	Food, NoBadGoodies, RivalTerritory, MilitarySupport, MilitaryProduction, Pillage, Found, FoundAbroad, CultureBombRadius, GoldenAgeTurns, IgnoreBuildingDefense, PrereqResources, Mechanized, Suicide, CaptureWhileEmbarked, ('TECH_FERTILIZER'), ('TECH_FLIGHT'), ('UNITCLASS_WWI_BOMBER'),	HurryCostModifier, AdvancedStartCost, MinAreaSize, AirUnitCap, NukeDamageLevel, WorkRate, NumFreeTechs, RushBuilding, BaseHurry, HurryMultiplier, BaseGold, AirInterceptRange,	NumGoldPerEra, SpreadReligion, CombatLimit, RangeAttackOnlyInDomain, RangeAttackIgnoreLOS, RangedCombatLimit, XPValueAttack, XPValueDefense, SpecialCargo, DomainCargo, Conscription, ExtraMaintenanceCost, NoMaintenance, Unhappiness, ('ART_DEF_UNIT_HOKATH_ZEPPELIN'),		UnitArtInfoCulturalVariation, UnitArtInfoEraVariation, ProjectPrereq, SpaceshipProject, LeaderPromotion, LeaderExperience, DontShowYields, ShowInPedia, MoveRate, ('8'),				('45'),			('CORP2_ATLAS'), ('EXPANSION_SCEN_UNIT_FLAG_ATLAS')
FROM Units WHERE (Type = 'UNIT_WWI_BOMBER');

-- existing air units can have longer range
UPDATE Units SET
Range = Range + 1
WHERE Class IN ('UNITCLASS_WWI_BOMBER', 'UNITCLASS_TRIPLANE');

INSERT INTO UnitGameplay2DScripts 
	(UnitType, SelectionSound, FirstSelectionSound)
SELECT 
	'UNIT_HOKATH_ZEPPELIN', SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_WWI_BOMBER');

INSERT INTO Unit_ClassUpgrades 
	(UnitType, UnitClassType)
VALUES 
	('UNIT_HOKATH_ZEPPELIN', 'UNITCLASS_WWI_BOMBER');
	
INSERT INTO Unit_Flavors 
	(UnitType, FlavorType, Flavor) 
VALUES
	('UNIT_HOKATH_ZEPPELIN', 'FLAVOR_OFFENSE', 12),
	('UNIT_HOKATH_ZEPPELIN', 'FLAVOR_DEFENSE', 6),
	('UNIT_HOKATH_ZEPPELIN', 'FLAVOR_AIR', 10);
	
INSERT INTO Unit_FreePromotions 	
	(UnitType, 					PromotionType)
SELECT		
	'UNIT_HOKATH_ZEPPELIN',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_WWI_BOMBER';

INSERT INTO Language_en_US 
	(Tag, Text) 
VALUES
	('TXT_KEY_DESC_HOKATH_ZEPPELIN', 'Zeppelin'),
	('TXT_KEY_STRATEGY_HOKATH_ZEPPELIN', 'The Zeppelin is the first air unit in the game.'),
	('TXT_KEY_CIV5_HOKATH_ZEPPELIN_HELP', ''),
	('TXT_KEY_CIV5_HOKATH_ZEPPELIN_TEXT', 'A Zeppelin is a type of rigid airship named after the German inventor who pioneered rigid airship development at the beginning of the 20th century. Zeppelin''s notions were first formulated in 1874 and developed in detail in 1893. Zeppelins were first flown commercially in 1910 by Deutsche Luftschiffahrts-AG (DELAG), the world''s first airline in revenue service. By mid-1914, DELAG had carried over 10,000 fare-paying passengers on over 1,500 flights. During World War I, the German military made extensive use of Zeppelins as bombers and as scouts. Numerous bombing raids on Britain resulted in over 500 deaths.[NEWLINE][NEWLINE]The defeat of Germany in 1918 slowed development, as the Treaty of Versailles, prohibited Germany from building large airships. The ban lifted in 1926 and, during the 1930s, the airships Graf Zeppelin, and the even larger LZ 129 Hindenburg operated regular transatlantic flights from Germany to North America and Brazil. The spire of the Empire State Building was originally designed to serve as a mooring mast for Zeppelins and other airships, although it was found that high winds made that impossible. The Hindenburg disaster in 1937, along with political and economic developments in Germany in the lead-up to World War II, hastened the demise of airships.');

UPDATE Units SET PurchaseCooldown = '1' WHERE Type = 'UNIT_HOKATH_ZEPPELIN';

INSERT INTO Civilization_UnitClassOverrides 
	(CivilizationType, 			UnitClassType, 			UnitType)
VALUES		
	('CIVILIZATION_BARBARIAN',	'UNITCLASS_HOKATH_ZEPPELIN', NULL);

UPDATE Units SET 
RangedCombatLimit = 300, 
NoSupply = 1,
ExtraMaintenanceCost = 2
WHERE Type = 'UNIT_HOKATH_ZEPPELIN';
