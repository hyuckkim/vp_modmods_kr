-- and tech trade at navigation. it's so late atm
UPDATE Language_ko_KR SET
Text = Replace(Text, 'Military Science', 'Navigation')
WHERE Tag IN ('TXT_KEY_DIPLO_TRADE_MAPS_NO_TECH_BOTH', 'TXT_KEY_DIPLO_TRADE_MAPS_NO_TECH_OTHER_PLAYER', 'TXT_KEY_DIPLO_TRADE_MAPS_NO_TECH_PLAYER');