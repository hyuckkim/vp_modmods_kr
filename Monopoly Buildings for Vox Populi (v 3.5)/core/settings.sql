

--Set this to 0 if you want Indonesia's and Brazil's Luxuries to not unlock Monopoly Buildings
--Default 1
INSERT INTO COMMUNITY	
		(Type,					  Value)
VALUES	('MonopolyBuilds-CivLux', 1);




--Do not change all of the below unless you know what you are doing
--Probably also just don't go down there at all, the code is really bad

-- Enables City Building Construction Detection (Jeweler, Ornament)
UPDATE CustomModOptions
SET Value = '1'
WHERE Name = 'EVENTS_CITY';


-------------------------------------------------------------------------------------------------------------------
--COMPATIBILITY
-------------------------------------------------------------------------------------------------------------------

/*
Compatibility patch
0 = Disabled disregarding if it detects the mod.
1 = Enabled disregarding if it detects the mod.
2 = Disabled until it detects the mod. (Default)
*/

--More Unique Components for VP
INSERT INTO COMMUNITY	
		(Type,				  Value)
VALUES	('MonopolyBuilds-MUC', 2);

UPDATE COMMUNITY
SET Value = '1'
WHERE Type = 'MonopolyBuilds-MUC' AND EXISTS (SELECT * FROM Buildings WHERE Type='BUILDING_AMERICA_RANCH') AND NOT EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-MUC' AND Value= 0);

-- Even More Resources for VP
INSERT INTO COMMUNITY	
		(Type,				  Value)
VALUES	('MonopolyBuilds-MR', 2);

UPDATE COMMUNITY
SET Value = '1'
WHERE Type = 'MonopolyBuilds-MR' AND EXISTS (SELECT * FROM Resources WHERE Type='RESOURCE_BEER') AND NOT EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-MR' AND Value= 0);



/**********************************/
--JEWELER
/**********************************/

--------Even More Resources for VP-----------
INSERT INTO Building_ResourceMonopolyOrs
		(BuildingType,          ResourceType)
SELECT	'BUILDING_IA_JEWELER', 'RESOURCE_OBSIDIAN'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-MR' AND Value= 1);

INSERT INTO Building_LocalResourceOrs
		(BuildingType,          ResourceType)
SELECT	'BUILDING_IA_JEWELER', 'RESOURCE_OBSIDIAN'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-MR' AND Value= 1);

INSERT INTO Building_ResourceYieldChanges
		(BuildingType,				 ResourceType,			 YieldType,				Yield)
SELECT  'BUILDING_IA_JEWELER',	'RESOURCE_OBSIDIAN',		'YIELD_GOLD',			1
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-MR' AND Value= 1);

INSERT INTO Building_ResourceYieldChanges
		(BuildingType,					 ResourceType,				YieldType,				Yield)
SELECT  'BUILDING_IA_JEWELER_DUMMY',	'RESOURCE_OBSIDIAN',		'YIELD_TOURISM',		1
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-MR' AND Value= 1);

-----------Text-------------
UPDATE Language_en_US 
SET Text = '+2 [ICON_GOLD] Gold and +2 [ICON_CULTURE] Culture in the City.[NEWLINE][NEWLINE]Nearby [ICON_RES_JADE] Jade, [ICON_RES_AMBER] Amber, [ICON_RES_LAPIS] Lapis Lazuli, [ICON_RES_GEMS] Gems, and [ICON_RES_OBSIDIAN] Obsidian: +1 [ICON_GOLD] Gold, and also +1 [ICON_TOURISM] Tourism at [COLOR_RESEARCH_STORED]Archaeology[ENDCOLOR].[NEWLINE][NEWLINE]Requires a Monopoly on at least one of these: [ICON_RES_JADE] Jade, [ICON_RES_AMBER] Amber, [ICON_RES_JEWELRY] Jewelry, [ICON_RES_LAPIS] Lapis Lazuli, [ICON_RES_GEMS] Gems, or [ICON_RES_OBSIDIAN] Obsidian.[NEWLINE][NEWLINE]Requires one of these resources to be improved near the City.'
WHERE Tag = 'TXT_KEY_BUILDING_IA_JEWELER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-MR' AND Value= 1);

