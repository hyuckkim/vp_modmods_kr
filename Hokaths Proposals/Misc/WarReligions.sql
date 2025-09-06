-- Lua activation for new beliefs
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'RELIGION_EXTENSIONS';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'YIELD_MODIFIER_FROM_UNITS';
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'EVENTS_FOUND_RELIGION';
-----------------------------------------------------------------------------------------------
INSERT INTO Beliefs
	(Type, 	Description, 	ShortDescription, Tooltip, 
	Pantheon,  Founder,  Follower, 	Enhancer,  Reformation)
VALUES	
	('BELIEF_GONGFU', 	'TXT_KEY_BELIEF_GONGFU', 		'TXT_KEY_BELIEF_GONGFU_SHORT',          'TXT_KEY_BELIEF_GONGFU',		
	0, 	1, 	  0, 	 0, 	 0),
	('BELIEF_ETERNAL_GLORY', 'TXT_KEY_BELIEF_ETERNAL_GLORY',      'TXT_KEY_BELIEF_ETERNAL_GLORY_SHORT',  'TXT_KEY_BELIEF_ETERNAL_GLORY',		
	0, 	1, 	  0, 	 0, 	 0),
	('BELIEF_CREMATION', 	'TXT_KEY_BELIEF_CREMATION',		'TXT_KEY_BELIEF_CREMATION_SHORT', 	'TXT_KEY_BELIEF_CREMATION',		
	0, 	0, 	  0, 	 1, 	 0),
	('BELIEF_DHARMA_WAR', 	'TXT_KEY_BELIEF_DHARMA_WAR',		'TXT_KEY_BELIEF_DHARMA_WAR_SHORT', 	'TXT_KEY_BELIEF_DHARMA_WAR',		
	0, 	0, 	  0, 	 1, 	 0);

INSERT INTO BuildingClasses
	(Type, 		Description, 	DefaultBuilding, 	MaxPlayerInstances)
VALUES	
	('BUILDINGCLASS_MARTIAL_SANCTUM', 	'TXT_KEY_BUILDING_MARTIAL_SANCTUM', 'BUILDING_MARTIAL_SANCTUM', 1),
	('BUILDINGCLASS_STAIRWAY_TO_HEAVEN',  'TXT_KEY_BUILDING_STAIRWAY_TO_HEAVEN', 'BUILDING_STAIRWAY_TO_HEAVEN', 1);

INSERT INTO Buildings
	(Type,              BuildingClass,           Description,                Civilopedia,                      Help,							Strategy,  
         ArtDefineTag,   Cost, 	FaithCost, NukeImmune, HurryCostModifier, MinAreaSize, NeverCapture, IconAtlas,				PortraitIndex, HolyCity, 
	ConversionModifier, ReligiousPressureModifier, IsReformation, NumCityCostMod, GlobalFollowerPopRequired, ReligiousUnrestFlatReduction, UnlockedByBelief, FaithToVotes)
VALUES		
	('BUILDING_MARTIAL_SANCTUM', 'BUILDINGCLASS_MARTIAL_SANCTUM', 'TXT_KEY_BUILDING_MARTIAL_SANCTUM', 'TXT_KEY_BUILDING_MARTIAL_SANCTUM_PEDIA', 'TXT_KEY_BUILDING_MARTIAL_SANCTUM_HELP', 'TXT_KEY_BUILDING_MARTIAL_SANCTUM_STRATEGY', 
	'TEMPLE',       125,  	-1,       1,          -1,                -1,          1,            'CORP2_ATLAS',	10,			   1,		 
		-20,	 25,				1,			   15,		   15,				  1, 				1,           	10),
	('BUILDING_STAIRWAY_TO_HEAVEN', 'BUILDINGCLASS_STAIRWAY_TO_HEAVEN', 'TXT_KEY_BUILDING_STAIRWAY_TO_HEAVEN', 'TXT_KEY_BUILDING_STAIRWAY_TO_HEAVEN_PEDIA', 'TXT_KEY_BUILDING_STAIRWAY_TO_HEAVEN_HELP', 'TXT_KEY_BUILDING_STAIRWAY_TO_HEAVEN_STRATEGY', 
	'TEMPLE',       125,  	-1,       1,          -1,                -1,          1,            'CORP2_ATLAS',	9,			   1,		 
		-40,	 50,				1,			   15,		   15,				  1, 				1,           	10);

