
--==========================================================================================================================	
-- UNITS
--==========================================================================================================================	
--------------------------------
-- UnitClasses
--------------------------------
INSERT INTO UnitClasses
		(Type, 							Description, 					DefaultUnit)
VALUES	('UNITCLASS_ZEPPELIN', 			'TXT_KEY_UNIT_ZEPPELIN_CBP', 	'UNIT_ZEPPELIN'),
		('UNITCLASS_WWI_ZEPPELIN', 		'TXT_KEY_UNIT_WWI_ZEPPELIN', 	'UNIT_WWI_ZEPPELIN'),
		('UNITCLASS_PREDATOR_DRONE', 	'TXT_KEY_UNIT_PREDATOR_DRONE', 	'UNIT_PREDATOR_DRONE');

--------------------------------	
-- Units
--------------------------------	
INSERT INTO Units
		(Class, 						Type, 					Combat, Cost, 	FaithCost, 	RequiresFaithPurchaseEnabled, 	Moves, 	BaseSightRange, BaseLandAirDefense, 	PrereqTech, 		ObsoleteTech, 	                   CombatClass, 			Domain, 	NoBadGoodies, 	DefaultUnitAI, 		Description, 					Civilopedia, 							Strategy, 									Help, 								Pillage, 	MilitarySupport, 	MilitaryProduction, Mechanized, AdvancedStartCost, 	XPValueAttack, 	XPValueDefense, UnitArtInfo, 									UnitFlagAtlas, 						UnitFlagIconOffset, PortraitIndex, 	IconAtlas, 						MoveRate, 	PurchaseCooldown)
VALUES	('UNITCLASS_ZEPPELIN', 			'UNIT_ZEPPELIN', 		32, 	700, 	600, 		1, 								3, 		4, 				2, 						'TECH_STEAM_POWER', 'TECH_PLASTIC', 	            'UNITCOMBAT_RECON', 	'DOMAIN_LAND', 	1, 				'UNITAI_EXPLORE', 	'TXT_KEY_UNIT_ZEPPELIN_CBP', 	'TXT_KEY_CIV5_ZEPPELIN_TEXT_CBP', 		'TXT_KEY_UNIT_ZEPPELIN_STRATEGY_CBP', 		'TXT_KEY_UNIT_HELP_ZEPPELIN_CBP', 	1, 			1, 					1, 					1, 			30, 				3, 				3, 				'ART_DEF_UNIT_SMOKEY_STEAM_AIRSHIP_LEVEL_1', 	'EXPANSION_SCEN_UNIT_FLAG_ATLAS', 	7, 					7, 				'EXPANSION_SCEN_UNIT_ATLAS', 	'WHEELED', 	1),
		('UNITCLASS_WWI_ZEPPELIN', 		'UNIT_WWI_ZEPPELIN', 	42, 	1000, 	900, 		1, 								3, 		4, 				3, 						'TECH_PLASTIC',     'TECH_SATELLITES',              'UNITCOMBAT_RECON', 	'DOMAIN_LAND', 	1, 				'UNITAI_EXPLORE', 	'TXT_KEY_UNIT_WWI_ZEPPELIN', 	'TXT_KEY_UNIT_WWI_ZEPPELIN_TEXT', 		'TXT_KEY_UNIT_WWI_ZEPPELIN_STRATEGY', 		'TXT_KEY_UNIT_WWI_ZEPPELIN_HELP', 	1, 			1, 					1, 					1, 			30, 				3, 				3, 				'ART_DEF_UNIT_WWI_ZEPPELIN', 					'UNIT_ZEPPELIN_FLAG_ATLAS', 		0, 					62, 				'UNIT_CAYM_ATLAS', 			'WHEELED', 	1),
        ('UNITCLASS_PREDATOR_DRONE', 	'UNIT_PREDATOR_DRONE', 	65, 	1800, 	1400, 		1, 								4, 		4, 				25, 					'TECH_SATELLITES',  'TECH_SUPERCOMPUTERS', 			'UNITCOMBAT_RECON', 	'DOMAIN_LAND',  1, 				'UNITAI_EXPLORE', 	'TXT_KEY_UNIT_PREDATOR_DRONE', 	'TXT_KEY_UNIT_PREDATOR_DRONE_TEXT', 	'TXT_KEY_UNIT_PREDATOR_DRONE_STRATEGY', 	'TXT_KEY_UNIT_PREDATOR_DRONE_HELP', 1, 			1, 					1, 					1, 			30, 				3, 				3, 				'ART_DEF_UNIT_PREDATOR_DRONE', 					'UNIT_UAV_FLAG_ATLAS', 				0, 					63, 				'UNIT_CAYM_ATLAS', 			'WHEELED', 	1);

-- 전투군 새로 정의 (한 번만 실행)
INSERT OR IGNORE INTO UnitCombatInfos (Type, Description)
VALUES ('UNITCOMBAT_HOVER', 'TXT_KEY_UNITCOMBAT_HOVER');

-- 해당 전투군에 묶을 유닛들 추가
UPDATE Units
SET CombatClass = 'UNITCOMBAT_HOVER'
WHERE Type IN ('UNIT_PREDATOR_DRONE','UNIT_ZEPPELIN',
               'UNIT_WWI_ZEPPELIN','UNIT_FW_MODREN_DRONE','UNIT_FW_HYBRID_DRONE', 'UNIT_FW_BIODRONE'); -- ← 여기에 더 추가

