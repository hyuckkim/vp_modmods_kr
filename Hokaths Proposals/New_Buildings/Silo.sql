INSERT INTO BuildingClasses 	
			(Type,							DefaultBuilding,		Description)
VALUES		('BUILDINGCLASS_SILO',	'BUILDING_SILO',	'TXT_KEY_BUILDING_SILO');

INSERT INTO	 Buildings
		(Type,						Description,						Civilopedia,							Strategy,									Help,									GoldMaintenance, 	Cost, HurryCostModifier, 	MinAreaSize, 	ConquestProb, 	BuildingClass, 					ArtDefineTag, 				PrereqTech, 			PortraitIndex, 	IconAtlas)
VALUES	('BUILDING_SILO',	'TXT_KEY_BUILDING_SILO', 	'TXT_KEY_BUILDING_SILO_TEXT',	'TXT_KEY_BUILDING_SILO_STRATEGY',	'TXT_KEY_BUILDING_SILO_HELP',	10, 				2500, -20, 					-1, 			80, 			'BUILDINGCLASS_SILO', 	'ART_DEF_BUILDING_MARKET', 	'TECH_ADVANCED_BALLISTICS', 	23,				'CORP2_ATLAS');

UPDATE Buildings SET
	CityRangedStrikeRange = 1,
	RangedStrikeModifier = 25
WHERE BuildingClass = 'BUILDINGCLASS_SILO';

INSERT INTO Building_FreeUnits
	(BuildingType, UnitType, NumUnits)
VALUES
	('BUILDING_SILO', 'UNIT_GUIDED_MISSILE', 1);

INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 	BuildingClassType)
VALUES
	('BUILDING_SILO', 'BUILDINGCLASS_MILITARY_BASE');

-- or replace because devotion ideology does this too
INSERT OR REPLACE INTO UnitCombatInfos 
			(Type, Description) 
VALUES		
	('UNITCOMBAT_MISSILE', 'TXT_KEY_UNITCOMBAT_MISSILE');

INSERT OR REPLACE INTO Language_en_US 
			(Tag,	Text) 
VALUES	
	('TXT_KEY_UNITCOMBAT_MISSILE', 'Missiles');

INSERT INTO Building_UnitCombatProductionModifiers
	(BuildingType, UnitCombatType, Modifier)
VALUES
	('BUILDING_SILO', 'UNITCOMBAT_MISSILE', 100);

UPDATE Units SET CombatClass = 'UNITCOMBAT_MISSILE' WHERE Special = 'SPECIALUNIT_MISSILE';

INSERT INTO Building_ResourceQuantityRequirements
	(BuildingType, ResourceType, Cost)
VALUES
	('BUILDING_SILO', 'RESOURCE_ALUMINUM', 1);

INSERT INTO Building_Flavors 
	(BuildingType, FlavorType, Flavor)
VALUES
	('BUILDING_SILO', 'FLAVOR_DEFENSE', 60),
	('BUILDING_SILO', 'FLAVOR_MILITARY_TRAINING', 10);

-- move silo promo to all missile units
DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_NUCLEAR_MISSILE';
DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_NUCLEAR_MISSILE';

UPDATE Buildings SET
	TrainedFreePromotion = 'PROMOTION_NUCLEAR_SILO'
WHERE BuildingClass = 'BUILDINGCLASS_SILO';

INSERT INTO UnitPromotions_UnitCombats
	(PromotionType, UnitCombatType)
VALUES
	('PROMOTION_NUCLEAR_SILO', 'UNITCOMBAT_MISSILE');

------------------------------
-- Text
------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES	('TXT_KEY_BUILDING_SILO',			'Missile Silo'),
		('TXT_KEY_BUILDING_SILO_TEXT',		'An underground missile silo is a vertical cylindrical structure constructed underground, for the storage and launching of all ranges of ballistic missiles. They are usually connected, physically and/or electronically, to a missile launch control center. With the introduction of the Soviet UR-100 and the U.S. Titan II missile series in the 1960s, underground silos changed to their modern form. Both missile series introduced the use of hypergolic propellant, which could be stored in the missiles, allowing for rapid launches. This allowed both countries'' liquid-fueled missile systems to be moved into underground silos. The underground missile silo has remained the primary missile basing system and launch facility for land-based missiles since.'),
		('TXT_KEY_BUILDING_SILO_STRATEGY',	'The final military Building, use the Missile Silo to turn your Cities into fully fledged Siege Units of the Information Era. As well as receiving a free Guided Missile for your trouble, further missilies (including Nuclear ones) are half price, paying for the heavy construction cost in a game with only a few turns left.'),
		('TXT_KEY_BUILDING_SILO_HELP',		'Receive a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Guided Missile. +100% [ICON_PRODUCTION] Production to Missile Units and Missiles created by this City (past or future) receive the [COLOR_POSITIVE_TEXT]Shielded Silo[ENDCOLOR] Promotion. +25% to the City''s [ICON_RANGE_STRENGTH] Ranged Strike Damage, and +1 to its Ranged Strike Range.[NEWLINE][NEWLINE]Requires 1 [ICON_RES_ALUMINUM] Aluminum.');


