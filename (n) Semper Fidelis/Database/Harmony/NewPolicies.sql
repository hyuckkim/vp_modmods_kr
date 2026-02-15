 -- Tier 1 -----------------------------------------------
-- asylum
INSERT INTO Policy_FreeUnitClasses
	(PolicyType, UnitClassType, Count)
VALUES
	('POLICY_ASYLUM', 'UNITCLASS_GREAT_DIPLOMAT', 1);

-- natural materials
INSERT INTO Policy_ImprovementYieldChanges
	(PolicyType, ImprovementType, YieldType, Yield)
VALUES
	('POLICY_NATURAL_MATERIALS', 'IMPROVEMENT_LUMBERMILL', 'YIELD_SCIENCE', 1),
	('POLICY_NATURAL_MATERIALS', 'IMPROVEMENT_LUMBERMILL', 'YIELD_PRODUCTION', 1),
	('POLICY_NATURAL_MATERIALS', 'IMPROVEMENT_LUMBERMILL', 'YIELD_GOLD', 1),
	('POLICY_NATURAL_MATERIALS', 'IMPROVEMENT_QUARRY', 'YIELD_SCIENCE', 1),	
	('POLICY_NATURAL_MATERIALS', 'IMPROVEMENT_QUARRY', 'YIELD_GOLD', 1),	
	('POLICY_NATURAL_MATERIALS', 'IMPROVEMENT_QUARRY', 'YIELD_PRODUCTION', 1);

INSERT INTO Policy_YieldFromConstruction	
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_NATURAL_MATERIALS', 'YIELD_FOOD', 20);

-- syncretism

INSERT INTO Building_YieldChangesPerReligion
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_D_FOR_SYNCRETISM', 'YIELD_FOOD', 200),
	('BUILDING_D_FOR_SYNCRETISM', 'YIELD_CULTURE', 200),
	('BUILDING_D_FOR_SYNCRETISM', 'YIELD_FAITH', 200);

-- update the rationalism policy
UPDATE Policies SET ReligiousUnrestFlatReductionGlobal = 0 WHERE Type = 'POLICY_FREE_THOUGHT';

INSERT INTO Policy_YieldModifiers
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_FREE_THOUGHT', 'YIELD_FAITH', -15);

UPDATE Policies SET AllCityFreeBuilding='BUILDINGCLASS_D_FOR_FREE_THOUGHT' WHERE Type = 'POLICY_FREE_THOUGHT';

INSERT INTO Building_YieldFromYieldPercent
	(BuildingType, YieldOut, YieldIn, Value)
VALUES
	('BUILDING_D_FOR_FREE_THOUGHT', 'YIELD_SCIENCE', 'YIELD_FAITH', 15);

UPDATE Language_en_US SET Text = REPLACE(Text, '-5 [ICON_HAPPINESS_3] Unhappiness from Religious Unrest in all Cities.', 'Generate 15% [COLOR_NEGATIVE_TEXT]less[ENDCOLOR] [ICON_PEACE] Faith, but 15% of the [ICON_PEACE] Faith created by each City is converted to [ICON_RESEARCH] Science.')
WHERE Tag = 'TXT_KEY_POLICY_FREE_THOUGHT_HELP';

-- international education
INSERT INTO UnitPromotions_InstantYields
	(PromotionType, YieldType, Yield, IsEraScaling)
VALUES
	('PROMOTION_HARMONY_INTL_ED', 'YIELD_CULTURE', 25, 1);

-- let it trigger off GDips too! I dont think their class does anything atm (iroquois dont even have it)
UPDATE Units SET CombatClass = 'UNITCOMBAT_DIPLOMACY' WHERE Class = 'UNITCLASS_GREAT_DIPLOMAT';

-- humanitarianism
INSERT INTO Policy_BuildingClassProductionModifiers
	(PolicyType, BuildingClassType, ProductionModifier)
VALUES
	('POLICY_HUMANITARIANISM', 'BUILDINGCLASS_WIRE_SERVICE', 100);

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_HARMONY_AID', 'YIELD_FOOD', 1),
	('BUILDING_HARMONY_AID', 'YIELD_GOLD', 1),
	('BUILDING_HARMONY_AID', 'YIELD_FAITH', 1);

