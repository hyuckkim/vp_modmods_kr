/*

    Unit Scaling and Formation
    Setup process for applying unit scaling and formation
    by N.Core
    
    What does this code actually do?
    This setup is designed to run both before and after insertion into ArtDefine_USnFModCompatibility table.

    So, this mod can be used as a baseline setup for any kind of units, whether if it came from the base game or custom mods.
    This mod also have the ability to check if the UnitInfo or UnitMemberInfo is exists, so the setup only work with what's available in the database.
    
    That is, if you put the UnitInfo data into ArtDefine_USnF table.
    If those unit exists, with the associated USnF_ModMod value inserted (if the unit came from a mod),
    then the code will automatically execute the process for that unit.

*/

-----------------------------------------------------------------------------
--  To minimize the ArtDefine_USnF table, just delete bunch of items that are not used.
--  If you're trying to debug the mod, then you have to comment this code.
-----------------------------------------------------------------------------

        DELETE  FROM ArtDefine_USnF
                WHERE USnF_Type <> (SELECT USnF_Type FROM ArtDefine_USnFSetup WHERE USnF_Domain = 'LAND')
                AND USnF_Domain = 'LAND';

        DELETE  FROM ArtDefine_USnF
                WHERE USnF_Type <> (SELECT USnF_Type FROM ArtDefine_USnFSetup WHERE USnF_Domain = 'SEA')
                AND USnF_Domain = 'SEA';

        DELETE  FROM ArtDefine_USnF
                WHERE USnF_Type <> (SELECT USnF_Type FROM ArtDefine_USnFSetup WHERE USnF_Domain = 'AIR')
                AND USnF_Domain = 'AIR';

-----------------------------------------------------------------------------
--  Scaling setup
-----------------------------------------------------------------------------

