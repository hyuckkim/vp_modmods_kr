--------------------
-- Industry
--------------------
UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Industry[ENDCOLOR] augments City [ICON_PRODUCTION][ICON_GOLD][ICON_RESEARCH][ICON_CULTURE] Yields by boosting common Improvements, Buildings, and Resources. It uniquely increases the value of [ICON_INVEST] Investments and Purchases, and offers several benefits to [ICON_GREAT_MERCHANT] Great Merchants.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Adopting Industry grants:[ENDCOLOR][NEWLINE][ICON_BULLET]+100% [ICON_PRODUCTION] Production towards Coaling Stations.[NEWLINE][ICON_BULLET]Earn [ICON_GREAT_MERCHANT] Great Merchants 50% faster.[NEWLINE][ICON_BULLET]-10% [ICON_INVEST] Gold needed for purchases.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Each Industry policy unlocked grants:[ENDCOLOR][NEWLINE][ICON_BULLET]-5% [ICON_INVEST] Gold needed for purchases.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Adopting all Policies in Industry grants:[ENDCOLOR][NEWLINE][ICON_BULLET]Unlocks building [COLOR_POSITIVE_TEXT]Broadway[ENDCOLOR].[NEWLINE][ICON_BULLET]+3 [ICON_HAPPINESS_1] Happiness per unique owned Luxury Resource.[NEWLINE][ICON_BULLET]+2 [ICON_RESEARCH] Science and +1 [ICON_PRODUCTION] Production from Bonus Resources.[NEWLINE][ICON_BULLET]Allows for the purchase of [ICON_GREAT_MERCHANT] Great Merchants with [ICON_PEACE] Faith starting in the Industrial Era.'
WHERE Tag = 'TXT_KEY_POLICY_BRANCH_COMMERCE_HELP';

UPDATE Language_en_US
SET Text = 'Division of Labor'
WHERE Tag = 'TXT_KEY_POLICY_TRADE_UNIONS';

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Division of Labor[ENDCOLOR][NEWLINE][ICON_BULLET]+1 [ICON_PRODUCTION] Production and [ICON_CULTURE] Culture from Armories, Workshops, Windmills, Factories, and Coaling Stations.[NEWLINE][ICON_BULLET][ICON_CONNECTED] City Connections generate +4 [ICON_PRODUCTION] Production and [ICON_GOLD] Gold.'
WHERE Tag = 'TXT_KEY_POLICY_TRADE_UNIONS_HELP';

UPDATE Language_en_US
SET Text = 'Subsidies'
WHERE Tag = 'TXT_KEY_POLICY_CARAVANS';

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Subsidies[ENDCOLOR][NEWLINE][ICON_BULLET]-50% [ICON_GOLD] Route Maintenance.[NEWLINE][ICON_BULLET]Cities earn +15 [ICON_RESEARCH] Science when they construct Buildings, scaling with Era.[NEWLINE][ICON_BULLET]+1 [ICON_HAPPINESS_1] Happiness from Windmills.'
WHERE Tag = 'TXT_KEY_POLICY_CARAVANS_HELP';

UPDATE Language_en_US
SET Text = 'A subsidy is any financial aid provided by a government to a producer or seller of a good or service that is designed to increase the competitiveness of a particular industry firm or entire industry. An employment subsidy can protect jobs in a crisis, a transport subsidy can open up new transport routes, and an export subsidy can be used to pursue a policy of mercantilism.'
WHERE Tag = 'TXT_KEY_POLICY_CARAVANS_TEXT';

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Mercantilism[ENDCOLOR][NEWLINE][ICON_BULLET]+1 [ICON_RESEARCH] Science and [ICON_GOLD] Gold from Caravansaries, Customs Houses, Banks, Hotels, and Stock Exchanges.[NEWLINE][ICON_BULLET]+2 [ICON_INTERNATIONAL_TRADE] Trade Routes.'
WHERE Tag = 'TXT_KEY_POLICY_MERCANTILISM_HELP';

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Entrepreneurship[ENDCOLOR][NEWLINE][ICON_BULLET]+2 [ICON_PRODUCTION] Production and +1 [ICON_GOLD] Gold from every Mine, Farm, and Lumber Mill.[NEWLINE][ICON_BULLET]+3 [ICON_FOOD] Food and +2 [ICON_CULTURE] Culture from every Village and Town.'
WHERE Tag = 'TXT_KEY_POLICY_ENTREPRENEURSHIP_HELP';

UPDATE Language_en_US
SET Text = 'Gold Standard'
WHERE Tag = 'TXT_KEY_POLICY_PROTECTIONISM';

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Gold Standard[ENDCOLOR][NEWLINE][ICON_BULLET][ICON_INVEST] Gold investments in Buildings reduce their [ICON_PRODUCTION] Production cost by an additional 10%.[NEWLINE][ICON_BULLET]+10% [ICON_GOLD] Gold and [ICON_CULTURE] Culture during "[COLOR_POSITIVE_TEXT]We Love the King Day[ENDCOLOR]".[NEWLINE][ICON_BULLET]+25% Instant Yields from [ICON_GREAT_MERCHANT] Great Merchants.'
WHERE Tag = 'TXT_KEY_POLICY_PROTECTIONISM_HELP';

UPDATE Language_en_US
SET Text = 'Throughout history, precious metals have formed the basis of (commodity) money. As large sums became traded more commonly, representative money in the form of notes and certificates became the main medium of exchange. In this context, a gold standard is a monetary system in which representative money is exchangable for a fixed quantity of gold bullion. This was done to maintain stable exchange rates and limit inflation, although these effects are not guaranteed and the choice comes with significant monetary policy implications. The gold standard was the basis for the international monetary system from the 1870s to the early 1920s, and intermittently until 1971 when the world''s reserve currency, the US dollar, terminated its convertibility policy.'
WHERE Tag = 'TXT_KEY_POLICY_PROTECTIONISM_TEXT';
