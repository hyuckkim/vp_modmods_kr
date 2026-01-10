-- Lua activation for new beliefs
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'RELIGION_EXTENSIONS';
UPDATE CustomModOptions SET	Value = 1 WHERE	Name = 'YIELD_MODIFIER_FROM_UNITS';
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_FOUND_RELIGION';

INSERT INTO Beliefs
		(Type, 						Description, 						ShortDescription, 						Tooltip, 							Pantheon, 	Founder, 	Follower, 	Enhancer, 	Reformation)
VALUES	('BELIEF_GOD_OF_STORMS', 	'TXT_KEY_BELIEF_GOD_OF_STORMS',		'TXT_KEY_BELIEF_GOD_OF_STORMS_SHORT', 	'TXT_KEY_BELIEF_GOD_OF_STORMS',		1, 			0, 			0, 			0, 			0),
		('BELIEF_TRICKSTER_GOD', 	'TXT_KEY_BELIEF_TRICKSTER_GOD',		'TXT_KEY_BELIEF_TRICKSTER_GOD_SHORT', 	'TXT_KEY_BELIEF_TRICKSTER_GOD',		1, 			0, 			0, 			0, 			0),
		('BELIEF_CITY_OF_GOD', 		'TXT_KEY_BELIEF_CITY_OF_GOD',		'TXT_KEY_BELIEF_CITY_OF_GOD_SHORT', 	'TXT_KEY_BELIEF_CITY_OF_GOD',		0, 			1, 			0, 			0, 			0),
		('BELIEF_PARADISE', 		'TXT_KEY_BELIEF_PARADISE',			'TXT_KEY_BELIEF_PARADISE_SHORT', 		'TXT_KEY_BELIEF_PARADISE',			0, 			1, 			0, 			0, 			0),
		('BELIEF_LIBATIONS', 		'TXT_KEY_BELIEF_LIBATIONS',			'TXT_KEY_BELIEF_LIBATIONS_SHORT', 		'TXT_KEY_BELIEF_LIBATIONS',			0, 			1, 			0, 			0, 			0),
		('BELIEF_WARRIOR_MONKS', 	'TXT_KEY_BELIEF_WARRIOR_MONKS',		'TXT_KEY_BELIEF_WARRIOR_MONKS_SHORT', 	'TXT_KEY_BELIEF_WARRIOR_MONKS',		0, 			0, 			1, 			0, 			0),
		('BELIEF_JUBILEE', 			'TXT_KEY_BELIEF_JUBILEE',			'TXT_KEY_BELIEF_JUBILEE_SHORT', 		'TXT_KEY_BELIEF_JUBILEE',			0, 			0, 			1, 			0, 			0),
		('BELIEF_SWEAT_LODGE', 		'TXT_KEY_BELIEF_SWEAT_LODGE',		'TXT_KEY_BELIEF_SWEAT_LODGE_SHORT', 	'TXT_KEY_BELIEF_SWEAT_LODGE',		0, 			0, 			1, 			0, 			0),
		('BELIEF_DAR_E_MEHR', 		'TXT_KEY_BELIEF_DAR_E_MEHR',		'TXT_KEY_BELIEF_DAR_E_MEHR_SHORT', 		'TXT_KEY_BELIEF_DAR_E_MEHR',		0, 			0, 			1, 			0, 			0),
		('BELIEF_DAOGUAN', 			'TXT_KEY_BELIEF_DAOGUAN',			'TXT_KEY_BELIEF_DAOGUAN_SHORT', 		'TXT_KEY_BELIEF_DAOGUAN',			0, 			0, 			1, 			0, 			0),
		('BELIEF_EMIRATES', 		'TXT_KEY_BELIEF_EMIRATES',			'TXT_KEY_BELIEF_EMIRATES_SHORT', 		'TXT_KEY_BELIEF_EMIRATES',			0, 			0, 			0, 			1,			0),
		('BELIEF_ANIMISM', 			'TXT_KEY_BELIEF_ANIMISM',			'TXT_KEY_BELIEF_ANIMISM_SHORT', 		'TXT_KEY_BELIEF_ANIMISM',			0, 			0, 			0, 			1,			0),
		('BELIEF_WORD_OF_GOD', 		'TXT_KEY_BELIEF_WORD_OF_GOD',		'TXT_KEY_BELIEF_WORD_OF_GOD_SHORT', 	'TXT_KEY_BELIEF_WORD_OF_GOD',		0, 			0, 			0, 			1,			0),
		('BELIEF_ORTHODOXY', 		'TXT_KEY_BELIEF_ORTHODOXY',			'TXT_KEY_BELIEF_ORTHODOXY_SHORT', 		'TXT_KEY_BELIEF_ORTHODOXY',			0, 			0, 			0, 			0, 			1),
		('BELIEF_WORK_ETHIC', 		'TXT_KEY_BELIEF_WORK_ETHIC1',		'TXT_KEY_BELIEF_WORK_ETHIC1_SHORT', 	'TXT_KEY_BELIEF_WORK_ETHIC1',		0, 			0, 			0, 			0, 			1);

INSERT INTO Belief_BuildingClassFaithPurchase
		(BeliefType, 				BuildingClassType)
