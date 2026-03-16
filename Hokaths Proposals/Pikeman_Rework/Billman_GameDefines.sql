INSERT OR REPLACE INTO Language_en_US 
	(Tag, Text)
Values
	('TXT_KEY_UNIT_PIKEMAN', 'Halberdier'),
	('TXT_KEY_UNIT_PIKEMAN_STRATEGY', 'The Halberdier is a more powerful Spearman. Its higher combat strength allows it to defend against rampaging Knights, but only just.'), 
	('TXT_KEY_CIVILOPEDIA_UNITS_MEDIEVAL_PIKEMAN_TEXT', 'A number of poleaxe designs were used in combat, with most developed from peasants combining hand tools with spear shafts. They all served roughly the same function as a melee weapon that could also function against a mounted foe. For example, bills are a class of agricultural implement used for trimming tree limbs, which were often repurposed for use as an infantry polearm when peasants were levied to fight in war. It was similar in size, function and appearance to the contemporary halberd: a long pole at the end of which is a hook for grappling and an axe and/or spike for cutting/thrusting. By the 15th century it had largely been replaced by the pike, though the English continued to use a combination of billmen and longbowmen into the early 16th century.');

UPDATE Language_en_US SET
Text = Replace(Text, 'Pikeman', '{TXT_KEY_UNIT_PIKEMAN}')
WHERE Tag IN ('TXT_KEY_UNIT_HELP_FCOMPANY', 'TXT_KEY_UNIT_FREE_COMPANY_STRATEGY');

-- make it look earlier in history. right now is wearing a cuirass
INSERT INTO IconTextureAtlases 
	(Atlas,	   IconSize,  	Filename, 		IconsPerRow, 	IconsPerColumn)
VALUES	('BILLMAN_Flag', 32,  'BillmanFlag_32.dds',	1, 		1);

UPDATE Units SET
	IconAtlas = 'CORP2_ATLAS',
	PortraitIndex = 11
WHERE Type = 'UNIT_PIKEMAN';

UPDATE Units SET
	PrereqTech = 'TECH_ENGINEERING', 
	Cost = Cost - 25, 
	FaithCost = FaithCost - 50,
	Combat = Combat  -- they're already weak!
WHERE Class = 'UNITCLASS_PIKEMAN' AND PrereqTech = 'TECH_STEEL';

CREATE TRIGGER IF NOT EXISTS Billman_CustomCivs AFTER INSERT ON Units
WHEN NEW.Class = 'UNITCLASS_PIKEMAN'
BEGIN
	UPDATE Units SET
		Cost = Cost - 25,
		FaithCost = FaithCost - 50,
		PrereqTech = 'TECH_ENGINEERING'
	WHERE Type = NEW.Type AND PrereqTech = 'TECH_STEEL';
END;

UPDATE Units SET
	PrereqTech = 'TECH_ENGINEERING', 
	Cost = 90,	
	FaithCost = 200,
	Combat = 18
WHERE Type = 'UNIT_NETHERLANDS_GOEDENDAG';

UPDATE Units SET
	Cost = 110,
	FaithCost = 250,
	Combat = 19,
	PrereqTech = 'TECH_METAL_CASTING'
WHERE Type = 'UNIT_DANISH_BERSERKER';

-- find the UUs, find all the UUs
--UPDATE Units SET
--ObsoleteTech = 'TECH_MACHINERY'
--WHERE Class = 'UNITCLASS_SPEARMAN';

UPDATE Units SET
ObsoleteTech = 'TECH_ENGINEERING'
WHERE Type = 'UNIT_SPEARMAN';
--==========================================================================================================================
-- UnitPromotions
--==========================================================================================================================
UPDATE UnitPromotions SET
	CannotBeChosen = 0,
	LostWithUpgrade = 0,
	PromotionPrereqOr1 = 'PROMOTION_FORMATION_2',
	TechPrereq = 'TECH_MACHINERY',
	RankList = 'FORMATION',
	RankNumber = 3,
	OpenDefense = 15,
	OrderPriority = 301,
	MaxHitPointsChange = 10,
	PortraitIndex = 57
WHERE Type = 'PROMOTION_DOPPELSOLDNER';

INSERT INTO UnitPromotions_UnitCombats
	(PromotionType, UnitCombatType)
VALUES 
	('PROMOTION_DOPPELSOLDNER', 'UNITCOMBAT_MELEE');

INSERT OR REPLACE INTO Language_en_US 
	(Tag, Text)
Values 
	('TXT_KEY_PROMOTION_DOPPELSOLDNER', 'Pike Tactics'),
	('TXT_KEY_PROMOTION_DOPPELSOLDNER_HELP', '+30% [ICON_STRENGTH] Combat Strength when attacking [COLOR_POSITIVE_TEXT]Full Health Units[ENDCOLOR].[NEWLINE]+15% [ICON_STRENGTH] Combat Strength when defending in [COLOR_POSITIVE_TEXT]Open Terrain[ENDCOLOR][NEWLINE]+10 Hit Points.[NEWLINE][NEWLINE]Available once you have researched [COLOR_CYAN]Machinery[ENDCOLOR].');

