-- creative expression. weird wide bonus on a bunch of already-built buildings. replace
-- name is better matched by Avant Garde

DELETE FROM Policy_BuildingClassYieldChanges WHERE PolicyType='POLICY_CREATIVE_EXPRESSION';

INSERT INTO Policy_YieldModifierFromGreatWorks
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_CREATIVE_EXPRESSION', 'YIELD_SCIENCE', 4);

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Avant Garde[ENDCOLOR]: +2 [ICON_TOURISM] Tourism from [ICON_GREAT_WORK] Great Works. Cities generate +4% [ICON_RESEARCH] Science for every [ICON_GREAT_WORK] Great Work present (up to 20%).'
WHERE Tag = 'TXT_KEY_POLICY_CREATIVE_EXPRESSION_HELP';

UPDATE Language_en_US
SET Text = 'The term avant-garde (from French meaning vanguard) identifies an experimental work, and the person or people that created it, as innovative whilst initially being ideologically unacceptable to the establishment of the time. Through the intelligentsia of a (tolerant) society, avant-garde artists thus promote progressive and radical politics and advocate for societal reform with and through works of art. Indeed already in 1825 Benjamin Olinde Rodrigues recognised in his essay  "The Artist, the Scientist, and the Industrialist" that through the avant-garde, "the power of the arts is, indeed, the most immediate and fastest way" to realise social, political, and economic reforms. To defy the established mores is therefore elevated to a moral obligation.'
WHERE Tag = 'TXT_KEY_POLICY_CREATIVE_EXPRESSION_TEXT';

UPDATE Language_en_US
SET Text = 'Avant Garde'
WHERE Tag = 'TXT_KEY_POLICY_CREATIVE_EXPRESSION';

-- avant garde. bit weak
-- name is better match by original Open Society, maybe better is Freedom of Speech

INSERT INTO Policy_YieldGPExpend
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_OPEN_SOCIETY', 'YIELD_TOURISM', 50);

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Freedom of Speech[ENDCOLOR]: The rate at which [ICON_GREAT_PEOPLE] Great People are born is increased by 33%. -2 [ICON_HAPPINESS_3] Unhappiness from [ICON_CULTURE] Boredom in all Cities. Expending a [ICON_GREAT_PEOPLE] Great Person grants 50 [ICON_TOURISM] Tourism, scaling with Era.'
WHERE Tag = 'TXT_KEY_POLICY_OPEN_SOCIETY_HELP';

UPDATE Language_en_US
SET Text = 'Freedom of Speech'
WHERE Tag = 'TXT_KEY_POLICY_OPEN_SOCIETY';

UPDATE Language_en_US
SET Text = 'Freedom of speech is a principle that supports the individuals or a communities should be able to articulate their opinions and ideas without fear of retaliation, censorship, or legal sanction. Many countries have constitutional law that protects free speech, and in those that do not it may still be enshrined in law, for example in England it was affirmed in the Protestation of 1621 and in the Bill of Rights of 1689.[NEWLINE][NEWLINE]However even in liberal societies the right to free speech is never absolute. Common limitations relate to libel and slander, pornography, sedition, hate speech, public security, and perjury. Justifications for such include the harm principle, proposed by John Stuart Mill in On Liberty, which suggests that "the only purpose for which power can be rightfully exercised over any member of a civilized community, against his will, is to prevent harm to others".'
WHERE Tag = 'TXT_KEY_POLICY_OPEN_SOCIETY_TEXT';

-- covert action 

UPDATE Policies
SET
	FreeSpy = 1,
	RigElectionInfluenceModifier = 50,
	EspionageNetworkPoints = 0
WHERE Type = 'POLICY_COVERT_ACTION';

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Covert Action[ENDCOLOR]: Receive 100 [ICON_SPY_POINT] Spy Points. The [ICON_CAPITAL] Capital gains +3% [ICON_GOLD] Gold for every 100 [ICON_SPY_POINT] Spy Points ever accumulated (up to 30%). When successfully [ICON_PUPPET] Rigging an election in a City-State, the [ICON_INFLUENCE] Influence you gain and other Players lose is increased by +50%.'
WHERE Tag = 'TXT_KEY_POLICY_COVERT_ACTION_HELP';

INSERT INTO Policy_YieldModifierFromActiveSpies
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_COVERT_ACTION', 'YIELD_GOLD', 3);

-- universal suffrage. 1 happiness is borderline useless to tall. add some tourism because its missing on T1