INSERT INTO Building_ImprovementYieldChangesGlobal
	(BuildingType, 					ImprovementType, 			YieldType, 			Yield)
VALUES	
	('BUILDING_MARTIAL_SANCTUM', 	'IMPROVEMENT_HOLY_SITE', 	'YIELD_GREAT_GENERAL_POINTS', 5),
	('BUILDING_STAIRWAY_TO_HEAVEN', 'IMPROVEMENT_HOLY_SITE', 	'YIELD_GREAT_ADMIRAL_POINTS', 5);

INSERT INTO Belief_BuildingClassFaithPurchase
	(BeliefType, 			 BuildingClassType)
VALUES	
	('BELIEF_GONGFU', 		'BUILDINGCLASS_MARTIAL_SANCTUM'),
	('BELIEF_ETERNAL_GLORY', 	'BUILDINGCLASS_STAIRWAY_TO_HEAVEN');

INSERT INTO Building_DomainFreeExperiences
	(BuildingType, DomainType, Experience)
VALUES
	('BUILDING_MARTIAL_SANCTUM', 'DOMAIN_LAND', 15),
	('BUILDING_MARTIAL_SANCTUM', 'DOMAIN_SEA', 15),
	('BUILDING_MARTIAL_SANCTUM', 'DOMAIN_AIR', 15);

INSERT INTO Building_YieldFromVictoryGlobalPlayer
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_STAIRWAY_TO_HEAVEN', 'YIELD_FAITH', 2),
	('BUILDING_STAIRWAY_TO_HEAVEN', 'YIELD_CULTURE_LOCAL', 2);
-- assumed to be era scaling

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_MARTIAL_SANCTUM', 'YIELD_FAITH', 3),
	('BUILDING_MARTIAL_SANCTUM', 'YIELD_PRODUCTION', 3),
	('BUILDING_MARTIAL_SANCTUM', 'YIELD_GREAT_GENERAL_POINTS', 3),

	('BUILDING_STAIRWAY_TO_HEAVEN', 'YIELD_FAITH', 4),
	('BUILDING_STAIRWAY_TO_HEAVEN', 'YIELD_CULTURE_LOCAL', 8),

	('BUILDING_MAUSOLEUM', 'YIELD_CULTURE', 3),
	
	('BUILDING_GREAT_ALTAR', 'YIELD_PRODUCTION', 5);

-- this is odd-one-out for yields, buff it
UPDATE Language_en_US
SET Text = Replace(Text, '+5 [ICON_PEACE] Faith', '+3 [ICON_CULTURE] Culture, +5 [ICON_PEACE] Faith')
WHERE Tag = 'TXT_KEY_BELIEF_CEREMONIAL_BURIAL';

-----------------------------------------------------------------------------------------------

-- hero worship/interfaith dialogue/ritual sacrifice
DELETE FROM Belief_YieldFromConquest WHERE BeliefType = 'BELIEF_INTERFAITH_DIALOGUE';
INSERT INTO Belief_YieldFromRemoveHeresy
	(BeliefType, YieldType, Yield)
VALUES
	('BELIEF_INTERFAITH_DIALOGUE', 'YIELD_GOLDEN_AGE_POINTS', 50),
	('BELIEF_INTERFAITH_DIALOGUE', 'YIELD_FAITH', 50);

INSERT INTO Belief_YieldPerOtherReligionFollower
	(BeliefType, YieldType, Yield)
VALUES
	('BELIEF_INTERFAITH_DIALOGUE', 'YIELD_FOOD', 2),
	('BELIEF_INTERFAITH_DIALOGUE', 'YIELD_PRODUCTION', 2);

