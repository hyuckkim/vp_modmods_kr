----------------------------------------------------
-- Text (en_US)
----------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------
-- ERAS
--------------------------------------------------------------------------------------------------------------------------
-- Move to text later?
INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_ERA_EE', 'Enlightenment Era'),
('TXT_KEY_ERA_EE_SHORT', 'Enlightenment'),
('TXT_KEY_ERA_EE_ABBREV', 'V'),
('TXT_KEY_ERA_ENLIGHTENMENT_STRATEGY', 'The Enlightenment Era');

-- Abbreviations: 0..3 are for Ancient..Renaissance
UPDATE Language_en_US SET Text = 'VI'   WHERE Tag = 'TXT_KEY_ERA_4_ABBREV'; -- Industrial
UPDATE Language_en_US SET Text = 'VII'  WHERE Tag = 'TXT_KEY_ERA_5_ABBREV'; -- Modern
UPDATE Language_en_US SET Text = 'VIII' WHERE Tag = 'TXT_KEY_ERA_6_ABBREV'; -- Atomic
UPDATE Language_en_US SET Text = 'IX'   WHERE Tag = 'TXT_KEY_ERA_7_ABBREV'; -- Information

--------------------------------------------------------------------------------------------------------------------------
-- WORLD CONGRESS
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_LEAGUE_WORLD_CONGRESS_4', '{@1_Ordinal} {@2_CityName} Convention'),
('TXT_KEY_LEAGUE_SPECIAL_SESSION_WORLD_ASSEMBLY', 'World Congress Continues to Expand'),
('TXT_KEY_LEAGUE_SPECIAL_SESSION_WORLD_ASSEMBLY_HELP',
	'The rapid changes within nations around the world result in equally rapid changes to the international relations between them, prompting the World Congress to adapt to meet new challenges.  A special session is called to choose the next host to lead the Congress forward.');
--------------------------------------------------------------------------------------------------------------------------
-- Policies
--------------------------------------------------------------------------------------------------------------------------
-- Division of Labor
--UPDATE Language_en_US
--SET Text = REPLACE(Text, 'Workshops, Factories,', 'Workshops, Cloth Mills, Factories,')
--WHERE Tag = 'TXT_KEY_POLICY_TRADE_UNIONS_HELP';

-- Mercantilism (Industry)
--UPDATE Language_en_US
--SET Text = REPLACE(Text, 'Banks, and Stock Exchanges', 'Banks, Weigh Houses, and Stock Exchanges')
--WHERE Tag = 'TXT_KEY_POLICY_MERCANTILISM_HELP';

-- Colonialism (Naval Tradition)
UPDATE Language_en_US
SET Text = REPLACE(Text, 'Barracks, Armories, Military Academies, ', 'Barracks, Armories, Gunsmiths, Military Academies, ')
WHERE Tag = 'TXT_KEY_POLICY_NAVAL_TRADITION_HELP';

--------------------------------------------------------------------------------------------------------------------------
-- Tech
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_TECH_EE_EXPLORATION', 'Exploration'),
--TXT_KEY_TECH_EE_EXPLORATION_DESC - uses TXT_KEY_TECH_EXPLORATION_DESC from vanilla game
('TXT_KEY_TECH_EE_EXPLORATION_HELP', 'Allows you to build the [COLOR_POSITIVE_TEXT]Galleon[ENDCOLOR], a strong late-Renaissance melee naval unit, and the [COLOR_POSITIVE_TEXT]Explorer[ENDCOLOR], a mid-game scouting unit.'),
('TXT_KEY_TECH_EE_EXPLORATION_QUOTE', '[NEWLINE][TAB][TAB]"We shall not cease from exploration, and the end of all our exploring will be to arrive where we started and know the place for the first time."[NEWLINE][TAB][TAB] - T. S. Eliot[NEWLINE][TAB]'),

('TXT_KEY_TECH_EE_FLINTLOCK', 'Flintlock'),
('TXT_KEY_TECH_EE_FLINTLOCK_DESC', 'The flintlock can either describe a certain lock mechanism which employed a flint to ignite the gunpowder in a musket or rifle, or it can refer to the weapons of the 17th, 18th, and 19th centuries as a whole. These weapons, first developed in France, contained a piece of flint which, when struck with steel (called the "frizzen") would create a spark, which would then fall into a pan containing gunpowder and ignite it, causing the weapon to fire.[NEWLINE][NEWLINE]Because of their improvement over the previous matchlock rifle, the flintlock quickly became popular, gaining prominence during the 1630s as the favoured arm of dragoons serving in the English Civil War, and then in the 1700s as the standard arm for most European footsoldiers. They retained this status up until the mid 19th century, when they were gradually phased out and replaced with the percussion lock and, later, the cartridge-based systems.'),
('TXT_KEY_TECH_EE_FLINTLOCK_HELP', 'Can increase the production of gunpowder units.'),
('TXT_KEY_TECH_EE_FLINTLOCK_QUOTE', '[NEWLINE][TAB][TAB]"To be prepared for war is one of the most effectual means of preserving peace."[NEWLINE][TAB][TAB] - George Washington[NEWLINE][TAB]'),

('TXT_KEY_TECH_EE_FORTIFICATION', 'Strongholds'),
('TXT_KEY_TECH_EE_FORTIFICATION_DESC', 'Military engineers are continually improving those structures built to withstand the conditions of warfare. In early history, walls and castles often served as checks against the imposing threat of invasion or conquest, whilst also signifying the residence or territory of a ruling monarch or noble. As the arrival of cannons in the 15th century began to render traditional forts obsolete, new designs were developed which focused upon safeguarding walls behind intricate arrays of outworks: slopes, ditches, ravelins and so forth. Like castles before them, however, these structures quickly fell to the advances of military technology, and today, such large-scale static fortifications have been made obsolete.'),
('TXT_KEY_TECH_EE_FORTIFICATION_HELP', 'Allows you to build the [COLOR_POSITIVE_TEXT]Field Gun[ENDCOLOR], a strong and effective siege unit. Also allows you to build the [COLOR_POSITIVE_TEXT]Bastion[ENDCOLOR] to further improve the [ICON_STRENGTH] Defense of your cities.'),
('TXT_KEY_TECH_EE_FORTIFICATION_QUOTE', '[NEWLINE][TAB][TAB]"Greatness is nothing unless it be lasting."[NEWLINE][TAB][TAB] - Napoleon Bonaparte[NEWLINE][TAB]'),

('TXT_KEY_TECH_EE_HUMANISM', 'Humanism'),
--TXT_KEY_TECH_EE_HUMANISM_DESC - uses TXT_KEY_TECH_HUMANISM_DESC from vanilla game
('TXT_KEY_TECH_EE_HUMANISM_QUOTE', '[NEWLINE][TAB][TAB]"What is a man? A miserable little pile of secrets."[NEWLINE][TAB][TAB] - Count Dracula [NEWLINE][TAB]'),
('TXT_KEY_TECH_EE_HUMANISM_HELP', 'Allows you to build both the [COLOR_POSITIVE_TEXT]Academy[ENDCOLOR] and the [COLOR_POSITIVE_TEXT]Parlour[ENDCOLOR], two mutually-exclusive buildings which boost either the science or culture output of your cities respectively.'),

('TXT_KEY_TECH_EE_MANUFACTURING', 'Manufacturing'),
('TXT_KEY_TECH_EE_MANUFACTURING_DESC', 'Manufacturing is the process of producing goods that can then be sold or used, most often by turning raw materials into merchandise. In pre-industrial societies, the production of such merchandise was often carried out by artisans, overseen by collective guilds which ensured the protection and enterprise of their craft. Alongside the development of factories, and, particularly, with the advent of the Assembly Line in the 1910s, manufacturing became an industrial process, often concerned with the mass production of goods for profit. Manufactories - complexes of factories, assembly plants, foundries, etc. - thus became highly mechanized, and the need for such skilled artisans in the manufacturing process became obsolete.'),
('TXT_KEY_TECH_EE_MANUFACTURING_HELP', 'Reveals [ICON_RES_COAL] [COLOR_POSITIVE_TEXT]Coal[ENDCOLOR] and allows you to build the [COLOR_POSITIVE_TEXT]Cloth Mill[ENDCOLOR], which increases production in the city.'),
('TXT_KEY_TECH_EE_MANUFACTURING_QUOTE', '[NEWLINE][TAB][TAB]"Let us rather run the risk of wearing out than rusting out."[NEWLINE][TAB][TAB] - Theodore Roosevelt[NEWLINE][TAB]'),

('TXT_KEY_TECH_EE_ROMANTICISM', 'Romanticism'),
('TXT_KEY_TECH_EE_ROMANTICISM_DESC', 'The Romantic era was an age of literary and artistic expression which grew out of opposition to the scientific Enlightenment. It was characterised by ideals of freedom and idealism versus ideals of rationalism and realism. Many romantic thinkers were great artists, musicians, and writers, who sought to elicit intense emotion as a means to see the world around them. These thinkers would come to shape the political ideas of liberalism and radicalism which contrast so deeply with the pessimistic and cynical ideas of conservatism and realism of the modern age.[NEWLINE][NEWLINE]Romanticism reached its peak during the 19th Century, at the height of the Industrial Revolution. Artists and writers from England to Russia all celebrated in an idealistic view of humankind. Its emphasis on imagination and individual heroism was a popular distraction from the rapid changes heralded by an age dominated by global and urban empires seeking wealth and gain. It criticised authority and intellectual objectivity, and gave society a sense of quality and unity which would come to inspire ideals of the nationalism and fraternity.'),
('TXT_KEY_TECH_EE_ROMANTICISM_HELP', 'Allows you to build the [COLOR_POSITIVE_TEXT]Menagerie[ENDCOLOR], which increases [ICON_HAPPINESS_1] Happiness in the empire and makes [ICON_GOLDEN_AGE] Golden Ages more likely.'),
('TXT_KEY_TECH_EE_ROMANTICISM_QUOTE', '[NEWLINE][TAB][TAB]"The greatest happiness for the thinking man is to have fathomed the fathomable, and to quietly revere the unfathomable."[NEWLINE][TAB][TAB] - Johann Wolfgang Goethe[NEWLINE][TAB]'),

('TXT_KEY_TECH_EE_SOVEREIGNTY', 'Sovereignty'),
('TXT_KEY_TECH_EE_SOVEREIGNTY_DESC', 'Sovereignty is the political concept of supreme authority. Although in the modern sense sovereignty is usually associated with the highest authority of or within a state, it can also refer to the highest means of any individual to take independent action. This was the traditional sense of the word during the Middle Ages, when sovereignty was merely translated as being the legal or assertive capability of any individual to act independent of others. It was not until the Age of Enlightenment and the Peace of Westphalia that sovereignty became regarded legally as being the power of states to act autonomously of one another.[NEWLINE][NEWLINE]Sovereignty first became popularised by the idea of the “Social Contract,” which was first conceived by the political philosopher Thomas Hobbes as a means to explain the inception of society. Hobbes stipulated that, in order to avoid a state of perpetual conflict between mankind, or a state of “war of all against all,” individuals consent to giving up certain freedoms and benefits to an absolute and indivisible authority that can compel mankind to act in the common interest.[NEWLINE][NEWLINE]On this basis was created the ideal of Absolute Monarchy, which would be practiced in states such as Sweden and Prussia during the 17th and 18th centuries. The French philosopher Jean-Jacques Rousseau, however, would conceive of the notion of popular sovereignty, which instead considers supreme authority as being legitimately held by the people, and merely entrusted into a government to be exercised. It was on the basis of this popular sovereignty that nations such as the United States of America and the French Republic were conceived.[NEWLINE][NEWLINE]Today, most legitimate forms of sovereignty are either popular (as in a Presidential Republic, or as in the Kingdoms of Belgium and Sweden, and the State of Japan) or Parliamentary (as in a Constitutional Monarchy or Parliamentary Republic). In the case of the latter, sovereignty is retained by a supreme authority (the people or the monarch), but exercised on that authority’s behalf by a Parliament, which is usually democratically elected. In this way, most forms of sovereignty are, at least hypothetically, de facto exercised by popular consent, differing greatly from the indivisible form of which Hobbes first conceived.'),
('TXT_KEY_TECH_EE_SOVEREIGNTY_HELP', 'Allows you to build a range of buildings and wonders focused on great person generation.'),
('TXT_KEY_TECH_EE_SOVEREIGNTY_QUOTE', '[NEWLINE][TAB][TAB]"A State is but an Artificial Man in which the Sovereignty is an Artificial Soul, as giving life and motion to the whole body."[NEWLINE][TAB][TAB] - Thomas Hobbes[NEWLINE][TAB]'),

