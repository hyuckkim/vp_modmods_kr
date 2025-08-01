UPDATE Language_ko_KR SET Text = 'Naval Capital Units' WHERE Tag = 'TXT_KEY_UNITCOMBAT_CARRIER';
UPDATE	Language_ko_KR SET
		Text = REPLACE(Text, 'Carriers', 'Capital Ships')
		WHERE Tag IN ('TXT_KEY_LEAGUE_PROJECT_REWARD_TREASURE_FLEET_3_HELP', 'TXT_KEY_BUILDING_GRAND_CANAL_HELP','TXT_KEY_PROMOTIONS_PEDIA_CARSUB');
---------------------------------------------------------------
INSERT INTO Language_ko_KR (Tag, Text)
VALUES
   	('TXT_KEY_PROMOTION_HIGH_P_ROUND', 'High Penetration Rounds'),
    ('TXT_KEY_PROMOTION_HIGH_P_ROUND_HELP', '+25% [ICON_STRENGTH] Combat Strength when attacking [COLOR_POSITIVE_TEXT]Naval Capital Units except Carriers[ENDCOLOR].'),
    ('TXT_KEY_PROMOTION_HEAVY_SHIP_MOD', 'Large Warship'),
    ('TXT_KEY_PROMOTION_HEAVY_SHIP_MOD_HELP', '+20 Hit Points.[NEWLINE]Immune to the [COLOR_POSITIVE_TEXT]Boarded[ENDCOLOR] status. [NEWLINE]Half [ICON_MOVES] Movement in [COLOR_NEGATIVE_TEXT]Coastal Tiles[ENDCOLOR].'),
	('TXT_KEY_PROMOTION_HEAVY_FIRE', 'Bonus when Attacking Naval Melee Units (50)'),
    ('TXT_KEY_PROMOTION_HEAVY_FIRE_HELP', '+50% [ICON_STRENGTH] Combat Strength when attacking [COLOR_POSITIVE_TEXT]Naval Melee Units[ENDCOLOR].'),
	('TXT_KEY_PROMOTION_FLAGSHIP', 'FlagShip'),
    ('TXT_KEY_PROMOTION_FLAGSHIP_HELP', '+15% [ICON_STRENGTH] Combat Strength for [COLOR_POSITIVE_TEXT]Naval Units[ENDCOLOR] within 2 tiles of this Unit.'),
	('TXT_KEY_PROMOTION_ONLY_MELEE', 'Escort Ship'),
    ('TXT_KEY_PROMOTION_ONLY_MELEE_HELP', 'Unit [COLOR_NEGATIVE_TEXT]can only perform Melee Attacks[ENDCOLOR].'),
	('TXT_KEY_PROMOTION_FIRE_CONTROL', 'Fire Control'),
    ('TXT_KEY_PROMOTION_FIRE_CONTROL_HELP', '+10% [ICON_STRENGTH] Combat Strength when attacking.'),
	('TXT_KEY_PROMOTION_BATTLE_LINE_MOD', 'Battle Line'),
    ('TXT_KEY_PROMOTION_BATTLE_LINE_MOD_HELP', '+10% [ICON_STRENGTH] Combat Strength per [COLOR_POSITIVE_TEXT]Adjacent Ships[ENDCOLOR] when defending.[NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]Lost on Upgrade.[ENDCOLOR]'),
	('TXT_KEY_PROMOTION_ALL_BIG_GUN', 'All Big Gun'),
    ('TXT_KEY_PROMOTION_ALL_BIG_GUN_HELP', '+20% [ICON_STRENGTH] Combat Strength when attacking [COLOR_POSITIVE_TEXT]Full Health Units[ENDCOLOR].[NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]Lost on Upgrade.[ENDCOLOR]'),
	('TXT_KEY_PROMOTION_IRON_HULL', 'Plated Hull'),
    ('TXT_KEY_PROMOTION_IRON_HULL_HELP', '+10% [ICON_STRENGTH] Combat Strength VS [COLOR_POSITIVE_TEXT]Wooden Ships[ENDCOLOR].[NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]Lost on Upgrade.[ENDCOLOR]'),
	('TXT_KEY_PROMOTION_FLEET_ENG_I', 'Fleet Engagement I'),
	('TXT_KEY_PROMOTION_FLEET_ENG_II', 'Fleet Engagement II'),
	('TXT_KEY_PROMOTION_FLEET_ENG_I_HELP', '+10% [ICON_STRENGTH] Combat Strength [COLOR_POSITIVE_TEXT]Outside of Friendly Territory[ENDCOLOR].[NEWLINE]+10% [ICON_STRENGTH] Combat Strength when attacking Units in [COLOR_POSITIVE_TEXT]Ocean Tiles[ENDCOLOR].'),
	('TXT_KEY_PROMOTION_FLEET_ENG_II_HELP', '+10% [ICON_STRENGTH] Combat Strength [COLOR_POSITIVE_TEXT]Outside of Friendly Territory[ENDCOLOR].[NEWLINE]+10% [ICON_STRENGTH] Combat Strength when attacking Units in [COLOR_POSITIVE_TEXT]Ocean Tiles[ENDCOLOR].'),
    ('TXT_KEY_PROMOTION_BELT_ARMOR', 'Belt Armor'),
    ('TXT_KEY_PROMOTION_BELT_ARMOR_HELP', '+25% [ICON_STRENGTH] Combat Strength when defending against [COLOR_POSITIVE_TEXT]Naval Units[ENDCOLOR].'),
    ('TXT_KEY_PROMOTION_BATTLECRUISER', 'Battlecruiser'),
    ('TXT_KEY_PROMOTION_BATTLECRUISER_HELP', '-10% [ICON_STRENGTH] Combat Strength.[NEWLINE]+1 [ICON_MOVES] Movement.'),
    ('TXT_KEY_PROMOTION_S_BOMBARDMENT', 'Shore Bombardment'),
    ('TXT_KEY_PROMOTION_S_BOMBARDMENT_HELP', '+50% [ICON_STRENGTH] Combat Strength when attacking [COLOR_POSITIVE_TEXT]Fortified Units[ENDCOLOR] and [COLOR_POSITIVE_TEXT]Cities[ENDCOLOR].'),	
    ('TXT_KEY_PROMOTION_NAVAL_ARTL_I', 'Naval Artillery I'),
	('TXT_KEY_PROMOTION_NAVAL_ARTL_II', 'Naval Artillery II'),
	('TXT_KEY_PROMOTION_NAVAL_ARTL_III', 'Naval Artillery III'),
	('TXT_KEY_PROMOTION_NAVAL_ARTL_I_HELP', '+10% [ICON_STRENGTH] Combat Strength when attacking [COLOR_POSITIVE_TEXT]Naval[ENDCOLOR] and [COLOR_POSITIVE_TEXT]Land Units[ENDCOLOR].[NEWLINE]+10% [ICON_STRENGTH] Combat Strength when attacking [COLOR_POSITIVE_TEXT]Units above 50% HP[ENDCOLOR].'),
	('TXT_KEY_PROMOTION_NAVAL_ARTL_II_HELP', '+10% [ICON_STRENGTH] Combat Strength when attacking [COLOR_POSITIVE_TEXT]Naval[ENDCOLOR] and [COLOR_POSITIVE_TEXT]Land Units[ENDCOLOR].[NEWLINE]+10% [ICON_STRENGTH] Combat Strength when attacking [COLOR_POSITIVE_TEXT]Units above 50% HP[ENDCOLOR].'),
	('TXT_KEY_PROMOTION_NAVAL_ARTL_III_HELP', '+10% [ICON_STRENGTH] Combat Strength when attacking [COLOR_POSITIVE_TEXT]Naval[ENDCOLOR] and [COLOR_POSITIVE_TEXT]Land Units[ENDCOLOR].[NEWLINE]+10% [ICON_STRENGTH] Combat Strength when attacking [COLOR_POSITIVE_TEXT]Units above 50% HP[ENDCOLOR].');
