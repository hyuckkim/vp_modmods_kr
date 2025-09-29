DELETE FROM Policy_UnitClassProductionModifiers WHERE PolicyType = 'POLICY_COLLECTIVE_RULE';

UPDATE Policies SET
UnitPurchaseCostModifier = -5
WHERE Type = 'POLICY_COLLECTIVE_RULE';

UPDATE Language_en_US SET
Text = '[COLOR_POSITIVE_TEXT]Organization[ENDCOLOR][NEWLINE][ICON_BULLET]+2 [ICON_PRODUCTION] Production in every City.[NEWLINE][ICON_BULLET]-5% [ICON_GOLD] Gold cost for purchasing Units.[NEWLINE][ICON_BULLET]+1 [ICON_MOVES] Movement for Workers.'
WHERE Tag = 'TXT_KEY_POLICY_COLLECTIVE_RULE_HELP';

UPDATE Policies
SET
	HappinessPerXPopulationGlobal = 0
WHERE Type = 'POLICY_REPRESENTATION';

INSERT INTO Policy_YieldChangeTradeRoute
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_REPRESENTATION', 'YIELD_PRODUCTION', 1),
	('POLICY_REPRESENTATION', 'YIELD_GOLD', 1),
	('POLICY_REPRESENTATION', 'YIELD_GOLDEN_AGE_POINTS', 1);

UPDATE Language_en_US
SET Text = Replace(Text, '[ICON_BULLET]+1 [ICON_HAPPINESS_1] Happiness in every City and +1 [ICON_HAPPINESS_1] Happiness for every 15 [ICON_CITIZEN] Citizens in a City.', '[ICON_BULLET]+1 [ICON_PRODUCTION] Production, [ICON_GOLD] Gold, and [ICON_GOLDEN_AGE] Golden Age Point from [ICON_CONNECTED] City Connections.[NEWLINE][ICON_BULLET]+1 [ICON_HAPPINESS_1] Happiness in every City.')
WHERE Tag = 'TXT_KEY_POLICY_REPRESENTATION_HELP';