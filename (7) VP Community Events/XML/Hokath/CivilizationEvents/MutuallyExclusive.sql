UPDATE Buildings
SET MutuallyExclusiveGroup = '361'
WHERE Type = 'BUILDING_CHURCH';

UPDATE Buildings
SET MutuallyExclusiveGroup = '362'
WHERE Type = 'BUILDING_CATHEDRAL';

UPDATE Buildings
SET MutuallyExclusiveGroup = '363'
WHERE Type = 'BUILDING_MANDIR';

UPDATE Buildings
SET MutuallyExclusiveGroup = '364'
WHERE Type = 'BUILDING_MOSQUE';

UPDATE Buildings
SET MutuallyExclusiveGroup = '365'
WHERE Type = 'BUILDING_STUPA';

UPDATE Buildings
SET MutuallyExclusiveGroup = '366'
WHERE Type = 'BUILDING_SYNAGOGUE';

UPDATE Buildings
SET MutuallyExclusiveGroup = '367'
WHERE Type = 'BUILDING_ORDER';

UPDATE Buildings
SET IconAtlas = 'COMMUNITY_ATLAS'
WHERE Type = 'BUILDING_ORDER';

UPDATE Buildings
SET PortraitIndex = '13'
WHERE Type = 'BUILDING_ORDER';

UPDATE Buildings
SET MutuallyExclusiveGroup = '368'
WHERE Type = 'BUILDING_PAGODA';