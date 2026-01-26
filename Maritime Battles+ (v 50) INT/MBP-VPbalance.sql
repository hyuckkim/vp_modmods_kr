/*----------------------------------------------------
-- Great Lighthouse: obsolete tech and early bonus
----------------------------------------------------

UPDATE Buildings
SET Defense = 300, FreePromotion = 'PROMOTION_GREAT_LIGHTHOUSE', TradeRouteSeaDistanceModifier = 5, ObsoleteTech = 'TECH_COMPASS'
WHERE Type = 'BUILDING_GREAT_LIGHTHOUSE';

UPDATE Language_en_US
SET Text = 'The Great Lighthouse grants a trade waters bonus to naval [ICON_MOVES] movement in all friendly waters, adding +1 [ICON_MOVES] movement when the unit has been out-of-combat for at least a turn, or increases sight of all naval units by +1 during combat turns. Promotion does not apply to new units after the discovery of Compass. It also provides +1 [ICON_CULTURE] Culture, +1 Great Merchant point, +3 City Defense Strength, and +5% sea trade route range. Obviously, this is an extremely useful for any naval-oriented civilization, especially early in a game with a lot of islands or small continents.'
WHERE Tag = 'TXT_KEY_BUILDING_GREAT_LIGHTHOUSE_STRATEGY';

UPDATE Language_en_US
SET Text = '+1 [ICON_MOVES] Naval Movement if out-of-combat for at least a turn, and +1 Sight temporarily during combat turns.'
WHERE Tag = 'TXT_KEY_PROMOTION_GREAT_LIGHTHOUSE_HELP';

UPDATE Language_en_US
SET Text = 'All accessible allied water tiles are deemed friendly for lighthouse Naval Movement bonus (local lighthouse or not). Units gain +1 [ICON_MOVES] Naval Movement, or sight bonus during combat. City defense strength increased by +3, and +5% sea trade route range. Provides a free Lighthouse in the city in which it is built.[NEWLINE][NEWLINE]City must be built on the coast.  Upon discovering Compass, the Great Lighthouse becomes obsolete.'
WHERE Tag = 'TXT_KEY_WONDER_GREAT_LIGHTHOUSE_HELP';
*/

/*----------------------------------------------------
-- no ocean rival territory
----------------------------------------------------

UPDATE UnitPromotions
SET RivalTerritory = 1
WHERE Type = 'PROMOTION_OCEAN_IMPASSABLE';

UPDATE Language_en_US
SET Text = Text||' Ignores maritime borders.'
WHERE Tag = 'TXT_KEY_PROMOTION_OCEAN_IMPASSABLE_HELP';
*/
/*----------------------------------------------------
-- ice slower and obstructs view, but subs get bonus
----------------------------------------------------

UPDATE Features
SET Movement = 4, SeeThrough = 1
WHERE Type = 'FEATURE_ICE';

INSERT INTO UnitPromotions_Features
		(PromotionType,						FeatureType,							DoubleMove,	ExtraMove)
VALUES	('PROMOTION_INVISIBLE_SUBMARINE',	'FEATURE_ICE',							1,			0),
		('PROMOTION_INVISIBLE_SUBMARINE',	'FEATURE_RESTRICTED_VISIBILITY',		1,			0),
		('PROMOTION_INVISIBLE_SUBMARINE',	'FEATURE_RESTRICTED_VISIBILITY_COAST',	1,			0)/*,
		('PROMOTION_INVISIBLE_SUBMARINE',	'FEATURE_SHALLOW_ROCKS',				0,			1)*/;
*/
/*----------------------------------------------------
-- capture embarked units that can be captured on land
----------------------------------------------------*/

UPDATE Units
SET CaptureWhileEmbarked = 1
WHERE (Capture is not null and Capture <> '');