----------------------------------------------------
INSERT INTO Language_ko_KR (Tag, Text)
VALUES ('TXT_KEY_UNIT_BB_SHIP_OF_THE_LINE', 'Ship of the Line');

-- Pedia: Historical Info (bottom)
INSERT INTO Language_ko_KR (Tag, Text)
VALUES ('TXT_KEY_UNIT_BB_SHIP_OF_THE_LINE_PEDIA', 'A ship of the line was a type of naval warship constructed during the Age of Sail from the 17th century to the mid-19th century. The ship of the line was designed for the naval tactic known as the line of battle, which involved the two columns of opposing warships manoeuvering to volley fire with the cannons along their broadsides.');

-- Pedia: Strategy (middle)
INSERT INTO Language_ko_KR (Tag, Text)
VALUES ('TXT_KEY_UNIT_BB_SHIP_OF_THE_LINE_HELP', 'Powerful Renaissance-era naval capital unit. Excels in direct combat with other ships and supports coastal assaults.');

-- Pedia: Game Info (top)
INSERT INTO Language_ko_KR (Tag, Text)
VALUES ('TXT_KEY_UNIT_BB_SHIP_OF_THE_LINE_STRATEGY', 'Dominating the seas in the Age of Sail, the Ship of the Line is a heavily armed and armored warship designed to engage enemy fleets and provide devastating broadsides against coastal targets.');
---------------------------------------------------
UPDATE Language_ko_KR
SET Text = 'First Rate'
WHERE Tag = 'TXT_KEY_UNIT_ENGLISH_SHIPOFTHELINE';

