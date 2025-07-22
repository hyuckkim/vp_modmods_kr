/*
    Unit Scaling and Formation

    ArtDefine configuration file
    by N.Core

    For all base land military units.

    Note for inserting into ArtDefine_UnitInfoMemberInfos:
    To adjust what kind of UnitMemberInfo model you want to use for a UnitInfo,
    just simply add/remove the comment syntax '--' on the desired UnitMemberInfo insertion.
*/

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT  INTO ArtDefine_USnF (USnF_UnitInfo, USnF_UnitMemberInfo, USnF_Type, USnF_Domain, USnF_Scale, USnF_NumMembers, USnF_Formation) VALUES
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  Land Military Units
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  ANCIENT ERA
        ------- UnitInfo -------------------------- UnitMemberInfo ---------------------------- Type -- Domain  Scale - NumMembers  Formation -----------------------------------
        --  ARCHER
            --RED
            (   'ART_DEF_UNIT_ARCHER',              'ART_DEF_UNIT_MEMBER_ARCHER_V2',            'RED',  'LAND', 0.09,   3,          'ArcherRED'),
            (   'ART_DEF_UNIT_ARCHER',              'ART_DEF_UNIT_MEMBER_ARCHER_V3',            'RED',  'LAND', 0.09,   1,          'ArcherRED'),
            (   'ART_DEF_UNIT_ARCHER',              'ART_DEF_UNIT_MEMBER_ARCHER',               'RED',  'LAND', 0.09,   2,          'ArcherRED'),
            (   'ART_DEF_UNIT_ARCHER',              'ART_DEF_UNIT_MEMBER_ARCHER_V2',            'RED',  'LAND', 0.09,   2,          'ArcherRED'),
            (   'ART_DEF_UNIT_ARCHER',              'ART_DEF_UNIT_MEMBER_ARCHER',               'RED',  'LAND', 0.09,   1,          'ArcherRED'),
            (   'ART_DEF_UNIT_ARCHER',              'ART_DEF_UNIT_MEMBER_ARCHER_V3',            'RED',  'LAND', 0.09,   3,          'ArcherRED'),
            (   'ART_DEF_UNIT_ARCHER',              'ART_DEF_UNIT_MEMBER_ARCHER_V2',            'RED',  'LAND', 0.09,   1,          'ArcherRED'),
            (   'ART_DEF_UNIT_ARCHER',              'ART_DEF_UNIT_MEMBER_ARCHER',               'RED',  'LAND', 0.09,   2,          'ArcherRED'),
            (   'ART_DEF_UNIT_ARCHER',              'ART_DEF_UNIT_MEMBER_ARCHER_V3',            'RED',  'LAND', 0.09,   1,          'ArcherRED'),
            --RUG
            (   'ART_DEF_UNIT_ARCHER',              'ART_DEF_UNIT_MEMBER_ARCHER_V2',            'RUG',  'LAND', 0.18,   1,          'ArcherRUG'),
            (   'ART_DEF_UNIT_ARCHER',              'ART_DEF_UNIT_MEMBER_ARCHER',               'RUG',  'LAND', 0.18,   1,          'ArcherRUG'),
            (   'ART_DEF_UNIT_ARCHER',              'ART_DEF_UNIT_MEMBER_ARCHER_V3',            'RUG',  'LAND', 0.18,   1,          'ArcherRUG'),
            --SUG
            (   'ART_DEF_UNIT_ARCHER',              'ART_DEF_UNIT_MEMBER_ARCHER',               'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT_ARCHER',              'ART_DEF_UNIT_MEMBER_ARCHER_V2',            'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT_ARCHER',              'ART_DEF_UNIT_MEMBER_ARCHER_V3',            'SUG',  'LAND', 0.25,   1,          ''),
        --  WARRIOR
            --RED
            (   'ART_DEF_UNIT__WARRIOR',            'ART_DEF_UNIT_MEMBER_WARRIOR',              'RED',  'LAND', 0.09,   2,          'WarriorRED'),
            (   'ART_DEF_UNIT__WARRIOR',            'ART_DEF_UNIT_MEMBER_WARRIOR_V2',           'RED',  'LAND', 0.09,   2,          'WarriorRED'),
            (   'ART_DEF_UNIT__WARRIOR',            'ART_DEF_UNIT_MEMBER_WARRIOR_V4',           'RED',  'LAND', 0.09,   1,          'WarriorRED'),
            (   'ART_DEF_UNIT__WARRIOR',            'ART_DEF_UNIT_MEMBER_WARRIOR',              'RED',  'LAND', 0.09,   2,          'WarriorRED'),
            (   'ART_DEF_UNIT__WARRIOR',            'ART_DEF_UNIT_MEMBER_WARRIOR_V2',           'RED',  'LAND', 0.09,   2,          'WarriorRED'),
            (   'ART_DEF_UNIT__WARRIOR',            'ART_DEF_UNIT_MEMBER_WARRIOR',              'RED',  'LAND', 0.09,   1,          'WarriorRED'),
            (   'ART_DEF_UNIT__WARRIOR',            'ART_DEF_UNIT_MEMBER_WARRIOR_V4',           'RED',  'LAND', 0.09,   2,          'WarriorRED'),
            (   'ART_DEF_UNIT__WARRIOR',            'ART_DEF_UNIT_MEMBER_WARRIOR',              'RED',  'LAND', 0.09,   1,          'WarriorRED'),
            (   'ART_DEF_UNIT__WARRIOR',            'ART_DEF_UNIT_MEMBER_WARRIOR_V4',           'RED',  'LAND', 0.09,   2,          'WarriorRED'),
            (   'ART_DEF_UNIT__WARRIOR',            'ART_DEF_UNIT_MEMBER_WARRIOR_V2',           'RED',  'LAND', 0.09,   1,          'WarriorRED'),
            (   'ART_DEF_UNIT__WARRIOR',            'ART_DEF_UNIT_MEMBER_WARRIOR',              'RED',  'LAND', 0.09,   1,          'WarriorRED'),
            (   'ART_DEF_UNIT__WARRIOR',            'ART_DEF_UNIT_MEMBER_WARRIOR_V2',           'RED',  'LAND', 0.09,   1,          'WarriorRED'),
            (   'ART_DEF_UNIT__WARRIOR',            'ART_DEF_UNIT_MEMBER_WARRIOR',              'RED',  'LAND', 0.09,   1,          'WarriorRED'),
            (   'ART_DEF_UNIT__WARRIOR',            'ART_DEF_UNIT_MEMBER_WARRIOR_V4',           'RED',  'LAND', 0.09,   1,          'WarriorRED'),
            --RUG
            (   'ART_DEF_UNIT__WARRIOR',            'ART_DEF_UNIT_MEMBER_WARRIOR_V2',           'RUG',  'LAND', 0.18,   1,          'WarriorRUG'),
            (   'ART_DEF_UNIT__WARRIOR',            'ART_DEF_UNIT_MEMBER_WARRIOR',              'RUG',  'LAND', 0.18,   1,          'WarriorRUG'),
            (   'ART_DEF_UNIT__WARRIOR',            'ART_DEF_UNIT_MEMBER_WARRIOR_V4',           'RUG',  'LAND', 0.18,   1,          'WarriorRUG'),
            --SUG
            (   'ART_DEF_UNIT__WARRIOR',            'ART_DEF_UNIT_MEMBER_WARRIOR',              'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT__WARRIOR',            'ART_DEF_UNIT_MEMBER_WARRIOR_V2',           'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT__WARRIOR',            'ART_DEF_UNIT_MEMBER_WARRIOR_V4',           'SUG',  'LAND', 0.25,   1,          ''),
        --  CHARIOT ARCHER
            (   'ART_DEF_UNIT_CHARIOT_ARCHER',      'ART_DEF_UNIT_MEMBER_CHARIOTARCHER',        'RED',  'LAND', 0.085,  3,          'ChariotElephantRED'),
            (   'ART_DEF_UNIT_CHARIOT_ARCHER',      'ART_DEF_UNIT_MEMBER_CHARIOTARCHER',        'RUG',  'LAND', 0.17,   2,          'ChariotElephantRUG'),
            (   'ART_DEF_UNIT_CHARIOT_ARCHER',      'ART_DEF_UNIT_MEMBER_CHARIOTARCHER',        'SUG',  'LAND', 0.185,   1,          ''),
        --	HORSEMAN
            (   'ART_DEF_UNIT_HORSEMAN',            'ART_DEF_UNIT_MEMBER_HORSEMAN',             'RED',  'LAND', 0.085,  7,          'DefaultCavalry'),
            (   'ART_DEF_UNIT_HORSEMAN',            'ART_DEF_UNIT_MEMBER_HORSEMAN',             'RUG',  'LAND', 0.17,   3,          'DefaultCavalryRUG'),
            (   'ART_DEF_UNIT_HORSEMAN',            'ART_DEF_UNIT_MEMBER_HORSEMAN',             'SUG',  'LAND', 0.24,   1,          ''),
        --	SCOUT
            (   'ART_DEF_UNIT_SCOUT',               'ART_DEF_UNIT_MEMBER_SCOUT',                'RED',  'LAND', 0.088,  12,         'ScoutRED'),
            (   'ART_DEF_UNIT_SCOUT',               'ART_DEF_UNIT_MEMBER_SCOUT',                'RUG',  'LAND', 0.18,   3,          'ScoutRUG'),
            (   'ART_DEF_UNIT_SCOUT',               'ART_DEF_UNIT_MEMBER_SCOUT',                'SUG',  'LAND', 0.25,   1,          ''),
        --	SPEARMAN
            --RED
            (   'ART_DEF_UNIT_SPEARMAN',            'ART_DEF_UNIT_MEMBER_SPEARMAN_V2',          'RED',  'LAND', 0.09,   3,          'PhalanxRED'),
            (   'ART_DEF_UNIT_SPEARMAN',            'ART_DEF_UNIT_MEMBER_SPEARMAN',             'RED',  'LAND', 0.09,   2,          'PhalanxRED'),
            (   'ART_DEF_UNIT_SPEARMAN',            'ART_DEF_UNIT_MEMBER_SPEARMAN_V3',          'RED',  'LAND', 0.09,   2,          'PhalanxRED'),
            (   'ART_DEF_UNIT_SPEARMAN',            'ART_DEF_UNIT_MEMBER_SPEARMAN_V2',          'RED',  'LAND', 0.09,   1,          'PhalanxRED'),
            (   'ART_DEF_UNIT_SPEARMAN',            'ART_DEF_UNIT_MEMBER_SPEARMAN',             'RED',  'LAND', 0.09,   2,          'PhalanxRED'),
            (   'ART_DEF_UNIT_SPEARMAN',            'ART_DEF_UNIT_MEMBER_SPEARMAN_V3',          'RED',  'LAND', 0.09,   1,          'PhalanxRED'),
            (   'ART_DEF_UNIT_SPEARMAN',            'ART_DEF_UNIT_MEMBER_SPEARMAN',             'RED',  'LAND', 0.09,   4,          'PhalanxRED'),
            (   'ART_DEF_UNIT_SPEARMAN',            'ART_DEF_UNIT_MEMBER_SPEARMAN_V2',          'RED',  'LAND', 0.09,   2,          'PhalanxRED'),
            (   'ART_DEF_UNIT_SPEARMAN',            'ART_DEF_UNIT_MEMBER_SPEARMAN_V3',          'RED',  'LAND', 0.09,   3,          'PhalanxRED'),
            --RUG
            (   'ART_DEF_UNIT_SPEARMAN',            'ART_DEF_UNIT_MEMBER_SPEARMAN_V2',          'RUG',  'LAND', 0.18,   1,          'PhalanxRUG'),
            (   'ART_DEF_UNIT_SPEARMAN',            'ART_DEF_UNIT_MEMBER_SPEARMAN',             'RUG',  'LAND', 0.18,   1,          'PhalanxRUG'),
            (   'ART_DEF_UNIT_SPEARMAN',            'ART_DEF_UNIT_MEMBER_SPEARMAN_V3',          'RUG',  'LAND', 0.18,   1,          'PhalanxRUG'),
            --SUG
            (   'ART_DEF_UNIT_SPEARMAN',            'ART_DEF_UNIT_MEMBER_SPEARMAN',             'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT_SPEARMAN',            'ART_DEF_UNIT_MEMBER_SPEARMAN_V2',          'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT_SPEARMAN',            'ART_DEF_UNIT_MEMBER_SPEARMAN_V3',          'SUG',  'LAND', 0.25,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  CLASSICAL ERA
        ------- UnitInfo -------------------------- UnitMemberInfo ---------------------------- Type -- Domain  Scale - NumMembers  Formation -----------------------------------
        --	CATAPULT
            (   'ART_DEF_UNIT_CATAPULT',            'ART_DEF_UNIT_MEMBER_CATAPULT',             'RED',  'LAND', 0.09,   4,          'ThreeBigGuns'),
            (   'ART_DEF_UNIT_CATAPULT',            'ART_DEF_UNIT_MEMBER_CATAPULT',             'RUG',  'LAND', 0.17,   2,          'TwoBigGunsRUG'),
            (   'ART_DEF_UNIT_CATAPULT',            'ART_DEF_UNIT_MEMBER_CATAPULT',             'SUG',  'LAND', 0.18,   1,          ''),
        --	COMPOSITE BOWMAN
            (   'ART_DEF_UNIT_COMPOSITE_BOWMAN',    'ART_DEF_UNIT_MEMBER_COMPOSITE_BOWMAN',     'RED',  'LAND', 0.09,   16,         'ArcherRED'),
            (   'ART_DEF_UNIT_COMPOSITE_BOWMAN',    'ART_DEF_UNIT_MEMBER_COMPOSITE_BOWMAN',     'RUG',  'LAND', 0.18,   3,          'ArcherRUG'),
            (   'ART_DEF_UNIT_COMPOSITE_BOWMAN',    'ART_DEF_UNIT_MEMBER_COMPOSITE_BOWMAN',     'SUG',  'LAND', 0.25,   1,          ''),
        --	SWORDSMAN
            --RED
            (   'ART_DEF_UNIT_SWORDSMAN',           'ART_DEF_UNIT_MEMBER_SWORDSMAN_V2',         'RED',  'LAND', 0.09,   2,          'DefaultMeleeRED'),
            (   'ART_DEF_UNIT_SWORDSMAN',           'ART_DEF_UNIT_MEMBER_SWORDSMAN',            'RED',  'LAND', 0.09,   1,          'DefaultMeleeRED'),
            (   'ART_DEF_UNIT_SWORDSMAN',           'ART_DEF_UNIT_MEMBER_SWORDSMAN_V3',         'RED',  'LAND', 0.09,   2,          'DefaultMeleeRED'),
            (   'ART_DEF_UNIT_SWORDSMAN',           'ART_DEF_UNIT_MEMBER_SWORDSMAN_V2',         'RED',  'LAND', 0.09,   2,          'DefaultMeleeRED'),
            (   'ART_DEF_UNIT_SWORDSMAN',           'ART_DEF_UNIT_MEMBER_SWORDSMAN',            'RED',  'LAND', 0.09,   3,          'DefaultMeleeRED'),
            (   'ART_DEF_UNIT_SWORDSMAN',           'ART_DEF_UNIT_MEMBER_SWORDSMAN_V3',         'RED',  'LAND', 0.09,   2,          'DefaultMeleeRED'),
            (   'ART_DEF_UNIT_SWORDSMAN',           'ART_DEF_UNIT_MEMBER_SWORDSMAN_V2',         'RED',  'LAND', 0.09,   1,          'DefaultMeleeRED'),
            (   'ART_DEF_UNIT_SWORDSMAN',           'ART_DEF_UNIT_MEMBER_SWORDSMAN',            'RED',  'LAND', 0.09,   1,          'DefaultMeleeRED'),
            (   'ART_DEF_UNIT_SWORDSMAN',           'ART_DEF_UNIT_MEMBER_SWORDSMAN_V3',         'RED',  'LAND', 0.09,   1,          'DefaultMeleeRED'),
            (   'ART_DEF_UNIT_SWORDSMAN',           'ART_DEF_UNIT_MEMBER_SWORDSMAN',            'RED',  'LAND', 0.09,   1,          'DefaultMeleeRED'),
            --RUG
            (   'ART_DEF_UNIT_SWORDSMAN',           'ART_DEF_UNIT_MEMBER_SWORDSMAN_V2',         'RUG',  'LAND', 0.18,   1,          'DefaultMeleeRUG'),
            (   'ART_DEF_UNIT_SWORDSMAN',           'ART_DEF_UNIT_MEMBER_SWORDSMAN',            'RUG',  'LAND', 0.18,   1,          'DefaultMeleeRUG'),
            (   'ART_DEF_UNIT_SWORDSMAN',           'ART_DEF_UNIT_MEMBER_SWORDSMAN_V3',         'RUG',  'LAND', 0.18,   1,          'DefaultMeleeRUG'),
            --SUG
            (   'ART_DEF_UNIT_SWORDSMAN',           'ART_DEF_UNIT_MEMBER_SWORDSMAN',            'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT_SWORDSMAN',           'ART_DEF_UNIT_MEMBER_SWORDSMAN_V2',         'SUG',  'LAND', 0.25,   1,          ''),
            --(   'ART_DEF_UNIT_SWORDSMAN',           'ART_DEF_UNIT_MEMBER_SWORDSMAN_V3',         'SUG',  'LAND', 0.25,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  MEDIEVAL ERA
        ------- UnitInfo -------------------------- UnitMemberInfo ---------------------------- Type -- Domain  Scale - NumMembers  Formation -----------------------------------
        --	CROSSBOWMAN
            (   'ART_DEF_UNIT_CROSSBOWMAN',         'ART_DEF_UNIT_MEMBER_CROSSBOWMAN',          'RED',  'LAND', 0.09,   15,         'Crossbowman'),
            (   'ART_DEF_UNIT_CROSSBOWMAN',         'ART_DEF_UNIT_MEMBER_CROSSBOWMAN',          'RUG',  'LAND', 0.18,   3,          'CrossbowmanRUG'),
            (   'ART_DEF_UNIT_CROSSBOWMAN',         'ART_DEF_UNIT_MEMBER_CROSSBOWMAN',          'SUG',  'LAND', 0.25,   1,          ''),
        --	KNIGHT
            (   'ART_DEF_UNIT_KNIGHT',              'ART_DEF_UNIT_MEMBER_KNIGHT',               'RED',  'LAND', 0.085,  7,          'DefaultCavalry'),
            (   'ART_DEF_UNIT_KNIGHT',              'ART_DEF_UNIT_MEMBER_KNIGHT',               'RUG',  'LAND', 0.17,   3,          'DefaultCavalryRUG'),
            (   'ART_DEF_UNIT_KNIGHT',              'ART_DEF_UNIT_MEMBER_KNIGHT',               'SUG',  'LAND', 0.24,   1,          ''),
        --	LONGSWORDSMAN
            (   'ART_DEF_UNIT_LONGSWORDSMAN',       'ART_DEF_UNIT_MEMBER_LONGSWORDSMAN',        'RED',  'LAND', 0.09,   16,         'DefaultMeleeRED'),
            (   'ART_DEF_UNIT_LONGSWORDSMAN',       'ART_DEF_UNIT_MEMBER_LONGSWORDSMAN',        'RUG',  'LAND', 0.18,   3,          'DefaultMeleeRUG'),
            (   'ART_DEF_UNIT_LONGSWORDSMAN',       'ART_DEF_UNIT_MEMBER_LONGSWORDSMAN',        'SUG',  'LAND', 0.25,   1,          ''),
        --	PIKEMAN
            (   'ART_DEF_UNIT_PIKEMAN',             'ART_DEF_UNIT_MEMBER_PIKEMAN',              'RED',  'LAND', 0.09,   16,         'PikemanRED'),
            (   'ART_DEF_UNIT_PIKEMAN',             'ART_DEF_UNIT_MEMBER_PIKEMAN',              'RUG',  'LAND', 0.18,   3,          'PikemanRUG'),
            (   'ART_DEF_UNIT_PIKEMAN',             'ART_DEF_UNIT_MEMBER_PIKEMAN',              'SUG',  'LAND', 0.25,   1,          ''),
        --	TREBUCHET
            (   'ART_DEF_UNIT_TREBUCHET',           'ART_DEF_UNIT_MEMBER_TREBUCHET',            'RED',  'LAND', 0.09,   3,          'FourBigGuns'),
            (   'ART_DEF_UNIT_TREBUCHET',           'ART_DEF_UNIT_MEMBER_TREBUCHET',            'RUG',  'LAND', 0.17,   2,          'TrebuchetRUG'),
            (   'ART_DEF_UNIT_TREBUCHET',           'ART_DEF_UNIT_MEMBER_TREBUCHET',            'SUG',  'LAND', 0.185,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  RENAISSANCE ERA
        ------- UnitInfo -------------------------- UnitMemberInfo ---------------------------- Type -- Domain  Scale - NumMembers  Formation -----------------------------------
        --	CANNON
            (   'ART_DEF_UNIT_CANNON',              'ART_DEF_UNIT_MEMBER_CANNON',               'RED',  'LAND', 0.09,   3,          'CannonLine'),
            (   'ART_DEF_UNIT_CANNON',              'ART_DEF_UNIT_MEMBER_CANNON',               'RUG',  'LAND', 0.175,  2,          'TwoBigGunsRUG'),
            (   'ART_DEF_UNIT_CANNON',              'ART_DEF_UNIT_MEMBER_CANNON',               'SUG',  'LAND', 0.21,  1,          ''),
        --  LANCER
            (   'ART_DEF_UNIT_LANCER',              'ART_DEF_UNIT_MEMBER_LANCER',               'RED',  'LAND', 0.085,  7,          'WedgeCavalry'),
            (   'ART_DEF_UNIT_LANCER',              'ART_DEF_UNIT_MEMBER_LANCER',               'RUG',  'LAND', 0.17,   3,          'DefaultCavalryRUG'),
            (   'ART_DEF_UNIT_LANCER',              'ART_DEF_UNIT_MEMBER_LANCER',               'SUG',  'LAND', 0.24,   1,          ''),
        --	MUSKETMAN
            (   'ART_DEF_UNIT_MUSKETMAN',           'ART_DEF_UNIT_MEMBER_MUSKETMAN',            'RED',  'LAND', 0.09,   19,         'UnFormedRED'),
            (   'ART_DEF_UNIT_MUSKETMAN',           'ART_DEF_UNIT_MEMBER_MUSKETMAN',            'RUG',  'LAND', 0.18,   3,          'HonorableGunpowderRUG'),
            (   'ART_DEF_UNIT_MUSKETMAN',           'ART_DEF_UNIT_MEMBER_MUSKETMAN',            'SUG',  'LAND', 0.25,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  INDUSTRIAL ERA
        ------- UnitInfo ------------------------------ UnitMemberInfo -------------------------------- Type -- Domain  Scale - NumMembers  Formation ---------------------------
        --  CAVALRY
            (   'ART_DEF_UNIT_CAVALRY',             'ART_DEF_UNIT_MEMBER_CAVALRY',              'RED',  'LAND', 0.085,  7,          'DefaultCavalry'),
            (   'ART_DEF_UNIT_CAVALRY',             'ART_DEF_UNIT_MEMBER_CAVALRY',              'RUG',  'LAND', 0.17,   3,          'DefaultCavalryRUG'),
            (   'ART_DEF_UNIT_CAVALRY',             'ART_DEF_UNIT_MEMBER_CAVALRY',              'SUG',  'LAND', 0.24,   1,          ''),
        --	RIFLEMAN
            (   'ART_DEF_UNIT_RIFLEMAN',            'ART_DEF_UNIT_MEMBER_RIFLEMAN',             'RED',  'LAND', 0.09,   19,         'HonorableGunpowderRED'),
            (   'ART_DEF_UNIT_RIFLEMAN',            'ART_DEF_UNIT_MEMBER_RIFLEMAN',             'RUG',  'LAND', 0.18,   3,          'HonorableGunpowderRUG'),
            (   'ART_DEF_UNIT_RIFLEMAN',            'ART_DEF_UNIT_MEMBER_RIFLEMAN',             'SUG',  'LAND', 0.25,   1,          ''),
        --	GATLING GUN
            (   'ART_DEF_UNIT_GATLINGGUN',          'ART_DEF_UNIT_MEMBER_GATLINGGUN',           'RED',  'LAND', 0.085,  5,          'FiveBigGuns'),
            (   'ART_DEF_UNIT_GATLINGGUN',          'ART_DEF_UNIT_MEMBER_GATLINGGUN',           'RUG',  'LAND', 0.18,   2,          'TwoBigGunsRUG'),
            (   'ART_DEF_UNIT_GATLINGGUN',          'ART_DEF_UNIT_MEMBER_GATLINGGUN',           'SUG',  'LAND', 0.25,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  MODERN ERA
        ------- UnitInfo -------------------------- UnitMemberInfo ---------------------------- Type -- Domain  Scale - NumMembers  Formation -----------------------------------
        --	ANTI-AIRCRAFT GUN
            (   'ART_DEF_UNIT_ANTI_AIRCRAFT_GUN',   'ART_DEF_UNIT_MEMBER_ANTIAIRCRAFTGUN',      'RED',  'LAND', 0.09,   4,          'FourBigGuns'),
            (   'ART_DEF_UNIT_ANTI_AIRCRAFT_GUN',   'ART_DEF_UNIT_MEMBER_ANTIAIRCRAFTGUN',      'RUG',  'LAND', 0.17,   2,          'TwoBigGunsRUG'),
            (   'ART_DEF_UNIT_ANTI_AIRCRAFT_GUN',   'ART_DEF_UNIT_MEMBER_ANTIAIRCRAFTGUN',      'SUG',  'LAND', 0.25,   1,          ''),
        --  ANTI TANK GUN
            (   'ART_DEF_UNIT_ANTI_TANK_GUN',       'ART_DEF_UNIT_MEMBER_ANTITANKGUN',          'RED',  'LAND', 0.09,   3,          'CannonLine'),
            (   'ART_DEF_UNIT_ANTI_TANK_GUN',       'ART_DEF_UNIT_MEMBER_ANTITANKGUN',          'RUG',  'LAND', 0.175,  2,          'TwoBigGunsRUG'),
            (   'ART_DEF_UNIT_ANTI_TANK_GUN',       'ART_DEF_UNIT_MEMBER_ANTITANKGUN',          'SUG',  'LAND', 0.245,  1,          ''),
        --	ARTILLERY
            (   'ART_DEF_UNIT_ARTILLERY',           'ART_DEF_UNIT_MEMBER_ARTILLERY',            'RED',  'LAND', 0.09,   3,          'Vehicle'),
            (   'ART_DEF_UNIT_ARTILLERY',           'ART_DEF_UNIT_MEMBER_ARTILLERY',            'RUG',  'LAND', 0.17,   2,          'TwoBigGunsRUG'),
            (   'ART_DEF_UNIT_ARTILLERY',           'ART_DEF_UNIT_MEMBER_ARTILLERY',            'SUG',  'LAND', 0.2,  1,          ''),
        --	LANDSHIP (WW1_TANK)
            (   'ART_DEF_UNIT_WW1_TANK',            'ART_DEF_UNIT_MEMBER_WW1_TANK',             'RED',  'LAND', 0.12,   2,          'TwoBigGunsRED'),
            (   'ART_DEF_UNIT_WW1_TANK',            'ART_DEF_UNIT_MEMBER_WW1_TANK',             'RUG',  'LAND', 0.173,  2,          'TwoBigGunsRUG'),
            (   'ART_DEF_UNIT_WW1_TANK',            'ART_DEF_UNIT_MEMBER_WW1_TANK',             'SUG',  'LAND', 0.185,  1,          ''),
        --	MACHINE GUN
            (   'ART_DEF_UNIT_MACHINEGUN',          'ART_DEF_UNIT_MEMBER_MACHINEGUN',           'RED',  'LAND', 0.09,   5,          'FiveBigGuns'),
            (   'ART_DEF_UNIT_MACHINEGUN',          'ART_DEF_UNIT_MEMBER_MACHINEGUN',           'RUG',  'LAND', 0.18,   3,          'MachineGunsRUG'),
            (   'ART_DEF_UNIT_MACHINEGUN',          'ART_DEF_UNIT_MEMBER_MACHINEGUN',           'SUG',  'LAND', 0.25,   1,          ''),
        --  GREAT WAR INFANTRY
            (   'ART_DEF_UNIT_WW1_INFANTRY',        'ART_DEF_UNIT_MEMBER_WW1_INFANTRY',         'RED',  'LAND', 0.09,   18,         'UnFormedRED'),
            (   'ART_DEF_UNIT_WW1_INFANTRY',        'ART_DEF_UNIT_MEMBER_WW1_INFANTRY',         'RUG',  'LAND', 0.18,   3,          'UnFormedRUG'),
            (   'ART_DEF_UNIT_WW1_INFANTRY',        'ART_DEF_UNIT_MEMBER_WW1_INFANTRY',         'SUG',  'LAND', 0.25,   1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  ATOMIC ERA
        ------- UnitInfo -------------------------- UnitMemberInfo ---------------------------- Type -- Domain  Scale - NumMembers  Formation -----------------------------------
        --	INFANTRY
            --WW2_INFANTRY model from Gods & Kings DLC
            (   'ART_DEF_UNIT_WW2_INFANTRY',        'ART_DEF_UNIT_MEMBER_WW2_INFANTRY',         'RED',  'LAND', 0.09,   18,         'UnFormedRED'),
            (   'ART_DEF_UNIT_WW2_INFANTRY',        'ART_DEF_UNIT_MEMBER_WW2_INFANTRY',         'RUG',  'LAND', 0.18,   3,          'UnFormedRUG'),
            (   'ART_DEF_UNIT_WW2_INFANTRY',        'ART_DEF_UNIT_MEMBER_WW2_INFANTRY',         'SUG',  'LAND', 0.25,   1,          ''),
            --Unused, INFANTRY model from base game
            (   'ART_DEF_UNIT_INFANTRY',            'ART_DEF_UNIT_MEMBER_INFANTRY',             'RED',  'LAND', 0.09,   18,         'UnFormedRED'),
            (   'ART_DEF_UNIT_INFANTRY',            'ART_DEF_UNIT_MEMBER_INFANTRY',             'RUG',  'LAND', 0.18,   3,          'UnFormedRUG'),
            (   'ART_DEF_UNIT_INFANTRY',            'ART_DEF_UNIT_MEMBER_INFANTRY',             'SUG',  'LAND', 0.25,   1,          ''),
        --  MARINE
            (   'ART_DEF_UNIT_MARINE',              'ART_DEF_UNIT_MEMBER_MARINE',               'RED',  'LAND', 0.09,   12,         'WedgeSoldier'),
            (   'ART_DEF_UNIT_MARINE',              'ART_DEF_UNIT_MEMBER_MARINE',               'RUG',  'LAND', 0.18,   3,          'UnFormedRUG'),
            (   'ART_DEF_UNIT_MARINE',              'ART_DEF_UNIT_MEMBER_MARINE',               'SUG',  'LAND', 0.25,   1,          ''),
        --  PARATROOPER
            (   'ART_DEF_UNIT_PARATROOPER',         'ART_DEF_UNIT_MEMBER_PARATROOPER',          'RED',  'LAND', 0.09,   12,         'WedgeSoldier'),
            (   'ART_DEF_UNIT_PARATROOPER',         'ART_DEF_UNIT_MEMBER_PARATROOPER',          'RUG',  'LAND', 0.18,   3,          'UnFormedRUG'),
            (   'ART_DEF_UNIT_PARATROOPER',         'ART_DEF_UNIT_MEMBER_PARATROOPER',          'SUG',  'LAND', 0.25,   1,          ''),
        --  TANK
            (   'ART_DEF_UNIT_TANK',                'ART_DEF_UNIT_MEMBER_TANK',                 'RED',  'LAND', 0.128,  3,          'Vehicle'),
            (   'ART_DEF_UNIT_TANK',                'ART_DEF_UNIT_MEMBER_TANK',                 'RUG',  'LAND', 0.183,  2,          'VehicleRUG'),
            (   'ART_DEF_UNIT_TANK',                'ART_DEF_UNIT_MEMBER_TANK',                 'SUG',  'LAND', 0.2,  1,          ''),
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --  INFORMATION ERA
        ------- UnitInfo -------------------------- UnitMemberInfo ---------------------------- Type -- Domain  Scale - NumMembers  Formation -----------------------------------
        --	BAZOOKA
            (   'ART_DEF_UNIT_BAZOOKA_INFANTRY',    'ART_DEF_UNIT_MEMBER_BAZOOKA_INFANTRY',     'RED',  'LAND', 0.085,  5,          'FiveBigGuns'),
            (   'ART_DEF_UNIT_BAZOOKA_INFANTRY',    'ART_DEF_UNIT_MEMBER_BAZOOKA_INFANTRY',     'RUG',  'LAND', 0.18,   2,          'VehicleRUG'),
            (   'ART_DEF_UNIT_BAZOOKA_INFANTRY',    'ART_DEF_UNIT_MEMBER_BAZOOKA_INFANTRY',     'SUG',  'LAND', 0.25,   1,          ''),
        --	GIANT DEATH ROBOT
            (   'ART_DEF_UNIT_MECH',                'ART_DEF_UNIT_MEMBER_MECH',                 'RED',  'LAND', 0.09,   5,          'AssaultMech'),
            (   'ART_DEF_UNIT_MECH',                'ART_DEF_UNIT_MEMBER_MECH',                 'RUG',  'LAND', 0.175,  1,          ''),
            (   'ART_DEF_UNIT_MECH',                'ART_DEF_UNIT_MEMBER_MECH',                 'SUG',  'LAND', 0.245,  1,          ''),
        --	HELICOPTER GUNSHIP
            (   'ART_DEF_UNIT_HELICOPTER_GUNSHIP',  'ART_DEF_UNIT_MEMBER_HELICOPTERGUNSHIP',    'RED',  'LAND', 0.10,   2,          'BomberWingRED'),
            (   'ART_DEF_UNIT_HELICOPTER_GUNSHIP',  'ART_DEF_UNIT_MEMBER_HELICOPTERGUNSHIP',    'RUG',  'LAND', 0.165,  1,          ''),
            (   'ART_DEF_UNIT_HELICOPTER_GUNSHIP',  'ART_DEF_UNIT_MEMBER_HELICOPTERGUNSHIP',    'SUG',  'LAND', 0.19,   1,          ''),
        --	MECHANIZED INFANTRY
            (   'ART_DEF_UNIT_MECHANIZED_INFANTRY', 'ART_DEF_UNIT_MEMBER_MECHANIZEDINFANTRY',   'RED',  'LAND', 0.10,   4,          'FourBigGuns'),
            (   'ART_DEF_UNIT_MECHANIZED_INFANTRY', 'ART_DEF_UNIT_MEMBER_MECHANIZEDINFANTRY',   'RUG',  'LAND', 0.18,   2,          'VehicleRUG'),
            (   'ART_DEF_UNIT_MECHANIZED_INFANTRY', 'ART_DEF_UNIT_MEMBER_MECHANIZEDINFANTRY',   'SUG',  'LAND', 0.2,   1,          ''),
        --	MOBILE SAM
            (   'ART_DEF_UNIT_MOBILE_SAM',          'ART_DEF_UNIT_MEMBER_MOBILESAM',            'RED',  'LAND', 0.11,   4,          'ThreeBigGuns'),
            (   'ART_DEF_UNIT_MOBILE_SAM',          'ART_DEF_UNIT_MEMBER_MOBILESAM',            'RUG',  'LAND', 0.175,  2,          'TwoBigGunsRUG'),
            (   'ART_DEF_UNIT_MOBILE_SAM',          'ART_DEF_UNIT_MEMBER_MOBILESAM',            'SUG',  'LAND', 0.2,  1,          ''),
        --	MODERN ARMOR
            (   'ART_DEF_UNIT_MODERN_ARMOR',        'ART_DEF_UNIT_MEMBER_MODERNARMOR',          'RED',  'LAND', 0.10,   3,          'Vehicle'),
            (   'ART_DEF_UNIT_MODERN_ARMOR',        'ART_DEF_UNIT_MEMBER_MODERNARMOR',          'RUG',  'LAND', 0.175,  2,          'TwoBigGunsRUG'),
            (   'ART_DEF_UNIT_MODERN_ARMOR',        'ART_DEF_UNIT_MEMBER_MODERNARMOR',          'SUG',  'LAND', 0.2,  1,          ''),
        --	ROCKET ARTILLERY
            (   'ART_DEF_UNIT_ROCKET_ARTILLERY',    'ART_DEF_UNIT_MEMBER_ROCKETARTILLERY',      'RED',  'LAND', 0.09,   3,          'CannonLine'),
            (   'ART_DEF_UNIT_ROCKET_ARTILLERY',    'ART_DEF_UNIT_MEMBER_ROCKETARTILLERY',      'RUG',  'LAND', 0.17,   2,          'TwoBigGunsRUG'),
            (   'ART_DEF_UNIT_ROCKET_ARTILLERY',    'ART_DEF_UNIT_MEMBER_ROCKETARTILLERY',      'SUG',  'LAND', 0.17,   1,          ''),
        --  XCOM SQUAD
            (   'ART_DEF_UNIT_XCOM_SQUAD',          'ART_DEF_UNIT_MEMBER_XCOM_SQUAD',           'RED',  'LAND', 0.085,  10,         'WedgeSoldier'),
            (   'ART_DEF_UNIT_XCOM_SQUAD',          'ART_DEF_UNIT_MEMBER_XCOM_SQUAD',           'RUG',  'LAND', 0.18,   3,          'EarlyGreatArtistRUG'),
            (   'ART_DEF_UNIT_XCOM_SQUAD',          'ART_DEF_UNIT_MEMBER_XCOM_SQUAD',           'SUG',  'LAND', 0.25,   1,          ''),
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  END OF INSERT

            (   'END_OF_INSERT', '', '', NULL, 0, 0, '');

DELETE  FROM ArtDefine_USnF WHERE USnF_UnitInfo = 'END_OF_INSERT';
