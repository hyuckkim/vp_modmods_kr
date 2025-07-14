UPDATE Policies SET
PortraitIndex = 22
WHERE Type = 'POLICY_MILITARY_TRADITION';

UPDATE Policies SET
PortraitIndex = 21
WHERE Type = 'POLICY_MILITARY_CASTE';

DELETE FROM Policy_CityYieldChanges WHERE PolicyType = 'POLICY_HONOR';

INSERT INTO Policy_YieldPerCityOverStrengthThreshold
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_MILITARY_TRADITION', 'YIELD_PRODUCTION', 2);

-- military caste

INSERT INTO Policy_YieldFromXMilitaryUnits
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_MILITARY_CASTE', 'YIELD_PRODUCTION', 10);

INSERT INTO Policy_ResourceYieldChanges
	(PolicyType, ResourceType, YieldType, Yield)
SELECT
	'POLICY_MILITARY_CASTE', Type, 'YIELD_PRODUCTION', 1
FROM Resources WHERE ResourceUsage = 1 UNION ALL
SELECT
	'POLICY_MILITARY_CASTE', Type, 'YIELD_CULTURE_LOCAL', 2
FROM Resources WHERE ResourceUsage = 1;

UPDATE Language_en_US
SET Text = Replace(Text, '[ICON_WAR]', '[ICON_SILVER_FIST]')
WHERE Tag = 'TXT_KEY_POLICY_MILITARY_CASTE_HELP';

UPDATE Language_en_US
SET Text = Replace(Text, '+1 [ICON_PRODUCTION] Production in every City for every 10 Military Units in Empire.', '+1 [ICON_PRODUCTION] Production and +2 [ICON_CULTURE_LOCAL] Border Growth Points from Strategic Resources.')
WHERE Tag = 'TXT_KEY_POLICY_MILITARY_CASTE_HELP';

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Militarism[ENDCOLOR][NEWLINE][ICON_BULLET]+1 [ICON_HAPPINESS_1] Happiness, +2 [ICON_PRODUCTION] Production, and +2 [ICON_CULTURE] Culture in Cities with at least 10 [ICON_STRENGTH] Strength.[NEWLINE][ICON_BULLET]-15% [ICON_GOLD] Unit Maintenance.[NEWLINE][ICON_BULLET]-50% [ICON_GOLD] Route Maintenance.'
WHERE Tag = 'TXT_KEY_POLICY_MILITARY_TRADITION_HELP';

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Authority[ENDCOLOR] prepares in the [COLOR_CYAN]early game[ENDCOLOR] to support and weaponize a standing [ICON_SILVER_FIST] Military. Gains significant [ICON_FOOD][ICON_PRODUCTION][ICON_GOLD][ICON_RESEARCH] yields [COLOR_CYAN]throughout the game[ENDCOLOR] from expanding [ICON_CULTURE_LOCAL] Borders and killing Units in [ICON_WAR] War.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Adopting Authority grants:[ENDCOLOR][NEWLINE][ICON_BULLET]+25% combat bonus VS Barbarians and receive announcements when Barbarian Camps spawn in revealed territory.[NEWLINE][ICON_BULLET]Receive 25 [ICON_CULTURE] Culture when you clear Barbarian Camps, scaling with Era.[NEWLINE][ICON_BULLET]Receive [ICON_RESEARCH] Science and [ICON_CULTURE] Culture when you kill a Unit equal to 50% of its [ICON_STRENGTH] Strength.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Each Authority policy unlocked grants:[ENDCOLOR][NEWLINE][ICON_BULLET]Receive [ICON_RESEARCH] Science and [ICON_CULTURE] Culture when you kill a Unit equal to 10% of its [ICON_STRENGTH] Strength.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Adopting all policies in Authority grants:[ENDCOLOR][NEWLINE][ICON_BULLET]Unlocks building [COLOR_POSITIVE_TEXT]Alhambra[ENDCOLOR].[NEWLINE][ICON_BULLET]Allows the purchasing of [COLOR_YELLOW]Free Companies[ENDCOLOR], [COLOR_YELLOW]Foreign Legions[ENDCOLOR], and [COLOR_YELLOW]Mercenaries[ENDCOLOR] as their prerequisite technologies are researched.[NEWLINE][ICON_BULLET]Allows for the purchase of [ICON_GREAT_GENERAL] Great Generals with [ICON_PEACE] Faith starting in the Industrial Era.'
WHERE Tag = 'TXT_KEY_POLICY_BRANCH_HONOR_HELP';
