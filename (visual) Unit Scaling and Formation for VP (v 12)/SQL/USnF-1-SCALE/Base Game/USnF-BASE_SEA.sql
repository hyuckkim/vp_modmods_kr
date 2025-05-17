/*
    Unit Scaling and Formation

    ArtDefine configuration file
    by N.Core

    For all base sea military units.
*/

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT  INTO ArtDefine_USnF (USnF_UnitInfo, USnF_UnitMemberInfo, USnF_Type, USnF_Domain, USnF_Scale, USnF_NumMembers, USnF_Formation) VALUES
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  Sea Military Units
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  UNIT EMBARKATION MODEL
        ------- UnitInfo -------------------------- UnitMemberInfo ------------------------ Type -- Domain  Scale - NumMembers  Formation ---------------------------------------
        --	GALLEY (ANCIENT ERA UNIT EMBARKATION)
            (   'ART_DEF_UNIT_GALLEY',              'ART_DEF_UNIT_MEMBER_GALLEY',           'RED',  'SEA',  0.10,   5,          'Flotilla'),
            (   'ART_DEF_UNIT_GALLEY',              'ART_DEF_UNIT_MEMBER_GALLEY',           'RUG',  'SEA',  0.15,   2,          'FlotillaRUG'),
            (   'ART_DEF_UNIT_GALLEY',              'ART_DEF_UNIT_MEMBER_GALLEY',           'SUG',  'SEA',  0.22,  1,          ''),
        --	GALLEON (MEDIEVAL ERA UNIT EMBARKATION)
            (   'ART_DEF_UNIT_GALLEON',             'ART_DEF_UNIT_MEMBER_GALLEON',          'RED',  'SEA',  0.10,   5,          'Flotilla'),
            (   'ART_DEF_UNIT_GALLEON',             'ART_DEF_UNIT_MEMBER_GALLEON',          'RUG',  'SEA',  0.15,   2,          'FlotillaRUG'),
            (   'ART_DEF_UNIT_GALLEON',             'ART_DEF_UNIT_MEMBER_GALLEON',          'SUG',  'SEA',  0.222,  1,          ''),
        --	TRANSPORT (INDUSTRIAL ERA UNIT EMBARKATION)
            (   'ART_DEF_UNIT_TRANSPORT',           'ART_DEF_UNIT_MEMBER_TRANSPORT',        'RED',  'SEA',  0.065,  4,          'Flotilla'),
            (   'ART_DEF_UNIT_TRANSPORT',           'ART_DEF_UNIT_MEMBER_TRANSPORT',        'RUG',  'SEA',  0.113,  2,          'FlotillaRUG'),
            (   'ART_DEF_UNIT_TRANSPORT',           'ART_DEF_UNIT_MEMBER_TRANSPORT',        'SUG',  'SEA',  0.178,  1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  NAVAL MELEE LINE
        ------- UnitInfo -------------------------- UnitMemberInfo ------------------------ Type -- Domain  Scale - NumMembers  Formation ---------------------------------------
        --	TRIREME
            (   'ART_DEF_UNIT_TRIREME',             'ART_DEF_UNIT_MEMBER_TRIREME',          'RED',  'SEA',  0.054,  2,          'Flotilla'),
            (   'ART_DEF_UNIT_TRIREME',             'ART_DEF_UNIT_MEMBER_TRIREME',          'RUG',  'SEA',  0.095,  1,          ''),
            (   'ART_DEF_UNIT_TRIREME',             'ART_DEF_UNIT_MEMBER_TRIREME',          'SUG',  'SEA',  0.13,   1,          ''),
        --	CARAVEL
            (   'ART_DEF_UNIT_CARAVEL',             'ART_DEF_UNIT_MEMBER_CARAVEL',          'RED',  'SEA',  0.10,   3,          'Colomb'),
            (   'ART_DEF_UNIT_CARAVEL',             'ART_DEF_UNIT_MEMBER_CARAVEL',          'RUG',  'SEA',  0.175,  1,          ''),
            (   'ART_DEF_UNIT_CARAVEL',             'ART_DEF_UNIT_MEMBER_CARAVEL',          'SUG',  'SEA',  0.255,  1,          ''),
        --	PRIVATEER
            --Other Privateer ArtDefine, one of them used in Conquest of the New World scenario
            (   'ART_DEF_UNIT_PRIVATEER',           'ART_DEF_UNIT_MEMBER_PRIVATEER',        'RED',  'SEA',  0.102,  2,          'Colomb'),
            (   'ART_DEF_UNIT_PRIVATEER',           'ART_DEF_UNIT_MEMBER_PRIVATEER',        'RUG',  'SEA',  0.148,  1,          ''),
            (   'ART_DEF_UNIT_PRIVATEER',           'ART_DEF_UNIT_MEMBER_PRIVATEER',        'SUG',  'SEA',  0.21,   1,          ''),
            (   'ART_DEF_UNIT_XP_PRIVATEER',        'ART_DEF_UNIT_MEMBER_XP_PRIVATEER',     'RED',  'SEA',  0.102,  2,          'Colomb'),
            (   'ART_DEF_UNIT_XP_PRIVATEER',        'ART_DEF_UNIT_MEMBER_XP_PRIVATEER',     'RUG',  'SEA',  0.148,  1,          ''),
            (   'ART_DEF_UNIT_XP_PRIVATEER',        'ART_DEF_UNIT_MEMBER_XP_PRIVATEER',     'SUG',  'SEA',  0.21,   1,          ''),
        --	IRONCLAD
            (   'ART_DEF_UNIT_IRONCLAD',            'ART_DEF_UNIT_MEMBER_IRONCLAD',         'RED',  'SEA',  0.115,  1,          ''),
            (   'ART_DEF_UNIT_IRONCLAD',            'ART_DEF_UNIT_MEMBER_IRONCLAD',         'RUG',  'SEA',  0.15,   1,          ''),
            (   'ART_DEF_UNIT_IRONCLAD',            'ART_DEF_UNIT_MEMBER_IRONCLAD',         'SUG',  'SEA',  0.21,   1,          ''),
        --	DESTROYER
            (   'ART_DEF_UNIT_DESTROYER',           'ART_DEF_UNIT_MEMBER_DESTROYER',        'RED',  'SEA',  0.12,   1,          ''),
            (   'ART_DEF_UNIT_DESTROYER',           'ART_DEF_UNIT_MEMBER_DESTROYER',        'RUG',  'SEA',  0.17,   1,          ''),
            (   'ART_DEF_UNIT_DESTROYER',           'ART_DEF_UNIT_MEMBER_DESTROYER',        'SUG',  'SEA',  0.225,  1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  NAVAL RANGED LINE
        ------- UnitInfo -------------------------- UnitMemberInfo ------------------------ Type -- Domain  Scale - NumMembers  Formation ---------------------------------------
        --	GALLEASS
            (   'ART_DEF_UNIT_GALLEASS',            'ART_DEF_UNIT_MEMBER_GALLEASS',         'RED',  'SEA',  0.09,   3,          'Colomb'),
            (   'ART_DEF_UNIT_GALLEASS',            'ART_DEF_UNIT_MEMBER_GALLEASS',         'RUG',  'SEA',  0.18,   1,          ''),
            (   'ART_DEF_UNIT_GALLEASS',            'ART_DEF_UNIT_MEMBER_GALLEASS',         'SUG',  'SEA',  0.24,   1,          ''),
        --	FRIGATE
            (   'ART_DEF_UNIT_FRIGATE',             'ART_DEF_UNIT_MEMBER_FRIGATE',          'RED',  'SEA',  0.115,  2,          'Nelson'),
            (   'ART_DEF_UNIT_FRIGATE',             'ART_DEF_UNIT_MEMBER_FRIGATE',          'RUG',  'SEA',  0.165,  1,          ''),
            (   'ART_DEF_UNIT_FRIGATE',             'ART_DEF_UNIT_MEMBER_FRIGATE',          'SUG',  'SEA',  0.235,  1,          ''),
        --	BATTLESHIP
            (   'ART_DEF_UNIT_BATTLESHIP',          'ART_DEF_UNIT_MEMBER_BATTLESHIP',       'RED',  'SEA',  0.108,  1,          ''),
            (   'ART_DEF_UNIT_BATTLESHIP',          'ART_DEF_UNIT_MEMBER_BATTLESHIP',       'RUG',  'SEA',  0.126,  1,          ''),
            (   'ART_DEF_UNIT_BATTLESHIP',          'ART_DEF_UNIT_MEMBER_BATTLESHIP',       'SUG',  'SEA',  0.135,  1,          ''),
        --	MISSILE CRUISER
            (   'ART_DEF_UNIT_MISSILE_CRUISER',     'ART_DEF_UNIT_MEMBER_MISSILECRUISER',   'RED',  'SEA',  0.117,  1,          ''),
            (   'ART_DEF_UNIT_MISSILE_CRUISER',     'ART_DEF_UNIT_MEMBER_MISSILECRUISER',   'RUG',  'SEA',  0.147,  1,          ''),
            (   'ART_DEF_UNIT_MISSILE_CRUISER',     'ART_DEF_UNIT_MEMBER_MISSILECRUISER',   'SUG',  'SEA',  0.188,  1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  OTHER NAVAL UNITS
        ------- UnitInfo -------------------------- UnitMemberInfo ------------------------ Type -- Domain  Scale - NumMembers  Formation ---------------------------------------
        --	CARRIER
            (   'ART_DEF_UNIT_CARRIER',             'ART_DEF_UNIT_MEMBER_CARRIER',          'RED',  'SEA',  0.105,  1,          ''),
            (   'ART_DEF_UNIT_CARRIER',             'ART_DEF_UNIT_MEMBER_CARRIER',          'RUG',  'SEA',  0.135,  1,          ''),
            (   'ART_DEF_UNIT_CARRIER',             'ART_DEF_UNIT_MEMBER_CARRIER',          'SUG',  'SEA',  0.14,   1,          ''),
        --	SUBMARINE
            (   'ART_DEF_UNIT_SUBMARINE',           'ART_DEF_UNIT_MEMBER_SUBMARINE',        'RED',  'SEA',  0.12,   3,          'Wolfpack'),
            (   'ART_DEF_UNIT_SUBMARINE',           'ART_DEF_UNIT_MEMBER_SUBMARINE',        'RUG',  'SEA',  0.18,   1,          ''),
            (   'ART_DEF_UNIT_SUBMARINE',           'ART_DEF_UNIT_MEMBER_SUBMARINE',        'SUG',  'SEA',  0.25,   1,          ''),
        --	NUCLEAR SUBMARINE
            (   'ART_DEF_UNIT_NUCLEAR_SUBMARINE',   'ART_DEF_UNIT_MEMBER_NUCLEARSUBMARINE', 'RED',  'SEA',  0.12,   1,          ''),
            (   'ART_DEF_UNIT_NUCLEAR_SUBMARINE',   'ART_DEF_UNIT_MEMBER_NUCLEARSUBMARINE', 'RUG',  'SEA',  0.143,  1,          ''),
            (   'ART_DEF_UNIT_NUCLEAR_SUBMARINE',   'ART_DEF_UNIT_MEMBER_NUCLEARSUBMARINE', 'SUG',  'SEA',  0.195,  1,          ''),
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  END OF INSERT

            (   'END_OF_INSERT', '', '', NULL, 0, 0, '');

DELETE  FROM ArtDefine_USnF WHERE USnF_UnitInfo = 'END_OF_INSERT';
