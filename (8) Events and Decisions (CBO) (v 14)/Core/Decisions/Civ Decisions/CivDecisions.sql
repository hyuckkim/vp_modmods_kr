--==========================================================================================================================	
-- GreatWorks
--==========================================================================================================================		
INSERT INTO GreatWorks 	
			(Type, 					GreatWorkClassType,			ArtifactClassType, 				Description)
VALUES		('GREAT_WORK_STMARK', 	'GREAT_WORK_ARTIFACT',		'ARTIFACT_RAZED_CITY', 			'TXT_KEY_GREAT_WORK_STMARK');
--==========================================================================================================================	
-- BuildingClasses/Buildings: Trade Buildings
--==========================================================================================================================	
INSERT INTO BuildingClasses 	
			(Type, 						 		 			DefaultBuilding, 							Description, 									MaxGlobalInstances, MaxPlayerInstances)
VALUES		('BUILDINGCLASS_DECISIONS_INDONESIASPICE', 		'BUILDING_DECISIONS_INDONESIASPICE', 		'TXT_KEY_DECISIONS_INDONESIASPICE',  			-1,					-1),
			('BUILDINGCLASS_DECISIONS_DUTCHNAVY', 			'BUILDING_DECISIONS_DUTCHNAVY', 			'TXT_KEY_DECISIONS_DUTCHNAVY',    				-1,					-1),
			('BUILDINGCLASS_DECISIONS_PORTUGALCASADAINDIA', 'BUILDING_DECISIONS_PORTUGALCASADAINDIA', 	'TXT_KEY_DECISIONS_PORTUGALCASADAINDIA',    	-1,					-1),
			('BUILDINGCLASS_DECISIONS_MONGOLIASILKROAD', 	'BUILDING_DECISIONS_MONGOLIASILKROAD', 		'TXT_KEY_DECISIONS_MONGOLIASILKROAD',    		-1,					-1);

INSERT INTO Buildings 	
			(Type, 						 					BuildingClass, 									Description,									GreatWorkCount, Cost, FaithCost, PrereqTech, 	NeverCapture, 	NumTradeRouteBonus, NukeImmune, ConquestProb)
VALUES		('BUILDING_DECISIONS_INDONESIASPICE', 			'BUILDINGCLASS_DECISIONS_INDONESIASPICE',		'TXT_KEY_DECISIONS_INDONESIASPICE',				-1, 			-1,   -1, 		 null,			0,				2, 1, 100),
			('BUILDING_DECISIONS_DUTCHNAVY', 				'BUILDINGCLASS_DECISIONS_DUTCHNAVY',			'TXT_KEY_DECISIONS_DUTCHNAVY',					-1, 			-1,   -1, 		 null,			0,				2, 1, 100),
			('BUILDING_DECISIONS_PORTUGALCASADAINDIA', 		'BUILDINGCLASS_DECISIONS_PORTUGALCASADAINDIA',	'TXT_KEY_DECISIONS_PORTUGALCASADAINDIA',		-1, 			-1,   -1, 		 null,			0,				2, 1, 100),
			('BUILDING_DECISIONS_MONGOLIASILKROAD', 		'BUILDINGCLASS_DECISIONS_MONGOLIASILKROAD',		'TXT_KEY_DECISIONS_MONGOLIASILKROAD',			-1, 			-1,   -1, 		 null,			0,				1, 1, 100);
--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================	
INSERT INTO BuildingClasses 	
			(Type, 						 		 			DefaultBuilding, 							Description, 									MaxGlobalInstances, MaxPlayerInstances)
VALUES		('BUILDINGCLASS_DECISIONS_BYZANTIUMWALLS', 		'BUILDING_DECISIONS_BYZANTIUMWALLS', 		'TXT_KEY_DECISIONS_BYZANTIUMWALLS',  			-1,					1),
			('BUILDINGCLASS_DECISIONS_GERMANCONFEDERATION', 'BUILDING_DECISIONS_GERMANCONFEDERATION', 	'TXT_KEY_DECISIONS_GERMANCONFEDERATION',    	-1,					1),
			('BUILDINGCLASS_DECISIONS_POLANDUNIVERSITY', 	'BUILDING_DECISIONS_POLANDUNIVERSITY', 		'TXT_KEY_DECISIONS_POLANDUNIVERSITY',    		-1,					1),
			('BUILDINGCLASS_SAN_MARCO_BASILICA', 			'BUILDING_SAN_MARCO_BASILICA', 				'TXT_KEY_BUILDING_SAN_MARCO_BASILICA',    		1,					-1),
			('BUILDINGCLASS_DECISIONS_BABYLONGATES', 		'BUILDING_DECISIONS_BABYLONGATES', 			'TXT_KEY_DECISIONS_BABYLONGATES',    			-1,					1),
			('BUILDINGCLASS_DECISIONS_INDIADEVANGARISCRIPT','BUILDING_DECISIONS_INDIADEVANGARISCRIPT', 	'TXT_KEY_DECISIONS_INDIADEVANGARISCRIPT',   	-1,					-1),
			('BUILDINGCLASS_DECISIONS_VENETIANARSENALE',	'BUILDING_DECISIONS_VENETIANARSENALE', 		'TXT_KEY_DECISIONS_VENETIANARSENALE',   	-1,					-1),
			('BUILDINGCLASS_DECISIONS_KOREANGUNPOWDER',		'BUILDING_DECISIONS_KOREANGUNPOWDER', 		'TXT_KEY_DECISIONS_KOREANGUNPOWDER',   	-1,					-1),
			('BUILDINGCLASS_DECISIONS_ENGLISHARMADA',		'BUILDING_DECISIONS_ENGLISHARMADA', 		'TXT_KEY_DECISIONS_ENGLISHARMADA',   	-1,					-1),
			('BUILDINGCLASS_DECISIONS_ESTATES_GENERAL',		'BUILDING_DECISIONS_ESTATES_GENERAL', 		'TXT_KEY_DECISIONS_ESTATES_GENERAL',   	-1,					-1),
			('BUILDINGCLASS_DECISIONS_AUSTRIANHOFKRIEGSRAT','BUILDING_DECISIONS_AUSTRIANHOFKRIEGSRAT',  'TXT_KEY_DECISIONS_AUSTRIANHOFKRIEGSRAT',   	-1,					-1),
			('BUILDINGCLASS_DECISIONS_AUSTRIANHABSBURG',	'BUILDING_DECISIONS_AUSTRIANHABSBURG',  	'TXT_KEY_DECISIONS_AUSTRIANHABSBURG',   	-1,					-1),
			('BUILDINGCLASS_DECISIONS_PERSIASATRAPY',		'BUILDING_DECISIONS_PERSIASATRAPY', 		'TXT_KEY_DECISIONS_PERSIASATRAPY',   	-1,					-1),
			('BUILDINGCLASS_DECISIONS_PERSIASAVARAN',		'BUILDING_DECISIONS_PERSIASAVARAN', 		'TXT_KEY_DECISIONS_PERSIASAVARAN',   	-1,					-1),
			('BUILDINGCLASS_DECISIONS_INDIARELIGIONS',		'BUILDING_DECISIONS_INDIARELIGIONS', 	'TXT_KEY_DECISIONS_INDIARELIGIONS',   	-1,					-1),
			('BUILDINGCLASS_DECISIONS_INCANCHASQUIS2',		'BUILDING_DECISIONS_INCANCHASQUIS2', 		'TXT_KEY_DECISIONS_INCANCHASQUIS',   	-1,					-1),
			('BUILDINGCLASS_DECISIONS_ETHIOPIACOINAGE',		'BUILDING_DECISIONS_ETHIOPIACOINAGE', 		'TXT_KEY_DECISIONS_ETHIOPIACOINAGE',   	-1,					-1),
			('BUILDINGCLASS_DECISIONS_ETHIOPIACOINAGE2',	'BUILDING_DECISIONS_ETHIOPIACOINAGE2', 		'TXT_KEY_DECISIONS_ETHIOPIACOINAGE',   	-1,					-1),
			('BUILDINGCLASS_DECISIONS_ROMEBALLISTA',		'BUILDING_DECISIONS_ROMEBALLISTA', 			'TXT_KEY_DECISIONS_ROMANPANEM',   	-1,					-1);
