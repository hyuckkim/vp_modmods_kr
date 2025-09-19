
--=====================================================================================	
-- PROMOTION CHANGES
--=====================================================================================

------------------------------	
-- All Skirmisher line units get ranged defense
------------------------------
UPDATE UnitPromotions SET RangedDefenseMod = 20      WHERE Type = 'PROMOTION_SKIRMISHER_DOCTRINE';
UPDATE UnitPromotions SET ExtraWithdrawal = 100      WHERE Type = 'PROMOTION_SKIRMISHER_DOCTRINE';
UPDATE UnitPromotions SET AttackFortifiedMod = 20    WHERE Type = 'PROMOTION_SKIRMISHER_DOCTRINE';

--=====================================================================================	
-- SKIRMISHER LINE CHANGES
--=====================================================================================
DELETE FROM Unit_FreePromotions WHERE PromotionType = 'PROMOTION_ROUGH_TERRAIN_HALF_TURN';

INSERT INTO Unit_FreePromotions
		(UnitType,							PromotionType)
VALUES	('UNIT_CHARIOT_ARCHER', 			'PROMOTION_ROUGH_TERRAIN_HALF_TURN'),
		('UNIT_EGYPTIAN_WARCHARIOT', 		'PROMOTION_ROUGH_TERRAIN_HALF_TURN'),
		('UNIT_CELTS_SCYTHED_CHARIOT', 		'PROMOTION_ROUGH_TERRAIN_HALF_TURN'),
		('UNIT_ASSYRIA_IRON_CHARIOT', 		'PROMOTION_ROUGH_TERRAIN_HALF_TURN');

INSERT INTO Unit_FreePromotions
		(UnitType,							PromotionType)
VALUES	('UNIT_CHARIOT_ARCHER', 			'PROMOTION_SKIRMISHER_DOCTRINE'),
		('UNIT_EGYPTIAN_WARCHARIOT', 		'PROMOTION_SKIRMISHER_DOCTRINE'),
		('UNIT_CELTS_SCYTHED_CHARIOT', 		'PROMOTION_SKIRMISHER_DOCTRINE');

INSERT INTO Unit_FreePromotions
		(UnitType,							PromotionType)
VALUES	('UNIT_CHARIOT_ARCHER', 			'PROMOTION_SCOUT_XP_PILLAGE'),
		('UNIT_EGYPTIAN_WARCHARIOT', 		'PROMOTION_SCOUT_XP_PILLAGE'),
		('UNIT_CELTS_SCYTHED_CHARIOT', 		'PROMOTION_SCOUT_XP_PILLAGE'),
		('UNIT_MONGOLIAN_KESHIK', 			'PROMOTION_SCOUT_XP_PILLAGE'),
		('UNIT_HUN_HORSE_ARCHER', 			'PROMOTION_SCOUT_XP_PILLAGE'),
		('UNIT_MOUNTED_BOWMAN', 			'PROMOTION_SCOUT_XP_PILLAGE'),
		('UNIT_ARABIAN_CAMELARCHER', 		'PROMOTION_SCOUT_XP_PILLAGE'),
		('UNIT_POLAND_PANCERNY', 		    'PROMOTION_SCOUT_XP_PILLAGE'),
		('UNIT_CUIRASSIER', 				'PROMOTION_SCOUT_XP_PILLAGE'),
		('UNIT_AUSTRIAN_HUSSAR', 			'PROMOTION_SCOUT_XP_PILLAGE'),
		('UNIT_INDIAN_WARELEPHANT', 		'PROMOTION_SCOUT_XP_PILLAGE'),
		('UNIT_EE_DRAGOON', 				'PROMOTION_SCOUT_XP_PILLAGE'),
		('UNIT_CAVALRY', 					'PROMOTION_SCOUT_XP_PILLAGE'),
		('UNIT_BERBER_CAVALRY', 			'PROMOTION_SCOUT_XP_PILLAGE'),
		('UNIT_SHOSHONE_COMANCHE_RIDERS', 	'PROMOTION_SCOUT_XP_PILLAGE'),
		('UNIT_RUSSIAN_COSSACK', 			'PROMOTION_SCOUT_XP_PILLAGE'),
		('UNIT_ANTI_TANK_GUN', 				'PROMOTION_SCOUT_XP_PILLAGE'),
		('UNIT_HELICOPTER_GUNSHIP', 		'PROMOTION_SCOUT_XP_PILLAGE');