VALUES	
		('BELIEF_CITY_OF_GOD', 		'BUILDINGCLASS_SACRED_GARDEN'),
		('BELIEF_PARADISE', 		'BUILDINGCLASS_PLACE_OF_TRUTH'),
		('BELIEF_LIBATIONS', 		'BUILDINGCLASS_AKAPANA'),
		('BELIEF_SWEAT_LODGE', 		'BUILDINGCLASS_SWEAT_LODGE'),
		('BELIEF_DAR_E_MEHR', 		'BUILDINGCLASS_DAR_E_MEHR'),
		('BELIEF_DAOGUAN', 			'BUILDINGCLASS_DAOGUAN'),
		('BELIEF_ORTHODOXY', 		'BUILDINGCLASS_COURTHOUSE'),
		('BELIEF_ORTHODOXY', 		'BUILDINGCLASS_CONSTABLE'),
		('BELIEF_ORTHODOXY', 		'BUILDINGCLASS_POLICE_STATION'),
		('BELIEF_WORK_ETHIC', 		'BUILDINGCLASS_WORKSHOP'),
		('BELIEF_WORK_ETHIC', 		'BUILDINGCLASS_WINDMILL'),
		('BELIEF_WORK_ETHIC', 		'BUILDINGCLASS_FACTORY');
---------------------------------------------------------------------------------------------------------------------
-- Trickster God --
---------------------------------------------------------------------------------------------------------------------
INSERT Into Belief_YieldFromImprovementBuild
		(BeliefType, 				YieldType, 			Yield, 	IsEraScaling)
VALUES	('BELIEF_TRICKSTER_GOD', 	'YIELD_SCIENCE', 	12, 	0),
		('BELIEF_TRICKSTER_GOD', 	'YIELD_FAITH', 		12, 	0);
---------------------------------------------------------------------------------------------------------------------
-- God of Storms --
---------------------------------------------------------------------------------------------------------------------
INSERT Into Belief_YieldFromPillageGlobal
		(BeliefType, 				YieldType, 			Yield, 	IsEraScaling)
VALUES	('BELIEF_GOD_OF_STORMS', 	'YIELD_PRODUCTION', 15, 	0),
		('BELIEF_GOD_OF_STORMS', 	'YIELD_FAITH', 		15, 	0);
---------------------------------------------------------------------------------------------------------------------
-- Revelation / City of God / Earthly Paradise --
---------------------------------------------------------------------------------------------------------------------
UPDATE Beliefs SET CityScalerLimiter = 25 WHERE Type = 'BELIEF_CITY_OF_GOD';
UPDATE Beliefs SET CityScalerLimiter = 25 WHERE Type = 'BELIEF_PARADISE';

INSERT INTO Belief_YieldPerHolyCityBirth
		(BeliefType, 			YieldType, 			Yield)
VALUES	('BELIEF_CITY_OF_GOD', 	'YIELD_CULTURE', 	25),
		('BELIEF_CITY_OF_GOD', 	'YIELD_SCIENCE', 	25),
		('BELIEF_CITY_OF_GOD', 	'YIELD_FAITH',		25);

INSERT INTO Belief_YieldPerWorldWonderConstruction
		(BeliefType, 			YieldType, 			Yield)
VALUES	('BELIEF_PARADISE', 	'YIELD_CULTURE', 	25), -- original: 50
		('BELIEF_PARADISE', 	'YIELD_GOLD', 		25),
		('BELIEF_PARADISE', 	'YIELD_FAITH',		25);

INSERT INTO Belief_YieldPerConstruction
		(BeliefType, 			YieldType, 			Yield)
VALUES	('BELIEF_PARADISE', 	'YIELD_GOLD', 		10); -- original: 20

INSERT INTO BuildingClasses
		(Type, 								Description, 							DefaultBuilding, 				MaxPlayerInstances)
VALUES	('BUILDINGCLASS_HEAVENLY_GROTTO', 	'TXT_KEY_BUILDING_HEAVENLY_GROTTO', 	'BUILDING_HEAVENLY_GROTTO', 	1),
		('BUILDINGCLASS_PLACE_OF_TRUTH', 	'TXT_KEY_BUILDING_PLACE_OF_TRUTH', 		'BUILDING_PLACE_OF_TRUTH', 		1);

INSERT INTO Buildings
		(Type,                        	BuildingClass,                     	Description,                          	Civilopedia,                                Help,								      	Strategy,                                    	Happiness, 	BuildingProductionModifier, ArtDefineTag,   Cost, FaithCost, NukeImmune, HurryCostModifier, MinAreaSize, NeverCapture, IconAtlas,			PortraitIndex, HolyCity, ConversionModifier, ReligiousPressureModifier, IsReformation, NumCityCostMod, GlobalFollowerPopRequired, 	ReligiousUnrestFlatReduction, 	UnlockedByBelief, 	FaithToVotes)
VALUES	('BUILDING_HEAVENLY_GROTTO', 	'BUILDINGCLASS_HEAVENLY_GROTTO', 	'TXT_KEY_BUILDING_HEAVENLY_GROTTO', 	'TXT_KEY_BUILDING_HEAVENLY_GROTTO_PEDIA', 	'TXT_KEY_BUILDING_HEAVENLY_GROTTO_HELP', 	'TXT_KEY_BUILDING_HEAVENLY_GROTTO_STRATEGY', 	2, 			0, 							'TEMPLE',       125,  -1,        1,          -20,               -1,          1,            'NEW_BELIEFS_ATLAS',	9,			   1,		 -20,				 25,						1,			   15,			   15,						   	1, 								1,               	10),
		('BUILDING_PLACE_OF_TRUTH', 	'BUILDINGCLASS_PLACE_OF_TRUTH', 	'TXT_KEY_BUILDING_PLACE_OF_TRUTH', 		'TXT_KEY_BUILDING_PLACE_OF_TRUTH_PEDIA', 	'TXT_KEY_BUILDING_PLACE_OF_TRUTH_HELP', 	'TXT_KEY_BUILDING_PLACE_OF_TRUTH_STRATEGY', 	0, 			10, 						'TEMPLE',       125,  -1,        1,          -20,               -1,          1,            'NEW_BELIEFS_ATLAS',	11,			   1,		 -20,				 25,						1,			   15,			   15,						   	1, 								1,               	10);

