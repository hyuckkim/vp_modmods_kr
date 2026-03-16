UPDATE Language_ko_KR
SET Text = 'Silent Decree'
WHERE Tag = 'TXT_KEY_TRAIT_ART_OF_WAR_SHORT';

UPDATE Language_ko_KR
SET Text = 'All [ICON_SPY] Spies generate +25% Network Points. Can access the [COLOR_POSITIVE_TEXT][ICON_TEAM_9] Embolden Local Warlord[ENDCOLOR] Spy Mission and [COLOR_POSITIVE_TEXT][ICON_TEAM_4] Imperial Inspection[ENDCOLOR] Counterspy Focus. When a [ICON_GREAT_PEOPLE] Great Person is born in a City it enters "[COLOR_POSITIVE_TEXT]We Love the Empress Day[ENDCOLOR]."' 
WHERE Tag = 'TXT_KEY_TRAIT_ART_OF_WAR';

UPDATE Language_ko_KR
SET Text = 'By the Empress''s Silent Decree, the birth of a {1_Resource:textkey} causes the City of {2_CityName:textkey} to enter "We Love the Empress Day."' 
WHERE Tag = 'TXT_KEY_NOTIFICATION_CITY_WLTKD_UA';

----------------------------
-- unique chancery updates
----------------------------
/*
-- Gain 50 [ICON_PRODUCTION] Production and [ICON_CULTURE_LOCAL] Border Growth Points when entering "[COLOR_POSITIVE_TEXT]We Love the Empress Day[ENDCOLOR]", scaling with Era.

UPDATE Language_ko_KR SET
Text = '+10% [ICON_PRODUCTION] Production of Diplomatic Units. Grants the [COLOR_POSITIVE_TEXT]Royal Signet[ENDCOLOR] Promotion to all Diplomatic Units built in this City. Receive 20 [ICON_VP_SPY_POINTS] Spy Points. +10% [ICON_PRODUCTION] Production and +50% [ICON_CULTURE_LOCAL] Border Growth Points during "[COLOR_POSITIVE_TEXT]We Love the Empress Day[ENDCOLOR]" in the City.[NEWLINE][NEWLINE]Whenever a [ICON_CITIZEN] Citizen is born, gain +15 [ICON_GREAT_PEOPLE] points toward the [ICON_GREAT_PEOPLE] Great Person with the highest progress, scaling with Era.[NEWLINE][NEWLINE][ICON_CITY_STATE] City-State [COLOR_CYAN]Ally[ENDCOLOR] Bonus: +2 [ICON_PRODUCTION] Production each.'
WHERE Tag = 'TXT_KEY_BUILDING_CHINA_EXAMINATION_HALL_HELP';
*/
UPDATE Language_ko_KR SET
Text = 'The Examination Hall is a Chinese unique building, replacing the Chancery. In addition to the normal bonuses of a Chancery, it provides Spy Points, allowing China the unique ability to gain Spies by Founding more Cities. In addition, moving Great Works to your new Cities becomes even more effective in growing developing them. Finally, you can channel growth into additional Great People Points; with the ability to decide which Specialist will receive them you can spread all different types across your booming Empire. Taken together, China''s bonuses mean you are flexible in chasing whichever Victory suits you desire.'
WHERE Tag = 'TXT_KEY_BUILDING_EXAMINATION_HALL_STRATEGY';