------------------------------
-- Brazil Changes
------------------------------
--UA changes
INSERT INTO UnitPromotions 
		(Type, 							Description, 						Help, 										Sound, 				LostWithUpgrade,	CannotBeChosen, PortraitIndex, 	IconAtlas, 				PediaType, 			PediaEntry)
VALUES	('PROMOTION_CARNIVAL_RECON',	'TXT_KEY_PROMOTION_CARNIVAL_RECON',	'TXT_KEY_PROMOTION_CARNIVAL_RECON_HELP',	'AS2D_IF_LEVELUP',	0,					1, 				8, 				'promoVP_atlas_01', 	'PEDIA_SCOUTING', 	'TXT_KEY_PROMOTION_CARNIVAL_RECON'),

DELETE FROM UnitPromotions_YieldFromScouting WHERE YieldType = 'YIELD_GOLD' AND PromotionType = 'PROMOTION_RECON_BANDEIRANTES';

INSERT INTO UnitPromotions_YieldFromScouting
    (PromotionType, YieldType, Yield)
VALUES
    ('PROMOTION_CARNIVAL_RECON','YIELD_GOLD', 3);

INSERT INTO Trait_FreePromotionUnitCombats
    (TraitType, UnitCombatType, PromotionType)
VALUES
    ('TRAIT_CARNIVAL','UNITCOMBAT_RECON','PROMOTION_CARNIVAL_RECON');

UPDATE Language_en_US
SET Text = 'Has a unique "We Love The King Day", Carnival, that gives -50% [ICON_HAPPINESS_3] Unhappiness from Needs in Cities. When a [ICON_GOLDEN_AGE] Golden Age begins, 30% of [ICON_GOLDEN_AGE] Golden Age Points convert into [ICON_GOLD] Gold and [ICON_TOURISM] Tourism, and Cities gain 10 turns of Carnival. Recon units gain [ICON_GOLD] Gold when revealing Tiles'
WHERE Tag = 'TXT_KEY_TRAIT_CARNIVAL';

UPDATE Language_en_US
SET Text = 'When revealing tiles, gain [ICON_GOLD] Gold, [ICON_CULTURE] Culture, and [ICON_RESEARCH] Science in the nearest owned City.'
WHERE Tag = 'TXT_KEY_PROMOTION_RECON_BANDEIRANTES_HELP';
--Brazilwood Camp changes
UPDATE Builds
SET PrereqTech = 'TECH_METAL_CASTING'
WHERE Type = 'IMPROVEMENT_BRAZILWOOD_CAMP';

UPDATE Improvement_Yields
SET Yield = 3
WHERE ImprovementType = 'IMPROVEMENT_BRAZILWOOD_CAMP';

DELETE FROM Improvement_TechYieldChanges
WHERE ImprovementType = 'IMPROVEMENT_BRAZILWOOD_CAMP' AND 
TechType = 'TECH_PHYSICS';
--Text
INSERT INTO Language_en_US (Tag, Text)
VALUES
	('TXT_KEY_PROMOTION_CARNIVAL_RECON',				'Doctrine of Discovery'),
	('TXT_KEY_PROMOTION_CARNIVAL_RECON_HELP',			'When revealing tiles, gain [ICON_GOLD] Gold in the nearest owned City.'); 



