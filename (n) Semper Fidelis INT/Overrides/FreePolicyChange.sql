CREATE TEMPORARY TABLE FreePolicyWonders AS
SELECT *
FROM Buildings 
WHERE PolicyBranchType IS NOT NULL AND FreePolicies = 1;

-- we will replace the free policy with approx 10 turns of culture in the late industrial/early modern
INSERT INTO Building_InstantYield
	(BuildingType, YieldType, Yield)
SELECT
	Type, 'YIELD_CULTURE', 10000
FROM FreePolicyWonders;

UPDATE Language_en_US SET
Text = Replace(Text, 'Receive 1 [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Social Policy.', '+10,000 [ICON_CULTURE] Culture when completed.')
WHERE Tag IN (SELECT Help FROM FreePolicyWonders); 

-- get the ones that arent formatted
UPDATE Language_en_US SET
Text = Replace(Text, 'Receive 1 Free Social Policy.', '+10,000 [ICON_CULTURE] Culture when completed.')
WHERE Tag IN (SELECT Help FROM FreePolicyWonders);

UPDATE Buildings SET
FreePolicies = 0
WHERE Type IN (SELECT Type FROM FreePolicyWonders);

DROP TABLE FreePolicyWonders;