UPDATE Beliefs SET 
FollowerScalerLimiter = 100
WHERE Type = 'BELIEF_INTERFAITH_DIALOGUE';

UPDATE Language_en_US
SET Text = 'Ritual Sacrifice'
WHERE Tag = 'TXT_KEY_BELIEF_INTERFAITH_DIALOGUE_SHORT';

UPDATE Language_en_US
SET Text = '+1 [ICON_FOOD] Food and [ICON_PRODUCTION] Production in the Holy City for every 2 Followers of other [ICON_RELIGION] Religions in owned Cities (max 100 Followers). Receive 50 [ICON_PEACE] Faith and [ICON_GOLDEN_AGE] Golden Age Points per converted [ICON_CITIZEN] Citizen when [ICON_INQUISITOR] Removing Heresy.[NEWLINE]Unlocks [COLOR_POSITIVE_TEXT]Great Altar National Wonder[ENDCOLOR] (+5 [ICON_PRODUCTION] Production and [ICON_PEACE] Faith; [ICON_FOOD]/[ICON_PRODUCTION] Yields on Kill when in [ICON_GOLDEN_AGE] Golden Age; +5 [ICON_PRODUCTION] Production from [ICON_RELIGION] Holy Sites; unlocks [COLOR_POSITIVE_TEXT]Reformation Belief[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_BELIEF_INTERFAITH_DIALOGUE';

INSERT INTO Building_YieldFromVictoryGlobal
	(BuildingType, YieldType, Yield, IsEraScaling, GoldenAgeOnly)
VALUES
	('BUILDING_GREAT_ALTAR', 'YIELD_FOOD', 20, 1, 1),
	('BUILDING_GREAT_ALTAR', 'YIELD_PRODUCTION', 20, 1, 1);

UPDATE Buildings SET 
MilitaryProductionModifier = 0
WHERE Type = 'BUILDING_GREAT_ALTAR';

UPDATE Language_en_US
SET Text = 'During a [ICON_GOLDEN_AGE] Golden Age, gain 20 [ICON_FOOD] Food and [ICON_PRODUCTION] Production in the City when an Enemy Unit is defeated in battle, scaling with Era.[NEWLINE][NEWLINE]+5 [ICON_PRODUCTION] Production from all [ICON_RELIGION] Holy Sites.[NEWLINE][NEWLINE]May only be constructed in a Holy City, and only if at least 15% of the global population follows your [ICON_RELIGION] Religion (scaling with map size). -1 [ICON_HAPPINESS_3] Unhappiness from Religious Unrest, and allows you to select a [COLOR_POSITIVE_TEXT]Reformation Belief[ENDCOLOR].[NEWLINE][NEWLINE]Boosts Pressure of [ICON_RELIGION] Religious Majority emanating from this City by 25%, and increases the City''s resistance to conversion by 20%.[NEWLINE][NEWLINE]Receive 1 [COLOR_POSITIVE_TEXT]Additional[ENDCOLOR] [ICON_DIPLOMAT] Delegate in the World Congress for every 10 Cities following your [ICON_RELIGION] Religion.'
WHERE Tag = 'TXT_KEY_BUILDING_GREAT_ALTAR_HELP';

-- eternal glory
UPDATE Beliefs SET 
CityScalerLimiter = 40
WHERE Type = 'BELIEF_ETERNAL_GLORY';

INSERT INTO Belief_YieldChangePerForeignCity
	(BeliefType, YieldType, Yield)
VALUES
	('BELIEF_ETERNAL_GLORY', 'YIELD_PRODUCTION', 2),
	('BELIEF_ETERNAL_GLORY', 'YIELD_FAITH', 2),
	('BELIEF_ETERNAL_GLORY', 'YIELD_CULTURE_LOCAL', 2);

-- this adds to the city itself, not the holy city 
--INSERT INTO Belief_YieldPerFollowingCity
--	(BeliefType, YieldType, Yield)
--VALUES
--	('BELIEF_ETERNAL_GLORY', 'YIELD_PRODUCTION', 1),
--	('BELIEF_ETERNAL_GLORY', 'YIELD_FAITH', 1),
--	('BELIEF_ETERNAL_GLORY', 'YIELD_CULTURE_LOCAL', 1);

