--==========================================================================================================================
-- CUSTOM MOD OPTIONS
--==========================================================================================================================
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_UNIT_CREATED';
--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
		(Type, 							Description, 								Civilopedia, 								CivilopediaTag, 						ArtDefineTag, 							IconAtlas, 				PortraitIndex)
VALUES	('LEADER_GW_FRANCE_PHILIPPE', 	'TXT_KEY_LEADER_GW_FRANCE_PHILIPPE_DESC', 	'TXT_KEY_LEADER_GW_FRANCE_PHILIPPE_PEDIA',	'TXT_KEY_LEADER_GW_FRANCE_PHILIPPE', 	'GW_France_Philippe_Leaderscene.xml',	'GW_FRANCE_ATLAS',		1);

UPDATE Leaders
SET PrimaryVictoryPursuit = 'VICTORY_PURSUIT_CULTURE',
SecondaryVictoryPursuit = 'VICTORY_PURSUIT_DOMINATION',
VictoryCompetitiveness = 7,
WonderCompetitiveness = 9,
MinorCivCompetitiveness = 5,
Boldness = 8,
DiploBalance = 7,
WarmongerHate = 3,
DoFWillingness = 8,
DenounceWillingness = 6,
WorkWithWillingness = 8,
WorkAgainstWillingness = 6,
Loyalty = 3,
Forgiveness = 8,
Neediness = 5,
Meanness = 6,
Chattiness = 4
WHERE Type = 'LEADER_GW_FRANCE_PHILIPPE';
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 							MajorCivApproachType, 			Bias)
VALUES	('LEADER_GW_FRANCE_PHILIPPE', 		'MAJOR_CIV_APPROACH_WAR', 			7),
		('LEADER_GW_FRANCE_PHILIPPE', 		'MAJOR_CIV_APPROACH_HOSTILE', 		4),
		('LEADER_GW_FRANCE_PHILIPPE', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	8),
		('LEADER_GW_FRANCE_PHILIPPE', 		'MAJOR_CIV_APPROACH_GUARDED', 		4),
		('LEADER_GW_FRANCE_PHILIPPE', 		'MAJOR_CIV_APPROACH_AFRAID', 		3),
		('LEADER_GW_FRANCE_PHILIPPE', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		8),
		('LEADER_GW_FRANCE_PHILIPPE', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
--==========================================================================================================================	
-- Leader_MinorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 						MinorCivApproachType, 			Bias)
VALUES	('LEADER_GW_FRANCE_PHILIPPE', 	'MINOR_CIV_APPROACH_IGNORE', 		5),
		('LEADER_GW_FRANCE_PHILIPPE', 	'MINOR_CIV_APPROACH_FRIENDLY', 		-1),
		('LEADER_GW_FRANCE_PHILIPPE', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	5),
		('LEADER_GW_FRANCE_PHILIPPE', 	'MINOR_CIV_APPROACH_CONQUEST', 		7),
		('LEADER_GW_FRANCE_PHILIPPE', 	'MINOR_CIV_APPROACH_BULLY', 		7);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
		(LeaderType, 						FlavorType, 						Flavor)
