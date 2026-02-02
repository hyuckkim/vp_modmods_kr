--=======================================================================================================================
-- CUSTOM MOD OPTIONS
--=======================================================================================================================
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_TILE_REVEALED';
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_PLOT';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_UNIT_CREATED';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_GREAT_PEOPLE';
--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
		(Type, 								Description, 									Civilopedia, 										CivilopediaTag, 							ArtDefineTag, 								IconAtlas, 				PortraitIndex)
VALUES	('LEADER_GH_LOUISIANA_BEAUSOLEIL', 	'TXT_KEY_LEADER_GH_LOUISIANA_BEAUSOLEIL_DESC', 	'TXT_KEY_LEADER_GH_LOUISIANA_BEAUSOLEIL_PEDIA', 	'TXT_KEY_LEADER_GH_LOUISIANA_BEAUSOLEIL', 	'GH_Louisiana_Beausoleil_Leaderscene.xml',	'GH_LOUISIANA_ATLAS',	4);

UPDATE Leaders
SET PrimaryVictoryPursuit = 'VICTORY_PURSUIT_DIPLOMACY',
SecondaryVictoryPursuit = 'VICTORY_PURSUIT_CULTURE',
VictoryCompetitiveness = 6,
WonderCompetitiveness = 6,
MinorCivCompetitiveness = 12,
Boldness = 6,
DiploBalance = 10,
WarmongerHate = 8,
DoFWillingness = 10,
DenounceWillingness = 4,
WorkWithWillingness = 10,
WorkAgainstWillingness = 8,
Loyalty = 8,
Forgiveness = 7,
Neediness = 3,
Meanness = 4,
Chattiness = 12
WHERE Type = 'LEADER_GH_LOUISIANA_BEAUSOLEIL';
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 							MajorCivApproachType, 				Bias)
VALUES		('LEADER_GH_LOUISIANA_BEAUSOLEIL', 		'MAJOR_CIV_APPROACH_WAR', 			2),
			('LEADER_GH_LOUISIANA_BEAUSOLEIL', 		'MAJOR_CIV_APPROACH_HOSTILE', 		3),
			('LEADER_GH_LOUISIANA_BEAUSOLEIL', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	6),
			('LEADER_GH_LOUISIANA_BEAUSOLEIL', 		'MAJOR_CIV_APPROACH_GUARDED', 		6),
			('LEADER_GH_LOUISIANA_BEAUSOLEIL', 		'MAJOR_CIV_APPROACH_AFRAID', 		4),
			('LEADER_GH_LOUISIANA_BEAUSOLEIL', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		10),
			('LEADER_GH_LOUISIANA_BEAUSOLEIL', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
--==========================================================================================================================	
-- Leader_MinorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 						MinorCivApproachType, 				Bias)
VALUES		('LEADER_GH_LOUISIANA_BEAUSOLEIL', 	'MINOR_CIV_APPROACH_IGNORE', 		-1),
			('LEADER_GH_LOUISIANA_BEAUSOLEIL', 	'MINOR_CIV_APPROACH_FRIENDLY', 		-1),
			('LEADER_GH_LOUISIANA_BEAUSOLEIL', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	10),
			('LEADER_GH_LOUISIANA_BEAUSOLEIL', 	'MINOR_CIV_APPROACH_CONQUEST', 		1),
			('LEADER_GH_LOUISIANA_BEAUSOLEIL', 	'MINOR_CIV_APPROACH_BULLY', 		1);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
		(LeaderType, 							FlavorType, 						Flavor)
