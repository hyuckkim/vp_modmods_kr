DELETE FROM Policy_UnitClassProductionModifiers WHERE PolicyType = 'POLICY_COLLECTIVE_RULE';

UPDATE Policies SET
UnitPurchaseCostModifier = -5
WHERE Type = 'POLICY_COLLECTIVE_RULE';

UPDATE Language_en_US SET
Text = '[COLOR_POSITIVE_TEXT]Organization[ENDCOLOR][NEWLINE][ICON_BULLET]+2 [ICON_PRODUCTION] Production in every City.[NEWLINE][ICON_BULLET]-5% [ICON_GOLD] Gold cost for purchasing Units.[NEWLINE][ICON_BULLET]+1 [ICON_MOVES] Movement for Workers.'
WHERE Tag = 'TXT_KEY_POLICY_COLLECTIVE_RULE_HELP';