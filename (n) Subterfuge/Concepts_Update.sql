-- ----------------
-- UI
-- ----------------

UPDATE Language_en_US
SET Text = 'Options for {1_SpyRank} {2_SpyName}:[NEWLINE][NEWLINE][ICON_BULLET] Move to a City-State and attempt to [COLOR_POSITIVE_TEXT]Rig an Election[ENDCOLOR].[NEWLINE][ICON_BULLET] Move to a City owned by a Major Civilization and Gather Intelligence to conduct a [COLOR_POSITIVE_TEXT]Spy Mission[ENDCOLOR].[NEWLINE][ICON_BULLET] Move to a Capital City owned by a Major Civilization and [COLOR_POSITIVE_TEXT]Schmooze[ENDCOLOR] as a Diplomat.[NEWLINE][ICON_BULLET] Move to one of your own Cities to select a [COLOR_POSITIVE_TEXT]Counterspy Focus[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_EO_SPY_MOVE_TT';

UPDATE Language_en_US
SET Text = 'Your Current [ICON_VP_SPY_POINTS] Spy Points: {1_Num}/{2_Threshold}[NEWLINE][NEWLINE]You gain a new Spy whenever the number of [ICON_VP_SPY_POINTS] Spy Points exceeds the threshold of {2_Threshold}.[NEWLINE][NEWLINE]Total Number of [ICON_VP_SPY_POINTS] Spy Points ever accumulated: {3_NumTotal}'
WHERE Tag = 'TXT_KEY_SPY_POINTS_TT';

UPDATE Language_en_US
SET Text = 'Spy Missions may not be conducted in City-States, so they do not have a Security Level.[NEWLINE][NEWLINE]Sending a spy into a City-State will increase your influence there by rigging elections. If there is more than one spy in the city, the spy who has been in the City-State the longest has the greatest chance of rigging the election.'
WHERE Tag = 'TXT_KEY_EO_CITY_STATE_POTENTIAL_TT';

UPDATE Language_en_US
SET Text = '{1_RankName} {2_SpyName} is attempting to rig the election in {3_CityName} to increase our influence there.[NEWLINE][NEWLINE]Only one civilization may successfuly rig an election. If more than one spy is in a City-State, the spy that has been in that City-State the longest has the greatest chance of successfully rigging the election in its favor. Streaks of consecutive successfully rigged elections provide more influence.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]If you successfully rig the next election, your influence will increase by {4_Influence}.[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_EO_SPY_RIGGING_ELECTIONS_TT';

-- --------------------
-- civilopedia
-- --------------------
-- descriptions
-- --------------------
UPDATE Language_en_US 
SET Text = 'Spies and Diplomats'
WHERE Tag = 'TXT_KEY_CONCEPT_ESPIONAGE_SPIES_TOPIC';

UPDATE Language_en_US 
SET Text = 'Moving Spies'
WHERE Tag = 'TXT_KEY_CONCEPT_ESPIONAGE_MOVING_SPIES_TOPIC';

UPDATE Language_en_US 
SET Text = 'Statecraft'
WHERE Tag = 'TXT_KEY_CONCEPT_ESPIONAGE_MORE_TOPIC';

UPDATE Language_en_US 
SET Text = 'Spy Missions'
WHERE Tag = 'TXT_KEY_ADVISOR_ESPIONAGE_TECH_STOLEN_TOPIC';

-- Less Advanced Civilizations
UPDATE Language_en_US 
SET Text = 'Network Points'
WHERE Tag = 'TXT_KEY_ADVISOR_ESPIONAGE_CANT_STEAL_ANYMORE_TOPIC';

UPDATE Language_en_US
SET Text = '[COLOR_YELLOW]Spies and City-States[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_CONCEPT_ESPIONAGE_RIG_ELECTION_TOPIC';

UPDATE Language_en_US 
SET Text = 'Residency Bonuses'
WHERE Tag = 'TXT_KEY_CONCEPT_ESPIONAGE_SURVEILLANCE_TOPIC';

UPDATE Language_en_US 
SET Text = 'Counter-Intelligence'
WHERE Tag = 'TXT_KEY_CONCEPT_ESPIONAGE_COUNTER_INTEL_TOPIC';

