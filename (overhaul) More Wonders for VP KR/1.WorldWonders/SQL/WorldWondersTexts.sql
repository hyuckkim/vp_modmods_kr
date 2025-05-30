----------------------------------------------------
-- Text file for all Wonders
-- Feb 20, 2020: Created, adan_eslavo
----------------------------------------------------
-- Altamira Cave
INSERT INTO Language_en_US 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_ALTAMIRA',			'Altamira Cave'),
			('TXT_KEY_WONDER_ALTAMIRA_QUOTE',		'[NEWLINE]"After Altamira everything seems decadent."[NEWLINE] - Pablo Picasso[NEWLINE]'),
			('TXT_KEY_WONDER_ALTAMIRA_PEDIA',		'Altamira Cave is approximately 1,000 m (3,280.84 ft) meters long and consists of a series of twisting passages and chambers. The main passage varies from two to six meters in height. The cave was formed through collapses following early karst phenomena in the calcareous rock of Mount Vispieres. Archaeological excavations in the cave floor found rich deposits of artifacts from the Upper Solutrean (c. 18,500 years ago) and Lower Magdalenian (between c. 16,590 and 14,000 years ago). Both periods belong to the Paleolithic or Old Stone Age. In the two millennia between these two occupations, the cave was evidently inhabited only by wild animals. Human occupants of the site were well-positioned to take advantage of the rich wildlife that grazed in the valleys of the surrounding mountains as well as the marine life available in nearby coastal areas. Around 13,000 years ago a rockfall sealed the cave''s entrance, preserving its contents until its eventual discovery, which occurred after a nearby tree fell and disturbed the fallen rocks. Human occupation was limited to the cave mouth, although paintings were created throughout the length of the cave. The artists used charcoal and ochre or hematite to create the images, often diluting these pigments to produce variations in intensity and creating an impression of chiaroscuro. They also exploited the natural contours of the cave walls to give their subjects a three-dimensional effect. The Polychrome Ceiling is the most impressive feature of the cave, depicting a herd of extinct steppe bison (Bison priscus) in different poses, two horses, a large doe, and possibly a wild boar. Dated to the Magdalenian occupation, these paintings include abstract shapes in addition to animal subjects. Solutrean paintings include images of horses and goats, as well as handprints that were created when artists placed their hands on the cave wall and blew pigment over them to leave a negative image. Numerous other caves in northern Spain contain Paleolithic art, but none is as complex or well-populated as Altamira.'),
			('TXT_KEY_WONDER_ALTAMIRA_HELP',		'Contains 1 slot for [ICON_GREAT_WORK] Great Work of Art or Artifact. +3 [ICON_CULTURE] Culture with [COLOR_CYAN]Archaeology[ENDCOLOR].[NEWLINE][NEWLINE]Nearby [ICON_RES_BISON] Bison: +1 [ICON_FOOD] Food and +1 [ICON_CULTURE] Culture.[NEWLINE]Nearby [ICON_RES_DEER] Deer: +1 [ICON_FOOD] Food and +1 [ICON_CULTURE] Culture.[NEWLINE]Nearby [ICON_RES_HORSE] Horses: +1 [ICON_FOOD] Food and +1 [ICON_CULTURE] Culture.');

UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Altamira Cave[ENDCOLOR] greatly supports early culture generation (+1[ICON_CULTURE]), especially if [COLOR_GREY]Bisons[ENDCOLOR], [COLOR_GREY]Deers[ENDCOLOR] or [COLOR_GREY]Horses[ENDCOLOR] (+1[ICON_FOOD], +1[ICON_CULTURE]/[ICON_RES_BISON], [ICON_RES_DEER], [ICON_RES_HORSE]) are present nearby. Maximize its effectiveness by filling empty art slot (+1[ICON_GREAT_WORK]) or by rushing advanced technologies ([COLOR_CYAN]Archaeology:[ENDCOLOR] +3[ICON_CULTURE]).'
WHERE Tag = 'TXT_KEY_WONDER_ALTAMIRA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_ALTAMIRA_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_ALTAMIRA_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Mountain[ENDCOLOR]; Improved Resource: [ICON_RES_BISON] [COLOR_CYAN]Bison[ENDCOLOR]/[ICON_RES_DEER] [COLOR_CYAN]Deer[ENDCOLOR]/[ICON_RES_HORSE] [COLOR_CYAN]Horses[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ALTAMIRA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Improved Resource: [ICON_RES_BISON] [COLOR_CYAN]Bison[ENDCOLOR]/[ICON_RES_DEER] [COLOR_CYAN]Deer[ENDCOLOR]/[ICON_RES_HORSE] [COLOR_CYAN]Horses[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ALTAMIRA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_ALTAMIRA',			'알타미라 동굴'),
			('TXT_KEY_WONDER_ALTAMIRA_QUOTE',		'[NEWLINE]"알타미라 이후 모든 것이 퇴폐적으로 보인다."[NEWLINE] - 파블로 피카소[NEWLINE]'),
			('TXT_KEY_WONDER_ALTAMIRA_PEDIA',		'알타미라 동굴은 길이가 약 1,000m(3,280.84ft)이고 일련의 뒤틀린 통로와 방으로 구성되어 있습니다. 주요 통로의 높이는 2미터에서 6미터까지 다양합니다. 이 동굴은 비스피에르 산의 석회암에서 초기 카르스트 현상에 따른 붕괴를 통해 형성되었습니다. 동굴 바닥에서의 고고학적 발굴은 상부 솔류트레안 (18,500년 전)과 하부 막달레니안 (16,590년에서 14,000년 전)의 풍부한 유물 퇴적물을 발견했습니다. 두 시기 모두 구석기 시대 또는 구석기 시대에 속합니다. 이 두 직업 사이의 2천년 동안, 동굴에는 분명히 야생 동물들만 살고 있었습니다. 그 장소의 인간 거주자들은 인근 해안 지역에서 이용 가능한 해양 생물뿐만 아니라 주변 산의 계곡에서 풀을 뜯는 풍부한 야생 생물들을 이용할 수 있는 좋은 위치에 있었습니다.약 13,000년 전에 바위 폭포가 동굴 입구를 봉쇄했고, 근처의 나무가 넘어져 떨어진 바위를 방해한 후에 마침내 발견될 때까지 동굴의 내용물을 보존했습니다. 비록 동굴의 전체 길이에 걸쳐 그림이 만들어졌지만, 인간의 직업은 동굴 입구에 한정되었습니다. 예술가들은 이미지를 만들기 위해 숯과 황토 또는 헤마타이트를 사용했고, 종종 강도의 변화를 만들고 키아로스쿠로의 인상을 만들기 위해 이 색소들을 희석시켰습니다. 그들은 또한 피실험자들에게 입체적인 효과를 주기 위해 동굴 벽의 자연적인 윤곽을 이용했습니다. 폴리크롬 천장은 다른 자세로 멸종된 스텝 바이슨의 무리, 두 마리의 말, 큰 도제, 그리고 아마도 멧돼지를 묘사한 동굴의 가장 인상적인 특징입니다. 막달레니아의 점령 시기로 거슬러 올라가는 이 그림들은 동물적인 주제 외에도 추상적인 형태를 포함하고 있습니다. 솔류트레인 그림에는 예술가들이 동굴 벽에 손을 얹고 그 위에 색소를 불어 부정적인 이미지를 남겼을 때 만들어진 손자국뿐만 아니라 말과 염소의 이미지도 포함되어 있습니다. 스페인 북부의 수많은 다른 동굴들은 구석기 시대의 예술을 포함하고 있지만, 알타미라만큼 복잡하거나 인구가 많은 동굴은 없습니다.'),
			('TXT_KEY_WONDER_ALTAMIRA_HELP',		'[ICON_GREAT_WORK] 걸작 또는 유물용 슬롯 1개가 포함되어 있습니다. [COLOR_CYAN]고고학[ENDCOLOR]연구시 [ICON_CULTURE] 문화 +3을 제공합니다. 도시 인근의 [ICON_RES_BISON]들소, [ICON_RES_DEER]사슴, [ICON_RES_HORSE]말에서 [ICON_FOOD]식량 +1 [ICON_CULTURE]문화 +1을 제공합니다.');

UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]알타미라 동굴[ENDCOLOR]은 특히 [COLOR_GREY]들소[ENDCOLOR], [COLOR_GREY]사슴[ENDCOLOR] 또는 [COLOR_GREY]말[ENDCOLOR]이 근처에 있는 경우(+1[ICON_FOOD], +1[ICON_CULTURE]/[ICON_RES_BISON], [ICON_RES_DEER], [ICON_RES_HORSE]) 초기 문화 세대(+1[ICON_CULTURE])를 크게 지원합니다. 빈 걸작 슬롯(+1[ICON_GREAT_WORK])을 채우거나 고급 기술을 서두르면([COLOR_CYAN]고고학:[ENDCOLOR] +3[ICON_CULTURE]) 효과를 극대화할 수 있습니다.'
WHERE Tag = 'TXT_KEY_WONDER_ALTAMIRA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_ALTAMIRA_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_ALTAMIRA_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]산[ENDCOLOR]; 개발된 자원: [ICON_RES_BISON] [COLOR_CYAN]들소[ENDCOLOR]/[ICON_RES_DEER] [COLOR_CYAN]사슴[ENDCOLOR]/[ICON_RES_HORSE] [COLOR_CYAN]말[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ALTAMIRA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '개발된 자원: [ICON_RES_BISON][COLOR_CYAN]들소[ENDCOLOR]/[ICON_RES_DEER][COLOR_CYAN]사슴[ENDCOLOR]/[ICON_RES_HORSE][COLOR_CYAN]말[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ALTAMIRA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Ggantija
INSERT INTO Language_en_US 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_GGANTIJA',			'Ggantija'),
			('TXT_KEY_WONDER_GGANTIJA_QUOTE',		'[NEWLINE]"We need to find God, and he cannot be found in noise and restlessness. God is the friend of silence. See how nature - trees, flowers, grass - grows in silence; see the stars, the moon and the sun, how they move in silence... We need silence to be able to touch souls."[NEWLINE] - Mother Teresa[NEWLINE]'),
			('TXT_KEY_WONDER_GGANTIJA_PEDIA',		'Ggantija (Giants'' Tower) is a megalithic temple complex in Malta on the Mediterranean island of Gozo. Its makers erected the two Ggantija temples during the Neolithic Age (c. 3600-2500 BC), which makes the buildings more than 5500 years old and the world''s second oldest manmade religious structures, after Gobekli Tepe. The temples were possibly the site of a Fertility cult - archeologists believe that the numerous figurines and statues found on site are connected with that cult.'),
			('TXT_KEY_WONDER_GGANTIJA_HELP',		'Grants 50 [ICON_FOOD] Food after construction. Converts 10% [ICON_PEACE] Faith produced by this City into [ICON_FOOD] Food. All Farms in the Empire receive +1 [ICON_FOOD] Food.');

UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Ggantija[ENDCOLOR] boosts your empire''s growth right after construction (50[ICON_FOOD]) and upgrades all [COLOR_CITY_BROWN]Farms[ENDCOLOR] (+1[ICON_FOOD]/[ICON_WORKER][ICON_WORKER]). To increase your city developement even more, you should fully focus on religion (10%[ICON_PEACE] into [ICON_FOOD]).'
WHERE Tag = 'TXT_KEY_WONDER_GGANTIJA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_GGANTIJA_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_GGANTIJA_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Grassland[ENDCOLOR]; Improvement: [COLOR_CYAN]2 Farms[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GGANTIJA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Grassland[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GGANTIJA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_GGANTIJA',			'즈간티야 신전'),
			('TXT_KEY_WONDER_GGANTIJA_QUOTE',		'[NEWLINE]"우리는 신을 찾아야 합니다. 그리고 그는 소음과 불안 속에서 찾을 수 없습니다. 신은 침묵의 친구입니다. 나무, 꽃, 풀과 같은 자연이 침묵 속에서 어떻게 자라는지 보고, 별, 달, 태양이 침묵 속에서 어떻게 움직이는지 보십시오. 우리는 영혼을 만질 수 있는 침묵이 필요합니다."[NEWLINE] - 테레사 수녀[NEWLINE]'),
			('TXT_KEY_WONDER_GGANTIJA_PEDIA',		'즈간티야 신전은 지중해 고조 섬에 있는 몰타에 있는 거석 사원 단지입니다. 신전의 제작자들은 신석기 시대 (기원전 3600년경-2500년경) 동안 두 개의 사원을 세웠는데, 이 건물들을 5500년 이상 되었고 이는 괴베클리 테페 다음으로 세계에서 두 번째로 오래된 인공 종교 구조물로 여겨집니다. 사원들은 아마도 다산 숭배의 장소였을 것이라고 추측되는데 고고학자들은 그 장소에서 발견된 수많은 조각상들이 그 숭배와 관련이 있다고 믿습니다.'),
			('TXT_KEY_WONDER_GGANTIJA_HELP',		'건설 후 [ICON_FOOD]식량 50을 제공합니다. 이 도시에서 생산한 [ICON_PEACE]신앙 10%를 [ICON_FOOD]식량으로 변환합니다. 제국의 모든 농장은 [ICON_FOOD]식량 +1을 제공합니다.');

UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]즈간티야 신전[ENDCOLOR]은 건설 직후 제국의 성장을 촉진하고(50[ICON_FOOD]) 모든 [COLOR_CITY_BROWN]농장[ENDCOLOR]을 향상시킵니다(+1[ICON_FOOD]/[ICON_WORKER][ICON_WORKER]). 도시 개발을 더욱 향상시키려면 종교에 전적으로 집중해야 합니다([ICON_PEACE]에서 [ICON_FOOD]로 10%).'
WHERE Tag = 'TXT_KEY_WONDER_GGANTIJA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_GGANTIJA_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_GGANTIJA_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]초원[ENDCOLOR]; 시설: [COLOR_CYAN]농장 2개[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GGANTIJA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]초원[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GGANTIJA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------				
-- Goebekli Tepe	
INSERT INTO Language_en_US 
			(Tag,										Text) 
VALUES		('TXT_KEY_BUILDING_GOEBEKLI_TEPE',			'Goebekli Tepe'),
			('TXT_KEY_WONDER_GOEBEKLI_TEPE_QUOTE',		'[NEWLINE]"Look up at the stars and not down at your feet. Try to make sense of what you see, and wonder about what makes the universe exist. Be curious."[NEWLINE] - Stephen Hawking[NEWLINE]'),
			('TXT_KEY_WONDER_GOEBEKLI_TEPE_PEDIA',		'Göbekli Tepe is a religious site located in southern Turkey, near the Syrian border. It is the oldest known religious building on earth, dating to approximately 10000 BCE, during the Neolithic age of Human civilization, and predating all major civilizations and cities by several millenia. It was first observed during the 1960''s, when archeologists noted that the hill could not be natural due to the shape, yet dismissed it as a Byzantine burial ground. This belief persisted until 1994, and not excavated until a year later. The complex is similar in form to Stonehenge, with a round shape and large Monolithic stones. However, unlike Stonehenge, many of the pillars are carved with the figures of several animals, which are believed to have been sacred to the hunter-gatherers which constructed Göbekli Tepe.'),
			('TXT_KEY_WONDER_GOEBEKLI_TEPE_HELP',		'+1 [ICON_RESEARCH] Science and +1 [ICON_PEACE] Faith from Mountains worked by this City.[NEWLINE][NEWLINE]All [ICON_RES_STONE] Stone: +1 [ICON_RESEARCH] Science.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Goebekli Tepe[ENDCOLOR] is excellent wonder for area filled with [COLOR_CITY_BLUE]Mountains[ENDCOLOR] (+1[ICON_RESEARCH], +1[ICON_PEACE]/[ICON_FLOWER] to City), which increases important yield''s early output (+1[ICON_RESEARCH]; +1[ICON_CULTURE]; +1[ICON_PEACE]). Make sure to claim each [COLOR_GREY]Stone[ENDCOLOR] (+1[ICON_RESEARCH]/[ICON_RES_STONE][ICON_RES_STONE]) deposit you can find.'
WHERE Tag = 'TXT_KEY_WONDER_GOEBEKLI_TEPE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_GOEBEKLI_TEPE_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_GOEBEKLI_TEPE_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Mountain[ENDCOLOR]; Feature: [COLOR_NEGATIVE_TEXT]Water[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GOEBEKLI_TEPE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Desert[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GOEBEKLI_TEPE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

INSERT INTO Language_ko_KR 
			(Tag,										Text) 
VALUES		('TXT_KEY_BUILDING_GOEBEKLI_TEPE',			'괴베클리 테페'),
			('TXT_KEY_WONDER_GOEBEKLI_TEPE_QUOTE',		'[NEWLINE]"당신 발 아래가 아니라 별을 올려다 보세요. 여러분이 보는 것을 이해하려고 노력하고, 무엇이 우주를 존재하게 하는지 궁금해하세요. 호기심을 가지세요."[NEWLINE] - 스티븐 호킹[NEWLINE]'),
			('TXT_KEY_WONDER_GOEBEKLI_TEPE_PEDIA',		'괴베클리 테페는 시리아 국경 근처 터키 남부에 위치한 종교 유적지입니다. 이 건축물은 인간 문명의 신석기 시대에 대략 기원전 10000년으로 거슬러 올라가며 모든 주요 문명과 도시보다 몇 천 년 앞서 있는 지구상에서 알려진 가장 오래된 종교 건물입니다. 그것은 1960년대에 처음 관찰되었는데, 고고학자들은 언덕이 모양 때문에 자연적일 수 없다고 지적했지만 비잔틴 매장지로 일축했습니다. 이 믿음은 1994년까지 지속되었고, 1년이 지나야 비로소 발굴되었습니다. 이 복합 단지는 형태가 스톤헨지와 유사하며 둥근 모양과 큰 모놀리식 돌이 있습니다. 그러나 스톤헨지와 달리 많은 기둥에는 괴베클리 테페를 건설한 수렵 채집인들에게 신성한 것으로 여겨지는 여러 동물의 형상이 새겨져 있습니다.'),
			('TXT_KEY_WONDER_GOEBEKLI_TEPE_HELP',		'이 도시에 있는 산에서 [ICON_RESEARCH]과학 +1 [ICON_PEACE]신앙 +1을 제공합니다. 제국의 모든 [ICON_RES_STONE]석재에서 [ICON_RESEARCH]과학 +1을 제공합니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]괴베클리 테페[ENDCOLOR]는 [COLOR_CITY_BLUE]산[ENDCOLOR](도시에 +1[ICON_RESEARCH], +1[ICON_PEACE]/[ICON_FLOWER])으로 가득 찬 지역을 위한 탁월한 불가사의로, 중요한 수확량의 초기 생산량을 증가(+1[ICON_RESEARCH]; +1[ICON_CULTURE]; +1[ICON_PEACE])시킵니다. 찾을 수 있는 각 [COLOR_GREY]석재[ENDCOLOR](+1[ICON_RESEARCH]/[ICON_RES_STONE][ICON_RES_STONE])들은 최대한 확보해야 합니다.'
WHERE Tag = 'TXT_KEY_WONDER_GOEBEKLI_TEPE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_GOEBEKLI_TEPE_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_GOEBEKLI_TEPE_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]산[ENDCOLOR]; 특징: [COLOR_NEGATIVE_TEXT]물을 피할 것[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GOEBEKLI_TEPE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]사막[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GOEBEKLI_TEPE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------				
-- Kuk Swamp
INSERT INTO Language_en_US 
			(Tag,							Text) 
VALUES		('TXT_KEY_BUILDING_KUK',		'Kuk Swamp'),
			('TXT_KEY_WONDER_KUK_QUOTE',	'[NEWLINE]"If perfection is stagnation, then Heaven is a swamp."[NEWLINE] - Richard Bach[NEWLINE]'),
			('TXT_KEY_WONDER_KUK_PEDIA',	'TODO'),
			('TXT_KEY_WONDER_KUK_HELP',		'10% [ICON_FOOD] Food is carried over after new [ICON_CITIZEN] Citizen is born. +1 [ICON_PRODUCTION] Production and +1 [ICON_RESEARCH] Science from Marshes worked in the Empire. +5 [ICON_PRODUCTION] Production in the City and +2 [ICON_PRODUCTION] Production in all other Cities with [COLOR_CYAN]Steam Power[ENDCOLOR]');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Kuk Swamp[ENDCOLOR], thanks to unique agricultural techniques, turned [COLOR_CITY_GREEN]Marshes[ENDCOLOR] (+1[ICON_PRODUCTION], +1[ICON_RESEARCH]/[ICON_MUSHROOM][ICON_MUSHROOM]) into rich soil. Use its power to speed up developement of your huge city even more (+10%[ICON_FOOD]/New [ICON_CITIZEN]; [COLOR_CYAN]Steam Power:[ENDCOLOR] +3[ICON_PRODUCTION], +2[ICON_PRODUCTION][ICON_PRODUCTION]).'
WHERE Tag = 'TXT_KEY_WONDER_KUK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_KUK_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_KUK_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_NEGATIVE_TEXT]Snow[ENDCOLOR]; Feature: [COLOR_CYAN]Jungle, Marsh[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_KUK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Feature: [COLOR_CYAN]Marsh[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_KUK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

INSERT INTO Language_ko_KR 
			(Tag,							Text) 
VALUES		('TXT_KEY_BUILDING_KUK',		'쿠크 늪'),
			('TXT_KEY_WONDER_KUK_QUOTE',	'[NEWLINE]"완벽이 침체라면 천국은 늪이다."[NEWLINE] - 리처드 바크[NEWLINE]'),
			('TXT_KEY_WONDER_KUK_PEDIA',	'TODO'),
			('TXT_KEY_WONDER_KUK_HELP',		'[ICON_CITIZEN]시민이 탄생할 때 사용된 [ICON_FOOD]식량의 10%는 다음 [ICON_CITIZEN]시민이 탄생할 때 사용됩니다. 제국의 모든 습지가 [ICON_PRODUCTION]생산 +1 [ICON_RESEARCH]과학 +1을 제공합니다. [COLOR_CYAN]증기력[ENDCOLOR]연구 시 모든 도시에서 [ICON_PRODUCTION]생산 +2를 제공하고 이 도시에는 [ICON_PRODUCTION]생산 +3을 추가로 제공합니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]쿠크 늪[ENDCOLOR]은 독특한 농업 기술 덕분에 [COLOR_CITY_GREEN]습지[ENDCOLOR](+1[ICON_PRODUCTION], +1[ICON_RESEARCH]/[ICON_MUSHROOM][ICON_MUSHROOM])를 비옥한 토양으로 만듭니다. 그 힘을 사용하여 거대한 도시의 개발 속도를 더욱 높이십시요(+10%[ICON_FOOD]/새로운 [ICON_CITIZEN]; [COLOR_CYAN]증기력:[ENDCOLOR] +3[ICON_PRODUCTION], +2[ICON_PRODUCTION][ICON_PRODUCTION]).'
WHERE Tag = 'TXT_KEY_WONDER_KUK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_KUK_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_KUK_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_NEGATIVE_TEXT]설원을 피할 것[ENDCOLOR]; 특징: [COLOR_CYAN]정글, 습지[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_KUK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특징: [COLOR_CYAN]습지[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_KUK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Majorville Medicine Wheel
INSERT INTO Language_en_US 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_MAJORVILLE',			'Majorville Medicine Wheel'),
			('TXT_KEY_WONDER_MAJORVILLE_QUOTE',		'[NEWLINE]"When the Earth is sick, the animals will begin to disappear, when that happens, The Warriors of the Rainbow will come to save them."[NEWLINE] - Chief Seattle[NEWLINE]'),
			('TXT_KEY_WONDER_MAJORVILLE_PEDIA',		'The Majorville Medicine Wheel is an archaeological site of the Blackfeet nation dating to 3200 BCE. It is a round stone cairn connected to a cobble circle by 28 stone spokes. Traditionally, in certain Native American cultures, medicine wheels are metaphors for a variety of spiritual concepts. However, as it is believed that the Majorville Medicine Wheel was improved upon for successive generations, the precise meaning of the wheel may differ for each generation. Offerings found at the site included sweet grass, willow, cloth, tobacco, and iniskim stones ("buffalo calling stones").'),
			('TXT_KEY_WONDER_MAJORVILLE_HELP',		'+1 [ICON_PEACE] Faith from Tundra tiles worked by this City. All Camps in the Empire receive +1 [ICON_FOOD] Food.[NEWLINE][NEWLINE]All [ICON_RES_BISON] Bison: +1 [ICON_CULTURE] Culture.');
			
UPDATE Language_en_US
SET Text = 'This [COLOR_YIELD_FOOD]Medicine Wheel[ENDCOLOR] strongly supports [COLOR_CITY_BLUE]Tundra[ENDCOLOR] (+1[ICON_PEACE]/[ICON_FLOWER]) developement. You should construct as many [COLOR_CITY_BROWN]Camps[ENDCOLOR] (+1[ICON_FOOD]/[ICON_WORKER][ICON_WORKER]) as possible to increase your growth and and catch all [COLOR_GREY]Bisons[ENDCOLOR] (+1[ICON_CULTURE]/[ICON_RES_BISON][ICON_RES_BISON]) to boost your culture output as well.'
WHERE Tag = 'TXT_KEY_WONDER_MAJORVILLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_MAJORVILLE_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_MAJORVILLE_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Tundra[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MAJORVILLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Tundra[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MAJORVILLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	

INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_MAJORVILLE',			'메이져빌 의술 바퀴'),
			('TXT_KEY_WONDER_MAJORVILLE_QUOTE',		'[NEWLINE]"지구가 아플 때, 동물들은 사라지기 시작할 것이고, 그렇게 되면 무지개의 전사들이 그들을 구하러 올 것이다."[NEWLINE] - 시애틀 추장[NEWLINE]'),
			('TXT_KEY_WONDER_MAJORVILLE_PEDIA',		'메이져빌 의술 바퀴는 기원전 3200년까지 거슬러 올라가는 블랙피트 족의 고고학 유적지입니다. 이 유적지는 28개의 돌멩이로 자갈 원과 연결된 둥근 돌멩이 유적입니다. 전통적으로 특정 아메리카 원주민 문화에서 의술 바퀴는 다양한 영적 개념에 대한 은유입니다. 그러나 메이져빌 의술 바퀴은 대대로 개선된 것으로 여겨지므로 정확한 의미는 세대마다 다를 수 있습니다. 현장에서 발견된 제물에는 달콤한 풀, 버드나무, 천, 담배, 이니킴 돌(버팔로 부름 돌)이 포함되어 있습니다.'),
			('TXT_KEY_WONDER_MAJORVILLE_HELP',		'이 도시의 툰드라 타일이 [ICON_PEACE]신앙 +1을 제공합니다. 제국의 모든 야영지는 [ICON_FOOD]식량 +1을 제공합니다. 제국의 모든 [ICON_RES_BISON]들소는 [ICON_CULTURE]문화 +1을 제공합니다.');
			
UPDATE Language_ko_KR
SET Text = '이 [COLOR_YIELD_FOOD]의술 바퀴[ENDCOLOR]는 [COLOR_CITY_BLUE]툰드라[ENDCOLOR](+1[ICON_PEACE]/[ICON_FLOWER]) 개발을 강력하게 지원합니다. 가능한 한 많은 [COLOR_CITY_BROWN]야영지[ENDCOLOR](+1[ICON_FOOD]/[ICON_WORKER][ICON_WORKER])를 건설하여 성장을 촉진하고 모든 [COLOR_GREY]들소[ENDCOLOR](+1[ICON_CULTURE]/[ICON_RES_BISON][ICON_RES_BISON])의 문화 산출량도 높일 수 있습니다.'
WHERE Tag = 'TXT_KEY_WONDER_MAJORVILLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_MAJORVILLE_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_MAJORVILLE_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]툰드라[ENDCOLOR]; 위치: [COLOR_CYAN]언덕[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MAJORVILLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]툰드라[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MAJORVILLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Mohenjo-daro
INSERT INTO Language_en_US 
			(Tag,										Text) 
VALUES		('TXT_KEY_BUILDING_MOHENJO_DARO',			'Mohenjo-daro'),
			('TXT_KEY_WONDER_MOHENJO_DARO_QUOTE',		'[NEWLINE]"A river is an ocean in a desert."[NEWLINE] - Matshona Dhliwayo[NEWLINE]'),
			('TXT_KEY_WONDER_MOHENJO_DARO_PEDIA',		'Built sometime around 2500 BC, Mohenjo-daro was one of the largest of the Harappan civilizations settlements, center of a thriving culture that spanned northern India and Pakistan. While the Egyptians were building pyramids for their pharaohs and the Minoans were leaping over bulls for sport, the 40,000 (or so) citizens of Mohenjo-daro were building striking structures of fired and mortared brick: public baths, a central market with a public well, spacious homes, a great granary (with air ducts to dry the grain), the Pillared Hall for assemblies, and the College Hall (78 rooms thought to have been a residence for priests). Mohenjo-daro was the most advanced city of its time, with remarkably sophisticated civil engineering and urban planning. When the Harappan civilization went into a sudden  and as yet unexplained, although historians have lots of theories  decline around 1900 BC, Mohenjo-daro was gradually abandoned, to be lost until 1920 AD. (Adapted from Sid Meier''s Civilization 6)'),
			('TXT_KEY_WONDER_MOHENJO_DARO_HELP',		'Provides a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Well in the City in which it is built. +1 [ICON_FOOD] Food from River tiles worked by this City.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Mohenjo-daro[ENDCOLOR] makes special use from recently constructed [COLOR_YIELD_FOOD]Well[ENDCOLOR] ([ICON_FOOD]; [ICON_PRODUCTION]), increases potential of local [COLOR_CITY_GREEN]River[ENDCOLOR] (+1[ICON_FOOD]/[ICON_MUSHROOM]) and supports your culture and religion (+2[ICON_CULTURE]; +1[ICON_PEACE]).'
WHERE Tag = 'TXT_KEY_WONDER_MOHENJO_DARO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_MOHENJO_DARO_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_MOHENJO_DARO_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Desert[ENDCOLOR], [COLOR_NEGATIVE_TEXT]Coast[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MOHENJO_DARO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_en_US SET Text = 'Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MOHENJO_DARO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	

INSERT INTO Language_ko_KR 
			(Tag,										Text) 
VALUES		('TXT_KEY_BUILDING_MOHENJO_DARO',			'모헨조다로'),
			('TXT_KEY_WONDER_MOHENJO_DARO_QUOTE',		'[NEWLINE]"강은 사막의 바다이다."[NEWLINE] - 마트쇼나 드리와요[NEWLINE]'),
			('TXT_KEY_WONDER_MOHENJO_DARO_PEDIA',		'기원전 2500년경에 지어진 모헨조다로는 하라파 문명 정착지 중 가장 큰 곳 중 하나였으며, 인도 북부와 파키스탄에 걸친 번성하는 문화의 중심지였습니다. 이집트인들이 파라오를 위해 피라미드를 건설하고 미노아인들이 스포츠를 위해 황소를 뛰어넘는 동안, 모헨조다로의 40,000명 정도의 시민들은 벽돌로 불을 붙이고 회반죽을 바른 건축물들을 지었는데 공중 목욕탕, 공공 우물이 있는 중앙 시장 , 넓은 집, 큰 곡창(곡식을 말리기 위한 통풍관이 있음), 집회를 위한 기둥 홀, 대학 홀(사제들의 거주지로 생각되는 78개의 방)과 같은 인상적인 건축물을 짓고 있었습니다. . 모헨조다로는 놀랍도록 정교한 토목 공학과 도시 계획을 갖춘 당시 가장 발전된 도시였습니다. 하라판 문명이 갑작스럽고 아직 설명되지 않았을 때 역사가들은 기원전 1900년경에 많은 이론이 쇠퇴했음에도 불구하고 모헨조다로는 점차적으로 버려져 서기 1920년까지 사라졌습니다. (시드 마이어의 문명 6에서 각색)'),
			('TXT_KEY_WONDER_MOHENJO_DARO_HELP',		'건설된 도시에 무료 [COLOR_POSITIVE_TEXT]우물[ENDCOLOR]을 제공합니다. 이 도시에 있는 강 타일에서 [ICON_FOOD]식량 +1을 제공합니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]모헨조다로[ENDCOLOR]는 최근 건설된 [COLOR_YIELD_FOOD]우물[ENDCOLOR]([ICON_FOOD]; [ICON_PRODUCTION])을 특수 사용하여 지역에 있는 [COLOR_CITY_GREEN]강[ENDCOLOR]의 잠재력(+1[ICON_FOOD]/ [ICON_MUSHROOM])을 높입니다. 또한 문화와 종교를 지원합니다(+2[ICON_CULTURE]; +1[ICON_PEACE]).'
WHERE Tag = 'TXT_KEY_WONDER_MOHENJO_DARO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_MOHENJO_DARO_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_MOHENJO_DARO_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]사막[ENDCOLOR], [COLOR_NEGATIVE_TEXT]해안을 피할 것[ENDCOLOR]; 특징: [COLOR_CYAN]강[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MOHENJO_DARO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '특징: [COLOR_CYAN]강[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MOHENJO_DARO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Skara Brae
INSERT INTO Language_en_US 
			(Tag, Text)
VALUES		('TXT_KEY_BUILDING_SKARA_BRAE',			'Skara Brae'),
			('TXT_KEY_WONDER_SKARA_BRAE_QUOTE',		'[NEWLINE]"No great thing is created suddenly."[NEWLINE] - Epictetus[NEWLINE]'),
			('TXT_KEY_WONDER_SKARA_BRAE_PEDIA',		'Skara Brae is a stone-built Neolithic settlement, located on the Bay of Skaill on the west coast of Mainland, the largest island in the Orkney archipelago of Scotland. It consists of eight clustered houses, and was occupied from roughly 3180 BC - 2500 BC.[NEWLINE][NEWLINE]Given the number of homes, it seems likely that no more than fifty people lived in Skara Brae at any given time. Apart from being makers and users of grooved ware, a distinctive style of pottery that appeared in northern Scotland not long before the establishment of the village, they were primarily pastorialists who raised cattle and sheep.'),
			('TXT_KEY_WONDER_SKARA_BRAE_HELP',		'All Villages in the Empire receive +1 [ICON_PRODUCTION] Production and +1 [ICON_GOLD] Gold.[NEWLINE][NEWLINE]All [ICON_RES_COW] Cattle: +1 [ICON_FOOD] Food.[NEWLINE]All [ICON_RES_FISH] Fish: +1 [ICON_FOOD] Food.[NEWLINE]All [ICON_RES_SHEEP] Sheep: +1 [ICON_FOOD] Food.[NEWLINE]All [ICON_RES_WHEAT] Wheat: +1 [ICON_FOOD] Food.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Skara Brae[ENDCOLOR] gives major developement boost to all cities with improved basic resources (+1[ICON_FOOD]/[ICON_RES_COW][ICON_RES_COW], [ICON_RES_SHEEP][ICON_RES_SHEEP], [ICON_RES_FISH][ICON_RES_FISH], [ICON_RES_WHEAT][ICON_RES_WHEAT]). Starting from medieval era, you should create numerous upgraded [COLOR_CITY_BROWN]Villages[ENDCOLOR] (+1[ICON_PRODUCTION], +1[ICON_GOLD]/[ICON_WORKER][ICON_WORKER]) with much more potential than standard ones.'
WHERE Tag = 'TXT_KEY_WONDER_SKARA_BRAE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_SKARA_BRAE_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_SKARA_BRAE_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Plot: [COLOR_CYAN]Flat[ENDCOLOR]; Improved Resource: [ICON_RES_COW] [COLOR_CYAN]Cattle[ENDCOLOR]/[ICON_RES_FISH] [COLOR_CYAN]Fish[ENDCOLOR]/[ICON_RES_SHEEP] [COLOR_CYAN]Sheep[ENDCOLOR]/[ICON_RES_WHEAT] [COLOR_CYAN]Wheat[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SKARA_BRAE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_en_US SET Text = 'Improved Resource: [ICON_RES_COW] [COLOR_CYAN]Cattle[ENDCOLOR]/[ICON_RES_FISH] [COLOR_CYAN]Fish[ENDCOLOR]/[ICON_RES_SHEEP] [COLOR_CYAN]Sheep[ENDCOLOR]/[ICON_RES_WHEAT] [COLOR_CYAN]Wheat[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SKARA_BRAE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	

INSERT INTO Language_ko_KR 
			(Tag, Text)
VALUES		('TXT_KEY_BUILDING_SKARA_BRAE',			'스카라 브레'),
			('TXT_KEY_WONDER_SKARA_BRAE_QUOTE',		'[NEWLINE]"갑자기 위대한 것이 만들어지지 않는다"[NEWLINE] - 에픽테토스[NEWLINE]'),
			('TXT_KEY_WONDER_SKARA_BRAE_PEDIA',		'스카라 브레는 스코틀랜드 오크니 제도에서 가장 큰 섬인 본토 서해안의 스카일 만에 위치한 석조 신석기 시대 정착지입니다. 8개의 군집 주택으로 구성되어 있으며, 대략 기원전 3180년부터 기원전 2500년까지 사람이 거주했습니다.[NEWLINE][NEWLINE]집의 수를 고려할 때, 스카라 브레에 살던 사람은 50명을 넘지 않았을 것으로 보입니다. 마을이 세워지기 얼마 전에 스코틀랜드 북부에 나타난 독특한 스타일의 도자기인 홈이 있는 도자기의 제작자와 사용자인 것을 제외하고, 그들은 주로 소와 양을 기르는 목회자들이었습니다.'),
			('TXT_KEY_WONDER_SKARA_BRAE_HELP',		'제국의 모든 마을은 [ICON_PRODUCTION]생산 +1  [ICON_GOLD]골드 +1를 제공합니다. 제국의 모든 [ICON_RES_COW]소, [ICON_RES_FISH]생선, [ICON_RES_SHEEP]양, [ICON_RES_WHEAT]밀은 [ICON_FOOD]식량 +1을 제공합니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]스카라 브레[ENDCOLOR]는 개선된 기본 자원(+1[ICON_FOOD]/[ICON_RES_COW][ICON_RES_COW], [ICON_RES_SHEEP][ICON_RES_SHEEP], [ICON_RES_FISH][ICON_RES_FISH], [ICON_RES_WHEAT][ICON_RES_WHEAT])으로 모든 도시에 대대적인 개발 가속을 제공합니다. 중세 시대부터는 일반적인 마을보다 훨씬 더 많은 잠재력을 가진 향상된 [COLOR_CITY_BROWN]마을[ENDCOLOR](+1[ICON_PRODUCTION], +1[ICON_GOLD]/[ICON_WORKER][ICON_WORKER])을 많이 만들어야 합니다.'
WHERE Tag = 'TXT_KEY_WONDER_SKARA_BRAE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_SKARA_BRAE_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_SKARA_BRAE_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 위치: [COLOR_CYAN]평지[ENDCOLOR]; 개발된 자원: [ICON_RES_COW][COLOR_CYAN]소[ENDCOLOR]/[ICON_RES_FISH][COLOR_CYAN]물고기[ENDCOLOR]/[ICON_RES_SHEEP][COLOR_CYAN]양[ENDCOLOR]/[ICON_RES_WHEAT][COLOR_CYAN]밀[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SKARA_BRAE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '개발된 자원: [ICON_RES_COW][COLOR_CYAN]소[ENDCOLOR]/[ICON_RES_FISH][COLOR_CYAN]물고기[ENDCOLOR]/[ICON_RES_SHEEP][COLOR_CYAN]양[ENDCOLOR]/[ICON_RES_WHEAT][COLOR_CYAN]밀[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SKARA_BRAE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
----------------------------------------------------
-- Karnak
INSERT INTO Language_en_US 
			(Tag,								Text) 
VALUES		('TXT_KEY_BUILDING_KARNAK',			'Karnak'),
			('TXT_KEY_WONDER_KARNAK_QUOTE',		'[NEWLINE]"I was sitting in the Temple of Karnak of the Nile, as the sun was going down, and I was all alone, and the great Hypostyle Hall was full of shadows and ghosts of the past, (...) and if you believe that, you''ll believe anything."[NEWLINE] - Wilbur A. Smith[NEWLINE]'),
			('TXT_KEY_WONDER_KARNAK_PEDIA',		'Karnak is a large temple complex located in Thebes (nowadays is Luxor). It was constructed during the reign of Ramesses II as a place of worship for many different gods and goddesses, instead of focusing on just one member of the Egyptian Pantheon.[NEWLINE][NEWLINE]  The complex is a vast open-air museum, and the second largest ancient religious site in the world (after the Angkor Wat in Cambodia). It is believed to be the second most visited historical site in Egypt, only the Giza Pyramids near Cairo receive more visits.[NEWLINE][NEWLINE]  One famous aspect of Karnak is the Hypostyle Hall in the Precinct of Amun-Re, a hall area of 50,000 sq ft (5,000 m2) with 134 massive columns arranged in 16 rows. 122 of these columns are 10 meters tall, and the other 12 are 21 meters tall with a diameter of over three meters.'),
			('TXT_KEY_WONDER_KARNAK_HELP',		'Provides a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Monument in the City in which it is built and all Monuments in the Empire receive +1 [ICON_CULTURE] Culture. +1 [ICON_PRODUCTION] Production and +1 [ICON_PEACE] Faith from each Oasis and every 2 Flood Plains worked by this City. +4 [ICON_TOURISM] Tourism with [COLOR_CYAN]Archeology[ENDCOLOR].');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Karnak[ENDCOLOR] temples turn rare [COLOR_CITY_GREEN]Oasis[ENDCOLOR] (+1[ICON_PRODUCTION], +1[ICON_PEACE]/[ICON_MUSHROOM]) and [COLOR_CITY_GREEN]Flood Plains[ENDCOLOR] (+1[ICON_PRODUCTION], +1[ICON_PEACE]/2 [ICON_MUSHROOM] to City) into very productive sacred places. Remember to build a [COLOR_YIELD_FOOD]Monument[ENDCOLOR] ([ICON_CULTURE]; [ICON_MOVES]; +1[ICON_CULTURE]) in all other cities to speed up your cultural progress.'
WHERE Tag = 'TXT_KEY_WONDER_KARNAK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_KARNAK_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_KARNAK_HELP';
				
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Flat[ENDCOLOR]; Feature: [COLOR_CYAN]Flood Plains[ENDCOLOR]/[COLOR_CYAN]Oasis[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_KARNAK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_en_US SET Text = 'Feature: [COLOR_CYAN]Flood Plains[ENDCOLOR]/[COLOR_CYAN]Oasis[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_KARNAK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
VALUES		('TXT_KEY_BUILDING_KARNAK',			'카르나크 신전'),
			('TXT_KEY_WONDER_KARNAK_QUOTE',		'[NEWLINE]"해가 지고 있을 때 나는 나일 강의 카르나크 신전에 앉아 있었고, 나는 혼자였고, 거대한 다주식 회관은 과거의 그림자와 유령들로 가득 차 있었다. (...) 그리고 만약 당신이 그것을 믿는다면, 당신은 무엇이든 믿을 것이다."[NEWLINE] - 윌버 A. 스미스[NEWLINE]'),
			('TXT_KEY_WONDER_KARNAK_PEDIA',		'카르나크 신전은 테베(오늘날 룩소르)에 위치한 거대한 사원 단지입니다. 이 신전은 이집트 판테온의 한 구성원에 초점을 맞추는 대신에, 많은 다른 신들과 여신들을 위한 예배 장소로서 람세스 2세의 통치 기간 동안 건설되었습니다.[NEWLINE][NEWLINE] 카르나크 신전 단지는 거대한 야외 박물관이며, 캄보디아의 앙코르 와트 다음으로 세계에서 두 번째로 큰 고대 종교 유적지입니다. 이곳은 이집트에서 두 번째로 방문객이 많은 역사적인 장소로 여겨지며, 카이로 근처 기자 피라미드만이 더 많은 방문객을 받습니다.[NEWLINE][NEWLINE] 카르나크 신전의 유명한 측면 중 하나는 아문-레 경내에 있는 다주식 회관으로, 16열로 배열된 134개의 거대한 기둥이 있는 회관의 면적은 50,000 평방 피트 (5,000 제곱미터)입니다. 이 기둥들 중 122개는 높이가 10미터이고, 나머지 12개는 직경이 3미터가 넘는 21미터입니다.'),
			('TXT_KEY_WONDER_KARNAK_HELP',		'건설된 도시에 무료 [COLOR_POSITIVE_TEXT]기념비[ENDCOLOR]를 제공하고 제국의 모든 기념비는 [ICON_CULTURE]문화 +1를 제공합니다. 이 도시에 있는 오아시스 및 2개의 범람원마다 [ICON_PRODUCTION]생산 +1 [ICON_PEACE]신앙 +1을 제공합니다. [COLOR_CYAN]고고학[ENDCOLOR]연구시 [ICON_TOURISM]관광 +4를 제공합니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]카르나크 신전[ENDCOLOR]은 희귀한 [COLOR_CITY_GREEN]오아시스[ENDCOLOR](+1[ICON_PRODUCTION], +1[ICON_PEACE]/[ICON_MUSHROOM])와 [COLOR_CITY_GREEN]범람원[ENDCOLOR](+1[ICON_PRODUCTION], +1[ICON_PEACE]/2 [ICON_MUSHROOM])을 매우 생산적인 성지로 바꿉니다. 문화 발전 속도를 높이려면 다른 모든 도시에 [COLOR_YIELD_FOOD]기념비[ENDCOLOR]([ICON_CULTURE]; [ICON_MOVES]; +1[ICON_CULTURE])를 건설하세요.'
WHERE Tag = 'TXT_KEY_WONDER_KARNAK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_KARNAK_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_KARNAK_HELP';
				
UPDATE Language_ko_KR SET Text = '위치: [COLOR_CYAN]평지[ENDCOLOR]; 특징: [COLOR_CYAN]범람원[ENDCOLOR]/[COLOR_CYAN]오아시스[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_KARNAK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '특징: [COLOR_CYAN]범람원[ENDCOLOR]/[COLOR_CYAN]오아시스[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_KARNAK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Nazca Lines
INSERT INTO Language_en_US 
			(Tag,								Text) 
VALUES		('TXT_KEY_BUILDING_NAZCA',			'Nazca Lines'),
			('TXT_KEY_WONDER_NAZCA_QUOTE',		'[NEWLINE]"The true mystery of the world is the visible, not the invisible."[NEWLINE] - Oscar Wilde[NEWLINE]'),
			('TXT_KEY_WONDER_NAZCA_PEDIA',		'The Nazca Lines, located between the Peruvian towns of Nazca and Palpa, are a series of enormous Geoglyphs designed on a large plateau, spanning over 80 kilometres. The designs have long been a source of mystery for those who have gazed upon them. It is estimated that the lines were constructed by the Nazca culture, hense the name, between 450 and 600 CE. The level of complexity of design varies between designs. Some are simple lines hundreds of metres long, while others are incredibly complex patterns resembling a variety of zoological designs - Monkeys, Condors, Spiders and Orca (Killer whale) to name but a few.[NEWLINE][NEWLINE]  The Nazca Lines are particularily popular amongst circles which believe in the existance of extra-terrestrial life, which the Nazca culture mistook for their gods. They believe that the simpler, straight lines are in fact landing strips for interstellar crafts used by the extra-terrestrials to land, and that a humanoid figure represented in the patterns is one of the extraterrestrials. Modern science has had a range of theories, amongst which the lines serving a purpose similar to that of Stonehenge as an early form of an observatory / astronomical calendar. Other theories were that the geometric lines could indicate the flow of water, irrigation schemes, or be a part of rituals to "summon" water. However, to this day the exact purpose of the lines remains a mystery.'),
			('TXT_KEY_WONDER_NAZCA_HELP',		'+2 [ICON_FOOD] Food from nearby Plains, +1 [ICON_PEACE] Faith from nearby Hills and +1 [ICON_RESEARCH] Science from Camps worked by this City. +4 [ICON_RESEARCH] Science and +2 [ICON_TOURISM] Tourism with [COLOR_CYAN]Flight[ENDCOLOR].');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Nazca Lines[ENDCOLOR] hide awesome scientific secrets, fully discovered only with air reconaissance ([COLOR_CYAN]Flight:[ENDCOLOR] +4[ICON_RESEARCH], +2[ICON_TOURISM]). Boost your growth and religion by claiming local [COLOR_CITY_BLUE]Plains[ENDCOLOR] (+2[ICON_FOOD]/[ICON_FLOWER]) and [COLOR_CITY_BLUE]Hills[ENDCOLOR] (+1[ICON_PEACE]/[ICON_FLOWER]) or science by constructing [COLOR_CITY_BROWN]Camps[ENDCOLOR] (+1[ICON_RESEARCH]/[ICON_WORKER]).'
WHERE Tag = 'TXT_KEY_WONDER_NAZCA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_NAZCA_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_NAZCA_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Plains[ENDCOLOR]; Feature: [COLOR_NEGATIVE_TEXT]Water[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_NAZCA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Plains[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_NAZCA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
VALUES		('TXT_KEY_BUILDING_NAZCA',			'나스카 지상화'),
			('TXT_KEY_WONDER_NAZCA_QUOTE',		'[NEWLINE]"세상의 진정한 신비는 보이지 않는 것이 아니라 보이는 것이다."[NEWLINE] - 오스카 와일드[NEWLINE]'),
			('TXT_KEY_WONDER_NAZCA_PEDIA',		'페루의 나스카와 팔파 사이에 위치한 나스카 지상화는 80킬로미터가 넘는 넓은 고원에 설계된 거대한 연속된 지상화입니다. 나스카 지상화의 디자인들은 그것들을 바라보았던 사람들에게 오랫동안 미스터리의 원천이었습니다. 이 선들은 450년에서 600년 사이에 나스카 문화에 의해 건설된 것으로 추정됩니다. 설계의 복잡성 수준은 설계마다 다릅니다. 어떤 것들은 수백 미터 길이의 단순한 선들이고, 다른 것들은 원숭이, 콘도르, 거미, 그리고 범고래와 같은 다양한 동물학적 디자인을 닮은 믿을 수 없을 정도로 복잡한 패턴들입니다.[NEWLINE][NEWLINE]  나스카 지상화는 나스카 문화가 그들의 신으로 착각한 외계 생명체의 존재를 믿는 서클들 사이에서 특히 인기가 있습니다. 그들은 더 단순하고 직선적인 선은 사실 외계인들이 착륙하기 위해 사용하는 성간 우주선의 착륙 활주로이며, 그 패턴에 표현된 인간 형상은 외계인 중 하나라고 믿고 있습니다. 현대 과학은 다양한 이론을 가지고 있는데, 그 중 선은 천문대/천문력의 초기 형태로서 스톤헨지의 선과 유사한 목적을 제공합니다. 다른 이론들은 기하학적 선들이 물의 흐름, 관개 계획을 나타내거나 물을 모으기 위한 의식의 일부가 될 수 있다는 것이었습니다. 하지만, 오늘날까지도 그 선들의 정확한 목적은 미스터리로 남아있습니다.'),
			('TXT_KEY_WONDER_NAZCA_HELP',		'이 도시 근처의 평원에서 [ICON_FOOD]식량 +2를 제공하며 언덕에서 [ICON_PEACE]신앙 +1을 제공합니다. 이 도시의 야영지에서 [ICON_RESEARCH]과학 +1을 제공합니다. [COLOR_CYAN]비행[ENDCOLOR] 연구 시 [ICON_RESEARCH]과학 +4 [ICON_TOURISM]관광 +2를 제공합니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]나스카 지상화[ENDCOLOR]는 공중 정찰([COLOR_CYAN]비행:[ENDCOLOR] +4[ICON_RESEARCH], +2[ICON_TOURISM])을 통해서만 완전히 발견되는 놀라운 과학적 비밀을 숨기고 있습니다. 지역의  [COLOR_CITY_BLUE]평원[ENDCOLOR](+2[ICON_FOOD]/[ICON_FLOWER]) 및 [COLOR_CITY_BLUE]언덕[ENDCOLOR](+1[ICON_PEACE]/[ICON_FLOWER])을 확보하여 성장과 종교를 가속하거나 [ COLOR_CITY_BROWN]야영지[ENDCOLOR](+1[ICON_RESEARCH]/[ICON_WORKER])를 건설하여 과학을 가속시키세요.'
WHERE Tag = 'TXT_KEY_WONDER_NAZCA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_NAZCA_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_NAZCA_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]평원[ENDCOLOR]; 특징: [COLOR_NEGATIVE_TEXT]물을 피할 것[ENDCOLOR]; 위치: [COLOR_CYAN]언덕[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_NAZCA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]평원[ENDCOLOR]; 위치: [COLOR_CYAN]언덕[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_NAZCA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Wieliczka
INSERT INTO Language_en_US 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_WIELICZKA',			'Wieliczka Salt Mine'),
			('TXT_KEY_WONDER_WIELICZKA_QUOTE',		'[NEWLINE]"You are the salt of the earth. But remember that salt is useful when in association, but useless in isolation."[NEWLINE] - Israelmore Ayivor[NEWLINE]'),
			('TXT_KEY_WONDER_WIELICZKA_PEDIA',		'The Wieliczka Salt Mine, in the town of Wieliczka, southern Poland, lies within the Kraków metropolitan area. Sodium chloride (table salt) was formerly produced there from the upwelling brine - and had been since Neolithic times. The Wieliczka salt mine, excavated from the 13th century, produced table salt continuously until 2007, as one of the world''s oldest operating salt mines.'),
			('TXT_KEY_WONDER_WIELICZKA_HELP',		'Wonder places 2 new [ICON_RES_SALT] Salt resources inside City range if possible. +5% [ICON_FOOD] Food in all Cities. +1 [ICON_FOOD] Food from Mines worked by this City.[NEWLINE][NEWLINE]Nearby [ICON_RES_SALT] Salt: +1 [ICON_PRODUCTION] Production and +1 [ICON_GOLD] Gold.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Wieliczka Salt Mine[ENDCOLOR] reveals hidden underground secret, greatly boosting your food generation (+5%[ICON_FOOD][ICON_FOOD]) and [COLOR_CITY_BROWN]Mining[ENDCOLOR] (+1[ICON_FOOD]/[ICON_WORKER]) efficiency, additionally supported by recently discovered richer deposits of [COLOR_GREY]Salt[ENDCOLOR] (+2[ICON_RES_SALT]; +1[ICON_PRODUCTION], +1[ICON_GOLD]/[ICON_RES_SALT]).'
WHERE Tag = 'TXT_KEY_WONDER_WIELICZKA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_WIELICZKA_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_WIELICZKA_HELP';
				
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Hill[ENDCOLOR]; Improvement: [COLOR_CYAN]2 Mines[ENDCOLOR]; City [COLOR_CYAN]place for Salt[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_WIELICZKA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Hill[ENDCOLOR]; City [COLOR_CYAN]place for Salt[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_WIELICZKA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	

INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_WIELICZKA',			'비엘리치카 소금 광산'),
			('TXT_KEY_WONDER_WIELICZKA_QUOTE',		'[NEWLINE]"당신은 세상의 소금입니다. 하지만 소금은 결합되있을 때는 유용하지만 고립되있을 때는 쓸모가 없다는 것을 기억하세요."[NEWLINE] - 이스라엘모어 아이보르[NEWLINE]'),
			('TXT_KEY_WONDER_WIELICZKA_PEDIA',		'폴란드 남부 빌리치카에 있는 빌리치카 소금 광산은 크라쿠프 대도시권에 있습니다. 염화 나트륨 (식용염)은 이전에 신석기 시대부터 솟아오른 염수에서 생산되었습니다. 13세기부터 발굴된 비엘리치카 소금 광산은 세계에서 가장 오래된 소금 광산 중 하나로 2007년까지 지속적으로 식탁용 소금을 생산했습니다.'),
			('TXT_KEY_WONDER_WIELICZKA_HELP',		'가능한 경우 이 도시 범위 내에 새로운 [ICON_RES_SALT] 소금 자원 2개를 배치합니다. 모든 도시의 [ICON_FOOD]식량이 +5% 증가합니다. 이 도시의 광산이 [ICON_FOOD]식량 +1을 제공합니다. 이 도시의 [ICON_RES_SALT]소금이 [ICON_PRODUCTION]생산 +1 [ICON_GOLD]골드 +1을 제공합니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]비엘리치카 소금 광산[ENDCOLOR]은 숨겨진 지하 비밀을 밝혀 식량 생산(+5%[ICON_FOOD][ICON_FOOD])과 [COLOR_CITY_BROWN]채광[ENDCOLOR](+1[ICON_FOOD]/[ICON_WORKER]) 효율성을 크게 높이고 최근에 발견된 풍부한 [COLOR_GREY]소금[ENDCOLOR](+2[ICON_RES_SALT]; +1[ICON_PRODUCTION], +1[ICON_GOLD]/[ICON_RES_SALT]) 광상을 추가로 지원합니다.'
WHERE Tag = 'TXT_KEY_WONDER_WIELICZKA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_WIELICZKA_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_WIELICZKA_HELP';
				
UPDATE Language_ko_KR SET Text = '위치: [COLOR_CYAN]언덕[ENDCOLOR]; 시설: [COLOR_CYAN]광산 2개[ENDCOLOR]; 도시 인근에 [COLOR_CYAN][ICON_RES_SALT]소금을 놓을 곳[ENDCOLOR] 필요[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_WIELICZKA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '위치: [COLOR_CYAN]언덕[ENDCOLOR]; 도시 인근에 [COLOR_CYAN][ICON_RES_SALT]소금을 놓을 곳[ENDCOLOR] 필요[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_WIELICZKA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Plain of Jars
INSERT INTO Language_en_US 
			(Tag,										Text) 
VALUES		('TXT_KEY_BUILDING_THONG_HAI_HIN',			'Plain of Jars'),
			('TXT_KEY_WONDER_THONG_HAI_HIN_QUOTE',		'[NEWLINE]"As a well-spent day brings happy sleep, so life well used brings happy death."[NEWLINE] - Leonardo da Vinci[NEWLINE]'),
			('TXT_KEY_WONDER_THONG_HAI_HIN_PEDIA',		'TODO'),
			('TXT_KEY_WONDER_THONG_HAI_HIN_HELP',		'Units generate [ICON_PEACE] Faith [COLOR_POSITIVE_TEXT]on their Death[ENDCOLOR]. Land [ICON_INTERNATIONAL_TRADE] Trade Routes gain +2 [ICON_GOLD] Gold. All local [ICON_INTERNATIONAL_TRADE] Trade Routes gain +2 [ICON_FOOD] Food.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Plain of Jars[ENDCOLOR] lays on the crossroad of multiple trade routes, so it must fulfill many different roles: a storehouse ([ICON_INTERNATIONAL_TRADE]: +2[ICON_FOOD]), a cemetery (+3[ICON_PEACE]; 5[ICON_PEACE]/Death) and a market (+2[ICON_GOLD]; Land [ICON_INTERNATIONAL_TRADE]: +2[ICON_GOLD]).'
WHERE Tag = 'TXT_KEY_WONDER_THONG_HAI_HIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_THONG_HAI_HIN_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_THONG_HAI_HIN_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Plains[ENDCOLOR], [COLOR_NEGATIVE_TEXT]Coast[ENDCOLOR]; Plot: [COLOR_CYAN]Flat[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_THONG_HAI_HIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Plains[ENDCOLOR]; Plot: [COLOR_CYAN]Flat[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_THONG_HAI_HIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	

INSERT INTO Language_ko_KR 
			(Tag,										Text) 
VALUES		('TXT_KEY_BUILDING_THONG_HAI_HIN',			'항아리 평원'),
			('TXT_KEY_WONDER_THONG_HAI_HIN_QUOTE',		'[NEWLINE]"잘 보낸 하루가 행복한 잠을 가져오듯, 잘 보낸 삶은 행복한 죽음을 가져온다."[NEWLINE] - 레오나르도 다 빈치[NEWLINE]'),
			('TXT_KEY_WONDER_THONG_HAI_HIN_PEDIA',		'TODO'),
			('TXT_KEY_WONDER_THONG_HAI_HIN_HELP',		'유닛이 [COLOR_POSITIVE_TEXT]사망[ENDCOLOR]할 때 [ICON_PEACE]신앙을 생성합니다. 지상 [ICON_INTERNATIONAL_TRADE]교역로는 [ICON_GOLD]골드 +2를 제공합니다. 모든 국내 [ICON_INTERNATIONAL_TRADE]교역로는 [ICON_FOOD]식량 +2을 제공합니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]항아리 평원[ENDCOLOR]은 여러 무역로의 교차로에 위치하므로 창고([ICON_INTERNATIONAL_TRADE]: +2[ICON_FOOD]), 공동묘지(+3[ICON_PEACE], 5[ICON_PEACE]/죽음) 및 시장(+2[ICON_GOLD]; 국내 [ICON_INTERNATIONAL_TRADE]: +2[ICON_GOLD])의 역할을 수행해야 합니다.'
WHERE Tag = 'TXT_KEY_WONDER_THONG_HAI_HIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_THONG_HAI_HIN_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_THONG_HAI_HIN_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]평원[ENDCOLOR], [COLOR_NEGATIVE_TEXT]해안을 피할 것[ENDCOLOR]; 위치: [COLOR_CYAN]평지[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_THONG_HAI_HIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]평원[ENDCOLOR]; 위치: [COLOR_CYAN]평지[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_THONG_HAI_HIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Stonehenge
UPDATE Language_en_US
SET Text = 'Mysterious [COLOR_YIELD_FOOD]Stonehenge[ENDCOLOR] serves as an improved [COLOR_YIELD_FOOD]Council[ENDCOLOR] ([ICON_RESEARCH]), which provides instant faith boost (50[ICON_PEACE]), almost guaranteeing founding new religion and improving your engineering branch (+1[ICON_GREAT_ENGINEER]).'
WHERE Tag = 'TXT_KEY_BUILDING_STONEHENGE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,									Text) 
SELECT		'TXT_KEY_BUILDING_STONEHENGE_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_BUILDING_STONEHENGE_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Grassland[ENDCOLOR], [COLOR_NEGATIVE_TEXT]Coast[ENDCOLOR]; Plot: [COLOR_CYAN]Flat[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_STONEHENGE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Grassland[ENDCOLOR], Plot: [COLOR_CYAN]Flat[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_STONEHENGE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR
SET Text = '신비한 [COLOR_YIELD_FOOD]스톤헨지[ENDCOLOR]는 개선된 [COLOR_YIELD_FOOD]지문회[ENDCOLOR]([ICON_RESEARCH]) 역할을 하고 즉각적인 신앙 향상(50[ICON_PEACE])을 제공하여 거의 새로운 종교를 창시하며 공학 분야를 개선(+1[ICON_GREAT_ENGINEER])합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_STONEHENGE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,									Text) 
SELECT		'TXT_KEY_BUILDING_STONEHENGE_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_STONEHENGE_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]초원[ENDCOLOR], [COLOR_NEGATIVE_TEXT]해안을 피할 것[ENDCOLOR]; 위치: [COLOR_CYAN]평지[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_STONEHENGE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]초원[ENDCOLOR], 위치: [COLOR_CYAN]평지[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_STONEHENGE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Pyramids
UPDATE Language_en_US
SET Text = 'Great [COLOR_YIELD_FOOD]Pyramids[ENDCOLOR] are an engineering masterpiece (+1[ICON_GREAT_ENGINEER]), accelerating the coming of next golden age thanks to the efforts of prominent people (50[ICON_GOLDEN_AGE]/[ICON_GREAT_PEOPLE][ICON_GREAT_PEOPLE]). Use recently trained [COLOR_YIELD_GOLD]free Settler[ENDCOLOR] to found another great and prosperous city.'
WHERE Tag = 'TXT_KEY_WONDER_CHICHEN_ITZA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,									Text) 
SELECT		'TXT_KEY_WONDER_CHICHEN_ITZA_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_CHICHEN_ITZA_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_NEGATIVE_TEXT]Tundra[ENDCOLOR], [COLOR_NEGATIVE_TEXT]Snow[ENDCOLOR]; Plot: [COLOR_CYAN]Flat[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CHICHEN_ITZA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Flat[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CHICHEN_ITZA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR
SET Text = '위대한 [COLOR_YIELD_FOOD]피라미드[ENDCOLOR]는 저명한 사람들(50[ICON_GOLDEN_AGE]/[ICON_GREAT_PEOPLE][ICON_GREAT_PEOPLE])의 노력 덕분에 다음 황금 시대의 도래를 앞당기는 공학적 걸작(+1[ICON_GREAT_ENGINEER])입니다. 최근 훈련된 [COLOR_YIELD_GOLD]무료 개척자[ENDCOLOR]를 사용하여 또 다른 위대하고 번영하는 도시를 건설하십시오.'
WHERE Tag = 'TXT_KEY_WONDER_CHICHEN_ITZA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,									Text) 
SELECT		'TXT_KEY_WONDER_CHICHEN_ITZA_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_CHICHEN_ITZA_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_NEGATIVE_TEXT]툰드라나 설원을 피할 것[ENDCOLOR]; 위치: [COLOR_CYAN]평지[ENDCOLOR]; 특징: [COLOR_CYAN]강[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CHICHEN_ITZA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '위치: [COLOR_CYAN]평지[ENDCOLOR]; 특징: [COLOR_CYAN]강[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CHICHEN_ITZA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Petra
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Petra[ENDCOLOR] complex uses surrounding [COLOR_CITY_BLUE]Desert[ENDCOLOR] (+1[ICON_GOLD]/[ICON_FLOWER]) to increase your income. Send new [COLOR_YIELD_GOLD]free Caravan[ENDCOLOR] along available trade routes (+1[ICON_INTERNATIONAL_TRADE]) to quickly spread your culture over the world ([COLOR_CYAN]Archaeology:[ENDCOLOR] +6[ICON_CULTURE]).'
WHERE Tag = 'TXT_KEY_WONDER_PETRA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'City must be built on or next to Desert. ', '') WHERE Tag ='TXT_KEY_WONDER_PETRA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);
		
INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_PETRA_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_PETRA_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Desert[ENDCOLOR], [COLOR_CYAN]Mountain[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PETRA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Desert[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PETRA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]페트라[ENDCOLOR] 단지는 주변 [COLOR_CITY_BLUE]사막[ENDCOLOR](+1[ICON_GOLD]/[ICON_FLOWER])을 사용하여 수입을 늘립니다. 사용 가능한 무역로(+1[ICON_INTERNATIONAL_TRADE])를 따라 새로운 [COLOR_YIELD_GOLD]무료 대상[ENDCOLOR]을 보내서 전 세계에 문화를 빠르게 전파하세요([COLOR_CYAN]고고학:[ENDCOLOR] +6[ICON_CULTURE]).'
WHERE Tag = 'TXT_KEY_WONDER_PETRA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, '[COLOR_YELLOW]사막과 인접한 도시[ENDCOLOR]에만 건설할 수 있습니다. ', '') WHERE Tag ='TXT_KEY_WONDER_PETRA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);
		
INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_PETRA_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_PETRA_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]사막[ENDCOLOR], [COLOR_CYAN]산[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PETRA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]사막[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PETRA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Temple of Artemis
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Temple of Artemis[ENDCOLOR] strongly supports global growth (+10%[ICON_FOOD][ICON_FOOD]), promotes [COLOR_YIELD_FOOD]Herbalists[ENDCOLOR] ([ICON_FOOD]; [ICON_PRODUCTION]) and makes hired specialists in the city much less weighted (-2[ICON_HAPPINESS_3] Urbanization). As and addition, this city can spam ranged units to conquer even more valuable lands (+20%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]Ranged[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_TEMPLE_ARTEMIS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_TEMPLE_ARTEMIS_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_TEMPLE_ARTEMIS_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_NEGATIVE_TEXT]Desert[ENDCOLOR]; Feature: [COLOR_CYAN]Forest[ENDCOLOR]/[COLOR_CYAN]Jungle[ENDCOLOR]; Improvement: [COLOR_CYAN]Camp/Plantation[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_TEMPLE_ARTEMIS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Feature: [COLOR_CYAN]Forest[ENDCOLOR]/[COLOR_CYAN]Jungle[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_TEMPLE_ARTEMIS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]아르테미스 신전[ENDCOLOR]은 전반적인 성장(+10%[ICON_FOOD][ICON_FOOD])을 강력하게 지원하고 [COLOR_YIELD_FOOD]약초상[ENDCOLOR]([ICON_FOOD]; [ICON_PRODUCTION])를 장려하며 도시에서 고용된 전문가의 비중을 훨씬 줄입니다(-2[ICON_HAPPINESS_3] Urbanization). 추가로, 이 도시는 원거리 유닛을 양산(+20%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]원거리 유닛[ENDCOLOR])하여 훨씬 더 귀중한 땅을 정복할 수 있습니다.'
WHERE Tag = 'TXT_KEY_WONDER_TEMPLE_ARTEMIS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_TEMPLE_ARTEMIS_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_TEMPLE_ARTEMIS_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_NEGATIVE_TEXT]사막[ENDCOLOR]; 특징: [COLOR_CYAN]숲[ENDCOLOR]/[COLOR_CYAN]정글[ENDCOLOR]; 시설: [COLOR_CYAN]야영지/대농장[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_TEMPLE_ARTEMIS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특징: [COLOR_CYAN]숲[ENDCOLOR]/[COLOR_CYAN]정글[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_TEMPLE_ARTEMIS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Mausoleum of Halicarnassus
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Mausoleum of Halicarnassus[ENDCOLOR] starts new festival with greatly improved effect (20[ICON_HAPPINESS_1] WLTKD turns; +10%[ICON_PRODUCTION], +10%[ICON_GOLD], +10%[ICON_RESEARCH]/[ICON_HAPPINESS_1] WLTKD). Such a progress could be possible thanks to the effort of recenlty constructed [COLOR_YIELD_FOOD]Stone Works[ENDCOLOR] ([ICON_PRODUCTION]; [ICON_GOLD]).'
WHERE Tag = 'TXT_KEY_WONDER_MAUSOLEUM_HALICARNASSUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,												Text) 
SELECT		'TXT_KEY_WONDER_MAUSOLEUM_HALICARNASSUS_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_MAUSOLEUM_HALICARNASSUS_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR]; Improvement: [COLOR_CYAN]Quarry[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MAUSOLEUM_HALICARNASSUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MAUSOLEUM_HALICARNASSUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]할리카르나소스 영묘[ENDCOLOR]가 크게 향상된 효과로 새로운 축제(20턴동안 [ICON_HAPPINESS_1]국왕 경축일; +10%[ICON_PRODUCTION], +10%[ICON_GOLD], +10%[ICON_RESEARCH]/[ICON_HAPPINESS_1] 국왕경축일)를 시작합니다. 이러한 발전은 최근에 건설된 [COLOR_YIELD_FOOD]석재 공장[ENDCOLOR]([ICON_PRODUCTION]; [ICON_GOLD])의 노력 덕분에 가능했습니다.'
WHERE Tag = 'TXT_KEY_WONDER_MAUSOLEUM_HALICARNASSUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,												Text) 
SELECT		'TXT_KEY_WONDER_MAUSOLEUM_HALICARNASSUS_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_MAUSOLEUM_HALICARNASSUS_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 위치: [COLOR_CYAN]언덕[ENDCOLOR]; 시설: [COLOR_CYAN]채석장[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MAUSOLEUM_HALICARNASSUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 위치: [COLOR_CYAN]언덕[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MAUSOLEUM_HALICARNASSUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Statue of Zeus
UPDATE Language_en_US
SET Text = 'Monumental [COLOR_YIELD_FOOD]Statue of Zeus[ENDCOLOR] along with local [COLOR_YIELD_FOOD]Barracks[ENDCOLOR] ([ICON_SILVER_FIST]; [ICON_RESEARCH]; [ICON_HAPPINESS_3]) increases your offensive capabilities, especially during city sieges ([COLOR_WATER_TEXT]Statue of Zeus[ENDCOLOR]/[COLOR_YIELD_GOLD]Military[ENDCOLOR]) and triples your efforts towards reducing local unrest (-1[ICON_HAPPINESS_3] Distress).'
WHERE Tag = 'TXT_KEY_WONDER_STATUE_ZEUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,									Text) 
SELECT		'TXT_KEY_WONDER_STATUE_ZEUS_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_STATUE_ZEUS_HELP';
				
UPDATE Language_en_US SET Text = 'Other Player: [COLOR_CYAN]Guarded[ENDCOLOR]/[COLOR_CYAN]Afraid[ENDCOLOR]/[COLOR_CYAN]Hostile[ENDCOLOR]/[COLOR_CYAN]Warring[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_STATUE_ZEUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = ''||Text WHERE Tag ='TXT_KEY_WONDER_STATUE_ZEUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR
SET Text = '기념비적인 [COLOR_YIELD_FOOD]제우스 동상[ENDCOLOR]과 지역 [COLOR_YIELD_FOOD]병영[ENDCOLOR]([ICON_SILVER_FIST]; [ICON_RESEARCH]; [ICON_HAPPINESS_3])은 특히 도시 포위 공격 중에 공격 능력을 높이고([COLOR_WATER_TEXT]Statue of Zeus[ENDCOLOR]/[COLOR_YIELD_GOLD]Military[ENDCOLOR]) 지역 불안을 줄이기 위한 노력(-1[ICON_HAPPINESS_3] Distress)을 세 배로 늘립니다.'
WHERE Tag = 'TXT_KEY_WONDER_STATUE_ZEUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,									Text) 
SELECT		'TXT_KEY_WONDER_STATUE_ZEUS_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_STATUE_ZEUS_HELP';
				
UPDATE Language_ko_KR SET Text = '다른 문명: [COLOR_CYAN]방어적[ENDCOLOR]/[COLOR_CYAN]두려워함[ENDCOLOR]/[COLOR_CYAN]적대적[ENDCOLOR]/[COLOR_CYAN]전쟁중[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_STATUE_ZEUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = ''||Text WHERE Tag ='TXT_KEY_WONDER_STATUE_ZEUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
----------------------------------------------------
-- Malwiya Minaret
INSERT INTO Language_en_US 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_MALWIYA',			'Malwiya Minaret'),
			('TXT_KEY_WONDER_MALWIYA_QUOTE',		'[NEWLINE]"Aim at heaven and you will get Earth... Aim at Earth and you will get neither."[NEWLINE] - C.S. Lewis[NEWLINE]'),
			('TXT_KEY_WONDER_MALWIYA_PEDIA',		'The Malwiya Minaret (also known as the Spiral Minaret) is part of the Great Mosque of Samarra, located in Samarra, Iraq. The complex was built over a period of four years, from 848 to 852 CE. The main mosque was completed one year before the Minaret. The complex was constructed during the reign of Al-Mutawakkil, an Abbasid Caliph. For a time it was the largest mosque in the world.[NEWLINE][NEWLINE]  The minaret (tower) was constructed of sandstone, and is unique among other minarets because of its ascending spiral conical design. 52 metres high and 33 metres wide at the base, the spiral contains stairs reaching to the top. The word "malwiya" translates as "twisted" or "snail shell".[NEWLINE][NEWLINE]  With the turbulence of the Iraq war, the Malwiya Minaret has been damaged by bomb blasts, one in 2005 and one in 2011, when it was attacked by Iraqi insurgents.'),
			('TXT_KEY_WONDER_MALWIYA_HELP',			'All Stone Works in the Empire receive +2 [ICON_PRODUCTION] Production, all Quarries +1 [ICON_PRODUCTION] Production and +1 [ICON_PEACE] Faith and all Manufactories +3 [ICON_PEACE] Faith.');
				
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Malwiya Minaret[ENDCOLOR] is a result of engineering genious (+2[ICON_GREAT_ENGINEER]), that improved all [COLOR_CITY_BROWN]Quarried[ENDCOLOR] materials (+1[ICON_PRODUCTION], +1[ICON_PEACE]/[ICON_WORKER][ICON_WORKER]). Make sure to link your resources, construct many [COLOR_CITY_BROWN]Manufactories[ENDCOLOR] (+3[ICON_PEACE]/[ICON_WORKER][ICON_WORKER]) and rush [COLOR_YIELD_FOOD]Stone Works[ENDCOLOR] (+2[ICON_PRODUCTION][ICON_PRODUCTION]) in all your cities to support this wonderful project.'
WHERE Tag = 'TXT_KEY_WONDER_MALWIYA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_MALWIYA_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_MALWIYA_HELP';
				
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Flat[ENDCOLOR]; Building: [COLOR_CYAN]Stone Works[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MALWIYA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Flat[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MALWIYA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_MALWIYA',			'말위야 미나렛'),
			('TXT_KEY_WONDER_MALWIYA_QUOTE',		'[NEWLINE]"천국을 목표로 하면 지구를 얻을 수 있다... 지구를 겨냥하면 둘 다 얻을 수 없다."[NEWLINE] - C. S. 루이스[NEWLINE]'),
			('TXT_KEY_WONDER_MALWIYA_PEDIA',		'말위야 미나렛(스파이럴 미나렛으로도 알려져 있음)은 이라크 사마라에 위치한 사마라 모스크의 일부입니다. 이 단지는 서기 848년부터 852년까지 4년에 걸쳐 지어졌습니다. 주요 모스크는 미나렛 1년 전에 완공되었습니다. 이 단지는 아바스 왕조의 칼리프인 알 무타왁킬의 통치 기간 동안 건설되었습니다. 한때 그것은 세계에서 가장 큰 모스크였습니다.[NEWLINE][NEWLINE] 미나렛(타워)은 사암으로 지어졌으며, 상승하는 나선형 원추형 디자인 때문에 다른 미나렛 중에서 독특합니다. 나선형은 높이 52m, 바닥 폭 33m로 꼭대기까지 올라가는 계단을 포함하고 있습니다. "말위야"라는 단어는 "비뚤어진" 또는 "달팽이 껍질"로 번역됩니다.[NEWLINE][NEWLINE] 이라크 전쟁의 격동과 함께, 말위야 미나렛은 2005년과 2011년 이라크 저항세력의 공격을 받아 폭탄 공격으로 피해를 입었습니다.'),
			('TXT_KEY_WONDER_MALWIYA_HELP',			'제국의 모든 석재 공장은 [ICON_PRODUCTION]생산 +2를 제공하며, 제국의 모든 채석장은 [ICON_PRODUCTION]생산 +1, [ICON_PEACE]신앙 +1을 제공하하고, 제국의 모든 제조소는 [ICON_PEACE]신앙 +3을 제공합니다.');
				
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]말위야 미나렛[ENDCOLOR]은 모든 [COLOR_CITY_BROWN]채석된[ENDCOLOR](+1[ICON_PRODUCTION], +1[ICON_PEACE]/[ICON_WORKER][ICON_WORKER]) 재료를 개선한 천재적인 공학(+2[ICON_GREAT_ENGINEER])의 결과입니다. 자원을 연결하고 많은 [COLOR_CITY_BROWN]제조소[ENDCOLOR](+3[ICON_PEACE]/[ICON_WORKER][ICON_WORKER])를 건설하고 모든 도시에서 [COLOR_YIELD_FOOD]석재 공장[ENDCOLOR](+2[ICON_PRODUCTION][ICON_PRODUCTION])을 서둘러 건설하여 이 멋진 프로젝트를 지원하세요.'
WHERE Tag = 'TXT_KEY_WONDER_MALWIYA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_MALWIYA_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_MALWIYA_HELP';
				
UPDATE Language_ko_KR SET Text = '위치: [COLOR_CYAN]평지[ENDCOLOR]; 건물: [COLOR_CYAN]채석 공장[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MALWIYA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '위치: [COLOR_CYAN]평지[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MALWIYA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Buddhas of Bamyan
INSERT INTO Language_en_US 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_BAMYAN',			'Buddhas of Bamyan'),
			('TXT_KEY_WONDER_BAMYAN_QUOTE',		'[NEWLINE]"The past is already gone, the future is not yet here. There''s only one moment for you to live."[NEWLINE] - Buddha[NEWLINE]'),
			('TXT_KEY_WONDER_BAMYAN_PEDIA',		'Deep in the Hindu Kush, in the Bamyan Valley, along the Silk Road, the Buddhas of Bamyan once towered over the region. Bamyan was a religious site from the 2nd century until the later half of the 7th century, and the Buddhas were constructed throughout that time. The Chinese Buddhist pilgrim Xuanzang visited in 630 CE, describing Bamyan as a flourishing Buddhist center "with more than ten monstaries and more than a thousand monks". In 2001, the Buddhas were destroyed by the Taliban, either in protest of international aid priorities or as part of Islamic religious iconoclasm, to both international and domestic condemnation. Since then, international efforts have been made to reconstruct the Buddhas. Furthermore, after the destruction of the Buddhas, caves containing art from the 5th through 9th centuries were discovered, as well as Xuanzang''s translation of the Pratityasamutpada Sutra that spelled out the basic belief of Buddhism: all things are transient.While the original Buddhas of Bamyan may be gone, their message and cultural significance will echo for all eternity.'),
			('TXT_KEY_WONDER_BAMYAN_HELP',		'City generates +100% Religious Pressure. +2 [ICON_PEACE] per City-State Friend and +3 [ICON_GOLDEN_AGE] per City-State Ally. +1 [ICON_INFLUENCE] World Congress Vote for each 2 Declarations of Friendship. +2 [ICON_CULTURE] Culture and +2 [ICON_GOLDEN_AGE] Golden Age Points with [COLOR_CYAN]Rocketry[ENDCOLOR].');
			
UPDATE Language_en_US
SET Text = 'Gigantic [COLOR_YIELD_FOOD]Buddhas[ENDCOLOR] should be sign of your generosity passed to all nations in the world (+100%[ICON_RELIGION] Pressure). Make sure to keep peace around you and gather many friends and allies (+2[ICON_PEACE]/[ICON_CITY_STATE] Friend; +3[ICON_GOLDEN_AGE]/[ICON_CITY_STATE] Ally), even in distant future when world will be led by superpowers (+1[ICON_DIPLOMAT] League Vote/2 DoF).'
WHERE Tag = 'TXT_KEY_WONDER_BAMYAN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_BAMYAN_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_BAMYAN_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]2 Mountains[ENDCOLOR]; Player: [COLOR_CYAN]at Peace[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BAMYAN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = ''||Text WHERE Tag ='TXT_KEY_WONDER_BAMYAN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_BAMYAN',			'바미얀 석불'),
			('TXT_KEY_WONDER_BAMYAN_QUOTE',		'[NEWLINE]"과거는 이미 가고 미래는 아직 오지 않았다. 네가 살 수 있는 순간은 단 한 번뿐이다."[NEWLINE] - 석가모니[NEWLINE]'),
			('TXT_KEY_WONDER_BAMYAN_PEDIA',		'힌두쿠시 깊숙한 곳, 실크로드를 따라 바미안 계곡에 있는 바미얀 석불은 한때 이 지역 위로 우뚝 솟아 있었습니다. 바미얀은 2세기부터 7세기 후반까지 종교적인 장소였으며 그 기간 내내 불상이 건립되었습니다. 삼장법사로 흔히 알려진 중국 불교 순례자 현장은 서기 630년에 방문하여 바미얀을 "10명 이상의 승려와 1,000명 이상의 승려가 있는" 번영하는 불교 중심지로 묘사했습니다. 2001년 국제 원조에 대한 항의 또는 이슬람 종교 우상 파괴의 일환으로 탈레반이 불상을 파괴하여 국제적 및 국내적 비난을 받았습니다. 그 이후로 불상을 재건하려는 국제적인 노력이 이루어졌습니다. 또한 불상이 파괴된 후 5세기에서 9세기의 예술품이 있는 동굴과 모든 것이 덧없다는 불교의 기본 신념을 철자한 인연생기의 삼장법사 번역본이 발견되었습니다. 바미안 석불은 사라졌지만, 불상의 메시지와 문화적 중요성은 영원히 메아리칠 것입니다.'),
			('TXT_KEY_WONDER_BAMYAN_HELP',		'도시는 +100% 종교적 압력을 생성합니다. 각각의 우호적인 도시국가가 [ICON_PEACE]신앙 +2를 제공하며 동맹인 도시국가는 [ICON_GOLDEN_AGE]황금기점수 +3을 추가로 제공합니다. 우호선언 2회마다 [ICON_INFLUENCE]세계 대회 추가 대표단 +1명을 확보합니다. [COLOR_CYAN]로켓공학[ENDCOLOR]연구 시 [ICON_CULTURE]문화 +2 [ICON_GOLDEN_AGE]황금기점수 +2를 제공합니다.');
			
UPDATE Language_ko_KR
SET Text = '거대한 [COLOR_YIELD_FOOD]불상[ENDCOLOR]은 세계의 모든 국가에 전달되는 당신의 관대함의 표시여야 합니다(+100%[ICON_RELIGION] 압력). 초강대국이 세계를 이끌 먼 미래에도 주위에 평화를 유지하고(+1[ICON_DIPLOMAT] 새계 대회 대표단/2 우호선언) 많은 친구와 동맹(+2[ICON_PEACE]/[ICON_CITY_STATE] 우호적; +3[ICON_GOLDEN_AGE]/[ICON_CITY_STATE] 동맹)을 모으십시오.'
WHERE Tag = 'TXT_KEY_WONDER_BAMYAN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_BAMYAN_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_BAMYAN_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]산 2개[ENDCOLOR]; 플레이어: [COLOR_CYAN]평화상태[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BAMYAN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = ''||Text WHERE Tag ='TXT_KEY_WONDER_BAMYAN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Gate of the Sun
INSERT INTO Language_en_US 
			(Tag,										Text) 
VALUES		('TXT_KEY_BUILDING_GATE_OF_SUN',			'Gate of the Sun'),
			('TXT_KEY_WONDER_GATE_OF_SUN_QUOTE',		'[NEWLINE]"May the sun set on where my love dwells."[NEWLINE] - Bolivian proverb[NEWLINE]'),
			('TXT_KEY_WONDER_GATE_OF_SUN_PEDIA',		'The Gate of the Sun is a stone arch constructed by the ancient Tiwanaku culture of Bolivia, dated to between 500-950 CE. The lintel is carved with 48 squars surrounding a central figure. The central figure is a man with his head surrounded by 24 rays. Some believe that the Gate of the Sun possesses an astronomical or astrological significance, or may have served as a calendar. No one knows for sure.'),
			('TXT_KEY_WONDER_GATE_OF_SUN_HELP',			'All Walls in the Empire receive +1 [ICON_RESEARCH] Science. +1 [ICON_CULTURE] Culture from Mountains and Lakes worked by this City. Has 1 slot for [ICON_GREAT_WORK] Great Work of Art. +5% [ICON_RESEARCH] Science produced by this City during [ICON_GOLDEN_AGE] Golden Age and +5% [ICON_RESEARCH] Science in Cities with Walls.');
			
UPDATE Language_en_US
SET Text = 'Mysterious [COLOR_YIELD_FOOD]Gate of the Sun[ENDCOLOR] hides unremarkable inscriptions (+1[ICON_GREAT_WORK]). Revealing their secrets can help your [COLOR_CITY_BLUE]Mountains[ENDCOLOR] (+1[ICON_CULTURE]/[ICON_FLOWER] to City) and [COLOR_CITY_GREEN]Lakes[ENDCOLOR] (+1[ICON_CULTURE]/[ICON_MUSHROOM]) become more influential and will be key factor in your developement (+5%[ICON_RESEARCH]/[ICON_GOLDEN_AGE]). Remember to pass the knowledge by building [COLOR_YIELD_FOOD]Walls[ENDCOLOR] (+1[ICON_RESEARCH][ICON_RESEARCH]; +5%[ICON_RESEARCH]/Cities with Walls) in all your cities.'
WHERE Tag = 'TXT_KEY_WONDER_GATE_OF_SUN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_GATE_OF_SUN_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_GATE_OF_SUN_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Mountain[ENDCOLOR]; Feature: [COLOR_CYAN]Lake[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GATE_OF_SUN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Feature: [COLOR_CYAN]Lake[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GATE_OF_SUN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

INSERT INTO Language_ko_KR 
			(Tag,										Text) 
VALUES		('TXT_KEY_BUILDING_GATE_OF_SUN',			'태양의 문'),
			('TXT_KEY_WONDER_GATE_OF_SUN_QUOTE',		'[NEWLINE]"내 사랑이 사는 곳에 해가 지기를."[NEWLINE] - 볼리비아 속담[NEWLINE]'),
			('TXT_KEY_WONDER_GATE_OF_SUN_PEDIA',		'태양의 문은 서기 500년에서 950년 사이의 볼리비아의 고대 티와나쿠 문화에 의해 지어진 석조 아치입니다. 상인방은 중앙부를 둘러싼 48개의 사각형으로 조각되어 있습니다. 그 중심부는 24개의 광선으로 둘러싸인 그의 머리를 가진 사람 형태입니다. 어떤 사람들은 태양의 문이 천문학적 또는 점성학적인 중요성을 가지고 있거나 달력의 역할을 했을 수 있다고 믿습니다만 확실한건 아무도 모릅니다.'),
			('TXT_KEY_WONDER_GATE_OF_SUN_HELP',			'제국의 모든 성벽은 [ICON_RESEARCH]과학 +1을 제공합니다. 이 도시의 산과 호수에서 [ICON_CULTURE]문화 +1을 제공합니다. [ICON_GREAT_WORK]걸작 슬롯 1개를 제공합니다. [ICON_GOLDEN_AGE]황금기동안 이 도시에서 생산하는 [ICON_RESEARCH]과학이 +5% 증가하고 성벽이 있는 도시에서 생산하는 [ICON_RESEARCH]과학이 +5% 증가합니다.');
			
UPDATE Language_ko_KR
SET Text = '신비한 [COLOR_YIELD_FOOD]태양의 문[ENDCOLOR]은 눈에 띄지 않는 비문을 숨깁니다(+1[ICON_GREAT_WORK]). 비밀을 공개하면 [COLOR_CITY_BLUE]산[ENDCOLOR](이 도시에 +1[ICON_CULTURE]/[ICON_FLOWER]) 및 [COLOR_CITY_GREEN]호수[ENDCOLOR](+1[ICON_CULTURE]/[ICON_MUSHROOM])가 더 큰 영향력을 발휘하고 개발의 핵심 요소가 됩니다(+5%[ICON_RESEARCH]/[ICON_GOLDEN_AGE]). 모든 도시에 [COLOR_YIELD_FOOD]성벽[ENDCOLOR](+1[ICON_RESEARCH][ICON_RESEARCH]; +5%[ICON_RESEARCH]/성벽이 있는 도시)을 건설하여 지식을 전달하는 것을 잊지 마십시오.'
WHERE Tag = 'TXT_KEY_WONDER_GATE_OF_SUN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_GATE_OF_SUN_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_GATE_OF_SUN_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]산[ENDCOLOR]; 특징: [COLOR_CYAN]호수[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GATE_OF_SUN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특징: [COLOR_CYAN]호수[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GATE_OF_SUN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- El Ghriba Synagogue
INSERT INTO Language_en_US 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_EL_GHRIBA',			'El Ghriba Synagogue'),
			('TXT_KEY_WONDER_EL_GHRIBA_QUOTE',		'[NEWLINE]"Jesus was born a Jew, and he died a Jew. It never occurred to him to establish a new religion. He never crossed himself - he had no reason to. He never set one foot in a church. He went to synagogue."[NEWLINE] - Amos Oz[NEWLINE]'),
			('TXT_KEY_WONDER_EL_GHRIBA_PEDIA',		'El Ghriba Synagogue, located on the Tunisian island of Djerba, is the oldest synagogue in Tunisa and the center of the village''s holy life. According to legend, it was constructed with a door and a stone from the destruction of either Solomon''s Temple in 586 BCE or the Second Temple in 70 CE. Thus, it links the local Jewish community to the ancestral heart of Judaism and remains a pilgrimage site into the modern day.'),
			('TXT_KEY_GREAT_WORK_THE_ARK',			'Ark of the Covenant'),
			('TXT_KEY_GREAT_WORK_THE_ARK_QUOTE',	'[NEWLINE]"I had it in my heart to build a house of rest [NEWLINE]for the ark of the covenant of the Lord, [NEWLINE]and for the footstool of our God."[NEWLINE] - 1 Chronicles, 28:2[NEWLINE]'),
			('TXT_KEY_WONDER_EL_GHRIBA_HELP',		'Provides a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Synagogue in the City in which it is built. Converts 15% of [ICON_PEACE] Faith Purchase into [ICON_GOLD]. Has 1 slot for [ICON_GREAT_WORK] Great Work of Art, and starts with [ICON_GREAT_WORK] [COLOR_CULTURE_STORED]Ark of the Covenant[ENDCOLOR].');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]El Ghriba[ENDCOLOR] is a [COLOR_YIELD_FOOD]Synagogue[ENDCOLOR] ([ICON_PRODUCTION]; [ICON_PEACE]; [ICON_HAPPINESS_3]; [ICON_GREAT_WORK]; [ICON_RESEARCH]) containing artifacts like [COLOR_CULTURE_STORED]Ark of the Covenant[ENDCOLOR] (+1[ICON_GREAT_WORK]), which is foundation stone of Jewish history. It can also successfully make all religious expenses profit some gold in return (15%[ICON_PEACE] Faith Purchase into [ICON_GOLD]).'
WHERE Tag = 'TXT_KEY_WONDER_EL_GHRIBA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_EL_GHRIBA_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_EL_GHRIBA_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_YIELD_PRODUCTION]Holy City[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_EL_GHRIBA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_en_US SET Text = 'Special: [COLOR_YIELD_PRODUCTION]Holy City[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_EL_GHRIBA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_EL_GHRIBA',			'엘 그리바 회당'),
			('TXT_KEY_WONDER_EL_GHRIBA_QUOTE',		'[NEWLINE]"예수님은 유대인으로 태어나셨고, 유대인으로 돌아가셨습니다. 그는 새로운 종교를 설립할 생각을 전혀 하지 못했습니다. 그는 절대로 십자가를 그은 적이 없습니다. 그는 그럴 이유가 없었습니다. 그는 교회에 발을 들여놓지 않았습니다. 그는 유대교 회당에 갔습니다."[NEWLINE] - 아모스 오즈[NEWLINE]'),
			('TXT_KEY_WONDER_EL_GHRIBA_PEDIA',		'튀니지 제르바 섬에 위치한 엘 그리바 회당은 튀니지에서 가장 오래된 회당이며 마을의 성스러운 삶의 중심입니다. 전설에 따르면, 기원전 586년에 솔로몬의 신전이 파괴되거나 서기 70년에 두 번째 신전이 파괴되어 문과 돌로 지어졌다고 합니다. 따라서, 그것은 지역 유대인 공동체를 유대교의 조상 중심지와 연결하고 현대에 이르기까지 순례지로 남아 있습니다.'),
			('TXT_KEY_GREAT_WORK_THE_ARK',			'언약궤'),
			('TXT_KEY_GREAT_WORK_THE_ARK_QUOTE',	'[NEWLINE]"나는 여호와의 언약궤 곧 우리 하나님의 발판을 봉안할 성전을 건축할 마음이 있어서 건축할 재료를 준비하였다"[NEWLINE] - 역대상 28장 2절[NEWLINE]'),
			('TXT_KEY_WONDER_EL_GHRIBA_HELP',		'건설된 도시에 무료 [COLOR_POSITIVE_TEXT]회당[ENDCOLOR]을 제공합니다. [ICON_PEACE]신앙 구매의 15%를 [ICON_GOLD]골드로 전환합니다. [ICON_GREAT_WORK][COLOR_CULTURE_STORED]언약궤[ENDCOLOR]가 포함된 [ICON_GREAT_WORK]걸작 슬롯 1개를 제공합니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]엘 그리바[ENDCOLOR]는 유대 역사의 초석인 [COLOR_CULTURE_STORED]언약궤[ENDCOLOR](+1[ICON_GREAT_WORK])와 같은 유물이 있는 [COLOR_YIELD_FOOD]회당[ENDCOLOR]([ICON_PRODUCTION]; [ICON_PEACE]; [ICON_HAPPINESS_3]; [ICON_GREAT_WORK]; [ICON_RESEARCH])입니다. 또한 성공적으로 모든 종교 비용이 약간의 금을 얻을 수 있도록 합니다(15%[ICON_PEACE]의 신앙 구매를 [ICON_GOLD]로).'
WHERE Tag = 'TXT_KEY_WONDER_EL_GHRIBA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_EL_GHRIBA_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_EL_GHRIBA_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_YIELD_PRODUCTION]성도[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_EL_GHRIBA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '특수: [COLOR_YIELD_PRODUCTION]성도[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_EL_GHRIBA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Etchmiadzin Cathedral
INSERT INTO Language_en_US 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_ETCHMIADZIN',		'Etchmiadzin Cathedral'),
			('TXT_KEY_WONDER_ETCHMIADZIN_QUOTE',	'[NEWLINE]"The wound of a dagger heals, but that of the tongue, never."[NEWLINE] - Armenian proverb[NEWLINE]'),
			('TXT_KEY_WONDER_ETCHMIADZIN_PEDIA',	'Located in Vagharshapat, Armenia, Etchmiadzin Cathedral is often considered the oldest cathedral in the world. Following the adoption of Christianity as the Armenian state religion by King Tiridates III, tt was built between 301 and 303 CE by Saint Gregory the Illuminator over a pagan temple. Until the second half of the fifth century, Etchmiadzin was the seat of the supreme head of the Armenian Church.[NEWLINE]Etchmiadzin was the national and political center of the Armenian people for centuries, and is considered to be holy ground. It is crucial to the Armenian identity, and remains a popular pilgrimage site today. While Shah Abbas I of Persia plundered the cathedral in an attempt to diminish Armenian cultural identity, and the cathedral''s importance was diminished under the Soviet Union, it endured. In 2000, it was added to the list of UNESCO World Heritage Sites. Notably, the cathedral claims to house several relics, such as the Lance of Longingus, relics of the Twelve Apostles, and a fragment of Noah''s Ark.'),
			('TXT_KEY_GREAT_WORK_HOLY_LANCE',		'Holy Lance'),
			('TXT_KEY_GREAT_WORK_HOLY_LANCE_QUOTE',	'[NEWLINE]One of the[NEWLINE]soldiers[NEWLINE]pierced his[NEWLINE]side with[NEWLINE]a lance, and[NEWLINE]immediately[NEWLINE]there came[NEWLINE]out blood[NEWLINE]and water.[NEWLINE] - John, 19:34[NEWLINE]'),
			('TXT_KEY_WONDER_ETCHMIADZIN_HELP',		'Converts 10% of [ICON_PEACE] Faith produced by this City into [ICON_CULTURE] Culture and another 10% into [ICON_GOLDEN_AGE] Golden Age Points. Has 1 slot for [ICON_GREAT_WORK] Great Work of Art, and starts with [ICON_GREAT_WORK] [COLOR_CULTURE_STORED]Holy Lance[ENDCOLOR]. All [ICON_GREAT_WORK] Great Works in the Empire receive +1 [ICON_PEACE] Faith.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Etchmiadzin Cathedral[ENDCOLOR] stores wonderful great works like [COLOR_CULTURE_STORED]Holy Lance[ENDCOLOR] (+1[ICON_GREAT_WORK]; +1[ICON_PEACE]/[ICON_GREAT_WORK][ICON_GREAT_WORK]). Thanks to the support of high up nobles, it turns speeds up coming of next golden era and increase your culture output (10%[ICON_PEACE] into [ICON_CULTURE], [ICON_GOLDEN_AGE]).'
WHERE Tag = 'TXT_KEY_WONDER_ETCHMIADZIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_ETCHMIADZIN_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_ETCHMIADZIN_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Grassland[ENDCOLOR], [COLOR_NEGATIVE_TEXT]Coast[ENDCOLOR]; Feature: [COLOR_CYAN]Forest[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ETCHMIADZIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_en_US SET Text = 'Feature: [COLOR_CYAN]Forest[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ETCHMIADZIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	

INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_ETCHMIADZIN',		'에치미아진 대성당'),
			('TXT_KEY_WONDER_ETCHMIADZIN_QUOTE',	'[NEWLINE]"단도의 상처는 아물지만 혀의 상처는 결코 낫지 않는다."[NEWLINE] - 아르메니아 속담[NEWLINE]'),
			('TXT_KEY_WONDER_ETCHMIADZIN_PEDIA',	'아르메니아 바하르샤파트에 위치한 에치미아진 대성당은 종종 세계에서 가장 오래된 대성당으로 간주됩니다. 티리다테스 3세 왕이 기독교를 아르메니아 국교로 채택한 후, 301년에서 303년 사이에 성 그레고리 계몽자에 의해 이교도 사원 위에 세워졌습니다. 5세기 후반까지 에치미아진은 아르메니아 교회의 최고 수장의 자리였습니다.[NEWLINE]에치미아딘은 수 세기 동안 아르메니아 사람들의 국가적, 정치적 중심지였고 성지로 여겨집니다. 이곳은 아르메니아인의 정체성에 중요하며, 오늘날에도 인기 있는 순례지로 남아있습니다. 페르시아의 샤 압바스 1세는 아르메니아의 문화적 정체성을 약화시키기 위해 대성당을 약탈했고, 그 성당의 중요성은 소련 아래에서 약화되었지만, 견뎌냈습니다. 2000년에, 에치미아진 대성당은 유네스코 세계 문화 유산 목록에 추가되었습니다. 특히, 이 성당은 성스러운 창, 열두 사도의 유물, 노아의 방주 조각과 같은 여러 유물들을 소장하고 있다고 주장합니다.'),
			('TXT_KEY_GREAT_WORK_HOLY_LANCE',		'성스러운 창'),
			('TXT_KEY_GREAT_WORK_HOLY_LANCE_QUOTE',	'[NEWLINE]군인들 중 하나가 창으로 그분의 옆구리를 찌르니, 즉시 피와 물이 나왔다.[NEWLINE] - 요한복음 19장 34절[NEWLINE]'),
			('TXT_KEY_WONDER_ETCHMIADZIN_HELP',		'이 도시에서 생산된 [ICON_PEACE]신앙을 10%씩 각각 [ICON_CULTURE]문화와 [ICON_GOLDEN_AGE]황금기점수로 전환합니다. [ICON_GREAT_WORK][COLOR_CULTURE_STORED]성스러운 창[ENDCOLOR]이 포함된 [ICON_GREAT_WORK]걸작 슬롯 1개를 제공합니다. 제국의 모든 [ICON_GREAT_WORK]걸작이 [ICON_PEACE]신앙 +1을 제공합니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]에치미아진 대성당[ENDCOLOR]은 [COLOR_CULTURE_STORED]성스러운 창[ENDCOLOR](+1[ICON_GREAT_WORK]; +1[ICON_PEACE]/[ICON_GREAT_WORK][ICON_GREAT_WORK])과 같은 멋진 걸작을 보관하고 있습니다. 고위 귀족의 지원 덕분에 다음 황금 시대가 도래하는 속도가 빨라지고 문화 생산량이 증가합니다(10%[ICON_PEACE]에서 [ICON_CULTURE], [ICON_GOLDEN_AGE]).'
WHERE Tag = 'TXT_KEY_WONDER_ETCHMIADZIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_ETCHMIADZIN_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_ETCHMIADZIN_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]초원[ENDCOLOR], [COLOR_NEGATIVE_TEXT]해안을 피할 것[ENDCOLOR]; 특징: [COLOR_CYAN]숲[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ETCHMIADZIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '특징: [COLOR_CYAN]숲[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ETCHMIADZIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Chand Baori
INSERT INTO Language_en_US 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_CHAND_BAORI',		'Chand Baori'),
			('TXT_KEY_WONDER_CHAND_BAORI_QUOTE',	'[NEWLINE]"When the well''s dry, we know the worth of water."[NEWLINE] - Benjamin Franklin[NEWLINE]'),
			('TXT_KEY_WONDER_CHAND_BAORI_PEDIA',	'Built over a thousand years ago, Chand Baori is a stepwell located in the Abhaneri village of Rajasthan, India. Stepwells are unique to the Indian subcontinent, and are wells with steps leading down to the water. They were one of many developments to deal with the seasonal availability of water. [NEWLINE]Chand Baori is quite possibly the largest of the stepwells, and may be the most visually spectacular. It is a four-sided structure, with a temple to Harshat Mata, goddess of joy, at one face. In the modern era, Chand Baori has been included in several Bollywood films, though stepwells have fallen out of favor with the arrival of running water.'),
			('TXT_KEY_WONDER_CHAND_BAORI_HELP',		'Receive 1 [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] [ICON_GREAT_PEOPLE] Great Person of your choice. +10% generation of [ICON_GREAT_PEOPLE] Great People in this City. +1 [ICON_FOOD] Food from Desert tiles in this City. 3 Specialists in the City no longer generates [ICON_HAPPINESS_3] Unhappiness from Urbanization.');

UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Chand Baori[ENDCOLOR] guarantees, that your local [COLOR_CITY_BLUE]Desert[ENDCOLOR] (+1[ICON_FOOD]/[ICON_FLOWER]) will not be useless for your city. It is also place, where new specialists settle their offices (-3[ICON_HAPPINESS_3] Urbanization) and very important and profitable deals between nobles are agreed ([COLOR_YIELD_GOLD]free [ICON_GREAT_PEOPLE][ENDCOLOR]; +10%[ICON_GREAT_PEOPLE]).'
WHERE Tag = 'TXT_KEY_WONDER_CHAND_BAORI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_CHAND_BAORI_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_CHAND_BAORI_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Desert[ENDCOLOR]; Feature: [COLOR_NEGATIVE_TEXT]Fresh Water[ENDCOLOR]; Building: [COLOR_CYAN]Well[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CHAND_BAORI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_en_US SET Text = 'Feature: [COLOR_NEGATIVE_TEXT]Fresh Water[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CHAND_BAORI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	

INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_CHAND_BAORI',		'찬드 바오리'),
			('TXT_KEY_WONDER_CHAND_BAORI_QUOTE',	'[NEWLINE]"우물이 마르면 우리는 물의 가치를 안다."[NEWLINE] - 벤저민 프랭클린[NEWLINE]'),
			('TXT_KEY_WONDER_CHAND_BAORI_PEDIA',	'천년 전에 지어진 찬드 바오리는 인도 라자스탄의 아바네리 마을에 위치한 계단식 우물입니다. 계단식 우물은 인도 아대륙에서만 볼 수 있는 독특한 우물로 물로 내려가는 계단이 있는데 이것은 물의 계절적 가용성을 다루기 위한 많은 개발 중 하나였습니다.[NEWLINE]찬드 바오리는 계단식 우물 중 아마도 가장 크며 시각적으로 가장 장관일 것입니다. 4면 구조로 기쁨의 여신 하르샤트 마타의 신전이 한쪽 면에 있습니다. 현대 시대에 찬드 바오리는 여러 볼리우드 영화에 포함되었지만 흐르는 물이 도래하면서 계단식 우물은 선호되지 않았습니다.'),
			('TXT_KEY_WONDER_CHAND_BAORI_HELP',		'선택한 무료 [ICON_GREAT_PEOPLE][COLOR_POSITIVE_TEXT]위인[ENDCOLOR]을 1명 받습니다. 이 도시의 [ICON_GREAT_PEOPLE]위인 발생률이 +10% 증가합니다. 이 도시의 사막 타일에서 [ICON_FOOD]식량 +1을 제공합니다. 이 도시의 전문가 3명은 더 이상 도시화로 인한 [ICON_HAPPINESS_3]불행을 생성하지 않습니다.');

UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]찬드 바오리[ENDCOLOR]는 지역의 [COLOR_CITY_BLUE]사막[ENDCOLOR](+1[ICON_FOOD]/[ICON_FLOWER])이 이 도시를 위해 쓸모없는 것이 되지 않을 것을 보장합니다. 그곳은 또한 새로운 전문가들이 그들의 사무실을 정리(-3[ICON_HAPPINESS_3] 도시화)하고 귀족들 사이에 매우 중요하고 수익성 있는 거래들이 합의되는 장소([COLOR_YIELD_GOLD]무료 [ICON_GREAT_PEOPLE][ENDCOLOR]; +10%[ICON_GREAT_PEOPLE])입니다.'
WHERE Tag = 'TXT_KEY_WONDER_CHAND_BAORI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_CHAND_BAORI_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_CHAND_BAORI_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]사막[ENDCOLOR]; 특징: [COLOR_NEGATIVE_TEXT]담수를 피할 것[ENDCOLOR]; 건물: [COLOR_CYAN]우물[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CHAND_BAORI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '특징: [COLOR_NEGATIVE_TEXT]담수를 피할 것[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CHAND_BAORI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Sigiriya
INSERT INTO Language_en_US 
			(Tag,										Text)
VALUES		('TXT_KEY_BUILDING_SIGIRIYA',				'Sigiriya'),
			('TXT_KEY_WONDER_SIGIRIYA_QUOTE',			'[NEWLINE]"I am Budal. Came with hundreds of people to see Sigiriya. Since all the others wrote poems, I did not!"[NEWLINE] - Text of the poem from 10th century[NEWLINE]'),
			('TXT_KEY_WONDER_SIGIRIYA_PEDIA',			'TODO'),
			('TXT_KEY_THEMING_BONUS_SIGIRIYA',			'Beautiful collection of native art'),
			('TXT_KEY_THEMING_BONUS_SIGIRIYA_HELP',		'To maximize your bonus, make sure all the Great Work Slots are all filled with art created by you.'),
			('TXT_KEY_WONDER_SIGIRIYA_HELP',			'Greatly increase [ICON_STRENGTH] Combat Strength of this City. Instantly receive 200 [ICON_GOLD] Gold. All [ICON_GREAT_WORK] Great Works in the Empire receive +1 [ICON_CULTURE] Culture. Has 2 slots for [ICON_GREAT_WORK] Great Works of Art. +3 [ICON_GOLD] Gold and +1 [ICON_CULTURE] Culture if [COLOR_POSITIVE_TEXT]Themed[ENDCOLOR].');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Sigiriya[ENDCOLOR] contains huge treasures hidden underground (200[ICON_GOLD]) as well as many valuable artistic creations (+1[ICON_CULTURE]/[ICON_GREAT_WORK][ICON_GREAT_WORK]; +2[ICON_GREAT_WORK] if themed: [ICON_GOLD], [ICON_CULTURE]). All of them are safe on top of the local unreachable hill (+10[ICON_STRENGTH]).'
WHERE Tag = 'TXT_KEY_WONDER_SIGIRIYA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_SIGIRIYA_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_SIGIRIYA_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_NEGATIVE_TEXT]Coast[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR]; Feature: [COLOR_CYAN]Forest[ENDCOLOR]/[COLOR_CYAN]Jungle[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SIGIRIYA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Hill[ENDCOLOR]; Feature: [COLOR_CYAN]Forest[ENDCOLOR]/[COLOR_CYAN]Jungle[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SIGIRIYA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	

INSERT INTO Language_ko_KR 
			(Tag,										Text)
VALUES		('TXT_KEY_BUILDING_SIGIRIYA',				'시기리야'),
			('TXT_KEY_WONDER_SIGIRIYA_QUOTE',			'[NEWLINE]"나는 부달이다. 수백 명의 사람들과 함께 시기리야를 보러 왔다. 다른 사람들이 모두 시를 썼기 때문에, 나는 쓰지 않았다!"[NEWLINE] - 10세기의 시 본문[NEWLINE]'),
			('TXT_KEY_WONDER_SIGIRIYA_PEDIA',			'TODO'),
			('TXT_KEY_THEMING_BONUS_SIGIRIYA',			'아름다운 토속 예술 모음집'),
			('TXT_KEY_THEMING_BONUS_SIGIRIYA_HELP',		'보너스를 최대화하려면 걸작 슬롯을 모두 자신이 만든 걸작 예술품으로 채워야 합니다.'),
			('TXT_KEY_WONDER_SIGIRIYA_HELP',			'이 도시의 [ICON_STRENGTH]전투력을 크게 증가시킵니다. 완공 시 [ICON_GOLD]골드 200을 제공합니다. 제국의 모든 [ICON_GREAT_WORK]걸작이 [ICON_CULTURE]문화 +1를 제공합니다. [ICON_GREAT_WORK]걸작 슬롯 2개를 제공합니다. [NEWLINE][NEWLINE]테마보너스: [ICON_GOLD]골드 +3 [ICON_CULTURE]문화 +1');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]시기리야[ENDCOLOR]에는 지하에 숨겨진 거대한 보물(200[ICON_GOLD])과 많은 귀중한 예술 작품(+1[ICON_CULTURE]/[ICON_GREAT_WORK][ICON_GREAT_WORK]; +2[ICON_GREAT_WORK] 테마보너스: [ICON_GOLD], [ICON_CULTURE])이 있습니다. 또한 그 지역의 도달할 수 없는 언덕 위에 있기 때문에 안전합니다(+10[ICON_STRENGTH]).'
WHERE Tag = 'TXT_KEY_WONDER_SIGIRIYA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_SIGIRIYA_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_SIGIRIYA_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_NEGATIVE_TEXT]해안을 피할 것[ENDCOLOR]; 위치: [COLOR_CYAN]언덕[ENDCOLOR]; 특징: [COLOR_CYAN]숲[ENDCOLOR]/[COLOR_CYAN]정글[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SIGIRIYA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '위치: [COLOR_CYAN]언덕[ENDCOLOR]; 특징: [COLOR_CYAN]숲[ENDCOLOR]/[COLOR_CYAN]정글[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SIGIRIYA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Great Lighthouse
UPDATE Language_en_US
SET Text = 'Nothing can help sailors to achieve their destination more than [COLOR_YIELD_FOOD]Lighthouse[ENDCOLOR] ([ICON_FOOD]; [ICON_GOLD]; [ICON_CONNECTED]). [COLOR_YIELD_FOOD]Great Lighthouse[ENDCOLOR] additionally strengthens vision and movement of all your sea units ([COLOR_WATER_TEXT]Great Lighthouse[ENDCOLOR]/[COLOR_YIELD_GOLD]Military Naval[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_GREAT_LIGHTHOUSE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'City must be built on the coast. ', '') WHERE Tag ='TXT_KEY_WONDER_GREAT_LIGHTHOUSE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_en_US 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_GREAT_LIGHTHOUSE_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_GREAT_LIGHTHOUSE_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR], [COLOR_NEGATIVE_TEXT]Grassland[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GREAT_LIGHTHOUSE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GREAT_LIGHTHOUSE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]등대[ENDCOLOR]([ICON_FOOD]; [ICON_GOLD]; [ICON_CONNECTED])보다 선원이 목적지에 도달하는 데 도움이 되는 것은 없습니다. [COLOR_YIELD_FOOD]파로스 등대[ENDCOLOR]는 모든 해상 유닛([COLOR_WATER_TEXT]조종사 II[ENDCOLOR]/[COLOR_YIELD_GOLD]해양 군사 유닛[ENDCOLOR])의 시야와 움직임을 추가로 강화합니다.'
WHERE Tag = 'TXT_KEY_WONDER_GREAT_LIGHTHOUSE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, '[COLOR_YELLOW]해안 도시[ENDCOLOR]에만 건설할 수 있습니다. ', '') WHERE Tag ='TXT_KEY_WONDER_GREAT_LIGHTHOUSE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_ko_KR 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_GREAT_LIGHTHOUSE_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_GREAT_LIGHTHOUSE_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR], [COLOR_NEGATIVE_TEXT]초원을 피할 것[ENDCOLOR]; 특징: [COLOR_CYAN]강[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GREAT_LIGHTHOUSE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 특징: [COLOR_CYAN]강[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GREAT_LIGHTHOUSE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Great Library
UPDATE Language_en_US
SET Text = 'Enormous collection of books from [COLOR_YIELD_FOOD]Great Library[ENDCOLOR], like all other [COLOR_YIELD_FOOD]Libraries[ENDCOLOR] ([ICON_RESEARCH]; [ICON_HAPPINESS_3]) provides massive scientific boost (+1[ICON_GREAT_SCIENTIST]), instant technological progress ([COLOR_CYAN]free Technology[ENDCOLOR]) and additional slots for literature granting even more science if themed (+2[ICON_GREAT_WORK] if themed: [ICON_RESEARCH]).'
WHERE Tag = 'TXT_KEY_WONDER_GREAT_LIBRARY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_GREAT_LIBRARY_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_GREAT_LIBRARY_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR]; Feature: [COLOR_CYAN]Forest[ENDCOLOR]/[COLOR_CYAN]Jungle[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GREAT_LIBRARY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Hill[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GREAT_LIBRARY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR
SET Text = '다른 모든 [COLOR_YIELD_FOOD]도서관[ENDCOLOR]([ICON_RESEARCH]; [ICON_HAPPINESS_3])과 마찬가지로 [COLOR_YIELD_FOOD]알렉산드리아 도서관[ENDCOLOR]의 방대한 도서 모음집은 엄청난 과학적 향상(+1[ICON_GREAT_SCIENTIST]), 즉각적인 기술 진보([COLOR_CYAN]무료 기술[ENDCOLOR]) 및 테마가 있는 경우 더 많은 과학을 부여하는 문학을 위한 추가 슬롯(+2[ICON_GREAT_WORK] 테마 보너스: [ICON_RESEARCH])을 제공합니다.'
WHERE Tag = 'TXT_KEY_WONDER_GREAT_LIBRARY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_GREAT_LIBRARY_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_GREAT_LIBRARY_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 위치: [COLOR_CYAN]언덕[ENDCOLOR]; 특징: [COLOR_CYAN]숲[ENDCOLOR]/[COLOR_CYAN]정글[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GREAT_LIBRARY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '위치: [COLOR_CYAN]언덕[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GREAT_LIBRARY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Forum Romanum
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Forum Romanum[ENDCOLOR] uses variety of abilities to make you the most influential ruler in the world. Beside receiving support of experts ([COLOR_YIELD_GOLD]free [ICON_DIPLOMAT][ENDCOLOR]; +1[ICON_DIPLOMAT]), you have increased production of diplomatic units (+20%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]Diplomatic[ENDCOLOR]), new [COLOR_GREY]Paper[ENDCOLOR] source available (+1[ICON_RES_PAPER]) and increased pitch in any diplomatic actions ([COLOR_WATER_TEXT]Imperial Seal[ENDCOLOR]/[COLOR_YIELD_GOLD]Diplomatic[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_BUILDING_FORUM_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_BUILDING_FORUM_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_BUILDING_FORUM_HELP';
				
UPDATE Language_en_US SET Text = 'Feature: [COLOR_CYAN]River[ENDCOLOR], [COLOR_CYAN]Marsh[ENDCOLOR]; Policy: [COLOR_MAGENTA]1 Policy less needed[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_FORUM_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Feature: [COLOR_CYAN]Marsh[ENDCOLOR]; Policy: [COLOR_MAGENTA]1 Policy less needed[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_FORUM_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]로마 포럼[ENDCOLOR]은 다양한 능력을 사용하여 당신을 세계에서 가장 영향력 있는 통치자가 되도록 합니다. 전문가의 지원([COLOR_YIELD_GOLD]무료 [ICON_DIPLOMAT][ENDCOLOR]; +1[ICON_DIPLOMAT])을 받는 것 외에도 외교 유닛 생산이 증가(+20%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]외교 유닛[ENDCOLOR])하고 새로운 [COLOR_GREY]종이[ENDCOLOR] 자원(+1[ICON_RES_PAPER])을 사용할 수 있으며 모든 외교 조치에서 정점을 증가([COLOR_WATER_TEXT]황실 봉인[ENDCOLOR]/[COLOR_YIELD_GOLD]외교 유닛[ENDCOLOR])시킵니다.'
WHERE Tag = 'TXT_KEY_BUILDING_FORUM_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_BUILDING_FORUM_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_FORUM_HELP';
				
UPDATE Language_ko_KR SET Text = '특징: [COLOR_CYAN]강[ENDCOLOR], [COLOR_CYAN]습지[ENDCOLOR]; 정책: [COLOR_MAGENTA]1개 이상 필요[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_FORUM_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특징: [COLOR_CYAN]습지[ENDCOLOR]; 정책: [COLOR_MAGENTA]1개 이상 필요[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_FORUM_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Hanging Gardens
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Hanging Gardens[ENDCOLOR] are are much bigger and spectacular version of standard [COLOR_YIELD_FOOD]Garden[ENDCOLOR] ([ICON_GREAT_PEOPLE]; [ICON_GOLD]; [ICON_FOOD]; [ICON_HAPPINESS_3]), which provides massive amount of food (+10[ICON_FOOD]). Boost your population growth using its perks.'
WHERE Tag = 'TXT_KEY_WONDER_HANGING_GARDEN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_HANGING_GARDEN_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_HANGING_GARDEN_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_NEGATIVE_TEXT]Coast[ENDCOLOR]; Plot: [COLOR_CYAN]Flat[ENDCOLOR]; Feature: [COLOR_CYAN]Fresh Water[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HANGING_GARDEN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Feature: [COLOR_CYAN]Fresh Water[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HANGING_GARDEN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]공중 정원[ENDCOLOR]은 일반적인 [COLOR_YIELD_FOOD]정원[ENDCOLOR]([ICON_GREAT_PEOPLE]; [ICON_GOLD]; [ICON_FOOD]; [ICON_HAPPINESS_3])보다 훨신 크고 멋지며, 엄청난 양의 식량(+ 10[ICON_FOOD])을 제공합니다. 이러한 특전을 사용하여 인구 증가를 촉진하십시오.'
WHERE Tag = 'TXT_KEY_WONDER_HANGING_GARDEN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_HANGING_GARDEN_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_HANGING_GARDEN_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_NEGATIVE_TEXT]해안을 피할 것[ENDCOLOR]; 위치: [COLOR_CYAN]평지[ENDCOLOR]; 특징: [COLOR_CYAN]담수[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HANGING_GARDEN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특징: [COLOR_CYAN]담수[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HANGING_GARDEN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Terracota Army
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Terracota Army[ENDCOLOR] allows for creation incredible army (+5[ICON_SILVER_FIST]) and increases improvement construction speed (+25%[ICON_WORKER]) to create well-developed cities. Make sure to kill all your enemies (10[ICON_CULTURE]/Kill)!'
WHERE Tag = 'TXT_KEY_WONDER_TERRA_COTTA_ARMY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_TERRA_COTTA_ARMY_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_TERRA_COTTA_ARMY_HELP';
				
UPDATE Language_en_US SET Text = 'Feature: [COLOR_NEGATIVE_TEXT]Water[ENDCOLOR]; Improvement: [COLOR_CYAN]2 (Mines + Quarries)[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_TERRA_COTTA_ARMY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Feature: [COLOR_NEGATIVE_TEXT]Water[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_TERRA_COTTA_ARMY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]병마용[ENDCOLOR]을 사용하면 놀라운 군대를 생성하고(+5[ICON_SILVER_FIST]) 건설 속도를 개선하여(+25%[ICON_WORKER]) 잘 발달된 도시를 만들 수 있습니다. 모든 적을 죽이십시오(10[ICON_CULTURE]/처치시)!'
WHERE Tag = 'TXT_KEY_WONDER_TERRA_COTTA_ARMY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_TERRA_COTTA_ARMY_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_TERRA_COTTA_ARMY_HELP';
				
UPDATE Language_ko_KR SET Text = '특징: [COLOR_NEGATIVE_TEXT]물을 피할 것[ENDCOLOR]; 시설: [COLOR_CYAN](광산+채석장) 2개[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_TERRA_COTTA_ARMY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특징: [COLOR_NEGATIVE_TEXT]물을 피할 것[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_TERRA_COTTA_ARMY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Parthenon
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Parthenon[ENDCOLOR] focuses not only on artistry (+2[ICON_GREAT_WORK] if themed: [ICON_CULTURE]; [COLOR_CULTURE_STORED]Phidias Showing the Frieze of the Parthenon to his Friends[ENDCOLOR]) entertaining your citizens (-1[ICON_HAPPINESS_3] Boredom), but also supports your army (+10% of [ICON_CITIZEN] as [ICON_SILVER_FIST]). Additionally it turns [COLOR_YIELD_FOOD]Amphitheaters[ENDCOLOR] (+1[ICON_RESEARCH][ICON_RESEARCH]; +1[ICON_CULTURE][ICON_CULTURE]) into scientific and cultural centers.'
WHERE Tag = 'TXT_KEY_WONDER_PARTHENON_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'Contains a prebuilt [ICON_GREAT_WORK] Great Work of Art in one of the [ICON_GREAT_WORK] Great Work slots.', 'Starts with [ICON_GREAT_WORK] [COLOR_CULTURE_STORED]Phidias Showing the Frieze of the Parthenon to his Friends[ENDCOLOR].') WHERE Tag ='TXT_KEY_WONDER_PARTHENON_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_en_US 
			(Tag,									Text) 
SELECT		'TXT_KEY_WONDER_PARTHENON_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_PARTHENON_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR]; Feature: [COLOR_NEGATIVE_TEXT]Fresh Water[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PARTHENON_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Hill[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PARTHENON_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]파르테논 신전[ENDCOLOR]은 예술성에만 초점을 맞추는 것이 아닙니다(+2[ICON_GREAT_WORK] 테마보너스: [ICON_CULTURE]; [COLOR_CULTURE_STORED]파르테논 벽장식[ENDCOLOR]). 시민을 즐겁게 할 뿐만 아니라(-1[ICON_HAPPINESS_3] 무료) 군대도 지원합니다([ICON_CITIZEN]의 +10%를 [ICON_SILVER_FIST]로). 또한 [COLOR_YIELD_FOOD]원형 극장[ENDCOLOR](+1[ICON_RESEARCH][ICON_RESEARCH]; +1[ICON_CULTURE][ICON_CULTURE])을 과학 및 문화의 중심지로 전환합니다.'
WHERE Tag = 'TXT_KEY_WONDER_PARTHENON_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, '[ICON_GREAT_WORK]걸작 예술품이 [COLOR_POSITIVE_TEXT]1개[ENDCOLOR] 들어 있는 [ICON_GREAT_WORK]걸작 슬롯을 포함합니다.', '[ICON_GREAT_WORK][COLOR_CULTURE_STORED]파르테논 벽장식[ENDCOLOR]이 포함된 [ICON_GREAT_WORK]걸작 슬롯 2개를 제공합니다.') WHERE Tag ='TXT_KEY_WONDER_PARTHENON_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_ko_KR 
			(Tag,									Text) 
SELECT		'TXT_KEY_WONDER_PARTHENON_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_PARTHENON_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 위치: [COLOR_CYAN]언덕[ENDCOLOR]; 특징: [COLOR_NEGATIVE_TEXT]담수를 피할 것[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PARTHENON_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '위치: [COLOR_CYAN]언덕[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PARTHENON_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Oracle
UPDATE Language_en_US
SET Text = 'Mysterious [COLOR_YIELD_FOOD]Oracle[ENDCOLOR], unlike other [COLOR_YIELD_FOOD]Temples[ENDCOLOR] ([ICON_PEACE]; [ICON_CULTURE]; [ICON_GOLD]; [ICON_GREAT_WORK]; [ICON_HAPPINESS_3]), makes all your scientific projects possible (+1[ICON_GREAT_SCIENTIST]). It gives you massive instant yield injection (500[ICON_RESEARCH]; 500[ICON_CULTURE]) and makes your citizens more qualified (-1[ICON_HAPPINESS_3] Illiteracy).'
WHERE Tag = 'TXT_KEY_WONDER_ORACLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_ORACLE_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_ORACLE_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Mountain[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ORACLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Hill[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ORACLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR
SET Text = '신비한 [COLOR_YIELD_FOOD]오라클[ENDCOLOR]은 다른 [COLOR_YIELD_FOOD]사원[ENDCOLOR]([ICON_PEACE]; [ICON_CULTURE]; [ICON_GOLD]; [ICON_GREAT_WORK]; [ICON_HAPPINESS_3])과 달리 모든 과학 프로젝트를 가능하게 합니다(+1[ICON_GREAT_SCIENTIST]). 엄청난 양의 즉각적인 수익 투입(500[ICON_RESEARCH]; 500[ICON_CULTURE])을 제공하고 시민을 더 자질 있게 만듭니다(-1[ICON_HAPPINESS_3] 문맹).'
WHERE Tag = 'TXT_KEY_WONDER_ORACLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_ORACLE_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_ORACLE_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]산[ENDCOLOR]; 위치: [COLOR_CYAN]언덕[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ORACLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '위치: [COLOR_CYAN]언덕[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ORACLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Angkor Wat
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Angkor Wat[ENDCOLOR] boosts your empire''s expansion (+25%[ICON_CULTURE][ICON_CULTURE] Border Growth; -25%[ICON_GOLD][ICON_GOLD] Plot Cost) and, unlike other [COLOR_YIELD_FOOD]Mandirs[ENDCOLOR] ([ICON_FOOD]; [ICON_PEACE]; [ICON_HAPPINESS_3]; [ICON_GREAT_WORK]; [ICON_SPY]), supports your engineering projects (+1[ICON_GREAT_ENGINEER]).'
WHERE Tag = 'TXT_KEY_WONDER_ANGKOR_WAT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,									Text) 
SELECT		'TXT_KEY_WONDER_ANGKOR_WAT_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_ANGKOR_WAT_HELP';
				
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Flat[ENDCOLOR]; Feature: [COLOR_CYAN]Lake[ENDCOLOR], [COLOR_CYAN]Jungle[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ANGKOR_WAT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Feature: [COLOR_CYAN]Lake[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ANGKOR_WAT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]앙코르 와트[ENDCOLOR]는 다른 [COLOR_YIELD_FOOD]만디르[ENDCOLOR]([ICON_FOOD]; [ICON_PEACE]; [ICON_HAPPINESS_3]; [ICON_GREAT_WORK]; [ICON_SPY])와 달리 당신의 제국의 확장을 촉진(+25%[ICON_CULTURE][ICON_CULTURE] 국경 확장; -25%[ICON_GOLD][ICON_GOLD] 타일 구매)하고 당신의 공학 프로젝트(+1[ICON_GREAT_ENGINEER])를 지원합니다.'
WHERE Tag = 'TXT_KEY_WONDER_ANGKOR_WAT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,									Text) 
SELECT		'TXT_KEY_WONDER_ANGKOR_WAT_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_ANGKOR_WAT_HELP';
				
UPDATE Language_ko_KR SET Text = '위치: [COLOR_CYAN]평지[ENDCOLOR]; 특징: [COLOR_CYAN]호수[ENDCOLOR], [COLOR_CYAN]정글[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ANGKOR_WAT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특징: [COLOR_CYAN]호수[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ANGKOR_WAT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Great Wall
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Great Wall[ENDCOLOR] is unbelievably successful defensive project, modifying your [COLOR_YIELD_FOOD]Walls[ENDCOLOR] ([ICON_STRENGTH]; [ICON_SILVER_FIST]; [ICON_RANGE_STRENGTH]; [ICON_HAPPINESS_3]) into monstrual barrier (-All [ICON_MOVES] if Enemy crosses your borders). It allows your soldiers, led by experienced general ([COLOR_YIELD_GOLD]free [ICON_GREAT_GENERAL][ENDCOLOR]), to compete with greatest armies in the world (+3[ICON_SILVER_FIST]).'
WHERE Tag = 'TXT_KEY_WONDER_GREAT_WALL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,									Text) 
SELECT		'TXT_KEY_WONDER_GREAT_WALL_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_GREAT_WALL_HELP';
				
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Hill[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR]; Other Player: [COLOR_CYAN]Deceptive[ENDCOLOR]/[COLOR_CYAN]Hostile[ENDCOLOR]/[COLOR_CYAN]Warring[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GREAT_WALL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Hill[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GREAT_WALL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]만리장성[ENDCOLOR]은 믿을 수 없을 정도로 성공적인 방어 프로젝트로, [COLOR_YIELD_FOOD]성벽[ENDCOLOR]([ICON_STRENGTH]; [ICON_SILVER_FIST]; [ICON_RANGE_STRENGTH]; [ICON_HAPPINESS_3])을 거대한 장벽으로 개조(적이 영토 내에 들어올 경우 모든 [ICON_MOVES] 제거)합니다. 숙련된 장군([COLOR_YIELD_GOLD]무료 [ICON_GREAT_GENERAL][ENDCOLOR])이 이끄는 당신의 병사들(+3[ICON_SILVER_FIST])이 세계 최고의 군대와 경쟁할 수 있게 해줍니다.'
WHERE Tag = 'TXT_KEY_WONDER_GREAT_WALL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,									Text) 
SELECT		'TXT_KEY_WONDER_GREAT_WALL_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_GREAT_WALL_HELP';
				
UPDATE Language_ko_KR SET Text = '위치: [COLOR_CYAN]언덕[ENDCOLOR]; 특징: [COLOR_CYAN]강[ENDCOLOR]; 다른 문명: [COLOR_CYAN]기만중[ENDCOLOR]/[COLOR_CYAN]적대적[ENDCOLOR]/[COLOR_CYAN]전쟁중[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GREAT_WALL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '위치: [COLOR_CYAN]언덕[ENDCOLOR]; 특징: [COLOR_CYAN]강[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GREAT_WALL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Colossus
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Colossus[ENDCOLOR] will make from you the greatest merchant of all seas (+1[ICON_INTERNATIONAL_TRADE]; [COLOR_YIELD_GOLD]free Cargo Ship[ENDCOLOR]). You can only watch how your gold income in the city is growing more and more thanks to the recently established trade routes (+2[ICON_GOLD]/[ICON_INTERNATIONAL_TRADE]).'
WHERE Tag = 'TXT_KEY_WONDER_COLOSSUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'City must be built on the coast. ', '') WHERE Tag ='TXT_KEY_WONDER_COLOSSUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_COLOSSUS_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_COLOSSUS_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Improved Resource: [ICON_RES_IRON] [COLOR_CYAN]Iron[ENDCOLOR]/[ICON_RES_COPPER] [COLOR_CYAN]Copper[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_COLOSSUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_COLOSSUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]로도스의 거상[ENDCOLOR]은 당신을 모든 바다에서 가장 위대한 상인으로 만들 것입니다(+1[ICON_INTERNATIONAL_TRADE]; [COLOR_YIELD_GOLD]무료 화물선[ENDCOLOR]). 최근에 설립된 무역로(+2[ICON_GOLD]/[ICON_INTERNATIONAL_TRADE]) 덕분에 도시의 골드 수입이 점점 더 증가하는 것을 볼 수 있습니다.'
WHERE Tag = 'TXT_KEY_WONDER_COLOSSUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, '[COLOR_YELLOW]해안 도시[ENDCOLOR]에만 건설할 수 있습니다. ', '') WHERE Tag ='TXT_KEY_WONDER_COLOSSUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_COLOSSUS_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_COLOSSUS_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 개발된 자원: [ICON_RES_IRON][COLOR_CYAN]철[ENDCOLOR]/[ICON_RES_COPPER][COLOR_CYAN]구리[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_COLOSSUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_COLOSSUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
----------------------------------------------------
-- Prophet's Mosque
INSERT INTO Language_en_US 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_NABAWI',				'Prophet''s Mosque'),
			('TXT_KEY_WONDER_NABAWI_QUOTE',			'[NEWLINE]"When you see a person who has been given more than you in money and beauty, look to those, who have been given less."[NEWLINE] - Prophet Muhammad[NEWLINE]'),
			('TXT_KEY_WONDER_NABAWI_PEDIA',			'Al-Masjid al-Nabawi, often called the Prophet''s Mosque, is a mosque situated in the city of Medina. As the final resting place of the Islamic prophet Muhammad, it is considered the second holiest site in Islam by Muslims (the first being the Masjid al-Haram in Mecca) and is one of the largest mosques in the World. The mosque is under the control of the Custodian of the Two Holy Mosques. It is the second mosque built in history.[NEWLINE][NEWLINE]  One of the most notable features of the site is the Green Dome over the center of the mosque, where the tomb of Muhammad is located. It is not exactly known when the green dome was constructed but manuscripts dating to the early 12th century describe the dome. It is known as the Dome of the Prophet or the Green Dome. Subsequent Islamic rulers greatly expanded and decorated it. Early Muslim leaders Abu Bakr and Umar are buried in an adjacent area in the mosque.[NEWLINE][NEWLINE]  The site was originally Muhammad''s house; he settled there after his Hijra to Medina, later building a mosque on the grounds. He himself shared in the heavy work of construction. The original mosque was an open-air building. The basic plan of the building has been adopted in the building of other mosques throughout the world.'),
			('TXT_KEY_THEMING_BONUS_NABAWI',		'Islamic calligraphy works'),
			('TXT_KEY_THEMING_BONUS_NABAWI_HELP',	'To maximize your bonus, make sure both Great Works are filled with Writings created by you.'),
			('TXT_KEY_WONDER_NABAWI_HELP',			'Provides a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Mosque in the City in which it is built. All Cities generate +10% [ICON_PEACE] Faith. Has 2 slot for [ICON_GREAT_WORK] Great Works of Writing that provide +4 [ICON_PEACE] Faith and [ICON_GOLDEN_AGE] Golden Age Points if [COLOR_POSITIVE_TEXT]Themed[ENDCOLOR]. +20% generation of [ICON_GREAT_WRITER] Great Writers in this City.');
			
UPDATE Language_en_US
SET Text = 'This Wonder is an unique [COLOR_YIELD_FOOD]Mosque[ENDCOLOR] ([ICON_RESEARCH]; [ICON_PEACE]; [ICON_GREAT_WORK]; [ICON_CULTURE]; [ICON_GOLDEN_AGE]; [ICON_HAPPINESS_3]) where you can learn arabic religious literature (+20%[ICON_GREAT_WRITER]; +2[ICON_GREAT_WORK] if themed: [ICON_PEACE], [ICON_GOLDEN_AGE]). Massive faith output (+10%[ICON_PEACE][ICON_PEACE]) from your empire will help you in achieving religious domination.'
WHERE Tag = 'TXT_KEY_WONDER_NABAWI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_NABAWI_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_NABAWI_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_YIELD_PRODUCTION]Holy City[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_NABAWI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_en_US SET Text = 'Special: [COLOR_YIELD_PRODUCTION]Holy City[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_NABAWI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	

INSERT INTO Language_ko_KR 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_NABAWI',				'예언자의 모스크'),
			('TXT_KEY_WONDER_NABAWI_QUOTE',			'[NEWLINE]"당신보다 돈과 아름다움을 더 많이 받은 사람이 보이면, 당신보다 그것들을 덜 받은 사람을 보라."[NEWLINE] - 예언자 무함마드[NEWLINE]'),
			('TXT_KEY_WONDER_NABAWI_PEDIA',			'종종 예언자의 모스크라고 불리는 알 마스지드 알 나바위는 메디나 시에 위치한 모스크입니다. 이슬람 예언자 무함마드의 마지막 안식처로서, 이슬람교도들에 의해 이슬람교에서 두 번째로 신성한 장소로 여겨지며, 세계에서 가장 큰 모스크 중 하나입니다. 모스크는 두 개의 신성한 모스크의 관리자의 통제하에 있습니다. 이것은 역사상 두 번째로 지어진 모스크입니다.[NEWLINE][NEWLINE] 이 장소의 가장 주목할 만한 특징 중 하나는 무함마드의 무덤이 위치한 모스크의 중앙에 있는 녹색 돔입니다. 녹색 돔이 언제 지어졌는지는 정확히 알려져 있지 않지만 12세기 초의 필사본들이 돔을 묘사하고 있습니다. 그것은 예언자의 돔 또는 녹색 돔으로 알려져 있습니다. 이후의 이슬람 통치자들은 그것을 크게 확장하고 장식했습니다. 초기 이슬람 지도자 아부 바크르와 우마르는 모스크의 인접한 지역에 묻혔습니다.[NEWLINE][NEWLINE] 그 장소는 원래 무함마드의 집이었습니다; 그는 메디나에게 히즈라를 보낸 후 그곳에 정착했고, 나중에 그 땅에 모스크를 지었습니다. 그 자신이 건설의 힘든 일을 분담했습니다. 원래 모스크는 야외 건물이었습니다. 그 건물의 기본 계획은 전 세계의 다른 모스크의 건축에 채택되었습니다.'),
			('TXT_KEY_THEMING_BONUS_NABAWI',		'이슬람 서예 작품'),
			('TXT_KEY_THEMING_BONUS_NABAWI_HELP',	'보너스를 최대화하려면 걸작 슬롯을 모두 자신이 만든 걸작 문학으로 채워야 합니다.'),
			('TXT_KEY_WONDER_NABAWI_HELP',			'건설된 도시에 무료 [COLOR_POSITIVE_TEXT]모스크[ENDCOLOR]를 제공합니다. 모든 도시는 [ICON_PEACE]신앙 +10%을 생성합니다. [ICON_GREAT_WORK] 걸작 슬롯을 2개 제공하며 이 도시에서 [ICON_GREAT_WRITER]위대한 작가 생성률이 +20% 증가합니다.[NEWLINE][NEWLINE]테마보너스: [ICON_PEACE]신앙 +4 [ICON_GOLDEN_AGE]황금기점수');
			
UPDATE Language_ko_KR
SET Text = '이 불가사의는 독특한 [COLOR_YIELD_FOOD]모스크[ENDCOLOR]([ICON_RESEARCH]; [ICON_PEACE]; [ICON_GREAT_WORK]; [ICON_CULTURE]; [ICON_GOLDEN_AGE]; [ICON_HAPPINESS_3])에서 아랍의 종교 문학을 배울 수 있습니다(+20%[ICON_GREAT_WRITER]; +2[ICON_GREAT_WORK] 테마보너스: [ICON_PEACE], [ICON_GOLDEN_AGE]). 당신의 제국에서 나오는 엄청난 신앙 생산량(+10%[ICON_PEACE][ICON_PEACE])은 당신이 종교적 지배를 달성하는 데 도움이 될 것입니다.'
WHERE Tag = 'TXT_KEY_WONDER_NABAWI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_NABAWI_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_NABAWI_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_YIELD_PRODUCTION]성도[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_NABAWI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_ko_KR SET Text = '특수: [COLOR_YIELD_PRODUCTION]성도[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_NABAWI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Lavaux
INSERT INTO Language_en_US 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_LAVAUX',				'Lavaux'),
			('TXT_KEY_WONDER_LAVAUX_QUOTE',			'[NEWLINE]"A bottle of wine contains more philosophy than all the books in the world".[NEWLINE] - Louis Pasteur[NEWLINE]'),
			('TXT_KEY_WONDER_LAVAUX_PEDIA',			'TODO'),
			('TXT_KEY_WONDER_LAVAUX_HELP',			'Wonder places 2 new [ICON_RES_WINE] Wine resources inside City range if possible. Empire [ICON_HAPPINESS_3] Needs Modifier is reduced by 10% in all Cities. +1 [ICON_FOOD] Food from Lakes worked by this City.[NEWLINE][NEWLINE]Nearby [ICON_RES_WINE] Wine: +1 [ICON_FOOD] Food, +1 [ICON_GOLD] Gold and +1 [ICON_PEACE] Faith.');
			
UPDATE Language_en_US
SET Text = 'Wineyards of [COLOR_YIELD_FOOD]Lavaux[ENDCOLOR] are well-known source of unique [COLOR_GREY]Grapes[ENDCOLOR] (+2[ICON_RES_WINE]; +1[ICON_FOOD], +1[ICON_GOLD], +1[ICON_PEACE]/[ICON_RES_WINE]). Try to make all your citizens much happier (-10%[ICON_HAPPINESS_3][ICON_HAPPINESS_3] Needs) using these wonderful fruits, benefitting crystal clear waters of nearby [COLOR_CITY_GREEN]Lake[ENDCOLOR] (+1[ICON_FOOD][ICON_MUSHROOM]).'
WHERE Tag = 'TXT_KEY_WONDER_LAVAUX_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_LAVAUX_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_LAVAUX_HELP';
				
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Hill[ENDCOLOR]; Feature: [COLOR_CYAN]Lake[ENDCOLOR]; City [COLOR_CYAN]place for Wine[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_LAVAUX_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Hill[ENDCOLOR]; Feature: [COLOR_CYAN]Lake[ENDCOLOR]; City [COLOR_CYAN]place for Wine[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_LAVAUX_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	

INSERT INTO Language_ko_KR 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_LAVAUX',				'라보 포도원 테라스'),
			('TXT_KEY_WONDER_LAVAUX_QUOTE',			'[NEWLINE]"와인 한 병은 세상의 모든 책보다 더 많은 철학을 담고 있다.".[NEWLINE] - 루이 파스퇴르[NEWLINE]'),
			('TXT_KEY_WONDER_LAVAUX_PEDIA',			'TODO'),
			('TXT_KEY_WONDER_LAVAUX_HELP',			'가능하면 도시 범위 내에 새로운 [ICON_RES_WINE]와인 자원을 2개를 배치합니다. 제국의 모든 도시의 [ICON_HAPPINESS_3]전역 요구 불행이 -10% 감소합니다. 이 도시의 호수가 [ICON_FOOD]식량 +1을 제공합니다. 이 도시 근처의 [ICON_RES_WINE]와인이 [ICON_FOOD]식량 +1 [ICON_GOLD]골드 +1 [ICON_PEACE]신앙 +1을 제공합니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]라보[ENDCOLOR]의 포도주 양조장은 고유한 [COLOR_GREY]포도[ENDCOLOR]의 잘 알려진 공급원입니다(+2[ICON_RES_WINE]; +1[ICON_FOOD], +1[ICON_GOLD], +1[ICON_PEACE]/[ICON_RES_WINE]). 인근 [COLOR_CITY_GREEN]호수[ENDCOLOR](+1[ICON_FOOD][ICON_MUSHROOM])의 맑고 투명한 물에 도움이 되는 이 멋진 과일을 사용하여 모든 시민을 훨씬 더 행복하게(-10%[ICON_HAPPINESS_3][ICON_HAPPINESS_3]전역 요구 불행) 만드십시오.'
WHERE Tag = 'TXT_KEY_WONDER_LAVAUX_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_LAVAUX_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_LAVAUX_HELP';
				
UPDATE Language_ko_KR SET Text = '위치: [COLOR_CYAN]언덕[ENDCOLOR]; 특징: [COLOR_CYAN]호수[ENDCOLOR]; 도시 인근에 [COLOR_CYAN][ICON_RES_WINE]와인을 놓을 곳[ENDCOLOR] 필요[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_LAVAUX_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '위치: [COLOR_CYAN]언덕[ENDCOLOR]; 특징: [COLOR_CYAN]호수[ENDCOLOR]; 도시 인근에 [COLOR_CYAN][ICON_RES_WINE]와인을 놓을 곳[ENDCOLOR] 필요[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_LAVAUX_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Wartburg
INSERT INTO Language_en_US 
			(Tag,										Text)
VALUES		('TXT_KEY_BUILDING_WARTBURG',				'Wartburg'),
			('TXT_KEY_WONDER_WARTBURG_QUOTE',			'[NEWLINE]"In nature we never see anything isolated, but everything in connection with something else which is before it, beside it, under it and over it."[NEWLINE] - Johann Wolfgang von Goethe[NEWLINE]'),
			('TXT_KEY_WONDER_WARTBURG_PEDIA',			'Wartburg Castle was built in 1067 by Ludwig der Springer to secure his traditional territories. From 1172 to 1211, it was an important princely court in the Holy Roman Empire and a support for poets, thus becoming the setting of the legendary Sangerkrieg. Following his excommunication, Martin Luther stayed at Wartburg when he translated the New Testament from ancient Greek into German.[NEWLINE]For centuries, Wartburg has been a place of pilgrimage for its significance in German and Christian history. In the modern day, Wartburg remains a popular tourist attraction. It often stages the opera Tannhauser. While the castle still contains original structures from the 12th through 15th centuries, much of the interior dates back only to the 19th century, transformed under communist rule in the time of the GDR.'),
			('TXT_KEY_THEMING_BONUS_WARTBURG',			'Literature that inspired whole nations'),
			('TXT_KEY_THEMING_BONUS_WARTBURG_HELP',		'To maximize your bonus, make sure all the Great Work Slots are all filled with literature created by you.'),
			('TXT_KEY_WONDER_WARTBURG_HELP',			'+30% generation of [ICON_GREAT_WRITER] Great Writers in this City. Has 3 slots for [ICON_GREAT_WORK] Great Works of Literature. +3 [ICON_CULTURE] Culture and +3 [ICON_PEACE] Faith and 3 [ICON_GOLDEN_AGE] Golden Age Points if [COLOR_POSITIVE_TEXT]Themed[ENDCOLOR]. 5 XP per each [ICON_GREAT_WORK] Great Work in this wonder for Land units trained in this City. All Writer''s Guilds in the Empire receive +1 [ICON_PEACE] Faith.');
			
UPDATE Language_en_US
SET Text = 'With [COLOR_YIELD_FOOD]Wartburg[ENDCOLOR] you will become king of literature (+2[ICON_GREAT_WRITER]; +30%[ICON_GREAT_WRITER]), which can be stored on your new shelves (+3[ICON_GREAT_WORK] if themed: [ICON_CULTURE], [ICON_PEACE], [ICON_GOLDEN_AGE]). Increase your faith output by constructing [COLOR_YIELD_FOOD]Writer''s Guilds[ENDCOLOR] (+1[ICON_PEACE][ICON_PEACE]) in your empire and raise up experience of your units using your city collection (+5 XP/[ICON_GREAT_WORK] inside/[COLOR_YIELD_GOLD]Land[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_WARTBURG_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_WARTBURG_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_WARTBURG_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Progress Finisher[ENDCOLOR]; Feature: [COLOR_CYAN]Forest[ENDCOLOR]; Building: [COLOR_CYAN]Writer''s Guild[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_WARTBURG_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Progress Finisher[ENDCOLOR]; Building: [COLOR_CYAN]Writer''s Guild[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_WARTBURG_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

INSERT INTO Language_ko_KR 
			(Tag,										Text)
VALUES		('TXT_KEY_BUILDING_WARTBURG',				'바르트부르크 성'),
			('TXT_KEY_WONDER_WARTBURG_QUOTE',			'[NEWLINE]"자연에서 우리는 고립된 것을 결코 볼 수 없지만, 모든 것은 그 이전에, 그 옆에, 그 아래에, 그리고 그 위에 있는 다른 것과 관련이 있다."[NEWLINE] - 요한 볼프강 폰 괴테[NEWLINE]'),
			('TXT_KEY_WONDER_WARTBURG_PEDIA',			'바르트부르크 성은 1067년 루트비히 데르 스프링거에 의해 그의 전통적인 영토를 확보하기 위해 지어졌습니다. 1172년부터 1211년까지, 그것은 신성 로마 제국의 중요한 왕자의 궁전이었고 시인들에 대한 지지였고, 따라서 전설적인 생제르크리그의 배경이 되었습니다. 파문 이후, 마르틴 루터는 신약성경을 고대 그리스어에서 독일어로 번역할 때 바르트부르크에 머물렀습니다.[NEWLINE]수세기 동안, 바르트부르크는 독일과 기독교 역사에서 그것의 중요성 때문에 순례의 장소였습니다. 오늘날, 바르트부르크는 인기 있는 관광 명소로 남아 있는데 종종 오페라 탄하우저를 상연합니다. 이 성은 여전히 12세기에서 15세기 사이의 독창적인 구조물들을 포함하고 있지만, 내부의 많은 부분은 19세기로 거슬러 올라가며, 동독 시대에 공산주의 통치 하에서 변형되었습니다.'),
			('TXT_KEY_THEMING_BONUS_WARTBURG',			'전 국민에게 영감을 준 문학'),
			('TXT_KEY_THEMING_BONUS_WARTBURG_HELP',		'보너스를 최대화하려면 걸작 슬롯을 모두 자신이 만든 걸작 문학으로 채워야 합니다.'),
			('TXT_KEY_WONDER_WARTBURG_HELP',			'이 도시에서 [ICON_GREAT_WRITER]위대한 작가 생성률이 +30% 증가합니다. [ICON_GREAT_WORK]문학 걸작 슬롯 3개를 제공합니다. 이 불가사의에 채워진 [ICON_GREAT_WORK]걸작 하나당 이 도시에서 훈련된 지상 유닛은 경험치 5를 받습니다. 제국의 모든 작가 길드는 [ICON_PEACE]신앙 +1을 제공합니다.[NEWLINE][NEWLINE]테마보너스: [ICON_CULTURE]문화 [ICON_PEACE]신앙 +3 [ICON_GOLDEN_AGE]황금기점수 +3');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]Wartburg[ENDCOLOR]로 문학의 제왕이 되어(+2[ICON_GREAT_WRITER]; +30%[ICON_GREAT_WRITER]) 새로운 서가에 보관할 수 있습니다(테마가 [ICON_CULTURE]인 경우 +3[ICON_GREAT_WORK], [ICON_PEACE], [ICON_GOLDEN_AGE]). 제국에 [COLOR_YIELD_FOOD]작가 길드[ENDCOLOR](+1[ICON_PEACE][ICON_PEACE])을 건설하여 신앙 산출량을 늘리고 도시 컬렉션을 사용하여 유닛의 경험치를 높이십시오(+5 XP/[ICON_GREAT_WORK])/[COLOR_YIELD_GOLD]지상 전투 유닛[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_WARTBURG_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_WARTBURG_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_WARTBURG_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]진보 완성[ENDCOLOR]; 특징: [COLOR_CYAN]숲[ENDCOLOR]; 건물: [COLOR_CYAN]작가 길드[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_WARTBURG_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]진보 완성[ENDCOLOR]; 건물: [COLOR_CYAN]작가 길드[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_WARTBURG_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Great Zimbabwe
INSERT INTO Language_en_US 
			(Tag,										Text) 
VALUES		('TXT_KEY_BUILDING_GREAT_ZIMBABWE',			'Great Zimbabwe'),
			('TXT_KEY_WONDER_GREAT_ZIMBABWE_QUOTE',		'[NEWLINE]"God is good, but never dance with a lion."[NEWLINE] - Zimbabwean proverb[NEWLINE]'),
			('TXT_KEY_WONDER_GREAT_ZIMBABWE_PEDIA',		'TODO'),
			('TXT_KEY_WONDER_GREAT_ZIMBABWE_HELP',		'Gain 1 [COLOR_POSITIVE_TEXT]Additional[ENDCOLOR] [ICON_INTERNATIONAL_TRADE] Trade Route slot. [ICON_GOLD] Gold cost of aquiring new tiles reduced by 30% in all Cities. +2 [ICON_GOLDEN_AGE] Golden Age Points in this City and 3 XP to units constructed in all cities for each active [ICON_INTERNATIONAL_TRADE] Trade Route.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Great Zimbabwe[ENDCOLOR] makes use from your expanded trade network (+1[ICON_INTERNATIONAL_TRADE]), which supports your empire''s yields (+2[ICON_GOLDEN_AGE]/[ICON_INTERNATIONAL_TRADE][ICON_INTERNATIONAL_TRADE]) and army construction (+5% [ICON_PRODUCTION]/[COLOR_YIELD_GOLD]Land[ENDCOLOR]/[ICON_INTERNATIONAL_TRADE][ICON_INTERNATIONAL_TRADE]). Make sure to use your treasury to expand your Cities more than your neighbours (-30%[ICON_GOLD][ICON_GOLD] Plot Cost).'
WHERE Tag = 'TXT_KEY_WONDER_GREAT_ZIMBABWE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_GREAT_ZIMBABWE_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_GREAT_ZIMBABWE_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Authority Finisher[ENDCOLOR]; Terrain: [COLOR_NEGATIVE_TEXT]Coast[ENDCOLOR]; Improvement: [COLOR_CYAN]3 (Mines + Camps)[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GREAT_ZIMBABWE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Authority Finisher[ENDCOLOR]; Terrain: [COLOR_NEGATIVE_TEXT]Coast[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GREAT_ZIMBABWE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

INSERT INTO Language_ko_KR 
			(Tag,										Text) 
VALUES		('TXT_KEY_BUILDING_GREAT_ZIMBABWE',			'그레이트 짐바브웨'),
			('TXT_KEY_WONDER_GREAT_ZIMBABWE_QUOTE',		'[NEWLINE]"신은 좋으나 사자와 춤을 추지는 말라."[NEWLINE] - 짐바브웨 속담[NEWLINE]'),
			('TXT_KEY_WONDER_GREAT_ZIMBABWE_PEDIA',		'TODO'),
			('TXT_KEY_WONDER_GREAT_ZIMBABWE_HELP',		'추가 [ICON_INTERNATIONAL_TRADE][COLOR_POSITIVE_TEXT]교역로[ENDCOLOR] 슬롯 1개를 얻습니다. 모든 도시에서 새 타일 획득의 [ICON_GOLD]골드 비용이 30% 감소합니다. 활성화된 각 [ICON_INTERNATIONAL_TRADE]교역로마다 이 도시에서 [ICON_GOLDEN_AGE]황금기점수 +2를 제공하고 모든 도시에서 생산된 지상 전투 유닛에서 경험치 +3을 제공합니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]그레이트 짐바브웨[ENDCOLOR]는 제국의 수확량(+2[ICON_GOLDEN_AGE]/[ICON_INTERNATIONAL_TRADE][ICON_INTERNATIONAL_TRADE])과 군대 훈련을 지원(+5% [ICON_PRODUCTION]/[COLOR_YIELD_GOLD]지상 전투 유닛[ENDCOLOR]/[ICON_INTERNATIONAL_TRADE][ICON_INTERNATIONAL_TRADE])하는 확장된 무역 네트워크(+1[ICON_INTERNATIONAL_TRADE])를 활용합니다. 금고를 사용하여 이웃보다 더 많은 도시를 확장(-30%[ICON_GOLD][ICON_GOLD] 타일 구매)하십시오.'
WHERE Tag = 'TXT_KEY_WONDER_GREAT_ZIMBABWE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_GREAT_ZIMBABWE_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_GREAT_ZIMBABWE_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]권위 완성[ENDCOLOR]; 지형: [COLOR_NEGATIVE_TEXT]해안을 피할 것[ENDCOLOR]; 시설: [COLOR_CYAN](광산+야영지) 3개[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GREAT_ZIMBABWE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]권위 완성[ENDCOLOR]; 지형: [COLOR_NEGATIVE_TEXT]해안을 피할 것[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GREAT_ZIMBABWE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Ahu Tongariki
INSERT INTO Language_en_US 
			(Tag,								Text) 
VALUES		('TXT_KEY_BUILDING_AHU',			'Ahu Tongariki'),
			('TXT_KEY_WONDER_AHU_QUOTE',		'[NEWLINE]"The metaphor is so obvious. Easter Island isolated in the Pacific Ocean - once the island got into trouble, there was no way they could get free. There was no other people from whom they could get help. In the same way that we on planet Earth, if we ruin our own world, we won''t be able to get help."[NEWLINE] - Jared Diamond[NEWLINE]'),
			('TXT_KEY_WONDER_AHU_PEDIA',		'TODO'),
			('TXT_KEY_WONDER_AHU_HELP',			'+10% [ICON_PEACE] in your Empire. +1 [ICON_PRODUCTION] Production from Forest or Jungle, +1 [ICON_CULTURE] Culture from Quarries and +1 [ICON_PEACE] Faith from Coast tiles worked by this City. +20% [ICON_WORKER] Improvement Construction Rate. Grants 1 copy of unique luxury resource: Tern Egg.');
			
UPDATE Language_en_US
SET Text = 'Monumental platform, [COLOR_YIELD_FOOD]Ahu Tongariki[ENDCOLOR], boosts your production significantly, if you have [COLOR_CITY_GREEN]Forests[ENDCOLOR] or [COLOR_CITY_GREEN]Jungles[ENDCOLOR] (+1[ICON_PRODUCTION]/[ICON_MUSHROOM]) nearby or hire new workers (+20%[ICON_WORKER]). Cultural influence of all [COLOR_CITY_BROWN]Quarries[ENDCOLOR] (+1[ICON_CULTURE]/[ICON_WORKER][ICON_WORKER]) on your citizens, supported by new [COLOR_GREY]Unique Luxury[ENDCOLOR] resource (+1 flat [ICON_RES_TERN]; +10%[ICON_PEACE][ICON_PEACE]) will send you in much brighter future.'
WHERE Tag = 'TXT_KEY_WONDER_AHU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_AHU_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_AHU_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Feature: [COLOR_CYAN]Forest/Jungle[ENDCOLOR]; Improved Resource: [ICON_RES_STONE] [COLOR_CYAN]Stone[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_AHU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_AHU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
VALUES		('TXT_KEY_BUILDING_AHU',			'아후 통가리키'),
			('TXT_KEY_WONDER_AHU_QUOTE',		'[NEWLINE]"그 비유는 너무나 명백하다. 태평양에 고립된 이스터 섬 - 일단 이 섬이 문제를 일으키면, 그들이 자유로워질 수 있는 방법이 없었다. 그들이 도움을 받을 수 있는 다른 사람들은 없었다. 우리가 지구에 있는 것과 같은 방식으로, 만약 우리가 우리 자신의 세계를 망친다면, 우리는 도움을 받을 수 없을 것이다."[NEWLINE] - 재러드 다이아몬드[NEWLINE]'),
			('TXT_KEY_WONDER_AHU_PEDIA',		'TODO'),
			('TXT_KEY_WONDER_AHU_HELP',			'제국의 [ICON_PEACE]신앙 산출량이 +10% 증가하며 제국의 모든 채석장에서 [ICON_CULTURE] 문화 +1을 제공합니다. 이 도시의 숲이나 정글에서 [ICON_PRODUCTION] 생산 +1, 해안 타일에서 [ICON_PEACE] 신앙 +1을 제공합니다. 노동자의 [ICON_WORKER]시설 건설 속도가 +20% 증가합니다. 고유한 고급 자원인 [ICON_RES_TERN]제비갈매기 알 1개를 제공합니다.');
			
UPDATE Language_ko_KR
SET Text = '주변에 [COLOR_CITY_GREEN]숲[ENDCOLOR] 또는 [COLOR_CITY_GREEN]정글[ENDCOLOR](+1[ICON_PRODUCTION]/[ICON_MUSHROOM])이 있거나 노동자를(+20%[ICON_WORKER])새로 고용하는 경우 기념비적인 플랫폼인 [COLOR_YIELD_FOOD]아후 통가리키[ENDCOLOR]를 사용하면 생산량이 크게 증가합니다. 모든 [COLOR_CITY_BROWN]채석장[ENDCOLOR]의 문화적 영향(+1[ICON_CULTURE]/[ICON_WORKER][ICON_WORKER])과 새로운 [COLOR_GREY]독특한 사치품[ENDCOLOR] 자원(+1[ICON_RES_TERN]; +1 10%[ICON_PEACE][ICON_PEACE])이 훨씬 더 밝은 미래로 여러분을 안내할 것입니다.'
WHERE Tag = 'TXT_KEY_WONDER_AHU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_AHU_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_AHU_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 특징: [COLOR_CYAN]숲/정글[ENDCOLOR]; 개발된 자원: [ICON_RES_STONE][COLOR_CYAN]석재[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_AHU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_AHU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Falun Mine
INSERT INTO Language_en_US 
			(Tag,								Text) 
VALUES		('TXT_KEY_BUILDING_FALUN',			'Falun Mine'),
			('TXT_KEY_WONDER_FALUN_QUOTE',		'[NEWLINE]"Mining is like a search-and-destroy mission."[NEWLINE] - Stewart Udall[NEWLINE]'),
			('TXT_KEY_WONDER_FALUN_PEDIA',		'Operating in Falun, Sweden from the tenth century to 1992, Falun Mine produced as much as two thirds of Europe''s copper needs and helped fund many of Sweden''s wars in the 17th century. The operation of the mine granted Sweden a virtual monopoly on copper through the 17th century, funding the various wars of Sweden during its great power era, though the output of the mine was a pittance by modern standards. In 1992, commercial mining ceased as the mine was no longer economically viable. In 2001, Falun Mine was selected as a UNESCO World Heritage site.'),
			('TXT_KEY_WONDER_FALUN_HELP',		'Wonder places 2 new [ICON_RES_COPPER] Copper resources inside City range if possible. +1 [ICON_GOLD] Gold from Mines worked by this City. Receive 1 [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] [ICON_GREAT_GENERAL] Great General and +100 [ICON_GREAT_ENGINEER] Great Engineers Progress on construction during Medieval or Renaissance Era.[NEWLINE][NEWLINE]Nearby [ICON_RES_COPPER] Copper: +1 [ICON_GOLD] and +1 [ICON_GOLDEN_AGE] Golden Age Point.');
			
UPDATE Language_en_US
SET Text = 'Mining complex at [COLOR_YIELD_FOOD]Falun[ENDCOLOR] makes all difficult investments possible. Huge support of engineers (2%[ICON_GREAT_ENGINEER]/Construction) or militarists ([COLOR_YIELD_GOLD]free [ICON_GREAT_GENERAL][ENDCOLOR]), new [COLOR_GREY]Copper[ENDCOLOR] deposits (+2[ICON_RES_COPPER]; +1[ICON_GOLD], +1[ICON_GOLDEN_AGE]/[ICON_RES_COPPER]) and more valuable local [COLOR_CITY_BROWN]Mines[ENDCOLOR] (+1[ICON_GOLD]/[ICON_WORKER]) can easily buy you leadership of the world.'
WHERE Tag = 'TXT_KEY_WONDER_FALUN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_FALUN_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_FALUN_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Progress Finisher[ENDCOLOR]; Improvement: [COLOR_CYAN]4 Mines[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_FALUN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Progress Finisher[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_FALUN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
VALUES		('TXT_KEY_BUILDING_FALUN',			'파룬 광산'),
			('TXT_KEY_WONDER_FALUN_QUOTE',		'[NEWLINE]"채굴은 수색과 파괴의 임무와 같다."[NEWLINE] - 스튜어트 유돌[NEWLINE]'),
			('TXT_KEY_WONDER_FALUN_PEDIA',		'10세기부터 1992년까지 스웨덴의 파룬 운영된 파룬 광산은 유럽의 구리 수요의 3분의 2를 생산했고 17세기 스웨덴의 많은 전쟁에 자금을 지원했다. 이 광산의 운영은 17세기에 걸쳐 스웨덴에게 구리에 대한 사실상의 독점권을 주었고, 현대 기준으로 볼 때 광산의 생산량은 미미했지만, 거대한 권력 시대 동안 스웨덴의 다양한 전쟁에 자금을 지원했다. 1992년에 상업적 채굴은 더 이상 경제적으로 불가능하게 되면서 중단되었다. 2001년, 파룬 광산은 유네스코 세계문화유산으로 선정되었다.'),
			('TXT_KEY_WONDER_FALUN_HELP',		'가능한 경우 도시 범위 내에 새로운 [ICON_RES_COPPER]구리 자원 2개를 배치합니다. 이 도시의 광산이 [ICON_GOLD]골드 +1를 제공합니다. 무료[ICON_GREAT_GENERAL][COLOR_POSITIVE_TEXT]위대한 장군[ENDCOLOR]을 제공합니다. 건물을 건설할 때[ICON_GREAT_ENGINEER]위대한 기술자 점수 +2%만큼 제공합니다. 이 도시의 구리가 [ICON_GOLD]골드 +1 [ICON_GOLDEN_AGE]황금기점수 +1을 제공합니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]파룬[ENDCOLOR]의 광산 단지는 모든 어려운 투자를 가능하게 합니다. 기술자(2%[ICON_GREAT_ENGINEER]/건설)나 군국주의자([COLOR_YIELD_GOLD]무료 [ICON_GREAT_GENERAL][ENDCOLOR])의 막대한 지원, 새로운 [COLOR_GREY]구리[ENDCOLOR] 매장지(+2[ICON_RES_COPPER]; +1[ICON_GOLD], +1[ICON_GOLDEN_AGE]/[ICON_RES_COPPER]) 및 더 가치 있어진 지역의 [COLOR_CITY_BROWN]광산[ENDCOLOR](+1[ICON_GOLD]/[ICON_WORKER])을 통해 쉽게 세계의 리더십을 살 수 있습니다.'
WHERE Tag = 'TXT_KEY_WONDER_FALUN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_FALUN_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_FALUN_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]진보 완성[ENDCOLOR]; 시설: [COLOR_CYAN]광산 4개[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_FALUN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]진보 완성[ENDCOLOR]; 위치: [COLOR_CYAN]언덕[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_FALUN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Forge of Damascus
INSERT INTO Language_en_US 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_DAMASCUS',			'Forge of Damascus'),
			('TXT_KEY_WONDER_DAMASCUS_QUOTE',		'[NEWLINE]"The reputation and history of Damascus steel has given rise to many legends, such as the ability to cut through a rifle barrel or to cut a hair falling across the blade. The manufacturing technique has yet to be reverse engineered, even in modern times."[NEWLINE] - from legends about Damascus Steel[NEWLINE]'),
			('TXT_KEY_WONDER_DAMASCUS_PEDIA',		'Damascus steel was a type of steel used for manufacturing sword blades in the Near East made with wootz steel. These swords are characterized by distinctive patterns of banding and mottling reminiscent of flowing water. Such blades were reputed to be tough, resistant to shattering and capable of being honed to a sharp, resilient edge.[NEWLINE][NEWLINE]  The reputation and history of Damascus steel has given rise to many legends, such as the ability to cut through a rifle barrel or to cut a hair falling across the blade. Although many types of modern steel outperform ancient Damascus alloys, chemical reactions in the production process made the blades extraordinary for their time, as Damascus steel was superplastic and very hard at the same time. [COLOR_NEGATIVE_TEXT]Lost after unit upgrade[ENDCOLOR].'),
			('TXT_KEY_PROMOTION_DAMASCUS',			'Damascus Steel'),
			('TXT_KEY_PROMOTION_DAMASCUS_HELP',		'+10%[ICON_STRENGTH]CS.'),
			('TXT_KEY_WONDER_DAMASCUS_HELP',		'+3 [ICON_PRODUCTION] Production with [COLOR_CYAN]Metallurgy[ENDCOLOR]. Provides a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Forge in the City in which it is built. All Melee and Mounted Units in the Empire get [COLOR_POSITIVE_TEXT]Damascus Steel[ENDCOLOR] promotion.[NEWLINE][NEWLINE]All [ICON_RES_IRON] Iron: +1 [ICON_PRODUCTION] Production and +1 [ICON_RESEARCH] Science.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Forge of Damascus[ENDCOLOR], thanks to recent scientific discovery, turns your melee weaponry into masterpiece ([COLOR_WATER_TEXT]Damascus Steel[ENDCOLOR]/[COLOR_YIELD_GOLD]Melee Land[ENDCOLOR]), which cannot be copied in any other forge. Your production and science literally explodes (+2[ICON_GREAT_SCIENTIST]), so remember to claim all available [COLOR_GREY]Iron[ENDCOLOR] deposits (+1[ICON_PRODUCTION], +1[ICON_RESEARCH]/[ICON_RES_IRON][ICON_RES_IRON]).'
WHERE Tag = 'TXT_KEY_WONDER_DAMASCUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_DAMASCUS_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_DAMASCUS_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Authority Finisher[ENDCOLOR]; Feature: [COLOR_CYAN]Fresh Water[ENDCOLOR]; Improved Resource: [ICON_RES_IRON] [COLOR_CYAN]Iron[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_DAMASCUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Authority Finisher[ENDCOLOR]; Improved Resource: [ICON_RES_IRON] [COLOR_CYAN]Iron[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_DAMASCUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	

INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_DAMASCUS',			'다마스쿠스 대장간'),
			('TXT_KEY_WONDER_DAMASCUS_QUOTE',		'[NEWLINE]"다마스쿠스 강철의 명성과 역사는 소총 통을 자르는 능력이나 칼날에 떨어지는 머리카락을 자르는 능력과 같은 많은 전설을 낳았다. 그 제조 기술은 현대에도 아직 역설계되지 않았다."[NEWLINE] - 다마스쿠스 강철에 대한 전설로부터[NEWLINE]'),
			('TXT_KEY_WONDER_DAMASCUS_PEDIA',		'다마스쿠스 강철은 인도제 강철로 만든 근동에서 검날을 만드는 데 사용된 강철의 한 종류였습니다. 이 칼들은 흐르는 물을 연상시키는 띠 모양과 얼룩무늬가 특징입니다. 이러한 칼날은 단단하고, 부서지지 않으며, 날카롭고 탄력적인 가장자리에 연마할 수 있는 것으로 정평이 나 있었습니다.[NEWLINE][NEWLINE] 다마스쿠스 강철의 명성과 역사는 소총 통을 자르는 능력이나 칼날에 떨어지는 머리카락을 자르는 능력과 같은 많은 전설을 낳았습니다. 비록 많은 종류의 현대 강철이 고대 다마스쿠스 합금보다 성능이 뛰어나지만, 생산 과정에서의 화학 반응은 다마스쿠스 강철이 초가소성이면서 동시에 매우 단단했기 때문에 그들 시대에 칼날을 특별하게 만들었습니다.[COLOR_NEGATIVE_TEXT]유닛 업그레이드 후 손실되었습니다[ENDCOLOR].'),
			('TXT_KEY_PROMOTION_DAMASCUS',			'다마스쿠스 강철'),
			('TXT_KEY_PROMOTION_DAMASCUS_HELP',		'[ICON_STRENGTH]공격력 +10%'),
			('TXT_KEY_WONDER_DAMASCUS_HELP',		'[COLOR_CYAN]금속학[ENDCOLOR] 연구시 [ICON_PRODUCTION]생산 +3을 제공합니다. 도시에 무료 [COLOR_POSITIVE_TEXT]대장간[ENDCOLOR]을 제공합니다. 제국의 모든 근접 및 기마 유닛은 [COLOR_POSITIVE_TEXT]다마스쿠스 강철[ENDCOLOR] 승급을 얻습니다. 제국의 모든 [ICON_RES_IRON]철이 [ICON_PRODUCTION]생산 +1 [ICON_RESEARCH]과학 +1을 제공합니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]다마스쿠스 대장간[ENDCOLOR]은 최근 과학적 발견 덕분에 근접 무기를 다른 대장간에서 복사할 수 없는 걸작으로 바꿔줍니다([COLOR_WATER_TEXT]다마스쿠스 강철[ENDCOLOR]/[COLOR_YIELD_GOLD]근접 유닛/기마 유닛[ENDCOLOR]).당신의 생산과 과학은 말 그대로 폭발적입니다(+2[ICON_GREAT_SCIENTIST]). 그러니 사용 가능한 모든 [COLOR_GREY]철[ENDCOLOR] 매장지(+1[ICON_PRODUCTION], +1[ICON_RESEARCH]/[ICON_RES_IRON][ICON_RES_IRON])를 확보하는 것을 잊지 마십시오.'
WHERE Tag = 'TXT_KEY_WONDER_DAMASCUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_DAMASCUS_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_DAMASCUS_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]권위 완성[ENDCOLOR]; 특징: [COLOR_CYAN]담수[ENDCOLOR]; 개발된 자원: [ICON_RES_IRON][COLOR_CYAN]철[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_DAMASCUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]권위 완성[ENDCOLOR]; 개발된 자원: [ICON_RES_IRON][COLOR_CYAN]철[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_DAMASCUS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Golden Dagon Pagoda
INSERT INTO Language_en_US 
			(Tag,											Text)
VALUES		('TXT_KEY_BUILDING_SHWEDAGON',					'Golden Dagon Pagoda'),
			('TXT_KEY_WONDER_SHWEDAGON_QUOTE',				'[NEWLINE]"There was a tumult among men and spirits, the blind beheld objects, the deaf heard sounds. The earth quaked, lightning flashed, gems rained down until they were knee deep, and all trees of the Himalayas, though not in season, bore blossoms and fruit."[NEWLINE] - King Okkalapa[NEWLINE]'),
			('TXT_KEY_WONDER_SHWEDAGON_PEDIA',				'Shwedagon Paya (also known as Shwedagon Pagoda or the Great Dragon Pagoda) is a large Buddhist stupa located in the Burmese city of Rangoon. It is 99 metres tall in it''s current state, and is coated with gold donated by the Burmese populus to maintain the Stupa. It is not known when the gold was put in place, although the stupa itself is said to date back over 2,500 years. Each sucessive dynasty has built upon the Stupa, until it reached the current height of 99 metres during reconstruction following an earthquake in 1768. Shwedagon Paya also features a crown of 5,448 diamonds and 2317 Rubies.'),
			('TXT_KEY_THEMING_BONUS_SHWEDAGON_KALPA',		'Relics of the four previous Buddhas of the present kalpa'),
			('TXT_KEY_THEMING_BONUS_SHWEDAGON_CONSECUTIVE',	'Relics from most recent eras'),
			('TXT_KEY_THEMING_BONUS_SHWEDAGON_PLAYERS',		'Relics from different creators'),
			('TXT_KEY_THEMING_BONUS_SHWEDAGON_ARTIFACTS',	'Bunch of Relics'),
			('TXT_KEY_THEMING_BONUS_SHWEDAGON_HELP',		'To maximize your bonus, make sure all the Great Work Slots are all filled with Artifacts created by different Players in consecutive Eras.'),
			('TXT_KEY_PROMOTION_HIDDEN_ARTIFACTS',			'Diplomatic Passport'),
			('TXT_KEY_PROMOTION_HIDDEN_ARTIFACTS_HELP',		'+20% [ICON_WORKER] Work Rate. Unit [COLOR:255:230:85:255]can Enter (cannot Dig on) Enemy Territory without Open Borders Agreement[ENDCOLOR].'),
			('TXT_KEY_WONDER_SHWEDAGON_HELP',				'All Archaeologist Units in the Empire get [COLOR_POSITIVE_TEXT]Diplomatic Passport[ENDCOLOR] promotion. +2 [ICON_PEACE] Faith from Artists. All [ICON_GREAT_WORK] Great Works in the Empire receive +1 [ICON_GOLD] Gold. Has 4 slots for [ICON_GREAT_WORK] Great Works of Art. +3 [ICON_GOLD] Gold, [ICON_CULTURE] Culture, [ICON_PEACE] Faith and [ICON_TOURISM] Tourism if [COLOR_POSITIVE_TEXT]Themed[ENDCOLOR].');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Golden Pagoda[ENDCOLOR] fully focuses on every aspect related to artistry. Religious and more frequent artists in this city (+2[ICON_GREAT_ARTIST]; +2[ICON_PEACE]/[ICON_GREAT_ARTIST][ICON_GREAT_ARTIST]), more valuable great works of your empire (+1[ICON_GOLD]/[ICON_GREAT_WORK][ICON_GREAT_WORK]) and much more space for new art (+4[ICON_GREAT_WORK] if themed: [ICON_GOLD], [ICON_CULTURE], [ICON_PEACE], [ICON_TOURISM]) will make your city shine! Make sure to use your new forces to find hidden artifacts ([COLOR_WATER_TEXT]Diplomatic Passport[ENDCOLOR]/[COLOR_YIELD_GOLD]Archaeologist[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_SHWEDAGON_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_SHWEDAGON_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_SHWEDAGON_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Tradition Finisher[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR]; Feature: [COLOR_CYAN]Fresh Water[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SHWEDAGON_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Tradition Finisher[ENDCOLOR]; Feature: [COLOR_CYAN]Fresh Water[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SHWEDAGON_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	

INSERT INTO Language_ko_KR 
			(Tag,											Text)
VALUES		('TXT_KEY_BUILDING_SHWEDAGON',					'슈웨다곤 파고다'),
			('TXT_KEY_WONDER_SHWEDAGON_QUOTE',				'[NEWLINE]"사람들과 영혼들 사이에 소란이 있었고, 눈먼 사람들은 물건을 보았고, 귀머거리들은 소리를 들었다. 땅이 흔들리고 번개가 치고, 보석이 무릎까지 비처럼 내렸고, 히말라야의 모든 나무들은 제철은 아니지만 꽃과 열매를 맺었다."[NEWLINE] - 옥칼라파 왕[NEWLINE]'),
			('TXT_KEY_WONDER_SHWEDAGON_PEDIA',				'슈웨다곤 파야 또는 슈웨다곤 파고다는 미얀마 양곤에 위치한 큰 불교 탑입니다. 현재 상태로 높이가 99미터이고, 사리탑을 유지하기 위해 버마 사람들이 기부한 금으로 덮여 있습니다. 사리탑 자체는 2,500년 이상 된 것으로 알려져 있지만 황금이 언제 제자리에 놓였는지는 알 수 없습니다. 각각의 연속적인 왕조는 사리탑을 기반으로 1768년 지진 후 재건하는 동안 현재의 높이인 99m에 도달할 때까지 지었습니다. 슈웨다곤 파야는 또한 5,448개의 다이아몬드와 2317개의 루비로 된 왕관을 특징으로 합니다.'),
			('TXT_KEY_THEMING_BONUS_SHWEDAGON_KALPA',		'현재의 칼파 이전의 4대 불상의 유물'),
			('TXT_KEY_THEMING_BONUS_SHWEDAGON_CONSECUTIVE',	'가장 최근 시대의 유물'),
			('TXT_KEY_THEMING_BONUS_SHWEDAGON_PLAYERS',		'다른 창작자의 유물'),
			('TXT_KEY_THEMING_BONUS_SHWEDAGON_ARTIFACTS',	'유물군'),
			('TXT_KEY_THEMING_BONUS_SHWEDAGON_HELP',		'보너스를 최대화하려면 걸작 슬롯을 모두 다른 문명의 연속된 시대의 유물로 채워야 합니다.'),
			('TXT_KEY_PROMOTION_HIDDEN_ARTIFACTS',			'외교 여권'),
			('TXT_KEY_PROMOTION_HIDDEN_ARTIFACTS_HELP',		'[ICON_WORKER]작업속도 +20%[NEWLINE]국경 개방 조약 없이 다른 문명의 영토에 들어갈 수 있습니다.[COLOR:255:230:85:255](발굴은 불가능)[ENDCOLOR].'),
			('TXT_KEY_WONDER_SHWEDAGON_HELP',				'제국의 모든 고고학자 유닛은 [COLOR_POSITIVE_TEXT]외교 여권[ENDCOLOR] 승급을 받습니다. 제국의 모든 예술가 전문가가 [ICON_PEACE]신앙 +2를 제공합니다. 제국의 모든 [ICON_GREAT_WORK]걸작이 [ICON_GOLD]골드 +1를 제공합니다. [ICON_GREAT_WORK] 걸작 슬롯 4개를 제공합니다.[NEWLINE][NEWLINE]테마보너스: [ICON_GOLD]골드 +3 [ICON_CULTURE]문화 +3 [ICON_PEACE]신앙 +3 [ICON_TOURISM]관광 +3');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]슈웨다곤 파고다[ENDCOLOR]는 예술성과 관련된 모든 측면에 전적으로 초점을 맞춥니다. 이 도시의 종교적이고 빈번한 예술가(+2[ICON_GREAT_ARTIST]; +2[ICON_PEACE]/[ICON_GREAT_ARTIST][ICON_GREAT_ARTIST]), 제국의 더 가치 있는 걸작(+1[ICON_GOLD]/[ICON_GREAT_WORK][ICON_GREAT_WORK]) 그리고 새로운 예술을 위한 훨씬 더 많은 공간(+4[ICON_GREAT_WORK] 테마보너스: [ICON_GOLD], [ICON_CULTURE], [ICON_PEACE], [ICON_TOURISM])이 당신의 도시를 빛나게 할 것입니다! 새로운 힘을 사용하여 숨겨진 유물([COLOR_WATER_TEXT]외교 여권[ENDCOLOR]/[COLOR_YIELD_GOLD]고고학자[ENDCOLOR])을 찾으십시오.'
WHERE Tag = 'TXT_KEY_WONDER_SHWEDAGON_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_SHWEDAGON_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_SHWEDAGON_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]전통 완성[ENDCOLOR]; 위치: [COLOR_CYAN]언덕[ENDCOLOR]; 특징: [COLOR_CYAN]담수[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SHWEDAGON_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]전통 완성[ENDCOLOR]; 특징: [COLOR_CYAN]담수[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SHWEDAGON_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Mont St. Michel
INSERT INTO Language_en_US 
			(Tag,								Text) 
VALUES		('TXT_KEY_BUILDING_MICHEL',			'Mont Saint-Michel'),
			('TXT_KEY_WONDER_MICHEL_QUOTE',		'[NEWLINE]"Church and State, Soul and Body, God and Man, are all one at Mont Saint Michel, and the business of all is to fight, each in his own way, or to stand guard for each other."[NEWLINE] - Henry Adams[NEWLINE]'),
			('TXT_KEY_WONDER_MICHEL_PEDIA',		'Perched on a rocky islet in the midst of vast sandbanks exposed to powerful tides between Normandy and Brittany stand the "Wonder of the West", a Gothic-style Benedictine abbey dedicated to the archangel St Michael, and the village that grew up in the shadow of its great walls. Built between the 11th and 16th centuries, the abbey is a technical and artistic tour de force, having had to adapt to the problems posed by this unique natural site.'),
			('TXT_KEY_WONDER_MICHEL_HELP',		'Provides a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Monastery in the City in which it is built. Greatly increase [ICON_STRENGTH] Combat Strength and Hit Points of this City. +3 [ICON_GOLD] Gold and +3 [ICON_TOURISM] Tourism with [COLOR_CYAN]Electricity[ENDCOLOR].');
			
UPDATE Language_en_US
SET Text = 'Lonely [COLOR_YIELD_FOOD]Mont Saint-Michel[ENDCOLOR] will turn your vulnerable [COLOR_YIELD_FOOD]Monastery[ENDCOLOR] ([ICON_FOOD]; [ICON_RESEARCH]; [ICON_PEACE]) into a fortress (+10[ICON_STRENGTH]; +100 HP), where you can focus on your soul (+2[ICON_PEACE]/5 [ICON_CITIZEN]) and plan next expenses for your growing treasury.'
WHERE Tag = 'TXT_KEY_WONDER_MICHEL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_MICHEL_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_MICHEL_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Single-tile Island[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MICHEL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Single-tile Island[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MICHEL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
VALUES		('TXT_KEY_BUILDING_MICHEL',			'몽생미셸'),
			('TXT_KEY_WONDER_MICHEL_QUOTE',		'[NEWLINE]"교회와 국가, 영혼과 육체, 하나님과 인간은 모두 몽생미셸에 있고, 모든 것의 사업은 각자의 방식으로 싸우거나 서로를 지키는 것이다."[NEWLINE] - 헨리 애덤스[NEWLINE]'),
			('TXT_KEY_WONDER_MICHEL_PEDIA',		'노르망디와 브르타뉴 사이의 강력한 조수에 노출된 거대한 모래톱 한가운데에 있는 바위섬에는 대천사 성 미카엘에게 바쳐진 고딕 양식의 베네딕도회 수도원인 "서쪽의 경이로움"과 그 거대한 벽의 그늘에서 자란 마을이 서 있습니다. 11세기와 16세기 사이에 지어진 몸생미셀 수도원은 이 독특한 자연 유적지에 의해 제기된 문제들에 적응해야만 했던 기술적이고 예술적인 관광 부대입니다.'),
			('TXT_KEY_WONDER_MICHEL_HELP',		'건설된 도시에 무료 [COLOR_POSITIVE_TEXT]수도원[ENDCOLOR]을 제공합니다. 이 도시의 [ICON_STRENGTH]전투력과 체력를 크게 증가시킵니다. [COLOR_CYAN]전기[ENDCOLOR] 연구시 [ICON_GOLD]골드 +3 [ICON_TOURISM]관광 +3을 제공합니다. 이 도시의 [ICON_CITIZEN]시민 5명마다 [ICON_PEACE]신앙을 +2 제공합니다.');
			
UPDATE Language_ko_KR
SET Text = '외로운 [COLOR_YIELD_FOOD]몽생미셸[ENDCOLOR]은 취약한 [COLOR_YIELD_FOOD]수도원[ENDCOLOR]([ICON_FOOD]; [ICON_RESEARCH]; [ICON_PEACE])을 요새(+10[ICON_STRENGTH]; +100 HP)로 바꿀 것입니다. 영혼에 집중하고(+2[ICON_PEACE]/5[ICON_CITIZEN]) 성장하는 재무를 위한 다음 경비를 계획할 수 있습니다.'
WHERE Tag = 'TXT_KEY_WONDER_MICHEL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_MICHEL_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_MICHEL_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]단일 타일 섬[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MICHEL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]단일 타일 섬[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MICHEL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);		
----------------------------------------------------
-- Itsukushima Shrine
INSERT INTO Language_en_US 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_ITSUKUSHIMA',		'Itsukushima Shrine'),
			('TXT_KEY_WONDER_ITSUKUSHIMA_QUOTE',	'[NEWLINE]"Faith is not the clinging to a shrine but an endless pilgrimage of the heart."[NEWLINE] - Abraham Joshua Heschel[NEWLINE]'),
			('TXT_KEY_WONDER_ITSUKUSHIMA_PEDIA',	'Itsukushima shrine is one of the most iconic Shinto shrines in Japan. It is world renowned for it''s iconic "Floating" torii gate, which pilgrims had to steer their boat through before they could enter the shrine''s grounds. It is located on the island of Itsukushima, at the western end of Japan''s "inland sea". There has been a shrine at the location since approximately 628 CE, when one was constructed under the reign of Empresss Suiko. The current design, however, dates from 1168, when the shrine was constructed with funds provided by the warlord Taiya no Kiyomori.[NEWLINE][NEWLINE]  The shrine, and it''s floating Torii, are one of the "Three Views of Japan", along with the sandbar at Amanohashidate, and Matsushima bay. These have been designated as the most beautiful scenes of Japan, and are frequented by tourists.'),
			('TXT_KEY_WONDER_ITSUKUSHIMA_HELP',		'+1 [ICON_FOOD] Food, +1 [ICON_CULTURE] Culture and +1 [ICON_PEACE] Faith to Atolls and [ICON_CULTURE] Culture cost of aquiring new tiles reduced by 50% in coastal Cities. +1 [ICON_PEACE] Faith from Sea tiles. All Fishing Boats in the Empire receive +1 [ICON_CULTURE] Culture.[NEWLINE][NEWLINE]Nearby [ICON_RES_CORAL] Coral: +2 [ICON_PEACE] Faith.[NEWLINE]Nearby [ICON_RES_CRAB] Crab: +2 [ICON_PEACE] Faith.[NEWLINE]Nearby [ICON_RES_PEARLS] Pearls: +2 [ICON_PEACE] Faith.[NEWLINE]Nearby [ICON_RES_WHALE] Whales: +2 [ICON_PEACE] Faith.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Itsukushima Shrine[ENDCOLOR] boost yields generated by nearby [COLOR_CITY_BLUE]Oceans[ENDCOLOR] (+1[ICON_PEACE]/[ICON_FLOWER]), [COLOR_GREY]Sea Luxuries[ENDCOLOR] (+2[ICON_PEACE]/[COLOR_GREY]Sea Luxury[ENDCOLOR]) and [COLOR_CITY_BROWN]Fishing Boats[ENDCOLOR] (+1[ICON_CULTURE]/[ICON_WORKER]) as well as all [COLOR_CITY_GREEN]Atolls[ENDCOLOR] (+1[ICON_FOOD], +1[ICON_CULTURE], +1[ICON_PEACE]/[ICON_MUSHROOM][ICON_MUSHROOM]). Additionally expansion of your coastal cities is now much easier (+50%[ICON_CULTURE][ICON_CULTURE] Border Growth/all coastal Cities).'
WHERE Tag = 'TXT_KEY_WONDER_ITSUKUSHIMA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_ITSUKUSHIMA_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_ITSUKUSHIMA_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Improved Resource: [ICON_RES_CORAL] [COLOR_CYAN]Coral[ENDCOLOR]/[ICON_RES_CRAB] [COLOR_CYAN]Crab[ENDCOLOR]/[ICON_RES_PEARLS] [COLOR_CYAN]Pearls[ENDCOLOR]/[ICON_RES_WHALE] [COLOR_CYAN]Whales[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ITSUKUSHIMA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ITSUKUSHIMA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	

INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_ITSUKUSHIMA',		'이쓰쿠시마 신사'),
			('TXT_KEY_WONDER_ITSUKUSHIMA_QUOTE',	'[NEWLINE]"믿음은 사당에 매달리는 것이 아니라 마음의 끝없는 순례이다."[NEWLINE] - 아브라함 J. 헤셸[NEWLINE]'),
			('TXT_KEY_WONDER_ITSUKUSHIMA_PEDIA',	'이쓰쿠시마 신사는 일본에서 가장 상징적인 신사 중 하나입니다. 이곳은 순례자들이 성지에 들어가기 전에 배를 조종해서 통과해야 했던 상징적인 "떠다니는" 토리이 문으로 세계적으로 유명합니다. 그것은 일본의 "내해"의 서쪽 끝에 있는 이쓰쿠시마 섬에 위치해 있습니다. 628년경 스이코 황후의 치세에 신사가 건립된 이래로 이곳에 신사가 있었습니다. 그러나 현재의 디자인은 군벌 다이야노 기요모리가 자금을 지원하여 신사가 건립된 1168년부터 시작되었습니다.[NEWLINE][NEWLINE] 이 신사와 떠 있는 토리이는 아마노하시다테의 모래톱, 마쓰시마 만과 함께 "일본 3경" 중 하나입니다. 이곳은 일본의 가장 아름다운 풍경으로 지정되어 관광객들이 자주 찾는 곳입니다.'),
			('TXT_KEY_WONDER_ITSUKUSHIMA_HELP',		'해안도시에서 타일을 확보하기 위한 [ICON_CULTURE]문화적 비용이 -50% 감소하고 산호초에서 [ICON_FOOD]식량 +1 [ICON_CULTURE]문화 +1 [ICON_PEACE]신앙 +1을 제공합니다. 이 도시의 대양 타일에서 [ICON_PEACE]신앙 +1을 제공합니다. 제국의 모든 어선이 [ICON_CULTURE]문화 +1을 제공합니다. 이 도시의 [ICON_RES_CORAL]산호, [ICON_RES_CRAB]게, [ICON_RES_PEARLS]진주, [ICON_RES_WHALE]고래에서 [ICON_PEACE]신앙을 +2 제공합니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]이쓰쿠시마 신사[ENDCOLOR] 주변의 [COLOR_CITY_BLUE]해양[ENDCOLOR](+1[ICON_PEACE]/[ICON_FLOWER]), [COLOR_GREY]해양 사치품[ENDCOLOR](+2[ICON_PEACE]/[COLOR_GREY]해양 사치 자원[ENDCOLOR]), [COLOR_CITY_BROWN]어선[ENDCOLOR](+1[ICON_CULTURE]/[ICON_WORKER]) 및 모든 [COLOR_CITY_GREEN]산호섬[ENDCOLOR](+1[ICON_FOOD], +1[ICON_CULTURE], +1[ICON_PEACE]/[ICON_MUSHROOM][ICON_MUSHROOM])에서 생성되는 수확량을 늘립니다. 또한 해안 도시 확장(+50%[ICON_CULTURE][ICON_CULTURE] 국경 확장/모든 해안 도시)이 훨씬 쉬워졌습니다.'
WHERE Tag = 'TXT_KEY_WONDER_ITSUKUSHIMA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_ITSUKUSHIMA_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_ITSUKUSHIMA_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 개발된 자원: [ICON_RES_CORAL][COLOR_CYAN]산호[ENDCOLOR]/[ICON_RES_CRAB][COLOR_CYAN]게[ENDCOLOR]/[ICON_RES_PEARLS][COLOR_CYAN]진주[ENDCOLOR]/[ICON_RES_WHALE][COLOR_CYAN]고래[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ITSUKUSHIMA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ITSUKUSHIMA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Qalhat
INSERT INTO Language_en_US 
			(Tag,								Text) 
VALUES		('TXT_KEY_BUILDING_QALHAT',			'Qalhat'),
			('TXT_KEY_WONDER_QALHAT_QUOTE',		'[NEWLINE]"The haven is very large and good, and is frequented by numerous ships with goods from India, and from this city the spices and other merchandize are distributed among the cities and towns of the interior. They also export many good Arab horses from this to India."[NEWLINE] - Marco Polo[NEWLINE]'),
			('TXT_KEY_WONDER_QALHAT_PEDIA',		'TODO'),
			('TXT_KEY_WONDER_QALHAT_HELP',		'Gain 1 [COLOR_POSITIVE_TEXT]Additional[ENDCOLOR] [ICON_INTERNATIONAL_TRADE] Trade Route slot. Sea [ICON_INTERNATIONAL_TRADE] Trade Routes gain +1 [ICON_GOLD] Gold. +50% [ICON_PRODUCTION] Production of Cargo Ships. +3 [ICON_CULTURE] Culture for each [ICON_INTERNATIONAL_TRADE] Sea Trade Route from or to other major Player.[NEWLINE][NEWLINE]Nearby [ICON_RES_HORSE] Horses: +2 [ICON_GOLD].');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Qalhat[ENDCOLOR], mentioned by some europeans sailors seeking unique supplies (+1[ICON_GOLD]/[ICON_RES_HORSE]; +50%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]Cargo Ship[ENDCOLOR]), is a wonderful place, where merchants of all seas meet and exchange their goods (Sea [ICON_INTERNATIONAL_TRADE]: +1[ICON_GOLD]). Learn foreign culture by monopolizing worldwide sea trade (3[ICON_CULTURE]/Sea [ICON_INTERNATIONAL_TRADE][ICON_INTERNATIONAL_TRADE] with Major).'
WHERE Tag = 'TXT_KEY_WONDER_QALHAT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_QALHAT_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_QALHAT_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Improved Resource: [ICON_RES_HORSE] [COLOR_CYAN]Horses[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_QALHAT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Improved Resource: [ICON_RES_HORSE] [COLOR_CYAN]Horses[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_QALHAT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
VALUES		('TXT_KEY_BUILDING_QALHAT',			'칼하트'),
			('TXT_KEY_WONDER_QALHAT_QUOTE',		'[NEWLINE]"이 안식처는 매우 크고 좋으며, 인도에서 온 물건을 실은 수많은 배들이 자주 드나들고 있으며, 이 도시에서 온 향신료와 다른 상품들은 내륙의 도시들과 마을들에 분배된다. 그들은 또한 이곳에서 인도로 많은 좋은 아랍 말들을 수출한다."[NEWLINE] - 마르코 폴로[NEWLINE]'),
			('TXT_KEY_WONDER_QALHAT_PEDIA',		'TODO'),
			('TXT_KEY_WONDER_QALHAT_HELP',		'추가 [ICON_INTERNATIONAL_TRADE][COLOR_POSITIVE_TEXT]교역로[ENDCOLOR] 슬롯 1개를 제공합니다. 해상 [ICON_INTERNATIONAL_TRADE]교역로가 [ICON_GOLD]골드를 +1 제공합니다.  화물선을 생산할때 [ICON_PRODUCTION]생산 +50%을 제공합니다. 다른 주요 문명과 각각의 해상 [ICON_INTERNATIONAL_TRADE]교역로가 주고받는 각각의 문명에게 [ICON_CULTURE]문화 +3를 제공합니다. 이 도시의 [ICON_RES_HORSE]말이 [ICON_GOLD]골드 +2를 제공합니다.');
			
UPDATE Language_ko_KR
SET Text = '고유한 보급품(+1[ICON_GOLD]/[ICON_RES_HORSE]; +50%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]화물선[ENDCOLOR])을 찾는 일부 유럽 선원들이 언급한 [COLOR_YIELD_FOOD]칼하트[ENDCOLOR]는 멋진 곳입니다. 모든 바다의 상인들이 만나 상품을 교환합니다(해상 [ICON_INTERNATIONAL_TRADE]: +1[ICON_GOLD]). 전 세계 해상 무역을 독점하여 외국 문화를 배우십시오(3[ICON_CULTURE]/주요문명과의 해상[ICON_INTERNATIONAL_TRADE][ICON_INTERNATIONAL_TRADE] ).'
WHERE Tag = 'TXT_KEY_WONDER_QALHAT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_QALHAT_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_QALHAT_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 개발된 자원: [ICON_RES_HORSE][COLOR_CYAN]말[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_QALHAT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 개발된 자원: [ICON_RES_HORSE][COLOR_CYAN]말[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_QALHAT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Krak des Chevaliers
INSERT INTO Language_en_US 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_CHEVALIERS',			'Krak des Chevaliers'),
			('TXT_KEY_WONDER_CHEVALIERS_QUOTE',		'[NEWLINE]"I have long since been aware that your king is a man of the greatest honor and bravery, but he is imprudent."[NEWLINE] - Saladin to Richard I the Lionheart[NEWLINE]'),
			('TXT_KEY_WONDER_CHEVALIERS_PEDIA',		'Krak des Chevaliers, also Crac des Chevaliers, is a Crusader castle in Syria and one of the most important preserved medieval castles in the world. The site was first inhabited in the 11th century by a settlement of Kurds; as a result it was known as Hisn al Akrad, meaning the "Castle of the Kurds". In 1142 it was given by Raymond II, Count of Tripoli, to the Knights Hospitaller. It remained in their possession until it fell in 1271. It became known as Crac de l''Ospital; the name Krak des Chevaliers was coined in the 19th century.'),
			('TXT_KEY_WONDER_CHEVALIERS_HELP',		'Greatly increase [ICON_STRENGTH] Combat Strength and +20% [ICON_PRODUCTION] Production of Mounted and Siege Units in this City. +1 [ICON_SILVER_FIST] Military Unit Supply Cap. All other [COLOR_POSITIVE_TEXT]non-coastal[ENDCOLOR] Cities receive +1 [ICON_PEACE] Faith, +5 [ICON_STRENGTH] City Defense and +1 [ICON_SILVER_FIST] Military Unit Supply Cap.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Krak des Chevaliers[ENDCOLOR], castle on top of a hill, a perfect place to defend against your enemies (20[ICON_STRENGTH]) and plan next offensive. Increased production of your troops (+20%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]Mounted[ENDCOLOR], [COLOR_YIELD_GOLD]Siege[ENDCOLOR]), awesome leadership ([COLOR_YIELD_GOLD]free [ICON_GREAT_GENERAL][ENDCOLOR]), and improved management of your all other non-coastal cities (+1[ICON_PEACE], +5[ICON_STRENGTH], +1[ICON_SILVER_FIST]/non-coastal Cities) are just a beginning of your glory.'
WHERE Tag = 'TXT_KEY_WONDER_CHEVALIERS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_CHEVALIERS_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_CHEVALIERS_HELP';
				
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Hill[ENDCOLOR]; Feature: [COLOR_NEGATIVE_TEXT]Water[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CHEVALIERS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_NEGATIVE_TEXT]Coast[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CHEVALIERS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	

INSERT INTO Language_ko_KR 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_CHEVALIERS',			'크락 데 슈발리에'),
			('TXT_KEY_WONDER_CHEVALIERS_QUOTE',		'[NEWLINE]"나는 당신의 왕이 최고의 명예와 용맹을 가진 사람이라는 것을 오래 전부터 알고 있었지만, 그는 경솔했습니다."[NEWLINE] - 리처드 1세에게 살라딘이[NEWLINE]'),
			('TXT_KEY_WONDER_CHEVALIERS_PEDIA',		'크락 데 슈발리에는 시리아의 십자군 성이자 세계에서 가장 중요한 보존된 중세 성 중 하나입니다. 이 지역은 11세기에 쿠르드족 정착민이 처음 거주했습니다. 그 결과 그것은 "쿠르드족의 성"을 의미하는 히스나 알 아크라드로 알려졌습니다. 1142년 트리폴리 백작 레이몬드 2세가 병원 기사단에게 하사했습니다. 크락 데 슈발리에는 1271년에 함락될 때까지 병원 기사들의 소유로 남아 있었는데. 그때는 크라크 데 로피탈이라는 이름으로 알려졌습니다. 크락 데 슈발리에라는 이름은 19세기에 만들어졌습니다.'),
			('TXT_KEY_WONDER_CHEVALIERS_HELP',		'이 도시의 [ICON_STRENGTH]전투력을 크게 증가시키고 이 도시에서 기마 유닛과 공성 유닛의 [ICON_PRODUCTION]생산력을 20% 증가시킵니다. 무료 [ICON_GREAT_GENERAL]위대한 장군을 제공하며 [ICON_SILVER_FIST] 군사 유닛 공급 상한선이 +1 증가합니다. 다른 모든 [COLOR_POSITIVE_TEXT]비해안[ENDCOLOR] 도시들에게 [ICON_PEACE]신앙 +1 [ICON_STRENGTH]도시 전투력 +5 [ICON_SILVER_FIST]군사 유닛 보급 상한선 +1을 제공합니다.');
			
UPDATE Language_ko_KR
SET Text = '언덕 위의 성인 [COLOR_YIELD_FOOD]크락 데 슈발리에[ENDCOLOR]는 적으로부터 방어하고(20[ICON_STRENGTH]) 다음 공격을 계획하기에 완벽한 장소입니다. 병력 생산 증가(+20%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]기병[ENDCOLOR], [COLOR_YIELD_GOLD]공성[ENDCOLOR]), 멋진 리더십([COLOR_YIELD_GOLD]무료 [ICON_GREAT_GENERAL][ENDCOLOR]), 향상된 관리 다른 모든 비해안 도시(+1[ICON_PEACE], +5[ICON_STRENGTH], +1[ICON_SILVER_FIST]/비해안 도시)는 영광의 시작일 뿐입니다.'
WHERE Tag = 'TXT_KEY_WONDER_CHEVALIERS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_CHEVALIERS_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_CHEVALIERS_HELP';
				
UPDATE Language_ko_KR SET Text = '위치: [COLOR_CYAN]언덕[ENDCOLOR]; 특징: [COLOR_NEGATIVE_TEXT]물을 피할 것[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CHEVALIERS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_ko_KR SET Text = '지형: [COLOR_NEGATIVE_TEXT]해안을 피할 것[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CHEVALIERS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);		
----------------------------------------------------
-- University of Sankore
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]University of Sankore[ENDCOLOR] successfully combines science and faith together. Nearby [COLOR_YIELD_FOOD]Mosque[ENDCOLOR] ([ICON_RESEARCH]; [ICON_PEACE]; [ICON_GREAT_WORK]; [ICON_CULTURE]; [ICON_GOLDEN_AGE]; [ICON_HAPPINESS_3]) will attract noble great people, who use their influence to boost your most important research projects (50[ICON_RESEARCH]/[ICON_GREAT_PEOPLE]).'
WHERE Tag = 'TXT_KEY_WONDER_MOSQUE_OF_DJENNE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'Requires completion of [COLOR_MAGENTA]Tradition[ENDCOLOR] Branch. ', '') WHERE Tag ='TXT_KEY_WONDER_MOSQUE_OF_DJENNE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_en_US 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_MOSQUE_OF_DJENNE_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_MOSQUE_OF_DJENNE_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Tradition Finisher[ENDCOLOR]; Terrain: [COLOR_CYAN]Desert[ENDCOLOR]; Building: [COLOR_CYAN]Library[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MOSQUE_OF_DJENNE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Tradition Finisher[ENDCOLOR]; Terrain: [COLOR_CYAN]Desert[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MOSQUE_OF_DJENNE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]상코레 대학[ENDCOLOR]은 성공적으로 과학과 신앙을 결합합니다. 근처의 [COLOR_YIELD_FOOD]모스크[ENDCOLOR]([ICON_RESEARCH]; [ICON_PEACE]; [ICON_GREAT_WORK]; [ICON_CULTURE]; [ICON_GOLDEN_AGE]; [ICON_HAPPINESS_3])가 귀하의 가장 중요한 연구 프로젝트에 영향력을 행사하는 고귀한 위인들의 관심을 끌 것입니다. (50[ICON_RESEARCH]/[ICON_GREAT_PEOPLE]).'
WHERE Tag = 'TXT_KEY_WONDER_MOSQUE_OF_DJENNE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, '[COLOR_MAGENTA]전통[ENDCOLOR] 정책을 완성해야 건설할 수 있습니다. ', '') WHERE Tag ='TXT_KEY_WONDER_MOSQUE_OF_DJENNE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_ko_KR 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_MOSQUE_OF_DJENNE_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_MOSQUE_OF_DJENNE_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]전통 완성[ENDCOLOR]; 지형: [COLOR_CYAN]사막[ENDCOLOR]; 건물: [COLOR_CYAN]도서관[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MOSQUE_OF_DJENNE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]전통 완성[ENDCOLOR]; 지형: [COLOR_CYAN]사막[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MOSQUE_OF_DJENNE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Hagia Sophia
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Hagia Sophia[ENDCOLOR] profits from its rich history and fully reorganizes your religion. New prophet ([COLOR_YIELD_GOLD]Free [ICON_PROPHET][ENDCOLOR]), recently constructed [COLOR_YIELD_FOOD]Church[ENDCOLOR] ([ICON_PEACE]; [ICON_MISSIONARY]; [ICON_CULTURE]; [ICON_HAPPINESS_3]; [ICON_GREAT_WORK]) and increased pressure on dissenters (+25%[ICON_MISSIONARY] Strength) will force your will among other nations.'
WHERE Tag = 'TXT_KEY_WONDER_HAGIA_SOPHIA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,									Text) 
SELECT		'TXT_KEY_WONDER_HAGIA_SOPHIA_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_HAGIA_SOPHIA_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_YIELD_PRODUCTION]Holy City[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HAGIA_SOPHIA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_YIELD_PRODUCTION]Holy City[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HAGIA_SOPHIA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]아야 소피아[ENDCOLOR]는 풍부한 역사를 통해 이익을 얻고 종교를 완전히 재구성합니다. 새로운 예언자([COLOR_YIELD_GOLD]무료 [ICON_PROPHET][ENDCOLOR]), 최근 [COLOR_YIELD_FOOD]교회[ENDCOLOR]([ICON_PEACE]; [ICON_MISSIONARY]; [ICON_CULTURE]; [ICON_HAPPINESS_3]; [ICON_GREAT_WORK])를 건설했으며 반대자들에 대한 압력 증가 (+25%[ICON_MISSIONARY] 압력)은 다른 국가들 사이에서 당신의 의지를 강요할 것입니다.'
WHERE Tag = 'TXT_KEY_WONDER_HAGIA_SOPHIA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,									Text) 
SELECT		'TXT_KEY_WONDER_HAGIA_SOPHIA_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_HAGIA_SOPHIA_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_YIELD_PRODUCTION]성도[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HAGIA_SOPHIA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_YIELD_PRODUCTION]성도[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HAGIA_SOPHIA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Borobudur
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Borobudur[ENDCOLOR] is a gigantic [COLOR_YIELD_FOOD]Stupa[ENDCOLOR] ([ICON_PEACE]; [ICON_MISSIONARY]; [ICON_RESEARCH]; [ICON_GOLDEN_AGE]; [ICON_TOURISM]; [ICON_HAPPINESS_3]), which focuses on small actions, that can flow other cities with your faith (+5[ICON_PEACE]). Use existing and produce new more powerful [COLOR_YIELD_GOLD]Missionaries[ENDCOLOR] (+1[ICON_MISSIONARY] Spread) to quickly convert your enemies.'
WHERE Tag = 'TXT_KEY_WONDER_BOROBUDUR_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'Must be built in a Holy City. ', '') WHERE Tag ='TXT_KEY_WONDER_BOROBUDUR_HELP';
	
INSERT INTO Language_en_US 
			(Tag,									Text) 
SELECT		'TXT_KEY_WONDER_BOROBUDUR_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_BOROBUDUR_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_YIELD_PRODUCTION]Holy City[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BOROBUDUR_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_YIELD_PRODUCTION]Holy City[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BOROBUDUR_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]보로부두르 사원[ENDCOLOR]는 거대한 [COLOR_YIELD_FOOD]사리탑[ENDCOLOR]([ICON_PEACE]; [ICON_MISSIONARY]; [ICON_RESEARCH]; [ICON_GOLDEN_AGE]; [ICON_TOURISM]; [ICON_HAPPINESS_3])틀 통해, 당신의 믿음으로 다른 도시를 흐르게 할 수 있습니다(+5[ICON_PEACE]). 더 강력한 새로운 [COLOR_YIELD_GOLD]선교사[ENDCOLOR](+1[ICON_MISSIONARY] 전파)를 생성하여 이교도들을 빠르게 전환하십시오.'
WHERE Tag = 'TXT_KEY_WONDER_BOROBUDUR_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, '[COLOR_YELLOW]성도[ENDCOLOR]에만 건설할 수 있습니다. ', '') WHERE Tag ='TXT_KEY_WONDER_BOROBUDUR_HELP';
	
INSERT INTO Language_ko_KR 
			(Tag,									Text) 
SELECT		'TXT_KEY_WONDER_BOROBUDUR_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_BOROBUDUR_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_YIELD_PRODUCTION]성도[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BOROBUDUR_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_YIELD_PRODUCTION]성도[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BOROBUDUR_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Alhambra
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Alhambra[ENDCOLOR] is an architectural mix of two totally different cultures (+10%[ICON_CULTURE]) formed into unique [COLOR_YIELD_FOOD]Castle[ENDCOLOR] ([ICON_STRENGTH]; [ICON_SILVER_FIST]; [ICON_PRODUCTION]; [ICON_HAPPINESS_3]; [ICON_GREAT_WORK]), where special mounted melee units will be trained to support your expansion ([COLOR_WATER_TEXT]Jinete[ENDCOLOR]/[COLOR_YIELD_GOLD]Mounted[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_ALHAMBRA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'Requires completion of [COLOR_MAGENTA]Authority[ENDCOLOR] Branch. ', '') WHERE Tag ='TXT_KEY_WONDER_ALHAMBRA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_ALHAMBRA_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_ALHAMBRA_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Authority Finisher[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR]; Feature: [COLOR_CYAN]Forest[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ALHAMBRA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Authority Finisher[ENDCOLOR]; Feature: [COLOR_CYAN]Forest[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ALHAMBRA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]알함브라[ENDCOLOR]는 완전히 다른 두 문화(+10%[ICON_CULTURE])가 혼합된 건축 양식으로 독특한 [COLOR_YIELD_FOOD]성[ENDCOLOR]([ICON_STRENGTH]; [ICON_SILVER_FIST]; [ICON_PRODUCTION]; [ICON_HAPPINESS_3]; [ICON_GREAT_WORK])이 형성되어 있습니다. 이곳에서 특수 기마 근접 유닛이 훈련([COLOR_WATER_TEXT]히네테[ENDCOLOR]/[COLOR_YIELD_GOLD]기마[ENDCOLOR])되어 확장을 지원할 수 있습니다.'
WHERE Tag = 'TXT_KEY_WONDER_ALHAMBRA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, '[COLOR_MAGENTA]권위[ENDCOLOR] 정책을 완성해야 건설할 수 있습니다. ', '') WHERE Tag ='TXT_KEY_WONDER_ALHAMBRA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_ALHAMBRA_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_ALHAMBRA_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]권위 완성[ENDCOLOR]; 위치: [COLOR_CYAN]언덕[ENDCOLOR]; 특징: [COLOR_CYAN]숲[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ALHAMBRA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]권위 완성[ENDCOLOR]; 특징: [COLOR_CYAN]숲[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ALHAMBRA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Machu Picchu
UPDATE Language_en_US
SET Text = 'If your city is surrounded by [COLOR_CITY_BLUE]Mountains[ENDCOLOR] (+1[ICON_FOOD], +1[ICON_PRODUCTION], +1[ICON_CULTURE], +1[ICON_PEACE]/[ICON_FLOWER] to City), then [COLOR_YIELD_FOOD]Machu Picchu[ENDCOLOR] is a perfect choice. All your city connections in this difficult terrain are more profitble (+15%[ICON_GOLD]/[ICON_CONNECTED][ICON_CONNECTED]) and your treasury is supported by qualified specialists (+1[ICON_GREAT_MERCHANT]).'
WHERE Tag = 'TXT_KEY_WONDER_MACHU_PICHU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'City must be built within 2 tiles of a Mountain that is inside your territory. ', '') WHERE Tag ='TXT_KEY_WONDER_MACHU_PICHU_HELP';
	
INSERT INTO Language_en_US 
			(Tag,									Text) 
SELECT		'TXT_KEY_WONDER_MACHU_PICHU_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_MACHU_PICHU_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]2 Mountains[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MACHU_PICHU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Mountain[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MACHU_PICHU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR
SET Text = '도시가 [COLOR_CITY_BLUE]산[ENDCOLOR]으로 둘러싸여 있는 경우(+1[ICON_FOOD], +1[ICON_PRODUCTION], +1[ICON_CULTURE], +1[ICON_PEACE]/도시로 [ICON_FLOWER]) [COLOR_YIELD_FOOD]마추픽추[ENDCOLOR]는 완벽한 선택입니다. 이 어려운 지형에 있는 모든 도시 연결은 더 많은 수익을 내고(+15%[ICON_GOLD]/[ICON_CONNECTED][ICON_CONNECTED]) 자격을 갖춘 전문가가 자금을 지원합니다(+1[ICON_GREAT_MERCHANT]).'
WHERE Tag = 'TXT_KEY_WONDER_MACHU_PICHU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, '도시 주변 [COLOR_YELLOW]2타일 이내에 산[ENDCOLOR]이 있어야 건설할 수 있습니다. ', '') WHERE Tag ='TXT_KEY_WONDER_MACHU_PICHU_HELP';
	
INSERT INTO Language_ko_KR 
			(Tag,									Text) 
SELECT		'TXT_KEY_WONDER_MACHU_PICHU_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_MACHU_PICHU_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]산 2개[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MACHU_PICHU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]산[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MACHU_PICHU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Forbidden Palace
UPDATE Language_en_US
SET Text = 'Rich [COLOR_YIELD_FOOD]Forbidden Palace[ENDCOLOR] will help you get out of crisis (-1[ICON_HAPPINESS_3] Poverty). Huge investments in empire developement (-15%[ICON_GOLD][ICON_GOLD] Purchase Cost) and brand new merchant district (+2[ICON_GREAT_MERCHANT]) will introduce you into new era.'
WHERE Tag = 'TXT_KEY_WONDER_FORBIDDEN_PALACE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'Requires completion of [COLOR_MAGENTA]Progress[ENDCOLOR] Branch. ', '') WHERE Tag ='TXT_KEY_WONDER_FORBIDDEN_PALACE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_en_US 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_FORBIDDEN_PALACE_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_FORBIDDEN_PALACE_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Progress Finishier[ENDCOLOR]; [COLOR_YIELD_GOLD]Capital[ENDCOLOR]; Building: [COLOR_CYAN]Walls[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_FORBIDDEN_PALACE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Progress Finishier[ENDCOLOR]; [COLOR_YIELD_GOLD]Capital[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_FORBIDDEN_PALACE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR
SET Text = '부유한 [COLOR_YIELD_FOOD]자금성[ENDCOLOR]이 위기(-1[ICON_HAPPINESS_3] 빈곤)에서 벗어나도록 도와줄 것입니다. 제국 개발(-15%[ICON_GOLD][ICON_GOLD] 구매 비용)과 새로운 상업 지구(+2[ICON_GREAT_MERCHANT])에 대한 막대한 투자가 여러분을 새로운 시대로 안내할 것입니다.'
WHERE Tag = 'TXT_KEY_WONDER_FORBIDDEN_PALACE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, '[COLOR_MAGENTA]진보[ENDCOLOR] 정책을 완성해야 건설할 수 있습니다. ', '') WHERE Tag ='TXT_KEY_WONDER_FORBIDDEN_PALACE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_ko_KR 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_FORBIDDEN_PALACE_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_FORBIDDEN_PALACE_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]진보 완성[ENDCOLOR]; [COLOR_YIELD_GOLD]수도[ENDCOLOR]; 건물: [COLOR_CYAN]성벽[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_FORBIDDEN_PALACE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]진보 완성[ENDCOLOR]; [COLOR_YIELD_GOLD]수도[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_FORBIDDEN_PALACE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Rila Monastery (former Karlstejn)
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Rila Monastery[ENDCOLOR] takes care of all [COLOR_YIELD_FOOD]Orders[ENDCOLOR] ([ICON_PEACE]; [ICON_MISSIONARY]; [ICON_STRENGTH]; [ICON_SILVER_FIST]; [ICON_HAPPINESS_3]), has high base yields (+3[ICON_CULTURE]; +4[ICON_PEACE]) and lowers requirement for reformation (-5%[ICON_RELIGION] Followers). Use it to gain new abilities just before your enemies do the same!'
WHERE Tag = 'TXT_KEY_BUILDING_KARLSTEJN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'Must be built in a Holy City. ', '') WHERE Tag ='TXT_KEY_BUILDING_KARLSTEJN_HELP';
	
INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_BUILDING_KARLSTEJN_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_BUILDING_KARLSTEJN_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_YIELD_PRODUCTION]Holy City[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_KARLSTEJN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_YIELD_PRODUCTION]Holy City[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_KARLSTEJN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_en_US SET Text = 'Rila Monastery' WHERE Tag ='TXT_KEY_BUILDING_KARLSTEJN';
UPDATE Language_en_US SET Text = '[NEWLINE]"If you find that you have no love but desire to have it, do the works of love and the Lord will see your desire and effort and put love in your heart."[NEWLINE] - St. Ambrose of Optina[NEWLINE]' WHERE Tag ='TXT_KEY_WONDER_KARLSTEJN_QUOTE';
UPDATE Language_en_US SET Text = 'TODO'||Text WHERE Tag ='TXT_KEY_CIV5_BUILDINGS_KARLSTEJN_TEXT';

UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]릴라 수도원[ENDCOLOR]은 모든 [COLOR_YIELD_FOOD]기사단[ENDCOLOR]([ICON_PEACE]; [ICON_MISSIONARY]; [ICON_STRENGTH]; [ICON_SILVER_FIST]; [ICON_HAPPINESS_3])을 관리하며 높은 기본 수익률(+3[ICON_CULTURE ]; +4[ICON_PEACE]) 및 개혁 요구 사항을 낮춥니다(-5%[ICON_RELIGION] 개혁 교리). 여러분의 적들이 같은 일을 하기 직전에 새로운 능력을 얻기 위해 이 능력들을 사용하세요!'
WHERE Tag = 'TXT_KEY_BUILDING_KARLSTEJN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, '[COLOR_YELLOW]성도[ENDCOLOR]에만 건설할 수 있습니다. ', '') WHERE Tag ='TXT_KEY_BUILDING_KARLSTEJN_HELP';
	
INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_BUILDING_KARLSTEJN_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_KARLSTEJN_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_YIELD_PRODUCTION]성도[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_KARLSTEJN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_YIELD_PRODUCTION]성도[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_KARLSTEJN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR SET Text = '릴라 수도원' WHERE Tag ='TXT_KEY_BUILDING_KARLSTEJN';
UPDATE Language_ko_KR SET Text = '[NEWLINE]"사랑이 없는 것을 발견하면 사랑의 일을 행하라 그러면 주님은 당신의 욕망과 노력을 보시고 사랑을 마음에 담으리라."[NEWLINE] - 옵티나의 성 암브로스[NEWLINE]' WHERE Tag ='TXT_KEY_WONDER_KARLSTEJN_QUOTE';
UPDATE Language_ko_KR SET Text = 'TODO' WHERE Tag ='TXT_KEY_CIV5_BUILDINGS_KARLSTEJN_TEXT';
----------------------------------------------------
-- Notre Dame
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Notre Dame[ENDCOLOR], wonderful [COLOR_YIELD_FOOD]Cathedral[ENDCOLOR] ([ICON_GOLD]; [ICON_PEACE]; [ICON_MISSIONARY]; [ICON_HAPPINESS_3]), creates history and starts new era in your empire (Start [ICON_GOLDEN_AGE]). Many impressing artwork (+2[ICON_GREAT_WORK] if themed: [ICON_PEACE], [ICON_GOLDEN_AGE]) collected behind its walls will make your citizens much happier (+1[ICON_HAPPINESS_1]).'
WHERE Tag = 'TXT_KEY_BUILDING_NOTRE_DAME_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,									Text) 
SELECT		'TXT_KEY_BUILDING_NOTRE_DAME_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_BUILDING_NOTRE_DAME_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Tradition Finisher[ENDCOLOR]; Plot: [COLOR_CYAN]Flat[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_NOTRE_DAME_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Tradition Finisher[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_NOTRE_DAME_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]노트르담[ENDCOLOR], 멋진 [COLOR_YIELD_FOOD]대성당[ENDCOLOR]([ICON_GOLD]; [ICON_PEACE]; [ICON_MISSIONARY]; [ICON_HAPPINESS_3])이 역사를 창조하고 제국의 새 시대를 시작([ICON_GOLDEN_AGE] 시작)합니다. 벽 뒤에 수집된 많은 인상적인 예술 작품(+2[ICON_GREAT_WORK] 테마보너스: [ICON_PEACE], [ICON_GOLDEN_AGE])은 시민들을 훨씬 더 행복하게 만들 것입니다.'
WHERE Tag = 'TXT_KEY_BUILDING_NOTRE_DAME_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,									Text) 
SELECT		'TXT_KEY_BUILDING_NOTRE_DAME_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_NOTRE_DAME_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]전통 완성[ENDCOLOR]; 위치: [COLOR_CYAN]평지[ENDCOLOR]; 특징: [COLOR_CYAN]강[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_NOTRE_DAME_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]전통 완성[ENDCOLOR]; 특징: [COLOR_CYAN]강[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_NOTRE_DAME_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
----------------------------------------------------
-- Ait Benhaddou
INSERT INTO Language_en_US 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_BENHADDOU',			'Ait Benhaddou'),
			('TXT_KEY_WONDER_BENHADDOU_QUOTE',		'[NEWLINE]"Are you not entertained?"[NEWLINE] - Maximus Decimus Meridius[NEWLINE]'),
			('TXT_KEY_WONDER_BENHADDOU_PEDIA',		'At the foot of the Atlas Mountains, within Ouarzazate Province in Marrakesh, sits Aït Benhaddou. The site is famous for its ksar - a pre-Saharan fortification, famed for its southern Moroccan architecture and method of construction. While little evidence suggests their construction - the earliest known references date back to only the seventeenth century - the use of the southern Moroccan building style is evidenced far back in Djebel and the southern valleys. The typology of the fort is diverse; large houses connect to a central courtyard, four tall wings fortified with angle towers, in some areas their is a connection to the lower houses and courtyard of the fort. As well as an exhibit of Moroccan architecture, Aït Benhaddou has also been featured in several films; including ''Jesus of Nazareth'', ''the Mummy'', ''Gladiator'' and ''Prince of Persia''.'),
			('TXT_KEY_WONDER_BENHADDOU_HELP',		'Gain 1 [COLOR_POSITIVE_TEXT]Additional[ENDCOLOR] [ICON_INTERNATIONAL_TRADE] Trade Route slot. +1 [ICON_FOOD] Food from River tiles woked by this City. Nearby Villages receive +3 [ICON_GOLD] Gold and +3 [ICON_TOURISM] Tourism. +4 [ICON_TOURISM] Tourism with [COLOR_CYAN]Radio[ENDCOLOR].');
			
UPDATE Language_en_US
SET Text = 'Huge [COLOR_YIELD_FOOD]Ait Benhaddou[ENDCOLOR] [COLOR_CITY_BROWN]Village[ENDCOLOR] (+3[ICON_GOLD], +3[ICON_TOURISM]/[ICON_WORKER]) is awesome tourist attraction and an ideal scenography for numerous movie projects ([COLOR_CYAN]Radio:[ENDCOLOR] +4[ICON_TOURISM]). This desert settlement makes also profit from nearby [COLOR_CITY_GREEN]River[ENDCOLOR] (+1[ICON_FOOD]/[ICON_MUSHROOM]) to expand your current trade network (+1[ICON_INTERNATIONAL_TRADE]).'
WHERE Tag = 'TXT_KEY_WONDER_BENHADDOU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_BENHADDOU_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_BENHADDOU_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Desert[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR]; Improvement: [COLOR_CYAN]Village[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BENHADDOU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Desert[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BENHADDOU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	

INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_BENHADDOU',			'아이트벤하두'),
			('TXT_KEY_WONDER_BENHADDOU_QUOTE',		'[NEWLINE]"이래도 즐겁지 않느냐? 이래도 즐겁지 않느냔 말이다!"[NEWLINE] - 막시무스 데키무스 메리디우스[NEWLINE]'),
			('TXT_KEY_WONDER_BENHADDOU_PEDIA',		'아이트벤하두는 마라케시의 우아르자테 주 내 아틀라스 산맥 기슭에 있습니다. 이 장소는 남부 모로코 건축 양식과 건설 방법으로 유명한 사하라 이전 요새인 크사르 유명합니다. 그들의 건설을 암시하는 증거는 거의 없지만 – 가장 초기에 알려진 참조는 17세기로 거슬러 올라갑니다 – 남부 모로코 건축 스타일의 사용은 제벨과 남부 계곡에서 멀리 거슬러 올라갑니다. 요새의 유형은 다양합니다. 큰 집은 중앙 안뜰, 앵글 타워로 강화된 4개의 높은 날개, 일부 지역에서는 요새의 낮은 집과 안뜰에 연결됩니다. 아이트벤하두는 모로코 건축 전시회뿐만 아니라 나자렛 예수, 미이라, 글레디에이터, 페르시아의 왕자 등의 여러 영화에도 등장했습니다.'),
			('TXT_KEY_WONDER_BENHADDOU_HELP',		'추가 [ICON_INTERNATIONAL_TRADE][COLOR_POSITIVE_TEXT]교역로[ENDCOLOR] 슬롯 1개를 제공합니다. 이 도시의 강 타일에서 [ICON_FOOD]식량 +1을 제공합니다. 이 도시 근처의 마을은 [ICON_GOLD]골드 +3 [ICON_TOURISM]관광 +3을 제공합니다. [COLOR_CYAN]라디오[ENDCOLOR] 연구 시 [ICON_TOURISM]관광 +4를 제공합니다.');
			
UPDATE Language_ko_KR
SET Text = '거대한 [COLOR_YIELD_FOOD]아이트벤하두[ENDCOLOR] [COLOR_CITY_BROWN]마을[ENDCOLOR](+3[ICON_GOLD], +3[ICON_TOURISM]/[ICON_WORKER])은 멋진 관광 명소이자 수많은 영화 프로젝트를 위한 이상적인 배경입니다([COLOR_CYAN]라디오 :[ENDCOLOR] +4[ICON_TOURISM]). 이 사막 정착지는 인근 [COLOR_CITY_GREEN]강[ENDCOLOR](+1[ICON_FOOD]/[ICON_MUSHROOM])에서 이익을 얻어 현재 무역 네트워크를 확장합니다(+1[ICON_INTERNATIONAL_TRADE]).'
WHERE Tag = 'TXT_KEY_WONDER_BENHADDOU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_BENHADDOU_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_BENHADDOU_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]사막[ENDCOLOR]; 위치: [COLOR_CYAN]언덕[ENDCOLOR]; 시설: [COLOR_CYAN]마을[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BENHADDOU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]사막[ENDCOLOR]; 위치: [COLOR_CYAN]언덕[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BENHADDOU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Kilwa Kisiwani
INSERT INTO Language_en_US 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_KILWA_KISIWANI',			'Kilwa Kisiwani'),
			('TXT_KEY_WONDER_KILWA_KISIWANI_QUOTE',		'[NEWLINE]"Kilwa is one of the most beautifully built cities in the world. The houses there are entirely made of wood, their rooftops out of rope grass, and it rains with great vigour."[NEWLINE] - Ibn Battuta[NEWLINE]'),
			('TXT_KEY_WONDER_KILWA_KISIWANI_PEDIA',		'TODO'),
			('TXT_KEY_WONDER_KILWA_KISIWANI_HELP',		'Receive 1 copy of [ICON_RES_PORCELAIN] Porcelain and [ICON_RES_JEWELRY] Jewelry. Gain 2 [COLOR_POSITIVE_TEXT]Additional[ENDCOLOR] [ICON_INTERNATIONAL_TRADE] Trade Route slots. +1 [ICON_PRODUCTION] Production from Strategic and +1 [ICON_GOLD] Gold from Luxury resources worked by this City.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Kilwa Kisiwani[ENDCOLOR] trade center (+2[ICON_INTERNATIONAL_TRADE]) acquires for you few copies of [COLOR_GREY]City-State Luxuries[ENDCOLOR] (+1 flat [ICON_RES_JEWELRY]; +1 flat [ICON_RES_PORCELAIN]). Moreover, you receive substantial bonus from resources available on your terrain (+1[ICON_PRODUCTION]/[COLOR_GREY]Strategic[ENDCOLOR]; +1[ICON_GOLD]/[COLOR_GREY]Luxury[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_KILWA_KISIWANI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_KILWA_KISIWANI_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_KILWA_KISIWANI_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Statecraft Finisher[ENDCOLOR]; Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Improvement: [COLOR_CYAN]3 (Mines + Camps)[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_KILWA_KISIWANI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Statecraft Finisher[ENDCOLOR]; Terrain: [COLOR_CYAN]Coast[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_KILWA_KISIWANI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_KILWA_KISIWANI',			'킬와 키시와니'),
			('TXT_KEY_WONDER_KILWA_KISIWANI_QUOTE',		'[NEWLINE]"킬와는 세계에서 가장 아름답게 지어진 도시 중 하나이다. 그곳의 집들은 전부 나무로 지어졌고, 지붕은 밧줄 풀로 만들어졌고, 비는 매우 힘차게 내린다."[NEWLINE] - 이븐 바투타[NEWLINE]'),
			('TXT_KEY_WONDER_KILWA_KISIWANI_PEDIA',		'TODO'),
			('TXT_KEY_WONDER_KILWA_KISIWANI_HELP',		'[ICON_RES_PORCELAIN]도자기 및 [ICON_RES_JEWELRY]장신구 자원을 1개씩 받습니다. [COLOR_POSITIVE_TEXT]추가[ENDCOLOR] [ICON_INTERNATIONAL_TRADE]교역로 슬롯 2개를 제공합니다. 이 도시의 전략자원에서 [ICON_PRODUCTION]생산 +1 사치자원에서 [ICON_GOLD]골드 +1을 제공합니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]킬와 키시와니[ENDCOLOR] 무역 중심지(+2[ICON_INTERNATIONAL_TRADE])에서 [COLOR_GREY]도시 국가 사치품[ENDCOLOR](+1[ICON_RES_JEWELRY], +1[ICON_RES_PORCELAIN]) 사본 몇 개를 구입했습니다. 또한 지형에서 사용 가능한 자원으로부터 상당한 보너스를 받습니다(+1[ICON_PRODUCTION]/[COLOR_GREY]전략 자원[ENDCOLOR]; +1[ICON_GOLD]/[COLOR_GREY]사치 자원[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_KILWA_KISIWANI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_KILWA_KISIWANI_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_KILWA_KISIWANI_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]외교 완성[ENDCOLOR]; 지형: [COLOR_CYAN]해안[ENDCOLOR]; 시설: [COLOR_CYAN](광산+야영지) 3개[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_KILWA_KISIWANI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]외교 완성[ENDCOLOR]; 지형: [COLOR_CYAN]해안[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_KILWA_KISIWANI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- St. Peter's Basilica
INSERT INTO Language_en_US 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_ST_PETERS',			'St. Peter''s Basilica'),
			('TXT_KEY_WONDER_ST_PETERS_QUOTE',		'[NEWLINE]"A rock pile ceases to be a rock pile the moment a single man contemplates it, bearing within him the image of a cathedral."[NEWLINE] - Antoine de Saint-Exupery[NEWLINE]'),
			('TXT_KEY_WONDER_ST_PETERS_PEDIA',		'Basilica Papale di San Pietro in Vaticano, better known as St. Peter''s Basilica, is a late Renaissance church in Vatican City, with the largest interior of any Christian church in the world. The supposed burial site of the apostle Peter in 64 AD, some years later a shrine was constructed there. Replacing the shrine, construction of "old" St. Peter''s was begun by the Emperor Constantine between 319 and 333 AD.[NEWLINE][NEWLINE]  Having fallen into serious disrepair over the centuries, Pope Julius II in 1505 determined to demolish the old church and replace it with a monumental structure, a construction project that spanned the next 120 years under a succession of popes and architects. To finance the colossal project, a number of popes authorized the wholesale selling of indulgences, a practice that led in part to Martin Luther''s protestant movement.[NEWLINE][NEWLINE]  With work by some of the Renaissance''s leading figures - Michelangelo, Raphael, Bramante, Bernini and others - the church now stands as one of the great treasures of Western civilization.'),
			('TXT_KEY_WONDER_ST_PETERS_HELP',		'Provides a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Cathedral and 3 [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Inquisitors in the City in which it is built. +1 [ICON_HAPPINESS_1] Happiness from all unique Religious buildings. Receive 1 [COLOR_POSITIVE_TEXT]Additional[ENDCOLOR] [ICON_DOPLOMAT] World Congress Delegate.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]St. Peter''s Basilica[ENDCOLOR] is not only religious, but also diplomatic (3 [COLOR_YIELD_GOLD]free Inquisitors[ENDCOLOR]; +1[ICON_DIPLOMAT] League Vote) [COLOR_YIELD_FOOD]Cathedral[ENDCOLOR] ([ICON_GOLD]; [ICON_PEACE]; [ICON_MISSIONARY]; [ICON_HAPPINESS_3]) as well. Grants massive happiness boost, if you invest in religion (+1[ICON_HAPPINESS_1]/all Religious buildings).'
WHERE Tag = 'TXT_KEY_WONDER_ST_PETERS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_ST_PETERS_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_ST_PETERS_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_YIELD_PRODUCTION]Holy City[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ST_PETERS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_en_US SET Text = 'Special: [COLOR_YIELD_PRODUCTION]Holy City[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ST_PETERS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	

INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_ST_PETERS',			'성 베드로 대성당'),
			('TXT_KEY_WONDER_ST_PETERS_QUOTE',		'[NEWLINE]"한 사람이 성당의 이미지를 품고 그것을 응시하는 순간 바위 더미는 더 이상 바위 더미가 아니다."[NEWLINE] - 앙투안 드 생텍쥐페리[NEWLINE]'),
			('TXT_KEY_WONDER_ST_PETERS_PEDIA',		'성 베드로 대성당으로 더 잘 알려진 바티카노의 바실리카 파팔레 디 산 피에트로는 바티칸 시국에 있는 후기 르네상스 교회로 세계에서 가장 큰 기독교 교회 내부를 자랑합니다. 서기 64년에 사도 베드로가 묻혔다고 추정되는 곳으로 몇 년 후 그곳에 신전이 세워졌습니다. 사당을 대체하여 서기 319년에서 333년 사이에 콘스탄티누스 황제가 "오래된" 성 베드로 성당을 짓기 시작했습니다.[NEWLINE][NEWLINE] 수세기에 걸쳐 심각한 황폐화에 빠진 교황 율리우스 2세는 1505년에 오래된 교회를 철거하고 기념비적인 구조물로 교체하기로 결정했습니다. 이 건설 프로젝트는 다음 120년에 걸쳐 교황과 건축가의 연속하에 계속되었습니다. 이 거대한 프로젝트의 자금을 조달하기 위해 많은 교황이 면죄부 도매를 승인했으며, 이는 부분적으로 마틴 루터의 개신교 운동으로 이어진 관행입니다.[NEWLINE][NEWLINE] 미켈란젤로, 라파엘, 브라만테, 베르니니 등 르네상스의 주요 인물들이 작업한 이 교회는 이제 서구 문명의 위대한 보물 중 하나로 우뚝 서 있습니다.'),
			('TXT_KEY_WONDER_ST_PETERS_HELP',		'무료 [COLOR_POSITIVE_TEXT]대성당[ENDCOLOR]과 [COLOR_POSITIVE_TEXT]이단심문관[ENDCOLOR] 3명을 제공합니다. 모든 고유 종교 건물이 [ICON_HAPPINESS_1]행복을 +1 제공합니다. [ICON_DOPLOMAT][COLOR_POSITIVE_TEXT]세계 대회 대표단[ENDCOLOR]을 추가로 1명 받습니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]성 베드로 대성당[ENDCOLOR]은 종교적일 뿐만 아니라 외교적인(3 [COLOR_YIELD_GOLD]무료 이단심문관[ENDCOLOR]; +1[ICON_DIPLOMAT] 세계 의회 대표단) [COLOR_YIELD_FOOD]대성당[ENDCOLOR]([ICON_GOLD]; [ICON_PEACE]; [ICON_MISSIONARY ]; [ICON_HAPPINESS_3])입니다. 종교에 투자하면 엄청난 행복 증가를 제공합니다(+1[ICON_HAPPINESS_1]/모든 고유 종교 건물).'
WHERE Tag = 'TXT_KEY_WONDER_ST_PETERS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_ST_PETERS_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_ST_PETERS_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_YIELD_PRODUCTION]성도[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ST_PETERS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_ko_KR SET Text = '특수: [COLOR_YIELD_PRODUCTION]성도[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ST_PETERS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Golden Pavilion
INSERT INTO Language_en_US 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_KINKAKU_JI',			'Golden Pavilion'),
			('TXT_KEY_WONDER_KINKAKU_JI_QUOTE',		'[NEWLINE]"A book holds a house of Gold."[NEWLINE] - Chinese Proverb[NEWLINE]'),
			('TXT_KEY_WONDER_KINKAKU_JI_PEDIA',		'Kinkaku-ji (literally "Temple of the Golden Pavilion") is a Buddhist temple in Kyoto, Japan. it was originally built as a villa at an unknown date, however was bought in 1397 by Shogun Ashikaga Yoshimitsu, who converted the villa into the Kinkaku-ji complex. Upon his death, it was converted to a Zen temple by his son.[NEWLINE][NEWLINE]  In July 1950 it was burnt down by a Monk with a mental illness, causing a massive renovation project to be undertaken. The renovations took five years, completed in 1955. The exterior of the upper two floors were covered in pure gold leave, giving the name "Golden Pavilion", however it is unclear wether the gold leaf was present in the pre-1950''s version.'),
			('TXT_KEY_WONDER_KINKAKU_JI_HELP',		'Provides a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Pagoda in the City in which it is built. +1 [ICON_FOOD] Food, +1 [ICON_PEACE] Faith and +1 [ICON_CULTURE] Culture from each Lake, +1 [ICON_PEACE] Faith and +1 [ICON_CULTURE] Culture from each Forest and Jungle, and +1 [ICON_FOOD] Food from each River tile worked by the City. Has 1 slot for [ICON_GREAT_WORK] Great Works of Literature.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Golden Pavilion[ENDCOLOR] is strongly tied to surrounding nature: [COLOR_CITY_GREEN]Lakes[ENDCOLOR] (+1[ICON_FOOD], +1[ICON_CULTURE], +1[ICON_PEACE]/[ICON_MUSHROOM]), [COLOR_CITY_GREEN]Forests[ENDCOLOR], [COLOR_CITY_GREEN]Jungles[ENDCOLOR] (+1[ICON_CULTURE], +1[ICON_PEACE]/[ICON_MUSHROOM]) and [COLOR_CITY_GREEN]Rivers[ENDCOLOR] (+1[ICON_FOOD]/[ICON_MUSHROOM]). Mentioned nature was always inspiration for writers (1[ICON_GREAT_WORK]) spending their leisure time in peaceful [COLOR_YIELD_FOOD]Pagodas[ENDCOLOR] ([ICON_RELIGION]; [ICON_HAPPINESS_3]).'
WHERE Tag = 'TXT_KEY_WONDER_KINKAKU_JI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_KINKAKU_JI_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_KINKAKU_JI_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Fealty Finisher[ENDCOLOR]; Feature: [COLOR_CYAN]Fresh Water[ENDCOLOR], [COLOR_CYAN]Forest[ENDCOLOR]/[COLOR_CYAN]Jungle[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_KINKAKU_JI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Fealty Finisher[ENDCOLOR]; Feature: [COLOR_CYAN]Fresh Water[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_KINKAKU_JI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	

INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_KINKAKU_JI',			'금각사'),
			('TXT_KEY_WONDER_KINKAKU_JI_QUOTE',		'[NEWLINE]"책은 금의 집을 가지고 있다."[NEWLINE] - 중국 속담[NEWLINE]'),
			('TXT_KEY_WONDER_KINKAKU_JI_PEDIA',		'금각사는 일본 교토부 교토시에 있는 절입니다. 원래는 알려지지 않은 날짜에 별장으로 지어졌지만, 1397년 쇼군 아시카가 요시미쓰가 이 별장을 금각사로 개조하여 사들였습니다. 그가 죽자, 그것은 그의 아들에 의해 선사로 개조되었습니다.[NEWLINE][NEWLINE] 1950년 7월, 그것은 정신병을 앓고 있는 승려에 의해 불에 타버렸고, 이로 인해 대대적인 보수 공사가 착수되었습니다. 이 보수 공사는 1955년에 완료되는 데 5년이 걸렸습니다. 위층 2층의 외부는 순금 잎으로 덮여 있어 "황금관"이라는 이름을 얻었지만, 1950년대 이전 버전에 순금 잎이 있었는지는 확실하지 않습니다.'),
			('TXT_KEY_WONDER_KINKAKU_JI_HELP',		'건설된 도시에 무료 [COLOR_POSITIVE_TEXT]파고다[ENDCOLOR]를 제공합니다. 이 도시의 호수에서 각각 [ICON_FOOD]식량 +1 [ICON_PEACE]신앙 +1 [ICON_CULTURE]문화 +1을 제공하며 이 도시의 정글이나 숲에서 각각 [ICON_PEACE]신앙 +1 [ICON_CULTURE]문화 +1을 제공하고 이 도시의 강 타일에서 [ICON_FOOD]식량 +1을 제공합니다. [ICON_GREAT_WORK]걸작 문학 슬롯 1개를 제공합니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]금각사[ENDCOLOR]는 [COLOR_CITY_GREEN]호수[ENDCOLOR](+1[ICON_FOOD], +1[ICON_CULTURE], +1[ICON_PEACE]/[ICON_MUSHROOM]), [COLOR_CITY_GREEN]숲 [ENDCOLOR], [COLOR_CITY_GREEN]정글[ENDCOLOR](+1[ICON_CULTURE], +1[ICON_PEACE]/[ICON_MUSHROOM]) 및 [COLOR_CITY_GREEN]강[ENDCOLOR](+1[ICON_FOOD]/[ICON_MUSHROOM])과 같은 주변 자연들과 연관이 있습니다. 언급된 자연은 평화로운 [COLOR_YIELD_FOOD]파고다[ENDCOLOR]([ICON_RELIGION]; [ICON_HAPPINESS_3])에서 여가 시간을 보내는 작가(1[ICON_GREAT_WORK])에게 항상 영감을 주었습니다.'
WHERE Tag = 'TXT_KEY_WONDER_KINKAKU_JI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_KINKAKU_JI_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_KINKAKU_JI_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]충성 완성[ENDCOLOR]; 특징: [COLOR_CYAN]담수[ENDCOLOR], [COLOR_CYAN]숲[ENDCOLOR]/[COLOR_CYAN]정글[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_KINKAKU_JI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]충성 완성[ENDCOLOR]; 특징: [COLOR_CYAN]담수[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_KINKAKU_JI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);		
----------------------------------------------------
-- Marae Arahurahu
INSERT INTO Language_en_US 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_MARAE',				'Marae Arahurahu'),
			('TXT_KEY_WONDER_MARAE_QUOTE',			'[NEWLINE]"The leader at the front and the workers behind the scenes."[NEWLINE] - Maori proverb[NEWLINE]'),
			('TXT_KEY_WONDER_MARAE_PEDIA',			'TODO'),
			('TXT_KEY_THEMING_BONUS_MARAE',			'Pre-war pump-up songs'),
			('TXT_KEY_THEMING_BONUS_MARAE_HELP',	'To maximize your bonus, make sure all the Great Work Slots are all filled with Music created by you.'),
			('TXT_KEY_WONDER_MARAE_HELP',			'Has 2 slot for [ICON_GREAT_WORK] Great Works of Music. +8 [ICON_FOOD] Food and +3 [ICON_CULTURE] Culture if [COLOR_POSITIVE_TEXT]Themed[ENDCOLOR]. 15 XP per each [ICON_GREAT_WORK] Great Work in this wonder for Land and Sea Units trained in this City. All Ranged Land Units get [COLOR_POSITIVE_TEXT]Marae[ENDCOLOR] promotion and all Land Units get [COLOR_POSITIVE_TEXT]Arahurahu[ENDCOLOR] promotion. Units generate [ICON_PEACE] Faith [COLOR_POSITIVE_TEXT]on their Death[ENDCOLOR].'),
			('TXT_KEY_PROMOTION_MARAE',				'Marae'),
			('TXT_KEY_PROMOTION_MARAE_HELP',		'+10%[ICON_RANGE_STRENGTH]RCS.'),
			('TXT_KEY_PROMOTION_ARAHURAHU',			'Arahurahu'),
			('TXT_KEY_PROMOTION_ARAHURAHU_HELP',	'Gain 120% of an Enemy Unit''s [ICON_STRENGTH]CS as a [ICON_CULTURE] Culture [COLOR:255:230:85:255]on Kill[ENDCOLOR].');

UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Marae Arahurahu[ENDCOLOR] greatly supports your soldiers ([COLOR_WATER_TEXT]Marae[ENDCOLOR]/[COLOR_YIELD_GOLD]Ranged Land[ENDCOLOR]), which should be core of your army ever since. Motivated units are rewarded, regardless the result of the combat ([COLOR_WATER_TEXT]Arahurahu[ENDCOLOR]/[COLOR_YIELD_GOLD]Military Land[ENDCOLOR]; 10[ICON_PEACE]/Death). Remember, that great works in the city increase experience gained by your units (+1[ICON_GREAT_MUSICIAN]; +2[ICON_GREAT_WORK] if themed: [ICON_FOOD], [ICON_CULTURE]; +15 XP/[ICON_GREAT_WORK] inside/[COLOR_YIELD_GOLD]Land[ENDCOLOR], [COLOR_YIELD_GOLD]Naval[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_MARAE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_MARAE_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_MARAE_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Grassland[ENDCOLOR], [COLOR_CYAN]Coast[ENDCOLOR]; Building: [COLOR_CYAN]Garden[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MARAE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MARAE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	

INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_MARAE',				'마라에 아라후라후'),
			('TXT_KEY_WONDER_MARAE_QUOTE',			'[NEWLINE]"선두에 있는 리더와 뒤에 있는 일꾼들"[NEWLINE] - 마오리 속담[NEWLINE]'),
			('TXT_KEY_WONDER_MARAE_PEDIA',			'TODO'),
			('TXT_KEY_THEMING_BONUS_MARAE',			'전쟁 전 결의를 북돋는 노래'),
			('TXT_KEY_THEMING_BONUS_MARAE_HELP',	'보너스를 최대화하려면 걸작 슬롯을 모두 자신이 만든 걸작으로 채워야 합니다.'),
			('TXT_KEY_WONDER_MARAE_HELP',			'[ICON_GREAT_WORK]걸작 음악 슬롯 2개를 제공합니다. 이 불가사의에 채워진 [ICON_GREAT_WORK]걸작 하나마다 이 도시에서 생산된 육상 및 해상 유닛에게 경험치를 15 부여합니다. 모든 원거리 지상 유닛은 [COLOR_POSITIVE_TEXT]마라에[ENDCOLOR] 승급을 받고 모든 지상 유닛은 [COLOR_POSITIVE_TEXT]아라후라후[ENDCOLOR] 승급을 얻습니다. 유닛이 [COLOR_POSITIVE_TEXT]사망[ENDCOLOR]할 때 [ICON_PEACE]신앙을 생성합니다.[NEWLINE][NEWLINE]테마보너스: [ICON_FOOD]식량 +8 [ICON_CULTURE]문화 +3'),
			('TXT_KEY_PROMOTION_MARAE',				'마라에'),
			('TXT_KEY_PROMOTION_MARAE_HELP',		'[ICON_RANGE_STRENGTH]원거리 공격력 +10%'),
			('TXT_KEY_PROMOTION_ARAHURAHU',			'아라후라후'),
			('TXT_KEY_PROMOTION_ARAHURAHU_HELP',	'처치 시 [ICON_CULTURE]문화 획득 [COLOR:255:230:85:255](적 유닛의 [ICON_STRENGTH]공격력의 120%)[ENDCOLOR]');

UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]마라에 아라후라후[ENDCOLOR]는 당신의 병사들을 크게 지원([COLOR_WATER_TEXT]마라에[ENDCOLOR]/[COLOR_YIELD_GOLD]지상 원거리[ENDCOLOR])합니다. 그 이후로 당신의 군대의 핵심이 될 것이며 전투 결과에 관계없이 동기 부여된 부대는 보상([COLOR_WATER_TEXT]아라후라후[ENDCOLOR]/[COLOR_YIELD_GOLD]지상 군사[ENDCOLOR]; 10[ICON_PEACE]/사망 시)을 받습니다. 도시에서 훌륭한 일을 하면 부대가 경험을 쌓을 수 있다는 것을 기억하십시오(+1[ICON_GREAT_MUSICIAN]; +2[ICON_GREAT_WORK] 테마보너스: [ICON_FOOD], [ICON_CULTURE]; +15 경험치/각 [ICON_GREAT_WORK]/[COLOR_YIELD_GOLD]지상 군사[ENDCOLOR], [COLOR_YIELD_GOLD]해상 군사[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_MARAE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_MARAE_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_MARAE_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]초원[ENDCOLOR], [COLOR_CYAN]해안[ENDCOLOR]; 건물: [COLOR_CYAN]정원[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MARAE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MARAE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Old Bridge
INSERT INTO Language_en_US 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_OLD_BRIDGE',			'Old Bridge in Mostar'),
			('TXT_KEY_WONDER_OLD_BRIDGE_QUOTE',		'[NEWLINE]"A refugee is someone who survived and who can create the future."[NEWLINE] - Amela Koluder[NEWLINE]'),
			('TXT_KEY_WONDER_OLD_BRIDGE_PEDIA',		'TODO'),
			('TXT_KEY_WONDER_OLD_BRIDGE_HELP',		'Receive 1 [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] [ICON_DIPLOMAT] Great Diplomat and 2 [COLOR_POSITIVE_TEXT]Additional[ENDCOLOR] [ICON_DOPLOMAT] World Congress Delegates.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Old Bridge in Mostar[ENDCOLOR] is your call for peace and prosperity (+2[ICON_DIPLOMAT] League Votes; +1[ICON_HAPPINESS_1]). Use your diplomatic strength ([COLOR_YIELD_GOLD]free [ICON_DIPLOMAT][ENDCOLOR]; +2[ICON_DIPLOMAT]) to bring nations on your site.'
WHERE Tag = 'TXT_KEY_WONDER_OLD_BRIDGE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_OLD_BRIDGE_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_OLD_BRIDGE_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Statecraft Finisher[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR]; Player: [COLOR_CYAN]at Peace[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_OLD_BRIDGE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Statecraft Finisher[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_OLD_BRIDGE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	

INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_OLD_BRIDGE',			'스타리 모스트'),
			('TXT_KEY_WONDER_OLD_BRIDGE_QUOTE',		'[NEWLINE]"난민은 살아남았고 미래를 창조할 수 있는 사람이다."[NEWLINE] - 아멜라 콜루더[NEWLINE]'),
			('TXT_KEY_WONDER_OLD_BRIDGE_PEDIA',		'TODO'),
			('TXT_KEY_WONDER_OLD_BRIDGE_HELP',		'무료 [ICON_DIPLOMAT][COLOR_POSITIVE_TEXT]위대한 외교관[COLOR_POSITIVE_TEXT] 1명과 [ICON_DOPLOMAT][COLOR_POSITIVE_TEXT]세계 대회 대표단[ENDCOLOR]을 추가로 2명 받습니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]스타리 모스트[ENDCOLOR]는 평화와 번영을 위한 당신의 요청입니다(+2[ICON_DIPLOMAT] 세계 대회 대표단, +1[ICON_HAPPINESS_1]). 외교력([COLOR_YIELD_GOLD]무료 [ICON_DIPLOMAT][ENDCOLOR]; +2[ICON_DIPLOMAT])을 사용하여 이 장소에 국가들를 불러오세요.'
WHERE Tag = 'TXT_KEY_WONDER_OLD_BRIDGE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_OLD_BRIDGE_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_OLD_BRIDGE_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]외교 완성[ENDCOLOR]; 위치: [COLOR_CYAN]언덕[ENDCOLOR]; 특징: [COLOR_CYAN]강[ENDCOLOR]; 플레이어: [COLOR_CYAN]평화상태[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_OLD_BRIDGE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]외교 완성[ENDCOLOR]; 특징: [COLOR_CYAN]강[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_OLD_BRIDGE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Meenakshi Temple
INSERT INTO Language_en_US 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_MEENAKSHI',			'Meenakshi Temple'),
			('TXT_KEY_WONDER_MEENAKSHI_QUOTE',		'[NEWLINE]"We greet you, Devi Meenakshi, she who shines like a thousand-million suns, adorned with bracelets and garlands... She who is auspicious, she who embodies existence. I always bow to you, whose compassion is an ocean."[NEWLINE] - Adi Shankara[NEWLINE]'),
			('TXT_KEY_WONDER_MEENAKSHI_PEDIA',		'TODO'),
			('TXT_KEY_WONDER_MEENAKSHI_HELP',		'Provides a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Mandir in the City in which it is built. Converts 20% of [ICON_PEACE] Faith Purchase into [ICON_FOOD] Food. All [ICON_GREAT_WORK] Great Works in the Empire receive +1 [ICON_FOOD] Food. +1 [ICON_PEACE] Faith from Lake and River tiles worked by this City.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Mandir[ENDCOLOR] ([ICON_FOOD]; [ICON_PEACE]; [ICON_HAPPINESS_3]; [ICON_GREAT_WORK]; [ICON_SPY]) praising [COLOR_YIELD_FOOD]Meenakshi[ENDCOLOR] increases faith in your people (+1[ICON_PEACE]/4 [ICON_CITIZEN][ICON_CITIZEN]) amazed by this colorful wonder. Waters of nearby [COLOR_CITY_GREEN]Lakes[ENDCOLOR] and [COLOR_CITY_GREEN]Rivers[ENDCOLOR] (+1[ICON_PEACE]/[ICON_MUSHROOM]) boost your growth, which can be raised even more by investing in religious projects (20%[ICON_PEACE] Faith Purchase into [ICON_FOOD]) or devoting to artistry (+1[ICON_FOOD]/[ICON_GREAT_WORK][ICON_GREAT_WORK]).'
WHERE Tag = 'TXT_KEY_WONDER_MEENAKSHI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_MEENAKSHI_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_MEENAKSHI_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_YIELD_PRODUCTION]Holy City[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MEENAKSHI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_en_US SET Text = 'Special: [COLOR_YIELD_PRODUCTION]Holy City[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MEENAKSHI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_MEENAKSHI',			'미낙시 사원'),
			('TXT_KEY_WONDER_MEENAKSHI_QUOTE',		'[NEWLINE]"우리는 당신을 환영합니다, 데비 미낙시, 팔찌와 화환으로 장식된, 억만개의 태양처럼 빛나는 그녀... 상서로운 자, 존재를 구현하는 자입니다. 동정심이 바다인 당신에게 나는 항상 절합니다."[NEWLINE] - 샹카라[NEWLINE]'),
			('TXT_KEY_WONDER_MEENAKSHI_PEDIA',		'TODO'),
			('TXT_KEY_WONDER_MEENAKSHI_HELP',		'이 도시에 무료 [COLOR_POSITIVE_TEXT]만디르[ENDCOLOR]를 제공합니다. 구매에 사용한 [ICON_PEACE]신앙의 20%를 [ICON_FOOD]식량으로 전환합니다. 제국의 모든 [ICON_GREAT_WORK]걸작이 [ICON_FOOD]식량 +1을 제공합니다. 이 도시의 호수 및 강타일에 [ICON_PEACE]신앙 +1을 제공합니다. 제국의 모든 도시에서 [ICON_CITIZEN]시민 4명당 [ICON_PEACE]신앙 +1을 제공합니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]만디르[ENDCOLOR]([ICON_FOOD]; [ICON_PEACE]; [ICON_HAPPINESS_3]; [ICON_GREAT_WORK]; [ICON_SPY])는 [COLOR_YIELD_FOOD]미낙시[ENDCOLOR]를 칭찬하며 이 화려한 경이로움에 놀란 사람들의 믿음을 증가시킵니다(+1[ICON_PEACE]/4 [ICON_CITIZEN][ICON_CITIZEN]). 인근 [COLOR_CITY_GREEN]호수[ENDCOLOR] 및 [COLOR_CITY_GREEN]강[ENDCOLOR](+1[ICON_PEACE]/[ICON_MUSHROOM])의 물은 성장을 촉진하며 종교 프로젝트에 투자(20%[ICON_PEACE] Faith Purchase into [ICON_FOOD])하거나 예술에 전념(+1[ICON_FOOD]/[ICON_GREAT_WORK][ICON_GREAT_WORK])함으로써 성장을 더욱 높일 수 있습니다.'
WHERE Tag = 'TXT_KEY_WONDER_MEENAKSHI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_MEENAKSHI_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_MEENAKSHI_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_YIELD_PRODUCTION]성도[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MEENAKSHI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_ko_KR SET Text = '특수: [COLOR_YIELD_PRODUCTION]성도[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MEENAKSHI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);		
----------------------------------------------------
-- Peterhof
INSERT INTO Language_en_US 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_PETERHOF',			'Peterhof'),
			('TXT_KEY_WONDER_PETERHOF_QUOTE',		'[NEWLINE]"It is my great desire to reform my subjects, and yet I am ashamed to confess that I am unable to reform myself."[NEWLINE] - Peter The Great[NEWLINE]'),
			('TXT_KEY_WONDER_PETERHOF_PEDIA',		'The Peterhof Palace is a series of palaces and gardens located in Saint Petersburg, Russia, laid out on the orders of Peter the Great. These Palaces and gardens are sometimes referred as the "Russian Versailles". The palace-ensemble along with the city center is recognised as a UNESCO World Heritage Site.'),
			('TXT_KEY_WONDER_PETERHOF_HELP',		'+10% generation of [ICON_GREAT_PEOPLE] Great People in this City. Starts 20 turn of [ICON_HAPPINESS_1] WLTKD in this City. +15% [ICON_PRODUCTION] Production, [ICON_GOLD] Gold and [ICON_GOLDEN_AGE] Golden Age Points during [ICON_HAPPINESS_1] WLTKD.');
			
UPDATE Language_en_US
SET Text = 'Palace of [COLOR_YIELD_FOOD]Peterhof[ENDCOLOR] tells your citizens about your will to do everything possible to improve their lives (+6[ICON_GOLDEN_AGE]; 20[ICON_HAPPINESS_1] WLTKD turns), and they respond you with the same (+15%[ICON_PRODUCTION], +15%[ICON_GOLD], +15%[ICON_GOLDEN_AGE]/[ICON_HAPPINESS_1] WLTKD). Such a prosperity is strong invitation for any kind of nobles planning to visit your city (+10%[ICON_GREAT_PEOPLE]).'
WHERE Tag = 'TXT_KEY_WONDER_PETERHOF_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_PETERHOF_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_PETERHOF_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Plot: [COLOR_CYAN]Flat[ENDCOLOR]; Improved Resource [COLOR_CYAN][ICON_RES_IRON] Iron[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PETERHOF_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PETERHOF_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	

INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_PETERHOF',			'페테르고프'),
			('TXT_KEY_WONDER_PETERHOF_QUOTE',		'[NEWLINE]"신하들을 개혁하는 것이 나의 큰 소망이지만, 내 자신을 개혁할 수 없음을 고백하는 것이 부끄럽다."[NEWLINE] - 표트르 1세[NEWLINE]'),
			('TXT_KEY_WONDER_PETERHOF_PEDIA',		'페테르고프 궁전는 표토르 대제의 명령에 따라 러시아 상트페테르부르크에 위치한 일련의 궁전과 정원입니다. 이 궁전과 정원은 때때로 "러시아 베르사유"라고 불립니다. 도심과 함께 궁전 총체들은 유네스코 세계 문화 유산으로 인정 받고 있습니다.'),
			('TXT_KEY_WONDER_PETERHOF_HELP',		'이 도시의 [ICON_GREAT_PEOPLE]위인 생성률이 +10% 증가하며 [ICON_GOLDEN_AGE]황금기점수 +6을 제공합니다. 완공 시 이 도시에서 20턴동안 [ICON_HAPPINESS_1]국왕 경축일이 시작됩니다. [ICON_HAPPINESS_1]국왕 경축일 동안 [ICON_PRODUCTION]생산, [ICON_GOLD]골드 및 [ICON_GOLDEN_AGE]황금기점수가 15% 증가합니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]페테르고프[ENDCOLOR] 궁전은 시민들에게 그들의 삶을 개선하기 위해 가능한 모든 일을 하려는 당신의 의지를 알리고(+6[ICON_GOLDEN_AGE]; 20턴 [ICON_HAPPINESS_1]국왕 경축일), 그들은 당신에게 똑같이 응답합니다(+15%[ ICON_PRODUCTION], +15%[ICON_GOLD], +15%[ICON_GOLDEN_AGE]/[ICON_HAPPINESS_1]국왕 경축일). 당신의 도시를 방문하려는 귀족들에게는 이러한 번영이 강력한 초대입니다(+10%[ICON_GREAT_PEOPLE]).'
WHERE Tag = 'TXT_KEY_WONDER_PETERHOF_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_PETERHOF_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_PETERHOF_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 위치: [COLOR_CYAN]평지[ENDCOLOR]; 개발된 자원: [COLOR_CYAN][ICON_RES_IRON]철[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PETERHOF_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PETERHOF_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Bakken
INSERT INTO Language_en_US 
			(Tag,								Text) 
VALUES		('TXT_KEY_BUILDING_BAKKEN',			'Bakken'),
			('TXT_KEY_WONDER_BAKKEN_QUOTE',		'[NEWLINE]"Amusement is appealing because we don''t have to think. It spares us the fear and anxiety that might otherwise prey on our thoughts."[NEWLINE] - John Ortberg[NEWLINE]'),
			('TXT_KEY_WONDER_BAKKEN_PEDIA',		'TODO'),
			('TXT_KEY_WONDER_BAKKEN_HELP',		'Starts 10 turn of [ICON_HAPPINESS_1] WLTKD in this City. +33% [ICON_TOURISM] Tourism during [ICON_HAPPINESS_1] WLTKD.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Bakken[ENDCOLOR] provides entertainment on maximum level (+3[ICON_HAPPINESS_1]), greatly increasing your tourism traffic and its profits (10[ICON_HAPPINESS_1] WLTKD turns; +33%[ICON_TOURISM]/[ICON_HAPPINESS_1] WLTKD).'
WHERE Tag = 'TXT_KEY_WONDER_BAKKEN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_BAKKEN_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_BAKKEN_HELP';
				
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Hill[ENDCOLOR]; Player: [COLOR_CYAN]Happiness > 70%[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BAKKEN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_en_US SET Text = ''||Text WHERE Tag ='TXT_KEY_WONDER_BAKKEN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
VALUES		('TXT_KEY_BUILDING_BAKKEN',			'바켄'),
			('TXT_KEY_WONDER_BAKKEN_QUOTE',		'[NEWLINE]"오락은 우리가 생각할 필요가 없기 때문에 매력적입니다. 그것은 우리의 생각을 잠식할 수 있는 두려움과 불안을 덜어줍니다."[NEWLINE] - 존 오트버그[NEWLINE]'),
			('TXT_KEY_WONDER_BAKKEN_PEDIA',		'TODO'),
			('TXT_KEY_WONDER_BAKKEN_HELP',		'이 도시에서 10턴동안 [ICON_HAPPINESS_1]국왕 경축일을 시작합니다. [ICON_HAPPINESS_1]국왕 경축일동안 [ICON_TOURISM]관광이 +33%만큼 증가합니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]바켄[ENDCOLOR]은 최대 수준(+3[ICON_HAPPINESS_1])의 오락을 제공하여 관광 흐름 수익을 크게 증가시킵니다(10턴 [ICON_HAPPINESS_1]국왕 경축일, +33%[ICON_TOURISM]/[ICON_HAPPINESS_1] 국왕 경축일).'
WHERE Tag = 'TXT_KEY_WONDER_BAKKEN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_BAKKEN_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_BAKKEN_HELP';
				
UPDATE Language_ko_KR SET Text = '위치: [COLOR_CYAN]언덕[ENDCOLOR]; 플레이어: [COLOR_CYAN][ICON_HAPPINESS_1]행복도>70%[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BAKKEN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_ko_KR SET Text = ''||Text WHERE Tag ='TXT_KEY_WONDER_BAKKEN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);		
----------------------------------------------------
-- House of Trades of the Indies
INSERT INTO Language_en_US 
			(Tag,										Text) 
VALUES		('TXT_KEY_BUILDING_HOUSE_OF_TRADE',			'House of Trade of the Indies'),
			('TXT_KEY_WONDER_HOUSE_OF_TRADE_QUOTE',		'[NEWLINE]"All other lands found on the western side of the boundary shall belong to the King and Queen of Castille - and their successors."[NEWLINE] - Treaty of Tordesillas[NEWLINE]'),
			('TXT_KEY_WONDER_HOUSE_OF_TRADE_PEDIA',		'TODO'),
			('TXT_KEY_WONDER_HOUSE_OF_TRADE_HELP',		'Receive 1 [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] [ICON_GREAT_ADMIRAL] Great Admiral. Gain 2 [COLOR_POSITIVE_TEXT]Additional[ENDCOLOR] [ICON_INTERNATIONAL_TRADE] Trade Route slots. +10% [ICON_PRODUCTION] Production towards Naval Military Units and Cargo Ships.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]House of Trade[ENDCOLOR] bonds your military with trade so tightly, that it feels natural (+10%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]Military Naval[ENDCOLOR], [COLOR_YIELD_GOLD]Cargo[ENDCOLOR]). Fresh naval leadership ([COLOR_YIELD_GOLD]free [ICON_GREAT_ADMIRAL][ENDCOLOR]) and new possible trade routes (+2[ICON_INTERNATIONAL_TRADE]) will make ruler of all seas.'
WHERE Tag = 'TXT_KEY_WONDER_HOUSE_OF_TRADE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_HOUSE_OF_TRADE_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_HOUSE_OF_TRADE_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Player: [COLOR_CYAN]2 [ICON_CITY_STATE] Allies[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HOUSE_OF_TRADE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HOUSE_OF_TRADE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	

INSERT INTO Language_ko_KR 
			(Tag,										Text) 
VALUES		('TXT_KEY_BUILDING_HOUSE_OF_TRADE',			'카사 데 콘트라타시온'),
			('TXT_KEY_WONDER_HOUSE_OF_TRADE_QUOTE',		'[NEWLINE]"국경의 서쪽에서 발견되는 다른 모든 땅은 카스티유 왕과 여왕 그리고 그들의 후계자들의 것이다."[NEWLINE] - 토르데시야스 조약[NEWLINE]'),
			('TXT_KEY_WONDER_HOUSE_OF_TRADE_PEDIA',		'TODO'),
			('TXT_KEY_WONDER_HOUSE_OF_TRADE_HELP',		'무료 [ICON_GREAT_ADMIRAL][COLOR_POSITIVE_TEXT]위대한 제독[ENDCOLOR] 1명을 받습니다. 추가 [ICON_INTERNATIONAL_TRADE] [COLOR_POSITIVE_TEXT]교역로[ENDCOLOR] 슬롯을 2개 얻습니다. 해군 부대 및 화물선에 대한 [ICON_PRODUCTION]생산력이 +10% 증가합니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]카사 데 콘트라타시온[ENDCOLOR]은 군대를 무역과 밀접하게 결속시켜 자연스러운 느낌을 줍니다(+10%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]해양 군사[ENDCOLOR], [COLOR_YIELD_GOLD]화물선[ENDCOLOR]). 새로운 해군 리더십([COLOR_YIELD_GOLD]무료 [ICON_GREAT_ADMIRAL][ENDCOLOR])과 새로운 가능한 무역로(+2[ICON_INTERNATIONAL_TRADE])를 통해 모든 바다의 통치자가 되게 할 것입니다.'
WHERE Tag = 'TXT_KEY_WONDER_HOUSE_OF_TRADE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_HOUSE_OF_TRADE_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_HOUSE_OF_TRADE_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 플레이어: [COLOR_CYAN][ICON_CITY_STATE]동맹 2명[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HOUSE_OF_TRADE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HOUSE_OF_TRADE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Solovietsky Monastery
INSERT INTO Language_en_US 
			(Tag,										Text) 
VALUES		('TXT_KEY_BUILDING_SOLOVIETSKY',			'Solovietsky Monastery'),
			('TXT_KEY_WONDER_SOLOVIETSKY_QUOTE',		'[NEWLINE]"Everything is defeated before love."[NEWLINE] - Elder Thaddeus of Vitovnica[NEWLINE]'),
			('TXT_KEY_WONDER_SOLOVIETSKY_PEDIA',		'The Solovetsky Monastery is a fortified monastery located on the Solovetsky Islands in the White Sea in northern Russia. It was one of the largest Christian citadels in northern Russia before it was converted into a Soviet prison and labor camp in 1926-39, and served as a prototype for the camps of the Gulag system. The monastery has experienced several major changes and military sieges. Its most important structures date from the 16th century, when Filip Kolychev was its hegumen (comparable to an abbot).'),
			('TXT_KEY_WONDER_SOLOVIETSKY_HELP',			'+1 [ICON_PRODUCTION] Production and +1 [ICON_PEACE] Faith from Tundra tiles worked by this City. Greatly increase [ICON_STRENGTH] Combat Strength and Hit Points of this City. +1 [ICON_SILVER_FIST] Military Unit Supply Cap. +15% [ICON_PRODUCTION] Production towards Naval Military Units.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Solovietsky Monastery[ENDCOLOR] greatly supports your weak [COLOR_CITY_BLUE]Tundra[ENDCOLOR] (+1[ICON_PRODUCTION], +1[ICON_PEACE]/[ICON_FLOWER]) tiles. It helps you in quick navy reinforcement (+25%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]Military Naval[ENDCOLOR]) and strengthen your offense and deffense in the city (+10[ICON_STRENGTH]; +50 HP; +1[ICON_SILVER_FIST]).'
WHERE Tag = 'TXT_KEY_WONDER_SOLOVIETSKY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_SOLOVIETSKY_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_SOLOVIETSKY_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Fealty Finisher[ENDCOLOR]; Terrain: [COLOR_CYAN]Tundra[ENDCOLOR], [COLOR_CYAN]Coast[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SOLOVIETSKY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Fealty Finisher[ENDCOLOR]; Terrain: [COLOR_CYAN]Tundra[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SOLOVIETSKY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	

INSERT INTO Language_ko_KR 
			(Tag,										Text) 
VALUES		('TXT_KEY_BUILDING_SOLOVIETSKY',			'솔로베츠키 수도원'),
			('TXT_KEY_WONDER_SOLOVIETSKY_QUOTE',		'[NEWLINE]"모든 것은 사랑보다 먼저 패배한다."[NEWLINE] - 비토브니차의 다대오 장로[NEWLINE]'),
			('TXT_KEY_WONDER_SOLOVIETSKY_PEDIA',		'솔로베츠키 수도원은 러시아 북부 백해의 솔로베츠키 섬에 위치한 요새화된 수도원입니다. 1926-39년 소련의 감옥과 노동 수용소로 전환되기 전까지 북부 러시아에서 가장 큰 기독교 성채 중 하나였으며, 굴라그 체제의 수용소의 원형 역할을 했습니다. 이 수도원은 몇 가지 주요 변화와 군사적 포위를 경험했습니다. 그것의 가장 중요한 건축물들은 필리프 콜리체프가 이 수도원의 수도원장이였던 16세기로 거슬러 올라갑니다.'),
			('TXT_KEY_WONDER_SOLOVIETSKY_HELP',			'이 도시의 툰드라에서 [ICON_PRODUCTION]생산 +1 [ICON_PEACE]신앙 +1을 제공합니다. 이 도시의 [ICON_STRENGTH]전투력과 체력을 크게 증가시킵니다. [ICON_SILVER_FIST]군사 유닛 공급 상한선이 +1 증가합니다. 해군 군사 유닛에 대한 [ICON_PRODUCTION]생산력이 +15% 증가합니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]솔로베츠키 수도원[ENDCOLOR]은 약한 [COLOR_CITY_BLUE]툰드라[ENDCOLOR](+1[ICON_PRODUCTION], +1[ICON_PEACE]/[ICON_FLOWER]) 타일을 크게 지원합니다. 빠른 해군 증원(+25%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]해양 군사[ENDCOLOR])에 도움이 되고 도시에서 공격과 방어를 강화합니다(+10[ICON_STRENGTH]; 제력 +50; +1[ICON_SILVER_FIST]).'
WHERE Tag = 'TXT_KEY_WONDER_SOLOVIETSKY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_SOLOVIETSKY_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_SOLOVIETSKY_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]충성 완성[ENDCOLOR]; 지형: [COLOR_CYAN]툰드라[ENDCOLOR], [COLOR_CYAN]해안[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SOLOVIETSKY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]충성 완성[ENDCOLOR]; 지형: [COLOR_CYAN]툰드라[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SOLOVIETSKY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);		
----------------------------------------------------
-- Aqueduct of Padre Tembleque
INSERT INTO Language_en_US 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_TEMBLEQUE',			'Aqueduct of Padre Tembleque'),
			('TXT_KEY_WONDER_TEMBLEQUE_QUOTE',		'[NEWLINE]"Mexico is a mosaic of different realities and beauties."[NEWLINE] - Enrique Pena Nieto[NEWLINE]'),
			('TXT_KEY_WONDER_TEMBLEQUE_PEDIA',		'TODO'),
			('TXT_KEY_WONDER_TEMBLEQUE_HELP',		'+1 [ICON_FOOD] Food to Desert tiles in this City. All Aqueducts gain +1 [ICON_PRODUCTION] Production and +1 [ICON_PEACE] Faith. Converts 5% of [ICON_PEACE] Faith Purchase into [ICON_PRODUCTION] Production in your every City.[NEWLINE][NEWLINE]-1 [ICON_HAPPINESS_3] Unhappiness from [ICON_FOOD]/[ICON_PRODUCTION] Distress in you Empire.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Aqueduct of Padre Tembleque[ENDCOLOR] makes inhabitable places like [COLOR_CITY_BLUE]Desert[ENDCOLOR] prosperous again (+1[ICON_FOOD]/[ICON_FLOWER]), making people happy, because water is not as scarce as before (-1[ICON_HAPPINESS_3][ICON_HAPPINESS_3] from [ICON_FOOD]/[ICON_PRODUCTION]) and all of that is thanks to religious devotion of only one visionary monk (+1[ICON_PRODUCTION], +1[ICON_PEACE]/all [COLOR_YIELD_FOOD]Aqueducts[ENDCOLOR]; 5%[ICON_PEACE][ICON_PEACE] Faith Purchase into [ICON_PRODUCTION]).'
WHERE Tag = 'TXT_KEY_WONDER_TEMBLEQUE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_TEMBLEQUE_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_TEMBLEQUE_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Desert[ENDCOLOR]; [COLOR_NEGATIVE_TEXT]Coast[ENDCOLOR]; Feature: [COLOR_CYAN]Fresh Water[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_TEMBLEQUE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Feature: [COLOR_CYAN]Fresh Water[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_TEMBLEQUE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

INSERT INTO Language_ko_KR 
			(Tag,									Text) 
VALUES		('TXT_KEY_BUILDING_TEMBLEQUE',			'파드레 템블레퀘 송수로'),
			('TXT_KEY_WONDER_TEMBLEQUE_QUOTE',		'[NEWLINE]"멕시코는 다양한 현실과 아름다움의 모자이크이다."[NEWLINE] - 엔리케 페냐 니에토[NEWLINE]'),
			('TXT_KEY_WONDER_TEMBLEQUE_PEDIA',		'TODO'),
			('TXT_KEY_WONDER_TEMBLEQUE_HELP',		'이 도시의 사막 타일에서 [ICON_FOOD]식량 +1을 제공합니다. 모든 송수로는 [ICON_PRODUCTION]생산 +1 [ICON_PEACE]신앙 +1을 제공합니다. 제국의 모든 도시에서 구매에 사용한 [ICON_PEACE]신앙의 5%를 [ICON_PRODUCTION]생산으로 전환합니다. 제국의 전반적인 [ICON_FOOD]/[ICON_PRODUCTION]곤경 [ICON_HAPPINESS_3]불행이 1만큼 감소합니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]파드레 템블레퀘 송수로[ENDCOLOR]는 [COLOR_CITY_BLUE]사막[ENDCOLOR]과 같이 사람이 살 수 있는 곳을 다시 번성하게 만들고(+1[ICON_FOOD]/[ICON_FLOWER]) 물이 예전처럼 부족하지 않기 때문에 사람들을 행복하게 합니다(-1 [ICON_HAPPINESS_3][ICON_FOOD]/[ICON_PRODUCTION]의 [ICON_HAPPINESS_3]) 그리고 그 모든 것은 단 한 명의 환상적인 수도사의 종교적 헌신 덕분입니다(+1[ICON_PRODUCTION], +1[ICON_PEACE]/모든 [COLOR_YIELD_FOOD]송수로[ENDCOLOR]; [ICON_PEACE][ICON_PEACE]신앙 구매의 5%를 [ICON_PRODUCTION]로).'
WHERE Tag = 'TXT_KEY_WONDER_TEMBLEQUE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_TEMBLEQUE_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_TEMBLEQUE_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]사막[ENDCOLOR]; [COLOR_NEGATIVE_TEXT]해안을 피할 것[ENDCOLOR]; 특징: [COLOR_CYAN]담수[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_TEMBLEQUE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특징: [COLOR_CYAN]담수[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_TEMBLEQUE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Globe Theater
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Globe Theater[ENDCOLOR] unites all artistic proffessions in one wonder (+2[ICON_GOLDEN_AGE]/[ICON_GREAT_ARTIST][ICON_GREAT_ARTIST], [ICON_GREAT_WRITER][ICON_GREAT_WRITER], [ICON_GREAT_MUSICIAN][ICON_GREAT_MUSICIAN]), but its much stronger focus on literature is obvious ([COLOR_YIELD_GOLD]free [ICON_GREAT_WRITER][ENDCOLOR]; +2[ICON_GREAT_WORK] if themed: [ICON_GOLD]). This wonder is so influencial, that people''s tastes change accoridng to your will (-1[ICON_HAPPINESS_3] Boredom; -1[ICON_HAPPINESS_3][ICON_HAPPINESS_3] Urbanization).'
WHERE Tag = 'TXT_KEY_WONDER_GLOBE_THEATER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_GLOBE_THEATER_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_GLOBE_THEATER_HELP';
				
UPDATE Language_en_US SET Text = 'Feature: [COLOR_CYAN]River[ENDCOLOR]; Building: [COLOR_CYAN]Amphitheater[ENDCOLOR], [COLOR_CYAN]Baths[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GLOBE_THEATER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Building: [COLOR_CYAN]Amphitheater[ENDCOLOR], [COLOR_CYAN]Baths[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GLOBE_THEATER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]글로브 극장[ENDCOLOR]은 모든 예술적 직업을 하나의 불가사의(+2[ICON_GOLDEN_AGE]/[ICON_GREAT_ARTIST][ICON_GREAT_ARTIST], [ICON_GREAT_WRITER][ICON_GREAT_WRITER], [ICON_GREAT_MUSICIAN][ICON_GREAT_MUSICIAN])로 통합하지만 문학에서 훨신 강합니다([COLOR_YIELD_GOLD]무료 [ICON_GREAT_WRITER][ENDCOLOR]; +2[ICON_GREAT_WORK] 테마보너스: [ICON_GOLD]). 이 불가사의는 매우 영향력이 커서 사람들의 취향이 당신의 의지에 따라 변합니다(-1[ICON_HAPPINESS_3] 무료; -1[ICON_HAPPINESS_3][ICON_HAPPINESS_3] 도시화).'
WHERE Tag = 'TXT_KEY_WONDER_GLOBE_THEATER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_GLOBE_THEATER_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_GLOBE_THEATER_HELP';
				
UPDATE Language_ko_KR SET Text = '특징: [COLOR_CYAN]강[ENDCOLOR]; 건물: [COLOR_CYAN]원형극장[ENDCOLOR], [COLOR_CYAN]목욕탕[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GLOBE_THEATER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '건물: [COLOR_CYAN]원형극장[ENDCOLOR], [COLOR_CYAN]목욕탕[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GLOBE_THEATER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Chichen Itza
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Chichen Itza[ENDCOLOR] makes your golden ages much more important (+50%[ICON_GOLDEN_AGE] Length), and your citizens much happier (-10%[ICON_HAPPINESS_3][ICON_HAPPINESS_3]). Build it, and your people will awe you.'
WHERE Tag = 'TXT_KEY_WONDER_TAJ_MAHAL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,									Text) 
SELECT		'TXT_KEY_WONDER_TAJ_MAHAL_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_TAJ_MAHAL_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Plains[ENDCOLOR]; Plot: [COLOR_CYAN]Flat[ENDCOLOR]; Feature: [COLOR_CYAN]Forest[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_TAJ_MAHAL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Plains[ENDCOLOR]; Plot: [COLOR_CYAN]Flat[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_TAJ_MAHAL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]치첸이트사[ENDCOLOR]는 황금기를 훨씬 더 중요하게 만들고(+50%[ICON_GOLDEN_AGE] 길이) 시민들을 훨씬 더 행복하게 만듭니다(-10%[ICON_HAPPINESS_3][ICON_HAPPINESS_3]). 당신의 백성이 당신을 경외할 것입니다.'
WHERE Tag = 'TXT_KEY_WONDER_TAJ_MAHAL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,									Text) 
SELECT		'TXT_KEY_WONDER_TAJ_MAHAL_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_TAJ_MAHAL_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]평원[ENDCOLOR]; 위치: [COLOR_CYAN]평지[ENDCOLOR]; 특징: [COLOR_CYAN]숲[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_TAJ_MAHAL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]평원[ENDCOLOR]; 위치: [COLOR_CYAN]평지[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_TAJ_MAHAL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Himeji Castle
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Himeji Castle[ENDCOLOR] turns typical [COLOR_YIELD_FOOD]Castle[ENDCOLOR] ([ICON_STRENGTH]; [ICON_SILVER_FIST]; [ICON_PRODUCTION]; [ICON_HAPPINESS_3]; [ICON_GREAT_WORK]) into impenetrable fortress (+10%[ICON_STRENGTH][ICON_STRENGTH]). Moreover, you can create bigger army (+5[ICON_SILVER_FIST]) and all units on your own land receive combat bonuses ([COLOR_WATER_TEXT]Himeji Castle[ENDCOLOR]/[COLOR_YIELD_GOLD]Military[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_HIMEJI_CASTLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_HIMEJI_CASTLE_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_HIMEJI_CASTLE_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR]; Feature: [COLOR_CYAN]Forest[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HIMEJI_CASTLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HIMEJI_CASTLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]히메지 성[ENDCOLOR]은 일반적인 [COLOR_YIELD_FOOD]성형 요새[ENDCOLOR]([ICON_STRENGTH]; [ICON_SILVER_FIST]; [ICON_HAPPINESS_3];)을 뚫을 수 없는 요새로 바꿉니다(+10%[ICON_STRENGTH][ICON_STRENGTH]). 또한 더 큰 군대를 만들 수 있으며(+5[ICON_SILVER_FIST]) 자신의 땅에 있는 모든 유닛은 전투 보너스를 받습니다([COLOR_WATER_TEXT]히메지 성[ENDCOLOR]/[COLOR_YIELD_GOLD]군사[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_HIMEJI_CASTLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_HIMEJI_CASTLE_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_HIMEJI_CASTLE_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 위치: [COLOR_CYAN]언덕[ENDCOLOR]; 특징: [COLOR_CYAN]숲[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HIMEJI_CASTLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 위치: [COLOR_CYAN]언덕[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HIMEJI_CASTLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Leaning Tower of Pisa
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Leaning Tower of Piza[ENDCOLOR] brings attention of many influential nobles, who want to cooperate with you ([COLOR_YIELD_GOLD]free [ICON_GREAT_PEOPLE][ENDCOLOR]). Their final destination is not only this city (+25%[ICON_GREAT_PEOPLE]), but also all others in your empire (+10%[ICON_GREAT_PEOPLE][ICON_GREAT_PEOPLE]).'
WHERE Tag = 'TXT_KEY_WONDER_LEANING_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_LEANING_TOWER_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_LEANING_TOWER_HELP';
				
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Flat[ENDCOLOR]; Feature: [COLOR_CYAN]Water[ENDCOLOR], [COLOR_CYAN]Marsh[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_LEANING_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Feature: [COLOR_CYAN]Water[ENDCOLOR], [COLOR_CYAN]Marsh[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_LEANING_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]피사의 사탑[ENDCOLOR]은 당신과 협력하고자 하는 많은 영향력 있는 귀족들의 관심을 끌고 있습니다([COLOR_YIELD_GOLD]무료 [ICON_GREAT_PEOPLE][ENDCOLOR]). 그들의 최종 목적지는 이 도시(+25%[ICON_GREAT_PEOPLE])뿐만 아니라 제국의 다른 모든 도시(+10%[ICON_GREAT_PEOPLE][ICON_GREAT_PEOPLE])입니다.'
WHERE Tag = 'TXT_KEY_WONDER_LEANING_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_LEANING_TOWER_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_LEANING_TOWER_HELP';
				
UPDATE Language_ko_KR SET Text = '위치: [COLOR_CYAN]평지[ENDCOLOR]; 특징: [COLOR_CYAN]물[ENDCOLOR], [COLOR_CYAN]습지[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_LEANING_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특징: [COLOR_CYAN]물[ENDCOLOR], [COLOR_CYAN]습지[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_LEANING_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Porcelain Tower
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Porcelain Tower[ENDCOLOR] is a wonderful scientific building which improves education of your citizens (-1[ICON_HAPPINESS_3] Illiteracy), invites new great people to the city ([COLOR_YIELD_GOLD]free [ICON_GREAT_SCIENTIST][ENDCOLOR]; +2[ICON_GREAT_SCIENTIST]) and makes use of overall research you produce (+50%[ICON_RESEARCH]/[ICON_RESEARCH] RA or +25%[ICON_SCIENCE] if [ICON_RESEARCH] RAs are disabled).'
WHERE Tag = 'TXT_KEY_WONDER_PORCELAIN_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_PORCELAIN_TOWER_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_PORCELAIN_TOWER_HELP';
				
UPDATE Language_en_US SET Text = 'Feature: [COLOR_CYAN]River[ENDCOLOR]; Player: [COLOR_CYAN]2 [ICON_CITY_STATE] Allies[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PORCELAIN_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PORCELAIN_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]영곡탑[ENDCOLOR]은 시민들의 교육을 개선하고(-1[ICON_HAPPINESS_3] 문맹), 새로운 위대한 사람들을 도시로 초대하고([COLOR_YIELD_GOLD]무료 [ICON_GREAT_SCIENTIST][ENDCOLOR], +2[ICON_GREAT_SCIENTIST]) 당신이 생산하는 전체 연구를 활용합니다(+50%[ICON_RESEARCH]/[ICON_RESEARCH]연구 협정 또는 [ICON_RESEARCH]연구 협정이 비활성화된 경우 +25%[ICON_SCIENCE]).'
WHERE Tag = 'TXT_KEY_WONDER_PORCELAIN_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_PORCELAIN_TOWER_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_PORCELAIN_TOWER_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]강[ENDCOLOR]; 플레이어: [COLOR_CYAN][ICON_CITY_STATE]동맹 도시국가 2개[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PORCELAIN_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]강[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PORCELAIN_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Taj Mahal
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Taj Mahal[ENDCOLOR] maximizes number of golden ages you enter (Start [ICON_GOLDEN_AGE]; +1[ICON_GOLDEN_AGE]/2[ICON_CITIZEN]) and benefits from multiple religions in your city (+3[ICON_RESEARCH], +3[ICON_CULTURE], +3[ICON_PEACE]/[ICON_RELIGION]). Do not let them go away!'
WHERE Tag = 'TXT_KEY_WONDER_PYRAMIDS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_PYRAMIDS_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_PYRAMIDS_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_NEGATIVE_TEXT]Coast[ENDCOLOR]; Plot: [COLOR_CYAN]Flat[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PYRAMIDS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Flat[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PYRAMIDS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]타지마할[ENDCOLOR]은 진입한 황금기 수를 최대화하고([ICON_GOLDEN_AGE] 시작; +1[ICON_GOLDEN_AGE]/2[ICON_CITIZEN]) 도시의 여러 종교로부터 혜택을 받습니다(+3[ICON_RESEARCH], +3[ ICON_CULTURE], +3[ICON_PEACE]/[ICON_RELIGION]). 그들이 떠나지 못하게 하십시오!'
WHERE Tag = 'TXT_KEY_WONDER_PYRAMIDS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_PYRAMIDS_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_PYRAMIDS_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_NEGATIVE_TEXT]해안을 피할 것[ENDCOLOR]; 위치: [COLOR_CYAN]평지[ENDCOLOR]; 특징: [COLOR_CYAN]강[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PYRAMIDS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '위치: [COLOR_CYAN]평지[ENDCOLOR]; 특징: [COLOR_CYAN]강[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PYRAMIDS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Uffizi
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Uffizi[ENDCOLOR] gallery is perfect spot for any talented artist ([COLOR_YIELD_GOLD]free [ICON_GREAT_ARTISTS][ENDCOLOR]; +3[ICON_GREAT_WORK] if themed: [ICON_CULTURE]; +1[ICON_CULTURE]/[ICON_GREAT_WORK][ICON_GREAT_WORK]). This wonder also resolves almost all problems with urbanization in your empire (-1[ICON_HAPPINESS_3][ICON_HAPPINESS_3] Urbanization)'
WHERE Tag = 'TXT_KEY_WONDER_UFFIZI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_UFFIZI_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_UFFIZI_HELP';
				
UPDATE Language_en_US SET Text = 'Feature: [COLOR_CYAN]River[ENDCOLOR]; Great Works: [COLOR_CYAN]3 [ICON_GREAT_WORK] GW of Art[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_UFFIZI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = ''||Text WHERE Tag ='TXT_KEY_WONDER_UFFIZI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]우피치[ENDCOLOR] 미술관은 재능 있는 예술가에게 완벽한 장소입니다([COLOR_YIELD_GOLD]무료 [ICON_GREAT_ARTISTS][ENDCOLOR]; +3[ICON_GREAT_WORK] 테마보너스: [ICON_CULTURE]; +1[ICON_CULTURE]/[ICON_GREAT_WORK][ICON_GREAT_WORK]). 이 불가사의는 또한 제국의 도시화와 관련된 거의 모든 문제를 해결합니다(-1[ICON_HAPPINESS_3][ICON_HAPPINESS_3] 도시화).'
WHERE Tag = 'TXT_KEY_WONDER_UFFIZI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_UFFIZI_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_UFFIZI_HELP';
				
UPDATE Language_ko_KR SET Text = '특징: [COLOR_CYAN]강[ENDCOLOR]; 걸작: [COLOR_CYAN][ICON_GREAT_WORK]걸작 예술품 3개[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_UFFIZI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = ''||Text WHERE Tag ='TXT_KEY_WONDER_UFFIZI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Sistine Chapel
UPDATE Language_en_US
SET Text = 'Filled with wonderful frescos (+2[ICON_GREAT_WORK] if themed: [ICON_CULTURE], [ICON_PEACE]) beautiful [COLOR_YIELD_FOOD]Sistine Chapel[ENDCOLOR] is literally an artistic bomb for your empire (+10%[ICON_CULTURE][ICON_CULTURE]). Make sure to built it, if you aim for a cultural victory.'
WHERE Tag = 'TXT_KEY_WONDER_SISTINE_CHAPEL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_SISTINE_CHAPEL_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_SISTINE_CHAPEL_HELP';
				
UPDATE Language_en_US SET Text = 'Building: [COLOR_CYAN]Artist''s Guild[ENDCOLOR]; Player: [COLOR_CYAN]Founded Religion[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SISTINE_CHAPEL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Building: [COLOR_CYAN]Artist''s Guild[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SISTINE_CHAPEL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR
SET Text = '멋진 프레스코화로 가득 차 있는(+2[ICON_GREAT_WORK] 테마보너스: [ICON_CULTURE], [ICON_PEACE]) 아름다운 [COLOR_YIELD_FOOD]시스티나 성당[ENDCOLOR]은 말 그대로 당신의 제국을 위한 예술적 폭탄입니다(+10%[ICON_CULTURE][ICON_CULTURE]). 문화적 승리를 목표로 한다면 반드시 건설하십시오.'
WHERE Tag = 'TXT_KEY_WONDER_SISTINE_CHAPEL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,										Text) 
SELECT		'TXT_KEY_WONDER_SISTINE_CHAPEL_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_SISTINE_CHAPEL_HELP';
				
UPDATE Language_ko_KR SET Text = '건물: [COLOR_CYAN]예술가 길드[ENDCOLOR]; 플레이어: [COLOR_CYAN]종교 창시[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SISTINE_CHAPEL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '건물: [COLOR_CYAN]예술가 길드[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SISTINE_CHAPEL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Summer Palace
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Sumer Palace[ENDCOLOR] is another wonder fully focused on strengthening your diplomatic power ([COLOR_WATER_TEXT]Nobility[ENDCOLOR]/[COLOR_YIELD_GOLD]Diplomatic[ENDCOLOR]) and improving construction rate of your negotiators (+20%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]Diplomatic[ENDCOLOR]). It also upgrades [COLOR_YIELD_FOOD]Chanceries[ENDCOLOR] (+3[ICON_GOLD][ICON_GOLD]; +1[ICON_CULTURE][ICON_CULTURE]) in your empire and creates new source of [COLOR_GREY]Paper[ENDCOLOR] (+1[ICON_RES_PAPER]).'
WHERE Tag = 'TXT_KEY_BUILDING_SUMMER_PALACE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,										Text) 
SELECT		'TXT_KEY_BUILDING_SUMMER_PALACE_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_BUILDING_SUMMER_PALACE_HELP';
				
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Hill[ENDCOLOR]; Feature: [COLOR_CYAN]Forest[ENDCOLOR], [COLOR_CYAN]Lake[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_SUMMER_PALACE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Hill[ENDCOLOR]; Feature: [COLOR_CYAN]Lake[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_SUMMER_PALACE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]이화원[ENDCOLOR]은 외교력([COLOR_WATER_TEXT]귀족[ENDCOLOR]/[COLOR_YIELD_GOLD]외교[ENDCOLOR])을 강화하고 협상가의 생산 속도(+20%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]외교[ENDCOLOR])를 증가시킵니다. 또한 제국에서 [COLOR_YIELD_FOOD]외교 청사[ENDCOLOR](+3[ICON_GOLD][ICON_GOLD]; +1[ICON_CULTURE][ICON_CULTURE])를 향상시키고 새로운 [COLOR_GREY]종이[ENDCOLOR](+1[ICON_RES_PAPER] 자원을 생성합니다. ).'
WHERE Tag = 'TXT_KEY_BUILDING_SUMMER_PALACE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,										Text) 
SELECT		'TXT_KEY_BUILDING_SUMMER_PALACE_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_SUMMER_PALACE_HELP';
				
UPDATE Language_ko_KR SET Text = '위치: [COLOR_CYAN]언덕[ENDCOLOR]; 특징: [COLOR_CYAN]숲[ENDCOLOR], [COLOR_CYAN]호수[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_SUMMER_PALACE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '위치: [COLOR_CYAN]언덕[ENDCOLOR]; 특징: [COLOR_CYAN]호수[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_SUMMER_PALACE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Red Fort
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Red Fort[ENDCOLOR] is an ideal choice for a militaristic leader. Increased global army limit (+5% of [ICON_CITIZEN][ICON_CITIZEN] as [ICON_SILVER_FIST]), upgraded city''s offensive and defensive capabilities (+10%[ICON_RANGE_STRENGTH]; +1[ICON_SWAP]; +30[ICON_STRENGTH]; +100 HP), brand new [COLOR_YIELD_FOOD]Arsenal[ENDCOLOR] ([ICON_STRENGTH]; [ICON_RANGE_STRENGTH]; [ICON_SILVER_FIST]; [ICON_SPY]; [ICON_HAPPINESS_3]) as well as support of engineers ([COLOR_YIELD_GOLD]free [ICON_GREAT_ENGINEER][ENDCOLOR]) and scientists (+1[ICON_GREAT_SCIENTIST]) will make from you unquestionable leader of the world.'
WHERE Tag = 'TXT_KEY_WONDER_RED_FORT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'Requires completion of [COLOR_MAGENTA]Fealty[ENDCOLOR] Branch. ', '') WHERE Tag ='TXT_KEY_WONDER_RED_FORT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_RED_FORT_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_RED_FORT_HELP';

UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Fealty Finisher[ENDCOLOR]; Terrain: [COLOR_NEGATIVE_TEXT]Coast[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_RED_FORT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);				
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Fealty Finisher[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_RED_FORT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]붉은 요새[ENDCOLOR]는 군국주의 지도자에게 이상적인 선택입니다. 전반적인 군대의 한계 증가([ICON_CITIZEN][ICON_CITIZEN]의 5%만큼 [ICON_SILVER_FIST]로), 도시의 공격 및 방어 능력 향상(+10%[ICON_RANGE_STRENGTH]; +1[ICON_SWAP]; +30[ICON_STRENGTH]; +100 체력), 새로운 [COLOR_YIELD_FOOD]군수창고[ENDCOLOR]([ICON_STRENGTH]; [ICON_RANGE_STRENGTH]; [ICON_SILVER_FIST]; [ICON_HAPPINESS_3]) 및 기술자([COLOR_YIELD_GOLD]무료 [ICON_GREAT_ENGINEER][ENDCOLOR])와 과학자(+1[ICON_GREAT_SCIENTIST])의 지원은 의심할 여지 없이 당신을 세계의 지도자로 만들 것 입니다.'
WHERE Tag = 'TXT_KEY_WONDER_RED_FORT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, '[COLOR_MAGENTA]충성[ENDCOLOR] 정책을 완성해야 건설할 수 있습니다. ', '') WHERE Tag ='TXT_KEY_WONDER_RED_FORT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_RED_FORT_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_RED_FORT_HELP';

UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]충성 완성[ENDCOLOR]; 지형: [COLOR_NEGATIVE_TEXT]해안을 피할 것[ENDCOLOR]; 특징: [COLOR_CYAN]강[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_RED_FORT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]충성 완성[ENDCOLOR]; 특징: [COLOR_CYAN]강[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_RED_FORT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
----------------------------------------------------
-- Museum Island
INSERT INTO Language_en_US 
			(Tag,												Text)
VALUES		('TXT_KEY_BUILDING_MUSEUM_ISLAND',					'Museum Island'),
			('TXT_KEY_WONDER_MUSEUM_ISLAND_QUOTE',				'[NEWLINE]"Berlin is rather a part of the world than a city."[NEWLINE] - Jean Paul[NEWLINE]'),
			('TXT_KEY_WONDER_MUSEUM_ISLAND_PEDIA',				'Established in 1797, this museum complex in Central Berlin consists of 5 museums, each known for their extensive amount of holdings.'),
			('TXT_KEY_THEMING_BONUS_MUSEUM_ISLAND_COMPOSITION',	'Wonders of Museumsinsel'),
			('TXT_KEY_THEMING_BONUS_MUSEUM_ISLAND_ERAS',		'Wonders of all time'),
			('TXT_KEY_THEMING_BONUS_MUSEUM_ISLAND_OTHERS',		'Wonders of all nations'),
			('TXT_KEY_THEMING_BONUS_MUSEUM_ISLAND_ART',			'Artistic gallery'),
			('TXT_KEY_THEMING_BONUS_MUSEUM_ISLAND_HELP',		'To maximize your bonus, make sure all the Great Work Slots are all filled with Art created by Players different than the owner, and from different Eras.'),
			('TXT_KEY_WONDER_MUSEUM_ISLAND_HELP',				'Grants [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Museum. +50% generation of [ICON_GREAT_ARTIST] Great Artists in Empire. +2 [ICON_TOURISM] Tourism to all Museums. Has 4 slots for [ICON_GREAT_WORK] Great Works of Art. +5 [ICON_RESEARCH] Science, [ICON_CULTURE] Culture and [ICON_TOURISM] Tourism if [COLOR_POSITIVE_TEXT]Themed[ENDCOLOR].');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Museum Island[ENDCOLOR] is the biggest composition of artistic work ever founded (+4[ICON_GREAT_WORK] if themed: [ICON_RESEARCH], [ICON_CULTURE], [ICON_TOURISM]). It is an incentive for anyone eager to become an artist (+50%[ICON_GREAT_ARTIST][ICON_GREAT_ARTIST]), whose art can be stored in one of recently created [COLOR_YIELD_FOOD]Museums[ENDCOLOR] ([ICON_CULTURE]; [ICON_GREAT_WORK]; [ICON_HAPPINESS_3]; [ICON_GREAT_ARTIST]; [ICON_GOLD]) (+2[ICON_TOURISM]).'
WHERE Tag = 'TXT_KEY_WONDER_MUSEUM_ISLAND_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_MUSEUM_ISLAND_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_MUSEUM_ISLAND_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Artistry Finisher[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR]; Great Works: [COLOR_CYAN]4 [ICON_GREAT_WORK] GW of Art[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MUSEUM_ISLAND_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Artistry Finisher[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MUSEUM_ISLAND_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	

INSERT INTO Language_ko_KR 
			(Tag,												Text)
VALUES		('TXT_KEY_BUILDING_MUSEUM_ISLAND',					'박물관 섬'),
			('TXT_KEY_WONDER_MUSEUM_ISLAND_QUOTE',				'[NEWLINE]"베를린은 도시라기보다는 오히려 세계의 일부이다."[NEWLINE] - 장 파울[NEWLINE]'),
			('TXT_KEY_WONDER_MUSEUM_ISLAND_PEDIA',				'1797년에 설립된 이 박물관 단지는 중앙 베를린에 있는 5개의 박물관으로 구성되어 있으며, 각각의 박물관은 방대한 양의 소장품으로 알려져 있습니다.'),
			('TXT_KEY_THEMING_BONUS_MUSEUM_ISLAND_COMPOSITION',	'박물관 섬의 경이로움'),
			('TXT_KEY_THEMING_BONUS_MUSEUM_ISLAND_ERAS',		'지금까지의 경이로움'),
			('TXT_KEY_THEMING_BONUS_MUSEUM_ISLAND_OTHERS',		'만국의 경이로움'),
			('TXT_KEY_THEMING_BONUS_MUSEUM_ISLAND_ART',			'미술관'),
			('TXT_KEY_THEMING_BONUS_MUSEUM_ISLAND_HELP',		'보너스를 극대화하려면, 모든 걸작 슬롯을 다른 문명이 다른 시대에 만든 걸작 에술품으로 채워야 합니다.'),
			('TXT_KEY_WONDER_MUSEUM_ISLAND_HELP',				'무료 [COLOR_POSITIVE_TEXT]박물관[ENDCOLOR]을 제공합니다. 제국의 모든 도시에서 [ICON_GREAT_ARTIST]위대한 예술가 생성률이 +50% 상승합니다. 제국의 모든 박물관에서 [ICON_TOURISM]관광 +2를 제공합니다. [ICON_GREAT_WORK]걸작 슬롯 4개를 제공합니다. [NEWLINE][NEWLINE]테마보너스: [ICON_RESEARCH]과학 +5, [ICON_CULTURE]문화 +5, [ICON_TOURISM]관광 +5');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]박물관 섬[ENDCOLOR]은 지금까지 설립된 예술 작품 중 가장 큰 구성입니다(+4[ICON_GREAT_WORK] 테마보너스: [ICON_RESEARCH], [ICON_CULTURE], [ICON_TOURISM]).최근 생성된 [COLOR_YIELD_FOOD]박물관[ENDCOLOR]([ICON_CULTURE]; [ICON_GREAT_WORK]; [ICON_HAPPINESS_3]; [ICON_GREAT_ARTIST]; [ICON_GOLD]) (+2[ICON_TOURISM])은 예술가가 되고자 하는 사람(+50%[ICON_GREAT_ARTIST][ICON_GREAT_ARTIST])을 위한 장려책입니다.'
WHERE Tag = 'TXT_KEY_WONDER_MUSEUM_ISLAND_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_MUSEUM_ISLAND_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_MUSEUM_ISLAND_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]미학 완성[ENDCOLOR]; 특징: [COLOR_CYAN]강[ENDCOLOR]; 걸작: [COLOR_CYAN][ICON_GREAT_WORK]걸작 예술품 4개[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MUSEUM_ISLAND_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]미학 완성[ENDCOLOR]; 특징: [COLOR_CYAN]강[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MUSEUM_ISLAND_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	
----------------------------------------------------
-- Siku Quanshu
INSERT INTO Language_en_US 
			(Tag,												Text)
VALUES		('TXT_KEY_BUILDING_SIKU_QUANSHU',					'Siku Quanshu'),
			('TXT_KEY_WONDER_SIKU_QUANSHU_QUOTE',				'[NEWLINE]"I have always imagined that Paradise will be a kind of a Library."[NEWLINE] - Jorge Luis Borges[NEWLINE]'),
			('TXT_KEY_WONDER_SIKU_QUANSHU_PEDIA',				'TODO'),
			('TXT_KEY_THEMING_BONUS_SIKU_QUANSHU_COMPOSITION',	'Written legacy of all dynasties'),
			('TXT_KEY_THEMING_BONUS_SIKU_QUANSHU_ERAS',			'Literature of all time'),
			('TXT_KEY_THEMING_BONUS_SIKU_QUANSHU_OWNER',		'Literature from people'),
			('TXT_KEY_THEMING_BONUS_SIKU_QUANSHU_WRITINGS',		'Interesting composition of writings'),
			('TXT_KEY_THEMING_BONUS_SIKU_QUANSHU_HELP',			'To maximize your bonus, make sure all the Great Work Slots are all filled with Literature created by You, and from different Eras.'),
			('TXT_KEY_WONDER_SIKU_QUANSHU_HELP',				'+1 [ICON_RESEARCH] Science from Writers in your Empire. +2 Writer slots. Has 4 slots for [ICON_GREAT_WORK] Great Works of Literature. +10 [ICON_RESEARCH] Science and [ICON_CULTURE] Culture if [COLOR_POSITIVE_TEXT]Themed[ENDCOLOR]. All [ICON_GREAT_WORK] Great Works in the Empire receive +1 [ICON_RESEARCH] Science and +1 [ICON_CULTURE] Culture. -1 [ICON_HAPPINESS_3] Unhappiness from [ICON_CULTURE] Illiteracy.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Siku Quanshu[ENDCOLOR] holds knowledge, creations and history of your people (+4[ICON_GREAT_WORK] if themed: [ICON_RESEARCH], [ICON_CULTURE]). Each one of them has now increased value (+1[ICON_RESEARCH], +1[ICON_CULTURE]/[ICON_GREAT_WORK][ICON_GREAT_WORK]) and can be used by competent people for better good (+2 slots for [ICON_GREAT_WRITER]; +1[ICON_RESEARCH]/[ICON_GREAT_WRITER][ICON_GREAT_WRITER]). Also your citizens will be able to enjoy them in their free time (-1[ICON_HAPPINESS_3] Illiteracy).'
WHERE Tag = 'TXT_KEY_WONDER_SIKU_QUANSHU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_SIKU_QUANSHU_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_SIKU_QUANSHU_HELP';
				
UPDATE Language_en_US SET Text = 'Great Works: [COLOR_CYAN]4 [ICON_GREAT_WORK] GW of Literature[ENDCOLOR]; Player: [COLOR_CYAN]7 Cities[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SIKU_QUANSHU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_en_US SET Text = ''||Text WHERE Tag ='TXT_KEY_WONDER_SIKU_QUANSHU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);	

INSERT INTO Language_ko_KR 
			(Tag,												Text)
VALUES		('TXT_KEY_BUILDING_SIKU_QUANSHU',					'사고전서'),
			('TXT_KEY_WONDER_SIKU_QUANSHU_QUOTE',				'[NEWLINE]"나는 지상낙원이 일종의 도서관이 될 것이라고 항상 상상해왔다."[NEWLINE] - 호르헤 루이스 보르헤스[NEWLINE]'),
			('TXT_KEY_WONDER_SIKU_QUANSHU_PEDIA',				'TODO'),
			('TXT_KEY_THEMING_BONUS_SIKU_QUANSHU_COMPOSITION',	'모든 왕조의 문학 유산'),
			('TXT_KEY_THEMING_BONUS_SIKU_QUANSHU_ERAS',			'지금까지의 문학'),
			('TXT_KEY_THEMING_BONUS_SIKU_QUANSHU_OWNER',		'사람들로부터의 문학'),
			('TXT_KEY_THEMING_BONUS_SIKU_QUANSHU_WRITINGS',		'흥미로운 문학 작품'),
			('TXT_KEY_THEMING_BONUS_SIKU_QUANSHU_HELP',			'보너스를 극대화하려면, 모든 걸작 슬롯을 당신의 문명이 다른 시대에 만든 걸작 문학으로 채워야 합니다.'),
			('TXT_KEY_WONDER_SIKU_QUANSHU_HELP',				'제국의 모든 도시에서 작가 전문가로부터 [ICON_RESEARCH]과학 +1을 제공합니다. 이 도시에 작가 전문가 슬롯을 2개 제공합니다. [ICON_GREAT_WORK]걸작 문학 슬롯 4개를 제공합니다. 제국의 모든 [ICON_GREAT_WORK]걸작은 [ICON_RESEARCH]과학 +1 [ICON_CULTURE]문화 +1을 제공합니다. [ICON_RESEARCH]문맹으로 인한 [ICON_HAPPINESS_3]불행이 -1 감소합니다.[NEWLINE][NEWLINE]테마보너스: [ICON_RESEARCH]과학 +10 [ICON_CULTURE]문화 +10');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]사고전서[ENDCOLOR]는 사람들의 지식, 창작물 및 역사를 보유하고 있습니다(+4[ICON_GREAT_WORK] 테마보너스: [ICON_RESEARCH], [ICON_CULTURE]). 이제 각각의 가치가 증가했으며(+1[ICON_RESEARCH], +1[ICON_CULTURE]/[ICON_GREAT_WORK][ICON_GREAT_WORK]) 유능한 사람들이 더 나은 선을 위해 사용할 수 있습니다([ICON_GREAT_WRITER] 슬롯 +2, +1[ICON_RESEARCH]/[ICON_GREAT_WRITER][ICON_GREAT_WRITER]). 또한 시민은 자유 시간에 즐길 수 있습니다(-1[ICON_HAPPINESS_3] 문맹).'
WHERE Tag = 'TXT_KEY_WONDER_SIKU_QUANSHU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_SIKU_QUANSHU_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_SIKU_QUANSHU_HELP';
				
UPDATE Language_ko_KR SET Text = '걸작: [COLOR_CYAN][ICON_GREAT_WORK]걸작 문학 4개[ENDCOLOR]; 플레이어: [COLOR_CYAN]도시 7개[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SIKU_QUANSHU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);	
UPDATE Language_ko_KR SET Text = ''||Text WHERE Tag ='TXT_KEY_WONDER_SIKU_QUANSHU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Brooklyn Bridge
INSERT INTO Language_en_US 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_BROOKLYN',		'Brooklyn Bridge'),
			('TXT_KEY_WONDER_BROOKLYN_QUOTE',	'[NEWLINE]"Scientists are people who build the Brooklyn Bridge and then buy it."[NEWLINE] - William F. Buckley Jr.[NEWLINE]'),
			('TXT_KEY_WONDER_BROOKLYN_PEDIA',	'The Brooklyn Bridge is an iconic suspension bridge joining the boroughs of Manhattan and Brooklyn in New York City, New York across the East River. It was constructed between January 3 1870 and May 24, 1883 when it was opened to the public. The bridge is constructed in a Neo-Gothic style, as exhibited by the pointed arches in the towers.[NEWLINE][NEWLINE]  During scares of stability of the bridge in 1884, P.T. Barnum lead a herd of 21 elephants from his circus across the bridge. The bridge also has been used for exoduses of people following events such as 9/11, during which circumstances the bridge wobbled in a similar manner to the Millenium bridge in London.'),
			('TXT_KEY_WONDER_BROOKLYN_HELP',	'Grants [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] [ICON_DIPLOMAT] Great Diplomat and 100 [ICON_INFLUENCE] on construction. Gain 1 [COLOR_POSITIVE_TEXT]Additional[ENDCOLOR] [ICON_INTERNATIONAL_TRADE] Trade Route slot.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Brooklyn Bridge[ENDCOLOR] has huge influence on people from all corners of the world (100[ICON_INFLUENCE]/[ICON_CITY_STATE][ICON_CITY_STATE]). Additionally it hires new influencer ([COLOR_YIELD_GOLD]free [ICON_DIPLOMAT][ENDCOLOR]) and your word can be sent through recently established trade routes (+1[ICON_INTERNATIONAL_TRADE]).'
WHERE Tag = 'TXT_KEY_WONDER_BROOKLYN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_BROOKLYN_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_BROOKLYN_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR]; City: [COLOR_CYAN]25 Citizens[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BROOKLYN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BROOKLYN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_BROOKLYN',		'브루클린 대교'),
			('TXT_KEY_WONDER_BROOKLYN_QUOTE',	'[NEWLINE]"과학자들은 브루클린 대교를 건설하고 나서 그것을 사는 사람들이다."[NEWLINE] - 윌리엄 F. 버클리 주니어[NEWLINE]'),
			('TXT_KEY_WONDER_BROOKLYN_PEDIA',	'브루클린 대교는 뉴욕 맨해튼과 브루클린의 자치구를 연결하는 상징적인 현수교입니다. 이 다리는 1870년 1월 3일부터 건설되어 1883년 5월 24일에 대중들에게 공개되었습니다. 이 다리는 탑의 뾰족한 아치가 보여주는 신고딕 양식으로 건설되었습니다.[NEWLINE][NEWLINE] 1884년 다리의 안정성에 대한 두려움이 있는 동안, P.T. 바넘은 21마리의 코끼리 무리를 그의 서커스에서 다리를 가로질러 이끌었습니다. 이 다리는 또한 9/11과 같은 사건 이후 사람들의 탈출에 사용되었는데, 그 상황에서 다리는 런던의 밀레니엄 다리와 비슷한 방식으로 흔들렸습니다.'),
			('TXT_KEY_WONDER_BROOKLYN_HELP',	'건설 시 무료 [ICON_DIPLOMAT][COLOR_POSITIVE_TEXT]위대한 외교관[ENDCOLOR]을 제공하고 모든 도시국가에 대한 [ICON_INFLUENCE]영향력이 +100만큼 증가합니다. 추가 [ICON_INTERNATIONAL_TRADE][COLOR_POSITIVE_TEXT]교역로[ENDCOLOR] 슬롯 1개를 얻습니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]브루클린 다리[ENDCOLOR]는 전 세계 사람들에게 큰 영향을 미칩니다(100[ICON_INFLUENCE]/[ICON_CITY_STATE][ICON_CITY_STATE]). 또한 새로운 인플루언서([COLOR_YIELD_GOLD]무료 [ICON_DIPLOMAT][ENDCOLOR])를 고용하고 최근에 설립된 무역 경로(+1[ICON_INTERNATIONAL_TRADE])를 통해 소식을 전할 수 있습니다.'
WHERE Tag = 'TXT_KEY_WONDER_BROOKLYN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_BROOKLYN_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_BROOKLYN_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 특징: [COLOR_CYAN]강[ENDCOLOR]; 도시: [COLOR_CYAN]시민 25명 이상[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BROOKLYN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 특징: [COLOR_CYAN]강[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BROOKLYN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Trans-Siberian Railway
INSERT INTO Language_en_US 
			(Tag,											Text)
VALUES		('TXT_KEY_BUILDING_SIBERIAN_RAILWAY',			'Trans-Siberian Railway'),
			('TXT_KEY_WONDER_SIBERIAN_RAILWAY_QUOTE',		'[NEWLINE]"The Trans-Siberian is more than just a railway. It''s a journey into the psyche of modern Russia; a triumph of engineering; a movable feast through the largest - and, perhaps, most mysterious - nation on Earth."[NEWLINE] - Gavin Haines[NEWLINE]'),
			('TXT_KEY_WONDER_SIBERIAN_RAILWAY_PEDIA',		'TODO'),
			('TXT_KEY_WONDER_SIBERIAN_RAILWAY_HELP',		'+25% [ICON_WORKER] Improvement Construction Rate. All Land Units receive [COLOR_POSITIVE_TEXT]Trans-Siberian Railway[ENDCOLOR] promotion. +15% [ICON_GOLD] Gold from City Connections.[NEWLINE][NEWLINE]All [ICON_RES_COAL] Coal: +5 [ICON_GOLDEN_AGE] Golden Age Points.[NEWLINE]All [ICON_RES_OIL] Oil: +5 [ICON_GOLDEN_AGE] Golden Age Points.[NEWLINE]All [ICON_RES_ALUMINUM] Aluminum: +5 [ICON_GOLDEN_AGE] Golden Age Points.[NEWLINE]All [ICON_RES_URANIUM] Uranium: +5 [ICON_GOLDEN_AGE] Golden Age Points.'),
			('TXT_KEY_PROMOTION_SIBERIAN_RAILWAY',			'Trans-Siberian Railway'),
			('TXT_KEY_PROMOTION_SIBERIAN_RAILWAY_HELP',		'Double [ICON_MOVES]Movement [COLOR:255:230:85:255]on Tundra and Snow[ENDCOLOR].');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Trans-Siberian Railway[ENDCOLOR] makes journey through wild parts of Earth much easier ([COLOR_WATER_TEXT]Trans-Siberian Railway[ENDCOLOR]/[COLOR_YIELD_GOLD]Land[ENDCOLOR]). It greatly boosts your income (+15%[ICON_GOLD]/[ICON_CONNECTED][ICON_CONNECTED]) and productivity (+20%[ICON_WORKER] Worker Rate), as well as increases the value of all modern [COLOR_GREY]Strategic[ENDCOLOR] resources inside your territory (+5[ICON_GOLDEN_AGE]/[ICON_RES_COAL][ICON_RES_COAL],[ICON_RES_OIL][ICON_RES_OIL],[ICON_RES_ALUMINUM][ICON_RES_ALUMINUM],[ICON_RES_URANIUM][ICON_RES_URANIUM]).'
WHERE Tag = 'TXT_KEY_WONDER_SIBERIAN_RAILWAY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_SIBERIAN_RAILWAY_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_SIBERIAN_RAILWAY_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Tundra[ENDCOLOR], [COLOR_NEGATIVE_TEXT]Coast[ENDCOLOR]; Building: [COLOR_CYAN]Train Station[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SIBERIAN_RAILWAY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Tundra[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SIBERIAN_RAILWAY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

INSERT INTO Language_ko_KR 
			(Tag,											Text)
VALUES		('TXT_KEY_BUILDING_SIBERIAN_RAILWAY',			'시베리아 횡단 철도'),
			('TXT_KEY_WONDER_SIBERIAN_RAILWAY_QUOTE',		'[NEWLINE]"시베리아 횡단 철도은 단순한 철도 그 이상이다. 시베리아 횡단 철도는 현대 러시아의 정신으로의 여행이고, 공학의 승리이며, 지구상에서 가장 크고, 아마도 가장 신비로운 나라를 통과하는 움직일 수 있는 잔치이다."[NEWLINE] - 가빈 하이네스[NEWLINE]'),
			('TXT_KEY_WONDER_SIBERIAN_RAILWAY_PEDIA',		'TODO'),
			('TXT_KEY_WONDER_SIBERIAN_RAILWAY_HELP',		'[ICON_WORKER]시설 건설 속도가 +25% 증가합니다. 모든 지상 유닛은 [COLOR_POSITIVE_TEXT]시베리아 횡단 철도[ENDCOLOR] 승급을 받습니다. 도시 연결에서 제공하는 [ICON_GOLD]골드가 +15% 증가합니다. 제국의 모든 [ICON_RES_COAL]석탄, [ICON_RES_OIL]석유, [ICON_RES_ALUMINUM]알루미늄, [ICON_RES_URANIUM]우라늄에서 [ICON_GOLDEN_AGE]황금기점수 +5를 제공합니다.'),
			('TXT_KEY_PROMOTION_SIBERIAN_RAILWAY',			'시베리아 횡단 철도'),
			('TXT_KEY_PROMOTION_SIBERIAN_RAILWAY_HELP',		'[COLOR:255:230:85:255]툰드라와 설원[ENDCOLOR]에서 [ICON_MOVES]이동력 2배');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]시베리아 횡단 철도[ENDCOLOR]를 사용하면 지구의 야생 지역을 훨씬 쉽게 통과할 수 있습니다([COLOR_WATER_TEXT]시베리아 횡단 철도[ENDCOLOR]/[COLOR_YIELD_GOLD]지상[ENDCOLOR]). 수입(+15%[ICON_GOLD]/[ICON_CONNECTED][ICON_CONNECTED])과 생산성(+20%[ICON_WORKER] 노동자 효율)을 크게 높일 뿐만 아니라 모든 최신 [COLOR_GREY]전략[ENDCOLOR] 자원 가치를 높입니다. (+5[ICON_GOLDEN_AGE]/[ICON_RES_COAL][ICON_RES_COAL],[ICON_RES_OIL][ICON_RES_OIL],[ICON_RES_ALUMINUM][ICON_RES_ALUMINUM],[ICON_RES_URANIUM][ICON_RES_URANIUM]).'
WHERE Tag = 'TXT_KEY_WONDER_SIBERIAN_RAILWAY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_SIBERIAN_RAILWAY_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_SIBERIAN_RAILWAY_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]툰드라[ENDCOLOR], [COLOR_NEGATIVE_TEXT]해안을 피할 것[ENDCOLOR]; 건물: [COLOR_CYAN]철도역[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SIBERIAN_RAILWAY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]툰드라[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SIBERIAN_RAILWAY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Panama Canal
INSERT INTO Language_en_US 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_PANAMA_CANAL',		'Panama Canal'),
			('TXT_KEY_WONDER_PANAMA_CANAL_QUOTE',	'[NEWLINE]"A stream cannot rise larger than its source"[NEWLINE] - Theodore Roosevelt[NEWLINE]'),
			('TXT_KEY_WONDER_PANAMA_CANAL_PEDIA',	'The Panama Canal is a manmade shipping lane located on the Panama Isthmus seperating the Pacific Ocean and Carribean Sea. The idea of a canal in the location was first proposed int he sixteenth century by Charles V, Holy Roman Emperor, who asked for a link to shorten the journey between Spain and their colony of Peru. In 1698 the Kingdom of Scotland launched a project to create an overland trade route in the area, which was abandoned due to inhospitiable conditions a year later.[NEWLINE][NEWLINE]  It was not until 1855 that a link was first established, the Panama Canal Railway, as a result of the 1849 discovery of Gold in the American state of California. This railway was used extensively in the American construction of the canal from 1904 to 1914. As opposed to the French plan of constructing a flat water canal, much like that of the Suez Canal, the American design featured a series of ship locks to rise the ships over a range that caused problems for the French design. The American design proved sucessful, and was opened on August 15, 1914. Railway cars had been used to transport approximately 152,910,972 cubic metres of excevations through the construction, while it had cost 27,500 lives across the whole project.'),
			('TXT_KEY_WONDER_PANAMA_CANAL_HELP',	'All Naval Units receive [COLOR_POSITIVE_TEXT]Panama Canal[ENDCOLOR] promotion. Sea [ICON_INTERNATIONAL_TRADE] Trade Routes gain +100% range and +3 [ICON_GOLD] Gold. +2 [ICON_GOLD] Gold to all Harbors and Seaports.'),
			('TXT_KEY_PROMOTION_PANAMA_CANAL',		'Panama Canal'),
			('TXT_KEY_PROMOTION_PANAMA_CANAL_HELP',	'+1[ICON_ARROW_RIGHT]Movement Point. +10 HP [COLOR:255:230:85:255]on Heal inside Friendly Territory[ENDCOLOR].');
			
UPDATE Language_en_US
SET Text = 'Important [COLOR_YIELD_FOOD]Panama Canal[ENDCOLOR] project strengthens your trade routes and allows for further voyages (+100% Sea [ICON_INTERNATIONAL_TRADE][ICON_INTERNATIONAL_TRADE] Range; +3[ICON_GOLD]/Sea [ICON_INTERNATIONAL_TRADE][ICON_INTERNATIONAL_TRADE]). All maritime buildings gain additional support (+2[ICON_GOLD]/all [COLOR_YIELD_FOOD]Harbors[ENDCOLOR], [COLOR_YIELD_FOOD]Seaports[ENDCOLOR]) and all naval units have increased mobility and endurance ([COLOR_WATER_TEXT]Panama Canal[ENDCOLOR]/[COLOR_YIELD_GOLD]Naval[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_PANAMA_CANAL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_PANAMA_CANAL_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_PANAMA_CANAL_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Isthmus on minimum 10-tile area[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PANAMA_CANAL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Isthmus on minimum 10-tile area[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PANAMA_CANAL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

INSERT INTO Language_ko_KR 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_PANAMA_CANAL',		'파나마 운하'),
			('TXT_KEY_WONDER_PANAMA_CANAL_QUOTE',	'[NEWLINE]"개울은 그것의 원천보다 더 크게 상승할 수 없다."[NEWLINE] - 시어도어 루스벨트[NEWLINE]'),
			('TXT_KEY_WONDER_PANAMA_CANAL_PEDIA',	'파나마 운하는 태평양과 카리브 해를 분리하는 파나마 지협에 위치한 인공 항로입니다. 그 장소에 운하에 대한 생각은 16세기에 신성 로마 제국 황제 찰스 5세에 의해 처음 제안되었습니다. 그는 스페인과 그들의 식민지 페루 사이의 짧은 여행을 위한 연결을 요청했습니다. 1698년 스코틀랜드 왕국은 이 지역에 육로 무역로를 만드는 프로젝트를 시작했지만, 1년 후 열악한 환경으로 인해 포기되었습니다.[NEWLINE][NEWLINE] 1849년 미국 캘리포니아 주에서 금이 발견된 결과, 1855년에야 파나마 운하 철도가 처음으로 연결되었습니다. 이 철도는 1904년부터 1914년까지 미국의 운하 건설에 광범위하게 사용되었습니다. 수에즈 운하의 그것과 마찬가지로 평평한 물 운하를 건설하려는 프랑스의 계획과 반대로, 미국의 설계는 프랑스의 설계에 문제를 야기한 범위에 걸쳐 배를 띄우기 위한 일련의 선박 잠금 장치를 특징으로 합니다. 미국의 디자인은 성공적이었고 1914년 8월 15일에 문을 열었습니다. 철도 차량은 공사를 통해 약 152,910,972 입방 미터의 우수한 양을 운송하는 데 사용되었으며, 전체 프로젝트에서 27,500명의 목숨을 앗아갔습니다.'),
			('TXT_KEY_WONDER_PANAMA_CANAL_HELP',	'모든 해군 유닛은 [COLOR_POSITIVE_TEXT]파나마 운하[ENDCOLOR] 승급을 받습니다. 해상 [ICON_INTERNATIONAL_TRADE]교역로의 범위가 +100% 증가하고 [ICON_GOLD]골드 +3을 제공합니다. 제국의 모든 항만과 항구에서 [ICON_GOLD]골드 +2를 제공합니다.'),
			('TXT_KEY_PROMOTION_PANAMA_CANAL',		'파나마 운하'),
			('TXT_KEY_PROMOTION_PANAMA_CANAL_HELP',	'[ICON_ARROW_RIGHT]이동력 +1[NEWLINE][COLOR:255:230:85:255]우호적인 영토에서 치유 시[ENDCOLOR] 체력 +10.');
			
UPDATE Language_ko_KR
SET Text = '중요한 [COLOR_YIELD_FOOD]파나마 운하[ENDCOLOR] 프로젝트는 무역로를 강화하고 더 많은 항해를 허용합니다(해상[ICON_INTERNATIONAL_TRADE][ICON_INTERNATIONAL_TRADE]범위 +100%, +3[ICON_GOLD]/해상[ICON_INTERNATIONAL_TRADE][ICON_INTERNATIONAL_TRADE]). 모든 해상 건물은 추가 지원을 받고(+2[ICON_GOLD]/모든 [COLOR_YIELD_FOOD]항구[ENDCOLOR], [COLOR_YIELD_FOOD]항구[ENDCOLOR]) 모든 해상 유닛은 이동성과 내구성이 증가합니다([COLOR_WATER_TEXT]파나마 운하[ENDCOLOR]/[COLOR_YIELD_GOLD]해양 군사[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_PANAMA_CANAL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_PANAMA_CANAL_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_PANAMA_CANAL_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]최소 10타일 면적의 지협[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PANAMA_CANAL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]최소 10타일 면적의 지협[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PANAMA_CANAL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Zocalo
INSERT INTO Language_en_US 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_ZOCALO',		'Zocalo'),
			('TXT_KEY_WONDER_ZOCALO_QUOTE',	'[NEWLINE]"The Zocalo is a magnificent space, at least four times the size of Trafalagar Square, with the National Palace on one side, the huge cathedral on the other, and in one corner part of the old Aztec City so brutally destroyed by Hernan Cortez and the Conquistadores."[NEWLINE] - Jeremy Corbyn[NEWLINE]'),
			('TXT_KEY_WONDER_ZOCALO_PEDIA',	'TODO'),
			('TXT_KEY_WONDER_ZOCALO_HELP',	'Grants [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] [ICON_DIPLOMAT] Great Diplomat. +1 [ICON_PEACE] Faith from Civil Servants in your Empire. +10% [ICON_PRODUCTION] Production towards Diplomatic units. +2 [ICON_TOURISM] Tourism from all Monuments in your Empire. +1 Civil Servant slot.');
			
UPDATE Language_en_US
SET Text = 'Huge [COLOR_YIELD_FOOD]Zocalo[ENDCOLOR] is a proof of political ([COLOR_YIELD_GOLD]free [ICON_DIPLOMAT][ENDCOLOR]; +1 slot for [ICON_DIPLOMAT]; +10%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]Diplomatic[ENDCOLOR]) and religious (+1[ICON_PEACE]/[ICON_DIPLOMAT][ICON_DIPLOMAT]) accents in history of the city. Such monuments attract tourists from all over the world (+2[ICON_TOURISM]/all [COLOR_YIELD_FOOD]Monuments[ENDCOLOR]), who want to be the part of these events.'
WHERE Tag = 'TXT_KEY_WONDER_ZOCALO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_ZOCALO_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_ZOCALO_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Plains[ENDCOLOR]; Plot: [COLOR_CYAN]Flat[ENDCOLOR]; Feature: [COLOR_CYAN]Lake[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ZOCALO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Flat[ENDCOLOR]; Feature: [COLOR_CYAN]Lake[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ZOCALO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_ZOCALO',		'소칼로 광장'),
			('TXT_KEY_WONDER_ZOCALO_QUOTE',	'[NEWLINE]"소칼로 광장은 트라팔라가 광장 크기의 최소 4배에 달하는 장엄한 공간으로 한쪽에는 국립 궁전이 있고 다른 한쪽에는 거대한 대성당이 있으며 한쪽 구석에는 에르난 코르테스와 정복자들에 의해 잔인하게 파괴된 옛 아즈텍 도시들이 있다."[NEWLINE] - 제레미 코빈[NEWLINE]'),
			('TXT_KEY_WONDER_ZOCALO_PEDIA',	'TODO'),
			('TXT_KEY_WONDER_ZOCALO_HELP',	'무료 [ICON_DIPLOMAT][COLOR_POSITIVE_TEXT]위대한 외교관[ENDCOLOR]을 제공합니다. 제국의 모든 도시에서 공무원 전문가가 [ICON_PEACE]신앙 +1을 제공합니다. 외교 유닛에 대한 [ICON_PRODUCTION]생산이 +10% 증가합니다. 제국의 모든 기념비가 [ICON_TOURISM]관광 +2를 제공합니다. 공무원 전문가 슬롯을 1개 제공합니다.');
			
UPDATE Language_ko_KR
SET Text = '거대한 [COLOR_YIELD_FOOD]소칼로 광장[ENDCOLOR]은 정치적([COLOR_YIELD_GOLD]무료 [ICON_DIPLOMAT][ENDCOLOR], [ICON_DIPLOMAT] 전문가 슬롯 +1, +10%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]외교[ENDCOLOR]) 및 종교적 증거이며(+1[ICON_PEACE]/[ICON_DIPLOMAT][ICON_DIPLOMAT]) 또한 도시의 역사를 강조합니다. 이러한 기념물은 이러한 이벤트의 일부가 되고 싶어하는 전 세계의 관광객(+2[ICON_TOURISM]/모든 [COLOR_YIELD_FOOD]기념비[ENDCOLOR])을 끌어들입니다.'
WHERE Tag = 'TXT_KEY_WONDER_ZOCALO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_ZOCALO_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_ZOCALO_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]평원[ENDCOLOR]; 위치: [COLOR_CYAN]평지[ENDCOLOR]; 특징: [COLOR_CYAN]호수[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ZOCALO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '위치: [COLOR_CYAN]평지[ENDCOLOR]; 특징: [COLOR_CYAN]호수[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ZOCALO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Kew Gardens
INSERT INTO Language_en_US 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_KEW_GARDENS',		'Kew Gardens'),
			('TXT_KEY_WONDER_KEW_GARDENS_QUOTE',	'[NEWLINE]"Stand in nature before anyone else has woken and most people find something to believe in."[NEWLINE] - Tor Udall[NEWLINE]'),
			('TXT_KEY_WONDER_KEW_GARDENS_PEDIA',	'TODO'),
			('TXT_KEY_WONDER_KEW_GARDENS_HELP',		'+1 [ICON_FOOD] Food, +1 [ICON_RESEARCH] Science and +1 [ICON_TOURISM] Tourism from Farms in your Empire. Converts 10% of [ICON_FOOD] Food produced by this City into [ICON_RESEARCH] Science and further 10% of [ICON_RESEARCH] Science into [ICON_TOURISM] Tourism.');
			
UPDATE Language_en_US
SET Text = 'Rich [COLOR_YIELD_FOOD]Kew Gardens[ENDCOLOR] are filled with tousands of plants, huge database and human devotion to study their behaviour and support developement of [COLOR_CITY_BROWN]Farms[ENDCOLOR] in your empire (+1[ICON_FOOD], +1[ICON_RESEARCH], +1[ICON_TOURISM]/[ICON_WORKER][ICON_WORKER]). There''s a connection between growth, accumulated knowledge and also tourism traffic created by curious eco-visitors (+3[ICON_GREAT_SCIENTIST]; 10%[ICON_FOOD] into [ICON_RESEARCH]; 10%[ICON_RESEARCH] into [ICON_TOURISM]), which can be used to speed up your economy.'
WHERE Tag = 'TXT_KEY_WONDER_KEW_GARDENS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_KEW_GARDENS_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_KEW_GARDENS_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Rationalism Finisher[ENDCOLOR]; Building: [COLOR_CYAN]Agribusiness[ENDCOLOR], [COLOR_CYAN]Garden[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_KEW_GARDENS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Rationalism Finisher[ENDCOLOR]; Building: [COLOR_CYAN]Agribusiness[ENDCOLOR], [COLOR_CYAN]Garden[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_KEW_GARDENS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

INSERT INTO Language_ko_KR 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_KEW_GARDENS',		'큐 왕립식물원'),
			('TXT_KEY_WONDER_KEW_GARDENS_QUOTE',	'[NEWLINE]"다른 사람이 깨어나기 전에 자연에 서라. 그러면 대부분의 사람들은 믿을 만한 것을 찾는다."[NEWLINE] - 토르 유돌[NEWLINE]'),
			('TXT_KEY_WONDER_KEW_GARDENS_PEDIA',	'TODO'),
			('TXT_KEY_WONDER_KEW_GARDENS_HELP',		'제국 내 모든 도시의 농장에서 [ICON_FOOD]식량 +1 [ICON_RESEARCH]과학 +1 [ICON_TOURISM]관광 +1을 제공합니다. 이 도시에서 생산되는 [ICON_FOOD]식량의 10%를 [ICON_RESEARCH]과학으로 전환하고 추가로 [ICON_RESEARCH]과학의 10%를 [ICON_TOURISM]관광으로 전환합니다.');
			
UPDATE Language_ko_KR
SET Text = '풍부한 [COLOR_YIELD_FOOD]큐 왕립식물원[ENDCOLOR]은 수천 종의 식물, 거대한 데이터베이스, 그들의 행동을 연구하고 제국의 [COLOR_CITY_BROWN]농장[ENDCOLOR] 개발을 지원하기 위한 인간의 헌신으로 가득합니다(+1[ICON_FOOD], +1[ICON_RESEARCH], +1[ICON_TOURISM]/[ICON_WORKER][ICON_WORKER]). 성장, 축적된 지식 및 호기심 많은 생태 방문자가 생성한 관광 흐름(+3[ICON_GREAT_SCIENTIST], [ICON_FOOD]의 10%만큼[ICON_RESEARCH]로, [ICON_RESEARCH]의 10%만큼 [ICON_TOURISM]로) 사이에는 연관성이 있어 경제를 가속화하는 데 사용할 수 있습니다.'
WHERE Tag = 'TXT_KEY_WONDER_KEW_GARDENS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_KEW_GARDENS_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_KEW_GARDENS_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]합리 완성[ENDCOLOR]; 건물: [COLOR_CYAN]기업형 농장[ENDCOLOR], [COLOR_CYAN]정원[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_KEW_GARDENS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]합리 완성[ENDCOLOR]; 건물: [COLOR_CYAN]기업형 농장[ENDCOLOR], [COLOR_CYAN]정원[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_KEW_GARDENS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Monte Carlo
INSERT INTO Language_en_US 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_MONTE_CARLO',		'Monte Carlo Casino'),
			('TXT_KEY_WONDER_MONTE_CARLO_QUOTE',	'[NEWLINE]"Luck was a servant and not a master. Luck had to be accepted with a shrug or taken advantage of up to the hilt. But it had to be understood and recognized for what it was and not confused with a faulty appreciation of the odds, for, at gambling, the deadly sin is to mistake bad play for bad luck."[NEWLINE] - Ian Fleming[NEWLINE]'),
			('TXT_KEY_WONDER_MONTE_CARLO_PEDIA',	'The Monte Carlo Casino is a gambling and entertainment complex located in Monte Carlo, Monaco. It includes a casino, the Grand Theatre de Monte Carlo, and the office of Les Ballets de Monte Carlo. The Monte Carlo Casino is owned and operated by the Société des bains de mer de Monaco, a public company in which the Monaco government and the ruling family have a majority interest. The company also owns the principal hotels, sports clubs, foodservice establishments, and nightclubs throughout Monaco.'),
			('TXT_KEY_WONDER_MONTE_CARLO_HELP',		'+10% [ICON_GOLD] Gold in your Empire. Converts 33% of [ICON_TOURISM] Tourism produced by this City into [ICON_GOLD] Gold. 20% of [ICON_GOLD] Gold Purchase is converted into [ICON_TOURISM] Tourism. Grants [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Hotel.');
			
UPDATE Language_en_US
SET Text = 'Casino of [COLOR_YIELD_FOOD]Monte Carlo[ENDCOLOR] invites anyone favoured by the fortune (+10% global [ICON_GOLD]). Promises of becoming rich attract tourists (20%[ICON_GOLD] Spent into [ICON_TOURISM]), and money they spend in your [COLOR_YIELD_FOOD]Hotels[ENDCOLOR] ([ICON_TOURISM]) (+2[ICON_GOLD]; +2[ICON_TOURISM]) is what your empire needs the most (33%[ICON_TOURISM] into [ICON_GOLD]).'
WHERE Tag = 'TXT_KEY_WONDER_MONTE_CARLO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_MONTE_CARLO_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_MONTE_CARLO_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Artistry Finisher[ENDCOLOR]; Terrain: [COLOR_CYAN]Mountain[ENDCOLOR], [COLOR_CYAN]Coast[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MONTE_CARLO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Artistry Finisher[ENDCOLOR]; Terrain: [COLOR_CYAN]Coast[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MONTE_CARLO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

INSERT INTO Language_ko_KR 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_MONTE_CARLO',		'몬테 카를로 카지노'),
			('TXT_KEY_WONDER_MONTE_CARLO_QUOTE',	'[NEWLINE]"행운은 주인이 아니라 하인이었다 행운은 어깨를 으쓱하거나 칼자루까지 이용해야했다. 그러나 행운은 있는 그대로 이해되고 인식되어야 했으며, 배당률에 대한 잘못된 평가와 혼동되어서는 안 되었다. 왜냐하면 도박에서 치명적인 죄는 나쁜 플레이를 나쁜 운으로 오인하는 것이기 때문이다."[NEWLINE] - 이언 플레밍[NEWLINE]'),
			('TXT_KEY_WONDER_MONTE_CARLO_PEDIA',	'몬테카를로 카지노는 모나코 몬테카를로에 위치한 도박 및 오락 시설로 카지노, 몬테카를로 대극장, 몬테카를로 발레단 사무실 등이 있습니다. 몬테카를로 카지노는 모나코 정부와 지배 가족이 다수의 지분을 가진 공공 회사인 소시에테 데 메르 드 모나코가 소유하고 운영합니다. 이 회사는 또한 모나코 전역에 주요 호텔, 스포츠 클럽, 음식 서비스 시설 및 나이트클럽을 소유하고 있습니다.'),
			('TXT_KEY_WONDER_MONTE_CARLO_HELP',		'제국의 [ICON_GOLD]골드가 +10% 증가합니다. 이 도시에서 생산되는 [ICON_TOURISM]관광의 33%를 [ICON_GOLD]골드로 변환합니다. [ICON_GOLD]골드 구매의 20%가 [ICON_TOURISM]관광으로 전환됩니다. 이 도시에 무료 [COLOR_POSITIVE_TEXT]호텔[ENDCOLOR] 제공합니다. 제국의 모든 호텔에서 [ICON_GOLD]골드 +2 [ICON_TOURISM]관광 +2를 제공합니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]몬테카를로[ENDCOLOR]의 카지노는 운이 좋은 사람이라면 누구나 초대합니다(+10% [ICON_GOLD][ICON_GOLD]). 부자가 되겠다는 약속은 관광객([ICON_GOLD]골드 구매의 20%를 [ICON_TOURISM]로)들을 끌어들이고, 그들이 당신의 [COLOR_YIELD_FOOD]호텔[ENDCOLOR]([ICON_TOURISM]) (+2[ICON_GOLD][ICON_GOLD]; +2[ICON_TOURISM][ICON_TOURISM])에서 쓰는 돈은 당신의 제국에 가장 필요한 것(33%[ICON_TOURISM]를 [ICON_GOLD]로)입니다.'
WHERE Tag = 'TXT_KEY_WONDER_MONTE_CARLO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_MONTE_CARLO_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_MONTE_CARLO_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]미학 완성[ENDCOLOR]; 지형: [COLOR_CYAN]산[ENDCOLOR], [COLOR_CYAN]해안[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MONTE_CARLO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]미학 완성[ENDCOLOR]; 지형: [COLOR_CYAN]해안[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MONTE_CARLO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Ruhr Valley
INSERT INTO Language_en_US 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_RUHR_VALLEY',		'Ruhr Valley'),
			('TXT_KEY_WONDER_RUHR_VALLEY_QUOTE',	'[NEWLINE]"Art without engineering is dreaming. Engineering without art is calculating."[NEWLINE] - Steven Roberts[NEWLINE]'),
			('TXT_KEY_WONDER_RUHR_VALLEY_PEDIA',	'TODO'),
			('TXT_KEY_WONDER_RUHR_VALLEY_HELP',		'Wonder places 2 new [ICON_RES_COAL] Coal resources inside City range if possible. +10% [ICON_PRODUCTION] Production in your Empire. +1 [ICON_PRODUCTION] Production from Mines and Quarries in your Empire. +2 Working Range of this City.');
			
UPDATE Language_en_US
SET Text = 'Abundant [COLOR_YIELD_FOOD]Ruhr Valley[ENDCOLOR] agglomeration (+2[ICON_RANGE] City Working Range) is the heart of whole country (+10% global [ICON_PRODUCTION]). It supports your industry thanks to new discoveries of [COLOR_GREY]Coal[ENDCOLOR] deposits (+2[ICON_RES_COAL]) and well-trained workforce spread across all [COLOR_CITY_BROWN]Mines[ENDCOLOR] and [COLOR_CITY_BROWN]Quarries[ENDCOLOR] (+1[ICON_PRODUCTION]/[ICON_WORKER][ICON_WORKER]).'
WHERE Tag = 'TXT_KEY_WONDER_RUHR_VALLEY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_RUHR_VALLEY_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_RUHR_VALLEY_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Industry Finisher[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR]; City [COLOR_CYAN]place for Coal[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_RUHR_VALLEY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Industry Finisher[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR]; City [COLOR_CYAN]place for Coal[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_RUHR_VALLEY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

INSERT INTO Language_ko_KR 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_RUHR_VALLEY',		'루르 벨리'),
			('TXT_KEY_WONDER_RUHR_VALLEY_QUOTE',	'[NEWLINE]"공학이 없는 예술은 꿈을 꾸는 것이다. 예술이 없는 공학은 계산적이다."[NEWLINE] - 스티븐 로버츠[NEWLINE]'),
			('TXT_KEY_WONDER_RUHR_VALLEY_PEDIA',	'TODO'),
			('TXT_KEY_WONDER_RUHR_VALLEY_HELP',		'가능한 경우 도시 범위 내에 새로운 [ICON_RES_COAL]석탄 자원을 2개 배치합니다. 제국의 모든 도시의 [ICON_PRODUCTION]생산이 +10% 증가합니다. 제국의 모든 광산 및 채석장에서 [ICON_PRODUCTION]생산 +1을 제공합니다. 이 도시의 작업 범위가 +2 증가합니다.');
			
UPDATE Language_ko_KR
SET Text = '풍부한 [COLOR_YIELD_FOOD]루르 벨리[ENDCOLOR]의 집적(+2[ICON_RANGE] 도시 작업 범위)은 전국의 심장부(+10% [ICON_PRODUCTION][ICON_PRODUCTION])입니다. [COLOR_GREY]석탄[ENDCOLOR] 매장지(+2[ICON_RES_COAL])와 잘 훈련된 인력이 모든 [COLOR_CITY_BROWN]광산[ENDCOLOR]과 [COLOR_CITY_BROWN]채석장[ENDCOLOR](+1[ICON_PRODUCTION]/[ICON_WORKER][ICON_WORKER])에 분산된 새로운 발견 덕분에 귀사의 산업을 지원합니다.'
WHERE Tag = 'TXT_KEY_WONDER_RUHR_VALLEY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_RUHR_VALLEY_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_RUHR_VALLEY_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]산업 완성[ENDCOLOR]; 특징: [COLOR_CYAN]강[ENDCOLOR]; 도시 인근에 [COLOR_CYAN][ICON_RES_COAL]석탄을 놓을 곳[ENDCOLOR] 필요[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_RUHR_VALLEY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]산업 완성[ENDCOLOR]; 특징: [COLOR_CYAN]강[ENDCOLOR]; 도시 인근에 [COLOR_CYAN][ICON_RES_COAL]석탄을 놓을 곳[ENDCOLOR] 필요[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_RUHR_VALLEY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Darjeeling Himalayan Railway
INSERT INTO Language_en_US 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_DARJEELING',			'Darjeeling Himalayan Railway'),
			('TXT_KEY_WONDER_DARJEELING_QUOTE',		'[NEWLINE]"A traditional Englishman drinks tea to the point where his blood has long-since been replaced with an infusion of Ceylon, Assam, and Darjeeling."[NEWLINE] - Fennel Hudson[NEWLINE]'),
			('TXT_KEY_WONDER_DARJEELING_PEDIA',		'The Darjeeling Himalayan Railway is a narrow-gauge railway that operates between the Indian cities of Siliguri and Darjeeling, in the North-East of the country. It features a vertical ascent of approximately 2,100 metres along the 78 kilometre track, and was built during the British Raj period of the colonialism of the country in order to provide railroad access to the area, which was perfect for Tea plantations. It is often referred to as the ''Toy train'' due to the small size of the train and tracks, a design which was deliberate to allow the train to handle the steep ascent to Darjeeling. The railway was closed for a brief period in the late 1980''s during a violent Gorkhaland movement, in which residents of the area campaigned for a seperate state within India to recognise their ethnic heritage of Gorkhas.'),
			('TXT_KEY_WONDER_DARJEELING_HELP',		'All Pedestrian Military Units receive [COLOR_POSITIVE_TEXT]Toy Train[ENDCOLOR] promotion. +15% [ICON_GOLD] Gold from City Connections. +1 [ICON_FOOD] Food, [ICON_PRODUCTION] Production, [ICON_CULTURE] Culture and [ICON_TOURISM] Tourism from Mountain tiles worked by this City.'),
			('TXT_KEY_PROMOTION_DARJEELING',		'Toy Train'),
			('TXT_KEY_PROMOTION_DARJEELING_HELP',	'Unit [COLOR:255:230:85:255]can Move over Mountain[ENDCOLOR].');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Darjeeling Himalayan Railway[ENDCOLOR] is excellent way to communicate difficult areas of your empire together ([COLOR_WATER_TEXT]Toy Train[ENDCOLOR]/[COLOR_YIELD_GOLD]Military Pedestrian[ENDCOLOR]). Such a connection can also improve your income (+15%[ICON_GOLD]/[ICON_CONNECTED][ICON_CONNECTED]) and populate [COLOR_CITY_BLUE]Mountainous[ENDCOLOR] (+1[ICON_FOOD], +1[ICON_PRODUCTION], +1[ICON_CULTURE], +1[ICON_TOURISM]/[ICON_FLOWER][ICON_FLOWER] to corresponding City) terrain surrounding your city.'
WHERE Tag = 'TXT_KEY_WONDER_DARJEELING_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_DARJEELING_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_DARJEELING_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]2 Mountains[ENDCOLOR]; Building: [COLOR_CYAN]Train Station[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_DARJEELING_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Mountain[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_DARJEELING_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

INSERT INTO Language_ko_KR 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_DARJEELING',			'다질링 히말라야 철도'),
			('TXT_KEY_WONDER_DARJEELING_QUOTE',		'[NEWLINE]"전통적인 영국인은 그의 피가 오랫동안 실론, 아삼, 다즐링의 차로 대체될 정도로 차를 마신다."[NEWLINE] - 펜넬 휴드손[NEWLINE]'),
			('TXT_KEY_WONDER_DARJEELING_PEDIA',		'다질링 히말라야 철도는 인도 북동부의 실리구리와 다질링 사이를 운행하는 협궤 철도입니다. 78km 트랙을 따라 약 2,100m의 수직 상승을 특징으로 하며, 차 대농장에 완벽한 지역에 철도 접근을 제공하기 위해 영국 식민주의 시대에 건설되었습니다. 열차와 선로의 작은 크기 때문에 종종 "장난감 기차"라고 불리는데, 이는 열차가 다즐링으로 가는 가파른 오르막길을 처리할 수 있도록 의도적으로 설계된 것입니다. 이 철도는 1980년대 후반에 폭력적인 고르카랜드 운동 동안 짧은 기간 동안 폐쇄되었으며, 이 운동에서 해당 지역 주민들은 고르카 민족의 민족적 유산을 인정하기 위해 인도 내의 분리된 국가를 위해 캠페인을 벌였습니다.'),
			('TXT_KEY_WONDER_DARJEELING_HELP',		'모든 보병 부대는 [COLOR_POSITIVE_TEXT]장난감 기차[ENDCOLOR] 승급을 받습니다. 도시 연결에서 제공하는 [ICON_GOLD]골드가 +15% 증가합니다. 이 도시의 산 타일에서 [ICON_FOOD]식량 +1 [ICON_PRODUCTION]생산 +1 [ICON_CULTURE]문화 +1 [ICON_TOURISM]관광 +1을 제공합니다.'),
			('TXT_KEY_PROMOTION_DARJEELING',		'장난감 기차'),
			('TXT_KEY_PROMOTION_DARJEELING_HELP',	'유닛이 [COLOR:255:230:85:255]산을 건널 수 있음[ENDCOLOR]');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]다즐링 히말라야 철도[ENDCOLOR]는 제국의 어려운 지역을 함께 소통할 수 있는 훌륭한 방법입니다([COLOR_WATER_TEXT]장난감 기차[ENDCOLOR]/[COLOR_YIELD_GOLD]보병 군사[ENDCOLOR]). 이러한 연결은 소득을 향상(+15%[ICON_GOLD]/[ICON_CONNECTED][ICON_CONNECTED])시키고 [COLOR_CITY_BLUE]산악[ENDCOLOR] 지형을 채울 수 있습니다(+1[ICON_FOOD], +1[ICON_PRODUCTION], +1[ICON_CULTURE], +1[ICON_TOURISM]/[ICON_FLOWER]).'
WHERE Tag = 'TXT_KEY_WONDER_DARJEELING_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_DARJEELING_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_DARJEELING_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]산 2개[ENDCOLOR]; 건물: [COLOR_CYAN]철도역[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_DARJEELING_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]산[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_DARJEELING_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Banff Springs Hotel
INSERT INTO Language_en_US 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_BANFF',			'Banff Springs Hotel'),
			('TXT_KEY_WONDER_BANFF_QUOTE',		'[NEWLINE]"A national park is not a playground. It''s a sanctuary for nature and for humans who will accept nature on nature''s own terms."[NEWLINE] - Michael Frome[NEWLINE]'),
			('TXT_KEY_WONDER_BANFF_PEDIA',		'TODO'),
			('TXT_KEY_WONDER_BANFF_HELP',		'+1 [ICON_GOLD] Gold and +1 [ICON_TOURISM] Tourism from all Merchant Specialists in your Empire. +5 [ICON_GOLD] Gold and +5 [ICON_TOURISM] Tourism from all Mountain tiles worked by this City. Grants [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Hotel. -1 [ICON_HAPPINESS_3] Unhappiness from [ICON_CULTURE] Boredom.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Banff Springs Hotel[ENDCOLOR] is a perfect example how to make profits from [COLOR_CITY_BLUE]Mountains[ENDCOLOR] (+5[ICON_GOLD], +5[ICON_TOURISM]/[ICON_FLOWER] to City) using basic tourism infrastructure: [COLOR_YIELD_FOOD]Hotels[ENDCOLOR] ([ICON_TOURISM]), merchant districts (+1[ICON_GREAT_MERCHANT]; +5[ICON_GOLD], +5[ICON_TOURISM]/[ICON_GREAT_MERCHANT][ICON_GREAT_MERCHANT]) and all kind of entertainment facilities (-1[ICON_HAPPINESS_3] Boredom).'
WHERE Tag = 'TXT_KEY_WONDER_BANFF_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_BANFF_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_BANFF_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Industry Finisher[ENDCOLOR]; Terrain: [COLOR_CYAN]Mountain[ENDCOLOR], [COLOR_CYAN]Tundra[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BANFF_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Industry Finisher[ENDCOLOR]; Terrain: [COLOR_CYAN]Tundra[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BANFF_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_BANFF',			'밴프 스프링스 호텔'),
			('TXT_KEY_WONDER_BANFF_QUOTE',		'[NEWLINE]"국립공원은 놀이터가 아니다. 그것은 자연을 위한 성역이고 자연의 조건에 따라 자연을 받아들일 인간들을 위한 성역이다."[NEWLINE] - 마이클 프롬[NEWLINE]'),
			('TXT_KEY_WONDER_BANFF_PEDIA',		'TODO'),
			('TXT_KEY_WONDER_BANFF_HELP',		'제국의 모든 상인 전문가가 [ICON_GOLD]골드 +1 [ICON_TOURISM]관광 +1을 제공합니다. 이 도시에서 작업한 모든 산 타일에서 [ICON_GOLD]골드 +5 [ICON_TOURISM]관광 +5를 제공합니다. 이 도시에 무료 [COLOR_POSITIVE_TEXT]호텔[ENDCOLOR]을 제공합니다. [ICON_CULTURE]무료에 의한 [ICON_HAPPINESS_3]불행이 -1 감소합니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]밴프 스프링스 호텔[ENDCOLOR]은 기본 관광 인프라를 사용하여 [COLOR_CITY_BLUE]산[ENDCOLOR](+5[ICON_GOLD], +5[ICON_TOURISM]/[ICON_FLOWER])에서 수익을 창출하는 완벽한 예입니다. [COLOR_YIELD_FOOD]호텔[ENDCOLOR]([ICON_TOURISM]), 상업 지구(+1[ICON_GREAT_MERCHANT]; +1[ICON_GOLD], +1[ICON_TOURISM]/[ICON_GREAT_MERCHANT][ICON_GREAT_MERCHANT]) 및 모든 종류의 엔터테인먼트 시설(-1[ICON_HAPPINESS_3] 무료)을 갖추고 있습니다.'
WHERE Tag = 'TXT_KEY_WONDER_BANFF_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_BANFF_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_BANFF_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]산업 완료[ENDCOLOR]; 지형: [COLOR_CYAN]산[ENDCOLOR], [COLOR_CYAN]툰드라[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BANFF_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]산업 완료[ENDCOLOR]; 지형: [COLOR_CYAN]툰드라[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BANFF_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Orszaghaz
INSERT INTO Language_en_US 
			(Tag,										Text) 
VALUES		('TXT_KEY_BUILDING_ORSZAGHAZ',				'Orszaghaz'),
			('TXT_KEY_WONDER_ORSZAGHAZ_QUOTE',			'[NEWLINE]"With self-government is freedom, and with freedom is justice and patriotism."[NEWLINE] - Lajos Kossuth[NEWLINE]'),
			('TXT_KEY_WONDER_ORSZAGHAZ_PEDIA',			'TODO'),
			('TXT_KEY_GREAT_WORK_HOLY_CROWN',			'Holy Crown of Hungary'),
			('TXT_KEY_GREAT_WORK_HOLY_CROWN_QUOTE',		'[NEWLINE]You desire that which exceeds my humble powers, but I trust[NEWLINE]in the compassion and mercy of the All-powerful God.[NEWLINE] - Saint Stephen[NEWLINE]'),
			('TXT_KEY_WONDER_ORSZAGHAZ_HELP',			'[COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Policy. +10% [ICON_GOLDEN_AGE] Golden Age Points in your Empire. +1 [ICON_INFLUENCE] World Congress Vote, +1 [ICON_INFLUENCE] World Congress Vote for each 2 Declarations of Friendship and +1 [ICON_INFLUENCE] World Congress Vote for each Defensive Pact. Has 1 slot for [ICON_GREAT_WORK] Great Work of Art, and starts with [ICON_GREAT_WORK] [COLOR_CULTURE_STORED]Holy Crown of Hungary[ENDCOLOR].');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Orszaghaz[ENDCOLOR] is an evidence of your good will towards rest of the world (+1[ICON_DIPLOMAT] League Vote; +1[ICON_DIPLOMAT] League Vote/2 DoF; +1[ICON_DIPLOMAT] League Vote/DP) and also huge leap towards better future of your citizens ([COLOR_MAGENTA]free Policy[ENDCOLOR]). You also invite them to see the holiest artifact in your collection: [COLOR_CULTURE_STORED]Holy Crown of Hungary[ENDCOLOR], spreading the light of new age (+15%[ICON_GOLDEN_AGE][ICON_GOLDEN_AGE]).'
WHERE Tag = 'TXT_KEY_WONDER_ORSZAGHAZ_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_ORSZAGHAZ_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_ORSZAGHAZ_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_UNIT_TEXT]Freedom[ENDCOLOR]; Terrain: [COLOR_NEGATIVE_TEXT]Coast[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR]; Building: [COLOR_CYAN]Constabulary[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ORSZAGHAZ_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_en_US SET Text = 'Special: [COLOR_UNIT_TEXT]Freedom[ENDCOLOR]; Terrain: [COLOR_NEGATIVE_TEXT]Coast[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ORSZAGHAZ_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

INSERT INTO Language_ko_KR 
			(Tag,										Text) 
VALUES		('TXT_KEY_BUILDING_ORSZAGHAZ',				'헝가리 국회의사당'),
			('TXT_KEY_WONDER_ORSZAGHAZ_QUOTE',			'[NEWLINE]"자치와 함께하는 것이 자유이고, 자유와 함께하는 것이 정의와 애국심이다."[NEWLINE] - 코슈트 러요시[NEWLINE]'),
			('TXT_KEY_WONDER_ORSZAGHAZ_PEDIA',			'TODO'),
			('TXT_KEY_GREAT_WORK_HOLY_CROWN',			'성 이슈트반 왕관'),
			('TXT_KEY_GREAT_WORK_HOLY_CROWN_QUOTE',		'[NEWLINE]주님은 나의 보잘것없는 능력을 능가하는 것을 원하십니다. 그러나 나는 전능하신 하나님의 자비와 자비를 믿습니다.[NEWLINE] - 스데파노[NEWLINE]'),
			('TXT_KEY_WONDER_ORSZAGHAZ_HELP',			'무료 [COLOR_POSITIVE_TEXT]정책[ENDCOLOR]을 제공합니다. 제국의 모든 모든 도시에서 [ICON_GOLDEN_AGE]황금기점수를 +15%만큼 추가로 제공합니다. [ICON_INFLUENCE]세계 대회 대표단을 추가로 1명 받으며 각각의 2번의 우호선언 또는 1번의 방위 조약마다 [ICON_INFLUENCE]세계 의회 대표단을 추가로 1명 받습니다. [ICON_GREAT_WORK][COLOR_CULTURE_STORED]성 이슈트반 왕관[ENDCOLOR]이 포함된 [ICON_GREAT_WORK]걸작 슬롯 1개를 제공합니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]헝가리 국회의사당[ENDCOLOR]은 나머지 세계에 대한 선의의 증거입니다(+1[ICON_DIPLOMAT]세계 대회 대표단, +1[ICON_DIPLOMAT]2번의 우호선언당 세계 의회 대표단, +1[ICON_DIPLOMAT]방위 조약당 세계 의회 대표단). 또한 시민의 더 나은 미래를 향한 큰 도약입니다([COLOR_MAGENTA]무료 정책[ENDCOLOR]). 또한 컬렉션에서 가장 신성한 유물인 [COLOR_CULTURE_STORED]성 이슈트반 왕관[ENDCOLOR]을 보도록 초대하여 새로운 시대의 빛을 퍼뜨립니다(+15%[ICON_GOLDEN_AGE][ICON_GOLDEN_AGE]).'
WHERE Tag = 'TXT_KEY_WONDER_ORSZAGHAZ_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_ORSZAGHAZ_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_ORSZAGHAZ_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]평등[ENDCOLOR]; 지형: [COLOR_NEGATIVE_TEXT]해안을 피할 것[ENDCOLOR]; 특징: [COLOR_CYAN]강[ENDCOLOR]; 건물: [COLOR_CYAN]경찰대[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ORSZAGHAZ_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);		
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]평등[ENDCOLOR]; 지형: [COLOR_NEGATIVE_TEXT]해안을 피할 것[ENDCOLOR]; 특징: [COLOR_CYAN]강[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ORSZAGHAZ_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);		
----------------------------------------------------
-- Neuschwanstein
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Neuschwanstein[ENDCOLOR] gives you nice boost to your treasury (+6[ICON_GOLD]; +1[ICON_GREAT_MERCHANT]), culture output (+4[ICON_CULTURE]), and turns your [COLOR_YIELD_FOOD]Castles[ENDCOLOR] (+1[ICON_GOLD], +1[ICON_CULTURE], +1[ICON_HAPPINESS_1]) into most valuable buildings in your cities.'
WHERE Tag = 'TXT_KEY_WONDER_NEUSCHWANSTEIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'Can only be built in a City within 2 tiles of a Mountain that is inside your territory. ', '') WHERE Tag ='TXT_KEY_WONDER_NEUSCHWANSTEIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_NEUSCHWANSTEIN_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_NEUSCHWANSTEIN_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Mountain[ENDCOLOR]; Feature: [COLOR_CYAN]Fresh Water[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_NEUSCHWANSTEIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Mountain[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_NEUSCHWANSTEIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]노이슈반슈타인[ENDCOLOR]은 금고(+6[ICON_GOLD], +1[ICON_GREAT_MERCHANT]), 문화 생산량(+4[ICON_CULTURE])을 크게 증가시키고 [COLOR_YIELD_FOOD]성[ENDCOLOR](+1[ICON_GOLD], +1[ICON_CULTURE], +1[ICON_HAPPINESS_1])을 도시에서 가장 가치 있는 건물로 만듭니다.'
WHERE Tag = 'TXT_KEY_WONDER_NEUSCHWANSTEIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, '도시 주변 [COLOR_YELLOW]2타일 이내에 산[ENDCOLOR]이 있어야 건설할 수 있습니다. ', '') WHERE Tag ='TXT_KEY_WONDER_NEUSCHWANSTEIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_NEUSCHWANSTEIN_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_NEUSCHWANSTEIN_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]산[ENDCOLOR]; 특징: [COLOR_CYAN]담수[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_NEUSCHWANSTEIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]산[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_NEUSCHWANSTEIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Slater Mill
UPDATE Language_en_US
SET Text = 'If you are looking for a nice industrial boost for your civilization, then [COLOR_YIELD_FOOD]Slater Mill[ENDCOLOR] is for you. This [COLOR_YIELD_FOOD]Factory[ENDCOLOR] ([ICON_PRODUCTION]; [ICON_GREAT_PEOPLE]; [ICON_HAPPINESS_3]; [ICON_INTERNATIONAL_TRADE]) is great source of strategic [COLOR_GREY]Coal[ENDCOLOR] (+4 flat [ICON_RES_COAL]), supported by fresh engineering corps (+1[ICON_GREAT_ENGINEER]), that will increase your developement significantly.' WHERE Tag = 'TXT_KEY_BUILDING_SLATER_MILL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'Can only be built in a City next to a River. ', '') WHERE Tag ='TXT_KEY_WONDER_NEUSCHWANSTEIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_BUILDING_SLATER_MILL_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_BUILDING_SLATER_MILL_HELP';
				
UPDATE Language_en_US SET Text = 'Feature: [COLOR_CYAN]River[ENDCOLOR]; Building: [COLOR_CYAN]Windmill[ENDCOLOR]; Improvement: [COLOR_CYAN]2 Plantations[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_SLATER_MILL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_SLATER_MILL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR
SET Text = '문명을 위한 멋진 산업 부양책을 찾고 있다면 [COLOR_YIELD_FOOD]슬레이터 밀[ENDCOLOR]이 적합합니다. 이 [COLOR_YIELD_FOOD]공장[ENDCOLOR]([ICON_PRODUCTION]; [ICON_GREAT_PEOPLE]; [ICON_HAPPINESS_3]; [ICON_INTERNATIONAL_TRADE])은 전략적 [COLOR_GREY]석탄[ENDCOLOR](+4 플랫 [ICON_RES_COAL])의 훌륭한 공급원이며 새로운 엔지니어링의 지원을 받습니다. corps (+1[ICON_GREAT_ENGINEER]), 그것은 당신의 개발을 크게 증가시킬 것입니다.' WHERE Tag = 'TXT_KEY_BUILDING_SLATER_MILL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, '[COLOR_YELLOW]강과 인접한 도시[ENDCOLOR]에만 건설할 수 있습니다. ', '') WHERE Tag ='TXT_KEY_WONDER_NEUSCHWANSTEIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_BUILDING_SLATER_MILL_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_SLATER_MILL_HELP';
				
UPDATE Language_ko_KR SET Text = '특징: [COLOR_CYAN]강[ENDCOLOR]; 건물: [COLOR_CYAN]풍차[ENDCOLOR]; 시설: [COLOR_CYAN]재배지 2개[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_SLATER_MILL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특징: [COLOR_CYAN]강[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_SLATER_MILL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Louvre
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Louvre[ENDCOLOR] is an ideal place for hiding precious artifacts (2 [COLOR_YIELD_GOLD]free Archaeologists[ENDCOLOR]). This huge [COLOR_YIELD_FOOD]Museum[ENDCOLOR] ([ICON_CULTURE]; [ICON_GREAT_WORK]; [ICON_HAPPINESS_3]; [ICON_GREAT_ARTIST]; [ICON_GOLD]) also contains wonderful pieces of global art (4[ICON_GREAT_WORK] if themed: [ICON_CULTURE]) and invites artists from all over the world ([COLOR_YIELD_GOLD]free [ICON_GREAT_ARTIST][ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_LOUVRE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'Requires completion of [COLOR_MAGENTA]Artistry[ENDCOLOR] Branch. ', '') WHERE Tag ='TXT_KEY_WONDER_LOUVRE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_LOUVRE_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_LOUVRE_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Artistry Finisher[ENDCOLOR]; Improvement: [COLOR_CYAN]Landmark[ENDCOLOR]; Great Works: [COLOR_CYAN]4 [ICON_GREAT_WORK] GW of Art[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_LOUVRE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Artistry Finisher[ENDCOLOR]; Improvement: [COLOR_CYAN]Landmark[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_LOUVRE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]루브르[ENDCOLOR]는 귀중한 유물을 숨기기에 이상적인 장소입니다([COLOR_YIELD_GOLD]무료 고고학자[ENDCOLOR] 2명). 이 거대한 [COLOR_YIELD_FOOD]박물관[ENDCOLOR]([ICON_CULTURE]; [ICON_GREAT_WORK]; [ICON_HAPPINESS_3]; [ICON_GREAT_ARTIST]; [ICON_GOLD])에는 멋진 전세계의 예술 작품(4[ICON_GREAT_WORK] 테마보너스: [ICON_CULTURE])과 전 세계의 예술가를 초대합니다([COLOR_YIELD_GOLD]무료 [ICON_GREAT_ARTIST][ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_LOUVRE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, '[COLOR_MAGENTA]미학[ENDCOLOR] 정책을 완성해야 건설할 수 있습니다. ', '') WHERE Tag ='TXT_KEY_WONDER_LOUVRE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_LOUVRE_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_LOUVRE_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]미학 완성[ENDCOLOR]; 시설: [COLOR_CYAN]랜드마크[ENDCOLOR]; 걸작: [COLOR_CYAN][ICON_GREAT_WORK]걸작 예술품 4개[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_LOUVRE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]미학 완성[ENDCOLOR]; 시설: [COLOR_CYAN]랜드마크[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_LOUVRE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Palace of Westminster
UPDATE Language_en_US
SET Text = 'Influential [COLOR_YIELD_FOOD]Palace of Westminster[ENDCOLOR] brings additional seats for your world congress delegtes (+2[ICON_DIPLOMAT] League Votes). Additionally it increases your wealth by inviting merchants ([COLOR_YIELD_GOLD]free [ICON_GREAT_MERCHANT][ENDCOLOR]) and reducing your people''s needs (-1[ICON_HAPPINESS_3] Poverty).'
WHERE Tag = 'TXT_KEY_WONDER_BIG_BEN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'Requires completion of [COLOR_MAGENTA]Statecraft[ENDCOLOR] Branch. ', '') WHERE Tag ='TXT_KEY_WONDER_BIG_BEN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_BIG_BEN_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_BIG_BEN_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Statecraft Finisher[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR]; Player: [COLOR_CYAN]3 [ICON_CITY_STATE] Allies[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BIG_BEN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Statecraft Finisher[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BIG_BEN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR
SET Text = '영향력 있는 [COLOR_YIELD_FOOD]웨스트민스터 궁전[ENDCOLOR]은 세계 의회 대표를 위한 추가 의석을 제공합니다(+2[ICON_DIPLOMAT] 세계 의회 추가 대표단). 또한 상인을 초대하고([COLOR_YIELD_GOLD]무료 [ICON_GREAT_MERCHANT][ENDCOLOR]) 사람들의 요구를 줄여(-1[ICON_HAPPINESS_3] 빈곤) 부를 늘립니다.'
WHERE Tag = 'TXT_KEY_WONDER_BIG_BEN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, '[COLOR_MAGENTA]외교[ENDCOLOR] 정책을 완성해야 건설할 수 있습니다. ', '') WHERE Tag ='TXT_KEY_WONDER_BIG_BEN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_BIG_BEN_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_BIG_BEN_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]외교 완성[ENDCOLOR]; 특징: [COLOR_CYAN]강[ENDCOLOR]; 플레이어: [COLOR_CYAN][ICON_CITY_STATE]동맹 도시국가 3개[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BIG_BEN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]외교 완성[ENDCOLOR]; 특징: [COLOR_CYAN]강[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BIG_BEN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Eiffel Tower
UPDATE Language_en_US
SET Text = 'Impressing [COLOR_YIELD_FOOD]Eiffel Tower[ENDCOLOR] can be a helpful tool for quick cultural developement of your civilization (-10%[ICON_CULTURE] Policy Cost), which is key to world domination.'
WHERE Tag = 'TXT_KEY_WONDER_EIFFEL_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_EIFFEL_TOWER_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_EIFFEL_TOWER_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Grassland[ENDCOLOR]; Plot: [COLOR_CYAN]Flat[ENDCOLOR]; Improved Resource: [COLOR_CYAN]Iron[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_EIFFEL_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Grassland[ENDCOLOR]; Plot: [COLOR_CYAN]Flat[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_EIFFEL_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR
SET Text = '인상적인 [COLOR_YIELD_FOOD]에펠탑[ENDCOLOR]은 문명의 빠른 문화 발전에 유용한 도구가 될 수 있습니다(-10%[ICON_CULTURE] 정책 비용). 이는 세계 지배의 핵심입니다.'
WHERE Tag = 'TXT_KEY_WONDER_EIFFEL_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_EIFFEL_TOWER_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_EIFFEL_TOWER_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]초원[ENDCOLOR]; 위치: [COLOR_CYAN]평지[ENDCOLOR]; 개발된 자원: [COLOR_CYAN]철[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_EIFFEL_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]초원[ENDCOLOR]; 위치: [COLOR_CYAN]평지[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_EIFFEL_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Brandenburg Gate
UPDATE Language_en_US
SET Text = 'Military potential of [COLOR_YIELD_FOOD]Brandenburg Gate[ENDCOLOR] is invaluable. Bigger (+10[ICON_SILVER_FIST]) and well-trained army (+15 global XP/[COLOR_YIELD_GOLD]Military[ENDCOLOR]) as well as a briliant leadership ([COLOR_YIELD_GOLD]free [ICON_GREAT_GENERAL][ENDCOLOR]) will entrench your current position amongst other nations and economical situation of your people (-1[ICON_HAPPINESS_3] Poverty).'
WHERE Tag = 'TXT_KEY_WONDER_BRANDENBURG_GATE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_BRANDENBURG_GATE_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_BRANDENBURG_GATE_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Imperialism Finisher[ENDCOLOR]; Plot: [COLOR_CYAN]Flat[ENDCOLOR]; Improvement: [COLOR_CYAN]Citadel[ENDCOLOR]/[COLOR_CYAN]Fort[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BRANDENBURG_GATE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Imperialism Finisher[ENDCOLOR]; Improvement: [COLOR_CYAN]Citadel[ENDCOLOR]/[COLOR_CYAN]Fort[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BRANDENBURG_GATE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]브란덴부르크 문[ENDCOLOR]의 군사적 잠재력은 매우 중요합니다. 더 크고(+10[ICON_SILVER_FIST]) 잘 훈련된 군대(모든 도시에서 경험치 +15/[COLOR_YIELD_GOLD]군사[ENDCOLOR])와 훌륭한 리더십([COLOR_YIELD_GOLD]무료 [ICON_GREAT_GENERAL][ENDCOLOR])은 다른 국가들 사이에서 당신의 현재 위치와 국민의 경제적 상황(-1[ICON_HAPPINESS_3] 빈곤)을 확고히 할 것입니다.'
WHERE Tag = 'TXT_KEY_WONDER_BRANDENBURG_GATE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_BRANDENBURG_GATE_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_BRANDENBURG_GATE_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]제국주의 완성[ENDCOLOR]; 위치: [COLOR_CYAN]평지[ENDCOLOR]; 시설: [COLOR_CYAN]성채[ENDCOLOR]/[COLOR_CYAN]요새[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BRANDENBURG_GATE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]제국주의 완성[ENDCOLOR]; 시설: [COLOR_CYAN]성채[ENDCOLOR]/[COLOR_CYAN]요새[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BRANDENBURG_GATE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
----------------------------------------------------
-- Polar Expedition
INSERT INTO Language_en_US 
			(Tag,										Text)
VALUES		('TXT_KEY_BUILDING_POLAR_EXPEDITION',		'Polar Expedition'),
			('TXT_KEY_WONDER_POLAR_EXPEDITION_QUOTE',	'[NEWLINE]"Adventure is just bad planning."[NEWLINE] - Roald Amundsen[NEWLINE]'),
			('TXT_KEY_WONDER_POLAR_EXPEDITION_PEDIA',	'TODO'),
			('TXT_KEY_WONDER_POLAR_EXPEDITION_HELP',	'Wonder places 3 new [ICON_RES_OIL] Oil resources inside City range if possible. +2 [ICON_RESEARCH] Science from all Snow tiles worked by the City. +1 [ICON_RESEARCH] Science and +1 [ICON_GOLDEN_AGE] Golden Age Points from all Scientist Specialists in your Empire.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Polar Expedition[ENDCOLOR] vastly explores unvisited [COLOR_CITY_BLUE]Snow[ENDCOLOR] areas (+2[ICON_RESEARCH]/[ICON_FLOWER]) and looks for new underground [COLOR_GREY]Oil[ENDCOLOR] deposits (+3[ICON_RES_OIL]) hidden by white cover. New research facilities created there will surely expand our knowledge about Earth and its history (+1[ICON_RESEARCH], +1[ICON_GOLDEN_AGE]/[ICON_GREAT_SCIENTIST][ICON_GREAT_SCIENTIST]).'
WHERE Tag = 'TXT_KEY_WONDER_POLAR_EXPEDITION_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_POLAR_EXPEDITION_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_POLAR_EXPEDITION_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Snow[ENDCOLOR]; City: [COLOR_CYAN]Near Pole[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_POLAR_EXPEDITION_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Snow[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_POLAR_EXPEDITION_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

INSERT INTO Language_ko_KR 
			(Tag,										Text)
VALUES		('TXT_KEY_BUILDING_POLAR_EXPEDITION',		'극지 탐험대'),
			('TXT_KEY_WONDER_POLAR_EXPEDITION_QUOTE',	'[NEWLINE]"모험은 단지 나쁜 계획일 뿐이다."[NEWLINE] - 로알 아문센[NEWLINE]'),
			('TXT_KEY_WONDER_POLAR_EXPEDITION_PEDIA',	'TODO'),
			('TXT_KEY_WONDER_POLAR_EXPEDITION_HELP',	'가능한 경우 도시 범위 내에 새로운 [ICON_RES_OIL]석유 자원을 3개 배치합니다. 이 도시의 설원 타일에서 [ICON_RESEARCH]과학 +2를 제공합니다. 제국의 모든 과학자 전문가로부터 [ICON_RESEARCH]과학 +1 [ICON_GOLDEN_AGE]황금기 점수 +1을 제공합니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]극지 탐험대[ENDCOLOR]는 방문하지 않은 [COLOR_CITY_BLUE]설원[ENDCOLOR] 지역을 대대적으로 탐험하고(+2[ICON_RESEARCH]/[ICON_FLOWER]) 흰색 덮개로 가려져 있는 새로운 지하 [COLOR_GREY]석유[ENDCOLOR] 매장지(+3[ICON_RES_OIL])를 찾습니다. 그곳에서 만들어진 새로운 연구 시설은 확실히 지구와 그 역사에 대한 우리의 지식을 확장시킬 것입니다(+1[ICON_RESEARCH], +1[ICON_GOLDEN_AGE]/[ICON_GREAT_SCIENTIST][ICON_GREAT_SCIENTIST]).'
WHERE Tag = 'TXT_KEY_WONDER_POLAR_EXPEDITION_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_POLAR_EXPEDITION_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_POLAR_EXPEDITION_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]설원[ENDCOLOR]; 도시: [COLOR_CYAN]극지방에 있을 것[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_POLAR_EXPEDITION_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]설원[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_POLAR_EXPEDITION_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Akihabara Electric Town
INSERT INTO Language_en_US 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_AKIHABARA',		'Akihabara Electric Town'),
			('TXT_KEY_WONDER_AKIHABARA_QUOTE',	'[NEWLINE]"It''s akin to the maddest Asian market you''ve ever been in, but instead of selling mangosteens they''re hawking manga and motherboards - and the sellers are not only pushy, they''re prerecorded."[NEWLINE] - "Lonely Planet" about Akihabara[NEWLINE]'),
			('TXT_KEY_WONDER_AKIHABARA_PEDIA',	'TODO'),
			('TXT_KEY_WONDER_AKIHABARA_HELP',	'+2 Merchant slots. +1 [ICON_PRODUCTION] Production, +2 [ICON_GOLD] Gold and +1 [ICON_CULTURE] Culture from all Markets in your Empire. +1 [ICON_PRODUCTION] Production and +1 [ICON_GOLD] Gold from all Customs Houses in your Empire. +2 [ICON_PRODUCTION] Production from all Merchant Specialists in your Empire.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Akihabara Electric Town[ENDCOLOR] is a place, where merchants (+2 slots for [ICON_GREAT_MERCHANT]; +2[ICON_PRODUCTION]/[ICON_GREAT_MERCHANT][ICON_GREAT_MERCHANT]) sell all kind of electronic stuff you can imagine. Those [COLOR_YIELD_FOOD]Markets[ENDCOLOR] (+1[ICON_PRODUCTION], +2[ICON_GOLD], +1[ICON_CULTURE]/all [COLOR_YIELD_FOOD]Markets[ENDCOLOR]) work locally, but all those products can be sold abroad through [COLOR_CITY_BROWN]Customs Houses[ENDCOLOR] (+1[ICON_PRODUCTION], +1[ICON_GOLD]/[ICON_MUSHROOM][ICON_MUSHROOM]) supporting electronic industry of the world, as well.'
WHERE Tag = 'TXT_KEY_WONDER_AKIHABARA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_AKIHABARA_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_AKIHABARA_HELP';
				
UPDATE Language_en_US SET Text = 'Improvement: [COLOR_CYAN]Town[ENDCOLOR]; City: [COLOR_CYAN]3 Merchant Specialists[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_AKIHABARA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = ''||Text WHERE Tag ='TXT_KEY_WONDER_AKIHABARA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_AKIHABARA',		'아키하바라 전자상가'),
			('TXT_KEY_WONDER_AKIHABARA_QUOTE',	'[NEWLINE]"아키하바라는 당신이 가본 가장 정신나간 아시아 시장과 비슷하지만 망고스틴을 파는 대신 만화와 마더보드를 팔고 있다."[NEWLINE] - 아키하바라에 대해 론리플래닛에서[NEWLINE]'),
			('TXT_KEY_WONDER_AKIHABARA_PEDIA',	'TODO'),
			('TXT_KEY_WONDER_AKIHABARA_HELP',	'상인 전문가 슬롯을 +2만큼 제공합니다. 제국의 모든 시장에서 [ICON_PRODUCTION]생산 +1 [ICON_GOLD]골드 +2 [ICON_CULTURE]문화 +1를 제공합니다. 제국의 모든 세관에서 [ICON_PRODUCTION]생산 +1 [ICON_GOLD]골드  +1를 제공합니다. 제국의 모든 상인 전문가로부터 [ICON_PRODUCTION]생산 +2를 받습니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]아키하바라 전자 상가[ENDCOLOR]는 상인([ICON_GREAT_MERCHANT] 슬롯 +2개, [ICON_PRODUCTION]/[ICON_GREAT_MERCHANT][ICON_GREAT_MERCHANT] +2개)이 상상할 수 있는 모든 종류의 전자 제품을 판매하는 곳입니다. 이러한 [COLOR_YIELD_FOOD]시장[ENDCOLOR](+1[ICON_PRODUCTION], +2[ICON_GOLD], +1[ICON_CULTURE]/모든 [COLOR_YIELD_FOOD]시장[ENDCOLOR])은 현지에서 활동하지만 모든 제품은 [COLOR_CITY_BROWN]세관[ENDCOLOR]을 통해 해외에서 판매할 수 있으며(+1[ICON_PRODUCTION], +1[ICON_GOLD]/[ICON_MUSHROOM][ICON_MUSHROOM]), 전 세계 전자 산업을 지원합니다.'
WHERE Tag = 'TXT_KEY_WONDER_AKIHABARA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_AKIHABARA_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_AKIHABARA_HELP';
				
UPDATE Language_ko_KR SET Text = '시설: [COLOR_CYAN]소도시[ENDCOLOR]; 도시: [COLOR_CYAN]상인 전문가 3명[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_AKIHABARA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = ''||Text WHERE Tag ='TXT_KEY_WONDER_AKIHABARA_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Rockefeller Center
INSERT INTO Language_en_US 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_ROCKEFELLER',		'Rockefeller Center'),
			('TXT_KEY_WONDER_ROCKEFELLER_QUOTE',	'[NEWLINE]"A friendship founded on business is better than a business founded on friendship."[NEWLINE] - John D. Rockefeller[NEWLINE]'),
			('TXT_KEY_WONDER_ROCKEFELLER_PEDIA',	'TODO'),
			('TXT_KEY_WONDER_ROCKEFELLER_HELP',		'Provides a [COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Research Lab in the City in which it is built. +2 [ICON_RESEARCH] Science from all Hospitals in your Empire. +3 [ICON_GOLD] Gold to all your Cities in Empire. Receive 5% [ICON_CULTURE] Culture from each [ICON_GOLD] Gold Purchase in the Empire.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Rockefeller Center[ENDCOLOR] strongly supports many different branches of your country: economy (+3[ICON_GOLD]/City), culture (5%[ICON_CULTURE]/[ICON_GOLD][ICON_GOLD] Purchase) and research (+2[ICON_RESEARCH]/all [COLOR_YIELD_FOOD]Hospitals[ENDCOLOR]). Huge breakthroughs will be only matter of time thanks to new [COLOR_YIELD_FOOD]Research Labs[ENDCOLOR] ([ICON_RESEARCH]) working in this complex.'
WHERE Tag = 'TXT_KEY_WONDER_ROCKEFELLER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_ROCKEFELLER_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_ROCKEFELLER_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR]; Buidling: [COLOR_CYAN]Opera House[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ROCKEFELLER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ROCKEFELLER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

INSERT INTO Language_ko_KR 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_ROCKEFELLER',		'록펠러 센터'),
			('TXT_KEY_WONDER_ROCKEFELLER_QUOTE',	'[NEWLINE]"사업에 기반을 둔 우정이 우정에 기반을 둔 사업보다 낫다."[NEWLINE] - 존 D. 록펠러[NEWLINE]'),
			('TXT_KEY_WONDER_ROCKEFELLER_PEDIA',	'TODO'),
			('TXT_KEY_WONDER_ROCKEFELLER_HELP',		'이 도시에 무료 [COLOR_POSITIVE_TEXT]연구소[ENDCOLOR]를 제공합니다. 제국에 있는 모든 병원이 [ICON_RESEARCH]과학 +2를 제공하며 제국의 모든 도시에 [ICON_GOLD]골드 +3을 제공합니다. 제국의 모든 도시에서 [ICON_GOLD]골드로 구매 할때마다 구매금액의 5%만큼 [ICON_CULTURE]문화를 받습니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]록펠러 센터[ENDCOLOR]는 경제(+3[ICON_GOLD]/도시), 문화(5%[ICON_CULTURE]/[ICON_GOLD][ICON_GOLD] 구매) 및 연구(+2[ ICON_RESEARCH]/모든 [COLOR_YIELD_FOOD]병원[ENDCOLOR])를 강력하게 지원합니다. 또한 이 곳에서 건설된 새로운 [COLOR_YIELD_FOOD]연구소[ENDCOLOR]([ICON_RESEARCH]) 덕분에 엄청난 돌파구를 마련하는 것은 시간 문제일 뿐입니다.'
WHERE Tag = 'TXT_KEY_WONDER_ROCKEFELLER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_ROCKEFELLER_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_ROCKEFELLER_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 특징: [COLOR_CYAN]강[ENDCOLOR]; 건물: [COLOR_CYAN]오페라 하우스[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ROCKEFELLER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 특징: [COLOR_CYAN]강[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ROCKEFELLER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Autobahn
INSERT INTO Language_en_US 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_AUTOBAHN',		'Autobahn'),
			('TXT_KEY_WONDER_AUTOBAHN_QUOTE',	'[NEWLINE]"A car for the people, an affordable Volkswagen, would bring great joy to the masses and the problems of building such a car must be faced with courage."[NEWLINE] - Adolf Hitler[NEWLINE]'),
			('TXT_KEY_WONDER_AUTOBAHN_PEDIA',	'TODO'),
			('TXT_KEY_WONDER_AUTOBAHN_HELP',	'+10% [ICON_GOLDEN_AGE] Golden Age Points in your Empire. +30% [ICON_WORKER] Improvement Construction Rate. +15% [ICON_GOLD] Gold from City Connections. +7 [ICON_STRENGTH] City Defense in all Cities in your Empire.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Autobahn[ENDCOLOR] allows better troops'' maneuvering increasing your defensive capabilities (+7[ICON_STRENGTH][ICON_STRENGTH]) and pushing you toward the golden age (+5[ICON_GOLDEN_AGE]; +10%[ICON_GOLDEN_AGE][ICON_GOLDEN_AGE]). It also boosts flow of your products (+15%[ICON_GOLD]/[ICON_CONNECTED][ICON_CONNECTED]) and increases overall productivity (+30%[ICON_WORKER] Worker Rate)'
WHERE Tag = 'TXT_KEY_WONDER_AUTOBAHN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_AUTOBAHN_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_AUTOBAHN_HELP';
				
UPDATE Language_en_US SET Text = 'Improved Resource: [COLOR_CYAN]Oil[ENDCOLOR]; Building: [COLOR_CYAN]Arsenal, Military Academy[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_AUTOBAHN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Improved Resource: [COLOR_CYAN]Oil[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_AUTOBAHN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_AUTOBAHN',		'아우토반'),
			('TXT_KEY_WONDER_AUTOBAHN_QUOTE',	'[NEWLINE]"국민을 위한 자동차, 저렴한 폭스바겐은 대중에게 큰 기쁨을 줄 것이며 그러한 자동차를 만드는 문제는 용기를 가지고 직면해야 한다."[NEWLINE] - 아돌프 히틀러[NEWLINE]'),
			('TXT_KEY_WONDER_AUTOBAHN_PEDIA',	'TODO'),
			('TXT_KEY_WONDER_AUTOBAHN_HELP',	'제국의 모든 도시에서 [ICON_GOLDEN_AGE]황금기 점수가 +10% 증가합니다. [ICON_WORKER]노동자의 시설 건설 속도가 +30% 증가합니다. 도시 연결에서 제공하는 [ICON_GOLD]골드가 +15% 증가합니다. 제국의 모든 도시의 [ICON_STRENGTH]공격력이 +7 증가합니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]아우토반[ENDCOLOR]은 더 나은 부대의 기동을 허용하여 방어 능력을 높이고(+7[ICON_STRENGTH][ICON_STRENGTH]) 황금기를 향해 나아가게 합니다(+5[ICON_GOLDEN_AGE]; +10%[ICON_GOLDEN_AGE][ICON_GOLDEN_AGE] ). 또한 상품의 흐름을 촉진하고(+15%[ICON_GOLD]/[ICON_CONNECTED][ICON_CONNECTED]) 전반적인 생산성을 증가시킵니다(+30%[ICON_WORKER] 노동자 효율).'
WHERE Tag = 'TXT_KEY_WONDER_AUTOBAHN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_AUTOBAHN_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_AUTOBAHN_HELP';
				
UPDATE Language_ko_KR SET Text = '개발된 자원: [COLOR_CYAN][ICON_RES_OIL]석유[ENDCOLOR]; 건물: [COLOR_CYAN]군수창고, 공장[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_AUTOBAHN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '개발된 자원: [COLOR_CYAN][ICON_RES_OIL]석유[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_AUTOBAHN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Interstate Highway System
INSERT INTO Language_en_US 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_INTERSTATE',		'Interstate Highway System'),
			('TXT_KEY_WONDER_INTERSTATE_QUOTE',	'[NEWLINE]"I see an America where a mighty network of highways spreads across our country."[NEWLINE] - Dwight D. Eisenhower[NEWLINE]'),
			('TXT_KEY_WONDER_INTERSTATE_PEDIA',	'TODO'),
			('TXT_KEY_WONDER_INTERSTATE_HELP',	'+1 [ICON_CITIZEN] Population in all Cities in your Empire. Empire [ICON_HAPPINESS_3] Needs Modifier is reduced by 5% in all Cities. +10% [ICON_PRODUCTION] Production in your Empire. +15% [ICON_GOLD] Gold from City Connections.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Interstate Highway System[ENDCOLOR] connects all corners of your country, which develops even the most neglected areas (+1[ICON_CITIZEN]; -5%[ICON_HAPPINESS_3][ICON_HAPPINESS_3] Needs). It increases your gold income (+15%[ICON_GOLD]/[ICON_CONNECTED][ICON_CONNECTED]) and production capabilities (+10%[ICON_PRODUCTION][ICON_PRODUCTION]).'
WHERE Tag = 'TXT_KEY_WONDER_INTERSTATE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_INTERSTATE_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_INTERSTATE_HELP';
				
UPDATE Language_en_US SET Text = 'Improved Resource: [COLOR_CYAN]Oil[ENDCOLOR]; City: [COLOR_CYAN]8 Cities[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_INTERSTATE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Improved Resource: [COLOR_CYAN]Oil[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_INTERSTATE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_INTERSTATE',		'주간고속도로'),
			('TXT_KEY_WONDER_INTERSTATE_QUOTE',	'[NEWLINE]"나는 거대한 고속도로망이 국가 전역에 퍼져 있는 미국을 봅니다."[NEWLINE] - 드와이트 D. 아이젠하워[NEWLINE]'),
			('TXT_KEY_WONDER_INTERSTATE_PEDIA',	'TODO'),
			('TXT_KEY_WONDER_INTERSTATE_HELP',	'제국의 모든 도시에서 [ICON_CITIZEN]인구가 +1 증가하고 [ICON_PRODUCTION]생산이 +10% 증가합니다. 제국의 모든 도시의 [ICON_HAPPINESS_3]전역 요구 불행이 -5% 감소합니다. 도시 연결에서 제공하는 [ICON_GOLD]골드가 +15% 증가합니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]주간 고속도로 시스템[ENDCOLOR]은 가장 소외된 지역까지 개발하는 국가의 모든 구석을 연결합니다(+1[ICON_CITIZEN]; -5%[ICON_HAPPINESS_3][ICON_HAPPINESS_3] 전역 요구 불행). 골드 수입(+15%[ICON_GOLD]/[ICON_CONNECTED][ICON_CONNECTED])과 생산 능력(+10%[ICON_PRODUCTION][ICON_PRODUCTION])이 증가합니다.'
WHERE Tag = 'TXT_KEY_WONDER_INTERSTATE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_INTERSTATE_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_INTERSTATE_HELP';
				
UPDATE Language_ko_KR SET Text = '개발된 자원: [COLOR_CYAN][ICON_RES_OIL]석유[ENDCOLOR]; 도시: [COLOR_CYAN]8개[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_INTERSTATE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '개발된 자원: [COLOR_CYAN][ICON_RES_OIL]석유[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_INTERSTATE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Hollywood
INSERT INTO Language_en_US 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_HOLLYWOOD',		'Hollywood'),
			('TXT_KEY_WONDER_HOLLYWOOD_QUOTE',	'[NEWLINE]"Hollywood is a place where they''ll pay you a thousand dollars for a kiss and fifty cents for your soul. I know, because I turned down the first offer often enough and held out for the fifty cents."[NEWLINE] - Marilyn Monroe[NEWLINE]'),
			('TXT_KEY_WONDER_HOLLYWOOD_PEDIA',	'TODO'),
			('TXT_KEY_WONDER_HOLLYWOOD_HELP',	'[COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Policy. 75 [ICON_TOURISM] Tourism when you unlock new Policy scaling with Era. -1 [ICON_HAPPINESS_3] Unhappiness from [ICON_CULTURE] Boredom in this City and -5% [ICON_HAPPINESS_3] Unhappiness from [ICON_CULTURE] Boredom in the Empire. +1 [ICON_GOLD] Gold and +1 [ICON_CULTURE] Culture from all Broadcast Towers and +2 [ICON_GOLD] Gold, +2 [ICON_CULTURE] Culture and +2 [ICON_TOURISM] Tourism from all Guilds in your Empire.');
			
UPDATE Language_en_US
SET Text = 'If you want to make your empire happier, built [COLOR_YIELD_FOOD]Hollywood[ENDCOLOR] (-1[ICON_HAPPINESS_3] Boredom; -5%[ICON_HAPPINESS_3][ICON_HAPPINESS_3] Boredom). It will be a cultural center of your country (+1[ICON_TOURISM]; 75[ICON_TOURISM]/Policy unlock; [COLOR_MAGENTA]free Policy[ENDCOLOR]), that also make profits for you (+1[ICON_GOLD], +1[ICON_CULTURE]/all [COLOR_YIELD_FOOD]Broadcast Towers[ENDCOLOR]; +2[ICON_GOLD], +2[ICON_CULTURE], +2[ICON_TOURISM]/all [COLOR_YIELD_FOOD]Guilds[ENDCOLOR])!'
WHERE Tag = 'TXT_KEY_WONDER_HOLLYWOOD_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_HOLLYWOOD_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_HOLLYWOOD_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_UNIT_TEXT]Freedom[ENDCOLOR]; Terrain: [COLOR_CYAN]Coast[ENDCOLOR], [COLOR_CYAN]Grassland[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HOLLYWOOD_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_UNIT_TEXT]Freedom[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HOLLYWOOD_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_HOLLYWOOD',		'할리우드'),
			('TXT_KEY_WONDER_HOLLYWOOD_QUOTE',	'[NEWLINE]"할리우드는 키스 한 번에 천 달러를 주고 영혼을 위해 50센트를 주는 곳이에요. 알아요, 첫 번째 제안을 자주 거절하고 50센트를 달라고 버텼거든요."[NEWLINE] - 마릴린 먼로[NEWLINE]'),
			('TXT_KEY_WONDER_HOLLYWOOD_PEDIA',	'TODO'),
			('TXT_KEY_WONDER_HOLLYWOOD_HELP',	'무료[COLOR_POSITIVE_TEXT]정책[ENDCOLOR]을 제공합니다. 새로운 정책을 채택할때마다 [ICON_TOURISM]관광을 75[COLOR:105:105:105:255](시대별 보정, 현대 시대 기준 375)[ENDCOLOR]만큼 제공합니다. 이 도시에서 [ICON_CULTURE]무료에 의한 [ICON_HAPPINESS_3]불행이 -1 감소하고 제국에서 [ICON_CULTURE]무료에 의한 [ICON_HAPPINESS_3]불행이 -5% 감소합니다. 제국의 모든 방송탑에서 [ICON_GOLD]골드 +1 [ICON_CULTURE]문화 +1를 제공하고 제국의 모든 길드에서 [ICON_GOLD]골드 +2 [ICON_CULTURE]문화 +2 [ICON_TOURISM]관광 +2를 제공합니다');
			
UPDATE Language_ko_KR
SET Text = '제국을 더 행복하게 만들고 싶다면 [COLOR_YIELD_FOOD]할리우드[ENDCOLOR]를 건설하십시오(-1[ICON_HAPPINESS_3] 무료; -5%[ICON_HAPPINESS_3][ICON_HAPPINESS_3] 무료). 국가의 문화 중심지가 될 것이며(+1[ICON_TOURISM], 75[ICON_TOURISM]/정책 잠금 해제, [COLOR_MAGENTA]무료 정책[ENDCOLOR]) 수익도 창출합니다(+1[ICON_GOLD], +1[ICON_CULTURE]/모든 [COLOR_YIELD_FOOD]방송탑[ENDCOLOR], +2[ICON_GOLD], +2[ICON_CULTURE], +2[ICON_TOURISM]/모든 [COLOR_YIELD_FOOD]길드[ENDCOLOR])!'
WHERE Tag = 'TXT_KEY_WONDER_HOLLYWOOD_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_HOLLYWOOD_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_HOLLYWOOD_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]평등[ENDCOLOR]; 지형: [COLOR_CYAN]해안[ENDCOLOR], [COLOR_CYAN]초원[ENDCOLOR]; 위치: [COLOR_CYAN]언덕[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HOLLYWOOD_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]평등[ENDCOLOR]; 위치: [COLOR_CYAN]언덕[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HOLLYWOOD_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Concorde
INSERT INTO Language_en_US 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_CONCORDE',		'Concorde'),
			('TXT_KEY_WONDER_CONCORDE_QUOTE',	'[NEWLINE]"I should go to Paris and jump off of the Eiffel Tower. If I took the Concorde, I could be dead three hours earlier."[NEWLINE] - Woody Allen[NEWLINE]'),
			('TXT_KEY_WONDER_CONCORDE_PEDIA',	'TODO'),
			('TXT_KEY_WONDER_CONCORDE_HELP',	'Grants 20 [ICON_INFLUENCE] on construction. +15% [ICON_GOLD] Gold from City Connections. +25% [ICON_TOURISM] Tourism during [ICON_HAPPINESS_1] WLTKD.[NEWLINE][NEWLINE]All [ICON_RES_OIL] Oil: +3 [ICON_TOURISM] Tourism.[NEWLINE]All [ICON_RES_ALUMINUM] Aluminum: +3 [ICON_TOURISM] Tourism.');
			
UPDATE Language_en_US
SET Text = 'Supersonic airliner [COLOR_YIELD_FOOD]Concorde[ENDCOLOR] drastically increases efficiency in passenger flights and boosts tourism income (+3[ICON_TOURISM]; +3[ICON_TOURISM]/[ICON_RES_OIL][ICON_RES_OIL], [ICON_RES_ALUMINUM][ICON_RES_ALUMINUM]; +25%[ICON_TOURISM] during [ICON_HAPPINESS_1]WLTKD). The world is your oyster (20[ICON_INFLUENCE]/[ICON_CITY_STATE][ICON_CITY_STATE]). Just count the money (+15%[ICON_GOLD]/[ICON_CONNECTED][ICON_CONNECTED]).'
WHERE Tag = 'TXT_KEY_WONDER_CONCORDE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_CONCORDE_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_CONCORDE_HELP';
				
UPDATE Language_en_US SET Text = 'Improved Resource: [COLOR_CYAN][ICON_RES_ALUMINUM] Aluminum[ENDCOLOR]; City: [COLOR_CYAN]3 Engineer Specialists[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CONCORDE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Improved Resource: [COLOR_CYAN][ICON_RES_ALUMINUM] Aluminum[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CONCORDE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_CONCORDE',		'콩코드'),
			('TXT_KEY_WONDER_CONCORDE_QUOTE',	'[NEWLINE]"나는 파리에 가서 에펠탑에서 뛰어내려야 한다. 콩코드를 타면 3시간 일찍 죽을 수도 있다."[NEWLINE] - 우디 앨런[NEWLINE]'),
			('TXT_KEY_WONDER_CONCORDE_PEDIA',	'TODO'),
			('TXT_KEY_WONDER_CONCORDE_HELP',	'건설시 모든 도시국가에 대한 [ICON_INFLUENCE]영향력 20을 부여합니다. 도시 연결에서 제공하는 [ICON_GOLD]골드가 +15% 증가합니다. [ICON_HAPPINESS_1]국왕 경축일 동안 [ICON_TOURISM]관광이 +25% 증가합니다. 제국의 모든 [ICON_RES_OIL]석유, [ICON_RES_ALUMINUM]알루미늄 자원에서 [ICON_TOURISM]관광 +3을 제공합니다.');
			
UPDATE Language_ko_KR
SET Text = '초음속 여객기 [COLOR_YIELD_FOOD]콩코드[ENDCOLOR]는 여객기의 효율성을 크게 높이고 관광 수입을 증대합니다(+3[ICON_TOURISM]; +3[ICON_TOURISM]/[ICON_RES_OIL][ICON_RES_OIL], [ICON_RES_ALUMINUM][ICON_RES_ALUMINUM]; [ICON_HAPPINESS_1]국왕 경축일동안 +25%[ICON_TOURISM]). 세상은 당신의 굴입니다(20[ICON_INFLUENCE]/[ICON_CITY_STATE][ICON_CITY_STATE]). 돈을 세십시오(+15%[ICON_GOLD]/[ICON_CONNECTED][ICON_CONNECTED]).'
WHERE Tag = 'TXT_KEY_WONDER_CONCORDE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_CONCORDE_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_CONCORDE_HELP';
				
UPDATE Language_ko_KR SET Text = '개발된 자원: [COLOR_CYAN][ICON_RES_ALUMINUM]알루미늄[ENDCOLOR]; 도시: [COLOR_CYAN]기술자 전문가 3명[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CONCORDE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '개발된 자원: [COLOR_CYAN][ICON_RES_ALUMINUM]알루미늄[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CONCORDE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Sanbo Honbu
INSERT INTO Language_en_US 
			(Tag,										Text)
VALUES		('TXT_KEY_BUILDING_SANBO',					'Sanbo Honbu'),
			('TXT_KEY_WONDER_SANBO_QUOTE',				'[NEWLINE]"Unite your total strength, to be devoted to construction for the future. Cultivate the ways of rectitude, foster nobility of spirit, and work with resolution - so that you may enhance the innate glory of the Imperial State and keep pace with the progress of the world."[NEWLINE] - Hirohito[NEWLINE]'),
			('TXT_KEY_WONDER_SANBO_PEDIA',				'TODO'),
			('TXT_KEY_WONDER_SANBO_HELP',				'[COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Policy. All Miltary Land Units in the Empire get [COLOR_POSITIVE_TEXT]Imperial Army[ENDCOLOR] promotion, all Military Naval Melee Units in the Empire get [COLOR_POSITIVE_TEXT]Fleet of the Sun[ENDCOLOR] promotion and all Military Air Units in the Empire get [COLOR_POSITIVE_TEXT]Kamikaze[ENDCOLOR] promotion. +30% [ICON_PRODUCTION] Production towards Military Units.'),
			('TXT_KEY_PROMOTION_SANBO_LAND',			'Imperial Army'),
			('TXT_KEY_PROMOTION_SANBO_LAND_HELP',		'Bonus[ICON_MOVES]Movement Point[COLOR:255:230:85:255] after crossing Rivers[ENDCOLOR]. +10%[ICON_STRENGTH]CS/[ICON_RANGE_STRENGTH]RCS [COLOR:255:230:85:255]in Rough Terrain[ENDCOLOR].'),
			('TXT_KEY_PROMOTION_SANBO_SEA',				'Fleet of the Sun'),
			('TXT_KEY_PROMOTION_SANBO_SEA_HELP',		'Unit deals Damage [COLOR:255:230:85:255]to attackng Air Unit[ENDCOLOR]. Requires [ICON_RESEARCH]Flight (excluding Submarines). +10%[ICON_STRENGTH]CS if unit [COLOR:255:230:85:255]is adjacent to another Friendly Unit[ENDCOLOR].'),
			('TXT_KEY_PROMOTION_SANBO_AIR',				'Kamikaze'),
			('TXT_KEY_PROMOTION_SANBO_AIR_HELP',		'+30%[ICON_RANGE_STRENGTH]RCS if unit [COLOR:255:230:85:255]has 20% of its maximum HP or less[ENDCOLOR] [COLOR_GREY](inactive)[ENDCOLOR].'),
			('TXT_KEY_PROMOTION_SANBO_AIR_EFFECT',		'Kamikaze: For the Emperor!'),
			('TXT_KEY_PROMOTION_SANBO_AIR_EFFECT_HELP',	'+30%[ICON_RANGE_STRENGTH]RCS if unit [COLOR:255:230:85:255]has 20% of its maximum HP or less[ENDCOLOR] [COLOR_POSITIVE_TEXT](active)[ENDCOLOR].');

UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Sanbo Honbu[ENDCOLOR] strengthen all military branches of your army: land ([COLOR_WATER_TEXT]Imperial Army[ENDCOLOR]/[COLOR_YIELD_GOLD]Military Land[ENDCOLOR]), naval ([COLOR_WATER_TEXT]Fleet of the Sun[ENDCOLOR]/[COLOR_YIELD_GOLD]Military Naval[ENDCOLOR]) and air ([COLOR_WATER_TEXT]Kamikaze[ENDCOLOR]/[COLOR_YIELD_GOLD]Military Air[ENDCOLOR]). It also speeds up build time of troops (+30%[ICON_PRODUCTION]/Miltary) and improve your internal power ([COLOR_MAGENTA]free Policy[ENDCOLOR]). As an cherry on top you can gain generals and admirals much quicker (+2[ICON_GREAT_GENERAL]; +3[ICON_GREAT_ADMIRAL]).'
WHERE Tag = 'TXT_KEY_WONDER_SANBO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_SANBO_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_SANBO_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_UNIT_TEXT]Autocracy[ENDCOLOR]; Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Building: [COLOR_CYAN]Arsenal, Military Academy[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SANBO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_UNIT_TEXT]Autocracy[ENDCOLOR]; Terrain: [COLOR_CYAN]Coast[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SANBO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

INSERT INTO Language_ko_KR 
			(Tag,										Text)
VALUES		('TXT_KEY_BUILDING_SANBO',					'일본참모본부'),
			('TXT_KEY_WONDER_SANBO_QUOTE',				'[NEWLINE]"모든 힘을 모아 미래 건설에 전념하십시오. 올바른 길을 닦고, 고결한 정신을 기르고, 결단력 있게 일하여 제국의 본연의 영광을 드높이고 세계의 진보에 보조를 맞추십시오."[NEWLINE] - 히로히토[NEWLINE]'),
			('TXT_KEY_WONDER_SANBO_PEDIA',				'TODO'),
			('TXT_KEY_WONDER_SANBO_HELP',				'무료[COLOR_POSITIVE_TEXT]정책[ENDCOLOR]을 제공합니다. 제국의 모든 지상 군사 유닛은 [COLOR_POSITIVE_TEXT]제국군[ENDCOLOR] 승급을 받고, 제국의 모든 해상 군사 유닛은 [COLOR_POSITIVE_TEXT]태양 함대[ENDCOLOR] 승급을 받으며, 제국의 모든 공중 유닛은 [COLOR_POSITIVE_TEXT]카미카제[ENDCOLOR] 승급을 받습니다. 군사 유닛에 대한 [ICON_PRODUCTION]생산력이 +30% 증가합니다.'),
			('TXT_KEY_PROMOTION_SANBO_LAND',			'제국군'),
			('TXT_KEY_PROMOTION_SANBO_LAND_HELP',		'[COLOR:255:230:85:255]강[ENDCOLOR]을 건넌 후 추가 [ICON_MOVES]이동력[NEWLINE][COLOR:255:230:85:255]험준한 지형[ENDCOLOR]에서 [ICON_STRENGTH]공격력 및 [ICON_RANGE_STRENGTH]원거리 공격력 +10%'),
			('TXT_KEY_PROMOTION_SANBO_SEA',				'태양 함대'),
			('TXT_KEY_PROMOTION_SANBO_SEA_HELP',		'유닛이 [COLOR:255:230:85:255]공격 중인 공중 유닛[ENDCOLOR]에게 데미지를 줌 ([ICON_RESEARCH]비행이 필요함(잠수함 제외))[NEWLINE] 유닛이 [COLOR:255:230:85:255]다른 아군 유닛에 인접[ENDCOLOR]해 있는 경우 [ICON_STRENGTH]공격력 +10%'),
			('TXT_KEY_PROMOTION_SANBO_AIR',				'카미카제'),
			('TXT_KEY_PROMOTION_SANBO_AIR_HELP',		'유닛의 체력이 [COLOR:255:230:85:255]최대 HP의 20% 이하인 경우[ENDCOLOR][ICON_RANGE_STRENGTH] 원거리 전투력 +30% [COLOR_GREY](비활성화)[ENDCOLOR]'),
			('TXT_KEY_PROMOTION_SANBO_AIR_EFFECT',		'카미카제: 황제를 위하여!'),
			('TXT_KEY_PROMOTION_SANBO_AIR_EFFECT_HELP',	'유닛의 체력이 [COLOR:255:230:85:255]최대 HP의 20% 이하인 경우[ENDCOLOR][ICON_RANGE_STRENGTH] 원거리 전투력 +30% [COLOR_POSITIVE_TEXT](활성화)[ENDCOLOR]');

UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]일본참모본부[ENDCOLOR]는 육군([COLOR_WATER_TEXT]제국군[ENDCOLOR]/[COLOR_YIELD_GOLD]지상 군사[ENDCOLOR]), 해군([COLOR_WATER_TEXT]태양 함대[ENDCOLOR]/[COLOR_YIELD_GOLD]해상 군사[ENDCOLOR]) 및 공군([COLOR_WATER_TEXT]카미카제[ENDCOLOR]/[COLOR_YIELD_GOLD]군용[ENDCOLOR])과 같은 모든 군대를 강화합니다. 또한 부대 건설 시간을 단축하고(+30%[ICON_PRODUCTION]/군사) 내부 능력을 향상시킵니다([COLOR_MAGENTA]무료 정책[ENDCOLOR]). 꼭대기에 있는 벚꽃으로서 당신은 장군과 제독을 훨씬 더 빨리 얻을 수 있습니다(+2[ICON_GREAT_GENERAL]; +3[ICON_GREAT_ADMIRAL]).'
WHERE Tag = 'TXT_KEY_WONDER_SANBO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_SANBO_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_SANBO_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]독재[ENDCOLOR]; 지형: [COLOR_CYAN]해안[ENDCOLOR]; 건물: [COLOR_CYAN]군수창고, 사관 학교[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SANBO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]독재[ENDCOLOR]; 지형: [COLOR_CYAN]해안[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SANBO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Mount Rushmore
INSERT INTO Language_en_US 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_RUSHMORE',		'Mount Rushmore'),
			('TXT_KEY_WONDER_RUSHMORE_QUOTE',	'[NEWLINE]"Guard against the impostures of pretended patriotism." - G. Washington;   "Only lay down true principles, and adhere to them inflexibly." - T. Jefferson;   "The government is us; we are the government, you and I." - T. Roosevelt;   "The dogmas of the quiet past are inadequate to the stormy present." - A. Lincoln[NEWLINE]'),
			('TXT_KEY_WONDER_RUSHMORE_PEDIA',	'TODO'),
			('TXT_KEY_WONDER_RUSHMORE_HELP',	'+1 [ICON_INFLUENCE] World Congress Vote. +1 Artist slot. +1 [ICON_PRODUCTION] Production, +1 [ICON_CULTURE] Culture and +1 [ICON_TOURISM] Tourism from all Mountains inside the City borders. +1 [ICON_CULTURE] Culture and +1 [ICON_TOURISM] Tourism from all Great Works in the Empire.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Mount Rushmore[ENDCOLOR] is a fantastic artistic creation (+1 slot for [ICON_GREAT_ARTIST]) cut in the [COLOR_CITY_BLUE]Mountain[ENDCOLOR] (+1[ICON_PRODUCTION], +1[ICON_CULTURE], +1[ICON_TOURISM]/[ICON_FLOWER]). This work is the main reason people visit this part of the world (+1[ICON_CULTURE], +1[ICON_TOURISM]/[ICON_GREAT_WORK][ICON_GREAT_WORK]) and, as an addition, it conmemorates 4 greatest people in history of the country (+1[ICON_DIPLOMAT] League Vote).'
WHERE Tag = 'TXT_KEY_WONDER_RUSHMORE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_RUSHMORE_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_RUSHMORE_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Mountain[ENDCOLOR]; Feature: [COLOR_CYAN]Forest[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_RUSHMORE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Mountain[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_RUSHMORE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_RUSHMORE',		'러시모어산'),
			('TXT_KEY_WONDER_RUSHMORE_QUOTE',	'[NEWLINE]"애국심을 가장한 사기 행위를 경계하라." - 조지 워싱턴;   "진정한 원칙만 제시하고, 융통성 없이 그것을 고수하라." - 토머스 제퍼슨;   "여러분과 저, 정부는 우리입니다. 우리는 정부입니다." - 시어도어 루스벨트;   "조용한 과거의 교조는 폭풍이 몰아치는 현재에 적합하지 않다." - 에이브러햄 링컨[NEWLINE]'),
			('TXT_KEY_WONDER_RUSHMORE_PEDIA',	'TODO'),
			('TXT_KEY_WONDER_RUSHMORE_HELP',	'[ICON_INFLUENCE]세계 대회 추가 대표단은 1명 부여합니다. 예술가 전문가 슬롯을 +1개 제공합니다. 이 도시에 있는 산에서 [ICON_PRODUCTION]생산 +1 [ICON_CULTURE]문화 +1 [ICON_TOURISM]관광 +1을 제공합니다. 제국의 모든 걸작에서 [ICON_CULTURE]문화 +1 [ICON_TOURISM]관광 +1을 제공합니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]러시모어산[ENDCOLOR]은 [COLOR_CITY_BLUE]산[ENDCOLOR](+1[ICON_PRODUCTION], +1[ICON_CULTURE], +1[ICON_TOURISM]/[ICON_FLOWER])에서 자른 환상적인 예술 작품입니다([ICON_GREAT_ARTIST]전문가 슬롯 +1).추가로 이 작품은 국가 역사상 가장 위대한 4인(+1[ICON_DIPLOMAT] 세계 대회 투표)이 묘사되어 있어 사람들이 세계의 이 지역을 주로 방문하게 합니다(+1[ICON_CULTURE], +1[ICON_TOURISM]/[ICON_GREAT_WORK][ICON_GREAT_WORK]).'
WHERE Tag = 'TXT_KEY_WONDER_RUSHMORE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_RUSHMORE_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_RUSHMORE_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]산[ENDCOLOR]; 특징: [COLOR_CYAN]숲[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_RUSHMORE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]산[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_RUSHMORE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Statue of Liberty
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Statue of Liberty[ENDCOLOR] is your sign towards other communities, that your developement is the best way to rule the world ([COLOR_MAGENTA]free Policy[ENDCOLOR]). Such a confidence increase trust of your citizens, who become more productive in all spheres of life (+1[ICON_PRODUCTION]/All specialists).'
WHERE Tag = 'TXT_KEY_WONDER_STATUE_OF_LIBERTY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'Requires [COLOR_MAGENTA]Freedom[ENDCOLOR]. ', '') WHERE Tag ='TXT_KEY_WONDER_STATUE_OF_LIBERTY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_STATUE_OF_LIBERTY_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_STATUE_OF_LIBERTY_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_UNIT_TEXT]Freedom[ENDCOLOR]; Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; City: [COLOR_CYAN]10 Specialists[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_STATUE_OF_LIBERTY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_UNIT_TEXT]Freedom[ENDCOLOR]; Terrain: [COLOR_CYAN]Coast[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_STATUE_OF_LIBERTY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]자유의 여신상[ENDCOLOR]은 귀하의 발전이 세상을 지배하는 최선의 방법임을 다른 사회에 알리는 표시입니다([COLOR_MAGENTA]무료 정책[ENDCOLOR]). 이러한 자신감은 삶의 모든 영역에서 생산성을 높이는 시민의 신뢰를 높입니다(+1[ICON_PRODUCTION]/모든 전문가).'
WHERE Tag = 'TXT_KEY_WONDER_STATUE_OF_LIBERTY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, '[ICON_IDEOLOGY_FREEDOM][COLOR_MAGENTA]평등[ENDCOLOR] 이념을 채택해야 건설할 수 있습니다. ', '') WHERE Tag ='TXT_KEY_WONDER_STATUE_OF_LIBERTY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_STATUE_OF_LIBERTY_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_STATUE_OF_LIBERTY_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]평등[ENDCOLOR]; 지형: [COLOR_CYAN]해안[ENDCOLOR]; 도시: [COLOR_CYAN]전문가 10명[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_STATUE_OF_LIBERTY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]평등[ENDCOLOR]; 지형: [COLOR_CYAN]해안[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_STATUE_OF_LIBERTY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Empire State Building
UPDATE Language_en_US
SET Text = 'Becoming rich is in your blood, so construction of [COLOR_YIELD_FOOD]Empire State Building[ENDCOLOR] is inevitable (+1[ICON_GOLD]/All specialists). It is a [COLOR_YIELD_FOOD]Stock Exchange[ENDCOLOR] ([ICON_GOLD]; [ICON_GREAT_MERCHANT]), were bankers generate huge profits and people gather to change their future ([COLOR_YIELD_GOLD]free [ICON_GREAT_PEOPLE][ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_BUILDING_EMPIRE_STATE_BUILDING_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,												Text) 
SELECT		'TXT_KEY_BUILDING_EMPIRE_STATE_BUILDING_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_BUILDING_EMPIRE_STATE_BUILDING_HELP';
				
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Flat[ENDCOLOR]; Improved Resource: [COLOR_CYAN]Aluminum[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_EMPIRE_STATE_BUILDING_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Flat[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_EMPIRE_STATE_BUILDING_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR
SET Text = '부자가 되는 것은 당신의 혈통이므로 [COLOR_YIELD_FOOD]엠파이어 스테이트 빌딩[ENDCOLOR]의 건설은 불가피합니다(+1[ICON_GOLD]/모든 전문가). [COLOR_YIELD_FOOD]증권거래소[ENDCOLOR]([ICON_GOLD]; [ICON_GREAT_MERCHANT])는 은행가들이 막대한 이익을 창출하고 사람들이 모여 미래를 바꾸었습니다([COLOR_YIELD_GOLD]무료 [ICON_GREAT_PEOPLE][ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_BUILDING_EMPIRE_STATE_BUILDING_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,												Text) 
SELECT		'TXT_KEY_BUILDING_EMPIRE_STATE_BUILDING_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_EMPIRE_STATE_BUILDING_HELP';
				
UPDATE Language_ko_KR SET Text = '위치: [COLOR_CYAN]평지[ENDCOLOR]; 개발된 자원: [COLOR_CYAN][ICON_RES_ALUMINUM]알루미늄[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_EMPIRE_STATE_BUILDING_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '위치: [COLOR_CYAN]평지[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_EMPIRE_STATE_BUILDING_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Kremlin
UPDATE Language_en_US
SET Text = 'Monumental [COLOR_YIELD_FOOD]Kremlin[ENDCOLOR] is the greatest effort showing your power. Tanks become the main part of your army (+33%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]Armored[ENDCOLOR]) keeping your civilization safe (-1[ICON_HAPPINESS_3] Distress). This will be the sign of your culture ([COLOR_MAGENTA]free Policy[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_KREMLIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'Must be built in a Holy City. ', '') WHERE Tag ='TXT_KEY_WONDER_KREMLIN_HELP';
	
INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_KREMLIN_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_KREMLIN_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_UNIT_TEXT]Order[ENDCOLOR]; Terrain: [COLOR_CYAN]Tundra[ENDCOLOR], [COLOR_NEGATIVE_TEXT]Coast[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_KREMLIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_UNIT_TEXT]Order[ENDCOLOR]; Terrain: [COLOR_NEGATIVE_TEXT]Coast[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_KREMLIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR
SET Text = '기념비적인 [COLOR_YIELD_FOOD]크렘린[ENDCOLOR]은 당신의 힘을 보여주는 가장 위대한 노력입니다. 전차는 당신의 군대의 중요한 부분이 될 것입니다(+33%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]기갑[ENDCOLOR]). 또한 문명을 안전하게 유지합니다(-1[ICON_HAPPINESS_3] 곤경). 크렘린은 당신의 문화의 표시가 될 것입니다([COLOR_MAGENTA]무료 정책[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_KREMLIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, '[COLOR_MAGENTA]질서[ENDCOLOR] 이념을 채택해야 건설할 수 있습니다. ', '') WHERE Tag ='TXT_KEY_WONDER_KREMLIN_HELP';
	
INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_KREMLIN_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_KREMLIN_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]질서[ENDCOLOR]; 지형: [COLOR_CYAN]툰드라[ENDCOLOR], [COLOR_NEGATIVE_TEXT]해안을 피할 것[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_KREMLIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]질서[ENDCOLOR]; 지형: [COLOR_NEGATIVE_TEXT]해안을 피할 것[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_KREMLIN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Motherland Calls
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Motherland Calls[ENDCOLOR] strengthen internal security using a [COLOR_YIELD_FOOD]Police Station[ENDCOLOR] ([ICON_SPY]; [ICON_HAPPINESS_3]; [ICON_CULTURE]; [ICON_RESEARCH]) and you will be able to motivate more troops in this city (+100% of [ICON_CITIZEN] as [ICON_SILVER_FIST]). Maintanence of your city infrastructure is much lower (-10%[ICON_GOLD][ICON_GOLD] Maintenance) and your enemies become less successful in pillaging (Enemies cannot restore HP or gain [ICON_GOLD] from Pillaging).'
WHERE Tag = 'TXT_KEY_WONDER_MOTHERLAND_STATUE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'Requires [COLOR_MAGENTA]Order[ENDCOLOR]. ', '') WHERE Tag ='TXT_KEY_WONDER_MOTHERLAND_STATUE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_MOTHERLAND_STATUE_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_MOTHERLAND_STATUE_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_NEGATIVE_TEXT]Coast[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MOTHERLAND_STATUE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Hill[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MOTHERLAND_STATUE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]어머니 조국상[ENDCOLOR]은 [COLOR_YIELD_FOOD]경찰서[ENDCOLOR]([ICON_SPY]; [ICON_HAPPINESS_3]; [ICON_CULTURE]; [ICON_RESEARCH])를 사용하여 내부 보안을 강화하고 이 도시에서 더 많은 군대에 동기를 부여할 수 있습니다. ([ICON_CITIZEN]의 +100%를 [ICON_SILVER_FIST]로). 도시 기반 시설의 유지 관리가 훨씬 낮아지고(-10%[ICON_GOLD][ICON_GOLD] 유지 관리) 적의 약탈 성공률이 낮아집니다(적은 약탈을 통해 체력을 복원하거나 [ICON_GOLD]를 얻을 수 없음).'
WHERE Tag = 'TXT_KEY_WONDER_MOTHERLAND_STATUE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, 'Requires [COLOR_MAGENTA]Order[ENDCOLOR]. ', '') WHERE Tag ='TXT_KEY_WONDER_MOTHERLAND_STATUE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_MOTHERLAND_STATUE_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_MOTHERLAND_STATUE_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_NEGATIVE_TEXT]해안을 피할 것[ENDCOLOR]; 위치: [COLOR_CYAN]언덕[ENDCOLOR]; 특징: [COLOR_CYAN]강[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MOTHERLAND_STATUE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '위치: [COLOR_CYAN]언덕[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MOTHERLAND_STATUE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Cristo Redentor
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Cristo Redentor[ENDCOLOR] is an invitation for tourists from all over the world (+25[ICON_TOURISM]) and will make your [COLOR_YIELD_FOOD]Hotels[ENDCOLOR] (+2[ICON_CULTURE]; +2[ICON_GOLDEN_AGE]; +2[ICON_TOURISM]) an important part of your fortune.'
WHERE Tag = 'TXT_KEY_WONDER_CRISTO_REDENTOR_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_CRISTO_REDENTOR_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_CRISTO_REDENTOR_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR]; Feature: [COLOR_CYAN]Forest/Jungle[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CRISTO_REDENTOR_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CRISTO_REDENTOR_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]구세주 그리스도상[ENDCOLOR]은 전 세계 관광객을 위한 초대장(+25[ICON_TOURISM])으로 귀하의 [COLOR_YIELD_FOOD]호텔[ENDCOLOR](+2[ICON_CULTURE], +2[ICON_GOLDEN_AGE], +2[ICON_TOURISM])을 행운의 중요한 부분으로 만듭니다.'
WHERE Tag = 'TXT_KEY_WONDER_CRISTO_REDENTOR_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_CRISTO_REDENTOR_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_CRISTO_REDENTOR_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 위치: [COLOR_CYAN]언덕[ENDCOLOR]; 특징: [COLOR_CYAN]숲/정글[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CRISTO_REDENTOR_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 위치: [COLOR_CYAN]언덕[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CRISTO_REDENTOR_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Broadway
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Broadway[ENDCOLOR] is a perfect place for talented musicians ([COLOR_YIELD_GOLD]free [ICON_GREAT_MUSICIAN][ENDCOLOR]), who can present here fruits of their imagination (+3[ICON_GREAT_WORK] if themed: [ICON_GOLD]), and every future construction in this city will be awarded by them (250[ICON_CULTURE]/Construction).'
WHERE Tag = 'TXT_KEY_WONDER_BROADWAY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'Requires completion of [COLOR_MAGENTA]Industry[ENDCOLOR] Branch. ', '') WHERE Tag ='TXT_KEY_WONDER_BROADWAY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_BROADWAY_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_BROADWAY_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Industry Finisher[ENDCOLOR]; Plot: [COLOR_CYAN]Flat[ENDCOLOR]; Great Works: [COLOR_CYAN]3 [ICON_GREAT_WORK] GW of Music[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BROADWAY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Industry Finisher[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BROADWAY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]브로드웨이[ENDCOLOR]는 재능 있는 음악가([COLOR_YIELD_GOLD]무료 [ICON_GREAT_MUSICIAN][ENDCOLOR])에게 완벽한 장소입니다. 이들은 여기에 자신의 상상의 열매를 제시할 수 있습니다(+3[ICON_GREAT_WORK] 테마보너스: [ICON_GOLD]). 이 도시의 모든 향후 건설은 그들에 의해 수여될 것입니다(250[ICON_CULTURE]/건물 건설).'
WHERE Tag = 'TXT_KEY_WONDER_BROADWAY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, '[COLOR_MAGENTA]산업[ENDCOLOR] 정책을 완성해야 건설할 수 있습니다. ', '') WHERE Tag ='TXT_KEY_WONDER_BROADWAY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_BROADWAY_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_BROADWAY_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]산업 완성[ENDCOLOR]; 위치: [COLOR_CYAN]평지[ENDCOLOR]; 걸작: [COLOR_CYAN][ICON_GREAT_WORK]걸작 음악 3개[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BROADWAY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]산업 완성[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_BROADWAY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Prora
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Prora[ENDCOLOR] recreation center makes your citizens happier (+1[ICON_HAPPINESS_1]; +1[ICON_HAPPINESS_1]/2 [COLOR_MAGENTA]Policies[ENDCOLOR]) and pushes them to develop more efiiciently ([COLOR_MAGENTA]free Policy[ENDCOLOR]). Additionally it will protect your future wonder constructions (lower enemy chance to: Sabotage Wonder) and award soldiers devastating enemy lands (25[ICON_CULTURE]/Pillaging).'
WHERE Tag = 'TXT_KEY_WONDER_PRORA_RESORT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'Requires [COLOR_MAGENTA]Autocracy[ENDCOLOR] and can only be constructed in coastal City. ', '') WHERE Tag ='TXT_KEY_WONDER_PRORA_RESORT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_PRORA_RESORT_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_PRORA_RESORT_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_UNIT_TEXT]Autocracy[ENDCOLOR]; Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Plot: [COLOR_CYAN]Flat[ENDCOLOR]; Feature: [COLOR_CYAN]Forest/Jungle[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PRORA_RESORT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_UNIT_TEXT]Autocracy[ENDCOLOR]; Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Plot: [COLOR_CYAN]Flat[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PRORA_RESORT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR
SET Text = 'COLOR_YIELD_FOOD]프로라[ENDCOLOR] 해변 리조트는 시민을 더 행복하게 만들고(+1[ICON_HAPPINESS_1]; +1[ICON_HAPPINESS_1]/2 [COLOR_MAGENTA]정책[ENDCOLOR]) 더 효율적으로 개발하도록 독려합니다([COLOR_MAGENTA]무료 정책[ENDCOLOR ]). 또한 미래의 불가사의 건설을 보호하고(적의 불가사의 파괴 가능성 감소) 적의 땅을 황폐화시키는 병사들에게 상을 줍니다(25[ICON_CULTURE]/약탈).'
WHERE Tag = 'TXT_KEY_WONDER_PRORA_RESORT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, '[ICON_IDEOLOGY_AUTOCRACY][COLOR_MAGENTA]독재[ENDCOLOR] 이념을 채택해야 건설할 수 있습니다. [NEWLINE][NEWLINE][COLOR_YELLOW]해안 도시[ENDCOLOR]에만 건설할 수 있습니다. ', '') WHERE Tag ='TXT_KEY_WONDER_PRORA_RESORT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_PRORA_RESORT_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_PRORA_RESORT_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]독재[ENDCOLOR]; 지형: [COLOR_CYAN]해안[ENDCOLOR]; 위치: [COLOR_CYAN]평지[ENDCOLOR]; 특징: [COLOR_CYAN]숲/정글[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PRORA_RESORT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]독재[ENDCOLOR]; 지형: [COLOR_CYAN]해안[ENDCOLOR]; 위치: [COLOR_CYAN]평지[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PRORA_RESORT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
----------------------------------------------------
-- Habitat-67
INSERT INTO Language_en_US 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_HABITAT',		'Habitat-67'),
			('TXT_KEY_WONDER_HABITAT_QUOTE',	'[NEWLINE]"A house is made of walls and beams; a home is built with love and dreams."[NEWLINE] - Ralph Waldo Emerson[NEWLINE]'),
			('TXT_KEY_WONDER_HABITAT_PEDIA',	'TODO'),
			('TXT_KEY_WONDER_HABITAT_HELP',		'Your City gains 3 [ICON_CITIZEN] Population. +1 [ICON_HAPPINESS_1] Happiness from local Garden, Museum, Hospital and Police Station, -3 [ICON_HAPPINESS_3] Unhappiness from Urbanization and -2 [ICON_HAPPINESS_3] Unhappiness from Distress in your City. +1 [ICON_CULTURE] Culture from all Engineer specialists.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Habitat-67[ENDCOLOR] fully focuses on turning your city into a paradise. It might become really crowded (+3[ICON_CITIZEN]), but the quality of life improves significantly (-3[ICON_HAPPINESS_3] Urbanization; -2[ICON_HAPPINESS_3] Distress), inhabitants can benefit from better infrastructure (+1[ICON_HAPPINESS_1]/[COLOR_YIELD_FOOD]Garden[ENDCOLOR], [COLOR_YIELD_FOOD]Museum[ENDCOLOR], [COLOR_YIELD_FOOD]Hospital[ENDCOLOR], [COLOR_YIELD_FOOD]Police Station[ENDCOLOR]) and engineers still look for more (+1[ICON_CULTURE]/[ICON_GREAT_ENGINEER][ICON_GREAT_ENGINEER]).'
WHERE Tag = 'TXT_KEY_WONDER_HABITAT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_HABITAT_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_HABITAT_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Tundra[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HABITAT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Tundra[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HABITAT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_HABITAT',		'해비타트 67'),
			('TXT_KEY_WONDER_HABITAT_QUOTE',	'[NEWLINE]"집은 벽과 들보로 이루어져 있다. 가정은 사랑과 꿈으로 지어졌다"[NEWLINE] - 랄프 월도 에머슨[NEWLINE]'),
			('TXT_KEY_WONDER_HABITAT_PEDIA',	'TODO'),
			('TXT_KEY_WONDER_HABITAT_HELP',		'이 도시의 [ICON_CITIZEN]시민이 +3 증가하며 이 도시의 정원, 박물관, 병원, 경찰서에서 [ICON_HAPPINESS_1]행복을 +1 제공합니다. 이 도시에서 [ICON_HAPPINESS_3]도시화에 의한 불행이 -3 감소하며 곤경에 의한 [ICON_HAPPINESS_3]불행이 -2 감소합니다. 모든 기술자 전문가가 [ICON_CULTURE]문화 +1을 제공합니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]해비타트 67[ENDCOLOR]은 도시를 낙원으로 만드는 데 전적으로 집중합니다. 정말 붐빌 수 있지만(+3[ICON_CITIZEN]) 삶의 질이 크게 향상되고(-3[ICON_HAPPINESS_3] 도시화, -2[ICON_HAPPINESS_3] 곤경) 주민들은 더 나은 기반 시설의 혜택을 받을 수 있으며(+1[ICON_HAPPINESS_1]/[COLOR_YIELD_FOOD]정원[ENDCOLOR], [COLOR_YIELD_FOOD]박물관[ENDCOLOR], [COLOR_YIELD_FOOD]병원[ENDCOLOR], [COLOR_YIELD_FOOD]경찰서[ENDCOLOR]) 또한 기술자는 여전히 더 많은 것을 찾고 있습니다(+1[ICON_CULTURE]/[ICON_GREAT_ENGINEER][ICON_GREAT_ENGINEER]).'
WHERE Tag = 'TXT_KEY_WONDER_HABITAT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_HABITAT_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_HABITAT_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]툰드라[ENDCOLOR]; 특징: [COLOR_CYAN]강[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HABITAT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]툰드라[ENDCOLOR]; 특징: [COLOR_CYAN]강[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HABITAT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Vostok Station
INSERT INTO Language_en_US 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_VOSTOK',			'Vostok Station'),
			('TXT_KEY_WONDER_VOSTOK_QUOTE',		'[NEWLINE]"On the barren shore, and on the lofty ice barrier in the background, myriads of grotesque penguins squawked and flapped their fins; while many fat seals were visible on the water, swimming or sprawling across large cakes of slowly drifting ice."[NEWLINE] - H.P. Lovecraft[NEWLINE]'),
			('TXT_KEY_WONDER_VOSTOK_PEDIA',		'TODO'),
			('TXT_KEY_WONDER_VOSTOK_HELP',		'All Research Labs gain +2 [ICON_RESEARCH] Science and all Medical Labs gain +3 [ICON_FOOD] Food. +1 [ICON_FOOD] Food, +1 [ICON_PRODUCTION] Production and +4 [ICON_RESEARCH] Science to Snow tiles worked by this City. +5 [ICON_RESEARCH] Science to all Lake tiles worked by this City. +3 Scientist specialist slots in this City.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Vostok Station[ENDCOLOR], built in the coldest part of the world can perform many unusual researches (+3[ICON_GREAT_SCIENTIST]) related to [COLOR_CITY_BLUE]Snow[ENDCOLOR] (+1[ICON_FOOD], +1[ICON_PRODUCTION], +4[ICON_RESEARCH]/[ICON_FLOWER]) or underground [COLOR_CITY_GREEN]Lakes[ENDCOLOR] (+5[ICON_RESEARCH]/[ICON_MUSHROOM]). All samples are analyzed worldwide in all kind of research facilities (+3[ICON_FOOD]/all [COLOR_YIELD_FOOD]Medical Labs[ENDCOLOR]; +2[ICON_RESEARCH]/all [COLOR_YIELD_FOOD]Research Labs[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_VOSTOK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_VOSTOK_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_VOSTOK_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Snow[ENDCOLOR]; Plot: [COLOR_CYAN]Flat[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_VOSTOK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Snow[ENDCOLOR]; Plot: [COLOR_CYAN]Flat[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_VOSTOK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_VOSTOK',			'보스토크 기지'),
			('TXT_KEY_WONDER_VOSTOK_QUOTE',		'[NEWLINE]"척박한 해안가와 배경의 높은 얼음 장벽에서 수많은 그로테스크한 펭귄들이 꽥꽥거리며 지느러미를 펄럭이고 있는 반면, 많은 뚱뚱한 바다표범들이 천천히 떠다니는 큰 얼음 케이크 위에서 수영하거나 널브러져 있는 것이 보였다."[NEWLINE] - H. P. 러브크래프트[NEWLINE]'),
			('TXT_KEY_WONDER_VOSTOK_PEDIA',		'TODO'),
			('TXT_KEY_WONDER_VOSTOK_HELP',		'제국의 모든 연구소는 [ICON_RESEARCH]과학 +2를 제공하고 제국의 모든 의학 연구소는 [ICON_FOOD]식량 +3을 제공합니다. 이 도시의 설원 타일에서 [ICON_FOOD]식량 +1 [ICON_PRODUCTION]생산 +1 [ICON_RESEARCH]과학 +4를 제공하며 이 도시의 호수 타일에서 [ICON_RESEARCH]과학 +5를 제공합니다. 이 도시에 과학자 전문가 슬롯 3개를 제공합니다.');
			
UPDATE Language_ko_KR
SET Text = '세계에서 가장 추운 지역에 건설된 [COLOR_YIELD_FOOD]보스토크 기지[ENDCOLOR]는 [COLOR_CITY_BLUE]설원[ENDCOLOR](+1[ICON_FOOD], +1[ICON_PRODUCTION], +4[ICON_RESEARCH]/[ICON_FLOWER]) 또는 지하 [COLOR_CITY_GREEN]호수[ENDCOLOR](+5[ICON_RESEARCH]/[ICON_MUSHROOM])과 관련된 많은 특이한 연구(+3[ICON_GREAT_SCIENTIST])를 수행할 수 있습니다. 모든 샘플은 전 세계 모든 종류의 연구 시설(+3[ICON_FOOD]/모든 [COLOR_YIELD_FOOD]의학 연구소[ENDCOLOR]; +2[ICON_RESEARCH]/모든 [COLOR_YIELD_FOOD]연구소[ENDCOLOR])에서 분석됩니다.'
WHERE Tag = 'TXT_KEY_WONDER_VOSTOK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_VOSTOK_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_VOSTOK_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]설원[ENDCOLOR]; 위치: [COLOR_CYAN]평지[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_VOSTOK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]설원[ENDCOLOR]; 위치: [COLOR_CYAN]평지[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_VOSTOK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Milestii Mici Winery
INSERT INTO Language_en_US 
			(Tag,										Text)
VALUES		('TXT_KEY_BUILDING_MILESTII_MICI',			'Milestii Mici Winery'),
			('TXT_KEY_WONDER_MILESTII_MICI_QUOTE',		'[NEWLINE]"It''s quite true I''m not drinking anymore; however, I''m not drinking any less either."[NEWLINE] - W.C. Fields[NEWLINE]'),
			('TXT_KEY_WONDER_MILESTII_MICI_PEDIA',		'TODO'),
			('TXT_KEY_WONDER_MILESTII_MICI_HELP',		'-10 [ICON_GOLD] Hurry Cost Modifiers in your Empire. +1 [ICON_FOOD] Food and +1 [ICON_GOLD] Gold per City-State Friend; +2 [ICON_FOOD] Food, +1 [ICON_PRODUCTION] Production, +2 [ICON_GOLD] Gold per City-State Ally. All Merchant specialists gain +1[ICON_FOOD] and +1[ICON_PRODUCTION].');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Milestii Mici Winery[ENDCOLOR] contains the finest wines from all over the Europe, and the world, too (+1[ICON_FOOD], +1[ICON_GOLD]/[ICON_CITY_STATE] Friend; +2[ICON_FOOD], +1[ICON_PRODUCTION], +2[ICON_GOLD]/[ICON_CITY_STATE] Ally). Hired merchants do their best to gather them all in one place (+1[ICON_FOOD], +1[ICON_PRODUCTION]/[ICON_GREAT_MERCHANT][ICON_GREAT_MERCHANT]) and all these traded goods can improve overall prices of new investments (-10[ICON_GOLD][ICON_GOLD] Hurry Cost Modifiers).'
WHERE Tag = 'TXT_KEY_WONDER_MILESTII_MICI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_MILESTII_MICI_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_MILESTII_MICI_HELP';
				
UPDATE Language_en_US SET Text = 'Feature: [COLOR_NEGATIVE_TEXT]Water[ENDCOLOR], [COLOR_CYAN]Forest[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MILESTII_MICI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Feature: [COLOR_NEGATIVE_TEXT]Water[ENDCOLOR], [COLOR_CYAN]Forest[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MILESTII_MICI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

INSERT INTO Language_ko_KR 
			(Tag,										Text)
VALUES		('TXT_KEY_BUILDING_MILESTII_MICI',			'밀레스티 미치 양조장'),
			('TXT_KEY_WONDER_MILESTII_MICI_QUOTE',		'[NEWLINE]"내가 더 이상 술을 마시지 않는다는 것은 꽤 사실이지만, 나는 더 이상 술을 덜 마시지도 않는다."[NEWLINE] - W.C. 필즈[NEWLINE]'),
			('TXT_KEY_WONDER_MILESTII_MICI_PEDIA',		'TODO'),
			('TXT_KEY_WONDER_MILESTII_MICI_HELP',		'제국의 모든 도시에서 [ICON_GOLD]골드로 구매할때 드는 비용이 10% 감소합니다. 우호적인 도시국가 하나당 [ICON_FOOD]식량 +1 [ICON_GOLD]골드 +1을 제공하고 동맹 도시국가는 [ICON_FOOD]식량 +2 [ICON_PRODUCTION]생산 +1 [ICON_GOLD]골드 +2를 추가로 제공합니다. 제국의 모든 상인 전문가는 [ICON_FOOD]식량 +1 [ICON_PRODUCTION]생산 +1을 제공합니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]밀레스티 미치 양조장[ENDCOLOR]에는 유럽 전역과 전 세계의 최고급 와인도 있습니다(+1[ICON_FOOD], +1[ICON_GOLD]/[ICON_CITY_STATE] 우호적; +2[ICON_FOOD], +1 [ICON_PRODUCTION], +2[ICON_GOLD]/[ICON_CITY_STATE] 동맹). 고용된 상인은 모든 것을 한 곳에 모으기 위해 최선을 다하며(+1[ICON_FOOD], +1[ICON_PRODUCTION]/[ICON_GREAT_MERCHANT][ICON_GREAT_MERCHANT]) 이러한 모든 거래 상품은 새로운 투자의 전체 가격을 향상시킬 수 있습니다(-10%[ICON_GOLD][ICON_GOLD]골드 구매 비용).'
WHERE Tag = 'TXT_KEY_WONDER_MILESTII_MICI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_MILESTII_MICI_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_MILESTII_MICI_HELP';
				
UPDATE Language_ko_KR SET Text = '특징: [COLOR_NEGATIVE_TEXT]물을 피할 것[ENDCOLOR], [COLOR_CYAN]숲[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MILESTII_MICI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특징: [COLOR_NEGATIVE_TEXT]물을 피할 것[ENDCOLOR], [COLOR_CYAN]숲[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MILESTII_MICI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Sputnik
INSERT INTO Language_en_US 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_SPUTNIK',		'Sputnik'),
			('TXT_KEY_WONDER_SPUTNIK_QUOTE',	'[NEWLINE]"Listen now for the sound that forevermore separates the old from the new. [Introducing the beep-beep chirp transmitted by the Sputnik satellite.]"[NEWLINE] - NBC Radio[NEWLINE]'),
			('TXT_KEY_WONDER_SPUTNIK_PEDIA',	'TODO'),
			('TXT_KEY_WONDER_SPUTNIK_HELP',		'[COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Policy. +20% [ICON_PRODUCTION] Production towards Spaceship Parts. Starts [ICON_GOLDEN_AGE] Golden Age. +33% generation of [ICON_GREAT_ENGINEER] Great Engineers and +25% generation of [ICON_GREAT_SCIENTIST] Great Scientists in this City.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Sputnik[ENDCOLOR] is a milestone on your way to the space (+20%[ICON_PRODUCION]/[COLOR_YIELD_GOLD]Spaceship Part[ENDCOLOR]; starts [ICON_GOLDEN_AGE]). Many different specialities in your empire will benefit from the discoveries made by this satellite (+33%[ICON_GREAT_ENGINEER]; +25%[ICON_GREAT_SCIENTIST]), not to mention about your citizens ([COLOR_MAGENTA]free Policy[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_SPUTNIK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_SPUTNIK_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_SPUTNIK_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_UNIT_TEXT]Order[ENDCOLOR]; Improved Resource: [COLOR_CYAN][ICON_RES_ALUMINUM] Aluminum[ENDCOLOR]; City: [COLOR_CYAN]3 Scientist Specialists[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SPUTNIK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_UNIT_TEXT]Order[ENDCOLOR]; Improved Resource: [COLOR_CYAN][ICON_RES_ALUMINUM] Aluminum[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SPUTNIK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_SPUTNIK',		'스푸트니크'),
			('TXT_KEY_WONDER_SPUTNIK_QUOTE',	'[NEWLINE]"옛 것과 새 것을 영원히 갈라놓는 소리를 지금 들어 보십시오. 스푸트니크 위성이 보내는 삐삐삐삐 소리를 소개합니다."[NEWLINE] - NBC 라디오[NEWLINE]'),
			('TXT_KEY_WONDER_SPUTNIK_PEDIA',	'TODO'),
			('TXT_KEY_WONDER_SPUTNIK_HELP',		'무료 [COLOR_POSITIVE_TEXT]정책[ENDCOLOR]을 제공합니다. 우주선 부품을 생산할 때 [ICON_PRODUCTION]생산력이 +20% 증가합니다. [ICON_GOLDEN_AGE]황금기를 시작합니다. 이 도시에서 [ICON_GREAT_ENGINEER]위대한 기술자 점수가 +33% 증가하고 [ICON_GREAT_SCIENTIST]위대한 과학자 점수가 +25% 증가합니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]스푸트니크[ENDCOLOR]는 우주로 가는 길의 이정표입니다(+20%[ICON_PRODUCION]/[COLOR_YIELD_GOLD]우주선 부품[ENDCOLOR]; 시작 [ICON_GOLDEN_AGE]). 제국의 다양한 전문가는 이 위성이 발견한 것(+33%[ICON_GREAT_ENGINEER]; +25%[ICON_GREAT_SCIENTIST])은 물론 시민([COLOR_MAGENTA]무료 정책[ENDCOLOR])에 대한 혜택을 받을 것입니다.'
WHERE Tag = 'TXT_KEY_WONDER_SPUTNIK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_SPUTNIK_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_SPUTNIK_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]질서[ENDCOLOR]; 개발된 자원: [COLOR_CYAN][ICON_RES_ALUMINUM]알루미늄[ENDCOLOR]; 도시: [COLOR_CYAN]과학자 전문가 3명[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SPUTNIK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]질서[ENDCOLOR]; 개발된 자원: [COLOR_CYAN][ICON_RES_ALUMINUM]알루미늄[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SPUTNIK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Anitkabir
INSERT INTO Language_en_US 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_ANITKABIR',		'Anitkabir'),
			('TXT_KEY_WONDER_ANITKABIR_QUOTE',	'[NEWLINE]"Peace at home, peace in the world."[NEWLINE] - Mustafa Kemal Atatürk[NEWLINE]'),
			('TXT_KEY_WONDER_ANITKABIR_PEDIA',	'TODO'),
			('TXT_KEY_WONDER_ANITKABIR_HELP',	'[COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Policy. +1 [ICON_INFLUENCE] World Congress Vote and +1 [ICON_INFLUENCE] World Congress Vote for each controlled Enemy Capital. +50% [ICON_PRODUCTION] Production towards Diplomatic units.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Anitkabir[ENDCOLOR] fullfils a dream about world at peace. It makes diplomatic contacts much easier (+50%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]Diplomatic[ENDCOLOR]) and negotiations in World Congress more favourable to your side (+1[ICON_DIPLOMAT] League Vote; +1[ICON_DIPLOMAT] League Vote/controlled Enemy Capital). People will love you and your politics ([COLOR_MAGENTA]free Policy[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_ANITKABIR_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_ANITKABIR_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_ANITKABIR_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_UNIT_TEXT]Autocracy[ENDCOLOR]; Terrain: [COLOR_NEGATIVE_TEXT]Coast[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR]; Feature: [COLOR_CYAN]Forest[ENDCOLOR]/[COLOR_CYAN]Jungle[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ANITKABIR_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_UNIT_TEXT]Autocracy[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ANITKABIR_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_ANITKABIR',		'아느트카비르'),
			('TXT_KEY_WONDER_ANITKABIR_QUOTE',	'[NEWLINE]"가정의 평화가 세계의 평화이다."[NEWLINE] - 무스타파 케말 아타튀르크[NEWLINE]'),
			('TXT_KEY_WONDER_ANITKABIR_PEDIA',	'TODO'),
			('TXT_KEY_WONDER_ANITKABIR_HELP',	'무료 [COLOR_POSITIVE_TEXT]정책[ENDCOLOR]을 제공합니다. [ICON_INFLUENCE]세계 의회 대표단 1명을 제공하며 통제중인 각 적 수도마다 [ICON_INFLUENCE]세계 의회 대표단 1명을 추가로 제공합니다. 외교 유닛을 생산할 때 [ICON_PRODUCTION]생산력이 +50% 증가합니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]아느트카비르[ENDCOLOR]는 평화로운 세계에 대한 꿈을 실현합니다. 외교적 접촉이 훨씬 쉬워지고(+50%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]외교[ENDCOLOR]) 세계 의회에서 협상이 더 유리해집니다(+1[ICON_DIPLOMAT]세계 의회 대표단; +1[ICON_DIPLOMAT]세계 의회 대표단/통제중인 적 수도). 사람들은 당신과 당신의 정치를 사랑할 것입니다([COLOR_MAGENTA]무료 정책[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_ANITKABIR_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_ANITKABIR_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_ANITKABIR_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]독재[ENDCOLOR]; 지형: [COLOR_NEGATIVE_TEXT]해안을 피할 것[ENDCOLOR]; 위치: [COLOR_CYAN]언덕[ENDCOLOR]; 특징: [COLOR_CYAN]숲[ENDCOLOR]/[COLOR_CYAN]정글[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ANITKABIR_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]독재[ENDCOLOR]; 위치: [COLOR_CYAN]언덕[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ANITKABIR_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Thule Air Base
INSERT INTO Language_en_US 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_THULE',			'Thule Air Base'),
			('TXT_KEY_WONDER_THULE_QUOTE',		'[NEWLINE]"A modern, autonomous, and thoroughly trained Air Force in being at all times will not alone be sufficient, but without it, there can be no national security."[NEWLINE] - Henry H. Arnold[NEWLINE]'),
			('TXT_KEY_WONDER_THULE_PEDIA',		'TODO'),
			('TXT_KEY_WONDER_THULE_HELP',		'+10 XP to all Planes produced in this City and +5 XP to all Planes produced in your Empire. +3 Air slots in this City and +2 [ICON_SILVER_FIST] Military Unit Supply Cap in your Empire. All Planes get [COLOR_POSITIVE_TEXT]Operational Range[ENDCOLOR] promotion.'),
			('TXT_KEY_PROMOTION_THULE',			'Operational Range'),
			('TXT_KEY_PROMOTION_THULE_HELP',	'+5%[ICON_RANGE_STRENGTH]RCS. +2 [ICON_SWAP] Range.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Thule Air Base[ENDCOLOR] strengthen your air supremacy by keeping more planes in local hangars (+3[ICON_BULLET]Air slots; +2[ICON_SILVER_FIST]), training better pilots (+10 XP to local Planes; +5 XP to global Planes) or improving the overall units capabilities ([COLOR_WATER_TEXT]Operational Range[ENDCOLOR]/[COLOR_YIELD_GOLD]Planes[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_THULE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_THULE_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_THULE_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Snow[ENDCOLOR], [COLOR_NEGATIVE_TEXT]Coast[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_THULE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Snow[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_THULE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_THULE',			'툴레 공군기지'),
			('TXT_KEY_WONDER_THULE_QUOTE',		'[NEWLINE]"항상 존재하는 현대적이고 자율적이며 철저하게 훈련된 공군만으로는 충분하지 않을 것이지만, 그것 없이는 국가 안보가 있을 수 없다."[NEWLINE] - 헨리 아놀드[NEWLINE]'),
			('TXT_KEY_WONDER_THULE_PEDIA',		'TODO'),
			('TXT_KEY_WONDER_THULE_HELP',		'이 도시에서 생산된 모든 공중 유닛에 경험치 +10를 추가로 부여하며 다른 도시에서 생산된 모든 공중 유닛에 경험치를 +5만큼 부여합니다. 이 도시의 공중 유닛 슬롯이 +3 증가하며 제국의 [ICON_SILVER_FIST]군사 유닛 보급 한도가 +2 증가합니다. 제국의 모든 공중 유닛은 [COLOR_POSITIVE_TEXT]작전 범위[ENDCOLOR] 승급을 받습니다.'),
			('TXT_KEY_PROMOTION_THULE',			'작전 범위'),
			('TXT_KEY_PROMOTION_THULE_HELP',	'[ICON_RANGE_STRENGTH]원거리 공격력 +5%[NEWLINE][ICON_SWAP]사거리 +2');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]툴레 공군기지[ENDCOLOR]는 지역 격납고에 더 많은 비행기를 보관하고(+3[ICON_BULLET]공중 유닛 슬롯, +2[ICON_SILVER_FIST]), 더 나은 조종사를 훈련시키거나(이 도시에서 생산된 공중 유닛에 경험치 +10; 다른 도시에서 생산된 공중 유닛에 경험치 +5) 전체 부대 능력을 개선하여 공중 우위를 강화합니다([COLOR_WATER_TEXT]작전 범위[ENDCOLOR]/[COLOR_YIELD_GOLD]공중[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_THULE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_THULE_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_THULE_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]설원[ENDCOLOR], [COLOR_NEGATIVE_TEXT]해안을 피할 것[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_THULE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]설원[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_THULE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- White Sands Missile Range
INSERT INTO Language_en_US 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_WHITE_SANDS',		'White Sands Missile Range'),
			('TXT_KEY_WONDER_WHITE_SANDS_QUOTE',	'[NEWLINE]"What is pride? A rocket that emulates the stars."[NEWLINE] - William Wordsworth[NEWLINE]'),
			('TXT_KEY_WONDER_WHITE_SANDS_PEDIA',	'The White Sands Missile Range is US largest military installation at almost 8300 square kilometres (3200 square miles) of New Mexico desert. The area was first designated a military site in 1941, when the Alamogordo Army Airfield was established. This site was used for the first Atomic bomb test (The Trinity test) in July 1945, by which time it had been renamed White Sands proving ground.[NEWLINE][NEWLINE]  Since then, the site has been heavily involved in experimental projects and test firings of both militaristic and exploratory projects, including captured V-2 ballistic missiles, the Apollo escape system and as a landing strip for the early Space Shuttle tests. It has been designated a National Historic Site for its role in Space Race testing, and continues to have frequent missile tests.'),
			('TXT_KEY_WONDER_WHITE_SANDS_HELP',		'Grants 3 free [COLOR_POSITIVE_TEXT]Guided Missiles[ENDCOLOR]. +33% [ICON_PRODUCTION] Production in this City when building Missiles and +10% [ICON_PRODUCTION] Production in this City when building Spaceship Parts. Missile units get [COLOR_POSITIVE_TEXT]White Sands Facility[ENDCOLOR] promotion which extends +2 [ICON_RANGE_STRENGTH] Operational Range.'),
			('TXT_KEY_PROMOTION_WHITE_SANDS',		'White Sands Facility'),
			('TXT_KEY_PROMOTION_WHITE_SANDS_HELP',	'+2 [ICON_SWAP] Range.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]White Sands Missile Range[ENDCOLOR] is a facility where numerous tests made rocket engineering reach the highest level ([COLOR_WATER_TEXT]White Sands Facility[ENDCOLOR]/[COLOR_YIELD_GOLD]Missile[ENDCOLOR]). Using latest technologies rockets are cheap and easy to manufacture (+33%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]Missiles[ENDCOLOR]; +10%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]Spaceship Parts[ENDCOLOR]; 3 [COLOR_YIELD_GOLD]free Guided Missiles[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_WHITE_SANDS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_WHITE_SANDS_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_WHITE_SANDS_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Imperialism Finisher[ENDCOLOR]; Terrain: [COLOR_CYAN]Desert[ENDCOLOR]; Plot: [COLOR_CYAN]Flat[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_WHITE_SANDS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Imperialism Finisher[ENDCOLOR]; Terrain: [COLOR_CYAN]Desert[ENDCOLOR]; Plot: [COLOR_CYAN]Flat[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_WHITE_SANDS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

INSERT INTO Language_ko_KR 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_WHITE_SANDS',		'화이트 샌즈 미사일 연습장'),
			('TXT_KEY_WONDER_WHITE_SANDS_QUOTE',	'[NEWLINE]"자존심이란 무엇인가? 별을 모방한 로켓이다."[NEWLINE] - 윌리엄 워즈워스[NEWLINE]'),
			('TXT_KEY_WONDER_WHITE_SANDS_PEDIA',	'화이트 샌즈 미사일 연습장은 뉴멕시코 사막의 거의 8300 평방 킬로미터(3200 평방 마일)에 있는 미국 최대의 군사 시설입니다. 이 곳은 1941년 알라모고르도 육군 비행장이 설립되면서 처음으로 군사 기지로 지정되었습니다. 1945년 7월 최초의 원자 폭탄 실험(트리니티 실험)에 사용되었으며, 당시에는 화이트 샌즈 실험장으로 이름이 바뀌었습니다.[NEWLINE][NEWLINE] 그 이후로, 이 장소는 포획된 V2 탄도 미사일, 아폴로 탈출 시스템, 그리고 초기 우주 왕복선 시험을 위한 착륙대를 포함하여, 군사적인 그리고 탐험적인 프로젝트 모두의 실험 프로젝트와 시험 발사에 많이 관여해 왔습니다. 이 장소는 우주 경쟁 시험에서의 역할로 국가 사적지로 지정되었고, 계속해서 빈번한 미사일 시험이 있습니다.'),
			('TXT_KEY_WONDER_WHITE_SANDS_HELP',		'무료 [COLOR_POSITIVE_TEXT]유도미사일[ENDCOLOR]을 3개 제공합니다. 이 도시에서 미사일을 생산할 때 [ICON_PRODUCTION]생산력이 +33% 증가하며, 우주선 부품을 생산할 때 [ICON_PRODUCTION]생산력이 +10% 증가합니다. 미사일 유닛은 [COLOR_POSITIVE_TEXT]화이트 샌즈 시설[ENDCOLOR]승급을 받아 [ICON_RANGE_STRENGTH]작전 범위를 +2만큼 확장합니다.'),
			('TXT_KEY_PROMOTION_WHITE_SANDS',		'화이트 샌즈 시설'),
			('TXT_KEY_PROMOTION_WHITE_SANDS_HELP',	'[ICON_SWAP]사거리 +2');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]화이트 샌즈 미사일 연습장[ENDCOLOR]은 로켓 공학이 최고 수준에 도달한 수많은 테스트를 거친 시설입니다([COLOR_WATER_TEXT]화이트 샌즈 시설[ENDCOLOR]/[COLOR_YIELD_GOLD]미사일[ENDCOLOR]). 최신 기술을 사용하는 로켓은 저렴하고 제조하기 쉽습니다(+33%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]미사일[ENDCOLOR]; +10%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]우주선 부품[ENDCOLOR]; 무료 [COLOR_YIELD_GOLD]유도 미사일[ENDCOLOR] 3개).'
WHERE Tag = 'TXT_KEY_WONDER_WHITE_SANDS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_WHITE_SANDS_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_WHITE_SANDS_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]제국주의 완성[ENDCOLOR]; 지형: [COLOR_CYAN]사막[ENDCOLOR]; 위치: [COLOR_CYAN]평지[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_WHITE_SANDS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]제국주의 완성[ENDCOLOR]; 지형: [COLOR_CYAN]사막[ENDCOLOR]; 위치: [COLOR_CYAN]평지[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_WHITE_SANDS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Millau Viaduct
INSERT INTO Language_en_US 
			(Tag,							Text)
VALUES		('TXT_KEY_BUILDING_MILLAU',		'Millau Viaduct'),
			('TXT_KEY_WONDER_MILLAU_QUOTE',	'[NEWLINE]"Above the cloud with its shadow is the star with its light. Above all things reverence thyself."[NEWLINE] - Pythagoras[NEWLINE]'),
			('TXT_KEY_WONDER_MILLAU_PEDIA',	'The Millau Viaduct is a cable stayed suspension bridge located in the South of France, spanning the Tarn River valley in Millau. It has a length of 2,460 metres and is the tallest bridge in the world, the highest point being 343 metres from the base. The Viaduct is part of a highway from Paris to Montpiller, in southern France. It is also the tallest structure in France, with the P2 Pillar being taller than the Eifel Tower. The route for the highway was chosen in 1989, with construction beginning in 2001 and taking 5 years.'),
			('TXT_KEY_WONDER_MILLAU_HELP',	'+5% [ICON_TOURISM] Tourism in your Empire. Converts 5% of [ICON_PRODUCTION] Production into [ICON_TOURISM] Tourism. 2 Specialists in the City no longer generates [ICON_HAPPINESS_3] Unhappiness from Urbanization. Land [ICON_INTERNATIONAL_TRADE] Trade Routes gain +100% range.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Millau Viaduct[ENDCOLOR] connects two sides of valley very difficult to pass without such construction, making life of local and more distant citizens (-3[ICON_HAPPINESS_3] Urbanization; +1[ICON_HAPPINESS_1]) or tourists (+5%[ICON_TOURISM][ICON_TOURISM]; 5%[ICON_PRODUCTION] into [ICON_TOURISM]) much easier. It also serves as a new shorter way of transporting goods in your country (Land [ICON_INTERNATIONAL_TRADE]: +100%[ICON_SWAP]).'
WHERE Tag = 'TXT_KEY_WONDER_MILLAU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_MILLAU_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_MILLAU_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_NEGATIVE_TEXT]Coast[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR]; Improvement: [COLOR_CYAN]Village[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MILLAU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Hill[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MILLAU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

INSERT INTO Language_ko_KR 
			(Tag,							Text)
VALUES		('TXT_KEY_BUILDING_MILLAU',		'미요 대교'),
			('TXT_KEY_WONDER_MILLAU_QUOTE',	'[NEWLINE]"그림자가 있는 구름 위에는 빛이 있는 별이 있다. 무엇보다도 자신을 존중하라."[NEWLINE] - 피타고라스[NEWLINE]'),
			('TXT_KEY_WONDER_MILLAU_PEDIA',	'미요 대교는 미요의 따흔 강의 계곡을 가로지르는 프랑스 남부에 위치한 현수교입니다. 미요 대교는 길이가 2,460 미터인 세계에서 가장 높은 다리이며, 가장 높은 지점은 지상에서 343 미터 떨어져 있습니다. 고가교는 프랑스 남부의 파리에서 몽필러로 가는 고속도로의 일부입이며 대교의 P2 기둥은 에펠탑보다 더 높은 프랑스에서 가장 높은 구조물입니다. 고속도로의 노선은 1989년에 선택되었고, 2001년에 공사가 시작되어 5년이 걸렸습니다.'),
			('TXT_KEY_WONDER_MILLAU_HELP',	'제국 내 [ICON_TOURISM]관광이 +5% 증가합니다. [ICON_PRODUCTION]생산의 5%를 [ICON_TOURISM]관광으로 전환합니다. 도시의 전문가 2명은 더 이상 도시화로 인한 [ICON_HAPPINESS_3]불행을 생성하지 않습니다. 지상 [ICON_INTERNATIONAL_TRADE] 교역로의 범위가 +100% 증가합니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]미요 대교[ENDCOLOR]는 중대한 공사 없이는 통과하기 매우 어려운 계곡의 두 측면을 연결하여 지역 주민과 멀리 떨어져 있는 시민(-3[ICON_HAPPINESS_3] 도시화; +1[ICON_HAPPINESS_1]) 또는 관광객(+5%[ICON_TOURISM][ICON_TOURISM], [ICON_PRODUCTION]의 5%를 [ICON_TOURISM]으로) 훨씬 더 쉽습니다. 또한 귀하의 국가에서 상품을 더 짧게 운송하는 새로운 방법으로도 사용됩니다(지상 [ICON_INTERNATIONAL_TRADE]: +100%[ICON_SWAP]).'
WHERE Tag = 'TXT_KEY_WONDER_MILLAU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_MILLAU_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_MILLAU_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_NEGATIVE_TEXT]해안을 피할 것[ENDCOLOR]; 위치: [COLOR_CYAN]언덕[ENDCOLOR]; 시설: [COLOR_CYAN]마을[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MILLAU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '위치: [COLOR_CYAN]언덕[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_MILLAU_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Revolutionary Museum
INSERT INTO Language_en_US 
			(Tag,											Text)
VALUES		('TXT_KEY_BUILDING_REVOLUTIONARY_MUSEUM',		'Revolutionary Museum'),
			('TXT_KEY_WONDER_REVOLUTIONARY_MUSEUM_QUOTE',	'[NEWLINE]"The oppressed peoples can liberate themselves only through struggle. This is a simple and clear truth confirmed by history."[NEWLINE] - Kim Il-sung[NEWLINE]'),
			('TXT_KEY_WONDER_REVOLUTIONARY_MUSEUM_PEDIA',	'TODO'),
			('TXT_KEY_WONDER_REVOLUTIONARY_MUSEUM_HELP',	'[COLOR_POSITIVE_TEXT]Free[ENDCOLOR] Policy. +3 [ICON_CULTURE] Culture from all Monuments and +2 [ICON_TOURISM] Tourism from all Police Stations and Constabularies in your Empire. +10% generation of [ICON_GREAT_PEOPLE] Great People in this City. 50 [ICON_CULTURE] Culture on Great Person expending scaling with Era.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Revolutionary Museum[ENDCOLOR] praise your civilization''s leaders like Gods (+3[ICON_CULTURE]/all [COLOR_YIELD_FOOD]Monuments[ENDCOLOR]; 50[ICON_CULTURE]/[ICON_GREAT_PEOPLE]; [COLOR_MAGENTA]free Policy[ENDCOLOR]). There''s also much higher chance to have a worthy successor on his place (+10%[ICON_GREAT_PEOPLE][ICON_GREAT_PEOPLE]). All security services do everything to show people from all over the world the most important parts of your country (+2[ICON_TOURISM]/all [COLOR_YIELD_FOOD]Police Stations[ENDCOLOR], [COLOR_YIELD_FOOD]Constabularies[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_REVOLUTIONARY_MUSEUM_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_REVOLUTIONARY_MUSEUM_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_REVOLUTIONARY_MUSEUM_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_UNIT_TEXT]Order[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR]; Building: [COLOR_CYAN]Broadcast Tower, Police Station[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_REVOLUTIONARY_MUSEUM_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_UNIT_TEXT]Order[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR]; Building: [COLOR_CYAN]Broadcast Tower[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_REVOLUTIONARY_MUSEUM_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

INSERT INTO Language_ko_KR 
			(Tag,											Text)
VALUES		('TXT_KEY_BUILDING_REVOLUTIONARY_MUSEUM',		'조선혁명박물관'),
			('TXT_KEY_WONDER_REVOLUTIONARY_MUSEUM_QUOTE',	'[NEWLINE]"억압받는 국민들은 투쟁을 통해서만 스스로를 해방시킬 수 있다. 이는 역사가 확인한 단순하고 분명한 진실이다."[NEWLINE] - 김일성[NEWLINE]'),
			('TXT_KEY_WONDER_REVOLUTIONARY_MUSEUM_PEDIA',	'TODO'),
			('TXT_KEY_WONDER_REVOLUTIONARY_MUSEUM_HELP',	'무료 [COLOR_POSITIVE_TEXT]정책[ENDCOLOR]을 제공합니다. 제국의 모든 기념비에서 [ICON_CULTURE] 문화 +3을 제공하고 제국의 모든 경찰대와 경찰서에서 [ICON_TOURISM]관광 +2를 제공합니다. 이 도시의 [ICON_GREAT_PEOPLE]위인 생셩률이 +10% 증가합니다. 위인이 소비될 때 [ICON_CULTURE]문화 50[COLOR:105:105:105:255](시대별 보정, 원자력 시대 기준 300)[ENDCOLOR]을 제공합니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]조선혁명박물관[ENDCOLOR] 신과 같은 문명의 지도자를 찬양하게 합니다(+3[ICON_CULTURE]/모든 [COLOR_YIELD_FOOD]기념비[ENDCOLOR], 50[ICON_CULTURE]/[ICON_GREAT_PEOPLE], [COLOR_MAGENTA]무료 정책[ENDCOLOR]). 또한 자신의 자리에 가치 있는 후계자가 있을 가능성이 훨씬 더 높아집니다(+10%[ICON_GREAT_PEOPLE][ICON_GREAT_PEOPLE]). 모든 국가 보안 기관은 전 세계 사람들에게 국가의 가장 중요한 부분(+2[ICON_TOURISM]/모든 [COLOR_YIELD_FOOD]경찰대[ENDCOLOR], [COLOR_YIELD_FOOD]경찰서[ENDCOLOR])을 보여주기 위해 최선을 다합니다.'
WHERE Tag = 'TXT_KEY_WONDER_REVOLUTIONARY_MUSEUM_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_REVOLUTIONARY_MUSEUM_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_REVOLUTIONARY_MUSEUM_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]질서[ENDCOLOR]; 위치: [COLOR_CYAN]언덕[ENDCOLOR]; 건물: [COLOR_CYAN]방송탑, 경찰서[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_REVOLUTIONARY_MUSEUM_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_UNIT_TEXT]질서[ENDCOLOR]; 위치: [COLOR_CYAN]언덕[ENDCOLOR]; 건물: [COLOR_CYAN]방송탑[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_REVOLUTIONARY_MUSEUM_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Arecibo Observatory
INSERT INTO Language_en_US 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_ARECIBO',		'Arecibo Observatory'),
			('TXT_KEY_WONDER_ARECIBO_QUOTE',	'[NEWLINE]"The surface of the Earth is the shore of the cosmic ocean. From it we have learned most of what we know. Recently, we have waded a little out to sea, enough to dampen our toes or, at most, wet our ankles. The water seems inviting. The ocean calls."[NEWLINE] - Carl Sagan[NEWLINE]'),
			('TXT_KEY_WONDER_ARECIBO_PEDIA',	'The Arecibo Observatory is the world''s largest Radio Telescope, at 305 metres (1000 feet) in width. It was constructed in 1963 in a naturally-formed sinkhole near Arecibo, Puerto Rico. It consists of the dish, which is on the ground, and a large reciever suspended above the dish by three towers which vary in height due to ground elevation.[NEWLINE][NEWLINE]  Since its construction in 1963, the observatory has been used for a variety of different purposes. Originally designed to study Earth''s Ionosphere (The layer of Earth''s atmosphere above 85 kilometres where solar radiation still affects the atmosphere. Auroras form in this layer), the Arecibo Observatory has since made a variety of discoveries and been used for several research projects. In 1990, the telescope was used to discover the first ever known Exo-planets (Planets existing outside our own Solar System). It was also used to discover Neutron stars (stars that half half a million times more mass than Earth in an area equivalent to the size of Brooklyn, New York). It has also been used for countless other astronomical discoveries.[NEWLINE][NEWLINE]  In 1974, the Observatory sent a message of binary characters, consisting of the numbers 1 to 10, DNA makeup, the solar system and more information, towards a star cluster known as globular cluser M13, around 25,000 light years away, in the hope of contacting intelligent life.'),
			('TXT_KEY_WONDER_ARECIBO_HELP',		'+2 Scientist slots. +1 [ICON_RESEARCH] Science from all Mountain tiles in your Empire. +1 [ICON_RESEARCH] Science from all Scientist Specialists in your Empire. +2 [ICON_RESEARCH] Science from Observatories in your Empire. Receive 1 [COLOR_POSITIVE_TEXT]Additional[ENDCOLOR] [ICON_DOPLOMAT] World Congress Delegate.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Arecibo Observatory[ENDCOLOR], scientific milestone, built on [COLOR_CITY_BLUE]Mountain[ENDCOLOR] (+1[ICON_RESEARCH]/[ICON_FLOWER][ICON_FLOWER] to corresponding City) and hiring specialists (+2 slots for [ICON_GREAT_SCIENTIST]; +1[ICON_RESEARCH]/[ICON_GREAT_SCIENTIST][ICON_GREAT_SCIENTIST]) to boost science in many knowledge domains (+2[ICON_GOLD]/all [COLOR_YIELD_FOOD]Observatories[ENDCOLOR]). This can be a solution to unify scientists from all over the world (+1[ICON_DIPLOMAT] League Vote).'
WHERE Tag = 'TXT_KEY_WONDER_ARECIBO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_ARECIBO_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_ARECIBO_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Rationalism Finisher[ENDCOLOR]; Terrain: [COLOR_CYAN]Mountain[ENDCOLOR]; Improvement: [COLOR_CYAN]Academy[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ARECIBO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Rationalism Finisher[ENDCOLOR]; Terrain: [COLOR_CYAN]Mountain[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ARECIBO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_ARECIBO',		'아레시보 천문대'),
			('TXT_KEY_WONDER_ARECIBO_QUOTE',	'[NEWLINE]"지구의 표면은 우주 바다의 해안입니다. 그것으로부터 우리는 우리가 알고 있는 대부분의 것을 배웠습니다. 최근에, 우리는 발가락을 적시거나 기껏해야 발목을 적시기에 충분할 정도로 바다로 조금 걸었습니다. 물이 매력적인 것 같습니다. 바다가 부릅니다."[NEWLINE] - 칼 세이건[NEWLINE]'),
			('TXT_KEY_WONDER_ARECIBO_PEDIA',	'아레시보 천문대는 폭이 305미터(1000피트)인 세계에서 가장 큰 전파 망원경입니다. 그것은 1963년 푸에르토리코 아레시보 근처의 자연적으로 형성된 싱크홀에 건설되었으며 땅 위에 있는 접시와, 지상의 높이에 따라 높이가 달라지는 세 개의 탑에 의해 접시 위에 매달린 큰 받침으로 구성되어 있습니다.[NEWLINE][NEWLINE] 1963년에 건설된 이래로, 천문대는 다양한 목적으로 사용되어 왔습니다. 원래는 지구의 전리층(태양 복사가 대기에 여전히 영향을 미치는 85킬로미터 이상의 지구 대기층, 오로라는 이 층에서 형성됨)을 연구하기 위해 설계되었습니다. 아레시보 천문대는 그 이후 다양한 발견을 했고 여러 연구 프로젝트에 사용되었습니다. 1990년, 이 망원경은 최초로 알려진 외계 행성(우리 태양계 밖에 존재하는 행성)을 발견하는 데 사용되었습니다. 그것은 또한 중성자별(뉴욕 브루클린의 크기에 해당하는 지역에서 지구보다 50만 배나 질량이 큰 별)을 발견하는 데 사용되었습니다. 그것은 또한 셀 수 없이 많은 다른 천문학적인 발견들을 위해 사용되었습니다.[NEWLINE][NEWLINE] 1974년, 천문대는 지적 생명체와 접촉하기를 바라며 약 25,000광년 떨어진 구상성단 M13으로 알려진 성단을 향해 숫자 1부터 10까지, DNA 구성, 태양계 및 더 많은 정보로 구성된 이진법 문자 메시지를 보냈습니다.'),
			('TXT_KEY_WONDER_ARECIBO_HELP',		'과학자 전문가 슬롯을 +2명 제공합니다. 제국의 모든 산 타일에서 [ICON_RESEARCH]과학 +1을 제공합니다. 제국의 모든 과학자 전문가로부터 [ICON_RESEARCH]과학 +1을 받습니다. 제국의 천문대에서 [ICON_RESEARCH]과학 +2를 제공합니다. 추가 [ICON_DOPLOMAT][COLOR_POSITIVE_TEXT]세계 대회 대표단[ENDCOLOR] 1명을 받습니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]아레시보 천문대[ENDCOLOR]는 [COLOR_CITY_BLUE]산[ENDCOLOR](+1[ICON_RESEARCH]/[ICON_FLOWER][ICON_FLOWER])에 건설된 과학적 이정표이며 전문가를 고용하며([ICON_GREAT_SCIENTIST] 전문가 슬롯 +2개, +1[ICON_RESEARCH]/[ICON_GREAT_SCIENTIST][ICON_GREAT_SCIENTIST]) 많은 지식 영역에서 과학을 강화합니다(+2[ICON_GOLD]/모든 [COLOR_YIELD_FOOD]천문대[ENDCOLOR]). 이는 전 세계의 과학자들을 통합하는 해결책이 될 수 있습니다(+1[ICON_DIPLOMAT]세계 대회 대표단).'
WHERE Tag = 'TXT_KEY_WONDER_ARECIBO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_ARECIBO_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_ARECIBO_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]합리 완성[ENDCOLOR]; 지형: [COLOR_CYAN]산[ENDCOLOR]; 시설: [COLOR_CYAN]아카데미[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ARECIBO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]합리 완성[ENDCOLOR]; 지형: [COLOR_CYAN]산[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_ARECIBO_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Pentagon
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Pentagon[ENDCOLOR] focuses on military abilities of your cities (+1[ICON_SILVER_FIST][ICON_SILVER_FIST]; +2 global City Air Cap). Increased forces for production of your planes (+50%[ICON_PRODUCTION], +20 XP/[COLOR_YIELD_GOLD]Air[ENDCOLOR]; 2 [COLOR_YIELD_GOLD]free Jet Fighters[ENDCOLOR]. And it can even more, thanks to hidden intelligence agency, making your spies more effective (higher chance to: Disrupt [ICON_PRODUCTION]).'
WHERE Tag = 'TXT_KEY_WONDER_PENTAGON_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'Requires completion of [COLOR_MAGENTA]Imperialism[ENDCOLOR] Branch. ', '') WHERE Tag ='TXT_KEY_WONDER_PENTAGON_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_PENTAGON_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_PENTAGON_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Imperialism Finisher[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR]; Improvement: [COLOR_CYAN]Citadel/Fort[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PENTAGON_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Imperialism Finisher[ENDCOLOR]; Improvement: [COLOR_CYAN]Citadel/Fort[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PENTAGON_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]펜타곤[ENDCOLOR]은 도시의 군사 능력에 초점을 맞춥니다(+1[ICON_SILVER_FIST][ICON_SILVER_FIST]; 모든 도시의 공중 유닛 정원 +2). 항공기 생산을 위한 병력이 증가합니다(+50%[ICON_PRODUCTION], 경험치 +20/[COLOR_YIELD_GOLD]공중[ENDCOLOR], [COLOR_YIELD_GOLD]무료 제트기[ENDCOLOR] 2개).'
WHERE Tag = 'TXT_KEY_WONDER_PENTAGON_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, '[COLOR_MAGENTA]제국주의[ENDCOLOR] 정책을 완성해야 건설할 수 있습니다. ', '') WHERE Tag ='TXT_KEY_WONDER_PENTAGON_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_PENTAGON_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_PENTAGON_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]제국주의 완성[ENDCOLOR]; 특징: [COLOR_CYAN]강[ENDCOLOR]; 시설: [COLOR_CYAN]성채/요새[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PENTAGON_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]제국주의 완성[ENDCOLOR]; 시설: [COLOR_CYAN]성채/요새[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_PENTAGON_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Bletchey Park
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Bletchey Park[ENDCOLOR] is place filled with scientists (+1[ICON_RESEARCH]/All Scientists) and spies (+2[ICON_SPY]; [ICON_SPY][ICON_SPY] level up; -15% Enemy [ICON_SPY][ICON_SPY] Effectiveness). The most advanced [COLOR_YIELD_FOOD]Research Lab[ENDCOLOR] ([ICON_RESEARCH]; [ICON_GREAT_SCIENTIST]; [ICON_HAPPINESS_3]) is constructed to increase your knowledge.'
WHERE Tag = 'TXT_KEY_BUILDING_BLETCHLEY_PARK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'Requires completion of [COLOR_MAGENTA]Rationalism[ENDCOLOR] Branch. ', '') WHERE Tag ='TXT_KEY_BUILDING_BLETCHLEY_PARK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_BUILDING_BLETCHLEY_PARK_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_BUILDING_BLETCHLEY_PARK_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Rationalism Finisher[ENDCOLOR]; Terrain: [COLOR_CYAN]Grassland[ENDCOLOR], [COLOR_NEGATIVE_TEXT]Coast[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_BLETCHLEY_PARK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Special: [COLOR_MAGENTA]Rationalism Finisher[ENDCOLOR]; Terrain: [COLOR_NEGATIVE_TEXT]Coast[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_BLETCHLEY_PARK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]블레츨리 파크[ENDCOLOR]는 과학자(+1[ICON_RESEARCH]/모든 과학자 전문가)와 스파이(+2[ICON_SPY], [ICON_SPY][ICON_SPY] 레벨 상승, 적 [ICON_SPY][ICON_SPY] 효과 -15%)으로 가득 찬 장소입니다. 가장 발전된 [COLOR_YIELD_FOOD]연구소[ENDCOLOR]([ICON_RESEARCH]; [ICON_GREAT_SCIENTIST]; [ICON_HAPPINESS_3])는 지식을 늘리기 위해 구성되었습니다.'
WHERE Tag = 'TXT_KEY_BUILDING_BLETCHLEY_PARK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, '[COLOR_MAGENTA]합리[ENDCOLOR] 정책을 완성해야 건설할 수 있습니다. ', '') WHERE Tag ='TXT_KEY_BUILDING_BLETCHLEY_PARK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_BUILDING_BLETCHLEY_PARK_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_BUILDING_BLETCHLEY_PARK_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]합리 완성[ENDCOLOR]; 지형: [COLOR_CYAN]초원[ENDCOLOR], [COLOR_NEGATIVE_TEXT]해안을 피할 것[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_BLETCHLEY_PARK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특수: [COLOR_MAGENTA]합리 완성[ENDCOLOR]; 지형: [COLOR_NEGATIVE_TEXT]해안을 피할 것[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_BLETCHLEY_PARK_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
----------------------------------------------------
-- Svalbard Global Seed Vault
INSERT INTO Language_en_US 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_SEED_VAULT',		'Svalbard Global Seed Vault'),
			('TXT_KEY_WONDER_SEED_VAULT_QUOTE',	'[NEWLINE]"The fact that the seed collection destroyed in Syria during the civil war has been systematically rebuilt shows that the vault functions as an insurance for current and future food supply and for local food security."[NEWLINE] - Anne Beathe Tvinnereim[NEWLINE]'),
			('TXT_KEY_WONDER_SEED_VAULT_PEDIA',	'TODO'),
			('TXT_KEY_WONDER_SEED_VAULT_HELP',	'+10% [ICON_FOOD] Food in your Empire. -15% [ICON_HAPPINESS_3] from [ICON_FOOD]/[ICON_PRODUCTION] Distress in your Empire. Every City adds 50% of its [ICON_PRODUCTION] Production to current [PRODUCTION] after new Citizen is born.[NEWLINE][NEWLINE]All [ICON_RES_WHEAT] Wheat: +2 [ICON_FOOD] Food.[NEWLINE]All [ICON_RES_MAIZE] Maize: +2 [ICON_FOOD] Food.[NEWLINE]All [ICON_RES_RICE] Rice: +2 [ICON_FOOD] Food.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Svalbard Global Seed Vault[ENDCOLOR] is an insurance policy in case of tragic events (+10%[ICON_FOOD][ICON_FOOD]). It contains seeds of most known plants (+2[ICON_FOOD]/[ICON_RES_WHEAT][ICON_RES_WHEAT], [ICON_RES_MAIZE][ICON_RES_MAIZE], [ICON_RES_RICE][ICON_RES_RICE]), boosts production in secured areas (50% of each city''s [ICON_PRODUCTION] is added to their current [ICON_PRODUCTION] on [ICON_CITIZEN] Birth) and supports the most affected people (-15%[ICON_HAPPINESS_3][ICON_HAPPINESS_3] Distress).'
WHERE Tag = 'TXT_KEY_WONDER_SEED_VAULT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_SEED_VAULT_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_SEED_VAULT_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Snow[ENDCOLOR]; Feature: [COLOR_NEGATIVE_TEXT]Water[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SEED_VAULT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Snow[ENDCOLOR]; Feature: [COLOR_NEGATIVE_TEXT]Fresh Water[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SEED_VAULT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_SEED_VAULT',		'스발바르 국제 종자 저장고'),
			('TXT_KEY_WONDER_SEED_VAULT_QUOTE',	'[NEWLINE]"내전 중 시리아에서 파괴된 종자 수집품이 체계적으로 재건되었다는 사실은 저장고가 현재와 미래의 식량 공급과 지역 식량 안보를 위한 보험 기능을 하고 있음을 보여줍니다."[NEWLINE] - 안네 베아세 트빈네레임[NEWLINE]'),
			('TXT_KEY_WONDER_SEED_VAULT_PEDIA',	'TODO'),
			('TXT_KEY_WONDER_SEED_VAULT_HELP',	'제국의 모든도시의 [ICON_FOOD]식량이 +10% 증가합니다. 제국에서 [ICON_FOOD]/[ICON_PRODUCTION]곤경에 의한 [ICON_HAPPINESS_3]불행이 -15% 감소합니다. 모든 도시에서 새로운 [ICON_CITIZEN]시민이 태어날 때, 그때의 [ICON_PRODUCTION]생산량의 50%만큼 [PRODUCTION]생산을 추가로 제공합니다. 제국의 모든 도시의 [ICON_RES_WHEAT]밀, [ICON_RES_MAIZE]옥수수, [ICON_RES_RICE]쌀에서 [ICON_FOOD]식량 +2를 제공합니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]스발바르 국제 종자 저장고[ENDCOLOR]는 비극적인 사건에 대비한 보험 정책입니다(+10%[ICON_FOOD][ICON_FOOD]). 여기에는 가장 잘 알려진 식물의 씨앗이 포함되어 있으며(+2[ICON_FOOD]/[ICON_RES_WHEAT][ICON_RES_WHEAT], [ICON_RES_MAIZE][ICON_RES_MAIZE], [ICON_RES_RICE][ICON_RES_RICE]), 확보된 지역에서 생산을 촉진하고(각 도시의 50% [ICON_PRODUCTION]이 [ICON_CITIZEN] 출생 시 현재 [ICON_PRODUCTION]에 추가됨) 가장 큰 피해를 입은 사람들을 지원합니다(-15%[ICON_HAPPINESS_3][ICON_HAPPINESS_3] 곤경).'
WHERE Tag = 'TXT_KEY_WONDER_SEED_VAULT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_SEED_VAULT_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_SEED_VAULT_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]설원[ENDCOLOR]; 특징: [COLOR_NEGATIVE_TEXT]물을 피할 것[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SEED_VAULT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]설원[ENDCOLOR]; 특징: [COLOR_NEGATIVE_TEXT]담수를 피할 것[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SEED_VAULT_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Palm Jumeirah
INSERT INTO Language_en_US 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_JUMEIRAH',		'Palm Jumeirah'),
			('TXT_KEY_WONDER_JUMEIRAH_QUOTE',	'[NEWLINE]"Dubai''s world class physical infrastructure has already established it as a major player in terms of trade, tourism and as the leading conference and exhibition venue in this part of the world."[NEWLINE] - Abdul Aziz Al Ghurair[NEWLINE]'),
			('TXT_KEY_WONDER_JUMEIRAH_PEDIA',	'Located off the shore of Dubai in the United Arab Emirates (UAE), Palm Jumeirah is a large archipelago created by man in the shape of a palm tree. It was announced in 2001, and originally was intended to be one of three "Palm Islands" along with the Palm Jebel Ali and the Palm Deira, which was intended to be the largest of the three islands at the time. The archipelago has a total area of 25 square kilometres, comparable to over 800 American football pitches.[NEWLINE][NEWLINE] Palm Jumeirah consists of a central trunk, connected to the mainland by a 300 metre long bridge, sixteen fronds of the palm, and an 11 kilometre breakwater surrounding the construction. In total, the islands more than doubled Dubai''s existing coastline.[NEWLINE][NEWLINE] The islands are also a hotbed for new developments and resorts, much like the rest of Dubai. The Atlantis resort opened on the breakwater in 2008, which later became a symbol of the developments.'),
			('TXT_KEY_WONDER_JUMEIRAH_HELP',	'Converts 10% of [ICON_PRODUCTION] Production produced by this City into [ICON_GOLD] Gold and another 15% into [ICON_TOURISM] Tourism. +3 [ICON_PRODUCTION] Production from all Desert tiles worked by this City. +7 [ICON_TOURISM] Tourism from all Atolls in your Empire.[NEWLINE][NEWLINE]All [ICON_RES_OIL] Oil: +4 [ICON_GOLD] Gold.');
			
UPDATE Language_en_US
SET Text = 'Artificial islands called [COLOR_YIELD_FOOD]Palm Jumeirah[ENDCOLOR] create new space on [COLOR_CITY_GREEN]Atolls[ENDCOLOR] for rich tourists (+7[ICON_TOURISM]/[ICON_MUSHROOM][ICON_MUSHROOM]). Whole construction was possible thanks to the sand gathered from the local [COLOR_CITY_BLUE]Desert[ENDCOLOR] (+3[ICON_PRODUCTION]/[ICON_FLOWER]; 10%[ICON_PRODUCTION] into [ICON_GOLD]; 15%[ICON_PRODUCTION] into [ICON_TOURISM]) and [COLOR_GREY]Oil[ENDCOLOR] deposits found on your territory (+4[ICON_GOLD]/[ICON_RES_OIL][ICON_RES_OIL]).'
WHERE Tag = 'TXT_KEY_WONDER_JUMEIRAH_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_JUMEIRAH_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_JUMEIRAH_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Improved Resource: [COLOR_CYAN]Oil[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_JUMEIRAH_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_JUMEIRAH_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_JUMEIRAH',		'팜 주메이라'),
			('TXT_KEY_WONDER_JUMEIRAH_QUOTE',	'[NEWLINE]"두바이는 세계적인 수준의 물리적 인프라를 바탕으로 이미 무역, 관광 측면에서 주요 기업으로 자리매김했으며, 두바이는 이 지역에서 주요 회의 및 전시회 개최지로 자리매김했습니다."[NEWLINE] - 압둘 아지즈 알 구라이르[NEWLINE]'),
			('TXT_KEY_WONDER_JUMEIRAH_PEDIA',	'아랍 에미리트 연합국의 두바이 해안 근처에 위치한 팜 주메이라는 야자수 모양의 인간에 의해 만들어진 큰 군도입니다. 2001년에 발표되었으며, 원래는 당시 세 섬 중 가장 큰 섬이었던 팜 제벨 알리, 팜 데이라와 함께 세 개의 "팜 아일랜드" 중 하나로 계획되었습니다. 군도의 총 면적은 25평방 킬로미터로 800개 이상의 미식축구 경기장과 맞먹습니다.[NEWLINE][NEWLINE] 팜 주메이라는 300미터 길이의 다리, 16개의 손바닥 가장자리, 그리고 건물을 둘러싼 11킬로미터 길이의 방파제로 본토와 연결된 중앙 트렁크로 구성되어 있습니다. 전체적으로, 그 섬들은 두바이의 기존 해안선의 두 배 이상을 차지했습니다.[NEWLINE][NEWLINE] 이 섬들은 또한 두바이의 다른 지역들과 마찬가지로 새로운 개발과 리조트들의 온상이기도 합니다. 아틀란티스 리조트는 2008년에 방파제에 문을 열었고, 이것은 나중에 발전의 상징이 되었습니다.'),
			('TXT_KEY_WONDER_JUMEIRAH_HELP',	'이 도시의 [ICON_PRODUCTION]생산량을 [ICON_GOLD]골드로 10%만큼 전환하고 또 다른 [ICON_PRODUCTION]생산량을 [ICON_TOURISM]관광으로 15%만큼 전환합니다. 이 도시의 사막 타일에서 [ICON_PRODUCTION]생산 +3을 제공합니다. 제국의 모든 산호섬에서 [ICON_TOURISM]관광 +7을 제공하고 제국의 모든 [ICON_RES_OIL]석유에서 [ICON_GOLD]골드 +4를 제공합니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]팜 주메이라[ENDCOLOR]라는 인공 섬은 부유한 관광객을 위해 [COLOR_CITY_GREEN]산호섬[ENDCOLOR]에 새로운 공간을 만듭니다(+7[ICON_TOURISM]/[ICON_MUSHROOM][ICON_MUSHROOM]). 전체 건설은 현지 [COLOR_CITY_BLUE]사막[ENDCOLOR]에서 모은 모래 덕분에 가능했으며(+3[ICON_PRODUCTION]/[ICON_FLOWER]; [ICON_PRODUCTION]의 10%를 [ICON_GOLD]로; [ICON_PRODUCTION]의 15%를 [ICON_TOURISM]로) 또한 [COLOR_GREY]석유[ENDCOLOR] 매장지가 영토에서 발견되었습니다(+4[ICON_GOLD]/[ICON_RES_OIL][ICON_RES_OIL]).'
WHERE Tag = 'TXT_KEY_WONDER_JUMEIRAH_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_JUMEIRAH_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_JUMEIRAH_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 개발된 자원: [COLOR_CYAN][ICON_RES_OIL]석유[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_JUMEIRAH_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_JUMEIRAH_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Taipei 101
INSERT INTO Language_en_US 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_TAIPEI',			'Taipei 101'),
			('TXT_KEY_WONDER_TAIPEI_QUOTE',		'[NEWLINE]"Everything is designed. Few things are designed well."[NEWLINE] - Brian Reed[NEWLINE]'),
			('TXT_KEY_WONDER_TAIPEI_PEDIA',		'Taipei 101 is a financial tower in Taipei, the capital city of Taiwan. It was the tallest building in the world from 2004 to 2010, being surpassed by the Burj Khalifa in Dubai. Across five floors from the 87th to the 91st floors is a large turned mass damper, which stops the tower from suffering damage from amplitudinal waves caused by high winds. The tower is also designed with symbolism in mind. It is not only a large sundial with the shadow it casts, it is composed of 8 segments of 8 floors, eight being a traditional number for good luck. The design also takes into account ancient Chinese Pagoda design.'),
			('TXT_KEY_WONDER_TAIPEI_HELP',		'+1 [ICON_GOLD] Gold from all Engineer Specialists in your Empire. +2 [ICON_GOLD] Gold from Villages and Towns worked by this City. All Banks and Stock Exchanges in your Empire receive +2 [ICON_GOLD] Gold. Receive 1 [COLOR_POSITIVE_TEXT]Additional[ENDCOLOR] [ICON_DOPLOMAT] World Congress Delegate.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Taipei 101[ENDCOLOR] is a huge challenge for engineers (+1[ICON_RESEARCH]/[ICON_GREAT_ENGINEER][ICON_GREAT_ENGINEER]). It serves as a diplomatic point (+1[ICON_DIPLOMAT] League Vote), business center (+2[ICON_GOLD]/all [COLOR_YIELD_FOOD]Banks[ENDCOLOR], [COLOR_YIELD_FOOD]Stock Exchanges[ENDCOLOR]) and commercial hub connecting local [COLOR_CITY_BROWN]Villages[ENDCOLOR] and [COLOR_CITY_BROWN]Towns[ENDCOLOR] together (+2[ICON_GOLD]/[ICON_WORKER]).'
WHERE Tag = 'TXT_KEY_WONDER_TAIPEI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_TAIPEI_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_TAIPEI_HELP';
				
UPDATE Language_en_US SET Text = 'Improvement: [COLOR_CYAN]Village[ENDCOLOR]; Player: [COLOR_CYAN]3 [ICON_CITY_STATE] Allies[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_TAIPEI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = ''||Text WHERE Tag ='TXT_KEY_WONDER_TAIPEI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_TAIPEI',			'타이페이 101'),
			('TXT_KEY_WONDER_TAIPEI_QUOTE',		'[NEWLINE]"모든 것은 설계되어있다. 잘 설계된 것은 거의 없다."[NEWLINE] - 브라이언 리드[NEWLINE]'),
			('TXT_KEY_WONDER_TAIPEI_PEDIA',		'타이페이 101은 대만의 수도인 타이페이에 있는 금융 타워입니다. 그것은 2004년부터 2010년까지 두바이의 부르즈 칼리파가 지어지기 전까지는 세계에서 가장 높은 빌딩이었습니다. 87층부터 91층까지 5개 층에 걸쳐 대형 회전식 매스 댐퍼가 설치되어 있어 강풍으로 인한 진폭파로 타워가 손상되는 것을 방지합니다. 그 탑은 또한 상징성을 염두에 두고 설계되었습니다. 타이페이 101은 그것이 드리우는 그림자가 있는 큰 해시계일 뿐만 아니라, 8개의 층으로 구성되어 있고, 8개는 행운을 위한 전통적인 숫자입니다. 그 디자인은 또한 고대 중국 탑 디자인을 고려했습니다.'),
			('TXT_KEY_WONDER_TAIPEI_HELP',		'제국의 모든 기술자 전문가로부터 [ICON_RESEARCH]과학 +1을 받습니다. 이 도시의 마을과 소도시에서 [ICON_GOLD]골드 +2를 제공합니다. 제국의 모든 은행과 증권 거래소가 [ICON_GOLD]골드 +2 골드를 제공합니다. 추가 [ICON_DOPLOMAT][COLOR_POSITIVE_TEXT]세계 대회 대표단[ENDCOLOR] 1명을 제공합니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]타이베이 101[ENDCOLOR]은 기술자(+1[ICON_RESEARCH]/[ICON_GREAT_ENGINEER][ICON_GREAT_ENGINEER])에게 큰 도전입니다. 외교 지점(+1[ICON_DIPLOMAT]세계 대회 대표단), 비즈니스 센터(+2[ICON_GOLD]/모든 [COLOR_YIELD_FOOD]은행[ENDCOLOR], [COLOR_YIELD_FOOD]증권 거래소[ENDCOLOR]) 및 지역의 [COLOR_CITY_BROWN]마을[ENDCOLOR]과 [COLOR_CITY_BROWN]소도시[ENDCOLOR] (+2[ICON_GOLD]/[ICON_WORKER])연결하는 상업 허브 역할을 합니다.'
WHERE Tag = 'TXT_KEY_WONDER_TAIPEI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_TAIPEI_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_TAIPEI_HELP';
				
UPDATE Language_ko_KR SET Text = '시설: [COLOR_CYAN]마을[ENDCOLOR]; 플레이어: [COLOR_CYAN][ICON_CITY_STATE]동맹 도시국가 3개[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_TAIPEI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = ''||Text WHERE Tag ='TXT_KEY_WONDER_TAIPEI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Curiosity Rover
INSERT INTO Language_en_US 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_CURIOSITY',			'Curiosity Rover'),
			('TXT_KEY_WONDER_CURIOSITY_QUOTE',		'[NEWLINE]"Projects we have completed demonstrate what we know - future projects decide what we will learn."[NEWLINE] - Dr. Mohsin Tiwana[NEWLINE]'),
			('TXT_KEY_WONDER_CURIOSITY_PEDIA',		'TODO'),
			('TXT_KEY_WONDER_CURIOSITY_HELP',		'Grants 50 [ICON_INFLUENCE] on construction. +3 [ICON_GOLDEN_AGE] Golden Age Points from all Scientist and Engineer Specialists in your Empire. +10 global [ICON_GOLDEN_AGE] Golden Age Points from each Research Agreement you sign.');
			
UPDATE Language_en_US
SET Text = 'Sending [COLOR_YIELD_FOOD]Curiosity Rover[ENDCOLOR] is an impuls for other nations, that you have the power and will to rule the Solar System (50[ICON_INFLUENCE]/[ICON_CITY_STATE][ICON_CITY_STATE]). This is only the start for you glorious march from one golden age to another (+10[ICON_GOLDEN_AGE][ICON_GOLDEN_AGE]/Research Agreement; +3[ICON_GOLDEN_AGE]/[ICON_GREAT_ENGINEER][ICON_GREAT_ENGINEER],[ICON_GREAT_SCIENTIST][ICON_GREAT_SCIENTIST]).'
WHERE Tag = 'TXT_KEY_WONDER_CURIOSITY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_CURIOSITY_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_CURIOSITY_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Mountain[ENDCOLOR]; Feature: [COLOR_NEGATIVE_TEXT]Water[ENDCOLOR]; Improved Resource: [COLOR_CYAN]Aluminum[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CURIOSITY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Desert[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CURIOSITY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

INSERT INTO Language_ko_KR 
			(Tag,									Text)
VALUES		('TXT_KEY_BUILDING_CURIOSITY',			'큐리오시티 로버'),
			('TXT_KEY_WONDER_CURIOSITY_QUOTE',		'[NEWLINE]"우리가 완료한 프로젝트는 우리가 알고 있는 것을 보여줍니다. 미래의 프로젝트는 우리가 무엇을 배울지를 결정합니다."[NEWLINE] - 모신 티와나 박사[NEWLINE]'),
			('TXT_KEY_WONDER_CURIOSITY_PEDIA',		'TODO'),
			('TXT_KEY_WONDER_CURIOSITY_HELP',		'건설시 모든 도시국가에 [ICON_INFLUENCE]영향력 +50을 부여합니다. 제국의 모든 과학자 및 기술자 전문가가 [ICON_GOLDEN_AGE]황금기 점수 +3을 제공합니다. 각각의 연구 협정마다 [ICON_GOLDEN_AGE]황금기 점수 +10을 제공합니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]큐리오시티 로버[ENDCOLOR]를 보내는 것은 당신이 태양계(50[ICON_INFLUENCE]/[ICON_CITY_STATE][ICON_CITY_STATE])를 지배할 힘과 의지를 가지고 있음을 다른 국가에 알리는 것입니다. 이것은 하나의 황금 시대에서 다른 황금 시대로의 영광스러운 행진을 위한 시작일 뿐입니다(+10[ICON_GOLDEN_AGE][ICON_GOLDEN_AGE]/연구 협정; +3[ICON_GOLDEN_AGE]/[ICON_GREAT_ENGINEER][ICON_GREAT_ENGINEER], [ICON_GREAT_SCIENTIST][ICON_GREAT_SCIENTIST]).'
WHERE Tag = 'TXT_KEY_WONDER_CURIOSITY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_CURIOSITY_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_CURIOSITY_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]산[ENDCOLOR]; 특징: [COLOR_NEGATIVE_TEXT]물을 피할 것[ENDCOLOR]; 개발된 자원: [COLOR_CYAN][ICON_RES_ALUMINUM]알루미늄[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CURIOSITY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]사막[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CURIOSITY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Global Positioning System
INSERT INTO Language_en_US 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_GPS',			'Global Positioning System'),
			('TXT_KEY_WONDER_GPS_QUOTE',		'[NEWLINE]"Unknown airport with Cessna 150 circling overhead, identify yourself."[NEWLINE] - George W. Stewart[NEWLINE]'),
			('TXT_KEY_WONDER_GPS_PEDIA',		'TODO'),
			('TXT_KEY_WONDER_GPS_HELP',			'Receive 2 or more [COLOR_POSITIVE_TEXT]Additional[ENDCOLOR] [ICON_SPY] Spies (based on number of [ICON_CITY_STATE] City-States in game). Improves Empire Security Level by 20%. Gain 25 [ICON_GREAT_GENERAL] Great General Points and 25 [ICON_GREAT_ADMIRAL] Great Admiral Points for successful offensive Espionage action or 50 [ICON_PRODUCTION] Production and 50 [ICON_GOLD] Gold for successful defensive Espionage action.');
			
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Global Positioning System[ENDCOLOR] helps you maintain security in your country (+2[ICON_SPY]; -20% Enemy [ICON_SPY][ICON_SPY] Effectiveness). Both, your attacks (25[ICON_GREAT_GENERAL], 25[ICON_GREAT_ADMIRAL]/[ICON_SPY] Attack) and defense (50[ICON_PRODUCTION], 50[ICON_GOLD]/[ICON_SPY] Defense) are generously rewarded.'
WHERE Tag = 'TXT_KEY_WONDER_GPS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US (Tag, Text) 
SELECT 'TXT_KEY_WONDER_GPS_HELP_CUT', Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_GPS_HELP';
				
UPDATE Language_en_US SET Text = 'Building: [COLOR_CYAN]Strategic Defense System[ENDCOLOR]; Improved Resource: [COLOR_CYAN]Uranium[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GPS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Improved Resource: [COLOR_CYAN]Uranium[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GPS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

INSERT INTO Language_ko_KR 
			(Tag,								Text)
VALUES		('TXT_KEY_BUILDING_GPS',			'범지구위성항법시스템 (GPS)'),
			('TXT_KEY_WONDER_GPS_QUOTE',		'[NEWLINE]"머리 위를 선회하는 세스나 150이 있는 알려지지 않은 공항, 정체를 밝혀라."[NEWLINE] - 조지 W. 스튜어트[NEWLINE]'),
			('TXT_KEY_WONDER_GPS_PEDIA',		'TODO'),
			('TXT_KEY_WONDER_GPS_HELP',			'[ICON_SPY][COLOR_POSITIVE_TEXT]스파이[ENDCOLOR]를 2명 이상[COLOR:105:105:105:255](게임 내 [ICON_CITY_STATE]도시 국가 수 기준)[ENDCOLOR]받습니다. 제국 보안 수준을 20% 향상시킵니다. 성공적인 첩보 공격을 할 경우 [ICON_GREAT_GENERAL]위대한 장군 점수와 [ICON_GREAT_ADMIRAL]위대한 제독 점수를 각각 +25씩 받고 성공적인 첩보 방어를 할 경우 위해 [ICON_PRODUCTION]생산 +50과 [ICON_GOLD]골드 +50을 받습니다.');
			
UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]글로벌 포지셔닝 시스템[ENDCOLOR]은 국가의 보안을 유지하는 데 도움이 됩니다(+2[ICON_SPY]; 적 [ICON_SPY][ICON_SPY] 효율성 -20%). 접보 공격(25[ICON_GREAT_GENERAL], 25[ICON_GREAT_ADMIRAL]/[ICON_SPY] 공격)과 방어(50[ICON_PRODUCTION], 50[ICON_GOLD]/[ICON_SPY] 방어) 모두 후한 보상을 제공합니다.'
WHERE Tag = 'TXT_KEY_WONDER_GPS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR (Tag, Text) 
SELECT 'TXT_KEY_WONDER_GPS_HELP_CUT', Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_GPS_HELP';
				
UPDATE Language_ko_KR SET Text = '건물: [COLOR_CYAN]전략적 방어 시스템[ENDCOLOR]; 개발된 자원: [COLOR_CYAN][ICON_RES_URANIUM]우라늄[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GPS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '개발된 자원: [COLOR_CYAN][ICON_RES_URANIUM]우라늄[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_GPS_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- CN Tower
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]CN Tower[ENDCOLOR] is unusual [COLOR_YIELD_FOOD]Broadcast Tower[ENDCOLOR] ([ICON_GREAT_WORK]; [ICON_CULTURE]; [ICON_TOURISM]; [ICON_HAPPINESS_3]), which serves for masses (+1[ICON_HAPPINESS_1]/City). All works become much more valuable (+2[ICON_GOLD], +2[ICON_TOURISM], +25%[ICON_TOURISM], +25%[ICON_TOURISM][ICON_TOURISM]/[ICON_GREAT_WORK][ICON_GREAT_WORK]) and all wonders are now tourism centers (+25%[ICON_CULTURE] of all [COLOR_YIELD_FOOD]World Wonders[ENDCOLOR], [COLOR_CITY_GREEN]Natural Wonders[ENDCOLOR] and [COLOR_CITY_BLUE]Tiles[ENDCOLOR] is converted into [ICON_TOURISM][ICON_TOURISM] and another 25% into [ICON_TOURISM]).'
WHERE Tag = 'TXT_KEY_WONDER_CN_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_CN_TOWER_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_CN_TOWER_HELP';
				
UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Flat[ENDCOLOR]; Feature: [COLOR_CYAN]Lake[ENDCOLOR]; Player: [COLOR_CYAN]Happiness > 80%[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CN_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Feature: [COLOR_CYAN]Lake[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CN_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]CN 타워[ENDCOLOR]는 일반적이지 않은 [COLOR_YIELD_FOOD]방송탑[ENDCOLOR]([ICON_GREAT_WORK]; [ICON_CULTURE]; [ICON_TOURISM]; [ICON_HAPPINESS_3])이며 대중에게 서비스를 제공합니다(+1[ICON_HAPPINESS_1]/도시). 모든 작업이 훨씬 더 가치 있게 되고(+2[ICON_GOLD], +2[ICON_TOURISM], +25%[ICON_TOURISM], +25%[ICON_TOURISM][ICON_TOURISM]/[ICON_GREAT_WORK][ICON_GREAT_WORK]) 모든 불가사의는 이제 관광의 중심지입니다(모든 [COLOR_YIELD_FOOD]세계 불가사의[ENDCOLOR], [COLOR_CITY_GREEN]자연 불가사의[ENDCOLOR] 및 [COLOR_CITY_BLUE]타일[ENDCOLOR]에서 산출되는 [ICON_CULTURE] +25%가 [ICON_TOURISM][ICON_TOURISM]으로 전환되고 추가로 +25%가 [ICON_TOURISM]으로 전환).'
WHERE Tag = 'TXT_KEY_WONDER_CN_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_CN_TOWER_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_CN_TOWER_HELP';
				
UPDATE Language_ko_KR SET Text = '위치: [COLOR_CYAN]평지[ENDCOLOR]; 특징: [COLOR_CYAN]호수[ENDCOLOR]; 플레이어: [COLOR_CYAN][ICON_HAPPINESS_1]행복도>80%[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CN_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '특징: [COLOR_CYAN]호수[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_CN_TOWER_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Sydney Opera House
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Sydney Opera House[ENDCOLOR], amazing and original architectural wonder, brings to its halls many nobles, sharing with you with their culture and experience ([COLOR_MAGENTA]free Policy[ENDCOLOR]; +25%[ICON_CULTURE]). Here you can hear wonderful and inspiring music compositions from all over the world (+2[ICON_GREAT_WORK] if themed: [ICON_CULTURE]).'
WHERE Tag = 'TXT_KEY_WONDER_SYDNEY_OPERA_HOUSE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'Can only be constructed in a coastal City. ', '') WHERE Tag ='TXT_KEY_WONDER_SYDNEY_OPERA_HOUSE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_SYDNEY_OPERA_HOUSE_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_SYDNEY_OPERA_HOUSE_HELP';
				
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Great Works: [COLOR_CYAN]4 [ICON_GREAT_WORK] GW of Music[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SYDNEY_OPERA_HOUSE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SYDNEY_OPERA_HOUSE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR
SET Text = '놀랍고 독창적인 건축물인 [COLOR_YIELD_FOOD]시드니 오페라 하우스[ENDCOLOR]는 많은 귀족들을 홀에 초대하여 그들의 문화와 경험을 여러분과 공유합니다([COLOR_MAGENTA]무료 정책[ENDCOLOR]; +25%[ICON_CULTURE]). 여기에서 전 세계의 훌륭하고 영감을 주는 음악 작곡을 들을 수 있습니다(+2[ICON_GREAT_WORK] 테마보너스: [ICON_CULTURE]).'
WHERE Tag = 'TXT_KEY_WONDER_SYDNEY_OPERA_HOUSE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, '[COLOR_YELLOW]해안 도시[ENDCOLOR]에만 건설할 수 있습니다. ', '') WHERE Tag ='TXT_KEY_WONDER_SYDNEY_OPERA_HOUSE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_SYDNEY_OPERA_HOUSE_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_SYDNEY_OPERA_HOUSE_HELP';
				
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR]; 걸작: [COLOR_CYAN][ICON_GREAT_WORK]걸작 음악 4개[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SYDNEY_OPERA_HOUSE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '지형: [COLOR_CYAN]해안[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_SYDNEY_OPERA_HOUSE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Great Firewall
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Great Firewall[ENDCOLOR] makes hacking to your city systems much harder (-99,9% Enemy [ICON_SPY] Effectiveness; -25% Enemy [ICON_SPY][ICON_SPY] Effectiveness). You will be able to resist influence of other civilizations (foreign [ICON_TOURISM] bonus from technologies is negated) and your [COLOR_YIELD_FOOD]Research Labs[ENDCOLOR] (+10[ICON_RESEARCH]) become much more effective.'
WHERE Tag = 'TXT_KEY_BUILDING_GREAT_FIREWALL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_BUILDING_GREAT_FIREWALL_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_BUILDING_GREAT_FIREWALL_HELP';
				
UPDATE Language_en_US SET Text = 'Building: [COLOR_CYAN]Police Station, Wire Service[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_GREAT_FIREWALL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = ''||Text WHERE Tag ='TXT_KEY_BUILDING_GREAT_FIREWALL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]인터넷 검열 시스템[ENDCOLOR]은 도시 시스템 해킹을 훨씬 더 어렵게 만듭니다(-99.9% 적[ICON_SPY] 효율성, -25% 적[ICON_SPY][ICON_SPY] 효율성). 다른 문명의 영향에 저항할 수 있고(기술로 인한 외국 [ICON_TOURISM] 보너스가 무효화됨) [COLOR_YIELD_FOOD]연구소[ENDCOLOR](+10[ICON_RESEARCH])가 훨씬 더 효과적으로 변합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_GREAT_FIREWALL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_BUILDING_GREAT_FIREWALL_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_GREAT_FIREWALL_HELP';
				
UPDATE Language_ko_KR SET Text = '건물: [COLOR_CYAN]경찰서, 통신사[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_GREAT_FIREWALL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = ''||Text WHERE Tag ='TXT_KEY_BUILDING_GREAT_FIREWALL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- Hubble Space Telescope
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Hubble Space Telescope[ENDCOLOR] is last step to your scientific victory (+25%[ICON_PRODUCION]/[COLOR_YIELD_GOLD]Spaceship Part[ENDCOLOR]), supported by brand new [COLOR_YIELD_FOOD]Spaceship Factory[ENDCOLOR] ([ICON_PRODUCTION]; [ICON_RESEARCH]). This huge leap towards space can be an inspiration for further developement (1 [COLOR_YIELD_GOLD]free [ICON_GREAT_SCIENTIST][ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_HUBBLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_HUBBLE_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_HUBBLE_HELP';
				
UPDATE Language_en_US SET Text = 'Improved Resource: [COLOR_CYAN]Aluminum[ENDCOLOR]; Player: [COLOR_CYAN]Research Agreement[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HUBBLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Improved Resource: [COLOR_CYAN]Aluminum[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HUBBLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]허블 우주 망원경[ENDCOLOR]은 새로운 [COLOR_YIELD_FOOD]우주선 공장[ENDCOLOR]([ICON_PRODUCTION]; [ICON_RESEARCH])에서 지원하는 과학적 승리(+25%[ICON_PRODUCION]/[COLOR_YIELD_GOLD]우주선 부품[ENDCOLOR])를 위한 마지막 단계입니다. 우주를 향한 이 거대한 도약은 앞으로의 발전을 위한 영감이 될 수 있습니다(1 [COLOR_YIELD_GOLD]무료 [ICON_GREAT_SCIENTIST][ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_WONDER_HUBBLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_WONDER_HUBBLE_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_WONDER_HUBBLE_HELP';
				
UPDATE Language_ko_KR SET Text = '개받뢴 자원: [COLOR_CYAN][ICON_RES_ALUMINUM]알루미늄[ENDCOLOR]; 플레이어: [COLOR_CYAN]연구 협정[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HUBBLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '개받뢴 자원: [COLOR_CYAN][ICON_RES_ALUMINUM]알루미늄[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_HUBBLE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
-- CERN
UPDATE Language_en_US
SET Text = 'Hidden [COLOR_YIELD_FOOD]CERN[ENDCOLOR] facility gathers all scientists to create huge technological breakthrough (2 [COLOR_CYAN]free Technologies[ENDCOLOR] and amaze those, who can only watch how you drift away (+100[ICON_INFLUENCE]/[ICON_CITY_STATE]).'
WHERE Tag = 'TXT_KEY_BUILDING_CERN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_BUILDING_CERN_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_BUILDING_CERN_HELP';
				
UPDATE Language_en_US SET Text = 'Improved Resource: [COLOR_CYAN]Uranium[ENDCOLOR]; Building: [COLOR_CYAN]Research Lab[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_CERN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_en_US SET Text = 'Improved Resource: [COLOR_CYAN]Uranium[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_CERN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);

UPDATE Language_ko_KR
SET Text = '숨겨진 [COLOR_YIELD_FOOD]유럽 입자물리 연구소[ENDCOLOR] 시설은 모든 과학자들을 모아 거대한 기술적 돌파구([COLOR_CYAN]무료 기술[ENDCOLOR] 2개)를 만들고 여러분이 어떻게 떠내려 가는지만 볼 수 있는 사람들을 놀라게 합니다(+100[ICON_INFLUENCE]/[ICON_CITY_STATE]).'
WHERE Tag = 'TXT_KEY_BUILDING_CERN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_BUILDING_CERN_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_CERN_HELP';
				
UPDATE Language_ko_KR SET Text = '개발된 자원: [COLOR_CYAN][ICON_RES_URANIUM]우라늄[ENDCOLOR]; 건물: [COLOR_CYAN]연구소[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_CERN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
UPDATE Language_ko_KR SET Text = '개발된 자원: [COLOR_CYAN][ICON_RES_URANIUM]우라늄[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_CERN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
----------------------------------------------------
----------------------------------------------------
-- Crystal Palace
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Crystal Palace[ENDCOLOR] is a result of huge industrial potential. It boosts all [COLOR_YIELD_FOOD]Factories[ENDCOLOR] (+2[ICON_PRODUCTION]; +2[ICON_RESEARCH]) and starts new age in your civilization (Start [ICON_GOLDEN_AGE]).'
WHERE Tag = 'TXT_KEY_BUILDING_CRYSTAL_PALACE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'May only be built collaboratively through the World Congress. ', '') WHERE Tag ='TXT_KEY_BUILDING_CRYSTAL_PALACE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_BUILDING_CRYSTAL_PALACE_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_BUILDING_CRYSTAL_PALACE_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR:45:150:50:255]Victory in "World''s Fair" project[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_CRYSTAL_PALACE_HELP';

UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]Crystal Palace[ENDCOLOR] is a result of huge industrial potential. It boosts all [COLOR_YIELD_FOOD]Factories[ENDCOLOR] (+2[ICON_PRODUCTION]; +2[ICON_RESEARCH]) and starts new age in your civilization (Start [ICON_GOLDEN_AGE]).'
WHERE Tag = 'TXT_KEY_BUILDING_CRYSTAL_PALACE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, '[NEWLINE][NEWLINE][COLOR_YELLOW]세계 대회 결의안[ENDCOLOR]으로 비준되어야만 건설할 수 있습니다.', '') WHERE Tag ='TXT_KEY_BUILDING_CRYSTAL_PALACE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_BUILDING_CRYSTAL_PALACE_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_CRYSTAL_PALACE_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: 세계 대회 결의안 [COLOR:45:150:50:255]만국 박람회[ENDCOLOR]에서 승리[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_CRYSTAL_PALACE_HELP';
----------------------------------------------------
-- UN
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]United Nations[ENDCOLOR] can be the most influential comission of all in the world (Start [ICON_GOLDEN_AGE]; Start [COLOR:45:150:50:255]World Congress Session[ENDCOLOR]), where your best delegates (+1[ICON_DIPLOMAT]) will show what is most important for your citizens and those small countries, whose voice is not represented here (25[ICON_INFLUENCE]/[ICON_CITY_STATE]/[ICON_GREAT_PEOPLE]).'
WHERE Tag = 'TXT_KEY_UN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'May only be built collaboratively through the World Congress. ', '') WHERE Tag ='TXT_KEY_UN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_UN_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_UN_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR:45:150:50:255]Victory in "United Nations" project[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_UN_HELP';

UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]유엔[ENDCOLOR]은 전 세계에서 가장 영향력 있는 위원회가 될 수 있습니다([ICON_GOLDEN_AGE] 시작, [COLOR:45:150:50:255]세계 의회 세션[ENDCOLOR] 시작). 여기에서 최고의 대표자(+1[ICON_DIPLOMAT])들은 시민과 여기에 목소리를 낼 수 없는 작은 국가(25[ICON_INFLUENCE]/[ICON_CITY_STATE]/[ICON_GREAT_PEOPLE])들에게 가장 중요한 것이 무엇인지 보여줄 것입니다.'
WHERE Tag = 'TXT_KEY_UN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, '[NEWLINE][NEWLINE][COLOR_YELLOW]세계 대회 결의안[ENDCOLOR]으로 비준되어야만 건설할 수 있습니다.', '') WHERE Tag ='TXT_KEY_UN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_UN_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_UN_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: 세계 대회 결의안 [COLOR:45:150:50:255]국제 연합[ENDCOLOR]에서 승리[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_UN_HELP';
----------------------------------------------------
-- Grand Canal
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Grand Canal[ENDCOLOR] shows your devotion to all those people, who risk their lives on sea frontline ([COLOR_WATER_TEXT]Treasure Fleet[ENDCOLOR]/[COLOR_YIELD_GOLD]Military Naval (no Carriers, Submarines)[ENDCOLOR]). It also allows you to establish another trade route (+1[INTERNATIONAL_TRADE]), but it is your choice if it will be land or sea connection.'
WHERE Tag = 'TXT_KEY_BUILDING_GRAND_CANAL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'May only be built collaboratively through the World Congress. ', '') WHERE Tag ='TXT_KEY_BUILDING_GRAND_CANAL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_BUILDING_GRAND_CANAL_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_BUILDING_GRAND_CANAL_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR:45:150:50:255]Victory in "Treasure Fleet" project[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_GRAND_CANAL_HELP';

UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]대운하[ENDCOLOR]는 목숨을 걸고 해상 전선에서 목숨을 바치는 모든 사람들에 대한 당신의 헌신을 보여줍니다([COLOR_WATER_TEXT]보물 선단[ENDCOLOR]/[COLOR_YIELD_GOLD]근접 해상, 원거리 해상[ENDCOLOR]). 또한 다른 무역로(+1[INTERNATIONAL_TRADE])를 설립할 수 있지만 육상 또는 해상 연결 여부는 귀하의 선택입니다.'
WHERE Tag = 'TXT_KEY_BUILDING_GRAND_CANAL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, '[NEWLINE][NEWLINE][COLOR_YELLOW]세계 대회 결의안[ENDCOLOR]으로 비준되어야만 건설할 수 있습니다.', '') WHERE Tag ='TXT_KEY_BUILDING_GRAND_CANAL_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_BUILDING_GRAND_CANAL_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_GRAND_CANAL_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: 세계 대회 결의안 [COLOR:45:150:50:255]보물 선단[ENDCOLOR]에서 승리[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_GRAND_CANAL_HELP';
----------------------------------------------------
-- International Space Station
UPDATE Language_en_US
SET Text = 'Scientists and engineers work together on [COLOR_YIELD_FOOD]International Space Station[ENDCOLOR] to break barriers (+1[ICON_RESEARCH]/All Engineers; (+1[ICON_PRODUCTION]/All Scientists). Their efforts gives you technological boost (+33%[ICON_RESEARCH]/[ICON_GREAT_SCIENTIST]), and are innovative solution for problems of your industry (200[ICON_PRODUCTION]/[COLOR_CYAN]Technology[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_BUILDING_INTERNATIONAL_SPACE_STATION_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'May only be built collaboratively through the World Congress. ', '') WHERE Tag ='TXT_KEY_BUILDING_INTERNATIONAL_SPACE_STATION_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_BUILDING_INTERNATIONAL_SPACE_STATION_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_BUILDING_INTERNATIONAL_SPACE_STATION_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR:45:150:50:255]Victory in "International Space Station" project[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_INTERNATIONAL_SPACE_STATION_HELP';

UPDATE Language_ko_KR
SET Text = '과학자와 기술자가 [COLOR_YIELD_FOOD]국제 우주 정거장[ENDCOLOR]에서 협력하여 장벽을 허물고 있습니다(+1[ICON_RESEARCH]/모든 기술자 전문가, (+1[ICON_PRODUCTION]/모든 과학자 전문가). 그들의 노력으로 기술이 향상(+33%[ICON_RESEARCH]/[ICON_GREAT_SCIENTIST])되어 산업의 문제에 대한 혁신적인 해결책입니다(200[ICON_PRODUCTION]/[COLOR_CYAN]기술[ENDCOLOR]).'
WHERE Tag = 'TXT_KEY_BUILDING_INTERNATIONAL_SPACE_STATION_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, '[NEWLINE][NEWLINE][COLOR_YELLOW]세계 대회 결의안[ENDCOLOR]으로 비준되어야만 건설할 수 있습니다.', '') WHERE Tag ='TXT_KEY_BUILDING_INTERNATIONAL_SPACE_STATION_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_BUILDING_INTERNATIONAL_SPACE_STATION_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_INTERNATIONAL_SPACE_STATION_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: 세계 대회 결의안 [COLOR:45:150:50:255]국제 우주 정거장[ENDCOLOR]에서 승리[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_INTERNATIONAL_SPACE_STATION_HELP';
----------------------------------------------------
-- Olympic Village
UPDATE Language_en_US
SET Text = 'Olympic Games are great source of joy in these difficult times (+3[ICON_HAPPINESS_1]). [COLOR_YIELD_FOOD]Olympic Village[ENDCOLOR] is here to gather people together, watching games and forgetting about surrounding pain (+25%[ICON_CULTURE] of all [COLOR_YIELD_FOOD]World Wonders[ENDCOLOR], [COLOR_CITY_GREEN]Natural Wonders[ENDCOLOR] and [COLOR_CITY_BROWN]Improvements[ENDCOLOR] into [ICON_TOURISM]). All constructed [COLOR_YIELD_FOOD]Stadiums[ENDCOLOR] (+2[ICON_GOLD]; +2[ICON_TOURISM]) become center of upcoming world events.'
WHERE Tag = 'TXT_KEY_BUILDING_OLYMPIC_VILLAGE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'May only be built collaboratively through the World Congress. ', '') WHERE Tag ='TXT_KEY_BUILDING_OLYMPIC_VILLAGE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_BUILDING_OLYMPIC_VILLAGE_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_BUILDING_OLYMPIC_VILLAGE_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR:45:150:50:255]Victory in "International Games" project[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_OLYMPIC_VILLAGE_HELP';

UPDATE Language_ko_KR
SET Text = '어려운 시기에 올림픽은 큰 기쁨의 원천입니다(+3[ICON_HAPPINESS_1]). [COLOR_YIELD_FOOD]올림픽 선수촌[ENDCOLOR]은 사람들을 모아 경기를 관람하고 주변의 고통을 잊기 위해 여기에 있습니다(모든 [COLOR_YIELD_FOOD]세계 불가사의[ENDCOLOR], [COLOR_CITY_GREEN]자연 불가사의[ENDCOLOR], [COLOR_CITY_BROWN]시설[ENDCOLOR]의 [ICON_CULTURE]의 25%를 [ICON_TOURISM]으로). 건설된 모든 [COLOR_YIELD_FOOD]경기장[ENDCOLOR](+2[ICON_GOLD]; +2[ICON_TOURISM])은 다가오는 세계 이벤트의 중심이 됩니다.'
WHERE Tag = 'TXT_KEY_BUILDING_OLYMPIC_VILLAGE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, '[NEWLINE][NEWLINE][COLOR_YELLOW]세계 대회 결의안[ENDCOLOR]으로 비준되어야만 건설할 수 있습니다.', '') WHERE Tag ='TXT_KEY_BUILDING_OLYMPIC_VILLAGE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_BUILDING_OLYMPIC_VILLAGE_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_OLYMPIC_VILLAGE_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: 세계 대회 결의안 [COLOR:45:150:50:255]국제 스포츠 대회[ENDCOLOR]에서 승리[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_OLYMPIC_VILLAGE_HELP';
----------------------------------------------------
-- Menin Gate
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Menin Gate[ENDCOLOR] will be admonishment for future generations (+2[ICON_CULTURE], +2[ICON_GOLDEN_AGE]/Death). This monument, but also each site releated to recent battles represents the huge pain (+1[ICON_CULTURE], +1[ICON_GOLDEN_AGE]/All [COLOR_CITY_BROWN]Forts[ENDCOLOR], [COLOR_CITY_BROWN]Citadels[ENDCOLOR] and [COLOR_CITY_BROWN]Landmarks[ENDCOLOR]). Maybe there''s a chance to keep current prosperity (+2[ICON_HAPPINESS_1]).'
WHERE Tag = 'TXT_KEY_BUILDING_MENIN_GATE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'May only be built collaboratively through the World Congress. ', '') WHERE Tag ='TXT_KEY_BUILDING_MENIN_GATE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_en_US 
			(Tag,								Text) 
SELECT		'TXT_KEY_BUILDING_MENIN_GATE_HELP_CUT',	Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_BUILDING_MENIN_GATE_HELP';
				
UPDATE Language_en_US SET Text = 'Special: [COLOR:45:150:50:255]Victory in "Global Wargames" project[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_MENIN_GATE_HELP';

UPDATE Language_ko_KR
SET Text = '[COLOR_YIELD_FOOD]메닝 문[ENDCOLOR]는 미래 세대를 위한 훈계입니다(+2[ICON_CULTURE], +2[ICON_GOLDEN_AGE]/유닛 사망). 이 기념물뿐만 아니라 최근 전투와 관련된 각 사이트는 엄청난 고통을 나타냅니다(+1[ICON_CULTURE], +1[ICON_GOLDEN_AGE]/모든 [COLOR_CITY_BROWN]요새[ENDCOLOR], [COLOR_CITY_BROWN]성채[ENDCOLOR] 및 [COLOR_CITY_BROWN]랜드마크[ENDCOLOR]). 아마도 현재의 번영을 유지할 기회가 있을 것입니다(+2[ICON_HAPPINESS_1]).'
WHERE Tag = 'TXT_KEY_BUILDING_MENIN_GATE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1);

UPDATE Language_ko_KR SET Text = REPLACE(Text, '[NEWLINE][NEWLINE][COLOR_YELLOW]세계 대회 결의안[ENDCOLOR]으로 비준되어야만 건설할 수 있습니다.', '') WHERE Tag ='TXT_KEY_BUILDING_MENIN_GATE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

INSERT INTO Language_ko_KR 
			(Tag,								Text) 
SELECT		'TXT_KEY_BUILDING_MENIN_GATE_HELP_CUT',	Text
FROM Language_ko_KR WHERE Tag = 'TXT_KEY_BUILDING_MENIN_GATE_HELP';
				
UPDATE Language_ko_KR SET Text = '특수: 세계 대회 결의안 [COLOR:45:150:50:255]국제 군사 훈련[ENDCOLOR]에서 승리[ENDCOLOR][NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_MENIN_GATE_HELP';
--============================================--
-- EE Compatibility
--============================================--
-- Main Compatibility Code
	-- updating texts for new promotions
	----------------------------------------------------
	-- SMITHSONIAN INSTITUTE
	UPDATE Language_en_US
	SET Text = '[COLOR_YIELD_FOOD]Smithsonian Institute[ENDCOLOR] is well-known [COLOR_YIELD_FOOD]Museum[ENDCOLOR] ([ICON_CULTURE]; [ICON_GREAT_WORK]; [ICON_HAPPINESS_3]; [ICON_GREAT_ARTIST]; [ICON_GOLD]) and contains some nice artwork (+2[ICON_GREAT_WORK] if themed: [ICON_RESEARCH], [ICON_GOLD]). All other similar places profit of its influence (+1[ICON_CULTURE]/all [COLOR_YIELD_FOOD]Museums, Galleries[ENDCOLOR]). Thanks to that people are much happier (-10%[ICON_HAPPINESS_3][ICON_HAPPINESS_3] Illiteracy).'
	WHERE Tag = 'TXT_KEY_WONDER_EE_SMITHSONIAN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value= 1);

	INSERT INTO Language_en_US 
				(Tag,										Text) 
	SELECT		'TXT_KEY_WONDER_EE_SMITHSONIAN_HELP_CUT',	Text
	FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_EE_SMITHSONIAN_HELP';
				
	UPDATE Language_en_US SET Text = 'Feature: [COLOR_CYAN]River[ENDCOLOR]; Improvement: [COLOR_CYAN]Academy[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_EE_SMITHSONIAN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Language_en_US SET Text = 'Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_EE_SMITHSONIAN_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
	----------------------------------------------------
	-- KRONBORG
	UPDATE Language_en_US
	SET Text = 'Your coastline is your defense. [COLOR_YIELD_FOOD]Kronborg[ENDCOLOR] is one way to make it stronger (+3[ICON_STRENGTH], +50 HP, +1[ICON_SILVER_FIST]/all coastal Cities). Your bigger navy (+50%[ICON_PRODUCTION]/[COLOR_YIELD_GOLD]Military Naval[ENDCOLOR]) will be led by powerful leader ([COLOR_YIELD_GOLD]free [ICON_GREAT_ADMIRAL][ENDCOLOR]) and your treasure will be controlled by smart merchants (+1[ICON_GREAT_MERCHANT]).'
	WHERE Tag = 'TXT_KEY_WONDER_EE_KRONBORG_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value= 1);

	INSERT INTO Language_en_US 
				(Tag,								Text) 
	SELECT		'TXT_KEY_WONDER_EE_KRONBORG_HELP_CUT',	Text
	FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_EE_KRONBORG_HELP';
				
	UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Flat[ENDCOLOR]; Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Building: [COLOR_CYAN]Harbor[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_EE_KRONBORG_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=2 OR Value=1));
	----------------------------------------------------
	-- VERSAILLES
	UPDATE Language_en_US
	SET Text = '[COLOR_YIELD_FOOD]Versailles[ENDCOLOR] can be a nice place to spend some time and meet few famous nobles ([COLOR_YIELD_GOLD]free [ICON_GREAT_WRITER][ENDCOLOR]). Your people are aware of your power and hole empire organize long festivals to your name (+50%[ICON_HAPPINESS_1][ICON_HAPPINESS_1] WLTKD length).'
	WHERE Tag = 'TXT_KEY_WONDER_EE_VERSAILLES_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value= 1);

	INSERT INTO Language_en_US 
				(Tag,								Text) 
	SELECT		'TXT_KEY_WONDER_EE_VERSAILLES_HELP_CUT',	Text
	FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_EE_VERSAILLES_HELP';
				
	UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Grassland[ENDCOLOR]; Plot: [COLOR_CYAN]Flat[ENDCOLOR]; Feature: [COLOR_NEGATIVE_TEXT]Water[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_EE_VERSAILLES_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Flat[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_EE_VERSAILLES_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
	----------------------------------------------------
	-- TOPKAPI PALACE
	UPDATE Language_en_US
	SET Text = '[COLOR_YIELD_FOOD]Topkapi Palace[ENDCOLOR] strenghten your faith by praying the defense doctrine (+1[ICON_PEACE]/all [COLOR_YIELD_FOOD]defensive buildings[ENDCOLOR]). Additionally, when you build some planes, you will bring some tourists to new attractions ([COLOR_CYAN]Flight:[ENDCOLOR] +3[ICON_GOLD], +2[ICON_TOURISM]).'
	WHERE Tag = 'TXT_KEY_WONDER_EE_TOPKAPI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value= 1);

	INSERT INTO Language_en_US 
				(Tag,									Text) 
	SELECT		'TXT_KEY_WONDER_EE_TOPKAPI_HELP_CUT',	Text
	FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_EE_TOPKAPI_HELP';
				
	UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Hill[ENDCOLOR]; Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Building: [COLOR_CYAN]Manor[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_EE_TOPKAPI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND (Value=2 OR Value=1));
	----------------------------------------------------
	-- TORRE DEL ORO
	UPDATE Language_en_US
	SET Text = '[COLOR_YIELD_FOOD]Torre del Oro[ENDCOLOR] concentrates on naval trade routes. It makes them easier and more profitable (+1[ICON_INTERNATIONAL_TRADE]; +1[ICON_GREAT_MERCHANT]; Sea [ICON_INTERNATIONAL_TRADE]: +3[ICON_GOLD], +50%[ICON_SWAP]). Bright new [COLOR_YIELD_FOOD]Drydock[ENDCOLOR] ([ICON_STRENGTH]; [ICON_SILVER_FIST]) will be a nice beginning to your naval supremacy.'
	WHERE Tag = 'TXT_KEY_WONDER_EE_TORRE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value= 1);

	UPDATE Language_en_US SET Text = REPLACE(Text, '[NEWLINE][NEWLINE]City must be build on the [COLOR_CYAN]Coast[ENDCOLOR].', '') WHERE Tag ='TXT_KEY_WONDER_EE_TORRE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 0);

	INSERT INTO Language_en_US 
				(Tag,								Text) 
	SELECT		'TXT_KEY_WONDER_EE_TORRE_HELP_CUT',	Text
	FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_EE_TORRE_HELP';
				
	UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Desert[ENDCOLOR], [COLOR_CYAN]Coast[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_EE_TORRE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Coast[ENDCOLOR]; Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_EE_TORRE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
	----------------------------------------------------
	-- WAT PHRA KAEW
	UPDATE Language_en_US
	SET Text = '[COLOR_YIELD_FOOD]Wat Phra Kaew[ENDCOLOR] connects body and mind (+1[ICON_RESEARCH]/all [COLOR_YIELD_FOOD]Shrines[ENDCOLOR]; +2[ICON_RESEARCH]/all [COLOR_YIELD_FOOD]Temples[ENDCOLOR]). What''s more, you gain serious boost to your discoveries (+5[ICON_RESEARCH]; +1[ICON_GREAT_SCIENTIST]).'
	WHERE Tag = 'TXT_KEY_WONDER_EE_WAT_PHRA_KAEW_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value= 1);

	INSERT INTO Language_en_US 
				(Tag,										Text) 
	SELECT		'TXT_KEY_WONDER_EE_WAT_PHRA_KAEW_HELP_CUT',	Text
	FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_EE_WAT_PHRA_KAEW_HELP';
				
	UPDATE Language_en_US SET Text = 'Feature: [COLOR_CYAN]River[ENDCOLOR]; Improvement: [COLOR_CYAN]Holy Site[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_EE_WAT_PHRA_KAEW_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Language_en_US SET Text = 'Feature: [COLOR_CYAN]River[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_EE_WAT_PHRA_KAEW_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
	----------------------------------------------------
	-- FASIL GHEBBI
	UPDATE Language_en_US
	SET Text = '[COLOR_YIELD_FOOD]Fasil Ghebbi[ENDCOLOR] answers for deep need of defense of your vulnerable territory (+5[ICON_STRENGTH]; +100 HP). Your troops will get unique buffs when around this wonder ([COLOR_WATER_TEXT]Fasil Ghebbi[ENDCOLOR]/[COLOR_YIELD_GOLD]Military in city range[ENDCOLOR]) and you can have them even more (+5[ICON_SILVER_FIST]). Your engineers may work on this project, too (+1[ICON_GREAT_ENGINEER]).'
	WHERE Tag = 'TXT_KEY_WONDER_EE_FASIL_GHEBBI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-HELP' AND Value= 1) AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-EE' AND Value= 1);

	INSERT INTO Language_en_US 
				(Tag,										Text) 
	SELECT		'TXT_KEY_WONDER_EE_FASIL_GHEBBI_HELP_CUT',	Text
	FROM Language_en_US WHERE Tag = 'TXT_KEY_WONDER_EE_FASIL_GHEBBI_HELP';
				
	UPDATE Language_en_US SET Text = 'Terrain: [COLOR_CYAN]Plains[ENDCOLOR]; Plot: [COLOR_CYAN]Hill[ENDCOLOR]; Feature: [COLOR_NEGATIVE_TEXT]Water[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_EE_FASIL_GHEBBI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=2);
	UPDATE Language_en_US SET Text = 'Plot: [COLOR_CYAN]Hill[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_WONDER_EE_FASIL_GHEBBI_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MW-SETTING-REQUIREMENT' AND Value=1);
	
