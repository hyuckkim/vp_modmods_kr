INSERT INTO BuildingClasses 	
			(Type,	DefaultBuilding,		Description)
VALUES		('BUILDINGCLASS_NOISE_BARRIERS',	'BUILDING_NOISE_BARRIERS',	'TXT_KEY_BUILDING_NOISE_BARRIERS');

INSERT INTO Buildings
	(Type,	Description,	Civilopedia,	Strategy,	
	Help,		GoldMaintenance, Cost, HurryCostModifier, 	MinAreaSize, 	ConquestProb, 	BuildingClass, 			
	ArtDefineTag, 	PrereqTech, 	PortraitIndex, 	IconAtlas)
VALUES	
	('BUILDING_NOISE_BARRIERS',	'TXT_KEY_BUILDING_NOISE_BARRIERS', 	'TXT_KEY_BUILDING_NOISE_BARRIERS_TEXT',	'TXT_KEY_BUILDING_NOISE_BARRIERS_STRATEGY',	'TXT_KEY_BUILDING_NOISE_BARRIERS_HELP',	11, 		2850, -20, 		-1, 	80, 		'BUILDINGCLASS_NOISE_BARRIERS', 
	'ART_DEF_BUILDING_MARKET', 	'TECH_STEALTH', 	40,				'CORP2_ATLAS');

INSERT INTO Building_YieldFromProcessModifier
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_NOISE_BARRIERS', 'YIELD_CULTURE', 20);

INSERT INTO Building_YieldChangesPerLocalTheme
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_NOISE_BARRIERS', 'YIELD_GOLD', 3),
	('BUILDING_NOISE_BARRIERS', 'YIELD_TOURISM', 3);

INSERT INTO Building_YieldChangeWorldWonder
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_NOISE_BARRIERS', 'YIELD_GOLD', 3),
	('BUILDING_NOISE_BARRIERS', 'YIELD_TOURISM', 3);

INSERT INTO Building_Flavors
	(BuildingType,		FlavorType,	Flavor)
VALUES
	('BUILDING_NOISE_BARRIERS',	'FLAVOR_CULTURE', 80),
	('BUILDING_NOISE_BARRIERS',	'FLAVOR_I_TRADE_ORIGIN', 40);

UPDATE Buildings
SET
	RequiresIndustrialCityConnection = 1,
	TRTurnModLocal = -50,
	SpecialistType = 'SPECIALIST_CIVIL_SERVANT',
	SpecialistCount = 1
WHERE BuildingClass = 'BUILDINGCLASS_NOISE_BARRIERS';

INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 				BuildingClassType)
VALUES	('BUILDING_NOISE_BARRIERS',	'BUILDINGCLASS_POLICE_STATION');

------------------------------
-- Text
------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES	('TXT_KEY_BUILDING_NOISE_BARRIERS', 'Noise Barriers'),
		('TXT_KEY_BUILDING_NOISE_BARRIERS_TEXT', 'A noise barrier (also called a soundwall, sound barrier, or acoustical barrier) is an exterior structure designed to protect inhabitants of sensitive land use areas from noise pollution. They have been built in the United States since the mid-twentieth century, when vehicular traffic burgeoned. The first was installed in 1968 along a section of I-680 in Milpitas, California. In the late 1960s, analytic acoustical technology emerged to mathematically evaluate the efficacy of a noise barrier design adjacent to a specific roadway. By the 1990s, noise barriers that included use of transparent materials were being designed in Denmark and other western European countries.'),
		('TXT_KEY_BUILDING_NOISE_BARRIERS_STRATEGY',	'Noise Barriers will make your highly developed Cities still attractive to Tourists, and therefore represents the most active way of pursuing the Cultural victory! As the building reduces the duration of Trade Routes, you can generate more Historic Events from their completion as you attempt to squeeze the final points of Tourism out of your economy. If instead you are aiming for a Diplomatic Victory, the building gives access to a final Civil Servant slot to help you get to that final Great Diplomat for one last coup!'),
		('TXT_KEY_BUILDING_NOISE_BARRIERS_HELP', 'The [COLOR_YELLOW]Arts[ENDCOLOR] Process is 20% more efficient at converting [ICON_PRODUCTION] Production into [ICON_CULTURE] Culture. +3 [ICON_GOLD] Gold and [ICON_TOURISM] Tourism from every [ICON_GREAT_WORK] Theme and [ICON_WONDER] World Wonder in the City. [ICON_INTERNATIONAL_TRADE] Trade Routes originating in this City have -50% duration. [NEWLINE][NEWLINE]Requires an [ICON_INDUSTRIAL_CONNECTED] Industrial City Connection before it can be constructed.');