('TXT_KEY_TECH_EE_WARSHIPS', 'Warships'),
('TXT_KEY_TECH_EE_WARSHIPS_DESC', 'While many ships are engineered to cross oceans quickly or take the greatest amount of cargo in the smallest possible space, warships were designed for one purpose alone - destroying other ships.  Besides obviously being armed with some form of weapon (traditionally things like cannon or rams), warships can also withstand more damage and are much more maneuverable than something like a merchant or passenger vessel.[NEWLINE][NEWLINE]As naval technologies have advanced, so has the warship.  Galleys and triremes were early forms of warships capable of ramming enemy vessels, but usually combat was performed by the army onboard.  However, once cannon became capable of quick reloads, large sail-driven ships were employed which held rows of cannon along each side of the craft. Eventually these wooden ships were given up for ones made of iron and steel, and sails were abandoned for steam and nuclear power. While modern warships bear little resemblance to the earliest galleys, they still keep to the same basic design principles - be capable of destroying the other guy first, before he can take out you.'),
('TXT_KEY_TECH_EE_WARSHIPS_HELP', 'Allows you to build the [COLOR_POSITIVE_TEXT]Frigate[ENDCOLOR], an integral ranged unit in Enlightenment Era navies.'),
('TXT_KEY_TECH_EE_WARSHIPS_QUOTE', '[NEWLINE][TAB][TAB]"Damn the torpedoes, Full speed ahead!"[NEWLINE][TAB][TAB] - Admiral David Glasgow Farragut[NEWLINE][TAB]'),

('TXT_KEY_TECH_EE_REFRACTION', 'Optics'),
('TXT_KEY_TECH_EE_REFRACTION_DESC', 'The first wearable eyeglasses were invented in Italy around 1286. improved types of lenses for the correction of vision based more on empirical knowledge gained from observing the effects of the lenses rather than using the rudimentary optical theory of the day (theory which for the most part could not even adequately explain how spectacles worked). This practical development, mastery, and experimentation with lenses led directly to the invention of the compound optical microscope around 1595, and the refracting telescope in 1608, both of which appeared in the spectacle making centres in the Netherlands.[NEWLINE][NEWLINE]A refracting telescope is a type of optical telescope that uses a lens as its objective to form an image. The first record of a refracting telescope appeared in the Netherlands about 1608, when a spectacle maker from Middelburg named Hans Lippershey unsuccessfully tried to patent one. News of the patent spread fast and Galileo Galilei, happening to be in Venice in the month of May 1609, heard of the invention, constructed a version of his own, and applied it to making astronomical discoveries. Kepler would improve on the design in 1611 with a conex (instead of concave) lens. The was originally used in spyglasses and astronomical telescopes but is also used for long-focus camera lenses. Although large refracting telescopes were very popular up to the second half of the 19th century, for most research purposes the refracting telescope has been superseded by the reflecting telescope, which allows larger apertures.'),
('TXT_KEY_TECH_EE_REFRACTION_HELP', 'Allows you to build ships and stuff.'),
('TXT_KEY_TECH_EE_REFRACTION_QUOTE', '[NEWLINE][TAB][TAB]"Joyfully to the breeze royal Odysseus spread his sail, and with his rudder skillfully he steered."[NEWLINE][TAB][TAB] - Homer[NEWLINE][TAB]');

UPDATE Language_en_US SET
Text = '[NEWLINE][TAB][TAB]"The sun must not catch up the moon, nor does the night outstrip the day. Each one is travelling in an orbit with its own motion."[NEWLINE][TAB][TAB] - The Qur''an (36:40)'
WHERE Tag = 'TXT_KEY_TECH_ASTRONOMY_QUOTE';
--------------------------------------------------------------------------------------------------------------------------
-- Unit promotions
--------------------------------------------------------------------------------------------------------------------------

INSERT INTO Language_en_US (Tag, Text) VALUES
-- Two Hander
('TXT_KEY_PROMOTION_2HANDER', 'Greatsword'),
('TXT_KEY_PROMOTION_2HANDER_HELP', '+33% [ICON_STRENGTH] Attack vs Spearman, Pikeman, Tercio and Landsknecht.[NEWLINE][COLOR_NEGATIVE_TEXT]Lost with upgrade[ENDCOLOR].'),
-- Fasil Ghebbi Aura
('TXT_KEY_PROMOTION_EE_FASIL_GHEBBI', 'Katama Patrol'),
('TXT_KEY_PROMOTION_EE_FASIL_GHEBBI_HELP', '+25% [ICON_STRENGTH] Combat Strength when in 3-tile range of [COLOR_CYAN]Fasil Ghebbi[ENDCOLOR].'),
-- Flagship
('TXT_KEY_PROMOTION_EE_FIRST_RATE', 'Flagship'),
('TXT_KEY_PROMOTION_EE_FIRST_RATE_HELP', 'Naval Units beginning [COLOR_POSITIVE_TEXT]adjacent[ENDCOLOR] to a unit with this promotion have +20% [ICON_STRENGTH] Defense.'),
-- Adventurer
('TXT_KEY_PROMOTION_EE_ADVENTURER', 'Adventurer'),
('TXT_KEY_PROMOTION_EE_ADVENTURER_HELP', '+1 [ICON_MOVES] Movement Point and +2 Sight while embarked.'),
-- Drydock
('TXT_KEY_PROMOTION_EE_DRYDOCK', 'Well-Maintained'),
('TXT_KEY_PROMOTION_EE_DRYDOCK_HELP', 'Naval Units +15% [ICON_STRENGTH] Combat Strength');

--------------------------------------------------------------------------------------------------------------------------
-- UNITS
--------------------------------------------------------------------------------------------------------------------------