--==========================================================================================================================	
-- Buildings: Invisible
--==========================================================================================================================
INSERT INTO Buildings 	
			(Type, 						 					BuildingClass, 						Description,									GreatWorkCount, Cost, FaithCost, PrereqTech, 	NeverCapture)
VALUES		('BUILDING_SAN_MARCO_BASILICA_DUMMY', 			'BUILDINGCLASS_DECISION_EFFECT',	'TXT_KEY_BUILDING_SAN_MARCO_BASILICA_DUMMY',	-1, 			-1,   -1, 		 null,			1),
			('BUILDING_DECISIONS_ROMANCONCRETE', 			'BUILDINGCLASS_DECISION_EFFECT',	'TXT_KEY_DECISIONS_ROMANCONCRETE',				-1, 			-1,   -1, 		 null,			0),
			('BUILDING_DECISIONS_INCANQUIPUCAMAYOCS', 		'BUILDINGCLASS_DECISION_EFFECT',	'TXT_KEY_DECISIONS_INCANQUIPUCAMAYOCS',			-1, 			-1,   -1, 		 null,			1),
			('BUILDING_DECISIONS_GREATSEJM', 				'BUILDINGCLASS_DECISION_EFFECT',	'TXT_KEY_DECISIONS_POLANDSEJM',					-1, 			-1,   -1, 		 null,			0),
			('BUILDING_DECISIONS_IROQUOISLAWOFPEACE', 		'BUILDINGCLASS_DECISION_EFFECT',	'TXT_KEY_DECISIONS_IROQUOISLAWOFPEACE',			-1, 			-1,   -1, 		 null,			1),
			('BUILDING_DECISIONS_MONGOLIASILKROAD2', 		'BUILDINGCLASS_DECISION_EFFECT',	'TXT_KEY_DECISIONS_MONGOLIASILKROAD2',			-1, 			-1,   -1, 		 null,			0),
			('BUILDING_DECISIONS_CELTSTINTRADE', 			'BUILDINGCLASS_DECISION_EFFECT',	'TXT_KEY_DECISIONS_CELTSTINTRADE',				-1, 			-1,   -1, 		 null,			1),
			('BUILDING_DECISIONS_EGYPTVALLEYOFTHEKINGS_F', 	'BUILDINGCLASS_DECISION_EFFECT',	'TXT_KEY_DECISIONS_EGYPTVALLEYOFTHEKINGS',		-1, 			-1,   -1, 		 null,			1),
			('BUILDING_DECISIONS_EGYPTVALLEYOFTHEKINGS_C', 	'BUILDINGCLASS_DECISION_EFFECT',	'TXT_KEY_DECISIONS_EGYPTVALLEYOFTHEKINGS',		-1, 			-1,   -1, 		 null,			1),
			('BUILDING_DECISIONS_ETHIOPIASOLOMONIC', 		'BUILDINGCLASS_DECISION_EFFECT',	'TXT_KEY_DECISIONS_ETHIOPIASOLOMONIC',			-1, 			-1,   -1, 		 null,			1),
			('BUILDING_DECISIONS_GERMANCONFEDERATION2', 	'BUILDINGCLASS_DECISION_EFFECT',	'TXT_KEY_DECISIONS_GERMANCONFEDERATION',		-1, 			-1,   -1, 		 null,			1),
			('BUILDING_DECISIONS_INDIADEVANGARISCRIPT', 	'BUILDINGCLASS_DECISIONS_INDIADEVANGARISCRIPT','TXT_KEY_DECISIONS_INDIADEVANGARISCRIPT',	-1, 		-1,   -1, 		 null,			1),
			('BUILDING_DECISIONS_VENETIANARSENALE', 		'BUILDINGCLASS_DECISIONS_VENETIANARSENALE',			'TXT_KEY_DECISIONS_VENETIANARSENALE',	-1, 		-1,   -1, 		 null,			1),
			('BUILDING_DECISIONS_KOREANGUNPOWDER', 			'BUILDINGCLASS_DECISIONS_KOREANGUNPOWDER',			'TXT_KEY_DECISIONS_KOREANGUNPOWDER',	-1, 		-1,   -1, 		 null,			1),
			('BUILDING_DECISIONS_ENGLISHARMADA', 			'BUILDINGCLASS_DECISIONS_ENGLISHARMADA',			'TXT_KEY_DECISIONS_ENGLISHARMADA',	-1, 		-1,   -1, 		 null,			1),
			('BUILDING_DECISIONS_ESTATES_GENERAL', 			'BUILDINGCLASS_DECISIONS_ESTATES_GENERAL',			'TXT_KEY_DECISIONS_ESTATES_GENERAL',	-1, 		-1,   -1, 		 null,			0),
			('BUILDING_DECISIONS_AUSTRIANHOFKRIEGSRAT', 	'BUILDINGCLASS_DECISIONS_AUSTRIANHOFKRIEGSRAT',		'TXT_KEY_DECISIONS_AUSTRIANHOFKRIEGSRAT',-1, 		-1,   -1, 		 null,			1),
			('BUILDING_DECISIONS_AUSTRIANHABSBURG', 		'BUILDINGCLASS_DECISIONS_AUSTRIANHABSBURG',			'TXT_KEY_DECISIONS_AUSTRIANHABSBURG',	-1, 		-1,   -1, 		 null,			1),
			('BUILDING_DECISIONS_PERSIASATRAPY', 			'BUILDINGCLASS_DECISIONS_PERSIASATRAPY',			'TXT_KEY_DECISIONS_PERSIASATRAPY',		-1,  -1,   -1,		  	null,			1),
			('BUILDING_DECISIONS_PERSIASAVARAN', 			'BUILDINGCLASS_DECISIONS_PERSIASAVARAN',			'TXT_KEY_DECISIONS_PERSIASAVARAN',		-1,  -1,   -1,		  	null,			1),
			('BUILDING_DECISIONS_INDIARELIGIONS', 			'BUILDINGCLASS_DECISIONS_INDIARELIGIONS',			'TXT_KEY_DECISIONS_INDIARELIGIONS',		-1,  -1,   -1,		  	null,			1),
			('BUILDING_DECISIONS_INCANCHASQUIS2', 			'BUILDINGCLASS_DECISIONS_INCANCHASQUIS2',			'TXT_KEY_DECISIONS_INCANCHASQUIS',		-1, 		-1,   -1, 		 null,			1),
			('BUILDING_DECISIONS_ETHIOPIACOINAGE', 			'BUILDINGCLASS_DECISIONS_ETHIOPIACOINAGE',			'TXT_KEY_DECISIONS_ETHIOPIACOINAGE',	-1, 		-1,   -1, 		 null,			0),
			('BUILDING_DECISIONS_ETHIOPIACOINAGE2', 		'BUILDINGCLASS_DECISIONS_ETHIOPIACOINAGE2',			'TXT_KEY_DECISIONS_ETHIOPIACOINAGE',	-1, 		-1,   -1, 		 null,			1),
			('BUILDING_DECISIONS_ROMEBALLISTA', 		'BUILDINGCLASS_DECISIONS_ROMEBALLISTA',					'TXT_KEY_DECISIONS_ROMANPANEM',	-1, 		-1,   -1, 		 null,			1);