INSERT INTO Building_ImprovementYieldChangesGlobal
		(BuildingType, 					ImprovementType, 			YieldType, 			Yield)
VALUES	
		('BUILDING_HEAVENLY_GROTTO', 	'IMPROVEMENT_HOLY_SITE', 	'YIELD_GOLD', 		5),
		('BUILDING_PLACE_OF_TRUTH', 	'IMPROVEMENT_HOLY_SITE', 	'YIELD_PRODUCTION', 5);

---------------------------------------------------------------------------------------------------------------------
-- Libations --
---------------------------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses
		(Type, 						Description, 				DefaultBuilding, 	MaxPlayerInstances)
VALUES	('BUILDINGCLASS_AKAPANA', 	'TXT_KEY_BUILDING_AKAPANA', 'BUILDING_AKAPANA', 1);

INSERT INTO Buildings
			(Type,              BuildingClass,           Description,                Civilopedia,                      Help,							Strategy,                            ArtDefineTag,   Cost, 	FaithCost, NukeImmune, HurryCostModifier, MinAreaSize, NeverCapture, IconAtlas,				PortraitIndex, HolyCity, ConversionModifier, ReligiousPressureModifier, IsReformation, NumCityCostMod, GlobalFollowerPopRequired, ReligiousUnrestFlatReduction, UnlockedByBelief, FaithToVotes)
SELECT		'BUILDING_AKAPANA', 'BUILDINGCLASS_AKAPANA', 'TXT_KEY_BUILDING_AKAPANA', 'TXT_KEY_BUILDING_AKAPANA_PEDIA', 'TXT_KEY_BUILDING_AKAPANA_HELP', 'TXT_KEY_BUILDING_AKAPANA_STRATEGY', 'TEMPLE',       -1,  	200,       1,          -1,                -1,          1,            'NEW_BELIEFS_ATLAS',	12,			   1,		 -20,				 100,						0,			   0,			   0,						  1, 							1,               	10;

INSERT INTO BuildingClasses 	
			(Type,									DefaultBuilding,					NoLimit)
VALUES		('BUILDINGCLASS_D_FOR_AKAPANA_STACKS',	'BUILDING_D_FOR_AKAPANA_STACKS',	1),
			('BUILDINGCLASS_D_FOR_AKAPANA_REFORM',	'BUILDING_D_FOR_AKAPANA_REFORM',	1);

INSERT INTO Buildings 	
			(Type,								BuildingClass,							Description,								IsReformation, CapitalOnly, 	GoldMaintenance,	Cost,	FaithCost,	GreatWorkCount, NeverCapture,	NukeImmune, ConquestProb,	HurryCostModifier,	IconAtlas,			PortraitIndex, 	IsDummy)
VALUES		
			('BUILDING_D_FOR_AKAPANA_STACKS',	'BUILDINGCLASS_D_FOR_AKAPANA_STACKS',	'TXT_KEY_BUILDING_D_FOR_AKAPANA_STACKS',	0, 				0, 				0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0, 				1),
			('BUILDING_D_FOR_AKAPANA_REFORM',	'BUILDINGCLASS_D_FOR_AKAPANA_REFORM',	'TXT_KEY_BUILDING_D_FOR_AKAPANA_REFORM',	1, 				0, 				0,					-1,		-1,			-1,				1,				1,          0,				-1,					'CIV_COLOR_ATLAS',	0, 				1);

INSERT INTO	Policies
			(Type, 						Description, 					IsDummy)
VALUES		('POLICY_AKAPANA_DUMMY',	'TXT_KEY_POLICY_AKAPANA_DUMMY', 1);

INSERT INTO Building_ImprovementYieldChangesGlobal
		(BuildingType, 			ImprovementType, 		YieldType, 		Yield)
VALUES	('BUILDING_AKAPANA', 	'IMPROVEMENT_HOLY_SITE', 'YIELD_FAITH', 5);

INSERT INTO Building_BuildingClassLocalYieldChanges
		(BuildingType,						BuildingClassType,			YieldType,					YieldChange)
VALUES	('BUILDING_D_FOR_AKAPANA_STACKS',	'BUILDINGCLASS_AKAPANA',	'YIELD_FOOD',				1),
		('BUILDING_D_FOR_AKAPANA_STACKS',	'BUILDINGCLASS_AKAPANA',	'YIELD_PRODUCTION',			1),
		('BUILDING_D_FOR_AKAPANA_STACKS',	'BUILDINGCLASS_AKAPANA',	'YIELD_GOLD',				1),
		('BUILDING_D_FOR_AKAPANA_STACKS',	'BUILDINGCLASS_AKAPANA',	'YIELD_SCIENCE',			1),
		('BUILDING_D_FOR_AKAPANA_STACKS',	'BUILDINGCLASS_AKAPANA',	'YIELD_CULTURE',			1),
		('BUILDING_D_FOR_AKAPANA_STACKS',	'BUILDINGCLASS_AKAPANA',	'YIELD_FAITH',				1),
		('BUILDING_D_FOR_AKAPANA_STACKS',	'BUILDINGCLASS_AKAPANA',	'YIELD_TOURISM',			1),
		('BUILDING_D_FOR_AKAPANA_STACKS',	'BUILDINGCLASS_AKAPANA',	'YIELD_GOLDEN_AGE_POINTS',	1);