INSERT OR IGNORE INTO UnitPromotions_UnitCombats
    (PromotionType, UnitCombatType)
SELECT PromotionType, 'UNITCOMBAT_HOVER'
FROM UnitPromotions_UnitCombats
WHERE UnitCombatType = 'UNITCOMBAT_RECON';
--------------------------------

--------------------------------	
-- Unit_Flavors
--------------------------------	
INSERT INTO		Unit_Flavors
		(UnitType, 				FlavorType,				Flavor)
VALUES	('UNIT_ZEPPELIN',		'FLAVOR_NAVAL_RECON',	10),
		('UNIT_ZEPPELIN',		'FLAVOR_OFFENSE',		5),
		('UNIT_ZEPPELIN',		'FLAVOR_RECON',			10),
		('UNIT_WWI_ZEPPELIN',	'FLAVOR_NAVAL_RECON',	10),
		('UNIT_WWI_ZEPPELIN',	'FLAVOR_OFFENSE',		5),
		('UNIT_WWI_ZEPPELIN',	'FLAVOR_RECON',			10),
		('UNIT_PREDATOR_DRONE',	'FLAVOR_NAVAL_RECON',	10),
		('UNIT_PREDATOR_DRONE',	'FLAVOR_OFFENSE',		5),
		('UNIT_PREDATOR_DRONE',	'FLAVOR_RECON',			10);
--------------------------------	
-- Unit_BuildingClassPurchaseRequireds
--------------------------------	
INSERT INTO	Unit_BuildingClassPurchaseRequireds
			(UnitType, 				BuildingClassType)
VALUES		('UNIT_ZEPPELIN',		'BUILDINGCLASS_ARMORY'),
			('UNIT_WWI_ZEPPELIN',	'BUILDINGCLASS_ARMORY'),
			('UNIT_PREDATOR_DRONE',	'BUILDINGCLASS_MILITARY_BASE');
--------------------------------	
-- UnitGameplay2DScripts
--------------------------------		
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT		'UNIT_WWI_ZEPPELIN',	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_ZEPPELIN';

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 				SelectionSound, 		FirstSelectionSound)
VALUES		('UNIT_PREDATOR_DRONE',	'AS2D_SELECT_FIGHTER', 	'AS2D_BIRTH_FIGHTER');
--------------------------------	
-- Unit_AITypes
--------------------------------		
INSERT INTO Unit_AITypes 	
			(UnitType, 				UnitAIType)
VALUES		('UNIT_ZEPPELIN',		'UNITAI_EXPLORE_SEA'),
			('UNIT_ZEPPELIN',		'UNITAI_EXPLORE'),
			('UNIT_WWI_ZEPPELIN',	'UNITAI_EXPLORE_SEA'),
			('UNIT_WWI_ZEPPELIN',	'UNITAI_EXPLORE'),
			('UNIT_PREDATOR_DRONE',	'UNITAI_EXPLORE_SEA'),
			('UNIT_PREDATOR_DRONE',	'UNITAI_EXPLORE');
--------------------------------	
-- Unit_ClassUpgrades
--------------------------------
INSERT INTO Unit_ClassUpgrades 
		(UnitType, UnitClassType) 
VALUES	('UNIT_ZEPPELIN', 		'UNITCLASS_WWI_ZEPPELIN'),
		('UNIT_WWI_ZEPPELIN', 	'UNITCLASS_PREDATOR_DRONE');

--------------------------------	
-- Unit_FreePromotions
--------------------------------	
INSERT INTO		Unit_FreePromotions
		(UnitType,				PromotionType)
VALUES	
		('UNIT_ZEPPELIN', 		'PROMOTION_IGNORE_TERRAIN_COST'),
		('UNIT_ZEPPELIN', 		'PROMOTION_RECON_SHORT_RANGE'),
		('UNIT_ZEPPELIN', 		'PROMOTION_RECON_DRONE'),
		('UNIT_ZEPPELIN', 		'PROMOTION_SCOUT_XP_SPOTTING'),
		('UNIT_ZEPPELIN', 		'PROMOTION_RECON_EXPERIENCE'),
		('UNIT_ZEPPELIN', 		'PROMOTION_ANTI_TANK'),
		('UNIT_ZEPPELIN',       'PROMOTION_WOODLAND_TRAILBLAZER_3'),

		('UNIT_WWI_ZEPPELIN', 	'PROMOTION_IGNORE_TERRAIN_COST'),
		('UNIT_WWI_ZEPPELIN', 	'PROMOTION_RECON_SHORT_RANGE'),
		('UNIT_WWI_ZEPPELIN', 	'PROMOTION_RECON_DRONE'),
		('UNIT_WWI_ZEPPELIN', 	'PROMOTION_SCOUT_XP_SPOTTING'),
		('UNIT_WWI_ZEPPELIN', 	'PROMOTION_SEE_INVISIBLE_SUBMARINE'),
		('UNIT_WWI_ZEPPELIN', 	'PROMOTION_RECON_EXPERIENCE'),
		('UNIT_WWI_ZEPPELIN', 	'PROMOTION_ANTI_TANK'),
		('UNIT_WWI_ZEPPELIN',   'PROMOTION_WOODLAND_TRAILBLAZER_3'),

		('UNIT_PREDATOR_DRONE', 'PROMOTION_IGNORE_TERRAIN_COST'),
		('UNIT_PREDATOR_DRONE', 'PROMOTION_RECON_DRONE'),
		('UNIT_PREDATOR_DRONE', 'PROMOTION_SCOUT_XP_SPOTTING'),
		('UNIT_PREDATOR_DRONE', 'PROMOTION_SEE_INVISIBLE_SUBMARINE'),
		('UNIT_PREDATOR_DRONE', 'PROMOTION_ANTI_SUBMARINE_I'),
		('UNIT_PREDATOR_DRONE', 'PROMOTION_ANTI_TANK'),
		('UNIT_PREDATOR_DRONE', 'PROMOTION_WOODLAND_TRAILBLAZER_3');

