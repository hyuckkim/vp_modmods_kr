---------------------------------------------
-- define new promotions
---------------------------------------------
INSERT INTO UnitPromotions
	(Type, Description, Help, PediaEntry,
	PediaType, PortraitIndex, IconAtlas, IsVisibleAboveFlag, CannotBeChosen, TechPrereq, RankList, OrderPriority,
	VisibilityChange, IsNearbyPromotion, NearbyRange, GiveDomain, GiveOutsideFriendlyLandsModifier, GiveHPHealedIfEnemyKilled)
VALUES
	('PROMOTION_PORTUGAL_UA_1', 'TXT_KEY_PROMOTION_PORTUGAL_UA_1', 'TXT_KEY_PROMOTION_PORTUGAL_UA_1_HELP', 'TXT_KEY_PROMOTION_PORTUGAL_UA_1',
	'PEDIA_SHARED', 8, 'PROMOTION_ATLAS_VP_01', 1, 1, 'TECH_OPTICS', 'PORTUGAL', 793,
	 0, 0, 0, NULL, 0, 0),
	('PROMOTION_PORTUGAL_UA_2', 'TXT_KEY_PROMOTION_PORTUGAL_UA_2', 'TXT_KEY_PROMOTION_PORTUGAL_UA_2_HELP', 'TXT_KEY_PROMOTION_PORTUGAL_UA_2',
	'PEDIA_SHARED', 8, 'PROMOTION_ATLAS_VP_01', 1, 1, 'TECH_COMPASS', 'PORTUGAL', 793,
	 0, 0, 0, NULL, 0, 0),
	('PROMOTION_PORTUGAL_UA_3', 'TXT_KEY_PROMOTION_PORTUGAL_UA_3', 'TXT_KEY_PROMOTION_PORTUGAL_UA_3_HELP', 'TXT_KEY_PROMOTION_PORTUGAL_UA_3',
	'PEDIA_SHARED', 8, 'PROMOTION_ATLAS_VP_01', 1, 1, 'TECH_NAVIGATION', 'PORTUGAL', 793,
	 0, 0, 0, NULL, 0, 0),
	('PROMOTION_MARE_CLAUSUM', 'TXT_KEY_PROMOTION_MARE_CLAUSUM', 'TXT_KEY_PROMOTION_MARE_CLAUSUM_HELP', 'TXT_KEY_PROMOTION_MARE_CLAUSUM',
	'PEDIA_NAVAL', 47, 'PROMOTION_ATLAS_VP_00', 1, 1, NULL, NULL, 208,
	 0, 1, 5, 'DOMAIN_SEA', 25, 0);
-- visibility part doesnt work on cargo ships due to DLL special case

INSERT INTO Language_en_US
	(Tag, Text)
VALUES
	('TXT_KEY_PROMOTION_PORTUGAL_UA_1', 'Padrões I'),
	('TXT_KEY_PROMOTION_PORTUGAL_UA_1_HELP', 'Gain 1 [ICON_GOLD] Gold, [ICON_RESEARCH] Science, and [ICON_CULTURE] Culture when revealing tiles.[NEWLINE]This value is multiplied by 12 for Natural Wonders, 4 for Ancient Ruins, and 3 for Resources.'),
	('TXT_KEY_PROMOTION_PORTUGAL_UA_2', 'Padrões II'),
	('TXT_KEY_PROMOTION_PORTUGAL_UA_2_HELP', 'Gain 1 [ICON_GOLD] Gold, [ICON_RESEARCH] Science, and [ICON_CULTURE] Culture when revealing tiles.[NEWLINE]This value is multiplied by 12 for Natural Wonders, 4 for Ancient Ruins, and 3 for Resources.'),
	('TXT_KEY_PROMOTION_PORTUGAL_UA_3', 'Padrões III'),
	('TXT_KEY_PROMOTION_PORTUGAL_UA_3_HELP', 'Gain 1 [ICON_GOLD] Gold, [ICON_RESEARCH] Science, and [ICON_CULTURE] Culture when revealing tiles.[NEWLINE]This value is multiplied by 12 for Natural Wonders, 4 for Ancient Ruins, and 3 for Resources.'),
	('TXT_KEY_PROMOTION_MARE_CLAUSUM', 'Mare Clausum'),
	('TXT_KEY_PROMOTION_MARE_CLAUSUM_HELP', 'Friendly Naval Units within 5 tiles gain +25% [ICON_STRENGTH] Combat Strength [COLOR_POSITIVE_TEXT]Outside of Friendly Territory[ENDCOLOR].');

INSERT INTO UnitPromotions_UnitCombats
	(PromotionType, UnitCombatType)
SELECT
	p.Type, c.Type