VALUES	('LEADER_GW_FRANCE_PHILIPPE', 		'FLAVOR_AIR', 						6),
		('LEADER_GW_FRANCE_PHILIPPE', 		'FLAVOR_AIR_CARRIER', 				6),
		('LEADER_GW_FRANCE_PHILIPPE', 		'FLAVOR_AIRLIFT', 					6),
		('LEADER_GW_FRANCE_PHILIPPE', 		'FLAVOR_ANTIAIR', 					5),
		('LEADER_GW_FRANCE_PHILIPPE', 		'FLAVOR_ARCHAEOLOGY', 				8),
		('LEADER_GW_FRANCE_PHILIPPE', 		'FLAVOR_CITY_DEFENSE', 				6),
		('LEADER_GW_FRANCE_PHILIPPE', 		'FLAVOR_CULTURE', 					10),		
		('LEADER_GW_FRANCE_PHILIPPE', 		'FLAVOR_DEFENSE', 					7),		
		('LEADER_GW_FRANCE_PHILIPPE', 		'FLAVOR_DIPLOMACY', 				7),		
		('LEADER_GW_FRANCE_PHILIPPE', 		'FLAVOR_ESPIONAGE', 				6),		
		('LEADER_GW_FRANCE_PHILIPPE', 		'FLAVOR_EXPANSION', 				8),
		('LEADER_GW_FRANCE_PHILIPPE', 		'FLAVOR_GOLD', 						5),		
		('LEADER_GW_FRANCE_PHILIPPE', 		'FLAVOR_GREAT_PEOPLE', 				10),		
		('LEADER_GW_FRANCE_PHILIPPE', 		'FLAVOR_GROWTH', 					8),
		('LEADER_GW_FRANCE_PHILIPPE', 		'FLAVOR_HAPPINESS', 				7),		
		('LEADER_GW_FRANCE_PHILIPPE', 		'FLAVOR_I_LAND_TRADE_ROUTE', 		7),		
		('LEADER_GW_FRANCE_PHILIPPE', 		'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_GW_FRANCE_PHILIPPE', 		'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_GW_FRANCE_PHILIPPE', 		'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_GW_FRANCE_PHILIPPE', 		'FLAVOR_INFRASTRUCTURE', 			8),
		('LEADER_GW_FRANCE_PHILIPPE', 		'FLAVOR_MILITARY_TRAINING', 		8),
		('LEADER_GW_FRANCE_PHILIPPE', 		'FLAVOR_MOBILE', 					7),
		('LEADER_GW_FRANCE_PHILIPPE', 		'FLAVOR_NAVAL', 					4),
		('LEADER_GW_FRANCE_PHILIPPE', 		'FLAVOR_NAVAL_GROWTH', 				6),
		('LEADER_GW_FRANCE_PHILIPPE', 		'FLAVOR_NAVAL_RECON', 				7),		
		('LEADER_GW_FRANCE_PHILIPPE', 		'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	6),		
		('LEADER_GW_FRANCE_PHILIPPE', 		'FLAVOR_NUKE', 						4),
		('LEADER_GW_FRANCE_PHILIPPE', 		'FLAVOR_OFFENSE', 					7),		
		('LEADER_GW_FRANCE_PHILIPPE', 		'FLAVOR_PRODUCTION', 				8),		
		('LEADER_GW_FRANCE_PHILIPPE', 		'FLAVOR_RANGED', 					8),
		('LEADER_GW_FRANCE_PHILIPPE', 		'FLAVOR_RECON', 					7),		
		('LEADER_GW_FRANCE_PHILIPPE', 		'FLAVOR_RELIGION', 					6),
		('LEADER_GW_FRANCE_PHILIPPE', 		'FLAVOR_SCIENCE', 					8),
		('LEADER_GW_FRANCE_PHILIPPE', 		'FLAVOR_SPACESHIP', 				6),	
		('LEADER_GW_FRANCE_PHILIPPE', 		'FLAVOR_TILE_IMPROVEMENT', 			8),
		('LEADER_GW_FRANCE_PHILIPPE', 		'FLAVOR_USE_NUKE', 					4),
		('LEADER_GW_FRANCE_PHILIPPE', 		'FLAVOR_WATER_CONNECTION', 			5),
		('LEADER_GW_FRANCE_PHILIPPE', 		'FLAVOR_WONDER', 					8);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================						
INSERT INTO Leader_Traits
		(LeaderType, 					TraitType)
VALUES	('LEADER_GW_FRANCE_PHILIPPE', 	'TRAIT_GW_FRANCE_HOMME_PROVIDENTIEL');
--==========================================================================================================================	
-- Diplomacy_Responses
--==========================================================================================================================	
INSERT INTO Diplomacy_Responses
		(LeaderType, 					ResponseType, 							 Response, 															Bias)
VALUES 	('LEADER_GW_FRANCE_PHILIPPE',	'RESPONSE_AI_DOF_BACKSTAB', 			 'TXT_KEY_LEADER_GW_FRANCE_PHILIPPE_DENOUNCE_FRIEND%', 				500),
		('LEADER_GW_FRANCE_PHILIPPE',	'RESPONSE_ATTACKED_HOSTILE', 			 'TXT_KEY_LEADER_GW_FRANCE_PHILIPPE_ATTACKED_HOSTILE%', 			500),
		('LEADER_GW_FRANCE_PHILIPPE',	'RESPONSE_DEFEATED', 					 'TXT_KEY_LEADER_GW_FRANCE_PHILIPPE_DEFEATED%', 					500),
		('LEADER_GW_FRANCE_PHILIPPE',	'RESPONSE_DOW_GENERIC', 				 'TXT_KEY_LEADER_GW_FRANCE_PHILIPPE_DOW_GENERIC%', 					500),
		('LEADER_GW_FRANCE_PHILIPPE',	'RESPONSE_FIRST_GREETING', 				 'TXT_KEY_LEADER_GW_FRANCE_PHILIPPE_FIRSTGREETING%', 				500),
		('LEADER_GW_FRANCE_PHILIPPE',	'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',  'TXT_KEY_LEADER_GW_FRANCE_PHILIPPE_RESPONSE_TO_BEING_DENOUNCED%',	500),
		('LEADER_GW_FRANCE_PHILIPPE',	'RESPONSE_WORK_AGAINST_SOMEONE', 		 'TXT_KEY_LEADER_GW_FRANCE_PHILIPPE_DENOUNCE%', 					500),
		('LEADER_GW_FRANCE_PHILIPPE',	'RESPONSE_WORK_WITH_US', 				 'TXT_KEY_LEADER_GW_FRANCE_PHILIPPE_DEC_FRIENDSHIP%', 				500);
--==========================================================================================================================	
-- Traits
--==========================================================================================================================
INSERT INTO Traits 
		(Type, 									Description, 									ShortDescription)					
VALUES	('TRAIT_GW_FRANCE_HOMME_PROVIDENTIEL', 	'TXT_KEY_TRAIT_GW_FRANCE_HOMME_PROVIDENTIEL', 	'TXT_KEY_TRAIT_GW_FRANCE_HOMME_PROVIDENTIEL_SHORT');	
--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================	
INSERT INTO Civilizations 	
		(Type, 						Description, 	ShortDescription, 	Adjective, 	CivilopediaTag,	DefaultPlayerColor, 		ArtDefineTag, ArtStyleType,	ArtStyleSuffix, ArtStylePrefix, IconAtlas, 			PortraitIndex, 	AlphaIconAtlas, 			SoundtrackTag, 	MapImage, 						DawnOfManQuote, 								DawnOfManImage)
SELECT	'CIVILIZATION_GW_FRANCE', 	Description, 	ShortDescription,	Adjective, 	CivilopediaTag, 'PLAYERCOLOR_GW_FRANCE', 	ArtDefineTag, ArtStyleType,	ArtStyleSuffix,	ArtStylePrefix,	'GW_FRANCE_ATLAS', 	0, 				'GW_FRANCE_ALPHA_ATLAS', 	'FRANCE', 		'GW_France_Philippe_Map.dds', 	'TXT_KEY_CIV5_DAWN_GW_FRANCE_PHILIPPE_TEXT', 	'GW_France_Philippe_DOM.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_FRANCE';

UPDATE Civilizations SET AIPlayable = 0, Playable = 0 WHERE Type = 'CIVILIZATION_FRANCE';
--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================			
INSERT INTO Civilization_CityNames 
		(CivilizationType, 			 CityName)
VALUES	('CIVILIZATION_GW_FRANCE', 	'TXT_KEY_CITY_NAME_GW_FRANCE_01'),
		('CIVILIZATION_GW_FRANCE', 	'TXT_KEY_CITY_NAME_GW_FRANCE_02'),
		('CIVILIZATION_GW_FRANCE', 	'TXT_KEY_CITY_NAME_GW_FRANCE_03'),
		('CIVILIZATION_GW_FRANCE', 	'TXT_KEY_CITY_NAME_GW_FRANCE_04'),
		('CIVILIZATION_GW_FRANCE', 	'TXT_KEY_CITY_NAME_GW_FRANCE_05'),
		('CIVILIZATION_GW_FRANCE', 	'TXT_KEY_CITY_NAME_GW_FRANCE_06'),
		('CIVILIZATION_GW_FRANCE', 	'TXT_KEY_CITY_NAME_GW_FRANCE_07'),
		('CIVILIZATION_GW_FRANCE', 	'TXT_KEY_CITY_NAME_GW_FRANCE_08'),
		('CIVILIZATION_GW_FRANCE', 	'TXT_KEY_CITY_NAME_GW_FRANCE_09'),
		('CIVILIZATION_GW_FRANCE', 	'TXT_KEY_CITY_NAME_GW_FRANCE_10'),
		('CIVILIZATION_GW_FRANCE', 	'TXT_KEY_CITY_NAME_GW_FRANCE_11'),
		('CIVILIZATION_GW_FRANCE', 	'TXT_KEY_CITY_NAME_GW_FRANCE_12'),
		('CIVILIZATION_GW_FRANCE', 	'TXT_KEY_CITY_NAME_GW_FRANCE_13'),
		('CIVILIZATION_GW_FRANCE', 	'TXT_KEY_CITY_NAME_GW_FRANCE_14'),
		('CIVILIZATION_GW_FRANCE', 	'TXT_KEY_CITY_NAME_GW_FRANCE_15'),
		('CIVILIZATION_GW_FRANCE', 	'TXT_KEY_CITY_NAME_GW_FRANCE_16'),
		('CIVILIZATION_GW_FRANCE', 	'TXT_KEY_CITY_NAME_GW_FRANCE_17'),
		('CIVILIZATION_GW_FRANCE', 	'TXT_KEY_CITY_NAME_GW_FRANCE_18'),
		('CIVILIZATION_GW_FRANCE', 	'TXT_KEY_CITY_NAME_GW_FRANCE_19'),
		('CIVILIZATION_GW_FRANCE', 	'TXT_KEY_CITY_NAME_GW_FRANCE_20'),
		('CIVILIZATION_GW_FRANCE', 	'TXT_KEY_CITY_NAME_GW_FRANCE_21'),
		('CIVILIZATION_GW_FRANCE', 	'TXT_KEY_CITY_NAME_GW_FRANCE_22'),
		('CIVILIZATION_GW_FRANCE', 	'TXT_KEY_CITY_NAME_GW_FRANCE_23'),
		('CIVILIZATION_GW_FRANCE', 	'TXT_KEY_CITY_NAME_GW_FRANCE_24'),
		('CIVILIZATION_GW_FRANCE', 	'TXT_KEY_CITY_NAME_GW_FRANCE_25'),
		('CIVILIZATION_GW_FRANCE', 	'TXT_KEY_CITY_NAME_GW_FRANCE_26'),
		('CIVILIZATION_GW_FRANCE', 	'TXT_KEY_CITY_NAME_GW_FRANCE_27'),
		('CIVILIZATION_GW_FRANCE', 	'TXT_KEY_CITY_NAME_GW_FRANCE_28'),
		('CIVILIZATION_GW_FRANCE', 	'TXT_KEY_CITY_NAME_GW_FRANCE_29'),
		('CIVILIZATION_GW_FRANCE', 	'TXT_KEY_CITY_NAME_GW_FRANCE_30');
--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 			BuildingClassType)
SELECT	'CIVILIZATION_GW_FRANCE', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_FRANCE';
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 			TechType)
SELECT		'CIVILIZATION_GW_FRANCE', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_FRANCE';
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 			UnitClassType, Count, UnitAIType)
SELECT		'CIVILIZATION_GW_FRANCE', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_FRANCE';	
--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================			
INSERT INTO Civilization_Leaders 
			(CivilizationType, 			LeaderheadType)