INSERT INTO UnitClasses
			(Type,								Description,							DefaultUnit)
VALUES		('UNITCLASS_AKAPANA_CHALLA_RITUAL',	'TXT_KEY_UNIT_AKAPANA_CHALLA_RITUAL',	'UNIT_AKAPANA_CHALLA_RITUAL');

INSERT INTO Units 	
			(Type,							Class, 								PolicyType, 			Description, 							Civilopedia, 								Strategy, 										Help, 										ReligionSpreads, ReligiousStrength, 		PrereqTech,	Range, BaseSightRange, RangedCombat, Combat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, Immobile, CombatClass, Domain, DefaultUnitAI, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfo, UnitFlagIconOffset, UnitFlagAtlas,	PortraitIndex, 	IconAtlas,				MoveRate, PurchaseCooldown)
SELECT		'UNIT_AKAPANA_CHALLA_RITUAL',	'UNITCLASS_AKAPANA_CHALLA_RITUAL',	'POLICY_AKAPANA_DUMMY', 'TXT_KEY_UNIT_AKAPANA_CHALLA_RITUAL',	'TXT_KEY_UNIT_AKAPANA_CHALLA_RITUAL_TEXT',	'TXT_KEY_UNIT_AKAPANA_CHALLA_RITUAL_STRATEGY',	'TXT_KEY_UNIT_AKAPANA_CHALLA_RITUAL_HELP',	ReligionSpreads, ReligiousStrength+1000, 	PrereqTech,	Range, BaseSightRange, RangedCombat, Combat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, Immobile, CombatClass, Domain, DefaultUnitAI, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfo, UnitFlagIconOffset, UnitFlagAtlas,	6, 				'NEW_BELIEFS_ATLAS',	MoveRate, PurchaseCooldown
FROM Units WHERE Type = 'UNIT_MISSIONARY';

INSERT INTO Unit_BuildingClassRequireds 
		(UnitType, 						BuildingClassType)
VALUES	('UNIT_AKAPANA_CHALLA_RITUAL', 	'BUILDINGCLASS_AKAPANA');

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT		'UNIT_AKAPANA_CHALLA_RITUAL', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_MISSIONARY';	
INSERT INTO Unit_AITypes 	
			(UnitType, 						UnitAIType)
SELECT		'UNIT_AKAPANA_CHALLA_RITUAL',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_MISSIONARY';

INSERT INTO Unit_Flavors 	
			(UnitType, 						FlavorType,					Flavor)
VALUES		('UNIT_AKAPANA_CHALLA_RITUAL',	'FLAVOR_CULTURE',			10),
			('UNIT_AKAPANA_CHALLA_RITUAL',	'FLAVOR_GOLD',				10),
			('UNIT_AKAPANA_CHALLA_RITUAL',	'FLAVOR_PRODUCTION',		10),
			('UNIT_AKAPANA_CHALLA_RITUAL',	'FLAVOR_SCIENCE',			10),
			('UNIT_AKAPANA_CHALLA_RITUAL',	'FLAVOR_WONDER',			10),
			('UNIT_AKAPANA_CHALLA_RITUAL',	'FLAVOR_INFRASTRUCTURE',	10);
---------------------------------------------------------------------------------------------------------------------
--Sweat Lodge / Dar e Mehr / Gurdwara / Daoguan --
---------------------------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses 	
		(Type, 							DefaultBuilding, 		Description)
VALUES	('BUILDINGCLASS_SWEAT_LODGE', 	'BUILDING_SWEAT_LODGE', 'TXT_KEY_BUILDING_SWEAT_LODGE'),
		('BUILDINGCLASS_DAR_E_MEHR', 	'BUILDING_DAR_E_MEHR', 	'TXT_KEY_BUILDING_DAR_E_MEHR'),
		('BUILDINGCLASS_DAOGUAN', 		'BUILDING_DAOGUAN', 	'TXT_KEY_BUILDING_DAOGUAN');

UPDATE Beliefs SET Tooltip = 'TXT_KEY_BUILDING_SWEAT_LODGE_TOOLTIP' WHERE Type = 'BELIEF_SWEAT_LODGE';
UPDATE Beliefs SET Tooltip = 'TXT_KEY_BUILDING_DAR_E_MEHR_TOOLTIP' WHERE Type = 'BELIEF_DAR_E_MEHR';
UPDATE Beliefs SET Tooltip = 'TXT_KEY_BUILDING_DAOGUAN_TOOLTIP' WHERE Type = 'BELIEF_DAOGUAN';

INSERT INTO Buildings 	
		(Type, 						BuildingClass, 					Description, 						Civilopedia, 							Strategy, 									Help,  									ReligiousPressureModifier, 	ConversionModifier, 	AlwaysHeal, DistressFlatReduction, 	Cost, UnlockedByBelief, FaithCost, NukeImmune, ConquestProb, ArtDefineTag, MinAreaSize, IconAtlas,	 			PortraitIndex)
SELECT	'BUILDING_SWEAT_LODGE', 	'BUILDINGCLASS_SWEAT_LODGE', 	'TXT_KEY_BUILDING_SWEAT_LODGE', 	'TXT_KEY_BUILDING_SWEAT_LODGE_PEDIA', 	'TXT_KEY_BUILDING_SWEAT_LODGE_STRATEGY', 	'TXT_KEY_BUILDING_SWEAT_LODGE_HELP', 	25, 						-10, 					5, 			1, 						Cost, UnlockedByBelief, FaithCost, NukeImmune, ConquestProb, ArtDefineTag, MinAreaSize, 'NEW_BELIEFS_ATLAS', 	2
FROM Buildings WHERE Type = 'BUILDING_CHURCH';