INSERT INTO Building_GrowthExtraYield (BuildingType, YieldType, Yield)
SELECT 'BUILDING_DECISIONS_INDIADEVANGARISCRIPT', 'YIELD_CULTURE', 40 UNION ALL
SELECT 'BUILDING_DECISIONS_INDIADEVANGARISCRIPT', 'YIELD_SCIENCE', 35;

INSERT INTO Building_YieldChangesPerPop (BuildingType, YieldType, Yield)
SELECT 'BUILDING_DECISIONS_INDIARELIGIONS', 'YIELD_FAITH', 200;

INSERT INTO Building_UnitCombatProductionModifiers (BuildingType, UnitCombatType, Modifier)
SELECT 'BUILDING_DECISIONS_VENETIANARSENALE', 'UNITCOMBAT_NAVALMELEE', 33 UNION ALL
SELECT 'BUILDING_DECISIONS_VENETIANARSENALE', 'UNITCOMBAT_NAVALRANGED', 33 UNION ALL
--SELECT 'BUILDING_DECISIONS_VENETIANARSENALE', 'UNITCOMBAT_SUBMARINE', 33 UNION ALL
SELECT 'BUILDING_DECISIONS_KOREANGUNPOWDER', 'UNITCOMBAT_GUN', 15 UNION ALL
SELECT 'BUILDING_DECISIONS_KOREANGUNPOWDER', 'UNITCOMBAT_SIEGE', 15 UNION ALL
SELECT 'BUILDING_DECISIONS_ROMEBALLISTA', 'UNITCOMBAT_SIEGE', 25 UNION ALL
SELECT 'BUILDING_DECISIONS_AUSTRIANHOFKRIEGSRAT', 'UNITCOMBAT_ARCHER', 15 UNION ALL
SELECT 'BUILDING_DECISIONS_AUSTRIANHOFKRIEGSRAT', 'UNITCOMBAT_MOUNTED', 15 UNION ALL
SELECT 'BUILDING_DECISIONS_AUSTRIANHOFKRIEGSRAT', 'UNITCOMBAT_MELEE', 20 UNION ALL
SELECT 'BUILDING_DECISIONS_AUSTRIANHOFKRIEGSRAT', 'UNITCOMBAT_GUN', 20;

INSERT INTO Building_UnitCombatFreeExperiences (BuildingType, UnitCombatType, Experience)
SELECT 'BUILDING_DECISIONS_ENGLISHARMADA', 'UNITCOMBAT_ARCHER', 15 UNION ALL
SELECT 'BUILDING_DECISIONS_PERSIASAVARAN', 'UNITCOMBAT_MELEE', 15;

