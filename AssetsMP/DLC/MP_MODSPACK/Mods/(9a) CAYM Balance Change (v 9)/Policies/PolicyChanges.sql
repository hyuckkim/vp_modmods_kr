/*
VPEE compatibility patch!
0 = Disabled disregarding if its detects VPEE by CAYM.
1 = Enabled if it detects the VPEE by CAYM.
2 = Disabled until it detects something! (Default)
*/

INSERT INTO COMMUNITY	
		(Type,			Value)
VALUES	('MUCfVP-CAYM', 2);

UPDATE COMMUNITY
SET Value = '1'
WHERE Type = 'MUCfVP-CAYM' AND EXISTS (SELECT * FROM Buildings WHERE Type='BUILDING_EE_DRYDOCK') AND NOT EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-CAYM' AND Value= 0);


/*
-- Aristocracy (now Justice)

UPDATE Policies
SET
	WonderProductionModifier = 15
WHERE Type = 'POLICY_ARISTOCRACY';

INSERT INTO Policy_Flavors
	(PolicyType, FlavorType, Flavor)
VALUES
	('POLICY_ARISTOCRACY', 'FLAVOR_WONDER', 7);

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Justice[ENDCOLOR][NEWLINE][ICON_BULLET]+1 [ICON_PRODUCTION] Production in every City.[NEWLINE][ICON_BULLET]Cities with a garrison gain +25% [ICON_RANGE_STRENGTH] Ranged Combat Strength.[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]Royal Guardhouse[ENDCOLOR] built in [ICON_CAPITAL] Capital (+3 [ICON_PRODUCTION] Production, +2 [ICON_STRENGTH] Defense, +50 Hit Points, +20% [ICON_SILVER_FIST] Military Supply from [ICON_CITIZEN] Population in the City, 1 [ICON_VP_ENGINEER] Engineer Slot).[NEWLINE] Provides a 15% production bonus when building World Wonders.'
WHERE Tag = 'TXT_KEY_POLICY_ARISTOCRACY_HELP';

UPDATE Language_ko_KR
SET Text = '[COLOR_POSITIVE_TEXT]정의[ENDCOLOR][NEWLINE][ICON_BULLET]모든 도시의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][ICON_BULLET]유닛이 주둔한 도시의 [ICON_RANGE_STRENGTH]원거리 전투력이 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR] 증가합니다. [NEWLINE][ICON_BULLET][ICON_CAPITAL]수도에 [COLOR_YELLOW]근위병 초소[ENDCOLOR]가 출현합니다. ([ICON_PRODUCTION]생산 +3, [ICON_STRENGTH]방어력 +3, 체력 +50, 군사 유닛 보급 한도가 시민의 20%만큼 증가, [ICON_VP_ENGINEER] 기술자 슬롯 +1), [NEWLINE][ICON_BULLET]세계불가사의를 건설할 때 생산보너스를 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR] 제공합니다.'
WHERE Tag = 'TXT_KEY_POLICY_ARISTOCRACY_HELP';
*/


