------------------------------
-- General Post Office
------------------------------

INSERT INTO BuildingClasses 	
			(Type,		DefaultBuilding,		Description,    MaxPlayerInstances)
VALUES		('BUILDINGCLASS_GENERAL_POST',	'BUILDING_GENERAL_POST',	'TXT_KEY_BUILDING_GENERAL_POST',  1);

INSERT INTO  Buildings
	(Type,		Description,	Civilopedia,		Strategy,			Help,		
	GoldMaintenance, 	Cost, HurryCostModifier, 	MinAreaSize, 	ConquestProb, 	BuildingClass, 	
	ArtDefineTag, 				PrereqTech, 			PortraitIndex, 	IconAtlas, NationalPopRequired, NumCityCostMod)
VALUES	
	('BUILDING_GENERAL_POST',	'TXT_KEY_BUILDING_GENERAL_POST', 	'TXT_KEY_BUILDING_GENERAL_POST_TEXT',	'TXT_KEY_BUILDING_GENERAL_POST_STRATEGY',	'TXT_KEY_BUILDING_GENERAL_POST_HELP',	
	0, 	600, -20, 					-1, 			0, 			'BUILDINGCLASS_GENERAL_POST', 	
	'ART_DEF_BUILDING_MARKET', 	'TECH_MILITARY_SCIENCE', 	7,				'SpyRework_Atlas', 35, 25);

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_GENERAL_POST', 'YIELD_CULTURE', 1),
	('BUILDING_GENERAL_POST', 'YIELD_GOLD', 3),
	('BUILDING_GENERAL_POST', 'YIELD_PRODUCTION', 2);

UPDATE Buildings
SET
	CityConnectionTradeRouteModifier = 10,
	SpecialistType = 'SPECIALIST_CIVIL_SERVANT',
	SpecialistCount = 1,
	GreatPeopleRateChange = 1,
   	NukeImmune = 1,
	NeverCapture = 1,
	ExtraSpies = 1, 
	GlobalSpySecurityModifier = 0,
	FreeBuildingThisCity = 'BUILDINGCLASS_SORTING_OFFICE'
WHERE BuildingClass = 'BUILDINGCLASS_GENERAL_POST';

INSERT INTO Building_SpecialistYieldChangesLocal
	(BuildingType, SpecialistType, YieldType, Yield)
VALUES
	('BUILDING_GENERAL_POST', 'SPECIALIST_CIVIL_SERVANT', 'YIELD_GOLD', 1),
	('BUILDING_GENERAL_POST', 'SPECIALIST_CIVIL_SERVANT', 'YIELD_PRODUCTION', 1),
	('BUILDING_GENERAL_POST', 'SPECIALIST_CIVIL_SERVANT', 'YIELD_TOURISM', 1);

INSERT INTO Building_YieldPerFriend
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_GENERAL_POST', 'YIELD_TOURISM', 2);

INSERT INTO Building_YieldPerAlly
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_GENERAL_POST', 'YIELD_TOURISM', 2),
	('BUILDING_GENERAL_POST', 'YIELD_FOOD', 2);

INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 			BuildingClassType)
VALUES
	('BUILDING_GENERAL_POST', 'BUILDINGCLASS_COALING_STATION');

INSERT INTO Building_ResourceQuantity
	(BuildingType, ResourceType, Quantity)
VALUES
	('BUILDING_GENERAL_POST', 'RESOURCE_PAPER', 1);

INSERT INTO Building_Flavors 
	(BuildingType, FlavorType, Flavor)
VALUES
	('BUILDING_GENERAL_POST', 'FLAVOR_DIPLOMACY', 40),	
	('BUILDING_GENERAL_POST', 'FLAVOR_ESPIONAGE', 40),	
	('BUILDING_GENERAL_POST', 'FLAVOR_GOLD', 10),	
	('BUILDING_GENERAL_POST', 'FLAVOR_PRODUCTION', 10);

