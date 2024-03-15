UPDATE Language_ko_KR
SET Text = Text||' 승선 시 [ICON_STRENGTH] 전투력 +5%'
WHERE Tag = 'TXT_KEY_PROMOTION_SCOUTING_1_HELP';

UPDATE Language_ko_KR
SET Text = Text||' 승선 시 [ICON_STRENGTH] 전투력 +10%'
WHERE Tag = 'TXT_KEY_PROMOTION_SCOUTING_2_HELP';

UPDATE Language_ko_KR
SET Text = Text||' 승선 시 [ICON_STRENGTH] 전투력 +15%'
WHERE Tag = 'TXT_KEY_PROMOTION_SCOUTING_2_HELP';

UPDATE UnitPromotions
SET EmbarkExtraVisibility = 1, EmbarkDefenseModifier = 5
WHERE Type = 'PROMOTION_SCOUTING_1';

UPDATE UnitPromotions
SET EmbarkExtraVisibility = 1, EmbarkDefenseModifier = 10
WHERE Type = 'PROMOTION_SCOUTING_2';

UPDATE UnitPromotions
SET ExtraNavalMovement = 1, EmbarkDefenseModifier = 15
WHERE Type = 'PROMOTION_SCOUTING_3';

UPDATE UnitPromotions
SET EmbarkExtraVisibility = 1
WHERE Type = 'PROMOTION_EMBARKATION';

UPDATE UnitPromotions
SET EmbarkExtraVisibility = 1
WHERE Type = 'PROMOTION_EMBARKED_SIGHT';

UPDATE UnitPromotions
SET EmbarkExtraVisibility = 1
WHERE Type = 'PROMOTION_WAR_CANOES';

UPDATE UnitPromotions
SET EmbarkExtraVisibility = 1
WHERE Type = 'PROMOTION_ALLWATER_EMBARKATION';

UPDATE UnitPromotions
SET EmbarkExtraVisibility = 1
WHERE Type = 'PROMOTION_OCEAN_CROSSING';
