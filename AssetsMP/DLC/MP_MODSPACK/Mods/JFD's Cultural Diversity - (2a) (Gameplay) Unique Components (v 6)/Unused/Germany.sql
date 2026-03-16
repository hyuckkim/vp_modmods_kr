--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT OR REPLACE INTO ArtDefine_StrategicView 
			(StrategicViewType, 			TileType,	Asset)
VALUES		('ART_DEF_UNIT_JFD_WEHRMACHT', 	'Unit', 	'sv_wehrmacht.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------	
INSERT INTO ArtDefine_UnitInfos 
			(Type,								DamageStates, Formation)
SELECT		('ART_DEF_UNIT_JFD_WEHRMACHT'),		DamageStates, Formation
FROM "ArtDefine_UnitInfos" WHERE (Type = 'ART_DEF_UNIT_INFANTRY');
------------------------------
-- ArtDefine_UnitInfos
------------------------------	
INSERT INTO ArtDefine_UnitInfoMemberInfos 
			(UnitInfoType,						UnitMemberInfoType,						NumMembers)
SELECT		('ART_DEF_UNIT_JFD_WEHRMACHT'),		('ART_DEF_UNIT_MEMBER_JFD_WEHRMACHT'),	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_INFANTRY');
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------	
INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_WEHRMACHT'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_INFANTRY');
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------	
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_WEHRMACHT'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_INFANTRY');
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------	
INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 									Scale, ZOffset, Domain, Model, 						MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_WEHRMACHT'),	Scale, ZOffset, Domain, ('Infantry_German.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_INFANTRY');
--==========================================================================================================================

/*
DELETE FROM Civilization_UnitClassOverrides WHERE CivilizationType = 'CIVILIZATION_GERMANY' AND UnitType = 'UNIT_GERMAN_LANDSKNECHT';

UPDATE Units SET MinorCivGift = 1 WHERE Type = 'UNIT_GERMAN_LANDSKNECHT';

INSERT INTO Civilization_UnitClassOverrides
	(CivilizationType, UnitClassType, UnitType)
VALUES
	('CIVILIZATION_GERMANY', 'UNITCLASS_INFANTRY', 'UNIT_CD_WEHRMACHT');
*/

UPDATE Units SET
Combat = Combat + 4,
BaseLandAirDefense = BaseLandAirDefense + 2,
MinorCivGift = 1
WHERE Type = 'UNIT_CD_WEHRMACHT';

INSERT INTO Unit_FreePromotions
	(UnitType, PromotionType)
VALUES
	('UNIT_CD_WEHRMACHT', 'PROMOTION_CD_PANZER'),
	('UNIT_CD_WEHRMACHT', 'PROMOTION_BLITZ');

/*
INSERT INTO Unit_ResourceQuantityRequirements
   (UnitType,  ResourceType)
VALUES		
    ('UNIT_CD_WEHRMACHT',  'RESOURCE_IRON');
*/

/*
UPDATE Language_en_US SET
Text = 'Unique German Infantry. Starts with the [COLOR_POSITIVE_TEXT]Blitz[ENDCOLOR] and [COLOR_POSITIVE_TEXT]Panzer Tactics[ENDCOLOR] Promotions, allowing multiple Attacks per turn and greatly increased [ICON_STRENGTH] Combat Strength for every adjacent Armored Unit, that is: Landships, Tanks, and Modern Armor.'
WHERE Tag = 'TXT_KEY_UNIT_CD_WEHRMACHT_HELP';
*/


		<!--- german replacement for landsknecht --->
		<Row>
			<Type>UNIT_CD_WEHRMACHT</Type>
			<Class>UNITCLASS_INFANTRY</Class>
			<Description>TXT_KEY_UNIT_CD_WEHRMACHT</Description>
			<Civilopedia>TXT_KEY_UNIT_CD_WEHRMACHT_TEXT</Civilopedia>
			<Strategy>TXT_KEY_UNIT_CD_WEHRMACHT_STRATEGY</Strategy>
			<Help>TXT_KEY_UNIT_CD_WEHRMACHT_HELP</Help>
			<UnitArtInfo>ART_DEF_UNIT_JFD_WEHRMACHT</UnitArtInfo>
			<UnitFlagAtlas>CD_FLAG_ATLAS</UnitFlagAtlas>
			<UnitFlagIconOffset>54</UnitFlagIconOffset>
			<IconAtlas>CD_MILITARY_ATLAS</IconAtlas>
			<PortraitIndex>54</PortraitIndex>
		</Row>
		<Row Tag="TXT_KEY_UNIT_CD_WEHRMACHT">
			<Text>Wehrmacht</Text>
		</Row>
		<Row Tag="TXT_KEY_UNIT_CD_WEHRMACHT_TEXT">
			<Text>After the Nazi rise to power in 1933, one of Adolf Hitler's most overt and bellicose moves was to establish the Wehrmacht, a modern offensively-capable armed force, fulfilling the Nazi regime's long-term goals of regaining lost territory as well as gaining new territory and dominating its neighbours. The army itself was called the Heer. While 90% of the infantry were foot-borne, motorized formations played a highly visible role, with tanks were used to break through enemy lines, isolating regiments from the main force so that the infantry behind the tanks could quickly kill or capture the enemy troops.</Text>
		</Row>
		<Row Tag="TXT_KEY_UNIT_CD_WEHRMACHT_HELP">
			<Text></Text>
		</Row>
		<Row Tag="TXT_KEY_UNIT_CD_WEHRMACHT_STRATEGY">
			<Text>This Infantry replacement starts with Blitz, allowing you to throw them against the frontline, allowing you to break through defensive lines at the cost of HP. However their real strength is that their combat strength can be boosted through the roof with the proper positioning of Armor Units, allowing incredible victories with overwhelming and sudden force.</Text>
		</Row>

