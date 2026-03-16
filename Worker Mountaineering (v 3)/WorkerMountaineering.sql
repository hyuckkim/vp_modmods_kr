-- Art defines

INSERT INTO IconTextureAtlases 
			(Atlas, 							IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES		('WORKER_MOUNTAINEERING_ATLAS', 	256, 		'mountaineerPromoIcon_256.dds',			1, 				1),
			('WORKER_MOUNTAINEERING_ATLAS', 	64, 		'mountaineerPromoIcon_064.dds',			1, 				1),
			('WORKER_MOUNTAINEERING_ATLAS', 	45, 		'mountaineerPromoIcon_045.dds',			1, 				1),
			('WORKER_MOUNTAINEERING_ATLAS', 	32, 		'mountaineerPromoIcon_032.dds',			1, 				1);

-- Defining the Mountaineer promotion

INSERT INTO UnitPromotions
		(Type, Description, Help, Sound, PortraitIndex, IconAtlas, TechPrereq, CanMoveImpassable, PediaType, PediaEntry, CannotBeChosen)
VALUES	('PROMOTION_WORKER_MOUNTAINEER', 'TXT_KEY_PROMOTION_WORKER_MOUNTAINEER', 'TXT_KEY_PROMOTION_WORKER_MOUNTAINEER_HELP', 'AS2D_IF_LEVELUP', 0, 'WORKER_MOUNTAINEERING_ATLAS', 'TECH_DYNAMITE', 1, 'PEDIA_CIVILIAN', 'TXT_KEY_PROMOTION_WORKER_MOUNTAINEER', 1);

-- Associate the Mountaineer promotion with workers and settlers
INSERT INTO UnitPromotions_CivilianUnitType
		(PromotionType, UnitType)
SELECT	'PROMOTION_WORKER_MOUNTAINEER', Type FROM Units WHERE Class IN
('UNITCLASS_WORKER', 'UNITCLASS_PIONEER','UNITCLASS_COLONIST');

CREATE TRIGGER IF NOT EXISTS Jar_Mountaineering01
AFTER INSERT ON Units WHEN NEW.Class = 'UNITCLASS_WORKER' AND NEW.Type!='UNIT_WORKER'
BEGIN
	INSERT INTO UnitPromotions_CivilianUnitType
			(PromotionType, UnitType)
	SELECT	'PROMOTION_WORKER_MOUNTAINEER', NEW.Type;
END;

CREATE TRIGGER IF NOT EXISTS Jar_Mountaineering02
AFTER INSERT ON Units WHEN NEW.Class = 'UNITCLASS_PIONEER' AND NEW.Type!='UNIT_PIONEER'
BEGIN
	INSERT INTO UnitPromotions_CivilianUnitType
			(PromotionType, UnitType)
	SELECT	'PROMOTION_WORKER_MOUNTAINEER', NEW.Type;
END;

CREATE TRIGGER IF NOT EXISTS Jar_Mountaineering03
AFTER INSERT ON Units WHEN NEW.Class = 'UNITCLASS_COLONIST' AND NEW.Type!='UNIT_COLONIST'
BEGIN
	INSERT INTO UnitPromotions_CivilianUnitType
			(PromotionType, UnitType)
	SELECT	'PROMOTION_WORKER_MOUNTAINEER', NEW.Type;
END;

-- Grants the Mountaineer promotion when Dynamite is researched
INSERT INTO Technology_FreePromotions
		(TechType, PromotionType)
VALUES
		('TECH_DYNAMITE', 'PROMOTION_WORKER_MOUNTAINEER');

-- Text for the Mountaineer promotion
INSERT INTO Language_en_US 
		(Tag, Text)
VALUES
		('TXT_KEY_PROMOTION_WORKER_MOUNTAINEER', 'Mountaineer'),
		('TXT_KEY_PROMOTION_WORKER_MOUNTAINEER_HELP', 'Allows this unit to move through Mountain tiles.');
--=========================================================================================
--=========================================================================================