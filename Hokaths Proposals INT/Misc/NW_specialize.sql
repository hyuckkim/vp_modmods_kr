-----------------------------------------------------------------------------------------
-- add new coastal NW for engineers
----------------------------------------------------------------------------------------
INSERT INTO Language_ko_KR 
	(Tag, Text)
VALUES	
	('TXT_KEY_BUILDING_MASTER_SHIPWRIGHT',  'Master Shipwright'),
	('TXT_KEY_BUILDING_MASTER_SHIPWRIGHT_TEXT',   'A master shipwright was the highest-ranking carpenter responsible for building and repairing ships, a role that has evolved over time from a position of command in historic dockyards to a modern role in contemporary shipbuilding projects. Until recently, with the development of complex non-maritime technologies, a ship has often represented the most advanced structure that the society building it could produce. Owing to the critical importance of a strong navy to imperial power, over much of history the most skilled shipwrights were under the employ of the state.'),
	('TXT_KEY_BUILDING_MASTER_SHIPWRIGHT_STRATEGY',	'The Master Shipwright is a good long term investment for a Coastal City that will be producing the rump of your naval forces. It however has a dual role, boosting the value of Engineers in the City by providing additional Great Person Points (including 1 flat point per turn), meaning whichever City you put this in will be encouraged to focus on Engineers, possibly at the expense of other Specialists, so pick carefully.'),
	('TXT_KEY_BUILDING_MASTER_SHIPWRIGHT_HELP',    'Fishing Boats worked by this City yield +1 [ICON_PRODUCTION] Production. +25% [ICON_VP_ENGINEER] Engineer rate in this City. +15% [ICON_PRODUCTION] to all Naval Units trained in this City.[NEWLINE][NEWLINE]The [ICON_PRODUCTION] Production Cost and [ICON_CITIZEN] Population Requirements increase based on the number of Cities you own.');

----------------------------------------------------------------------------------------
-- take GEMS off national epic
-----------------------------------------------------------------------------------------
UPDATE Language_ko_KR SET
Text = Replace(Text, '+25% [ICON_GREAT_PEOPLE] Great People generation in this City.', '+25% [ICON_VP_WRITER] Writer, [ICON_VP_ARTIST] Artist, and [ICON_VP_MUSICIAN] Musician rate in this City.')
WHERE Tag = 'TXT_KEY_BUILDING_NATIONAL_EPIC_HELP';

-----------------------------------------------------------------------------------------
-- Change Circus Maximus to have Merchant effects, move Culture to Grand Temple
-----------------------------------------------------------------------------------------
UPDATE Language_ko_KR SET
Text = '+25% [ICON_VP_MERCHANT] Merchant rate in the City. ' || Text
WHERE Tag IN (SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_CIRCUS_MAXIMUS');

DELETE FROM Building_WLTKDYieldMod WHERE YieldType = 'YIELD_CULTURE' AND BuildingType = 'BUILDING_CIRCUS_MAXIMUS';

UPDATE Language_ko_KR SET
Text = Replace(Text, '+10% [ICON_CULTURE] Culture and [ICON_GOLD] Gold during "We Love the King Day" in the City in which it is built.', '+10% [ICON_GOLD] Gold during [COLOR_POSITIVE_TEXT]"We Love the King Day"[ENDCOLOR] in the City in which it is built.')
WHERE Tag IN (SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_CIRCUS_MAXIMUS');

UPDATE Language_ko_KR SET
Text = '+10% [ICON_CULTURE] Culture during [COLOR_POSITIVE_TEXT]"We Love the King Day"[ENDCOLOR] in the City. ' || Text
WHERE Tag IN (SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_GRAND_TEMPLE');

-----------------------------------------------------------------------------------------
-- add Scientist effects to National College
-----------------------------------------------------------------------------------------
UPDATE Language_ko_KR SET
Text = '+25% [ICON_VP_SCIENTIST] Scientist rate in the City. ' || Text
WHERE Tag IN (SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_NATIONAL_COLLEGE');

-----------------------------------------------------------------------------------------
-- add Civil Servant effects to Scrivener Office
-----------------------------------------------------------------------------------------
UPDATE Language_ko_KR SET
Text = '+25% [ICON_CSD_CIVIL_SERVANT] Civil Servant rate in the City. ' || Text
WHERE Tag IN (SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_COURT_SCRIBE');

-----------------------------------------------------------------------------------------
-- add tile improvement interactions to Oxford and Grand Temple
-----------------------------------------------------------------------------------------
UPDATE Language_ko_KR SET
Text = '+1 [ICON_PEACE] Faith and [ICON_TOURISM] Tourism from Academies worked by the City. ' || Text
WHERE Tag IN (SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_OXFORD_UNIVERSITY');

UPDATE Language_ko_KR SET
Text = '+1 [ICON_CULTURE] Culture and [ICON_GOLDEN_AGE] Golden Age Points from Holy Sites worked by the City. ' || Text
WHERE Tag IN (SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_GRAND_TEMPLE');

/*
-- dont let oxford be built in capital
UPDATE Language_ko_KR SET
Text = Replace(Text, 'Cities you own.', 'Cities you own. [COLOR_NEGATIVE_TEXT]Cannot[ENDCOLOR] be built in the [ICON_CAPITAL] Capital.')
WHERE Tag IN (SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_OXFORD_UNIVERSITY');
*/