UPDATE Buildings
	SET FreeBuilding = 'BUILDINGCLASS_DECISIONS_INDIADEVANGARISCRIPT'
	WHERE Type = 'BUILDING_DECISIONS_INDIADEVANGARISCRIPT';

UPDATE Buildings
	SET GPExpendInfluence = 15
	WHERE Type = 'BUILDING_DECISIONS_AUSTRIANHABSBURG';
	
UPDATE Buildings
	SET ConquestProb = 100, NukeImmune = 1
	WHERE Type = 'BUILDING_DECISIONS_INDIARELIGIONS';
	
UPDATE Buildings
	SET TradeRouteLandGoldBonus = 200, TradeRouteSeaGoldBonus = 200
	WHERE Type = 'BUILDING_DECISIONS_ETHIOPIACOINAGE2';

UPDATE Buildings
	SET PolicyCostModifier = -10, ConquestProb = 100, NukeImmune = 1
	WHERE Type = 'BUILDING_DECISIONS_ESTATES_GENERAL';

UPDATE Buildings
	SET CityConnectionTradeRouteModifier = 2
	WHERE Type = 'BUILDING_DECISIONS_INCANCHASQUIS2';

UPDATE Buildings
	SET BuildingProductionModifier = 15, WonderProductionModifier = 15, ConquestProb = 100, NukeImmune = 1
	WHERE Type = 'BUILDING_DECISIONS_ROMANCONCRETE';
	
UPDATE Buildings
	SET HappinessPerXPolicies = 2, ConquestProb = 100, NukeImmune = 1
	WHERE Type = 'BUILDING_DECISIONS_GREATSEJM';
	
UPDATE Buildings
	SET GlobalCultureRateModifier = 10
	WHERE Type = 'BUILDING_DECISIONS_IROQUOISLAWOFPEACE';
	
UPDATE Buildings
	SET TradeRouteLandDistanceModifier = 50
	WHERE Type = 'BUILDING_DECISIONS_MONGOLIASILKROAD2';
	
UPDATE Buildings
	SET TradeRouteRecipientBonus = 2, TradeRouteLandGoldBonus = 200, TradeRouteSeaGoldBonus = 200, TradeRouteSeaDistanceModifier = 25
	WHERE Type = 'BUILDING_DECISIONS_CELTSTINTRADE';
	
UPDATE Buildings
	SET ExtraMissionarySpreads = 1
	WHERE Type = 'BUILDING_DECISIONS_ETHIOPIASOLOMONIC';

UPDATE Buildings
	SET UnmoddedHappiness = 1
	WHERE Type = 'BUILDING_DECISIONS_PERSIASATRAPY';	

UPDATE Buildings
	SET UnmoddedHappiness = 1
	WHERE Type = 'BUILDING_DECISIONS_GERMANCONFEDERATION2';
--==========================================================================================================================	
-- Buildings: Regular
--==========================================================================================================================
INSERT INTO Buildings 	
			(Type, 						 					BuildingClass, 									Description,										Civilopedia,													Help,													Strategy,			Cost,	PrereqTech, 	ConquestProb,	IconAtlas, 				PortraitIndex)
VALUES		('BUILDING_DECISIONS_BYZANTIUMWALLS', 			'BUILDINGCLASS_DECISIONS_BYZANTIUMWALLS',		'TXT_KEY_DECISIONS_BUILDING_BYZANTIUMWALLS',		'TXT_KEY_DECISIONS_BUILDING_BYZANTIUMWALLS_CIVILOPEDIA',		'TXT_KEY_DECISIONS_BUILDING_BYZANTIUMWALLS_HELP',		null,				-1,  	null,			100,			'CORE_DECISIONS_ATLAS',	5),
			('BUILDING_DECISIONS_GERMANCONFEDERATION', 		'BUILDINGCLASS_DECISIONS_GERMANCONFEDERATION',	'TXT_KEY_DECISIONS_BUILDING_GERMANCONFEDERATION',	'TXT_KEY_DECISIONS_BUILDING_GERMANCONFEDERATION_CIVILOPEDIA',	'TXT_KEY_DECISIONS_BUILDING_GERMANCONFEDERATION_HELP',	null,				-1,  	null,			100,			'CORE_DECISIONS_ATLAS',	2),
			('BUILDING_DECISIONS_POLANDUNIVERSITY', 		'BUILDINGCLASS_DECISIONS_POLANDUNIVERSITY',		'TXT_KEY_DECISIONS_BUILDING_POLANDUNIVERSITY',		'TXT_KEY_DECISIONS_BUILDING_POLANDUNIVERSITY_CIVILOPEDIA',		'TXT_KEY_DECISIONS_BUILDING_POLANDUNIVERSITY_HELP',		null,				-1,  	null,			100,			'CORE_DECISIONS_ATLAS',	6),
			('BUILDING_SAN_MARCO_BASILICA', 				'BUILDINGCLASS_SAN_MARCO_BASILICA',				'TXT_KEY_BUILDING_SAN_MARCO_BASILICA_DESC',			'TXT_KEY_BUILDING_SAN_MARCO_BASILICA_PEDIA',					'TXT_KEY_BUILDING_SAN_MARCO_BASILICA_HELP',				null,				-1,  	null,			100,			'CORE_DECISIONS_ATLAS',	0),
			('BUILDING_DECISIONS_BABYLONGATES', 			'BUILDINGCLASS_DECISIONS_BABYLONGATES',			'TXT_KEY_DECISIONS_BUILDING_BABYLONGATES',			'TXT_KEY_DECISIONS_BUILDING_BABYLONGATES_CIVILOPEDIA',			'TXT_KEY_DECISIONS_BUILDING_BABYLONGATES_HELP',			null,				-1,  	null,			100,			'CORE_DECISIONS_ATLAS',	7);

