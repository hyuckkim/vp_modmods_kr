-- Sacred Sites goes Wider, loses World Wonder bonus
UPDATE Language_ko_KR
SET Text = 'Natural Wonders, Temples, Hotels and all buildings purchased with Faith provide +4 [ICON_TOURISM] Tourism each. The Grand Temple and Hermitage provide +5 [ICON_CULTURE] Culture and +5 [ICON_TOURISM] Tourism.'
WHERE Tag = 'TXT_KEY_BELIEF_SACRED_SITES';

-- Global Commandments loses its spread ability
UPDATE Language_ko_KR
SET Text = '+10 [ICON_RESEARCH] Science, [ICON_CULTURE] Culture, [ICON_GOLD] Gold, [ICON_PEACE] Faith, and [ICON_GOLDEN_AGE] Golden Age Points per turn while the Host of the World Congress. Receive 150 of these yields instantly when you pass a Proposal. Bonuses scale with Era.'
WHERE Tag = 'TXT_KEY_BELIEF_CHARITABLE_MISSIONS';

-- Faith of the Masses gains bonus to World Wonders
UPDATE Language_ko_KR
SET Text = 'May build Amphitheaters, Opera Houses, Museums, Broadcast Towers, and Stadiums with [ICON_PEACE] Faith. These buildings and all World Wonders produce +2 [ICON_CULTURE] Culture each.'
WHERE Tag = 'TXT_KEY_BELIEF_UNDERGROUND_SECT';