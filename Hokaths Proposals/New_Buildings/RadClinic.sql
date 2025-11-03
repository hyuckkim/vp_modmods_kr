INSERT INTO BuildingClasses 	
	(Type,		DefaultBuilding,		Description)
VALUES		
	('BUILDINGCLASS_RAD_CLINIC',	'BUILDING_RAD_CLINIC',	 'TXT_KEY_BUILDING_RAD_CLINIC');

INSERT INTO  Buildings
		(Type,		Description,		Civilopedia,			Strategy,	Help,		
		GoldMaintenance, 	Cost, HurryCostModifier, 	MinAreaSize, 	ConquestProb, 	
		BuildingClass, 		ArtDefineTag, 		PrereqTech, 	PortraitIndex, 	IconAtlas)
VALUES	
	('BUILDING_RAD_CLINIC',	'TXT_KEY_BUILDING_RAD_CLINIC', 	'TXT_KEY_BUILDING_RAD_CLINIC_TEXT',	'TXT_KEY_BUILDING_RAD_CLINIC_STRATEGY',	'TXT_KEY_BUILDING_RAD_CLINIC_HELP',	
		11, 				2850, -20, 					-1, 			80, 			
		'BUILDINGCLASS_RAD_CLINIC', 	'ART_DEF_BUILDING_MARKET', 	'TECH_LASERS', 	39,				'CORP2_ATLAS');

UPDATE Buildings SET
	FoodKept = 10,
	NoUnhappfromXSpecialists = 99,
	SpecialistType = 'SPECIALIST_CIVIL_SERVANT',
	GreatPeopleRateChange = 3
WHERE BuildingClass = 'BUILDINGCLASS_RAD_CLINIC';

INSERT INTO Building_SpecificGreatPersonRateModifier
	(BuildingType, SpecialistType, Modifier)
SELECT
	Type, SpecialistType, 67
FROM Buildings WHERE Type IN ('BUILDING_RAD_CLINIC');

INSERT INTO Building_YieldFromGPBirthScaledWithPerTurnYield
	(BuildingType, GreatPersonType, YieldIn, YieldOut, Value)
SELECT
	'BUILDING_RAD_CLINIC', Type, 'YIELD_SCIENCE', 'YIELD_FOOD', 20
FROM GreatPersons;

INSERT INTO Building_YieldPerFriend
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_RAD_CLINIC', 'YIELD_TOURISM', 2);

INSERT INTO Building_YieldPerAlly
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_RAD_CLINIC', 'YIELD_TOURISM', 2),
	('BUILDING_RAD_CLINIC', 'YIELD_GOLD', 4);

INSERT INTO Building_ResourceQuantityRequirements
	(BuildingType, ResourceType, Cost)
VALUES
	('BUILDING_RAD_CLINIC', 'RESOURCE_URANIUM', 1);

INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 				BuildingClassType)
VALUES	('BUILDING_RAD_CLINIC',	'BUILDINGCLASS_MEDICAL_LAB');

INSERT INTO Building_Flavors 
	(BuildingType, FlavorType, Flavor)
VALUES
	('BUILDING_RAD_CLINIC', 'FLAVOR_GROWTH', 100);

------------------------------
-- Text
------------------------------
INSERT INTO Language_en_US (Tag, Text)
VALUES	('TXT_KEY_BUILDING_RAD_CLINIC',			'Radiation Clinic'),
		('TXT_KEY_BUILDING_RAD_CLINIC_TEXT',		'Ionising radiation is used in medicine in 3 ways: diagnostic radiology, which uses x-ray machines to obtain images of the inside of the patient''s body; nuclear medicine, which uses radioactive substances introduced into the patient for diagnosis or treatment; and radiotherapy, which uses many types and sources of ionising radiation to cure or relieve symptoms of cancer and other diseases. High doses can be harmful, but medical radiation is carefully regulated to ensure patient safety. Healthy cells can be damaged, but they are often able to repair themselves more easily than cancer cells.[NEWLINE][NEWLINE]Lasers are also used medically to perform precision cuts in surgery including to the cornea of the eye, and for aesthetic procedures like hair and tatoo removal, vein reduction, and even the ablation of acne. Again, medical-grade lasers are extremely dangerous, and treatments are carried out by medically trained staff, such as registered nurses and doctors, in a clinical environment.'),
		('TXT_KEY_BUILDING_RAD_CLINIC_STRATEGY',	'The Radiation Clinic is the final growth building, requiring the important Uranium resource. It cuts the exponential growth penalty by another 10%, and provides Food whenever Great People are born, which can become extremely strong if you have enough Science. With such technology, your population will explode, and all the world''s City-States will want in on it, giving you a Tourism boost that can help secure a Cultural Victory, and more Great Diplomat points to sway those not already aligned to your cause. Of course, very large Cities can become very unhappy, but with the Radiation Clinic all your Specialists will be free from Urbanization, so don''t worry! At least, until your population becomes really big...'),
		('TXT_KEY_BUILDING_RAD_CLINIC_HELP',		'When a [ICON_GREAT_PEOPLE] Great Person is born in the City, receive an instant boost of [ICON_FOOD] Food equal to 20% of the [ICON_RESEARCH] Science output of your Empire. +67% [ICON_DIPLOMAT] Great Diplomat Rate. 10% of [ICON_FOOD] Food is carried over when a [ICON_CITIZEN] Citizen is born in this City.[NEWLINE][NEWLINE][ICON_CITY_STATE]City-State [COLOR_POSITIVE_TEXT]Friend[ENDCOLOR] Bonus: +2 [ICON_TOURISM] Tourism each.[NEWLINE][ICON_CITY_STATE]City-State [COLOR_CYAN]Ally[ENDCOLOR] Bonus: +4 [ICON_GOLD] Gold and +2 [ICON_TOURISM] Tourism each.[NEWLINE][NEWLINE]The City no longer produces [ICON_HAPPINESS_3] Unhappiness from [ICON_URBANIZATION] Urbanization.[NEWLINE][NEWLINE]Requires 1 [ICON_RES_URANIUM] Uranium.');


