--==========================================================================================================================
-- IconTextureAtlases
--==========================================================================================================================
INSERT INTO IconTextureAtlases 
		(Atlas, 				IconSize, 	Filename, 						IconsPerRow, 	IconsPerColumn)
VALUES	('JAR_PHOULKON_ATLAS', 	256, 		'Phoulkon_IconAtlas_256.dds',	1, 				1),
		('JAR_PHOULKON_ATLAS', 	128, 		'Phoulkon_IconAtlas_128.dds',	1, 				1),
		('JAR_PHOULKON_ATLAS', 	80, 		'Phoulkon_IconAtlas_80.dds',	1, 				1),
		('JAR_PHOULKON_ATLAS', 	64, 		'Phoulkon_IconAtlas_64.dds',	1, 				1),
		('JAR_PHOULKON_ATLAS', 	45, 		'Phoulkon_IconAtlas_45.dds',	1, 				1),
		('JAR_PHOULKON_FLAG', 	32, 		'Flag1-32.dds',					1, 				1);
--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
-- ArtDefine_StrategicView
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 			TileType,	Asset)
VALUES	('ART_DEF_UNIT_JAR_PHOULKON',	'Unit', 	'Flag2-SV.dds');
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO ArtDefine_UnitInfos 
		(Type, 							DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JAR_PHOULKON',		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_SPEARMAN';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,					UnitMemberInfoType,						NumMembers)
SELECT	'ART_DEF_UNIT_JAR_PHOULKON', 	'ART_DEF_UNIT_MEMBER_JAR_PHOULKON',		NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_SPEARMAN';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombats
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JAR_PHOULKON',		EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_SPEARMAN';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JAR_PHOULKON',		"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_SPEARMAN';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 														 
		(Type, 									Scale,	ZOffset, Domain, Model, 			 MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JAR_PHOULKON',		Scale,	ZOffset, Domain, 'foederati.fxsxml', MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_SPEARMAN';
--==========================================================================================================================
-- UNITS
--==========================================================================================================================	
-- UnitClasses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitClasses
(Type, Description, DefaultUnit) VALUES
('UNITCLASS_JAR_PHOULKON', 'TXT_KEY_UNIT_JAR_PHOULKON', 'UNIT_JAR_PHOULKON');
--------------------------------------------------------------------------------------------------------------------------	
-- Units
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units 	
		(Type, 					Class, 						PrereqTech,			Combat,	Cost, 	FaithCost, RequiresFaithPurchaseEnabled,	GlobalFaithPurchaseCooldown, PurchaseCooldown, Moves, CombatClass, Domain, DefaultUnitAI, Description, 					Strategy, 								Help, 								Civilopedia, 						MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, GoodyHutUpgradeUnitClass, 	CombatLimit, BaseLandAirDefense, Conscription, XPValueAttack, XPValueDefense, UnitArtInfo, 					UnitFlagAtlas,			UnitFlagIconOffset, IconAtlas,		PortraitIndex, 	MoveRate)
SELECT	'UNIT_JAR_PHOULKON',	'UNITCLASS_JAR_PHOULKON', 'TECH_ENGINEERING',	16, 	110, 	250, 		1, 								GlobalFaithPurchaseCooldown, PurchaseCooldown, Moves, CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_JAR_PHOULKON', 	'TXT_KEY_UNIT_JAR_PHOULKON_STRATEGY',	'TXT_KEY_UNIT_JAR_PHOULKON_HELP',	'TXT_KEY_UNIT_JAR_PHOULKON_TEXT',	MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, 'UNITCLASS_PIKEMAN', 		CombatLimit, BaseLandAirDefense, Conscription, XPValueAttack, XPValueDefense, 'ART_DEF_UNIT_JAR_PHOULKON',	'JAR_PHOULKON_FLAG',	0,					'JAR_PHOULKON_ATLAS',	0, 		MoveRate
FROM Units WHERE Type = 'UNIT_PIKEMAN';

UPDATE Units SET Combat= Combat+3 WHERE Class ='UNITCLASS_PIKEMAN';
UPDATE Units SET Combat= 22 WHERE Class ='UNITCLASS_PIKEMAN' AND Combat>22;
UPDATE Units SET ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type='UNIT_PIKEMAN') WHERE Type='UNIT_JAR_PHOULKON';
UPDATE Units SET ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type='UNIT_PIKEMAN') WHERE Class = 'UNITCLASS_SPEARMAN';
UPDATE Units SET ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type='UNIT_JAR_PHOULKON') WHERE Type='UNIT_SPEARMAN';

CREATE TRIGGER IF NOT EXISTS Jar_Pikeman_Update
AFTER INSERT ON Units WHEN NEW.Class = 'UNITCLASS_PIKEMAN' AND NEW.Type!='UNIT_PIKEMAN'
BEGIN
	UPDATE Units SET Combat= Combat+3 WHERE Type = NEW.Type AND Combat>0;
	UPDATE Units SET Combat= 22 WHERE Type = NEW.Type AND Combat>22;
END;

