DELETE FROM Resource_FeatureBooleans WHERE ResourceType = 'RESOURCE_BANANA'AND FeatureType = 'FEATURE_MARSH';


-- Improvements -- Trading Post -- Available at Currency

-- I've narrowed down the number of tiles you get for free because there are too many.
UPDATE GoodyHuts
SET
	FreeTiles = 1
WHERE Type = 'GOODY_TILES';

