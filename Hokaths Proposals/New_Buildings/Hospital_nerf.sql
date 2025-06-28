UPDATE Buildings
SET
	NoUnhappfromXSpecialists = 0,
	PovertyFlatReduction = 0,
	Happiness = 1
WHERE BuildingClass = 'BUILDINGCLASS_HOSPITAL';

UPDATE Language_en_US SET
Text = 'Land Units in this City heal 15 points per turn whether or not they take an action. All Specialists in this City produce +1 [ICON_FOOD] Food. [ICON_VP_SCIENTIST] Scientists, [ICON_VP_MERCHANT] Merchants, and [ICON_VP_ENGINEER] Engineers in the City produce +2 of their base Yield.'
WHERE Tag = 'TXT_KEY_BUILDING_HOSPITAL_HELP';

UPDATE Language_en_US SET
Text = 'The Hospital is an Industrial-era Building boosting Growth and Happiness. Additionally, it increases the value of basic Specialists and makes it much more affordable to work Specialists in general.'
WHERE Tag = 'TXT_KEY_BUILDING_HOSPITAL_STRATEGY';