/* (vp 4.4 -delted)
--===================
--    Traidtion
--==================

-- Opener
DELETE From Policy_CapitalYieldChanges    WHERE PolicyType = 'POLICY_TRADITION';
DELETE From Policy_BuildingClassHappiness WHERE PolicyType = 'POLICY_TRADITION';

UPDATE Policies
SET
	PlotCultureExponentModifier = 0,
	CityGrowthMod = 5,
	FreePopulationCapital = 0
WHERE Type = 'POLICY_TRADITION';

INSERT INTO Policy_CapitalYieldPerPopChanges
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_TRADITION', 'YIELD_SCIENCE', 50),
	('POLICY_TRADITION', 'YIELD_GOLD', 50);

-- Scaler
----------------------
-- Combined Insertions
----------------------

DELETE From Policy_CapitalYieldChanges WHERE PolicyType = 'POLICY_ARISTOCRACY';
UPDATE Policies SET	FreePopulationCapital = 1, NoUnhappfromXSpecialistsCapital = 1 WHERE Type = 'POLICY_ARISTOCRACY';
DELETE From Policy_CapitalYieldChanges WHERE PolicyType = 'POLICY_OLIGARCHY';
UPDATE Policies SET	FreePopulationCapital = 1, NoUnhappfromXSpecialistsCapital = 1 WHERE Type = 'POLICY_OLIGARCHY';
DELETE From Policy_CapitalYieldChanges WHERE PolicyType = 'POLICY_LANDED_ELITE';
UPDATE Policies SET	FreePopulationCapital = 1, NoUnhappfromXSpecialistsCapital = 1 WHERE Type = 'POLICY_LANDED_ELITE';
DELETE From Policy_CapitalYieldChanges WHERE PolicyType = 'POLICY_LEGALISM';
UPDATE Policies SET	FreePopulationCapital = 1, NoUnhappfromXSpecialistsCapital = 1 WHERE Type = 'POLICY_LEGALISM';
DELETE From Policy_CapitalYieldChanges WHERE PolicyType = 'POLICY_MONARCHY';
UPDATE Policies SET	FreePopulationCapital = 1, NoUnhappfromXSpecialistsCapital = 1 WHERE Type = 'POLICY_MONARCHY';
*/

INSERT INTO Policy_YieldGPExpend
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_LANDED_ELITE', 'YIELD_GOLD', 50);

/*
-- Landed Elite (now Splendor)
UPDATE Policies
SET
	NumCitiesFreeCultureBuilding = 4,
	GreatPeopleRateModifier = 0,
	PortraitIndex = 56
WHERE Type = 'POLICY_LANDED_ELITE';
*/

-- Landed Elite (now Splendor)
UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Splendor[ENDCOLOR][NEWLINE][ICON_BULLET]Expending a [ICON_GREAT_PEOPLE] Great Person grants 50 [ICON_CULTURE] Culture and [ICON_GOLD] Gold, scaling with Era.[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]{TXT_KEY_BUILDING_PALACE_TREASURY}[ENDCOLOR] built in [ICON_CAPITAL] Capital (+4 [ICON_GOLD] Gold, +2 [ICON_CULTURE] Culture to all Monuments, Gardens, and Baths; 1 [ICON_VP_MERCHANT] Merchant Slot).'
WHERE Tag = 'TXT_KEY_POLICY_LANDED_ELITE_HELP'; 

UPDATE Language_ko_KR
SET Text = '[COLOR_POSITIVE_TEXT]탁월[ENDCOLOR][NEWLINE][ICON_BULLET][ICON_GREAT_PEOPLE]위인을 소모할 때  [ICON_CULTURE]문화와 [ICON_GOLD]골드를 [COLOR_POSITIVE_TEXT]50[ENDCOLOR] [COLOR:105:105:105:255](시대별 보정)[ENDCOLOR] 제공합니다. [NEWLINE][ICON_BULLET][ICON_CAPITAL]수도에 [COLOR_YELLOW]국고[ENDCOLOR]가 출현합니다.([ICON_GOLD]골드 +4, 모든 도시에서 기념비, 정원, 목욕탕에 [ICON_CULTURE]문화 +2, [ICON_VP_MERCHANT] 상인 슬롯 +1)'
WHERE Tag = 'TXT_KEY_POLICY_LANDED_ELITE_HELP';