UPDATE Language_ko_KR
SET Text = 'Unique English {TXT_KEY_UNIT_BB_SHIP_OF_THE_LINE} that specializes in wresting control of sea and coast with extra vision and splash damage. Starts with [COLOR_POSITIVE_TEXT]{TXT_KEY_PROMOTION_SPLASH_1}[ENDCOLOR] and [COLOR_POSITIVE_TEXT]{TXT_KEY_PROMOTION_SPLASH_2}[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_UNIT_HELP_SHIPOFTHELINE';

UPDATE Language_ko_KR
SET Text = 'The {TXT_KEY_UNIT_ENGLISH_SHIPOFTHELINE} is the English unique unit, replacing the {TXT_KEY_UNIT_BB_SHIP_OF_THE_LINE}. It can deal splash damage to clear out masses of enemy ships and land units on coastal tiles. It can also see further, allowing it to spot enemies in a significantly larger section of ocean.'
WHERE Tag = 'TXT_KEY_UNIT_ENGLISH_SHIPOFTHELINE_STRATEGY';

UPDATE Language_ko_KR
SET Text = '"First-rate" is the classification used for the largest ships of the line maintained by the British Royal Navy.  Throughout the existence of the rating system, the threshold armament and crew for a ship to be considered first-rate changed.  However, it was established in the early 1700s that a first-rate ship loaded for wartime carried at least 100 guns.  First-rates were very expensive, heavy and slow in exchange for their massive firepower.  As a result, few were maintained at any given time, and they often served as flagships. HMS Victory, Admrial Nelson''s famous flagship from the Battle of Trafalgar, is the only surviving first-rate.'
WHERE Tag = 'TXT_KEY_CIVILOPEDIA_UNITS_RENAISSANCE_SHIPOFTHELINE_TEXT';
---------------------------------------------------
UPDATE Language_ko_KR
SET Text = 'Gun Boat'
WHERE Tag = 'TXT_KEY_UNIT_IRONCLAD';

