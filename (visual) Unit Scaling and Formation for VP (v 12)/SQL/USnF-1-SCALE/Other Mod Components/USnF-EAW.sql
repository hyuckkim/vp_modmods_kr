/*
    Unit Scaling and Formation

    ArtDefine configuration file
    by N.Core

    For units added from Enhanced Air Warfare.
*/

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT  INTO ArtDefine_USnF (USnF_UnitInfo, USnF_UnitMemberInfo, USnF_Type, USnF_Domain, USnF_ModMod, USnF_Scale, USnF_NumMembers, USnF_Formation) VALUES
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  EAW Units
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  FIGHTER LINE
        ------- UnitInfo ---------------------- UnitMemberInfo ------------------------ Type -- Domain  ModMod  Scale - NumMembers  Formation -----------------------------------
        --	MONOPLANE
            (   'ART_DEF_UNIT_EARLYMONOPLAN',   'ART_DEF_UNIT_MEMBER_EARLYMONOPLAN',    'RED',  'AIR',  'EAW',  0.07,   4,          'FighterDiamond'),
            (   'ART_DEF_UNIT_EARLYMONOPLAN',   'ART_DEF_UNIT_MEMBER_EARLYMONOPLAN',    'RUG',  'AIR',  'EAW',  0.12,   2,          'FighterWingRUG'),
            (   'ART_DEF_UNIT_EARLYMONOPLAN',   'ART_DEF_UNIT_MEMBER_EARLYMONOPLAN',    'SUG',  'AIR',  'EAW',  0.173,  1,          ''),
            (   'ART_DEF_UNIT_EARLYMONOPLAN',   'ART_DEF_UNIT_MEMBER_EARLYMONOPLAN',    'EAW',  'AIR',  'EAW',  0.082,  3,          'FighterWing'),
        --	P-80 SHOOTING STAR
            (   'ART_DEF_UNIT_EARLYJET',        'ART_DEF_UNIT_MEMBER_EARLYJET',         'RED',  'AIR',  'EAW',  0.093,  4,          'FighterDiamond'),
            (   'ART_DEF_UNIT_EARLYJET',        'ART_DEF_UNIT_MEMBER_EARLYJET',         'RUG',  'AIR',  'EAW',  0.148,  2,          'FighterWingRUG'),
            (   'ART_DEF_UNIT_EARLYJET',        'ART_DEF_UNIT_MEMBER_EARLYJET',         'SUG',  'AIR',  'EAW',  0.225,  1,          ''),
            (   'ART_DEF_UNIT_EARLYJET',        'ART_DEF_UNIT_MEMBER_EARLYJET',         'EAW',  'AIR',  'EAW',  0.1,    3,          'FighterWing'),
        --	JET FIGHTER [EAW]
            (   'ART_DEF_UNIT_JET27',           'ART_DEF_UNIT_MEMBER_JET27',            'RED',  'AIR',  'EAW',  0.10,   3,          'FighterWingRED'),
            (   'ART_DEF_UNIT_JET27',           'ART_DEF_UNIT_MEMBER_JET27',            'RUG',  'AIR',  'EAW',  0.153,  1,          'FighterWingRUG'),
            (   'ART_DEF_UNIT_JET27',           'ART_DEF_UNIT_MEMBER_JET27',            'SUG',  'AIR',  'EAW',  0.212,  1,          ''),
            (   'ART_DEF_UNIT_JET27',           'ART_DEF_UNIT_MEMBER_JET27',            'EAW',  'AIR',  'EAW',  0.093,  3,          'FighterWing'),
        --	MIG-29
            (   'ART_DEF_UNIT_MIG29',           'ART_DEF_UNIT_MEMBER_MIG29',            'RED',  'AIR',  'EAW',  0.12,   3,          'FighterWingRED'),
            (   'ART_DEF_UNIT_MIG29',           'ART_DEF_UNIT_MEMBER_MIG29',            'RUG',  'AIR',  'EAW',  0.173,  1,          'FighterWingRUG'),
            (   'ART_DEF_UNIT_MIG29',           'ART_DEF_UNIT_MEMBER_MIG29',            'SUG',  'AIR',  'EAW',  0.245,  1,          ''),
            (   'ART_DEF_UNIT_MIG29',           'ART_DEF_UNIT_MEMBER_MIG29',            'EAW',  'AIR',  'EAW',  0.118,  3,          'FighterWing'),
        --	ADVANCED FIGHTER
            (   'ART_DEF_UNIT_ADVJET',          'ART_DEF_UNIT_MEMBER_ADVJET',           'RED',  'AIR',  'EAW',  0.105,  2,          'FighterWingRED'),
            (   'ART_DEF_UNIT_ADVJET',          'ART_DEF_UNIT_MEMBER_ADVJET',           'RUG',  'AIR',  'EAW',  0.15,   1,          'FighterWingRUG'),
            (   'ART_DEF_UNIT_ADVJET',          'ART_DEF_UNIT_MEMBER_ADVJET',           'SUG',  'AIR',  'EAW',  0.23,   1,          ''),
            (   'ART_DEF_UNIT_ADVJET',          'ART_DEF_UNIT_MEMBER_ADVJET',           'EAW',  'AIR',  'EAW',  0.1,    2,          'FighterWing'),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  BOMBER LINE
        ------- UnitInfo ---------------------- UnitMemberInfo ------------------------ Type -- Domain  ModMod  Scale - NumMembers  Formation -----------------------------------
        --	MEDIUM BOMBER
            (   'ART_DEF_UNIT_MEDIUMBOMBER',    'ART_DEF_UNIT_MEMBER_MEDIUMBOMBER',     'RED',  'AIR',  'EAW',  0.085,  2,          'BomberWingRED'),
            (   'ART_DEF_UNIT_MEDIUMBOMBER',    'ART_DEF_UNIT_MEMBER_MEDIUMBOMBER',     'RUG',  'AIR',  'EAW',  0.14,   1,          'BomberWing'),
            (   'ART_DEF_UNIT_MEDIUMBOMBER',    'ART_DEF_UNIT_MEMBER_MEDIUMBOMBER',     'SUG',  'AIR',  'EAW',  0.22,   1,          ''),
            (   'ART_DEF_UNIT_MEDIUMBOMBER',    'ART_DEF_UNIT_MEMBER_MEDIUMBOMBER',     'EAW',  'AIR',  'EAW',  0.089,  1,          'BomberWing'),
        --	JET BOMBER
            (   'ART_DEF_UNIT_ULTJETBOMB',      'ART_DEF_UNIT_MEMBER_ULTJETBOMB',       'RED',  'AIR',  'EAW',  0.153,  2,          'BomberWingRED'),
            (   'ART_DEF_UNIT_ULTJETBOMB',      'ART_DEF_UNIT_MEMBER_ULTJETBOMB',       'RUG',  'AIR',  'EAW',  0.198,  1,          'BomberWing'),
            (   'ART_DEF_UNIT_ULTJETBOMB',      'ART_DEF_UNIT_MEMBER_ULTJETBOMB',       'SUG',  'AIR',  'EAW',  0.27,   1,          ''),
            (   'ART_DEF_UNIT_ULTJETBOMB',      'ART_DEF_UNIT_MEMBER_ULTJETBOMB',       'EAW',  'AIR',  'EAW',  0.125,  1,          'BomberWing'),
        --	B-52
            (   'ART_DEF_UNIT_B52',             'ART_DEF_UNIT_MEMBER_B52',              'RED',  'AIR',  'EAW',  0.133,  1,          'BomberWingRED'),
            (   'ART_DEF_UNIT_B52',             'ART_DEF_UNIT_MEMBER_B52',              'RUG',  'AIR',  'EAW',  0.172,  1,          'BomberWing'),
            (   'ART_DEF_UNIT_B52',             'ART_DEF_UNIT_MEMBER_B52',              'SUG',  'AIR',  'EAW',  0.241,  1,          ''),
            (   'ART_DEF_UNIT_B52',             'ART_DEF_UNIT_MEMBER_B52',              'EAW',  'AIR',  'EAW',  0.128,  1,          'BomberWing'),
        --	STRATEGIC BOMBER
            (   'ART_DEF_UNIT_STRBOMB',         'ART_DEF_UNIT_MEMBER_STRBOMB',          'RED',  'AIR',  'EAW',  0.13,   1,          'BomberWingRED'),
            (   'ART_DEF_UNIT_STRBOMB',         'ART_DEF_UNIT_MEMBER_STRBOMB',          'RUG',  'AIR',  'EAW',  0.17,   1,          'BomberWing'),
            (   'ART_DEF_UNIT_STRBOMB',         'ART_DEF_UNIT_MEMBER_STRBOMB',          'SUG',  'AIR',  'EAW',  0.24,   1,          ''),
            (   'ART_DEF_UNIT_STRBOMB',         'ART_DEF_UNIT_MEMBER_STRBOMB',          'EAW',  'AIR',  'EAW',  0.115,  1,          'BomberWing'),
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  END OF INSERT 

            (   'END_OF_INSERT', '', '', NULL, NULL, 0, 0, '');

DELETE FROM ArtDefine_USnF WHERE USnF_UnitInfo = 'END_OF_INSERT';

--  Add support for Enhanced Air Warfare
INSERT INTO ArtDefine_USnFModCompatibility (USnF_ModMod)
SELECT 'EAW' WHERE EXISTS (SELECT * FROM Units WHERE Type = 'UNIT_ULTJETBOMB');
