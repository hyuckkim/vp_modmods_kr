/*
--==================================================================================================================
--==================================================================================================================
--
--  Unit Scaling and Formation
--  By: N.Core
--  Thanks to:
--  - Gedemon, for "R.E.D Modpack" mod. I borrowed its unit rescaling and formation function into this mod.
--  - Nutty, for "Reduced Unit Graphics" and "Single Unit Graphics" mods.
--
--  Some of those mods are already incorporated into this mod in some kind.
--  Thus, those mods are not allowed to be activated alongside this mod since it will cause conflicts.
--
--==================================================================================================================
--==================================================================================================================

What's this mod do exacly?
The title of this mod is self explanatory.
This mod changes unit model scale and formation, so units can look different than vanilla.

This mod is designed to be modmod friendly and easy to edit.
There are new database tables made specifically to interact with this mod.
So in other words, you can use this mod as a unit rescaler for other unit you want to rescale.

==================== USnF OPTIONS ====================
These options are set to the default values for this mod.
If there is something you don't like, just disable it.

 -- OPTIONS --
 -- Read each of the feature description, so you know what that feature does.
 -- By default all options are enabled.
 -- Set the value to available value options that you can choose.
*/


--==================================================================================================================
-- UNIT SCALING AND FORMATION
--==================================================================================================================

/*
========== Land units scaling and formation profile ==========
Description:
    Choose, which scaling profile land units you want to use.

There are:
0 = Disabled
1 = R.E.D. scaling and formation (Default)
2 = Reduced Unit Graphics scaling style
3 = Single Unit Graphics scaling style
*/

INSERT INTO USnF_Config (Type, Value)
VALUES ('USnF_LAND', 3);

/*
========== Sea units scaling and formation profile ==========
Description:
    Choose, which scaling profile for sea units you want to use.

There are:
0 = Disabled
1 = R.E.D. scaling and formation (Default)
2 = Reduced Unit Graphics scaling style
3 = Single Unit Graphics scaling style
*/

INSERT INTO USnF_Config (Type, Value)
VALUES ('USnF_SEA', 3);

/*
========== Air units scaling and formation profile ==========
Description:
    Choose, which scaling profile air units you want to use.

There are:
0 = Disabled
1 = R.E.D. scaling and formation (Default)
2 = Reduced Unit Graphics scaling style
3 = Single Unit Graphics scaling style
4 = Enhanced Air Warfare scaling style
*/

INSERT INTO USnF_Config (Type, Value)
VALUES ('USnF_AIR', 3);

/*
========== Use unit scaling multiplier [EXPERIMENTAL] ==========
Description:
    Use scaling multiplier for adjusting unit scale.
    This multiplier will applied when adjusting the scale value from ArtDefine_USnF table. (Scale * ScaleMultiplier)
    
    You can choose between:
    1.  Per-unit scaling multiplier,
        through each USnF_ScaleMultiplier values from each unit on ArtDefine_USnF table.

    2.  Per-unit domain scaling multiplier,
        so it will apply to all units listed on ArtDefine_USnF table within specific unit domains. (LAND, SEA, or AIR)

    3.  Global scaling multiplier,
        so it will apply to all units listed on ArtDefine_USnF table.

    NOTE:   If you choose per-unit domain or global scaling multiplier, then you have to set scaling multiplier value below.
            Also per-unit scaling multiplier won't apply even if you set it manually, since the trigger will override all scale multiplier values.

There are:
0 = Disabled
1 = Use per-unit scaling multiplier (Default)
2 = Use per-unit domain scaling multiplier
3 = Use global scaling multiplier
*/

INSERT INTO USnF_Config (Type, Value)
VALUES ('USnF_SCALEMULT', 1);

------------------------------ GLOBAL SCALING MULTIPLIER ------------------------------
UPDATE ArtDefine_USnFScaleMultiplier SET USnF_ScaleMultiplier = 1.00 --set your multiplier value
WHERE EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_SCALEMULT' AND (Value = 3));
---------------------------------------------------------------------------------------
-------------------------- PER-UNIT DOMAIN SCALING MULTIPLIER -------------------------
--Scaling multiplier for land units
UPDATE ArtDefine_USnFScaleMultiplier SET USnF_ScaleMultiplier = 1.00 --set your multiplier value
WHERE EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_SCALEMULT' AND (Value = 2))
AND USnF_Domain = 'LAND';