INSERT INTO Building_YieldFromFaithPurchase
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_HARMONY_AID', 'YIELD_FOOD', 10),
	('BUILDING_HARMONY_AID', 'YIELD_FAITH', 10);

INSERT INTO Building_YieldFromPurchase
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_HARMONY_AID', 'YIELD_FOOD', 10),
	('BUILDING_HARMONY_AID', 'YIELD_FAITH', 10);

INSERT INTO Building_YieldPerFriend
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_HARMONY_AID', 'YIELD_FOOD', 1),
	('BUILDING_HARMONY_AID', 'YIELD_FAITH', 1);

INSERT INTO Building_YieldPerAlly
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_HARMONY_AID', 'YIELD_FOOD', 1),
	('BUILDING_HARMONY_AID', 'YIELD_FAITH', 1);

INSERT INTO Building_ResourceQuantityRequirements
	(BuildingType, ResourceType, Cost)
VALUES
	('BUILDING_HARMONY_AID', 'RESOURCE_OIL', 1);

INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 				BuildingClassType)
VALUES	('BUILDING_HARMONY_AID',	'BUILDINGCLASS_WIRE_SERVICE');

INSERT INTO Language_en_US (Tag, Text)
VALUES	('TXT_KEY_BUILDING_HARMONY_AID',			'Aid Agency'),
		('TXT_KEY_BUILDING_HARMONY_AID_TEXT',		'In 1863 the International Committee for Relief to the Wounded organized an international conference to develop possible measures to improve medical services on the battlefield. Only a year later, the Swiss government invited the governments of all European countries, as well as the United States, the Empire of Brazil and the Mexican Empire to attend an official diplomatic conference. Sixteen countries sent a total of 26 delegates to Geneva. On 22 August 1864, the conference adopted the first Geneva Convention "for the Amelioration of the Condition of the Wounded in Armies in the Field". Representatives of 12 states and kingdoms signed the convention, establishing for the first time legally binding rules guaranteeing neutrality and protection for wounded soldiers, field medical personnel, and specific humanitarian institutions in an armed conflict.[NEWLINE][NEWLINE]Although today there are many organizations, both governmental and otherwise, that give humanitarian aid to those in need around the world, the Red Cross (and Islamic Red Crescent formed when the Ottoman Empire ratified the aforementioned treaty in 1865)  exists in nearly every country in the world, with a headquarters in Geneva employing over 22,000 staff and with a budget of around 2.5 billion Swiss francs. Most of that money comes from states, including Switzerland in its capacity as the depositary state of the Geneva Conventions, from national Red Cross societies, the signatory states of the Geneva Conventions, and from international organizations like the European Union. All payments to the ICRC are voluntary and are received as donations based on two types of appeals issued by the committee: an annual Headquarters Appeal to cover its internal costs and Emergency Appeals for its individual missions. In 2023, Ukraine is the ICRC''s biggest humanitarian operation (at 316.5 million Swiss francs), followed by Afghanistan (218 million francs) and Syria (171.7 million francs).'),
		('TXT_KEY_BUILDING_HARMONY_AID_STRATEGY',	'A late-game Building that focusses on Food and Faith generation and value. It also provides these yields from City-States, whether they be Friends or Allies. Additionally your Units that can learn it will receive the Medic II Promotion when trained in this City, which is strengthens your military capability, but in a way appropriate to Harmony. While the bonuses are powerful, you must give up some of your precious Oil to obtain them; as a follower of Harmony, you shouldn''t be using that for its usual purpose anyway!'),
		('TXT_KEY_BUILDING_HARMONY_AID_HELP',		'Requires [COLOR_MAGENTA]Humanitarianism[ENDCOLOR]. 10% of the cost of [ICON_PEACE] Faith Purchases and [ICON_INVEST] Gold Purchases are converted into both [ICON_FOOD] Food and [ICON_PEACE] Faith. Eligible Units trained in this City receive the [COLOR_POSITIVE_TEXT]Medic II[ENDCOLOR] Promotion. Boosts starting Religious Strength of all [ICON_MISSIONARY] Missionaries by 5%.[NEWLINE][NEWLINE][ICON_CITY_STATE]City-State [COLOR_POSITIVE_TEXT]Friend[ENDCOLOR] Bonus: +1 [ICON_FOOD] Food and [ICON_PEACE] Faith each.[NEWLINE][ICON_CITY_STATE]City-State [COLOR_CYAN]Ally[ENDCOLOR] Bonus: +1 [ICON_FOOD] Food and [ICON_PEACE] Faith each.[NEWLINE][NEWLINE]Requires 1 [ICON_RES_OIL] Oil.');