UPDATE Language_en_US 
SET Text = 'The Jeweler increases [ICON_GOLD] Gold and [ICON_CULTURE] Culture in the City. It requires a Monopoly on [ICON_RES_JADE] Jade, [ICON_RES_AMBER] Amber, [ICON_RES_JEWELRY] Jewelry, [ICON_RES_LAPIS] Lapis Lazuli, [ICON_RES_GEMS] Gems, or [ICON_RES_OBSIDIAN] Obsidian; and gives [ICON_GOLD] Gold to those resources. It also gives these resources [ICON_TOURISM] Tourism after researching Archaeology. So it is a good idea if you have a Monopoly on those resources to build it in Cities with those resources to gain [ICON_GOLD] Gold and [ICON_CULTURE] Culture, and later [ICON_TOURISM] Tourism.'
WHERE Tag = 'TXT_KEY_BUILDING_IA_JEWELER_STRATEGY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-MR' AND Value= 1);



/**********************************/
--COINAGE MINT
/**********************************/

--------Even More Resources for VP-----------
INSERT INTO Building_ResourceMonopolyOrs
		(BuildingType,			  ResourceType)
SELECT	'BUILDING_IA_COIN_MINT', 'RESOURCE_PLATINUM'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-MR' AND Value= 1);

INSERT INTO Building_LocalResourceOrs
		(BuildingType,          ResourceType)
SELECT	'BUILDING_IA_COIN_MINT', 'RESOURCE_PLATINUM'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-MR' AND Value= 1);

INSERT INTO Building_ResourceYieldChanges
		(BuildingType,				 ResourceType,			 YieldType,				Yield)
SELECT  'BUILDING_IA_COIN_MINT',	'RESOURCE_PLATINUM',		'YIELD_GOLD',			1
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-MR' AND Value= 1);

INSERT INTO Building_ResourceMonopolyOrs
		(BuildingType,			  ResourceType)
SELECT	'BUILDING_IA_COIN_MINT', 'RESOURCE_TIN'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-MR' AND Value= 1);

INSERT INTO Building_LocalResourceOrs
		(BuildingType,          ResourceType)
SELECT	'BUILDING_IA_COIN_MINT', 'RESOURCE_TIN'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-MR' AND Value= 1);

INSERT INTO Building_ResourceYieldChanges
		(BuildingType,				 ResourceType,		YieldType,				Yield)
SELECT  'BUILDING_IA_COIN_MINT',	'RESOURCE_TIN',		'YIELD_GOLD',			1
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-MR' AND Value= 1);

INSERT INTO Building_ResourceMonopolyOrs
		(BuildingType,			  ResourceType)
SELECT	'BUILDING_IA_COIN_MINT', 'RESOURCE_MANUSCRIPTS'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-MR' AND Value= 1);

-----------Text-------------
UPDATE Language_en_US 
SET Text = '+2 [ICON_GOLD] Gold in the City, and +1 [ICON_GOLD] Gold for every [ICON_SWAP] International Trade Route you own.[NEWLINE][NEWLINE]Nearby [ICON_RES_GOLD] Gold: +1 [ICON_GOLD] Gold.[NEWLINE]Nearby [ICON_RES_COPPER] Copper: +1 [ICON_GOLD] Gold.[NEWLINE]Nearby [ICON_RES_TIN] Tin: +1 [ICON_GOLD] Gold.[NEWLINE]Nearby [ICON_RES_PLATINUM] Platinum: +1 [ICON_GOLD] Gold.[NEWLINE][NEWLINE]Requires a Monopoly on at least one of these Resources: [ICON_RES_GOLD] Gold, [ICON_RES_COPPER] Copper, [ICON_RES_MANUSCRIPTS] Manuscripts, [ICON_RES_TIN] Tin, or [ICON_RES_PLATINUM] Platinum.[NEWLINE][NEWLINE]Requires one of these resources to be improved near the City.'
WHERE Tag = 'TXT_KEY_BUILDING_IA_COIN_MINT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-MR' AND Value= 1);

UPDATE Language_en_US 
SET Text = 'The Coinage Mint gives [ICON_GOLD] Gold for every every [ICON_SWAP] International Trade Route, a slight [ICON_GOLD] Gold increase, and a boost to the [ICON_GOLD] Gold production of [ICON_RES_GOLD] Gold, [ICON_RES_COPPER] Copper, [ICON_RES_TIN] Tin, and [ICON_RES_PLATINUM] Platinum. Build it if you have a Monopoly on those resources, or [ICON_RES_MANUSCRIPTS] Manuscripts, to boost your [ICON_GOLD] Gold.'
WHERE Tag = 'TXT_KEY_BUILDING_IA_COIN_MINT_STRATEGY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-MR' AND Value= 1);