FROM UnitPromotions p, UnitCombatInfos c WHERE
p.Type IN ('PROMOTION_PORTUGAL_UA_1', 'PROMOTION_PORTUGAL_UA_2', 'PROMOTION_PORTUGAL_UA_3') AND
c.Type IN ('UNITCOMBAT_CARGO', 'UNITCOMBAT_RECON', 'UNITCOMBAT_NAVALMELEE', 'UNITCOMBAT_NAVALRANGED', 'UNITCOMBAT_SUBMARINE', 'UNITCOMBAT_CARRIER');

INSERT INTO UnitPromotions_UnitCombats
	(PromotionType, UnitCombatType)
SELECT
	'PROMOTION_MARE_CLAUSUM', 'UNITCOMBAT_CARGO';

INSERT INTO UnitPromotions_YieldFromScouting
	(PromotionType, YieldType, Yield)
SELECT
	p.Type, y.Type, 1
FROM UnitPromotions p, Yields y WHERE
p.Type IN ('PROMOTION_PORTUGAL_UA_1', 'PROMOTION_PORTUGAL_UA_2', 'PROMOTION_PORTUGAL_UA_3') AND
y.Type IN ('YIELD_GOLD', 'YIELD_SCIENCE', 'YIELD_CULTURE');

--------------------------------------------------------
-- Update the Portugese UA
--------------------------------------------------------
-- the problem here is that none of these tables respect the TechPrereq column in UnitPromotions

/*
INSERT INTO Trait_FreePromotions
	(TraitType, PromotionType)
SELECT
	'TRAIT_EXTRA_TRADE', Type
FROM UnitPromotions WHERE
Type IN ('PROMOTION_PORTUGAL_UA_1', 'PROMOTION_PORTUGAL_UA_2', 'PROMOTION_PORTUGAL_UA_3');
*/

INSERT INTO Trait_FreePromotionUnitCombats
	(TraitType, UnitCombatType, PromotionType)
SELECT
	'TRAIT_EXTRA_TRADE', c.Type, p.Type
FROM UnitPromotions p, UnitCombatInfos c WHERE
p.Type IN ('PROMOTION_PORTUGAL_UA_1') AND
c.Type IN ('UNITCOMBAT_CARGO', 'UNITCOMBAT_RECON', 'UNITCOMBAT_NAVALMELEE', 'UNITCOMBAT_NAVALRANGED', 'UNITCOMBAT_SUBMARINE', 'UNITCOMBAT_CARRIER');

-- , 'PROMOTION_PORTUGAL_UA_2', 'PROMOTION_PORTUGAL_UA_3'

DELETE FROM Trait_YieldFromRouteMovement WHERE TraitType = 'TRAIT_EXTRA_TRADE';

UPDATE Language_en_US
SET Text = 'After researching [COLOR_CYAN]Sailing[ENDCOLOR], tiles revealed by Recon or Naval Units grant [ICON_GOLD] Gold, [ICON_RESEARCH] Science, and [ICON_CULTURE] Culture, scaling with the discovery of [COLOR_CYAN]Compass[ENDCOLOR] and [COLOR_CYAN]Navigation[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_TRAIT_EXTRA_TRADE';

UPDATE Language_en_US
SET Text = 'Padrão Real'
WHERE Tag = 'TXT_KEY_TRAIT_EXTRA_TRADE_SHORT';

--------------------------------------------------
-- Update University of Coimbra 
--------------------------------------------------
UPDATE Buildings SET 
FreePromotion = 'PROMOTION_MARE_CLAUSUM',
ThemingBonusHelp = 'TXT_KEY_THEMING_BONUS_COIMBRA_HELP',
TRVisionBoost = 5
WHERE Type = 'BUILDING_UNIVERSITY_OF_COIMBRA';

UPDATE Language_en_US SET
Text = Replace(Text, 'Age of Discovery', 'Mare Clausum')
WHERE Tag = 'TXT_KEY_BUILDING_UNIVERSITY_OF_COIMBRA_HELP';

INSERT INTO Building_ThemingYieldBonus
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_UNIVERSITY_OF_COIMBRA', 'YIELD_FAITH', 3),
	('BUILDING_UNIVERSITY_OF_COIMBRA', 'YIELD_GREAT_ADMIRAL_POINTS', 3);

INSERT INTO Building_ThemingBonuses
	(BuildingType, Description, Bonus, UniqueEras, RequiresAnyButOwner, AIPriority, SameEra, RequiresOwner)