VALUES		('CIVILIZATION_GW_FRANCE', 	'LEADER_GW_FRANCE_PHILIPPE');
--==========================================================================================================================	
-- Civilization_UnitClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType,			UnitClassType,		UnitType)
VALUES	('CIVILIZATION_GW_FRANCE',	'UNITCLASS_KNIGHT',	'UNIT_GW_FRANCE_CHEVALIER'),
		('CIVILIZATION_GW_FRANCE',	'UNITCLASS_CANNON',	'UNIT_GW_FRANCE_CANNON_GRIBEAUVAL');
--==========================================================================================================================	
-- Civilization_BuildingClassOverrides
--==========================================================================================================================		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 			BuildingClassType, 				BuildingType)
VALUES	('CIVILIZATION_GW_FRANCE', 	'BUILDINGCLASS_PUBLIC_SCHOOL',	'BUILDING_FRANCE_GRANDE_ECOLE');
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions 
			(CivilizationType, 			ReligionType)
SELECT		'CIVILIZATION_GW_FRANCE', 	ReligionType
FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_FRANCE';
--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================		
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 				SpyName)
VALUES		('CIVILIZATION_GW_FRANCE', 	'TXT_KEY_SPY_NAME_GW_FRANCE_0'),	
			('CIVILIZATION_GW_FRANCE', 	'TXT_KEY_SPY_NAME_GW_FRANCE_1'),
			('CIVILIZATION_GW_FRANCE', 	'TXT_KEY_SPY_NAME_GW_FRANCE_2'),
			('CIVILIZATION_GW_FRANCE', 	'TXT_KEY_SPY_NAME_GW_FRANCE_3'),
			('CIVILIZATION_GW_FRANCE', 	'TXT_KEY_SPY_NAME_GW_FRANCE_4'),
			('CIVILIZATION_GW_FRANCE', 	'TXT_KEY_SPY_NAME_GW_FRANCE_5'),
			('CIVILIZATION_GW_FRANCE', 	'TXT_KEY_SPY_NAME_GW_FRANCE_6'),
			('CIVILIZATION_GW_FRANCE', 	'TXT_KEY_SPY_NAME_GW_FRANCE_7'),
			('CIVILIZATION_GW_FRANCE', 	'TXT_KEY_SPY_NAME_GW_FRANCE_8'),
			('CIVILIZATION_GW_FRANCE', 	'TXT_KEY_SPY_NAME_GW_FRANCE_9');