/**********************************/
--HUNTER'S CABIN
/**********************************/

--------------Even More Resources for VP-------------------
INSERT INTO Building_ResourceMonopolyOrs
		(BuildingType,          ResourceType)
SELECT	'BUILDING_IA_LODGE', 'RESOURCE_BIRDS_NEST'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-MR' AND Value= 1);

------Text----------
UPDATE Language_en_US 
SET Text = '+2 [ICON_CULTURE] Culture and +3 [ICON_GOLD] Gold. +10% [ICON_GOLD] Gold during We Love the King Day.[NEWLINE][NEWLINE]Nearby [ICON_RES_CRAB] Crab: +1 [ICON_GOLD] Gold.[NEWLINE]Nearby [ICON_RES_FUR] Furs: +1 [ICON_GOLD] Gold.[NEWLINE]Nearby [ICON_RES_PEARLS] Pearls: +1 [ICON_GOLD] Gold.[NEWLINE][NEWLINE]Requires a Monopoly on at least one of these: [ICON_RES_CRAB] Crab, [ICON_RES_FUR] Furs, [ICON_RES_PEARLS] Pearls, or [ICON_RES_BIRDS_NEST] Bird''s Nest.[NEWLINE][NEWLINE]Requires one of these resources to be improved near the City.'
WHERE Tag = 'TXT_KEY_BUILDING_IA_LODGE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-MR' AND Value= 1);


/**********************************/
--APOTHECARY
/**********************************/

-------------Even More Resources for VP----------------------
INSERT INTO Building_ResourceYieldChanges
		(BuildingType,				 ResourceType,			YieldType,			Yield)
SELECT  'BUILDING_IA_APOTHECARY',	'RESOURCE_POPPY',		'YIELD_SCIENCE',	1
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-MR' AND Value= 1);

INSERT INTO Building_ResourceMonopolyOrs
		(BuildingType,				  ResourceType)
SELECT  'BUILDING_IA_APOTHECARY', 'RESOURCE_POPPY'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-MR' AND Value= 1);


INSERT INTO Building_LocalResourceOrs
		(BuildingType,					ResourceType)
SELECT  'BUILDING_IA_APOTHECARY',		'RESOURCE_POPPY'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-MR' AND Value= 1);

--------------More Unique Components---------------
INSERT INTO Building_ResourceYieldChanges
		(BuildingType,				 ResourceType,			YieldType,				Yield)
SELECT  'BUILDING_IA_APOTHECARY',	'RESOURCE_COCA',		'YIELD_SCIENCE',		1
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-MUC' AND Value= 1) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-CivLux' AND Value= 1);

INSERT INTO Building_ResourceMonopolyOrs
		(BuildingType,				ResourceType)
SELECT  'BUILDING_IA_APOTHECARY',	'RESOURCE_COCA'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-MUC' AND Value= 1) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-CivLux' AND Value= 1);

INSERT INTO Building_LocalResourceOrs
		(BuildingType,					ResourceType)
SELECT  'BUILDING_IA_APOTHECARY',		'RESOURCE_COCA'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-MUC' AND Value= 1) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-CivLux' AND Value= 1);

------------Text--------------
UPDATE Language_en_US --MUC 
SET Text = '+5 [ICON_CULTURE] Culture every time you research a technology, scaling with era.[NEWLINE][NEWLINE]Nearby [ICON_RES_TOBACCO] Tobacco: +1 [ICON_RESEARCH] Science.[NEWLINE]Nearby [ICON_RES_SALT] Salt: +1 [ICON_RESEARCH] Science.[NEWLINE]Nearby [ICON_RES_CORAL] Coral: +1 [ICON_RESEARCH] Science.[NEWLINE]Nearby [ICON_RES_COCA] Coca: +1 [ICON_RESEARCH] Science.[NEWLINE][NEWLINE]Requires a Monopoly on at least one of these: [ICON_RES_TOBACCO] Tobacco, [ICON_RES_SALT] Salt, [ICON_RES_CORAL] Coral, or [ICON_RES_COCA] Coca.[NEWLINE][NEWLINE]Requires one of these resources to be improved near the City.'
WHERE Tag = 'TXT_KEY_BUILDING_IA_APOTHECARY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-MUC' AND Value= 1) AND NOT EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-MR' AND Value= 1) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-CivLux' AND Value= 1);

