/*
EAW compatibility patch!
0 = Disabled disregarding if its detects EAW by Infixo and Asterix Rage.
1 = Enabled if it detects the EAW by Infixo and Asterix Rage.
2 = Disabled until it detects something! (Default)
*/

INSERT INTO COMMUNITY	
		(Type,			Value)
VALUES	('PO-EAW', 		2);

UPDATE COMMUNITY
SET Value = '1'
WHERE Type = 'PO-EAW' AND EXISTS (SELECT * FROM UnitPromotions WHERE Type='PROMOTION_JET_DOM') AND NOT EXISTS (SELECT * FROM COMMUNITY WHERE Type='PO-EAW' AND Value= 0);

-- Main Compatibility Code
	-- updating texts for new promotions
	------------------------------
	-- Promotion Names
	------------------------------
	UPDATE Language_en_US SET Text = '[COLOR:100:155:60:255]Shooting Star[ENDCOLOR]' WHERE Tag = 'TXT_KEY_PROMOTION_JET_DOM' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='PO-EAW' AND Value= 1);
	UPDATE Language_en_US SET Text = '[COLOR:100:155:60:255]Light Air Cover[ENDCOLOR]' WHERE Tag = 'TXT_KEY_PROMOTION_ANTIAIR_LIGHT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='PO-EAW' AND Value= 1);
	------------------------------
	-- Promotion Help
	------------------------------
	UPDATE Language_en_US SET Text = '+10%[ICON_RANGE_STRENGTH]RCS. +10%[ICON_STRENGTH]CS [COLOR:255:230:85:255]vs Fighters[ENDCOLOR]. -10[ICON_STRENGTH]Damage Taken [COLOR:255:230:85:255]from[ICON_RELIGION_PANTHEON]Interception[ENDCOLOR].' WHERE Tag = 'TXT_KEY_PROMOTION_JET_DOM_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='PO-EAW' AND Value= 1);
	UPDATE Language_en_US SET Text = 'Unit inflicts 10 Damage [COLOR:255:230:85:255]to Attacking Air Unit[ENDCOLOR]' WHERE Tag = 'TXT_KEY_PROMOTION_ANTIAIR_LIGHT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='PO-EAW' AND Value= 1);
	------------------------------
	-- Pedia Entry
	------------------------------
	UPDATE UnitPromotions SET PediaEntry = 'TXT_KEY_PROMOTION_JET_DOM' WHERE Type = 'PROMOTION_JET_DOM' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='PO-EAW' AND Value= 1);
	UPDATE UnitPromotions SET PediaEntry = 'TXT_KEY_PROMOTION_ANTIAIR_LIGHT' WHERE Type = 'PROMOTION_ANTIAIR_LIGHT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='PO-EAW' AND Value= 1);