INSERT INTO Trait_GoldenAgeYieldModifiers
	(TraitType, YieldType, Yield)
VALUES
	('TRAIT_BONUS_AGAINST_TECH', 'YIELD_FAITH', 25);

DELETE FROM Building_GoldenAgeYieldMod WHERE BuildingType = 'BUILDING_STELE';

INSERT INTO Building_YieldFromTech
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_STELE', 'YIELD_GOLDEN_AGE_POINTS', 5);

UPDATE Language_en_US
SET Text = 'When you complete a Policy Branch, adopt new Beliefs, or choose your first Ideology, receive 1 [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Technology. +1 [ICON_PEACE] Faith from Strategic Resources. +25% [ICON_PEACE] Faith during [ICON_GOLDEN_AGE] Golden Ages.'
WHERE Tag = 'TXT_KEY_TRAIT_BONUS_AGAINST_TECH';

UPDATE Language_en_US
SET Text = 'Unique Ethiopian replacement for the {TXT_KEY_BUILDING_MONUMENT_DESC}. In addition to the {TXT_KEY_BUILDING_MONUMENT_DESC}''s bonuses, {TXT_KEY_BUILDING_STELE} generates [ICON_PEACE] Faith as well as a {TXT_KEY_BUILDING_SHRINE} can. It also accelerates the pace of [ICON_GOLDEN_AGE] Golden Ages as you discover new Techs, fueling a virtuous cycle together with your Unique Ability.'
WHERE Tag = 'TXT_KEY_BUILDING_STELE_STRATEGY';

UPDATE Language_en_US
SET Text = 'Gain 5 [ICON_GOLDEN_AGE] Golden Age Points when you discover a [COLOR_CYAN]Technology[ENDCOLOR], scaling with Era.'
WHERE Tag = 'TXT_KEY_BUILDING_STELE_HELP';

----------------------
-- 4UC change
----------------------
UPDATE Builds SET
Time = 600,
PrereqTech = 'TECH_MINING'
WHERE Type IN ('BUILD_ETHIOPIA_MONOLITHIC_CHURCH_HILL', 'BUILD_ETHIOPIA_MONOLITHIC_CHURCH_STONE');

DELETE FROM Improvement_Yields 
WHERE YieldType = 'YIELD_PRODUCTION'
AND ImprovementType IN ('IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_HILL', 'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_STONE');

UPDATE Policy_ImprovementYieldChanges SET
Yield = 2 
WHERE ImprovementType IN ('IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_HILL', 'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_STONE');

UPDATE Policy_ImprovementYieldChanges SET
YieldType = 'YIELD_SCIENCE' 
WHERE 
PolicyType IN ('POLICY_PIETY_FINISHER', 'POLICY_PATRONAGE_FINISHER', 'POLICY_AESTHETICS_FINISHER') AND
ImprovementType IN ('IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_HILL', 'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_STONE');

UPDATE Policy_ImprovementYieldChanges SET
YieldType = 'YIELD_FAITH' 
WHERE 
PolicyType IN ('POLICY_RATIONALISM_FINISHER', 'POLICY_EXPLORATION_FINISHER', 'POLICY_COMMERCE_FINISHER') AND
ImprovementType IN ('IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_HILL', 'IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_STONE');

DELETE FROM Building_ImprovementYieldChanges
WHERE BuildingType = 'BUILDING_ETHIOPIA_MONOLITHIC_CHURCH_FOUNDER'
AND YieldType = 'YIELD_CULTURE';

UPDATE Language_en_US SET
Text = Replace(Text, '+1 [ICON_CULTURE] for every Ancient Policy Branch', '+2 [ICON_CULTURE] for every Ancient Policy Branch')
WHERE Tag IN ('TXT_KEY_IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_TEXT', 'TXT_KEY_IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_HELP');

UPDATE Language_en_US SET
Text = Replace(Text, '+1 [ICON_PEACE] for every Medieval Policy Branch', '+2 [ICON_RESEARCH] for every Medieval Policy Branch')
WHERE Tag IN ('TXT_KEY_IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_TEXT', 'TXT_KEY_IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_HELP');

UPDATE Language_en_US SET
Text = Replace(Text, '+1 [ICON_RESEARCH] for every Industrial Policy Branch', '+2 [ICON_PEACE] for every Industrial Policy Branch')
WHERE Tag IN ('TXT_KEY_IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_TEXT', 'TXT_KEY_IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_HELP');

UPDATE Language_en_US SET
Text = Replace(Text, '+1 [ICON_CULTURE] and [ICON_PRODUCTION] for founding a Religion', '+1 [ICON_PRODUCTION] for founding a Religion')
WHERE Tag IN ('TXT_KEY_IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_TEXT', 'TXT_KEY_IMPROVEMENT_ETHIOPIA_MONOLITHIC_CHURCH_HELP');

