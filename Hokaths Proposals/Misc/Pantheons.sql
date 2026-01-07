-- renewal
DELETE FROM Belief_BuildingClassYieldChanges WHERE BeliefType = 'BELIEF_SACRED_PATH';

INSERT INTO Belief_BuildingClassYieldChanges
	(BeliefType, BuildingClassType, YieldType, YieldChange)
VALUES
	('BELIEF_SACRED_PATH', 'BUILDINGCLASS_MARKET', 'YIELD_FOOD', 2),
	('BELIEF_SACRED_PATH', 'BUILDINGCLASS_MARKET', 'YIELD_FAITH', 2);

UPDATE Language_en_US
SET Text = '+1 [ICON_PEACE] Faith, [ICON_CULTURE] Culture, and [ICON_RESEARCH] Science for every 2 Jungle or 2 Forest tiles worked by the City. +2 [ICON_FOOD] Food and [ICON_PEACE] Faith from Markets.'
WHERE Tag = 'TXT_KEY_BELIEF_SACRED_PATH';

-- god king
DELETE FROM Belief_YieldPerXFollowers WHERE BeliefType = 'BELIEF_GOD_KING' AND YieldType = 'YIELD_FAITH';

UPDATE Language_en_US
SET Text = Replace(Text, '[ICON_PEACE] Faith, ', '')
WHERE Tag = 'TXT_KEY_BELIEF_GOD_KING';

-- keep your pantheon after being spread to
-- UPDATE CustomModOptions SET Value = 1 WHERE Name = 'BALANCE_PERMANENT_PANTHEONS';
