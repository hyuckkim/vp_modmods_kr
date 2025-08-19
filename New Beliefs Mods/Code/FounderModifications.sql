--Rename Transcendent Thoughts
UPDATE Language_en_US
SET Text = 'Transcendence'
WHERE Tag = 'TXT_KEY_BELIEF_INITIATION_RITES_SHORT';

UPDATE Language_en_US
SET Text = 'When you enter a new Era, Holy City gains 12 of every Yield for each City following your [ICON_RELIGION] Religion (max 25 Cities), scaling with Era.[NEWLINE]Unlocks [COLOR_POSITIVE_TEXT]Heavenly Grotto National Wonder[ENDCOLOR] (+2 [ICON_PEACE] Faith, +2 [ICON_HAPPINESS_1] Happiness; +5 [ICON_GOLD] Gold from [ICON_RELIGION] Holy Sites; unlocks [COLOR_POSITIVE_TEXT]Reformation Belief[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_BELIEF_INITIATION_RITES';

--Change wonder on Transcendence
UPDATE Belief_BuildingClassFaithPurchase SET BuildingClassType = 'BUILDINGCLASS_HEAVENLY_GROTTO' WHERE BeliefType = 'BELIEF_INITIATION_RITES';