--------------------------------	
-- Civilization_UnitClassOverrides
--------------------------------
INSERT INTO Civilization_UnitClassOverrides
	(CivilizationType, UnitClassType, UnitType)
VALUES
	('CIVILIZATION_MINOR', 'UNITCLASS_ZEPPELIN', 		NULL),
	('CIVILIZATION_MINOR', 'UNITCLASS_WWI_ZEPPELIN', 	NULL),
	('CIVILIZATION_MINOR', 'UNITCLASS_PREDATOR_DRONE', 	NULL);

----------------
-- FLAVOR 
----------------

INSERT INTO Technology_Flavors (TechType, FlavorType, Flavor)
VALUES
	('TECH_STEAM_POWER', 'FLAVOR_RECON', 10),
	('TECH_PLASTIC',     'FLAVOR_RECON', 10),
	('TECH_SATELLITES',  'FLAVOR_RECON', 10);

----------------
-- PROMOTION CHANGE
----------------

INSERT INTO UnitPromotions_UnitClasses
	(PromotionType, UnitClassType, Modifier)
VALUES
	('PROMOTION_ANTI_HELICOPTER', 'UNITCLASS_ZEPPELIN', 150),
	('PROMOTION_ANTI_HELICOPTER', 'UNITCLASS_WWI_ZEPPELIN', 150),
	('PROMOTION_ANTI_HELICOPTER', 'UNITCLASS_PREDATOR_DRONE', 150);
--------------------------------------
-- Text
-------------------------------
--------------------------------
-- TEXT (US)
--------------------------------
-- NEW COMBAT TYPE

INSERT OR REPLACE INTO LocalizedText
	(Language, Tag, Text)
VALUES
	('en_US', 'TXT_KEY_UNITCOMBAT_HOVER', 'Airship Unit');

UPDATE Language_en_US
SET Text = 'Bonus vs Helicopters and Air Recon units(150)'
WHERE Tag = 'TXT_KEY_PROMOTION_ANTI_HELICOPTER';

UPDATE Language_en_US
SET Text = '+150% [ICON_STRENGTH] Combat Strength VS [COLOR_POSITIVE_TEXT]Helicopter Gunship Units and Airship Units[ENDCOLOR].'
WHERE Tag ='TXT_KEY_PROMOTION_ANTI_HELICOPTER_HELP';
-----------------------
-- TEXT (KR)
-----------------------
-- NEW COMBAT TYPE
INSERT OR REPLACE INTO LocalizedText
	(Language, Tag, Text)
VALUES
	('en_US', 'TXT_KEY_UNITCOMBAT_HOVER', '비행선 유닛');

UPDATE Language_ko_KR
SET Text = '헬리콥터, 비행선유닛 대항 보너스 (150)'
WHERE Tag = 'TXT_KEY_PROMOTION_ANTI_HELICOPTER';

UPDATE Language_ko_KR
SET Text = '헬리콥터 유닛과 비행선유닛 대항 시 [ICON_STRENGTH] 전투력 보너스 [COLOR_POSITIVE_TEXT]+150%[ENDCOLOR]'
WHERE Tag ='TXT_KEY_PROMOTION_ANTI_HELICOPTER_HELP';

