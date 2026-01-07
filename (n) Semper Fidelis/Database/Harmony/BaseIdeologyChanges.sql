-- change united front because we steal its effects
UPDATE Policies SET
	ExtraSupplyPerPopulation = 0,
	MinimumAllyInfluenceIncreaseAtWar = 0,
	CityStateUnitFrequencyModifier = 0,
	ExtraSupplyFlat = 20,
        FreeSpy = 1
WHERE Type = 'POLICY_UNITED_FRONT';

UPDATE Language_en_US
SET Text = 'Direct Action'
WHERE Tag = 'TXT_KEY_POLICY_UNITED_FRONT';

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Direct Action[ENDCOLOR]: Gain 20 [ICON_SILVER_FIST] Supply. Receive 100 [ICON_SPY_POINT] Spy Points. Receive 75 [ICON_PRODUCTION] Production, [ICON_CULTURE] Culture, and [ICON_TOURISM] Tourism when you identify a foreign [ICON_SPY] Spy, scaling with Era.'
WHERE Tag = 'TXT_KEY_POLICY_UNITED_FRONT_HELP';

INSERT INTO Policy_YieldForSpyID
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_UNITED_FRONT', 'YIELD_TOURISM', 75),
	('POLICY_UNITED_FRONT', 'YIELD_PRODUCTION', 75),
	('POLICY_UNITED_FRONT', 'YIELD_CULTURE', 75);

UPDATE Language_en_US
SET Text = 'Fascism takes a Futurist view of modern politics as being an "endless struggle" that necessitates and legitimizes the use of violence, raising strength of arms to an almost unparalleled status within the philosophy. Following this line of reasoning, most fascist parties have created their own paramilitary groups (e.g. the Nazi Party''s Brown shirts and Fascist Italy''s Blackshirts) to help them obtain power. Indeed, some kind of paramilitary participation is almost always a basic requirement of membership in fascist movements. It is important to stress that while early, orthodox fascism held social Darwinist views, Nazism believed specifically 0that the Germanic race was superior to all others, and today the concept of racial purity is often at the heart of modern (often termed Neo-Nazi) paramilitary groups.'
WHERE Tag = 'TXT_KEY_POLICY_UNITEDFRONT_TEXT';
-- note the typo in the tag

