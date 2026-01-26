
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 				UnitClassType, 		 	UnitType)
VALUES		('CIVILIZATION_BARBARIAN', 	'UNITCLASS_CARAVEL',	'UNIT_BARBARIAN_PIRATE'),
            ('CIVILIZATION_BARBARIAN', 	'UNITCLASS_PRIVATEER',	null);

--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_StrategicView
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 						TileType,	Asset)
VALUES	('ART_DEF_UNIT_SMAN_DOB_BREZEL_KOURSEREZH',	'Unit', 	'sv_corsair.dds');
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO ArtDefine_UnitInfos 
		(Type, 										DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_SMAN_DOB_BREZEL_KOURSEREZH',	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_PRIVATEER';	
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,								UnitMemberInfoType,								NumMembers)
SELECT	'ART_DEF_UNIT_SMAN_DOB_BREZEL_KOURSEREZH', 	'ART_DEF_UNIT_MEMBER_DOB_BREZEL_KOURSEREZH',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_PRIVATEER';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombats
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,								EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_DOB_BREZEL_KOURSEREZH',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_PRIVATEER';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,								"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_DOB_BREZEL_KOURSEREZH',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_PRIVATEER';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 											Scale,	ZOffset, Domain, Model,							MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_DOB_BREZEL_KOURSEREZH',	0.12,	ZOffset, Domain, 'corsair.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_PRIVATEER';


INSERT INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn) VALUES
('PIRATE_FLAG_ATLAS',    32, 'Flag_Pirate.dds',	1, 1);	
--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units 	
		(Type, 				            Class,           CombatClass, PrereqTech, Cost,	Combat, FaithCost, RequiresFaithPurchaseEnabled, Moves, BaseSightRange, Special, Domain, DefaultUnitAI,	Description, 								Help, 											Strategy, 					Civilopedia, 				                ShowInPedia,	Pillage, MilitarySupport, MilitaryProduction,	Mechanized,	IgnoreBuildingDefense, HurryCostModifier,	AdvancedStartCost,	MinAreaSize,	CombatLimit, ObsoleteTech,		        XPValueAttack,	XPValueDefense, Conscription,	PurchaseCooldown,	 UnitArtInfo, 								UnitFlagAtlas, 	UnitFlagIconOffset, IconAtlas,				PortraitIndex,	MoveRate, UnitEraUpgrade)
SELECT	'UNIT_BARBARIAN_PIRATE',	'UNITCLASS_CARAVEL', CombatClass, PrereqTech, Cost,	Combat, FaithCost, RequiresFaithPurchaseEnabled, Moves, BaseSightRange, Special, Domain, DefaultUnitAI,	'TXT_KEY_UNIT_BARBARIAN_PIRATE',	'TXT_KEY_UNIT_BARBARIAN_PIRATE_HELP',	'TXT_KEY_UNIT_BARBARIAN_PIRATE_STRATEGY',	'TXT_KEY_CIV5_BARBARIAN_PIRATE_TEXT',		ShowInPedia,	Pillage, MilitarySupport, MilitaryProduction,	Mechanized,	IgnoreBuildingDefense, HurryCostModifier,	AdvancedStartCost,	MinAreaSize,	CombatLimit, 'TECH_INDUSTRIALIZATION',	XPValueAttack,	XPValueDefense, Conscription,	PurchaseCooldown,	 'ART_DEF_UNIT_SMAN_DOB_BREZEL_KOURSEREZH',	'PIRATE_FLAG_ATLAS',	0,		'MA_STEAMFRIGATE_ATLAS',	3,				MoveRate, 1
FROM Units WHERE Type = 'UNIT_CARAVEL'; 



INSERT INTO Unit_EraCombatStrength 	
		(UnitType, 					EraType, CombatStrength)
VALUES	 ('UNIT_BARBARIAN_PIRATE', 		'ERA_RENAISSANCE', 35),
	     ('UNIT_BARBARIAN_PIRATE', 		'ERA_INDUSTRIAL', 45);

--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 							SelectionSound, FirstSelectionSound)
SELECT	'UNIT_BARBARIAN_PIRATE',	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_CARAVEL';
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================
INSERT INTO Unit_AITypes 	
		(UnitType, 							UnitAIType)
SELECT	'UNIT_BARBARIAN_PIRATE',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_CARAVEL';
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors 	
		(UnitType,							FlavorType, Flavor)
SELECT	'UNIT_BARBARIAN_PIRATE',	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_CARAVEL';

--==========================================================================================================================	
-- UnitPromotions
--==========================================================================================================================
INSERT INTO UnitPromotions
		(Type, 								Description,		 IgnoreZOC,      			Help,	  VisibilityChange,  CannotBeChosen,	CannotBeCaptured, LostWithUpgrade,	PortraitIndex,	IconAtlas, 			PediaType, 				PediaEntry, FlagPromoOrder,	OrderPriority)
