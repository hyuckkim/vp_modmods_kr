-- name swap

UPDATE Policies
SET
	PortraitIndex = 47
WHERE Type = 'POLICY_THEOCRACY';

UPDATE Language_en_US
SET Text = 'Fiefdoms'
WHERE Tag = 'TXT_KEY_POLICY_THEOCRACY';

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Fiefdoms[ENDCOLOR][NEWLINE][ICON_BULLET]+33% Yields from Internal [ICON_INTERNATIONAL_TRADE] Trade Routes.[NEWLINE][ICON_BULLET]Completing an Internal [ICON_INTERNATIONAL_TRADE] Trade Route triggers a Historic Event as if completing an International [ICON_INTERNATIONAL_TRADE] Trade Route.[NEWLINE][ICON_BULLET]-1 [ICON_HAPPINESS_3] Unhappiness from [ICON_CULTURE] Boredom in all Cities.'
WHERE Tag = 'TXT_KEY_POLICY_THEOCRACY_HELP';

UPDATE Language_en_US
SET Text = 'A fief is a heritable right to property or income source granted by a king to a lesser noble in return for vows of fealty. A fief usually took the form of revenue-producing lands which the noble could levy taxes from, in which case the estate was called a Fiefdom, but it could also take other forms, such as a trade monopoly or resource rights, like mining. These fiefs were central to the Medieval feudal system, and allowed kings to bind knights to their service without the need for the large bureaucracies and costs of a standing army; it was up to knights to sustain their own livelihoods once they had been given the means to do so.'
WHERE Tag = 'TXT_KEY_POLICY_THEOCRACY_TEXT';

UPDATE Policies
SET
	PortraitIndex = 45,
	--ExtraHappinessPerCity = 1,
	ExtraHappiness = 4,
	HappyPerMilitaryUnit = 0,
	IlliteracyFlatReduction = 1
WHERE Type = 'POLICY_REFORMATION';

UPDATE Language_en_US
SET Text = 'Divine Right'
WHERE Tag = 'TXT_KEY_POLICY_REFORMATION';

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Divine Right[ENDCOLOR][NEWLINE][ICON_BULLET]+4 [ICON_HAPPINESS_1] Happiness in the [ICON_CAPITAL] Capital.[NEWLINE][ICON_BULLET]-1 [ICON_HAPPINESS_3] Unhappiness from [ICON_RESEARCH] Illiteracy in all Cities.[NEWLINE][ICON_BULLET]+15% [ICON_PRODUCTION] Production and +100% [ICON_CULTURE_LOCAL] Border Growth during "[COLOR_POSITIVE_TEXT]We Love the King Day[ENDCOLOR]."'
WHERE Tag = 'TXT_KEY_POLICY_REFORMATION_HELP';

UPDATE Language_en_US
SET Text = 'The divine right of kings, or divine-right theory of kingship, is a political and religious doctrine of royal and political legitimacy. It asserts that a monarch is subject to no earthly authority, deriving the right to rule directly from the will of God. The king is thus not subject to the will of his people, the aristocracy, or any other estate of the realm, including (in the view of some, especially in Protestant countries) the Church. According to this doctrine, only God can judge an unjust king. The doctrine implies that any attempt to depose the king or to restrict his powers runs contrary to the will of God and may constitute a sacrilegious act. It is often expressed in the phrase "by the Grace of God," attached to the titles of a reigning monarch.'
WHERE Tag = 'TXT_KEY_POLICY_REFORMATION_TEXT';
