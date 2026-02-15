
--Building Classes
INSERT INTO BuildingClasses
		(Type,						    DefaultBuilding,		 Description)
VALUES  ('BUILDINGCLASS_IA_COIN_MINT', 'BUILDING_IA_COIN_MINT', 'TXT_KEY_BUILDING_IA_COIN_MINT');


--Building																																						 --'BW_ATLAS_1', 34  to use original Mint Icon
INSERT INTO Buildings (Type,						 BuildingClass,					   Cost,  HurryCostModifier,  PrereqTech,       ConquestProb, NeverCapture,  IconAtlas,				PortraitIndex,  Description,					   Help,								 Civilopedia,						     Strategy) VALUES
					  ('BUILDING_IA_COIN_MINT',     'BUILDINGCLASS_IA_COIN_MINT',      200,  -20,                 'TECH_CURRENCY',  0,            1,             'ATLAS_IA_MONOPOLY',   5,             'TXT_KEY_BUILDING_IA_COIN_MINT', 'TXT_KEY_BUILDING_IA_COIN_MINT_HELP', 'TXT_KEY_BUILDING_IA_COIN_MINT_TEXT', 'TXT_KEY_BUILDING_IA_COIN_MINT_STRATEGY');


--Monopoly Detection
INSERT INTO Building_ResourceMonopolyOrs
		(BuildingType,			   ResourceType)
VALUES  ('BUILDING_IA_COIN_MINT', 'RESOURCE_GOLD'),
		('BUILDING_IA_COIN_MINT', 'RESOURCE_COPPER');


-- Building_LocalResourceOrs
INSERT INTO Building_LocalResourceOrs
		(BuildingType,			   ResourceType)
VALUES  ('BUILDING_IA_COIN_MINT', 'RESOURCE_GOLD'),
		('BUILDING_IA_COIN_MINT', 'RESOURCE_COPPER');


--Building_YieldChanges
INSERT INTO Building_YieldChanges
			(BuildingType,				 YieldType,			Yield)
VALUES		('BUILDING_IA_COIN_MINT',	'YIELD_GOLD',		2);

-- Gold for Resources
INSERT INTO Building_ResourceYieldChanges
			(BuildingType,				 ResourceType,				 YieldType,				Yield)
VALUES		('BUILDING_IA_COIN_MINT',	'RESOURCE_GOLD',			'YIELD_GOLD',			1),
			('BUILDING_IA_COIN_MINT',	'RESOURCE_COPPER',			'YIELD_GOLD',			1);


--Flavors
INSERT INTO	Building_Flavors
			(BuildingType,					 FlavorType,				Flavor)
VALUES		('BUILDING_IA_COIN_MINT',		'FLAVOR_GOLD',				30);
				

-- Text
INSERT INTO Language_en_US (Tag, Text)
VALUES
('TXT_KEY_BUILDING_IA_COIN_MINT', 'Coinage Mint'),
('TXT_KEY_BUILDING_IA_COIN_MINT_HELP', '+2 [ICON_GOLD] Gold in the City, and +1 [ICON_GOLD] Gold for every [ICON_SWAP] International Trade Route you own.[NEWLINE][NEWLINE]Nearby [ICON_RES_GOLD] Gold: +1 [ICON_GOLD] Gold.[NEWLINE]Nearby [ICON_RES_COPPER] Copper: +1 [ICON_GOLD] Gold.[NEWLINE][NEWLINE]Requires a Monopoly on [ICON_RES_GOLD] Gold or [ICON_RES_COPPER] Copper.[NEWLINE][NEWLINE]Requires one of these resources to be improved near the City.'),
('TXT_KEY_BUILDING_IA_COIN_MINT_TEXT', 'A Coinage Mint is a place where Coins are produced. Coins have been used for many generations and are used in the modern day as a medium of exchange or legal tender, or more simply, as currency. As time went on, Mints became more complex, such as their methods of coinage creation. In the beggining, coins were often made simply by hammering or casting. Today, Coin Dies are used in automatic machinery to manufacture coins by the millions. In addition to figuring out the logistics of making currency, almost every modern Mint also carries with it the burden of seeing the effects of creating that currency. In the modern day, vast economies depend on stability from their currency, and so Mints regulate the production as to try to have more stability in the economy.'),
('TXT_KEY_BUILDING_IA_COIN_MINT_STRATEGY', 'The Coinage Mint gives [ICON_GOLD] Gold for every every [ICON_SWAP] International Trade Route, a slight [ICON_GOLD] Gold increase, and a boost to the [ICON_GOLD] Gold production of [ICON_RES_GOLD] Gold and [ICON_RES_COPPER] Copper. Build it if you have a Monopoly on those resources to boost your [ICON_GOLD] Gold.');