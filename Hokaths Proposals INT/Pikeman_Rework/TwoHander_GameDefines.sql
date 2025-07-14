---UNIQUE UNITS----
UPDATE Language_ko_KR
SET Text = 'Unique French {TXT_KEY_UNIT_2HANDER} that excels at delivering a fast attack into the enemy. Instead of the [COLOR_POSITIVE_TEXT]Two Hander[ENDCOLOR] Promotion, it can move faster and ignore Zone of Control.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_MUSKETEER';

UPDATE Language_ko_KR
SET Text = 'The {TXT_KEY_UNIT_FRENCH_MUSKETEER} is a French Unique Unit, replacing the {TXT_KEY_UNIT_2HANDER}. It is more powerful, and has different promotions which allow it to move faster and ignore Zone of Control.'
WHERE Tag = 'TXT_KEY_UNIT_FRENCH_MUSKETEER_STRATEGY';

UPDATE Language_ko_KR
SET Text = 'Unique French {TXT_KEY_UNIT_2HANDER} that excels at delivering a fast attack into the enemy. Instead of the [COLOR_POSITIVE_TEXT]Two Hander[ENDCOLOR] Promotion, it can move faster and ignore Zone of Control.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_MUSKETEER';

UPDATE Language_ko_KR
SET Text = 'The {TXT_KEY_UNIT_FRENCH_MUSKETEER} is a French Unique Unit, replacing the {TXT_KEY_UNIT_2HANDER}. It is more powerful, and has different promotions which allow it to move faster and ignore Zone of Control.'
WHERE Tag = 'TXT_KEY_UNIT_FRENCH_MUSKETEER_STRATEGY';

UPDATE Language_ko_KR
SET Text = 'Doppelsoeldner'
WHERE Tag = 'TXT_KEY_UNIT_GERMAN_LANDSKNECHT';

UPDATE Language_ko_KR
SET Text = 'Unique German {TXT_KEY_UNIT_2HANDER} that specializes as mercenaries, having no experience penalty or cooldown while being able to move immediately when purchased. Starts with [COLOR_POSITIVE_TEXT]{TXT_KEY_PROMOTION_FORMATION_1}[ENDCOLOR] and [COLOR_POSITIVE_TEXT]{TXT_KEY_PROMOTION_FORMATION_2}[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_UNIT_HELP_LANDSKNECHT';

UPDATE Language_ko_KR
SET Text = 'The {TXT_KEY_UNIT_GERMAN_LANDSKNECHT} is the German unique unit, replacing the {TXT_KEY_UNIT_2HANDER}. It has a combat bonus against full health units, and a increased bonus against mounted units. It is also slightly cheaper to train or purchase, and gain full XP and can move immediately when bought.[NEWLINE][NEWLINE]Use their fast deployment and their bonus against full health units to surprise your opponents in the first turns of your wars and break their lines quickly. Its cheap cost also makes it an excellent gift. Buy several units at once, walk them over to a nearby City-State, and reap the benefits of both short- and long-term influence.'
WHERE Tag = 'TXT_KEY_UNIT_GERMAN_LANDSKNECHT_STRATEGY';

UPDATE Language_ko_KR
SET Text = 'Doppelsoeldner or "double-pay men" were part of the pike-and-shot era of warfare in Europe who volunteered to fight in the front line, in exchange for double payment. Roughly one-in-four men in a composition were front line soldiers who formed wings in front of the pikemen, who themselves defended to crossbowmen and/or arquebusiers. Although aimed with light ranged weapons, the main tool of the doppelsoeldner was the Zweihaender, a gigantic two-handed sword used to decapitate enemy pikes, and their wielders!'
WHERE Tag = 'TXT_KEY_CIVILOPEDIA_UNITS_MEDIEVAL_LANDSKNECHT_TEXT';

----------------------------------------------------
-- Promotions
----------------------------------------------------
-- impi
UPDATE Language_ko_KR
SET Text = 'Unique Zulu {TXT_KEY_UNIT_SPANISH_TERCIO} that excels at defeating Gunpowder Units. Starts with the Javelin Volley Promotion. Also starts with Cover I.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_ZULU_IMPI';

UPDATE Language_ko_KR
SET Text = 'Javelin Volley'
WHERE Tag = 'TXT_KEY_PROMOTION_RANGED_SUPPORT_FIRE';

UPDATE Language_ko_KR
SET Text = 'The {TXT_KEY_UNIT_ZULU_IMPI} is a Zulu Unique Unit, replacing the {TXT_KEY_UNIT_SPANISH_TERCIO}. Besides being much stronger and more expensive to build than the {TXT_KEY_UNIT_PIKEMAN}, it takes notably less compared to other contemporary units. Its shield gives it Cover I, reducing damage from ranged attacks, and before engaging in an melee attack, it performs a spear throw attack that weakens the defender before melee combat ensues. It also has a [ICON_STRENGTH] Combat Strength bonus when fighting against Gunpowder Units, making it a deadly unit well into the Industrial Era.'
WHERE Tag = 'TXT_KEY_UNIT_ZULU_IMPI_STRATEGY';