INSERT INTO Belief_BuildingClassYieldChanges
	(BeliefType, BuildingClassType, YieldType, YieldChange)
VALUES	
	('BELIEF_ETERNAL_GLORY', 'BUILDINGCLASS_COURTHOUSE', 'YIELD_PRODUCTION', 4),
	('BELIEF_ETERNAL_GLORY', 'BUILDINGCLASS_COURTHOUSE', 'YIELD_FAITH', 4),
	('BELIEF_ETERNAL_GLORY', 'BUILDINGCLASS_COURTHOUSE', 'YIELD_CULTURE_LOCAL', 4);

-- gongfu/mastery
UPDATE Beliefs SET 
HappinessPerXPeacefulForeignFollowers = 8,
FollowerScalerLimiter = 80
WHERE Type = 'BELIEF_GONGFU';

INSERT INTO Belief_YieldChangePerXCityStateFollowers
	(BeliefType, YieldType, PerXFollowers)
VALUES
	('BELIEF_GONGFU', 'YIELD_SCIENCE', 2),
	('BELIEF_GONGFU', 'YIELD_CULTURE', 2);
-----------------
-- cremation
----------------
UPDATE Beliefs SET 
FaithFromDyingUnits = 200,
RiverHappiness = 1
WHERE Type = 'BELIEF_CREMATION';

INSERT INTO Belief_YieldPerBirth
	(BeliefType, YieldType, Yield)
VALUES
	('BELIEF_CREMATION', 'YIELD_CULTURE', 10);

-----------------
-- Dharma war
------------------

INSERT INTO Belief_YieldFromConquest
	(BeliefType, YieldType, Yield)
VALUES
	('BELIEF_DHARMA_WAR', 'YIELD_FAITH', 100),
	('BELIEF_DHARMA_WAR', 'YIELD_GOLDEN_AGE_POINTS', 100),
	('BELIEF_DHARMA_WAR', 'YIELD_GREAT_GENERAL_POINTS', 25),
	('BELIEF_DHARMA_WAR', 'YIELD_GREAT_ADMIRAL_POINTS', 25);

INSERT INTO Belief_YieldFromKills
	(BeliefType, YieldType, Yield)
VALUES
	('BELIEF_DHARMA_WAR', 'YIELD_TOURISM', 200);

-----------------------------------------------------------------------------------------------

-- buff inquisition, yield is too low
UPDATE Belief_YieldFromRemoveHeresy SET Yield = 75 WHERE BeliefType = 'BELIEF_RELIGIOUS_TEXTS';
UPDATE Language_en_US
SET Text = '[ICON_INQUISITOR] Inquisitors cost 33% less [ICON_PEACE] Faith, and generate 75 [ICON_GOLD] Gold per converted [ICON_CITIZEN] Citizen when Removing Heresy. Your [ICON_SPY] Spies exert +52 Religious Pressure on the Cities they occupy (Standard Speed), and +2 [ICON_HAPPINESS_1] Happiness if stationed in a foreign City.'
WHERE Tag = 'TXT_KEY_BELIEF_RELIGIOUS_TEXTS';

-- Teocalli effect
UPDATE Buildings SET
Happiness = 1,
CitySupplyFlat = 0,
ReligiousPressureModifier = 50,
MilitaryProductionModifier = 20
WHERE Type = 'BUILDING_TEOCALLI';

DELETE FROM Building_YieldFromVictoryGlobal WHERE BuildingType = 'BUILDING_TEOCALLI';
DELETE FROM Building_DomainFreeExperiences WHERE BuildingType = 'BUILDING_TEOCALLI';

INSERT INTO Building_YieldFromVictory
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_TEOCALLI', 'YIELD_GOLDEN_AGE_POINTS', 20);

