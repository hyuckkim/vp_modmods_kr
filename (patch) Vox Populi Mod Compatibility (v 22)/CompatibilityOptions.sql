/*
_______________Vox Populi Mod Compatibility! ________________

Thank you for downloading the Vox Populi Mod Compatibility!

_______________OPTIONS FOR VPMC____________________

All options below are preset to the default values of this mod.

-- OPTIONS --
-- If you have not read the instructions above, please do so now!
-- Disabling files below will only require you to set the value to 0.
-- Almost all values are automatically set to 2 and if it detects a desired mod, it will be enabled to 1.
*/

/*
Brazilwood Camp Tweaks!
0 = Disabled disregarding if its detects the Brazilwood Camp by BlouBlou.
1 = Enabled if it detects the Brazilwood Camp by BlouBlou and CBP.
2 = Disabled until it detects something! (Default)
*/

INSERT INTO COMMUNITY (Type, Value)
VALUES ('CBPMC_BRAZILWOOD_CAMP', 2);

UPDATE COMMUNITY
SET Value = '1'
WHERE Type = 'CBPMC_BRAZILWOOD_CAMP' AND EXISTS (SELECT * FROM Buildings WHERE Type='BUILDING_JCHURCH') AND NOT EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_BRAZILWOOD_CAMP' AND Value= 0);

/*
Chateau
0 = Disabled (Default)
1 = Enabled
*/

INSERT INTO COMMUNITY (Type, Value)
VALUES ('CBPMC_CHATEAU', 0);

/*
Terrace Farm!
0 = Disabled disregarding if its detects the Terrace Farm by BlouBlou.
1 = Enabled if it detects the Terrace Farm by BlouBlou and CBP.
2 = Disabled until it detects something! (Default)
*/

INSERT INTO COMMUNITY (Type, Value)
VALUES ('CBPMC_TERRACE_FARM', 2);

UPDATE COMMUNITY
SET Value = '1'
WHERE Type = 'CBPMC_TERRACE_FARM' AND EXISTS (SELECT * FROM Buildings WHERE Type='BUILDING_STEMPLES') AND NOT EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_TERRACE_FARM' AND Value= 0);

/*
Industrial Buildings!
0 = Disabled disregarding if its detects the Industrial Buildings by thecrazyscotsman.
1 = Enabled if it detects the Industrial Buildings by thecrazyscotsman and CBP.
2 = Disabled until it detects something! (Default)
*/

INSERT INTO COMMUNITY (Type, Value)
VALUES ('CBPMC_INDUSTRIAL', 2);

UPDATE COMMUNITY
SET Value = '1'
WHERE Type = 'CBPMC_INDUSTRIAL' AND EXISTS (SELECT * FROM Buildings WHERE Type='BUILDING_CHEMIST') AND NOT EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_INDUSTRIAL' AND Value= 0);

/*
Kasbah!
0 = Disabled disregarding if its detects the Kasbah by BlouBlou.
1 = Enabled if it detects the Kasbah by BlouBlou and CBP.
2 = Disabled until it detects something! (Default)
*/

INSERT INTO COMMUNITY (Type, Value)
VALUES ('CBPMC_KASBAH', 2);

UPDATE COMMUNITY
SET Value = '1'
WHERE Type = 'CBPMC_KASBAH' AND EXISTS (SELECT * FROM Buildings WHERE Type='BUILDING_RIAD') AND NOT EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_KASBAH' AND Value= 0);

/*
Medieval and Renaissance Buildings!
0 = Disabled disregarding if its detects the Medieval and Renaissance Buildings Pack by thecrazyscotsman.
1 = Enabled if it detects the Medieval and Renaissance Buildings Pack by thecrazyscotsman and CBP.
2 = Disabled until it detects something! (Default)
*/

INSERT INTO COMMUNITY (Type, Value)
VALUES ('CBPMC_MEDIRENA', 2);

UPDATE COMMUNITY
SET Value = '1'
WHERE Type = 'CBPMC_MEDIRENA' AND EXISTS (SELECT * FROM Buildings WHERE Type='BUILDING_PRINTER') AND NOT EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_MEDIRENA' AND Value= 0);

/*
Moai!
0 = Disabled disregarding if its detects the Moais by BlouBlou.
1 = Enabled if it detects the Moais by BlouBlou and CBP.
2 = Disabled until it detects something! (Default)
*/

INSERT INTO COMMUNITY (Type, Value)
VALUES ('CBPMC_MOAI', 2);

UPDATE COMMUNITY
SET Value = '1'
WHERE Type = 'CBPMC_MOAI' AND EXISTS (SELECT * FROM Buildings WHERE Type='BUILDING_MARA') AND NOT EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_MOAI' AND Value= 0);

/*
Motte!
0 = Disabled disregarding if its detects the Motte by BlouBlou.
1 = Enabled if it detects the Motte by BlouBlou and CBP.
2 = Disabled until it detects something! (Default)
*/

