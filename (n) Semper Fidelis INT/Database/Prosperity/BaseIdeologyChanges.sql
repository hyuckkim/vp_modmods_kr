-- draft registration
UPDATE Language_ko_KR
SET Text = '[COLOR_POSITIVE_TEXT]Draft Registration[ENDCOLOR]: Units cost -65% [ICON_GOLD] Gold to Purchase. +10% [ICON_SILVER_FIST] Military Supply from [ICON_CITIZEN] Population.'
WHERE Tag = 'TXT_KEY_POLICY_VOLUNTEER_ARMY_HELP';

-- space procurements
-- copy tweaks change 
UPDATE Language_ko_KR
SET Text = 'Space Agency'
WHERE Tag = 'TXT_KEY_POLICY_SPACE_PROCUREMENTS';

UPDATE Language_ko_KR
SET Text = '[COLOR_POSITIVE_TEXT]Space Agency[ENDCOLOR]: Receive 4 [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Spaceship Factories in your Empire. Earn [ICON_GREAT_SCIENTIST] Great Scientists 50% faster. You gain 5x more [ICON_RESEARCH] Science from [ICON_INTERNATIONAL_TRADE] Trade Routes.'
WHERE Tag = 'TXT_KEY_POLICY_SPACE_PROCUREMENTS_HELP';

UPDATE Language_ko_KR
SET Text = 'Monetary Fund'
WHERE Tag = 'TXT_KEY_BUILDING_FINANCE_CENTER';

UPDATE Language_ko_KR
SET Text = 'The International Monetary Fund (IMF) is a major financial agency of the United Nations, and an international financial institution funded by 190 member countries, with headquarters in Washington, D.C. It is regarded as the global lender of last resort to national governments, and a leading supporter of exchange-rate stability. Closely related is the concept of a multilateral development bank, which often have a geographic concentration area for their development objectives. With this geographic and thematic focus, funding for a variety of ventures – often resource-intense infrastructure projects – is provided. Since MDBs have a shareholding structure and are backed by member countries, they tend to profit from favorable loan conditions compared to other banks and can therefore take more risks in their investment strategy.'
WHERE Tag = 'TXT_KEY_CIV5_BUILDINGS_FINANCE_CENTER_TEXT';

-- civil society
-- remove the villages
UPDATE Language_ko_KR
SET Text = Replace(Text, 'Plantations, Camps,', 'Camps, City Tiles,')
WHERE Tag = 'TXT_KEY_POLICY_CIVIL_SOCIETY_HELP';