------------------------------
-- Text
------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES	('TXT_KEY_BUILDING_GENERAL_POST',			'General Post Office'),
		('TXT_KEY_BUILDING_GENERAL_POST_TEXT',		'The term "post-office" has been in use since the 1650s, shortly after the legalisation of private mail services in England in 1635. In early modern England, mounted couriers were placed, or "posted", every few hours along post roads at posting houses between major cities, or "post towns". These stables or inns permitted important correspondence to travel without delay. Historically, there is evidence of corps of royal couriers disseminating the decrees of Egyptian pharaohs as early as 2400 BCE, and it is possible that the service greatly precedes that date. In Herodotus''s Histories, he refers to a courier service of the ancient Persian Empire with praise, writing, "neither by snow nor rain nor heat nor darkness from accomplishing their appointed course with all speed."[NEWLINE][NEWLINE]Administering the flow of parcels and messages is not just important to the economy of a country, it also allows an otherwise impossible level of surveillance of the population and control over the lines of communcation. For example in the First World War, postal interception was used to find the disclosure of military secrets and test the morale of soldiers. Those writing postcards in the field knew they were being censored, and deliberately held back controversial content and personal matters.'),
		('TXT_KEY_BUILDING_GENERAL_POST_STRATEGY',	'The General Post Office is a late Industrial Era National Wonder that grants a Spy and a Free Sorting Office, a building which is normally only available in the Modern Era. It also slightly increases the yields of City Connections everywhere, something the Sorting Office will also do but locally. The General Post Office''s other bonuses are to Diplomacy and Espionage: Once you have the General Post Office, making Friends with City States will reward you with Tourism, which can later boost your Spies and other yields. Further, the yields from Civil Servants in the City are increased, so it is also wise to construct it where you have you highest concentration of bureaucracy. It is doubly desirable to construct it in a Specialist-heavy location because that City will receive extra Food for each City State Ally.'),
		('TXT_KEY_BUILDING_GENERAL_POST_HELP',		'');

--Receive a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Sorting Office in the City, +1 [ICON_RES_PAPER] Paper, and 100 [ICON_SPY_POINT] Spy Points. +10% [ICON_GOLD] Gold and [ICON_PRODUCTION] Production from [ICON_CONNECTED]/[ICON_INDUSTRIAL_CONNECTED] City Connections. +1 [ICON_PRODUCTION] Production, [ICON_GOLD] Gold, and [ICON_TOURISM] from [ICON_CIVIL_SERVANT] Civil Servants in the City.[NEWLINE][NEWLINE][ICON_CITY_STATE]City-State [COLOR_POSITIVE_TEXT]Friend[ENDCOLOR] Bonus: +2 [ICON_TOURISM] Tourism each.[NEWLINE][ICON_CITY_STATE]City-State [COLOR_CYAN]Ally[ENDCOLOR] Bonus: +2 [ICON_FOOD] Food and [ICON_TOURISM] Tourism each.[NEWLINE][NEWLINE]The [ICON_PRODUCTION] Production Cost and [ICON_CITIZEN] Population Requirements increase based on the number of Cities you own.

------------------------------
-- Sorting Office
------------------------------

INSERT INTO BuildingClasses 	
			(Type,							DefaultBuilding,		Description)
VALUES		('BUILDINGCLASS_SORTING_OFFICE',	'BUILDING_SORTING_OFFICE',	'TXT_KEY_BUILDING_SORTING_OFFICE');

INSERT INTO	 Buildings
	(Type,						Description,						Civilopedia,							Strategy,					Help,									GoldMaintenance, 	Cost, HurryCostModifier, 	MinAreaSize, 	ConquestProb, 	BuildingClass, 				ArtDefineTag, 				PrereqTech, 			PortraitIndex, 	IconAtlas)
VALUES	
	('BUILDING_SORTING_OFFICE',	'TXT_KEY_BUILDING_SORTING_OFFICE', 	'TXT_KEY_BUILDING_SORTING_OFFICE_TEXT',	'TXT_KEY_BUILDING_SORTING_OFFICE_STRATEGY',	'TXT_KEY_BUILDING_SORTING_OFFICE_HELP',	7, 				1800, -20, 					-1, 			80, 			'BUILDINGCLASS_SORTING_OFFICE', 	'ART_DEF_BUILDING_MARKET', 	'TECH_COMBUSTION', 	6,				'SpyRework_Atlas');

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_SORTING_OFFICE', 'YIELD_TOURISM', 2);