-- communal life

INSERT INTO Policy_ImprovementYieldChanges
	(PolicyType, ImprovementType, YieldType, Yield)
SELECT
	'POLICY_COMMUNAL_LIFE', Type, 'YIELD_CULTURE', 2
FROM Improvements
WHERE SpecificCivRequired = 1 OR Type IN (
	'IMPROVEMENT_CAMP',
	'IMPROVEMENT_ACADEMY',
	'IMPROVEMENT_FISHING_BOATS',
	'IMPROVEMENT_PLANTATION',
	-- hidden unique improvements
	'IMPROVEMENT_POLDER_WATER',
	'IMPROVEMENT_MONGOLIA_ORDO'
);

CREATE TRIGGER HarmonyUICustomCivs
AFTER INSERT ON Improvements WHEN 1 = NEW.SpecificCivRequired
BEGIN
	INSERT INTO Policy_ImprovementYieldChanges
		(PolicyType, ImprovementType, YieldType, Yield)
	SELECT
		'POLICY_COMMUNAL_LIFE', NEW.Type, 'YIELD_CULTURE', 2;
END;

UPDATE Policy_ImprovementYieldChanges SET ImprovementType = 'IMPROVEMENT_TRADING_POST' WHERE PolicyType = 'POLICY_CIVIL_SOCIETY' AND ImprovementType = 'IMPROVEMENT_CAMP';

UPDATE Language_en_US
SET Text = REPLACE(Text,  'Camps, ', 'Villages, ')
WHERE Tag = 'TXT_KEY_POLICY_CIVIL_SOCIETY_HELP';

-- conservationists

INSERT INTO Policy_FeatureYieldChanges
	(PolicyType, FeatureType, YieldType, Yield)
VALUES
	('POLICY_CONSERVATIONISTS', 'FEATURE_FOREST', 'YIELD_TOURISM', -1),	
	('POLICY_CONSERVATIONISTS', 'FEATURE_JUNGLE', 'YIELD_TOURISM', -1),
	('POLICY_CONSERVATIONISTS', 'FEATURE_FOREST', 'YIELD_FOOD', 1),	
	('POLICY_CONSERVATIONISTS', 'FEATURE_FOREST', 'YIELD_FAITH', 1),		
	('POLICY_CONSERVATIONISTS', 'FEATURE_FOREST', 'YIELD_SCIENCE', 1),	
	('POLICY_CONSERVATIONISTS', 'FEATURE_JUNGLE', 'YIELD_FOOD', 1),	
	('POLICY_CONSERVATIONISTS', 'FEATURE_JUNGLE', 'YIELD_FAITH', 1),	
	('POLICY_CONSERVATIONISTS', 'FEATURE_JUNGLE', 'YIELD_SCIENCE', 1);

-- Tier 2 -----------------------------------------------

-- naturopathy
INSERT INTO Policy_YieldFromNonSpecialistCitizens
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_NATUROPATHY', 'YIELD_FOOD', 20),
	('POLICY_NATUROPATHY', 'YIELD_FAITH', 20);

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_HARMONY_CLINIC', 'YIELD_FOOD', 1),
	('BUILDING_HARMONY_CLINIC', 'YIELD_SCIENCE', 1),
	('BUILDING_HARMONY_CLINIC', 'YIELD_FAITH', 1);

INSERT INTO Building_YieldFromFaithPurchase
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_HARMONY_CLINIC', 'YIELD_FOOD', 10),
	('BUILDING_HARMONY_CLINIC', 'YIELD_SCIENCE', 10),
	('BUILDING_HARMONY_CLINIC', 'YIELD_FAITH', 10);

INSERT INTO Building_ResourceQuantityRequirements
	(BuildingType, ResourceType, Cost)
VALUES
	('BUILDING_HARMONY_CLINIC', 'RESOURCE_IRON', 1),
	('BUILDING_HARMONY_CLINIC', 'RESOURCE_COAL', 1),
	('BUILDING_HARMONY_CLINIC', 'RESOURCE_ALUMINUM', 1),
	('BUILDING_HARMONY_CLINIC', 'RESOURCE_URANIUM', 1);

