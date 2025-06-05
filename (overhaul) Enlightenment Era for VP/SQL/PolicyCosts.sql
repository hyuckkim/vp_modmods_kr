-- this setting grows faster but seems like not enough. industry in the late medieval for the AI
--UPDATE Defines SET Value = 40 WHERE Name = 'BASE_POLICY_COST';
--UPDATE Defines SET Value = 2.394 WHERE Name = 'POLICY_COST_EXPONENT';
--UPDATE Defines SET Value = 3.388 WHERE Name = 'POLICY_COST_INCREASE_TO_BE_EXPONENTED';
--UPDATE Defines SET Value = 0.0 WHERE Name = 'POLICY_COST_EXTRA_VALUE';

-- cubi scaling now. This feel ok but it becomes too expensive later. only 3 policies into industry as enter modern
--UPDATE Defines SET Value = 58.8 WHERE Name = 'BASE_POLICY_COST';
--UPDATE Defines SET Value = 2.954 WHERE Name = 'POLICY_COST_EXPONENT';
--UPDATE Defines SET Value = 1.617 WHERE Name = 'POLICY_COST_INCREASE_TO_BE_EXPONENTED';
--UPDATE Defines SET Value = 1.416 WHERE Name = 'POLICY_COST_EXTRA_VALUE';

-- try to find a middle way with improved optimization algorithm
UPDATE Defines SET Value = 60.0 WHERE Name = 'BASE_POLICY_COST';
UPDATE Defines SET Value = 2.4 WHERE Name = 'POLICY_COST_EXPONENT';
UPDATE Defines SET Value = 3.34 WHERE Name = 'POLICY_COST_INCREASE_TO_BE_EXPONENTED';
UPDATE Defines SET Value = 0.0 WHERE Name = 'POLICY_COST_EXTRA_VALUE';