--==========================================================================================================================
-- UnitPromotions
--==========================================================================================================================
INSERT INTO UnitPromotions
		(Type,								CannotBeChosen, LostWithUpgrade,	PortraitIndex,	PromotionDuration,	CombatPercent,	FriendlyHealChange,	MaxHitPointsChange,	GiveCombatMod,	GiveDomain,		IsNearbyPromotion,	NearbyRange,	IconAtlas,						PediaType,				PediaEntry,									Description,								Help,											Sound)
VALUES	('PROMOTION_GW_FRANCE_MONTJOIE',	1,			    0,					0,				10,					20,				5,					10,					0,				NULL,			0,					0,				'GW_FRANCE_PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',		'TXT_KEY_PROMOTION_GW_FRANCE_MONTJOIE',		'TXT_KEY_PROMOTION_GW_FRANCE_MONTJOIE',		'TXT_KEY_PROMOTION_GW_FRANCE_MONTJOIE_HELP',	'AS2D_IF_LEVELUP'),
		('PROMOTION_GW_FRANCE_JOUTE',		1,			    1,					1,				0,					0,				0,					0,					0,				NULL,			0,					0,				'GW_FRANCE_PROMOTION_ATLAS',	'PEDIA_MOUNTED',		'TXT_KEY_PROMOTION_GW_FRANCE_JOUTE',		'TXT_KEY_PROMOTION_GW_FRANCE_JOUTE',		'TXT_KEY_PROMOTION_GW_FRANCE_JOUTE_HELP',		'AS2D_IF_LEVELUP'),
		('PROMOTION_GW_FRANCE_OST',			1,			    1,					2,				0,					0,				0,					0,					10,				'DOMAIN_LAND', 	1,					2,				'GW_FRANCE_PROMOTION_ATLAS',	'PEDIA_MOUNTED',		'TXT_KEY_PROMOTION_GW_FRANCE_OST',			'TXT_KEY_PROMOTION_GW_FRANCE_OST',			'TXT_KEY_PROMOTION_GW_FRANCE_OST_HELP',			'AS2D_IF_LEVELUP');

INSERT INTO UnitPromotions
		(Type,								CannotBeChosen, MultiAttackBonus,	PortraitIndex,	IconAtlas,						PediaType,		PediaEntry,										Description,								Help,	Sound)
SELECT	'PROMOTION_GW_FRANCE_FEU_NOURRI',	CannotBeChosen,	MultiAttackBonus,	3,				'GW_FRANCE_PROMOTION_ATLAS',	'PEDIA_RANGED',	'TXT_KEY_PROMOTION_GW_FRANCE_FEU_NOURRI',		'TXT_KEY_PROMOTION_GW_FRANCE_FEU_NOURRI',	Help,	Sound
FROM UnitPromotions WHERE Type = 'PROMOTION_FOCUS_FIRE';	

INSERT INTO UnitPromotions
		(Type,									CannotBeChosen, AlwaysHeal,	LostWithUpgrade,	PortraitIndex,	IconAtlas,						PediaType,		PediaEntry,										Description,									Help,												Sound)
SELECT	'PROMOTION_GW_FRANCE_STANDARDISATION',	CannotBeChosen,	AlwaysHeal,	1,					4,				'GW_FRANCE_PROMOTION_ATLAS',	'PEDIA_RANGED',	'TXT_KEY_PROMOTION_GW_FRANCE_STANDARDISATION',	'TXT_KEY_PROMOTION_GW_FRANCE_STANDARDISATION',	'TXT_KEY_PROMOTION_GW_FRANCE_STANDARDISATION_HELP',	Sound
FROM UnitPromotions WHERE Type = 'PROMOTION_REPAIR';
--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units 	
		(Type,						Class, 	PrereqTech,	Range, BaseSightRange, Combat,		Cost,	FaithCost,	RequiresFaithPurchaseEnabled,	PurchaseOnly,	GlobalFaithPurchaseCooldown,	MoveAfterPurchase,	Moves, Immobile, CombatClass, Domain, DefaultUnitAI, ObsoleteTech,		GoodyHutUpgradeUnitClass, XPValueAttack, IsMounted,	Description, 						Civilopedia, 								Strategy, 										Help, 										Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfo, 							UnitFlagIconOffset, UnitFlagAtlas,			PortraitIndex, 	IconAtlas,			MoveRate, PurchaseCooldown)
SELECT	'UNIT_GW_FRANCE_CHEVALIER',	Class,	PrereqTech,	Range, BaseSightRange, Combat+2,	Cost,	FaithCost,	RequiresFaithPurchaseEnabled,	PurchaseOnly,	GlobalFaithPurchaseCooldown,	MoveAfterPurchase,	Moves, Immobile, CombatClass, Domain, DefaultUnitAI, 'TECH_COMBUSTION',	GoodyHutUpgradeUnitClass, XPValueAttack, IsMounted,	'TXT_KEY_UNIT_GW_FRANCE_CHEVALIER',	'TXT_KEY_UNIT_GW_FRANCE_CHEVALIER_TEXT',	'TXT_KEY_UNIT_GW_FRANCE_CHEVALIER_STRATEGY',	'TXT_KEY_UNIT_GW_FRANCE_CHEVALIER_HELP',	Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, 'ART_DEF_UNIT_GW_FRANCE_CHEVALIER', 	0,					'GW_FRANCE_UNIT_FLAG',	3,				'GW_FRANCE_ATLAS',	MoveRate, PurchaseCooldown
FROM Units WHERE Type = 'UNIT_KNIGHT';