UPDATE Language_en_US --MR
SET Text = '+5 [ICON_CULTURE] Culture every time you research a technology, scaling with era.[NEWLINE][NEWLINE]Nearby [ICON_RES_TOBACCO] Tobacco: +1 [ICON_RESEARCH] Science.[NEWLINE]Nearby [ICON_RES_SALT] Salt: +1 [ICON_RESEARCH] Science.[NEWLINE]Nearby [ICON_RES_CORAL] Coral: +1 [ICON_RESEARCH] Science.[NEWLINE]Nearby [ICON_RES_POPPY] Poppy: +1 [ICON_RESEARCH] Science.[NEWLINE][NEWLINE]Requires a Monopoly on at least one of these: [ICON_RES_TOBACCO] Tobacco, [ICON_RES_SALT] Salt, [ICON_RES_CORAL] Coral, or [ICON_RES_POPPY] Poppy.[NEWLINE][NEWLINE]Requires one of these resources to be improved near the City.'
WHERE Tag = 'TXT_KEY_BUILDING_IA_APOTHECARY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-MUC' AND Value= 1) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-MR' AND Value= 1) AND NOT EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-CivLux' AND Value= 1);

UPDATE Language_en_US --MR
SET Text = '+5 [ICON_CULTURE] Culture every time you research a technology, scaling with era.[NEWLINE][NEWLINE]Nearby [ICON_RES_TOBACCO] Tobacco: +1 [ICON_RESEARCH] Science.[NEWLINE]Nearby [ICON_RES_SALT] Salt: +1 [ICON_RESEARCH] Science.[NEWLINE]Nearby [ICON_RES_CORAL] Coral: +1 [ICON_RESEARCH] Science.[NEWLINE]Nearby [ICON_RES_POPPY] Poppy: +1 [ICON_RESEARCH] Science.[NEWLINE][NEWLINE]Requires a Monopoly on at least one of these: [ICON_RES_TOBACCO] Tobacco, [ICON_RES_SALT] Salt, [ICON_RES_CORAL] Coral, or [ICON_RES_POPPY] Poppy.[NEWLINE][NEWLINE]Requires one of these resources to be improved near the City.'
WHERE Tag = 'TXT_KEY_BUILDING_IA_APOTHECARY_HELP' AND NOT EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-MUC' AND Value= 1) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-MR' AND Value= 1) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-CivLux' AND Value= 1);

UPDATE Language_en_US -- MR
SET Text = '+5 [ICON_CULTURE] Culture every time you research a technology, scaling with era.[NEWLINE][NEWLINE]Nearby [ICON_RES_TOBACCO] Tobacco: +1 [ICON_RESEARCH] Science.[NEWLINE]Nearby [ICON_RES_SALT] Salt: +1 [ICON_RESEARCH] Science.[NEWLINE]Nearby [ICON_RES_CORAL] Coral: +1 [ICON_RESEARCH] Science.[NEWLINE]Nearby [ICON_RES_POPPY] Poppy: +1 [ICON_RESEARCH] Science.[NEWLINE][NEWLINE]Requires a Monopoly on at least one of these: [ICON_RES_TOBACCO] Tobacco, [ICON_RES_SALT] Salt, [ICON_RES_CORAL] Coral, or [ICON_RES_POPPY] Poppy.[NEWLINE][NEWLINE]Requires one of these resources to be improved near the City.'
WHERE Tag = 'TXT_KEY_BUILDING_IA_APOTHECARY_HELP' AND NOT EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-MUC' AND Value= 1) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-MR' AND Value= 1) AND NOT EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-CivLux' AND Value= 1);

UPDATE Language_en_US -- MUC, MR
SET Text = '+5 [ICON_CULTURE] Culture every time you research a technology, scaling with era.[NEWLINE][NEWLINE]Nearby [ICON_RES_TOBACCO] Tobacco: +1 [ICON_RESEARCH] Science.[NEWLINE]Nearby [ICON_RES_SALT] Salt: +1 [ICON_RESEARCH] Science.[NEWLINE]Nearby [ICON_RES_CORAL] Coral: +1 [ICON_RESEARCH] Science.[NEWLINE]Nearby [ICON_RES_POPPY] Poppy: +1 [ICON_RESEARCH] Science.[NEWLINE]Nearby [ICON_RES_COCA] Coca: +1 [ICON_RESEARCH] Science.[NEWLINE][NEWLINE]Requires a Monopoly on at least one of these: [ICON_RES_TOBACCO] Tobacco, [ICON_RES_SALT] Salt, [ICON_RES_CORAL] Coral, [ICON_RES_POPPY] Poppy, or [ICON_RES_COCA].[NEWLINE][NEWLINE]Requires one of these resources to be improved near the City.'
WHERE Tag = 'TXT_KEY_BUILDING_IA_APOTHECARY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-MUC' AND Value= 1) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-MR' AND Value= 1) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-CivLux' AND Value= 1);