INSERT INTO COMMUNITY (Type, Value)
VALUES ('CBPMC_MOTTE', 2);

UPDATE COMMUNITY
SET Value = '1'
WHERE Type = 'CBPMC_MOTTE' AND EXISTS (SELECT * FROM Improvements WHERE Type='IMPROVEMENT_MAB') AND NOT EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_MOTTE' AND Value= 0);

/*
National Wonders!
0 = Disabled disregarding if its detects the National Wonders Collection by theframedarchitecture.
1 = Enabled if it detects the National Wonders Collection by theframedarchitecture and CBP.
2 = Disabled until it detects something! (Default)
*/

INSERT INTO COMMUNITY (Type, Value)
VALUES ('CBPMC_NATIONAL', 2);

UPDATE COMMUNITY
SET Value = '1'
WHERE Type = 'CBPMC_NATIONAL' AND EXISTS (SELECT * FROM Buildings WHERE Type='BUILDING_FA_ELECTRIC_CO') AND NOT EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_NATIONAL' AND Value= 0);

/*
Neolithic Wonders!
0 = Disabled disregarding if its detects the Neolithic Wonders.
1 = Enabled if it detects the Neolithic Wonders and CBP.
2 = Disabled until it detects something! (Default)
*/

INSERT INTO COMMUNITY (Type, Value)
VALUES ('CBPMC_NEOLITHIC', 2);

UPDATE COMMUNITY
SET Value = '1'
WHERE Type = 'CBPMC_NEOLITHIC' AND EXISTS (SELECT * FROM Buildings WHERE Type='BUILDING_BARNENEZ') AND NOT EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_NEOLITHIC' AND Value= 0);

/*
Polders!
0 = Disabled disregarding if its detects the Polders by BlouBlou.
1 = Enabled if it detects the Polders by BlouBlou and CBP.
2 = Disabled until it detects something! (Default)
*/

INSERT INTO COMMUNITY (Type, Value)
VALUES ('CBPMC_POLDER', 2);

UPDATE COMMUNITY
SET Value = '1'
WHERE Type = 'CBPMC_POLDER' AND EXISTS (SELECT * FROM Buildings WHERE Type='BUILDING_WIMMEN') AND NOT EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_POLDER' AND Value= 0);

/*
Strategic Buildings!
0 = Disabled disregarding if its detects the Strategic Buildings by thecrazyscotsman.
1 = Enabled if it detects the Strategic Buildings by thecrazyscotsman and CBP.
2 = Disabled until it detects something! (Default)
*/

INSERT INTO COMMUNITY (Type, Value)
VALUES ('CBPMC_STRATEGIC', 2);

UPDATE COMMUNITY
SET Value = '1'
WHERE Type = 'CBPMC_STRATEGIC' AND EXISTS (SELECT * FROM Buildings WHERE Type='BUILDING_SCHOOL_OF_EQUESTRIAN_ART') AND NOT EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_STRATEGIC' AND Value= 0);

/*
Additional Industrial Buildings!
0 = Disabled disregarding if its detects the Additional Industrial Buildings by lordplane.
1 = Enabled if it detects the Additional Industrial Buildings by lordplane and CBP.
2 = Disabled until it detects something! (Default)
*/

INSERT INTO COMMUNITY (Type, Value)
VALUES ('CBPMC_MOREINDUSTRIAL', 2);

UPDATE COMMUNITY
SET Value = '1'
WHERE Type = 'CBPMC_MOREINDUSTRIAL' AND EXISTS (SELECT * FROM Buildings WHERE Type='BUILDING_OIL_REFINERY') AND NOT EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_MOREINDUSTRIAL' AND Value= 0);

/*
Better City Defenses!
0 = Disabled disregarding if its detects the Better City Defenses by Tofusojo.
1 = Enabled if it detects the Better City Defenses by Tofusojo and CBP.
2 = Disabled until it detects something! (Default)
*/

INSERT INTO COMMUNITY (Type, Value)
VALUES ('CBPMC_DEFENSES', 2);

UPDATE COMMUNITY
SET Value = '1'
WHERE Type = 'CBPMC_DEFENSES' AND EXISTS (SELECT * FROM Buildings WHERE Type='BUILDING_PALISADES') AND NOT EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_DEFENSES' AND Value= 0);

/*
Strategic Resource Buildings!
0 = Disabled disregarding if its detects the Strategic Resource Buildings by Kelaris.
1 = Enabled if it detects the Strategic Resource Buildings by Kelaris and CBP.
2 = Disabled until it detects something! (Default)
*/

INSERT INTO COMMUNITY (Type, Value)
VALUES ('CBPMC_RESBUILDING', 2);

UPDATE COMMUNITY
SET Value = '1'
WHERE Type = 'CBPMC_RESBUILDING' AND EXISTS (SELECT * FROM Buildings WHERE Type='BUILDING_CORRAL') AND NOT EXISTS (SELECT * FROM COMMUNITY WHERE Type='CBPMC_RESBUILDING' AND Value= 0);