INSERT INTO Units 	
		(Type, 								Class, 	PrereqTech,	Combat,		RangedCombat,	Cost,	FaithCost,	RequiresFaithPurchaseEnabled,	Moves, Range,	BaseSightRange,	CombatClass, Domain, DefaultUnitAI, Description, 							Civilopedia, 								Strategy, 										Help, 										MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, Pillage, XPValueAttack,	XPValueDefense,	MoveRate,	ObsoleteTech,		GoodyHutUpgradeUnitClass, PurchaseCoolDown,	UnitArtInfoEraVariation, UnitArtInfo, 									UnitFlagIconOffset, UnitFlagAtlas,			PortraitIndex, 	IconAtlas)
SELECT	'UNIT_GW_FRANCE_CANNON_GRIBEAUVAL',	Class,	PrereqTech,	Combat+2,	RangedCombat+1,	Cost,	FaithCost,	RequiresFaithPurchaseEnabled,	Moves, Range,	BaseSightRange,	CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_GW_FRANCE_CANNON_GRIBEAUVAL',	'TXT_KEY_GW_FRANCE_CANNON_GRIBEAUVAL_TEXT',	'TXT_KEY_GW_FRANCE_CANNON_GRIBEAUVAL_STRATEGY',	'TXT_KEY_GW_FRANCE_CANNON_GRIBEAUVAL_HELP',	MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, Pillage, XPValueAttack,	XPValueDefense,	MoveRate,	'TECH_BALLISTICS',	GoodyHutUpgradeUnitClass, PurchaseCoolDown,	UnitArtInfoEraVariation, 'ART_DEF_UNIT_GW_FRANCE_CANNON_GRIBEAUVAL',	1,					'GW_FRANCE_UNIT_FLAG',	4, 				'GW_FRANCE_ATLAS'
FROM Units WHERE Type = 'UNIT_CANNON';
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================	
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	'UNIT_GW_FRANCE_CHEVALIER', SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_KNIGHT';

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 							SelectionSound, FirstSelectionSound)
SELECT	'UNIT_GW_FRANCE_CANNON_GRIBEAUVAL',	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_CANNON';	
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================	
INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_GW_FRANCE_CHEVALIER', UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_KNIGHT';

INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_GW_FRANCE_CANNON_GRIBEAUVAL',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_CANNON';
--==========================================================================================================================	
-- Unit_ResourceQuantityRequirements
--==========================================================================================================================		
INSERT INTO Unit_ResourceQuantityRequirements 	
		(UnitType, 					ResourceType)
SELECT	'UNIT_GW_FRANCE_CHEVALIER',	ResourceType
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_KNIGHT';

INSERT INTO Unit_ResourceQuantityRequirements 	
		(UnitType, 					ResourceType)
SELECT	'UNIT_GW_FRANCE_CANNON_GRIBEAUVAL',	ResourceType
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_CANNON';
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================	
INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_GW_FRANCE_CHEVALIER', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_KNIGHT';

INSERT INTO Unit_Flavors 	
		(UnitType, 							FlavorType, Flavor)
SELECT	'UNIT_GW_FRANCE_CANNON_GRIBEAUVAL',	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_CANNON';
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================	
INSERT INTO Unit_FreePromotions 	
		(UnitType, 								PromotionType)
VALUES	('UNIT_GW_FRANCE_CHEVALIER',			'PROMOTION_GW_FRANCE_JOUTE'),
		('UNIT_GW_FRANCE_CHEVALIER',			'PROMOTION_GW_FRANCE_OST'),
		('UNIT_GW_FRANCE_CHEVALIER',			'PROMOTION_SPAWN_GENERALS_II'),
		('UNIT_GW_FRANCE_CANNON_GRIBEAUVAL', 	'PROMOTION_GW_FRANCE_FEU_NOURRI'),
		('UNIT_GW_FRANCE_CANNON_GRIBEAUVAL', 	'PROMOTION_GW_FRANCE_STANDARDISATION');

INSERT INTO Unit_FreePromotions
		(UnitType, 					PromotionType) 
SELECT	'UNIT_GW_FRANCE_CHEVALIER',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_KNIGHT';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_GW_FRANCE_CANNON_GRIBEAUVAL',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_CANNON';
--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 					UnitClassType)
SELECT	'UNIT_GW_FRANCE_CHEVALIER',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_KNIGHT';

INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 							UnitClassType)
SELECT	'UNIT_GW_FRANCE_CANNON_GRIBEAUVAL',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_CANNON';
--==========================================================================================================================
-- Unit_UniqueNames
--==========================================================================================================================
INSERT INTO Unit_UniqueNames
		(UnitType,							UniqueName)
VALUES	('UNIT_GW_FRANCE_CHEVALIER',		'TXT_KEY_GW_CHEVALIER__001'),
		('UNIT_GW_FRANCE_CHEVALIER',		'TXT_KEY_GW_CHEVALIER__002'),
		('UNIT_GW_FRANCE_CHEVALIER',		'TXT_KEY_GW_CHEVALIER__003'),
		('UNIT_GW_FRANCE_CHEVALIER',		'TXT_KEY_GW_CHEVALIER__004'),
		('UNIT_GW_FRANCE_CHEVALIER',		'TXT_KEY_GW_CHEVALIER__005'),
		('UNIT_GW_FRANCE_CHEVALIER',		'TXT_KEY_GW_CHEVALIER__006'),
		('UNIT_GW_FRANCE_CHEVALIER',		'TXT_KEY_GW_CHEVALIER__007'),
		('UNIT_GW_FRANCE_CHEVALIER',		'TXT_KEY_GW_CHEVALIER__008'),
		('UNIT_GW_FRANCE_CHEVALIER',		'TXT_KEY_GW_CHEVALIER__009'),
		('UNIT_GW_FRANCE_CHEVALIER',		'TXT_KEY_GW_CHEVALIER__010'),
		('UNIT_GW_FRANCE_CHEVALIER',		'TXT_KEY_GW_CHEVALIER__011'),
		('UNIT_GW_FRANCE_CHEVALIER',		'TXT_KEY_GW_CHEVALIER__012'),
		('UNIT_GW_FRANCE_CHEVALIER',		'TXT_KEY_GW_CHEVALIER__013'),
		('UNIT_GW_FRANCE_CHEVALIER',		'TXT_KEY_GW_CHEVALIER__014'),
		('UNIT_GW_FRANCE_CHEVALIER',		'TXT_KEY_GW_CHEVALIER__015'),
		('UNIT_GW_FRANCE_CHEVALIER',		'TXT_KEY_GW_CHEVALIER__016'),
		('UNIT_GW_FRANCE_CHEVALIER',		'TXT_KEY_GW_CHEVALIER__017'),
		('UNIT_GW_FRANCE_CHEVALIER',		'TXT_KEY_GW_CHEVALIER__018'),
		('UNIT_GW_FRANCE_CHEVALIER',		'TXT_KEY_GW_CHEVALIER__019'),
		('UNIT_GW_FRANCE_CHEVALIER',		'TXT_KEY_GW_CHEVALIER__020');