/**********************************/
--CONFECTIONER
/**********************************/

--------------Even More Resources for VP-------------------
INSERT INTO Building_ResourceMonopolyOrs
		(BuildingType,				  ResourceType)
SELECT	'BUILDING_IA_CONFECTIONERY', 'RESOURCE_HONEY'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-MR' AND Value= 1);

------Text----------
UPDATE Language_en_US 
SET Text = '+4 [ICON_GOLD] Gold in the City. Gain [ICON_CULTURE] Culture whenever a [ICON_CITIZEN] Citizen is born in the City.[NEWLINE][NEWLINE]Nearby [ICON_RES_SUGAR] Sugar: +1 [ICON_CULTURE] Culture.[NEWLINE]Nearby [ICON_RES_COCOA] Cocoa: +1 [ICON_CULTURE] Culture.[NEWLINE]Nearby [ICON_RES_SPICES] Cinnamon: +1 [ICON_CULTURE] Culture.[NEWLINE][NEWLINE]Requires a Monopoly on at least one of these: [ICON_RES_SUGAR] Sugar, [ICON_RES_COCOA] Cocoa, [ICON_RES_SPICES] Cinnamon, [ICON_RES_HONEY] Honey.[NEWLINE][NEWLINE]Requires one of these resources to be improved near the City.'
WHERE Tag = 'TXT_KEY_BUILDING_IA_CONFECTIONERY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-MR' AND Value= 1);




/**********************************/
--PERFUMERY
/**********************************/


---------------Even More Resources for VP-----------------
INSERT INTO Building_ResourceYieldChanges
		(BuildingType,				 ResourceType,			 YieldType,				Yield)
SELECT  'BUILDING_IA_PERFUMERY',	'RESOURCE_LAVENDER',	 'YIELD_CULTURE',		1
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-MR' AND Value= 1);

INSERT INTO Building_ResourceYieldChanges
		(BuildingType,				 ResourceType,			 YieldType,				Yield)
SELECT  'BUILDING_IA_PERFUMERY',	'RESOURCE_LAVENDER',	 'YIELD_GOLD',			1
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-MR' AND Value= 1);

INSERT INTO Building_ResourceMonopolyOrs
		(BuildingType,					ResourceType)
SELECT  'BUILDING_IA_PERFUMERY',		'RESOURCE_LAVENDER'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-MR' AND Value= 1);

INSERT INTO Building_LocalResourceOrs
		(BuildingType,				ResourceType)
SELECT  'BUILDING_IA_PERFUMERY',	'RESOURCE_LAVENDER'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-MR' AND Value= 1);

----------------Text-------------------
UPDATE Language_en_US 
SET Text = '+1 [ICON_GOLD] Gold and +1 [ICON_CULTURE] Culture. -1 [ICON_HAPPINESS_3] Unhappiness from [ICON_FOOD] / [ICON_PRODUCTION] Distress.[NEWLINE][NEWLINE]Nearby [ICON_RES_PERFUME] Perfume: +1 [ICON_CULTURE] Culture and [ICON_GOLD] Gold.[NEWLINE]Nearby [ICON_RES_INCENSE] Incense: +1 [ICON_CULTURE] Culture and [ICON_GOLD] Gold.[NEWLINE]Nearby [ICON_RES_WHALE] Whales: +1 [ICON_CULTURE] Culture and [ICON_GOLD] Gold.[NEWLINE]Nearby [ICON_RES_LAVENDER] Lavender: +1 [ICON_CULTURE] Culture and [ICON_GOLD] Gold.[NEWLINE][NEWLINE]Requires a Monopoly on at least one of these: [ICON_RES_PERFUME] Perfume, [ICON_RES_INCENSE] Incense, [ICON_RES_WHALE] Whales, or [ICON_RES_LAVENDER] Lavender.[NEWLINE][NEWLINE]Requires one of these resources to be improved near the City.'
WHERE Tag = 'TXT_KEY_BUILDING_IA_PERFUMERY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-MR' AND Value= 1);