UPDATE Language_ko_KR
SET Text = 'In the later 19th century and early 20th century, gunboat was the common name for smaller armed vessels. These could be classified, from the smallest to the largest, into river gunboats, river monitors, coastal-defense gunboats , and full-fledged monitors for coastal bombardments.'
WHERE Tag = 'TXT_KEY_CIVILOPEDIA_UNITS_RENAISSANCE_IRONCLAD_TEXT';

UPDATE Language_ko_KR
SET Text = 'Industrial-era melee naval unit. Supports fleet operations by engaging enemy ships directly and protecting ranged units.'
WHERE Tag = 'TXT_KEY_UNIT_IRONCLAD_STRATEGY';

UPDATE Language_ko_KR
SET Text = 'A very powerful melee naval unit, the Gun Boat is essential in protecting the huge steamships.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_IRONCLAD';

UPDATE Language_ko_KR
SET Text = 'Steam Frigate'
WHERE Tag = 'TXT_KEY_DESC_CRUISER';

UPDATE Language_ko_KR
SET Text = 'Steam Frigates (including screw frigates) and the smaller steam corvettes, steam sloops, steam gunboats and steam schooners, were steam-powered warships that were not meant to stand in the line of battle. The first such ships were paddle steamers. Later on the invention of screw propulsion enabled construction of screw-powered versions of the traditional frigates, corvettes, sloops and gunboats.'
WHERE Tag = 'TXT_KEY_CIV5_CRUISER_PEDIA';

UPDATE Language_ko_KR
SET Text = 'Industrial-era ranged naval unit. Delivers sustained fire support against ships and cities from a safe distance. Vulnerable to melee ships and torpedo boats.'
WHERE Tag = 'TXT_KEY_CIV5_CRUISER_STRATEGY';
------------------------------------------------------------------------------
-- IRONCLAD
----------------------------------------------------
INSERT INTO Language_ko_KR (Tag, Text)
VALUES ('TXT_KEY_UNIT_BB_IRONCLAD', 'Ironclad');

-- Pedia: Historical Info (bottom)
INSERT INTO Language_ko_KR (Tag, Text)
VALUES ('TXT_KEY_UNIT_BB_IRONCLAD_PEDIA', 'An ironclad was a steam-propelled warship protected by steel or iron armor constructed from 1859 to the early 1890s. The ironclad was developed as a result of the vulnerability of wooden warships to explosive or incendiary shells');

-- Pedia: Strategy (middle)
INSERT INTO Language_ko_KR (Tag, Text)
VALUES ('TXT_KEY_UNIT_BB_IRONCLAD_HELP', 'Heavily armored naval unit effective in ship-to-ship combat and coastal bombardment.');

-- Pedia: Game Info (top)
INSERT INTO Language_ko_KR (Tag, Text)
VALUES ('TXT_KEY_UNIT_BB_IRONCLAD_STRATEGY', 'The Ironclad is a powerful Industrial-era ranged capital ship. It excels at engaging enemy naval units head-on and supporting attacks on coastal cities. Ironclads are more durable than steam frigates but less mobile, and benefit from unique promotions focused on survivability and ship-to-ship firepower.');
---------------------------------------------------
--Cruiser
UPDATE Language_ko_KR
SET Text = 'Cruiser'
WHERE Tag = 'TXT_KEY_UNIT_DREADNOUGHT';

UPDATE Language_ko_KR
SET Text = 'A cruiser is a type of warship. The term has been in use for several hundred years, and has had different meanings throughout this period. During the Age of Sail, the term cruising referred to certain kinds of missions: independent scouting, raiding or commerce protection fulfilled by a frigate or sloop, which were the cruising warships of a fleet. In the middle of the 19th century, cruiser came to be a classification for the ships intended for this kind of role, though cruisers came in a wide variety of sizes, from the small protected cruiser to armored cruisers which were as large (though not as powerful) as a battleship. By the early 20th century, cruisers could be placed on a consistent scale of warship size, smaller than a battleship but larger than a destroyer. In 1922, the Washington Naval Treaty placed a formal limit on cruisers, which were defined as warships of up to 10,000 tons displacement carrying guns no larger than 8 inches in calibre. These limits shaped cruisers up until the end of World War II. The very large battlecruisers of the World War I era were now classified, along with battleships, as capital ships.'
WHERE Tag = 'TXT_KEY_UNIT_DREADNOUGHT_PEDIA';