UPDATE Units SET Moves = 4 WHERE Type = 'UNIT_CHARIOT_ARCHER';
UPDATE Units SET Moves = 4 WHERE Type = 'UNIT_EGYPTIAN_WARCHARIOT';		
UPDATE Units SET Moves = 5 WHERE Type = 'UNIT_MONGOLIAN_KESHIK';
UPDATE Units SET Moves = 5 WHERE Type = 'UNIT_HUN_HORSE_ARCHER';
UPDATE Units SET Moves = 4 WHERE Type = 'UNIT_CELTS_SCYTHED_CHARIOT';
UPDATE Units SET Moves = 5 WHERE Type = 'UNIT_MOUNTED_BOWMAN';
UPDATE Units SET Moves = 5 WHERE Type = 'UNIT_ARABIAN_CAMELARCHER';
UPDATE Units SET Moves = 5 WHERE Type = 'UNIT_CUIRASSIER';
UPDATE Units SET Moves = 5 WHERE Type = 'UNIT_AUSTRIAN_HUSSAR';
UPDATE Units SET Moves = 3 WHERE Type = 'UNIT_INDIAN_WARELEPHANT';
UPDATE Units SET Moves = 5 WHERE Type = 'UNIT_EE_DRAGOON';
UPDATE Units SET Moves = 5 WHERE Type = 'UNIT_CAVALRY';
UPDATE Units SET Moves = 5 WHERE Type = 'UNIT_BERBER_CAVALRY';
UPDATE Units SET Moves = 5 WHERE Type = 'UNIT_SHOSHONE_COMANCHE_RIDERS';
UPDATE Units SET Moves = 5 WHERE Type = 'UNIT_RUSSIAN_COSSACK';
UPDATE Units SET Moves = 5 WHERE Type = 'UNIT_ANTI_TANK_GUN';
UPDATE Units SET Moves = 6 WHERE Type = 'UNIT_HELICOPTER_GUNSHIP';

UPDATE Units SET Combat = 8 WHERE Type = 'UNIT_CHARIOT_ARCHER';
UPDATE Units SET Combat = 9 WHERE Type = 'UNIT_EGYPTIAN_WARCHARIOT';
UPDATE Units SET Combat = 12 WHERE Type = 'UNIT_MONGOLIAN_KESHIK';
UPDATE Units SET Combat = 13 WHERE Type = 'UNIT_HUN_HORSE_ARCHER';
UPDATE Units SET Combat = 13 WHERE Type = 'UNIT_CELTS_SCYTHED_CHARIOT';
UPDATE Units SET Combat = 17 WHERE Type = 'UNIT_MOUNTED_BOWMAN';
UPDATE Units SET Combat = 19 WHERE Type = 'UNIT_ARABIAN_CAMELARCHER';
UPDATE Units SET Combat = 20 WHERE Type = 'UNIT_POLAND_PANCERNY';
UPDATE Units SET Combat = 27 WHERE Type = 'UNIT_CUIRASSIER';
UPDATE Units SET Combat = 30 WHERE Type = 'UNIT_INDIAN_WARELEPHANT';
UPDATE Units SET Combat = 28 WHERE Type = 'UNIT_AUSTRIAN_HUSSAR';
UPDATE Units SET Combat = 34 WHERE Type = 'UNIT_EE_DRAGOON';
UPDATE Units SET Combat = 40 WHERE Type = 'UNIT_CAVALRY';
UPDATE Units SET Combat = 42 WHERE Type = 'UNIT_BERBER_CAVALRY';
UPDATE Units SET Combat = 41 WHERE Type = 'UNIT_SHOSHONE_COMANCHE_RIDERS';
UPDATE Units SET Combat = 43 WHERE Type = 'UNIT_RUSSIAN_COSSACK';

