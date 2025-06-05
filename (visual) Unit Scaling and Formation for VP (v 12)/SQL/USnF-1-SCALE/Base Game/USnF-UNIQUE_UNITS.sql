/*
    Unit Scaling and Formation

    ArtDefine configuration file
    by N.Core

    For unique units.

    Note for inserting into ArtDefine_UnitInfoMemberInfos:
    To adjust what kind of UnitMemberInfo model you want to use for a UnitInfo,
    just simply add/remove the comment syntax '--' on the desired UnitMemberInfo insertion.
*/

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT  INTO ArtDefine_USnF (USnF_UnitInfo, USnF_UnitMemberInfo, USnF_Type, USnF_Domain, USnF_Scale, USnF_NumMembers, USnF_Formation) VALUES
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  Base Civilizations
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  AMERICA
        ------- UnitInfo ------------------------------------------ UnitMemberInfo -------------------------------------------- Type -- Domain  Scale - NumMembers  Formation ---
        --  B-17
            (   'ART_DEF_UNIT_U_AMERICAN_B17',                      'ART_DEF_UNIT_MEMBER_U_AMERICAN_B17',                       'RED',  'AIR',  0.10,   3,          'BomberWingRED'),
            (   'ART_DEF_UNIT_U_AMERICAN_B17',                      'ART_DEF_UNIT_MEMBER_U_AMERICAN_B17',                       'RUG',  'AIR',  0.135,  1,          'BomberWing'),
            (   'ART_DEF_UNIT_U_AMERICAN_B17',                      'ART_DEF_UNIT_MEMBER_U_AMERICAN_B17',                       'SUG',  'AIR',  0.205,  1,          ''),
            (   'ART_DEF_UNIT_U_AMERICAN_B17',                      'ART_DEF_UNIT_MEMBER_U_AMERICAN_B17',                       'EAW',  'AIR',  0.087,  1,          'BomberWing'),
        --  MINUTEMAN
            (   'ART_DEF_UNIT_U_AMERICAN_MINUTEMAN',                'ART_DEF_UNIT_MEMBER_U_AMERICAN_MINUTEMAN',                 'RED',  'LAND', 0.09,   19,         'HonorableGunpowderRED'),
            (   'ART_DEF_UNIT_U_AMERICAN_MINUTEMAN',                'ART_DEF_UNIT_MEMBER_U_AMERICAN_MINUTEMAN',                 'RUG',  'LAND', 0.18,   3,          'HonorableGunpowderRUG'),
            (   'ART_DEF_UNIT_U_AMERICAN_MINUTEMAN',                'ART_DEF_UNIT_MEMBER_U_AMERICAN_MINUTEMAN',                 'SUG',  'LAND', 0.25,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  ARABIA
        ------- UnitInfo ------------------------------------------ UnitMemberInfo -------------------------------------------- Type -- Domain  Scale - NumMembers  Formation ---
        --	CAMEL ARCHER
            (   'ART_DEF_UNIT_U_ARABIAN_CAMELARCHER',               'ART_DEF_UNIT_MEMBER_U_ARABIAN_CAMELARCHER',                'RED',  'LAND', 0.085,  7,          'DefaultCavalry'),
            (   'ART_DEF_UNIT_U_ARABIAN_CAMELARCHER',               'ART_DEF_UNIT_MEMBER_U_ARABIAN_CAMELARCHER',                'RUG',  'LAND', 0.17,   3,          'DefaultCavalryRUG'),
            (   'ART_DEF_UNIT_U_ARABIAN_CAMELARCHER',               'ART_DEF_UNIT_MEMBER_U_ARABIAN_CAMELARCHER',                'SUG',  'LAND', 0.24,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  ASSYRIA
        ------- UnitInfo ------------------------------------------ UnitMemberInfo -------------------------------------------- Type -- Domain  Scale - NumMembers  Formation ---
        --  SIEGE TOWER
            (   'ART_DEF_UNIT_U_ASSYRIAN_SIEGE_TOWER',              'ART_DEF_UNIT_MEMBER_U_ASSYRIAN_SIEGE_TOWER',               'RED',  'LAND', 0.9,   1,          'TwoBigGuns'),
            (   'ART_DEF_UNIT_U_ASSYRIAN_SIEGE_TOWER',              'ART_DEF_UNIT_MEMBER_U_ASSYRIAN_SIEGE_TOWER',               'RUG',  'LAND', 0.9,   1,          'TwoBigGuns'),
            (   'ART_DEF_UNIT_U_ASSYRIAN_SIEGE_TOWER',              'ART_DEF_UNIT_MEMBER_U_ASSYRIAN_SIEGE_TOWER',               'SUG',  'LAND', 0.9,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  AUSTRIA
        ------- UnitInfo ------------------------------------------ UnitMemberInfo -------------------------------------------- Type -- Domain  Scale - NumMembers  Formation ---
        --  HUSSAR
            (   'ART_DEF_UNIT_U_AUSTRIAN_HUSSAR',                   'ART_DEF_UNIT_MEMBER_U_AUSTRIAN_HUSSAR',                    'RED',  'LAND', 0.085,  7,          'DefaultCavalry'),
            (   'ART_DEF_UNIT_U_AUSTRIAN_HUSSAR',                   'ART_DEF_UNIT_MEMBER_U_AUSTRIAN_HUSSAR',                    'RUG',  'LAND', 0.17,   3,          'DefaultCavalryRUG'),
            (   'ART_DEF_UNIT_U_AUSTRIAN_HUSSAR',                   'ART_DEF_UNIT_MEMBER_U_AUSTRIAN_HUSSAR',                    'SUG',  'LAND', 0.24,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  AZTEC
        ------- UnitInfo ------------------------------------------ UnitMemberInfo -------------------------------------------- Type -- Domain  Scale - NumMembers  Formation ---
        --  JAGUAR
            (   'ART_DEF_UNIT_U_AZTEC_JAGUAR',                      'ART_DEF_UNIT_MEMBER_U_AZTEC_JAGUAR',                       'RED',  'LAND', 0.09,   18,         'UnFormedRED'),
            (   'ART_DEF_UNIT_U_AZTEC_JAGUAR',                      'ART_DEF_UNIT_MEMBER_U_AZTEC_JAGUAR',                       'RUG',  'LAND', 0.18,   3,          'UnFormedRUG'),
            (   'ART_DEF_UNIT_U_AZTEC_JAGUAR',                      'ART_DEF_UNIT_MEMBER_U_AZTEC_JAGUAR',                       'SUG',  'LAND', 0.25,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  BABYLON
        ------- UnitInfo ------------------------------------------ UnitMemberInfo -------------------------------------------- Type -- Domain  Scale - NumMembers  Formation ---
        --  BOWMAN
            (   'ART_DEF_UNIT_U_BABYLONIAN_BOWMAN',                 'ART_DEF_UNIT_MEMBER_U_BABYLONIAN_BOWMAN',                  'RED',  'LAND', 0.09,   16,         'ArcherRED'),
            (   'ART_DEF_UNIT_U_BABYLONIAN_BOWMAN',                 'ART_DEF_UNIT_MEMBER_U_BABYLONIAN_BOWMAN',                  'RUG',  'LAND', 0.18,   3,          'ArcherRUG'),
            (   'ART_DEF_UNIT_U_BABYLONIAN_BOWMAN',                 'ART_DEF_UNIT_MEMBER_U_BABYLONIAN_BOWMAN',                  'SUG',  'LAND', 0.25,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  BARBARIAN
        ------- UnitInfo ------------------------------------------ UnitMemberInfo -------------------------------------------- Type -- Domain  Scale - NumMembers  Formation ---
        --  BARBARIAN ARCHER
            --RED
            (   'ART_DEF_UNIT_BARBARIAN_ARCHER',                    'ART_DEF_UNIT_MEMBER_BARBARIAN_ARCHER_01',                  'RED',  'LAND', 0.09,   4,          'Barbarian'),
            (   'ART_DEF_UNIT_BARBARIAN_ARCHER',                    'ART_DEF_UNIT_MEMBER_BARBARIAN_ARCHER_V2',                  'RED',  'LAND', 0.09,   3,          'Barbarian'),
            (   'ART_DEF_UNIT_BARBARIAN_ARCHER',                    'ART_DEF_UNIT_MEMBER_BARBARIAN_ARCHER_V3',                  'RED',  'LAND', 0.09,   4,          'Barbarian'),
            (   'ART_DEF_UNIT_BARBARIAN_ARCHER',                    'ART_DEF_UNIT_MEMBER_BARBARIAN_ARCHER_V3',                  'RED',  'LAND', 0.09,   2,          'Barbarian'),
            (   'ART_DEF_UNIT_BARBARIAN_ARCHER',                    'ART_DEF_UNIT_MEMBER_BARBARIAN_ARCHER_01',                  'RED',  'LAND', 0.09,   2,          'Barbarian'),
            (   'ART_DEF_UNIT_BARBARIAN_ARCHER',                    'ART_DEF_UNIT_MEMBER_BARBARIAN_ARCHER_V2',                  'RED',  'LAND', 0.09,   3,          'Barbarian'),
            --RUG
            (   'ART_DEF_UNIT_BARBARIAN_ARCHER',                    'ART_DEF_UNIT_MEMBER_BARBARIAN_ARCHER_01',                  'RUG',  'LAND', 0.18,   1,          'BarbarianRUG'),
            (   'ART_DEF_UNIT_BARBARIAN_ARCHER',                    'ART_DEF_UNIT_MEMBER_BARBARIAN_ARCHER_V2',                  'RUG',  'LAND', 0.18,   1,          'BarbarianRUG'),
            (   'ART_DEF_UNIT_BARBARIAN_ARCHER',                    'ART_DEF_UNIT_MEMBER_BARBARIAN_ARCHER_V3',                  'RUG',  'LAND', 0.18,   1,          'BarbarianRUG'),
            --SUG
            (   'ART_DEF_UNIT_BARBARIAN_ARCHER',                    'ART_DEF_UNIT_MEMBER_BARBARIAN_ARCHER_01',                  'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT_BARBARIAN_ARCHER',                    'ART_DEF_UNIT_MEMBER_BARBARIAN_ARCHER_V2',                  'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT_BARBARIAN_ARCHER',                    'ART_DEF_UNIT_MEMBER_BARBARIAN_ARCHER_V3',                  'SUG',  'LAND', 0.25,   1,          ''),
        --  BARBARIAN GALLEY
            (   'ART_DEF_UNIT_BARBARIAN_GALLEY',                    'ART_DEF_UNIT_MEMBER_BARBARIAN_GALLEY',                     'RED',  'SEA',  0.06,   3,          'Flotilla'),
            (   'ART_DEF_UNIT_BARBARIAN_GALLEY',                    'ART_DEF_UNIT_MEMBER_BARBARIAN_GALLEY',                     'RUG',  'SEA',  0.103,  1,          ''),
            (   'ART_DEF_UNIT_BARBARIAN_GALLEY',                    'ART_DEF_UNIT_MEMBER_BARBARIAN_GALLEY',                     'SUG',  'SEA',  0.18,  1,          ''),
        --  BARBARIAN SPEARMAN
            --RED
            (   'ART_DEF_UNIT_BARBARIAN_SPEARMAN',                  'ART_DEF_UNIT_MEMBER_BARBARIAN_SPEARMAN',                   'RED',  'LAND', 0.09,   3,          'Barbarian'),
            (   'ART_DEF_UNIT_BARBARIAN_SPEARMAN',                  'ART_DEF_UNIT_MEMBER_BARBARIAN_SPEARMAN_V2',                'RED',  'LAND', 0.09,   4,          'Barbarian'),
            (   'ART_DEF_UNIT_BARBARIAN_SPEARMAN',                  'ART_DEF_UNIT_MEMBER_BARBARIAN_SPEARMAN_V3',                'RED',  'LAND', 0.09,   3,          'Barbarian'),
            (   'ART_DEF_UNIT_BARBARIAN_SPEARMAN',                  'ART_DEF_UNIT_MEMBER_BARBARIAN_SPEARMAN_V2',                'RED',  'LAND', 0.09,   2,          'Barbarian'),
            (   'ART_DEF_UNIT_BARBARIAN_SPEARMAN',                  'ART_DEF_UNIT_MEMBER_BARBARIAN_SPEARMAN',                   'RED',  'LAND', 0.09,   3,          'Barbarian'),
            (   'ART_DEF_UNIT_BARBARIAN_SPEARMAN',                  'ART_DEF_UNIT_MEMBER_BARBARIAN_SPEARMAN_V3',                'RED',  'LAND', 0.09,   3,          'Barbarian'),
            --RUG
            (   'ART_DEF_UNIT_BARBARIAN_SPEARMAN',                  'ART_DEF_UNIT_MEMBER_BARBARIAN_SPEARMAN',                   'RUG',  'LAND', 0.18,   1,          'BarbarianRUG'),
            (   'ART_DEF_UNIT_BARBARIAN_SPEARMAN',                  'ART_DEF_UNIT_MEMBER_BARBARIAN_SPEARMAN_V2',                'RUG',  'LAND', 0.18,   1,          'BarbarianRUG'),
            (   'ART_DEF_UNIT_BARBARIAN_SPEARMAN',                  'ART_DEF_UNIT_MEMBER_BARBARIAN_SPEARMAN_V3',                'RUG',  'LAND', 0.18,   1,          'BarbarianRUG'),
            --SUG
            (   'ART_DEF_UNIT_BARBARIAN_SPEARMAN',                  'ART_DEF_UNIT_MEMBER_BARBARIAN_SPEARMAN',                   'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT_BARBARIAN_SPEARMAN',                  'ART_DEF_UNIT_MEMBER_BARBARIAN_SPEARMAN_V2',                'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT_BARBARIAN_SPEARMAN',                  'ART_DEF_UNIT_MEMBER_BARBARIAN_SPEARMAN_V3',                'SUG',  'LAND', 0.25,   1,          ''),
        --  BARBARIAN SWORDSMAN
            --RED
            (   'ART_DEF_UNIT_BARBARIAN_SWORDSMAN',                 'ART_DEF_UNIT_MEMBER_BARBARIAN_SWORDSMAN',                  'RED',  'LAND', 0.09,   4,          'Barbarian'),
            (   'ART_DEF_UNIT_BARBARIAN_SWORDSMAN',                 'ART_DEF_UNIT_MEMBER_BARBARIAN_SWORDSMAN_V2',               'RED',  'LAND', 0.09,   2,          'Barbarian'),
            (   'ART_DEF_UNIT_BARBARIAN_SWORDSMAN',                 'ART_DEF_UNIT_MEMBER_BARBARIAN_SWORDSMAN_V3',               'RED',  'LAND', 0.09,   3,          'Barbarian'),
            (   'ART_DEF_UNIT_BARBARIAN_SWORDSMAN',                 'ART_DEF_UNIT_MEMBER_BARBARIAN_SWORDSMAN_V2',               'RED',  'LAND', 0.09,   4,          'Barbarian'),
            (   'ART_DEF_UNIT_BARBARIAN_SWORDSMAN',                 'ART_DEF_UNIT_MEMBER_BARBARIAN_SWORDSMAN_V3',               'RED',  'LAND', 0.09,   3,          'Barbarian'),
            (   'ART_DEF_UNIT_BARBARIAN_SWORDSMAN',                 'ART_DEF_UNIT_MEMBER_BARBARIAN_SWORDSMAN',                  'RED',  'LAND', 0.09,   2,          'Barbarian'),
            --RUG
            (   'ART_DEF_UNIT_BARBARIAN_SWORDSMAN',                 'ART_DEF_UNIT_MEMBER_BARBARIAN_SWORDSMAN',                  'RUG',  'LAND', 0.18,   1,          'BarbarianRUG'),
            (   'ART_DEF_UNIT_BARBARIAN_SWORDSMAN',                 'ART_DEF_UNIT_MEMBER_BARBARIAN_SWORDSMAN_V2',               'RUG',  'LAND', 0.18,   1,          'BarbarianRUG'),
            (   'ART_DEF_UNIT_BARBARIAN_SWORDSMAN',                 'ART_DEF_UNIT_MEMBER_BARBARIAN_SWORDSMAN_V3',               'RUG',  'LAND', 0.18,   1,          'BarbarianRUG'),
            --SUG
            (   'ART_DEF_UNIT_BARBARIAN_SWORDSMAN',                 'ART_DEF_UNIT_MEMBER_BARBARIAN_SWORDSMAN',                  'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT_BARBARIAN_SWORDSMAN',                 'ART_DEF_UNIT_MEMBER_BARBARIAN_SWORDSMAN_V2',               'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT_BARBARIAN_SWORDSMAN',                 'ART_DEF_UNIT_MEMBER_BARBARIAN_SWORDSMAN_V3',               'SUG',  'LAND', 0.25,   1,          ''),
        --  BARBARIAN WARRIOR
            --RED
            (   'ART_DEF_UNIT_BARBARIAN_EURO',                      'ART_DEF_UNIT_MEMBER_BARBARIAN_EURO_ALPHA',                 'RED',  'LAND', 0.09,   2,          'Barbarian'),
            (   'ART_DEF_UNIT_BARBARIAN_EURO',                      'ART_DEF_UNIT_MEMBER_BARBARIAN_EURO_BRAVO',                 'RED',  'LAND', 0.09,   3,          'Barbarian'),
            (   'ART_DEF_UNIT_BARBARIAN_EURO',                      'ART_DEF_UNIT_MEMBER_BARBARIAN_EURO_CHARLIE',               'RED',  'LAND', 0.09,   4,          'Barbarian'),
            (   'ART_DEF_UNIT_BARBARIAN_EURO',                      'ART_DEF_UNIT_MEMBER_BARBARIAN_EURO_BRAVO',                 'RED',  'LAND', 0.09,   3,          'Barbarian'),
            (   'ART_DEF_UNIT_BARBARIAN_EURO',                      'ART_DEF_UNIT_MEMBER_BARBARIAN_EURO_CHARLIE',               'RED',  'LAND', 0.09,   2,          'Barbarian'),
            (   'ART_DEF_UNIT_BARBARIAN_EURO',                      'ART_DEF_UNIT_MEMBER_BARBARIAN_EURO_ALPHA',                 'RED',  'LAND', 0.09,   4,          'Barbarian'),
            --RUG
            (   'ART_DEF_UNIT_BARBARIAN_EURO',                      'ART_DEF_UNIT_MEMBER_BARBARIAN_EURO_ALPHA',                 'RUG',  'LAND', 0.18,   1,          'BarbarianRUG'),
            (   'ART_DEF_UNIT_BARBARIAN_EURO',                      'ART_DEF_UNIT_MEMBER_BARBARIAN_EURO_BRAVO',                 'RUG',  'LAND', 0.18,   1,          'BarbarianRUG'),
            (   'ART_DEF_UNIT_BARBARIAN_EURO',                      'ART_DEF_UNIT_MEMBER_BARBARIAN_EURO_CHARLIE',               'RUG',  'LAND', 0.18,   1,          'BarbarianRUG'),
            --SUG
            (   'ART_DEF_UNIT_BARBARIAN_EURO',                      'ART_DEF_UNIT_MEMBER_BARBARIAN_EURO_ALPHA',                 'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT_BARBARIAN_EURO',                      'ART_DEF_UNIT_MEMBER_BARBARIAN_EURO_BRAVO',                 'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT_BARBARIAN_EURO',                      'ART_DEF_UNIT_MEMBER_BARBARIAN_EURO_CHARLIE',               'SUG',  'LAND', 0.25,   1,          ''),
        --  HAND AXE BARBARIAN
            (   'ART_DEF_UNIT_HAND_AXE_BARBARIAN',                  'ART_DEF_UNIT_MEMBER_HAND_AXE_BARBARIAN',                   'RED',  'LAND', 0.088,  10,         'ArcherRED'),
            (   'ART_DEF_UNIT_HAND_AXE_BARBARIAN',                  'ART_DEF_UNIT_MEMBER_HAND_AXE_BARBARIAN',                   'RUG',  'LAND', 0.178,  3,          'ArcherRUG'),
            (   'ART_DEF_UNIT_HAND_AXE_BARBARIAN',                  'ART_DEF_UNIT_MEMBER_HAND_AXE_BARBARIAN',                   'SUG',  'LAND', 0.248,  1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  BRAZIL
        ------- UnitInfo ------------------------------------------ UnitMemberInfo -------------------------------------------- Type -- Domain  Scale - NumMembers  Formation ---
        --  PRACINHA
            (   'ART_DEF_UNIT_U_BRAZILIAN_PRACINHAS',               'ART_DEF_UNIT_MEMBER_U_BRAZILIAN_PRACINHAS',                'RED',  'LAND', 0.088,  19,         'HonorableGunpowderRED'),
            (   'ART_DEF_UNIT_U_BRAZILIAN_PRACINHAS',               'ART_DEF_UNIT_MEMBER_U_BRAZILIAN_PRACINHAS',                'RUG',  'LAND', 0.177,  3,          'HonorableGunpowderRUG'),
            (   'ART_DEF_UNIT_U_BRAZILIAN_PRACINHAS',               'ART_DEF_UNIT_MEMBER_U_BRAZILIAN_PRACINHAS',                'SUG',  'LAND', 0.247,  1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  BYZANTIUM
        ------- UnitInfo ------------------------------------------ UnitMemberInfo -------------------------------------------- Type -- Domain  Scale - NumMembers  Formation ---
        --  CATAPHRACT
            (   'ART_DEF_UNIT_U_BYZANTIUM_CATAPHRACT',              'ART_DEF_UNIT_MEMBER_U_BYZANTIUM_CATAPHRACT',               'RED',  'LAND', 0.085,  7,          'WedgeCavalry'),
            (   'ART_DEF_UNIT_U_BYZANTIUM_CATAPHRACT',              'ART_DEF_UNIT_MEMBER_U_BYZANTIUM_CATAPHRACT',               'RUG',  'LAND', 0.17,   3,          'DefaultCavalryRUG'),
            (   'ART_DEF_UNIT_U_BYZANTIUM_CATAPHRACT',              'ART_DEF_UNIT_MEMBER_U_BYZANTIUM_CATAPHRACT',               'SUG',  'LAND', 0.24,   1,          ''),
        --	DROMON
            (   'ART_DEF_UNIT_U_BYZANTIUM_DROMON',                  'ART_DEF_UNIT_MEMBER_U_BYZANTIUM_DROMON',                   'RED',  'SEA',  0.11,   2,          'Flotilla'),
            (   'ART_DEF_UNIT_U_BYZANTIUM_DROMON',                  'ART_DEF_UNIT_MEMBER_U_BYZANTIUM_DROMON',                   'RUG',  'SEA',  0.165,  1,          ''),
            (   'ART_DEF_UNIT_U_BYZANTIUM_DROMON',                  'ART_DEF_UNIT_MEMBER_U_BYZANTIUM_DROMON',                   'SUF',  'SEA',  0.21,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  CARTHAGE
        ------- UnitInfo ------------------------------------------ UnitMemberInfo -------------------------------------------- Type -- Domain  Scale - NumMembers  Formation ---
        --	AFRICAN FOREST ELEPHANT
            (   'ART_DEF_UNIT_U_CARTHAGE_AFRICANFOREST_ELEPHANT',   'ART_DEF_UNIT_MEMBER_U_CARTHAGE_AFRICANFOREST_ELEPHANT',    'RED',  'LAND', 0.08,   3,          'ChariotElephantRED'),
            (   'ART_DEF_UNIT_U_CARTHAGE_AFRICANFOREST_ELEPHANT',   'ART_DEF_UNIT_MEMBER_U_CARTHAGE_AFRICANFOREST_ELEPHANT',    'RUG',  'LAND', 0.16,   2,          'ChariotElephantRUG'),
            (   'ART_DEF_UNIT_U_CARTHAGE_AFRICANFOREST_ELEPHANT',   'ART_DEF_UNIT_MEMBER_U_CARTHAGE_AFRICANFOREST_ELEPHANT',    'SUG',  'LAND', 0.17,   1,          ''),
        --  QUINQUEREME
            (   'ART_DEF_UNIT_U_CARTHAGE_QUINQUEREME',              'ART_DEF_UNIT_MEMBER_U_CARTHAGE_QUINQUEREME',               'RED',  'SEA',  0.047,  2,          'Colomb'),
            (   'ART_DEF_UNIT_U_CARTHAGE_QUINQUEREME',              'ART_DEF_UNIT_MEMBER_U_CARTHAGE_QUINQUEREME',               'RUG',  'SEA',  0.085,  1,          ''),
            (   'ART_DEF_UNIT_U_CARTHAGE_QUINQUEREME',              'ART_DEF_UNIT_MEMBER_U_CARTHAGE_QUINQUEREME',               'SUG',  'SEA',  0.11,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  CELTS
        ------- UnitInfo ------------------------------------------ UnitMemberInfo -------------------------------------------- Type -- Domain  Scale - NumMembers  Formation ---
        --  PICTISH WARRIOR
            (   'ART_DEF_UNIT_U_CELT_PICTISH_WARRIOR',              'ART_DEF_UNIT_MEMBER_U_CELT_PICTISH_WARRIOR',               'RED',  'LAND', 0.09,   18,         'UnFormedRED'),
            (   'ART_DEF_UNIT_U_CELT_PICTISH_WARRIOR',              'ART_DEF_UNIT_MEMBER_U_CELT_PICTISH_WARRIOR',               'RUG',  'LAND', 0.18,   3,          'UnFormedRUG'),
            (   'ART_DEF_UNIT_U_CELT_PICTISH_WARRIOR',              'ART_DEF_UNIT_MEMBER_U_CELT_PICTISH_WARRIOR',               'SUG',  'LAND', 0.25,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  CHINA
        ------- UnitInfo ------------------------------------------ UnitMemberInfo -------------------------------------------- Type -- Domain  Scale - NumMembers  Formation ---
        --  CHU-KO-NU
            (   'ART_DEF_UNIT_U_CHINESE_CHUKONU',                   'ART_DEF_UNIT_MEMBER_U_CHINESE_CHUKONU',                    'RED',  'LAND', 0.09,   15,         'Crossbowman'),
            (   'ART_DEF_UNIT_U_CHINESE_CHUKONU',                   'ART_DEF_UNIT_MEMBER_U_CHINESE_CHUKONU',                    'RUG',  'LAND', 0.18,   3,          'CrossbowmanRUG'),
            (   'ART_DEF_UNIT_U_CHINESE_CHUKONU',                   'ART_DEF_UNIT_MEMBER_U_CHINESE_CHUKONU',                    'SUG',  'LAND', 0.25,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  DENMARK
        ------- UnitInfo ------------------------------------------ UnitMemberInfo -------------------------------------------- Type -- Domain  Scale - NumMembers  Formation ---
        --  BERSERKER
            (   'ART_DEF_UNIT_U_DANISH_BERSERKER',                  'ART_DEF_UNIT_MEMBER_U_DANISH_BERSERKER',                   'RED',  'LAND', 0.098,  18,         'UnFormedRED'),
            (   'ART_DEF_UNIT_U_DANISH_BERSERKER',                  'ART_DEF_UNIT_MEMBER_U_DANISH_BERSERKER',                   'RUG',  'LAND', 0.185,  3,          'UnFormedRUG'),
            (   'ART_DEF_UNIT_U_DANISH_BERSERKER',                  'ART_DEF_UNIT_MEMBER_U_DANISH_BERSERKER',                   'SUG',  'LAND', 0.253,  1,          ''),
        --	NORWEGIAN SKI INFANTRY (U_DANISH_SKI_INFANTRY)
            (   'ART_DEF_UNIT_U_DANISH_SKI_INFANTRY',               'ART_DEF_UNIT_MEMBER_U_DANISH_SKY_INFANTRY',                'RED',  'LAND', 0.09,   19,         'HonorableGunpowderRED'),
            (   'ART_DEF_UNIT_U_DANISH_SKI_INFANTRY',               'ART_DEF_UNIT_MEMBER_U_DANISH_SKY_INFANTRY',                'RUG',  'LAND', 0.18,   3,          'HonorableGunpowderRUG'),
            (   'ART_DEF_UNIT_U_DANISH_SKI_INFANTRY',               'ART_DEF_UNIT_MEMBER_U_DANISH_SKY_INFANTRY',                'SUG',  'LAND', 0.25,   1,          ''),
        --  LONGBOAT (DENMARK'S UNIQUE EMBARKATION)
            (   'ART_DEF_UNIT_U_DANISH_LONGBOAT',                   'ART_DEF_UNIT_MEMBER_U_DANISH_LONGBOAT',                    'RED',  'SEA',  0.048,  5,          'Flotilla'),
            (   'ART_DEF_UNIT_U_DANISH_LONGBOAT',                   'ART_DEF_UNIT_MEMBER_U_DANISH_LONGBOAT',                    'RUG',  'SEA',  0.098,  2,          'FlotillaRUG'),
            (   'ART_DEF_UNIT_U_DANISH_LONGBOAT',                   'ART_DEF_UNIT_MEMBER_U_DANISH_LONGBOAT',                    'SUG',  'SEA',  0.125,  1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  EGYPT
        ------- UnitInfo ------------------------------------------ UnitMemberInfo -------------------------------------------- Type -- Domain  Scale - NumMembers  Formation ---
        --  WAR CHARIOT
            (   'ART_DEF_UNIT_U_EGYPTIAN_WARCHARIOT',               'ART_DEF_UNIT_MEMBER_U_EGYPTIAN_WARCHARIOT',                'RED',  'LAND', 0.085,  3,          'ChariotElephantRED'),
            (   'ART_DEF_UNIT_U_EGYPTIAN_WARCHARIOT',               'ART_DEF_UNIT_MEMBER_U_EGYPTIAN_WARCHARIOT',                'RUG',  'LAND', 0.17,   2,          'ChariotElephantRUG'),
            (   'ART_DEF_UNIT_U_EGYPTIAN_WARCHARIOT',               'ART_DEF_UNIT_MEMBER_U_EGYPTIAN_WARCHARIOT',                'SUG',  'LAND', 0.24,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  ENGLAND
        ------- UnitInfo ------------------------------------------ UnitMemberInfo -------------------------------------------- Type -- Domain  Scale - NumMembers  Formation ---
        --	LONGBOWMAN
            (   'ART_DEF_UNIT_U_ENGLISH_LONGBOWMAN',                'ART_DEF_UNIT_MEMBER_U_ENGLISH_LONGBOWMAN',                 'RED',  'LAND', 0.09,   19,         'Agincourt'),
            (   'ART_DEF_UNIT_U_ENGLISH_LONGBOWMAN',                'ART_DEF_UNIT_MEMBER_U_ENGLISH_LONGBOWMAN',                 'RUG',  'LAND', 0.18,   3,          'CrossbowmanRUG'),
            (   'ART_DEF_UNIT_U_ENGLISH_LONGBOWMAN',                'ART_DEF_UNIT_MEMBER_U_ENGLISH_LONGBOWMAN',                 'SUG',  'LAND', 0.25,   1,          ''),
        --  SHIP OF THE LINE
            (   'ART_DEF_UNIT_U_ENGLISH_SHIPOFTHELINE',             'ART_DEF_UNIT_MEMBER_U_ENGLISH_SHIPOFTHELINE',              'RED',  'SEA',  0.11,   2,          'Nelson'),
            (   'ART_DEF_UNIT_U_ENGLISH_SHIPOFTHELINE',             'ART_DEF_UNIT_MEMBER_U_ENGLISH_SHIPOFTHELINE',              'RUG',  'SEA',  0.16,   1,          ''),
            (   'ART_DEF_UNIT_U_ENGLISH_SHIPOFTHELINE',             'ART_DEF_UNIT_MEMBER_U_ENGLISH_SHIPOFTHELINE',              'SUG',  'SEA',  0.23,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  ETHIOPIA
        ------- UnitInfo ------------------------------------------ UnitMemberInfo -------------------------------------------- Type -- Domain  Scale - NumMembers  Formation ---
        --  MEHAL SEFARI
            (   'ART_DEF_UNIT_U_ETHIOPIA_MEHAL_SEFARI',             'ART_DEF_UNIT_MEMBER_U_ETHIOPIA_MEHAL_SEFARI',              'RED',  'LAND', 0.088,  19,         'HonorableGunpowderRED'),
            (   'ART_DEF_UNIT_U_ETHIOPIA_MEHAL_SEFARI',             'ART_DEF_UNIT_MEMBER_U_ETHIOPIA_MEHAL_SEFARI',              'RUG',  'LAND', 0.178,  3,          'HonorableGunpowderRUG'),
            (   'ART_DEF_UNIT_U_ETHIOPIA_MEHAL_SEFARI',             'ART_DEF_UNIT_MEMBER_U_ETHIOPIA_MEHAL_SEFARI',              'SUG',  'LAND', 0.248,  1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  FRANCE
        ------- UnitInfo ------------------------------------------ UnitMemberInfo -------------------------------------------- Type -- Domain  Scale - NumMembers  Formation ---
        --	FOREIGN LEGION
            (   'ART_DEF_UNIT_U_FRENCH_FOREIGNLEGION',              'ART_DEF_UNIT_MEMBER_U_FRENCH_FOREIGNLEGION',               'RED',  'LAND', 0.09,   18,         'UnFormedRED'),
            (   'ART_DEF_UNIT_U_FRENCH_FOREIGNLEGION',              'ART_DEF_UNIT_MEMBER_U_FRENCH_FOREIGNLEGION',               'RUG',  'LAND', 0.18,   3,          'UnFormedRUG'),
            (   'ART_DEF_UNIT_U_FRENCH_FOREIGNLEGION',              'ART_DEF_UNIT_MEMBER_U_FRENCH_FOREIGNLEGION',               'SUG',  'LAND', 0.25,   1,          ''),
        --  MUSKETEER
            (   'ART_DEF_UNIT_U_FRENCH_MUSKETEER',                  'ART_DEF_UNIT_MEMBER_U_FRENCH_MUSKETEER',                   'RED',  'LAND', 0.088,  19,         'HonorableGunpowderRED'),
            (   'ART_DEF_UNIT_U_FRENCH_MUSKETEER',                  'ART_DEF_UNIT_MEMBER_U_FRENCH_MUSKETEER',                   'RUG',  'LAND', 0.178,  3,          'HonorableGunpowderRUG'),
            (   'ART_DEF_UNIT_U_FRENCH_MUSKETEER',                  'ART_DEF_UNIT_MEMBER_U_FRENCH_MUSKETEER',                   'SUG',  'LAND', 0.248,  1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  GERMANY
        ------- UnitInfo ------------------------------------------ UnitMemberInfo -------------------------------------------- Type -- Domain  Scale - NumMembers  Formation ---
        --  LANDSKNECHT
            --RED: 1ST ROW - 9 Members (Flat: 1stCenter-2ndCenterL-2ndCenterR-1stMiddleL-1stMiddleR-2ndMiddleL-2ndMiddleR-OuterL-OuterR)
            (   'ART_DEF_UNIT_U_GERMAN_LANDSKNECHT',                'ART_DEF_UNIT_MEMBER_U_GERMAN_LANDSKNECHT_A',               'RED',  'LAND', 0.09,   1,          'Tercio'),
            (   'ART_DEF_UNIT_U_GERMAN_LANDSKNECHT',                'ART_DEF_UNIT_MEMBER_U_GERMAN_LANDSKNECHT_B',               'RED',  'LAND', 0.09,   2,          'Tercio'),
            (   'ART_DEF_UNIT_U_GERMAN_LANDSKNECHT',                'ART_DEF_UNIT_MEMBER_U_GERMAN_LANDSKNECHT_A',               'RED',  'LAND', 0.09,   2,          'Tercio'),
            (   'ART_DEF_UNIT_U_GERMAN_LANDSKNECHT',                'ART_DEF_UNIT_MEMBER_U_GERMAN_LANDSKNECHT_B',               'RED',  'LAND', 0.09,   2,          'Tercio'),
            (   'ART_DEF_UNIT_U_GERMAN_LANDSKNECHT',                'ART_DEF_UNIT_MEMBER_U_GERMAN_LANDSKNECHT_A',               'RED',  'LAND', 0.09,   2,          'Tercio'),
            --RED: 2ND ROW - 9 Members (Flat: 1stCenter-2ndCenterL-2ndCenterR-1stMiddleL-1stMiddleR-2ndMiddleL-2ndMiddleR-OuterL-OuterR)
            (   'ART_DEF_UNIT_U_GERMAN_LANDSKNECHT',                'ART_DEF_UNIT_MEMBER_U_GERMAN_LANDSKNECHT_B',               'RED',  'LAND', 0.09,   1,          'Tercio'),
            (   'ART_DEF_UNIT_U_GERMAN_LANDSKNECHT',                'ART_DEF_UNIT_MEMBER_U_GERMAN_LANDSKNECHT_A',               'RED',  'LAND', 0.09,   2,          'Tercio'),
            (   'ART_DEF_UNIT_U_GERMAN_LANDSKNECHT',                'ART_DEF_UNIT_MEMBER_U_GERMAN_LANDSKNECHT_B',               'RED',  'LAND', 0.09,   2,          'Tercio'),
            (   'ART_DEF_UNIT_U_GERMAN_LANDSKNECHT',                'ART_DEF_UNIT_MEMBER_U_GERMAN_LANDSKNECHT_A',               'RED',  'LAND', 0.09,   2,          'Tercio'),
            (   'ART_DEF_UNIT_U_GERMAN_LANDSKNECHT',                'ART_DEF_UNIT_MEMBER_U_GERMAN_LANDSKNECHT_B',               'RED',  'LAND', 0.09,   2,          'Tercio'),
            --RUG
            (   'ART_DEF_UNIT_U_GERMAN_LANDSKNECHT',                'ART_DEF_UNIT_MEMBER_U_GERMAN_LANDSKNECHT_A',               'RUG',  'LAND', 0.18,   1,          'OffsetPikemanRUG'),
            (   'ART_DEF_UNIT_U_GERMAN_LANDSKNECHT',                'ART_DEF_UNIT_MEMBER_U_GERMAN_LANDSKNECHT_B',               'RUG',  'LAND', 0.18,   2,          'OffsetPikemanRUG'),
            --SUG
            (   'ART_DEF_UNIT_U_GERMAN_LANDSKNECHT',                'ART_DEF_UNIT_MEMBER_U_GERMAN_LANDSKNECHT_A',               'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT_U_GERMAN_LANDSKNECHT',                'ART_DEF_UNIT_MEMBER_U_GERMAN_LANDSKNECHT_B',               'SUG',  'LAND', 0.25,   1,          ''),
        --  PANZER
            (   'ART_DEF_UNIT_U_GERMAN_PANZER',                     'ART_DEF_UNIT_MEMBER_U_GERMAN_PANZER',                      'RED',  'LAND', 0.12,   3,          'Vehicle'),
            (   'ART_DEF_UNIT_U_GERMAN_PANZER',                     'ART_DEF_UNIT_MEMBER_U_GERMAN_PANZER',                      'RUG',  'LAND', 0.175,  2,          'VehicleRUG'),
            (   'ART_DEF_UNIT_U_GERMAN_PANZER',                     'ART_DEF_UNIT_MEMBER_U_GERMAN_PANZER',                      'SUG',  'LAND', 0.247,  1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  GREECE
        ------- UnitInfo ------------------------------------------ UnitMemberInfo -------------------------------------------- Type -- Domain  Scale - NumMembers  Formation ---
        --	COMPANION CAVALRY
            (   'ART_DEF_UNIT_U_GREEK_COMPANIONCAVALRY',            'ART_DEF_UNIT_MEMBER_U_GREEK_COMPANIONCAVALRY',             'RED',  'LAND', 0.085,  7,          'WedgeCavalry'),
            (   'ART_DEF_UNIT_U_GREEK_COMPANIONCAVALRY',            'ART_DEF_UNIT_MEMBER_U_GREEK_COMPANIONCAVALRY',             'RUG',  'LAND', 0.17,   3,          'DefaultCavalryRUG'),
            (   'ART_DEF_UNIT_U_GREEK_COMPANIONCAVALRY',            'ART_DEF_UNIT_MEMBER_U_GREEK_COMPANIONCAVALRY',             'SUG',  'LAND', 0.24,   1,          ''),
        --  HOPLITE
            (   'ART_DEF_UNIT_U_GREEK_HOPLITE',                     'ART_DEF_UNIT_MEMBER_U_GREEK_HOPLITE',                      'RED',  'LAND', 0.09,   18,         'ElitePhalanx'),
            (   'ART_DEF_UNIT_U_GREEK_HOPLITE',                     'ART_DEF_UNIT_MEMBER_U_GREEK_HOPLITE',                      'RUG',  'LAND', 0.18,   3,          'ElitePhalanxRUG'),
            (   'ART_DEF_UNIT_U_GREEK_HOPLITE',                     'ART_DEF_UNIT_MEMBER_U_GREEK_HOPLITE',                      'SUG',  'LAND', 0.25,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  HUNS
        ------- UnitInfo ------------------------------------------ UnitMemberInfo -------------------------------------------- Type -- Domain  Scale - NumMembers  Formation ---
        --	BATTERING RAM
            (   'ART_DEF_UNIT_U_HUNS_BATTERING_RAM',                'ART_DEF_UNIT_MEMBER_U_HUNS_BATTERING_RAM',                 'RED',  'LAND', 0.075,  3,          'CannonLine'),
            (   'ART_DEF_UNIT_U_HUNS_BATTERING_RAM',                'ART_DEF_UNIT_MEMBER_U_HUNS_BATTERING_RAM',                 'RUG',  'LAND', 0.17,   1,          'TwoBigGunsRUG'),
            (   'ART_DEF_UNIT_U_HUNS_BATTERING_RAM',                'ART_DEF_UNIT_MEMBER_U_HUNS_BATTERING_RAM',                 'SUG',  'LAND', 0.24,   1,          ''),
        --  HORSE ARCHER
            (   'ART_DEF_UNIT_U_HUNS_HORSE_ARCHER',                 'ART_DEF_UNIT_MEMBER_U_HUNS_HORSE_ARCHER',                  'RED',  'LAND', 0.085,  7,          'DefaultCavalry'),
            (   'ART_DEF_UNIT_U_HUNS_HORSE_ARCHER',                 'ART_DEF_UNIT_MEMBER_U_HUNS_HORSE_ARCHER',                  'RUG',  'LAND', 0.17,   3,          'DefaultCavalryRUG'),
            (   'ART_DEF_UNIT_U_HUNS_HORSE_ARCHER',                 'ART_DEF_UNIT_MEMBER_U_HUNS_HORSE_ARCHER',                  'SUG',  'LAND', 0.24,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  INCA
        ------- UnitInfo ------------------------------------------ UnitMemberInfo -------------------------------------------- Type -- Domain  Scale - NumMembers  Formation ---
        --  SLINGER
            (   'ART_DEF_UNIT_U_INCAN_SLINGER',                     'ART_DEF_UNIT_MEMBER_U_INCAN_SLINGER',                      'RED',  'LAND', 0.09,   16,         'ArcherRED'),
            (   'ART_DEF_UNIT_U_INCAN_SLINGER',                     'ART_DEF_UNIT_MEMBER_U_INCAN_SLINGER',                      'RUG',  'LAND', 0.18,   3,          'ArcherRUG'),
            (   'ART_DEF_UNIT_U_INCAN_SLINGER',                     'ART_DEF_UNIT_MEMBER_U_INCAN_SLINGER',                      'SUG',  'LAND', 0.25,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  INDIA
        ------- UnitInfo ------------------------------------------ UnitMemberInfo -------------------------------------------- Type -- Domain  Scale - NumMembers  Formation ---
        --  WAR ELEPHANT
            (   'ART_DEF_UNIT_U_INDIAN_WARELEPHANT',                'ART_DEF_UNIT_MEMBER_U_INDIAN_WARELEPHANT',                 'RED',  'LAND', 0.085,  3,          'ChariotElephantRED'),
            (   'ART_DEF_UNIT_U_INDIAN_WARELEPHANT',                'ART_DEF_UNIT_MEMBER_U_INDIAN_WARELEPHANT',                 'RUG',  'LAND', 0.16,   2,          'ChariotElephantRUG'),
            (   'ART_DEF_UNIT_U_INDIAN_WARELEPHANT',                'ART_DEF_UNIT_MEMBER_U_INDIAN_WARELEPHANT',                 'SUG',  'LAND', 0.17,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  INDONESIA
        ------- UnitInfo ------------------------------------------ UnitMemberInfo -------------------------------------------- Type -- Domain  Scale - NumMembers  Formation ---
        --  KRIS SWORDSMAN
            (   'ART_DEF_UNIT_U_INDONESIAN_KRIS_SWORDSMAN',         'ART_DEF_UNIT_MEMBER_U_INDONESIAN_KRIS_SWORDSMAN',          'RED',  'LAND', 0.088,  16,         'DefaultMeleeRED'),
            (   'ART_DEF_UNIT_U_INDONESIAN_KRIS_SWORDSMAN',         'ART_DEF_UNIT_MEMBER_U_INDONESIAN_KRIS_SWORDSMAN',          'RUG',  'LAND', 0.178,  3,          'DefaultMeleeRUG'),
            (   'ART_DEF_UNIT_U_INDONESIAN_KRIS_SWORDSMAN',         'ART_DEF_UNIT_MEMBER_U_INDONESIAN_KRIS_SWORDSMAN',          'SUG',  'LAND', 0.248,  1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  IROQUOIS
        ------- UnitInfo ------------------------------------------ UnitMemberInfo -------------------------------------------- Type -- Domain  Scale - NumMembers  Formation ---
        --  MOHAWK WARRIOR
            (   'ART_DEF_UNIT_U_IROQUOIAN_MOHAWKWARRIOR',           'ART_DEF_UNIT_MEMBER_U_IROQUOIAN_MOHAWKWARRIOR',            'RED',  'LAND', 0.09,   18,         'UnFormedRED'),
            (   'ART_DEF_UNIT_U_IROQUOIAN_MOHAWKWARRIOR',           'ART_DEF_UNIT_MEMBER_U_IROQUOIAN_MOHAWKWARRIOR',            'RUG',  'LAND', 0.18,   3,          'UnFormedRUG'),
            (   'ART_DEF_UNIT_U_IROQUOIAN_MOHAWKWARRIOR',           'ART_DEF_UNIT_MEMBER_U_IROQUOIAN_MOHAWKWARRIOR',            'SUG',  'LAND', 0.26,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  JAPAN
        ------- UnitInfo ------------------------------------------ UnitMemberInfo -------------------------------------------- Type -- Domain  Scale - NumMembers  Formation ---
        --  SAMURAI
            (   'ART_DEF_UNIT_U_JAPANESE_SAMURAI',                  'ART_DEF_UNIT_MEMBER_U_JAPANESE_SAMURAI',                   'RED',  'LAND', 0.09,   18,         'SamuraiRED'),
            (   'ART_DEF_UNIT_U_JAPANESE_SAMURAI',                  'ART_DEF_UNIT_MEMBER_U_JAPANESE_SAMURAI',                   'RUG',  'LAND', 0.18,   3,          'DefaultMeleeRUG'),
            (   'ART_DEF_UNIT_U_JAPANESE_SAMURAI',                  'ART_DEF_UNIT_MEMBER_U_JAPANESE_SAMURAI',                   'SUG',  'LAND', 0.25,   1,          ''),
        --  ZERO
            (   'ART_DEF_UNIT_U_JAPANESE_ZERO',                     'ART_DEF_UNIT_MEMBER_U_JAPANESE_ZERO',                      'RED',  'AIR',  0.06,   4,          'FighterDiamond'),
            (   'ART_DEF_UNIT_U_JAPANESE_ZERO',                     'ART_DEF_UNIT_MEMBER_U_JAPANESE_ZERO',                      'RUG',  'AIR',  0.12,   2,          'FighterWingRUG'),
            (   'ART_DEF_UNIT_U_JAPANESE_ZERO',                     'ART_DEF_UNIT_MEMBER_U_JAPANESE_ZERO',                      'SUG',  'AIR',  0.18,   1,          ''),
            (   'ART_DEF_UNIT_U_JAPANESE_ZERO',                     'ART_DEF_UNIT_MEMBER_U_JAPANESE_ZERO',                      'EAW',  'AIR',  0.077,  3,          'FighterWing'),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  KOREA
        ------- UnitInfo ------------------------------------------ UnitMemberInfo -------------------------------------------- Type -- Domain  Scale - NumMembers  Formation ---
        --  HWACH'A
            (   'ART_DEF_UNIT_U_KOREAN_HWACHA',                     'ART_DEF_UNIT_MEMBER_U_KOREAN_HWACHA',                      'RED',  'LAND', 0.085,  3,          'CannonLine'),
            (   'ART_DEF_UNIT_U_KOREAN_HWACHA',                     'ART_DEF_UNIT_MEMBER_U_KOREAN_HWACHA',                      'RUG',  'LAND', 0.175,  2,          'VehicleRUG'),
            (   'ART_DEF_UNIT_U_KOREAN_HWACHA',                     'ART_DEF_UNIT_MEMBER_U_KOREAN_HWACHA',                      'SUG',  'LAND', 0.245,  1,          ''),
        --	TURTLE SHIP
            (   'ART_DEF_UNIT_U_KOREAN_TURTLESHIP',                 'ART_DEF_UNIT_MEMBER_U_KOREAN_TURTLESHIP',                  'RED',  'SEA',  0.11,   2,          'Colomb'),
            (   'ART_DEF_UNIT_U_KOREAN_TURTLESHIP',                 'ART_DEF_UNIT_MEMBER_U_KOREAN_TURTLESHIP',                  'RUG',  'SEA',  0.165,  1,          ''),
            (   'ART_DEF_UNIT_U_KOREAN_TURTLESHIP',                 'ART_DEF_UNIT_MEMBER_U_KOREAN_TURTLESHIP',                  'SUG',  'SEA',  0.25,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  MAYA
        ------- UnitInfo ------------------------------------------ UnitMemberInfo -------------------------------------------- Type -- Domain  Scale - NumMembers  Formation ---
        --  ATLATLIST
            (   'ART_DEF_UNIT_U_MAYAN_ATLALIST',                    'ART_DEF_UNIT_MEMBER_U_MAYAN_ATLALIST',                     'RED',  'LAND', 0.09,   16,         'ArcherRED'),
            (   'ART_DEF_UNIT_U_MAYAN_ATLALIST',                    'ART_DEF_UNIT_MEMBER_U_MAYAN_ATLALIST',                     'RUG',  'LAND', 0.18,   3,          'ArcherRUG'),
            (   'ART_DEF_UNIT_U_MAYAN_ATLALIST',                    'ART_DEF_UNIT_MEMBER_U_MAYAN_ATLALIST',                     'SUG',  'LAND', 0.25,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  MONGOLIA
        ------- UnitInfo ------------------------------------------ UnitMemberInfo -------------------------------------------- Type -- Domain  Scale - NumMembers  Formation ---
        --	KESHIK
            (   'ART_DEF_UNIT_U_MONGOLIAN_KESHIK',                  'ART_DEF_UNIT_MEMBER_U_MONGOLIAN_KESHIK',                   'RED',  'LAND', 0.085,  7,          'DefaultCavalry'),
            (   'ART_DEF_UNIT_U_MONGOLIAN_KESHIK',                  'ART_DEF_UNIT_MEMBER_U_MONGOLIAN_KESHIK',                   'RUG',  'LAND', 0.17,   3,          'DefaultCavalryRUG'),
            (   'ART_DEF_UNIT_U_MONGOLIAN_KESHIK',                  'ART_DEF_UNIT_MEMBER_U_MONGOLIAN_KESHIK',                   'SUG',  'LAND', 0.24,   1,          ''),
        --  KHAN
            (   'ART_DEF_UNIT_GENERAL_KHAN',                        'ART_DEF_UNIT_MEMBER_GREATGENERAL_KHAN',                    'RED',  'LAND', 0.085,  1,          ''),
            (   'ART_DEF_UNIT_GENERAL_KHAN',                        'ART_DEF_UNIT_MEMBER_GREATGENERAL_KHAN',                    'RUG',  'LAND', 0.17,   1,          ''),
            (   'ART_DEF_UNIT_GENERAL_KHAN',                        'ART_DEF_UNIT_MEMBER_GREATGENERAL_KHAN',                    'SUG',  'LAND', 0.24,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  MOROCCO
        ------- UnitInfo ------------------------------------------ UnitMemberInfo -------------------------------------------- Type -- Domain  Scale - NumMembers  Formation ---
        --  BERBER CAVALRY
            (   'ART_DEF_UNIT_U_MORROCAN_BERBER_CAVALRY',           'ART_DEF_UNIT_MEMBER_U_MORROCAN_BERBER_CAVALRY',            'RED',  'LAND', 0.085,  7,          'DefaultCavalry'),
            (   'ART_DEF_UNIT_U_MORROCAN_BERBER_CAVALRY',           'ART_DEF_UNIT_MEMBER_U_MORROCAN_BERBER_CAVALRY',            'RUG',  'LAND', 0.17,   3,          'DefaultCavalryRUG'),
            (   'ART_DEF_UNIT_U_MORROCAN_BERBER_CAVALRY',           'ART_DEF_UNIT_MEMBER_U_MORROCAN_BERBER_CAVALRY',            'SUG',  'LAND', 0.24,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  NETHERLANDS
        ------- UnitInfo ------------------------------------------ UnitMemberInfo -------------------------------------------- Type -- Domain  Scale - NumMembers  Formation ---
        --  SEA BEGGAR
            (   'ART_DEF_UNIT_U_DUTCH_SEA_BEGGARS',                 'ART_DEF_UNIT_MEMBER_U_DUTCH_SEA_BEGGARS',                  'RED',  'SEA',  0.12,   2,          'Nelson'),
            (   'ART_DEF_UNIT_U_DUTCH_SEA_BEGGARS',                 'ART_DEF_UNIT_MEMBER_U_DUTCH_SEA_BEGGARS',                  'RUG',  'SEA',  0.155,  1,          ''),
            (   'ART_DEF_UNIT_U_DUTCH_SEA_BEGGARS',                 'ART_DEF_UNIT_MEMBER_U_DUTCH_SEA_BEGGARS',                  'SUG',  'SEA',  0.225,  1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  OTTOMAN
        ------- UnitInfo ------------------------------------------ UnitMemberInfo -------------------------------------------- Type -- Domain  Scale - NumMembers  Formation ---
        --  JANISSARY
            (   'ART_DEF_UNIT_U_OTTOMAN_JANISSARY',                 'ART_DEF_UNIT_MEMBER_U_OTTOMAN_JANISSARY',                  'RED',  'LAND', 0.09,   19,         'HonorableGunpowderRED'),
            (   'ART_DEF_UNIT_U_OTTOMAN_JANISSARY',                 'ART_DEF_UNIT_MEMBER_U_OTTOMAN_JANISSARY',                  'RUG',  'LAND', 0.18,   3,          'HonorableGunpowderRUG'),
            (   'ART_DEF_UNIT_U_OTTOMAN_JANISSARY',                 'ART_DEF_UNIT_MEMBER_U_OTTOMAN_JANISSARY',                  'SUG',  'LAND', 0.25,   1,          ''),
        --  SIPAHI
            (   'ART_DEF_UNIT_U_OTTOMAN_SIPAHI',                    'ART_DEF_UNIT_MEMBER_U_OTTOMAN_SIPAHI',                     'RED',  'LAND', 0.085,  7,          'WedgeCavalry'),
            (   'ART_DEF_UNIT_U_OTTOMAN_SIPAHI',                    'ART_DEF_UNIT_MEMBER_U_OTTOMAN_SIPAHI',                     'RUG',  'LAND', 0.17,   3,          'DefaultCavalryRUG'),
            (   'ART_DEF_UNIT_U_OTTOMAN_SIPAHI',                    'ART_DEF_UNIT_MEMBER_U_OTTOMAN_SIPAHI',                     'SUG',  'LAND', 0.24,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  PERSIA
        ------- UnitInfo ------------------------------------------ UnitMemberInfo -------------------------------------------- Type -- Domain  Scale - NumMembers  Formation ---
        --  IMMORTAL
            (   'ART_DEF_UNIT_U_PERSIAN_IMMORTAL',                  'ART_DEF_UNIT_MEMBER_U_PERSIAN_IMMORTAL',                   'RED',  'LAND', 0.09,   20,         'PhalanxRED'),
            (   'ART_DEF_UNIT_U_PERSIAN_IMMORTAL',                  'ART_DEF_UNIT_MEMBER_U_PERSIAN_IMMORTAL',                   'RUG',  'LAND', 0.18,   3,          'PhalanxRUG'),
            (   'ART_DEF_UNIT_U_PERSIAN_IMMORTAL',                  'ART_DEF_UNIT_MEMBER_U_PERSIAN_IMMORTAL',                   'SUG',  'LAND', 0.25,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  POLAND
        ------- UnitInfo ------------------------------------------ UnitMemberInfo -------------------------------------------- Type -- Domain  Scale - NumMembers  Formation ---
        --  WINGED HUSSAR
            (   'ART_DEF_UNIT_U_POLISH_WINGED_HUSSAR',              'ART_DEF_UNIT_MEMBER_U_POLISH_WINGED_HUSSAR',               'RED',  'LAND', 0.085,  7,          'DefaultCavalry'),
            (   'ART_DEF_UNIT_U_POLISH_WINGED_HUSSAR',              'ART_DEF_UNIT_MEMBER_U_POLISH_WINGED_HUSSAR',               'RUG',  'LAND', 0.17,   3,          'DefaultCavalryRUG'),
            (   'ART_DEF_UNIT_U_POLISH_WINGED_HUSSAR',              'ART_DEF_UNIT_MEMBER_U_POLISH_WINGED_HUSSAR',               'SUG',  'LAND', 0.24,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  POLYNESIA
        ------- UnitInfo ------------------------------------------ UnitMemberInfo -------------------------------------------- Type -- Domain  Scale - NumMembers  Formation ---
        --  MAORI WARRIOR
            (   'ART_DEF_UNIT_U_POLYNESIAN_MAORI_WARRIOR',          'ART_DEF_UNIT_MEMBER_U_POLYNESIAN_MAORI_WARRIOR',           'RED',  'LAND', 0.088,  18,         'UnFormedRED'),
            (   'ART_DEF_UNIT_U_POLYNESIAN_MAORI_WARRIOR',          'ART_DEF_UNIT_MEMBER_U_POLYNESIAN_MAORI_WARRIOR',           'RUG',  'LAND', 0.18,   3,          'UnFormedRUG'),
            (   'ART_DEF_UNIT_U_POLYNESIAN_MAORI_WARRIOR',          'ART_DEF_UNIT_MEMBER_U_POLYNESIAN_MAORI_WARRIOR',           'SUG',  'LAND', 0.25,   1,          ''),
        --  WAR CANOE (POLYNESIA'S UNIQUE EMBARKATION)
            (   'ART_DEF_UNIT_U_POLYNESIAN_WAR_CANOE',              'ART_DEF_UNIT_MEMBER_U_POLYNESIAN_WAR_CANOE',               'RED',  'SEA',  0.045,  5,          'Flotilla'),
            (   'ART_DEF_UNIT_U_POLYNESIAN_WAR_CANOE',              'ART_DEF_UNIT_MEMBER_U_POLYNESIAN_WAR_CANOE',               'RUG',  'SEA',  0.088,  2,          'FlotillaRUG'),
            (   'ART_DEF_UNIT_U_POLYNESIAN_WAR_CANOE',              'ART_DEF_UNIT_MEMBER_U_POLYNESIAN_WAR_CANOE',               'SUG',  'SEA',  0.12,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  PORTUGAL
        ------- UnitInfo ------------------------------------------ UnitMemberInfo -------------------------------------------- Type -- Domain  Scale - NumMembers  Formation ---
        --  NAU
            (   'ART_DEF_UNIT_U_PORTUGUESE_CARRACK',                'ART_DEF_UNIT_MEMBER_U_PORTUGUESE_CARRACK',                 'RED',  'SEA',  0.1,    3,          'Flotilla'),
            (   'ART_DEF_UNIT_U_PORTUGUESE_CARRACK',                'ART_DEF_UNIT_MEMBER_U_PORTUGUESE_CARRACK',                 'RUG',  'SEA',  0.152,  1,          ''),
            (   'ART_DEF_UNIT_U_PORTUGUESE_CARRACK',                'ART_DEF_UNIT_MEMBER_U_PORTUGUESE_CARRACK',                 'SUG',  'SEA',  0.22,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  ROME
        ------- UnitInfo ------------------------------------------ UnitMemberInfo -------------------------------------------- Type -- Domain  Scale - NumMembers  Formation ---
        --  LEGION
            (   'ART_DEF_UNIT_U_ROMAN_LEGION',                      'ART_DEF_UNIT_MEMBER_U_ROMAN_LEGION',                       'RED',  'LAND', 0.09,   16,         'Square'),
            (   'ART_DEF_UNIT_U_ROMAN_LEGION',                      'ART_DEF_UNIT_MEMBER_U_ROMAN_LEGION',                       'RUG',  'LAND', 0.18,   3,          'PhalanxRUG'),
            (   'ART_DEF_UNIT_U_ROMAN_LEGION',                      'ART_DEF_UNIT_MEMBER_U_ROMAN_LEGION',                       'SUG',  'LAND', 0.25,   1,          ''),
        --	BALLISTA
            (   'ART_DEF_UNIT_U_ROMAN_BALLISTA',                    'ART_DEF_UNIT_MEMBER_U_ROMAN_BALLISTA',                     'RED',  'LAND', 0.09,   3,          'CannonLine'),
            (   'ART_DEF_UNIT_U_ROMAN_BALLISTA',                    'ART_DEF_UNIT_MEMBER_U_ROMAN_BALLISTA',                     'RUG',  'LAND', 0.17,   2,          'TwoBigGunsRUG'),
            (   'ART_DEF_UNIT_U_ROMAN_BALLISTA',                    'ART_DEF_UNIT_MEMBER_U_ROMAN_BALLISTA',                     'SUG',  'LAND', 0.24,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  RUSSIA
        ------- UnitInfo ------------------------------------------ UnitMemberInfo -------------------------------------------- Type -- Domain  Scale - NumMembers  Formation ---
        --  COSSACK
            --RED: 1ST ROW (Flat: Center-Right-Left)
            (   'ART_DEF_UNIT_U_RUSSIAN_COSSACK',                   'ART_DEF_UNIT_MEMBER_U_RUSSIAN_COSSACK',                    'RED',  'LAND', 0.085,  1,          'DefaultCavalry'),
            (   'ART_DEF_UNIT_U_RUSSIAN_COSSACK',                   'ART_DEF_UNIT_MEMBER_U_RUSSIAN_COSSACK_V2',                 'RED',  'LAND', 0.085,  2,          'DefaultCavalry'),
            --RED: 2ND ROW (Flat: InnerLeft-InnerRight-OuterLeft-OuterRight)
            (   'ART_DEF_UNIT_U_RUSSIAN_COSSACK',                   'ART_DEF_UNIT_MEMBER_U_RUSSIAN_COSSACK_V3',                 'RED',  'LAND', 0.085,  2,          'DefaultCavalry'),
            (   'ART_DEF_UNIT_U_RUSSIAN_COSSACK',                   'ART_DEF_UNIT_MEMBER_U_RUSSIAN_COSSACK',                    'RED',  'LAND', 0.085,  2,          'DefaultCavalry'),
            --RUG
            (   'ART_DEF_UNIT_U_RUSSIAN_COSSACK',                   'ART_DEF_UNIT_MEMBER_U_RUSSIAN_COSSACK',                    'RUG',  'LAND', 0.17,   1,          'DefaultCavalryRUG'),
            (   'ART_DEF_UNIT_U_RUSSIAN_COSSACK',                   'ART_DEF_UNIT_MEMBER_U_RUSSIAN_COSSACK_V2',                 'RUG',  'LAND', 0.17,   1,          'DefaultCavalryRUG'),
            (   'ART_DEF_UNIT_U_RUSSIAN_COSSACK',                   'ART_DEF_UNIT_MEMBER_U_RUSSIAN_COSSACK_V3',                 'RUG',  'LAND', 0.17,   1,          'DefaultCavalryRUG'),
            --SUG
            (   'ART_DEF_UNIT_U_RUSSIAN_COSSACK',                   'ART_DEF_UNIT_MEMBER_U_RUSSIAN_COSSACK',                    'SUG',  'LAND', 0.24,   1,          ''),
            --(   'ART_DEF_UNIT_U_RUSSIAN_COSSACK',                   'ART_DEF_UNIT_MEMBER_U_RUSSIAN_COSSACK_V2',                 'SUG',  'LAND', 0.24,   1,          ''),
            --(   'ART_DEF_UNIT_U_RUSSIAN_COSSACK',                   'ART_DEF_UNIT_MEMBER_U_RUSSIAN_COSSACK_V3',                 'SUG',  'LAND', 0.24,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  SHOSHONE
        ------- UnitInfo ------------------------------------------ UnitMemberInfo -------------------------------------------- Type -- Domain  Scale - NumMembers  Formation ---
        --  COMANCHE RIDERS
            (   'ART_DEF_UNIT_U_SHOSHONE_COMANCHE_RIDERS',          'ART_DEF_UNIT_MEMBER_U_SHOSHONE_COMANCHE_RIDERS',           'RED',  'LAND', 0.085,  7,          'DefaultCavalry'),
            (   'ART_DEF_UNIT_U_SHOSHONE_COMANCHE_RIDERS',          'ART_DEF_UNIT_MEMBER_U_SHOSHONE_COMANCHE_RIDERS',           'RUG',  'LAND', 0.17,   3,          'DefaultCavalryRUG'),
            (   'ART_DEF_UNIT_U_SHOSHONE_COMANCHE_RIDERS',          'ART_DEF_UNIT_MEMBER_U_SHOSHONE_COMANCHE_RIDERS',           'SUG',  'LAND', 0.24,   1,          ''),
        --	PATHFINDER
            (   'ART_DEF_UNIT_U_SHOSHONE_PATHFINDER',               'ART_DEF_UNIT_MEMBER_U_SHOSHONE_PATHFINDER',                'RED',  'LAND', 0.088,  12,         'ScoutRED'),
            (   'ART_DEF_UNIT_U_SHOSHONE_PATHFINDER',               'ART_DEF_UNIT_MEMBER_U_SHOSHONE_PATHFINDER',                'RUG',  'LAND', 0.18,   3,          'UnFormedRUG'),
            (   'ART_DEF_UNIT_U_SHOSHONE_PATHFINDER',               'ART_DEF_UNIT_MEMBER_U_SHOSHONE_PATHFINDER',                'SUG',  'LAND', 0.22,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  SIAM
        ------- UnitInfo ------------------------------------------ UnitMemberInfo -------------------------------------------- Type -- Domain  Scale - NumMembers  Formation ---
        --  NASERUAN'S ELEPHANT
            (   'ART_DEF_UNIT_U_SIAMESE_WARELEPHANT',               'ART_DEF_UNIT_MEMBER_U_SIAMESE_WARELEPHANT',                'RED',  'LAND', 0.085,  3,          'ChariotElephantRED'),
            (   'ART_DEF_UNIT_U_SIAMESE_WARELEPHANT',               'ART_DEF_UNIT_MEMBER_U_SIAMESE_WARELEPHANT',                'RUG',  'LAND', 0.16,   2,          'ChariotElephantRUG'),
            (   'ART_DEF_UNIT_U_SIAMESE_WARELEPHANT',               'ART_DEF_UNIT_MEMBER_U_SIAMESE_WARELEPHANT',                'SUG',  'LAND', 0.20,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  SONGHAI
        ------- UnitInfo ------------------------------------------ UnitMemberInfo -------------------------------------------- Type -- Domain  Scale - NumMembers  Formation ---
        --  MANDEKALU CAVALRY
            (   'ART_DEF_UNIT_U_SONGHAI_MUSLIMCAVALRY',             'ART_DEF_UNIT_MEMBER_U_SONGHAI_MUSLIMCAVALRY',              'RED',  'LAND', 0.085,  7,          'WedgeCavalry'),
            (   'ART_DEF_UNIT_U_SONGHAI_MUSLIMCAVALRY',             'ART_DEF_UNIT_MEMBER_U_SONGHAI_MUSLIMCAVALRY',              'RUG',  'LAND', 0.17,   3,          'DefaultCavalryRUG'),
            (   'ART_DEF_UNIT_U_SONGHAI_MUSLIMCAVALRY',             'ART_DEF_UNIT_MEMBER_U_SONGHAI_MUSLIMCAVALRY',              'SUG',  'LAND', 0.24,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  SPAIN
        ------- UnitInfo ------------------------------------------ UnitMemberInfo -------------------------------------------- Type -- Domain  Scale - NumMembers  Formation ---
        --  CONQUISTADOR
            (   'ART_DEF_UNIT_U_SPANISH_CONQUISTADOR',              'ART_DEF_UNIT_MEMBER_U_SPANISH_CONQUISTADOR',               'RED',  'LAND', 0.085,  7,          'DefaultCavalry'),
            (   'ART_DEF_UNIT_U_SPANISH_CONQUISTADOR',              'ART_DEF_UNIT_MEMBER_U_SPANISH_CONQUISTADOR',               'RUG',  'LAND', 0.17,   3,          'DefaultCavalryRUG'),
            (   'ART_DEF_UNIT_U_SPANISH_CONQUISTADOR',              'ART_DEF_UNIT_MEMBER_U_SPANISH_CONQUISTADOR',               'SUG',  'LAND', 0.24,   1,          ''),
        --	TERCIO
            --RED
            (   'ART_DEF_UNIT_U_SPANISH_TERCIO',                    'ART_DEF_UNIT_MEMBER_U_SPANISH_TERCIO_PIQUERO',             'RED',  'LAND', 0.09,   9,          'Tercio'),
            (   'ART_DEF_UNIT_U_SPANISH_TERCIO',                    'ART_DEF_UNIT_MEMBER_U_SPANISH_TERCIO_ARCABUCERO',          'RED',  'LAND', 0.09,   9,          'Tercio'),
            --RUG
            (   'ART_DEF_UNIT_U_SPANISH_TERCIO',                    'ART_DEF_UNIT_MEMBER_U_SPANISH_TERCIO_PIQUERO',             'RUG',  'LAND', 0.18,   1,          'OffsetPikemanRUG'),
            (   'ART_DEF_UNIT_U_SPANISH_TERCIO',                    'ART_DEF_UNIT_MEMBER_U_SPANISH_TERCIO_ARCABUCERO',          'RUG',  'LAND', 0.18,   2,          'OffsetPikemanRUG'),
            --SUG
            --(   'ART_DEF_UNIT_U_SPANISH_TERCIO',                    'ART_DEF_UNIT_MEMBER_U_SPANISH_TERCIO_PIQUERO',             'SUG',  'LAND', 0.25,   1,          ''),
            (   'ART_DEF_UNIT_U_SPANISH_TERCIO',                    'ART_DEF_UNIT_MEMBER_U_SPANISH_TERCIO_ARCABUCERO',          'SUG',  'LAND', 0.25,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  SWEDEN
        ------- UnitInfo ------------------------------------------ UnitMemberInfo -------------------------------------------- Type -- Domain  Scale - NumMembers  Formation ---
        --  CAROLEAN
            (   'ART_DEF_UNIT_U_SWEDISH_CAROLEAN',                  'ART_DEF_UNIT_MEMBER_U_SWEDISH_CAROLEAN',                   'RED',  'LAND', 0.09,   19,         'HonorableGunpowderRED'),
            (   'ART_DEF_UNIT_U_SWEDISH_CAROLEAN',                  'ART_DEF_UNIT_MEMBER_U_SWEDISH_CAROLEAN',                   'RUG',  'LAND', 0.18,   3,          'HonorableGunpowderRUG'),
            (   'ART_DEF_UNIT_U_SWEDISH_CAROLEAN',                  'ART_DEF_UNIT_MEMBER_U_SWEDISH_CAROLEAN',                   'SUG',  'LAND', 0.25,   1,          ''),
        --  HAKKAPELIITTA
            (   'ART_DEF_UNIT_U_SWEDISH_HAKKAPELITTA',              'ART_DEF_UNIT_MEMBER_U_SWEDISH_HAKKAPELITTA',               'RED',  'LAND', 0.085,  7,          'WedgeCavalry'),
            (   'ART_DEF_UNIT_U_SWEDISH_HAKKAPELITTA',              'ART_DEF_UNIT_MEMBER_U_SWEDISH_HAKKAPELITTA',               'RUG',  'LAND', 0.17,   3,          'DefaultCavalryRUG'),
            (   'ART_DEF_UNIT_U_SWEDISH_HAKKAPELITTA',              'ART_DEF_UNIT_MEMBER_U_SWEDISH_HAKKAPELITTA',               'SUG',  'LAND', 0.24,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  VENICE
        ------- UnitInfo ------------------------------------------ UnitMemberInfo -------------------------------------------- Type -- Domain  Scale - NumMembers  Formation ---
        --  MERCHANT OF VENICE
            (   'ART_DEF_UNIT_U_VENETIAN_MERCHANT',                 'ART_DEF_UNIT_MEMBER_U_VENETIAN_MERCHANT',                  'RED',  'LAND', 0.09,   1,          'EarlyGreatMerchant'),
            (   'ART_DEF_UNIT_U_VENETIAN_MERCHANT',                 'ART_DEF_UNIT_MEMBER_U_VENETIAN_MERCHANT',                  'RUG',  'LAND', 0.18,   1,          'EarlyGreatMerchantRUG'),
            (   'ART_DEF_UNIT_U_VENETIAN_MERCHANT',                 'ART_DEF_UNIT_MEMBER_U_VENETIAN_MERCHANT',                  'SUG',  'LAND', 0.25,   1,          ''),
        --	GREAT GALLEASS
            (   'ART_DEF_UNIT_U_VENETIAN_GALLEASS',                 'ART_DEF_UNIT_MEMBER_U_VENETIAN_GALLEASS',                  'RED',  'SEA',  0.10,   1,          ''),
            (   'ART_DEF_UNIT_U_VENETIAN_GALLEASS',                 'ART_DEF_UNIT_MEMBER_U_VENETIAN_GALLEASS',                  'RUG',  'SEA',  0.165,  1,          ''),
            (   'ART_DEF_UNIT_U_VENETIAN_GALLEASS',                 'ART_DEF_UNIT_MEMBER_U_VENETIAN_GALLEASS',                  'SUG',  'SEA',  0.235,  1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  ZULU
        ------- UnitInfo ------------------------------------------ UnitMemberInfo -------------------------------------------- Type -- Domain  Scale - NumMembers  Formation ---
        --  IMPI
            --RED
            (   'ART_DEF_UNIT_U_ZULU_IMPI_WARRIOR',                 'ART_DEF_UNIT_MEMBER_U_ZULU_IMPI_WARRIOR',                  'RED',  'LAND', 0.088,  2,          'UnFormedRED'),
            (   'ART_DEF_UNIT_U_ZULU_IMPI_WARRIOR',                 'ART_DEF_UNIT_MEMBER_U_ZULU_IMPI_WARRIOR_V2',               'RED',  'LAND', 0.088,  2,          'UnFormedRED'),
            (   'ART_DEF_UNIT_U_ZULU_IMPI_WARRIOR',                 'ART_DEF_UNIT_MEMBER_U_ZULU_IMPI_WARRIOR_V3',               'RED',  'LAND', 0.088,  3,          'UnFormedRED'),
            (   'ART_DEF_UNIT_U_ZULU_IMPI_WARRIOR',                 'ART_DEF_UNIT_MEMBER_U_ZULU_IMPI_WARRIOR_V2',               'RED',  'LAND', 0.088,  1,          'UnFormedRED'),
            (   'ART_DEF_UNIT_U_ZULU_IMPI_WARRIOR',                 'ART_DEF_UNIT_MEMBER_U_ZULU_IMPI_WARRIOR',                  'RED',  'LAND', 0.088,  1,          'UnFormedRED'),
            (   'ART_DEF_UNIT_U_ZULU_IMPI_WARRIOR',                 'ART_DEF_UNIT_MEMBER_U_ZULU_IMPI_WARRIOR_V3',               'RED',  'LAND', 0.088,  2,          'UnFormedRED'),
            (   'ART_DEF_UNIT_U_ZULU_IMPI_WARRIOR',                 'ART_DEF_UNIT_MEMBER_U_ZULU_IMPI_WARRIOR',                  'RED',  'LAND', 0.088,  2,          'UnFormedRED'),
            (   'ART_DEF_UNIT_U_ZULU_IMPI_WARRIOR',                 'ART_DEF_UNIT_MEMBER_U_ZULU_IMPI_WARRIOR_V3',               'RED',  'LAND', 0.088,  2,          'UnFormedRED'),
            (   'ART_DEF_UNIT_U_ZULU_IMPI_WARRIOR',                 'ART_DEF_UNIT_MEMBER_U_ZULU_IMPI_WARRIOR_V2',               'RED',  'LAND', 0.088,  1,          'UnFormedRED'),
            (   'ART_DEF_UNIT_U_ZULU_IMPI_WARRIOR',                 'ART_DEF_UNIT_MEMBER_U_ZULU_IMPI_WARRIOR',                  'RED',  'LAND', 0.088,  1,          'UnFormedRED'),
            (   'ART_DEF_UNIT_U_ZULU_IMPI_WARRIOR',                 'ART_DEF_UNIT_MEMBER_U_ZULU_IMPI_WARRIOR_V2',               'RED',  'LAND', 0.088,  1,          'UnFormedRED'),
            (   'ART_DEF_UNIT_U_ZULU_IMPI_WARRIOR',                 'ART_DEF_UNIT_MEMBER_U_ZULU_IMPI_WARRIOR_V3',               'RED',  'LAND', 0.088,  1,          'UnFormedRED'),
            --RUG
            (   'ART_DEF_UNIT_U_ZULU_IMPI_WARRIOR',                 'ART_DEF_UNIT_MEMBER_U_ZULU_IMPI_WARRIOR',                  'RUG',  'LAND', 0.178,  1,          'UnFormedRUG'),
            (   'ART_DEF_UNIT_U_ZULU_IMPI_WARRIOR',                 'ART_DEF_UNIT_MEMBER_U_ZULU_IMPI_WARRIOR_V2',               'RUG',  'LAND', 0.178,  1,          'UnFormedRUG'),
            (   'ART_DEF_UNIT_U_ZULU_IMPI_WARRIOR',                 'ART_DEF_UNIT_MEMBER_U_ZULU_IMPI_WARRIOR_V3',               'RUG',  'LAND', 0.178,  1,          'UnFormedRUG'),
            --RUG
            (   'ART_DEF_UNIT_U_ZULU_IMPI_WARRIOR',                 'ART_DEF_UNIT_MEMBER_U_ZULU_IMPI_WARRIOR',                  'SUG',  'LAND', 0.248,  1,          ''),
            --(   'ART_DEF_UNIT_U_ZULU_IMPI_WARRIOR',                 'ART_DEF_UNIT_MEMBER_U_ZULU_IMPI_WARRIOR_V2',               'SUG',  'LAND', 0.248,  1,          ''),
            --(   'ART_DEF_UNIT_U_ZULU_IMPI_WARRIOR',                 'ART_DEF_UNIT_MEMBER_U_ZULU_IMPI_WARRIOR_V3',               'SUG',  'LAND', 0.248,  1,          ''),
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  END OF INSERT 

            (   'END_OF_INSERT', '', '', NULL, 0, 0, '');

DELETE  FROM ArtDefine_USnF WHERE USnF_UnitInfo = 'END_OF_INSERT';
