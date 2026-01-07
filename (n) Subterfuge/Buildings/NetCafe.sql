------------------------
-- if netcafe is in, give it spy points
-------------------------
UPDATE Buildings SET ExtraSpies = 2 WHERE Type = 'BUILDING_NET_CAFE' AND EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_NET_CAFE');

/*
UPDATE Language_en_US SET
Text = Replace(Text, 'Receive 50 [ICON_RESEARCH] Science when you perform a Spy Mission, scaling with Era.', 'Receive 20 [ICON_SPY_POINT] Spy Points. Receive 50 [ICON_RESEARCH] Science when you perform a Spy Mission, scaling with Era.')
WHERE Tag = 'TXT_KEY_BUILDING_NET_CAFE_HELP';
*/

