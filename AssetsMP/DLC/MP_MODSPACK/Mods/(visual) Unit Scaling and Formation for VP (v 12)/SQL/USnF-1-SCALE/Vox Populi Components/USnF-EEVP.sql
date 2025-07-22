/*
    Unit Scaling and Formation

    ArtDefine configuration file
    by N.Core

    For units added from Enlightenment Era for Vox Populi.

    Note for inserting into ArtDefine_UnitInfoMemberInfos:
    To adjust what kind of UnitMemberInfo model you want to use for a UnitInfo,
    just simply add/remove the comment syntax '--' on the desired UnitMemberInfo insertion.
*/

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT  INTO ArtDefine_USnF (USnF_UnitInfo, USnF_UnitMemberInfo, USnF_Type, USnF_Domain, USnF_ModMod, USnF_Scale, USnF_NumMembers, USnF_Formation) VALUES
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  Enlightenment Era for Vox Populi units
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  LAND UNITS
        ------- UnitInfo -------------------------- UnitMemberInfo ---------------------------- Type -- Domain  ModMod  Scale - NumMembers  Formation ---------------------------
        --  ADVENTURER
            --RED: 1ST ROW - 5 Members (Wedge: Center-Right-Left-Right-Left)
            (   'ART_DEF_UNIT_EE_EXPLORER',         'ART_DEF_UNIT_MEMBER_EE_EXPLORER_4',        'RED',  'LAND', 'EEVP', 0.09,   1,          'EarlyGreatArtist'),
            (   'ART_DEF_UNIT_EE_EXPLORER',         'ART_DEF_UNIT_MEMBER_EE_EXPLORER_2',        'RED',  'LAND', 'EEVP', 0.09,   2,          'EarlyGreatArtist'),
            (   'ART_DEF_UNIT_EE_EXPLORER',         'ART_DEF_UNIT_MEMBER_EE_EXPLORER_1',        'RED',  'LAND', 'EEVP', 0.09,   2,          'EarlyGreatArtist'),
            --RED: 2ND ROW - 5 Members (Wedge: Center-Left-Right-Left-Right)
            (   'ART_DEF_UNIT_EE_EXPLORER',         'ART_DEF_UNIT_MEMBER_EE_EXPLORER_3',        'RED',  'LAND', 'EEVP', 0.09,   1,          'EarlyGreatArtist'),
            (   'ART_DEF_UNIT_EE_EXPLORER',         'ART_DEF_UNIT_MEMBER_EE_EXPLORER_4',        'RED',  'LAND', 'EEVP', 0.09,   2,          'EarlyGreatArtist'),
            (   'ART_DEF_UNIT_EE_EXPLORER',         'ART_DEF_UNIT_MEMBER_EE_EXPLORER_2',        'RED',  'LAND', 'EEVP', 0.09,   2,          'EarlyGreatArtist'),
            --RED: 3RD ROW - 3 Members (Wedge: Center-Right-Left-Right-Left)
            (   'ART_DEF_UNIT_EE_EXPLORER',         'ART_DEF_UNIT_MEMBER_EE_EXPLORER_1',        'RED',  'LAND', 'EEVP', 0.09,   1,          'EarlyGreatArtist'),
            (   'ART_DEF_UNIT_EE_EXPLORER',         'ART_DEF_UNIT_MEMBER_EE_EXPLORER_3',        'RED',  'LAND', 'EEVP', 0.09,   2,          'EarlyGreatArtist'),
            --RUG
            (   'ART_DEF_UNIT_EE_EXPLORER',         'ART_DEF_UNIT_MEMBER_EE_EXPLORER_1',        'RUG',  'LAND', 'EEVP', 0.18,   1,          'EarlyGreatArtistRUG'),
            (   'ART_DEF_UNIT_EE_EXPLORER',         'ART_DEF_UNIT_MEMBER_EE_EXPLORER_2',        'RUG',  'LAND', 'EEVP', 0.18,   1,          'EarlyGreatArtistRUG'),
            (   'ART_DEF_UNIT_EE_EXPLORER',         'ART_DEF_UNIT_MEMBER_EE_EXPLORER_3',        'RUG',  'LAND', 'EEVP', 0.18,   1,          'EarlyGreatArtistRUG'),
            --(   'ART_DEF_UNIT_EE_EXPLORER',         'ART_DEF_UNIT_MEMBER_EE_EXPLORER_4',        'RUG',  'LAND', 'EEVP', 0.18,   1,          'EarlyGreatArtistRUG'),
            --SUG
            --(   'ART_DEF_UNIT_EE_EXPLORER',         'ART_DEF_UNIT_MEMBER_EE_EXPLORER_1',        'SUG',  'LAND', 'EEVP', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT_EE_EXPLORER',         'ART_DEF_UNIT_MEMBER_EE_EXPLORER_2',        'SUG',  'LAND', 'EEVP', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT_EE_EXPLORER',         'ART_DEF_UNIT_MEMBER_EE_EXPLORER_3',        'SUG',  'LAND', 'EEVP', 0.25,   1,          ''),
            (   'ART_DEF_UNIT_EE_EXPLORER',         'ART_DEF_UNIT_MEMBER_EE_EXPLORER_4',        'SUG',  'LAND', 'EEVP', 0.25,   1,          ''),
        --  DRAGOON
            (   'ART_DEF_UNIT_EE_DRAGOON',          'ART_DEF_UNIT_MEMBER_EE_DRAGOON',           'RED',  'LAND', 'EEVP', 0.085,  7,          'DefaultCavalry'),
            (   'ART_DEF_UNIT_EE_DRAGOON',          'ART_DEF_UNIT_MEMBER_EE_DRAGOON',           'RUG',  'LAND', 'EEVP', 0.17,   3,          'DefaultCavalryRUG'),
            (   'ART_DEF_UNIT_EE_DRAGOON',          'ART_DEF_UNIT_MEMBER_EE_DRAGOON',           'SUG',  'LAND', 'EEVP', 0.24,   1,          ''),
        --  FIELD GUN [EE]
            (   'ART_DEF_UNIT_EE_FIELD_GUN',        'ART_DEF_UNIT_MEMBER_EE_FIELD_GUN',         'RED',  'LAND', 'EEVP', 0.09,   3,          'CannonLine'),
            (   'ART_DEF_UNIT_EE_FIELD_GUN',        'ART_DEF_UNIT_MEMBER_EE_FIELD_GUN',         'RUG',  'LAND', 'EEVP', 0.175,  2,          'TwoBigGunsRUG'),
            (   'ART_DEF_UNIT_EE_FIELD_GUN',        'ART_DEF_UNIT_MEMBER_EE_FIELD_GUN',         'SUG',  'LAND', 'EEVP', 0.22,  1,          ''),
        --  LINE INFANTRY
            (   'ART_DEF_UNIT_EE_LINE_INFANTRY',    'ART_DEF_UNIT_MEMBER_EE_LINE_INFANTRY',     'RED',  'LAND', 'EEVP', 0.09,   19,         'HonorableGunpowderRED'),
            (   'ART_DEF_UNIT_EE_LINE_INFANTRY',    'ART_DEF_UNIT_MEMBER_EE_LINE_INFANTRY',     'RUG',  'LAND', 'EEVP', 0.18,   3,          'HonorableGunpowderRUG'),
            (   'ART_DEF_UNIT_EE_LINE_INFANTRY',    'ART_DEF_UNIT_MEMBER_EE_LINE_INFANTRY',     'SUG',  'LAND', 'EEVP', 0.25,   1,          ''),
        --  LIGHT INFANTRY
            (   'ART_DEF_UNIT_EE_SKIRMISHER',       'ART_DEF_UNIT_MEMBER_EE_SKIRMISHER',        'RED',  'LAND', 'EEVP', 0.09,   18,         'UnFormedRED'),
            (   'ART_DEF_UNIT_EE_SKIRMISHER',       'ART_DEF_UNIT_MEMBER_EE_SKIRMISHER',        'RUG',  'LAND', 'EEVP', 0.18,   3,          'UnFormedRUG'),
            (   'ART_DEF_UNIT_EE_SKIRMISHER',       'ART_DEF_UNIT_MEMBER_EE_SKIRMISHER',        'SUG',  'LAND', 'EEVP', 0.25,   1,          ''),
        --  TWO-HANDED SWORDSMAN
            (   'ART_DEF_UNIT_EE_2HANDER',             'ART_DEF_UNIT_MEMBER_EE_2HANDER',              'RED',  'LAND', 'EEVP', 0.093,  16,         'DefaultMeleeRED'),
            (   'ART_DEF_UNIT_EE_2HANDER',             'ART_DEF_UNIT_MEMBER_EE_2HANDER',              'RUG',  'LAND', 'EEVP', 0.182,  3,          'DefaultMeleeRUG'),
            (   'ART_DEF_UNIT_EE_2HANDER',             'ART_DEF_UNIT_MEMBER_EE_2HANDER',              'SUG',  'LAND', 'EEVP', 0.251,  1,          ''),
        --  UHLAN
            (   'ART_DEF_UNIT_EE_UHLAN',            'ART_DEF_UNIT_MEMBER_EE_UHLAN',             'RED',  'LAND', 'EEVP', 0.085,  7,          'WedgeCavalry'),
            (   'ART_DEF_UNIT_EE_UHLAN',            'ART_DEF_UNIT_MEMBER_EE_UHLAN',             'RUG',  'LAND', 'EEVP', 0.17,   3,          'DefaultCavalryRUG'),
            (   'ART_DEF_UNIT_EE_UHLAN',            'ART_DEF_UNIT_MEMBER_EE_UHLAN',             'SUG',  'LAND', 'EEVP', 0.24,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  SEA UNITS
        ------- UnitInfo -------------------------- UnitMemberInfo ---------------------------- Type -- Domain  ModMod  Scale - NumMembers  Formation ---------------------------
        --	CARRACK
            (   'ART_DEF_UNIT_EE_CARRACK',          'ART_DEF_UNIT_MEMBER_EE_CARRACK',           'RED',  'SEA',  'EEVP', 0.095,  3,          'Colomb'),
            (   'ART_DEF_UNIT_EE_CARRACK',          'ART_DEF_UNIT_MEMBER_EE_CARRACK',           'RUG',  'SEA',  'EEVP', 0.152,  1,          ''),
            (   'ART_DEF_UNIT_EE_CARRACK',          'ART_DEF_UNIT_MEMBER_EE_CARRACK',           'SUG',  'SEA',  'EEVP', 0.21,   1,          ''),
        --	CORVETTE [EE]
            (   'ART_DEF_UNIT_CORVETTE',            'ART_DEF_UNIT_MEMBER_CORVETTE',             'RED',  'SEA',  'EEVP', 0.105,  2,          'Nelson'),
            (   'ART_DEF_UNIT_CORVETTE',            'ART_DEF_UNIT_MEMBER_CORVETTE',             'RUG',  'SEA',  'EEVP', 0.162,  1,          ''),
            (   'ART_DEF_UNIT_CORVETTE',            'ART_DEF_UNIT_MEMBER_CORVETTE',             'SUG',  'SEA',  'EEVP', 0.23,   1,          ''),
        --	GALLEON
            --Enlightenment Era mod uses Spanish Galleon model from Gods & Kings update for Galleon unit
            --So the code is already on the other file
        --	SHIP OF THE LINE [EE]
            (   'ART_DEF_UNIT_EE_SHIP_OF_THE_LINE', 'ART_DEF_UNIT_MEMBER_EE_SHIP_OF_THE_LINE',  'RED',  'SEA',  'EEVP', 0.105,  2,          'Nelson'),
            (   'ART_DEF_UNIT_EE_SHIP_OF_THE_LINE', 'ART_DEF_UNIT_MEMBER_EE_SHIP_OF_THE_LINE',  'RUG',  'SEA',  'EEVP', 0.165,  1,          ''),
            (   'ART_DEF_UNIT_EE_SHIP_OF_THE_LINE', 'ART_DEF_UNIT_MEMBER_EE_SHIP_OF_THE_LINE',  'SUG',  'SEA',  'EEVP', 0.235,  1,          ''),
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  END OF INSERT

            (   'END_OF_INSERT', '', '', NULL, NULL, 0, 0, '');

DELETE FROM ArtDefine_USnF WHERE USnF_UnitInfo = 'END_OF_INSERT';

--  Add support for Enlightenment Era
INSERT INTO ArtDefine_USnFModCompatibility (USnF_ModMod)
SELECT 'EEVP' WHERE EXISTS (SELECT * FROM Units WHERE Type = 'UNIT_EE_ADVENTURER');