SELECT	'PROMOTION_PIRATE_PADREXIX', 		'TXT_KEY_PIRATE_X',		 1,        'TXT_KEY_PIRATE', 	     1,                        1,          1,                  1, 		            19, 	'PROMOTION_ATLAS_VP_06', 	'PEDIA_NAVAL',		'TXT_KEY_PIRATE_X', 506, 506;

INSERT INTO UnitPromotions_Features
	(PromotionType, FeatureType, IgnoreTerrainCostIn)
VALUES
    ('PROMOTION_PIRATE_PADREXIX', 'FEATURE_SHOALS', 1);

INSERT INTO Unit_FreePromotions
		(UnitType,								PromotionType)
VALUES	  ('UNIT_BARBARIAN_PIRATE',		'PROMOTION_PRIZE_SHIPS'),
         ('UNIT_BARBARIAN_PIRATE',		'PROMOTION_BOARDING_PARTY_1'),
		('UNIT_BARBARIAN_PIRATE',		'PROMOTION_PIRATE_PADREXIX'),
		('UNIT_BARBARIAN_PIRATE',		'PROMOTION_COMMERCE_RAIDER');

INSERT INTO Unit_FreePromotions
		(UnitType, 				PromotionType)
VALUES	('UNIT_BARBARIAN_PIRATE',  'PROMOTION_SCURVY_IMMUNITY');
		
INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_UNIT_BARBARIAN_PIRATE', 'Corsair Pirate'),
('TXT_KEY_CIV5_BARBARIAN_PIRATE_TEXT', 'The Corsair Pirate is naval melee unit.[NEWLINE][NEWLINE]The Barbary pirates, sometimes called Barbary corsairs or Ottoman corsairs, 
were pirates and privateers who operated from North Africa, based primarily in the ports of Sale, Rabat, Algiers, Tunis, and Tripoli. This area was known in Europe as the Barbary Coast, 
a term derived from the name of its Berber inhabitants. Their predation extended throughout the Mediterranean, south along West Africa''s Atlantic seaboard and even South America, and into the North Atlantic as far north as Iceland, but they primarily operated in the western Mediterranean. In addition to seizing ships, they engaged in Razzias, raids on European coastal towns and villages, mainly in Italy, France, Spain, and Portugal, but also in the British Isles, the Netherlands, and as far away as Iceland. The main purpose of their attacks was to capture Christian slaves for the Ottoman slave trade as well as the general Muslim slavery market in North Africa and the Middle East.[NEWLINE][NEWLINE]While such raids had occurred since soon after the Muslim conquest of Iberia, the terms Barbary pirates and Barbary corsairs
 are normally applied to the raiders active from the 16th century onwards, when the frequency and range of the slavers'' attacks increased. 
 In that period Algiers, Tunis and Tripoli came under the sovereignty of the Ottoman Empire, either as directly administered provinces or as autonomous dependencies known as the Barbary States. 
 Similar raids were undertaken from Sale and other ports in Morocco.[NEWLINE][NEWLINE]Corsairs captured thousands of ships and repeatedly raided coastal towns. 
 As a result, residents abandoned their former villages of long stretches of coast in Spain and Italy. The raids were such a problem coastal settlements were seldom undertaken until the 19th century. 
 Between 1580 and 1680 corsairs captured about 850,000 people as slaves and from 1530 to 1780 as many as 1,250,000 people were enslaved. Some corsairs were European outcasts and converts such as John Ward and Zymen Danseker. 
 Hayreddin Barbarossa and Oruc Reis, Turkish Barbarossa Brothers, who took control of Algiers on behalf of the Ottomans in the early 16th century, were also notorious corsairs. 
 The European pirates brought advanced sailing and shipbuilding techniques to the Barbary Coast around 1600, which enabled the corsairs to extend their activities into the Atlantic Ocean. 
 The effects of the Barbary raids peaked in the early to mid-17th century.[NEWLINE][NEWLINE]The scope of corsair activity began to diminish in the latter part of the 17th century, as the more powerful 
 European navies started to compel the Barbary States to make peace and cease attacking their shipping. However, the ships and coasts of Christian states without such effective protection continued to suffer until the early 
 19th century. Following the Napoleonic Wars and the Congress of Vienna in 1814 to 1815, European powers agreed upon the need to suppress the Barbary corsairs entirely and the threat was largely subdued. 
Occasional incidents occurred, including two Barbary wars between the United States and the Barbary States, until finally terminated by the French conquest of Algiers in 1830.'),
('TXT_KEY_UNIT_BARBARIAN_PIRATE_STRATEGY', 'Use the Corsair Pirate to spread fear and terror upon the oceans near and far.'),
('TXT_KEY_UNIT_BARBARIAN_PIRATE_HELP', ''),
('TXT_KEY_PIRATE_X', 'Tortuga'),
('TXT_KEY_PIRATE', 'Ignores [COLOR_POSITIVE_TEXT]Zone of Control[ENDCOLOR].[NEWLINE]Ignore Terrain Cost in [COLOR_POSITIVE_TEXT]Shoal[ENDCOLOR].[NEWLINE]+1 Sight.');