UPDATE Buildings
	SET Defense = 300, FreeBuildingThisCity = 'BUILDINGCLASS_WALLS', NukeImmune = 1
	WHERE Type = 'BUILDING_DECISIONS_BYZANTIUMWALLS';
	
UPDATE Buildings
	SET FreePolicies = 1, NukeImmune = 1
	WHERE Type = 'BUILDING_DECISIONS_GERMANCONFEDERATION';

UPDATE Buildings
	SET NukeImmune = 1
	WHERE Type = 'BUILDING_DECISIONS_BABYLONGATES';
	
UPDATE Buildings
	SET CultureRateModifier = 10, GreatPeopleRateModifier = 25, NukeImmune = 1
	WHERE Type = 'BUILDING_DECISIONS_POLANDUNIVERSITY';
	
UPDATE Buildings
	--SET Quote = 'TXT_KEY_WONDER_SAN_MARCO_BASILICA_QUOTE', ThemingBonusHelp = 'TXT_KEY_SAN_MARCO_BASILICA_THEMING_BONUS_HELP', NukeImmune = 1, GreatWorkSlotType = 'GREAT_WORK_SLOT_ART_ARTIFACT', GreatWorkCount = 2, FreeGreatWork = 'GREAT_WORK_STMARK', WonderSplashImage = 'WonderConceptSanMarco.dds'
	SET Quote = 'TXT_KEY_WONDER_SAN_MARCO_BASILICA_QUOTE', NukeImmune = 1, GreatWorkSlotType = 'GREAT_WORK_SLOT_ART_ARTIFACT', GreatWorkCount = 1, FreeGreatWork = 'GREAT_WORK_STMARK', WonderSplashImage = 'WonderConceptSanMarco.dds'
	WHERE Type = 'BUILDING_SAN_MARCO_BASILICA';
--==========================================================================================================================	
-- Building_YieldChanges
--==========================================================================================================================		
INSERT INTO Building_YieldChanges 	
			(BuildingType, 									YieldType, 				Yield)
VALUES		('BUILDING_SAN_MARCO_BASILICA', 				'YIELD_CULTURE', 		1),
			('BUILDING_SAN_MARCO_BASILICA_DUMMY', 			'YIELD_CULTURE', 		0),
			('BUILDING_DECISIONS_INCANCHASQUIS2', 			'YIELD_GOLD', 			1),
			('BUILDING_DECISIONS_EGYPTVALLEYOFTHEKINGS_F', 	'YIELD_FAITH', 			1),
			('BUILDING_DECISIONS_EGYPTVALLEYOFTHEKINGS_C', 	'YIELD_CULTURE', 		1),
			('BUILDING_DECISIONS_ETHIOPIACOINAGE', 			'YIELD_GOLD', 			5),
			('BUILDING_DECISIONS_BABYLONGATES', 			'YIELD_CULTURE', 		1);
--==========================================================================================================================	
-- Building_YieldModifiers
--==========================================================================================================================		
INSERT INTO Building_YieldModifiers 	
			(BuildingType, 									YieldType, 				Yield)
VALUES		('BUILDING_DECISIONS_POLANDUNIVERSITY', 		'YIELD_SCIENCE', 		10);
--==========================================================================================================================	
-- Building_BuildingClassYieldChanges
--==========================================================================================================================		
INSERT INTO Building_BuildingClassYieldChanges 	
			(BuildingType, 									BuildingClassType,			YieldType, 				YieldChange)
VALUES		('BUILDING_DECISIONS_BYZANTIUMWALLS', 			'BUILDINGCLASS_SHRINE',		'YIELD_FAITH', 			1),
			('BUILDING_DECISIONS_BABYLONGATES', 			'BUILDINGCLASS_GRANARY',		'YIELD_FOOD', 			2);
-- Building_HurryModifiers		
--==========================================================================================================================				
INSERT INTO Building_HurryModifiers 			
			(BuildingType, 									HurryType, 				HurryCostModifier)		
VALUES		('BUILDING_DECISIONS_INCANQUIPUCAMAYOCS', 		'HURRY_GOLD', 			-20);
--==========================================================================================================================			
-- Building_YieldFromCityStates		
--==========================================================================================================================				
INSERT INTO Building_YieldFromCityStates 			
			(BuildingType, 									YieldType, 				Yield,	IncludeFriendly)		
VALUES		('BUILDING_DECISIONS_GERMANCONFEDERATION', 		'YIELD_CULTURE', 		2,		0);		
--==========================================================================================================================		
-- Building_ThemingBonuses
--==========================================================================================================================		
/*
INSERT INTO Building_ThemingBonuses 	
			(BuildingType, 						Description, 									Bonus,	MustBeArtifact,	RequiresOwner,	RequiresSamePlayer,	AIPriority)
VALUES		('BUILDING_SAN_MARCO_BASILICA', 	'TXT_KEY_THEMING_BONUS_SAN_MARCO_BASILICA', 	4,		1,				1,				1,					3);
*/
--==========================================================================================================================
-- Policies
--==========================================================================================================================
INSERT INTO Policies 
			(Type, 										Description) 
VALUES		('POLICY_DECISIONS_SIAMEMBASSIES',	 	    'TXT_KEY_DECISIONS_SIAMEMBASSIES'),			
			('POLICY_DECISIONS_DENMARKTHING',	 	    'TXT_KEY_DECISIONS_DENMARKTHING'),
			('POLICY_DECISIONS_AZTECFLOWERWAR',	 	    'TXT_KEY_DECISIONS_AZTECFLOWERWAR'),	
			('POLICY_DECISIONS_CHINAFUBINGZHI',	 	    'TXT_KEY_DECISIONS_CHINAFUBINGZHI'),
			('POLICY_DECISIONS_MOROCCOPLUNDER',	 	    'TXT_KEY_DECISIONS_MOROCCOPLUNDER'),
			('POLICY_DECISIONS_GERMANGUILDLAWS',	 	'TXT_KEY_DECISIONS_GERMANGUILDLAWS');
			
