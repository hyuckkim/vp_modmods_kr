----------------------------------------------------
-- 텍스트 (ko_KR)
----------------------------------------------------
INSERT INTO Language_ko_KR (Tag, Text)
VALUES ('TXT_KEY_UNIT_TORPEDO', 'Torpedo Boat');

-- Pedia: Historical Info (bottom)
INSERT INTO Language_ko_KR (Tag, Text)
VALUES ('TXT_KEY_UNIT_TORPEDO_PEDIA', 'A Torpedo Boat is a relatively small, nimble vessels originally equipped with explosive spar torpedoes, later designs utilize self-propelled torpedoes, and can devastate cumbersome fleets.');

-- Pedia: Strategy (middle)
INSERT INTO Language_ko_KR (Tag, Text)
VALUES ('TXT_KEY_UNIT_TORPEDO_STRATEGY', 'The Torpedo Boat is a high-speed attack boat used primarily on coastal tiles.');

-- Pedia: Game Info (top)
INSERT INTO Language_ko_KR (Tag, Text)
VALUES ('TXT_KEY_UNIT_TORPEDO_HELP', 'The Torpedo Boat is a vigilant defender of the high seas. Fast and deadly is essential for naval sorties.');

-------------------------NAVAL_BONUS-----------------------------------------------------
UPDATE Language_ko_KR SET Text = 'Naval Ambush' WHERE Tag = 'TXT_KEY_PROMOTION_NAVAL_BONUS';
UPDATE Language_ko_KR SET Text = '+25% [ICON_STRENGTH] Combat Strength VS [COLOR_POSITIVE_TEXT]Naval Ranged Units[ENDCOLOR].[NEWLINE]+10% [ICON_STRENGTH] Combat Strength when attacking Units in [COLOR_POSITIVE_TEXT]Coastal Tiles[ENDCOLOR].[NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]Lost on Upgrade.[ENDCOLOR]' WHERE Tag = 'TXT_KEY_PROMOTION_NAVAL_BONUS_HELP';
  
INSERT INTO Language_ko_KR (Tag, Text)
VALUES
    ('TXT_KEY_PROMOTION_COAST_GUARD_1', 'Patrol I'),
    ('TXT_KEY_PROMOTION_COAST_GUARD_1_HELP', '+10% [ICON_STRENGTH] Combat Strength when attacking [COLOR_POSITIVE_TEXT]Inside of Friendly Territory[ENDCOLOR].[NEWLINE][COLOR_NEGATIVE_TEXT]Lost on Upgrade.[ENDCOLOR]');

