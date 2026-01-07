INSERT INTO BuildingClasses 	
			(Type,	DefaultBuilding,		Description)
VALUES		('BUILDINGCLASS_NET_CAFE',	'BUILDING_NET_CAFE',	'TXT_KEY_BUILDING_NET_CAFE');

INSERT INTO Buildings
	(Type,	Description,	Civilopedia,	Strategy,	
	Help,		GoldMaintenance, Cost, HurryCostModifier, 	MinAreaSize, 	ConquestProb, 	BuildingClass, 			
	ArtDefineTag, 	PrereqTech, 	PortraitIndex, 	IconAtlas)
VALUES	
	('BUILDING_NET_CAFE',	'TXT_KEY_BUILDING_NET_CAFE', 	'TXT_KEY_BUILDING_NET_CAFE_TEXT',	'TXT_KEY_BUILDING_NET_CAFE_STRATEGY',	'TXT_KEY_BUILDING_NET_CAFE_HELP',	11, 		2850, -20, 		-1, 	80, 		'BUILDINGCLASS_NET_CAFE', 
	'ART_DEF_BUILDING_MARKET', 	'TECH_INTERNET', 	37,				'CORP2_ATLAS');

INSERT INTO Building_YieldPerFranchise
	(BuildingType, YieldType, Yield)
SELECT
	'BUILDING_NET_CAFE', Type, 1
FROM Yields WHERE ID < 6;

INSERT INTO Building_YieldFromSpyAttack
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_NET_CAFE', 'YIELD_SCIENCE', 50);

INSERT INTO Building_Flavors
	(BuildingType,		FlavorType,	Flavor)
VALUES
	('BUILDING_NET_CAFE',	'FLAVOR_CULTURE', 40),	
	('BUILDING_NET_CAFE',	'FLAVOR_GOLD', 20),	
	('BUILDING_NET_CAFE',	'FLAVOR_RELIGION', 20),	
	('BUILDING_NET_CAFE',	'FLAVOR_GROWTH', 20),
	('BUILDING_NET_CAFE',	'FLAVOR_PRODUCTION', 20),
	('BUILDING_NET_CAFE',	'FLAVOR_ESPIONAGE', 20),	
	('BUILDING_NET_CAFE',	'FLAVOR_SCIENCE', 40);

UPDATE Buildings
SET
	BoredomFlatReduction = 99
WHERE BuildingClass = 'BUILDINGCLASS_NET_CAFE';

INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 				BuildingClassType)
VALUES	('BUILDING_NET_CAFE',	'BUILDINGCLASS_ARCADE');

------------------------------
-- Text
------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES	('TXT_KEY_BUILDING_NET_CAFE', 'Net Café'),
		('TXT_KEY_BUILDING_NET_CAFE_TEXT', 'An Net Café, also known as a cybercafé, is a business that provides the use of computers with high bandwidth Internet access on the payment of a fee. Apart from travelers, in many developing countries Internet cafés are the primary form of Internet access for citizens as a shared-access model is more affordable than personal ownership of equipment and/or software. As Internet access rose many pubs, bars, and cafés added terminals and eventually Wi-Fi hotspots, eroding the distinction between the Internet café and normal cafés. In regions like Southeast Asia, internet cafés have evolved into esports cafés, serving as community hubs for gamers and training grounds for professional players.'),
		('TXT_KEY_BUILDING_NET_CAFE_STRATEGY',	'The Net Café is the last line of defense against the Cultural Victory, as it eliminates Boredom, which is a negative modifier increasing your Tourism received from all sources. As an Information Era building, it also has the capacity to provide large amounts of yields, should your Corporation be doing well. Finally, anonymous access to the internet is great news for your Spies, who can hack into your enemies for a Science boost to close out that last leg of the game!'),
		('TXT_KEY_BUILDING_NET_CAFE_HELP', '');

--Receive 50 [ICON_RESEARCH] Science when you perform a Spy Mission, scaling with Era. +1 [COLOR_POSITIVE_TEXT]All Yields[ENDCOLOR] for every one of your [ICON_FRANCHISE] Franchises in foreign Cities (up to your Franchise Limit).[NEWLINE][NEWLINE]No [ICON_HAPPINESS_3] Unhappiness from [ICON_CULTURE] Boredom.
