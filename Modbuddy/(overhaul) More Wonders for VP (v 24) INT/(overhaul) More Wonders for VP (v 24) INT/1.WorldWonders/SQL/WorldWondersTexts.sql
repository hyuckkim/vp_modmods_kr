----------------------------------------------------
-- Text file for all Wonders
-- Feb 20, 2020: Created, adan_eslavo
----------------------------------------------------
-- Cave of Altamira
INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_ALTAMIRA',			'알타미라 동굴'),
			('TXT_KEY_WONDER_ALTAMIRA_QUOTE',		'[NEWLINE]"알타미라 이후의 모든 것은 퇴폐적으로 보인다."[NEWLINE] - 파블로 피카소[NEWLINE]'),
			('TXT_KEY_BUILDING_ALTAMIRA_PEDIA',		'스페인 북부 칸타브리아의 산티야나 델 마르 근처에 위치한 알타미라 동굴은 세계에서 가장 유명한 선사 시대 예술 유적지 중 하나입니다. 1868년 지역 사냥꾼에 의해 발견되었고, 1879년 아마추어 고고학자 마르셀리노 산스 데 사우투올라가 그 중요성을 인식한 후 자세히 연구되면서 생생한 구석기 시대 그림으로 국제적인 주목을 받았습니다. 36,000년에서 14,000년 전에 만들어진 이 예술 작품들은 후기 구석기 시대 사람들의 기술과 상상력을 보여줍니다. 처음에는 많은 학자가 선사 시대 인류가 그러한 작품을 만들 만큼 정교하지 않다고 주장하며 진위 여부를 의심했습니다. 그러나 유럽 전역에서 유사한 동굴 예술이 추가로 발견되면서 그 정당성이 확인되었고, 알타미라는 인류 문화 및 예술 발전 연구의 초석이 되었습니다. [NEWLINE][NEWLINE]동굴 자체는 약 1,000미터(3,280.84피트) 뻗어 있지만, 종종 "선사 시대의 시스티나 성당"이라고 불리는 장식된 구역은 들소, 말, 사슴 및 추상적인 기호가 그려진 다색 그림이 있는 주실에 집중되어 있습니다. 예술가들은 황토, 적철석, 숯과 같은 천연 안료를 사용했으며, 종종 동굴의 윤곽을 활용하여 동물에게 입체감과 움직임을 부여했습니다. 이 작품들은 단순한 장식이 아니라 상징적, 의식적 또는 영적 목적을 수행했을 가능성이 큽니다. 오늘날 원래 동굴은 습기와 사람의 출입으로 인한 손상으로부터 취약한 그림을 보존하기 위해 일반 대중의 방문이 금지되어 있지만, 알타미라 박물관에 충실한 복제품이 있어 방문객들이 미래 세대를 위해 유산을 보호하면서 이 선사 시대 걸작의 경이로움을 경험할 수 있습니다.'),
			('TXT_KEY_BUILDING_ALTAMIRA_HELP',		'');

INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_BUILDING_ALTAMIRA_HELP_CUT', '[COLOR_YIELD_FOOD]알타미라 동굴[ENDCOLOR]은 이상적인 은신처(+5[ICON_STRENGTH])이며, 특히 [COLOR_GREY]들소[ENDCOLOR], [COLOR_GREY]사슴[ENDCOLOR] 또는 [COLOR_GREY]말[ENDCOLOR] 무리를 발견한다면 초기 문화 형성을 크게 지원합니다(+1[ICON_FOOD], +1[ICON_CULTURE]/[ICON_RES_BISON][ICON_RES_BISON], [ICON_RES_DEER][ICON_RES_DEER], [ICON_RES_HORSE][ICON_RES_HORSE]). 동굴 내부를 뛰어난 그림으로 채우거나(+1[ICON_GW_ART]) 고급 기술을 빠르게 연구하여 효과를 극대화하십시오([COLOR_CYAN]고고학[ENDCOLOR]: +3[ICON_CULTURE]).');
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]산 (범위 2)[ENDCOLOR]; 개발된 자원: [ICON_RES_BISON]/[ICON_RES_DEER]/[ICON_RES_HORSE] [COLOR_CYAN]말[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_ALTAMIRA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '개발된 자원: [ICON_RES_BISON]/[ICON_RES_DEER]/[ICON_RES_HORSE].'||Text WHERE Tag ='TXT_KEY_BUILDING_ALTAMIRA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Ggantija
INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_GGANTIJA',			'간티야'), /*Ġgantija*/
			('TXT_KEY_WONDER_GGANTIJA_QUOTE',		'[NEWLINE]"우리는 신을 찾아야 하며, 신은 소음과 불안 속에서는 찾을 수 없습니다. 신은 침묵의 친구입니다. 자연(나무, 꽃, 풀)이 침묵 속에서 어떻게 자라는지 보십시오. 별, 달, 태양이 침묵 속에서 어떻게 움직이는지 보십시오... 영혼을 어루만지기 위해서는 침묵이 필요합니다."[NEWLINE] - 테레사 수녀[NEWLINE]'),
			('TXT_KEY_BUILDING_GGANTIJA_PEDIA',		'몰타의 고조섬에 위치한 간티야는 스톤헨지와 이집트 피라미드보다 앞선 세계에서 가장 오래된 독립형 구조물 중 하나입니다. 기원전 3600~3200년경 신석기 시대에 지어졌으며 유네스코 세계문화유산으로 등재된 몰타의 거석 사원의 일부입니다. 몰타어로 "거인"을 뜻하는 간티야라는 이름은 거대한 돌들이 평범한 인간이 옮기기에는 너무 무거워 보여 거인들이 지었다는 지역 전설에서 유래했습니다. 그러나 고고학 연구에 따르면 이 사원들은 수천 년 전에 건축 기술, 의식 관행 및 사회 조직에 대한 고급 지식을 개발한 초기 농경 공동체에 의해 세워졌습니다. [NEWLINE][NEWLINE]이 유적지는 경계벽 안에 두 개의 인접한 사원 구조물로 구성되어 있으며, 일부는 50톤이 넘는 거대한 석회암 블록으로 지어졌습니다. 사원은 후진, 제단, 그리고 발굴 중에 발견된 동물 뼈와 제물과 같은 의식 사용의 증거가 있는 클로버 잎 모양의 배치를 특징으로 합니다. 그들의 디자인은 조각상과 상징적 조각의 발견으로 알 수 있듯이 공동 예배와 다산 의식의 장소였으며 아마도 어머니 여신에게 바쳐졌을 것임을 시사합니다. 오래된 역사에도 불구하고 사원은 놀랍도록 잘 보존되어 있어 몰타 선사 시대 거주자들의 독창성과 영적 삶을 보여줍니다. 오늘날 간티야는 주요 고고학적 랜드마크로서 방문객들에게 인류 초기의 기념비적 건축물을 엿볼 기회를 제공합니다.'),
			('TXT_KEY_BUILDING_GGANTIJA_HELP',		'');

INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_BUILDING_GGANTIJA_HELP_CUT', '다산 숭배에서 영감을 받은 [COLOR_YIELD_FOOD]간티야[ENDCOLOR]의 건설은 제국에 번영을 가져오고 즉시 성장을 촉진하며(50[ICON_FOOD]) 모든 [COLOR_CITY_BROWN]농장[ENDCOLOR]의 효율성을 높입니다(+1[ICON_FOOD]/[COLOR_CITY_BROWN]제국 내 타일[ENDCOLOR]). 따라서 도시를 더욱 발전시키려면 가능한 한 빨리 종교를 창시하는 것이 좋습니다(+2[ICON_PEACE]; 10%[ICON_PEACE] -> [ICON_FOOD]).');
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]초원[ENDCOLOR]; 시설: [COLOR_CYAN]농장 2개[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_GGANTIJA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]초원[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_GGANTIJA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------				
-- Goebekli Tepe	
INSERT INTO Language_ko_KR 
			(Tag,										Text) 
VALUES		('TXT_KEY_BUILDING_GOEBEKLI_TEPE',			'괴베클리 테페'),
			('TXT_KEY_WONDER_GOEBEKLI_TEPE_QUOTE',		'[NEWLINE]"발밑이 아니라 별을 올려다보십시오. 당신이 보는 것을 이해하려고 노력하고 무엇이 우주를 존재하게 하는지 궁금해하십시오. 호기심을 가지십시오."[NEWLINE] - 스티븐 호킹[NEWLINE]'),
			('TXT_KEY_BUILDING_GOEBEKLI_TEPE_PEDIA',	'터키 남동부 샨리우르파 근처에 위치한 괴베클리 테페는 스톤헨지나 이집트 피라미드보다 수천 년 앞선 기원전 9600~9500년경으로 거슬러 올라가는 세계에서 가장 오래된 사원 단지로 간주됩니다. 1960대에 발견되어 1990년대부터 본격적으로 발굴되면서 선사 시대 사회에 대한 우리의 이해를 극적으로 재편했습니다. 이 유적지는 마지막 빙하기 말기에 수렵 채집 공동체에 의해 건설되었으며, 조직화된 종교와 기념비적 건축물이 농업의 출현 이후에야 나타났다는 전통적인 견해에 도전했습니다. 고고학자들은 이 구조물이 의식 및 사회 활동을 위한 모임 장소 역할을 했다고 믿으며, 괴베클리 테페를 초기 인류 문화와 영성의 중심지로 만들었습니다. [NEWLINE][NEWLINE]이 유적지는 거대한 T자형 석회암 기둥으로 형성된 여러 개의 원형 및 타원형 인클로저로 구성되어 있으며, 일부는 높이가 최대 5.5미터에 달하고 무게는 수 톤에 이릅니다. 이 기둥 중 다수는 사자, 뱀, 멧돼지, 새와 같은 동물과 추상적인 기호가 정교하게 조각되어 있어 풍부한 상징적, 신화적 체계를 암시합니다. 후기 사원과 달리 괴베클리 테페는 가정생활의 증거를 보여주지 않아 순수하게 의식용이었다는 생각을 뒷받침합니다. 이 유적지는 기원전 8000년경 건축자들에 의해 의도적으로 매립되어 수천 년 동안 보존될 수 있었습니다. 오늘날 괴베클리 테페는 고고학의 가장 중요한 발견 중 하나로 남아 있으며 종교, 예술 및 사회적 복잡성의 기원에 대한 심오한 통찰력을 제공합니다.'),
			('TXT_KEY_BUILDING_GOEBEKLI_TEPE_HELP',		'');
			
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_BUILDING_GOEBEKLI_TEPE_HELP_CUT', '[COLOR_YIELD_FOOD]괴베클리 테페[ENDCOLOR]는 [COLOR_CITY_BLUE]산악[ENDCOLOR] 지역에 탁월한 선택입니다(+1[ICON_PEACE]/[COLOR_CITY_BLUE]타일[ENDCOLOR]). 다목적 건물(+1[ICON_RESEARCH]; +1[ICON_CULTURE]; +1[ICON_PEACE])이지만, 이 특이한 [COLOR_YIELD_FOOD]성소[ENDCOLOR] 건설에 사용된 [COLOR_GREY]석재[ENDCOLOR]의 채굴(+1[ICON_RESEARCH]/[ICON_RES_STONE][ICON_RES_STONE])과 미래의 다른 많은 것들이 진보적인 황제에게 우선순위가 되어야 함을 잊어서는 안 됩니다(+1[ICON_RESEARCH][ICON_RESEARCH]).');
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]산 (범위 2)[ENDCOLOR]; 지물: [COLOR_NEGATIVE_TEXT]물[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_GOEBEKLI_TEPE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]산 (범위 2)[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_GOEBEKLI_TEPE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------				
-- Kuk
INSERT INTO Language_ko_KR 
			(Tag,							Text) 
VALUES		('TXT_KEY_BUILDING_KUK',		'쿠크 유적지'),
			('TXT_KEY_WONDER_KUK_QUOTE',	'[NEWLINE]"완벽함이 정체라면 천국은 늪이다."[NEWLINE] - 리처드 바크[NEWLINE]'),
			('TXT_KEY_BUILDING_KUK_PEDIA',	'파푸아뉴기니 고지대에 위치한 쿠크 습지는 약 10,000년 전으로 거슬러 올라가는 세계에서 가장 오래된 농업 유적지 중 하나입니다. 고고학적 발굴 결과 이 지역은 처음에는 수렵 채집인들이 사용했지만 기원전 6000년경부터 사람들이 타로, 참마, 바나나와 같은 식물을 재배하기 시작했음이 밝혀졌습니다. 이 발견은 농업이 중동, 중국, 아메리카의 더 잘 알려진 초기 농업 중심지와는 별개로 뉴기니에서 독립적으로 발전했음을 입증했습니다. 이 유적지의 중요성은 국제적으로 인정받았으며, 2008년 인류가 채집에서 농경으로 전환했음을 보여주는 주요 증거로 유네스코 세계문화유산에 등재되었습니다. [NEWLINE][NEWLINE]습지 자체는 도랑, 배수로, 밭두렁 건설을 통해 광범위한 농업 시스템으로 변모하여 공동체가 습지 환경을 관리하고 작물을 효율적으로 재배할 수 있게 했습니다. 이 초기 농부들은 물의 흐름을 제어하기 위해 풍경을 조작했으며, 이는 당시로서는 놀라운 혁신이었습니다. 수천 년에 걸친 유적지의 장기 사용 증거는 농업 관행이 점차 정교해져 더 크고 정착된 인구를 부양했음을 보여줍니다. 오늘날 쿠크 습지는 뉴기니 초기 거주자들의 독창성을 강조할 뿐만 아니라 인류의 적응과 농업의 기원에 대한 전 세계적인 이야기에서 중요한 장을 제공합니다.'),
			('TXT_KEY_BUILDING_KUK_HELP',	'[ICON_BULLET]제국 내 모든 [COLOR_CITY_GREEN]습지[ENDCOLOR]에서 +1 [ICON_PRODUCTION] 생산력 및 +1 [ICON_RESEARCH] 과학.[NEWLINE][ICON_BULLET][COLOR_CYAN]증기력[ENDCOLOR] 연구 시 모든 도시(이 도시 포함, 총 +5[ICON_PRODUCTION])에서 +2 [ICON_PRODUCTION] 생산력.');

UPDATE Language_ko_KR SET Text = '[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_KUK_HELP';
			
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_BUILDING_KUK_HELP_CUT', '[COLOR_YIELD_FOOD]쿠크 유적지[ENDCOLOR]는 독특한 농업 기술 덕분에 모든 [COLOR_CITY_GREEN]습지[ENDCOLOR](+1[ICON_PRODUCTION], +1[ICON_RESEARCH]/[COLOR_CITY_GREEN]제국 내 타일[ENDCOLOR])를 비옥한 토양으로 바꾸어 지역 성장을 가속화하고(10%[ICON_FOOD]/새로운 [ICON_CITIZEN]), 핵심 기술을 연구한 후에는 수도와 제국의 생산성을 높일 것입니다([COLOR_CYAN]증기력[ENDCOLOR]: +3[ICON_PRODUCTION], +2[ICON_PRODUCTION][ICON_PRODUCTION]).');
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_NEGATIVE_TEXT]설원[ENDCOLOR]; 지물: [COLOR_CYAN]정글, 습지[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_KUK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지물: [COLOR_CYAN]습지[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_KUK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Majorville Medicine Wheel
INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_MAJORVILLE',			'메이저빌 메디신 휠'), /*Iniskim Umaapi*/
			('TXT_KEY_WONDER_MAJORVILLE_QUOTE',		'[NEWLINE]"지구가 병들면 동물들이 사라지기 시작할 것이고, 그때 무지개 전사들이 그들을 구하러 올 것이다."[NEWLINE] - 시애틀 추장[NEWLINE]'),
			('TXT_KEY_BUILDING_MAJORVILLE_PEDIA',	'캐나다 앨버타 남부 블랙풋 네이션 내에 위치한 메이저빌 메디신 휠은 북미에서 가장 크고 오래된 메디신 휠 중 하나입니다. 4,500년 이상 된 것으로 추정되며 기자의 대피라미드와 스톤헨지보다 앞서 있어 대륙에서 가장 오랫동안 지속적으로 사용된 신성한 장소 중 하나입니다. 원주민들에 의해 건설되고 유지된 이 휠은 수많은 세대에 걸쳐 영적, 의식적, 천문학적 목적으로 사용되었습니다. 고고학 연구에 따르면 한 번에 건설된 것이 아니라 수천 년에 걸쳐 점진적으로 개발되었으며, 점유 기간에 따라 제물과 돌무더기가 추가되었습니다. 그 수명과 문화적 중요성은 북부 평원 원주민 전통의 연속성을 강조합니다. [NEWLINE][NEWLINE]구조는 지름이 거의 27미터에 달하는 돌 원으로 둘러싸인 큰 중앙 돌무더기와 바퀴살을 닮은 28개의 방사형 선이 밖으로 뻗어 있는 형태입니다. 이 디자인은 하지와 동지, 춘분과 추분과 같은 천체 사건과 일치하는 것으로 여겨지며, 의식 및 천문학적 장소로 기능했을 수 있음을 시사합니다. 현장에서 발견된 석기 도구와 제물을 포함한 유물은 이곳이 자연의 순환과 관련된 의식 모임, 비전 퀘스트 및 영적 준수의 장소였음을 나타냅니다. 오늘날 메이저빌 메디신 휠은 원주민 공동체의 활발한 성지로 남아 있으며, 고대 북미의 영성, 천문학, 풍경 사이의 깊은 연관성을 강력하게 상기시켜 줍니다.'),
			('TXT_KEY_BUILDING_MAJORVILLE_HELP',	'');
			
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_BUILDING_MAJORVILLE_HELP_CUT', '[COLOR_YIELD_FOOD]메이저빌 메디신 휠[ENDCOLOR]은 불쾌하고 추운 [COLOR_CITY_BLUE]툰드라[ENDCOLOR] 지역의 종교적 발전을 강력하게 지원합니다(+1[ICON_PEACE]/[COLOR_CITY_BLUE]타일[ENDCOLOR]). 믿을 수 없을 정도로 강력한 과학적 패턴이 발산되어(+1[ICON_RESEARCH]) 당신의 통제하에 있는 수많은 생물에게 영향을 미치고, 모든 [COLOR_CITY_BROWN]야영지[ENDCOLOR](+1[ICON_FOOD]/[COLOR_CITY_BROWN]제국 내 타일[ENDCOLOR])와 [COLOR_GREY]들소[ENDCOLOR](+1[ICON_CULTURE]/[ICON_RES_BISON][ICON_RES_BISON])를 개선합니다.');
				
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]언덕[ENDCOLOR]; 지형: [COLOR_CYAN]툰드라[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_MAJORVILLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]툰드라[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_MAJORVILLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Mohenjo-daro
INSERT INTO Language_ko_KR 
			(Tag,										Text) 
VALUES		('TXT_KEY_BUILDING_MOHENJO_DARO',			'모헨조다로'),
			('TXT_KEY_WONDER_MOHENJO_DARO_QUOTE',		'[NEWLINE]"강은 사막에 있는 바다이다."[NEWLINE] - 맛쇼나 들리와요[NEWLINE]'),
			('TXT_KEY_BUILDING_MOHENJO_DARO_PEDIA',		'현재 파키스탄 신드주에 위치한 모헨조다로는 기원전 2600년에서 1900년 사이에 번성했던 인더스 계곡 문명의 주요 도시 중심지 중 하나였습니다. 1920년대 영국 주도의 발굴 조사 중에 발견된 이곳은 메소포타미아와 이집트의 동시대 문명에 필적하는 고도로 발전된 도시였음을 드러냈습니다. "모헨조다로"라는 이름은 신드어로 "죽은 자의 언덕"을 의미하며, 처음 발굴되었을 때의 폐허 상태를 반영합니다. 고고학적 증거에 따르면 이 도시는 격자무늬로 배치된 거리, 표준화된 구운 벽돌 건축, 인상적인 배수 및 수자원 관리 시스템(인류 역사상 가장 초기 형태 중 하나)을 갖춘 계획도시였습니다. 그 발견은 남아시아의 고대 과거에 대한 이해를 재편하여 복잡한 도시 사회가 이 지역에서 독립적으로 발전했음을 증명했습니다. [NEWLINE][NEWLINE]이 도시는 수백 헥타르에 달했으며 전성기에는 수만 명의 주민을 부양했을 수 있습니다. 주목할 만한 구조물로는 의식적 정화에 사용되었을 것으로 추정되는 대목욕탕, 식량 저장을 위한 곡창, 집회장, 잘 조직된 블록으로 나뉜 주거 지역이 있습니다. 인장, 도자기, 조각상, 도구와 같은 유물은 메소포타미아까지 확장된 무역의 증거와 함께 풍요로운 문화 및 경제 생활을 보여줍니다. 놀랍게도 대규모 궁전이나 사원은 발견되지 않았는데, 이는 다른 초기 문명과는 다른 사회 구조, 아마도 더 평등하거나 공동 통치를 통해 조직된 사회 구조를 시사합니다. 오늘날 모헨조다로는 유네스코 세계문화유산이지만 침식, 홍수 및 인간 활동으로 인한 위협에 직면해 있어 보존이 전 세계적인 우선순위가 되고 있습니다.'),
			('TXT_KEY_BUILDING_MOHENJO_DARO_HELP',		'');

INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_BUILDING_MOHENJO_DARO_HELP_CUT', '[COLOR_YIELD_FOOD]모헨조다로[ENDCOLOR]는 수많은 삶의 질 기능 덕분에 [COLOR_CITY_GREEN]강[ENDCOLOR]에서의 생활을 이전보다 훨씬 쉽게 만듭니다(+2[ICON_FOOD]; +1[ICON_FOOD]/[COLOR_CITY_GREEN]타일[ENDCOLOR]). 유도된 성장은 더 높은 생산성으로 이어지며(+1[ICON_PRODUCTION]/2 [ICON_CITIZEN]), 그동안 도시를 문화 및 종교 수도로 변화시킵니다(+2[ICON_CULTURE]; +1[ICON_PEACE]).');
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_NEGATIVE_TEXT]해안[ENDCOLOR]; 지물: [COLOR_CYAN]강[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_MOHENJO_DARO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '지형: [COLOR_NEGATIVE_TEXT]해안[ENDCOLOR]; 지물: [COLOR_CYAN]강[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_MOHENJO_DARO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Skara Brae
INSERT INTO Language_ko_KR 
			(Tag, Text)
VALUES		('TXT_KEY_BUILDING_SKARA_BRAE',			'스카라 브레이'),
			('TXT_KEY_WONDER_SKARA_BRAE_QUOTE',		'[NEWLINE]"위대한 일은 갑자기 이루어지지 않는다."[NEWLINE] - 에픽테토스[NEWLINE]'),
			('TXT_KEY_BUILDING_SKARA_BRAE_PEDIA',	'스코틀랜드 오크니 제도에 위치한 스카라 브레이는 유럽에서 가장 잘 보존된 신석기 시대 정착지 중 하나로, 종종 "스코틀랜드의 폼페이"라고 불립니다. 기원전 3180~2500년경으로 거슬러 올라가는 이곳은 19세기 중반 강력한 폭풍으로 모래언덕 아래 묻혀 있던 석조 주거지가 드러나면서 발견되었습니다. 이 유적지는 선사 시대의 일상생활에 대한 놀라운 통찰력을 제공하며, 초기 농경 공동체가 어떻게 집을 짓고, 생계를 유지하고, 환경과 상호 작용했는지 보여줍니다. 그 발견은 신석기 시대 영국에 대한 이해를 변화시켰으며, 이 외딴 지역의 사람들이 놀라운 수준의 편안함과 정교함을 갖춘 잘 구조화된 마을에서 살았음을 보여주었습니다. [NEWLINE][NEWLINE]정착지는 덮개가 있는 통로로 연결된 8개의 석조 주택으로 구성되어 있으며, 각 주택에는 침대, 찬장, 화로, 저장 공간과 같은 석조 가구가 갖춰져 있습니다. 주택에는 배수 시스템도 갖춰져 있어 청결과 효율적인 생활에 대한 관심을 시사합니다. 도구, 도자기, 보석, 게임 조각 등 현장에서 발견된 유물은 가정의 일상과 사회 및 문화생활의 측면을 모두 반영합니다. 해안 근처에 위치한 스카라 브레이는 결국 버려졌는데, 아마도 기후 변화나 해수면 상승으로 인해 정착지가 거주하기 어려워졌기 때문일 것입니다. 오늘날 유네스코 세계문화유산 "오크니 신석기 유적의 심장"의 일부인 스카라 브레이는 5,000년 전 사람들의 삶을 생생하게 보여주는 창으로서 방문객들을 계속 매료시키고 있습니다.'),
			('TXT_KEY_BUILDING_SKARA_BRAE_HELP',	'');
			
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_BUILDING_SKARA_BRAE_HELP_CUT', '[COLOR_YIELD_FOOD]스카라 브레이[ENDCOLOR]는 식량 생산 측면에서 모든 기본 자원을 훨씬 더 효율적으로 만듭니다(+1[ICON_FOOD]/[ICON_RES_COW][ICON_RES_COW], [ICON_RES_SHEEP][ICON_RES_SHEEP], [ICON_RES_FISH][ICON_RES_FISH], [ICON_RES_MAIZE][ICON_RES_MAIZE], [ICON_RES_RICE][ICON_RES_RICE], [ICON_RES_WHEAT][ICON_RES_WHEAT]). 이는 중세 시대가 도래하고 몇 개의 [COLOR_CITY_BROWN]마을[ENDCOLOR]을 건설하기로 결정했을 때 모든 마을에서 더 많은 제조 상품을 판매할 수 있음을 의미합니다(+1[ICON_PRODUCTION], +1[ICON_GOLD]/[COLOR_CITY_BROWN]제국 내 타일[ENDCOLOR]; +1[ICON_PRODUCTION]).');
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 개발된 자원: [ICON_RES_COW]/[ICON_RES_FISH]/[ICON_RES_SHEEP]/[ICON_RES_MAIZE]/[ICON_RES_RICE]/[ICON_RES_WHEAT].'||Text WHERE Tag ='TXT_KEY_BUILDING_SKARA_BRAE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '개발된 자원: [ICON_RES_COW]/[ICON_RES_FISH]/[ICON_RES_SHEEP]/[ICON_RES_MAIZE]/[ICON_RES_RICE]/[ICON_RES_WHEAT].'||Text WHERE Tag ='TXT_KEY_BUILDING_SKARA_BRAE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
----------------------------------------------------
-- Karnak
INSERT INTO Language_ko_KR 
			(Tag,								Text) 
VALUES		('TXT_KEY_BUILDING_KARNAK',			'카르낙 신전'),
			('TXT_KEY_WONDER_KARNAK_QUOTE',		'[NEWLINE]"나는 해가 질 무렵 나일강의 카르낙 신전에 앉아 있었고, 나는 혼자였으며, 거대한 열주실은 과거의 그림자와 유령으로 가득 차 있었다. (...) 만약 당신이 그것을 믿는다면, 당신은 무엇이든 믿을 것이다."[NEWLINE] - 윌버 A. 스미스[NEWLINE]'),
			('TXT_KEY_BUILDING_KARNAK_PEDIA',	'이집트 룩소르 근처 나일강 동쪽 기슭에 위치한 카르낙은 지금까지 건설된 가장 크고 인상적인 사원 단지 중 하나입니다. 그 역사는 1,500년 이상에 걸쳐 있으며, 중왕국 시대(기원전 2000년경)에 건설이 시작되어 프톨레마이오스 시대(기원전 30년까지)까지 계속되었습니다. 주로 테베의 삼위일체인 아문, 무트, 콘수에게 바쳐진 카르낙은 한 번에 지어진 것이 아니라 역대 파라오들이 각각 새로운 사원, 성소, 탑문, 기념물을 추가하면서 확장되었습니다. 고대 이집트의 주요 종교 중심지로서 파라오의 신성한 권위를 강화하는 연례 오페트 축제를 포함한 성대한 의식을 주최하며 정치 및 영적 생활에서 중심적인 역할을 했습니다. [NEWLINE][NEWLINE]이 단지는 100헥타르가 넘으며 방대한 구조물을 포함하고 있는데, 그중 가장 유명한 것은 아문 신전의 대열주실입니다. 5,000제곱미터에 달하는 이 홀에는 134개의 거대한 기둥이 줄지어 있으며, 일부는 높이가 20미터가 넘는 돌 숲을 이루어 오늘날에도 경외감을 불러일으킵니다. 카르낙에는 또한 신성한 호수, 오벨리스크, 거상, 군사적 승리, 신에게 바치는 제물, 신성한 의식을 기록한 정교하게 조각된 부조가 있습니다. 그 건축적 규모와 상징적 웅장함은 전성기 고대 이집트의 부와 권력을 반영합니다. 오늘날 카르낙은 유네스코 세계문화유산이자 이집트에서 가장 많이 방문하는 기념물 중 하나로 남아 있으며, 고대 이집트 문명의 영적, 정치적 심장부와 직접 연결됩니다.'),
			('TXT_KEY_BUILDING_KARNAK_HELP',	'');
			
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_BUILDING_KARNAK_HELP_CUT', '[COLOR_YIELD_FOOD]카르낙[ENDCOLOR] 신전은 여러 분야에서 상당한 발전 이점을 제공하며(+1[ICON_FOOD], +1[ICON_CULTURE], +1[ICON_PEACE]) 희귀한 [COLOR_CITY_GREEN]오아시스[ENDCOLOR](+1[ICON_PRODUCTION], +1[ICON_PEACE]/[COLOR_CITY_GREEN]타일[ENDCOLOR])와 [COLOR_CITY_GREEN]범람원[ENDCOLOR](+1[ICON_PRODUCTION], +1[ICON_PEACE]/2 [COLOR_CITY_GREEN]타일[ENDCOLOR])을 매우 생산적인 신성한 장소로 바꿀 수 있습니다. 최근 건설된 [COLOR_YIELD_FOOD]기념비[ENDCOLOR]([COLOR_YIELD_FOOD]무료[ENDCOLOR]; +1[ICON_CULTURE][ICON_CULTURE])는 단지의 고유한 부분이므로 이전보다 더 많은 문화를 생성하기 때문에 많은 기념비 중 첫 번째가 되어야 함을 기억하십시오.');
				
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]평지[ENDCOLOR]; 지물: [COLOR_CYAN]범람원[ENDCOLOR]/[COLOR_CYAN]오아시스[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_KARNAK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '지물: [COLOR_CYAN]범람원[ENDCOLOR]/[COLOR_CYAN]오아시스[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_KARNAK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Nazca Lines
INSERT INTO Language_ko_KR 
			(Tag,								Text) 
VALUES		('TXT_KEY_BUILDING_NAZCA',			'나스카 라인'),
			('TXT_KEY_WONDER_NAZCA_QUOTE',		'[NEWLINE]"세상의 진정한 신비는 보이지 않는 것이 아니라 보이는 것이다."[NEWLINE] - 오스카 와일드[NEWLINE]'),
			('TXT_KEY_BUILDING_NAZCA_PEDIA',	'페루 남부의 건조한 해안 평원에 새겨진 나스카 라인은 세계에서 가장 불가사의한 고고학적 경이로움 중 하나입니다. 기원전 500년에서 서기 500년 사이에 나스카 문화에 의해 만들어진 이 거대한 지상화는 거의 1,000제곱킬로미터의 사막에 걸쳐 뻗어 있습니다. 선들은 붉은색 표면 자갈을 제거하여 아래의 밝은 토양을 드러내는 방식으로 형성되었으며, 이 지역의 건조한 기후와 바람이 없는 덕분에 수세기 동안 눈에 띄는 대조를 이루며 지속되었습니다. 1920년대 공중에서 관찰된 후 국제적인 주목을 받게 된 나스카 라인에는 직선 경로, 기하학적 도형, 동물, 식물, 인간 형태의 거대한 묘사가 포함되어 있으며 단순한 디자인부터 수백 미터에 달하는 복잡한 작품까지 다양합니다. [NEWLINE][NEWLINE]지상화의 목적은 학자들 사이에서 여전히 논쟁의 대상입니다. 일부 이론은 천문 달력이거나 물과 다산 의식과 관련된 의식 경로라고 제안하는 반면, 다른 이론은 하늘에서 보이는 신에게 바치는 제물로서 종교적 의미가 있다고 주장합니다. 가장 유명한 형상으로는 벌새, 원숭이, 거미, 콘도르가 있으며 모두 놀라운 정밀도로 그려졌습니다. 그 규모와 실행은 기술적 기술과 정교한 문화적 세계관을 모두 보여줍니다. 오늘날 나스카 라인은 유네스코 세계문화유산으로 지정되어 고대 나스카 사람들의 창의성과 영성에 대한 취약한 증거로 보호받고 있으며 전 세계 연구자와 방문객을 계속 매료시키고 있습니다.'),
			('TXT_KEY_BUILDING_NAZCA_HELP',		'');
			
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_BUILDING_NAZCA_HELP_CUT', '[COLOR_YIELD_FOOD]나스카 라인[ENDCOLOR]은 공중 정찰을 통해서만 완전히 발견할 수 있는 신비한 과학적 비밀을 숨기고 있습니다([COLOR_CYAN]비행[ENDCOLOR]: +4[ICON_RESEARCH], +2[ICON_TOURISM]). 지역 [COLOR_CITY_BLUE]평원[ENDCOLOR](+2[ICON_FOOD]/[COLOR_CITY_BLUE]타일[ENDCOLOR])과 [COLOR_CITY_BLUE]언덕[ENDCOLOR](+1[ICON_PEACE]/[COLOR_CITY_BLUE]타일[ENDCOLOR])에 새로운 의식을 도입하면 확실히 영광스러운 종교 지도자로 변모할 것이며, 더 많은 [COLOR_CITY_BROWN]야영지[ENDCOLOR]를 건설하면 다른 사람들이 접근할 수 없는 곳에서 연구를 수행할 수 있습니다(+1[ICON_RESEARCH]/[COLOR_CITY_BROWN]타일[ENDCOLOR]; +1[ICON_GREAT_SCIENTIST]).');
				
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]언덕[ENDCOLOR]; 지형: [COLOR_CYAN]평원[ENDCOLOR]; 지물: [COLOR_NEGATIVE_TEXT]물[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_NAZCA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]언덕[ENDCOLOR]; 지형: [COLOR_CYAN]평원[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_NAZCA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Wieliczka
INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_WIELICZKA',			'비엘리치카 소금 광산'),
			('TXT_KEY_WONDER_WIELICZKA_QUOTE',		'[NEWLINE]"너희는 세상의 소금이다. 그러나 소금은 연합할 때 유용하지만 고립되면 쓸모없다는 것을 기억하라."[NEWLINE] - 이스라엘모어 아이보르[NEWLINE]'),
			('TXT_KEY_BUILDING_WIELICZKA_PEDIA',	'폴란드 남부 크라쿠프 근처에 위치한 비엘리치카 소금 광산은 13세기로 거슬러 올라가는 기원을 가진 세계에서 가장 오래된 지속적으로 운영된 소금 광산 중 하나입니다. 수 세기 동안 소금은 종종 "하얀 금"이라고 불리는 매우 귀중한 상품이었기 때문에 폴란드 왕실의 주요 부의 원천이었습니다. 채굴 활동은 홍수와 수익성 감소로 인해 1996년 상업적 운영이 중단될 때까지 700년 이상 계속되었습니다. 1978년 유네스코 세계문화유산으로 지정된 이 광산은 폴란드의 산업 역사에 대한 기념비이자 깊은 곳에서 일한 수많은 광부 세대의 독창성에 대한 증거입니다. [NEWLINE][NEWLINE]300km가 넘는 터널과 300m가 넘는 깊이에 달하는 이 광산은 규모뿐만 아니라 놀라운 지하 예술성으로도 유명합니다. 광부들은 소금으로 예배당, 조각상, 부조, 심지어 샹들리에까지 조각하여 광산을 지하 문화 보물로 만들었습니다. 내부에서 가장 유명한 장소는 킹가 성당으로, 소금으로 조각된 제단, 성서 장면, 정교한 장식으로 장식된 거대한 방으로 여전히 종교 예배와 콘서트가 열립니다. 오늘날 비엘리치카 소금 광산은 폴란드에서 가장 인기 있는 관광 명소 중 하나로, 방문객들에게 지하에 보존된 자연 지질학, 중세 공학, 인간 창의성의 독특한 조화를 제공합니다.'),
			('TXT_KEY_BUILDING_WIELICZKA_HELP',		'');
			
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_BUILDING_WIELICZKA_HELP_CUT', '[COLOR_YIELD_FOOD]비엘리치카 소금 광산[ENDCOLOR]은 숨겨진 지하 비밀을 드러내어 식량 생산을 크게 늘립니다(+5%[ICON_FOOD][ICON_FOOD]). 최근 발견된 풍부한 [COLOR_GREY]소금[ENDCOLOR] 매장지(2[ICON_RES_SALT] 생성; +1[ICON_PRODUCTION], +1[ICON_GOLD]/[ICON_RES_SALT])는 과소평가된 [COLOR_CITY_BROWN]광산[ENDCOLOR]을 경제의 강력한 기둥으로 바꾸어 제국의 성장을 상당히 증가시킬 것입니다(+1[ICON_FOOD]/[COLOR_CITY_BROWN]타일[ENDCOLOR]).');
				
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]언덕[ENDCOLOR]; 시설: [COLOR_CYAN]광산 2개[ENDCOLOR]; 도시: [COLOR_CYAN][ICON_RES_SALT]을 위한 공간[ENDCOLOR]; 지도: [COLOR_CYAN]지도상의 [ICON_RES_SALT][ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_WIELICZKA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]언덕[ENDCOLOR]; 도시: [COLOR_CYAN][ICON_RES_SALT]을 위한 공간[ENDCOLOR]; 지도: [COLOR_CYAN]지도상의 [ICON_RES_SALT][ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_WIELICZKA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Plain of Jars
INSERT INTO Language_ko_KR 
			(Tag,										Text) 
VALUES		('TXT_KEY_BUILDING_THONG_HAI_HIN',			'자르 평원'), /*Thong Hai Hin*/
			('TXT_KEY_WONDER_THONG_HAI_HIN_QUOTE',		'[NEWLINE]"보람찬 하루가 행복한 잠을 가져오듯이, 잘 쓴 인생은 행복한 죽음을 가져온다."[NEWLINE] - 레오나르도 다 빈치[NEWLINE]'),
			('TXT_KEY_BUILDING_THONG_HAI_HIN_PEDIA',	'라오스 북부 시앙쿠앙 고원에 위치한 자르 평원은 대략 기원전 500년에서 서기 500년 사이의 철기 시대로 거슬러 올라가는 불가사의한 고고학적 풍경입니다. 1930년대 프랑스 탐험가들에 의해 처음 기록된 이 유적지는 여러 고원에 흩어져 있는 수천 개의 거대한 돌 항아리로 구성되어 있습니다. 그 목적은 수십 년 동안 미스터리로 남아 있었지만, 고고학 연구에 따르면 복잡한 매장 관행의 일부였으며, 아마도 최종 매장 전에 인간의 유해와 관련 부장품을 보관하는 데 사용되었을 것으로 추정됩니다. 자르 평원은 동남아시아의 선사 시대 사회에 대한 귀중한 통찰력을 제공하고 그들의 의식 및 제례적 정교함을 강조합니다. [NEWLINE][NEWLINE]항아리 자체는 크기가 다양하며 일부는 높이가 3미터를 넘고 무게가 수 톤에 달하며 사암, 화강암 또는 석회암으로 조각되었습니다. 많은 항아리가 무리지어 있거나 원형 패턴으로 배열되어 있으며 때로는 무덤과 돌 원반이 함께 있어 조직적인 공동 활동을 나타냅니다. 항아리의 장인 정신은 뛰어난 석조 조각 기술과 험준한 지형을 가로질러 이 거대한 물체를 운반하고 배치하는 데 상당한 노력이 들었음을 보여줍니다. 오늘날 자르 평원은 유네스코 세계문화유산이지만 일부 지역은 라오스 내전 당시의 불발탄으로 인해 여전히 위험합니다. 그럼에도 불구하고 신비한 기원과 기념비적인 규모로 연구자와 방문객을 계속 매료시키며 고대 동남아시아 문화를 엿볼 수 있는 놀라운 창을 제공합니다.'),
			('TXT_KEY_BUILDING_THONG_HAI_HIN_HELP',		'');
			
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_BUILDING_THONG_HAI_HIN_HELP_CUT', '[COLOR_YIELD_FOOD]자르 평원[ENDCOLOR]은 여러 무역로의 교차로에 위치하므로 창고(들어오는 내부 [ICON_INTERNATIONAL_TRADE]: +2[ICON_FOOD]), 묘지(+3[ICON_PEACE]; 5[ICON_PEACE]/사망) 또는 시장(+2[ICON_GOLD]; 국제 [ICON_CARAVAN]: +2[ICON_GOLD])과 같은 다양한 역할을 수행해야 하며, 이는 미래 제국의 종교 및 경제 중심지에 이상적인 장소입니다.');
				
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]평지[ENDCOLOR]; 지형: [COLOR_CYAN]평원[ENDCOLOR], [COLOR_NEGATIVE_TEXT]해안[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_THONG_HAI_HIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]평지[ENDCOLOR]; 지형: [COLOR_CYAN]평원[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_THONG_HAI_HIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Stonehenge
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_BUILDING_STONEHENGE_HELP_CUT',	'신비한 [COLOR_YIELD_FOOD]스톤헨지[ENDCOLOR]는 개선된 [COLOR_YIELD_FOOD]의회[ENDCOLOR]([COLOR_YIELD_FOOD]무료[ENDCOLOR])로서 초기 과학 발전(+1[ICON_RESEARCH])과 종교 의식의 진화(+2[ICON_PEACE]; 60[ICON_PEACE])를 유도합니다. 새로운 종교의 기초를 보장하는 것 외에도 과학자들이 새로운 경험을 얻을 수 있는 장이기도 합니다(+1[ICON_GREAT_SCIENTIST]).');
				
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]평지[ENDCOLOR]; 지형: [COLOR_CYAN]초원[ENDCOLOR], [COLOR_NEGATIVE_TEXT]해안[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_STONEHENGE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]평지[ENDCOLOR]; 지형: [COLOR_CYAN]초원[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_STONEHENGE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Giza Pyramids
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_WONDER_PYRAMIDS_HELP_CUT', '위대한 [COLOR_YIELD_FOOD]기자 피라미드[ENDCOLOR]는 공학적 걸작(+1[ICON_GREAT_ENGINEER])으로 이전에 본 적 없는 황금기의 도래를 알립니다(+1[ICON_GOLDEN_AGE]; 50[ICON_GOLDEN_AGE]/[ICON_GREAT_PEOPLE][ICON_GREAT_PEOPLE]). 신들의 호의와 고위 사제들과의 좋은 관계 덕분에 최근 훈련된 [COLOR_YIELD_GOLD]무료 개척자[ENDCOLOR]를 사용하여 확장을 위한 귀중한 땅을 찾고 또 다른 위대하고 번영하는 도시를 건설할 수 있습니다.');

UPDATE Language_ko_KR SET Text = '기자 피라미드' WHERE Tag ='TXT_KEY_BUILDING_PYRAMID';
UPDATE Language_ko_KR SET Text = REPLACE(Text, 'The Book of the Dead', '"사자의 서"') WHERE Tag ='TXT_KEY_WONDER_PYRAMIDS_QUOTE';
				
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]평지[ENDCOLOR]; 지형: [COLOR_NEGATIVE_TEXT]툰드라[ENDCOLOR], [COLOR_NEGATIVE_TEXT]설원[ENDCOLOR]; 지물: [COLOR_CYAN]강[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_PYRAMIDS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]평지[ENDCOLOR]; 지물: [COLOR_CYAN]강[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_PYRAMIDS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Petra
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_WONDER_PETRA_HELP_CUT', '[COLOR_YIELD_FOOD]페트라[ENDCOLOR] 단지는 불모의 [COLOR_CITY_BLUE]사막[ENDCOLOR]을 수익성 있는 땅으로 바꿀 수 있습니다(+1[ICON_GOLD]/[COLOR_CITY_BLUE]타일[ENDCOLOR]; +1[ICON_GOLD]). 최근 훈련된 [COLOR_YIELD_GOLD]무료 대상[ENDCOLOR]을 현재 이용 가능한 교역로 중 하나로 보내(+1[ICON_INTERNATIONAL_TRADE]) 세계 구석구석에 문화를 빠르게 전파하는 것이 좋습니다(+3[ICON_CULTURE]; [COLOR_CYAN]고고학[ENDCOLOR]: +6[ICON_CULTURE]).');
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]사막[ENDCOLOR], [COLOR_CYAN]산 (범위 2)[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_PETRA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]사막[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_PETRA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Temple of Artemis
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_WONDER_TEMPLE_ARTEMIS_HELP_CUT', '[COLOR_YIELD_FOOD]아르테미스 사원[ENDCOLOR]은 개발 도상국에서 능력이 필요한 자격을 갖춘 [COLOR_YIELD_FOOD]약초상[ENDCOLOR]([COLOR_YIELD_FOOD]무료[ENDCOLOR]) 노동자를 장려합니다(-2[ICON_HAPPINESS_3] 도시화). 자연과의 강한 유대감은 막대한 양의 식량을 제공하지만(+12%[ICON_FOOD][ICON_FOOD]), 풍부한 사냥터를 확보했을 때만 가능하며, 이는 이전보다 더 많은 궁수를 훈련할 강력한 동기를 부여합니다(+30%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]원거리[ENDCOLOR]).');
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_NEGATIVE_TEXT]사막[ENDCOLOR]; 지물: [COLOR_CYAN]숲[ENDCOLOR]/[COLOR_CYAN]정글[ENDCOLOR]; 시설: [COLOR_CYAN]야영지/재배지[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_TEMPLE_ARTEMIS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지물: [COLOR_CYAN]숲[ENDCOLOR]/[COLOR_CYAN]정글[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_TEMPLE_ARTEMIS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Mausoleum of Halicarnassus
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_WONDER_MAUSOLEUM_HALICARNASSUS_HELP_CUT', '가장 공로가 큰 통치자를 기리기 위해 지어진 [COLOR_YIELD_FOOD]할리카르나소스의 마우솔레움[ENDCOLOR](+1[ICON_CULTURE])은 모든 시민에게 우리가 울지 말고 축하해야 한다는 신호입니다(20턴 [ICON_HAPPINESS_1] 사랑해 주간; +10%[ICON_PRODUCTION], +10%[ICON_GOLD], +10%[ICON_RESEARCH]/[ICON_HAPPINESS_1] 사랑해 주간). [COLOR_YIELD_FOOD]석공소[ENDCOLOR]([COLOR_YIELD_FOOD]무료[ENDCOLOR])는 이제 일손이 가득 찼고, 다가오는 번영은 최근 지어진 시장 광장에 부유한 상인들을 불러옵니다(+1[ICON_GREAT_MERCHANT]).');
				
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]언덕[ENDCOLOR]; 지형: [COLOR_CYAN]해안[ENDCOLOR]; 시설: [COLOR_CYAN]채석장[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_MAUSOLEUM_HALICARNASSUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]언덕[ENDCOLOR]; 지형: [COLOR_CYAN]해안[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_MAUSOLEUM_HALICARNASSUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Statue of Zeus
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_WONDER_STATUE_ZEUS_HELP_CUT',	'기념비적인 [COLOR_YIELD_FOOD]제우스 동상[ENDCOLOR]은 지역 [COLOR_YIELD_FOOD]병영[ENDCOLOR]([COLOR_YIELD_FOOD]무료[ENDCOLOR])과 함께 공격 능력, 특히 길고 소모적인 도시 공성전 중의 능력을 증가시키며([COLOR_WATER_TEXT]제우스 동상[ENDCOLOR]/[COLOR_YIELD_GOLD]군사[ENDCOLOR]; +1[ICON_GREAT_GENERAL]), 지역 불안을 줄이기 위한 노력을 세 배로 늘립니다(+1[ICON_PEACE]; -1[ICON_HAPPINESS_3] 고통; [COLOR_YIELD_GOLD]노동자[ENDCOLOR]는 [COLOR_WATER_TEXT]전쟁 포로[ENDCOLOR]에 면역).');

UPDATE Language_ko_KR SET Text = REPLACE(Text, 'The Iliad', '"일리아스", 호메로스') WHERE Tag ='TXT_KEY_WONDER_STATUE_ZEUS_QUOTE';

UPDATE Language_ko_KR SET Text = '다른 플레이어: [COLOR_CYAN]경계[ENDCOLOR]/[COLOR_CYAN]두려움[ENDCOLOR]/[COLOR_CYAN]배타적[ENDCOLOR]/[COLOR_CYAN]전쟁 중[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_STATUE_ZEUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = ''||Text WHERE Tag ='TXT_KEY_WONDER_STATUE_ZEUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
----------------------------------------------------
-- Malwiya Minaret
INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_MALWIYA',			'말위야 미나렛'),
			('TXT_KEY_WONDER_MALWIYA_QUOTE',		'[NEWLINE]"하늘을 목표로 하면 지구를 얻을 것이다... 지구를 목표로 하면 아무것도 얻지 못할 것이다."[NEWLINE] - C.S. 루이스[NEWLINE]'),
			('TXT_KEY_BUILDING_MALWIYA_PEDIA',		'이라크 사마라의 대모스크의 일부인 말위야 미나렛은 9세기 아바스 왕조 칼리프 알 무타와킬(서기 847~861년) 통치 기간에 지어진 상징적인 건축 랜드마크입니다. 이 미나렛은 당시 세계에서 가장 큰 모스크 중 하나의 구성 요소로 건설되었으며, 아바스 왕조의 부, 권력, 건축적 야망을 반영합니다. 독특한 나선형 디자인은 전통적인 미나렛과 구별되어 사마라와 이슬람 건축의 상징이 되었습니다. 수 세기 동안 말위야 미나렛은 자연적 부패, 침략, 복원 노력을 견뎌냈지만, 초기 이슬람 시대의 혁신적인 공학 및 예술적 비전에 대한 증거로 남아 있습니다. [NEWLINE][NEWLINE]미나렛은 약 52미터 높이로 솟아 있으며 외부를 감싸는 독특한 나선형 경사로가 있어 전통적으로 기도 시간을 알리는 꼭대기 플랫폼으로 이어집니다. 사암과 구운 벽돌로 지어진 말위야 미나렛은 평평한 풍경 전체에서 볼 수 있는 가시성과 우아하고 기념비적인 형태를 결합하여 기능적, 미적 고려 사항을 모두 보여줍니다. 한때 이슬람 세계에서 가장 큰 모스크 중 하나였던 주변 모스크는 현재 폐허가 되었지만, 미나렛 자체는 규모, 디자인, 역사적 중요성으로 계속해서 주목을 받고 있습니다. 오늘날 말위야 미나렛은 사마라의 과거 영광의 상징일 뿐만 아니라 초기 이슬람 건축의 독창성을 보여주는 지속적인 예이기도 합니다.'),
			('TXT_KEY_BUILDING_MALWIYA_HELP',		'');
				
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_BUILDING_MALWIYA_HELP_CUT', '[COLOR_YIELD_FOOD]말위야 미나렛[ENDCOLOR]의 건설은 공학적 천재성의 결과입니다(+2[ICON_CULTURE]; +2[ICON_GREAT_ENGINEER]). 광물을 [COLOR_CITY_BROWN]채석장[ENDCOLOR]과 연결하여(+1[ICON_PEACE]/[COLOR_CITY_BROWN]제국 내 타일[ENDCOLOR]; +1[ICON_PRODUCTION]), [COLOR_CITY_BROWN]제조소[ENDCOLOR]의 힘을 사용하고(+3[ICON_PEACE]/[COLOR_CITY_BROWN]제국 내 타일[ENDCOLOR]) 개선된 [COLOR_YIELD_FOOD]석공소[ENDCOLOR]를 가능한 한 빨리 서둘러 건설하십시오(+2[ICON_PRODUCTION][ICON_PRODUCTION]).');
				
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]평지[ENDCOLOR]; 시설: [COLOR_CYAN]채석장[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_MALWIYA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]평지[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_MALWIYA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Buddhas of Bamiyan
INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_BAMYAN',			'바미안 석불'),
			('TXT_KEY_WONDER_BAMYAN_QUOTE',		'[NEWLINE]"과거는 이미 지나갔고, 미래는 아직 오지 않았다. 당신이 살 수 있는 순간은 오직 하나뿐이다."[NEWLINE] - 부처[NEWLINE]'),
			('TXT_KEY_BUILDING_BAMYAN_PEDIA',	'아프가니스탄 중부 바미안 계곡에 위치한 바미안 석불은 서기 6세기에 절벽에 조각된 기념비적인 조각상으로, 간다라, 인도, 헬레니즘 예술적 영향의 놀라운 융합을 나타냅니다. 높이가 55미터와 38미터인 이 거대한 인물상은 실크로드를 따라 대승 불교가 확산되었음을 상징하며 바미안을 주요 종교 및 문화 중심지로 표시했습니다. 이 유적지는 수 세기 동안의 헌신을 목격했으며 순례자와 상인 모두를 끌어들였습니다. 비극적으로 2001년 탈레반에 의해 파괴되었으며, 이는 전 세계적인 분노를 불러일으켰고 분쟁 지역의 문화유산 취약성을 강조했습니다. [NEWLINE][NEWLINE]불상은 사암 절벽에 직접 조각되었으며, 원래 세부 사항은 치장 벽토와 안료를 사용하여 향상되어 생생한 특징과 복잡한 장식을 제공했습니다. 벽감, 동굴, 작은 조각품들이 조각상을 둘러싸고 있어 불교 승려들의 수도 및 명상 공간 역할을 했습니다. 유적지의 기념비적인 규모는 외지고 드라마틱한 계곡 설정과 결합되어 영적 랜드마크이자 고대 공학의 경이로움이 되었습니다. 오늘날 빈 벽감은 과거를 가슴 아프게 상기시키는 것으로 남아 있으며, 유적지를 보존하고 이 상징적인 작품의 기억을 재건하려는 노력이 진행 중이며, 세계 유산과 불교 역사에서 바미안 석불의 지속적인 중요성을 강조합니다.'),
			('TXT_KEY_BUILDING_BAMYAN_HELP',	'');
			
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_BUILDING_BAMYAN_HELP_CUT', '거대한 [COLOR_YIELD_FOOD]바미안 석불[ENDCOLOR]은 세계에 평화와 관용을 증진합니다(+2[ICON_PEACE]; +100%[ICON_RELIGION] 압력). 모든 친구와 동맹, 특히 작은 국가들은 승리를 향한 당신의 경주를 지원할 것입니다(+2[ICON_PEACE]/[ICON_CITY_STATE] 친구; +3[ICON_GOLDEN_AGE]/[ICON_CITY_STATE] 동맹; +1[ICON_DIPLOMAT] 연맹 투표/2 우호 선언). 많은 사람이 파괴하려고 할 것이므로 이 귀중한 불가사의를 보호하십시오(+2[ICON_CULTURE]; [COLOR_CYAN]로켓 공학[ENDCOLOR]: +2[ICON_CULTURE], +2[ICON_GOLDEN_AGE]).');
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]산 2개 (범위 3)[ENDCOLOR]; 플레이어: [COLOR_CYAN]평화 상태[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_BAMYAN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = ''||Text WHERE Tag ='TXT_KEY_BUILDING_BAMYAN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Gate of the Sun
INSERT INTO Language_ko_KR 
			(Tag,										Text) 
VALUES		('TXT_KEY_BUILDING_GATE_OF_SUN',			'태양의 문'),
			('TXT_KEY_WONDER_GATE_OF_SUN_QUOTE',		'[NEWLINE]"내 사랑이 머무는 곳에 해가 지기를."[NEWLINE] - 볼리비아 속담[NEWLINE]'),
			('TXT_KEY_BUILDING_GATE_OF_SUN_PEDIA',		'볼리비아의 고대 고고학 유적지 티와나쿠 근처에 위치한 태양의 문은 서기 500~600년경으로 거슬러 올라가는 기념비적인 거석 구조물입니다. 티와나쿠는 티티카카 호수 근처에서 번성했던 콜럼버스 이전 티와나쿠 문명의 주요 중심지였으며 안데스 지역의 문화 및 종교 발전에서 핵심적인 역할을 했습니다. 태양의 문은 의식 및 아마도 천문학적 기념물 역할을 했으며, 우주론, 종교, 석조 조각에 대한 티와나쿠 사람들의 정교한 이해를 반영합니다. 티와나쿠 종교의 중심이었던 태양신과 관련된 권력과 영적 중요성의 상징으로 여겨집니다. [NEWLINE][NEWLINE]기념물 자체는 안산암 단일 석판으로, 인물, 기하학적 패턴, 그리고 종종 의식용 지팡이를 든 "지팡이의 신"이라고 불리는 중앙 신으로 널리 해석되는 복잡한 부조가 조각되어 있습니다. 중앙 인물을 둘러싸고 있는 것은 격자 모양으로 배열된 작은 인물들로, 달력 주기, 천문학적 사건 또는 신의 수행원을 나타낼 수 있습니다. 조각의 정밀함은 고급 공학 및 예술적 기술을 보여주며, 문의 정렬은 의식 또는 천문학적 기능을 했을 수 있습니다. 오늘날 태양의 문은 티와나쿠 문화의 지속적인 상징으로 남아 있으며, 이 고대 안데스 문명의 영적, 과학적 성취를 이해하고자 하는 연구자와 방문객을 끌어들이고 있습니다.'),
			('TXT_KEY_BUILDING_GATE_OF_SUN_HELP',		'[ICON_BULLET][COLOR_YIELD_FOOD]성벽[ENDCOLOR]이 있는 모든 도시에서 +5% [ICON_RESEARCH].');

UPDATE Language_ko_KR SET Text = '[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_GATE_OF_SUN_HELP';
			
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_BUILDING_GATE_OF_SUN_HELP_CUT', '신비한 [COLOR_YIELD_FOOD]태양의 문[ENDCOLOR]은 눈에 띄지 않는 비문을 숨기고 있습니다(+1[ICON_CULTURE]; +1[ICON_GW_WRITING]). 그 비밀을 밝히면 [COLOR_CITY_BLUE]산[ENDCOLOR](+1[ICON_CULTURE]/[COLOR_CITY_BLUE]타일[ENDCOLOR])과 [COLOR_CITY_GREEN]호수[ENDCOLOR](+1[ICON_CULTURE]/[COLOR_CITY_GREEN]타일[ENDCOLOR])가 새로운 문화 중심지로 바뀌며, 이것이 발전의 핵심 요소가 될 수 있습니다(+1[ICON_RESEARCH]; +5%[ICON_RESEARCH]/[ICON_GOLDEN_AGE]). 각 도시에 [COLOR_YIELD_FOOD]성벽[ENDCOLOR]을 건설하여 이 지식을 광대한 영토 깊숙이 전달하십시오(+1[ICON_RESEARCH][ICON_RESEARCH]; +5%[ICON_RESEARCH]/[COLOR_YIELD_FOOD]성벽[ENDCOLOR]이 있는 도시).');
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]산 (범위 2)[ENDCOLOR]; 지물: [COLOR_CYAN]호수[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_GATE_OF_SUN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지물: [COLOR_CYAN]호수[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_GATE_OF_SUN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- El Ghriba Synagogue (Holy)
INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_EL_GHRIBA',			'엘 그리바 시나고그'),
			('TXT_KEY_WONDER_EL_GHRIBA_QUOTE',		'[NEWLINE]"예수는 유대인으로 태어나 유대인으로 죽었다. 그는 새로운 종교를 세울 생각이 없었다. 그는 성호를 긋지 않았다. 그럴 이유가 없었다. 그는 교회에 발을 들여놓은 적이 없다. 그는 시나고그에 갔다."[NEWLINE] - 아모스 오즈[NEWLINE]'),
			('TXT_KEY_BUILDING_EL_GHRIBA_PEDIA',	'튀니지 제르바섬에 위치한 엘 그리바 시나고그는 북아프리카에서 가장 오래되고 존경받는 유대교 유적지 중 하나로, 그 기원은 전통적으로 2,500년 전으로 거슬러 올라갑니다. 지역 전설에 따르면 이 시나고그는 예루살렘의 제1성전 파괴를 피해 도망친 유대인들에 의해 설립되었지만, 역사적 기록에 따르면 수 세기에 걸쳐, 특히 로마와 비잔틴 시대에 건설되고 확장되었습니다. 제르바 유대인 공동체의 영적, 문화적 중심지 역할을 하는 엘 그리바는 특히 연례 라그 바오메르 축제 기간에 수천 명의 방문객이 축하하고 기도하며 시나고그의 신성한 역사를 기리기 위해 찾아오는 순례지가 되었습니다. [NEWLINE][NEWLINE]건축학적으로 엘 그리바는 지역 베르베르와 지중해 디자인 요소를 결합하여 회반죽 벽, 화려한 모자이크, 장식용 세라믹 타일을 특징으로 합니다. 시나고그에는 기적적인 속성이 있다고 믿어지는 숭배받는 돌이 있어 축복과 보호를 구하는 숭배자들을 끌어들입니다. 내부에는 정교하게 조각된 나무 문, 다채로운 샹들리에, 신성한 토라 두루마리가 제르바 유대인 공동체의 풍부한 종교적, 예술적 전통을 강조합니다. 공격과 정치적 불안정 기간을 포함하여 수 세기에 걸친 도전에도 불구하고 엘 그리바는 살아있는 예배 장소이자 튀니지에 유대인 유산이 지속적으로 존재함을 보여주는 상징으로 계속 기능하고 있습니다.'),
			('TXT_KEY_BUILDING_EL_GHRIBA_HELP',		''),
			('TXT_KEY_GREAT_WORK_THE_ARK',			'언약궤'),
			('TXT_KEY_GREAT_WORK_THE_ARK_QUOTE',	'[NEWLINE]"내가 여호와의 언약궤를 둘 쉴 곳과 우리 하나님의 발등상을 위하여 성전을 건축할 마음이 있어서"[NEWLINE] - 역대상 28:2[NEWLINE]');
			
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_BUILDING_EL_GHRIBA_HELP_CUT', '[COLOR_YIELD_FOOD]엘 그리바[ENDCOLOR]는 매우 독특한 [COLOR_YIELD_FOOD]시나고그[ENDCOLOR]([COLOR_YIELD_FOOD]무료[ENDCOLOR])입니다. 유대교의 초석인 귀중한 [COLOR_CULTURE_STORED]언약궤[ENDCOLOR](+1[ICON_CULTURE]; +4[ICON_PEACE]; +1[ICON_GW_ART])를 보관하고 있습니다. 역사는 유대인들이 경제의 달인이며 예상치 못한 출처에서 추가 이익을 얻을 수 있음을 보여줍니다(+1[ICON_GOLD]; 10%[ICON_PEACE] 신앙 구매 -> [ICON_GOLD]).');
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_YIELD_PRODUCTION]성도[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_EL_GHRIBA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '특수: [COLOR_YIELD_PRODUCTION]성도[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_EL_GHRIBA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Etchmiadzin Cathedral
INSERT INTO Language_ko_KR 
			(Tag,										Text) 
VALUES		('TXT_KEY_BUILDING_ETCHMIADZIN',			'에치미아진 대성당'),
			('TXT_KEY_WONDER_ETCHMIADZIN_QUOTE',		'[NEWLINE]"단검의 상처는 낫지만 혀의 상처는 결코 낫지 않는다."[NEWLINE] - 아르메니아 속담[NEWLINE]'),
			('TXT_KEY_BUILDING_ETCHMIADZIN_PEDIA',		'아르메니아 바가르샤파트에 위치한 에치미아진 대성당은 아르메니아 사도 교회의 영적, 행정적 중심지이자 세계에서 가장 오래된 대성당 중 하나로 간주됩니다. 전승에 따르면 원래 서기 301년 성 그레고리오 계몽자가 아르메니아가 기독교를 국교로 채택한 후(최초의 국가) 설립했습니다. 수 세기 동안 대성당은 수많은 개조와 확장을 거쳐 다양한 건축 양식을 반영했지만 아르메니아 기독교 생활의 심장부로 남아 있습니다. 침략, 지진, 정치적 격변기에도 살아남아 영적 중요성을 유지하면서 아르메니아의 종교적, 문화적, 국가적 정체성을 형성하는 데 중심적인 역할을 했습니다. [NEWLINE][NEWLINE]건축학적으로 에치미아진 대성당은 중앙 돔이 있는 십자형 디자인과 초기 기독교 아르메니아 건축을 반영하는 석조 건축 및 장식 요소의 조합을 특징으로 합니다. 내부에는 신성한 유물, 필사본, 정교하게 조각된 제단이 있어 종교 및 의식 중심지로서의 역할을 강조합니다. 주변 단지에는 신학교, 박물관, 수도원 건물이 포함되어 있어 신학 연구 및 순례의 중심지로서의 중요성을 더욱 강조합니다. 유네스코 세계문화유산으로 지정된 에치미아진 대성당은 오늘날 예배 장소일 뿐만 아니라 아르메니아의 풍부한 기독교 유산과 지속적인 문화적 유산에 대한 증거로 서 있습니다.'),
			('TXT_KEY_BUILDING_ETCHMIADZIN_HELP',		''),
			('TXT_KEY_GREAT_WORK_HOLY_LANCE',			'성창'),
			('TXT_KEY_GREAT_WORK_HOLY_LANCE_QUOTE',		'[NEWLINE]그 중 한 군인이 창으로 옆구리를 찌르니 곧 피와 물이 나오더라.[NEWLINE] - 요한복음 19:34[NEWLINE]');
			
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_BUILDING_ETCHMIADZIN_HELP_CUT', '웅장한 예술 작품인 [COLOR_CULTURE_STORED]성창[ENDCOLOR](+1[ICON_GW_ART])을 보관하고 있는 [COLOR_YIELD_FOOD]에치미아진 대성당[ENDCOLOR]은 종교 및 문화 발전의 조용한 후원자가 될 수 있습니다(+2[ICON_PEACE]; +2[ICON_GOLDEN_AGE]; +1[ICON_PEACE]/[ICON_GREAT_WORK][ICON_GREAT_WORK]). 고위 종교 귀족들의 노력 덕분에 문화가 꽃피우고 황금기가 더욱 빈번해질 것입니다(10%[ICON_PEACE] -> [ICON_CULTURE], [ICON_GOLDEN_AGE]).');
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]초원[ENDCOLOR], [COLOR_NEGATIVE_TEXT]해안[ENDCOLOR]; 지물: [COLOR_CYAN]숲[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_ETCHMIADZIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '지물: [COLOR_CYAN]숲[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_ETCHMIADZIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Sigiriya (Tradition, optional)
INSERT INTO Language_ko_KR 
			(Tag,										Text)
VALUES		('TXT_KEY_BUILDING_SIGIRIYA',				'시기리야'),
			('TXT_KEY_WONDER_SIGIRIYA_QUOTE',			'[NEWLINE]"나는 부달이다. 수백 명의 사람들과 함께 시기리야를 보러 왔다. 다른 사람들은 모두 시를 썼지만 나는 쓰지 않았다!"[NEWLINE] - 10세기 시의 텍스트[NEWLINE]'),
			('TXT_KEY_BUILDING_SIGIRIYA_PEDIA',			'사자 바위라고도 알려진 시기리야는 스리랑카 중부에 위치한 고대 바위 요새로 서기 5세기로 거슬러 올라갑니다. 카샤파 1세(서기 477~495년)가 왕실 성채이자 궁전 단지로 건설했으며, 거대한 200미터 높이의 화강암 바위 위에 전략적으로 자리 잡고 있습니다. 시기리야는 군사 공학과 정교한 도시 계획을 결합하여 방어 요새이자 왕권의 상징 역할을 했습니다. 19세기에 재발견된 이 유적지는 광범위한 정원, 저수지, 프레스코화, 비문을 드러내어 고대 스리랑카 문명의 독창성을 보여주었습니다. 오늘날 시기리야는 유네스코 세계문화유산으로 지정되어 있으며 이 나라에서 가장 상징적인 고고학적 랜드마크 중 하나로 간주됩니다. [NEWLINE][NEWLINE]요새 단지에는 정교한 수중 정원, 계단식 정원, 거울 같은 수영장이 포함되어 있어 고급 수력 공학 및 미적 감각을 반영합니다. 상부 바위 고원에는 왕궁 유적지가 있고, 중간 높이의 벽에는 선명한 색상과 섬세한 예술성으로 찬사를 받는 유명한 천상의 처녀 프레스코화가 있습니다. 사자 발 모양의 거대한 돌문이 있어 "사자 바위"라는 이름이 붙었습니다. 시기리야는 자연 지형과 인간의 독창성이 놀랍게 조화를 이루고 있으며 방어 요새이자 예술, 문화, 행정의 중심지를 나타냅니다. 보존 상태 덕분에 방문객들은 고대 스리랑카 건축 및 조경 디자인의 웅장함과 정교함을 경험할 수 있습니다.'),
			('TXT_KEY_BUILDING_SIGIRIYA_HELP',			''),
			('TXT_KEY_THEMING_BONUS_SIGIRIYA',			'아름다운 토착 예술 컬렉션'),
			('TXT_KEY_THEMING_BONUS_SIGIRIYA_HELP',		'보너스를 극대화하려면 모든 걸작 슬롯을 당신이 만든 예술품으로 채우십시오.');
			
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_BUILDING_SIGIRIYA_HELP_CUT', '[COLOR_YIELD_FOOD]시기리야[ENDCOLOR]는 한편으로는 지하에 숨겨진 막대한 보물(200[ICON_GOLD])을 포함하고 있으며, 다른 한편으로는 모두에게 보일 수 있는 많은 귀중한 예술적 창조물을 저장하고(+2[ICON_CULTURE]; +1[ICON_CULTURE]/[ICON_GREAT_WORK][ICON_GREAT_WORK]; 테마 보너스 시 2[ICON_GW_ART]: [ICON_GOLD], [ICON_CULTURE]), 이 모든 것이 도달할 수 없는 언덕 꼭대기에 안전하게 보관됩니다(+4[ICON_STRENGTH]).');
				
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]언덕[ENDCOLOR]; 지물: [COLOR_CYAN]숲[ENDCOLOR]/[COLOR_CYAN]정글[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_SIGIRIYA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]언덕[ENDCOLOR]; 지물: [COLOR_CYAN]숲[ENDCOLOR]/[COLOR_CYAN]정글[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_SIGIRIYA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	

UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]전통 완성[ENDCOLOR]; '||Text WHERE Tag ='TXT_KEY_BUILDING_SIGIRIYA_HELP' AND EXISTS (SELECT * FROM Community WHERE Type='MW-SETTING-POLICIES' AND Value=1);
UPDATE Language_ko_KR SET Text = REPLACE(Text, 'Feature', '지형: [COLOR_NEGATIVE_TEXT]해안[ENDCOLOR]; 지물') WHERE Tag ='TXT_KEY_BUILDING_SIGIRIYA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2) AND EXISTS (SELECT * FROM Community WHERE Type='MW-SETTING-POLICIES' AND Value=0);
----------------------------------------------------
-- Chand Baori
INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_CHAND_BAORI',		'찬드 바오리'),
			('TXT_KEY_WONDER_CHAND_BAORI_QUOTE',	'[NEWLINE]"우물이 마르면 물의 가치를 알게 된다."[NEWLINE] - 벤자민 프랭클린[NEWLINE]'),
			('TXT_KEY_BUILDING_CHAND_BAORI_PEDIA',	'인도 라자스탄의 아바네리 마을에 위치한 찬드 바오리는 서기 8~9세기에 니쿰브 왕조의 찬다 왕이 건설한 세계에서 가장 크고 정교한 계단식 우물 중 하나입니다. 계단식 우물은 일 년 내내 물에 안정적으로 접근할 수 있도록 인도 건조 지역 전역에 건설되었으며 실용적이고 사회적인 목적을 모두 수행했습니다. 특히 찬드 바오리는 지역 주민, 가축, 농지에 물을 공급하는 동시에 뜨거운 사막의 여름 동안 시원한 휴식처 역할을 하도록 설계되었습니다. 그 구조는 가혹한 환경 조건에 적응한 고대 인도 건축가들의 독창성과 공학적 전문 지식을 반영합니다. [NEWLINE][NEWLINE]계단식 우물은 약 30미터 깊이로 내려가며 13개 층에 걸쳐 기하학적 패턴으로 배열된 3,500개의 좁은 계단으로 구성되어 시각적으로 눈에 띄는 역피라미드를 형성합니다. 벽은 신, 무용수, 꽃 모티프를 묘사한 정교한 조각으로 장식되어 실용성과 예술적 표현을 결합했습니다. 바닥에는 건기에도 기능하는 저수지가 있습니다. 찬드 바오리는 공학적 경이로움일 뿐만 아니라 중세 라자스탄의 사회적, 종교적, 건축적 전통을 반영하는 문화적 상징이기도 합니다. 오늘날 이곳은 관광객과 학자 모두를 끌어들이며 인도의 풍부한 물 관리 유산과 기념비적 디자인에 대한 증거 역할을 합니다.'),
			('TXT_KEY_BUILDING_CHAND_BAORI_HELP',	'');

INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_BUILDING_CHAND_BAORI_HELP_CUT', '[COLOR_YIELD_FOOD]찬드 바오리[ENDCOLOR]는 지역 [COLOR_CITY_BLUE]사막[ENDCOLOR]이 불모지가 되지 않도록 보장합니다(+1[ICON_FOOD]/[COLOR_CITY_BLUE]타일[ENDCOLOR]; +2[ICON_FOOD]). 또한 새로운 전문가들이 사무실을 차리고(+1[ICON_GOLD]; -3[ICON_HAPPINESS_3] 도시화) 귀족들 사이에 매우 중요하고 수익성 있는 거래가 합의되는 곳이기도 합니다(+2[ICON_CULTURE]; [COLOR_YIELD_GOLD]무료 [ICON_GREAT_PEOPLE][ENDCOLOR]; +10%[ICON_GREAT_PEOPLE]).');
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]사막[ENDCOLOR]; 지물: [COLOR_NEGATIVE_TEXT]담수[ENDCOLOR]; 건물: [COLOR_CYAN]우물[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_CHAND_BAORI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '지물: [COLOR_NEGATIVE_TEXT]담수[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_CHAND_BAORI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Songyue Pagoda (Holy)
INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_SONGYUE',			'숭악사탑'),
			('TXT_KEY_WONDER_SONGYUE_QUOTE',		'[NEWLINE]"사원은 하늘과 땅이 교차하는 지점이다."[NEWLINE] - 데이비드 A. 베드나[NEWLINE]'),
			('TXT_KEY_BUILDING_SONGYUE_PEDIA',		'중국 허난성 숭산에 위치한 숭악사탑은 서기 523년경 북위 시대로 거슬러 올라가는 중국에서 가장 오래된 벽돌 탑입니다. 이 고대 구조물은 한족과 중앙아시아의 영향이 혼합된 중국 초기 불교 건축의 증거로 서 있습니다. 이 탑은 당시 더 일반적이었던 사각형 탑에서 벗어난 원형 평면으로 유명하며, 12층 구조가 우아하게 좁아지고 각 층마다 독특한 처마 장식이 있습니다. 숭악사탑의 정교한 벽돌 작업과 아치 및 브래킷 사용은 당시의 진보된 공학 기술을 보여주며 중국 건축의 초기 발전을 보여줍니다. [NEWLINE][NEWLINE]건축학적으로 숭악사탑은 우아하고 혁신적인 디자인으로 중요하며, 이는 중국 전역의 후속 탑 건설에 영향을 미쳤습니다. 탑 내부에는 좁은 통로로 둘러싸인 중앙 기둥이 있어 숭배자들이 경의를 표하며 탑돌이를 할 수 있습니다. 이 디자인은 또한 구조적 안정성을 제공하여 탑이 수 세기 동안의 자연적 마모와 지진 활동을 견딜 수 있게 했습니다. 중국 불교 확산의 지속적인 상징인 숭악사탑은 역사적 맥락과 건축적 중요성을 이해하려는 학자, 건축가, 관광객을 끌어들이는 중요한 문화 및 역사적 기념물로 남아 있습니다. 2010년 이 탑은 "천지 가운데 덩펑의 역사 기념물" 유적지의 일부로 인근의 다른 기념물과 함께 유네스코 세계문화유산에 등재되었습니다.'),
			('TXT_KEY_BUILDING_SONGYUE_HELP',		'[ICON_BULLET]모든 도시에서 [ICON_PEACE] 신앙 구매의 2%를 [ICON_PRODUCTION] 생산력으로 전환합니다.');

UPDATE Language_ko_KR SET Text = '[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_SONGYUE_HELP';

INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_BUILDING_SONGYUE_HELP_CUT', '[COLOR_YIELD_FOOD]숭악사탑[ENDCOLOR]은 많은 건축적 가치를 지닌 독특한 건축물입니다(+2[ICON_CULTURE]; +1[ICON_GREAT_ARTIST]). 단순한 탑이 아니라 전 세계에 평화를 전파하려는 승려들이 있는 거대한 성스러운 단지의 일부입니다(+2[ICON_PEACE]; 2%[ICON_PEACE][ICON_PEACE] 신앙 구매 -> [ICON_PRODUCTION]). [COLOR_YIELD_FOOD]탑[ENDCOLOR]([COLOR_YIELD_FOOD]무료[ENDCOLOR])을 더 많이 지을수록 시민들에게 더 좋은 영향을 미치며, 특히 원래 건물의 스타일을 모방하는 경우 더욱 그렇습니다(5[ICON_GREAT_ARTIST]/[COLOR_YIELD_FOOD]고전 (또는 이후) 건물[ENDCOLOR] 건설).');
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_YIELD_PRODUCTION]성도[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_SONGYUE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '특수: [COLOR_YIELD_PRODUCTION]성도[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_SONGYUE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Great Lighthouse
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_WONDER_GREAT_LIGHTHOUSE_HELP_CUT',	'[COLOR_YIELD_FOOD]등대[ENDCOLOR]([COLOR_YIELD_FOOD]무료[ENDCOLOR]) 없이는 목적지를 찾기가 어려울 수 있으며, 모든 선원이나 상인이 이를 확인할 것입니다(+2[ICON_PRODUCTION]; +1[ICON_GREAT_MERCHANT]). [COLOR_YIELD_FOOD]알렉산드리아 등대[ENDCOLOR]는 또한 해군 장교를 포함한 모든 바다 전사를 강화하여 특히 거친 폭풍우 날씨에 다른 유닛보다 상당한 이점을 제공합니다([COLOR_WATER_TEXT]항해 II[ENDCOLOR]/[COLOR_YIELD_GOLD]해상 군사[ENDCOLOR]; +1[ICON_GREAT_ADMIRAL]).');

UPDATE Language_ko_KR SET Text = REPLACE(Text, 'The Bible, Psalms 107:23-24', '"성경: 시편 107:23-24"') WHERE Tag ='TXT_KEY_WONDER_GREATLIGHTHOUSE_QUOTE';

UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR], [COLOR_NEGATIVE_TEXT]초원[ENDCOLOR]; 지물: [COLOR_CYAN]강[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_GREAT_LIGHTHOUSE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 지물: [COLOR_CYAN]강[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_GREAT_LIGHTHOUSE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Great Library
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_WONDER_GREAT_LIBRARY_HELP_CUT', '[COLOR_YIELD_FOOD]알렉산드리아 도서관[ENDCOLOR]의 방대한 장서 컬렉션은 다른 모든 [COLOR_YIELD_FOOD]도서관[ENDCOLOR]([COLOR_YIELD_FOOD]무료[ENDCOLOR])과 마찬가지로 막대한 과학적 부스트(+3[ICON_RESEARCH]; +1[ICON_GREAT_SCIENTIST]), 즉각적인 기술 진보([COLOR_CYAN]무료 기술[ENDCOLOR]) 및 문학을 위한 추가 선반을 제공하여 컬렉션이 완료되면 더 많은 과학적 돌파구를 보장합니다(테마 보너스 시 2[ICON_GW_WRITING]: [ICON_RESEARCH]).');
				
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]언덕[ENDCOLOR]; 지형: [COLOR_CYAN]해안[ENDCOLOR]; 지물: [COLOR_CYAN]숲[ENDCOLOR]/[COLOR_CYAN]정글[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_GREAT_LIBRARY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]언덕[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_GREAT_LIBRARY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Forum Romanum
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_BUILDING_ROMAN_FORUM_HELP_CUT', '[COLOR_YIELD_FOOD]포룸 로마눔[ENDCOLOR]은 다양한 트릭을 사용하여 당신을 세계에서 가장 영향력 있는 통치자로 변화시킵니다([COLOR_WATER_TEXT]제국 옥새[ENDCOLOR]/[COLOR_YIELD_GOLD]외교[ENDCOLOR]; +1[ICON_CULTURE]). 당신은 대표단을 위한 훈련 프로그램을 개선하고 가속화하는 자격을 갖춘 전문가([COLOR_YIELD_GOLD]무료 [ICON_DIPLOMAT][ENDCOLOR]; +1[ICON_DIPLOMAT])의 지원을 받습니다(+20%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]외교[ENDCOLOR]). 이는 중요한 합의를 마무리하는 데 필요한 [COLOR_GREY]종이[ENDCOLOR] 생산 강화와 일치합니다(+1[ICON_RES_PAPER]).');
				
UPDATE Language_ko_KR SET Text = '지물: [COLOR_CYAN]강[ENDCOLOR], [COLOR_CYAN]습지[ENDCOLOR]; 정책: [COLOR_MAGENTA]필요 정책 1개 감소[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_ROMAN_FORUM_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지물: [COLOR_CYAN]습지[ENDCOLOR]; 정책: [COLOR_MAGENTA]필요 정책 1개 감소[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_ROMAN_FORUM_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Hanging Gardens
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_WONDER_HANGING_GARDEN_HELP_CUT', '[COLOR_YIELD_FOOD]공중정원[ENDCOLOR]은 자연의 아름다움(+1[ICON_CULTURE])과 관개 및 수화에 관한 혁신적인 솔루션(+10[ICON_FOOD])을 연결하는 공학적 걸작입니다. 이 다층 [COLOR_YIELD_FOOD]정원[ENDCOLOR]([COLOR_YIELD_FOOD]무료[ENDCOLOR])은 이전에 본 어떤 것보다 훨씬 크고 장관이며 제국을 방문하는 모든 사람을 놀라게 할 것입니다.');
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_NEGATIVE_TEXT]해안[ENDCOLOR]; 타일: [COLOR_CYAN]평지[ENDCOLOR]; 지물: [COLOR_CYAN]담수[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_HANGING_GARDEN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지물: [COLOR_CYAN]담수[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_HANGING_GARDEN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Terracota Army
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_WONDER_TERRA_COTTA_ARMY_HELP_CUT',	'놀라운 [COLOR_YIELD_FOOD]병마용[ENDCOLOR]은 영광스러운 죽음 후에도 권력을 유지할 수 있게 해줍니다(+5[ICON_SILVER_FIST]). 이 문화적 걸작은 현재의 군사력과 군대의 성공이 제국 시민들에게 어떤 영향을 미치는지 반영합니다(10[ICON_CULTURE]/처치). 이 프로젝트를 마무리하려면 신선하고 더 적극적인 인력을 도입하고(+25%[ICON_WORKER]) 조각가들에게 꼭 필요한 물품을 더 많이 보내야 합니다(+1[ICON_PRODUCTION]).');
				
UPDATE Language_ko_KR SET Text = '지물: [COLOR_NEGATIVE_TEXT]물[ENDCOLOR]; 시설: [COLOR_CYAN]2 (광산 + 채석장)[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_TERRA_COTTA_ARMY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지물: [COLOR_NEGATIVE_TEXT]물[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_TERRA_COTTA_ARMY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Nalanda
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_BUILDING_NALANDA_HELP_CUT', '[COLOR_YIELD_FOOD]날란다[ENDCOLOR]는 놀라운 문학을 담고 있는 사원이지만(테마 보너스 시 2[ICON_GREAT_WORK]: [ICON_CULTURE]; [COLOR_CULTURE_STORED]입보리행론[ENDCOLOR]), 모든 [COLOR_YIELD_FOOD]원형 극장[ENDCOLOR]을 과학 및 문화 센터로 바꾸고(+1[ICON_RESEARCH][ICON_RESEARCH]; +1[ICON_CULTURE][ICON_CULTURE]) 시민들의 삶의 질을 높이는 대학 역할도 합니다(+2[ICON_CULTURE]; -1[ICON_HAPPINESS_3] 지루함). 그리고 헌신적인 시민들은 확실히 군대의 대열을 늘릴 것입니다([ICON_CITIZEN]의 +10%를 [ICON_SILVER_FIST]로).');
				
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]언덕[ENDCOLOR]; 지형: [COLOR_CYAN]해안[ENDCOLOR]; 지물: [COLOR_NEGATIVE_TEXT]담수[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_NALANDA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]언덕[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_NALANDA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Oracle
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_WONDER_ORACLE_HELP_CUT', '신비한 [COLOR_YIELD_FOOD]오라클[ENDCOLOR]은 강력한 비밀을 간직하고 있습니다. 미래를 밝혀 다른 국가보다 즉각적인 우위를 점하게 합니다(500[ICON_RESEARCH]; 500[ICON_CULTURE]). 다른 [COLOR_YIELD_FOOD]사원[ENDCOLOR]([COLOR_YIELD_FOOD]무료[ENDCOLOR])과 달리 지식을 무엇보다 우선시하여(+1[ICON_RESEARCH]; +1[ICON_GREAT_SCIENTIST]) 시민들의 문해력(-1[ICON_HAPPINESS_3] 문맹)과 문화적 인식을 높입니다(+1[ICON_CULTURE]).');
				
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]언덕[ENDCOLOR]; 지형: [COLOR_CYAN]산 (범위 2)[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_ORACLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]언덕[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_ORACLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Angkor Wat
INSERT INTO Language_ko_KR 
			(Tag,								Text) 
VALUES		('TXT_KEY_POLICY_ANGKOR_WAT_DUMMY',	'앙코르 와트');

INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_WONDER_ANGKOR_WAT_HELP_CUT', '[COLOR_YIELD_FOOD]앙코르 와트[ENDCOLOR]는 주변 지형을(+25%[ICON_CULTURE_LOCAL][ICON_CULTURE_LOCAL] 국경 확장; -25%[ICON_GOLD][ICON_GOLD] 타일 비용) 기념비적인 종교 사원으로 바꾸는 거대한 단지입니다(+2[ICON_PEACE]; 20[ICON_PEACE]/[ICON_CULTURE_LOCAL] 국경 확장). 또한 외교 거점 역할도 하며(+2[ICON_DIPLOMAT]), 종교와 외교의 독특한 조합(+3[ICON_PEACE]/[ICON_DIPLOMAT]; 플레이어는 [ICON_PEACE] 신앙으로 [COLOR_YIELD_GOLD]기본 외교 유닛[ENDCOLOR]을 구매할 수 있으며 구식이 되지 않음)은 놀라운 문화적 경험을 선사합니다(+2[ICON_CULTURE]).');
				
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]평지[ENDCOLOR]; 지물: [COLOR_CYAN]호수[ENDCOLOR], [COLOR_CYAN]정글[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_ANGKOR_WAT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지물: [COLOR_CYAN]호수[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_ANGKOR_WAT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Great Wall
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_WONDER_GREAT_WALL_HELP_CUT', '[COLOR_YIELD_FOOD]만리장성[ENDCOLOR]은 오랫동안 사람들을 보호해 온 믿을 수 없을 정도로 성공적인 방어 프로젝트입니다(+1[ICON_GREAT_ENGINEER]; [COLOR_NEGATIVE_TEXT]적[ENDCOLOR]: 국경을 넘으면 모든 [ICON_MOVES]이동력 상실, [ICON_RESEARCH] [COLOR_NEGATIVE_TEXT]화약[ENDCOLOR]에서 구식화). [COLOR_YIELD_FOOD]성벽[ENDCOLOR]([COLOR_YIELD_FOOD]무료[ENDCOLOR])을 한 단계 업그레이드하여 놀라운 군대를 모으고(+3[ICON_SILVER_FIST]) 지휘관들에게 아주 새로운 뛰어난 전술을 훈련시킬 수 있습니다([COLOR_YIELD_GOLD]무료 [ICON_GREAT_GENERAL][ENDCOLOR]).');
				
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]언덕[ENDCOLOR]; 지물: [COLOR_CYAN]강[ENDCOLOR]; 다른 플레이어: [COLOR_CYAN]기만적[ENDCOLOR]/[COLOR_CYAN]배타적[ENDCOLOR]/[COLOR_CYAN]전쟁 중[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_GREAT_WALL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]언덕[ENDCOLOR]; 지물: [COLOR_CYAN]강[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_GREAT_WALL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Colossus
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_WONDER_COLOSSUS_HELP_CUT', '[COLOR_YIELD_FOOD]거신상[ENDCOLOR]은 바다에 대한 당신의 지배력을 보여줍니다(+5[ICON_GOLD]). 가장 중요한 통로에 대한 통제권을 얻고(들어오는 국제 [ICON_INTERNATIONAL_TRADE]: +2[ICON_GOLD]/소유자에게 +1[ICON_GOLD]) 상품을 판매할 새로운 고객과 장소를 찾는 것(+1[ICON_INTERNATIONAL_TRADE]; [COLOR_YIELD_GOLD]무료 화물선[ENDCOLOR])은 지역에서 가장 강력한 상인이 되는 열쇠입니다(+1[ICON_GREAT_MERCHANT]).');

UPDATE Language_ko_KR SET Text = REPLACE(Text, 'William Shakespeare: Julius Caesar', '"줄리어스 시저", 윌리엄 셰익스피어') WHERE Tag ='TXT_KEY_WONDER_COLOSSUS_QUOTE';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 개발된 자원: [ICON_RES_IRON]/[ICON_RES_COPPER].'||Text WHERE Tag ='TXT_KEY_WONDER_COLOSSUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_COLOSSUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
----------------------------------------------------
-- Prophet's Mosque
INSERT INTO Language_ko_KR 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_NABAWI',				'예언자의 모스크'),
			('TXT_KEY_WONDER_NABAWI_QUOTE',			'[NEWLINE]"돈과 미모에서 당신보다 더 많이 가진 사람을 보면, 당신보다 덜 가진 사람들을 보라."[NEWLINE] - 예언자 무함마드[NEWLINE]'),
			('TXT_KEY_BUILDING_NABAWI_PEDIA',		'알 마스지드 알 나바위, 일명 예언자의 모스크는 사우디아라비아 메디나에 위치하고 있으며 메카의 마스지드 알 하람 다음으로 이슬람에서 두 번째로 신성한 장소입니다. 서기 622년 예언자 무함마드가 메카에서 이주(히즈라)한 직후 처음 지었으며, 예배 장소일 뿐만 아니라 커뮤니티 센터, 법원, 종교 학교 역할을 했습니다. 수 세기 동안 모스크는 우마이야, 아바스, 현대 사우디 국가를 포함한 다양한 이슬람 통치자들에 의해 수많은 확장을 거쳐 세계에서 가장 크고 건축적으로 중요한 모스크 중 하나로 변모했습니다. 모스크에는 예언자 무함마드의 무덤도 있어 전 세계 무슬림들의 주요 순례지가 되었습니다. [NEWLINE][NEWLINE]오늘날 모스크 단지는 수십만 평방미터에 달하며 눈에 띄는 녹색과 흰색 미나렛, 거대한 기도실, 안뜰의 개폐식 우산을 특징으로 하여 숭배자들에게 그늘을 제공합니다. 내부는 정교한 이슬람 서예, 모자이크, 대리석 바닥으로 장식되어 영적 중요성과 건축적 웅장함을 모두 반영합니다. 모스크에는 또한 이슬람 전통에 따라 낙원의 정원 중 하나로 여겨지는 예언자의 무덤과 강단 사이의 숭배받는 구역인 라우다가 포함되어 있습니다. 알 마스지드 알 나바위는 무슬림의 헌신, 학문, 공동체 생활의 중심지로 계속 남아 있으며 이슬람의 지속적인 영적, 문화적 유산을 상징합니다.'),
			('TXT_KEY_BUILDING_NABAWI_HELP',		''),
			('TXT_KEY_THEMING_BONUS_NABAWI',		'이슬람 서예 작품'),
			('TXT_KEY_THEMING_BONUS_NABAWI_HELP',	'보너스를 극대화하려면 두 걸작 슬롯을 모두 당신이 만든 저서로 채우십시오.');
			
INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_NABAWI_HELP_CUT', '[COLOR_YIELD_FOOD]예언자의 모스크[ENDCOLOR]는 세계에서 가장 큰 [COLOR_YIELD_FOOD]모스크[ENDCOLOR] 중 하나입니다([COLOR_YIELD_FOOD]무료[ENDCOLOR]). 예언자 무함마드가 지은 이곳은 역사적으로 중요한 종교 중심지이며(+5[ICON_PEACE]; +10%[ICON_PEACE][ICON_PEACE]) 아랍 종교 문학을 배울 수 있습니다(+20%[ICON_GREAT_WRITER]; 테마 보너스 시 2[ICON_GW_WRITING]: [ICON_PEACE], [ICON_GOLDEN_AGE]). 여러 문화에 의해 리모델링되었지만 여전히 볼 수 있는 가장 아름답고 놀라운 사원입니다(+2[ICON_CULTURE]).';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_YIELD_PRODUCTION]성도[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_NABAWI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_ko_KR SET Text = '특수: [COLOR_YIELD_PRODUCTION]성도[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_NABAWI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);		
----------------------------------------------------
-- Moray
INSERT INTO Language_ko_KR 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_MORAY',				'모라이'),
			('TXT_KEY_WONDER_MORAY_QUOTE',			'[NEWLINE]"과학은 지식의 집합체라기보다는 사고방식이다."[NEWLINE] - 칼 세이건[NEWLINE]'),
			('TXT_KEY_BUILDING_MORAY_PEDIA',		'페루 쿠스코 근처의 성스러운 계곡에 위치한 모라이 테라스는 15세기로 거슬러 올라가는 잉카 농업 독창성의 놀라운 예입니다. 실험적인 농업 연구소였던 것으로 추정되는 이 유적지는 자연적인 움푹 들어간 곳에 조각된 일련의 동심원 테라스로 구성되어 있어 잉카인들이 다양한 기후 조건이 작물에 미치는 영향을 연구할 수 있었습니다. 테라스의 각 층은 뚜렷한 미기후를 조성하여 상단과 하단의 온도 차이가 최대 15°C에 달해 옥수수, 감자, 퀴노아와 같은 다양한 작물을 재배할 수 있었습니다. 이 유적지는 농경학, 관개 및 토양 보존에 대한 잉카의 진보된 이해를 보여주며 다양한 환경 조건에 농업을 적응시키는 능력을 강조합니다. [NEWLINE][NEWLINE]테라스 자체는 옹벽, 정교한 배수 시스템, 침식을 방지하면서 물 분배를 극대화하는 수로로 건설되었습니다. 원형 디자인은 햇빛 노출과 온도 조절을 최적화했을 뿐만 아니라 서리 피해 위험을 최소화하여 안데스 고원에서의 농업에 대한 매우 전략적인 접근 방식을 보여줍니다. 농업 기능 외에도 모라이는 토지와 작물의 신성함에 대한 잉카의 믿음을 반영하여 의식 및 제례적 중요성을 지녔을 가능성이 큽니다. 오늘날 모라이 테라스는 인기 있는 고고학 유적지로 잉카 문명의 기술적, 문화적, 영적 정교함에 대한 통찰력을 제공합니다.'),
			('TXT_KEY_BUILDING_MORAY_HELP',			'');
			
INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_MORAY_HELP_CUT', '[COLOR_CITY_BLUE]언덕[ENDCOLOR]에 건설된 신비한 농업 구조물인 [COLOR_YIELD_FOOD]모라이[ENDCOLOR](+1[ICON_FOOD], +1[ICON_PRODUCTION], +1[ICON_RESEARCH]/[COLOR_CITY_BLUE]타일[ENDCOLOR]; +2[ICON_FOOD]; +5%[ICON_FOOD][ICON_FOOD])는 자연적으로 볼 수 없는 곳에서 특이한 식물과 작물을 재배할 수 있게 해줍니다(+2[ICON_RESEARCH]). 과학적 이점을 사용하여 성장을 더욱 촉진하십시오(15%[ICON_RESEARCH] -> [ICON_FOOD]).';
				
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]언덕[ENDCOLOR]; 지형: [COLOR_NEGATIVE_TEXT]해안[ENDCOLOR]; 시설: [COLOR_CYAN]농장[ENDCOLOR]'||Text WHERE Tag ='TXT_KEY_BUILDING_MORAY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]언덕[ENDCOLOR]; 지형: [COLOR_NEGATIVE_TEXT]해안[ENDCOLOR]'||Text WHERE Tag ='TXT_KEY_BUILDING_MORAY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	

UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]진보 완성[ENDCOLOR]; '||Text WHERE Tag ='TXT_KEY_BUILDING_MORAY_HELP' AND EXISTS (SELECT * FROM Community WHERE Type='MW-SETTING-POLICIES' AND Value=1);
----------------------------------------------------
-- Lavaux
INSERT INTO Language_ko_KR 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_LAVAUX',				'라보'),
			('TXT_KEY_WONDER_LAVAUX_QUOTE',			'[NEWLINE]"와인 한 병에는 세상의 모든 책보다 더 많은 철학이 담겨 있다."[NEWLINE] - 루이 파스퇴르[NEWLINE]'),
			('TXT_KEY_BUILDING_LAVAUX_PEDIA',		'스위스 제네바 호수 북쪽 기슭에 위치한 라보는 11세기로 거슬러 올라가는 기원을 가진 역사적인 와인 재배 지역입니다. 인근 베네딕토회 및 시토회 수도원의 수도사들이 가파른 계단식 경사면에서 포도밭을 경작하기 시작하여 포도 생산을 위한 햇빛 노출과 배수를 최적화하도록 풍경을 형성했습니다. 수 세기 동안 이 지역은 독특한 포도 재배 전통을 발전시켜 지역 문화와 경제에 기여한 고품질 와인을 생산했습니다. 라보의 인간 독창성과 자연의 아름다움의 결합은 사람과 환경 간의 조화로운 상호 작용을 반영하여 2007년 유네스코 세계문화유산 지위를 획득했습니다. [NEWLINE][NEWLINE]라보의 테라스는 토양 침식을 방지하고 샤슬라와 같은 포도 품종을 재배하기에 이상적인 미기후를 조성하는 건식 석조 벽으로 지지됩니다. 풍경은 역사적인 마을, 와인 저장고, 방문객들이 제네바 호수와 알프스의 탁 트인 전망을 즐기면서 포도밭을 탐험할 수 있는 산책로로 곳곳에 있습니다. 이 지역의 디자인은 농업 생산성을 극대화할 뿐만 아니라 수 세기 동안의 문화 및 건축 유산을 보존합니다. 오늘날 라보는 와인 생산 및 관광의 활기찬 중심지로 남아 있으며 지속 가능한 토지 이용과 스위스 전통 포도 재배의 지속적인 유산의 살아있는 예를 제공합니다.'),
			('TXT_KEY_BUILDING_LAVAUX_HELP',		'');
			
INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_LAVAUX_HELP_CUT', '[COLOR_YIELD_FOOD]라보[ENDCOLOR]의 포도밭은 독특한 포도의 유명한 원산지입니다(2[ICON_RES_WINE] 생성; +1[ICON_FOOD], +1[ICON_GOLD], +1[ICON_PEACE]/[ICON_RES_WINE]). 근처 [COLOR_CITY_GREEN]호수[ENDCOLOR]의 맑은 물에서 자란 이 맛있는 과일을 재배하여 모든 시민을 훨씬 더 행복하게 만드십시오(-10%[ICON_HAPPINESS_3][ICON_HAPPINESS_3] 요구; +1[ICON_GOLD])(+1[ICON_FOOD]/[COLOR_CITY_GREEN]타일[ENDCOLOR]; +2[ICON_FOOD]).';
				
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]언덕[ENDCOLOR]; 지물: [COLOR_CYAN]호수[ENDCOLOR]; 도시: [COLOR_CYAN][ICON_RES_WINE]을 위한 공간[ENDCOLOR]; 지도: [COLOR_CYAN]지도상의 [ICON_RES_WINE][ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_LAVAUX_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]언덕[ENDCOLOR]; 지물: [COLOR_CYAN]호수[ENDCOLOR]; 도시: [COLOR_CYAN][ICON_RES_WINE]을 위한 공간[ENDCOLOR]; 지도: [COLOR_CYAN]지도상의 [ICON_RES_WINE][ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_LAVAUX_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Wartburg
INSERT INTO Language_ko_KR 
			(Tag,										Text)
VALUES		('TXT_KEY_BUILDING_WARTBURG',				'바르트부르크'),
			('TXT_KEY_WONDER_WARTBURG_QUOTE',			'[NEWLINE]"자연에서 우리는 고립된 것을 결코 보지 못하며, 모든 것은 그 앞, 옆, 아래, 위에 있는 다른 것과 연결되어 있다."[NEWLINE] - 요한 볼프강 폰 괴테[NEWLINE]'),
			('TXT_KEY_BUILDING_WARTBURG_PEDIA',			'독일 튀링겐주 아이제나흐 마을이 내려다보이는 언덕에 자리 잡은 바르트부르크성은 원래 1067년경 루트비히 데어 슈프링거에 의해 지어졌습니다. 수 세기 동안 이곳은 독일에서 가장 중요한 중세 요새 중 하나가 되었으며 귀족의 거주지이자 문화 및 정치 활동의 중심지 역할을 했습니다. 역사적 명성은 특히 1521~1522년 신성 로마 제국에 의해 추방된 후 바르트부르크로 피신한 마틴 루터와 관련이 있습니다. 머무는 동안 루터는 신약 성경을 그리스어에서 독일어로 번역했는데, 이는 유럽의 종교, 문해력, 문화에 지대한 영향을 미쳤습니다. 바르트부르크는 역사적, 건축적, 문화적 중요성을 인정받아 현재 유네스코 세계문화유산입니다. [NEWLINE][NEWLINE]건축학적으로 바르트부르크성은 로마네스크, 고딕, 후기 르네상스 양식이 혼합되어 있어 수 세기에 걸친 건설과 개조를 반영합니다. 성에는 요새화된 벽, 탑, 성채뿐만 아니라 프레스코화와 시대 가구로 장식된 우아한 홀, 예배당, 주거 공간이 있습니다. 전략적인 언덕 위 위치는 방어와 주변 풍경의 탁 트인 전망을 모두 제공했습니다. 오늘날 바르트부르크는 박물관이자 관광 명소로 방문객들에게 중세 생활, 종교 개혁 역사, 독일의 예술적 유산에 대한 통찰력을 제공하는 동시에 문화적 회복력과 역사적 기억의 상징으로 서 있습니다.'),
			('TXT_KEY_BUILDING_WARTBURG_HELP',			''),
			('TXT_KEY_THEMING_BONUS_WARTBURG',			'모든 국가에 영감을 준 문학'),
			('TXT_KEY_THEMING_BONUS_WARTBURG_HELP',		'보너스를 극대화하려면 모든 걸작 슬롯을 당신이 만든 문학으로 채우십시오.');
			
INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_WARTBURG_HELP_CUT', '[COLOR_YIELD_FOOD]바르트부르크[ENDCOLOR]와 함께라면 당신은 문학의 왕이 될 것입니다(+1[ICON_CULTURE]; +2[ICON_GREAT_WRITER]; +30%[ICON_GREAT_WRITER]). 문학은 성(+7[ICON_STRENGTH])에 위치한 압도적인 도서관(+1[ICON_GOLDEN_AGE]; 테마 보너스 시 3[ICON_GW_WRITING]: [ICON_CULTURE], [ICON_PEACE], [ICON_GOLDEN_AGE])에 보관될 수 있습니다. 모든 [COLOR_YIELD_FOOD]작가 길드[ENDCOLOR]는 최첨단 종교 사상(+1[ICON_PEACE][ICON_PEACE])에 영감을 받을 것이며, 장군들은 이 컬렉션을 사용하여 새로운 훈련 방법을 개발할 수 있습니다(+5 경험치/[COLOR_YIELD_GOLD]지상[ENDCOLOR]/내부 [ICON_GREAT_WORK]).';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]진보 완성[ENDCOLOR]; 지물: [COLOR_CYAN]숲[ENDCOLOR]; 건물: [COLOR_CYAN]작가 길드[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_WARTBURG_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]진보 완성[ENDCOLOR]; 건물: [COLOR_CYAN]작가 길드[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_WARTBURG_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Great Zimbabwe
INSERT INTO Language_ko_KR 
			(Tag,										Text) 
VALUES		('TXT_KEY_BUILDING_GREAT_ZIMBABWE',			'그레이트 짐바브웨'),
			('TXT_KEY_WONDER_GREAT_ZIMBABWE_QUOTE',		'[NEWLINE]"신은 선하지만 사자와 춤추지는 마라."[NEWLINE] - 짐바브웨 속담[NEWLINE]'),
			('TXT_KEY_BUILDING_GREAT_ZIMBABWE_PEDIA',	'짐바브웨 남동부 무티리크웨 호수 근처 언덕에 위치한 그레이트 짐바브웨는 후기 철기 시대 짐바브웨 왕국의 수도였으며 서기 11세기에서 15세기 사이에 번성했습니다. 쇼나족의 정치, 경제, 종교 중심지 역할을 했으며 아프리카 남부 전역과 스와힐리 해안 및 그 너머까지 확장된 무역 네트워크를 감독했습니다. 도시의 부는 주로 소 목축, 농업, 금과 상아 무역에서 파생되었으며, 이를 통해 아라비아, 페르시아, 인도의 상인들과 접촉했습니다. 그레이트 짐바브웨의 명성은 15세기에 정치적 불안정, 자원 고갈 또는 무역로의 변화로 인해 쇠퇴했을 수 있지만, 그 폐허는 아프리카의 독창성과 국정 운영의 강력한 상징으로 남아 있습니다. [NEWLINE][NEWLINE]이 유적지는 모르타르 없이 건설된 놀라운 석조 건축물로 유명하며 거대한 벽, 원추형 탑, 복잡한 인클로저가 특징입니다. 높은 곡선 벽과 상징적인 "짐바브웨 타워"가 있는 대인클로저는 가장 큰 구조물이며 힐 콤플렉스는 왕실 거주지이자 종교 중심지 역할을 했습니다. 레이아웃과 건설은 진보된 공학, 사회 조직 및 미적 감각을 보여줍니다. 오늘날 그레이트 짐바브웨는 유네스코 세계문화유산이자 식민지 이전 아프리카 문명의 기술적, 문화적, 정치적 성취에 대한 지속적인 증거로서 전 세계의 학자와 방문객을 끌어들이고 있습니다.'),
			('TXT_KEY_BUILDING_GREAT_ZIMBABWE_HELP',	'[ICON_BULLET]제국 내 활성 [ICON_INTERNATIONAL_TRADE] 교역로마다 이 도시에서 +2 [ICON_GOLDEN_AGE] 및 지상 군사 유닛에 대해 +5% [ICON_PRODUCTION].');

UPDATE Language_ko_KR SET Text = '[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_GREAT_ZIMBABWE_HELP';
			
INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_GREAT_ZIMBABWE_HELP_CUT', '[COLOR_YIELD_FOOD]그레이트 짐바브웨[ENDCOLOR]는 확장된 무역 네트워크를 활용하여 영향력을 높이고(+1[ICON_GOLD]; +1[ICON_INTERNATIONAL_TRADE]; +2[ICON_GOLDEN_AGE]/[ICON_INTERNATIONAL_TRADE][ICON_INTERNATIONAL_TRADE]) 군대 생산을 촉진합니다(+5%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]지상[ENDCOLOR]/[ICON_INTERNATIONAL_TRADE][ICON_INTERNATIONAL_TRADE]). 국고를 사용하여 제국의 영토를 확장하고(-30%[ICON_GOLD][ICON_GOLD] 타일 비용) 자신을 위한 안전한 피난처를 건설하십시오(+10[ICON_STRENGTH]).';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]권위 완성[ENDCOLOR]; 지형: [COLOR_NEGATIVE_TEXT]해안[ENDCOLOR]; 시설: [COLOR_CYAN]2 (광산 + 야영지)[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_GREAT_ZIMBABWE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]권위 완성[ENDCOLOR]; 지형: [COLOR_NEGATIVE_TEXT]해안[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_GREAT_ZIMBABWE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Ahu Tongariki
INSERT INTO Language_ko_KR 
			(Tag,								Text) 
VALUES		('TXT_KEY_BUILDING_AHU',			'아후 통가리키'),
			('TXT_KEY_WONDER_AHU_QUOTE',		'[NEWLINE]"은유는 너무나 명백하다. 태평양에 고립된 이스터섬 - 섬이 곤경에 처했을 때 자유로워질 방법은 없었다. 도움을 받을 수 있는 다른 사람들은 없었다. 마찬가지로 지구라는 행성에 사는 우리도 우리 자신의 세상을 망친다면 도움을 받을 수 없을 것이다."[NEWLINE] - 재러드 다이아몬드[NEWLINE]'),
			('TXT_KEY_BUILDING_AHU_PEDIA',		'남동 태평양 이스터섬(라파누이)에 위치한 아후 통가리키는 섬에서 가장 큰 의식용 플랫폼(아후)으로, 15개의 모아이 석상이 인상적으로 늘어선 것으로 유명합니다. 이 유적지는 서기 13~15세기로 거슬러 올라가며 원래 라파누이 사람들이 중요한 조상에게 경의를 표하고 종교 및 사회적 모임의 중심지로 건설했습니다. 섬의 다른 모아이 유적지와 마찬가지로 아후 통가리키는 석조 조각, 운송 및 의식 관행에 대한 섬 주민들의 정교한 이해를 반영합니다. 플랫폼과 조각상은 18~19세기 내부 갈등 중에 파괴되었지만 쓰나미로 무너진 후 1995년에 복원되어 라파누이 회복력의 역사적, 문화적 상징이 되었습니다. [NEWLINE][NEWLINE]아후 통가리키의 모아이는 거대한 석조 플랫폼 위에 서 있으며, 각각 화산 응회암으로 조각되었고 높이는 4~10미터입니다. 조각상은 길쭉한 얼굴, 두드러진 코, 양식화된 몸통이 특징이며, 많은 조각상이 원래 붉은 스코리아로 만든 원통형 돌 모자인 푸카오를 쓰고 있었습니다. 내륙을 향한 모아이의 배치는 공동체를 보호하는 감시하는 조상으로서의 역할을 의미합니다. 오늘날 아후 통가리키는 주요 관광 명소일 뿐만 아니라 고고학 연구의 중요한 장소로서 라파누이 사회, 영성, 그리고 공학 및 예술 분야에서 섬 주민들의 놀라운 성취에 대한 통찰력을 제공합니다.'),
			('TXT_KEY_BUILDING_AHU_HELP',		'');
			
INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_AHU_HELP_CUT', '기념비적인 플랫폼인 [COLOR_YIELD_FOOD]아후 통가리키[ENDCOLOR]는 인근 [COLOR_CITY_BROWN]채석장[ENDCOLOR]의 생산량을 크게 늘리고(+2[ICON_PRODUCTION]/[COLOR_CITY_BROWN]타일[ENDCOLOR]) 모든 [COLOR_GREY]석재[ENDCOLOR] 매장지로 문화를 확장합니다(+1[ICON_CULTURE]/[ICON_RES_STONE][ICON_RES_STONE]). 더 큰 미래에 대한 비전은 노동자들이 이 웅장한 프로젝트를 완료하도록 동기를 부여하며(+20%[ICON_WORKER]), 게다가 지역 자원인 [COLOR_GREY]제비갈매기 알[ENDCOLOR]은 장기적인 번영을 알리는 신의 선의의 표시입니다(+1[ICON_RES_TERN]; +5%[ICON_PEACE][ICON_PEACE]).';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 개발된 자원: [ICON_RES_STONE].'||Text WHERE Tag ='TXT_KEY_BUILDING_AHU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_AHU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Falun Mine
INSERT INTO Language_ko_KR 
			(Tag,								Text) 
VALUES		('TXT_KEY_BUILDING_FALUN',			'팔룬 광산'),
			('TXT_KEY_WONDER_FALUN_QUOTE',		'[NEWLINE]"채굴은 수색 섬멸 작전과 같다."[NEWLINE] - 스튜어트 유달[NEWLINE]'),
			('TXT_KEY_BUILDING_FALUN_PEDIA',	'스웨덴 달라르나주에 위치한 팔룬 광산은 유럽에서 가장 중요한 구리 광산 중 하나였으며 천 년 넘게 스웨덴 경제와 산업 발전의 중심 역할을 했습니다. 이 지역의 채굴은 10세기 초부터 시작되었지만 광산은 17세기와 18세기에 정점에 달해 주화, 포병 및 다양한 산업 응용 분야에 필수적인 구리를 유럽 대부분에 공급했습니다. 팔룬 광산에서 창출된 부는 스웨덴 제국의 부상에 크게 기여하여 전략적 경제 및 정치적 자산이 되었습니다. 1992년까지 다양한 용량으로 운영되다가 채굴이 중단되어 후세를 위해 보존된 역사적, 산업적 유산을 남겼습니다. [NEWLINE][NEWLINE]팔룬 광산 단지에는 거대한 노천 채굴장, 지하 터널, 제련 시설, 노동자 주택, 행정 구조물과 같은 광범위한 지상 건물이 포함됩니다. 그레이트 핏(Great Pit)으로 알려진 독특한 붉은 광미는 풍경을 지배하며 수 세기에 걸친 추출을 시각적으로 상기시켜 줍니다. 이 유적지에는 또한 광산 생활의 사회적, 기술적 역사를 보여주는 잘 보존된 광부 오두막, 예배당, 산업 인프라가 있습니다. 오늘날 팔룬 광산은 역사적, 기술적, 문화적 중요성을 인정받아 유네스코 세계문화유산으로 지정되었으며 산업 유산, 공학, 유럽 채굴 역사에 관심이 있는 방문객을 끌어들이고 있습니다.'),
			('TXT_KEY_BUILDING_FALUN_HELP',		'');
			
INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_FALUN_HELP_CUT', '[COLOR_YIELD_FOOD]팔룬[ENDCOLOR]의 [COLOR_CITY_BROWN]광산[ENDCOLOR] 단지는 모든 중요한 투자를 가능하게 합니다(+1[ICON_GOLD]/[COLOR_CITY_BROWN]타일[ENDCOLOR]; +1[ICON_GOLD]). 공학 인력의 빠른 급증(2%[ICON_GREAT_ENGINEER] 진행도/[COLOR_YIELD_FOOD]중세 (또는 이후) 건물[ENDCOLOR] 건설)과 군사 전문가(+1[ICON_GREAT_GENERAL]; [COLOR_YIELD_GOLD]무료 [ICON_GREAT_GENERAL][ENDCOLOR])는 여러 전선에서의 성공을 보장합니다. 최근 발견된 [COLOR_GREY]구리[ENDCOLOR] 매장지(2[ICON_RES_COPPER] 생성; +1[ICON_GOLD], +1[ICON_GOLDEN_AGE]/[ICON_RES_COPPER])는 세계의 리더십을 쉽게 살 수 있습니다.';
				
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]언덕[ENDCOLOR]; 시설: [COLOR_CYAN]광산 2개[ENDCOLOR]; 도시: [COLOR_CYAN][ICON_RES_COPPER]를 위한 공간[ENDCOLOR]; 지도: [COLOR_CYAN]지도상의 [ICON_RES_COPPER][ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_FALUN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]언덕[ENDCOLOR]; 도시: [COLOR_CYAN][ICON_RES_COPPER]를 위한 공간[ENDCOLOR]; 지도: [COLOR_CYAN]지도상의 [ICON_RES_COPPER][ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_FALUN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Forge of Damascus
INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_DAMASCUS',			'다마스쿠스의 대장간'),
			('TXT_KEY_WONDER_DAMASCUS_QUOTE',		'[NEWLINE]"다마스쿠스 강철의 명성과 역사는 소총 총열을 자르거나 칼날에 떨어지는 머리카락을 자르는 능력과 같은 많은 전설을 낳았습니다. 제조 기술은 현대에도 아직 역설계되지 않았습니다."[NEWLINE] - 다마스쿠스 강철에 대한 전설에서[NEWLINE]'),
			('TXT_KEY_BUILDING_DAMASCUS_PEDIA',		'"다마스쿠스의 대장간"이라는 용어는 역사적으로 시리아 다마스쿠스에 위치한 유명한 강철 생산 및 칼날 단조 작업장을 말합니다. 이 대장간들은 독특한 물결무늬와 뛰어난 강도로 알려진 고탄소강인 다마스쿠스 강철을 생산하는 것으로 유명했습니다. 강철은 남인도에서 유래한 우츠 공정을 사용하여 만들어졌는데, 이는 도가니에서 철을 탄소가 풍부한 재료와 함께 녹이는 것을 포함했습니다. 그 결과 생성된 잉곳은 다마스쿠스를 포함한 중동 전역으로 거래되었으며, 그곳에서 숙련된 장인들이 검과 칼과 같은 무기로 단조했습니다. 이 칼날들은 날카로움, 탄력성, 표면의 독특한 패턴으로 전설적인 지위를 얻었습니다. [NEWLINE][NEWLINE]원래 다마스쿠스 강철 생산에 사용된 정확한 방법은 시간이 지남에 따라 사라졌지만, 현대 야금학 연구에 따르면 독특한 패턴은 강철의 탄소 나노튜브와 나노와이어의 존재 때문인 것으로 나타났습니다. 오늘날 "다마스쿠스 강철"이라는 용어는 종종 패턴 용접 강철을 설명하는 데 사용되는데, 이는 서로 다른 금속 층을 함께 단조하여 유사한 미적 패턴을 만드는 것입니다. 고대 다마스쿠스 대장간은 더 이상 운영되지 않지만, 그 장인 정신의 유산은 현대 대장장이 및 칼날 제작 기술에 계속 영향을 미치고 있습니다.'),
			('TXT_KEY_BUILDING_DAMASCUS_HELP',		''),
			('TXT_KEY_PROMOTION_DAMASCUS',			'다마스쿠스 강철'),
			('TXT_KEY_PROMOTION_DAMASCUS_HELP',		'+10%[ICON_STRENGTH]전투력.');
			
INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_DAMASCUS_HELP_CUT', '[COLOR_YIELD_FOOD]다마스쿠스의 대장간[ENDCOLOR]은 근접 무기를 걸작으로 바꾸는 비밀 단조 기술을 보유하고 있습니다([COLOR_WATER_TEXT]다마스쿠스 강철[ENDCOLOR]/[COLOR_YIELD_GOLD]근접 지상[ENDCOLOR]; [COLOR_CYAN]야금학[ENDCOLOR]: +3[ICON_PRODUCTION]). 생산력과 과학이 말 그대로 폭발하므로(+2[ICON_PRODUCTION]; +3[ICON_RESEARCH]; +2[ICON_GREAT_SCIENTIST]), 적보다 우위를 점하기 위해 사용 가능한 모든 [COLOR_GREY]철[ENDCOLOR] 매장지를 확보하는 것을 잊지 마십시오(+1[ICON_PRODUCTION], +1[ICON_RESEARCH]/[ICON_RES_IRON][ICON_RES_IRON]).';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]권위 완성[ENDCOLOR]; 지물: [COLOR_CYAN]담수[ENDCOLOR]; 개발된 자원: [ICON_RES_IRON].'||Text WHERE Tag ='TXT_KEY_BUILDING_DAMASCUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]권위 완성[ENDCOLOR]; 개발된 자원: [ICON_RES_IRON].'||Text WHERE Tag ='TXT_KEY_BUILDING_DAMASCUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Knights Hospitaller (Holy)
INSERT INTO Language_ko_KR 
			(Tag,										Text) 
VALUES		('TXT_KEY_BUILDING_HOSPITALLER',			'구호기사단'),
			('TXT_KEY_WONDER_HOSPITALLER_QUOTE',		'[NEWLINE]"신앙을 위하여, 인류 봉사를 위하여."[NEWLINE] - 구호기사단의 모토[NEWLINE]'),
			('TXT_KEY_BUILDING_HOSPITALLER_PEDIA',		'예루살렘의 성 요한 병원 기사단, 흔히 구호기사단으로 알려진 이 기사단은 성지의 병들고 가난하고 부상당한 순례자들을 돌보기 위해 11세기에 설립된 중세 가톨릭 군사 기사단이었습니다. 1023년경 아말피 상인 그룹에 의해 설립된 이 기사단은 처음에는 예루살렘에서 세례 요한에게 바쳐진 병원을 운영하는 데 중점을 두었습니다. 제1차 십자군 원정과 예루살렘 왕국 수립 이후, 기사단은 순례자와 십자군이 획득한 영토를 보호하기 위한 군사적 기능을 얻었습니다. 구호기사단은 중세 시대에 가장 강력하고 영향력 있는 군사 기사단 중 하나가 되었으며, 성지와 지중해의 기독교 영토 방어에 중요한 역할을 했습니다. [NEWLINE][NEWLINE]수 세기 동안 기사단은 변화하는 정치 및 군사 환경에 적응했습니다. 1187년 예루살렘이 함락된 후 기사단은 본부를 여러 번 옮겨 결국 1309년 로도스섬에, 나중에는 1530년 몰타에 정착하여 몰타 기사단으로 알려지게 되었습니다. 이 섬들에 주둔하면서 오스만 제국의 확장과 해적 행위에 맞서 요새화하여 강력한 해군 세력이 되었습니다. 1798년 나폴레옹에게 몰타를 잃은 후에도 기사단은 자선 활동을 계속했습니다. 오늘날 몰타 기사단은 전 세계적으로 활동하는 인도주의 단체로 남아 있으며, 병자와 가난한 사람들을 돕는 창립 임무를 계속하는 동시에 수많은 국가와 외교 관계를 맺고 있는 주권 실체로서의 지위를 유지하고 있습니다.'),
			('TXT_KEY_BUILDING_HOSPITALLER_HELP',		'[ICON_BULLET][COLOR_YIELD_FOOD]사원[ENDCOLOR]이 있는 모든 도시의 [COLOR_YIELD_GOLD]지상 군사 유닛[ENDCOLOR] 주둔군은 행동에 관계없이 5 HP를 회복합니다.');

UPDATE Language_ko_KR SET Text = '[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_HOSPITALLER_HELP';

INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_BUILDING_HOSPITALLER_HELP_CUT', '[COLOR_YIELD_FOOD]구호기사단[ENDCOLOR]은 파괴적인 전쟁 중에도 사람들을 돕기 위해 만들어졌습니다(5 전역 HP 회복/[COLOR_YIELD_GOLD]지상 주둔군[ENDCOLOR]/[COLOR_YIELD_FOOD]사원[ENDCOLOR]이 있는 도시)(+50 HP). 시대는 변하고 있지만, 이 [COLOR_YIELD_FOOD]기사단[ENDCOLOR]([COLOR_YIELD_FOOD]무료[ENDCOLOR])의 기사들은 항상 신에게 헌신하면서도(+2[ICON_PEACE]) 비밀리에 자신들을 위해 무언가를 챙기려 합니다(5%[ICON_PEACE][ICON_PEACE] -> [ICON_GOLD]). 그리고 조류가 그들을 어디로 밀어내든(+2[ICON_GREAT_ADMIRAL]), 그들은 힘든 노력의 결실을 파괴하려는 통치자들에게 저항합니다.');
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_YIELD_PRODUCTION]성도[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_HOSPITALLER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '특수: [COLOR_YIELD_PRODUCTION]성도[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_HOSPITALLER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Shwedagon Pagoda
INSERT INTO Language_ko_KR 
			(Tag,												Text)
VALUES		('TXT_KEY_BUILDING_SHWEDAGON',						'쉐다곤 파고다'),
			('TXT_KEY_WONDER_SHWEDAGON_QUOTE',					'[NEWLINE]"사람과 영혼 사이에 소란이 있었고, 맹인은 사물을 보았고, 귀머거리는 소리를 들었다. 땅이 흔들리고 번개가 번쩍였으며 보석이 무릎 깊이까지 비처럼 쏟아졌고, 히말라야의 모든 나무는 제철이 아님에도 꽃과 열매를 맺었다."[NEWLINE] - 오칼라파 왕[NEWLINE]'),
			('TXT_KEY_BUILDING_SHWEDAGON_PEDIA',				'미얀마 양곤에 위치한 쉐다곤 파야(쉐다곤 파고다 또는 대룡탑이라고도 함)는 미얀마에서 가장 신성한 불교 유적지 중 하나이자 버마 종교적 헌신의 상징입니다. 정확한 건립 날짜는 불확실하지만 그 기원은 2,500년 전으로 거슬러 올라가 세계에서 가장 오래된 탑 중 하나로 여겨집니다. 전설에 따르면 이 탑에는 고타마 붓다의 머리카락 여덟 가닥을 포함하여 이전 네 부처의 유물이 안치되어 있어 불교도들의 주요 순례지가 되었습니다. 수 세기 동안 쉐다곤 파고다는 특히 버마 왕들의 후원 아래 여러 차례 복원 및 확장을 거쳤으며 침략, 지진, 식민지 시대를 견뎌내며 영적, 문화적 중요성을 유지했습니다. [NEWLINE][NEWLINE]건축학적으로 쉐다곤 파고다는 약 99미터 높이로 솟아 있으며 수천 개의 금판으로 장식되고 다이아몬드, 루비 및 기타 보석으로 박힌 놀라운 금박 스투파로 유명합니다. 단지에는 중앙 스투파 주변에 수많은 작은 사원, 성소, 종, 조각상이 배치되어 있으며 숭배자들을 위해 정교하게 장식된 테라스와 안뜰이 있습니다. 황금색 외관은 낮에는 햇빛을 반사하고 밤에는 화려하게 빛나며 놀라운 시각적 존재감을 선사합니다. 오늘날 쉐다곤 파고다는 예배, 명상, 문화 모임의 활발한 중심지로 남아 있으며 현지 신도와 국제 방문객 모두를 끌어들이는 동시에 미얀마의 지속적인 불교 유산을 상징합니다.'),
			('TXT_KEY_BUILDING_SHWEDAGON_HELP',					''),
			('TXT_KEY_THEMING_BONUS_SHWEDAGON_KALPA',			'현재 겁의 이전 네 부처의 유물'),
			('TXT_KEY_THEMING_BONUS_SHWEDAGON_CONSECUTIVE',		'가장 최근 시대의 유물'),
			('TXT_KEY_THEMING_BONUS_SHWEDAGON_PLAYERS',			'다른 창작자의 유물'),
			('TXT_KEY_THEMING_BONUS_SHWEDAGON_ARTIFACTS',		'유물 모음'),
			('TXT_KEY_THEMING_BONUS_SHWEDAGON_HELP',			'보너스를 극대화하려면 모든 걸작 슬롯을 연속된 시대에 다른 플레이어가 만든 유물로 채우십시오.'),
			('TXT_KEY_PROMOTION_HIDDEN_ARTIFACTS',				'외교관 여권'),
			('TXT_KEY_PROMOTION_HIDDEN_ARTIFACTS_HELP',			'+20% [ICON_WORKER] 작업 속도. 유닛이 [COLOR:255:230:85:255]국경 개방 협정 없이 적 영토에 진입할 수 있습니다(발굴 불가)[ENDCOLOR].');
			
INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_SHWEDAGON_HELP_CUT', '[COLOR_YIELD_FOOD]쉐다곤 파고다[ENDCOLOR]는 예술성과 관련된 모든 측면에 완전히 집중하여(+2[ICON_CULTURE]; +2[ICON_GREAT_ARTIST]; +2[ICON_PEACE]/[ICON_GREAT_ARTIST][ICON_GREAT_ARTIST]) 컬렉션의 전체 가치를 높입니다(+2[ICON_GOLD]; +1[ICON_GOLD]/[ICON_GREAT_WORK][ICON_GREAT_WORK]). 이제 최근 발견을 발표할 수 있는 멋진 전시회를 열 수 있습니다(테마 보너스 시 4[ICON_GW_ART]: [ICON_GOLD], [ICON_CULTURE], [ICON_PEACE], [ICON_TOURISM]). 또한 새로운 능력을 사용하여 숨겨진 유물을 찾으십시오([COLOR_WATER_TEXT]외교관 여권[ENDCOLOR]/[COLOR_YIELD_GOLD]고고학자[ENDCOLOR]). 당신의 도시를 빛나게 하십시오!';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]전통 완성[ENDCOLOR]; 타일: [COLOR_CYAN]언덕[ENDCOLOR]; 지물: [COLOR_CYAN]담수[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_SHWEDAGON_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]전통 완성[ENDCOLOR]; 지물: [COLOR_CYAN]담수[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_SHWEDAGON_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Mont-Saint-Michel
INSERT INTO Language_ko_KR 
			(Tag,								Text) 
VALUES		('TXT_KEY_BUILDING_MICHEL',			'몽생미셸'),
			('TXT_KEY_WONDER_MICHEL_QUOTE',		'[NEWLINE]"몽생미셸에서 교회와 국가, 영혼과 육체, 신과 인간은 모두 하나이며, 모든 것의 임무는 각자의 방식으로 싸우거나 서로를 위해 경계를 서는 것이다."[NEWLINE] - 헨리 애덤스[NEWLINE]'),
			('TXT_KEY_BUILDING_MICHEL_PEDIA',	'프랑스 노르망디 해안에 위치한 몽생미셸은 중세 건축과 전략적 중요성으로 유명한 역사적인 섬 코뮌입니다. 그 기원은 8세기로 거슬러 올라가는데, 아브랑슈의 주교 오베르가 대천사 미카엘의 환상을 본 후 바위 섬에 작은 교회를 지었다고 합니다. 수 세기 동안 이 유적지는 요새화된 수도원과 수도원 단지로 발전하여 순례의 중심지이자 백년 전쟁을 포함한 분쟁 기간 동안 요새가 되었습니다. 조수 간만의 차가 큰 바다에서 극적으로 솟아오른 몽생미셸의 독특한 위치는 방어 능력을 향상시키는 동시에 영적, 문화적 회복력의 상징으로 자리 잡았습니다. [NEWLINE][NEWLINE]건축학적으로 몽생미셸은 로마네스크 양식과 고딕 양식을 결합하고 있으며, 수도원은 정상에 자리 잡고 있고 방어벽과 좁고 구불구불한 거리가 마을로 이어져 있습니다. 수도원은 인상적인 아치형 천장, 회랑, 예배당을 특징으로 하며, 섬의 가파르고 바위가 많은 지형에 적응한 중세 건축가들의 독창성을 보여줍니다. 주변 마을에는 중세 분위기를 자아내는 석조 주택, 상점, 성벽이 있습니다. 오늘날 몽생미셸은 유네스코 세계문화유산이자 주요 관광 명소로, 눈에 띄는 건축물과 역사적 중요성뿐만 아니라 조수가 섬 주변의 풍경을 극적으로 변화시키는 숨 막히는 자연환경으로도 유명합니다.'),
			('TXT_KEY_BUILDING_MICHEL_HELP',	'');
			
INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_MICHEL_HELP_CUT', '외로운 [COLOR_YIELD_FOOD]몽생미셸[ENDCOLOR]은 취약한 도시를 요새로 바꾸어(+10[ICON_STRENGTH]; +50 HP) 영혼에 집중하고 미래를 꿈꿀 수 있는 곳으로 만듭니다(+4[ICON_PEACE]/5 [ICON_CITIZEN]; +1[ICON_GOLDEN_AGE]). 독특한 조건 덕분에 원래 종류의 [COLOR_GREY]양[ENDCOLOR]을 사육할 수 있으며(1[ICON_RES_SHEEP] 생성; +1[ICON_FOOD], +1[ICON_GOLD]/[ICON_RES_SHEEP][ICON_RES_SHEEP]; +1[ICON_FOOD]), 특히 조수를 예측하는 고급 기술을 발견하면 더욱 그렇습니다(+1[ICON_GOLD]; [COLOR_CYAN]컴퓨터[ENDCOLOR]: +1[ICON_PRODUCTION], +3[ICON_GOLD], +5[ICON_TOURISM]).';
				
UPDATE Language_ko_KR SET Text = '지형: 다음 중 하나: [COLOR_CYAN]1타일 섬 (본토에서 2타일 거리)[ENDCOLOR] 또는 [COLOR_CYAN]5타일의 물로 둘러싸인 본토 반도의 끝[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_MICHEL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]1타일 섬[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_MICHEL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);		
----------------------------------------------------
-- Buyuk Han
INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_BUYUK_HAN',			'부유크 한'),
			('TXT_KEY_WONDER_BUYUK_HAN_QUOTE',		'[NEWLINE]"무역에는 우정이 없다."[NEWLINE] - 코넬리어스 밴더빌트[NEWLINE]'),
			('TXT_KEY_BUILDING_BUYUK_HAN_PEDIA',	'키프로스 니코시아에 위치한 부유크 한은 오스만 제국이 키프로스를 정복한 직후인 1572년에 지어진 섬에서 가장 훌륭한 오스만 시대 카라반사라이 중 하나입니다. 이곳은 상인과 여행자를 위한 여관 역할을 하며 안전한 공동 환경에서 숙박, 마구간, 저장 시설을 제공했습니다. 수 세기 동안 부유크 한은 19세기 영국 식민 통치 기간 동안 감옥을 포함하여 다양한 역할을 수행하며 키프로스의 변화하는 정치 및 사회 역사를 반영했습니다. 그 지속적인 존재는 섬의 오스만 과거와 동부 지중해의 상업 및 문화 교차로로서의 역할을 엿볼 수 있게 해줍니다. [NEWLINE][NEWLINE]건축학적으로 부유크 한은 중앙의 개방된 안뜰이 아치형 방과 아케이드 갤러리의 2개 층으로 둘러싸인 직사각형 평면을 특징으로 합니다. 1층에는 상점과 마구간이 있었고 2층에는 돌계단으로 접근할 수 있는 객실이 있었습니다. 내부 안뜰에는 모스크와 작은 분수가 있어 공동체적이고 영적인 중심점을 제공합니다. 구조물의 두꺼운 돌벽, 뾰족한 아치, 장식 요소는 기능적이면서도 우아한 오스만 건축 양식을 보여줍니다. 오늘날 부유크 한은 복원되어 장인 상점, 카페, 갤러리가 있는 문화 센터로 용도가 변경되어 역사적, 건축적 중요성을 보존하면서 현지인과 방문객 모두에게 활기찬 허브가 되었습니다.'),
			('TXT_KEY_BUILDING_BUYUK_HAN_HELP',		'');
			
INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_BUYUK_HAN_HELP_CUT', '아름다운 [COLOR_YIELD_FOOD]대상 숙소[ENDCOLOR]([COLOR_YIELD_FOOD]무료[ENDCOLOR])인 [COLOR_YIELD_FOOD]부유크 한[ENDCOLOR]은 광범위한 무역 기회와 사색의 장소를 제공합니다(+1[ICON_FOOD]; +1[ICON_PEACE]). 이제 새로운 [COLOR_YIELD_GOLD]무료 대상[ENDCOLOR]을 고용하거나, 새로운 도구를 사용하여 [COLOR_CITY_BROWN]마을[ENDCOLOR]의 장인 정신을 향상시키거나(+2[ICON_PRODUCTION]/[COLOR_CITY_BROWN]제국 내 타일[ENDCOLOR]; +1[ICON_PRODUCTION]) 새로운 무역 파트너를 찾을 수 있습니다(+2[ICON_GOLD]; [COLOR_CYAN]기업[ENDCOLOR]: +2[ICON_PRODUCTION], +3[ICON_GOLD]).';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]진보 완성[ENDCOLOR]; 타일: [COLOR_CYAN]평지[ENDCOLOR]; 지형: [COLOR_CYAN]해안[ENDCOLOR]; 시설: [COLOR_CYAN]마을[ENDCOLOR]'||Text WHERE Tag ='TXT_KEY_BUILDING_BUYUK_HAN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]진보 완성[ENDCOLOR]; 타일: [COLOR_CYAN]평지[ENDCOLOR]; 지형: [COLOR_CYAN]해안[ENDCOLOR]'||Text WHERE Tag ='TXT_KEY_BUILDING_BUYUK_HAN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);		
----------------------------------------------------
-- Itsukushima Shrine
INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_ITSUKUSHIMA',		'이쓰쿠시마 신사'),
			('TXT_KEY_WONDER_ITSUKUSHIMA_QUOTE',	'[NEWLINE]"신앙은 신사에 매달리는 것이 아니라 마음의 끝없는 순례이다."[NEWLINE] - 아브라함 조슈아 헤셸[NEWLINE]'),
			('TXT_KEY_BUILDING_ITSUKUSHIMA_PEDIA',	'일본 히로시마현 이쓰쿠시마섬(일명 미야지마)에 위치한 이쓰쿠시마 신사는 일본에서 가장 상징적인 신사 중 하나입니다. 그 기원은 6세기로 거슬러 올라가지만 현재의 구조물은 주로 12세기 후반 강력한 군사 지도자인 다이라노 기요모리의 후원으로 건설되었습니다. 이 신사는 바다의 신 스사노오의 세 딸을 기리기 위해 지어졌으며, 섬의 역사적인 해양 숭배와 신토 영적 전통을 반영합니다. 조수 간만의 차가 있는 물 위에 독특하게 자리 잡은 것은 신과 자연계의 연결을 상징하며 순례자와 관광객 모두에게 종교적 장소이자 문화적 랜드마크가 되었습니다. [NEWLINE][NEWLINE]건축학적으로 이쓰쿠시마 신사는 만조 때 물 위로 솟아오르는 것처럼 보이는 "떠 있는" 도리이 문으로 유명하여 놀라운 시각적 효과를 연출합니다. 주요 신사 건물은 만 위에 기둥을 세워 지어졌으며 나무 산책로 네트워크로 연결되어 있으며 선명한 주홍색 기둥, 우아하게 구부러진 지붕, 신토 건축의 특징인 복잡한 장식 세부 사항이 특징입니다. 레이아웃은 주변의 숲이 우거진 언덕 및 해안 풍경과 조화롭게 통합되어 균형과 자연에 대한 경외심을 강조합니다. 유네스코 세계문화유산으로 지정된 이쓰쿠시마 신사는 여전히 활발한 예배 장소이며, 영적 분위기, 역사적 중요성, 놀라운 시각적 아름다움을 경험하기 위해 전 세계 방문객을 끌어들이고 있습니다.'),
			('TXT_KEY_BUILDING_ITSUKUSHIMA_HELP',	'[ICON_BULLET]모든 해안 도시에서 새로운 타일 획득에 필요한 [ICON_CULTURE] 문화 비용이 50% 감소합니다.');

UPDATE Language_ko_KR SET Text = '[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_ITSUKUSHIMA_HELP';
			
INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_ITSUKUSHIMA_HELP_CUT', '[COLOR_YIELD_FOOD]이쓰쿠시마 신사[ENDCOLOR]는 주변 해양 요소에서 신비한 에너지를 모읍니다: [COLOR_CITY_BLUE]대양[ENDCOLOR](+1[ICON_PEACE]/[COLOR_CITY_BLUE]타일[ENDCOLOR]), [COLOR_GREY]해양 사치 자원[ENDCOLOR](+2[ICON_PEACE]/[COLOR_GREY]타일[ENDCOLOR]), [COLOR_CITY_BROWN]어선[ENDCOLOR](+1[ICON_CULTURE]/[COLOR_CITY_BROWN]타일[ENDCOLOR]), 그리고 모든 [COLOR_CITY_GREEN]산호섬[ENDCOLOR](+1[ICON_FOOD], +1[ICON_CULTURE], +1[ICON_PEACE]/[COLOR_CITY_GREEN]제국 내 타일[ENDCOLOR]). 당신의 문화는 곧 폭발할 것이며, 덕분에 해안 도시의 확장은 상상했던 것보다 훨씬 빠를 것입니다(+2[ICON_CULTURE]; +50%[ICON_CULTURE_LOCAL] 국경 확장/해안 도시).';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 개발된 자원: [ICON_RES_CORAL]/[ICON_RES_CRAB]/[ICON_RES_PEARLS]/[ICON_RES_WHALE].'||Text WHERE Tag ='TXT_KEY_BUILDING_ITSUKUSHIMA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_ITSUKUSHIMA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Qalhat
INSERT INTO Language_ko_KR 
			(Tag,								Text) 
VALUES		('TXT_KEY_BUILDING_QALHAT',			'칼하트'),
			('TXT_KEY_WONDER_QALHAT_QUOTE',		'[NEWLINE]"항구는 매우 크고 좋으며 인도에서 온 상품을 실은 수많은 배가 자주 드나듭니다. 이 도시에서 향신료와 기타 상품이 내륙의 도시와 마을로 분배됩니다. 그들은 또한 이곳에서 인도로 좋은 아라비아 말을 많이 수출합니다."[NEWLINE] - 마르코 폴로[NEWLINE]'),
			('TXT_KEY_BUILDING_QALHAT_PEDIA',	'오만 동부 해안 수르 시 근처에 위치한 칼하트는 한때 번성했던 항구 도시이자 13세기와 14세기 인도양 무역 네트워크의 핵심 허브였습니다. 그 기원은 훨씬 더 거슬러 올라가지만 호르무즈 왕국의 통치하에 명성을 얻어 상업, 문화, 종교의 중심지 역할을 했습니다. 칼하트는 아프리카, 인도 및 그 너머의 상인들과 향신료, 직물, 귀금속과 같은 상품을 거래하는 것으로 유명했습니다. 이 도시는 16세기 지진과 포르투갈 군대의 공격으로 쇠퇴하여 결국 버려졌지만, 그 폐허는 국제적인 무역 중심지로서의 역사적 중요성에 대한 증거로 남아 있습니다. [NEWLINE][NEWLINE]칼하트의 고고학 유적지에는 돔형 구조로 이슬람 건축의 영향을 보여주는 비비 마리암의 무덤을 포함하여 석조 건물, 방어벽, 모스크의 잔해들이 있습니다. 레이아웃은 거리, 시장, 종교 센터가 있는 잘 계획된 도시를 나타내며 상업 및 영적 허브로서의 이중 역할을 반영합니다. 발굴 결과 수입 도자기, 동전 및 기타 유물이 발견되어 광범위한 무역 관계를 입증했습니다. 오늘날 칼하트는 역사적, 건축적, 문화적 중요성을 인정받아 유네스코 세계문화유산으로 지정되었으며 중세 오만의 해상 무역 네트워크와 도시 발전에 대한 통찰력을 제공합니다.'),
			('TXT_KEY_BUILDING_QALHAT_HELP',	'[ICON_BULLET]제국 내 다른 주요 문명에서 오거나 가는 [ICON_INTERNATIONAL_TRADE] 교역로마다 +3 [ICON_CULTURE].');

UPDATE Language_ko_KR SET Text = '[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_QALHAT_HELP';

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_QALHAT_HELP_CUT', '많은 선원에 따르면 [COLOR_YIELD_FOOD]칼하트[ENDCOLOR]는 독특한 보급품을 찾는 해상 무역을 강력하게 지원합니다(+1[ICON_INTERNATIONAL_TRADE]; +2[ICON_GOLD]/[ICON_RES_HORSE]; +50%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]화물선[ENDCOLOR]). 이곳은 전 세계의 상인들이 만나 상품을 교환하는 멋진 장소입니다(+3[ICON_GOLD]; 국제 [ICON_CARGO_SHIP]: +1[ICON_GOLD]). 외국 문화를 배우고 추가 이익을 얻기 위해 이곳에서 시간을 보내는 것이 좋습니다(+3[ICON_CULTURE]/주요 문명과의 [ICON_CARGO_SHIP][ICON_CARGO_SHIP]).';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 개발된 자원: [ICON_RES_HORSE].'||Text WHERE Tag ='TXT_KEY_BUILDING_QALHAT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 개발된 자원: [ICON_RES_HORSE].'||Text WHERE Tag ='TXT_KEY_BUILDING_QALHAT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Krak des Chevaliers
INSERT INTO Language_ko_KR 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_CHEVALIERS',			'크라크 데 슈발리에'),
			('TXT_KEY_WONDER_CHEVALIERS_QUOTE',		'[NEWLINE]"나는 당신의 왕이 가장 명예롭고 용감한 사람이라는 것을 오래전부터 알고 있었지만, 그는 신중하지 못합니다."[NEWLINE] - 살라딘이 사자심왕 리처드 1세에게[NEWLINE]'),
			('TXT_KEY_BUILDING_CHEVALIERS_PEDIA',	'시리아 서부 홈스 근처에 위치한 크라크 데 슈발리에는 세계에서 가장 잘 보존되고 중요한 십자군 성 중 하나입니다. 그 기원은 11세기로 거슬러 올라가는데, 당시 이 지역은 지역 무슬림 통치자들에 의해 처음 요새화되었지만 12세기와 13세기 구호기사단 하에서 명성을 얻었습니다. 이 성은 십자군 전쟁 동안 전략적 군사 요새 역할을 했으며 지중해 연안과 시리아 내륙 사이의 주요 경로를 통제했습니다. 강력한 방어 시설과 전략적 위치는 십자군 군사력과 중세 요새 공학의 상징이 되었으며, 이 지역의 기독교 세력과 무슬림 세력 간의 갈등에서 중추적인 역할을 했습니다. [NEWLINE][NEWLINE]건축학적으로 크라크 데 슈발리에는 동심원 디자인, 두꺼운 돌벽, 거대한 탑, 화살 구멍, 마시쿨리, 요새화된 문과 같은 잘 계획된 방어 기능이 특징입니다. 내부 안뜰에는 거주 공간, 예배당, 창고, 저수조가 있어 군사 기지이자 자급자족 요새로서의 성의 기능을 반영합니다. 거대한 벽과 지휘하는 언덕 위 위치 덕분에 방어자들은 장기간의 포위를 견딜 수 있었으며, 이는 진보된 중세 군사 공학을 보여줍니다. 오늘날 크라크 데 슈발리에는 유네스코 세계문화유산이자 주요 관광 및 학술 목적지로, 뛰어난 보존 상태, 역사적 중요성, 십자군 건축 및 군사적 독창성에 대한 증거로 찬사를 받고 있습니다.'),
			('TXT_KEY_BUILDING_CHEVALIERS_HELP',	'[ICON_BULLET]다른 모든 [COLOR_POSITIVE_TEXT]비해안[ENDCOLOR] 도시는 +1 [ICON_PEACE] 신앙, +5 [ICON_STRENGTH] 도시 방어력 및 +1 [ICON_SILVER_FIST] 군사 유닛 보급 한도를 얻습니다.');

UPDATE Language_ko_KR SET Text = '[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_CHEVALIERS_HELP';

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_CHEVALIERS_HELP_CUT', '작은 고원 꼭대기에 있는 성인 [COLOR_YIELD_FOOD]크라크 데 슈발리에[ENDCOLOR]는 방어하기에 완벽한 장소(20[ICON_STRENGTH])이며 또 다른 장기 캠페인을 계획하기에 좋습니다(+2[ICON_FOOD]; +1[ICON_PEACE]). 공성 부대의 동원 증가(+20%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]기마[ENDCOLOR], [COLOR_YIELD_GOLD]공성[ENDCOLOR]), 훌륭한 리더십(+1[ICON_GREAT_GENERAL]; [COLOR_YIELD_GOLD]무료 [ICON_GREAT_GENERAL][ENDCOLOR]), 내륙 도시의 관리 개선(+1[ICON_PEACE], +5[ICON_STRENGTH], +1[ICON_SILVER_FIST]/다른 모든 비해안 도시)은 영광의 시작일 뿐입니다.';
				
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]언덕[ENDCOLOR]; 지물: [COLOR_NEGATIVE_TEXT]물[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_CHEVALIERS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_ko_KR SET Text = '지형: [COLOR_NEGATIVE_TEXT]해안[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_CHEVALIERS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);		

UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]권위 완성[ENDCOLOR]; '||Text WHERE Tag ='TXT_KEY_BUILDING_CHEVALIERS_HELP' AND EXISTS (SELECT * FROM Community WHERE Type='MW-SETTING-POLICIES' AND Value=1);
----------------------------------------------------
-- Tlachihualtepetl (Holy)
INSERT INTO Language_ko_KR 
			(Tag,										Text) 
VALUES		('TXT_KEY_BUILDING_TLACHIHUALTEPETL',		'틀라치왈테페틀'),
			('TXT_KEY_POLICY_TLACHIHUALTEPETL_DUMMY',	'틀라치왈테페틀'),
			('TXT_KEY_WONDER_TLACHIHUALTEPETL_QUOTE',	'[NEWLINE]"케찰코아틀은 인간 본성의 이중성에 대한 원초적인 아이디어이다. 뱀은 하늘과 땅의 화신이다. 그것은 여러 면에서 사람들을 두렵게 한다."[NEWLINE] - 로버트 그레이엄[NEWLINE]'),
			('TXT_KEY_BUILDING_TLACHIHUALTEPETL_PEDIA',	'촐룰라의 대피라미드로도 알려진 틀라치왈테페틀은 멕시코 촐룰라에 위치한 고대 메소아메리카 구조물입니다. 부피 기준으로 세계에서 가장 큰 피라미드로 간주되며 기자의 대피라미드보다 더 큽니다. 기원전 3세기경 촐룰라 원주민에 의해 여러 단계로 건설되기 시작한 이 피라미드는 수 세기에 걸쳐 확장되어 밑변이 약 450 x 450미터(1,480 x 1,480피트), 높이가 약 66미터(217피트)에 달했습니다. 나후아틀어로 "인공 산"을 의미하는 틀라치왈테페틀이라는 이름은 각 문명이 이전 문명 위에 건설하면서 층을 이룬 구조를 반영합니다. 피라미드는 케찰코아틀 신에게 바쳐진 중요한 종교 및 의식 중심지였으며 콜럼버스 이전 문화에서 중요한 역할을 했습니다. [NEWLINE][NEWLINE]16세기 스페인 정복 당시 피라미드는 대부분 버려지고 잡초가 무성하여 자연 언덕처럼 보였습니다. 그 아래에 구조물이 있다는 것을 몰랐던 스페인 사람들은 꼭대기에 치유의 성모 교회를 지어 토착 신앙에 대한 기독교의 강요를 상징했습니다. 오늘날 틀라치왈테페틀은 중요한 고고학 유적지로, 피라미드 내부에서 발굴된 터널 네트워크가 층층이 쌓인 역사를 드러냅니다. 이곳은 히스패닉 이전과 식민지 유산이 혼합된 중요한 문화 및 관광 명소로 남아 있으며 고대 메소아메리카 문명의 건축 및 종교적 전통에 대한 증거로 서 있습니다.'),
			('TXT_KEY_BUILDING_TLACHIHUALTEPETL_HELP',	'[ICON_BULLET]도시가 [COLOR_YIELD_FOOD]건물[ENDCOLOR]을 건설할 때 시대에 비례하여 5 [ICON_GOLDEN_AGE] 황금기 점수를 얻습니다.');

UPDATE Language_ko_KR SET Text = '[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_TLACHIHUALTEPETL_HELP';
	
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_BUILDING_TLACHIHUALTEPETL_HELP_CUT', '여러 시대에 걸쳐 서로 다른 문명에 의해 차곡차곡 건설된 [COLOR_YIELD_FOOD]틀라치왈테페틀[ENDCOLOR](누적 +5[ICON_PEACE], 모든 [ICON_GOLDEN_AGE] 시작 시 +1[ICON_GREAT_GENERAL])은 강력한 케찰코아틀에 대한 헌신을 나타냅니다(+1[ICON_PEACE]; 전역 [COLOR_YIELD_FOOD]건물[ENDCOLOR] 건설 시 5[ICON_GOLDEN_AGE]). 이 기념비적인 [COLOR_YIELD_FOOD]테오칼리[ENDCOLOR]([COLOR_YIELD_FOOD]무료[ENDCOLOR])는 더 발전된 문명조차 놀라게 하며(+3[ICON_CULTURE]; +1[ICON_GREAT_ENGINEER]), 그들은 평화적으로 또는 무력으로 그것을 차지하여 신성모독으로 바꾸고 싶어 합니다.');
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_YIELD_PRODUCTION]성도[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_TLACHIHUALTEPETL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '특수: [COLOR_YIELD_PRODUCTION]성도[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_TLACHIHUALTEPETL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Sankore Madrasah
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_WONDER_MOSQUE_OF_DJENNE_HELP_CUT',	'[COLOR_YIELD_FOOD]상코레 마드라사[ENDCOLOR]는 처음에는 모스크(+1[ICON_PEACE])였으나 마침내 마드라사(+1[ICON_RESEARCH])로 개조되었으며, 전성기에는 두 영역을 성공적으로 결합했습니다(+1[ICON_GREAT_SCIENTIST]). 훌륭한 [COLOR_YIELD_FOOD]대학[ENDCOLOR]([COLOR_YIELD_FOOD]무료[ENDCOLOR])일 뿐만 아니라 험준한 지형이 훌륭한 시설을 건설하는 데 장애가 되지 않음을 보여주며(+1[ICON_CULTURE]), 영향력으로 가장 중요한 연구 프로젝트를 촉진하는 먼 나라의 귀족들을 끌어들입니다(50[ICON_RESEARCH]/[ICON_GREAT_PEOPLE]).');
				
UPDATE Language_ko_KR SET Text = '상코레 마드라사' WHERE Tag ='TXT_KEY_BUILDING_MOSQUE_OF_DJENNE';	

UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]전통 완성[ENDCOLOR]; 지물: [COLOR_NEGATIVE_TEXT]물[ENDCOLOR]; 건물: [COLOR_CYAN]도서관[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_MOSQUE_OF_DJENNE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]전통 완성[ENDCOLOR]; 지물: [COLOR_NEGATIVE_TEXT]물[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_MOSQUE_OF_DJENNE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Hagia Sophia
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_WONDER_HAGIA_SOPHIA_HELP_CUT', '[COLOR_YIELD_FOOD]하기아 소피아[ENDCOLOR]와 그 격동의 역사는 건축 양식의 혼합에서 볼 수 있습니다(+2[ICON_CULTURE]). 처음에는 기념비적인 [COLOR_YIELD_FOOD]교회[ENDCOLOR]([COLOR_YIELD_FOOD]무료[ENDCOLOR])로 건설되었지만, 몇 차례의 파괴적인 전쟁 끝에 마침내 다른 종교의 신자들에게 점령당했으며(+1[ICON_PEACE]; +25%[ICON_MISSIONARY] 힘), 이는 수년 전 수많은 예언에 의해 예언되었습니다([COLOR_YIELD_GOLD]무료 [ICON_PROPHET][ENDCOLOR]).');

UPDATE Language_ko_KR SET Text = REPLACE(Text, 'Procopius, De Aedificis', '"건축에 대하여", 프로코피우스') WHERE Tag ='TXT_KEY_WONDER_HAGIASOPHIA_QUOTE';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_YIELD_PRODUCTION]성도[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_HAGIA_SOPHIA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_YIELD_PRODUCTION]성도[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_HAGIA_SOPHIA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Borobudur
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_WONDER_BOROBUDUR_HELP_CUT', '[COLOR_YIELD_FOOD]보로부두르[ENDCOLOR]는 거대한 [COLOR_YIELD_FOOD]스투파[ENDCOLOR]([COLOR_YIELD_FOOD]무료[ENDCOLOR])로, 이 거대한 단지의 다른 건물들과 함께(+1[ICON_CULTURE]) 전쟁 없는 세상에 대한 낙관적인 비전을 나타냅니다(+5[ICON_PEACE]). 그 추종자들은 평화의 민족이며, 야심 차고 카리스마 넘치는 전도사들을 통해 말씀을 적극적으로 전파합니다(2 [COLOR_YIELD_GOLD]무료 선교사[ENDCOLOR]; +1[ICON_MISSIONARY] 전파/[COLOR_YIELD_GOLD]선교사[ENDCOLOR], [COLOR_YIELD_GOLD]위대한 선지자[ENDCOLOR]).');
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_YIELD_PRODUCTION]성도[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_BOROBUDUR_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_YIELD_PRODUCTION]성도[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_BOROBUDUR_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Alhambra
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_WONDER_ALHAMBRA_HELP_CUT',	'[COLOR_YIELD_FOOD]알람브라[ENDCOLOR]는 완전히 반대되는 두 가지 스타일과 문화의 건축적 융합이며(+1[ICON_CULTURE]; +10%[ICON_CULTURE]) 마침내 우리가 [COLOR_YIELD_FOOD]성[ENDCOLOR]([COLOR_YIELD_FOOD]무료[ENDCOLOR])이라고 부를 수 있는 형태로 형성되었습니다. 문화적 중요성 외에도, 이곳은 다양한 훈련 방법이 결합되어 완전히 독특하고 대체 불가능한 전투 대형을 만드는 곳입니다([COLOR_WATER_TEXT]히네테[ENDCOLOR]/[COLOR_YIELD_GOLD]기마 근접[ENDCOLOR]).');
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]권위 완성[ENDCOLOR]; 타일: [COLOR_CYAN]언덕[ENDCOLOR]; 지물: [COLOR_CYAN]숲[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_ALHAMBRA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]권위 완성[ENDCOLOR]; 지물: [COLOR_CYAN]숲[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_ALHAMBRA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Machu Picchu
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_WONDER_MACHU_PICHU_HELP_CUT', '새로운 도시가 [COLOR_CITY_BLUE]산[ENDCOLOR]에 건설된다면(+1[ICON_FOOD], +1[ICON_PRODUCTION], +1[ICON_CULTURE], +1[ICON_PEACE]/[COLOR_CITY_BLUE]타일[ENDCOLOR]), [COLOR_YIELD_FOOD]마추픽추[ENDCOLOR]는 당신에게 완벽한 선택입니다. 그렇게 높은 곳에 사는 것은 신들과 훨씬 더 가까워지게 하지만(+2[ICON_PEACE]), 다른 정착지와의 접촉을 유지하기 위한 구체적인 해결책이 필요하며(+15%[ICON_GOLD]/[ICON_CONNECTED][ICON_CONNECTED], [ICON_INDUSTRIAL_CONNECTED][ICON_INDUSTRIAL_CONNECTED]) 당신을 이 수익성 있는 땅의 독점적인 통치자로 만듭니다(+5[ICON_GOLD]; +1[ICON_GREAT_MERCHANT]).');
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]산 2개 (범위 3)[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_MACHU_PICHU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]산 (범위 2)[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_MACHU_PICHU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Forbidden City
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_WONDER_FORBIDDEN_PALACE_HELP_CUT',	'이전 문명의 폐허 위에 건설된 [COLOR_YIELD_FOOD]자금성[ENDCOLOR]은 당신의 확장이 얼마나 성공적인지, 그리고 인프라를 얼마나 빨리 재건하고 새로 획득한 땅에서 이익을 얻을 수 있는지 보여줍니다(-15%[ICON_GOLD][ICON_GOLD] 구매 비용). 도시 개발에 대한 지출 증가는 시민들의 호감을 쉽게 살 수 있으며(-1[ICON_HAPPINESS_3] 빈곤) 이는 정말 빠르게 큰 보상으로 돌아올 수 있습니다(+5[ICON_GOLD]).');

UPDATE Language_ko_KR SET Text = '자금성' WHERE Tag ='TXT_KEY_BUILDING_FORBIDDEN_PALACE';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]진보 완성[ENDCOLOR]; [COLOR_YIELD_GOLD]수도[ENDCOLOR]; 건물: [COLOR_CYAN]성벽[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_FORBIDDEN_PALACE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]진보 완성[ENDCOLOR]; [COLOR_YIELD_GOLD]수도[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_FORBIDDEN_PALACE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Rila Monastery (former VP Karlstejn Castle)
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_BUILDING_KARLSTEJN_HELP_CUT', '도처에 자연으로 둘러싸인 [COLOR_YIELD_FOOD]릴라 수도원[ENDCOLOR]은 가장 중요한 [COLOR_YIELD_FOOD]수도원[ENDCOLOR]([COLOR_YIELD_FOOD]무료[ENDCOLOR]) 중 하나일 뿐만 아니라 다양한 종교의 추종자들에게 어필하는 거대한 관광 명소이기도 합니다(+3[ICON_CULTURE]). 막대한 기부금으로 빠른 확장이 가능해져 이제 수십 명의 수도사를 수용할 수 있으며(+4[ICON_PEACE]), 그들의 헌신과 기도는 국교에 대한 수용을 바꿀 수 있습니다(-5%[ICON_RELIGION] 신자/[ICON_RELIGION] 개혁 교리).');
				
UPDATE Language_ko_KR SET Text = '릴라 수도원' WHERE Tag ='TXT_KEY_BUILDING_KARLSTEJN';
UPDATE Language_ko_KR SET Text = '[NEWLINE]"사랑이 없지만 사랑을 갖고 싶다면 사랑의 일을 하십시오. 그러면 주님께서 당신의 소망과 노력을 보시고 당신의 마음에 사랑을 넣어 주실 것입니다."[NEWLINE] - 옵티나의 성 암브로시우스[NEWLINE]' WHERE Tag ='TXT_KEY_BUILDING_KARLSTEJN_QUOTE';
UPDATE Language_ko_KR SET Text = 'TODO'||Text WHERE Tag ='TXT_KEY_BUILDING_KARLSTEJN_TEXT';				

UPDATE Language_ko_KR SET Text = '특수: [COLOR_YIELD_PRODUCTION]성도[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_KARLSTEJN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_YIELD_PRODUCTION]성도[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_KARLSTEJN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Notre Dame
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_BUILDING_NOTRE_DAME_HELP_CUT',	'[COLOR_YIELD_FOOD]노트르담[ENDCOLOR]은 영광스러운 사원(+5[ICON_PEACE]; +60%[ICON_PEACE] 압력/당신 종교의 모든 도시)일 뿐만 아니라 수백만 명이 방문하는 상징이기도 합니다(+4[ICON_CULTURE]; [ICON_PEACE] 신앙 구매의 5%[ICON_CULTURE]). 그들 대부분은 귀중한 유물을 보고 싶어 하지만(테마 보너스 시 2[ICON_GW_ART]: [ICON_PEACE], [ICON_GOLDEN_AGE]), 내부에 감동하거나 숭고한 분위기를 느끼고 싶어 하는 사람들도 있습니다(+1[ICON_HAPPINESS_1]). 그리고 모든 것이 작은 상업 정착지에서 시작되었다는 것을 아는 사람은 아무도 없습니다(+1[ICON_GREAT_MERCHANT]).');
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]전통 완성[ENDCOLOR]; 타일: [COLOR_CYAN]평지[ENDCOLOR]; 지물: [COLOR_CYAN]강[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_NOTRE_DAME_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]전통 완성[ENDCOLOR]; 지물: [COLOR_CYAN]강[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_NOTRE_DAME_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
----------------------------------------------------
-- Ait Benhaddou
INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_BENHADDOU',			'아이트 벤하두'), /*Aït Benhaddou*/
			('TXT_KEY_WONDER_BENHADDOU_QUOTE',		'[NEWLINE]"즐겁지 아니한가?"[NEWLINE] - 막시무스 데시무스 메리디우스[NEWLINE]'),
			('TXT_KEY_BUILDING_BENHADDOU_PEDIA',	'모로코 하이 아틀라스 산맥 기슭에 위치한 아이트 벤하두는 적어도 17세기로 거슬러 올라가는 역사적인 크사르(요새화된 마을)이지만 일부 소식통은 더 이른 기원을 제안합니다. 이곳은 사하라 횡단 무역로의 중요한 정거장이었으며 마라케시와 남쪽 사막 지역을 오가는 상인들의 허브 역할을 했습니다. 이 마을은 모로코 남부의 전형적인 흙 건축의 대표적인 예이며 사하라 이전 공동체의 사회 및 경제 조직을 반영합니다. 수 세기 동안 아이트 벤하두는 주거 정착지이자 습격으로부터 주민과 대상을 보호하는 요새가 되었습니다. [NEWLINE][NEWLINE]건축학적으로 아이트 벤하두는 진흙 벽돌, 흙, 돌로 지어졌으며 집, 곡창, 모서리 탑이 있는 방어벽이 밀집된 형태를 이루고 있습니다. 좁은 골목길과 공동 공간이 크사르를 통과하여 언덕 위의 성채로 이어져 방어와 주변 풍경을 감시할 수 있습니다. 건물의 균일한 적갈색 색조는 건조한 환경과 조화롭게 어우러져 눈에 띄는 시각적 효과를 연출합니다. 오늘날 아이트 벤하두는 유네스코 세계문화유산이자 관광객과 영화 제작자들에게 인기 있는 목적지로, 건축적 아름다움뿐만 아니라 모로코의 문화 및 역사적 유산의 살아있는 예로서 찬사를 받고 있습니다. 모로코 건축의 전시물일 뿐만 아니라 아이트 벤하두는 ''나사렛 예수'', ''미이라'', ''글래디에이터'', ''페르시아의 왕자''를 포함한 여러 영화에도 등장했습니다.'),
			('TXT_KEY_BUILDING_BENHADDOU_HELP',		'');
			
INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_BENHADDOU_HELP_CUT', '거대한 [COLOR_YIELD_FOOD]아이트 벤하두[ENDCOLOR] [COLOR_CITY_BROWN]마을[ENDCOLOR]은 환상적인 관광 명소이며(+3[ICON_GOLD], +3[ICON_TOURISM]/[COLOR_CITY_BROWN]타일[ENDCOLOR]) 수많은 영화 프로젝트에 이상적인 배경임이 입증되었습니다(+2[ICON_CULTURE]; [COLOR_CYAN]라디오[ENDCOLOR]: +4[ICON_TOURISM]). 이 척박한 정착지는 인근 [COLOR_CITY_GREEN]강[ENDCOLOR]에 크게 의존하며(+1[ICON_FOOD]/[COLOR_CITY_GREEN]타일[ENDCOLOR]; +2[ICON_FOOD]) 현재 무역 네트워크를 도달할 수 없는 사막 모래 위로 확장합니다(+2[ICON_GOLD]; +1[ICON_INTERNATIONAL_TRADE]).';
				
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]언덕[ENDCOLOR]; 지형: [COLOR_CYAN]사막[ENDCOLOR]; 시설: [COLOR_CYAN]마을[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_BENHADDOU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]언덕[ENDCOLOR]; 지형: [COLOR_CYAN]사막[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_BENHADDOU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Kilwa Kisiwani
INSERT INTO Language_ko_KR 
			(Tag,										Text) 
VALUES		('TXT_KEY_BUILDING_KILWA_KISIWANI',			'킬와 키시와니'),
			('TXT_KEY_WONDER_KILWA_KISIWANI_QUOTE',		'[NEWLINE]"킬와는 세계에서 가장 아름답게 지어진 도시 중 하나입니다. 그곳의 집들은 전적으로 나무로 만들어졌고 지붕은 밧줄 풀로 만들어졌으며 비가 아주 세차게 내립니다."[NEWLINE] - 이븐 바투타[NEWLINE]'),
			('TXT_KEY_BUILDING_KILWA_KISIWANI_PEDIA',	'현재 탄자니아 남부 해안에 위치한 킬와 키시와니는 서기 9세기에서 16세기 사이에 번성했던 스와힐리 해안의 가장 중요한 도시 국가 중 하나였습니다. 페르시아와 아랍 상인들이 세운 킬와는 동아프리카와 아라비아, 인도, 중국을 연결하는 해상 무역의 주요 허브가 되었습니다. 도시의 부는 금, 상아 및 기타 아프리카 상품의 수출에서 파생되었으며 동아프리카 해안을 따라 이슬람을 전파하는 데 중요한 역할을 했습니다. 유럽 탐험가들과 포르투갈 군대가 16세기에 도착하여 도시가 점차 쇠퇴했지만, 그 폐허는 지역 무역과 문화 교류에서 역사적 중요성에 대한 강력한 증거로 남아 있습니다. [NEWLINE][NEWLINE]킬와 키시와니의 고고학적 유적에는 모스크, 궁전, 산호석 주택, 요새가 포함되어 있어 도시의 정교함과 도시 계획을 보여줍니다. 동아프리카에서 가장 오래되고 가장 큰 모스크 중 하나인 킬와 대모스크와 후수니 쿠브와 궁전은 산호석 사용과 복잡한 석조 조각을 포함한 고급 건축 기술을 강조합니다. 거리, 시장, 주거 지역이 있는 도시의 배치는 번성하는 상업 및 종교 중심지로서의 역할을 반영합니다. 오늘날 킬와 키시와니는 역사적, 문화적, 건축적 가치를 인정받아 유네스코 세계문화유산으로 지정되어 스와힐리 문명과 인도양 세계 전역의 연결에 대한 통찰력을 제공합니다.'),
			('TXT_KEY_BUILDING_KILWA_KISIWANI_HELP',	'');
			
INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_KILWA_KISIWANI_HELP_CUT', '[COLOR_YIELD_FOOD]킬와 키시와니[ENDCOLOR] 무역 허브(+2[ICON_INTERNATIONAL_TRADE])는 희귀 사치품의 추가 사본을 획득합니다(+1 [ICON_RES_JEWELRY]; +1 [ICON_RES_PORCELAIN]). 이 거대한 프로젝트의 조정은 빠른 이익을 제공하고(+2[ICON_GOLD]) 잠재적으로 쓸모없는 여분의 지역 자원의 가치를 높이는 새로운 무역 지역을 찾을 수 있게 해줍니다(+1[ICON_PRODUCTION]/모든 [COLOR_GREY]전략 자원[ENDCOLOR]; +1[ICON_GOLD]/모든 [COLOR_GREY]사치 자원[ENDCOLOR]).';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]외교 완성[ENDCOLOR]; 지형: [COLOR_CYAN]해안[ENDCOLOR]; 시설: [COLOR_CYAN]2 (광산 + 야영지)[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_KILWA_KISIWANI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]외교 완성[ENDCOLOR]; 지형: [COLOR_CYAN]해안[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_KILWA_KISIWANI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- St. Peter's Basilica
INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_ST_PETERS',			'성 베드로 대성당'),
			('TXT_KEY_WONDER_ST_PETERS_QUOTE',		'[NEWLINE]"바위 더미는 한 사람이 그것을 묵상하고 그 안에 대성당의 이미지를 품는 순간 바위 더미가 아니게 된다."[NEWLINE] - 앙투안 드 생텍쥐페리[NEWLINE]'),
			('TXT_KEY_BUILDING_ST_PETERS_PEDIA',	'바티칸 시국에 있는 성 베드로 대성당(Basilica Papale di San Pietro in Vaticano)은 후기 르네상스 교회로, 세계의 어떤 기독교 교회보다 내부가 큽니다. 서기 64년 사도 베드로의 매장지로 추정되는 곳으로, 몇 년 후 그곳에 성소가 지어졌습니다. 성소를 대체하여 "구" 성 베드로 대성당의 건설은 서기 319년에서 333년 사이에 콘스탄티누스 황제에 의해 시작되었습니다.[NEWLINE][NEWLINE]  수 세기 동안 심각하게 파손된 후, 교황 율리우스 2세는 1505년에 오래된 교회를 철거하고 기념비적인 구조물로 대체하기로 결정했습니다. 이 건설 프로젝트는 역대 교황과 건축가들에 의해 향후 120년 동안 이어졌습니다. 거대한 프로젝트에 자금을 대기 위해 많은 교황이 면죄부의 대량 판매를 승인했으며, 이는 부분적으로 마틴 루터의 개신교 운동으로 이어졌습니다.[NEWLINE][NEWLINE]  미켈란젤로, 라파엘로, 브라만테, 베르니니 등 르네상스의 주요 인물들의 작품으로 이 교회는 이제 서구 문명의 위대한 보물 중 하나로 서 있습니다.'),
			('TXT_KEY_BUILDING_ST_PETERS_HELP',		'');
			
INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_ST_PETERS_HELP_CUT', '압도적인 [COLOR_YIELD_FOOD]성 베드로 대성당[ENDCOLOR]은 세계에서 가장 강력한 [COLOR_YIELD_FOOD]대성당[ENDCOLOR]([COLOR_YIELD_FOOD]무료[ENDCOLOR])으로, 종교적 힘(+4[ICON_PEACE]; 3 [COLOR_YIELD_GOLD]무료 이단심문관[ENDCOLOR])뿐만 아니라 종종 과소평가되는 외교적 힘(+1[ICON_DIPLOMAT] 연맹 투표/시작 시 6[ICON_CITY_STATE]마다)을 제공하는 교황의 보좌를 보유하고 있습니다. 올바른 줄을 당기고 설득력 있는 연설을 작성하면 시민들 사이에서 통치에 대한 수용을 쉽게 개선할 수 있습니다(+1[ICON_CULTURE]; +1[ICON_HAPPINESS_1]/모든 [COLOR_YIELD_FOOD]종교 건물[ENDCOLOR]).';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_YIELD_PRODUCTION]성도[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_ST_PETERS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_ko_KR SET Text = '특수: [COLOR_YIELD_PRODUCTION]성도[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_ST_PETERS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);		
----------------------------------------------------
-- Golden Pavilion
INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_KINKAKU_JI',			'금각사'), /*Rokuon-ji, Kinkaku-ji*/
			('TXT_KEY_WONDER_KINKAKU_JI_QUOTE',		'[NEWLINE]"책 속에는 황금의 집이 있다."[NEWLINE] - 중국 속담[NEWLINE]'),
			('TXT_KEY_BUILDING_KINKAKU_JI_PEDIA',	'금각사라고도 알려진 킨카쿠지는 일본 교토에 위치한 선불교 사원으로 1397년으로 거슬러 올라갑니다. 원래 쇼군 아시카가 요시미츠의 은퇴 별장으로 지어졌으나 나중에 그의 유언에 따라 사원으로 개조되었습니다. 킨카쿠지는 수 세기 동안 여러 번 불탔으며, 가장 주목할 만한 것은 1950년이었고 1955년에 재건되었습니다. 이 사원은 종교적 중요성뿐만 아니라 무로마치 시대의 조화, 우아함, 자연과의 연결이라는 이상을 나타내는 문화적, 미적 중요성으로도 유명합니다. 유네스코 세계문화유산으로 지정되었으며 일본에서 가장 많이 방문하고 사진이 찍히는 랜드마크 중 하나입니다. [NEWLINE][NEWLINE]건축학적으로 킨카쿠지는 고요한 연못 옆에 세워진 3층 누각으로, 위쪽 2개 층은 전체가 금박으로 덮여 있어 주변 물에 아름답게 반사됩니다. 각 층은 독특한 스타일로 설계되었습니다. 1층은 귀족의 신덴 스타일, 2층은 사무라이 주택의 부케 스타일, 3층은 중국 선종 불당 스타일입니다. 사원은 자연 경관과 인간의 디자인을 통합하여 균형과 평온함을 강조하는 세심하게 관리된 정원으로 둘러싸여 있습니다. 오늘날 킨카쿠지는 교토 문화유산의 상징으로 계속 사용되고 있으며, 놀라운 아름다움과 역사적 중요성을 감상하기 위해 전 세계에서 방문객을 끌어들이고 있습니다.'),
			('TXT_KEY_BUILDING_KINKAKU_JI_HELP',	'');
			
INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_KINKAKU_JI_HELP_CUT', '숨 막히는 [COLOR_YIELD_FOOD]금각사[ENDCOLOR]는 자연과 강한 유대감을 가지고 있습니다. 맑고 푸른 [COLOR_CITY_GREEN]호수[ENDCOLOR](+1[ICON_FOOD], +1[ICON_CULTURE], +2[ICON_PEACE]/[COLOR_CITY_GREEN]제국 내 타일[ENDCOLOR]), 야생의 뚫을 수 없는 [COLOR_CITY_GREEN]숲[ENDCOLOR]과 [COLOR_CITY_GREEN]정글[ENDCOLOR](+1[ICON_CULTURE], +1[ICON_PEACE]/[COLOR_CITY_GREEN]타일[ENDCOLOR]), 그리고 넓게 굽이치는 [COLOR_CITY_GREEN]강[ENDCOLOR](+1[ICON_FOOD]/[COLOR_CITY_GREEN]타일[ENDCOLOR])이 있습니다. 이 아름다운 정원은 여가 시간을 보내고 답을 찾는 많은 작가들에게 평화롭고 영감을 주는 분위기를 조성합니다(+2[ICON_CULTURE]; 1[ICON_GW_WRITING])(+3[ICON_PEACE]).';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]충성 완성[ENDCOLOR]; 지물: [COLOR_CYAN]담수[ENDCOLOR], [COLOR_CYAN]숲[ENDCOLOR]/[COLOR_CYAN]정글[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_KINKAKU_JI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]충성 완성[ENDCOLOR]; 지물: [COLOR_CYAN]담수[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_KINKAKU_JI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);		
----------------------------------------------------
-- Marae Arahurahu
INSERT INTO Language_ko_KR 
			(Tag,											Text) 
VALUES		('TXT_KEY_BUILDING_MARAE_ARAHURAHU',			'마라에 아라후라후'),
			('TXT_KEY_WONDER_MARAE_ARAHURAHU_QUOTE',		'[NEWLINE]"앞에는 지도자, 뒤에는 일꾼."[NEWLINE] - 마오리 속담[NEWLINE]'),
			('TXT_KEY_BUILDING_MARAE_ARAHURAHU_PEDIA',		'프랑스령 폴리네시아 무레아섬의 파페토아이 근처에 위치한 마라에 아라후라후는 이 지역에서 가장 잘 보존된 마라에(전통 폴리네시아 성지) 중 하나입니다. 17세기에 건설된 이곳은 지역 타히티 공동체의 종교 및 의식 중심지 역할을 했으며, 추장과 사제들이 의식을 거행하고 제물을 바치고 중요한 사회적, 영적 기능을 수행했습니다. 마라에 아라후라후는 유럽 이전 타히티 사회에 대한 통찰력을 제공하며 폴리네시아 공동체의 문화적, 종교적, 정치적 조직을 강조합니다. 보존 상태 덕분에 학자와 방문객은 유럽 접촉 이전 섬 주민들의 영적, 사회적 삶을 더 잘 이해할 수 있습니다. [NEWLINE][NEWLINE]이 유적지는 전통적인 마라에 건축의 특징인 직립 현무암으로 인클로저를 형성하는 직사각형 석조 플랫폼으로 구성되어 있습니다. 레이아웃에는 의식과 모임에 사용되었던 개방형 중앙 안뜰이 포함되어 있으며 신성한 공간을 표시하는 신중하게 배치된 돌로 둘러싸여 있습니다. 건설 및 정렬의 정밀함은 영적 중요성과 건축 기술을 모두 반영합니다. 오늘날 마라에 아라후라후는 문화유산으로 유지되고 있으며, 방문객들에게 폴리네시아 전통, 종교 관행, 이러한 신성한 공동 공간을 만드는 데 관련된 예술성에 대해 교육하는 가이드 투어와 해설 전시를 제공합니다.'),
			('TXT_KEY_BUILDING_MARAE_ARAHURAHU_HELP',		'[ICON_BULLET]모든 [COLOR_YIELD_GOLD]원거리 지상 유닛[ENDCOLOR]은 [COLOR_POSITIVE_TEXT]마라에[ENDCOLOR] 승급을 얻습니다.[NEWLINE][ICON_BULLET]모든 [COLOR_YIELD_GOLD]지상 유닛[ENDCOLOR]은 [COLOR_POSITIVE_TEXT]아라후라후[ENDCOLOR] 승급을 얻습니다.'),
			('TXT_KEY_THEMING_BONUS_MARAE_ARAHURAHU',		'전쟁 전 사기 진작 노래'),
			('TXT_KEY_THEMING_BONUS_MARAE_ARAHURAHU_HELP',	'보너스를 극대화하려면 모든 걸작 슬롯을 당신이 만든 음악으로 채우십시오.'),
			('TXT_KEY_PROMOTION_MARAE',						'마라에'),
			('TXT_KEY_PROMOTION_MARAE_HELP',				'+10%[ICON_RANGE_STRENGTH]원거리 전투력.'),
			('TXT_KEY_PROMOTION_ARAHURAHU',					'아라후라후'),
			('TXT_KEY_PROMOTION_ARAHURAHU_HELP',			'[COLOR:255:230:85:255]처치 시[ENDCOLOR] 적 유닛 [ICON_STRENGTH]전투력의 120%를 [ICON_CULTURE] 문화로 획득.');

UPDATE Language_ko_KR SET Text = '[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_MARAE_ARAHURAHU_HELP';

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_MARAE_ARAHURAHU_HELP_CUT', '[COLOR_YIELD_FOOD]마라에 아라후라후[ENDCOLOR]는 시민들에게 전통 춤(+1[ICON_GREAT_MUSICIAN]; 테마 보너스 시 2[ICON_GW_MUSIC]: [ICON_FOOD], [ICON_CULTURE])을 실제 전투와 연결하는 방법(+15 경험치/내부 [ICON_GREAT_WORK]/[COLOR_YIELD_GOLD]지상[ENDCOLOR], [COLOR_YIELD_GOLD]해상[ENDCOLOR])과 이 전쟁 기술을 사용하여 적보다 우위를 점하는 방법을 가르칩니다(+1[ICON_GREAT_ADMIRAL]; [COLOR_WATER_TEXT]마라에[ENDCOLOR]/[COLOR_YIELD_GOLD]원거리 지상[ENDCOLOR]). 이 의식은 전사들에게 추가적인 동기를 부여하므로 전투 결과에 관계없이 보상을 받습니다([COLOR_WATER_TEXT]아라후라후[ENDCOLOR]/[COLOR_YIELD_GOLD]군사 지상[ENDCOLOR]; 10[ICON_PEACE]/사망).';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]초원[ENDCOLOR], [COLOR_CYAN]해안[ENDCOLOR]; 건물: [COLOR_CYAN]정원[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_MARAE_ARAHURAHU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_MARAE_ARAHURAHU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);		

UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]예술 완성[ENDCOLOR]; '||Text WHERE Tag ='TXT_KEY_BUILDING_MARAE_ARAHURAHU_HELP' AND EXISTS (SELECT * FROM Community WHERE Type='MW-SETTING-POLICIES' AND Value=1);
----------------------------------------------------
-- Harmandir Sahib (Holy)
INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_HARMANDIR',			'하 황금 사원'),
			('TXT_KEY_WONDER_HARMANDIR_QUOTE',		'[NEWLINE]"평화를 주는 자는 영원히 행복하다."[NEWLINE] - 스리 구루 그란트 사히브[NEWLINE]'),
			('TXT_KEY_BUILDING_HARMANDIR_PEDIA',	'황금 사원으로도 알려진 하르만디르 사히브는 인도 펀자브주 암리차르에 위치한 시크교의 가장 신성한 성지입니다. 1581년 제4대 시크교 구루인 구루 람 다스에 의해 설립되었으며 1604년 그의 후계자인 구루 아르잔 데브에 의해 완공되었습니다. 이 사원은 카스트나 종교에 관계없이 모두에게 열려 있는 영적 예배 장소로 지어졌습니다. 구루 아르잔 데브는 시크교의 중심 경전인 구루 그란트 사히브를 사원 내부에 안치하여 시크교 신앙의 영적, 문화적 심장부로 만들었습니다. 수 세기 동안 사원은 공격을 견뎌냈고 여러 차례 재건되었으며, 19세기 초 마하라자 란지트 싱의 금도금 개조를 포함하여 상징적인 모습을 갖게 되었습니다. [NEWLINE][NEWLINE]황금 사원은 힌두교와 이슬람 양식을 독특한 시크교 정체성과 혼합한 놀라운 건축 걸작입니다. 암리트 사로바르(불멸의 연못)로 둘러싸인 사원의 반짝이는 금으로 덮인 외관과 대리석 상감은 숨 막히는 장관을 연출합니다. 개방성과 포용성을 상징하는 4개의 입구가 있으며, 구루 그란트 사히브의 암송이 계속되는 성소로 이어지는 둑길이 있습니다. 사원 단지에는 또한 시크교 종교 권위의 최고 자리인 아칼 타크트와 매일 수천 명에게 식사를 제공하는 세계 최대의 무료 공동 주방(랑가르)이 있습니다. 하르만디르 사히브는 시크교의 헌신, 회복력, 보편적 형제애의 상징으로 남아 있습니다.'),
			('TXT_KEY_BUILDING_HARMANDIR_HELP',		'');

INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_BUILDING_HARMANDIR_HELP_CUT', '[COLOR_YIELD_FOOD]하르만디르 사히브[ENDCOLOR]의 열린 4개의 문은 인종이나 종교에 관계없이 모든 사람을 환영합니다(-2[ICON_HAPPINESS_3][ICON_HAPPINESS_3] 종교적 불안). 각 방문객은 잘 먹고([ICON_PEACE]를 산출하는 모든 [COLOR_YIELD_FOOD]건물[ENDCOLOR]에서 +2[ICON_FOOD]) 부상당한 경우 적절한 치료를 받게 됩니다(10 HP 회복/[COLOR_YIELD_GOLD]지상 주둔군[ENDCOLOR]). 시크교는 평화로운 신앙이므로(+2[ICON_PEACE]), 이 놀라운 [COLOR_YIELD_FOOD]구르드와라[ENDCOLOR]를 방문하여 개종하고 다른 사람의 관점을 바꿀 수도 있습니다.');
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_YIELD_PRODUCTION]성도[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_HARMANDIR_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '특수: [COLOR_YIELD_PRODUCTION]성도[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_HARMANDIR_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Old Bridge
INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_OLD_BRIDGE',			'오래된 다리'),
			('TXT_KEY_WONDER_OLD_BRIDGE_QUOTE',		'[NEWLINE]"난민은 살아남은 사람이며 미래를 창조할 수 있는 사람이다."[NEWLINE] - 아멜라 콜루더[NEWLINE]'),
			('TXT_KEY_BUILDING_OLD_BRIDGE_PEDIA',	'보스니아 헤르체고비나 모스타르의 오래된 다리(스타리 모스트)는 원래 16세기에 오스만 건축가 미마르 하이루딘의 지휘하에 지어진 역사적인 오스만 시대 다리입니다. 술탄 슐레이만 대제 통치 기간인 1566년에 완공된 이 다리는 네레트바강을 가로질러 모스타르의 두 부분을 연결하여 무역과 통신을 촉진하는 동시에 도시의 문화적, 경제적 중요성을 상징하도록 설계되었습니다. 수 세기 동안 스타리 모스트는 오스만 공학 기술과 이 지역의 다양한 공동체 공존에 대한 증거로 서 있었습니다. 비극적으로 1993년 보스니아 전쟁 중에 파괴되었지만, 원래 기술과 재료를 사용하여 2004년에 재건이 완료되어 물리적 존재와 문화 간의 가교로서의 상징적 역할이 모두 회복되었습니다. [NEWLINE][NEWLINE]건축학적으로 오래된 다리는 높이 약 29미터, 길이 28미터의 우아한 단일 경간 석조 아치로, 정밀하게 절단된 석회암 블록으로 지지됩니다. 우아한 곡선과 단순하면서도 견고한 디자인은 당시의 진보된 공학 기술을 보여주며, 각 강둑의 요새화된 탑을 포함한 주변 오스만 시대 구조물은 역사적 배경을 보완합니다. 이 다리는 화해, 회복력, 문화유산의 상징이 되어 전 세계 방문객을 끌어들이고 있습니다. 오늘날 스타리 모스트는 유네스코 세계문화유산으로 지정되어 건축적 아름다움뿐만 아니라 복잡한 역사를 가진 지역에서 단결과 평화의 지속적인 표현으로 찬사를 받고 있습니다.'),
			('TXT_KEY_BUILDING_OLD_BRIDGE_HELP',	'');
			
INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_OLD_BRIDGE_HELP_CUT', '[COLOR_YIELD_FOOD]오래된 다리[ENDCOLOR]는 수많은 분쟁에 연루된 모든 사람의 이익을 위해 평화를 가져오겠다는 의지를 세계 지도자들에게 알리는 외침입니다(+2[ICON_DIPLOMAT] 연맹 투표; +1[ICON_HAPPINESS_1]). 외교적 힘과 알려진 모든 트릭을 사용하여 주저하는 국가들을 당신 편으로 끌어들이십시오([COLOR_YIELD_GOLD]무료 [ICON_DIPLOMAT][ENDCOLOR]; +2[ICON_DIPLOMAT]). 이 다리는 상징이나 멋진 건축물일 뿐만 아니라 명상을 위해 방문할 가치가 있는 장소이기도 합니다(+1[ICON_CULTURE])';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]외교 완성[ENDCOLOR]; 타일: [COLOR_CYAN]언덕[ENDCOLOR]; 지물: [COLOR_CYAN]강[ENDCOLOR]; 플레이어: [COLOR_CYAN]평화 상태[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_OLD_BRIDGE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]외교 완성[ENDCOLOR]; 타일: [COLOR_CYAN]언덕[ENDCOLOR]; 지물: [COLOR_CYAN]강[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_OLD_BRIDGE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);		
----------------------------------------------------
-- Meenakshi Temple
INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_MEENAKSHI',			'미낙시 사원'),
			('TXT_KEY_WONDER_MEENAKSHI_QUOTE',		'[NEWLINE]"우리는 데비 미낙시에게 인사합니다. 천만 개의 태양처럼 빛나고 팔찌와 화환으로 장식된 그녀... 상서로운 그녀, 존재를 구현하는 그녀. 자비가 바다와 같은 당신에게 항상 절합니다."[NEWLINE] - 아디 샹카라[NEWLINE]'),
			('TXT_KEY_BUILDING_MEENAKSHI_PEDIA',	'인도 타밀나두주 마두라이시에 위치한 미낙시 사원은 남인도에서 가장 중요하고 역사적으로 의미 있는 힌두교 사원 중 하나입니다. 그 기원은 2,500년 전으로 거슬러 올라가며, 16세기와 17세기 나약 왕조 통치 기간에 상당한 확장이 이루어졌습니다. 이 사원은 파르바티의 화신인 미낙시 여신과 시바의 형태인 그녀의 배우자 순다레스와라르 경에게 바쳐졌습니다. 종교 중심지이자 문화 허브 역할을 하는 이 사원은 의식, 축제, 순례의 중심지였으며 타밀나두의 풍부한 영적, 예술적 전통을 반영합니다. 역사적 중요성은 또한 정치, 상업, 학문의 주요 중심지로 사원을 중심으로 발전한 마두라이시와도 관련이 있습니다. [NEWLINE][NEWLINE]건축학적으로 미낙시 사원은 신, 여신, 신화 속 생물, 힌두 서사시 장면을 묘사한 수천 개의 다채로운 조각품으로 장식된 우뚝 솟은 고푸람(문탑)으로 유명합니다. 사원 단지는 14에이커에 달하며 기둥이 있는 홀, 신성한 탱크, 의식 및 문화 공연에 사용되는 정교하게 조각된 만다팜(파빌리온)이 특징입니다. 사원의 하이라이트인 천 개의 기둥 홀은 정교한 석조 조각을 보여주며 나약 시대의 장인 정신을 증명합니다. 오늘날 미낙시 사원은 활기찬 종교 및 문화 랜드마크로 남아 수백만 명의 신도와 관광객을 끌어들이고 남인도 사원 건축과 유산의 상징으로 서 있습니다.'),
			('TXT_KEY_BUILDING_MEENAKSHI_HELP',		'');
			
INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_MEENAKSHI_HELP_CUT', '다채로운 [COLOR_YIELD_FOOD]미낙시 사원[ENDCOLOR]은 방문하기로 결정한 모든 사람을 놀라게 합니다(+2[ICON_CULTURE]; +1[ICON_PEACE]/6 [ICON_CITIZEN][ICON_CITIZEN]). 중앙 [COLOR_YIELD_FOOD]만디르[ENDCOLOR]([COLOR_YIELD_FOOD]무료[ENDCOLOR])에는 파르바티 여신을 찬양하는 수많은 멋진 예술적 창조물이 포함되어 있으며(+1[ICON_FOOD]/[ICON_GREAT_WORK][ICON_GREAT_WORK]), 그녀의 큰 지원은 인근 [COLOR_CITY_GREEN]호수[ENDCOLOR]와 [COLOR_CITY_GREEN]강[ENDCOLOR]의 비옥함(+1[ICON_PEACE]/[COLOR_CITY_GREEN]타일[ENDCOLOR]; +1[ICON_FOOD])과 영혼의 영적 변화를 보장합니다. 세상을 구하기 위해 자신을 변화시키십시오(5%[ICON_PEACE] 신앙 구매 -> [ICON_FOOD]).';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_YIELD_PRODUCTION]성도[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_MEENAKSHI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_ko_KR SET Text = '특수: [COLOR_YIELD_PRODUCTION]성도[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_MEENAKSHI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);		
----------------------------------------------------
-- Peterhof Palace
INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_PETERHOF',			'페테르호프 궁전'),
			('TXT_KEY_WONDER_PETERHOF_QUOTE',		'[NEWLINE]"내 백성을 개혁하는 것은 나의 큰 소망이지만, 나 자신을 개혁할 수 없다는 것을 고백하는 것이 부끄럽다."[NEWLINE] - 표트르 대제[NEWLINE]'),
			('TXT_KEY_BUILDING_PETERHOF_PEDIA',		'러시아 상트페테르부르크 근처 핀란드만 남쪽 해안에 위치한 페테르호프 궁전은 종종 "러시아의 베르사유"라고 불리는 웅장한 궁전 단지입니다. 18세기 초 표트르 대제가 러시아가 유럽 강대국으로 부상한 상징이자 제국의 웅장함을 보여주는 쇼케이스로 의뢰했습니다. 서유럽의 궁전에 필적하기 위해 지어진 페테르호프는 러시아 차르의 여름 거주지이자 국가 의식, 축하 행사, 외교 리셉션 장소로 사용되었습니다. 시간이 지남에 따라 단지는 역대 통치자들에 의해 확장되어 정교한 정원, 분수, 파빌리온을 통합하여 정치적 야망과 바로크 건축 및 조경의 영향을 모두 반영했습니다. [NEWLINE][NEWLINE]페테르호프는 궁전에서 핀란드만으로 이어지는 테라스, 분수, 금박 조각상 시리즈인 그랜드 캐스케이드를 포함한 광범위한 정원과 놀라운 수경 시설로 유명합니다. 아래쪽 정원은 기하학적으로 배치된 화단, 작은 분수, 동굴을 특징으로 하며 위쪽 정원은 보다 형식적이고 대칭적인 레이아웃을 제공합니다. 대궁전 자체는 방문객에게 깊은 인상을 주기 위해 디자인된 화려한 인테리어, 금박 장식, 정교한 홀로 장식되어 있습니다. 오늘날 페테르호프는 유네스코 세계문화유산이자 주요 관광지로, 건축적 탁월함, 예술적 성취, 펌프 없이 분수를 작동시키는 수력 공학의 독창성으로 찬사를 받고 있습니다.'),
			('TXT_KEY_BUILDING_PETERHOF_HELP',		'');
			
INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_PETERHOF_HELP_CUT', '최근 프로젝트는 궁정에 부를 가져다주었고, [COLOR_YIELD_FOOD]페테르호프 궁전[ENDCOLOR]은 이 모든 사건을 반영합니다(+7[ICON_GOLDEN_AGE]; 20[ICON_HAPPINESS_1] 사랑해 주간 턴). 아름다운 인테리어와 무수한 분수로 가득 찬 뛰어난 정원은 많은 위엄 있는 귀족들을 궁전으로 끌어들이고(+10%[ICON_GREAT_PEOPLE]), 주변의 화려함은 시민들이 공동의 이익을 위해 더 열심히 일하도록 동기를 부여합니다([ICON_HAPPINESS_1] 사랑해 주간 동안 +15%[ICON_PRODUCTION], +15%[ICON_GOLD], +25%[ICON_GOLDEN_AGE]).';
				
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]평지[ENDCOLOR]; 지형: [COLOR_CYAN]해안[ENDCOLOR]; 개발된 자원 [ICON_RES_IRON].'||Text WHERE Tag ='TXT_KEY_BUILDING_PETERHOF_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_PETERHOF_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);		
----------------------------------------------------
-- Bakken
INSERT INTO Language_ko_KR 
			(Tag,								Text) 
VALUES		('TXT_KEY_BUILDING_BAKKEN',			'바켄'),
			('TXT_KEY_WONDER_BAKKEN_QUOTE',		'[NEWLINE]"오락은 우리가 생각할 필요가 없기 때문에 매력적이다. 그것은 우리의 생각을 괴롭힐 수 있는 두려움과 불안을 덜어준다."[NEWLINE] - 존 오트버그[NEWLINE]'),
			('TXT_KEY_BUILDING_BAKKEN_PEDIA',	'덴마크 코펜하겐 바로 북쪽 클람펜보르 근처에 위치한 바켄은 1583년으로 거슬러 올라가는 기원을 가진 세계에서 가장 오래된 운영 중인 놀이공원입니다. 치유력이 있다고 알려진 천연 샘으로 시작하여 지역 전역에서 방문객을 끌어들였습니다. 시간이 지남에 따라 공연, 게임, 놀이기구를 포함한 엔터테인먼트 및 레저 활동이 샘 주변에서 발전하여 점차 공식적인 놀이공원으로 발전했습니다. 바켄은 수 세기 동안 덴마크 문화에서 중심적인 역할을 해왔으며, 휴양, 사교 모임, 축제 행사를 찾는 현지인과 관광객에게 인기 있는 목적지 역할을 했습니다. [NEWLINE][NEWLINE]이 공원은 전통적인 명소와 현대적인 명소가 혼합되어 있으며 역사적인 목조 롤러코스터와 회전목마를 현대적인 놀이기구, 게임, 엔터테인먼트 장소와 결합했습니다. 매력적인 숲속 환경은 자연과 레저가 어우러진 독특한 분위기에 기여합니다. 놀이기구 외에도 바켄은 라이브 공연, 계절 축제, 식당을 주최하여 사회 및 문화 활동의 오랜 전통을 반영합니다. 오늘날 바켄은 역사적 매력과 매력을 유지하면서 수백 년 된 놀이 전통의 살아있는 예를 제공하며 전 세계 방문객을 계속 끌어들이고 있습니다.'),
			('TXT_KEY_BUILDING_BAKKEN_HELP',	'');
			
INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_BAKKEN_HELP_CUT', '[COLOR_YIELD_FOOD]바켄[ENDCOLOR] 놀이공원은 대중과 귀족 모두에게 최고 수준의 엔터테인먼트를 제공하여(+3[ICON_HAPPINESS_1]), 관광객 트래픽(+3[ICON_TOURISM]; [ICON_HAPPINESS_1] 사랑해 주간 동안 +33%[ICON_TOURISM])과 전성기에 창출할 수 있는 수익(+2[ICON_GOLD])을 크게 늘립니다. 다양한 명소(+1[ICON_CULTURE])는 축제가 길고 만족스러울 것임을 보장합니다(10[ICON_HAPPINESS_1] 사랑해 주간 턴).';
				
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]언덕[ENDCOLOR]; 플레이어: [COLOR_CYAN]행복 > 70%[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_BAKKEN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_ko_KR SET Text = ''||Text WHERE Tag ='TXT_KEY_BUILDING_BAKKEN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);		
----------------------------------------------------
-- House of Trades of the Indies
INSERT INTO Language_ko_KR 
			(Tag,										Text) 
VALUES		('TXT_KEY_BUILDING_HOUSE_OF_TRADE',			'인도 무역원'),
			('TXT_KEY_WONDER_HOUSE_OF_TRADE_QUOTE',		'[NEWLINE]"경계선 서쪽에서 발견되는 다른 모든 땅은 카스티야의 왕과 여왕, 그리고 그 후계자들의 소유가 될 것이다."[NEWLINE] - "토르데시야스 조약"에서[NEWLINE]'),
			('TXT_KEY_BUILDING_HOUSE_OF_TRADE_PEDIA',	'인도 무역원(Casa de Contratación)은 1503년 스페인 왕실이 세비야에 설립하여 스페인과 아메리카 영토 간의 무역, 항해 및 식민지 문제의 모든 측면을 규제하고 감독했습니다. 처음에는 스페인이 새로 발견한 아메리카 영토로 수출하고 수입하는 상품의 구매, 운송, 창고 보관 및 판매를 관리하는 중앙 기관으로 기능했습니다. 스페인의 탐험과 식민지화가 확대됨에 따라 무역원의 상업 및 재정적 책임은 항해 허가, 항해사 훈련, 지도 및 해도 제작, 해외에서 사망한 스페인 사람들의 재산 관리 등을 포함하여 커졌습니다. [NEWLINE][NEWLINE]건축학적으로 무역원은 처음에 세비야의 알카사르 왕궁에 위치하여 제독의 방과 궁전 단지 내의 다른 방을 차지했습니다. 이 설정은 세비야 항구와 가까워 해양 활동 관리를 용이하게 했습니다. 1717년 과달키비르강의 토사 퇴적으로 세비야 항구의 항해가 어려워지자 기관은 카디스로 이전되었습니다. 무역원은 식민지 행정의 광범위한 개편의 일환으로 폐지된 1790년까지 운영을 계속했습니다. 오늘날 무역원의 유산은 스페인의 식민지 역사를 기록한 방대한 기록을 보관하고 있는 세비야의 인디아스 고문서관에 보존되어 있습니다.'),
			('TXT_KEY_BUILDING_HOUSE_OF_TRADE_HELP',	'');
			
INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_HOUSE_OF_TRADE_HELP_CUT', '역동적인 발전과 억제되지 않은 확장의 시대에 [COLOR_YIELD_FOOD]인도 무역원[ENDCOLOR]은 강력한 군대와 무역을 매우 긴밀하게 결합하여 자연스럽게 느껴지게 합니다(+10%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]해상 군사[ENDCOLOR], [COLOR_YIELD_GOLD]화물[ENDCOLOR]). 군사적 보호는 이러한 어려운 상황에서 필요하며([COLOR_YIELD_GOLD]무료 [ICON_GREAT_ADMIRAL][ENDCOLOR]; +1[ICON_GREAT_ADMIRAL]), 특히 새롭고 특별한 시장을 찾기 위해 더 멀리 확장해야 하고(+2[ICON_INTERNATIONAL_TRADE]) 생존을 위해 수입을 상당히 늘려야 할 때 더욱 그렇습니다(+3[ICON_GOLD]; +2[ICON_GREAT_MERCHANT]).';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 플레이어: [COLOR_CYAN]2[ICON_CITY_STATE] 도시 국가 동맹[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_HOUSE_OF_TRADE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_HOUSE_OF_TRADE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Solovietsky Monastery
INSERT INTO Language_ko_KR 
			(Tag,										Text) 
VALUES		('TXT_KEY_BUILDING_SOLOVIETSKY',			'솔로베츠키 수도원'),
			('TXT_KEY_WONDER_SOLOVIETSKY_QUOTE',		'[NEWLINE]"모든 것은 사랑 앞에 패배한다."[NEWLINE] - 비토브니차의 타데우스 장로[NEWLINE]'),
			('TXT_KEY_BUILDING_SOLOVIETSKY_PEDIA',		'러시아 북부 백해의 솔로베츠키 제도에 위치한 솔로베츠키 수도원은 1436년 수도사 조시마에 의해 설립되었으며, 1429년 헤르만과 사바티에 의해 초기 수도원 활동이 시작되었습니다. 수도원은 빠르게 확장되어 러시아 북부의 중요한 종교, 문화, 경제 중심지가 되었습니다. 17세기까지 이곳은 수도사와 평신도로 구성된 상당한 공동체가 있는 요새화된 단지로 성장하여 소금 생산, 어업, 제철소와 같은 다양한 산업에 종사했습니다. 수도원은 또한 구의식파 운동에서 역할을 했으며 17세기 니콘 총대주교가 강요한 교회 개혁에 저항했습니다. 전략적 위치로 인해 리보니아 기사단, 스웨덴, 크림 전쟁 중 영국 등의 공격을 포함하여 분쟁 중 표적이 되었습니다. 이러한 어려움에도 불구하고 러시아 혁명까지 중요한 종교 기관으로 남아 있었습니다. [NEWLINE][NEWLINE]소련 시대에 수도원은 1926년부터 1939년까지 수용소로 용도가 변경되어 굴라그 시스템의 전신 역할을 했습니다. 이 기간 동안 많은 종교 건물이 손상되거나 파괴되었습니다. 소련 붕괴 후 1990년대에 수도원 생활이 부활했고 광범위한 복원 노력이 수행되었습니다. 오늘날 수도원은 역사적, 건축적 중요성을 인정받아 유네스코 세계문화유산입니다. 단지에는 거대한 돌벽과 탑으로 둘러싸인 솔로베츠키 크렘린과 16세기부터 20세기 초까지의 여러 교회 및 수도원 건물이 포함되어 있습니다. 이는 가혹한 북부 환경에서 러시아 정교회의 회복력과 영적 유산에 대한 증거로 서 있습니다.'),
			('TXT_KEY_BUILDING_SOLOVIETSKY_HELP',		'');
			
INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_SOLOVIETSKY_HELP_CUT', '[COLOR_YIELD_FOOD]솔로베츠키 수도원[ENDCOLOR]은 매우 보편적인 프로젝트입니다. 새로운 사관학교(+2[ICON_GREAT_ADMIRAL])와 고급 조선소(+25%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]해상 군사[ENDCOLOR]; +10[ICON_STRENGTH]; +50 HP)는 군대를 크게 지원할 수 있으며, 다른 한편으로 외로운 수도원(+2[ICON_PEACE])은 약간의 평화를 가져올 것입니다. 접근하기 어려운 [COLOR_CITY_BLUE]툰드라[ENDCOLOR] 지역(+1[ICON_PRODUCTION], +1[ICON_PEACE]/[COLOR_CITY_BLUE]타일[ENDCOLOR])의 이러한 모든 기능과 먼 곳은 비밀 노동 수용소에 이상적일 수 있습니다(10%[ICON_PRODUCTION] -> [ICON_FOOD]).';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]충성 완성[ENDCOLOR]; 지형: [COLOR_CYAN]툰드라[ENDCOLOR], [COLOR_CYAN]해안[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_SOLOVIETSKY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]충성 완성[ENDCOLOR]; 지형: [COLOR_CYAN]툰드라[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_SOLOVIETSKY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);		
----------------------------------------------------
-- Tembleque Aqueduct
INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_TEMBLEQUE',			'템블레케 수로'),
			('TXT_KEY_WONDER_TEMBLEQUE_QUOTE',		'[NEWLINE]"멕시코는 서로 다른 현실과 아름다움의 모자이크이다."[NEWLINE] - 엔리케 페냐 니에토[NEWLINE]'),
			('TXT_KEY_BUILDING_TEMBLEQUE_PEDIA',	'멕시코 이달고주와 멕시코주에 걸쳐 있는 멕시코 중부 고원에 위치한 파드레 템블레케 수로는 16세기 수력 공학의 놀라운 위업입니다. 1553년 프란체스코회 수사 프란시스코 데 템블레케의 지휘하에 건설이 시작되어 1570년에 완공되었습니다. 이 수로는 오툼바 지역의 물 부족 문제를 해결하기 위해 설계되었으며 유럽의 공학 지식과 토착 건설 기술을 결합했습니다. 45km에 달하는 이 시스템에는 운하, 아치, 저수지, 분수가 포함되어 있어 초기 식민지 시대에 다양한 문화 및 기술 전통이 성공적으로 통합되었음을 보여줍니다. [NEWLINE][NEWLINE]이 수로는 특히 67개의 아치가 있고 최대 높이가 38.75미터에 달하는 테페야왈코의 그란 아르카다(Gran Arcada)의 건축적 웅장함으로 유명합니다. 이 구조물은 기술적 독창성과 미적 정교함을 모두 보여주며 지역 풍경과 기후에 대한 신중한 적응을 반영합니다. 물 공급이라는 기능적 목적 외에도 수로는 유럽과 토착 지식 간의 협력의 상징으로 서 있습니다. 2015년에는 아메리카 대륙의 르네상스 시대 수력 공학에 대한 증거로서 탁월한 보편적 가치를 인정받아 유네스코 세계문화유산으로 등재되었습니다.'),
			('TXT_KEY_BUILDING_TEMBLEQUE_HELP',		'[ICON_BULLET]모든 도시에서 [ICON_PEACE] 신앙 구매의 5%를 [ICON_FOOD] 식량으로 전환합니다.');
			
UPDATE Language_ko_KR SET Text = '[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_TEMBLEQUE_HELP';			

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_TEMBLEQUE_HELP_CUT', '[COLOR_YIELD_FOOD]템블레케 수로[ENDCOLOR]는 단순하면서도 환상적인 발명품(+1[ICON_PRODUCTION], +1[ICON_PEACE]/모든 [COLOR_YIELD_FOOD]송수로[ENDCOLOR]; +1[ICON_PRODUCTION])으로, 거주 가능한 [COLOR_CITY_BLUE]사막[ENDCOLOR] 지역을 다시 번영하게 만듭니다(+1[ICON_FOOD]/[COLOR_CITY_BLUE]타일[ENDCOLOR]; +2[ICON_FOOD]). 선구적인 수도사의 기발한 아이디어와 이니셔티브 덕분에(+1[ICON_PEACE]; 5%[ICON_PEACE][ICON_PEACE] 신앙 구매 -> [ICON_FOOD]) 부족한 저수지는 지금까지 굶주린 원주민 부족에게 더 이상 문제가 되지 않습니다(-1[ICON_HAPPINESS_3][ICON_HAPPINESS_3] 고통).';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]사막[ENDCOLOR]; [COLOR_NEGATIVE_TEXT]해안[ENDCOLOR]; 지물: [COLOR_CYAN]담수[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_TEMBLEQUE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지물: [COLOR_CYAN]담수[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_TEMBLEQUE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Globe Theater
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_WONDER_GLOBE_THEATER_HELP_CUT', '[COLOR_YIELD_FOOD]글로브 극장[ENDCOLOR]은 모든 사람의 취향을 충족시키는 수십 가지의 멋진 공연을 보여줍니다(+2[ICON_CULTURE]; -1[ICON_HAPPINESS_3] 지루함). 웅장한 무대를 위한 연극을 준비하는 것은 매우 까다로운데, 모든 예술 직업을 한곳에 모아야 하기 때문입니다(+2[ICON_GOLDEN_AGE]/[ICON_GREAT_ARTIST][ICON_GREAT_ARTIST], [ICON_GREAT_WRITER][ICON_GREAT_WRITER], [ICON_GREAT_MUSICIAN][ICON_GREAT_MUSICIAN]). 문학에 훨씬 더 중점을 두고 있음에도 불구하고([COLOR_YIELD_GOLD]무료 [ICON_GREAT_WRITER][ENDCOLOR]; 테마 보너스 시 2[ICON_GW_WRITING]: [ICON_GOLD]), 모든 창작자는 그곳에서 일자리를 찾을 것입니다(-1[ICON_HAPPINESS_3][ICON_HAPPINESS_3] 도시화).');
				
UPDATE Language_ko_KR SET Text = '지물: [COLOR_CYAN]강[ENDCOLOR]; 건물: [COLOR_CYAN]원형 극장[ENDCOLOR], [COLOR_CYAN]모든 길드[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_GLOBE_THEATER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '건물: [COLOR_CYAN]원형 극장[ENDCOLOR], [COLOR_CYAN]모든 길드[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_GLOBE_THEATER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Chichen Itza
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_WONDER_CHICHEN_ITZA_HELP_CUT',	'유리한 시기(+3[ICON_GOLDEN_AGE])는 [COLOR_YIELD_FOOD]치첸이트사[ENDCOLOR]와 같은 거대한 단지를 건설할 수 있게 해줍니다. 주요 임무는 강력한 쿠쿨칸을 기쁘게 하는 것이며(+2[ICON_PEACE]; [ICON_GOLDEN_AGE] 동안 승리 시 45[ICON_PEACE][ICON_PEACE]), 그의 친절은 시민들의 삶을 더 풍요롭고 오래 지속되게 할 것입니다(+60%[ICON_GOLDEN_AGE] 길이; -10%[ICON_HAPPINESS_3][ICON_HAPPINESS_3]). 훌륭한 공학 기술은 이 프로젝트를 성공시키는 데 필수적이었으며(+1[ICON_GREAT_ENGINEER]) 오랜 세월 동안 창조물의 내구성을 보장합니다.');
	
UPDATE Language_ko_KR SET Text = REPLACE(Text, 'The Book of Chilam Balam', '칠람 발람의 책에서') WHERE Tag ='TXT_KEY_WONDER_CHICHEN_ITZA_QUOTE';
			
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]평지[ENDCOLOR]; 지형: [COLOR_CYAN]평원[ENDCOLOR]; 지물: [COLOR_CYAN]숲[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_CHICHEN_ITZA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]평지[ENDCOLOR]; 지형: [COLOR_CYAN]평원[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_CHICHEN_ITZA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Himeji Castle
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_WONDER_HIMEJI_CASTLE_HELP_CUT', '[COLOR_YIELD_FOOD]히메지성[ENDCOLOR]은 전형적인 [COLOR_YIELD_FOOD]성채 요새[ENDCOLOR]([COLOR_YIELD_FOOD]무료[ENDCOLOR])를 난공불락의 요새(+1[ICON_GREAT_ENGINEER]; +1[ICON_GREAT_GENERAL])로 바꾸어 다가오는 침략으로부터 통치하에 있는 모든 인접 지역을 보호합니다(+10%[ICON_STRENGTH][ICON_STRENGTH]). 특별히 모집된 부대(+5[ICON_SILVER_FIST])와 모든 군사 영역에서 사용할 수 있는 도입된 고유 훈련 프로그램([COLOR_WATER_TEXT]히메지성[ENDCOLOR]/[COLOR_YIELD_GOLD]군사[ENDCOLOR])의 도움으로 적들은 확실히 겁에 질려 필요한 이점을 제공할 것입니다.');
				
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]언덕[ENDCOLOR]; 지형: [COLOR_CYAN]해안[ENDCOLOR]; 지물: [COLOR_CYAN]숲[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_HIMEJI_CASTLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]언덕[ENDCOLOR]; 지형: [COLOR_CYAN]해안[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_HIMEJI_CASTLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Leaning Tower of Pisa
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_WONDER_LEANING_TOWER_HELP_CUT', '[COLOR_YIELD_FOOD]피사의 사탑[ENDCOLOR] 현상은 우연히 만들어졌음에도 불구하고 여전히 다양한 분야의 지식인들의 관심을 끌고 있습니다([COLOR_YIELD_GOLD]무료 [ICON_GREAT_PEOPLE][ENDCOLOR]; +25%[ICON_GREAT_PEOPLE]). 이 종탑의 안정성과 관련된 막대한 위험은 세계적으로 유명한 과학자와 기술자들이 수행하는 수많은 실험의 점화 장치이며(+10%[ICON_GREAT_PEOPLE][ICON_GREAT_PEOPLE]), 수백만 명의 관광객이 위험을 감수하고 이 웅장한 건축물을 볼 준비가 되어 있습니다(+1[ICON_CULTURE]).');
				
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]평지[ENDCOLOR]; 지물: [COLOR_CYAN]물[ENDCOLOR], [COLOR_CYAN]습지[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_LEANING_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지물: [COLOR_CYAN]물[ENDCOLOR], [COLOR_CYAN]습지[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_LEANING_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Porcelain Tower
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_WONDER_PORCELAIN_TOWER_HELP_CUT', '[COLOR_YIELD_FOOD]대보은사탑[ENDCOLOR]은 많은 기록을 깼으며, 이 모든 것은 수많은 과학적 돌파구 덕분에 가능했습니다([COLOR_YIELD_GOLD]무료 [ICON_GREAT_SCIENTIST][ENDCOLOR]). 많은 세대가 그것을 개선하거나 확장하려고 노력했고, 때로는 몇 번의 비극적인 사건 후에 재건하기도 했습니다(+10%[ICON_RESEARCH]; +2[ICON_GREAT_SCIENTIST]). 그래서 여전히 모든 방문객, 심지어 견학 중에 무언가를 배울 수 있는 젊은이들까지 기쁘게 할 수 있습니다(-1[ICON_HAPPINESS_3] 문맹).');
				
UPDATE Language_ko_KR SET Text = '지물: [COLOR_CYAN]강[ENDCOLOR]; 플레이어: [COLOR_CYAN]2 [ICON_CITY_STATE] 동맹[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_PORCELAIN_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지물: [COLOR_CYAN]강[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_PORCELAIN_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Taj Mahal
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_WONDER_TAJ_MAHAL_HELP_CUT', '아름다운 [COLOR_YIELD_FOOD]타지마할[ENDCOLOR] 영묘는 끝없는 사랑의 무력한 표현일 뿐만 아니라(+2[ICON_CULTURE]), 당신을 새로운 시대로 즉시 밀어 넣는 놀라운 프로젝트이기도 합니다([ICON_GOLDEN_AGE] 시작). 그 건설은 수많은 종교적, 정치적 경계를 허물어(도시 내 [ICON_RELIGION]마다 +3[ICON_RESEARCH], +3[ICON_CULTURE], +3[ICON_PEACE]) 하나의 깃발 아래 하나의 공통된 목표를 가지고 많은 국가를 통합할 수 있는 놀라운 기회를 제공합니다(+1[ICON_GOLDEN_AGE]/2[ICON_CITIZEN]).');
				
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]평지[ENDCOLOR]; 지형: [COLOR_NEGATIVE_TEXT]해안[ENDCOLOR]; 지물: [COLOR_CYAN]강[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_TAJ_MAHAL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]평지[ENDCOLOR]; 지물: [COLOR_CYAN]강[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_TAJ_MAHAL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Uffizi
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_WONDER_UFFIZI_HELP_CUT', '[COLOR_YIELD_FOOD]우피치[ENDCOLOR]는 다른 권위 있는 예술 [COLOR_YIELD_FOOD]갤러리[ENDCOLOR]([COLOR_YIELD_FOOD]무료[ENDCOLOR])와 마찬가지로 재능 있는 예술가들이 종종 충격적인 창작물을 더 많은 대중에게 공유할 수 있는 완벽한 장소입니다(+2[ICON_CULTURE]; 테마 보너스 시 3[ICON_GW_ART]: [ICON_CULTURE]). 많은 예술 애호가들이 그곳에서 새로운 얼굴을 찾으려 하며, 종종 그들에게 추가 발전의 유일한 기회를 제공하고([COLOR_YIELD_GOLD]무료 [ICON_GREAT_ARTIST][ENDCOLOR]; +1[ICON_CULTURE]/[ICON_GREAT_WORK][ICON_GREAT_WORK]) 그들의 예술적 비옥함을 위한 몇 가지 빈 자리를 마련합니다(-1[ICON_HAPPINESS_3][ICON_HAPPINESS_3] 도시화).');
				
UPDATE Language_ko_KR SET Text = '지물: [COLOR_CYAN]강[ENDCOLOR]; 걸작: [COLOR_CYAN]3 [ICON_GW_ART][ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_UFFIZI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = ''||Text WHERE Tag ='TXT_KEY_WONDER_UFFIZI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Sistine Chapel
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_WONDER_SISTINE_CHAPEL_HELP_CUT', '멋진 프레스코화(테마 보너스 시 2[ICON_GW_ART]: [ICON_CULTURE], [ICON_PEACE])가 덮고 있는 화려한 [COLOR_YIELD_FOOD]시스티나 성당[ENDCOLOR]의 천장은 이 거대한 창조물을 경외심을 가지고 바라보는 수십 명의 젊은 예술가들에게 필수적인 동기 부여가 될 수 있습니다(+10%[ICON_CULTURE][ICON_CULTURE]). 이 그림의 작가는 창조물을 완성하는 데 수년을 보냈으므로, 적어도 잠시 머물며 종교와 그것이 인류에 미치는 영향에 대해 숙고해 보십시오(+1[ICON_CULTURE]).');
				
UPDATE Language_ko_KR SET Text = '건물: [COLOR_CYAN]예술가 길드[ENDCOLOR]; 플레이어: [COLOR_CYAN]종교 창시[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_SISTINE_CHAPEL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '건물: [COLOR_CYAN]예술가 길드[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_SISTINE_CHAPEL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]충성 완성[ENDCOLOR]; '||Text WHERE Tag ='TXT_KEY_WONDER_SISTINE_CHAPEL_HELP' AND EXISTS (SELECT * FROM Community WHERE Type='MW-SETTING-POLICIES' AND Value=1);
----------------------------------------------------
-- Summer Palace
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_BUILDING_SUMMER_PALACE_HELP_CUT', '황제들은 국가를 성공적으로 통치하기 위해 자신의 거주지가 필요하며(+1[ICON_DIPLOMAT]) [COLOR_YIELD_FOOD]이화원[ENDCOLOR]은 모든 요구 사항을 충족합니다. 수많은 외교 시설을 지원하고(+3[ICON_GOLD], +1[ICON_CULTURE]/모든 [COLOR_YIELD_FOOD]관청[ENDCOLOR]) 그 기능에 필요한 [COLOR_GREY]종이[ENDCOLOR]의 새로운 공급원을 제공합니다(+1[ICON_RES_PAPER]). 또한, 특별히 모집된 대표단(+20%[ICON_PRODUCTION][ICON_PRODUCTION]/[COLOR_YIELD_GOLD]외교[ENDCOLOR])은 훨씬 더 효율적이며 불가능한 거래조차 성사시킬 수 있습니다([COLOR_WATER_TEXT]귀족[ENDCOLOR]/[COLOR_YIELD_GOLD]외교[ENDCOLOR]).');
				
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]언덕[ENDCOLOR]; 지물: [COLOR_CYAN]호수[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_SUMMER_PALACE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]언덕[ENDCOLOR]; 지물: [COLOR_CYAN]호수[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_SUMMER_PALACE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]외교 완성[ENDCOLOR]; '||Text WHERE Tag ='TXT_KEY_BUILDING_SUMMER_PALACE_HELP' AND EXISTS (SELECT * FROM Community WHERE Type='MW-SETTING-POLICIES' AND Value=1);
UPDATE Language_ko_KR SET Text = REPLACE(Text, 'Feature: ', '지물: [COLOR_CYAN]숲[ENDCOLOR], ') WHERE Tag ='TXT_KEY_BUILDING_SUMMER_PALACE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2) AND EXISTS (SELECT * FROM Community WHERE Type='MW-SETTING-POLICIES' AND Value=0);
----------------------------------------------------
-- Red Fort
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_WONDER_RED_FORT_HELP_CUT', '[COLOR_YIELD_FOOD]붉은 요새[ENDCOLOR]는 당신의 안전을 확실히 높여줄 매우 잘 갖춰진 [COLOR_YIELD_FOOD]병기고[ENDCOLOR]([COLOR_YIELD_FOOD]무료[ENDCOLOR])를 숨기고 있습니다. 헌신적인 과학자 그룹(+1[ICON_GREAT_SCIENTIST])의 지원을 받는 숙련된 기술자들([COLOR_YIELD_GOLD]무료 [ICON_GREAT_ENGINEER][ENDCOLOR])에 의해 건설된 이 요새는 도시의 공격(도시: +10%[ICON_RANGE_STRENGTH], +1[ICON_SWAP]) 및 방어(+6[ICON_STRENGTH]; +100 HP) 능력을 크게 향상시키고 군대를 더 잘 관리할 수 있게 해줍니다([ICON_CITIZEN][ICON_CITIZEN]의 +5%를 [ICON_SILVER_FIST]로).');

UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]충성 완성[ENDCOLOR]; 지형: [COLOR_NEGATIVE_TEXT]해안[ENDCOLOR]; 지물: [COLOR_CYAN]강[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_RED_FORT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]충성 완성[ENDCOLOR]; 지물: [COLOR_CYAN]강[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_RED_FORT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
----------------------------------------------------
-- Museum Island
INSERT INTO Language_ko_KR 
			(Tag,												Text)
VALUES		('TXT_KEY_BUILDING_MUSEUM_ISLAND',					'박물관 섬'),
			('TXT_KEY_WONDER_MUSEUM_ISLAND_QUOTE',				'[NEWLINE]"베를린은 도시라기보다는 세계의 일부이다."[NEWLINE] - 장 폴[NEWLINE]'),
			('TXT_KEY_BUILDING_MUSEUM_ISLAND_PEDIA',			'베를린의 박물관 섬(Museumsinsel)은 도시 중심부의 슈프레 섬에 위치한 유명한 문화 단지입니다. 1823년에서 1930년 사이에 프로이센 왕들과 카를 프리드리히 싱켈, 프리드리히 아우구스트 슈튈러와 같은 주요 건축가들의 지휘 아래 5개의 기념비적인 박물관이 건설되었습니다. 이 앙상블에는 구 박물관(1830), 신 박물관(1855), 구 국립미술관(1876), 보데 박물관(1904), 페르가몬 박물관(1930)이 포함됩니다. 이 기관들은 고대 문명부터 19세기까지의 방대한 예술품과 유물을 총체적으로 전시합니다. 1999년 박물관 섬은 탁월한 건축적 통일성과 1세기 이상에 걸친 박물관 디자인의 진화를 인정받아 유네스코 세계문화유산으로 지정되었습니다. [NEWLINE][NEWLINE]박물관 단지는 제2차 세계 대전 중 상당한 피해를 입었지만 1990년대 이후 광범위한 복원 작업을 거쳤습니다. 활성화의 중추적인 발전은 영국 건축가 데이비드 치퍼필드가 설계한 제임스 시몬 갤러리가 2019년에 완공된 것입니다. 이 현대적인 입구 건물은 중앙 허브 역할을 하여 박물관을 연결하고 방문객 경험을 향상시킵니다. 오늘날 박물관 섬은 매년 수백만 명의 방문객을 유치하여 인류 역사와 예술적 성취를 통한 포괄적인 여정을 제공합니다. 주목할 만한 하이라이트로는 신 박물관의 네페르티티 흉상, 페르가몬 박물관의 페르가몬 제단 및 이슈타르 문이 있습니다.'),
			('TXT_KEY_BUILDING_MUSEUM_ISLAND_HELP',				'[ICON_BULLET]제국 내 [ICON_GREAT_ARTIST] 위대한 예술가 생성 +50%.'),
			('TXT_KEY_THEMING_BONUS_MUSEUM_ISLAND_COMPOSITION',	'박물관 섬의 불가사의'),
			('TXT_KEY_THEMING_BONUS_MUSEUM_ISLAND_ERAS',		'모든 시대의 불가사의'),
			('TXT_KEY_THEMING_BONUS_MUSEUM_ISLAND_OTHERS',		'모든 국가의 불가사의'),
			('TXT_KEY_THEMING_BONUS_MUSEUM_ISLAND_ART',			'예술 갤러리'),
			('TXT_KEY_THEMING_BONUS_MUSEUM_ISLAND_HELP',		'보너스를 극대화하려면 모든 걸작 슬롯을 소유자가 아닌 다른 플레이어가 만든, 서로 다른 시대의 예술품으로 채우십시오.');

UPDATE Language_ko_KR SET Text = '[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_MUSEUM_ISLAND_HELP';

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_MUSEUM_ISLAND_HELP_CUT', '[COLOR_YIELD_FOOD]박물관 섬[ENDCOLOR]은 세계에서 가장 큰 유물 컬렉션 중 하나를 포함하는 수많은 시설이 있는 고립된 단지입니다(테마 보너스 시 4[ICON_GW_ART]: [ICON_RESEARCH], [ICON_CULTURE], [ICON_TOURISM]). 이러한 [COLOR_YIELD_FOOD]박물관[ENDCOLOR]([COLOR_YIELD_FOOD]무료[ENDCOLOR]; +2[ICON_TOURISM][ICON_TOURISM]) 중 하나를 방문하면 놀라운 감정을 보장하며(+3[ICON_CULTURE]), 새로운 세대가 열광하여 예술가 길드에 가입하도록 하는 강력한 인센티브가 될 수 있습니다(+50%[ICON_GREAT_ARTIST][ICON_GREAT_ARTIST]).';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]예술 완성[ENDCOLOR]; 지물: [COLOR_CYAN]강[ENDCOLOR]; 걸작: [COLOR_CYAN]3[ICON_GW_ART][ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_MUSEUM_ISLAND_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]예술 완성[ENDCOLOR]; 지물: [COLOR_CYAN]강[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_MUSEUM_ISLAND_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Siku Quanshu
INSERT INTO Language_ko_KR 
			(Tag,												Text)
VALUES		('TXT_KEY_BUILDING_SIKU_QUANSHU',					'사고전서'),
			('TXT_KEY_WONDER_SIKU_QUANSHU_QUOTE',				'[NEWLINE]"나는 항상 천국이 도서관 같은 곳일 것이라고 상상해 왔다."[NEWLINE] - 호르헤 루이스 보르헤스[NEWLINE]'),
			('TXT_KEY_BUILDING_SIKU_QUANSHU_PEDIA',				'사고전서는 중국 역사상 가장 야심 찬 문학 프로젝트 중 하나입니다. 1772년 청나라 건륭제가 의뢰한 이 프로젝트는 알려진 모든 중국 문헌을 수집, 보존 및 체계화하는 것을 목표로 했습니다. 10년이 넘는 기간 동안 수천 명의 학자들이 역사, 철학, 문학, 과학, 예술에 걸친 작품을 꼼꼼하게 수집했습니다. 그 결과물은 약 36,000권, 79,000개 이상의 개별 작품을 포함하여 중국 역사상 가장 큰 저작물 컬렉션이 되었습니다. 이 프로젝트는 또한 정통 유교 가치를 장려하는 동시에 반대 의견이나 이단적 견해를 억압하려는 청나라의 정치적, 문화적 목표를 반영했으며, 특정 텍스트는 편집되거나 포함이 금지되기도 했습니다. [NEWLINE][NEWLINE]사고전서는 경(경전), 사(역사), 자(철학), 집(문학)의 네 가지 주요 섹션으로 구성되어 있어 그 이름이 유래되었습니다. 각 섹션은 주제와 장르별로 텍스트를 체계적으로 배열하기 위해 하위 범주로 더 나뉘어 학자들에게 연구 및 조사를 위한 포괄적인 참고 자료를 제공했습니다. 컬렉션의 필사본은 손으로 쓴 후 7개의 완전한 세트로 복사되어 중국 전역의 특별 지정 도서관에 보관되어 미래 세대를 위한 보존과 접근성을 보장했습니다. 지식의 보고로서의 역할 외에도 사고전서는 18세기 중국의 지적 야망, 서지적 엄격함, 황실의 권위를 반영하는 문화적 기념비이기도 합니다. 그 유산은 오늘날까지 중국 역사학, 문학, 도서관학에 계속 영향을 미치고 있습니다.'),
			('TXT_KEY_BUILDING_SIKU_QUANSHU_HELP',				''),
			('TXT_KEY_THEMING_BONUS_SIKU_QUANSHU_COMPOSITION',	'모든 왕조의 기록 유산'),
			('TXT_KEY_THEMING_BONUS_SIKU_QUANSHU_ERAS',			'모든 시대의 문학'),
			('TXT_KEY_THEMING_BONUS_SIKU_QUANSHU_OWNER',		'사람들의 문학'),
			('TXT_KEY_THEMING_BONUS_SIKU_QUANSHU_WRITINGS',		'흥미로운 저작물 구성'),
			('TXT_KEY_THEMING_BONUS_SIKU_QUANSHU_HELP',			'보너스를 극대화하려면 모든 걸작 슬롯을 당신이 만든, 서로 다른 시대의 문학으로 채우십시오.');
			
INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_SIKU_QUANSHU_HELP_CUT', '[COLOR_YIELD_FOOD]사고전서[ENDCOLOR]는 제국의 지식, 창조물 및 역사를 담고 있어(테마 보너스 시 4[ICON_GW_WRITING]: [ICON_RESEARCH], [ICON_CULTURE]) 그 가치와 중요성을 자동으로 높입니다(+1[ICON_RESEARCH], +1[ICON_CULTURE]/[ICON_GREAT_WORK][ICON_GREAT_WORK]). 이 압도적인 컬렉션은 전문가들의 눈 아래 분류되고, 확보되고, 파괴로부터 보존되어야 하며([ICON_GREAT_WRITER] 슬롯 2개; +1[ICON_RESEARCH]/[ICON_GREAT_WRITER][ICON_GREAT_WRITER]) 당신의 영광스러운 죽음 이후에도 수년 동안 당신의 피보호자들이 혜택을 받을 수 있도록 해야 합니다(+2[ICON_RESEARCH]; -1[ICON_HAPPINESS_3] 문맹).'
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_SIKU_QUANSHU_HELP';
				
UPDATE Language_ko_KR SET Text = '걸작: [COLOR_CYAN]4[ICON_GW_WRITING][ENDCOLOR]; 플레이어: [COLOR_CYAN]7개 도시[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_SIKU_QUANSHU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = ''||Text WHERE Tag ='TXT_KEY_BUILDING_SIKU_QUANSHU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Brooklyn Bridge
INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_BROOKLYN',		'브루클린 다리'),
			('TXT_KEY_WONDER_BROOKLYN_QUOTE',	'[NEWLINE]"과학자는 브루클린 다리를 짓고 나서 그것을 사는 사람이다."[NEWLINE] - 윌리엄 F. 버클리 주니어[NEWLINE]'),
			('TXT_KEY_BUILDING_BROOKLYN_PEDIA',	'1883년에 완공된 브루클린 다리는 뉴욕시의 가장 상징적인 랜드마크 중 하나이자 19세기 공학의 경이로움입니다. 독일 태생의 엔지니어 존 오거스터스 로블링이 설계한 이 다리는 원래 이스트강을 가로질러 뉴욕(맨해튼)과 브루클린을 연결하여 빠르게 성장하는 두 지역 간의 상업과 교통을 촉진하기 위한 것이었습니다. 비극적으로 로블링은 건설 초기 단계에서 사고로 사망했고, 그의 아들 워싱턴 로블링이 프로젝트를 이어받았습니다. 워싱턴 자신도 잠수병을 앓아 현장 관리의 많은 부분을 아내 에밀리 워렌 로블링에게 맡겼는데, 그녀는 건설 감독에 결정적인 역할을 했습니다. 완공 당시 브루클린 다리는 강을 가로질러 1,595피트 뻗어 있는 세계에서 가장 긴 현수교였으며, 기술 진보와 떠오르는 현대 미국의 야망을 상징했습니다. [NEWLINE][NEWLINE]구조적으로 브루클린 다리는 석조 탑과 강철 케이블 서스펜션을 결합하여 수십 년 동안 교량 건설에 영향을 미친 혁신적인 하이브리드 디자인을 나타냅니다. 고딕 양식의 아치와 거대한 화강암 교각은 독특한 미학을 제공하며, 넓은 보행자 통로는 맨해튼과 브루클린의 멋진 전망을 제공합니다. 이 다리는 차량과 보행자 통행을 모두 수용하며 수많은 영화, 사진, 예술 작품에 등장하는 문화적, 역사적 아이콘이 되었습니다. 실용적인 기능 외에도 브루클린 다리는 현대 건설 기계와 안전 기준이 있기 전 시대에 공학적 도전을 극복하는 데 필요한 인간의 독창성, 결단력, 협력적 노력에 대한 증거로 서 있습니다. [NEWLINE]1884년 다리의 안정성에 대한 우려가 있었을 때, P.T. 바넘은 서커스단의 코끼리 21마리를 이끌고 다리를 건넜습니다. 이 다리는 또한 9/11과 같은 사건 이후 사람들의 탈출에 사용되었으며, 그 상황에서 다리는 런던의 밀레니엄 다리와 비슷한 방식으로 흔들렸습니다.'),
			('TXT_KEY_BUILDING_BROOKLYN_HELP',	'');
			
INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_BROOKLYN_HELP_CUT', '[COLOR_YIELD_FOOD]브루클린 다리[ENDCOLOR]는 영화에서 자주 소개되는 도시 풍경의 이상적인 쇼케이스입니다(+4[ICON_TOURISM]). 초기 건설은 고립된 지역을 연결하여(+1[ICON_INTERNATIONAL_TRADE]) 문화적 이동을 증가시켰으며(+2[ICON_CULTURE]), 기술자들의 뛰어난 기술을 여러 번 증명했습니다(+1[ICON_RESEARCH]; 50[ICON_PRODUCTION], 50[ICON_RESEARCH]/[ICON_GREAT_PEOPLE] 소모). 이 보편적인 연결 고리는 진보하는 산업화(+1[ICON_PRODUCTION])와 진행 중인 낙관주의(20[ICON_INFLUENCE]/[ICON_CITY_STATE][ICON_CITY_STATE])의 상징적인 반영입니다.';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 지물: [COLOR_CYAN]강[ENDCOLOR]; 도시: [COLOR_CYAN]25 [ICON_CITIZEN][ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_BROOKLYN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 지물: [COLOR_CYAN]강[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_BROOKLYN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]산업 완성[ENDCOLOR]; '||Text WHERE Tag ='TXT_KEY_BUILDING_BROOKLYN_HELP' AND EXISTS (SELECT * FROM Community WHERE Type='MW-SETTING-POLICIES' AND Value=1);
----------------------------------------------------
-- Trans-Siberian Railway
INSERT INTO Language_ko_KR 
			(Tag,											Text)
VALUES		('TXT_KEY_BUILDING_SIBERIAN_RAILWAY',			'시베리아 횡단 철도'),
			('TXT_KEY_WONDER_SIBERIAN_RAILWAY_QUOTE',		'[NEWLINE]"시베리아 횡단 철도는 단순한 철도 그 이상입니다. 그것은 현대 러시아의 정신으로의 여행이자 공학의 승리이며, 지구상에서 가장 크고 아마도 가장 신비로운 국가를 통과하는 움직이는 축제입니다."[NEWLINE] - 개빈 헤인즈[NEWLINE]'),
			('TXT_KEY_BUILDING_SIBERIAN_RAILWAY_PEDIA',		'시베리아 횡단 철도는 서쪽의 모스크바와 태평양 연안의 블라디보스토크를 연결하는 러시아의 광활한 영토를 가로지르는 기념비적인 철도 네트워크로, 총길이가 9,200km(약 5,700마일)가 넘습니다. 건설은 1891년 차르 알렉산드르 3세 통치하에 시작되어 제1차 세계 대전 중인 1916년에 완료되었지만, 다양한 구간은 전체 완공 전에 운영되었습니다. 이 철도는 천연자원은 풍부하지만 인구가 희박한 시베리아의 외딴 지역에 대한 경제적 통합, 군사적 이동성 및 정치적 통제를 강화하기 위해 건설되었습니다. 이 프로젝트는 혹독한 기후, 어려운 지형, 노동력 부족 등 엄청난 물류 문제를 수반했지만 러시아의 야망과 공학적 기량의 상징이 되었습니다. 시간이 지남에 따라 시베리아 횡단 철도는 시베리아 개발에 중요한 역할을 했으며, 세계에서 가장 지리적으로 어려운 지역 중 하나를 가로질러 이주, 무역 및 통신을 촉진했습니다. [NEWLINE][NEWLINE]이 철도는 규모뿐만 아니라 극한의 온도 변화와 영구 동토층 조건을 견딜 수 있도록 설계된 광범위한 교량, 터널 및 역을 특징으로 하는 공학적 성취로도 유명합니다. 울창한 숲, 광활한 평원, 우랄산맥 등 다양한 풍경을 통과하여 승객들에게 러시아의 지리적, 문화적 다양성에 대한 독특한 관점을 제공합니다. 화물 및 여객 운송 외에도 시베리아 횡단 철도는 모험과 탐험의 상징적인 상징이 되어 지구상에서 가장 긴 연속 기차 여행 중 하나를 경험하려는 전 세계 여행객을 끌어들이고 있습니다. 오늘날에도 역사적, 문화적 중요성을 보존하면서 러시아의 유럽과 아시아 지역을 연결하는 경제 활동의 중요한 동맥 역할을 계속하고 있습니다.'),
			('TXT_KEY_BUILDING_SIBERIAN_RAILWAY_HELP',		''),
			('TXT_KEY_PROMOTION_SIBERIAN_RAILWAY',			'시베리아 횡단 철도'),
			('TXT_KEY_PROMOTION_SIBERIAN_RAILWAY_HELP',		'[COLOR:255:230:85:255]툰드라와 설원에서[ENDCOLOR] [ICON_MOVES]이동력 두 배.');
			
INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_SIBERIAN_RAILWAY_HELP_CUT', '[COLOR_YIELD_FOOD]시베리아 횡단 철도[ENDCOLOR]는 당신을 외딴 황무지로 데려가([COLOR_WATER_TEXT]시베리아 횡단 철도[ENDCOLOR]/[COLOR_YIELD_GOLD]지상[ENDCOLOR]) 산업이 사람이 살기 힘든 지역으로 확장될 수 있게 해줍니다(+15%[ICON_GOLD]/[ICON_CONNECTED][ICON_CONNECTED], [ICON_INDUSTRIAL_CONNECTED][ICON_INDUSTRIAL_CONNECTED]). 이 긴 연결망은 영토 내의 모든 현대 [COLOR_GREY]전략[ENDCOLOR] 자원의 가치를 높이는 새로운 시설을 지원하고(+5[ICON_GOLDEN_AGE]/[ICON_RES_COAL][ICON_RES_COAL], [ICON_RES_OIL][ICON_RES_OIL], [ICON_RES_ALUMINUM][ICON_RES_ALUMINUM], [ICON_RES_URANIUM][ICON_RES_URANIUM]) 확장하는 제국을 위한 새로운 일자리를 제공합니다(+25%[ICON_WORKER] 작업 속도).';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]툰드라[ENDCOLOR], [COLOR_NEGATIVE_TEXT]해안[ENDCOLOR]; 건물: [COLOR_CYAN]기차역[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_SIBERIAN_RAILWAY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]툰드라[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_SIBERIAN_RAILWAY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Panama Canal
INSERT INTO Language_ko_KR 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_PANAMA_CANAL',		'파나마 운하'),
			('TXT_KEY_WONDER_PANAMA_CANAL_QUOTE',	'[NEWLINE]"개울은 그 원천보다 더 높이 솟을 수 없다"[NEWLINE] - 시어도어 루즈벨트[NEWLINE]'),
			('TXT_KEY_BUILDING_PANAMA_CANAL_PEDIA',	'파나마 운하는 태평양과 카리브해를 구분하는 파나마 지협에 위치한 인공 항로입니다. 이 위치에 운하를 건설하려는 아이디어는 16세기 신성 로마 제국 황제 카를 5세가 스페인과 페루 식민지 사이의 여행을 단축하기 위한 연결을 요청하면서 처음 제안되었습니다. 1698년 스코틀랜드 왕국은 이 지역에 육상 무역로를 만드는 프로젝트를 시작했지만 1년 후 혹독한 조건으로 인해 포기되었습니다.[NEWLINE][NEWLINE]  1849년 미국 캘리포니아주에서 금이 발견된 결과 1855년 파나마 운하 철도가 건설되면서 처음으로 연결이 이루어졌습니다. 이 철도는 1904년부터 1914년까지 미국의 운하 건설에 광범위하게 사용되었습니다. 수에즈 운하와 같은 평면 수로를 건설하려는 프랑스의 계획과 달리, 미국의 설계는 프랑스 설계에 문제를 일으켰던 범위를 넘어 배를 들어 올리기 위한 일련의 갑문을 특징으로 했습니다. 미국의 설계는 성공적이었고 1914년 8월 15일에 개통되었습니다. 건설 기간 동안 약 152,910,972 입방미터의 굴착물을 운반하는 데 철도 차량이 사용되었으며 전체 프로젝트에서 27,500명의 목숨을 앗아갔습니다.'),
			('TXT_KEY_BUILDING_PANAMA_CANAL_HELP',	'모든 해안 도시:[NEWLINE][ICON_BULLET][ICON_CARGO_SHIP] 교역로 사거리 +100%.[NEWLINE][ICON_BULLET]들어오는 국제 [ICON_INTERNATIONAL_TRADE] 교역로는 [ICON_INTERNATIONAL_TRADE] 교역로 소유자에게 +3 [ICON_GOLD]을 부여합니다.[NEWLINE][ICON_BULLET]국제 [ICON_CARGO_SHIP] 교역로는 +3 [ICON_GOLD] 금을 얻습니다.'),
			('TXT_KEY_PROMOTION_PANAMA_CANAL',		'파나마 운하'),
			('TXT_KEY_PROMOTION_PANAMA_CANAL_HELP',	'+1[ICON_ARROW_RIGHT]이동력. [COLOR:255:230:85:255]우호 영토 내에서 회복 시[ENDCOLOR] +10 HP.');

UPDATE Language_ko_KR SET Text = '[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_PANAMA_CANAL_HELP';

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_PANAMA_CANAL_HELP_CUT', '[COLOR_YIELD_FOOD]파나마 운하[ENDCOLOR]를 통한 새로운 통로는 화물 유닛에게 조건을 지시할 수 있게 해줍니다(해안 도시(CC)로 들어오는 국제 [ICON_INTERNATIONAL_TRADE][ICON_INTERNATIONAL_TRADE]: 소유자에게 +3[ICON_GOLD]; CC의 국제 [ICON_CARGO_SHIP][ICON_CARGO_SHIP]: +3[ICON_GOLD]). 세계 무역은 더 짧은 수로 덕분에 이전보다 훨씬 더 먼 곳까지 도달할 수 있습니다(CC의 [ICON_CARGO_SHIP][ICON_CARGO_SHIP]: +100%[ICON_SWAP]). 전체 해양 산업을 부양하기 위해 그들의 안전에 신경 써야 합니다([COLOR_WATER_TEXT]파나마 운하[ENDCOLOR]/[COLOR_YIELD_GOLD]해상[ENDCOLOR])(+3[ICON_PRODUCTION]; +2[ICON_GOLD]/모든 [COLOR_YIELD_FOOD]항만[ENDCOLOR], [COLOR_YIELD_FOOD]항구[ENDCOLOR]).';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]최소 해안 10타일 지역의 지협[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_PANAMA_CANAL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]최소 해안 10타일 지역의 지협[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_PANAMA_CANAL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]제국주의 완성[ENDCOLOR]; '||Text WHERE Tag ='TXT_KEY_BUILDING_PANAMA_CANAL_HELP' AND EXISTS (SELECT * FROM Community WHERE Type='MW-SETTING-POLICIES' AND Value=1);
----------------------------------------------------
-- Zocalo
INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_ZOCALO',			'소칼로'),
			('TXT_KEY_WONDER_ZOCALO_QUOTE',		'[NEWLINE]"소칼로는 트라팔가 광장의 적어도 4배 크기의 웅장한 공간으로, 한쪽에는 국립 궁전이, 다른 쪽에는 거대한 대성당이 있으며, 한 구석에는 에르난 코르테스와 정복자들에 의해 잔인하게 파괴된 옛 아즈텍 도시의 일부가 있습니다."[NEWLINE] - 제러미 코빈[NEWLINE]'),
			('TXT_KEY_BUILDING_ZOCALO_PEDIA',	'공식적으로 헌법 광장(Plaza de la Constitución)으로 알려진 소칼로는 멕시코시티의 중앙 광장이자 세계에서 가장 큰 공공 광장 중 하나입니다. 그 역사는 700년 이상 거슬러 올라가며 아즈텍 도시 테노치티틀란의 주요 의식 중심지에서 유래했습니다. 16세기 초 스페인 정복 이후 광장은 재설계되어 식민지 수도의 심장부가 되었으며 정치, 종교, 사회적 허브 역할을 했습니다. 수 세기 동안 이곳은 정치 집회, 군사 퍼레이드, 문화 행사를 포함한 수많은 역사적 사건의 현장이었으며 멕시코의 진화하는 정체성을 반영합니다. 원래 미완성 기념비의 기단을 가리키던 "소칼로"라는 이름은 광장 자체와 동의어가 되었습니다. [NEWLINE][NEWLINE]소칼로는 메트로폴리탄 대성당, 국립 궁전, 역사적인 식민지 시대 건물을 포함하여 멕시코시티의 가장 중요한 랜드마크로 둘러싸여 있어 엄청난 건축적, 문화적 중요성을 지니고 있습니다. 광장의 열린 공간은 대중 집회, 콘서트, 축제, 시위에 사용되어 시민 생활의 역동적인 중심지가 되었습니다. 광대한 규모와 역사적 층위를 가진 소칼로는 멕시코시티의 물리적, 상징적 심장부 역할을 할 뿐만 아니라 단일 상징적 공간에 히스패닉 이전, 식민지, 현대의 영향을 혼합하여 국가의 풍부한 문화유산을 구현합니다.'),
			('TXT_KEY_BUILDING_ZOCALO_HELP',	'');
			
INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_ZOCALO_HELP_CUT', '[COLOR_YIELD_FOOD]소칼로[ENDCOLOR]는 피비린내 나는 과거를 생생하게 유지합니다(+2[ICON_TOURISM]; +2[ICON_TOURISM]/모든 [COLOR_YIELD_FOOD]기념비[ENDCOLOR]). 이곳은 다양한 조치([COLOR_YIELD_GOLD]무료 [ICON_DIPLOMAT][ENDCOLOR]; [ICON_DIPLOMAT] 슬롯 1개)를 통해 더 발전된 문명으로 대체된 부족들의 중요한 종교 시설(+2[ICON_PEACE])을 주최했습니다. 그들의 재 위에 건설된 이 거대한 광장은 이제 우리 시대의 이 어려운 기억을 기념하는 종교(+1[ICON_PEACE]/[ICON_DIPLOMAT][ICON_DIPLOMAT]) 및 외교 중심지(+10%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]외교[ENDCOLOR]) 역할을 합니다.';
				
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]평지[ENDCOLOR]; 지형: [COLOR_CYAN]평원[ENDCOLOR]; 지물: [COLOR_CYAN]호수[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_ZOCALO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]평지[ENDCOLOR]; 지물: [COLOR_CYAN]호수[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_ZOCALO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Kew Gardens
INSERT INTO Language_ko_KR 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_KEW_GARDENS',		'큐 왕립 식물원'),
			('TXT_KEY_WONDER_KEW_GARDENS_QUOTE',	'[NEWLINE]"다른 사람이 깨어나기 전에 자연 속에 서 있으면 대부분의 사람은 믿을 만한 것을 찾는다."[NEWLINE] - 토르 유달[NEWLINE]'),
			('TXT_KEY_BUILDING_KEW_GARDENS_PEDIA',	'공식적으로 큐 왕립 식물원(Royal Botanic Gardens, Kew)으로 알려진 큐 가든은 영국 런던 남서부에 위치한 세계적으로 유명한 식물원입니다. 그 기원은 1759년 조지 3세의 어머니인 아우구스타 공주가 큐에 왕실 정원을 설립한 때로 거슬러 올라갑니다. 수 세기 동안 이곳은 개인 왕실 사유지에서 식물 연구 및 보존에 전념하는 과학 및 공공 기관으로 발전했습니다. 큐 가든은 대영제국 기간 동안 전 세계의 식물을 수집하고 분류하여 식물 연구, 농업 및 원예에 기여하는 데 중추적인 역할을 했습니다. 1840년 정원은 일반 대중에게 공식적으로 개방되었으며, 2003년 큐는 역사적, 과학적, 문화적 중요성을 인정받아 유네스코 세계문화유산으로 지정되었습니다. [NEWLINE][NEWLINE]300에이커가 넘는 큐 가든은 정형식 정원, 삼림 지대, 다양한 기후의 수천 가지 식물 종을 수용하는 상징적인 팜 하우스(Palm House)와 템퍼레이트 하우스(Temperate House)와 같은 광범위한 온실을 포함하여 놀랍도록 다양한 풍경을 특징으로 합니다. 정원은 식물 연구, 보존 및 교육의 중심지이며 세계에서 가장 크고 다양한 식물 컬렉션 중 하나를 유지하고 있습니다. 방문객들은 테마 정원, 나무 꼭대기 산책로, 장식용 연못을 탐험할 수 있어 과학적 자원이자 인기 있는 휴양지가 되었습니다. 큐 가든은 자연의 아름다움, 과학적 탐구, 문화유산의 교차점을 보여주며 전 세계의 식물학자, 원예가 및 방문객 세대에게 영감을 줍니다.'),
			('TXT_KEY_BUILDING_KEW_GARDENS_HELP',	'');
			
INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_KEW_GARDENS_HELP_CUT', '수천 가지 식물과 그들의 행동을 연구하려는 인간의 헌신으로 가득 찬 [COLOR_YIELD_FOOD]큐 왕립 식물원[ENDCOLOR](10%[ICON_FOOD] -> [ICON_RESEARCH])은 풍부한 데이터베이스를 생성하고 제국 내 [COLOR_CITY_BROWN]농장[ENDCOLOR] 효율성을 높이려고 노력합니다(+1[ICON_FOOD], +1[ICON_RESEARCH], +1[ICON_TOURISM]/[COLOR_CITY_BROWN]제국 내 타일[ENDCOLOR]). 당신의 연구 프로그램은 장려된 생태 방문객들에 의해 크게 향상될 수 있으며(+3[ICON_GREAT_SCIENTIST]) 새롭고 놀라운 종을 보고 싶어 하는 사람들을 위한 관광 명소 역할을 할 수 있습니다(10%[ICON_RESEARCH] -> [ICON_TOURISM]).';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]합리 완성[ENDCOLOR]; 건물: [COLOR_CYAN]농업 기업[ENDCOLOR], [COLOR_CYAN]정원[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_KEW_GARDENS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]합리 완성[ENDCOLOR]; 건물: [COLOR_CYAN]농업 기업[ENDCOLOR], [COLOR_CYAN]정원[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_KEW_GARDENS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Monte Carlo Casino
INSERT INTO Language_ko_KR 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_MONTE_CARLO',		'몬테카를로 카지노'),
			('TXT_KEY_WONDER_MONTE_CARLO_QUOTE',	'[NEWLINE]"운은 하인이었지 주인이 아니었다. 운은 어깨를 으쓱하며 받아들이거나 최대한 이용해야 했다. 그러나 그것이 무엇인지 이해하고 인식해야 했으며 확률에 대한 잘못된 평가와 혼동해서는 안 되었다. 도박에서 치명적인 죄는 나쁜 플레이를 불운으로 착각하는 것이기 때문이다."[NEWLINE] - 이안 플레밍[NEWLINE]'),
			('TXT_KEY_BUILDING_MONTE_CARLO_PEDIA',	'공식적으로 카지노 드 몬테카를로(Casino de Monte-Carlo)로 알려진 몬테카를로 카지노는 모나코 공국에 위치한 상징적인 도박 및 엔터테인먼트 단지입니다. 그 역사는 19세기 중반 모나코의 샤를 3세가 관광을 장려하고 도박장을 설립하여 국가를 재정적 어려움에서 구하려고 했을 때로 거슬러 올라갑니다. 카지노는 1863년에 공식적으로 문을 열었으며 파리 오페라 하우스를 설계한 유명한 건축가 샤를 가르니에가 설계했습니다. 시간이 지남에 따라 이곳은 사치의 상징이 되어 유럽 귀족, 부유한 관광객, 유명 인사를 끌어들였습니다. 몬테카를로 카지노는 모나코 경제에 크게 기여했을 뿐만 아니라 모나코를 지중해 연안의 화려하고 세간의 이목을 끄는 목적지로 만드는 데 도움을 주었습니다. [NEWLINE][NEWLINE]건축학적으로 몬테카를로 카지노는 웅장한 홀, 복잡한 프레스코화, 대리석 계단, 화려한 샹들리에를 특징으로 하는 호화로운 벨 에포크 스타일로 유명합니다. 이 단지에는 게임 룸, 극장, 정원이 포함되어 있어 엔터테인먼트와 미적 웅장함을 결합합니다. 게임 룸에서는 다양한 테이블 게임과 슬롯머신을 제공하며 주변 지역에는 고급 호텔, 부티크, 유명한 항구가 있어 세련미와 독점성의 경험을 향상시킵니다. 도박 장소로서의 역할 외에도 카지노는 영화, 문학, 대중적 상상력에 영감을 주는 문화적 랜드마크가 되었으며 몬테카를로와 관련된 우아함, 부, 매력을 계속해서 보여줍니다.'),
			('TXT_KEY_BUILDING_MONTE_CARLO_HELP',	'');
			
INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_MONTE_CARLO_HELP_CUT', '[COLOR_YIELD_FOOD]몬테카를로[ENDCOLOR]의 카지노는 빠른 재산 증식으로 사람들을 유혹합니다(20%[ICON_GOLD] 소비 -> [ICON_TOURISM]). 도박의 수도(+10%[ICON_GOLD][ICON_GOLD])는 관광객과 그들의 돈을 가장 유명한 [COLOR_YIELD_FOOD]호텔[ENDCOLOR]([COLOR_YIELD_FOOD]무료[ENDCOLOR]; +2[ICON_GOLD][ICON_GOLD], +2[ICON_TOURISM][ICON_TOURISM])로 끌어들이며, 그 존재가 파괴적이거나 때로는 그늘진 거래를 덮을지라도 제국의 이익을 위해 이 모든 것을 눈감아주어야 합니다(33%[ICON_TOURISM] -> [ICON_GOLD]).';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]예술 완성[ENDCOLOR]; 지형: [COLOR_CYAN]산 (범위 2)[ENDCOLOR], [COLOR_CYAN]해안[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_MONTE_CARLO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]예술 완성[ENDCOLOR]; 지형: [COLOR_CYAN]해안[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_MONTE_CARLO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Ruhr Valley
INSERT INTO Language_ko_KR 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_RUHR_VALLEY',		'루르 계곡'),
			('TXT_KEY_WONDER_RUHR_VALLEY_QUOTE',	'[NEWLINE]"공학 없는 예술은 꿈꾸는 것이고, 예술 없는 공학은 계산하는 것이다."[NEWLINE] - 스티븐 로버츠[NEWLINE]'),
			('TXT_KEY_BUILDING_RUHR_VALLEY_PEDIA',	'독일 서부 루르강을 따라 위치한 루르 계곡은 유럽에서 가장 역사적으로 중요한 산업 지역 중 하나입니다. 산업 허브로서의 발전은 19세기 초 풍부한 석탄 매장량과 원자재 운송을 용이하게 한 철도 및 수로의 확장에 힘입어 시작되었습니다. 19세기 후반과 20세기 초반까지 루르 계곡은 독일의 석탄, 철강, 화학 산업의 심장부가 되어 급속한 도시화와 경제 성장을 주도했습니다. 이 지역은 산업 생산량으로 인해 두 차례의 세계 대전 동안 중심적인 역할을 했으며 전략적으로 중요하고 분쟁 중 빈번한 표적이 되었습니다. 제2차 세계 대전 이후 루르 계곡은 특히 "라인강의 기적(Wirtschaftswunder)" 기간 동안 독일 전후 경제 회복의 상징이 되었으며 오늘날에도 중요한 경제 지역으로 남아 있습니다. [NEWLINE][NEWLINE]루르 계곡의 풍경은 산업 인프라, 도심, 문화 유적지가 독특하게 조화를 이루고 있습니다. 석탄 광산, 제철소, 공장, 광범위한 철도 네트워크와 함께 산업 운송에 필수적인 강과 운하가 특징입니다. 시간이 지남에 따라 많은 이전 산업 현장이 박물관, 문화 센터, 레크리에이션 지역으로 변모하여 중공업에서 서비스 지향 및 문화적 용도로의 전환을 반영합니다. 에센, 도르트문트, 뒤스부르크와 같은 도시는 이러한 변화를 보여주며 역사적인 산업 건축과 현대적인 도시 개발을 결합합니다. 따라서 루르 계곡은 독일 산업화의 역사적 엔진이자 산업 유산 보존 및 도시 재생의 현대적 사례를 모두 나타냅니다.'),
			('TXT_KEY_BUILDING_RUHR_VALLEY_HELP',	'');
			
INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_RUHR_VALLEY_HELP_CUT', '풍요로운 [COLOR_YIELD_FOOD]루르 계곡[ENDCOLOR] 광역 도시권(+1[ICON_SWAP] 도시 작업 범위)은 말 그대로 국가 전체의 산업 심장부이며, 대지모신이 숨겨둔 부 덕분에 국가를 살아있게 합니다(+10%[ICON_PRODUCTION][ICON_PRODUCTION]). 새로운 인프라와 최근 발견된 [COLOR_GREY]석탄[ENDCOLOR] 매장지(1[ICON_RES_COAL](3) 생성; +1[ICON_GOLD], +1[ICON_GOLDEN_AGE]/[ICON_RES_COAL][ICON_RES_COAL])를 통해 생산성을 완벽하게 높이고 잘 훈련된 인력을 모든 [COLOR_CITY_BROWN]광산[ENDCOLOR]과 [COLOR_CITY_BROWN]채석장[ENDCOLOR]에 배치합니다(+1[ICON_PRODUCTION]/[COLOR_CITY_BROWN]제국 내 타일[ENDCOLOR]).';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]산업 완성[ENDCOLOR]; 지물: [COLOR_CYAN]강[ENDCOLOR]; 도시: [COLOR_CYAN][ICON_RES_COAL]을 위한 공간[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_RUHR_VALLEY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]산업 완성[ENDCOLOR]; 지물: [COLOR_CYAN]강[ENDCOLOR]; 도시: [COLOR_CYAN][ICON_RES_COAL]을 위한 공간[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_RUHR_VALLEY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Darjeeling Himalayan Railway
INSERT INTO Language_ko_KR 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_DARJEELING',			'다르질링 히말라야 철도'),
			('TXT_KEY_WONDER_DARJEELING_QUOTE',		'[NEWLINE]"전통적인 영국인은 실론, 아삼, 다르질링의 주입물로 피가 대체될 때까지 차를 마신다."[NEWLINE] - 펜넬 허드슨[NEWLINE]'),
			('TXT_KEY_BUILDING_DARJEELING_PEDIA',	'종종 "장난감 기차"라고 불리는 다르질링 히말라야 철도(DHR)는 인도 서벵골주의 역사적인 협궤 철도입니다. 철도 건설은 1879년 영국 식민 통치하에 시작되어 1881년에 완공되어 뉴 잘파이구리 평원과 다르질링 언덕 역을 연결했습니다. 이 철도는 히말라야의 험난한 산악 지형을 탐색하도록 설계되었으며 일련의 루프, 지그재그, 가파른 경사를 사용하여 2,000미터(6,600피트) 이상을 올라갑니다. 그 생성은 경제적, 행정적 목표에 의해 주도되었습니다. 무역을 촉진하고 차와 목재를 운송하며 식민지 시대 영국인들에게 인기 있는 휴양지였던 언덕 역에 더 쉽게 접근할 수 있도록 하는 것입니다. 1999년 다르질링 히말라야 철도는 공학적 독창성과 역사적 중요성을 인정받아 유네스코 세계문화유산으로 지정되었습니다. [NEWLINE][NEWLINE]DHR은 협궤 선로, 증기 기관차, 무성한 차 정원, 숲, 그림 같은 산 풍경을 통과하는 경치 좋은 경로로 유명합니다. 여정은 약 88km(55마일)에 걸쳐 있으며 기차가 가파른 오르막을 관리하면서 주변 계곡과 칸첸중가 봉우리의 탁 트인 전망을 제공하는 나선형 선로인 바타시아 루프와 같은 주목할 만한 공학적 특징을 포함합니다. 기능적 역할 외에도 철도는 문화 및 관광 아이콘이 되어 향수를 불러일으키는 여행 경험과 식민지 시대 공학을 엿보고자 하는 전 세계 방문객을 끌어들이고 있습니다. 다르질링 히말라야 철도는 오늘날에도 계속 운영되며 역사적 유산과 숨 막히는 자연경관을 조화시키고 있습니다.'),
			('TXT_KEY_BUILDING_DARJEELING_HELP',	'모든 도시에서 작업하는 산 타일에서 +1 [ICON_FOOD] 식량, [ICON_PRODUCTION] 생산력, [ICON_CULTURE] 문화 및 [ICON_TOURISM] 관광.'),
			('TXT_KEY_PROMOTION_DARJEELING',		'장난감 기차'),
			('TXT_KEY_PROMOTION_DARJEELING_HELP',	'유닛이 [COLOR:255:230:85:255]산에 진입 가능[ENDCOLOR].');
			
INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_DARJEELING_HELP_CUT', '[COLOR_YIELD_FOOD]다르질링 히말라야 철도[ENDCOLOR]는 다채로운 명소이며(+3[ICON_TOURISM]) 험난한 [COLOR_CITY_BLUE]산악[ENDCOLOR] 지역의 교통 소외를 줄여줍니다(+1[ICON_FOOD], +1[ICON_PRODUCTION], +1[ICON_CULTURE], +1[ICON_TOURISM]/[COLOR_CITY_BLUE]제국 내 타일[ENDCOLOR]). 제국의 산업화를 촉진하고(+2[ICON_PRODUCTION]; +15%[ICON_GOLD]/[ICON_CONNECTED][ICON_CONNECTED], [ICON_INDUSTRIAL_CONNECTED][ICON_INDUSTRIAL_CONNECTED]) 민간 용도 외에도 예외적인 상황에서 이 즐거운 기차 노선은 군대를 예상치 못한 곳으로 빠르게 수송할 수 있습니다([COLOR_WATER_TEXT]장난감 기차[ENDCOLOR]/[COLOR_YIELD_GOLD]보병 군사[ENDCOLOR]).';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]산 2개 (범위 3)[ENDCOLOR]; 건물: [COLOR_CYAN]기차역[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_DARJEELING_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]산 (범위 2)[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_DARJEELING_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Banff Springs Hotel
INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_BANFF',			'밴프 스프링스 호텔'),
			('TXT_KEY_WONDER_BANFF_QUOTE',		'[NEWLINE]"국립공원은 놀이터가 아닙니다. 자연을 위한 성역이며 자연의 조건 그대로 자연을 받아들일 인간을 위한 성역입니다."[NEWLINE] - 마이클 프롬[NEWLINE]'),
			('TXT_KEY_BUILDING_BANFF_PEDIA',	'캐나다 앨버타주 밴프 국립공원에 위치한 밴프 스프링스 호텔은 종종 "로키 산맥의 성"이라고 불리는 역사적인 고급 호텔입니다. 그 기원은 1888년 캐나다 태평양 철도가 철도를 따라 관광을 장려하고 캐나다 로키 산맥으로 방문객을 유치하기 위해 건설을 의뢰했을 때로 거슬러 올라갑니다. 처음에는 건축가 브루스 프라이스가 설계했고 나중에 다른 여러 사람이 확장한 이 호텔은 부유함과 이 지역의 자연미의 상징이 되었습니다. 수십 년 동안 왕족, 유명 인사, 고위 인사들을 맞이했으며 캐나다 서부 관광 개발에 중요한 역할을 했습니다. 그 역사는 캐나다 태평양 철도의 야망과 캐나다의 황무지를 국제 여행객들이 접근하기 쉽고 매력적으로 만들려는 광범위한 움직임을 모두 반영합니다. [NEWLINE][NEWLINE]건축학적으로 밴프 스프링스 호텔은 스코틀랜드 남작 스타일과 샤토 스타일 디자인을 결합하여 가파른 경사 지붕, 포탑, 주변 산악 풍경과 조화롭게 어우러지는 석조 파사드를 갖추고 있습니다. 호텔은 보우강 근처에 있어 로키 산맥의 멋진 전망을 제공하며 우아한 인테리어, 고급스러운 숙박 시설, 골프 코스, 스파, 등산로를 포함한 광범위한 레크리에이션 시설을 갖추고 있습니다. 럭셔리 리조트로서의 역할 외에도 이 호텔은 자연의 화려함, 건축적 웅장함, 초기 캐나다 관광 이니셔티브의 융합을 나타내는 문화 및 역사적 랜드마크가 되었습니다. 오늘날에도 로키 산맥에서 휴식과 몰입형 경험을 모두 추구하는 전 세계 방문객을 계속 끌어들이고 있습니다.'),
			('TXT_KEY_BUILDING_BANFF_HELP',		'');
			
INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_BANFF_HELP_CUT', '기념비적인 [COLOR_CITY_BLUE]산[ENDCOLOR]으로 가득 찬 놀라운 자연 공원에 위치한 [COLOR_YIELD_FOOD]밴프 스프링스 호텔[ENDCOLOR](+5[ICON_GOLD], +5[ICON_TOURISM]/[COLOR_CITY_BLUE]타일[ENDCOLOR])은 환경과의 공생(+5[ICON_TOURISM]) 속에서 경제를 발전시키는 방법(+1[ICON_GREAT_MERCHANT]; +1[ICON_GOLD], +1[ICON_TOURISM]/[ICON_GREAT_MERCHANT][ICON_GREAT_MERCHANT])을 보여주는 완벽한 예입니다. 이러한 [COLOR_YIELD_FOOD]호텔[ENDCOLOR]([COLOR_YIELD_FOOD]무료[ENDCOLOR])은 철도 회사의 후원을 받으며 매우 중요한 기능 하나를 가지고 있습니다. 바로 긴 여행을 즐겁게 만드는 것입니다(-1[ICON_HAPPINESS_3] 지루함). 이제 스타일리시하게 여행할 수 있습니다!';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]산업 완성[ENDCOLOR]; 지형: [COLOR_CYAN]산 (범위 2)[ENDCOLOR], [COLOR_CYAN]툰드라[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_BANFF_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]산업 완성[ENDCOLOR]; 지형: [COLOR_CYAN]툰드라[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_BANFF_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Orszaghaz
INSERT INTO Language_ko_KR 
			(Tag,										Text) 
VALUES		('TXT_KEY_BUILDING_ORSZAGHAZ',				'국회의사당'),
			('TXT_KEY_WONDER_ORSZAGHAZ_QUOTE',			'[NEWLINE]"자치에는 자유가 있고, 자유에는 정의와 애국심이 있다."[NEWLINE] - 코슈트 러요시[NEWLINE]'),
			('TXT_KEY_BUILDING_ORSZAGHAZ_PEDIA',		'오르사그하즈, 즉 헝가리 국회의사당은 헝가리 국회의 소재지이자 부다페스트의 가장 상징적인 랜드마크 중 하나입니다. 건설은 1885년에 시작되어 헝가리가 오스트리아-헝가리 제국의 일부였던 1904년에 완료되었습니다. 이 건물은 건축가 임레 슈타인들이 고딕 부흥 양식으로 설계하여 국가적 자부심과 헝가리의 성장하는 정치 및 문화적 정체성을 반영했습니다. 다뉴브강 유역에 위치한 오르사그하즈는 기능적인 정부 청사일 뿐만 아니라 헝가리의 주권, 웅장함, 건축적 성취의 상징으로 의도되었습니다. 수년 동안 정치적 격변, 혁명, 의식을 포함한 중요한 역사적 사건을 목격하여 국가적 상징으로서의 지위를 굳혔습니다. [NEWLINE][NEWLINE]건축학적으로 오르사그하즈는 뾰족한 아치, 첨탑, 1896년 건국 천년을 상징하는 96미터 높이의 눈에 띄는 중앙 돔을 특징으로 하는 정교한 고딕 부흥 디자인으로 유명합니다. 건물 길이는 268미터이며 대계단, 화려한 방, 헝가리 왕관 보석을 포함하여 거의 700개의 방이 있습니다. 외관은 헝가리 통치자와 국가적 인물의 조각상으로 장식되어 있으며 내부는 복잡한 프레스코화, 스테인드글라스, 풍부하게 장식된 홀을 자랑합니다. 정치적 기능 외에도 오르사그하즈는 주요 관광 명소이자 문화 기념물로서 헝가리의 건축 유산, 역사적 연속성, 국가 정체성을 나타냅니다.'),
			('TXT_KEY_BUILDING_ORSZAGHAZ_HELP',			''),
			('TXT_KEY_GREAT_WORK_HOLY_CROWN',			'헝가리의 성관'),
			('TXT_KEY_GREAT_WORK_HOLY_CROWN_QUOTE',		'[NEWLINE]당신은 나의 겸손한 능력을 넘어서는 것을 원하지만, 나는 전능하신 하나님의 자비와 긍휼을 신뢰합니다.[NEWLINE] - 성 이슈트반[NEWLINE]');
			
INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_ORSZAGHAZ_HELP_CUT', '[COLOR_YIELD_FOOD]국회의사당[ENDCOLOR]은 통일을 축하하고(+15%[ICON_GOLDEN_AGE][ICON_GOLDEN_AGE]) 역사를 찬양합니다(1[ICON_GW_ART]; [COLOR_CULTURE_STORED]헝가리의 성관[ENDCOLOR]). 그 위엄을 사용하여 민주적 규칙이 세상을 어떻게 더 좋게 만들 수 있는지(+1[ICON_DIPLOMAT] 연맹 투표), 그리고 정치에서 혼자 행동하는 것이 가장 효율적인 해결책이 아니라는 것을 보여줍니다(+1[ICON_DIPLOMAT] 연맹 투표/2 우호 선언 또는 2 방위 조약). 첫 번째 의회 회기([COLOR_MAGENTA]무료 정책[ENDCOLOR])부터 당신의 통치는 공고해지며 새로운 시대의 빛을 퍼뜨립니다.';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]평등[ENDCOLOR]; 지물: [COLOR_CYAN]강[ENDCOLOR]; 건물: [COLOR_CYAN]경찰대[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_ORSZAGHAZ_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]평등[ENDCOLOR]; 지물: [COLOR_CYAN]강[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_ORSZAGHAZ_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);		
----------------------------------------------------
-- Neuschwanstein
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_WONDER_NEUSCHWANSTEIN_HELP_CUT', '[COLOR_YIELD_FOOD]노이슈반슈타인 성[ENDCOLOR]의 건설은 어려운 과제이며 완벽한 국고 관리가 필요하지만(+1[ICON_GREAT_MERCHANT]), 완료되면 제국을 더 잘 통제하고 경제를 크게 부양할 수 있습니다(+6[ICON_GOLD]). 산 위에 노출된 이 아름다운 진주(+4[ICON_CULTURE])는 멋진 [COLOR_YIELD_FOOD]성[ENDCOLOR]을 건설하는 방법(+1[ICON_GOLD]; +1[ICON_CULTURE]; +1[ICON_HAPPINESS_1])과 그로부터 이익을 얻는 방법을 다른 도시들에 보여주는 본보기가 될 수 있습니다.');
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]산 (범위 2)[ENDCOLOR]; 지물: [COLOR_CYAN]담수[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_NEUSCHWANSTEIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]산 (범위 2)[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_NEUSCHWANSTEIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Soho Foundry
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_BUILDING_SOHO_FOUNDRY_HELP_CUT', '모든 제국은 경쟁자들에게 뒤처지지 않기 위해 확실한 산업적 활력이 필요하므로(+5[ICON_PRODUCTION]), [COLOR_YIELD_FOOD]공장[ENDCOLOR]([COLOR_YIELD_FOOD]무료[ENDCOLOR]) 건설은 필수입니다. 그중 하나인 [COLOR_YIELD_FOOD]소호 주조소[ENDCOLOR]는 첨단 증기 엔진을 만드는 거대한 제조 단지입니다(+1[ICON_GREAT_ENGINEER]). 이 전략적 투자는 [COLOR_GREY]석탄[ENDCOLOR]에 크게 의존하지만, 다행히도 최근의 노력과 수많은 성공적인 지질 조사 덕분에 채굴을 위한 몇 가지 새로운 유망한 장소를 찾았습니다(+4[ICON_RES_COAL]).');
				
UPDATE Language_ko_KR SET Text = '지물: [COLOR_CYAN]강[ENDCOLOR], [COLOR_CYAN]숲[ENDCOLOR]/[COLOR_CYAN]정글[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_SOHO_FOUNDRY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지물: [COLOR_CYAN]숲[ENDCOLOR]/[COLOR_CYAN]정글[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_SOHO_FOUNDRY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Louvre
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_WONDER_LOUVRE_HELP_CUT', '[COLOR_YIELD_FOOD]루브르 박물관[ENDCOLOR]은 빛나는 선반을 채우고 세계의 문화 수도가 되기 위해 새로운 전시품을 찾습니다(+2[ICON_CULTURE]; 테마 보너스 시 4[ICON_GW_ART]: [ICON_CULTURE]). 최근의 발견은 현장에서 일하는 전문가 직원(2 [COLOR_YIELD_GOLD]무료 고고학자[ENDCOLOR])과 주요 지하 본부에서 일하는 직원([COLOR_YIELD_GOLD]무료 [ICON_GREAT_ARTIST][ENDCOLOR])을 고용할 기회를 제공합니다. 마침내 당신의 꿈이 이루어질 수 있습니다. 누구도 상상하지 못했던 가장 훌륭하고 부유한 [COLOR_YIELD_FOOD]박물관[ENDCOLOR]([COLOR_YIELD_FOOD]무료[ENDCOLOR])의 주인이 되십시오.');
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]예술 완성[ENDCOLOR]; 시설: [COLOR_CYAN]랜드마크[ENDCOLOR]; 걸작: [COLOR_CYAN]3[ICON_GW_ART][ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_LOUVRE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]예술 완성[ENDCOLOR]; 시설: [COLOR_CYAN]랜드마크[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_LOUVRE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Palace of Westminster
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_WONDER_BIG_BEN_HELP_CUT', '[COLOR_YIELD_FOOD]웨스트민스터 궁전[ENDCOLOR]은 시민들의 삶을 개선합니다(-1[ICON_HAPPINESS_3] 빈곤). 새로운 법률과 칙령을 도입하여 제국의 경제를 부양하고(+4[ICON_GOLD]), 역동적으로 변화하는 시장에서 사업을 운영할 수 있는 새로운 가능성을 제공할 수 있습니다(+2[ICON_GREAT_MERCHANT]; [COLOR_YIELD_GOLD]무료 [ICON_GREAT_MERCHANT][ENDCOLOR]). "해가 지지 않는 제국"을 통치하면 세계에서 가장 영향력 있는 지도자가 되어 새롭고 가치 있는 동맹을 더 쉽게 찾을 수 있습니다(+1[ICON_DIPLOMAT] 연맹 투표/시작 시 6[ICON_CITY_STATE]마다).');
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]외교 완성[ENDCOLOR]; 지물: [COLOR_CYAN]강[ENDCOLOR]; 플레이어: [COLOR_CYAN]2 [ICON_CITY_STATE] 동맹[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_BIG_BEN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]외교 완성[ENDCOLOR]; 지물: [COLOR_CYAN]강[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_BIG_BEN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Eiffel Tower
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_WONDER_EIFFEL_TOWER_HELP_CUT',	'[COLOR_YIELD_FOOD]에펠탑[ENDCOLOR] - 상징, 랜드마크, 기념비(+1[ICON_CULTURE]). 이것은 설립자의 조상들, 즉 존엄성과 생존권을 위해 싸워 세상을 완전히 바꾼 평범한 사람들이 얻은 자유를 기념하는 것입니다(-10%[ICON_CULTURE] 정책 비용). 이제 이곳은 방문객들이 돈을 쓰거나 사업을 하도록 유도하는 세계적인 명소 역할을 합니다(+2[ICON_GREAT_MERCHANT]). 그리고 때때로 그들은 이 시대를 초월한 창조물의 아름다움에 놀라 조금 더 오래 머물기도 합니다.');
				
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]평지[ENDCOLOR]; 지형: [COLOR_CYAN]초원[ENDCOLOR]; 개발된 자원: [ICON_RES_IRON].'||Text WHERE Tag ='TXT_KEY_WONDER_EIFFEL_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]평지[ENDCOLOR]; 지형: [COLOR_CYAN]초원[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_EIFFEL_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Brandenburg Gate
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_WONDER_BRANDENBURG_GATE_HELP_CUT',	'최근 성공적으로 끝난 전쟁(+15 전역 경험치/[COLOR_YIELD_GOLD]군사[ENDCOLOR]) 후 호화롭게 건설된 [COLOR_YIELD_FOOD]브란덴부르크 문[ENDCOLOR]은 대륙 최강 군대의 지도자로서 당신의 입지를 강화합니다([COLOR_YIELD_GOLD]무료 [ICON_GREAT_GENERAL][ENDCOLOR]). 패배한 적들로부터 탈취한 전리품은 새로운 영토에 대한 통치를 공고히 하는 구조적 변화를 가능하게 할 것이며(+10[ICON_SILVER_FIST]), 당신 편으로 이동한 새로운 참모들은 확실히 빠른 과학적 돌파구에 기여할 것입니다(+2[ICON_GREAT_SCIENTIST]).');
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]제국주의 완성[ENDCOLOR]; 타일: [COLOR_CYAN]평지[ENDCOLOR]; 시설: [COLOR_CYAN]성채[ENDCOLOR]/[COLOR_CYAN]요새[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_BRANDENBURG_GATE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]제국주의 완성[ENDCOLOR]; 시설: [COLOR_CYAN]성채[ENDCOLOR]/[COLOR_CYAN]요새[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_BRANDENBURG_GATE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
----------------------------------------------------
-- Polar Expedition
INSERT INTO Language_ko_KR 
			(Tag,										Text)
VALUES		('TXT_KEY_BUILDING_POLAR_EXPEDITION',		'극지 탐험'),
			('TXT_KEY_WONDER_POLAR_EXPEDITION_QUOTE',	'[NEWLINE]"모험은 단지 나쁜 계획일 뿐이다."[NEWLINE] - 로알 아문센[NEWLINE]'),
			('TXT_KEY_BUILDING_POLAR_EXPEDITION_PEDIA',	'극지 탐험은 주로 탐험, 과학 연구 및 지리적 발견을 위해 수행되는 지구의 극지방(북쪽의 북극과 남쪽의 남극)으로의 조직적인 여행을 말합니다. 극지 탐험의 역사는 수 세기 전으로 거슬러 올라가며, 16세기와 17세기의 초기 북극 탐험은 북서 항로 발견에 중점을 두었습니다. 19세기와 20세기 초는 "극지 탐험의 영웅 시대"로, 프리드쇼프 난센, 로버트 팔콘 스콧, 로알 아문센, 어니스트 섀클턴이 이끄는 유명한 탐험이 있었습니다. 이 임무들은 북극이나 남극에 도달하고, 미지의 영토를 도표화하고, 극한 환경을 연구하는 것을 목표로 했습니다. 극지 탐험은 혹독한 날씨, 위험한 얼음, 제한된 보급품, 고립을 포함하여 종종 위험했지만 기상학, 빙하학, 극지 생물학을 포함한 과학적 지식에 크게 기여했습니다. [NEWLINE][NEWLINE]현대 극지 탐험은 탐험과 첨단 과학 연구를 결합하여 특수 장비, 위성 내비게이션, 개선된 생존 기술을 사용합니다. 현대 탐험은 극지에 도달하는 것 외에도 기후 변화, 야생 동물, 빙상 역학을 연구하여 환경 변화와 지구 온난화에 대한 귀중한 데이터를 제공합니다. 국제 조약에 따른 남극 기지와 같은 극지 기지와 연구 기지는 연중 과학 작업을 용이하게 합니다. 과학적 목적 외에도 극지 탐험은 대중의 상상력을 사로잡아 인간의 인내, 호기심, 지구상에서 가장 극단적이고 외딴 지역을 탐험하려는 추진력을 상징합니다. 그들은 계속해서 모험, 국제 협력, 지구의 극지 환경에 대한 더 깊은 이해에 영감을 줍니다.'),
			('TXT_KEY_BUILDING_POLAR_EXPEDITION_HELP',	'');
			
INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_POLAR_EXPEDITION_HELP_CUT', '[COLOR_YIELD_FOOD]극지 탐험[ENDCOLOR]은 방문하지 않은 [COLOR_CITY_BLUE]설원[ENDCOLOR] 지역을 광범위하게 탐험하고(+2[ICON_RESEARCH]/타일) 하얀 덮개에 숨겨진 새로운 지하 [COLOR_GREY]석유[ENDCOLOR] 매장지를 찾습니다(1[ICON_RES_OIL](2) 및 1[ICON_RES_OIL](3) 생성). 그곳에 만들어진 새로운 연구 시설은 지구와 그 역사에 대한 우리의 지식을 확실히 확장할 것입니다(+1[ICON_RESEARCH], +1[ICON_GOLDEN_AGE]/[ICON_GREAT_SCIENTIST][ICON_GREAT_SCIENTIST]).';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]설원[ENDCOLOR]; 도시: [COLOR_CYAN]극지방 근처[ENDCOLOR], [COLOR_CYAN][ICON_RES_OIL]을 위한 공간[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_POLAR_EXPEDITION_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]설원[ENDCOLOR]; 도시: [COLOR_CYAN][ICON_RES_OIL]을 위한 공간[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_POLAR_EXPEDITION_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]합리 완성[ENDCOLOR]; '||Text WHERE Tag ='TXT_KEY_BUILDING_POLAR_EXPEDITION_HELP' AND EXISTS (SELECT * FROM Community WHERE Type='MW-SETTING-POLICIES' AND Value=1);
----------------------------------------------------
-- !!! HERE FINISHED TEXT REWORK
----------------------------------------------------
-- Akihabara Electric Town
INSERT INTO Language_ko_KR 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_AKIHABARA',			'아키하바라 전자상가'),
			('TXT_KEY_WONDER_AKIHABARA_QUOTE',		'[NEWLINE]"이곳은 당신이 가본 가장 미친 아시아 시장과 비슷하지만, 망고스틴을 파는 대신 만화와 마더보드를 팔고 있으며, 판매자들은 강매할 뿐만 아니라 녹음되어 있습니다."[NEWLINE] - 아키하바라에 대한 "론리 플래닛"[NEWLINE]'),
			('TXT_KEY_BUILDING_AKIHABARA_PEDIA',	'일본 도쿄에 위치한 아키하바라 전자상가는 전자 제품, 게임, 오타쿠(애니메이션 및 만화) 문화로 유명한 세계적으로 유명한 지구입니다. 그 기원은 제2차 세계 대전 이후 이 지역이 가전제품과 잉여 군용 무선 장비를 판매하는 허브가 되었을 때로 거슬러 올라갑니다. 수십 년 동안 아키하바라는 컴퓨터, 카메라, 오디오 장비, 나중에는 비디오 게임과 취미용 전자 제품을 제공하는 수많은 상점이 있는 최첨단 기술의 중심지로 발전했습니다. 1980년대와 1990년대까지 이 지구는 전자 제품 시장일 뿐만 아니라 애니메이션, 만화, 비디오 게임 팬들을 위한 문화적 핫스팟으로 명성을 얻어 "전자상가"라는 별명을 얻었습니다. [NEWLINE][NEWLINE]오늘날 아키하바라 전자상가는 현대 상업과 대중문화가 활기차게 섞여 있습니다. 우뚝 솟은 다층 전자 제품 매장은 작은 전문점, 메이드 카페, 게임 아케이드, 애니메이션 상품 매장과 공존하며 기술 애호가와 관광객 모두를 끌어들이는 독특한 분위기를 조성합니다. 이 지역은 또한 기술 혁신과 하위문화의 중심지로서 일본 미디어와 게임 문화를 기념하는 행사, 전시회, 컨벤션을 개최합니다. 쇼핑 외에도 아키하바라는 도쿄의 전통과 현대의 역동적인 융합을 반영하여 일본의 기술력과 세계 대중문화에 미치는 영향을 엿볼 수 있게 해줍니다.'),
			('TXT_KEY_BUILDING_AKIHABARA_HELP',		'');
			
INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_AKIHABARA_HELP_CUT', '[COLOR_YIELD_FOOD]아키하바라 전자상가[ENDCOLOR]는 상인들([ICON_GREAT_MERCHANT] 슬롯 2개; +2[ICON_PRODUCTION]/[ICON_GREAT_MERCHANT][ICON_GREAT_MERCHANT])이 상상할 수 있는 모든 종류의 전자 제품을 판매하는 곳입니다. 이러한 [COLOR_YIELD_FOOD]시장[ENDCOLOR](+1[ICON_PRODUCTION], +2[ICON_GOLD], +1[ICON_CULTURE]/모든 [COLOR_YIELD_FOOD]시장[ENDCOLOR])은 지역적으로 작동하지만, 모든 제품은 [COLOR_CITY_BROWN]세관[ENDCOLOR](+1[ICON_PRODUCTION], +1[ICON_GOLD]/제국 내 타일)을 통해 해외로 판매되어 세계의 전자 산업을 지원할 수도 있습니다.';
				
UPDATE Language_ko_KR SET Text = '시설: [COLOR_CYAN]마을[ENDCOLOR]; 도시: [COLOR_CYAN]상인 2명[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_AKIHABARA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = ''||Text WHERE Tag ='TXT_KEY_BUILDING_AKIHABARA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Rockefeller Center
INSERT INTO Language_ko_KR 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_ROCKEFELLER',		'록펠러 센터'),
			('TXT_KEY_WONDER_ROCKEFELLER_QUOTE',	'[NEWLINE]"사업에 기반을 둔 우정이 우정에 기반을 둔 사업보다 낫다."[NEWLINE] - 존 D. 록펠러[NEWLINE]'),
			('TXT_KEY_BUILDING_ROCKEFELLER_PEDIA',	'록펠러 센터는 뉴욕시 미드타운 맨해튼의 랜드마크 단지로 아르 데코 건축, 상업적 중요성, 문화적 영향으로 유명합니다. 1930년 대공황 기간에 존 D. 록펠러 주니어가 주도하여 사무실 공간, 소매, 엔터테인먼트를 결합한 주요 도시 중심지를 만드는 것을 목표로 건설이 시작되었습니다. 처음에는 미국 라디오 회사(RCA)의 상업 허브로 구상되었지만, 이 프로젝트는 22에이커에 달하는 19개의 상업용 건물로 구성된 거대한 단지로 발전했습니다. 시간이 지남에 따라 록펠러 센터는 현대 도시 계획, 혁신, 회복력의 상징이 되었으며 경제적 어려움의 시기에 일자리를 제공하고 미드타운 맨해튼을 번화한 비즈니스 및 문화 중심지로 변화시켰습니다. [NEWLINE][NEWLINE]이 단지는 눈에 띄는 아르 데코 건축, 공공 광장, 록펠러 플라자, 아틀라스 및 프로메테우스 조각상, 채널 가든과 같은 상징적인 특징으로 유명합니다. 또한 NBC 본사를 포함한 주요 미디어 기관이 있으며 라디오 시티 뮤직 홀의 본거지이기도 합니다. 록펠러 센터는 특히 연례 크리스마스트리 점등식과 야외 아이스스케이트장을 포함한 계절별 명소로 유명하며 매년 수백만 명의 방문객을 끌어들입니다. 상업 및 엔터테인먼트 기능 외에도 이 센터는 문화 및 사회적 허브 역할을 하며 20세기 뉴욕시의 예술, 건축, 상업의 융합을 나타내며 미국의 야망과 창의성의 세계적인 상징으로 남아 있습니다.'),
			('TXT_KEY_BUILDING_ROCKEFELLER_HELP',	'[ICON_BULLET]모든 도시에서 +3 [ICON_GOLD] 금.[NEWLINE][ICON_BULLET]제국 내에서 [ICON_GOLD] 금 구매/투자 시마다 해당 도시는 소비된 [ICON_GOLD] 금의 5%를 [ICON_CULTURE] 문화로 전환합니다.');
			
UPDATE Language_ko_KR SET Text = '[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_ROCKEFELLER_HELP';

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_ROCKEFELLER_HELP_CUT', '[COLOR_YIELD_FOOD]록펠러 센터[ENDCOLOR]는 경제(+3[ICON_GOLD]/도시), 문화(5%[ICON_CULTURE]/[ICON_GOLD][ICON_GOLD] 구매), 연구(+2[ICON_RESEARCH]/모든 [COLOR_YIELD_FOOD]병원[ENDCOLOR]) 등 국가의 다양한 분야를 강력하게 지원합니다. 이 단지에서 운영되는 새로운 [COLOR_YIELD_FOOD]연구소[ENDCOLOR]([COLOR_YIELD_FOOD]무료[ENDCOLOR]) 덕분에 거대한 돌파구는 시간문제일 뿐입니다.';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 지물: [COLOR_CYAN]강[ENDCOLOR]; 건물: [COLOR_CYAN]오페라 극장[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_ROCKEFELLER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 지물: [COLOR_CYAN]강[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_ROCKEFELLER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Autobahn
INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_AUTOBAHN',		'아우토반'),
			('TXT_KEY_WONDER_AUTOBAHN_QUOTE',	'[NEWLINE]"국민을 위한 자동차, 저렴한 폭스바겐은 대중에게 큰 기쁨을 가져다줄 것이며 그러한 자동차를 만드는 문제는 용기를 가지고 직면해야 한다."[NEWLINE] - 아돌프 히틀러[NEWLINE]'),
			('TXT_KEY_BUILDING_AUTOBAHN_PEDIA',	'아우토반은 의무적인 속도 제한이 없는 구간으로 전 세계적으로 알려진 독일의 유명한 고속 고속도로 네트워크입니다. 그 기원은 교통을 개선하고 자동차 여행을 장려하기 위해 최초의 실험적인 고속도로가 건설된 1920년대로 거슬러 올라갑니다. 네트워크는 1930년대 나치 정권하에서 크게 확장되었으며, 나치 정권은 기술 진보를 보여주고 대공황 기간 동안 고용을 제공하기 위해 건설을 사용했습니다. 제2차 세계 대전 이후 아우토반 시스템은 재건되고 현대화되어 서독의 전후 경제 회복의 중심 요소가 되었으며 급속한 산업 성장을 촉진했습니다. 오늘날 이곳은 세계에서 가장 진보되고 광범위한 고속도로 시스템 중 하나로, 독일의 모든 주요 도시를 연결하고 유럽 도로 운송의 중추 역할을 합니다. [NEWLINE][NEWLINE]아우토반은 다중 차선, 입체 교차로, 엄격한 안전 규정을 포함한 공학적 표준으로 유명하며, 다른 많은 고속도로에 비해 사고율이 낮으면서도 고속 주행이 가능합니다. 특정 구간에는 연방에서 의무화한 속도 제한이 없지만 약 130km/h(81mph)의 권장 속도가 권장되며 일부 지역에는 교통이나 도로 상황으로 인해 제한 속도가 적용됩니다. 네트워크는 또한 정교한 표지판, 휴게소, 서비스 시설을 갖추고 있습니다. 기능적 역할 외에도 아우토반은 독일의 효율성, 공학적 우수성, 고속 주행의 스릴을 상징하는 문화적 상징이 되어 전 세계의 자동차 애호가들을 끌어들이고 있습니다.'),
			('TXT_KEY_BUILDING_AUTOBAHN_HELP',	'[ICON_BULLET]모든 도시에서 +7 [ICON_STRENGTH] 도시 방어력.');

UPDATE Language_ko_KR SET Text = '[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_AUTOBAHN_HELP';
			
INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_AUTOBAHN_HELP_CUT', '[COLOR_YIELD_FOOD]아우토반[ENDCOLOR]은 군대의 기동성을 향상시켜 방어 능력을 높이고(+7[ICON_STRENGTH][ICON_STRENGTH]) 황금기로 나아가게 합니다(+5[ICON_GOLDEN_AGE]; +10%[ICON_GOLDEN_AGE][ICON_GOLDEN_AGE]). 또한 제품의 흐름을 촉진하고(+15%[ICON_GOLD]/[ICON_CONNECTED][ICON_CONNECTED], [ICON_INDUSTRIAL_CONNECTED][ICON_INDUSTRIAL_CONNECTED]) 전반적인 생산성을 높입니다(+30%[ICON_WORKER] 작업 속도)';
				
UPDATE Language_ko_KR SET Text = '개발된 자원: [ICON_RES_OIL]; 건물: [COLOR_CYAN]병기고, 사관학교[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_AUTOBAHN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '개발된 자원: [ICON_RES_OIL].'||Text WHERE Tag ='TXT_KEY_BUILDING_AUTOBAHN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Interstate Highway System
INSERT INTO Language_ko_KR 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_INTERSTATE',			'주간 고속도로 시스템'),
			('TXT_KEY_WONDER_INTERSTATE_QUOTE',		'[NEWLINE]"나는 강력한 고속도로 네트워크가 우리나라 전역에 퍼져 있는 미국을 봅니다."[NEWLINE] - 드와이트 D. 아이젠하워[NEWLINE]'),
			('TXT_KEY_BUILDING_INTERSTATE_PEDIA',	'공식적으로 드와이트 D. 아이젠하워 국립 주간 및 국방 고속도로 시스템으로 알려진 주간 고속도로 시스템은 미국 전역에 걸친 통제된 접근 고속도로 네트워크입니다. 그 생성은 제2차 세계 대전 중 독일의 아우토반 네트워크에서 영감을 받은 드와이트 D. 아이젠하워 대통령이 법으로 서명한 1956년 연방 지원 고속도로법에 의해 승인되었습니다. 이 시스템은 국방을 개선하고 상업을 촉진하며 도시와 농촌 지역을 효율적으로 연결하도록 설계되었습니다. 네트워크 건설은 수십 년에 걸쳐 진행되었으며 결국 50개 주를 모두 연결하는 48,000마일 이상의 도로를 포함하게 되었습니다. 이 프로젝트는 미국의 인프라를 변화시켜 더 빠른 여행을 가능하게 하고 경제 성장을 촉진하며 도시화, 교외 확장 및 화물 운송 패턴을 재편했습니다. [NEWLINE][NEWLINE]주간 고속도로 시스템은 안전과 효율성을 극대화하도록 설계된 다중 차선, 고가 도로, 표준화된 표지판이 있는 고속 제한 접근 도로가 특징입니다. 주요 특징으로는 입체 교차로, 반대 방향 교통을 분리하는 중앙분리대 또는 장벽, 주 전역에서 일관된 운전 경험을 제공하는 통일된 설계 표준이 있습니다. I-95, I-10, I-80과 같은 주요 노선은 장거리 여행 및 상업의 중요한 동맥 역할을 하며 승용차와 상업용 트럭 운송을 모두 지원합니다. 운송 외에도 주간 고속도로 시스템은 지역 연결성을 촉진하고 개발 패턴에 영향을 미치며 미국의 이동성과 공학적 성취의 지속적인 상징이 되는 등 심오한 사회적, 경제적 영향을 미쳤습니다.'),
			('TXT_KEY_BUILDING_INTERSTATE_HELP',	'[ICON_BULLET]모든 도시가 즉시 1 [ICON_CITIZEN] 시민을 얻습니다.');

UPDATE Language_ko_KR SET Text = '[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_INTERSTATE_HELP';			

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_INTERSTATE_HELP_CUT', '[COLOR_YIELD_FOOD]주간 고속도로 시스템[ENDCOLOR]은 국가의 모든 구석을 연결하여 가장 낙후된 지역까지 개발합니다(+1[ICON_CITIZEN]; -5%[ICON_HAPPINESS_3][ICON_HAPPINESS_3] 요구). 금 수입(+15%[ICON_GOLD]/[ICON_CONNECTED][ICON_CONNECTED], [ICON_INDUSTRIAL_CONNECTED][ICON_INDUSTRIAL_CONNECTED])과 생산 능력(+10%[ICON_PRODUCTION][ICON_PRODUCTION])을 증가시킵니다.';
				
UPDATE Language_ko_KR SET Text = '개발된 자원: [ICON_RES_OIL]; 도시: [COLOR_CYAN]8개 도시[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_INTERSTATE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '개발된 자원: [ICON_RES_OIL].'||Text WHERE Tag ='TXT_KEY_BUILDING_INTERSTATE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Hollywood
INSERT INTO Language_ko_KR 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_HOLLYWOOD',			'할리우드'),
			('TXT_KEY_WONDER_HOLLYWOOD_QUOTE',		'[NEWLINE]"할리우드는 키스 한 번에 천 달러를 지불하고 영혼에는 50센트를 지불하는 곳입니다. 저는 첫 번째 제안을 자주 거절하고 50센트를 고수했기 때문에 잘 알고 있습니다."[NEWLINE] - 마릴린 먼로[NEWLINE]'),
			('TXT_KEY_BUILDING_HOLLYWOOD_PEDIA',	'캘리포니아주 로스앤젤레스에 위치한 할리우드는 엔터테인먼트 산업, 특히 영화와 텔레비전의 세계적으로 인정받는 중심지입니다. 그 부상은 20세기 초 영화 제작자들이 좋은 기후, 다양한 풍경, 동부 해안의 영화 특허 회사가 시행하는 특허 제한으로부터의 거리 때문에 남부 캘리포니아로 몰려들면서 시작되었습니다. 1910년대와 1920년대까지 할리우드는 급성장하는 미국 영화 산업의 심장부가 되어 배우, 감독, 제작자를 끌어들였습니다. 파라마운트, 워너 브라더스, 유니버설과 같은 주요 스튜디오의 설립은 영화의 진원지로서의 위상을 굳혔습니다. 수십 년 동안 할리우드는 미국 대중문화를 형성했을 뿐만 아니라 전 세계 미디어 트렌드에 영향을 미쳐 화려함, 유명 인사, 창의적 혁신의 대명사가 되었습니다. [NEWLINE][NEWLINE]건축학적으로나 문화적으로 할리우드는 할리우드 사인, 명예의 거리, TCL 차이니즈 극장과 같은 역사적인 극장과 같은 상징적인 랜드마크로 유명합니다. 이 지구는 제작 스튜디오, 사무실, 엔터테인먼트 장소를 포함하고 있어 영화 제작과 관광의 허브가 되었습니다. 할리우드는 유성 영화로의 전환부터 디지털 미디어 및 스트리밍 플랫폼의 부상에 이르기까지 기술 변화에 지속적으로 적응해 왔습니다. 경제적, 예술적 기여 외에도 할리우드는 열망과 스토리텔링의 상징으로 전 세계 세대의 꿈, 야망, 문화적 서사를 반영합니다.'),
			('TXT_KEY_BUILDING_HOLLYWOOD_HELP',		'');

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_HOLLYWOOD_HELP_CUT', '제국을 더 행복하게 만들고 싶다면 [COLOR_YIELD_FOOD]할리우드[ENDCOLOR]를 건설하십시오(-1[ICON_HAPPINESS_3] 지루함; -5%[ICON_HAPPINESS_3][ICON_HAPPINESS_3] 지루함). 이곳은 국가의 문화 중심지가 될 것이며(+1[ICON_TOURISM]; 75[ICON_TOURISM]/정책 잠금 해제; [COLOR_MAGENTA]무료 정책[ENDCOLOR]), 당신을 위해 이익을 창출하기도 합니다(+1[ICON_GOLD], +1[ICON_CULTURE]/모든 [COLOR_YIELD_FOOD]방송탑[ENDCOLOR]; +2[ICON_GOLD], +2[ICON_CULTURE], +2[ICON_TOURISM]/모든 [COLOR_YIELD_FOOD]길드[ENDCOLOR])!';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]평등[ENDCOLOR]; 타일: [COLOR_CYAN]언덕[ENDCOLOR]; 지형: [COLOR_CYAN]해안[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_HOLLYWOOD_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]평등[ENDCOLOR]; 타일: [COLOR_CYAN]언덕[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_HOLLYWOOD_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Concorde
INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_CONCORDE',		'콩코드'),
			('TXT_KEY_WONDER_CONCORDE_QUOTE',	'[NEWLINE]"파리에 가서 에펠탑에서 뛰어내려야겠어. 콩코드를 탔다면 3시간 일찍 죽을 수도 있었을 텐데."[NEWLINE] - 우디 앨런[NEWLINE]'),
			('TXT_KEY_BUILDING_CONCORDE_PEDIA',	'콩코드는 영국 항공기 공사(BAC)와 프랑스의 아에로스파시알이 공동 개발한 혁신적인 초음속 여객기로 1976년에 취항했습니다. 그 역사는 영국과 프랑스가 대서양 횡단 비행 시간을 절반으로 줄일 수 있는 고속 항공기를 만들려고 했던 1960년대 초로 거슬러 올라갑니다. 콩코드는 마하 2(약 1,354mph 또는 2,180km/h) 이상의 속도로 비행할 수 있어 지금까지 제작된 가장 빠른 상업용 항공기 중 하나였습니다. 기술적 성취에도 불구하고 콩코드는 높은 운영 비용, 제한된 좌석 수, 소음 및 연료 소비와 관련된 환경 문제 등의 어려움에 직면했습니다. 주로 런던, 파리, 뉴욕, 워싱턴 간의 노선을 운항하며 부유한 승객과 비즈니스 여행객을 대상으로 하는 럭셔리 항공 여행의 상징이 되었습니다. [NEWLINE][NEWLINE]콩코드는 날렵한 델타 날개 디자인, 이착륙 시 시야 확보를 위해 아래로 처진 기수, 초음속 비행을 가능하게 하는 애프터버닝 터보제트 엔진으로 구별되었습니다. 내부는 약 100명의 승객을 위한 좌석과 세심한 서비스로 편안함과 독점성을 강조했습니다. 2000년 에어프랑스 4590편 추락 사고의 여파를 포함한 경제적, 안전상의 고려로 인해 2003년 퇴역했지만 콩코드는 항공 역사의 아이콘으로 남아 있습니다. 이 항공기는 공학적 우수성, 공기역학적 혁신, 상업용 항공 여행의 한계를 뛰어넘는 역할로 찬사를 받으며 항공 우주 설계 및 초음속 운송에 지속적인 유산을 남겼습니다.'),
			('TXT_KEY_BUILDING_CONCORDE_HELP',	'');
			
INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_CONCORDE_HELP_CUT', '초음속 여객기 [COLOR_YIELD_FOOD]콩코드[ENDCOLOR]는 여객 비행의 효율성을 획기적으로 높이고 관광 수입을 증대시킵니다(+3[ICON_TOURISM]; +3[ICON_TOURISM]/[ICON_RES_OIL][ICON_RES_OIL], [ICON_RES_ALUMINUM][ICON_RES_ALUMINUM]; [ICON_HAPPINESS_1]사랑해 주간 동안 +25%[ICON_TOURISM]). 세상은 당신의 것입니다(20[ICON_INFLUENCE]/[ICON_CITY_STATE][ICON_CITY_STATE]). 돈을 세기만 하면 됩니다(+15%[ICON_GOLD]/[ICON_CONNECTED][ICON_CONNECTED], [ICON_INDUSTRIAL_CONNECTED][ICON_INDUSTRIAL_CONNECTED]).';
				
UPDATE Language_ko_KR SET Text = '개발된 자원: [ICON_RES_ALUMINUM]; 도시: [COLOR_CYAN]기술자 3명[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_CONCORDE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '개발된 자원: [ICON_RES_ALUMINUM].'||Text WHERE Tag ='TXT_KEY_BUILDING_CONCORDE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Sanbo Honbu
INSERT INTO Language_ko_KR 
			(Tag,										Text)
VALUES		('TXT_KEY_BUILDING_SANBO',					'산보 혼부'),
			('TXT_KEY_WONDER_SANBO_QUOTE',				'[NEWLINE]"미래를 위한 건설에 헌신하기 위해 총력을 결집하십시오. 정직의 길을 닦고, 고귀한 정신을 기르며, 결의를 가지고 일하십시오. 그리하여 제국의 타고난 영광을 높이고 세계의 진보에 발맞추십시오."[NEWLINE] - 히로히토[NEWLINE]'),
			('TXT_KEY_BUILDING_SANBO_PEDIA',			'산보 혼부는 임제종과 조동종 전통의 요소를 현대 평신도 수행과 통합한 저명한 일본 선불교 단체인 산보 교단의 중앙 본부입니다. 20세기 중반 하쿠운 야스 타니 로시에 의해 설립된 산보 혼부는 엄격한 명상 훈련과 공안 연구를 유지하면서 서양 학생들을 포함한 평신도 수행자들이 선 수행에 더 쉽게 접근할 수 있도록 만들어졌습니다. 이 단체는 좌선(앉아서 하는 명상)과 견성(자신의 본성을 통찰함)의 결합을 선 수행의 필수 요소로 강조했습니다. 수십 년 동안 산보 혼부는 선의 세계적 확산에 중요한 역할을 했으며 일본 및 국제 수행자 모두에게 영향을 미치고 전통적인 수도원 수행과 현대의 영적 필요를 연결했습니다. [NEWLINE][NEWLINE]산보 혼부는 단체의 훈련 센터이자 행정 허브 역할을 합니다. 수련회(세신), 강의, 워크숍을 제공하며 명상, 공안 연구, 윤리 훈련을 위한 체계적인 프로그램을 제공합니다. 본부에는 일반적으로 선당(명상 홀), 수도승과 방문 수행자를 위한 숙소, 지역 사회 모임을 위한 시설이 포함됩니다. 건축과 배치는 기능적이며 선 수행의 단순함과 집중을 반영하는 동시에 명상과 자기 탐구에 도움이 되는 환경을 조성합니다. 물리적 역할을 넘어 산보 혼부는 전통적인 가르침과 접근성을 혼합한 선에 대한 현대적 접근 방식을 상징하며 일본 국내외에서 선 수행에 계속 영향을 미치고 있습니다.'),
			('TXT_KEY_BUILDING_SANBO_HELP',				'[ICON_BULLET]제국 내 모든 [COLOR_YIELD_GOLD]지상 군사 유닛[ENDCOLOR]은 [COLOR_POSITIVE_TEXT]제국군[ENDCOLOR] 승급을 얻습니다.[NEWLINE][ICON_BULLET]제국 내 모든 [COLOR_YIELD_GOLD]해상 근접 군사 유닛[ENDCOLOR]은 [COLOR_POSITIVE_TEXT]태양의 함대[ENDCOLOR] 승급을 얻습니다.[NEWLINE][ICON_BULLET]제국 내 모든 [COLOR_YIELD_GOLD]공중 군사 유닛[ENDCOLOR]은 [COLOR_POSITIVE_TEXT]카미카제[ENDCOLOR] 승급을 얻습니다.'),
			('TXT_KEY_PROMOTION_SANBO_LAND',			'제국군'),
			('TXT_KEY_PROMOTION_SANBO_LAND_HELP',		'[COLOR:255:230:85:255]강을 건넌 후[ENDCOLOR] 보너스 [ICON_MOVES]이동력. [COLOR:255:230:85:255]험지에서[ENDCOLOR] +10% [ICON_STRENGTH]전투력/[ICON_RANGE_STRENGTH]원거리 전투력.'),
			('TXT_KEY_PROMOTION_SANBO_SEA',				'태양의 함대'),
			('TXT_KEY_PROMOTION_SANBO_SEA_HELP',		'유닛이 [COLOR:255:230:85:255]공격하는 공중 유닛에게[ENDCOLOR] 피해를 입힙니다. [ICON_RESEARCH][COLOR_RESEARCH_STORED]비행[ENDCOLOR] 필요 (잠수함 제외). 유닛이 [COLOR:255:230:85:255]다른 우호적 유닛에 인접한 경우[ENDCOLOR] +10% [ICON_STRENGTH]전투력/[ICON_RANGE_STRENGTH]원거리 전투력.'),
			('TXT_KEY_PROMOTION_SANBO_AIR',				'카미카제'),
			('TXT_KEY_PROMOTION_SANBO_AIR_HELP',		'유닛이 [COLOR:255:230:85:255]최대 HP의 20% 이하일 때[ENDCOLOR] +30% [ICON_RANGE_STRENGTH]원거리 전투력 [COLOR_GREY](비활성)[ENDCOLOR].'),
			('TXT_KEY_PROMOTION_SANBO_AIR_EFFECT',		'카미카제: 천황 폐하를 위하여!'),
			('TXT_KEY_PROMOTION_SANBO_AIR_EFFECT_HELP',	'유닛이 [COLOR:255:230:85:255]최대 HP의 20% 이하일 때[ENDCOLOR] +30% [ICON_RANGE_STRENGTH]원거리 전투력 [COLOR_POSITIVE_TEXT](활성)[ENDCOLOR].');

UPDATE Language_ko_KR SET Text = '[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_SANBO_HELP';

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_SANBO_HELP_CUT', '[COLOR_YIELD_FOOD]산보 혼부[ENDCOLOR]는 지상([COLOR_WATER_TEXT]제국군[ENDCOLOR]/[COLOR_YIELD_GOLD]군사 지상[ENDCOLOR]), 해상([COLOR_WATER_TEXT]태양의 함대[ENDCOLOR]/[COLOR_YIELD_GOLD]군사 해상[ENDCOLOR]), 공중([COLOR_WATER_TEXT]카미카제[ENDCOLOR]/[COLOR_YIELD_GOLD]군사 공중[ENDCOLOR]) 등 군대의 모든 군사 분야를 강화합니다. 또한 군대 생산 속도를 높이고(+30%[ICON_PRODUCTION]/군사) 내부 권력을 향상시킵니다([COLOR_MAGENTA]무료 정책[ENDCOLOR]). 금상첨화로 장군과 제독을 훨씬 더 빨리 얻을 수 있습니다(+2[ICON_GREAT_GENERAL]; +3[ICON_GREAT_ADMIRAL]).';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]전제정치[ENDCOLOR]; 건물: [COLOR_CYAN]병기고, 사관학교[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_SANBO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]전제정치[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_SANBO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Mount Rushmore
INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_RUSHMORE',		'러시모어산'),
			('TXT_KEY_WONDER_RUSHMORE_QUOTE',	'[NEWLINE]"거짓 애국심의 사기에 주의하십시오." - G. 워싱턴; "오직 진정한 원칙을 세우고 유연하지 않게 고수하십시오." - T. 제퍼슨; "정부는 우리입니다. 우리가 정부이고, 당신과 나입니다." - T. 루즈벨트; "조용한 과거의 교리는 폭풍우 치는 현재에 부적절합니다." - A. 링컨[NEWLINE]'),
			('TXT_KEY_BUILDING_RUSHMORE_PEDIA',	'사우스다코타주 블랙힐스에 위치한 러시모어산은 조지 워싱턴, 토머스 제퍼슨, 시어도어 루즈벨트, 에이브러햄 링컨 등 4명의 미국 대통령의 60피트 높이 얼굴을 특징으로 하는 기념비적인 조각상입니다. 기념비에 대한 아이디어는 1920년대 초 사우스다코타의 관광을 장려하고자 했던 역사가 도안 로빈슨에 의해 구상되었습니다. 조각가 거트슨 보글럼이 설계 및 감독을 의뢰받아 1927년에 시작하여 1941년까지 계속되었습니다. 기념비는 다이너마이트와 전통적인 조각 기술을 사용하여 화강암 산비탈에 직접 조각되었으며 14년 동안 수백 명의 노동자가 고용되었습니다. 러시모어산은 미국의 탄생, 성장, 발전 및 보존을 상징하고 국가를 형성하는 데 중추적인 역할을 한 지도자들을 기리기 위해 의도되었습니다. [NEWLINE][NEWLINE]이 조각상은 공학적, 예술적 성취일 뿐만 아니라 문화적 랜드마크이기도 합니다. 험준한 블랙힐스에 위치하여 드라마틱한 전망을 제공하고 작품의 규모와 영속성을 강조합니다. 엄청난 크기와 시각적 효과 외에도 러시모어산에는 방문자 센터, 박물관, 산책로가 있어 교육적, 역사적 맥락을 제공합니다. 주요 관광 명소이자 미국 민주주의와 리더십의 상징 역할을 하지만, 이 유적지는 라코타 수족의 조상 땅이기도 하여 복잡한 역사적, 문화적 중요성을 지닌 곳입니다. 러시모어산은 국가 정체성, 예술성, 역사와 풍경의 교차점을 보여주는 강력한 상징으로 계속 남아 있습니다.'),
			('TXT_KEY_BUILDING_RUSHMORE_HELP',	'');
			
INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_RUSHMORE_HELP_CUT', '[COLOR_YIELD_FOOD]러시모어산[ENDCOLOR]은 [COLOR_CITY_BLUE]산[ENDCOLOR]에 새겨진 환상적인 예술적 창조물입니다([ICON_GREAT_ARTIST] 슬롯 1개)(+1[ICON_PRODUCTION], +1[ICON_CULTURE], +1[ICON_TOURISM]/타일). 이 작품은 사람들이 세계의 이 지역을 방문하는 주된 이유이며(+1[ICON_CULTURE], +1[ICON_TOURISM]/[ICON_GREAT_WORK][ICON_GREAT_WORK]), 추가로 국가 역사상 가장 위대한 4명의 인물을 기념합니다(+1[ICON_DIPLOMAT] 연맹 투표).';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]산 (범위 2)[ENDCOLOR]; 지물: [COLOR_CYAN]숲[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_RUSHMORE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]산 (범위 2)[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_RUSHMORE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Statue of Liberty
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_WONDER_STATUE_OF_LIBERTY_HELP_CUT', '[COLOR_YIELD_FOOD]자유의 여신상[ENDCOLOR]은 당신의 발전이 세상을 지배하는 가장 좋은 방법이라는 것을 다른 공동체에 알리는 신호입니다([COLOR_MAGENTA]무료 정책[ENDCOLOR]). 그러한 자신감은 시민들의 신뢰를 높여 삶의 모든 영역에서 더 생산적이게 만듭니다(+1[ICON_PRODUCTION]/모든 전문가).');
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]평등[ENDCOLOR]; 지형: [COLOR_CYAN]해안[ENDCOLOR]; 도시: [COLOR_CYAN]전문가 8명[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_STATUE_OF_LIBERTY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]평등[ENDCOLOR]; 지형: [COLOR_CYAN]해안[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_STATUE_OF_LIBERTY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Empire State Building
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_BUILDING_EMPIRE_STATE_BUILDING_HELP_CUT', '부자가 되는 것은 당신의 피에 흐르고 있으므로, [COLOR_YIELD_FOOD]엠파이어 스테이트 빌딩[ENDCOLOR]의 건설은 필연적입니다(+1[ICON_GOLD]/모든 전문가). 이곳은 은행가들이 막대한 이익을 창출하고 사람들이 미래를 바꾸기 위해 모이는 [COLOR_YIELD_FOOD]증권 거래소[ENDCOLOR]([COLOR_YIELD_FOOD]무료[ENDCOLOR])입니다([COLOR_YIELD_GOLD]무료 [ICON_GREAT_PEOPLE][ENDCOLOR]).');
				
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]평지[ENDCOLOR]; 개발된 자원: [ICON_RES_ALUMINUM].'||Text WHERE Tag ='TXT_KEY_BUILDING_EMPIRE_STATE_BUILDING_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]평지[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_EMPIRE_STATE_BUILDING_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Kremlin
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_WONDER_KREMLIN_HELP_CUT', '기념비적인 [COLOR_YIELD_FOOD]크렘린[ENDCOLOR]은 당신의 힘을 보여주는 가장 큰 노력입니다. 탱크는 군대의 주력이 되어(+33%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]기갑[ENDCOLOR]) 문명을 안전하게 지킵니다(-1[ICON_HAPPINESS_3] 고통). 이것은 당신 문화의 상징이 될 것입니다([COLOR_MAGENTA]무료 정책[ENDCOLOR]).');

UPDATE Language_ko_KR SET Text = REPLACE(Text, 'The Prophet Muhammed', '예언자 무함마드') WHERE Tag ='TXT_KEY_WONDER_KREMLIN_QUOTE';
			
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]체제[ENDCOLOR]; 지형: [COLOR_CYAN]툰드라[ENDCOLOR], [COLOR_NEGATIVE_TEXT]해안[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_KREMLIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]체제[ENDCOLOR]; 지형: [COLOR_NEGATIVE_TEXT]해안[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_KREMLIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Motherland Calls
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_BUILDING_MOTHERLAND_CALLS_HELP_CUT', '[COLOR_YIELD_FOOD]어머니 조국상[ENDCOLOR]은 [COLOR_YIELD_FOOD]경찰서[ENDCOLOR]([COLOR_YIELD_FOOD]무료[ENDCOLOR])를 사용하여 내부 보안을 강화하고 이 도시에서 더 많은 군대에 동기를 부여할 수 있습니다([ICON_CITIZEN]의 +100%를 [ICON_SILVER_FIST]로). 도시 인프라 유지비가 훨씬 낮아지고(-10%[ICON_GOLD][ICON_GOLD] 유지비) 적들은 약탈에 덜 성공하게 됩니다(적은 약탈로 HP를 회복하거나 [ICON_GOLD]을 얻을 수 없음).');

UPDATE Language_ko_KR SET Text = REPLACE(Text, '."', '."[NEWLINE]- 작자 미상[NEWLINE]') WHERE Tag ='TXT_KEY_BUILDING_MOTHERLAND_CALLS_QUOTE';
			
UPDATE Language_ko_KR SET Text = '지형: [COLOR_NEGATIVE_TEXT]해안[ENDCOLOR]; 타일: [COLOR_CYAN]언덕[ENDCOLOR]; 지물: [COLOR_CYAN]강[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_MOTHERLAND_CALLS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]언덕[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_MOTHERLAND_CALLS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Cristo Redentor
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_WONDER_CRISTO_REDENTOR_HELP_CUT', '[COLOR_YIELD_FOOD]구세주 그리스도상[ENDCOLOR]은 전 세계 관광객을 위한 초대장이며(+25[ICON_TOURISM]) 당신의 [COLOR_YIELD_FOOD]호텔[ENDCOLOR](+2[ICON_CULTURE]; +2[ICON_GOLDEN_AGE]; +2[ICON_TOURISM])을 재산의 중요한 부분으로 만들 것입니다.');

UPDATE Language_ko_KR SET Text = REPLACE(Text, 'The Bible, Matthew 25:28', '"성경: 마태복음 11:25-28"') WHERE Tag ='TXT_KEY_WONDER_CRISTOREDENTOR_QUOTE';

UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 타일: [COLOR_CYAN]언덕[ENDCOLOR]; 지물: [COLOR_CYAN]숲/정글[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_CRISTO_REDENTOR_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 타일: [COLOR_CYAN]언덕[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_CRISTO_REDENTOR_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Broadway
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_WONDER_BROADWAY_HELP_CUT', '[COLOR_YIELD_FOOD]브로드웨이[ENDCOLOR]는 재능 있는 음악가들에게 완벽한 장소이며([COLOR_YIELD_GOLD]무료 [ICON_GREAT_MUSICIAN][ENDCOLOR]), 그들은 이곳에서 상상력의 결실을 선보일 수 있고(테마 보너스 시 3[ICON_GW_MUSIC]: [ICON_GOLD]), 이 도시의 모든 미래 건설은 그들에 의해 보상받을 것입니다(250[ICON_CULTURE]/건설).');
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]산업 완성[ENDCOLOR]; 타일: [COLOR_CYAN]평지[ENDCOLOR]; 걸작: [COLOR_CYAN]2[ICON_GW_MUSIC][ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_BROADWAY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]산업 완성[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_BROADWAY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Prora
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_WONDER_PRORA_RESORT_HELP_CUT', '[COLOR_YIELD_FOOD]프로라[ENDCOLOR] 휴양 센터는 시민들을 더 행복하게 만들고(+1[ICON_HAPPINESS_1]; +1[ICON_HAPPINESS_1]/2 [COLOR_MAGENTA]정책[ENDCOLOR]) 더 효율적으로 발전하도록 독려합니다([COLOR_MAGENTA]무료 정책[ENDCOLOR]). 또한 미래의 불가사의 건설을 보호하고(적의 불가사의 방해 확률 감소) 적의 땅을 황폐화하는 군인들에게 보상을 제공합니다(25[ICON_CULTURE]/약탈).');
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]전제정치[ENDCOLOR]; 타일: [COLOR_CYAN]평지[ENDCOLOR]; 지형: [COLOR_CYAN]해안[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_PRORA_RESORT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]전제정치[ENDCOLOR]; 타일: [COLOR_CYAN]평지[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_PRORA_RESORT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
----------------------------------------------------
-- Great Hall of the People
INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_GREAT_HALL',			'인민대회당'),
			('TXT_KEY_WONDER_GREAT_HALL_QUOTE',		'[NEWLINE]"인민은 국가의 주인이다."[NEWLINE] - 저우언라이[NEWLINE]'),
			('TXT_KEY_BUILDING_GREAT_HALL_PEDIA',	'인민대회당은 중국 베이징 톈안먼 광장 서쪽 가장자리에 위치한 기념비적인 정부 청사입니다. 불과 10개월 만에 건설되어 1959년 9월 중화인민공화국 건국 10주년을 기념하기 위한 "10대 건축물" 중 하나로 공식 개관했습니다. 건축가 장보와 수천 명의 노동자 및 자원봉사자가 설계한 이 건물은 국가적 단결을 상징하며 입법 및 의식 활동을 위한 장소 역할을 합니다. 완공 이후 전국인민대표대회 연례 회의, 국가 행사, 고위급 정치 회의가 열리는 장소로 사용되어 현대 중국에서 가장 중요한 정치적 랜드마크 중 하나가 되었습니다.[NEWLINE][NEWLINE]건축학적으로 인민대회당은 171,800제곱미터에 달하며 전통적인 중국 요소와 소련의 영향을 받은 기념비적 스타일을 결합했습니다. 웅장한 중앙 강당은 약 10,000명을 수용할 수 있으며 연회장은 5,000명의 손님을 수용할 수 있습니다. 내부에는 중국의 다양한 성과 자치구를 나타내도록 장식된 일련의 홀이 있어 국가의 민족적, 지역적 다양성을 상징합니다. 건물의 디자인은 대칭, 광대한 열린 공간, 압도적인 규모를 강조하여 건설 당시 국가의 권위와 젊은 공화국의 야망을 모두 반영합니다. 오늘날 인민대회당은 정치적 역할 외에도 중국 현대화의 상징이자 외국 고위 인사를 환영하고 중요한 문화 행사를 주최하는 장소 역할도 합니다.'),
			('TXT_KEY_BUILDING_GREAT_HALL_HELP',	'');

INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_BUILDING_GREAT_HALL_HELP_CUT', '[COLOR_YIELD_FOOD]인민대회당[ENDCOLOR]에서의 연례 회의는 제국(+2[ICON_GOLDEN_AGE]/5[ICON_CITIZEN][ICON_CITIZEN])과 당신의 통치를 호기심 있게 지켜보는 다른 모든 국가(+2[ICON_DIPLOMAT]; 10[ICON_INFLUENCE]/[ICON_GREAT_PEOPLE] 소모) 모두에게 강력한 정치적 영향력을 미칩니다. 한편, 회기 사이에는 이곳이 문화적 보석으로 변하며(+1[ICON_CULTURE]; [COLOR_MAGENTA]무료 정책[ENDCOLOR]) 또 다른 5개년 계획을 성공적으로 마치면 마침내 폭발합니다(누적 +5[ICON_CULTURE]/모든 [ICON_GOLDEN_AGE] 시작 시).');
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]전제정치[ENDCOLOR]; 건물: [COLOR_CYAN]통신사[ENDCOLOR]; 도시: [COLOR_CYAN]공무원 3명[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_GREAT_HALL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]전제정치[ENDCOLOR]'||Text WHERE Tag ='TXT_KEY_BUILDING_GREAT_HALL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Habitat-67
INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_HABITAT',		'해비타트 67'),
			('TXT_KEY_WONDER_HABITAT_QUOTE',	'[NEWLINE]"집은 벽과 들보로 만들어지지만, 가정은 사랑과 꿈으로 지어진다."[NEWLINE] - 랄프 왈도 에머슨[NEWLINE]'),
			('TXT_KEY_BUILDING_HABITAT_PEDIA',	'해비타트 67은 캐나다 퀘벡주 몬트리올에 위치한 상징적인 주택 단지로, 도시 생활에 대한 혁신적인 접근 방식으로 유명합니다. 이스라엘계 캐나다인 건축가 모셰 사프디가 논문 프로젝트의 일환으로 설계했으며 1967년 세계 박람회인 엑스포 67의 파빌리온으로 지어졌습니다. 이 프로젝트는 교외 주택의 프라이버시, 녹지, 개성을 제공하면서 고밀도 주택 문제를 해결하기 위해 구상되었습니다. 해비타트 67은 독특한 연동 패턴으로 배열된 354개의 조립식 콘크리트 모듈로 구성되어 테라스, 정원, 열린 공간이 있는 146개의 주거 유닛을 만듭니다. 이 단지는 당시 혁명적이었으며 도시 생활과 커뮤니티 디자인에 대한 실용적인 고려 사항과 건축적 실험을 혼합했습니다. [NEWLINE][NEWLINE]건축학적으로 해비타트 67은 모듈식 구조, 기하학적 형태, 자연환경과의 통합으로 찬사를 받고 있습니다. 각 유닛은 햇빛, 환기, 야외 공간을 극대화하도록 설계되어 효율성과 삶의 질을 결합하려는 사프디의 비전을 반영합니다. 구조물의 대담하고 쌓인 외관은 모더니즘 건축의 상징이자 몬트리올 스카이라인의 랜드마크가 되었습니다. 미적 매력 외에도 해비타트 67은 아파트 생활에 대한 기존 관념에 도전했으며 전 세계 건축가와 도시 계획가에게 계속 영향을 미치고 있습니다. 오늘날에도 여전히 기능하는 주거 단지로 남아 있으며 도시 주택에 대한 혁신적인 접근 방식을 연구하려는 관광객, 건축 학생, 디자인 애호가들의 관심을 끌고 있습니다.'),
			('TXT_KEY_BUILDING_HABITAT_HELP',	'');
			
INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_HABITAT_HELP_CUT', '[COLOR_YIELD_FOOD]해비타트 67[ENDCOLOR]은 도시를 낙원으로 만드는 데 완전히 집중합니다. 정말 붐빌 수 있지만(+3[ICON_CITIZEN]), 삶의 질은 크게 향상되고(-3[ICON_HAPPINESS_3] 도시화; -2[ICON_HAPPINESS_3] 고통), 주민들은 더 나은 인프라의 혜택을 받을 수 있으며(+1[ICON_HAPPINESS_1]/[COLOR_YIELD_FOOD]정원[ENDCOLOR], [COLOR_YIELD_FOOD]박물관[ENDCOLOR], [COLOR_YIELD_FOOD]병원[ENDCOLOR], [COLOR_YIELD_FOOD]경찰서[ENDCOLOR]) 기술자들은 여전히 더 많은 것을 찾습니다(+1[ICON_CULTURE]/[ICON_GREAT_ENGINEER][ICON_GREAT_ENGINEER]).';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]툰드라[ENDCOLOR]; 지물: [COLOR_CYAN]강[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_HABITAT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]툰드라[ENDCOLOR]; 지물: [COLOR_CYAN]강[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_HABITAT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Vostok Station
INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_VOSTOK',			'보스토크 기지'),
			('TXT_KEY_WONDER_VOSTOK_QUOTE',		'[NEWLINE]"황량한 해안과 배경의 높은 얼음 장벽 위에서 수많은 기괴한 펭귄들이 꽥꽥거리고 지느러미를 퍼덕거렸다. 한편 많은 살찐 물범들이 물 위에서 보이거나 천천히 떠내려가는 큰 얼음 조각 위에서 헤엄치거나 널브러져 있었다."[NEWLINE] - H.P. 러브크래프트[NEWLINE]'),
			('TXT_KEY_BUILDING_VOSTOK_PEDIA',	'보스토크 기지는 남극의 추위 극점 근처 동남극에 위치한 러시아(구 소련) 연구 기지입니다. 국제 지구물리학의 해인 1957년에 설립되었으며 지구상에서 가장 외지고 극한의 환경 중 하나에서 과학 연구를 수행하기 위해 건설되었습니다. 이 기지는 북극 및 남극 연구소에서 운영하며 빙하학, 기상학, 지진학, 대기 과학 연구에 지속적으로 사용되었습니다. 보스토크 기지는 2012년 과학자들이 4km 이상의 얼음 아래 묻혀 수백만 년 동안 고립된 빙저호인 보스토크 호수를 시추했다고 보고했을 때 세계적인 주목을 받았습니다. 기지의 역사는 냉전 시대 소련의 지정학적, 과학적 야망뿐만 아니라 남극의 기후와 지질학을 이해하려는 지속적인 국제적 관심을 반영합니다. [NEWLINE][NEWLINE]이 기지는 겨울 평균 기온이 약 -70°C(-94°F)이고 풍속이 초속 50미터를 초과할 수 있는 극한의 환경 조건이 특징입니다. 인프라에는 단열된 거주 공간, 실험실, 발전 시설, 통신 시스템이 포함되어 있으며 모두 혹독한 남극 기후를 견딜 수 있도록 설계되었습니다. 고립과 열악한 조건에도 불구하고 보스토크 기지는 장기 기후 연구, 얼음 코어 샘플링, 극한 미생물 생명체 연구의 허브 역할을 합니다. 과학적 중요성 외에도 인간의 인내와 호기심을 상징하며 지구의 기후 역사, 얼음 역학, 극한 환경에서의 생명체 가능성에 대한 중요한 통찰력을 제공합니다.'),
			('TXT_KEY_BUILDING_VOSTOK_HELP',	'');
			
INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_VOSTOK_HELP_CUT', '세계에서 가장 추운 곳에 지어진 [COLOR_YIELD_FOOD]보스토크 기지[ENDCOLOR]는 [COLOR_CITY_BLUE]설원[ENDCOLOR](+1[ICON_FOOD], +1[ICON_PRODUCTION], +4[ICON_RESEARCH]/타일) 또는 지하 [COLOR_CITY_GREEN]호수[ENDCOLOR](+5[ICON_RESEARCH]/타일)와 관련된 많은 특이한 연구([ICON_GREAT_SCIENTIST] 슬롯 3개)를 수행할 수 있습니다. 모든 샘플은 모든 종류의 연구 시설에서 전 세계적으로 분석됩니다(+3[ICON_FOOD]/모든 [COLOR_YIELD_FOOD]의학 연구소[ENDCOLOR]; +2[ICON_RESEARCH]/모든 [COLOR_YIELD_FOOD]연구소[ENDCOLOR]).';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]설원[ENDCOLOR]; 타일: [COLOR_CYAN]평지[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_VOSTOK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]설원[ENDCOLOR]; 타일: [COLOR_CYAN]평지[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_VOSTOK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]합리 완성[ENDCOLOR]; '||Text WHERE Tag ='TXT_KEY_BUILDING_VOSTOK_HELP' AND EXISTS (SELECT * FROM Community WHERE Type='MW-SETTING-POLICIES' AND Value=1);
----------------------------------------------------
-- Milestii Mici Winery
INSERT INTO Language_ko_KR 
			(Tag,										Text)
VALUES		('TXT_KEY_BUILDING_MILESTII_MICI',			'밀레스티 미치 와이너리'),
			('TXT_KEY_WONDER_MILESTII_MICI_QUOTE',		'[NEWLINE]"내가 더 이상 술을 마시지 않는다는 것은 사실이다. 하지만 덜 마시는 것도 아니다."[NEWLINE] - W.C. 필즈[NEWLINE]'),
			('TXT_KEY_BUILDING_MILESTII_MICI_PEDIA',	'몰도바 키시너우 근처에 위치한 밀레스티 미치 와이너리는 세계에서 가장 큰 와인 저장고 중 하나를 보유하고 있는 것으로 유명합니다. 와이너리의 기원은 원래 채굴 목적으로 만들어진 광범위한 석회암 터널이 와인 저장용으로 용도가 변경된 1960년대로 거슬러 올라갑니다. 지하 200km(124마일) 이상 뻗어 있는(현재 약 55km만 사용 중) 이 저장고는 12~14°C(54~57°F)의 일정한 온도와 85~95%의 습도로 와인 숙성에 이상적인 조건을 제공합니다. 밀레스티 미치는 몰도바 와인 문화의 상징이 되어 이 나라의 와인 제조 전문성을 보여주고 몰도바 와인을 국제 시장에 수출하는 데 중심적인 역할을 했습니다. [NEWLINE][NEWLINE]이 와이너리는 규모뿐만 아니라 지하 터널을 따라 조직된 줄에 수백만 병이 저장된 방대한 빈티지 와인 컬렉션으로도 유명합니다. 컬렉션에는 페테아스카 네아그라 및 라라 네아그라와 같은 현지 몰도바 품종과 국제 와인이 포함됩니다. 밀레스티 미치는 독특한 지하 환경에서 가이드 투어, 시음, 행사를 제공하는 인기 있는 관광지가 되었습니다. 역사적 독창성, 자연 저장 조건, 광범위한 와인 유산의 결합으로 이 와이너리는 산업적 적응과 포도 재배의 우수성을 모두 보여주는 놀라운 예가 되어 전 세계의 와인 애호가들을 끌어들이고 있습니다.'),
			('TXT_KEY_BUILDING_MILESTII_MICI_HELP',		'');
			
INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_MILESTII_MICI_HELP_CUT', '[COLOR_YIELD_FOOD]밀레스티 미치 와이너리[ENDCOLOR]는 유럽 전역과 전 세계의 최고급 와인을 보유하고 있습니다(+1[ICON_FOOD], +1[ICON_GOLD]/[ICON_CITY_STATE] 친구; +2[ICON_FOOD], +1[ICON_PRODUCTION], +2[ICON_GOLD]/[ICON_CITY_STATE] 동맹). 고용된 상인들은 이 모든 것을 한곳에 모으기 위해 최선을 다하며(+1[ICON_FOOD], +1[ICON_PRODUCTION]/[ICON_GREAT_MERCHANT][ICON_GREAT_MERCHANT]) 거래된 이 모든 상품은 새로운 투자의 전반적인 가격을 개선할 수 있습니다(-10[ICON_GOLD][ICON_GOLD] 가속 비용 보정).';
				
UPDATE Language_ko_KR SET Text = '지물: [COLOR_NEGATIVE_TEXT]물[ENDCOLOR], [COLOR_CYAN]숲[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_MILESTII_MICI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지물: [COLOR_NEGATIVE_TEXT]물[ENDCOLOR], [COLOR_CYAN]숲[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_MILESTII_MICI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- (Tehran) Nuclear Research Center
INSERT INTO Language_ko_KR 
			(Tag,											Text) 
VALUES		('TXT_KEY_BUILDING_TEHRAN_FACILITY',			'핵 연구 센터'),
			('TXT_KEY_WONDER_TEHRAN_FACILITY_QUOTE',		'[NEWLINE]"가장 안전한 원자력 또는 에너지 정책은 ''원전 제로''를 실현하는 것이다"[NEWLINE] - 간 나오토[NEWLINE]'),
			('TXT_KEY_BUILDING_TEHRAN_FACILITY_PEDIA',		'테헤란 핵 연구 센터(TNRC)는 드와이트 D. 아이젠하워 대통령의 평화를 위한 원자력 프로그램에 따라 미국의 지원을 받아 1967년에 설립되었습니다. 이란의 민간 핵 프로그램 개발을 위한 초기 노력의 일환으로 모하마드 레자 샤 팔라비 통치 기간에 건설되었습니다. 시설의 핵심은 미국 회사 AMF가 공급한 5메가와트 풀형 연구용 원자로였으며, 처음에는 고농축 우라늄 연료로 가동되었습니다. 이란 원자력 기구(AEOI)가 관리하는 이 센터는 주로 연구, 훈련, 의료 및 산업용 방사성 동위원소 생산을 목적으로 했습니다. 1979년 이란 혁명과 그에 따른 미국과의 관계 단절 이후 농축 우라늄 연료 공급이 중단되어 센터의 지속적인 운영에 어려움이 생겼습니다.[NEWLINE][NEWLINE]테헤란 북부에 물리적으로 위치한 TNRC는 이란의 핵 과학 교육 및 연구를 위한 중요한 장소 역할을 합니다. 시간이 지남에 따라 이란 핵 과학자를 훈련하고 원자로 운영, 핵 안전, 동위원소 생산에 대한 전문 지식을 개발하는 허브가 되었습니다. 국제적으로 이 시설은 특히 무기급 연료에 대한 초기 의존과 이란 핵 프로그램을 둘러싼 광범위한 지정학적 긴장으로 인해 핵 확산에 대한 우려로 주목을 받았습니다. 이러한 논란에도 불구하고 TNRC는 민간 응용 프로그램과 핵 기술에 대한 국가의 장기적인 야망을 모두 지원하는 이란 과학 인프라의 핵심 부분으로 남아 있습니다.'),
			('TXT_KEY_BUILDING_TEHRAN_FACILITY_HELP',		'');

INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_BUILDING_TEHRAN_FACILITY_HELP_CUT', '핵 에너지를 통제하는 자가 전 세계를 통제합니다(+2[ICON_RES_URANIUM]). 그래서 [COLOR_YIELD_FOOD]핵 연구 센터[ENDCOLOR]는 비밀리에 광범위한 연구를 수행하고 새로운 기술을 개발하여(+2[ICON_RESEARCH]; 40[ICON_RESEARCH]/[COLOR_YIELD_GOLD]유닛[ENDCOLOR] 건설) [COLOR_YIELD_FOOD]원자력 발전소[ENDCOLOR]에 조용한 지원을 제공합니다(+2[ICON_PRODUCTION][ICON_PRODUCTION]). 핵심은 당신이 평화적인 프로젝트뿐만 아니라 군사적 목적으로도 이것을 사용하고 있다는 것을 아무도 모르게 하는 것입니다(+25%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]미사일[ENDCOLOR]).');			

UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]전제정치[ENDCOLOR]; 지물: [COLOR_CYAN]물[ENDCOLOR]; 건물: [COLOR_CYAN]연구소[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_TEHRAN_FACILITY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]전제정치[ENDCOLOR]; 지물: [COLOR_CYAN]물[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_TEHRAN_FACILITY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- JFK Space Center
INSERT INTO Language_ko_KR 
			(Tag,							Text)
VALUES		('TXT_KEY_BUILDING_JFK',		'JFK 우주 센터'),
			('TXT_KEY_WONDER_JFK_QUOTE',	'[NEWLINE]"지구의 전망은 정말 장관이며, 뒤를 돌아보고 행성으로서의 지구를 보는 느낌은 정말 놀랍습니다. 그것은 완전히 다른 관점이며, 실제로 우리의 존재가 얼마나 취약한지 깨닫게 해줍니다."[NEWLINE] - 샐리 라이드[NEWLINE]'),
			('TXT_KEY_BUILDING_JFK_PEDIA',	'플로리다주 메리트섬에 위치한 케네디 우주 센터(KSC)는 미국의 유인 우주 비행을 위한 주요 발사 센터입니다. 1962년 NASA에 의해 설립되었으며, 달에 우주비행사를 착륙시키는 것을 목표로 하는 아폴로 프로그램을 지원하고 소련과의 우주 경쟁 중에 국가의 우주 탐사 목표를 발전시키기 위해 만들어졌습니다. 이 센터는 1960년대가 끝나기 전에 미국인을 달에 안전하게 보내겠다는 국가적 목표를 세운 것으로 유명한 존 F. 케네디 대통령의 이름을 따서 명명되었습니다. 수십 년 동안 KSC는 1969년 아폴로 11호 달 착륙, 1981년 시작된 우주 왕복선 프로그램, 그리고 우주와 기술에 대한 인류의 이해를 확장한 후속 무인 및 유인 임무를 포함한 역사적인 임무의 현장이었습니다. [NEWLINE][NEWLINE]케네디 우주 센터는 발사대, 차량 조립 건물, 임무 통제 시설, 우주비행사 훈련 구역을 포함하는 거대한 단지입니다. 또한 대중에게 우주 탐사에 대해 교육하기 위한 전시물, 시뮬레이터, 투어를 제공하는 케네디 우주 센터 방문자 단지도 있습니다. 이 센터는 우주선의 준비, 조립, 발사를 처리할 수 있는 첨단 기술을 갖추고 있으며 추진, 재료, 우주 비행학 연구를 지원합니다. 운영 역할 외에도 KSC는 인간의 독창성, 과학적 성취, 지구 너머를 탐험하려는 열망의 상징으로, 우주 탐사에 영감을 받은 엔지니어, 과학자, 관광객을 끌어들입니다.'),
			('TXT_KEY_BUILDING_JFK_HELP',	'');
			
INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_JFK_HELP_CUT', '[COLOR_YIELD_FOOD]JFK 우주 센터[ENDCOLOR]는 하늘에 닿고자 하는 자유의 목소리입니다(+2[ICON_BULLET]공중 슬롯; +20%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]우주선 부품[ENDCOLOR]). 군사 프로젝트임에도 불구하고 민간인조차 새로운 기술의 혜택을 받을 수 있습니다(-2[ICON_HAPPINESS_3] 문맹; [COLOR_CYAN]인공위성[ENDCOLOR]: +3[ICON_RESEARCH]). 그러나 새로운 기술뿐만 아니라 새로운 개혁도 함께 올 수 있습니다([COLOR_MAGENTA]무료 정책[ENDCOLOR]).';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]평등[ENDCOLOR]; 타일: [COLOR_CYAN]평지[ENDCOLOR]; 건물: [COLOR_CYAN]공항[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_JFK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]평등[ENDCOLOR]; 타일: [COLOR_CYAN]평지[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_JFK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Sputnik
INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_SPUTNIK',		'스푸트니크'),
			('TXT_KEY_WONDER_SPUTNIK_QUOTE',	'[NEWLINE]"이제 옛것과 새것을 영원히 구분하는 소리를 들어보십시오. [스푸트니크 위성이 전송하는 삐-삐 소리를 소개하며]"[NEWLINE] - NBC 라디오[NEWLINE]'),
			('TXT_KEY_BUILDING_SPUTNIK_PEDIA',	'스푸트니크는 지구 궤도에 발사된 최초의 인공위성으로 우주 탐사 역사에서 중추적인 순간을 기록했습니다. 세르게이 코롤레프의 지휘하에 소련이 개발한 스푸트니크 1호는 1957년 10월 4일 바이코누르 우주 기지에서 발사되었습니다. 위성은 지름 약 58cm(23인치)의 금속 구체로, 지구로 무선 신호를 전송하기 위한 4개의 긴 안테나가 장착되어 있었습니다. 성공적인 발사는 미국과 소련 간의 우주 경쟁을 촉발시켰고, 인공 물체를 궤도로 보내는 것의 타당성을 입증했으며 냉전 기간 동안 주요 기술 및 지정학적 이정표를 알렸습니다. 스푸트니크의 발사는 또한 전 세계적으로 과학 연구, 교육 및 새로운 항공 우주 기술 개발에 영감을 주었습니다. [NEWLINE][NEWLINE]스푸트니크는 약 215~939km(134~583마일) 고도에서 지구를 공전하며 대략 96분마다 한 바퀴를 돌았습니다. 무선 신호는 아마추어 무선 통신사가 감지할 수 있어 궤도를 실시간으로 확인하고 우주에 대한 전 세계적인 매력을 불러일으켰습니다. 무게는 83.6kg(184파운드)에 불과했고 대기권에 재진입하기 전 3개월 동안만 궤도에 머물렀지만, 스푸트니크는 과학, 정치, 문화에 지대한 영향을 미쳤습니다. 후속 위성, 우주 탐사선, 유인 우주 비행의 길을 열어 현대 우주 시대의 토대를 마련하고 인류가 우주로 내딛는 첫걸음의 지속적인 상징이 되었습니다.'),
			('TXT_KEY_BUILDING_SPUTNIK_HELP',	'');
			
INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_SPUTNIK_HELP_CUT', '[COLOR_YIELD_FOOD]스푸트니크[ENDCOLOR]는 우주로 가는 길의 이정표입니다(+20%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]우주선 부품[ENDCOLOR]; [ICON_GOLDEN_AGE] 시작). 제국의 다양한 전문 분야가 이 위성이 발견한 것들로부터 혜택을 받을 것이며(+33%[ICON_GREAT_ENGINEER]; +25%[ICON_GREAT_SCIENTIST]), 시민들은 말할 것도 없습니다([COLOR_MAGENTA]무료 정책[ENDCOLOR]).';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]체제[ENDCOLOR]; 개발된 자원: [ICON_RES_ALUMINUM]; 도시: [COLOR_CYAN]과학자 3명[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_SPUTNIK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]체제[ENDCOLOR]; 개발된 자원: [ICON_RES_ALUMINUM].'||Text WHERE Tag ='TXT_KEY_BUILDING_SPUTNIK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Anitkabir
INSERT INTO Language_ko_KR 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_ANITKABIR',			'아니트카비르'),
			('TXT_KEY_WONDER_ANITKABIR_QUOTE',		'[NEWLINE]"가정의 평화, 세계의 평화."[NEWLINE] - 무스타파 케말 아타튀르크[NEWLINE]'),
			('TXT_KEY_BUILDING_ANITKABIR_PEDIA',	'아니트카비르는 앙카라에 위치한 터키 공화국의 창시자이자 초대 대통령인 무스타파 케말 아타튀르크의 영묘입니다. 1944년에 건설이 시작되어 1953년에 완공되었으며, 웅장함과 상징적 의미를 모두 강조한 건축 공모전을 따랐습니다. 건축가 에민 오나트와 오르한 아르다가 설계한 아니트카비르는 터키 독립 전쟁에서 아타튀르크의 리더십과 세속적이고 현대적인 터키 국가를 수립하는 데 있어 그의 중추적인 역할을 기리기 위한 국가 기념물로 구상되었습니다. 이 유적지는 의도적으로 도시가 내려다보이는 언덕에 배치되어 아타튀르크의 비전과 국가에 대한 지속적인 영향력을 상징합니다. 아니트카비르는 이후 국가 의식, 기념행사, 대중의 경의를 표하는 중심 장소가 되었습니다. [NEWLINE][NEWLINE]영묘는 현대와 고전 건축 요소를 결합하여 거대한 의식 광장, 웅장한 열주, 아타튀르크의 무덤이 있는 인상적인 본관을 갖추고 있습니다. 구조물을 둘러싸고 있는 박물관에는 아타튀르크의 생애와 터키 건국 시대와 관련된 개인 소지품, 문서, 사진이 전시되어 있습니다. 단지에는 또한 독립, 단결, 진보라는 주제를 반영하는 상징적인 부조와 비문이 있습니다. 건축적, 역사적 중요성 외에도 아니트카비르는 문화 및 교육 장소 역할을 하며 매년 수백만 명의 방문객을 유치하고 터키의 정체성, 국가적 자부심, 무스타파 케말 아타튀르크의 지속적인 유산에 대한 강력한 상징으로 서 있습니다.'),
			('TXT_KEY_BUILDING_ANITKABIR_HELP',		'');
			
INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_ANITKABIR_HELP_CUT', '[COLOR_YIELD_FOOD]아니트카비르[ENDCOLOR]는 평화로운 세상에 대한 꿈을 실현합니다. 외교적 접촉을 훨씬 쉽게 만들고(+50%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]외교[ENDCOLOR]) 세계 의회에서의 협상을 당신에게 더 유리하게 만듭니다(+1[ICON_DIPLOMAT] 연맹 투표; +1[ICON_DIPLOMAT] 연맹 투표/통제 중인 적 수도). 사람들은 당신과 당신의 정치를 사랑할 것입니다([COLOR_MAGENTA]무료 정책[ENDCOLOR]).';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]전제정치[ENDCOLOR]; 타일: [COLOR_CYAN]언덕[ENDCOLOR]; 지형: [COLOR_NEGATIVE_TEXT]해안[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_ANITKABIR_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]전제정치[ENDCOLOR]; 타일: [COLOR_CYAN]언덕[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_ANITKABIR_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Thule Air Base
INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_THULE',			'툴레 공군 기지'),
			('TXT_KEY_WONDER_THULE_QUOTE',		'[NEWLINE]"현대적이고 자율적이며 철저하게 훈련된 공군이 항상 존재하는 것만으로는 충분하지 않지만, 그것 없이는 국가 안보가 있을 수 없습니다."[NEWLINE] - 헨리 H. 아놀드[NEWLINE]'),
			('TXT_KEY_BUILDING_THULE_PEDIA',	'그린란드 북서부에 위치한 툴레 공군 기지는 미국의 최북단 군사 시설로, 냉전 시대와 그 이후 북미 영공을 감시하고 방어하기 위해 전략적으로 배치되었습니다. 이 기지는 잠재적인 소련의 공격, 특히 핵 위협에 대한 조기 경보 능력을 강화하기 위한 미국-덴마크 협정의 일환으로 1951년에 설립되었습니다. 툴레는 북극 전역에 레이더 기지 체인을 형성한 원거리 조기 경보(DEW) 라인을 포함하여 레이더 및 미사일 방어 시스템 개발의 핵심 장소 역할을 했습니다. 그 역사는 냉전 시대의 지정학적 긴장과 세계 방어 계획에서 북극 지역의 전략적 중요성을 반영합니다. [NEWLINE][NEWLINE]툴레 공군 기지는 대형 군용기를 처리할 수 있는 활주로, 레이더 시설, 주택, 극한의 북극 조건에서 인원을 지원하는 시설을 포함한 광범위한 인프라를 포함합니다. 기온이 -30°C(-22°F) 아래로 떨어질 수 있어 연중 운영을 유지하려면 전문적인 엔지니어링과 물류가 필요합니다. 이 기지는 또한 위성 추적, 우주 감시, 미사일 경보 시스템을 지원하여 미국 및 NATO 방어 네트워크의 중요한 구성 요소가 되었습니다. 군사적 기능 외에도 툴레는 극한 환경에서의 인간 적응력과 세계 안보 및 항공 우주 모니터링에서 북극의 지속적인 전략적 중요성을 나타내는 상징적이고 실질적인 중요성을 가지고 있습니다.'),
			('TXT_KEY_BUILDING_THULE_HELP',		''),
			('TXT_KEY_PROMOTION_THULE',			'작전 범위'),
			('TXT_KEY_PROMOTION_THULE_HELP',	'+5%[ICON_RANGE_STRENGTH]공격 원거리 전투력. +2 [ICON_SWAP] 사거리.');
			
INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_THULE_HELP_CUT', '[COLOR_YIELD_FOOD]툴레 공군 기지[ENDCOLOR]는 지역 격납고에 더 많은 비행기를 보관하거나(+3[ICON_BULLET]공중 슬롯; +2[ICON_SILVER_FIST]), 더 나은 조종사를 훈련하거나(지역 비행기에 +10 경험치; 전역 비행기에 +5 경험치), 전반적인 유닛 능력을 향상시켜([COLOR_WATER_TEXT]작전 범위[ENDCOLOR]/[COLOR_YIELD_GOLD]비행기[ENDCOLOR]) 공중 우위를 강화합니다.';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]설원[ENDCOLOR], [COLOR_CYAN]해안[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_THULE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]설원[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_THULE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- White Sands Missile Range
INSERT INTO Language_ko_KR 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_WHITE_SANDS',		'화이트 샌즈 미사일 발사장'),
			('TXT_KEY_WONDER_WHITE_SANDS_QUOTE',	'[NEWLINE]"자부심이란 무엇인가? 별을 모방하는 로켓이다."[NEWLINE] - 윌리엄 워즈워스[NEWLINE]'),
			('TXT_KEY_BUILDING_WHITE_SANDS_PEDIA',	'뉴멕시코 남부에 위치한 화이트 샌즈 미사일 발사장(WSMR)은 제2차 세계 대전으로 거슬러 올라가는 역사를 가진 미국 최대의 군사 시험장입니다. 1945년 이전 알라모고르도 폭격 및 사격장 부지에 설립된 WSMR은 로켓, 미사일 및 기타 실험용 무기를 테스트하기 위해 만들어졌습니다. 1945년 7월 트리니티 실험으로 알려진 최초의 원자폭탄 실험이 근처에서 실시되었을 때 그 중요성이 즉시 부각되었습니다. 수십 년 동안 WSMR은 유도 미사일, 탄도 로켓, 미사일 방어 시스템을 포함한 광범위한 군사 기술의 개발 및 테스트의 중심지였으며 미국 국방 및 항공 우주 연구에서 중추적인 역할을 했습니다. [NEWLINE][NEWLINE]이 사격장은 거의 8,300제곱킬로미터(3,200제곱마일)의 사막 지형에 걸쳐 있어 실사격 테스트 및 연구를 위한 통제된 환경을 제공합니다. 시설에는 발사대, 추적소, 실험실, 테스트 모니터링을 위한 광범위한 계측 장비가 포함됩니다. WSMR에는 국방부와 민간 항공 우주 프로젝트를 모두 지원하는 화이트 샌즈 테스트 센터도 있습니다. 독특한 석고 모래언덕이 있는 주변 사막 풍경은 테스트를 위한 격리 및 안전을 제공할 뿐만 아니라 유적지의 독특한 지리적 정체성에도 기여합니다. 오늘날 화이트 샌즈 미사일 발사장은 군사 및 항공 우주 능력을 발전시키는 데 있어 역사적 중요성을 반영하여 기술 혁신, 국방 연구 및 훈련의 허브 역할을 계속하고 있습니다.'),
			('TXT_KEY_BUILDING_WHITE_SANDS_HELP',	''),
			('TXT_KEY_PROMOTION_WHITE_SANDS',		'화이트 샌즈 시설'),
			('TXT_KEY_PROMOTION_WHITE_SANDS_HELP',	'+2 [ICON_SWAP] 사거리.');
			
INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_WHITE_SANDS_HELP_CUT', '[COLOR_YIELD_FOOD]화이트 샌즈 미사일 발사장[ENDCOLOR]은 수많은 실험을 통해 로켓 공학을 최고 수준으로 끌어올린 시설입니다([COLOR_WATER_TEXT]화이트 샌즈 시설[ENDCOLOR]/[COLOR_YIELD_GOLD]미사일[ENDCOLOR]; [ICON_GREAT_SCIENTIST] 슬롯 1개). 최신 기술을 사용하여 로켓을 저렴하고 쉽게 제조할 수 있습니다(+33%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]미사일[ENDCOLOR]; +10%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]우주선 부품[ENDCOLOR]; 3 [COLOR_YIELD_GOLD]무료 유도 미사일[ENDCOLOR]).';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]제국주의 완성[ENDCOLOR]; 지형: [COLOR_CYAN]사막[ENDCOLOR]; 타일: [COLOR_CYAN]평지[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_WHITE_SANDS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]제국주의 완성[ENDCOLOR]; 지형: [COLOR_CYAN]사막[ENDCOLOR]; 타일: [COLOR_CYAN]평지[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_WHITE_SANDS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Millau Viaduct
INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_MILLAU',			'미요 대교'),
			('TXT_KEY_WONDER_MILLAU_QUOTE',		'[NEWLINE]"그림자가 있는 구름 위에는 빛이 있는 별이 있다. 무엇보다도 자신을 존중하라."[NEWLINE] - 피타고라스[NEWLINE]'),
			('TXT_KEY_BUILDING_MILLAU_PEDIA',	'프랑스 남부에 위치한 미요 대교는 아베롱 지역의 미요 마을 근처 타른강 계곡을 가로지르는 사장교입니다. 프랑스 구조 공학자 미셸 비를로지와 영국 건축가 노먼 포스터가 설계하여 2004년에 완공되었습니다. 이 프로젝트는 파리와 지중해를 연결하는 A75 고속도로의 교통 흐름을 개선하고 혼잡한 미요 마을을 우회하기 위해 구상되었습니다. 완공 당시 이 고가교는 세계에서 가장 높은 다리가 되었으며, 주탑 중 하나는 높이가 343미터(1,125피트)에 달해 에펠탑 높이를 넘어섰습니다. 이 다리는 혁신적인 구조 설계와 미적 우아함을 결합한 공학적 경이로움으로 찬사를 받았습니다. [NEWLINE][NEWLINE]미요 대교는 날렵하고 치솟은 탑과 일련의 케이블 스테이로 지지되는 유선형 도로가 특징이며, 이를 통해 타른 계곡을 가로질러 2,460미터(8,070피트)를 뻗어 있습니다. 그 디자인은 강도와 최소한의 시각적 영향을 모두 강조하여 주변 풍경과 조화롭게 어우러집니다. 도로는 계곡 위로 높이 솟아 있어 숨 막히는 전망과 지역 전체의 효율적인 이동을 제공합니다. 교통 수단으로서의 기능적 역할 외에도 미요 대교는 현대 공학적 우수성과 건축적 아름다움의 상징이 되었으며, 기술적 성취와 우아한 디자인의 결합을 감탄하는 전 세계 관광객, 엔지니어 및 애호가들을 끌어들이고 있습니다.'),
			('TXT_KEY_BUILDING_MILLAU_HELP',	'');
			
INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_MILLAU_HELP_CUT', '[COLOR_YIELD_FOOD]미요 대교[ENDCOLOR]는 그러한 구조물 없이는 통과하기 매우 어려운 계곡의 양쪽을 연결하여 지역 및 더 먼 곳의 시민(-3[ICON_HAPPINESS_3] 도시화; +1[ICON_HAPPINESS_1])이나 관광객(+5%[ICON_TOURISM][ICON_TOURISM]; 5%[ICON_PRODUCTION] -> [ICON_TOURISM])의 삶을 훨씬 쉽게 만듭니다. 또한 국가 내에서 상품을 운송하는 새로운 지름길 역할도 합니다([ICON_CARAVAN]: +100%[ICON_SWAP]).';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_NEGATIVE_TEXT]해안[ENDCOLOR]; 타일: [COLOR_CYAN]언덕[ENDCOLOR]; 시설: [COLOR_CYAN]마을[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_MILLAU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]언덕[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_MILLAU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Revolutionary Museum
INSERT INTO Language_ko_KR 
			(Tag,											Text)
VALUES		('TXT_KEY_BUILDING_REVOLUTIONARY_MUSEUM',		'혁명 박물관'),
			('TXT_KEY_WONDER_REVOLUTIONARY_MUSEUM_QUOTE',	'[NEWLINE]"억압받는 인민은 투쟁을 통해서만 스스로를 해방시킬 수 있다. 이것은 역사에 의해 확인된 간단하고 명확한 진리이다."[NEWLINE] - 김일성[NEWLINE]'),
			('TXT_KEY_BUILDING_REVOLUTIONARY_MUSEUM_PEDIA',	'북한 평양 만수대 기슭에 위치한 조선혁명박물관은 1948년에 처음 설립되었으며 1960년에 확장되었습니다. 김일성과 김정일의 지도하에 북한의 혁명 역사를 기념하고 서술하기 위해 지어진 이 박물관은 북한에서 가장 큰 박물관 중 하나입니다. 이 박물관은 20세기 초의 항일 투쟁부터 한국 전쟁(1950~1953), 사회주의 국가 발전에 이르기까지 북한의 공식 역사를 보여줍니다. 그 구조와 규모는 상징적 중요성을 반영하며, 웅장함과 혁명적 자부심을 투영하도록 설계된 거대한 전시실이 있습니다. [NEWLINE][NEWLINE]내부에는 유물, 사진, 문서, 디오라마, 대규모 전시물이 있는 수십 개의 전시실이 있습니다. 이 전시물들은 김씨 일가의 리더십과 유산을 강조하기 위해 신중하게 큐레이팅되어 그들을 모든 주요 역사적 사건의 중심으로 묘사합니다. 방문객들은 역사와 이데올로기를 혼합한 서사를 접하며 투쟁, 희생, 국가적 단결이라는 주제를 강조합니다. 조선혁명박물관은 역사적 기관이자 정치적 도구로서 국가의 공식 이데올로기인 주체사상을 강화하고 통치 가문에 대한 충성심을 배양합니다. 이곳은 조직적인 방문을 하는 북한 주민들에게 필수 목적지이자 외국인 관광객들에게는 엄격하게 통제되는 장소로 계속 남아 있습니다.'),
			('TXT_KEY_BUILDING_REVOLUTIONARY_MUSEUM_HELP',	'');
			
INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_REVOLUTIONARY_MUSEUM_HELP_CUT', '[COLOR_YIELD_FOOD]혁명 박물관[ENDCOLOR]은 문명의 지도자들을 신처럼 찬양합니다(+3[ICON_CULTURE]/모든 [COLOR_YIELD_FOOD]기념비[ENDCOLOR]; 50[ICON_CULTURE]/[ICON_GREAT_PEOPLE] 소모; [COLOR_MAGENTA]무료 정책[ENDCOLOR]). 또한 그 자리에 걸맞은 후계자를 가질 확률이 훨씬 높습니다(+10%[ICON_GREAT_PEOPLE][ICON_GREAT_PEOPLE]). 모든 보안 서비스는 전 세계 사람들에게 국가의 가장 중요한 부분을 보여주기 위해 최선을 다합니다(+2[ICON_TOURISM]/모든 [COLOR_YIELD_FOOD]경찰서[ENDCOLOR], [COLOR_YIELD_FOOD]경찰대[ENDCOLOR]).';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]체제[ENDCOLOR]; 건물: [COLOR_CYAN]방송탑, 경찰서[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_REVOLUTIONARY_MUSEUM_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]체제[ENDCOLOR]; 건물: [COLOR_CYAN]방송탑[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_REVOLUTIONARY_MUSEUM_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Arecibo Observatory
INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_ARECIBO',		'아레시보 천문대'),
			('TXT_KEY_WONDER_ARECIBO_QUOTE',	'[NEWLINE]"지구 표면은 우주라는 바다의 기슭이다. 우리는 그곳에서 우리가 아는 것의 대부분을 배웠다. 최근에 우리는 바다로 조금 걸어 들어갔는데, 발가락을 적시거나 기껏해야 발목을 적실 정도였다. 물은 매력적으로 보인다. 바다가 부른다."[NEWLINE] - 칼 세이건[NEWLINE]'),
			('TXT_KEY_BUILDING_ARECIBO_PEDIA',	'아레시보 천문대는 너비가 305미터(1000피트)인 세계 최대의 전파 망원경입니다. 1963년 푸에르토리코 아레시보 근처의 자연적으로 형성된 싱크홀에 건설되었습니다. 지상에 있는 접시와 지면 높이에 따라 높이가 다른 세 개의 탑에 의해 접시 위에 매달려 있는 대형 수신기로 구성되어 있습니다.[NEWLINE][NEWLINE]  1963년 건설된 이래 천문대는 다양한 목적으로 사용되었습니다. 원래 지구의 전리층(태양 복사가 여전히 대기에 영향을 미치는 85km 상공의 지구 대기층. 오로라가 이 층에서 형성됨)을 연구하기 위해 설계된 아레시보 천문대는 이후 다양한 발견을 하고 여러 연구 프로젝트에 사용되었습니다. 1990년 이 망원경은 최초의 외계 행성(우리 태양계 외부에 존재하는 행성)을 발견하는 데 사용되었습니다. 또한 중성자별(뉴욕 브루클린 크기에 해당하는 면적에 지구보다 50만 배 더 많은 질량을 가진 별)을 발견하는 데에도 사용되었습니다. 또한 수많은 다른 천문학적 발견에도 사용되었습니다.[NEWLINE][NEWLINE]  1974년 천문대는 지적 생명체와의 접촉을 희망하며 약 25,000광년 떨어진 구상 성단 M13을 향해 숫자 1~10, DNA 구성, 태양계 및 기타 정보로 구성된 이진 문자 메시지를 보냈습니다.'),
			('TXT_KEY_BUILDING_ARECIBO_HELP',	'[ICON_BULLET]제국 내 모든 [COLOR_CITY_BLUE]산[ENDCOLOR]은 해당 도시에 +1 [ICON_RESEARCH]을 부여합니다.');

UPDATE Language_ko_KR SET Text = '[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_ARECIBO_HELP';
			
INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_ARECIBO_HELP_CUT', '[COLOR_CITY_BLUE]산[ENDCOLOR]에 지어진 과학적 이정표인 [COLOR_YIELD_FOOD]아레시보 천문대[ENDCOLOR](+1[ICON_RESEARCH]/제국 내 타일 -> 해당 도시)는 전문가를 고용하여([ICON_GREAT_SCIENTIST] 슬롯 2개; +1[ICON_RESEARCH]/[ICON_GREAT_SCIENTIST][ICON_GREAT_SCIENTIST]) 많은 지식 영역에서 과학을 발전시킵니다(+2[ICON_GOLD]/모든 [COLOR_YIELD_FOOD]천문대[ENDCOLOR]). 이것은 전 세계의 과학자들을 통합하는 해결책이 될 수 있습니다(+1[ICON_DIPLOMAT] 연맹 투표).';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]합리 완성[ENDCOLOR]; 지형: [COLOR_CYAN]산 (범위 2)[ENDCOLOR]; 시설: [COLOR_CYAN]아카데미[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_ARECIBO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]합리 완성[ENDCOLOR]; 지형: [COLOR_CYAN]산 (범위 2)[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_ARECIBO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Pentagon
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_WONDER_PENTAGON_HELP_CUT', '[COLOR_YIELD_FOOD]펜타곤[ENDCOLOR]은 도시의 군사 능력에 중점을 둡니다(+1[ICON_SILVER_FIST][ICON_SILVER_FIST]; +2 전역 도시 공중 유닛 수용력). 비행기 생산을 위한 병력 증가(+50%[ICON_PRODUCTION], +20 경험치/[COLOR_YIELD_GOLD]비행기[ENDCOLOR]; 2 [COLOR_YIELD_GOLD]무료 제트 전투기[ENDCOLOR]). 그리고 숨겨진 정보 기관 덕분에 스파이를 더 효과적으로 만들 수 있습니다([ICON_PRODUCTION] 방해 확률 증가).');
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]제국주의 완성[ENDCOLOR]; 지물: [COLOR_CYAN]강[ENDCOLOR]; 시설: [COLOR_CYAN]성채/요새[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_PENTAGON_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]제국주의 완성[ENDCOLOR]; 시설: [COLOR_CYAN]성채/요새[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_PENTAGON_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Bletchley Park
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_BUILDING_BLETCHLEY_PARK_HELP_CUT', '[COLOR_YIELD_FOOD]블레츨리 파크[ENDCOLOR]는 과학자(+1[ICON_RESEARCH]/모든 과학자)와 스파이(+200[ICON_SPY_POINT]; +20[ICON_SPY][ICON_SPY] 도시 보안)로 가득 찬 곳입니다. 지식을 늘리기 위해 가장 진보된 [COLOR_YIELD_FOOD]연구소[ENDCOLOR]([COLOR_YIELD_FOOD]무료[ENDCOLOR])가 건설됩니다.');
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]합리 완성[ENDCOLOR]; 지형: [COLOR_CYAN]초원[ENDCOLOR], [COLOR_NEGATIVE_TEXT]해안[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_BLETCHLEY_PARK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]합리 완성[ENDCOLOR]; 지형: [COLOR_NEGATIVE_TEXT]해안[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_BLETCHLEY_PARK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
----------------------------------------------------
-- Svalbard Global Seed Vault
INSERT INTO Language_ko_KR 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_SEED_VAULT',			'스발바르 국제 종자 저장고'),
			('TXT_KEY_WONDER_SEED_VAULT_QUOTE',		'[NEWLINE]"내전 중 시리아에서 파괴된 종자 컬렉션이 체계적으로 재건되었다는 사실은 저장고가 현재와 미래의 식량 공급과 지역 식량 안보를 위한 보험 역할을 한다는 것을 보여줍니다."[NEWLINE] - 안네 베아테 트빈네레임[NEWLINE]'),
			('TXT_KEY_BUILDING_SEED_VAULT_PEDIA',	'스발바르 제도의 노르웨이 스피츠베르겐섬에 위치한 스발바르 국제 종자 저장고는 세계의 농업 생물 다양성을 보존하기 위해 설립된 안전한 종자 은행입니다. 저장고에 대한 아이디어는 기후 변화, 자연재해, 인간 갈등으로 인한 식물 종의 손실에 대한 우려가 커지면서 2000년대 초에 등장했습니다. 2008년에 공식적으로 문을 연 이 시설은 노르웨이 정부, 세계작물다양성재단(Crop Trust), 북유럽 유전자 자원 센터 간의 파트너십을 통해 개발되었습니다. 주요 임무는 세계의 기존 종자 은행을 위한 백업 역할을 하여 식량 안보에 중요한 작물의 수백만 종자 샘플을 보호하는 것입니다. [NEWLINE][NEWLINE]종자 저장고는 산비탈의 영구 동토층에 지어져 컬렉션에 자연 냉장 및 추가 보안을 제공합니다. 이 시설은 -18°C(0°F)의 통제된 환경에 종자를 저장하도록 설계되었으며 저장실은 자연재해 및 인재를 견딜 수 있도록 지어졌습니다. 현재 수천 종의 식물에서 추출한 100만 개 이상의 종자 샘플을 보관하고 있어 세계에서 가장 포괄적인 농업 생물 다양성 저장소입니다. 과학적, 실용적 기능 외에도 스발바르 국제 종자 저장고는 국제 협력, 회복력, 인류 생존과 지속 가능한 농업에 필수적인 작물의 유전적 유산을 보호하려는 전 세계적인 노력의 상징이 되었습니다.'),
			('TXT_KEY_BUILDING_SEED_VAULT_HELP',	'[ICON_BULLET]모든 도시는 새로운 [ICON_CITIZEN] 시민이 태어날 때 [ICON_PRODUCTION] 생산력의 50%를 현재 [ICON_PRODUCTION]에 추가합니다.');

UPDATE Language_ko_KR SET Text = '[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_SEED_VAULT_HELP';
			
INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_SEED_VAULT_HELP_CUT', '[COLOR_YIELD_FOOD]스발바르 국제 종자 저장고[ENDCOLOR]는 비극적인 사건에 대비한 보험 정책입니다(+10%[ICON_FOOD][ICON_FOOD]). 가장 잘 알려진 식물의 씨앗을 포함하고 있으며(+2[ICON_FOOD]/[ICON_RES_WHEAT][ICON_RES_WHEAT], [ICON_RES_MAIZE][ICON_RES_MAIZE], [ICON_RES_RICE][ICON_RES_RICE]), 보안 구역의 생산을 촉진하고(각 도시 [ICON_PRODUCTION]의 50%가 [ICON_CITIZEN] 탄생 시 현재 [ICON_PRODUCTION]에 추가됨) 가장 피해를 입은 사람들을 지원합니다(-15%[ICON_HAPPINESS_3][ICON_HAPPINESS_3] 고통).';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]설원[ENDCOLOR]; 지물: [COLOR_NEGATIVE_TEXT]물[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_SEED_VAULT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]설원[ENDCOLOR]; 지물: [COLOR_NEGATIVE_TEXT]담수[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_SEED_VAULT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Three Gorges Dam
INSERT INTO Language_ko_KR 
			(Tag,											Text) 
VALUES		('TXT_KEY_BUILDING_THREE_GORGES_DAM',			'싼샤 댐'),
			('TXT_KEY_WONDER_THREE_GORGES_DAM_QUOTE',		'[NEWLINE]"돌벽이 서쪽 상류에 서서[NEWLINE]우산의 구름과 비를 막아내면[NEWLINE]좁은 협곡에 잔잔한 호수가 솟아오르리라.[NEWLINE]산의 여신이 아직 그곳에 있다면[NEWLINE]그녀는 그렇게 변한 세상에 놀랄 것이다."[NEWLINE] - "수영", 마오쩌둥[NEWLINE]'),
			('TXT_KEY_BUILDING_THREE_GORGES_DAM_PEDIA',		'중국 후베이성 양쯔강에 위치한 싼샤 댐은 설치 용량 기준으로 세계 최대의 수력 발전소입니다. 이 프로젝트는 1910년대 초 중국 지도자와 엔지니어들에 의해 처음 구상되었지만 정치적 불안정과 제한된 자원으로 인해 실현이 지연되었습니다. 중화인민공화국 건국 이후 본격적인 계획이 재개되었고 1994년 공식적으로 건설이 시작되었습니다. 댐은 2006년에 구조적으로 완공되었으며 2012년에 전체 발전 용량을 달성했습니다. 전기를 생산할 뿐만 아니라 양쯔강의 홍수를 조절하고 강 항해를 개선하기 위한 현대 역사상 가장 야심 찬 공학 프로젝트 중 하나입니다.[NEWLINE][NEWLINE]댐은 양쯔강을 가로질러 2.3km 이상 뻗어 있으며 높이는 약 185미터로 상류로 600km 이상 뻗어 있는 저수지를 만듭니다. 34개의 발전 터빈은 22,500메가와트의 용량을 제공하여 중국 전역의 수백만 가구에 전력을 공급합니다. 이 프로젝트는 상당한 경제적, 에너지적 이점을 가져왔지만 환경적, 사회적 영향으로 인해 논란이 되기도 했습니다. 저수지는 수백 개의 마을과 촌락을 수몰시켜 백만 명이 넘는 사람들을 이주하게 했으며 강 계곡을 따라 생태계와 문화 유적지를 변화시켰습니다. 오늘날 싼샤 댐은 중국의 공학적 기량의 상징이자 대규모 개발과 인간 및 생태적 비용 간의 균형에 대한 논쟁의 초점으로 서 있습니다.'),
			('TXT_KEY_BUILDING_THREE_GORGES_DAM_HELP',		'');

INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_BUILDING_THREE_GORGES_DAM_HELP_CUT', '기념비적인 [COLOR_YIELD_FOOD]싼샤 댐[ENDCOLOR]은 자격을 갖춘 기술자들의 엄청난 노력입니다(+1[ICON_RESEARCH]/[ICON_GREAT_ENGINEER][ICON_GREAT_ENGINEER]; [ICON_GREAT_ENGINEER] 슬롯 2개). 이 거대한 [COLOR_YIELD_FOOD]수력 발전소[ENDCOLOR]([COLOR_YIELD_FOOD]무료[ENDCOLOR])는 [COLOR_CITY_GREEN]강[ENDCOLOR]과 [COLOR_CITY_GREEN]호수[ENDCOLOR]를 기반으로 하는 지역 경제를 지원합니다(+1[ICON_PRODUCTION]/[COLOR_CITY_GREEN]타일[ENDCOLOR]; 도시 [ICON_GOLD]의 200%가 [ICON_CITIZEN] 탄생 시 현재 [ICON_GOLD]에 추가됨)');
				
UPDATE Language_ko_KR SET Text = '지물: [COLOR_CYAN]강[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_THREE_GORGES_DAM_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '지물: [COLOR_CYAN]강[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_THREE_GORGES_DAM_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Palm Jumeirah
INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_JUMEIRAH',		'팜 주메이라'),
			('TXT_KEY_WONDER_JUMEIRAH_QUOTE',	'[NEWLINE]"두바이의 세계적 수준의 물리적 인프라는 이미 무역, 관광 측면에서 주요 플레이어이자 이 지역의 선도적인 회의 및 전시 장소로 자리 잡았습니다."[NEWLINE] - 압둘 아지즈 알 구라이르[NEWLINE]'),
			('TXT_KEY_BUILDING_JUMEIRAH_PEDIA',	'팜 주메이라는 아랍에미리트 두바이에 있는 인공 섬으로 야심 찬 디자인과 호화로운 개발로 유명합니다. 2000년대 초 나킬 프로퍼티스(Nakheel Properties)가 구상하여 2001년에 건설이 시작되었으며 완공까지 10년 이상 걸렸습니다. 이 섬은 양식화된 야자수 모양으로 설계되었으며 줄기, 16개의 잎, 인공 방파제를 형성하는 주변 초승달 모양이 있습니다. 팜 주메이라는 해안선을 확장하고 관광을 활성화하며 고급 주거 및 레저 목적지를 만들기 위한 두바이의 광범위한 전략의 일부였습니다. 그 생성에는 페르시아만 매립과 수백만 입방미터의 모래와 바위 사용을 포함한 광범위한 공학이 필요했습니다. [NEWLINE][NEWLINE]팜 주메이라에는 유명한 아틀란티스 더 팜 리조트를 포함한 고급 호텔, 리조트, 개인 빌라, 엔터테인먼트 시설이 있습니다. 잎 부분에는 고급 주거용 부동산이 있고 줄기 부분에는 소매 센터, 식당 및 기타 도시 편의 시설이 있습니다. 초승달 부분은 보호 장벽 역할을 하며 고급 리조트와 정박지도 수용합니다. 실용적이고 레크리에이션적인 기능 외에도 팜 주메이라는 두바이의 비전과 야망의 상징적인 상징이 되었으며 최첨단 공학, 건축 혁신, 호화로운 라이프스타일의 조화를 나타내며 전 세계의 거주자와 관광객을 끌어들이고 있습니다.'),
			('TXT_KEY_BUILDING_JUMEIRAH_HELP',	'[ICON_BULLET]제국 내 모든 [COLOR_CITY_GREEN]산호섬[ENDCOLOR]에서 +7 [ICON_TOURISM].');

UPDATE Language_ko_KR SET Text = '[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_JUMEIRAH_HELP';
			
INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_JUMEIRAH_HELP_CUT', '[COLOR_YIELD_FOOD]팜 주메이라[ENDCOLOR]라고 불리는 인공 섬은 부유한 관광객을 위해 [COLOR_CITY_GREEN]산호섬[ENDCOLOR]에 새로운 공간을 만듭니다(+7[ICON_TOURISM]/제국 내 타일). 전체 건설은 지역 [COLOR_CITY_BLUE]사막[ENDCOLOR]에서 모은 모래(+3[ICON_PRODUCTION]/타일; 10%[ICON_PRODUCTION] -> [ICON_GOLD]; 15%[ICON_PRODUCTION] -> [ICON_TOURISM])와 영토에서 발견된 [COLOR_GREY]석유[ENDCOLOR] 매장지(+4[ICON_GOLD]/[ICON_RES_OIL][ICON_RES_OIL]) 덕분에 가능했습니다.';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 개발된 자원: [ICON_RES_OIL].'||Text WHERE Tag ='TXT_KEY_BUILDING_JUMEIRAH_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_JUMEIRAH_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Taipei 101
INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_TAIPEI',			'타이베이 101'),
			('TXT_KEY_WONDER_TAIPEI_QUOTE',		'[NEWLINE]"모든 것은 디자인된다. 잘 디자인된 것은 거의 없다."[NEWLINE] - 브라이언 리드[NEWLINE]'),
			('TXT_KEY_BUILDING_TAIPEI_PEDIA',	'대만 타이베이 신이구에 위치한 타이베이 101은 2004년부터 2010년까지 세계에서 가장 높은 건물 타이틀을 보유했던 랜드마크 마천루입니다. 1999년에 건설이 시작되어 2004년에 완공되었으며, 대만의 잦은 지진과 태풍을 견딜 수 있도록 구조 엔지니어들과 협력하여 대만 건축가 C.Y. 리가 설계했습니다. 타이베이 101은 현대 대만의 상징이자 전통적인 아시아 가치를 나타내는 것으로 구상되었으며, 성장과 회복력을 의미하는 대나무 줄기에서 영감을 얻은 요소와 현대적인 디자인을 혼합했습니다. 이 건물은 경제 발전과 국제적 인정의 중심지가 되었으며 금융, 상업, 지속 가능한 건축에 대한 대만의 야망을 반영합니다. [NEWLINE][NEWLINE]높이 508미터(1,667피트), 지상 101층, 지하 5층인 타이베이 101은 다층 탑 모양의 독특한 포스트모던 디자인이 특징입니다. 이 건물에는 강풍과 지진 발생 시 건물을 안정시키는 거대한 동조 질량 감쇠기를 포함한 첨단 공학 기술이 통합되어 있습니다. 타이베이 101에는 사무실, 소매 공간, 레스토랑, 타이베이 시내의 탁 트인 전망을 제공하는 전망대가 있습니다. 기능적 용도 외에도 새해 전야 불꽃놀이와 행사를 주최하고 대만의 기술 혁신, 건축적 우수성, 글로벌 입지를 상징하는 문화 및 관광 아이콘이 되었습니다.'),
			('TXT_KEY_BUILDING_TAIPEI_HELP',	'');
			
INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_TAIPEI_HELP_CUT', '[COLOR_YIELD_FOOD]타이베이 101[ENDCOLOR]은 기술자들에게 큰 도전입니다(+1[ICON_RESEARCH]/[ICON_GREAT_ENGINEER][ICON_GREAT_ENGINEER]). 외교 거점(+1[ICON_DIPLOMAT] 연맹 투표), 비즈니스 센터(+2[ICON_GOLD]/모든 [COLOR_YIELD_FOOD]은행[ENDCOLOR], [COLOR_YIELD_FOOD]증권 거래소[ENDCOLOR]) 및 지역 [COLOR_CITY_BROWN]촌락[ENDCOLOR]과 [COLOR_CITY_BROWN]마을[ENDCOLOR]을 연결하는 상업 허브(+2[ICON_GOLD]/타일) 역할을 합니다.';
				
UPDATE Language_ko_KR SET Text = '시설: [COLOR_CYAN]마을[ENDCOLOR]; 플레이어: [COLOR_CYAN]3 [ICON_CITY_STATE] 동맹[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_TAIPEI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = ''||Text WHERE Tag ='TXT_KEY_BUILDING_TAIPEI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Curiosity Rover
INSERT INTO Language_ko_KR 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_CURIOSITY',			'큐리오시티 로버'),
			('TXT_KEY_WONDER_CURIOSITY_QUOTE',		'[NEWLINE]"우리가 완료한 프로젝트는 우리가 아는 것을 보여주고, 미래의 프로젝트는 우리가 무엇을 배울지 결정합니다."[NEWLINE] - 모신 티와나 박사[NEWLINE]'),
			('TXT_KEY_BUILDING_CURIOSITY_PEDIA',	'큐리오시티 로버는 화성 과학 실험실(MSL) 임무의 일환으로 NASA가 개발한 자동차 크기의 로봇 탐사선으로, 화성의 게일 분화구를 탐사하도록 설계되었습니다. 2011년 11월 26일에 발사되어 2012년 8월 6일에 성공적으로 착륙한 큐리오시티는 첨단 과학 능력과 로버를 화성 표면에 안전하게 내리기 위한 "스카이 크레인"을 포함한 혁신적인 착륙 시스템으로 행성 탐사의 주요 이정표를 세웠습니다. 임무의 주요 목표는 기후, 지질학, 표면 구성을 연구하여 화성에 미생물이 살기에 적합한 조건이 있었는지 확인하는 것이었습니다. 큐리오시티의 화성 도착은 수십 년간의 로봇 탐사에 뒤이어 이루어졌으며, 이전 임무의 지식을 바탕으로 붉은 행성에 대한 과학적 조사 범위를 크게 확장했습니다. [NEWLINE][NEWLINE]큐리오시티에는 카메라, 분광계, 방사선 탐지기, 환경 센서를 포함한 정교한 장비가 장착되어 있어 암석, 토양, 대기 샘플을 전례 없이 자세하게 분석할 수 있습니다. 6륜 이동 시스템을 통해 모래언덕에서 바위 노두에 이르기까지 다양한 지형을 횡단할 수 있으며 로봇 팔은 심층 검사를 위해 샘플을 수집합니다. 로버는 고대 강바닥의 증거, 유기 분자, 변동하는 메탄 수치를 포함하여 수많은 발견을 했으며 화성의 잠재적 거주 가능성에 대한 통찰력을 제공했습니다. 과학적 성취 외에도 큐리오시티는 전 세계 대중의 상상력을 사로잡아 인간의 독창성, 지식 추구, 이웃 행성을 탐험하고 이해하려는 지속적인 탐구를 상징합니다.'),
			('TXT_KEY_BUILDING_CURIOSITY_HELP',		'[ICON_BULLET]모든 연구 협정에 대해 +10 [ICON_GOLDEN_AGE].');

UPDATE Language_ko_KR SET Text = '[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_CURIOSITY_HELP';
			
INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_CURIOSITY_HELP_CUT', '[COLOR_YIELD_FOOD]큐리오시티 로버[ENDCOLOR]를 보내는 것은 태양계를 지배할 힘과 의지가 있다는 것을 다른 국가들에게 알리는 자극제입니다(50[ICON_INFLUENCE]/[ICON_CITY_STATE][ICON_CITY_STATE]). 이것은 한 황금기에서 다른 황금기로 나아가는 영광스러운 행진의 시작일 뿐입니다(+10[ICON_GOLDEN_AGE][ICON_GOLDEN_AGE]/연구 협정; +3[ICON_GOLDEN_AGE]/[ICON_GREAT_ENGINEER][ICON_GREAT_ENGINEER],[ICON_GREAT_SCIENTIST][ICON_GREAT_SCIENTIST]).';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]산 (범위 2)[ENDCOLOR]; 지물: [COLOR_NEGATIVE_TEXT]물[ENDCOLOR]; 개발된 자원: [ICON_RES_ALUMINUM].'||Text WHERE Tag ='TXT_KEY_BUILDING_CURIOSITY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]사막[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_CURIOSITY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Global Positioning System
INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_GPS',			'위성 위치 확인 시스템'),
			('TXT_KEY_WONDER_GPS_QUOTE',		'[NEWLINE]"세스나 150이 머리 위를 선회하는 미확인 공항, 신원을 밝히십시오."[NEWLINE] - 조지 W. 스튜어트[NEWLINE]'),
			('TXT_KEY_BUILDING_GPS_PEDIA',		'위성 위치 확인 시스템(GPS)은 미국 국방부가 개발한 위성 기반 내비게이션 시스템입니다. 그 기원은 미군이 지구 어디에서나 정확한 위치, 내비게이션, 타이밍 정보를 제공할 수 있는 신뢰할 수 있는 방법을 모색했던 1970년대로 거슬러 올라갑니다. 최초의 실험용 GPS 위성은 1978년에 발사되었으며 1990년대 중반까지 지구를 공전하는 24개의 위성으로 구성된 시스템이 완전히 가동되었습니다. 처음에는 군사적 용도로 의도되었지만 GPS는 1980년대에 민간 응용 프로그램에 개방되어 결국 전 세계 운송, 통신, 상업을 위한 중요한 인프라가 되었습니다. [NEWLINE][NEWLINE]GPS는 위성에서 전송된 신호를 지상의 수신기로 사용하여 신호가 도착하는 데 걸리는 시간을 기준으로 사용자의 정확한 위치를 계산합니다. 이 시스템은 위치, 내비게이션, 타이밍에 대한 매우 정확한 데이터를 제공하여 항공, 해상 내비게이션, 농업, 측량, 일상적인 스마트폰 애플리케이션과 같은 산업을 지원합니다. 시간이 지남에 따라 기술 발전으로 GPS의 정밀도가 향상되어 보강 시스템과 결합할 때 오차가 수 미터에서 불과 몇 센티미터로 줄어들었습니다. 오늘날 GPS는 여러 글로벌 내비게이션 위성 시스템(GNSS) 중 하나이지만 여전히 가장 널리 사용되며 전 세계의 민간 생활과 군사 작전을 모두 뒷받침합니다.'),
			('TXT_KEY_BUILDING_GPS_HELP',		'');
			
INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_BUILDING_GPS_HELP_CUT', '[COLOR_YIELD_FOOD]위성 위치 확인 시스템(GPS)[ENDCOLOR]은 국가의 보안을 유지하는 데 도움이 됩니다(+200[ICON_SPY_POINT]; +20[ICON_SPY][ICON_SPY] 도시 보안). 공격(25[ICON_GREAT_GENERAL], 25[ICON_GREAT_ADMIRAL]/[ICON_SPY] 공격)과 방어(50[ICON_PRODUCTION], 50[ICON_GOLD]/[ICON_SPY] 방어) 모두 후하게 보상받습니다.';
				
UPDATE Language_ko_KR SET Text = '건물: [COLOR_CYAN]전략 방위 시스템[ENDCOLOR]; 개발된 자원: [ICON_RES_URANIUM].'||Text WHERE Tag ='TXT_KEY_BUILDING_GPS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '개발된 자원: [ICON_RES_URANIUM].'||Text WHERE Tag ='TXT_KEY_BUILDING_GPS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- CN Tower
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_WONDER_CN_TOWER_HELP_CUT',	'[COLOR_YIELD_FOOD]CN 타워[ENDCOLOR]는 대중을 위한(+1[ICON_HAPPINESS_1]/도시) 특이한 [COLOR_YIELD_FOOD]방송탑[ENDCOLOR]([COLOR_YIELD_FOOD]무료[ENDCOLOR])입니다. 모든 작품은 훨씬 더 가치 있게 되고(+2[ICON_GOLD], +2[ICON_TOURISM], +25%[ICON_TOURISM], +25%[ICON_TOURISM][ICON_TOURISM]/[ICON_GREAT_WORK][ICON_GREAT_WORK]) 모든 불가사의는 이제 관광 중심지가 됩니다(모든 [ICON_WONDER] [COLOR_YIELD_FOOD]세계 불가사의[ENDCOLOR], [COLOR_CITY_GREEN]자연 경관[ENDCOLOR] 및 [COLOR_CITY_BLUE]타일[ENDCOLOR]의 +25%[ICON_CULTURE]가 [ICON_TOURISM][ICON_TOURISM]으로 전환되고 또 다른 25%가 [ICON_TOURISM]으로 전환됨).');
				
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]평지[ENDCOLOR]; 지물: [COLOR_CYAN]호수[ENDCOLOR]; 플레이어: [COLOR_CYAN]행복 > 80%[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_CN_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지물: [COLOR_CYAN]호수[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_CN_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Sydney Opera House
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_WONDER_SYDNEY_OPERA_HOUSE_HELP_CUT', '놀랍고 독창적인 건축의 경이로움인 [COLOR_YIELD_FOOD]시드니 오페라 하우스[ENDCOLOR]는 많은 귀족을 홀로 불러들여 문화와 경험을 공유합니다([COLOR_MAGENTA]무료 정책[ENDCOLOR]; +25%[ICON_CULTURE]). 이곳에서 전 세계의 멋지고 영감을 주는 음악 작품을 들을 수 있습니다(테마 보너스 시 2[ICON_GW_MUSIC]: [ICON_CULTURE]).');
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 걸작: [COLOR_CYAN]4[ICON_GW_MUSIC][ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_SYDNEY_OPERA_HOUSE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_SYDNEY_OPERA_HOUSE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Great Firewall
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_BUILDING_GREAT_FIREWALL_HELP_CUT',	'[COLOR_YIELD_FOOD]만리방화벽[ENDCOLOR]은 도시 시스템 해킹을 훨씬 더 어렵게 만듭니다(+50[ICON_SPY] 도시 보안). 다른 문명의 영향력에 저항할 수 있으며(기술로 인한 외국 [ICON_TOURISM] 보너스 무효화) [COLOR_YIELD_FOOD]연구소[ENDCOLOR](+10[ICON_RESEARCH])가 훨씬 더 효과적이 됩니다.');
				
UPDATE Language_ko_KR SET Text = '건물: [COLOR_CYAN]경찰서, 통신사[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_GREAT_FIREWALL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = ''||Text WHERE Tag ='TXT_KEY_BUILDING_GREAT_FIREWALL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Hubble Space Telescope
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_WONDER_HUBBLE_HELP_CUT', '[COLOR_YIELD_FOOD]허블 우주 망원경[ENDCOLOR]은 과학적 승리를 향한 마지막 단계이며(+25%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]우주선 부품[ENDCOLOR]), 최신 [COLOR_YIELD_FOOD]우주선 공장[ENDCOLOR]([COLOR_YIELD_FOOD]무료[ENDCOLOR])의 지원을 받습니다. 우주를 향한 이 거대한 도약은 추가 발전을 위한 영감이 될 수 있습니다(1 [COLOR_YIELD_GOLD]무료 [ICON_GREAT_SCIENTIST][ENDCOLOR]).');
				
UPDATE Language_ko_KR SET Text = '개발된 자원: [ICON_RES_ALUMINUM]; 플레이어: [COLOR_CYAN]연구 협정[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_HUBBLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '개발된 자원: [ICON_RES_ALUMINUM].'||Text WHERE Tag ='TXT_KEY_WONDER_HUBBLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- CERN
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_BUILDING_CERN_HELP_CUT', '숨겨진 [COLOR_YIELD_FOOD]CERN[ENDCOLOR] 시설은 모든 과학자를 모아 거대한 기술적 돌파구를 마련하고(2 [COLOR_CYAN]무료 기술[ENDCOLOR]) 당신이 멀어지는 것을 지켜볼 수밖에 없는 사람들을 놀라게 합니다(+100[ICON_INFLUENCE]/[ICON_CITY_STATE]).');
				
UPDATE Language_ko_KR SET Text = '개발된 자원: [ICON_RES_URANIUM]; 건물: [COLOR_CYAN]연구소[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_CERN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '개발된 자원: [ICON_RES_URANIUM].'||Text WHERE Tag ='TXT_KEY_BUILDING_CERN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- WORLD COGNGRESS WORLD WONDERS
----------------------------------------------------
-- Crystal Palace
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_BUILDING_CRYSTAL_PALACE_HELP_CUT',	'[COLOR_YIELD_FOOD]수정궁[ENDCOLOR]은 거대한 산업 잠재력의 결과입니다. 모든 [COLOR_YIELD_FOOD]공장[ENDCOLOR]을 강화하고(+2[ICON_PRODUCTION]; +2[ICON_RESEARCH]) 문명의 새로운 시대를 엽니다([ICON_GOLDEN_AGE] 시작).');
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR:45:150:50:255]"만국 박람회" 프로젝트 승리[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_CRYSTAL_PALACE_HELP';
----------------------------------------------------
-- UN
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_BUILDING_UNITED_NATIONS_HELP_CUT', '[COLOR_YIELD_FOOD]국제 연합[ENDCOLOR]은 세계에서 가장 영향력 있는 위원회가 될 수 있으며([ICON_GOLDEN_AGE] 시작; [COLOR:45:150:50:255]세계 의회 회기[ENDCOLOR] 시작), 최고의 대표단(+1[ICON_DIPLOMAT])이 시민들과 이곳에서 목소리를 내지 못하는 작은 국가들에게 가장 중요한 것이 무엇인지 보여줄 것입니다(25[ICON_INFLUENCE]/[ICON_CITY_STATE]/[ICON_GREAT_PEOPLE]).');
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR:45:150:50:255]"국제 연합" 프로젝트 승리[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_UNITED_NATIONS_HELP';
----------------------------------------------------
-- Grand Canal
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_BUILDING_GRAND_CANAL_HELP_CUT', '[COLOR_YIELD_FOOD]대운하[ENDCOLOR]는 해상 전선에서 목숨을 걸고 싸우는 모든 사람들에 대한 헌신을 보여줍니다([COLOR_WATER_TEXT]보물선[ENDCOLOR]/[COLOR_YIELD_GOLD]해상 군사 (항공모함, 잠수함 제외)[ENDCOLOR]). 또한 또 다른 교역로를 개설할 수 있지만(+1[ICON_INTERNATIONAL_TRADE]), 육상 연결일지 해상 연결일지는 당신의 선택입니다.');
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR:45:150:50:255]"보물선" 프로젝트 승리[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_GRAND_CANAL_HELP';
----------------------------------------------------
-- International Space Station
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_BUILDING_INTERNATIONAL_SPACE_STATION_HELP_CUT', '과학자와 기술자가 [COLOR_YIELD_FOOD]국제 우주 정거장[ENDCOLOR]에서 함께 협력하여 장벽을 허뭅니다(+1[ICON_RESEARCH]/모든 기술자; (+1[ICON_PRODUCTION]/모든 과학자). 그들의 노력은 기술적 부스트를 제공하며(+33%[ICON_RESEARCH]/[ICON_GREAT_SCIENTIST]), 산업 문제에 대한 혁신적인 솔루션입니다(200[ICON_PRODUCTION]/[COLOR_CYAN]기술[ENDCOLOR]).');
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR:45:150:50:255]"국제 우주 정거장" 프로젝트 승리[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_INTERNATIONAL_SPACE_STATION_HELP';
----------------------------------------------------
-- Olympic Village
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_BUILDING_OLYMPIC_VILLAGE_HELP_CUT', '올림픽 게임은 이 어려운 시기에 큰 기쁨의 원천입니다(+3[ICON_HAPPINESS_1]). [COLOR_YIELD_FOOD]올림픽 선수촌[ENDCOLOR]은 사람들을 한데 모아 경기를 관람하며 주변의 고통을 잊게 합니다(모든 [ICON_WONDER] [COLOR_YIELD_FOOD]세계 불가사의[ENDCOLOR], [COLOR_CITY_GREEN]자연 경관[ENDCOLOR] 및 [COLOR_CITY_BROWN]시설[ENDCOLOR]의 +25%[ICON_CULTURE]를 [ICON_TOURISM]으로 전환). 건설된 모든 [COLOR_YIELD_FOOD]경기장[ENDCOLOR](+2[ICON_GOLD]; +2[ICON_TOURISM])은 다가오는 세계 행사의 중심이 됩니다.');
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR:45:150:50:255]"국제 경기" 프로젝트 승리[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_OLYMPIC_VILLAGE_HELP';
----------------------------------------------------
-- Menin Gate
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_BUILDING_MENIN_GATE_HELP_CUT', '[COLOR_YIELD_FOOD]메닌 문[ENDCOLOR]은 미래 세대에 대한 훈계가 될 것입니다(+2[ICON_CULTURE], +2[ICON_GOLDEN_AGE]/사망). 이 기념비뿐만 아니라 최근 전투와 관련된 각 장소는 거대한 고통을 나타냅니다(+1[ICON_GREAT_WRITER], +1[ICON_GOLDEN_AGE]/모든 [COLOR_CITY_BROWN]요새[ENDCOLOR], [COLOR_CITY_BROWN]성채[ENDCOLOR] 및 [COLOR_CITY_BROWN]랜드마크[ENDCOLOR]). 어쩌면 현재의 번영을 유지할 기회가 있을지도 모릅니다(+2[ICON_HAPPINESS_1]).');
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR:45:150:50:255]"글로벌 워게임" 프로젝트 승리[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_MENIN_GATE_HELP';
----------------------------------------------------
-- AMERICA'S UNIQUE WORLD WONDERS (VP v3.8)
----------------------------------------------------
-- Smithsonian Institute
INSERT INTO Language_ko_KR (Tag, Text)
VALUES ('TXT_KEY_WONDER_SMITHSONIAN_INSTITUTION_QUOTE',	'[NEWLINE]"나는 매일 밤 책을 읽는다. 나는 정말 괴짜라서 스미소니언에 가서 뒷방에 들어가 물건들을 가지고 놀 수 있다는 것은 나 같은 사람에게는 정말 놀라운 일이다."[NEWLINE] - 릭 해리슨[NEWLINE]');
			
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_BUILDING_SMITHSONIAN_INSTITUTION_HELP_CUT', '[COLOR_YIELD_FOOD]스미소니언 협회[ENDCOLOR]는 광범위한 유물로 가득 찬 특이한 [COLOR_YIELD_FOOD]박물관[ENDCOLOR]([COLOR_YIELD_FOOD]무료[ENDCOLOR]; +5[ICON_CULTURE][ICON_CULTURE]; +5[ICON_RESEARCH][ICON_RESEARCH])입니다(+1[ICON_RESEARCH]/[ICON_GREAT_WORK][ICON_GREAT_WORK]; +5[ICON_RESEARCH]/모든 [COLOR_CITY_BROWN]랜드마크[ENDCOLOR]). 과학이 핵심이지만(+2[ICON_RESEARCH]; +2[ICON_GREAT_SCIENTIST]; +5[ICON_CULTURE], +5[ICON_RESEARCH]/모든 [COLOR_YIELD_FOOD]연구소[ENDCOLOR]), 문화는 국가를 하나로 묶는 유일한 것이므로(+2[ICON_CULTURE], +2[ICON_RESEARCH]/모든 [ICON_WONDER] [COLOR_YIELD_FOOD]세계 불가사의[ENDCOLOR]; +2[ICON_CULTURE]) 더 확장하려면 어떤 대가를 치르더라도 투자해야 합니다(10%[ICON_GOLD][ICON_GOLD] -> [ICON_CULTURE])(-25%[ICON_GOLD][ICON_GOLD] 타일 구매 비용).');
				
UPDATE Language_ko_KR SET Text = '문명: [COLOR:45:90:170:255]미국[ENDCOLOR]; 건물: [COLOR_CYAN]왕립 컬렉션[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_SMITHSONIAN_INSTITUTION_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '문명: [COLOR:45:90:170:255]미국[ENDCOLOR]; 건물: [COLOR_CYAN]왕립 컬렉션[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_SMITHSONIAN_INSTITUTION_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- West Point
INSERT INTO Language_ko_KR (Tag, Text)
VALUES ('TXT_KEY_WONDER_WEST_POINT_QUOTE', '[NEWLINE]"웨스트포인트 졸업생 군대를 주면 전투에서 이길 것이고... 텍사스 농대생 한 줌을 주면 전쟁에서 이길 것이다."[NEWLINE] - 조지 S. 패튼[NEWLINE]');
			
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_BUILDING_WEST_POINT_HELP_CUT', '[COLOR_YIELD_FOOD]웨스트포인트[ENDCOLOR]는 거대한 군대를 위한 상위 티어 [COLOR_YIELD_FOOD]사관학교[ENDCOLOR]([COLOR_YIELD_FOOD]무료[ENDCOLOR]; +5[ICON_PRODUCTION][ICON_PRODUCTION]; +5[ICON_RESEARCH][ICON_RESEARCH])입니다([COLOR_WATER_TEXT]스플래시 I[ENDCOLOR]/[COLOR_YIELD_GOLD]공성[ENDCOLOR], [COLOR_YIELD_GOLD]해상 원거리[ENDCOLOR]; +5[ICON_GREAT_GENERAL]). 개발(+2[ICON_RESEARCH]; 10%[ICON_GOLD][ICON_GOLD] -> [ICON_RESEARCH]) 및 장비 품질(+5[ICON_STRENGTH]; +5[ICON_PRODUCTION], +5[ICON_RESEARCH]/모든 [COLOR_YIELD_FOOD]병기고[ENDCOLOR])에 대한 지출 증가는 세계 무대에서 당신의 지위를 높이고(-25%[ICON_GOLD][ICON_GOLD] 타일 구매 비용) 중요한 인프라를 양호한 상태로 유지할 것입니다(+2[ICON_PRODUCTION], +2[ICON_RESEARCH]/모든 [ICON_WONDER] [COLOR_YIELD_FOOD]세계 불가사의[ENDCOLOR]; +2[ICON_PRODUCTION])');
				
UPDATE Language_ko_KR SET Text = '문명: [COLOR:45:90:170:255]미국[ENDCOLOR]; 건물: [COLOR_CYAN]왕립 컬렉션[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_WEST_POINT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '문명: [COLOR:45:90:170:255]미국[ENDCOLOR]; 건물: [COLOR_CYAN]왕립 컬렉션[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_WEST_POINT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Slater Mill
INSERT INTO Language_ko_KR (Tag, Text)
VALUES ('TXT_KEY_WONDER_SLATER_MILL_QUOTE', '[NEWLINE]"영국에서 하는 것처럼 좋은 실을 만들지 못하면, 내 서비스에 대해 아무것도 받지 못하고 내가 시도한 모든 것을 다리 너머로 던져버릴 것이다."[NEWLINE] - 사무엘 슬레이터[NEWLINE]');
			
INSERT INTO Language_ko_KR (Tag, Text) 
VALUES ('TXT_KEY_BUILDING_SLATER_MILL_HELP_CUT',	'현명한 지도자는 산업에 새로운 품질을 더하는 현대적인 [COLOR_YIELD_FOOD]공장[ENDCOLOR]([COLOR_YIELD_FOOD]무료[ENDCOLOR]; +5[ICON_PRODUCTION][ICON_PRODUCTION]; +5[ICON_GOLD][ICON_GOLD])인 [COLOR_YIELD_FOOD]슬레이터 밀[ENDCOLOR]을 가져야 합니다(+5[ICON_PRODUCTION], +5[ICON_GOLD]/모든 [COLOR_YIELD_FOOD]증권 거래소[ENDCOLOR]; +2[ICON_PRODUCTION]). 다양한 제품(+2[ICON_GREAT_ENGINEER])은 새로운 시장을 정복하고(+1[ICON_INTERNATIONAL_TRADE]; -25%[ICON_INTERNATIONAL_TRADE] 턴) 전 세계적인 확장을 유도합니다(+2[ICON_GOLD]; -25%[ICON_GOLD][ICON_GOLD] 타일 구매 비용). 당신의 훌륭한 투자(10%[ICON_GOLD][ICON_GOLD] -> [ICON_PRODUCTION])는 확실히 제국 경제에 영향을 미칠 것입니다(+2[ICON_PRODUCTION], +2[ICON_GOLD]/모든 [ICON_WONDER] [COLOR_YIELD_FOOD]세계 불가사의[ENDCOLOR]).');
				
UPDATE Language_ko_KR SET Text = '문명: [COLOR:45:90:170:255]미국[ENDCOLOR]; 건물: [COLOR_CYAN]왕립 컬렉션[ENDCOLOR]; 지물: [COLOR_CYAN]강[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_SLATER_MILL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '문명: [COLOR:45:90:170:255]미국[ENDCOLOR]; 건물: [COLOR_CYAN]왕립 컬렉션[ENDCOLOR]; 지물: [COLOR_CYAN]강[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_BUILDING_SLATER_MILL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
--============================================--
-- EE Compatibility
--============================================--
-- KRONBORG
/*UPDATE Language_ko_KR
SET Text = '해안선은 당신의 방어선입니다. [COLOR_YIELD_FOOD]크론보르[ENDCOLOR]는 그것을 더 강하게 만드는 한 가지 방법입니다(+3[ICON_STRENGTH], +50 HP, +1[ICON_SILVER_FIST]/모든 해안 도시). 더 큰 해군(+50%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]해상 군사[ENDCOLOR])은 강력한 지도자([COLOR_YIELD_GOLD]무료 [ICON_GREAT_ADMIRAL][ENDCOLOR])가 이끌 것이며 보물은 똑똑한 상인들이 관리할 것입니다(+1[ICON_GREAT_MERCHANT]).'
WHERE Tag = 'TXT_KEY_WONDER_EE_KRONBORG_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_EE_KRONBORG_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_EE_KRONBORG_HELP';
			
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]평지[ENDCOLOR]; 지형: [COLOR_CYAN]해안[ENDCOLOR]; 건물: [COLOR_CYAN]항만[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_EE_KRONBORG_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=2 OR Value=1));
----------------------------------------------------
-- VERSAILLES
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]베르사유[ENDCOLOR]는 시간을 보내고 유명한 귀족들을 만나기에 좋은 장소가 될 수 있습니다([COLOR_YIELD_GOLD]무료 [ICON_GREAT_WRITER][ENDCOLOR]). 국민들은 당신의 힘을 알고 있으며 제국 전체가 당신의 이름으로 긴 축제를 조직합니다(+50%[ICON_HAPPINESS_1][ICON_HAPPINESS_1] 사랑해 주간 길이).'
WHERE Tag = 'TXT_KEY_WONDER_EE_VERSAILLES_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_EE_VERSAILLES_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_EE_VERSAILLES_HELP';
			
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]초원[ENDCOLOR]; 타일: [COLOR_CYAN]평지[ENDCOLOR]; 지물: [COLOR_NEGATIVE_TEXT]물[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_EE_VERSAILLES_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]평지[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_EE_VERSAILLES_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- TOPKAPI PALACE
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]톱카프 궁전[ENDCOLOR]은 방어 교리를 기도하여 신앙을 강화합니다(+1[ICON_PEACE]/모든 [COLOR_YIELD_FOOD]방어 건물[ENDCOLOR]). 또한 비행기를 만들면 새로운 명소로 관광객을 데려올 것입니다([COLOR_CYAN]비행[ENDCOLOR]: +3[ICON_GOLD], +2[ICON_TOURISM]).'
WHERE Tag = 'TXT_KEY_WONDER_EE_TOPKAPI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,									Text) 
SELECT		'TXT_KEY_WONDER_EE_TOPKAPI_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_EE_TOPKAPI_HELP';
			
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]언덕[ENDCOLOR]; 지형: [COLOR_CYAN]해안[ENDCOLOR]; 건물: [COLOR_CYAN]영주 저택[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_EE_TOPKAPI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=2 OR Value=1));
----------------------------------------------------
-- TORRE DEL ORO
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]황금의 탑[ENDCOLOR]은 해상 교역로에 집중합니다. 이를 더 쉽고 수익성 있게 만듭니다(+1[ICON_INTERNATIONAL_TRADE]; +1[ICON_GREAT_MERCHANT]; 국제 [ICON_CARGO_SHIP]: +3[ICON_GOLD]; , [ICON_CARGO_SHIP]: +50%[ICON_SWAP]). 밝고 새로운 [COLOR_YIELD_FOOD]건선거[ENDCOLOR]([ICON_STRENGTH]; [ICON_SILVER_FIST])는 해군 패권의 좋은 시작이 될 것입니다.'
WHERE Tag = 'TXT_KEY_WONDER_EE_TORRE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_EE_TORRE_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_EE_TORRE_HELP';
			
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]사막[ENDCOLOR], [COLOR_CYAN]해안[ENDCOLOR]; 지물: [COLOR_CYAN]강[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_EE_TORRE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 지물: [COLOR_CYAN]강[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_EE_TORRE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- WAT PHRA KAEW
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]왓 프라깨우[ENDCOLOR]는 몸과 마음을 연결합니다(+1[ICON_RESEARCH]/모든 [COLOR_YIELD_FOOD]성소[ENDCOLOR]; +2[ICON_RESEARCH]/모든 [COLOR_YIELD_FOOD]사원[ENDCOLOR]). 게다가 발견에 대한 심각한 부스트를 얻습니다(+5[ICON_RESEARCH]; +1[ICON_GREAT_SCIENTIST]).'
WHERE Tag = 'TXT_KEY_WONDER_EE_WAT_PHRA_KAEW_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_EE_WAT_PHRA_KAEW_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_EE_WAT_PHRA_KAEW_HELP';
			
UPDATE Language_ko_KR SET Text = '지물: [COLOR_CYAN]강[ENDCOLOR]; 시설: [COLOR_CYAN]성지[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_EE_WAT_PHRA_KAEW_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지물: [COLOR_CYAN]강[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_EE_WAT_PHRA_KAEW_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- FASIL GHEBBI
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]파실 게비[ENDCOLOR]는 취약한 영토 방어에 대한 깊은 필요에 답합니다(+5[ICON_STRENGTH]; +100 HP). 군대는 이 불가사의 주변에 있을 때 고유한 버프를 받으며([COLOR_WATER_TEXT]파실 게비[ENDCOLOR]/[COLOR_YIELD_GOLD]도시 범위 내 군사[ENDCOLOR]) 더 많이 가질 수 있습니다(+5[ICON_SILVER_FIST]). 기술자들도 이 프로젝트에 참여할 수 있습니다(+1[ICON_GREAT_ENGINEER]).'
WHERE Tag = 'TXT_KEY_WONDER_EE_FASIL_GHEBBI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_EE_FASIL_GHEBBI_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_EE_FASIL_GHEBBI_HELP';
			
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]평원[ENDCOLOR]; 타일: [COLOR_CYAN]언덕[ENDCOLOR]; 지물: [COLOR_NEGATIVE_TEXT]물[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_EE_FASIL_GHEBBI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '타일: [COLOR_CYAN]언덕[ENDCOLOR].'||Text WHERE Tag ='TXT_KEY_WONDER_EE_FASIL_GHEBBI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
	*/