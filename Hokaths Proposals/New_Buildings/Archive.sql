INSERT INTO BuildingClasses 	
			(Type,	DefaultBuilding, Description)
VALUES		('BUILDINGCLASS_ARCHIVE',	'BUILDING_ARCHIVE',	'TXT_KEY_BUILDING_ARCHIVE');

INSERT INTO	 Buildings
	(Type,	Description,	Civilopedia,  Strategy,		Help,		
		GoldMaintenance, 	Cost, FaithCost, HurryCostModifier, 	MinAreaSize, 	ConquestProb, 	BuildingClass, 					
		ArtDefineTag, 	PrereqTech, 	PortraitIndex, 	IconAtlas)
VALUES	
	('BUILDING_ARCHIVE',	'TXT_KEY_BUILDING_ARCHIVE', 	'TXT_KEY_BUILDING_ARCHIVE_TEXT',	'TXT_KEY_BUILDING_ARCHIVE_STRATEGY',	'TXT_KEY_BUILDING_ARCHIVE_HELP',	
		2, 	300, 400, -20, 	-1, 	80, 	'BUILDINGCLASS_ARCHIVE', 	
		'ART_DEF_BUILDING_MARKET', 	'TECH_THEOLOGY', 	7,	'CORP2_ATLAS');

INSERT INTO Building_ClassesNeededInCity 	
	(BuildingType, 	BuildingClassType)
VALUES
	('BUILDING_ARCHIVE', 'BUILDINGCLASS_LIBRARY');

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_ARCHIVE', 'YIELD_CULTURE', 1),	
	('BUILDING_ARCHIVE', 'YIELD_SCIENCE', 1);

INSERT INTO Building_Flavors 
	(BuildingType, FlavorType, Flavor)
VALUES
	('BUILDING_ARCHIVE', 'FLAVOR_CULTURE', 20),
	('BUILDING_ARCHIVE', 'FLAVOR_SCIENCE', 10),
	('BUILDING_ARCHIVE', 'FLAVOR_GREAT_PEOPLE', 5);

-- move the garden back

UPDATE Buildings SET
PrereqTech = 'TECH_CIVIL_SERVICE',
Cost = 350
WHERE BuildingClass = 'BUILDINGCLASS_GARDEN';

DELETE FROM Building_FeatureYieldChanges
WHERE FeatureType = 'FEATURE_OASIS'
AND BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_GARDEN');