--==========================================================================================================================
-- Improvements
--==========================================================================================================================
INSERT INTO Improvements
		(Type, 								Description,								Civilopedia, 									Help,											ArtDefineTag,	SpecificCivRequired, 	CivilizationType, 			PillageGold,	HillsMakesValid,	FreshWaterMakesValid,	PortraitIndex, 	IconAtlas, 	NoTwoAdjacent,	DefenseModifier,	NoFollowUp)
SELECT	'IMPROVEMENT_GW_FRANCE_CHATEAU',	'TXT_KEY_IMPROVEMENT_GW_FRANCE_CHATEAU',	'TXT_KEY_IMPROVEMENT_GW_FRANCE_CHATEAU_TEXT',	'TXT_KEY_IMPROVEMENT_GW_FRANCE_CHATEAU_HELP',	ArtDefineTag,	1,						'CIVILIZATION_GW_FRANCE',	PillageGold,	1,					1,						PortraitIndex,	IconAtlas,	NoTwoAdjacent,	DefenseModifier,	NoFollowUp
FROM Improvements WHERE Type = 'IMPROVEMENT_CHATEAU';
--==========================================================================================================================	
-- Improvement_ValidTerrains
--==========================================================================================================================		
INSERT INTO Improvement_ValidTerrains 	
		(ImprovementType, 					TerrainType)
VALUES	('IMPROVEMENT_GW_FRANCE_CHATEAU',	'TERRAIN_HILL');
--==========================================================================================================================	
-- Improvement_Yields
--==========================================================================================================================		
INSERT INTO Improvement_Yields 	
		(ImprovementType, 					YieldType,			Yield)
VALUES	('IMPROVEMENT_GW_FRANCE_CHATEAU',	'YIELD_FOOD',		1),
		('IMPROVEMENT_GW_FRANCE_CHATEAU',	'YIELD_PRODUCTION',	1),
		('IMPROVEMENT_GW_FRANCE_CHATEAU',	'YIELD_GOLD',		1);
--==========================================================================================================================
-- Improvement_TechYieldChanges
--==========================================================================================================================
INSERT INTO Improvement_TechYieldChanges
		(ImprovementType,							TechType,				YieldType,			Yield)
VALUES	('IMPROVEMENT_GW_FRANCE_CHATEAU',			'TECH_CHIVALRY',		'YIELD_PRODUCTION',	1),
		('IMPROVEMENT_GW_FRANCE_CHATEAU',			'TECH_CHIVALRY',		'YIELD_FOOD',		1),
		('IMPROVEMENT_GW_FRANCE_CHATEAU',			'TECH_CHIVALRY',		'YIELD_GOLD',		1),			
		('IMPROVEMENT_GW_FRANCE_CHATEAU',			'TECH_ARCHITECTURE',	'YIELD_CULTURE',	1),
		('IMPROVEMENT_GW_FRANCE_CHATEAU',			'TECH_ARCHITECTURE',	'YIELD_GOLD',		1),		
		('IMPROVEMENT_GW_FRANCE_CHATEAU',			'TECH_ARCHITECTURE',	'YIELD_TOURISM',	1),
		('IMPROVEMENT_GW_FRANCE_CHATEAU',			'TECH_ARCHAEOLOGY',		'YIELD_CULTURE',	1),
		('IMPROVEMENT_GW_FRANCE_CHATEAU',			'TECH_ARCHAEOLOGY',		'YIELD_GOLD',		1),
		('IMPROVEMENT_GW_FRANCE_CHATEAU',			'TECH_ARCHAEOLOGY',		'YIELD_TOURISM',	1),
		('IMPROVEMENT_GW_FRANCE_CHATEAU',			'TECH_FLIGHT',			'YIELD_CULTURE',	1),
		('IMPROVEMENT_GW_FRANCE_CHATEAU',			'TECH_FLIGHT',			'YIELD_GOLD',		1),
		('IMPROVEMENT_GW_FRANCE_CHATEAU',			'TECH_FLIGHT',			'YIELD_TOURISM',	1);
--==========================================================================================================================
-- Policy_ImprovementYieldChanges
--==========================================================================================================================
INSERT INTO Policy_ImprovementYieldChanges
		(PolicyType,	ImprovementType,					YieldType, Yield)
SELECT	PolicyType,		'IMPROVEMENT_GW_FRANCE_CHATEAU',	YieldType, Yield
FROM Policy_ImprovementYieldChanges WHERE ImprovementType = 'IMPROVEMENT_CHATEAU';
--==========================================================================================================================
-- Builds
--==========================================================================================================================	
INSERT INTO Builds		
		(Type,						PrereqTech,			ImprovementType, 					Description, 	Help, 	Recommendation, EntityEvent,	Time,	OrderPriority, 	Kill, 	IconIndex, 	IconAtlas)
