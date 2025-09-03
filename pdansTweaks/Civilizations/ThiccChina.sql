UPDATE Traits SET ExpansionWLTKD = '0' WHERE Type = 'TRAIT_ART_OF_WAR';
UPDATE Traits SET GreatWorkWLTKD = '0' WHERE Type = 'TRAIT_ART_OF_WAR';
UPDATE Traits SET PermanentYieldsDecreaseEveryEra = '0' WHERE Type = 'TRAIT_ART_OF_WAR';
UPDATE Traits SET FreeBuilding = 'BUILDING_CHINA_TRAIT_DUMMY' WHERE Type = 'TRAIT_ART_OF_WAR';
--UPDATE Traits SET WLTKDCultureBoost = '10' WHERE Type = 'TRAIT_ART_OF_WAR';
DELETE FROM Trait_PermanentYieldChangeWLTKD WHERE TraitType = 'TRAIT_ART_OF_WAR';

INSERT INTO BuildingClasses 	
			(Type,									DefaultBuilding,				NoLimit)
VALUES		('BUILDINGCLASS_CHINA_TRAIT_DUMMY',		'BUILDING_CHINA_TRAIT_DUMMY',	1),
			('BUILDINGCLASS_CHINA_GROWTH_DUMMY',	'BUILDING_CHINA_GROWTH_DUMMY',	1),
			('BUILDINGCLASS_CHINA_8_DUMMY',			'BUILDING_CHINA_8_DUMMY',		1);
			
INSERT INTO Buildings 	
			(Type,							BuildingClass,						Description,							CapitalOnly, 	GoldMaintenance,	Cost,	FaithCost,	GreatWorkCount, NeverCapture,	NukeImmune, ConquestProb,	HurryCostModifier,	IconAtlas,			PortraitIndex, IsDummy)
VALUES		('BUILDING_CHINA_TRAIT_DUMMY',	'BUILDINGCLASS_CHINA_TRAIT_DUMMY',	'TXT_KEY_BUILDING_CHINA_TRAIT_DUMMY',	0, 				0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0, 1),
			('BUILDING_CHINA_GROWTH_DUMMY',	'BUILDINGCLASS_CHINA_GROWTH_DUMMY',	'TXT_KEY_BUILDING_CHINA_GROWTH_DUMMY',	0, 				0,					-1,		-1,			-1,				0,				1,			100,			-1,					'CIV_COLOR_ATLAS',	0, 1),
			('BUILDING_CHINA_8_DUMMY',		'BUILDINGCLASS_CHINA_8_DUMMY',		'TXT_KEY_BUILDING_CHINA_8_DUMMY',		1, 				0,					-1,		-1,			-1,				1,				1,			0,				-1,					'CIV_COLOR_ATLAS',	0, 1);

INSERT INTO Building_BuildingClassYieldChanges
			(BuildingType,				BuildingClassType,					YieldType,			YieldChange)
VALUES		('BUILDING_CHINA_8_DUMMY',	'BUILDINGCLASS_CHINA_TRAIT_DUMMY',	'YIELD_FOOD',		2);

UPDATE Language_en_US
SET Text = 'Every 8th [ICON_CITIZEN] Citizen born on Empire grants a "We Love the Empress Day" and +2 [ICON_FOOD] Food in all Cities. Bonus [ICON_FOOD] Food declines by 50% every Era.'
WHERE Tag = 'TXT_KEY_TRAIT_ART_OF_WAR';

INSERT INTO Language_en_US (Tag, Text)
VALUES
	('TXT_KEY_BUILDING_CHINA_TRAIT_DUMMY',		'China Dummy 1'),
	('TXT_KEY_BUILDING_CHINA_GROWTH_DUMMY',		'China Dummy 2'),
	('TXT_KEY_BUILDING_CHINA_8_DUMMY',			'China Dummy 3');
	
--Chu-Ko-Nu gets logistics back
UPDATE Units SET RangedCombat = '19' WHERE Type = 'UNIT_CHINESE_CHUKONU';
UPDATE Units SET Combat = '15' WHERE Type = 'UNIT_CHINESE_CHUKONU';

DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_CHINESE_CHUKONU' AND PromotionType = 'PROMOTION_REPEATER';

INSERT INTO Unit_FreePromotions
		(UnitType, 				 PromotionType)
VALUES	('UNIT_CHINESE_CHUKONU', 'PROMOTION_LOGISTICS');

UPDATE Language_en_US
SET Text = 'The Chu-Ko-Nu is the Chinese unique unit, replacing the Crossbowman. The Chu-Ko-Nu can attack twice, giving it a hefty punch on offense and defense.'
WHERE Tag = 'TXT_KEY_UNIT_CHINESE_CHUKONU_STRATEGY';

UPDATE Language_en_US
SET Text = 'Medieval ranged infantry Unit. Only the Chinese may build it. Gains [COLOR_POSITIVE_TEXT]Logistics[ENDCOLOR] promotion for free.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_CHUKONU';

--remove XP from 2nd attack
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'BALANCE_CORE_XP_ON_FIRST_ATTACK';
