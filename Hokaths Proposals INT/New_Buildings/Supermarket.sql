--------------------------------
-- Language_ko_KR
--------------------------------
UPDATE Language_ko_KR
SET Text = 'Apothecary'
WHERE Tag = 'TXT_KEY_BUILDING_GROCER';

UPDATE Language_ko_KR
SET Text = 'An Apothecary, or Pharmacy, is a type of shop that sells medicinal goods such as drugs, ointments, herbal remedies and dressings for wounds. Shops were maintained by specialists who could dispense advice for how to use the medicines they sold as well as other home remedies. Pharmacies in Medieval and Renaissance Europe were often family businesses, or operated out of local monasteries by nuns, which resulted in a large proportion of pharmacies being run by women.[NEWLINE][NEWLINE]The work of a pharmacist requires a great deal of knowledge and specialized education, which brought status and respectability to the job. The role of pharmacists and apothecaries formed the precursor to the modern disciplines of chemistry and pharmacology.'
WHERE Tag = 'TXT_KEY_CIV5_BUILDINGS_GROCER_TEXT';
------------------------------
-- Text
------------------------------
INSERT INTO Language_ko_KR (Tag, Text)
VALUES	('TXT_KEY_BUILDING_SUPERMARKET',			'Supermarket'),
		('TXT_KEY_BUILDING_SUPERMARKET_TEXT',		'Supermarkets are massive stores that contain a wide variety of food, drinks, and household goods that customers can pick off the shelves themselves. The first self-service Supermarket was opened in Memphis, Tennessee, in 1916, and the idea spread like wildfire throughout North America. The modern supermarket has revolutionized shopping for city-dwellers, drastically lowering the amount of labour and the cost of everyday necessities.'),
		('TXT_KEY_BUILDING_SUPERMARKET_STRATEGY',	'The Supermarket is an Atomic-era Building for growing large cities. Large Gold expenditure can be converted into increased population with ease, and the Yields produced from having a large City Connected to the Capital is further enhanced! Although your City must already be quite developed to build a Supermarket, the rewards are significant!'),
		('TXT_KEY_BUILDING_SUPERMARKET_HELP',		'When you spend [ICON_INVEST] Gold to purchase Units or invest in Buildings in this City, 25% of the cost is converted into [ICON_FOOD] Food. +50% [ICON_GOLD] Gold and [ICON_PRODUCTION] Production from the local [ICON_INDUSTRIAL_CONNECTED] City Connection. Internal [ICON_INTERNATIONAL_TRADE] Trade Routes from this City generate +10 [ICON_FOOD] Food.[NEWLINE][NEWLINE]1 Specialist in this City no longer produces [ICON_HAPPINESS_3] Unhappiness from [ICON_URBANIZATION] Urbanization.[NEWLINE][NEWLINE]Requires an [ICON_INDUSTRIAL_CONNECTED] Industrial City Connection before it can be constructed.');

