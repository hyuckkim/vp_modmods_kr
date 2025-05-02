
--               Faster Aircraft Animations (v 3) -- by Gedemon

--- SQL Code ----------------------------------------------------------------------

UPDATE ArtDefine_UnitMemberCombats SET MoveRate = 3*MoveRate;
UPDATE ArtDefine_UnitMemberCombats SET TurnRateMin = 3*TurnRateMin WHERE MoveRate > 0;
UPDATE ArtDefine_UnitMemberCombats SET TurnRateMax = 3*TurnRateMax WHERE MoveRate > 0;

-----------------------------------------------------------------------------------





/*
--          By default, (9a)EAW4VP set the speed rate of Air Unit animation at x1
--     To make it quicker, replace "1*" above with "2*" or "3*" to make it even quicker.


------ e.g. -----------------------------------------------------------------------

--        x1

UPDATE ArtDefine_UnitMemberCombats SET MoveRate = 1*MoveRate;
UPDATE ArtDefine_UnitMemberCombats SET TurnRateMin = 1*TurnRateMin WHERE MoveRate > 0;
UPDATE ArtDefine_UnitMemberCombats SET TurnRateMax = 1*TurnRateMax WHERE MoveRate > 0;


--        x2

UPDATE ArtDefine_UnitMemberCombats SET MoveRate = 2*MoveRate;
UPDATE ArtDefine_UnitMemberCombats SET TurnRateMin = 2*TurnRateMin WHERE MoveRate > 0;
UPDATE ArtDefine_UnitMemberCombats SET TurnRateMax = 2*TurnRateMax WHERE MoveRate > 0;


--        x3

UPDATE ArtDefine_UnitMemberCombats SET MoveRate = 3*MoveRate;
UPDATE ArtDefine_UnitMemberCombats SET TurnRateMin = 3*TurnRateMin WHERE MoveRate > 0;
UPDATE ArtDefine_UnitMemberCombats SET TurnRateMax = 3*TurnRateMax WHERE MoveRate > 0;

-----------------------------------------------------------------------------------
*/