-- Constabularies and Police
UPDATE Language_en_US 
SET Text = 'City Security'
WHERE Tag = 'TXT_KEY_CONCEPT_ESPIONAGE_POLICE_STATION_TOPIC';

-- National Intelligence Agency
UPDATE Language_en_US 
SET Text = 'National Wonders'
WHERE Tag = 'TXT_KEY_CONCEPT_ESPIONAGE_NATIONAL_INTELLIGENCE_TOPIC';

-- The Great Firewall
UPDATE Language_en_US 
SET Text = 'World Wonders'
WHERE Tag = 'TXT_KEY_CONCEPT_ESPIONAGE_GREAT_FIREWALL_TOPIC';

-- Spy Experience
UPDATE Language_en_US 
SET Text = 'Ideologies'
WHERE Tag = 'TXT_KEY_CONCEPT_ESPIONAGE_PROMOTIONS_TOPIC';

UPDATE Language_en_US 
SET Text = 'Identifying and Killing Spies'
WHERE Tag = 'TXT_KEY_CONCEPT_ESPIONAGE_GETTING_CAUGHT_TOPIC';

-- -------------------
-- bodies
-- -----------------
UPDATE Language_en_US
SET Text = 'Spies are gained by accumulating [ICON_VP_SPY_POINTS] Spy Points, and may be assigned in four different ways: as domestic Counterspies in your own Cities, as Diplomats in foreign [ICON_CAPITAL] Capitals, and as Agents in Foreign Cities to conduct Missions or in [ICON_CITY_STATE] City-States to Rig their Elections.[NEWLINE][NEWLINE]Counterspies[NEWLINE][ICON_BULLET] Generate yields when foreign Spies are Identified or Killed in the City.[NEWLINE][ICON_BULLET] Can choose a Focus that provides passive effects, such as decreased [ICON_HAPPINESS_3] Needs in exchange for reduced [ICON_TOURISM] Tourism output.[NEWLINE][ICON_BULLET] Blocks certain foreign Spy Missions from happening based on their Focus.[NEWLINE][NEWLINE]Diplomats[NEWLINE][ICON_BULLET] +20% [ICON_TOURISM] Tourism with the Civilization.[NEWLINE][ICON_BULLET] The ability to Purchase Votes from that Player at the World Congress.[NEWLINE][ICON_BULLET] Intrigue, which informs on domestic and military planning and can be shared with third parties for a Diplomatic boost.[NEWLINE][ICON_BULLET] Access to various screens of the Player, such as the Military Display which reveals the number (and type) of Units.[NEWLINE][NEWLINE]Agents in Major Cities[NEWLINE][ICON_BULLET] Gain Network Points to perform Spy Missions[NEWLINE]Siphon [ICON_RESEARCH] Science from the City, which gives you Yields equal to a percent of the City''s (does not reduce those gained by the owner) each turn.[NEWLINE][ICON_BULLET] Vision over the City Screen and nearby Tiles.[NEWLINE][NEWLINE]Agents in City-States[NEWLINE][ICON_BULLET] The ability to Rig the repeating Election event, increasing your [ICON_INFLUENCE] Influence in the City-State and decreasing that of all other Players.'
WHERE Tag = 'TXT_KEY_CONCEPT_ESPIONAGE_SPIES_SUMMARY';

UPDATE Language_en_US
SET Text = Text || '[NEWLINE][NEWLINE]The time it takes for Spies to move to Foreign Cities can be reduced by increasing your [ICON_TOURISM] Cultural Influence over the Civilization in question.'
WHERE Tag = 'TXT_KEY_CONCEPT_ESPIONAGE_MOVING_SPIES_SUMMARY';

UPDATE Language_en_US
SET Text = 'An Empire that wants to make use of the Espionage system to its fullest extent should adopt the Statecraft Policy Branch. In addition to its benefits to City-State Influence and Trade, there are Policies that directly boost Espionage, immediately boosting Spy Points and increasing the rate at which Great Diplomats are produced. Further, your Capital will provide an increased amount of Culture based on the total number of Spy Points you have accumulated. Note also that Trade Routes provide Tourism benefits, which in turn boost the power of your Spies. The most skillful operators will therefore blend together a number of methods in order to further their megalomaniacal interests.'
WHERE Tag = 'TXT_KEY_CONCEPT_ESPIONAGE_MORE_SUMMARY';

