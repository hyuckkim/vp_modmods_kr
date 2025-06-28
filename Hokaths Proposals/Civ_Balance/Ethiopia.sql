INSERT INTO Trait_GoldenAgeYieldModifiers
	(TraitType, YieldType, Yield)
VALUES
	('TRAIT_BONUS_AGAINST_TECH', 'YIELD_FAITH', 25);

DELETE FROM Building_GoldenAgeYieldMod WHERE BuildingType = 'BUILDING_STELE';

INSERT INTO Building_YieldFromTech
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_STELE', 'YIELD_GOLDEN_AGE_POINTS', 10);

UPDATE Language_en_US
SET Text = 'When you complete a Policy Branch, adopt new Beliefs, or choose your first Ideology, receive 1 [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Technology. +1 [ICON_PEACE] Faith from Strategic Resources. +25% [ICON_PEACE] Faith during [ICON_GOLDEN_AGE] Golden Ages.'
WHERE Tag = 'TXT_KEY_TRAIT_BONUS_AGAINST_TECH';

UPDATE Language_en_US
SET Text = 'Unique Ethiopian replacement for the {TXT_KEY_BUILDING_MONUMENT_DESC}. In addition to the {TXT_KEY_BUILDING_MONUMENT_DESC}''s bonuses, {TXT_KEY_BUILDING_STELE} generates [ICON_PEACE] Faith as well as a {TXT_KEY_BUILDING_SHRINE} can. It also accelerates the pace of [ICON_GOLDEN_AGE] Golden Ages as you discover new Techs, fueling a virtuous cycle together with your Unique Ability.'
WHERE Tag = 'TXT_KEY_BUILDING_STELE_STRATEGY';

UPDATE Language_en_US
SET Text = 'Gain 10 [ICON_GOLDEN_AGE] Golden Age Points when you discover a [COLOR_CYAN]Technology[ENDCOLOR], scaling with Era.'
WHERE Tag = 'TXT_KEY_BUILDING_STELE_HELP';