SELECT	'BUILD_GW_FRANCE_CHATEAU',	'TECH_ENGINEERING',	'IMPROVEMENT_GW_FRANCE_CHATEAU',	Description,	Help,	Recommendation,	EntityEvent,	Time,	OrderPriority,	Kill,	IconIndex,	IconAtlas
FROM Builds WHERE Type = 'BUILD_CHATEAU';
--==========================================================================================================================				
-- Unit_Builds
--==========================================================================================================================				
INSERT INTO Unit_Builds	
		(UnitType, 			BuildType)
VALUES	('UNIT_WORKER',		'BUILD_GW_FRANCE_CHATEAU');
--==========================================================================================================================				
-- BuildFeatures
--==========================================================================================================================				
INSERT INTO BuildFeatures	
			(BuildType, 				FeatureType, PrereqTech, Time, Production, Remove)
SELECT		'BUILD_GW_FRANCE_CHATEAU',	FeatureType, PrereqTech, Time, Production, Remove
FROM BuildFeatures WHERE BuildType = 'BUILD_CHATEAU';
--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================
INSERT INTO BuildingClasses
		(Type,										DefaultBuilding,					NoLimit)
VALUES	('BUILDINGCLASS_D_GW_FRANCE_TRAIT',			'BUILDING_D_GW_FRANCE_TRAIT',		1),
		('BUILDINGCLASS_D_GW_FRANCE_GE',			'BUILDING_D_GW_FRANCE_GE',			1),
		('BUILDINGCLASS_D_GW_FRANCE_SCIENTIST',		'BUILDING_D_GW_FRANCE_SCIENTIST',	1),
		('BUILDINGCLASS_D_GW_FRANCE_MERCHANT',		'BUILDING_D_GW_FRANCE_MERCHANT',	1),
		('BUILDINGCLASS_D_GW_FRANCE_DIPLOMAT',		'BUILDING_D_GW_FRANCE_DIPLOMAT',	1),
		('BUILDINGCLASS_D_GW_FRANCE_ENGINEER',		'BUILDING_D_GW_FRANCE_ENGINEER',	1),
		('BUILDINGCLASS_D_GW_FRANCE_ARTIST',		'BUILDING_D_GW_FRANCE_ARTIST',		1),
		('BUILDINGCLASS_D_GW_FRANCE_WRITER',		'BUILDING_D_GW_FRANCE_WRITER',		1),		
		('BUILDINGCLASS_D_GW_FRANCE_MUSICIAN',		'BUILDING_D_GW_FRANCE_MUSICIAN',	1);
--==========================================================================================================================
-- Buildings
--==========================================================================================================================
INSERT INTO Buildings	
		(Type,								BuildingClass,							Description,								CapitalOnly,	SpecialistType,				GreatPeopleRateChange,	GoldMaintenance,	Cost,	FaithCost,	GreatWorkCount, NeverCapture,	NukeImmune, ConquestProb,	HurryCostModifier,	IconAtlas,			PortraitIndex,	IsDummy)
VALUES	('BUILDING_D_GW_FRANCE_TRAIT',		'BUILDINGCLASS_D_GW_FRANCE_TRAIT',		'TXT_KEY_BUILDING_D_GW_FRANCE_TRAIT',		1,				NULL,						0,						0,					-1,		-1,			-1, 			1,				1, 			0, 				-1,					'CIV_COLOR_ATLAS',	0,				1),
		('BUILDING_D_GW_FRANCE_GE',			'BUILDINGCLASS_D_GW_FRANCE_GE',			'TXT_KEY_BUILDING_D_GW_FRANCE_GE',			0,				NULL,						0,						0,					-1,		-1,			-1, 			1,				1, 			0, 				-1,					'CIV_COLOR_ATLAS',	0,				1),
		('BUILDING_D_GW_FRANCE_SCIENTIST',	'BUILDINGCLASS_D_GW_FRANCE_SCIENTIST',	'TXT_KEY_BUILDING_D_GW_FRANCE_SCIENTIST',	0,				'SPECIALIST_SCIENTIST',		2,						0,					-1,		-1,			-1, 			1,				1, 			0, 				-1,					'CIV_COLOR_ATLAS',	0,				1),
		('BUILDING_D_GW_FRANCE_MERCHANT',	'BUILDINGCLASS_D_GW_FRANCE_MERCHANT',	'TXT_KEY_BUILDING_D_GW_FRANCE_MERCHANT',	0,				'SPECIALIST_MERCHANT',		2,						0,					-1,		-1,			-1, 			1,				1, 			0, 				-1,					'CIV_COLOR_ATLAS',	0,				1),
		('BUILDING_D_GW_FRANCE_DIPLOMAT',	'BUILDINGCLASS_D_GW_FRANCE_DIPLOMAT',	'TXT_KEY_BUILDING_D_GW_FRANCE_DIPLOMAT',	0,				'SPECIALIST_CIVIL_SERVANT',	2,						0,					-1,		-1,			-1, 			1,				1, 			0, 				-1,					'CIV_COLOR_ATLAS',	0,				1),
		('BUILDING_D_GW_FRANCE_ENGINEER',	'BUILDINGCLASS_D_GW_FRANCE_ENGINEER',	'TXT_KEY_BUILDING_D_GW_FRANCE_ENGINEER',	0,				'SPECIALIST_ENGINEER',		2,						0,					-1,		-1,			-1, 			1,				1, 			0, 				-1,					'CIV_COLOR_ATLAS',	0,				1),
		('BUILDING_D_GW_FRANCE_ARTIST',		'BUILDINGCLASS_D_GW_FRANCE_ARTIST',		'TXT_KEY_BUILDING_D_GW_FRANCE_ARTIST',		0,				'SPECIALIST_ARTIST',		1,						0,					-1,		-1,			-1, 			1,				1, 			0, 				-1,					'CIV_COLOR_ATLAS',	0,				1),
		('BUILDING_D_GW_FRANCE_WRITER',		'BUILDINGCLASS_D_GW_FRANCE_WRITER',		'TXT_KEY_BUILDING_D_GW_FRANCE_WRITER',		0,				'SPECIALIST_WRITER',		1,						0,					-1,		-1,			-1, 			1,				1, 			0, 				-1,					'CIV_COLOR_ATLAS',	0,				1),
		('BUILDING_D_GW_FRANCE_MUSICIAN',	'BUILDINGCLASS_D_GW_FRANCE_MUSICIAN',	'TXT_KEY_BUILDING_D_GW_FRANCE_MUSICIAN',	0,				'SPECIALIST_MUSICIAN',		1,						0,					-1,		-1,			-1, 			1,				1, 			0, 				-1,					'CIV_COLOR_ATLAS',	0,				1);