/* (vp 4.4 over -delted)
-- Monarchy (now Majesty)
UPDATE Policies
SET
	NumCitiesFreeFoodBuilding = 4,
	CapitalUnhappinessMod = 0,
	PortraitIndex = 58
WHERE Type = 'POLICY_MONARCHY';

UPDATE Buildings
SET NoUnhappfromXSpecialists = 0
WHERE Type = 'BUILDING_PALACE_GARDEN';

-- Opener/Finisher
UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Tradition[ENDCOLOR] focuses on generating Great People and the construction of an impressive Capital.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Adopting Tradition grants:[ENDCOLOR] [NEWLINE][ICON_BULLET]+1 [ICON_CULTURE] Culture, +1 [ICON_RESEARCH] Science, +1 [ICON_GOLD] Gold in the [ICON_CAPITAL] Capital for every 2 [ICON_CITIZEN] Citizens. [NEWLINE][ICON_BULLET]+5% [ICON_FOOD] Growth in all Cities.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Each Tradition policy unlocked grants:[ENDCOLOR] [NEWLINE][ICON_BULLET]+3% [ICON_FOOD] Growth in all Cities, and +1 [ICON_CITIZEN] Population, and -1 [ICON_URBANIZATION] Urbanization in the [ICON_CAPITAL] Capital.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Adopting all Policies in Tradition grants:[ENDCOLOR][NEWLINE][ICON_BULLET]Unlocks building the [COLOR_POSITIVE_TEXT]University of Sankore[ENDCOLOR].[NEWLINE][ICON_BULLET]+1 [ICON_FOOD] Food and [ICON_PRODUCTION] Production from all Great Person Improvements and [ICON_RES_ARTIFACTS] Landmarks.[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]Throne Room[ENDCOLOR] built in [ICON_CAPITAL] Capital (+10% to all Yields, +1 City tile working range, 1 [ICON_VP_GREATMUSIC] Great Work of Music slot, 1 [ICON_VP_MUSICIAN] Musician Slot).[NEWLINE][ICON_BULLET]Allows for the purchase of [ICON_GREAT_ENGINEER] Great Engineers with [ICON_PEACE] Faith starting in the Industrial Era.'
WHERE Tag = 'TXT_KEY_POLICY_BRANCH_TRADITION_HELP';

-- Opener/Finisher
UPDATE Language_ko_KR
SET Text = '[COLOR_POSITIVE_TEXT]전통[ENDCOLOR]은 위인 및 인상적인 수도의 건설에 초점을 맞춥니다.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]정책 개방 보너스:[ENDCOLOR] [NEWLINE][ICON_BULLET][ICON_CAPITAL]수도의 [ICON_CITIZEN]시민 2명마다 [ICON_CULTURE]문화 +1, [ICON_RESEARCH]과학 +1, [ICON_GOLD]골드 +1 [NEWLINE][ICON_BULLET]모든 도시의 [ICON_FOOD]성장률 +5%[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]각 정책 채택 보너스:[ENDCOLOR] [NEWLINE][ICON_BULLET]모든 도시의 [ICON_FOOD]성장률 +3%[NEWLINE][ICON_BULLET][ICON_CAPITAL]수도의 [ICON_CITIZEN]시민 +1[NEWLINE][ICON_BULLET][ICON_CAPITAL]수도의 [ICON_URBANIZATION]도시화로 인한 불행 -1[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]계열 완성 보너스:[ENDCOLOR][NEWLINE][ICON_BULLET][COLOR_YELLOW]상코레 대학[ENDCOLOR] 불가사의 건설 가능[NEWLINE][ICON_BULLET][ICON_RES_ARTIFACTS] 랜드마크 및 위인 시설의 [ICON_FOOD]식량 +1, [ICON_PRODUCTION]생산 +1[NEWLINE][ICON_BULLET][ICON_CAPITAL]수도에 [COLOR_YELLOW]알현실[ENDCOLOR] 출현(모든 산출 +10%, [ICON_VP_MUSICIAN] 음악가 슬롯 +1, [ICON_VP_GREATMUSIC] 걸작 음악 슬롯 1, 도시 작업 범위 +1)[NEWLINE][ICON_BULLET]산업 시대 이후 [ICON_PEACE]신앙으로 [ICON_GREAT_ENGINEER][COLOR_YELLOW]위대한 기술자[ENDCOLOR] 구매 가능'
WHERE Tag = 'TXT_KEY_POLICY_BRANCH_TRADITION_HELP';
*/


