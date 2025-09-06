/*
    Unit Scaling and Formation

    ArtDefine configuration file
    by N.Core

    For units added from Enhanced Naval Warfare.
*/

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT  INTO ArtDefine_USnF (USnF_UnitInfo, USnF_UnitMemberInfo, USnF_Type, USnF_Domain, USnF_ModMod, USnF_Scale, USnF_NumMembers, USnF_Formation) VALUES
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  Enhanced Naval Warfare units
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    -- ADDED UNITS
        ------- UnitInfo -------------------------- UnitMemberInfo ---------------------------- Type -- Domain  ModMod  Scale - NumMembers  Formation ---------------------------
        --	DESTROYER [ENW]
            (   'ART_DEF_UNIT_EARLY_DESTROYER',     'ART_DEF_UNIT_MEMBER_EARLY_DESTROYER',      'RED',  'SEA',  'ENW',  0.123,  1,          ''),
            (   'ART_DEF_UNIT_EARLY_DESTROYER',     'ART_DEF_UNIT_MEMBER_EARLY_DESTROYER',      'RUG',  'SEA',  'ENW',  0.135,  1,          ''),
            (   'ART_DEF_UNIT_EARLY_DESTROYER',     'ART_DEF_UNIT_MEMBER_EARLY_DESTROYER',      'SUG',  'SEA',  'ENW',  0.175,  1,          ''),
        --	MODERN DESTROYER
            (   'ART_DEF_UNIT_DESTROYER',           'ART_DEF_UNIT_MEMBER_DESTROYER',            'RED',  'SEA',  'ENW',  0.125,  -1,         ''),
            (   'ART_DEF_UNIT_DESTROYER',           'ART_DEF_UNIT_MEMBER_DESTROYER',            'RUG',  'SEA',  'ENW',  0.168,  -1,         ''),
            (   'ART_DEF_UNIT_DESTROYER',           'ART_DEF_UNIT_MEMBER_DESTROYER',            'SUG',  'SEA',  'ENW',  0.19,  -1,         ''),
        --	MISSILE DESTROYER
            (   'ART_DEF_UNIT_MISSILE_DESTROYER',   'ART_DEF_UNIT_MEMBER_MISSILE_DESTROYER',    'RED',  'SEA',  'ENW',  0.117,  1,          ''),
            (   'ART_DEF_UNIT_MISSILE_DESTROYER',   'ART_DEF_UNIT_MEMBER_MISSILE_DESTROYER',    'RUG',  'SEA',  'ENW',  0.145,  1,          ''),
            (   'ART_DEF_UNIT_MISSILE_DESTROYER',   'ART_DEF_UNIT_MEMBER_MISSILE_DESTROYER',    'SUG',  'SEA',  'ENW',  0.178,  1,          ''),
        --	ADVANCED DESTROYER
            (   'ART_DEF_UNIT_ADVANCED_DESTROYER',  'ART_DEF_UNIT_MEMBER_ADVANCED_DESTROYER',   'RED',  'SEA',  'ENW',  0.115,  1,          ''),
            (   'ART_DEF_UNIT_ADVANCED_DESTROYER',  'ART_DEF_UNIT_MEMBER_ADVANCED_DESTROYER',   'RUG',  'SEA',  'ENW',  0.14,   1,          ''),
            (   'ART_DEF_UNIT_ADVANCED_DESTROYER',  'ART_DEF_UNIT_MEMBER_ADVANCED_DESTROYER',   'SUG',  'SEA',  'ENW',  0.165,  1,          ''),
        --	DREADNOUGHT
            (   'ART_DEF_UNIT_DREADNOUGHT',         'ART_DEF_UNIT_MEMBER_DREADNOUGHT',          'RED',  'SEA',  'ENW',  0.102,  1,          ''),
            (   'ART_DEF_UNIT_DREADNOUGHT',         'ART_DEF_UNIT_MEMBER_DREADNOUGHT',          'RUG',  'SEA',  'ENW',  0.125,  1,          ''),
            (   'ART_DEF_UNIT_DREADNOUGHT',         'ART_DEF_UNIT_MEMBER_DREADNOUGHT',          'SUG',  'SEA',  'ENW',  0.125,  1,          ''),
        --	MISSILE CRUISER [ENW]
            (   'ART_DEF_UNIT_MISSILE_CRUISER',     'ART_DEF_UNIT_MEMBER_MISSILECRUISER',       'RED',  'SEA',  'ENW',  0.115,  -1,         ''),
            (   'ART_DEF_UNIT_MISSILE_CRUISER',     'ART_DEF_UNIT_MEMBER_MISSILECRUISER',       'RUG',  'SEA',  'ENW',  0.13,   -1,         ''),
            (   'ART_DEF_UNIT_MISSILE_CRUISER',     'ART_DEF_UNIT_MEMBER_MISSILECRUISER',       'SUG',  'SEA',  'ENW',  0.182,  -1,         ''),
        --	ATTACK SUBMARINE
            (   'ART_DEF_UNIT_ATTACK_SUBMARINE',    'ART_DEF_UNIT_MEMBER_ATTACK_SUBMARINE',     'RED',  'SEA',  'ENW',  0.085,  2,          'Wolfpack'),
            (   'ART_DEF_UNIT_ATTACK_SUBMARINE',    'ART_DEF_UNIT_MEMBER_ATTACK_SUBMARINE',     'RUG',  'SEA',  'ENW',  0.123,  1,          ''),
            (   'ART_DEF_UNIT_ATTACK_SUBMARINE',    'ART_DEF_UNIT_MEMBER_ATTACK_SUBMARINE',     'SUG',  'SEA',  'ENW',  0.153,  1,          ''),
        --	SUPERCARRIER
            (   'ART_DEF_UNIT_SUPERCARRIER',        'ART_DEF_UNIT_MEMBER_SUPERCARRIER',         'RED',  'SEA',  'ENW',  0.12,   1,          ''),
            (   'ART_DEF_UNIT_SUPERCARRIER',        'ART_DEF_UNIT_MEMBER_SUPERCARRIER',         'RUG',  'SEA',  'ENW',  0.15,   1,          ''),
            (   'ART_DEF_UNIT_SUPERCARRIER',        'ART_DEF_UNIT_MEMBER_SUPERCARRIER',         'SUG',  'SEA',  'ENW',  0.195,  1,          ''),
        --	ROCKET MISSILE
            (   'ART_DEF_UNIT_ROCKET_MISSILE',      'ART_DEF_UNIT_MEMBER_ROCKET_MISSILE',       'RED',  'AIR',  'ENW',  0.11,   1,          ''),
            (   'ART_DEF_UNIT_ROCKET_MISSILE',      'ART_DEF_UNIT_MEMBER_ROCKET_MISSILE',       'RUG',  'AIR',  'ENW',  0.20,   1,          ''),
            (   'ART_DEF_UNIT_ROCKET_MISSILE',      'ART_DEF_UNIT_MEMBER_ROCKET_MISSILE',       'SUG',  'AIR',  'ENW',  0.29,   1,          ''),
            (   'ART_DEF_UNIT_ROCKET_MISSILE',      'ART_DEF_UNIT_MEMBER_ROCKET_MISSILE',       'EAW',  'AIR',  'ENW',  0.12,   1,          ''),
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  END OF INSERT

            (   'END_OF_INSERT', '', '', NULL, NULL, 0, 0, '');

DELETE FROM ArtDefine_USnF WHERE USnF_UnitInfo = 'END_OF_INSERT';

--  Add support for Enhanced Naval Warfare
INSERT INTO ArtDefine_USnFModCompatibility (USnF_ModMod)
SELECT 'ENW' WHERE EXISTS (SELECT * FROM Units WHERE Type = 'UNIT_DREADNOUGHT');