/**********************************/
--CLOTHIER
/**********************************/

--------------CivLux-------------------
INSERT INTO Building_ResourceMonopolyOrs
		(BuildingType,          ResourceType)
SELECT	'BUILDING_IA_TAILOR', 'RESOURCE_BRAZILWOOD'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-CivLux' AND Value= 1);

INSERT INTO Building_LocalResourceOrs
		(BuildingType,          ResourceType)
SELECT	'BUILDING_IA_TAILOR', 'RESOURCE_BRAZILWOOD'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-CivLux' AND Value= 1);

INSERT INTO Building_ResourceYieldChanges
		(BuildingType,				 ResourceType,			 YieldType,				Yield)
SELECT  'BUILDING_IA_TAILOR',	'RESOURCE_BRAZILWOOD',		'YIELD_CULTURE',			1
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-CivLux' AND Value= 1);

------Text----------
UPDATE Language_en_US 
SET Text = '+2 [ICON_GOLD] Gold in the City and 15% of [ICON_CULTURE] Culture is added to the [ICON_GOLD] Gold in the City.[NEWLINE][NEWLINE]Nearby [ICON_RES_SILK] Silk: +1 [ICON_CULTURE] Culture.[NEWLINE]Nearby [ICON_RES_DYE] Dyes: +1 [ICON_CULTURE] Culture.[NEWLINE]Nearby [ICON_RES_COTTON] Cotton: +1 [ICON_CULTURE] Culture.[NEWLINE]Nearby [ICON_RES_BRAZILWOOD] Brazilwood: +1 [ICON_CULTURE] Culture.[NEWLINE][NEWLINE]Requires a Monopoly on at least one of these: [ICON_RES_COTTON] Cotton, [ICON_RES_SILK] Silk, [ICON_RES_DYE] Dyes, or [ICON_RES_BRAZILWOOD] Brazilwood.[NEWLINE][NEWLINE]Requires one of these resources to be improved near the City.'
WHERE Tag = 'TXT_KEY_BUILDING_IA_TAILOR_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-CivLux' AND Value= 1);

UPDATE Language_en_US 
SET Text = 'The Luxury Tailor boosts the culture of [ICON_RES_COTTON] Cotton, [ICON_RES_SILK] Silk, [ICON_RES_DYE] Dyes, and [ICON_RES_BRAZILWOOD] Brazilwood. Additionally, it converts 15% of the [ICON_CULTURE] Culture in the City into [ICON_GOLD] Gold, and slightly increases the [ICON_GOLD] Gold in the City. Build it if you have a Monopoly on those resources to boost the [ICON_GOLD] Gold and [ICON_CULTURE] Culture in Cities with those Resources.'
WHERE Tag = 'TXT_KEY_BUILDING_IA_TAILOR_STRATEGY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-CivLux' AND Value= 1);




/**********************************/
--FARMERS' MARKET
/**********************************/

--------------Even More Resources for VP-------------------
INSERT INTO Building_ResourceMonopolyOrs
		(BuildingType,				  ResourceType)
SELECT	'BUILDING_IA_FARMERS_MARKET', 'RESOURCE_BEER'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-MR' AND Value= 1);

INSERT INTO Building_ResourceMonopolyOrs
		(BuildingType,				  ResourceType)
SELECT	'BUILDING_IA_FARMERS_MARKET', 'RESOURCE_CHEESE'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-MR' AND Value= 1);

------Text----------
UPDATE Language_en_US 
SET Text = '+3 [ICON_GOLD] Gold in the City, and +1 [ICON_FOOD] Food in the City for every 3 nearby owned farms.[NEWLINE][NEWLINE]-1 [ICON_HAPPINESS_3] Unhappiness from [ICON_GOLD] Poverty.[NEWLINE][NEWLINE]Nearby [ICON_RES_TEA] Tea: +1 [ICON_FOOD] Food and [ICON_GOLD] Gold.[NEWLINE]Nearby [ICON_RES_CITRUS] Citrus: +1 [ICON_FOOD] Food and [ICON_GOLD] Gold.[NEWLINE]Nearby [ICON_RES_OLIVE] Olives: +1 [ICON_FOOD] Food and [ICON_GOLD] Gold.[NEWLINE][NEWLINE]Requires a Monopoly on one of these resources: [ICON_RES_TEA] Tea, [ICON_RES_CITRUS] Citrus, [ICON_RES_OLIVE] Olives, [ICON_RES_BEER] Beer, or [ICON_RES_CHEESE] Cheese.[NEWLINE][NEWLINE]Requires one of these resources to be improved near the City.'
WHERE Tag = 'TXT_KEY_BUILDING_IA_FARMERS_MARKET_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-MR' AND Value= 1);