--  Custom scaling for units
        --  Land units
        REPLACE INTO ArtDefine_UnitMemberInfos (Type, Scale, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
                SELECT DISTINCT USnF_UnitMemberInfo, USnF_Scale * USnF_ScaleMultiplier, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag
                FROM ArtDefine_UnitMemberInfos INNER JOIN ArtDefine_USnF
                ON (
                        Type = USnF_UnitMemberInfo
                        --Any USnF_UnitMemberInfo with USnF_Scale = 0 means that this process won't touch them
                        AND USnF_Scale > 0
                        --For domain land unit
                        AND USnF_Domain = 'LAND'
                        --Based on what scaling type you choose
                        AND USnF_Type = (SELECT USnF_Type FROM ArtDefine_USnFSetup WHERE USnF_Domain = 'LAND')
                )
                WHERE NOT EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_LAND' AND Value = 0);

        --  Sea units
        REPLACE INTO ArtDefine_UnitMemberInfos (Type, Scale, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
                SELECT DISTINCT USnF_UnitMemberInfo, USnF_Scale * USnF_ScaleMultiplier, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag
                FROM ArtDefine_UnitMemberInfos INNER JOIN ArtDefine_USnF
                ON (
                        Type = USnF_UnitMemberInfo
                        --Any USnF_UnitMemberInfo with USnF_Scale = 0 means that this process won't touch them
                        AND USnF_Scale > 0
                        --For domain sea unit
                        AND USnF_Domain = 'SEA'
                        --Based on what scaling type you choose
                        AND USnF_Type = (SELECT USnF_Type FROM ArtDefine_USnFSetup WHERE USnF_Domain = 'SEA')
                )
                WHERE NOT EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_SEA' AND Value = 0);

        --  Air units
        REPLACE INTO ArtDefine_UnitMemberInfos (Type, Scale, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
                SELECT DISTINCT USnF_UnitMemberInfo, USnF_Scale * USnF_ScaleMultiplier, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag
                FROM ArtDefine_UnitMemberInfos INNER JOIN ArtDefine_USnF
                ON (
                        Type = USnF_UnitMemberInfo
                        --Any USnF_UnitMemberInfo with USnF_Scale = 0 means that this process won't touch them
                        AND USnF_Scale > 0
                        --For domain air unit
                        AND USnF_Domain = 'AIR'
                        --Based on what scaling type you choose
                        AND USnF_Type = (SELECT USnF_Type FROM ArtDefine_USnFSetup WHERE USnF_Domain = 'AIR')
                )
                WHERE NOT EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_AIR' AND Value = 0);

-----------------------------------------------------------------------------
-- Formation setup
-----------------------------------------------------------------------------

--  Custom formation for units
        --  Land units
        REPLACE INTO ArtDefine_UnitInfos (Type, DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex)
                SELECT DISTINCT USnF_UnitInfo, DamageStates, USnF_Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex
                FROM ArtDefine_UnitInfos INNER JOIN ArtDefine_USnF
                ON (
                        Type = USnF_UnitInfo
                        --Any USnF_UnitInfo with USnF_Formation = NULL means that this process won't touch them
                        AND USnF_Formation NOT NULL
                        --For domain land unit
                        AND USnF_Domain = 'LAND'
                        --Based on what scaling type you choose
                        AND USnF_Type = (SELECT USnF_Type FROM ArtDefine_USnFSetup WHERE USnF_Domain = 'LAND')
                )
                WHERE NOT EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_LAND' AND Value = 0);

        --  Sea units
        REPLACE INTO ArtDefine_UnitInfos (Type, DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex)
                SELECT DISTINCT USnF_UnitInfo, DamageStates, USnF_Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex
                FROM ArtDefine_UnitInfos INNER JOIN ArtDefine_USnF
                ON (
                        Type = USnF_UnitInfo
                        --Any USnF_UnitInfo with USnF_Formation = NULL means that this process won't touch them
                        AND USnF_Formation NOT NULL
                        --For domain sea unit
                        AND USnF_Domain = 'SEA'
                        --Based on what scaling type you choose
                        AND USnF_Type = (SELECT USnF_Type FROM ArtDefine_USnFSetup WHERE USnF_Domain = 'SEA')
                )
                WHERE NOT EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_SEA' AND Value = 0);

        -- Air units
        REPLACE INTO ArtDefine_UnitInfos (Type, DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex)
                SELECT DISTINCT USnF_UnitInfo, DamageStates, USnF_Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex
                FROM ArtDefine_UnitInfos INNER JOIN ArtDefine_USnF
                ON (
                        Type = USnF_UnitInfo
                        --Any USnF_UnitInfo with USnF_Formation = NULL means that this process won't touch them
                        AND USnF_Formation NOT NULL
                        --For domain air unit
                        AND USnF_Domain = 'AIR'
                        --Based on what scaling type you choose
                        AND USnF_Type = (SELECT USnF_Type FROM ArtDefine_USnFSetup WHERE USnF_Domain = 'AIR')
                )
                WHERE NOT EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_AIR' AND Value = 0);

-----------------------------------------------------------------------------
--  Number of Unit Member setup
-----------------------------------------------------------------------------

--  Clean the ArtDefine_UnitInfoMemberInfos from base units that we want to change
        --  Land units 
        DELETE  FROM ArtDefine_UnitInfoMemberInfos
                WHERE UnitInfoType
                IN (    SELECT USnF_UnitInfo
                        FROM ArtDefine_USnF
                        --Any USnF_UnitMemberInfo with USnF_NumMembers = -1 means that this process won't touch them
                        WHERE USnF_NumMembers > -1
                        --For domain land unit
                        AND USnF_Domain = 'LAND'
                        --Based on what scaling type you choose
                        AND USnF_Type = (SELECT USnF_Type FROM ArtDefine_USnFSetup WHERE USnF_Domain = 'LAND'))
                AND NOT EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_LAND' AND Value = 0);

        --  Sea units 
        DELETE  FROM ArtDefine_UnitInfoMemberInfos
                WHERE UnitInfoType
                IN (    SELECT USnF_UnitInfo
                        FROM ArtDefine_USnF
                        --Any USnF_UnitMemberInfo with USnF_NumMembers = -1 means that this process won't touch them
                        WHERE USnF_NumMembers > -1
                        --For domain sea unit
                        AND USnF_Domain = 'SEA'
                        --Based on what scaling type you choose
                        AND USnF_Type = (SELECT USnF_Type FROM ArtDefine_USnFSetup WHERE USnF_Domain = 'SEA'))
                AND NOT EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_SEA' AND Value = 0);

        --  Air units 
        DELETE  FROM ArtDefine_UnitInfoMemberInfos
                WHERE UnitInfoType
                IN (    SELECT USnF_UnitInfo
                        FROM ArtDefine_USnF
                        --Any USnF_UnitMemberInfo with USnF_NumMembers = -1 means that this process won't touch them
                        WHERE USnF_NumMembers > -1
                        --For domain air unit
                        AND USnF_Domain = 'AIR'
                        --Based on what scaling type you choose
                        AND USnF_Type = (SELECT USnF_Type FROM ArtDefine_USnFSetup WHERE USnF_Domain = 'AIR'))
                AND NOT EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_AIR' AND Value = 0);

--  Insertion for base units
        --  Number of member for land units
        INSERT  INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
                SELECT USnF_UnitInfo, USnF_UnitMemberInfo, USnF_NumMembers
                FROM ArtDefine_UnitInfos INNER JOIN ArtDefine_USnF
                ON (
                        --Make sure that unit matches existing units
                        USnF_UnitInfo = Type
                        --Any USnF_UnitMemberInfo with USnF_NumMembers = -1 means that this process won't touch them
                        AND USnF_NumMembers > -1
                        --For domain land unit
                        AND USnF_Domain = 'LAND'
                        --Based on what type you choose
                        AND USnF_Type = (SELECT USnF_Type FROM ArtDefine_USnFSetup WHERE USnF_Domain = 'LAND')
                )
                WHERE NOT EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_LAND' AND Value = 0);

        --  Number of member for sea units
        INSERT  INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
                SELECT USnF_UnitInfo, USnF_UnitMemberInfo, USnF_NumMembers
                FROM ArtDefine_UnitInfos INNER JOIN ArtDefine_USnF
                ON (
                        --Make sure that unit matches existing units
                        USnF_UnitInfo = Type
                        --Any USnF_UnitMemberInfo with USnF_NumMembers = -1 means that this process won't touch them
                        AND USnF_NumMembers > -1
                        --For domain sea unit
                        AND USnF_Domain = 'SEA'
                        --Based on what type you choose
                        AND USnF_Type = (SELECT USnF_Type FROM ArtDefine_USnFSetup WHERE USnF_Domain = 'SEA')
                )
                WHERE NOT EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_SEA' AND Value = 0);

        --  Number of member for air units
        INSERT  INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
                SELECT USnF_UnitInfo, USnF_UnitMemberInfo, USnF_NumMembers
                FROM ArtDefine_UnitInfos INNER JOIN ArtDefine_USnF
                ON (
                        --Make sure that unit matches existing units
                        USnF_UnitInfo = Type
                        --Any USnF_UnitMemberInfo with USnF_NumMembers = -1 means that this process won't touch them
                        AND USnF_NumMembers > -1
                        --For domain air unit
                        AND USnF_Domain = 'AIR'
                        --Based on what type you choose
                        AND USnF_Type = (SELECT USnF_Type FROM ArtDefine_USnFSetup WHERE USnF_Domain = 'AIR')
                )
                WHERE NOT EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_AIR' AND Value = 0);

-----------------------------------------------------------------------------
--  Compatibility setup for custom mods
-----------------------------------------------------------------------------

--  This trigger will occur after an insertion on ArtDefine_USnFModCompatibility table

        CREATE TRIGGER USnF_ModCompatibilitySetup
        AFTER INSERT ON ArtDefine_USnFModCompatibility
        WHEN NEW.USnF_ModMod NOT NULL
        BEGIN 

-----------------------------------------------------------------------------
--  To minimize the ArtDefine_USnF table, just delete bunch of items that are not used.
--  If you're trying to debug the mod, then you have to comment this code.
-----------------------------------------------------------------------------

        DELETE  FROM ArtDefine_USnF
                WHERE USnF_Type <> (SELECT USnF_Type FROM ArtDefine_USnFSetup WHERE USnF_Domain = 'LAND')
                AND USnF_Domain = 'LAND';

        DELETE  FROM ArtDefine_USnF
                WHERE USnF_Type <> (SELECT USnF_Type FROM ArtDefine_USnFSetup WHERE USnF_Domain = 'SEA')
                AND USnF_Domain = 'SEA';

        DELETE  FROM ArtDefine_USnF
                WHERE USnF_Type <> (SELECT USnF_Type FROM ArtDefine_USnFSetup WHERE USnF_Domain = 'AIR')
                AND USnF_Domain = 'AIR';

/* currently not working as intended
        DELETE  FROM ArtDefine_USnF
                WHERE USnF_ModMod NOT IN (SELECT USnF_ModMod FROM ArtDefine_USnFModCompatibility)
                AND USnF_ModMod <> NEW.USnF_ModMod
                AND USnF_ModMod IS NOT NULL;
*/
-----------------------------------------------------------------------------
--  Scaling setup
-----------------------------------------------------------------------------

--  Custom scaling for custom units
        --  Land units
        REPLACE INTO ArtDefine_UnitMemberInfos (Type, Scale, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
                SELECT DISTINCT USnF_UnitMemberInfo, USnF_Scale * USnF_ScaleMultiplier, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag
                FROM ArtDefine_UnitMemberInfos INNER JOIN ArtDefine_USnF
                ON (
                        Type = USnF_UnitMemberInfo
                        --Any USnF_UnitMemberInfo with USnF_Scale = 0 means that this process won't touch them
                        AND USnF_Scale > 0
                        --For domain land unit
                        AND USnF_Domain = 'LAND'
                        --For units from custom mods
                        AND USnF_ModMod = NEW.USnF_ModMod
                        --Based on what scaling type you choose
                        AND USnF_Type = (SELECT USnF_Type FROM ArtDefine_USnFSetup WHERE USnF_Domain = 'LAND')
                )
                WHERE NOT EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_LAND' AND Value = 0);

        --  Sea units
        REPLACE INTO ArtDefine_UnitMemberInfos (Type, Scale, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
                SELECT DISTINCT USnF_UnitMemberInfo, USnF_Scale * USnF_ScaleMultiplier, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag
                FROM ArtDefine_UnitMemberInfos INNER JOIN ArtDefine_USnF
                ON (
                        Type = USnF_UnitMemberInfo
                        --Any USnF_UnitMemberInfo with USnF_Scale = 0 means that this process won't touch them
                        AND USnF_Scale > 0
                        --For domain sea unit
                        AND USnF_Domain = 'SEA'
                        --For units from custom mods
                        AND USnF_ModMod = NEW.USnF_ModMod
                        --Based on what scaling type you choose
                        AND USnF_Type = (SELECT USnF_Type FROM ArtDefine_USnFSetup WHERE USnF_Domain = 'SEA')
                )
                WHERE NOT EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_SEA' AND Value = 0);

        --  Air units
        REPLACE INTO ArtDefine_UnitMemberInfos (Type, Scale, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
                SELECT DISTINCT USnF_UnitMemberInfo, USnF_Scale * USnF_ScaleMultiplier, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag
                FROM ArtDefine_UnitMemberInfos INNER JOIN ArtDefine_USnF
                ON (
                        Type = USnF_UnitMemberInfo
                        --Any USnF_UnitMemberInfo with USnF_Scale = 0 means that this process won't touch them
                        AND USnF_Scale > 0
                        --For domain air unit
                        AND USnF_Domain = 'AIR'
                        --For units from custom mods
                        AND USnF_ModMod = NEW.USnF_ModMod
                        --Based on what scaling type you choose
                        AND USnF_Type = (SELECT USnF_Type FROM ArtDefine_USnFSetup WHERE USnF_Domain = 'AIR')
                )
                WHERE NOT EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_AIR' AND Value = 0);

-----------------------------------------------------------------------------
-- Formation setup
-----------------------------------------------------------------------------

--  Custom formation for custom units
        -- Land units
        REPLACE INTO ArtDefine_UnitInfos (Type, DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex)
                SELECT DISTINCT USnF_UnitInfo, DamageStates, USnF_Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex
                FROM ArtDefine_UnitInfos INNER JOIN ArtDefine_USnF
                ON (
                        Type = USnF_UnitInfo
                        --Any USnF_UnitInfo with USnF_Formation = NULL means that this process won't touch them
                        AND USnF_Formation NOT NULL
                        --For domain land unit
                        AND USnF_Domain = 'LAND'
                        --For units from custom mods
                        AND USnF_ModMod = NEW.USnF_ModMod
                        --Based on what scaling type you choose
                        AND USnF_Type = (SELECT USnF_Type FROM ArtDefine_USnFSetup WHERE USnF_Domain = 'LAND')
                )
                WHERE NOT EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_LAND' AND Value = 0);

        -- Sea units
        REPLACE INTO ArtDefine_UnitInfos (Type, DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex)
                SELECT DISTINCT USnF_UnitInfo, DamageStates, USnF_Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex
                FROM ArtDefine_UnitInfos INNER JOIN ArtDefine_USnF
                ON (
                        Type = USnF_UnitInfo
                        --Any USnF_UnitInfo with USnF_Formation = NULL means that this process won't touch them
                        AND USnF_Formation NOT NULL
                        --For domain sea unit
                        AND USnF_Domain = 'SEA'
                        --For units from custom mods
                        AND USnF_ModMod = NEW.USnF_ModMod
                        --Based on what scaling type you choose
                        AND USnF_Type = (SELECT USnF_Type FROM ArtDefine_USnFSetup WHERE USnF_Domain = 'SEA')
                )
                WHERE NOT EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_SEA' AND Value = 0);

        -- Air units
        REPLACE INTO ArtDefine_UnitInfos (Type, DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex)
                SELECT DISTINCT USnF_UnitInfo, DamageStates, USnF_Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex
                FROM ArtDefine_UnitInfos INNER JOIN ArtDefine_USnF
                ON (
                        Type = USnF_UnitInfo
                        --Any USnF_UnitInfo with USnF_Formation = NULL means that this process won't touch them
                        AND USnF_Formation NOT NULL
                        --For domain air unit
                        AND USnF_Domain = 'AIR'
                        --For units from custom mods
                        AND USnF_ModMod = NEW.USnF_ModMod
                        --Based on what type you choose
                        AND USnF_Type = (SELECT USnF_Type FROM ArtDefine_USnFSetup WHERE USnF_Domain = 'AIR')
                )
                WHERE NOT EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_AIR' AND Value = 0);

-----------------------------------------------------------------------------
--  Number of Unit Member setup
-----------------------------------------------------------------------------

--  Clean the ArtDefine_UnitInfoMemberInfos from custom units that we want to change
        --  Land units 
        DELETE  FROM ArtDefine_UnitInfoMemberInfos
                WHERE UnitInfoType
                IN (    SELECT USnF_UnitInfo
                        FROM ArtDefine_USnF
                        --Any USnF_UnitMemberInfo with USnF_NumMembers = -1 means that this process won't touch them
                        WHERE USnF_NumMembers > -1
                        --For domain land unit
                        AND USnF_Domain = 'LAND'
                        --For units from custom mods
                        AND USnF_ModMod = NEW.USnF_ModMod
                        --Based on what scaling type you choose
                        AND USnF_Type = (SELECT USnF_Type FROM ArtDefine_USnFSetup WHERE USnF_Domain = 'LAND'))
                AND NOT EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_LAND' AND Value = 0);

        --  Sea units 
        DELETE  FROM ArtDefine_UnitInfoMemberInfos
                WHERE UnitInfoType
                IN (    SELECT USnF_UnitInfo
                        FROM ArtDefine_USnF
                        --Any USnF_UnitMemberInfo with USnF_NumMembers = -1 means that this process won't touch them
                        WHERE USnF_NumMembers > -1
                        --For domain sea unit
                        AND USnF_Domain = 'SEA'
                        --For units from custom mods
                        AND USnF_ModMod = NEW.USnF_ModMod
                        --Based on what scaling type you choose
                        AND USnF_Type = (SELECT USnF_Type FROM ArtDefine_USnFSetup WHERE USnF_Domain = 'SEA'))
                AND NOT EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_SEA' AND Value = 0);

        --  Air units 
        DELETE  FROM ArtDefine_UnitInfoMemberInfos
                WHERE UnitInfoType
                IN (    SELECT USnF_UnitInfo
                        FROM ArtDefine_USnF
                        --Any USnF_UnitMemberInfo with USnF_NumMembers = -1 means that this process won't touch them
                        WHERE USnF_NumMembers > -1
                        --For domain air unit
                        AND USnF_Domain = 'AIR'
                        --For units from custom mods
                        AND USnF_ModMod = NEW.USnF_ModMod
                        --Based on what scaling type you choose
                        AND USnF_Type = (SELECT USnF_Type FROM ArtDefine_USnFSetup WHERE USnF_Domain = 'AIR'))
                AND NOT EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_AIR' AND Value = 0);

--  Insertion for custom units
        --  Number of member for land units
        INSERT  INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
                SELECT USnF_UnitInfo, USnF_UnitMemberInfo, USnF_NumMembers
                FROM ArtDefine_UnitInfos INNER JOIN ArtDefine_USnF
                ON (
                        --Make sure that unit matches existing units
                        USnF_UnitInfo = Type
                        --Any USnF_UnitMemberInfo with USnF_NumMembers = -1 means that this process won't touch them
                        AND USnF_NumMembers > -1
                        --For domain land unit
                        AND USnF_Domain = 'LAND'
                        --For units from custom mods
                        AND USnF_ModMod = NEW.USnF_ModMod
                        --Based on what type you choose
                        AND USnF_Type = (SELECT USnF_Type FROM ArtDefine_USnFSetup WHERE USnF_Domain = 'LAND')
                )
                WHERE NOT EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_LAND' AND Value = 0);

        --  Number of member for sea units
        INSERT  INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
                SELECT USnF_UnitInfo, USnF_UnitMemberInfo, USnF_NumMembers
                FROM ArtDefine_UnitInfos INNER JOIN ArtDefine_USnF
                ON (
                        --Make sure that unit matches existing units
                        USnF_UnitInfo = Type
                        --Any USnF_UnitMemberInfo with USnF_NumMembers = -1 means that this process won't touch them
                        AND USnF_NumMembers > -1
                        --For domain land unit
                        AND USnF_Domain = 'SEA'
                        --For units from custom mods
                        AND USnF_ModMod = NEW.USnF_ModMod
                        --Based on what type you choose
                        AND USnF_Type = (SELECT USnF_Type FROM ArtDefine_USnFSetup WHERE USnF_Domain = 'SEA')
                )
                WHERE NOT EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_SEA' AND Value = 0);

        --  Number of member for air units
        INSERT  INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
                SELECT USnF_UnitInfo, USnF_UnitMemberInfo, USnF_NumMembers
                FROM ArtDefine_UnitInfos INNER JOIN ArtDefine_USnF
                ON (
                        --Make sure that unit matches existing units
                        USnF_UnitInfo = Type
                        --Any USnF_UnitMemberInfo with USnF_NumMembers = -1 means that this process won't touch them
                        AND USnF_NumMembers > -1
                        --For domain land unit
                        AND USnF_Domain = 'AIR'
                        --For units from custom mods
                        AND USnF_ModMod = NEW.USnF_ModMod
                        --Based on what type you choose
                        AND USnF_Type = (SELECT USnF_Type FROM ArtDefine_USnFSetup WHERE USnF_Domain = 'AIR')
                )
                WHERE NOT EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_AIR' AND Value = 0);

        END;