UPDATE Language_en_US
SET Text = 'Agents stationed in the Cities of Major Civilizations can conduct Spy Missions. There are several tiers of Missions with increasing power, culminating in the most expensive tier which includes the powerful "Steal a Technology" Mission. Many Missions have requirements of the City (and/or Civilization) in which they are conducted. For example "{TXT_KEY_ESPIONAGE_EVENT_CHOICE_STEAL_FROM_TREASURY}" can only be performed in a [ICON_CAPTIAL] Capital City. Some Buildings and Wonders reward Yields when a Spy Mission is conducted by one of your Agents. Espionage can therefore be an engine for progress both from the effects of the Missions themselves, as well as the Yields that are earned in the process.'
WHERE Tag = 'TXT_KEY_ADVISOR_ESPIONAGE_TECH_STOLEN_SUMMARY';

UPDATE Language_en_US
SET Text = 'Network Points are passively gained every turn by Spies in the Cities of Major Civilizations. The amount of Network Points gained can be increased by attaining higher ranks of [ICON_TOURISM] Cultural Influence over the relevant Civilization, and by adopting certain Policies and building certain Wonders. The amount of Network Points is lowered by the Security level of the City, which the owner can increase with certain Buildings, Wonders, and Policies. Security is lowered for every [ICON_CITIZEN] Citizen in the City, and each [ICON_INTERNATIONAL_TRADE] Trade Route sent to the City.'
WHERE Tag = 'TXT_KEY_ADVISOR_ESPIONAGE_CANT_STEAL_ANYMORE_SUMMARY';

UPDATE Language_en_US
SET Text = 'Spies can be used to increase your influence with City-States by "rigging" their local elections or staging a coup. To interact with a City-State, first move a spy to a target City-State. Once the spy arrives, there will be a period of time when they are "Establishing Surveillance" (noted in the "Activity" column). Once surveillance is established, your espionage options become available. Rigging an election, a passive ability, occurs every 15 turns while your spy is located within the City-State. If you are the only spy in the City-State, your influence will increase while everyone else''s will drop. The presence of an enemy spy can cause this mission to fail, as only one Civilization can succeed in Rigging the Election; the chance is higher the more turns of the Election cycle a Spy is present for. No worries if you do not succeed though, as failure is not dangerous to your Spy. Finally, if you Rig the Election consecutive times, the bonus is increased.'
WHERE Tag = 'TXT_KEY_CONCEPT_ESPIONAGE_RIG_ELECTION_SUMMARY';

UPDATE Language_en_US
SET Text = 'When a Spy stationed in the City of a Major Civilization reaches certain thresholds of Network Points for the first time, they achieve a permanent bonus that lasts until they leave the City or are Killed. For Agents this bonus includes a Siphon of [ICON_RESEARCH] Science, and vision over the City and its Tiles. For Diplomats this bonus allows the trading of increasing numbers of Votes at the World Congress, and viewing various Civilization screens such as the Tech Tree and Policy Screen of the other Player. At higher levels the [ICON_GOLD] Gold from [ICON_INTERNATIONAL_TRADE] Trade Routes is increased by 20%, a large boost.'
WHERE Tag = 'TXT_KEY_CONCEPT_ESPIONAGE_SURVEILLANCE_SUMMARY';

UPDATE Language_en_US
SET Text = 'By default there are 4 Counterspy Focus options. Each grants Yields when a foreign Spy in the City is Identified, and triple if they are Killed. Therefore the first reason to use a Counterspy is because you have reason to believe subterfuge is underway in that City. The second reason is preventative. Certain Spy Missions are unavailable if particular Counterspy Focus operations are underway. For example it can be infuriating to have your [ICON_GREAT_WORK] Great Works stolen, especially if you are pursuing the Cultural Victory. Hence you may wish to protect them with one of your Spies acting in the "Hunt Down Heretics" Focus. Finally, each Focus has passive effects. So while you may enjoy the safety of those Great Works, your City will unfortunately lose some [ICON_FOOD] Growth when running the Focus. However, all Focus passive effects contain bonuses, and for "Hunt Down Heretics" that is a +25% [ICON_RELIGION] Pressure boost. A particularly focussed Player might therefore be able to derive additional beneift from certain Focus choices!'
WHERE Tag = 'TXT_KEY_CONCEPT_ESPIONAGE_COUNTER_INTEL_SUMMARY';

