--============================================--
-- ICONS ATLASES
--============================================--
INSERT INTO IconTextureAtlases 
			(Atlas, 							IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES		('BUILDING_MORE_WONDERS_ATLAS', 	256, 		'More_Wonders_Buildings_256.dds',		8, 				1),
			('BUILDING_MORE_WONDERS_ATLAS', 	128, 		'More_Wonders_Buildings_128.dds',		8, 				1),
			('BUILDING_MORE_WONDERS_ATLAS', 	80, 		'More_Wonders_Buildings_80.dds',		8, 				1),
			('BUILDING_MORE_WONDERS_ATLAS', 	64, 		'More_Wonders_Buildings_64.dds',		8, 				1),
			('BUILDING_MORE_WONDERS_ATLAS', 	45, 		'More_Wonders_Buildings_45.dds',		8, 				1);	
--============================================--
-- PROMOTIONS
--============================================--
INSERT INTO Language_en_US 
			(Tag,								Text) 
VALUES		('TXT_KEY_PROMOTION_FLETCHER',		'Yerba de la Fleche'),
			('TXT_KEY_PROMOTION_FLETCHER_HELP',	'+50%[ICON_RANGE_STRENGTH]Attacking RCS [COLOR:255:230:85:255]vs Wounded Units[ENDCOLOR].');

INSERT INTO UnitPromotions 
			(Type,						Description,						Help,									Sound,				CannotBeChosen, LostWithUpgrade,	PortraitIndex,	IconAtlas,						PediaType,			PediaEntry) 
VALUES		('PROMOTION_FLETCHER',		'TXT_KEY_PROMOTION_FLETCHER',		'TXT_KEY_PROMOTION_FLETCHER_HELP',		'AS2D_IF_LEVELUP',	1,				1,					20,				'PROMOTION_MORE_WONDERS_ATLAS',	'PEDIA_RANGED',		'TXT_KEY_PROMOTION_FLETCHER');

UPDATE UnitPromotions SET AttackWoundedMod = 50 WHERE Type = 'PROMOTION_FLETCHER';

/*INSERT INTO UnitPromotions_UnitCombats
			(PromotionType,				UnitCombatType)
VALUES		('PROMOTION_FLETCHER',		'UNITCOMBAT_ARCHER');*/
--============================================--
-- BUILDINGS
--============================================--
INSERT INTO BuildingClasses 
			(Type,							Description,					DefaultBuilding)
VALUES		('BUILDINGCLASS_FLETCHER',		'TXT_KEY_BUILDING_FLETCHER',	'BUILDING_FLETCHER'),
			('BUILDINGCLASS_SEAFOOD',		'TXT_KEY_BUILDING_SEAFOOD',		'BUILDING_SEAFOOD');

INSERT INTO Buildings
			(Type,					BuildingClass,				Description,					Civilopedia,							Help,								IconAtlas,						PortraitIndex,	PrereqTech,			Cost,	FaithCost,	GoldMaintenance,	HurryCostModifier,	NukeImmune, ConquestProb,	IsDummy)
VALUES		('BUILDING_FLETCHER',	'BUILDINGCLASS_FLETCHER',	'TXT_KEY_BUILDING_FLETCHER',	'TXT_KEY_BUILDING_FLETCHER_PEDIA',		'TXT_KEY_BUILDING_FLETCHER_HELP',	'BUILDING_MORE_WONDERS_ATLAS',	0,				'TECH_SAILING',		110,	0,			0,					0,					0,          66,				0),
			('BUILDING_SEAFOOD',	'BUILDINGCLASS_SEAFOOD',	'TXT_KEY_BUILDING_SEAFOOD',		'TXT_KEY_BUILDING_SEAFOOD_PEDIA',		'TXT_KEY_BUILDING_SEAFOOD_HELP',	'BUILDING_MORE_WONDERS_ATLAS',	1,				'TECH_FERTILIZER',	1250,	0,			0,					0,					0,			66,				0);

UPDATE Buildings SET FreePromotion = 'PROMOTION_FLETCHER' WHERE Type = 'BUILDING_FLETCHER';
UPDATE Buildings SET BoredomFlatReduction = 1, GreatWorkSlotType = 'GREAT_WORK_SLOT_MUSIC', GreatWorkCount = 1 WHERE Type = 'BUILDING_SEAFOOD';

INSERT INTO Language_en_US 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_FLETCHER',			'Fletcher'),
			('TXT_KEY_BUILDING_FLETCHER_PEDIA',		'TODO'),
			('TXT_KEY_BUILDING_FLETCHER_HELP',		'[COLOR_POSITIVE_TEXT]Yerba de la Fleche[ENDCOLOR] promotion for all Archery units. +10% [ICON_PRODUCTION] Production towards Archery units in this City.[NEWLINE][NEWLINE]Nearby [ICON_RES_TROPICAL_FISH] Tropical Fish: +2 [ICON_PRODUCTION] Production.'),
			('TXT_KEY_BUILDING_SEAFOOD',			'Seafood Station'),
			('TXT_KEY_BUILDING_SEAFOOD_PEDIA',		'TODO'),
			('TXT_KEY_BUILDING_SEAFOOD_HELP',		'5% of the City''s [ICON_FOOD] Food is converted into [ICON_TOURISM] Tourism every turn. Contains 1 slot for a [ICON_GREAT_WORK] Great Work of Music.[NEWLINE][NEWLINE]-1 [ICON_HAPPINESS_3] from [ICON_CULTURE] Boredom.[NEWLINE][NEWLINE]Nearby [ICON_RES_FISH] Fish: +1 [ICON_FOOD] Food.[NEWLINE]Nearby [ICON_RES_CRAB] Crab: +1 [ICON_FOOD] Food and +1 [ICON_TOURISM] Tourism.[NEWLINE]Nearby [ICON_RES_TROPICAL_FISH] Tropical Fish: +1 [ICON_FOOD] Food and +1 [ICON_TOURISM] Tourism.');

INSERT INTO Building_LocalResourceOrs
			(BuildingType,			ResourceType) 
VALUES		('BUILDING_FLETCHER',	'RESOURCE_TROPICAL_FISH'),
			('BUILDING_SEAFOOD',	'RESOURCE_CRAB'),
			('BUILDING_SEAFOOD',	'RESOURCE_TROPICAL_FISH');
			
INSERT INTO Building_YieldChanges 
			(BuildingType,			YieldType,			Yield) 
VALUES		('BUILDING_FLETCHER',	'YIELD_FOOD',		2),
			('BUILDING_SEAFOOD',	'YIELD_FOOD',		1),
			('BUILDING_SEAFOOD',	'YIELD_CULTURE',	2);

INSERT INTO Building_YieldFromYieldPercent
			(BuildingType,				YieldOut,			YieldIn,		Value) 
VALUES		('BUILDING_SEAFOOD',		'YIELD_TOURISM',	'YIELD_FOOD',	5);

INSERT INTO Building_ResourceYieldChanges
			(BuildingType,			ResourceType,				YieldType,			Yield) 
VALUES		('BUILDING_FLETCHER',	'RESOURCE_TROPICAL_FISH',	'YIELD_PRODUCTION', 2),
			('BUILDING_SEAFOOD',	'RESOURCE_FISH',			'YIELD_FOOD',		1),
			('BUILDING_SEAFOOD',	'RESOURCE_CRAB',			'YIELD_FOOD',		1),
			('BUILDING_SEAFOOD',	'RESOURCE_CRAB',			'YIELD_TOURISM',	1),
			('BUILDING_SEAFOOD',	'RESOURCE_TROPICAL_FISH',	'YIELD_FOOD',		1),
			('BUILDING_SEAFOOD',	'RESOURCE_TROPICAL_FISH',	'YIELD_TOURISM',	1);

INSERT INTO Building_UnitCombatProductionModifiers
			(BuildingType,			UnitCombatType,				Modifier) 
VALUES		('BUILDING_FLETCHER',	'UNITCOMBAT_ARCHER',		10);
--============================================--
-- COMPATIBILITY
--============================================--
-- Loisiana
UPDATE Language_en_US SET Text = Text||'[NEWLINE]Nearby [ICON_RES_SHRIMP] Shrimp: +1 [ICON_FOOD] Food and +1 [ICON_TOURISM] Tourism.' WHERE Tag = 'TXT_KEY_BUILDING_SEAFOOD_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-CIV-LOI' AND Value= 1);

INSERT INTO Building_LocalResourceOrs
			(BuildingType,		ResourceType) 
SELECT		'BUILDING_SEAFOOD',	'RESOURCE_SHRIMP' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-CIV-LOI' AND Value= 1);

INSERT INTO Building_ResourceYieldChanges
			(BuildingType,		ResourceType,		YieldType,			Yield) 
SELECT		'BUILDING_SEAFOOD',	'RESOURCE_SHRIMP',	'YIELD_FOOD',		1 WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-CIV-LOI' AND Value= 1) UNION ALL
SELECT		'BUILDING_SEAFOOD',	'RESOURCE_SHRIMP',	'YIELD_TOURISM',	1 WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-CIV-LOI' AND Value= 1);