----------------------------------------------------
-- MELEE PROMO 
----------------------------------------------------
INSERT INTO Language_ko_KR (Tag, Text)
VALUES
    ('TXT_KEY_PROMOTION_CONVOY', 'Convoy'),
    ('TXT_KEY_PROMOTION_CONVOY_HELP', '+15% [ICON_STRENGTH] Combat Strength if [COLOR_POSITIVE_TEXT]within 2 tiles of Owned Cargo Ship Unit[ENDCOLOR].[NEWLINE]+5% [ICON_STRENGTH] Combat Strength per [COLOR_POSITIVE_TEXT]Adjacent Owned Naval Melee Units[ENDCOLOR].
	[NEWLINE][COLOR_POSITIVE_TEXT]Reveal Invisible Submarines[ENDCOLOR] within [ICON_VP_VISION] Sight Range.[NEWLINE]-1 [ICON_VP_VISION] [COLOR_NEGATIVE_TEXT]Sight[ENDCOLOR].'); 


----------------------------------------------------
-- ANTI SUB 
----------------------------------------------------
-- Rename silent Hunter, Invisible and See Invisible
-- See Invisible JUST FREE  

UPDATE Language_ko_KR SET Text = 'Torpedo Attack' WHERE Tag = 'TXT_KEY_PROMOTION_SILENT_HUNTER';
UPDATE Language_ko_KR SET Text = 'Sonar' WHERE Tag = 'TXT_KEY_PROMOTION_SEE_INVISIBLE_SUBMARINE';
UPDATE Language_ko_KR SET Text = 'Silent Hunter' WHERE Tag = 'TXT_KEY_PROMOTION_INVISIBLE_SUBMARINE';
INSERT INTO Language_ko_KR
			(Tag,															Text)
VALUES		('TXT_KEY_PROMOTION_INVISIBLE_SUBMARINE_HELP',	'Unit [COLOR_POSITIVE_TEXT]is Invisible[ENDCOLOR] when not adjacent to an Enemy Units without special ability.');

----------------------------------------------------------------------------------------------------------------------------
-- Naval Raider promotion tree drawn using ASCIIFlow
--
--                              ┌───► Commerce Raider
--                              │
--                              ├───► Minelayer
--                              │
--                              ├───► Interdictor   ┌───► Night Attack
--                              │                   │
-- Torpedo I ──┬──► Torpedo II ─┴───► Torpedo III ──┼───► Predator
--             │                                    │
--             │                                    ├───► Infiltrators
--             │                                    │
--             └──► Navigator I ───► Navigator II   └───► End Around
--  
----------------------------------------------------------------------------------------------------------------------------   
-- Extra promotion lines for Submarine
--
-- Dive I ────► Dive II
--
-- Supply ────► Wolfpack                                             
----------------------------------------------------------------------------------------------------------------------------

-- Add plague promo
UPDATE Language_ko_KR SET Text = 'Lost Contact' WHERE Tag = 'TXT_KEY_PROMOTION_SIGHT_PENALTY';
UPDATE Language_ko_KR SET Text = '-1 [ICON_VP_VISION] Sight.[NEWLINE]-2 [ICON_MOVES] Movement.[NEWLINE]Lasts for 1 turn.' WHERE Tag = 'TXT_KEY_PROMOTION_SIGHT_PENALTY_HELP';

--Change Hunter Killer
UPDATE Language_ko_KR SET Text = 'Inflict the [COLOR_POSITIVE_TEXT]{TXT_KEY_PROMOTION_SIGHT_PENALTY}[ENDCOLOR] status on Enemy Naval Units when attacking, reducing their [ICON_MOVES] Movement by 2 and [ICON_VP_VISION] Sight by 1 for 1 Turn.
[NEWLINE]Deal [COLOR_POSITIVE_TEXT]10 Damage[ENDCOLOR] to all Enemy Units [COLOR_POSITIVE_TEXT]adjacent to[ENDCOLOR] the target Unit (within [ICON_RANGE_STRENGTH] Range) when attacking.
[NEWLINE]This Damage ignores damage reduction, but does not affect Units in [COLOR_NEGATIVE_TEXT]Cities[ENDCOLOR] and [COLOR_NEGATIVE_TEXT]Fortifications[ENDCOLOR].' WHERE Tag = 'TXT_KEY_PROMOTION_HUNTER_KILLER_HELP';
UPDATE Language_ko_KR SET Text = 'Night Attack' WHERE Tag = 'TXT_KEY_PROMOTION_HUNTER_KILLER';

-- Change Periscope Depth
UPDATE Language_ko_KR SET Text = 'Dive I' WHERE Tag = 'TXT_KEY_PROMOTION_PERISCOPE_DEPTH';
UPDATE Language_ko_KR SET Text = '-3 Damage from all sources.[NEWLINE]Withdraw from Melee Attack if there is an open tile behind this Unit, once per turn.' WHERE Tag = 'TXT_KEY_PROMOTION_PERISCOPE_DEPTH_HELP';

------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Language_ko_KR (Tag, Text)
VALUES
    ('TXT_KEY_PROMOTION_DIVE', 'Dive II'),
    ('TXT_KEY_PROMOTION_DIVE_HELP', '-3 Damage from all sources.[NEWLINE]Immune to the [COLOR_POSITIVE_TEXT]Boarded[ENDCOLOR] status.');

--------------------------MORE PROMO--------------------------------------------
INSERT INTO Language_ko_KR (Tag, Text)
VALUES
    ('TXT_KEY_PROMOTION_INTERDICTOR', 'Interdictor'),
    ('TXT_KEY_PROMOTION_INTERDICTOR_HELP', '+50% [ICON_STRENGTH] Combat Strength when attacking [COLOR_POSITIVE_TEXT]Embarked Units[ENDCOLOR].'),
	('TXT_KEY_PROMOTION_END_AROUND', 'End Around'),
    ('TXT_KEY_PROMOTION_END_AROUND_HELP', 'Benefit from [COLOR_POSITIVE_TEXT]Flanking[ENDCOLOR] when ranged attacking Units (does not factor in Adjacent Enemy Units).[NEWLINE]Force an enemy Unit to retreat after taking [ICON_RANGE_STRENGTH] Ranged Damage. If the Unit cannot retreat, it takes [COLOR_POSITIVE_TEXT]50%[ENDCOLOR] more damage than normal.');

--------------------------TXT----------------------------------------------------
UPDATE Language_ko_KR SET Text = 'Naval Raider Units' WHERE Tag = 'TXT_KEY_UNITCOMBAT_SUBMARINE';

UPDATE	Language_ko_KR SET
		Text = REPLACE(Text, 'Submarine', 'Naval Raider')
		WHERE Tag = 'TXT_KEY_PROMOTION_TRUE_WOLFPACK_HELP';
		
UPDATE	Language_ko_KR SET
		Text = REPLACE(Text, 'Submarines', 'Naval Raiders')
		WHERE Tag IN ('TXT_KEY_LEAGUE_PROJECT_REWARD_TREASURE_FLEET_3_HELP', 'TXT_KEY_BUILDING_GRAND_CANAL_HELP', 'TXT_KEY_PROMOTIONS_PEDIA_CARSUB');




	























