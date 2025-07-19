-- make holy sites a faith-based tile only. add other yields to fealty
DELETE FROM Improvement_Yields
WHERE ImprovementType = 'IMPROVEMENT_HOLY_SITE';

INSERT INTO Improvement_Yields
	(ImprovementType, YieldType, Yield)
VALUES
	('IMPROVEMENT_HOLY_SITE', 'YIELD_FAITH', 6);

DELETE FROM Improvement_TechYieldChanges
WHERE ImprovementType = 'IMPROVEMENT_HOLY_SITE';

INSERT INTO Improvement_TechYieldChanges
	(ImprovementType, TechType, YieldType, Yield)
VALUES	
	('IMPROVEMENT_HOLY_SITE', 'TECH_THEOLOGY', 'YIELD_FAITH', 3),
	('IMPROVEMENT_HOLY_SITE', 'TECH_ACOUSTICS', 'YIELD_FAITH', 3),
	('IMPROVEMENT_HOLY_SITE', 'TECH_ARCHAEOLOGY', 'YIELD_FAITH', 3),
	('IMPROVEMENT_HOLY_SITE', 'TECH_FLIGHT', 'YIELD_FAITH', 3);

DELETE FROM Belief_ImprovementYieldChanges
WHERE BeliefType = 'BELIEF_MESSIAH';

INSERT INTO Belief_ImprovementYieldChanges
	(BeliefType, ImprovementType, YieldType, Yield)
SELECT
	'BELIEF_MESSIAH', 'IMPROVEMENT_HOLY_SITE', a.type, 3
FROM Yields a WHERE a.Type in ('YIELD_FAITH', 'YIELD_CULTURE', 'YIELD_TOURISM');

UPDATE Language_ko_KR
SET Text = '불가사의에 대한 최소 정책 요구 사항이 1만큼 감소합니다. 이  [ICON_RELIGION] 종교의 선지자는 25% 더 강하고, [ICON_PEACE] 신앙 비용이 25% 감소합니다. 성지에서 [ICON_PEACE] 신앙, [ICON_CULTURE] 문화, [ICON_TOURISM] 관광이 +3 증가합니다. 이것이 다수 종교일 경우, [ICON_INQUISITOR] 이단심문관과 [ICON_PROPHET] 선지자의 추종자 감소는 절반으로 줄어듭니다.'
WHERE Tag = 'TXT_KEY_BELIEF_MESSIAH';


UPDATE Policies
SET FaithCostModifier = 0
WHERE Type = 'POLICY_PIETY';

UPDATE Language_ko_KR
SET Text = '[COLOR_POSITIVE_TEXT]충성[ENDCOLOR]은 [ICON_RELIGION] 다수 종교를 옹호하고 영향력을 행사하는 능력을 향상시킵니다.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]충성 채택 보상:[ENDCOLOR][NEWLINE][ICON_BULLET][ICON_PEACE] 신앙으로 수도원을 구매할 수 있습니다. ([ICON_FOOD] 식량 +3, [ICON_RESEARCH] 과학 +3, [ICON_PEACE] 신앙 +2, [ICON_PEACE] 신앙 구매 금액의 10%를 [ICON_GOLD] 골드로 전환)[NEWLINE][ICON_BULLET]건물, 선교사, 이단심문관 구매 시 [ICON_PEACE] 신앙 비용이 -25% 감소합니다.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]각 충성 정책 해제시 보상:[ENDCOLOR][NEWLINE][ICON_BULLET]모든 도시에서 [ICON_PEACE] 신앙과 [ICON_STRENGTH] 힘이 +1 증가합니다.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]모든 충성 정책 채택 보상:[ENDCOLOR][NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]붉은 요새[ENDCOLOR] 건설이 해제됩니다.[NEWLINE][ICON_BULLET][COLOR_POSITIVE_TEXT]공유하는 종교[ENDCOLOR]에 대한 [ICON_TOURISM] 관광 수정치가 +25% 증가합니다.[NEWLINE][ICON_BULLET]당신의 [ICON_RELIGION] 다수 종교를 따르는 도시는 [ICON_PRODUCTION] 생산력, [ICON_GOLD] 골드, [ICON_SCIENCE] 과학, [ICON_CULTURE] 문화가 +3만큼 증가합니다.[NEWLINE][ICON_BULLET]산업 시대 이후부터 [ICON_PEACE] 신앙으로 [ICON_GREAT_ARTIST] 위대한 예술가를 구매할 수 있게 됩니다.'
WHERE Tag = 'TXT_KEY_POLICY_BRANCH_PIETY_HELP';

