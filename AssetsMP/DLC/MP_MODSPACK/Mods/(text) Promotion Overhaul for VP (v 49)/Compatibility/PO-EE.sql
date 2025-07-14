/*
EE compatibility patch!
0 = Disabled disregarding if its detects EE by Infixo and Padre.
1 = Enabled if it detects the EE by Infixo and Padre..
2 = Disabled until it detects something! (Default)
*/

INSERT INTO COMMUNITY	
		(Type,			Value)
VALUES	('PO-EE', 		2);

UPDATE COMMUNITY
SET Value = '1'
WHERE Type = 'PO-EE' AND EXISTS (SELECT * FROM UnitPromotions WHERE Type='PROMOTION_2HANDER') AND NOT EXISTS (SELECT * FROM COMMUNITY WHERE Type='PO-EE' AND Value= 0);

-- Main Compatibility Code
	-- updating texts for new promotions
	------------------------------
	-- Promotion Names
	------------------------------
	UPDATE Language_en_US SET Text = '[COLOR:100:155:60:255]Two Hander[ENDCOLOR]' WHERE Tag = 'TXT_KEY_PROMOTION_2HANDER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='PO-EE' AND Value= 1);
	UPDATE Language_en_US SET Text = '[COLOR:100:155:60:255]Drydock[ENDCOLOR]' WHERE Tag = 'TXT_KEY_PROMOTION_EE_DRYDOCK' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='PO-EE' AND Value= 1);
	UPDATE Language_en_US SET Text = '[COLOR:100:155:60:255]Flagship[ENDCOLOR]' WHERE Tag = 'TXT_KEY_PROMOTION_EE_FIRST_RATE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='PO-EE' AND Value= 1);
	UPDATE Language_en_US SET Text = '[COLOR:100:155:60:255]Adventurer[ENDCOLOR]' WHERE Tag = 'TXT_KEY_PROMOTION_EE_ADVENTURER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='PO-EE' AND Value= 1);
	UPDATE Language_en_US SET Text = '[COLOR:100:155:60:255]Fasil Ghebbi[ENDCOLOR]' WHERE Tag = 'TXT_KEY_PROMOTION_EE_FASIL_GHEBBI' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='PO-EE' AND Value= 1);
	UPDATE Language_en_US SET Text = '[COLOR:100:155:60:255]Light Like a Feather[ENDCOLOR]' WHERE Tag = 'TXT_KEY_PROMOTION_CBOEE_SKIRMISH' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='PO-EE' AND Value= 1);
	------------------------------
	-- Promotion Help
	------------------------------
	UPDATE Language_en_US SET Text = '+33%[ICON_STRENGTH]Offensive CS [COLOR:255:230:85:255]vs Spear-line Units[ENDCOLOR]. [COLOR_NEGATIVE_TEXT]Lost after unit upgrade[ENDCOLOR].' WHERE Tag = 'TXT_KEY_PROMOTION_2HANDER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='PO-EE' AND Value= 1);
	UPDATE Language_en_US SET Text = '+1[ICON_MOVES]Movement Point. +5% [ICON_STRENGTH] Combat Strength. +5 HP Heal [COLOR:255:230:85:255]on Heal inside Friendly Territory[ENDCOLOR]. [COLOR_NEGATIVE_TEXT]Promotion lasts 1 turn.[ENDCOLOR]' WHERE Tag = 'TXT_KEY_PROMOTION_EE_DRYDOCK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='PO-EE' AND Value= 1);
	UPDATE Language_en_US SET Text = '+20%[ICON_STRENGTH]Defensive CS [COLOR:255:230:85:255]to all Friendly Naval Units within 1 tile[ENDCOLOR].' WHERE Tag = 'TXT_KEY_PROMOTION_EE_FIRST_RATE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='PO-EE' AND Value= 1);
	UPDATE Language_en_US SET Text = '+1[ICON_MOVES]Movement Point. +2 [ICON_VP_VISION] Sight if [COLOR:255:230:85:255]Embarked[ENDCOLOR].' WHERE Tag = 'TXT_KEY_PROMOTION_EE_ADVENTURER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='PO-EE' AND Value= 1);
	UPDATE Language_en_US SET Text = '+25%[ICON_STRENGTH]CS if unit [COLOR:255:230:85:255]is in range of the City with Fasil Ghebbi[ENDCOLOR].' WHERE Tag = 'TXT_KEY_PROMOTION_EE_FASIL_GHEBBI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='PO-EE' AND Value= 1);
	UPDATE Language_en_US SET Text = 'Double[ICON_MOVES]Movement [COLOR:255:230:85:255]on Hill, Forest and Jungle[ENDCOLOR]. [COLOR_NEGATIVE_TEXT]Lost after unit upgrade[ENDCOLOR].' WHERE Tag = 'TXT_KEY_PROMOTION_CBOEE_SKIRMISH_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='PO-EE' AND Value= 1);
	------------------------------
	-- Pedia Cathegory
	------------------------------
	UPDATE UnitPromotions SET PediaType = 'PEDIA_RANGED' WHERE Type = 'PROMOTION_CBOEE_SKIRMISH';
	