UPDATE Language_en_US 
SET Text = 'The Farmers'' Market boosts [ICON_GOLD] Gold in the City, and requires a Monopoly on [ICON_RES_TEA] Tea, [ICON_RES_CITRUS] Citrus, [ICON_RES_OLIVE] Olives, [ICON_RES_CHEESE] Cheese, or [ICON_RES_BEER] Beer. It gives those resources +1 [ICON_FOOD] Food and [ICON_GOLD] Gold, and additionally, it gives [ICON_FOOD] Food for every 3 Farms near the City, and reduces [ICON_HAPPINESS_3] Distress. Build it if you have a Monopoly on those resources to get more [ICON_FOOD] Food and [ICON_GOLD] Gold, and to help with Unhappiness.'
WHERE Tag = 'TXT_KEY_BUILDING_IA_FARMERS_MARKET_STRATEGY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-MR' AND Value= 1);





/**********************************/
--RESTAURANT
/**********************************/


---------Even More Resources for VP----------------
INSERT INTO Building_ResourceMonopolyOrs
		(BuildingType,				  ResourceType)
SELECT  'BUILDING_IA_RESTAURANT', 'RESOURCE_CHAMPAGNE'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-MR' AND Value= 1);


--oh no...
------------------CivLux-------------------
INSERT INTO Building_ResourceMonopolyOrs
		(BuildingType,				  ResourceType)
SELECT  'BUILDING_IA_RESTAURANT', 'RESOURCE_PEPPER'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-CivLux' AND Value= 1);

INSERT INTO Building_ResourceMonopolyOrs
		(BuildingType,				  ResourceType)
SELECT  'BUILDING_IA_RESTAURANT', 'RESOURCE_CLOVES'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-CivLux' AND Value= 1);

INSERT INTO Building_ResourceMonopolyOrs
		(BuildingType,				  ResourceType)
SELECT  'BUILDING_IA_RESTAURANT', 'RESOURCE_NUTMEG'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-CivLux' AND Value= 1);

INSERT INTO Building_LocalResourceOrs
		(BuildingType,				  ResourceType)
SELECT  'BUILDING_IA_RESTAURANT', 'RESOURCE_PEPPER'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-CivLux' AND Value= 1);

INSERT INTO Building_LocalResourceOrs
		(BuildingType,				  ResourceType)
SELECT  'BUILDING_IA_RESTAURANT', 'RESOURCE_CLOVES'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-CivLux' AND Value= 1);

INSERT INTO Building_LocalResourceOrs
		(BuildingType,				  ResourceType)
SELECT  'BUILDING_IA_RESTAURANT', 'RESOURCE_NUTMEG'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-CivLux' AND Value= 1);


INSERT INTO Building_ResourceYieldChanges
		(BuildingType,				 ResourceType,			 YieldType,				Yield)
SELECT  'BUILDING_IA_RESTAURANT',	'RESOURCE_PEPPER',		'YIELD_CULTURE',		1
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-CivLux' AND Value= 1);

INSERT INTO Building_ResourceYieldChanges
		(BuildingType,				 ResourceType,			 YieldType,				Yield)
SELECT  'BUILDING_IA_RESTAURANT',	'RESOURCE_CLOVES',		'YIELD_CULTURE',		1
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-CivLux' AND Value= 1);

INSERT INTO Building_ResourceYieldChanges
		(BuildingType,				 ResourceType,			 YieldType,				Yield)
SELECT  'BUILDING_IA_RESTAURANT',	'RESOURCE_NUTMEG',		'YIELD_CULTURE',		1
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-CivLux' AND Value= 1);

INSERT INTO Building_ResourceYieldChanges
		(BuildingType,				 ResourceType,			 YieldType,				Yield)
SELECT  'BUILDING_IA_RESTAURANT',	'RESOURCE_PEPPER',		'YIELD_GOLD',			1
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-CivLux' AND Value= 1);

INSERT INTO Building_ResourceYieldChanges
		(BuildingType,				 ResourceType,			 YieldType,				Yield)
