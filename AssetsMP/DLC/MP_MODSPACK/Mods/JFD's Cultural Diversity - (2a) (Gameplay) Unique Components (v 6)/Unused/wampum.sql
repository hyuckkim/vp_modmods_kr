
		<Row Tag="TXT_KEY_BUILDING_CD_WAMPUM_HOUSE">
			<Text>Wampum House</Text>
		</Row>
		<Row Tag="TXT_KEY_BUILDING_CD_WAMPUM_HOUSE_TEXT">
			<Text>Wampum is a traditional shell bead of the Eastern Woodlands tribes of Native Americans. It includes white shell beads hand-fashioned from the North Atlantic channeled whelk shell and white and purple beads made from the quahog or Western North Atlantic hard-shelled clam. In New York, wampum beads have been discovered dating before 1510. Strings of wampum were used for storytelling, ceremonial gifts, and recording important treaties and historical events, such as the Two Row Wampum Treaty and the Hiawatha Belt. Among the Iroquois, every chief and every clan mother has a certain string of wampum that serves as their certificate of office that they pass on. Runners carrying messages during colonial times would present the wampum showing that they had the authority to carry the message.[NEWLINE][NEWLINE]Wampum was also used by the northeastern Indigenous tribes as a means of exchange, strung together in lengths for convenience. The process to make wampum was labor-intensive with stone toolsa and only the coastal tribes had sufficient access to the basic shells to make wampum. These factors increased its scarcity and consequent value among the early European traders, who understood it as a currency and adopted it as such in trading with them. Wampum briefly became legal tender in North Carolina in 1710, but its use as common currency died out in New York by the early 18th century.</Text>
		</Row>
		<Row Tag="TXT_KEY_BUILDING_CD_WAMPUM_HOUSE_HELP">
			<Text>*this is updated in another file*</Text>
		</Row>
		<Row Tag="TXT_KEY_BUILDING_CD_WAMPUM_HOUSE_STRATEGY">
			<Text>Although you do not have to be in a Coastal City to receive benefits from the Wampum House, having Sea Resources worked by your City is lucrative and should feature in your Empire planning. The unique bonus of converting Culture to Gold is unusual and effectively devalues the latter giving you more flexibility in what Tiles and Specialists you work. The Chancery effects are much easier to obtain with the Wampum House, and the Ally benefit is increased to also generate Culture which, of course, also flows through to Gold.</Text>
		</Row>

		<Row>
			<Type>BUILDING_CD_WAMPUM_HOUSE</Type>
			<BuildingClass>BUILDINGCLASS_CHANCERY</BuildingClass>
			<Description>TXT_KEY_BUILDING_CD_WAMPUM_HOUSE</Description>
			<Civilopedia>TXT_KEY_BUILDING_CD_WAMPUM_HOUSE_TEXT</Civilopedia>
			<Help>TXT_KEY_BUILDING_CD_WAMPUM_HOUSE_HELP</Help>
			<Strategy>TXT_KEY_BUILDING_CD_WAMPUM_HOUSE_STRATEGY</Strategy>
			<IconAtlas>CD_ECONOMIC_ATLAS</IconAtlas>
			<PortraitIndex>38</PortraitIndex>
		</Row>

-- =======================
-- Wampum House (Chancery)
-- =======================
DELETE FROM Civilization_BuildingClassOverrides WHERE BuildingClassType = 'BUILDINGCLASS_HERBALIST' AND CivilizationType = 'CIVILIZATION_IROQUOIS';

INSERT INTO Civilization_BuildingClassOverrides 
	(CivilizationType, 	BuildingClassType, 	BuildingType)
VALUES
	('CIVILIZATION_IROQUOIS', 'BUILDINGCLASS_THEATRE', 'BUILDING_CD_WAMPUM_HOUSE');

INSERT INTO Building_ImprovementYieldChanges
	(BuildingType, ImprovementType, YieldType, Yield)
VALUES
	('BUILDING_CD_WAMPUM_HOUSE', 'IMPROVEMENT_FISHING_BOATS', 'YIELD_CULTURE', 1),
	('BUILDING_CD_WAMPUM_HOUSE', 'IMPROVEMENT_FISHING_BOATS', 'YIELD_GOLD', 1),
	('BUILDING_CD_WAMPUM_HOUSE', 'IMPROVEMENT_FISHING_BOATS', 'YIELD_GOLDEN_AGE_POINTS', 1);

INSERT INTO Building_YieldFromYieldPercent
	(BuildingType, YieldOut, YieldIn, Value)
VALUES
	('BUILDING_CD_WAMPUM_HOUSE', 'YIELD_GOLD', 'YIELD_CULTURE', 10);

INSERT INTO Building_YieldPerFriend
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CD_WAMPUM_HOUSE', 'YIELD_PRODUCTION', 2);

INSERT INTO Building_YieldPerAlly
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CD_WAMPUM_HOUSE', 'YIELD_PRODUCTION', 2),
	('BUILDING_CD_WAMPUM_HOUSE', 'YIELD_CULTURE', 1);

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CD_WAMPUM_HOUSE', 'YIELD_FAITH', 2);
