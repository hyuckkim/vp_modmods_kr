
-- ok now we are going to make Autocracy a time-victory focus so things are going to move
-- diplo is going
-- Gunboat Diplomacy (Co-prosperity sphere atm) is really cool so we'd not want to lose it. Treat Organization (Containment) is boring, and it fits there, so let's make that move!

-- Treaty Organization
UPDATE Policies
SET
	ProtectedMinorPerTurnInfluence = 0,
	FreeWCVotes = 0,
	CanBullyFriendlyCS = 1,
	BullyGlobalCSInfluenceShift = 10
WHERE Type = 'POLICY_TREATY_ORGANIZATION';

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Containment[ENDCOLOR]: Demanding [ICON_PIRATE] Tribute from [ICON_CITY_STATE] City-States no longer reduces [ICON_INFLUENCE] Influence, revokes Quests, or cancels Pledges of Protection. Doing so decreases the [ICON_INFLUENCE] Influence of all other Civs with the bullied City-State by 10%, and increases your [ICON_INFLUENCE] Influence by 10%.'
WHERE Tag = 'TXT_KEY_POLICY_TREATY_ORGANIZATION_HELP';

-- new T3 for Autocracy 
-- needs lua

UPDATE Policies
SET
	CanBullyFriendlyCS = 0,
	BullyGlobalCSInfluenceShift = 0
WHERE Type = 'POLICY_GUNBOAT_DIPLOMACY';

INSERT INTO Policy_YieldChangeWorldWonder
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_GUNBOAT_DIPLOMACY', 'YIELD_GOLDEN_AGE_POINTS', 3),
	('POLICY_GUNBOAT_DIPLOMACY', 'YIELD_GREAT_GENERAL_POINTS', 3),
	('POLICY_GUNBOAT_DIPLOMACY', 'YIELD_GREAT_ADMIRAL_POINTS', 3);

UPDATE Language_en_US
SET Text = 'World Capital'
WHERE Tag = 'TXT_KEY_POLICY_GUNBOAT_DIPLOMACY';

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]World Capital[ENDCOLOR]: Unlocks the [COLOR_CYAN]Volkshalle[ENDCOLOR] [ICON_WONDER] World Wonder. Cities generate +3 [ICON_GOLDEN_AGE] Golden Age, [ICON_GREAT_GENERAL] Great General, and [ICON_GREAT_ADMIRAL] Great Admiral Points for every [ICON_WONDER] World Wonder they have constructed.  Reduces the [ICON_TURNS_REMAINING] Game Timer by [COLOR_POSITIVE_TEXT]4 Turns[ENDCOLOR] for every [ICON_WONDER] World Wonder controlled when [COLOR_MAGENTA]Adopted[ENDCOLOR] (minimum 375 Turns).'
WHERE Tag = 'TXT_KEY_POLICY_GUNBOAT_DIPLOMACY_HELP';

UPDATE Language_en_US
SET Text = 'World Capital Germania was the projected renewal of the German capital Berlin during the Nazi period, as part of Adolf Hitler''s vision for the future of Nazi Germany after the planned victory in World War II. It was to be the capital of his planned "Greater Germanic Reich". Albert Speer, the "first architect of the Third Reich", produced many of the plans for the rebuilt city in his capacity as overseer of the project, only a small portion of which was realised between the years 1938 and 1943. Focal points included massive monuments such as a triumphal arch based on the Arc de Triomphe in Paris, but almost one hundred metres (330 ft) high.[NEWLINE][NEWLINE]Some of the projects were completed, such as the creation of a great East–West city axis and placing the Berlin Victory Column in the centre, far away from the Reichstag, where it originally stood. Other projects, however, such as the creation of the "People''s Hall" (Volkshalle), had to be shelved due to the beginning of war, although a great number of the old buildings in many of the planned construction areas were already demolished before the war.'
WHERE Tag = 'TXT_KEY_POLICY_GUNBOAT_DIPLOMACY_TEXT';

