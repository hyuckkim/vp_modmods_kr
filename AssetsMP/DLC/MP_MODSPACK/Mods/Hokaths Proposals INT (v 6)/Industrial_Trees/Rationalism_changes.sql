--------------------
-- Rationalism
--------------------

-- Leader title change
UPDATE Language_ko_KR
SET Text = 'Chancellor {1_PlayerName:textkey} of {2_CivName:textkey}'
WHERE Tag = 'TXT_KEY_RATIONALISM_TITLE';

UPDATE Language_ko_KR
SET Text = '[COLOR_POSITIVE_TEXT]Rationalism[ENDCOLOR] unleashes a wave of new [ICON_CITIZEN] Citizens by providing large [ICON_HAPPINESS_1] Happiness and [ICON_FOOD] Food bonuses. Simultaneously boosts the output of the resulting [ICON_GOLDEN_AGE] Golden Ages and Specialists, especially [ICON_VP_SCIENTIST] Scientists.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Adopting Rationalism grants:[ENDCOLOR][NEWLINE][ICON_BULLET]+1 [ICON_RESEARCH] Science and [ICON_CULTURE] Culture from [ICON_VP_SCIENTIST] Scientists.[NEWLINE][ICON_BULLET]Earn [ICON_GREAT_SCIENTIST] Great Scientists 33% faster.[NEWLINE][ICON_BULLET]+10% [ICON_FOOD] Growth in all Cities.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Each Rationalism policy unlocked grants:[ENDCOLOR][NEWLINE][ICON_BULLET]+5% [ICON_FOOD] Growth in all Cities.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Adopting all Policies in Rationalism grants:[ENDCOLOR][NEWLINE][ICON_BULLET]Unlocks building [COLOR_POSITIVE_TEXT]Bletchley Park[ENDCOLOR].[NEWLINE][ICON_BULLET]+25% Instant Yields from [ICON_GREAT_SCIENTIST] Great Scientists.[NEWLINE][ICON_BULLET]+12 [ICON_SPY] City Security in every City.[NEWLINE][ICON_BULLET]Allows for the purchase of [ICON_GREAT_SCIENTIST] Great Scientists with [ICON_PEACE] Faith starting in the Industrial Era.'
WHERE Tag = 'TXT_KEY_POLICY_BRANCH_RATIONALISM_HELP';

UPDATE Language_ko_KR
SET Text = 'Liberalism'
WHERE Tag = 'TXT_KEY_POLICY_SECULARISM';

UPDATE Language_ko_KR
SET Text = '[COLOR_POSITIVE_TEXT]Liberalism[ENDCOLOR][NEWLINE][ICON_BULLET]+2 [ICON_GOLD] Gold and +1 [ICON_PRODUCTION] Production from Specialists.[NEWLINE][ICON_BULLET]+25% [ICON_GREAT_PEOPLE] Great Person Rate during [ICON_GOLDEN_AGE] Golden Ages.'
WHERE Tag = 'TXT_KEY_POLICY_SECULARISM_HELP';

UPDATE Language_ko_KR
SET Text = 'Philosopher John Locke is often credited with founding liberalism as a distinct tradition based on the social contract, arguing that each man has a natural right to life, liberty and property, and governments must not violate these rights. From the Glorious Revolution of 1688, through the American Revolution and French Revolutions of late 1700s, to the Tanzimat reform of the Ottoman empire beginning in 1839, liberal philosophy was used to justify the armed overthrow of royal sovereignty and the rise of consitutionalism.'
WHERE Tag = 'TXT_KEY_POLICY_SECULARISM_TEXT';

UPDATE Language_ko_KR
SET Text = 'Emancipation'
WHERE Tag = 'TXT_KEY_POLICY_SOVEREIGNTY';

UPDATE Language_ko_KR
SET Text = '[COLOR_POSITIVE_TEXT]Emancipation[ENDCOLOR][NEWLINE][ICON_BULLET]Receive an [COLOR_POSITIVE_TEXT]Instant Boost[ENDCOLOR] of 5 [ICON_CULTURE] Culture and [ICON_GOLDEN_AGE] Golden Age Points for every [ICON_CITIZEN] Citizen in the Empire, scaling with Era.[NEWLINE][ICON_BULLET]+10% [ICON_FOOD] Food during [ICON_GOLDEN_AGE] Golden Ages.[NEWLINE][ICON_BULLET]+1 [ICON_HAPPINESS_1] Happiness from every Zoo, Hotel, and Museum.'
WHERE Tag = 'TXT_KEY_POLICY_SOVEREIGNTY_HELP';