CREATE TRIGGER IF NOT EXISTS Jar_Spearman_Update
AFTER INSERT ON Units WHEN NEW.Class = 'UNITCLASS_SPEARMAN' AND NEW.Type!='UNIT_SPEARMAN'
BEGIN
	UPDATE Units SET ObsoleteTech = (SELECT PrereqTech FROM Units WHERE Type='UNIT_PIKEMAN') WHERE Type = NEW.Type AND Combat>0;
END;

UPDATE Units SET PrereqTech   = (SELECT PrereqTech FROM Units WHERE Type='UNIT_PIKEMAN'),
				 Cost   	  = (SELECT Cost FROM Units WHERE Type='UNIT_PIKEMAN'),
				 FaithCost    = (SELECT FaithCost FROM Units WHERE Type='UNIT_PIKEMAN')
WHERE Type='UNIT_DANISH_BERSERKER';
--------------------------------------------------------------------------------------------------------------------------
-- UnitGameplay2DScripts
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitGameplay2DScripts
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JAR_PHOULKON', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_PIKEMAN');
--------------------------------------------------------------------------------------------------------------------------
-- Unit_AITypes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_AITypes
		(UnitType, 				UnitAIType)
SELECT	'UNIT_JAR_PHOULKON', 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_PIKEMAN');
--------------------------------------------------------------------------------------------------------------------------
-- Unit_ClassUpgrades
--------------------------------------------------------------------------------------------------------------------------
UPDATE Unit_ClassUpgrades SET UnitClassType	= 'UNITCLASS_JAR_PHOULKON'
WHERE UnitType IN (SELECT Type FROM Units WHERE Class = 'UNITCLASS_SPEARMAN');

CREATE TRIGGER IF NOT EXISTS Jar_Spearman_Update2
AFTER INSERT ON Unit_ClassUpgrades WHEN NEW.UnitClassType = 'UNITCLASS_PIKEMAN' AND NEW.UnitType!='UNIT_JAR_PHOULKON'
BEGIN
	UPDATE Unit_ClassUpgrades SET UnitClassType	= 'UNITCLASS_JAR_PHOULKON' WHERE UnitType = NEW.UnitType;
END;

INSERT INTO Unit_ClassUpgrades 
(UnitType, 				UnitClassType) VALUES
('UNIT_JAR_PHOULKON', 'UNITCLASS_PIKEMAN');
--------------------------------------------------------------------------------------------------------------------------
-- Unit_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Flavors
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_JAR_PHOULKON', 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_PIKEMAN');

UPDATE Unit_Flavors SET Flavor = 6 WHERE (FlavorType = 'FLAVOR_OFFENSE' AND UnitType = 'UNIT_PIKEMAN');
--------------------------------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_FreePromotions
		(UnitType, 				PromotionType)
SELECT	'UNIT_JAR_PHOULKON', 	PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_SPEARMAN');
--==========================================================================================================================
-- Language_en_US
--==========================================================================================================================
UPDATE Language_en_US SET Text = REPLACE(Text, 'The Pikeman is a more powerful Spearman.', 'The Pikeman upgrades from the Phoulkon.')
WHERE Tag = 'TXT_KEY_UNIT_PIKEMAN_STRATEGY';

INSERT OR REPLACE INTO Language_en_US 
(Tag, Text) VALUES
('TXT_KEY_UNIT_JAR_PHOULKON', 'Phoulkon'),
('TXT_KEY_UNIT_JAR_PHOULKON_STRATEGY', 'Strongest Classical era Melee unit. It has a combat bonus against cavalry units.'),	
('TXT_KEY_UNIT_JAR_PHOULKON_HELP', 'Late Classical era unit that upgrades from the Spearman. Starts with [COLOR_POSITIVE_TEXT]Formation I[ENDCOLOR] promotion.'),	
('TXT_KEY_UNIT_JAR_PHOULKON_TEXT', 'The Phoulkon, also known as the "Fulcum" in Latin, was a formation employed by the Roman military during the late Roman and early Byzantine periods. This tactical unit was characterized by its dense, rectangular arrangement of heavily armored infantrymen, primarily wielding long spears or pikes, shields, and various melee weapons. The term "Phoulkon" itself signifies a "phalanx" or a "bulwark", reflecting its function as a formidable defensive formation designed to withstand enemy charges and create an impregnable wall of shields and spears. The soldiers in the Phoulkon were highly disciplined and trained to maintain their formation under intense pressure, which made them effective in both offensive and defensive maneuvers. [NEWLINE][NEWLINE]The Phoulkon infantry played a crucial role in Byzantine military strategy, especially during periods when the empire faced numerous threats from both eastern and western adversaries. The use of this formation allowed Byzantine forces to hold ground against larger or more mobile enemy units, often buying time for cavalry or other forces to flank the enemy. Additionally, the Phoulkon''s adaptability in various terrains and its ability to integrate with other military units, such as archers and cavalry, enhanced its effectiveness on the battlefield. This strategic flexibility was a key factor in the Byzantine Empire''s ability to survive and adapt through centuries of warfare and shifting geopolitical landscapes.');
--==========================================================================================================================
--==========================================================================================================================
