
--==========================================================================================================================	
-- Icon atlas
--==========================================================================================================================
INSERT INTO IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn) VALUES		
('eaw_PI_ATLAS', 256, 'eaw_PI_256.dds', 4, 1),
('eaw_PI_ATLAS', 064, 'eaw_PI_064.dds', 4, 1),
('eaw_PI_ATLAS', 045, 'eaw_PI_045.dds', 4, 1),
('eaw_PI_ATLAS', 032, 'eaw_PI_032.dds', 4, 1),
('eaw_PI_ATLAS', 016, 'eaw_PI_016.dds', 4, 1);

--==========================================================================================================================	
-- UNIT Promotion
--==========================================================================================================================
--P-80 Promotion
INSERT INTO UnitPromotions (Type, Description, Help, Sound, OrderPriority, CannotBeChosen, InterceptionDefenseDamageModifier, EvasionChange, LostWithUpgrade, PortraitIndex, IconAtlas, PediaType, PediaEntry)
VALUES
  ('PROMOTION_JET_DOM', 'TXT_KEY_PROMOTION_JET_DOM', 'TXT_KEY_PROMOTION_JET_DOM_HELP', 'AS2D_IF_LEVELUP', 1, 'true', -10, 10, 0, 0, 'eaw_PI_ATLAS', 'PEDIA_AIR', 'TXT_KEY_PEDIA_PROMOTION_JET_DOM');

INSERT INTO UnitPromotions_UnitCombatMods	(PromotionType, UnitCombatType, Modifier)
VALUES
	('PROMOTION_JET_DOM', 'UNITCOMBAT_FIGHTER', 10);

-- === Base, cross-compatible promotion defs (no VP-only columns) ===
-- 도시 주둔(공항) 운영
INSERT OR IGNORE INTO UnitPromotions
  (Type,                         Description,                       Help,                               Sound, CannotBeChosen, LostWithUpgrade, PortraitIndex, IconAtlas,      PediaType,            PediaEntry)
VALUES
  ('PROMOTION_AIRBASE_OPS',      'TXT_KEY_PROMOTION_AIRBASE_OPS',   'TXT_KEY_PROMOTION_AIRBASE_OPS_HELP','AS2D_IF_LEVELUP', 1,              0,               2,            'eaw_PI_ATLAS', 'PEDIA_AIR', 'TXT_KEY_PROMOTION_AIRBASE_OPS');

-- 항공모함 운용
INSERT OR IGNORE INTO UnitPromotions
  (Type,                         Description,                       Help,                               Sound, CannotBeChosen, LostWithUpgrade, PortraitIndex, IconAtlas,      PediaType,            PediaEntry)
VALUES
  ('PROMOTION_CARRIER_OPS',      'TXT_KEY_PROMOTION_CARRIER_OPS',   'TXT_KEY_PROMOTION_CARRIER_OPS_HELP','AS2D_IF_LEVELUP', 1,              0,               3,            'eaw_PI_ATLAS', 'PEDIA_AIR', 'TXT_KEY_PROMOTION_CARRIER_OPS');

-- 효과 부여 (기본 게임 호환: 도메인/도시/원거리 서브테이블)
-- 공항 주둔: 요격 전투 +5%, 요격피해 경감(방어)은 VP 전용이라 대신 '요격 전투 +5%'만 먼저 안정 적용
UPDATE UnitPromotions
SET InterceptionCombatModifier = 5,  InterceptionDefenseDamageModifier = -5,     CityAttack = 0                       
WHERE Type = 'PROMOTION_AIRBASE_OPS';

-- 항모 운용: 대지-해군/대도시 타격 +5%씩
INSERT OR IGNORE INTO UnitPromotions_Domains (PromotionType, DomainType, Attack)
VALUES ('PROMOTION_CARRIER_OPS', 'DOMAIN_SEA', 5);

INSERT OR IGNORE INTO UnitPromotions_Domains (PromotionType, DomainType, Attack)
VALUES ('PROMOTION_CARRIER_OPS', 'DOMAIN_LAND', 5);

-- 도시 공격 전용 보너스는 CityAttack 컬럼 사용 가능(전투기/폭격기 공통)
UPDATE UnitPromotions
SET CityAttack = 5
WHERE Type = 'PROMOTION_CARRIER_OPS';

INSERT OR IGNORE INTO UnitPromotions_YieldFromKills (PromotionType, YieldType, Yield) -- 없애고 싶으면 생략
SELECT 'PROMOTION_CARRIER_OPS', 'YIELD_FAITH', 0 WHERE 0; -- 더미(예시: 아무것도 안 넣음)

INSERT OR IGNORE INTO Unit_FreePromotions (UnitType, PromotionType) VALUES
('UNIT_EARLYMONOPLAN','PROMOTION_CARRIER_OPS'),
('UNIT_JET27','PROMOTION_CARRIER_OPS'),
('UNIT_LIGHTBOMBER','PROMOTION_CARRIER_OPS');