VALUES	('LEADER_GH_LOUISIANA_BEAUSOLEIL', 		'FLAVOR_AIR', 						4),
		('LEADER_GH_LOUISIANA_BEAUSOLEIL', 		'FLAVOR_AIR_CARRIER', 				4),
		('LEADER_GH_LOUISIANA_BEAUSOLEIL', 		'FLAVOR_AIRLIFT', 					7),
		('LEADER_GH_LOUISIANA_BEAUSOLEIL', 		'FLAVOR_ANTIAIR', 					5),
		('LEADER_GH_LOUISIANA_BEAUSOLEIL', 		'FLAVOR_ARCHAEOLOGY', 				8),
		('LEADER_GH_LOUISIANA_BEAUSOLEIL', 		'FLAVOR_CITY_DEFENSE', 				6),
		('LEADER_GH_LOUISIANA_BEAUSOLEIL', 		'FLAVOR_CULTURE', 					10),		
		('LEADER_GH_LOUISIANA_BEAUSOLEIL', 		'FLAVOR_DEFENSE', 					8),		
		('LEADER_GH_LOUISIANA_BEAUSOLEIL', 		'FLAVOR_DIPLOMACY', 				10),		
		('LEADER_GH_LOUISIANA_BEAUSOLEIL', 		'FLAVOR_ESPIONAGE', 				7),		
		('LEADER_GH_LOUISIANA_BEAUSOLEIL', 		'FLAVOR_EXPANSION', 				7),
		('LEADER_GH_LOUISIANA_BEAUSOLEIL', 		'FLAVOR_GOLD', 						10),		
		('LEADER_GH_LOUISIANA_BEAUSOLEIL', 		'FLAVOR_GREAT_PEOPLE', 				8),		
		('LEADER_GH_LOUISIANA_BEAUSOLEIL', 		'FLAVOR_GROWTH', 					9),
		('LEADER_GH_LOUISIANA_BEAUSOLEIL', 		'FLAVOR_HAPPINESS', 				7),		
		('LEADER_GH_LOUISIANA_BEAUSOLEIL', 		'FLAVOR_I_LAND_TRADE_ROUTE', 		5),		
		('LEADER_GH_LOUISIANA_BEAUSOLEIL', 		'FLAVOR_I_SEA_TRADE_ROUTE', 		8),
		('LEADER_GH_LOUISIANA_BEAUSOLEIL', 		'FLAVOR_I_TRADE_DESTINATION', 		8),
		('LEADER_GH_LOUISIANA_BEAUSOLEIL', 		'FLAVOR_I_TRADE_ORIGIN', 			8),
		('LEADER_GH_LOUISIANA_BEAUSOLEIL', 		'FLAVOR_INFRASTRUCTURE', 			5),
		('LEADER_GH_LOUISIANA_BEAUSOLEIL', 		'FLAVOR_MILITARY_TRAINING', 		5),
		('LEADER_GH_LOUISIANA_BEAUSOLEIL', 		'FLAVOR_MOBILE', 					4),
		('LEADER_GH_LOUISIANA_BEAUSOLEIL', 		'FLAVOR_NAVAL', 					6),
		('LEADER_GH_LOUISIANA_BEAUSOLEIL', 		'FLAVOR_NAVAL_GROWTH', 				9),
		('LEADER_GH_LOUISIANA_BEAUSOLEIL', 		'FLAVOR_NAVAL_RECON', 				8),		
		('LEADER_GH_LOUISIANA_BEAUSOLEIL', 		'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	7),		
		('LEADER_GH_LOUISIANA_BEAUSOLEIL', 		'FLAVOR_NUKE', 						3),
		('LEADER_GH_LOUISIANA_BEAUSOLEIL', 		'FLAVOR_OFFENSE', 					5),		
		('LEADER_GH_LOUISIANA_BEAUSOLEIL', 		'FLAVOR_PRODUCTION', 				7),		
		('LEADER_GH_LOUISIANA_BEAUSOLEIL', 		'FLAVOR_RANGED', 					7),
		('LEADER_GH_LOUISIANA_BEAUSOLEIL', 		'FLAVOR_RECON', 					7),		
		('LEADER_GH_LOUISIANA_BEAUSOLEIL', 		'FLAVOR_RELIGION', 					9),
		('LEADER_GH_LOUISIANA_BEAUSOLEIL', 		'FLAVOR_SCIENCE', 					8),
		('LEADER_GH_LOUISIANA_BEAUSOLEIL', 		'FLAVOR_SPACESHIP', 				5),	
		('LEADER_GH_LOUISIANA_BEAUSOLEIL', 		'FLAVOR_TILE_IMPROVEMENT', 			6),
		('LEADER_GH_LOUISIANA_BEAUSOLEIL', 		'FLAVOR_USE_NUKE', 					4),
		('LEADER_GH_LOUISIANA_BEAUSOLEIL', 		'FLAVOR_WATER_CONNECTION', 			9),
		('LEADER_GH_LOUISIANA_BEAUSOLEIL', 		'FLAVOR_WONDER', 					6);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================						
INSERT INTO Leader_Traits 
		(LeaderType, 						TraitType)
VALUES	('LEADER_GH_LOUISIANA_BEAUSOLEIL', 	'TRAIT_GH_LOUISIANA_GRAND_SETTLEMENT');
--==========================================================================================================================	
-- Traits
--==========================================================================================================================	
INSERT INTO Traits 
		(Type, 										Description, 									ShortDescription,										FreeBuilding)					
VALUES	('TRAIT_GH_LOUISIANA_GRAND_SETTLEMENT', 	'TXT_KEY_TRAIT_GH_LOUISIANA_GRAND_SETTLEMENT', 	'TXT_KEY_TRAIT_GH_LOUISIANA_GRAND_SETTLEMENT_SHORT',	'BUILDING_NO_UNIT_PROD_FOR_CITIES');
--==========================================================================================================================	
-- Trait_NoTrain
--==========================================================================================================================	
INSERT INTO Trait_NoTrain 
		(TraitType, 								UnitClassType)					
VALUES	('TRAIT_GH_LOUISIANA_GRAND_SETTLEMENT', 	'UNITCLASS_SCOUT'),
		('TRAIT_GH_LOUISIANA_GRAND_SETTLEMENT', 	'UNITCLASS_EXPLORER'),
		('TRAIT_GH_LOUISIANA_GRAND_SETTLEMENT', 	'UNITCLASS_COMMANDO');
--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================				
INSERT INTO Civilizations 	
			(Type, 								Description, 							ShortDescription, 							Adjective, 								CivilopediaTag, 					DefaultPlayerColor, 				ArtDefineTag, ArtStyleType,		ArtStyleSuffix, ArtStylePrefix, IconAtlas, 				PortraitIndex, 	AlphaIconAtlas, 				SoundtrackTag, 	MapImage, 					DawnOfManQuote, 									DawnOfManImage)
SELECT		'CIVILIZATION_GH_LOUISIANA', 		'TXT_KEY_CIV_GH_LOUISIANA_DESC', 		'TXT_KEY_CIV_GH_LOUISIANA_SHORT_DESC',		'TXT_KEY_CIV_GH_LOUISIANA_ADJECTIVE', 	'TXT_KEY_CIV5_GH_LOUISIANA', 		'PLAYERCOLOR_GH_LOUISIANA', 		ArtDefineTag, ArtStyleType,		ArtStyleSuffix,	ArtStylePrefix,	'GH_LOUISIANA_ATLAS', 	0, 				'GH_LOUISIANA_ALPHA_ATLAS', 	'FRANCE', 		'GH_Louisiana_Map.dds', 	'TXT_KEY_CIV5_DOM_GH_LOUISIANA_BEAUSOLEIL_TEXT', 	'GH_Beausoleil_DOM.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_FRANCE';

UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_FRANCE')
	THEN '_FRANCE'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_GH_LOUISIANA';
--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================			
INSERT INTO Civilization_CityNames 
			(CivilizationType, 			 CityName)
VALUES		('CIVILIZATION_GH_LOUISIANA', 	'TXT_KEY_CITY_NAME_GH_LOUISIANA_01'),
			('CIVILIZATION_GH_LOUISIANA', 	'TXT_KEY_CITY_NAME_GH_LOUISIANA_02'),
			('CIVILIZATION_GH_LOUISIANA', 	'TXT_KEY_CITY_NAME_GH_LOUISIANA_03'),
			('CIVILIZATION_GH_LOUISIANA', 	'TXT_KEY_CITY_NAME_GH_LOUISIANA_04'),
			('CIVILIZATION_GH_LOUISIANA', 	'TXT_KEY_CITY_NAME_GH_LOUISIANA_05'),
			('CIVILIZATION_GH_LOUISIANA', 	'TXT_KEY_CITY_NAME_GH_LOUISIANA_06'),
			('CIVILIZATION_GH_LOUISIANA', 	'TXT_KEY_CITY_NAME_GH_LOUISIANA_07'),
			('CIVILIZATION_GH_LOUISIANA', 	'TXT_KEY_CITY_NAME_GH_LOUISIANA_08'),
			('CIVILIZATION_GH_LOUISIANA', 	'TXT_KEY_CITY_NAME_GH_LOUISIANA_09'),
			('CIVILIZATION_GH_LOUISIANA', 	'TXT_KEY_CITY_NAME_GH_LOUISIANA_10'),
			('CIVILIZATION_GH_LOUISIANA', 	'TXT_KEY_CITY_NAME_GH_LOUISIANA_11'),
			('CIVILIZATION_GH_LOUISIANA', 	'TXT_KEY_CITY_NAME_GH_LOUISIANA_12'),
			('CIVILIZATION_GH_LOUISIANA', 	'TXT_KEY_CITY_NAME_GH_LOUISIANA_13'),
			('CIVILIZATION_GH_LOUISIANA', 	'TXT_KEY_CITY_NAME_GH_LOUISIANA_14'),
			('CIVILIZATION_GH_LOUISIANA', 	'TXT_KEY_CITY_NAME_GH_LOUISIANA_15'),
			('CIVILIZATION_GH_LOUISIANA', 	'TXT_KEY_CITY_NAME_GH_LOUISIANA_16'),
			('CIVILIZATION_GH_LOUISIANA', 	'TXT_KEY_CITY_NAME_GH_LOUISIANA_17'),
			('CIVILIZATION_GH_LOUISIANA', 	'TXT_KEY_CITY_NAME_GH_LOUISIANA_18'),
			('CIVILIZATION_GH_LOUISIANA', 	'TXT_KEY_CITY_NAME_GH_LOUISIANA_19'),
			('CIVILIZATION_GH_LOUISIANA', 	'TXT_KEY_CITY_NAME_GH_LOUISIANA_20'),
			('CIVILIZATION_GH_LOUISIANA', 	'TXT_KEY_CITY_NAME_GH_LOUISIANA_21'),
			('CIVILIZATION_GH_LOUISIANA', 	'TXT_KEY_CITY_NAME_GH_LOUISIANA_22'),
			('CIVILIZATION_GH_LOUISIANA', 	'TXT_KEY_CITY_NAME_GH_LOUISIANA_23'),
			('CIVILIZATION_GH_LOUISIANA', 	'TXT_KEY_CITY_NAME_GH_LOUISIANA_24'),
			('CIVILIZATION_GH_LOUISIANA', 	'TXT_KEY_CITY_NAME_GH_LOUISIANA_25'),
			('CIVILIZATION_GH_LOUISIANA', 	'TXT_KEY_CITY_NAME_GH_LOUISIANA_26'),
			('CIVILIZATION_GH_LOUISIANA', 	'TXT_KEY_CITY_NAME_GH_LOUISIANA_27'),
			('CIVILIZATION_GH_LOUISIANA', 	'TXT_KEY_CITY_NAME_GH_LOUISIANA_28'),
			('CIVILIZATION_GH_LOUISIANA', 	'TXT_KEY_CITY_NAME_GH_LOUISIANA_29'),
			('CIVILIZATION_GH_LOUISIANA', 	'TXT_KEY_CITY_NAME_GH_LOUISIANA_30');
--==========================================================================================================================	
-- MajorBlocksMinor
--==========================================================================================================================
INSERT INTO MajorBlocksMinor
            (MajorCiv,                     MinorCiv)
VALUES      ('CIVILIZATION_GH_LOUISIANA',   'MINOR_CIV_QUEBEC_CITY');
--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 				BuildingClassType)
SELECT		'CIVILIZATION_GH_LOUISIANA', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_FRANCE';
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 					TechType)
SELECT		('CIVILIZATION_GH_LOUISIANA'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_FRANCE');
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_GH_LOUISIANA'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_FRANCE');
--==========================================================================================================================	
-- Civilization_Start_Along_Ocean
--==========================================================================================================================			
INSERT INTO Civilization_Start_Along_Ocean 
			(CivilizationType, 					StartAlongOcean)
VALUES		('CIVILIZATION_GH_LOUISIANA', 		1);
--==========================================================================================================================	
-- Civilization_Start_Region_Priority
--==========================================================================================================================			
INSERT INTO Civilization_Start_Region_Priority 
			(CivilizationType, 					RegionType)
VALUES		('CIVILIZATION_GH_LOUISIANA', 		'REGION_JUNGLE'),
			('CIVILIZATION_GH_LOUISIANA', 		'REGION_FOREST');
--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================			
INSERT INTO Civilization_Leaders 
			(CivilizationType, 				LeaderheadType)
VALUES		('CIVILIZATION_GH_LOUISIANA', 	'LEADER_GH_LOUISIANA_BEAUSOLEIL');
--==========================================================================================================================	
-- Civilization_UnitClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType,				UnitClassType,			UnitType)
VALUES	('CIVILIZATION_GH_LOUISIANA',	'UNITCLASS_PATHFINDER',	'UNIT_GH_LOUISIANA_GVOYAGEUR'),
		('CIVILIZATION_GH_LOUISIANA',	'UNITCLASS_MUSICIAN',	'UNIT_GH_LOUISIANA_KREWE');
--------------------------------
-- Civilization_BuildingClassOverrides
--------------------------------
INSERT INTO Civilization_BuildingClassOverrides
		(CivilizationType, 				BuildingClassType, 			BuildingType)
VALUES	('CIVILIZATION_GH_LOUISIANA',	'BUILDINGCLASS_HERMITAGE',	'BUILDING_GH_LOUISIANA_VIEUXCARRE');
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions 
			(CivilizationType, 				ReligionType)
SELECT		'CIVILIZATION_GH_LOUISIANA', 	ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_FRANCE');
--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================		
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 				SpyName)
VALUES		('CIVILIZATION_GH_LOUISIANA', 	'TXT_KEY_SPY_NAME_GH_LOUISIANA_0'),	
			('CIVILIZATION_GH_LOUISIANA', 	'TXT_KEY_SPY_NAME_GH_LOUISIANA_1'),
			('CIVILIZATION_GH_LOUISIANA', 	'TXT_KEY_SPY_NAME_GH_LOUISIANA_2'),
			('CIVILIZATION_GH_LOUISIANA', 	'TXT_KEY_SPY_NAME_GH_LOUISIANA_3'),
			('CIVILIZATION_GH_LOUISIANA', 	'TXT_KEY_SPY_NAME_GH_LOUISIANA_4'),
			('CIVILIZATION_GH_LOUISIANA', 	'TXT_KEY_SPY_NAME_GH_LOUISIANA_5'),
			('CIVILIZATION_GH_LOUISIANA', 	'TXT_KEY_SPY_NAME_GH_LOUISIANA_6'),
			('CIVILIZATION_GH_LOUISIANA', 	'TXT_KEY_SPY_NAME_GH_LOUISIANA_7'),
			('CIVILIZATION_GH_LOUISIANA', 	'TXT_KEY_SPY_NAME_GH_LOUISIANA_8'),
			('CIVILIZATION_GH_LOUISIANA', 	'TXT_KEY_SPY_NAME_GH_LOUISIANA_9');	