INSERT INTO Building_ResourceYieldChanges
	(BuildingType, ResourceType, YieldType, Yield)
VALUES
	('BUILDING_HARMONY_CLINIC', 'RESOURCE_IRON', 'YIELD_FOOD', 2),
	('BUILDING_HARMONY_CLINIC', 'RESOURCE_IRON', 'YIELD_CULTURE', 2),
	('BUILDING_HARMONY_CLINIC', 'RESOURCE_IRON', 'YIELD_SCIENCE', 2),
	('BUILDING_HARMONY_CLINIC', 'RESOURCE_COAL', 'YIELD_FOOD', 2),
	('BUILDING_HARMONY_CLINIC', 'RESOURCE_COAL', 'YIELD_CULTURE', 2),
	('BUILDING_HARMONY_CLINIC', 'RESOURCE_COAL', 'YIELD_SCIENCE', 2),
	('BUILDING_HARMONY_CLINIC', 'RESOURCE_ALUMINUM', 'YIELD_FOOD', 2),
	('BUILDING_HARMONY_CLINIC', 'RESOURCE_ALUMINUM', 'YIELD_CULTURE', 2),
	('BUILDING_HARMONY_CLINIC', 'RESOURCE_ALUMINUM', 'YIELD_SCIENCE', 2),
	('BUILDING_HARMONY_CLINIC', 'RESOURCE_URANIUM', 'YIELD_FOOD', 2),
	('BUILDING_HARMONY_CLINIC', 'RESOURCE_URANIUM', 'YIELD_CULTURE', 2),
	('BUILDING_HARMONY_CLINIC', 'RESOURCE_URANIUM', 'YIELD_SCIENCE', 2);

INSERT INTO Building_GrowthExtraYield
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_HARMONY_CLINIC', 'YIELD_FOOD', 34),
	('BUILDING_HARMONY_CLINIC', 'YIELD_FAITH', 34),
	('BUILDING_HARMONY_CLINIC', 'YIELD_SCIENCE', 34);

INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 				BuildingClassType)
VALUES	('BUILDING_HARMONY_CLINIC',	'BUILDINGCLASS_HOSPITAL');

INSERT INTO Language_en_US (Tag, Text)
VALUES	('TXT_KEY_BUILDING_HARMONY_CLINIC',			'Clinic'),
		('TXT_KEY_BUILDING_HARMONY_CLINIC_TEXT',		'Many countries have a legal framework to support alternative or complementary medicine. In Austria and Germany overwhelming practiced by doctors with MDs, compared to American alternative practitioners where perhaps only half are licensed MDs. In Germany herbs are tightly regulated: half are prescribed by doctors and covered by health insurance. Although in the West there is a general stigma against the non-scientific basis of such treatments, in developing nations, access to essential medicines is severely restricted by lack of resources and poverty. Traditional remedies, often closely resembling or forming the basis for alternative remedies, may comprise primary healthcare or be integrated into the healthcare system. In Africa, traditional medicine is used for 80% of primary healthcare, and in developing nations as a whole over one-third of the population lack access to essential medicines. The challenge for third sector entities trying to improve global public health by working in the global south is therefore, often, reversed.'),
		('TXT_KEY_BUILDING_HARMONY_CLINIC_STRATEGY',	'A late-game Building that rewards ''thickening'' a ''wide'' Empire, providing bonuses for tiles but also from City output upon Growth. It also provides various Happiness bonuses to deal with having larger Cities. While the bonuses are powerful, you must give up some of your Strategic Resources to obtain them; as a follower of Harmony, you shouldn''t be using those for their usual purpose anyway!'),
		('TXT_KEY_BUILDING_HARMONY_CLINIC_HELP',		'Requires [COLOR_MAGENTA]Naturopathy[ENDCOLOR]. 33% of the [ICON_FOOD] Food, [ICON_RESEARCH] Science, and [ICON_PEACE] Faith output of the City is added as an instant boost when a [ICON_CITIZEN] Citizen is born in this City. 10% of the cost of [ICON_PEACE] Faith Purchases are converted into [ICON_FOOD] Food, [ICON_RESEARCH] Science, and more [ICON_PEACE] Faith. Increases the City''s resistance to [ICON_RELIGION] Religious conversion by 25%[NEWLINE][NEWLINE]Nearby [ICON_RES_IRON] Iron: +2 [ICON_FOOD] Food, [ICON_RESEARCH] Science, and [ICON_PEACE] Faith.[NEWLINE]Nearby [ICON_RES_COAL] Coal: +2 [ICON_FOOD] Food, [ICON_RESEARCH] Science, and [ICON_PEACE] Faith.[NEWLINE]Nearby [ICON_RES_ALUMINUM] Aluminum: +2 [ICON_FOOD] Food, [ICON_RESEARCH] Science, and [ICON_PEACE] Faith.[NEWLINE]Nearby [ICON_RES_URANIUM] Uranium: +2 [ICON_FOOD] Food, [ICON_RESEARCH] Science, and [ICON_PEACE] Faith.[NEWLINE][NEWLINE]-1 [ICON_HAPPINESS_3] Unhappiness from [ICON_FOOD] and [ICON_PRODUCTION] Distress and from [ICON_GOLD] Poverty.[NEWLINE][NEWLINE]Requires 1 [ICON_RES_IRON] Iron, [ICON_RES_COAL] Coal, [ICON_RES_ALUMINUM] Aluminum, and [ICON_RES_URANIUM] Uranium.');