INSERT INTO Language_en_US (Tag, Text) VALUES
-- Adventurer
('TXT_KEY_UNIT_EE_ADVENTURER', 'Adventurer'),
('TXT_KEY_UNIT_EE_ADVENTURER_HELP', 'Recon unit. Can see further and has additional movement while embarked.'),
('TXT_KEY_UNIT_EE_ADVENTURER_PEDIA', 'Throughout history there are those whose thirst for adventure led them from the safe confines of civilized lands. These adventurers, frequently funded by government stipends, would then journey into the unknown, charting their progress all the way. These expeditions, and the maps they helped create, became blueprints for the conquest and domestication of the once uncharted regions of the world.'),
('TXT_KEY_UNIT_EE_ADVENTURER_STRATEGY', 'An upgrade to the Explorer. The Adventurer has even more movement and strength, although is still quite weak. The Adventurer excels at sea exploration, as it is able to move further while embarked. Use it to finish meeting all the other Civilizations, or scout out locations for overseas colonies.'),
-- Carrack
('TXT_KEY_UNIT_EE_CARRACK', 'Carrack'),
('TXT_KEY_UNIT_EE_CARRACK_HELP', 'Early Renaissance Era melee naval unit used to gain early naval supremacy.'),
('TXT_KEY_UNIT_EE_CARRACK_PEDIA', 'Developed by the Genoese Republic for commercial purposes, a carrack is three- or four-masted sailing vessel. Utilized by Spain and Portugal for oceanic travel and exploration, the carrack was one of the most influential ship designs in history. Large and roomy to carry cargo across vast distances, they were used heavily across the Atlantic and Indian oceans, carrying new found wealth and resources back to the great cities of Europe. One of the most famous ships to go down a history, the Santa Maria, was a carrack that carried Columbus and his crew to discover the new world. Another famous ship of this design belongs to Vasco Da Gama, the Portuguese explorer who circumnavigated Africa, discovering a new route to spices of India. The end of the carrack came at the hands of the galleon. Developed from the carrack, the first galleons became a reality in the mid 16th century, though the carrack would persist for several more decades.'),
('TXT_KEY_UNIT_EE_CARRACK_STRATEGY', 'The Carrack upgrades from the Caravel. It allows you to better secure your coastal cities from seafaring Barbarians or counterattacks from enemy Civilizations. Its early increased combat strength means it can be used, with support, to take small cities with low Defensive Strength.'),
-- Dragoon
('TXT_KEY_UNIT_EE_DRAGOON', 'Dragoon'),
('TXT_KEY_UNIT_EE_DRAGOON_HELP', 'Ranged Enlightenment Era Mounted Unit, useful for flanking, harassment, and hit-and-run tactics.'),
('TXT_KEY_UNIT_EE_DRAGOON_PEDIA', 'The term "Dragoon" originally referred to a type of mounted infantry soldier that was used extensively in Europe during the 17th and 18th centuries. The name is thought to have come from the French word "dragon", which was a type of firearm that was carried by these soldiers. Dragoons were typically armed with muskets or carbines, as well as swords or sabers for close combat. They were highly versatile soldiers, capable of both fighting on horseback and dismounting to fight on foot. They were also often used for reconnaissance and other tasks that required mobility and speed. The Dragoon unit saw action in a number of major conflicts throughout history, including the Thirty Years'' War, the English Civil War, and the Napoleonic Wars. They were also used extensively in the colonization of the Americas, as well as in various conflicts in Asia and Africa. Today, the term "Dragoon" is often used to refer to mounted troops in general, regardless of whether they are actually part of a dragoon regiment or not. In many modern armies, units similar to the historical Dragoons continue to serve in a variety of roles, including reconnaissance, security, and special operations.'),
('TXT_KEY_UNIT_EE_DRAGOON_STRATEGY', 'Dragoons are Enlightenment Era units capable of rapid movement and ranged attacks. The Dragoon upgrades from the Cuirassier and fulfills largely the same role as its Renaissance predecessor. Use them to harass the enemy and support your war effort, but be careful about letting them get caught alone.'),
-- Field Gun
('TXT_KEY_UNIT_EE_FIELD_GUN', 'Field Gun'),
('TXT_KEY_UNIT_EE_FIELD_GUN_HELP', 'Enlightenment Era Siege Unit. Moves at half-speed in enemy territory.'),
('TXT_KEY_UNIT_EE_FIELD_GUN_PEDIA', 'A field gun is a piece of light artillery that can be easily moved around the battlefield. During his wars in Europe, Napoleon used field guns to great effect. His employment of very large wheels allowed his guns to be quickly moved in the midst of battle, meaning enemy formations could be easily broken up. This strategy gradually became obsolete, however, as the development of road and rail, and the changing nature of the battlefield, allowed for most kinds of artillery to be moved at respectable speed.[NEWLINE][NEWLINE]By the beginning of the Second World War, the term "field gun" had come to mean any long-range artillery piece that fired at a low angle. However, because of the demand for artillery which could fire at both long-range and a high angle during the later stages of World War II, field guns became largely supplanted by howitzers, and today the term sees no widespread application.'),
('TXT_KEY_UNIT_EE_FIELD_GUN_STRATEGY', 'The Field Gun is the Enlightenment Era artillery unit. While its range remains the same as the Cannon, from which it upgrades, it is much stronger. Like other siege units, it cannot see very far and must be protected. It also moves at half-speed in enemy territory, but Field Guns are essential to Enlightenment conquests.'),
-- Galleon
('TXT_KEY_UNIT_EE_GALLEON', 'Galleon'),
('TXT_KEY_UNIT_EE_GALLEON_HELP', 'Renaissance Era Naval Ranged Unit. Can enter Ocean tiles.'),
('TXT_KEY_UNIT_EE_GALLEON_PEDIA', 'A galleon is the design of a multi-story sailing vessel attributed to the Venetians. Employed extensively in the fleets of Spain and other European states to further their naval militaristic interests, the galleon were formidable warships that weighed up to 2000 metric tonnes. The galleon was powered entirely by wind, using sails carried on three or four masts, with a lateen sail continuing to be used on the last (usually third and fourth) masts. They were used in both military and trade applications, most famously in the Spanish treasure fleet, and the Manila Galleons. Demoting the carrack to be used just for cargo, these vessels became the forefront of European armadas and went on to colonize the world.'),
('TXT_KEY_UNIT_EE_GALLEON_STRATEGY', 'The Galleon is an Enlightenment Era Naval Ranged Unit. Upgrading from the Galleass, the Galleon is the first ranged ship to be able to enter Oceans. Use a fleet of Galleons, supported by larger ships, to conquer overseas cities and protect your overseas holdings.'),
-- Marksman
('TXT_KEY_UNIT_EE_SKIRMISHER', 'Marksman'),
('TXT_KEY_UNIT_EE_SKIRMISHER_HELP', 'Primary Ranged Unit of the Enlightenment Era.'),
('TXT_KEY_UNIT_EE_SKIRMISHER_PEDIA', 'Marksmen act as an offensive force stationed ahead or alongside a larger body of friendly troops to harass the enemy. In ancient and medieval warfare, skirmishers typically carried bows, javelins, or slings. Acting as light infantry with minimal armor, they could run ahead of the main battle line, release a volley, and retreat before the clash of the opposing main forces. During the Napoleonic Wars the role of the skirmisher took on new notability, attempting to disrupt enemy forces by firing into their close-packed ranks and potentially causing early casualties and breaking enemy formation. A skirmish force screening the main body of infantry became so important that eventually all the major European powers developed specialized skirmishing infantry, e.g. the German Jaeger and the French Voltigeurs. While muskets were the predominant weapon at the time, the British Army experimented with rifles, which soon became the predominant firearm. A consequence of these wars was a trend to train line troops to adopt skirmisher tactics. By the late 19th century, the concept of fighting in formation was on the wane, and the distinctions between skirmisher and heavy infantry have largely disappeared.'),
('TXT_KEY_UNIT_EE_SKIRMISHER_STRATEGY', 'The Marksman is a primary ranged unit of the Enlightenment Era. It is very well suited to fight in difficult terrain, like hills and forests.'),
-- Uhlan
('TXT_KEY_UNIT_EE_UHLAN', 'Uhlan'),
('TXT_KEY_UNIT_EE_UHLAN_HELP', 'Final melee Mounted Unit before Armor.'),
('TXT_KEY_UNIT_EE_UHLAN_PEDIA', 'The Uhlan was a Polish light cavalry unit armed with lances, sabres, and pistols which came to frequent the armies of 18th and 19th century Russia, Prussia, and Austria. Descendents of the Tartar settlers of Lithuania, the first Uhlan regiment was created by the Polish-Lithuanian Commonwealth in the early 1700s. Swift and unobstructed by the cumbersome armor which had previously dominated mounted warfare, the Uhlan quickly grew in popular use for their versatility and speed; able to conduct reconnaissance, skirmishes, or to head-on charges. Today, a ceremonial regiment of Uhlans is retained by the Polish Armed Forces.'),
('TXT_KEY_UNIT_EE_UHLAN_STRATEGY', 'The melee Mounted Unit of the Industrial Era, the Uhlan upgrades from the Lancer and fulfills largely the same role as its Renaissance predecessor. Use it to catch enemies out of position and charge down the back line.');
INSERT INTO Language_en_US (Tag, Text) VALUES
-- Line Infantry
('TXT_KEY_UNIT_EE_LINE_INFANTRY', 'Line Infantry'),
('TXT_KEY_UNIT_EE_LINE_INFANTRY_HELP', 'Basic front-line infantry unit of the Enlightenment Era.'),
('TXT_KEY_UNIT_EE_LINE_INFANTRY_PEDIA', 'With the massive proliferation of guns from the middle of the 17th century, the battlefield became dominated by linear tactics, according to which infantry were arranged into long thin lines and fired volleys. A line consisted of 2, 3, or 4 ranks of soldiers. The relatively short range at which smooth bore muskets could accurately hit a target, added to the slow reload, meant that massed formation firing was essential for maximizing enemy casualties. The line was considered the fundamental battle formation as it allowed for the largest deployment of firepower. In the years following the Napoleonic Wars, line infantry continued to be deployed as the main battle force, while light infantry provided fire support and covered the movement of units. With the invention of new weaponry, the concept of line infantry began to wane; men walking in formation line-abreast became far too easy a target. The growing accuracy and rate of fire of rifles, together with the invention of the gatling gun and machine gun, meant that close order line infantry would suffer huge losses before being able to close with their foe. With the turn of the 20th Century, this slowly led to infantry increasingly adopting skirmisher style light infantry tactics in battle, while retaining line infantry drills for training.'),
('TXT_KEY_UNIT_EE_LINE_INFANTRY_STRATEGY', 'The standard gunpowder unit of the Enlightenment Era, upgrading from and significantly outclassing the Tercio. The Line Infantry will form the backbone of Enlightenment armies, being used to fight other melee units and protect siege and ranged units.');

-- Swedish Carolean
UPDATE Language_en_US
SET Text = 'Caroleans are the backbone of the Enlightenment era Swedish army. They start with the March promotion that allows it to Heal every turn, even if it performs an action. The Carolean also receives a 15% combat bonus when stacked with a Great General, and deals damage to all adjacent units after advancing from killing a unit.'
WHERE Tag = 'TXT_KEY_UNIT_SWEDISH_CAROLEAN_STRATEGY';

-- American Minuteman
UPDATE Language_en_US
SET Text = 'The Minuteman is the American unique unit, replacing the Marksman. The Minuteman can move through difficult terrain without penalty.'
WHERE Tag = 'TXT_KEY_UNIT_AMERICAN_MINUTEMAN_STRATEGY';
UPDATE Language_en_US
SET Text = 'Only the Americans may build it. This Unit may move through rough ground as though it were flat, unlike the Marksman which it replaces.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_MINUTEMAN';

-- Corvette (ex. Privateer)
UPDATE Language_en_US
SET Text = 'Naval Unit that attacks as a melee unit. It is stronger and faster than the Carrack.'
WHERE Tag IN ('TXT_KEY_UNIT_PRIVATEER_STRATEGY');

-- Frigate
UPDATE Language_en_US
SET Text = 'Powerful late-Enlightenment Naval Ranged Unit. The first Sea Unit with 2 Range.'
WHERE Tag IN ('TXT_KEY_UNIT_HELP_FRIGATE');

-- Portugese Nau
UPDATE Language_en_US
SET Text = 'Melee naval unit which excels at sea exploration. Has higher Combat Strength than the Carrack, and can perform an ability when adjacent to City-States to earn [ICON_GOLD] Gold and XP. May only be built by the Portuguese. [NEWLINE][NEWLINE]If possible, when a Nau sells its Exotic Cargo, a Feitoria is [COLOR_POSITIVE_TEXT]automatically created[ENDCOLOR] in its territory.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_PORTUGUESE_NAU';
UPDATE Language_en_US
SET Text = 'This melee naval unit replaces the Carrack and is skilled at exploration. When it is in a tile next to land owned by another Civilization or City-State you are at peace with, it may perform a one-time trade mission to earn [ICON_GOLD] Gold and XP. The further the land is from your own capital, the greater the bonus, so it is best to use on distant players. Use this unit to explore the map and uncover the locations of other players.'
WHERE Tag = 'TXT_KEY_UNIT_PORTUGUESE_NAU_STRATEGY';

-- Russian Cossack
UPDATE Language_en_US
SET Text = 'Only the Russians may build it. This Unit has a combat bonus when fighting enemies that have already taken damage, and is stronger than the Uhlan, which it replaces.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_COSSACK';
UPDATE Language_en_US
SET Text = 'The Cossack is the Russian unique unit, replacing the Uhlan. They are stronger than the Uhlan, and can also move after attacking. They get a combat bonus when battling damaged units. This makes Cossacks exceptionally strong at counter attacking, let the enemy chew up the front line peasants, then tear the weakened foe apart with a Cossack charge!'
WHERE Tag = 'TXT_KEY_UNIT_RUSSIAN_COSSACK_STRATEGY';

