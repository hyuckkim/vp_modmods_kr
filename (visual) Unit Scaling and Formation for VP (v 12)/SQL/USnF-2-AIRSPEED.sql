-----------------------------------------------------------------------------
--  Aircraft animation speed modifier
-----------------------------------------------------------------------------

--  Simple speed modifier 
    UPDATE  ArtDefine_UnitMemberCombats SET
            MoveRate = 1.5*MoveRate,
            TurnRateMin = 1.5*TurnRateMin,
            TurnRateMax = 1.5*TurnRateMax
            WHERE EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_AIRSPEED' AND Value = 1)
            AND MoveRate > 0;

    UPDATE  ArtDefine_UnitMemberCombats SET
            MoveRate = 2*MoveRate,
            TurnRateMin = 2*TurnRateMin,
            TurnRateMax = 2*TurnRateMax
            WHERE EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_AIRSPEED' AND Value = 2)
            AND MoveRate > 0;

    UPDATE  ArtDefine_UnitMemberCombats SET
            MoveRate = 3*MoveRate,
            TurnRateMin = 3*TurnRateMin,
            TurnRateMax = 3*TurnRateMax
            WHERE EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_AIRSPEED' AND Value = 3)
            AND MoveRate > 0;

    UPDATE  ArtDefine_UnitMemberCombats SET
            MoveRate = 1.1*MoveRate,
            TurnRateMin = 1.15*TurnRateMin,
            TurnRateMax = 1.15*TurnRateMax
            WHERE EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_AIRSPEED' AND Value = 4)
            AND MoveRate > 0;

--  R.E.D. speed modifier for base air units
    --  TRIPLANE (WW1_FIGHTER)
        UPDATE ArtDefine_UnitMemberCombats SET MoveRate = 1.8 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_WW1_FIGHTER'
        AND EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_AIRSPEED' AND Value = 4);

    --  FIGHTER
        UPDATE ArtDefine_UnitMemberCombats SET MoveRate = 2.1 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_FIGHTER'
        AND EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_AIRSPEED' AND Value = 4);

    --  ZERO
        UPDATE ArtDefine_UnitMemberCombats SET MoveRate = 2.15 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_JAPANESE_ZERO'
        AND EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_AIRSPEED' AND Value = 4);

    --  JET FIGHTER
        UPDATE ArtDefine_UnitMemberCombats SET MoveRate = 2.85 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_JETFIGHTER'
        AND EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_AIRSPEED' AND Value = 4);


    --  BOMBER (WW1_BOMBER)
        UPDATE ArtDefine_UnitMemberCombats SET MoveRate = 1.5 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_WW1_BOMBER'
        AND EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_AIRSPEED' AND Value = 4);

    --  B17
        UPDATE ArtDefine_UnitMemberCombats SET MoveRate = 1.85 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_AMERICAN_B17'
        AND EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_AIRSPEED' AND Value = 4);

    --  HEAVY BOMBER (BOMBER)
        UPDATE ArtDefine_UnitMemberCombats SET MoveRate = 1.75 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_BOMBER'
        AND EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_AIRSPEED' AND Value = 4);

    --	STEALTH BOMBER
        UPDATE ArtDefine_UnitMemberCombats SET MoveRate = 2.35 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_STEALTHBOMBER'
        AND EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_AIRSPEED' AND Value = 4);

    --  ATOMIC BOMB
        UPDATE ArtDefine_UnitMemberCombats SET MoveRate = 1.75 WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_ATOMICBOMB'
        AND EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_AIRSPEED' AND Value = 4);

-----------------------------------------------------------------------------
--  Compatibility setup for custom mods
-----------------------------------------------------------------------------

CREATE TRIGGER USnF_AirSpeedCompatibility
AFTER INSERT ON ArtDefine_UnitMemberCombats
WHEN NOT EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_AIRSPEED' AND Value = 0)
AND NEW.MoveRate > 0
BEGIN 

    UPDATE  ArtDefine_UnitMemberCombats SET
            MoveRate = 1.5*MoveRate,
            TurnRateMin = 1.5*TurnRateMin,
            TurnRateMax = 1.5*TurnRateMax
            WHERE EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_AIRSPEED' AND Value = 1)
            AND MoveRate > 0
            AND UnitMemberType = NEW.UnitMemberType;

    UPDATE  ArtDefine_UnitMemberCombats SET
            MoveRate = 2*MoveRate,
            TurnRateMin = 2*TurnRateMin,
            TurnRateMax = 2*TurnRateMax
            WHERE EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_AIRSPEED' AND Value = 2)
            AND MoveRate > 0
            AND UnitMemberType = NEW.UnitMemberType;

    UPDATE  ArtDefine_UnitMemberCombats SET
            MoveRate = 3*MoveRate,
            TurnRateMin = 3*TurnRateMin,
            TurnRateMax = 3*TurnRateMax
            WHERE EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_AIRSPEED' AND Value = 3)
            AND MoveRate > 0
            AND UnitMemberType = NEW.UnitMemberType;

    UPDATE  ArtDefine_UnitMemberCombats SET
            MoveRate = 1.1*MoveRate,
            TurnRateMin = 1.15*TurnRateMin,
            TurnRateMax = 1.15*TurnRateMax
            WHERE EXISTS (SELECT * FROM USnF_Config WHERE Type = 'USnF_AIRSPEED' AND Value = 4)
            AND MoveRate > 0
            AND UnitMemberType = NEW.UnitMemberType;

END;
