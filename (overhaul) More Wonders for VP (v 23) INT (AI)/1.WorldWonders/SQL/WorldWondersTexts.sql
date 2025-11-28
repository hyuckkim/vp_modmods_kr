----------------------------------------------------
-- 모든 불가사의 텍스트 파일
-- 2020년 2월 20일: 생성, adan_eslavo
----------------------------------------------------
-- 알타미라 동굴
INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_ALTAMIRA',			'알타미라 동굴'),
			('TXT_KEY_WONDER_ALTAMIRA_QUOTE',		'[NEWLINE]"알타미라 이후의 모든 것은 퇴폐적으로 보인다."[NEWLINE] - 파블로 피카소[NEWLINE]'),
			('TXT_KEY_WONDER_ALTAMIRA_PEDIA',		'알타미라 동굴은 길이가 약 1,000m(3,280.84피트)이며, 여러 개의 구불구불한 통로와 방으로 이루어져 있습니다. 주 통로의 높이는 2미터에서 6미터 사이입니다. 이 동굴은 비스피에레스 산의 석회암 암석에서 초기 카르스트 현상에 따른 붕괴로 형성되었습니다. 동굴 바닥의 고고학적 발굴을 통해 후기 솔류트레 문화(약 18,500년 전)와 초기 마들렌 문화(약 16,590년에서 14,000년 전 사이)의 풍부한 유물 퇴적층이 발견되었습니다. 두 시기 모두 구석기 시대에 속합니다. 이 두 점유 기간 사이의 2천 년 동안 동굴에는 야생 동물만이 서식했던 것으로 보입니다. 이곳의 인간 거주자들은 주변 산의 계곡에서 풀을 뜯는 풍부한 야생 동물과 인근 해안 지역에서 구할 수 있는 해양 생물을 활용하기에 좋은 위치에 있었습니다. 약 13,000년 전, 낙석이 동굴 입구를 막아 그 내용물이 보존되었고, 근처 나무가 쓰러져 떨어진 바위를 건드리면서 결국 발견되었습니다. 인간의 거주는 동굴 입구에 국한되었지만, 그림은 동굴 전체에 걸쳐 그려졌습니다. 예술가들은 목탄과 황토 또는 적철광을 사용하여 이미지를 만들었으며, 종종 이 안료들을 희석하여 명암의 변화를 주고 명암대조법의 인상을 만들어냈습니다. 그들은 또한 피사체에 3차원 효과를 주기 위해 동굴 벽의 자연스러운 윤곽을 활용했습니다. 다색 천장화는 동굴의 가장 인상적인 특징으로, 멸종된 스텝 들소(Bison priscus) 무리가 다양한 자세를 취하고 있는 모습, 말 두 마리, 큰 암사슴, 그리고 아마도 멧돼지를 묘사하고 있습니다. 마들렌 문화 시기로 추정되는 이 그림들에는 동물 주제 외에 추상적인 형태도 포함되어 있습니다. 솔류트레 문화의 그림에는 말과 염소의 이미지뿐만 아니라, 예술가들이 동굴 벽에 손을 대고 그 위에 안료를 불어 음각 이미지를 남긴 손도장이 포함됩니다. 스페인 북부의 수많은 다른 동굴에도 구석기 시대 예술이 포함되어 있지만, 알타미라만큼 복잡하거나 풍부하지는 않습니다.'),
			('TXT_KEY_WONDER_ALTAMIRA_HELP',		'[ICON_GREAT_WORK] 위대한 예술품 또는 유물 슬롯 1개를 포함합니다. [COLOR_CYAN]고고학[ENDCOLOR] 발견 시 [ICON_CULTURE] 문화 +3.[NEWLINE][NEWLINE]인접한 [ICON_RES_BISON] 들소: [ICON_FOOD] 식량 +1 및 [ICON_CULTURE] 문화 +1.[NEWLINE]인접한 [ICON_RES_DEER] 사슴: [ICON_FOOD] 식량 +1 및 [ICON_CULTURE] 문화 +1.[NEWLINE]인접한 [ICON_RES_HORSE] 말: [ICON_FOOD] 식량 +1 및 [ICON_CULTURE] 문화 +1.');

UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]알타미라 동굴[ENDCOLOR]은 초기 문화 생성을 크게 지원하며(+1[ICON_CULTURE]), 특히 인근에 [COLOR_GREY]들소[ENDCOLOR], [COLOR_GREY]사슴[ENDCOLOR] 또는 [COLOR_GREY]말[ENDCOLOR](+1[ICON_FOOD], +1[ICON_CULTURE]/[ICON_RES_BISON], [ICON_RES_DEER], [ICON_RES_HORSE])이 있을 경우 더욱 그렇습니다. 비어있는 예술품 슬롯을 채우거나(+1[ICON_GREAT_WORK]) 고급 기술([COLOR_CYAN]고고학[ENDCOLOR]: +3[ICON_CULTURE])을 서둘러 연구하여 효과를 극대화하십시오.'
WHERE Tag = 'TXT_KEY_WONDER_ALTAMIRA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_ALTAMIRA_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_ALTAMIRA_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]산[ENDCOLOR]; 개선된 자원: [ICON_RES_BISON] [COLOR_CYAN]들소[ENDCOLOR]/[ICON_RES_DEER] [COLOR_CYAN]사슴[ENDCOLOR]/[ICON_RES_HORSE] [COLOR_CYAN]말[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ALTAMIRA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '개선된 자원: [ICON_RES_BISON] [COLOR_CYAN]들소[ENDCOLOR]/[ICON_RES_DEER] [COLOR_CYAN]사슴[ENDCOLOR]/[ICON_RES_HORSE] [COLOR_CYAN]말[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ALTAMIRA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Ggantija
INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_GGANTIJA',			'잔티야'),
			('TXT_KEY_WONDER_GGANTIJA_QUOTE',		'[NEWLINE]"우리는 신을 찾아야 하며, 신은 소음과 불안 속에서는 찾을 수 없습니다. 신은 침묵의 친구입니다. 자연을 보십시오 - 나무, 꽃, 풀이 어떻게 침묵 속에서 자라는지; 별, 달, 해가 어떻게 침묵 속에서 움직이는지... 우리는 영혼을 만지기 위해 침묵이 필요합니다."[NEWLINE] - 테레사 수녀[NEWLINE]'),
			('TXT_KEY_WONDER_GGANTIJA_PEDIA',		'잔티야(거인의 탑)는 지중해 고조 섬에 있는 몰타의 거석 사원 단지입니다. 건축가들은 신석기 시대(기원전 약 3600-2500년)에 두 개의 잔티야 사원을 세웠으며, 이로 인해 이 건물들은 5500년 이상 되었고 괴베클리 테페에 이어 세계에서 두 번째로 오래된 인공 종교 건축물이 되었습니다. 이 사원들은 풍요 숭배의 장소였을 가능성이 있으며, 고고학자들은 현장에서 발견된 수많은 조각상과 상들이 그 숭배와 관련이 있다고 믿고 있습니다.'),
			('TXT_KEY_WONDER_GGANTIJA_HELP',		'건설 후 [ICON_FOOD] 식량 50을 부여합니다. 이 도시에서 생산된 [ICON_PEACE] 신앙의 10%를 [ICON_FOOD] 식량으로 전환합니다. 제국의 모든 농장에 [ICON_FOOD] 식량 +1을 제공합니다.');

UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]잔티야[ENDCOLOR]는 건설 직후 제국의 성장을 촉진하고(50[ICON_FOOD]) 모든 [COLOR_CITY_BROWN]농장[ENDCOLOR]을 업그레이드합니다(+1[ICON_FOOD]/[ICON_WORKER][ICON_WORKER]). 도시 발전을 더욱 가속화하려면 종교에 완전히 집중해야 합니다(10%[ICON_PEACE]를 [ICON_FOOD]으로 전환).'
WHERE Tag = 'TXT_KEY_WONDER_GGANTIJA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_GGANTIJA_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_GGANTIJA_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]초원[ENDCOLOR]; 시설: [COLOR_CYAN]농장 2개[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GGANTIJA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]초원[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GGANTIJA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------				
-- Goebekli Tepe	
INSERT INTO Language_ko_KR 
			(Tag,										Text) 
