UPDATE Language_ko_KR
SET Text = 'Annual Festivals'
WHERE Tag = 'TXT_KEY_BELIEF_WORLD_CHURCH_SHORT';

-- change order to not have well
UPDATE Language_ko_KR SET
Text = Replace(Text, '+3 [ICON_PRODUCTION] Production for every Mine, Quarry, Lumber Mill, Oil Well,', '+3 [ICON_PRODUCTION] Production for every Mine, Quarry, Lumber Mill,')
WHERE Tag = 'TXT_KEY_POLICY_FIVE_YEAR_PLAN_HELP';