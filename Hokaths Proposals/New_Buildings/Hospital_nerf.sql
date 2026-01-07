UPDATE Buildings
SET
	NoUnhappfromXSpecialists = 0,
	PovertyFlatReduction = 0,
	Happiness = 1
WHERE BuildingClass = 'BUILDINGCLASS_HOSPITAL';

UPDATE Language_en_US SET
Text = 'The Hospital is an Industrial-era Building boosting Growth and Happiness. Additionally, it increases the value of basic Specialists and makes it much more affordable to work Specialists in general.'
WHERE Tag = 'TXT_KEY_BUILDING_HOSPITAL_STRATEGY';