UPDATE Language_en_US
SET Text = 'Concerned other Civilizations are exploiting you with Espionage? The counterplay is to increase your Security level in important Cities. Security acts as a percentage reduction to enemy Network Point generation: if you achieve 100 Security in a City, no Network Points can be generated whatsoever! Certain buildings, like the Constabulary grant Security, but might not otherwise be particularly attractive investments. Therefore if you are the one to build these first, you will dissuade foreign actors from Spying on you, as other targets will be more lucrative. Other sources of Security include Policies, like the Finisher of the Rationalism Tree; it is particularly important to guard your Cities as a Science-focussed Player, as the "Steal a Technology" Mission can undermine your advantage.'
WHERE Tag = 'TXT_KEY_CONCEPT_ESPIONAGE_POLICE_STATION_SUMMARY';

UPDATE Language_en_US
SET Text = 'An important concept in Espionage are National Wonders. Starting with the Scrivener''s Office at Writing, and ending with the National Intelligence Agency at Computers, these are the main way you will receive [ICON_VP_SPY_POINTS] Spy Points. Not only that, these are some of the places you will receive Yields from Rigging Elections and conducting Missions. Furthermore, the Civil Servant Slots on these Buildings are the some of the only ways you can increase Great Diplomat production, which is key if you want to maximise your Spy Points and fully flex your Espionage on the world stage!'
WHERE Tag = 'TXT_KEY_CONCEPT_ESPIONAGE_NATIONAL_INTELLIGENCE_SUMMARY';

UPDATE Language_en_US
SET Text = 'Some [ICON_WONDER] World Wonders boost [ICON_VP_SPY_POINTS] Spy Points and may also provide Yields when you conduct Spy Missions. Since only one Player can construct these, they represent a way to increase your Espionage ability whilst deny such bonuses to your enemies. Are there shady characters on your map, coveting your technological advances? Deprive them of these key sources of power by any means open to you, including perhaps the Assassination of their Governors?'
WHERE Tag = 'TXT_KEY_CONCEPT_ESPIONAGE_GREAT_FIREWALL_SUMMARY';

UPDATE Language_en_US
SET Text = 'Further to Statecraft, the various Ideologies on offer in the later part of the game all offer Tenets that interact with the Espionage system. Different bonuses are on offer, so if you are strongly invested in Espionage it may be worth taking this into account when you make your choice. For example in Freedom there is a powerful boost to Rigging City-State Elections, whereas Order has a focus on Research, siphoning more Science passively and generating Science from Identifying foreign Agents.'
WHERE Tag = 'TXT_KEY_CONCEPT_ESPIONAGE_PROMOTIONS_SUMMARY';

UPDATE Language_en_US
SET Text = 'Spy Missions, unlike Rigging Elections, always succeed. However you may be detected in the process, in which case the opponent will be able to diplomatically adjust to your actions and may also receive bonus Yields. In the completion of their Mission, Spies may also be Killed. In this case, not only will you lose all accumulated bonuses, but you will have to wait a number of turns to recruit a replacement, who will then have to move to the location of the next target and begin from zero again. Weigh up the costs and benefits of Missions with high Kill chances carefully. If you were going to move your Spy anyway, it will be more tempting to send them to their likely deaths.'
WHERE Tag = 'TXT_KEY_CONCEPT_ESPIONAGE_GETTING_CAUGHT_SUMMARY';

UPDATE Language_en_US
SET Text = 'You gain a new Spy whenever the number of [ICON_VP_SPY_POINTS] Spy Points exceeds the threshold of 100. Some National Wonders, World Wonders, and Policies provide [ICON_VP_SPY_POINTS] Spy Points. They can also be gained from the Great Diplomat Trade Mission, which means that working Civil Servant Specialists is important if you want to fully engage in Espionage.'
WHERE Tag = 'TXT_KEY_CONCEPT_SPY_POINTS_BODY';


