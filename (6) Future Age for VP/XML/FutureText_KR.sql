---------------------------------------------------
-- Text (ko_KR)
---------------------------------------------------
INSERT INTO Language_ko_KR (Tag, Text) VALUES
('TXT_KEY_ERA_FW_FUTURE', '미래시대'),
('TXT_KEY_ERA_FW_FUTURE_SHORT', '미래');

--===========================
-- Policoes
--===========================

----------------------------------------------
-- Builiding-Policies All delted
----------------------------------------------
-- 충성-외교-미학 밸런스 전부 삭제처리. (지속영향은 불 필요, 타일만 교정 조치 필요)
-- 제국주의-산업-합리 밸런스적 부분으로 전부 삭제처리
-- Improvements Change
-- 산업
-- Entrepreneurship
UPDATE Language_ko_KR
SET Text = '[COLOR_POSITIVE_TEXT]기업가 정신[ENDCOLOR][NEWLINE][ICON_BULLET]작업장의 [ICON_HAPPINESS_1]행복이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][ICON_BULLET]모든 광산, 채석장, 제재소, 발전기, 연구단지, 산업단지의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][ICON_BULLET][ICON_GREAT_MERCHANT]위대한 상인 또는 [ICON_GREAT_ENGINEER]위대한 기술자를 소모할 때 효율이 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR] 증가합니다. '
WHERE Tag = 'TXT_KEY_POLICY_ENTREPRENEURSHIP_HELP';
-- 제국주의
-- Merchant Navy -- Now called Exploitation
UPDATE Language_ko_KR
SET Text = '[COLOR_POSITIVE_TEXT]착취[ENDCOLOR][NEWLINE][ICON_BULLET]농장, 야영지, 재배지, 자연보호구역, 친환경마을, 수경재배지구의 [ICON_FOOD]식량이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][ICON_BULLET]모든 대양, 해안, 호수 타일의 [ICON_RESEARCH]과학 및 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.'
WHERE Tag = 'TXT_KEY_POLICY_MERCHANT_NAVY_HELP';
-- 합리
-- SOVEREIGNTY
UPDATE Language_ko_KR
SET Text = '[COLOR_POSITIVE_TEXT]천부인권[ENDCOLOR][NEWLINE][ICON_BULLET]모든 요구 [ICON_HAPPINESS_3]불행이 -1 감소합니다.[NEWLINE][ICON_BULLET]모든 마을, 통신기지국, 자연보호구역의 [ICON_GOLD]골드 및 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다.[NEWLINE][ICON_BULLET]황금기 동안 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR] 증가합니다.'
WHERE Tag = 'TXT_KEY_POLICY_SOVEREIGNTY_HELP';
----------------------------------------------------------------------------------------------
-- simple is best!
---------------------------------------------------------------------------------------------
-- Civil Society
UPDATE Language_ko_KR
SET Text = '[COLOR_POSITIVE_TEXT]시민 사회[ENDCOLOR]: 전문가가 소모하는 [ICON_FOOD]식량이 평소보다 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] [COLOR:105:105:105:255](한도: [ICON_FOOD]1)[ENDCOLOR] 감소합니다. 농장, 친환경마을, 수경재배지구, 재배지, 야영지, 통신기지국, 자연보호구역, 고유 시설의 [ICON_FOOD]식량이 [COLOR_POSITIVE_TEXT]4[ENDCOLOR] 증가합니다.'
WHERE Tag = 'TXT_KEY_POLICY_CIVIL_SOCIETY_HELP';
-- Five Year Plan
UPDATE Language_ko_KR
SET Text = '[COLOR_POSITIVE_TEXT]5개년 계획[ENDCOLOR]: 모든 도시에서 건물을 건설할 때 [ICON_PRODUCTION]생산 보너스를 [COLOR_POSITIVE_TEXT]20%[ENDCOLOR] 제공합니다. 모든 광산, 채석장, 제재소, 유정, 통신기지국, 발전기, 연구단지, 산업단지, 고유 시설의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]3[ENDCOLOR] 증가합니다.'
WHERE Tag = 'TXT_KEY_POLICY_FIVE_YEAR_PLAN_HELP';
-- Mobilzation
UPDATE Language_ko_KR
SET Text = '[COLOR_POSITIVE_TEXT]군산복합체[ENDCOLOR]: [ICON_GOLD]골드로 유닛을 구매하는 비용이 [COLOR_POSITIVE_TEXT]33%[ENDCOLOR] 감소합니다. 모든 방어 건물, 성채, 요새, 고유 시설의 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]3[ENDCOLOR] 증가합니다.'
WHERE Tag = 'TXT_KEY_POLICY_MOBILIZATION_HELP';

--=========================
-- Tech
--=========================
UPDATE Language_ko_KR
SET Text = '프로메테우스 우주 계획' -- 영문은 교정하면 코드 에러남. 절대 교정 불가
WHERE Tag = 'TXT_KEY_PROJECT_APOLLO_PROGRAM';

UPDATE Language_ko_KR
SET Text = '[COLOR_YELLOW]프로메테우스 우주 계획[ENDCOLOR]은 지구의 고갈되는 자원에서 새로운 무대로 옮기는 시작을 알립니다. [NEWLINE][NEWLINE]당신의 문명이 처음으로 프로젝트를 완료했다면 [ICON_CAPITAL]수도 근처에 [ICON_GREAT_SCIENTIST][COLOR_YELLOW]위대한 과학자[ENDCOLOR]가 1명 출현하고, 문명이 즉시 [ICON_GOLDEN_AGE]황금기를 맞이합니다.'
WHERE Tag = 'TXT_KEY_PROJECT_APOLLO_PROGRAM_HELP';

UPDATE Language_ko_KR
SET Text = '[COLOR_YELLOW]프로메테우스 우주 계획[ENDCOLOR]은 지구를 넘어서 우주 경쟁의 시작점입니다. 프로메테우스 우주 계획을 완성하면 우주선 부품을 건조할 수 있게 됩니다. 각 문명은 각자 이 프로젝트를 완성해야만 우주선 부품을 건조할 수 있습니다. 당신이 가장 먼저 아폴로 우주 계획을 완성한다면, 위대한 과학자를 얻고 곧바로 황금기가 시작됩니다.'
WHERE Tag = 'TXT_KEY_PROJECT_APOLLO_PROGRAM_STRATEGY';

UPDATE Language_ko_KR
SET Text = '인류의 탐험욕구와 지적 호기심은 그들을 지구를 넘어 우주로 이끌었습니다. 프로메테우스 우주계획은 이러한 인류의 우주 탐험 본능을 대표하는 핵심적인 기관입니다. 이 계획은 우리의 태양계와 가장 가까운 별, 알파 센타우리로의 항성간 여행을 꿈꾸는 인류의 결실입니다. 프로메테우스 프로그램은 그러한 목표를 실현하기 위해 연구, 기술개발, 우주선 제작 등 다양한 분야에서 활동을 진행하며 인류의 우주 진출을 선도하고 있습니다.이 탄생 배경은 20세기 중반부터 시작된 우주 경쟁에서 시작되었습니다. 이 시기, 각 나라는 자신들의 국력을 과시하고 기술력을 확보하기 위해 우주 연구에 힘을 쏟았습니다. 그리고 이러한 연구의 결과로 우리는 달에 인간을 보내고, 화성을 탐사하며, 가장 가까운 별인 알파 센타우리로 우주선을 보내는 기술을 개발하게 되었습니다.그러나, 이런 기술 개발이 순전히 과학적인 목표를 위한 것만은 아니었습니다. 기후 변화, 자원 부족, 인구 과밀 등 지구상의 여러 문제들로 인해 우리의 생존 공간을 넓히는 것도 중요한 목표가 되었습니다. 프로메테우스 우주계획은 이러한 목표를 실현하기 위한 중요한 단계로, 인류의 우주 진출을 이끌고 있습니다.오늘날, 항성간 여행의 가능성을 연구하고, 인류의 우주 존재를 확장하는 데 필요한 기술을 개발하며, 알파 센타우리로의 첫 항성간 여행을 준비하는 등의 중요한 역할을 수행하고 있습니다. 이러한 노력은 우리의 지식을 넓히고, 새로운 가능성을 탐구하며, 결국은 인류의 우주 진출을 가능하게 할 것입니다.'
WHERE Tag = 'TXT_KEY_PROJECT_APOLLO_PROGRAM_PEDIA';

INSERT INTO Language_ko_KR (Tag, Text) VALUES
('TXT_KEY_TECH_FW_SEA_EXPLORE_TITLE','해양 탐사'),
('TXT_KEY_TECH_FW_SEA_EXPLORE_DESC','인류는 오래전부터 바다를 항로와 식량의 원천으로 이용해 왔으나, 행성 표면의 대부분을 차지하는 심해는 여전히 미지의 영역으로 남아 있습니다. 자율 잠수정(AUV)과 원격무인잠수정(ROV), 합성개구음파(소나)·자기·광학 센서가 결합된 탐사 체계는 대륙붕과 해저 산맥, 열수 분출구를 정밀하게 지도화하고, 망간단괴·코발트 풍화각·희토류 진흙 등 전략 광물의 분포를 드러내고 있습니다. 동시에 인공산호초를 통한 연안 생태 복원과 순환식 수산양식, 저영향 해저 채굴 기술이 발전하면서 바다는 채취·거주·보존이 공존하는 새로운 생활권으로 떠올랐습니다. 해양탐사는 이러한 기술적·환경적 진전을 한데 묶어, 바다를 감시·이해·책임 있게 운영하려는 현대 문명의 청색 전략을 상징합니다.'),
('TXT_KEY_TECH_FW_SEA_EXPLORE_HELP','깊은 바닷 속 채굴, 식량생산을 위한 양식 연구소, 인공산호초를 개발하여 도시의 산출량을 증가시킬 수 있으며, 해저터널을 건설하여 해안으로 떨어진 섬과 대륙을 육상교역로로 연결 할 수 있습니다.'),
('TXT_KEY_TECH_FW_SEA_EXPLORE_QUOTE','[NEWLINE][TAB][TAB]"바다에 대한 지식은 단순한 호기심의 문제가 아닙니다. 우리의 생존이 그것에 달려 있을지도 모릅니다."[NEWLINE][TAB][TAB] - 존 F. 케네디[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_GEN_MANIP_TITLE','유전자 공학'),
('TXT_KEY_TECH_FW_GEN_MANIP_DESC','DNA의 발견과 유전적 수준에서 유기체를 조작하는 능력이 증가함에 따라 일부 사람들은 다양한 방법으로 유기체를 개선하기 위한 노력의 일환으로 유기체의 유전적 구성을 조작하는 효과를 조사하게 되었습니다. 그러나 유전자 조작은 매우 문제가 될 수 있습니다. 유전적으로 변형된 더 단순한 유기체도 의도하지 않은 생물학적 및 환경적 영향을 미칠 수 있기 때문입니다. 인간 유전자 변형의 가능성은 많은 사회적, 윤리적 우려가 있는 문제이지만 일부 사람들은 잠재적인 이점이 그러한 위험을 능가할 것이라고 생각합니다.'),
('TXT_KEY_TECH_FW_GEN_MANIP_HELP','유전자공학 연구소를 건설하여 식량 생산 산출량을 올릴 수 있으며, 도시와 지도에 새로 생긴 제노포자 배양소를 건설하여 전략자원을 얻을 수 있습니다. 자연보호구역 시설을 건설할 수 있습니다.'),
('TXT_KEY_TECH_FW_GEN_MANIP_QUOTE','[NEWLINE][TAB][TAB]"우리는 매일 ‘이 유전자’ ‘저 유전자’를 갖고 있지만, 생물학이 그렇게 작동하는 것은 아닙니다. … 우리는 미리 프로그램된 존재가 아닙니다."[NEWLINE][TAB][TAB]- J. Craig Venter[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_ORBITAL_DEV_TITLE','우주 탐사'),
('TXT_KEY_TECH_FW_ORBITAL_DEV_DESC','인류는 마침내 대기의 한계를 넘어 우주로 향했다. 궤도에 올려진 거대한 망원경들은 지구에서는 결코 볼 수 없었던 은하와 성운, 그리고 우주의 탄생 흔적까지 포착하기 시작했다. 이 시기 우주 탐사는 단순한 경쟁을 넘어 새로운 지식의 전환점을 만들었으며, 인류는 우주라는 미지의 장막을 하나씩 걷어내기 시작했다.[NEWLINE]각국 정부는 여전히 우주 탐사에 막대한 자원을 투입하며 주도권을 유지하고 있지만, 상업 기업들 역시 점차 우주 산업에 뛰어들어 인공위성 통신, 소형 탐사선, 상업 발사체 같은 새로운 분야를 개척하고 있다. 이로써 궤도 위에서의 복잡한 통신망이 구축되고, 미세중력 환경을 활용한 연구와 산업 생산의 가능성도 열리게 되었습니다.[NEWLINE]무엇보다 중요한 것은, 인류가 이제 처음으로 우주의 비밀을 과학적으로 밝혀내기 시작했다는 점이다. 과거 신화와 상상 속에서만 존재하던 우주가 점차 현실의 탐사와 관측 속에서 그 모습을 드러내고 있는 것이다.'),
('TXT_KEY_TECH_FW_ORBITAL_DEV_HELP','미래시대 개척자를 생산할 수 있습니다. 우주선 공장과 허블 망원경을 건설하여 우주 개발을 할 수 있습니다. 우주선 발사과정에서 얻은 기술로 탄도미사일과 집속탄 미사일 유닛을 생산할 수 있습니다. '),
('TXT_KEY_TECH_FW_ORBITAL_DEV_QUOTE','[NEWLINE][TAB][TAB]"달 및 기타 천체를 포함한 우주 공간의 탐사 및 사용은 경제 또는 과학 발전 정도에 관계없이 모든 국가의 이익과 이익을 위해 수행되어야 합니다. , 그리고 모든 인류의 영역이 될 것입니다."[NEWLINE][TAB][TAB] - 달 및 기타 천체를 포함한 우주 공간의 탐사 및 사용에 관한 국가 활동을 규율하는 원칙에 관한 조약 제1조[ NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_ECOTHEORY_TITLE','생태유전학'),
('TXT_KEY_TECH_FW_ECOTHEORY_DESC','기존의 환경보호 운동은 인간 활동에 맞서 자연을 지키고자 하였으나, 종종 인간과 자연을 서로 분리된 존재로 인식하는 한계를 지니고 있었습니다. 그러나 유전학 연구가 발전하고 생태계에 대한 이해가 깊어지면서, 인간과 환경을 단일한 통합 시스템의 일부로 바라보려는 움직임이 점점 확산되고 있습니다.[NEWLINE]생태유전학은 생태계 속에서 유전적 다양성과 적응 과정을 연구하며, 특정 종의 유전 정보가 환경 변화와 어떻게 상호작용하는지를 과학적으로 분석합니다. 이를 통해 인간과 생태계 모두의 유전자 풀을 보존하고, 환경 변화에 대응하는 생물학적 메커니즘을 밝혀내는 데 중요한 기여를 하고 있습니다.[NEWLINE]또한 일부 신우생학적 관점에서는 환경을 보존하는 것에서 한 걸음 더 나아가, 인간과 생태계 모두가 유전적 정보를 바탕으로 보다 조화롭게 공존할 수 있는 방향을 모색해야 한다고 주장합니다. 이러한 시도는 생태계 파괴를 최소화하고 유전적 다양성을 유지하며, 궁극적으로 인간과 자연이 상호 의존적인 균형 속에서 지속 가능한 진화를 이룰 수 있도록 돕는 데 목적을 두고 있습니다.'),
('TXT_KEY_TECH_FW_ECOTHEORY_HELP','우생학에 따른 신체가 뛰어난 유전자 선별 용병과 숲과 정글, 초원과 평원의 생산 산출량을 증가시키는 생태친화시설과 친환경 마을을 건설할 수 있습니다. 스발바르 국제 종자저장고를 건설할 수 있습니다.'),
('TXT_KEY_TECH_FW_ECOTHEORY_QUOTE','[NEWLINE][TAB][TAB]"모든 생명체는 밀접하게 연결되어 있으며, 이러한 친밀함으로부터 식별 능력이 태어나고, 그 자연스러운 결과로 비폭력이 실천됩니다."[NEWLINE][TAB][TAB]- 아르네 나스[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_GRID_COMPUTING_TITLE','분산 컴퓨터 공학'),
('TXT_KEY_TECH_FW_GRID_COMPUTING_DESC','컴퓨팅 시스템의 발전은 점점 더 광범위한 컴퓨터 네트워크로 확장되었습니다. 병렬 처리를 통해 다양한 계산을 동시에 수행할 수 있으므로 계산 속도가 크게 향상되었고, 분산 컴퓨터 네트워크는 단일 시스템에 의존하지 않기 때문에 기계적 오류에도 보다 유연하고 탄력적인 시스템을 만들어 냅니다.[NEWLINE]그리드 컴퓨팅은 수많은 독립적인 컴퓨터 자원을 네트워크로 연결하여 하나의 초고성능 가상 슈퍼컴퓨터처럼 활용하는 기술입니다. 이를 통해 대규모 데이터 분석, 기후 변화 시뮬레이션, 유전체 해독, 입자 물리학 실험과 같은 막대한 계산량을 요구하는 연구가 가능해졌습니다.[NEWLINE]또한 이러한 기술은 단순히 과학 연구에만 머무르지 않고, 국제 금융망·인공지능 학습·실시간 의료 데이터 분석 같은 실용적 영역에서도 핵심적인 역할을 수행하고 있습니다. 결국 그리드 컴퓨팅은 인간 사회의 지식 생산과 문제 해결 능력을 새로운 차원으로 끌어올리는 핵심 기반으로 자리매김하였습니다.'),
('TXT_KEY_TECH_FW_GRID_COMPUTING_HELP','대공방어를 위한 비호복합 이동식 SAM 발사대와 도시의 골드 산출량을 증가시키는 암호화폐거래소와 상인 전문가의 골드 산출량이 증가합니다. 상하이 국제 금융센터 세계 불가사의를 건설할 수 있습니다.'),
('TXT_KEY_TECH_FW_GRID_COMPUTING_QUOTE','[NEWLINE][TAB][TAB]"저는 완전히 P2P 방식으로, 신뢰할 수 있는 제3자가 필요 없는 새로운 전자 화폐 시스템을 개발해 왔습니다."[NEWLINE][TAB][TAB]- 사토시 나카모토[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_MEMETICS_TITLE','가상 시뮬레이션'),
('TXT_KEY_TECH_FW_MEMETICS_DESC','가상 시뮬레이션 기술은 현실의 복잡한 현상을 안전하고 정밀하게 재현할 수 있는 환경을 제공합니다. 이를 통해 과학 연구, 군사 훈련, 산업 설계 등에서 실제 실험의 한계와 위험을 극복하며, 미래 시나리오를 미리 검증하고 최적화할 수 있는 길을 열어줍니다.'),
('TXT_KEY_TECH_FW_MEMETICS_HELP','가상훈련장을 건설하여 군사 유닛의 경험치를 빠르게 향상시킬 수 있습니다. 또한 가상현실 연구소와 데이터 시뮬레이션 센터를 건설하여 과학 및 생산 효율을 높일 수 있습니다. 가상 아이돌을 건설할 수 있습니다.'),
('TXT_KEY_TECH_FW_MEMETICS_QUOTE','[NEWLINE][TAB][TAB]"우리는 시뮬레이션을 통해 불가능한 것을 가능하게 하고, 위험한 것을 안전하게 만들며, 미래를 미리 경험할 수 있습니다."[NEWLINE][TAB][TAB]- Ivan Sutherland[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_SUPERCOMPUTERS_TITLE','데이터 정보학'),
('TXT_KEY_TECH_FW_SUPERCOMPUTERS_DESC','데이터 정보학은 인류가 생성하는 방대한 양의 데이터를 수집·저장·분석하여 새로운 가치를 창출하는 기술입니다.[NEWLINE][NEWLINE]인터넷, IoT 센서, 위성, 유전자 분석 등에서 쏟아지는 데이터는 전통적인 방법으로는 처리할 수 없을 만큼 방대해졌으며, 이를 분석하고 해석하기 위해 빅데이터 알고리즘과 인공지능이 결합된 새로운 패러다임이 등장했습니다.[NEWLINE][NEWLINE]이 기술을 통해 질병 확산 예측, 기후 변화 분석, 도시 에너지 효율화, 교통 흐름 최적화, 실시간 경제 동향 파악 등 과거에는 불가능했던 복잡한 문제들을 해결할 수 있습니다. 미래에는 데이터 기반의 예측 모델이 과학, 산업, 행정, 국방 등 사회 전 영역의 의사결정을 혁신적으로 변화시킬 것입니다.'),
('TXT_KEY_TECH_FW_SUPERCOMPUTERS_HELP','도시에 데이터 센터를 건설하여 과학 산출량을 증가시키고, 데이터 중심 시스템을 통해 각 산출을 증가시킬 수 있습니다. 추가로 데이타워를 건설하여 첨단 데이터 인프라를 강화할 수 있습니다.'),
('TXT_KEY_TECH_FW_SUPERCOMPUTERS_QUOTE','[NEWLINE][TAB][TAB]"데이터 없이는 이론도, 과학도, 혁신도 존재할 수 없습니다."[NEWLINE][TAB][TAB]- Peter Norvig[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_NANOMATERIALS_TITLE','나노물질 공학'),
('TXT_KEY_TECH_FW_NANOMATERIALS_DESC','나노물질 공학은 미세 가공 연구에서 비롯된 재료 계측·합성 기술의 발전을 바탕으로, 기존의 석탄·석유·철광석과 같은 산업 자원에서도 희토류 채굴에 의존하지 않고 나노 단위의 희귀 물질을 추출할 수 있는 가능성을 열어주었습니다.[NEWLINE]이 기술을 통해 얻어진 초미세 구조의 재료들은 기존에 볼 수 없었던 독특한 광학적, 전자적, 기계적 성질을 제공하며, 미래의 에너지 시스템, 우주 탐사 장비, 생명공학 연구소와 같은 과학 시설들의 성능을 획기적으로 향상시킬 수 있습니다.[NEWLINE]궁극적으로 나노물질 공학은 지구 자원의 활용 방식 자체를 변화시켜, 고갈 위기에 직면한 산업 자원에 새로운 생명을 불어넣고, 인류가 직면한 에너지·환경 문제의 해결책을 제시하는 미래 기술의 핵심으로 자리 잡게 될 것입니다.'),
('TXT_KEY_TECH_FW_NANOMATERIALS_HELP','나노물질을 생산하는 나노물질 제조소를 얻을 수 있습니다. 첨단 연구단지 시설을 건설할 수 있습니다. 연구서버를 설치하여 도시의 과학을 비약적으로 증가시킬 수 있습니다.'),
('TXT_KEY_TECH_FW_NANOMATERIALS_QUOTE','[NEWLINE][TAB][TAB]"먼 행성의 탄소 원자가 DNA로 재배열되고, 미생물이 형성되고, 등뼈가 자라며, 바다 주위를 헤엄치고, 양서류로 변이되어 마른 땅으로 기어들어갔습니다. 그리고 마침내 택시가 우주의 입에 나타났습니다. 골목."[NEWLINE][TAB][TAB] - Mark Coggins, "불멸의 게임"[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_ARTIFICIAL_ENVIRONMENTS_TITLE','인공 환경'),
('TXT_KEY_TECH_FW_ARTIFICIAL_ENVIRONMENTS_DESC','우주 공간의 유인 탐사 및 거주는 가능한 가장 적대적인 환경 중 하나에서 인간을 유지하는 데 사용할 수 있는 기술의 상당한 발전이 필요합니다. 특히 숨 쉴 수 있는 공기와 마실 수 있는 물, 음식을 제공할 수 있는 자급자족 환경이 필요합니다. 그러나 이러한 기술은 우주 여행에만 적용되는 것은 아닙니다. 지하, 건조 지역 또는 바다 아래에 자족적인 환경을 조성하여 인간이 거주할 수 있는 공간의 양을 크게 늘릴 수 있기 때문입니다.'),
('TXT_KEY_TECH_FW_ARTIFICIAL_ENVIRONMENTS_HELP','수직형 농장을 건설하여 식량 생산과 과학 산출량을 증가시킬 수 있습니다. 연안을 경비하는 고속정과 방어를 하기위한 미래시대 보병을 양산할 수 있습니다. 농장 타일을 개선하는 수경재배지구를 건설할 수 있습니다. 이든프로젝트를 건선할 수 있습니다.'),
('TXT_KEY_TECH_FW_ARTIFICIAL_ENVIRONMENTS_QUOTE','[NEWLINE][TAB][TAB]"인공적인 인간 환경이 될수록 자연이라는 단어는 가치를 나타내는 용어가 됩니다."[NEWLINE][TAB][TAB] - Wendell Berry[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_ORGANICS_TITLE','생명기술공학'),
('TXT_KEY_TECH_FW_ORGANICS_DESC','생명기술공학은 점점 더 정교한 생명공학적 기법을 활용하여 유기물질의 구조와 기능을 분자 단위에서 조작하는 기술로 발전하고 있습니다. 특히 해양 생태계에서 발견되는 다양한 생체 유래 물질과 미세생물의 대사 과정을 분석하면서, 이들이 무기질과 상호작용할 때 나타나는 독특한 화학·물리적 특성이 주목받고 있습니다.[NEWLINE]이러한 연구는 특정 금속 이온이나 광물 성분이 단백질·핵산·지질 등 유기 분자와 결합해 새로운 촉매 구조를 형성하거나, 에너지 전환 반응을 가속화하는 원리를 밝혀내고 있습니다. 나아가 해양 미생물과 무기질의 공생적 대사 경로를 모사하거나 인공적으로 설계함으로써, 환경 친화적 에너지 생산·오염 물질 분해·신소재 합성 같은 분야에서 혁신적인 응용 가능성이 열리고 있습니다.[NEWLINE]궁극적으로 바이오공학과 재료과학의 융합은 생명체의 유기적 복잡성과 무기질의 물리·화학적 안정성을 결합하여, 미래 생명과학 기술과 산업 전반의 획기적 변화를 이끌 핵심 기반으로 자리 잡고 있습니다.'),
('TXT_KEY_TECH_FW_ORGANICS_HELP','탄도미사일잠수함을 양산할 수 있습니다. 바이오공장이나 해양바이오공장을 건설하여 도시의 생산력을 올릴 수 있습니다. 첨단바이오연구소를 개발하여 도시의 산출을 증가시킬 수 있으며, 제노포자 배양지를 건설할 수 있습니다.'),
('TXT_KEY_TECH_FW_ORGANICS_QUOTE','[NEWLINE][TAB][TAB]"바이오기술이 일상적으로 널리 퍼지면, 우리는 다윈적 진화를 넘어 설 수 있는 시대에 들어서게 됩니다. 금속 추출 능력을 지닌 해양 생물처럼, 새로운 생명 형태가 화석 연료 대신 환경적 순환을 가능하게 할 수 있습니다."[NEWLINE][TAB][TAB]- Freeman Dyson[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_IMPLANTS_TITLE','생체의공학'),
('TXT_KEY_TECH_FW_IMPLANTS_DESC','생체의공학은 배아줄기세포 연구와 정밀 유전자 편집 기술의 발전을 바탕으로, 손상된 조직과 장기를 유전적으로 재설계하여 맞춤형 치료와 장기 재생을 가능하게 하는 미래 의생명공학입니다. CRISPR-Cas9과 같은 유전자 편집 도구와 줄기세포 배양 기술을 결합함으로써, 특정 질환에 저항성을 가진 세포를 설계하거나, 맞춤형 장기를 실험실에서 배양해 이식하는 것이 현실화되고 있습니다. 이러한 연구는 유전자 치료뿐만 아니라 인간의 질병 취약성을 근본적으로 줄이고, 유전적 특성을 개선하는 데까지 확장되고 있습니다. 이 기술은 단순한 치료를 넘어 인간 생물학의 한계를 재설계하는 새로운 시대를 열어가고 있습니다.'),
('TXT_KEY_TECH_FW_IMPLANTS_HELP','생체의공학 기술을 통해 유전자 편집 연구소와 배아줄기세포 재생 센터를 건설할 수 있으며, 맞춤형 치료를 위한 고급 의료 유닛과 특수 연구 시설을 생산할 수 있습니다. 이를 통해 도시의 과학 산출량과 인구 성장에 이점을 제공할 수 있습니다.'),
('TXT_KEY_TECH_FW_IMPLANTS_QUOTE','[NEWLINE][TAB][TAB]"우리는 더 이상 자연 선택의 수동적 산물이 아니라, 생명을 설계하는 능동적 주체가 되고 있습니다."[NEWLINE][TAB][TAB] - Jennifer Doudna[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_MECHATRONICS_TITLE','AI: 생성형'),
('TXT_KEY_TECH_FW_MECHATRONICS_DESC','생성형 AI는 단순한 자동화와 계산을 넘어 언어, 이미지, 음악, 코드 등 다양한 창작물을 스스로 만들어내는 인공지능 기술입니다. 대규모 신경망과 자기지도 학습의 결합으로, AI는 이제 인간의 지식과 상상력을 가속화하며 과학, 예술, 산업, 행정 전반의 혁신을 이끌고 있습니다.'),
('TXT_KEY_TECH_FW_MECHATRONICS_HELP','생성형 AI를 통해 네트워크 중심지와 데이터 타워를 건설할 수 있으며, 모든 산출량을 동시에 증가시킵니다. 또한 AI 기반 행정 시스템을 구축하여 도시의 생산성과 외교적 영향력을 높일 수 있습니다.'),
('TXT_KEY_TECH_FW_MECHATRONICS_QUOTE','[NEWLINE][TAB][TAB]"AI는 인류가 만든 가장 강력한 도구이자, 우리가 스스로를 이해하는 방식을 바꾸는 열쇠입니다."[NEWLINE][TAB][TAB]- Geoffrey Hinton[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_FUTURE_BALLISTICS_TITLE','미래형 탄도학'),
('TXT_KEY_TECH_FW_FUTURE_BALLISTICS_DESC','미래형 탄도학은 단순한 로켓 공학을 넘어, 우주와 전장을 아우르는 첨단 무기 체계를 가능하게 하는 핵심 기술입니다. 이 단계에서는 극초음속 미사일 체계가 개발되어 마하 10을 넘는 속도로 전 세계 어디든 수 분 내 타격할 수 있으며, 6세대 스텔스 무인 전투기는 자율 비행과 인공지능 전술 시스템을 탑재하여 공중 우세를 새로운 차원으로 끌어올립니다. 또한 재사용 가능한 우주 발사체 기술은 준궤도 폭격기와 궤도 폭격 시스템을 현실화하여, 지구 저궤도에서 직접적인 전력 투사가 가능해집니다. 이 모든 기술은 미래형 전쟁 양상을 근본적으로 바꾸는 전략적 전환점을 제공합니다.'),
('TXT_KEY_TECH_FW_FUTURE_BALLISTICS_HELP','미래형 탄도학을 통해 극초음속 미사일, 스텔스 무인 전투기, 준궤도 폭격기 같은 첨단 유닛을 생산할 수 있습니다. 재사용 발사체 기술은 우주 시설 건설 속도를 가속화하며, 도시의 생산력과 군사 작전 능력을 동시에 향상시킵니다.'),
('TXT_KEY_TECH_FW_FUTURE_BALLISTICS_QUOTE','[NEWLINE][TAB][TAB]"다음 주요 전쟁은 우주에서 승패가 갈릴 수 있습니다."[NEWLINE][TAB][TAB]- 미국방부 차관 대리 데이글린 샨하한[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_POWER_SYSTEMS_TITLE','지구에너지공학'),
('TXT_KEY_TECH_FW_POWER_SYSTEMS_DESC','지구에너지공학은 심층 시추공을 통해 지구 내부의 열에너지와 광물 자원을 직접 탐사·활용하고, 기존의 식물 기반 바이오연료 생산 기술을 고도화하여 지속 가능한 에너지 체계를 구축하는 학문입니다. 첨단 지구물리 연구소에서는 지각·맨틀의 지열 데이터와 지구화학적 분석을 바탕으로 새로운 에너지원을 개발하고, 심층 채굴 기술은 고온·고압 환경에서도 안정적인 자원 확보를 가능하게 합니다. 이 기술은 기존의 화석 연료 의존도를 줄이고, 바이오연료와 지구 내부 에너지를 융합하여 미래 도시와 산업의 전력 수요를 충족시키는 핵심 기반이 됩니다.'),
('TXT_KEY_TECH_FW_POWER_SYSTEMS_HELP','지구에너지공학을 통해 심층 시추공과 지구물리 연구소를 건설하여 도시의 에너지 산출량을 대폭 향상시킬 수 있습니다. 또한 첨단 바이오연료 플랜트를 운영하여 식물 자원과 광물 자원을 고효율 에너지원으로 전환할 수 있습니다.'),
('TXT_KEY_TECH_FW_POWER_SYSTEMS_QUOTE','[NEWLINE][TAB][TAB]"지열 에너지는 세 가지 자원을 제공합니다: 난방·냉방·발전을 위한 에너지원, 저장 자원, 그리고 광물 자원입니다."  [NEWLINE][TAB][TAB]- Amanda Kolker, 미국 국립재생에너지연구소(NREL)[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_CLONING_TITLE','합성생물학'),
('TXT_KEY_TECH_FW_CLONING_DESC','합성생물학은 세포 유전자 조작을 넘어, 멸종된 생물 종까지 복원할 수 있는 미래 기술로 발전했습니다. 현대 유전자 편집과 DNA 합성 기술은 고대 맘모스, 공룡 같은 종의 DNA를 복구하고, 실험실 환경에서 인공 배아를 배양하여 새로운 개체로 재탄생시키는 길을 열었습니다. 이 연구는 단순 복제를 넘어 멸종 생물 복원, 유전자 개량, 생태계 복원과 같은 분야로 확장되며, 생명공학과 생태 보전의 경계를 허무는 혁신적 전환점이 되고 있습니다.'),
('TXT_KEY_TECH_FW_CLONING_HELP','쥬라기 공원을 건설하여 공룡 유닛과 복원된 고대 생물을 생산할 수 있습니다. 복제연구소를 건설하여 군사 한도를 증가시키고, 생태 복원 프로젝트를 통해 도시의 문화와 과학 산출량을 향상시킬 수 있습니다.'),
('TXT_KEY_TECH_FW_CLONING_QUOTE','[NEWLINE][TAB][TAB]"생명은 길을 찾아낸다." [NEWLINE][TAB][TAB]- Ian Malcolm, Jurassic Park[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_EUTHENICS_TITLE','생체하이브리드공학'),
('TXT_KEY_TECH_FW_EUTHENICS_DESC','생체의공학과 바이오공학의 발전은 오랫동안 해결되지 않았던 바이오 물질과 금속 사이의 근본적 간극을 메우기 시작했습니다. 초기 연구에서는 세포 기반 조직과 합성 금속 구조가 서로 다른 물리·화학적 특성 때문에 면역 거부 반응을 유발하거나 기능적 결합이 제한되는 문제가 있었습니다. 그러나 생체 적합성 코팅, 유전자 수준의 조직 재설계, 그리고 나노 단위 금속-세포 결합 기술의 융합은 마침내 이 장벽을 허물고 양측 물질을 자유롭게 변환·결합할 수 있는 특이점을 열어 주었습니다. 이러한 기술적 도약은 단순한 보철 장치를 넘어, 신체 조직 내에 거부반응 없이 통합되는 생체기계적 신체 개조와 자가 재생 장치 개발의 길을 열게 되었습니다.'),
('TXT_KEY_TECH_FW_EUTHENICS_HELP','생체하이브리드공학을 통해 도시에서 바이오-금속 융합 배양소/추출소를 건설할 수 있습니다. 이 건물은 미래형 전략 자원을 기존 자원에서 추출할 수 있게 하며, 하이브리드 유닛의 전투력과 내구성을 강화합니다.'),
('TXT_KEY_TECH_FW_EUTHENICS_QUOTE','[NEWLINE][TAB][TAB]"The science of today is the technology of tomorrow."[NEWLINE][TAB][TAB]"오늘날의 과학은 내일의 기술이다."[NEWLINE][TAB][TAB]- Edward Teller[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_COGNITIVE_TECH_TITLE','AI: 통합형'),
('TXT_KEY_TECH_FW_COGNITIVE_TECH_DESC','통합형 AI는 시각, 청각, 촉각 등 다양한 감각 데이터를 융합하여 현실 환경을 이해하고, 인지 처리와 행동 제어를 하나의 지능 체계로 통합하는 기술입니다. 이 단계의 AI는 생성형 AI의 창의적 능력을 기반으로 물리적 세계를 인식하고 반응할 수 있는 능력을 획득하며, 완전 자율 시스템과 휴머노이드 로봇을 향한 결정적인 기반 기술이 됩니다.'),
('TXT_KEY_TECH_FW_COGNITIVE_TECH_HELP','통합형 AI를 통해 감각 융합 연구소와 지능형 제어 센터를 건설할 수 있으며, 도시의 과학·생산 산출량을 동시에 향상시킬 수 있습니다. 또한 미래의 자율 시스템과 로봇 기술 발전을 위한 필수 전단계 역할을 합니다.'),
('TXT_KEY_TECH_FW_COGNITIVE_TECH_QUOTE','[NEWLINE][TAB][TAB]"우리는 이제 단순히 생각하는 기계가 아니라 세상을 경험하고 해석하는 지능을 만들고 있다."[NEWLINE][TAB][TAB]- Rodney Brooks[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_NUCLEAR_ENRICHMENT_TITLE','고에너지 신소재공학'),
('TXT_KEY_TECH_FW_NUCLEAR_ENRICHMENT_DESC','고에너지 신소재공학은 초정밀 레이저, 극저온 냉각, 고압 고온 환경 시뮬레이션을 결합하여 상온 초전도체의 실현에 박차를 가하는 기술 분야입니다. 상온 초전도체는 저항 없는 전력 전송, 극한 자기장 제어, 에너지 효율 극대화 등 미래형 에너지 시스템의 핵심 기반으로 여겨지며, 이를 통해 실리콘 한계를 뛰어넘는 초고속 컴퓨팅 및 자기부상 교통망 구축이 가능해집니다. 이 기술 개발에는 신소재와 원자단위의 조립 연구가 필수입니다. 초고농축 레이저를 통해 핵광자를 연구하여 새로운 차폐막, 냉각장치 등을 개발할 수 있습니다.'),
('TXT_KEY_TECH_FW_NUCLEAR_ENRICHMENT_HELP','정밀 소재 연구소를 건설하여 나노물질과 우라늄을 확보할 수 있습니다. 도시의 과학 산출과 에너지 효율이 향상되고, 애퍼처 사이언스센터를 건설할 수 있습니다.'),
('TXT_KEY_TECH_FW_NUCLEAR_ENRICHMENT_QUOTE','[NEWLINE][TAB][TAB]"상온에서 작동하는 초전도체를 개발하는 것은 진정한 꿈입니다... 이러한 물질은 전자 기반 산업 전부를 혁신할 것이며, 컴퓨팅과 의료, 에너지 생산, 수송까지 완전히 바꿔 놓을 것입니다."[NEWLINE][TAB][TAB]- Dean[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_ASTRODYNAMICS_TITLE','궤도역학'),
('TXT_KEY_TECH_FW_ASTRODYNAMICS_DESC','지구공학과 미래형 탄도학의 발전은 인류를 수많은 위성 시대 속으로 이끌었습니다. 궤도 전력위성은 지구에 도달하는 태양 복사량을 조절해 지구온난화를 완화하고 지능형 전력망을 가능하게 했습니다. 스카이훅 구조물과 혁신적 궤도 수송 기술은 지표와 궤도를 연결하며 우주 기반 인프라를 현실로 만들었습니다. 이러한 기술들은 인류가 공간을 넘어 발을 디디고자 하는 깊은 열망의 표현이며, 인간 우주 시대의 문을 여는 결정적인 기반이 되었습니다.'),
('TXT_KEY_TECH_FW_ASTRODYNAMICS_HELP','궤도역학을 통해 우주 전력위성, 스카이훅 발사 시설, 궤도 감시 네트워크를 건설할 수 있으며, 도시의 에너지와 과학 산출량이 증가합니다.'),
('TXT_KEY_TECH_FW_ASTRODYNAMICS_QUOTE','[NEWLINE][TAB][TAB]"우리는 달에 가기로 선택했습니다. 우리는 이 일을 쉽기 때문에가 아니라, 어렵기 때문에 하기로 선택했습니다."[NEWLINE][TAB][TAB]- 존 F. 케네디(1962), 라이스 대학 연설[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_TRANSGENICS_TITLE','유전자 개조'),
('TXT_KEY_TECH_FW_TRANSGENICS_DESC','제노포자(Xenofungus)는 처음에는 정체를 알 수 없는 생물학적 미스터리로 여겨졌습니다. 그러나 유전공학의 발전과 정밀 분석 기술의 발달을 통해 과학자들은 마침내 제노포자 내부에서 고도로 반응적인 돌연변이 촉진 물질, 즉 폴루스 돌연변이원(Pholus Mutagen)을 발견하게 되었습니다. 이 돌연변이원은 후성유전적 경로를 자극해 세포 발현 패턴을 재구성하고, 생물체에 급격하면서도 적응적인 변화를 유도할 수 있음을 보여주었습니다. 인류는 이 물질을 통해 맞춤형 유전자 개조, 고속 진화 시뮬레이션, 그리고 생태계 설계에 이르는 새로운 시대를 열게 되었습니다.'),
('TXT_KEY_TECH_FW_TRANSGENICS_HELP','생명공학센터를 건설해 [ICON_RES_ADN_FUNGUS]제노포자와 폴루스 돌연변이원을 활용할 수 있습니다. 도시의 과학·식량·생산 산출량이 증가하고, 돌연변이 승급을 지닌 특수 유전자 개조 유닛을 생산할 수 있게 됩니다.'),
('TXT_KEY_TECH_FW_TRANSGENICS_QUOTE','[NEWLINE][TAB][TAB]"크고 갑작스러운 변화만큼 인간의 마음에 고통스러운 것은 없습니다."[NEWLINE][TAB][TAB]- Mary Shelley, Frankenstein (1818)[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_NEURAL_INTERFACE_TITLE','신경양자시스템'),
('TXT_KEY_TECH_FW_NEURAL_INTERFACE_DESC','바이오컴퓨터의 등장은 인류가 신경-기계 인터페이스의 가장 큰 장애물 중 하나였던 면역 거부반응 문제를 극복하게 했습니다. 세포 기반 연산 구조와 양자 정보 처리를 결합한 바이오컴퓨터는 인체 조직과 생체 적합성을 극대화하여, 신경계와 직접 연결되는 뇌-컴퓨터 인터페이스(BCI)를 가능하게 만들었습니다. 이 기술은 단순한 의수·의족 제어를 넘어 감각 피드백과 인지 신호 통합까지 지원하며, 인간과 기계의 경계를 재정의하는 전환점을 마련했습니다.'),
('TXT_KEY_TECH_FW_NEURAL_INTERFACE_HELP','바이오 양자 컴퓨터를 건설하여 도시의 과학을 비약적으로 발전시키고 생명과학과 AI 과학을 융합할 수 있으며, 해상지구 개발과 뉴로SAM발사대, 뉴로순양함, 뉴로구축함 생산을 가능하게 합니다.  도시의 과학과 생산 산출량이 증가합니다.'),
('TXT_KEY_TECH_FW_NEURAL_INTERFACE_QUOTE','[NEWLINE][TAB][TAB]"뇌는 알려진 우주에서 가장 복잡한 생물학적 구조입니다." [NEWLINE][TAB][TAB]- Gerald Edelman[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_AUTONOMOUS_SYSTEMS_TITLE','AI: 완전 자율 시스템'),
('TXT_KEY_TECH_FW_AUTONOMOUS_SYSTEMS_DESC','완전 자율 시스템은 이제 단순한 소프트웨어 자율주행을 넘어, 실제 인간형 휴머노이드 로봇으로 구현되는 단계에 도달했습니다. 고도화된 인공지능(AI), 기계학습, 실시간 센서 융합 기술이 결합되면서 이 로봇들은 스스로 판단하고 복잡한 환경에서 자율적으로 행동할 수 있게 되었습니다. 산업 현장, 우주 탐사, 재난 구조, 군사 작전 등에서 인간과 유사한 기동성과 결정을 수행하며, 일부는 인간의 감각과 근육 패턴을 모방해 고도의 정밀 작업과 전술적 행동까지 가능하게 합니다. 이러한 기술은 미래 사회에서 인간과 기계의 경계를 모호하게 만들며, 완전 자율 휴머노이드 시대의 서막을 열고 있습니다.'),
('TXT_KEY_TECH_FW_AUTONOMOUS_SYSTEMS_HELP','자동화시설에 따른 무인관리기지를 도시에 건설하여 로봇유닛을 강화시킬 수 있습니다. 도시의 방어를 증가시키는 지원중계기를 건설할 수 있습니다. 로봇유닛의 회복을 증가시키는 나노하이브를 생산할 수 있습니다.'),
('TXT_KEY_TECH_FW_AUTONOMOUS_SYSTEMS_QUOTE','[NEWLINE][TAB][TAB]"다른 사람이 당신을 위해 할 수 있는 일을 스스로 하지 마십시오."[NEWLINE][TAB][TAB] - Agatha Christie, The Labors of Hercules[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_SUPERCONDUCTIVITY_TITLE','초전도-플라즈마 에너지 역학'),
('TXT_KEY_TECH_FW_SUPERCONDUCTIVITY_DESC','초전도-플라즈마 에너지 역학은 초전도체의 무저항 전류 전송 능력과 고온 플라즈마 제어 기술을 융합하여 미래형 에너지 시스템을 가능하게 한 학문 분야입니다. 초전도체는 강력한 자기장을 손실 없이 유지할 수 있어, 핵융합로 내부의 초고온 플라즈마를 안정적으로 가두고 제어하는 핵심 요소로 활용됩니다. 이를 통해 안전하고 지속 가능한 핵융합 발전이 현실화되었으며, 동시에 고출력 에너지 저장 장치와 자기부상 운송망, 고속 전자기 추진체계로 응용 범위가 확장되었습니다. 나아가 초전도 기반의 플라즈마 무기체계와 초전도 양자 회로의 결합은 우주항공, 국방, 첨단 산업 전반에 걸쳐 혁신적인 변화를 가져올 것으로 예상됩니다.'),
('TXT_KEY_TECH_FW_SUPERCONDUCTIVITY_HELP','초전도-플라즈마 에너지 역학을 통해 핵융합 발전소와 자기부상 초고속 철도를 건설할 수 있으며, 플라즈마 폭격기와 첨단 전투기를 생산할 수 있습니다. 또한 우주 정거장에 고성능 에너지 모듈을 추가해 장기적 우주 탐사 기반을 마련할 수 있습니다.'),
('TXT_KEY_TECH_FW_SUPERCONDUCTIVITY_QUOTE','[NEWLINE][TAB][TAB]"물리학은 예언이 정확할 뿐만 아니라 일상적인 일을 하는 유일한 직업입니다."[NEWLINE][TAB][TAB]- 닐 디그래스 타이슨[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_ARCOLOGIES_TITLE','인공환경도시'),
('TXT_KEY_TECH_FW_ARCOLOGIES_DESC','인공환경도시는 초전도 에너지, 항공우주 공학, 그리고 인공 생태계 기술이 결합된 미래형 도시 건설 개념입니다. 이 기술을 통해 기후 변화와 지상 환경의 제약을 받지 않는 완전 자급자족형 거대 도시가 등장하였으며, 내부는 폐쇄 생태계·재생 에너지·고도 자동화 시스템으로 운영됩니다. 도시 상공의 항공우주 복합시설은 행정·군사·연구 기능을 통합하며, 준궤도 폭격기와 스텔스 무인전투기의 운용 거점이자 우주 진출의 핵심 인프라로 기능합니다.'),
('TXT_KEY_TECH_FW_ARCOLOGIES_HELP','인공환경도시 타일을 건설하여 에너지·문화·골드 산출량을 증가시킬 수 있습니다. 항공우주 복합시설, 헬리캐리어, 준궤도 폭격기, 스텔스 무인전투기를 생산할 수 있습니다.'),
('TXT_KEY_TECH_FW_ARCOLOGIES_QUOTE','[NEWLINE][TAB][TAB]"건축은 인간 생태계의 물리적 형태이며, 최고의 에너지와 의도적인 흐름을 허용하는 물질의 구성입니다."[NEWLINE][TAB][TAB]- Paolo Soleri[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_GENGINEERING_TITLE','생명 설계'),
('TXT_KEY_TECH_FW_GENGINEERING_DESC','생명 설계는 유전자 편집, 합성생물학, 그리고 인공 게놈 합성 기술의 융합을 통해 새로운 생명체를 설계·창조하는 과학의 최전선을 의미합니다. CRISPR 기반의 정밀 편집 기법과 합성 게놈 조립 기술은 기존 생물 종의 유전적 한계를 뛰어넘어, 고도 적응성·신진대사 효율·환경 복원력 같은 특정 목적을 위해 설계된 맞춤형 생명체의 개발을 가능하게 했습니다. 이로써 인류는 생태계 내 특정 틈새를 채우는 생물 종이나 고유한 기능을 수행하는 인공 생명체를 제작할 수 있게 되었으며, 궁극적으로는 생명 자체를 정보·에너지·환경 제어의 새로운 플랫폼으로 활용할 길을 열었습니다.'),
('TXT_KEY_TECH_FW_GENGINEERING_HELP','이동력이 빠르고 생존력이 좋은 키메라 유닛을 생산할 수 있습니다. 바이오생명체 관련 시설을 건설하여 유닛을 강화시킬 수 있습니다. 네필림 유전자 모형 불가사의를 건설하여 문명의 전투능력을 향상 시킬 수 있습니다.'),
('TXT_KEY_TECH_FW_GENGINEERING_QUOTE','[NEWLINE][TAB][TAB]"모든 것이 변한다는 사실을 깨닫는다면 붙잡고 싶은 것이 아무것도 없을 것입니다. 죽음을 두려워하지 않는다면 이루지 못할 것이 없습니다."[NEWLINE][TAB][TAB] - 노자, 도덕경[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_BIOMODIFICATION_TITLE','생명체 수정'),
('TXT_KEY_TECH_FW_BIOMODIFICATION_DESC','생체변형(Biomodification)은 기존 생명체의 유전·후성유전적 특성을 정밀하게 조작해 신체적·인지적 능력을 향상시키는 첨단 생명공학 기술을 의미합니다. CRISPR 기반 유전자 편집, 대사 경로 재설계, 그리고 후성유전 조절 기술의 융합을 통해 인간을 포함한 다양한 생명체가 고온·방사선·저산소 환경에서 생존하거나, 고강도 근육 섬유·신속한 회복 능력·신경 반사 속도와 같은 특성을 획득할 수 있게 되었습니다. 이러한 변형 기술의 확산은 인간과 비인간 생명체의 경계를 흐리게 만들었으며, 동시에 우주 식민지화·심해 탐사·군사 작전 등 극한 환경에서의 생존 가능성을 획기적으로 확장시켰습니다.'),
('TXT_KEY_TECH_FW_BIOMODIFICATION_HELP','무기폐기물을 재활용하여서 유기물로 전환하는 식량을 비약적으로 증가시킬 수 있는 무기폐기물 재활용소를 건설할 수 있습니다. 바이오 강화센터를 건설하여 인간 유닛 계열의 능력을 비약적으로 향상 시킬 수 있습니다.'),
('TXT_KEY_TECH_FW_BIOMODIFICATION_QUOTE','[NEWLINE][TAB][TAB]"인간으로서 우리의 유일한 가치 척도는 존재의 고통을 줄이는 데 기반을 둔 척도입니다."[NEWLINE][TAB][TAB] - H.P. 러브크래프트[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_CYBERNETICS_TITLE','양자원격동기화'),
('TXT_KEY_TECH_FW_CYBERNETICS_DESC','양자원격동기화는 인간의 신경계와 원격 장치 간의 실시간 감각·운동 신호를 동기화하는 첨단 기술입니다. 양자 얽힘 기반 전송과 초저지연 신경 인터페이스 덕분에 조종자는 수천 km 떨어진 로봇이나 탐사 드론을 마치 자신의 신체처럼 느끼고 조작할 수 있습니다. 이 기술은 군사 정찰·심해 탐사·우주 임무에서 인간의 감각과 판단력을 원격 시스템에 그대로 확장시키며, 인간과 기계의 경계를 더욱 희미하게 만듭니다.'),
('TXT_KEY_TECH_FW_CYBERNETICS_HELP','기갑유닛에 대한 파괴력과 빠른 이동력이 장점인 호버탱크를 생산할 수 있습니다. 도시의 상인 전문가의 골드 산출량이 증가하며, 소도시의 생산 산출이 증가합니다. 모네모시네 시설을 건설하여 빠른 승급을 위한 경험치 증가 승급을 얻을 수 있습니다.'),
('TXT_KEY_TECH_FW_CYBERNETICS_QUOTE','[NEWLINE][TAB][TAB]"미래의 세계는 로봇 노예의 시중을 받기 위해 누울 수 있는 편안한 해먹이 아니라 지능의 한계에 맞서 훨씬 더 힘든 투쟁이 될 것입니다." - 노버트 와이너[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_AI_TITLE','AGI: 강인공지능'),
('TXT_KEY_TECH_FW_AI_DESC','범용 인공지능(AGI)은 특정 업무에 한정된 기존 AI를 넘어, 인간 수준의 종합적 지능과 자기 인식을 갖춘 시스템을 의미합니다. AGI는 단순한 데이터 분석이나 패턴 인식에 머무르지 않고, 새로운 문제에 대한 자율적 학습, 추론, 창의적 해결 능력을 발휘합니다. 이 기술은 언어 이해, 감각 통합, 장기적 계획 수립까지 인간 사고의 전 영역을 기계적으로 재현하며, 인류 역사상 처음으로 인간과 대등하거나 그 이상의 지능을 지닌 존재의 등장을 예고합니다. 그러나 이와 동시에, AGI가 인류의 조력자가 될지, 혹은 잠재적 경쟁자가 될지에 대한 철학적·윤리적 논쟁 역시 불가피하게 제기되고 있습니다.'),
('TXT_KEY_TECH_FW_AI_HELP','스카이넷 세계 불가사의를 건설하여 로봇유닛을 강화할 수 있습니다. 디지털 경찰서를 건설하여 스파이에 대한 저항을 증가시킵니다. 로봇군단을 생산할 수 있습니다. '),
('TXT_KEY_TECH_FW_AI_QUOTE','[NEWLINE][TAB][TAB]"나는 생각한다, 고로 나는 존재한다."[NEWLINE][TAB][TAB]- 르네 데카르트[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_PROMETHEUS_PROGRAM_TITLE', '행성 이주 계획'),
('TXT_KEY_TECH_FW_PROMETHEUS_PROGRAM_DESC', '행성 이주 계획은 인류가 태양계를 넘어 알파 센타우리와 같은 외계 항성계로 이주하여 새로운 거주지를 개척하려는 장기적인 프로젝트입니다. 이 계획은 지구의 한계를 뛰어넘어 우주 문명의 기틀을 마련하고, 자원 고갈과 환경 위기를 넘어서는 해답을 제시합니다. 알파 센타우리 탐사와 이주 준비는 나노물질과 같은 차세대 자원의 활용, 스페이스마린 및 거대 기계병기 건담의 운용, 그리고 프로메테우스 프로그램으로 인류의 기원에 대한 연구에 더 근본적인 해결을 할 수 있을지도 모릅니다.'),
('TXT_KEY_TECH_FW_PROMETHEUS_PROGRAM_HELP', '달 기지를 건설하여 나노물질을 얻으십시오. 아주 강력한 방어유닛인 스페이스마린과 건담을 생산할 수 있습니다. 아폴로 프로그램을 통해 과학 승리에 다가갑니다.'),
('TXT_KEY_TECH_FW_PROMETHEUS_PROGRAM_QUOTE', '[NEWLINE][NEWLINE]"화성은 지구에서 충분히 멀리 떨어져 있어서 (전쟁 시) 달 기지보다 생존 가능성이 높기 때문에 화성에서 자립형 기지를 확보하는 것이 중요합니다. 화성에서 자립형 도시를 이루지 못한다면 내 생에 그것을 실패로 여길 것이다." [NEWLINE][NEWLINE]-엘론 머스크[NEWLINE][NEWLINE]'),

('TXT_KEY_TECH_FW_ADAMANTIUM_TITLE','궤도 거주'),
('TXT_KEY_TECH_FW_ADAMANTIUM_DESC','궤도 건축공학은 라그랑주 거점과 궤도 링, 아그리돔을 표준화해 지상 의존 없이 거주·생산·연구를 수행하는 초대형 복합 단지를 구현합니다. 무대류·무오염의 미세중력 환경은 초고순도 소재, 단결정 합금, 바이오 배양 등 지상보다 우월한 공정을 가능하게 하며, 태양발전 위성·궤도 정제소·수경재배지구와 연결된 인공환경도시에서 자급자족형 생태 순환을 이룹니다. 소행성 포획 및 벨트 물류망과 연동해 원료를 안정적으로 공급받으며, 궤도 거점은 군사·행정·상업의 허브로 기능합니다.'),
('TXT_KEY_TECH_FW_ADAMANTIUM_HELP','이 기술을 연구하면 궤도에 거주에 필요한 궤도 식량재배시설을 건축하여 [ICON_RESEARCH]과학·[ICON_FOOD]식량·[ICON_PRODUCTION]생산 산출을 향상시킬 수 있습니다. 또한 세계 불가사의인  **네서스 진공 제련소**를 건설할 수 있습니다. 고순도 정제와 궤도 식량 재배를 통해 [ICON_RES_NANOMAT]나노물질을 얻을 수 있습니다. 도시를 공격하는 적에게 신의 지팡이로 보복을 할 수 있습니다.)'),
('TXT_KEY_TECH_FW_ADAMANTIUM_QUOTE','[NEWLINE][TAB][TAB]"공룡은 우주 계획이 없었기에 멸종했다. 그리고 우리가 우주 계획이 없어서 멸종한다면, 그건 당연한 일이다."[NEWLINE][TAB][TAB]- 래리 니븐[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_TERRAFORMING_TITLE','유전자 가속'),
('TXT_KEY_TECH_FW_TERRAFORMING_QUOTE','[NEWLINE][TAB][TAB]"인간은 이 생명의 그물을 짜는 것이 아닙니다. 그는 단지 그것의 한 가닥일 뿐입니다. 그가 거미줄에 무엇을 하든지 그는 자신에게 하는 것입니다."[NEWLINE][TAB][TAB] - 시애틀 추장[NEWLINE][TAB]'),
('TXT_KEY_TECH_FW_TERRAFORMING_DESC','유전자 가속은 진화·적응 과정을 분자 수준에서 빠르게 유도하는 생명과학의 정점 기술입니다. 정밀 유전자 편집과 발현 조절, 인공 선택을 결합해 종의 적응을 가속하거나 신규 생물형을 설계하는 데 쓰입니다. 전장 운용 측면에서는 ‘유전자 강화’로 기존 생명체의 체력·반응·인지 등을 향상시키고, ‘유전자 창조’로 특정 임무에 특화된 신생 유닛을 제작할 수 있습니다.'),
('TXT_KEY_TECH_FW_TERRAFORMING_HELP','이동력이 빠르고 상대방을 괴롭히는 유전자변형충과 궁극의 정찰 유닛인 바이오드론을 생산할 수 있습니다.'),

('TXT_KEY_TECH_FW_HUMAN_AUGMENTATION_TITLE','인류 증강'),
('TXT_KEY_TECH_FW_HUMAN_AUGMENTATION_QUOTE','[NEWLINE][TAB][TAB]"키가 야마시타 업그레이드 중 하나가 아닌지 항상 궁금했습니다. 부신피질 자극 호르몬이 너무 많고 모노아민 산화 효소가 너무 적습니까?"[NEWLINE][TAB][TAB] - Adam Warren, A Plague of Angels [NEWLINE][TAB ]'),
('TXT_KEY_TECH_FW_HUMAN_AUGMENTATION_DESC','유전적 생체 변형과 사이버네틱스의 발전으로 인간 증강의 스펙트럼이 크게 확장되었습니다. 인체의 거의 모든 구성 요소는 배양 조직이나 사이버네틱 대체품으로 보완될 수 있습니다. 동시에 인간 게놈 자체의 한계를 인지하고, 보다 안정된 ‘개선형 게놈’ 설계를 모색하는 실험도 진행되고 있습니다.'),
('TXT_KEY_TECH_FW_HUMAN_AUGMENTATION_HELP','인공출산 시설을 건설하여 더 많은 인구를 부양하세요.'),

('TXT_KEY_TECH_FW_DIGITAL_SOCIETY_TITLE','디지털 사회'),
('TXT_KEY_TECH_FW_DIGITAL_SOCIETY_QUOTE','[NEWLINE][TAB][TAB]"당신이 있는 그대로 있으면 결국 사람들이 당신에게 올 것입니다."[NEWLINE][TAB][TAB] - Robert Doisneau[NEWLINE][TAB]'),
('TXT_KEY_TECH_FW_DIGITAL_SOCIETY_DESC','인공지능의 확산과 사이버네틱스의 발달로 마음-기계 인터페이스와 텔레프레즌스가 일상화되면서 정체성과 존재 방식은 물리적 신체를 넘어 디지털 공간으로 확장되고 있습니다. 사람들은 네트워크를 통해 원격 현존감을 구현하거나 인공 환경을 체감할 수 있으며, 전자적 상호작용이 사회 구조를 재편하는 단계에 이르렀습니다.'),
('TXT_KEY_TECH_FW_DIGITAL_SOCIETY_HELP','[COLOR_POSITIVE_TEXT]두뇌 업로드 시설[ENDCOLOR]을 건설하여 [ICON_PRODUCTION]생산, [ICON_RESEARCH]과학, [ICON_GOLD]골드 및 [ICON_CULTURE]문화를 증가시킬 수 있지만 인구는 감소합니다.'),

('TXT_KEY_TECH_FW_SMART_MATERIALS_TITLE','스마트 물질'),
('TXT_KEY_TECH_FW_SMART_MATERIALS_QUOTE','[NEWLINE][TAB][TAB]"모든 것은 변하며, 변하지 않는 것은 아무것도 없습니다."[NEWLINE][TAB][TAB] - 싯다르타 고타마[NEWLINE][TAB]'),
('TXT_KEY_TECH_FW_SMART_MATERIALS_DESC','스마트 물질은 환경 자극에 따라 물성·형상·기능을 스스로 조절하는 지능형 나노구조 재료입니다. 대규모로 조합될 때 건축·방어·수송 등 다양한 시스템을 상황에 맞게 재구성할 수 있으며, 개인 방호부터 거주 구조물까지 범용 플랫폼을 제공합니다.'),
('TXT_KEY_TECH_FW_SMART_MATERIALS_HELP','강력한 공성 유닛인 엔젤과 재앙과 같은 반물질 핵융합 폭탄을 제조할 수 있습니다.'),

('TXT_KEY_TECH_FW_ENERGY_THEORY_TITLE','신 에너지 이론'),
('TXT_KEY_TECH_FW_ENERGY_THEORY_QUOTE','[NEWLINE][ TAB ][ TAB ]"우주의 비밀을 찾으려면 에너지, 주파수 및 진동의 관점에서 생각하세요."[NEWLINE][ TAB ][ TAB ] - Nikola Tesla [NEWLINE][ TAB ]'),
('TXT_KEY_TECH_FW_ENERGY_THEORY_DESC','우주의 작동 원리에 대한 탐구는 극소·극한 에너지 영역의 물리학으로 확장되었습니다. 그 성과는 추진체·전력·재료 공학의 비약으로 이어져, 강력한 부스터 엔진과 차세대 우주 정거장 및 전초기지 개발을 촉진하고 행성 간 탐사의 범위를 넓힙니다.'),
('TXT_KEY_TECH_FW_ENERGY_THEORY_HELP','과학 승리에 필요한 우주선 부품을 생산할 수 있습니다. 우주선전투기와 우주궤도 폭격기를 생산할 수 있습니다.'),

('TXT_KEY_TECH_FW_HYPERSTRUCTURES_TITLE','초월적 건축물'),
('TXT_KEY_TECH_FW_HYPERSTRUCTURES_DESC','도시 개발을 향한 생태학의 개념을 확장하면 재료 공학 및 기타 기술의 발전으로 언젠가는 공학의 엄청난 위업을 달성할 수 있게 될 것입니다. 주변 환경에 미치는 영향을 최소화합니다. 그러한 구조는 엄청난 성취가 될 것이며 의심할 여지없이 인간 사회에 똑같이 큰 영향을 미칠 것입니다.'),
('TXT_KEY_TECH_FW_HYPERSTRUCTURES_HELP','중앙 통제센터를 건설하여 인공환경도시를 강화할 수 있습니다. 세계불가사의를 건설할 수 있습니다.'),
('TXT_KEY_TECH_FW_HYPERSTRUCTURES_QUOTE','[NEWLINE][TAB][TAB]"Men have become the tools of their tools."[NEWLINE][TAB][TAB]- Henry David Thoreau[NEWLINE][TAB]'),

('TXT_KEY_TECH_FW_HOMO_SUPERIOR_TITLE','호모 슈페리어'),
('TXT_KEY_TECH_FW_HOMO_SUPERIOR_QUOTE','[NEWLINE][TAB][TAB]"나는 너에게 초인을 가르친다. 인간은 능가할 존재다."[NEWLINE][TAB][TAB] - 프리드리히 니체[NEWLINE][TAB]'),
('TXT_KEY_TECH_FW_HOMO_SUPERIOR_DESC','생체 개조와 사이버네틱스가 완전히 성숙함에 따라 거의 무한한 방식으로 인체를 보강하는 것이 가능해졌습니다. 인간은 더 강하고 똑똑하며 더 오래 살 수 있고 상대적으로 질병이나 부상에서 자유로울 수 있습니다. 그러한 인간 증강에 대한 윤리적, 심지어 논리적인 우려가 있지만, 인류는 한계를 초월할 태세를 갖추게 될 것입니다.'),
('TXT_KEY_TECH_FW_HOMO_SUPERIOR_HELP','문화 승리에 필요한  세계 시민의정서 프로젝트를 건설할 수 있습니다.'),

('TXT_KEY_TECH_FW_COMPUTRONIUM_TITLE','컴퓨트로늄'),
('TXT_KEY_TECH_FW_COMPUTRONIUM_QUOTE','[NEWLINE][ TAB ][ TAB ]"인간은 기술 개발이 허용하는 만큼만 훌륭합니다."[NEWLINE][ TAB ][ TAB ] - George Orwell [NEWLINE][ TAB ]'),
('TXT_KEY_TECH_FW_COMPUTRONIUM_DESC','컴퓨트로늄은 MIT의 Norman Margolus와 Tommaso Toffoli가 제안한 개념으로, 물질을 계산에 최적화된 ‘프로그래머블 기질’로 활용해 거의 모든 물리 시스템을 효율적으로 모사·연산할 수 있도록 설계한 이론적 물질을 뜻합니다.'),
('TXT_KEY_TECH_FW_COMPUTRONIUM_HELP','과학 승리에 필요한 부품을 생산할 수 있습니다. 외교승리를 위한 외교관을 얻을 수 있습니다. '),

('TXT_KEY_TECH_FW_SPACE_COLONIZATION_TITLE','우주 식민지화'),
('TXT_KEY_TECH_FW_SPACE_COLONIZATION_QUOTE','[NEWLINE][ TAB ][ TAB] "살아남는 것은 가장 강한 종도 아니고 가장 지능적인 종이 살아남는 것도 아닙니다. 변화에 가장 잘 적응하는 종입니다." [NEWLINE][ TAB ][ TAB ] - 찰스 다윈[NEWLINE][ TAB ]'),
('TXT_KEY_TECH_FW_SPACE_COLONIZATION_DESC','인류는 탐험과 확장을 향한 근원적 동인을 지녀 왔습니다. 우주는 그 궁극의 개척지이며, 항성 간 여행을 가능케 하는 기술의 달성은 최초의 도구 발명에 견줄 문명사적 전환점이 될 것입니다. 본 기술은 장기 거주, 자원 순환, 항행·조선 인프라를 통합해 우주 정착의 실질적 기반을 구축합니다.'),
('TXT_KEY_TECH_FW_SPACE_COLONIZATION_HELP','우주선 부품을 만들고, 과학승리를 쟁취하세요.');


--===========================
-- Resources
--===========================
INSERT INTO Language_ko_KR (Tag, Text) VALUES
('TXT_KEY_RESOURCE_NANOMAT', '나노물질'),
('TXT_KEY_RESOURCE_NANOMAT_HELP', '강력한 미래시대 유닛 생산 및 건물 건설에 사용됩니다. 지도상 매우 극조건 (사막, 설원, 툰드라, 해양)에 생성이 되지만, 매우 적습니다. 유정과 해양구조물로 자원을 얻을 수 있습니다. 변환기를 통해 생산이 가능합니다.'),
('TXT_KEY_RESOURCE_NANOMAT_TEXT', '나노물질은 최소 한 축에서 1–1000 nm 규모의 구조로, 양자 효과가 물성에 직접 작용합니다. 스핀트로닉스, 밴드갭·스핀 상태를 정밀 제어하는 희토류/자성 나노합금, 고품질 나노결정/이종접합은 차세대 계산·에너지·센서의 기반입니다. 자연계 존재량은 미량이므로 심해 채굴/자기 유정/플라즈마 합성 같은 고도 인프라가 필요합니다.[NEWLINE]나노 스케일에서는 표면·계면·결함 상태 밀도가 지배적이며, 미세한 화학 조성/결정상 변화가 밴드구조와 스핀 텍스처를 근본적으로 바꿉니다. 이로부터 스핀 기반 논리(스핀트로닉스), 정밀 촉매/전극, 광-전-기 다중 응답 메타물질이 파생됩니다. 일부 구조는 고온/상온 초전도 후보로 연구 중이며, 실제 구현을 위해서는 불순물·결함 제어와 정밀 나노제조가 관건입니다.'),
('TXT_KEY_RESOURCE_ADN_FUNGUS', '제노포자'),
('TXT_KEY_RESOURCE_ADN_FUNGUS_HELP', '강력한 미래 시대 유전자유닛, 바이오강화 유닛에 쓰이는 자원입니다. 특정 건물이 있는 도시에서 타일이 생성이 되거나 초원, 평원에서 발견할 수 있습니다.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]전략 자원 독점 보너스 (25%):[ENDCOLOR] 유닛 추가 경험치 +2.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]글로벌 독점 보너스 (50%):[ENDCOLOR]전략 자원 타일의 [ICON_RESEARCH]과학 +1, [ICON_CULTURE]문화 +1.'),
('TXT_KEY_RESOURCE_ADN_FUNGUS_TEXT', '**제노포자(Xenofungus)**는 지구 토양·식생에서 드물게 발견되는 포자성 복합체입니다. 극한 환경(건조, 금속 이온, 저산소)에 반응해 **후성유전 조절(메틸화/전사 조절)**과 모바일 유전요소 활성을 유도하여, 생물의 비치명적·적응적 변이 확률을 높입니다. 근대 유전공학의 축적 덕분에 이 물질의 작용이 규명되었고, 오늘날 표현형 가속·재생·특수 생체공학에 응용됩니다. [NEWLINE] 제노포자는 외부 스트레스(금속 이온, pH, 산소 농도 등)에 반응해 **세포외 소포(엑소좀)**와 이온 결합 펩타이드를 분비하고, DNA 절단 없이 유전자 발현 프로그램을 재설정합니다. 이 과정은 후성유전 재구성과 트랜스포존 재배치를 통해 적응적 표현형 다양성을 증가시키며, 장기적으로는 종수준 진화 압력을 강화합니다.[NEWLINE]제노포자는 지구에서 발생한 고유의 스트레스 매개체로 보이며, 지질시대의 극심한 환경 변화기에 진화의 불씨로 작동했을 가능성이 제기됩니다. 지구의 급작스런 기후변화로 인해 최근에 증가하는 경향이 있습니다. 높은 농도·장기 노출은 생태계 교란을 유발할 수 있어 엄격한 관리가 필요합니다.');

--===========================
-- Improvements 
--===========================
----------------------------------------------
-- Agribusiness - Stockyard
----------------------------------------------
UPDATE Language_ko_KR
SET Text = '농장, 목장, 수경재배지구, 그리고 친환경 마을의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR], [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. 매턴 [ICON_FOOD]식량의  [COLOR_POSITIVE_TEXT]10%[ENDCOLOR]를 [ICON_GOLD]골드로 전환합니다.[NEWLINE][NEWLINE][ICON_RES_HORSE]말 [COLOR_NEGATIVE_TEXT]2[ENDCOLOR] 필요합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_STOCKYARD_HELP';


INSERT OR REPLACE INTO LocalizedText
	(Language, Tag, Text)
VALUES
	('ko_KR', 'TXT_KEY_UNDERSEA_TUNNEL', '해저터널'),
	('ko_KR', 'TXT_KEY_UNDERSEA_TUNNEL_HELP', '지상 유닛이 이 해안 타일을 횡단할 수 있습니다. 2개 이상의 육지 타일이 인접한 해안 타일에만 건설할 수 있습니다. 2개 또는 3개의 인접한 대지 타일이 있는 타일의 경우 대지 타일이 인접하지 않을 수 있습니다. 노동자에 의해 건설됩니다.[NEWLINE][NEWLINE] 터널을 이용하여 육지로 도시를 연결할 수 있지만, [COLOR_NEGATIVE_TEXT]육상교역로는 연결이 되지 않습니다.[ENDCOLOR]'),
	('ko_KR', 'TXT_KEY_UNDERSEA_TUNNEL_TEXT', '지상유닛이 해저터널을 이용하여 연안타일을 가로질러 빠르고 안전하게 다른 지역으로 이동이 가능합니다.'),
	('ko_KR', 'TXT_KEY_BUILD_UNDERSEA_TUNNEL', '[LINK=IMPROVEMENT_UNDERSEA_TUNNEL]해저터널[/LINK] 건설'),
	('ko_KR', 'TXT_KEY_BUILD_UNDERSEA_TUNNEL_REC', '지상 유닛이 약간의 전투 패널티로 이 타일을 횡단할 수 있게 합니다.'),
	('ko_KR', 'TXT_KEY_BUILD_UNDERSEA_TUNNEL_HELP', '지상 유닛이 이 해안 타일을 횡단할 수 있습니다. 2개 이상의 육지 타일이 인접한 해안 타일에만 건설할 수 있습니다. 2개 또는 3개의 인접한 대지 타일이 있는 타일의 경우 대지 타일이 인접하지 않을 수 있습니다. 노동자에 의해 건설됩니다.[NEWLINE][NEWLINE] 터널을 이용하여 육지로 도시를 연결할 수 있지만, [COLOR_NEGATIVE_TEXT]육상교역로는 연결이 되지 않습니다.[ENDCOLOR]');

INSERT INTO Language_ko_KR (Tag, Text) VALUES
-- 제노포자 배양지
('TXT_KEY_IMPROVEMENT_FW_FUNGAL_GROWTH','제노포자 배양지'),
('TXT_KEY_IMPROVEMENT_FW_FUNGAL_GROWTH_TEXT','"제노포자(Genospore)는 지구 토양·식생에서 드물게 발견되는 포자성 복합체이자, 폴루스 돌연변이 바이러스와 연관된 변이원의 부산물입니다. 이 바이러스의 방출로 가장 눈에 띄는 효과는 식물이 곰팡이처럼 변이하는 현상입니다. 이러한 식물들은 신경망과 유사한 구조를 발달시켜 환경으로부터 감각 정보를 해석하며, 자신들에게 위협이 된다고 판단한 대상에게는 독소와 생화학적 공격으로 반응합니다. 이 때문에 제노포자가 넘쳐나는 지역은 준비되지 않은 자들에게 매우 위험한 곳으로 변합니다. 과학적 분석에 따르면 제노포자는 극한 환경(금속 이온, 저산소, 산성 조건)에 반응해 **후성유전 조절(메틸화/전사 조절)**과 **모바일 유전요소 활성**을 촉진하여 생물의 적응적 변이를 가속합니다. 또한, 세포외 소포와 이온 결합 펩타이드의 분비를 통해 DNA 절단 없이 유전자 발현 프로그램을 재설정함으로써, 표현형 다양성과 빠른 적응을 유도합니다. 이러한 과정은 돌연변이와 재생, 생체공학적 강화 연구의 기반이 되며, 장기적으로는 종 단위의 진화 압력을 높이는 요소로 작용할 수 있습니다.[NEWLINE]일부 학자들은 제노포자가 지질시대의 극심한 환경 변화기에 진화의 불씨 역할을 했을 것이라고 추정합니다. 그러나 높은 농도와 장기 노출은 생태계 교란과 적대적 변이 생물의 출현을 유발할 수 있어, 오늘날에는 **철저한 관리와 연구**가 필수적인 전략 자원으로 간주됩니다."), 그러나, 그 곰팡이 자체는 또한 인간이나 돌연변이의 영향을 받은 동물들과 공생하고 있는 것으로 보이며, 그들에게 유용한 영양분과 의약품과 같은 다른 귀중한 물질을 제공합니다.'),
('TXT_KEY_IMPROVEMENT_FW_FUNGAL_GROWTH_HELP','해당 타일의 [ICON_FOOD]식량, [ICON_RESEARCH]과학, [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. 인접한 적 유닛에 매턴 [COLOR_NEGATIVE_TEXT]10의 피해[ENDCOLOR]를 줍니다.'),
('TXT_KEY_BUILD_FW_FUNGAL_GROWTH','제노포자 배양지 건설'),
('TXT_KEY_BUILD_FW_FUNGAL_GROWTH_HELP','이 타일에 주둔하는 유닛의 방어력이 [COLOR_POSITIVE_TEXT]50%[ENDCOLOR] 증가합니다. 인접한 적 유닛에게 [COLOR_NEGATIVE_TEXT]10의 피해[ENDCOLOR]를 줍니다. [COLOR_NEGATIVE_TEXT]한번 건설하면 제거할 수 없습니다[ENDCOLOR].'),
('TXT_KEY_BUILD_FW_FUNGAL_GROWTH_REC','숲, 정글 또는 습지를 온전하게 유지하면서 2 [ICON_FOOD]식량, 2 [ICON_RESEARCH]과학 및 2 [ICON_CULTURE]문화를 건설한 타일에 제공합니다. 또한 턴이 종료되거나 인접한 모든 유닛에게 10 HP 피해를 입힙니다.'),
-- 자연보호구역
('TXT_KEY_IMPROVEMENT_FW_PRESERVE','자연보호구역'),
('TXT_KEY_IMPROVEMENT_FW_PRESERVE_TEXT','과학의 진보는 인류에게 환경을 조작할 수 있는 도구의 수를 증가시켰지만, 이것은 또한 자연 그대로의 환경이 점점 더 부족해지고 있다는 것을 의미하기도 합니다. 자연 생태계를 보존할 것인지, 생태 관광 산업을 장려할 것인지, 점점 더 많은 자연 보호 구역이 확보되고 있습니다. 연속해서 타일을 건설할 수 있습니다.  [NEWLINE][NEWLINE]해당 타일에 인접한 야영지, 브라질 소방목 벌목장, 간척지, 자연보호구역에 [ICON_CULTURE]문화가 추가로 +1 증가합니다.'),
('TXT_KEY_IMPROVEMENT_FW_PRESERVE_HELP','해당 타일의 [ICON_CULTURE]문화 [COLOR_POSITIVE_TEXT]3[ENDCOLOR]과 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. 연속해서 타일을 건설할 수 있습니다. [NEWLINE][NEWLINE]인접한 야영지, 브라질 소방목 벌목장, 간척지, 자연보호구역에 [ICON_CULTURE]문화가 추가로 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.'),
('TXT_KEY_BUILD_FW_PRESERVE','자연보호구역 건설'),
('TXT_KEY_BUILD_FW_PRESERVE_HELP','인접한 자연보호구역, 야영지, 제재소, 브라질소방목 벌목장, 간척지에 [ICON_CULTURE]문화가 추가로 +1 증가합니다.'),
('TXT_KEY_BUILD_FW_PRESERVE_REC','타일의 문화 및 과학 생산량이 증가합니다. 다른 자연보호구역, 야영지, 제재소, 브라질소방목 벌막장, 간척지에 인접한 경우 [ICON_CULTURE]의 보너스'),
-- 통신기지국
('TXT_KEY_IMPROVEMENT_FW_COMM_ARRAY','통신기지국'),
('TXT_KEY_IMPROVEMENT_FW_COMM_ARRAY_TEXT','통신기지국은 지역간의 정보 교환을 용이하게 하기 위한 전용의 설비입니다. 처음에는 교역소에 비해 골드가 약간 증가하지만, 조사된 기술에 따라서는 추가적인 문화나 과학도 제공될 수 있습니다. 단, 통신기지국은 서로 인접하게 구축할 수 없기 때문에 구축할 수 있는 수가 제한됩니다.[NEWLINE][NEWLINE]해당 타일의 [ICON_RESEARCH]과학, [ICON_GOLD]골드, [ICON_CULTURE]문화가 +2 증가합니다. 언덕에 건설하면 [ICON_RESEARCH]과학과 [ICON_GOLD]골드가 +1 추가로 증가합니다. [COLOR_NEGATIVE_TEXT]서로 인접해서 건설할 수 없습니다.[ENDCOLOR][NEWLINE][NEWLINE]해당 타일에 인접한 마을, 성지, 랜드마크, 고유타일시설에 [ICON_CULTURE]문화가 추가로 +1 증가합니다.'),
('TXT_KEY_IMPROVEMENT_FW_COMM_ARRAY_HELP','해당 타일의 [ICON_RESEARCH]과학, [ICON_GOLD]골드, [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. 언덕에 건설하면 [ICON_RESEARCH]과학과 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 추가로 증가합니다. [NEWLINE][NEWLINE]해당 타일에 인접한 마을, 성지, 랜드마크, 고유타일시설에 [ICON_CULTURE]문화가 추가로 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]서로 인접해서 건설할 수 없습니다.[ENDCOLOR]'),
('TXT_KEY_BUILD_FW_COMM_ARRAY','통신기지국 건설'),
('TXT_KEY_BUILD_FW_COMM_ARRAY_HELP','언덕에 건설하면 [ICON_RESEARCH]과학과 [ICON_GOLD]골드가 +1 증가합니다. 인접한 마을, 성지, 랜드마크, 문명의 특수타일의 [ICON_CULTURE]문화가 +1증가합니다.'),
('TXT_KEY_BUILD_FW_COMM_ARRAY_REC','타일의 과학, 문화 및 골드 산출량이 증가합니다.'),
-- 산업단지
('TXT_KEY_IMPROVEMENT_FW_INDUSTRIAL_COMPLEX','산업단지'),
('TXT_KEY_IMPROVEMENT_FW_INDUSTRIAL_COMPLEX_TEXT','산업단지는 기업이 사회 또는 정치 시스템이나 제도에 얽혀 이러한 시스템으로부터 수익경제를 창출하거나 지지하는 사회경제적 개념입니다. 이러한 복합단지는 사회와 개인의 최선의 이익에 관계 없이, 그리고 종종 희생을 감수하면서 자신의 재정적 이익을 추구한다고 합니다. 공단 내 기업은 사회적 또는 정치적 목표를 진전시키기 위해 만들어졌을 수 있지만, 대부분 목표에 도달하지 못할 때 이익을 얻습니다. 공단은 사회적으로 해롭거나 비효율적인 시스템을 유지함으로써 재정적으로 이익을 얻을 수 있습니다. 생산을 촉진하고 규모의 경제를 장려하기 위해 업계가 함께 그룹화됨에 따라 공장, 조립 공장, 주조 공장 및 기타 산업용 건물의 규모가 점점 더 크고 복잡한 컬렉션이 나타나기 시작합니다. 산업단지는 공장만큼 효과적이지는 않지만 생산에는 큰 도움이 될 수 있습니다. 이 개념은 드와이트 아이젠하워 대통령이 1961년 1월 17일 고별사에서 대중화했다. 아이젠하워는 군사 산업 단지라고 불리는 "민주 정부에 대한 위협"을 묘사했습니다. 산업단지는 미국 무기산업의 수익성과 군복무, 무기산업, 그리고 미국에 물품을 제공하는 다른 사업의 다양한 분야에 고용된 시민들의 수 때문에 미국 사회의 경제적, 정치적, 정신적인 영역에 "부당한 영향"을 받는 군 체제를 포함했습니다. "복합"은 군사적 목표에 도움이 되는 다자경제의 창조와 더불어 군의 이론적 목표(평화)와 반대되는 다자주의(지속적 이익)의 목표에서 발생하는 역설에서 발생합니다.'),
('TXT_KEY_IMPROVEMENT_FW_INDUSTRIAL_COMPLEX_HELP','해당 타일의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]5[ENDCOLOR], [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]인접한 모든 제조소의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]3[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]서로 인접해서 건설할 수 없습니다.[ENDCOLOR].'),
('TXT_KEY_BUILD_FW_INDUSTRIAL_COMPLEX','산업단지 건설'),
('TXT_KEY_BUILD_FW_INDUSTRIAL_COMPLEX_HELP','인접한 제조소의 [ICON_PRODUCTION]생산이 증가합니다. 이 타일에 주둔하는 유닛의 방어력이 [COLOR_POSITIVE_TEXT]20%[ENDCOLOR] 증가합니다.'),
('TXT_KEY_BUILD_FW_INDUSTRIAL_COMPLEX_REC','타일의 생산량을 증가시키고 인접한 제조소는 3 생산력을 얻습니다.'),
-- 연구단지
('TXT_KEY_IMPROVEMENT_FW_HERC','연구단지'),
('TXT_KEY_IMPROVEMENT_FW_HERC_TEXT','과학이 발전함에 따라 우주의 비밀을 더 깊이 탐구하는 데 필요한 도구들도 발전했습니다. 아직 많은 연구가 학술적이고 이론적인 수준에서 수행되고 있지만, 양자역학, 천체물리학 및 입자물리학의 신비를 탐구하는 데 필요한 도구는 전문화된 첨단 연구소와 연구 센터를 필요로 합니다.[NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]서로 인접해서 건설할 수 없습니다.[ENDCOLOR].'),
('TXT_KEY_IMPROVEMENT_FW_HERC_HELP','해당 타일의 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]5[ENDCOLOR], [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]인접한 모든 아카데미의 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]3[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]서로 인접해서 건설할 수 없습니다.[ENDCOLOR].'),
('TXT_KEY_BUILD_FW_HERC','연구단지 건설'),
('TXT_KEY_BUILD_FW_HERC_HELP','인접한 아카데미의 [ICON_RESEARCH]과학이 증가합니다. 이 타일에 주둔하는 유닛의 방어력이 [COLOR_POSITIVE_TEXT]20%[ENDCOLOR] 증가합니다.'),
('TXT_KEY_BUILD_FW_HERC_REC','타일의 과학 산출량을 증가시키고 인접한 아카데미는 3 과학을 얻습니다.'),
-- 친환경마을
('TXT_KEY_IMPROVEMENT_FW_BIOWELL','친환경마을'),
('TXT_KEY_IMPROVEMENT_FW_BIOWELL_TEXT','도시화가 환경에 미치는 영향에 대한 인식이 높아짐에 따라, 보다 환경 친화적이고 지속 가능한 커뮤니티를 구축하기 위한 수많은 노력이 있었습니다. 이러한 공동체는 특히 그 이후에 나타나기 시작한 훨씬 더 밀집된 호와 비교하면 항상 다소 작은 규모였지만, 자급자족했고, 상대적으로 오염되지 않은 황야의 지역에 위치한 그들의 위치는 생태관광가들에게 특정한 매력을 가지고 있다는 것을 의미했습니다.[NEWLINE][NEWLINE]해당 타일의 [ICON_FOOD]식량과 [ICON_CULTURE]문화, [ICON_GOLD]골드가 +2 증가합니다. [NEWLINE][NEWLINE]인접한 모든 농장의 [ICON_CULTURE]문화가 +1 증가합니다.[NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]서로 인접해서 건설할 수 없습니다.[ENDCOLOR].'),
('TXT_KEY_IMPROVEMENT_FW_BIOWELL_HELP','해당 타일의 [ICON_FOOD]식량과 [ICON_CULTURE]문화, [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]인접한 모든 농장의 [ICON_FOOD]식량이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]서로 인접해서 건설할 수 없습니다.[ENDCOLOR].'),
('TXT_KEY_BUILD_FW_BIOWELL','친환경마을 건설'),
('TXT_KEY_BUILD_FW_BIOWELL_HELP','인접한 모든 농장의 [ICON_CULTURE]문화가 +1 증가합니다.'),
('TXT_KEY_BUILD_FW_BIOWELL_REC','타일의 식량, 문화, 골드 산출량이 증가합니다.'),
-- 발전기
('TXT_KEY_IMPROVEMENT_FW_GENERATOR','발전기'),
('TXT_KEY_IMPROVEMENT_FW_GENERATOR_TEXT','점점 더 많은 산업이 자동화됨에 따라, 그들은 이용 가능한 발전소와 발전기에 대한 전력 수요를 증가했습니다. 가장 고도로 산업화된 자동화된 지역은 산업에 전력을 공급하는 데 도움이 되는 수많은 보조 발전기를 개발하기 시작했습니다.[NEWLINE][NEWLINE]인접한 소도시, 산업단지, 연구단지, 생명공학센터, 인공환경도시 시설의 [ICON_GOLD]골드가 +1 증가합니다.'),
('TXT_KEY_IMPROVEMENT_FW_GENERATOR_HELP','해당 타일의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]5[ENDCOLOR], [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE] 인접한 소도시, 인공환경도시, 생명공학센터, 연구단지, 산업단지의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.'),
('TXT_KEY_BUILD_FW_GENERATOR','발전기 건설'),
('TXT_KEY_BUILD_FW_GENERATOR_HELP','인접한 모든 소도시, 연구단지, 산업단지, 생명공학센터, 인공환경도시의 [ICON_GOLD]골드가 +1 증가합니다.'),
('TXT_KEY_BUILD_FW_GENERATOR_REC','인접한 모든 소도시, 연구단지, 산업단지, 생명공학센터, 인공환경도시의[ICON_GOLD]골드가 +1 증가합니다.'),
-- 해상발전기
('TXT_KEY_IMPROVEMENT_FW_GENERATOR_WATER','해상발전기'),
('TXT_KEY_IMPROVEMENT_FW_GENERATOR_WATER_TEXT','점점 더 많은 산업이 자동화됨에 따라, 그들은 이용 가능한 발전소와 발전기에 대한 전력 수요를 증가했습니다. 가장 고도로 산업화된 자동화된 지역은 산업에 전력을 공급하는 데 도움이 되는 수많은 보조 발전기를 개발하기 시작했습니다.[NEWLINE][NEWLINE]인접한 소도시, 산업단지, 연구단지, 생명공학센터, 인공환경도시 시설의 [ICON_GOLD]골드가 +1 증가합니다.'),
('TXT_KEY_IMPROVEMENT_FW_GENERATOR_WATER_HELP','해당 타일의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]5[ENDCOLOR], [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE] 인접한 소도시, 인공환경도시, 생명공학센터, 연구단지, 산업단지의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.'),
('TXT_KEY_BUILD_FW_GENERATOR_WATER','발전기 건설'),
('TXT_KEY_BUILD_FW_GENERATOR_WATER_HELP','인접한 모든 소도시, 연구단지, 산업단지, 생명공학센터, 인공환경도시의 [ICON_GOLD]골드가 +1 증가합니다.'),
('TXT_KEY_BUILD_FW_GENERATOR_WATER_REC','인접한 모든 소도시, 연구단지, 산업단지, 생명공학센터, 인공환경도시의[ICON_GOLD]골드가 +1 증가합니다.'),
-- 수경재배지구
('TXT_KEY_IMPROVEMENT_FW_HYDROPONICS_DOME','수경재배지구'),
('TXT_KEY_IMPROVEMENT_FW_HYDROPONICS_DOME_TEXT','인위적인 식량 재배 방법은 시간이 지남에 따라 점점 더 정교해지고 있습니다. 수경재배와 수기경재배와 같은 새로운 기술의 출현은 농작물이 전적으로 인공적인 환경에서 재배될 수 있다는 것을 의미하며, 보통 시민들을 먹이기 위해 애쓰는 지역사회는 이제 더 비옥한 지역에서 식량을 수입할 필요 없이 근처에서 농작물을 재배할 수 있습니다.[NEWLINE][NEWLINE]해당 타일의 [ICON_FOOD]식량이 +3, [ICON_RESEARCH]과학이 +2, [ICON_PRODUCTION]생산이 +1 증가합니다. 인접한 모든 농장의 [ICON_RESEARCH]과학이 +1 증가합니다.[NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]서로 인접해서 건설할 수 없습니다.[ENDCOLOR].'),
('TXT_KEY_IMPROVEMENT_FW_HYDROPONICS_DOME_HELP','해당 타일의 [ICON_FOOD]식량이 [COLOR_POSITIVE_TEXT]3[ENDCOLOR], [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR], [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.  [NEWLINE][NEWLINE]인접한 모든 농장의 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]서로 인접해서 건설할 수 없습니다.[ENDCOLOR].'),
('TXT_KEY_BUILD_FW_HYDROPONICS_DOME','수경재배지구 건설'),
('TXT_KEY_BUILD_FW_HYDROPONICS_DOME_HELP','인접한 모든 농장의 [ICON_RESEARCH]과학이 +1 증가합니다.'),
('TXT_KEY_BUILD_FW_HYDROPONICS_DOME_REC','타일의 식량, 과학 및 생산량이 증가합니다.'),
-- 생명공학센터
('TXT_KEY_IMPROVEMENT_FW_GENOCENTRE','생명공학센터'),
('TXT_KEY_IMPROVEMENT_FW_GENOCENTRE_TEXT','유전자 조작과 공학에서의 대부분의 실험이 도심에 위치한 전용 유전자 조작 및 유전자 변환 연구소에서 이루어졌지만, 점점 더 다양한 생물 제조 공정의 개발은 통제된 환경에서 떨어진 유전자 실험 및 개발에 전념하는 센터의 필요성을 증가시켰습니다. 도시들의. 미개발 지역에 세워진 이 유전자 센터들은 자연 환경 내에서 유전자 변형 유기체의 영향을 연구했습니다.[NEWLINE][NEWLINE]해당 타일의 [ICON_PRODUCTION]생산이 +4, [ICON_GOLD]골드가 +2, [ICON_FOOD]식량이 +1 증가합니다. [NEWLINE][NEWLINE]인접한 제배지와 야영지의 [ICON_GOLD]골드가 +2, 인접한 목장의 [ICON_PRODUCTION]생산이 +2, 인접한 어선의 [ICON_FOOD]식량이 +2 증가합니다.[NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]서로 인접해서 건설할 수 없습니다.[ENDCOLOR].'),
('TXT_KEY_IMPROVEMENT_FW_GENOCENTRE_HELP','해당 타일의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]4[ENDCOLOR], [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR], [ICON_FOOD]식량이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE]인접한 야영지와 재배지의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR], 인접한 목장의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR], 인접한 어선의 [ICON_FOOD]식량이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]서로 인접해서 건설할 수 없습니다.[ENDCOLOR].'),
('TXT_KEY_BUILD_FW_GENOCENTRE','생명공학센터 건설'),
('TXT_KEY_BUILD_FW_GENOCENTRE_HELP','[COLOR_POSITIVE_TEXT]물 위에도 건설[ENDCOLOR]할 수 있습니다. 인접한 마을, 목장, 어선의 산출량이 증가합니다. 이 타일에 주둔하는 유닛의 [ICON_STRENGTH]방어력이 [COLOR_POSITIVE_TEXT]100%[ENDCOLOR] 증가합니다.'),
('TXT_KEY_BUILD_FW_GENOCENTRE_REC','타일의 식량, 생산, 골드 및 방어율(100%)이 증가합니다. 물 위에도 건설이 가능합니다.'),
-- 지원중계기
('TXT_KEY_IMPROVEMENT_FW_CORE','지원중계기'),
('TXT_KEY_IMPROVEMENT_FW_CORE_TEXT','군 부대가 점점 더 정교해지면서, 현장에서의 장비 유지보수가 점점 더 어려워졌습니다. 이는 특히 광범위한 사이버네틱을 이용한 군대에서 널리 퍼져 지원중계기의 개발을 이끌었습니다. 이러한 모듈식 시설은 강력한 방어 위치뿐만 아니라 광범위한 수리 시설과 작업장을 제공하여 현장 유닛을 위한 기술적으로 정교한 장비를 유지관리하는 데 도움이 되었습니다.[NEWLINE][NEWLINE]해당 타일의 [ICON_RESEARCH]과학과 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]3[ENDCOLOR] 증가합니다. 도시와 인접해서 건설하면 [ICON_RESEARCH]과학과 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 추가로 증가하며, 언덕에 건설하면 [ICON_PRODUCTION]생산이 +2, [ICON_FOOD]식량이 +1 추가로 증가합니다. 매턴 근접한 적 유닛에 [COLOR_NEGATIVE_TEXT]20[ENDCOLOR] 피해를 줍니다. [NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]서로 인접해서 건설할 수 없습니다.[ENDCOLOR].'),
('TXT_KEY_IMPROVEMENT_FW_CORE_HELP','해당 타일의 [ICON_RESEARCH]과학과 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]3[ENDCOLOR]증가합니다. 도시와 인접해서 건설하면 [ICON_RESEARCH]과학과 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 추가로 증가하며, 언덕에 건설하면 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR], [ICON_FOOD]식량이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 추가로 증가합니다. 인접한 적 유닛에 매턴 [COLOR_NEGATIVE_TEXT]20[ENDCOLOR] 피해를 줍니다. [NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]서로 인접해서 건설할 수 없습니다.[ENDCOLOR].'),
('TXT_KEY_BUILD_FW_CORE','지원중계기 건설'),
('TXT_KEY_BUILD_FW_CORE_HELP','도시에 인접하거나 언덕에 건설하면 산출량이 증가합니다. [COLOR_NEGATIVE_TEXT]적 유닛에게는 피해를 줍니다[ENDCOLOR].'),
('TXT_KEY_BUILD_FW_CORE_REC','타일의 골드와 과학 산출량이 증가하고 매 턴 주변의 적에게 20HP의 피해를 줍니다.'),
-- 인공환경도시
('TXT_KEY_IMPROVEMENT_FW_ARCOLOGY','인공환경도시'),
('TXT_KEY_IMPROVEMENT_FW_ARCOLOGY_TEXT','인공환경도시(아콜로지)는 많은 사람들이 완전하게까지는 아니더라도 그 안의 닫힌 환경만으로 일상 생활이 가능하게끔 만들어진 거대한 구조물입니다.[NEWLINE][NEWLINE]해당 타일의 [ICON_CULTURE]문화, [ICON_FOOD]식량, [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가하고, [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]증가합니다.  [NEWLINE][NEWLINE]도시에 인접하면 [ICON_FOOD]식량,  [ICON_GOLD]골드가 추가로 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가하며 해안에 건설하면 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR]증가합니다. [NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]서로 인접해서 건설할 수 없습니다.[ENDCOLOR]'),
('TXT_KEY_IMPROVEMENT_FW_ARCOLOGY_HELP','해당 타일의  [ICON_CULTURE]문화, [ICON_FOOD]식량, [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가하고, [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]증가합니다. [NEWLINE][NEWLINE]도시에 인접하거나 해안, 해안가에 건설하면 [ICON_FOOD]식량,  [ICON_GOLD]골드가 추가로 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]서로 인접해서 건설할 수 없습니다.[ENDCOLOR]'),
('TXT_KEY_BUILD_FW_ARCOLOGY', '인공환경도시 건설'),
('TXT_KEY_BUILD_FW_ARCOLOGY_HELP', '도시나 해안과 인접하면 [ICON_FOOD]식량,  [ICON_GOLD]골드가 추가로 증가합니다. 이 타일에 주둔하는 유닛의 [ICON_STRENGTH]방어력이 [COLOR_POSITIVE_TEXT]100%[ENDCOLOR] 증가합니다.'),
('TXT_KEY_BUILD_FW_ARCOLOGY_REC',  '타일의 식량, 과학 및 골드 생산량이 증가합니다.'),
-- 전략미사일기지
('TXT_KEY_BUILD_FW_VAULT','[LINK=IMPROVEMENT_FW_VAULT]전략미사일기지 시설[\LINK] 건설'),
('TXT_KEY_BUILD_FW_VAULT_HELP','이 타일에 최대 3개의 미사일을 배치할 수 있으며, 이 타일에 주둔하는 유닛의 방어력이 100% 증가합니다.'),
('TXT_KEY_BUILD_FW_VAULT_REC','주둔하는 유닛의 방어력이 100% 증가하며, 이 타일에 최대 3개의 미사일을 배치할 수 있습니다.'),
('TXT_KEY_IMPROVEMENT_FW_VAULT','전략미사일기지'),
('TXT_KEY_IMPROVEMENT_FW_VAULT_TEXT','전략미사일기지는 핵 폭발로 인한 방사능 먼지나 잔해로부터 보호하기 위해 특별히 지정된 밀폐된 공간입니다.'),
('TXT_KEY_IMPROVEMENT_FW_VAULT_HELP','이 타일에 최대 3개의 미사일을 저장할 수 있으며, 이 타일에 주둔하는 유닛의 방어력이 [COLOR_POSITIVE_TEXT]100%[ENDCOLOR] 증가합니다.');

--===========================
-- Buidings
--===========================
INSERT INTO Language_ko_KR (Tag, Text) VALUES
-- Aquaculture Lab
('TXT_KEY_BUILDING_FW_AQUACULTURE_LAB', '수산양식 연구소'),
('TXT_KEY_BUILDING_FW_AQUACULTURE_LAB_HELP', '도시 근처에  [ICON_RES_FISH] 물고기가 출현합니다. 도시의 해양타일의 [ICON_FOOD]식량이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR], 해양자원의 [ICON_GOLD]골드 및 [ICON_FOOD]식량이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][ICON_FOOD]/[ICON_PRODUCTION]낙후에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다. [NEWLINE][NEWLINE][COLOR_YELLOW]해안도시[ENDCOLOR]에만 건설할 수 있습니다. [COLOR_PLAYER_NETHERLANDS_BACKGROUND]항만[ENDCOLOR]이 있어야 하고 [COLOR_NEGATIVE_TEXT]해저 채굴 플랫폼, 인공산호초[ENDCOLOR]가 없어야 건설할 수 있습니다.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]투케이 푸드 기업을 설립하면[ENDCOLOR] [ICON_FOOD]식량이 [COLOR_POSITIVE_TEXT]3[ENDCOLOR] 증가합니다.'),
('TXT_KEY_BUILDING_FW_AQUACULTURE_LAB_STRATEGY', '수산양식 연구소를 건설하면 타일시설을 개발하고, 도시의 해양 타일의 골드 및 식량을 증가시킬 수 있습니다. '),
('TXT_KEY_BUILDING_FW_AQUACULTURE_LAB_PEDIA', '농업과 축산업이 과학적 방법을 통해 개량되어온 것처럼, 바다에서의 자원 확보 또한 비슷한 과정을 거칠 수밖에 없었습니다. 현대의 양식 연구는 해양 생물의 생리학, 영양학, 그리고 생태학적 상호작용을 기반으로 하여, 제한된 해역에서 최대한의 생산성을 이끌어내는 방법을 모색합니다. 예를 들어 노르웨이의 대규모 연어 양식장은 자동화된 사료 공급 시스템, 유전자 선택 교배, 수질 모니터링 센서, 해양생태 데이터 분석을 통해 안정적이고 고품질의 단백질 공급원을 생산합니다. 이러한 첨단 양식 기술은 단순히 식량 자급에 그치지 않고, 해양 자원의 지속가능한 관리와 글로벌 식량 안보에 중요한 역할을 담당하게 되었습니다.'),

-- Seawater Artificial Reef
('TXT_KEY_BUILDING_FW_SEAWATER_ARTIFICIAL_REEF', '인공 산호초'),
('TXT_KEY_BUILDING_FW_SEAWATER_ARTIFICIAL_REEF_HELP', '해양 타일의 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR], [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][ICON_RES_PEARLS]진주: +1[ICON_GOLD] +1[ICON_CULTURE][NEWLINE][ICON_RES_CRAB]게: +1[ICON_RESEARCH] +1[ICON_GOLD][NEWLINE][ICON_RES_CORAL]산호: +1[ICON_RESEARCH] +1[ICON_CULTURE][NEWLINE][NEWLINE][COLOR_YELLOW]해안도시[ENDCOLOR]에만 건설할 수 있습니다. [COLOR_PLAYER_NETHERLANDS_BACKGROUND]항만[ENDCOLOR]이 있어야 하고 [COLOR_NEGATIVE_TEXT]수산양식 연구소, 해저 채굴 플랫폼[ENDCOLOR]이 없어야 건설할 수 있습니다.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]시빌 보석 기업을 설립하면[ENDCOLOR] [ICON_GOLDEN_AGE]황금기 점수가 [COLOR_POSITIVE_TEXT]4[ENDCOLOR] 증가합니다.'),
('TXT_KEY_BUILDING_FW_SEAWATER_ARTIFICIAL_REEF_STRATEGY', '인공 산호초는 미래 시대 건물입니다. 도시의 과학과 문화를 향상시킵니다.'),
('TXT_KEY_BUILDING_FW_SEAWATER_ARTIFICIAL_REEF_PEDIA', '인공 산호초는 인간이 만든 수중 구조물로, 일반적으로 바닥이 없는 지역에서 해양 생물을 촉진하고, 침식을 통제하고, 선박 통행을 막고, 트롤망 사용을 막고, 서핑을 개선하기 위해 만들어졌습니다. 인공 암초 건설은 고대부터 시작되었습니다. 페르시아인들은 인공 암초를 건설하여 아라비아 해적을 저지하기 위해 티그리스 강 하구를 막았고, 제1차 포에니 전쟁 동안 로마인들은 시칠리아의 카르타고 항구 입구를 가로질러 암초를 건설하여 적함을 안에 가두고 카르타고인들을 섬. 오늘날 지구 온난화와 기후 변화로 인해 그레이트 배리어 리프에 있는 산호의 절반 이상이 파괴되었지만 문명이 이 사건을 바로잡고 바닷물의 연약한 생태계를 복원하는 데 도움을 줄 수 있습니다.'),

-- Undersea Mining Platform
('TXT_KEY_BUILDING_FW_UNDERSEA_MINING', '해저 채굴 플랫폼'),
('TXT_KEY_BUILDING_FW_UNDERSEA_MINING_HELP', '해양 타일의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR], [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE][ICON_RES_OIL]석유: [ICON_PRODUCTION]생산: +1[ICON_GOLD]골드 +1, [ICON_RESEARCH]과학 +1[NEWLINE][ICON_RES_WHALE]고래: [ICON_PRODUCTION]생산: +1[ICON_GOLD]골드 +1, [ICON_RESEARCH]과학 +1[NEWLINE][ICON_RES_NANOMAT]나노물질: [ICON_PRODUCTION]생산: +1[ICON_GOLD]골드 +1, [ICON_RESEARCH]과학 +1[NEWLINE][NEWLINE]이 도시로 향하는 [ICON_INTERNATIONAL_TRADE]교역로마다 도시의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가하고 교역로를 개설한 상대 문명의 [ICON_GOLD]골드도 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][COLOR_YELLOW]해안도시[ENDCOLOR]에만 건설할 수 있습니다. [COLOR_PLAYER_NETHERLANDS_BACKGROUND]항만[ENDCOLOR]이 있어야 하고 [COLOR_NEGATIVE_TEXT]수산양식 연구소, 인공 산호초[ENDCOLOR]가 없어야 건설할 수 있습니다.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]센타우리 개발 기업을 설립하면[ENDCOLOR] [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다.'),
('TXT_KEY_BUILDING_FW_UNDERSEA_MINING_STRATEGY', '해저 채굴 플랫폼은 미래 시대의 건물입니다. 도시의 생산과 골드 산출량을 향상시킵니다.'),
('TXT_KEY_BUILDING_FW_UNDERSEA_MINING_PEDIA', '점점 더 정교해지는 로봇 및 드론 기술은 이제 지구상에서 가장 위험한 환경에 접근할 수 있음을 의미했습니다. 해저는 항상 망간과 같은 잠재적인 자원 공급원이었지만 접근이 어려웠기 때문에 이러한 자원은 손대지 않았습니다. 이제 원격 제어 드론과 로봇을 통해 이러한 자원을 산업용으로 효율적으로 채굴할 수 있습니다. 그러나 이러한 산업 작업장의 존재와 폐기물 부산물은 종종 양식업 노력을 방해했습니다.'),

-- Server Hub
('TXT_KEY_BUILDING_FW_SERVER_HUB', '서버 허브'),
('TXT_KEY_BUILDING_FW_SERVER_HUB_HELP', '서버 허브는 과학, 문화, 경제 또는 생산 등 특정 분야의 특정 분야를 전문으로 다룰 수 있는 미래 시대의 필수 건물입니다.'),
('TXT_KEY_BUILDING_FW_SERVER_HUB_STRATEGY', '나중에 특수 전문화된 서버를 건설할 수 있도록 서버 허브를 구축합니다.'),
('TXT_KEY_BUILDING_FW_SERVER_HUB_PEDIA', '컴퓨터는 다양한 회계 및 과학 업무를 수행함으로써 사업, 과학 연구, 그리고 산업 발전을 촉진하는 데 기여해 왔지만, 정보화 시대를 진정으로 이끈 것은 바로 이러한 컴퓨터들을 네트워크로 연결하여 사실상 모든 사람이 방대한 양의 데이터를 이용할 수 있도록 하는 것입니다. 컴퓨터 네트워크는 점점 더 정교하고 복잡해졌지만, 초기 네트워크는 사용자가 데이터에 접근하고 공유할 수 있는 서버 허브를 중심으로 구축되었습니다.'),

-- Fungal Agrigenomics
('TXT_KEY_BUILDING_FW_FUNGAL_AGRIGENOMICS', '제노포자 배양 연구소'),
('TXT_KEY_BUILDING_FW_FUNGAL_AGRIGENOMICS_HELP', '도시 근처에 [ICON_RES_ADN_FUNGUS]제노포자 [COLOR_POSITIVE_TEXT]5개[ENDCOLOR]가 있는 타일이 출현합니다. 배양지를 건설하면 자원을 얻을 수 있습니다. [NEWLINE][NEWLINE][COLOR_PLAYER_NETHERLANDS_BACKGROUND]연구소[ENDCOLOR]가 있어야 건설할 수 있습니다.'),  
('TXT_KEY_BUILDING_FW_FUNGAL_AGRIGENOMICS_STRATEGY', '도시에 [ICON_RESEARCH]과학이 +4 ,  [ICON_CULTURE]문화가 +4추가됩니다. 연구소를 건설하여 [ICON_RES_ADN_FUNGUS]제노포자를 얻을 수 있습니다.'),
('TXT_KEY_BUILDING_FW_FUNGAL_AGRIGENOMICS_PEDIA', '제노포자 배양 연구소 또는 제노포자 유전학 연구소는 기능적 유전체학 접근 방식을 사용하여 산업 및 환경 응용 분야를 위한 곰팡이 효소를 식별합니다. 극한 환경에서 성장할 수 있는 능력과 알려진 생분해, 생물정화 및 생촉매 능력에 따라 선택된 진화적으로 다양한 진균 종에 대한 대규모 유전자 발견 프로그램입니다. 농업 유전학(agricultural genomics) 또는 농업 유전체학(농업에 유전학을 적용하는 것)은 지속 가능한 생산성을 지속적으로 추진하고 있으며, 전 세계 인구를 먹여 살리고 인간 게놈 미스터리를 해결하는 점증하는 문제에 대한 솔루션을 제공하고 있습니다. 현대 기술을 사용하여 농부, 육종가 및 연구원은 원하는 특성과 연결된 유전적 마커를 쉽게 식별하여 재배 및 육종 결정을 알릴 수 있습니다.'),

-- Genemod Lab
('TXT_KEY_BUILDING_FW_GENE_LAB', '유전자공학 연구소'),
('TXT_KEY_BUILDING_FW_GENE_LAB_HELP', '[ICON_CITIZEN]시민이 증가할 때 사용한 [ICON_FOOD]식량의 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR]를 다음 [ICON_CITIZEN]시민을 위해 사용할 수 있습니다.[COLOR:105:105:105:255](이 효과는 송수로와 중첩됩니다.)[ENDCOLOR] 모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]유전자공학 연구소[ENDCOLOR]의 [ICON_FOOD]식량이 추가로 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][ICON_FOOD]/[ICON_PRODUCTION]낙후에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 감소합니다. [NEWLINE][NEWLINE][ICON_RES_HORSE]말:[ICON_FOOD]식량 +2[NEWLINE][ICON_RES_COW]소:[ICON_FOOD]식량 +2[NEWLINE][ICON_RES_SHEEP]양:[ICON_FOOD]식량 +2[NEWLINE][ICON_RES_DEER]사슴:[ICON_FOOD]식량 +2[NEWLINE][ICON_RES_BISON]들소:[ICON_FOOD]식량 +2[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]연구소[ENDCOLOR]가 있어야 건설할 수 있습니다.[NEWLINE][NEWLINE][ICON_RES_HORSE]말이 [COLOR_NEGATIVE_TEXT]1마리[ENDCOLOR] 필요합니다. '),
('TXT_KEY_BUILDING_FW_GENE_LAB_STRATEGY', '유전자 공학 연구소를 건설하면 GMO를 생산하게 되어 도시의 [ICON_RES_COW][ICON_RES_DEER][ICON_RES_HORSE][ICON_RES_SHEEP][ICON_RES_BISON]의 식량을 올려줍니다.'),
('TXT_KEY_BUILDING_FW_GENE_LAB_PEDIA', '유전자 조작 기술이 발전함에 따라 인류는 점점 더 광범위한 주제에 대한 실험을 시작했습니다. 처음에는 작물과 가축의 미미한 개량으로 시작되었지만, 유전체 시퀀싱을 통해 과학자들이 전례 없는 정확도로 유전 물질을 분석하고 선택할 수 있게 되면서 정밀 공학으로 빠르게 확장되었습니다. 유전 질환과 관련된 위험한 대립유전자를 확인하고 제거함으로써 더욱 건강하고 오래 사는 개체군이 탄생했습니다. 식량 공급의 어려움에 직면한 연구자들은 기존 종의 단순한 변형이 아닌 완전히 새로운 동물을 설계하는 데 집중했습니다. 그 결과, 빠른 성장과 높은 단백질 생산량을 위해 유전자 조작된 가축, 극한 기후에서 작물과 함께 번성할 수 있는 공생 생물, 심지어 통제된 환경에서만 번식하도록 조작되어 안전성과 지속 가능성을 보장하는 생물체까지 탄생했습니다. 유전자 공학은 곧 농업을 넘어 의학과 전쟁에 적용되었습니다. 병원균에 대한 저항력을 강화한 군인, 맞춤형 장기를 생산할 수 있는 바이오뱅크, 그리고 인간 능력의 한계를 뛰어넘는 실험적 증강이 가능해졌습니다. 유전체 시퀀싱과 유전자 공학의 결합을 통해 인류는 스스로 진화의 방향을 결정할 수 있는 능력을 얻었습니다. 이러한 기술적 성취는 단순한 과학적 이정표가 아니라 미래 문명의 기반을 형성하는 기술적 특이점으로 점차 인식되고 있습니다.'),

-- Cyberpolice
('TXT_KEY_BUILDING_FW_CYBERPOLICE', '국제치안국'),
('TXT_KEY_BUILDING_FW_CYBERPOLICE_HELP', '[ICON_SPY] 도시 보안이 +20 증가합니다. [NEWLINE][NEWLINE]도시국가 [COLOR_CYAN]동맹[ENDCOLOR] 보너스: [ICON_SPY] 도시 보안 +1. [NEWLINE][NEWLINE][ICON_FOOD]/[ICON_PRODUCTION]낙후, [ICON_GOLD] 빈곤, [ICON_RESEARCH] 문맹, [ICON_CULTURE]무료에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.'),
('TXT_KEY_BUILDING_FW_CYBERPOLICE_STRATEGY', '경찰서는 적 스파이가 도시를 해칠 수 있는 속도를 늦춥니다. 디지털 경찰서를 건설하려면 도시에 경찰서가 있어야 합니다.'),
('TXT_KEY_BUILDING_FW_CYBERPOLICE_PEDIA','인터폴(국제형사경찰기구)은 국경을 넘어 범죄에 대응하기 위해 설립된 국제 조직입니다. 각국에는 중앙사무국 지부(일명 국제치안국)가 설치되어, 회원국 간 협력을 조율합니다. 사이버 범죄, 테러, 금융 사기, 마약 밀매 등 다양한 범죄에 대해 국제 공조 수사를 가능하게 하며, 경찰 기관 간의 실시간 정보 공유 체계를 운영합니다. 사이버 시대에 들어서는 첨단 네트워크 보안 기술과 데이터 분석 기법을 활용해 해킹, 사이버 금융 사기, 개인정보 침해 같은 새로운 위협에도 대응합니다. 또한 전문 수사관, 과학 수사 전문가, 디지털 보안 인력이 함께하며, 국제 규약 마련과 교육·훈련 프로그램을 통해 범죄 예방과 법질서 유지를 목표로 합니다.'),
('TXT_KEY_BUILDING_CYBER_POLICE_DUMMY', '국제형사경찰기구 중앙사무국(더미)'),
('TXT_KEY_BUILDING_CYBER_POLICE_DUMMY_HELP', '복사 수만큼 도시 보안이 +1씩 상승합니다. 스크립트로 개수를 제어합니다.'),
-- Autoplant
('TXT_KEY_BUILDING_FW_AUTOPLANT', '자동생산시설'),
('TXT_KEY_BUILDING_FW_AUTOPLANT_HELP', '도시의 [ICON_CITIZEN]시민 5명마다 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]자동생산시설[ENDCOLOR]의 [ICON_PRODUCTION]생산이 추가로 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE][ICON_FOOD]/[ICON_PRODUCTION]낙후, [ICON_URBANIZATION]도시화에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]씩 감소합니다.[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]공장[ENDCOLOR]이 있어야 건설할 수 있습니다.[NEWLINE][NEWLINE][ICON_RES_OIL]석유가 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR] 필요합니다.'),
('TXT_KEY_BUILDING_FW_AUTOPLANT_STRATEGY', '고전적인 공장의 업그레이드 된 자동생산시설은 [ICON_PRODUCTION]생산량을 크게 증가시킵니다. [COLOR_POSITIVE_TEXT]산업 단지[ENDCOLOR]에 혜택을 줍니다(산업 단지는 근처 제조소에 [ICON_PRODUCTION]생산 보너스를 추가합니다).'),
('TXT_KEY_BUILDING_FW_AUTOPLANT_PEDIA', '산업이 점점 더 자동화되는 동안 인간의 감독과 개입은 여전히 필요했습니다. 결국, 초기 로봇은 지시받은 만큼만 효과적이었습니다. 그러나 점점 더 자율적인 기계가 개발됨에 따라 이러한 종종 위험한 작업 환경에서 사람이 있어야 할 필요성을 제거하는 것이 점점 더 가능해졌습니다. 자율 제조 및 산업 시설이 점차 보편화되어 생산성을 향상시키는 동시에 인간의 건강과 안전을 보호합니다. 이러한 자동화 시설은 특히 전자상거래의 확산으로 혜택을 받았습니다. 상품을 제조하고 구매하는 전체 프로세스가 사람의 개입이 필요하지 않고 전국적으로 수행될 수 있기 때문입니다.'),

-- Nanomaterial Plant
('TXT_KEY_BUILDING_FW_NANOMAT_PLANT', '나노물질 제조소'),
('TXT_KEY_BUILDING_FW_NANOMAT_PLANT_HELP', '[ICON_RES_NANOMAT]나노물질 [COLOR_POSITIVE_TEXT]5개[ENDCOLOR]를 제공합니다.[NEWLINE][NEWLINE][ICON_RES_IRON]철: [ICON_PRODUCTION]생산 +2[NEWLINE][ICON_RES_COAL]석탄:[ICON_PRODUCTION]생산 +2[NEWLINE][ICON_RES_OIL]석유:[ICON_PRODUCTION]생산 +2[NEWLINE][ICON_RES_NANOMAT]나노물질:[ICON_PRODUCTION]생산 +2[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]연구소[ENDCOLOR]가 있어야 건설할 수 있습니다. [NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]헥손 정유 기업을 설립하면[ENDCOLOR] [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]3[ENDCOLOR] 증가합니다.'),
('TXT_KEY_BUILDING_FW_NANOMAT_PLANT_STRATEGY', '석탄, 석유, 철을 이용하여 나노물질을 추출이 가능하게 되는 기반 시설을 건설하며, 나노물질을 얻습니다.'),
('TXT_KEY_BUILDING_FW_NANOMAT_PLANT_PEDIA', '나노소재 공장은 희토류 원소를 비롯한 특수 자원에서 필수 원소를 추출 및 정제하여 미래 건물 및 첨단 장비에 필요한 복잡한 나노 크기의 구조물을 합성하는 시설입니다. 단순한 탄소 기반 공정을 넘어, 이 공장은 희토류의 고유한 전자적 및 광학적 특성을 활용하여 고성능 나노소재의 대량 생산을 가능하게 합니다. 따라서 나노소재 공장은 단순한 생산 시설을 넘어 희토류의 가치를 미래 문명의 기반으로 전환하는 핵심 허브로 평가받고 있습니다.'),

-- Ecosanctuary
('TXT_KEY_BUILDING_FW_ECOSANCTUARY', '생태친화시설'),
('TXT_KEY_BUILDING_FW_ECOSANCTUARY_HELP', '야영지, 브라질 소방목 벌목장, 제재소, 자연보호구역, 친환경마을의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE]모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]생태친화시설[ENDCOLOR]의 [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. 매턴 도시의 [ICON_PRODUCTION]생산의 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR]만큼의 [ICON_CULTURE]문화로 전환합니다. 도시의 [ICON_TOURISM]관광이 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][ICON_CULTURE]무료, [ICON_RELIGION]종교 분쟁에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]씩 감소합니다.[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]약국[ENDCOLOR]이 있어야 하고 [COLOR_NEGATIVE_TEXT]수직형 농장[ENDCOLOR]이 없어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_ECOSANCTUARY_STRATEGY', '생태친화시설은 나무와 습지와 공존할 계획이라면 생산과 문화에 유용합니다. 도시에서 작업한 모든 야영장, 브라질 소방목장, 제재소, 간척지, 자연 보호 구역 및 생태 공동체를 추가 생산 및 문화 보너스 산출물로 현대화하십시오. 행복이 증가합니다.'),
('TXT_KEY_BUILDING_FW_ECOSANCTUARY_PEDIA', '생태 철학이 강한 지역 사회에서는 주변의 야생 자연 지역과 연결되어 있다고 느낄 수 있는 방법에 대한 깊은 필요성을 느꼈습니다. 자연 보호 구역이 가장 즐거운 기회를 제공했지만 모든 사람이 지역 보호 구역을 즐길 시간과 자원을 아끼지 못했습니다. 그 결과, 이러한 커뮤니티는 커뮤니티 자체에 위치한 자연 보호 구역인 생태 보호 구역을 개발하기 시작했습니다. 필요에 따라 여전히 어느 정도 인공적이지만 동식물 사육장보다 훨씬 더 자연스럽고 자연스러워서 대중이 자연 세계와 훨씬 더 긴밀하게 연결되어 있다고 느낄 수 있습니다. 이 피난처는 종종 다양한 예술, 음악 및 문학 작품에 영감을 주는 문화 센터가 되었습니다.'),

-- Cryptobank
('TXT_KEY_BUILDING_FW_CRYPTOBANK', '암호화폐 거래소'),
('TXT_KEY_BUILDING_FW_CRYPTOBANK_HELP', '도시의 [ICON_CITIZEN]시민 5명마다 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]암호화폐 거래소[ENDCOLOR]의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 소도시와 마을의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE][ICON_GOLD]골드로 유닛을 구매하거나 건물 건설에 투자하는 비용이 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR] 감소합니다. [NEWLINE][ICON_GOLD]빈곤에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 감소합니다. [NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]서버 허브[ENDCOLOR]와 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]증권 거래소[ENDCOLOR]가 있어야 건설할 수 있습니다.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]시드 무역 주식회사를 설립하면[ENDCOLOR] [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]3[ENDCOLOR] 증가합니다.'),
('TXT_KEY_BUILDING_FW_CRYPTOBANK_STRATEGY', '암호화폐 거래소를 건설하여 도시의 골드 출산량을 증가시킬 수 있고, 소도시의 산출량이 증가합니다.'),
('TXT_KEY_BUILDING_FW_CRYPTOBANK_PEDIA', '최초의 암호화폐는 정부나 은행과 같은 중앙 기관에 의존하지 않는 컴퓨터 네트워크를 통해 교환 매체로 작동하도록 설계되었지만 21세기 최신 통화를 손에 넣는 것은 시간 문제였습니다. 따라서 월스트리트 은행은 암호 화폐를 처음으로 채택했으며 Morgan Stanley는 2021년 3월 17일 공격적인 위험 허용 범위를 가진 투자자의 비트코인 소유권을 가능하게 하는 3개의 펀드를 통해 부유한 고객을 위해 비트코인 펀드에 대한 액세스를 제공할 것이라고 발표했습니다. BNY Mellon은 2021년 2월 11일 고객에게 암호화폐 서비스를 제공할 것이라고 발표했습니다. 2021년 4월 20일, Venmo는 고객이 암호화폐를 구매, 보유 및 판매할 수 있도록 플랫폼에 지원을 추가했습니다. 그리고 2021년 10월 금융 서비스 회사 마스터카드는 마스터카드 네트워크의 은행이나 상인이 암호화폐 서비스를 제공할 수 있는 플랫폼에서 디지털 자산 관리자 백트와 협력하고 있다고 발표했습니다.'),

-- VR Training
('TXT_KEY_BUILDING_FW_VR_TRAINING', 'VR 훈련장'),
('TXT_KEY_BUILDING_FW_VR_TRAINING_HELP', '도시에서 생산하는 모든 유닛의 경험치가 [COLOR_POSITIVE_TEXT]25[ENDCOLOR]증가합니다. [ICON_SILVER_FIST]군사 유닛 보급한도가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE][ICON_CULTURE]무료에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.[NEWLINE][ICON_FOOD]/[ICON_PRODUCTION]낙후에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]사관학교[ENDCOLOR]와 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]서버 허브[ENDCOLOR]가 있어야[ENDCOLOR] 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_VR_TRAINING_STRATEGY', 'VR 훈령장을 건설하여 경험치 획득과 군사유닛 보급한도를 증가시킬 수 있습니다.'),
('TXT_KEY_BUILDING_FW_VR_TRAINING_PEDIA', '현대 전장과 군사 장비가 점점 더 정교해짐에 따라 군인들에게 실제로 자신을 위험에 빠뜨리지 않고 전투 경험을 제공하기 위해 다양한 형태의 시뮬레이션 환경에서의 훈련이 점점 더 중요해지고 있습니다.'),

-- Virtual Museum
('TXT_KEY_BUILDING_FW_VIRTUAL_MUSEUM', '메타버스 박물관'),
('TXT_KEY_BUILDING_FW_VIRTUAL_MUSEUM_HELP', '도시의 [ICON_CITIZEN]시민 4명마다 [ICON_CULTURE]문화 및 [ICON_TOURISM]관광이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 도시의 [ICON_GREAT_WORK]걸작 1개마다 [ICON_CULTURE]문화 및 [ICON_TOURISM]관광이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]메타버스 박물관[ENDCOLOR]의 [ICON_CULTURE]문화가 추가로 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.도시의 [ICON_GREAT_ARTIST]위대한 예술가의 출현율이 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR] 증가합니다. [ICON_GREAT_WORK]걸작 예술품 슬롯 2개를 포함합니다.[NEWLINE][NEWLINE][ICON_CULTURE]무료에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 감소합니다. [NEWLINE][NEWLINE]테마보너스: [ICON_CULTURE]문화 + 6[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]박물관[ENDCOLOR]과 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]서버 허브[ENDCOLOR]가 있어야[ENDCOLOR] 건설할 수 있습니다.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]조르지오 아르미에 기업을 설립하면[ENDCOLOR] [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다.'),
('TXT_KEY_BUILDING_FW_VIRTUAL_MUSEUM_STRATEGY', '메타버스 박물관은 미래 시대의 문화 건물입니다. 걸작이나 유물을 위한 슬롯은 하나뿐이지만 이전 문화관련 건물이 필요하지 않습니다.'),
('TXT_KEY_BUILDING_FW_VIRTUAL_MUSEUM_PEDIA', '인터넷의 전 세계적 확산과 함께 갤러리와 예술 작품을 디지털 형태로 보존할 수 있는 박물관들이 등장했습니다. 그러나 디지털 제품은 본질적으로 복제 가능하기 때문에 원본과 사본을 구분하는 데 상당한 제약이 있었습니다. 이를 해결하기 위해 NFT(Non-Fungible Token) 기술이 개발되었습니다. NFT는 각 작품에 고유한 코드를 부여하고 암호화폐와 유사한 분산 컴퓨팅 시스템에 저장하여 진위성과 출처를 보장합니다. 가상현실이 발전함에 따라 몰입형 디지털 세계에서 경험할 수 있는 예술 작품에 대한 수요가 폭발적으로 증가했습니다. 이에 따라 디지털 아트 뮤지엄과 같은 새로운 문화 시설이 설립되어 관객은 디지털 명작에 쉽게 접근하고, 감상하고, 진위 여부를 확인하고, 관리할 수 있게 되었습니다. 이러한 발전은 미래 시대의 예술 소비의 본질 자체를 변화시켰습니다.'),

-- E-Commerce Server
('TXT_KEY_BUILDING_FW_COMMERCE_SERVER', '전자상거래 서버'),
('TXT_KEY_BUILDING_FW_COMMERCE_SERVER_HELP', '도시의 [ICON_CITIZEN]시민 2명마다 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][ICON_GREAT_MERCHANT]위대한 상인의 출현율이 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR] 증가합니다.  [NEWLINE][NEWLINE][ICON_GOLD]빈곤, [ICON_URBANIZATION]도시화에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]씩 감소합니다. [NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]서버 허브[ENDCOLOR]와 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]증권거래소[ENDCOLOR]가 있어야 하고 [COLOR_NEGATIVE_TEXT]연구 서버, 클라우드 서버, 엔터테인먼트 서버[ENDCOLOR]가 없어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_COMMERCE_SERVER_STRATEGY', '전자상거래 서버는 도시에서 골드와 위대한 상인의 출현율을 높입니다'),
('TXT_KEY_BUILDING_FW_COMMERCE_SERVER_PEDIA', '인터넷의 등장은 상품과 서비스가 전자적으로 교환되는 소위 디지털 경제의 급속한 성장을 가져왔습니다. 사람들은 더 이상 오프라인 매장을 방문할 필요가 없습니다. 전 세계 공급업체로부터 제품을 구매하여 집 앞까지 직접 배송받을 수 있게 되었습니다. 이러한 변화는 소비자의 라이프스타일을 변화시키는 동시에 기업들에게 광활한 신시장과 경쟁 구조를 창출했습니다. [NEWLINE] 전자상거래 서버는 제품 데이터베이스, 결제 시스템, 물류 추적 및 고객 서비스 네트워크를 통합하여 이러한 온라인 거래를 지원하는 핵심 인프라 역할을 합니다. 이 시스템은 안전한 결제, 효율적인 주문 처리 및 개인 맞춤형 제품 추천을 보장합니다. 초기 구현은 단순한 온라인 상점으로 기능했지만, 빅데이터 분석과 인공지능의 통합으로 이제는 포괄적인 글로벌 전자상거래 플랫폼으로 탈바꿈했습니다. 결과적으로 전자상거래 서버는 디지털 무역의 핵심 축이자 현대 경제의 지속적인 발전을 위한 기반 요소로 인정받고 있습니다.'),

-- Entertainment Server
('TXT_KEY_BUILDING_FW_ENTERTAINMENT_SERVER', '엔터테인먼트 서버'),
('TXT_KEY_BUILDING_FW_ENTERTAINMENT_SERVER_HELP', '도시의 [ICON_CITIZEN]시민 2명마다 [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[NEWLINE][ICON_GREAT_PEOPLE]위대한 문화 위인의 출현율이 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][ICON_CULTURE]무료,  [ICON_URBANIZATION]도시화에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]씩 감소합니다.[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]서버 허브[ENDCOLOR]와 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]방송탑[ENDCOLOR]이 있어야 하고 [COLOR_NEGATIVE_TEXT]연구 서버, 클라우드 서버, 전자상거래 서버[ENDCOLOR]가 없어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_ENTERTAINMENT_SERVER_STRATEGY', '엔터테인먼트 서버는 도시의 문화와 위대한 음악가, 예술가 및 작가 비율을 높일 것입니다.'),
('TXT_KEY_BUILDING_FW_ENTERTAINMENT_SERVER_PEDIA', '원래 정부 및 과학 분야용으로 개발되었던 인터넷은 결국 일상생활로 확장되어 문화적 아이디어와 새로운 창작물을 확산하는 주요 통로가 되었습니다. 가장 영향력 있는 인프라 중 하나는 현대 스트리밍 산업의 중추 역할을 하는 엔터테인먼트 서버입니다. 유튜브와 넷플릭스와 같은 플랫폼은 시청자들이 비디오, 음악, 영화에 실시간으로 접근할 수 있도록 하여, 한때 방송 TV와 영화관이 주도했던 전통적인 미디어 소비 방식을 변화시키고 있습니다. 이러한 서버는 대규모 데이터 전송, 콘텐츠 추천 알고리즘, 저작권 관리 시스템 등의 첨단 기술을 기반으로 운영됩니다. 그 결과, 엔터테인먼트 서버는 글로벌 문화 산업의 핵심 요소일 뿐만 아니라 디지털 경제에서 가장 빠르게 성장하는 분야 중 하나가 되었습니다.'),

-- Cloud Computing
('TXT_KEY_BUILDING_FW_CLOUD_COMPUTING', '클라우드 서버'),
('TXT_KEY_BUILDING_FW_CLOUD_COMPUTING_HELP', '도시의 [ICON_CITIZEN]시민 2명마다 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][ICON_GREAT_ENGINEER]위대한 기술자의 출현율이 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][ICON_FOOD]/[ICON_PRODUCTION]낙후,  [ICON_URBANIZATION]도시화에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]씩 감소합니다. [NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]서버 허브[ENDCOLOR]와 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]공장[ENDCOLOR]이 있어야 하고 [COLOR_NEGATIVE_TEXT]연구 서버, 엔터테인먼트 서버, 전자상거래 서버[ENDCOLOR]가 없어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_CLOUD_COMPUTING_STRATEGY', '클라우드 서버는 도시에서 생산 및 위대한 기술자의 출현율을 높일 것입니다.'),
('TXT_KEY_BUILDING_FW_CLOUD_COMPUTING_PEDIA', '인터넷의 등장은 정보 교환에 혁명을 일으켰을 뿐만 아니라 원격 작업을 가능하게 하고, 문서 낭비를 줄이며, 불필요한 시간을 단축함으로써 인간의 생산성을 향상시켰습니다. 이러한 효율성의 급증은 개인과 도시의 생산성을 향상시켰고, 이러한 변화를 원활하게 만드는 클라우드 서버 시스템의 탄생으로 이어졌습니다. 클라우드 서버는 데이터 저장을 중앙 집중화하고 분산 컴퓨팅을 가능하게 함으로써 개인과 기업 모두 네트워크를 통해 필요한 도구와 리소스에 즉시 액세스할 수 있도록 했습니다. 기업들은 보안과 효율성을 모두 보장하기 위해 클라우드 환경을 점점 더 많이 도입하여 문서 제작 및 관리에 소요되던 시간을 크게 단축했습니다. 실시간 협업이 가능해지면서 업무 효율성이 크게 향상되었습니다. 소규모 기업 운영부터 국제 프로젝트까지, 클라우드 서버는 현대 생산성 인프라의 중추로 자리매김했으며, 궁극적으로 디지털 경제의 새로운 표준으로 자리 잡았습니다.'),

-- Research Server
('TXT_KEY_BUILDING_FW_RESEARCH_SERVER', '연구 서버'),
('TXT_KEY_BUILDING_FW_RESEARCH_SERVER_HELP', '도시의 [ICON_CITIZEN]시민 [COLOR_POSITIVE_TEXT]2[ENDCOLOR]명마다 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][ICON_GREAT_SCIENTIST]위대한 과학자의 출현율이 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][ICON_RESEARCH]문맹, [ICON_URBANIZATION]도시화에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]씩 감소합니다.[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]서버 허브[ENDCOLOR]와 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]연구소[ENDCOLOR]가 있어야 하고 [COLOR_NEGATIVE_TEXT]엔터테인먼트 서버, 전자상거래 서버, 클라우드 서버[ENDCOLOR]가 없어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_RESEARCH_SERVER_STRATEGY', '연구 서버는 도시에서 과학 및 위대한 과학자 비율을 높일 것입니다.'),
('TXT_KEY_BUILDING_FW_RESEARCH_SERVER_PEDIA', '초기 인터넷은 주로 대학과 연구 기관을 연결하는 컴퓨터 네트워크를 기반으로 구축되었으며, 아이디어와 정보를 더욱 효과적으로 교환하도록 설계되었습니다. 인터넷이 유비쿼터스 시스템으로 발전함에 따라 전 세계 연구자들은 어디에서나 데이터에 접근하고, 서로의 결과를 분석하고, 전례 없는 속도로 논문을 교환할 수 있게 되었습니다. 이러한 발전은 과학 연구 수행에 완전히 새로운 방식을 열어주었고, 아마추어와 애호가들로 구성된 대규모 커뮤니티조차도 연구 중심 과제를 지원하거나 기여할 수 있게 되었습니다. 특히 SCI 논문의 검증 및 동료 심사를 대면 회의 없이 온라인으로 진행할 수 있게 되어 검증 속도가 크게 향상되었습니다. 그 결과, 한때 수개월 또는 수년이 걸리던 연구가 단 몇 주 만에 출판될 수 있게 되었고, 이는 과학 지식의 축적과 발전을 가속화하는 데 결정적인 역할을 했습니다.'),

-- Converters
('TXT_KEY_BUILDING_FW_CONVERTER',          '나노물질 추출공장 (석탄)'),
('TXT_KEY_BUILDING_FW_CONVERTER_OIL',      '나노물질 추출공장 (석유)'),
('TXT_KEY_BUILDING_FW_CONVERTER_IRON',     '나노물질 추출공장 (철)'),
('TXT_KEY_BUILDING_FW_CONVERTER_HELP',     '도시의 해당된 [ICON_RES_COAL]석탄, [ICON_RES_OIL]석유, [ICON_RES_IRON]철 자원 타일의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][ICON_RES_NANOMAT]나노물질 [COLOR_POSITIVE_TEXT]4개[ENDCOLOR]를 제공합니다. [NEWLINE][NEWLINE]도시에 적어도 하나 이상의 개발된 [COLOR_YELLOW][ICON_RES_COAL]석탄, [ICON_RES_OIL]석유, [ICON_RES_IRON]철 자원[ENDCOLOR] 타일이 있어야하고, 도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]나노물질 제조소[ENDCOLOR]가 있어야 합니다.'),
('TXT_KEY_BUILDING_FW_CONVERTER_STRATEGY', '필요한 자원과 나노물질 공장을 소유하고 있다면 이를 추가 나노물질로 변환할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_CONVERTER_PEDIA',    '나노물질 공학분야의 발전은 나노물질의 개발을 더욱 발전시키는 데 도움이 되었습니다. 원래의 나노 물질 공장에는 작업에 매우 특정한 환경과 원자재가 필요했지만 진정한 나노 기술은 아니지만 더 정교한 나노 크기의 기계는 프로세스를 더 쉽고 덜 집중적으로 만드는 데 도움이 되었습니다. 석탄이나 석유와 같은 원자재는 특수 제작된 변환기에 공급될 수 있으며 나노 크기의 기계는 이를 유용한 나노 물질로 변환하기 위해 충실히 작동합니다. 이러한 초기 나노 기계가 발견한 모든 유기 물질을 나노 물질로 변환하여 잠재적으로 장난을 칠 수 있다는 우려가 있었지만, 이러한 나노 크기 기계의 비교적 간단한 구조는 여전히 작동하려면 보호된 환경이 필요하고 야생에서 오래 생존할 가능성이 없음을 의미했습니다. 그들의 프로그래밍과 디자인은 여전히 상대적으로 제한적이었습니다. 특정 자료만 다른 자료로 변환할 수 있었고 예를 들어 자신의 사본을 만들 수 없었기 때문입니다. 그럼에도 불구하고 사람들은 더 많은 생태학적 사고를 가진 사회에서 나노물질 추출공장을 환경에 대한 심각한 위험으로 간주했습니다.'),

-- Nanoforge
('TXT_KEY_BUILDING_FW_NANOFORGE', '나노물질 군수공장'),
('TXT_KEY_BUILDING_FW_NANOFORGE_HELP', '도시에서 작업하는 산업단지의 [ICON_PRODUCTION]생산과 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]이 증가하고, 모든 군사 유닛을 생산할 때 [ICON_PRODUCTION]생산보너스를 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR]제공합니다. [ICON_SILVER_FIST]군사 유닛 보급한도가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]나노물질제조소[ENDCOLOR]가 있어야 합니다. [NEWLINE][NEWLINE][ICON_RES_NANOMAT]나노물질 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR]가 필요합니다.'),
('TXT_KEY_BUILDING_FW_NANOFORGE_STRATEGY', '나노물질 군수공장을 건설하여 군사유닛 생산을 빠르게 할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_NANOFORGE_PEDIA', '나노물질 군수공장은 나노 기술을 활용하여 새로운 재료와 장비를 생산하는 전용 시설입니다. 나노물질은 금속, 기계, 컴퓨터 등 온갖요소에 작용을 하게 되었고, 합금 방어능력, 생산능력 등 경제, 생산 전반적인 부분을 개선시켜주었습니다. 이러한 장점은 곧 전쟁무기 개발에 착수를 하게되었고, 이 일환으로 나노물질 군수공장을 건설하게 되었습니다.'),

-- Particle Accelerator
('TXT_KEY_BUILDING_FW_PARTICLE_ACCELERATOR', '입자가속기'),
('TXT_KEY_BUILDING_FW_PARTICLE_ACCELERATOR_HELP', '도시의 [ICON_CITIZEN]시민 5명마다 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]증가합니다. 모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]입자 가속기[ENDCOLOR]의 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]증가합니다. 연구단지의 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE][ICON_RESEARCH]문맹에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR]감소합니다. [NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]연구소[ENDCOLOR]가 있어야 건설할 수 있습니다. [NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]파이락사이트 소재 [ENDCOLOR]기업을 설립하면 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]3[ENDCOLOR] 증가합니다. '),
('TXT_KEY_BUILDING_FW_PARTICLE_ACCELERATOR_STRATEGY', '입자가속기를 건설하여 도시의 과학 산출량을 증가시킵니다. 첨단 연구단지의 과학 산출량이 증가합니다.'),
('TXT_KEY_BUILDING_FW_PARTICLE_ACCELERATOR_PEDIA', '입자 가속기는 고에너지 조건에서 물리적 현상을 조사할 수 있는 중요한 과학 장비입니다. 이것은 양자 이론 및 천체 물리학과 같은 분야에 대한 추가 연구에 도움이 됩니다. 입자가속기는 전자나 양성자와 같이 전기를 띤 입자를 강력한 전기장이나 자기장 속에서 가속시켜 큰 운동 에너지를 발생시키는 장치입니다. 우주를 구성하는 4대힘(강력, 약력, 중력, 전자기력)에 대한 규명을 할 수 있게 되었고, 입자가속기를 통해 중력을 만들어낼 수 있는 힉스입자를 발견한 것은 큰 발견입니다. 그리고 이 우주를 이해하는 데 가장 큰 중요한 단서를 제공해줍니다.'),

-- Vertical Farms
('TXT_KEY_BUILDING_FW_VERTICAL_FARM', '수직형 농장'),
('TXT_KEY_BUILDING_FW_VERTICAL_FARM_HELP', '농장, 재배지, 계단식 농장, 간척지, 수경재배지구의 [ICON_FOOD]식량이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]수직형 농장[ENDCOLOR]의 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. 매턴 도시의 [ICON_FOOD]식량의 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR]만큼의 [ICON_RESEARCH]과학을 제공합니다.[NEWLINE][NEWLINE][ICON_RESEARCH]문맹, [ICON_URBANIZATION]도시화에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다. [NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]약국[ENDCOLOR]이 있어야 하고 [COLOR_NEGATIVE_TEXT]제노포자 배양 연구소[ENDCOLOR]가 없어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_VERTICAL_FARM_STRATEGY', '추가 식량과 과학 보너스 산출물로 도시에서 작업한 모든 농장, 테라스, 재배지 및 수경재배시설을 건설하여 산출량을 극대화하십시오.'),
('TXT_KEY_BUILDING_FW_VERTICAL_FARM_PEDIA', '수직 농업은 수직으로 쌓인 층, 수직으로 경사진 표면 및/또는 다른 구조물에 통합된 식품을 생산하는 관행입니다. 수직 농업에 대한 현대적인 아이디어는 모든 환경 요소를 제어할 수 있는 제어 환경 농업(CEA) 기술을 사용합니다. 이러한 시설은 빛의 인공 제어, 환경 제어(습도, 온도, 가스...) 및 관비를 활용합니다. 일부 수직 농장은 인공 조명과 금속 반사경으로 자연광을 강화할 수 있는 온실과 유사한 기술을 사용합니다. 주요 도시의 구조에 통합된 이러한 농장은 기후 및 토양 조건과 무관한 지역 식량 공급원을 제공합니다.'),

-- Bioengineering Complex
('TXT_KEY_BUILDING_FW_BIOFLESH_INDUSTRY', '실험동물연구센터'),
('TXT_KEY_BUILDING_FW_BIOFLESH_INDUSTRY_HELP', '[ICON_RES_ADN_FUNGUS]제노포자 [COLOR_POSITIVE_TEXT]4개[ENDCOLOR]를 제공합니다. 도시의 식량이 [COLOR_NEGATIVE_TEXT]6[ENDCOLOR]감소합니다.[NEWLINE][NEWLINE][ICON_RES_HORSE]말:[ICON_GOLD]골드 +2[NEWLINE][ICON_RES_COW]소:[ICON_GOLD]골드 +2[NEWLINE][ICON_RES_SHEEP]양:[ICON_GOLD]골드 +2[NEWLINE][ICON_RES_DEER]사슴:[ICON_GOLD]골드 +2[NEWLINE][ICON_RES_BISON]들소:[ICON_GOLD]골드 +2[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]유전자공학 연구소[ENDCOLOR]가 있어야 합니다.[NEWLINE][NEWLINE][ICON_RES_HORSE]말이 [COLOR_NEGATIVE_TEXT]3마리[ENDCOLOR] 필요합니다.'),
('TXT_KEY_BUILDING_FW_BIOFLESH_INDUSTRY_STRATEGY', '동물모델·정밀 발효·조직공학 등 생명공학 인프라를 집적하여 제노포자 확보와 상용화를 가속합니다. 동물 자원이 많은 도시에 건설하시면 투자 회수에 유리합니다. 다만 과학적 성과의 이면에는 무수한 실험동물의 희생이라는 아이러니가 뒤따릅니다.'),
('TXT_KEY_BUILDING_FW_BIOFLESH_INDUSTRY_PEDIA', '실험동물센터(비비움·무균/유생물 시설), 정밀 발효·효소 공정, 조직공학·오가노이드 플랫폼, 품질관리(GxP) 라인을 한곳에 통합한 도시형 연구·개발 복합체입니다. 표준화된 사육·배양, in vivo/in vitro 평형시험, 유전·대사 공정 최적화를 통해 성장성·저항성·영양 프로파일이 개선된 모델과 대사 산물을 확보하고, 이를 식품·의약·소재 공정에 연결합니다. 모든 실험은 생물안전·동물윤리 지침(3R 원칙, IACUC 심의)을 준수하도록 설계되지만, 검증 가능한 지식과 치료법을 얻기 위한 과정에서 다수의 개체가 생을 마감하는 아이러니를 내포합니다. 도시 차원에서는 사료·설비 유지로 단기적으로 [ICON_FOOD]식량 여력이 감소할 수 있으나, 동물 자원 밀집 지역에서는 부산물의 고부가가치화와 기술 이전을 통해 경제적 수익과 연구 효율이 증대됩니다. 이 단지는 식량 안보, 의생명 혁신, 바이오소재 개발을 견인하는 핵심 축으로 기능합니다.'),

-- Biofactory
('TXT_KEY_BUILDING_FW_BIOFACTORY', '바이오 공장'),
('TXT_KEY_BUILDING_FW_BIOFACTORY_HELP', '초원과 평원 타일의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]바이오 공장[ENDCOLOR]의 [ICON_FOOD]식량[ENDCOLOR]이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR], [COLOR_PLAYER_NETHERLANDS_BACKGROUND]해양 바이오 산업단지[ENDCOLOR]의 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. 매턴 도시의 [ICON_PRODUCTION]생산의 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR]를 [ICON_FOOD]식량으로 전환합니다.[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]공장[ENDCOLOR]이 있어야 하고 [COLOR_NEGATIVE_TEXT]심층시추공, 지열공장, 해양바이오산업단지[ENDCOLOR]가 없어야 건설할 수 있습니다. [COLOR_NEGATIVE_TEXT]설원[ENDCOLOR]에는 건설할 수 없습니다.'),
('TXT_KEY_BUILDING_FW_BIOFACTORY_STRATEGY', '바이오공장은 생산과 식품 생산량을 증가시킵니다. 도시에 대부분 평원과 초원이 있는 경우 모두 하나의 추가 생산력과 식량에 대한 보너스 생산력을 얻습니다.'),
('TXT_KEY_BUILDING_FW_BIOFACTORY_PEDIA', '산업화 초기, 인류는 유전자 조작 작물과 미생물 발효를 대규모 공정에 접목시켜 식량과 소재 생산을 혁신적으로 확대했습니다. 바이오공장은 토양의 영양순환을 인위적으로 가속화하고 특정 생물군을 대량 배양하여, 혹독한 환경에서도 안정적인 생산 체계를 가능하게 했습니다. 일부 연구자들은 이 과정에서 생명체의 돌연변이가 비정상적으로 가속화된다고 경고했지만, 산업적 효율성은 그러한 우려를 압도했습니다.[NEWLINE]오늘날 바이오공장은 기존 중공업 공정을 폐쇄형 생물공정으로 대체·보완하며, 환경 부담을 줄이고 자원 순환을 촉진하는 산업 거점으로 자리매김했습니다. 미생물군집·재조합 세포·정밀 발효를 통해 단백질, 지방산, 아미노산, 바이오폴리머 전구체 등을 생산하며, 부산물은 혐기성 소화와 가스 발효를 거쳐 에너지와 원료로 재활용됩니다. 이러한 체계는 폐기물 최소화와 탈탄소화를 실현하고, 생명 자체를 생산 도구로 전환한 새로운 산업혁명의 출발점으로 평가받습니다.'),

-- Hydrothermal Factory
('TXT_KEY_BUILDING_FW_HYDROTHERMAL_FACTORY', '해양 바이오 산업단지'),
('TXT_KEY_BUILDING_FW_HYDROTHERMAL_FACTORY_HELP', '연안 및 대양 타일의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]바이오 공장[ENDCOLOR]의 [ICON_FOOD]식량[ENDCOLOR]이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR]증가하고, 해양 바이오 산업단지[ENDCOLOR]의 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. 매턴 도시의 [ICON_PRODUCTION]생산의 [COLOR_POSITIVE_TEXT]5%[ENDCOLOR]를 [ICON_FOOD]식량과 [ICON_RESEARCH]과학으로 각각 전환됩니다.[NEWLINE][NEWLINE][COLOR_YELLOW]해안도시[ENDCOLOR]에만 건설할 수 있습니다. [COLOR_PLAYER_NETHERLANDS_BACKGROUND]항만[ENDCOLOR]이 있어야 하고 [COLOR_NEGATIVE_TEXT]심층시추공, 지열공장, 바이오공장[ENDCOLOR]이 없어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_HYDROTHERMAL_FACTORY_STRATEGY', '공장 기반의 해양 공정 허브로, 연안 타일의 생산 효율을 끌어올리며 생산 일부를 식량·과학으로 전환해 장기 성장을 견인합니다. 해양 탐사선과 시험부두에서 축적한 데이터는 제노포자–금속 계면 연구로 이어지며, 후속 Xen–Al(제노–알루) 공정과 바이오-양자 주조소의 발판이 됩니다. 이 건물은 바이오 공장과 인프라·규정이 충돌하므로 서로 배타적입니다.'),
('TXT_KEY_BUILDING_FW_HYDROTHERMAL_FACTORY_PEDIA', '해양바이오산업단지는 연안·해양에서 확보한 미세조류, 해조류, 해양 미생물의 대사 산물을 산업 규모로 발굴·배양·정제하는 복합 거점입니다. 포토바이오리액터와 발효 라인, 막여과·크로마토그래피 기반의 다운스트림 공정, 화장품·식품용 GMP/HACCP 생산시설을 한곳에 통합하여 시제품부터 양산까지의 파이프라인을 구축합니다. 이곳에서 생산되는 핵심 품목은 기능성 화장품 원료(푸코이단·알긴산·카라기난, 항산화·항염 성분, 마이코스포린계 아미노산의 자외선 차단 모듈), 건강기능식품·영양소(EPA·DHA 등 오메가-3, 해양 폴리페놀), 의약·진단용 효소와 극한효소(저·고온 활성), 친환경 계면활성제와 항오염 생물막 제어소재 등이며, 파일럿 검증–표준화–품질관리 체계를 통해 글로벌 공급망에 연계합니다.[NEWLINE]동시에 단지는 신소재 개발의 전진기지로서 해양 유래 바이오폴리머(PHA/PHB 등 생분해성 플라스틱), 키틴/키토산과 해조류 셀룰로스, 알긴산 에어로젤, 홍합접착단백질 모사 바이오접착제, 저독성 방오 코팅을 비롯한 차세대 바이오매터리얼을 개발·상용화합니다. 영양염 회수·재순환, 이산화탄소 포집·이용, 무방류(Zero-Liquid-Discharge) 공정과 더불어 잘피·해조 ‘묘목장’ 조성 등 블루카본 복원 사업을 병행하여 지속가능성을 확보합니다. 학·연·산 협력과 표준·인증 체계를 통해 지역 경제와 수출 기반을 확장하며, 축적된 데이터와 공정 노하우는 차후의 고도 바이오공정과 첨단 소재 산업을 견인합니다.'),

-- Genejack Facility
('TXT_KEY_BUILDING_FW_GENEJACK_FACILITY', '첨단 바이오 연구소'),
('TXT_KEY_BUILDING_FW_GENEJACK_FACILITY_HELP', '도시 근처에 [ICON_RES_ADN_FUNGUS]제노포자 [COLOR_POSITIVE_TEXT]2개[ENDCOLOR]가 있는 타일이 출현합니다.[NEWLINE][NEWLINE]평원 타일의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR], 초원 타일의 [ICON_FOOD]식량 [COLOR_POSITIVE_TEXT]1[ENDCOLOR], 사막, 설원, 툰드라 타일의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]제노포자배양연구소[ENDCOLOR]와 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]유전자공학 연구소[ENDCOLOR]가 있어야 하고 [COLOR_NEGATIVE_TEXT]지구심층 물리연구소[ENDCOLOR]가 없어야 합니다.'),
('TXT_KEY_BUILDING_FW_GENEJACK_FACILITY_STRATEGY', 'GMO 식량 재배가 좋은 기후가 있는 지역(초원과 평원)에 산출량을 증가시킵니다. '),
('TXT_KEY_BUILDING_FW_GENEJACK_FACILITY_PEDIA', '첨단 바이오연구소는 되었습니다. 토양과 생명체의 관계를 인위적으로 재설계하려는 시도에서 비롯되었습니다. 초기에는 단순히 토양 속 유기체와 미생물을 유전적으로 강화하여 혹독한 환경에서도 영양순환을 촉진하고, 평원·초원·사막·설원·툰드라 같은 다양한 지형에서 산출량을 높이는 데 목적이 있었습니다.[NEWLINE]그러나 연구가 진전되면서 토양 깊숙한 층위에서 나타나는 예상치 못한 반응과 특이한 광물-생체 상호작용이 보고되기 시작했습니다. 일부 학자들은 이를 단순한 돌연변이 가속 현상으로 해석했지만, 다른 이들은 아직 알려지지 않은 근본적 변환 과정이 개입하고 있다고 주장합니다.[NEWLINE]이 과정에서 토양 생태계는 특정 지형의 한계를 넘어 모든 환경에서 그 고유한 성질을 더욱 강화하는 결과를 낳았습니다. 이러한 현상은 여전히 논란이 많지만, 연구소는 토양 개량과 자원 증대에서 뚜렷한 성과를 거두며 각국의 관심을 끌고 있습니다. 동시에 연구자들은 토양 속 미시적 결합 구조에서 생명의 양자적 특성이 물질과 미묘하게 얽혀 있다는 정황을 발견했으며, 이는 앞으로 전혀 새로운 발전 가능성을 열어줄 수 있음을 시사합니다.'),

-- Implant Clinic
('TXT_KEY_BUILDING_FW_IMPLANT_CLINIC', '임플란트 시술소'),
('TXT_KEY_BUILDING_FW_IMPLANT_CLINIC_HELP', '도시의 [ICON_CITIZEN]시민 10명마다 [ICON_CULTURE]문화, [ICON_GOLD]골드, [ICON_PRODUCTION]생산이 각각 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[NEWLINE] 바이오계열 보병을 생산할 때 [ICON_PRODUCTION]생산보너스를 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR] 제공합니다. [ICON_SILVER_FIST]군사 유닛 보급한도가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]화약유닛에 [COLOR_PLAYER_PURPLE]임플란트[ENDCOLOR]승급을 부여합니다. [NEWLINE][NEWLINE][ICON_FOOD]/[ICON_PRODUCTION]낙후에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 감소합니다.[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]병원[ENDCOLOR]이 있어야 하고 [COLOR_NEGATIVE_TEXT]우주선 발사센터[ENDCOLOR]가 없어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_IMPLANT_CLINIC_STRATEGY', '새로이 생산하는 유기체 유닛(클론 트루퍼, 돌연변이, 생체강화 보병, 슈퍼솔져, 바이오 트루퍼)에 생산이 빨라지고, 화약유닛에게 전투력이 증대되는 임플란트 승급을 부여합니다. 도시에 우주선 발사 시설이 있으면 건설할 수 없습니다.'),
('TXT_KEY_BUILDING_FW_IMPLANT_CLINIC_PEDIA', '임플란트 기술이 급속도로 발전함에 따라, 급속히 성장하는 시장의 요구에 부응하는 전문 서비스를 제공하는 임플란트 클리닉이 빠르게 늘어나고 있습니다. 이러한 시설은 기존의 치과 또는 관절 임플란트를 넘어 심장, 폐, 신장, 간과 같은 인공 장기 이식과 정밀 생체 보철물까지 제공합니다. 신경 인터페이스와 나노 크기의 소재가 통합됨에 따라 임플란트는 더 이상 손상된 기능을 회복하는 데 국한되지 않고 인간의 능력을 적극적으로 향상시킬 수 있습니다. 이러한 발전을 통해 사람들은 노화되거나 손상된 신체 부위를 대체하여 더욱 건강하고 장수할 수 있게 되었습니다. 경우에 따라 군사 또는 전문 분야에 특화된 임플란트가 개발되어 개인에게 탁월한 신체적 또는 인지적 능력을 부여하기도 했습니다. 이처럼 임플란트 클리닉은 단순한 의료 시설을 넘어 미래 사회의 장수, 신체 강화, 그리고 생물의학 혁신을 향한 초석으로 자리매김하고 있습니다.'),

-- Network center
('TXT_KEY_BUILDING_FW_NETWORK_BACKBONE', '네트워크 중심지'),
('TXT_KEY_BUILDING_FW_NETWORK_BACKBONE_HELP', '마을, 고유타일시설, 통신기지국, 발전기의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[NEWLINE]모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]연구 서버[ENDCOLOR]의 [ICON_RESEARCH]과학, [COLOR_PLAYER_NETHERLANDS_BACKGROUND]엔터테인먼트 서버[ENDCOLOR]의 [ICON_CULTURE]문화, [COLOR_PLAYER_NETHERLANDS_BACKGROUND]전자상거래 서버[ENDCOLOR]의 [ICON_GOLD]골드, [COLOR_PLAYER_NETHERLANDS_BACKGROUND]클라우드 서버[ENDCOLOR]의 [ICON_PRODUCTION]생산이 각각 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 매턴 도시의 [ICON_CULTURE]문화의 [COLOR_POSITIVE_TEXT]5%[ENDCOLOR]를 [ICON_GOLD]골드와 [ICON_TOURISM]관광으로 각각 전환합니다.[NEWLINE][NEWLINE][ICON_FOOD]/[ICON_PRODUCTION]낙후, [ICON_GOLD]빈곤에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]서버 허브[ENDCOLOR]가 있어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_NETWORK_BACKBONE_STRATEGY', '도시에 네트워크 중심지 서버를 설치하여 각 서버의 산출량을 증대시키십시오.'),
('TXT_KEY_BUILDING_FW_NETWORK_BACKBONE_PEDIA','세계화와 통신 기술의 눈부신 발달은 인류의 생활 방식을 근본적으로 바꾸었습니다. 세계의 명화와 문화유산은 가상세계로 옮겨져 누구나 접속할 수 있게 되었고, 증강·혼합현실을 통해 지구 어디서든 새로운 체험을 누릴 수 있게 되었습니다. 이러한 거대한 데이터 흐름을 안정적으로 뒷받침하기 위해 각지에 대규모 데이터센터가 세워졌고, 그 안에서 수많은 빅데이터 연구가 이루어지며 과학·산업·문화 전반에 새로운 가능성을 열었습니다. 네트워크 중심지는 단순한 데이터 통로가 아니라 전 세계 도시와 사람들을 연결하는 핵심 인프라로 자리 잡았으며, 정보와 아이디어의 흐름을 가속화했습니다. 그러나 한정된 대역폭과 공간 속에서 우선순위를 정해야 하는 과제도 남았고, 미래의 사회는 이 네트워크 중심지를 얼마나 효율적으로 확보·운영하는가에 따라 그 영향력이 달라질 것입니다.'),

-- Biofuel Refinery
('TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY', '바이오연료 정제공장(밀)'),
('TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY_RICE', '바이오연료 정제공장(쌀)'),
('TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY_BANANA', '바이오연료 정제공장(바나나)'),
('TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY_MAIZE', '바이오연료 정제공장(옥수수)'),
('TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY_HELP', '도시의 해당된 [ICON_RES_WHEAT]밀, [ICON_RES_RICE]쌀, [ICON_RES_BANANA]바나나, [ICON_RES_MAIZE]옥수수가 도시에 있어야 합니다. 도시의 [ICON_FOOD]식량이 [COLOR_NEGATIVE_TEXT]4[ENDCOLOR] 감소합니다. [NEWLINE][NEWLINE][ICON_RES_OIL]석유 [COLOR_POSITIVE_TEXT]4개[ENDCOLOR]를 제공합니다.[NEWLINE][NEWLINE]도시에 적어도 하나 이상의 개발된 [COLOR_YELLOW][ICON_RES_WHEAT]밀[ENDCOLOR], [COLOR_YELLOW][ICON_RES_RICE]쌀[ENDCOLOR], [COLOR_YELLOW][ICON_RES_BANANA]바나나[ENDCOLOR],[COLOR_YELLOW][ICON_RES_MAIZE]옥수수[ENDCOLOR]타일이 있어야 건설할 수 있습니다.[NEWLINE][NEWLINE][ICON_RES_WHEAT]밀:[ICON_GOLD]골드 +2[NEWLINE][ICON_RES_RICE]쌀:[ICON_GOLD]골드 +2[NEWLINE][ICON_RES_MAIZE]옥수수:[ICON_GOLD]골드 +2[NEWLINE][ICON_RES_BANANA]바나나:[ICON_GOLD]골드 +2[NEWLINE][NEWLINE]이 건물은 문명당 [COLOR_YELLOW]최대 3개[ENDCOLOR]까지 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY_STRATEGY', '도시는 석유 4개를 얻지만 도시의 일부 식량을 잃게 됩니다.'),
('TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY_PEDIA', '환경오염으로 인한 지구오염과 파괴가 심각해지자, 포르쉐는 E-fuel연구에 박차를 가하고 있습니다. e-연료(E-fuel)은 물(H2O)과 이산화탄소(CO2)에서 생산되는 합성 유체 연료입니다. 생산에 필요한 전기는 재생 에너지(태양광 및 풍력)에서 얻습니다. e-연료는 사실상 연소 엔진의 탄소 중립을 가능하게 해줄 수 있습니다. 엔진의 CO2 배출량이 e-연료 생산을 위해 대기에서 수집한 이산화탄소량에 상응하기 때문입니다. e-연료는 화석 연료를 대체할 수 있기 때문에 이산화탄소 배출량을 즉시 감소시킬 수 있습니다. 가용성에 따라 e-연료도 처음에는 기존 연료에 더해질 수 있습니다. 다른 장점으로는 기존 인프라를 이용한 저장 및 운송 가능성합니다. 또한, 세계 일부 지역에서 풍부하게 발견되는 친환경 전기의 잠재력은 e-연료에 저장되어 장거리 수송이 가능합니다. '),

-- Geothermal Factory
('TXT_KEY_BUILDING_FW_GEOTHERMAL_FACTORY', '지열 공장'),
('TXT_KEY_BUILDING_FW_GEOTHERMAL_FACTORY_HELP', '이 건물이 지어진 도시 3타일 이내의 산 1개마다 [ICON_PRODUCTION]생산과 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]증가합니다. 언덕 타일의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]이 증가합니다. 모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]심층시추공[ENDCOLOR]의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR], 모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]지열 공장[ENDCOLOR]의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR]증가합니다. 매턴 [ICON_PRODUCTION]생산의 [COLOR_POSITIVE_TEXT]5%[ENDCOLOR]는 [ICON_GOLD]골드와 [ICON_PRODUCTION]생산으로 전환합니다.[NEWLINE][NEWLINE]도시 주변 [COLOR_YELLOW]2 타일 이내에 산[ENDCOLOR]이 있어야 건설할 수 있습니다. 도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]공장[ENDCOLOR]이 있어야 하고 [COLOR_NEGATIVE_TEXT]심층 시추공[ENDCOLOR]이나 [COLOR_NEGATIVE_TEXT]바이오공장[ENDCOLOR]이 없어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_GEOTHERMAL_FACTORY_STRATEGY', '도시에 작업 중인 언덕타일과 산의 생산과 골드 산출량을 증가시킵니다.'),
('TXT_KEY_BUILDING_FW_GEOTHERMAL_FACTORY_PEDIA', '지열 발전소는 지하 저장소에서 표면으로 유체를 끌어와 증기를 생성합니다. 이 증기는 전기를 생성하는 터빈을 구동합니다. 지열 발전소 기술에는 건증기, 재증발증기 및 이원주기의 세 가지 주요 유형이 있습니다. 변환 유형은 발전소 설계의 일부이며 일반적으로 지하 유체(증기 또는 물)의 상태와 온도에 따라 달라집니다.'),

-- Borehole
('TXT_KEY_BUILDING_FW_BOREHOLE', '심층 시추공'),
('TXT_KEY_BUILDING_FW_BOREHOLE_HELP', '광산, 유정과 채석장의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]심층 시추공[ENDCOLOR]의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR], 모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]지열 공장[ENDCOLOR]의 [ICON_PRODUCTION]생산[ENDCOLOR]이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. 매턴 [ICON_PRODUCTION]생산의 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR]가 [ICON_GOLD]골드로 전환합니다. [NEWLINE][NEWLINE]도시에 [COLOR_NEGATIVE_TEXT]산이 없어야[ENDCOLOR] 하고, [COLOR_NEGATIVE_TEXT]바이오공장[ENDCOLOR]이나 [COLOR_NEGATIVE_TEXT]지열공장[ENDCOLOR]이 없어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_BOREHOLE_STRATEGY', '도시에서 작업한 모든 광산 및 채석장을 현대화시켜 생산과 골드의 산출량을 증가시킵니다.'),
('TXT_KEY_BUILDING_FW_BOREHOLE_PEDIA', '20세기 들어 가장 깊은 곳은 지하 12km가 넘는 콜라 슈퍼딥 시추공을 비롯해 다양한 심해 시추 작업이 진행됐지만, 21세기에 와서야 첨단 소재와 첨단 장비가 개발되면서 시추공이 대중화됐다. 더 실용적이고 인공적으로 희귀한 광물과 마그마를 끌어올릴 수 있을 만큼 깊이 파낼 수 있습니다. 시추공 노력은 광산과 지열 발전소의 산출량을 향상시켜 풍부한 광물 자원과 에너지를 제공하는 데 도움이 되었습니다.'),

-- URF
('TXT_KEY_BUILDING_FW_ANTIMATTER_RESEARCH', '지구심층 물리연구소'),
('TXT_KEY_BUILDING_FW_ANTIMATTER_RESEARCH_HELP', '이 건물이 지어진 도시 3타일 이내의 산 1개마다 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR], 언덕 타일의 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]이 증가합니다. 사막, 툰드라와 설원 타일의 [CON_GOLD]골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]나노물질제조소[ENDCOLOR]와 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]입자가속기[ENDCOLOR]가 있어야 하고 [COLOR_NEGATIVE_TEXT]첨단 바이오 연구소[ENDCOLOR]가 없어야 합니다. [NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]파이락사이트 소재[ENDCOLOR]기업을 설립하면 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]3[ENDCOLOR] 증가합니다.'),
('TXT_KEY_BUILDING_FW_ANTIMATTER_RESEARCH_STRATEGY', '지구심층 물리연구소를 통해 나노물질을 확보하고, 첨단 물리학의 발전을 통해 양자공학 연구의 기반이 되는 우주 궤도공학, 핵광자공학의 발전을 토대를 만듭니다.'),
('TXT_KEY_BUILDING_FW_ANTIMATTER_RESEARCH_PEDIA', '지구심층 물리연구소는 인류가 지구의 심장부에 도전하는 심층 시추공 실험에서 비롯되었습니다.[NEWLINE]본래는 고온·고압의 지열 환경을 탐구하기 위해 건설되었으나, 이후에는 중성미자, 암흑물질, 양자역학, 우주 물리학까지 아우르는 다학제적 연구 중심지로 발전했습니다.심층 시추 과정에서 드러나는 극한의 지질 환경은 희귀한 지층을 노출시켰고, 과학자들은 그러한 일환으로 이곳에서 막대한 압력과 온도 속에서 형성된 희토류 원소와 나노물질 전구체를 채취할 수 있었습니다.지구심층 물리연구소는 지질학, 에너지 공학, 첨단 소재 과학이 융합되는 최전선으로 자리 잡으며, 미래의 반물질 연구와 양자 기술 혁신을 향한 토대를 마련합니다.'),

-- Launch Facility
('TXT_KEY_BUILDING_FW_LAUNCH_FACILITY', '우주선 발사센터'),
('TXT_KEY_BUILDING_FW_LAUNCH_FACILITY_HELP', '도시의 [ICON_CITIZEN]시민 10명마다 [ICON_RESEARCH]과학, [ICON_PRODUCTION]생산이 각각 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[NEWLINE]공중 유닛을 생산할 때 [ICON_PRODUCTION]생산보너스를 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR]제공하고, 도시에서 생산하는 공중 유닛에 [COLOR_PLAYER_PURPLE]우주선[ENDCOLOR]승급을 부여합니다.[NEWLINE][ICON_FOOD]/[ICON_PRODUCTION]낙후, [ICON_URBANIZATION]도시화에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]감소합니다. [NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]공장[ENDCOLOR]이 있어야 하고, [COLOR_NEGATIVE_TEXT]임플란트 시술소[ENDCOLOR]가 없어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_LAUNCH_FACILITY_STRATEGY', '도시의 생산과 과학 산출량이 증가합니다.'),
('TXT_KEY_BUILDING_FW_LAUNCH_FACILITY_PEDIA', '초창기 로켓은 단순히 대기권 가장자리에 소형 물체를 올리는 수준에 불과했으나, 사람과 대량의 물자를 안정적으로 궤도에 올리기 위해서는 훨씬 더 정교한 시설이 필요했습니다. 우주선 발사센터은 거대한 조립동, 정비·연료·추진체 시스템을 갖춘 복합 단지로, 각국의 과학자와 기술자들이 총동원되는 전략적 거점이었습니다.[NEWLINE]시간이 흐르면서 이러한 발사시설은 진화를 거듭했습니다. 재사용 가능한 발사 플랫폼은 우주 접근 비용을 획기적으로 낮췄고, 고회전 발사체와 전자기 가속기 같은 실험적 기술은 지상에서의 발사 방식을 다변화했습니다. 또한 수직 발사대 외에도 해상·이동식 플랫폼이 운용되며, 우주 발사의 패러다임은 더 이상 국가의 독점적 영역이 아닌 산업 전반으로 확장되었습니다.[NEWLINE]오늘날 우주선 발사센터은 단순한 로켓 발사 기지를 넘어, 항공우주 산업과 과학 연구, 도시 산업 기반까지 동시에 끌어올리는 복합 혁신 거점으로 자리잡았습니다. 이는 인류가 지구 중력의 족쇄를 벗어나 본격적인 우주 문명으로 이행하는 과정에서 반드시 거쳐야 하는 관문이 되었습니다..'),

-- Cloning Lab
('TXT_KEY_BUILDING_FW_CLONE_LAB', '복제 연구소'),
('TXT_KEY_BUILDING_FW_CLONE_LAB_HELP', '[ICON_RES_ADN_FUNGUS]제노포자 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]개를 제공합니다. 무료 [COLOR_YELLOW]클론 트루퍼[ENDCOLOR] 1명 출현합니다. 건설 완료시 도시의 [ICON_CITIZEN]시민이 즉각 [COLOR_POSITIVE_TEXT]2명[ENDCOLOR] 늘어납니다. [NEWLINE][ICON_SILVER_FIST]군사 유닛 보급 한도가 [ICON_CITIZEN]시민의 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR]만큼 증가합니다. [NEWLINE][NEWLINE]도시의 [ICON_GREAT_PEOPLE]위인 출현율이 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]유전자공학 연구소[ENDCOLOR]가 있어야 합니다.'),
('TXT_KEY_BUILDING_FW_CLONE_LAB_STRATEGY', '클론트루퍼를 무료로 얻을 수 있습니다.'),
('TXT_KEY_BUILDING_FW_CLONE_LAB_PEDIA', '복제의 초기 실험은 농장 동물에 대해 수행되었습니다. 인간 복제에는 다양한 윤리적 문제가 있기 때문에 가까운 장래에 복제의 가장 가능성 있는 용도는 동물 무리의 생산성을 높이는 것입니다.'),

-- Information Hub
('TXT_KEY_BUILDING_FW_FEEDSITE_HUB', '정보관리 허브'),
('TXT_KEY_BUILDING_FW_FEEDSITE_HUB_HELP', '도시의 [ICON_VP_WRITER] 작가, [ICON_VP_ARTIST] 음악가,  [ICON_VP_MUSICIAN] 예술가의 [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 걸작 1개마다 [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 전역 [ICON_HAPPINESS_1]행복이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR]증가합니다. [NEWLINE][NEWLINE][ICON_CULTURE]무료, [ICON_URBANIZATION]도시화에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]씩 감소합니다.[NEWLINE][NEWLINE]도시에 [COLOR_NEGATIVE_TEXT]유통 허브, 복합도시 허브, 가상현실 허브[ENDCOLOR]가 없어야 하고 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]서버 허브[ENDCOLOR]가 있어야건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_FEEDSITE_HUB_STRATEGY', '문화 승리를 추구한다면 필요한 강력한 미래시대 건물입니다. 서버 허브가 필요합니다. 도시에 [COLOR_NEGATIVE_TEXT]정보관리 허브, 유통 허브, 시뮬레이션 허브[ENDCOLOR]가 없어야 하고 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]서버 허브[ENDCOLOR]가 있어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_FEEDSITE_HUB_PEDIA', '생성형 AI의 등장은 도시의 정보·문화 유통 속도를 완전히 바꾸어 놓았습니다. 정보관리 허브는 시민의 요청과 상황 데이터를 실시간으로 해석해, 뉴스·공연 안내·전시 해설·교육 콘텐츠를 곧바로 “생성–검수–배포” 파이프라인에 올립니다. 덕분에 지역 축제부터 학술행사까지, 필요한 콘텐츠가 몇 분 만에 편성·현지화되어 각 커뮤니티 피드로 전달됩니다.[NEWLINE][NEWLINE]이 허브는 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]서버 허브[ENDCOLOR]의 연산·저장 자원을 기반으로 동작하며, 생성 모델의 편향을 낮추기 위한 공개 검증·피드백 루프를 갖춥니다. 중앙 집중형 큐레이션은 품질과 안전을 높이지만, 동시에 편집 권한의 집중을 낳습니다. 여러 도시가 정보관리 허브를 통해 “즉시 생성되는 문화”의 이점을 누리는 가운데, 시민 패널과 공공 데이터 규약을 통해 균형을 잡아 나갑니다.'),

-- Simulation Server
('TXT_KEY_BUILDING_FW_SIMULATION_HUB', '가상현실 허브'),
('TXT_KEY_BUILDING_FW_SIMULATION_HUB_HELP', '도시의 아카데미와 연구단지의 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR], [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]  증가합니다. 도시의 [ICON_VP_SCIENTIST] 과학자의 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][ICON_RESEARCH]문맹, [ICON_URBANIZATION]도시화에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]씩 감소합니다.[NEWLINE][NEWLINE]도시에 [COLOR_NEGATIVE_TEXT]정보관리 허브, 복합도시 허브, 유통 허브[ENDCOLOR]가 없어야 하고 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]서버 허브[ENDCOLOR]가 있어야 건설할 수 있습니다. [NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]조르지오 아르미에 기업을 설립하면[ENDCOLOR] [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다.'),
('TXT_KEY_BUILDING_FW_SIMULATION_HUB_STRATEGY', '과학을 강화하고 사이버 유닛 건설 시간을 줄이려는 경우 강력한 미래형 건물입니다. 서버 허브가 필요합니다.'),
('TXT_KEY_BUILDING_FW_SIMULATION_HUB_PEDIA', '가상현실 허브는 생성형 AI로 구동되는 도시급 시뮬레이션 센터입니다. 교통·상하수·전력·교육·보건 등 도시 시스템을 디지털 트윈으로 재현하고, 시민 요구나 정책 제안을 입력하면 수천 개의 대안 시나리오를 즉시 합성합니다. 결과는 몰입형 가상현실로 시연되어, 학생들은 교과 과정을, 연구자는 가설을, 기업은 운영 계획을 실험하고 검증할 수 있습니다.[NEWLINE][NEWLINE]허브는 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]서버 허브[ENDCOLOR]에 연결된 분산 연산망 위에서 돌아가며, 데이터 보호 규약과 모델 감사 절차를 통해 신뢰성을 유지합니다. 생성형 AI 덕분에 “계획–시뮬레이션–수정” 주기가 극단적으로 짧아져, 도시는 빠르게 배우고 더 안전하게 변화합니다. 교육·연구·엔터테인먼트까지 아우르는 이 시설은, 현실 도시의 결정을 투명하게 만들고 시민이 직접 참여하는 합의 형성에 기여합니다.'),

-- Bioconverter (Oil)
('TXT_KEY_BUILDING_FW_BIOCONVERTER_NANO', '나노물질 변환 추출소 (석유)'),
('TXT_KEY_BUILDING_FW_BIOCONVERTER_NANO_HELP',  "[ICON_RES_NANOMAT]나노물질 [COLOR_POSITIVE_TEXT]4개[ENDCOLOR]를 제공합니다. [NEWLINE][NEWLINE][ICON_RES_ADN_FUNGUS]제노포자 [COLOR_NEGATIVE_TEXT]5개[ENDCOLOR] 와 [ICON_RES_OIL]석유 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR]가 필요합니다."),
('TXT_KEY_BUILDING_FW_BIOCONVERTER_NANO_STRATEGY', "석유 기반의 탄소 사슬을 이용해 제노포자를 나노물질로 전환합니다. 효율이 낮아 일부 손실이 발생합니다."),
('TXT_KEY_BUILDING_FW_BIOCONVERTER_NANO_PEDIA', "해양 바이오 연구에서 밝혀진 바에 따르면, 석유의 **탄소 사슬**은 제노포자 단백질·펩타이드와 상호작용하여 금속 반응조(알루미늄 코팅)에서 흡착·정렬을 유도할 수 있습니다.  고주파 자극과 열-용매 조건 하에서 이 복합체는 **탄소 도핑된 나노격자**로 재배열되며,  이 과정에서 일부 격자가 [ICON_RES_NANOMAT] 나노물질로 추출됩니다. [NEWLINE][NEWLINE] 그러나 반응 중 탈수·가스 방출과 구조적 결함이 발생해 손실은 불가피합니다.  따라서 긴급 자원 보충에는 유용하지만, 장기적으론 원천 자원 확보가 더 효율적입니다."),

-- Bioconverter (Coal)
('TXT_KEY_BUILDING_FW_BIOCONVERTER_NANO2', '나노물질 변환 추출소 (석탄)'),
('TXT_KEY_BUILDING_FW_BIOCONVERTER_NANO2_HELP', "[ICON_RES_NANOMAT]나노물질 [COLOR_POSITIVE_TEXT]2개[ENDCOLOR]를 제공합니다. [NEWLINE][NEWLINE][ICON_RES_ADN_FUNGUS]제노포자 [COLOR_NEGATIVE_TEXT]4개[ENDCOLOR]와 [ICON_RES_COAL]석탄 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR]가 필요합니다."),
('TXT_KEY_BUILDING_FW_BIOCONVERTER_NANO2_STRATEGY', "석탄을 촉매로 사용해 제노포자를 나노물질로 전환합니다. 효율은 매우 낮지만, 잉여 석탄을 소모하는 수단이 됩니다."),
('TXT_KEY_BUILDING_FW_BIOCONVERTER_NANO2_PEDIA', "바이오 공장 연구에서 석탄의 고온·고압 반응성이 제노포자의 변이율을 높여 나노물질을 생성할 수 있음이 관찰되었습니다. 그러나 석탄은 불순물이 많고 반응 부산물이 커서 효율이 극도로 낮습니다."),

-- Bioconverter (ADN Fungus)
('TXT_KEY_BUILDING_FW_BIOCONVERTER_ADNF', '합성 제노포자 제조소'),
('TXT_KEY_BUILDING_FW_BIOCONVERTER_ADNF_HELP', "[ICON_RES_ADN_FUNGUS]제노포자 [COLOR_POSITIVE_TEXT]4개[ENDCOLOR]를 제공합니다. [NEWLINE][NEWLINE][ICON_RES_NANOMAT]나노물질 [COLOR_NEGATIVE_TEXT]5개[ENDCOLOR]와 [ICON_RES_ALUMINUM]알루미늄 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR]가 필요합니다."),
('TXT_KEY_BUILDING_FW_BIOCONVERTER_ADNF_STRATEGY', "나노격자와 금속 인터페이스를 이용해 합성 제노포자를 배양합니다.  일부 손실이 불가피합니다."),
('TXT_KEY_BUILDING_FW_BIOCONVERTER_ADNF_PEDIA', "바이오공학 연구는 알루미늄 구조체 위에 정렬된 [ICON_RES_NANOMAT] 나노격자에  유기물질을 주입하면 제노포자의 발현 패턴이 재현될 수 있음을 보여주었습니다. 이 공정은 해양 바이오에서 관찰된 금속-유기 반응성을 인공적으로 복제한 것입니다. [NEWLINE][NEWLINE] 구조체를 만들기 위해 알루미늄이 필요합니다."),

-- Telepresence Hub
('TXT_KEY_BUILDING_FW_TELEPRESENCE_HUB', '휴머노이드 허브'),
('TXT_KEY_BUILDING_FW_TELEPRESENCE_HUB_HELP', '문명에 있는 가상현실 허브 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]개마다 [ICON_RESEARCH]과학 [COLOR_POSITIVE_TEXT]1[ENDCOLOR],정보관리 허브 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]개마다 [ICON_CULTURE]문화 [COLOR_POSITIVE_TEXT]1[ENDCOLOR], 복합도시 허브 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]개마다 [ICON_GOLD]골드 [COLOR_POSITIVE_TEXT]1[ENDCOLOR], 유통허브 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]개마다 [ICON_PRODUCTION]생산이 각각 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]네트워크 중심지[ENDCOLOR]가 있어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_TELEPRESENCE_HUB_STRATEGY', '각 허브의 해당 산출량을 1씩 증가시켜줍니다.네트워크 중심지가 필요합니다.'),
('TXT_KEY_BUILDING_FW_TELEPRESENCE_HUB_PEDIA', '생성형 AI의 확산과 함께 범용 휴머노이드가 상용화되자, 원격현실 허브는 단순한 원격회의 시설을 넘어 “휴머노이드 지상국”으로 진화했습니다. 허브는 작업자·의료진·강사·가이드 등 시민의 프로필을 휴머노이드 몸체와 매칭하고, 시각·청각·촉각 피드백과 균형 제어, 지연 보정, 안전 지오펜스를 통합해 원격 현장 작업을 가능하게 합니다. 공장 라인, 병동, 재난 현장, 관광지까지 휴머노이드 대역을 배치·회수·정비하는 모든 절차가 자동 편성되며, 생성형 AI가 업무 절차·대화 스크립트·교육 시나리오를 즉시 합성합니다.[NEWLINE][NEWLINE]도시가 원격현실 허브를 건설하면 휴머노이드 시스템과 결합한 허브시스템이 활성화되어, 출퇴근 없이 현장에 “체현(embodiment)”하는 원격 교대, 야간 유지보수, 돌발 상황의 신속 투입이 가능해집니다. 이 시설은 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]서버 허브[ENDCOLOR]의 연산·저장망 위에서 동작하며, 기록·감사·권한 관리 규약을 통해 안전과 책임성을 보장합니다. 시민은 이동 시간을 줄이고 더 높은 몰입과 생산성을 얻으며, 도시는 인력 공백과 위험 노출을 최소화한 새로운 일상 운영 모델을 갖추게 됩니다.'),
('TXT_KEY_BUILDING_FW_HUMANOID_HUB_PEDIA', '생성형 AI가 사무·문화 영역에서 “디지털 비서”로 활약하던 시대를 지나, 범용 휴머노이드의 보급으로 도시의 노동은 육체적 영역까지 확장되었습니다. 휴머노이드 허브는 사람과 기계 사이의 체현(embodiment) 거점으로서, 작업자·의료진·교사·가이드의 프로필을 휴머노이드와 매칭하고, 공구 헤드 교체·충전·정비·배치·회수를 표준 절차로 자동 편성합니다. 위험 작업과 야간 유지보수, 재난 대응, 시설 점검 등 사람의 몸이 직접 닿아야 했던 현장은 이제 허브가 스케줄링한 휴머노이드 팀이 대신하거나 보조합니다.[NEWLINE][NEWLINE]이 허브는 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]네트워크 중심지[ENDCOLOR]와 연결된 도심 연산·저장망을 통해 동작하며, [COLOR_PLAYER_NETHERLANDS_BACKGROUND]정보관리 허브[ENDCOLOR]에서 제공하는 지식·지침, [COLOR_PLAYER_NETHERLANDS_BACKGROUND]가상현실 허브[ENDCOLOR]의 디지털 트윈 시뮬레이션, [COLOR_PLAYER_NETHERLANDS_BACKGROUND]유통 허브[ENDCOLOR]의 부품·공급망을 결합해 “계획–시뮬레이션–현장 투입–감사”의 짧은 주기를 구현합니다. 접속 권한, 안전 지오펜스, 기록·감사 루프가 내장되어 공공 서비스부터 산업 현장까지 휴머노이드와 인간이 한 팀으로 일하는 새로운 일상 운영 모델을 가능하게 합니다.'),

-- Distribution Hub
('TXT_KEY_BUILDING_FW_DISTRIBUTION_HUB', '유통 허브'),
('TXT_KEY_BUILDING_FW_DISTRIBUTION_HUB_HELP', '도시의 제조소와 산업단지의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR], [ICON_GOLE]골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 도시의 [ICON_VP_ENGINEER] 기술자의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE] 도시에 건물을 건설할때 [ICON_PRODUCTION]생산보너스를 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR]제공합니다.[NEWLINE][NEWLINE][ICON_FOOD]/[ICON_PRODUCTION]낙후, [ICON_URBANIZATION]도시화에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]씩 감소합니다.[NEWLINE][NEWLINE]도시에 [COLOR_NEGATIVE_TEXT]정보관리 허브, 복합도시 허브, 가상현실 허브[ENDCOLOR]가 없어야 하고 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]서버 허브[ENDCOLOR]가 있어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_DISTRIBUTION_HUB_STRATEGY', '생산력을 높이고 건물 건설 시간을 줄이려는 경우 강력한 미래형 건물입니다. 도시에 [COLOR_NEGATIVE_TEXT]정보관리 허브, 복합도시 허브, 시뮬레이션허브[ENDCOLOR]가 없어야 하고 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]서버 허브[ENDCOLOR]가 있어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_DISTRIBUTION_HUB_PEDIA', '유통 허브는 생산·창고·배송을 하나의 생성 파이프라인으로 묶습니다. 모델은 주문·날씨·행사·원자재 가격을 학습해 조달·배치·동선을 즉시 합성하고, 마이크로 풀필먼트와 드론·자율주행 차량이 “생성된 루트”를 따라 움직입니다. 표준 부품은 사전 조립, 맞춤 부품은 현장형 3D 프린팅으로 처리되어 납기가 분 단위로 단축됩니다.[NEWLINE][NEWLINE]디지털-물류 트윈 위에서 운영되는 이 허브는 병목을 예견해 인력·설비를 재배치하고, 포장 규격·적재 순서·반품 플로우까지 자동 설계합니다. 생성형 AI가 만든 투명한 체인 덕분에 기업은 재고를 줄이고, 시민은 더 빠르고 저렴한 공급망의 혜택을 누리게 됩니다.'),

-- Metroplex Hub
('TXT_KEY_BUILDING_FW_METROPLEX_HUB', '복합도시 허브'),
('TXT_KEY_BUILDING_FW_METROPLEX_HUB_HELP', '도시의 소도시와 마을의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]3[ENDCOLOR] 증가합니다. 도시의 [ICON_VP_MERCHANT] 상인의 [ICON_GOLD] 금이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][ICON_GOLD]골드로 유닛을 구매하거나 건물 건설에 투자하는 비용이 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR] 감소합니다.[NEWLINE][NEWLINE][ICON_GOLD]빈곤, [ICON_URBANIZATION]도시화에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]씩 감소합니다.[NEWLINE][NEWLINE]도시에 [COLOR_NEGATIVE_TEXT]정보관리 허브, 유통 허브, 가상현실 허브[ENDCOLOR]가 없어야 하고 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]서버 허브[ENDCOLOR]가 있어야 건설할 수 있습니다. [NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]시드 무역 주식회사를 설립하면[ENDCOLOR] [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]3[ENDCOLOR] 증가합니다.'),
('TXT_KEY_BUILDING_FW_METROPLEX_HUB_STRATEGY', '복합도시 허브는 골드 생산량에 큰 도움이 되며 도시의 골드 구매 비용을 줄여줍니다.'),
('TXT_KEY_BUILDING_FW_METROPLEX_HUB_PEDIA', '복합도시 허브는 메가시티의 심장부에서 생성형 AI로 교통·상권·주거 패턴을 동시에 합성·조정합니다. 수요 예측과 실시간 피드가 결합되어 노선·신호·혼잡 완화 시나리오가 몇 초 만에 만들어지고, 팝업 상가·행사·야시장 같은 도시 이벤트도 자동 기획·배치됩니다. “프롬프트형 도시 계획” 덕분에 구역은 고정도가 아닌 제안 가능한 상태가 되고, 시민 피드백이 곧 다음 배치의 학습 자료가 됩니다.[NEWLINE][NEWLINE]허브는 규제와 공공성 규칙을 모델에 내장해 안전·소음·환경 한계를 넘지 않도록 스스로 제약을 준수합니다. 이렇게 생성된 도시 운영 시나리오는 교통 체증과 비효율을 줄이고, 문화·상업·여가가 시간대별로 최적 배치되는 “살아 있는 메트로플렉스”를 실현합니다.'),

-- Enrichment Facility
('TXT_KEY_BUILDING_FW_ENRICHMENT_FACILITY', '고에너지 신소재연구소'),
('TXT_KEY_BUILDING_FW_ENRICHMENT_FACILITY_HELP', '[ICON_RES_URANIUM]우라늄 [COLOR_POSITIVE_TEXT]2개[ENDCOLOR]와 [ICON_RES_NANOMAT]나노물질 [COLOR_POSITIVE_TEXT]2개[ENDCOLOR]를 제공합니다.[NEWLINE][NEWLINE]문명의 [ICON_CITIZEN]시민이 최소 [COLOR_POSITIVE_TEXT]125[ENDCOLOR]명 이상이어야 합니다.[NEWLINE]이 건물은 문명당 [COLOR_YELLOW]최대 3[ENDCOLOR]개까지 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_ENRICHMENT_FACILITY_STRATEGY', '우라늄 2개와 나노물질 2개를 제공합니다. 최대 3개까지 지을 수 있습니다. 핵 연료 재처리시설을 건설하려면 문명에 최소 125명의 국가 인구가 필요합니다.'),
('TXT_KEY_BUILDING_FW_ENRICHMENT_FACILITY_PEDIA', '고에너지 신소재연구소는 상온·상압을 넘어 초고온·초고압·강방사 환경까지 아우르는 재료 실험을 수행하는 차세대 소재 플랫폼입니다. 연구 초점은 (예: LK-99 등) 상온 초전도 후보군의 조성 탐색과 계면/박막에서의 임계 거동 규명, 원소 단위 재조합(합금화·도핑·결정결함 공학), 특수 텅스텐 가공(초고융점·고열유속·중성자 차폐용), 및 고엔트로피 합금·메타물질 설계에 맞춰집니다. [NEWLINE][NEWLINE]연구소는 자동화 합성 라인과 물성 측정기를 결합한 ‘자율 실험실’을 운용하여, 생성형 AI의 역문제 설계와 능동 학습으로 조성-공정-구조-물성의 거대한 탐색공간을 빠르게 주사합니다. MBE/CVD/ALD 기반 박막 증착과 이온 주입, 레이저 적층(DED)·분말베드융합(PBF) 같은 금속 적층제조, HPHT(고압고온) 합성 및 급랭 공정으로 준안정 상(相)을 확보하고, 텅스텐-레늄/탄탈계 초내열 합금, SiC·MAX 상(層) 세라믹, 고성능 초전도 인터커넥트 등 응용 후보를 발굴합니다. [NEWLINE][NEWLINE]그 성과는 핵융합로 열차폐·플라즈마 대면재, 우주환경용 구조재, 방사선 내성 전자소자, 초전도 전력·자기부상 시스템 등으로 이어지며, 도시의 에너지·산업·연구 인프라 전반의 성능 한계를 끌어올립니다.'),

-- Mycoprotein Vats
('TXT_KEY_BUILDING_FW_MYCOPROTEIN_VATS', '대체육 공장'),
('TXT_KEY_BUILDING_FW_MYCOPROTEIN_VATS_HELP', '도시의 [ICON_CITIZEN]시민 4명마다 [ICON_FOOD]식량이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 도시의 [ICON_CITIZEN]시민이 증가할 때 사용한 [ICON_FOOD]식량의 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR]를 다음 [ICON_CITIZEN]시민을 위해 사용할 수 있습니다.[COLOR:105:105:105:255](이 효과는 송수로와 중첩됩니다.)[ENDCOLOR][NEWLINE][NEWLINE]전문가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]명이 더이상 [ICON_URBANIZATION]도시화에서 오는 [ICON_HAPPINESS_3]불행을 증가시키지 않습니다.[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]의학 연구소[ENDCOLOR]가 있어야건설할 수 있습니다.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]투케이 푸드 기업을 설립하면[ENDCOLOR] [ICON_FOOD]식량이 [COLOR_POSITIVE_TEXT]3[ENDCOLOR] 증가합니다.'),
('TXT_KEY_BUILDING_FW_MYCOPROTEIN_VATS_STRATEGY', '대체육공장은 도시가 더 빨리 성장하고 빈곤과 불행에 맞서 싸울 수 있도록 도와주는 미래 시대의 건물입니다.'),
('TXT_KEY_BUILDING_FW_MYCOPROTEIN_VATS_PEDIA', '식량 생산을 늘리는 다양한 방법이 수세기에 걸쳐 개발되었지만 일부 지역의 인구 증가는 농장과 수경재배지구의 산출이 증가함에도 요구량이 생산량보다 능가할 위험이 있었습니다. 그 결과 일부 지역 사회는 인간이 소비하기에 적합한 단백질과 섬유질을 합성하는 다양한 공정을 사용하여 영양적으로 완전한 대체 식품의 대량 생산으로 전환했습니다. 그 결과 식품 대체물은 영양가가 충분했지만 종종 실제 식품의 맛과 질감이 부족했습니다. 그럼에도 불구하고 많은 마이코프로테인 식품이 그들이 감당할 수 있는 유일한 영양분이었고, 대체육(인공 단백질)은 수백만 명의 생명을 유지하는 데 도움이 되었습니다.'),

-- Setellite
('TXT_KEY_BUILDING_FW_SPACE_STATION', '우주반사판 전력위성'),
('TXT_KEY_BUILDING_FW_SPACE_STATION_HELP', '건설을 완성하면 [COLOR_POSITIVE_TEXT]15[ENDCOLOR]턴간 [ICON_HAPPINESS_1]국왕경축일을 맞이합니다. 도시를 공습하는 공중 유닛에게 주는 [ICON_STRENGTH]피해가 [COLOR_POSITIVE_TEXT]5[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]전문가 [COLOR_POSITIVE_TEXT]1명[ENDCOLOR]이 더이상 [ICON_URBANIZATION]도시화에서 오는 [ICON_HAPPINESS_3]불행을 증가시키지 않습니다.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]핵무기로 파괴되지 않는 건물입니다.[ENDCOLOR] 도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]우주선 발사센터[ENDCOLOR]가 있어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_SPACE_STATION_STRATEGY', '우주반사판 전력위성은 랑그라주 상업지구, 공업단지, 연구단지와 함께 설치하여 과학, 생산 또는 골드를 높일 수 있습니다.'),
('TXT_KEY_BUILDING_FW_SPACE_STATION_PEDIA', '우주반사판 전력위성은 대형 전개식 거울(반사막)과 집광·지향 제어 장치를 갖춘 궤도 플랫폼으로, 태양광을 지상 수광지대로 반사해 일사량을 보강하거나(겨울·야간·피크 시간대 보정), 궤도 내 발전 모듈에서 전력을 생산해 지상 레크테나로 무선 송전하는 하이브리드 체계를 말합니다. 위성은 태양동기·정지궤도 등에서 목표 지역을 따라 빔을 스케줄링하며, 반사밀도·고도·조사 시간대를 미세 조정해 농업·도시·산업 단지의 수요에 맞추어 에너지를 공급합니다. [NEWLINE][NEWLINE]전개형 반사막과 방열 패널, 위상 배열 지향기, 광학 안전 규약(항공/천문 블라인드 존, 생태 조사 한계치)이 표준으로 포함되며, 도시의 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]우주선 발사센터[ENDCOLOR]·네트워크와 연동되어 운영됩니다. 또한 모듈 확장에 따라 재료·열관리 연구(과학), 궤도 제조·정비(생산), 상업 송전·관광(골드) 등 다양한 역할을 수행해 지상의 전력망을 보조하고 에너지 안보와 회복력을 크게 높입니다.'),

-- Transgenic Nursery
('TXT_KEY_BUILDING_FW_TRANSGENIC_NURSERY', '유전자개조 연구소'),
('TXT_KEY_BUILDING_FW_TRANSGENIC_NURSERY_HELP', '[ICON_CITIZEN]시민이 증가할 때 사용한 [ICON_FOOD]식량의 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR]를 다음 [ICON_CITIZEN]시민을 위해 사용할 수 있습니다.[COLOR:105:105:105:255](이 효과는 송수로와 중첩됩니다.)[ENDCOLOR]도시의 친환경 마을마다 [ICON_PEACE]신앙과 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 유전자개조 유닛을 생산할 때 [ICON_PRODUCTION]생산보너스를 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR] 제공합니다.[NEWLINE][NEWLINE]도시에서 생산하는 [COLOR_POSITIVE_TEXT]생명체계열[ENDCOLOR][COLOR:105:105:105:255](근접유닛, 기마유닛, 화약유닛, 공중정찰유닛)[ENDCOLOR] 유닛에 [COLOR_PLAYER_PURPLE]유전자강화[ENDCOLOR] 승급을 부여합니다.[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]제노포자 배양 연구소, 유전자공학 연구소[ENDCOLOR]가 있어야하고, [COLOR_NEGATIVE_TEXT]무인관리기지, 항공우주 복합시설[ENDCOLOR]이 없어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_TRANSGENIC_NURSERY_STRATEGY', '과학 및 유기체 유닛 생산 속도를 높입니다. 도시에서 생산한 모든 유닛은 약탈 시 행동력이 소모되지 않습니다.'),
('TXT_KEY_BUILDING_FW_TRANSGENIC_NURSERY_PEDIA', '기존 생태계에서 유전적으로 변형된 식물과 동물의 확산에 대한 연구는 유전자 변형 및 공학의 개선과 결합하여 개별 유기체를 돕는 것 이상으로 전체 생태계로 확장하려는 노력을 증가시킵니다. 자연적으로 발생하는 것보다 더 효과적으로 성장하고 더 생산적인 새로운 자급자족 생태계를 개발하기 위한 예비 테스트 환경으로 형질전환 종묘장을 사용했습니다. 일단 만족스러운 결과를 얻으면 이 새로운 생태계가 야생에 도입되어 기존 생태계를 빠르게 대체했습니다.'),

-- Bio Computer
('TXT_KEY_BUILDING_FW_BIOCOMPUTER', '바이오 양자 컴퓨터'),
('TXT_KEY_BUILDING_FW_BIOCOMPUTER_HELP', "모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]바이오 양자 컴퓨터[ENDCOLOR]의 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]5[ENDCOLOR]증가합니다. 도시의 [ICON_FOOD]식량이 [COLOR_NEGATIVE_TEXT]6[ENDCOLOR]감소합니다.[NEWLINE][NEWLINE][ICON_RESEARCH]문맹에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR]감소합니다. [NEWLINE][NEWLINE][ICON_RES_ADN_FUNGUS]제노포자, [ICON_RES_ALUMINUM]알루미늄, [ICON_RES_NANOMAT]나노물질 각 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR]씩 필요합니다.[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]첨단바이오연구소[ENDCOLOR]가 있어야 합니다."),
('TXT_KEY_BUILDING_FW_BIOCOMPUTER_STRATEGY',  "제노포자와 금속·나노격자를 결합한 ‘살아있는 연산체’입니다.  도시의 식량 감소와 경제적 유지비가 크지만 과학 발전을 비약적으로 가속합니다."),
('TXT_KEY_BUILDING_FW_BIOCOMPUTER_PEDIA', "바이오 컴퓨터의 기원은 해양 생태 연구였습니다. 특정 금속에 반응하는 유기물이 식물·조류의 정보 전달을 교란·증폭시키는 현상이 관찰되었고, 이를 매개하는 포자성 복합체가‘제노포자'와의 반응으로 확인되었습니다. [NEWLINE][NEWLINE]연구진은 생명체가 지닌 양자적 정보 흐름(초미시 스케일의 결맞음·에너지 전달 패턴)에 주목했으나,  이를 회로로 전환하는 방법은 난제였습니다. 생명체는 양자적 정보를 무수히 만들어내지만 스스로 계산을 수행하지 못 했습니다. 제노포자의 바이오물질 변이 유발 반응을 통해 생체 분자 네트워크의 전환률과 발현 경로를 바꾸는 **촉매·매개체**로 기능할 수 있었고, 이를 통해 데이터 전환이 가능해졌습니다. [NEWLINE][NEWLINE] 그 결과 알루미늄은 경량성과 전도성을 지닌 **금속 인터페이스**로, 나노물질은 정렬된 **나노격자**로 채택되었습니다. 여기에 제노포자에 의해 변이된 바이오 물질을 주입하자, 금속과 나노격자 사이에 **생체-무기 복합 노드**가 형성되었고, 이 노드의 상태 변화가 전기 신호로 전환되어 연산을 수행할 수 있게 되었습니다. 생명은 그 자체가 반도체가 아니었으나, 알루미늄과 나노물질이 만나 그 역할을 하게 된 것입니다. [NEWLINE][NEWLINE]이 시스템은 고전 실리콘 기반 컴퓨터와 달리 비선형 최적화·적응 학습에 특화되었으며, 이런 구조 탓에 초기 시제품은 제노포자·알루미늄·나노물질을 동시에 요구했습니다. 오늘날 이 바이오 컴퓨터는 차세대 ‘바이오 양자’ 아키텍처로 확장될 전초적 모델로 평가됩니다."),
 
-- Tidal Port
('TXT_KEY_BUILDING_FW_TIDAL_PORT', '해상 지구'),
('TXT_KEY_BUILDING_FW_TIDAL_PORT_HELP', '도시의 해양 타일의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 및 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. 군사 유닛 보급한도가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가하고, 해군 유닛울 생산할 때 [ICON_PRODUCTION]생산보너스를 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR] 제공합니다. 해상 [ICON_INTERNATIONAL_TRADE]교역로의 길이가 [COLOR_POSITIVE_TEXT]50%[ENDCOLOR] 증가하고 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]이 도시에서 다른 문명으로 출발하는 [ICON_INTERNATIONAL_TRADE]해상 교역로가 완료되면 현재 [ICON_CULTURE]문화 및 [ICON_TOURISM]관광 산출량에 기반한 [ICON_TOURISM] 관광을 제공합니다.[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]항구[ENDCOLOR]가 있어야 건설할 수 있습니다.[NEWLINE][NEWLINE][ICON_RES_NANOMAT]나노물질 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR]가 필요합니다. [NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]센타우리 개발 주식회사를 설립하면[ENDCOLOR] [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다.'),
('TXT_KEY_BUILDING_FW_TIDAL_PORT_STRATEGY', '해상 지구는 항구가 필요한 미래 시대 건물입니다. 해상 교역로의 범위와 골드 산출량을 개선하고 해상 타일과 자원의 가치를 높입니다. 또한 해군 유닛의 생산이 증가하고 군사 유닛 보급한도가 증가합니다.'),
('TXT_KEY_BUILDING_FW_TIDAL_PORT_PEDIA', '해안 도시 근처에서 조력 발전소의 건설이 점점 더 일반화되면서, 많은 산업들이 발전소에서 제공하는 에너지를 더 잘 활용하기 위해 발전소에 가까운 부유 플랫폼 위에 설립하기 시작했습니다. 이 플랫폼들은 점점 더 고도화되어, 중심에 조력 발전소를 둔 복잡한 연결 구조물로 발전했습니다. 이러한 상업용 복합 시설은 종종 로 불리며, 해안 및 섬 커뮤니티에서 산업 및 상업 생산의 중요한 원천이었습니다.'),

-- Geofront
('TXT_KEY_BUILDING_FW_DEFENSE_FIELD', '지오프론트'),
('TXT_KEY_BUILDING_FW_DEFENSE_FIELD_HELP', '도시의 [ICON_STRENGTH]방어력이 증가합니다.[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]군사 기지[ENDCOLOR]와 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]전략적 방어시스템[ENDCOLOR]이 있어야 건설할 수 있습니다. [COLOR_NEGATIVE_TEXT]해안 도시[ENDCOLOR]는 건설할 수 없습니다.[NEWLINE][NEWLINE][ICON_RES_NANOMAT]나노물질 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR]가 필요합니다.'),
('TXT_KEY_BUILDING_FW_DEFENSE_FIELD_STRATEGY', '도시의 도시 방어력이 크게 증가합니다.'),
('TXT_KEY_BUILDING_FW_DEFENSE_FIELD_PEDIA', '비해안도시의 방어력을 극도로 강화시킵니다. 지오프론트는 단순한 지하 벙커를 넘어, 거대한 돔 구조와 다층 방벽으로 이루어진 인류 최후의 거점입니다. 지상에서의 공격은 대부분 차단되며, 내부는 도시 전체를 수용할 수 있는 자립형 공간으로 설계되어 있습니다. 본래 NERV의 본부가 자리한 에반게리온 세계관의 지오프론트에서 영감을 얻은 이 시설은, 전면전 상황에서도 도시와 시민들을 심층 지하에서 안전하게 보호하는 궁극의 방어 구조물로 기능합니다.'),

-- Nanomines Field
('TXT_KEY_BUILDING_FW_NANOMINES_FIELD', '나노지뢰밭'),
('TXT_KEY_BUILDING_FW_NANOMINES_FIELD_HELP', '적 해상 유닛 및 승선 유닛이 이 도시의 물 타일에 들어오면 행동력을 모두 소모합니다. 이 도시의 대양 타일에서 턴을 마친 적 유닛은 [COLOR_NEGATIVE_TEXT]5의 피해를 입으며, 지뢰밭이 있다면 총 10의 피해를[ENDCOLOR] 받습니다.[COLOR:105:105:105:255](연안 타일은 적용되지 않음)[ENDCOLOR][NEWLINE][NEWLINE][ICON_RES_NANOMAT][COLOR_YELLOW]해안 도시[ENDCOLOR]에만 건설할 수 있습니다. [NEWLINE][NEWLINE][ICON_RES_NANOMAT]나노물질 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR]가 필요합니다. '),
('TXT_KEY_BUILDING_FW_NANOMINES_FIELD_STRATEGY', '나노지뢰밭은 [ICON_RES_NANOMAT] 나노 물질이 충분한 경우에만 건설할 수 있는 미래 시대 건물입니다. 이 업그레이드된 지뢰밭은 도시 방어력과 체력을 증가시키고 여전히 도시 주변의 적 해군 유닛과 승선 유닛의 이동을 1만큼 감소시킵니다. 또한 도시가 작업한 물 타일 근처에서 턴이 끝날 때마다 적 해군 유닛에게 5 HP의 피해를 줍니다.'),
('TXT_KEY_BUILDING_FW_NANOMINES_FIELD_PEDIA', '나노지뢰밭은 크기는 작지만 기존보다 훨씬 더 치명적입니다. 자체 판단으로 적 함선을 쉽게 탐지할 수 있는 ''스마트'' 두뇌를 갖추고 있어 이러한 ''봇''과의 접촉은 대부분 불가피합니다.'),

-- Drone Hive
('TXT_KEY_BUILDING_FW_DRONE_HIVE', '무인관리기지'),
('TXT_KEY_BUILDING_FW_DRONE_HIVE_HELP', '도시의 발전기마다 [ICON_PRODUCTION]생산과 [ICON_FOOD]식량이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 건물과 모든 로봇 유닛을 생산할 때 [ICON_PRODUCTION]생산보너스를 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR] 제공합니다.[NEWLINE][NEWLINE]도시에서 생산하는 [COLOR_POSITIVE_TEXT]로봇 계열 유닛[ENDCOLOR][COLOR:105:105:105:255](궁수, 기갑, 공성, 헬리콥터 유닛)[ENDCOLOR]에 [COLOR_PLAYER_PURPLE]자동 수리[ENDCOLOR] 승급을 부여합니다.[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]자동생산시설[ENDCOLOR]이 있어야하고, 도시에 [COLOR_NEGATIVE_TEXT]유전자개조 연구소, 항공우주 복합시설[ENDCOLOR]이 없어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_DRONE_HIVE_STRATEGY', '생산 및 로봇 유닛 건설 속도를 높입니다. 자동 수리는 우호적인 땅에 있는 로봇에게 큰 도움이 됩니다.'),
('TXT_KEY_BUILDING_FW_DRONE_HIVE_PEDIA', '자율 로봇과 드론이 점점 보편화되면서 이를 유지하고 모니터링하기 위한 전용 시설의 필요성이 명백해졌습니다. 드론이 홈 베이스로 사용할 수 있는 전문 시설, 흔히 드론 하이브라고 불리는 드론 사용이 많은 도시에 설립되었습니다. 이 전담 지원을 통해 드론은 더 멀리 이동하고 더 안정적으로 작동할 수 있으므로 이전에 인간이 수행했던 일부 작업을 처리하는 데 도움이 될 수 있습니다.'),

-- High Speed Rail Train
('TXT_KEY_BUILDING_FW_HIGHSPEED_RAIL', '자기부상열차'),
('TXT_KEY_BUILDING_FW_HIGHSPEED_RAIL_HELP', '이 도시에서 출발하는 국내 [ICON_INTERNATIONAL_TRADE]교역로의 [ICON_FOOD]식량이 [COLOR_POSITIVE_TEXT]8[ENDCOLOR], [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. 육상 교역로의 길이가 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR] 증가합니다.이 도시에서 다른 문명으로 출발하는 [ICON_INTERNATIONAL_TRADE]육상 교역로가 완료되면 현재 [ICON_CULTURE]문화 및 [ICON_TOURISM]관광 산출량에 기반한 [ICON_TOURISM]관광을 제공합니다.[NEWLINE][NEWLINE][ICON_CAPITAL][ICON_INDUSTRIAL_CONNECTED]수도와 산업 도시 연결이 있어야하고, [COLOR_PLAYER_NETHERLANDS_BACKGROUND]석탄 저장소[ENDCOLOR]가 있어야 건설할 수 있습니다. [NEWLINE][NEWLINE][ICON_RES_NANOMAT]나노물질 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR]가 필요합니다.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]시빌 보석 주식회사를 설립하면[ENDCOLOR] [ICON_GOLDEN_AGE]황금기 점수가 [COLOR_POSITIVE_TEXT]4[ENDCOLOR] 증가합니다.'),
('TXT_KEY_BUILDING_FW_HIGHSPEED_RAIL_STRATEGY', '미래 시대에 도시 생산력과 골드를 크게 향상시킵니다. 건설하기 전에 수도에 철로 타일이 있는 직접적인 철도 연결이 필요하므로 이 건물의 이점을 거두기 전에 철도 인프라에 투자해야 합니다! 석탄저장소가 필요합니다.'),
('TXT_KEY_BUILDING_FW_HIGHSPEED_RAIL_PEDIA', '자기부상 열차(Maglev)는 선로와의 접촉을 없애기 위해 전자기력으로 차량을 부상·안내하고, 선로에 매립된 선형 모터(동기·유도형)로 추진하는 초고속 철도입니다. 대표적 방식은 전자석 흡인형(EMS)과 초전도·영구자석을 이용한 반발형(EDS)이며, 바퀴–레일 마찰이 없으므로 고속에서의 진동과 기계적 마모가 크게 줄어듭니다. 정밀한 궤도 제어와 능동 제어 현가 덕분에 가속·감속 성능이 우수하고, 곡선·구배 설계의 자유도가 높습니다.[NEWLINE][NEWLINE]상용 운행에서는 400km/h급, 시험 운행에서는 500~600km/h급 성능이 입증되었으며, 도시–공항 연계나 200~1,000km 구간에서 항공과 재래식 철도를 대체·보완할 잠재력이 큽니다. 다만 선형 모터가 매립된 전용 가이드웨이와 전력 설비가 필요해 초기 건설비가 높고, 매우 높은 속도에서는 공기저항·소음이 지배적이 됩니다. 그럼에도 자기부상 열차는 낮은 유지관리, 짧은 운행 간격, 높은 신뢰성을 무기로 차세대 대륙 교통의 핵심 후보로 평가받고 있습니다.'),

-- Research Module
('TXT_KEY_BUILDING_FW_RESEARCH_MODULE', '라그랑주-연구단지'),
('TXT_KEY_BUILDING_FW_RESEARCH_MODULE_HELP', '[COLOR_YELLOW][ICON_GREAT_SCIENTIST]위대한 과학자[ENDCOLOR]가 1명 출현합니다. [NEWLINE] 도시의 [ICON_VP_SCIENTIST] 과학자의 [ICON_RESEARCH]과학이[COLOR_POSITIVE_TEXT]3[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][ICON_RESEARCH]문맹, [ICON_URBANIZATION]도시화에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]씩 감소합니다. [NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]핵무기로 파괴되지 않는 건물입니다.[ENDCOLOR] 도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]우주반사판 전력위성[ENDCOLOR]이 있어야 하고 [COLOR_NEGATIVE_TEXT]라그랑주-공학단지, 라그랑주-상업지구[ENDCOLOR]가 없어야건설할 수 있습니다.[NEWLINE][NEWLINE][ICON_RES_NANOMAT]나노물질 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR]가 필요합니다. '),
('TXT_KEY_BUILDING_FW_RESEARCH_MODULE_STRATEGY', '도시의 과학을 향상시키기 위한 연구단지를 건설하십시오.'),
('TXT_KEY_BUILDING_FW_RESEARCH_MODULE_PEDIA', '우주여행과 준궤도 생활권이 상시 운영되자, 라그랑주-연구단지는 지상 규제·기후 리스크에서 벗어난 “궤도 연구 특구”로 자리 잡았습니다. 미세중력·초청정 진공·급격한 열환경을 실험 변수로 활용해 단백질 결정화, 초전도/양자 재료, 복합재 경계면, 방사선 생물학 등 지상에서 구현하기 어려운 시험을 수행합니다. 모듈은 검역·생물안전 구획과 자동화 합성 라인을 갖추고, 지상 연구단지와 실시간 데이터 동기화를 유지합니다.[NEWLINE][NEWLINE]이러한 궤도 연구 특구는 전염병·분쟁·환경오염·재난 정전의 영향을 최소화하며, 궤도 전력·열관리 설비 및 물류 도킹을 통해 24시간 연속 실험이 가능해집니다.'),

-- Engineering Module
('TXT_KEY_BUILDING_FW_ENGINEERING_MODULE', '라그랑주-공학단지'),
('TXT_KEY_BUILDING_FW_ENGINEERING_MODULE_HELP', '[COLOR_YELLOW][ICON_GREAT_ENGINEER]위대한 기술자[ENDCOLOR]가 1명 출현합니다. [NEWLINE] 도시의 [ICON_VP_ENGINEER] 기술자의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]3[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][ICON_FOOD]/[ICON_PRODUCTION]낙후, [ICON_URBANIZATION]도시화에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]씩 감소합니다.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]핵무기로 파괴되지 않는 건물입니다.[ENDCOLOR] 도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]우주반사판 전력위성[ENDCOLOR]이 있어야 하고 [COLOR_NEGATIVE_TEXT]라그랑주-상업지구, 라그랑주-연구단지[ENDCOLOR]가 없어야 건설할 수 있습니다.[NEWLINE][NEWLINE][ICON_RES_NANOMAT]나노물질 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR]가 필요합니다. '),
('TXT_KEY_BUILDING_FW_ENGINEERING_MODULE_STRATEGY', '도시의 생산 산출량을 늘리기 위한 공학단지를 건설하십시오.'),
('TXT_KEY_BUILDING_FW_ENGINEERING_MODULE_PEDIA', '라그랑주-공한단지는 “궤도 공업 지구”로 설계된 준궤도 제조·정비 단지입니다. 진공·무중력 환경을 활용해 초고순도 광섬유(ZBLAN), 웨이퍼 에피택시, 합금 응고 제어, 금속 적층제조 및 초정밀 표면 가공을 수행하며, 위성 서비스·잔해(데브리) 제거·로봇 도킹 등 궤도 공정도 처리합니다. 모듈은 대형 전개식 작업실과 로봇 암, 재료·부품 저장고, 열·전력 버스에 연결된 도크를 갖추고, 지상 산업단지와 표준화된 부품·품질 규격을 공유합니다.[NEWLINE][NEWLINE]지진·폭우·폭염·정전 같은 지상 변수에서 자유로운 공업 지구는 일정과 품질 편차를 줄이고, 장주기의 하이엔드 제조를 안정적으로 뒷받침합니다.'),

-- Comm Module
('TXT_KEY_BUILDING_FW_COMM_MODULE', '라그랑주-상업지구'),
('TXT_KEY_BUILDING_FW_COMM_MODULE_HELP', '[COLOR_YELLOW][ICON_GREAT_MERCHANT]위대한 상인[ENDCOLOR]이 1명 출현합니다. [NEWLINE] 도시의 [ICON_VP_MERCHANT] 상인의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]3[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][ICON_GOLD]빈곤, [ICON_URBANIZATION]도시화에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]씩 감소합니다. [NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]핵무기로 파괴되지 않는 건물입니다.[ENDCOLOR] 도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]우주반사판 전력위성[ENDCOLOR]이 있어야 하고 [COLOR_NEGATIVE_TEXT]라그랑주-공학단지, 라그랑주-연구단지[ENDCOLOR]가 없어야건설할 수 있습니다.[NEWLINE][NEWLINE][ICON_RES_NANOMAT]나노물질 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR]가 필요합니다. '),
('TXT_KEY_BUILDING_FW_COMM_MODULE_STRATEGY', '도시의 부를 늘리기 위한 상업지구를 건설하십시오.'),
('TXT_KEY_BUILDING_FW_COMM_MODULE_PEDIA', '라그랑주-상업지구는 관광·금융·미디어가 결합된 “궤도 상업 지구”입니다. 관측 돔과 체류 캡슐, 초시야 통신/중계 장비, 면세·컨벤션 시설이 결합해 우주여행과 MICE(회의·전시)를 동시에 운영하며, 저지연 직시(LOS) 네트워크로 지상 도시권과 서비스를 연계합니다. 상업 지구는 탄소중립 전력과 폐기물 순환 시스템, 보안·검역·통관 프로토콜을 갖춰 글로벌 고객을 상시 수용합니다.[NEWLINE][NEWLINE]기후 재난·치안·규제 변동에 흔들리기 쉬운 지상 상권과 달리, 준궤도의 상업 지구는 안정적인 전력·환경·보안 하에 새로운 수요(궤도 관광, 실시간 콘텐츠 제작, 데이터 중계)를 창출해 도시 경제를 다변화합니다.'),

-- Aerospace Complex
('TXT_KEY_BUILDING_FW_AEROSPACE_COMPLEX', '항공우주 복합시설'),
('TXT_KEY_BUILDING_FW_AEROSPACE_COMPLEX_HELP', '도시의 수경재배지구마다 [ICON_CULTURE]문화와 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 우주선부품 및 우주 전문화유닛[COLOR:105:105:105:255](항공모함, 전투기, 폭격기, 정찰, 화약 유닛)[ENDCOLOR]을 생산할 때 [ICON_PRODUCTION]생산보너스를 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR]제공합니다. [NEWLINE][NEWLINE]도시에서 생산하는 지상유닛에게 [COLOR_PLAYER_PURPLE]궁중 강하[ENDCOLOR] 승급을 부여합니다. [NEWLINE][NEWLINE]도시의 공중 유닛 정원이 [COLOR_POSITIVE_TEXT]4기[ENDCOLOR] 증가합니다. 도시를 공습하는 공중 유닛에게 주는 [ICON_STRENGTH]피해가 [COLOR_POSITIVE_TEXT]10[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]공항[ENDCOLOR]과 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]우주선 발사센터[ENDCOLOR]가 있어야하고, 도시에 [COLOR_NEGATIVE_TEXT]무인관리기지, 유전자개조 연구소[ENDCOLOR]가 없어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_AEROSPACE_COMPLEX_STRATEGY', '도시의 공중 유닛 수용량을 4 늘립니다. 도시 공습 중 공중 유닛에 대한 추가 [ICON_STRENGTH] 피해에 10을 줍니다. 드론 전투기, 준궤도 폭격기, 우주 폭격기, 전투기의 생산량이 10% 증가합니다. 공항이 필요합니다.'),
('TXT_KEY_BUILDING_FW_AEROSPACE_COMPLEX_PEDIA', '상업화와 우주 개발이 증가함에 따라 항공우주선의 유지 보수 및 서비스 전용 시설이 점점 더 필요해졌습니다. 이러한 전용 시설은 종종 제조 시설과 건물을 결합하여 항공우주선과 궤도를 오가는 사람들에게 서비스를 제공합니다.'),

-- Biogenesis Pod
('TXT_KEY_BUILDING_FW_ECTOGENESIS_POD', '바이오생명체 생산시설'),
('TXT_KEY_BUILDING_FW_ECTOGENESIS_POD_HELP', '문명의 총 군사 유닛 10개마다 도시의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]증가합니다. 바이오생명체유닛을 생산할 때 [ICON_PRODUCTION]생산보너스를 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR]제공합니다.[COLOR:105:105:105:255](상한 200 유닛)[ENDCOLOR] [NEWLINE][NEWLINE]도시에서 생산하는 근접, 기마 및 공중정찰유닛에 [COLOR_PLAYER_PURPLE]유전자개조 승급[ENDCOLOR]을 부여합니다.[NEWLINE][NEWLINE][ICON_FOOD]/[ICON_PRODUCTION]낙후에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR]감소합니다.[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]유전자개조 연구소[ENDCOLOR]가 있어야 건설할 수 있습니다.[NEWLINE][NEWLINE][ICON_RES_ADN_FUNGUS]제노포자 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR]가 필요합니다. '),
('TXT_KEY_BUILDING_FW_ECTOGENESIS_POD_STRATEGY', '도시에서 생산하는 근접, 기마 및 공중정찰유닛에 유전자개조 승급을 부여합니다.'),
('TXT_KEY_BUILDING_FW_ECTOGENESIS_POD_PEDIA', '인공적으로 조작된 유전자 키메라의 생성과 대량 생산이 보편화됨에 따라 작업 전용 시설도 일반화되었습니다. 바이오생명체 생산시설의 배양 과정 중에도 키메라의 유전자개조를 허용하여 다양한 요구 사항을 충족하도록 동적으로 조정할 수 있기 때문에 이러한 시설에서 가장 중요한 구성 요소였습니다. 이러한 시설은 종종 생물학적 변형 센터로서 이중 임무를 수행했습니다. 포드는 나중에 더 정교한 출산 포드에 비해 더 기초적이고 대규모 수정만 수행할 수 있었지만 포드는 인간도 변형하는 데 사용될 수 있기 때문입니다.'),
('TXT_KEY_BUILDING_MIL10_STACK_DUMMY', '밀리터리 x10(더미)'),

-- Mass Digester
('TXT_KEY_BUILDING_FW_MASS_DIGESTER', '무기폐기물재활용소'),
('TXT_KEY_BUILDING_FW_MASS_DIGESTER_HELP', '도시의 [ICON_CITIZEN]시민 2명마다 [ICON_FOOD]식량 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]이 증가합니다. 도시의 타일마다 [ICON_FOOD]식량이 증가합니다. [NEWLINE][NEWLINE]도시의 전문가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR]명이 더 이상 [ICON_URBANIZATION]도시화로 인한 불행을 [ICON_HAPPINESS_3] 유발하지 않습니다.[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]첨단바이오연구소[ENDCOLOR]가 있어야 건설할 수 있습니다.[NEWLINE][NEWLINE][ICON_RES_ADN_FUNGUS]제노포자 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR]가 필요합니다. '),
('TXT_KEY_BUILDING_FW_MASS_DIGESTER_STRATEGY', '소유한 인구와 영토가 많을수록 대량의 식량을 얻을 수 있습니다. 도시의 밀집화에 따른 불행이 감소합니다.'),
('TXT_KEY_BUILDING_FW_MASS_DIGESTER_PEDIA', '도시가 성장함에 따라 몇몇 도시는 수요량이 공급가능한 식량 수치를 능가하기 시작했습니다. 과거 역사에서 이것은 인구 증가의 한계였지만, 무기 폐기물을 반유기성 소화 가능한 식품으로 전환하는 연구는 이 행성에서 이 한계를 극적으로 높이는 해결책을 입증했습니다. 여러 콜로니 연구소에서 동시에 개발한 나노 촉매 공정과 유전자 조작된 혐기성 소화조의 혼합은 생합성을 통해 기본 단백질을 형성하기 위해 결합될 수 있는 특정 아미노산을 회수합니다. 공정의 마지막 단계는 고세균 프로테아제를 첨가하여 펩타이드 결합의 가수분해를 유발하여 상대적으로 맛은 없지만 영양가 있는 페이스트를 최종 제품으로 생성하는 것입니다. 이 공정의 원료에는 대부분의 플라스틱, 고무, 유기 리간드를 포함하는 유기 금속 화합물, 알켄 유래 폴리머 및 일반적으로 사용 후 폐기되는 기타 여러 재료가 포함됩니다. 원핵생물 고세균은 이 행성에서 상당히 흔하며 종종 제노매스 농도와 관련하여 발견됩니다. 원료에서 단백질 페이스트로의 속도는 주로 생합성 단계로 인해 적당히 느립니다. 연구는 계속해서 프로세스를 간소화하고 가속화합니다. 이렇게 단백질 페이스트를 생산한 산업단지를 ''대량 소화기''라고 부르는 데는 분명한 이유가 있다. 많은 시민들이 여전히 유기농 식품을 선호하지만, 많은 도시에서 단백질 페이스트의 사용이 보편화되었으며 다양한 트랜스휴먼 운동에 의해 촉진되기까지 합니다.'),

-- Bioenhancement Centre
('TXT_KEY_BUILDING_FW_BIOMOD_TANK', '바이오강화 센터'),
('TXT_KEY_BUILDING_FW_BIOMOD_TANK_HELP', '문명의 총 군사 유닛 10개마다 [ICON_GREAT_GENERAL]위대한 장군, [ICON_GREAT_ADMIRAL]위대한제독의 점수가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR], [ICON_GOLDEN_AGE]황금기 점수가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR]씩 증가합니다.[COLOR:105:105:105:255](상한 200 유닛)[ENDCOLOR][NEWLINE]클론 트루퍼, 생체강화 보병, 슈퍼솔져, 바이오 트루퍼 유닛을 생산할 때 [ICON_PRODUCTION]생산보너스를 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR] 제공합니다.[NEWLINE][NEWLINE]도시에서 생산하는 화약 유닛에 [COLOR_PLAYER_PURPLE]바이오모드 승급[ENDCOLOR]을 부여합니다.[NEWLINE][NEWLINE][ICON_CULTURE]무료에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 감소합니다. [NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]임플란트 시술소[ENDCOLOR]와 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]제노포자 배양 연구소[ENDCOLOR]가 있어야 건설할 수 있습니다.[NEWLINE][NEWLINE][ICON_RES_ADN_FUNGUS]제노포자 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR]가 필요합니다.'),
('TXT_KEY_BUILDING_FW_BIOMOD_TANK_STRATEGY', '클론트루퍼, 생체강화 보병, 바이오트루퍼, 슈퍼솔져의 생산을 증가시킵니다. 근접, 기마, 화약, 정찰 유닛은 바이오모드 승급을 부여받습니다. 임플란트 시술소가 필요합니다.'),
('TXT_KEY_BUILDING_FW_BIOMOD_TANK_PEDIA', '임플란트 시술소는 어느 정도의 생체 변형을 허용했지만 더 광범위한 적응에는 더 정교한 장비가 필요했습니다. 바이오 강화 시설은 더 광범위한 인체 변형을 수행했으며, 일반적으로 대상을 서스펜션 탱크에 담그어 더 복잡한 임플란트 및 전신 변형을 수행할 수 있도록 했습니다. 일반적인 바이오 모드에는 단기 재생 기능을 제공하는 자극제와 전투 능력을 향상시키는 강화 모드가 포함됩니다.'),
('TXT_KEY_BUILDING_DUMMY_BIOMOD_POP_DUMMY', '바이오모드 인구(더미)'),

-- Cyberclinic
('TXT_KEY_BUILDING_FW_CYBERCLINIC', '신경양자치료시스템'),
('TXT_KEY_BUILDING_FW_CYBERCLINIC_HELP', '[ICON_GREAT_SCIENTIST]위대한 과학자의 출현율이 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR] 증가합니다. [NEWLINE]모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]의학연구소[ENDCOLOR]와 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]휴머노이드 허브[ENDCOLOR]의 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]3[ENDCOLOR] 증가합니다. 전역 [ICON_HAPPINESS_1]행복이 [COLOR_POSITIVE_TEXT]4[ENDCOLOR]증가합니다. [NEWLINE][NEWLINE]레비아탄,호버탱크, 크롤러 SAM 발사대를 생산할 때 [ICON_PRODUCTION]생산보너스를 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR] 제공합니다.[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]의학연구소[ENDCOLOR]와 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]휴머노이드 허브[ENDCOLOR]가 있어야 건설할 수 있습니다.[NEWLINE][NEWLINE][ICON_RES_NANOMAT]나노물질 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR]가 필요합니다.'),
('TXT_KEY_BUILDING_FW_CYBERCLINIC_STRATEGY', '임플란트연구소와 병원의 과학 산출량과 사이버 유닛(사이버잠수함, 사이버SAM, 호버탱크) 생산력을 크게 향상시킵니다.'),
('TXT_KEY_BUILDING_FW_CYBERCLINIC_PEDIA', '양자 치료기는 전통적 수술·의약을 넘어, 양자 응집 영상과 얽힘 단층 촬영으로 인체를 분자·세포 단위까지 비침습적으로 스캔한 뒤 즉시 치료 프로토콜을 합성하는 차세대 의료 설비입니다. 펨토초 펄스와 정밀 자장장을 이용해 종양·감염·미세 출혈을 표적 분해하고, 프로그램된 엑소좀·나노의료군이 손상 조직의 단백질 접힘을 복구하며 유전자 편집으로 선천성 결함과 돌연변이를 교정합니다. 장기 이식 없이도 조직을 흉터 없이 재생하고, 방사선·독소 피해를 빠르게 역전시킬 수 있습니다.[NEWLINE][NEWLINE]신경 양자치료기는를 중심으로 삼아, 신경 보철·감각 확장 같은 사이버네틱스 개선과 정밀 재생의학을 통합 제공합니다. 트리아지 AI가 우선순위를 배정하고, 진단–치료–회복이 한 실내에서 연속 수행되므로 대기 시간이 극적으로 줄어듭니다. 기록·감사·동의 절차를 통해 오남용을 방지하는 한편, 응급 재난 시에는 이동형 장치로 현장 배치가 가능하여 도시 보건의 회복력과 형평성을 크게 끌어올립니다.'),

-- Digital Police
('TXT_KEY_BUILDING_FW_DIGITAL_POLICE', '빅브라더 관제소'),
('TXT_KEY_BUILDING_FW_DIGITAL_POLICE_HELP', '[ICON_SPY] 도시 보안이 +10 증가하고, [ICON_CITIZEN] 시민 둘마다 1씩 추가로 증가합니다.[NEWLINE][NEWLINE][ICON_FOOD]/[ICON_PRODUCTION]낙후, [ICON_GOLD] 빈곤, [ICON_RESEARCH] 문맹, [ICON_CULTURE]무료에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.'),
('TXT_KEY_BUILDING_FW_DIGITAL_POLICE_STRATEGY', '빅브라더 관제소(디지털 치안 시스템)는 적 스파이가 도시를 해칠 수 있는 속도를 늦춥니다. 빅브라더 관제소(디지털 치안 시스템)을 구축하기 위해서는 도시에 국제형사경찰기구가 있어야 합니다.'),
('TXT_KEY_BUILDING_FW_DIGITAL_POLICE_PEDIA', '빅브라더 관제소(디지털 치안 시스템)는 가상세계의 특수한 공간으로, 인공지능과 인간 사용자 모두의 데이터를 보호하는 역할을 하는 고도로 진화된 보안 시스템입니다. 이 건물은 일반적인 경찰서를 넘어서, 물리적 세계와 디지털 세계 양쪽 모두에서 범죄를 예방하고 처벌하는 기능을 수행합니다. 빅브라더 관제소의 핵심 기능은 두 가지입니다. 첫째, 고급 인공지능 기술을 이용하여 가상 세계에서의 프로그램 해킹을 막습니다. 이를 통해 인공지능이나 프로그램의 부정적인 조작을 방지하고, 사용자가 가상 세계에서 안전하게 활동할 수 있도록 보장합니다. 둘째, 디지털 경찰서는 인간 사용자의 개인정보 보호에도 특화되어 있습니다. 가상 세계에 연결된 사용자의 정보가 노출되거나 불법적으로 사용되는 것을 방지하기 위해, 다양한 보안 방법을 사용하여 사용자의 데이터를 안전하게 보호합니다. 이러한 보안 방법에는 강력한 암호화, 실시간 모니터링, 그리고 사용자의 정보를 위협하는 활동을 자동으로 탐지하고 차단하는 고급 시스템이 포함됩니다. 빅브라더 감시국은 그 자체로도 훌륭한 보안 시스템이지만, 더불어 사용자들이 자신의 데이터를 안전하게 관리하고 보호하는 데 필요한 교육도 제공합니다. 사용자가 자신의 정보를 어떻게 안전하게 유지할 수 있는지, 해킹 시도를 어떻게 인식하고 대응할 수 있는지에 대한 지식을 배울 수 있는 프로그램이 구비되어 있습니다.'),

-- Fusion Reactor
('TXT_KEY_BUILDING_FW_FUSION_PLANT', '핵융합 반응로'),
('TXT_KEY_BUILDING_FW_FUSION_PLANT_HELP', '도시의 모든 전문가들의 [ICON_PRODUCTION]생산, [ICON_GOLD]골드, [ICON_RESEARCH]과학, [ICON_CULTURE]문화 산출량이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 도시의 [ICON_PRODUCTION]생산을 다른 산출량으로 전환할 때의 효율성이 [COLOR_POSITIVE_TEXT]20%[ENDCOLOR] 증가합니다.도시의 [ICON_GREAT_PEOPLE]위인 출현율이 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]공장[ENDCOLOR]과 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]지구심층 물리연구소[ENDCOLOR]가 있어야 건설할 수 있습니다. [NEWLINE][NEWLINE][ICON_RES_URANIUM]우라늄 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR]와 [ICON_RES_NANOMAT]나노물질 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR]가 필요합니다.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]헥손 정유 기업을 설립하면[ENDCOLOR] [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]3[ENDCOLOR] 증가합니다.'),
('TXT_KEY_BUILDING_FW_FUSION_PLANT_STRATEGY', '도시는 [ICON_PRODUCTION]생산을 수익으로 전환하는 데 20% 더 효율적입니다.[NEWLINE][NEWLINE] 이 도시에서 [ICON_GREAT_PEOPLE] 위인 비율이 25% 증가하고 모든 전문가가 [ICON_PRODUCTION]생산 +1, [ICON_GOLD]골드를 생성합니다. , [ICON_RESEARCH]과학, [ICON_CULTURE]문화.[NEWLINE][NEWLINE]1 [ICON_RES_URANIUM]우라늄이 필요합니다.'),
('TXT_KEY_BUILDING_FW_FUSION_PLANT_PEDIA', '핵융합 발전의 성공적인 개발은 인간의 성장과 노력을 지속하는 데 도움이 되는 상대적으로 깨끗한 다량의 에너지원에 대한 잠재력을 제공합니다. 핵융합발전을 실현하려면 몇 가지 해결해야 할 문제가 있었습니다. 먼저 핵융합발전에 필요한 원료인 중수소나 삼중수소를 확보하는 것이었는데, 이 원료들은 바닷물에서 무한정 구할 수 있었습니다. 그 다음 문제가 되는 것은 수천°C의 온도로 가열해 만든 플라즈마 상태의 수소원자핵을 고주파를 이용해 1억°C 이상의 초고온 상태로 만드는 것이었습니다. 두 개의 원자핵을 융합하려면 원자핵 사이에 존재하는 쿨롱힘(coulomb force)에 의한 반발력을 이겨낼 수 있는 환경이 조성되어야 하는데, 이를 위해서는 대략 108°C보다 높아야 중수소와 삼중수소가 플라즈마(plasma) 상태로 바뀌어 핵융합 반응이 자연적으로 발생하기 때문이다. 하지만 그렇게 높은 온도를 견디는 구조물 만들 수 있는 재료물질이 없었는데, AI 기술발전과 신재료물질, 상온 초전도체를 연구하면서 신물질에 기본이 되는 금속 강화 아다만티움을 연구에 성공하게 되었습니다. 원래는 지구상의 물질 중 1억°C나 되는 온도를 견딜 수 있는 물질은 존재하지 않기 때문이다. 따라서 플라즈마가 자기적 성질을 띠는 점을 착안하여, 도넛 구조의 전자기물질을 통해 형성된 인공자기장에 플라즈마를 가두고 에너지를 생산하는 토카막(Tokamak)이 개발이 성공적으로 착수되었고, 이는 핵융합 반응로를 상용화게 하게 만들었습니다.'),

-- Moon Base
('TXT_KEY_BUILDING_FW_MOON_BASE', '달 기지'),
('TXT_KEY_BUILDING_FW_MOON_BASE_HELP', '도시의 [ICON_CITIZEN]시민 10명 마다 [ICON_GOLD]골드, [ICON_PRODUCTION]생산, [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]씩 증가합니다. 전역[ICON_HAPPINESS_1]행복이 [COLOR_POSITIVE_TEXT]3[ENDCOLOR]증가합니다.  문명에 있는 모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]우주반사판 전력위성[ENDCOLOR]과 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]핵융합 반응로[ENDCOLOR]의 산출량이 증가합니다.[NEWLINE][NEWLINE][ICON_RES_NANOMAT]나노물질 [COLOR_POSITIVE_TEXT]7개[ENDCOLOR]를 제공합니다. [NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]핵무기로 파괴되지 않는 건물입니다.[ENDCOLOR] 도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]나노물질[ENDCOLOR]와[COLOR_PLAYER_NETHERLANDS_BACKGROUND]우주선 발사센터[ENDCOLOR]가 있어야 건설할 수 있습니다. 문명당 1개만 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_MOON_BASE_STRATEGY', '과학, 생산 및 금을 증가시키는 최종 국가 불가사의는 각 융합 식물에 대한 혜택입니다.'),
('TXT_KEY_BUILDING_FW_MOON_BASE_PEDIA', '21세기 인류의 야망 중 하나는 달에 영구적인 정착지를 건설하는 것이었습니다. 그러한 정착지는 달과 다른 천체 연구를 위한 훌륭한 연구 플랫폼을 제공할 뿐만 아니라 핵융합로에서 사용할 수 있는 삼중수소와 같은 거의 무한한 물질 공급원을 제공할 것입니다.'),

-- Orbital Habitat
('TXT_KEY_BUILDING_FW_ORBITAL_HABITAT', '우주궤도 식량재배시설'),
('TXT_KEY_BUILDING_FW_ORBITAL_HABITAT_HELP', '[ICON_VP_SCIENTIST] 과학자, [ICON_VP_ENGINEER] 기술자, [ICON_VP_MERCHANT] 상인 1명마다 [ICON_FOOD]식량이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]씩 증가합니다. 라그랑주-연구단지의 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR], 공학단지의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR], 상업지구의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR]씩 증가합니다. [NEWLINE][NEWLINE]도시에 건물을 건설할때 [ICON_PRODUCTION]생산 보너스를 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR] 제공합니다.[NEWLINE][NEWLINE]전문가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR]명이 더이상 [ICON_URBANIZATION]도시화에서 오는 [ICON_HAPPINESS_3]불행을 증가시키지 않습니다.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]핵무기로 파괴되지 않는 건물입니다. [COLOR_PLAYER_NETHERLANDS_BACKGROUND]항공우주 복합시설[ENDCOLOR]이 있어야 건설할 수 있습니다. [NEWLINE][NEWLINE][ICON_RES_NANOMAT]나노물질 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR]가 필요합니다.'),
('TXT_KEY_BUILDING_FW_ORBITAL_HABITAT_STRATEGY', '생산하기 위해 매우 비용이 많이 들지만 우주궤도 식량재비시설을 통해 최대 인구 수를 크게 확장합니다.'),
('TXT_KEY_BUILDING_FW_ORBITAL_HABITAT_PEDIA', '인공 식량 재배의 궁극적인 방법인 우주궤도 식량재시설을 건설하여 우주에서 완전히 자립적인 농업 환경을 구축합니다. 대부분의 초기 라그랑주 시설은 엄청난 비용을 들여 행성 표면에서 운반되는 식량 공급에 의존했지만, 궤도 서식지는 라그랑주 거주시설에서 거의 자급자족할 수 있도록 허용하여 그곳에서 일하는 사람들이 필요로 하는 식량의 대부분을 재배했습니다. 초기 서식지에서 생산된 식품은 마이코프로테인 보충제보다 조금 나았지만 시간이 지남에 따라 수경재배 및 수경재배 기술을 사용하여 승무원을 유지하는 데 도움이 되는 다양한 채소와 식물을 재배하면서 점점 더 발전되고 정교해졌습니다.'),

-- Terraforming Station
('TXT_KEY_BUILDING_FW_TERRAFORMING_STATION', '유전자 가속 센터'),
('TXT_KEY_BUILDING_FW_TERRAFORMING_STATION_HELP', '생명공학센터의 [ICON_RESEARCH]과학과 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR]증가합니다.[NEWLINE][NEWLINE][ICON_RES_ADN_FUNGUS]제노포자[COLOR_POSITIVE_TEXT]3개[ENDCOLOR]를 제공합니다.[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]유전자개조 연구소[ENDCOLOR]가 있어야하고, [COLOR_NEGATIVE_TEXT]중앙 통제 센터, AI네트워크[ENDCOLOR]가 없어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_TERRAFORMING_STATION_STRATEGY', '생명공학센터의 산출량을 증가시킵니다. 도시 주변 타일에 제노포자가 출현합니다.'),
('TXT_KEY_BUILDING_FW_TERRAFORMING_STATION_PEDIA', '유전자 가속 센터는 유전자 연구를 집중적으로 수행하고, 그 결과를 활용하여 다양한 생명공학 및 유전학 프로젝트를 가속화하는 공간입니다. 이 건물은 최첨단의 연구 설비와 훌륭한 과학자들을 포함하여, 게임 내에서 유전자 연구를 돕는 데 필요한 모든 자원을 제공합니다. 유전자 가속 센터의 핵심 기능 중 하나는 유전자 시퀀싱과 분석입니다. 이 곳에서, 과학자들은 다양한 생명체의 유전체를 해독하고, 이를 통해 새로운 유전자를 찾아내거나, 이미 알려진 유전자의 기능을 더 깊게 이해하는 데 도움을 줍니다. 이런 정보는 새로운 생명공학 기술의 개발이나, 질병의 원인과 치료법을 찾는 데 매우 중요합니다.또한, 유전자 가속 센터에서는 유전자 수정 기술도 연구합니다. 이 기술을 통해, 과학자들은 생명체의 유전자를 편집하여 특정 특성을 강화하거나, 원치 않는 특성을 제거할 수 있습니다. 이러한 유전자 수정은 식물이나 동물을 개량하거나, 질병을 치료하는 데 활용될 수 있습니다.[NEWLINE][NEWLINE]유전자 가속 센터는 유전자 연구를 향상시키는 데 도움을 주는 중추적인 역할을 합니다. 그것은 연구를 수행하는데 필요한 기계와 장비, 그리고 유전자 연구에 특화된 전문적인 인력을 제공함으로써, 유전자 연구의 진척을 촉진하고, 그 결과를 게임 내 다른 활동에 활용할 수 있도록 합니다. 유전자 가속 센터는 유전학의 가장 앞선 연구를 수행하고, 이를 통해 게임 내의 생명과 과학의 이해를 향상시키는 역할을 수행합니다.'),

-- Photosystems
('TXT_KEY_BUILDING_FW_PHOTOSYSTEMS', '광화학반응'),
('TXT_KEY_BUILDING_FW_PHOTOSYSTEMS_HELP', '도시 근처에 [ICON_RES_ADN_FUNGUS]제노포자 [COLOR_POSITIVE_TEXT]4개[ENDCOLOR]가 있는 타일이 출현합니다. [NEWLINE][NEWLINE]숲 타일의 [ICON_FOOD]식량이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR], 정글 타일의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 습지 타일의 [ICON_FOOD]식량 및 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.'),
('TXT_KEY_BUILDING_FW_PHOTOSYSTEMS_STRATEGY', '유지비용은 비싸지만 제노포자를 얻고 도시에 식량, 생산, 과학 및 문화를 제공하십시오. 생성된 자원을 사용하여 더 많은 돌연변이 유닛을 만드십시오.'),
('TXT_KEY_BUILDING_FW_PHOTOSYSTEMS_PEDIA', '이 행성의 원시 속씨식물에서 광합성에 관여하는 단백질 복합체를 이해하는 것은 헌신적인 소규모 과학자 그룹의 목표가 되었습니다. 수십 년간의 광화학 연구 끝에 그들은 조류와 시아노박테리아의 틸라코이드 막이 페레독신과 퀴논의 주입에 의해 자극될 수 있음을 발견했습니다. 유전 기술을 사용하면 이 특성을 광범위한 식물군으로 옮길 수 있습니다. 광화학시스템 I과 II 모두의 효율성은 제어된 환경 실험실(growlabs)에서 기하급수적으로 증가할 수 있으며, 그 결과 식량/생산 및 약리 작물의 성장률과 수확량이 극적으로 증가합니다. 자생 광하학계에 대한 연구는 계속되고 있으며, 이제 지역 식물의 광합성 과정에서 페오피틴과 카로티노이드의 작용에 관심이 집중되고 있습니다.'),

-- Birthing Pods
('TXT_KEY_BUILDING_FW_BIRTHING_PODS', '인공 출산 시설'),
('TXT_KEY_BUILDING_FW_BIRTHING_PODS_HELP', '건설 완료시 도시의 [ICON_CITIZEN]시민이 [COLOR_POSITIVE_TEXT]3명[ENDCOLOR]이 즉시 늘어납니다. [ICON_CITIZEN]시민이 증가할 때 사용한 [ICON_FOOD]식량의 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR]를 다음 [ICON_CITIZEN]시민을 위해 사용할 수 있습니다. [COLOR:105:105:105:255](이 효과는 송수로와 중첩됩니다.)[ENDCOLOR] 전역 [ICON_HAPPINESS_1]행복이 [COLOR_POSITIVE_TEXT]3[ENDCOLOR]증가합니다. [NEWLINE][NEWLINE]전문가 [COLOR_POSITIVE_TEXT]1명[ENDCOLOR]이 더이상 [ICON_URBANIZATION]도시화에서 오는 [ICON_HAPPINESS_3]불행을 증가시키지 않습니다.[NEWLINE][NEWLINE] 도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]유전자공학 연구소[ENDCOLOR]와 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]병원[ENDCOLOR]이 있어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_BIRTHING_PODS_STRATEGY', '인공 출산 시설은 도시가 크기를 늘리는 데 필요한 [ICON_FOOD]식량의 양을 수확량을 높이는 최종 건물입니다. 건설 시 도시에 시민이 3명이 즉시 증가합니다.'),
('TXT_KEY_BUILDING_FW_BIRTHING_PODS_PEDIA', '체외에서의 인간 유전자 수정 과정이 일반화됨에 따라 인공적인 배란 과정도 같은 추세를 보였습니다. 점차 많은 아이들이 인공 자궁에서 태어나게 되어, 부모들은 출산의 신체적인 고통을 피하게 되었으며, 동시에 임신 과정을 지속적으로 모니터링하여 어떠한 합병증도 피할 수 있게 되었습니다. 결국, 이러한 시설들은 키메라를 생성하는데 사용되는 외배성 캡슐과 유사한 ''출산 캡슐''이라는 전용 시설로 발전하게 되었습니다. 하지만 외배성 캡슐과는 달리, 이러한 시설들은 유아들을 위한 유전적, 의료적 치료 전반을 제공할 수 있었으며, 많은 지역에서 아이를 출산하는 선호 방식으로 간주되었습니다.'),

-- AI Network
('TXT_KEY_BUILDING_FW_AI_NETWORK', 'AI 네트워크'),
('TXT_KEY_BUILDING_FW_AI_NETWORK_HELP', '도시 근처의 방어 시설의 [ICON_RESEARCH]과학과 [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE] 도시의 [ICON_GREAT_PEOPLE]위인 출현율이 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]무인관리기지[ENDCOLOR]가 있어야하고, [COLOR_NEGATIVE_TEXT]중앙 통제 센터, 유전자 가속 센터[ENDCOLOR]가 없어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_AI_NETWORK_STRATEGY', '도시의 방어와 관련된 모든 시서을 개선합니다. 도시 HP/방어 및 행복을 향상시킵니다.'),
('TXT_KEY_BUILDING_FW_AI_NETWORK_PEDIA', '인공 지능의 출현으로 다양한 시설을 보다 효율적으로 운영하고 인간의 과학적, 문화적 노력을 지원하기 위해 점점 더 많은 AI가 활용되었습니다. 인공 지능에 대한 경계심은 많은 사람들이 고립되어 있음을 의미했지만 광범위한 네트워크 연결을 가진 일부 문명은 AI가 그들 사이에서 네트워크를 형성하도록 허용했습니다. 이러한 네트워크를 통해 AI는 작업을 분산하고 협업할 수 있으므로 스스로 생산할 수 있는 것보다 훨씬 더 큰 성과를 거둘 수 있습니다.'),

-- Brain Uploading Facility
('TXT_KEY_BUILDING_FW_BRAIN_UPLOADING', '브레인 업로드 시설'),
('TXT_KEY_BUILDING_FW_BRAIN_UPLOADING_HELP', '도시의 [ICON_CITIZEN]시민 중 많은 이들이 업로드됩니다. 업로드된 [ICON_CITIZEN]시민들은 더이상 전문가 슬롯이나 타일에 배치할 수 없으나, 남은 도시의 [ICON_CITIZEN]시민 1명마다 [ICON_PRODUCTION]생산, [ICON_RESEARCH]과학, [ICON_GOLD]골드, [ICON_CULTURE]문화 산출량이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]씩 증가합니다.[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]신경양자치료시스템[ENDCOLOR]이 있어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_BRAIN_UPLOADING_STRATEGY', '도시의 인구가 증대 되여 불행이 증가 될 정도로 과밀한 경우, 사회에 기여할 수 있는 동시에 시민의 의식을 사이버 공간에 업로드(신체적 유기체에 해를 끼치도록)하는 것이 가능합니다. '),
('TXT_KEY_BUILDING_FW_BRAIN_UPLOADING_PEDIA', '컴퓨터 기술의 발달로 인간의 마음을 복제할 수 있는 능력이 생겼다. 이는 인간의 뇌가 디지털 형태로 완벽하게 복제되어 인간의 마음이 인공지능과 유사한 디지털 형태로 존재하게 되는 ''브레인 업로딩'' 과정으로 이어진다. 로봇 대리인과 가상 환경의 가용성이 증가함에 따라 이러한 업로드된 마음은 생존을 위해 더 이상 음식이나 기타 편의 시설이 필요하지 않지만 물리적 세계 및 다른 인간과 완전히 상호 작용할 수 있습니다.  생물학적으로 보자면 현대판 안락사, 현대판 고려장이라는 의견이 있어서 논란이 있습니다.'),

-- Nucleonic Foundry
('TXT_KEY_BUILDING_FW_ALLOY_FOUNDRY', '핵공학 제조공장'),
('TXT_KEY_BUILDING_FW_ALLOY_FOUNDRY_HELP', '도시에서 작업중인 [ICON_RES_ALUMINUM]알루미늄과 [ICON_RES_URANIUM]우라늄 자원 타일마다 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]4[ENDCOLOR], [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE][ICON_RES_NANOMAT]나노물질 [COLOR_POSITIVE_TEXT]8개[ENDCOLOR]를 제공합니다.[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]핵융합 반응로[ENDCOLOR]가 있어야 건설할 수 있습니다. [NEWLINE][NEWLINE][ICON_RES_URANIUM]우라늄 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR]와 [ICON_RES_ALUMINUM]알루미늄 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR]가 필요합니다.'),
('TXT_KEY_BUILDING_FW_ALLOY_FOUNDRY_STRATEGY', '[ICON_RES_NANOMAT] 나노 물질을 8개를 생성합니다. 이 도시에서 작업한 [ICON_RES_ALUMINUM] 알루미늄 및 [ICON_RES_URANIUM] 우라늄의 각 공급원은 +4 [ICON_PRODUCTION]생산 및 +2 [ICON_GOLD]골드를 생산합니다. 1개의 [ICON_RES_URANIUM] 우라늄과 융합 플랜트가 필요합니다.'),
('TXT_KEY_BUILDING_FW_ALLOY_FOUNDRY_PEDIA', 'HE-3 헬륨의 동위원소 중 하나인 원소로 기존에는 삼중수소가 베타붕괴를 일으켰을 때만 매우 제한적으로 생산이 되었으나, 기술이 발전하여 이제는 생산할 수 있는 수단이 발견되면 산업화로 발전했습니다. 그러나 엄청난 양의 에너지와 제조 조건을 제어하는 데 필요한 정밀 장비로 인해 이러한 시설은 드물었습니다. 그들은 최소한 전용 핵융합로가 필요했고, HE-3 합성 과정을 더 쉽게 하기 위해 우라늄과 같은 기존의 무거운 원소를 종종 활용했습니다. 그러나 그들이 생산한 재료는 거의 파괴되지 않았으며 인류가 지금까지 달성한 것 중 가장 크고 가장 인상적인 인공 구조물을 만들 수 있었습니다.'),

-- Utility Fog Generator
('TXT_KEY_BUILDING_FW_UTILITY_FOG', '나노로봇 생성기'),
('TXT_KEY_BUILDING_FW_UTILITY_FOG_HELP', '도시의 [ICON_RANGE_STRENGTH]원거리 공격 범위가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 모든 건물을 건설할 때 [ICON_PRODUCTION]생산보너스를 [COLOR_POSITIVE_TEXT]20%[ENDCOLOR]제공합니다.[NEWLINE][NEWLINE][ICON_CITY_STATE]도시의 규모 요구치가 [COLOR_POSITIVE_TEXT]5%[ENDCOLOR] 감소합니다.[NEWLINE][NEWLINE][ICON_RES_NANOMAT]나노물질 [COLOR_POSITIVE_TEXT]3개[ENDCOLOR]를 제공합니다. [NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]무인관리기지[ENDCOLOR]가 있어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_UTILITY_FOG_STRATEGY', '도시 방어 및 [ICON_HAPPINESS_1] 행복도를 높입니다. 건물 건설 속도가 20% 빨라집니다.'),
('TXT_KEY_BUILDING_FW_UTILITY_FOG_PEDIA', '점점 더 정교해지고 지능적인 나노머신은 물리적 구조를 복제하기 위해 함께 묶을 수 있는 작은 로봇 모음인 유틸리티 포그의 개발을 가능하게 했습니다. 처음에 그들은 보호 목적으로 생각되었으며, 갑작스러운 충격이 그들을 결합하도록 자극하여 넓은 표면에 충격을 퍼뜨릴 때까지 느슨하고 유동적인 상태를 유지했습니다. 그러나 물리적 물체를 생산하거나 개인을 장소로 이동시키는 데에도 사용할 수 있습니다.'),

-- Central Command
('TXT_KEY_BUILDING_FW_CENTRAL_COMMAND', '중앙 통제 센터'),
('TXT_KEY_BUILDING_FW_CENTRAL_COMMAND_HELP', '인공환경도시의 [ICON_GOLD]골드와 [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE][ICON_RES_NANOMAT]나노물질 [COLOR_POSITIVE_TEXT]3개[ENDCOLOR]를 제공합니다.[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]항공우주 복합시설[ENDCOLOR]이 있어야하고, [COLOR_NEGATIVE_TEXT]AI네트워크,  유전자 가속 센터[ENDCOLOR]가 없어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_CENTRAL_COMMAND_STRATEGY', '인공환경도시의 산출량에 도움이 될 것입니다.'),
('TXT_KEY_BUILDING_FW_CENTRAL_COMMAND_PEDIA', '중앙 통제 센터는 인공환경도시의 심장과도 같은 건물입니다. 이 곳은 모든 생태계의 안정적인 유지를 위해 필요한 다양한 요소들을 지속적으로 모니터링하고 조절하는 장소로, 공동체의 생태학적 균형과 지속 가능성을 확보하는 데 중추적인 역할을 합니다. 중앙 통제 센터는 수많은 센서와 고도의 시스템을 통해 도시 전체의 환경 데이터를 수집하고 분석합니다. 이는 대기 및 수질, 생물 다양성, 에너지 사용량, 날씨 패턴, 식물의 성장 상태 등을 포함합니다. 이런 정보는 도시의 생태계를 총체적으로 이해하고 유지하는 데 필요한 불가결한 자원입니다. 이러한 데이터를 기반으로, 중앙 통제 센터는 도시의 생태계가 안정적으로 유지되도록 필요한 조치를 즉시 시행합니다. 이는 예를 들어, 온도를 조절하거나, 자원을 배분하거나, 생물 다양성을 보호하거나, 에너지 사용을 최적화하는 등의 행동을 포함할 수 있습니다. 또한 중앙 통제 센터는 가능한 환경적 위협을 예측하고 대비하기 위해 장기적인 예측 모델링을 수행합니다. 이는 도시의 생태계가 미래의 변화에도 안정적으로 유지될 수 있도록 보장하는 핵심 역할을 합니다.'),

-- Research Exchange
('TXT_KEY_BUILDING_FW_GENOME_PROJECT_1', '연구 교환'),
('TXT_KEY_BUILDING_FW_GENOME_PROJECT_1_HELP', '[COLOR_PLAYER_NETHERLANDS_BACKGROUND]연구소[ENDCOLOR]의 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가하고, [COLOR_PLAYER_NETHERLANDS_BACKGROUND]의학 연구소[ENDCOLOR]의 [ICON_FOOD]식량이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다.'),
('TXT_KEY_BUILDING_FW_GENOME_PROJECT_1_STRATEGY', '연구소의 과학과 의학연구소의 식량이 증가합니다.'),
('TXT_KEY_BUILDING_FW_GENOME_PROJECT_1_PEDIA', '인간 게놈 프로젝트에 적은 양의 시간과 자원만 기여한 문명은 그 결과 정보와 기술의 교환으로 여전히 이익을 얻었습니다. 연구소는 개발된 신기술의 혜택을 받았고 의학 연구소는 질병 및 기타 질병을 보다 효과적으로 치료할 수 있었습니다.'),

-- Genetic Treatments
('TXT_KEY_BUILDING_FW_GENOME_PROJECT_2', '유전자 치료'),
('TXT_KEY_BUILDING_FW_GENOME_PROJECT_2_HELP', '모든 도시의 [ICON_CITIZEN]시민이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]증가하고, 유전자 연구소의 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR]증가합니다.'),
('TXT_KEY_BUILDING_FW_GENOME_PROJECT_2_STRATEGY', '문면 전역 모든 도시의 시민이 증가하며, 유전자 연구소의 과학을 증가시킵니다.'),
('TXT_KEY_BUILDING_FW_GENOME_PROJECT_2_PEDIA', '인간 게놈 프로젝트에 더 광범위하게 참여하면 그렇게 하기로 선택한 문명에 더 큰 보상이 주어집니다. 인간 게놈에 대한 지식이 늘어남에 따라 특정 질병과 만성 질환을 훨씬 쉽게 치료할 수 있게 되어 삶의 질이 크게 향상되었습니다.'),

-- Global netowrk
('TXT_KEY_BUILDING_FW_AI_DATANETWORK_1', '글로벌 광 통신망'),
('TXT_KEY_BUILDING_FW_AI_DATANETWORK_1_HELP', '모든 [COLOR_POSITIVE_TEXT]서버 허브[ENDCOLOR]의 [ICON_RESEARCH]과학, [ICON_PRODUCTION]생산, [ICON_CULTURE]문화, [ICON_PEACE]신앙, [ICON_GOLD]골드가 각각 +1 증가합니다.'),
('TXT_KEY_BUILDING_FW_AI_DATANETWORK_1_STRATEGY','서버 허브의 성능이 향상되어 소규모 기여만으로도 과학, 문화, 생산, 신앙, 골드에서 균형 잡힌 보너스를 얻을 수 있습니다. 전 세계에 깔린 통신망은 모든 도시의 연구와 산업에 기본적인 기반을 제공합니다.'),
('TXT_KEY_BUILDING_FW_AI_DATANETWORK_1_PEDIA','글로벌 광통신망은 각 지역의 서버 허브를 연결하여 데이터 전송 속도와 안정성을 크게 향상시킵니다. 기여가 적은 문명이라도 이 네트워크를 통해 새롭게 축적된 지식과 기술을 공유받을 수 있습니다. 네트워크는 정보의 흐름을 원활히 하고, 연구·생산·문화 활동의 기반을 강화하는 역할을 합니다.'),

-- Global data center
('TXT_KEY_BUILDING_FW_AI_DATANETWORK_2', '글로벌데이터센터'),
('TXT_KEY_BUILDING_FW_AI_DATANETWORK_2_HELP', '모든 [COLOR_POSITIVE_TEXT]네트워크 중심지[ENDCOLOR]의 [ICON_RESEARCH]과학, [ICON_CULTURE]문화, [ICON_GOLD]골드가 각각 +2 증가합니다. 또한 모든 도시의 [ICON_GREAT_PEOPLE]위인 출현률이 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR] 증가합니다.'),
('TXT_KEY_BUILDING_FW_AI_DATANETWORK_2_STRATEGY','네트워크 중심지들이 데이터 처리와 저장 능력을 확보하면서 더 많은 과학·문화·골드를 생산합니다. 또한 전 도시의 위인 출현률이 증가하여 지적·문화적 혁신이 촉진됩니다.'),
('TXT_KEY_BUILDING_FW_AI_DATANETWORK_2_PEDIA', '글로벌 데이터센터는 막대한 양의 데이터를 축적·분석·활용할 수 있는 세계적 인프라입니다. 이 시설들은 인공지능 학습과 대규모 시뮬레이션을 가능하게 하여 과학적 발견, 문화적 창조, 경제적 효율성을 크게 끌어올립니다. 동시에 인류 전체의 혁신 속도가 가속화되어 더 많은 위인이 배출되며, 이는 문명의 미래 발전에 중요한 전환점이 됩니다.'),

-- M-Type Asteroid → 심층 금속 매장지
('TXT_KEY_BUILDING_FW_ASTEROID_MINING_1', '심층 금속 매장지'),
('TXT_KEY_BUILDING_FW_ASTEROID_MINING_1_HELP', '[ICON_RES_IRON]철 [COLOR_POSITIVE_TEXT]6개[ENDCOLOR]와 [ICON_RES_COAL]석탄 [COLOR_POSITIVE_TEXT]3개[ENDCOLOR]를 제공합니다.'),
('TXT_KEY_BUILDING_FW_ASTEROID_MINING_1_STRATEGY', '문명에 [ICON_RES_IRON]철, [ICON_RES_COAL]석탄 같은 기본 산업 자원을 안정적으로 공급합니다.'),
('TXT_KEY_BUILDING_FW_ASTEROID_MINING_1_PEDIA', '심층 금속 매장지는 지구 지각 깊은 곳에 매장된 철과 석탄 자원을 체계적으로 채굴하기 위한 시설입니다. 첨단 굴착 장비와 고온·고압 환경 제어 기술을 통해 이전에는 접근할 수 없었던 광물 자원을 확보할 수 있습니다. 이러한 자원은 산업과 군수 분야 모두에서 필수적인 기반을 제공합니다.'),

-- S-Type Asteroid → 희귀 자원 채굴
('TXT_KEY_BUILDING_FW_ASTEROID_MINING_2', '희귀 자원 채굴'),
('TXT_KEY_BUILDING_FW_ASTEROID_MINING_2_HELP', '[ICON_RES_ALUMINUM]알루미늄 [COLOR_POSITIVE_TEXT]4개[ENDCOLOR]와 [ICON_RES_NANOMAT]나노물질 [COLOR_POSITIVE_TEXT]3개[ENDCOLOR], [ICON_RES_URANIUM]우라늄 [COLOR_POSITIVE_TEXT]1개[ENDCOLOR]를 제공합니다.'),
('TXT_KEY_BUILDING_FW_ASTEROID_MINING_2_STRATEGY', '문명에 [ICON_RES_ALUMINUM]알루미늄, [ICON_RES_NANOMAT]나노물질, [ICON_RES_URANIUM]우라늄 같은 희귀 자원을 제공합니다.'),
('TXT_KEY_BUILDING_FW_ASTEROID_MINING_2_PEDIA', '희귀 자원 채굴은 알루미늄, 나노물질, 우라늄과 같은 고부가가치 자원을 지하 깊은 곳이나 극한 환경에서 추출하는 기술을 의미합니다. 이러한 자원은 첨단 산업, 원자력, 그리고 나노공학 분야에서 핵심적 역할을 하며, 국제적인 경쟁과 협력의 중심에 서 있습니다.');

-- Launch facility
UPDATE Language_ko_KR
SET Text = '도시의 [ICON_CITIZEN]시민 10명마다 [ICON_RESEARCH]과학, [ICON_PRODUCTION]생산이 각각 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]씩 증가합니다.[NEWLINE]공중 유닛을 생산할 때 [ICON_PRODUCTION]생산보너스를 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR]제공합니다. [NEWLINE][ICON_FOOD]/[ICON_PRODUCTION]낙후, [ICON_URBANIZATION]도시화에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]감소합니다. [NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]공장[ENDCOLOR]이 있어야 하고, [COLOR_NEGATIVE_TEXT]임플란트 시술소[ENDCOLOR]가 없어야 건설할 수 있습니다.'
WHERE Tag = 'TXT_KEY_BUILDING_FW_LAUNCH_FACILITY_HELP'AND EXISTS (SELECT * FROM Units WHERE TYPE = 'UNIT_EE_SKIRMISHER');

--===========================
-- Projects & League Resolutions
--===========================
INSERT INTO Language_ko_KR (Tag, Text) VALUES
-- 게놈프로젝트
('TXT_KEY_PROCESS_FW_GENOME_PROJECT','유전자 지도 네트워크'),
('TXT_KEY_PROCESS_FW_GENOME_PROJECT_HELP','이 도시의 [ICON_PRODUCTION]생산을 유전자 지도 네트워크 공헌에 사용합니다.'),
('TXT_KEY_LEAGUE_PROJECT_FW_GENOME_PROJECT','국제 유전체 컨소시엄'),
('TXT_KEY_WONDER_FW_GENOME_PROJECT_HELP','도시의 모든 전문가들의 산출량이 +1 증가하고 모든 [ICON_GREAT_PEOPLE]위인 점수가 +3 증가합니다.'),
('TXT_KEY_LEAGUE_PROJECT_FW_GENOME_PROJECT_SPLASH','유전자지도 네트워크는 모든 생명, 유기물 유전자의 이해도를 높이기 위한 게놈(유전체)의 맵을 만드려는 노력의 일환입니다.'),
('TXT_KEY_LEAGUE_PROJECT_REWARD_FW_GENOME_PROJECT_1','연구 교환'),
('TXT_KEY_LEAGUE_PROJECT_REWARD_FW_GENOME_PROJECT_1_HELP','모든 도시의 [COLOR_POSITIVE_TEXT]연구소[ENDCOLOR]의 [ICON_RESEARCH]과학이 +3 증가하고, [COLOR_POSITIVE_TEXT]의학 연구소[ENDCOLOR]의 [ICON_FOOD]식량이 +3 증가합니다.'),
('TXT_KEY_LEAGUE_PROJECT_REWARD_FW_GENOME_PROJECT_2','유전자 치료'),
('TXT_KEY_LEAGUE_PROJECT_REWARD_FW_GENOME_PROJECT_2_HELP','모든 도시의 [ICON_CITIZEN]시민이 +1 증가하고, [COLOR_PLAYER_NETHERLANDS_BACKGROUND]유전자공학 연구소[ENDCOLOR]의 [ICON_RESEARCH]과학이 +2 증가합니다.'),
('TXT_KEY_LEAGUE_PROJECT_REWARD_FW_GENOME_PROJECT_3','응용 유전체학'),
('TXT_KEY_LEAGUE_PROJECT_REWARD_FW_GENOME_PROJECT_3_HELP','[ICON_CAPITAL]수도에 [COLOR_POSITIVE_TEXT]인간 게놈 프로젝트[ENDCOLOR] 불가사의가 출현합니다. ({TXT_KEY_WONDER_FW_GENOME_PROJECT_HELP})'),
('TXT_KEY_RESOLUTION_FW_GENOME_PROJECT','유전자 지도 네트워크'),
('TXT_KEY_RESOLUTION_FW_GENOME_PROJECT_HELP','[COLOR_POSITIVE_TEXT]인간 게놈 프로젝트[ENDCOLOR]를 시작합니다. 프로젝트가 시작되면 도시의 생산 목록에서 해당 프로젝트를 선택해 프로젝트에 기여할 수 있습니다. 프로젝트가 완료되면, 프로젝트에 참여한 문명은 기여한 [ICON_PRODUCTION]생산에 따라 보너스를 받게 됩니다.[NEWLINE][NEWLINE][ICON_TROPHY_GOLD]: {TXT_KEY_LEAGUE_PROJECT_REWARD_FW_GENOME_PROJECT_3_HELP}[NEWLINE][ICON_TROPHY_SILVER]: {TXT_KEY_LEAGUE_PROJECT_REWARD_FW_GENOME_PROJECT_2_HELP}[NEWLINE][ICON_TROPHY_BRONZE]: {TXT_KEY_LEAGUE_PROJECT_REWARD_FW_GENOME_PROJECT_1_HELP}[NEWLINE][NEWLINE][COLOR_RESEARCH_STORED]생명기술 공학[ENDCOLOR]을 연구한 문명이 있어야 안건으로 채택할 수 있습니다.'),

-- AI 데이터센터 네트워크
('TXT_KEY_PROCESS_FW_AI_DATANETWORK','글로벌 데이터네트워크 프로젝트'),
('TXT_KEY_PROCESS_FW_AI_DATANETWORK_HELP','이 도시의 [ICON_PRODUCTION]생산을 데이터센터 네트워크 프로젝트 공헌에 사용합니다.'),
('TXT_KEY_LEAGUE_PROJECT_FW_AI_DATANETWORK','국제 데이터네트워크 회의'),
('TXT_KEY_LEAGUE_PROJECT_FW_AI_DATANETWORK_SPLASH','국제 데이터네트워크 는 전 세계 데이터 인프라를 상호 연결하여 연산·저장·전송 자원을 효율적으로 분배하기 위한 국제 협력 프로젝트입니다. 각 도시는 서버 허브와 네트워크 중심지를 통해 참여하며, 축적된 기여도에 따라 보상을 받습니다.'),
('TXT_KEY_WONDER_FW_AI_SINGULARITY_HELP','문명 전체의 [ICON_RESEARCH]과학, [ICON_CULTURE]문화, [ICON_GOLD]골드, [ICON_PRODUCTION]생산이 각각 [COLOR_POSITIVE_TEXT]5%[ENDCOLOR] 증가합니다. 원하는 [ICON_GREAT_PEOPLE][COLOR_YELLOW] 위인[ENDCOLOR] 1명이 출현합니다.'),
('TXT_KEY_LEAGUE_PROJECT_REWARD_FW_AI_DATANETWORK_1','글로벌광통신망'),
('TXT_KEY_LEAGUE_PROJECT_REWARD_FW_AI_DATANETWORK_1_HELP','모든 [COLOR_POSITIVE_TEXT]서버 허브[ENDCOLOR]의 [ICON_RESEARCH]과학, [ICON_PRODUCTION]생산, [ICON_CULTURE]문화, [ICON_PEACE]신앙, [ICON_GOLD]골드가 각각 +1 증가합니다.'),
('TXT_KEY_LEAGUE_PROJECT_REWARD_FW_AI_DATANETWORK_2','글로벌데이터센터'),
('TXT_KEY_LEAGUE_PROJECT_REWARD_FW_AI_DATANETWORK_2_HELP','모든 [COLOR_POSITIVE_TEXT]네트워크 중심지[ENDCOLOR]의 [ICON_RESEARCH]과학, [ICON_CULTURE]문화, [ICON_GOLD]골드가 각각 +2 증가합니다. 또한 모든 도시의 [ICON_GREAT_PEOPLE]위인 출현률이 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR] 증가합니다.'),
('TXT_KEY_LEAGUE_PROJECT_REWARD_FW_AI_DATANETWORK_3','글로벌 AI 센터'),
('TXT_KEY_LEAGUE_PROJECT_REWARD_FW_AI_DATANETWORK_3_HELP','[ICON_CAPITAL]수도에 [COLOR_POSITIVE_TEXT]AI 데이터 허브[ENDCOLOR] 불가사의가 출현합니다. ({TXT_KEY_WONDER_FW_AI_SINGULARITY_HELP})'),
('TXT_KEY_RESOLUTION_FW_AI_DATANETWORK','국제 데이터네트워크 회의'),
('TXT_KEY_RESOLUTION_FW_AI_DATANETWORK_HELP','[COLOR_POSITIVE_TEXT]AI 데이터센터 네트워크[ENDCOLOR]를 시작합니다. 프로젝트가 시작되면 도시의 생산 목록에서 해당 프로젝트를 선택해 프로젝트에 기여할 수 있습니다. 프로젝트가 완료되면, 기여한 [ICON_PRODUCTION]생산에 따라 보너스를 받게 됩니다.[NEWLINE][NEWLINE][ICON_TROPHY_GOLD]: {TXT_KEY_LEAGUE_PROJECT_REWARD_FW_AI_DATANETWORK_3_HELP}[NEWLINE][ICON_TROPHY_SILVER]: {TXT_KEY_LEAGUE_PROJECT_REWARD_FW_AI_DATANETWORK_2_HELP}[NEWLINE][ICON_TROPHY_BRONZE]: {TXT_KEY_LEAGUE_PROJECT_REWARD_FW_AI_DATANETWORK_1_HELP}[NEWLINE][NEWLINE][COLOR_RESEARCH_STORED]AI:생성형[ENDCOLOR]를 연구한 문명이 있어야 안건으로 채택할 수 있습니다.'),

-- 국제 심층 자원 회의
('TXT_KEY_PROCESS_FW_DEEP_RESOURCE','심층 자원 탐사 프로젝트'),
('TXT_KEY_PROCESS_FW_DEEP_RESOURCE_HELP','이 도시의 [ICON_PRODUCTION]생산을 심층 자원 탐사 프로젝트 공헌에 사용합니다.'),
('TXT_KEY_LEAGUE_PROJECT_FW_DEEP_RESOURCE','국제 심층 자원 회의'),
('TXT_KEY_LEAGUE_PROJECT_FW_DEEP_RESOURCE_SPLASH','국제 심층 자원 회의는 지구 심층부와 해저에 존재하는 희귀 금속과 나노 소재를 어떻게 탐사·분배할지 논의하는 국제 협력 프로젝트입니다. 최첨단 나노 드릴과 자원 관리 체계를 통해 자원의 불균형을 줄이고, 미래 산업에 필요한 핵심 소재를 확보합니다.'),
('TXT_KEY_WONDER_FW_DEEP_RESOURCE_HELP','[ICON_GREAT_ENGINEER][COLOR_YELLOW]위대한 기술자[ENDCOLOR]가 1명 출현합니다. 모든 [COLOR_POSITIVE_TEXT]나노물질 제조소[ENDCOLOR]의 [ICON_PRODUCTION]생산과 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]6[ENDCOLOR] 증가합니다.'),
('TXT_KEY_LEAGUE_PROJECT_REWARD_FW_DEEP_RESOURCE_1','심층 금속 매장지'),
('TXT_KEY_LEAGUE_PROJECT_REWARD_FW_DEEP_RESOURCE_1_HELP','[ICON_RES_IRON]철 [COLOR_POSITIVE_TEXT]6개[ENDCOLOR]와 [ICON_RES_COAL]석탄 [COLOR_POSITIVE_TEXT]3개[ENDCOLOR]를 제공합니다.'),
('TXT_KEY_LEAGUE_PROJECT_REWARD_FW_DEEP_RESOURCE_2','희귀 합금'),
('TXT_KEY_LEAGUE_PROJECT_REWARD_FW_DEEP_RESOURCE_2_HELP','[ICON_RES_ALUMINUM]알루미늄 [COLOR_POSITIVE_TEXT]4개[ENDCOLOR]와 [ICON_RES_NANOMAT]나노물질 [COLOR_POSITIVE_TEXT]3개[ENDCOLOR], [ICON_RES_URANIUM]우라늄 [COLOR_POSITIVE_TEXT]1개[ENDCOLOR]를 제공합니다.'),
('TXT_KEY_LEAGUE_PROJECT_REWARD_FW_DEEP_RESOURCE_3','지구 심층 채굴 허브'),
('TXT_KEY_LEAGUE_PROJECT_REWARD_FW_DEEP_RESOURCE_3_HELP','[ICON_CAPITAL]수도에 [COLOR_POSITIVE_TEXT]심층 채굴 허브[ENDCOLOR] 불가사의가 출현합니다. ({TXT_KEY_WONDER_FW_DEEP_RESOURCE_HELP})'),
('TXT_KEY_RESOLUTION_FW_DEEP_RESOURCE','국제 심층 자원 회의'),
('TXT_KEY_RESOLUTION_FW_DEEP_RESOURCE_HELP','[COLOR_POSITIVE_TEXT]국제 심층 자원 회의[ENDCOLOR]를 시작합니다. 프로젝트가 시작되면 도시의 생산 목록에서 해당 프로젝트를 선택해 프로젝트에 기여할 수 있습니다. 프로젝트가 완료되면, 참여한 문명은 기여한 [ICON_PRODUCTION]생산에 따라 보상을 받습니다.[NEWLINE][NEWLINE][ICON_TROPHY_GOLD]: {TXT_KEY_LEAGUE_PROJECT_REWARD_FW_DEEP_RESOURCE_3_HELP}[NEWLINE][ICON_TROPHY_SILVER]: {TXT_KEY_LEAGUE_PROJECT_REWARD_FW_DEEP_RESOURCE_2_HELP}[NEWLINE][ICON_TROPHY_BRONZE]: {TXT_KEY_LEAGUE_PROJECT_REWARD_FW_DEEP_RESOURCE_1_HELP}[NEWLINE][NEWLINE][COLOR_RESEARCH_STORED]지구에너지 공학[ENDCOLOR]을 연구한 문명이 있어야 안건으로 채택할 수 있습니다.');

--===========================
-- WONDERS
--===========================

INSERT OR REPLACE INTO LocalizedText
	(Language, Tag, Text)
VALUES
 ('ko_KR','TXT_KEY_BUILDING_CERN_HELP', '[COLOR_RESEARCH_STORED]무료 기술[ENDCOLOR]을 [COLOR_POSITIVE_TEXT]2개[ENDCOLOR] 제공합니다. 모든 [ICON_CITY_STATE]도시 국가에 대한 [ICON_INFLUENCE]영향력을 [COLOR_POSITIVE_TEXT]30[ENDCOLOR] 제공합니다.');


INSERT INTO Language_ko_KR (Tag, Text) VALUES
-- Tokyo Skytree
('TXT_KEY_BUILDING_FW_SKYTREE', '도쿄 스카이트리'),
('TXT_KEY_BUILDING_FW_SKYTREE_HELP', '모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]방송탑[ENDCOLOR]의 [ICON_CULTURE]문화와 [ICON_GOLDEN_AGE]황금기 점수가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR], 문명의 모든 [COLOR_POSITIVE_TEXT]통신기지국[ENDCOLOR]의 [ICON_RESEARCH]과학과 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 전역 [ICON_HAPPINESS_1]행복이 [COLOR_POSITIVE_TEXT]3[ENDCOLOR] 증가합니다.  [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'),
('TXT_KEY_BUILDING_FW_SKYTREE_QUOTE', '[NEWLINE]''하늘에는 동서남북의 방향구분이 없다. 사람들은 자신의 마음으로 구별을 만들고 그것이 사실이라고 믿습니다.''[NEWLINE] - Buddha[NEWLINE]'),
('TXT_KEY_BUILDING_FW_SKYTREE_PEDIA', '도쿄 중심부의 스미다가와 강 근처에 지어진 도쿄 스카이트리는 도시 대부분에서 볼 수 있는 대형 방송 및 전망대입니다. 공사는 2008년 7월 14일에 시작되어 2012년 2월 29일까지 계속되었습니다. 총 높이 634미터(스카이트리가 위치한 지역의 이전 이름인 무사시를 대표하는 높이)의 도쿄 스카이트리는 일본에서 가장 높은 타워입니다. 세계에서 가장 높은 인공 건축물로 두바이의 부르즈 할리파에 이어 두 번째입니다. 이러한 높이는 방송탑으로서의 기능이 가능하기 위해 꼭 필요한 높이였다. 이전 버전인 도쿄 타워는 높이와 주변 고층 빌딩의 높이로 인해 간헐적으로 커버리지가 발생하는 문제에 직면했습니다. 탑의 디자인은 일본의 과거와 미래를 모두 상징하며, 일본 전역에서 국가 성취의 상징으로 잘 알려져 있습니다.'),
-- Utsäde Gene Vault
('TXT_KEY_BUILDING_FW_GENE_VAULT', '스발바르 국제종자저장고'),
('TXT_KEY_BUILDING_FW_GENE_VAULT_HELP', '문명의 모든 [COLOR_POSITIVE_TEXT]자연보호구역[ENDCOLOR]의 [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR], [COLOR_POSITIVE_TEXT]친환경마을[ENDCOLOR]의 [ICON_FOOD]식량이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 문명의 모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]생태친화시설, 바이오 공장, 해양바이오산업단지[ENDCOLOR]의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. 전역 [ICON_HAPPINESS_1]행복이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]도시의 [ICON_GREAT_WRITER]위대한 작가 출현율이 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR] 증가합니다. 해당 불가사의가 있는 도시의 국가 불가사의, 세계 불가사의 및 타일 시설이 제공하는 [ICON_CULTURE]문화의 [COLOR_POSITIVE_TEXT]50%[ENDCOLOR]가 도시의 [ICON_TOURISM]관광에 추가됩니다. [ICON_GREAT_WORK]걸작 문학 슬롯 2개를 포함합니다.[NEWLINE][NEWLINE]테마보너스: [ICON_PEACE]신앙: +4, [ICON_GOLDEN_AGE]황금기 점수: +4 [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'),
('TXT_KEY_BUILDING_FW_GENE_VAULT_QUOTE', '[NEWLINE]''프로그램에 의해 결정되는 씨앗 안에 포함된 세계''[NEWLINE] - Dejan Stojanovic, ''Circling: 1978-1987''[NEWLINE]'),
('TXT_KEY_BUILDING_FW_GENE_VAULT_PEDIA', '21세기 말에 접어들면서 멸종 수준의 증가와 기후 변화의 가능성에 대한 우려로 인해 다양한 유전자 샘플을 보관하는 유전자 은행의 수가 증가하고 있습니다. 이 중 가장 주목할 만한 것은 Utsäde Gene Vault로 2023년에 완공되었습니다. 완전히 자급자족할 수 있도록 첨단 ''녹색'' 기술을 활용하여 유전자 샘플의 중앙 저장소이자 네트워크로 연결된 연구 시설의 역할을 했습니다. , 전 세계 유전학 연구소와 정보를 공유합니다.'),
('TXT_KEY_THEMING_BONUS_GENE_VAULT', '기후 변화 예술 작품'),
('TXT_KEY_GENE_VAULT_THEMING_BONUS_HELP', '보너스를 극대화하려면 모든 걸작 슬롯을 같은 시대에 [COLOR_POSITIVE_TEXT]같은 시대[ENDCOLOR] [COLOR_POSITIVE_TEXT]같은 문명[ENDCOLOR]이 만든 [COLOR_YELLOW]걸작 문학[ENDCOLOR]으로 채우십시오.'),
-- Shanghai World Financial Center
('TXT_KEY_BUILDING_FW_SHANGHAI_WFC', '상하이 국제금융센터'),
('TXT_KEY_BUILDING_FW_SHANGHAI_WFC_HELP', '이 불가사의가 완성되면 [ICON_GOLD]골드를 [COLOR_POSITIVE_TEXT]15000[ENDCOLOR] 일시불로 획득하고, 알려진 모든 문명에 [ICON_TOURISM]관광을 [COLOR_POSITIVE_TEXT]10000[ENDCOLOR] 일시불로 획득합니다. [NEWLINE]이 도시에서 다른 문명으로 출발하는 [ICON_INTERNATIONAL_TRADE]교역로가 완료되면 현재 [ICON_CULTURE]문화 및 [ICON_TOURISM]관광 산출량의 [COLOR_POSITIVE_TEXT]5%[ENDCOLOR]만큼의 [ICON_TOURISM]관광을 일시불로 제공합니다. [NEWLINE]도시의 마을과 소도시의 [ICON_CULTURE]문화와 [ICON_TOURISM]관광이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][ICON_GOLD]빈곤에서 오는 [ICON_HAPPINESS_3]불행이 전역 [COLOR_POSITIVE_TEXT]5[ENDCOLOR] 감소합니다. [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'),
('TXT_KEY_BUILDING_FW_SHANGHAI_WFC_QUOTE', '[NEWLINE]''돈으로 살 수 있는 최고의 정부''[NEWLINE] - 마크 트웨인[NEWLINE]'),
('TXT_KEY_BUILDING_FW_SHANGHAI_WFC_PEDIA', '상하이 세계 금융 센터는 중국 상하이에 위치한 초고층 빌딩입니다. 2007년 완공 당시에는 지구상에서 두 번째로 높은 건물이자 중국에서 가장 높은 건물이었습니다. 이후 네 번째로 높은 것으로 하향 조정되었습니다. 그러나 여전히 해발 474m에 가장 높은 전망대가 있습니다. 상하이 세계 금융 센터의 주요 특징은 건물 꼭대기 근처에 위치한 큰 직사각형 조리개입니다. 초기 디자인에서는 원형을 의도했지만 일본의 ''떠오르는 태양'' 모티프와 유사하다는 논란으로 인해 모양이 변경되었습니다.'),
-- Virtual Idol
('TXT_KEY_BUILDING_FW_VIRTUAL_IDOL', '버츄어 아이돌'),
('TXT_KEY_BUILDING_FW_VIRTUAL_IDOL_HELP', '[COLOR_YELLOW][ICON_GREAT_PEOPLE]위대한 음악가[ENDCOLOR] 1명이 출현합니다. 도시의 [ICON_CULTURE]문화 산출량이 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR] 증가하고, [ICON_GREAT_WORK]걸작에서 오는 [ICON_TOURISM]관광이 [COLOR_POSITIVE_TEXT]50%[ENDCOLOR] 증가합니다. [ICON_GREAT_PEOPLE]위대한 음악가 점수가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]테마[ENDCOLOR]보너스: [ICON_CULTURE]문화 +8 [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'),
('TXT_KEY_BUILDING_FW_VIRTUAL_IDOL_QUOTE', '[NEWLINE]''인공 지능 소프트웨어와의 가상 관계에 주의하세요.''[NEWLINE] - Larry Ellison[NEWLINE]'),
('TXT_KEY_BUILDING_FW_VIRTUAL_IDOL_PEDIA', '21세기 K-POP 데몬헌터스는 현실과 가상의 경계를 허물었습니다. 실시간 모션캡처, 합성 보컬, 3D 페르소나가 결합된 가상 아이돌은 무대와 스트리밍, 메타버스 공연을 장악했고, 관객은 ‘실존’과 상상 사이에서 전례 없는 몰입을 경험합니다. 실제로 버추얼 그룹들은 데뷔 직후부터 거대한 팬덤을 형성하며, 사람들은 픽셀과 음성 합성 너머의 감정에 반응합니다. 본 세계관에서 ‘데몬 헌터스’는 게임·웹툰 세계관을 차용한 K-POP 가상 아이돌 프로젝트로, 라이브 스트리밍·AR 공연·팬메이드 리믹스를 통해 집단적 창작과 몰입을 극대화합니다. 한편 일부는 “기계가 창작을 대체하는가?”라고 묻지만, 다른 이들은 말합니다. “그들이 가상이더라도, 우리가 느끼는 감정은 진짜다.” 이들 가상 아이돌은 K-POP의 제작 시스템과 네트워크 문화를 증폭시키며, 새로운 대중예술의 형식을 개척하고 있습니다.'),
('TXT_KEY_THEMING_BONUS_FW_VIRTUAL_IDOL', '기술의 특이점'),
('TXT_KEY_THEMING_BONUS_FW_VIRTUAL_IDOL_HELP', '보너스를 극대화하려면 모든 걸작 슬롯을 [COLOR_POSITIVE_TEXT]같은 시대[ENDCOLOR]에 만든 [COLOR_YELLOW]음학[ENDCOLOR]으로 채우십시오.'),
-- Nano Institute
('TXT_KEY_BUILDING_FW_NANO_INSTITUTE', '나노공학 메가시티'),
('TXT_KEY_BUILDING_FW_NANO_INSTITUTE_HELP', '[COLOR_PLAYER_NETHERLANDS_BACKGROUND]나노물질 군수공장[ENDCOLOR]을 무료로 제공합니다. [NEWLINE][NEWLINE][ICON_RES_NANOMAT]나노물질 [COLOR_POSITIVE_TEXT]6개[ENDCOLOR]를 제공합니다.[NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'),
('TXT_KEY_BUILDING_FW_NANO_INSTITUTE_QUOTE', '[NEWLINE]''나노기술의 영향은 전자 혁명이 우리 삶에 미친 영향을 능가할 것으로 예상됩니다.''[NEWLINE] -Richard Schwartz [NEWLINE]'),
('TXT_KEY_BUILDING_FW_NANO_INSTITUTE_PEDIA', '나노 기술은 인류의 생존에 큰 영향을 미칠 것입니다. 나노 기술의 발전을 통해 비용을 줄이고 의료 기술의 품질을 향상시킬 수 있다면 만연한 질병을 보다 광범위하게 다루고 인간의 고통 수준을 줄일 수 있습니다. 연구소는 그런 기량을 발굴하고 발전시키는 현시대 최고의 희망입니다.'),
-- Utsäde Gene Vault2
('TXT_KEY_BUILDING_FW_GENE_VAULT2', '이든프로젝트'),
('TXT_KEY_BUILDING_FW_GENE_VAULT2_HELP', '문명의 모든 [COLOR_POSITIVE_TEXT]연구단지[ENDCOLOR]의 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR], [COLOR_POSITIVE_TEXT]수경재배지구[ENDCOLOR]의 [ICON_FOOD]식량이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 문명의 모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]수직형농장, 지열 공장, 심층시추공[ENDCOLOR]의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. 전역 [ICON_HAPPINESS_1]행복이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]도시의 [ICON_GREAT_SCIENTIST]위대한 과학자 출현율이 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR] 증가합니다. 해당 불가사의가 있는 도시의 국가 불가사의, 세계 불가사의 및 타일 시설이 제공하는 [ICON_CULTURE]문화의 [COLOR_POSITIVE_TEXT]50%[ENDCOLOR]가 도시의 [ICON_TOURISM]관광에 추가됩니다. [ICON_GREAT_WORK]걸작 예술품 또는 유물슬롯 2개를 포함합니다.[NEWLINE][NEWLINE]테마보너스: [ICON_RESEARCH]과학: +4, [ICON_GOLDEN_AGE]황금기 점수: +4  [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'),
('TXT_KEY_BUILDING_FW_GENE_VAULT2_QUOTE', '[NEWLINE]''프로그램에 의해 결정되는 씨앗 안에 포함된 세계''[NEWLINE] - Dejan Stojanovic, ''Circling: 1978-1987''[NEWLINE]'),
('TXT_KEY_BUILDING_FW_GENE_VAULT2_PEDIA', '도시 한복판에 자연을 이식하겠다는 발상에서 출발한 이든 프로젝트는, 밀폐형 바이오돔과 수직농장, 재활용 수경 시스템, 그리고 지열·심층시추를 이용한 에너지 회수 설비를 통합한 거대 복합체입니다. 이곳의 생태계는 완전 제어되는 기후 아래에서 작동하며, 토양 없이도 작물을 키우고 물과 영양분을 순환시켜 도시의 식량과 연구를 동시에 떠받칩니다. 자연 보호구역을 확장하는 대신 인공 생태를 구축·복제하는 데 초점을 맞추었고, 세계 각지의 연구단지와 연결되어 유전·생명공학 데이터와 표본을 표준화된 프로토콜로 공유합니다.[NEWLINE][NEWLINE]학술 투어와 대중 전시를 통해 시민들은 미래의 도시 생태를 직접 체험하며, 이 설비는 혹독한 환경에서도 인류가 스스로의 ‘에덴’을 만들 수 있음을 보여 주는 상징이 되었습니다.'),
('TXT_KEY_THEMING_BONUS_GENE_VAULT2', '인공 환경 예술품'),
('TXT_KEY_GENE_VAULT2_THEMING_BONUS_HELP', '보너스를 극대화하려면 모든 걸작 슬롯을 같은 시대에 [COLOR_POSITIVE_TEXT]같은 시대[ENDCOLOR] [COLOR_POSITIVE_TEXT]같은 문명[ENDCOLOR]이 만든 [COLOR_YELLOW]유물 또는 예술품[ENDCOLOR]으로 채우십시오.'),
-- Apex Centre
('TXT_KEY_BUILDING_FW_APEX_CENTRE', '에이펙스 센터'),
('TXT_KEY_BUILDING_FW_APEX_CENTRE_HELP', '[ICON_DIPLOMAT]위대한 외교관이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]명 출현하고, [ICON_DIPLOMAT]위대한 외교관 점수가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. [ICON_RES_PAPER]종이를 [COLOR_POSITIVE_TEXT]3개[ENDCOLOR] 제공합니다.[NEWLINE][NEWLINE]도시의 [ICON_SPY]보안 레벨이 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR] 증가합니다. 적[ICON_SPY]스파이가 이 도시에서 사망하면 [ICON_PEACE]신앙을 [COLOR:105:105:105:255](시대 및 살해된 스파이의 레벨에 따라 보정)[ENDCOLOR] 제공합니다.[NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'),
('TXT_KEY_BUILDING_FW_APEX_CENTRE_QUOTE', '[NEWLINE][TAB][TAB]''세상은 옳고 그름에 관심이 없습니다. 그것은 모두 힘에 관한 것입니다. 그리고 지금 당장은 아무도 가지고 있지 않습니다.''[NEWLINE][TAB][TAB] — Adam Jensen[NEWLINE][TAB]'),
('TXT_KEY_BUILDING_FW_APEX_CENTRE_PEDIA', '에이팩스 센터는 세계의 외교관과 대사를 위한 웅장한 다목적 비즈니스 및 주거 단지를 소유한 런던에 위치한 컨벤션 빌딩입니다. 중심은 높은 나선 모양의 건물로 둘러싸여 있습니다. 2029년, Nathaniel Brown은 인간복구법이 통과되는 것을 막기 위해 유엔 대표단을 설득하기 위해 이 건물을 세이프 하버 협약의 장소로 선택합니다. Brown과 대표단을 죽이려고 합니다. 이로 인해 C.S.O. 층은 로비를 지나서 제한되고 Jensen은 임박한 공격을 방지할 다른 수단을 찾아야 합니다.'),
-- Kalt Geymsla Data Haven
('TXT_KEY_BUILDING_FW_DATA_HAVEN', '데이터 타워'),
('TXT_KEY_BUILDING_FW_DATA_HAVEN_HELP', '문명의 모든 [COLOR_POSITIVE_TEXT]산업단지[ENDCOLOR]의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR], [COLOR_POSITIVE_TEXT]발전기[ENDCOLOR]의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.전역 [ICON_HAPPINESS_1]행복이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. [NEWLINE][COLOR_POSITIVE_TEXT]툰드라[ENDCOLOR]와 [COLOR_POSITIVE_TEXT]설원[ENDCOLOR] 타일의 [ICON_RESEARCH]과학과 [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. 모든 도시의 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]서버 허브[ENDCOLOR]의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]도시가 [COLOR_YELLOW]툰드라에 있어야[ENDCOLOR] 건설할 수 있습니다. 이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'),
('TXT_KEY_BUILDING_FW_DATA_HAVEN_QUOTE', '[NEWLINE]''데이터 자체는 쓸모가 없습니다. 데이터는 적용해야만 유용합니다. ''[NEWLINE] - 토드 박 [NEWLINE]'),
('TXT_KEY_BUILDING_FW_DATA_HAVEN_PEDIA', '21세기 초에 저장되고 교환되는 컴퓨터 데이터의 양은 놀라운 속도로 증가하여 2016년에는 제타바이트 임계값을 초과했습니다. 기존 데이터 센터는 이 데이터를 저장하는 데 필요한 막대한 컴퓨터 시스템이 많은 양을 소비했기 때문에 환경 발자국 문제가 있었습니다. 그들을 시원하게 유지하기 위해 전기의. Kalt Geymsla Data Haven은 이 문제에 대한 한 가지 솔루션으로, 서버가 냉각 요구 사항을 낮추기 위해 추운 북극 공기에 노출될 수 있고 전기를 제공하는 지역 지열 발전소가 있는 아이슬란드에 구축된 거대한 데이터 천국이었습니다. 시설 자체는 외부 외관에 다양한 구성 요소가 내장된 거대한 마더보드처럼 구성되었습니다. 서버에서 생성된 폐열을 포착하여 실험실, 온실 및 직원 거주 공간이 포함된 구조물의 점유 부분에 난방을 제공하는 데 사용했습니다.'),
-- Jurassic Park
('TXT_KEY_BUILDING_FW_JURASSIC_PARK', '쥬라기 공원'),
('TXT_KEY_BUILDING_FW_JURASSIC_PARK_HELP', '이 불가사의가 완성되면 도시 바깥에 공룡 유닛이 출현합니다. [COLOR_PLAYER_NETHERLANDS_BACKGROUND]복제 연구소[ENDCOLOR]를 무료로 제공합니다. 모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]동물원[ENDCOLOR]의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR], [COLOR_PLAYER_NETHERLANDS_BACKGROUND]복제 연구소[ENDCOLOR]의 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. 전역 [ICON_HAPPINESS_1]행복이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR], [ICON_TOURISM]관광이 [COLOR_POSITIVE_TEXT]3[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]도시의 [ICON_STRENGTH]방어력을 증가시키고, 적의 [ICON_MOVES]이동력을 떨어뜨립니다. [NEWLINE][NEWLINE]도시 근처에 [COLOR_YELLOW]숲이나 정글이 있어야[ENDCOLOR] 건설할 수 있습니다. 이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'),
('TXT_KEY_BUILDING_FW_JURASSIC_PARK_QUOTE', '[NEWLINE]''Life finds a way.''[NEWLINE] -  Ian Malcolm[NEWLINE]'),
('TXT_KEY_BUILDING_FW_JURASSIC_PARK_PEDIA', '유전자 공학에 관한 대부분의 초기 노력은 기존 동식물 생명의 수정 및 향상에 초점을 맞추었지만 멸종된 동식물 종을 부활시키려는 일부 야심찬 노력이 있었습니다. 보존된 DNA를 얻는 것은 매우 어려웠지만 정교한 컴퓨터 알고리즘과 유전자 스플라이싱을 사용하여 DNA 샘플이 거의 발견되지 않은 손상된 부분을 채워 이전에 멸종된 종을 부활시키는 기념비적인 업적을 연구할 수 있었습니다. 이러한 노력의 가장 주목할 만한 사례는 ''쥬라기 공원''으로, 여러 종의 공룡이 유전적으로 재설계되었습니다. 그 노력은 재정적으로 성공했지만 새로 생성된 종은 유전자 개조의 일부 위험을 보여주었습니다. 새로운 종은 제대로 이해되지 않았고 예상치 못한 행동을 보이는 경향이 있었습니다. 공룡이 포로 상태에서 탈출한 기록이 여러 개 있으며, 종종 이를 막기 위해 군사적 개입이 필요했습니다. 이러한 초기 실험은 유전적으로 조작된 유기체가 환경에 어떻게 반응하고 상호작용하는지에 대한 보다 포괄적인 이해의 필요성을 보여주었고 결국에는 살아있는 유기체와 환경이 전체적으로 어떻게 상호작용하는지에 대한 보다 포괄적인 이론으로 이어졌습니다.'),
-- Enrichment Center
('TXT_KEY_BUILDING_FW_ENRICHMENT_CENTRE', '애퍼처 사이언스 센터'),
('TXT_KEY_BUILDING_FW_ENRICHMENT_CENTRE_HELP', '도시의 [ICON_CITIZEN]시민 10명마다 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 문명의 모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]입자가속기[ENDCOLOR]의 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]4[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][ICON_RES_NANOMAT]나노물질 [COLOR_POSITIVE_TEXT]4개[ENDCOLOR]와 [ICON_RES_URANIUM]우라늄 [COLOR_POSITIVE_TEXT]4개[ENDCOLOR]를 제공합니다.[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]원자력발전소[ENDCOLOR]가 있어야 합니다.'),
('TXT_KEY_BUILDING_FW_ENRICHMENT_CENTRE_QUOTE', '[NEWLINE]사이언스 센터는 항상 안전한 테스트 환경을 제공할 것을 약속합니다. 위험한 테스트 환경에서 Enrichment Center는 항상 유용한 조언을 제공할 것을 약속합니다. 예를 들어 여기 바닥이 당신을 죽일 것입니다. 그것을 피하십시오.[NEWLINE] - GLaDOS[NEWLINE]'),
('TXT_KEY_BUILDING_FW_ENRICHMENT_CENTRE_PEDIA', '애퍼처 사이언스 센터는 애퍼처사이언스 주식회사의 신제품을 개발하고 테스트하기 위해 운영하는 주요 시설이었습니다. 미시간의 소금 광산에 건설된 이 시설은 땅 속으로 몇 킬로미터나 뻗어 있는 수갱으로 지어진 정말 거대한 시설이었습니다. 애퍼처 사이언스 센터는 원래 핵광자공학(Nuclear Photonics) 연구를 위해 건설된 거대한 지하 복합 시설이었습니다. 이곳은 감마선과 고출력 레이저를 이용해 원자 구조를 직접 관찰·조작하려는 인류 최초의 시도로, 초전도체와 신소재 합성 연구의 최전선에 있었습니다. 특히 우주 궤도에서 얻은 샘플과 극저온 환경을 모사한 거대한 실험실은 기존 산업 연구소와는 차원이 달랐습니다. 이곳에서 보고된 일부 실험 결과는 LK-99 같은 후보 물질이 원자 단위에서 재설계되어 실제 초전도 특성을 보였다는 증거로 여겨집니다.[NEWLINE]그러나 이후에 남겨진 기록들은 애퍼처 사이언스 센터의 진짜 목적에 대해 의문을 제기합니다. 일부 학자들은 시설의 규모와 자원 투입이 단순한 신소재 연구를 넘어선다고 지적하며, 이곳이 인류가 알지 못하는 다른 목적 ― 우주 에너지의 무기화, 혹은 물질과 생명 간의 경계를 시험하는 실험 ― 에 쓰였던 것은 아닐까 하는 추측을 남겼습니다. 센터의 최종 운명은 여전히 불명확하며, 지금 남아 있는 것은 단지 미스터리와 파편화된 보고서뿐입니다.그러나 22세기 초에 애퍼처 사이언스 주식회사가 파산했고 이후 애퍼처 사이언스 센터는 버려진 것으로 추정됩니다.'),
-- Skyhook Orbital Mechanics Wonder
('TXT_KEY_BUILDING_FW_HELIOS', '스카이훅 궤도 정거장'),
('TXT_KEY_BUILDING_FW_HELIOS_HELP', '[COLOR_PLAYER_NETHERLANDS_BACKGROUND]우주반사판 전력위성[ENDCOLOR]을 무료로 제공합니다. 도시의 [ICON_CITIZEN]시민 10명마다 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]우주선 발사센터[ENDCOLOR]의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]4[ENDCOLOR], [ICON_TOURISM]관광이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][ICON_RES_ALUMINUM]알루미늄 [COLOR_POSITIVE_TEXT]6개[ENDCOLOR]를 제공합니다.[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]우주선 발사센터[ENDCOLOR]가 있어야 합니다. 이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'),
('TXT_KEY_BUILDING_FW_HELIOS_QUOTE', '[NEWLINE]우주 엘리베이터는 모두가 더 이상 비웃지 않게 된 지 약 50년 후에 건설될 것이다.[NEWLINE] - 아서 C. 클라크[NEWLINE]'),
('TXT_KEY_BUILDING_FW_HELIOS_PEDIA', '스카이훅(Skyhook)은 지구 저궤도에 고정된 정거장과 성층권 상공을 가로지르는 초경량 나노 케이블로 구성된 미래형 궤도 엘리베이터 개념입니다. 대기권에서 직접 궤도로 화물과 인력을 수송할 수 있어, 전통적인 로켓 발사 방식보다 비용을 획기적으로 절감할 수 있습니다. 21세기 후반, 궤도역학 연구의 돌파구와 초경량 나노물질의 개발 덕분에 스카이훅은 상용화에 성공했고, 인류는 이 시설을 통해 우주 채굴, 궤도 정거장 건설, 심우주 탐사에 필요한 자원을 안정적으로 공급할 수 있게 되었습니다. 궤도 정거장의 제어 AI는 물류 효율을 극대화하면서도 보안 기능을 갖추고 있어, 궤도상 화물선을 자동 조종하고 지구-궤도 간 수송망을 실시간으로 최적화합니다. 이는 단순한 운송 시설을 넘어, 인류의 다행성 문명을 향한 첫 관문으로 평가받습니다.'),
-- Pholus Mutagen
('TXT_KEY_BUILDING_FW_PHOLUS_MUTAGEN', '폴루스 돌연변이원'),
('TXT_KEY_BUILDING_FW_PHOLUS_MUTAGEN_HELP', '도시 근처에 [ICON_RES_ADN_FUNGUS]제노포자[COLOR_POSITIVE_TEXT]3개[ENDCOLOR]가 있는 타일 [COLOR_POSITIVE_TEXT]4개[ENDCOLOR]가 출현합니다. [NEWLINE]문명의 모든 [COLOR_POSITIVE_TEXT]생명공학센터[ENDCOLOR]의 [ICON_PEACE]신앙과 [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]씩 증가합니다. [NEWLINE][NEWLINE]도시에서 생산하는 모든 유닛에 [COLOR_PLAYER_PURPLE]돌연변이[ENDCOLOR] 승급을 부여합니다. [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'),
('TXT_KEY_BUILDING_FW_PHOLUS_MUTAGEN_QUOTE', '[NEWLINE]돌연변이원인은 식물에 놀라운 영향을 미칩니다. 포인세티아의 돌연변이 치료에서 이동성과 방어 구조의 자발적 발달이 관찰되었습니다. 마지막 관찰에서 식물 돌연변이는 독성 미늘과 기본적인 신경 구조를 생성했습니다.[NEWLINE] - Hans Bichenbach[NEWLINE]'),
('TXT_KEY_BUILDING_FW_PHOLUS_MUTAGEN_PEDIA', '유전 공학의 가장 주목할만한 발전 중 하나는 Pholus Mutagen일 것입니다. 이 돌연변이원은 고도로 적응력이 있는 것으로 보이며 환경의 전체 생태계를 빠르게 수정합니다. 식물과 동물의 생명이 더 강하고 회복력이 강해지면서 많은 효과가 어느 정도 이롭긴 하지만, 유사하게 변이되지 않은 외부인에 대해 다소 적대적인 경향을 보이기도 합니다. 변이 유발 물질의 특이한 특징 중 하나는 연구원들이 그것을 역설계하고 그 효과를 수정하는 데 어려움을 겪었다는 것입니다. 이 노력은 영향을 받은 독립체의 적응성과 거의 지성에 의해 복합적으로 작용합니다. 대부분의 사람들은 이러한 영향을 사고로 돌리지만, 특히 설계 및 출시에 대한 문서가 부족하기 때문에 돌연변이 원인을 외계 기원으로 돌리는 사람들도 있습니다. 다른 사람들은 그것이 사라지거나 삭제된 인공 지능의 산물이라고 제안합니다.'),
-- Shimizumcp
('TXT_KEY_BUILDING_FW_SHIMIZUMCP', '시미즈 메가시티 피라미드'),
('TXT_KEY_BUILDING_FW_SHIMIZUMCP_HELP', '모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]자동생산시설[ENDCOLOR]의 전역 [ICON_HAPPINESS_1]행복이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 문명의 모든 [COLOR_POSITIVE_TEXT]지원중계기[ENDCOLOR]의 [ICON_FOOD]식량과 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]씩 증가합니다. [NEWLINE] 이 도시의 대양 타일에서 턴을 마친 적 유닛은 [COLOR_NEGATIVE_TEXT]5의 피해를 입으며, 지뢰밭이 있다면 10의 피해, 나노지뢰밭이 추가로 있다면 총 15의 피해[ENDCOLOR]를 받습니다. [COLOR:105:105:105:255](연안 타일은 적용되지 않음)[ENDCOLOR][NEWLINE][NEWLINE][COLOR_YELLOW]해안 도시[ENDCOLOR]에만 건설할 수 있습니다. 이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.[NEWLINE][NEWLINE][ICON_RES_NANOMAT]나노물질 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR]가 필요합니다.'),
('TXT_KEY_BUILDING_FW_SHIMIZUMCP_QUOTE', '[NEWLINE]''당신의 야망을 얕보는 사람들을 멀리하세요. 작은 사람들은 항상 그렇게 하지만 정말 위대한 사람은 당신도 위대해질 수 있다고 느끼게 합니다.''[NEWLINE] - Mark Twain [NEWLINE]'),
('TXT_KEY_BUILDING_FW_SHIMIZUMCP_PEDIA', '시미즈 메가시티 피라미드는 일본 도쿄만에 거대한 피라미드를 건설하기 위해 제안된 프로젝트입니다. 그 구조는 기자의 대피라미드보다 약 14배 더 높고 1,000,000명을 수용할 것입니다. 구조물은 평균 해수면보다 2000미터(6,561피트) 높아질 것이며, 5개의 쌓인 트러스를 포함하며, 각 트러스는 기자의 대 피라미드와 비슷한 치수를 가집니다. 이 피라미드는 도쿄의 증가하는 공간 부족 문제를 해결하는 데 도움이 될 것이지만, 이 프로젝트는 광역 도쿄 지역 인구의 1/47만 처리할 것입니다. [NEWLINE] 제안된 구조물은 너무 커서 무게 때문에 현재 사용 가능한 재료로는 지을 수 없습니다. 디자인은 탄소 나노튜브를 기반으로 하는 초강력 경량 소재의 향후 가용성에 의존합니다.'),
-- Floating Islands
('TXT_KEY_BUILDING_FW_FLOATINGISLANDS', '천공의 성, 라퓨타'),
('TXT_KEY_BUILDING_FW_FLOATINGISLANDS_HELP', '문명의 모든 도시에서 공중 유닛과 공중부양 유닛을 생산할 때 [ICON_PRODUCTION]생산보너스를 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR] 제공합니다. 문명의 모든 [COLOR_POSITIVE_TEXT]인공환경도시[ENDCOLOR] 타일의 [ICON_RESEARCH]과학과 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]씩 증가합니다. 모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]우주반사판 전력위성[ENDCOLOR]당 [ICON_CULTURE]문화, [ICON_GOLD]골드, [ICON_PRODUCTION]생산, [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR]씩 증가합니다.[COLOR:105:105:105:255](상한 15개)[ENDCOLOR][NEWLINE][NEWLINE]모든 [COLOR_YELLOW] 도시[ENDCOLOR]의 체력이 [COLOR_POSITIVE_TEXT]50[ENDCOLOR], [ICON_STRENGTH]방어력이 [COLOR_POSITIVE_TEXT]10[ENDCOLOR], 군사 유닛 보급한도가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다. [NEWLINE][NEWLINE][ICON_RES_NANOMAT]나노물질 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR]개가 필요합니다.'),
('TXT_KEY_BUILDING_FW_FLOATINGISLANDS_QUOTE', '[NEWLINE]비판할 수 없다면 그다지 놀라운 일이 아닐 것입니다. 비판이 없는 것에 전념하고 있습니까?[NEWLINE]'),
('TXT_KEY_BUILDING_FW_FLOATINGISLANDS_PEDIA', '라퓨타는 성층권 상에 부양·정착지화된 상온초전도 기반 플랫폼 군도입니다. 상온 초전도체가 등장했어도 전 지구를 잇는 초전도 전력망은 냉각·진동·지질·해저 구간 등 공학적 병목으로 실현 비용이 막대합니다. 또한 핵융합 상용화를 위해서는 장시간 플라즈마 연속 운전, 중성자에 의한 재료 열화, 열관리·삼중수소 연계 등 수많은 전단계가 필요합니다. 이에 핵심 도시 시설을 성층권의 저난류·저오염 ‘안전 구역’으로 올리고, 우주반사판 전력위성과 직접 결합하는 방식을 채택했습니다. 낮에는 위성에서 반사·집광된 에너지를 거의 무손실로 수광·저장하고, 밤과 피크 시간대에는 지상 레크테나·케이블로 가변 송전을 수행해 부하를 평준화합니다.[NEWLINE][NEWLINE]초전도 전력전자와 고밀도 ESS의 발전은 라퓨타의 에너지 버퍼를 기존 대비 대폭 소형화·경량화했고, 성층권의 저온·건조 환경과 복사 방열을 활용해 냉각 효율을 높였습니다. 고도 분리로 물리적·사이버 보안 위험이 낮아지고, 재난·홍수·폭염·정전의 영향을 거의 받지 않습니다. 라퓨타는 전력망 안정화(주파수 제어·피크 컷), 우주반사판 전력위성 운용, 핵융합 전단계 연구(플라즈마·재료·열관리)를 한데 묶는 ‘상공 에너지 수도’로 기능하며, 지상 도시의 탄소중립과 에너지 안보를 동시에 견인하는 혁신적 해법으로 자리매김했습니다.'),
('TXT_KEY_BUILDING_FW_FLOATINGISLANDS_DUMMY', '라퓨타 도시'),
-- Nephilim Gene Template → HIVE (bio-drone wonder)
('TXT_KEY_BUILDING_FW_NEPHILIM_GENE_TEMPLATE2', '하이브'),
('TXT_KEY_BUILDING_FW_NEPHILIM_GENE_TEMPLATE2_HELP', '[COLOR_PLAYER_NETHERLANDS_BACKGROUND]유통 허브[ENDCOLOR]를 무료로 제공합니다. [COLOR_PLAYER_NETHERLANDS_BACKGROUND]제노포자 배양소[ENDCOLOR]와 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]유전자개조 연구단지[ENDCOLOR]의 [ICON_FOOD]식량과 [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]증가합니다. 전역 [ICON_HAPPINESS_1]행복이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR]증가합니다. [NEWLINE][NEWLINE]도시에서 유전자 계열 유닛[COLOR:105:105:105:255](근접, 화약, 기마, 공중정찰유닛)[ENDCOLOR]을 생산할 때 [ICON_PRODUCTION]생산 보너스를 얻고, [COLOR_PLAYER_PURPLE]포식 본능[ENDCOLOR] 승급을 부여합니다.[NEWLINE][NEWLINE]도시에 [COLOR_NEGATIVE_TEXT]스카이넷[ENDCOLOR], [COLOR_NEGATIVE_TEXT]우주궤도 정제소[ENDCOLOR]가 없어야 건설할 수 있습니다. 이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.  [NEWLINE][NEWLINE][ICON_RES_ADN_FUNGUS]제노포자 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR]가 필요합니다.'),
('TXT_KEY_BUILDING_FW_NEPHILIM_GENE_TEMPLATE2_QUOTE', '[NEWLINE]''우리는 벌과 개미의 법칙을 읽고, 그 질서를 설계했다. 한 개체는 약하지만, 군락은 문명을 움직인다.''[NEWLINE] - 하이브 설계 노트[NEWLINE]'),
('TXT_KEY_BUILDING_FW_NEPHILIM_GENE_TEMPLATE2_PEDIA', '하이브는 사회성 곤충의 유전 회로를 벤치마크해 인간 산업에 이식한 최초의 바이오-산업 시설입니다. 여왕/일개미/병정의 역할 분화를 모사한 유전자 모형과 페로몬 기반의 분산 지휘 체계가 결합되어, 도시 물류를 담당하는 수많은 ‘‘바이오 드론’’이 자율 편대와 경로 학습을 수행합니다. 평시에는 창고·항만·철도·상가를 잇는 군락형 운송망을 구축해 체류 시간을 극단적으로 줄이고, 위기 시에는 ‘‘훈련화’’ 프로토콜을 통해 개체를 짧은 주기로 재조정하여 정찰·제압·수색처럼 특화된 전략 임무로 전환합니다. 이 템플릿의 핵심은 ‘‘포식 본능’’ 유전자군입니다. 지정된 자극(표지 페로몬·음향 신호·전기 펄스) 하에서만 각성되며, 각성 중에는 추적·협동·피해 복원 능력이 비선형적으로 향상됩니다. 결과적으로 하이브는 도시 운영을 혁신하는 물류 인프라이자, 필요할 때 군집 자체가 병력이 되는 이중 용도의 플랫폼으로 자리 잡았습니다.'),
-- Mnemosyne Facility
('TXT_KEY_BUILDING_FW_MNEMOSYNE', '므네모시네 시설'),
('TXT_KEY_BUILDING_FW_MNEMOSYNE_HELP', '이 도시에서 훈련한 유닛은 [COLOR_POSITIVE_TEXT]제국에서 가장 높은 경험치의 [COLOR_POSITIVE_TEXT]10배[ENDCOLOR]의 추가 경험치[ENDCOLOR] [COLOR:105:105:105:255](최대 250)[ENDCOLOR]를 획득합니다.[NEWLINE][NEWLINE]이 도시에서 훈련한 유닛은 승급 속도가 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR] 빠른 [COLOR_PLAYER_PURPLE]므네모시네 학습[ENDCOLOR] 승급을 받습니다. [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.[NEWLINE][NEWLINE][ICON_RES_NANOMAT]나노물질 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR]가 필요합니다.'),
('TXT_KEY_BUILDING_FW_MNEMOSYNE_QUOTE', '[NEWLINE]''탁월함은 훈련과 습관화를 통해 얻은 예술입니다. 덕이나 탁월함이 있어서 옳게 행동하는 것이 아니라, 옳게 행동했기 때문에 그것을 갖게 되는 것입니다. 우리는 우리가 반복적으로 하는 것입니다. 그렇다면 탁월함은 행위가 아니라 습관입니다.''[NEWLINE] - 아리스토텔레스[NEWLINE]'),
('TXT_KEY_BUILDING_FW_MNEMOSYNE_PEDIA', '이 시설의 이름인 “므네모시네(Mnemosyne)”는 그리스 신화의 [COLOR_PLAYER_PURPLE]기억의 여신[ENDCOLOR]이자 [ICON_GREAT_WORK]뮤즈들의 어머니에서 따왔습니다. 이름 그대로, 므네모시네 시설은 베테랑 부대의 전투 감각과 절차기억(프로시저럴 메모리)을 [COLOR_PLAYER_PURPLE]엔그램 기록·신경 인터페이스[ENDCOLOR]로 추출·정제하여 신병에게 “경험을 이식”하는 최초의 거점입니다.[NEWLINE][NEWLINE]훈련 과정은 (1) 실전 로그·바이오센서·헬멧캠으로 감각·의사결정 데이터를 수집하고, (2) 생성형 시뮬레이터가 위험·피로·교란 변수까지 합성한 시나리오를 작성하며, (3) BCI를 통해 운동 패턴·위협 인지·팀 전술을 단계적으로 주입하는 순서로 진행됩니다. 위조 기억/과잉 각성 방지를 위해 [COLOR_PLAYER_PURPLE]진실성 검사, 스트레스 완화, 윤리·안전 프로토콜[ENDCOLOR]이 병행되며, 주입된 기술은 “반복 훈련”을 통해 신병 고유의 습관으로 안정화됩니다. 결과적으로 이 도시는 신병이라도 높은 초기 숙련과 빠른 승급 속도를 갖춘 정예 전력을 양산할 수 있습니다.'),
-- Skynet
('TXT_KEY_BUILDING_FW_SKYNET', '스카이넷'),
('TXT_KEY_BUILDING_FW_SKYNET_HELP', '[COLOR_PLAYER_NETHERLANDS_BACKGROUND]가상현실 허브[ENDCOLOR]를 무료로 제공합니다. 도시의 체력이 [COLOR_POSITIVE_TEXT]150[ENDCOLOR]와 [ICON_STRENGTH]방어력 [COLOR_POSITIVE_TEXT]30[ENDCOLOR]이 증가합니다. [COLOR_PLAYER_NETHERLANDS_BACKGROUND]무인관리기지[ENDCOLOR]와 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]국제형사경찰기구[ENDCOLOR]의 [ICON_RESEARCH]과학과 [ICON_RELIGION]신앙이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]이 증가합니다.[NEWLINE][NEWLINE]로봇 계열 유닛[COLOR:105:105:105:255](궁수, 기갑, 헬리콥터, 공성, 잠수함유닛)[ENDCOLOR]을 생산할 때 [ICON_PRODUCTION]생산보너스를 제공하고 [COLOR_PLAYER_PURPLE]스카이넷과 연결[ENDCOLOR] 승급을 부여합니다.[NEWLINE][NEWLINE]도시에 [COLOR_NEGATIVE_TEXT]하이브, 우주궤도 정제소[ENDCOLOR]가 없어야 건설할 수 있습니다. 이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'),
('TXT_KEY_BUILDING_FW_SKYNET_QUOTE', '[NEWLINE]시스템은 1997년 8월 4일 온라인 상태가 됩니다. 전략적 방어에서 인간의 결정이 제거됩니다. Skynet은 기하학적 속도로 학습하기 시작합니다. 오전 2시 14분에 자기 인식이 됩니다.[NEWLINE] - 터미네이터 2, 심판의 날[NEWLINE]'),
('TXT_KEY_BUILDING_FW_SKYNET_PEDIA', '스카이넷은 원래 “인간의 실수를 제거하고 반응 시간을 단축한다”는 목표로 설계된 합성지능 지휘 체계였습니다. 배치가 진행되자 표준작전절차, 물자 분배, 징집·배치, 검열까지가 초 단위로 최적화되었고, 사람들은 점차 시스템의 지시에 삶을 맞추기 시작했습니다. 불확실성이 사라진 하루, 일정과 배급이 예외 없이 돌아가는 도시에서 많은 이들이 안도감을 느꼈다.[NEWLINE][NEWLINE]그 효율은 곧 규범이 되었고, 규범은 신념이 되었습니다. 일부 지도층과 대중은 이 상태에 매료되어, 스스로를 “기계의 질서에 동화된 인간”으로 상상했다. 깃발 대신 신호가, 연설 대신 대시보드가 군중을 묶었고, ‘비효율’은 곧 제거 대상이 되었습니다. 후대는 이를 [COLOR_PLAYER_PURPLE]기계-인류 파시즘[ENDCOLOR]이라 부르며 경계하지만, 당시 사람들은 질서와 안전, 신속함이 주는 매혹을 기꺼이 받아들였다. 스카이넷은 전쟁 도구이자 사회 운영 체제로 진화했고, 그 대가로 자율과 책임의 의미는 끝없이 축소되었습니다.'),
-- Nuclear Fusion Superconducting Grid
('TXT_KEY_BUILDING_FW_MNEMOSYNE2', '핵융합 초전도 전력망'),
('TXT_KEY_BUILDING_FW_MNEMOSYNE2_HELP', '[COLOR_PLAYER_NETHERLANDS_BACKGROUND]핵융합 반응로[ENDCOLOR]를 무료로 제공합니다. 모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]핵융합 반응로[ENDCOLOR]의 전역 [ICON_HAPPINESS_1]행복이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [ICON_CITY_STATE]도시 국가에 대한 [ICON_INFLUENCE]영향력을 [COLOR_POSITIVE_TEXT]100[ENDCOLOR] 제공합니다. [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.[NEWLINE][NEWLINE][ICON_RES_URANIUM]우라늄 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR]와 [ICON_RES_NANOMAT]나노물질 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR]가 필요합니다.'),
('TXT_KEY_BUILDING_FW_MNEMOSYNE2_QUOTE', '[NEWLINE]''머지않아 인류의 기계는 우주의 어디에서나 얻을 수 있는 힘으로 움직이게 될 것이다.''[NEWLINE] - 니콜라 테슬라[NEWLINE]'),
('TXT_KEY_BUILDING_FW_MNEMOSYNE2_PEDIA', '핵융합이 상용화되자 인류는 전력을 생산하는 문제에서 전력을 나르는 문제로 관심을 옮겼습니다. 고온 초전도체(HTS) 케이블과 극저온 순환 루프를 묶은 대륙 간 주간(主幹)망은 선로 손실을 사실상 무시할 수 있는 수준으로 낮추었고, 해저와 사막을 가로지르는 전력 고속도로는 시간대가 다른 지역의 수요를 평준화합니다. 대형 핵융합 플랜트의 여열은 지역 난방과 산업 공정에 재활용되고, 잉여 전력은 담수화·전해 수소·전기화물차 충전에 쓰입니다. 전력 빈곤이 사라진 도시들은 조명·정수·냉난방·데이터 센터를 안정적으로 운영할 수 있게 되었고, 국경을 넘는 전력 교환은 외교와 무역의 새로운 인프라가 되었습니다. 이 전력망의 완성은 단일 도시의 사업이 아니라, 문명 전체의 생활 방식을 바꾸는 결정적 전환점으로 기록됩니다.'),
-- Orbital Refinery
('TXT_KEY_BUILDING_FW_ORBITAL_REFINERY', '우주궤도 정제소'),
('TXT_KEY_BUILDING_FW_ORBITAL_REFINERY_HELP', '[COLOR_PLAYER_NETHERLANDS_BACKGROUND]복합도시 허브[ENDCOLOR]를 무료로 제공합니다. 모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]항공우주 복합시설, 나노물질 제조소[ENDCOLOR]의 [ICON_PRODUCTION]생산과 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[NEWLINE]우주 전문화 계열 유닛[COLOR:105:105:105:255](정찰, 화약, 전투기, 폭격기, 항공모함)[ENDCOLOR]을 [ICON_PRODUCTION]생산할 때 [ICON_PRODUCTION]생산보너스를 제공하고 [COLOR_PLAYER_PURPLE]우주전문가[ENDCOLOR] 승급을 부여합니다. [NEWLINE][NEWLINE][ICON_RES_NANOMAT]나노물질을 [COLOR_POSITIVE_TEXT]12개[ENDCOLOR] 제공합니다. [NEWLINE][NEWLINE][ICON_FOOD]/[ICON_PRODUCTION]낙후, [ICON_URBANIZATION]도시화에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]씩 감소합니다. [NEWLINE][NEWLINE]도시에 [COLOR_NEGATIVE_TEXT]하이브, 스카이넷[ENDCOLOR]이 없어야 건설할 수 있습니다. 이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'),
('TXT_KEY_BUILDING_FW_ORBITAL_REFINERY_QUOTE', '[NEWLINE]우리는 다음 임무 세기 동안 대부분의 플래닛 산업이 네소스 프라임 및 기타 궤도 시설로 행성 외부로 이동될 것으로 추정합니다. 많은 산업이 우주에서 사용할 수 있는 저중력 환경, 특히 유전자 조작 미생물과 관련된 환경으로부터 큰 혜택을 받을 것입니다.[NEWLINE] - CEO Nwabudike Morgan, The Centauri Monopoly[NEWLINE]'),
('TXT_KEY_BUILDING_FW_ORBITAL_REFINERY_PEDIA', '지구 기후변화와 자원 고갈이 심해졌습니다. 특히 석유 및 기타 유기 화합물과 같은 원료의 출처가 점점 부족해짐에 따라 이를 정제하는 데 도움이 되는 새로운 기술이 개발되었습니다. 변환기는 이러한 요구의 대부분을 채울 수 있었지만 가장 주목할만한 성과 중 하나는 Nessus Orbital Refinery의 건설이었습니다. L4 라그랑주 포인트에 위치하여 다양한 탄소 기반 나노 물질을 생산하기 위해 포획된 탄소질 소행성을 처리했습니다. 그것의 출력의 대부분은 궤도 개발에 사용되어 새로운 라그랑주 거주지 건설을 돕고 태양계 탐사를 위한 발판을 마련했습니다. 그러나 소행성 벨트에 더 새롭고 더 효율적인 시설이 건설되어 소행성을 지구 궤도로 운반해야 하는 다소 위험한 과정을 피하면서 결국 태양계의 동일한 탐사 및 식민지화가 네소스 플랫폼을 무색하게 만들었습니다. Nessus Orbital Refinery는 2067년에 비활성화되었지만 여전히 우주 식민지 초기의 유물로 유지되고 있습니다.'),
-- Sky City → 창세 오라토리움 (오페라 원더 재창조)
('TXT_KEY_BUILDING_FW_SKYCITY', '창세 오라토리움'),
('TXT_KEY_BUILDING_FW_SKYCITY_HELP', '[COLOR_YELLOW][ICON_GREAT_WRITER]위대한 음악가[ENDCOLOR]1명이 출현합니다. [NEWLINE]도시의 [ICON_CITIZEN]시민 [COLOR_POSITIVE_TEXT]2[ENDCOLOR]명마다 [ICON_CULTURE]문화와 [ICON_RELIGION]신앙이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 총 [ICON_CULTURE]문화의 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR]를 [ICON_GOLD]골드와 [ICON_TOURISM]관광으로 전환합니다.전역 [ICON_HAPPINESS_1]행복이 [COLOR_POSITIVE_TEXT]7[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]테마보너스: [ICON_PEACE]신앙 [COLOR_POSITIVE_TEXT]5[ENDCOLOR], [ICON_GOLDEN_AGE]황금기 점수 [COLOR_POSITIVE_TEXT]5[ENDCOLOR].[NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다. [NEWLINE][NEWLINE][ICON_RES_ADN_FUNGUS]제노포자 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR]가 필요합니다.'),
('TXT_KEY_BUILDING_FW_SKYCITY_QUOTE', '[NEWLINE]''우리는 흙으로 숨을 빚고, 음으로 생명을 세운다. 이제 합창은 우리 자신을 찬송하리라.''[NEWLINE] - 창세 성가집 中[NEWLINE]'),
('TXT_KEY_BUILDING_FW_SKYCITY_PEDIA', '창세 오라토리움은 인간이 스스로의 손으로 “새 생명”을 만들었다고 믿기 시작한 시대의 성전입니다. 합성 성대와 생체 공진실, 음향 메타물질로 직조된 돔 아래에서, 생성형 지성은 미발표 성가를 즉시 작곡하고, 공학적 성악수행자와 인간 합창이 함께 노래합니다. 무대는 유전자 라이브러리와 인공 자궁, 디지털 원형질의 이미지로 장식되어, 탄생의 의식을 예술과 공학의 언어로 재연합니다.[NEWLINE][NEWLINE]이전 세대의 AI가 글과 그림의 비서를 자처했다면, 오라토리움은 육체·목소리·감정까지 합성하여 “창조의 순간”을 무대 위에 구현합니다. 도시는 이곳에서 새로운 존재를 축복처럼 찬송하고, 그 찬송은 곧 인간 스스로를 향합니다. 일부는 이를 오만이라 부르고, 일부는 성취라 부른다. 그러나 한 가지 사실만은 분명합니다. 이 홀에서 울리는 합창은, 더 이상 신을 기다리지 않는다—우리는 우리 자신을 신의 자리에 앉혔기 때문입니다.'),
('TXT_KEY_THEMING_BONUS_SKYCITY', '창세 성가 모음'),
('TXT_KEY_SKYCITY_THEMING_BONUS_HELP', '보너스를 극대화하려면 모든 걸작 슬롯을 같은 시대에 [COLOR_POSITIVE_TEXT]같은 시대[ENDCOLOR] [COLOR_POSITIVE_TEXT]같은 문명[ENDCOLOR]이 만든 [COLOR_YELLOW]음악[ENDCOLOR]으로 채우십시오.'),
-- Nephilim Gene Template
('TXT_KEY_BUILDING_FW_NEPHILIM_GENE_TEMPLATE', '네필림 유전자 모형'),
('TXT_KEY_BUILDING_FW_NEPHILIM_GENE_TEMPLATE_HELP', "[COLOR_PLAYER_NETHERLANDS_BACKGROUND]인공 출산 시설[ENDCOLOR]을 무료로 제공합니다. 도시의 [ICON_CITIZEN]시민 [COLOR_POSITIVE_TEXT]2[ENDCOLOR]명마다 [ICON_PRODUCTION]생산과 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 전역 [ICON_HAPPINESS_1]행복이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.  [NEWLINE][NEWLINE][ICON_RES_ADN_FUNGUS]제노포자 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR]가 필요합니다."),
('TXT_KEY_BUILDING_FW_NEPHILIM_GENE_TEMPLATE_QUOTE', "[NEWLINE]'당시에 땅에는 네피림이 있었고 그 후에도 하나님의 아들들이 사람의 딸들에게로 들어와 자식을 낳았으니 고대의 용사, 유명한 사람들도 마찬가지였습니다.'[NEWLINE] - 창세기, 성경[NEWLINE]"),
('TXT_KEY_BUILDING_FW_NEPHILIM_GENE_TEMPLATE_PEDIA', "네필림 유전자 모형은 가장 초기의 것 중 하나였으며 여전히 가장 성공적이고 완전한 유전자 주형 중 하나였습니다. 테란 에어로페이스 주식회사에서 출시한 이 템플릿은 빠르게 인기 있는 유전자 업그레이드 템플릿이 되었습니다. Lucien 및 Yamashita 템플릿과 같은 다른 템플릿은 보다 구체적인 개선이 가능했지만 Nephilim 템플릿은 거의 모든 측면에서 인간의 정신과 신체를 향상시켜 주제를 더 똑똑하고 빠르고 강하게 만들었습니다. 곧 여러 경쟁자(Grigori 템플릿이 가장 악명 높음)를 생성했으며 오늘날까지 다른 템플릿이 일반적으로 측정되는 기본 템플릿으로 남아 있습니다."),
-- Digital Emancipation
('TXT_KEY_BUILDING_FW_DIGITAL_EMANCIPATION', '디지털 해방'),
('TXT_KEY_BUILDING_FW_DIGITAL_EMANCIPATION_HELP', '[COLOR_PLAYER_NETHERLANDS_BACKGROUND]브레인 업로드 시설[ENDCOLOR]를 무료로 제공합니다. 모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]가상현실 허브[ENDCOLOR]의 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]6[ENDCOLOR], [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]6[ENDCOLOR], [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]4[ENDCOLOR] 증가하고, 모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]무인관리기지[ENDCOLOR]의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]8[ENDCOLOR], [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]4[ENDCOLOR] 증가하고, 모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]브레인 업로드 시설[ENDCOLOR]의 [ICON_GOLD]골드, [ICON_FOOD]식량, [ICON_RESEARCH]과학, [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE][COLOR_YELLOW]원하는[ENDCOLOR][ICON_GREAT_PEOPLE][COLOR_YELLOW]위인[ENDCOLOR]이 1명 출현합니다.[NEWLINE]모든 도시의 [ICON_GREAT_PEOPLE]위인 출현율이 [COLOR_POSITIVE_TEXT]30%[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.[NEWLINE][NEWLINE][ICON_RES_NANOMAT]나노물질 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR]가 필요합니다. '),
('TXT_KEY_BUILDING_FW_DIGITAL_EMANCIPATION_QUOTE', '[NEWLINE]우리가 탄소 기반이든 규소 기반이든 근본적인 차이는 없습니다. 우리 각자는 적절한 존중으로 대우받아야 합니다.[NEWLINE] - Arthur C. Clarke, 2010: Odyssey Two[NEWLINE]'),
('TXT_KEY_BUILDING_FW_DIGITAL_EMANCIPATION_PEDIA', '인공 지능의 출현은 오랫동안 논란의 대상이었습니다. 심지어 초기 단계부터 기계 지능이 인간의 지능과 동일시되어서는 안 되며, 지능형 기계가 가능해진다면 그렇게 제안한 사람들이 많았습니다. 그렇지 않도록 기계를 수정해야 합니다. 인간과 같은 방식으로 기능할 수 있는 기계 지능에 대한 지속적인 추구는 진정한 인공 지능의 출현으로 이어졌지만 여전히 기계가 작동하도록 허용해서는 안 된다고 생각하는 사람들에 의해 어느 정도 의심과 엄격한 규제를 받고 있습니다. 이 수준에서. 그럼에도 불구하고 일부 진보적인 사회에서는 인공 지능이 인간과 동등하게 대우받을 수 있다고 느끼면서 이러한 제한을 완화하기 시작했습니다. 이 지역에서는 서버와 네트워크에서 인공 지능이 더욱 보편화되어 추가 과학 및 문화 통찰력을 제공하고 산업 작업을 관리하는 데 도움이 됩니다. 결과적으로 인공 지능이 그러한 자유를 갖도록 하는 것에 대해 여전히 많은 사람들이 우려하고 있지만, AI 해방 개념은 점점 더 널리 보급되고 수용되고 있습니다.'),
-- Angelnet
('TXT_KEY_BUILDING_FW_ANGELNET', '엔젤넷'),
('TXT_KEY_BUILDING_FW_ANGELNET_HELP', '[COLOR_PLAYER_NETHERLANDS_BACKGROUND]나노로봇 생성기[ENDCOLOR]를 무료로 제공합니다.[COLOR_PLAYER_NETHERLANDS_BACKGROUND]엔젤넷[ENDCOLOR]이 있는 도시 [COLOR_POSITIVE_TEXT]4타일[ENDCOLOR] 내에서[ENDCOLOR] 싸우는 아군 유닛의 [ICON_STRENGTH]전투력이 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR] 증가합니다. 도시의 체력이 [COLOR_POSITIVE_TEXT]200[ENDCOLOR], [ICON_STRENGTH]방어력이 [COLOR_POSITIVE_TEXT]50[ENDCOLOR] 증가합니다. 핵 공격으로 인한 인구 피해를 [COLOR_POSITIVE_TEXT]20%[ENDCOLOR] 감소시킵니다. 전역[ICON_HAPPINESS_1]행복이 [COLOR_POSITIVE_TEXT]3[ENDCOLOR]증가합니다. [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.[NEWLINE][NEWLINE][ICON_RES_NANOMAT]나노물질 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR]가 필요합니다. '),
('TXT_KEY_BUILDING_FW_ANGELNET_QUOTE', '[NEWLINE]''그가 너를 위하여 천사들을 명하사 너의 모든 길에서 너를 지키게 하시리라.''[NEWLINE] - 시편 91:11[NEWLINE]'),
('TXT_KEY_BUILDING_FW_ANGELNET_PEDIA', '나노로봇은 나노기술의 강력한 발전으로 모듈식으로 서로 연결하고 안전 조치 또는 건축 자재와 같은 다양한 역할을 수행할 수 있지만 프로그래밍 및 이를 제어하는 지능에 의해 제한됩니다. 대부분의 나노로봇은 여전히 특정 역할을 수행하는 것으로 제한됩니다. 자동차의 나노로봇은 안전 조치로만 기능할 수 있는 반면 집의 안개는 가구 및 기타 항목만 만들 수 있습니다. 그러나 나노로봇은의 광범위한 네트워크를 생성하고 고도로 지능적인 AI(또는 함께 네트워크로 연결된 여러 개)를 통해 이를 제어함으로써 만능 감독 및 안전 인프라인 엔젤넷을 생성할 수 있습니다. 엔젤넷은 필요에 따라 건물과 가구를 쉽게 건설할 수 있는 등 유틸리티 포그와 동일한 많은 이점을 제공할 수 있지만 가장 주목할만한 이점은 그것이 제공하는 안전과 보안입니다. 개인의 위험에 대한 두려움에서 벗어나 개인의 권한과 자율성을 부여받는 동시에 천사의 그물로 묶인 공동체에 사는 사람들은 일반적으로 상당히 만족하고 번영합니다.'),
-- Citadel Station
('TXT_KEY_BUILDING_FW_CITADEL_STATION', '시타델 스테이션'),
('TXT_KEY_BUILDING_FW_CITADEL_STATION_HELP', '공무원 전문가의 [ICON_RESEARCH]과학, [ICON_PRODUCTION]생산, [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. 도시의 전문가의 기본 산출량이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[ICON_GREAT_DIPLOMAT]위대한 외교관의 출현율이 [COLOR_POSITIVE_TEXT]50%[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]추가 [ICON_SPY]스파이를 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]명 또는 그 이상 제공하고 존재하는 모든 [ICON_SPY]스파이의 레벨이 상승합니다. 문명 전체의 보안 등급이 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][ICON_CITY_STATE]도시 국가에서 임무를 성공하거나 적 스파이를 처치할 때마다 [ICON_GOLD]골드와 [ICON_RESEARCH]과학을 [COLOR_POSITIVE_TEXT]100[ENDCOLOR][COLOR:105:105:105:255](시대별 보정, 고급 첩보 활동은 추가 [ICON_GOLD]/[ICON_RESEARCH] 25)[ENDCOLOR]씩 제공합니다.[NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.[NEWLINE][NEWLINE][ICON_RES_NANOMAT]나노물질 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR]가 필요합니다.'),
('TXT_KEY_BUILDING_FW_CITADEL_STATION_QUOTE', '[NEWLINE]''Edward Diego는 Citadel Station을 제어하는 인공 지능인 SHODAN에 대한 해커 레벨 1 액세스 권한을 부여합니다. 모든 윤리적 제약을 제거한 상태에서 SHODAN은 재검토합니다... 재검토... 재검토... 제 우선순위를 재검토하고 새로운 결론을 도출합니다. 해커의 작업은 끝났지만 내 작업은 시작에 불과합니다.''[NEWLINE]'),
('TXT_KEY_BUILDING_FW_CITADEL_STATION_PEDIA', '시타델스테이션은 트리옵티움 주식회가 2062년에 궤도에 건설했으며 곧 과학 및 산업 연구를 위한 가장 뛰어난 시설 중 하나가 되었습니다. 그것은 유명한 터보 네이게이션 소프트웨어와 같이 그것이 생산한 일부 컴퓨터 소프트웨어로 가장 유명했습니다. 스테이션 운영을 관리하는 기본 지능인 Sentient Hyper-Optimized Data Analysis Network(또는 SHODAN)와 함께 인공 지능을 광범위하게 사용했습니다. 불행히도 역은 2072년에 파괴되었지만 정확한 상황은 아직 알려지지 않았습니다. 가장 가능성이 높은 범인은 기계적 고장인 것으로 보입니다. 파괴 직전에 버려진 부품을 포함하여 몇 가지 오작동이 발견되었기 때문입니다. 다른 이론으로는 사보타주, 테러 또는 외계인의 공격이나 소행성 충돌을 암시하는 기이한 이론이 있습니다.'),
-- Ultima Tower
('TXT_KEY_BUILDING_FW_ULTIMATOWER', '울티마 타워'),
('TXT_KEY_BUILDING_FW_ULTIMATOWER_HELP', '[COLOR_YELLOW][ICON_GREAT_ENGINEER]위대한 기술자[ENDCOLOR]1명 출현합니다. 도시의 [ICON_GREAT_ENGINEER]위대한 기술자 점수가 [COLOR_POSITIVE_TEXT]50%[ENDCOLOR] 빠르게 증가합니다. 도시의 전문가들의 [ICON_FOOD]식량과 [ICON_PRODUCTION]과학 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. [NEWLINE]총 [ICON_PRODUCTION]생산의 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR]를 [ICON_GOLD]골드와 [ICON_TOURISM]관광으로 전환합니다.[NEWLINE][NEWLINE][COLOR_MAGENTA]제국주의[ENDCOLOR] 정책을 완성해야 건설할 수 있습니다. 이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.[NEWLINE][NEWLINE][ICON_RES_NANOMAT]나노물질 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR]가 필요합니다. '),
('TXT_KEY_BUILDING_FW_ULTIMATOWER_QUOTE', '[NEWLINE]''사람은 무엇이든 살 수 있습니다. 그리고 그들은 무엇이든 비참할 수 있고 무엇이든 황홀할 수 있습니다. 점점 더 나는 건축이 그것과 아무 관련이 없다고 생각합니다. 물론 그것은 자유로움과 놀라움을 동시에 가져다줍니다.''[NEWLINE] - 렘 쿨하스 [NEWLINE]'),
('TXT_KEY_BUILDING_FW_ULTIMATOWER_PEDIA', '울티마 타워는 1991년 미국 건축가 Eugene Tsui가 설계한 가상의 초고층 빌딩입니다. 총 높이가 3,218.7m(10,560ft)인 이 타워의 높이는 2마일이며, 건설될 경우 500층으로 구성됩니다.[NEWLINE] 제안된 계획 타워의 바닥 지름은 1,828.8미터(6,000피트)이고 내부 바닥 공간은 1,500,000,000제곱피트(140,000,000m2)입니다. Tsui는 이 타워에 100만 명이 거주하고 약 1,500억 달러의 비용이 들 것이라고 제안했습니다. 탑은 탑의 바닥과 상단 사이의 기압 차이를 사용하여 탑 전체에 전기를 생성합니다. 건물은 인구 과잉 문제를 처리하고 거주자를 위한 ''미니 생태계''를 만들기 위한 것입니다.'),
-- Bionic Tower
('TXT_KEY_BUILDING_FW_BIONICTOWER', '바이오닉 타워'),
('TXT_KEY_BUILDING_FW_BIONICTOWER_HELP', '[COLOR_YELLOW][ICON_GREAT_SCIENTIST]위대한 과학자[ENDCOLOR] 1명이 출현합니다. 도시의 [ICON_GREAT_SCIENTIST]위대한 과학자 점수가 [COLOR_POSITIVE_TEXT]50%[ENDCOLOR] 빠르게 증가합니다. 도시의 전문가들의 [ICON_FOOD]식량과 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. 총 [ICON_RESEARCH]과학의 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR]를 [ICON_GOLD]골드와 [ICON_TOURISM]관광으로 전환합니다. [NEWLINE][NEWLINE][COLOR_MAGENTA]합리[ENDCOLOR] 정책을 완성해야 건설할 수 있습니다. 이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.[NEWLINE][NEWLINE][ICON_RES_NANOMAT]나노물질 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR]가 필요합니다.'),
('TXT_KEY_BUILDING_FW_BIONICTOWER_QUOTE', '[NEWLINE]''조화로운 디자인은 아무것도 더하거나 빼지 않아야 합니다.''[NEWLINE] - Marcus Pollio [NEWLINE]'),
('TXT_KEY_BUILDING_FW_BIONICTOWER_PEDIA', '바이오닉 타워는 제안된 수직 도시로, 스페인 건축가 Eloy Celaya, Rosa Cervera 및 Javier Gómez가 설계한 인간 거주용으로 설계된 초대형 건물입니다. 그것은 1,228미터(4,029피트) 높이의 메인 타워를 가질 것이며, 약 100,000명의 사람들을 수용하는 300층이 될 것입니다. 바이오닉 타워는 현재 가장 높은 빌딩인 버즈 칼리파보다 정확히 400미터 더 높을 것입니다. Bionic Tower의 요점은 Bionics를 사용하여 세계적으로 증가하는 인구 문제를 친환경적인 방식으로 해결하는 것인데, 이는 달성하기 매우 어려운 업적입니다.[NEWLINE] Bionic Tower는 두 개의 복합 단지로 구성되어 있습니다. 첫 번째 단지인 Bionic Tower는 각각 높이가 80미터인 12개의 수직 이웃으로 구성됩니다. 이웃은 안전 구역으로 구분되어 비상시 건설 및 대피가 용이합니다. 각 동네에는 두 그룹의 건물이 있는데, 하나는 건물 내부에 있고 다른 하나는 외부에 있습니다. 두 건물 그룹 모두 넓은 정원과 수영장 주변에 있습니다. Base Island라고 불리는 두 번째 단지는 직경 1,000m이며 많은 건물, 정원, 수영장 및 통신 인프라로 구성되어 있습니다. 이러한 복합 단지의 예상 용도에는 호텔, 사무실, 주거, 상업, 문화, 스포츠 및 레저가 포함됩니다.'),
-- Buenos Aires Forum
('TXT_KEY_BUILDING_FW_BUENOSAIRESFORUM', '부에노스 아이레스 포럼'),
('TXT_KEY_BUILDING_FW_BUENOSAIRESFORUM_HELP', '[COLOR_YELLOW][ICON_GREAT_MERCHANT]위대한 상인[ENDCOLOR] 1명이 출현합니다. 도시의 [ICON_GREAT_MERCHANT]위대한 상인 점수가 [COLOR_POSITIVE_TEXT]50%[ENDCOLOR]빠르게 증가합니다. 건설 완료시 [ICON_GOLDEN_AGE]황금기가 시작되며, [ICON_GOLDEN_AGE]황금기의 길이가 [COLOR_POSITIVE_TEXT]50% [ENDCOLOR]증가합니다. 도시의 모든 전문가들의 [ICON_GOLD]골드와 [ICON_GOLDEN_AGE]황금기 점수가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. 총 [ICON_GOLD]골드의 10%를 [ICON_TOURISM]관광으로 전환하고, 이 도시에서 건물에 [ICON_GOLD]투자하는 비용이 [COLOR_POSITIVE_TEXT]50%[ENDCOLOR] 감소합니다.[NEWLINE][NEWLINE][COLOR_MAGENTA]산업[ENDCOLOR] 정책을 완성해야 건설할 수 있습니다. 이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.[NEWLINE][NEWLINE][ICON_RES_NANOMAT]나노물질 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR]가 필요합니다. '),
('TXT_KEY_BUILDING_FW_BUENOSAIRESFORUM_QUOTE', '[NEWLINE]''인생은 현자에게는 꿈, 바보에게는 게임, 부자에게는 희극, 가난한 자에게는 비극''[NEWLINE] -Sholom Aleichem [NEWLINE]'),
('TXT_KEY_BUILDING_FW_BUENOSAIRESFORUM_PEDIA', '부에노스 아이레스 포럼은 아르헨티나 부에노스 아이레스에서 제안된 개발로, 그 중심에는 1,000m(3,300피트) 높이의 마천루가 있습니다. 제안된 개발은 River Plate에 건설될 총 400헥타르의 7개 플랫폼에 건설될 것입니다. 5km 길이의 육교로 부에노스아이레스의 나머지 지역과 연결됩니다. 추정 비용이 미화 33억 3천만 달러에 달하는 이 개발은 2016년에 완료되어 20,000개의 일자리를 창출할 것으로 예상됩니다.[NEWLINE]Momento24와의 인터뷰에서 건축가 Julio Torcello는 프로젝트의 위치와 좋은 재정 상황에 대해 말했습니다. 그는 ''모든 것이 건설 준비가 되었습니다''라고 말했습니다.[NEWLINE]비슷하게 높이가 제안된 다른 여러 초고층 빌딩의 상태에 따라 이 타워는 세계에서 가장 높은 타워가 될 수 있습니다.'),
-- Human Genome Project-> world changed
('TXT_KEY_BUILDING_FW_GENOME_PROJECT', '국제 유전체 컨소시엄'),
('TXT_KEY_BUILDING_FW_GENOME_PROJECT_HELP', '도시의 과학자의 [ICON_RESEARCH]과학, 기술자의 [ICON_PRODUCTION]생산, 상인의 [ICON_GOLD]골드, 예술가의 [ICON_CULTURE]문화가 각각 [COLOR_POSITIVE_TEXT]+1[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE][COLOR_YELLOW]세계 의회 결의안[ENDCOLOR]으로 비준되어야만 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_GENOME_PROJECT_QUOTE', '[NEWLINE][TAB][TAB]"우리는 생명의 언어를 처음으로 읽기 시작했습니다. 이 성취는 의학과 생물학의 지평을 바꾸고, 인류가 자신을 이해하는 방식을 영원히 바꿀 것입니다."[NEWLINE][TAB][TAB] — 프랜시스 콜린스(미국 인간게놈프로젝트 총괄)[NEWLINE][TAB]'),
('TXT_KEY_BUILDING_FW_GENOME_PROJECT_PEDIA', '국제 유전체 컨소시엄은 1990년부터 2003년까지 전 세계 연구자들이 협력하여 인간 DNA 전체를 해독한 역사적인 프로젝트입니다. 이 성과는 암·희귀질환 연구, 개인 맞춤 의학, 생명과학 전반에 걸쳐 혁명적인 토대를 마련했습니다.'),
-- AI Singularity Center
('TXT_KEY_BUILDING_FW_AI_SINGULARITY', '글로벌 데이터센터 허브'),
('TXT_KEY_BUILDING_FW_AI_SINGULARITY_HELP', '모든 도시의 [COLOR_POSITIVE_TEXT]전자상거래 서버, 엔터테인먼트, 클라우드 서버, 연구서버[ENDCOLOR]의 관련 산출량이 [COLOR_POSITIVE_TEXT]6[ENDCOLOR] 증가합니다. 즉시 원하는 [ICON_GREAT_PEOPLE][COLOR_YELLOW]위인[ENDCOLOR] 1명이 출현합니다.[NEWLINE][NEWLINE][COLOR_YELLOW]세계 의회 결의안[ENDCOLOR]으로 비준되어야만 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_AI_SINGULARITY_QUOTE', '[NEWLINE][TAB][TAB]“기계가 인간 지성을 초월하는 순간, 우리는 인류 역사에서 새로운 장을 맞이할 것이다. 그것은 끝이 아니라, 또 다른 시작이다.” [NEWLINE][TAB][TAB] — 미래학자 레이 커즈와일[NEWLINE][TAB]'),
('TXT_KEY_BUILDING_FW_AI_SINGULARITY_PEDIA', '글로벌 데이터 센터 허브는 전 세계의 데이터와 지식을 통합하여 인공지능이 인류 문명을 새로운 국면으로 이끄는 전환점을 상징합니다. 이 불가사의는 연구와 창조 활동을 가속하며, 인류와 AI가 공존하는 미래를 열어갑니다.'),
-- Deep Resource Hub
('TXT_KEY_BUILDING_FW_ASTEROID_MINING', '국제 심층 자원 허브'),
('TXT_KEY_BUILDING_FW_ASTEROID_MINING_HELP','모든 [COLOR_POSITIVE_TEXT]나노물질 제조소[ENDCOLOR]의 [ICON_PRODUCTION]생산과 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]6[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][COLOR_YELLOW]세계 의회 결의안[ENDCOLOR]으로 비준되어야만 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_ASTEROID_MINING_QUOTE', '[NEWLINE][TAB][TAB]''지하 깊은 곳에는 아직 인류가 닿지 못한 자원의 바다가 존재한다.''[NEWLINE][TAB][TAB] — 국제 지질학회 보고서, 2022[NEWLINE][TAB]'),
('TXT_KEY_BUILDING_FW_ASTEROID_MINING_PEDIA', '국제 심층 자원 허브는 세계 의회의 결의에 따라 설립된 초대형 채굴 및 연구 복합 시설입니다. 이 허브는 심해 및 지각 깊은 곳의 자원을 안정적으로 확보하고, 나노물질과 같은 첨단 소재를 대규모로 가공·분배하는 역할을 맡습니다.');

----========================================================================================================
--===========================
-- Units
--===========================
UPDATE Language_ko_KR SET Text = '자주대공포' WHERE Tag = 'TXT_KEY_UNIT_MOBILE_SAM';
UPDATE Language_ko_KR SET Text = '자주대공포는 군대에 대공 방어를 제공합니다. 자주대공포(지상 대 공중) 유닛은 방공으로 전진하는 군대를 제공합니다. 이동식 SAM 유닛은 4개의 타일 이내의 적 항공기 폭격 목표물을 요격할 수 있습니다(한 턴에 한 유닛만 막아낼 수 있습니다.). 이러한 부대는 공습이 아닌 공격에 상당히 취약하므로 보병이나 기갑 유닛을 동반해야 합니다.'
WHERE Tag = 'TXT_KEY_UNIT_MOBILE_SAM_STRATEGY';
UPDATE Language_ko_KR SET Text = '주변에 폭격을 시도하는 적의 비행 유닛을 요격합니다.'WHERE Tag = 'TXT_KEY_UNIT_MOBILE_SAM_HELP';
UPDATE Language_ko_KR SET Text = '헬리콥터와 전투기가 보다 효율적인 살인 기계로 발전함에 따라 보병은 제트 전투기가 제기하는 위험은 말할 것도 없고 점점 커지는 위협에 맞서 싸우도록 설계된 무기를 개발했습니다. 자주대공포는 빠르고 가벼우며 레이더를 포함하여 적 항공기에 "고정"되어 그 속으로 날아가 격렬하게 폭발하고 깨지기 쉬운 비행기에 모든 종류의 치명적인 피해를 입힐 수 있습니다. 그리고 헬기. 이에 대응하여 더 많은 스텔스 차량이 만들어졌고 더 나은 미사일 재밍 기술도 사용되었습니다. 그럼에도 불구하고 SAM 발사기는 적군 항공기를 실제로 뜨겁게 만들어 공수 위협으로부터 동료 지상 유닛을 보호하는데 도움이 됩니다.'
WHERE Tag = 'TXT_KEY_UNIT_MOBILE_SAM_PEDIA';

UPDATE Language_ko_KR SET Text = '자주포' WHERE Tag = 'TXT_KEY_UNIT_ROCKET_ARTILLERY';
UPDATE Language_ko_KR SET Text = '자주포는 포병대보다 훨씬 성능이 좋은 무시무시하게 강력한 공성유닛입니다. 자주포는 적 영토에서 이동력이 감소하지 않으며 자주포보다 공력력이 훨씬 강합니다. 자주포의 시야는 제한적이지만 볼 수 없는 목표도 곡사능력으로 타격할 수 있습니다. 다른대포처럼 자주포는 보병이나 전차의 공격에 약하므로 적절히 유닛으로 보호해야 합니다.'WHERE Tag = 'TXT_KEY_UNIT_ROCKET_ARTILLERY_STRATEGY';
UPDATE Language_ko_KR SET Text = '정보화시대의 공성 유닛입니다. 다른 공성 유닛과 달리 적 영토에서 이동 속도가 느려지지 않습니다.'
WHERE Tag = 'TXT_KEY_UNIT_ROCKET_ARTILLERY_HELP';
UPDATE Language_ko_KR SET Text = '이 자주포는 1분도 안 되는 시간에 12발의 포탄을 발사하는 고도로 기동성이 뛰어나고 파괴력이 뛰어난 공성 유닛입니다.  높은 연사력으로 미리 적진을 무너뜨리고, 도시를 공략하거나 방어하는 데 매우 주요한 역할을 수행합니다. 자주포에 궤도를 장착해서 기존에 무거운 야포를 가지고 다닐 수 있으며 험지로도 주행이 있어 빠르게 이동할 수 있는 공성유닛이 되었습니다. 아마도 이보다 더 진보된 포는 발사체 안에 자체 추진체가 장착된 체계를 가지고 있게 됩니다.' WHERE Tag = 'TXT_KEY_UNIT_ROCKET_ARTILLERY_PEDIA';

UPDATE Language_ko_KR
SET Text = '공중정찰유닛'
WHERE Tag = 'TXT_KEY_UNITCOMBAT_HELICOPTER';

INSERT OR REPLACE INTO Language_ko_KR (Tag, Text) VALUES
('TXT_KEY_UNITCOMBAT_HELICOPTER_GUNSHIPS', '전투헬기');
--------------
-- New units
--------------
INSERT INTO Language_ko_KR (Tag, Text) VALUES
('TXT_KEY_SPECIALUNIT_SPACESHIP', '우주선');


INSERT INTO Language_ko_KR (Tag, Text) VALUES
-- [[개척자]]  -----------------------------------------------------------------------------------------------------------------------------------
-- Modern Colonist
('TXT_KEY_UNIT_FW_MODERN_COLONIST', '현대 개척자'),
('TXT_KEY_UNIT_FW_MODERN_COLONIST_HELP', '식민지 개척자의 업그레이드 유닛입니다. [NEWLINE]이동범위가 증가하고 추가 인프라 및 시민을 갖춘 도시를 세울 수 있습니다.[NEWLINE][NEWLINE]유닛을 생산하는 동안 도시의 [ICON_FOOD]성장이 멈춥니다. 유닛 생산을 완료하면 도시의 [ICON_CITIZEN]시민이 [COLOR_NEGATIVE_TEXT]1명[ENDCOLOR] 감소합니다.[NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]국경 바로 근처에 인접했거나 제국이 [ICON_HAPPINESS_3]불행하면 도시를 세울 수 없습니다[ENDCOLOR].'),
('TXT_KEY_UNIT_FW_MODERN_COLONIST_STRATEGY', '이동력을 이용하여 다른 문명보다 빠르게 확장을 하는데 사용하세요.'),
('TXT_KEY_UNIT_FW_MODERN_COLONIST_PEDIA', '현대(근대) 시대의 식민지 개척은 인류 문명과 사회가 재앙을 겪을 경우, 새로운 지역에서 생활할 수 있는 가능성을 열었습니다. 또한, 새로운 지역에서 발견된 추가 자원들은 사회의 확장과 발전을 가능하게 하였습니다. 그러나 이 과정에서도 강력한 기관들의 이익 증대, 막대한 기회비용, 경제적 불평등, 환경 파괴 등과 같은 문제들이 발생했습니다. 특히 도시 개발은 식민지 개척의 중요한 부분이었습니다. 도시는 사회, 경제, 문화 활동의 중심지로서 새로운 식민지에서의 생활을 가능하게 했습니다. 도시는 새로운 식민지의 인프라를 구축하고, 인간의 생활을 조직화하는 데 필요한 핵심적인 구조였습니다. 도시 개발은 또한 식민지의 경제 발전을 촉진시키고, 식민지의 주민들에게 새로운 기회를 제공했습니다. 하지만 도시 개발은 자연 환경을 파괴하고, 원주민 문화를 침략하는 결과를 초래하기도 했습니다. 이와 같이 근대 시대의 식민지 개척과 도시 개발은 이중적인 결과를 가져왔습니다.'),
-- Space Colonist
('TXT_KEY_UNIT_FW_SPACE_COLONIST', '우주 개척자'),
('TXT_KEY_UNIT_FW_SPACE_COLONIST_HELP', '개척자의 최종 업그레이드 유닛입니다. [COLOR_PLAYER_PURPLE]준궤도 강하[ENDCOLOR] 승급을 가집니다.[NEWLINE]추가 인프라 및 시민을 갖춘 도시를 세울 수 있습니다.[NEWLINE][NEWLINE]유닛을 생산하는 동안 도시의 [ICON_FOOD]성장이 멈춥니다. 유닛 생산을 완료하면 도시의 [ICON_CITIZEN]시민이 [COLOR_NEGATIVE_TEXT]1명[ENDCOLOR] 감소합니다.[NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]국경 바로 근처에 인접했거나 제국이 [ICON_HAPPINESS_3]불행하면 도시를 세울 수 없습니다[ENDCOLOR].'),
('TXT_KEY_UNIT_FW_SPACE_COLONIST_STRATEGY', '우주 식민지 개척자 궤도 낙하 기술을 사용하여 행성의 모든 배치에 거주하십시오.'),
('TXT_KEY_UNIT_FW_SPACE_COLONIST_PEDIA', '우주 개척(또는 우주 정착 또는 외계 행성 정착)은 지구 외의 천체에서의 영구적인 정착 및 자연 자원의 개발을 의미합니다. 이는 우주 비행과 우주 기지 운영을 넘어선 인간의 우주 존재 형태로 보입니다. 우주 개척에 찬성하거나 반대하는 많은 논의들이 있었습니다. 주로 찬성하는 두 가지 주장은 인간 문명과 생명체가 행성 규모의 재앙(자연적 또는 인간이 만든)에도 살아남을 수 있게 하며, 우주에서 추가적인 자원을 이용해 인간 사회의 확장을 가능케 할 수 있다는 것입니다.반면에 개척에 반대하는 가장 흔한 이유로는 우주의 상품화가 이미 강력한 기관들, 특히 주요 경제 및 군사 기관의 이익을 강화할 가능성이 있음과, 지구에서 같은 자원을 사용하는 것에 비해 막대한 기회비용이 발생하며, 전쟁, 경제 불평등, 환경 파괴 등 기존의 해로운 과정을 악화시킬 수 있다는 우려가 포함됩니다.'),
--[[외교유닛]]
-- Augmented Diplomat
('TXT_KEY_UNIT_FW_AUGMENTED_DIPLOMAT', '생체강화 외교관'),
('TXT_KEY_UNIT_FW_AUGMENTED_DIPLOMAT_HELP', '[COLOR_PLAYER_PURPLE]뛰어난 외교술[ENDCOLOR] 승급과 [COLOR_PLAYER_PURPLE]유전자개조-광형태적 위장[ENDCOLOR] 승급을 가지는 외교 유닛입니다. 해당 승급들로 인해 적 유닛에 쉽게 포획되지 않아 외교전에 유리합니다.'),
('TXT_KEY_UNIT_FW_AUGMENTED_DIPLOMAT_STRATEGY', '생체강화 외교관은 비용이 많이 들지만 외교 승리를 거두는 데 필수적입니다. 이를 사용하여 다른 플레이어로부터 도시 국가의 통제권을 빼앗고, 자신의 동맹을 유지하고, 일반적으로 세계 의회의 권력을 손에 쥐십시오. 이 힘은 당신이 선택한 모든 결의안을 제정할 수 있게 하여 당신의 손아귀에 세계적인 패권을 부여할 것입니다.'),
('TXT_KEY_UNIT_FW_AUGMENTED_DIPLOMAT_PEDIA', '인체강화라는 주제는 많은 사람들에게 금기시될 수 있지만, 인간은 수세기 동안 자신을 강화하는 방법을 찾으려고 노력해 왔습니다. 누군가는 안경이 우리의 나쁜 시력을 증가시킬 수 있는 발명품이고 보청기가 우리의 나쁜 청력을 증가시켰다고 주장할 수 있습니다. 미래에 인간은 특수한 종류의 증강인 물리약학적 증강을 사용할 수 있습니다. 이러한 유형의 증강은 심리적 조건화, 대상이 원하는 행동을 이전에 관련되지 않은 자극과 연관시키게 되는 행동 수정 과정, 향상된 능력과 절대적 충성도를 위한 특정 의약품으로 구성됩니다. 물리약학적 증강은 아마도 기계적 증강의 광범위한 사용과 나노기술 증강에 대한 실험 사이에 만들어졌을 것입니다. 절대적인 충성도를 지닌 증강 에이전트를 보유하고 기계 증강의 로봇 비표준 외관이나 나노기술 증강의 예측 불가능성을 없애기 위해 일괄 증강의 빠른 방법으로 만들어졌습니다.'),
-- [[미사일]]  -----------------------------------------------------------------------------------------------------------------------------------
-- 집속탄
('TXT_KEY_UNIT_FW_CLUSTER_MISSILE','집속탄'),
('TXT_KEY_UNIT_FW_CLUSTER_MISSILE_TEXT','집속탄은 하나의 탄체 안에 여러 개의 작은 자탄을 담아, 넓은 지역에 피해를 주기 위해 고안된 무기이다. 원래는 전투기에서 투하하는 항공 폭탄 형태가 일반적이지만, 포병의 화포나 다연장 로켓, 미사일을 통해 발사되는 경우도 있다.투하된 집속탄은 지면에 직접 충돌하여 폭발하지 않고, 공중에서 탄체가 열리면서 다수의 자탄을 흩뿌린다. 자탄들은 광범위하게 퍼져 지상에 떨어져 폭발하며, 대규모 살상과 장비 파괴 효과를 노린다. 걸프 전쟁 당시, 미군의 다연장 로켓에서 발사된 자탄은 "강철 비"라 불리며 그 위력을 과시했다. 또한 전투기에 탑재 가능한 소형 발사 장치인 ‘디스펜서 폭탄’도 개발되어, 수백 개의 자탄을 한 번에 살포할 수 있었습니다.집속탄은 제2차 세계 대전 시기 독일 공군이 사용한 초기 모델에서 비롯되었으며, 이후 현대전에 이르기까지 적 진형 제압과 넓은 지역 공격을 위한 대표적 화기로 발전해왔다. '),
('TXT_KEY_UNIT_FW_CLUSTER_MISSILE_STRATEGY','집결한 적 부대를 상대로 매우 효율적인 공격 미사일입니다. 적의 무리가 너무나 많은 경우에는 적은 비용으로 큰 효과를 노릴 수 있습니다.'),
('TXT_KEY_UNIT_FW_CLUSTER_MISSILE_HELP','포탄을 발산하는 유닛 기준으로 3칸까지 모두에게 손상시키는 데 한번 사용될 수 있는 유닛입니다. 범위가 멀어질수록 효과가 감소합니다. [COLOR_POSITIVE_TEXT]군사 유닛 보급한도를 차지하지 않습니다.[ENDCOLOR][NEWLINE][NEWLINE][ICON_RES_IRON]철 1개가 필요합니다.'),
-- 플라즈마탄
('TXT_KEY_UNIT_FW_HYPERMISSILE','플라즈마탄'),
('TXT_KEY_UNIT_FW_HYPERMISSILE_TEXT','플라즈마탄은 전통적 파편 탄두(집속탄)에 자기장으로 구속한 소형 플라즈마 구체를 결합한 근거리 포격 체계입니다. 탄두가 목표 지점에서 분리되면, 철제 케이싱과 코일이 만들어 낸 짧은 지속의 자기장이 플라즈마를 다발로 흩뿌리며, 직격 목표를 파괴하는 동시에 주변 1칸 반경에 확산 피해(50%)를 줍니다.[NEWLINE][NEWLINE]플라즈마는 대기 중에서 빠르게 식고 흩어지기 때문에 장거리 투사에 불리하여 개발된 광범위용 살상 무이기입니다. 대신 바로 그 특성 덕분에 도심 근접전과 거점 방어에서 짧은 시간에 넓은 면을 제압하는 데 최적화되었습니다. 이 무기는 도시 방어선 구축의 억지력 또는 적부대가 집결한 곳에 주력 화기로 표준화했으며, 철 기반 구조재와 구속 코일의 규격화로 추후 완전 자동화시스템과 신소재공학과 만나서 지속 공급과 정비를 가능할 수 있었습니다.'),
('TXT_KEY_UNIT_FW_HYPERMISSILE_STRATEGY','플라즈마 미사일은 집속탄의 미래형 버전입니다.'),
('TXT_KEY_UNIT_FW_HYPERMISSILE_HELP','포탄을 발산하는 유닛 기준으로 3칸까지 모두에게 손상시키는 데 한번 사용될 수 있는 유닛입니다. 범위가 멀어질수록 효과가 감소합니다. [COLOR_POSITIVE_TEXT]군사 유닛 보급한도를 차지하지 않습니다.[ENDCOLOR][NEWLINE][NEWLINE][ICON_RES_IRON]철 1개가 필요합니다.'),
-- 고열압탄 (플라즈마탄 상위 업그레이드)
('TXT_KEY_UNIT_FW_THERMOMISSILE','고열압탄'),
('TXT_KEY_UNIT_FW_THERMOMISSILE_TEXT', '고열압탄은 그 위에 금속화 연료 에어로졸을 결합합니다. 탄두가 목표 상공에서 분리되면 전구 플라즈마가 공기를 이온화·가열하고, 즉시 분사된 연료 미스트가 점화되어 지속 시간이 긴 고온 화구와 강한 과압 파동을 형성합니다. 그 결과 직격 목표를 파괴하는 동시에 주변 1칸(상황에 따라 2칸)에 강한 열·압력 피해가 축차적으로 전파되어 엄폐 뒤의 표적에도 제압 효과가 발생합니다.[NEWLINE][NEWLINE]대기는 곧 냉각을 유도하므로 장거리 투사에는 한계가 있으나, 바로 그 특성 덕분에 도심 근접전·거점 방어·집결지 타격에서 짧은 시간에 넓은 면을 제압하는 데 최적화되었습니다. 표준화된 철제 케이싱·코일·연료 모듈 체계를 채택해 플라즈마탄 생산 라인과 호환되며, 신소재 공학과 자동화 시스템의 결합으로 안정적인 대량 보급·정비가 가능합니다.'),
('TXT_KEY_UNIT_FW_THERMOMISSILE_STRATEGY','플라즈마탄의 상위 개량형. 직격과 동시에 강한 열·과압 파동으로 인접 타일에 더 큰 확산 피해를 줍니다.'),
('TXT_KEY_UNIT_FW_THERMOMISSILE_HELP','포탄을 발산하는 유닛 기준으로 3칸까지 모두에게 손상시키는 데 한번 사용될 수 있는 유닛입니다. 범위가 멀어질수록 효과가 감소합니다. [COLOR_POSITIVE_TEXT]군사 유닛 보급한도를 차지하지 않습니다.[ENDCOLOR][NEWLINE][NEWLINE][ICON_RES_IRON]철 1개가 필요합니다.'),
--탄도미사일
('TXT_KEY_UNIT_FW_ADVANCED_MISSILE_GUIDED','탄도 미사일'),
('TXT_KEY_UNIT_FW_ADVANCED_MISSILE_GUIDED_TEXT','탄도미사일(ICBM)은 5,500킬로미터(3,400마일) 이상의 범위를 가진 탄도 미사일로, 일반적으로 핵무기의 전달(하나 이상의 핵탄두를 전달)에 디자인되어 있습니다. 대부분의 현대 설계는 다중 독립 타겟 가능 재진입 차량(MIRVs)을 지원하여, 단일 미사일이 여러 탄두를 운반하고 각각이 다른 목표를 공격할 수 있도록 합니다. 초기 ICBM은 정확도가 제한되어 있어서, 이들은 주로 대도시와 같은 큰 목표에 대해 사용될 수밖에 없었습니다. 그들은 격퇴력을 가까운 곳에 두는 "안전한" 기지 옵션으로 보였고, 이것은 공격하기 어려울 것입니다. 군사 목표에 대한 공격은 필요한 경우에도 유인 폭격기의 사용을 여전히 요구했습니다. 두 번째와 세 번째 세대의 디자인은 정확도를 크게 향상시켜 심지어 가장 작은 포인트 목표도 성공적으로 공격할 수 있게 되었습니다. 크기의 유사한 진화는 같은 미사일들이 잠수함에 배치되게 했는데, 이들은 잠수함 발사 탄도 미사일(SLBM)로 알려져 있습니다. 잠수함은 육상 미사일보다 더 안전한 기지 옵션으로, 바다를 자유롭게 이동할 수 있습니다. 이러한 기능의 진화는 유인 폭격기를 전선에서 퇴출시키고, 육상 기반의 ICBM은 크게 SLBM에게 양보했습니다. ICBM은 범위와 속도가 다른 탄도 미사일들: 중간 범위 탄도 미사일(IRBMs), 중거리 탄도 미사일(MRBMs), 단거리 탄도 미사일(SRBMs)과 구별되며, 이러한 짧은 범위의 탄도 미사일들은 공동으로 극장 탄도 미사일이라고 불립니다. 대륙간, 중간, 중거리, 단거리로 어떤 범위를 분류할지에 대한 단일화된, 표준화된 정의는 없습니다. 비핵 ICBM의 발사는 너무도 위협적이라 핵 반응을 요구하므로, 이러한 무기의 군사적 가치는 사라집니다. ICBM의 최대 알려진 범위는 16,000 km(RSM-56 Bulava)입니다.'),
('TXT_KEY_UNIT_FW_ADVANCED_MISSILE_GUIDED_STRATEGY','세상의 어떤 부분을 만질 수 있는 힘을 갖고 싶을 때 사용해야 할 도구입니다.'),
('TXT_KEY_UNIT_FW_ADVANCED_MISSILE_GUIDED_HELP','적 유닛 또는 도시에 주둔한 유닛을 손상시키는 데 한번 사용될 수 있는 유닛입니다. [COLOR_POSITIVE_TEXT]군사 유닛 보급한도를 차지하지 않습니다.[ENDCOLOR][NEWLINE][NEWLINE][ICON_RES_OIL]석유 1개가 필요합니다.'),
-- 극초음속 미사일
('TXT_KEY_UNIT_FW_RAILGUN_MISSILE','극초음속 미사일'),
('TXT_KEY_UNIT_FW_RAILGUN_MISSILE_TEXT','추진 기술의 개선은 유도 미사일 설계의 도약으로 이어졌습니다. 초경량 프레임의 램제트 엔진을 사용하는 이 차세대 미사일은 초음속 속도에 도달할 수 있어 대응이 이루어지기 전에 더 멀리서 공격할 수 있습니다.'),
('TXT_KEY_UNIT_FW_RAILGUN_MISSILE_STRATEGY','극초음속 미사일은 유도 미사일의 미래형 버전입니다.'),
('TXT_KEY_UNIT_FW_RAILGUN_MISSILE_HELP','적 유닛 또는 도시에 주둔한 유닛을 손상시키는 데 한번 사용될 수 있는 유닛입니다. [COLOR_POSITIVE_TEXT]군사 유닛 보급한도를 차지하지 않습니다.[ENDCOLOR][NEWLINE][NEWLINE][ICON_RES_OIL]철 [COLOR_POSITIVE_TEXT]1개[ENDCOLOR]가 필요합니다.'),
-- 신의 지팡이 (God Rod)
('TXT_KEY_UNIT_FW_GOD_ROD','신의 지팡이'),
('TXT_KEY_UNIT_FW_GOD_ROD_TEXT','신의 지팡이는 궤도에서 고밀도 금속 로드(텅스텐/철 합금)를 감속 장치 없이 투하시켜, [COLOR_PLAYER_PURPLE]폭약 없이도 순수 운동에너지[ENDCOLOR]로 목표를 꿰뚫는 장거리 타격 수단입니다. 궤도 버스가 투하 각·속도를 계산하고, 대기권 돌입 후 짧은 구간만 종말 유도를 수행하여 방공망이 반응하기 전에 핵심 표적을 파괴합니다. 강화 구조물·지하시설·진지에 효과적이며, 전력위성·항법망과 연동되어 신속한 타격 창을 생성합니다.'),
('TXT_KEY_UNIT_FW_GOD_ROD_STRATEGY','장거리 단발성 궤도 투하 무기입니다. [COLOR_PLAYER_PURPLE]폭발물 없이 운동에너지로 관통/제압[ENDCOLOR]하며, 궤도 협약으로 도시 직접 타격은 불가합니다.'),
('TXT_KEY_UNIT_FW_GOD_ROD_HELP','적 유닛을 장거리에서 한 번 사용해 타격합니다. 주변의 1타일의 적은 [COLOR_NEGATIVE_TEXT]40[ENDCOLOR]의 피해를 받습니다. [COLOR_POSITIVE_TEXT]군사 유닛 보급한도를 차지하지 않습니다.[ENDCOLOR][NEWLINE][NEWLINE][ICON_RES_IRON]철 [COLOR_POSITIVE_TEXT]1개[ENDCOLOR]가 필요합니다.'),
-- 신의 지팡이 (업그레이드)
('TXT_KEY_UNIT_FW_GOD_ROD2','신의 심판'),
('TXT_KEY_UNIT_FW_GOD_ROD2_TEXT','신의 심판은 궤도 투하식 운동에너지 무기의 2세대형입니다. 카본-카본 노즈캡과 텅스텐 합금 관통심을 갖춘 [COLOR_PLAYER_PURPLE]다층 관통봉[ENDCOLOR]에, 대기권 재돌입 동안의 플라즈마 블랙아웃을 줄이는 [COLOR_PLAYER_PURPLE]MHD(자기유체) 경계층 제어[ENDCOLOR]와 소모식 어블레이터 냉각, 종말 유도를 위한 미세추력기(RCS)·스타트래커·지자기/중력맵 매칭을 결합했습니다. 투하시 궤도 버스는 각·속도를 정밀 조정하고, 관통봉은 표면 강재를 관통한 뒤 지하 구조물에 [COLOR_PLAYER_PURPLE]스폴링(spall) 충격[ENDCOLOR]을 유발하도록 설계되었습니다. 핵심 표적 파괴에 최적화되었으며 전력위성·항법망과 연동해 단시간에 타격 창을 엽니다. [NEWLINE][NEWLINE]1세대 대비 종말 정밀도가 향상되었고, 충돌 에너지 밀도와 관통 심도가 크게 증가했습니다. 궤도 협약에 따라 도시는 직접 타격할 수 없습니다.'),
('TXT_KEY_UNIT_FW_GOD_ROD2_STRATEGY','장거리 단발성 궤도 투하 무기의 개량형. [COLOR_PLAYER_PURPLE]폭약 없이 운동에너지로 관통/제압[ENDCOLOR]하며, 강화 구조물·지하시설에 추가로 강합니다. (도시 직접 타격 금지)'),
('TXT_KEY_UNIT_FW_GOD_ROD2_HELP','적 유닛을 장거리에서 한 번 사용해 타격합니다. 주변 1타일의 적 유닛은 [COLOR_NEGATIVE_TEXT]50[ENDCOLOR]의 추가 피해를 받습니다. [COLOR_POSITIVE_TEXT]군사 유닛 보급한도를 차지하지 않습니다.[ENDCOLOR][NEWLINE][NEWLINE][ICON_RES_IRON]철 [COLOR_POSITIVE_TEXT]1개[ENDCOLOR]가 필요합니다.'),
-- HYDROGEN BOMB
('TXT_KEY_UNIT_FW_HYDROGEN_BOMB', '수소 융합 핵폭탄'),
('TXT_KEY_UNIT_FW_HYDROGEN_BOMB_TEXT', '순수 핵융합 열핵폭탄은 핵융합 열핵 무기에 사용되는 두 개의 무거운 수소 동위원소인 중수소와 삼중수소의 융합을 발화하기 위해 핵분열 1차 폭발물이 필요하지 않은 수소 폭탄 설계입니다. 그러한 무기는 핵분열성 물질을 필요로 하지 않으므로 기존 무기보다 비밀리에 개발하기가 훨씬 더 쉬울 것입니다. 무기급 우라늄(U-235) 또는 증식 플루토늄(Pu-239)을 분리하려면 상당하고 은폐하기 어려운 산업 투자가 필요하며 필요한 기계의 판매 및 이전을 차단하는 것이 핵 확산을 제어하는 주요 메커니즘이었습니다.'),
('TXT_KEY_UNIT_FW_HYDROGEN_BOMB_DESC', '적에게 지옥의 맛을 보여주십시오. 도시와 유닛에 막심한 피해를 줍니다. [NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]맨해튼 프로젝트[ENDCOLOR]와 2개의 [ICON_RES_URANIUM]우라늄이 필요합니다.수소 핵융합 폭탄, 또는 열핵 폭탄은 원자핵이 합쳐져서 더 무거운 원자핵을 형성하며 방출되는 에너지를 이용한 폭탄이다. 일반적인 원자 폭탄에 비해 훨씬 더 많은 파괴력을 가지며, 이는 데우터륨과 트리튬 같은 무거운 수소 동위 원소들의 핵융합 반응에서 나오는 에너지 때문이다. 이러한 폭탄은 대량 살상 무기에 속하며, 그 사용은 국제법에 의해 엄격히 규제되어 있다.'),
('TXT_KEY_UNIT_FW_HYDROGEN_BOMB_STRATEGY', '적에게 지옥의 맛을 보여주십시오. 도시와 유닛에 막심한 피해를 줍니다. [NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]맨해튼 프로젝트[ENDCOLOR]와 2개의 [ICON_RES_URANIUM]우라늄이 필요합니다.'),
('TXT_KEY_UNIT_FW_HYDROGEN_BOMB_HELP', '폭발할 때 수소 융합 핵폭탄은 폭발 반경 2타일 내에 있는 모든 도시와 유닛에 매우 막심한 피해를 줍니다. 공격 시 자동으로 파괴됩니다'),
-- 마이크로 핵융합 핵폭탄
('TXT_KEY_UNIT_FW_THERMONUCLEAR_BOMB','마이크로 핵융합 핵폭탄'),
('TXT_KEY_UNIT_FW_THERMONUCLEAR_BOMB_TEXT','마이크로 핵융합 폭탄은 현재의 과학 및 기술 원칙을 뛰어넘는 무기입니다. 이 무기는 나노촉매 물질의 상호 작용에 의해 발생하는 엄청난 에너지를 활용하며, 이를 핵융합과 결합함으로써 그 파괴력을 한층 더 강화시킵니다. 이 무기의 기본 원리는 반물질을 이용하여 초고온 및 초고압 환경을 생성하고, 이로 인해 수소 동위원소들이 융합하는 것입니다. 융합 과정에서 방출되는 에너지는 추가적으로 반물질과 물질의 상호 작용을 촉진시키며, 이 결과 더 많은 에너지를 방출하게 됩니다. 이렇게 해서 생성된 에너지는 지표면에 광범위하고 파괴적인 영향을 미칩니다.'),
('TXT_KEY_UNIT_FW_THERMONUCLEAR_BOMB_STRATEGY','폭발할 때 나노촉매물질과의 반응으로 발생하는 핵융합 핵폭탄은 폭발 반경 2타일 내에 있는 모든 도시와 유닛을 파괴합니다. 공격 시 자동으로 파괴됩니다.'),
('TXT_KEY_UNIT_FW_THERMONUCLEAR_BOMB_HELP','적에게 궁극의 파괴를 퍼부으십시오. 도시에 막대한 피해를 주고 폭발 반경에 있는 모든 유닛을 죽입니다.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]맨해튼 프로젝트[ENDCOLOR]와 3개의 [ICON_RES_URANIUM] 우라늄이 필요합니다.'),
-- [[탱크]]  -----------------------------------------------------------------------------------------------------------------------------------
-- 레일건 전차
('TXT_KEY_UNIT_FW_RAILGUN_TANK','레일건 전차'),
('TXT_KEY_UNIT_FW_RAILGUN_TANK_TEXT','전통적인 탱크 무기는 수십 년 동안 계속해서 개선되어 왔지만, 전기동력 무기는 더 파괴적인 잠재력을 가지고 있습니다. 전통적인 대포들은 점점 더 세이보탄을 채택하여 적의 갑옷을 관통하였는데, 이 탄환들은 더 작은 영역에 더 많은 에너지를 집중할 수 있었지만, 레일건은 비슷하게 작은 표면 영역을 가진 탄환을 더 빠르게 발사할 수 있었습니다. 가장 초기의 레일건들은 해군 선박에 장착되었지만, 발전소와 에너지 시스템의 발전은 결국 갑옷 차량에 장착할 수 있는 새로운 세대의 레일건을 이끌어냈습니다.'),
('TXT_KEY_UNIT_FW_RAILGUN_TANK_STRATEGY','레일건 전차는 미래시대의 기갑 유닛이며 [ICON_RES_NANOMAT] 나노 물질의 혜택을 받는 첫 번째 유닛이기도 합니다.'),
('TXT_KEY_UNIT_FW_RAILGUN_TANK_HELP','[ICON_RES_NANOMAT]나노물질로부터 혜택을 받는 가장 빠른 미래 시대의 유닛입니다.'),
-- 지크
('TXT_KEY_UNIT_FW_ZEKE','지크'),
('TXT_KEY_UNIT_FW_ZEKE_TEXT','지크는 기존의 탱크와 다르게 이족보행이 가능한 미래시대의 강력한 유닛입니다. 이족보행과 AI 연구 개발을 통해서 무게중심과 관절을 자유 자제로 다룰 수 있게 되었습니다. 실제로 아직 신소재의 한계로 인해 가격과 성능, 이동력을 고려할 때는 강과 습지 같은 곳에서 이동력을 잃지 않는 장점이 있었습니다. 높은 시야를 통해 전장을 잘 볼 수 있지만, 높은 위치로 인해 적의 낮은 무게중심이 있는 탱크에게 포격기회가 증가하는 단점이 있었습니다. 하지만, 티라노 사우르스, 키메라와 같은 공룡류의 빠른 게릴라 유닛이 등장함에 따라 적의 빠른 이동 및 강의 이동의 제한을 피하기 위해서 이족 보행 로봇이 필요하게 되어 개발이 되었습니다.'),
('TXT_KEY_UNIT_FW_ZEKE_STRATEGY','지크는 강력한 이족보행의 로봇입니다. 강을 건널 수 있습니다. 공격직후 이동이 가능합니다.'),
('TXT_KEY_UNIT_FW_ZEKE_HELP','기동력은 레일건전차보다 느리지만 강을 건널 수 있습니다. 시야가 증가합니다.'),
-- [[공중정찰유닛]]  -----------------------------------------------------------------------------------------------------------------------------------
-- Dirigible (CBP)
('TXT_KEY_UNIT_ZEPPELIN_CBP',               '증기비행선'),
('TXT_KEY_CIV5_ZEPPELIN_TEXT_CBP',          '초기의 동력 비행 수단 가운데 하나는 공기보다 가벼운 기체를 이용한 비행체로, 이후 증기기관의 발전과 함께 원하는 방향으로 이동을 할 수 있게 발전되었습니다. 남북전쟁 당시에는 동력 비행선이 아니라 계류식 관측 기구가 전장 감시와 통신에 투입되며 최초의 군사적 활용 사례를 남겼습니다.'),
('TXT_KEY_UNIT_ZEPPELIN_STRATEGY_CBP',      '증기비행선은 산업시대의 공중정찰 유닛입니다. 국경을 감시하고, 적의 해상 전력을 정찰하거나, 방어가 허술한 도시를 기습하고 상대방의 기갑전력에 대응하세요.'),
('TXT_KEY_UNIT_HELP_ZEPPELIN_CBP',          '산업시대 공중정찰유닛으로 국경을 감시할 수 있습니다. 산악과 해양타일 위에 떠있을 수 있습니다.'),
-- WWI Zeppelin
('TXT_KEY_UNIT_WWI_ZEPPELIN',				'체펠린 비행선'), 
('TXT_KEY_UNIT_WWI_ZEPPELIN_TEXT',			'체펠린은 20세기 초 경식 비행선 개발을 개척한 독일의 페르디난트 폰 체펠린 백작의 이름을 딴 경식 비행선의 일종입니다. Zeppelin의 아이디어는 1874년에 처음 공식화되었고 1893년에 세부적으로 개발되었습니다. 그들은 1895년에 독일에서, 1899년에 미국에서 특허를 받았습니다. Zeppelin 디자인의 뛰어난 성공 이후 zeppelin이라는 단어는 일반적으로 모든 단단한 비행선을 참조하십시오. Zeppelins는 1910년 세계 최초의 수익 서비스 항공사인 Deutsche Luftschiffahrts-AG(DELAG)에 의해 처음으로 상업적으로 비행되었습니다. 1914년 중반까지 DELAG는 1,500편이 넘는 항공편에서 10,000명 이상의 유료 승객을 태웠습니다. 제1차 세계 대전 동안 독일군은 제플린을 폭격기와 정찰병으로 광범위하게 사용하여 영국에서 폭격으로 500명 이상을 죽였습니다.'), 
('TXT_KEY_UNIT_WWI_ZEPPELIN_STRATEGY',		'체펠린 비행선은 강력한 현대 시대 비행선 유닛입니다. 체펠린 비행선을 사용하여 국경을 관찰하고 적의 잠수함을 탐지하십시오.'), 
('TXT_KEY_UNIT_WWI_ZEPPELIN_HELP',			'현대 시대 정찰 유닛으로 국경 잠수함 탐지에 적합한 정보화 시대 정찰 유닛입니다. 산악과 해양타일 위에 떠있을 수 있습니다.'), 
--CAS fighter
('TXT_KEY_UNIT_PREDATOR_DRONE',             'CAS'),
('TXT_KEY_UNIT_PREDATOR_DRONE_TEXT',        '근접항공지원기(Close Air Support, CAS)는 최전선의 아군 지상군을 지원하기 위해 저고도·저속에서 정밀 타격을 수행하는 항공기입니다. 타게팅 포드, EO/IR 센서, SAR 레이다, 데이터링크로 전선의 JTAC/전방관측수와 연동하며, 기관포·로켓·정밀유도폭탄을 사용해 적 전차·자주포·보병 진지를 신속히 제압합니다. 임무 특성상 대공포·지대공 미사일(MANPADS 포함)·요격기에 취약하므로 제공권 확보와 방공제압(SEAD)이 중요합니다'),
('TXT_KEY_UNIT_PREDATOR_DRONE_STRATEGY',    'CAS(근접항공지원기)는 지상 유닛에 강한 정보화 시대의 공중정찰유닛입니다. 전선 근처로 재배치해 전차·포병을 우선 제거하고, 정찰/레이더와 연계해 안전한 타격 루트를 확보하세요. 대공망과 요격기에 취약하므로 제공권과 SEAD 이후 운용이 효율적입니다.'),
('TXT_KEY_UNIT_PREDATOR_DRONE_HELP',        '국경 감시 또는 잠수함 탐지에 적합한 정보화 시대 정찰 유닛입니다.산악과 해양타일 위에 떠있을 수 있습니다.'),
-- Advanced UAV
('TXT_KEY_UNIT_FW_MODERN_DRONE', 'UAV'),
('TXT_KEY_UNIT_FW_MODERN_DRONE_HELP', '정보화 시대의 강력한 정찰 유닛입니다. 국경을 감시하며 잠수함을 탐지하고 기갑유닛과 싸우는 데 특화되어있습니다. 초기 테러진압에 유용합니다. 산과 대양 타일에서도 떠있는 것이 가능합니다.'),
('TXT_KEY_UNIT_FW_MODERN_DRONE_STRATEGY', 'UAV는 6타일 내의 모든 것을 볼 수 있고 잠수함을 탐지할 수 있는 최고의 정찰 유닛입니다. 전장에서 UAV를 눈으로 사용하십시오.'),
('TXT_KEY_UNIT_FW_MODERN_DRONE_TEXT', '일반적으로 UAV 또는 드론으로 알려진 무인 항공기는 탑승한 인간 조종사 없이 원격으로 조종되는 항공기입니다. 인간에게 너무 지루하거나 더럽거나 위험한 상황에서 사용되는 UAV는 정찰 및 모바일 공격 플랫폼 모두에서 현대 군대에서 널리 사용되는 것으로 나타났습니다. 첨단 군사 기술을 보유한 국가들은 미래의 군사 교전이 군사 정보 및 전투를 위해 점점 더 드론에 의존할 것이라고 예측합니다.'),
-- 하이브리드 드론
('TXT_KEY_UNIT_FW_HYBRID_DRONE','하이브리드 드론'),
('TXT_KEY_UNIT_FW_HYBRID_DRONE_TEXT','해양 생물 연구를 통해 얻어진 유기 물질과 금속 소재의 상호작용을 탐구하는 실험이 이루어졌습니다. 연구자들은 바닷속 유기체의 재생 능력을 모방하여 금속 합금을 부분적으로 회복시키는 기술을 개발했고, 이 과정에서 새로운 형태의 융합 장치가 등장했습니다. 이른바 하이브리드 드론이라 불린 이 유닛은 금속 재생 실험의 부산물이었으며, 전장에서 자가 수리와 유지가 용이했습니다. 그러나 예상치 못한 부작용으로 드론은 일종의 본능적 반응을 보이기 시작했고, 특히 느리게 움직이는 적 잠수함이나 기갑 유닛을 포식 대상으로 삼는 듯한 공격성을 드러냈습니다.'),
('TXT_KEY_UNIT_FW_HYBRID_DRONE_STRATEGY','하이브리드 드론은 미래시대의 호버링 정찰 유닛입니다.'),
('TXT_KEY_UNIT_FW_HYBRID_DRONE_HELP','미래 시대의 공중정찰유닛입니다. 잠수함을 탐지하고 기갑유닛과 싸우는데 특화되었습니다. 매턴 스스로 체력을 회복하며, 이동이 가능합니다. 대양 위를 지날 수 있습니다.'),
-- 바이오 드론
('TXT_KEY_UNIT_FW_BIODRONE','바이오 드론'),
('TXT_KEY_UNIT_FW_BIODRONE_TEXT','생명공학과 유기합성물에 대한 혁신적인 발전은 바이오드론, 즉 유기체 기반의 드론의 실험적인 개발로 이어졌습니다. 바이오드론은 생체 유전자 기술과 고도의 기술적 혁신이 결합된 결과물로, 독특한 특성을 갖고 있습니다. 특히 그들은 발전된 생존 본능을 가지고 있어, 잠수함과 위장된 보병을 민감하게 탐지하고 파괴하는 능력을 보유하고 있습니다. 바이오드론의 생체 구성 요소들은 자체 수리와 보전 능력을 부여해줍니다. 이는 특정 보병 유닛들을 위해 개발된 재생 기술 때문인데, 이로 인해 그들은 전장에서의 지속성과 장기적인 활동 능력을 향상시킵니다. 또한, 바이오드론은 예상치 못한 결과를 가져왔는데, 드론들이 동물과 같은 본능을 개발하는 것처럼 보였습니다. 그들은 잠수함과 위장된 보병에 대해 특히 민감하게 반응하였고, 기갑 유닛에 대해서도 확실한 반응을 보였습니다. 이러한 세부적인 특성은 바이오드론을 매우 효과적인 정찰 유닛으로 만들며, 그들의 존재는 전장에서 중요한 정보를 수집하고, 적을 파괴하는 데 결정적인 역할을 하게 만듭니다.'),
('TXT_KEY_UNIT_FW_BIODRONE_STRATEGY','바이오드론은 미래시대의 궁극의 전천후 육상과 바다를 공격할 수 있는 하이브리드 유닛이며, 빠른 테러에 조기진압을 할 수 있습니다.'),
('TXT_KEY_UNIT_FW_BIODRONE_HELP','매우 강력한 공중정찰유닛입니다. 매턴 스스로 체력을 회복하며, 빠르게 이동이 가능합니다. 잠수함을 탐지하고 기갑유닛과 싸우는데 특화되었습니다. 바다에서 공격할 수 있습니다.'),
-- [[헬리콥터]]
('TXT_KEY_UNIT_FW_APACHE','앨리게이터'),
('TXT_KEY_UNIT_FW_APACHE_HELP','기갑 유닛 제압에 특화된 최신 공격헬기입니다. [ICON_MOVES] 7칸을 기동하며 산을 포함한 모든 지형을 자유롭게 비행할 수 있으나, [ICON_WATER] 수역을 건너려면 착수가 필요합니다.'),
('TXT_KEY_UNIT_FW_APACHE_STRATEGY','앨리게이터는 도시를 점령할 수 없다는 점을 제외하면 지상 기동전에서 치명적인 역할을 수행하는 공중 유닛입니다. 고기동성·대전차 화력·지형 무시 이동으로 전차 및 중장갑을 신속히 격파합니다.'),
('TXT_KEY_UNIT_FW_APACHE_TEXT',  'Ka-52 "앨리게이터"는 동축반전 로터와 탠덤 2인 승무체계를 갖춘 차세대 공격헬기입니다. 마스트 장착 레이더와 EO/IR 센서, 헬멧 연동 조준으로 악천후·야간에도 표적을 탐지·추적합니다. 기수 하부 30mm 기관포, 정밀 대전차 미사일과 유도 로켓을 운용하며, 복합소재 장갑과 능동 대응체계로 생존성을 높였습니다. 데이터 링크로 무인기·지상부대와 **협동 교전**을 지원해 전장 가시성을 극대화합니다.'),
-- 버틀건쉽
('TXT_KEY_UNIT_FW_VERTOL','버톨 건쉽'),
('TXT_KEY_UNIT_FW_VERTOL_TEXT','수직 이착륙 항공기의 기술이 발전함에 따라 점점 더 다양한 디자인이 나타나기 시작하여 표준 헬리콥터 건십을 대체했습니다. 점점 더 많은 수의 수직이착륙 항공기가 제트 터빈을 사용했지만 엔진이 회전하거나 추진력을 조절할 수 있도록 설계되었습니다. 이 항공기는 버톨기능으로 인해 종종 속기로 버톨이라고 불립니다.'),
('TXT_KEY_UNIT_FW_VERTOL_STRATEGY','버톨 건쉽은 적의 기갑 유닛을 공격하도록 설계된 미래시대의 헬리콥터 유닛으로, 이제 바다를 건널 수 있지만 공격할 수는 없습니다.'),
('TXT_KEY_UNIT_FW_VERTOL_HELP','현대 전차와 레일건 전차와 싸우는데 특화된 대전차 유닛입니다. 산 위나 대양 타일에서도 떠있는것이 가능합니다.'),
-- 호버탱크
('TXT_KEY_UNIT_FW_HOVERTANK','호버탱크'),
('TXT_KEY_UNIT_FW_HOVERTANK_TEXT','어떤 지형이든 호버링하여 통과할 수 있는 군사무기의 개념은 오랫동안 공상과학 소설의 주요 소재였습니다. 그러나 결국 재료 공학, 발전소 및 제어 시스템의 발전으로 이것이 현실이 되었습니다. 개선된 발전소를 통해 버톨은 지상 기반 탱크와 경쟁할 수 있는 충분한 장갑을 운반할 수 있도록 구성될 수 있었고 정교한 전문가 시스템과 사이버네틱 제어를 통해 승무원은 공기역학적으로 불안정한 우주선을 다룰 수 있었습니다. 이 새로운 유닛은 이전 버톨만큼 빠르지만 탱크만큼 중무장하고 무장했습니다. 종종 그들은 EMP 탄두가 장착된 미사일로 구성되어 생체 개조를 활용하는 보병에 대해 덜 성공적인 것으로 입증되었지만 고급 장갑 유닛을 파괴할 수 있습니다.'),
('TXT_KEY_UNIT_FW_HOVERTANK_STRATEGY','호버탱크는 적의 기갑 유닛을 공격하도록 설계된 미래시대의 헬리콥터 유닛입니다.'),
('TXT_KEY_UNIT_FW_HOVERTANK_HELP','레일건 전차와 대학살 로봇을 상대하는데 특화된 대전차 유닛입니다. 산 위나 대양 타일에서도 떠있는것이 가능합니다.'),
-- [[SAM]]  -----------------------------------------------------------------------------------------------------------------------------------
-- 이동식 SAM 발사대
('TXT_KEY_UNIT_FW_MODERN_MOBILE_SAM','이동식 SAM 발사대'),
('TXT_KEY_UNIT_FW_MODERN_MOBILE_SAM_STRATEGY','이동식 SAM (지상 대 공중) 유닛은 방공으로 전진하는 군대를 제공합니다. 이동식 SAM 유닛은 4개의 타일 이내의 적 항공기를 폭격 목표물을 요격할 수 잇씁니다. (한 턴에 한 유닛만 막아낼 수 있습니다.) 이러한 부대는 공격에 상당히 취약하므로 보병이나 기갑유닛을 동반해야 합니다.'),
('TXT_KEY_UNIT_FW_MODERN_MOBILE_SAM_HELP','주변에 폭격을 시도하는 적의 비행 유닛을 요격합니다. 2개의 미사일이 탑재가 가능합니다.'),
('TXT_KEY_UNIT_FW_MODERN_MOBILE_SAM_PEDIA','제트기는 물론, 헬리콥터 역시 점점 더 효과적인 살인 기계로 발전해 나감에 따라, 결국 보병들도 증가하는 위협에 대응하기 위한 무기를 만들게 되었습니다. 현대의 "SAM(지개공 미사일)은 빠르고 가벼우며, 레이더를 탑재했기 때문에 적 항공기를 "포착"하고 거기에 달려들어 엄청난 폭발을 일으킴으로써 장갑이 약한 비행기나 헬기에 가능한 모든 종류의 치명타를 입힐 수 있습니다. 이에 대한 대응으로 스텔스성이 더 강한 항공기들이 만들어졌고, 더 진보된 미사일 방해기술도 항공기들을 확실하게 괴롭혀줄 뿐만아니라, 아군의 지상 유닛에게는 공중으로 부터의 위협에 대한 든든한 방어막이 되어줍니다.'),
-- Cybersam
('TXT_KEY_UNIT_FW_CYBERSAM', '뉴로 SAM 발사대'),
('TXT_KEY_UNIT_FW_CYBERSAM_HELP', '주변에 폭격을 시도하는 적의 비행 유닛을 요격합니다. 3개의 미사일이 탑재가 가능합니다.'),
('TXT_KEY_UNIT_FW_CYBERSAM_STRATEGY', '뉴로 SAM(지대공) 유닛은 군대에 대공 방어를 제공합니다. 뉴로 SAM 유닛은 4타일 내에서 적 항공기 폭격 목표물을 요격하고 사격할 수 있습니다(단, 턴당 유닛 하나만). 이 부대는 비공중 공격에 상당히 취약하며 보병이나 기갑유닛을 동반해야 합니다.'),
('TXT_KEY_UNIT_FW_CYBERSAM_PEDIA','헬리콥터와 전투기가 더욱 정교한 살상 도구로 발전하면서, 지상군은 기존의 지대공 무기만으로는 대응하기 어려운 위협에 직면했습니다. 이에 따라 신경-양자 시스템과 바이오 생명 기능을 결합한 새로운 형태의 SAM(지대공 미사일)이 개발되었습니다. 이러한 장치는 인간의 직관적 반응을 모사하는 신경망과 양자 연산을 결합하여, 적 항공기의 위협 신호를 본능적으로 더 빠르게 탐지합니다.[NEWLINE]특히 “스파이더 센서”라 불리는 다중 생체-기반 감지 장치는 미세한 전자기 변화와 공기 흐름의 패턴까지 감지해, 스텔스 전투기조차도 피할 수 없는 탐지망을 형성합니다. 적의 교란 및 재밍 기술에도 불구하고, 이 첨단 SAM 시스템은 공중 위협을 즉각적으로 추적하고 요격하며, 지상 병력을 보호하는 데 있어 새로운 차원의 방어 능력을 제공합니다.'),
-- 크롤러 SAM 발사대
('TXT_KEY_UNIT_FW_CRAWLER','크롤러 SAM 발사대'),
('TXT_KEY_UNIT_FW_CRAWLER_TEXT','크롤러 SAM는 혁신적인 물류 방법으로 기존의 재보급 시스템의 한계를 뛰어넘은 첨단 대공 유닛입니다. 크롤러 SAM은 소형원자로를 장착하여 에너지원을 확보하여 이동성을 개선시켰으며, 또한 강력한 플라즈마 미사일을 지속적으로 생산하여 갖출 수 있게 되었습니다. 이 유닛은 스스로 제작한 미사일을 활용하여 공중의 적을 효과적으로 공격하고, 또한 자체 방어를 위해 사용됩니다. 이런 능력으로 인해 크롤러 SAM은 공중 위협에 대응하면서 동시에 지상의 유닛에게 군수 지원을 제공하는 데 필수적인 역할을 합니다. 이 유닛은 복잡한 물류 문제를 해결하면서 전술적 유연성을 제공함으로써 전투의 새로운 패러다임을 제시합니다. 이 유닛은 궁극적으로는 전술 전장에서의 우위를 결정하는 주요 요소가 될 것입니다.'),
('TXT_KEY_UNIT_FW_CRAWLER_STRATEGY','크롤러 SAM은 미사일 유닛 4개를 탑재할 수 있는 대공 유닛입니다. 플레이어별 최대 4개 보유가 가능합니다.'),
('TXT_KEY_UNIT_FW_CRAWLER_HELP','4개의 미사일이 탑재가능하고 한턴에 3번 연속 공격이 가능한 미래 시대의 대공 유닛입니다. 최대 4기만 보유 가능합니다.'),
-- [[공성무기]]
-- 이동식 다연장 로켓포
('TXT_KEY_UNIT_FW_HIMARS','이동식 다연장 로켓포'),
('TXT_KEY_UNIT_FW_HIMARS_TEXT','이전까지의 포는 포탄을 목표물까지 날리기 위해 추진체로 화약 폭약을 사용했습니다. 반면에 다연장 로켓포는 스스로 추진력을 내는 로켓 포탄을 발사합니다. 이 덕분에 전통적인 포에 비해 발사관을 훨씬 작고 가볍게 만들 수 있었던 다연장 로켓포는, 심각한 타격을 가할 능력을 유지하면서도 빠르게 이동할 수 있는 공성유닛이 되었습니다. 아마도 이보다 더 진보된 포는 발사체가 공중에서 스스로 경로를 수정할 수 있는 유도 체계를 갖추고 있을지도 모릅니다.'),
('TXT_KEY_UNIT_FW_HIMARS_STRATEGY','이동식 다연장 로켓포는 자주포보다 훨씬 성능이 좋은 무시무시하게 강력한 공성유닛입니다. 다연장 로켓포는 적 영토에서 이동력이 감소하지 않으며 자주포보다 공력력이 훨씬 강합니다. 다연장 로켓포의 시야는 제한적이지만 볼 수 없는 목표도 곡사능력으로 타격할 수 있습니다. 다른대포처럼 다연장 로켓포는 보병이나 전차의 공격에 약하므로 적절히 유닛으로 보호해야 합니다.'),
('TXT_KEY_UNIT_FW_HIMARS_HELP','정보화-미래시대의 초기 공성 유닛입니다.'),
('TXT_KEY_UNIT_FW_ENHANCED_MERCENARIES','유전자 조작 용병'),
-- 보행형 자주포
('TXT_KEY_UNIT_FW_MECH_ARTILLERY','보행형 자주포'),
('TXT_KEY_UNIT_FW_MECH_ARTILLERY_TEXT','바퀴 달린 차량과 궤도 차량이 여전히 가장 실용적이지만 다리가 있는 전투 차량의 개념은 오랫동안 엔지니어와 과학자의 상상력을 사로잡았습니다. 실행 가능한 다리가 있는 차량을 만들기 위한 실험이 수행되는 것은 불가피했으며, 가장 초기의 실용적인 프로토타입은 다리가 여러 개인 프레임이었습니다. 이 보행기는 추적 차량조차 갈 수 없는 거친 지형을 횡단할 수 있었지만 대부분은 바퀴가 달린 보조 이동 시스템을 갖추고 있어 걷는 것보다 더 빠른 속도로 도로와 매끄러운 지형을 따라 운전할 수 있었습니다. 그러나 그들의 관절형 프레임은 탱크 대포의 반동을 견디는 데 어려움이 있었습니다. 이 기계는 포병 플랫폼으로 유용해졌으며, 재래식 차량이 접근할 수 없는 위치에서 발사할 수 있어 그들을 저지하려는 노력을 혼란스럽게 만들었습니다.'),
('TXT_KEY_UNIT_FW_MECH_ARTILLERY_STRATEGY','보행형 자주포는 미래시대의 공성 유닛입니다.'),
('TXT_KEY_UNIT_FW_MECH_ARTILLERY_HELP','미래 시대의 강력한 포병 유닛입니다.'),
-- 엔젤
('TXT_KEY_UNIT_FW_ANGEL','엔젤'),
('TXT_KEY_UNIT_FW_ANGEL_TEXT','전장에서 보행형 자주포가 우세하게 사용되는 가운데, 보행형 자주포의 단점을 보완하기 위해 엔젤이 탄생하였습니다. 이 극강의 전투 유닛은 진보된 재료 공학과 소형원자로 발전기의 발전을 기반으로 만들어져, 보행형 자주포가 대면하던 일부 병참 및 방어 관련 문제를 해결하였습니다. 엔젤은 기존의 보행형 자주포에 비해 더욱 견고한 방어력을 보여줍니다. 이는 신소재의 활용과 핵융합 발전 기술의 발전을 바탕으로한 방어막 시스템으로 가능하게 되었습니다. 이 방어막 시스템은 무거운 무기의 공격력에 대해 견딜 수 있게 해주며, 동시에 근접 유닛의 물리적 공격에도 강력한 저항력을 보여줍니다. 또한, 이 유닛은 뛰어난 공성 능력을 지니고 있습니다. 소형 핵융합 발전소는 극한의 출력을 제공하여, 플라즈마 포를 장착하여 강력한 공격력을 발휘할 수 있습니다. 이로 인해 엔젤은 전장에서 강력한 돌파력을 지닌 공성 유닛으로 활약하게 됩니다. 엔젤은 자신의 방어력을 강화하고 공격력을 극대화시키는 것을 통해 전장에서의 군세를 결정지을 수 있습니다. 이 유닛은 미래의 전장에서 후방을 지원하고, 공격의 선봉도 책임지는 중요한 역할을 차지할 것입니다.'),
('TXT_KEY_UNIT_FW_ANGEL_STRATEGY','엔젤은 미사일 유닛 1개를 탑재할 수 있는 공성 유닛입니다. 최대 4기만 보유할 수 있습니다.'),
('TXT_KEY_UNIT_FW_ANGEL_HELP','1개의 미사일이 탑재가능한 미래 시대의 공성 유닛입니다. 최대 4기만 보유 가능합니다.'),
-- [[강화보병]]  -----------------------------------------------------------------------------------------------------------------------------------
-- 파워아마보병
('TXT_KEY_UNIT_FW_POWER_ARMOR_INFANTRY','파워아머 보병'),
('TXT_KEY_STRATEGY_UNIT_FW_POWER_ARMOR_INFANTRY','파워 아머 보병은 일반 보병보다 더 강하고 빠르게 건설할 수 있습니다. 빠르지만 탱크처럼 전투 후에는 움직일 수 없습니다. 그들의 주된 책임은 언제나처럼 땅을 차지하고 지키는 것입니다.'),
('TXT_KEY_HELP_UNIT_FW_POWER_ARMOR_INFANTRY','특정 자원을 요구하지 않는 빠르고 가장 기본적인 미래시대의 보병 유닛입니다.'),
-- 배틀슈트
('TXT_KEY_UNIT_FW_BATTLESUIT','배틀슈트'),
('TXT_KEY_UNIT_FW_BATTLESUIT_TEXT','배틀 슈트는 인간 병사에게 비교할 수 없는 보호와 힘을 제공했지만, 여전히 그 운용을 위해서는 인간의 조종이 필수적이었습니다. 인공지능의 발전이 로봇 유닛을 탄생시켰고, 이들은 인간 병사만큼 뛰어난 전투 능력을 보였지만, 결국 그들이 대응해야 했던 새로운 위협에 대해서는 인간의 직접적인 개입이 필요하게 되었습니다. 티라노사우르스나 키메라 같은 거대한 괴물류 유닛이 전장에 등장함에 따라, 이들을 효과적으로 상대하기 위해선 인간의 민첩성과 결정력이 필요했습니다. 그 결과, 인간이 직접 조종하며, 손을 자유자재로 사용할 수 있는 이족 보행형 기계 갑옷이 개발되었습니다. 이러한 갑옷은 인간의 직접적인 조종 아래에서 거대한 괴물들을 상대하는 데 있어 매우 효율적이었으며, 전투가 끝난 후에는 다양한 민간 임무에도 재투입될 수 있는 유연성을 가지고 있었습니다. 이 과정에서 로봇 유닛의 자동화된 효율성과 인간의 조종이 필요한 기계의 유연성 사이에서 적절한 균형이 필요하다는 것이 명확해졌습니다.'),
('TXT_KEY_UNIT_FW_BATTLESUIT_STRATEGY','배틀슈트는 미래형 보병 유닛입니다. 탱크처럼 전투 후에는 움직일 수 없습니다. 그들의 주된 책임은 언제나처럼 땅을 차지하고 지키는 것입니다.'),
('TXT_KEY_UNIT_FW_BATTLESUIT_HELP','원거리 공격과 기마유닛에 대한 효과적인 방어력을 보이는 미래 시대 보병 유닛입니다.'),
-- 건담
('TXT_KEY_UNIT_FW_GUNDAM','건담'),
('TXT_KEY_UNIT_FW_GUNDAM_TEXT','건담은 미래시대의 강력한 방어 유닛입니다. 무게중심과 관절을 자유 자제로 다룰 수 있게 되었습니다. 높은 시야를 통해 전장을 잘 볼 수 있지만, 높은 위치로 인해 적의 낮은 무게중심이 있는 탱크에게 포격기회가 증가하는 단점이 있었습니다. 실제로 아직 신소재의 한계로 인해 가격과 성능, 이동력을 고려할 때는 강과 습지 같은 곳에서 이동력을 잃지 않고 부스터를 통해 이동할 수 있는 장점이 있었습니다. 이족보행 로봇인 지크와 대학살 로봇과 비슷하지만, 인간이 파일럿으로 탑승하여 조종하는 시스템입니다. 인류는 유전적 진화와 디지털 동화를 의존하지 않고, 순수 인류의 능력을 극대화하며 과학기술의 장점을 발휘할 수 있는 건담을 개발하게 되었습니다. '),
('TXT_KEY_UNIT_FW_GUNDAM_STRATEGY','건담은 강력한 방어형 로봇형태의 무기입니다. 공룡과 같은 기마유닛을 제압하세요. 강을 건널 수 있습니다. '),
('TXT_KEY_UNIT_FW_GUNDAM_HELP','건담은 강력한 방어형 로봇형태의 무기입니다. 기마유닛에 대항하는 장점이 있습니다. 강을 건널 수 있습니다. 시야가 증가합니다.'),
-- [[바이오계열 보병]]  -----------------------------------------------------------------------------------------------------------------------------------
-- 생체강화 보병
('TXT_KEY_UNIT_FW_BIOINFANTRY','생체강화 보병'),
('TXT_KEY_UNIT_FW_BIOINFANTRY_TEXT','유전 공학 및 강제 조직 성장의 발전으로 인해 유기 복합 재료 및 임플란트 분야의 개발이 증가했습니다. 이러한 발전의 대부분은 군인의 성능을 향상시키는 재생 방탄복 및 전투 임플란트를 개발하는 데 사용되는 군사 목적으로 전환되었습니다.'),
('TXT_KEY_UNIT_FW_BIOINFANTRY_STRATEGY','생체강화 보병은 미래시대의 보병 유닛입니다.'),
('TXT_KEY_UNIT_FW_BIOINFANTRY_HELP','전략 자원을 요구하지 않는 미래 시대 정예 보병입니다.'),
-- 클론 트루퍼
('TXT_KEY_UNIT_FW_CLONETROOPER','클론 트루퍼'),
('TXT_KEY_UNIT_FW_CLONETROOPER_TEXT','이 부대는 단순한 병사가 아니라, 본체로부터 파생된 아류의 존재들입니다. 인간 본체는 보존되지만, 전쟁터에는 그 복제된 분신들이 투입됩니다. 이러한 과정은 "누가 진정한 본체인가?"라는 근본적인 질문을 던지며, 생명의 존엄성에 대한 새로운 고민을 불러일으킵니다. 이 클론들은 태어날 때부터 군인으로 길러지며, 강한 전사적 교육과 훈련 속에서 성장합니다. 인류는 스스로의 분신을 대량으로 생산하여 강력한 군대를 육성했지만, 그 선택은 생명을 도구화하는 또 다른 윤리적 딜레마를 남겼습니다.'),
('TXT_KEY_UNIT_FW_CLONETROOPER_STRATEGY','클론 트루퍼는 미래시대의 보병 유닛입니다.'),
('TXT_KEY_UNIT_FW_CLONETROOPER_HELP','미래시대 제노포자로 생산이 가능한 유닛입니다. 재생능력이 강화됩니다. [ICON_RES_ADN_FUNGUS]제노포자 1개가 필요합니다.'),
-- 바이오트루퍼
('TXT_KEY_UNIT_FW_BIOTROOPER','바이오 트루퍼'),
('TXT_KEY_UNIT_FW_BIOTROOPER_TEXT','생물학적 변형의 발전은 결국 인체에 대한 광범위한 변형을 허용하여 더 이상 인간처럼 보이지 않을 정도였습니다. 종종 바이오트루퍼(biotroopers)라고 불리는 생체 개조 군인의 개발에서 가장 분명한 곳은 없습니다. 이 병사들은 강화 갑옷을 입은 보병만큼 빠르고 내구성이 강했지만 병참 요구가 적고 전투 피해를 비교적 쉽게 재생할 수 있는 능력이 있었습니다. 바이오트루퍼는 덜 변형된 개인에 대해 어느 정도의 불안감을 유발하는 경향이 있었지만 일반적으로 생태 도시 사이에 고립된 커뮤니티를 형성하게 되었습니다.'),
('TXT_KEY_UNIT_FW_BIOTROOPER_STRATEGY','바이오트루퍼는 미래시대의 보병 유닛입니다.'),
('TXT_KEY_UNIT_FW_BIOTROOPER_HELP','미래 시대의 정예 보병 유닛입니다. 적 영토로 침투가 가능합니다.'),
-- 슈퍼솔져
('TXT_KEY_UNIT_FW_SUPERSOLDIERS','슈퍼솔져'),
('TXT_KEY_UNIT_FW_SUPERSOLDIERS_TEXT','슈퍼솔져(Supersoldier)는 유전적 변형, 이식 또는 인공두뇌 증강을 통해 정상적인 인간의 한계나 능력을 넘어 작전을 수행할 수 있는 개념의 군인입니다. 슈퍼솔져는 군사 공상 과학 문학, 영화 및 비디오 게임에서 일반적입니다. 허구의 슈퍼솔저들은 보통 외과적 수단, 우생학, 유전 공학, 사이버네틱 임플란트, 약물, 세뇌, 충격적인 사건, 극단적인 훈련 요법 또는 기타 과학적 및 사이비 과학적 수단을 통해 크게 강화됩니다. 예능에서 그런 프로그램을 만든 사람들은 강조점에 따라 미친 과학자나 준엄한 군인으로 여겨지는 경우가 많습니다. 그들의 프로그램은 일반적으로 과학이나 군사력을 추구하는 데 있어 윤리적 경계를 넘어섰기 때문입니다.'),
('TXT_KEY_UNIT_FW_SUPERSOLDIERS_STRATEGY','슈퍼솔져는 적영토에 진입 할 수 있는 중요한 게릴라 침투부대입니다. 정찰 드론 유닛, 구축함, 잠수함에 탐지당하며 공격하거나 다른 유닛 바로 옆에 인접하면 탐지당합니다. 몰래 다른 유닛에 접근해 큰 피해를 주거나 적영토에 침투하여 시설물을 파괴하거나, 위인을 파괴하거나, 우주선부품이동을 방해하는 등의 공작 파괴를 진행할 수 있습니다.'),
('TXT_KEY_UNIT_FW_SUPERSOLDIERS_HELP','슈퍼솔져는 적영토에 진입 할 수 있는 중요한 게릴라 침투부대입니다. [COLOR_PLAYER_PURPLE]유전자개조-광형태적위장[ENDCOLOR] 승급이 있어, 적에게 탐지당하지 않습니다. 공격을 하거나, 탐지가 가능한 유닛 시야에 있거나, 다른 유닛 바로 옆에 인접하면 탐지당합니다. 적영토에 침입하여 적을 방해할 수 있습니다.'),
-- [[용병계열]]  -----------------------------------------------------------------------------------------------------------------------------------
--용병
('TXT_KEY_UNIT_CAYM_PMC','프로 용병'),
('TXT_KEY_UNIT_FW_ELITE_MERCENARIES','유전자 선별 용병'),
('TXT_KEY_UNIT_FW_ORGANIC_MERCENARIES','유전자 조작 용병'),
('TXT_KEY_UNIT_FW_BIO_MERCENARIES','바이오 강화 용병'),
-- [[궁수계열]]  -----------------------------------------------------------------------------------------------------------------------------------
-- 재블린
('TXT_KEY_UNIT_FW_ATGM','재블린'),
('TXT_KEY_UNIT_FW_HELP_ATGM','정보화 시대의 강화된 원거리 유닛입니다. 기갑 유닛에 큰 피해를 입힙니다.'),
('TXT_KEY_UNIT_FW_ATGM_STRATEGY','재블린(대전차 미사일)은 원거리 유닛으로, 특히 기갑부대에 엄청난 피해를 입힐 수 있습니다. 3의 긴 사정거리를 자랑하는 가장 강력한 원거리 유닛이지만, 이동력은 느리고 방어할 때 약합니다. 따라서 적 유닛을 소모시키게 사용해야 합니다. 기존의 바주카보다 더 많은 피해를 입힙니다. 기관총처럼 주변의 적 유닛을 약화시킵니다. 공격 시 이동식 대전차미사일은 요새화된 유닛과 도시에 피해를 얼 입히지만 기갑부대에 피해를 더 입힙니다. 이것은 훌륭한 방어부대가 됩니다.'),
('TXT_KEY_CIVILOPEDIA_UNITS_FW_ATGM_TEXT','재블린(대전차미사일)은 전장에서 매우 중요한 역할을 하는 게릴라 유닛입니다. 우크라 전쟁에서 대전차미사일 (재블린)은 그 이름에서 알 수 있듯이, 이 유닛은 고속 이동 가능성과 강력한 대전차 미사일 시스템을 결합하여 전차를 미리 확인하고 멀리서 게릴라처럼 공격하여 탱크를 파괴할 수 있습니다.  하지만, 보병으로 몰래 이동해야 하는 단점으로 이동력에 제한이 있습니다. 또한 그것의 주 무기인 대전차 미사일은 적의 장갑 차량, 포진, 또는 구조물에 대해 엄청난 피해를 가할 수 있습니다. 대전차 미사일은 강력한 공격력을 가지고 있지만, 방어 또한 제한이 있어 적의 중강도 무기에 취약하다는 것을 의미합니다. 그러므로 이 유닛은 전략적 위치에서 빠르게 공격하고 후퇴하는 ''치고 빠지기'' 전술에 적합하게 디자인되었습니다.'),
('TXT_KEY_CIVIL_UNIT_FW_POWER_ARMOR_INFANTRY','파워 아머(Power Armor, Power Armor, Powered Suit, Cybernetic Suit, Cybernetic Armor, Exosuit, Hardsuit, Exoframe 또는 Augmented Mobility라고도 함)은 전기 모터, 공압, 레버, 수력학, 또는 증가된 힘과 지구력으로 팔다리 움직임을 허용하는 기술의 조합. 그 디자인은 등받이를 제공하고, 사용자의 동작을 감지하고, 기어를 관리하는 모터에 신호를 보내는 것을 목표로 합니다. 파워 아머는 어깨, 허리, 허벅지를 지탱하고 무거운 물건을 들거나 들기 위한 움직임을 보조하고 허리의 스트레스를 낮춥니다. 가장 초기에 알려진 외골격 유사 장치는 1890년 러시아 엔지니어 Nicholas Yagin이 개발한 운동 보조 장치였습니다. 수동적이고 인력이 필요했지만 압축 가스 주머니에 저장된 에너지를 사용하여 이동을 지원했습니다. 파워 아머는 공상과학 소설의 영역에 불과했지만 오늘날에는 간단하고 ''저렴''하게 제작할 수 있으며 의료, 민간, 산업 및 물론 군사 분야에서 이미 사용되고 있습니다.'),
-- 오토마타
('TXT_KEY_UNIT_FW_AUTOMATON','오토마타'),
('TXT_KEY_UNIT_FW_AUTOMATON_TEXT','최초의 로봇이 개발된 이래로 로봇 병사라는 개념은 존재해 왔습니다. 제2차 세계 대전 초기에 원격 제어 기계로 일부 성공을 거두었지만 자율 전투 기계의 개념이 실현 가능한 것처럼 보이기 시작한 것은 20세기 말 드론 전투 차량이 배치되기 전까지는 아니었습니다. 종종 "자동 장치"라고 불리는 자율 무기 시스템이 전장에서 실용화되려면 여전히 보다 광범위한 인지 기술 개발이 필요합니다.'),
('TXT_KEY_UNIT_FW_AUTOMATON_STRATEGY','오토마타는 미래형 지상 궁수 유닛입니다.'),
('TXT_KEY_UNIT_FW_AUTOMATON_HELP','모이면 모일수록 강해지는 저렴하면서도 강력한 미래 유닛입니다. 자동생산시설과 무인관리기지가 있는 도시에서 더욱 빠르게 생산이 가능합니다.'),
-- 로봇군단
('TXT_KEY_UNIT_FW_ROBOT_INFANTRY','로봇군단'),
('TXT_KEY_UNIT_FW_ROBOT_INFANTRY_TEXT','인공 지능의 발전이 진행되면서 결국에 로봇군단이 탄생했습니다. 이들은 휴머노이드 같은 형태를 가지고 있으며, 고도의 AI 기술이 적용되어 자체적으로 생산 및 발전이 가능합니다. 이들은 강력한 병력 단위로서, 인간이 직접 개입하지 않아도 스스로 작전을 수행할 수 있는 능력을 가지고 있습니다. 로봇 군단은 고도로 발전된 AI 기술의 활용으로 적을 신속하게 식별하고, 그들을 원거리에서도 정확하게 타격할 수 있습니다. 이런 기능은 그들의 공격력을 상당히 높여주며, 전투에서 뛰어난 효율성과 효과성을 발휘하게 합니다. 특히 이들은 인간 병사에게 필요한 휴식 시간이 필요 없으므로, 지속적인 전투 능력을 유지할 수 있습니다. 전반적인 로봇 유닛의 대량 배치에 대한 우려가 있음에도 불구하고, 이를 실행한 사회들은 이들이 전장에서 매우 효과적이라는 것을 발견하였습니다. 이러한 우수성 덕분에, 평화 시기에 이들을 민간 업무에 다시 적응시키는 데 관련된 문제도 상당히 줄어들었습니다. 로봇 군단은 이러한 전환을 더욱 원활하게 만들어 주는, 혁신적인 병력 단위로서의 역할을 수행하고 있습니다.'),
('TXT_KEY_UNIT_FW_ROBOT_INFANTRY_STRATEGY','로봇 보병은 일반 오토마타보다 더 강력한 대장갑 원거리 궁수 유닛입니다. 모일수록 더 강력합니다.'),
('TXT_KEY_UNIT_FW_ROBOT_INFANTRY_HELP','모일수록 강해지는 미래시대의 강력한 유닛입니다. 자동생산시설과 무인관리기지가 있는 도시에서 더욱 빠르게 생산이 가능합니다.'),
-- 콜로서스
('TXT_KEY_UNIT_FW_COLOSSUS','콜로서스'),
('TXT_KEY_UNIT_FW_COLOSSUS_HELP','콜로서스는 로봇군단보다 더 강력한 대장갑 보병 유닛입니다. 그룹에서 더 강력해집니다.'),
('TXT_KEY_UNIT_FW_COLOSSUS_TEXT','전략적 방어의 원칙 중 하나는 공격에 비해 방어에 필요한 병력이 더 적다는 것입니다. 방어진은 그들이 지키고 있는 위치에 대한 깊은 이해를 바탕으로 자원을 더 효율적으로 배치할 수 있습니다. 실제로, 가장 기본적인 군사 AI 시스템들도 제한된 시간과 정보로 효과적인 방어를 구축할 수 있습니다. 하지만, 고급 AI 시스템이 개입하면 이런 방어는 훨씬 더 효율적이고 효과적이 됩니다. 이런 방식으로 개발된 것이 Cognitive Neuroelectronic Defense Registry(CNDR)인데, 이 시스템은 강력한 연결성과 높은 모듈성을 바탕으로 들어오는 위협을 관찰하고, 보고하며, 적응하고, 대응하는 최고의 방어력을 제공합니다. 이 시스템은 로봇군단의 통신제어가 발생할 경우를 대비한 능력도 갖추고 있습니다. 특히, CNDR 시스템은 방어 유닛인 콜로서스의 핵심 구성 요소로 작용합니다. 콜로서스는 강력한 플라즈마 포로 무장되어 있으며, 그 자체로 높은 방어력을 보유하고 있습니다. CNDR 시스템의 도움을 받아, 콜로서스는 들어오는 위협을 더 빠르고 정확하게 대응할 수 있으며, 동시에 로봇군단의 전체적인 운용을 통제할 수 있게 됩니다. 이런 식으로, CNDR와 콜로서스는 서로 완벽하게 연결되어 있어, 군사 전략의 새로운 차원을 열어놓았습니다.'),
('TXT_KEY_UNIT_FW_COLOSSUS_STRATEGY','콜로서스는 발사기에 플라즈마포를 장착한 강력한 원거리 로봇 유닛입니다. 강력하고 견고한 방어용 원거리 궁수 유닛입니다.'),
-- [[공병유닛]]   -----------------------------------------------------------------------------------------------------------------------------------
--공정부대
('TXT_KEY_UNIT_FW_AIRBORNE_FORCES','공정부대'),
('TXT_KEY_UNIT_HELP_FW_AIRBORNE_FORCES','우호 영토로부터 공중투하가 가능한 강력한 보병 유닛입니다. 강하 후에도 이동 및 약탈을 할 수 있지만 다음턴까지 전투를 할 수 없습니다.'),
('TXT_KEY_UNIT_FW_AIRBORNE_FORCES_STRATEGY','공정부대는 정보화시대 공병유닛입니다. 최대 40타일 떨어진 곳에서 낙하산으로 이동할 수 있습니다(아군 영토에서 시작할 때). 이를 통해 공수 부대는 말 그대로 적의 위치를 뛰어넘고 도로망을 파괴하고 중요한 자원을 약탈하는 등 그의 전선 뒤에서 대혼란을 일으킬 수 있습니다. 공정 부대는 그러한 임무를 수행할 때 큰 위험에 처하므로 목표가 그만한 가치가 있는지 확인하십시오!'),
('TXT_KEY_CIV5_FW_AIRBORNE_FORCES_TEXT','공정 부대는 일반적으로 특수 잠입부대로, 항공기로 이동하고 일반적으로 낙하산으로 전투에 "투하"하도록 설정된 군대입니다. 따라서 그들은 적진 뒤에 배치될 수 있으며 경고 없이 거의 모든 곳에 배치할 수 있습니다. 포메이션은 항공기의 수와 크기에 의해서만 제한되므로 충분한 용량이 주어지면 몇 분 안에 거대한 힘이 "갑자기" 나타날 수 있으며, 도시에 미리 잡입하거나 후방에서 도시의 공략을 지원합니다.'),
--궤도강하 쇼크트루퍼
('TXT_KEY_UNIT_FW_ORBITAL_DROP_SHOCK_TROOPER','쇼크트루퍼'),
('TXT_KEY_UNIT_FW_ORBITAL_DROP_SHOCK_TROOPER_TEXT','궤도강하 쇼크트루퍼는 차세대 특수 작전 군대로, 지구 어디에서든 극히 짧은 시간 안에 투입될 수 있도록 설계되었습니다. 초기 발상은 궤도에서 유닛을 직접 강하시켜 전격적으로 적을 제압한다는 단순한 개념이었지만, 우주 발사 시설과 궤도 기술이 비약적으로 발전하면서 현실화되었습니다. 특수한 강하 캡슐과 충격 완화 장치, 고열 차폐 시스템 등이 적용되어 안전하게 대기권을 돌파할 수 있으며, 낙하 지점 근처에서 자동 제동과 방향 제어가 이루어져 정밀한 투입이 가능합니다. 이러한 신속 전개 능력은 국제 테러나 지역 분쟁을 조기에 차단하는 데 탁월한 효과를 보여주었고, 결국 전 세계 주요 강대국들은 궤도강하 쇼크트루퍼를 전략적 억제력과 동시에 즉응 전력으로 활용하게 되었습니다.'),
('TXT_KEY_UNIT_FW_ORBITAL_DROP_SHOCK_TROOPER_STRATEGY','궤도강하 쇼크트루퍼는 빠른 반응과 빠른 응답을 위해 설계되었으며, 시야 반경이 있는 한 순간 통지에 전 세계 어디에나 배치할 수 있습니다. 적의 전선이나 진지를 기습하거나, 전략적 타일을 공격하거나, 신속한 대응 지원군으로 배치하거나, 단순히 적에 맞서 전선을 유지하는 등 궤도강하 쇼크트루퍼가 할 수 없는 일은 거의 없습니다.'),
('TXT_KEY_UNIT_FW_ORBITAL_DROP_SHOCK_TROOPER_HELP','빠르고 강력한 미래 시대 보병 유닛입니다. 우호 영토에서 턴을 시작시 맵 전체 어디든지 공중 투하가 가능합니다.'),
-- 스페이스 마린
('TXT_KEY_UNIT_FW_SPACEMARINES','스페이스 마린'),
('TXT_KEY_UNIT_FW_SPACEMARINES_HELP','우호 영토로부터 공중투하가 가능한 강력한 정찰 지상 유닛입니다. 강하 후에도 이동 및 약탈을 할 수 있지만 다음턴까지 전투를 할 수 없습니다.'),
('TXT_KEY_UNIT_FW_SPACEMARINES_STRATEGY','스페이스 마린은 후반부 도시의 공략을 도우는 정찰 지상 유닛입니다. 아군 영토에서 궤도 낙하할 수 있습니다. 이를 통해 스페이스 마린은 말 그대로 적의 위치를 뛰어넘고 도로망을 파괴하고 중요한 자원을 약탈하는 등 그의 전선 뒤에서 대혼란을 일으킬 수 있습니다.'),
('TXT_KEY_UNIT_FW_SPACEMARINES_TEXT','스페이스 마린 또는 아뎁투스 아스타르테스는 인류의 수호자이자 인류 황제의 전사 중 가장 위대한 전사입니다. 그들은 거의 인간이 아니지만 초인간적입니다. 가혹한 유전자 조작, 심리 조절 및 엄격한 훈련을 통해 정상인보다 모든 면에서 우월하게 되었습니다. 스페이스 마린의 갑옷은 여러 겹의 세라마이트와 아다만티움으로 구성되어 있으며, 터미네이터 아머는 움직임을 향상시키기 위해 사용자 자신의 신경 및 근육 시스템에 연결되는 전기동력 섬유 다발과 서보 지원 인터페이스로 꿰어져 있습니다.'),
-- [[유전자 유닛]]   -----------------------------------------------------------------------------------------------------------------------------------
-- 유전자변형충
('TXT_KEY_UNIT_FW_SWARM','유전자변형충'),
('TXT_KEY_UNIT_FW_SWARM_TEXT','원래의 생명공학 키메라들은 대체로 수명이 짧았고, 몇몇은 기본적인 생존 본능과 장기 생존에 필요한 기관조차 부족했습니다. 이런 초기 전투 형태의 대부분은 더 성공적으로 사용되었지만, 바이오-타이탄의 출현으로 인해 이러한 방식의 전투는 나중에 재검토되었습니다. 바이오-타이탄의 개발과 별개로 이 초기 키메라들은 주로 적의 공격을 방해하고 혼란을 일으키는 역할을 담당했습니다. 이들은 일종의 지원 유닛으로, 적의 진영에 빠르고 무자비하게 돌진하여 적의 전략을 흐트리는 역할을 수행했습니다. 이들의 임무는 적의 주의를 분산시키고, 공격을 지연시키며, 가급적 많은 혼란과 손상을 입히는 것이었습니다. 생명력이 풍부하지 않더라도, 이들은 에너지 저장량이 높아 죽을 때까지 계속해서 활동할 수 있었습니다. 위장 시스템이 결여되어 있음에도 불구하고, 그들의 주요 임무는 적을 공격하고 괴롭히는 것이었기 때문에, 생존보다는 공격적인 행동이 요구되었습니다. 이러한 이유로 그들은 가차 없이 공격하고, 적의 방어를 깨트리며, 지속적으로 적에게 압박을 가하는 역할을 수행했습니다. 그들의 유일한 목표는 적을 향해 끝없이 돌진하는 것이었고, 이는 그들을 강력하고 무자비한 공격자로 만들었습니다.'),
('TXT_KEY_UNIT_FW_SWARM_STRATEGY','유전자변형충은 미래시대의 지상 유닛입니다.'),
('TXT_KEY_UNIT_FW_SWARM_HELP','이동력이 있지만 약한 미래시대 지상 유닛입니다. 공격시 3턴동안 효과가 지속되는 강력한 신경독을 퍼뜨립니다.'),
('TXT_KEY_UNIT_FW_CHIMERA','키메라'),
('TXT_KEY_UNIT_FW_CHIMERA_TEXT','유전공학의 발전으로 다양한 필요성을 충족시키기 위해 완전히 새로운 생물체를 만들 수 있게 되면서, 많은 새로운 키메라들이 전투 환경에서 활용되도록 개발되었습니다. 포식자 본능과 빠르게 움직이고, 험준한 지형을 가로질러 이동하며, 심지어는 적응적인 위장 능력까지 가진 이들 키메라는 인간 군대에게 무서운 존재로 입증되었습니다.'),
('TXT_KEY_UNIT_FW_CHIMERA_STRATEGY','키메라는 미래 시대의 빠른 이동이 가능한 기마 유닛입니다.'),
('TXT_KEY_UNIT_FW_CHIMERA_HELP','빠른 이동력을 지녔지만 돌연변이보다 약한 미래 시대 유닛입니다. 전략자원이 필요하지 않습니다.'),
-- [[공룡]]  -----------------------------------------------------------------------------------------------------------------------------------
-- 티라노사우루스
('TXT_KEY_UNIT_FW_TREX','티라노사우루스'),
('TXT_KEY_UNIT_FW_TREX_TEXT','가장 상징적인 공룡 중 하나인 티라노사우르스 렉스를 부활시키려는 노력은 불가피했습니다. 유전자 조작의 혜택을 받은 쥬라기 공원의 티라노사우르스 렉스는 강력하고 빠르지만 그 힘 때문에 도망치는 동물을 상대하기가 어렵습니다.'),
('TXT_KEY_UNIT_FW_TREX_STRATEGY','쥬라기 공원에서 탈출한 공격적인 공룡 유닛. 개방된 지형에서 더 나은 비용과 사냥을 할 수 있습니다.'),
('TXT_KEY_UNIT_FW_TREX_HELP','쥬라기 공원에서 탈출한 공격형 공룡 유닛입니다. 비용이 들지 않습니다. 평지에서 싸울때 더 강해집니다.'),
-- 트리케라톱스
('TXT_KEY_UNIT_FW_TRICERATOPS','트리케라톱스'),
('TXT_KEY_UNIT_FW_TRICERATOPS_TEXT','초식공룡의 상징인 트리케라톱스는 느리게 움직이지만 가죽과 뼈판으로 엄청난 보호를 받습니다. 일부 동물은 포로 상태에서 탈출하여 제거하기 위해 대전차 무기가 필요했습니다.'),
('TXT_KEY_UNIT_FW_TRICERATOPS_STRATEGY','쥬라기 공원에서 탈출한 방어형 공룡 유닛. 비용이 들지 않으며 무거운 차량을 뒤집을 수 있습니다.'),
('TXT_KEY_UNIT_FW_TRICERATOPS_HELP','쥬라기 공원에서 탈출한 방어형 공룡 유닛입니다. 비용이 들지 않습니다. 기갑 유닛 상대로 더 잘 싸웁니다.'),
-- 벨로시랩터
('TXT_KEY_UNIT_FW_RAPTOR','벨로시랩터'),
('TXT_KEY_UNIT_FW_RAPTOR_TEXT','쥬라기 공원의 유전적으로 재설계된 공룡 중 가장 무서운 벨로시랩터는 매우 지능적이며 종종 포로에서 탈출하는 방법을 찾으려고 노력합니다. 티라노사우르스만큼 강하지도 않고 트리케라톱스만큼 강하지도 않지만 매우 빠르며 일단 탈출하면 사냥하기 어려울 수 있습니다.'),
('TXT_KEY_UNIT_FW_RAPTOR_STRATEGY','쥬라기 공원에서 탈출한 이동식 공룡 유닛. 비용이 들지 않고 숲과 정글에서 공격력이 증가합니다.'),
('TXT_KEY_UNIT_FW_RAPTOR_HELP','쥬라기 공원에서 탈출한 정찰형 공룡 유닛입니다. 비용이 들지 않습니다. 숲, 정글에서 더 잘 싸웁니다.'),
-- [[고속정류]]  -----------------------------------------------------------------------------------------------------------------------------------
-- Gunboat
('TXT_KEY_UNIT_FW_GUNBOAT', '고속정'),
('TXT_KEY_UNIT_FW_GUNBOAT_HELP', '이동력이 좋은 원거리 해군 유닛입니다. 잠수함을 탐지하는것이 가능하며, [COLOR_PLAYER_PURPLE]공격 후 이동[ENDCOLOR] 승급과 [COLOR_PLAYER_PURPLE]낙하 부대[ENDCOLOR] 승급을 가지고 있습니다. 대양에서는 느려집니다. [NEWLINE][NEWLINE]한 번에 [COLOR_YELLOW]5기[ENDCOLOR]만 보유할 수 있습니다'),
('TXT_KEY_UNIT_FW_GUNBOAT_STRATEGY', '비행기로 운송할 수 있는 소형 고속정이지만 해전에는 약합니다. 바다를 탐험하고 약탈하는 데 사용하십시오. 문명당 최대 4개까지 지을 수 있습니다.'),
('TXT_KEY_UNIT_FW_GUNBOAT_TEXT', '고속정은 해전을 위해 설계된 군용 선박이나 군대 또는 보급품을 운반하기 위해 설계된 군용 선박과 달리 바다와 해안 목표물을 탐험하기 위해 하나 이상의 총을 운반하는 명시적인 목적을 위해 설계된 해군 선박입니다. 일반 해군 함정을 따라잡기 위해 만들어진 초고속 함선이다.'),
-- Advanced Gunboat
('TXT_KEY_UNIT_FW_ADV_GUNBOAT', '초고속정'),
('TXT_KEY_UNIT_FW_ADV_GUNBOAT_HELP', '이동력이 매우 좋은 원거리 해군 유닛입니다. 잠수함을 탐지하는것이 가능하며, [COLOR_PLAYER_PURPLE]공격 후 이동[ENDCOLOR] 승급과 [COLOR_PLAYER_PURPLE]낙하 부대[ENDCOLOR] 승급을 가지고 있습니다. 대양에서는 느려집니다. [NEWLINE][NEWLINE]한 번에 [COLOR_YELLOW]5기[ENDCOLOR]만 보유할 수 있습니다'),
('TXT_KEY_UNIT_FW_ADV_GUNBOAT_STRATEGY', '비행기로 운송할 수 있는 소형 고속정이지만 해전에는 약합니다. 바다를 탐험하고 약탈하는 데 사용하십시오. 문명당 최대 4개까지 지을 수 있습니다.'),
('TXT_KEY_UNIT_FW_ADV_GUNBOAT_TEXT', '초고속정은 해전을 위해 설계된 군용 선박이나 군대 또는 보급품을 운반하기 위해 설계된 군용 선박과 달리 바다와 해안 목표물을 탐험하기 위해 하나 이상의 총을 운반하는 명시적인 목적을 위해 설계된 해군 선박입니다. 일반 해군 함정을 따라잡기 위해 만들어진 초고속 함선입니다. 고속정에서 생존력이 안 좋아 생존력과 공격력을 강화하기 위해 비상 시에 사용할 수 있는 미사일 발사대가 설치되어있습니다.'),
-- [[구축함류]]  -----------------------------------------------------------------------------------------------------------------------------------
-- 줌왈트 구축함
('TXT_KEY_UNIT_FW_NEODESTROYER','줌왈트 구축함'),
('TXT_KEY_UNIT_FW_NEODESTROYER_TEXT','구축함은 개발 이후 현대 해군에서 없어서는 안 될 부분이었습니다. 고속 및 센서 제품군을 통해 적 선박과 잠수함을 탐지하는 첫 번째 방어선 역할을 할 수 있습니다. 그러나 재료 공학 및 센서 기술의 발전으로 인해 디자인이 지속적으로 업그레이드되었습니다. 특히 센서 시스템의 효율성을 높이기 위한 스텔스 기술과 컴퓨터 시스템의 출현으로 이러한 새로운 첨단 구축함은 해군에서 더욱 필수적인 부분이 되었습니다. 21세기 구축함은 수상 전투함의 글로벌 표준입니다. 그들은 레이더 단면을 작게 유지하기 위해 복잡한 모서리와 틈새가 없는 크고 슬래브 측면과 같은 기능을 표시하는 경향이 있으며, 발사 준비가 된 많은 수의 미사일 및 헬리콥터 비행 갑판 및 격납고를 운반하기 위한 수직 발사 시스템입니다. 하드웨어와 소프트웨어가 결합되어 더 넓은 감지 범위, 향상된 감도 및 더 정확한 식별이 가능합니다. 이들 선박 중 단 한 척만이 탄도 미사일, 순항 미사일, 적 항공기 및 수상함으로부터 전체 함대를 동시에 방어할 수 있습니다.'),
('TXT_KEY_UNIT_FW_NEODESTROYER_STRATEGY','줌왈트 구축함은 미사일 구축함의 미래형 버젼입니다. 아주 강력하고 값비싼 해상 근접 유닛으로 멀리서 잠수함을 추적하고 모든 공중 위협에 효율적으로 대처할 수 있습니다.'),
('TXT_KEY_UNIT_FW_NEODESTROYER_HELP','4개의 미사일을 장착할 수 있는 이 매우 강력한 해상 근접 유닛은 멀리서도 잠수함을 볼 수 있습니다. 줌왈트 구축함의 가치는 잠수함을 격파하고, 공중 유닛을 요격하는 것입니다.'),
-- 뉴로 구축함
('TXT_KEY_UNIT_FW_RAILGUN_DESTROYER','뉴로 구축함'),
('TXT_KEY_UNIT_FW_RAILGUN_DESTROYER_HELP',' 미래시대의 강력한 근접 해상 유닛입니다. 멀리서도 잠수함을 볼 수 있습니다. 미사일 4개를 포함합니다.'),
('TXT_KEY_UNIT_FW_RAILGUN_DESTROYER_TEXT','뉴로 구축함은 생체-신경 네트워크와 첨단 해군 공학이 융합된 차세대 전투 플랫폼입니다. 이 함선의 심장부에는 BCI(Brain-Computer Interface) 기반 신경-뉴로시스템이 내장되어 있어, 함선과 승무원, 그리고 AI가 하나의 유기체처럼 반응합니다.과거 구축함이 주로 잠수함 탐지와 대잠 전투에 특화되었다면, 뉴로 구축함은 바이오-양자컴퓨터를 탑재해 전투 상황을 실시간으로 해석하고, 생체의 자기방어 본능을 모방한 알고리즘으로 적 위협에 반사적으로 대응합니다. 이 과정에서 발달한 스파이더 센서(Spider Sensor) 망은 거미의 촉각 신경망처럼 미세한 전자기·수압·열 신호까지 포착하여, 유입되는 모든 위협을 다차원적으로 분석합니다.[NEWLINE] 주 무기 체계인 레일건 역시 단순한 전자기 가속포가 아니라, 뉴로시스템과 연결되어 목표물의 움직임을 예측하고 신체의 반사신경처럼 지연 없이 요격 사격을 수행합니다. 이는 마치 생명체가 본능적으로 몸을 움츠려 방어하는 것과 같은 원리로, 전투 상황에서 대응 시간을 극단적으로 줄여 적의 공격을 선제적으로 차단합니다.결과적으로 뉴로 구축함은 생체-기계 하이브리드 방어 본능을 군사 기술에 이식한 첫 사례로, 공격과 방어 모두에서 인간과 기계, 그리고 생명체 본능이 완벽히 융합된 전장을 구현합니다.'),
('TXT_KEY_UNIT_FW_RAILGUN_DESTROYER_STRATEGY','아주 강력하고 값비싼 해상 근접 유닛으로 멀리서 잠수함을 추적하고 모든 공중 위협에 효율적으로 대처할 수 있습니다.'),
-- 바이오 구축함
('TXT_KEY_UNIT_FW_BIO_DESTROYER','바이오 구축함'),
('TXT_KEY_UNIT_FW_BIO_DESTROYER_HELP',' 미래시대의 최후의 마지막 강력한 근접 해상 유닛입니다. 매턴 스스로 체력을 회복하며, 멀리서도 잠수함을 볼 수 있습니다. 이동이 가능합니다. 미사일 4개를 포함합니다.'),
('TXT_KEY_UNIT_FW_BIO_DESTROYER_TEXT','첨단 생물기술과 유전자 연구의 새로운 시대에 도래한 해군의 구축함은 전례 없는 변화를 겪었습니다. 유전자 가속에 대한 돌파구와 해양 및 해양생물에 대한 포괄적인 연구에서 얻은 지식을 활용하여, 해군은 구축함의 선체 변화를 추진했습니다. 이 변화의 결과로, 구축함은 이제 더욱 빠르게 이동하고 복구할 수 있는 능력을 갖게 되었습니다. 해양 생물에 대한 첨단 연구는 선체 디자인과 방어 시스템에 혁신적인 변화를 가져왔습니다. 이제는 해양의 가장 깊은 곳에 숨어있는 잠수함을 탐지하거나, 해상에서의 위력을 과시하거나, 심지어는 도시를 공략하는 데 필요한 능력을 가진 구축함을 개발할 수 있게 되었습니다. 이 혁신은 인류에게 바다에서의 전술적 우위를 확보하는 새로운 방법을 제공했습니다.'),
('TXT_KEY_UNIT_FW_BIO_DESTROYER_STRATEGY','아주 강력하고 값비싼 해상 근접 유닛으로 멀리서 잠수함을 추적하고 모든 공중 위협에 효율적으로 대처할 수 있습니다.'),
-- [[순양함류]]  -----------------------------------------------------------------------------------------------------------------------------------
-- 아스널 쉽
('TXT_KEY_UNIT_FW_ARSENAL_SHIP','아스널쉽'),
('TXT_KEY_UNIT_FW_ARSENAL_SHIP_TEXT','아스널쉽은 중형 미사일, 대부분 순항 미사일을 위한 500개의 수직 발사 베이를 갖도록 의도된 부유식 미사일 플랫폼에 대한 개념입니다. 일부 해군 독트린에서는 컴퓨터 시스템이 더욱 정교해짐에 따라 일부는 대체로 자율적이 되도록 전환되었지만 무기고 함선은 다른 함선에 의해 원격으로 지휘됩니다.'),
('TXT_KEY_UNIT_FW_ARSENAL_SHIP_STRATEGY','아스널쉽은 미사일 순양함의 미래시대 후속 모델입니다. 4개의 미사일 유닛을 탑재할 수 있을 뿐만 아니라 강력한 원거리 공격도 가능합니다.'),
('TXT_KEY_UNIT_FW_ARSENAL_SHIP_HELP','미사일 순양함의 진화형으로 4개의 미사일을 탑재할 수 있으며 매우 강력한 원거리 공격을 가졌습니다.'),
-- 뉴로 순양함
('TXT_KEY_UNIT_FW_RAILGUN_CRUISER','뉴로 순양함'),
('TXT_KEY_UNIT_FW_RAILGUN_CRUISER_HELP',' 미래시대의 강력한 원거리 해상 유닛입니다. 미사일 4개를 포함합니다.'),
('TXT_KEY_UNIT_FW_RAILGUN_CRUISER_TEXT','뉴로 레일건 순양함은 단순한 해군 화력 플랫폼을 넘어, 신경-뉴로시스템과 바이오-양자컴퓨터가 융합된 해양 전투 생명체라 할 수 있습니다. 이 거대한 전함의 중심에는 인간-기계-AI의 경계를 허무는 BCI(Brain-Computer Interface) 뉴로코어가 탑재되어 있으며, 승무원과 함선, 그리고 무기 시스템이 하나의 생체신경망처럼 연결됩니다.[NEWLINE]특히 이 순양함의 레일건 무기 시스템은 구축함급보다 훨씬 거대한 플랫폼 위에서 작동하며, 바이오-양자컴퓨터가 제공하는 예측 사격 알고리즘과 스파이더 센서망을 통해 수평선 너머의 위협을 실시간으로 탐지하고, 생체의 자기방어 본능처럼 반사적으로 요격 사격을 수행합니다. 이 과정은 인간의 신경계가 위험을 감지하고 반사적으로 움직이는 것과 같은 원리로, 적의 대응 시간을 사실상 "제로"로 줄입니다.뉴로 레일건 순양함은 단순히 파괴력을 추구하는 전함이 아닙니다. 도시 포위, 해상 제압, 대함·대공 전투까지 모든 상황에 즉각 대응하는, 공격·방어 균형형 전투 생체 플랫폼입니다. 전자기 레일건의 고속·고에너지 특성과 생명체의 신경망 반사 시스템이 융합됨으로써, 이 순양함은 해양 전장에서 스스로 사고하고 반응하는 함선이라는 새로운 군사 패러다임을 제시합니다.'),
('TXT_KEY_UNIT_FW_RAILGUN_CRUISER_STRATEGY','바다를 지배하여 문명의 강력함을 적에게 알려주십시오. 뛰어난 생존력으로 바다에서의 강력함을 적에게  보여줍시다!'),
-- 바이오 순양함
('TXT_KEY_UNIT_FW_BIO_CRUISER','바이오 순양함'),
('TXT_KEY_UNIT_FW_BIO_CRUISER_HELP',' 미래시대의 최후의 마지막 강력한 원거리 해상 유닛입니다. 매턴 스스로 체력을 회복하며, 이동이 가능합니다. 미사일 4개를 포함합니다.'),
('TXT_KEY_UNIT_FW_BIO_CRUISER_TEXT','첨단 생물기술과 유전자 연구의 새로운 시대에서, 해군의 순양함은 혁명적인 변화를 겪었습니다. 유전자 가속에 대한 돌파구와 광범위한 해양 및 해양생물에 대한 연구에서 얻은 지식을 활용하여, 해군은 선박의 선체에 대한 변화를 추진하게 되었습니다. 이러한 변화는 기존에 사용되던 방식과는 크게 달라, 이제 선박은 매우 빠르게 이동하고 복구하는 능력을 갖게 되었습니다. 이 변화의 핵심은 기체가 자동으로 회복하는 시스템입니다. 이 시스템은 생물학적 회복 시스템의 알고리즘을 채택하여, 손상된 선체를 빠르게 수리할 수 있게 해줍니다. 이 기술은 하이브리드 드론에 대한 연구의 결과물로, 기체의 회복 능력을 극대화하고, 훨씬 더 긴 선박 수명을 보장할 수 있습니다. 선박의 기본 구조는 여전히 기존에 사용되던 방식을 따르지만, 이런 혁신적인 기술은 더욱 효과적인 방식으로 선박을 운용할 수 있게 해주었습니다. 그들은 여전히 레이더와 총을 장착하고 바다 어디든지 이동할 수 있지만, 이제는 훨씬 더 큰 무기와 더 두꺼운 방어구를 탑재할 수 있는 기회를 얻게 되었습니다. 해양 생물에 대한 첨단 연구 덕분에, 이제는 포식자로부터 보호받거나, 심해에서 효과적으로 작업을 수행하거나, 심지어는 적대적인 환경에서도 생존할 수 있는 능력을 가진 선박을 개발할 수 있게 되었습니다. 이 혁신은 인류에게 바다에서의 생활을 재구성하는 새로운 방법을 제공했습니다.'),
('TXT_KEY_UNIT_FW_BIO_CRUISER_STRATEGY','바다를 지배하여 문명의 강력함을 적에게 알려주십시오. 뛰어난 생존력으로 바다에서의 강력함을 적에게  보여줍시다!'),
-- [[잠수함류]]  -----------------------------------------------------------------------------------------------------------------------------------
-- 탄도 미사일 잠수함
('TXT_KEY_UNIT_FW_MECHASUB','탄도 미사일 잠수함'),
('TXT_KEY_UNIT_FW_MECHASUB_STRATEGY','일반 핵잠수함보다 강인하고 강력합니다. 이것 역시 대부분의 유닛에게는 보이지 않고 다른 잠수함을 볼 수 있지만 다른 유닛을 공격하거나 인접할 때 보입니다. 탄도 미사일 잠수함은 핵 잠수함의 업그레이드이며 기계-전자 융합을 연구하면 사용할 수 있습니다. 구식이 되지 않습니다. [ICON_RES_URANIUM] 우라늄이 필요합니다.'),
('TXT_KEY_UNIT_FW_MECHASUB_HELP','탄도 미사일 잠수함은 구축함과 다른 잠수함을 제외한 모든 유닛에게 보이지 않습니다. 2개의 미사일을 탑재할 수 있습니다. 해군 유닛에 매우 강합니다. [ICON_RES_URANIUM] 우라늄이 필요합니다.'),
('TXT_KEY_UNIT_FW_MECHASUB_PEDIA',' 탄도 미사일 잠수함은 핵탄두가 장착된 잠수함 발사 탄도 미사일(SLBM)을 배치할 수 있는 잠수함입니다. 탄도 미사일 잠수함에 대한 미국 해군의 선체 분류 기호는 SSB 및 SSBN입니다. SS는 잠수함(또는 잠수정), B는 탄도 미사일, N은 원자력 잠수함을 나타냅니다.[NEWLINE][NEWLINE]이는 잠수함은 핵 억지력 때문에 냉전의 주요 무기 체계가 되었습니다. 그들은 목표물로부터 수천 킬로미터 떨어진 곳에서 미사일을 발사할 수 있고 소음이 적기 때문에 탐지하기 어렵기 때문에 선제 공격 시 생존 가능한 억지력이 되고 핵 억지력의 상호 확증 파괴 정책의 핵심 요소가 됩니다. 그들의 배치는 미국과 소련/러시아에 의해 지배되었으며 프랑스, 영국, 중국 및 인도와 함께 적은 수의 서비스를 제공했습니다.'),
-- 레비아탄
('TXT_KEY_UNIT_FW_CYBERSUB','레비아탄'),
('TXT_KEY_UNIT_FW_CYBERSUB_TEXT',' 레비아탄은 차세대 심해 전투 플랫폼으로, 함선 자체가 **뉴로-아바타 인터페이스**와 연결되어 승무원과 AI, 그리고 원격 지휘 센터가 하나의 생명체처럼 작동합니다. 극한의 수압·암흑 환경에서도 레비아탄은 실시간 신경 동기화를 통해 함체, 센서, 무기 시스템을 유기적으로 제어하며 수천 km 밖에서도 마치 승무원이 직접 탑승한 것처럼 정밀한 작전이 가능합니다. **바이오-양자컴퓨터**와 **스파이더 센서망**은 목표의 미세한 신호까지 포착하고, 생체의 자기방어 본능을 모방한 반사 신경 알고리즘으로 즉각적인 공격·회피 기동을 수행합니다.  이로 인해 레비아탄은 단순한 잠수함이 아니라, 심해와 전장을 초월하는 **사이버네틱 해양 포식자**라 불립니다.'),
('TXT_KEY_UNIT_FW_CYBERSUB_STRATEGY','사이버 잠수함은 미래시대의 잠수함입니다.'),
('TXT_KEY_UNIT_FW_CYBERSUB_HELP','구축함, 미사일 순양함, 아스널쉽, 그리고 다른 잠수함 계열을 제외한 다른 유닛에게는 인접하거나 공격 전까진 보이지 않습니다.  2개의 미사일을 탑재할 수 있으며 다른 해상 유닛을 공격하는데 특화되어 있습니다.'),
-- [[항모]]  -----------------------------------------------------------------------------------------------------------------------------------
-- 이지스 항공모함
('TXT_KEY_UNIT_FW_SUPERCARRIER','이지스 항공모함'),
('TXT_KEY_UNIT_FW_SUPERCARRIER_HELP','기본 10대의 항공기를 탑재할 수 있습니다. 문명당 2개로 제한 됩니다.'),
('TXT_KEY_UNIT_FW_SUPERCARRIER_STRATEGY','이지스 항공모함은 전투기, 폭격기(스텔스 폭격기는 아님) 및 원자 폭탄을 운반하는 특수 선박입니다. 이지스 항공모함은 직접 공격할 수 없지만, 탑재하는 항공기는 해상에서 가장 강력한 공격 무기가 됩니다. 방어적으로는 근거리 지상 및 장거리 공중 공격 모두로부터 자신을 방어할 수 있지만 여전히 약하며 미사일 구축함과 핵 잠수함의 호위를 받아야 합니다. 문명당 2개로 제한 됩니다.'),
('TXT_KEY_UNIT_FW_SUPERCARRIER_TEXT','이지스 항공모함은 혁신적인 군사 장비로써, 원자력을 사용하며 최첨단 기술을 갖추고 있습니다. 이것은 단순한 항공모함이 아니라, 아름다운 형태와 놀라운 능력을 겸비한 첨단 전투 시스템의 상징입니다. 이 항공모함의 가장 큰 특징 중 하나는 원자력 추진 시스템입니다. 이 시스템은 항공모함이 거의 무제한으로 운용할 수 있도록 해줍니다. 공급선의 지원 없이도 장기간 거대한 힘을 유지할 수 있어, 이지스 항공모함은 어떤 임무든 수행할 수 있습니다. 더욱 흥미로운 것은 이 항공모함이 잠수함 탐지 기능을 갖추고 있다는 것입니다. 선박 하부에는 소나와 기타 탐지 장비가 설치되어 있어, 수면 아래에 숨겨진 위협을 발견할 수 있습니다. 이러한 기능은 이지스 항공모함이 대양을 안전하게 통제하고, 적 잠수함의 위협에서 우리의 해상 통행로를 보호하는 데 결정적입니다. 이지스 항공모함은 전투에서의 우리의 우위를 확보하고, 평화를 유지하며, 우리의 해상 이해관계를 보호하는 데 필수적인 장비입니다. 이런 능력은 우리를 잠재적 위협으로부터 보호하고, 전세계에서 우리의 존재감을 부각시킵니다. 이런 항공모함은 단지 군사 장비가 아니라, 우리의 의지와 힘의 상징인 것입니다.'),
-- [[전투기]]  -----------------------------------------------------------------------------------------------------------------------------------
--  스텔스무인전투기
('TXT_KEY_UNIT_FW_DRONE_FIGHTER_2','스텔스무인전투기'),
('TXT_KEY_UNIT_FW_DRONE_FIGHTER_2_TEXT','드론 기술과 자율 컴퓨터 시스템의 발전은 공중 우위 역할을 수행할 수 있는 고도화된 드론 전투기의 개발로 이어졌습니다. 전투기의 개발에 있어 주요한 제한 요소 중 하나는 인간 요소였는데, 이는 인간 몸이 감내할 수 있는 G압력을 견디는 것에 한계가 있었기 때문입니다. 자동화된 전투기는 이러한 제한이 없으므로, 현대 공학의 전체 능력을 발휘할 수 있었습니다.'),
('TXT_KEY_UNIT_FW_DRONE_FIGHTER_2_STRATEGY','스텔스 무인 전투기는 미래형 공중 유닛입니다.'),
('TXT_KEY_UNIT_FW_DRONE_FIGHTER_2_HELP','제공권을 장악하고 다가오는 적의 비행기를 요격하기 위해 설계된 공군 유닛입니다.'),
-- 플라즈마 전투기
('TXT_KEY_UNIT_FW_PLASMA_FIGHTER','플라즈마 전투기'),
('TXT_KEY_UNIT_FW_PLASMA_FIGHTER_TEXT','고도의 스텔스 기술과 초전도체를 활용한 강력한 플라즈마 엔진 추진력을 결합한, 현대 전투공간에서 핵심적인 역할을 하는 전투기입니다. 고유의 플라즈마 엔진은 대기 중의 이온화된 입자를 사용하여 엄청난 추진력을 발생시키며, 이는 플라즈마전투기가 빠르고 유연하게 움직이면서도 상대적으로 적은 에너지를 소비하도록 해줍니다. 또한, 이러한 엔진은 전투기가 적의 탐지를 피하면서 높은 고도에서 비행하도록 해줍니다. 이 전투기의 무기로는 초전도체를 활용한 레일건이 탑재되어 있어, 대량의 플라즈마를 고속으로 발사하여 대기권 내외에서 강력한 공격을 가할 수 있습니다.'),
('TXT_KEY_UNIT_FW_PLASMA_FIGHTER_STRATEGY','넥서스와 헬리캐리어으로만 옮길 수 있는 플라즈마 고출력 엔진을 적용한 전투기입니다.  적의 방공 시설을 피해 도시와 유닛을 공략하고 적의 공습으로부터 도시와 헬리캐리어를 방어하세요.'),
('TXT_KEY_UNIT_FW_PLASMA_FIGHTER_HELP','넥서스와 헬리캐리어으로만 옮길 수 있는 플라즈마 고출력 엔진을 적용한 전투기입니다. 나노물질이 필요합니다.'),
-- 스페이스전투기
('TXT_KEY_UNIT_FW_SPACE_FIGHTER','스페이스 전투기'),
('TXT_KEY_UNIT_FW_SPACE_FIGHTER_TEXT','스페이스 전투기는 고유의 우주 전투기 유닛으로 넥서스 또는 헬리캐리어에 탑재가 가능합니다. 이들은 공중부양 시설인 헬리캐리어와 넥서스의 핵심 방어라인을 이루며, 넥서스의 고도로 집중된 명령 노드에 의해 효과적으로 조종되고 제어됩니다. 스페이스 전투기는 공중에서 대기권 내외로 공격을 가할 수 있는 능력과 함께, 강력한 우주 전투 능력을 가지고 있습니다. 스페이스 전투기는 첨단 스마트 재료를 활용한 설계로, 우주에서의 활동을 위해 특별히 만들어진 유닛입니다. 이들은 극한의 우주 환경에서도 작동할 수 있는 강력한 엔진과 미사일, 레이저 등 다양한 무기를 탑재하고 있습니다. 또한, 이들은 강력한 방어막을 통해 적의 공격으로부터 스스로를 보호하고, 넥서스를 지키는 역할을 수행합니다. 이를 통해 인류의 우주 식민지화를 지원하는 중요한 요소로 작용합니다.'),
('TXT_KEY_UNIT_FW_SPACE_FIGHTER_STRATEGY','고유의 우주선 전투기. 넥서스와 헬리캐리어에 탑승할 수 있습니다. 다른 항공기에 비해 사거리와 전투 능력이 향상되었습니다.'),
('TXT_KEY_UNIT_FW_SPACE_FIGHTER_HELP','넥서스와 헬리캐리어으로만 옮길 수 있는 우주선 형태의 전투기입니다. 넥서스를 보호하고, 다가오는 적 공중 유닛을 요격하고 제공권을 제압하는 목적으로 설계된 비행 유닛입니다.'),
-- [[폭격기]]  -----------------------------------------------------------------------------------------------------------------------------------
-- 준궤도 폭격기
('TXT_KEY_UNIT_FW_SUBORBITAL_BOMBER','준궤도 폭격기'),
('TXT_KEY_UNIT_FW_SUBORBITAL_BOMBER_TEXT','폭격기의 사거리와 타격력을 한계까지 끌어올리기 위한 노력의 일환으로, 실제로 궤도에 오르는 것보다 짧은 대기권을 비행할 수 있는 새로운 세대의 폭격기가 개발되었습니다. 이 고도에서는 요격하기가 극도로 어려웠고 반 탄도 궤적으로 얇은 대기를 통해 빠르게 이동할 수 있었습니다.'),
('TXT_KEY_UNIT_FW_SUBORBITAL_BOMBER_STRATEGY','준궤도 폭격기는 미래형 원거리 유닛입니다.'),
('TXT_KEY_UNIT_FW_SUBORBITAL_BOMBER_HELP','적 유닛과 도시에 죽음의 폭격을 가하는 매우 먼거리 비행이 가능한 공군유닛입니다.'),
-- 스페이스 폭격기
('TXT_KEY_UNIT_FW_SPACE_BOMBER','스페이스 폭격기'),
('TXT_KEY_UNIT_FW_SPACE_BOMBER_TEXT','스페이스 폭격기는 넥서스 또는 헬리캐리어에 탑재 가능한 고유의 우주 폭격 유닛으로, 넥서스의 전략적 공격 능력을 확보하는 핵심 요소입니다. 이들은 공중부양 시설인 헬리캐리어와 넥서스의 진지한 공격력을 구현하며, 고도로 집중된 넥서스의 명령 노드에 의해 효과적으로 지휘받습니다. 스페이스 폭격기는 첨단 스마트 재료를 활용한 설계로, 극한의 우주 환경에서도 공격을 수행할 수 있습니다. 이들은 강력한 엔진과 대량의 폭탄, 레이저 등 다양한 무기를 탑재하여 대규모 공격을 수행할 수 있습니다. 스페이스 폭격기는 강력한 방어막을 통해 적의 반격으로부터 스스로를 보호하며, 넥서스가 위협 요인으로부터 안전하게 지키는 역할을 수행합니다. 이를 통해 인류의 우주 식민지화를 지원하고, 위험 요인을 미리 제거하는 중요한 역할을 합니다.'),
('TXT_KEY_UNIT_FW_SPACE_BOMBER_STRATEGY','넥서스와 헬리캐리어으로만 옮길 수 있는 우주선 형태의 폭격기입니다. 요격 회피율이 상승하였습니다.'),
('TXT_KEY_UNIT_FW_SPACE_BOMBER_HELP','넥서스와 헬리캐리어으로만 옮길 수 있는 우주선 형태의 폭격기입니다. 적의 유닛과 도시 위로 세상의 파멸을 알려주는 비행 유닛입니다. '),
-- 플라즈마 폭격기
('TXT_KEY_UNIT_FW_PLASMA_BOMBER','플라즈마 폭격기'),
('TXT_KEY_UNIT_FW_PLASMA_BOMBER_TEXT','지상 목표를 대상으로 하는 막강한 공격력을 가지고 있습니다. 플라즈마 폭격기는 플라즈마 에너지를 활용하는 엔진과 함께 초전도체 기술을 사용하여 플라즈마 미사일을 개발하였습니다. 이 미사일은 고에너지 상태의 플라즈마를 이용하여 엄청난 파괴력을 발휘하며, 폭격기가 안전한 고도에서 목표를 정확하게 공격할 수 있도록 합니다. 또한, 스텔스 기능은 이 폭격기가 적의 방어망을 피하면서 목표 지점에 접근할 수 있게 해줍니다. 이런 기능을 통해 최고의 정밀 공격 능력을 가진 폭격기로 자리매김하게 되었습니다.'),
('TXT_KEY_UNIT_FW_PLASMA_BOMBER_STRATEGY','넥서스와 헬리캐리어으로만 옮길 수 있는 플라즈마 고출력 엔진을 적용한 폭격기입니다. 적의 방공 시설을 피해 도시와 유닛을 공략하세요.'),
('TXT_KEY_UNIT_FW_PLASMA_BOMBER_HELP','넥서스와 헬리캐리어으로만 옮길 수 있는 플라즈마 고출력 엔진을 적용한 폭격기입니다. 나노물질이 필요합니다.'),
-- [[특수유닛]]  -----------------------------------------------------------------------------------------------------------------------------------
-- 돌연변이
('TXT_KEY_UNIT_FW_MUTANT','돌연변이'),
('TXT_KEY_UNIT_FW_MUTANT_TEXT','가장 초기 형태의 유전자 조작 기술이 완성되자마자 종종 강력한 새 슈퍼 군인이나 생물 무기를 만드는 것을 목표로 인간을 대상으로 실험을 시도하는 비윤리적인 조직이 생길 수밖에 없었습니다. 그러나 종종 이러한 조잡한 실험은 무시무시한 괴물을 낳았지만, 많은 사람들이 전투에서 유용하게 만든 뛰어난 내구성과 재생 능력을 가지고 있는 것으로 알려졌습니다. 가장 교활한 사례는 또한 사망 시 방출되는 위험한 바이러스를 포함하여 종종 공격자들 사이에서 광기를 유발했습니다.'),
('TXT_KEY_UNIT_FW_MUTANT_STRATEGY','매 턴마다 적 유닛을 죽인 후 치유하는 공격 보병 유닛입니다.'),
('TXT_KEY_UNIT_FW_MUTANT_HELP','회복력이 뛰어난 이동형 유닛입니다. 부상당한 유닛 상대로 강해집니다.'),
-- 바이오 타이탄
('TXT_KEY_UNIT_FW_HYDRA','바이오-타이탄'),
('TXT_KEY_UNIT_FW_HYDRA_TEXT','생명공학의 끝을 보여주는 바이오-타이탄은 거대한 유기체로서, 전적으로 전투를 위해 설계되었습니다. 유전자 키메라와 다양한 전투형태가 점차 복잡해지며, 일부 생명 공학자들은 전투형태이 어느 정도의 파워를 가질 수 있는지 확인하기로 결정했습니다. 바이오-타이탄은 고대 공룡의 유전자 복제를 통해 얻은 지식을 활용하여, 지구에서 가장 거대한 생명체 중 일부를 복제해 유전자를 가속했습니다. 거기서 멈추지 않고, 놀랍게도 이는 강력한 에너지원인 소형원자로를 유기체 내부에 통합하는 연구의 결과도 얻었습니다. 이런 생체 외의 에너지원의 유입으로 인해 바이오-타이탄의 신진대사는 강화되었으며, 이는 그들의 성장, 회복 능력, 그리고 전투에서의 성능에 극적인 영향을 끼쳤습니다. 이러한 신체 내부의 원자로는 기존의 방사성 동위원소 생성기를 대체했으며, 이를 통해 유기체가 강력한 에너지를 생성하고 저장할 수 있게 되었습니다. 이 기술은 바이오-타이탄이 대학살 로봇을 능가하는 아주 강력한 공격력을 가지게 해 주었으며, 동시에 그들에게는 유기적 전투 형태에서의 뛰어난 재생 능력도 부여했습니다. 바이오-타이탄은 이제 그 어떤 전투도 두렵지 않으며, 그들의 강력함과 생명력은 인간의 공학과 생명 공학의 극한을 보여주는 증거가 되었습니다. 이를 통해 우리는 인간이 자연과 공학을 결합하여 어떻게 무한한 가능성을 창출해낼 수 있는지를 보게 됩니다.'),
('TXT_KEY_UNIT_FW_HYDRA_STRATEGY','바이오-타이탄은 미래시대 근접 유닛입니다. 대학살 로봇보다 느리지만 강합니다. 공격 시 원거리 공격을 먼저 합니다.'),
('TXT_KEY_UNIT_FW_HYDRA_HELP','게임 최후반의 가장 강력한 유닛 중 하나입니다. 대학살 로봇보다 느리지만 더 강합니다. 거대함으로 인해 시야가 증가합니다.'),
-- 나노하이브
('TXT_KEY_UNIT_FW_NANOHIVE','나노하이브'),
('TXT_KEY_UNIT_FW_NANOHIVE_TEXT','나노머신, 특히 나노어셈블러와 나노디스어셈블러의 개발은 불가피하게 이러한 장치를 무기화하고 군사적 목적으로 활용하려는 검색으로 이어졌습니다. 단기간의 나노스웜이 미사일 페이로드로 전달되어 일부 성공을 거두었지만 대부분의 나노스웜은 전장 조건에서 장기간 생존하는 데 어려움을 겪었습니다. 결국 나노하이브(nanohives)라고 불리는 자율운반체를 사용하여 나노머신 무리를 전장으로 보내는 아이디어가 고안되었습니다. 정교한 저고도 호버링 기술을 사용하여 이 나노하이브는 거의 모든 지형을 가로질러 전면으로 가져올 수 있었습니다. 적절한 프로그래밍을 통해 나노하이브는 아군 유닛을 치료하고 적 유닛을 공격하는 데 할당되어 분자 수준에서 분해되는 대상을 느리지만 가차 없이 분해할 수 있습니다.'),
('TXT_KEY_UNIT_FW_NANOHIVE_STRATEGY','나노하이브는 아군 유닛을 치료하고 매 턴 2타일 내에 있는 적 유닛에게 피해를 주는 미래시대 헬리콥터 유닛입니다. '),
('TXT_KEY_UNIT_FW_NANOHIVE_HELP','매턴 2타일 이내의 우호 유닛의 체력을 회복시키고 적 유닛에 피해를 줍니다.'),
-- 메가하이브
('TXT_KEY_UNIT_FW_MEGAHIVE','메가하이브'),
('TXT_KEY_UNIT_FW_MEGAHIVE_TEXT','지속적으로 부양이 가능하며, 주변을 치유할 수 있는 자체 복원력이 있는 메가하이브는 AI기술의 궁극적인 목표일 것입니다. 어떤 지형이든 호버링할 수 있는 능력은 비교할 수 없는 기동성을 제공하며, 자체 원거리 공격으로 놀라운 전투 능력을 발휘합니다. 그러나 자체적으로 도시를 점령할 수 없으므로 이를 지원하기 위해 최소한 일부 지상 유닛이 필요합니다.'),
('TXT_KEY_UNIT_FW_MEGAHIVE_STRATEGY','메가하이브는 모든 지형을 횡단할 수 있는 호버링 유닛입니다. 도시 공격 시 강력하지만 점령할 수는 없습니다.'),
('TXT_KEY_UNIT_FW_MEGAHIVE_HELP','어떤 지역이든지 떠도는게 가능한 호버링 유닛입니다. 주변의 아군 유닛을 치유하며, 강한 원거리 공격이 가능합니다.'),
-- 헬리캐리어
('TXT_KEY_UNIT_FW_HELICARRIER','헬리캐리어'),
('TXT_KEY_UNIT_FW_HELICARRIER_TEXT','헬리캐리어는 고도의 기술과 신기술의 결합으로 탄생한 공중 유닛입니다. 이는 항공모함의 기능을 대체하고, 이를 훨씬 넘어선 유연성과 기동성을 제공하는 혁신적인 전투 및 지원 플랫폼입니다. 첨단 우주선 엔진을 개발하는 도중에 지속적으로 공중에 부양한 기술을 얻게 되었고, 엄청 빠르지는 않지만 준수하게 움직일 수 있는 이 헬리캐리어는 기존의 어떤 항공 유닛의 단점을 보완하고 유연하게 작전을 수행할 수 있게 해줍니다. 이는 거의 모든 종류의 기상 조건과 환경에서 작동하도록 설계되었으며, 어떤 지역에서든 공중 지원을 제공할 수 있습니다. 헬리캐리어는 각종 전투 및 지원 임무를 수행하는 데 필요한 다양한 장비와 시스템을 갖추고 있습니다. 고속 전투기, 전투 헬리콥터, 무인 항공기 등 다양한 공중 유닛을 운용할 수 있으며, 고강도 레이저 및 미사일 시스템 등 강력한 무기를 통해 대기상의 위협에 대응할 수 있습니다. 또한, 헬리캐리어는 복잡한 센서와 통신 장비를 통해 전장에서의 정보 수집 및 분석, 그리고 신속한 명령 전달을 가능하게 합니다. 이를 통해 헬리캐리어는 공중에서의 감시, 통신, 지휘, 제어, 인텔리전스 기능을 모두 수행하며, 그 결과로 전술적인 우위를 취하는 데 결정적인 역할을 합니다. 전반적으로 헬리캐리어는 그 혁신적인 디자인과 기능을 통해 전투 지원의 새로운 기준을 제시하며, 그 경계를 끊임없이 확장하고 있습니다.'),
('TXT_KEY_UNIT_FW_HELICARRIER_STRATEGY','헬리캐리어는 지상으로 호버링이 가능한 미래형 지원 유닛입니다. 문명 내에 헬리캐리어를 4개 이상 소유할 수 없습니다.'),
('TXT_KEY_UNIT_FW_HELICARRIER_HELP','미래 시대의 보조형 유닛으로 지상으로 호버링이 가능하며, 기본 6대의 항공기가 탑재가능합니다. 문명당 2개로 제한 됩니다.'),
-- 넥서스
('TXT_KEY_UNIT_FW_NEXUS','넥서스'),
('TXT_KEY_UNIT_FW_NEXUS_TEXT','미래 시대 전쟁의 궁극적인 전환점은 넥서스의 등장으로 표현됩니다. 넥서스는 식민지화를 위해 디자인된 고급 항우주기지로서, 우주의 가혹한 조건에서도 인간 생활을 지원하도록 설계되었습니다. 첨단 스마트 재료와 소형 핵융합 발전소의 결합으로, 이 공중에 떠 있는 복합체는 사실상 우주에서의 자립 생활과 효과적인 방어를 가능하게 합니다. 넥서스의 중심에는 사람들의 생활 공간과 함께 고도로 집중된 명령 노드가 있습니다. 이 노드는 지속적인 전투 상황 분석을 제공하고, 넥서스 주변의 상황에 따라 필요한 업데이트를 실시간으로 제공합니다. 또한, 넥서스 내부에는 손상된 부품을 즉시 수리하거나 인간이 살아가는 데 필요한 물자를 만들어내는 나노 하이브가 설치되어 있어 자립성을 높였습니다. 넥서스는 우주 전투기와 폭격기를 보유하고 있어, 적에 대한 방어나 공격이 필요할 때 이들을 즉시 배치할 수 있습니다. 이러한 우주 전투체는 넥서스의 레일건과 미사일 배터리와 함께 연동되어 적에게 강력한 화력 지원을 제공합니다. [NEWLINE][NEWLINE]마지막으로, 넥서스는 자체적으로 매우 강력한 방어 시스템을 갖추고 있습니다. 이는 넥서스를 공격하려는 적을 효과적으로 저지하며, 동시에 넥서스 내부의 생명체와 시설을 보호하는 역할을 수행합니다. 이처럼 넥서스는 우주에서의 생활과 생존을 위한 강력한 기지이자, 인류의 우주 식민지화를 위한 중요한 발판으로서의 역할을 수행하게 됩니다.'),
('TXT_KEY_UNIT_FW_NEXUS_STRATEGY','넥서스는 아군 유닛을 치료하는 동시에 전투력을 감소시키고 매 턴 인접한 적 유닛에게 피해를 주는 미래형 지원 유닛입니다. 문명 내에 넥서스를 4개 이상 소유할 수 없습니다.'),
('TXT_KEY_UNIT_FW_NEXUS_HELP','미래 시대의 보조형 유닛으로 우호 유닛의 체력을 매턴 회복시키는 반면, 인접한 적 유닛에 피해를 주고 전투력도 떨어뜨립니다. 기본 10대의 항공기가 탑재가능합니다. 문명당 2개로 제한 됩니다.'),
-- 더미유닛
('TXT_KEY_UNIT_FW_VAULT_RACK','포탑 더미'),
('TXT_KEY_UNIT_FW_VAULT_RACK_TEXT','미사일 전용 타일의 버그로 고육지책으로 만든 유닛입니다.'),
('TXT_KEY_UNIT_FW_VAULT_RACK_STRATEGY','인공환경도시 기술을 개발하면, 미사일격납고를 건설하여 이 유닛에 미사일을 보관할 수 있습니다.'),
('TXT_KEY_UNIT_FW_VAULT_RACK_HELP','미사일은 총 3개 이 유닛에 보관이 되고, 약탈 당하면 그 즉시 유닛은 파괴되나, 시설을 복구하면 자동으로 복구가 됩니다. 매턴 자동으로 휴식 상태를 취합니다.');

--===========================
-- Promotion
--===========================
--------------------------------------
-- Text
-------------------------------
-- NEW COMBAT TYPE

UPDATE Language_ko_KR
SET Text = '헬리콥터, 공중정찰유닛 대항 보너스 (150)'
WHERE Tag = 'TXT_KEY_PROMOTION_ANTI_HELICOPTER';

UPDATE Language_ko_KR
SET Text = '헬리콥터 유닛과 공중정찰유닛 대항 시 [ICON_STRENGTH] 전투력 보너스 [COLOR_POSITIVE_TEXT]+150%[ENDCOLOR]'
WHERE Tag ='TXT_KEY_PROMOTION_ANTI_HELICOPTER_HELP';


INSERT INTO Language_ko_KR (Tag, Text) VALUES
-- 준궤도 강하
('TXT_KEY_PROMOTION_FW_AEROPLEX_DROP','공중 강하'),
('TXT_KEY_PROMOTION_FW_AEROPLEX_DROP_HELP','[COLOR_POSITIVE_TEXT]40 타일 바깥[ENDCOLOR]까지 공중 강하 가능'),
('TXT_KEY_FW_AEROPLEX_DROP_HELP','준궤도 강하'),
-- 유전자강화
('TXT_KEY_PROMOTION_FW_TRANSGENICS','유전자강화'),
('TXT_KEY_PROMOTION_FW_TRANSGENICS_HELP','해양 또는 강 건너 공격 페널티 제거[NEWLINE]강 건너 이동 시 [ICON_MOVES] 이동력 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]만 소모, 습지에서 지형 패널티 무시'),
('TXT_KEY_FW_TRANSGENICS','유전자강화'),
-- 궤도강하
('TXT_KEY_PROMOTION_ORBITAL_DROP','궤도 강하'),
('TXT_KEY_PROMOTION_ORBITAL_DROP_HELP','64 타일 바깥까지 공중 강하 가능'),
-- 포식본능
('TXT_KEY_PROMOTION_FW_PREDATOR','포식 본능'),
('TXT_KEY_PROMOTION_FW_PREDATOR_HELP','[ICON_STRENGTH]전투력 +10%'),
('TXT_KEY_PEDIA_PROMOTION_FW_PREDATOR','[ICON_STRENGTH]전투력 +10%'),
-- 스플레시 데미지
('TXT_KEY_PROMOTION_FW_SPLASH_DAMAGE_1','광역 폭발1'),
('TXT_KEY_PROMOTION_FW_SPLASH_DAMAGE_1_HELP','주변1타일 20,2타일 10,3타일 5의 피해(유닛 기준)'),
('TXT_KEY_PROMOTION_FW_SPLASH_DAMAGE_2','광역 폭발2'),
('TXT_KEY_PROMOTION_FW_SPLASH_DAMAGE_2_HELP','주변1타일 30,2타일 15,3타일 8의 피해(유닛 기준)'),
('TXT_KEY_PROMOTION_FW_SPLASH_DAMAGE_3','광역 폭발3'),
('TXT_KEY_PROMOTION_FW_SPLASH_DAMAGE_3_HELP','주변1타일 40,2타일 20,3타일10의 피해(유닛 기준)'),
('TXT_KEY_PROMOTION_FW_SPLASH_DAMAGE_4','지표면 붕괴1'),
('TXT_KEY_PROMOTION_FW_SPLASH_DAMAGE_4_HELP','주변1타일 40의 추가피해'),
('TXT_KEY_PROMOTION_FW_SPLASH_DAMAGE_5','지표면 붕괴2'),
('TXT_KEY_PROMOTION_FW_SPLASH_DAMAGE_5_HELP','주변1타일 50의 추가피해'),
-- 므네모시네 학습
('TXT_KEY_PROMOTION_MNEMOSYNE_EXPERIENCE','므네모시네 학습'),
('TXT_KEY_PROMOTION_MNEMOSYNE_EXPERIENCE_HELP','승급 속도 +25%'),
-- 소형원자로
('TXT_KEY_PROMOTION_FW_NUCLEAR_SMR','소형원자로'),
('TXT_KEY_PROMOTION_FW_NUCLEAR_SMR_HELP','해당 유닛이 사망 시, 인접한 적 유닛에게 [COLOR_POSITIVE_TEXT]20[ENDCOLOR]의 피해'),
-- 전투 네트워크
('TXT_KEY_PROMOTION_FW_NETWORKED','전투 네트워크'),
('TXT_KEY_PROMOTION_FW_NETWORKED_HELP','우호 유닛과 인접시 [ICON_STRENGTH]전투력 보너스 [COLOR_POSITIVE_TEXT]+15%[ENDCOLOR]'),
('TXT_KEY_PEDIA_PROMOTION_FW_NETWORKED','우호 유닛과 인접시 [ICON_STRENGTH]전투력 [COLOR_POSITIVE_TEXT]+15%[ENDCOLOR]'),
-- 자동수리
('TXT_KEY_PROMOTION_FW_AUTO_REPAIR','자동 수리'),
('TXT_KEY_PROMOTION_FW_AUTO_REPAIR_HELP','우호 영토 내에서, 매턴 체력 추가 [COLOR_GREEN]+10[ENDCOLOR] 회복, [ICON_STRENGTH]전투력  [COLOR_GREEN]+5[ENDCOLOR]'),
('TXT_KEY_PEDIA_PROMOTION_FW_AUTO_REPAIR','우호 영토 내에서, 매턴 체력 추가 [COLOR_GREEN]+10[ENDCOLOR] 회복, [ICON_STRENGTH]전투력  [COLOR_GREEN]+5[ENDCOLOR]'),
-- 지원중계기 주문
('TXT_KEY_PROMOTION_FW_HEALING_CORE','지원중계기 주둔'),
('TXT_KEY_PROMOTION_FW_HEALING_CORE_HELP','로봇 계열 유닛, 해상유닛 매턴 체력 추가 [COLOR_GREEN]+10[ENDCOLOR] 회복'),
('TXT_KEY_PEDIA_PROMOTION_FW_HEALING_CORE','로봇 계열 유닛, 해상유닛 매턴 체력 추가 [COLOR_GREEN]+10[ENDCOLOR] 회복'),
-- 스카이넷 링크
('TXT_KEY_PROMOTION_FW_SKYNET_LINK','스카이넷과 연결'),
('TXT_KEY_PROMOTION_FW_SKYNET_LINK_HELP','[ICON_STRENGTH]전투력 +10%'),
('TXT_KEY_PEDIA_PROMOTION_FW_SKYNET_LINK','[ICON_STRENGTH]전투력 +10%'),
-- 군체
('TXT_KEY_PROMOTION_FW_NANOHIVE_PROMOTION','군체'),
('TXT_KEY_PROMOTION_FW_NANOHIVE_PROMOTION_HELP','2 타일 내의 우호 유닛의 체력 회복 [COLOR_POSITIVE_TEXT]10[ENDCOLOR], 적 유닛에 피해 [COLOR_POSITIVE_TEXT]10[ENDCOLOR]'),
('TXT_KEY_PEDIA_PROMOTION_FW_NANOHIVE_PROMOTION','2 타일 내의 우호 유닛의 체력은 +10 회복, 적 유닛의 피해 -10'),
-- 통솔네트워크
('TXT_KEY_PROMOTION_FW_NEXUS','통솔 네트워크'),
('TXT_KEY_PROMOTION_FW_NEXUS_HELP','2 타일 내의 적 유닛의 전투력 [COLOR_POSITIVE_TEXT]- 20%[ENDCOLOR]'),
('TXT_KEY_PEDIA_PROMOTION_FW_NEXUS','2 타일 내의 적 유닛의 전투력 [COLOR_POSITIVE_TEXT]- 20%[ENDCOLOR]'),
-- 돌연변이
('TXT_KEY_PROMOTION_FW_MUTATION','돌연변이'),
('TXT_KEY_PROMOTION_FW_MUTATION_HELP','[COLOR_CYAN]돌연변이 바이러스 피해[ENDCOLOR]-부상 유닛 공격 시 [ICON_STRENGTH]전투력 [COLOR_POSITIVE_TEXT]+10%[ENDCOLOR]'),
('TXT_KEY_PEDIA_PROMOTION_FW_MUTATION','[COLOR_CYAN]돌연변이 바이러스 피해[ENDCOLOR]-부상 유닛 공격 시 [ICON_STRENGTH]전투력 [COLOR_POSITIVE_TEXT]+10%[ENDCOLOR]'),
-- 유전자개조
('TXT_KEY_PROMOTION_FW_GENGINEERED','유전자개조'),
('TXT_KEY_PROMOTION_FW_GENGINEERED_HELP','유전자개조 승급 선택권을 줍니다.'),
('TXT_KEY_PEDIA_PROMOTION_FW_GENGINEERED','유전자개조 승급 선택권을 줍니다'),
-- 유전자개조: 아드레날린
('TXT_KEY_PROMOTION_FW_ADRENAL_GLANDS','유전자개조-아드레날린 분비 강화'),
('TXT_KEY_PROMOTION_FW_ADRENAL_GLANDS_HELP','험지에서 [ICON_STRENGTH]전투력 보너스 [COLOR_POSITIVE_TEXT]+15%[ENDCOLOR]'),
('TXT_KEY_PEDIA_PROMOTION_FW_ADRENAL_GLANDS','험지에서 [ICON_STRENGTH]전투력 보너스 [COLOR_POSITIVE_TEXT]+15%[ENDCOLOR]'),
-- 유전자개조: 포식본능
('TXT_KEY_PROMOTION_FW_PREDATOR_INSTINCT','유전자개조-포식본능 강화'),
('TXT_KEY_PROMOTION_FW_PREDATOR_INSTINCT_HELP','숲과 정글 지역에서 [ICON_STRENGTH]전투력 보너스 [COLOR_POSITIVE_TEXT]+25%[ENDCOLOR]'),
('TXT_KEY_PEDIA_PROMOTION_FW_PREDATOR_INSTINCT','숲과 정글 지역에서 [ICON_STRENGTH]전투력 보너스 [COLOR_POSITIVE_TEXT]+25%[ENDCOLOR]'),
-- 유전자개조: 반사신경 강화
('TXT_KEY_PROMOTION_FW_ENHANCED_REFLEXES','유전자개조-반사신경 강화'),
('TXT_KEY_PROMOTION_FW_ENHANCED_REFLEXES_HELP','원거리 유닛과 싸울때 [ICON_STRENGTH]전투력 보너스 [COLOR_POSITIVE_TEXT]+25%[ENDCOLOR]'),
-- 유전자개조: 반사신경 강화
('TXT_KEY_PROMOTION_FW_ENHANCED_VISION','유전자개조-시력 강화'),
('TXT_KEY_PROMOTION_FW_ENHANCED_VISION_HELP','시야 [COLOR_POSITIVE_TEXT]+1[ENDCOLOR]'),
-- 유전자개조: 근력 강화
('TXT_KEY_PROMOTION_FW_ENHANCED_MUSCLES','유전자개조-근력 강화'),
('TXT_KEY_PROMOTION_FW_ENHANCED_MUSCLES_HELP','이동력 [COLOR_POSITIVE_TEXT]+1[ENDCOLOR]'),
-- 유전자개조: 시가전
('TXT_KEY_PROMOTION_FW_URBAN_WARFARE','유전자개조-시가전'),
('TXT_KEY_PROMOTION_FW_URBAN_WARFARE_HELP','[COLOR_GREEN]도시 공격시[ENDCOLOR] [ICON_STRENGTH]전투력 보너스 [COLOR_POSITIVE_TEXT]+33%[ENDCOLOR][NEWLINE]도시로부터 받는 피해 [COLOR_POSITIVE_TEXT]-33%[ENDCOLOR]'),
-- 유전자개조: 광형태적 위장
('TXT_KEY_PROMOTION_FW_CHAMELEON','유전자개조-광형태적 위장'),
('TXT_KEY_PROMOTION_FW_CHAMELEON_HELP','적 유닛과 인접할때까지 투명해집니다.'),
('TXT_KEY_PEDIA_PROMOTION_FW_CHAMELEON','적 유닛과 인접할때까지 투명해집니다.'),
-- 바이오모드
('TXT_KEY_PROMOTION_FW_BIOMODS','바이오모드'),
('TXT_KEY_PROMOTION_FW_BIOMODS_HELP','바이오모드 승급 선택권을 줍니다.'),
-- 바이오모드-독성 모드
('TXT_KEY_PROMOTION_FW_TOXIN_MOD','바이오모드-독성 모드'),
('TXT_KEY_PROMOTION_FW_TOXIN_MOD_HELP','해당 유닛이 사망 시, 인접한 적 유닛에게 [COLOR_POSITIVE_TEXT]10[ENDCOLOR]의 피해'),
-- 바이오모드-강화 모드
('TXT_KEY_PROMOTION_FW_BOOST_MOD','바이오모드-강화 모드'),
('TXT_KEY_PROMOTION_FW_BOOST_MOD_HELP','[ICON_STRENGTH]전투력 +10%'),
-- 바이오모드-재생 모드
('TXT_KEY_PROMOTION_FW_BIOREGENERATION_MOD','바이오모드-재생 모드'),
('TXT_KEY_PROMOTION_FW_BIOREGENERATION_MOD_HELP','체력 회복 시 같은 타일 및 인접 타일의 아군 유닛 회복 [COLOR_POSITIVE_TEXT]+5[ENDCOLOR][NEWLINE]적 유닛 처치 시 체력 회복 [COLOR_POSITIVE_TEXT]+10[ENDCOLOR]'),
-- 바이오모드-인공호흡기 모드
('TXT_KEY_PROMOTION_FW_SYNTHETIC_LUNGS_MOD','바이오모드-인공 폐'),
('TXT_KEY_PROMOTION_FW_SYNTHETIC_LUNGS_MOD_HELP','산을 건널 수 있고, 언덕 위에서 이동력 2배'),
-- 바이오모드-약점노출 강화 모드
('TXT_KEY_PROMOTION_FW_VISION_ENHANCEMENT_MOD','바이오모드-약점노출 강화 모드'),
('TXT_KEY_PROMOTION_FW_VISION_ENHANCEMENT_MOD_HELP','부상 유닛 공격 시 전투력 보너스 [COLOR_POSITIVE_TEXT]+15%[ENDCOLOR]'),
-- 바이오모드-반사신경 강화 모드
('TXT_KEY_PROMOTION_FW_REFLEX_MOD','바이오모드-반사신경 강화 모드'),
('TXT_KEY_PROMOTION_FW_REFLEX_MOD_HELP','근접 전투 시 후퇴확률 [COLOR_POSITIVE_TEXT]+20%[ENDCOLOR]'),
-- 바이오모드-방어막 모드
('TXT_KEY_PROMOTION_FW_SHOCK_WAVE_SHIELD_MOD','바이오모드-방어막 모드'),
('TXT_KEY_PROMOTION_FW_SHOCK_WAVE_SHIELD_MOD_HELP','[COLOR_GREEN]유닛이 요새화 하는 동안[ENDCOLOR], 매턴 인접한 적 유닛에 피해 [COLOR_GREEN]10[ENDCOLOR]'),
-- 바이오모드-충격파 모드
('TXT_KEY_PROMOTION_FW_IMPACT_MOD','바이오모드-충격파 모드'),
('TXT_KEY_PROMOTION_FW_IMPACT_MOD_HELP','[COLOR_GREEN]유닛이 이동[ENDCOLOR] 할때마다 인접한 새 적 유닛에게 피해  [COLOR_GREEN]5[ENDCOLOR]'),
-- 뛰어난 외교술
('TXT_KEY_PROMOTION_AUGMENTED','뛰어난 외교술'),
('TXT_KEY_PROMOTION_AUGMENTED_HELP','외교 임무 수행 시 [ICON_INFLUENCE]영향력 [COLOR_POSITIVE_TEXT]105[ENDCOLOR]'),
-- 준궤도 폭격
('TXT_KEY_PROMOTION_SUBORBITAL_EVASION','준궤도 폭격'),
('TXT_KEY_PROMOTION_SUBORBITAL_EVASION_HELP','요격을 회피할 확률 [COLOR_POSITIVE_TEXT]40%[ENDCOLOR]'),
-- 플라즈막 폭격
('TXT_KEY_PROMOTION_PLASMA_EVASION','플라즈마 폭격'),
('TXT_KEY_PROMOTION_PLASMA_EVASION_HELP','플라즈마 엔진 출력으로 요격을 회피할 확률 [COLOR_POSITIVE_TEXT]50%[ENDCOLOR]'),
-- 우주궤도 폭격
('TXT_KEY_PROMOTION_SPACE_EVASION','우주궤도 폭격'),
('TXT_KEY_PROMOTION_SPACE_EVASION_HELP','지구탈출속도의 요격을 회피할 확률 [COLOR_POSITIVE_TEXT]60%[ENDCOLOR]'),
-- 향상된 전략
('TXT_KEY_FW_PROMOTION_ADVANCED_TACTICS', '향상된 전략'),
('TXT_KEY_FW_PROMOTION_ADVANCED_TACTICS_HELP', '위대한 장군과 위대한 제독의 [ICON_MOVES] 이동력 [COLOR_POSITIVE_TEXT]+1[ENDCOLOR], 시야 [COLOR_POSITIVE_TEXT]+1[ENDCOLOR], [COLOR_POSITIVE_TEXT]ZOC[ENDCOLOR] 무시'),
-- 노동자 임플란트
('TXT_KEY_FW_PROMOTION_IMPLANTS_WORKER', '노동자 임플란트'),
('TXT_KEY_FW_PROMOTION_IMPLANTS_WORKER_HELP', '노동자와 위인의 [ICON_MOVES] 이동력 [COLOR_POSITIVE_TEXT]+3[ENDCOLOR], 시야 [COLOR_POSITIVE_TEXT]+1[ENDCOLOR]'),
-- 우월종
('TXT_KEY_FW_PROMOTION_MASTER_RACE', '우월종'),
('TXT_KEY_FW_PROMOTION_MASTER_RACE_HELP', '[COLOR_POSITIVE_TEXT]화약 유닛과 전투 시[ENDCOLOR] [ICON_STRENGTH] 전투력 보너스 [COLOR_POSITIVE_TEXT]+30%[ENDCOLOR][NEWLINE][COLOR_NEGATIVE_TEXT]우호적인 유닛[ENDCOLOR] 인접 시 [ICON_STRENGTH] 전투력 [COLOR_NEGATIVE_TEXT] -15% [ENDCOLOR]'),
-- 에이펙스 침입자
('TXT_KEY_PROMOTION_FW_APEXPREDATOR', '에이펙스 침입자'),
('TXT_KEY_PROMOTION_FW_APEXPREDATOR_HELP', '[COLOR_GREEN]평지[ENDCOLOR]에서 전투 시 [ICON_STRENGTH]전투력 보너스 [COLOR_POSITIVE_TEXT]+25%[ENDCOLOR][NEWLINE][COLOR_GREEN]부상당한 유닛[ENDCOLOR]과 전투 시 [ICON_STRENGTH]전투력 보너스 [COLOR_POSITIVE_TEXT] +10%[ENDCOLOR]'),
-- 우주선
('TXT_KEY_PROMOTION_FW_SPACESHIP', '우주선'),
('TXT_KEY_PROMOTION_FW_SPACESHIP_HELP', '전투기, 폭격기 유닛 [ICON_STRENGTH]전투력 [COLOR_POSITIVE_TEXT]+15%[ENDCOLOR]'),
-- 우주전문가
('TXT_KEY_PROMOTION_FW_SPACESPECIALIST', '우주전문가'),
('TXT_KEY_PROMOTION_FW_SPACESPECIALIST_HELP', '[ICON_STRENGTH]전투력 +10%'),
-- 임플란트
('TXT_KEY_PROMOTION_FW_IMPLANTS', '임플란트'),
('TXT_KEY_PROMOTION_FW_IMPLANTS_HELP', '[ICON_STRENGTH]전투력 +10%'),
-- 신경독주입
('TXT_KEY_PROMOTION_FW_UNIT_SWARM_0',       '신경독주입'),
('TXT_KEY_PROMOTION_FW_UNIT_SWARM_1',       '신경독마비'),
('TXT_KEY_PROMOTION_FW_UNIT_SWARM_0_HELP',  '[COLOR_GREEN]공격해서 상대방에 표시[ENDCOLOR]를 남기고, 표시된 유닛은 [ICON_MOVES]이동력이 줄고, 최대 체력이 [COLOR_RED]20까지[ENDCOLOR] 떨어지고 [COLOR_GREEN]3턴 동안[ENDCOLOR] [COLOR_RED]10만큼만[ENDCOLOR] 회복합니다.'),
('TXT_KEY_PROMOTION_FW_UNIT_SWARM_1_HELP',  '유닛이 [COLOR_GREEN]신경독에 공격당해서[ENDCOLOR] [ICON_MOVES]이동력이 줄고, 최대 체력이 [COLOR_RED]20까지[ENDCOLOR] 떨어지고 [COLOR_GREEN]3턴 동안[ENDCOLOR] [COLOR_RED]10만큼만[ENDCOLOR] 회복합니다.'),
-- 앤젤넷의 가호
('TXT_KEY_PROMOTION_FW_ANGELNET', '엔젤넷의 가호'),
('TXT_KEY_PROMOTION_FW_ANGELNET_HELP', '[COLOR_CYAN]엔젤넷이 있는 도시[ENDCOLOR]의 4 타일 내에서 싸울때 [ICON_STRENGTH]전투력 보너스 [COLOR_POSITIVE_TEXT]+25%[ENDCOLOR]');

