UPDATE MovementRates SET IndividualOffset = 0; -- delay between part-units from a unit
UPDATE MovementRates SET RowOffset = 0; -- delay between rows of part-units from a unit
UPDATE MovementRates SET TotalTime = TotalTime/4; -- the total time a part-unit needs to reach the plot-- Insert SQL Rules Here 