UPDATE Policies
SET
	ExtraHappinessPerCity = 0
	--,HappinessPerXPolicies = 3
	-- 3 because its 2 per tree
WHERE Type = 'POLICY_UNIVERSAL_SUFFRAGE';


UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Universal Suffrage[ENDCOLOR]: A [ICON_GOLDEN_AGE] Golden Age begins, and [ICON_GOLDEN_AGE] Golden Ages last 50% longer. Every World Congress Session, gain 10 [ICON_GOLDEN_AGE] Golden Age Points and [ICON_TOURISM] Tourism for every [ICON_DIPLOMAT] Delegate you control, scaling with Era.'
WHERE Tag = 'TXT_KEY_POLICY_UNIVERSAL_SUFFRAGE_HELP';

-- economic union. 6 gold is laughable. replace. 2 trade routes is v. strong for a t1 policy, but also very boring. chronology also wrong

INSERT INTO Policy_YieldFromDelegateCount
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_ECONOMIC_UNION', 'YIELD_GOLDEN_AGE_POINTS', 10),
	('POLICY_ECONOMIC_UNION', 'YIELD_TOURISM', 10);

UPDATE Policies SET
	Level = 2,
	FreeTradeRoute = 2,
	OpenBordersTourismModifier = 10
WHERE Type = 'POLICY_ECONOMIC_UNION';

INSERT INTO Policy_FreeBuilding
	(PolicyType, BuildingClassType, Count)
VALUES
	('POLICY_ECONOMIC_UNION', 'BUILDINGCLASS_STOCK_EXCHANGE', 5);
-- only 5 because its t1

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Economic Union[ENDCOLOR]: +2 [ICON_INTERNATIONAL_TRADE] Trade Routes. Receive 5 [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Stock Exchanges. The [ICON_TOURISM] Tourism modifier for [COLOR_POSITIVE_TEXT]Open Borders[ENDCOLOR] with other Civilizations is increased by +10%.'
WHERE Tag = 'TXT_KEY_POLICY_ECONOMIC_UNION_HELP';

-- new deal. if we think about this, its way too weak for a t2 tenet. chronology also wrong

UPDATE Policies SET
	Level = 1
WHERE Type = 'POLICY_NEW_DEAL';

INSERT INTO Policy_WLTKDYieldMod
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_NEW_DEAL', 'YIELD_TOURISM', 10),
	('POLICY_NEW_DEAL', 'YIELD_GOLD', 10);

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]New Deal[ENDCOLOR]: Great Person Improvements produce +6 of a yield ([ICON_GREAT_ENGINEER]/[ICON_GREAT_GENERAL][ICON_PRODUCTION], [ICON_GREAT_MERCHANT][ICON_GOLD], [ICON_GREAT_SCIENTIST][ICON_RESEARCH], [ICON_DIPLOMAT][ICON_CULTURE], [ICON_PROPHET][ICON_PEACE]), and +2 [ICON_TOURISM] Tourism. [ICON_RES_ARTIFACTS] Landmarks produce +8 [ICON_TOURISM] Tourism. Cities generate +10% [ICON_GOLD] Gold and [ICON_TOURISM] Tourism during "We Love The King Day".'
WHERE Tag = 'TXT_KEY_POLICY_NEW_DEAL_HELP';

-- capitalism. unfashionable these days. the effect is v strong tho

UPDATE Language_en_US
SET Text = 'Social Welfare'
WHERE Tag = 'TXT_KEY_POLICY_CAPITALISM';

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Social Welfare[ENDCOLOR]: 2 [ICON_CITIZEN] Specialists in each of your cities generate +1 [ICON_HAPPINESS_1] Happiness instead of -1 [ICON_HAPPINESS_3] Unhappiness from Urbanization. Specialists generate +1 [ICON_GOLD] Gold and [ICON_RESEARCH] Science.'
WHERE Tag = 'TXT_KEY_POLICY_CAPITALISM_HELP';

--Keynesian Economics
-- As part of the neoclassical synthesis, Keynesianism served as the standard macroeconomic model in the developed nations during the later part of the Great Depression, World War II, and the post-war economic expansion (1945-1973). It was developed in part to attempt to explain the Great Depression and to help economists understand future crises. Keynes'' approach was a stark contrast to the aggregate supply-focused classical economics that preceded it, with Keynesian economists generally advocating a regulated market economy that is predominantly private sector, but with an active role for government intervention during recessions and depressions.[NEWLINE][NEWLINE]Internationally, the body of theory suggests that trade surpluses lead to weak global aggregate demand. These ideas were informed by events prior to the Great Depression when international lending, primarily by the U.S., exceeded the capacity of sound investment and so got diverted into non-productive and speculative uses, which in turn invited default. Keynes himself was the leader of the British delegation to the United Nations Monetary and Financial Conference in 1944 that established the Bretton Woods system of international currency management, but his ideas were ultimately rejected by the Americans.