-- Monastery

INSERT INTO Building_YieldFromFaithPurchase
			(BuildingType,			YieldType,			Yield) 
VALUES		('BUILDING_MONASTERY',	'YIELD_GOLD',		10);

UPDATE Language_ko_KR
SET Text = '[ICON_PEACE] 신앙으로 구입하는 종교 건물입니다. [ICON_PEACE] 신앙 구매 금액의 10%를 [ICON_GOLD] 골드로 전환합니다.[NEWLINE][NEWLINE][COLOR_MAGENTA]{TXT_KEY_POLICY_BRANCH_PIETY}[ENDCOLOR] 정책 분야의 채택이 필요합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_MONASTERY_HELP';

UPDATE Language_ko_KR
SET Text = '수도원은 [ICON_PEACE] 신앙, [ICON_FOOD] 식량, [ICON_RESEARCH] 과학 생산량을 증가시킵니다. 또한 그들은 신앙 구매를 골드로 전환하여 신앙의 가치를 높입니다. 충성 정책 계열을 채택한 경우에만 건설할 수 있습니다. [ICON_PEACE] 신앙으로 구매하여 이 건물을 건설합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_MONASTERY_STRATEGY';

-- organized religion changes
UPDATE Policies
SET
	VotesPerFollowingCityTimes100 = 0
WHERE Type = 'POLICY_ORGANIZED_RELIGION';

INSERT INTO Policy_SpecialistExtraYields
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_ORGANIZED_RELIGION', 'YIELD_FAITH', 1);

DELETE FROM Policy_BuildingClassYieldChanges
WHERE PolicyType = 'POLICY_ORGANIZED_RELIGION';

--INSERT INTO Policy_BuildingClassYieldModifiers
--	(PolicyType, BuildingClassType, YieldType, YieldMod)
--VALUES
--	('POLICY_ORGANIZED_RELIGION', 'BUILDINGCLASS_GRAND_TEMPLE', 'YIELD_FAITH', 20);

INSERT INTO Policy_ImprovementYieldChanges
	(PolicyType, ImprovementType, YieldType, Yield)
VALUES
	('POLICY_ORGANIZED_RELIGION', 'IMPROVEMENT_HOLY_SITE', 'YIELD_CULTURE', 5),
	('POLICY_ORGANIZED_RELIGION', 'IMPROVEMENT_HOLY_SITE', 'YIELD_TOURISM', 5);

UPDATE Language_ko_KR
SET Text = '[COLOR_POSITIVE_TEXT]조직된 종교[ENDCOLOR][NEWLINE][ICON_BULLET][ICON_RELIGION] 다수 종교를 따르는 도시로부터 25%의 압력을 받습니다.[NEWLINE][ICON_BULLET]전문가로부터 [ICON_PEACE] 신앙 +1을 받습니다.[NEWLINE][ICON_BULLET]성지에서 [ICON_CULTURE] 문화와 [ICON_TOURISM] 관광이 +5 증가합니다.'
WHERE Tag = 'TXT_KEY_POLICY_ORGANIZED_RELIGION_HELP';

-- name swap

UPDATE Policies
SET
	PortraitIndex = 47
WHERE Type = 'POLICY_THEOCRACY';