--==========================================================================================================================
-- UnitPromotions
--==========================================================================================================================
INSERT INTO UnitPromotions
		(Type,											CannotBeChosen, LostWithUpgrade,	PortraitIndex,		IgnoreTerrainCost,	AdjacentTileHealChange,	CombatPercent,	PromotionDuration,	VisibilityChange,	MovesChange,	BarbarianCombatBonus,	MaxHitPointsChange,	GiveCombatMod,	GiveDomain,		IsNearbyPromotion,	NearbyRange, 	IconAtlas,								PediaType,				PediaEntry,												Description,											Help,														Sound)
VALUES	('PROMOTION_GH_LOUISIANA_ENGAGES',				1,			    1,					3,					0,					5,						0,				0,					1,					0,				0,						0,					0,				null,			0,					0,				'GH_LOUISIANA_PROMOTION_ATLAS',			'PEDIA_SCOUTING',		'TXT_KEY_PROMOTION_GH_LOUISIANA_ENGAGES',				'TXT_KEY_PROMOTION_GH_LOUISIANA_ENGAGES',				'TXT_KEY_PROMOTION_GH_LOUISIANA_ENGAGES_HELP',				'AS2D_IF_LEVELUP'),
		('PROMOTION_GH_LOUISIANA_INTERPRETE',			1,			    1,					4,					0,					0,						0,				0,					0,					1,				35,						0,					0,				null,			0,					0,				'GH_LOUISIANA_PROMOTION_ATLAS',			'PEDIA_SCOUTING',		'TXT_KEY_PROMOTION_GH_LOUISIANA_INTERPRETE',			'TXT_KEY_PROMOTION_GH_LOUISIANA_INTERPRETE',			'TXT_KEY_PROMOTION_GH_LOUISIANA_INTERPRETE_HELP',			'AS2D_IF_LEVELUP'),
		('PROMOTION_GH_LOUISIANA_PETITE_GUERRE',		1,			    0,					5,					0,					0,						0,				0,					0,					0,				0,						15,					10,				'DOMAIN_LAND',	1,					2,				'GH_LOUISIANA_PROMOTION_ATLAS',			'PEDIA_SCOUTING',		'TXT_KEY_PROMOTION_GH_LOUISIANA_PETITE_GUERRE',			'TXT_KEY_PROMOTION_GH_LOUISIANA_PETITE_GUERRE',			'TXT_KEY_PROMOTION_GH_LOUISIANA_PETITE_GUERRE_HELP',		'AS2D_IF_LEVELUP'),
		('PROMOTION_GH_LOUISIANA_ENTREPRENEUR',			1,			    0,					6,					0,					0,						0,				0,					0,					0,				0,						0,					0,				null,			0,					0,				'GH_LOUISIANA_PROMOTION_ATLAS',			'PEDIA_SCOUTING',		'TXT_KEY_PROMOTION_GH_LOUISIANA_ENTREPRENEUR',			'TXT_KEY_PROMOTION_GH_LOUISIANA_ENTREPRENEUR',			'TXT_KEY_PROMOTION_GH_LOUISIANA_ENTREPRENEUR_HELP',			'AS2D_IF_LEVELUP'),		
		('PROMOTION_GH_LOUISIANA_METISSAGE',			1,			    1,					0,					0,					0,						0,				0,					0,					0,				0,						0,					0,				null,			0,					0,				'GH_LOUISIANA_PROMOTION_ATLAS',			'PEDIA_SCOUTING',		'TXT_KEY_PROMOTION_GH_LOUISIANA_METISSAGE',				'TXT_KEY_PROMOTION_GH_LOUISIANA_METISSAGE',				'TXT_KEY_PROMOTION_GH_LOUISIANA_METISSAGE_HELP',			'AS2D_IF_LEVELUP'),
		('PROMOTION_GH_LOUISIANA_INDIGENOUS_ALLIES',	1,				0,					1,					0,					0,						0,				0,					0,					0,				0,						0,					0,				null,			0,					0,				'GH_LOUISIANA_PROMOTION_ATLAS',			'PEDIA_SCOUTING',		'TXT_KEY_PROMOTION_GH_LOUISIANA_INDIGENOUS_ALLIES',		'TXT_KEY_PROMOTION_GH_LOUISIANA_INDIGENOUS_ALLIES',		'TXT_KEY_PROMOTION_GH_LOUISIANA_INDIGENOUS_ALLIES_HELP',	'AS2D_IF_LEVELUP'),
		('PROMOTION_GH_LOUISIANA_GUIDE_AND_PEMMICAN',	1,				0,					2,					1,					0,						0,				10,					0,					0,				0,						0,					0,				null,			0,					0,				'GH_LOUISIANA_PROMOTION_ATLAS',			'PEDIA_SCOUTING',		'TXT_KEY_PROMOTION_GH_LOUISIANA_GUIDE_AND_PEMMICAN',	'TXT_KEY_PROMOTION_GH_LOUISIANA_GUIDE_AND_PEMMICAN',	'TXT_KEY_PROMOTION_GH_LOUISIANA_GUIDE_AND_PEMMICAN_HELP',	'AS2D_IF_LEVELUP');		

INSERT INTO UnitPromotions 
		(Type, 										Description, 											Help, 													Sound, 				RangeChange,	RangedAttackModifier,	MovesChange,	AttackMod,	DefenseMod, ExperiencePercent,	IgnoreZOC,	LostWithUpgrade,	CannotBeChosen, PortraitIndex, 	IconAtlas, 							PediaType,			PediaEntry)
VALUES	('PROMOTION_GH_LOUISIANA_KREWE_MARDIGRAS',	'TXT_KEY_PROMOTION_GH_LOUISIANA_KREWE_MARDIGRAS',		'TXT_KEY_PROMOTION_GH_LOUISIANA_KREWE_MARDIGRAS_HELP',	'AS2D_IF_LEVELUP',	0,				0,						0,				0,			0,			0,					0,			0,					1, 				7, 				'GH_LOUISIANA_PROMOTION_ATLAS', 	'PEDIA_CIVILIAN',	'TXT_KEY_PROMOTION_GH_LOUISIANA_KREWE_MARDIGRAS');
--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units
		(Type, 							Class, Cost,	Range, PrereqTech, Combat,	Moves,	BaseSightRange,		RequiresFaithPurchaseEnabled,	PurchaseOnly,	PurchaseCooldown,	NoBadGoodies,	AdvancedStartCost,	UnitEraUpgrade,	CombatClass, MilitarySupport, MilitaryProduction, Domain, Pillage, IgnoreBuildingDefense, XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, CombatLimit,	Description, 							Civilopedia, 										Help, 											Strategy,										MinAreaSize,	MoveRate,	ShowInPedia,	UnitArtInfo,						UnitArtInfoEraVariation,	UnitFlagIconOffset,		UnitFlagAtlas,			PortraitIndex, 	IconAtlas)
SELECT	'UNIT_GH_LOUISIANA_GVOYAGEUR',	Class, 300,		Range, PrereqTech, 8,		Moves,	BaseSightRange,		0,								1,				0,					NoBadGoodies,	-1,					1,				CombatClass, MilitarySupport, MilitaryProduction, Domain, Pillage, IgnoreBuildingDefense, XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, CombatLimit,	'TXT_KEY_UNIT_GH_LOUISIANA_GVOYAGEUR',	'TXT_KEY_CIV5_UNIT_GH_LOUISIANA_GVOYAGEUR_TEXT', 	'TXT_KEY_UNIT_GH_LOUISIANA_GVOYAGEUR_HELP', 	'TXT_KEY_UNIT_GH_LOUISIANA_GVOYAGEUR_STRATEGY',	MinAreaSize,	MoveRate,	ShowInPedia,	'ART_DEF_UNIT_LOUISIANA_GVOYAGEUR',	1,							0,						'GH_GVOYAGEUR_FLAG',	3, 				'GH_LOUISIANA_ATLAS'
FROM Units WHERE Type = 'UNIT_SHOSHONE_PATHFINDER';

INSERT INTO Units
		(Type, 						Class, Cost,  Moves, CivilianAttackPriority, Special, Domain, Capture,	CombatClass,	MinAreaSize,	NukeDamageLevel,	DefaultUnitAI, WorkRate, CombatLimit, OneShotTourism, OneShotTourismPercentOthers, TourismBonusTurns,	MoveRate, BaseSightRange,	UnitArtInfoEraVariation,	ShowInPedia,	PurchaseCooldown,	GlobalFaithPurchaseCooldown,	Description, 						Civilopedia, 									Help, 										Strategy,										AdvancedStartCost,	UnitArtInfo,					UnitFlagIconOffset,	UnitFlagAtlas,		PortraitIndex, 	IconAtlas)
SELECT	'UNIT_GH_LOUISIANA_KREWE',	Class, Cost,  Moves, CivilianAttackPriority, Special, Domain, Capture,	CombatClass,	MinAreaSize,	NukeDamageLevel,	DefaultUnitAI, WorkRate, CombatLimit, OneShotTourism, OneShotTourismPercentOthers, TourismBonusTurns,	MoveRate, BaseSightRange,	UnitArtInfoEraVariation,	ShowInPedia,	PurchaseCooldown,	GlobalFaithPurchaseCooldown,	'TXT_KEY_UNIT_GH_LOUISIANA_KREWE',	'TXT_KEY_CIV5_UNIT_GH_LOUISIANA_KREWE_TEXT', 	'TXT_KEY_UNIT_GH_LOUISIANA_KREWE_HELP', 	'TXT_KEY_UNIT_GH_LOUISIANA_KREWE_STRATEGY',		AdvancedStartCost, 	'ART_DEF_UNIT_LOUISIANA_KREWE',	0,					'GH_KREWE_FLAG',	5, 				'GH_LOUISIANA_ATLAS'
FROM Units WHERE Type = 'UNIT_MUSICIAN';
--==========================================================================================================================
-- Unit_EraCombatStrength
--==========================================================================================================================
INSERT INTO Unit_EraCombatStrength 	
		(UnitType, 						EraType,			CombatStrength)