UPDATE Language_en_US SET
Text = '+20 [ICON_GOLDEN_AGE] Golden Age Points when a Unit created in this City defeats an Enemy Unit in battle, scaling with Era. +20% [ICON_PRODUCTION] Production towards Land Units. Boosts Pressure of [ICON_RELIGION] Religious Majority emanating from this City by 50%.[NEWLINE][NEWLINE]-1 [ICON_HAPPINESS_3] Unhappiness from [ICON_FOOD] and [ICON_PRODUCTION] Distress.'
WHERE Tag = 'TXT_KEY_BUILDING_TEOCALLI_HELP';

-- Buff Order Faith to 25%
UPDATE Building_YieldFromUnitProduction SET Yield = 25 WHERE BuildingType = 'BUILDING_ORDER';

UPDATE Language_en_US SET 
Text = Replace(Text, 'Faith equal to 10%', 'Faith equal to 25%') 
WHERE Tag = 'TXT_KEY_BUILDING_ORDER_HELP';

-- move military supply to gurdwara
UPDATE Buildings SET 
CitySupplyFlat = 1
WHERE Type = 'BUILDING_GURDWARA';

UPDATE Language_en_US SET 
Text = Replace(Text, 'City by 25%.', 'City by 25%. Increases [ICON_SILVER_FIST] Military Unit Supply Cap by 1.') 
WHERE Tag = 'TXT_KEY_BUILDING_GURDWARA_HELP';
-----------------------------------------------------------------------------------------------
INSERT INTO Language_en_US 
	(Tag, Text)
