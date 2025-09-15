UPDATE Technologies SET GridX = 19, GridY = 5, ExtraVotesPerDiplomat = 0, InternationalTradeRoutesChange = 0, Cost = 30000 WHERE Type='TECH_ROBOTICS'; -- CAYM Edited

UPDATE Technologies SET GridX = 19, GridY = 3, ExtraVotesPerDiplomat = 0, Cost = 30000, InternationalTradeRoutesChange = 1 WHERE Type= 'TECH_GLOBALIZATION'; -- CAYM Edited

UPDATE Technologies SET Era = 'ERA_FUTURE', GridY = 7, GridX = 19, Cost = 30000 WHERE Type='TECH_NANOTECHNOLOGY'; -- CAYM Edited

UPDATE Technologies SET Era = 'ERA_FW_FUTURE', GridY = 7, GridX = 20, Cost = 35000 WHERE Type='TECH_PARTICLE_PHYSICS'; -- CAYM Edited

UPDATE Technologies SET Era = 'ERA_FW_FUTURE', GridY = 6, GridX = 24, Cost = 60000 WHERE Type='TECH_NUCLEAR_FUSION';

UPDATE Technologies SET Era = 'ERA_FW_FUTURE', Cost = 80000, GridX = 27 WHERE Type='TECH_FUTURE_TECH';

DELETE FROM Technology_FreePromotions WHERE TechType='TECH_NANOTECHNOLOGY';

UPDATE Resolutions SET TechPrereqAnyMember = 'TECH_COMPUTRONIUM' WHERE Type = 'RESOLUTION_DIPLOMATIC_VICTORY'; -- CAYM Edited
UPDATE Resolutions SET TechPrereqAnyMember = 'TECH_DIGITAL_SOCIETY' WHERE Type = 'RESOLUTION_UNITED_NATIONS'; -- CAYM Edited
-- UPDATE LeagueSpecialSessions SET EraTrigger = 'ERA_FW_FUTURE' WHERE Type = 'LEAGUE_SPECIAL_SESSION_WORLD_ASSEMBLY';
-- RESOLUTION_WORLD_IDEOLOGY RESOLUTION_INTERNATIONAL_SPACE_STATION DIPLOMACY VICTORY

UPDATE Projects SET Cost = 12000, TechPrereq = "TECH_PLANETARY_MIGRATION" WHERE Type = 'PROJECT_APOLLO_PROGRAM'; 
  
--------------------------------
-- SPECIAL LIST PROMOTION (TECH) -- CAYM Edited
------------------------------
DELETE FROM Tech_SpecialistYieldChanges
WHERE
    TechType = 'TECH_COMPUTERS'
    AND SpecialistType = 'SPECIALIST_ARTIST'
    AND YieldType = 'YIELD_CULTURE'
    AND Yield = 1;

DELETE FROM Tech_SpecialistYieldChanges
WHERE
    TechType = 'TECH_INTERNET'
    AND SpecialistType = 'SPECIALIST_MERCHANT'
    AND YieldType = 'YIELD_GOLD'
    AND Yield = 3;

DELETE FROM Tech_SpecialistYieldChanges
WHERE
    TechType = 'TECH_INTERNET'
    AND SpecialistType = 'SPECIALIST_CIVIL_SERVANT'
    AND YieldType = 'YIELD_CULTURE'
    AND Yield = 1;

DELETE FROM Tech_SpecialistYieldChanges
WHERE
    TechType = 'TECH_NUCLEAR_FUSION'
    AND SpecialistType = 'SPECIALIST_SCIENTIST'
    AND YieldType = 'YIELD_SCIENCE'
    AND Yield = 3;


INSERT INTO Tech_SpecialistYieldChanges
	(TechType, SpecialistType, YieldType, Yield)
VALUES
    ('TECH_INTERNET',          'SPECIALIST_ARTIST',        'YIELD_CULTURE',    2), -- this from COMPUTER 1->2
    ('TECH_GLOBALIZATION',     'SPECIALIST_CIVIL_SERVANT', 'YIELD_CULTURE',    1), -- from Internet
    ('TECH_GRID_COMPUTING',    'SPECIALIST_MERCHANT',      'YIELD_GOLD',       3), -- from Internet
    ('TECH_PARTICLE_PHYSICS',  'SPECIALIST_SCIENTIST',     'YIELD_SCIENCE',    3), -- from nuclear fusion
	('TECH_METAVERSE',          'SPECIALIST_MUSICIAN',      'YIELD_CULTURE',    2),
	('TECH_PLANETARY_MIGRATION','SPECIALIST_CITIZEN',       'YIELD_SCIENCE',    1),
    ('TECH_QUANTUM_SYNC',       'SPECIALIST_CITIZEN',       'YIELD_PRODUCTION', 1),
    ('TECH_BIOMODIFICATION',   'SPECIALIST_CITIZEN',       'YIELD_CULTURE',    1),
    ('TECH_NUCLEAR_FUSION',    'SPECIALIST_CITIZEN',       'YIELD_GOLD',       1);

