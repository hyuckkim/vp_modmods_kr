/*
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
========== Use Scramble to Africa scenario Explorer model for Commando ==========
Description:
    VP uses a new Commando unit model which came from a mod.
    And Civ V has its own existing Explorer unit model that came from Scramble to Africa scenario.
    Set the value to "1" if you want to use that model.

    Note: The model have a floating shovel shadow above it.

0 = DISABLE (Default)
1 = ENABLE
*/

INSERT INTO USnF_Config (Type, Value)
VALUES ('USnF_AFRICAEXPLORER', 0);

/*
========== Fix duplicated ship model usage ==========
Description:
    EEVP's Galleon uses Spanish Galleon model, which is same model as MUCfVP's Armada (Spain's 4UC)
    Also, model of base game Privateer (now Corvette) has been replaced by VP with a new model, and that model is left unused. 
    And with EEVP, Corvette model has been changed to another new model.

    So, the solution to fix the duplicated ship model usage is to:
    - Revert the Corvette model back to base game Privateer model
    - Change EEVP's Galleon model to EEVP's new Corvette model

    Set the value to "1" if you want to do it.

    Note: Only work if you play with both EEVP and MUCfVP

0 = DISABLE (Default)
1 = ENABLE
*/

INSERT INTO USnF_Config (Type, Value)
VALUES ('USnF_FIX_EEGALLEON', 1);

--==================================================================================================================
-- MOD SETUP (DO NOT CHANGE ANY VALUE!)
--==================================================================================================================

UPDATE Units SET UnitArtInfo = "ART_DEF_UNIT_EXPLORER"
WHERE Type = 'UNIT_COMMANDO'
AND EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_AFRICAEXPLORER' AND Value = 1); 

UPDATE Units SET UnitArtInfo = "ART_DEF_UNIT_XP_PRIVATEER"
WHERE Type = 'UNIT_PRIVATEER'
AND EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_FIX_EEGALLEON' AND Value = 1)
AND EXISTS (SELECT * FROM Units WHERE Type IN ('UNIT_EE_GALLEON', 'UNIT_SPAIN_ARMADA')); 

UPDATE Units SET UnitArtInfo = "ART_DEF_UNIT_CORVETTE"
WHERE Type = 'UNIT_EE_GALLEON'
AND EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_FIX_EEGALLEON' AND Value = 1)
AND EXISTS (SELECT * FROM Units WHERE Type IN ('UNIT_EE_GALLEON', 'UNIT_SPAIN_ARMADA')); 
