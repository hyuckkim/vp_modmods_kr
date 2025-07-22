/*
    Unit Scaling and Formation

    ArtDefine configuration file
    by N.Core

    For all base Civilian & Special units.

    Note for inserting into ArtDefine_UnitInfoMemberInfos:
    To adjust what kind of UnitMemberInfo model you want to use for a UnitInfo,
    just simply add/remove the comment syntax '--' on the desired UnitMemberInfo insertion.
*/

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT  INTO ArtDefine_USnF (USnF_UnitInfo, USnF_UnitMemberInfo, USnF_Type, USnF_Domain, USnF_Scale, USnF_NumMembers, USnF_Formation) VALUES
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  Civilian & Special Units
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  SETTLING UNITS
        ------- UnitInfo ---------------------------------- UnitMemberInfo ------------------------------------ Type -- Domain  Scale - NumMembers  Formation -------------------
        --  SETTLER AFRICAN
            --RED
            (   'ART_DEF_UNIT__SETTLER_AFRI',               'ART_DEF_UNIT_MEMBER_AFRICAMEL',                    'RED',  'LAND', 0.09,   1,          'LooseCivilian'),
            (   'ART_DEF_UNIT__SETTLER_AFRI',               'ART_DEF_UNIT_MEMBER_AFRIFEMALE1',                  'RED',  'LAND', 0.09,   1,          'LooseCivilian'),
            (   'ART_DEF_UNIT__SETTLER_AFRI',               'ART_DEF_UNIT_MEMBER_AFRIFEMALE2',                  'RED',  'LAND', 0.09,   1,          'LooseCivilian'),
            (   'ART_DEF_UNIT__SETTLER_AFRI',               'ART_DEF_UNIT_MEMBER_AFRIFEMALE3',                  'RED',  'LAND', 0.09,   1,          'LooseCivilian'),
            (   'ART_DEF_UNIT__SETTLER_AFRI',               'ART_DEF_UNIT_MEMBER_AFRIFEMALE4',                  'RED',  'LAND', 0.09,   1,          'LooseCivilian'),
            (   'ART_DEF_UNIT__SETTLER_AFRI',               'ART_DEF_UNIT_MEMBER_AFRIMALE1',                    'RED',  'LAND', 0.09,   1,          'LooseCivilian'),
            (   'ART_DEF_UNIT__SETTLER_AFRI',               'ART_DEF_UNIT_MEMBER_AFRIMALE2',                    'RED',  'LAND', 0.09,   1,          'LooseCivilian'),
            (   'ART_DEF_UNIT__SETTLER_AFRI',               'ART_DEF_UNIT_MEMBER_AFRIMALE3',                    'RED',  'LAND', 0.09,   1,          'LooseCivilian'),
            (   'ART_DEF_UNIT__SETTLER_AFRI',               'ART_DEF_UNIT_MEMBER_AFRIMALE4',                    'RED',  'LAND', 0.09,   1,          'LooseCivilian'),
            --RUG
            (   'ART_DEF_UNIT__SETTLER_AFRI',               'ART_DEF_UNIT_MEMBER_AFRICAMEL',                    'RUG',  'LAND', 0.18,   1,          'LooseCivilianRUG'),
            (   'ART_DEF_UNIT__SETTLER_AFRI',               'ART_DEF_UNIT_MEMBER_AFRIFEMALE1',                  'RUG',  'LAND', 0.18,   1,          'LooseCivilianRUG'),
            (   'ART_DEF_UNIT__SETTLER_AFRI',               'ART_DEF_UNIT_MEMBER_AFRIFEMALE2',                  'RUG',  'LAND', 0.18,   1,          'LooseCivilianRUG'),
            --(   'ART_DEF_UNIT__SETTLER_AFRI',               'ART_DEF_UNIT_MEMBER_AFRIFEMALE3',                  'RUG',  'LAND', 0.18,   1,          'LooseCivilianRUG'),
            --(   'ART_DEF_UNIT__SETTLER_AFRI',               'ART_DEF_UNIT_MEMBER_AFRIFEMALE4',                  'RUG',  'LAND', 0.18,   1,          'LooseCivilianRUG'),
            --(   'ART_DEF_UNIT__SETTLER_AFRI',               'ART_DEF_UNIT_MEMBER_AFRIMALE1',                    'RUG',  'LAND', 0.18,   1,          'LooseCivilianRUG'),
            (   'ART_DEF_UNIT__SETTLER_AFRI',               'ART_DEF_UNIT_MEMBER_AFRIMALE2',                    'RUG',  'LAND', 0.18,   1,          'LooseCivilianRUG'),
            (   'ART_DEF_UNIT__SETTLER_AFRI',               'ART_DEF_UNIT_MEMBER_AFRIMALE3',                    'RUG',  'LAND', 0.18,   1,          'LooseCivilianRUG'),
            --(   'ART_DEF_UNIT__SETTLER_AFRI',               'ART_DEF_UNIT_MEMBER_AFRIMALE4',                    'RUG',  'LAND', 0.18,   1,          'LooseCivilianRUG'),
            --SUG
            (   'ART_DEF_UNIT__SETTLER_AFRI',               'ART_DEF_UNIT_MEMBER_AFRICAMEL',                    'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT__SETTLER_AFRI',               'ART_DEF_UNIT_MEMBER_AFRIFEMALE1',                  'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT__SETTLER_AFRI',               'ART_DEF_UNIT_MEMBER_AFRIFEMALE2',                  'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT__SETTLER_AFRI',               'ART_DEF_UNIT_MEMBER_AFRIFEMALE3',                  'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT__SETTLER_AFRI',               'ART_DEF_UNIT_MEMBER_AFRIFEMALE4',                  'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT__SETTLER_AFRI',               'ART_DEF_UNIT_MEMBER_AFRIMALE1',                    'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT__SETTLER_AFRI',               'ART_DEF_UNIT_MEMBER_AFRIMALE2',                    'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT__SETTLER_AFRI',               'ART_DEF_UNIT_MEMBER_AFRIMALE3',                    'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT__SETTLER_AFRI',               'ART_DEF_UNIT_MEMBER_AFRIMALE4',                    'SUG',  'LAND', 0.25,   1,          ''),
        --  SETTLER AMERINDIAN
            --RED
            (   'ART_DEF_UNIT__SETTLER_AMER',               'ART_DEF_UNIT_MEMBER_AMERLLAMA',                    'RED',  'LAND', 0.09,   1,          'LooseCivilian'),
            (   'ART_DEF_UNIT__SETTLER_AMER',               'ART_DEF_UNIT_MEMBER_AMERFEMALE1',                  'RED',  'LAND', 0.09,   1,          'LooseCivilian'),
            (   'ART_DEF_UNIT__SETTLER_AMER',               'ART_DEF_UNIT_MEMBER_AMERFEMALE2',                  'RED',  'LAND', 0.09,   1,          'LooseCivilian'),
            (   'ART_DEF_UNIT__SETTLER_AMER',               'ART_DEF_UNIT_MEMBER_AMERFEMALE3',                  'RED',  'LAND', 0.09,   1,          'LooseCivilian'),
            (   'ART_DEF_UNIT__SETTLER_AMER',               'ART_DEF_UNIT_MEMBER_AMERFEMALE4',                  'RED',  'LAND', 0.09,   1,          'LooseCivilian'),
            (   'ART_DEF_UNIT__SETTLER_AMER',               'ART_DEF_UNIT_MEMBER_AMERMALE1',                    'RED',  'LAND', 0.09,   1,          'LooseCivilian'),
            (   'ART_DEF_UNIT__SETTLER_AMER',               'ART_DEF_UNIT_MEMBER_AMERMALE2',                    'RED',  'LAND', 0.09,   1,          'LooseCivilian'),
            (   'ART_DEF_UNIT__SETTLER_AMER',               'ART_DEF_UNIT_MEMBER_AMERMALE3',                    'RED',  'LAND', 0.09,   1,          'LooseCivilian'),
            (   'ART_DEF_UNIT__SETTLER_AMER',               'ART_DEF_UNIT_MEMBER_AMERMALE4',                    'RED',  'LAND', 0.09,   1,          'LooseCivilian'),
            --RUG
            (   'ART_DEF_UNIT__SETTLER_AMER',               'ART_DEF_UNIT_MEMBER_AMERLLAMA',                    'RUG',  'LAND', 0.165,  1,          'LooseCivilianRUG'),
            --(   'ART_DEF_UNIT__SETTLER_AMER',               'ART_DEF_UNIT_MEMBER_AMERFEMALE1',                  'RUG',  'LAND', 0.18,   1,          'LooseCivilianRUG'),
            (   'ART_DEF_UNIT__SETTLER_AMER',               'ART_DEF_UNIT_MEMBER_AMERFEMALE2',                  'RUG',  'LAND', 0.18,   1,          'LooseCivilianRUG'),
            (   'ART_DEF_UNIT__SETTLER_AMER',               'ART_DEF_UNIT_MEMBER_AMERFEMALE3',                  'RUG',  'LAND', 0.18,   1,          'LooseCivilianRUG'),
            --(   'ART_DEF_UNIT__SETTLER_AMER',               'ART_DEF_UNIT_MEMBER_AMERFEMALE4',                  'RUG',  'LAND', 0.18,   1,          'LooseCivilianRUG'),
            --(   'ART_DEF_UNIT__SETTLER_AMER',               'ART_DEF_UNIT_MEMBER_AMERMALE1',                    'RUG',  'LAND', 0.18,   1,          'LooseCivilianRUG'),
            (   'ART_DEF_UNIT__SETTLER_AMER',               'ART_DEF_UNIT_MEMBER_AMERMALE2',                    'RUG',  'LAND', 0.18,   1,          'LooseCivilianRUG'),
            (   'ART_DEF_UNIT__SETTLER_AMER',               'ART_DEF_UNIT_MEMBER_AMERMALE3',                    'RUG',  'LAND', 0.18,   1,          'LooseCivilianRUG'),
            --(   'ART_DEF_UNIT__SETTLER_AMER',               'ART_DEF_UNIT_MEMBER_AMERMALE4',                    'RUG',  'LAND', 0.18,   1,          'LooseCivilianRUG'),
            --SUG
            (   'ART_DEF_UNIT__SETTLER_AMER',               'ART_DEF_UNIT_MEMBER_AMERLLAMA',                    'SUG',  'LAND', 0.23,   1,          ''),
            --(   'ART_DEF_UNIT__SETTLER_AMER',               'ART_DEF_UNIT_MEMBER_AMERFEMALE1',                  'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT__SETTLER_AMER',               'ART_DEF_UNIT_MEMBER_AMERFEMALE2',                  'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT__SETTLER_AMER',               'ART_DEF_UNIT_MEMBER_AMERFEMALE3',                  'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT__SETTLER_AMER',               'ART_DEF_UNIT_MEMBER_AMERFEMALE4',                  'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT__SETTLER_AMER',               'ART_DEF_UNIT_MEMBER_AMERMALE1',                    'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT__SETTLER_AMER',               'ART_DEF_UNIT_MEMBER_AMERMALE2',                    'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT__SETTLER_AMER',               'ART_DEF_UNIT_MEMBER_AMERMALE3',                    'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT__SETTLER_AMER',               'ART_DEF_UNIT_MEMBER_AMERMALE4',                    'SUG',  'LAND', 0.25,   1,          ''),
        --  SETTLER ASIAN
            --RED
            (   'ART_DEF_UNIT__SETTLER_ASIA',               'ART_DEF_UNIT_MEMBER_SETTLERS_ASIAN_OX',            'RED',  'LAND', 0.055,  1,          'LooseCivilian'),
            (   'ART_DEF_UNIT__SETTLER_ASIA',               'ART_DEF_UNIT_MEMBER_SETTLERS_ASIAN_F1',            'RED',  'LAND', 0.09,   1,          'LooseCivilian'),
            (   'ART_DEF_UNIT__SETTLER_ASIA',               'ART_DEF_UNIT_MEMBER_SETTLERS_ASIAN_F2',            'RED',  'LAND', 0.09,   1,          'LooseCivilian'),
            (   'ART_DEF_UNIT__SETTLER_ASIA',               'ART_DEF_UNIT_MEMBER_SETTLERS_ASIAN_F3',            'RED',  'LAND', 0.09,   1,          'LooseCivilian'),
            (   'ART_DEF_UNIT__SETTLER_ASIA',               'ART_DEF_UNIT_MEMBER_SETTLERS_ASIAN_F4',            'RED',  'LAND', 0.09,   1,          'LooseCivilian'),
            (   'ART_DEF_UNIT__SETTLER_ASIA',               'ART_DEF_UNIT_MEMBER_SETTLERS_ASIAN_M1',            'RED',  'LAND', 0.09,   1,          'LooseCivilian'),
            (   'ART_DEF_UNIT__SETTLER_ASIA',               'ART_DEF_UNIT_MEMBER_SETTLERS_ASIAN_M2',            'RED',  'LAND', 0.09,   1,          'LooseCivilian'),
            (   'ART_DEF_UNIT__SETTLER_ASIA',               'ART_DEF_UNIT_MEMBER_SETTLERS_ASIAN_M3',            'RED',  'LAND', 0.09,   1,          'LooseCivilian'),
            (   'ART_DEF_UNIT__SETTLER_ASIA',               'ART_DEF_UNIT_MEMBER_SETTLERS_ASIAN_M4',            'RED',  'LAND', 0.09,   1,          'LooseCivilian'),
            --RUG
            (   'ART_DEF_UNIT__SETTLER_ASIA',               'ART_DEF_UNIT_MEMBER_SETTLERS_ASIAN_OX',            'RUG',  'LAND', 0.15,   1,          'LooseCivilianRUG'),
            --(   'ART_DEF_UNIT__SETTLER_ASIA',               'ART_DEF_UNIT_MEMBER_SETTLERS_ASIAN_F1',            'RUG',  'LAND', 0.18,   1,          'LooseCivilianRUG'),
            (   'ART_DEF_UNIT__SETTLER_ASIA',               'ART_DEF_UNIT_MEMBER_SETTLERS_ASIAN_F2',            'RUG',  'LAND', 0.18,   1,          'LooseCivilianRUG'),
            (   'ART_DEF_UNIT__SETTLER_ASIA',               'ART_DEF_UNIT_MEMBER_SETTLERS_ASIAN_F3',            'RUG',  'LAND', 0.18,   1,          'LooseCivilianRUG'),
            --(   'ART_DEF_UNIT__SETTLER_ASIA',               'ART_DEF_UNIT_MEMBER_SETTLERS_ASIAN_F4',            'RUG',  'LAND', 0.18,   1,          'LooseCivilianRUG'),
            --(   'ART_DEF_UNIT__SETTLER_ASIA',               'ART_DEF_UNIT_MEMBER_SETTLERS_ASIAN_M1',            'RUG',  'LAND', 0.18,   1,          'LooseCivilianRUG'),
            (   'ART_DEF_UNIT__SETTLER_ASIA',               'ART_DEF_UNIT_MEMBER_SETTLERS_ASIAN_M2',            'RUG',  'LAND', 0.18,   1,          'LooseCivilianRUG'),
            --(   'ART_DEF_UNIT__SETTLER_ASIA',               'ART_DEF_UNIT_MEMBER_SETTLERS_ASIAN_M3',            'RUG',  'LAND', 0.18,   1,          'LooseCivilianRUG'),
            (   'ART_DEF_UNIT__SETTLER_ASIA',               'ART_DEF_UNIT_MEMBER_SETTLERS_ASIAN_M4',            'RUG',  'LAND', 0.18,   1,          'LooseCivilianRUG'),
            --SUG
            (   'ART_DEF_UNIT__SETTLER_ASIA',               'ART_DEF_UNIT_MEMBER_SETTLERS_ASIAN_OX',            'SUG',  'LAND', 0.23,   1,          ''),
            --(   'ART_DEF_UNIT__SETTLER_ASIA',               'ART_DEF_UNIT_MEMBER_SETTLERS_ASIAN_F1',            'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT__SETTLER_ASIA',               'ART_DEF_UNIT_MEMBER_SETTLERS_ASIAN_F2',            'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT__SETTLER_ASIA',               'ART_DEF_UNIT_MEMBER_SETTLERS_ASIAN_F3',            'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT__SETTLER_ASIA',               'ART_DEF_UNIT_MEMBER_SETTLERS_ASIAN_F4',            'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT__SETTLER_ASIA',               'ART_DEF_UNIT_MEMBER_SETTLERS_ASIAN_M1',            'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT__SETTLER_ASIA',               'ART_DEF_UNIT_MEMBER_SETTLERS_ASIAN_M2',            'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT__SETTLER_ASIA',               'ART_DEF_UNIT_MEMBER_SETTLERS_ASIAN_M3',            'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT__SETTLER_ASIA',               'ART_DEF_UNIT_MEMBER_SETTLERS_ASIAN_M4',            'SUG',  'LAND', 0.25,   1,          ''),
        --  SETTLER EURO
            --RED
            (   'ART_DEF_UNIT__SETTLER',                    'ART_DEF_UNIT_MEMBER_EURODONKEY',                   'RED',  'LAND', 0.085,  1,          'LooseCivilian'),
            (   'ART_DEF_UNIT__SETTLER',                    'ART_DEF_UNIT_MEMBER_EUROFEMALE18',                 'RED',  'LAND', 0.09,   1,          'LooseCivilian'),
            (   'ART_DEF_UNIT__SETTLER',                    'ART_DEF_UNIT_MEMBER_EUROFEMALE25',                 'RED',  'LAND', 0.09,   1,          'LooseCivilian'),
            (   'ART_DEF_UNIT__SETTLER',                    'ART_DEF_UNIT_MEMBER_EUROFEMALE35',                 'RED',  'LAND', 0.09,   1,          'LooseCivilian'),
            (   'ART_DEF_UNIT__SETTLER',                    'ART_DEF_UNIT_MEMBER_EUROFEMALE40',                 'RED',  'LAND', 0.09,   1,          'LooseCivilian'),
            (   'ART_DEF_UNIT__SETTLER',                    'ART_DEF_UNIT_MEMBER_EUROMALE20',                   'RED',  'LAND', 0.09,   1,          'LooseCivilian'),
            (   'ART_DEF_UNIT__SETTLER',                    'ART_DEF_UNIT_MEMBER_EUROMALE25',                   'RED',  'LAND', 0.09,   1,          'LooseCivilian'),
            (   'ART_DEF_UNIT__SETTLER',                    'ART_DEF_UNIT_MEMBER_EUROMALE35',                   'RED',  'LAND', 0.09,   1,          'LooseCivilian'),
            (   'ART_DEF_UNIT__SETTLER',                    'ART_DEF_UNIT_MEMBER_EUROMALE45',                   'RED',  'LAND', 0.09,   1,          'LooseCivilian'),
            --RUG
            (   'ART_DEF_UNIT__SETTLER',                    'ART_DEF_UNIT_MEMBER_EURODONKEY',                   'RUG',  'LAND', 0.175,  1,          'LooseCivilianRUG'),
            --(   'ART_DEF_UNIT__SETTLER',                    'ART_DEF_UNIT_MEMBER_EUROFEMALE18',                 'RUG',  'LAND', 0.18,   1,          'LooseCivilianRUG'),
            (   'ART_DEF_UNIT__SETTLER',                    'ART_DEF_UNIT_MEMBER_EUROFEMALE25',                 'RUG',  'LAND', 0.18,   1,          'LooseCivilianRUG'),
            --(   'ART_DEF_UNIT__SETTLER',                    'ART_DEF_UNIT_MEMBER_EUROFEMALE35',                 'RUG',  'LAND', 0.18,   1,          'LooseCivilianRUG'),
            (   'ART_DEF_UNIT__SETTLER',                    'ART_DEF_UNIT_MEMBER_EUROFEMALE40',                 'RUG',  'LAND', 0.18,   1,          'LooseCivilianRUG'),
            --(   'ART_DEF_UNIT__SETTLER',                    'ART_DEF_UNIT_MEMBER_EUROMALE20',                   'RUG',  'LAND', 0.18,   1,          'LooseCivilianRUG'),
            (   'ART_DEF_UNIT__SETTLER',                    'ART_DEF_UNIT_MEMBER_EUROMALE25',                   'RUG',  'LAND', 0.18,   1,          'LooseCivilianRUG'),
            (   'ART_DEF_UNIT__SETTLER',                    'ART_DEF_UNIT_MEMBER_EUROMALE35',                   'RUG',  'LAND', 0.18,   1,          'LooseCivilianRUG'),
            --(   'ART_DEF_UNIT__SETTLER',                    'ART_DEF_UNIT_MEMBER_EUROMALE45',                   'RUG',  'LAND', 0.18,   1,          'LooseCivilianRUG'),
            --SUG
            (   'ART_DEF_UNIT__SETTLER',                    'ART_DEF_UNIT_MEMBER_EURODONKEY',                   'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT__SETTLER',                    'ART_DEF_UNIT_MEMBER_EUROFEMALE18',                 'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT__SETTLER',                    'ART_DEF_UNIT_MEMBER_EUROFEMALE25',                 'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT__SETTLER',                    'ART_DEF_UNIT_MEMBER_EUROFEMALE35',                 'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT__SETTLER',                    'ART_DEF_UNIT_MEMBER_EUROFEMALE40',                 'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT__SETTLER',                    'ART_DEF_UNIT_MEMBER_EUROMALE20',                   'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT__SETTLER',                    'ART_DEF_UNIT_MEMBER_EUROMALE25',                   'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT__SETTLER',                    'ART_DEF_UNIT_MEMBER_EUROMALE35',                   'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT__SETTLER',                    'ART_DEF_UNIT_MEMBER_EUROMALE45',                   'SUG',  'LAND', 0.25,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  UTILITY UNITS
        ------- UnitInfo ---------------------------------- UnitMemberInfo ------------------------------------ Type -- Domain  Scale - NumMembers  Formation -------------------
        --  WORKER (EARLY)
            (   'ART_DEF_UNIT__WORKER',                     'ART_DEF_UNIT_MEMBER_WORKER_EURO',                  'RED',  'LAND', 0.09,   8,          'LooseCivilian'),
            (   'ART_DEF_UNIT__WORKER',                     'ART_DEF_UNIT_MEMBER_WORKER_EURO',                  'RUG',  'LAND', 0.18,   3,          'EarlyGreatArtistRUG'),
            (   'ART_DEF_UNIT__WORKER',                     'ART_DEF_UNIT_MEMBER_WORKER_EURO',                  'SUG',  'LAND', 0.25,   1,          ''),
        --  WORKER (MODERN)
            (   'ART_DEF_UNIT__WORKER_MODERN',              'ART_DEF_UNIT_MEMBER_WORKER_EURO_LATE',             'RED',  'LAND', 0.09,   8,          'LooseCivilian'),
            (   'ART_DEF_UNIT__WORKER_MODERN',              'ART_DEF_UNIT_MEMBER_WORKER_EURO_LATE',             'RUG',  'LAND', 0.18,   3,          'EarlyGreatArtistRUG'),
            (   'ART_DEF_UNIT__WORKER_MODERN',              'ART_DEF_UNIT_MEMBER_WORKER_EURO_LATE',             'SUG',  'LAND', 0.25,   1,          ''),
        --  WORKBOAT (EARLY)
            (   'ART_DEF_UNIT_WORKBOAT',                    'ART_DEF_UNIT_MEMBER_WORKBOAT',                     'RED',  'SEA',  0.058,  3,          'Flotilla'),
            (   'ART_DEF_UNIT_WORKBOAT',                    'ART_DEF_UNIT_MEMBER_WORKBOAT',                     'RUG',  'SEA',  0.098,  2,          'ColombRUG'),
            (   'ART_DEF_UNIT_WORKBOAT',                    'ART_DEF_UNIT_MEMBER_WORKBOAT',                     'SUG',  'SEA',  0.148,  1,          ''),
        --  WORKBOAT (INDUSTRIAL)
            (   'ART_DEF_UNIT_WORKBOAT_MODERN',             'ART_DEF_UNIT_MEMBER_WORKBOAT_INDUSTRIAL',          'RED',  'SEA',  0.065,  2,          'Flotilla'),
            (   'ART_DEF_UNIT_WORKBOAT_MODERN',             'ART_DEF_UNIT_MEMBER_WORKBOAT_INDUSTRIAL',          'RUG',  'SEA',  0.105,  2,          'NelsonRUG'),
            (   'ART_DEF_UNIT_WORKBOAT_MODERN',             'ART_DEF_UNIT_MEMBER_WORKBOAT_INDUSTRIAL',          'SUG',  'SEA',  0.152,  1,          ''),
        --  ARCHAEOLOGIST
            --RED
            (   'ART_DEF_UNIT_ARCHAEOLOGIST',               'ART_DEF_UNIT_MEMBER_ARCHAEOLOGIST',                'RED',  'LAND', 0.09,   1,          'GreatArtist'),
            (   'ART_DEF_UNIT_ARCHAEOLOGIST',               'ART_DEF_UNIT_MEMBER_ARCHAEOLOGIST_F1',             'RED',  'LAND', 0.09,   2,          'GreatArtist'),
            (   'ART_DEF_UNIT_ARCHAEOLOGIST',               'ART_DEF_UNIT_MEMBER_ARCHAEOLOGIST_F2',             'RED',  'LAND', 0.09,   4,          'GreatArtist'),
            --RUG
            (   'ART_DEF_UNIT_ARCHAEOLOGIST',               'ART_DEF_UNIT_MEMBER_ARCHAEOLOGIST',                'RUG',  'LAND', 0.18,   1,          'DefaultCavalryRUG'),
            (   'ART_DEF_UNIT_ARCHAEOLOGIST',               'ART_DEF_UNIT_MEMBER_ARCHAEOLOGIST_F1',             'RUG',  'LAND', 0.18,   1,          'DefaultCavalryRUG'),
            (   'ART_DEF_UNIT_ARCHAEOLOGIST',               'ART_DEF_UNIT_MEMBER_ARCHAEOLOGIST_F2',             'RUG',  'LAND', 0.18,   1,          'DefaultCavalryRUG'),
            --SUG
            --(   'ART_DEF_UNIT_ARCHAEOLOGIST',               'ART_DEF_UNIT_MEMBER_ARCHAEOLOGIST',                'SUG',  'LAND', 0.25,   1,          ''),
            (   'ART_DEF_UNIT_ARCHAEOLOGIST',               'ART_DEF_UNIT_MEMBER_ARCHAEOLOGIST_F1',             'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT_ARCHAEOLOGIST',               'ART_DEF_UNIT_MEMBER_ARCHAEOLOGIST_F2',             'SUG',  'LAND', 0.25,   1,          ''),
        --  SPACE SHIP - BOOSTER
            (   'ART_DEF_UNIT_SS_BOOSTER',                  'ART_DEF_UNIT_MEMBER_SS_BOOSTER',                   'RED',  'LAND', 0.14,   1,          ''),
            (   'ART_DEF_UNIT_SS_BOOSTER',                  'ART_DEF_UNIT_MEMBER_SS_BOOSTER',                   'RUG',  'LAND', 0.165,  1,          ''),
            (   'ART_DEF_UNIT_SS_BOOSTER',                  'ART_DEF_UNIT_MEMBER_SS_BOOSTER',                   'SUG',  'LAND', 0.19,   1,          ''),
        --  SPACE SHIP - CAPSULE
            (   'ART_DEF_UNIT_SS_CAPSULE',                  'ART_DEF_UNIT_MEMBER_SS_CAPSULE',                   'RED',  'LAND', 0.14,   1,          ''),
            (   'ART_DEF_UNIT_SS_CAPSULE',                  'ART_DEF_UNIT_MEMBER_SS_CAPSULE',                   'RUG',  'LAND', 0.165,  1,          ''),
            (   'ART_DEF_UNIT_SS_CAPSULE',                  'ART_DEF_UNIT_MEMBER_SS_CAPSULE',                   'SUG',  'LAND', 0.19,   1,          ''),
        --  SPACE SHIP - ENGINE
            (   'ART_DEF_UNIT_SS_ENGINE',                   'ART_DEF_UNIT_MEMBER_SS_ENGINE',                    'RED',  'LAND', 0.14,   1,          ''),
            (   'ART_DEF_UNIT_SS_ENGINE',                   'ART_DEF_UNIT_MEMBER_SS_ENGINE',                    'RUG',  'LAND', 0.165,  1,          ''),
            (   'ART_DEF_UNIT_SS_ENGINE',                   'ART_DEF_UNIT_MEMBER_SS_ENGINE',                    'SUG',  'LAND', 0.19,   1,          ''),
        --  SPACE SHIP - STASIS CHAMBER
            (   'ART_DEF_UNIT_SS_STASIS_CHAMBER',           'ART_DEF_UNIT_MEMBER_SS_STASIS_CHAMBER',            'RED',  'LAND', 0.14,   1,          ''),
            (   'ART_DEF_UNIT_SS_STASIS_CHAMBER',           'ART_DEF_UNIT_MEMBER_SS_STASIS_CHAMBER',            'RUG',  'LAND', 0.165,  1,          ''),
            (   'ART_DEF_UNIT_SS_STASIS_CHAMBER',           'ART_DEF_UNIT_MEMBER_SS_STASIS_CHAMBER',            'SUG',  'LAND', 0.19,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  TRADE UNITS
        ------- UnitInfo ---------------------------------- UnitMemberInfo ------------------------------------ Type -- Domain  Scale - NumMembers  Formation -------------------
        --  CARAVAN (EARLY)
            --RED
            (   'ART_DEF_UNIT_CARAVAN',                     'ART_DEF_UNIT_MEMBER_CARAVAN',                      'RED',  'LAND', 0.085,  1,          'ThreeInLine'),
            (   'ART_DEF_UNIT_CARAVAN',                     'ART_DEF_UNIT_MEMBER_CARAVAN_F1',                   'RED',  'LAND', 0.085,  1,          'ThreeInLine'),
            (   'ART_DEF_UNIT_CARAVAN',                     'ART_DEF_UNIT_MEMBER_CARAVAN_F2',                   'RED',  'LAND', 0.085,  1,          'ThreeInLine'),
            --RUG
            (   'ART_DEF_UNIT_CARAVAN',                     'ART_DEF_UNIT_MEMBER_CARAVAN',                      'RUG',  'LAND', 0.17,   1,          'ThreeInLineRUG'),
            (   'ART_DEF_UNIT_CARAVAN',                     'ART_DEF_UNIT_MEMBER_CARAVAN_F1',                   'RUG',  'LAND', 0.17,   1,          'ThreeInLineRUG'),
            --(   'ART_DEF_UNIT_CARAVAN',                     'ART_DEF_UNIT_MEMBER_CARAVAN_F2',                   'RUG',  'LAND', 0.17,   1,          'ThreeInLineRUG'),
            --SUG
            (   'ART_DEF_UNIT_CARAVAN',                     'ART_DEF_UNIT_MEMBER_CARAVAN',                      'SUG',  'LAND', 0.24,   1,          ''),
            --(   'ART_DEF_UNIT_CARAVAN',                     'ART_DEF_UNIT_MEMBER_CARAVAN_F1',                   'SUG',  'LAND', 0.24,   1,          ''),
            --(   'ART_DEF_UNIT_CARAVAN',                     'ART_DEF_UNIT_MEMBER_CARAVAN_F2',                   'SUG',  'LAND', 0.24,   1,          ''),
        --  CARAVAN (LATE)
            --RED
            (   'ART_DEF_UNIT_CARAVAN_MODERN',              'ART_DEF_UNIT_MEMBER_CARAVAN_LATE',                 'RED',  'LAND', 0.035,  1,          'TheeInLineStag'),
            (   'ART_DEF_UNIT_CARAVAN_MODERN',              'ART_DEF_UNIT_MEMBER_CARAVAN_LATE_F1',              'RED',  'LAND', 0.035,  1,          'TheeInLineStag'),
            (   'ART_DEF_UNIT_CARAVAN_MODERN',              'ART_DEF_UNIT_MEMBER_CARAVAN_LATE_F2',              'RED',  'LAND', 0.035,  1,          'TheeInLineStag'),
            --RUG
            (   'ART_DEF_UNIT_CARAVAN_MODERN',              'ART_DEF_UNIT_MEMBER_CARAVAN_LATE',                 'RUG',  'LAND', 0.115,  1,          'TheeInLineStagRUG'),
            --(   'ART_DEF_UNIT_CARAVAN_MODERN',              'ART_DEF_UNIT_MEMBER_CARAVAN_LATE_F1',              'RUG',  'LAND', 0.115,  1,          'TheeInLineStagRUG'),
            (   'ART_DEF_UNIT_CARAVAN_MODERN',              'ART_DEF_UNIT_MEMBER_CARAVAN_LATE_F2',              'RUG',  'LAND', 0.115,  1,          'TheeInLineStagRUG'),
            --SUG
            (   'ART_DEF_UNIT_CARAVAN_MODERN',              'ART_DEF_UNIT_MEMBER_CARAVAN_LATE',                 'SUG',  'LAND', 0.053,  1,          ''),
            --(   'ART_DEF_UNIT_CARAVAN_MODERN',              'ART_DEF_UNIT_MEMBER_CARAVAN_LATE_F1',              'SUG',  'LAND', 0.053,  1,          ''),
            --(   'ART_DEF_UNIT_CARAVAN_MODERN',              'ART_DEF_UNIT_MEMBER_CARAVAN_LATE_F2',              'SUG',  'LAND', 0.053,  1,          ''),
        --  CARGO SHIP (EARLY)
            (   'ART_DEF_UNIT_CARGO_SHIP',                  'ART_DEF_UNIT_MEMBER_CARGO_SHIP',                   'RED',  'SEA',  0.085,  3,          'Flotilla'),
            (   'ART_DEF_UNIT_CARGO_SHIP',                  'ART_DEF_UNIT_MEMBER_CARGO_SHIP',                   'RUG',  'SEA',  0.17,   2,          'NelsonRUG'),
            (   'ART_DEF_UNIT_CARGO_SHIP',                  'ART_DEF_UNIT_MEMBER_CARGO_SHIP',                   'SUG',  'SEA',  0.24,   1,          ''),
        --  CARGO SHIP (RENAISSANCE)
            (   'ART_DEF_UNIT_CARGO_SHIP_RENAISSANCE',      'ART_DEF_UNIT_MEMBER_CARGO_SHIP_MID',               'RED',  'SEA',  0.085,  3,          'Flotilla'),
            (   'ART_DEF_UNIT_CARGO_SHIP_RENAISSANCE',      'ART_DEF_UNIT_MEMBER_CARGO_SHIP_MID',               'RUG',  'SEA',  0.17,   2,          'NelsonRUG'),
            (   'ART_DEF_UNIT_CARGO_SHIP_RENAISSANCE',      'ART_DEF_UNIT_MEMBER_CARGO_SHIP_MID',               'SUG',  'SEA',  0.235,  1,          ''),
        --  CARGO SHIP (MODERN)
            (   'ART_DEF_UNIT_CARGO_SHIP_MODERN',           'ART_DEF_UNIT_MEMBER_CARGO_SHIP_LATE',              'RED',  'SEA',  0.08,   1,          'DefaultCavalry'),
            (   'ART_DEF_UNIT_CARGO_SHIP_MODERN',           'ART_DEF_UNIT_MEMBER_CARGO_SHIP_LATE',              'RUG',  'SEA',  0.105,  1,          'DefaultCavalryRUG'),
            (   'ART_DEF_UNIT_CARGO_SHIP_MODERN',           'ART_DEF_UNIT_MEMBER_CARGO_SHIP_LATE',              'SUG',  'SEA',  0.135,  1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  RELIGIOUS UNITS
        ------- UnitInfo ---------------------------------- UnitMemberInfo ------------------------------------ Type -- Domain  Scale - NumMembers  Formation -------------------
        --  INQUISITOR
            --RED: 5 Members (Wedge: Center-Right-Left-Right-Left)
            (   'ART_DEF_UNIT_INQUISITOR',                  'ART_DEF_UNIT_MEMBER_INQUISITOR',                   'RED',  'LAND', 0.09,   1,          'EarlyGreatArtist'),
            (   'ART_DEF_UNIT_INQUISITOR',                  'ART_DEF_UNIT_MEMBER_INQUISITOR_01',                'RED',  'LAND', 0.093,  1,          'EarlyGreatArtist'),
            (   'ART_DEF_UNIT_INQUISITOR',                  'ART_DEF_UNIT_MEMBER_INQUISITOR_02',                'RED',  'LAND', 0.093,  1,          'EarlyGreatArtist'),
            (   'ART_DEF_UNIT_INQUISITOR',                  'ART_DEF_UNIT_MEMBER_INQUISITOR_02',                'RED',  'LAND', 0.093,  1,          'EarlyGreatArtist'),
            (   'ART_DEF_UNIT_INQUISITOR',                  'ART_DEF_UNIT_MEMBER_INQUISITOR_01',                'RED',  'LAND', 0.093,  1,          'EarlyGreatArtist'),
            --RUG
            (   'ART_DEF_UNIT_INQUISITOR',                  'ART_DEF_UNIT_MEMBER_INQUISITOR',                   'RUG',  'LAND', 0.18,   1,          'EarlyGreatArtistRUG'),
            (   'ART_DEF_UNIT_INQUISITOR',                  'ART_DEF_UNIT_MEMBER_INQUISITOR_01',                'RUG',  'LAND', 0.182,  1,          'EarlyGreatArtistRUG'),
            --(   'ART_DEF_UNIT_INQUISITOR',                  'ART_DEF_UNIT_MEMBER_INQUISITOR_02',                'RUG',  'LAND', 0.182,  1,          'EarlyGreatArtistRUG'),
            --SUG
            (   'ART_DEF_UNIT_INQUISITOR',                  'ART_DEF_UNIT_MEMBER_INQUISITOR',                   'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT_INQUISITOR',                  'ART_DEF_UNIT_MEMBER_INQUISITOR_01',                'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT_INQUISITOR',                  'ART_DEF_UNIT_MEMBER_INQUISITOR_02',                'SUG',  'LAND', 0.25,   1,          ''),
        --  MISSIONARY
            --RED: 5 Members (Wedge: Center-Right-Left-Right-Left)
            (   'ART_DEF_UNIT_MISSIONARY',                  'ART_DEF_UNIT_MEMBER_MISSIONARY',                   'RED',  'LAND', 0.09,   1,          'EarlyGreatArtist'),
            (   'ART_DEF_UNIT_MISSIONARY',                  'ART_DEF_UNIT_MEMBER_MISSIONARY_01',                'RED',  'LAND', 0.09,   1,          'EarlyGreatArtist'),
            (   'ART_DEF_UNIT_MISSIONARY',                  'ART_DEF_UNIT_MEMBER_MISSIONARY_02',                'RED',  'LAND', 0.09,   1,          'EarlyGreatArtist'),
            (   'ART_DEF_UNIT_MISSIONARY',                  'ART_DEF_UNIT_MEMBER_MISSIONARY_02',                'RED',  'LAND', 0.09,   1,          'EarlyGreatArtist'),
            (   'ART_DEF_UNIT_MISSIONARY',                  'ART_DEF_UNIT_MEMBER_MISSIONARY_01',                'RED',  'LAND', 0.09,   1,          'EarlyGreatArtist'),
            --RUG
            (   'ART_DEF_UNIT_MISSIONARY',                  'ART_DEF_UNIT_MEMBER_MISSIONARY',                   'RUG',  'LAND', 0.18,   1,          'EarlyGreatArtistRUG'),
            --(   'ART_DEF_UNIT_MISSIONARY',                  'ART_DEF_UNIT_MEMBER_MISSIONARY_01',                'RUG',  'LAND', 0.18,   1,          'EarlyGreatArtistRUG'),
            (   'ART_DEF_UNIT_MISSIONARY',                  'ART_DEF_UNIT_MEMBER_MISSIONARY_02',                'RUG',  'LAND', 0.18,   1,          'EarlyGreatArtistRUG'),
            --SUG
            (   'ART_DEF_UNIT_MISSIONARY',                  'ART_DEF_UNIT_MEMBER_MISSIONARY',                   'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT_MISSIONARY',                  'ART_DEF_UNIT_MEMBER_MISSIONARY_01',                'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT_MISSIONARY',                  'ART_DEF_UNIT_MEMBER_MISSIONARY_02',                'SUG',  'LAND', 0.25,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  GREAT PERSON UNITS
        ------- UnitInfo ---------------------------------- UnitMemberInfo ------------------------------------ Type -- Domain  Scale - NumMembers  Formation -------------------
        --	GREAT ENGINEER (EARLY)
            (   'ART_DEF_UNIT_ENGINEER',                    'ART_DEF_UNIT_MEMBER_GREATENGINEER_EARLY',          'RED',  'LAND', 0.09,   1,          ''),
            (   'ART_DEF_UNIT_ENGINEER',                    'ART_DEF_UNIT_MEMBER_GREATENGINEER_EARLY',          'RUG',  'LAND', 0.17,   1,          ''),
            (   'ART_DEF_UNIT_ENGINEER',                    'ART_DEF_UNIT_MEMBER_GREATENGINEER_EARLY',          'SUG',  'LAND', 0.238,  1,          ''),
        --	GREAT ENGINEER (LATE)
            (   'ART_DEF_UNIT_ENGINEER_LATE',               'ART_DEF_UNIT_MEMBER_GREATENGINEER_LATE',           'RED',  'LAND', 0.08,   1,          ''),
            (   'ART_DEF_UNIT_ENGINEER_LATE',               'ART_DEF_UNIT_MEMBER_GREATENGINEER_LATE',           'RUG',  'LAND', 0.16,   1,          ''),
            (   'ART_DEF_UNIT_ENGINEER_LATE',               'ART_DEF_UNIT_MEMBER_GREATENGINEER_LATE',           'SUG',  'LAND', 0.16,  1,          ''),
        --	GREAT MERCHANT (EARLY)
            --RED
            (   'ART_DEF_UNIT_MERCHANT',                    'ART_DEF_UNIT_MEMBER_GREATMERCHANT_EARLY_LEADER',   'RED',  'LAND', 0.085,  1,          'EarlyGreatMerchant'),
            (   'ART_DEF_UNIT_MERCHANT',                    'ART_DEF_UNIT_MEMBER_GREATMERCHANT_EARLY_CAMEL_V1', 'RED',  'LAND', 0.085,  1,          'EarlyGreatMerchant'),
            (   'ART_DEF_UNIT_MERCHANT',                    'ART_DEF_UNIT_MEMBER_GREATMERCHANT_EARLY_CAMEL_V2', 'RED',  'LAND', 0.085,  1,          'EarlyGreatMerchant'),
            --RUG
            (   'ART_DEF_UNIT_MERCHANT',                    'ART_DEF_UNIT_MEMBER_GREATMERCHANT_EARLY_LEADER',   'RUG',  'LAND', 0.165,  1,          'EarlyGreatMerchantRUG'),
            --(   'ART_DEF_UNIT_MERCHANT',                    'ART_DEF_UNIT_MEMBER_GREATMERCHANT_EARLY_CAMEL_V1', 'RUG',  'LAND', 0.165,  1,          'EarlyGreatMerchantRUG'),
            (   'ART_DEF_UNIT_MERCHANT',                    'ART_DEF_UNIT_MEMBER_GREATMERCHANT_EARLY_CAMEL_V2', 'RUG',  'LAND', 0.165,  1,          'EarlyGreatMerchantRUG'),
            --SUG
            (   'ART_DEF_UNIT_MERCHANT',                    'ART_DEF_UNIT_MEMBER_GREATMERCHANT_EARLY_LEADER',   'SUG',  'LAND', 0.238,  1,          ''),
            --(   'ART_DEF_UNIT_MERCHANT',                    'ART_DEF_UNIT_MEMBER_GREATMERCHANT_EARLY_CAMEL_V1', 'SUG',  'LAND', 0.238,  1,          ''),
            --(   'ART_DEF_UNIT_MERCHANT',                    'ART_DEF_UNIT_MEMBER_GREATMERCHANT_EARLY_CAMEL_V2', 'SUG',  'LAND', 0.238,  1,          ''),
        --	GREAT MERCHANT (LATE)
            (   'ART_DEF_UNIT_MERCHANT_LATE',               'ART_DEF_UNIT_MEMBER_GREATMERCHANT_LATE',           'RED',  'LAND', 0.085,  1,          ''),
            (   'ART_DEF_UNIT_MERCHANT_LATE',               'ART_DEF_UNIT_MEMBER_GREATMERCHANT_LATE',           'RUG',  'LAND', 0.145,  1,          ''),
            (   'ART_DEF_UNIT_MERCHANT_LATE',               'ART_DEF_UNIT_MEMBER_GREATMERCHANT_LATE',           'SUG',  'LAND', 0.19,  1,          ''),
        --	GREAT SCIENTIST (EARLY)
            (   'ART_DEF_UNIT_SCIENTIST',                   'ART_DEF_UNIT_MEMBER_GREATSCIENTIST_EARLY',         'RED',  'LAND', 0.09,   1,          ''),
            (   'ART_DEF_UNIT_SCIENTIST',                   'ART_DEF_UNIT_MEMBER_GREATSCIENTIST_EARLY',         'RUG',  'LAND', 0.17,   1,          ''),
            (   'ART_DEF_UNIT_SCIENTIST',                   'ART_DEF_UNIT_MEMBER_GREATSCIENTIST_EARLY',         'SUG',  'LAND', 0.235,  1,          ''),
        --	GREAT SCIENTIST (LATE)
            (   'ART_DEF_UNIT_SCIENTIST_LATE',              'ART_DEF_UNIT_MEMBER_GREATSCIENTIST_LATE',          'RED',  'LAND', 0.09,   1,          ''),
            (   'ART_DEF_UNIT_SCIENTIST_LATE',              'ART_DEF_UNIT_MEMBER_GREATSCIENTIST_LATE',          'RUG',  'LAND', 0.16,   1,          ''),
            (   'ART_DEF_UNIT_SCIENTIST_LATE',              'ART_DEF_UNIT_MEMBER_GREATSCIENTIST_LATE',          'SUG',  'LAND', 0.235,  1,          ''),
        --	GREAT WRITER (EARLY)
            --RED: 1ST ROW - 3 Members (Flat: Center-Right-Left)
            (   'ART_DEF_UNIT_GREAT_WRITER',                'ART_DEF_UNIT_MEMBER_GREAT_WRITER',                 'RED',  'LAND', 0.09,   1,          'GreatArtist'),
            (   'ART_DEF_UNIT_GREAT_WRITER',                'ART_DEF_UNIT_MEMBER_GREAT_WRITER_F1',              'RED',  'LAND', 0.09,   1,          'GreatArtist'),
            (   'ART_DEF_UNIT_GREAT_WRITER',                'ART_DEF_UNIT_MEMBER_GREAT_WRITER_F2',              'RED',  'LAND', 0.09,   1,          'GreatArtist'),
            --RED: 2ND ROW - 4 Members (Flat: InnerLeft-InnerRight-OuterLeft-OuterRight)
            (   'ART_DEF_UNIT_GREAT_WRITER',                'ART_DEF_UNIT_MEMBER_GREAT_WRITER_F1',              'RED',  'LAND', 0.09,   1,          'GreatArtist'),
            (   'ART_DEF_UNIT_GREAT_WRITER',                'ART_DEF_UNIT_MEMBER_GREAT_WRITER_F2',              'RED',  'LAND', 0.09,   1,          'GreatArtist'),
            --RUG
            (   'ART_DEF_UNIT_GREAT_WRITER',                'ART_DEF_UNIT_MEMBER_GREAT_WRITER',                 'RUG',  'LAND', 0.18,   1,          'EarlyGreatArtistRUG'),
            (   'ART_DEF_UNIT_GREAT_WRITER',                'ART_DEF_UNIT_MEMBER_GREAT_WRITER_F1',              'RUG',  'LAND', 0.18,   1,          'EarlyGreatArtistRUG'),
            --(   'ART_DEF_UNIT_GREAT_WRITER',                'ART_DEF_UNIT_MEMBER_GREAT_WRITER_F2',              'RUG',  'LAND', 0.18,   1,          'EarlyGreatArtistRUG'),
            --SUG
            (   'ART_DEF_UNIT_GREAT_WRITER',                'ART_DEF_UNIT_MEMBER_GREAT_WRITER',                 'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT_GREAT_WRITER',                'ART_DEF_UNIT_MEMBER_GREAT_WRITER_F1',              'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT_GREAT_WRITER',                'ART_DEF_UNIT_MEMBER_GREAT_WRITER_F2',              'SUG',  'LAND', 0.25,   1,          ''),
        --	GREAT WRITER (POSTMODERN)
            --RED: 1ST ROW - 3 Members (Flat: Center-Right-Left)
            (   'ART_DEF_UNIT_GREAT_WRITER_POSTMODERN',     'ART_DEF_UNIT_MEMBER_GREAT_WRITER_LATE',            'RED',  'LAND', 0.09,   1,          'GreatArtist'),
            (   'ART_DEF_UNIT_GREAT_WRITER_POSTMODERN',     'ART_DEF_UNIT_MEMBER_GREAT_WRITER_LATE_F1',         'RED',  'LAND', 0.09,   1,          'GreatArtist'),
            (   'ART_DEF_UNIT_GREAT_WRITER_POSTMODERN',     'ART_DEF_UNIT_MEMBER_GREAT_WRITER_LATE_F2',         'RED',  'LAND', 0.09,   1,          'GreatArtist'),
            --RED: 2ND ROW - 4 Members (Flat: InnerLeft-InnerRight-OuterLeft-OuterRight)
            (   'ART_DEF_UNIT_GREAT_WRITER_POSTMODERN',     'ART_DEF_UNIT_MEMBER_GREAT_WRITER_LATE_F1',         'RED',  'LAND', 0.09,   1,          'GreatArtist'),
            (   'ART_DEF_UNIT_GREAT_WRITER_POSTMODERN',     'ART_DEF_UNIT_MEMBER_GREAT_WRITER_LATE_F2',         'RED',  'LAND', 0.09,   1,          'GreatArtist'),
            --RUG
            (   'ART_DEF_UNIT_GREAT_WRITER_POSTMODERN',     'ART_DEF_UNIT_MEMBER_GREAT_WRITER_LATE',            'RUG',  'LAND', 0.18,   1,          'EarlyGreatArtistRUG'),
            (   'ART_DEF_UNIT_GREAT_WRITER_POSTMODERN',     'ART_DEF_UNIT_MEMBER_GREAT_WRITER_LATE_F1',         'RUG',  'LAND', 0.18,   1,          'EarlyGreatArtistRUG'),
            --(   'ART_DEF_UNIT_GREAT_WRITER_POSTMODERN',     'ART_DEF_UNIT_MEMBER_GREAT_WRITER_LATE_F2',         'RUG',  'LAND', 0.18,   1,          'EarlyGreatArtistRUG'),
            --SUG
            (   'ART_DEF_UNIT_GREAT_WRITER_POSTMODERN',     'ART_DEF_UNIT_MEMBER_GREAT_WRITER_LATE',            'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT_GREAT_WRITER_POSTMODERN',     'ART_DEF_UNIT_MEMBER_GREAT_WRITER_LATE_F1',         'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT_GREAT_WRITER_POSTMODERN',     'ART_DEF_UNIT_MEMBER_GREAT_WRITER_LATE_F2',         'SUG',  'LAND', 0.25,   1,          ''),
        --	GREAT ARTIST (EARLY)
            --RED: 1ST ROW - 3 Members (Flat: Center-Right-Left)
            (   'ART_DEF_UNIT_GREAT_ARTIST',                'ART_DEF_UNIT_MEMBER_GREAT_ARTIST',                 'RED',  'LAND', 0.09,   1,          'GreatArtist'),
            (   'ART_DEF_UNIT_GREAT_ARTIST',                'ART_DEF_UNIT_MEMBER_GREAT_ARTIST_F1',              'RED',  'LAND', 0.09,   1,          'GreatArtist'),
            (   'ART_DEF_UNIT_GREAT_ARTIST',                'ART_DEF_UNIT_MEMBER_GREAT_ARTIST_F2',              'RED',  'LAND', 0.09,   1,          'GreatArtist'),
            --RED: 2ND ROW - 4 Members (Flat: InnerLeft-InnerRight-OuterLeft-OuterRight)
            (   'ART_DEF_UNIT_GREAT_ARTIST',                'ART_DEF_UNIT_MEMBER_GREAT_ARTIST_F1',              'RED',  'LAND', 0.09,   1,          'GreatArtist'),
            (   'ART_DEF_UNIT_GREAT_ARTIST',                'ART_DEF_UNIT_MEMBER_GREAT_ARTIST_F2',              'RED',  'LAND', 0.09,   1,          'GreatArtist'),
            --RUG
            (   'ART_DEF_UNIT_GREAT_ARTIST',                'ART_DEF_UNIT_MEMBER_GREAT_ARTIST',                 'RUG',  'LAND', 0.18,   1,          'EarlyGreatArtistRUG'),
            (   'ART_DEF_UNIT_GREAT_ARTIST',                'ART_DEF_UNIT_MEMBER_GREAT_ARTIST_F1',              'RUG',  'LAND', 0.18,   1,          'EarlyGreatArtistRUG'),
            --(   'ART_DEF_UNIT_GREAT_ARTIST',                'ART_DEF_UNIT_MEMBER_GREAT_ARTIST_F2',              'RUG',  'LAND', 0.18,   1,          'EarlyGreatArtistRUG'),
            --SUG
            (   'ART_DEF_UNIT_GREAT_ARTIST',                'ART_DEF_UNIT_MEMBER_GREAT_ARTIST',                 'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT_GREAT_ARTIST',                'ART_DEF_UNIT_MEMBER_GREAT_ARTIST_F1',              'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT_GREAT_ARTIST',                'ART_DEF_UNIT_MEMBER_GREAT_ARTIST_F2',              'SUG',  'LAND', 0.25,   1,          ''),
        --	GREAT ARTIST (POSTMODERN)
            --RED: 1ST ROW - 3 Members (Flat: Center-Right-Left)
            (   'ART_DEF_UNIT_GREAT_ARTIST_POSTMODERN',     'ART_DEF_UNIT_MEMBER_GREAT_ARTIST_LATE',            'RED',  'LAND', 0.09,   1,          'GreatArtist'),
            (   'ART_DEF_UNIT_GREAT_ARTIST_POSTMODERN',     'ART_DEF_UNIT_MEMBER_GREAT_ARTIST_LATE_F1',         'RED',  'LAND', 0.09,   1,          'GreatArtist'),
            (   'ART_DEF_UNIT_GREAT_ARTIST_POSTMODERN',     'ART_DEF_UNIT_MEMBER_GREAT_ARTIST_LATE_F2',         'RED',  'LAND', 0.09,   1,          'GreatArtist'),
            --RED: 2ND ROW - 4 Members (Flat: InnerLeft-InnerRight-OuterLeft-OuterRight)
            (   'ART_DEF_UNIT_GREAT_ARTIST_POSTMODERN',     'ART_DEF_UNIT_MEMBER_GREAT_ARTIST_LATE_F1',         'RED',  'LAND', 0.09,   1,          'GreatArtist'),
            (   'ART_DEF_UNIT_GREAT_ARTIST_POSTMODERN',     'ART_DEF_UNIT_MEMBER_GREAT_ARTIST_LATE_F2',         'RED',  'LAND', 0.09,   1,          'GreatArtist'),
            --RUG
            (   'ART_DEF_UNIT_GREAT_ARTIST_POSTMODERN',     'ART_DEF_UNIT_MEMBER_GREAT_ARTIST_LATE',            'RUG',  'LAND', 0.18,   1,          'EarlyGreatArtistRUG'),
            (   'ART_DEF_UNIT_GREAT_ARTIST_POSTMODERN',     'ART_DEF_UNIT_MEMBER_GREAT_ARTIST_LATE_F1',         'RUG',  'LAND', 0.18,   1,          'EarlyGreatArtistRUG'),
            --(   'ART_DEF_UNIT_GREAT_ARTIST_POSTMODERN',     'ART_DEF_UNIT_MEMBER_GREAT_ARTIST_LATE_F2',         'RUG',  'LAND', 0.18,   1,          'EarlyGreatArtistRUG'),
            --SUG
            (   'ART_DEF_UNIT_GREAT_ARTIST_POSTMODERN',     'ART_DEF_UNIT_MEMBER_GREAT_ARTIST_LATE',            'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT_GREAT_ARTIST_POSTMODERN',     'ART_DEF_UNIT_MEMBER_GREAT_ARTIST_LATE_F1',         'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT_GREAT_ARTIST_POSTMODERN',     'ART_DEF_UNIT_MEMBER_GREAT_ARTIST_LATE_F2',         'SUG',  'LAND', 0.25,   1,          ''),
        --	GREAT MUSICIAN (EARLY)
            --RED: 1ST ROW - 3 Members (Flat: Center-Right-Left)
            (   'ART_DEF_UNIT_GREAT_MUSICIAN',              'ART_DEF_UNIT_MEMBER_GREAT_MUSICIAN',               'RED',  'LAND', 0.09,   1,          'GreatArtist'),
            (   'ART_DEF_UNIT_GREAT_MUSICIAN',              'ART_DEF_UNIT_MEMBER_GREAT_MUSICIAN_F1',            'RED',  'LAND', 0.09,   1,          'GreatArtist'),
            (   'ART_DEF_UNIT_GREAT_MUSICIAN',              'ART_DEF_UNIT_MEMBER_GREAT_MUSICIAN_F2',            'RED',  'LAND', 0.09,   1,          'GreatArtist'),
            --RED: 2ND ROW - 4 Members (Flat: InnerLeft-InnerRight-OuterLeft-OuterRight)
            (   'ART_DEF_UNIT_GREAT_MUSICIAN',              'ART_DEF_UNIT_MEMBER_GREAT_MUSICIAN_F1',            'RED',  'LAND', 0.09,   1,          'GreatArtist'),
            (   'ART_DEF_UNIT_GREAT_MUSICIAN',              'ART_DEF_UNIT_MEMBER_GREAT_MUSICIAN_F2',            'RED',  'LAND', 0.09,   1,          'GreatArtist'),
            --RUG
            (   'ART_DEF_UNIT_GREAT_MUSICIAN',              'ART_DEF_UNIT_MEMBER_GREAT_MUSICIAN',               'RUG',  'LAND', 0.18,   1,          'EarlyGreatArtistRUG'),
            (   'ART_DEF_UNIT_GREAT_MUSICIAN',              'ART_DEF_UNIT_MEMBER_GREAT_MUSICIAN_F1',            'RUG',  'LAND', 0.18,   1,          'EarlyGreatArtistRUG'),
            --(   'ART_DEF_UNIT_GREAT_MUSICIAN',              'ART_DEF_UNIT_MEMBER_GREAT_MUSICIAN_F2',            'RUG',  'LAND', 0.18,   1,          'EarlyGreatArtistRUG'),
            --SUG
            (   'ART_DEF_UNIT_GREAT_MUSICIAN',              'ART_DEF_UNIT_MEMBER_GREAT_MUSICIAN',               'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT_GREAT_MUSICIAN',              'ART_DEF_UNIT_MEMBER_GREAT_MUSICIAN_F1',            'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT_GREAT_MUSICIAN',              'ART_DEF_UNIT_MEMBER_GREAT_MUSICIAN_F2',            'SUG',  'LAND', 0.25,   1,          ''),
        --	GREAT MUSICIAN (POSTMODERN)
            --RED: 1ST ROW - 3 Members (Flat: Center-Right-Left)
            (   'ART_DEF_UNIT_GREAT_MUSICIAN_POSTMODERN',   'ART_DEF_UNIT_MEMBER_GREAT_MUSICIAN_LATE',          'RED',  'LAND', 0.09,   1,          'GreatArtist'),
            (   'ART_DEF_UNIT_GREAT_MUSICIAN_POSTMODERN',   'ART_DEF_UNIT_MEMBER_GREAT_MUSICIAN_LATE_F1',       'RED',  'LAND', 0.09,   1,          'GreatArtist'),
            (   'ART_DEF_UNIT_GREAT_MUSICIAN_POSTMODERN',   'ART_DEF_UNIT_MEMBER_GREAT_MUSICIAN_LATE_F2',       'RED',  'LAND', 0.09,   1,          'GreatArtist'),
            --RED: 2ND ROW - 4 Members (Flat: InnerLeft-InnerRight-OuterLeft-OuterRight)
            (   'ART_DEF_UNIT_GREAT_MUSICIAN_POSTMODERN',   'ART_DEF_UNIT_MEMBER_GREAT_MUSICIAN_LATE_F1',       'RED',  'LAND', 0.09,   1,          'GreatArtist'),
            (   'ART_DEF_UNIT_GREAT_MUSICIAN_POSTMODERN',   'ART_DEF_UNIT_MEMBER_GREAT_MUSICIAN_LATE_F2',       'RED',  'LAND', 0.09,   1,          'GreatArtist'),
            --RUG
            (   'ART_DEF_UNIT_GREAT_MUSICIAN_POSTMODERN',   'ART_DEF_UNIT_MEMBER_GREAT_MUSICIAN_LATE',          'RUG',  'LAND', 0.18,   1,          'EarlyGreatArtistRUG'),
            (   'ART_DEF_UNIT_GREAT_MUSICIAN_POSTMODERN',   'ART_DEF_UNIT_MEMBER_GREAT_MUSICIAN_LATE_F1',       'RUG',  'LAND', 0.18,   1,          'EarlyGreatArtistRUG'),
            --(   'ART_DEF_UNIT_GREAT_MUSICIAN_POSTMODERN',   'ART_DEF_UNIT_MEMBER_GREAT_MUSICIAN_LATE_F2',       'RUG',  'LAND', 0.18,   1,          'EarlyGreatArtistRUG'),
            --SUG
            (   'ART_DEF_UNIT_GREAT_MUSICIAN_POSTMODERN',   'ART_DEF_UNIT_MEMBER_GREAT_MUSICIAN_LATE',          'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT_GREAT_MUSICIAN_POSTMODERN',   'ART_DEF_UNIT_MEMBER_GREAT_MUSICIAN_LATE_F1',       'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT_GREAT_MUSICIAN_POSTMODERN',   'ART_DEF_UNIT_MEMBER_GREAT_MUSICIAN_LATE_F2',       'SUG',  'LAND', 0.25,   1,          ''),
        --	GREAT GENERAL (EARLY)
            (   'ART_DEF_UNIT_GENERAL',                     'ART_DEF_UNIT_MEMBER_GREATGENERAL_EARLY',           'RED',  'LAND', 0.09,   1,          ''),
            (   'ART_DEF_UNIT_GENERAL',                     'ART_DEF_UNIT_MEMBER_GREATGENERAL_EARLY',           'RUG',  'LAND', 0.17,   1,          ''),
            (   'ART_DEF_UNIT_GENERAL',                     'ART_DEF_UNIT_MEMBER_GREATGENERAL_EARLY',           'SUG',  'LAND', 0.22,   1,          ''),
        --	GREAT GENERAL (MODERN)
            (   'ART_DEF_UNIT_GENERAL_MODERN',              'ART_DEF_UNIT_MEMBER_GREATGENERAL_LATE',            'RED',  'LAND', 0.09,   1,          ''),
            (   'ART_DEF_UNIT_GENERAL_MODERN',              'ART_DEF_UNIT_MEMBER_GREATGENERAL_LATE',            'RUG',  'LAND', 0.17,   1,          ''),
            (   'ART_DEF_UNIT_GENERAL_MODERN',              'ART_DEF_UNIT_MEMBER_GREATGENERAL_LATE',            'SUG',  'LAND', 0.2,   1,          ''),
        --	GREAT ADMIRAL (EARLY)
            (   'ART_DEF_UNIT_GREAT_ADMIRAL',               'ART_DEF_UNIT_MEMBER_GREAT_ADMIRAL',                'RED',  'SEA',  0.12,   1,          'DefaultCavalry'),
            (   'ART_DEF_UNIT_GREAT_ADMIRAL',               'ART_DEF_UNIT_MEMBER_GREAT_ADMIRAL',                'RUG',  'SEA',  0.18,   1,          'DefaultCavalryRUG'),
            (   'ART_DEF_UNIT_GREAT_ADMIRAL',               'ART_DEF_UNIT_MEMBER_GREAT_ADMIRAL',                'SUG',  'SEA',  0.24,   1,          ''),
        --	GREAT ADMIRAL (MODERN)
            (   'ART_DEF_UNIT_GREAT_ADMIRAL_MODERN',        'ART_DEF_UNIT_MEMBER_GREAT_ADMIRAL_LATE',           'RED',  'SEA',  0.12,   1,          'DefaultCavalry'),
            (   'ART_DEF_UNIT_GREAT_ADMIRAL_MODERN',        'ART_DEF_UNIT_MEMBER_GREAT_ADMIRAL_LATE',           'RUG',  'SEA',  0.17,   1,          'DefaultCavalryRUG'),
            (   'ART_DEF_UNIT_GREAT_ADMIRAL_MODERN',        'ART_DEF_UNIT_MEMBER_GREAT_ADMIRAL_LATE',           'SUG',  'SEA',  0.17,   1,          ''),
        --	GREAT PROPHET
            --RED
            (   'ART_DEF_UNIT_GREAT_PROPHET',               'ART_DEF_UNIT_MEMBER_GREAT_PROPHET',                'RED',  'LAND', 0.09,   1,          'EarlyGreatArtist'),
            (   'ART_DEF_UNIT_GREAT_PROPHET',               'ART_DEF_UNIT_MEMBER_GREAT_PROPHET_FEMALE',         'RED',  'LAND', 0.09,   1,          'EarlyGreatArtist'),
            (   'ART_DEF_UNIT_GREAT_PROPHET',               'ART_DEF_UNIT_MEMBER_GREAT_PROPHET_MALE',           'RED',  'LAND', 0.09,   1,          'EarlyGreatArtist'),
            (   'ART_DEF_UNIT_GREAT_PROPHET',               'ART_DEF_UNIT_MEMBER_GREAT_PROPHET_MALE',           'RED',  'LAND', 0.09,   1,          'EarlyGreatArtist'),
            (   'ART_DEF_UNIT_GREAT_PROPHET',               'ART_DEF_UNIT_MEMBER_GREAT_PROPHET_FEMALE',         'RED',  'LAND', 0.09,   1,          'EarlyGreatArtist'),
            --RUG
            (   'ART_DEF_UNIT_GREAT_PROPHET',               'ART_DEF_UNIT_MEMBER_GREAT_PROPHET',                'RUG',  'LAND', 0.18,   1,          'EarlyGreatArtistRUG'),
            --(   'ART_DEF_UNIT_GREAT_PROPHET',               'ART_DEF_UNIT_MEMBER_GREAT_PROPHET_FEMALE',         'RUG',  'LAND', 0.18,   1,          'EarlyGreatArtistRUG'),
            (   'ART_DEF_UNIT_GREAT_PROPHET',               'ART_DEF_UNIT_MEMBER_GREAT_PROPHET_MALE',           'RUG',  'LAND', 0.18,   1,          'EarlyGreatArtistRUG'),
            --SUG
            (   'ART_DEF_UNIT_GREAT_PROPHET',               'ART_DEF_UNIT_MEMBER_GREAT_PROPHET',                'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT_GREAT_PROPHET',               'ART_DEF_UNIT_MEMBER_GREAT_PROPHET_FEMALE',         'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT_GREAT_PROPHET',               'ART_DEF_UNIT_MEMBER_GREAT_PROPHET_MALE',           'SUG',  'LAND', 0.25,   1,          ''),
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  END OF INSERT

            (   'END_OF_INSERT', '', '', NULL, 0, 0, '');

DELETE  FROM ArtDefine_USnF WHERE USnF_UnitInfo = 'END_OF_INSERT';