UPDATE Language_ko_KR
SET Text = 'Modern-era ranged naval unit. Designed for long-range engagements against ships and cities. Must be protected from close-quarters threats.[NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]Land attacks can only be performed on Coastal tiles.[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_UNIT_DREADNOUGHT_HELP';

UPDATE Language_ko_KR
SET Text = 'The Cruiser is a ranged naval unit of the Modern Era. It specializes in long-range attacks against enemy ships and cities, dealing high damage while staying out of melee range. Cruisers are vulnerable to submarines and melee ships, and benefit from advanced targeting and bombardment promotions.'
WHERE Tag = 'TXT_KEY_UNIT_DREADNOUGHT_STRATEGY';

------------------------------------------------------------------------------
-- DREADNOUGHT
----------------------------------------------------
INSERT INTO Language_ko_KR (Tag, Text)
VALUES ('TXT_KEY_UNIT_BB_DREADNOUGHT', 'Dreadnought');

-- Pedia: Historical Info (bottom)
INSERT INTO Language_ko_KR (Tag, Text)
VALUES ('TXT_KEY_UNIT_BB_DREADNOUGHT_PEDIA', 'The Dreadnought was the predominant type of battleship in the early 20th century. Its design had two revolutionary features: an "all-big-gun" armament scheme, with more heavy-caliber guns than previous ships, and steam turbine propulsion. The first of its kind, the Royal Navy''s "Dreadnought" mounted ten 12-inch (305 mm) guns. The US Navy was the first to adopt oil-firing, deciding to do so in 1910 and ordering oil-fired boilers for the Nevada class, in 1911. Other major navies retained mixed coal-and-oil firing until the end of World War I.[NEWLINE][NEWLINE]Within five years of the commissioning of "Dreadnought", a new generation of more powerful "super-dreadnoughts" was being built. The first super-dreadnoughts are generally considered to be the British "Orion" class. What made them "super" was the introduction of the heavier 13.5-inch (343 mm) guns and the placement of all the main armament on the centerline. In 1917, the Japanese "Nagato" class was ordered, the first dreadnoughts to mount 16-inch (406 mm) guns, making them arguably the most powerful warships in the world.');

-- Pedia: Strategy (middle)
INSERT INTO Language_ko_KR (Tag, Text)
VALUES ('TXT_KEY_UNIT_BB_DREADNOUGHT_HELP', 'Modern-era capital ship. Combines heavy firepower and thick armor, ideal for dominating naval battles and bombarding coastal cities.');

-- Pedia: Game Info (top)
INSERT INTO Language_ko_KR (Tag, Text)
VALUES ('TXT_KEY_UNIT_BB_DREADNOUGHT_STRATEGY', 'The Dreadnought marks a turning point in naval warfare — an all-big-gun battleship capable of overwhelming any earlier vessel. It leads fleets with devastating long-range firepower and thick armor, but requires support to protect against faster ships and submarines.');
---------------------------------------------------
--Heavy Cruiser
UPDATE Language_ko_KR
SET Text = 'Heavy Cruiser'
WHERE Tag = 'TXT_KEY_UNIT_BATTLESHIP';