UPDATE Language_en_US
SET Text = 'Social Welfare is a type of government support intended to ensure that members of a society can meet basic human needs, broadly encompassing support for those in old age, the maintenance of children, medical treatment, parental and sick leave, unemployment and disability benefits, and legal representation. In a welfare (but not socalist) state, provision of social services acts form of insurance to those who find themselves unable to work whilst the economy otherwise operates on capitalist, market principles. Welfare is also justified on moral grounds, as a tool for reducing inequality and achieving social justice.[NEWLINE][NEWLINE]Borne out of the widespread concern in the 19th century for the industrial poor, the first welfare state was Imperial Germany (1871-1918), where the Bismarck government introduced social security in 1889. The United Kingdom introduced forms of social security around 1913, and adopted the welfare state with the National Insurance Act 1946, during the Attlee government (1944-1951). A pillar of most mixed-market economies, state provision of support to those in need represented the western post-war consensus and was accepted across the political spectrum by conservatives, liberals and socialists until the neoliberal revolution of the 1970s. It would eventually be reimagined by the Third Way social liberals of the 1990s into the form we know today.'
WHERE Tag = 'TXT_KEY_POLICY_CAPITALISM_TEXT';

-- self determination, very situational, give a second niche
UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Self Determination[ENDCOLOR]: [COLOR_POSITIVE_TEXT]Liberating[ENDCOLOR] a City gives 15 XP to all Units, 50 [ICON_INFLUENCE] Influence with all [ICON_CITY_STATE] City-States, and 40 [ICON_RESEARCH] Science, scaling with Era and City [ICON_CITIZEN] Population. The Liberated City gains an Arsenal and 6 Units. The [ICON_TOURISM] Tourism modifier for [ICON_INTERNATIONAL_TRADE] Trade Routes with other Civilizations is increased by +10%.'
WHERE Tag = 'TXT_KEY_POLICY_URBANIZATION_HELP';

UPDATE Policies SET
	TradeRouteTourismModifier = 10
WHERE Type = 'POLICY_URBANIZATION';

-- transnationalism yields very low

UPDATE Policy_BuildingClassYieldChanges SET
YieldChange = 4
WHERE PolicyType = 'POLICY_GLOBALIZATION';

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Transnationalism[ENDCOLOR]: Each turn, increases the chance that a [ICON_FRANCHISE] Corporate Franchise will appear in a foreign City to 15% (normally 5%). Global Franchise maximum increased by 25%, and every Town counts as a [ICON_FRANCHISE] Franchise. +4 [ICON_CULTURE] Culture from all [ICON_OFFICE] Corporation Offices.'
WHERE Tag = 'TXT_KEY_POLICY_GLOBALIZATION_HELP';

-- universal healthcare. also weak for t2 and hospital is probably already built in important cities

INSERT INTO Policy_YieldGPExpend
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_UNIVERSAL_HEALTHCARE_F', 'YIELD_FOOD', 100);

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Universal Healthcare[ENDCOLOR]: Receive a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Hospital in every City. +50 [ICON_CULTURE] when a Citizen is born in any City, scaling with Era. Expending a [ICON_GREAT_PEOPLE] Great Person grants 100 [ICON_FOOD] Food in the [ICON_CAPITAL] Capital, scaling with Era.'
WHERE Tag = 'TXT_KEY_POLICY_UNIVERSAL_HEALTHCARE_F_HELP';

-- media culture. name is a bit negative and not inkeeping with theme of social democracy
-- beef up effect and make a bit more conditional i.e. requiring the synergy 

UPDATE Language_en_US
SET Text = 'Public Broadcasting'
WHERE Tag = 'TXT_KEY_POLICY_MEDIA_CULTURE';