-- now that new NW, Volkeshalle
-- free nuclear plant in xml
-- wltkd in xml
INSERT INTO Building_ClassesNeededInCity
	(BuildingType, BuildingClassType)
VALUES
	('BUILDING_VOLKESHALLE', 'BUILDINGCLASS_PALACE');

INSERT INTO Building_GoldenAgeYieldMod
	(BuildingType, YieldType, Yield)
SELECT
	'BUILDING_VOLKESHALLE', Type, 10
FROM Yields WHERE ID<6; 
-- all yields
INSERT INTO Building_YieldChangesPerPopInEmpire
	(BuildingType, YieldType, Yield)
SELECT
	'BUILDING_VOLKESHALLE', Type, 10
FROM Yields WHERE ID<6; 

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
SELECT
	'BUILDING_VOLKESHALLE', Type, 1
FROM Yields WHERE ID<6; 

INSERT INTO Language_en_US
	(Tag, Text)
VALUES
	('TXT_KEY_BUILDING_VOLKESHALLE', 'Volkeshalle'),
	('TXT_KEY_BUILDING_VOLKESHALLE_HELP', 'Requires [COLOR_MAGENTA]World Capital[ENDCOLOR]. +10% [COLOR_POSITIVE_TEXT]All Yields[ENDCOLOR] during a [ICON_GOLDEN_AGE] Golden Age. +1 [COLOR_POSITIVE_TEXT]All Yields[ENDCOLOR] for every [COLOR_POSITIVE_TEXT]10[ENDCOLOR] [ICON_CITIZEN] Citizens in the Empire. Receive a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Nuclear Plant in the City. This City enters "We Love the King Day" for the [ICON_TURNS_REMAINING] rest of the Game.[NEWLINE][NEWLINE]Must be built in the [ICON_CAPITAL] Capital.'),
	('TXT_KEY_BUILDING_VOLKESHALLE_QUOTE', '[NEWLINE]"Speer is generally recognized as the most able of Hitler''s subordinates and the most interesting, in that he retained throughout his membership a clear-sighted understanding of its essentially Byzantine character."[NEWLINE] - John Keegan[NEWLINE]'),
	--('TXT_KEY_BUILDING_VOLKESHALLE_STRATEGY', 'The ultimate Wonder, Volkeshalle achieves the dream of an unparalleled City that can rule the world alone. In addition to its direct bonuses, it also provides a Nuclear Plant, which is the premier late-game Building for a large City, which an Autocrat may have neglected to research technologies toward as a result of having to vigilantly defend the Fatherland from the enemies of National Socialism.'),
	('TXT_KEY_BUILDING_VOLKESHALLE_TEXT', 'The Volkshalle ("People''s Hall") was a proposal for a monumental, domed building to be built in a reconstituted Berlin (renamed as Germania) in Nazi Germany. The project was conceived by Adolf Hitler and designed by his architect Albert Speer. Doubts persisted at the time as to whether the marshy Berlin ground could have taken the load of the proposed projects (before ground penatrating radar, extremely heavy block of concrete were used to test how much weight the ground was able to carry), and no part of the building was ever constructed.[NEWLINE][NEWLINE]Visually it was to have been the architectural centrepiece of Berlin as the world capital (Welthauptstadt). Its dimensions were so large that it would have dwarfed every other structure in Berlin, including those on the north-south axis itself. The oculus of the building''s dome, 46 metres (151 ft) in diameter, would have accommodated the entire rotunda of Hadrian''s Pantheon and the dome of St. Peter''s Basilica (two buildings Hitler was particularly impressed with, both architecturally and spiritually). The temple-like nature of the domed building was noted by Speer, who surmised that the building was ultimately intended for public worship of Hitler, his successors and the German Reich, that is, it was to be a dynastic temple/palace complex of the kind Augustus built on the Palatine, where his modest house was connected to the temple of Apollo.');

