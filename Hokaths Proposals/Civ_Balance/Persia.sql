UPDATE Buildings SET
EventTourism = 1,
NoUnhappfromXSpecialists = 1,
VassalLevyEra = 1,
BuildAnywhere = 0,
-- Happiness = 1,
-- SpecialistCount = 1,
SpecialistType = 'SPECIALIST_CIVIL_SERVANT',
Defense = 200,
GreatPeopleRateModifier = 25
WHERE Type = 'BUILDING_SATRAPS_COURT';

DELETE FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_SATRAPS_COURT';

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
 	('BUILDING_SATRAPS_COURT', 'YIELD_GOLD', 3),
 	('BUILDING_SATRAPS_COURT', 'YIELD_SCIENCE', 3),
 	('BUILDING_SATRAPS_COURT', 'YIELD_CULTURE', 1),
 	('BUILDING_SATRAPS_COURT', 'YIELD_PRODUCTION', 2);

DELETE FROM Building_YieldChangesPerPop WHERE BuildingType = 'BUILDING_SATRAPS_COURT';

INSERT INTO Building_YieldChangesPerPop
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_SATRAPS_COURT', 'YIELD_SCIENCE', 17);

DELETE FROM Building_SpecialistYieldChangesLocal WHERE BuildingType = 'BUILDING_SATRAPS_COURT';

/*
-- an idea, but actually the satraps "became more powerful", so its not historically appropriate i think
INSERT INTO Building_BuildingClassYieldChanges
	(BuildingType, BuildingClassType, YieldType, YieldChange)
SELECT
	'BUILDING_SATRAPS_COURT', 'BUILDINGCLASS_PALACE', Type, 1
FROM Yields WHERE ID < 6;  -- all yields
*/

UPDATE Language_en_US SET
Text = 'While it is often a burden to have to construct a Courthouse, the Satrap''s Court is a massive boon. Functioning like a mini Palace, you receive not only yield bonuses, but also the special effects of Event Tourism and Vassal Unit Levy, albeit at reduced effect. Imperial expansion, in particular that which leads to acquiring vassals, is therefore particularly important for Persia.[NEWLINE][NEWLINE]Further, the Satrap''s Court boosts Great Person Rate: where usually an Annexed City would be behind in generating Points, Persian conquests can actually outperform your own core Cities with the right conditions! Like the Palace, you ignore an additional point of Urbanization, and can even work one extra Civil Servant, allowing you greater access to Great Diplomats than many other Civilizations.'
WHERE Tag = 'TXT_KEY_BUILDING_SATRAPS_COURT_STRATEGY';