UPDATE Language_ko_KR
SET Text = 'A heavy cruiser was a type of cruiser, a naval warship designed for long range and high speed, armed generally with naval guns of roughly 203 mm (8 inches) in calibre, whose design parameters were dictated by the Washington Naval Treaty of 1922 and the London Naval Treaty of 1930. Heavy cruisers were generally larger, more heavily armed and more heavily armoured than light cruisers while being smaller, faster, and more lightly armed and armoured than battlecruisers and battleships.'
WHERE Tag = 'TXT_KEY_CIV5_INDUSTRIAL_BATTLESHIP_TEXT';

UPDATE Language_ko_KR
SET Text = 'Heavily armed cruiser that provides both ranged naval fire support and limited air defense. Effective against ships, coastal targets, and aircraft.[NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]Land attacks can only be performed on Coastal tiles.[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_UNIT_HELP_BATTLESHIP';

UPDATE Language_ko_KR
SET Text = 'The Heavy Cruiser is a Atomic Era ranged naval unit. It mounts powerful artillery and is more resilient than earlier cruisers. In addition to strong bombardment capabilities, it can intercept enemy aircraft, making it a valuable support ship in carrier-led fleets.'
WHERE Tag = 'TXT_KEY_UNIT_BATTLESHIP_STRATEGY';

------------------------------------------------------------------------------
-- BATTLESHIP
----------------------------------------------------
INSERT INTO Language_ko_KR (Tag, Text)
VALUES ('TXT_KEY_UNIT_BB_BATTLESHIP', 'Battleship');

-- Pedia: Historical Info (bottom)
INSERT INTO Language_ko_KR (Tag, Text)
VALUES ('TXT_KEY_UNIT_BB_BATTLESHIP_PEDIA', 'A battleship is a large, heavily armored warship with a main battery consisting of large guns, designed to serve as a capital ship. From their advent in the late 1880s, battleships were among the largest and most formidable weapon systems ever built, until they were surpassed by aircraft carriers beginning in the 1940s.');

-- Pedia: Strategy (middle)
INSERT INTO Language_ko_KR (Tag, Text)
VALUES ('TXT_KEY_UNIT_BB_BATTLESHIP_HELP', 'Powerful ranged capital ship. Excels at leading fleets with devastating naval artillery and strong defenses.');

-- Pedia: Game Info (top)
INSERT INTO Language_ko_KR (Tag, Text)
VALUES ('TXT_KEY_UNIT_BB_BATTLESHIP_STRATEGY', 'With unrivaled firepower and armor, the Battleship excels at striking enemy fleets and surviving the fiercest naval battles.');
---------------------------------------------------------
UPDATE Language_ko_KR
SET Text = 'Receive one Ship of the Line. 300 points towards next [ICON_GOLDEN_AGE] Golden Age.'
WHERE Tag IN ('TXT_KEY_LEAGUE_PROJECT_REWARD_TREASURE_FLEET_1_HELP');
---------------------------------------------------------------
UPDATE	Language_ko_KR SET
		Text = REPLACE(Text, 'Carrier', 'Capital')
		WHERE Tag = 'TXT_KEY_PROMOTION_CONVOY_HELP' AND EXISTS (SELECT * FROM Units WHERE Type='UNIT_TORPEDO');

UPDATE	Language_ko_KR SET
		Text = REPLACE(Text, 'Naval Ranged Units', 'Naval Ranged and Capital Units except Carriers')
		WHERE Tag = 'TXT_KEY_PROMOTION_NAVAL_BONUS_HELP' AND EXISTS (SELECT * FROM Units WHERE Type='UNIT_TORPEDO');
--------------------EXP--------------------------------------------	
UPDATE Language_ko_KR SET Text = 'Bonus vs Naval Melee Units (33)' WHERE Tag = 'TXT_KEY_PROMOTION_HEAVY_FIRE';
UPDATE Language_ko_KR SET Text = '+33% [ICON_STRENGTH] Combat Strength VS [COLOR_POSITIVE_TEXT]Naval Melee[ENDCOLOR] Units.' WHERE Tag = 'TXT_KEY_PROMOTION_HEAVY_FIRE_HELP';