-- Howitzer (VP's Field Gun)
DELETE FROM Language_en_US WHERE Tag = 'TXT_KEY_UNIT_FIELD_GUN';
INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_UNIT_FIELD_GUN', 'Howitzer'),
('TXT_KEY_UNIT_FIELD_GUN_HELP', 'Industrial Era artillery unit, more powerful than a Field Gun. Moves at half-speed in enemy territory.'),
('TXT_KEY_UNIT_FIELD_GUN_PEDIA', 'A howitzer is a type of artillery piece characterized by a relatively short barrel and the use of comparatively small propellant charges to propel projectiles over relatively high trajectories, with a steep angle of descent. Introduced to European armies in the middle of 18th century, these field howitzers were also able to fire explosive shells. In the 1860s, artillery officers discovered that rifled siege howitzers (substantially larger than field howitzers) were a more efficient means of destroying walls than smoothbore siege guns or siege mortars. The lightest of these weapons (later known as "light siege howitzers") had calibers around 150 mm and fired shells that weighed between 40 and 50 kilograms. The heaviest (later called "medium siege howitzers") had calibers between 200 mm and 220 mm and fired shells that weighed about 100 kilograms (220 pounds).'),
('TXT_KEY_UNIT_FIELD_GUN_STRATEGY', 'Industrial Era artillery unit, more powerful than a Field Gun. Moves at half-speed in enemy territory.');

-- Bandeirantes
UPDATE Language_en_US 
SET Text = 'Bandeirantes'
WHERE Tag = 'TXT_KEY_UNIT_BANDEIRANTES';

UPDATE Language_en_US 
SET Text = 'The Bandeirantes ("those who carry the flag") were 17th-century Portuguese settlers in Brazil and fortune hunters. They led expeditions called bandeiras ("flags") which penetrated the interior of Brazil far south and west of the Tordesillas Line of 1494, which officially divided the Castilian or later Spanish (west) domain from the Portuguese (east) domain in South America. Though they originally aimed to capture and force Indigenous Americans into slavery, the bandeirantes later began to focus their expeditions on finding gold, silver, and diamond mines. As they ventured into unmapped regions in search of profit and adventure, they expanded the effective borders of the Brazilian colony.'
WHERE Tag = 'TXT_KEY_UNIT_BANDEIRANTES_TEXT';

UPDATE Language_en_US 
SET Text = 'Renaissance-Era Unit that is unique to Brazil, replacing the Adventurer. Is faster and stronger than the Adventurer, and is available earlier. Generates Gold, Culture, and Science from exploring unrevealed tiles. These yields are added to the nearest owned city. Also has the ability to construct Fort, Quarry, Mine, and Brazilwood Camp Improvements in owned territory, and is stronger versus Barbarians. Use these units to explore, clear any remaining Barbarian Encampments, and generate valuable yields for your frontier cities.'
WHERE Tag = 'TXT_KEY_UNIT_BANDEIRANTES_STRATEGY';

UPDATE Language_en_US 
SET Text = 'Unique Brazilian Adventurer. Generates [ICON_GOLD] Gold, [ICON_CULTURE] Culture, and [ICON_RESEARCH] Science whenever you reveal tiles with this Unit. Can construct Forts, Quarries, Mines, and Brazilwood Camps in owned territory.'
WHERE Tag = 'TXT_KEY_UNIT_BANDEIRANTES_HELP';

-- 2H Swordsman
INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_UNIT_EE_2HANDER', 'Two-Handed Swordsman'),
('TXT_KEY_UNIT_EE_2HANDER_PEDIA', 'Two-Handed Swordsman who were active in Italy and Spain during the Renaissance. As an auxiliary class in charge of covering the flanks of the Tercio formation, they were very active until the end of Reconquista and the beginning of the Italian War. In the middle of the 16th century, on the grounds that it was better to give musketeers and pike spearmen education in swordsmanship because their position in Tercio was ambiguous, where the battle was completed with the concentrated attack of the musketeers and the dense defense of the pikemen. It has been culled. However, they were still used in irregular warfare, and they played a key role in the process of conquest of America, where it was not possible to spin and weave a tercio square like in Europe. In fact, in a situation where the supply and demand of gunpowder was limited, firearms had a great psychological impact, but in fact, their effectiveness was greatly reduced. On the other hand, the Toledo steel swords of Spanish prosecutors were difficult to overcome with the technology of Native Americans at the time. At that time, even if the natives captured the sword, they did not know how to handle it, so they tied it to the spearhead and used it like a spear.'),
('TXT_KEY_UNIT_EE_2HANDER_STRATEGY', 'Two-Handed Swordsman is much stronger than the Longswordsman, and gains a devastating combat bonus when attacking Spearmen, {TXT_KEY_UNIT_PIKEMAN}, {TXT_KEY_UNIT_SPANISH_TERCIO} and {TXT_KEY_UNIT_FCOMPANY}.'),
('TXT_KEY_UNIT_EE_2HANDER_HELP', 'Early Renaissance Era Melee Unit. Additional +33% [ICON_WAR] Attack against Spearmen, {TXT_KEY_UNIT_PIKEMAN}, {TXT_KEY_UNIT_SPANISH_TERCIO} and {TXT_KEY_UNIT_FCOMPANY}. Starts with the [COLOR_POSITIVE_TEXT]Cover I[ENDCOLOR] Promotion.');

-- French Musketeer
UPDATE Language_en_US
SET Text = 'Unique French {TXT_KEY_UNIT_EE_2HANDER} that excels at delivering a fast attack into the enemy. Instead of the [COLOR_POSITIVE_TEXT]{TXT_KEY_PROMOTION_2HANDER}[ENDCOLOR] Promotion, it can move faster and ignore Zone of Control.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_MUSKETEER';
UPDATE Language_en_US
SET Text = 'The {TXT_KEY_UNIT_FRENCH_MUSKETEER} is a French Unique Unit, replacing the {TXT_KEY_UNIT_EE_2HANDER}. It is more powerful, and has different Promotions which allow it to move faster and ignore Zone of Control.'
WHERE Tag = 'TXT_KEY_UNIT_FRENCH_MUSKETEER_STRATEGY';

-- German Landsknecht (Doppelsoeldner)
UPDATE Language_en_US
SET Text = 'Doppelsöldner'
WHERE Tag = 'TXT_KEY_UNIT_GERMAN_LANDSKNECHT';
UPDATE Language_en_US
SET Text = 'Unique German {TXT_KEY_UNIT_EE_2HANDER} that specializes as mercenaries, having no experience penalty or cooldown while being able to move immediately when purchased. Starts with [COLOR_POSITIVE_TEXT]{TXT_KEY_PROMOTION_FORMATION_1}[ENDCOLOR] and [COLOR_POSITIVE_TEXT]{TXT_KEY_PROMOTION_FORMATION_2}[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_UNIT_HELP_LANDSKNECHT';
UPDATE Language_en_US
SET Text = 'The {TXT_KEY_UNIT_GERMAN_LANDSKNECHT} is the German unique unit, replacing the {TXT_KEY_UNIT_EE_2HANDER}. It has a combat bonus against full health units, and a increased bonus against mounted units. It is also slightly cheaper to train or purchase, and gain full XP and can move immediately when bought.[NEWLINE][NEWLINE]Use their fast deployment and their bonus against full health units to surprise your opponents in the first turns of your wars and break their lines quickly. Its cheap cost also makes it an excellent gift. Buy several units at once, walk them over to a nearby City-State, and reap the benefits of both short- and long-term influence.'
WHERE Tag = 'TXT_KEY_UNIT_GERMAN_LANDSKNECHT_STRATEGY';
UPDATE Language_en_US
SET Text = 'Doppelsöldner or "double-pay men" were part of the pike-and-shot era of warfare in Europe who volunteered to fight in the front line, in exchange for double payment. Roughly one-in-four men in a composition were front line soldiers who formed wings in front of the pikemen, who themselves defended to crossbowmen and/or arquebusiers. Although aimed with light ranged weapons, the main tool of the doppelsoeldner was the Zweihaender, a gigantic two-handed sword used to decapitate enemy pikes, and their wielders!'
WHERE Tag = 'TXT_KEY_CIVILOPEDIA_UNITS_MEDIEVAL_LANDSKNECHT_TEXT';

-- Tercio
UPDATE Language_en_US
SET Text = 'Pike-and-Shot'
WHERE Tag = 'TXT_KEY_UNIT_SPANISH_TERCIO';
UPDATE Language_en_US
SET Text = 'The Pike-and-Shot is the basic Melee Unit of the Renaissance Era, able to easily stand up to the terrifying Knights of the Medieval Era.'
WHERE Tag = 'TXT_KEY_CIV5_SPAIN_TERCIO_HELP';
UPDATE Language_en_US
SET Text = 'Like previous defensive Units that also did not require Iron, the Pike-and-Shot is the bread-and-butter frontline troop. It also has access to [COLOR_POSITIVE_TEXT]Pike Tactics[ENDCOLOR], which can enable it to be used offensively when initiating against the foe. However, in the Renaissance period the powerful Greatswordsman also becomes available, which for the first time represents a direct counter. Therefore although Mounted Units are less intimidating, care must still be taken to design an effective army composition without a single point of failure.'
WHERE Tag = 'TXT_KEY_CIV5_SPAIN_TERCIO_STRATEGY';
UPDATE Language_en_US
SET Text = 'Pike-and-Shot referes to a tactical formation that first appeared during the late 15th and early 16th centuries, and was used until the development of the bayonet in the late 17th century. This type of formation combined soldiers armed with pikes and soldiers armed with arquebuses and/or muskets. Other weapons such as swords, halberds, and crossbows were also sometimes used. The formation was initially developed by the Holy Roman Imperial (Landsknechte) and Spanish (Tercios) infantries.[NEWLINE][NEWLINE]The tactic hinges on the control offered by the Pike, a reinforced polearm often well-over 4 metres long. Although excellent defensively, its unwieldiness made it vulnerable to being outmaneuvered, and only well-trained units could use it in an effective offensive manner. To overcome these weaknesses, Pikemen were paired with Arquebusiers, extremely primitive (matchlock) firearms. Pike-and-Shot was so successful many battles of the time devolved into large numbers of immobilized men pushed up against each other in a deadly crush known as a "push of pike", and massive two-handed swords were constructed specifically to disarm Pikemen.'
WHERE Tag = 'TXT_KEY_CIV5_SPAIN_TERCIO_TEXT';

UPDATE Language_en_US
SET Text = 'Javelin Volley'
WHERE Tag = 'TXT_KEY_PROMOTION_RANGED_SUPPORT_FIRE';

INSERT OR REPLACE INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_PROMOTION_KNOCKOUT_HELP', '+33% [ICON_STRENGTH] Combat Strength VS [COLOR_POSITIVE_TEXT]Gunpowder Units[ENDCOLOR].');

UPDATE Language_en_US
SET Text = 'Unique Zulu {TXT_KEY_UNIT_SPANISH_TERCIO} that excels at defeating Gunpowder Units. Starts with the Javelin Volley Promotion. Also starts with Cover I.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_ZULU_IMPI';
UPDATE Language_en_US
SET Text = 'The {TXT_KEY_UNIT_ZULU_IMPI} is a Zulu Unique Unit, replacing the {TXT_KEY_UNIT_SPANISH_TERCIO}. Besides being much stronger and more expensive to build than the {TXT_KEY_UNIT_PIKEMAN}, it takes notably less compared to other contemporary units. Its shield gives it Cover I, reducing damage from ranged attacks, and before engaging in an melee attack, it performs a spear throw attack that weakens the defender before melee combat ensues. It also has a [ICON_STRENGTH] Combat Strength bonus when fighting against Gunpowder Units, making it a deadly unit well into the Industrial Era.'
WHERE Tag = 'TXT_KEY_UNIT_ZULU_IMPI_STRATEGY';

-- cannon
UPDATE Language_en_US
SET Text = 'Bombard'
WHERE Tag = 'TXT_KEY_UNIT_CANNON';

UPDATE Language_en_US
SET Text = 'Bombard is an important mid-game siege unit, and is overwhelming against civilizations that have yet to develop rag cannons. Moves twice as slowly in enemy territory as other siege units. Even though the times have passed, the siege ability is still superior. It cannot see as far as other units and must be protected by melee units.'
WHERE Tag = 'TXT_KEY_UNIT_CANNON_STRATEGY';

UPDATE Language_en_US
SET Text = 'The Bombard (an early version of the cannon) is a huge tubular gun barrel originally invented in China around the 12th century AD that uses gunpowder or other explosives to fire projectiles quickly over long distances. The Mongols quickly adopted cannons, and they were used to great effect in China and Korea. The Mongols seem to have introduced cannons to the Islamic world, and Europeans got to know them from the Muslims. Early cannons were very large and often exploded when fired, making them dangerous to use and a tremendous threat to both the target and the gunner. However, improvements in the quality of the castings of the Renaissance equipment made it possible to create smaller and more reliable cannons that could be dragged into battle with a few horses or mounted on ships.[NEWLINE][NEWLINE]When the war between France and England was at its peak, rip-and-rock guns were used in earnest in Europe, and eventually the French army was able to win the 100 Years War against England.'
WHERE Tag = 'TXT_KEY_UNIT_CIV5_CANNON_PEDIA';

UPDATE Language_en_US
SET Text = 'An Siege-unit from the Renaissance-Era. [ICON_MOVES] Movement within enemy territory is halved.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_CANNON';

--------------------------------------------------------------------------------------------------------------------------
-- WOMDERS
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Language_en_US (Tag, Text) VALUES
-- Fassil Ghebbi
('TXT_KEY_BUILDING_EE_FASIL_GHEBBI', 'Fasil Ghebbi'),
('TXT_KEY_WONDER_EE_FASIL_GHEBBI_HELP', 'Friendly military Units within 3-tiles of Fasil Ghebbi gain +25% [ICON_STRENGTH] Combat Strength. City gains an additional +100 HP and +5 [ICON_STRENGTH] Defense. Increases the [ICON_WAR] Military Unit Supply Cap by 5.'),
('TXT_KEY_WONDER_EE_FASIL_GHEBBI_QUOTE', '[NEWLINE]"When spiders unite, they can bring down a lion."[NEWLINE] - Ethiopian Proverb[NEWLINE]'),
('TXT_KEY_WONDER_EE_FASIL_GHEBBI_PEDIA', 'Fasil Ghebbi is a fortress in Gondar, along the hillside of Ethiopia. During the 17th and 18th centuries it served as the enclosure for Ethiopia’s emperors. The architecture of the fort is unique to Ethiopia, bending the styles of Nubian, Arabian and Baroque architecture. The site houses castles, Iyasu’s Palace, stables and three churches amongst other rooms. Before the building of the fort in about 1635 the emperors of Ethiopia travelled and lived off the land, resting in tents. Emperor Fasilides broke this tradition by founding the city of Gondar and establishing it as his capital. Upon founding the city Fasilides then instructed the creation of ‘Fasil Gemb’ - Fasilides Castle. Since his death later emperors expanded on Fasil Gemb to eventually cover roughly 70,000 square meters of fortified space. The historian Thomas Pakenham visited the site during the 1950’s, noting that among the halls and palaces were what appeared to be pavilions and kiosks of the imperial city therein. Since 1979 Fasil Ghebbi is a World Heritage Site.'),
-- Kronborg
('TXT_KEY_BUILDING_EE_KRONBORG', 'Kronborg'),
('TXT_KEY_WONDER_EE_KRONBORG_HELP', '+50 HP, +3 [ICON_STRENGTH] Defense and +1 Military Unit Supply Cap in all Coastal Cities. +50% [ICON_PRODUCTION] Production for Naval Combat Units in the City. Receive a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] [ICON_GREAT_ADMIRAL] Great Admiral.[NEWLINE][NEWLINE]City must be built on the Coast.'),
('TXT_KEY_WONDER_EE_KRONBORG_QUOTE', '[NEWLINE]"Where there is no discipline, there is no honour."[NEWLINE] - Norse Saying[NEWLINE]'),
('TXT_KEY_WONDER_EE_KRONBORG_PEDIA', 'Kronborg is a large star fortress located on the North-eastern tip of the Danish island of Zealand, near the town of Helsingør. It was constructed under the reign of Eric of Pomerania during the 1420s. Along with Kärnan, another Danish fortress situated across the 4km wide Øresund, it was built predominantly to control the entrance to the Baltic Sea. This allowed for the Danish King to demand Øresundstolden, or Sound Dues. This was where all ships entering the Baltic had to pay a tax to the Danish king. If they refused, the cannons on either side of the sound would open fire on the ship and sink it. [NEWLINE][NEWLINE]In 1585 the castle was rebuilt under Frederick II of Denmark. This is when the castle became the large Rennaisance castle which it is now. In 1639 the castle was rebuilt by King Christian IV, after a fire ten years earlier. Less than 20 years later the castle was conquered by a Swedish army under Carl Gustaf Wrangel. Following this, the castle was heavily fortified moreso than before.'),
('TXT_KEY_EE_KRONBORG_DUMMY', 'EE: Kronborg Dummy'),
-- ROYALSOC
('TXT_KEY_BUILDING_EE_ROYALSOC', 'The Royal Society'),
('TXT_KEY_WONDER_EE_ROYALSOC_HELP', 'Gain a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Great Scientist. +2 [ICON_RESEARCH] Science from all Universities, Polytechnics, and Research Labs. +2 [ICON_RESEARCH] Science and [ICON_GOLDEN_AGE] Golden Age Points from all Academies in the Empire. [ICON_HAPPINESS_3] Unhappiness from [ICON_RESEARCH] Illiteracy in all Cities is reduced by [COLOR_POSITIVE_TEXT]10%[ENDCOLOR].'),
('TXT_KEY_WONDER_EE_ROYALSOC_QUOTE', '[NEWLINE]"Nullius in verba."[NEWLINE] - Motto of The Royal Society[NEWLINE]'),
('TXT_KEY_WONDER_EE_ROYALSOC_PEDIA', 'The Royal Society, formally The Royal Society of London for Improving Natural Knowledge, is a learned society and the United Kingdom''s national academy of sciences. The society fulfils a number of roles: promoting science and its benefits, recognising excellence in science, supporting outstanding science, providing scientific advice for policy, education and public engagement and fostering international and global co-operation. Founded on 28 November 1660, it was granted a royal charter by King Charles II and is the oldest continuously existing scientific academy in the world.[NEWLINE][NEWLINE]The number of fellows had increased from 110 to approximately 300 by 1739, the reputation of the society had increased under the presidency of Sir Isaac Newton from 1703 until his death in 1727, and editions of the Philosophical Transactions of the Royal Society were appearing regularly. During his time as president, Newton arguably abused his authority; in a dispute between himself and Gottfried Leibniz over the invention of infinitesimal calculus, he used his position to appoint an "impartial" committee to decide it, eventually publishing a report written by himself in the committee''s name.'),
-- Topkapi
('TXT_KEY_BUILDING_EE_TOPKAPI', 'Topkapi Palace'),
('TXT_KEY_WONDER_EE_TOPKAPI_HELP', '+1 [ICON_PEACE] Faith from Defensive Buildings. Contains 2 slots of [ICON_GREAT_WORK] Great Works of Art and Artifacts, and comes with a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] [ICON_VP_ARTIFACT] Artifact. +3 [ICON_PRODUCTION] Production and [ICON_RESEARCH] Science if [COLOR_POSITIVE_TEXT]Themed[ENDCOLOR].'),
('TXT_KEY_WONDER_EE_TOPKAPI_QUOTE', '[NEWLINE]"The city and the buildings are mine; but I resign to your valor the captives and the spoil, the treasures of gold and beauty; be rich and be happy."[NEWLINE] - Mehmet II[NEWLINE]'),
('TXT_KEY_WONDER_EE_TOPKAPI_PEDIA', 'Overlooking the waters of the Bosphorous, Topkapi Palace is a large palace complex located on the European side of Istanbul, Turkey. It was constructed under the orders of Mehmed II "The Conqueror", under whom the city was captured from the Byzantines and renamed Istanbul, as part of a scheme to re-build the city following the sucessful Ottoman siege. The palace served as the official residence of the Ottoman sultans for nearly four centuries of their rule, lasting until Sultan Abdul Mecid I moved the court to a newly-built palace further up the Bosphorous in 1856. Topkapi Palace is in fact more of a walled village than a palace, with several small buildings and many courtyards as opposed to one central structure. The site is home to many relics and artefacts collected both by the Sultans and following the end of the Ottoman empire when the palace was turned into a Museum. Among these are relics sacred to the Islamic world, including a door to the Great Mosque of Mecca, as well as what is said to be the cloak and sword of the prophet Muhammed. Other items include many collected from Silk Road trade, such as various pieces of Chinese porcelain from across four different dynasties of rule, and a collection of Islamic weaponry spanning approximately 13 centuries. Although the palace is largely still intact, some parts have since been lost as a result of either Earthquakes or fire.'),
-- Torre del Oro
('TXT_KEY_BUILDING_EE_TORRE', 'Torre Del Oro'),
('TXT_KEY_WONDER_EE_TORRE_HELP', 'Naval trade routes originating from this City have a 50% increase in range, and provide +3 [ICON_GOLD] Gold for both parties. Grants +1 [ICON_INTERNATIONAL_TRADE] Trade Route and a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Drydock.[NEWLINE][NEWLINE]City must be built on the [COLOR_CYAN]Coast[ENDCOLOR].'),
('TXT_KEY_WONDER_EE_TORRE_QUOTE', '[NEWLINE]"Gold is a treasure, and he who possesses it does all he wishes to in this world, and succeeds in helping souls into paradise"[NEWLINE] - Christopher Columbus[NEWLINE]'),
('TXT_KEY_WONDER_EE_TORRE_PEDIA', 'Torre Del Oro (Spanish for Tower of Gold) was constructed in the Spanish city of Seville during the 13th century by Berbers who were occupying Southern Spain at the time. It was originally constructed as a military watchtower, however after the Reconquista and discovery of the new world it was used as a treasury of sorts, storing precious metals which had been shipped from the new worlds aboard Spanish treasure fleets, inadvertedly transforming Seville into a very wealthy city and "gateway to the new world".'),
-- Versailles
('TXT_KEY_BUILDING_EE_VERSAILLES', 'Versailles'),
('TXT_KEY_WONDER_EE_VERSAILLES_HELP', 'Receive a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Gallery in the City in which it is built. [NEWLINE]10% of [ICON_GOLD] Gold created by all Cities in the Empire counts as [ICON_CULTURE] Culture Per Turn. [NEWLINE]All owned Monuments, Amphitheaters, Galleries, Opera Houses gain +2 [ICON_GOLD] Gold.'),
('TXT_KEY_WONDER_EE_VERSAILLES_QUOTE', '[NEWLINE]"Every time I create an appointment, I create a hundred malcontents and one ingrate."[NEWLINE] - Louis XIV[NEWLINE]'),
('TXT_KEY_WONDER_EE_VERSAILLES_PEDIA', 'The Château de Versailles is one of the most beautiful achievements of 18th-century French art. The site began as Louis XIII''s hunting lodge before his son Louis XIV transformed and expanded it, moving the court and government of France to Versailles in 1682. Each of the three French kings who lived there until the French Revolution added improvements to make it more beautiful.[NEWLINE][NEWLINE]The château lost its standing as the official seat of power in 1789 but acquired a new role in the 19th century as the Museum of the History of France, which was founded at the behest of Louis-Philippe, who ascended to the throne in 1830. That is when many of the château''s rooms were taken over to house the new collections, which were added to until the early 20th century, tracing milestones in French history.'),
-- Wat Phra Kaew
('TXT_KEY_BUILDING_EE_WAT_PHRA_KAEW', 'Wat Phra Kaew'),
('TXT_KEY_WONDER_EE_WAT_PHRA_KAEW_HELP', '+2 [ICON_RESEARCH] Science from Temples and Seminaries. +2 [ICON_PEACE] Faith and [ICON_TOURISM] Tourism from Holy Sites in the Empire. Receive a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Stupa in the City.[NEWLINE][NEWLINE]City must be built on a [COLOR_CYAN]River[ENDCOLOR].'),
('TXT_KEY_WONDER_EE_WAT_PHRA_KAEW_QUOTE', '[NEWLINE]"Better than a thousand useless words is one useful word, hearing which one attains peace."[NEWLINE] - The Dhammapada, verse 100[NEWLINE]'),
('TXT_KEY_WONDER_EE_WAT_PHRA_KAEW_PEDIA', 'Wat Phra Kaew, or the Temple of the Emerald Buddha, (officially known as Wat Phra Sri Rattana Satsadaram) is regarded as the most important Buddhist temple in Thailand. Located in the historic centre of Bangkok, within the grounds of the Grand Palace, it enshrines Phra Kaew Morakot (the Emerald Buddha), the highly revered Buddha image meticulously carved from a single block of jade. The Emerald Buddha (Phra Putta Maha Mani Ratana Patimakorn) is a Buddha image in the meditating position in the style of the Lanna school of the north, dating from the 15th century AD.[NEWLINE][NEWLINE]Raised high on a series of platforms, no one is allowed near the Buddha except the King. A seasonal cloak, changed three times a year to correspond to the summer, winter, and rainy season covers the statue. A very important ritual, the changing of the robes is performed only by the King to bring good fortune to the country during each season.[NEWLINE][NEWLINE]The construction of the temple started when King Buddha Yodfa Chulaloke (Rama I) moved the capital from Thonburi to Bangkok in 1785. Unlike other temples, it does not contain living quarters for monks; rather, it has only elaborately decorated holy buildings, statues, and pagodas. The main building is the central "ubosot" (ordination hall), which houses the Emerald Buddha.'),
-- Tower of Buddhist Incense
('TXT_KEY_BUILDING_EE_SUMMER_PALACE', 'Summer Palace'),
('TXT_KEY_BUILDING_EE_SUMMER_PALACE_HELP', 'Provides a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] [ICON_GREAT_PEOPLE] Great Person of your choice near the [ICON_CAPITAL] Capital. +2 [ICON_TOURISM] Tourism to all Menageries in the Empire.[NEWLINE][NEWLINE]The [ICON_PRODUCTION] Production Cost and [ICON_CITIZEN] Population Requirements increase based on the number of cities you own.'),
('TXT_KEY_BUILDING_EE_SUMMER_PALACE_PEDIA', 'Built in stages during the late-Medieval and Early Modern periods, the Summer Palace was a large, splendid edifice to the power and might of the early Qing Dynasty and a counterpart to the Emperor''s main residence in Beijing. Famous for its exquisite landscaping, lush gardens, and spectacular vista, the Summer Palace remains an important symbol of the power of Early Modern China and a popular tourist destination.'),
('TXT_KEY_BUILDING_EE_SUMMER_PALACE_STRATEGY', 'The main attraction of this National Wonder is a simple Great Person. It also provides Tourism to all Mengaries, bringing them up to par with the other yield-per-population Buildings that unlock in the Enlightenment Era.');

REPLACE INTO Language_en_US
	(Tag, Text)
VALUES
	('TXT_KEY_BUILDING_SUMMER_PALACE', 'Tower of Buddhist Incense'),
	('TXT_KEY_CIV5_BUILDINGS_SUMMER_PALACE_TEXT', 'Located right in the centre of the front hill of Longevity Mountain in the Summer Palace, the tower was originally meant to be a nine-storey Buddhist pagoda built to resemble the Yellow Crane Tower. The Qianlong Emperor ordered the construction to be stopped just after the eighth storey was built. On the first day and fifteenth day of each lunar month, Empress Dowager Cixi visited the tower to offer incense and pray. [NEWLINE][NEWLINE]The Summer Palace is a complex of gardens, lakes and buildings that was constructed in Beijing under the order of the Qianlong Emperor, of the Qing Dynasty, in 1749. The project required the creation of artificial lakes in the area, as the palace and surrounding farmland required waterworks and irrigation. The palace''s design was based off of various aspects of China''s myths, legends, and natural and man-made wonders. The palace fell into decline along with the Qing dynasty, and was damaged by the British and French during the Second Opium War. After the fall of Qing, the complex fell into the possession of the former imperial family, now powerless. It was opened to the public in 1924, after the last emperor, Puyi, was expelled. Since 1953, the government of the People''s Republic of China have renovated the palace, which is now a World Heritage Site.');

INSERT INTO Language_en_US (Tag, Text) VALUES
('TXT_KEY_BUILDING_EE_DERWENT_MILLS', 'Derwent Mills'),
('TXT_KEY_WONDER_EE_DERWENT_MILLS_HELP', 'Provides a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Cloth Mill in the City. +2 [ICON_GOLD] Gold from Cloth Mills, Seaports, and Coaling Stations in the Empire.'),
('TXT_KEY_WONDER_EE_DERWENT_MILLS_QUOTE', '[NEWLINE]"It is known, to the force of a single pound weight, what the engine will do; but, not all the calculators of the National Debt can tell me the capacity for good or evil..."[NEWLINE] - Charles Dickens, Hard Times[NEWLINE]'),
('TXT_KEY_WONDER_EE_DERWENT_MILLS_PEDIA', 'Derwent Valley Mills is a World Heritage Site along the River Derwent in Derbyshire, England. The modern factory, or "mill", system was born here in the 18th century to accommodate the new technology for spinning cotton developed by Richard Arkwright. With advancements in technology, it became possible to produce cotton continuously. The system was adopted throughout the valley, and later spread so that by 1788 there were over 200 Arkwright-type mills in Britain. Arkwright''s inventions and system of organising labour was exported to Europe and the United States.[NEWLINE][NEWLINE]Water-power was first introduced to England by John Lombe at his silk mill in Derby in 1719, but it was Richard Arkwright who applied water-power to the process of producing cotton in the 1770s. His patent of a water frame allowed cotton to be spun continuously, meaning it could be produced by unskilled workers. Cromford Mill was the site of Arkwright''s first mill, with nearby Cromford village significantly expanded for his then-new workforce; this system of production and workers'' housing was copied throughout the valley. To ensure the presence of a labour force, it was necessary to construct housing for the mill workers. Thus, new settlements were established by mill owners around the mills – sometimes developing a pre-existing community – with their own amenities such as schools, chapels, and markets. Most of the housing still exists and is still in use. Transport infrastructure was built to open new markets for the mills'' produce.'),
--Belem Tower
('TXT_KEY_BUILDING_EE_BELEM_TOWER', 'Belém Tower'),
('TXT_KEY_WONDER_EE_BELEM_TOWER_HELP', ' A [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] [ICON_GREAT_ADMIRAL]Great Admiral and two Adventurers appear near the City. Land Units trained in this city have +20% [ICON_STRENGTH] Defense and +1 [ICON_VP_VISION] Sight whilst Embarked.[NEWLINE][NEWLINE]City must be built on Coast.'),
('TXT_KEY_WONDER_EE_BELEM_TOWER_QUOTE', '[NEWLINE]"And the sea will grant each man new hope... his sleep brings dreams of home."[NEWLINE] - Christopher Columbus[NEWLINE]'),
('TXT_KEY_WONDER_EE_BELEM_TOWER_PEDIA', 'The Belém Tower sits at the mouth of the Tagus River, just outside the city of Lisbon. The idea of the tower came from João II, though he died before planning or building could start. His successor, Manuel I, instead designed and built the tower. Unusually, it was built on a small island as a sort of sea fort, intended to be a defence mechanism for Lisbon’s potentially vulnerable coast. However, there is a popular belief that the tower was initially built inland, but shifted out to sea by the Great Lisbon Earthquake. The building was completed in 1519, and over the coming years, it was improved and strengthened to be more effective against potential attacks. However, the Belém Tower is perhaps best known for its role in the Portuguese Renaissance - or, more specifically, an icon of the colonisation of the New World. As an island fortress, just outside the shipbuilding hub of Portugal, the Belém Tower would have been the last sight that ships going on their maiden voyage would have seen. In later years, the tower also took up the role of a customs house that ships were required to pay tax to, and the main navigation lookout of Lisbon. Over the years, it also served as a military garrison, given its capabilities as a coastal garrison. Today, the Belém Tower is a popular tourist destination, as not only does it have a long history, but architecture considered to be among the best examples of the Manueline style, a late gothic Portuguese building form');

-- Sistine Chapel
UPDATE Language_en_US
SET Text = '+10% [ICON_CULTURE] Culture in all Cities. +2 [ICON_PEACE] Faith and [ICON_TOURISM] Tourism from all Seminaries in the Empire. Contains 2 slots for [ICON_GREAT_WORK] Great Works of Art or Artifacts. +3 [ICON_PEACE] Faith and [ICON_CULTURE] Culture if [COLOR_POSITIVE_TEXT]Themed[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_WONDER_SISTINE_CHAPEL_HELP';

--------------------------------------------------------------------------------------------------------------------------
-- BUIDINGS
--------------------------------------------------------------------------------------------------------------------------

INSERT INTO Language_en_US (Tag, Text) VALUES
-- Academy
('TXT_KEY_BUILDING_EE_ACADEMY', 'Polytechnic'),
('TXT_KEY_BUILDING_EE_ACADEMY_HELP', '+1 [ICON_RESEARCH] Science for every 6 [ICON_CITIZEN] Citizens in the City. Cost of [ICON_GOLD] Gold purchasing in this City reduced by 10%. Receive 20 [ICON_RESEARCH] Science and 10 [ICON_GREAT_GENERAL] Great General Points when you unlock a Technology, scaling with Era.[NEWLINE][NEWLINE]+20% [ICON_GREAT_SCIENTIST] Great Scientist, [ICON_GREAT_ENGINEER] Great Engineer, [ICON_GREAT_MERCHANT] Great Merchant, and [ICON_DIPLOMAT] Great Diplomat rate in the City.[NEWLINE][NEWLINE]City must not contain a [COLOR_NEGATIVE_TEXT]Seminary[ENDCOLOR].'),
('TXT_KEY_BUILDING_EE_ACADEMY_STRATEGY', 'The Polytechnic is an Enlightenment Era building which increases the [ICON_RESEARCH] Science output of a city. It may not be built in a city with an Parlour, forcing cities to specialise in either Culture or Science.'),
('TXT_KEY_BUILDING_EE_ACADEMY_PEDIA', 'A polytechnic or "Grande école" is a specialized top-level educational institution in France and some other countries such as Morocco and Tunisia, comparable to other elite institutions like the Ivy League or Oxbridge universities. The first polytechnic was founded in 1794 by mathematician Gaspard Monge during the French Revolution to address the shortage of engineers and military officers, and was militarized under Napoleon I in 1804. It is still supervised by the French Ministry of Armed Forces. As they are separate from universities, most of them do not deliver the undergraduate degree of the Licence (the bachelor''s degree in France) but deliver master''s grande école degrees such as the Engineer''s Diploma.'),
-- Seminary
('TXT_KEY_BUILDING_EE_SEMINARY', 'Seminary'),
('TXT_KEY_BUILDING_EE_SEMINARY_HELP', '+1 [ICON_PEACE] Faith for every 6 [ICON_CITIZEN] Citizens in the City. Refund 10% of all [ICON_PEACE] Faith spent on purchases in this City. Receive 10 [ICON_PEACE] Faith and 20 [ICON_GOLDEN_AGE] Golden Age Points when you unlock a Technology, scaling with Era.[NEWLINE][NEWLINE]Boosts starting Religious Strength of all [ICON_MISSIONARY] Missionaries by 5%.[NEWLINE][NEWLINE]City must not contain a [COLOR_NEGATIVE_TEXT]Polytechnic[ENDCOLOR].'),
('TXT_KEY_BUILDING_EE_SEMINARY_STRATEGY', 'Love Jesus. LOVE Jesus.'),
('TXT_KEY_BUILDING_EE_SEMINARY_PEDIA', 'A seminary, school of theology, theological college, or divinity school is an educational institution for educating students (sometimes called seminarians) in scripture and theology, generally to prepare them for ordination to serve as clergy, in academics, or mostly in Christian ministry. The establishment of seminaries in modern times resulted from Roman Catholic reforms of the Counter-Reformation after the Council of Trent. These Tridentine seminaries placed great emphasis on spiritual formation and personal discipline as well as the study, first of philosophy as a base, and, then, as the final crown, theology. The oldest Catholic seminary in the United States is St. Mary''s Seminary and University in Baltimore founded in 1791. An similar concept in Judaism is the Yeshiva and Midrasha systems, and in Islam we often refer to the Madrassa (though the term is much broader).'),
-- Cloth Mill
('TXT_KEY_BUILDING_EE_CLOTH_MILL', 'Cloth Mill'),
('TXT_KEY_BUILDING_EE_CLOTH_MILL_HELP', '+1 [ICON_PRODUCTION] Production for every 6 [ICON_CITIZEN] Citizens in the City.[NEWLINE][NEWLINE]Nearby River: +1 [ICON_GOLD] Gold.[NEWLINE]Nearby [ICON_RES_SHEEP] Sheep: +1 [ICON_PRODUCTION] Production and [ICON_GOLD] Gold.[NEWLINE]Nearby [ICON_RES_DYE] Dye: +2 [ICON_GOLD] Gold and +1 [ICON_CULTURE] Culture.[NEWLINE]Nearby [ICON_RES_COTTON] Cotton: +3 [ICON_GOLD] Gold.[NEWLINE]Nearby [ICON_RES_SILK] Silk: +2 [ICON_GOLD] Gold and +1 [ICON_TOURISM] Tourism.[NEWLINE]Nearby [ICON_RES_FUR] Furs: +1 [ICON_GOLD] Gold and +2 [ICON_TOURISM] Tourism.'),
('TXT_KEY_BUILDING_EE_CLOTH_MILL_STRATEGY', 'The Cloth Mill is an Enlightenment Era building which increases the Production of the City, especially if working many River tiles. It also boosts the Gold and Culture output of a small set of Resources, making the Building much more important if you should have access to them in this City.'),
('TXT_KEY_BUILDING_EE_CLOTH_MILL_PEDIA', 'A cloth mill is an early mechanized workshop for the production of yarn and cloth that set the stage for the development of factories during the Industrial Revolution. Initially cloth mills were dependent upon fast-moving streams and rivers to drive their water wheels, but in time they would rely upon steam to turn their machinery. The first cloth mills were developed in northern England in 1740s, but soon spread the American colonies and beyond.'),
-- Drydock
('TXT_KEY_BUILDING_EE_DRYDOCK', 'Drydock'),
('TXT_KEY_BUILDING_EE_DRYDOCK_HELP', '+15% [ICON_PRODUCTION] Production toward Sea Units, and Naval Combat Units created by this City have +15% [ICON_STRENGTH] Combat Strength. +5% [ICON_SILVER_FIST] Military Supply from Population.[NEWLINE][NEWLINE]City must have a [COLOR_CYAN]Harbor[ENDCOLOR].'),
('TXT_KEY_BUILDING_EE_DRYDOCK_STRATEGY', 'The Drydock is a late Enlightenment Era building which increases the combat strength of naval units which are trained in the city. Increases the Military Unit Supply Cap from Population in the City .In order to build a Drydock, the city must first contain a Harbor.'),
('TXT_KEY_BUILDING_EE_DRYDOCK_PEDIA', 'A drydock is a rectangular basin that can be flooded and drained to facilitate the construction and maintenance of ships and other watercraft.  Vessels are constructed or repaired in the drydock while it is drained. Once the vessel is ready to set sail, the dock is filled with water. Most drydocks are stationary docks built along the coast, though mobile floating drydocks exist that can take smaller vessels aboard for repairs.'),
-- Gunsmith
('TXT_KEY_BUILDING_EE_GUNSMITH', 'Gunsmith'),
('TXT_KEY_BUILDING_EE_GUNSMITH_HELP', '+15% [ICON_PRODUCTION] Production towards Land Units. +1 [ICON_WAR] Military Supply.[NEWLINE][NEWLINE]When you Train a Military Unit in this City, gain [ICON_RESEARCH] Science equal to 10% of the Unit''s [ICON_PRODUCTION] Production cost.[NEWLINE][NEWLINE]Nearby [ICON_RES_IRON] Iron: +2 [ICON_PRODUCTION] Production.[NEWLINE]Nearby [ICON_RES_COAL] Coal: +1 [ICON_PRODUCTION] Production and +1 [ICON_RESEARCH] Science.'),
('TXT_KEY_BUILDING_EE_GUNSMITH_STRATEGY', 'The Gunsmith increases the speed at which the City trains Units, and gains Science for doing so. It also has Science amongst its yield benefits, including to nearby Strategic Resources, making it an important investment for research-focussed players.'),
('TXT_KEY_BUILDING_EE_GUNSMITH_PEDIA', 'Gunsmiths are skilled craftsmen devoted to the design, modification, manufacture and repair of firearms. Before the advent of Eli Whitney''s Mill River Armory in the 1790s AD Samuel Colt''s mass production of handguns at his factories in Hartford (USA) and London (UK) in the mid-1800s, the gunsmith shop was a vital establishment in any "civilized" settlement.'),
-- Manor
('TXT_KEY_BUILDING_EE_MANOR', 'Manor'),
('TXT_KEY_BUILDING_EE_MANOR_HELP', '+20 [ICON_GOLDEN_AGE] Golden Age Points when your Borders expand, scaling with Era. +2 [ICON_GOLD] Gold and +1 [ICON_TOURISM] Tourism from Lake tiles. +1 [ICON_PRODUCTION] Production and [ICON_GOLDEN_AGE] Golden Age Point from Villages worked by the City.[NEWLINE][NEWLINE]Nearby [ICON_RES_DEER] Deer: +1 [ICON_FOOD] Food and [ICON_CULTURE] Culture.[NEWLINE]Nearby [ICON_RES_JADE] Jade: +1 [ICON_CULTURE] Culture and +2 [ICON_GOLDEN_AGE] Golden Age Points.[NEWLINE]Nearby [ICON_RES_AMBER] Amber: +1 [ICON_CULTURE] Culture and [ICON_PEACE] Faith.[NEWLINE]Nearby [ICON_RES_PEARLS] Pearls: +1 [ICON_CULTURE] Culture and +2 [ICON_TOURISM] Tourism.[NEWLINE]Nearby [ICON_RES_LAPIS] Lapis Lazuli: +1 [ICON_CULTURE] Culture, [ICON_PEACE] Faith, and [ICON_GOLDEN_AGE] Golden Age Point.[NEWLINE]Nearby [ICON_RES_INCENSE] Incense: +2 [ICON_PEACE] Faith.'),
('TXT_KEY_BUILDING_EE_MANOR_STRATEGY', 'The Manor grants lucrative yields like Culture and Faith based on the Luxury Resources present in the City''s radius, making it desirable if you have any of the listed Luxuries nearby. It also gives several ways of generating Golden Age Points which might fit into your game plan, but can also be foregone in favor of other Buildings.'),
('TXT_KEY_BUILDING_EE_MANOR_PEDIA', 'During the Middle Ages, the manor house was the dwelling of the lord of the manor (or the residential bailiff) and the administrative center of his feudal estate. The medieval manor was generally fortified in proportion to the degree of peaceful settlement of the country or region in which it was located. It served as the center of secular village life, and its great hall was the scene of the manorial court and the place of assembly of the tenantry. With increased prosperity and the desire for more commodious dwellings, the 16th-century manor house evolved into the Renaissance country house. In England more elaborate buildings were constructed, reflecting a new era of formality. The houses were frequently of regular quadrangular plan, with the hall diminished in size and importance. In later years the title of manor house in England lost particular significance, having been adopted by large country mansions that had no manorial foundation.'),
-- Cafe (Old Salon)
('TXT_KEY_BUILDING_EE_SALON', 'Café'),
('TXT_KEY_BUILDING_EE_SALON_HELP', '+1 [ICON_FOOD] Food for every 6 [ICON_CITIZEN] Citizens in the City. +20% [ICON_GREAT_WRITER] Great Writer, [ICON_GREAT_ARTIST] Great Artist, [ICON_GREAT_MUSICIAN] Great Musician rate in the City.[NEWLINE][NEWLINE]Nearby [ICON_RES_SPICES] Cinnamon: +1 [ICON_FOOD] Food, [ICON_GOLD] Gold, and [ICON_TOURISM] Tourism.[NEWLINE]Nearby [ICON_RES_CITRUS] Citrus: +2 [ICON_FOOD] Food and +1 [ICON_RESEARCH] Science.[NEWLINE]Nearby [ICON_RES_COCOA] Cocoa: +2 [ICON_GOLD] Gold and +1 [ICON_TOURISM] Tourism.[NEWLINE]Nearby [ICON_RES_COFFEE] Coffee: +2 [ICON_GOLD] Gold and +1 [ICON_CULTURE] Culture.[NEWLINE]Nearby [ICON_RES_TEA] Tea: +2 [ICON_FOOD] Food and +1 [ICON_CULTURE] Culture.[NEWLINE]Nearby [ICON_RES_SUGAR] Sugar: +2 [ICON_FOOD] Food and [ICON_GOLD] Gold.[NEWLINE][NEWLINE]1 Specialist in this City no longer produces [ICON_HAPPINESS_3] Unhappiness from [ICON_URBANIZATION] Urbanization.'),
('TXT_KEY_BUILDING_EE_SALON_PEDIA', 'The first coffee houses appeared in Damascus in the Arabian Peninsula in the 15th century, then spread to the Ottoman Empire''s capital of Istanbul in the 16th century and in Baghdad. Coffeehouses became popular meeting places where people gathered to drink coffee, have conversations, play board games such as chess and backgammon, listen to stories and music, and discuss news and politics. They became known as "schools of wisdom" for the type of clientele they attracted, and their free and frank discourse.[NEWLINE][NEWLINE]the first Viennese coffeehouse was actually opened by an Armenian merchant named Johannes Diodato. He opened a registered coffeehouse in Vienna in 1685. Over time, a special coffee house culture developed in Habsburg Vienna, with writers, artists, musicians, intellectuals, bon vivants and their financiers meeting in the coffee house. People played cards or chess, worked, read, thought, composed, discussed, argued, observed and just chatted. A lot of information was also obtained in the coffee house, because local and foreign newspapers were freely available to all guests. This form of coffee house culture spread throughout the Habsburg Empire in the 19th century.'),
('TXT_KEY_BUILDING_EE_SALON_STRATEGY', 'The Café offers small bonuses to many yields based on the local Luxuries, whose abundance will determine how highly you prioritize constructing this Building. The Café also boosts the rate at which you obtain cultural Great People, and offers some free Food to help you work the required Specialist slots.'),
-- Tavern
('TXT_KEY_BUILDING_EE_TAVERN', 'Tavern'),
('TXT_KEY_BUILDING_EE_TAVERN_HELP', 'When a Unit [COLOR_POSITIVE_TEXT]created by this City[ENDCOLOR] [ICON_RAZING] Pillages a tile, gain 15 [ICON_GOLD] Gold and [ICON_TOURISM] Tourism, scaling with Era. +15% [ICON_PRODUCTION] Production when training [COLOR_POSITIVE_TEXT]Recon Units[ENDCOLOR], and they receive +30 XP.[NEWLINE][NEWLINE][ICON_RES_FISH] Fish: +1 [ICON_FOOD] Food and [ICON_GOLD] Gold.[NEWLINE]Nearby [ICON_RES_COW] Cattle: +1 [ICON_GOLD] Gold and [ICON_TOURISM] Tourism.[NEWLINE]Nearby [ICON_RES_WHEAT] Wheat, [ICON_RES_MAIZE] Maize, [ICON_RES_RICE] Rice: +2 [ICON_GOLD] Gold.'),
('TXT_KEY_BUILDING_EE_TAVERN_STRATEGY', 'The Tavern reinvigorates the Recon line by compensating for the lack of XP available from discovering new lands. It also rewards Pillaging, which is often best performed by said Units. The other role of the Tavern is to increase the value of most Food-giving Bonus Resources, rewarding you for having invested in a Coastal City.'),
('TXT_KEY_BUILDING_EE_TAVERN_PEDIA', 'Establishments for the dispensation and consumption of alcoholic beverages have been a fixture of cities throughout human civilization. As the Age of Exploration dawned, these establishments took on an increasingly vital role in port cities and coastal settlements. They became essential gathering spots for sailors, traders, and explorers about to embark on long, perilous voyages to unknown lands. These taverns often acted as informal recruiting centers for ships in need of crew and served as hubs for the exchange of maritime information and navigational expertise. These establishments served as sanctuaries for not just wayfaring strangers and thieves but also political malcontents and adventurers.[NEWLINE][NEWLINE]By the mid-16th century, the habit of dining out had become well established among townspeople of all classes. Taverns initiated the custom of offering a daily meal at a fixed time, meeting the needs of transient patrons whose lives were governed by the tides and winds. As taverns became more socially acceptable, the better establishments even served as regular meeting halls and unofficial clubhouses, fostering camaraderie among sailors and explorers and facilitating the exchange of information that was crucial in the Age of Exploration.'),
-- Weigh House
('TXT_KEY_BUILDING_EE_WEIGH_HOUSE', 'Weigh House'),
('TXT_KEY_BUILDING_EE_WEIGH_HOUSE_HELP', '+1 [ICON_GOLD] Gold for every 6 [ICON_CITIZEN] Citizens in the City. Incoming [ICON_ARROW_LEFT] Trade Routes generate +2 [ICON_GOLD] Gold for the City, and +1 [ICON_GOLD] Gold for the [ICON_ARROW_RIGHT] Trade Route owner.[NEWLINE][NEWLINE]Nearby [ICON_RES_GOLD] Gold: +2 [ICON_GOLD] Gold and +1 [ICON_CULTURE] Culture.[NEWLINE]Nearby [ICON_RES_SILVER] Silver: +2 [ICON_GOLD] Gold and +1 [ICON_RESEARCH] Science.[NEWLINE]Nearby [ICON_RES_COPPER] Copper: +2 [ICON_PRODUCTION] Production and [ICON_GOLD] Gold.[NEWLINE]Nearby [ICON_RES_GEMS] Gems: +3 [ICON_GOLD] Gold.[NEWLINE]Nearby [ICON_RES_SALT] Salt: +1 [ICON_FOOD] Food, [ICON_GOLD] Gold, and [ICON_RESEARCH] Science.'),
('TXT_KEY_BUILDING_EE_WEIGH_HOUSE_STRATEGY', 'The weigh house improves the [ICON_GOLD] Gold output, increased if certain Luxury Resources are nearby, and if the City is involved in International Trade Routes.'),
('TXT_KEY_BUILDING_EE_WEIGH_HOUSE_PEDIA', 'A weigh house is building in which goods are weighed so that taxes might be reliably levied on trade within a city and that disputes regarding the quantity and quality of trade goods might be accurately resolved. Such buildings might be controlled by the city, merchant guilds, or, more rarely, but foreign merchants granted special privileges within the city. Prior to the spread of international standard measurements, a typical weigh house could be found near a city''s market or center, or within its town hall, guild hall, or courthouse.'),
-- Menagerie
('TXT_KEY_BUILDING_EE_MENAGERIE', 'Menagerie'),
('TXT_KEY_BUILDING_EE_MENAGERIE_HELP', '+1 [ICON_TOURISM] Tourism for every 6 [ICON_CITIZEN] Citizens in the City. +250 [ICON_TOURISM] Tourism when completed.[NEWLINE][NEWLINE]Nearby [ICON_RES_HORSE] Horses: +1 [ICON_PRODUCTION] Production and [ICON_CULTURE] Culture.[NEWLINE]Nearby [ICON_RES_BANANA] Banana: +2 [ICON_GOLD] Gold and +1 [ICON_TOURISM] Tourism.[NEWLINE]Nearby [ICON_RES_IVORY] Ivory: +2 [ICON_PRODUCTION] Production and [ICON_TOURISM] Tourism.[NEWLINE]Nearby [ICON_RES_WHALE] Whales: +2 [ICON_RESEARCH] Science.[NEWLINE]Nearby [ICON_RES_CORAL] Coral: +1 [ICON_RESEARCH] Science and [ICON_CULTURE] Culture.[NEWLINE][NEWLINE]-1 [ICON_HAPPINESS_3] Unhappiness from [ICON_CULTURE] Boredom.'),
('TXT_KEY_BUILDING_EE_MENAGERIE_STRATEGY', 'The Menagerie boosts yields -- including Science, Culture, and Tourism -- based on nearby Resources, the abundance of which will determine how pressing this Building''s construction is to you. It all has bonuses to Tourism, both raw output and yields from Trade Route completion.'),
('TXT_KEY_BUILDING_EE_MENAGERIE_PEDIA', 'A menagerie is a collection of captive animals, frequently exotic, kept for display; or the place where such a collection is kept, a precursor to the modern zoo or zoological garden. The term was first used in 17th-century France, referring to the management of household or domestic stock. Exotic creatures were captured on voyages to Africa and the East and brought back to Europe to be sold as status symbols to titillate the upper class. Lions, monkeys, parrots, elephants, tigers, and bears, were all difficult to acquire and expensive to maintain in a living and active state, often requiring very particular diets that were either not understood or not readily available. Even during the Middle Ages several sovereigns across Europe maintained menageries at their royal courts. The most prominent animal collection in medieval England was the Tower Menagerie in London that began as early as 1204. It was established by King John, who reigned in England from 1199 to 1216 and is known to have held lions and bears.');

UPDATE Language_en_US
SET Text = 'The Opera House is an Enlightenment Era Building which increases the [ICON_CULTURE] Culture of a City. Also boosts the City''s Great Musician rate and the value of Musicians'' Guilds. Contains 1 slot for a Great Work of Music. Requires an Amphitheater in the City before it can be constructed.'
WHERE Tag = 'TXT_KEY_BUILDING_OPERA_HOUSE_STRATEGY';

UPDATE Language_en_US
SET Text = Replace(Text, '+5% [ICON_CULTURE] Culture in the City. [ICON_GREAT_WORK] Great Works in the City produce +1 [ICON_TOURISM] Tourism. +33% [ICON_GREAT_MUSICIAN] Great Musician Rate in the City.', '+1 [ICON_CULTURE] Culture for every 6 [ICON_CITIZEN] Citizens in the City. [ICON_GREAT_WORK] Great Works in the City produce +1 [ICON_TOURISM] Tourism. +33% [ICON_GREAT_MUSICIAN] Great Musician Rate in the City.[NEWLINE][NEWLINE]Nearby [ICON_RES_CRAB] Crab: +1 [ICON_FOOD] Food, [ICON_GOLD] Gold, and [ICON_TOURISM] Tourism.[NEWLINE]Nearby [ICON_RES_WINE] Wine: +1 [ICON_FOOD] Food, [ICON_GOLD] Gold, and [ICON_CULTURE] Culture.[NEWLINE]Nearby [ICON_RES_TRUFFLES] Truffles: +1 [ICON_GOLD] Gold and +2 [ICON_TOURISM] Tourism.[NEWLINE]Nearby [ICON_RES_OLIVE] Olives: +1 [ICON_FOOD] Food and [ICON_CULTURE] Culture.[NEWLINE]Nearby [ICON_RES_MARBLE] Marble: +1 [ICON_CULTURE] Culture, [ICON_PEACE] Faith, and [ICON_TOURISM] Tourism.')
WHERE Tag = 'TXT_KEY_BUILDING_OPERA_HOUSE_HELP';

UPDATE Language_en_US
SET Text = Replace(Text, '+33% [ICON_GREAT_ARTIST] Great Artist Rate in the City.', '+33% [ICON_GREAT_ARTIST] Great Artist Rate in the City. +1 [ICON_CULTURE] Culture and [ICON_GOLDEN_AGE] Golden Age Point from Manors, Menageries, and Cafés in the City.')
WHERE Tag IN (SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_GALLERY');

UPDATE Language_en_US
SET Text = '+1 [ICON_RESEARCH] Science for every 4 [ICON_CITIZEN] Citizens in the City.[NEWLINE][NEWLINE]-1 [ICON_HAPPINESS_3] Unhappiness from [ICON_RESEARCH] Illiteracy.'
WHERE Tag = 'TXT_KEY_BUILDING_PUBLIC_SCHOOL_HELP';

UPDATE Language_en_US
SET Text = Replace(Text, 'Citizens in the City.', 'Citizens in the City. Gain 25% of the [ICON_RESEARCH] Science of the City as an instant boost when a new [ICON_CITIZEN] Citizen is born.')
WHERE Tag IN (SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_PUBLIC_SCHOOL');

UPDATE Language_en_US
SET Text = Replace(Text, 'for every 2', 'for every 4')
WHERE Tag IN ('TXT_KEY_BUILDING_STOCK_EXCHANGE_HELP', 'TXT_KEY_BUILDING_BROADCAST_TOWER_HELP');

UPDATE Language_en_US
SET Text = '10% of [ICON_FOOD] Food is carried over, and 25% of the [ICON_PEACE] Faith output of the City is added as an instant boost whenever a [ICON_CITIZEN] Citizen is born in this City. +1 [ICON_PEACE] Faith and [ICON_RESEARCH] Science from Marshes worked by this City.[NEWLINE][NEWLINE]Nearby [ICON_RES_FIGS] Figs: +1 [ICON_GOLD] Gold, +1 [ICON_PRODUCTION] Production, +1 [ICON_FOOD] Food.[NEWLINE][NEWLINE]-1 [ICON_HAPPINESS_3] Unhappines from [ICON_GOLD] Poverty.'
WHERE Tag = 'TXT_KEY_BUILDING_GROCER_HELP';

UPDATE Language_en_US
SET Text = 'The Apothecary is a Renaissance-era building which can only be constructed if you have already built an Aqueduct in the City. Like the Aqueduct, the Grocer helps your City grow more quickly and combats Poverty. It also increases Faith output, and is the final Building (other than the Seminary which is exclusive with the Polytechnic) to do so.'
WHERE Tag = 'TXT_KEY_BUILDING_GROCER_STRATEGY';

UPDATE Language_en_US
SET Text = 'An Apothecary, or Pharmacy, is a type of shop that sells medicinal goods such as drugs, ointments, herbal remedies and dressings for wounds. Shops were maintained by specialists who could dispense advice for how to use the medicines they sold as well as other home remedies. Pharmacies in Medieval and Renaissance Europe were often family businesses, or operated out of local monasteries by nuns, which resulted in a large proportion of pharmacies being run by women.[NEWLINE][NEWLINE]The work of a pharmacist requires a great deal of knowledge and specialized education, which brought status and respectability to the job. The role of pharmacists and apothecaries formed the precursor to the modern disciplines of chemistry and pharmacology.'
WHERE Tag = 'TXT_KEY_CIV5_BUILDINGS_GROCER_TEXT';

----------------------------------------------------
-- text updates general
----------------------------------------------------	  
UPDATE Language_en_US
SET Text = REPLACE(Text, 'a Renaissance-era', 'an Enlightenment Era')
WHERE Tag = 'TXT_KEY_BUILDING_FORTRESS_STRATEGY';

UPDATE Language_en_US
SET Text = REPLACE(Text, 'a Renaissance-era', 'an Enlightenment Era')
WHERE Tag = 'TXT_KEY_BUILDING_WINDMILL_STRATEGY';

UPDATE Language_en_US
SET Text = REPLACE(Text, 'Nearby Jungle and Forest tiles gain +1 [ICON_CULTURE] Culture and [ICON_TOURISM] Tourism.', '')
WHERE Tag = 'TXT_KEY_BUILDING_THEATRE_HELP';

UPDATE Language_en_US
SET Text = REPLACE(Text, 'produces additional Culture, and boosts the Culture value of nearby Jungle and Forest tiles', 'and produces additional Culture')
WHERE Tag = 'TXT_KEY_BUILDING_THEATRE_STRATEGY';
