-- Harbor
UPDATE Language_en_US
SET Text = Replace(Text, '[ICON_CARGO_SHIP] Sea Trade Routes gain +50% Range', '[ICON_CARGO_SHIP] Sea Trade Routes gain +25% Range')
WHERE Tag IN (SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_HARBOR');

-- strong compatibility
UPDATE Language_en_US
SET Text = 'City gains +1 [ICON_RESEARCH] Science for every Mountain within the workable tiles. Atolls worked by the City gain +2 [ICON_RESEARCH] Science. +1 [ICON_PEACE] Faith from every Building in the City that must be purchased with [ICON_PEACE] Faith.[NEWLINE][NEWLINE][ICON_CARGO_SHIP] Sea Trade Routes gain +25% Range. Harbors in the City gain +1 [ICON_RESEARCH] Science and [ICON_GOLDEN_AGE] Golden Age Point.'
WHERE Tag = 'TXT_KEY_BUILDING_OBSERVATORY_HELP';

UPDATE Language_en_US
SET Text = 'The Observatory increases [ICON_RESEARCH] Science output, especially for Cities near lots of Mountains or with access to Atolls. You might also consider it for your Coastal Cities, especially those running Sea Trade Routes. Finally if you are running a religious Empire, stargazing will reinforce your Faith.'
WHERE Tag = 'TXT_KEY_BUILDING_OBSERVATORY_STRATEGY';