UPDATE Units SET Combat = 58 WHERE Type = 'UNIT_ANTI_TANK_GUN';
UPDATE Units SET Combat = 58 WHERE Type = 'UNIT_ARABIA_HASHEMITE_RAIDER';
UPDATE Units SET Combat = 70 WHERE Type = 'UNIT_HELICOPTER_GUNSHIP';

UPDATE Units SET RangedCombat = 8 WHERE Type = 'UNIT_CHARIOT_ARCHER';
UPDATE Units SET RangedCombat = 9 WHERE Type = 'UNIT_EGYPTIAN_WARCHARIOT';
UPDATE Units SET RangedCombat = 12 WHERE Type = 'UNIT_MONGOLIAN_KESHIK';
UPDATE Units SET RangedCombat = 13 WHERE Type = 'UNIT_HUN_HORSE_ARCHER';
UPDATE Units SET RangedCombat = 13 WHERE Type = 'UNIT_CELTS_SCYTHED_CHARIOT';
UPDATE Units SET RangedCombat = 17 WHERE Type = 'UNIT_MOUNTED_BOWMAN';
UPDATE Units SET RangedCombat = 19 WHERE Type = 'UNIT_ARABIAN_CAMELARCHER';
UPDATE Units SET RangedCombat = 20 WHERE Type = 'UNIT_POLAND_PANCERNY';
UPDATE Units SET RangedCombat = 27 WHERE Type = 'UNIT_CUIRASSIER';
UPDATE Units SET RangedCombat = 30 WHERE Type = 'UNIT_INDIAN_WARELEPHANT';
UPDATE Units SET RangedCombat = 28 WHERE Type = 'UNIT_AUSTRIAN_HUSSAR';
UPDATE Units SET RangedCombat = 34 WHERE Type = 'UNIT_EE_DRAGOON';
UPDATE Units SET RangedCombat = 38 WHERE Type = 'UNIT_CAVALRY';
UPDATE Units SET RangedCombat = 40 WHERE Type = 'UNIT_BERBER_CAVALRY';
UPDATE Units SET RangedCombat = 42 WHERE Type = 'UNIT_SHOSHONE_COMANCHE_RIDERS';
UPDATE Units SET RangedCombat = 43 WHERE Type = 'UNIT_RUSSIAN_COSSACK';
UPDATE Units SET RangedCombat = 58 WHERE Type = 'UNIT_ANTI_TANK_GUN';
UPDATE Units SET RangedCombat = 58 WHERE Type = 'UNIT_ARABIA_HASHEMITE_RAIDER';
UPDATE Units SET RangedCombat = 70 WHERE Type = 'UNIT_HELICOPTER_GUNSHIP';

------------------------------	
-- Rough Terrain Penalty on Chariots
------------------------------
UPDATE UnitPromotions SET OpenFromMod = 0 WHERE Type = 'PROMOTION_ROUGH_TERRAIN_HALF_TURN';
UPDATE UnitPromotions SET RoughFromMod = 0 WHERE Type = 'PROMOTION_ROUGH_TERRAIN_HALF_TURN';

INSERT INTO UnitPromotions_Features
		(PromotionType, 						FeatureType, 		ExtraMove)
VALUES	('PROMOTION_ROUGH_TERRAIN_HALF_TURN', 	'FEATURE_FOREST', 	1),
		('PROMOTION_ROUGH_TERRAIN_HALF_TURN', 	'FEATURE_JUNGLE', 	1);