INSERT INTO Language_en_US (Tag, Text)
VALUES
	('TXT_KEY_UNIT_ZEPPELIN_CBP',				'Dirigible'),
	('TXT_KEY_CIV5_ZEPPELIN_TEXT_CBP',			'The oldest means of powered flight were lighter than air craft called dirigibles, or navigable balloons. These craft were used to observe and communicate over active battlefields, first seeing military action in the US Civil War.'),
	('TXT_KEY_UNIT_ZEPPELIN_STRATEGY_CBP',		'Dirigibles are a tough Industrial-era Airship unit that doubles as a potent city attacker. Use Dirigbles to monitor your borders, detect enemy submarines, or to strike undefended enemy cities.'),
	('TXT_KEY_UNIT_HELP_ZEPPELIN_CBP',			'industrial-age Airship unit. Used to deter armored forces and monitor borders. Can go through sea tiles.'),
	('TXT_KEY_UNIT_WWI_ZEPPELIN',				'Zeppelin Airship'), 
	('TXT_KEY_UNIT_WWI_ZEPPELIN_TEXT',			'A Zeppelin was a type of rigid airship named after the German Count Ferdinand von Zeppelin who pioneered rigid airship development at the beginning of the 20th century. Zeppelin''s ideas were first formulated in 1874 and developed in detail in 1893. They were patented in Germany in 1895 and in the United States in 1899. After the outstanding success of the Zeppelin design, the word zeppelin came to be commonly used to refer to all rigid airships. Zeppelins were first flown commercially in 1910 by Deutsche Luftschiffahrts-AG (DELAG), the world''s first airline in revenue service. By mid-1914, DELAG had carried over 10,000 fare-paying passengers on over 1,500 flights. During World War I the German military made extensive use of Zeppelins as bombers and scouts, killing over 500 people in bombing raids in Britain.'), 
	('TXT_KEY_UNIT_WWI_ZEPPELIN_STRATEGY',		'Zeppelins are a tough modern-era reconnaissance unit that doubles as a potent city attacker. Use Zeppelins to monitor your borders, detect enemy submarines, or to strike undefended enemy cities.'), 
	('TXT_KEY_UNIT_WWI_ZEPPELIN_HELP',			'A Airship unit of the modern-nuclear age. They are used to deter armored forces, detect submarines or monitor borders. Can go through sea tiles.'), 
	('TXT_KEY_UNIT_PREDATOR_DRONE',				'CAS fighter'), 
	('TXT_KEY_UNIT_PREDATOR_DRONE_TEXT',		'A patrol aircraft is an aircraft that performs surveillance and reconnaissance missions while flying in maritime airspace. The patrol aircraft is equipped with infrared detection devices, sound detectors, magnetic detectors, and communication capabilities with artificial satellites. Since it has to perform reconnaissance missions for a long time on the sea, it must be able to fly for a long time, and it must have good low-altitude flight performance because low-altitude operations are mainly performed. Recently, the main mission is to detect and attack enemy submarines with submarine detection equipment. Anti-submarine/maritime patrol aircraft are specialized in maritime operations such as anti-submarine warfare, anti-ship warfare, and mine warfare at sea. On the other hand, patrol aircraft are divided into land-based types that take off and land from ground airfields, and ship-based types that can be operated from aircraft carriers. There are P-1, P-2, P-3, P-8, etc. in the form of ground-type patrol aircraft that take off from ground airfields, and these types are generally as large as passenger aircraft. There are S-2 and S-3 types of carrier-based aircraft that can be operated from aircraft carriers, and the size of these types is small.'), 
	('TXT_KEY_UNIT_PREDATOR_DRONE_STRATEGY',	'Patrol aircraft are reconnaissance units capable of detecting submarines in the information age. Use patrol planes to observe borders and spot enemy submarines'), 
	('TXT_KEY_UNIT_PREDATOR_DRONE_HELP',		'An Information Age recon unit capable of monitoring borders or submarines. Can go through sea tiles.');

INSERT INTO Language_ko_KR (Tag, Text)
VALUES
	('TXT_KEY_UNIT_ZEPPELIN_CBP',				'열기구'),
	('TXT_KEY_CIV5_ZEPPELIN_TEXT_CBP',			'가장 오래된 동력 비행 수단은 비행선(dirigibles) 또는 항해 가능한 풍선(navigable balloons)이라고 하는 항공기보다 가볍습니다. 이 우주선은 활발한 전장을 관찰하고 통신하는 데 사용되었으며 미국 남북 전쟁에서 처음으로 군사 행동을 목격했습니다.'),
	('TXT_KEY_UNIT_ZEPPELIN_STRATEGY_CBP',		'비행선은 산업 시대 정찰 유닛입니다. 비행선을 사용하여 국경을 관찰하고 적의 잠수함을 탐지하십시오.'),
	('TXT_KEY_UNIT_HELP_ZEPPELIN_CBP',			'산업 시대 원거리 정찰 유닛으로 국경을 감시할 수 있습니다. 대양 위를 다닐 수 있습니다'),
	('TXT_KEY_UNIT_WWI_ZEPPELIN',				'체펠린 비행선'), 
	('TXT_KEY_UNIT_WWI_ZEPPELIN_TEXT',			'체펠린은 20세기 초 경식 비행선 개발을 개척한 독일의 페르디난트 폰 체펠린 백작의 이름을 딴 경식 비행선의 일종입니다. Zeppelin의 아이디어는 1874년에 처음 공식화되었고 1893년에 세부적으로 개발되었습니다. 그들은 1895년에 독일에서, 1899년에 미국에서 특허를 받았습니다. Zeppelin 디자인의 뛰어난 성공 이후 zeppelin이라는 단어는 일반적으로 모든 단단한 비행선을 참조하십시오. Zeppelins는 1910년 세계 최초의 수익 서비스 항공사인 Deutsche Luftschiffahrts-AG(DELAG)에 의해 처음으로 상업적으로 비행되었습니다. 1914년 중반까지 DELAG는 1,500편이 넘는 항공편에서 10,000명 이상의 유료 승객을 태웠습니다. 제1차 세계 대전 동안 독일군은 제플린을 폭격기와 정찰병으로 광범위하게 사용하여 영국에서 폭격으로 500명 이상을 죽였습니다.'), 
	('TXT_KEY_UNIT_WWI_ZEPPELIN_STRATEGY',		'체펠린 비행선은 강력한 현대 시대 비행선 유닛입니다. 체펠린 비행선을 사용하여 국경을 관찰하고 적의 잠수함을 탐지하십시오.'), 
	('TXT_KEY_UNIT_WWI_ZEPPELIN_HELP',			'현대 시대 정찰 유닛으로 국경 또는 잠수함을 감시할 수 있습니다. 대양 위를 다닐 수 있습니다'), 
	('TXT_KEY_UNIT_PREDATOR_DRONE',				'초계기'), 
	('TXT_KEY_UNIT_PREDATOR_DRONE_TEXT',		'초계기는 해상공역을 비행하면서 경계 및 정찰 임무를 수행하는 항공기로, 장기간 해상에 떠서 적 함대의 동정을 감시하는 것을 주임무로 하고 있다. 초계기는 적외선 탐지장치, 음향 탐지기, 자기 탐지기 등은 물론 인공위성과의 통신능력 등을 갖추고 있다. 바다 위에서 오랫동안 정찰 임무 등을 수행해야 하므로 장시간 비행이 가능해야 하고, 주로 저공 작전이 이뤄지므로 저공비행 성능이 좋아야 한다. 근래에는 잠수함 탐지장비를 갖춰 적의 잠수함을 발견, 공격하는 것을 주임무로 하고 있는데 이를 "대잠 초계기"라고도 하며, 해상에서 주로 활동하므로 ‘해상 초계기’라고도 한다. 대잠/해상초계기는 해상에서의 대잠전, 대함전, 기뢰전 등 해상작전에 특화돼 있다.한편, 초계기는 지상 비행장에서 이착륙하는 지상형과 항공모함 등에서 운용이 가능한 함재기형으로 구분된다. 지상 비행장에서 이륙하는 형태의 지상형 초계기에는 P-1, P-2, P-3, P-8 등이 있고 이들 기종은 대체적으로 여객기 수준으로 크다. 항공모함 등에서 운용 가능한 함재기형 항공기에는 S-2, S-3 등이 있으며, 이들 기종의 크기는 작은 편이다.'), 
	('TXT_KEY_UNIT_PREDATOR_DRONE_STRATEGY',	'초계기는 정보화 시대의 잠수함을 탐지할 수 있는 정찰 유닛입니다. 초계기를 사용하여 국경을 관찰하고 적의 잠수함을 탐지하십시오.'), 
	('TXT_KEY_UNIT_PREDATOR_DRONE_HELP',		'정보화시대 정찰 유닛으로 국경 또는 잠수함을 감시할 수 있습니다. 대양 위를 다닐 수 있습니다.'); 

