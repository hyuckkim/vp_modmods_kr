----------------------------------------------------------------------------
-- Enlightenment Era (Vox Populi)
-- 2018-01-29 Infixo, created
-- 2023-11-06 Updated by CAYM to be compatible with VP 4.2.7
----------------------------------------------------------------------------


----------------------------------------------------------------------------
-- ERAS
----------------------------------------------------------------------------

INSERT INTO Eras (
	Type, Description, ShortDescription, Abbreviation, ArtPrefix, Strategy,
	NoGoodies, NoBarbUnits, NoReligion, FirstSoundtrackFirst, ResearchAgreementCost, EmbarkedUnitDefense,
	StartingUnitMultiplier, StartingDefenseUnits, StartingWorkerUnits, StartingExploreUnits, StartingGold, StartingCulture,	FreePopulation, LaterEraBuildingConstructMod,
	StartPercent, BuildingMaintenancePercent, GrowthPercent, TrainPercent, ConstructPercent, CreatePercent, ResearchPercent, BuildPercent, ImprovementPercent, GreatPeoplePercent, CulturePercent,
	TradeRouteFoodBonusTimes100, TradeRouteProductionBonusTimes100, EventChancePerTurn, SpiesGrantedForPlayer, SpiesGrantedForEveryone, FaithCostMultiplier,
	DiploEmphasisReligion, DiploEmphasisLatePolicies, LeaguePercent, WarmongerPercent, SoundtrackSpace, CityBombardEffectTag, AudioUnitVictoryScript, AudioUnitDefeatScript, CityArtType,
	StartingCityStateDefenseUnits, EraSplashImage) -- VP specific
VALUES (
	'ERA_ENLIGHTENMENT', 'TXT_KEY_ERA_EE', 'TXT_KEY_ERA_EE_SHORT', 'TXT_KEY_ERA_EE_ABBREV', 'ENLIGHTENMENT', 'TXT_KEY_ERA_ENLIGHTENMENT_STRATEGY',
	1, 0, 0, 0, 275, 9,
	2, 2, 1, 1, 75, 350, 1, -2,
	40, 70, 85, 45, 50, 50, 30, 85, 85, 85, 85,
	500, 500, 5, 1, 0, 175,
	4, 0, 300, 85, 140, 'CITY_BOMBARD_MID', 'AS2D_VICTORY_MIDDLE', 'AS2D_LOSS_MIDDLE', NULL,
	0, 'ERA_Enlightenment.dds'); -- VP specific

UPDATE Eras SET ID = 9 WHERE Type = 'ERA_ENLIGHTENMENT'; -- Maybe code complicated, but this is good. i do not know why(Caym)  -- because two entries cant have the same ID (Hokath)
UPDATE Eras SET ID = 8 WHERE Type = 'ERA_FUTURE';
UPDATE Eras SET ID = 7 WHERE Type = 'ERA_POSTMODERN';
UPDATE Eras SET ID = 6 WHERE Type = 'ERA_MODERN';
UPDATE Eras SET ID = 5 WHERE Type = 'ERA_INDUSTRIAL';
UPDATE Eras SET ID = 4 WHERE Type = 'ERA_ENLIGHTENMENT';


INSERT INTO Era_CitySoundscapes (EraType, CitySizeType, SoundscapeScript) VALUES
('ERA_ENLIGHTENMENT', 'CITYSIZE_SMALL',  'ASSS_CITY_MIDDLE_SMALL_SELECT_AMB'),
('ERA_ENLIGHTENMENT', 'CITYSIZE_MEDIUM', 'ASSS_CITY_MIDDLE_SMALL_SELECT_AMB'),
('ERA_ENLIGHTENMENT', 'CITYSIZE_LARGE',  'ASSS_CITY_MIDDLE_LARGE_SELECT_AMB');

INSERT INTO Era_NewEraVOs (EraType, VOScript) VALUES
('ERA_ENLIGHTENMENT', 'AS2D_ERA_SPEECH_ENLIGHTENMENT_ERA01'),
('ERA_ENLIGHTENMENT', 'AS2D_ERA_SPEECH_ENLIGHTENMENT_ERA02'),
('ERA_ENLIGHTENMENT', 'AS2D_ERA_SPEECH_ENLIGHTENMENT_ERA03'),
('ERA_ENLIGHTENMENT', 'AS2D_ERA_SPEECH_ENLIGHTENMENT_ERA04');

INSERT INTO Era_Soundtracks (EraType, SoundTrack) VALUES
('ERA_ENLIGHTENMENT', 'AS2D_BACH_ALLEGRO'),
('ERA_ENLIGHTENMENT', 'AS2D_BACH_ALLEGRO_ASSAI'),
('ERA_ENLIGHTENMENT', 'AS2D_BACH_ALLEMANDE'),
('ERA_ENLIGHTENMENT', 'AS2D_BACH_BOUREE'),
('ERA_ENLIGHTENMENT', 'AS2D_BACH_BRANDENBURG_2_3'),
('ERA_ENLIGHTENMENT', 'AS2D_BACH_BRANDENBURG_3_1'),
('ERA_ENLIGHTENMENT', 'AS2D_BACH_BRANDENBURG_4_1'),
('ERA_ENLIGHTENMENT', 'AS2D_BACH_BRANDENBURG_6_1'),
('ERA_ENLIGHTENMENT', 'AS2D_BACH_BRANDENBURG_6_3'),
('ERA_ENLIGHTENMENT', 'AS2D_BACH_GIGUE'),
('ERA_ENLIGHTENMENT', 'AS2D_BACH_LARGO'),
('ERA_ENLIGHTENMENT', 'AS2D_BACH_MENUET'),
('ERA_ENLIGHTENMENT', 'AS2D_BACH_SARABANDE'),
('ERA_ENLIGHTENMENT', 'AS2D_BEETHOVEN_ALLEGRETTO'),
('ERA_ENLIGHTENMENT', 'AS2D_BEETHOVEN_ANDANTE'),
('ERA_ENLIGHTENMENT', 'AS2D_BEETHOVEN_ROMANCE_1'),
('ERA_ENLIGHTENMENT', 'AS2D_MOZART_ADAGIO'),
('ERA_ENLIGHTENMENT', 'AS2D_MOZART_ANDANTE'),
('ERA_ENLIGHTENMENT', 'AS2D_MOZART_ROMANCE');

--EE prophet
UPDATE PostDefines
SET Key = 'ERA_ENLIGHTENMENT'
WHERE Name = 'RELIGION_LAST_FOUND_ERA';

-- Allow for Faith purchases
INSERT INTO Belief_EraFaithUnitPurchase (BeliefType, EraType)
VALUES ('BELIEF_HEATHEN_CONVERSION', 'ERA_ENLIGHTENMENT');
