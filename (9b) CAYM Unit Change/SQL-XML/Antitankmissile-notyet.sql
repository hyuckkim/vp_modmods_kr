---------------------------------------------------------
-- Special unit -- Add special cargo for Air Land Carrier only -- CAYM EDITED
---------------------------------------------------------
INSERT INTO SpecialUnits (	Type, 						Description,						Valid,	CityLoad)								
SELECT						'SPECIALUNIT_ANTITANK_MISSILE',	'TXT_KEY_ANTITANK_MISSILE',	1,		1	;

INSERT INTO SpecialUnit_CarrierUnitAI (	SpecialUnitType, 			UnitAIType)
SELECT									'SPECIALUNIT_ANTITANK_MISSILE',	'UNITAI_MISSILE_AIR'	;

INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_ANTITANK_MISSILE', 'Anti-Tank Missile');

INSERT INTO Language_ko_KR (Tag, Text) VALUES
('TXT_KEY_ANTITANK_MISSILE', '대전차 미사일');

UPDATE Units SET PrereqTech = 'TECH_MOBILE_TACTICS',      Moves = 3 WHERE Type = 'UNIT_ROCKET_ARTILLERY';
UPDATE Units SET PrereqTech = 'TECH_ADVANCED_BALLISTICS', Moves = 3 WHERE Type = 'UNIT_BAZOOKA';

DELETE FROM Unit_FreePromotions WHERE PromotionType = 'PROMOTION_ANTI_TANK' AND UnitType = 'UNIT_BAZOOKA';
DELETE FROM Unit_FreePromotions WHERE PromotionType = 'PROMOTION_ANTI_TANK' AND UnitType = 'UNIT_HELICOPTER_GUNSHIP';
DELETE FROM Unit_FreePromotions WHERE PromotionType = 'PROMOTION_ANTI_TANK' AND UnitType = 'UNIT_FW_APACHE';
DELETE FROM Unit_FreePromotions WHERE PromotionType = 'PROMOTION_ANTI_TANK' AND UnitType = 'UNIT_FW_ATGM';
DELETE FROM Unit_FreePromotions WHERE PromotionType = 'PROMOTION_ANTI_TANK' AND UnitType = 'UNIT_FW_VERTOL';
DELETE FROM Unit_FreePromotions WHERE PromotionType = 'PROMOTION_ANTI_TANK' AND UnitType = 'UNIT_FW_HOVERTANK';
DELETE FROM Unit_FreePromotions WHERE PromotionType = 'PROMOTION_ANTI_TANK' AND UnitType = 'UNIT_FW_AUTOMATON';
DELETE FROM Unit_FreePromotions WHERE PromotionType = 'PROMOTION_ANTI_TANK' AND UnitType = 'UNIT_FW_ROBOT_INFANTRY';
DELETE FROM Unit_FreePromotions WHERE PromotionType = 'PROMOTION_ANTI_TANK' AND UnitType = 'UNIT_FW_COLOSSUS';

UPDATE Units SET SpecialCargo = 'SPECIALUNIT_ANTITANK_MISSILE', DomainCargo = 'DOMAIN_AIR' WHERE Type = 'UNIT_BAZOOKA';
UPDATE Units SET SpecialCargo = 'SPECIALUNIT_ANTITANK_MISSILE', DomainCargo = 'DOMAIN_AIR' WHERE Type = 'UNIT_HELICOPTER_GUNSHIP';
UPDATE Units SET SpecialCargo = 'SPECIALUNIT_ANTITANK_MISSILE', DomainCargo = 'DOMAIN_AIR' WHERE Type = 'UNIT_FW_APACHE';
UPDATE Units SET SpecialCargo = 'SPECIALUNIT_ANTITANK_MISSILE', DomainCargo = 'DOMAIN_AIR' WHERE Type = 'UNIT_FW_ATGM';
UPDATE Units SET SpecialCargo = 'SPECIALUNIT_ANTITANK_MISSILE', DomainCargo = 'DOMAIN_AIR' WHERE Type = 'UNIT_FW_VERTOL';
UPDATE Units SET SpecialCargo = 'SPECIALUNIT_ANTITANK_MISSILE', DomainCargo = 'DOMAIN_AIR' WHERE Type = 'UNIT_FW_HOVERTANK';
UPDATE Units SET SpecialCargo = 'SPECIALUNIT_ANTITANK_MISSILE', DomainCargo = 'DOMAIN_AIR' WHERE Type = 'UNIT_FW_AUTOMATON';
UPDATE Units SET SpecialCargo = 'SPECIALUNIT_ANTITANK_MISSILE', DomainCargo = 'DOMAIN_AIR' WHERE Type = 'UNIT_FW_ROBOT_INFANTRY';
UPDATE Units SET SpecialCargo = 'SPECIALUNIT_ANTITANK_MISSILE', DomainCargo = 'DOMAIN_AIR' WHERE Type = 'UNIT_FW_COLOSSUS';

INSERT INTO Unit_FreePromotions    (UnitType, PromotionType)
VALUES 
	('UNIT_BAZOOKA',             'PROMOTION_CARGO_I'),
	('UNIT_HELICOPTER_GUNSHIP',  'PROMOTION_CARGO_I'),
	('UNIT_FW_APACHE',           'PROMOTION_CARGO_I'),
	('UNIT_FW_ATGM',             'PROMOTION_CARGO_I'),
	('UNIT_FW_VERTOL',           'PROMOTION_CARGO_I'),
	('UNIT_FW_HOVERTANK',        'PROMOTION_CARGO_I'),
	('UNIT_FW_AUTOMATON',        'PROMOTION_CARGO_I'),
	('UNIT_FW_ROBOT_INFANTRY',   'PROMOTION_CARGO_I'),
	('UNIT_FW_COLOSSUS',         'PROMOTION_CARGO_I');

-- Proposal 2-56: make Bazooka range 3 =>2
UPDATE Units SET Range = '2', DefaultUnitAI = 'UNITAI_RANGED' WHERE Type = 'UNIT_BAZOOKA';
UPDATE Units SET Range = '2', DefaultUnitAI = 'UNITAI_RANGED' WHERE Type = 'UNIT_FW_ATGM';
UPDATE Units SET Range = '2', DefaultUnitAI = 'UNITAI_RANGED' WHERE Type = 'UNIT_FW_AUTOMATON';
UPDATE Units SET Range = '2', DefaultUnitAI = 'UNITAI_RANGED' WHERE Type = 'UNIT_FW_ROBOT_INFANTRY';
UPDATE Units SET Range = '2', DefaultUnitAI = 'UNITAI_RANGED' WHERE Type = 'UNIT_FW_COLOSSUS';
UPDATE Units SET Range = '3', DefaultUnitAI = 'UNITAI_RANGED' WHERE Type = 'UNIT_FW_NANOHIVE';
UPDATE Units SET Range = '3', DefaultUnitAI = 'UNITAI_RANGED' WHERE Type = 'UNIT_FW_MEGAHIVE';