UPDATE Language_ko_KR
SET Text = '영지'
WHERE Tag = 'TXT_KEY_POLICY_THEOCRACY';

UPDATE Language_ko_KR
SET Text = '[COLOR_POSITIVE_TEXT]영지[ENDCOLOR][NEWLINE][ICON_BULLET]내부 [ICON_INTERNATIONAL_TRADE] 교역로에서 산출량이 +33% 증가합니다.[NEWLINE][ICON_BULLET]내부 [ICON_INTERNATIONAL_TRADE] 교역로를 완료하면 국제 [ICON_INTERNATIONAL_TRADE] 교역로를 완료한 것과 같은 역사적 이벤트가 발생합니다.[NEWLINE][ICON_BULLET]모든 도시에서 [ICON_CULTURE] 무료로 인한 [ICON_HAPPINESS_3] 불행이 -1 감소합니다.'
WHERE Tag = 'TXT_KEY_POLICY_THEOCRACY_HELP';

UPDATE Language_ko_KR
SET Text = '영지는 왕이 충성 서약을 대가로 하급 귀족에게 부여한 재산이나 소득원에 대한 상속권입니다. 영지는 일반적으로 귀족이 세금을 부과할 수 있는 수익을 창출하는 땅의 형태를 띠었고, 이 경우 영지를 봉지라고 불렀지만 무역 독점권이나 광산과 같은 자원권과 같이 다른 형태를 취할 수도 있었습니다. 이러한 영지는 중세 봉건 제도의 핵심이었으며, 왕이 상비군에 드는 비용이나 대규모 관료 조직을 필요로 하지 않고도 기사들을 자기들의 발 아래에 묶을 수 있게 해주었습니다. 기사들은 생계를 유지할 수단이 주어지자 스스로 생계를 유지해야 했습니다.'
WHERE Tag = 'TXT_KEY_POLICY_THEOCRACY_TEXT';

UPDATE Policies
SET
	PortraitIndex = 45
WHERE Type = 'POLICY_REFORMATION';

UPDATE Language_ko_KR
SET Text = '왕권신수설'
WHERE Tag = 'TXT_KEY_POLICY_REFORMATION';

UPDATE Language_ko_KR
SET Text = '[COLOR_POSITIVE_TEXT]왕권신수설[ENDCOLOR][NEWLINE][ICON_BULLET]문명 내 군사 유닛 10개마다 [ICON_HAPPINESS_1] 행복이 +1 증가합니다.[NEWLINE][ICON_BULLET]"[COLOR_POSITIVE_TEXT]국왕 경축일[ENDCOLOR]" 동안 [ICON_PRODUCTION] 생산이 +15% 증가하고  [ICON_CULTURE_LOCAL] 국경 성장률이 +100% 증가합니다.'
WHERE Tag = 'TXT_KEY_POLICY_REFORMATION_HELP';

UPDATE Language_ko_KR
SET Text = '왕권신수설, 또는 제왕신권설은 왕권과 정치적 정통성에 대한 정치적이고 종교적인 교리입니다. 군주는 어떠한 지상의 권위에도 복종하지 않으며, 통치권은 신의 뜻에서 직접 나온다고 주장합니다. 그러므로 왕은 그의 국민, 귀족 또는 왕국의 다른 어떤 계층, (특히 개신교 국가의 일부 견해에 따르면) 교회를 포함하여, 그 어떤 계층의 의지에도 복종하지 않습니다. 이 교리에 따르면, 오직 신만이 불의한 왕을 심판할 수 있습니다. 이 교리는 왕을 폐위시키거나 그의 권한을 제한하려는 모든 시도는 신의 뜻에 반하며 모독적인 행위가 될 수 있다는 것을 암시합니다. 이는 종종 "신의 은총으로"라는 문구로 표현되며, 군주의 칭호에 붙습니다.'
WHERE Tag = 'TXT_KEY_POLICY_REFORMATION_TEXT';