UPDATE Language_en_US
SET Text = 'Public broadcasting (or public service broadcasting) involves radio, television, and other electronic media outlets whose primary mission is public service. Public broadcasters receive funding from diverse sources including license fees, individual contributions, public financing, and commercial financing, and claim to avoid both political interference and commercial influence. One of the principles of public broadcasting is to provide coverage of interests for which there are missing or small markets. Public broadcasting attempts to supply topics of social benefit that are otherwise not provided by commercial broadcasters. Additionally, public broadcasting may facilitate the implementation of a cultural policy (an industrial policy and investment policy for culture). For example, the Australian Broadcasting Corporation is legally required to "encourage and promote the musical, dramatic and other performing arts in Australia". As a result, these institutions face severe criticism from conservative politicians and think-tanks which allege that their programming has a leftist bias. At the same time, leftists often hold the opposite critique, disliking how close to political figures the controllers of such stations often are, or at least become.'
WHERE Tag = 'TXT_KEY_POLICY_MEDIA_CULTURE_TEXT';

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Public Broadcasting[ENDCOLOR]: Broadcast Towers increase [ICON_CULTURE] Culture and [ICON_TOURISM] Tourism by 10%. Cities generate +10% [ICON_CULTURE] Culture and [ICON_TOURISM] Tourism during a [ICON_GOLDEN_AGE] Golden Age. +20% [ICON_TOURISM] Tourism to civilizations with less [ICON_HAPPINESS_1] Happiness.'
WHERE Tag = 'TXT_KEY_POLICY_MEDIA_CULTURE_HELP';

INSERT INTO Policy_GoldenAgeYieldMod
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_MEDIA_CULTURE', 'YIELD_TOURISM', 10),
	('POLICY_MEDIA_CULTURE', 'YIELD_CULTURE', 10);

DELETE FROM Policy_BuildingClassTourismModifiers WHERE PolicyType = 'POLICY_MEDIA_CULTURE';

-- not sure why the other table cant do this but ok lets not find out
INSERT INTO Policy_BuildingClassTourismModifiers
	(PolicyType, BuildingClassType, TourismModifier)
VALUES
	('POLICY_MEDIA_CULTURE', 'BUILDINGCLASS_BROADCAST_TOWER', 10);

INSERT INTO Policy_BuildingClassYieldModifiers
	(PolicyType, BuildingClassType, YieldType, YieldMod)
VALUES
	('POLICY_MEDIA_CULTURE', 'BUILDINGCLASS_BROADCAST_TOWER', 'YIELD_CULTURE', 10);

DELETE FROM Policy_BuildingClassHappiness WHERE PolicyType = 'POLICY_MEDIA_CULTURE';
DELETE FROM Policy_BuildingClassYieldModifiers WHERE PolicyType = 'POLICY_MEDIA_CULTURE';

UPDATE Policies
SET LessHappyTourismModifier = 20
WHERE Type = 'POLICY_MEDIA_CULTURE';

-- space procurement. strong 20% but bit boring; text is not standardized
-- because we have the great work bonus now, we need to nerf this or its like 40% science increase: too much

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Space Procurements[ENDCOLOR]: May invest in [COLOR_POSITIVE_TEXT]Spaceship Parts[ENDCOLOR] with [ICON_GOLD] Gold. Cities generate +100% [ICON_PRODUCTION] Production towards Spaceship Factories. You receive +400% more [ICON_RESEARCH] Science from [ICON_INTERNATIONAL_TRADE] Trade Routes.'
WHERE Tag = 'TXT_KEY_POLICY_SPACE_PROCUREMENTS_HELP';

DELETE FROM Policy_BuildingClassYieldModifiers WHERE PolicyType = 'POLICY_SPACE_PROCUREMENTS';

INSERT INTO Policy_InternationalRouteYieldModifiers
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_SPACE_PROCUREMENTS', 'YIELD_SCIENCE', 400);

-- containment. only does 2 things, although they are very good.
UPDATE Policies
SET
	ProtectedMinorPerTurnInfluence = 200,
	FreeWCVotes = 3
WHERE Type = 'POLICY_TREATY_ORGANIZATION';

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Containment[ENDCOLOR]: [ICON_INTERNATIONAL_TRADE] Trade Routes to [ICON_CITY_STATE] City-States generate +2 [ICON_INFLUENCE] Influence per turn with them per owned City-State Trade Route (up to +10). +1 [ICON_DIPLOMAT] Delegate in the World Congress for every 3 [ICON_CITY_STATE] City-States originally in the World.'
WHERE Tag = 'TXT_KEY_POLICY_TREATY_ORGANIZATION_HELP';


-- text changes
UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Their Finest Hour[ENDCOLOR]: All cities get +2 [ICON_AIRPORT] Air Unit Slots. Each Air Unit stationed in a city increases the City''s [ICON_STRENGTH] Defense by 3. Can build [COLOR_YELLOW]B17 Bombers[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_POLICY_THEIR_FINEST_HOUR_HELP';