---------------------
-- TEXT (US)
---------------------
UPDATE Language_en_US
SET Text = 'Melee Withdraw'
WHERE Tag ='TXT_KEY_PROMOTION_WITHDRAW_BEFORE_MELEE_I';

UPDATE Language_en_US
SET Text = 'Unit withdraws from the first Melee attack each turn if there are open tiles behind the unit.'
WHERE Tag ='TXT_KEY_PROMOTION_WITHDRAW_BEFORE_MELEE_HELP_I';

UPDATE Language_en_US
SET Text = 'Industrial Era Recon unit, gains bonus attack power when attacking and Withdrwas from the first Melee attack each turn. A Sapper who helps capture the city.' 
WHERE Tag = 'TXT_KEY_UNIT_HELP_COMMANDO_CBP';

UPDATE Language_en_US
SET Text = 'A modern-era Recon unit, gains bonus attack power when attacking and Withdrwas from the first Melee attack each turn. A Sapper who helps capture the city. [COLOR_PLAYER_PURPLE] There is an air drop [ENDCOLOR] upgrade.' 
WHERE Tag = 'TXT_KEY_UNIT_HELP_PARATROOPER';

UPDATE Language_en_US
SET Text = 'An Atomic Era Recon unit, gains bonus attack power when attacking and Withdrwas from the first Melee attack each turn. A Sapper who helps capture the city. [COLOR_PLAYER_PURPLE] Drop Troops[ENDCOLOR] There is a promotion.' 
WHERE Tag = 'TXT_KEY_UNIT_HELP_MARINE'; 

---------------------
-- TEXT (KR)
---------------------
UPDATE Language_ko_KR
SET Text = '위급회피'
WHERE Tag ='TXT_KEY_PROMOTION_WITHDRAW_BEFORE_MELEE_I';

UPDATE Language_ko_KR
SET Text = '산업 시대 정찰 유닛으로, 공격 시 추가 전투력을 얻고 근접 유닛 대항 시 후퇴 할 수 있습니다. 도시의 공략을 도우는 공병입니다.' 
WHERE Tag = 'TXT_KEY_UNIT_HELP_COMMANDO_CBP';

UPDATE Language_ko_KR
SET Text = '현대 시대 정찰 유닛으로, 공격 시 추가 전투력을 얻고 근접 유닛 대항 시 후퇴 할 수 있습니다. 도시의 공략을 도우는 공병입니다. [COLOR_PLAYER_PURPLE]공중투하[ENDCOLOR]승급이 있습니다.' 
WHERE Tag = 'TXT_KEY_UNIT_HELP_PARATROOPER';

UPDATE Language_ko_KR
SET Text = '원자력 시대 정찰 유닛으로, 공격 시 추가 전투력을 얻고 근접 유닛 대항 시 후퇴 할 수 있습니다. 도시의 공략을 도우는 공병입니다. [COLOR_PLAYER_PURPLE]공중투하[ENDCOLOR] 승급이 있습니다.' 
WHERE Tag = 'TXT_KEY_UNIT_HELP_MARINE'; 

------------------------------	
/*
--=====================================================================================	
-- Recon UNIT REWORK  (AIRSHIP RECON + LAND RECON)
--=====================================================================================
INSERT INTO Unit_FreePromotions
		(UnitType,							PromotionType)
VALUES	









*/

