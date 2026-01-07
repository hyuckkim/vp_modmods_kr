--==================================================
--New Building
--==================================================
INSERT INTO BuildingClasses 	
			(Type,							DefaultBuilding,		Description)
VALUES		('BUILDINGCLASS_NIGHTCLUB',	'BUILDING_NIGHTCLUB',	'TXT_KEY_BUILDING_NIGHTCLUB');

INSERT INTO	Buildings
		(Type,	Description,	Civilopedia,	Strategy,	
		Help,		GoldMaintenance, Cost, HurryCostModifier, 	MinAreaSize, 	ConquestProb, 	BuildingClass, 			
		ArtDefineTag, 	PrereqTech, 	PortraitIndex, 	IconAtlas)
VALUES	
	('BUILDING_NIGHTCLUB',	'TXT_KEY_BUILDING_NIGHTCLUB', 	'TXT_KEY_BUILDING_NIGHTCLUB_TEXT',	'TXT_KEY_BUILDING_NIGHTCLUB_STRATEGY',	'TXT_KEY_BUILDING_NIGHTCLUB_HELP',	10, 		2500, -20, 		-1, 	80, 		'BUILDINGCLASS_NIGHTCLUB', 
	'ART_DEF_BUILDING_MARKET', 	'TECH_TELECOM', 	29,				'CORP2_ATLAS');

UPDATE Buildings
SET
	NoUnhappfromXSpecialists = 1
WHERE BuildingClass = 'BUILDINGCLASS_NIGHTCLUB';

-- space the info buildings out a bit
UPDATE Buildings SET PrereqTech = 'TECH_SATELLITES' WHERE BuildingClass = 'BUILDINGCLASS_INTERPRETIVE_CENTER';

-- flavor
INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_NIGHTCLUB', 'YIELD_CULTURE', 3),
	('BUILDING_NIGHTCLUB', 'YIELD_GOLD', 3);

INSERT INTO Building_GrowthExtraYield
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_NIGHTCLUB', 'YIELD_TOURISM', 200);

INSERT INTO Building_InstantYield
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_NIGHTCLUB', 'YIELD_TOURISM', 750);

INSERT INTO	 Building_Flavors
		(BuildingType,			FlavorType,	Flavor)
VALUES
	('BUILDING_NIGHTCLUB',	'FLAVOR_CULTURE', 80);

INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 				BuildingClassType)
VALUES	('BUILDING_NIGHTCLUB',	'BUILDINGCLASS_STADIUM');
------------------------------
-- Text
------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES	('TXT_KEY_BUILDING_NIGHTCLUB',			'Nightclub'),
		('TXT_KEY_BUILDING_NIGHTCLUB_TEXT',		'Nightclubs often have a bar and discoth que (usually simply known as disco) with a dance floor, laser lighting displays, and a stage for live music or a disc jockey (DJ) who mixes recorded music. Nightclubs generally restrict access to people in terms of age, attire, personal belongings, and inappropriate behaviors. The first nightclubs appeared in New York City in the 1840s and 1850s, including McGlory''s, and the Haymarket. They enjoyed a national reputation for vaudeville, live music, and dance. They tolerated unlicensed liquor, commercial sex, and gambling cards, chiefly Faro. Practically all gambling was illegal in the city (except upscale horseracing tracks), and regular payoffs to political and police leadership was necessary. Prices were high and they were patronized by an upscale audience.[NEWLINE][NEWLINE]The Nightclub was democratized in the 1920s, when the advent of the jukebox fueled the Prohibition-era boom in underground illegal speakeasy bars, which needed music but could not afford a live band and needed precious space for paying customers. In Germany, the first discoth que on record that involved a disc jockey was Scotch-Club, which opened in 1959. Its (therefore the world''s) first DJ was 19-year-old local cub reporter Klaus Quirini who had been sent to write a story about the strange new phenomenon of public record-playing; fueled by whisky, he jumped on stage and started announcing records as he played them and took the stage-name DJ Heinrich. Since then, the combinations of music and dance have evolved with the times, and today the nightclub scene is a diverse and popular as it ever has been.'),
		('TXT_KEY_BUILDING_NIGHTCLUB_STRATEGY',	'One of the final Buildings in the game, the Nightclub allows you to massively increase the Tourism output of a City, provided you can keep it constantly growing. Use all the Food-increasing tools at your disposal to make your main Tourist destinations the hippest places to be! The Nightclub also reduces Unhappiness slightly but be warned, growing a giant City might lead to problems...'),
		('TXT_KEY_BUILDING_NIGHTCLUB_HELP',		'');

-- +750 [ICON_TOURISM] Tourism when completed. Gain 200% of the [ICON_TOURISM] Tourism output of the City as an instant boost when a [ICON_CITIZEN] Citizen is born in this City.[NEWLINE][NEWLINE]1 Specialist in this City no longer produces [ICON_HAPPINESS_3] Unhappiness from [ICON_URBANIZATION] Urbanization.