SELECT	'UNIT_GH_LOUISIANA_GVOYAGEUR', 	'ERA_CLASSICAL',	Combat + 3
FROM Units WHERE Type = 'UNIT_SCOUT';

INSERT INTO Unit_EraCombatStrength 	
		(UnitType, 						EraType,			CombatStrength)
SELECT	'UNIT_GH_LOUISIANA_GVOYAGEUR', 	'ERA_MEDIEVAL',		Combat + 3
FROM Units WHERE Type = 'UNIT_EXPLORER';

INSERT INTO Unit_EraCombatStrength 
		(UnitType, 						EraType,			CombatStrength)
SELECT	'UNIT_GH_LOUISIANA_GVOYAGEUR', 	'ERA_RENAISSANCE',	Combat + 9
FROM Units WHERE Type = 'UNIT_EXPLORER';

INSERT INTO Unit_EraCombatStrength 	
		(UnitType, 						EraType,			CombatStrength)
SELECT	'UNIT_GH_LOUISIANA_GVOYAGEUR', 	'ERA_INDUSTRIAL',	Combat + 1
FROM Units WHERE Type = 'UNIT_COMMANDO';

CREATE TRIGGER GH_UpdateVoyageurCombat_HokathChange01
AFTER UPDATE OF Combat ON Units
WHEN NEW.Class = 'UNITCLASS_SCOUT'
BEGIN
    UPDATE Unit_EraCombatStrength SET CombatStrength = NEW.Combat + 3 WHERE UnitType = 'UNIT_GH_LOUISIANA_GVOYAGEUR' AND EraType = 'ERA_CLASSICAL';
END;

CREATE TRIGGER GH_UpdateVoyageurCombat_HokathChange02
AFTER UPDATE OF Combat ON Units
WHEN NEW.Class = 'UNITCLASS_EXPLORER'
BEGIN
    UPDATE Unit_EraCombatStrength SET CombatStrength = NEW.Combat + 3 WHERE UnitType = 'UNIT_GH_LOUISIANA_GVOYAGEUR' AND EraType = 'ERA_MEDIEVAL';
	UPDATE Unit_EraCombatStrength SET CombatStrength = NEW.Combat + 9 WHERE UnitType = 'UNIT_GH_LOUISIANA_GVOYAGEUR' AND EraType = 'ERA_RENAISSANCE';
END;

CREATE TRIGGER GH_UpdateVoyageurCombat_HokathChange03
AFTER UPDATE OF Combat ON Units
WHEN NEW.Class = 'UNITCLASS_COMMANDO'
BEGIN
    UPDATE Unit_EraCombatStrength SET CombatStrength = NEW.Combat + 1 WHERE UnitType = 'UNIT_GH_LOUISIANA_GVOYAGEUR' AND EraType = 'ERA_INDUSTRIAL';
END;
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions 	
		(UnitType, 							PromotionType)
VALUES	('UNIT_GH_LOUISIANA_GVOYAGEUR', 	'PROMOTION_RECONNAISSANCE'),
		('UNIT_GH_LOUISIANA_GVOYAGEUR', 	'PROMOTION_WITHDRAW_BEFORE_MELEE'),
		('UNIT_GH_LOUISIANA_GVOYAGEUR', 	'PROMOTION_GH_LOUISIANA_METISSAGE'),
		('UNIT_GH_LOUISIANA_GVOYAGEUR', 	'PROMOTION_GH_LOUISIANA_INDIGENOUS_ALLIES');
		
INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_GH_LOUISIANA_KREWE',		PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_MUSICIAN';

INSERT INTO Unit_FreePromotions
		(UnitType, 				PromotionType)
VALUES	('UNIT_GH_LOUISIANA_KREWE',	'PROMOTION_GH_LOUISIANA_KREWE_MARDIGRAS');
--==========================================================================================================================
-- Unit_EraUnitPromotions
--==========================================================================================================================		
INSERT INTO Unit_EraUnitPromotions 	
		(UnitType, 							PromotionType,								EraType, 			Value)
VALUES	('UNIT_GH_LOUISIANA_GVOYAGEUR', 	'PROMOTION_GH_LOUISIANA_ENGAGES',			'ERA_CLASSICAL',	1),
		('UNIT_GH_LOUISIANA_GVOYAGEUR', 	'PROMOTION_GH_LOUISIANA_INTERPRETE',		'ERA_MEDIEVAL',		1),
		('UNIT_GH_LOUISIANA_GVOYAGEUR', 	'PROMOTION_DEFENSIVE_EMBARKATION',			'ERA_MEDIEVAL',		1),
		('UNIT_GH_LOUISIANA_GVOYAGEUR', 	'PROMOTION_EMBARKED_SIGHT',					'ERA_MEDIEVAL',		1),
		('UNIT_GH_LOUISIANA_GVOYAGEUR', 	'PROMOTION_OCEAN_EXPLORER',					'ERA_MEDIEVAL',		1),
		('UNIT_GH_LOUISIANA_GVOYAGEUR', 	'PROMOTION_GH_LOUISIANA_PETITE_GUERRE',		'ERA_RENAISSANCE',	1),
		('UNIT_GH_LOUISIANA_GVOYAGEUR', 	'PROMOTION_GH_LOUISIANA_ENTREPRENEUR',		'ERA_INDUSTRIAL',	1),		
		('UNIT_GH_LOUISIANA_GVOYAGEUR', 	'PROMOTION_SCAVENGER',						'ERA_INDUSTRIAL',	1),		
		('UNIT_GH_LOUISIANA_GVOYAGEUR', 	'PROMOTION_COMMANDO',						'ERA_INDUSTRIAL',	1),
		('UNIT_GH_LOUISIANA_GVOYAGEUR', 	'PROMOTION_ATTACK_BONUS',					'ERA_INDUSTRIAL',	1);
--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================
INSERT INTO Unit_ClassUpgrades
		(UnitType,							UnitClassType)
