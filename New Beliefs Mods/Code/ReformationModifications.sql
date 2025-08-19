-- Sacred Sites goes Wider, loses World Wonder bonus
UPDATE Beliefs SET FaithBuildingTourism = 4 WHERE Type = 'BELIEF_SACRED_SITES';

DELETE FROM Belief_BuildingClassTourism WHERE BeliefType = 'BELIEF_SACRED_SITES';
DELETE FROM Belief_BuildingClassYieldChanges WHERE BeliefType = 'BELIEF_SACRED_SITES';
DELETE FROM Belief_YieldChangeWorldWonder WHERE BeliefType = 'BELIEF_SACRED_SITES';

INSERT INTO Belief_BuildingClassTourism
		(BeliefType, 			BuildingClassType, 				Tourism)
VALUES	('BELIEF_SACRED_SITES', 'BUILDINGCLASS_HERMITAGE', 		5),
		('BELIEF_SACRED_SITES', 'BUILDINGCLASS_GRAND_TEMPLE', 	5),
		('BELIEF_SACRED_SITES', 'BUILDINGCLASS_HOTEL', 			4),
		('BELIEF_SACRED_SITES', 'BUILDINGCLASS_TEMPLE', 		4);

INSERT INTO Belief_BuildingClassYieldChanges
		(BeliefType, 			BuildingClassType, 				YieldType, 			YieldChange)
VALUES	('BELIEF_SACRED_SITES', 'BUILDINGCLASS_HERMITAGE', 		'YIELD_CULTURE', 	5),
		('BELIEF_SACRED_SITES', 'BUILDINGCLASS_GRAND_TEMPLE', 	'YIELD_CULTURE', 	5);

UPDATE Language_en_US
SET Text = 'Natural Wonders, Temples, Hotels and all buildings purchased with Faith provide +4 [ICON_TOURISM] Tourism each. The Grand Temple and Hermitage provide +5 [ICON_CULTURE] Culture and +5 [ICON_TOURISM] Tourism.'
WHERE Tag = 'TXT_KEY_BELIEF_SACRED_SITES';

-- Global Commandments loses its spread ability
UPDATE Beliefs SET SpreadStrengthModifier = 0 WHERE Type = 'BELIEF_CHARITABLE_MISSIONS';

UPDATE Language_en_US
SET Text = '+10 [ICON_RESEARCH] Science, [ICON_CULTURE] Culture, [ICON_GOLD] Gold, [ICON_PEACE] Faith, and [ICON_GOLDEN_AGE] Golden Age Points per turn while the Host of the World Congress. Receive 150 of these yields instantly when you pass a Proposal. Bonuses scale with Era.'
WHERE Tag = 'TXT_KEY_BELIEF_CHARITABLE_MISSIONS';

-- Faith of the Masses gains bonus to World Wonders
INSERT INTO Belief_YieldChangeWorldWonder
		(BeliefType, 				YieldType, 			Yield)
VALUES	('BELIEF_UNDERGROUND_SECT', 'YIELD_CULTURE', 	2);

UPDATE Language_en_US
SET Text = 'May build Amphitheaters, Opera Houses, Museums, Broadcast Towers, and Stadiums with [ICON_PEACE] Faith. These buildings and all World Wonders produce +2 [ICON_CULTURE] Culture each.'
WHERE Tag = 'TXT_KEY_BELIEF_UNDERGROUND_SECT';