INSERT INTO	Buildings
		(Type,							Description,							Civilopedia,									Strategy,											Help,											GoldMaintenance, Cost, FaithCost, HurryCostModifier, MinAreaSize, ConquestProb, BuildingClass, ArtDefineTag, PrereqTech, PortraitIndex, IconAtlas,			GreatWorkYieldType,	UnlockedByBelief, SpecialistCount, SpecialistType, IlliteracyFlatReduction, NoUnhappfromXSpecialists,	GreatPeopleRateModifier)
SELECT	'BUILDING_FRANCE_GRANDE_ECOLE', 'TXT_KEY_BUILDING_FRANCE_GRANDE_ECOLE',	'TXT_KEY_BUILDING_FRANCE_GRANDE_ECOLE_TEXT',	'TXT_KEY_BUILDING_FRANCE_GRANDE_ECOLE_STRATEGY',	'TXT_KEY_BUILDING_FRANCE_GRANDE_ECOLE_HELP',	GoldMaintenance, Cost, FaithCost, HurryCostModifier, MinAreaSize, ConquestProb, BuildingClass, ArtDefineTag, PrereqTech, 2,				'GW_FRANCE_ATLAS',	GreatWorkYieldType,	UnlockedByBelief, SpecialistCount, SpecialistType, IlliteracyFlatReduction, 1,							25
FROM Buildings WHERE Type = 'BUILDING_PUBLIC_SCHOOL';
--==========================================================================================================================	
-- Building_GlobalYieldModifiers
--==========================================================================================================================
INSERT INTO Building_GlobalYieldModifiers
		(BuildingType, 						YieldType,				Yield)
VALUES	('BUILDING_D_GW_FRANCE_TRAIT',		'YIELD_PRODUCTION',		1),
		('BUILDING_D_GW_FRANCE_TRAIT',		'YIELD_SCIENCE',		1),
		('BUILDING_D_GW_FRANCE_TRAIT',		'YIELD_CULTURE',		1),
		('BUILDING_D_GW_FRANCE_TRAIT',		'YIELD_FOOD',			1);
--==========================================================================================================================	
-- Building_YieldModifiers
--==========================================================================================================================
INSERT INTO Building_YieldModifiers
		(BuildingType, 						YieldType,				Yield)
VALUES	('BUILDING_D_GW_FRANCE_GE',			'YIELD_PRODUCTION',		1),
		('BUILDING_D_GW_FRANCE_GE',			'YIELD_SCIENCE',		1),
		('BUILDING_D_GW_FRANCE_GE',			'YIELD_CULTURE',		1),
		('BUILDING_D_GW_FRANCE_GE',			'YIELD_FOOD',			1);
--==========================================================================================================================
-- Building_Flavors
--==========================================================================================================================
INSERT INTO	Building_Flavors
		(BuildingType,						FlavorType,				Flavor)
VALUES	('BUILDING_FRANCE_GRANDE_ECOLE',	'FLAVOR_SCIENCE',		80),
		('BUILDING_FRANCE_GRANDE_ECOLE',	'FLAVOR_GREAT_PEOPLE',	50),
		('BUILDING_FRANCE_GRANDE_ECOLE',	'FLAVOR_GROWTH',		40),
		('BUILDING_FRANCE_GRANDE_ECOLE',	'FLAVOR_CULTURE',		50),
		('BUILDING_FRANCE_GRANDE_ECOLE',	'FLAVOR_PRODUCTION',	40);
--==========================================================================================================================
-- Building_ClassesNeededInCity
--==========================================================================================================================
INSERT INTO Building_ClassesNeededInCity
		(BuildingType,					BuildingClassType)
SELECT	'BUILDING_FRANCE_GRANDE_ECOLE', BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_PUBLIC_SCHOOL';
--==========================================================================================================================
-- Building_YieldChanges
--==========================================================================================================================
INSERT INTO Building_YieldChanges
		(BuildingType,						YieldType,			Yield)
VALUES	('BUILDING_FRANCE_GRANDE_ECOLE',	'YIELD_CULTURE',	3),
		('BUILDING_FRANCE_GRANDE_ECOLE',	'YIELD_SCIENCE',	3);
--==========================================================================================================================
-- Building_ImprovementYieldChanges
--==========================================================================================================================
INSERT INTO Building_ImprovementYieldChanges 	
		(BuildingType, 					ImprovementType,	YieldType,			Yield)
SELECT	'BUILDING_FRANCE_GRANDE_ECOLE',	Type,				'YIELD_SCIENCE',	1 FROM Improvements WHERE CreatedByGreatPerson = 1 UNION ALL
SELECT	'BUILDING_FRANCE_GRANDE_ECOLE',	Type,				'YIELD_TOURISM',	1 FROM Improvements WHERE CreatedByGreatPerson = 1;
--==========================================================================================================================
-- Building_SpecialistYieldChangesLocal
--==========================================================================================================================
INSERT INTO Building_SpecialistYieldChangesLocal
		(BuildingType,					SpecialistType,		YieldType,			Yield)
SELECT	'BUILDING_FRANCE_GRANDE_ECOLE',	Type,				'YIELD_CULTURE',	1 FROM Specialists WHERE GreatPeopleUnitClass IS NOT NULL UNION ALL
SELECT	'BUILDING_FRANCE_GRANDE_ECOLE',	Type,				'YIELD_TOURISM',	1 FROM Specialists WHERE GreatPeopleUnitClass IS NOT NULL;