VALUES
	('BUILDING_UNIVERSITY_OF_COIMBRA', 'TXT_KEY_THEMING_BONUS_OXFORD_UNIVERSITY', 10, 1, 1, 5, 0, 0),
	('BUILDING_UNIVERSITY_OF_COIMBRA', 'TXT_KEY_THEMING_BONUS_COIMBRA_1', 14, 1, 1, 5, 1, 0),
	('BUILDING_UNIVERSITY_OF_COIMBRA', 'TXT_KEY_THEMING_BONUS_COIMBRA_2', 15, 1, 0, 5, 1, 1);

INSERT INTO Language_en_US
	(Tag, Text)
VALUES
	('TXT_KEY_THEMING_BONUS_COIMBRA_HELP', 'To maximize your bonus, make sure the Great Work Slots are filled Works of Writing created by you and from the same Era.'),
	('TXT_KEY_THEMING_BONUS_COIMBRA_1', 'Conimbricenses'),
	('TXT_KEY_THEMING_BONUS_COIMBRA_2', 'Os Lusíadas');

UPDATE Language_en_US SET
Text = Replace(Text, '+3 [ICON_RESEARCH] Science when themed.', '+3 [ICON_RESEARCH] Science, [ICON_PEACE] Faith, and [ICON_GREAT_ADMIRAL] Great Admiral Points when themed.')
WHERE Tag = 'TXT_KEY_BUILDING_UNIVERSITY_OF_COIMBRA_HELP';

INSERT INTO Building_YieldFromTech
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_UNIVERSITY_OF_COIMBRA', 'YIELD_GREAT_ADMIRAL_POINTS', 20);

UPDATE Language_en_US SET
Text = Replace(Text, '+50 [ICON_CULTURE] Culture', '+50 [ICON_CULTURE] Culture and +20 [ICON_GREAT_ADMIRAL] Great Admiral Points')
WHERE Tag = 'TXT_KEY_BUILDING_UNIVERSITY_OF_COIMBRA_HELP';

DELETE FROM Building_UnitCombatProductionModifiersGlobal WHERE BuildingType = 'BUILDING_UNIVERSITY_OF_COIMBRA' AND UnitCombatType = 'UNITCOMBAT_CARAVAN';

DELETE FROM Building_BuildingClassYieldChanges WHERE BuildingType = 'BUILDING_UNIVERSITY_OF_COIMBRA';

INSERT INTO Building_BuildingClassYieldChanges
	(BuildingType,	BuildingClassType,	YieldType,	YieldChange)
SELECT			
	'BUILDING_UNIVERSITY_OF_COIMBRA', BuildingClass,  'YIELD_SCIENCE', 1
FROM Buildings b, Yields y WHERE 
b.Cost = -1 AND b.FaithCost > 0 AND
y.Type IN ('YIELD_SCIENCE', 'YIELD_GOLD', 'YIELD_CULTURE');

UPDATE Language_en_US SET
Text = Replace(Text, 'All Universities gain +3 [ICON_GOLD] Gold.', 
	'+1 [ICON_GOLD] Gold, [ICON_RESEARCH] Science, and [ICON_CULTURE] Culture to all Buildings that [COLOR_CYAN]must[ENDCOLOR] be purchased with [ICON_PEACE] Faith.')
WHERE Tag = 'TXT_KEY_BUILDING_UNIVERSITY_OF_COIMBRA_HELP';

----------------------------------------------------------------
-- bandeirantes changes 
----------------------------------------------------------------
UPDATE UnitPromotions SET
PortraitIndex = 51,
InfluenceFromCombatXpTimes100 = 200
--,BarbarianCombatBonus = 25
WHERE Type = 'PROMOTION_FLAG_BEARER';

DELETE FROM UnitPromotions_YieldFromScouting WHERE PromotionType = 'PROMOTION_FLAG_BEARER';

INSERT INTO UnitPromotions_YieldFromBarbarianKills
	(PromotionType, YieldType, Yield)
VALUES
	('PROMOTION_FLAG_BEARER', 'YIELD_GOLD', 150),
	('PROMOTION_FLAG_BEARER', 'YIELD_PRODUCTION', 150),
	('PROMOTION_FLAG_BEARER', 'YIELD_CULTURE_LOCAL', 150);

-- +25% [ICON_STRENGTH] Combat Strength against Barbarians
UPDATE Language_en_US SET
Text = 'Gain 150% of the [ICON_STRENGTH] Strength of defeated [COLOR_POSITIVE_TEXT]Barbarian Units[ENDCOLOR] as [ICON_GOLD] Gold, [ICON_PRODUCTION] Production, and [ICON_CULTURE_LOCAL] Border Growth Points in the Unit''s origin City.[NEWLINE]2 [ICON_INFLUENCE] Influence with the nearest [ICON_CITY_STATE] City-State for every XP earned in combat.' 
WHERE Tag = 'TXT_KEY_PROMOTION_FLAG_BEARER_HELP';