SELECT  'BUILDING_IA_RESTAURANT',	'RESOURCE_CLOVES',		'YIELD_GOLD',			1
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-CivLux' AND Value= 1);

INSERT INTO Building_ResourceYieldChanges
		(BuildingType,				 ResourceType,			 YieldType,				Yield)
SELECT  'BUILDING_IA_RESTAURANT',	'RESOURCE_NUTMEG',		'YIELD_GOLD',			1
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-CivLux' AND Value= 1);

------------Text-----------
UPDATE Language_en_US 
SET Text = '+6 [ICON_GOLD] Gold in the City and +1 [ICON_CULTURE] Culture for every 3 [ICON_CITIZEN] Citizens.[NEWLINE][NEWLINE]Nearby [ICON_RES_WINE] Wine, [ICON_RES_COFFEE] Coffee, [ICON_RES_TRUFFLES] Truffles, [ICON_RES_PEPPER] Pepper, [ICON_RES_CLOVES] Cloves, and [ICON_RES_NUTMEG] Nutmeg: +1 [ICON_CULTURE] Culture and [ICON_GOLD] Gold.[NEWLINE][NEWLINE]Requires a Monopoly on at least one of these: [ICON_RES_WINE] Wine, [ICON_RES_COFFEE] Coffee, [ICON_RES_TRUFFLES] Truffles, [ICON_RES_PEPPER] Pepper, [ICON_RES_CLOVES] Cloves, or [ICON_RES_NUTMEG] Nutmeg.[NEWLINE][NEWLINE]Requires one of these resources to be improved near the City.'
WHERE Tag = 'TXT_KEY_BUILDING_IA_RESTAURANT_HELP' AND NOT EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-MR' AND Value= 1) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-CivLux' AND Value= 1);

UPDATE Language_en_US 
SET Text = '+6 [ICON_GOLD] Gold in the City and +1 [ICON_CULTURE] Culture for every 3 [ICON_CITIZEN] Citizens.[NEWLINE][NEWLINE]Nearby [ICON_RES_WINE] Wine, [ICON_RES_COFFEE] Coffee, [ICON_RES_TRUFFLES] Truffles, [ICON_RES_PEPPER] Pepper, [ICON_RES_CLOVES] Cloves, and [ICON_RES_NUTMEG] Nutmeg: +1 [ICON_CULTURE] Culture and [ICON_GOLD] Gold.[NEWLINE][NEWLINE]Requires a Monopoly on at least one of these: [ICON_RES_WINE] Wine, [ICON_RES_COFFEE] Coffee, [ICON_RES_TRUFFLES] Truffles, [ICON_RES_PEPPER] Pepper, [ICON_RES_CLOVES] Cloves, [ICON_RES_NUTMEG] Nutmeg, or [ICON_RES_CHAMPAGNE] Champagne.[NEWLINE][NEWLINE]Requires one of these resources to be improved near the City.'
WHERE Tag = 'TXT_KEY_BUILDING_IA_RESTAURANT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-MR' AND Value= 1) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-CivLux' AND Value= 1);

UPDATE Language_en_US 
SET Text = '+6 [ICON_GOLD] Gold in the City and +1 [ICON_CULTURE] Culture for every 3 [ICON_CITIZEN] Citizens.[NEWLINE][NEWLINE]Nearby [ICON_RES_WINE] Wine: +1 [ICON_CULTURE] Culture and [ICON_GOLD] Gold.[NEWLINE]Nearby [ICON_RES_COFFEE] Coffee: +1 [ICON_CULTURE] Culture and [ICON_GOLD] Gold.[NEWLINE]Nearby [ICON_RES_TRUFFLES] Truffles: +1 [ICON_CULTURE] Culture and [ICON_GOLD] Gold.[NEWLINE][NEWLINE]Requires a Monopoly on at least one of these: [ICON_RES_WINE] Wine, [ICON_RES_COFFEE] Coffee, [ICON_RES_TRUFFLES] Truffles, or [ICON_RES_CHAMPAGNE] Champagne.[NEWLINE][NEWLINE]Requires one of these resources to be improved near the City.'
WHERE Tag = 'TXT_KEY_BUILDING_IA_RESTAURANT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-MR' AND Value= 1) AND NOT EXISTS (SELECT * FROM COMMUNITY WHERE Type='MonopolyBuilds-CivLux' AND Value= 1);

