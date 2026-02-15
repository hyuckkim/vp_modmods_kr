-- we will replace the free policy with approx 10 turns of culture in the late industrial/early modern
UPDATE Language_ko_KR SET
Text = Replace(Text, 'Receive 1 [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Social Policy.', '+10,000 [ICON_CULTURE] Culture when completed.')
WHERE Tag IN (SELECT Help FROM FreePolicyWonders); 

-- get the ones that arent formatted
UPDATE Language_ko_KR SET
Text = Replace(Text, 'Receive 1 Free Social Policy.', '+10,000 [ICON_CULTURE] Culture when completed.')
WHERE Tag IN (SELECT Help FROM FreePolicyWonders);