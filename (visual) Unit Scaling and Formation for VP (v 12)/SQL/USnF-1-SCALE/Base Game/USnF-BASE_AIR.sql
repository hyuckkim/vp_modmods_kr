/*
    Unit Scaling and Formation

    ArtDefine configuration file
    by N.Core

    For all base air military units.
*/

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT  INTO ArtDefine_USnF (USnF_UnitInfo, USnF_UnitMemberInfo, USnF_Type, USnF_Domain, USnF_Scale, USnF_NumMembers, USnF_Formation) VALUES
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  Air Military Units
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  FIGHTER LINE
        ------- UnitInfo ---------------------- UnitMemberInfo ------------------------ Type -- Domain  Scale - NumMembers  Formation -------------------------------------------
        --  TRIPLANE (WW1_FIGHTER)
            (   'ART_DEF_UNIT_WW1_FIGHTER',     'ART_DEF_UNIT_MEMBER_WW1_FIGHTER',      'RED',  'AIR',  0.07,   3,          'FighterWingRED'),
            (   'ART_DEF_UNIT_WW1_FIGHTER',     'ART_DEF_UNIT_MEMBER_WW1_FIGHTER',      'RUG',  'AIR',  0.125,  2,          'FighterWingRUG'),
            (   'ART_DEF_UNIT_WW1_FIGHTER',     'ART_DEF_UNIT_MEMBER_WW1_FIGHTER',      'SUG',  'AIR',  0.185,  1,          ''),
            (   'ART_DEF_UNIT_WW1_FIGHTER',     'ART_DEF_UNIT_MEMBER_WW1_FIGHTER',      'EAW',  'AIR',  0.078,  3,          'FighterWing'),
        --  FIGHTER
            (   'ART_DEF_UNIT_FIGHTER',         'ART_DEF_UNIT_MEMBER_FIGHTER',          'RED',  'AIR',  0.07,   4,          'FighterDiamond'),
            (   'ART_DEF_UNIT_FIGHTER',         'ART_DEF_UNIT_MEMBER_FIGHTER',          'RUG',  'AIR',  0.125,  2,          'FighterWingRUG'),
            (   'ART_DEF_UNIT_FIGHTER',         'ART_DEF_UNIT_MEMBER_FIGHTER',          'SUG',  'AIR',  0.183,  1,          ''),
            (   'ART_DEF_UNIT_FIGHTER',         'ART_DEF_UNIT_MEMBER_FIGHTER',          'EAW',  'AIR',  0.085,  3,          'FighterWing'),
        --  JET FIGHTER
            (   'ART_DEF_UNIT_JET_FIGHTER',     'ART_DEF_UNIT_MEMBER_JETFIGHTER',       'RED',  'AIR',  0.1,    2,          'FighterWingRED'),
            (   'ART_DEF_UNIT_JET_FIGHTER',     'ART_DEF_UNIT_MEMBER_JETFIGHTER',       'RUG',  'AIR',  0.155,  2,          'FighterWingRUG'),
            (   'ART_DEF_UNIT_JET_FIGHTER',     'ART_DEF_UNIT_MEMBER_JETFIGHTER',       'SUG',  'AIR',  0.23,   1,          ''),
            (   'ART_DEF_UNIT_JET_FIGHTER',     'ART_DEF_UNIT_MEMBER_JETFIGHTER',       'EAW',  'AIR',  0.097,  1,          'FighterWing'),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  BOMBER LINE
        ------- UnitInfo ---------------------- UnitMemberInfo ------------------------ Type -- Domain  Scale - NumMembers  Formation -------------------------------------------
        --  BOMBER (WW1_BOMBER)
            (   'ART_DEF_UNIT_WW1_BOMBER',      'ART_DEF_UNIT_MEMBER_WW1_BOMBER',       'RED',  'AIR',  0.075,  2,          'BomberWingRED'),
            (   'ART_DEF_UNIT_WW1_BOMBER',      'ART_DEF_UNIT_MEMBER_WW1_BOMBER',       'RUG',  'AIR',  0.115,  1,          'BomberWing'),
            (   'ART_DEF_UNIT_WW1_BOMBER',      'ART_DEF_UNIT_MEMBER_WW1_BOMBER',       'SUG',  'AIR',  0.165,  1,          ''),
            (   'ART_DEF_UNIT_WW1_BOMBER',      'ART_DEF_UNIT_MEMBER_WW1_BOMBER',       'EAW',  'AIR',  0.063,  1,          'BomberWing'),
        --  HEAVY BOMBER (BOMBER)
            (   'ART_DEF_UNIT_BOMBER',          'ART_DEF_UNIT_MEMBER_BOMBER',           'RED',  'AIR',  0.09,   3,          'BomberWingRED'),
            (   'ART_DEF_UNIT_BOMBER',          'ART_DEF_UNIT_MEMBER_BOMBER',           'RUG',  'AIR',  0.13,   1,          'BomberWing'),
            (   'ART_DEF_UNIT_BOMBER',          'ART_DEF_UNIT_MEMBER_BOMBER',           'SUG',  'AIR',  0.2,    1,          ''),
            (   'ART_DEF_UNIT_BOMBER',          'ART_DEF_UNIT_MEMBER_BOMBER',           'EAW',  'AIR',  0.085,  1,          'BomberWing'),
        --  STEALTH BOMBER
            (   'ART_DEF_UNIT_STEALTH_BOMBER',  'ART_DEF_UNIT_MEMBER_STEALTHBOMBER',    'RED',  'AIR',  0.128,  1,          'BomberWingRED'),
            (   'ART_DEF_UNIT_STEALTH_BOMBER',  'ART_DEF_UNIT_MEMBER_STEALTHBOMBER',    'RUG',  'AIR',  0.143,  1,          'BomberWing'),
            (   'ART_DEF_UNIT_STEALTH_BOMBER',  'ART_DEF_UNIT_MEMBER_STEALTHBOMBER',    'SUG',  'AIR',  0.215,  1,          ''),
            (   'ART_DEF_UNIT_STEALTH_BOMBER',  'ART_DEF_UNIT_MEMBER_STEALTHBOMBER',    'EAW',  'AIR',  0.088,  1,          'BomberWing'),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  SINGLE-USE LINE
        ------- UnitInfo ---------------------- UnitMemberInfo ------------------------ Type -- Domain  Scale - NumMembers  Formation -------------------------------------------
        --  ATOMIC BOMB
            (   'ART_DEF_UNIT_ATOMIC_BOMB',     'ART_DEF_UNIT_MEMBER_ATOMICBOMB',       'RED',  'AIR',  0.09,   1,          ''),
            (   'ART_DEF_UNIT_ATOMIC_BOMB',     'ART_DEF_UNIT_MEMBER_ATOMICBOMB',       'RUG',  'AIR',  0.12,   1,          ''),
            (   'ART_DEF_UNIT_ATOMIC_BOMB',     'ART_DEF_UNIT_MEMBER_ATOMICBOMB',       'SUG',  'AIR',  0.175,  1,          ''),
            (   'ART_DEF_UNIT_ATOMIC_BOMB',     'ART_DEF_UNIT_MEMBER_ATOMICBOMB',       'EAW',  'AIR',  0.07,   1,          ''),
        --  GUIDED MISSILE
            (   'ART_DEF_UNIT_GUIDED_MISSILE',  'ART_DEF_UNIT_MEMBER_GUIDEDMISSILE',    'RED',  'AIR',  0.14,   1,          ''),
            (   'ART_DEF_UNIT_GUIDED_MISSILE',  'ART_DEF_UNIT_MEMBER_GUIDEDMISSILE',    'RUG',  'AIR',  0.20,   1,          ''),
            (   'ART_DEF_UNIT_GUIDED_MISSILE',  'ART_DEF_UNIT_MEMBER_GUIDEDMISSILE',    'SUG',  'AIR',  0.3,    1,          ''),
            (   'ART_DEF_UNIT_GUIDED_MISSILE',  'ART_DEF_UNIT_MEMBER_GUIDEDMISSILE',    'EAW',  'AIR',  0.14,   1,          ''),
        --  NUCLEAR MISSILE
            (   'ART_DEF_UNIT_NUCLEAR_MISSILE', 'ART_DEF_UNIT_MEMBER_NUCLEARMISSILE',   'RED',  'AIR',  0.14,   1,          ''),
            (   'ART_DEF_UNIT_NUCLEAR_MISSILE', 'ART_DEF_UNIT_MEMBER_NUCLEARMISSILE',   'RUG',  'AIR',  0.20,   1,          ''),
            (   'ART_DEF_UNIT_NUCLEAR_MISSILE', 'ART_DEF_UNIT_MEMBER_NUCLEARMISSILE',   'SUG',  'AIR',  0.3,    1,          ''),
            (   'ART_DEF_UNIT_NUCLEAR_MISSILE', 'ART_DEF_UNIT_MEMBER_NUCLEARMISSILE',   'EAW',  'AIR',  0.14,   1,          ''),
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  END OF INSERT

            (   'END_OF_INSERT', '', '', NULL, 0, 0, '');

DELETE  FROM ArtDefine_USnF WHERE USnF_UnitInfo = 'END_OF_INSERT';