UPDATE Policies
	SET MinorFriendshipMinimum = 10
	WHERE Type = 'POLICY_DECISIONS_SIAMEMBASSIES';
	
UPDATE Policies
	SET UnitGoldMaintenanceMod = -20
	WHERE Type = 'POLICY_DECISIONS_DENMARKTHING';
	
UPDATE Policies
	SET AfraidMinorPerTurnInfluence = 300
	WHERE Type = 'POLICY_DECISIONS_AZTECFLOWERWAR';
	
UPDATE Policies
	SET UnitGoldMaintenanceMod = -10
	WHERE Type = 'POLICY_DECISIONS_CHINAFUBINGZHI';
	
UPDATE Policies
	SET CultureFromKills = 50
	WHERE Type = 'POLICY_DECISIONS_MOROCCOPLUNDER';
--==========================================================================================================================	
-- Policy_HurryModifiers
--==========================================================================================================================		
INSERT INTO Policy_HurryModifiers 	
			(PolicyType, 								HurryType, 				HurryCostModifier)
VALUES		('POLICY_DECISIONS_GERMANGUILDLAWS', 		'HURRY_GOLD', 			-15);
--==========================================================================================================================
-- Policy_CapitalYieldPerPopChanges
--==========================================================================================================================
--==========================================================================================================================
-- Policy_CityYieldChanges
--==========================================================================================================================
--==========================================================================================================================
-- Policy_BuildingClassYieldChanges
--==========================================================================================================================
--==========================================================================================================================
-- Policy_BuildingClassYieldModifiers
--==========================================================================================================================
--==========================================================================================================================
-- Policy_BuildingClassCultureChanges
--==========================================================================================================================
--==========================================================================================================================
-- Policy_BuildingClassHappiness
--==========================================================================================================================
--==========================================================================================================================
-- Policy_BuildingClassProductionModifiers
--==========================================================================================================================
INSERT INTO Policy_BuildingClassProductionModifiers 
			(PolicyType, 									BuildingClassType,				ProductionModifier)
VALUES		('POLICY_DECISIONS_GERMANGUILDLAWS', 			'BUILDINGCLASS_MINT',	 		100);
--==========================================================================================================================
-- Policy_ImprovementYieldChanges
--==========================================================================================================================
--==========================================================================================================================
-- Policy_ImprovementCultureChanges
--==========================================================================================================================
--==========================================================================================================================
-- Policy_FreePromotions
--==========================================================================================================================
--==========================================================================================================================
-- Policy_UnitCombatFreeExperiences
--==========================================================================================================================
--==========================================================================================================================
-- Policy_UnitCombatProductionModifiers
--==========================================================================================================================
INSERT INTO Policy_UnitCombatProductionModifiers
			(PolicyType, 								UnitCombatType,				ProductionModifier)
VALUES		('POLICY_DECISIONS_CHINAFUBINGZHI', 		'UNITCOMBAT_ARCHER',		25),
			('POLICY_DECISIONS_CHINAFUBINGZHI', 		'UNITCOMBAT_MELEE',			25);
