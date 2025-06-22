--============================================--
-- 아이콘 아틀라스
--============================================--
INSERT INTO IconTextureAtlases 
			(Atlas, 							IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES		('BUILDING_MORE_WONDERS_ATLAS', 	256, 		'More_Wonders_Buildings_256.dds',		8, 				1),
			('BUILDING_MORE_WONDERS_ATLAS', 	128, 		'More_Wonders_Buildings_128.dds',		8, 				1),
			('BUILDING_MORE_WONDERS_ATLAS', 	80, 		'More_Wonders_Buildings_80.dds',		8, 				1),
			('BUILDING_MORE_WONDERS_ATLAS', 	64, 		'More_Wonders_Buildings_64.dds',		8, 				1),
			('BUILDING_MORE_WONDERS_ATLAS', 	45, 		'More_Wonders_Buildings_45.dds',		8, 				1);	
--============================================--
-- 진급
--============================================--
INSERT INTO Language_ko_KR 
			(Tag,								Text) 
VALUES		('TXT_KEY_PROMOTION_FLETCHER',		'예르바 데 라 플레체'),
			('TXT_KEY_PROMOTION_FLETCHER_HELP',	'[COLOR:255:230:85:255]부상당한 유닛에게[ENDCOLOR] +50%[ICON_RANGE_STRENGTH] 공격 원거리 전투력.');

INSERT INTO UnitPromotions 
			(Type,						Description,						Help,									Sound,				CannotBeChosen, LostWithUpgrade,	PortraitIndex,	IconAtlas,						PediaType,			PediaEntry) 
VALUES		('PROMOTION_FLETCHER',		'TXT_KEY_PROMOTION_FLETCHER',		'TXT_KEY_PROMOTION_FLETCHER_HELP',		'AS2D_IF_LEVELUP',	1,				1,					20,				'PROMOTION_MORE_WONDERS_ATLAS',	'PEDIA_RANGED',		'TXT_KEY_PROMOTION_FLETCHER');

UPDATE UnitPromotions SET AttackWoundedMod = 50 WHERE Type = 'PROMOTION_FLETCHER';

/*INSERT INTO UnitPromotions_UnitCombats
			(PromotionType,				UnitCombatType)
VALUES		('PROMOTION_FLETCHER',		'UNITCOMBAT_ARCHER');*/
--============================================--
-- 건물
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

INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_FLETCHER',			'활 제작소'),
			('TXT_KEY_BUILDING_FLETCHER_PEDIA',		'작성 필요'),
			('TXT_KEY_BUILDING_FLETCHER_HELP',		'모든 궁수 유닛에게 [COLOR_POSITIVE_TEXT]예르바 데 라 플레체[ENDCOLOR] 진급 부여. 이 도시에서 궁수 유닛에 대한 [ICON_PRODUCTION] 생산력 +10%.[NEWLINE][NEWLINE]인접한 [ICON_RES_TROPICAL_FISH] 열대어: [ICON_PRODUCTION] 생산력 +2.'),
			('TXT_KEY_BUILDING_SEAFOOD',			'해산물 식당'),
			('TXT_KEY_BUILDING_SEAFOOD_PEDIA',		'작성 필요'),
			('TXT_KEY_BUILDING_SEAFOOD_HELP',		'도시의 [ICON_FOOD] 식량 5%가 매 턴 [ICON_TOURISM] 관광으로 전환됩니다. [ICON_GREAT_WORK] 위대한 음악 작품 슬롯 1개를 포함합니다.[NEWLINE][NEWLINE][ICON_CULTURE] 지루함으로 인한 [ICON_HAPPINESS_3] 불행 -1.[NEWLINE][NEWLINE]인접한 [ICON_RES_FISH] 물고기: [ICON_FOOD] 식량 +1.[NEWLINE]인접한 [ICON_RES_CRAB] 게: [ICON_FOOD] 식량 +1 및 [ICON_TOURISM] 관광 +1.[NEWLINE]인접한 [ICON_RES_TROPICAL_FISH] 열대어: [ICON_FOOD] 식량 +1 및 [ICON_TOURISM] 관광 +1.');

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
-- 호환성
--============================================--
-- 루이지애나
UPDATE Language_ko_KR SET Text = Text||'[NEWLINE]인접한 [ICON_RES_SHRIMP] 새우: [ICON_FOOD] 식량 +1 및 [ICON_TOURISM] 관광 +1.' WHERE Tag = 'TXT_KEY_BUILDING_SEAFOOD_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-CIV-LOI' AND Value= 1);

INSERT INTO Building_LocalResourceOrs
			(BuildingType,		ResourceType) 
SELECT		'BUILDING_SEAFOOD',	'RESOURCE_SHRIMP' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-CIV-LOI' AND Value= 1);

INSERT INTO Building_ResourceYieldChanges
			(BuildingType,		ResourceType,		YieldType,			Yield) 
SELECT		'BUILDING_SEAFOOD',	'RESOURCE_SHRIMP',	'YIELD_FOOD',		1 WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-CIV-LOI' AND Value= 1) UNION ALL
SELECT		'BUILDING_SEAFOOD',	'RESOURCE_SHRIMP',	'YIELD_TOURISM',	1 WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-CIV-LOI' AND Value= 1);