UPDATE Language_en_US SET 
Text = Replace(Text, 'Nearby Oases: +2 [ICON_GOLD] Gold.[NEWLINE]', '')
WHERE Tag IN (SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_GARDEN');

INSERT INTO Building_FeatureYieldChanges 
	(BuildingType, FeatureType, YieldType, Yield)
VALUES
	('BUILDING_ARCHIVE', 'FEATURE_OASIS', 'YIELD_GOLD', 2);

-- move garden resources to circus to maintain balance
UPDATE Building_ResourceYieldChanges SET
BuildingType = 'BUILDING_CIRCUS' 
WHERE BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_CIRCUS');

UPDATE Language_en_US SET 
Text = Replace(Text, '[NEWLINE]Nearby [ICON_RES_CITRUS] Citrus: +1 [ICON_FOOD] Food, +1 [ICON_GOLD] Gold.[NEWLINE]Nearby [ICON_RES_COCOA] Cocoa: +1 [ICON_FOOD] Food, +1 [ICON_GOLD] Gold.', '')
WHERE Tag IN (SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_GARDEN');

DELETE FROM Building_ResourceYieldChanges
WHERE BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_GARDEN')
AND ResourceType IN ('RESOURCE_CITRUS', 'RESOURCE_COCOA');

INSERT INTO Building_ResourceYieldChanges
	(BuildingType, ResourceType, YieldType, Yield)
SELECT
	a.Type, b.Type, c.Type, 1
FROM Buildings a, Resources b, Yields c
WHERE a.Type IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_CIRCUS' AND Type != 'BUILDING_CIRCUS')
AND b.Type IN ('RESOURCE_CITRUS', 'RESOURCE_COCOA')
AND c.Type IN ('YIELD_FOOD', 'YIELD_GOLD');

UPDATE Language_en_US SET
Text = Text || '[NEWLINE]Nearby [ICON_RES_CITRUS] Citrus: +1 [ICON_FOOD] Food, +1 [ICON_GOLD] Gold.[NEWLINE]Nearby [ICON_RES_COCOA] Cocoa: +1 [ICON_FOOD] Food, +1 [ICON_GOLD] Gold.'
WHERE Tag IN (SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_CIRCUS');

-- nerf the palace to move power to the archive

UPDATE Buildings SET
EventTourism = 2  -- from 7
WHERE BuildingClass = 'BUILDINGCLASS_PALACE';

UPDATE Buildings SET
GreatWorkCount = 1 
WHERE Type = 'BUILDING_AMPHITHEATER';  -- dont want to change UB atm

UPDATE Buildings SET
EventTourism = 1,
ThemingBonusHelp = 'TXT_KEY_AMPHITHEATER_THEMING_BONUS_HELP',
GreatWorkSlotType = 'GREAT_WORK_SLOT_LITERATURE',
GreatWorkCount = 2,
UnlockedByBelief = 1
WHERE BuildingClass = 'BUILDINGCLASS_ARCHIVE';

-- move theming from the amphtheater 

UPDATE Building_ThemingBonuses SET
BuildingType = 'BUILDING_ARCHIVE'
WHERE BuildingType = 'BUILDING_AMPHITHEATER';

UPDATE Building_ThemingYieldBonus SET
BuildingType = 'BUILDING_ARCHIVE'
WHERE BuildingType = 'BUILDING_AMPHITHEATER';

INSERT INTO Building_ThemingYieldBonus
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_ARCHIVE', 'YIELD_SCIENCE', 1);

UPDATE Language_en_US SET
Text = Replace(Text, 'Contains 2 slots for [ICON_VP_GREATWRITING] Great Works of Writing.', 'Contains 1 slot for [ICON_VP_GREATWRITING] Great Works of Writing.')
WHERE Tag = 'TXT_KEY_BUILDING_AMPHITHEATER_STRATEGY';

UPDATE Language_en_US SET
Text = Replace(Text, '[NEWLINE][NEWLINE]+2 [ICON_CULTURE] Culture if [COLOR_POSITIVE_TEXT]Themed[ENDCOLOR].', '')
WHERE Tag = 'TXT_KEY_BUILDING_AMPHITHEATER_HELP';

---------------------
-- policy changes 
---------------------
-- change out Amphitheater for Archive in Artistry. Amphi was v early for a Medieval late-policy anyway.
-- just adding would be a pretty big buff, so dont do that
UPDATE Policy_BuildingClassYieldChanges SET BuildingClassType = 'BUILDINGCLASS_ARCHIVE' WHERE BuildingClassType = 'BUILDINGCLASS_AMPHITHEATER' AND PolicyType = 'POLICY_ETHICS';

UPDATE Language_en_US SET 
Text = Replace(Text, 'Amphitheaters', 'Archives')
WHERE Tag = 'TXT_KEY_POLICY_ETHICS_HELP';

-- let Tradition have some more scaling so Tall can still do ok
UPDATE Buildings SET 
EventTourism = 4
WHERE Type = 'BUILDING_THRONE_ROOM';

UPDATE Language_en_US SET 
Text = '+10% to [COLOR_POSITIVE_TEXT]All Yields[ENDCOLOR] in the City. +1 [COLOR_POSITIVE_TEXT]Tile Working Range[ENDCOLOR]. Strengthens [ICON_TOURISM] Tourism of [COLOR_POSITIVE_TEXT]Historic Events[ENDCOLOR] generated by the Palace. Contains 1 slot for a [ICON_VP_GREATMUSIC] Great Work of Music.[NEWLINE][NEWLINE]Can only be constructed via the [COLOR_MAGENTA]{TXT_KEY_CIV5_POLICY_TRADITION_HEADING}[ENDCOLOR] Finisher.'
WHERE Tag = 'TXT_KEY_BUILDING_CAPITAL_THRONE_ROOM_HELP';

UPDATE Language_en_US
SET Text = Replace(Text, '1 [ICON_VP_GREATMUSIC] Great Work of Music slot, 1 [ICON_VP_MUSICIAN] Musician Slot', 'Strengthens [ICON_TOURISM] Tourism of [COLOR_POSITIVE_TEXT]Historic Events[ENDCOLOR] generated by the Palace, 1 [ICON_VP_GREATMUSIC] Great Work of Music slot, 1 [ICON_VP_MUSICIAN] Musician Slot')
WHERE Tag = 'TXT_KEY_POLICY_BRANCH_TRADITION_HELP';

----------------------
-- religion changes
----------------------
UPDATE Language_en_US SET
Text = '+3 [ICON_PEACE] Faith from all Archives in the Empire. ' || Text
WHERE Tag = 'TXT_KEY_BUILDING_RELIGIOUS_LIBRARY_HELP';

UPDATE Language_en_US SET 
Text = Replace(Text, '+5 [ICON_RESEARCH] Science from [ICON_RELIGION] Holy Sites;', '+3 [ICON_PEACE] Faith from Archives; +5 [ICON_RESEARCH] Science from [ICON_RELIGION] Holy Sites;')
WHERE Tag = 'TXT_KEY_BELIEF_TITHE';

INSERT INTO Building_BuildingClassYieldChanges
	(BuildingType, BuildingClassType, YieldType, YieldChange)
VALUES
	('BUILDING_RELIGIOUS_LIBRARY', 'BUILDINGCLASS_ARCHIVE', 'YIELD_FAITH', 3);

-- split faith of the masses
INSERT INTO Beliefs
	(Type, 	Description, 	ShortDescription, Tooltip, 
	Pantheon,  Founder,  Follower, 	Enhancer,  Reformation,
	MinPopulation)
VALUES	
	('BELIEF_CUSTODIANS', 	'TXT_KEY_BELIEF_CUSTODIANS', 		'TXT_KEY_BELIEF_CUSTODIANS_SHORT',        'TXT_KEY_BELIEF_CUSTODIANS',		
	0, 	0, 	  0, 	 0, 	 1,
	20);

INSERT INTO Language_en_US 
	(Tag, Text)
VALUES
	('TXT_KEY_BELIEF_CUSTODIANS_SHORT', 'Custodianship'),
	('TXT_KEY_BELIEF_CUSTODIANS', 'May purchase Archives, Galleries, and Museums with [ICON_PEACE] Faith, and each building gains +2 [ICON_TOURISM] Tourism. +5 [ICON_FOOD] Food, +3 [ICON_RESEARCH] Science, and +2 [ICON_TOURISM] Tourism if the City has at least 20 [ICON_CITIZEN] Citizens.');

INSERT INTO Belief_CityYieldChanges
	(BeliefType, YieldType, Yield)
VALUES
	('BELIEF_CUSTODIANS', 'YIELD_FOOD', 5),
	('BELIEF_CUSTODIANS', 'YIELD_TOURISM', 2),
	('BELIEF_CUSTODIANS', 'YIELD_SCIENCE', 3);

DELETE FROM Belief_BuildingClassYieldChanges
WHERE BuildingClassType IN ('BUILDINGCLASS_GALLERY', 'BUILDINGCLASS_MUSEUM');

DELETE FROM Belief_BuildingClassFaithPurchase
WHERE BuildingClassType IN ('BUILDINGCLASS_GALLERY', 'BUILDINGCLASS_MUSEUM');

UPDATE Language_en_US SET
Text = Replace(Text, 'Museums, ', '')
WHERE Tag = 'TXT_KEY_BELIEF_UNDERGROUND_SECT';

-- this is actually undoing a different change in ReligionChanges.sql (loads first)
UPDATE Language_en_US SET
Text = Replace(Text, 'Galleries, ', '')
WHERE Tag = 'TXT_KEY_BELIEF_UNDERGROUND_SECT';

INSERT INTO Belief_BuildingClassYieldChanges
	(BeliefType, BuildingClassType, YieldType, YieldChange)
SELECT
	'BELIEF_CUSTODIANS', Type, 'YIELD_TOURISM', 2
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_ARCHIVE', 'BUILDINGCLASS_GALLERY', 'BUILDINGCLASS_MUSEUM');

INSERT INTO Belief_BuildingClassFaithPurchase
	(BeliefType, BuildingClassType)
SELECT
	'BELIEF_CUSTODIANS', Type
FROM Buildings WHERE Type IN ('BUILDINGCLASS_ARCHIVE', 'BUILDINGCLASS_GALLERY', 'BUILDINGCLASS_MUSEUM');

-- we should therefore rebalance these reformations
-- divine teachings
UPDATE Beliefs SET GreatPersonExpendedFaith = 0 WHERE Type = 'BELIEF_JESUIT_EDUCATION';

INSERT INTO Belief_YieldFromSpread
	(BeliefType, YieldType, Yield)
VALUES
	('BELIEF_JESUIT_EDUCATION', 'YIELD_GOLD', 15);

UPDATE Language_en_US SET 
Text = Replace(Text, ' Holy City gains 20 [ICON_PEACE] Faith each time the owner expends a [ICON_GREAT_PEOPLE] Great Person, scaling with Era.', ' When you spread your [ICON_RELIGION] Religion to foreign Cities, gain +15 [ICON_GOLD] Gold, scaling with the number of new Followers of your [ICON_RELIGION] Religion.')
WHERE Tag = 'TXT_KEY_BELIEF_JESUIT_EDUCATION';

UPDATE Language_en_US
SET Text = Replace(Text, 'Libraries, ', '')
WHERE Tag = 'TXT_KEY_BELIEF_JESUIT_EDUCATION';

UPDATE Language_en_US
SET Text = Replace(Text, 'Observatories, ', '')
WHERE Tag = 'TXT_KEY_BELIEF_JESUIT_EDUCATION';

DELETE FROM Belief_BuildingClassYieldChanges WHERE BuildingClassType IN ('BUILDINGCLASS_LIBRARY', 'BUILDINGCLASS_OBSERVATORY');

DELETE FROM Belief_BuildingClassFaithPurchase WHERE BuildingClassType IN ('BUILDINGCLASS_LIBRARY', 'BUILDINGCLASS_OBSERVATORY');

-- and faith of the masses

UPDATE Beliefs SET HappinessPerFollowingCity = 0 WHERE Type = 'BELIEF_UNDERGROUND_SECT';

INSERT INTO Belief_YieldPerLux
	(BeliefType, YieldType, Yield)
SELECT
	'BELIEF_UNDERGROUND_SECT', Type, 2
FROM Yields WHERE Type IN ('YIELD_FOOD', 'YIELD_PRODUCTION', 'YIELD_CULTURE');

UPDATE Belief_BuildingClassYieldChanges SET YieldType = 'YIELD_FAITH' WHERE BeliefType = 'BELIEF_UNDERGROUND_SECT';

UPDATE Language_en_US SET
Text = Replace(Text, ' Holy City owner gains +1 [ICON_HAPPINESS_1] Happiness for every two Cities following this Religion.', ' +2 [ICON_FOOD] Food, [ICON_PRODUCTION] Production, and [ICON_CULTURE] Culture in your Holy City for every unique Luxury Resource owned or imported.')
WHERE Tag = 'TXT_KEY_BELIEF_UNDERGROUND_SECT';

UPDATE Language_en_US SET
Text = Replace(Text, '. These buildings produce +2 [ICON_CULTURE] Culture each', ', and each building gains +2 [ICON_PEACE] Faith')
WHERE Tag = 'TXT_KEY_BELIEF_UNDERGROUND_SECT';

------------------------------
-- Text
------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES	('TXT_KEY_BUILDING_ARCHIVE',  'Archive'),
		('TXT_KEY_BUILDING_ARCHIVE_TEXT',   'Archives were well developed by the ancient Chinese, the ancient Greeks, and the ancient Romans (who called them Tabularia). The Greek term originally referred to the home or dwelling of the Archon, a ruler or chief magistrate, in which important official state documents were filed and interpreted; from there its meaning broadened to encompass such concepts as ''town hall'' and ''public records''. Indeed, the idea that a society would designate a place to preserve records is integral to the Justinian Code. Archival records are normally unpublished and almost always unique, unlike books or magazines, of which many identical copies may exist. This means that archives are quite distinct from libraries with regard to their functions and organization.[NEWLINE][NEWLINE]While there are many kinds of archives, the most recent census of archivists in the United States identifies five major types: academic, business (for profit), government, non-profit, and others, such as those run by museums or private individuals. Whilst clay tablets dating back to the third and second millenia BC have been found in Levantine archaeological sites, modern archival science is considered to date to the French Revolution. The French National Archives, which possess perhaps the largest archival collection in the world (with records going as far back as 625 A.D.), was created in 1790 during the Revolution from various government, religious, and private archives seized by the revolutionaries.'),
		('TXT_KEY_BUILDING_ARCHIVE_STRATEGY',	'A niche building with some minor yield increases that is required to unlock Theming bonuses for your Great Works of Writing. It also amplifies the Palace Historic Events: gaining Great People, starting a new Era, entering a Golden Age, and winning a War. This is an additive bonus equal to 50% of the base Palace output. If any of these are your main source of Tourism, and especially if you think you will pursue a Cultural Victory, constructing many Archives across your Empire becomes crucial.'),
		('TXT_KEY_BUILDING_ARCHIVE_HELP',    'Strengthens [ICON_TOURISM] Tourism of [COLOR_POSITIVE_TEXT]Historic Events[ENDCOLOR] generated by the Palace. Nearby Oases yield +2 [ICON_GOLD] Gold.[NEWLINE][NEWLINE]+2 [ICON_CULTURE] Culture and +1 [ICON_RESEARCH] Science if [COLOR_POSITIVE_TEXT]Themed[ENDCOLOR].');