-- +1 [ICON_HAPPINESS_1] Happiness for every 6 [ICON_CITIZEN] Citizens in a City.

UPDATE Language_ko_KR
SET Text = 'Although by the 1850s slavery in the British Empire had been banned for almost half a century, the vaunted bastion of liberal rationalism in America still only extended fundamental rights to white men of property. This was a contentious state of affairs and in 1861 a civil war erupted. It was in this context that President Abraham Lincoln issued an executive order, ''...That on the first day of January, in the year of our Lord, one thousand eight hundred and sixty-three, all persons held as slaves within any State or designated part of a State, the people whereof shall then be in rebellion against the United States, shall be then, thenceforward, and forever free...'''
WHERE Tag = 'TXT_KEY_POLICY_SOVEREIGNTY_TEXT';

UPDATE Language_ko_KR
SET Text = 'Mass Education'
WHERE Tag = 'TXT_KEY_POLICY_HUMANISM';

UPDATE Language_ko_KR
SET Text = '[COLOR_POSITIVE_TEXT]Mass Education[ENDCOLOR][NEWLINE][ICON_BULLET]Receive 1 [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Technology.[NEWLINE][ICON_BULLET]+50% [ICON_PRODUCTION] Production towards Public Schools.[NEWLINE][ICON_BULLET]+1 [ICON_HAPPINESS_1] Happiness, +2 [ICON_CULTURE] Culture, and +3 [ICON_FOOD] Food from Public Schools.'
WHERE Tag = 'TXT_KEY_POLICY_HUMANISM_HELP';

UPDATE Language_ko_KR
SET Text = 'In Sparta boys between the age 6 and 7 left their homes and were sent to military school. Yet, by the 18th century, a minority of children attended school, and many for no more than three to four months out of the year. In 1763 Prussia implemented a modern compulsory education system, and the policy quickly spread across northern Europe, stopping at industrialist Britian, which felt threatened by an educated (and enfranchised) working class, and did not follow suit until 1870, in spite of much campaigning against child labour practices from liberals and the Church. Even then, provision only held up to the age of 12.'
WHERE Tag = 'TXT_KEY_POLICY_HUMANISM_TEXT';

UPDATE Language_ko_KR
SET Text = 'Secularism'
WHERE Tag = 'TXT_KEY_POLICY_FREE_THOUGHT';

UPDATE Language_ko_KR
SET Text = '[COLOR_POSITIVE_TEXT]Secularism[ENDCOLOR][NEWLINE][ICON_BULLET]-5 [ICON_HAPPINESS_3] Unhappiness from Religious Unrest in all Cities.[NEWLINE][ICON_BULLET]+10% [ICON_RESEARCH] Science during [ICON_GOLDEN_AGE] Golden Ages.[NEWLINE][ICON_BULLET]+3 [ICON_PRODUCTION] Production and [ICON_GOLD] Gold from Academies.'
WHERE Tag = 'TXT_KEY_POLICY_FREE_THOUGHT_HELP';

UPDATE Language_ko_KR
SET Text = 'Employment Law'
WHERE Tag = 'TXT_KEY_POLICY_SCIENTIFIC_REVOLUTION';

UPDATE Language_ko_KR
SET Text = '[COLOR_POSITIVE_TEXT]Employment Law[ENDCOLOR][NEWLINE][ICON_BULLET]+1 [ICON_FOOD] Food and [ICON_PRODUCTION] Production for every [ICON_CITIZEN] Citizen.[NEWLINE][ICON_BULLET]50% of [ICON_HAPPINESS_1] Happiness in each City is converted into [ICON_CULTURE] Culture.'
WHERE Tag = 'TXT_KEY_POLICY_SCIENTIFIC_REVOLUTION_HELP';

UPDATE Language_ko_KR
SET Text = 'The Code of Hammurabi (c. 1755-1750 BC) stipulated a 2 shekel prevailing wage for each 60 gur (300 bushel) vessel constructed in an employment contract between a shipbuilder and a ship-owner. Since then, protections to trade have been a central part of jurisprudence. Sadly, one of the appalling consequences of the industrial revolution was a reversal of this norm and an almost unregulated economic framework that led to much misery and death. In Britain, a great milestone in labour law was reached with the Factories Act 1833, which limited the employment of children under eighteen years of age, prohibited all night work, and, crucially, provided for inspectors to enforce the law.'
WHERE Tag = 'TXT_KEY_POLICY_SCIENTIFICREVOLUTION_TEXT';