--==========================================================================================================================
-- UnitPromotions
--==========================================================================================================================
INSERT INTO UnitPromotions
			(Type, 											Description, 												Help, 													CannotBeChosen, 		Sound, 				PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_DECISIONS_FRANCEARMEE', 			'TXT_KEY_PROMOTION_DECISIONS_FRANCEARMEE_DESC', 			'TXT_KEY_PROMOTION_DECISIONS_FRANCEARMEE_HELP',			1, 						'AS2D_IF_LEVELUP', 	59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_DECISIONS_FRANCEARMEE_DESC'),
			('PROMOTION_DECISIONS_MOROCCOBLACKGUAR', 		'TXT_KEY_PROMOTION_DECISIONS_MOROCCOBLACKGUAR_DESC', 		'TXT_KEY_PROMOTION_DECISIONS_MOROCCOBLACKGUAR_HELP',	1, 						'AS2D_IF_LEVELUP', 	59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_DECISIONS_MOROCCOBLACKGUAR_DESC'),
			('PROMOTION_DECISIONS_HUNSRECURVEBOW', 			'TXT_KEY_PROMOTION_DECISIONS_HUNSRECURVEBOW_DESC', 			'TXT_KEY_PROMOTION_DECISIONS_HUNSRECURVEBOW_HELP',		1, 						'AS2D_IF_LEVELUP', 	59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_DECISIONS_HUNSRECURVEBOW_DESC');			
			
UPDATE UnitPromotions
	SET GreatGeneralModifier = 25
	WHERE Type = 'PROMOTION_DECISIONS_FRANCEARMEE';
	
UPDATE UnitPromotions
	SET FriendlyLandsModifier = 15
	WHERE Type = 'PROMOTION_DECISIONS_MOROCCOBLACKGUAR';
	
UPDATE UnitPromotions
	SET RangedAttackModifier = 20
	WHERE Type = 'PROMOTION_DECISIONS_HUNSRECURVEBOW';
--==========================================================================================================================
-- UnitPromotions_UnitCombats
--==========================================================================================================================
INSERT INTO UnitPromotions_UnitCombats
			(PromotionType, 							UnitCombatType)
VALUES		('PROMOTION_DECISIONS_FRANCEARMEE', 		'UNITCOMBAT_GUN'),
			('PROMOTION_DECISIONS_MOROCCOBLACKGUAR', 	'UNITCOMBAT_MELEE'),
			('PROMOTION_DECISIONS_MOROCCOBLACKGUAR', 	'UNITCOMBAT_GUN'),
			('PROMOTION_DECISIONS_HUNSRECURVEBOW', 		'UNITCOMBAT_ARCHER');
--==========================================================================================================================	
-- UnitClasses
--==========================================================================================================================
INSERT INTO UnitClasses
			(Type, 										Description,							DefaultUnit)
VALUES		('UNITCLASS_DECISIONS_PERSIASAVARAN', 		'TXT_KEY_DECISIONS_PERSIASAVARAN',		'UNIT_DECISIONS_PERSIASAVARAN');
--==========================================================================================================================	
-- Units
--==========================================================================================================================
INSERT INTO Units 	
			(Class, 									Type, 										PrereqTech, Combat, Cost, 	FaithCost,	RequiresFaithPurchaseEnabled,	Moves, 	CombatClass, Domain, DefaultUnitAI, Description, Civilopedia, Strategy, Help, MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, 		XPValueAttack, XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 	UnitFlagIconOffset, UnitFlagAtlas,	PortraitIndex, 	IconAtlas,	MoveRate)
SELECT		('UNITCLASS_DECISIONS_PERSIASAVARAN'), 		('UNIT_DECISIONS_PERSIASAVARAN'), 			('TECH_IRON_WORKING'),		Combat, (100), 	(200),	(1),	Moves, 	CombatClass, Domain, DefaultUnitAI, Description, Civilopedia, Strategy, Help, MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueAttack, XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 	UnitFlagIconOffset, UnitFlagAtlas,	PortraitIndex, 	IconAtlas,	MoveRate
FROM Units WHERE (Type = 'UNIT_HUN_BATTERING_RAM');
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) SELECT 'CIVILIZATION_BARBARIAN', 'UNITCLASS_DECISIONS_PERSIASAVARAN', NULL;

UPDATE Units
	SET ShowInPedia = 0, PurchaseCooldown = 1, NoMinorCivGift = 1
	WHERE Type = 'UNIT_DECISIONS_PERSIASAVARAN';
--==========================================================================================================================	
-- Unit_ResourceQuantityRequirements
--==========================================================================================================================		
--INSERT INTO Unit_ResourceQuantityRequirements 	
--			(UnitType, 							ResourceType)
--SELECT		('UNIT_DECISIONS_PERSIASAVARAN'), 	ResourceType
--FROM Unit_ResourceQuantityRequirements WHERE (UnitType = 'UNIT_SPEARMAN');	
--==========================================================================================================================	
-- UnitGameplay2DScripts
--==========================================================================================================================		
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 							SelectionSound, FirstSelectionSound)
SELECT		('UNIT_DECISIONS_PERSIASAVARAN'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_HUN_BATTERING_RAM');
--==========================================================================================================================	
-- Unit_AITypes
--==========================================================================================================================		
INSERT INTO Unit_AITypes 	
			(UnitType, 							UnitAIType)
SELECT		('UNIT_DECISIONS_PERSIASAVARAN'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_HUN_BATTERING_RAM');	
--==========================================================================================================================	
-- Unit_ClassUpgrades
--==========================================================================================================================	
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 							UnitClassType)
SELECT		('UNIT_DECISIONS_PERSIASAVARAN'),	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_SPEARMAN');	
--==========================================================================================================================	
-- Unit_Flavors
--==========================================================================================================================		
INSERT INTO Unit_Flavors 	
			(UnitType, 							FlavorType, Flavor)
SELECT		('UNIT_DECISIONS_PERSIASAVARAN'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_HUN_BATTERING_RAM');	
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions 	
			(UnitType, 							PromotionType)
SELECT		('UNIT_DECISIONS_PERSIASAVARAN'), 		PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_HUN_BATTERING_RAM');
--==========================================================================================================================		
--==========================================================================================================================
INSERT INTO Unit_BuildingClassPurchaseRequireds (UnitType, BuildingClassType) SELECT 'UNIT_DECISIONS_PERSIASAVARAN','BUILDINGCLASS_BARRACKS';
INSERT INTO Unit_ResourceQuantityRequirements (UnitType, ResourceType, Cost) VALUES ('UNIT_DECISIONS_PERSIASAVARAN', 'RESOURCE_IRON', '1');

DELETE FROM Civilization_UnitClassOverrides
WHERE CivilizationType = 'CIVILIZATION_BARBARIAN' AND
UnitClassType IN (
	'UNITCLASS_DECISIONS_GALLEASS',
	'UNITCLASS_DECISIONS_HAKKAPELIITTA',
	'UNITCLASS_DECISIONS_BALLISTA',
	'UNITCLASS_DECISIONS_LONGBOWMAN',
	'UNITCLASS_DECISIONS_TURTLESHIP',
	'UNITCLASS_DECISIONS_SIPAHI',
	'UNITCLASS_DECISIONS_CC',
	'UNITCLASS_DECISIONS_SKI',
	'UNITCLASS_DECISIONS_PRA',
	'UNITCLASS_DECISIONS_PERSIASAVARAN',
	'UNITCLASS_BRAZILIAN_PRACINHA',
	'UNITCLASS_SKI_INFANTRY',
	'UNITCLASS_LONGBOWMAN',
	'UNITCLASS_COMPANIONCAVALRY',
	'UNITCLASS_HUNNIC_BATTERING_RAM',
	'UNITCLASS_KOREAN_TURTLE_SHIP',
	'UNITCLASS_SIPAHI',
	'UNITCLASS_BALLISTA',
	'UNITCLASS_SWEDISH_HAKKAPELIITTA',
	'UNITCLASS_VENETIAN_GALLEASS');
--	'UNITCLASS_CAVALRY',
--	'UNITCLASS_MECHANIZED_INFANTRY',
--	'UNITCLASS_IRONCLAD',
--	'UNITCLASS_MISSILE_CRUISER');

DELETE FROM Civilization_UnitClassOverrides
WHERE CivilizationType = 'CIVILIZATION_MINOR' AND
UnitClassType IN (
	'UNITCLASS_DECISIONS_GALLEASS',
	'UNITCLASS_DECISIONS_HAKKAPELIITTA',
	'UNITCLASS_DECISIONS_BALLISTA',
	'UNITCLASS_DECISIONS_LONGBOWMAN',
	'UNITCLASS_DECISIONS_TURTLESHIP',
	'UNITCLASS_DECISIONS_SIPAHI',
	'UNITCLASS_DECISIONS_CC',
	'UNITCLASS_DECISIONS_SKI',
	'UNITCLASS_DECISIONS_PRA',
	'UNITCLASS_DECISIONS_PERSIASAVARAN',
	'UNITCLASS_BRAZILIAN_PRACINHA',
	'UNITCLASS_SKI_INFANTRY',
	'UNITCLASS_LONGBOWMAN',
	'UNITCLASS_COMPANIONCAVALRY',
	'UNITCLASS_HUNNIC_BATTERING_RAM',
	'UNITCLASS_KOREAN_TURTLE_SHIP',
	'UNITCLASS_SIPAHI',
	'UNITCLASS_BALLISTA',
	'UNITCLASS_SWEDISH_HAKKAPELIITTA',
	'UNITCLASS_VENETIAN_GALLEASS');

--INSERT INTO Civilization_UnitClassOverrides
--	(CivilizationType, UnitClassType, UnitType)
--VALUES
--	('CIVILIZATION_BARBARIAN', 'UNITCLASS_DECISIONS_GALLEASS', NULL),
--	('CIVILIZATION_MINOR', 'UNITCLASS_DECISIONS_GALLEASS', NULL),
--	('CIVILIZATION_BARBARIAN', 'UNITCLASS_DECISIONS_HAKKAPELIITTA', NULL),
--	('CIVILIZATION_MINOR', 'UNITCLASS_DECISIONS_HAKKAPELIITTA', NULL),
--	('CIVILIZATION_BARBARIAN', 'UNITCLASS_DECISIONS_BALLISTA', NULL),
--	('CIVILIZATION_MINOR', 'UNITCLASS_DECISIONS_BALLISTA', NULL),
--	('CIVILIZATION_BARBARIAN', 'UNITCLASS_DECISIONS_LONGBOWMAN', NULL),
--	('CIVILIZATION_MINOR', 'UNITCLASS_DECISIONS_LONGBOWMAN', NULL),
--	('CIVILIZATION_BARBARIAN', 'UNITCLASS_DECISIONS_TURTLESHIP', NULL),
--	('CIVILIZATION_MINOR', 'UNITCLASS_DECISIONS_TURTLESHIP', NULL),
--	('CIVILIZATION_BARBARIAN', 'UNITCLASS_DECISIONS_SIPAHI', NULL),
--	('CIVILIZATION_MINOR', 'UNITCLASS_DECISIONS_SIPAHI', NULL),
--	('CIVILIZATION_BARBARIAN', 'UNITCLASS_DECISIONS_CC', NULL),
--	('CIVILIZATION_MINOR', 'UNITCLASS_DECISIONS_CC', NULL),
--	('CIVILIZATION_BARBARIAN', 'UNITCLASS_DECISIONS_SKI', NULL),
--	('CIVILIZATION_MINOR', 'UNITCLASS_DECISIONS_SKI', NULL),
--	('CIVILIZATION_BARBARIAN', 'UNITCLASS_DECISIONS_PRA', NULL),
--	('CIVILIZATION_MINOR', 'UNITCLASS_DECISIONS_PRA', NULL),
--	('CIVILIZATION_BARBARIAN', 'UNITCLASS_DECISIONS_PERSIASAVARAN', NULL),
--	('CIVILIZATION_MINOR', 'UNITCLASS_DECISIONS_PERSIASAVARAN', NULL),
--	('CIVILIZATION_BARBARIAN', 'UNITCLASS_BRAZILIAN_PRACINHA', NULL),
--	('CIVILIZATION_MINOR', 'UNITCLASS_BRAZILIAN_PRACINHA', NULL),
--	('CIVILIZATION_BARBARIAN', 'UNITCLASS_SKI_INFANTRY', NULL),
--	('CIVILIZATION_MINOR', 'UNITCLASS_SKI_INFANTRY', NULL),
--	('CIVILIZATION_BARBARIAN', 'UNITCLASS_LONGBOWMAN', NULL),
--	('CIVILIZATION_MINOR', 'UNITCLASS_LONGBOWMAN', NULL),
--	('CIVILIZATION_BARBARIAN', 'UNITCLASS_COMPANIONCAVALRY', NULL),
--	('CIVILIZATION_MINOR', 'UNITCLASS_COMPANIONCAVALRY', NULL),
--	('CIVILIZATION_BARBARIAN', 'UNITCLASS_HUNNIC_BATTERING_RAM', NULL),
--	('CIVILIZATION_MINOR', 'UNITCLASS_HUNNIC_BATTERING_RAM', NULL),
--	('CIVILIZATION_BARBARIAN', 'UNITCLASS_KOREAN_TURTLE_SHIP', NULL),
--	('CIVILIZATION_MINOR', 'UNITCLASS_KOREAN_TURTLE_SHIP', NULL),
--	('CIVILIZATION_BARBARIAN', 'UNITCLASS_SIPAHI', NULL),
--	('CIVILIZATION_MINOR', 'UNITCLASS_SIPAHI', NULL),
--	('CIVILIZATION_BARBARIAN', 'UNITCLASS_BALLISTA', NULL),
--	('CIVILIZATION_MINOR', 'UNITCLASS_BALLISTA', NULL),
--	('CIVILIZATION_BARBARIAN', 'UNITCLASS_SWEDISH_HAKKAPELIITTA', NULL),
--	('CIVILIZATION_MINOR', 'UNITCLASS_SWEDISH_HAKKAPELIITTA', NULL),
--	('CIVILIZATION_BARBARIAN', 'UNITCLASS_VENETIAN_GALLEASS', NULL),
--	('CIVILIZATION_MINOR', 'UNITCLASS_VENETIAN_GALLEASS', NULL),
--	('CIVILIZATION_BARBARIAN', 'UNITCLASS_CAVALRY', NULL),
--	('CIVILIZATION_BARBARIAN', 'UNITCLASS_MECHANIZED_INFANTRY', NULL),
--	('CIVILIZATION_BARBARIAN', 'UNITCLASS_IRONCLAD', NULL),
--	('CIVILIZATION_BARBARIAN', 'UNITCLASS_MISSILE_CRUISER', NULL);