INSERT INTO UnitPromotions_Terrains
		(PromotionType, 						TerrainType, 	ExtraMove)
VALUES	('PROMOTION_ROUGH_TERRAIN_HALF_TURN', 	'TERRAIN_HILL', 1);


-- Anti-Tank Gun now Armored Car
UPDATE Units SET PrereqTech = 'TECH_BALLISTICS', UnitArtInfo = 'ART_DEF_UNIT_SMOKEY_LANDSHIP_LEVEL_1', UnitFlagIconOffset = '3', UnitFlagAtlas = 'EXPANSION_SCEN_UNIT_FLAG_ATLAS', PortraitIndex = '3', IconAtlas = 'EXPANSION_SCEN_UNIT_ATLAS'  WHERE Type = 'UNIT_ANTI_TANK_GUN';

INSERT INTO Unit_ResourceQuantityRequirements (UnitType, ResourceType, Cost) VALUES ('UNIT_ANTI_TANK_GUN', 'RESOURCE_ALUMINUM', '0');

INSERT INTO Unit_ResourceQuantityRequirements (UnitType, ResourceType, Cost) VALUES ('UNIT_ANTI_TANK_GUN', 'RESOURCE_COAL', '1');


--==========================================================================================================================	
-- Arabia Rework
--==========================================================================================================================

---------------------
--Camelarcher rework
---------------------

DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_ARABIAN_CAMELARCHER' AND PromotionType = 'PROMOTION_WITHDRAW_BEFORE_MELEE';

INSERT INTO		Unit_FreePromotions
				(UnitType,							PromotionType)
VALUES			('UNIT_ARABIAN_CAMELARCHER',	'PROMOTION_UNIT_ARABIA_GARLAND_MINE'),
				('UNIT_ARABIAN_CAMELARCHER',	'PROMOTION_UNIT_ARABIA_DESERT_RAIDER');
--==========================================================================================================================	
-- Shoshone Rework
--==========================================================================================================================

---------------------
--COMANCHE_RIDERS rework
---------------------

DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_SHOSHONE_COMANCHE_RIDERS' AND PromotionType = 'PROMOTION_WITHDRAW_BEFORE_MELEE';

INSERT INTO		Unit_FreePromotions
				(UnitType,							PromotionType)
VALUES			('UNIT_SHOSHONE_COMANCHE_RIDERS',	'PROMOTION_ENVELOPMENT');



---------------------------------------
-- Text
-----------------------------------------

