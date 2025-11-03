------------------------
-- if netcafe is in, give it spy points
-------------------------
UPDATE Language_ko_KR SET
Text = Replace(Text, 'Receive 50 [ICON_RESEARCH] Science when you perform a Spy Mission, scaling with Era.', 'Receive 20 [ICON_VP_SPY_POINTS] Spy Points. Receive 50 [ICON_RESEARCH] Science when you perform a Spy Mission, scaling with Era.')
WHERE Tag = 'TXT_KEY_BUILDING_NET_CAFE_HELP';