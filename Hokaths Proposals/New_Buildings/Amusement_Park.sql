INSERT INTO BuildingClasses 	
			(Type,	DefaultBuilding,		Description)
VALUES		('BUILDINGCLASS_AMUSEMENT_PARK',	'BUILDING_AMUSEMENT_PARK',	'TXT_KEY_BUILDING_AMUSEMENT_PARK');

INSERT INTO Buildings
	(Type,	Description,	Civilopedia,	Strategy,	
	Help,		GoldMaintenance, Cost, HurryCostModifier, 	MinAreaSize, 	ConquestProb, 	BuildingClass, 			
	ArtDefineTag, 	PrereqTech, 	PortraitIndex, 	IconAtlas)
VALUES	
	('BUILDING_AMUSEMENT_PARK',	'TXT_KEY_BUILDING_AMUSEMENT_PARK', 	'TXT_KEY_BUILDING_AMUSEMENT_PARK_TEXT',	'TXT_KEY_BUILDING_AMUSEMENT_PARK_STRATEGY',	'TXT_KEY_BUILDING_AMUSEMENT_PARK_HELP',	11, 		2850, -20, 		-1, 	80, 		'BUILDINGCLASS_AMUSEMENT_PARK', 
	'ART_DEF_BUILDING_MARKET', 	'TECH_ROBOTICS', 	38,				'CORP2_ATLAS');

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_AMUSEMENT_PARK',	'YIELD_CULTURE', 1),
	('BUILDING_AMUSEMENT_PARK',	'YIELD_TOURISM', 10);

INSERT INTO Building_YieldChangesPerPop
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_AMUSEMENT_PARK',	'YIELD_GOLD', 25);

INSERT INTO Building_WLTKDYieldMod
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_AMUSEMENT_PARK',	'YIELD_TOURISM', 10);

INSERT INTO Building_WLTKDFromProject
	(BuildingType, ProjectType, Turns)
VALUES
	('BUILDING_AMUSEMENT_PARK', 'PROJECT_PUBLIC_WORKS', 10);
	
INSERT INTO Building_Flavors
	(BuildingType,		FlavorType,	Flavor)
VALUES
	('BUILDING_AMUSEMENT_PARK',	'FLAVOR_CULTURE', 60),	
	('BUILDING_AMUSEMENT_PARK',	'FLAVOR_GOLD', 20),	
	('BUILDING_AMUSEMENT_PARK',	'FLAVOR_HAPPINESS', 30);

UPDATE Buildings
SET
	Happiness = 1
WHERE BuildingClass = 'BUILDINGCLASS_AMUSEMENT_PARK';

INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 				BuildingClassType)
VALUES	('BUILDING_AMUSEMENT_PARK',	'BUILDINGCLASS_PUBLIC_TRANSPORT');

------------------------------
-- Text
------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES	('TXT_KEY_BUILDING_AMUSEMENT_PARK', 'Amusement Park'),
		('TXT_KEY_BUILDING_AMUSEMENT_PARK_TEXT', 'An amusement park is a park that features various attractions, such as rides and games, and events for entertainment purposes. They evolved from European fairs, pleasure gardens, and large picnic areas, which were created for people''s recreation. World''s fairs and other types of international expositions also influenced the emergence of the amusement park industry. Today the incorporation of advanced engineering, robotics, and digital technologies have catapulted the global amusement park industry to a value around $60 billion dollars.[NEWLINE][NEWLINE]The first permanent enclosed entertainment area, regulated by a single company, was founded in Brooklyn in 1895: Sea Lion Park at Coney Island. This park was one of the first to charge admission fee to get into the park in addition to sell tickets for rides within the park. Inspired by attractions on railroads, the park contained a gravity switchback railway. Passengers climbed to the top of a platform and rode a bench-like car down the 600-foot (183 m) track up to the top of another tower where the vehicle was switched to a return track and the passengers took the return trip. This track design was soon replaced with an oval complete circuit; the first of the modern roller coaster designs.[NEWLINE][NEWLINE]The oldest roller coasters are believed to have originated from the so-called "Russian Mountains"; specially constructed hills of ice located in the area that is now Saint Petersburg, Russia. In 1845, an amusement park called Tivoli Gardens opened in Copenhagen, and featured a primitive roller coaster as a permanent attraction: a single-person wheeled sled running through a 13-foot (4 m) diameter vertical loop. In the 1880s, the concept of a vertical loop was again explored by Lina Beecher, and in 1895 the concept came into fruition with Flip Flap Railway, at Sea Lion Park. The ride exerted dangerously high G-forces, and many passengers suffered whiplash. It was soon dismantled, and looping coasters would disappear for half a century.[NEWLINE][NEWLINE]In 1959, the Disneyland theme park introduced a new design breakthrough in roller coasters with Matterhorn Bobsleds. This was the first roller coaster to use a tubular steel track. Unlike conventional wooden rails, which are generally formed using steel strips mounted on laminated wood, tubular steel can be bent in any direction, which allows designers to incorporate loops, corkscrews, and many other maneuvers into their designs. In 1975, the first modern-day roller coaster with an inverting element opened: Corkscrew, located at Knott''s Berry Farm in Buena Park, California. In 1976, the vertical loop made a comeback with Great American Revolution at Six Flags Magic Mountain in Valencia, California.'),
		('TXT_KEY_BUILDING_AMUSEMENT_PARK_STRATEGY',	'The Amusement Park is somewhat of a luxury, requiring the expensive and resource-consuming Mass Transit to be built before you can even think about constructing it. It has two main uses, the first is to boost Tourism output to close out the game with a Cultural Victory. The second is to allow your City to enter WLTKD without needing a particular resource. This can be very useful if you find yourself unable to acquire a particular luxury in the end game, perhaps because you have been making enemies?'),
		('TXT_KEY_BUILDING_AMUSEMENT_PARK_HELP', '');

-- +1 [ICON_GOLD] Gold for every 4 [ICON_CITIZEN] Citizens in the City. The City produces +10% [ICON_TOURISM] Tourism during [COLOR_POSITIVE_TEXT]"We Love the King Day"[ENDCOLOR]. Completing a Public Works in the City begins 10 Turns of [COLOR_POSITIVE_TEXT]"We Love the King Day"[ENDCOLOR].