INSERT INTO Buildings 	
		(Type, 					BuildingClass, 					Description, 					Civilopedia, 							Strategy, 									Help,  									ReligiousPressureModifier, 	ConversionModifier, GreatWorkSlotType, 				GreatWorkCount, BoredomFlatReduction, 	Cost, UnlockedByBelief, FaithCost, NukeImmune, ConquestProb, ArtDefineTag, MinAreaSize, IconAtlas,	 			PortraitIndex)
SELECT	'BUILDING_DAR_E_MEHR', 	'BUILDINGCLASS_DAR_E_MEHR', 	'TXT_KEY_BUILDING_DAR_E_MEHR', 	'TXT_KEY_BUILDING_DAR_E_MEHR_PEDIA', 	'TXT_KEY_BUILDING_DAR_E_MEHR_STRATEGY', 	'TXT_KEY_BUILDING_DAR_E_MEHR_HELP', 	25, 						-10, 				'GREAT_WORK_SLOT_ART_ARTIFACT', 1, 				1, 						Cost, UnlockedByBelief, FaithCost, NukeImmune, ConquestProb, ArtDefineTag, MinAreaSize, 'NEW_BELIEFS_ATLAS', 	1
FROM Buildings WHERE Type = 'BUILDING_CHURCH';

INSERT INTO Buildings 	
		(Type, 					BuildingClass, 				Description, 					Civilopedia, 						Strategy, 								Help,  								ReligiousPressureModifier, 	ConversionModifier, GreatWorkSlotType,				GreatWorkCount, GreatPeopleRateModifier, 	NoUnhappfromXSpecialists, 	DistressFlatReduction, 	Cost, UnlockedByBelief, FaithCost, NukeImmune, ConquestProb, ArtDefineTag, MinAreaSize, IconAtlas,	 			PortraitIndex)
SELECT	'BUILDING_DAOGUAN', 	'BUILDINGCLASS_DAOGUAN', 	'TXT_KEY_BUILDING_DAOGUAN', 	'TXT_KEY_BUILDING_DAOGUAN_PEDIA', 	'TXT_KEY_BUILDING_DAOGUAN_STRATEGY', 	'TXT_KEY_BUILDING_DAOGUAN_HELP', 	25, 						-10, 				'GREAT_WORK_SLOT_LITERATURE', 	1, 				25, 						1, 							1, 						Cost, UnlockedByBelief, FaithCost, NukeImmune, ConquestProb, ArtDefineTag, MinAreaSize, 'NEW_BELIEFS_ATLAS', 	4
FROM Buildings WHERE Type = 'BUILDING_CHURCH';
UPDATE Buildings SET GreatPeopleRateModifier=0, SpySecurityModifier=20 WHERE Type = 'BUILDING_DAOGUAN';

INSERT INTO Building_YieldChanges
		(BuildingType, 					YieldType, 					Yield)
VALUES	
		('BUILDING_HEAVENLY_GROTTO', 	'YIELD_FAITH', 				2),
		('BUILDING_PLACE_OF_TRUTH', 	'YIELD_FAITH', 				2),
		('BUILDING_PLACE_OF_TRUTH', 	'YIELD_PRODUCTION', 		6),
		('BUILDING_SWEAT_LODGE', 		'YIELD_FAITH', 				2),
		('BUILDING_SWEAT_LODGE', 		'YIELD_SCIENCE', 			2),
		('BUILDING_DAR_E_MEHR', 		'YIELD_FAITH', 				3),
		('BUILDING_DAR_E_MEHR', 		'YIELD_CULTURE', 			2),
		('BUILDING_DAOGUAN', 			'YIELD_FAITH', 				4);

INSERT INTO Building_Flavors
	(BuildingType, FlavorType, Flavor)
VALUES
	('BUILDING_HEAVENLY_GROTTO', 	'FLAVOR_RELIGION', 		200),
	('BUILDING_HEAVENLY_GROTTO', 	'FLAVOR_HAPPINESS', 	30),
	('BUILDING_HEAVENLY_GROTTO', 	'FLAVOR_GOLD', 			30),
	('BUILDING_PLACE_OF_TRUTH', 	'FLAVOR_RELIGION', 		200),
	('BUILDING_PLACE_OF_TRUTH', 	'FLAVOR_PRODUCTION', 	60),
	('BUILDING_SWEAT_LODGE', 		'FLAVOR_DEFENSE', 		10),
	('BUILDING_SWEAT_LODGE', 		'FLAVOR_SCIENCE', 		20),
	('BUILDING_SWEAT_LODGE', 		'FLAVOR_RELIGION', 		30),
	('BUILDING_DAR_E_MEHR', 		'FLAVOR_CULTURE', 		20),
	('BUILDING_DAR_E_MEHR', 		'FLAVOR_RELIGION', 		40),
	('BUILDING_DAOGUAN', 			'FLAVOR_ESPIONAGE', 	20),
	('BUILDING_DAOGUAN', 			'FLAVOR_RELIGION', 		50),
	('BUILDING_AKAPANA', 			'FLAVOR_RELIGION', 		200),
	('BUILDING_AKAPANA', 			'FLAVOR_SCIENCE', 		15),
	('BUILDING_AKAPANA', 			'FLAVOR_CULTURE', 		15),
	('BUILDING_AKAPANA', 			'FLAVOR_GROWTH', 		15),
	('BUILDING_AKAPANA', 			'FLAVOR_PRODUCTION', 	15),
	('BUILDING_AKAPANA', 			'FLAVOR_GOLD', 			15),
	('BUILDING_AKAPANA', 			'FLAVOR_WONDER', 		100);