UPDATE Buildings
SET
	RequiresIndustrialCityConnection = 1,
	TradeRouteLandGoldBonus = 3,
	TradeRouteRecipientBonus = 3,
	TradeRouteTargetBonus = 3,
	CityConnectionGoldModifier = 20,
	SpySecurityModifier = 10
WHERE BuildingClass = 'BUILDINGCLASS_SORTING_OFFICE';

INSERT INTO Building_YieldFromPurchase
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_SORTING_OFFICE', 'YIELD_CULTURE_LOCAL', 15);

DELETE FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_AIRPORT';

INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 			BuildingClassType)
VALUES
	('BUILDING_SORTING_OFFICE', 'BUILDINGCLASS_HOTEL'),	
	('BUILDING_AIRPORT', 'BUILDINGCLASS_SORTING_OFFICE');

INSERT INTO Building_Flavors 
	(BuildingType, FlavorType, Flavor)
VALUES
	('BUILDING_SORTING_OFFICE', 'FLAVOR_GOLD', 10),	
	('BUILDING_SORTING_OFFICE', 'FLAVOR_PRODUCTION', 10),	
	('BUILDING_SORTING_OFFICE', 'FLAVOR_EXPANSION', 10),
	('BUILDING_SORTING_OFFICE', 'FLAVOR_I_TRADE_ORIGIN', 5),
	('BUILDING_SORTING_OFFICE', 'FLAVOR_I_TRADE_DESTINATION', 5),	
	('BUILDING_SORTING_OFFICE', 'FLAVOR_I_LAND_TRADE_ROUTE', 5);


------------------------------
-- Text
------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES	('TXT_KEY_BUILDING_SORTING_OFFICE',			'Sorting Office'),
		('TXT_KEY_BUILDING_SORTING_OFFICE_TEXT',		'A sorting office, mail centre, or processing and distribution center is any location where postal operators bring mail after collection for sorting into batches for delivery to the addressee, which may be a direct delivery or sent onwards to another regional or local sorting office, or to another postal administration. For example, in the UK, Royal Mail operates a network of 37 mail centres (as of 2019). Each mail centre serves a large geographically defined area of the UK and together they form the backbone network of the mail distribution operation. Most buildings have a large central area known as a sorting or postal hall. Integrated facilities combining mail processing with railway stations or airports are further known as mail exchanges. Due to their position as a key network point in the distribution of letters, packages, and other documents, special postal censorship bureaus can exist within sorting offices to intercept and censor mail. In France, such offices were known as cabinets noirs.'),
		('TXT_KEY_BUILDING_SORTING_OFFICE_STRATEGY',	'The Sorting Office continues the building line that began with the Caravansary, increasing the desirability of your City to foreign Trade Routes. To your large Cities these buildings offer increased City Connection yields and a City Security boost, while to smaller Cities they can turn Gold Investments into large amounts of Border Growth Points, circumventing the need to buy tiles directly and trigger on-border growth yields. Carefully consider if a particular City stand to gain from a Sorting Office, as you may not need them everywhere immediately.'),
		('TXT_KEY_BUILDING_SORTING_OFFICE_HELP',		'');
--Provides 10 [ICON_SPY] City Security. When you spend [ICON_INVEST] Gold to purchase Units or invest in Buildings in this City, 15% of the cost is converted into [ICON_CULTURE_LOCAL] Border Growth Points. +20% [ICON_GOLD] Gold and [ICON_PRODUCTION] Production from the local [ICON_INDUSTRIAL_CONNECTED] City Connection.[NEWLINE][NEWLINE]Incoming [ICON_ARROW_LEFT] Trade Routes generate +3 [ICON_GOLD] Gold for the City and for the [ICON_ARROW_RIGHT] Trade Route owner. [ICON_CARAVAN] Land Trade Routes gain +3 [ICON_GOLD] Gold.[NEWLINE][NEWLINE]Requires an [ICON_INDUSTRIAL_CONNECTED] Industrial City Connection before it can be constructed.
