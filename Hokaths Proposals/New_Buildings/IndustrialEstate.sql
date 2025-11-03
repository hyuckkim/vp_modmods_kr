INSERT INTO BuildingClasses 	
			(Type,							DefaultBuilding,		Description)
VALUES		('BUILDINGCLASS_INDUSTRIAL_ESTATE',	'BUILDING_INDUSTRIAL_ESTATE',	'TXT_KEY_BUILDING_INDUSTRIAL_ESTATE');

INSERT INTO	 Buildings
		(Type,						Description,						Civilopedia,							Strategy,									Help,									GoldMaintenance, 	Cost, HurryCostModifier, 	MinAreaSize, 	ConquestProb, 	BuildingClass, 					ArtDefineTag, 				PrereqTech, 			PortraitIndex, 	IconAtlas)
VALUES	('BUILDING_INDUSTRIAL_ESTATE',	'TXT_KEY_BUILDING_INDUSTRIAL_ESTATE', 	'TXT_KEY_BUILDING_INDUSTRIAL_ESTATE_TEXT',	'TXT_KEY_BUILDING_INDUSTRIAL_ESTATE_STRATEGY',	'TXT_KEY_BUILDING_INDUSTRIAL_ESTATE_HELP',	10, 				2500, -20, 					-1, 			80, 			'BUILDINGCLASS_INDUSTRIAL_ESTATE', 	'ART_DEF_BUILDING_MARKET', 	'TECH_MOBILE_TACTICS', 	21,				'CORP2_ATLAS');

UPDATE Buildings SET
	RequiresIndustrialCityConnection = 1,
	TradeRouteSeaGoldBonus = 800,
	TradeRouteLandGoldBonus = 800,
	TradeRouteRecipientBonus = 6,
	TradeRouteTargetBonus = 6
WHERE BuildingClass = 'BUILDINGCLASS_INDUSTRIAL_ESTATE';

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_INDUSTRIAL_ESTATE', 'YIELD_PRODUCTION', 4),
	('BUILDING_INDUSTRIAL_ESTATE', 'YIELD_FOOD', 6);

INSERT INTO Building_YieldFromInternalTR
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_INDUSTRIAL_ESTATE', 'YIELD_FOOD', 12),	
	('BUILDING_INDUSTRIAL_ESTATE', 'YIELD_PRODUCTION', 12);

INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 			BuildingClassType)
VALUES
	('BUILDING_INDUSTRIAL_ESTATE', 'BUILDINGCLASS_SUPERMARKET');

INSERT INTO Building_YieldFromPurchase
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_INDUSTRIAL_ESTATE', 'YIELD_PRODUCTION', 15);

INSERT INTO Building_Flavors 
	(BuildingType, FlavorType, Flavor)
VALUES
	('BUILDING_INDUSTRIAL_ESTATE', 'FLAVOR_GOLD', 30),
	('BUILDING_INDUSTRIAL_ESTATE', 'FLAVOR_I_TRADE_ORIGIN', 20),	
	('BUILDING_INDUSTRIAL_ESTATE', 'FLAVOR_I_TRADE_DESTINATION', 20),	
	('BUILDING_INDUSTRIAL_ESTATE', 'FLAVOR_I_LAND_TRADE_ROUTE', 20),	
	('BUILDING_INDUSTRIAL_ESTATE', 'FLAVOR_I_SEA_TRADE_ROUTE', 20),
	('BUILDING_INDUSTRIAL_ESTATE', 'FLAVOR_PRODUCTION', 20);

------------------------------
-- Text
------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES	('TXT_KEY_BUILDING_INDUSTRIAL_ESTATE',			'Industrial Estate'),
		('TXT_KEY_BUILDING_INDUSTRIAL_ESTATE_TEXT',		'An Industrial Estate is an area zoned and planned for the purpose of industrial development, and they are usually located on the edges of, or outside, the main residential area of a city, and are normally provided with good transportation access, including road, rail, and (if possible) a port. Industrial parks are notable for being relatively simple to build; they often feature speedily erected single-space steel sheds, occasionally in bright colours. They serve to provide transportation and storage facilities vital to the complex supply chains that underpin the Information Age economy.'),
		('TXT_KEY_BUILDING_INDUSTRIAL_ESTATE_STRATEGY',	'The Industrial Estate is the final building that interacts with Gold and Production, converting the former into the latter and giving a major boost to your international trade. Not only do routes give more Gold, because those connected to you are worth more to the sender, it makes you a more attractive trading partner. What is more, in the uncertain world of the Civ V endgame, it also boosts the safer Internal Trade Routes.'),
		('TXT_KEY_BUILDING_INDUSTRIAL_ESTATE_HELP',		'When you spend [ICON_INVEST] Gold to purchase Units or invest in Buildings in this City, 15% of the cost is converted into [ICON_PRODUCTION] Production. Incoming [ICON_ARROW_LEFT] Trade Routes generate +6 [ICON_GOLD] Gold for the City and for the [ICON_ARROW_RIGHT] Trade Route owner. Both [ICON_CARAVAN] Land and [ICON_CARGO_SHIP] Sea Trade Routes gain +8 [ICON_GOLD] Gold.[NEWLINE][NEWLINE]Internal [ICON_INTERNATIONAL_TRADE] Trade Routes from this City generate +12 [ICON_FOOD] Food or [ICON_PRODUCTION] Production.[NEWLINE][NEWLINE]Requires an [ICON_INDUSTRIAL_CONNECTED] Industrial City Connection before it can be constructed.');