---------------------------------------
-- US
-----------------------------------------
/*
--------------------
-- Arabia
--------------------
UPDATE Language_en_US
SET Text = 'Fast Medieval ranged Unit, weak to Pikemen. Only the Arabians may build it. Moves faster and is stronger in Desert. It is stronger than the Heavy Skirmisher which it replaces, Increases movement and combat power in the desert, and does not require [ICON_RES_HORSE] Horses. Starts with [COLOR_POSITIVE_TEXT]Splash Damage I.[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_UNIT_HELP_CAMEL_ARCHER';

UPDATE Language_en_US
SET Text = 'The Camel Archer is the Arabian unique unit, replacing the Heavy Skirmisher. The Camel Archer is a powerful ranged attack unit that starts with Splash Damage I, allowing it to do damage to groups of enemies 1 hex away. It Increases movement and combat power in the desert and does not require [ICON_RES_HORSE] Horses to be constructed. As a mounted unit, the Camel Archer is still vulnerable to Pikemen. Moves quickly through desert.'
WHERE Tag = 'TXT_KEY_UNIT_ARABIAN_CAMELARCHER_STRATEGY';
--------------------
-- Shoshone
--------------------
UPDATE Language_en_US
SET Text = 'The Comanche Riders is the unique unit of the Shoshone. It is faster than the Cavalry and Attack power is increased when flanking. May pillage tiles for free, and gains [ICON_RESEARCH] Science when pillaging tiles.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_SHOSHONE_COMANCHE_RIDERS';

UPDATE Language_en_US
SET Text = 'The Comanche Riders replaces the Cavalry, and only the Shoshone may build it. It can quickly flank the enemy and break the former camp. Moves quickly through desert, this unit can enter enemy territory to destroy infrastructure with ease and escape with only minor damage.'
WHERE Tag = 'TXT_KEY_UNIT_SHOSHONE_COMANCHE_RIDERS_STRATEGY';

------------------------------------------
-- Skirmisher Doctrine Rework
------------------------------------------
UPDATE Language_en_US
SET Text = 'Unit withdraws from the first Melee attack each turn if there are open tiles behind the unit. [NEWLINE]+20% [ICON_RANGE_STRENGTH] Ranged Combat Strength when attacking [COLOR_POSITIVE_TEXT]Fortified Units[ENDCOLOR].[NEWLINE]+20% [ICON_STRENGTH] Combat Strength when defending against all [COLOR_POSITIVE_TEXT]Ranged Attacks[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_PROMOTION_SKIRMISHER_DOCTRINE_HELP';
---------------------------------------------------
UPDATE Language_en_US
SET Text = 'Beam Axle'
WHERE Tag = 'TXT_KEY_PROMOTION_ROUGH_TERRAIN_HALF_TURN';

UPDATE Language_en_US
SET Text = 'Rough Terrain (Forest, Jungle, Hills) costs an additional movement point to cross.'
WHERE Tag = 'TXT_KEY_PROMOTION_ROUGH_TERRAIN_HALF_TURN_HELP';

UPDATE Language_en_US 
SET Text = 'Armored car' 
WHERE Tag = 'TXT_KEY_UNIT_AT_GUN';

UPDATE Language_en_US 
SET Text = 'Armored car are specialized combat units designed for hit-and-run tactics. Support sentinels, tanks, and artillery for a powerful modern era fighting force.' 
WHERE Tag = 'TXT_KEY_UNIT_AT_GUN_STRATEGY';

UPDATE Language_en_US 
SET Text = 'Armored car was initially designed for rapid movement and is now primarily used in a reconnaissance role or to support expeditionary forces unable to use their primary tanks. Early autocannon armored vehicles were generally armed and armed similarly to armored vehicles, but with tracks to provide better cross-country mobility. Autocannon armored vehicles using charcoal appeared in World Wars I and II, and later became the basis of mechanized infantry. A four-wheel suspension system was developed for off-road driving, and it was responsible for missions such as fast search and transport to enemy lines.' 
WHERE Tag = 'TXT_KEY_UNIT_AT_GUN_TEXT';

UPDATE Language_en_US 
SET Text = 'Armored car were initially designed for rapid movement and reconnaissance, and are now primarily used in a reconnaissance role or to support expeditionary forces unable to use their primary tanks. Early machine-packed armored vehicles were generally armed and armed similarly to armored vehicles, but as the technology of mechanical engineering developed, they became capable of four wheels, improving mobility. Machine-packed armored vehicles used hit-and-run tactics using charcoal in the war during the First and Second World Wars. This was later developed into a light tank. A key feature of previous tank destroyers, these light tanks were expected to be used to exploit breakthroughs made by slower, heavier tanks. Numerous small tank designs and "tank" were developed during this time, known by various names including "tank".' 
WHERE Tag = 'TXT_KEY_CIV5_INDUSTRIAL_ANTITANKGUN_TEXT';

UPDATE Language_en_US 
SET Text = 'A highly mobile ranged unit that specializes in hit-and-run tactics and skirmishes. It is an internal combustion engine car using [COLOR_YELLOW][ICON_RES_COAL]coal[ENDCOLOR] in the early days, and it is a unit that can move on rough roads by driving on four wheels.' 
WHERE Tag = 'TXT_KEY_UNIT_HELP_ANTI_TANK_GUN';

UPDATE Language_en_US 
SET Text = 'A unique Arabian unit that replaces the Armored Car. Can be used faster than engine packers and does not require [ICON_RES_COAL][COLOR_YELLOW] coal[ENDCOLOR]. You get faster and stronger in the desert. [ICON_ARROW_RIGHT] Does not consume movement power when plundering a tile, and deals additional damage to adjacent enemy units.' 
WHERE Tag = 'TXT_KEY_UNIT_ARABIA_HASHEMITE_RAIDER_HELP';


---------------------------------------
-- KR
-----------------------------------------
--------------------
-- Arabia
--------------------
UPDATE Language_ko_KR
SET Text = '경궁기병을 대체하는 아라비아의 고유 유닛입니다. 중세 시대의 빠른 원거리 유닛으로 장창병에 약합니다. 일반 경궁기병보다 사막에서 전투력과 이동력이 증가합니다. [ICON_RES_HORSE]말을 요구하지 않습니다. [COLOR_PLAYER_PURPLE]광역 피해 I[ENDCOLOR] 승급을 보유합니다.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_CAMEL_ARCHER';

UPDATE Language_ko_KR
SET Text = '낙타궁병은 아라비아의 고유 유닛으로 경궁기병을 대체합니다. 낙타궁병은 광역 피해 I 승급을 가지고 시작해 강력한 범위 공격을 가하여, 한 타일 안 범위의 여러 적을 동시에 공격할 수 있습니다. 또한 사막에서 전투력과 이동력이 증가하며, 말을 요구하지 않습니다. 하지만 기병이므로, 낙타궁병은 여전히 장창병에게 취약합니다.'
WHERE Tag = 'TXT_KEY_UNIT_ARABIAN_CAMELARCHER_STRATEGY';

--------------------
-- Shoshone
--------------------
UPDATE Language_ko_KR
SET Text = '기병대를 대체하는 쇼쇼니의 고유 유닛입니다. 기병대보다 빠르고, 측면 공격 시 공격력이 증가합니다. 약탈 시 과학을 획득합니다.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_SHOSHONE_COMANCHE_RIDERS';

UPDATE Language_ko_KR
SET Text = '코만치 기마병은 기병대를 대체하는 유닛입니다. 쇼쇼니만 생산할 수 있습니다. 적의 측면을 빠르게 공략하여 전의 진영을 무너뜨릴 수 있습니다. 신중하게 사용하면, 적 영토에 빠르게 진입해 기반 시설을 파괴하고 적은 피해만으로 후퇴할 수 있습니다.'
WHERE Tag = 'TXT_KEY_UNIT_SHOSHONE_COMANCHE_RIDERS_STRATEGY';

------------------------------------------
-- Skimisher Doctrine Rework
------------------------------------------
UPDATE Language_ko_KR
SET Text = '유닛 뒤에 공간이 있다면 매 턴 천 근접 공격을 피해 후퇴[NEWLINE]요쇄화한 유닛 공격 시 [ICON_RANGE_STRENGTH]원거리 전투력 [COLOR_POSITIVE_TEXT]+20%[ENDCOLOR][NEWLINE]원거리 유닛 방어 시 [ICON_STRENGTH]전투력 보너스 [COLOR_POSITIVE_TEXT]+20%[ENDCOLOR][NEWLINE][COLOR_NEGATIVE_TEXT]업그레이드 시 소멸[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_PROMOTION_SKIRMISHER_DOCTRINE_HELP';
-------------------------------------------------------

UPDATE Language_ko_KR
SET Text = '차륜현가장치'
WHERE Tag = 'TXT_KEY_PROMOTION_ROUGH_TERRAIN_HALF_TURN';

UPDATE Language_ko_KR
SET Text = '험지 (숲, 정글, 언덕) 에서 이동력 [COLOR_NEGATIVE_TEXT]두 배[ENDCOLOR] 소모'
WHERE Tag = 'TXT_KEY_PROMOTION_ROUGH_TERRAIN_HALF_TURN_HELP';

UPDATE Language_ko_KR 
SET Text = '기관포장갑차' 
WHERE Tag = 'TXT_KEY_UNIT_AT_GUN';

UPDATE Language_ko_KR 
SET Text = '기관포장갑차는 치고 빠지기 전술을 위해 고안된 특수 전투부대입니다. 강력한 현대 시대의 전투력을 위해 보병, 전차, 포병대를 지원하십시오.' 
WHERE Tag = 'TXT_KEY_UNIT_AT_GUN_STRATEGY';

UPDATE Language_ko_KR 
SET Text = '기관포장갑차는 처음에는 신속한 이동을 위해 설계되었으며, 현재는 주로 정찰 역할이나 주요 전차를 사용할 수 없는 원정군을 지원하기 위해 사용됩니다. 초기의 기관포 장갑차는 일반적으로 장갑차와 비슷하게 무장되고 무장되었지만, 더 나은 국가 간 이동성을 제공하기 위해 선로를 사용했습니다. 목탄을 이용한 기관포 장갑차는 제1,2차 세계대전에서 등장하였으며 추후에는 기계화 보병의 모태가 되었습니다. 험로 주행을 위해 4륜 현가 장치가 개발이 되었으며 빠른 적진에 대한 탐색과 수송 등의 임무를 책임지었습니다.' 
WHERE Tag = 'TXT_KEY_UNIT_AT_GUN_TEXT';

UPDATE Language_ko_KR 
SET Text = '기관포장갑차는 처음에는 신속한 이동과 정찰을 위해 설계되었으며, 현재는 주로 정찰 역할이나 주요 전차를 사용할 수 없는 원정군을 지원하기 위해 사용됩니다. 초기의 기관포장갑차는 일반적으로 장갑차와 비슷하게 무장되고 무장되었지만, 기계공학의 기술이 발전함에 따라 4륜 구륜이 가능해서 이동성이 개선이 되었습니다. 기관포장갑차는 제1, 2차 세계 대전 당시에 목탄을 이용하여 전쟁에 기관포장갑차를 이용하여 치고 빠지기 전술을 이용했습니다. 이는 추후에 경전차로 발전하게 되었습니다. 이전 구축전차의 주요 특징이었는데, 이 경전차는 더 느리고 무거운 전차에 의해 만들어진 적진의 돌파구를 이용하는 데 사용될 것으로 예상되었습니다. 이 기간 동안 수많은 소형 전차 디자인과 "전차"가 개발되었으며 "전차"를 포함한 다양한 이름으로 알려져 있습니다.' 
WHERE Tag = 'TXT_KEY_CIV5_INDUSTRIAL_ANTITANKGUN_TEXT';

UPDATE Language_ko_KR 
SET Text = '치고 빠지기 전술과 소규모 접전을 전문으로 하는 기동성이 뛰어난 원거리 유닛입니다. 초기의 [COLOR_YELLOW][ICON_RES_COAL]석탄[ENDCOLOR]을 이용한 내연기관 자동차이며, 사륜 주행으로 험로이동이 가능한 유닛입니다.' 
WHERE Tag = 'TXT_KEY_UNIT_HELP_ANTI_TANK_GUN';

UPDATE Language_ko_KR 
SET Text = '기관포장갑차를 대체하는 아라비아의 고유 유닛입니다. 기관포장갑차보다 빨리 쓸 수 있으며 [ICON_RES_COAL][COLOR_YELLOW] 석탄[ENDCOLOR]을 필요로 하지 않습니다. 사막에서 더 빠르고 강해집니다. 타일을 약탈할 때 [ICON_ARROW_RIGHT]이동력을 소비하지 않고, 인접한 적 유닛에게 추가 피해를 입힙니다.' 
WHERE Tag = 'TXT_KEY_UNIT_ARABIA_HASHEMITE_RAIDER_HELP';


  	