INSERT INTO Building_ImprovementYieldChanges
			(BuildingType, 				ImprovementType, 			YieldType, 			Yield)
VALUES		('BUILDING_SWEAT_LODGE', 	'IMPROVEMENT_CAMP',			'YIELD_SCIENCE', 	1),
			('BUILDING_SWEAT_LODGE', 	'IMPROVEMENT_PLANTATION',	'YIELD_SCIENCE', 	1);
		
INSERT INTO Building_YieldFromYieldPercent
			(BuildingType, 				YieldIn, 			YieldOut, 		Value)
VALUES		('BUILDING_DAR_E_MEHR', 	'YIELD_CULTURE', 	'YIELD_FAITH', 	10);

---------------------------------------------------------------------------------------------------------------------
-- Jubilee --
---------------------------------------------------------------------------------------------------------------------
UPDATE Beliefs SET HappinessPerCity = 2 WHERE Type = 'BELIEF_JUBILEE';

INSERT INTO Belief_MaxYieldPerFollower
		(BeliefType, 		YieldType, 					Max)
VALUES	('BELIEF_JUBILEE', 	'YIELD_GOLDEN_AGE_POINTS', 	10);

INSERT INTO Belief_MaxYieldPerFollowerPercent
		(BeliefType, 		YieldType, 					Max)
VALUES	('BELIEF_JUBILEE', 	'YIELD_GOLDEN_AGE_POINTS', 	50);
---------------------------------------------------------------------------------------------------------------------
-- Emirates --
---------------------------------------------------------------------------------------------------------------------
UPDATE Beliefs SET PressureChangeTradeRoute = 200 WHERE Type = 'BELIEF_EMIRATES';
UPDATE Beliefs SET FriendlyCityStateSpreadModifier = 200 WHERE Type = 'BELIEF_EMIRATES';

INSERT INTO Belief_YieldPerActiveTR
		(BeliefType, 		YieldType, 			Yield)
VALUES	('BELIEF_EMIRATES', 'YIELD_SCIENCE', 	2),
		('BELIEF_EMIRATES', 'YIELD_CULTURE', 	2);
---------------------------------------------------------------------------------------------------------------------
-- Animism --
---------------------------------------------------------------------------------------------------------------------
INSERT INTO Belief_YieldChangeNaturalWonder
		(BeliefType, 		YieldType, 			Yield)
VALUES	('BELIEF_ANIMISM', 	'YIELD_FOOD', 		1),
		('BELIEF_ANIMISM', 	'YIELD_CULTURE', 	1);

INSERT INTO Belief_UnimprovedFeatureYieldChanges
		(BeliefType, 		FeatureType, 		YieldType, 			Yield)
VALUES	('BELIEF_ANIMISM', 	'FEATURE_FOREST', 	'YIELD_FOOD', 		1),
		('BELIEF_ANIMISM', 	'FEATURE_FOREST', 	'YIELD_CULTURE', 	1),
		('BELIEF_ANIMISM', 	'FEATURE_OASIS', 	'YIELD_FOOD', 		1),
		('BELIEF_ANIMISM', 	'FEATURE_OASIS', 	'YIELD_CULTURE', 	1),
		('BELIEF_ANIMISM', 	'FEATURE_MARSH', 	'YIELD_FOOD', 		1),
		('BELIEF_ANIMISM', 	'FEATURE_MARSH', 	'YIELD_CULTURE', 	1),
		('BELIEF_ANIMISM', 	'FEATURE_JUNGLE', 	'YIELD_FOOD', 		1),
		('BELIEF_ANIMISM', 	'FEATURE_JUNGLE', 	'YIELD_CULTURE', 	1),
		('BELIEF_ANIMISM', 	'FEATURE_ATOLL', 	'YIELD_FOOD', 		1),
		('BELIEF_ANIMISM', 	'FEATURE_ATOLL', 	'YIELD_CULTURE', 	1);
---------------------------------------------------------------------------------------------------------------------
-- Animism --
---------------------------------------------------------------------------------------------------------------------
UPDATE Beliefs SET MissionaryInfluenceCS = 5 WHERE Type = 'BELIEF_WORD_OF_GOD';

INSERT INTO Belief_SpecificFaithUnitPurchase
		(BeliefType, 		UnitType)
VALUES	('BELIEF_WORD_OF_GOD', 'UNIT_EMISSARY'),
		('BELIEF_WORD_OF_GOD', 'UNIT_ENVOY'),
		('BELIEF_WORD_OF_GOD', 'UNIT_DIPLOMAT'),
		('BELIEF_WORD_OF_GOD', 'UNIT_AMBASSADOR');

UPDATE Units SET RequiresFaithPurchaseEnabled = '1'	WHERE Type = 'UNIT_EMISSARY';
UPDATE Units SET RequiresFaithPurchaseEnabled = '1'	WHERE Type = 'UNIT_ENVOY';
UPDATE Units SET RequiresFaithPurchaseEnabled = '1'	WHERE Type = 'UNIT_DIPLOMAT';
UPDATE Units SET RequiresFaithPurchaseEnabled = '1'	WHERE Type = 'UNIT_AMBASSADOR';