INSERT OR IGNORE INTO Unit_FreePromotions (UnitType, PromotionType) VALUES
('UNIT_WWI_BOMBER','PROMOTION_AIRBASE_OPS'),
('UNIT_TRIPLANE','PROMOTION_AIRBASE_OPS'),
('UNIT_FIGHTER','PROMOTION_AIRBASE_OPS'),
('UNIT_JET_FIGHTER','PROMOTION_AIRBASE_OPS'),
('UNIT_BOMBER','PROMOTION_AIRBASE_OPS'),
('UNIT_AMERICAN_B17','PROMOTION_AIRBASE_OPS'),
('UNIT_STEALTH_BOMBER','PROMOTION_AIRBASE_OPS');

--=======================================================
-- Air fighters
--=======================================================
--------------------------------
-- Early Mono
--------------------------------
INSERT INTO Unit_FreePromotions 	
			(UnitType, PromotionType)
SELECT		'UNIT_EARLYMONOPLAN', PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_TRIPLANE');

DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_EARLYMONOPLAN' AND PromotionType = 'PROMOTION_AIRBASE_OPS';

--------------------------------
-- Early Jet
--------------------------------
INSERT INTO Unit_FreePromotions 	
			(UnitType, PromotionType)
SELECT		('UNIT_EARLYJET'), PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_FIGHTER');

INSERT INTO Unit_FreePromotions	(UnitType, PromotionType)
VALUES 
  ('UNIT_EARLYJET', 'PROMOTION_AIR_REPAIR'),
  ('UNIT_EARLYJET', 'PROMOTION_AIR_RANGE'),
  ('UNIT_EARLYJET', 'PROMOTION_ANTI_AIR_II'),
  ('UNIT_EARLYJET', 'PROMOTION_JET_DOM');
--------------------------------
-- Jet fighters
--------------------------------	
INSERT INTO Unit_FreePromotions 	
			(UnitType, PromotionType)
SELECT		('UNIT_JET27'), PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_FIGHTER');
--------------------------------
-- MIG 29
--------------------------------
INSERT INTO Unit_FreePromotions 	
			(UnitType, PromotionType)
SELECT		('UNIT_MIG29'), PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_JAPANESE_ZERO');
--------------------------------
-- Jet fighter (f22 stealth promotion)
--------------------------------
INSERT INTO Unit_FreePromotions 
    (UnitType, PromotionType)
VALUES 
    ('UNIT_JET_FIGHTER','PROMOTION_STEALTH');
--------------------------------
-- Stealth Jet
--------------------------------
INSERT INTO Unit_FreePromotions 	
			(UnitType, PromotionType)
SELECT		('UNIT_ADVJET'), PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_JET_FIGHTER');

DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_ADVJET' AND PromotionType = 'PROMOTION_AIRBASE_OPS';

--=======================================================
-- Bombers
--=======================================================
--------------------------------
-- Median Bomber
--------------------------------
INSERT INTO Unit_FreePromotions 	
			(UnitType, PromotionType)
SELECT		'UNIT_LIGHTBOMBER', PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_WWI_BOMBER');

DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_LIGHTBOMBER' AND PromotionType = 'PROMOTION_AIRBASE_OPS';

--------------------------------
-- Strategic bomber
--------------------------------
INSERT INTO Unit_FreePromotions 	
			(UnitType, PromotionType)
SELECT		'UNIT_STRBOMB', PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_BOMBER');

INSERT INTO Unit_FreePromotions	(UnitType, PromotionType)
VALUES 
  ('UNIT_STRBOMB', 'PROMOTION_AIR_RECON');
--------------------------------
-- B 52
--------------------------------
INSERT INTO Unit_FreePromotions 	
			(UnitType, PromotionType)
SELECT		'UNIT_B52', PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_AMERICAN_B17');

INSERT INTO Unit_FreePromotions	(UnitType, PromotionType)
VALUES 
  ('UNIT_B52', 'PROMOTION_AIR_RECON');
--------------------------------
-- Ultijet Bomb
--------------------------------
INSERT INTO Unit_FreePromotions 	
			(UnitType, PromotionType)
SELECT		'UNIT_ULTJETBOMB', PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_BOMBER');

INSERT INTO Unit_FreePromotions	(UnitType, PromotionType)
VALUES 
  ('UNIT_ULTJETBOMB', 'PROMOTION_AIR_RECON');
  
--==========================================================================================================================	
-- Compatibility Patch
--==========================================================================================================================

-- 기본: 함재기 승급을 기본으로 주고(Lua가 도시에 있으면 공항 승급으로 스왑)
INSERT OR IGNORE INTO Unit_FreePromotions (UnitType, PromotionType)
SELECT 'UNIT_FW_DRONE_FIGHTER_2', 'PROMOTION_CARRIER_OPS'
WHERE EXISTS (SELECT 1 FROM Units WHERE Type = 'UNIT_FW_DRONE_FIGHTER_2');

INSERT OR IGNORE INTO Unit_FreePromotions (UnitType, PromotionType)
SELECT 'UNIT_FW_PLASMA_FIGHTER', 'PROMOTION_CARRIER_OPS'
WHERE EXISTS (SELECT 1 FROM Units WHERE Type = 'UNIT_FW_PLASMA_FIGHTER');

INSERT OR IGNORE INTO Unit_FreePromotions (UnitType, PromotionType)
SELECT 'UNIT_FW_SPACE_FIGHTER', 'PROMOTION_CARRIER_OPS'
WHERE EXISTS (SELECT 1 FROM Units WHERE Type = 'UNIT_FW_SPACE_FIGHTER');