-- postcolonialism

INSERT INTO Policy_BuildingClassYieldChanges
	(PolicyType, BuildingClassType, YieldType, YieldChange)
VALUES
	('POLICY_POSTCOLONIALISM', 'BUILDINGCLASS_COURTHOUSE', 'YIELD_GOLD', -10);

INSERT INTO Policy_BuildingClassYieldModifiers
	(PolicyType, BuildingClassType, YieldType, YieldMod)
SELECT
	'POLICY_POSTCOLONIALISM', 'BUILDINGCLASS_COURTHOUSE', Type, 15
FROM Yields WHERE ID < 6;


UPDATE Policies SET
	MinimumAllyInfluenceIncreaseAtWar = 100
WHERE Type = 'POLICY_POSTCOLONIALISM';

-- disarmament

UPDATE Policies
SET UnitGoldMaintenanceMod = -85
WHERE Type = 'POLICY_DISARMAMENT';

INSERT INTO Policy_UnitClassReplacements
	(PolicyType, ReplacedUnitClassType, ReplacementUnitClassType)
VALUES
	('POLICY_DISARMAMENT', 'UNITCLASS_MARINE', 'UNITCLASS_PEACEKEEPER'),
	('POLICY_DISARMAMENT', 'UNITCLASS_ROCKET_MISSILE', 'UNITCLASS_WORKER'),
	('POLICY_DISARMAMENT', 'UNITCLASS_GUIDED_MISSILE', 'UNITCLASS_WORKER'),
	('POLICY_DISARMAMENT', 'UNITCLASS_NUCLEAR_MISSILE', 'UNITCLASS_WORKER'),
	('POLICY_DISARMAMENT', 'UNITCLASS_ATOMIC_BOMB', 'UNITCLASS_WORKER');
-- replacing with NULL does nothing. but replacing with worker is as if they werent there (you dont even get multiple workers!)

INSERT INTO Policy_YieldFromBarbarianKills
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_DISARMAMENT', 'YIELD_FOOD', 200),
	('POLICY_DISARMAMENT', 'YIELD_CULTURE', 200),
	('POLICY_DISARMAMENT', 'YIELD_GOLD', 200);

-- world heritage

INSERT INTO Policy_YieldFromWorldWonderConstruction
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_WORLD_HERITAGE', 'YIELD_SCIENCE', 250);

-- international law

INSERT INTO Policy_BuildingClassSecurityChanges
	(PolicyType, BuildingClassType, SecurityChange)
VALUES
	('POLICY_INTERNATIONAL_LAW', 'BUILDINGCLASS_WIRE_SERVICE', 25),
	('POLICY_INTERNATIONAL_LAW', 'BUILDINGCLASS_COURTHOUSE', 25);

INSERT INTO Policy_YieldFromDelegateCount
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_INTERNATIONAL_LAW', 'YIELD_GREAT_GENERAL_POINTS', 3),
	('POLICY_INTERNATIONAL_LAW', 'YIELD_GREAT_ADMIRAL_POINTS', 3);