--UPDATE Units SET BeliefRequired = 'BELIEF_WORD_OF_GOD'	WHERE Type = 'UNIT_EMISSARY';
--UPDATE Units SET BeliefRequired = 'BELIEF_WORD_OF_GOD'	WHERE Type = 'UNIT_ENVOY';
--UPDATE Units SET BeliefRequired = 'BELIEF_WORD_OF_GOD'	WHERE Type = 'UNIT_DIPLOMAT';
--UPDATE Units SET BeliefRequired = 'BELIEF_WORD_OF_GOD'	WHERE Type = 'UNIT_AMBASSADOR';

UPDATE Units SET FaithCost = '200' WHERE Type = 'UNIT_EMISSARY';
UPDATE Units SET FaithCost = '300' WHERE Type = 'UNIT_ENVOY';
UPDATE Units SET FaithCost = '500' WHERE Type = 'UNIT_DIPLOMAT';
UPDATE Units SET FaithCost = '700' WHERE Type = 'UNIT_AMBASSADOR';
---------------------------------------------------------------------------------------------------------------------
-- Orthodoxy --
---------------------------------------------------------------------------------------------------------------------
UPDATE Beliefs SET CombatModifierEnemyCities = 15 WHERE Type = 'BELIEF_ORTHODOXY';
UPDATE Beliefs SET CombatModifierFriendlyCities = 15 WHERE Type = 'BELIEF_ORTHODOXY';

UPDATE Buildings SET UnlockedByBelief = '1' WHERE BuildingClass = 'BUILDINGCLASS_COURTHOUSE';
UPDATE Buildings SET UnlockedByBelief = '1' WHERE BuildingClass = 'BUILDINGCLASS_CONSTABLE';
UPDATE Buildings SET UnlockedByBelief = '1' WHERE BuildingClass = 'BUILDINGCLASS_POLICE_STATION';

UPDATE Buildings SET FaithCost = '200' WHERE BuildingClass = 'BUILDINGCLASS_COURTHOUSE';
UPDATE Buildings SET FaithCost = '350' WHERE BuildingClass = 'BUILDINGCLASS_CONSTABLE';
UPDATE Buildings SET FaithCost = '600' WHERE BuildingClass = 'BUILDINGCLASS_POLICE_STATION';

INSERT INTO Belief_BuildingClassYieldChanges
		(BeliefType, 			BuildingClassType, 				YieldType, 			YieldChange)
VALUES	('BELIEF_ORTHODOXY', 	'BUILDINGCLASS_COURTHOUSE', 	'YIELD_GOLD', 		4),
		('BELIEF_ORTHODOXY', 	'BUILDINGCLASS_COURTHOUSE', 	'YIELD_FAITH', 		2),
		('BELIEF_ORTHODOXY', 	'BUILDINGCLASS_CONSTABLE', 		'YIELD_GOLD', 		4),
		('BELIEF_ORTHODOXY', 	'BUILDINGCLASS_CONSTABLE', 		'YIELD_FAITH', 		2),
		('BELIEF_ORTHODOXY', 	'BUILDINGCLASS_POLICE_STATION', 'YIELD_GOLD', 		4),
		('BELIEF_ORTHODOXY', 	'BUILDINGCLASS_POLICE_STATION', 'YIELD_FAITH', 		2);
---------------------------------------------------------------------------------------------------------------------
-- Work Ethic --
---------------------------------------------------------------------------------------------------------------------
UPDATE Buildings SET UnlockedByBelief = '1' WHERE BuildingClass = 'BUILDINGCLASS_WORKSHOP';
UPDATE Buildings SET UnlockedByBelief = '1' WHERE BuildingClass = 'BUILDINGCLASS_WINDMILL';
UPDATE Buildings SET UnlockedByBelief = '1' WHERE BuildingClass = 'BUILDINGCLASS_FACTORY';
UPDATE Buildings SET UnlockedByBelief = '0' WHERE Type = 'BUILDING_AKAPANA_CENOBIUM';

UPDATE Buildings SET FaithCost = '200' WHERE BuildingClass = 'BUILDINGCLASS_WORKSHOP';
UPDATE Buildings SET FaithCost = '350' WHERE BuildingClass = 'BUILDINGCLASS_WINDMILL';
UPDATE Buildings SET FaithCost = '400' WHERE BuildingClass = 'BUILDINGCLASS_FACTORY';

INSERT INTO Belief_BuildingClassYieldChanges
		(BeliefType, 			BuildingClassType, 			YieldType, 			YieldChange)
VALUES	('BELIEF_WORK_ETHIC', 	'BUILDINGCLASS_WORKSHOP', 	'YIELD_PRODUCTION', 2),
		('BELIEF_WORK_ETHIC', 	'BUILDINGCLASS_WINDMILL', 	'YIELD_PRODUCTION', 2),
		('BELIEF_WORK_ETHIC', 	'BUILDINGCLASS_FACTORY', 	'YIELD_PRODUCTION', 2);
--==========================================================================================================================
-- PROMOTIONS
--==========================================================================================================================
-- God of Storms / Warrior Monks / Animism / Work Ethic -- 
---------------------------------------------------------------------------------------------------------------------
--------------------------------	
-- Belief_FreePromotions
--------------------------------
INSERT INTO Belief_FreePromotions
		(BeliefType, 				PromotionType)
VALUES	('BELIEF_GOD_OF_STORMS',	'PROMOTION_GOD_OF_STORMS'),
		('BELIEF_WARRIOR_MONKS',	'PROMOTION_WARRIOR_MONK'),
		('BELIEF_ANIMISM',			'PROMOTION_ANIMISM'),
		('BELIEF_WORK_ETHIC',		'PROMOTION_WORK_ETHIC'); 