-- iron fist. this is actually a good time victory option, just pivot away from CS. wonders are time-friendly!

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Iron Fist[ENDCOLOR]: Capitulated [ICON_OCCUPIED] Vassals cannot [COLOR_NEGATIVE_TEXT]Rebel[ENDCOLOR]. Vassals may not be liberated, and tribute an additional 25% of their yields and [ICON_HAPPINESS_1] excess Happiness. +50% [ICON_WORKER] Work Rate. +20% [ICON_PRODUCTION] Production when building [ICON_WONDER] Wonders.'
WHERE Tag = 'TXT_KEY_POLICY_UNIVERSAL_HEALTHCARE_A_HELP';

UPDATE Policies
SET
	--VassalsNoRebel = 1,
	CSYieldBonusModifier = 0,
	VassalYieldBonusModifier = 25,
	WonderProductionModifier = 20
	--,WorkerSpeedModifier = 50
WHERE Type = 'POLICY_UNIVERSAL_HEALTHCARE_A';

-----------------------------------------------
-----------------------------------------------
--  rename autocracy to might 
-- good for many reasons, but it specifically helps distinguish the new orientation

UPDATE Language_en_US
SET Text = 'Might'
WHERE Tag = 'TXT_KEY_POLICY_BRANCH_AUTOCRACY';

-- Changes to ConceptTextChanges
UPDATE Language_en_US
SET Text = '[COLOR_YELLOW]Might[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_SOCIALPOLICY_AUTOCRACY_HEADING3_TITLE';
UPDATE Language_en_US
SET Text = 'The Might ideology is well suited for those wishing nothing more than to crush their foes under the weight of their iron-plated boots. [COLOR_YELLOW]This ideology unlocks upon entering the Atomic Era, or unlocking 18 Policies and having advanced at least to the Industrial Era, whichever comes first.[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_SOCIALPOLICY_AUTOCRACY_HEADING3_BODY';

UPDATE Language_en_US
SET Text = 'The three Ideology trees, Freedom, Order, and Might, have greatly expanded in Brave New World. All civilizations in the game, [COLOR_YELLOW]on acquiring 18 Policies and having advanced at least to the Industrial Era, or upon reaching the Atomic Era,[ENDCOLOR] will be required to choose an Ideology for their civilization. Each Ideology tree contains 3 tiers of "tenets" that you use to customize your Ideology, with the third and final tier holding the most powerful benefits. As with regular Social Policies, players use Culture to purchase additional tenets as they move through the game.[NEWLINE][NEWLINE]Civilizations that share a common Ideology will receive benefits with their diplomatic relationships. Civilizations that have conflicting Ideologies have multiple side-effects. For example, a negative effect on their diplomatic relationship and happiness penalties take effect if an opposing Ideology has a stronger Cultural influence on your people. If you let your people become too unhappy, there is a chance that your cities may declare that they are joining your opponents empire. As a last resort, you, or other players, can resort to a "Revolution" to switch Ideologies to one that is preferable to your people.[NEWLINE][NEWLINE]For more information on Ideological Tenets, click on the "Social Policies" tab along the top of the Civilopedia, and scroll down to the Order, Freedom, and Might sections.'
WHERE Tag = 'TXT_KEY_SOCIALPOLICY_IDEOLOGY_HEADING3_BODY';


-- Changes to UnitTextChanges

UPDATE Language_en_US SET
Text = Replace(Text, 'Autocracy', 'Might')
WHERE Tag IN ('TXT_KEY_UNIT_HELP_ZERO', 'TXT_KEY_UNIT_JAPANESE_ZERO_STRATEGY', 'TXT_KEY_WONDER_PRORA_RESORT_HELP', 'TXT_KEY_BUILDING_EHRENHALLE_HELP', 'TXT_KEY_RESPONSE_DENOUNCE_HUMAN_BELIEVES_AUTOCRACY_2', 'TXT_KEY_GENERIC_SWITCHED_TO_AUTOCRACY_2');

