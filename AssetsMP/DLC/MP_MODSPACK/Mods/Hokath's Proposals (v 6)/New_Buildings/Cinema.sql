INSERT INTO BuildingClasses 	
			(Type,							DefaultBuilding,		Description)
VALUES		('BUILDINGCLASS_MOVIE_THEATRE',	'BUILDING_MOVIE_THEATRE',	'TXT_KEY_BUILDING_MOVIE_THEATRE');

INSERT INTO	 Buildings
	(Type,						Description,						Civilopedia,							Strategy,					Help,									GoldMaintenance, 	Cost, HurryCostModifier, 	MinAreaSize, 	ConquestProb, 	BuildingClass, 				ArtDefineTag, 				PrereqTech, 			PortraitIndex, 	IconAtlas, Happiness, EnhancedYieldTech)
VALUES	
	('BUILDING_MOVIE_THEATRE',	'TXT_KEY_BUILDING_MOVIE_THEATRE', 	'TXT_KEY_BUILDING_MOVIE_THEATRE_TEXT',	'TXT_KEY_BUILDING_MOVIE_THEATRE_STRATEGY',	'TXT_KEY_BUILDING_MOVIE_THEATRE_HELP',	7, 				1800, -20, 					-1, 			80, 			'BUILDINGCLASS_MOVIE_THEATRE', 	'ART_DEF_BUILDING_MARKET', 	'TECH_ELECTRICITY', 	20,				'CORP2_ATLAS', 1, 'TECH_COMPUTERS');

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_MOVIE_THEATRE', 'YIELD_CULTURE', 2);

INSERT INTO Building_ImprovementYieldChanges
	(BuildingType, ImprovementType, YieldType, Yield)
VALUES
	('BUILDING_MOVIE_THEATRE', 'IMPROVEMENT_TRADING_POST', 'YIELD_SCIENCE', 2),
	('BUILDING_MOVIE_THEATRE', 'IMPROVEMENT_CUSTOMS_HOUSE', 'YIELD_SCIENCE', 2);

-- Building_TerrainYieldChanges
INSERT INTO Building_TerrainYieldChanges
	(BuildingType, TerrainType, YieldType, Yield)
VALUES
	('BUILDING_MOVIE_THEATRE', 'TERRAIN_DESERT', 'YIELD_TOURISM', 1),
	('BUILDING_MOVIE_THEATRE', 'TERRAIN_DESERT', 'YIELD_GOLD', 1);

INSERT INTO Building_SpecialistYieldChangesLocal
	(BuildingType, SpecialistType, YieldType, Yield)
VALUES
	('BUILDING_MOVIE_THEATRE', 'SPECIALIST_WRITER', 'YIELD_GOLD', 2),
	('BUILDING_MOVIE_THEATRE', 'SPECIALIST_WRITER', 'YIELD_SCIENCE', 2),
	('BUILDING_MOVIE_THEATRE', 'SPECIALIST_WRITER', 'YIELD_CULTURE', 2),
	('BUILDING_MOVIE_THEATRE', 'SPECIALIST_ARTIST', 'YIELD_GOLD', 2),
	('BUILDING_MOVIE_THEATRE', 'SPECIALIST_ARTIST', 'YIELD_SCIENCE', 2),
	('BUILDING_MOVIE_THEATRE', 'SPECIALIST_ARTIST', 'YIELD_CULTURE', 2),
	('BUILDING_MOVIE_THEATRE', 'SPECIALIST_MUSICIAN', 'YIELD_GOLD', 2),
	('BUILDING_MOVIE_THEATRE', 'SPECIALIST_MUSICIAN', 'YIELD_SCIENCE', 2),
	('BUILDING_MOVIE_THEATRE', 'SPECIALIST_MUSICIAN', 'YIELD_CULTURE', 2);

-- works with buildings column
INSERT INTO Building_TechEnhancedYieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_MOVIE_THEATRE', 'YIELD_CULTURE', 2),
	('BUILDING_MOVIE_THEATRE', 'YIELD_SCIENCE', 4);

INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 			BuildingClassType)
VALUES
	('BUILDING_MOVIE_THEATRE', 'BUILDINGCLASS_GALLERY');

INSERT INTO Building_Flavors 
	(BuildingType, FlavorType, Flavor)
VALUES
	('BUILDING_MOVIE_THEATRE', 'FLAVOR_GOLD', 5),
	('BUILDING_MOVIE_THEATRE', 'FLAVOR_SCIENCE', 5),
	('BUILDING_MOVIE_THEATRE', 'FLAVOR_CULTURE', 10);

------------------------------
-- Text
------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES	('TXT_KEY_BUILDING_MOVIE_THEATRE',			'Cinema'),
		('TXT_KEY_BUILDING_MOVIE_THEATRE_TEXT',		'A cinema is a business that contains auditoriums for viewing films for public entertainment. Most are commercial operations catering to the general public, who attend by purchasing tickets. The earliest public film screenings around the turn of the 20th centurn took place in existing (vaudeville) theatres and other venues that could be darkened and comfortably house an audience, taking over from earlier forms of entertainment like magic lantern and peep shows.[NEWLINE][NEWLINE]The making and showing of motion pictures became a source of profit almost as soon as the process was invented. By 1917 Charlie Chaplin had a contract that called for an annual salary of one million dollars. Since then, the movie industry has become one of the most influential on the planet; it was worth $136 billion in 2018. Parallel to entertainment, newsreel (and later television) revolutionized access to information, education, and propaganda.[NEWLINE][NEWLINE]Since the 2010s, the majority of movie theaters have been equipped for digital cinema projection, removing the need to create and transport a physical film print on a heavy reel. The entire process can be digitized from principle photography to distribution, massively expanding access to both film making and viewing.'),
		('TXT_KEY_BUILDING_MOVIE_THEATRE_STRATEGY',	'The Cinema branches off the Cultural line, boosting the output of Cultural Specialists, making it a must-have in your Guild Cities. It also provides benefits to Desert terrain and Towns and Villages, as well as Happiness, making it a strong option is other Cities too. Finally, like some other Buildings, it gains additional output after the Computers technology is researched, making that a lucrative target if you''ve already committed to constructing Cinemas.'),
		('TXT_KEY_BUILDING_MOVIE_THEATRE_HELP',		'+2 [ICON_GOLD] Gold, [ICON_RESEARCH] Science, and [ICON_CULTURE] Culture from [ICON_VP_WRITER] Writers, [ICON_VP_ARTIST] Artists, and [ICON_VP_MUSICIAN] Musician Specialists in this City. +1 [ICON_GOLD] Gold and [ICON_TOURISM] Tourism from Desert tiles worked by this City. +4 [ICON_RESEARCH] Science and +2 [ICON_CULTURE] Culture once [COLOR_CYAN]Computers[ENDCOLOR] is discovered.[NEWLINE][NEWLINE]Nearby Villages and Towns: +2 [ICON_RESEARCH] Science.');