/*
----------------------------------------
--  Need Resources
---------------------------------------
-- MARINE에 OIL 1 요구 (존재 확인 + 중복 방지)
INSERT INTO Unit_ResourceQuantityRequirements (UnitType, ResourceType, Cost)
SELECT 'UNIT_MARINE', 'RESOURCE_OIL', 1
WHERE EXISTS (SELECT 1 FROM Units WHERE Type = 'UNIT_MARINE')
  AND NOT EXISTS (
      SELECT 1 FROM Unit_ResourceQuantityRequirements
      WHERE UnitType = 'UNIT_MARINE' AND ResourceType = 'RESOURCE_OIL'
  );

-- PARATROOPER
INSERT INTO Unit_ResourceQuantityRequirements (UnitType, ResourceType, Cost)
SELECT 'UNIT_PARATROOPER', 'RESOURCE_OIL', 1
WHERE EXISTS (SELECT 1 FROM Units WHERE Type = 'UNIT_PARATROOPER')
  AND NOT EXISTS (
      SELECT 1 FROM Unit_ResourceQuantityRequirements
      WHERE UnitType = 'UNIT_PARATROOPER' AND ResourceType = 'RESOURCE_OIL'
  );

-- XCOM SQUAD
INSERT INTO Unit_ResourceQuantityRequirements (UnitType, ResourceType, Cost)
SELECT 'UNIT_XCOM_SQUAD', 'RESOURCE_OIL', 1
WHERE EXISTS (SELECT 1 FROM Units WHERE Type = 'UNIT_XCOM_SQUAD')
  AND NOT EXISTS (
      SELECT 1 FROM Unit_ResourceQuantityRequirements
      WHERE UnitType = 'UNIT_XCOM_SQUAD' AND ResourceType = 'RESOURCE_OIL'
  );

-- COMMANDO (유닛이 실제로 있는 모드인지 확인 필요)
INSERT INTO Unit_ResourceQuantityRequirements (UnitType, ResourceType, Cost)
SELECT 'UNIT_COMMANDO', 'RESOURCE_COAL', 1
WHERE EXISTS (SELECT 1 FROM Units WHERE Type = 'UNIT_COMMANDO')
  AND NOT EXISTS (
      SELECT 1 FROM Unit_ResourceQuantityRequirements
      WHERE UnitType = 'UNIT_COMMANDO' AND ResourceType = 'RESOURCE_COAL'
  );

  -- PARATROOPER
INSERT INTO Unit_ResourceQuantityRequirements (UnitType, ResourceType, Cost)
SELECT 'UNIT_PARATROOPER', 'RESOURCE_OIL', 1
WHERE EXISTS (SELECT 1 FROM Units WHERE Type = 'UNIT_FW_ORBITAL_DROP_SHOCK_TROOPER')
  AND NOT EXISTS (
      SELECT 1 FROM Unit_ResourceQuantityRequirements
      WHERE UnitType = 'UNIT_FW_ORBITAL_DROP_SHOCK_TROOPER' AND ResourceType = 'RESOURCE_OIL'
  );

-----------------------------------------------------
-- FUTURE 모드 추가
-----------------------------------------------------
-- === AIRBORNE FORCES ===
INSERT INTO Unit_FreePromotions (UnitType, PromotionType)
SELECT 'UNIT_FW_AIRBORNE_FORCES', 'PROMOTION_SAPPER'
WHERE EXISTS (SELECT 1 FROM Units WHERE Type = 'UNIT_FW_AIRBORNE_FORCES')
  AND EXISTS (SELECT 1 FROM UnitPromotions WHERE Type = 'PROMOTION_SAPPER')
  AND NOT EXISTS (
    SELECT 1 FROM Unit_FreePromotions 
    WHERE UnitType = 'UNIT_FW_AIRBORNE_FORCES' AND PromotionType = 'PROMOTION_SAPPER'
  );

INSERT INTO Unit_FreePromotions (UnitType, PromotionType)
SELECT 'UNIT_FW_AIRBORNE_FORCES', 'PROMOTION_OCEAN_CROSSING'
WHERE EXISTS (SELECT 1 FROM Units WHERE Type = 'UNIT_FW_AIRBORNE_FORCES')
  AND EXISTS (SELECT 1 FROM UnitPromotions WHERE Type = 'PROMOTION_OCEAN_CROSSING')
  AND NOT EXISTS (
    SELECT 1 FROM Unit_FreePromotions 
    WHERE UnitType = 'UNIT_FW_AIRBORNE_FORCES' AND PromotionType = 'PROMOTION_OCEAN_CROSSING'
  );

INSERT INTO Unit_FreePromotions (UnitType, PromotionType)
SELECT 'UNIT_FW_AIRBORNE_FORCES', 'PROMOTION_EMBARKED_SIGHT'
WHERE EXISTS (SELECT 1 FROM Units WHERE Type = 'UNIT_FW_AIRBORNE_FORCES')
  AND EXISTS (SELECT 1 FROM UnitPromotions WHERE Type = 'PROMOTION_EMBARKED_SIGHT')
  AND NOT EXISTS (
    SELECT 1 FROM Unit_FreePromotions 
    WHERE UnitType = 'UNIT_FW_AIRBORNE_FORCES' AND PromotionType = 'PROMOTION_EMBARKED_SIGHT'
  );

INSERT INTO Unit_FreePromotions (UnitType, PromotionType)
SELECT 'UNIT_FW_AIRBORNE_FORCES', 'PROMOTION_COMMANDO'
WHERE EXISTS (SELECT 1 FROM Units WHERE Type = 'UNIT_FW_AIRBORNE_FORCES')
  AND EXISTS (SELECT 1 FROM UnitPromotions WHERE Type = 'PROMOTION_COMMANDO')
  AND NOT EXISTS (
    SELECT 1 FROM Unit_FreePromotions 
    WHERE UnitType = 'UNIT_FW_AIRBORNE_FORCES' AND PromotionType = 'PROMOTION_COMMANDO'
  );

INSERT INTO Unit_FreePromotions (UnitType, PromotionType)
SELECT 'UNIT_FW_AIRBORNE_FORCES', 'PROMOTION_DEFENSIVE_EMBARKATION'
WHERE EXISTS (SELECT 1 FROM Units WHERE Type = 'UNIT_FW_AIRBORNE_FORCES')
  AND EXISTS (SELECT 1 FROM UnitPromotions WHERE Type = 'PROMOTION_DEFENSIVE_EMBARKATION')
  AND NOT EXISTS (
    SELECT 1 FROM Unit_FreePromotions 
    WHERE UnitType = 'UNIT_FW_AIRBORNE_FORCES' AND PromotionType = 'PROMOTION_DEFENSIVE_EMBARKATION'
  );

INSERT INTO Unit_FreePromotions (UnitType, PromotionType)
SELECT 'UNIT_FW_AIRBORNE_FORCES', 'PROMOTION_SCOUT_GOODY_BONUS'
WHERE EXISTS (SELECT 1 FROM Units WHERE Type = 'UNIT_FW_AIRBORNE_FORCES')
  AND EXISTS (SELECT 1 FROM UnitPromotions WHERE Type = 'PROMOTION_SCOUT_GOODY_BONUS')
  AND NOT EXISTS (
    SELECT 1 FROM Unit_FreePromotions 
    WHERE UnitType = 'UNIT_FW_AIRBORNE_FORCES' AND PromotionType = 'PROMOTION_SCOUT_GOODY_BONUS'
  );

-- === ORBITAL DROP SHOCK TROOPER ===
INSERT INTO Unit_FreePromotions (UnitType, PromotionType)
SELECT 'UNIT_FW_ORBITAL_DROP_SHOCK_TROOPER', 'PROMOTION_SAPPER'
WHERE EXISTS (SELECT 1 FROM Units WHERE Type = 'UNIT_FW_ORBITAL_DROP_SHOCK_TROOPER')
  AND EXISTS (SELECT 1 FROM UnitPromotions WHERE Type = 'PROMOTION_SAPPER')
  AND NOT EXISTS (
    SELECT 1 FROM Unit_FreePromotions 
    WHERE UnitType = 'UNIT_FW_ORBITAL_DROP_SHOCK_TROOPER' AND PromotionType = 'PROMOTION_SAPPER'
  );

INSERT INTO Unit_FreePromotions (UnitType, PromotionType)
SELECT 'UNIT_FW_ORBITAL_DROP_SHOCK_TROOPER', 'PROMOTION_OCEAN_CROSSING'
WHERE EXISTS (SELECT 1 FROM Units WHERE Type = 'UNIT_FW_ORBITAL_DROP_SHOCK_TROOPER')
  AND EXISTS (SELECT 1 FROM UnitPromotions WHERE Type = 'PROMOTION_OCEAN_CROSSING')
  AND NOT EXISTS (
    SELECT 1 FROM Unit_FreePromotions 
    WHERE UnitType = 'UNIT_FW_ORBITAL_DROP_SHOCK_TROOPER' AND PromotionType = 'PROMOTION_OCEAN_CROSSING'
  );

INSERT INTO Unit_FreePromotions (UnitType, PromotionType)
SELECT 'UNIT_FW_ORBITAL_DROP_SHOCK_TROOPER', 'PROMOTION_EMBARKED_SIGHT'
WHERE EXISTS (SELECT 1 FROM Units WHERE Type = 'UNIT_FW_ORBITAL_DROP_SHOCK_TROOPER')
  AND EXISTS (SELECT 1 FROM UnitPromotions WHERE Type = 'PROMOTION_EMBARKED_SIGHT')
  AND NOT EXISTS (
    SELECT 1 FROM Unit_FreePromotions 
    WHERE UnitType = 'UNIT_FW_ORBITAL_DROP_SHOCK_TROOPER' AND PromotionType = 'PROMOTION_EMBARKED_SIGHT'
  );

INSERT INTO Unit_FreePromotions (UnitType, PromotionType)
SELECT 'UNIT_FW_ORBITAL_DROP_SHOCK_TROOPER', 'PROMOTION_COMMANDO'
WHERE EXISTS (SELECT 1 FROM Units WHERE Type = 'UNIT_FW_ORBITAL_DROP_SHOCK_TROOPER')
  AND EXISTS (SELECT 1 FROM UnitPromotions WHERE Type = 'PROMOTION_COMMANDO')
  AND NOT EXISTS (
    SELECT 1 FROM Unit_FreePromotions 
    WHERE UnitType = 'UNIT_FW_ORBITAL_DROP_SHOCK_TROOPER' AND PromotionType = 'PROMOTION_COMMANDO'
  );

INSERT INTO Unit_FreePromotions (UnitType, PromotionType)
SELECT 'UNIT_FW_ORBITAL_DROP_SHOCK_TROOPER', 'PROMOTION_DEFENSIVE_EMBARKATION'
WHERE EXISTS (SELECT 1 FROM Units WHERE Type = 'UNIT_FW_ORBITAL_DROP_SHOCK_TROOPER')
  AND EXISTS (SELECT 1 FROM UnitPromotions WHERE Type = 'PROMOTION_DEFENSIVE_EMBARKATION')
  AND NOT EXISTS (
    SELECT 1 FROM Unit_FreePromotions 
    WHERE UnitType = 'UNIT_FW_ORBITAL_DROP_SHOCK_TROOPER' AND PromotionType = 'PROMOTION_DEFENSIVE_EMBARKATION'
  );

INSERT INTO Unit_FreePromotions (UnitType, PromotionType)
SELECT 'UNIT_FW_ORBITAL_DROP_SHOCK_TROOPER', 'PROMOTION_SCOUT_GOODY_BONUS'
WHERE EXISTS (SELECT 1 FROM Units WHERE Type = 'UNIT_FW_ORBITAL_DROP_SHOCK_TROOPER')
  AND EXISTS (SELECT 1 FROM UnitPromotions WHERE Type = 'PROMOTION_SCOUT_GOODY_BONUS')
  AND NOT EXISTS (
    SELECT 1 FROM Unit_FreePromotions 
    WHERE UnitType = 'UNIT_FW_ORBITAL_DROP_SHOCK_TROOPER' AND PromotionType = 'PROMOTION_SCOUT_GOODY_BONUS'
  );

-- === SPACEMARINES ===
INSERT INTO Unit_FreePromotions (UnitType, PromotionType)
SELECT 'UNIT_FW_SPACEMARINES', 'PROMOTION_SAPPER'
WHERE EXISTS (SELECT 1 FROM Units WHERE Type = 'UNIT_FW_SPACEMARINES')
  AND EXISTS (SELECT 1 FROM UnitPromotions WHERE Type = 'PROMOTION_SAPPER')
  AND NOT EXISTS (
    SELECT 1 FROM Unit_FreePromotions 
    WHERE UnitType = 'UNIT_FW_SPACEMARINES' AND PromotionType = 'PROMOTION_SAPPER'
  );

INSERT INTO Unit_FreePromotions (UnitType, PromotionType)
SELECT 'UNIT_FW_SPACEMARINES', 'PROMOTION_OCEAN_CROSSING'
WHERE EXISTS (SELECT 1 FROM Units WHERE Type = 'UNIT_FW_SPACEMARINES')
  AND EXISTS (SELECT 1 FROM UnitPromotions WHERE Type = 'PROMOTION_OCEAN_CROSSING')
  AND NOT EXISTS (
    SELECT 1 FROM Unit_FreePromotions 
    WHERE UnitType = 'UNIT_FW_SPACEMARINES' AND PromotionType = 'PROMOTION_OCEAN_CROSSING'
  );

INSERT INTO Unit_FreePromotions (UnitType, PromotionType)
SELECT 'UNIT_FW_SPACEMARINES', 'PROMOTION_EMBARKED_SIGHT'
WHERE EXISTS (SELECT 1 FROM Units WHERE Type = 'UNIT_FW_SPACEMARINES')
  AND EXISTS (SELECT 1 FROM UnitPromotions WHERE Type = 'PROMOTION_EMBARKED_SIGHT')
  AND NOT EXISTS (
    SELECT 1 FROM Unit_FreePromotions 
    WHERE UnitType = 'UNIT_FW_SPACEMARINES' AND PromotionType = 'PROMOTION_EMBARKED_SIGHT'
  );

INSERT INTO Unit_FreePromotions (UnitType, PromotionType)
SELECT 'UNIT_FW_SPACEMARINES', 'PROMOTION_COMMANDO'
WHERE EXISTS (SELECT 1 FROM Units WHERE Type = 'UNIT_FW_SPACEMARINES')
  AND EXISTS (SELECT 1 FROM UnitPromotions WHERE Type = 'PROMOTION_COMMANDO')
  AND NOT EXISTS (
    SELECT 1 FROM Unit_FreePromotions 
    WHERE UnitType = 'UNIT_FW_SPACEMARINES' AND PromotionType = 'PROMOTION_COMMANDO'
  );

INSERT INTO Unit_FreePromotions (UnitType, PromotionType)
SELECT 'UNIT_FW_SPACEMARINES', 'PROMOTION_DEFENSIVE_EMBARKATION'
WHERE EXISTS (SELECT 1 FROM Units WHERE Type = 'UNIT_FW_SPACEMARINES')
  AND EXISTS (SELECT 1 FROM UnitPromotions WHERE Type = 'PROMOTION_DEFENSIVE_EMBARKATION')
  AND NOT EXISTS (
    SELECT 1 FROM Unit_FreePromotions 
    WHERE UnitType = 'UNIT_FW_SPACEMARINES' AND PromotionType = 'PROMOTION_DEFENSIVE_EMBARKATION'
  );

INSERT INTO Unit_FreePromotions (UnitType, PromotionType)
SELECT 'UNIT_FW_SPACEMARINES', 'PROMOTION_SCOUT_GOODY_BONUS'
WHERE EXISTS (SELECT 1 FROM Units WHERE Type = 'UNIT_FW_SPACEMARINES')
  AND EXISTS (SELECT 1 FROM UnitPromotions WHERE Type = 'PROMOTION_SCOUT_GOODY_BONUS')
  AND NOT EXISTS (
    SELECT 1 FROM Unit_FreePromotions 
    WHERE UnitType = 'UNIT_FW_SPACEMARINES' AND PromotionType = 'PROMOTION_SCOUT_GOODY_BONUS'
  );

------------------------------------------------------------------------
DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_XCOM_SQUAD' AND PromotionType = 'PROMOTION_EXTENDED_PARADROP';