-- yellow brow
UPDATE Language_ko_KR
SET Text = Replace(Text, 'Formation I', 'Formation I and Formation II')
WHERE Tag = 'TXT_KEY_UNIT_SHOSHONE_YELLOW_BROW_HELP';

----------------------------------------------------
-- Text (ko_KR)
----------------------------------------------------
INSERT INTO Language_ko_KR (Tag, Text) VALUES
('TXT_KEY_UNIT_2HANDER', 'Greatswordsman'),
('TXT_KEY_CIV5_2HANDER_TEXT', 'Renaissance two-handed swords are monstrous weapons, longer and larger than even the medieval longsword, with a hilt of over a foot and a blade that measures nearly five feet in length, taller than some people. They are primarily in use during the early decades of the 16th century. These swords represent the final stage in the trend of increasing size that started in the 14th century. They can be used to fight against pike formations and cut off pike heads.'),
('TXT_KEY_UNIT_2HANDER_STRATEGY', 'The Greatswordsman is much stronger than the Longswordsman, and gains a devastating combat bonus against Melee Units that start with Formation I.'),
('TXT_KEY_UNIT_HELP_2HANDER', 'Early Renaissance Era Melee Unit. Additional +33% [ICON_STRENGTH] Strength [COLOR_POSITIVE_TEXT]Attacking[ENDCOLOR] VS Spearmen, {TXT_KEY_UNIT_PIKEMAN}, Free Companies, and {TXT_KEY_UNIT_SPANISH_TERCIO}.');
----------------------------------------------------
-- Text (ko_KR)
----------------------------------------------------

INSERT INTO Language_ko_KR (Tag, Text) VALUES
('TXT_KEY_PROMOTION_2HANDER', 'Two Hander'),
('TXT_KEY_PROMOTION_2HANDER_HELP', '+33% [ICON_STRENGTH] Strength [COLOR_POSITIVE_TEXT]Attacking[ENDCOLOR] VS Spearman, {TXT_KEY_UNIT_PIKEMAN}, Free Company, and {TXT_KEY_UNIT_SPANISH_TERCIO}[NEWLINE][COLOR_NEGATIVE_TEXT]Lost on upgrade[ENDCOLOR].');

-- rename the Tercio
UPDATE Language_ko_KR
SET Text = 'Pike-and-Shot'
WHERE Tag = 'TXT_KEY_UNIT_SPANISH_TERCIO';

UPDATE Language_ko_KR
SET Text = 'The Pike-and-Shot is the basic Melee Unit of the Renaissance Era, able to easily stand up to the terrifying Knights of the Medieval Era.'
WHERE Tag = 'TXT_KEY_CIV5_SPAIN_TERCIO_HELP';

UPDATE Language_ko_KR
SET Text = 'Like previous defensive Units that also did not require Iron, the Pike-and-Shot is the bread-and-butter frontline troop. It also has access to [COLOR_POSITIVE_TEXT]Pike Tactics[ENDCOLOR], which can enable it to be used offensively when initiating against the foe. However, in the Renaissance period the powerful Greatswordsman also becomes available, which for the first time represents a direct counter. Therefore although Mounted Units are less intimidating, care must still be taken to design an effective army composition without a single point of failure.'
WHERE Tag = 'TXT_KEY_CIV5_SPAIN_TERCIO_STRATEGY';

UPDATE Language_ko_KR
SET Text = 'Pike-and-Shot referes to a tactical formation that first appeared during the late 15th and early 16th centuries, and was used until the development of the bayonet in the late 17th century. This type of formation combined soldiers armed with pikes and soldiers armed with arquebuses and/or muskets. Other weapons such as swords, halberds, and crossbows were also sometimes used. The formation was initially developed by the Holy Roman Imperial (Landsknechte) and Spanish (Tercios) infantries.[NEWLINE][NEWLINE]The tactic hinges on the control offered by the Pike, a reinforced polearm often well-over 4 metres long. Although excellent defensively, its unwieldiness made it vulnerable to being outmaneuvered, and only well-trained units could use it in an effective offensive manner. To overcome these weaknesses, Pikemen were paired with Arquebusiers, extremely primitive (matchlock) firearms. Pike-and-Shot was so successful many battles of the time devolved into large numbers of immobilized men pushed up against each other in a deadly crush known as a "push of pike", and massive two-handed swords were constructed specifically to disarm Pikemen.'
WHERE Tag = 'TXT_KEY_CIV5_SPAIN_TERCIO_TEXT';