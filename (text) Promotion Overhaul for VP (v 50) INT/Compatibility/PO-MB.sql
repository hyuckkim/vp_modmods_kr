/*
More Buildings compatibility patch!
0 = Disabled disregarding if its detects More Buildings by Asterix Rage and others.
1 = Enabled if it detects More Buildings by Asterix Rage and others.
2 = Disabled until it detects something! (Default)
*/

INSERT INTO COMMUNITY	
		(Type,			Value)
VALUES	('PO-MB', 		2);

UPDATE COMMUNITY
SET Value = '1'
WHERE Type = 'PO-MB' AND EXISTS (SELECT * FROM UnitPromotions WHERE Type='PROMOTION_SKILLFUL01') AND NOT EXISTS (SELECT * FROM COMMUNITY WHERE Type='PO-MB' AND Value= 0);

-- Main Compatibility Code
	-- updating texts for new promotions
	------------------------------
	-- Promotion Names
	------------------------------
	UPDATE Language_en_US SET Text = '[COLOR:100:155:60:255]Skillfull I[ENDCOLOR]' WHERE Tag = 'TXT_KEY_PROMOTION_SKILLFUL01' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='PO-MB' AND Value= 1);
	UPDATE Language_en_US SET Text = '[COLOR:100:155:60:255]Skillfull II[ENDCOLOR]' WHERE Tag = 'TXT_KEY_PROMOTION_SKILLFUL02' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='PO-MB' AND Value= 1);
	UPDATE Language_en_US SET Text = '[COLOR:100:155:60:255]Skillfull III[ENDCOLOR]' WHERE Tag = 'TXT_KEY_PROMOTION_SKILLFUL03' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='PO-MB' AND Value= 1);
	------------------------------
	-- Promotion Help
	------------------------------
	UPDATE Language_en_US SET Text = '+6%[ICON_STRENGTH]CS.' WHERE Tag = 'TXT_KEY_PROMOTION_SKILLFUL01_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='PO-MB' AND Value= 1);
	UPDATE Language_en_US SET Text = '+12%[ICON_STRENGTH]CS.' WHERE Tag = 'TXT_KEY_PROMOTION_SKILLFUL02_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='PO-MB' AND Value= 1);
	UPDATE Language_en_US SET Text = '+18%[ICON_STRENGTH]CS.' WHERE Tag = 'TXT_KEY_PROMOTION_SKILLFUL03_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='PO-MB' AND Value= 1);
	------------------------------
	-- Pedia Type
	------------------------------
	UPDATE UnitPromotions SET PediaType = 'PEDIA_SHARED' WHERE Type = 'PROMOTION_SKILLFUL01' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='PO-MB' AND Value= 1);
	UPDATE UnitPromotions SET PediaType = 'PEDIA_SHARED' WHERE Type = 'PROMOTION_SKILLFUL02' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='PO-MB' AND Value= 1);
	UPDATE UnitPromotions SET PediaType = 'PEDIA_SHARED' WHERE Type = 'PROMOTION_SKILLFUL03' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='PO-MB' AND Value= 1);