VALUES		('TXT_KEY_BUILDING_GOEBEKLI_TEPE',			'괴베클리 테페'),
			('TXT_KEY_WONDER_GOEBEKLI_TEPE_QUOTE',		'[NEWLINE]"발밑을 보지 말고 별을 올려다보세요. 보이는 것을 이해하려고 노력하고, 우주가 존재하는 이유에 대해 궁금해하세요. 호기심을 가지세요."[NEWLINE] - 스티븐 호킹[NEWLINE]'),
			('TXT_KEY_WONDER_GOEBEKLI_TEPE_PEDIA',		'괴베클리 테페는 시리아 국경 근처 터키 남부에 위치한 종교 유적지입니다. 인류 문명의 신석기 시대인 기원전 약 10000년으로 거슬러 올라가는 지구상에서 가장 오래된 것으로 알려진 종교 건물이며, 모든 주요 문명과 도시보다 수천 년 앞서 있습니다. 1960년대에 처음 관찰되었는데, 고고학자들은 언덕의 모양 때문에 자연적일 수 없다고 생각했지만 비잔틴 시대의 묘지로 치부했습니다. 이 믿음은 1994년까지 지속되었고, 1년 후에야 발굴되었습니다. 이 단지는 둥근 모양과 거대한 단일 암석으로 스톤헨지와 형태가 유사합니다. 그러나 스톤헨지와 달리 많은 기둥에는 여러 동물의 형상이 새겨져 있으며, 이는 괴베클리 테페를 건설한 수렵 채집인들에게 신성시되었던 것으로 여겨집니다.'),
			('TXT_KEY_WONDER_GOEBEKLI_TEPE_HELP',		'이 도시가 점유한 산에서 [ICON_RESEARCH] 과학 +1 및 [ICON_PEACE] 신앙 +1.[NEWLINE][NEWLINE]모든 [ICON_RES_STONE] 석재: [ICON_RESEARCH] 과학 +1.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]괴베클리 테페[ENDCOLOR]는 [COLOR_CITY_BLUE]산[ENDCOLOR](+1[ICON_RESEARCH], +1[ICON_PEACE]/[ICON_FLOWER] 도시)으로 가득 찬 지역에 훌륭한 불가사의로, 중요한 초기 산출량을 증가시킵니다(+1[ICON_RESEARCH]; +1[ICON_CULTURE]; +1[ICON_PEACE]). 찾을 수 있는 모든 [COLOR_GREY]석재[ENDCOLOR](+1[ICON_RESEARCH]/[ICON_RES_STONE][ICON_RES_STONE]) 매장지를 확보하십시오.'
WHERE Tag = 'TXT_KEY_WONDER_GOEBEKLI_TEPE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_GOEBEKLI_TEPE_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_GOEBEKLI_TEPE_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]산[ENDCOLOR]; 특성: [COLOR_NEGATIVE_TEXT]물[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GOEBEKLI_TEPE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]사막[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GOEBEKLI_TEPE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------				
-- Kuk Swamp
INSERT INTO Language_ko_KR 
			(Tag,							Text) 
VALUES		('TXT_KEY_BUILDING_KUK',		'쿠크 습지'),
			('TXT_KEY_WONDER_KUK_QUOTE',	'[NEWLINE]"완벽이 정체라면, 천국은 늪이다."[NEWLINE] - 리처드 바크[NEWLINE]'),
			('TXT_KEY_WONDER_KUK_PEDIA',	'작성 필요'),
			('TXT_KEY_WONDER_KUK_HELP',		'새로운 [ICON_CITIZEN] 시민이 태어난 후 [ICON_FOOD] 식량 10%가 이월됩니다. 제국 내 점유된 습지에서 [ICON_PRODUCTION] 생산력 +1 및 [ICON_RESEARCH] 과학 +1. [COLOR_CYAN]증기력[ENDCOLOR] 발견 시 이 도시에서 [ICON_PRODUCTION] 생산력 +5, 다른 모든 도시에서 [ICON_PRODUCTION] 생산력 +2.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]쿠크 습지[ENDCOLOR]는 독특한 농업 기술 덕분에 [COLOR_CITY_GREEN]습지[ENDCOLOR](+1[ICON_PRODUCTION], +1[ICON_RESEARCH]/[ICON_MUSHROOM][ICON_MUSHROOM])를 비옥한 토양으로 바꿉니다. 그 힘을 사용하여 거대 도시의 발전을 더욱 가속화하십시오(+10%[ICON_FOOD]/새 [ICON_CITIZEN]; [COLOR_CYAN]증기력[ENDCOLOR]: +3[ICON_PRODUCTION], +2[ICON_PRODUCTION][ICON_PRODUCTION]).'
WHERE Tag = 'TXT_KEY_WONDER_KUK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_KUK_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_KUK_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_NEGATIVE_TEXT]설원[ENDCOLOR]; 특성: [COLOR_CYAN]정글, 습지[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_KUK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특성: [COLOR_CYAN]습지[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_KUK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Majorville Medicine Wheel
INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_MAJORVILLE',			'메이저빌 메디신 휠'),
			('TXT_KEY_WONDER_MAJORVILLE_QUOTE',		'[NEWLINE]"지구가 병들면 동물들이 사라지기 시작할 것이고, 그때가 되면 무지개의 전사들이 그들을 구하러 올 것이다."[NEWLINE] - 시애틀 추장[NEWLINE]'),
			('TXT_KEY_WONDER_MAJORVILLE_PEDIA',		'메이저빌 메디신 휠은 기원전 3200년으로 거슬러 올라가는 블랙핏 부족의 고고학 유적지입니다. 28개의 돌살로 조약돌 원과 연결된 둥근 돌무덤입니다. 전통적으로 특정 아메리카 원주민 문화에서 메디신 휠은 다양한 영적 개념의 은유입니다. 그러나 메이저빌 메디신 휠은 여러 세대에 걸쳐 개선된 것으로 여겨지므로, 휠의 정확한 의미는 각 세대마다 다를 수 있습니다. 유적지에서 발견된 봉헌물에는 스위트그래스, 버드나무, 천, 담배, 그리고 이니스킴 돌("들소 부르는 돌")이 포함되었습니다.'),
			('TXT_KEY_WONDER_MAJORVILLE_HELP',		'이 도시가 점유한 툰드라 타일에서 [ICON_PEACE] 신앙 +1. 제국의 모든 야영지에서 [ICON_FOOD] 식량 +1.[NEWLINE][NEWLINE]모든 [ICON_RES_BISON] 들소: [ICON_CULTURE] 문화 +1.');
			
UPDATE Language_ko_KR
SET Text = '이 [COLOR_YIELD_FOOD]메디신 휠[ENDCOLOR]은 [COLOR_CITY_BLUE]툰드라[ENDCOLOR](+1[ICON_PEACE]/[ICON_FLOWER]) 개발을 강력하게 지원합니다. 성장을 늘리기 위해 가능한 한 많은 [COLOR_CITY_BROWN]야영지[ENDCOLOR](+1[ICON_FOOD]/[ICON_WORKER][ICON_WORKER])를 건설하고, 문화 산출량을 높이기 위해 모든 [COLOR_GREY]들소[ENDCOLOR](+1[ICON_CULTURE]/[ICON_RES_BISON][ICON_RES_BISON])를 확보해야 합니다.'
WHERE Tag = 'TXT_KEY_WONDER_MAJORVILLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_MAJORVILLE_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_MAJORVILLE_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]툰드라[ENDCOLOR]; 부지: [COLOR_CYAN]언덕[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MAJORVILLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]툰드라[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MAJORVILLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Mohenjo-daro
INSERT INTO Language_ko_KR 
			(Tag,										Text) 
VALUES		('TXT_KEY_BUILDING_MOHENJO_DARO',			'모헨조다로'),
			('TXT_KEY_WONDER_MOHENJO_DARO_QUOTE',		'[NEWLINE]"강은 사막의 바다다."[NEWLINE] - 마트쇼나 들리와요[NEWLINE]'),
			('TXT_KEY_WONDER_MOHENJO_DARO_PEDIA',		'기원전 2500년경에 건설된 모헨조다로는 하라파 문명의 가장 큰 정착지 중 하나였으며, 인도 북부와 파키스탄에 걸쳐 번성했던 문화의 중심지였습니다. 이집트인들이 파라오를 위해 피라미드를 짓고 미노아인들이 황소 위를 뛰어넘는 스포츠를 즐기는 동안, 모헨조다로의 약 4만 명의 시민들은 구운 벽돌과 모르타르로 인상적인 구조물을 짓고 있었습니다: 공중목욕탕, 공공 우물이 있는 중앙 시장, 넓은 주택, 거대한 곡물 창고(곡물을 말리기 위한 공기 덕트 포함), 집회를 위한 "기둥 홀", 그리고 "대학 홀"(사제들의 거주지로 추정되는 78개의 방). 모헨조다로는 당시 가장 발전된 도시였으며, 놀랍도록 정교한 토목 공학과 도시 계획을 갖추고 있었습니다. 기원전 1900년경 하라파 문명이 갑작스럽고 아직 설명되지 않은(역사학자들은 많은 이론을 가지고 있지만) 쇠퇴기에 접어들면서 모헨조다로는 점차 버려졌고, 1920년에 다시 발견될 때까지 잊혀졌습니다. (시드 마이어의 문명 6에서 각색)'),
			('TXT_KEY_WONDER_MOHENJO_DARO_HELP',		'이 도시가 점유한 강 타일에서 [ICON_FOOD] 식량 +1.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]모헨조다로[ENDCOLOR]는 지역 생산을 크게 지원하고(+1[ICON_PRODUCTION]/4 [ICON_CITIZEN]), 지역 [COLOR_CITY_GREEN]강[ENDCOLOR](+1[ICON_FOOD]/[ICON_MUSHROOM])의 잠재력을 높이며, 지역의 문화와 종교를 확장합니다(+2[ICON_CULTURE]; +1[ICON_PEACE]).'
WHERE Tag = 'TXT_KEY_WONDER_MOHENJO_DARO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_MOHENJO_DARO_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_MOHENJO_DARO_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]사막[ENDCOLOR], [COLOR_NEGATIVE_TEXT]해안[ENDCOLOR]; 특성: [COLOR_CYAN]강[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MOHENJO_DARO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '특성: [COLOR_CYAN]강[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MOHENJO_DARO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Skara Brae
INSERT INTO Language_ko_KR 
			(Tag, Text)
VALUES		('TXT_KEY_BUILDING_SKARA_BRAE',			'스캐러 브레이'),
			('TXT_KEY_WONDER_SKARA_BRAE_QUOTE',		'[NEWLINE]"위대한 것은 갑자기 창조되지 않는다."[NEWLINE] - 에픽테토스[NEWLINE]'),
			('TXT_KEY_WONDER_SKARA_BRAE_PEDIA',		'스캐러 브레이는 스코틀랜드 오크니 군도에서 가장 큰 섬인 메인랜드의 서해안 스카일 만에 위치한 석조 신석기 시대 정착지입니다. 8개의 밀집된 주택으로 구성되어 있으며, 기원전 약 3180년부터 2500년까지 거주했습니다.[NEWLINE][NEWLINE]주택 수를 고려할 때, 어느 시점에서든 스캐러 브레이에 50명 이상이 살지는 않았을 것으로 보입니다. 마을이 세워지기 얼마 전에 스코틀랜드 북부에서 나타난 독특한 스타일의 도자기인 홈이 파인 그릇을 만들고 사용하는 사람들 외에, 그들은 주로 소와 양을 기르는 목축민이었습니다.'),
			('TXT_KEY_WONDER_SKARA_BRAE_HELP',		'제국의 모든 마을에서 [ICON_PRODUCTION] 생산력 +1 및 [ICON_GOLD] 골드 +1.[NEWLINE][NEWLINE]모든 [ICON_RES_COW] 소: [ICON_FOOD] 식량 +1.[NEWLINE]모든 [ICON_RES_FISH] 물고기: [ICON_FOOD] 식량 +1.[NEWLINE]모든 [ICON_RES_SHEEP] 양: [ICON_FOOD] 식량 +1.[NEWLINE]모든 [ICON_RES_WHEAT] 밀: [ICON_FOOD] 식량 +1.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]스캐러 브레이[ENDCOLOR]는 기본 자원이 개선된 모든 도시에 주요 개발 부스트를 제공합니다(+1[ICON_FOOD]/[ICON_RES_COW][ICON_RES_COW], [ICON_RES_SHEEP][ICON_RES_SHEEP], [ICON_RES_FISH][ICON_RES_FISH], [ICON_RES_MAIZE][ICON_RES_MAIZE], [ICON_RES_RICE][ICON_RES_RICE], [ICON_RES_WHEAT][ICON_RES_WHEAT]). 중세 시대부터는 표준 마을보다 훨씬 더 잠재력이 큰 업그레이드된 [COLOR_CITY_BROWN]마을[ENDCOLOR](+1[ICON_PRODUCTION], +1[ICON_GOLD]/[ICON_WORKER][ICON_WORKER])을 많이 만들어야 합니다.'
WHERE Tag = 'TXT_KEY_WONDER_SKARA_BRAE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_SKARA_BRAE_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_SKARA_BRAE_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 부지: [COLOR_CYAN]평지[ENDCOLOR]; 개선된 자원: [ICON_RES_COW] [COLOR_CYAN]소[ENDCOLOR]/[ICON_RES_FISH] [COLOR_CYAN]물고기[ENDCOLOR]/[ICON_RES_SHEEP] [COLOR_CYAN]양[ENDCOLOR]/[ICON_RES_WHEAT] [COLOR_CYAN]옥수수[ENDCOLOR]/[ICON_RES_WHEAT] [COLOR_CYAN]쌀[ENDCOLOR]/[ICON_RES_WHEAT] [COLOR_CYAN]밀[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SKARA_BRAE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '개선된 자원: [ICON_RES_COW] [COLOR_CYAN]소[ENDCOLOR]/[ICON_RES_FISH] [COLOR_CYAN]물고기[ENDCOLOR]/[ICON_RES_SHEEP] [COLOR_CYAN]양[ENDCOLOR]/[ICON_RES_WHEAT] [COLOR_CYAN]밀[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SKARA_BRAE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
----------------------------------------------------
-- Karnak
INSERT INTO Language_ko_KR 
			(Tag,								Text) 
VALUES		('TXT_KEY_BUILDING_KARNAK',			'카르나크 신전'),
			('TXT_KEY_WONDER_KARNAK_QUOTE',		'[NEWLINE]"나는 나일강의 카르나크 신전에 앉아 있었고, 해가 지고 있었으며, 나 혼자였다. 거대한 다주식 홀은 과거의 그림자와 유령으로 가득 차 있었다... 그리고 만약 당신이 그것을 믿는다면, 당신은 무엇이든 믿을 것이다."[NEWLINE] - 윌버 A. 스미스[NEWLINE]'),
			('TXT_KEY_WONDER_KARNAK_PEDIA',		'카르나크는 테베(현재의 룩소르)에 위치한 거대한 사원 단지입니다. 람세스 2세의 통치 기간에 이집트 판테온의 한 신에만 집중하는 대신 여러 다른 신과 여신을 숭배하는 장소로 건설되었습니다.[NEWLINE][NEWLINE]  이 단지는 광대한 야외 박물관이며, 세계에서 두 번째로 큰 고대 종교 유적지입니다(캄보디아의 앙코르 와트 다음). 이집트에서 두 번째로 많이 방문하는 역사 유적지로 여겨지며, 카이로 근처의 기자 피라미드만이 더 많은 방문객을 받습니다.[NEWLINE][NEWLINE]  카르나크의 유명한 측면 중 하나는 아문-레 구역의 다주식 홀로, 50,000 평방피트(5,000 평방미터)의 홀 공간에 16열로 배열된 134개의 거대한 기둥이 있습니다. 이 기둥 중 122개는 높이가 10미터이고, 나머지 12개는 높이가 21미터이며 지름이 3미터가 넘습니다.'),
			('TXT_KEY_WONDER_KARNAK_HELP',		'이 도시가 건설된 도시에 [COLOR_POSITIVE_TEXT]무료[ENDCOLOR] 기념비를 제공하고 제국의 모든 기념비는 [ICON_CULTURE] 문화 +1을 받습니다. 이 도시가 점유한 각 오아시스와 2개의 범람원에서 [ICON_PRODUCTION] 생산력 +1 및 [ICON_PEACE] 신앙 +1. [COLOR_CYAN]고고학[ENDCOLOR] 발견 시 [ICON_TOURISM] 관광 +4.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]카르나크[ENDCOLOR] 신전은 희귀한 [COLOR_CITY_GREEN]오아시스[ENDCOLOR](+1[ICON_PRODUCTION], +1[ICON_PEACE]/[ICON_MUSHROOM])와 [COLOR_CITY_GREEN]범람원[ENDCOLOR](+1[ICON_PRODUCTION], +1[ICON_PEACE]/2 [ICON_MUSHROOM] 도시)을 매우 생산적인 신성한 장소로 바꿉니다. 문화적 발전을 가속화하기 위해 다른 모든 도시에 [COLOR_YIELD_FOOD]기념비[ENDCOLOR]([ICON_CULTURE]; [ICON_MOVES]; +1[ICON_CULTURE])를 건설하는 것을 잊지 마십시오.'
WHERE Tag = 'TXT_KEY_WONDER_KARNAK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_KARNAK_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_KARNAK_HELP';
				
UPDATE Language_ko_KR SET Text = '부지: [COLOR_CYAN]평지[ENDCOLOR]; 특성: [COLOR_CYAN]범람원[ENDCOLOR]/[COLOR_CYAN]오아시스[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_KARNAK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '특성: [COLOR_CYAN]범람원[ENDCOLOR]/[COLOR_CYAN]오아시스[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_KARNAK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Nazca Lines
INSERT INTO Language_ko_KR 
			(Tag,								Text) 
VALUES		('TXT_KEY_BUILDING_NAZCA',			'나스카 라인'),
			('TXT_KEY_WONDER_NAZCA_QUOTE',		'[NEWLINE]"세상의 진정한 미스터리는 보이지 않는 것이 아니라 보이는 것이다."[NEWLINE] - 오스카 와일드[NEWLINE]'),
			('TXT_KEY_WONDER_NAZCA_PEDIA',		'페루의 나스카와 팔파 마을 사이에 위치한 나스카 라인은 80킬로미터 이상에 걸쳐 있는 거대한 고원에 디자인된 일련의 거대한 지상화입니다. 이 디자인은 오랫동안 그것을 본 사람들에게 미스터리의 원천이었습니다. 이 라인은 기원후 450년에서 600년 사이에 나스카 문화에 의해 건설된 것으로 추정됩니다. 디자인의 복잡성 수준은 디자인마다 다릅니다. 일부는 수백 미터 길이의 단순한 선인 반면, 다른 일부는 원숭이, 콘도르, 거미, 범고래 등 다양한 동물 디자인을 닮은 믿을 수 없을 정도로 복잡한 패턴입니다.[NEWLINE][NEWLINE]  나스카 라인은 외계 생명체의 존재를 믿는 사람들 사이에서 특히 인기가 있으며, 나스카 문화가 그들을 신으로 착각했다고 믿습니다. 그들은 더 단순하고 직선적인 선이 사실 외계인들이 착륙하는 데 사용한 성간 우주선의 착륙대이며, 패턴에 표현된 인간형 형상이 외계인 중 하나라고 믿습니다. 현대 과학은 다양한 이론을 제시했는데, 그중에는 이 선들이 초기 형태의 천문대/천문 달력으로서 스톤헨지와 유사한 목적을 수행했다는 이론이 있습니다. 다른 이론으로는 기하학적 선이 물의 흐름, 관개 계획을 나타내거나 물을 "소환"하는 의식의 일부일 수 있다는 것이 있습니다. 그러나 오늘날까지 이 선들의 정확한 목적은 미스터리로 남아 있습니다.'),
			('TXT_KEY_WONDER_NAZCA_HELP',		'인접한 평원에서 [ICON_FOOD] 식량 +2, 인접한 언덕에서 [ICON_PEACE] 신앙 +1, 이 도시가 점유한 야영지에서 [ICON_RESEARCH] 과학 +1. [COLOR_CYAN]비행[ENDCOLOR] 기술 발견 시 [ICON_RESEARCH] 과학 +4 및 [ICON_TOURISM] 관광 +2.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]나스카 라인[ENDCOLOR]은 항공 정찰로만 완전히 발견되는 놀라운 과학적 비밀을 숨기고 있습니다([COLOR_CYAN]비행[ENDCOLOR]: +4[ICON_RESEARCH], +2[ICON_TOURISM]). 지역 [COLOR_CITY_BLUE]평원[ENDCOLOR](+2[ICON_FOOD]/[ICON_FLOWER])과 [COLOR_CITY_BLUE]언덕[ENDCOLOR](+1[ICON_PEACE]/[ICON_FLOWER])을 차지하여 성장과 종교를 증진하거나, [COLOR_CITY_BROWN]야영지[ENDCOLOR](+1[ICON_RESEARCH]/[ICON_WORKER])를 건설하여 과학을 증진하십시오.'
WHERE Tag = 'TXT_KEY_WONDER_NAZCA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_NAZCA_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_NAZCA_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]평원[ENDCOLOR]; 특성: [COLOR_NEGATIVE_TEXT]물[ENDCOLOR]; 부지: [COLOR_CYAN]언덕[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_NAZCA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]평원[ENDCOLOR]; 부지: [COLOR_CYAN]언덕[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_NAZCA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Wieliczka
INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_WIELICZKA',			'비엘리치카 소금 광산'),
			('TXT_KEY_WONDER_WIELICZKA_QUOTE',		'[NEWLINE]"너희는 세상의 소금이다. 그러나 소금은 함께 있을 때 유용하지만, 홀로 있을 때는 쓸모없다는 것을 기억하라."[NEWLINE] - 이스라엘모어 아이보르[NEWLINE]'),
			('TXT_KEY_WONDER_WIELICZKA_PEDIA',		'폴란드 남부 크라쿠프 대도시권 내 비엘리치카 마을에 있는 비엘리치카 소금 광산은 신석기 시대부터 솟아나는 소금물에서 염화나트륨(식염)을 생산해 왔습니다. 13세기에 발굴된 비엘리치카 소금 광산은 2007년까지 지속적으로 식염을 생산했으며, 세계에서 가장 오래 운영된 소금 광산 중 하나입니다.'),
			('TXT_KEY_WONDER_WIELICZKA_HELP',		'가능하다면 도시 범위 내에 2개의 새로운 [ICON_RES_SALT] 소금 자원을 배치합니다. 모든 도시의 [ICON_FOOD] 식량 +5%. 이 도시가 점유한 광산에서 [ICON_FOOD] 식량 +1.[NEWLINE][NEWLINE]인접한 [ICON_RES_SALT] 소금: [ICON_PRODUCTION] 생산력 +1 및 [ICON_GOLD] 골드 +1.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]비엘리치카 소금 광산[ENDCOLOR]은 숨겨진 지하 비밀을 드러내어 식량 생산(+5%[ICON_FOOD][ICON_FOOD])과 [COLOR_CITY_BROWN]채광[ENDCOLOR](+1[ICON_FOOD]/[ICON_WORKER]) 효율을 크게 높이며, 최근 발견된 풍부한 [COLOR_GREY]소금[ENDCOLOR](+2[ICON_RES_SALT]; +1[ICON_PRODUCTION], +1[ICON_GOLD]/[ICON_RES_SALT]) 매장지로 추가 지원을 받습니다.'
WHERE Tag = 'TXT_KEY_WONDER_WIELICZKA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_WIELICZKA_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_WIELICZKA_HELP';
				
UPDATE Language_ko_KR SET Text = '부지: [COLOR_CYAN]언덕[ENDCOLOR]; 시설: [COLOR_CYAN]광산 2개[ENDCOLOR]; 도시: [COLOR_CYAN]소금 배치 공간[ENDCOLOR]; 지도: [COLOR_CYAN]지도에 소금[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_WIELICZKA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '부지: [COLOR_CYAN]언덕[ENDCOLOR]; 도시: [COLOR_CYAN]소금 배치 공간[ENDCOLOR]; 지도: [COLOR_CYAN]지도에 소금[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_WIELICZKA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Plain of Jars
INSERT INTO Language_ko_KR 
			(Tag,										Text) 
VALUES		('TXT_KEY_BUILDING_THONG_HAI_HIN',			'항아리 평원'),
			('TXT_KEY_WONDER_THONG_HAI_HIN_QUOTE',		'[NEWLINE]"잘 보낸 하루가 행복한 잠을 가져오듯, 잘 사용한 인생은 행복한 죽음을 가져온다."[NEWLINE] - 레오나르도 다빈치[NEWLINE]'),
			('TXT_KEY_WONDER_THONG_HAI_HIN_PEDIA',		'작성 필요'),
			('TXT_KEY_WONDER_THONG_HAI_HIN_HELP',		'유닛이 [COLOR_POSITIVE_TEXT]사망 시[ENDCOLOR] 5의 [ICON_PEACE] 신앙을 생성하며, 시대에 따라 증가합니다. 육상 [ICON_INTERNATIONAL_TRADE] 교역로는 [ICON_GOLD] 골드 +2를 얻습니다. 모든 지역 [ICON_INTERNATIONAL_TRADE] 교역로는 [ICON_FOOD] 식량 +2를 얻습니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]항아리 평원[ENDCOLOR]은 여러 교역로의 교차로에 위치하므로 창고([ICON_INTERNATIONAL_TRADE]: +2[ICON_FOOD]), 묘지(+3[ICON_PEACE]; 5[ICON_PEACE]/사망 시), 시장(+2[ICON_GOLD]; 육상 [ICON_INTERNATIONAL_TRADE]: +2[ICON_GOLD]) 등 다양한 역할을 수행해야 합니다.'
WHERE Tag = 'TXT_KEY_WONDER_THONG_HAI_HIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_THONG_HAI_HIN_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_THONG_HAI_HIN_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]평원[ENDCOLOR], [COLOR_NEGATIVE_TEXT]해안[ENDCOLOR]; 부지: [COLOR_CYAN]평지[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_THONG_HAI_HIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]평원[ENDCOLOR]; 부지: [COLOR_CYAN]평지[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_THONG_HAI_HIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Stonehenge
UPDATE Language_ko_KR
SET Text = '신비로운 [COLOR_YIELD_FOOD]스톤헨지[ENDCOLOR]는 개선된 [COLOR_YIELD_FOOD]의회[ENDCOLOR]([ICON_RESEARCH]) 역할을 하며, 즉각적인 신앙 부스트(50[ICON_PEACE])를 제공하여 새로운 종교 창시를 거의 보장하고 공학 분야를 향상시킵니다(+1[ICON_GREAT_ENGINEER]).'
WHERE Tag = 'TXT_KEY_BUILDING_STONEHENGE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,									Text) 
SELECT		'TXT_KEY_BUILDING_STONEHENGE_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_STONEHENGE_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]초원[ENDCOLOR], [COLOR_NEGATIVE_TEXT]해안[ENDCOLOR]; 부지: [COLOR_CYAN]평지[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_STONEHENGE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]초원[ENDCOLOR], 부지: [COLOR_CYAN]평지[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_STONEHENGE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Pyramids
UPDATE Language_ko_KR
SET Text = '위대한 [COLOR_YIELD_FOOD]피라미드[ENDCOLOR]는 공학의 걸작으로(+1[ICON_GREAT_ENGINEER]), 저명한 인물들의 노력 덕분에 다음 황금기를 가속화합니다(50[ICON_GOLDEN_AGE]/[ICON_GREAT_PEOPLE][ICON_GREAT_PEOPLE]). 최근 훈련된 [COLOR_YIELD_GOLD]무료 개척자[ENDCOLOR]를 사용하여 또 다른 위대하고 번영하는 도시를 건설하십시오.'
WHERE Tag = 'TXT_KEY_WONDER_PYRAMIDS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,									Text) 
SELECT		'TXT_KEY_WONDER_PYRAMIDS_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_PYRAMIDS_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_NEGATIVE_TEXT]툰드라[ENDCOLOR], [COLOR_NEGATIVE_TEXT]설원[ENDCOLOR]; 부지: [COLOR_CYAN]평지[ENDCOLOR]; 특성: [COLOR_CYAN]강[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PYRAMIDS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '부지: [COLOR_CYAN]평지[ENDCOLOR]; 특성: [COLOR_CYAN]강[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PYRAMIDS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Petra
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]페트라[ENDCOLOR] 단지는 주변 [COLOR_CITY_BLUE]사막[ENDCOLOR](+1[ICON_GOLD]/[ICON_FLOWER])을 이용하여 수입을 늘립니다. 새로운 [COLOR_YIELD_GOLD]무료 교역단[ENDCOLOR]을 이용 가능한 교역로(+1[ICON_INTERNATIONAL_TRADE])를 따라 보내 전 세계에 문화를 빠르게 전파하십시오([COLOR_CYAN]고고학[ENDCOLOR]: +6[ICON_CULTURE]).'
WHERE Tag = 'TXT_KEY_WONDER_PETRA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, 'City must be built on or next to Desert. ', '') WHERE Tag ='TXT_KEY_WONDER_PETRA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);
		
INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_PETRA_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_PETRA_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]사막[ENDCOLOR], [COLOR_CYAN]산[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PETRA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]사막[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PETRA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Temple of Artemis
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]아르테미스 신전[ENDCOLOR]은 전반적인 성장을 강력하게 지원하고(+10%[ICON_FOOD][ICON_FOOD]), [COLOR_YIELD_FOOD]약초상[ENDCOLOR]([ICON_FOOD]; [ICON_PRODUCTION])을 장려하며, 도시의 고용된 전문가들이 도시화로 인한 부담을 덜어줍니다(-2[ICON_HAPPINESS_3] 도시화). 추가로, 이 도시는 더 가치 있는 땅을 정복하기 위해 원거리 유닛을 대량 생산할 수 있습니다(+20%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]원거리[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_TEMPLE_ARTEMIS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_TEMPLE_ARTEMIS_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_TEMPLE_ARTEMIS_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_NEGATIVE_TEXT]사막[ENDCOLOR]; 특성: [COLOR_CYAN]숲[ENDCOLOR]/[COLOR_CYAN]정글[ENDCOLOR]; 시설: [COLOR_CYAN]야영지/재배지[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_TEMPLE_ARTEMIS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특성: [COLOR_CYAN]숲[ENDCOLOR]/[COLOR_CYAN]정글[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_TEMPLE_ARTEMIS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Mausoleum of Halicarnassus
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]할리카르나소스의 마우솔레움[ENDCOLOR]은 크게 개선된 효과로 새로운 축제를 시작합니다(20[ICON_HAPPINESS_1] WLTKD 턴; +10%[ICON_PRODUCTION], +10%[ICON_GOLD], +10%[ICON_RESEARCH]/[ICON_HAPPINESS_1] WLTKD). 이러한 발전은 최근 건설된 [COLOR_YIELD_FOOD]석재 공장[ENDCOLOR]([ICON_PRODUCTION]; [ICON_GOLD])의 노력 덕분에 가능했습니다.'
WHERE Tag = 'TXT_KEY_WONDER_MAUSOLEUM_HALICARNASSUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,												Text) 
SELECT		'TXT_KEY_WONDER_MAUSOLEUM_HALICARNASSUS_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_MAUSOLEUM_HALICARNASSUS_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 부지: [COLOR_CYAN]언덕[ENDCOLOR]; 시설: [COLOR_CYAN]채석장[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MAUSOLEUM_HALICARNASSUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 부지: [COLOR_CYAN]언덕[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MAUSOLEUM_HALICARNASSUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Statue of Zeus
UPDATE Language_ko_KR
SET Text = '거대한 [COLOR_YIELD_FOOD]제우스 상[ENDCOLOR]은 지역 [COLOR_YIELD_FOOD]병영[ENDCOLOR]([ICON_SILVER_FIST]; [ICON_RESEARCH]; [ICON_HAPPINESS_3])과 함께 공격 능력을 향상시키며, 특히 도시 공성전에서 효과적입니다([COLOR_WATER_TEXT]제우스 상[ENDCOLOR]/[COLOR_YIELD_GOLD]군사[ENDCOLOR]). 또한 지역 불안을 줄이는 노력을 세 배로 늘립니다(-1[ICON_HAPPINESS_3] 고통; [COLOR_YIELD_GOLD]노동자[ENDCOLOR]는 [COLOR_WATER_TEXT]전쟁 포로[ENDCOLOR]에 면역).'
WHERE Tag = 'TXT_KEY_WONDER_STATUE_ZEUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,									Text) 
SELECT		'TXT_KEY_WONDER_STATUE_ZEUS_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_STATUE_ZEUS_HELP';
				
UPDATE Language_ko_KR SET Text = '다른 플레이어: [COLOR_CYAN]경계[ENDCOLOR]/[COLOR_CYAN]두려움[ENDCOLOR]/[COLOR_CYAN]적대적[ENDCOLOR]/[COLOR_CYAN]전쟁 중[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_STATUE_ZEUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = ''||Text WHERE Tag ='TXT_KEY_WONDER_STATUE_ZEUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
----------------------------------------------------
-- Malwiya Minaret
INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_MALWIYA',			'말위야 미나레트'),
			('TXT_KEY_WONDER_MALWIYA_QUOTE',		'[NEWLINE]"천국을 목표로 하면 지구를 얻을 것이고... 지구를 목표로 하면 둘 다 얻지 못할 것이다."[NEWLINE] - C.S. 루이스[NEWLINE]'),
			('TXT_KEY_WONDER_MALWIYA_PEDIA',		'말위야 미나레트(나선형 미나레트라고도 함)는 이라크 사마라에 위치한 사마라 대모스크의 일부입니다. 이 단지는 848년부터 852년까지 4년에 걸쳐 건설되었습니다. 주 모스크는 미나레트보다 1년 먼저 완공되었습니다. 이 단지는 아바스 왕조의 칼리프 알-무타와킬의 통치 기간에 건설되었습니다. 한때 세계에서 가장 큰 모스크였습니다.[NEWLINE][NEWLINE]  미나레트(탑)는 사암으로 건설되었으며, 상승하는 나선형 원뿔 디자인 때문에 다른 미나레트와는 독특합니다. 높이 52미터, 바닥 너비 33미터이며, 나선형에는 꼭대기까지 이어지는 계단이 있습니다. "말위야"라는 단어는 "꼬인" 또는 "달팽이 껍질"로 번역됩니다.[NEWLINE][NEWLINE]  이라크 전쟁의 혼란 속에서 말위야 미나레트는 2005년과 2011년에 이라크 반군의 공격을 받아 폭탄 폭발로 손상되었습니다.'),
			('TXT_KEY_WONDER_MALWIYA_HELP',			'제국의 모든 석재 공장에서 [ICON_PRODUCTION] 생산력 +2, 모든 채석장에서 [ICON_PRODUCTION] 생산력 +1 및 [ICON_PEACE] 신앙 +1, 모든 제조소에서 [ICON_PEACE] 신앙 +3을 제공합니다.');
				
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]말위야 미나레트[ENDCOLOR]는 공학적 천재성의 결과로(+2[ICON_GREAT_ENGINEER]), 모든 [COLOR_CITY_BROWN]채석된[ENDCOLOR] 자재를 개선합니다(+1[ICON_PRODUCTION], +1[ICON_PEACE]/[ICON_WORKER][ICON_WORKER]). 자원을 연결하고, 많은 [COLOR_CITY_BROWN]제조소[ENDCOLOR](+3[ICON_PEACE]/[ICON_WORKER][ICON_WORKER])를 건설하고, 모든 도시에 [COLOR_YIELD_FOOD]석재 공장[ENDCOLOR](+2[ICON_PRODUCTION][ICON_PRODUCTION])을 서둘러 건설하여 이 멋진 프로젝트를 지원하십시오.'
WHERE Tag = 'TXT_KEY_WONDER_MALWIYA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_MALWIYA_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_MALWIYA_HELP';
				
UPDATE Language_ko_KR SET Text = '부지: [COLOR_CYAN]평지[ENDCOLOR]; 건물: [COLOR_CYAN]석재 공장[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MALWIYA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '부지: [COLOR_CYAN]평지[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MALWIYA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Buddhas of Bamyan
INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_BAMYAN',			'바미얀 석불'),
			('TXT_KEY_WONDER_BAMYAN_QUOTE',		'[NEWLINE]"과거는 이미 지나갔고, 미래는 아직 오지 않았다. 당신이 살아야 할 순간은 오직 하나뿐이다."[NEWLINE] - 부처[NEWLINE]'),
			('TXT_KEY_WONDER_BAMYAN_PEDIA',		'힌두쿠시 산맥 깊숙한 곳, 실크로드를 따라 바미얀 계곡에 바미얀 석불이 한때 우뚝 솟아 있었습니다. 바미얀은 2세기부터 7세기 후반까지 종교적 장소였으며, 그 기간 동안 석불이 건설되었습니다. 중국의 불교 순례자 현장이 630년에 방문하여 바미얀을 "10개 이상의 수도원과 1000명 이상의 승려가 있는 번성하는 불교 중심지"라고 묘사했습니다. 2001년, 국제 원조 우선순위에 대한 항의 또는 이슬람 종교적 우상 파괴의 일환으로 탈레반에 의해 석불이 파괴되어 국내외적으로 비난을 받았습니다. 그 이후로 석불을 재건하기 위한 국제적인 노력이 이루어졌습니다. 더욱이, 석불 파괴 후 5세기부터 9세기까지의 예술품이 담긴 동굴과, 모든 것은 덧없다는 불교의 기본 신념을 설명하는 현장의 연기법경 번역본이 발견되었습니다. 바미얀의 원래 석불은 사라졌을지 모르지만, 그 메시지와 문화적 중요성은 영원히 울려 퍼질 것입니다.'),
			('TXT_KEY_WONDER_BAMYAN_HELP',		'도시가 +100%의 종교적 압력을 생성합니다. 도시 국가 친구마다 [ICON_PEACE] 신앙 +2, 도시 국가 동맹마다 [ICON_GOLDEN_AGE] 황금기 점수 +3. 우호 선언 2개마다 [ICON_INFLUENCE] 세계 회의 투표권 +1. [COLOR_CYAN]로켓 공학[ENDCOLOR] 발견 시 [ICON_CULTURE] 문화 +2 및 [ICON_GOLDEN_AGE] 황금기 점수 +2.');
			
UPDATE Language_ko_KR
SET Text = '거대한 [COLOR_YIELD_FOOD]석불[ENDCOLOR]은 전 세계 모든 국가에 대한 당신의 관대함의 표시가 되어야 합니다(+100%[ICON_RELIGION] 압력). 주변에 평화를 유지하고 많은 친구와 동맹을 모으십시오(+2[ICON_PEACE]/[ICON_CITY_STATE] 친구; +3[ICON_GOLDEN_AGE]/[ICON_CITY_STATE] 동맹). 세계가 초강대국에 의해 주도되는 먼 미래에도 말입니다(+1[ICON_DIPLOMAT] 연맹 투표/2 DoF).'
WHERE Tag = 'TXT_KEY_WONDER_BAMYAN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_BAMYAN_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_BAMYAN_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]산 2개[ENDCOLOR]; 플레이어: [COLOR_CYAN]평화 상태[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BAMYAN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = ''||Text WHERE Tag ='TXT_KEY_WONDER_BAMYAN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Gate of the Sun
INSERT INTO Language_ko_KR 
			(Tag,										Text) 
VALUES		('TXT_KEY_BUILDING_GATE_OF_SUN',			'태양의 문'),
			('TXT_KEY_WONDER_GATE_OF_SUN_QUOTE',		'[NEWLINE]"내 사랑이 머무는 곳에 해가 지기를."[NEWLINE] - 볼리비아 속담[NEWLINE]'),
			('TXT_KEY_WONDER_GATE_OF_SUN_PEDIA',		'태양의 문은 기원후 500-950년 사이에 고대 티와나쿠 문화에 의해 건설된 석조 아치입니다. 상인방에는 중앙 인물을 둘러싼 48개의 사각형이 새겨져 있습니다. 중앙 인물은 머리 주위에 24개의 광선이 있는 남자입니다. 일부는 태양의 문이 천문학적 또는 점성술적 중요성을 가지고 있거나 달력으로 사용되었을 수 있다고 믿습니다. 아무도 확실히 알지 못합니다.'),
			('TXT_KEY_WONDER_GATE_OF_SUN_HELP',			'제국의 모든 성벽에서 [ICON_RESEARCH] 과학 +1. 이 도시가 점유한 산과 호수에서 [ICON_CULTURE] 문화 +1. [ICON_GREAT_WORK] 위대한 예술품 슬롯 1개를 가집니다. [ICON_GOLDEN_AGE] 황금기 동안 이 도시에서 생산되는 [ICON_RESEARCH] 과학 +5% 및 성벽이 있는 도시에서 [ICON_RESEARCH] 과학 +5%.');
			
UPDATE Language_ko_KR
SET Text = '신비로운 [COLOR_YIELD_FOOD]태양의 문[ENDCOLOR]은 놀라운 비문(+1[ICON_GREAT_WORK])을 숨기고 있습니다. 그 비밀을 밝히면 [COLOR_CITY_BLUE]산[ENDCOLOR](+1[ICON_CULTURE]/[ICON_FLOWER] 도시)과 [COLOR_CITY_GREEN]호수[ENDCOLOR](+1[ICON_CULTURE]/[ICON_MUSHROOM])가 더 영향력 있게 되고, 당신의 발전에 핵심 요소가 될 것입니다(+5%[ICON_RESEARCH]/[ICON_GOLDEN_AGE]). 모든 도시에 [COLOR_YIELD_FOOD]성벽[ENDCOLOR](+1[ICON_RESEARCH][ICON_RESEARCH]; +5%[ICON_RESEARCH]/성벽 있는 도시)을 건설하여 지식을 전파하는 것을 잊지 마십시오.'
WHERE Tag = 'TXT_KEY_WONDER_GATE_OF_SUN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_GATE_OF_SUN_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_GATE_OF_SUN_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]산[ENDCOLOR]; 특성: [COLOR_CYAN]호수[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GATE_OF_SUN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특성: [COLOR_CYAN]호수[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GATE_OF_SUN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- El Ghriba Synagogue
INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_EL_GHRIBA',			'엘 그리바 회당'),
			('TXT_KEY_WONDER_EL_GHRIBA_QUOTE',		'[NEWLINE]"예수는 유대인으로 태어나 유대인으로 죽었다. 그는 새로운 종교를 세울 생각이 전혀 없었다. 그는 성호를 긋지 않았다 - 그럴 이유가 없었다. 그는 교회에 발을 들여놓은 적이 없다. 그는 회당에 갔다."[NEWLINE] - 아모스 오즈[NEWLINE]'),
			('TXT_KEY_WONDER_EL_GHRIBA_PEDIA',		'튀니지 제르바 섬에 위치한 엘 그리바 회당은 튀니지에서 가장 오래된 회당이며 마을의 신성한 삶의 중심지입니다. 전설에 따르면, 기원전 586년 솔로몬 성전이나 기원후 70년 제2성전 파괴 시의 문과 돌로 건설되었다고 합니다. 따라서 이곳은 지역 유대인 공동체를 유대교의 조상 중심지와 연결하며 오늘날까지 순례지로 남아 있습니다.'),
			('TXT_KEY_GREAT_WORK_THE_ARK',			'언약궤'),
			('TXT_KEY_GREAT_WORK_THE_ARK_QUOTE',	'[NEWLINE]내 마음에 주의 언약궤와[NEWLINE]우리 하나님의 발판을 둘[NEWLINE]안식의 집을 건축할 마음이 있었으나[NEWLINE] - 역대상 28:2[NEWLINE]'),
			('TXT_KEY_WONDER_EL_GHRIBA_HELP',		'이 도시가 건설된 도시에 [COLOR_POSITIVE_TEXT]무료[ENDCOLOR] 회당을 제공합니다. [ICON_PEACE] 신앙 구매의 15%를 [ICON_GOLD] 골드로 전환합니다. [ICON_GREAT_WORK] 위대한 예술품 슬롯 1개를 가지며, [ICON_GREAT_WORK] [COLOR_CULTURE_STORED]언약궤[ENDCOLOR]로 시작합니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]엘 그리바[ENDCOLOR]는 유대 역사의 초석인 [COLOR_CULTURE_STORED]언약궤[ENDCOLOR](+1[ICON_GREAT_WORK])와 같은 유물을 포함하는 [COLOR_YIELD_FOOD]회당[ENDCOLOR]([ICON_PRODUCTION]; [ICON_PEACE]; [ICON_HAPPINESS_3]; [ICON_GREAT_WORK]; [ICON_RESEARCH])입니다. 또한 모든 종교적 지출에서 일부 금을 돌려받을 수 있습니다(15%[ICON_PEACE] 신앙 구매를 [ICON_GOLD]으로 전환).'
WHERE Tag = 'TXT_KEY_WONDER_EL_GHRIBA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_EL_GHRIBA_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_EL_GHRIBA_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_YIELD_PRODUCTION]성도[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_EL_GHRIBA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '특수: [COLOR_YIELD_PRODUCTION]성도[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_EL_GHRIBA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Etchmiadzin Cathedral
INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_ETCHMIADZIN',		'에치미아진 대성당'),
			('TXT_KEY_WONDER_ETCHMIADZIN_QUOTE',	'[NEWLINE]"단검의 상처는 낫지만, 혀의 상처는 결코 낫지 않는다."[NEWLINE] - 아르메니아 속담[NEWLINE]'),
			('TXT_KEY_WONDER_ETCHMIADZIN_PEDIA',	'아르메니아 바가르샤파트에 위치한 에치미아진 대성당은 종종 세계에서 가장 오래된 대성당으로 여겨집니다. 티리다테스 3세 왕이 기독교를 아르메니아 국교로 채택한 후, 301년에서 303년 사이에 성 그레고리오 계몽자가 이교도 사원 위에 지었습니다. 5세기 후반까지 에치미아진은 아르메니아 교회의 최고 수장의 자리였습니다.[NEWLINE]에치미아진은 수세기 동안 아르메니아 국민의 국가적, 정치적 중심지였으며 신성한 땅으로 여겨집니다. 아르메니아 정체성에 매우 중요하며 오늘날에도 인기 있는 순례지로 남아 있습니다. 페르시아의 샤 압바스 1세가 아르메니아 문화 정체성을 약화시키기 위해 대성당을 약탈하고, 소련 치하에서 대성당의 중요성이 감소했지만, 그것은 견뎌냈습니다. 2000년에는 유네스코 세계문화유산 목록에 추가되었습니다. 특히, 대성당은 롱기누스의 창, 12사도의 유물, 노아의 방주 조각 등 여러 유물을 소장하고 있다고 주장합니다.'),
			('TXT_KEY_GREAT_WORK_HOLY_LANCE',		'성창'),
			('TXT_KEY_GREAT_WORK_HOLY_LANCE_QUOTE',	'[NEWLINE]군인 중 하나가[NEWLINE]창으로 그의[NEWLINE]옆구리를 찌르니[NEWLINE]곧[NEWLINE]피와 물이[NEWLINE]나오더라.[NEWLINE] - 요한복음 19:34[NEWLINE]'),
			('TXT_KEY_WONDER_ETCHMIADZIN_HELP',		'이 도시에서 생산된 [ICON_PEACE] 신앙의 10%를 [ICON_CULTURE] 문화로, 또 다른 10%를 [ICON_GOLDEN_AGE] 황금기 점수로 전환합니다. [ICON_GREAT_WORK] 위대한 예술품 슬롯 1개를 가지며, [ICON_GREAT_WORK] [COLOR_CULTURE_STORED]성창[ENDCOLOR]으로 시작합니다. 제국의 모든 [ICON_GREAT_WORK] 위대한 작품은 [ICON_PEACE] 신앙 +1을 받습니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]에치미아진 대성당[ENDCOLOR]은 [COLOR_CULTURE_STORED]성창[ENDCOLOR](+1[ICON_GREAT_WORK]; +1[ICON_PEACE]/[ICON_GREAT_WORK][ICON_GREAT_WORK])과 같은 멋진 위대한 작품을 보관합니다. 고위 귀족들의 지원 덕분에 다음 황금기의 도래를 앞당기고 문화 산출량을 증가시킵니다(10%[ICON_PEACE]를 [ICON_CULTURE], [ICON_GOLDEN_AGE]으로 전환).'
WHERE Tag = 'TXT_KEY_WONDER_ETCHMIADZIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_ETCHMIADZIN_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_ETCHMIADZIN_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]초원[ENDCOLOR], [COLOR_NEGATIVE_TEXT]해안[ENDCOLOR]; 특성: [COLOR_CYAN]숲[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ETCHMIADZIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '특성: [COLOR_CYAN]숲[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ETCHMIADZIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Chand Baori
INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_CHAND_BAORI',		'찬드 바오리'),
			('TXT_KEY_WONDER_CHAND_BAORI_QUOTE',	'[NEWLINE]"우물이 마르면 물의 가치를 안다."[NEWLINE] - 벤자민 프랭클린[NEWLINE]'),
			('TXT_KEY_WONDER_CHAND_BAORI_PEDIA',	'천 년 이상 전에 지어진 찬드 바오리는 인도 라자스탄의 아브하네리 마을에 위치한 계단식 우물입니다. 계단식 우물은 인도 아대륙 고유의 것으로, 물까지 내려가는 계단이 있는 우물입니다. 계절에 따른 물의 가용성에 대처하기 위한 많은 개발 중 하나였습니다. [NEWLINE]찬드 바오리는 아마도 계단식 우물 중 가장 크고 시각적으로 가장 장관일 것입니다. 사면 구조로, 한 면에는 기쁨의 여신 하르샤트 마타에게 바쳐진 사원이 있습니다. 현대에 와서 찬드 바오리는 여러 볼리우드 영화에 등장했지만, 수돗물이 보급되면서 계단식 우물은 인기를 잃었습니다.'),
			('TXT_KEY_WONDER_CHAND_BAORI_HELP',		'선택한 [COLOR_POSITIVE_TEXT]무료[ENDCOLOR] [ICON_GREAT_PEOPLE] 위인 1명을 받습니다. 이 도시에서 [ICON_GREAT_PEOPLE] 위인 생성률 +10%. 이 도시의 사막 타일에서 [ICON_FOOD] 식량 +1. 도시의 전문가 3명은 더 이상 도시화로 인한 [ICON_HAPPINESS_3] 불행을 생성하지 않습니다.');

UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]찬드 바오리[ENDCOLOR]는 지역 [COLOR_CITY_BLUE]사막[ENDCOLOR](+1[ICON_FOOD]/[ICON_FLOWER])이 도시에 쓸모없지 않도록 보장합니다. 또한 새로운 전문가들이 사무실을 차리고(-3[ICON_HAPPINESS_3] 도시화) 귀족들 사이에 매우 중요하고 수익성 있는 거래가 이루어지는 곳입니다([COLOR_YIELD_GOLD]무료 [ICON_GREAT_PEOPLE][ENDCOLOR]; +10%[ICON_GREAT_PEOPLE]).'
WHERE Tag = 'TXT_KEY_WONDER_CHAND_BAORI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_CHAND_BAORI_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_CHAND_BAORI_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]사막[ENDCOLOR]; 특성: [COLOR_NEGATIVE_TEXT]담수[ENDCOLOR]; 건물: [COLOR_CYAN]우물[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CHAND_BAORI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '특성: [COLOR_NEGATIVE_TEXT]담수[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CHAND_BAORI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Sigiriya
INSERT INTO Language_ko_KR 
			(Tag,										Text)
VALUES		('TXT_KEY_BUILDING_SIGIRIYA',				'시기리야'),
			('TXT_KEY_WONDER_SIGIRIYA_QUOTE',			'[NEWLINE]"나는 부달이다. 수백 명의 사람들과 함께 시기리야를 보러 왔다. 다른 모든 사람들이 시를 썼기 때문에, 나는 쓰지 않았다!"[NEWLINE] - 10세기 시의 텍스트[NEWLINE]'),
			('TXT_KEY_WONDER_SIGIRIYA_PEDIA',			'작성 필요'),
			('TXT_KEY_THEMING_BONUS_SIGIRIYA',			'아름다운 토착 예술 컬렉션'),
			('TXT_KEY_THEMING_BONUS_SIGIRIYA_HELP',		'보너스를 극대화하려면, 모든 위대한 작품 슬롯이 당신이 만든 예술품으로 채워져 있는지 확인하십시오.'),
			('TXT_KEY_WONDER_SIGIRIYA_HELP',			'이 도시의 [ICON_STRENGTH] 전투력을 크게 증가시킵니다. 즉시 200 [ICON_GOLD] 골드를 받습니다. 제국의 모든 [ICON_GREAT_WORK] 위대한 작품은 [ICON_CULTURE] 문화 +1을 받습니다. [ICON_GREAT_WORK] 위대한 예술품 슬롯 2개를 가집니다. [COLOR_POSITIVE_TEXT]테마[ENDCOLOR]가 있는 경우 [ICON_GOLD] 골드 +6 및 [ICON_CULTURE] 문화 +3.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]시기리야[ENDCOLOR]는 지하에 숨겨진 거대한 보물(200[ICON_GOLD])과 많은 귀중한 예술 작품(+1[ICON_CULTURE]/[ICON_GREAT_WORK][ICON_GREAT_WORK]; 2[ICON_GREAT_WORK], 테마가 있는 경우: [ICON_GOLD], [ICON_CULTURE])을 포함하고 있습니다. 이 모든 것은 도달할 수 없는 지역 언덕 꼭대기에서 안전합니다(+10[ICON_STRENGTH]).'
WHERE Tag = 'TXT_KEY_WONDER_SIGIRIYA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_SIGIRIYA_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_SIGIRIYA_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_NEGATIVE_TEXT]해안[ENDCOLOR]; 부지: [COLOR_CYAN]언덕[ENDCOLOR]; 특성: [COLOR_CYAN]숲[ENDCOLOR]/[COLOR_CYAN]정글[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SIGIRIYA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '부지: [COLOR_CYAN]언덕[ENDCOLOR]; 특성: [COLOR_CYAN]숲[ENDCOLOR]/[COLOR_CYAN]정글[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SIGIRIYA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Great Lighthouse
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]등대[ENDCOLOR]([ICON_FOOD]; [ICON_GOLD]; [ICON_CONNECTED])보다 선원들이 목적지에 도달하는 데 더 도움이 되는 것은 없습니다. [COLOR_YIELD_FOOD]알렉산드리아 등대[ENDCOLOR]는 추가로 모든 해상 유닛의 시야와 이동을 강화합니다([COLOR_WATER_TEXT]항해 II[ENDCOLOR]/[COLOR_YIELD_GOLD]해군[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_GREAT_LIGHTHOUSE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, 'City must be built on the coast. ', '') WHERE Tag ='TXT_KEY_WONDER_GREAT_LIGHTHOUSE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_ko_KR 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_GREAT_LIGHTHOUSE_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_GREAT_LIGHTHOUSE_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR], [COLOR_NEGATIVE_TEXT]초원[ENDCOLOR]; 특성: [COLOR_CYAN]강[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GREAT_LIGHTHOUSE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 특성: [COLOR_CYAN]강[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GREAT_LIGHTHOUSE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Great Library
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]알렉산드리아 대도서관[ENDCOLOR]의 방대한 장서는 다른 모든 [COLOR_YIELD_FOOD]도서관[ENDCOLOR]([ICON_RESEARCH]; [ICON_HAPPINESS_3])과 마찬가지로 막대한 과학적 부스트(+1[ICON_GREAT_SCIENTIST]), 즉각적인 기술 발전([COLOR_CYAN]무료 기술[ENDCOLOR])을 제공하며, 테마가 있는 경우 더 많은 과학을 부여하는 문학 작품을 위한 추가 슬롯을 제공합니다(2[ICON_GREAT_WORK], 테마가 있는 경우: [ICON_RESEARCH]).'
WHERE Tag = 'TXT_KEY_WONDER_GREAT_LIBRARY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_GREAT_LIBRARY_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_GREAT_LIBRARY_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 부지: [COLOR_CYAN]언덕[ENDCOLOR]; 특성: [COLOR_CYAN]숲[ENDCOLOR]/[COLOR_CYAN]정글[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GREAT_LIBRARY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '부지: [COLOR_CYAN]언덕[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GREAT_LIBRARY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Forum Romanum
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]포룸 로마눔[ENDCOLOR]은 당신을 세계에서 가장 영향력 있는 통치자로 만들기 위해 다양한 능력을 사용합니다. 전문가의 지원([COLOR_YIELD_GOLD]무료 [ICON_DIPLOMAT][ENDCOLOR]; +1[ICON_DIPLOMAT]) 외에도 외교 유닛 생산이 증가하고(+20%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]외교[ENDCOLOR]), 새로운 [COLOR_GREY]종이[ENDCOLOR] 자원을 사용할 수 있으며(+1[ICON_RES_PAPER]), 모든 외교 활동에서 영향력이 증가합니다([COLOR_WATER_TEXT]황제의 인장[ENDCOLOR]/[COLOR_YIELD_GOLD]외교[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_BUILDING_FORUM_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_BUILDING_FORUM_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_FORUM_HELP';
				
UPDATE Language_ko_KR SET Text = '특성: [COLOR_CYAN]강[ENDCOLOR], [COLOR_CYAN]습지[ENDCOLOR]; 정책: [COLOR_MAGENTA]필요한 정책 1개 감소[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_FORUM_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특성: [COLOR_CYAN]습지[ENDCOLOR]; 정책: [COLOR_MAGENTA]필요한 정책 1개 감소[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_FORUM_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Hanging Gardens
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]공중 정원[ENDCOLOR]은 표준 [COLOR_YIELD_FOOD]정원[ENDCOLOR]([ICON_GREAT_PEOPLE]; [ICON_GOLD]; [ICON_FOOD]; [ICON_HAPPINESS_3])보다 훨씬 크고 화려한 버전으로, 막대한 양의 식량(+10[ICON_FOOD])을 제공합니다. 그 혜택을 사용하여 인구 성장을 촉진하십시오.'
WHERE Tag = 'TXT_KEY_WONDER_HANGING_GARDEN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_HANGING_GARDEN_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_HANGING_GARDEN_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_NEGATIVE_TEXT]해안[ENDCOLOR]; 부지: [COLOR_CYAN]평지[ENDCOLOR]; 특성: [COLOR_CYAN]담수[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HANGING_GARDEN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특성: [COLOR_CYAN]담수[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HANGING_GARDEN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Terracotta Army
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]병마용[ENDCOLOR]은 놀라운 군대 창설(+5[ICON_SILVER_FIST])을 가능하게 하고, 잘 개발된 도시를 만들기 위해 시설 건설 속도를 높입니다(+25%[ICON_WORKER]). 모든 적을 처치하여 문화를 얻으십시오(처치 시 10[ICON_CULTURE])!'
WHERE Tag = 'TXT_KEY_WONDER_TERRA_COTTA_ARMY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_TERRA_COTTA_ARMY_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_TERRA_COTTA_ARMY_HELP';
				
UPDATE Language_ko_KR SET Text = '특성: [COLOR_NEGATIVE_TEXT]물[ENDCOLOR]; 시설: [COLOR_CYAN](광산 + 채석장) 2개[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_TERRA_COTTA_ARMY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특성: [COLOR_NEGATIVE_TEXT]물[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_TERRA_COTTA_ARMY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Parthenon
/* 주석 처리된 부분은 그대로 둡니다. */
----------------------------------------------------
-- Oracle
UPDATE Language_ko_KR
SET Text = '신비로운 [COLOR_YIELD_FOOD]신탁소[ENDCOLOR]는 다른 [COLOR_YIELD_FOOD]사원[ENDCOLOR]([ICON_PEACE]; [ICON_CULTURE]; [ICON_GOLD]; [ICON_GREAT_WORK]; [ICON_HAPPINESS_3])과 달리 모든 과학 프로젝트를 가능하게 합니다(+1[ICON_GREAT_SCIENTIST]). 막대한 즉시 산출량(500[ICON_RESEARCH]; 500[ICON_CULTURE])을 제공하고 시민들의 자질을 향상시킵니다(-1[ICON_HAPPINESS_3] 문맹).'
WHERE Tag = 'TXT_KEY_WONDER_ORACLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_ORACLE_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_ORACLE_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]산[ENDCOLOR]; 부지: [COLOR_CYAN]언덕[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ORACLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '부지: [COLOR_CYAN]언덕[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ORACLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Angkor Wat
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]앙코르 와트[ENDCOLOR]는 제국의 확장을 촉진하고(+25%[ICON_CULTURE][ICON_CULTURE] 국경 성장; -25%[ICON_GOLD][ICON_GOLD] 타일 비용), 다른 [COLOR_YIELD_FOOD]만디르[ENDCOLOR]([ICON_FOOD]; [ICON_PEACE]; [ICON_HAPPINESS_3]; [ICON_GREAT_WORK]; [ICON_SPY])와 달리 공학 프로젝트를 지원합니다(+1[ICON_GREAT_ENGINEER]).'
WHERE Tag = 'TXT_KEY_WONDER_ANGKOR_WAT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,									Text) 
SELECT		'TXT_KEY_WONDER_ANGKOR_WAT_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_ANGKOR_WAT_HELP';
				
UPDATE Language_ko_KR SET Text = '부지: [COLOR_CYAN]평지[ENDCOLOR]; 특성: [COLOR_CYAN]호수[ENDCOLOR], [COLOR_CYAN]정글[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ANGKOR_WAT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특성: [COLOR_CYAN]호수[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ANGKOR_WAT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Great Wall
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]만리장성[ENDCOLOR]은 믿을 수 없을 정도로 성공적인 방어 프로젝트로, 당신의 [COLOR_YIELD_FOOD]성벽[ENDCOLOR]([ICON_STRENGTH]; [ICON_SILVER_FIST]; [ICON_RANGE_STRENGTH]; [ICON_HAPPINESS_3])을 적이 국경을 넘을 경우 모든 이동력을 잃게 하는 거대한 장벽으로 변형시킵니다. 경험 많은 장군([COLOR_YIELD_GOLD]무료 [ICON_GREAT_GENERAL][ENDCOLOR])이 이끄는 당신의 병사들이 세계 최고의 군대와 경쟁할 수 있게 해줍니다(+3[ICON_SILVER_FIST]).'
WHERE Tag = 'TXT_KEY_WONDER_GREAT_WALL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,									Text) 
SELECT		'TXT_KEY_WONDER_GREAT_WALL_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_GREAT_WALL_HELP';
				
UPDATE Language_ko_KR SET Text = '부지: [COLOR_CYAN]언덕[ENDCOLOR]; 특성: [COLOR_CYAN]강[ENDCOLOR]; 다른 플레이어: [COLOR_CYAN]기만적[ENDCOLOR]/[COLOR_CYAN]적대적[ENDCOLOR]/[COLOR_CYAN]전쟁 중[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GREAT_WALL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '부지: [COLOR_CYAN]언덕[ENDCOLOR]; 특성: [COLOR_CYAN]강[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GREAT_WALL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Colossus
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]콜로서스[ENDCOLOR]는 당신을 모든 바다의 위대한 상인으로 만들어 줄 것입니다(+1[ICON_INTERNATIONAL_TRADE]; [COLOR_YIELD_GOLD]무료 화물선[ENDCOLOR]). 최근 설립된 교역로 덕분에 도시의 금 수입이 점점 더 늘어나는 것을 지켜보기만 하면 됩니다(+2[ICON_GOLD]/[ICON_INTERNATIONAL_TRADE]).'
WHERE Tag = 'TXT_KEY_WONDER_COLOSSUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, 'City must be built on the coast. ', '') WHERE Tag ='TXT_KEY_WONDER_COLOSSUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_COLOSSUS_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_COLOSSUS_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 개선된 자원: [ICON_RES_IRON] [COLOR_CYAN]철[ENDCOLOR]/[ICON_RES_COPPER] [COLOR_CYAN]구리[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_COLOSSUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_COLOSSUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
----------------------------------------------------
-- Prophet's Mosque
INSERT INTO Language_ko_KR 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_NABAWI',				'예언자의 모스크'),
			('TXT_KEY_WONDER_NABAWI_QUOTE',			'[NEWLINE]"돈과 아름다움에서 당신보다 더 많이 받은 사람을 볼 때, 더 적게 받은 사람들을 보라."[NEWLINE] - 예언자 무함마드[NEWLINE]'),
			('TXT_KEY_WONDER_NABAWI_PEDIA',			'알-마스지드 안-나바위, 종종 예언자의 모스크라고 불리는 이곳은 메디나 시에 위치한 모스크입니다. 이슬람 예언자 무함마드의 마지막 안식처로서, 무슬림들에게는 이슬람에서 두 번째로 신성한 장소로 여겨지며(첫 번째는 메카의 마스지드 알-하람), 세계에서 가장 큰 모스크 중 하나입니다. 이 모스크는 두 성지의 수호자(사우디 국왕)의 통제하에 있습니다. 역사상 두 번째로 지어진 모스크입니다.[NEWLINE][NEWLINE]  이 장소의 가장 주목할 만한 특징 중 하나는 모스크 중앙에 있는 녹색 돔으로, 무함마드의 무덤이 위치해 있습니다. 녹색 돔이 언제 건설되었는지는 정확히 알려져 있지 않지만, 12세기 초의 필사본에는 돔에 대한 설명이 있습니다. 예언자의 돔 또는 녹색 돔으로 알려져 있습니다. 후대의 이슬람 통치자들은 그것을 크게 확장하고 장식했습니다. 초기 무슬림 지도자 아부 바크르와 우마르는 모스크의 인접한 지역에 묻혀 있습니다.[NEWLINE][NEWLINE]  이 장소는 원래 무함마드의 집이었습니다. 그는 메디나로의 헤지라 이후 그곳에 정착했고, 나중에 그 부지에 모스크를 지었습니다. 그는 건설의 힘든 일에 직접 참여했습니다. 원래 모스크는 야외 건물이었습니다. 건물의 기본 계획은 전 세계 다른 모스크 건설에 채택되었습니다.'),
			('TXT_KEY_THEMING_BONUS_NABAWI',		'이슬람 서예 작품'),
			('TXT_KEY_THEMING_BONUS_NABAWI_HELP',	'보너스를 극대화하려면, 두 위대한 작품 슬롯이 모두 당신이 만든 문학 작품으로 채워져 있는지 확인하십시오.'),
			('TXT_KEY_WONDER_NABAWI_HELP',			'이 도시가 건설된 도시에 [COLOR_POSITIVE_TEXT]무료[ENDCOLOR] 모스크를 제공합니다. 모든 도시가 +10%의 [ICON_PEACE] 신앙을 생성합니다. [COLOR_POSITIVE_TEXT]테마[ENDCOLOR]가 있는 경우 [ICON_PEACE] 신앙 +4 및 [ICON_GOLDEN_AGE] 황금기 점수 +4를 제공하는 [ICON_GREAT_WORK] 위대한 문학 작품 슬롯 2개를 가집니다. 이 도시에서 [ICON_GREAT_WRITER] 위대한 작가 생성률 +20%.');
			
UPDATE Language_ko_KR
SET Text = '이 불가사의는 아랍 종교 문학을 배울 수 있는 독특한 [COLOR_YIELD_FOOD]모스크[ENDCOLOR]([ICON_RESEARCH]; [ICON_PEACE]; [ICON_GREAT_WORK]; [ICON_CULTURE]; [ICON_GOLDEN_AGE]; [ICON_HAPPINESS_3])입니다(+20%[ICON_GREAT_WRITER]; 2[ICON_GREAT_WORK], 테마가 있는 경우: [ICON_PEACE], [ICON_GOLDEN_AGE]). 제국에서 나오는 막대한 신앙 산출량(+10%[ICON_PEACE][ICON_PEACE])은 종교적 지배를 달성하는 데 도움이 될 것입니다.'
WHERE Tag = 'TXT_KEY_WONDER_NABAWI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_NABAWI_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_NABAWI_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_YIELD_PRODUCTION]성도[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_NABAWI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_ko_KR SET Text = '특수: [COLOR_YIELD_PRODUCTION]성도[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_NABAWI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);		
----------------------------------------------------
-- Moray Terraces
INSERT INTO Language_ko_KR 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_MORAY',				'모라이 계단식 농경지'),
			('TXT_KEY_WONDER_MORAY_QUOTE',			'[NEWLINE]"과학은 지식의 집합체라기보다는 사고방식이다."[NEWLINE] - 칼 세이건[NEWLINE]'),
			('TXT_KEY_WONDER_MORAY_PEDIA',			'작성 필요'),
			('TXT_KEY_WONDER_MORAY_HELP',			'모든 도시의 [ICON_FOOD] 식량 +5%. 인접한 언덕에서 [ICON_FOOD] 식량 +1, [ICON_PRODUCTION] 생산력 +1, [ICON_RESEARCH] 과학 +1. 이 도시에서 생산된 [ICON_RESEARCH] 과학의 15%를 [ICON_FOOD] 식량으로 전환합니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]모라이 계단식 농경지[ENDCOLOR]는 [COLOR_CITY_BLUE]언덕[ENDCOLOR]에 만들어진 신비한 농업 구조물로, 자연적으로 보이지 않는 곳에서 특이한 식물과 작물을 재배할 수 있게 해줍니다(+1[ICON_FOOD], +1[ICON_PRODUCTION], +1[ICON_RESEARCH]/[ICON_FLOWER]; +5%[ICON_FOOD][ICON_FOOD]). 과학적 지식을 사용하여 성장을 더욱 촉진하십시오(15%[ICON_RESEARCH]를 [ICON_FOOD]으로 전환)!'
WHERE Tag = 'TXT_KEY_WONDER_MORAY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_MORAY_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_MORAY_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_NEGATIVE_TEXT]해안[ENDCOLOR]; 부지: [COLOR_CYAN]언덕[ENDCOLOR]; 시설: [COLOR_CYAN]농장[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MORAY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '지형: [COLOR_NEGATIVE_TEXT]해안[ENDCOLOR]; 부지: [COLOR_CYAN]언덕[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MORAY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Lavaux
INSERT INTO Language_ko_KR 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_LAVAUX',				'라보 포도원'),
			('TXT_KEY_WONDER_LAVAUX_QUOTE',			'[NEWLINE]"와인 한 병에는 세상의 모든 책보다 더 많은 철학이 담겨 있다."[NEWLINE] - 루이 파스퇴르[NEWLINE]'),
			('TXT_KEY_WONDER_LAVAUX_PEDIA',			'작성 필요'),
			('TXT_KEY_WONDER_LAVAUX_HELP',			'가능하다면 도시 범위 내에 2개의 새로운 [ICON_RES_WINE] 와인 자원을 배치합니다. 제국의 모든 도시에서 [ICON_HAPPINESS_3] 필요도 수정치가 10% 감소합니다. 이 도시가 점유한 호수에서 [ICON_FOOD] 식량 +1.[NEWLINE][NEWLINE]인접한 [ICON_RES_WINE] 와인: [ICON_FOOD] 식량 +1, [ICON_GOLD] 골드 +1, [ICON_PEACE] 신앙 +1.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]라보[ENDCOLOR]의 포도원은 독특한 [COLOR_GREY]포도[ENDCOLOR]의 잘 알려진 원천입니다(+2[ICON_RES_WINE]; +1[ICON_FOOD], +1[ICON_GOLD], +1[ICON_PEACE]/[ICON_RES_WINE]). 이 멋진 과일을 사용하여 모든 시민을 훨씬 더 행복하게 만드십시오(-10%[ICON_HAPPINESS_3][ICON_HAPPINESS_3] 필요도). 인근 [COLOR_CITY_GREEN]호수[ENDCOLOR](+1[ICON_FOOD][ICON_MUSHROOM])의 맑은 물도 도움이 됩니다.'
WHERE Tag = 'TXT_KEY_WONDER_LAVAUX_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_LAVAUX_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_LAVAUX_HELP';
				
UPDATE Language_ko_KR SET Text = '부지: [COLOR_CYAN]언덕[ENDCOLOR]; 특성: [COLOR_CYAN]호수[ENDCOLOR]; 도시: [COLOR_CYAN]와인 배치 공간[ENDCOLOR]; 지도: [COLOR_CYAN]지도에 와인[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_LAVAUX_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '부지: [COLOR_CYAN]언덕[ENDCOLOR]; 특성: [COLOR_CYAN]호수[ENDCOLOR]; 도시: [COLOR_CYAN]와인 배치 공간[ENDCOLOR]; 지도: [COLOR_CYAN]지도에 와인[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_LAVAUX_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Wartburg
INSERT INTO Language_ko_KR 
			(Tag,										Text)
VALUES		('TXT_KEY_BUILDING_WARTBURG',				'바르트부르크 성'),
			('TXT_KEY_WONDER_WARTBURG_QUOTE',			'[NEWLINE]"자연에서 우리는 결코 고립된 것을 보지 못하고, 그 앞에, 옆에, 아래에, 위에 있는 다른 것과 연결된 모든 것을 본다."[NEWLINE] - 요한 볼프강 폰 괴테[NEWLINE]'),
			('TXT_KEY_WONDER_WARTBURG_PEDIA',			'바르트부르크 성은 1067년 루트비히 데어 슈프링거가 그의 전통적인 영토를 확보하기 위해 지었습니다. 1172년부터 1211년까지 신성 로마 제국의 중요한 군주 궁정이자 시인들의 후원지였으며, 따라서 전설적인 장거크리크의 배경이 되었습니다. 파문당한 후, 마르틴 루터는 신약을 고대 그리스어에서 독일어로 번역할 때 바르트부르크에 머물렀습니다.[NEWLINE]수세기 동안 바르트부르크는 독일과 기독교 역사에서 그 중요성 때문에 순례지였습니다. 현대에 와서 바르트부르크는 인기 있는 관광 명소로 남아 있습니다. 종종 오페라 탄호이저를 상연합니다. 성에는 12세기부터 15세기까지의 원래 구조물이 여전히 남아 있지만, 내부의 대부분은 19세기에 만들어졌으며, 동독 시대 공산주의 통치하에 변형되었습니다.'),
			('TXT_KEY_THEMING_BONUS_WARTBURG',			'모든 국가에 영감을 준 문학'),
			('TXT_KEY_THEMING_BONUS_WARTBURG_HELP',		'보너스를 극대화하려면, 모든 위대한 작품 슬롯이 모두 당신이 만든 문학 작품으로 채워져 있는지 확인하십시오.'),
			('TXT_KEY_WONDER_WARTBURG_HELP',			'이 도시에서 [ICON_GREAT_WRITER] 위대한 작가 생성률 +30%. [ICON_GREAT_WORK] 위대한 문학 작품 슬롯 3개를 가집니다. [COLOR_POSITIVE_TEXT]테마[ENDCOLOR]가 있는 경우 [ICON_CULTURE] 문화 +3, [ICON_PEACE] 신앙 +3, [ICON_GOLDEN_AGE] 황금기 점수 +3. 이 불가사의의 각 [ICON_GREAT_WORK] 위대한 작품당 이 도시에서 훈련된 육상 유닛에 경험치 5. 제국의 모든 작가 길드는 [ICON_PEACE] 신앙 +1을 받습니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]바르트부르크 성[ENDCOLOR]으로 당신은 문학의 왕이 될 것입니다(+2[ICON_GREAT_WRITER]; +30%[ICON_GREAT_WRITER]). 이 문학 작품들은 새로운 서가에 보관될 수 있습니다(3[ICON_GREAT_WORK], 테마가 있는 경우: [ICON_CULTURE], [ICON_PEACE], [ICON_GOLDEN_AGE]). 제국에 [COLOR_YIELD_FOOD]작가 길드[ENDCOLOR](+1[ICON_PEACE][ICON_PEACE])를 건설하여 신앙 산출량을 늘리고, 도시 컬렉션을 사용하여 유닛의 경험치를 높이십시오(+5 XP/[ICON_GREAT_WORK] 내부/[COLOR_YIELD_GOLD]육상[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_WARTBURG_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_WARTBURG_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_WARTBURG_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]진보 완성[ENDCOLOR]; 특성: [COLOR_CYAN]숲[ENDCOLOR]; 건물: [COLOR_CYAN]작가 길드[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_WARTBURG_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]진보 완성[ENDCOLOR]; 건물: [COLOR_CYAN]작가 길드[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_WARTBURG_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Great Zimbabwe
INSERT INTO Language_ko_KR 
			(Tag,										Text) 
VALUES		('TXT_KEY_BUILDING_GREAT_ZIMBABWE',			'그레이트 짐바브웨'),
			('TXT_KEY_WONDER_GREAT_ZIMBABWE_QUOTE',		'[NEWLINE]"신은 선하지만, 사자와 춤추지 마라."[NEWLINE] - 짐바브웨 속담[NEWLINE]'),
			('TXT_KEY_WONDER_GREAT_ZIMBABWE_PEDIA',		'작성 필요'),
			('TXT_KEY_WONDER_GREAT_ZIMBABWE_HELP',		'[COLOR_POSITIVE_TEXT]추가[ENDCOLOR] [ICON_INTERNATIONAL_TRADE] 교역로 슬롯 1개를 얻습니다. 모든 도시에서 새 타일을 획득하는 [ICON_GOLD] 골드 비용이 30% 감소합니다. 각 활성 [ICON_INTERNATIONAL_TRADE] 교역로에 대해 이 도시에서 [ICON_GOLDEN_AGE] 황금기 점수 +2 및 육상 군사 유닛에 대한 [ICON_PRODUCTION] 생산력 +5%.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]그레이트 짐바브웨[ENDCOLOR]는 확장된 교역망(+1[ICON_INTERNATIONAL_TRADE])을 활용하여 제국의 산출량(+2[ICON_GOLDEN_AGE]/[ICON_INTERNATIONAL_TRADE][ICON_INTERNATIONAL_TRADE])과 군대 건설(+5% [ICON_PRODUCTION]/[COLOR_YIELD_GOLD]육상[ENDCOLOR]/[ICON_INTERNATIONAL_TRADE][ICON_INTERNATIONAL_TRADE])을 지원합니다. 재무부를 사용하여 이웃보다 더 많이 도시를 확장하십시오(-30%[ICON_GOLD][ICON_GOLD] 타일 비용).'
WHERE Tag = 'TXT_KEY_WONDER_GREAT_ZIMBABWE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_GREAT_ZIMBABWE_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_GREAT_ZIMBABWE_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]권위 완성[ENDCOLOR]; 지형: [COLOR_NEGATIVE_TEXT]해안[ENDCOLOR]; 시설: [COLOR_CYAN](광산 + 야영지) 3개[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GREAT_ZIMBABWE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]권위 완성[ENDCOLOR]; 지형: [COLOR_NEGATIVE_TEXT]해안[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GREAT_ZIMBABWE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Ahu Tongariki
INSERT INTO Language_ko_KR 
			(Tag,								Text) 
VALUES		('TXT_KEY_BUILDING_AHU',			'아후 통가리키'),
			('TXT_KEY_WONDER_AHU_QUOTE',		'[NEWLINE]"그 비유는 너무나 명백하다. 태평양에 고립된 이스터 섬 - 일단 섬이 곤경에 처하자, 그들은 벗어날 방법이 없었다. 도움을 받을 다른 사람도 없었다. 마찬가지로 우리 지구 행성에서, 우리가 우리 자신의 세계를 망치면, 우리는 도움을 받을 수 없을 것이다."[NEWLINE] - 재레드 다이아몬드[NEWLINE]'),
			('TXT_KEY_WONDER_AHU_PEDIA',		'작성 필요'),
			('TXT_KEY_WONDER_AHU_HELP',			'제국 내 [ICON_PEACE] 신앙 +10%. 이 도시가 점유한 숲 또는 정글에서 [ICON_PRODUCTION] 생산력 +1, 해안 타일에서 [ICON_PEACE] 신앙 +1. 제국의 채석장에서 [ICON_CULTURE] 문화 +1. [ICON_WORKER] 시설 건설 속도 +20%. 고유 사치 자원인 제비갈매기 알 1개를 부여합니다.');
			
UPDATE Language_ko_KR
SET Text = '거대한 플랫폼인 [COLOR_YIELD_FOOD]아후 통가리키[ENDCOLOR]는 인근에 [COLOR_CITY_GREEN]숲[ENDCOLOR]이나 [COLOR_CITY_GREEN]정글[ENDCOLOR](+1[ICON_PRODUCTION]/[ICON_MUSHROOM])이 있거나 새로운 노동자를 고용할 경우(+20%[ICON_WORKER]) 생산량을 크게 높입니다. 모든 [COLOR_CITY_BROWN]채석장[ENDCOLOR](+1[ICON_CULTURE]/[ICON_WORKER][ICON_WORKER])의 문화적 영향력과 새로운 [COLOR_GREY]고유 사치품[ENDCOLOR] 자원(+1 [ICON_RES_TERN]; +10%[ICON_PEACE][ICON_PEACE])의 지원을 받아 훨씬 더 밝은 미래로 나아갈 것입니다.'
WHERE Tag = 'TXT_KEY_WONDER_AHU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_AHU_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_AHU_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 특성: [COLOR_CYAN]숲/정글[ENDCOLOR]; 개선된 자원: [ICON_RES_STONE] [COLOR_CYAN]석재[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_AHU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_AHU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Falun Mine
INSERT INTO Language_ko_KR 
			(Tag,								Text) 
VALUES		('TXT_KEY_BUILDING_FALUN',			'팔룬 구리 광산'),
			('TXT_KEY_WONDER_FALUN_QUOTE',		'[NEWLINE]"채광은 수색 및 파괴 임무와 같다."[NEWLINE] - 스튜어트 유달[NEWLINE]'),
			('TXT_KEY_WONDER_FALUN_PEDIA',		'10세기부터 1992년까지 스웨덴 팔룬에서 운영된 팔룬 구리 광산은 유럽 구리 수요의 3분의 2를 생산했으며 17세기 스웨덴의 많은 전쟁 자금을 지원했습니다. 광산 운영은 17세기 동안 스웨덴에 구리에 대한 사실상의 독점권을 부여하여 강대국 시대의 다양한 전쟁 자금을 지원했지만, 광산의 생산량은 현대 기준으로 보면 미미했습니다. 1992년, 광산이 더 이상 경제적으로 실행 가능하지 않게 되자 상업적 채광이 중단되었습니다. 2001년, 팔룬 구리 광산은 유네스코 세계문화유산으로 지정되었습니다.'),
			('TXT_KEY_WONDER_FALUN_HELP',		'가능하다면 도시 범위 내에 2개의 새로운 [ICON_RES_COPPER] 구리 자원을 배치합니다. 이 도시가 점유한 광산에서 [ICON_GOLD] 골드 +1. 중세 또는 르네상스 시대에 건설 시 [COLOR_POSITIVE_TEXT]무료[ENDCOLOR] [ICON_GREAT_GENERAL] 위대한 장군 1명과 [ICON_GREAT_ENGINEER] 위대한 기술자 진행도 +100을 받습니다.[NEWLINE][NEWLINE]인접한 [ICON_RES_COPPER] 구리: [ICON_GOLD] 골드 +1 및 [ICON_GOLDEN_AGE] 황금기 점수 +1.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]팔룬[ENDCOLOR]의 광산 단지는 모든 어려운 투자를 가능하게 합니다. 엔지니어(건설 시 2%[ICON_GREAT_ENGINEER])나 군국주의자([COLOR_YIELD_GOLD]무료 [ICON_GREAT_GENERAL][ENDCOLOR])의 막대한 지원, 새로운 [COLOR_GREY]구리[ENDCOLOR] 매장지(+2[ICON_RES_COPPER]; +1[ICON_GOLD], +1[ICON_GOLDEN_AGE]/[ICON_RES_COPPER]), 그리고 더 가치 있는 지역 [COLOR_CITY_BROWN]광산[ENDCOLOR](+1[ICON_GOLD]/[ICON_WORKER])은 쉽게 세계의 리더십을 사들일 수 있습니다.'
WHERE Tag = 'TXT_KEY_WONDER_FALUN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_FALUN_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_FALUN_HELP';
				
UPDATE Language_ko_KR SET Text = '부지: [COLOR_CYAN]언덕[ENDCOLOR]; 시설: [COLOR_CYAN]광산 2개[ENDCOLOR]; 도시: [COLOR_CYAN]구리 배치 공간[ENDCOLOR]; 지도: [COLOR_CYAN]지도에 구리[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_FALUN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '부지: [COLOR_CYAN]언덕[ENDCOLOR]; 도시: [COLOR_CYAN]구리 배치 공간[ENDCOLOR]; 지도: [COLOR_CYAN]지도에 구리[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_FALUN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Forge of Damascus
INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_DAMASCUS',			'다마스쿠스 대장간'),
			('TXT_KEY_WONDER_DAMASCUS_QUOTE',		'[NEWLINE]"다마스쿠스 강철의 명성과 역사는 소총 총열을 자르거나 칼날 위로 떨어지는 머리카락을 자를 수 있는 능력과 같은 많은 전설을 낳았다. 그 제조 기술은 현대에도 아직 역설계되지 않았다."[NEWLINE] - 다마스쿠스 강철에 대한 전설에서[NEWLINE]'),
			('TXT_KEY_WONDER_DAMASCUS_PEDIA',		'다마스쿠스 강철은 우츠 강철로 만든 근동에서 검날을 제조하는 데 사용된 강철의 한 종류였습니다. 이 검들은 흐르는 물을 연상시키는 독특한 띠와 얼룩무늬 패턴이 특징입니다. 이러한 칼날은 강하고, 부서짐에 강하며, 날카롭고 탄력 있는 날로 연마될 수 있다고 알려져 있습니다.[NEWLINE][NEWLINE] 다마스쿠스 강철의 명성과 역사는 소총 총열을 자르거나 칼날 위로 떨어지는 머리카락을 자를 수 있는 능력과 같은 많은 전설을 낳았습니다. 많은 종류의 현대 강철이 고대 다마스쿠스 합금을 능가하지만, 생산 과정의 화학 반응으로 인해 다마스쿠스 강철은 초소성이고 동시에 매우 단단하여 당시로서는 칼날이 비범했습니다. [COLOR_NEGATIVE_TEXT]유닛 업그레이드 후 사라짐[ENDCOLOR].'),
			('TXT_KEY_PROMOTION_DAMASCUS',			'다마스쿠스 강철'),
			('TXT_KEY_PROMOTION_DAMASCUS_HELP',		'+10%[ICON_STRENGTH] 전투력.'),
			('TXT_KEY_WONDER_DAMASCUS_HELP',		'[COLOR_CYAN]야금술[ENDCOLOR] 발견 시 [ICON_PRODUCTION] 생산력 +3. 제국의 모든 근접 및 기마 유닛은 [COLOR_POSITIVE_TEXT]다마스쿠스 강철[ENDCOLOR] 진급을 얻습니다.[NEWLINE][NEWLINE]모든 [ICON_RES_IRON] 철: [ICON_PRODUCTION] 생산력 +1 및 [ICON_RESEARCH] 과학 +1.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]다마스쿠스 대장간[ENDCOLOR]은 최근의 과학적 발견 덕분에 당신의 근접 무기를 다른 어떤 대장간에서도 복제할 수 없는 걸작([COLOR_WATER_TEXT]다마스쿠스 강철[ENDCOLOR]/[COLOR_YIELD_GOLD]육상 근접[ENDCOLOR])으로 바꿉니다. 당신의 생산과 과학은 말 그대로 폭발적으로 증가하므로(+2[ICON_GREAT_SCIENTIST]), 사용 가능한 모든 [COLOR_GREY]철[ENDCOLOR] 매장지(+1[ICON_PRODUCTION], +1[ICON_RESEARCH]/[ICON_RES_IRON][ICON_RES_IRON])를 확보하는 것을 잊지 마십시오.'
WHERE Tag = 'TXT_KEY_WONDER_DAMASCUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_DAMASCUS_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_DAMASCUS_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]권위 완성[ENDCOLOR]; 특성: [COLOR_CYAN]담수[ENDCOLOR]; 개선된 자원: [ICON_RES_IRON] [COLOR_CYAN]철[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_DAMASCUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]권위 완성[ENDCOLOR]; 개선된 자원: [ICON_RES_IRON] [COLOR_CYAN]철[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_DAMASCUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Golden Dagon Pagoda
INSERT INTO Language_ko_KR 
			(Tag,											Text)
VALUES		('TXT_KEY_BUILDING_SHWEDAGON',					'쉐다곤 파고다'),
			('TXT_KEY_WONDER_SHWEDAGON_QUOTE',				'[NEWLINE]"인간과 영혼들 사이에 소동이 있었고, 눈먼 자는 사물을 보았고, 귀먹은 자는 소리를 들었다. 땅이 흔들리고, 번개가 치고, 보석이 무릎 깊이까지 비처럼 내렸으며, 히말라야의 모든 나무는 계절이 아님에도 꽃과 열매를 맺었다."[NEWLINE] - 오칼라파 왕[NEWLINE]'),
			('TXT_KEY_WONDER_SHWEDAGON_PEDIA',				'쉐다곤 파야(쉐다곤 파고다 또는 대용 파고다라고도 함)는 버마의 랑군 시에 위치한 거대한 불교 탑입니다. 현재 상태는 99미터 높이이며, 버마 민중이 기부한 금으로 덮여 탑을 유지하고 있습니다. 금이 언제 입혀졌는지는 알려져 있지 않지만, 탑 자체는 2,500년 이상 거슬러 올라간다고 합니다. 각 계승 왕조는 탑 위에 건물을 지었고, 1768년 지진 후 재건축 중에 현재의 99미터 높이에 도달했습니다. 쉐다곤 파야는 또한 5,448개의 다이아몬드와 2,317개의 루비로 된 왕관을 특징으로 합니다.'),
			('TXT_KEY_THEMING_BONUS_SHWEDAGON_KALPA',		'현재 겁의 네 이전 부처의 유물'),
			('TXT_KEY_THEMING_BONUS_SHWEDAGON_CONSECUTIVE',	'가장 최근 시대의 유물'),
			('TXT_KEY_THEMING_BONUS_SHWEDAGON_PLAYERS',		'다른 창작자의 유물'),
			('TXT_KEY_THEMING_BONUS_SHWEDAGON_ARTIFACTS',	'유물 다발'),
			('TXT_KEY_THEMING_BONUS_SHWEDAGON_HELP',		'보너스를 극대화하려면, 모든 위대한 작품 슬롯이 서로 다른 플레이어가 연속된 시대에 만든 유물로 채워져 있는지 확인하십시오.'),
			('TXT_KEY_PROMOTION_HIDDEN_ARTIFACTS',			'외교 여권'),
			('TXT_KEY_PROMOTION_HIDDEN_ARTIFACTS_HELP',		'+20% [ICON_WORKER] 작업 속도. 유닛은 [COLOR:255:230:85:255]국경 개방 협정 없이 적의 영토에 들어갈 수 있습니다(파낼 수는 없음)[ENDCOLOR].'),
			('TXT_KEY_WONDER_SHWEDAGON_HELP',				'제국의 모든 고고학자 유닛은 [COLOR_POSITIVE_TEXT]외교 여권[ENDCOLOR] 진급을 얻습니다. 예술가로부터 [ICON_PEACE] 신앙 +2. 제국의 모든 [ICON_GREAT_WORK] 위대한 작품은 [ICON_GOLD] 골드 +1을 받습니다. [ICON_GREAT_WORK] 위대한 예술품 슬롯 4개를 가집니다. [COLOR_POSITIVE_TEXT]테마[ENDCOLOR]가 있는 경우 [ICON_GOLD] 골드 +3, [ICON_CULTURE] 문화, [ICON_PEACE] 신앙, [ICON_TOURISM] 관광 +3.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]황금 파고다[ENDCOLOR]는 예술과 관련된 모든 측면에 완전히 집중합니다. 이 도시의 종교적이고 더 빈번한 예술가들(+2[ICON_GREAT_ARTIST]; +2[ICON_PEACE]/[ICON_GREAT_ARTIST][ICON_GREAT_ARTIST]), 제국의 더 가치 있는 위대한 작품들(+1[ICON_GOLD]/[ICON_GREAT_WORK][ICON_GREAT_WORK]), 그리고 새로운 예술을 위한 훨씬 더 많은 공간(4[ICON_GREAT_WORK], 테마가 있는 경우: [ICON_GOLD], [ICON_CULTURE], [ICON_PEACE], [ICON_TOURISM])은 당신의 도시를 빛나게 할 것입니다! 새로운 힘을 사용하여 숨겨진 유물을 찾으십시오([COLOR_WATER_TEXT]외교 여권[ENDCOLOR]/[COLOR_YIELD_GOLD]고고학자[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_SHWEDAGON_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_SHWEDAGON_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_SHWEDAGON_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]전통 완성[ENDCOLOR]; 부지: [COLOR_CYAN]언덕[ENDCOLOR]; 특성: [COLOR_CYAN]담수[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SHWEDAGON_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]전통 완성[ENDCOLOR]; 특성: [COLOR_CYAN]담수[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SHWEDAGON_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Mont St. Michel
INSERT INTO Language_ko_KR 
			(Tag,								Text) 
VALUES		('TXT_KEY_BUILDING_MICHEL',			'몽생미셸'),
			('TXT_KEY_WONDER_MICHEL_QUOTE',		'[NEWLINE]"교회와 국가, 영혼과 육체, 신과 인간은 모두 몽생미셸에서 하나이며, 모두의 일은 각자의 방식으로 싸우거나 서로를 지키는 것이다."[NEWLINE] - 헨리 애덤스[NEWLINE]'),
			('TXT_KEY_WONDER_MICHEL_PEDIA',		'노르망디와 브르타뉴 사이의 강력한 조수에 노출된 광대한 모래톱 한가운데에 있는 바위섬에 "서양의 경이"인 대천사 성 미카엘에게 헌정된 고딕 양식의 베네딕토회 수도원과 그 거대한 성벽 그늘에서 자라난 마을이 서 있습니다. 11세기에서 16세기 사이에 지어진 이 수도원은 이 독특한 자연 유적지가 제기하는 문제에 적응해야 했던 기술적, 예술적 역작입니다.'),
			('TXT_KEY_WONDER_MICHEL_HELP',		'이 도시가 건설된 도시에 [COLOR_POSITIVE_TEXT]무료[ENDCOLOR] 수도원을 제공합니다. 이 도시의 [ICON_STRENGTH] 전투력과 체력을 크게 증가시킵니다. [COLOR_CYAN]전기[ENDCOLOR] 발견 시 [ICON_GOLD] 골드 +3 및 [ICON_TOURISM] 관광 +3.');
			
UPDATE Language_ko_KR
SET Text = '외로운 [COLOR_YIELD_FOOD]몽생미셸[ENDCOLOR]은 당신의 취약한 [COLOR_YIELD_FOOD]수도원[ENDCOLOR]([ICON_FOOD]; [ICON_RESEARCH]; [ICON_PEACE])을 요새(+10[ICON_STRENGTH]; +100 HP)로 바꾸어, 당신이 영혼에 집중하고(+2[ICON_PEACE]/5 [ICON_CITIZEN]) 성장하는 재무부를 위한 다음 지출을 계획할 수 있게 해줍니다.'
WHERE Tag = 'TXT_KEY_WONDER_MICHEL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_MICHEL_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_MICHEL_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]단일 타일 섬[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MICHEL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]단일 타일 섬[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MICHEL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);		
----------------------------------------------------
-- Buyuk Han
INSERT INTO Language_ko_KR 
			(Tag,								Text) 
VALUES		('TXT_KEY_BUILDING_BUYUK_HAN',		'뷔위크 한'),
			('TXT_KEY_WONDER_BUYUK_HAN_QUOTE',	'[NEWLINE]"무역에는 우정이 없다."[NEWLINE] - 코넬리우스 밴더빌트[NEWLINE]'),
			('TXT_KEY_WONDER_BUYUK_HAN_PEDIA',	''),
			('TXT_KEY_WONDER_BUYUK_HAN_HELP',	'이 도시가 건설된 도시에 [COLOR_POSITIVE_TEXT]무료[ENDCOLOR] 대상 숙소와 [COLOR_POSITIVE_TEXT]무료[ENDCOLOR] 교역단을 제공합니다. 제국의 마을에서 [ICON_PRODUCTION] 생산력 +2. [COLOR_CYAN]기업[ENDCOLOR] 발견 시 [ICON_PRODUCTION] 생산력 +2 및 [ICON_GOLD] 골드 +3.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]뷔위크 한[ENDCOLOR]은 아름다운 [COLOR_YIELD_FOOD]대상 숙소[ENDCOLOR]([ICON_FOOD]; [ICON_PRODUCTION]; [ICON_GOLD]; [ICON_CULTURE]; [ICON_INTERNATIONAL_TRADE])로 넓은 교역 기회를 제공합니다. 새로운 [COLOR_YIELD_GOLD]무료 교역단[ENDCOLOR]을 사용하고, 새로운 도구로 [COLOR_CITY_BROWN]마을[ENDCOLOR](+2[ICON_PRODUCTION]/[ICON_WORKER][ICON_WORKER])의 장인 정신을 향상시키거나, 새로운 교역 파트너를 찾으십시오([COLOR_CYAN]기업[ENDCOLOR]: +2[ICON_PRODUCTION], +3[ICON_GOLD]).'
WHERE Tag = 'TXT_KEY_WONDER_BUYUK_HAN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_BUYUK_HAN_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_BUYUK_HAN_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]진보 완성[ENDCOLOR]; 부지: [COLOR_CYAN]평지[ENDCOLOR]; 지형: [COLOR_NEGATIVE_TEXT]해안[ENDCOLOR]; 시설: [COLOR_CYAN]마을[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BUYUK_HAN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]진보 완성[ENDCOLOR]; 부지: [COLOR_CYAN]평지[ENDCOLOR]; 지형: [COLOR_NEGATIVE_TEXT]해안[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BUYUK_HAN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);		
----------------------------------------------------
-- Itsukushima Shrine
INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_ITSUKUSHIMA',		'이쓰쿠시마 신사'),
			('TXT_KEY_WONDER_ITSUKUSHIMA_QUOTE',	'[NEWLINE]"신앙은 신사에 매달리는 것이 아니라 마음의 끝없는 순례이다."[NEWLINE] - 아브라함 조슈아 헤셸[NEWLINE]'),
			('TXT_KEY_WONDER_ITSUKUSHIMA_PEDIA',	'이쓰쿠시마 신사는 일본에서 가장 상징적인 신토 신사 중 하나입니다. 순례자들이 신사 경내에 들어가기 전에 배를 조종하여 통과해야 했던 상징적인 "떠 있는" 도리이 문으로 세계적으로 유명합니다. 일본의 "내해" 서쪽 끝에 있는 이쓰쿠시마 섬에 위치해 있습니다. 스이코 천황의 통치하에 628년경에 신사가 건설된 이래로 그 위치에 신사가 있었습니다. 그러나 현재의 디자인은 1168년으로 거슬러 올라가며, 무장 다이라노 기요모리가 제공한 자금으로 신사가 건설되었습니다.[NEWLINE][NEWLINE]  신사와 그 떠 있는 도리이는 아마노하시다테의 모래톱, 마쓰시마 만과 함께 "일본 3경" 중 하나입니다. 이들은 일본에서 가장 아름다운 풍경으로 지정되었으며 관광객들이 자주 찾습니다.'),
			('TXT_KEY_WONDER_ITSUKUSHIMA_HELP',		'환초에 [ICON_FOOD] 식량 +1, [ICON_CULTURE] 문화 +1, [ICON_PEACE] 신앙 +1을 제공하고 해안 도시에서 새 타일을 획득하는 [ICON_CULTURE] 문화 비용을 50% 감소시킵니다. 해양 타일에서 [ICON_PEACE] 신앙 +1. 제국의 모든 어선은 [ICON_CULTURE] 문화 +1을 받습니다.[NEWLINE][NEWLINE]인접한 [ICON_RES_CORAL] 산호: [ICON_PEACE] 신앙 +2.[NEWLINE]인접한 [ICON_RES_CRAB] 게: [ICON_PEACE] 신앙 +2.[NEWLINE]인접한 [ICON_RES_PEARLS] 진주: [ICON_PEACE] 신앙 +2.[NEWLINE]인접한 [ICON_RES_WHALE] 고래: [ICON_PEACE] 신앙 +2.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]이쓰쿠시마 신사[ENDCOLOR]는 인근 [COLOR_CITY_BLUE]바다[ENDCOLOR](+1[ICON_PEACE]/[ICON_FLOWER]), [COLOR_GREY]해양 사치품[ENDCOLOR](+2[ICON_PEACE]/[COLOR_GREY]해양 사치품[ENDCOLOR]), [COLOR_CITY_BROWN]어선[ENDCOLOR](+1[ICON_CULTURE]/[ICON_WORKER]) 및 모든 [COLOR_CITY_GREEN]환초[ENDCOLOR](+1[ICON_FOOD], +1[ICON_CULTURE], +1[ICON_PEACE]/[ICON_MUSHROOM][ICON_MUSHROOM])에서 생성되는 산출량을 증가시킵니다. 추가로 해안 도시의 확장이 훨씬 쉬워집니다(+50%[ICON_CULTURE][ICON_CULTURE] 국경 성장/모든 해안 도시).'
WHERE Tag = 'TXT_KEY_WONDER_ITSUKUSHIMA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_ITSUKUSHIMA_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_ITSUKUSHIMA_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 개선된 자원: [ICON_RES_CORAL] [COLOR_CYAN]산호[ENDCOLOR]/[ICON_RES_CRAB] [COLOR_CYAN]게[ENDCOLOR]/[ICON_RES_PEARLS] [COLOR_CYAN]진주[ENDCOLOR]/[ICON_RES_WHALE] [COLOR_CYAN]고래[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ITSUKUSHIMA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ITSUKUSHIMA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Qalhat
INSERT INTO Language_ko_KR 
			(Tag,								Text) 
VALUES		('TXT_KEY_BUILDING_QALHAT',			'칼하트'),
			('TXT_KEY_WONDER_QALHAT_QUOTE',		'[NEWLINE]"항구는 매우 크고 좋으며, 인도에서 온 상품을 실은 수많은 배들이 자주 드나든다. 이 도시에서 향신료와 다른 상품들이 내륙의 도시와 마을로 분배된다. 그들은 또한 많은 좋은 아랍 말을 이 도시에서 인도로 수출한다."[NEWLINE] - 마르코 폴로[NEWLINE]'),
			('TXT_KEY_WONDER_QALHAT_PEDIA',		'작성 필요'),
			('TXT_KEY_WONDER_QALHAT_HELP',		'[COLOR_POSITIVE_TEXT]추가[ENDCOLOR] [ICON_INTERNATIONAL_TRADE] 교역로 슬롯 1개를 얻습니다. 해상 [ICON_INTERNATIONAL_TRADE] 교역로는 [ICON_GOLD] 골드 +1을 얻습니다. 화물선 [ICON_PRODUCTION] 생산력 +50%. 다른 주요 플레이어와의 각 [ICON_INTERNATIONAL_TRADE] 해상 교역로에 대해 [ICON_CULTURE] 문화 +3.[NEWLINE][NEWLINE]인접한 [ICON_RES_HORSE] 말: [ICON_GOLD] 골드 +2.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]칼하트[ENDCOLOR]는 독특한 보급품을 찾는 일부 유럽 선원들이 언급한 곳으로(+1[ICON_GOLD]/[ICON_RES_HORSE]; +50%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]화물선[ENDCOLOR]), 모든 바다의 상인들이 만나 상품을 교환하는 멋진 장소입니다(해상 [ICON_INTERNATIONAL_TRADE]: +1[ICON_GOLD]). 전 세계 해상 무역을 독점하여 외국 문화를 배우십시오(주요국과의 해상 [ICON_INTERNATIONAL_TRADE][ICON_INTERNATIONAL_TRADE]당 3[ICON_CULTURE]).'
WHERE Tag = 'TXT_KEY_WONDER_QALHAT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_QALHAT_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_QALHAT_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 개선된 자원: [ICON_RES_HORSE] [COLOR_CYAN]말[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_QALHAT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 개선된 자원: [ICON_RES_HORSE] [COLOR_CYAN]말[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_QALHAT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Krak des Chevaliers
INSERT INTO Language_ko_KR 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_CHEVALIERS',			'크락 데 슈발리에'),
			('TXT_KEY_WONDER_CHEVALIERS_QUOTE',		'[NEWLINE]"나는 오래전부터 당신의 왕이 가장 명예롭고 용감한 사람이라는 것을 알고 있었지만, 그는 경솔하다."[NEWLINE] - 살라딘이 사자심왕 리처드 1세에게[NEWLINE]'),
			('TXT_KEY_WONDER_CHEVALIERS_PEDIA',		'크락 데 슈발리에(Crac des Chevaliers)는 시리아에 있는 십자군 성으로, 세계에서 가장 중요한 보존된 중세 성 중 하나입니다. 이 장소는 11세기에 쿠르드족 정착민에 의해 처음 거주되었으며, 그 결과 "쿠르드족의 성"을 의미하는 히슨 알 아크라드로 알려졌습니다. 1142년 트리폴리 백작 레이몽 2세에 의해 구호 기사단에게 주어졌습니다. 1271년에 함락될 때까지 그들의 소유로 남아 있었습니다. 크락 드 로스피탈로 알려지게 되었으며, 크락 데 슈발리에라는 이름은 19세기에 만들어졌습니다.'),
			('TXT_KEY_WONDER_CHEVALIERS_HELP',		'이 도시의 기마 및 공성 유닛의 [ICON_STRENGTH] 전투력을 크게 증가시키고 [ICON_PRODUCTION] 생산력을 +20% 증가시킵니다. [ICON_SILVER_FIST] 군사 유닛 공급 한도 +1. 다른 모든 [COLOR_POSITIVE_TEXT]비해안[ENDCOLOR] 도시는 [ICON_PEACE] 신앙 +1, [ICON_STRENGTH] 도시 방어력 +5, [ICON_SILVER_FIST] 군사 유닛 공급 한도 +1을 받습니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]크락 데 슈발리에[ENDCOLOR]는 언덕 꼭대기에 있는 성으로, 적에 대한 완벽한 방어(20[ICON_STRENGTH])와 다음 공격을 계획하기에 좋은 장소입니다. 병력 생산 증가(+20%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]기마[ENDCOLOR], [COLOR_YIELD_GOLD]공성[ENDCOLOR]), 뛰어난 리더십([COLOR_YIELD_GOLD]무료 [ICON_GREAT_GENERAL][ENDCOLOR]), 그리고 다른 모든 비해안 도시의 향상된 관리(+1[ICON_PEACE], +5[ICON_STRENGTH], +1[ICON_SILVER_FIST]/비해안 도시)는 당신의 영광의 시작에 불과합니다.'
WHERE Tag = 'TXT_KEY_WONDER_CHEVALIERS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_CHEVALIERS_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_CHEVALIERS_HELP';
				
UPDATE Language_ko_KR SET Text = '부지: [COLOR_CYAN]언덕[ENDCOLOR]; 특성: [COLOR_NEGATIVE_TEXT]물[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CHEVALIERS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_ko_KR SET Text = '지형: [COLOR_NEGATIVE_TEXT]해안[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CHEVALIERS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);		
----------------------------------------------------
-- University of Sankore
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]산코레 대학[ENDCOLOR]은 과학과 신앙을 성공적으로 결합합니다. 인근 [COLOR_YIELD_FOOD]모스크[ENDCOLOR]([ICON_RESEARCH]; [ICON_PEACE]; [ICON_GREAT_WORK]; [ICON_CULTURE]; [ICON_GOLDEN_AGE]; [ICON_HAPPINESS_3])는 영향력을 사용하여 가장 중요한 연구 프로젝트를 촉진하는 고귀한 위인들을 끌어들일 것입니다(50[ICON_RESEARCH]/[ICON_GREAT_PEOPLE]).'
WHERE Tag = 'TXT_KEY_WONDER_MOSQUE_OF_DJENNE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, 'Requires completion of [COLOR_MAGENTA]Tradition[ENDCOLOR] Branch. ', '') WHERE Tag ='TXT_KEY_WONDER_MOSQUE_OF_DJENNE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_ko_KR 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_MOSQUE_OF_DJENNE_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_MOSQUE_OF_DJENNE_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]전통 완성[ENDCOLOR]; 지형: [COLOR_CYAN]사막[ENDCOLOR]; 건물: [COLOR_CYAN]도서관[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MOSQUE_OF_DJENNE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]전통 완성[ENDCOLOR]; 지형: [COLOR_CYAN]사막[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MOSQUE_OF_DJENNE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Hagia Sophia
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]하기아 소피아[ENDCOLOR]는 당신의 종교를 완전히 재편성합니다. 새로운 예언자([COLOR_YIELD_GOLD]무료 [ICON_PROPHET][ENDCOLOR]), 최근 건설된 [COLOR_YIELD_FOOD]교회[ENDCOLOR]([ICON_PEACE]; [ICON_MISSIONARY]; [ICON_CULTURE]; [ICON_HAPPINESS_3]; [ICON_GREAT_WORK]), 그리고 반대파에 대한 압력 증가(+25%[ICON_MISSIONARY] 힘)는 다른 국가들 사이에서 당신의 의지를 강요할 것입니다.'
WHERE Tag = 'TXT_KEY_WONDER_HAGIA_SOPHIA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,									Text) 
SELECT		'TXT_KEY_WONDER_HAGIA_SOPHIA_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_HAGIA_SOPHIA_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_YIELD_PRODUCTION]성도[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HAGIA_SOPHIA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_YIELD_PRODUCTION]성도[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HAGIA_SOPHIA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Borobudur
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]보로부두르[ENDCOLOR]는 거대한 [COLOR_YIELD_FOOD]스투파[ENDCOLOR]([ICON_PEACE]; [ICON_MISSIONARY]; [ICON_RESEARCH]; [ICON_GOLDEN_AGE]; [ICON_TOURISM]; [ICON_HAPPINESS_3])로, 작은 행동에 집중하여 다른 도시들을 당신의 신앙으로 넘치게 할 수 있습니다(+5[ICON_PEACE]). 기존의 선교사를 사용하고 더 강력한 [COLOR_YIELD_GOLD]선교사[ENDCOLOR](+1[ICON_MISSIONARY] 전파)를 생산하여 적들을 빠르게 개종시키십시오.'
WHERE Tag = 'TXT_KEY_WONDER_BOROBUDUR_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, 'Must be built in a Holy City. ', '') WHERE Tag ='TXT_KEY_WONDER_BOROBUDUR_HELP';
	
INSERT INTO Language_ko_KR 
			(Tag,									Text) 
SELECT		'TXT_KEY_WONDER_BOROBUDUR_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_BOROBUDUR_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_YIELD_PRODUCTION]성도[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BOROBUDUR_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_YIELD_PRODUCTION]성도[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BOROBUDUR_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Alhambra
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]알함브라[ENDCOLOR]는 완전히 다른 두 문화의 건축적 혼합으로(+10%[ICON_CULTURE]), 당신의 확장을 지원하기 위해 특별한 기마 근접 유닛이 훈련되는 독특한 [COLOR_YIELD_FOOD]성[ENDCOLOR]([ICON_STRENGTH]; [ICON_SILVER_FIST]; [ICON_PRODUCTION]; [ICON_HAPPINESS_3]; [ICON_GREAT_WORK])으로 형성되었습니다([COLOR_WATER_TEXT]히네테[ENDCOLOR]/[COLOR_YIELD_GOLD]기마[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_ALHAMBRA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, 'Requires completion of [COLOR_MAGENTA]Authority[ENDCOLOR] Branch. ', '') WHERE Tag ='TXT_KEY_WONDER_ALHAMBRA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_ALHAMBRA_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_ALHAMBRA_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]권위 완성[ENDCOLOR]; 부지: [COLOR_CYAN]언덕[ENDCOLOR]; 특성: [COLOR_CYAN]숲[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ALHAMBRA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]권위 완성[ENDCOLOR]; 특성: [COLOR_CYAN]숲[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ALHAMBRA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Machu Picchu
UPDATE Language_ko_KR
SET Text = '도시가 [COLOR_CITY_BLUE]산[ENDCOLOR](+1[ICON_FOOD], +1[ICON_PRODUCTION], +1[ICON_CULTURE], +1[ICON_PEACE]/[ICON_FLOWER] 도시)으로 둘러싸여 있다면, [COLOR_YIELD_FOOD]마추픽추[ENDCOLOR]는 완벽한 선택입니다. 이 어려운 지형의 모든 도시 연결은 더 수익성이 높아지고(+15%[ICON_GOLD]/[ICON_CONNECTED][ICON_CONNECTED]), 자격을 갖춘 전문가들(+1[ICON_GREAT_MERCHANT])에 의해 재무부가 지원됩니다.'
WHERE Tag = 'TXT_KEY_WONDER_MACHU_PICHU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, 'City must be built within 2 tiles of a Mountain that is inside your territory. ', '') WHERE Tag ='TXT_KEY_WONDER_MACHU_PICHU_HELP';
	
INSERT INTO Language_ko_KR 
			(Tag,									Text) 
SELECT		'TXT_KEY_WONDER_MACHU_PICHU_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_MACHU_PICHU_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]산 2개[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MACHU_PICHU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]산[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MACHU_PICHU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Forbidden Palace
UPDATE Language_ko_KR
SET Text = '부유한 [COLOR_YIELD_FOOD]자금성[ENDCOLOR]은 위기에서 벗어나는 데 도움이 될 것입니다(-1[ICON_HAPPINESS_3] 빈곤). 제국 발전에 대한 막대한 투자(-15%[ICON_GOLD][ICON_GOLD] 구매 비용)와 새로운 상업 지구(+2[ICON_GREAT_MERCHANT])는 당신을 새로운 시대로 이끌 것입니다.'
WHERE Tag = 'TXT_KEY_WONDER_FORBIDDEN_PALACE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, 'Requires completion of [COLOR_MAGENTA]Progress[ENDCOLOR] Branch. ', '') WHERE Tag ='TXT_KEY_WONDER_FORBIDDEN_PALACE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_ko_KR 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_FORBIDDEN_PALACE_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_FORBIDDEN_PALACE_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]진보 완성[ENDCOLOR]; [COLOR_YIELD_GOLD]수도[ENDCOLOR]; 건물: [COLOR_CYAN]성벽[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_FORBIDDEN_PALACE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]진보 완성[ENDCOLOR]; [COLOR_YIELD_GOLD]수도[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_FORBIDDEN_PALACE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Rila Monastery (former Karlstejn)
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]릴라 수도원[ENDCOLOR]은 모든 [COLOR_YIELD_FOOD]기사단[ENDCOLOR]([ICON_PEACE]; [ICON_MISSIONARY]; [ICON_STRENGTH]; [ICON_SILVER_FIST]; [ICON_HAPPINESS_3])을 돌보고, 높은 기본 산출량(+3[ICON_CULTURE]; +4[ICON_PEACE])을 가지며, 종교 개혁 요구 사항을 낮춥니다(-5%[ICON_RELIGION] 추종자). 적들이 같은 일을 하기 전에 새로운 능력을 얻기 위해 사용하십시오!'
WHERE Tag = 'TXT_KEY_BUILDING_KARLSTEJN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, 'Must be built in a Holy City. ', '') WHERE Tag ='TXT_KEY_BUILDING_KARLSTEJN_HELP';
	
INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_BUILDING_KARLSTEJN_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_KARLSTEJN_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_YIELD_PRODUCTION]성도[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_KARLSTEJN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_YIELD_PRODUCTION]성도[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_KARLSTEJN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR SET Text = '릴라 수도원' WHERE Tag ='TXT_KEY_BUILDING_KARLSTEJN';
UPDATE Language_ko_KR SET Text = '[NEWLINE]"사랑이 없지만 사랑을 갖고 싶다면, 사랑의 일을 하라. 그러면 주님께서 당신의 소망과 노력을 보시고 당신의 마음에 사랑을 넣어 주실 것이다."[NEWLINE] - 옵티나의 성 암브로시우스[NEWLINE]' WHERE Tag ='TXT_KEY_WONDER_KARLSTEJN_QUOTE';
UPDATE Language_ko_KR SET Text = '작성 필요'||Text WHERE Tag ='TXT_KEY_CIV5_BUILDINGS_KARLSTEJN_TEXT';
----------------------------------------------------
-- Notre Dame
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]노트르담 대성당[ENDCOLOR]은 멋진 [COLOR_YIELD_FOOD]대성당[ENDCOLOR]([ICON_GOLD]; [ICON_PEACE]; [ICON_MISSIONARY]; [ICON_HAPPINESS_3])으로, 역사를 만들고 제국에 새로운 종교 시대를 시작합니다(+30% [ICON_PEACE] 종교적 압력/당신의 종교를 가진 모든 도시). 그 벽 뒤에 수집된 많은 인상적인 예술 작품(2[ICON_GREAT_WORK], 테마가 있는 경우: [ICON_PEACE], [ICON_GOLDEN_AGE])은 시민들을 훨씬 더 행복하게 만들 것입니다(+1[ICON_HAPPINESS_1]).'
WHERE Tag = 'TXT_KEY_BUILDING_NOTRE_DAME_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,									Text) 
SELECT		'TXT_KEY_BUILDING_NOTRE_DAME_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_NOTRE_DAME_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]전통 완성[ENDCOLOR]; 부지: [COLOR_CYAN]평지[ENDCOLOR]; 특성: [COLOR_CYAN]강[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_NOTRE_DAME_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]전통 완성[ENDCOLOR]; 특성: [COLOR_CYAN]강[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_NOTRE_DAME_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
----------------------------------------------------
-- Ait Benhaddou
INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_BENHADDOU',			'아이트 벤 하두'),
			('TXT_KEY_WONDER_BENHADDOU_QUOTE',		'[NEWLINE]"즐겁지 아니한가?"[NEWLINE] - 막시무스 데시무스 메리디우스[NEWLINE]'),
			('TXT_KEY_WONDER_BENHADDOU_PEDIA',		'아틀라스 산맥 기슭, 마라케시의 와르자자트 주에 아이트 벤 하두가 있습니다. 이 유적지는 사하라 사막 이전의 요새인 크사르로 유명하며, 남부 모로코 건축과 건축 방식으로 유명합니다. 건설에 대한 증거는 거의 없지만 - 가장 오래된 알려진 언급은 17세기에 불과함 - 남부 모로코 건축 양식의 사용은 제벨과 남부 계곡에서 훨씬 오래전부터 증명되었습니다. 요새의 유형은 다양합니다. 큰 집들이 중앙 안뜰과 연결되고, 네 개의 높은 날개가 모서리 탑으로 요새화되어 있으며, 일부 지역에서는 요새의 낮은 집과 안뜰과 연결됩니다. 모로코 건축의 전시물일 뿐만 아니라, 아이트 벤 하두는 ''나자렛 예수'', ''미이라'', ''글래디에이터'', ''페르시아의 왕자'' 등 여러 영화에도 등장했습니다.'),
			('TXT_KEY_WONDER_BENHADDOU_HELP',		'[COLOR_POSITIVE_TEXT]추가[ENDCOLOR] [ICON_INTERNATIONAL_TRADE] 교역로 슬롯 1개를 얻습니다. 이 도시가 점유한 강 타일에서 [ICON_FOOD] 식량 +1. 인근 마을은 [ICON_GOLD] 골드 +3 및 [ICON_TOURISM] 관광 +3을 받습니다. [COLOR_CYAN]라디오[ENDCOLOR] 발견 시 [ICON_TOURISM] 관광 +4.');
			
UPDATE Language_ko_KR
SET Text = '거대한 [COLOR_YIELD_FOOD]아이트 벤 하두[ENDCOLOR] [COLOR_CITY_BROWN]마을[ENDCOLOR](+3[ICON_GOLD], +3[ICON_TOURISM]/[ICON_WORKER])은 멋진 관광 명소이자 수많은 영화 프로젝트를 위한 이상적인 배경입니다([COLOR_CYAN]라디오[ENDCOLOR]: +4[ICON_TOURISM]). 이 사막 정착지는 또한 인근 [COLOR_CITY_GREEN]강[ENDCOLOR](+1[ICON_FOOD]/[ICON_MUSHROOM])에서 이익을 얻어 현재의 교역망을 확장합니다(+1[ICON_INTERNATIONAL_TRADE]).'
WHERE Tag = 'TXT_KEY_WONDER_BENHADDOU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_BENHADDOU_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_BENHADDOU_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]사막[ENDCOLOR]; 부지: [COLOR_CYAN]언덕[ENDCOLOR]; 시설: [COLOR_CYAN]마을[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BENHADDOU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]사막[ENDCOLOR]; 부지: [COLOR_CYAN]언덕[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BENHADDOU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Kilwa Kisiwani
INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_KILWA_KISIWANI',			'킬와 키시와니'),
			('TXT_KEY_WONDER_KILWA_KISIWANI_QUOTE',		'[NEWLINE]"킬와는 세계에서 가장 아름답게 지어진 도시 중 하나이다. 그곳의 집들은 전적으로 나무로 만들어졌고, 지붕은 밧줄 풀로 만들어졌으며, 비가 매우 세차게 내린다."[NEWLINE] - 이븐 바투타[NEWLINE]'),
			('TXT_KEY_WONDER_KILWA_KISIWANI_PEDIA',		'작성 필요'),
			('TXT_KEY_WONDER_KILWA_KISIWANI_HELP',		'[ICON_RES_PORCELAIN] 도자기와 [ICON_RES_JEWELRY] 보석 사본 1개를 받습니다. [COLOR_POSITIVE_TEXT]추가[ENDCOLOR] [ICON_INTERNATIONAL_TRADE] 교역로 슬롯 2개를 얻습니다. 이 도시가 점유한 전략 자원에서 [ICON_PRODUCTION] 생산력 +1, 사치 자원에서 [ICON_GOLD] 골드 +1.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]킬와 키시와니[ENDCOLOR] 교역 중심지(+2[ICON_INTERNATIONAL_TRADE])는 당신을 위해 몇 개의 [COLOR_GREY]도시 국가 사치품[ENDCOLOR](+1 [ICON_RES_JEWELRY]; +1 [ICON_RES_PORCELAIN])을 획득합니다. 더욱이, 당신의 영토에서 사용 가능한 자원으로부터 상당한 보너스를 받습니다(+1[ICON_PRODUCTION]/[COLOR_GREY]전략[ENDCOLOR]; +1[ICON_GOLD]/[COLOR_GREY]사치[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_KILWA_KISIWANI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_KILWA_KISIWANI_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_KILWA_KISIWANI_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]국가 경영 완성[ENDCOLOR]; 지형: [COLOR_CYAN]해안[ENDCOLOR]; 시설: [COLOR_CYAN](광산 + 야영지) 3개[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_KILWA_KISIWANI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]국가 경영 완성[ENDCOLOR]; 지형: [COLOR_CYAN]해안[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_KILWA_KISIWANI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- St. Peter's Basilica
INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_ST_PETERS',			'성 베드로 대성당'),
			('TXT_KEY_WONDER_ST_PETERS_QUOTE',		'[NEWLINE]"돌무더기는 한 사람이 대성당의 이미지를 품고 그것을 숙고하는 순간 돌무더기이기를 멈춘다."[NEWLINE] - 앙투안 드 생텍쥐페리[NEWLINE]'),
			('TXT_KEY_WONDER_ST_PETERS_PEDIA',		'바티칸 시국의 산 피에트로 대성당, 더 잘 알려진 성 베드로 대성당은 세계에서 가장 큰 기독교 교회 내부를 가진 후기 르네상스 교회입니다. 기원후 64년 사도 베드로의 매장지로 추정되는 곳에 몇 년 후 신전이 세워졌습니다. 신전을 대체하여 "옛" 성 베드로 대성당의 건설은 319년에서 333년 사이에 콘스탄티누스 황제에 의해 시작되었습니다.[NEWLINE][NEWLINE]  수세기에 걸쳐 심각하게 훼손된 후, 1505년 교황 율리오 2세는 옛 교회를 철거하고 기념비적인 구조물로 대체하기로 결정했으며, 이 건설 프로젝트는 여러 교황과 건축가들의 지휘 아래 다음 120년 동안 계속되었습니다. 거대한 프로젝트 자금을 조달하기 위해 여러 교황이 면죄부의 대량 판매를 승인했으며, 이 관행은 부분적으로 마르틴 루터의 개신교 운동으로 이어졌습니다.[NEWLINE][NEWLINE]  미켈란젤로, 라파엘로, 브라만테, 베르니니 등 르네상스의 주요 인물들의 작품으로, 이 교회는 현재 서양 문명의 위대한 보물 중 하나로 서 있습니다.'),
			('TXT_KEY_WONDER_ST_PETERS_HELP',		'이 도시가 건설된 도시에 [COLOR_POSITIVE_TEXT]무료[ENDCOLOR] 대성당과 3명의 [COLOR_POSITIVE_TEXT]무료[ENDCOLOR] 종교재판관을 제공합니다. 모든 고유 종교 건물에서 [ICON_HAPPINESS_1] 행복 +1. 게임 시작 시 6개의 [ICON_CITY_STATE] 도시 국가마다 [COLOR_POSITIVE_TEXT]추가[ENDCOLOR] [ICON_DOPLOMAT] 세계 회의 대표 1명을 받습니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]성 베드로 대성당[ENDCOLOR]은 종교적일 뿐만 아니라 외교적인(3명의 [COLOR_YIELD_GOLD]무료 종교재판관[ENDCOLOR]; 6[ICON_CITY_STATE] 시작 시 +1[ICON_DIPLOMAT] 연맹 투표) [COLOR_YIELD_FOOD]대성당[ENDCOLOR]([ICON_GOLD]; [ICON_PEACE]; [ICON_MISSIONARY]; [ICON_HAPPINESS_3])이기도 합니다. 종교에 투자하면 막대한 행복 부스트를 부여합니다(+1[ICON_HAPPINESS_1]/모든 종교 건물).'
WHERE Tag = 'TXT_KEY_WONDER_ST_PETERS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_ST_PETERS_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_ST_PETERS_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_YIELD_PRODUCTION]성도[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ST_PETERS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_ko_KR SET Text = '특수: [COLOR_YIELD_PRODUCTION]성도[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ST_PETERS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);		
----------------------------------------------------
-- Golden Pavilion
INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_KINKAKU_JI',			'금각사'),
			('TXT_KEY_WONDER_KINKAKU_JI_QUOTE',		'[NEWLINE]"책은 금의 집을 품고 있다."[NEWLINE] - 중국 속담[NEWLINE]'),
			('TXT_KEY_WONDER_KINKAKU_JI_PEDIA',		'금각사(문자 그대로 "금각의 사원")는 일본 교토에 있는 불교 사원입니다. 원래는 알려지지 않은 날짜에 별장으로 지어졌지만, 1397년 쇼군 아시카가 요시미츠가 사들여 별장을 금각사 단지로 개조했습니다. 그의 사후, 그의 아들에 의해 선종 사원으로 개조되었습니다.[NEWLINE][NEWLINE]  1950년 7월 정신 질환을 앓던 승려에 의해 불타버려 대대적인 복원 프로젝트가 진행되었습니다. 복원은 5년이 걸려 1955년에 완료되었습니다. 위층 두 층의 외부는 순금박으로 덮여 "금각"이라는 이름이 붙었지만, 1950년대 이전 버전에 금박이 있었는지는 불분명합니다.'),
			('TXT_KEY_WONDER_KINKAKU_JI_HELP',		'이 도시가 건설된 도시에 [COLOR_POSITIVE_TEXT]무료[ENDCOLOR] 파고다를 제공합니다. 각 호수에서 [ICON_FOOD] 식량 +1, [ICON_PEACE] 신앙 +1, [ICON_CULTURE] 문화 +1, 각 숲과 정글에서 [ICON_PEACE] 신앙 +1, [ICON_CULTURE] 문화 +1, 도시가 점유한 각 강 타일에서 [ICON_FOOD] 식량 +1. [ICON_GREAT_WORK] 위대한 문학 작품 슬롯 1개를 가집니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]금각사[ENDCOLOR]는 주변 자연과 강하게 연결되어 있습니다: [COLOR_CITY_GREEN]호수[ENDCOLOR](+1[ICON_FOOD], +1[ICON_CULTURE], +1[ICON_PEACE]/[ICON_MUSHROOM]), [COLOR_CITY_GREEN]숲[ENDCOLOR], [COLOR_CITY_GREEN]정글[ENDCOLOR](+1[ICON_CULTURE], +1[ICON_PEACE]/[ICON_MUSHROOM]), 그리고 [COLOR_CITY_GREEN]강[ENDCOLOR](+1[ICON_FOOD]/[ICON_MUSHROOM]). 언급된 자연은 평화로운 [COLOR_YIELD_FOOD]파고다[ENDCOLOR]([ICON_RELIGION]; [ICON_HAPPINESS_3])에서 여가를 보내는 작가들(1[ICON_GREAT_WORK])에게 항상 영감이었습니다.'
WHERE Tag = 'TXT_KEY_WONDER_KINKAKU_JI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_KINKAKU_JI_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_KINKAKU_JI_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]충성 완성[ENDCOLOR]; 특성: [COLOR_CYAN]담수[ENDCOLOR], [COLOR_CYAN]숲[ENDCOLOR]/[COLOR_CYAN]정글[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_KINKAKU_JI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]충성 완성[ENDCOLOR]; 특성: [COLOR_CYAN]담수[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_KINKAKU_JI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);		
----------------------------------------------------
-- Marae Arahurahu
INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_MARAE',				'마라에 아라후라후'),
			('TXT_KEY_WONDER_MARAE_QUOTE',			'[NEWLINE]"지도자는 앞에서, 일꾼은 뒤에서."[NEWLINE] - 마오리 속담[NEWLINE]'),
			('TXT_KEY_WONDER_MARAE_PEDIA',			'작성 필요'),
			('TXT_KEY_THEMING_BONUS_MARAE',			'전쟁 전 사기 진작 노래'),
			('TXT_KEY_THEMING_BONUS_MARAE_HELP',	'보너스를 극대화하려면, 모든 위대한 작품 슬롯이 모두 당신이 만든 음악으로 채워져 있는지 확인하십시오.'),
			('TXT_KEY_WONDER_MARAE_HELP',			'[ICON_GREAT_WORK] 위대한 음악 작품 슬롯 2개를 가집니다. [COLOR_POSITIVE_TEXT]테마[ENDCOLOR]가 있는 경우 [ICON_FOOD] 식량 +8 및 [ICON_CULTURE] 문화 +3. 이 불가사의의 각 [ICON_GREAT_WORK] 위대한 작품당 이 도시에서 훈련된 육상 및 해상 유닛에 경험치 15. 모든 원거리 육상 유닛은 [COLOR_POSITIVE_TEXT]마라에[ENDCOLOR] 진급을 얻고 모든 육상 유닛은 [COLOR_POSITIVE_TEXT]아라후라후[ENDCOLOR] 진급을 얻습니다. 유닛이 [COLOR_POSITIVE_TEXT]사망 시[ENDCOLOR] 10의 [ICON_PEACE] 신앙을 생성하며, 시대에 따라 증가합니다.'),
			('TXT_KEY_PROMOTION_MARAE',				'마라에'),
			('TXT_KEY_PROMOTION_MARAE_HELP',		'+10%[ICON_RANGE_STRENGTH] 원거리 전투력.'),
			('TXT_KEY_PROMOTION_ARAHURAHU',			'아라후라후'),
			('TXT_KEY_PROMOTION_ARAHURAHU_HELP',	'적 유닛의 [ICON_STRENGTH] 전투력의 120%를 [ICON_CULTURE] 문화로 [COLOR:255:230:85:255]처치 시[ENDCOLOR] 얻습니다.');

UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]마라에 아라후라후[ENDCOLOR]는 당신의 병사들을 크게 지원하며([COLOR_WATER_TEXT]마라에[ENDCOLOR]/[COLOR_YIELD_GOLD]원거리 육상[ENDCOLOR]), 이는 이제부터 당신 군대의 핵심이 되어야 합니다. 동기 부여된 유닛은 전투 결과에 관계없이 보상을 받습니다([COLOR_WATER_TEXT]아라후라후[ENDCOLOR]/[COLOR_YIELD_GOLD]육상 군사[ENDCOLOR]; 10[ICON_PEACE]/사망 시). 도시의 위대한 작품은 유닛이 얻는 경험치를 증가시킨다는 것을 기억하십시오(+1[ICON_GREAT_MUSICIAN]; 2[ICON_GREAT_WORK], 테마가 있는 경우: [ICON_FOOD], [ICON_CULTURE]; +15 XP/[ICON_GREAT_WORK] 내부/[COLOR_YIELD_GOLD]육상[ENDCOLOR], [COLOR_YIELD_GOLD]해상[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_MARAE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_MARAE_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_MARAE_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]초원[ENDCOLOR], [COLOR_CYAN]해안[ENDCOLOR]; 건물: [COLOR_CYAN]정원[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MARAE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MARAE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);		
----------------------------------------------------
-- Old Bridge
INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_OLD_BRIDGE',			'모스타르의 오래된 다리'),
			('TXT_KEY_WONDER_OLD_BRIDGE_QUOTE',		'[NEWLINE]"난민은 살아남아 미래를 창조할 수 있는 사람이다."[NEWLINE] - 아멜라 콜루더[NEWLINE]'),
			('TXT_KEY_WONDER_OLD_BRIDGE_PEDIA',		'작성 필요'),
			('TXT_KEY_WONDER_OLD_BRIDGE_HELP',		'[COLOR_POSITIVE_TEXT]무료[ENDCOLOR] [ICON_DIPLOMAT] 위대한 외교관 1명과 [COLOR_POSITIVE_TEXT]추가[ENDCOLOR] [ICON_DOPLOMAT] 세계 회의 대표 2명을 받습니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]모스타르의 오래된 다리[ENDCOLOR]는 평화와 번영을 향한 당신의 부름입니다(+2[ICON_DIPLOMAT] 연맹 투표; +1[ICON_HAPPINESS_1]). 당신의 외교적 힘([COLOR_YIELD_GOLD]무료 [ICON_DIPLOMAT][ENDCOLOR]; +2[ICON_DIPLOMAT])을 사용하여 국가들을 당신 편으로 만드십시오.'
WHERE Tag = 'TXT_KEY_WONDER_OLD_BRIDGE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_OLD_BRIDGE_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_OLD_BRIDGE_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]국가 경영 완성[ENDCOLOR]; 부지: [COLOR_CYAN]언덕[ENDCOLOR]; 특성: [COLOR_CYAN]강[ENDCOLOR]; 플레이어: [COLOR_CYAN]평화 상태[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_OLD_BRIDGE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]국가 경영 완성[ENDCOLOR]; 특성: [COLOR_CYAN]강[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_OLD_BRIDGE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);		
----------------------------------------------------
-- Meenakshi Temple
INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_MEENAKSHI',			'미낙시 사원'),
			('TXT_KEY_WONDER_MEENAKSHI_QUOTE',		'[NEWLINE]"우리는 당신을 맞이합니다, 데비 미낙시, 천만 개의 태양처럼 빛나고, 팔찌와 화환으로 장식된 그녀... 길조이며, 존재를 구현하는 그녀. 나는 항상 당신에게 절합니다, 당신의 연민은 바다와 같습니다."[NEWLINE] - 아디 샹카라[NEWLINE]'),
			('TXT_KEY_WONDER_MEENAKSHI_PEDIA',		'작성 필요'),
			('TXT_KEY_WONDER_MEENAKSHI_HELP',		'이 도시가 건설된 도시에 [COLOR_POSITIVE_TEXT]무료[ENDCOLOR] 만디르를 제공합니다. [ICON_PEACE] 신앙 구매의 20%를 [ICON_FOOD] 식량으로 전환합니다. 제국의 모든 [ICON_GREAT_WORK] 위대한 작품은 [ICON_FOOD] 식량 +1을 받습니다. 이 도시가 점유한 호수와 강 타일에서 [ICON_PEACE] 신앙 +1.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]만디르[ENDCOLOR]([ICON_FOOD]; [ICON_PEACE]; [ICON_HAPPINESS_3]; [ICON_GREAT_WORK]; [ICON_SPY])는 [COLOR_YIELD_FOOD]미낙시[ENDCOLOR]를 찬양하며, 이 다채로운 불가사의에 감탄한 당신의 백성들의 신앙을 증가시킵니다(+1[ICON_PEACE]/4 [ICON_CITIZEN][ICON_CITIZEN]). 인근 [COLOR_CITY_GREEN]호수[ENDCOLOR]와 [COLOR_CITY_GREEN]강[ENDCOLOR](+1[ICON_PEACE]/[ICON_MUSHROOM])의 물은 당신의 성장을 촉진하며, 종교 프로젝트에 투자하거나(20%[ICON_PEACE] 신앙 구매를 [ICON_FOOD]으로 전환) 예술에 헌신함으로써(+1[ICON_FOOD]/[ICON_GREAT_WORK][ICON_GREAT_WORK]) 더욱 성장할 수 있습니다.'
WHERE Tag = 'TXT_KEY_WONDER_MEENAKSHI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_MEENAKSHI_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_MEENAKSHI_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_YIELD_PRODUCTION]성도[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MEENAKSHI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_ko_KR SET Text = '특수: [COLOR_YIELD_PRODUCTION]성도[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MEENAKSHI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);		
----------------------------------------------------
-- Peterhof
INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_PETERHOF',			'페테르호프 궁전'),
			('TXT_KEY_WONDER_PETERHOF_QUOTE',		'[NEWLINE]"내 신민을 개혁하려는 나의 큰 소망에도 불구하고, 나는 나 자신을 개혁할 수 없음을 고백하기 부끄럽다."[NEWLINE] - 표트르 대제[NEWLINE]'),
			('TXT_KEY_WONDER_PETERHOF_PEDIA',		'페테르호프 궁전은 러시아 상트페테르부르크에 위치한 궁전과 정원 시리즈로, 표트르 대제의 명령에 따라 조성되었습니다. 이 궁전과 정원은 때때로 "러시아의 베르사유"라고 불립니다. 궁전-앙상블은 도심과 함께 유네스코 세계문화유산으로 인정받고 있습니다.'),
			('TXT_KEY_WONDER_PETERHOF_HELP',		'+10% [ICON_GREAT_PEOPLE] 위인 생성률. 이 도시에서 20턴의 [ICON_HAPPINESS_1] WLTKD를 시작합니다. [ICON_HAPPINESS_1] WLTKD 동안 [ICON_PRODUCTION] 생산력 및 [ICON_GOLD] 골드 +15%, [ICON_GOLDEN_AGE] 황금기 점수 +25%.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]페테르호프 궁전[ENDCOLOR]은 시민들에게 당신이 그들의 삶을 개선하기 위해 가능한 모든 것을 할 의지가 있음을 알리고(+6[ICON_GOLDEN_AGE]; 20[ICON_HAPPINESS_1] WLTKD 턴), 그들도 당신에게 똑같이 응답합니다(+15%[ICON_PRODUCTION], +15%[ICON_GOLD], +25%[ICON_GOLDEN_AGE] WLTKD 동안). 이러한 번영은 당신의 도시를 방문하려는 모든 종류의 귀족들에게 강력한 초대장입니다(+10%[ICON_GREAT_PEOPLE]).'
WHERE Tag = 'TXT_KEY_WONDER_PETERHOF_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_PETERHOF_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_PETERHOF_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 부지: [COLOR_CYAN]평지[ENDCOLOR]; 개선된 자원 [COLOR_CYAN][ICON_RES_IRON] 철[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PETERHOF_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PETERHOF_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);		
----------------------------------------------------
-- Bakken
INSERT INTO Language_ko_KR 
			(Tag,								Text) 
VALUES		('TXT_KEY_BUILDING_BAKKEN',			'바켄'),
			('TXT_KEY_WONDER_BAKKEN_QUOTE',		'[NEWLINE]"오락은 우리가 생각할 필요가 없기 때문에 매력적이다. 그것은 그렇지 않으면 우리의 생각을 잡아먹을 수 있는 두려움과 불안으로부터 우리를 구해준다."[NEWLINE] - 존 오트버그[NEWLINE]'),
			('TXT_KEY_WONDER_BAKKEN_PEDIA',		'작성 필요'),
			('TXT_KEY_WONDER_BAKKEN_HELP',		'이 도시에서 10턴의 [ICON_HAPPINESS_1] WLTKD를 시작합니다. [ICON_HAPPINESS_1] WLTKD 동안 [ICON_TOURISM] 관광 +33%.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]바켄[ENDCOLOR]은 최고 수준의 오락을 제공하며(+3[ICON_HAPPINESS_1]), 관광객 유입과 그 수익을 크게 증가시킵니다(10[ICON_HAPPINESS_1] WLTKD 턴; +33%[ICON_TOURISM]/[ICON_HAPPINESS_1] WLTKD).'
WHERE Tag = 'TXT_KEY_WONDER_BAKKEN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_BAKKEN_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_BAKKEN_HELP';
				
UPDATE Language_ko_KR SET Text = '부지: [COLOR_CYAN]언덕[ENDCOLOR]; 플레이어: [COLOR_CYAN]행복도 > 70%[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BAKKEN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_ko_KR SET Text = ''||Text WHERE Tag ='TXT_KEY_WONDER_BAKKEN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);		
----------------------------------------------------
-- House of Trades of the Indies
INSERT INTO Language_ko_KR 
			(Tag,										Text) 
VALUES		('TXT_KEY_BUILDING_HOUSE_OF_TRADE',			'인디아스 무역의 집'),
			('TXT_KEY_WONDER_HOUSE_OF_TRADE_QUOTE',		'[NEWLINE]"경계선 서쪽에 있는 다른 모든 땅은 카스티야의 왕과 여왕, 그리고 그들의 후계자에게 속한다."[NEWLINE] - 토르데시야스 조약[NEWLINE]'),
			('TXT_KEY_WONDER_HOUSE_OF_TRADE_PEDIA',		'작성 필요'),
			('TXT_KEY_WONDER_HOUSE_OF_TRADE_HELP',		'[COLOR_POSITIVE_TEXT]무료[ENDCOLOR] [ICON_GREAT_ADMIRAL] 위대한 제독 1명을 받습니다. [COLOR_POSITIVE_TEXT]추가[ENDCOLOR] [ICON_INTERNATIONAL_TRADE] 교역로 슬롯 2개를 얻습니다. 해군 군사 유닛 및 화물선에 대한 [ICON_PRODUCTION] 생산력 +10%.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]무역의 집[ENDCOLOR]은 당신의 군대와 무역을 너무나 긴밀하게 결합시켜 자연스럽게 느껴지게 합니다(+10%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]해군[ENDCOLOR], [COLOR_YIELD_GOLD]화물선[ENDCOLOR]). 새로운 해군 리더십([COLOR_YIELD_GOLD]무료 [ICON_GREAT_ADMIRAL][ENDCOLOR])과 새로운 가능한 교역로(+2[ICON_INTERNATIONAL_TRADE])는 당신을 모든 바다의 지배자로 만들어 줄 것입니다.'
WHERE Tag = 'TXT_KEY_WONDER_HOUSE_OF_TRADE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_HOUSE_OF_TRADE_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_HOUSE_OF_TRADE_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 플레이어: [COLOR_CYAN]동맹 도시 국가 2개[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HOUSE_OF_TRADE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HOUSE_OF_TRADE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Solovietsky Monastery
INSERT INTO Language_ko_KR 
			(Tag,										Text) 
VALUES		('TXT_KEY_BUILDING_SOLOVIETSKY',			'솔로베츠키 수도원'),
			('TXT_KEY_WONDER_SOLOVIETSKY_QUOTE',		'[NEWLINE]"모든 것은 사랑 앞에서 패배한다."[NEWLINE] - 비토브니차의 타데우스 장로[NEWLINE]'),
			('TXT_KEY_WONDER_SOLOVIETSKY_PEDIA',		'솔로베츠키 수도원은 러시아 북부 백해의 솔로베츠키 제도에 위치한 요새화된 수도원입니다. 1926-39년에 소련의 감옥 및 노동 수용소로 전환되기 전까지 북부 러시아에서 가장 큰 기독교 성채 중 하나였으며, 굴라크 시스템의 수용소 원형 역할을 했습니다. 수도원은 여러 차례 큰 변화와 군사적 포위를 겪었습니다. 가장 중요한 구조물은 필리프 콜리체프가 수도원장(대수도원장과 유사)이었던 16세기에 만들어졌습니다.'),
			('TXT_KEY_WONDER_SOLOVIETSKY_HELP',			'이 도시가 점유한 툰드라 타일에서 [ICON_PRODUCTION] 생산력 +1 및 [ICON_PEACE] 신앙 +1. 이 도시의 [ICON_STRENGTH] 전투력과 체력을 크게 증가시킵니다. [ICON_SILVER_FIST] 군사 유닛 공급 한도 +1. 해군 군사 유닛에 대한 [ICON_PRODUCTION] 생산력 +15%.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]솔로베츠키 수도원[ENDCOLOR]은 당신의 약한 [COLOR_CITY_BLUE]툰드라[ENDCOLOR](+1[ICON_PRODUCTION], +1[ICON_PEACE]/[ICON_FLOWER]) 타일을 크게 지원합니다. 해군 증강을 신속하게 돕고(+25%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]해군[ENDCOLOR]), 도시의 공격 및 방어 능력을 강화합니다(+10[ICON_STRENGTH]; +50 HP; +1[ICON_SILVER_FIST]).'
WHERE Tag = 'TXT_KEY_WONDER_SOLOVIETSKY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_SOLOVIETSKY_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_SOLOVIETSKY_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]충성 완성[ENDCOLOR]; 지형: [COLOR_CYAN]툰드라[ENDCOLOR], [COLOR_CYAN]해안[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SOLOVIETSKY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]충성 완성[ENDCOLOR]; 지형: [COLOR_CYAN]툰드라[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SOLOVIETSKY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);		
----------------------------------------------------
-- Aqueduct of Padre Tembleque
INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_TEMBLEQUE',			'파드레 템블레케 수도교'),
			('TXT_KEY_WONDER_TEMBLEQUE_QUOTE',		'[NEWLINE]"멕시코는 다양한 현실과 아름다움의 모자이크다."[NEWLINE] - 엔리케 페냐 니에토[NEWLINE]'),
			('TXT_KEY_WONDER_TEMBLEQUE_PEDIA',		'작성 필요'),
			('TXT_KEY_WONDER_TEMBLEQUE_HELP',		'이 도시의 사막 타일에 [ICON_FOOD] 식량 +1. 모든 수도교는 [ICON_PRODUCTION] 생산력 +1 및 [ICON_PEACE] 신앙 +1을 얻습니다. 모든 도시에서 [ICON_PEACE] 신앙 구매의 5%를 [ICON_PRODUCTION] 생산력으로 전환합니다.[NEWLINE][NEWLINE]제국 내 [ICON_FOOD]/[ICON_PRODUCTION] 고통으로 인한 [ICON_HAPPINESS_3] 불행 -1.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]파드레 템블레케 수도교[ENDCOLOR]는 [COLOR_CITY_BLUE]사막[ENDCOLOR]과 같은 거주 불가능한 장소를 다시 번영하게 만들고(+1[ICON_FOOD]/[ICON_FLOWER]), 물이 이전만큼 부족하지 않아 사람들을 행복하게 만듭니다(-1[ICON_HAPPINESS_3][ICON_HAPPINESS_3] [ICON_FOOD]/[ICON_PRODUCTION] 고통). 이 모든 것은 단 한 명의 선견지명 있는 수도사의 종교적 헌신 덕분입니다(+1[ICON_PRODUCTION], +1[ICON_PEACE]/모든 [COLOR_YIELD_FOOD]수도교[ENDCOLOR]; 5%[ICON_PEACE][ICON_PEACE] 신앙 구매를 [ICON_PRODUCTION]으로 전환).'
WHERE Tag = 'TXT_KEY_WONDER_TEMBLEQUE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_TEMBLEQUE_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_TEMBLEQUE_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]사막[ENDCOLOR]; [COLOR_NEGATIVE_TEXT]해안[ENDCOLOR]; 특성: [COLOR_CYAN]담수[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_TEMBLEQUE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특성: [COLOR_CYAN]담수[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_TEMBLEQUE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Globe Theater
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]글로브 극장[ENDCOLOR]은 모든 예술 직업을 하나의 불가사의로 통합하지만(+2[ICON_GOLDEN_AGE]/[ICON_GREAT_ARTIST][ICON_GREAT_ARTIST], [ICON_GREAT_WRITER][ICON_GREAT_WRITER], [ICON_GREAT_MUSICIAN][ICON_GREAT_MUSICIAN]), 문학에 대한 훨씬 더 강한 집중은 명백합니다([COLOR_YIELD_GOLD]무료 [ICON_GREAT_WRITER][ENDCOLOR]; 2[ICON_GREAT_WORK], 테마가 있는 경우: [ICON_GOLD]). 이 불가사의는 너무나 영향력이 커서 사람들의 취향이 당신의 의지에 따라 변합니다(-1[ICON_HAPPINESS_3] 지루함; -1[ICON_HAPPINESS_3][ICON_HAPPINESS_3] 도시화).'
WHERE Tag = 'TXT_KEY_WONDER_GLOBE_THEATER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_GLOBE_THEATER_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_GLOBE_THEATER_HELP';
				
UPDATE Language_ko_KR SET Text = '특성: [COLOR_CYAN]강[ENDCOLOR]; 건물: [COLOR_CYAN]원형 극장[ENDCOLOR], [COLOR_CYAN]목욕탕[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GLOBE_THEATER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '건물: [COLOR_CYAN]원형 극장[ENDCOLOR], [COLOR_CYAN]목욕탕[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GLOBE_THEATER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Chichen Itza
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]치첸이트사[ENDCOLOR]는 당신의 황금기를 훨씬 더 중요하게 만듭니다(+50%[ICON_GOLDEN_AGE] 길이). 당신의 시민들은 (-10%[ICON_HAPPINESS_3][ICON_HAPPINESS_3]) 특히 새로운 [COLOR_YIELD_FOOD]테오칼리[ENDCOLOR]를 방문할 때 더욱 그럴 것입니다. 그것을 건설하면 당신의 백성들이 당신을 경외할 것입니다.'
WHERE Tag = 'TXT_KEY_WONDER_CHICHEN_ITZA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,									Text) 
SELECT		'TXT_KEY_WONDER_CHICHEN_ITZA_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_CHICHEN_ITZA_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]평원[ENDCOLOR]; 부지: [COLOR_CYAN]평지[ENDCOLOR]; 특성: [COLOR_CYAN]숲[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CHICHEN_ITZA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]평원[ENDCOLOR]; 부지: [COLOR_CYAN]평지[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CHICHEN_ITZA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Himeji Castle
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]히메지 성[ENDCOLOR]은 일반적인 [COLOR_YIELD_FOOD]성[ENDCOLOR]([ICON_STRENGTH]; [ICON_SILVER_FIST]; [ICON_PRODUCTION]; [ICON_HAPPINESS_3]; [ICON_GREAT_WORK])을 뚫을 수 없는 요새로 바꿉니다(+10%[ICON_STRENGTH][ICON_STRENGTH]). 더욱이, 더 큰 군대를 만들 수 있고(+5[ICON_SILVER_FIST]) 당신의 영토에 있는 모든 유닛은 전투 보너스를 받습니다([COLOR_WATER_TEXT]히메지 성[ENDCOLOR]/[COLOR_YIELD_GOLD]군사[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_HIMEJI_CASTLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_HIMEJI_CASTLE_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_HIMEJI_CASTLE_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 부지: [COLOR_CYAN]언덕[ENDCOLOR]; 특성: [COLOR_CYAN]숲[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HIMEJI_CASTLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 부지: [COLOR_CYAN]언덕[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HIMEJI_CASTLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Leaning Tower of Pisa
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]피사의 사탑[ENDCOLOR]은 당신과 협력하고 싶어하는 많은 영향력 있는 귀족들의 관심을 끌게 합니다([COLOR_YIELD_GOLD]무료 [ICON_GREAT_PEOPLE][ENDCOLOR]). 그들의 최종 목적지는 이 도시뿐만 아니라(+25%[ICON_GREAT_PEOPLE]), 당신의 제국에 있는 다른 모든 도시이기도 합니다(+10%[ICON_GREAT_PEOPLE][ICON_GREAT_PEOPLE]).'
WHERE Tag = 'TXT_KEY_WONDER_LEANING_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_LEANING_TOWER_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_LEANING_TOWER_HELP';
				
UPDATE Language_ko_KR SET Text = '부지: [COLOR_CYAN]평지[ENDCOLOR]; 특성: [COLOR_CYAN]물[ENDCOLOR], [COLOR_CYAN]습지[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_LEANING_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특성: [COLOR_CYAN]물[ENDCOLOR], [COLOR_CYAN]습지[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_LEANING_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Porcelain Tower
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]도자기 탑[ENDCOLOR]은 시민들의 교육을 향상시키고(-1[ICON_HAPPINESS_3] 문맹), 새로운 위인들을 도시에 초대하며([COLOR_YIELD_GOLD]무료 [ICON_GREAT_SCIENTIST][ENDCOLOR]; +2[ICON_GREAT_SCIENTIST]), 당신이 생산하는 전반적인 연구를 활용하는 훌륭한 과학 건물입니다(+10%[ICON_RESEARCH]).'
WHERE Tag = 'TXT_KEY_WONDER_PORCELAIN_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_PORCELAIN_TOWER_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_PORCELAIN_TOWER_HELP';
				
UPDATE Language_ko_KR SET Text = '특성: [COLOR_CYAN]강[ENDCOLOR]; 플레이어: [COLOR_CYAN]동맹 도시 국가 2개[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PORCELAIN_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특성: [COLOR_CYAN]강[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PORCELAIN_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Taj Mahal
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]타지마할[ENDCOLOR]은 당신이 들어가는 황금기의 수를 극대화하고(황금기 시작; 2[ICON_CITIZEN]당 +1[ICON_GOLDEN_AGE]), 도시의 여러 종교로부터 이익을 얻습니다(+3[ICON_RESEARCH], +3[ICON_CULTURE], +3[ICON_PEACE]/[ICON_RELIGION]). 그들이 떠나게 두지 마십시오!'
WHERE Tag = 'TXT_KEY_WONDER_TAJ_MAHAL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_TAJ_MAHAL_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_TAJ_MAHAL_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_NEGATIVE_TEXT]해안[ENDCOLOR]; 부지: [COLOR_CYAN]평지[ENDCOLOR]; 특성: [COLOR_CYAN]강[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_TAJ_MAHAL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '부지: [COLOR_CYAN]평지[ENDCOLOR]; 특성: [COLOR_CYAN]강[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_TAJ_MAHAL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Uffizi
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]우피치 미술관[ENDCOLOR]은 일종의 [COLOR_YIELD_FOOD]갤러리[ENDCOLOR]([ICON_GOLD], [ICON_GREAT_WORK], [ICON_GREAT_ARTIST], [ICON_TOURISM])로서 재능 있는 예술가들에게 완벽한 장소입니다([COLOR_YIELD_GOLD]무료 [ICON_GREAT_ARTISTS][ENDCOLOR]; 3[ICON_GREAT_WORK], 테마가 있는 경우: [ICON_CULTURE]; +1[ICON_CULTURE]/[ICON_GREAT_WORK][ICON_GREAT_WORK]). 이 불가사의는 또한 제국의 도시화 문제를 거의 모두 해결합니다(-1[ICON_HAPPINESS_3][ICON_HAPPINESS_3] 도시화).'
WHERE Tag = 'TXT_KEY_WONDER_UFFIZI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_UFFIZI_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_UFFIZI_HELP';
				
UPDATE Language_ko_KR SET Text = '특성: [COLOR_CYAN]강[ENDCOLOR]; 위대한 작품: [COLOR_CYAN]위대한 예술품 3개[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_UFFIZI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = ''||Text WHERE Tag ='TXT_KEY_WONDER_UFFIZI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Sistine Chapel
UPDATE Language_ko_KR
SET Text = '멋진 프레스코화로 가득 찬(2[ICON_GREAT_WORK], 테마가 있는 경우: [ICON_CULTURE], [ICON_PEACE]) 아름다운 [COLOR_YIELD_FOOD]시스티나 성당[ENDCOLOR]은 말 그대로 제국에 예술적 폭탄입니다(+10%[ICON_CULTURE][ICON_CULTURE]). 문화적 승리를 목표로 한다면 반드시 건설하십시오.'
WHERE Tag = 'TXT_KEY_WONDER_SISTINE_CHAPEL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_SISTINE_CHAPEL_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_SISTINE_CHAPEL_HELP';
				
UPDATE Language_ko_KR SET Text = '건물: [COLOR_CYAN]예술가 길드[ENDCOLOR]; 플레이어: [COLOR_CYAN]창시한 종교[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SISTINE_CHAPEL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '건물: [COLOR_CYAN]예술가 길드[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SISTINE_CHAPEL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Summer Palace
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]이화원[ENDCOLOR]은 외교력을 강화하고([COLOR_WATER_TEXT]귀족[ENDCOLOR]/[COLOR_YIELD_GOLD]외교[ENDCOLOR]) 협상가들의 건설 속도를 높이는 데(+20%[ICON_PRODUCTION][ICON_PRODUCTION]/[COLOR_YIELD_GOLD]외교[ENDCOLOR]) 완전히 집중하는 또 다른 불가사의입니다. 또한 제국의 [COLOR_YIELD_FOOD]대사관[ENDCOLOR](+3[ICON_GOLD][ICON_GOLD]; +1[ICON_CULTURE][ICON_CULTURE])을 업그레이드하고 새로운 [COLOR_GREY]종이[ENDCOLOR](+1[ICON_RES_PAPER]) 공급원을 만듭니다.'
WHERE Tag = 'TXT_KEY_BUILDING_SUMMER_PALACE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,										Text) 
SELECT		'TXT_KEY_BUILDING_SUMMER_PALACE_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_SUMMER_PALACE_HELP';
				
UPDATE Language_ko_KR SET Text = '부지: [COLOR_CYAN]언덕[ENDCOLOR]; 특성: [COLOR_CYAN]숲[ENDCOLOR], [COLOR_CYAN]호수[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_SUMMER_PALACE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '부지: [COLOR_CYAN]언덕[ENDCOLOR]; 특성: [COLOR_CYAN]호수[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_SUMMER_PALACE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Red Fort
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]붉은 성[ENDCOLOR]은 군국주의 지도자에게 이상적인 선택입니다. 전 세계 군대 한도 증가(+5%의 [ICON_CITIZEN][ICON_CITIZEN]을 [ICON_SILVER_FIST]으로), 도시의 공격 및 방어 능력 향상(+10%[ICON_RANGE_STRENGTH]; +1[ICON_SWAP]; +30[ICON_STRENGTH]; +100 HP), 새로운 [COLOR_YIELD_FOOD]병기창[ENDCOLOR]([ICON_STRENGTH]; [ICON_RANGE_STRENGTH]; [ICON_SILVER_FIST]; [ICON_SPY]; [ICON_HAPPINESS_3])뿐만 아니라 엔지니어([COLOR_YIELD_GOLD]무료 [ICON_GREAT_ENGINEER][ENDCOLOR])와 과학자(+1[ICON_GREAT_SCIENTIST])의 지원은 당신을 의심할 여지 없는 세계의 지도자로 만들어 줄 것입니다.'
WHERE Tag = 'TXT_KEY_WONDER_RED_FORT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, 'Requires completion of [COLOR_MAGENTA]Fealty[ENDCOLOR] Branch. ', '') WHERE Tag ='TXT_KEY_WONDER_RED_FORT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_RED_FORT_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_RED_FORT_HELP';

UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]충성 완성[ENDCOLOR]; 지형: [COLOR_NEGATIVE_TEXT]해안[ENDCOLOR]; 특성: [COLOR_CYAN]강[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_RED_FORT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]충성 완성[ENDCOLOR]; 특성: [COLOR_CYAN]강[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_RED_FORT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
----------------------------------------------------
-- Museum Island
INSERT INTO Language_ko_KR 
			(Tag,												Text)
VALUES		('TXT_KEY_BUILDING_MUSEUM_ISLAND',					'박물관 섬'),
			('TXT_KEY_WONDER_MUSEUM_ISLAND_QUOTE',				'[NEWLINE]"베를린은 도시라기보다는 세계의 일부다."[NEWLINE] - 장 파울[NEWLINE]'),
			('TXT_KEY_WONDER_MUSEUM_ISLAND_PEDIA',				'1797년에 설립된 베를린 중심부의 이 박물관 단지는 5개의 박물관으로 구성되어 있으며, 각 박물관은 방대한 소장품으로 유명합니다.'),
			('TXT_KEY_THEMING_BONUS_MUSEUM_ISLAND_COMPOSITION',	'박물관 섬의 경이'),
			('TXT_KEY_THEMING_BONUS_MUSEUM_ISLAND_ERAS',		'모든 시대의 경이'),
			('TXT_KEY_THEMING_BONUS_MUSEUM_ISLAND_OTHERS',		'모든 국가의 경이'),
			('TXT_KEY_THEMING_BONUS_MUSEUM_ISLAND_ART',			'예술 갤러리'),
			('TXT_KEY_THEMING_BONUS_MUSEUM_ISLAND_HELP',		'보너스를 극대화하려면, 모든 위대한 작품 슬롯이 소유자가 아닌 다른 플레이어가 다른 시대에 만든 예술품으로 채워져 있는지 확인하십시오.'),
			('TXT_KEY_WONDER_MUSEUM_ISLAND_HELP',				'[COLOR_POSITIVE_TEXT]무료[ENDCOLOR] 박물관을 부여합니다. 제국 내 [ICON_GREAT_ARTIST] 위대한 예술가 생성률 +50%. 모든 박물관에 [ICON_TOURISM] 관광 +2. [ICON_GREAT_WORK] 위대한 예술품 슬롯 4개를 가집니다. [COLOR_POSITIVE_TEXT]테마[ENDCOLOR]가 있는 경우 [ICON_RESEARCH] 과학, [ICON_CULTURE] 문화, [ICON_TOURISM] 관광 +5.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]박물관 섬[ENDCOLOR]은 지금까지 설립된 가장 큰 예술 작품 집합체입니다(4[ICON_GREAT_WORK], 테마가 있는 경우: [ICON_RESEARCH], [ICON_CULTURE], [ICON_TOURISM]). 예술가가 되기를 열망하는 모든 사람에게 인센티브가 되며(+50%[ICON_GREAT_ARTIST][ICON_GREAT_ARTIST]), 그들의 예술은 최근에 만들어진 [COLOR_YIELD_FOOD]박물관[ENDCOLOR]([ICON_CULTURE]; [ICON_GREAT_WORK]; [ICON_HAPPINESS_3]; [ICON_TOURISM]) 중 하나에 보관될 수 있습니다(+2[ICON_TOURISM]).'
WHERE Tag = 'TXT_KEY_WONDER_MUSEUM_ISLAND_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_MUSEUM_ISLAND_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_MUSEUM_ISLAND_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]예술성 완성[ENDCOLOR]; 특성: [COLOR_CYAN]강[ENDCOLOR]; 위대한 작품: [COLOR_CYAN]위대한 예술품 4개[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MUSEUM_ISLAND_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]예술성 완성[ENDCOLOR]; 특성: [COLOR_CYAN]강[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MUSEUM_ISLAND_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Siku Quanshu
INSERT INTO Language_ko_KR 
			(Tag,												Text)
VALUES		('TXT_KEY_BUILDING_SIKU_QUANSHU',					'사고전서'),
			('TXT_KEY_WONDER_SIKU_QUANSHU_QUOTE',				'[NEWLINE]"나는 항상 낙원이 일종의 도서관일 것이라고 상상해 왔다."[NEWLINE] - 호르헤 루이스 보르헤스[NEWLINE]'),
			('TXT_KEY_WONDER_SIKU_QUANSHU_PEDIA',				'작성 필요'),
			('TXT_KEY_THEMING_BONUS_SIKU_QUANSHU_COMPOSITION',	'모든 왕조의 기록 유산'),
			('TXT_KEY_THEMING_BONUS_SIKU_QUANSHU_ERAS',			'모든 시대의 문학'),
			('TXT_KEY_THEMING_BONUS_SIKU_QUANSHU_OWNER',		'사람들의 문학'),
			('TXT_KEY_THEMING_BONUS_SIKU_QUANSHU_WRITINGS',		'흥미로운 문학 작품 구성'),
			('TXT_KEY_THEMING_BONUS_SIKU_QUANSHU_HELP',			'보너스를 극대화하려면, 모든 위대한 작품 슬롯이 당신이 다른 시대에 만든 문학 작품으로 채워져 있는지 확인하십시오.'),
			('TXT_KEY_WONDER_SIKU_QUANSHU_HELP',				'제국의 작가로부터 [ICON_RESEARCH] 과학 +1. 작가 슬롯 +2. [ICON_GREAT_WORK] 위대한 문학 작품 슬롯 4개를 가집니다. [COLOR_POSITIVE_TEXT]테마[ENDCOLOR]가 있는 경우 [ICON_RESEARCH] 과학 및 [ICON_CULTURE] 문화 +10. 제국의 모든 [ICON_GREAT_WORK] 위대한 작품은 [ICON_RESEARCH] 과학 +1 및 [ICON_CULTURE] 문화 +1을 받습니다. [ICON_CULTURE] 문맹으로 인한 [ICON_HAPPINESS_3] 불행 -1.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]사고전서[ENDCOLOR]는 당신의 백성들의 지식, 창작물, 역사를 담고 있습니다(4[ICON_GREAT_WORK], 테마가 있는 경우: [ICON_RESEARCH], [ICON_CULTURE]). 각각의 가치가 이제 증가했으며(+1[ICON_RESEARCH], +1[ICON_CULTURE]/[ICON_GREAT_WORK][ICON_GREAT_WORK]), 유능한 사람들이 더 나은 선을 위해 사용할 수 있습니다(+2 [ICON_GREAT_WRITER] 슬롯; +1[ICON_RESEARCH]/[ICON_GREAT_WRITER][ICON_GREAT_WRITER]). 또한 당신의 시민들은 여가 시간에 그것들을 즐길 수 있을 것입니다(-1[ICON_HAPPINESS_3] 문맹).'
WHERE Tag = 'TXT_KEY_WONDER_SIKU_QUANSHU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_SIKU_QUANSHU_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_SIKU_QUANSHU_HELP';
				
UPDATE Language_ko_KR SET Text = '위대한 작품: [COLOR_CYAN]위대한 문학 작품 4개[ENDCOLOR]; 플레이어: [COLOR_CYAN]도시 7개[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SIKU_QUANSHU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = ''||Text WHERE Tag ='TXT_KEY_WONDER_SIKU_QUANSHU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Brooklyn Bridge
INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_BROOKLYN',		'브루클린 다리'),
			('TXT_KEY_WONDER_BROOKLYN_QUOTE',	'[NEWLINE]"과학자들은 브루클린 다리를 짓고 나서 그것을 사는 사람들이다."[NEWLINE] - 윌리엄 F. 버클리 주니어[NEWLINE]'),
			('TXT_KEY_WONDER_BROOKLYN_PEDIA',	'브루클린 다리는 뉴욕시 맨해튼과 브루클린 자치구를 이스트 강을 가로질러 연결하는 상징적인 현수교입니다. 1870년 1월 3일부터 1883년 5월 24일까지 건설되어 대중에게 공개되었습니다. 다리는 탑의 뾰족한 아치에서 볼 수 있듯이 네오고딕 양식으로 건설되었습니다.[NEWLINE][NEWLINE]  1884년 다리의 안정성에 대한 우려가 있을 때, P.T. 바넘은 그의 서커스단에서 21마리의 코끼리 떼를 이끌고 다리를 건넜습니다. 다리는 또한 9/11과 같은 사건 이후 사람들의 대피로로 사용되었으며, 이 상황에서 다리는 런던의 밀레니엄 브리지와 유사한 방식으로 흔들렸습니다.'),
			('TXT_KEY_WONDER_BROOKLYN_HELP',	'건설 시 [COLOR_POSITIVE_TEXT]무료[ENDCOLOR] [ICON_DIPLOMAT] 위대한 외교관과 100의 [ICON_INFLUENCE]를 부여합니다. [COLOR_POSITIVE_TEXT]추가[ENDCOLOR] [ICON_INTERNATIONAL_TRADE] 교역로 슬롯 1개를 얻습니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]브루클린 다리[ENDCOLOR]는 전 세계 사람들에게 큰 영향을 미칩니다(100[ICON_INFLUENCE]/[ICON_CITY_STATE][ICON_CITY_STATE]). 추가로 새로운 인플루언서([COLOR_YIELD_GOLD]무료 [ICON_DIPLOMAT][ENDCOLOR])를 고용하고, 최근 설립된 교역로를 통해 당신의 말을 전할 수 있습니다(+1[ICON_INTERNATIONAL_TRADE]).'
WHERE Tag = 'TXT_KEY_WONDER_BROOKLYN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_BROOKLYN_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_BROOKLYN_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 특성: [COLOR_CYAN]강[ENDCOLOR]; 도시: [COLOR_CYAN]시민 25명[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BROOKLYN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 특성: [COLOR_CYAN]강[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BROOKLYN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Trans-Siberian Railway
INSERT INTO Language_ko_KR 
			(Tag,											Text)
VALUES		('TXT_KEY_BUILDING_SIBERIAN_RAILWAY',			'시베리아 횡단 철도'),
			('TXT_KEY_WONDER_SIBERIAN_RAILWAY_QUOTE',		'[NEWLINE]"시베리아 횡단 철도는 단순한 철도 그 이상이다. 그것은 현대 러시아의 정신으로의 여행이며, 공학의 승리이며, 지구상에서 가장 크고 아마도 가장 신비로운 국가를 통과하는 움직이는 향연이다."[NEWLINE] - 개빈 헤인즈[NEWLINE]'),
			('TXT_KEY_WONDER_SIBERIAN_RAILWAY_PEDIA',		'작성 필요'),
			('TXT_KEY_WONDER_SIBERIAN_RAILWAY_HELP',		'+25% [ICON_WORKER] 시설 건설 속도. 모든 육상 유닛은 [COLOR_POSITIVE_TEXT]시베리아 횡단 철도[ENDCOLOR] 진급을 받습니다. 도시 연결로부터 [ICON_GOLD] 골드 +15%.[NEWLINE][NEWLINE]모든 [ICON_RES_COAL] 석탄: [ICON_GOLDEN_AGE] 황금기 점수 +5.[NEWLINE]모든 [ICON_RES_OIL] 석유: [ICON_GOLDEN_AGE] 황금기 점수 +5.[NEWLINE]모든 [ICON_RES_ALUMINUM] 알루미늄: [ICON_GOLDEN_AGE] 황금기 점수 +5.[NEWLINE]모든 [ICON_RES_URANIUM] 우라늄: [ICON_GOLDEN_AGE] 황금기 점수 +5.'),
			('TXT_KEY_PROMOTION_SIBERIAN_RAILWAY',			'시베리아 횡단 철도'),
			('TXT_KEY_PROMOTION_SIBERIAN_RAILWAY_HELP',		'[COLOR:255:230:85:255]툰드라와 설원 위에서[ENDCOLOR] [ICON_MOVES]이동력 두 배.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]시베리아 횡단 철도[ENDCOLOR]는 지구의 야생 지역을 통과하는 여행을 훨씬 쉽게 만듭니다([COLOR_WATER_TEXT]시베리아 횡단 철도[ENDCOLOR]/[COLOR_YIELD_GOLD]육상[ENDCOLOR]). 수입(+15%[ICON_GOLD]/[ICON_CONNECTED][ICON_CONNECTED])과 생산성(+20%[ICON_WORKER] 노동자 속도)을 크게 높이고, 영토 내 모든 현대 [COLOR_GREY]전략[ENDCOLOR] 자원의 가치를 높입니다(+5[ICON_GOLDEN_AGE]/[ICON_RES_COAL][ICON_RES_COAL],[ICON_RES_OIL][ICON_RES_OIL],[ICON_RES_ALUMINUM][ICON_RES_ALUMINUM],[ICON_RES_URANIUM][ICON_RES_URANIUM]).'
WHERE Tag = 'TXT_KEY_WONDER_SIBERIAN_RAILWAY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_SIBERIAN_RAILWAY_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_SIBERIAN_RAILWAY_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]툰드라[ENDCOLOR], [COLOR_NEGATIVE_TEXT]해안[ENDCOLOR]; 건물: [COLOR_CYAN]기차역[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SIBERIAN_RAILWAY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]툰드라[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SIBERIAN_RAILWAY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Panama Canal
INSERT INTO Language_ko_KR 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_PANAMA_CANAL',		'파나마 운하'),
			('TXT_KEY_WONDER_PANAMA_CANAL_QUOTE',	'[NEWLINE]"개울은 그 근원보다 더 크게 솟아오를 수 없다."[NEWLINE] - 시어도어 루스벨트[NEWLINE]'),
			('TXT_KEY_WONDER_PANAMA_CANAL_PEDIA',	'파나마 운하는 태평양과 카리브해를 분리하는 파나마 지협에 위치한 인공 수송로입니다. 이 지역에 운하를 건설하자는 아이디어는 16세기 신성 로마 제국의 카를 5세가 스페인과 그들의 식민지인 페루 사이의 여정을 단축하기 위해 연결을 요청하면서 처음 제안되었습니다. 1698년 스코틀랜드 왕국은 이 지역에 육상 교역로를 만드는 프로젝트를 시작했지만, 1년 후 비우호적인 조건으로 인해 포기되었습니다.[NEWLINE][NEWLINE]  1855년이 되어서야 1849년 미국 캘리포니아 주에서 금이 발견된 결과로 파나마 운하 철도가 처음으로 연결되었습니다. 이 철도는 1904년부터 1914년까지 미국의 운하 건설에 광범위하게 사용되었습니다. 수에즈 운하와 같은 평평한 수로를 건설하려는 프랑스의 계획과는 달리, 미국의 설계는 프랑스 설계에 문제를 일으켰던 범위를 배가 넘어가도록 일련의 선박 갑문을 특징으로 했습니다. 미국의 설계는 성공적이었고, 1914년 8월 15일에 개통되었습니다. 철도 차량은 건설을 통해 약 152,910,972 입방미터의 굴착물을 운송하는 데 사용되었으며, 전체 프로젝트에 27,500명의 생명이 희생되었습니다.'),
			('TXT_KEY_WONDER_PANAMA_CANAL_HELP',	'모든 해군 유닛은 [COLOR_POSITIVE_TEXT]파나마 운하[ENDCOLOR] 진급을 받습니다. 해상 [ICON_INTERNATIONAL_TRADE] 교역로는 +100%의 범위와 +3의 [ICON_GOLD] 골드를 얻습니다. 모든 항구와 해항에 [ICON_GOLD] 골드 +2.'),
			('TXT_KEY_PROMOTION_PANAMA_CANAL',		'파나마 운하'),
			('TXT_KEY_PROMOTION_PANAMA_CANAL_HELP',	'+1[ICON_ARROW_RIGHT] 이동 포인트. [COLOR:255:230:85:255]우호적인 영토 내에서 치료 시[ENDCOLOR] +10 HP.');
			
UPDATE Language_ko_KR
SET Text = '중요한 [COLOR_YIELD_FOOD]파나마 운하[ENDCOLOR] 프로젝트는 당신의 교역로를 강화하고 더 먼 항해를 가능하게 합니다(+100% 해상 [ICON_INTERNATIONAL_TRADE][ICON_INTERNATIONAL_TRADE] 범위; +3[ICON_GOLD]/해상 [ICON_INTERNATIONAL_TRADE][ICON_INTERNATIONAL_TRADE]). 모든 해상 건물은 추가 지원을 받고(+2[ICON_GOLD]/모든 [COLOR_YIELD_FOOD]항구[ENDCOLOR], [COLOR_YIELD_FOOD]해항[ENDCOLOR]) 모든 해군 유닛은 이동성과 내구성이 향상됩니다([COLOR_WATER_TEXT]파나마 운하[ENDCOLOR]/[COLOR_YIELD_GOLD]해군[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_PANAMA_CANAL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_PANAMA_CANAL_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_PANAMA_CANAL_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]최소 10타일 면적의 지협[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PANAMA_CANAL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]최소 10타일 면적의 지협[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PANAMA_CANAL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Zocalo
INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_ZOCALO',		'소칼로'),
			('TXT_KEY_WONDER_ZOCALO_QUOTE',	'[NEWLINE]"소칼로는 트라팔가 광장의 최소 네 배 크기인 웅장한 공간으로, 한쪽에는 국립 궁전이, 다른 쪽에는 거대한 대성당이 있으며, 한쪽 구석에는 에르난 코르테스와 정복자들에 의해 잔인하게 파괴된 옛 아즈텍 도시의 일부가 있다."[NEWLINE] - 제러미 코빈[NEWLINE]'),
			('TXT_KEY_WONDER_ZOCALO_PEDIA',	'작성 필요'),
			('TXT_KEY_WONDER_ZOCALO_HELP',	'[COLOR_POSITIVE_TEXT]무료[ENDCOLOR] [ICON_DIPLOMAT] 위대한 외교관을 부여합니다. 제국의 공무원으로부터 [ICON_PEACE] 신앙 +1. 외교 유닛에 대한 [ICON_PRODUCTION] 생산력 +10%. 제국의 모든 기념비에서 [ICON_TOURISM] 관광 +2. 공무원 슬롯 +1.');
			
UPDATE Language_ko_KR
SET Text = '거대한 [COLOR_YIELD_FOOD]소칼로[ENDCOLOR]는 도시 역사의 정치적([COLOR_YIELD_GOLD]무료 [ICON_DIPLOMAT][ENDCOLOR]; +1 [ICON_DIPLOMAT] 슬롯; +10%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]외교[ENDCOLOR]) 및 종교적(+1[ICON_PEACE]/[ICON_DIPLOMAT][ICON_DIPLOMAT]) 측면을 증명합니다. 이러한 기념물은 전 세계의 관광객을 끌어들여(+2[ICON_TOURISM]/모든 [COLOR_YIELD_FOOD]기념비[ENDCOLOR]) 이러한 행사의 일부가 되고 싶어 합니다.'
WHERE Tag = 'TXT_KEY_WONDER_ZOCALO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_ZOCALO_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_ZOCALO_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]평원[ENDCOLOR]; 부지: [COLOR_CYAN]평지[ENDCOLOR]; 특성: [COLOR_CYAN]호수[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ZOCALO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '부지: [COLOR_CYAN]평지[ENDCOLOR]; 특성: [COLOR_CYAN]호수[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ZOCALO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Kew Gardens
INSERT INTO Language_ko_KR 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_KEW_GARDENS',		'큐 왕립식물원'),
			('TXT_KEY_WONDER_KEW_GARDENS_QUOTE',	'[NEWLINE]"다른 사람이 깨어나기 전에 자연 속에 서 있으면 대부분의 사람들은 믿을 만한 것을 찾는다."[NEWLINE] - 토르 우달[NEWLINE]'),
			('TXT_KEY_WONDER_KEW_GARDENS_PEDIA',	'작성 필요'),
			('TXT_KEY_WONDER_KEW_GARDENS_HELP',		'제국의 농장에서 [ICON_FOOD] 식량 +1, [ICON_RESEARCH] 과학 +1, [ICON_TOURISM] 관광 +1. 이 도시에서 생산된 [ICON_FOOD] 식량의 10%를 [ICON_RESEARCH] 과학으로, 추가로 [ICON_RESEARCH] 과학의 10%를 [ICON_TOURISM] 관광으로 전환합니다.');

UPDATE Language_ko_KR
SET Text = '풍부한 [COLOR_YIELD_FOOD]큐 왕립식물원[ENDCOLOR]은 수천 종의 식물, 거대한 데이터베이스, 그리고 그들의 행동을 연구하고 제국의 [COLOR_CITY_BROWN]농장[ENDCOLOR] 개발을 지원하려는 인간의 헌신으로 가득 차 있습니다(+1[ICON_FOOD], +1[ICON_RESEARCH], +1[ICON_TOURISM]/[ICON_WORKER][ICON_WORKER]). 성장, 축적된 지식, 그리고 호기심 많은 생태 관광객이 만들어내는 관광객 유입 사이에는 연관성이 있으며(+3[ICON_GREAT_SCIENTIST]; 10%[ICON_FOOD]를 [ICON_RESEARCH]으로; 10%[ICON_RESEARCH]를 [ICON_TOURISM]으로), 이를 경제를 가속화하는 데 사용할 수 있습니다.'
WHERE Tag = 'TXT_KEY_WONDER_KEW_GARDENS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_KEW_GARDENS_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_KEW_GARDENS_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]합리주의 완성[ENDCOLOR]; 건물: [COLOR_CYAN]농업 기업[ENDCOLOR], [COLOR_CYAN]정원[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_KEW_GARDENS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]합리주의 완성[ENDCOLOR]; 건물: [COLOR_CYAN]농업 기업[ENDCOLOR], [COLOR_CYAN]정원[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_KEW_GARDENS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Monte Carlo
INSERT INTO Language_ko_KR 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_MONTE_CARLO',		'몬테카를로 카지노'),
			('TXT_KEY_WONDER_MONTE_CARLO_QUOTE',	'[NEWLINE]"행운은 주인이 아니라 하인이었다. 행운은 어깨를 으쓱하며 받아들이거나 최대한 이용해야 했다. 그러나 그것이 무엇인지 이해하고 인식해야 했으며, 확률에 대한 잘못된 평가와 혼동해서는 안 되었다. 왜냐하면 도박에서 치명적인 죄는 나쁜 플레이를 나쁜 운으로 착각하는 것이기 때문이다."[NEWLINE] - 이언 플레밍[NEWLINE]'),
			('TXT_KEY_WONDER_MONTE_CARLO_PEDIA',	'몬테카를로 카지노는 모나코 몬테카를로에 위치한 도박 및 엔터테인먼트 단지입니다. 카지노, 그랑 테아트르 드 몬테카를로, 레 발레 드 몬테카를로 사무실이 포함되어 있습니다. 몬테카를로 카지노는 모나코 정부와 지배 가문이 대주주인 공기업인 소시에테 데 뱅 드 메르 드 모나코가 소유하고 운영합니다. 이 회사는 또한 모나코 전역의 주요 호텔, 스포츠 클럽, 요식업소, 나이트클럽을 소유하고 있습니다.'),
			('TXT_KEY_WONDER_MONTE_CARLO_HELP',		'제국 내 [ICON_GOLD] 골드 +10%. 이 도시에서 생산된 [ICON_TOURISM] 관광의 33%를 [ICON_GOLD] 골드로 전환합니다. [ICON_GOLD] 골드 구매의 20%가 [ICON_TOURISM] 관광으로 전환됩니다. [COLOR_POSITIVE_TEXT]무료[ENDCOLOR] 호텔을 부여합니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]몬테카를로[ENDCOLOR]의 카지노는 행운이 따르는 모든 사람을 초대합니다(+10%[ICON_GOLD][ICON_GOLD]). 부자가 될 것이라는 약속은 관광객을 끌어들이고(지출된 [ICON_GOLD]의 20%를 [ICON_TOURISM]으로 전환), 그들이 당신의 [COLOR_YIELD_FOOD]호텔[ENDCOLOR]([ICON_TOURISM])에서 쓰는 돈(+2[ICON_GOLD]; +2[ICON_TOURISM])은 당신의 제국이 가장 필요로 하는 것입니다(33%[ICON_TOURISM]을 [ICON_GOLD]으로 전환).'
WHERE Tag = 'TXT_KEY_WONDER_MONTE_CARLO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_MONTE_CARLO_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_MONTE_CARLO_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]예술성 완성[ENDCOLOR]; 지형: [COLOR_CYAN]산[ENDCOLOR], [COLOR_CYAN]해안[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MONTE_CARLO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]예술성 완성[ENDCOLOR]; 지형: [COLOR_CYAN]해안[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MONTE_CARLO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Ruhr Valley
INSERT INTO Language_ko_KR 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_RUHR_VALLEY',		'루르 밸리'),
			('TXT_KEY_WONDER_RUHR_VALLEY_QUOTE',	'[NEWLINE]"공학 없는 예술은 꿈꾸는 것이고, 예술 없는 공학은 계산하는 것이다."[NEWLINE] - 스티븐 로버츠[NEWLINE]'),
			('TXT_KEY_WONDER_RUHR_VALLEY_PEDIA',	'작성 필요'),
			('TXT_KEY_WONDER_RUHR_VALLEY_HELP',		'가능하다면 도시 범위 내에 1개의 새로운 [ICON_RES_COAL] 석탄 자원을 배치합니다. 제국 내 [ICON_PRODUCTION] 생산력 +10%. 제국의 광산과 채석장에서 [ICON_PRODUCTION] 생산력 +1. 제국의 석탄에서 [ICON_GOLD] 골드 +1 및 [ICON_GOLDEN_AGE] 황금기 점수 +1. 이 도시의 작업 범위 +1.');
			
UPDATE Language_ko_KR
SET Text = '풍부한 [COLOR_YIELD_FOOD]루르 밸리[ENDCOLOR] 집적지(+2[ICON_RANGE] 도시 작업 범위)는 국가 전체의 심장입니다(+10%[ICON_PRODUCTION][ICON_PRODUCTION]). 새로운 [COLOR_GREY]석탄[ENDCOLOR] 매장지(+1[ICON_RES_COAL](3); +1[ICON_GOLD], +1[ICON_GOLDEN_AGE]/[ICON_RES_COAL][ICON_RES_COAL]) 발견과 모든 [COLOR_CITY_BROWN]광산[ENDCOLOR] 및 [COLOR_CITY_BROWN]채석장[ENDCOLOR](+1[ICON_PRODUCTION]/[ICON_WORKER][ICON_WORKER])에 걸쳐 잘 훈련된 인력 덕분에 산업을 지원합니다.'
WHERE Tag = 'TXT_KEY_WONDER_RUHR_VALLEY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_RUHR_VALLEY_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_RUHR_VALLEY_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]산업 완성[ENDCOLOR]; 특성: [COLOR_CYAN]강[ENDCOLOR]; 도시: [COLOR_CYAN]석탄 배치 공간[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_RUHR_VALLEY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]산업 완성[ENDCOLOR]; 특성: [COLOR_CYAN]강[ENDCOLOR]; 도시: [COLOR_CYAN]석탄 배치 공간[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_RUHR_VALLEY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Darjeeling Himalayan Railway
INSERT INTO Language_ko_KR 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_DARJEELING',			'다르질링 히말라야 철도'),
			('TXT_KEY_WONDER_DARJEELING_QUOTE',		'[NEWLINE]"전통적인 영국인은 그의 피가 오래전에 실론, 아삼, 다르질링의 혼합물로 대체될 때까지 차를 마신다."[NEWLINE] - 페넬 허드슨[NEWLINE]'),
			('TXT_KEY_WONDER_DARJEELING_PEDIA',		'다르질링 히말라야 철도는 인도 북동부의 실리구리와 다르질링 시 사이를 운행하는 협궤 철도입니다. 78킬로미터의 선로를 따라 약 2,100미터의 수직 상승을 특징으로 하며, 차 재배에 완벽한 이 지역에 철도 접근을 제공하기 위해 영국령 인도 시대에 건설되었습니다. 기차와 선로의 작은 크기 때문에 종종 ''장난감 기차''라고 불리며, 이는 기차가 다르질링까지의 가파른 오르막을 처리할 수 있도록 의도된 디자인이었습니다. 이 철도는 1980년대 후반 고르카족의 민족적 유산을 인정받기 위해 인도 내 별도의 주를 요구하는 폭력적인 고르카랜드 운동 기간 동안 잠시 폐쇄되었습니다.'),
			('TXT_KEY_WONDER_DARJEELING_HELP',		'모든 보병 군사 유닛은 [COLOR_POSITIVE_TEXT]장난감 기차[ENDCOLOR] 진급을 받습니다. 도시 연결로부터 [ICON_GOLD] 골드 +15%. 이 도시가 점유한 산 타일에서 [ICON_FOOD] 식량 +1, [ICON_PRODUCTION] 생산력, [ICON_CULTURE] 문화, [ICON_TOURISM] 관광 +1.'),
			('TXT_KEY_PROMOTION_DARJEELING',		'장난감 기차'),
			('TXT_KEY_PROMOTION_DARJEELING_HELP',	'유닛은 [COLOR:255:230:85:255]산에 들어갈 수 있습니다[ENDCOLOR].');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]다르질링 히말라야 철도[ENDCOLOR]는 제국의 어려운 지역을 함께 연결하는 훌륭한 방법입니다([COLOR_WATER_TEXT]장난감 기차[ENDCOLOR]/[COLOR_YIELD_GOLD]보병 군사[ENDCOLOR]). 이러한 연결은 또한 수입을 향상시키고(+15%[ICON_GOLD]/[ICON_CONNECTED][ICON_CONNECTED]) 도시 주변의 [COLOR_CITY_BLUE]산악[ENDCOLOR](+1[ICON_FOOD], +1[ICON_PRODUCTION], +1[ICON_CULTURE], +1[ICON_TOURISM]/[ICON_FLOWER][ICON_FLOWER] 해당 도시) 지형을 인구 밀집 지역으로 만들 수 있습니다.'
WHERE Tag = 'TXT_KEY_WONDER_DARJEELING_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_DARJEELING_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_DARJEELING_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]산 2개[ENDCOLOR]; 건물: [COLOR_CYAN]기차역[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_DARJEELING_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]산[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_DARJEELING_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Banff Springs Hotel
INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_BANFF',			'밴프 스프링스 호텔'),
			('TXT_KEY_WONDER_BANFF_QUOTE',		'[NEWLINE]"국립공원은 놀이터가 아니다. 그것은 자연과 자연의 조건에 따라 자연을 받아들일 인간을 위한 성역이다."[NEWLINE] - 마이클 프롬[NEWLINE]'),
			('TXT_KEY_WONDER_BANFF_PEDIA',		'작성 필요'),
			('TXT_KEY_WONDER_BANFF_HELP',		'제국의 모든 상인 전문가로부터 [ICON_GOLD] 골드 +1 및 [ICON_TOURISM] 관광 +1. 이 도시가 점유한 모든 산 타일에서 [ICON_GOLD] 골드 +5 및 [ICON_TOURISM] 관광 +5. [COLOR_POSITIVE_TEXT]무료[ENDCOLOR] 호텔을 부여합니다. [ICON_CULTURE] 지루함으로 인한 [ICON_HAPPINESS_3] 불행 -1.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]밴프 스프링스 호텔[ENDCOLOR]은 기본 관광 인프라를 사용하여 [COLOR_CITY_BLUE]산[ENDCOLOR](+5[ICON_GOLD], +5[ICON_TOURISM]/[ICON_FLOWER] 도시)에서 이익을 창출하는 완벽한 예입니다: [COLOR_YIELD_FOOD]호텔[ENDCOLOR]([ICON_TOURISM]), 상업 지구(+1[ICON_GREAT_MERCHANT]; +5[ICON_GOLD], +5[ICON_TOURISM]/[ICON_GREAT_MERCHANT][ICON_GREAT_MERCHANT]) 및 모든 종류의 오락 시설(-1[ICON_HAPPINESS_3] 지루함).'
WHERE Tag = 'TXT_KEY_WONDER_BANFF_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_BANFF_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_BANFF_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]산업 완성[ENDCOLOR]; 지형: [COLOR_CYAN]산[ENDCOLOR], [COLOR_CYAN]툰드라[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BANFF_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]산업 완성[ENDCOLOR]; 지형: [COLOR_CYAN]툰드라[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BANFF_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Orszaghaz
INSERT INTO Language_ko_KR 
			(Tag,										Text) 
VALUES		('TXT_KEY_BUILDING_ORSZAGHAZ',				'국회의사당'),
			('TXT_KEY_WONDER_ORSZAGHAZ_QUOTE',			'[NEWLINE]"자치에는 자유가 있고, 자유에는 정의와 애국심이 있다."[NEWLINE] - 코슈트 러요시[NEWLINE]'),
			('TXT_KEY_WONDER_ORSZAGHAZ_PEDIA',			'작성 필요'),
			('TXT_KEY_GREAT_WORK_HOLY_CROWN',			'헝가리의 성 이슈트반 왕관'),
			('TXT_KEY_GREAT_WORK_HOLY_CROWN_QUOTE',		'[NEWLINE]당신은 나의 미천한 능력을 넘어서는 것을 원하지만, 나는[NEWLINE]전능하신 하나님의 연민과 자비를 믿습니다.[NEWLINE] - 성 이슈트반[NEWLINE]'),
			('TXT_KEY_WONDER_ORSZAGHAZ_HELP',			'[COLOR_POSITIVE_TEXT]무료[ENDCOLOR] 정책. 제국 내 [ICON_GOLDEN_AGE] 황금기 점수 +10%. [ICON_INFLUENCE] 세계 회의 투표권 +1, 우호 선언 2개마다 [ICON_INFLUENCE] 세계 회의 투표권 +1, 방어 협정마다 [ICON_INFLUENCE] 세계 회의 투표권 +1. [ICON_GREAT_WORK] 위대한 예술품 슬롯 1개를 가지며, [ICON_GREAT_WORK] [COLOR_CULTURE_STORED]헝가리의 성 이슈트반 왕관[ENDCOLOR]으로 시작합니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]국회의사당[ENDCOLOR]은 전 세계에 대한 당신의 선의의 증거이며(+1[ICON_DIPLOMAT] 연맹 투표; +1[ICON_DIPLOMAT] 연맹 투표/2 DoF; +1[ICON_DIPLOMAT] 연맹 투표/DP), 시민들의 더 나은 미래를 향한 거대한 도약입니다([COLOR_MAGENTA]무료 정책[ENDCOLOR]). 또한 당신은 그들을 초대하여 당신의 컬렉션에서 가장 신성한 유물인 [COLOR_CULTURE_STORED]헝가리의 성 이슈트반 왕관[ENDCOLOR]을 보게 하여 새로운 시대의 빛을 퍼뜨립니다(+15%[ICON_GOLDEN_AGE][ICON_GOLDEN_AGE]).'
WHERE Tag = 'TXT_KEY_WONDER_ORSZAGHAZ_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_ORSZAGHAZ_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_ORSZAGHAZ_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]자유[ENDCOLOR]; 지형: [COLOR_NEGATIVE_TEXT]해안[ENDCOLOR]; 특성: [COLOR_CYAN]강[ENDCOLOR]; 건물: [COLOR_CYAN]경찰서[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ORSZAGHAZ_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]자유[ENDCOLOR]; 지형: [COLOR_NEGATIVE_TEXT]해안[ENDCOLOR]; 특성: [COLOR_CYAN]강[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ORSZAGHAZ_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);		
----------------------------------------------------
-- Neuschwanstein
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]노이슈반슈타인 성[ENDCOLOR]은 당신의 재무부에 좋은 부스트를 주고(+6[ICON_GOLD]; +1[ICON_GREAT_MERCHANT]), 문화 산출량을 높이며(+4[ICON_CULTURE]), 당신의 [COLOR_YIELD_FOOD]성[ENDCOLOR](+1[ICON_GOLD], +1[ICON_CULTURE], +1[ICON_HAPPINESS_1])을 도시에서 가장 가치 있는 건물로 만듭니다.'
WHERE Tag = 'TXT_KEY_WONDER_NEUSCHWANSTEIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, 'Can only be built in a City within 2 tiles of a Mountain that is inside your territory. ', '') WHERE Tag ='TXT_KEY_WONDER_NEUSCHWANSTEIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_NEUSCHWANSTEIN_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_NEUSCHWANSTEIN_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]산[ENDCOLOR]; 특성: [COLOR_CYAN]담수[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_NEUSCHWANSTEIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]산[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_NEUSCHWANSTEIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Soho Foundry
UPDATE Language_ko_KR
SET Text = '문명에 좋은 산업적 부스트를 찾고 있다면, [COLOR_YIELD_FOOD]소호 주조소[ENDCOLOR]가 당신을 위한 것입니다. 이 [COLOR_YIELD_FOOD]공장[ENDCOLOR]([ICON_PRODUCTION]; [ICON_GREAT_PEOPLE]; [ICON_HAPPINESS_3]; [ICON_INTERNATIONAL_TRADE])은 전략적 [COLOR_GREY]석탄[ENDCOLOR](+4 [ICON_RES_COAL])의 훌륭한 원천이며, 새로운 공병대(+1[ICON_GREAT_ENGINEER])의 지원을 받아 개발을 크게 증가시킬 것입니다.' WHERE Tag = 'TXT_KEY_BUILDING_SOHO_FOUNDRY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_BUILDING_SOHO_FOUNDRY_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_SOHO_FOUNDRY_HELP';
				
UPDATE Language_ko_KR SET Text = '특성: [COLOR_CYAN]강[ENDCOLOR], [COLOR_CYAN]숲[ENDCOLOR]/[COLOR_CYAN]정글[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_SOHO_FOUNDRY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특성: [COLOR_CYAN]숲[ENDCOLOR]/[COLOR_CYAN]정글[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_SOHO_FOUNDRY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Louvre
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]루브르 박물관[ENDCOLOR]은 귀중한 유물을 숨기기에 이상적인 장소입니다(2명의 [COLOR_YIELD_GOLD]무료 고고학자[ENDCOLOR]). 이 거대한 [COLOR_YIELD_FOOD]박물관[ENDCOLOR]([ICON_CULTURE]; [ICON_GREAT_WORK]; [ICON_HAPPINESS_3]; [ICON_TOURISM])은 또한 전 세계의 멋진 예술 작품(4[ICON_GREAT_WORK], 테마가 있는 경우: [ICON_CULTURE])을 소장하고 있으며 전 세계의 예술가들을 초대합니다([COLOR_YIELD_GOLD]무료 [ICON_GREAT_ARTIST][ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_LOUVRE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, 'Requires completion of [COLOR_MAGENTA]Artistry[ENDCOLOR] Branch. ', '') WHERE Tag ='TXT_KEY_WONDER_LOUVRE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_LOUVRE_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_LOUVRE_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]예술성 완성[ENDCOLOR]; 시설: [COLOR_CYAN]랜드마크[ENDCOLOR]; 위대한 작품: [COLOR_CYAN]위대한 예술품 4개[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_LOUVRE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]예술성 완성[ENDCOLOR]; 시설: [COLOR_CYAN]랜드마크[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_LOUVRE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Palace of Westminster
UPDATE Language_ko_KR
SET Text = '영향력 있는 [COLOR_YIELD_FOOD]웨스트민스터 궁전[ENDCOLOR]은 세계 회의 대표를 위한 추가 의석을 가져오고(+2[ICON_DIPLOMAT] 연맹 투표 (확장 가능)), 상인들을 초대하여(+[COLOR_YIELD_GOLD]무료 [ICON_GREAT_MERCHANT][ENDCOLOR]) 부를 늘리고 국민들의 필요를 줄여줍니다(-1[ICON_HAPPINESS_3] 빈곤).'
WHERE Tag = 'TXT_KEY_WONDER_BIG_BEN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, 'Requires completion of [COLOR_MAGENTA]Statecraft[ENDCOLOR] Branch. ', '') WHERE Tag ='TXT_KEY_WONDER_BIG_BEN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_BIG_BEN_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_BIG_BEN_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]국가 경영 완성[ENDCOLOR]; 특성: [COLOR_CYAN]강[ENDCOLOR]; 플레이어: [COLOR_CYAN]동맹 도시 국가 3개[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BIG_BEN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]국가 경영 완성[ENDCOLOR]; 특성: [COLOR_CYAN]강[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BIG_BEN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Eiffel Tower
UPDATE Language_ko_KR
SET Text = '인상적인 [COLOR_YIELD_FOOD]에펠탑[ENDCOLOR]은 문명의 빠른 문화 발전을 위한 유용한 도구가 될 수 있으며(-10%[ICON_CULTURE] 정책 비용), 이는 세계 지배의 열쇠입니다.'
WHERE Tag = 'TXT_KEY_WONDER_EIFFEL_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_EIFFEL_TOWER_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_EIFFEL_TOWER_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]초원[ENDCOLOR]; 부지: [COLOR_CYAN]평지[ENDCOLOR]; 개선된 자원: [COLOR_CYAN]철[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_EIFFEL_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]초원[ENDCOLOR]; 부지: [COLOR_CYAN]평지[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_EIFFEL_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Brandenburg Gate
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]브란덴부르크 문[ENDCOLOR]의 군사적 잠재력은 헤아릴 수 없습니다. 더 크고(+10[ICON_SILVER_FIST]) 잘 훈련된 군대(+15 전역 경험치/[COLOR_YIELD_GOLD]군사[ENDCOLOR])와 뛰어난 리더십([COLOR_YIELD_GOLD]무료 [ICON_GREAT_GENERAL][ENDCOLOR]; +2[ICON_GREAT_SCIENTIST])은 다른 국가들 사이에서 당신의 현재 위치를 확고히 할 것입니다.'
WHERE Tag = 'TXT_KEY_WONDER_BRANDENBURG_GATE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_BRANDENBURG_GATE_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_BRANDENBURG_GATE_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]제국주의 완성[ENDCOLOR]; 부지: [COLOR_CYAN]평지[ENDCOLOR]; 시설: [COLOR_CYAN]성채[ENDCOLOR]/[COLOR_CYAN]요새[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BRANDENBURG_GATE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]제국주의 완성[ENDCOLOR]; 시설: [COLOR_CYAN]성채[ENDCOLOR]/[COLOR_CYAN]요새[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BRANDENBURG_GATE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
----------------------------------------------------
-- Polar Expedition
INSERT INTO Language_ko_KR 
			(Tag,										Text)
VALUES		('TXT_KEY_BUILDING_POLAR_EXPEDITION',		'극지 탐험'),
			('TXT_KEY_WONDER_POLAR_EXPEDITION_QUOTE',	'[NEWLINE]"모험은 단지 나쁜 계획일 뿐이다."[NEWLINE] - 로알 아문센[NEWLINE]'),
			('TXT_KEY_WONDER_POLAR_EXPEDITION_PEDIA',	'작성 필요'),
			('TXT_KEY_WONDER_POLAR_EXPEDITION_HELP',	'가능하다면 도시 범위 내에 2개의 새로운 [ICON_RES_OIL] 석유 자원을 배치합니다. 도시가 점유한 모든 설원 타일에서 [ICON_RESEARCH] 과학 +2. 제국의 모든 과학자 전문가로부터 [ICON_RESEARCH] 과학 +1 및 [ICON_GOLDEN_AGE] 황금기 점수 +1.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]극지 탐험[ENDCOLOR]은 방문하지 않은 [COLOR_CITY_BLUE]설원[ENDCOLOR] 지역을 광범위하게 탐사하고(+2[ICON_RESEARCH]/[ICON_FLOWER]) 흰 덮개에 숨겨진 새로운 지하 [COLOR_GREY]석유[ENDCOLOR] 매장지(+1[ICON_RES_OIL](2), +1[ICON_RES_OIL](3))를 찾습니다. 그곳에 만들어진 새로운 연구 시설은 지구와 그 역사에 대한 우리의 지식을 확실히 확장할 것입니다(+1[ICON_RESEARCH], +1[ICON_GOLDEN_AGE]/[ICON_GREAT_SCIENTIST][ICON_GREAT_SCIENTIST]).'
WHERE Tag = 'TXT_KEY_WONDER_POLAR_EXPEDITION_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_POLAR_EXPEDITION_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_POLAR_EXPEDITION_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]설원[ENDCOLOR]; 도시: [COLOR_CYAN]극지 근처[ENDCOLOR], [COLOR_CYAN]석유 배치 공간[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_POLAR_EXPEDITION_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]설원[ENDCOLOR]; 도시: [COLOR_CYAN]석유 배치 공간[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_POLAR_EXPEDITION_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Akihabara Electric Town
INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_AKIHABARA',		'아키하바라 전자상가'),
			('TXT_KEY_WONDER_AKIHABARA_QUOTE',	'[NEWLINE]"그것은 당신이 가본 가장 미친 아시아 시장과 비슷하지만, 망고스틴을 파는 대신 만화와 마더보드를 팔고 있다 - 그리고 판매자들은 강매할 뿐만 아니라, 미리 녹음되어 있다."[NEWLINE] - 아키하바라에 대한 "론리 플래닛"[NEWLINE]'),
			('TXT_KEY_WONDER_AKIHABARA_PEDIA',	'작성 필요'),
			('TXT_KEY_WONDER_AKIHABARA_HELP',	'상인 슬롯 +2. 제국의 모든 시장에서 [ICON_PRODUCTION] 생산력 +1, [ICON_GOLD] 골드 +2, [ICON_CULTURE] 문화 +1. 제국의 모든 세관에서 [ICON_PRODUCTION] 생산력 +1 및 [ICON_GOLD] 골드 +1. 제국의 모든 상인 전문가로부터 [ICON_PRODUCTION] 생산력 +2.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]아키하바라 전자상가[ENDCOLOR]는 상인들(+2 [ICON_GREAT_MERCHANT] 슬롯; +2[ICON_PRODUCTION]/[ICON_GREAT_MERCHANT][ICON_GREAT_MERCHANT])이 상상할 수 있는 모든 종류의 전자 제품을 파는 곳입니다. 이러한 [COLOR_YIELD_FOOD]시장[ENDCOLOR](+1[ICON_PRODUCTION], +2[ICON_GOLD], +1[ICON_CULTURE]/모든 [COLOR_YIELD_FOOD]시장[ENDCOLOR])은 지역적으로 운영되지만, 모든 제품은 [COLOR_CITY_BROWN]세관[ENDCOLOR](+1[ICON_PRODUCTION], +1[ICON_GOLD]/[ICON_MUSHROOM][ICON_MUSHROOM])을 통해 해외로 판매되어 세계의 전자 산업을 지원합니다.'
WHERE Tag = 'TXT_KEY_WONDER_AKIHABARA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_AKIHABARA_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_AKIHABARA_HELP';
				
UPDATE Language_ko_KR SET Text = '시설: [COLOR_CYAN]마을[ENDCOLOR]; 도시: [COLOR_CYAN]상인 전문가 3명[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_AKIHABARA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = ''||Text WHERE Tag ='TXT_KEY_WONDER_AKIHABARA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Rockefeller Center
INSERT INTO Language_ko_KR 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_ROCKEFELLER',		'록펠러 센터'),
			('TXT_KEY_WONDER_ROCKEFELLER_QUOTE',	'[NEWLINE]"사업에 기반을 둔 우정은 우정에 기반을 둔 사업보다 낫다."[NEWLINE] - 존 D. 록펠러[NEWLINE]'),
			('TXT_KEY_WONDER_ROCKEFELLER_PEDIA',	'작성 필요'),
			('TXT_KEY_WONDER_ROCKEFELLER_HELP',		'이 도시가 건설된 도시에 [COLOR_POSITIVE_TEXT]무료[ENDCOLOR] 연구소를 제공합니다. 제국의 모든 병원에서 [ICON_RESEARCH] 과학 +2. 제국의 모든 도시에 [ICON_GOLD] 골드 +3. 제국 내 각 [ICON_GOLD] 골드 구매로부터 5%의 [ICON_CULTURE] 문화를 받습니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]록펠러 센터[ENDCOLOR]는 국가의 다양한 분야를 강력하게 지원합니다: 경제(+3[ICON_GOLD]/도시), 문화(5%[ICON_CULTURE]/[ICON_GOLD][ICON_GOLD] 구매), 그리고 연구(+2[ICON_RESEARCH]/모든 [COLOR_YIELD_FOOD]병원[ENDCOLOR]). 이 복합 단지에서 운영되는 새로운 [COLOR_YIELD_FOOD]연구소[ENDCOLOR]([ICON_RESEARCH]) 덕분에 거대한 돌파구는 시간 문제일 뿐입니다.'
WHERE Tag = 'TXT_KEY_WONDER_ROCKEFELLER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_ROCKEFELLER_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_ROCKEFELLER_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 특성: [COLOR_CYAN]강[ENDCOLOR]; 건물: [COLOR_CYAN]오페라 하우스[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ROCKEFELLER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 특성: [COLOR_CYAN]강[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ROCKEFELLER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Autobahn
INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_AUTOBAHN',		'아우토반'),
			('TXT_KEY_WONDER_AUTOBAHN_QUOTE',	'[NEWLINE]"국민을 위한 자동차, 저렴한 폭스바겐은 대중에게 큰 기쁨을 가져다줄 것이며, 그러한 자동차를 만드는 문제는 용감하게 맞서야 한다."[NEWLINE] - 아돌프 히틀러[NEWLINE]'),
			('TXT_KEY_WONDER_AUTOBAHN_PEDIA',	'작성 필요'),
			('TXT_KEY_WONDER_AUTOBAHN_HELP',	'제국 내 [ICON_GOLDEN_AGE] 황금기 점수 +10%. +30% [ICON_WORKER] 시설 건설 속도. 도시 연결로부터 [ICON_GOLD] 골드 +15%. 제국의 모든 도시에서 [ICON_STRENGTH] 도시 방어력 +7.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]아우토반[ENDCOLOR]은 병력 기동을 개선하여 방어 능력을 높이고(+7[ICON_STRENGTH][ICON_STRENGTH]) 황금기로 나아가게 합니다(+5[ICON_GOLDEN_AGE]; +10%[ICON_GOLDEN_AGE][ICON_GOLDEN_AGE]). 또한 제품 흐름을 촉진하고(+15%[ICON_GOLD]/[ICON_CONNECTED][ICON_CONNECTED]) 전반적인 생산성을 높입니다(+30%[ICON_WORKER] 노동자 속도).'
WHERE Tag = 'TXT_KEY_WONDER_AUTOBAHN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_AUTOBAHN_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_AUTOBAHN_HELP';
				
UPDATE Language_ko_KR SET Text = '개선된 자원: [COLOR_CYAN]석유[ENDCOLOR]; 건물: [COLOR_CYAN]병기창, 사관학교[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_AUTOBAHN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '개선된 자원: [COLOR_CYAN]석유[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_AUTOBAHN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Interstate Highway System
INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_INTERSTATE',		'주간 고속도로 시스템'),
			('TXT_KEY_WONDER_INTERSTATE_QUOTE',	'[NEWLINE]"나는 거대한 고속도로망이 우리나라 전역에 퍼져 있는 미국을 본다."[NEWLINE] - 드와이트 D. 아이젠하워[NEWLINE]'),
			('TXT_KEY_WONDER_INTERSTATE_PEDIA',	'작성 필요'),
			('TXT_KEY_WONDER_INTERSTATE_HELP',	'제국의 모든 도시에 [ICON_CITIZEN] 인구 +1. 제국의 모든 도시에서 [ICON_HAPPINESS_3] 필요도 수정치가 5% 감소합니다. 제국 내 [ICON_PRODUCTION] 생산력 +10%. 도시 연결로부터 [ICON_GOLD] 골드 +15%.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]주간 고속도로 시스템[ENDCOLOR]은 국가의 모든 구석을 연결하여 가장 소외된 지역까지 개발합니다(+1[ICON_CITIZEN]; -5%[ICON_HAPPINESS_3][ICON_HAPPINESS_3] 필요도). 금 수입(+15%[ICON_GOLD]/[ICON_CONNECTED][ICON_CONNECTED])과 생산 능력(+10%[ICON_PRODUCTION][ICON_PRODUCTION])을 증가시킵니다.'
WHERE Tag = 'TXT_KEY_WONDER_INTERSTATE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_INTERSTATE_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_INTERSTATE_HELP';
				
UPDATE Language_ko_KR SET Text = '개선된 자원: [COLOR_CYAN]석유[ENDCOLOR]; 도시: [COLOR_CYAN]도시 8개[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_INTERSTATE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '개선된 자원: [COLOR_CYAN]석유[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_INTERSTATE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Hollywood
INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_HOLLYWOOD',		'할리우드'),
			('TXT_KEY_WONDER_HOLLYWOOD_QUOTE',	'[NEWLINE]"할리우드는 키스 한 번에 천 달러를, 당신의 영혼에 50센트를 지불하는 곳이다. 나는 첫 번째 제안을 충분히 거절하고 50센트를 고수했기 때문에 안다."[NEWLINE] - 마릴린 먼로[NEWLINE]'),
			('TXT_KEY_WONDER_HOLLYWOOD_PEDIA',	'작성 필요'),
			('TXT_KEY_WONDER_HOLLYWOOD_HELP',	'[COLOR_POSITIVE_TEXT]무료[ENDCOLOR] 정책. 새로운 정책을 잠금 해제할 때마다 75의 [ICON_TOURISM] 관광을 얻으며, 시대에 따라 증가합니다. 이 도시에서 [ICON_CULTURE] 지루함으로 인한 [ICON_HAPPINESS_3] 불행 -1, 제국 내 [ICON_CULTURE] 지루함으로 인한 [ICON_HAPPINESS_3] 불행 -5%. 모든 방송탑에서 [ICON_GOLD] 골드 +1 및 [ICON_CULTURE] 문화 +1, 제국의 모든 길드에서 [ICON_GOLD] 골드 +2, [ICON_CULTURE] 문화 +2, [ICON_TOURISM] 관광 +2.');
			
UPDATE Language_ko_KR
SET Text = '제국을 더 행복하게 만들고 싶다면 [COLOR_YIELD_FOOD]할리우드[ENDCOLOR]를 건설하십시오(-1[ICON_HAPPINESS_3] 지루함; -5%[ICON_HAPPINESS_3][ICON_HAPPINESS_3] 지루함). 이곳은 국가의 문화 중심지가 될 것이며(+1[ICON_TOURISM]; 정책 잠금 해제 시 75[ICON_TOURISM]; [COLOR_MAGENTA]무료 정책[ENDCOLOR]), 당신에게 이익을 가져다줄 것입니다(+1[ICON_GOLD], +1[ICON_CULTURE]/모든 [COLOR_YIELD_FOOD]방송탑[ENDCOLOR]; +2[ICON_GOLD], +2[ICON_CULTURE], +2[ICON_TOURISM]/모든 [COLOR_YIELD_FOOD]길드[ENDCOLOR])!'
WHERE Tag = 'TXT_KEY_WONDER_HOLLYWOOD_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_HOLLYWOOD_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_HOLLYWOOD_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]자유[ENDCOLOR]; 지형: [COLOR_CYAN]해안[ENDCOLOR], [COLOR_CYAN]초원[ENDCOLOR]; 부지: [COLOR_CYAN]언덕[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HOLLYWOOD_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]자유[ENDCOLOR]; 부지: [COLOR_CYAN]언덕[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HOLLYWOOD_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Concorde
INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_CONCORDE',		'콩코드'),
			('TXT_KEY_WONDER_CONCORDE_QUOTE',	'[NEWLINE]"나는 파리에 가서 에펠탑에서 뛰어내려야겠다. 콩코드를 타면 3시간 일찍 죽을 수 있을 텐데."[NEWLINE] - 우디 앨런[NEWLINE]'),
			('TXT_KEY_WONDER_CONCORDE_PEDIA',	'작성 필요'),
			('TXT_KEY_WONDER_CONCORDE_HELP',	'건설 시 20의 [ICON_INFLUENCE]를 부여합니다. 도시 연결로부터 [ICON_GOLD] 골드 +15%. [ICON_HAPPINESS_1] WLTKD 동안 [ICON_TOURISM] 관광 +25%.[NEWLINE][NEWLINE]모든 [ICON_RES_OIL] 석유: [ICON_TOURISM] 관광 +3.[NEWLINE]모든 [ICON_RES_ALUMINUM] 알루미늄: [ICON_TOURISM] 관광 +3.');
			
UPDATE Language_ko_KR
SET Text = '초음속 여객기 [COLOR_YIELD_FOOD]콩코드[ENDCOLOR]는 여객 비행의 효율성을 극적으로 높이고 관광 수입을 증대시킵니다(+3[ICON_TOURISM]; +3[ICON_TOURISM]/[ICON_RES_OIL][ICON_RES_OIL], [ICON_RES_ALUMINUM][ICON_RES_ALUMINUM]; +25%[ICON_TOURISM] WLTKD 동안). 세상은 당신의 것입니다(20[ICON_INFLUENCE]/[ICON_CITY_STATE][ICON_CITY_STATE]). 돈만 세면 됩니다(+15%[ICON_GOLD]/[ICON_CONNECTED][ICON_CONNECTED]).'
WHERE Tag = 'TXT_KEY_WONDER_CONCORDE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_CONCORDE_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_CONCORDE_HELP';
				
UPDATE Language_ko_KR SET Text = '개선된 자원: [COLOR_CYAN][ICON_RES_ALUMINUM] 알루미늄[ENDCOLOR]; 도시: [COLOR_CYAN]기술자 전문가 3명[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CONCORDE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '개선된 자원: [COLOR_CYAN][ICON_RES_ALUMINUM] 알루미늄[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CONCORDE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Sanbo Honbu
INSERT INTO Language_ko_KR 
			(Tag,										Text)
VALUES		('TXT_KEY_BUILDING_SANBO',					'삼보본부'),
			('TXT_KEY_WONDER_SANBO_QUOTE',				'[NEWLINE]"총력을 결집하여 미래를 위한 건설에 헌신하라. 정도의 길을 닦고, 고귀한 정신을 기르며, 결의를 다져 일하라 - 그리하여 제국의 타고난 영광을 높이고 세계의 진보와 보조를 맞출 수 있도록."[NEWLINE] - 히로히토[NEWLINE]'),
			('TXT_KEY_WONDER_SANBO_PEDIA',				'작성 필요'),
			('TXT_KEY_WONDER_SANBO_HELP',				'[COLOR_POSITIVE_TEXT]무료[ENDCOLOR] 정책. 제국의 모든 육상 군사 유닛은 [COLOR_POSITIVE_TEXT]황군[ENDCOLOR] 진급을, 제국의 모든 해상 근접 군사 유닛은 [COLOR_POSITIVE_TEXT]태양의 함대[ENDCOLOR] 진급을, 제국의 모든 공중 군사 유닛은 [COLOR_POSITIVE_TEXT]가미카제[ENDCOLOR] 진급을 얻습니다. 군사 유닛에 대한 [ICON_PRODUCTION] 생산력 +30%.'),
			('TXT_KEY_PROMOTION_SANBO_LAND',			'황군'),
			('TXT_KEY_PROMOTION_SANBO_LAND_HELP',		'[COLOR:255:230:85:255]강을 건넌 후[ENDCOLOR] 추가 [ICON_MOVES]이동 포인트. [COLOR:255:230:85:255]험지에서[ENDCOLOR] +10%[ICON_STRENGTH] 전투력/[ICON_RANGE_STRENGTH] 원거리 전투력.'),
			('TXT_KEY_PROMOTION_SANBO_SEA',				'태양의 함대'),
			('TXT_KEY_PROMOTION_SANBO_SEA_HELP',		'유닛이 [COLOR:255:230:85:255]공격하는 공중 유닛에게[ENDCOLOR] 피해를 줍니다. [ICON_RESEARCH][COLOR_RESEARCH_STORED]비행[ENDCOLOR] 기술 필요(잠수함 제외). 유닛이 [COLOR:255:230:85:255]다른 아군 유닛과 인접해 있을 경우[ENDCOLOR] +10%[ICON_STRENGTH] 전투력/[ICON_RANGE_STRENGTH] 원거리 전투력.'),
			('TXT_KEY_PROMOTION_SANBO_AIR',				'가미카제'),
			('TXT_KEY_PROMOTION_SANBO_AIR_HELP',		'유닛의 [COLOR:255:230:85:255]최대 HP가 20% 이하일 경우[ENDCOLOR] +30%[ICON_RANGE_STRENGTH] 원거리 전투력 [COLOR_GREY](비활성)[ENDCOLOR].'),
			('TXT_KEY_PROMOTION_SANBO_AIR_EFFECT',		'가미카제: 천황을 위하여!'),
			('TXT_KEY_PROMOTION_SANBO_AIR_EFFECT_HELP',	'유닛의 [COLOR:255:230:85:255]최대 HP가 20% 이하일 경우[ENDCOLOR] +30%[ICON_RANGE_STRENGTH] 원거리 전투력 [COLOR_POSITIVE_TEXT](활성)[ENDCOLOR].');

UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]삼보본부[ENDCOLOR]는 육군([COLOR_WATER_TEXT]황군[ENDCOLOR]/[COLOR_YIELD_GOLD]육군[ENDCOLOR]), 해군([COLOR_WATER_TEXT]태양의 함대[ENDCOLOR]/[COLOR_YIELD_GOLD]해군[ENDCOLOR]), 공군([COLOR_WATER_TEXT]가미카제[ENDCOLOR]/[COLOR_YIELD_GOLD]공군[ENDCOLOR]) 등 군대의 모든 병과를 강화합니다. 또한 병력 생산 시간을 단축하고(+30%[ICON_PRODUCTION]/군사) 내부 권력을 향상시킵니다([COLOR_MAGENTA]무료 정책[ENDCOLOR]). 덤으로 장군과 제독을 훨씬 더 빨리 얻을 수 있습니다(+2[ICON_GREAT_GENERAL]; +3[ICON_GREAT_ADMIRAL]).'
WHERE Tag = 'TXT_KEY_WONDER_SANBO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_SANBO_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_SANBO_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]전제정치[ENDCOLOR]; 지형: [COLOR_CYAN]해안[ENDCOLOR]; 건물: [COLOR_CYAN]병기창, 사관학교[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SANBO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]전제정치[ENDCOLOR]; 지형: [COLOR_CYAN]해안[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SANBO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Mount Rushmore
INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_RUSHMORE',		'러시모어 산'),
			('TXT_KEY_WONDER_RUSHMORE_QUOTE',	'[NEWLINE]"가장된 애국심의 사기 행위를 경계하라." - G. 워싱턴;   "진정한 원칙을 세우고, 그것을 확고하게 고수하라." - T. 제퍼슨;   "정부는 우리다; 우리는 정부다, 당신과 나." - T. 루스벨트;   "조용한 과거의 도그마는 폭풍우 치는 현재에 부적절하다." - A. 링컨[NEWLINE]'),
			('TXT_KEY_WONDER_RUSHMORE_PEDIA',	'작성 필요'),
			('TXT_KEY_WONDER_RUSHMORE_HELP',	'+1 [ICON_INFLUENCE] 세계 회의 투표권. +1 예술가 슬롯. 도시 경계 내 모든 산에서 [ICON_PRODUCTION] 생산력 +1, [ICON_CULTURE] 문화 +1, [ICON_TOURISM] 관광 +1. 제국의 모든 위대한 작품에서 [ICON_CULTURE] 문화 +1 및 [ICON_TOURISM] 관광 +1.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]러시모어 산[ENDCOLOR]은 [COLOR_CITY_BLUE]산[ENDCOLOR](+1[ICON_PRODUCTION], +1[ICON_CULTURE], +1[ICON_TOURISM]/[ICON_FLOWER])에 새겨진 환상적인 예술 작품입니다(+1 [ICON_GREAT_ARTIST] 슬롯). 이 작품은 사람들이 이 지역을 방문하는 주된 이유이며(+1[ICON_CULTURE], +1[ICON_TOURISM]/[ICON_GREAT_WORK][ICON_GREAT_WORK]), 추가로 국가 역사상 가장 위대한 4명을 기념합니다(+1[ICON_DIPLOMAT] 연맹 투표).'
WHERE Tag = 'TXT_KEY_WONDER_RUSHMORE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_RUSHMORE_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_RUSHMORE_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]산[ENDCOLOR]; 특성: [COLOR_CYAN]숲[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_RUSHMORE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]산[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_RUSHMORE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Statue of Liberty
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]자유의 여신상[ENDCOLOR]은 당신의 발전이 세계를 지배하는 최선의 방법이라는 것을 다른 공동체에 보여주는 신호입니다([COLOR_MAGENTA]무료 정책[ENDCOLOR]). 이러한 자신감은 시민들의 신뢰를 높여 모든 삶의 영역에서 더 생산적이게 만듭니다(+1[ICON_PRODUCTION]/모든 전문가).'
WHERE Tag = 'TXT_KEY_WONDER_STATUE_OF_LIBERTY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, 'Requires [COLOR_MAGENTA]Freedom[ENDCOLOR]. ', '') WHERE Tag ='TXT_KEY_WONDER_STATUE_OF_LIBERTY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_STATUE_OF_LIBERTY_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_STATUE_OF_LIBERTY_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]자유[ENDCOLOR]; 지형: [COLOR_CYAN]해안[ENDCOLOR]; 도시: [COLOR_CYAN]전문가 10명[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_STATUE_OF_LIBERTY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]자유[ENDCOLOR]; 지형: [COLOR_CYAN]해안[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_STATUE_OF_LIBERTY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Empire State Building
UPDATE Language_ko_KR
SET Text = '부자가 되는 것은 당신의 피에 흐르고 있으므로, [COLOR_YIELD_FOOD]엠파이어 스테이트 빌딩[ENDCOLOR] 건설은 필연적입니다(+1[ICON_GOLD]/모든 전문가). 이곳은 은행가들이 막대한 이익을 창출하고 사람들이 미래를 바꾸기 위해 모이는 [COLOR_YIELD_FOOD]증권 거래소[ENDCOLOR]([ICON_GOLD]; [ICON_GREAT_MERCHANT])입니다([COLOR_YIELD_GOLD]무료 [ICON_GREAT_PEOPLE][ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_BUILDING_EMPIRE_STATE_BUILDING_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,												Text) 
SELECT		'TXT_KEY_BUILDING_EMPIRE_STATE_BUILDING_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_EMPIRE_STATE_BUILDING_HELP';
				
UPDATE Language_ko_KR SET Text = '부지: [COLOR_CYAN]평지[ENDCOLOR]; 개선된 자원: [COLOR_CYAN]알루미늄[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_EMPIRE_STATE_BUILDING_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '부지: [COLOR_CYAN]평지[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_EMPIRE_STATE_BUILDING_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Kremlin
UPDATE Language_ko_KR
SET Text = '거대한 [COLOR_YIELD_FOOD]크렘린[ENDCOLOR]은 당신의 힘을 보여주는 가장 큰 노력입니다. 탱크는 당신의 군대의 주요 부분이 되어(+33%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]기갑[ENDCOLOR]) 문명을 안전하게 지킵니다(-1[ICON_HAPPINESS_3] 고통). 이것은 당신의 문화의 상징이 될 것입니다([COLOR_MAGENTA]무료 정책[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_KREMLIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, 'Must be built in a Holy City. ', '') WHERE Tag ='TXT_KEY_WONDER_KREMLIN_HELP';
	
INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_KREMLIN_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_KREMLIN_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]질서[ENDCOLOR]; 지형: [COLOR_CYAN]툰드라[ENDCOLOR], [COLOR_NEGATIVE_TEXT]해안[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_KREMLIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]질서[ENDCOLOR]; 지형: [COLOR_NEGATIVE_TEXT]해안[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_KREMLIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Motherland Calls
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]조국 어머니상[ENDCOLOR]은 [COLOR_YIELD_FOOD]경찰서[ENDCOLOR]([ICON_SPY]; [ICON_HAPPINESS_3]; [ICON_CULTURE]; [ICON_RESEARCH])를 사용하여 내부 보안을 강화하고, 이 도시에서 더 많은 병력을 동원할 수 있게 합니다(+100%의 [ICON_CITIZEN]을 [ICON_SILVER_FIST]으로). 도시 기반 시설 유지비가 훨씬 낮아지고(-10%[ICON_GOLD][ICON_GOLD] 유지비) 적들이 약탈에 덜 성공하게 됩니다(적들은 약탈로 HP를 회복하거나 [ICON_GOLD]를 얻을 수 없음).'
WHERE Tag = 'TXT_KEY_WONDER_MOTHERLAND_STATUE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, 'Requires [COLOR_MAGENTA]Order[ENDCOLOR]. ', '') WHERE Tag ='TXT_KEY_WONDER_MOTHERLAND_STATUE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_MOTHERLAND_STATUE_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_MOTHERLAND_STATUE_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_NEGATIVE_TEXT]해안[ENDCOLOR]; 부지: [COLOR_CYAN]언덕[ENDCOLOR]; 특성: [COLOR_CYAN]강[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MOTHERLAND_STATUE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '부지: [COLOR_CYAN]언덕[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MOTHERLAND_STATUE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Cristo Redentor
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]구세주 그리스도상[ENDCOLOR]은 전 세계 관광객들을 위한 초대장이며(+25[ICON_TOURISM]), 당신의 [COLOR_YIELD_FOOD]호텔[ENDCOLOR](+2[ICON_CULTURE]; +2[ICON_GOLDEN_AGE]; +2[ICON_TOURISM])을 당신의 재산의 중요한 부분으로 만들 것입니다.'
WHERE Tag = 'TXT_KEY_WONDER_CRISTO_REDENTOR_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_CRISTO_REDENTOR_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_CRISTO_REDENTOR_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 부지: [COLOR_CYAN]언덕[ENDCOLOR]; 특성: [COLOR_CYAN]숲/정글[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CRISTO_REDENTOR_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 부지: [COLOR_CYAN]언덕[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CRISTO_REDENTOR_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Broadway
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]브로드웨이[ENDCOLOR]는 재능 있는 음악가들에게 완벽한 장소이며([COLOR_YIELD_GOLD]무료 [ICON_GREAT_MUSICIAN][ENDCOLOR]), 그들은 이곳에서 상상력의 결실을 선보일 수 있습니다(3[ICON_GREAT_WORK], 테마가 있는 경우: [ICON_GOLD]). 그리고 이 도시의 모든 미래 건설은 그들에 의해 보상받을 것입니다(건설 시 250[ICON_CULTURE]).'
WHERE Tag = 'TXT_KEY_WONDER_BROADWAY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, 'Requires completion of [COLOR_MAGENTA]Industry[ENDCOLOR] Branch. ', '') WHERE Tag ='TXT_KEY_WONDER_BROADWAY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_BROADWAY_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_BROADWAY_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]산업 완성[ENDCOLOR]; 부지: [COLOR_CYAN]평지[ENDCOLOR]; 위대한 작품: [COLOR_CYAN]위대한 음악 작품 3개[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BROADWAY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]산업 완성[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BROADWAY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Prora
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]프로라[ENDCOLOR] 휴양 센터는 시민들을 더 행복하게 만들고(+1[ICON_HAPPINESS_1]; 2[COLOR_MAGENTA]정책[ENDCOLOR]당 +1[ICON_HAPPINESS_1]) 더 효율적으로 발전하도록 독려합니다([COLOR_MAGENTA]무료 정책[ENDCOLOR]). 추가로 미래의 불가사의 건설을 보호하고(적의 불가사의 방해 확률 감소) 적의 땅을 파괴하는 병사들에게 보상을 줍니다(약탈 시 25[ICON_CULTURE]).'
WHERE Tag = 'TXT_KEY_WONDER_PRORA_RESORT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, 'Requires [COLOR_MAGENTA]Autocracy[ENDCOLOR] and can only be constructed in coastal City. ', '') WHERE Tag ='TXT_KEY_WONDER_PRORA_RESORT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_PRORA_RESORT_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_PRORA_RESORT_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]전제정치[ENDCOLOR]; 지형: [COLOR_CYAN]해안[ENDCOLOR]; 부지: [COLOR_CYAN]평지[ENDCOLOR]; 특성: [COLOR_CYAN]숲/정글[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PRORA_RESORT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]전제정치[ENDCOLOR]; 지형: [COLOR_CYAN]해안[ENDCOLOR]; 부지: [COLOR_CYAN]평지[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PRORA_RESORT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
----------------------------------------------------
-- Habitat-67
INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_HABITAT',		'해비타트 67'),
			('TXT_KEY_WONDER_HABITAT_QUOTE',	'[NEWLINE]"집은 벽과 들보로 만들어지고, 가정은 사랑과 꿈으로 지어진다."[NEWLINE] - 랠프 월도 에머슨[NEWLINE]'),
			('TXT_KEY_WONDER_HABITAT_PEDIA',	'작성 필요'),
			('TXT_KEY_WONDER_HABITAT_HELP',		'도시에 [ICON_CITIZEN] 인구 3명을 얻습니다. 지역 정원, 박물관, 병원, 경찰서에서 [ICON_HAPPINESS_1] 행복 +1, 도시화로 인한 [ICON_HAPPINESS_3] 불행 -3, 도시의 고통으로 인한 [ICON_HAPPINESS_3] 불행 -2. 모든 기술자 전문가로부터 [ICON_CULTURE] 문화 +1.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]해비타트 67[ENDCOLOR]은 당신의 도시를 낙원으로 만드는 데 완전히 집중합니다. 매우 붐빌 수 있지만(+3[ICON_CITIZEN]), 삶의 질은 크게 향상되고(-3[ICON_HAPPINESS_3] 도시화; -2[ICON_HAPPINESS_3] 고통), 주민들은 더 나은 기반 시설(+1[ICON_HAPPINESS_1]/[COLOR_YIELD_FOOD]정원[ENDCOLOR], [COLOR_YIELD_FOOD]박물관[ENDCOLOR], [COLOR_YIELD_FOOD]병원[ENDCOLOR], [COLOR_YIELD_FOOD]경찰서[ENDCOLOR])의 혜택을 누릴 수 있으며, 기술자들은 여전히 더 많은 것을 찾고 있습니다(+1[ICON_CULTURE]/[ICON_GREAT_ENGINEER][ICON_GREAT_ENGINEER]).'
WHERE Tag = 'TXT_KEY_WONDER_HABITAT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_HABITAT_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_HABITAT_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]툰드라[ENDCOLOR]; 특성: [COLOR_CYAN]강[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HABITAT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]툰드라[ENDCOLOR]; 특성: [COLOR_CYAN]강[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HABITAT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Vostok Station
INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_VOSTOK',			'보스토크 기지'),
			('TXT_KEY_WONDER_VOSTOK_QUOTE',		'[NEWLINE]"황량한 해안과 배경의 높은 얼음 장벽에는 기괴한 펭귄들이 무수히 꽥꽥거리고 지느러미를 퍼덕였다. 물 위에는 많은 뚱뚱한 물개들이 헤엄치거나 천천히 떠다니는 큰 얼음 조각 위에 널브러져 있는 것이 보였다."[NEWLINE] - H.P. 러브크래프트[NEWLINE]'),
			('TXT_KEY_WONDER_VOSTOK_PEDIA',		'작성 필요'),
			('TXT_KEY_WONDER_VOSTOK_HELP',		'모든 연구소는 [ICON_RESEARCH] 과학 +2, 모든 의료 연구소는 [ICON_FOOD] 식량 +3을 얻습니다. 이 도시가 점유한 설원 타일에 [ICON_FOOD] 식량 +1, [ICON_PRODUCTION] 생산력 +1, [ICON_RESEARCH] 과학 +4. 이 도시가 점유한 모든 호수 타일에 [ICON_RESEARCH] 과학 +5. 이 도시에 과학자 전문가 슬롯 +3.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]보스토크 기지[ENDCOLOR]는 세계에서 가장 추운 곳에 지어져 [COLOR_CITY_BLUE]설원[ENDCOLOR](+1[ICON_FOOD], +1[ICON_PRODUCTION], +4[ICON_RESEARCH]/[ICON_FLOWER])이나 지하 [COLOR_CITY_GREEN]호수[ENDCOLOR](+5[ICON_RESEARCH]/[ICON_MUSHROOM])와 관련된 많은 특이한 연구를 수행할 수 있습니다(+3[ICON_GREAT_SCIENTIST]). 모든 샘플은 전 세계 모든 종류의 연구 시설에서 분석됩니다(+3[ICON_FOOD]/모든 [COLOR_YIELD_FOOD]의료 연구소[ENDCOLOR]; +2[ICON_RESEARCH]/모든 [COLOR_YIELD_FOOD]연구소[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_VOSTOK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_VOSTOK_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_VOSTOK_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]설원[ENDCOLOR]; 부지: [COLOR_CYAN]평지[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_VOSTOK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]설원[ENDCOLOR]; 부지: [COLOR_CYAN]평지[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_VOSTOK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Milestii Mici Winery
INSERT INTO Language_ko_KR 
			(Tag,										Text)
VALUES		('TXT_KEY_BUILDING_MILESTII_MICI',			'밀레스티 미치 와이너리'),
			('TXT_KEY_WONDER_MILESTII_MICI_QUOTE',		'[NEWLINE]"나는 더 이상 술을 마시지 않는다는 것은 사실이다. 하지만 덜 마시는 것도 아니다."[NEWLINE] - W.C. 필즈[NEWLINE]'),
			('TXT_KEY_WONDER_MILESTII_MICI_PEDIA',		'작성 필요'),
			('TXT_KEY_WONDER_MILESTII_MICI_HELP',		'제국 내 [ICON_GOLD] 즉시 구매 비용 수정치 -10. 도시 국가 친구마다 [ICON_FOOD] 식량 +1 및 [ICON_GOLD] 골드 +1; 도시 국가 동맹마다 [ICON_FOOD] 식량 +2, [ICON_PRODUCTION] 생산력 +1, [ICON_GOLD] 골드 +2. 모든 상인 전문가는 [ICON_FOOD] 식량 +1 및 [ICON_PRODUCTION] 생산력 +1을 얻습니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]밀레스티 미치 와이너리[ENDCOLOR]는 유럽 전역과 전 세계의 최고급 와인을 보유하고 있습니다(+1[ICON_FOOD], +1[ICON_GOLD]/[ICON_CITY_STATE] 친구; +2[ICON_FOOD], +1[ICON_PRODUCTION], +2[ICON_GOLD]/[ICON_CITY_STATE] 동맹). 고용된 상인들은 그것들을 모두 한 곳에 모으기 위해 최선을 다하며(+1[ICON_FOOD], +1[ICON_PRODUCTION]/[ICON_GREAT_MERCHANT][ICON_GREAT_MERCHANT]), 이 모든 거래된 상품들은 새로운 투자의 전반적인 가격을 개선할 수 있습니다(-10[ICON_GOLD][ICON_GOLD] 즉시 구매 비용 수정치).'
WHERE Tag = 'TXT_KEY_WONDER_MILESTII_MICI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_MILESTII_MICI_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_MILESTII_MICI_HELP';
				
UPDATE Language_ko_KR SET Text = '특성: [COLOR_NEGATIVE_TEXT]물[ENDCOLOR], [COLOR_CYAN]숲[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MILESTII_MICI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특성: [COLOR_NEGATIVE_TEXT]물[ENDCOLOR], [COLOR_CYAN]숲[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MILESTII_MICI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- JFK Space Center
INSERT INTO Language_ko_KR 
			(Tag,							Text)
VALUES		('TXT_KEY_BUILDING_JFK',		'JFK 우주 센터'),
			('TXT_KEY_WONDER_JFK_QUOTE',	'[NEWLINE]"지구의 모습은 정말 장관이며, 뒤돌아보며 당신의 행성을 행성으로 보는 느낌은 정말 놀라운 느낌이다. 그것은 완전히 다른 관점이며, 실제로 우리의 존재가 얼마나 연약한지 감사하게 만든다."[NEWLINE] - 샐리 라이드[NEWLINE]'),
			('TXT_KEY_WONDER_JFK_PEDIA',	'작성 필요'),
			('TXT_KEY_WONDER_JFK_HELP',		'[COLOR_POSITIVE_TEXT]무료[ENDCOLOR] 정책. 우주선 부품에 대한 [ICON_PRODUCTION] 생산력 +20%. 이 도시에 공중 유닛 슬롯 +2. 도시의 문맹으로 인한 [ICON_HAPPINESS_3] 불행 -1. [COLOR_CYAN]인공위성[ENDCOLOR] 발견 시 [ICON_RESEARCH] 과학 +3.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]JFK 우주 센터[ENDCOLOR]는 하늘에 닿기를 바라는 자유의 목소리입니다(+2[ICON_BULLET]공중 슬롯; +20%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]우주선 부품[ENDCOLOR]). 군사 프로젝트임에도 불구하고, 민간인들도 새로운 기술(-2[ICON_HAPPINESS_3] 문맹; [COLOR_CYAN]인공위성[ENDCOLOR]: +3[ICON_RESEARCH])의 혜택을 누릴 수 있습니다. 그러나 새로운 기술뿐만 아니라 새로운 개혁도 함께 올 수 있습니다([COLOR_MAGENTA]무료 정책[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_JFK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_JFK_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_JFK_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]자유[ENDCOLOR]; 부지: [COLOR_CYAN]평지[ENDCOLOR]; 지형: [COLOR_CYAN]해안[ENDCOLOR]; 건물: [COLOR_CYAN]연구소[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_JFK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]자유[ENDCOLOR]; 부지: [COLOR_CYAN]평지[ENDCOLOR]; 지형: [COLOR_CYAN]해안[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_JFK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Sputnik
INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_SPUTNIK',		'스푸트니크'),
			('TXT_KEY_WONDER_SPUTNIK_QUOTE',	'[NEWLINE]"이제 옛것과 새것을 영원히 구분하는 소리를 들어보십시오. [스푸트니크 위성이 전송하는 삐-삐 소리를 소개합니다.]"[NEWLINE] - NBC 라디오[NEWLINE]'),
			('TXT_KEY_WONDER_SPUTNIK_PEDIA',	'작성 필요'),
			('TXT_KEY_WONDER_SPUTNIK_HELP',		'[COLOR_POSITIVE_TEXT]무료[ENDCOLOR] 정책. 우주선 부품에 대한 [ICON_PRODUCTION] 생산력 +20%. [ICON_GOLDEN_AGE] 황금기를 시작합니다. 이 도시에서 [ICON_GREAT_ENGINEER] 위대한 기술자 생성률 +33% 및 [ICON_GREAT_SCIENTIST] 위대한 과학자 생성률 +25%.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]스푸트니크[ENDCOLOR]는 우주로 가는 길의 이정표입니다(+20%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]우주선 부품[ENDCOLOR]; 황금기 시작). 제국의 많은 다른 전문 분야가 이 위성이 만든 발견으로부터 혜택을 받을 것이며(+33%[ICON_GREAT_ENGINEER]; +25%[ICON_GREAT_SCIENTIST]), 시민들은 말할 것도 없습니다([COLOR_MAGENTA]무료 정책[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_SPUTNIK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_SPUTNIK_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_SPUTNIK_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]질서[ENDCOLOR]; 개선된 자원: [COLOR_CYAN][ICON_RES_ALUMINUM] 알루미늄[ENDCOLOR]; 도시: [COLOR_CYAN]과학자 전문가 3명[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SPUTNIK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]질서[ENDCOLOR]; 개선된 자원: [COLOR_CYAN][ICON_RES_ALUMINUM] 알루미늄[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SPUTNIK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Anitkabir
INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_ANITKABIR',		'아느트카비르'),
			('TXT_KEY_WONDER_ANITKABIR_QUOTE',	'[NEWLINE]"가정의 평화, 세계의 평화."[NEWLINE] - 무스타파 케말 아타튀르크[NEWLINE]'),
			('TXT_KEY_WONDER_ANITKABIR_PEDIA',	'작성 필요'),
			('TXT_KEY_WONDER_ANITKABIR_HELP',	'[COLOR_POSITIVE_TEXT]무료[ENDCOLOR] 정책. +1 [ICON_INFLUENCE] 세계 회의 투표권 및 통제하는 각 적 수도마다 +1 [ICON_INFLUENCE] 세계 회의 투표권. 외교 유닛에 대한 [ICON_PRODUCTION] 생산력 +50%.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]아느트카비르[ENDCOLOR]는 평화로운 세계에 대한 꿈을 실현합니다. 외교적 접촉을 훨씬 쉽게 만들고(+50%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]외교[ENDCOLOR]) 세계 회의에서의 협상을 당신 편에 더 유리하게 만듭니다(+1[ICON_DIPLOMAT] 연맹 투표; +1[ICON_DIPLOMAT] 연맹 투표/통제하는 적 수도). 사람들은 당신과 당신의 정치를 사랑하게 될 것입니다([COLOR_MAGENTA]무료 정책[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_ANITKABIR_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_ANITKABIR_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_ANITKABIR_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]전제정치[ENDCOLOR]; 지형: [COLOR_NEGATIVE_TEXT]해안[ENDCOLOR]; 부지: [COLOR_CYAN]언덕[ENDCOLOR]; 특성: [COLOR_CYAN]숲[ENDCOLOR]/[COLOR_CYAN]정글[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ANITKABIR_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]전제정치[ENDCOLOR]; 부지: [COLOR_CYAN]언덕[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ANITKABIR_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Thule Air Base
INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_THULE',			'툴레 공군 기지'),
			('TXT_KEY_WONDER_THULE_QUOTE',		'[NEWLINE]"현대적이고, 자율적이며, 철저하게 훈련된 공군이 항상 존재하는 것만으로는 충분하지 않겠지만, 그것 없이는 국가 안보가 있을 수 없다."[NEWLINE] - 헨리 H. 아놀드[NEWLINE]'),
			('TXT_KEY_WONDER_THULE_PEDIA',		'작성 필요'),
			('TXT_KEY_WONDER_THULE_HELP',		'이 도시에서 생산된 모든 비행기에 경험치 +10, 제국에서 생산된 모든 비행기에 경험치 +5. 이 도시에 공중 유닛 슬롯 +3, 제국 내 군사 유닛 공급 한도 +2 [ICON_SILVER_FIST]. 모든 비행기는 [COLOR_POSITIVE_TEXT]작전 범위[ENDCOLOR] 진급을 얻습니다.'),
			('TXT_KEY_PROMOTION_THULE',			'작전 범위'),
			('TXT_KEY_PROMOTION_THULE_HELP',	'+5%[ICON_RANGE_STRENGTH] 공격 원거리 전투력. +2 [ICON_SWAP] 범위.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]툴레 공군 기지[ENDCOLOR]는 지역 격납고에 더 많은 비행기를 보관하고(+3[ICON_BULLET]공중 슬롯; +2[ICON_SILVER_FIST]), 더 나은 조종사를 훈련하며(+10 XP 지역 비행기; +5 XP 전역 비행기), 전반적인 유닛 능력을 향상시켜([COLOR_WATER_TEXT]작전 범위[ENDCOLOR]/[COLOR_YIELD_GOLD]비행기[ENDCOLOR]) 공중 우위를 강화합니다.'
WHERE Tag = 'TXT_KEY_WONDER_THULE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_THULE_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_THULE_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]설원[ENDCOLOR], [COLOR_CYAN]해안[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_THULE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]설원[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_THULE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- White Sands Missile Range
INSERT INTO Language_ko_KR 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_WHITE_SANDS',		'화이트 샌즈 미사일 시험장'),
			('TXT_KEY_WONDER_WHITE_SANDS_QUOTE',	'[NEWLINE]"자부심이란 무엇인가? 별을 모방하는 로켓이다."[NEWLINE] - 윌리엄 워즈워스[NEWLINE]'),
			('TXT_KEY_WONDER_WHITE_SANDS_PEDIA',	'화이트 샌즈 미사일 시험장은 뉴멕시코 사막에 있는 거의 8300 평방 킬로미터(3200 평방 마일)에 달하는 미국 최대의 군사 시설입니다. 이 지역은 1941년 앨라모고도 육군 비행장이 설립되면서 처음으로 군사 부지로 지정되었습니다. 이 장소는 1945년 7월 최초의 원자 폭탄 실험(트리니티 실험)에 사용되었으며, 그때까지 화이트 샌즈 시험장으로 이름이 바뀌었습니다.[NEWLINE][NEWLINE]  그 이후로 이 장소는 포획된 V-2 탄도 미사일, 아폴로 탈출 시스템, 초기 우주 왕복선 실험의 착륙장 등 군사 및 탐사 프로젝트의 실험 프로젝트와 시험 발사에 많이 관여해 왔습니다. 우주 경쟁 실험에서의 역할로 국립 역사 유적지로 지정되었으며, 계속해서 빈번한 미사일 실험을 하고 있습니다.'),
			('TXT_KEY_WONDER_WHITE_SANDS_HELP',		'3개의 [COLOR_POSITIVE_TEXT]유도 미사일[ENDCOLOR]을 무료로 부여합니다. 이 도시에서 미사일 건설 시 [ICON_PRODUCTION] 생산력 +33%, 우주선 부품 건설 시 [ICON_PRODUCTION] 생산력 +10%. 미사일 유닛은 +2 [ICON_RANGE_STRENGTH] 작전 범위를 확장하는 [COLOR_POSITIVE_TEXT]화이트 샌즈 시설[ENDCOLOR] 진급을 얻습니다.'),
			('TXT_KEY_PROMOTION_WHITE_SANDS',		'화이트 샌즈 시설'),
			('TXT_KEY_PROMOTION_WHITE_SANDS_HELP',	'+2 [ICON_SWAP] 범위.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]화이트 샌즈 미사일 시험장[ENDCOLOR]은 수많은 실험을 통해 로켓 공학을 최고 수준으로 끌어올린 시설입니다([COLOR_WATER_TEXT]화이트 샌즈 시설[ENDCOLOR]/[COLOR_YIELD_GOLD]미사일[ENDCOLOR]). 최신 기술을 사용하여 로켓은 저렴하고 쉽게 제조할 수 있습니다(+33%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]미사일[ENDCOLOR]; +10%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]우주선 부품[ENDCOLOR]; 3개의 [COLOR_YIELD_GOLD]무료 유도 미사일[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_WHITE_SANDS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_WHITE_SANDS_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_WHITE_SANDS_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]제국주의 완성[ENDCOLOR]; 지형: [COLOR_CYAN]사막[ENDCOLOR]; 부지: [COLOR_CYAN]평지[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_WHITE_SANDS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]제국주의 완성[ENDCOLOR]; 지형: [COLOR_CYAN]사막[ENDCOLOR]; 부지: [COLOR_CYAN]평지[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_WHITE_SANDS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Millau Viaduct
INSERT INTO Language_ko_KR 
			(Tag,							Text)
VALUES		('TXT_KEY_BUILDING_MILLAU',		'미요 대교'),
			('TXT_KEY_WONDER_MILLAU_QUOTE',	'[NEWLINE]"그림자가 있는 구름 위에는 빛이 있는 별이 있다. 모든 것 위에 너 자신을 경외하라."[NEWLINE] - 피타고라스[NEWLINE]'),
			('TXT_KEY_WONDER_MILLAU_PEDIA',	'미요 대교는 프랑스 남부 미요의 타른 강 계곡을 가로지르는 사장교입니다. 길이는 2,460미터이며 세계에서 가장 높은 다리로, 가장 높은 지점은 바닥에서 343미터입니다. 이 대교는 파리에서 프랑스 남부 몽펠리에까지 이어지는 고속도로의 일부입니다. 또한 프랑스에서 가장 높은 구조물로, P2 기둥은 에펠탑보다 높습니다. 고속도로 노선은 1989년에 선택되었으며, 건설은 2001년에 시작되어 5년이 걸렸습니다.'),
			('TXT_KEY_WONDER_MILLAU_HELP',	'제국 내 [ICON_TOURISM] 관광 +5%. 이 도시에서 생산된 [ICON_PRODUCTION] 생산력의 5%를 [ICON_TOURISM] 관광으로 전환합니다. 도시의 전문가 2명은 더 이상 도시화로 인한 [ICON_HAPPINESS_3] 불행을 생성하지 않습니다. 육상 [ICON_INTERNATIONAL_TRADE] 교역로는 +100%의 범위를 얻습니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]미요 대교[ENDCOLOR]는 이러한 건설 없이는 통과하기 매우 어려운 계곡의 양쪽을 연결하여 지역 및 더 먼 시민들(-3[ICON_HAPPINESS_3] 도시화; +1[ICON_HAPPINESS_1])이나 관광객(+5%[ICON_TOURISM][ICON_TOURISM]; 5%[ICON_PRODUCTION]을 [ICON_TOURISM]으로 전환)의 삶을 훨씬 쉽게 만듭니다. 또한 국가 내에서 상품을 운송하는 새로운 더 짧은 길 역할을 합니다(육상 [ICON_INTERNATIONAL_TRADE]: +100%[ICON_SWAP]).'
WHERE Tag = 'TXT_KEY_WONDER_MILLAU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_MILLAU_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_MILLAU_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_NEGATIVE_TEXT]해안[ENDCOLOR]; 부지: [COLOR_CYAN]언덕[ENDCOLOR]; 시설: [COLOR_CYAN]마을[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MILLAU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '부지: [COLOR_CYAN]언덕[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MILLAU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Revolutionary Museum
INSERT INTO Language_ko_KR 
			(Tag,											Text)
VALUES		('TXT_KEY_BUILDING_REVOLUTIONARY_MUSEUM',		'혁명 박물관'),
			('TXT_KEY_WONDER_REVOLUTIONARY_MUSEUM_QUOTE',	'[NEWLINE]"억압받는 인민은 투쟁을 통해서만 해방될 수 있다. 이것은 역사가 확인한 단순하고 명백한 진리이다."[NEWLINE] - 김일성[NEWLINE]'),
			('TXT_KEY_WONDER_REVOLUTIONARY_MUSEUM_PEDIA',	'작성 필요'),
			('TXT_KEY_WONDER_REVOLUTIONARY_MUSEUM_HELP',	'[COLOR_POSITIVE_TEXT]무료[ENDCOLOR] 정책. 모든 기념비에서 [ICON_CULTURE] 문화 +3, 제국의 모든 경찰서와 경찰청에서 [ICON_TOURISM] 관광 +2. 이 도시에서 [ICON_GREAT_PEOPLE] 위인 생성률 +10%. 위인 소모 시 50의 [ICON_CULTURE] 문화를 얻으며, 시대에 따라 증가합니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]혁명 박물관[ENDCOLOR]은 당신의 문명 지도자들을 신처럼 찬양합니다(+3[ICON_CULTURE]/모든 [COLOR_YIELD_FOOD]기념비[ENDCOLOR]; 50[ICON_CULTURE]/[ICON_GREAT_PEOPLE]; [COLOR_MAGENTA]무료 정책[ENDCOLOR]). 또한 그의 자리에 합당한 후계자가 나올 가능성이 훨씬 높아집니다(+10%[ICON_GREAT_PEOPLE][ICON_GREAT_PEOPLE]). 모든 보안 기관은 전 세계 사람들에게 당신 나라의 가장 중요한 부분을 보여주기 위해 최선을 다합니다(+2[ICON_TOURISM]/모든 [COLOR_YIELD_FOOD]경찰서[ENDCOLOR], [COLOR_YIELD_FOOD]경찰청[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_REVOLUTIONARY_MUSEUM_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_REVOLUTIONARY_MUSEUM_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_REVOLUTIONARY_MUSEUM_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]질서[ENDCOLOR]; 부지: [COLOR_CYAN]평지[ENDCOLOR]; 건물: [COLOR_CYAN]방송탑, 경찰서[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_REVOLUTIONARY_MUSEUM_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]질서[ENDCOLOR]; 부지: [COLOR_CYAN]평지[ENDCOLOR]; 건물: [COLOR_CYAN]방송탑[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_REVOLUTIONARY_MUSEUM_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Arecibo Observatory
INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_ARECIBO',		'아레시보 천문대'),
			('TXT_KEY_WONDER_ARECIBO_QUOTE',	'[NEWLINE]"지구의 표면은 우주 바다의 해안이다. 우리는 그곳에서 우리가 아는 대부분을 배웠다. 최근에 우리는 바다로 조금 걸어 들어가 발가락을 적시거나 기껏해야 발목을 적셨다. 물은 매력적으로 보인다. 바다가 부른다."[NEWLINE] - 칼 세이건[NEWLINE]'),
			('TXT_KEY_WONDER_ARECIBO_PEDIA',	'아레시보 천문대는 너비 305미터(1000피트)로 세계에서 가장 큰 전파 망원경입니다. 1963년 푸에르토리코 아레시보 근처의 자연적으로 형성된 싱크홀에 건설되었습니다. 접시 모양의 반사경이 지상에 있고, 지면 고도 때문에 높이가 다른 세 개의 탑에 의해 접시 위에 매달린 큰 수신기로 구성되어 있습니다.[NEWLINE][NEWLINE]  1963년 건설 이후, 천문대는 다양한 목적으로 사용되었습니다. 원래 지구의 전리층(태양 복사가 여전히 대기에 영향을 미치는 85킬로미터 이상의 지구 대기층. 오로라는 이 층에서 형성됨)을 연구하기 위해 설계되었지만, 아레시보 천문대는 이후 다양한 발견을 했고 여러 연구 프로젝트에 사용되었습니다. 1990년, 망원경은 최초로 알려진 외계 행성(우리 태양계 밖에 존재하는 행성)을 발견하는 데 사용되었습니다. 또한 중성자별(뉴욕 브루클린 크기의 지역에 지구보다 50만 배 더 많은 질량을 가진 별)을 발견하는 데도 사용되었습니다. 또한 수많은 다른 천문학적 발견에도 사용되었습니다.[NEWLINE][NEWLINE]  1974년, 천문대는 1부터 10까지의 숫자, DNA 구성, 태양계 및 기타 정보를 포함하는 이진 문자 메시지를 약 25,000광년 떨어진 구상성단 M13이라는 별 무리를 향해 보내 지적 생명체와 접촉하기를 희망했습니다.'),
			('TXT_KEY_WONDER_ARECIBO_HELP',		'과학자 슬롯 +2. 제국의 모든 산 타일에서 [ICON_RESEARCH] 과학 +1. 제국의 모든 과학자 전문가로부터 [ICON_RESEARCH] 과학 +1. 제국의 모든 천문대에서 [ICON_RESEARCH] 과학 +2. [COLOR_POSITIVE_TEXT]추가[ENDCOLOR] [ICON_DOPLOMAT] 세계 회의 대표 1명을 받습니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]아레시보 천문대[ENDCOLOR]는 [COLOR_CITY_BLUE]산[ENDCOLOR](+1[ICON_RESEARCH]/[ICON_FLOWER][ICON_FLOWER] 해당 도시)에 건설된 과학적 이정표이며, 많은 지식 분야에서 과학을 증진하기 위해 전문가를 고용합니다(+2 [ICON_GREAT_SCIENTIST] 슬롯; +1[ICON_RESEARCH]/[ICON_GREAT_SCIENTIST][ICON_GREAT_SCIENTIST]). 이는 전 세계 과학자들을 통합하는 해결책이 될 수 있습니다(+1[ICON_DIPLOMAT] 연맹 투표).'
WHERE Tag = 'TXT_KEY_WONDER_ARECIBO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_ARECIBO_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_ARECIBO_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]합리주의 완성[ENDCOLOR]; 지형: [COLOR_CYAN]산[ENDCOLOR]; 시설: [COLOR_CYAN]아카데미[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ARECIBO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]합리주의 완성[ENDCOLOR]; 지형: [COLOR_CYAN]산[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ARECIBO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Pentagon
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]펜타곤[ENDCOLOR]은 도시의 군사 능력에 집중합니다(+1[ICON_SILVER_FIST][ICON_SILVER_FIST]; +2 전역 도시 공중 유닛 한도). 비행기 생산력 증가(+50%[ICON_PRODUCTION], +20 XP/[COLOR_YIELD_GOLD]공군[ENDCOLOR]; 2대의 [COLOR_YIELD_GOLD]무료 제트 전투기[ENDCOLOR]). 그리고 숨겨진 정보 기관 덕분에 스파이를 더 효과적으로 만들어 더 많은 일을 할 수 있습니다(적의 [ICON_PRODUCTION] 방해 확률 증가).'
WHERE Tag = 'TXT_KEY_WONDER_PENTAGON_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, 'Requires completion of [COLOR_MAGENTA]Imperialism[ENDCOLOR] Branch. ', '') WHERE Tag ='TXT_KEY_WONDER_PENTAGON_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_PENTAGON_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_PENTAGON_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]제국주의 완성[ENDCOLOR]; 특성: [COLOR_CYAN]강[ENDCOLOR]; 시설: [COLOR_CYAN]성채/요새[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PENTAGON_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]제국주의 완성[ENDCOLOR]; 시설: [COLOR_CYAN]성채/요새[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PENTAGON_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Bletchley Park
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]블레츨리 파크[ENDCOLOR]는 과학자(+1[ICON_RESEARCH]/모든 과학자)와 스파이(+200[ICON_VP_SPY_POINTS]; +20[ICON_SPY][ICON_SPY] 도시 보안)로 가득 찬 곳입니다. 가장 진보된 [COLOR_YIELD_FOOD]연구소[ENDCOLOR]([ICON_RESEARCH]; [ICON_GREAT_SCIENTIST]; [ICON_HAPPINESS_3])가 당신의 지식을 늘리기 위해 건설됩니다.'
WHERE Tag = 'TXT_KEY_BUILDING_BLETCHLEY_PARK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, 'Requires completion of [COLOR_MAGENTA]Rationalism[ENDCOLOR] Branch. ', '') WHERE Tag ='TXT_KEY_BUILDING_BLETCHLEY_PARK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_BUILDING_BLETCHLEY_PARK_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_BLETCHLEY_PARK_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]합리주의 완성[ENDCOLOR]; 지형: [COLOR_CYAN]초원[ENDCOLOR], [COLOR_NEGATIVE_TEXT]해안[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_BLETCHLEY_PARK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]합리주의 완성[ENDCOLOR]; 지형: [COLOR_NEGATIVE_TEXT]해안[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_BLETCHLEY_PARK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
----------------------------------------------------
-- Svalbard Global Seed Vault
INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_SEED_VAULT',		'스발바르 국제 종자 저장고'),
			('TXT_KEY_WONDER_SEED_VAULT_QUOTE',	'[NEWLINE]"시민 전쟁 중 시리아에서 파괴된 종자 컬렉션이 체계적으로 재건되었다는 사실은 저장고가 현재와 미래의 식량 공급 및 지역 식량 안보를 위한 보험 역할을 한다는 것을 보여준다."[NEWLINE] - 안네 베아테 트비네레임[NEWLINE]'),
			('TXT_KEY_WONDER_SEED_VAULT_PEDIA',	'작성 필요'),
			('TXT_KEY_WONDER_SEED_VAULT_HELP',	'제국 내 [ICON_FOOD] 식량 +10%. 제국 내 [ICON_FOOD]/[ICON_PRODUCTION] 고통으로 인한 [ICON_HAPPINESS_3] 불행 -15%. 모든 도시는 새로운 시민이 태어난 후 현재 [PRODUCTION]에 [ICON_PRODUCTION] 생산력의 50%를 추가합니다.[NEWLINE][NEWLINE]모든 [ICON_RES_WHEAT] 밀: [ICON_FOOD] 식량 +2.[NEWLINE]모든 [ICON_RES_MAIZE] 옥수수: [ICON_FOOD] 식량 +2.[NEWLINE]모든 [ICON_RES_RICE] 쌀: [ICON_FOOD] 식량 +2.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]스발바르 국제 종자 저장고[ENDCOLOR]는 비극적인 사건에 대비한 보험 정책입니다(+10%[ICON_FOOD][ICON_FOOD]). 가장 잘 알려진 식물의 씨앗을 포함하고 있으며(+2[ICON_FOOD]/[ICON_RES_WHEAT][ICON_RES_WHEAT], [ICON_RES_MAIZE][ICON_RES_MAIZE], [ICON_RES_RICE][ICON_RES_RICE]), 안전한 지역의 생산을 촉진하고(각 도시의 [ICON_PRODUCTION]의 50%가 [ICON_CITIZEN] 탄생 시 현재 [ICON_PRODUCTION]에 추가됨) 가장 큰 피해를 입은 사람들을 지원합니다(-15%[ICON_HAPPINESS_3][ICON_HAPPINESS_3] 고통).'
WHERE Tag = 'TXT_KEY_WONDER_SEED_VAULT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_SEED_VAULT_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_SEED_VAULT_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]설원[ENDCOLOR]; 특성: [COLOR_NEGATIVE_TEXT]물[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SEED_VAULT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]설원[ENDCOLOR]; 특성: [COLOR_NEGATIVE_TEXT]담수[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SEED_VAULT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Palm Jumeirah
INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_JUMEIRAH',		'팜 주메이라'),
			('TXT_KEY_WONDER_JUMEIRAH_QUOTE',	'[NEWLINE]"두바이의 세계적 수준의 물리적 인프라는 이미 무역, 관광 및 이 지역의 주요 회의 및 전시 장소로서 주요 플레이어로 자리 잡았다."[NEWLINE] - 압둘 아지즈 알 구라이르[NEWLINE]'),
			('TXT_KEY_WONDER_JUMEIRAH_PEDIA',	'아랍에미리트 두바이 해안에 위치한 팜 주메이라는 야자수 모양으로 사람이 만든 거대한 군도입니다. 2001년에 발표되었으며, 원래는 팜 제벨 알리, 팜 데이라와 함께 세 개의 "팜 아일랜드" 중 하나가 될 예정이었으며, 당시 팜 데이라는 세 섬 중 가장 큰 섬이 될 예정이었습니다. 이 군도의 총면적은 25 평방 킬로미터로, 800개 이상의 미식축구 경기장과 비슷합니다.[NEWLINE][NEWLINE] 팜 주메이라는 중앙 줄기, 300미터 길이의 다리로 본토와 연결된 16개의 야자수 잎, 그리고 건설을 둘러싼 11킬로미터의 방파제로 구성되어 있습니다. 전체적으로 이 섬들은 두바이의 기존 해안선을 두 배 이상 늘렸습니다.[NEWLINE][NEWLINE] 이 섬들은 또한 두바이의 다른 지역과 마찬가지로 새로운 개발과 리조트의 온상입니다. 2008년 방파제에 아틀란티스 리조트가 문을 열었고, 나중에 개발의 상징이 되었습니다.'),
			('TXT_KEY_WONDER_JUMEIRAH_HELP',	'이 도시에서 생산된 [ICON_PRODUCTION] 생산력의 10%를 [ICON_GOLD] 골드로, 또 다른 15%를 [ICON_TOURISM] 관광으로 전환합니다. 이 도시가 점유한 모든 사막 타일에서 [ICON_PRODUCTION] 생산력 +3. 제국의 모든 환초에서 [ICON_TOURISM] 관광 +7.[NEWLINE][NEWLINE]모든 [ICON_RES_OIL] 석유: [ICON_GOLD] 골드 +4.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]팜 주메이라[ENDCOLOR]라고 불리는 인공 섬은 부유한 관광객들을 위해 [COLOR_CITY_GREEN]환초[ENDCOLOR]에 새로운 공간을 만듭니다(+7[ICON_TOURISM]/[ICON_MUSHROOM][ICON_MUSHROOM]). 전체 건설은 지역 [COLOR_CITY_BLUE]사막[ENDCOLOR](+3[ICON_PRODUCTION]/[ICON_FLOWER]; 10%[ICON_PRODUCTION]을 [ICON_GOLD]으로; 15%[ICON_PRODUCTION]을 [ICON_TOURISM]으로)에서 모은 모래와 당신의 영토에서 발견된 [COLOR_GREY]석유[ENDCOLOR] 매장지(+4[ICON_GOLD]/[ICON_RES_OIL][ICON_RES_OIL]) 덕분에 가능했습니다.'
WHERE Tag = 'TXT_KEY_WONDER_JUMEIRAH_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_JUMEIRAH_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_JUMEIRAH_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 개선된 자원: [COLOR_CYAN]석유[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_JUMEIRAH_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_JUMEIRAH_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Taipei 101
INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_TAIPEI',			'타이베이 101'),
			('TXT_KEY_WONDER_TAIPEI_QUOTE',		'[NEWLINE]"모든 것은 디자인된다. 잘 디자인된 것은 거의 없다."[NEWLINE] - 브라이언 리드[NEWLINE]'),
			('TXT_KEY_WONDER_TAIPEI_PEDIA',		'타이베이 101은 대만 수도 타이베이에 있는 금융 타워입니다. 2004년부터 2010년까지 세계에서 가장 높은 건물이었으며, 두바이의 부르즈 할리파에 의해 추월당했습니다. 87층부터 91층까지 5개 층에 걸쳐 거대한 동조 질량 감쇠기가 있어 강풍으로 인한 진폭파로 인해 타워가 손상되는 것을 막습니다. 타워는 또한 상징성을 염두에 두고 설계되었습니다. 그림자를 드리우는 거대한 해시계일 뿐만 아니라, 8층짜리 8개 부분으로 구성되어 있으며, 8은 전통적으로 행운의 숫자입니다. 디자인은 또한 고대 중국 탑 디자인을 고려했습니다.'),
			('TXT_KEY_WONDER_TAIPEI_HELP',		'제국의 모든 기술자 전문가로부터 [ICON_GOLD] 골드 +1. 이 도시가 점유한 마을과 읍에서 [ICON_GOLD] 골드 +2. 제국의 모든 은행과 증권 거래소는 [ICON_GOLD] 골드 +2를 받습니다. [COLOR_POSITIVE_TEXT]추가[ENDCOLOR] [ICON_DOPLOMAT] 세계 회의 대표 1명을 받습니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]타이베이 101[ENDCOLOR]은 기술자들에게 큰 도전입니다(+1[ICON_RESEARCH]/[ICON_GREAT_ENGINEER][ICON_GREAT_ENGINEER]). 외교 거점(+1[ICON_DIPLOMAT] 연맹 투표), 비즈니스 센터(+2[ICON_GOLD]/모든 [COLOR_YIELD_FOOD]은행[ENDCOLOR], [COLOR_YIELD_FOOD]증권 거래소[ENDCOLOR]), 그리고 지역 [COLOR_CITY_BROWN]마을[ENDCOLOR]과 [COLOR_CITY_BROWN]읍[ENDCOLOR]을 연결하는 상업 허브 역할을 합니다(+2[ICON_GOLD]/[ICON_WORKER]).'
WHERE Tag = 'TXT_KEY_WONDER_TAIPEI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_TAIPEI_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_TAIPEI_HELP';
				
UPDATE Language_ko_KR SET Text = '시설: [COLOR_CYAN]마을[ENDCOLOR]; 플레이어: [COLOR_CYAN]동맹 도시 국가 3개[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_TAIPEI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = ''||Text WHERE Tag ='TXT_KEY_WONDER_TAIPEI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Curiosity Rover
INSERT INTO Language_ko_KR 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_CURIOSITY',			'큐리오시티 로버'),
			('TXT_KEY_WONDER_CURIOSITY_QUOTE',		'[NEWLINE]"우리가 완료한 프로젝트는 우리가 아는 것을 보여준다 - 미래의 프로젝트는 우리가 무엇을 배울지 결정한다."[NEWLINE] - 모신 티와나 박사[NEWLINE]'),
			('TXT_KEY_WONDER_CURIOSITY_PEDIA',		'작성 필요'),
			('TXT_KEY_WONDER_CURIOSITY_HELP',		'건설 시 50의 [ICON_INFLUENCE]를 부여합니다. 제국의 모든 과학자 및 기술자 전문가로부터 [ICON_GOLDEN_AGE] 황금기 점수 +3. 체결하는 각 연구 협정으로부터 전역 [ICON_GOLDEN_AGE] 황금기 점수 +10.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]큐리오시티 로버[ENDCOLOR]를 보내는 것은 다른 국가들에게 당신이 태양계를 지배할 힘과 의지가 있다는 것을 보여주는 충동입니다(50[ICON_INFLUENCE]/[ICON_CITY_STATE][ICON_CITY_STATE]). 이것은 한 황금기에서 다른 황금기로 이어지는 당신의 영광스러운 행진의 시작일 뿐입니다(+10[ICON_GOLDEN_AGE][ICON_GOLDEN_AGE]/연구 협정; +3[ICON_GOLDEN_AGE]/[ICON_GREAT_ENGINEER][ICON_GREAT_ENGINEER],[ICON_GREAT_SCIENTIST][ICON_GREAT_SCIENTIST]).'
WHERE Tag = 'TXT_KEY_WONDER_CURIOSITY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_CURIOSITY_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_CURIOSITY_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]산[ENDCOLOR]; 특성: [COLOR_NEGATIVE_TEXT]물[ENDCOLOR]; 개선된 자원: [COLOR_CYAN]알루미늄[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CURIOSITY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]사막[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CURIOSITY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Global Positioning System
INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_GPS',			'위성 위치 확인 시스템'),
			('TXT_KEY_WONDER_GPS_QUOTE',		'[NEWLINE]"세스나 150이 상공을 선회하는 미확인 공항, 신원을 밝혀라."[NEWLINE] - 조지 W. 스튜어트[NEWLINE]'),
			('TXT_KEY_WONDER_GPS_PEDIA',		'작성 필요'),
			('TXT_KEY_WONDER_GPS_HELP',			'[COLOR_POSITIVE_TEXT]추가[ENDCOLOR] [ICON_SPY] 스파이 2명 이상을 받습니다(게임 내 [ICON_CITY_STATE] 도시 국가 수에 따라). 제국 보안 수준을 20% 향상시킵니다. 성공적인 공격 첩보 활동에 대해 [ICON_GREAT_GENERAL] 위대한 장군 점수 25점과 [ICON_GREAT_ADMIRAL] 위대한 제독 점수 25점을 얻거나, 성공적인 방어 첩보 활동에 대해 [ICON_PRODUCTION] 생산력 50과 [ICON_GOLD] 골드 50을 얻습니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]위성 위치 확인 시스템[ENDCOLOR]은 국가의 보안을 유지하는 데 도움이 됩니다(+200[ICON_VP_SPY_POINTS]; +20[ICON_SPY][ICON_SPY] 도시 보안). 당신의 공격(25[ICON_GREAT_GENERAL], 25[ICON_GREAT_ADMIRAL]/[ICON_SPY] 공격)과 방어(50[ICON_PRODUCTION], 50[ICON_GOLD]/[ICON_SPY] 방어) 모두 아낌없이 보상받습니다.'
WHERE Tag = 'TXT_KEY_WONDER_GPS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_GPS_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_GPS_HELP';
				
UPDATE Language_ko_KR SET Text = '건물: [COLOR_CYAN]전략 방어 시스템[ENDCOLOR]; 개선된 자원: [COLOR_CYAN]우라늄[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GPS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '개선된 자원: [COLOR_CYAN]우라늄[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GPS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- CN Tower
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]CN 타워[ENDCOLOR]는 대중을 위한 특이한 [COLOR_YIELD_FOOD]방송탑[ENDCOLOR]([ICON_GREAT_WORK]; [ICON_CULTURE]; [ICON_TOURISM]; [ICON_HAPPINESS_3])입니다(+1[ICON_HAPPINESS_1]/도시). 모든 작품은 훨씬 더 가치 있게 되며(+2[ICON_GOLD], +2[ICON_TOURISM], +25%[ICON_TOURISM], +25%[ICON_TOURISM][ICON_TOURISM]/[ICON_GREAT_WORK][ICON_GREAT_WORK]) 모든 불가사의는 이제 관광 중심지가 됩니다(모든 [ICON_WONDER] [COLOR_YIELD_FOOD]세계 불가사의[ENDCOLOR], [COLOR_CITY_GREEN]자연 불가사의[ENDCOLOR], [COLOR_CITY_BLUE]타일[ENDCOLOR]의 [ICON_CULTURE] 문화 25%가 [ICON_TOURISM][ICON_TOURISM]으로, 또 다른 25%가 [ICON_TOURISM]으로 전환됨).'
WHERE Tag = 'TXT_KEY_WONDER_CN_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_CN_TOWER_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_CN_TOWER_HELP';
				
UPDATE Language_ko_KR SET Text = '부지: [COLOR_CYAN]평지[ENDCOLOR]; 특성: [COLOR_CYAN]호수[ENDCOLOR]; 플레이어: [COLOR_CYAN]행복도 > 80%[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CN_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특성: [COLOR_CYAN]호수[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CN_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Sydney Opera House
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]시드니 오페라 하우스[ENDCOLOR]는 놀랍고 독창적인 건축 불가사의로, 많은 귀족들을 그 홀로 끌어들여 그들의 문화와 경험을 당신과 공유합니다([COLOR_MAGENTA]무료 정책[ENDCOLOR]; +25%[ICON_CULTURE]). 이곳에서 전 세계의 훌륭하고 영감을 주는 음악 작품을 들을 수 있습니다(2[ICON_GREAT_WORK], 테마가 있는 경우: [ICON_CULTURE]).'
WHERE Tag = 'TXT_KEY_WONDER_SYDNEY_OPERA_HOUSE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, 'Can only be constructed in a coastal City. ', '') WHERE Tag ='TXT_KEY_WONDER_SYDNEY_OPERA_HOUSE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_SYDNEY_OPERA_HOUSE_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_SYDNEY_OPERA_HOUSE_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 위대한 작품: [COLOR_CYAN]위대한 음악 작품 4개[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SYDNEY_OPERA_HOUSE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SYDNEY_OPERA_HOUSE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Great Firewall
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]만리방화벽[ENDCOLOR]은 도시 시스템 해킹을 훨씬 더 어렵게 만듭니다(+50[ICON_SPY] 도시 보안). 다른 문명의 영향력에 저항할 수 있게 되며(기술로부터의 외국 [ICON_TOURISM] 관광 보너스가 무효화됨), 당신의 [COLOR_YIELD_FOOD]연구소[ENDCOLOR](+10[ICON_RESEARCH])는 훨씬 더 효과적이게 됩니다.'
WHERE Tag = 'TXT_KEY_BUILDING_GREAT_FIREWALL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_BUILDING_GREAT_FIREWALL_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_GREAT_FIREWALL_HELP';
				
UPDATE Language_ko_KR SET Text = '건물: [COLOR_CYAN]경찰서, 통신사[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_GREAT_FIREWALL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = ''||Text WHERE Tag ='TXT_KEY_BUILDING_GREAT_FIREWALL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Hubble Space Telescope
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]허블 우주 망원경[ENDCOLOR]은 당신의 과학적 승리를 향한 마지막 단계이며(+25%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]우주선 부품[ENDCOLOR]), 새로운 [COLOR_YIELD_FOOD]우주선 공장[ENDCOLOR]([ICON_PRODUCTION]; [ICON_RESEARCH])의 지원을 받습니다. 우주를 향한 이 거대한 도약은 더 나은 발전을 위한 영감이 될 수 있습니다(1명의 [COLOR_YIELD_GOLD]무료 [ICON_GREAT_SCIENTIST][ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_HUBBLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_HUBBLE_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_HUBBLE_HELP';
				
UPDATE Language_ko_KR SET Text = '개선된 자원: [COLOR_CYAN]알루미늄[ENDCOLOR]; 플레이어: [COLOR_CYAN]연구 협정[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HUBBLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '개선된 자원: [COLOR_CYAN]알루미늄[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HUBBLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- CERN
UPDATE Language_ko_KR
SET Text = '숨겨진 [COLOR_YIELD_FOOD]CERN[ENDCOLOR] 시설은 모든 과학자들을 모아 거대한 기술적 돌파구를 만들고(2개의 [COLOR_CYAN]무료 기술[ENDCOLOR]), 당신이 멀어져 가는 것을 지켜볼 수밖에 없는 사람들을 놀라게 합니다(+100[ICON_INFLUENCE]/[ICON_CITY_STATE]).'
WHERE Tag = 'TXT_KEY_BUILDING_CERN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_BUILDING_CERN_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_CERN_HELP';
				
UPDATE Language_ko_KR SET Text = '개선된 자원: [COLOR_CYAN]우라늄[ENDCOLOR]; 건물: [COLOR_CYAN]연구소[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_CERN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '개선된 자원: [COLOR_CYAN]우라늄[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_CERN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
----------------------------------------------------
-- Crystal Palace
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]수정궁[ENDCOLOR]은 거대한 산업 잠재력의 결과입니다. 모든 [COLOR_YIELD_FOOD]공장[ENDCOLOR](+2[ICON_PRODUCTION]; +2[ICON_RESEARCH])을 강화하고 문명에 새로운 시대를 시작합니다(황금기 시작).'
WHERE Tag = 'TXT_KEY_BUILDING_CRYSTAL_PALACE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, 'May only be built collaboratively through the World Congress. ', '') WHERE Tag ='TXT_KEY_BUILDING_CRYSTAL_PALACE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_BUILDING_CRYSTAL_PALACE_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_CRYSTAL_PALACE_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR:45:150:50:255]"세계 박람회" 프로젝트에서 승리[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_CRYSTAL_PALACE_HELP';
----------------------------------------------------
-- UN
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]국제 연합[ENDCOLOR]은 세계에서 가장 영향력 있는 위원회가 될 수 있으며(황금기 시작; [COLOR:45:150:50:255]세계 회의 회기 시작[ENDCOLOR]), 당신의 최고의 대표단(+1[ICON_DIPLOMAT])이 당신의 시민들과 목소리가 대표되지 않는 작은 나라들(25[ICON_INFLUENCE]/[ICON_CITY_STATE]/[ICON_GREAT_PEOPLE])에게 가장 중요한 것이 무엇인지 보여줄 것입니다.'
WHERE Tag = 'TXT_KEY_UN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, 'May only be built collaboratively through the World Congress. ', '') WHERE Tag ='TXT_KEY_UN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_UN_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_UN_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR:45:150:50:255]"국제 연합" 프로젝트에서 승리[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_UN_HELP';
----------------------------------------------------
-- Grand Canal
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]대운하[ENDCOLOR]는 바다 최전선에서 목숨을 거는 모든 사람들에 대한 당신의 헌신을 보여줍니다([COLOR_WATER_TEXT]보물 함대[ENDCOLOR]/[COLOR_YIELD_GOLD]해군(항공모함, 잠수함 제외)[ENDCOLOR]). 또한 또 다른 교역로를 개설할 수 있게 해주지만(+1[INTERNATIONAL_TRADE]), 그것이 육상 연결이 될지 해상 연결이 될지는 당신의 선택입니다.'
WHERE Tag = 'TXT_KEY_BUILDING_GRAND_CANAL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, 'May only be built collaboratively through the World Congress. ', '') WHERE Tag ='TXT_KEY_BUILDING_GRAND_CANAL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_BUILDING_GRAND_CANAL_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_GRAND_CANAL_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR:45:150:50:255]"보물 함대" 프로젝트에서 승리[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_GRAND_CANAL_HELP';
----------------------------------------------------
-- International Space Station
UPDATE Language_ko_KR
SET Text = '과학자들과 기술자들이 [COLOR_YIELD_FOOD]국제 우주 정거장[ENDCOLOR]에서 함께 일하며 장벽을 허물고 있습니다(+1[ICON_RESEARCH]/모든 기술자; +1[ICON_PRODUCTION]/모든 과학자). 그들의 노력은 당신에게 기술적 부스트를 제공하고(+33%[ICON_RESEARCH]/[ICON_GREAT_SCIENTIST]), 당신의 산업 문제에 대한 혁신적인 해결책입니다(200[ICON_PRODUCTION]/[COLOR_CYAN]기술[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_BUILDING_INTERNATIONAL_SPACE_STATION_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, 'May only be built collaboratively through the World Congress. ', '') WHERE Tag ='TXT_KEY_BUILDING_INTERNATIONAL_SPACE_STATION_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_BUILDING_INTERNATIONAL_SPACE_STATION_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_INTERNATIONAL_SPACE_STATION_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR:45:150:50:255]"국제 우주 정거장" 프로젝트에서 승리[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_INTERNATIONAL_SPACE_STATION_HELP';
----------------------------------------------------
-- Olympic Village
UPDATE Language_ko_KR
SET Text = '올림픽 게임은 이 어려운 시기에 큰 기쁨의 원천입니다(+3[ICON_HAPPINESS_1]). [COLOR_YIELD_FOOD]올림픽 선수촌[ENDCOLOR]은 사람들이 함께 모여 경기를 관람하고 주변의 고통을 잊게 하기 위해 여기에 있습니다(+25%[ICON_CULTURE]의 모든 [ICON_WONDER] [COLOR_YIELD_FOOD]세계 불가사의[ENDCOLOR], [COLOR_CITY_GREEN]자연 불가사의[ENDCOLOR], [COLOR_CITY_BROWN]시설[ENDCOLOR]을 [ICON_TOURISM]으로 전환). 건설된 모든 [COLOR_YIELD_FOOD]경기장[ENDCOLOR](+2[ICON_GOLD]; +2[ICON_TOURISM])은 다가오는 세계 행사의 중심이 됩니다.'
WHERE Tag = 'TXT_KEY_BUILDING_OLYMPIC_VILLAGE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, 'May only be built collaboratively through the World Congress. ', '') WHERE Tag ='TXT_KEY_BUILDING_OLYMPIC_VILLAGE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_BUILDING_OLYMPIC_VILLAGE_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_OLYMPIC_VILLAGE_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR:45:150:50:255]"국제 게임" 프로젝트에서 승리[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_OLYMPIC_VILLAGE_HELP';
----------------------------------------------------
-- Menin Gate
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]메닌 게이트[ENDCOLOR]는 미래 세대에게 경고가 될 것입니다(+2[ICON_CULTURE], +2[ICON_GOLDEN_AGE]/사망 시). 이 기념물뿐만 아니라 최근 전투와 관련된 각 장소는 거대한 고통을 나타냅니다(+1[ICON_GREAT_WRITER], +1[ICON_GOLDEN_AGE]/모든 [COLOR_CITY_BROWN]요새[ENDCOLOR], [COLOR_CITY_BROWN]성채[ENDCOLOR], [COLOR_CITY_BROWN]랜드마크[ENDCOLOR]). 아마도 현재의 번영을 유지할 기회가 있을 것입니다(+2[ICON_HAPPINESS_1]).'
WHERE Tag = 'TXT_KEY_BUILDING_MENIN_GATE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, 'May only be built collaboratively through the World Congress. ', '') WHERE Tag ='TXT_KEY_BUILDING_MENIN_GATE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_BUILDING_MENIN_GATE_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_MENIN_GATE_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR:45:150:50:255]"글로벌 워게임" 프로젝트에서 승리[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_MENIN_GATE_HELP';
----------------------------------------------------
-- AMERICA'S UNIQUE WORLD WONDERS (VP v3.8)
----------------------------------------------------
-- Smithsonian Institute
INSERT INTO Language_ko_KR 
			(Tag,											Text)
VALUES		('TXT_KEY_WONDER_AMERICA_SMITHSONIAN_QUOTE',	'[NEWLINE]"나는 매일 밤 책을 읽는다. 나는 정말 그런 괴짜라서, 스미소니언에 가서 뒷방에 들어가 물건을 가지고 놀 수 있을 때, 나 같은 사람에게는 그것이 놀라운 일이다."[NEWLINE] - 릭 해리슨[NEWLINE]');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]스미소니언 협회[ENDCOLOR]는 특이한 [COLOR_YIELD_FOOD]박물관[ENDCOLOR]([ICON_CULTURE]; [ICON_GREAT_WORK]; [ICON_HAPPINESS_3]; [ICON_TOURISM])이며 당신이 자랑스러워해야 할 곳입니다(+1[ICON_RESEARCH]/[ICON_GREAT_WORK][ICON_GREAT_WORK] 및 모든 랜드마크). 과학이 핵심이지만, 문명은 국가를 하나로 묶는 유일한 것이므로(+5[ICON_CULTURE], +5[ICON_RESEARCH]/모든 [COLOR_YIELD_FOOD]박물관[ENDCOLOR], [COLOR_YIELD_FOOD]연구소[ENDCOLOR]; +2[ICON_CULTURE], +2[ICON_RESEARCH]/모든 [ICON_WONDER] [COLOR_YIELD_FOOD]세계 불가사의[ENDCOLOR]), 어떤 대가를 치르더라도 투자해야 합니다(10%[ICON_GOLD][ICON_GOLD]를 [ICON_CULTURE][ICON_CULTURE]로; -25%[ICON_GOLD][ICON_GOLD] 타일 구매 비용).'
WHERE Tag = 'TXT_KEY_BUILDING_AMERICA_SMITHSONIAN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,										Text) 
SELECT		'TXT_KEY_BUILDING_AMERICA_SMITHSONIAN_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_AMERICA_SMITHSONIAN_HELP';
				
UPDATE Language_ko_KR SET Text = '문명: [COLOR_CYAN]미국[ENDCOLOR]; 건물: [COLOR_CYAN]독립기념관[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_AMERICA_SMITHSONIAN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '문명: [COLOR_CYAN]미국[ENDCOLOR]; 건물: [COLOR_CYAN]독립기념관[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_AMERICA_SMITHSONIAN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- West Point
INSERT INTO Language_ko_KR 
			(Tag,											Text)
VALUES		('TXT_KEY_WONDER_AMERICA_WESTPOINT_QUOTE',		'[NEWLINE]"웨스트포인트 졸업생으로 구성된 군대를 주면 전투에서 이길 것이다... 텍사스 애기스 몇 명을 주면 전쟁에서 이길 것이다."[NEWLINE] - 조지 S. 패튼[NEWLINE]');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]웨스트포인트[ENDCOLOR]는 상위 계층의 [COLOR_YIELD_FOOD]사관학교[ENDCOLOR]([ICON_PRODUCTION], [ICON_HAPPINESS_3], [ICON_SILVER_FIST])로서 모든 유사한 시설(+5[ICON_PRODUCTION], +5[ICON_RESEARCH]/모든 [COLOR_YIELD_FOOD]사관학교[ENDCOLOR], [COLOR_YIELD_FOOD]병기창[ENDCOLOR])과 당신의 부대([COLOR_WATER_TEXT]스플래시[ENDCOLOR]/[COLOR_YIELD_GOLD]공성[ENDCOLOR], [COLOR_YIELD_GOLD]해상 원거리[ENDCOLOR])를 향상시킵니다. 새로운 훈련 기술은 국경을 지키고(-25%[ICON_GOLD][ICON_GOLD] 타일 구매 비용) 중요한 기반 시설을 양호한 상태로 유지하는 데 도움이 됩니다(+2[ICON_PRODUCTION], +2[ICON_RESEARCH]/모든 [ICON_WONDER] [COLOR_YIELD_FOOD]세계 불가사의[ENDCOLOR]; 10%[ICON_GOLD][ICON_GOLD]를 [ICON_RESEARCH][ICON_RESEARCH]로).'
WHERE Tag = 'TXT_KEY_BUILDING_AMERICA_WESTPOINT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,										Text) 
SELECT		'TXT_KEY_BUILDING_AMERICA_WESTPOINT_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_AMERICA_WESTPOINT_HELP';
				
UPDATE Language_ko_KR SET Text = '문명: [COLOR_CYAN]미국[ENDCOLOR]; 건물: [COLOR_CYAN]독립기념관[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_AMERICA_WESTPOINT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '문명: [COLOR_CYAN]미국[ENDCOLOR]; 건물: [COLOR_CYAN]독립기념관[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_AMERICA_WESTPOINT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Slater Mill
INSERT INTO Language_ko_KR 
			(Tag,											Text)
VALUES		('TXT_KEY_WONDER_AMERICA_SLATERMILL_QUOTE',		'[NEWLINE]"만약 내가 영국에서처럼 좋은 실을 만들지 못한다면, 나는 내 서비스에 대해 아무것도 받지 않고 내가 시도한 모든 것을 다리 너머로 던져 버릴 것이다."[NEWLINE] - 새뮤얼 슬레이터[NEWLINE]');
			
UPDATE Language_ko_KR
SET Text = '리더가 되려면 [COLOR_YIELD_FOOD]슬레이터 밀[ENDCOLOR]이 필요합니다. 이 현대적인 [COLOR_YIELD_FOOD]공장[ENDCOLOR]([ICON_PRODUCTION]; [ICON_GREAT_PEOPLE]; [ICON_HAPPINESS_3]; [ICON_INTERNATIONAL_TRADE])은 당신의 산업에 새로운 품질을 도입하고(+5[ICON_PRODUCTION], +5[ICON_GOLD]/모든 [COLOR_YIELD_FOOD]공장[ENDCOLOR], [COLOR_YIELD_FOOD]증권 거래소[ENDCOLOR]) 확장을 더 빠르게 만듭니다(-25%[ICON_GOLD][ICON_GOLD] 타일 구매 비용; +1[ICON_INTERNATIONAL_TRADE]). 당신의 투자는 신속하게 추가 이익을 가져다줄 것입니다(+2[ICON_PRODUCTION], +2[ICON_GOLD]/모든 [ICON_WONDER] [COLOR_YIELD_FOOD]세계 불가사의[ENDCOLOR]; 10%[ICON_GOLD][ICON_GOLD]를 [ICON_PRODUCTION][ICON_PRODUCTION]으로).'
WHERE Tag = 'TXT_KEY_BUILDING_AMERICA_SLATERMILL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,										Text) 
SELECT		'TXT_KEY_BUILDING_AMERICA_SLATERMILL_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_AMERICA_SLATERMILL_HELP';
				
UPDATE Language_ko_KR SET Text = '문명: [COLOR_CYAN]미국[ENDCOLOR]; 건물: [COLOR_CYAN]독립기념관[ENDCOLOR]; 특성: [COLOR_CYAN]강[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_AMERICA_SLATERMILL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '문명: [COLOR_CYAN]미국[ENDCOLOR]; 건물: [COLOR_CYAN]독립기념관[ENDCOLOR]; 특성: [COLOR_CYAN]강[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_AMERICA_SLATERMILL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
--============================================--
-- EE Compatibility
--============================================--
-- Main Compatibility Code
	-- updating texts for new promotions
	----------------------------------------------------
	-- SMITHSONIAN INSTITUTE???
	UPDATE Language_ko_KR
	SET Text = '[COLOR_YIELD_FOOD]스미소니언 협회[ENDCOLOR]는 잘 알려진 [COLOR_YIELD_FOOD]박물관[ENDCOLOR]([ICON_CULTURE]; [ICON_GREAT_WORK]; [ICON_HAPPINESS_3]; [ICON_TOURISM])이며 멋진 예술 작품을 소장하고 있습니다(2[ICON_GREAT_WORK], 테마가 있는 경우: [ICON_RESEARCH], [ICON_GOLD]). 다른 모든 유사한 장소는 그 영향력의 혜택을 받습니다(+1[ICON_CULTURE]/모든 [COLOR_YIELD_FOOD]박물관, 갤러리[ENDCOLOR]). 그 덕분에 사람들은 훨씬 더 행복해집니다(-10%[ICON_HAPPINESS_3][ICON_HAPPINESS_3] 문맹).'
	WHERE Tag = 'TXT_KEY_WONDER_EE_SMITHSONIAN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value= 1);

	INSERT INTO Language_ko_KR 
				(Tag,										Text) 
	SELECT		'TXT_KEY_WONDER_EE_SMITHSONIAN_HELP_CUT',	Text
	FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_EE_SMITHSONIAN_HELP';
				
	UPDATE Language_ko_KR SET Text = '특성: [COLOR_CYAN]강[ENDCOLOR]; 시설: [COLOR_CYAN]아카데미[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_EE_SMITHSONIAN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Language_ko_KR SET Text = '특성: [COLOR_CYAN]강[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_EE_SMITHSONIAN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
	----------------------------------------------------
	-- KRONBORG
	UPDATE Language_ko_KR
	SET Text = '당신의 해안선은 당신의 방어선입니다. [COLOR_YIELD_FOOD]크론보르 성[ENDCOLOR]은 그것을 더 강하게 만드는 한 가지 방법입니다(+3[ICON_STRENGTH], +50 HP, +1[ICON_SILVER_FIST]/모든 해안 도시). 당신의 더 큰 해군(+50%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]해군[ENDCOLOR])은 강력한 지도자([COLOR_YIELD_GOLD]무료 [ICON_GREAT_ADMIRAL][ENDCOLOR])가 이끌 것이며, 당신의 보물은 똑똑한 상인들(+1[ICON_GREAT_MERCHANT])이 관리할 것입니다.'
	WHERE Tag = 'TXT_KEY_WONDER_EE_KRONBORG_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value= 1);

	INSERT INTO Language_ko_KR 
				(Tag,								Text) 
	SELECT		'TXT_KEY_WONDER_EE_KRONBORG_HELP_CUT',	Text
	FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_EE_KRONBORG_HELP';
				
	UPDATE Language_ko_KR SET Text = '부지: [COLOR_CYAN]평지[ENDCOLOR]; 지형: [COLOR_CYAN]해안[ENDCOLOR]; 건물: [COLOR_CYAN]항구[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_EE_KRONBORG_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=2 OR Value=1));
	----------------------------------------------------
	-- VERSAILLES
	UPDATE Language_ko_KR
	SET Text = '[COLOR_YIELD_FOOD]베르사유 궁전[ENDCOLOR]은 시간을 보내고 유명한 귀족들을 만날 수 있는 좋은 장소입니다([COLOR_YIELD_GOLD]무료 [ICON_GREAT_WRITER][ENDCOLOR]). 당신의 백성들은 당신의 힘을 알고 있으며, 제국 전체가 당신의 이름으로 긴 축제를 조직합니다(+50%[ICON_HAPPINESS_1][ICON_HAPPINESS_1] WLTKD 길이).'
	WHERE Tag = 'TXT_KEY_WONDER_EE_VERSAILLES_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value= 1);

	INSERT INTO Language_ko_KR 
				(Tag,								Text) 
	SELECT		'TXT_KEY_WONDER_EE_VERSAILLES_HELP_CUT',	Text
	FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_EE_VERSAILLES_HELP';
				
	UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]초원[ENDCOLOR]; 부지: [COLOR_CYAN]평지[ENDCOLOR]; 특성: [COLOR_NEGATIVE_TEXT]물[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_EE_VERSAILLES_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Language_ko_KR SET Text = '부지: [COLOR_CYAN]평지[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_EE_VERSAILLES_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
	----------------------------------------------------
	-- TOPKAPI PALACE
	UPDATE Language_ko_KR
	SET Text = '[COLOR_YIELD_FOOD]톱카프 궁전[ENDCOLOR]은 방어 교리를 기도함으로써 당신의 신앙을 강화합니다(+1[ICON_PEACE]/모든 [COLOR_YIELD_FOOD]방어 건물[ENDCOLOR]). 추가로, 비행기를 만들면 새로운 명소에 관광객을 유치할 수 있습니다([COLOR_CYAN]비행[ENDCOLOR]: +3[ICON_GOLD], +2[ICON_TOURISM]).'
	WHERE Tag = 'TXT_KEY_WONDER_EE_TOPKAPI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value= 1);

	INSERT INTO Language_ko_KR 
				(Tag,									Text) 
	SELECT		'TXT_KEY_WONDER_EE_TOPKAPI_HELP_CUT',	Text
	FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_EE_TOPKAPI_HELP';
				
	UPDATE Language_ko_KR SET Text = '부지: [COLOR_CYAN]언덕[ENDCOLOR]; 지형: [COLOR_CYAN]해안[ENDCOLOR]; 건물: [COLOR_CYAN]장원[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_EE_TOPKAPI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=2 OR Value=1));
	----------------------------------------------------
	-- TORRE DEL ORO
	UPDATE Language_ko_KR
	SET Text = '[COLOR_YIELD_FOOD]황금의 탑[ENDCOLOR]은 해상 교역로에 집중합니다. 교역로를 더 쉽고 수익성 있게 만듭니다(+1[ICON_INTERNATIONAL_TRADE]; +1[ICON_GREAT_MERCHANT]; 해상 [ICON_INTERNATIONAL_TRADE]: +3[ICON_GOLD], +50%[ICON_SWAP]). 빛나는 새로운 [COLOR_YIELD_FOOD]건선거[ENDCOLOR]([ICON_STRENGTH]; [ICON_SILVER_FIST])는 당신의 해상 패권의 좋은 시작이 될 것입니다.'
	WHERE Tag = 'TXT_KEY_WONDER_EE_TORRE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value= 1);

	UPDATE Language_ko_KR SET Text = REPLACE(Text, '[NEWLINE][NEWLINE]City must be build on the [COLOR_CYAN]Coast[ENDCOLOR].', '') WHERE Tag ='TXT_KEY_WONDER_EE_TORRE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

	INSERT INTO Language_ko_KR 
				(Tag,								Text) 
	SELECT		'TXT_KEY_WONDER_EE_TORRE_HELP_CUT',	Text
	FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_EE_TORRE_HELP';
				
	UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]사막[ENDCOLOR], [COLOR_CYAN]해안[ENDCOLOR]; 특성: [COLOR_CYAN]강[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_EE_TORRE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 특성: [COLOR_CYAN]강[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_EE_TORRE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
	----------------------------------------------------
	-- WAT PHRA KAEW
	UPDATE Language_ko_KR
	SET Text = '[COLOR_YIELD_FOOD]왓 프라깨우[ENDCOLOR]는 몸과 마음을 연결합니다(+1[ICON_RESEARCH]/모든 [COLOR_YIELD_FOOD]성소[ENDCOLOR]; +2[ICON_RESEARCH]/모든 [COLOR_YIELD_FOOD]사원[ENDCOLOR]). 더욱이, 당신은 발견에 대한 심각한 부스트를 얻습니다(+5[ICON_RESEARCH]; +1[ICON_GREAT_SCIENTIST]).'
	WHERE Tag = 'TXT_KEY_WONDER_EE_WAT_PHRA_KAEW_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value= 1);

	INSERT INTO Language_ko_KR 
				(Tag,										Text) 
	SELECT		'TXT_KEY_WONDER_EE_WAT_PHRA_KAEW_HELP_CUT',	Text
	FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_EE_WAT_PHRA_KAEW_HELP';
				
	UPDATE Language_ko_KR SET Text = '특성: [COLOR_CYAN]강[ENDCOLOR]; 시설: [COLOR_CYAN]성지[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_EE_WAT_PHRA_KAEW_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Language_ko_KR SET Text = '특성: [COLOR_CYAN]강[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_EE_WAT_PHRA_KAEW_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
	----------------------------------------------------
	-- FASIL GHEBBI
	UPDATE Language_ko_KR
	SET Text = '[COLOR_YIELD_FOOD]파실 게비[ENDCOLOR]는 당신의 취약한 영토를 방어해야 하는 깊은 필요에 부응합니다(+5[ICON_STRENGTH]; +100 HP). 당신의 부대는 이 불가사의 주변에서 독특한 버프를 받을 것이며([COLOR_WATER_TEXT]파실 게비[ENDCOLOR]/[COLOR_YIELD_GOLD]도시 범위 내 군사[ENDCOLOR]), 당신은 더 많은 부대를 가질 수 있습니다(+5[ICON_SILVER_FIST]). 당신의 기술자들도 이 프로젝트에 참여할 수 있습니다(+1[ICON_GREAT_ENGINEER]).'
	WHERE Tag = 'TXT_KEY_WONDER_EE_FASIL_GHEBBI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value= 1);

	INSERT INTO Language_ko_KR 
				(Tag,										Text) 
	SELECT		'TXT_KEY_WONDER_EE_FASIL_GHEBBI_HELP_CUT',	Text
	FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_EE_FASIL_GHEBBI_HELP';
				
	UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]평원[ENDCOLOR]; 부지: [COLOR_CYAN]언덕[ENDCOLOR]; 특성: [COLOR_NEGATIVE_TEXT]물[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_EE_FASIL_GHEBBI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Language_ko_KR SET Text = '부지: [COLOR_CYAN]언덕[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_EE_FASIL_GHEBBI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);