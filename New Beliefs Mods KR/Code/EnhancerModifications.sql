--change Orthodoxy to Ecumenism
UPDATE Language_ko_KR
SET Text = '[ICON_RELIGION] Religion spreads 20% faster (50% with Printing Press), and to Cities 20% further away. Holy City gains +5 [ICON_PEACE] Faith and [ICON_GOLDEN_AGE] Golden Age Points.'
WHERE Tag = 'TXT_KEY_BELIEF_HOLY_ORDER';

UPDATE Language_ko_KR
SET Text = '세계 교회주의'
WHERE Tag = 'TXT_KEY_BELIEF_HOLY_ORDER_SHORT';
--Remove Policy Reduction from Prophecy
UPDATE Language_ko_KR
SET Text = '성자'
WHERE Tag = 'TXT_KEY_BELIEF_MESSIAH_SHORT';

UPDATE Language_ko_KR
SET Text = 'Prophets of this [ICON_RELIGION] Religion 25% stronger, cost 25% less [ICON_PEACE] Faith. +3 to base Holy Site yields. If this is the majority Religion, Follower reduction from rival [ICON_INQUISITOR] Inquisitors and [ICON_PROPHET] Prophets halved.'
WHERE Tag = 'TXT_KEY_BELIEF_MESSIAH';

--rework Symbolism
UPDATE Language_ko_KR
SET Text = 'Holy City gains +2 [ICON_GREAT_WORK] Great Artist, Musician, and Writer Points per turn. Reduce minimum Policy requirement for Wonders by 1 for every 8 Cities, and +1 [ICON_HAPPINESS_1] Happiness for every 4 Cities following this Religion (max 24 Cities).'
WHERE Tag = 'TXT_KEY_BELIEF_ITINERANT_PREACHERS';