SELECT	'UNIT_GH_LOUISIANA_GVOYAGEUR',		UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_COMMANDO';
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================
INSERT INTO UnitGameplay2DScripts
		(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT	'UNIT_GH_LOUISIANA_GVOYAGEUR', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_SHOSHONE_PATHFINDER';

INSERT INTO UnitGameplay2DScripts
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_GH_LOUISIANA_KREWE', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_MUSICIAN';
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================
INSERT INTO Unit_AITypes
		(UnitType, 						UnitAIType)
SELECT	'UNIT_GH_LOUISIANA_GVOYAGEUR', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_SHOSHONE_PATHFINDER';

INSERT INTO Unit_AITypes
		(UnitType, 				UnitAIType)
SELECT	'UNIT_GH_LOUISIANA_KREWE', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_MUSICIAN';
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors
		(UnitType, 						FlavorType, Flavor)
SELECT	'UNIT_GH_LOUISIANA_GVOYAGEUR', 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_EXPLORER');

INSERT INTO Unit_Flavors
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_GH_LOUISIANA_KREWE', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_MUSICIAN';
--==========================================================================================================================
-- Audio_Sounds
--==========================================================================================================================		
INSERT INTO Audio_Sounds 
		(SoundID, 					Filename, 		LoadType,		DontCache)		
VALUES	('SND_KREWE_K__001', 		'K__001', 		'Streamed',		1),
		('SND_KREWE_K__002', 		'K__002', 		'Streamed',		1),
		('SND_KREWE_K__003', 		'K__003', 		'Streamed',		1),
		('SND_KREWE_K__004', 		'K__004', 		'Streamed',		1),
		('SND_KREWE_K__005', 		'K__005', 		'Streamed',		1),
		('SND_KREWE_K__006', 		'K__006', 		'Streamed',		1),
		('SND_KREWE_K__007', 		'K__007', 		'Streamed',		1),
		('SND_KREWE_K__008', 		'K__008', 		'Streamed',		1),
		('SND_KREWE_K__009', 		'K__009', 		'Streamed',		1),
		('SND_KREWE_K__010', 		'K__010', 		'Streamed',		1),
		('SND_KREWE_K__011', 		'K__011', 		'Streamed',		1),		
		('SND_KREWE_K__012', 		'K__012', 		'Streamed',		1),
		('SND_KREWE_K__013', 		'K__013', 		'Streamed',		1),				
		('SND_KREWE_K__014', 		'K__014', 		'Streamed',		1),
		('SND_KREWE_K__015', 		'K__015', 		'Streamed',		1),				
		('SND_KREWE_K__016', 		'K__016', 		'Streamed',		1),
		('SND_KREWE_K__017', 		'K__017', 		'Streamed',		1),				
		('SND_KREWE_K__018', 		'K__018', 		'Streamed',		1),
		('SND_KREWE_K__019', 		'K__019', 		'Streamed',		1),				
		('SND_KREWE_K__020', 		'K__020', 		'Streamed',		1),				
		('SND_KREWE_K__021', 		'K__021', 		'Streamed',		1),
		('SND_KREWE_K__022', 		'K__022', 		'Streamed',		1),
		('SND_KREWE_K__023', 		'K__023', 		'Streamed',		1);		
--==========================================================================================================================
-- Audio_2DSounds
--==========================================================================================================================
INSERT INTO Audio_2DSounds	
		(ScriptID, 				SoundID, 				SoundType, 				TaperSoundtrackVolume)
VALUES	('AS2D_KREWE_K__001',	'SND_KREWE_K__001',		'GAME_MUSIC_STINGS', 	'0.0'),
		('AS2D_KREWE_K__002',	'SND_KREWE_K__002',		'GAME_MUSIC_STINGS', 	'0.0'),
		('AS2D_KREWE_K__003',	'SND_KREWE_K__003',		'GAME_MUSIC_STINGS', 	'0.0'),
		('AS2D_KREWE_K__004',	'SND_KREWE_K__004',		'GAME_MUSIC_STINGS', 	'0.0'),
		('AS2D_KREWE_K__005',	'SND_KREWE_K__005',		'GAME_MUSIC_STINGS', 	'0.0'),
		('AS2D_KREWE_K__006',	'SND_KREWE_K__006',		'GAME_MUSIC_STINGS', 	'0.0'),
		('AS2D_KREWE_K__007',	'SND_KREWE_K__007',		'GAME_MUSIC_STINGS', 	'0.0'),
		('AS2D_KREWE_K__008',	'SND_KREWE_K__008',		'GAME_MUSIC_STINGS', 	'0.0'),
		('AS2D_KREWE_K__009',	'SND_KREWE_K__009',		'GAME_MUSIC_STINGS', 	'0.0'),
		('AS2D_KREWE_K__010',	'SND_KREWE_K__010',		'GAME_MUSIC_STINGS', 	'0.0'),
		('AS2D_KREWE_K__011',	'SND_KREWE_K__011',		'GAME_MUSIC_STINGS', 	'0.0'),		
		('AS2D_KREWE_K__012',	'SND_KREWE_K__012',		'GAME_MUSIC_STINGS', 	'0.0'),		
		('AS2D_KREWE_K__013',	'SND_KREWE_K__013',		'GAME_MUSIC_STINGS', 	'0.0'),		
		('AS2D_KREWE_K__014',	'SND_KREWE_K__014',		'GAME_MUSIC_STINGS', 	'0.0'),		
		('AS2D_KREWE_K__015',	'SND_KREWE_K__015',		'GAME_MUSIC_STINGS', 	'0.0'),
		('AS2D_KREWE_K__016',	'SND_KREWE_K__016',		'GAME_MUSIC_STINGS', 	'0.0'),		
		('AS2D_KREWE_K__017',	'SND_KREWE_K__017',		'GAME_MUSIC_STINGS', 	'0.0'),		
		('AS2D_KREWE_K__018',	'SND_KREWE_K__018',		'GAME_MUSIC_STINGS', 	'0.0'),		
		('AS2D_KREWE_K__019',	'SND_KREWE_K__019',		'GAME_MUSIC_STINGS', 	'0.0'),
		('AS2D_KREWE_K__020',	'SND_KREWE_K__020',		'GAME_MUSIC_STINGS', 	'0.0'),		
		('AS2D_KREWE_K__021',	'SND_KREWE_K__021',		'GAME_MUSIC_STINGS', 	'0.0'),		
		('AS2D_KREWE_K__022',	'SND_KREWE_K__022',		'GAME_MUSIC_STINGS', 	'0.0'),
		('AS2D_KREWE_K__023',	'SND_KREWE_K__023',		'GAME_MUSIC_STINGS', 	'0.0');
--==========================================================================================================================
-- GreatWorks
--==========================================================================================================================
INSERT INTO GreatWorks
		(Type, GreatWorkClassType, Description, Audio, Image)
VALUES	('GREAT_WORK_SK_001', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_SK_001', 'AS2D_KREWE_K__001', 'BG_01_Allen_Toussaint.dds'),
		('GREAT_WORK_SK_002', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_SK_002', 'AS2D_KREWE_K__002', 'BG_Cajun.dds'),
		('GREAT_WORK_SK_003', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_SK_003', 'AS2D_KREWE_K__003', 'BG_03_Aurora_Nealand.dds'),
		('GREAT_WORK_SK_004', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_SK_004', 'AS2D_KREWE_K__004', 'BG_Cajun_Zydeco.dds'),
		('GREAT_WORK_SK_005', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_SK_005', 'AS2D_KREWE_K__005', 'BG_05_Clifton_Chenier.dds'),
		('GREAT_WORK_SK_006', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_SK_006', 'AS2D_KREWE_K__006', 'BG_06_Creedence_Clearwater_Revival.dds'),
		('GREAT_WORK_SK_007', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_SK_007', 'AS2D_KREWE_K__007', 'BG_07_Dr_John.dds'),
		('GREAT_WORK_SK_008', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_SK_008', 'AS2D_KREWE_K__008', 'BG_08_Rod_Bernard.dds'),
		('GREAT_WORK_SK_009', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_SK_009', 'AS2D_KREWE_K__009', 'BG_09_Fat_Domino.dds'),
		('GREAT_WORK_SK_010', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_SK_010', 'AS2D_KREWE_K__010', 'BG_10_Jelly_Roll_Morton.dds'),
		('GREAT_WORK_SK_011', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_SK_011', 'AS2D_KREWE_K__011', 'BG_Cajun_Zydeco.dds'),
		('GREAT_WORK_SK_012', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_SK_012', 'AS2D_KREWE_K__012', 'BG_12_Kid_Ory.dds'),
		('GREAT_WORK_SK_013', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_SK_013', 'AS2D_KREWE_K__013', 'BG_13_Lightnin_slim.dds'),
		('GREAT_WORK_SK_014', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_SK_014', 'AS2D_KREWE_K__014', 'BG_14_Louis_Armstrong.dds'),
		('GREAT_WORK_SK_015', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_SK_015', 'AS2D_KREWE_K__015', 'BG_15_Mahalia_Jackson.dds'),
		('GREAT_WORK_SK_016', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_SK_016', 'AS2D_KREWE_K__016', 'BG_16_Professor_Longhair.dds'),
		('GREAT_WORK_SK_017', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_SK_017', 'AS2D_KREWE_K__017', 'BG_Blues.dds'),
		('GREAT_WORK_SK_018', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_SK_018', 'AS2D_KREWE_K__018', 'BG_18_Sydney_Bechet.dds'),
		('GREAT_WORK_SK_019', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_SK_019', 'AS2D_KREWE_K__019', 'BG_19_The_Meters.dds'),
		('GREAT_WORK_SK_020', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_SK_020', 'AS2D_KREWE_K__020', 'BG_Cajun.dds'),
		('GREAT_WORK_SK_021', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_SK_021', 'AS2D_KREWE_K__021', 'BG_21_Zachary_Richard.dds'),
		('GREAT_WORK_SK_022', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_SK_022', 'AS2D_KREWE_K__022', 'BG_22_Zydeco_Joe.dds'),
		('GREAT_WORK_SK_023', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_SK_023', 'AS2D_KREWE_K__023', 'BG_23_Jon_Batiste.dds');
--==========================================================================================================================
-- Unit_UniqueNames
--==========================================================================================================================
INSERT INTO Unit_UniqueNames
		(UnitType,							UniqueName)
VALUES	('UNIT_GH_LOUISIANA_GVOYAGEUR',		'TXT_KEY_GH_GVOYAGEUR__001'),
		('UNIT_GH_LOUISIANA_GVOYAGEUR',		'TXT_KEY_GH_GVOYAGEUR__002'),
		('UNIT_GH_LOUISIANA_GVOYAGEUR',		'TXT_KEY_GH_GVOYAGEUR__003'),
		('UNIT_GH_LOUISIANA_GVOYAGEUR',		'TXT_KEY_GH_GVOYAGEUR__004'),
		('UNIT_GH_LOUISIANA_GVOYAGEUR',		'TXT_KEY_GH_GVOYAGEUR__005'),
		('UNIT_GH_LOUISIANA_GVOYAGEUR',		'TXT_KEY_GH_GVOYAGEUR__006'),
		('UNIT_GH_LOUISIANA_GVOYAGEUR',		'TXT_KEY_GH_GVOYAGEUR__007'),
		('UNIT_GH_LOUISIANA_GVOYAGEUR',		'TXT_KEY_GH_GVOYAGEUR__008'),
		('UNIT_GH_LOUISIANA_GVOYAGEUR',		'TXT_KEY_GH_GVOYAGEUR__009'),
		('UNIT_GH_LOUISIANA_GVOYAGEUR',		'TXT_KEY_GH_GVOYAGEUR__010'),
		('UNIT_GH_LOUISIANA_GVOYAGEUR',		'TXT_KEY_GH_GVOYAGEUR__011'),
		('UNIT_GH_LOUISIANA_GVOYAGEUR',		'TXT_KEY_GH_GVOYAGEUR__012'),
		('UNIT_GH_LOUISIANA_GVOYAGEUR',		'TXT_KEY_GH_GVOYAGEUR__013'),
		('UNIT_GH_LOUISIANA_GVOYAGEUR',		'TXT_KEY_GH_GVOYAGEUR__014'),
		('UNIT_GH_LOUISIANA_GVOYAGEUR',		'TXT_KEY_GH_GVOYAGEUR__015'),
		('UNIT_GH_LOUISIANA_GVOYAGEUR',		'TXT_KEY_GH_GVOYAGEUR__016'),
		('UNIT_GH_LOUISIANA_GVOYAGEUR',		'TXT_KEY_GH_GVOYAGEUR__017'),
		('UNIT_GH_LOUISIANA_GVOYAGEUR',		'TXT_KEY_GH_GVOYAGEUR__018'),
		('UNIT_GH_LOUISIANA_GVOYAGEUR',		'TXT_KEY_GH_GVOYAGEUR__019'),
		('UNIT_GH_LOUISIANA_GVOYAGEUR',		'TXT_KEY_GH_GVOYAGEUR__020'),
		('UNIT_GH_LOUISIANA_GVOYAGEUR',		'TXT_KEY_GH_GVOYAGEUR__021'),		
		('UNIT_GH_LOUISIANA_GVOYAGEUR',		'TXT_KEY_GH_GVOYAGEUR__022'),
		('UNIT_GH_LOUISIANA_GVOYAGEUR',		'TXT_KEY_GH_GVOYAGEUR__023');

INSERT INTO Unit_UniqueNames 	
		(UnitType, 				UniqueName,						GreatWorkType)
VALUES	('UNIT_GH_LOUISIANA_KREWE',	'TXT_KEY_GREAT_PERSON_K__001',	'GREAT_WORK_SK_001'),
		('UNIT_GH_LOUISIANA_KREWE',	'TXT_KEY_GREAT_PERSON_K__002',	'GREAT_WORK_SK_002'),
		('UNIT_GH_LOUISIANA_KREWE',	'TXT_KEY_GREAT_PERSON_K__003',	'GREAT_WORK_SK_003'),
		('UNIT_GH_LOUISIANA_KREWE',	'TXT_KEY_GREAT_PERSON_K__004',	'GREAT_WORK_SK_004'),
		('UNIT_GH_LOUISIANA_KREWE',	'TXT_KEY_GREAT_PERSON_K__005',	'GREAT_WORK_SK_005'),
		('UNIT_GH_LOUISIANA_KREWE',	'TXT_KEY_GREAT_PERSON_K__006',	'GREAT_WORK_SK_006'),
		('UNIT_GH_LOUISIANA_KREWE',	'TXT_KEY_GREAT_PERSON_K__007',	'GREAT_WORK_SK_007'),
		('UNIT_GH_LOUISIANA_KREWE',	'TXT_KEY_GREAT_PERSON_K__008',	'GREAT_WORK_SK_008'),
		('UNIT_GH_LOUISIANA_KREWE',	'TXT_KEY_GREAT_PERSON_K__009',	'GREAT_WORK_SK_009'),
		('UNIT_GH_LOUISIANA_KREWE',	'TXT_KEY_GREAT_PERSON_K__010',	'GREAT_WORK_SK_010'),
		('UNIT_GH_LOUISIANA_KREWE',	'TXT_KEY_GREAT_PERSON_K__011',	'GREAT_WORK_SK_011'),
		('UNIT_GH_LOUISIANA_KREWE',	'TXT_KEY_GREAT_PERSON_K__012',	'GREAT_WORK_SK_012'),
		('UNIT_GH_LOUISIANA_KREWE',	'TXT_KEY_GREAT_PERSON_K__013',	'GREAT_WORK_SK_013'),
		('UNIT_GH_LOUISIANA_KREWE',	'TXT_KEY_GREAT_PERSON_K__014',	'GREAT_WORK_SK_014'),
		('UNIT_GH_LOUISIANA_KREWE',	'TXT_KEY_GREAT_PERSON_K__015',	'GREAT_WORK_SK_015'),
		('UNIT_GH_LOUISIANA_KREWE',	'TXT_KEY_GREAT_PERSON_K__016',	'GREAT_WORK_SK_016'),
		('UNIT_GH_LOUISIANA_KREWE',	'TXT_KEY_GREAT_PERSON_K__017',	'GREAT_WORK_SK_017'),
		('UNIT_GH_LOUISIANA_KREWE',	'TXT_KEY_GREAT_PERSON_K__018',	'GREAT_WORK_SK_018'),
		('UNIT_GH_LOUISIANA_KREWE',	'TXT_KEY_GREAT_PERSON_K__019',	'GREAT_WORK_SK_019'),
		('UNIT_GH_LOUISIANA_KREWE',	'TXT_KEY_GREAT_PERSON_K__020',	'GREAT_WORK_SK_020'),
		('UNIT_GH_LOUISIANA_KREWE',	'TXT_KEY_GREAT_PERSON_K__021',	'GREAT_WORK_SK_021'),
		('UNIT_GH_LOUISIANA_KREWE',	'TXT_KEY_GREAT_PERSON_K__022',	'GREAT_WORK_SK_022'),
		('UNIT_GH_LOUISIANA_KREWE',	'TXT_KEY_GREAT_PERSON_K__023',	'GREAT_WORK_SK_023');
--==========================================================================================================================
-- Resources
--==========================================================================================================================
INSERT INTO Resources 
			(Type,						Description,						Civilopedia, 								Help,									ArtDefineTag,					ResourceClassType, 		TechReveal,	TechCityTrade,		Happiness,  AITradeModifier, 	ResourceUsage,	AIObjective,	'Unique', 	IconString, 				PortraitIndex, 	IconAtlas,						IsMonopoly)
VALUES		('RESOURCE_SHRIMP',			'TXT_KEY_RESOURCE_SHRIMP',			'TXT_KEY_CIV5_RESOURCE_SHRIMP_TEXT',		'TXT_KEY_RESOURCE_MONOPOLY_SHRIMP',		'ART_DEF_RESOURCE_SHRIMP',		'RESOURCECLASS_LUXURY',	null,		'TECH_CURRENCY',	2,			0,					2, 				1, 				0, 			'[ICON_RES_SHRIMP]',		0, 				'RESOURCE_GH_LOUISIANA_ATLAS', 	1);
--==========================================================================================================================
-- Resource_YieldChangeFromMonopoly
--==========================================================================================================================
INSERT INTO Resource_YieldChangeFromMonopoly 	
			(ResourceType, 				YieldType, 			Yield)
VALUES		('RESOURCE_SHRIMP',			'YIELD_FOOD',		1),
			('RESOURCE_SHRIMP',			'YIELD_CULTURE',	1);
--==========================================================================================================================
-- Resource_Flavors
--==========================================================================================================================
INSERT INTO Resource_Flavors 	
			(ResourceType, 			FlavorType, 				Flavor)
SELECT		'RESOURCE_SHRIMP', 		FlavorType, 				Flavor
FROM Resource_Flavors WHERE ResourceType = 'RESOURCE_CRAB';
--==========================================================================================================================
-- Resource_CityYieldModFromMonopoly
--==========================================================================================================================
INSERT INTO Resource_CityYieldModFromMonopoly
		(ResourceType, 		YieldType, 		Yield)
VALUES	('RESOURCE_SHRIMP', 'YIELD_GOLD', 	10);
--==========================================================================================================================
-- Corporation_ResourceMonopolyOrs
--==========================================================================================================================
INSERT INTO Corporation_ResourceMonopolyOrs 	
		(CorporationType, 			ResourceType)
SELECT	CorporationType,			'RESOURCE_SHRIMP'
FROM Corporation_ResourceMonopolyOrs WHERE ResourceType = 'RESOURCE_CRAB';
--==========================================================================================================================
-- Corporation_ResourceYieldChanges
--==========================================================================================================================
INSERT INTO Corporation_ResourceYieldChanges 	
		(CorporationType, 			ResourceType,			YieldType,	Yield)
SELECT	CorporationType,			'RESOURCE_SHRIMP',		YieldType,	Yield
FROM Corporation_ResourceYieldChanges WHERE ResourceType = 'RESOURCE_CRAB';
--==========================================================================================================================
-- Builds
--==========================================================================================================================
INSERT INTO Builds
		(Type,								PrereqTech,			ImprovementType,						Time,	Recommendation,									Description,								Help,											CtrlDown,	OrderPriority,	IconIndex,	IconAtlas,				HotKey, EntityEvent,	ShowInPedia,	ShowInTechTree)
SELECT	'BUILD_GH_LOUISIANA_CAJUN_CABIN',	'TECH_CURRENCY',	'IMPROVEMENT_GH_LOUISIANA_CAJUN_CABIN',	Time,	'TXT_KEY_BUILD_GH_LOUISIANA_CAJUN_CABIN_REC',	'TXT_KEY_BUILD_GH_LOUISIANA_CAJUN_CABIN',	'TXT_KEY_BUILD_GH_LOUISIANA_CAJUN_CABIN_HELP',	CtrlDown,	OrderPriority,	7,			'GH_LOUISIANA_ATLAS',	HotKey,	EntityEvent,	ShowInPedia,	ShowInTechTree
FROM Builds WHERE Type = 'BUILD_BRAZILWOOD_CAMP';
--==========================================================================================================================
-- Unit_Builds
--==========================================================================================================================
INSERT INTO Unit_Builds 
		(UnitType, 			BuildType)
VALUES	('UNIT_WORKER',		'BUILD_GH_LOUISIANA_CAJUN_CABIN');
--==========================================================================================================================
-- Improvements
--==========================================================================================================================
INSERT INTO Improvements
		(Type,										SpecificCivRequired,		CivilizationType,				GoldMaintenance,	NoTwoAdjacent,	DefenseModifier,	RequiresFeature,	Coastal,	RequiresFlatlands,	ImprovementResource,	ImprovementResourceQuantity,	Description,									Civilopedia,												Help,													ArtDefineTag,										BuildableOnResources,	DestroyedWhenPillaged,	Permanent,	PillageGold,	OwnerOnly,	PortraitIndex,	IconAtlas)
SELECT	'IMPROVEMENT_GH_LOUISIANA_CAJUN_CABIN',		SpecificCivRequired,		'CIVILIZATION_GH_LOUISIANA',	GoldMaintenance,	NoTwoAdjacent,	DefenseModifier,	RequiresFeature,	1,			1,					'RESOURCE_SHRIMP',		1,								'TXT_KEY_IMPROVEMENT_GH_LOUISIANA_CAJUN_CABIN',	'TXT_KEY_CIV5_IMPROVEMENT_GH_LOUISIANA_CAJUN_CABIN_TEXT',	'TXT_KEY_IMPROVEMENT_GH_LOUISIANA_CAJUN_CABIN_HELP',	'ART_DEF_IMPROVEMENT_GH_LOUISIANA_CAJUN_CABIN',		BuildableOnResources,	DestroyedWhenPillaged,	Permanent,	PillageGold,	OwnerOnly,	6,				'GH_LOUISIANA_ATLAS'
FROM Improvements WHERE Type = 'IMPROVEMENT_BRAZILWOOD_CAMP';
--==========================================================================================================================
-- Improvement_ValidFeatures
--==========================================================================================================================
INSERT INTO Improvement_ValidFeatures 	
		(ImprovementType, 							FeatureType)
VALUES	('IMPROVEMENT_GH_LOUISIANA_CAJUN_CABIN',	'FEATURE_MARSH'),
		('IMPROVEMENT_GH_LOUISIANA_CAJUN_CABIN',	'FEATURE_JUNGLE'),
		('IMPROVEMENT_GH_LOUISIANA_CAJUN_CABIN',	'FEATURE_FOREST');
--==========================================================================================================================
-- Improvement_ResourceTypes
--==========================================================================================================================
INSERT INTO Improvement_ResourceTypes
		(ImprovementType, 							ResourceType, 		ResourceMakesValid, ResourceTrade)
VALUES	('IMPROVEMENT_GH_LOUISIANA_CAJUN_CABIN',	'RESOURCE_SHRIMP', 	1,					1);
--==========================================================================================================================
-- Improvement_Yields
--==========================================================================================================================
INSERT INTO Improvement_Yields
		(ImprovementType,							YieldType,				Yield)
VALUES	('IMPROVEMENT_GH_LOUISIANA_CAJUN_CABIN',	'YIELD_GOLD',			1),
		('IMPROVEMENT_GH_LOUISIANA_CAJUN_CABIN',	'YIELD_PRODUCTION',		1),
		('IMPROVEMENT_GH_LOUISIANA_CAJUN_CABIN',	'YIELD_FAITH',			1),
		('IMPROVEMENT_GH_LOUISIANA_CAJUN_CABIN',	'YIELD_FOOD',			1);		
--==========================================================================================================================
-- Improvement_TechYieldChanges
--==========================================================================================================================
INSERT INTO Improvement_TechYieldChanges
		(ImprovementType,							TechType,				YieldType, 				Yield)
VALUES	('IMPROVEMENT_GH_LOUISIANA_CAJUN_CABIN',	'TECH_GUILDS',			'YIELD_GOLD',			1),
		('IMPROVEMENT_GH_LOUISIANA_CAJUN_CABIN',	'TECH_GUILDS', 			'YIELD_PRODUCTION',		1),
		('IMPROVEMENT_GH_LOUISIANA_CAJUN_CABIN',	'TECH_ACOUSTICS',		'YIELD_GOLD',			1),
		('IMPROVEMENT_GH_LOUISIANA_CAJUN_CABIN',	'TECH_ACOUSTICS',		'YIELD_CULTURE',		1),
		('IMPROVEMENT_GH_LOUISIANA_CAJUN_CABIN',	'TECH_RADIO',			'YIELD_CULTURE',		2);
--==========================================================================================================================
-- Improvement_Flavors
--==========================================================================================================================
INSERT INTO Improvement_Flavors
		(ImprovementType,							FlavorType,					Flavor)
VALUES	('IMPROVEMENT_GH_LOUISIANA_CAJUN_CABIN',	'FLAVOR_GREAT_PEOPLE',		70),
		('IMPROVEMENT_GH_LOUISIANA_CAJUN_CABIN',	'FLAVOR_GOLD',				60),
		('IMPROVEMENT_GH_LOUISIANA_CAJUN_CABIN',	'FLAVOR_CULTURE',			60),
		('IMPROVEMENT_GH_LOUISIANA_CAJUN_CABIN',	'FLAVOR_PRODUCTION',		50),
		('IMPROVEMENT_GH_LOUISIANA_CAJUN_CABIN',	'FLAVOR_RELIGION',			50);
--==========================================================================================================================
-- Policy_ImprovementYieldChanges
--==========================================================================================================================
INSERT INTO Policy_ImprovementYieldChanges
		(PolicyType,	ImprovementType,							YieldType, Yield)
SELECT	PolicyType,		'IMPROVEMENT_GH_LOUISIANA_CAJUN_CABIN',		YieldType, Yield
FROM Policy_ImprovementYieldChanges WHERE ImprovementType = 'IMPROVEMENT_BRAZILWOOD_CAMP';
--==========================================================================================================================
-- BuildingClasses
--==========================================================================================================================
INSERT INTO BuildingClasses
		(Type,													DefaultBuilding,									Description,											NoLimit)
VALUES	('BUILDINGCLASS_MUSIC_FOR_CAJUN_CABIN',					'BUILDING_MUSIC_FOR_CAJUN_CABIN',					'TXT_KEY_BUILDING_MUSIC_FOR_CAJUN_CABIN',				0),
		('BUILDINGCLASS_NO_UNIT_PROD_FOR_CITIES',				'BUILDING_NO_UNIT_PROD_FOR_CITIES',					'TXT_KEY_BUILDING_NO_UNIT_PROD_FOR_CITIES',				1),
		('BUILDINGCLASS_XP_FROM_CS_FOR_CITIES',					'BUILDING_XP_FROM_CS_FOR_CITIES',					'TXT_KEY_BUILDING_XP_FROM_CS_FOR_CITIES',				1),
		('BUILDINGCLASS_D_GH_LOUISIANA_FOR_VIEUXCARRE_WLTKD',	'BUILDING_D_GH_LOUISIANA_FOR_VIEUXCARRE_WLTKD',		'TXT_KEY_BUILDING_D_GH_LOUISIANA_FOR_VIEUXCARRE_WLTKD',	1),
		('BUILDINGCLASS_D_GH_LOUISIANA_FOR_VIEUXCARRE_BUILD',	'BUILDING_D_GH_LOUISIANA_FOR_VIEUXCARRE_BUILD',		'TXT_KEY_BUILDING_D_GH_LOUISIANA_FOR_VIEUXCARRE_BUILD',	1),
		('BUILDINGCLASS_D_GH_LOUISIANA_FROM_KREWE',				'BUILDING_D_GH_LOUISIANA_FROM_KREWE',				'TXT_KEY_BUILDING_D_GH_LOUISIANA_FROM_KREWE',			1);
--==========================================================================================================================
-- Buildings
--==========================================================================================================================
INSERT INTO Buildings
		(Type,									BuildingClass,								Description,								SpecialistType,			SpecialistCount,	CapitalOnly,		GoldMaintenance,	Cost,	FaithCost,	GreatWorkSlotType,			GreatWorkCount, NeverCapture,	NukeImmune, ConquestProb,	HurryCostModifier,	IconAtlas,				PortraitIndex,	ShowInPedia)
VALUES	('BUILDING_MUSIC_FOR_CAJUN_CABIN',		'BUILDINGCLASS_MUSIC_FOR_CAJUN_CABIN',		'TXT_KEY_BUILDING_MUSIC_FOR_CAJUN_CABIN',	'SPECIALIST_MUSICIAN',	1,					0,					0,					-1,		-1,			'GREAT_WORK_SLOT_MUSIC',	1, 				1,				1, 			0, 				-1,					'GH_LOUISIANA_ATLAS',	1,				1),
		('BUILDING_NO_UNIT_PROD_FOR_CITIES',	'BUILDINGCLASS_NO_UNIT_PROD_FOR_CITIES',	'TXT_KEY_BUILDING_NO_UNIT_PROD_FOR_CITIES',	null,					0,					0,					0,					-1,		-1,			null,						-1, 			1,				1, 			0, 				-1,					'CIV_COLOR_ATLAS',		0,				0),
		('BUILDING_XP_FROM_CS_FOR_CITIES',		'BUILDINGCLASS_XP_FROM_CS_FOR_CITIES',		'TXT_KEY_BUILDING_XP_FROM_CS_FOR_CITIES',	null,					0,					1,					0,					-1,		-1,			null,						-1, 			1,				1, 			0, 				-1,					'CIV_COLOR_ATLAS',		0,				0);
		
INSERT INTO	Buildings
		(Type, 								Description,								Civilopedia,										Strategy,											Help,												ThemingBonusHelp,										GoldMaintenance, Cost,	HurryCostModifier, MinAreaSize, ConquestProb,	BuildingClass, ArtDefineTag, PrereqTech, 		PortraitIndex,	IconAtlas,				NeverCapture, NukeImmune, NumCityCostMod,	GreatWorkSlotType,			GreatWorkCount,	SpecialistType,			GreatPeopleRateChange,	BoredomFlatReductionGlobal,	ReligiousUnrestFlatReductionGlobal,	CultureRateModifier,	GreatPeopleRateModifier,	NationalPopRequired)
SELECT	'BUILDING_GH_LOUISIANA_VIEUXCARRE',	'TXT_KEY_BUILDING_GH_LOUISIANA_VIEUXCARRE',	'TXT_KEY_BUILDING_GH_LOUISIANA_VIEUXCARRE_TEXT',	'TXT_BUILDING_GH_LOUISIANA_VIEUXCARRE_STRATEGY',	'TXT_KEY_BUILDING_GH_LOUISIANA_VIEUXCARRE_HELP',	'TXT_KEY_GH_LOUISIANA_VIEUXCARRE_THEMING_BONUS_HELP',	GoldMaintenance, Cost,	HurryCostModifier, MinAreaSize, ConquestProb,	BuildingClass, ArtDefineTag, 'TECH_ACOUSTICS',	2,				'GH_LOUISIANA_ATLAS',	NeverCapture, NukeImmune, 0,				'GREAT_WORK_SLOT_MUSIC',	GreatWorkCount,	'SPECIALIST_MUSICIAN',	3,						BoredomFlatReductionGlobal,	1,									CultureRateModifier,	25,							0
FROM	Buildings WHERE Type = 'BUILDING_HERMITAGE';

INSERT INTO Buildings
		(Type, 						 						BuildingClass, 											Cost,	FaithCost,	GreatWorkCount,	NeverCapture,	NukeImmune, ConquestProb,	HurryCostModifier,	MinAreaSize,	IconAtlas,			PortraitIndex,	IsDummy,	Description)
VALUES	('BUILDING_D_GH_LOUISIANA_FOR_VIEUXCARRE_WLTKD', 	'BUILDINGCLASS_D_GH_LOUISIANA_FOR_VIEUXCARRE_WLTKD',	-1,		-1,			-1,				1,				1,			0,				-1,					-1,				'CIV_COLOR_ATLAS',	0,				1,			'TXT_KEY_BUILDING_D_GH_LOUISIANA_FOR_VIEUXCARRE_WLTKD'),
		('BUILDING_D_GH_LOUISIANA_FOR_VIEUXCARRE_BUILD', 	'BUILDINGCLASS_D_GH_LOUISIANA_FOR_VIEUXCARRE_BUILD',	-1,		-1,			-1,				1,				1,			0,				-1,					-1,				'CIV_COLOR_ATLAS',	0,				1,			'TXT_KEY_BUILDING_D_GH_LOUISIANA_FOR_VIEUXCARRE_BUILD'),
		('BUILDING_D_GH_LOUISIANA_FROM_KREWE', 				'BUILDINGCLASS_D_GH_LOUISIANA_FROM_KREWE',				-1,		-1,			-1,				1,				1,			0,				-1,					-1,				'CIV_COLOR_ATLAS',	0,				1,			'TXT_KEY_BUILDING_D_GH_LOUISIANA_FROM_KREWE');
--==========================================================================================================================
-- Building_UnitCombatProductionModifiers
--==========================================================================================================================
INSERT INTO Building_UnitCombatProductionModifiers
		(BuildingType,										UnitCombatType,			Modifier)
VALUES	('BUILDING_NO_UNIT_PROD_FOR_CITIES',				'UNITCOMBAT_ARCHER',	-99999),
		('BUILDING_NO_UNIT_PROD_FOR_CITIES',				'UNITCOMBAT_ARMOR',		-99999),
		('BUILDING_NO_UNIT_PROD_FOR_CITIES',				'UNITCOMBAT_GUN',		-99999),
		('BUILDING_NO_UNIT_PROD_FOR_CITIES',				'UNITCOMBAT_MELEE',		-99999),
		('BUILDING_NO_UNIT_PROD_FOR_CITIES',				'UNITCOMBAT_MOUNTED',	-99999),
		('BUILDING_NO_UNIT_PROD_FOR_CITIES',				'UNITCOMBAT_RECON',		-99999),
		('BUILDING_NO_UNIT_PROD_FOR_CITIES',				'UNITCOMBAT_SIEGE',		-99999),
		('BUILDING_D_GH_LOUISIANA_FOR_VIEUXCARRE_WLTKD',	'UNITCOMBAT_DIPLOMACY',		50);
------------------------------	
--Building_DomainFreeExperiencesGlobal
------------------------------	
INSERT INTO Building_DomainFreeExperiencesGlobal
		(BuildingType,						DomainType,		Experience)
VALUES	('BUILDING_XP_FROM_CS_FOR_CITIES',	'DOMAIN_LAND',	5),
		('BUILDING_XP_FROM_CS_FOR_CITIES',	'DOMAIN_SEA',	5),
		('BUILDING_XP_FROM_CS_FOR_CITIES',	'DOMAIN_AIR',	5);
------------------------------	
-- Building_UnitCombatProductionModifiers
------------------------------	
INSERT INTO Building_UnitCombatProductionModifiers
		(BuildingType,										UnitCombatType,				Modifier)
VALUES	('BUILDING_D_GH_LOUISIANA_FOR_VIEUXCARRE_WLTKD',	'UNITCOMBAT_DIPLOMACY',		50);
------------------------------	
-- Building_SpecialistYieldChanges
------------------------------	
INSERT INTO Building_SpecialistYieldChanges
		(BuildingType,							SpecialistType, 				YieldType,			Yield)
VALUES	('BUILDING_GH_LOUISIANA_VIEUXCARRE',	'SPECIALIST_CIVIL_SERVANT',		'YIELD_TOURISM',	1),
		('BUILDING_GH_LOUISIANA_VIEUXCARRE',	'SPECIALIST_MERCHANT',			'YIELD_TOURISM',	1),
		('BUILDING_GH_LOUISIANA_VIEUXCARRE',	'SPECIALIST_MUSICIAN',			'YIELD_TOURISM',	1);
------------------------------	
-- Building_YieldChangesPerPop
------------------------------	
INSERT INTO Building_YieldChangesPerPop 
		(BuildingType,							YieldType,			Yield)
SELECT	'BUILDING_GH_LOUISIANA_VIEUXCARRE',		YieldType,			Yield
FROM Building_YieldChangesPerPop WHERE BuildingType = 'BUILDING_HERMITAGE';
------------------------------	
-- Building_GreatWorkYieldChangesLocal
------------------------------	
INSERT INTO Building_GreatWorkYieldChangesLocal 
		(BuildingType,							YieldType,			Yield)
VALUES	('BUILDING_GH_LOUISIANA_VIEUXCARRE',	'YIELD_TOURISM',	1);
------------------------------	
-- Building_ResourceQuantity
------------------------------	
INSERT INTO Building_ResourceQuantity	
		(BuildingType,							ResourceType,		Quantity)
VALUES	('BUILDING_GH_LOUISIANA_VIEUXCARRE',	'RESOURCE_PAPER',	1);
------------------------------	
-- Building_ThemingBonuses
------------------------------
INSERT INTO Building_ThemingBonuses 
		(BuildingType,							Description,										Bonus,	ConsecutiveEras,	RequiresOwner,	AIPriority)
VALUES	('BUILDING_GH_LOUISIANA_VIEUXCARRE',	'TXT_KEY_THEMING_BONUS_GH_LOUISIANA_VIEUXCARRE',	15,		1,					1,				5);
------------------------------	
-- Building_ThemingYieldBonus
------------------------------	
INSERT INTO Building_ThemingYieldBonus 
		(BuildingType,							YieldType,			Yield) 
VALUES	('BUILDING_GH_LOUISIANA_VIEUXCARRE',	'YIELD_GOLD',		10),
		('BUILDING_GH_LOUISIANA_VIEUXCARRE',	'YIELD_CULTURE',	10);
------------------------------	
-- Building_Flavors
------------------------------	
INSERT INTO Building_Flavors 	
		(BuildingType, 							FlavorType,			Flavor)
SELECT	'BUILDING_GH_LOUISIANA_VIEUXCARRE',		FlavorType,			Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_HERMITAGE';

INSERT INTO Building_Flavors
		(BuildingType, 							FlavorType,				Flavor)
VALUES	('BUILDING_GH_LOUISIANA_VIEUXCARRE',	'FLAVOR_GREAT_PEOPLE',	50);
------------------------------	
-- Building_BuildingClassYieldChanges
------------------------------		
INSERT INTO Building_BuildingClassYieldChanges 
		(BuildingType,							BuildingClassType,		YieldType,			YieldChange) 		
SELECT	'BUILDING_D_GH_LOUISIANA_FROM_KREWE',	BuildingClass,			'YIELD_TOURISM',	1
FROM	Buildings WHERE (SpecialistType = 'SPECIALIST_MUSICIAN' OR SpecialistType = 'SPECIALIST_MERCHANT' OR SpecialistType = 'SPECIALIST_CIVIL_SERVANT' OR GreatWorkSlotType ='GREAT_WORK_SLOT_MUSIC');
------------------------------	
-- Building_ImprovementYieldChangesGlobal
------------------------------	
INSERT INTO Building_ImprovementYieldChangesGlobal 
		(BuildingType,							ImprovementType,						YieldType,			Yield) 
VALUES	('BUILDING_D_GH_LOUISIANA_FROM_KREWE',	'IMPROVEMENT_GH_LOUISIANA_CAJUN_CABIN',	'YIELD_TOURISM',	1);
--==========================================================================================================================	
-- EVENTS
--==========================================================================================================================	
-- EventChoices
--------------------------------	
INSERT INTO EventChoices
		(Type,											Description, 									Help,												IsOneShot,	EventDuration,	Expires,	CapitalEffectOnly,	EventBuildingClassGlobal,					RequiredCiv)
VALUES	('PLAYER_EVENT_CHOICE_GH_TOURISM_MUSIC_BONUS',	'TXT_KEY_PLAYER_EVENT_GH_TOURISM_MUSIC_BONUS',	'TXT_KEY_PLAYER_EVENT_GH_TOURISM_MUSIC_BONUS_HELP',	0,			15,				1,			1,					'BUILDINGCLASS_D_GH_LOUISIANA_FROM_KREWE',	'CIVILIZATION_GH_LOUISIANA');
------------------------------	
-- Events
------------------------------	
INSERT INTO Events
		(Type,									EventClass,					Description, 										Help,													RandomChance,	RandomChanceDelta,	IsOneShot,	Global,	EraScaling,	EventCooldown,	NumChoices,	IgnoresGlobalCooldown,	RequiredCiv)
VALUES	('PLAYER_EVENT_GH_TOURISM_MUSIC_BONUS',	'EVENT_CLASS_CIV_SPECIFIC',	'TXT_KEY_PLAYER_EVENT_P_GH_TOURISM_MUSIC_BONUS',	'TXT_KEY_PLAYER_EVENT_P_GH_TOURISM_MUSIC_BONUS_HELP',	0,				0,					0,			0,		0,			0,				1,			0,						'CIVILIZATION_GH_LOUISIANA');
------------------------------	
-- Event_ParentEvents
------------------------------	
INSERT INTO Event_ParentEvents
		(EventChoiceType,								EventType)
VALUES	('PLAYER_EVENT_CHOICE_GH_TOURISM_MUSIC_BONUS',	'PLAYER_EVENT_GH_TOURISM_MUSIC_BONUS');