--------------------------------	
-- UnitPromotions
--------------------------------		
INSERT INTO UnitPromotions
		(Type,                      Description,                      	Help,                                   Sound,             CannotBeChosen,	DefenseMod, ExperiencePercent,	ReligiousPressureModifier,	IgnoreTerrainCost, 	WorkRateMod, 	PortraitIndex,	IconAtlas,      			PediaType, 		PediaEntry)
VALUES	('PROMOTION_GOD_OF_STORMS', 'TXT_KEY_PROMOTION_GOD_OF_STORMS', 	'TXT_KEY_PROMOTION_GOD_OF_STORMS_HELP', 'AS2D_IF_LEVELUP', 1, 				0, 			0,					0,      					0, 					0,           	54,           	'PROMOTION_ATLAS_VP_06',	'PEDIA_SHARED', 'TXT_KEY_PROMOTION_GOD_OF_STORMS'),
		('PROMOTION_WARRIOR_MONK', 	'TXT_KEY_PROMOTION_WARRIOR_MONK', 	'TXT_KEY_PROMOTION_WARRIOR_MONK_HELP',  'AS2D_IF_LEVELUP', 1, 				20, 		33,					30,      					0, 					0,           	6,           	'PROMOTION_ATLAS_VP_04',	'PEDIA_MELEE', 	'TXT_KEY_PROMOTION_WARRIOR_MONK'),
		('PROMOTION_ANIMISM', 		'TXT_KEY_PROMOTION_ANIMISM', 		'TXT_KEY_PROMOTION_ANIMISM_HELP',    	'AS2D_IF_LEVELUP', 1, 				0, 			0,					0,      					1, 					0,           	29,           	'PROMOTION_ATLAS_VP_01',	'PEDIA_SHARED', 'TXT_KEY_PROMOTION_ANIMISM'),
		('PROMOTION_WORK_ETHIC', 	'TXT_KEY_PROMOTION_WORK_ETHIC', 	'TXT_KEY_PROMOTION_WORK_ETHIC_HELP',    'AS2D_IF_LEVELUP', 1, 				0, 			0,					0,      					0, 					25,           	36,           	'PROMOTION_ATLAS_VP_06',	'PEDIA_SHARED', 'TXT_KEY_PROMOTION_WORK_ETHIC');
--------------------------------
-- UnitPromotions_UnitCombats
--------------------------------
INSERT INTO UnitPromotions_UnitCombats
		(PromotionType, 			UnitCombatType)
VALUES	('PROMOTION_WARRIOR_MONK', 	'UNITCOMBAT_MELEE'),
		('PROMOTION_WARRIOR_MONK', 	'UNITCOMBAT_GUN'),
		('PROMOTION_ANIMISM', 		'UNITCOMBAT_MISSIONARY'),
		('PROMOTION_GOD_OF_STORMS', 'UNITCOMBAT_RECON'),
		('PROMOTION_GOD_OF_STORMS', 'UNITCOMBAT_ARCHER'),
		('PROMOTION_GOD_OF_STORMS', 'UNITCOMBAT_MELEE'),
		('PROMOTION_GOD_OF_STORMS', 'UNITCOMBAT_SIEGE'),
		('PROMOTION_GOD_OF_STORMS', 'UNITCOMBAT_GUN'),
		('PROMOTION_GOD_OF_STORMS', 'UNITCOMBAT_HELICOPTER'),
		('PROMOTION_GOD_OF_STORMS', 'UNITCOMBAT_MOUNTED'),
		('PROMOTION_GOD_OF_STORMS', 'UNITCOMBAT_ARMOR'),
		('PROMOTION_GOD_OF_STORMS', 'UNITCOMBAT_NAVALMELEE'),
		('PROMOTION_GOD_OF_STORMS', 'UNITCOMBAT_NAVALRANGED'),
		('PROMOTION_GOD_OF_STORMS', 'UNITCOMBAT_CARRIER'),
		('PROMOTION_GOD_OF_STORMS', 'UNITCOMBAT_SUBMARINE');

INSERT INTO UnitPromotions_CivilianUnitType
		(PromotionType, 			UnitType)
VALUES	('PROMOTION_WORK_ETHIC', 	'UNIT_WORKER'),
		('PROMOTION_WORK_ETHIC', 	'UNIT_ARCHAEOLOGIST');
--------------------------------	
-- UnitPromotions_YieldChanges
--------------------------------
INSERT INTO	UnitPromotions_YieldChanges
			(PromotionType, 			YieldType,			Yield)
VALUES		('PROMOTION_GOD_OF_STORMS', 'YIELD_FAITH', 		2);
--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
--------------------------------
-- IconTextureAtlases
--------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 						IconSize, 	Filename, 						IconsPerRow, 	IconsPerColumn)
VALUES	('NEW_BELIEFS_ATLAS', 			256, 		'MoreBeliefs256.dds',			7, 				2),
		('NEW_BELIEFS_ATLAS', 			128, 		'MoreBeliefs128.dds',			7, 				2),
		('NEW_BELIEFS_ATLAS', 			80, 		'MoreBeliefs080.dds',			7, 				2),
		('NEW_BELIEFS_ATLAS', 			64, 		'MoreBeliefs064.dds',			7, 				2),
		('NEW_BELIEFS_ATLAS', 			45, 		'MoreBeliefs045.dds',			7, 				2),
		('NEW_BELIEFS_ATLAS', 			32, 		'MoreBeliefs032.dds',			7, 				2);
--==========================================================================================================================
--==========================================================================================================================