/* (vp 4.4 over -delted)
-- Monarchy (now Majesty)
UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Majesty[ENDCOLOR][NEWLINE][ICON_BULLET]Specialists in [ICON_CAPITAL] Capital consume half the normal amount of [ICON_FOOD] Food.[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]Palace Garden[ENDCOLOR] built in [ICON_CAPITAL] Capital (+5 [ICON_FOOD] Food, +25% [ICON_GREAT_PEOPLE] Great Person Rate, 1 [ICON_GREAT_WORK] Great Work of Writing slot, 1 [ICON_VP_WRITER] Writer Slot).[NEWLINE][NEWLINE][ICON_BULLET] Free construction of Food-Building in the first 4 cities (including the capital).'
WHERE Tag = 'TXT_KEY_POLICY_MONARCHY_HELP';

UPDATE Language_ko_KR
SET Text = '[COLOR_POSITIVE_TEXT]존엄[ENDCOLOR][NEWLINE][ICON_BULLET][ICON_CAPITAL]수도의 전문가가 소모하는 [ICON_FOOD]식량이 평소보다 [COLOR_POSITIVE_TEXT]절반[ENDCOLOR] [COLOR:105:105:105:255](한도: [ICON_FOOD]1)[ENDCOLOR] 감소합니다. [NEWLINE][ICON_BULLET][ICON_CAPITAL]수도에 [COLOR_YELLOW]궁정 정원[ENDCOLOR]이 출현합니다.([ICON_FOOD]식량 +5,  [ICON_GREAT_PEOPLE]위인출현률 +25%, [ICON_VP_GREATWRITING]걸작 문학 슬롯 +1, [ICON_VP_WRITER] 작가 슬롯 +1)[NEWLINE][ICON_BULLET] 최초 4개 도시(수도 포함)에 [COLOR_POSITIVE_TEXT]식량건물[ENDCOLOR] 무료건설'
WHERE Tag = 'TXT_KEY_POLICY_MONARCHY_HELP';


/* (vp 4.4 over -delted)
--===================
--    Rationalism
--===================

-- Scientific Revolution (now Empiricism)

UPDATE Policies
SET
	OneShot = 0,
	MedianTechPercentChange = 0,
	CityGrowthMod = 25,
	SpecialistFoodChange = 0,
	NonSpecialistFoodChange = 0
WHERE Type = 'POLICY_SCIENTIFIC_REVOLUTION';


INSERT INTO Policy_SpecialistExtraYields
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_SCIENTIFIC_REVOLUTION', 'YIELD_FOOD', 1);



UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Empiricism[ENDCOLOR][NEWLINE][ICON_BULLET]Specialists generate +1 [ICON_FOOD] Food.[NEWLINE][ICON_BULLET]+25% [ICON_FOOD] Growth in all cities.[NEWLINE][ICON_BULLET]+3% [ICON_RESEARCH] Science in a City for every [ICON_GREAT_WORK] Great Work present (up to 20%).'
WHERE Tag = 'TXT_KEY_POLICY_SCIENTIFIC_REVOLUTION_HELP';

UPDATE Language_ko_KR
SET Text = '[COLOR_POSITIVE_TEXT]경험주의[ENDCOLOR][NEWLINE][ICON_BULLET]모든 전문가의 [ICON_FOOD]식량이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]증가합니다. [NEWLINE][ICON_BULLET]모든 도시의 성장률이 +25% 증가합니다.[NEWLINE][ICON_BULLET]현재 소유한 [ICON_GREAT_WORK]걸작 1개마다 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]3%[ENDCOLOR] 증가합니다.[COLOR:105:105:105:255](한도: 20%)[ENDCOLOR]'
WHERE Tag = 'TXT_KEY_POLICY_SCIENTIFIC_REVOLUTION_HELP';
*/