--Scaling multiplier for sea units
UPDATE ArtDefine_USnFScaleMultiplier SET USnF_ScaleMultiplier = 1.00 --set your multiplier value
WHERE EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_SCALEMULT' AND (Value = 2))
AND USnF_Domain = 'SEA';

--Scaling multiplier for air units
UPDATE ArtDefine_USnFScaleMultiplier SET USnF_ScaleMultiplier = 1.00 --set your multiplier value
WHERE EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_SCALEMULT' AND (Value = 2))
AND USnF_Domain = 'AIR';
---------------------------------------------------------------------------------------

/*
========== Aircraft animation speed options ==========
Description:
    Aircraft animations are taking too long? Don't worry, you can make it faster!

0 = Normal speed (Default)
1 = 1.5x speed
2 = 2x speed
3 = 3x speed
4 = R.E.D. speed
*/

INSERT INTO USnF_Config (Type, Value)
VALUES ('USnF_AIRSPEED', 0);

--==================================================================================================================
-- MOD SETUP (DO NOT CHANGE ANY VALUE!)
--==================================================================================================================

-- If you select the R.E.D. scaling and formation style
UPDATE ArtDefine_USnFSetup
SET USnF_Type = 'RED'
WHERE USnF_Domain = 'LAND'
AND EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_LAND' AND Value = 1);

UPDATE ArtDefine_USnFSetup
SET USnF_Type = 'RED'
WHERE USnF_Domain = 'SEA'
AND EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_SEA' AND Value = 1);

UPDATE ArtDefine_USnFSetup
SET USnF_Type = 'RED'
WHERE USnF_Domain = 'AIR'
AND EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_AIR' AND Value = 1);

-- If you select the Reduced Unit Graphics scaling style
UPDATE ArtDefine_USnFSetup
SET USnF_Type = 'RUG'
WHERE USnF_Domain = 'LAND'
AND EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_LAND' AND Value = 2);

UPDATE ArtDefine_USnFSetup
SET USnF_Type = 'RUG'
WHERE USnF_Domain = 'SEA'
AND EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_SEA' AND Value = 2);

UPDATE ArtDefine_USnFSetup
SET USnF_Type = 'RUG'
WHERE USnF_Domain = 'AIR'
AND EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_AIR' AND Value = 2);

-- If you choose the Single Unit Graphics scaling style
UPDATE ArtDefine_USnFSetup
SET USnF_Type = 'SUG'
WHERE USnF_Domain = 'LAND'
AND EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_LAND' AND Value = 3);

UPDATE ArtDefine_USnFSetup
SET USnF_Type = 'SUG'
WHERE USnF_Domain = 'SEA'
AND EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_SEA' AND Value = 3);

UPDATE ArtDefine_USnFSetup
SET USnF_Type = 'SUG'
WHERE USnF_Domain = 'AIR'
AND EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_AIR' AND Value = 3);

-- If you select the Enhanced Air Warfare scaling style for air units
UPDATE ArtDefine_USnFSetup
SET USnF_Type = 'EAW'
WHERE USnF_Domain = 'AIR'
AND EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_AIR' AND Value = 4);

CREATE TRIGGER USnF_ScalingMultiplierEnabled
AFTER INSERT ON ArtDefine_USnF
WHEN NOT EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_SCALEMULT' AND (Value = 0 OR Value = 1))
BEGIN

    UPDATE ArtDefine_USnF
    SET USnF_ScaleMultiplier = (SELECT USnF_ScaleMultiplier FROM ArtDefine_USnFScaleMultiplier WHERE USnF_Domain = NEW.USnF_Domain)
    WHERE USnF_ScaleMultiplier = NEW.USnF_ScaleMultiplier;

END;

CREATE TRIGGER USnF_ScalingMultiplierDisabled
AFTER INSERT ON ArtDefine_USnF
WHEN EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_SCALEMULT' AND Value = 0)
BEGIN

    UPDATE ArtDefine_USnF
    SET USnF_ScaleMultiplier = 1
    WHERE USnF_ScaleMultiplier = NEW.USnF_ScaleMultiplier;

END;