VALUES
	('TXT_KEY_BELIEF_GONGFU_SHORT', 'Mastery'),
	('TXT_KEY_BELIEF_GONGFU', '+1 [ICON_HAPPINESS_1] for every 8 Followers of your [ICON_RELIGION] Religion in [COLOR_NEGATIVE_TEXT]non-Enemy[ENDCOLOR] Foreign Cities, and +1 [ICON_RESEARCH] Science and [ICON_CULTURE] Culture for every 2 Followers in [ICON_CITY_STATE] City-States (max 80 Followers).[NEWLINE]Unlocks [COLOR_POSITIVE_TEXT]Martial Sanctum National Wonder[ENDCOLOR] (+3 [ICON_PRODUCTION] Production, [ICON_PEACE] Faith, and [ICON_GREAT_GENERAL] Great General Points; +15 XP to Units created in the City; +5 [ICON_GREAT_GENERAL] Great General Points from [ICON_RELIGION] Holy Sites; unlocks [COLOR_POSITIVE_TEXT]Reformation Belief[ENDCOLOR]).'),
	('TXT_KEY_BUILDING_MARTIAL_SANCTUM', 'Martial Sanctum'),
	('TXT_KEY_BUILDING_MARTIAL_SANCTUM_PEDIA', 'Buddhism, Taoism, and Hinduism at least!'),
	('TXT_KEY_BUILDING_MARTIAL_SANCTUM_HELP', '+15 XP to all Units created in this City.[NEWLINE][NEWLINE]+5 [ICON_GREAT_GENERAL] Great General Points from all [ICON_RELIGION] Holy Sites.[NEWLINE][NEWLINE]May only be constructed in a Holy City, and only if at least 15% of the global population follows your [ICON_RELIGION] Religion (scaling with map size). -1 [ICON_HAPPINESS_3] Unhappiness from Religious Unrest, and allows you to select a [COLOR_POSITIVE_TEXT]Reformation Belief[ENDCOLOR].[NEWLINE][NEWLINE]Boosts Pressure of [ICON_RELIGION] Religious Majority emanating from this City by 25%, and increases the City''s resistance to conversion by 20%.[NEWLINE][NEWLINE]Receive 1 [COLOR_POSITIVE_TEXT]Additional[ENDCOLOR] [ICON_DIPLOMAT] Delegate in the World Congress for every 10 Cities following your [ICON_RELIGION] Religion.'),
	('TXT_KEY_BUILDING_MARTIAL_SANCTUM_STRATEGY', 'Build it, moron'),

	('TXT_KEY_BELIEF_ETERNAL_GLORY_SHORT', 'Eternal Glory'),
	('TXT_KEY_BELIEF_ETERNAL_GLORY', '+4 [ICON_PRODUCTION] Production, [ICON_PEACE] Faith, and [ICON_CULTURE_LOCAL] Border Growth Points from Courthouses, and +2 in the Holy City for every Foreign City following your [ICON_RELIGION] Religion (max 40 Cities).[NEWLINE]Unlocks [COLOR_POSITIVE_TEXT]Heavenly Stair National Wonder[ENDCOLOR] (+4 [ICON_PEACE] Faith, +8 [ICON_CULTURE_LOCAL] Border Growth Points; [ICON_PEACE]/[ICON_CULTURE_LOCAL] Yields on Kill in all Cities; +5 [ICON_GREAT_ADMIRAL] Great Admiral Points from [ICON_RELIGION] Holy Sites; unlocks [COLOR_POSITIVE_TEXT]Reformation Belief[ENDCOLOR]).'),
	('TXT_KEY_BUILDING_STAIRWAY_TO_HEAVEN', 'Heavenly Stair'),
	('TXT_KEY_BUILDING_STAIRWAY_TO_HEAVEN_PEDIA', 'Mount Olympus, Bifrost, Shrine of the Ascension'),
	('TXT_KEY_BUILDING_STAIRWAY_TO_HEAVEN_HELP', '+2 [ICON_PEACE] Faith and [ICON_CULTURE_LOCAL] Border Growth Points in all Cities when an Enemy Unit is defeated in battle.[NEWLINE][NEWLINE]+5 [ICON_GREAT_ADMIRAL] Great Admiral Points from all [ICON_RELIGION] Holy Sites.[NEWLINE][NEWLINE]May only be constructed in a Holy City, and only if at least 15% of the global population follows your [ICON_RELIGION] Religion (scaling with map size). -1 [ICON_HAPPINESS_3] Unhappiness from Religious Unrest, and allows you to select a [COLOR_POSITIVE_TEXT]Reformation Belief[ENDCOLOR].[NEWLINE][NEWLINE]Boosts Pressure of [ICON_RELIGION] Religious Majority emanating from this City by 25%, and increases the City''s resistance to conversion by 20%.[NEWLINE][NEWLINE]Receive 1 [COLOR_POSITIVE_TEXT]Additional[ENDCOLOR] [ICON_DIPLOMAT] Delegate in the World Congress for every 10 Cities following your [ICON_RELIGION] Religion.'),
	('TXT_KEY_BUILDING_STAIRWAY_TO_HEAVEN_STRATEGY', 'Build it, moron'),

	('TXT_KEY_BELIEF_CREMATION_SHORT', 'Cremation'),
	('TXT_KEY_BELIEF_CREMATION', 'Gain [ICON_PEACE] Faith when an owned Unit dies equal to 200% of its [ICON_STRENGTH] Strength. +1 [ICON_HAPPINESS_1] Happiness in Cities on Rivers. +10 [ICON_CULTURE] Culture when a [ICON_CITIZEN] Citizen is born, scaling with Era.'),

	('TXT_KEY_BELIEF_DHARMA_WAR_SHORT', 'Dharma-yuddha'),
	('TXT_KEY_BELIEF_DHARMA_WAR', 'Receive 100 [ICON_PEACE] Faith and [ICON_GOLDEN_AGE] Golden Age Points when you conquer a City, as well as 25 [ICON_GREAT_GENERAL] Great General Points (if City is landlocked) or [ICON_GREAT_ADMIRAL] Great Admiral Points (if Coastal). Bonus scales with City [ICON_CITIZEN] Population and Era. Gain [ICON_TOURISM] Tourism from killing enemy Units equal to 200% of their [ICON_STRENGTH] Strength.');

UPDATE Language_en_US SET Text = 'Abstinence' WHERE Tag = 'TXT_KEY_BELIEF_RELIGIOUS_ART_SHORT';

UPDATE Language_en_US SET Text = 'Remedy' WHERE Tag = 'TXT_KEY_BELIEF_ASCETISM_SHORT';