-- living history (living tradition)

INSERT INTO Building_YieldFromFaithPurchase
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_D_FOR_LIVING_HISTORY', 'YIELD_CULTURE', 20);

-- these are very late, but the world heritage can get you free ones early
INSERT INTO Policy_BuildingClassYieldModifiers
	(PolicyType, BuildingClassType, YieldType, YieldMod)
VALUES
	('POLICY_LIVING_HISTORY', 'BUILDINGCLASS_INTERPRETIVE_CENTER', 'YIELD_FAITH', 20);

INSERT INTO Policy_ArtifactYieldChanges
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_LIVING_HISTORY', 'YIELD_TOURISM', -2),
	('POLICY_LIVING_HISTORY', 'YIELD_FOOD', 2),
	('POLICY_LIVING_HISTORY', 'YIELD_PRODUCTION', 2),	
	('POLICY_LIVING_HISTORY', 'YIELD_GOLD', 2),
	('POLICY_LIVING_HISTORY', 'YIELD_SCIENCE', 2),	
	('POLICY_LIVING_HISTORY', 'YIELD_CULTURE', 2),
	('POLICY_LIVING_HISTORY', 'YIELD_FAITH', 2);

-- environmental regulations
INSERT INTO Policy_BuildingClassYieldChanges
	(PolicyType, BuildingClassType, YieldType, YieldChange)
SELECT
	'POLICY_ENVIRONMENTAL_REGS', OfficeBuildingClass, a.type, 8
FROM Corporations, Yields a WHERE a.Type IN ('YIELD_FOOD');

INSERT INTO Policy_FranchisePerImprovement
	(PolicyType, ImprovementType, NumFranchise)
VALUES
	('POLICY_ENVIRONMENTAL_REGS', 'IMPROVEMENT_MANUFACTORY', 1);

INSERT INTO Policy_BuildingClassYieldChanges	
	(PolicyType, BuildingClassType, YieldType, YieldChange)
SELECT
	'POLICY_ENVIRONMENTAL_REGS', c.FranchiseBuildingClass, a.Type, 6
FROM Corporations c, Yields a WHERE a.Type IN ('YIELD_FOOD', 'YIELD_GOLD');

-- Tier 3 -----------------------------------------------

-- one world (migration theology)
-- all xml

-- deep ecology
INSERT INTO Policy_ResourceYieldChanges
	(PolicyType, ResourceType, YieldType, Yield)
SELECT
	'POLICY_DEEP_ECOLOGY', Type, 'YIELD_FAITH', 3
FROM Resources
WHERE IsMonopoly = 0 AND Type NOT IN ('RESOURCE_ARTIFACTS', 'RESOURCE_HIDDEN_ARTIFACTS');

INSERT INTO Building_YieldFromYieldPercent
	(BuildingType, YieldOut, YieldIn, Value)
VALUES
	('BUILDING_D_FOR_DEEP_ECOLOGY', 'YIELD_CULTURE', 'YIELD_FAITH', 25);

-- turn reduction is handled in the lua file

-- climate summits (climate crisis)
INSERT INTO Policy_UnitCombatProductionModifiers
	(PolicyType, UnitCombatType, ProductionModifier)
VALUES
	('POLICY_CLIMATE_CRISIS', 'UNITCOMBAT_DIPLOMACY', 100);

INSERT INTO Policy_SpecialistYieldChanges
	(PolicyType, SpecialistType, YieldType, Yield)
VALUES
	('POLICY_CLIMATE_CRISIS', 'SPECIALIST_CIVIL_SERVANT', 'YIELD_CULTURE', 3),
	('POLICY_CLIMATE_CRISIS', 'SPECIALIST_CIVIL_SERVANT', 'YIELD_SCIENCE', 3),
	('POLICY_CLIMATE_CRISIS', 'SPECIALIST_CIVIL_SERVANT', 'YIELD_GOLD', 3);

INSERT INTO Policy_GreatPersonExpendedYield
	(PolicyType, GreatPersonType, YieldType, Yield)
VALUES
	('POLICY_CLIMATE_CRISIS', 'GREATPERSON_DIPLOMAT', 'YIELD_SCIENCE', 500); 






