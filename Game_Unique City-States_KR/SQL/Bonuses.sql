---------------------------------------------------
-- Updates - Language_ko_KR
---------------------------------------------------
UPDATE Language_ko_KR SET Text = '[NEWLINE][COLOR_WARNING_TEXT][ICON_BULLET] 군사력이 상위 50% 안에 들어야 합니다. 당신의 군사력은 상위 {1_Num}% 입니다.[ENDCOLOR]' WHERE Tag = 'TXT_KEY_POP_CSTATE_PLEDGE_NEED_MORE_MILITARY_TT';
UPDATE Language_ko_KR
SET Text = '당신은 {1_CityStateName:textkey}의 [COLOR_POSITIVE_TEXT]동맹[ENDCOLOR]입니다. 만약 당신이 동맹을 잃게 된다면 보너스는 [COLOR_FONT_RED]3[ENDCOLOR]턴 동안만 지속될 것입니다. 매 턴 해당 도시 국가와의 [ICON_INFLUENCE]영향력이 {2_Num} 변경됩니다. 당신이 [COLOR_POSITIVE_TEXT]보호 선언[ENDCOLOR]을 하고서 {1_CityStateName:textkey}{@1_CityStateName: plural 1?이; 2?가;} 피해를 받으면 영향력은 3배 빠르게 감소합니다.'
WHERE Tag = 'TXT_KEY_ALLIES_CSTATE_TT';
UPDATE Language_ko_KR
SET Text =  '도시 국가와의 [ICON_INFLUENCE]영향력이 [COLOR_POSITIVE_TEXT]45[ENDCOLOR]에서 시작합니다. 우호 및 동맹인 도시 국가의 산출량이 [COLOR_POSITIVE_TEXT]75%[ENDCOLOR] 증가합니다. 동맹인 도시 국가 수도의 전투력이 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR] 증가합니다. 도시 국가로부터 선물 받은 유닛의 경험치가 [COLOR_POSITIVE_TEXT]10[ENDCOLOR] 증가합니다.'
WHERE Tag = 'TXT_KEY_TRAIT_CITY_STATE_BONUSES';

UPDATE Language_ko_KR SET Text = REPLACE(Text, '가능[ENDCOLOR]', '[ENDCOLOR]가능') WHERE Tag = 'TXT_KEY_CSTATE_CAN_EMBASSY';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '가능![ENDCOLOR].', '[ENDCOLOR]가능!') WHERE Tag = 'TXT_KEY_CSTATE_CAN_PROTECT';
UPDATE Language_ko_KR SET Text = REPLACE(Text, '없어질 것입니다.[NEWLINE][NEWLINE]', '없어질 것입니다.') WHERE Tag = 'TXT_KEY_CSTATE_JERK_STATUS';
---------------------------------------------------
---------------------------------------------------
---------------------------------------------------
-- Texts
---------------------------------------------------
INSERT INTO Language_ko_KR (Tag, Text)
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV', 					'동맹 변화'  UNION ALL
SELECT 'TXT_KEY_CS_ACTIVE_BONUS_HEADER', 				'[COLOR_LIGHT_GREY]도시국가의 주 플레이어 보너스:[ENDCOLOR]'  UNION ALL
SELECT 'TXT_KEY_CS_PASSIVE_BONUS_HEADER', 				'[COLOR_LIGHT_GREY]도시국가의 기본 능력:[ENDCOLOR]'  UNION ALL
SELECT 'TXT_KEY_CS_UU_QUICK_INFO', 						'고유 유닛: [COLOR_YIELD_FOOD]{1_Unique_Unit}[ENDCOLOR], [COLOR_CYAN]{2_Tech}[ENDCOLOR] 이후'  UNION ALL
SELECT 'TXT_KEY_CS_UU_QUICK_INFO', 						'Unique Unit: [COLOR_YIELD_FOOD]{1_Unique_Unit}[ENDCOLOR] available at [COLOR_CYAN]{2_Tech}[ENDCOLOR]'  UNION ALL
-- main definitions
SELECT 'TXT_KEY_CITYSTATE_CLERMONT', 					'클레몬트' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_CLERMONT_ADJ', 					'클레몬트의' UNION ALL
SELECT 'TXT_KEY_CIV5_CLERMONT_TEXT', 						'클레몬트는 제1차 십자군 원정의 시작점이었고, 기독교는 예루살렘을 무슬림의 지배로부터 해방시키려고 했습니다. 교황 우르바노 2세는 1095년 제2차 클레몬트 공의회에서 십자군을 모았습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_HONDURAS', 					'테구시갈파' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_HONDURAS_ADJ', 					'온두라스의' UNION ALL
SELECT 'TXT_KEY_CIV5_HONDURAS_TEXT', 						'온두라스는 16세기에 스페인이 점령하기 전에 몇몇 메소아메리카 문화의 고향이었습니다. 온두라스는 1821년에 독립했고 그 이후로 공화국이 되었습니다. 그러나 공화국은 그들의 정부가 외국인 투자자들로부터 바나나의 개발만을 지원받은 바나나 공화국의 모습으로 남아있습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_AUCKLAND', 					'파리하카' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_AUCKLAND_ADJ', 					'마오리의' UNION ALL
SELECT 'TXT_KEY_CIV5_AUCKLAND_TEXT', 						'마오리족이 지금의 뉴질랜드 북부에 있는 지협에 정착했을 때, 그들은 비옥한 땅, 무성한 정글, 그리고 휴화산으로 가득한 주변 풍경을 발견했습니다. 지협 양쪽에 있는 자연 보호 항구는 풍부한 어업과 전쟁 카누의 기지를 제공했습니다. 정착민들은 그것을 ''타마키 마카오''라고 불렀는데, 대략 "백 명의 연인들이 찾는 소녀"로 번역됩니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_ARMAGH', 						'아마' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_ARMAGH_ADJ', 						'아마의' UNION ALL
SELECT 'TXT_KEY_CIV5_ARMAGH_TEXT', 							'아일랜드의 마을인 아마는 오랫동안 종교를 알고 있었습니다. 고대 이교도들의 예배 장소였던 것으로 생각되는 이곳은 5세기에 기독교 선교사 성 패트릭이 언덕 꼭대기에 석조 교회를 세우고 봉헌하면서 유명해졌습니다. 그 주변에 수도원이 생겼고, 그리고 나서 신학의 첨탑인 아일랜드 전역에 기독교를 전파하는 데 헌신한 마을이 생겼습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_MUSCAT', 						'무스카트' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_MUSCAT_ADJ', 						'무스카트의' UNION ALL
SELECT 'TXT_KEY_CIV5_MUSCAT_TEXT', 							'무스카트를 통해 흐르는 무역은 적어도 2천년 동안 그것의 생명선이었습니다. 알 하자르 산의 기슭에 둥지를 튼 프톨레마이오스는 이 곳을 1세기 초에 숨겨진 항구(''크립투스 포르투스'')라고 불렀습니다. 불행히도 이 도시는 잘 숨겨져 있지 않았습니다. 페르시아 만의 어귀에 위치한 이 도시의 주요 위치는 오랫동안 이곳을 정복하기 위한 매력적인 목표로 만들었습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_GRANADA', 					'그라나다' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_GRANADA_ADJ', 					'그라나다의' UNION ALL
SELECT 'TXT_KEY_CIV5_GRANADA_TEXT', 						'8세기에 우마이야 칼리프는 이베리아 반도를 통해 퍼져나가 비시고딕 히스파니아를 빠르게 정복했습니다. 현재 스페인 남부에 있는 요새화된 정착지인 그라나다가 침공으로 휩쓸렸습니다. 15세기 후반에 이르러서는 가톨릭 군주들에게 항복함으로써 안달루시아의 레키스타는 막을 내리게 되었지만, 천년의 4분의 3 동안 그라나다는 무어인의 소유가 되었습니다.[NEWLINE][NEWLINE]시에라 네바다 산맥의 기슭에 위치한 그라나다는 낮은 평야에 위치해 있기 때문에 거의 방어할 수 없는 불운을 겪었습니다. 그곳의 무어 통치자들은 재빨리 이 사실을 깨닫고 그들의 권력을 마을을 내려다볼 수 있는 더 방어하기 쉬운 언덕으로 옮겼습니다. 그들의 계획 중 일부는 나중에 아름다운 알함브라로 개조될 알자르를 건설하는 것을 포함했습니다.[NEWLINE][NEWLINE]그라나다의 무어족 주인들은 수세기에 걸쳐 변화했습니다. 알모아 가문은 우마이야 왕조의 잔당을 이어받은 알모라비드 가문을 대체했습니다. 그 도시의 운명은 13세기에 가톨릭 왕국 카스티야 왕국과 동맹을 맺은 나스리드 왕조와 함께 그라나다 토후국으로 다시 바뀌었습니다. 사하라 이남 아프리카에 있는 무역 센터로의 직접 접근은 그라나다를 한동안 레콩키스타로부터 해방시켰습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_NANMANDOL', 					'레루' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_NANMANDOL_ADJ', 					'레루의' UNION ALL
SELECT 'TXT_KEY_CIV5_NANMANDOL_TEXT', 						'레루는 선사 시대와 역사적인 주요 고고학 유적지입니다. 그 유적들은 14세기와 15세기 경에 절정에 달했던 문명의 유적들로, 19세기 초 유럽인들의 접촉 당시에도 여전히 그 요소들을 볼 수 있습니다. 레루의 통치자들은 점차적으로 코스라에 섬을 정복하고 통일했습니다. 수도 레루에서, 그들은 고고학자들이 통가나 하와이의 왕국들과 비슷하다고 여기는 군주제로 그 섬을 통치했습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_GWYNEDD', 					'웨일스' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_GWYNEDD_ADJ', 					'웨일스의' UNION ALL
SELECT 'TXT_KEY_CIV5_GWYNEDD_TEXT', 						'귀네드는 로마 시대 말기부터 독립적인 웨일스 왕국이었습니다. 13세기에 영국에 의해 정복되었습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_MUISCA', 						'무이스카' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_MUISCA_ADJ', 						'무이스카의' UNION ALL
SELECT 'TXT_KEY_CIV5_MUISCA_TEXT', 							'무이스카는 16세기까지 서쪽의 판체, 북서쪽의 무조, 북쪽의 과네, 북동쪽의 라체, 동쪽의 아카과아, 그리고 남쪽의 수타가오와 같은 안데스 문화의 고향이었습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_LACONIA', 					'스파르타' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_LACONIA_ADJ', 					'스파르타의' UNION ALL
SELECT 'TXT_KEY_CIV5_LACONIA_TEXT', 						'도시 국가의 수도인 스파르타의 한 지역으로 여겨지는 라코니아는 펠로폰네소스 지역에서 지배권을 다투는 가장 강력한 지역 세력 중 하나입니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_CHEVAK', 						'셰바크' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_CHEVAK_ADJ', 						'셰바크의' UNION ALL
SELECT 'TXT_KEY_CIV5_CHEVAK_TEXT', 							'알래스카의 셰바크족이 사는 지역입니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_SANTO_DOMINGO', 				'산토도밍고' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_SANTO_DOMINGO_ADJ', 				'도밍고의' UNION ALL
SELECT 'TXT_KEY_CIV5_SANTO_DOMINGO_TEXT', 					'산토도밍고는 아메리카 대륙에서 가장 오래된 유럽 도시가 되었습니다. 원래 이름은 라 누에바 이사벨라였고, 1495년에 성 도미니크를 기념하기 위해 산토 도밍고로 이름이 바뀌었습니다. 산토 도밍고는 도시가 커지고 번창하면서 "캐리비안의 관문"으로 알려지게 되었습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_MANAGUA', 					'마나과' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_MANAGUA_ADJ', 					'마나과의' UNION ALL
SELECT 'TXT_KEY_CIV5_MANAGUA_TEXT', 						'메스티소와 스페인 상류층 백인들로 구성된 마나과로, 이 도시는 어촌 마을에서 번영하는 스페인 도시가 되었고, 현재 가장 잘 알려진 중앙아메리카의 발전된 도시가 되었습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_ODENSO', 						'헬싱키' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_ODENSO_ADJ', 						'헬싱키의' UNION ALL
SELECT 'TXT_KEY_CIV5_ODENSO_TEXT', 							'문자 그대로 오딘의 섬으로 번역된 이 섬은 핀란드 왕국에 의해 북유럽 신화의 신 오딘을 인정받아 명명되었습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_YANGCHENG', 					'옌청' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_YANGCHENG_ADJ', 					'옌청의' UNION ALL
SELECT 'TXT_KEY_CIV5_YANGCHENG_TEXT', 						'하 왕조의 첫 번째 수도로, 이허 강 위에 지어졌고 그들의 왕조가 멸망할 때까지 유지되었습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_PHANOTEUS', 					'파노테우스' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_PHANOTEUS_ADJ', 					'파노테우스의' UNION ALL
SELECT 'TXT_KEY_CIV5_PHANOTEUS_TEXT', 						'파노테우스는 매우 오래된 마을로, 원래 플라레야에가 거주했습니다. 프로메테소스가 이곳에서 인류를 만들었다고 여겨집니다. 크세르크세스 휘하의 페르시아인, 필리포스 2세 휘하의 마케도니아인, 폼페이 대왕 휘하의 로마인들에 의해 시간이 지남에 따라 파괴되고 파괴될 때까지 유지되었습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_DOUALA', 						'두알라' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_DOUALA_ADJ', 						'두알라의' UNION ALL
SELECT 'TXT_KEY_CIV5_DOUALA_TEXT', 							'두알라는 카메룬에서 가장 큰 도시이자 이 지역에서 가장 강력한 경제 성장을 한 도시입니다. 1960년 카메룬의 독립은 두알라의 경제적 중요성이 발전과 번영에 결정적이 되면서 두알라의 강력한 급속한 경제 성장을 낳았습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_AMBRACIA', 					'암브라시아' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_AMBRACIA_ADJ', 					'암브라시아의' UNION ALL
SELECT 'TXT_KEY_CIV5_AMBRACIA_TEXT', 						'암브레시아는 고대 그리스 역사에서 마케도니아 왕 카산드로스가 에피로스의 왕 피로스에게 선물한 도시입니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_DJIBOUTI', 					'지부티' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_DJIBOUTI_ADJ', 					'지부티의' UNION ALL
SELECT 'TXT_KEY_CIV5_DJIBOUTI_TEXT', 						'지부티는 프랑스의 지배하에 오복으로 정착하기 전까지 원래 무인도 해안 지역이었습니다. 프랑스로부터 독립한 후에 이름이 바뀌었고 또한 각각의 이름 있는 나라의 수도가 되었습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_DODOMA', 						'다르에스살람' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_DODOMA_ADJ', 						'다르에스살람의' UNION ALL
SELECT 'TXT_KEY_CIV5_DODOMA_TEXT', 							'스와힐리 해안에 위치한 다르에스살람(아랍어: "평화의 거처")은 탄자니아에서 가장 큰 도시이자 예술, 패션, 미디어, 영화, 텔레비전, 금융의 가장 유명한 중심지입니다. 인구 6백만 명이 넘는 다르는 동아프리카에서 가장 큰 도시이자 아프리카에서 6번째로 큰 도시입니다.[NEWLINE][NEWLINE]다르에스살람은 1862년 잔지바르의 초대 술탄인 마지드 빈 사이드가 음지지마(스와힐리어로 "건강한 마을") 마을이 있는 곳. 1887년 독일 동아프리카 회사가 그곳에 역을 세울 때까지 작은 항구에 불과했습니다. 1905년 이 도시는 도시의 성장과 산업 발전을 촉진한 중앙선 철도의 출발점이었습니다. 다르에스살람은 독일 동아프리카(1891~1916), 탕가니카(1961~64), 탄자니아(1964~74)의 수도였습니다. 1974년 도도마는 새 수도로 지정되었지만 공식 기능 이전은 1996년에 공식적으로 완료되었습니다. [NEWLINE][NEWLINE]다르에스살람의 건물은 종종 이 도시의 식민지 시대 과거를 반영하고 스와힐리어, 영국, 독일 및 아시아 전통을 통합하는 다양한 건축 양식을 보여줍니다. 제2차 세계대전 이후 현대화 및 확장으로 병원 단지, 기술 연구소, 고등 법원을 포함한 현대식 다층 건물이 들어섰습니다. 교육 시설로는 다르에스살람 대학교(1961), 여러 도서관 및 연구 기관, 국립 박물관이 있습니다.[NEWLINE][NEWLINE]다르에스살람의 거의 육지로 둘러싸인 자연 항구는 탄자니아 본토 대부분의 출구입니다. 농업 및 광물 수출은 우간다, 르완다, 부룬디, 콩고 민주 공화국, 잠비아 및 말라위와 같은 인근 내륙 국가에 서비스를 제공합니다. 또한 항해가 가능한 지류인 루알라바까지 철도로 도달할 수 있는 콩고 강의 환승 항구이기도 합니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_FAYA', 						'파야' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_FAYA_ADJ', 						'파야의' UNION ALL
SELECT 'TXT_KEY_CIV5_FAYA_TEXT', 							'파야는 현대 차드 북부의 많은 인구를 자랑하는 열대의 더운 지역입니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_KIGALI', 						'키갈리' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_KIGALI_ADJ', 						'키갈리의' UNION ALL
SELECT 'TXT_KEY_CIV5_KIGALI_TEXT', 							'키갈리는 14세기에 르완다 왕국에 의해 처음 개발되고 있는 르완다의 수도이며, 근대에 역사적인 수도가 되었습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_LEVUKA', 						'레브카' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_LEVUKA_ADJ', 						'레브카의' UNION ALL
SELECT 'TXT_KEY_CIV5_LEVUKA_TEXT', 							'레브카는 오발라우 섬의 동해안에 있는 항구 도시이자 남태평양 국가 피지에 있는 로마위티주의 주도입니다. 1822년 미국 모험가에 의해 정착된 이 지역은 미국 남북 전쟁(1861~65) 동안 세계 면화 공급이 차질을 빚은 면화 붐의 중심지였습니다.[NEWLINE][NEWLINE]1871년 피지의 최초의 현대 민족 국가인 피지 왕국이 세워졌을 때 세루 에페니사 카코바우가 레부카에서 왕위에 올랐습니다. 1874년 피지가 영국 식민지로 합병된 후 레부카는 1877년까지 수도로 남아 있었는데, 그 때 행정부는 수바로 이전되었지만 공식적으로는 1882년 이전이 이루어지지 않았습니다.[NEWLINE][NEWLINE]지금은 주로 일본, 한국, 대만 어선이 공급하는 피지 참치 가공 산업의 중심지입니다. 마을의 19세기 건축물은 여전히 대부분 그대로 남아 있으며 2013년 레부카는 문화적, 역사적 가치로 인해 유네스코 세계 문화 유산으로 지정되었습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_QUELIMANE', 					'켈리마네' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_QUELIMANE_ADJ', 					'켈리마네의' UNION ALL
SELECT 'TXT_KEY_CIV5_QUELIMANE_TEXT', 						'켈리마네는 홍수에 극도로 취약한 지역입니다. 스와힐리 교역소로 설립된 이곳은 번영하는 항구로 발전했습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_SIERRA_LEONE', 				'시에라리온' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_SIERRA_LEONE_ADJ', 				'시에라리온의' UNION ALL
SELECT 'TXT_KEY_CIV5_SIERRA_LEONE_TEXT', 					'시에라리온은 사막과 습지로 다양한 지역입니다. 영국의 지배하에 세워진 이 나라는 독립성을 부여받았고 이웃나라에 비해 종교적 관용을 자랑했습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_SURREY', 						'셔리' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_SURREY_ADJ', 						'셔리의' UNION ALL
SELECT 'TXT_KEY_CIV5_SURREY_TEXT', 							'서리는 영국 남동부에 있는 마을입니다. 비행장으로서의 첫 번째 용도로 알려진, 그 마을은 비행기와 항공기의 생산에 있어 중요시 되었습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_TAIWAN', 						'타이페이' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_TAIWAN_ADJ', 						'타이페이의' UNION ALL
SELECT 'TXT_KEY_CIV5_TAIWAN_TEXT', 							'타이베이는 중화민국의 수도이며, 대만의 문화, 정치, 경제의 중심입니다. 국민당의 중국 망명 정부가 수립되기 전에, 타이베이는 중국, 일본, 필리핀 사이의 무역로를 따라 위치한 작은 지방 수도였습니다. 주변 지역의 대부분은 한족에 의한 중국 본토의 지배와 구별되는 풍부한 문화적 구조를 형성하면서, 몇몇 타이완 원주민들이 계속해서 거주합니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_OC_EO', 						'옥에오' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_OC_EO_ADJ', 						'옥에오의' UNION ALL
SELECT 'TXT_KEY_CIV5_OC_EO_TEXT', 							'푸난은 서기 1세기에 생겨난 캄보디아의 고대 국가로 6세기에 첸라 주에 편입되었습니다. 푸난(아마도 pnom, "산"의 중국어 필사본)은 동남아시아 최초의 중요한 힌두교 왕국이었습니다. 현재 베트남, 태국, 캄보디아의 일부를 포함했습니다. 푸난은 인도 및 중국과 무역 관계를 맺었으며 푸난 사람들은 3세기에서 6세기 사이에 황제에게 조공을 바쳤습니다.[NEWLINE][NEWLINE]푸난은 수이 메아라라고도 알려진 3세기 왕 판 시만 아래에서 권력의 정점에 도달했습니다. 판 시만은 제국의 해군을 확장하고 푸난의 관료제를 개선하여 특히 제국의 더 먼 곳에서 지역 관습과 정체성을 그대로 유지하는 준 봉건적 패턴을 만들었습니다. 판 시만과 그의 후계자들은 또한 해상 무역을 규제하기 위해 중국과 인도에 대사를 보냈습니다. 왕국은 동남아시아의 인도화 과정을 가속화했을 것입니다. 진랍과 같은 동남아시아의 후기 왕국은 푸난의 법원을 모방했을 수 있습니다. 푸난은 지역 제국의 패턴이 될 강력한 중상주의 및 상업적 독점 시스템을 구축했습니다.[NEWLINE][NEWLINE]푸난의 높은 해양 무역 의존도는 그들 몰락의 원인이었습니다. 그들의 해안 항구는 상품을 북쪽과 해안 인구로 보내는 외국 지역과의 무역을 허용했습니다. 그러나 해양 무역이 수마트라로 이동하고 Srivijaya 무역 제국이 부상하고 중국이 동남아시아 전역의 무역로를 점령하면서 남쪽의 경제 불안정이 발생하고 정치와 경제가 북쪽으로 밀려났습니다. 푸난은 6세기에 첸라 왕국의 크메르 정치에 의해 대체되고 흡수되었습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_THIMPHU', 					'팀푸' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_THIMPHU_ADJ', 					'팀푸의' UNION ALL
SELECT 'TXT_KEY_CIV5_THIMPHU_TEXT', 						'1955년부터 팀푸는 히말라야 동쪽 끝에 있는 남아시아의 내륙국인 부탄 왕국의 수도입니다. 북쪽으로는 티베트(중국), 남쪽, 동쪽, 서쪽으로는 인도와 접해 있습니다. 부탄은 17세기 초까지 소규모 전쟁 영지의 패치워크로 존재했습니다. 그 당시 티베트에서 종교적 박해를 피해 도망친 최초의 잡드룽 린포체인 라마이자 군사 지도자인 응아왕 남걀은 이 지역을 통합하고 뚜렷한 부탄 정체성을 발전시켰습니다. 20세기 초 부탄은 대영제국과 접촉했고 독립 후에도 인도와 강력한 양자 관계를 유지했습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_ANDORRA', 					'안도라' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_ANDORRA_ADJ', 					'안도라의' UNION ALL
SELECT 'TXT_KEY_CIV5_ANDORRA_TEXT', 						'피레네 산맥의 남쪽 경사면에 위치한 안도라 공국은 시내가 발리라 강을 형성하는 산골짜기로 구성되어 있습니다. 안도라의 독립은 전통적으로 서기 803년에 무슬림으로부터 이 지역을 회복한 샤를마뉴에게 귀속됩니다. 1278년에 푸아의 프랑스 백작과 우르겔의 스페인 주교의 공동 종주권 아래 놓였으며, 이후 우르겔의 스페인 주교와 프랑스 국가 원수가 공동으로 다스렸습니다. 유럽에서 마지막인 이 봉건 정부 제도는 1993년 헌법이 채택되어 대부분의 공동 공직자의 권한을 보통 선거로 선출되는 안도라 총평의회로 이양할 때까지 계속되었습니다.[NEWLINE][NEWLINE]안도라는 카탈로니아와의 길고 강한 친화성; 제도는 카탈루냐 법을 기반으로 하며 우르겔 교구(스페인)의 일부입니다.[NEWLINE][NEWLINE]전통 경제는 양 사육을 기반으로 했지만 1950년대 이후 관광의 중요성이 커져 21세기 초반에는 안도라의 중심이 되었습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_CANOSSA', 					'카노사' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_CANOSSA_ADJ', 					'카노사의' UNION ALL
SELECT 'TXT_KEY_CIV5_CANOSSA_TEXT', 						'카노사는 이탈리아의 레조넬레밀리아 남서쪽의 폐허가 된 10세기 성으로, 1077년 교황 그레고리오 7세와 황제 하인리히 4세의 만남의 장소로 유명합니다. 940년 아토 가문의 설립자이자 카노사의 첫 번째 백작인 아달베르트 아토에 의해 세워졌습니다. [NEWLINE]서위 논란에서 교황권의 강력한 지지자였던 카노사 백작부인 마틸다(토스카나의 마틸다)의 초청으로 그레고리오 7세는 1077년 적수에 대항하기 위해 독일로 가는 길에 요새에 머물렀습니다. 헨리 4세. 그의 증언을 미연에 방지하기 위해 헨리는 단순한 참회자로 카노사로 여행했고 1월 28일에 3일을 기다린 후 사면을 받았습니다.[NEWLINE][NEWLINE]이것이 교황권의 지속적인 승리를 의미하지는 않았지만 카노사의 이름은 세속 권력이 교회에 복종하는 것을 뜻하게 되었습니다. 따라서 독일에서 로마 카톨릭의 영향에 반대하는 프로이센의 문화투쟁 동안 비스마르크의 격언: "Nach Canossa gehen wir nicht"("우리는 카노사에 가지 않을 것이다") 도 등장했습니다.[NEWLINE][NEWLINE]이 성은 1255년 레지오 사람들에 의해 파괴되었습니다. 나중에 카노사 가문에게 반환되었습니다. 1321년 길베르토 다 코레지오가 사망한 후 시모네, 귀도 및 알베르토 카노사가 다시 되찾은 1402년까지 다시 레지오의 소유였습니다. 그러나 1409년에 그들은 그것을 에스테 가문에 양도했고, 1557년 파르마 공작 오타비오 파르네세 치하의 짧은 기간을 제외하고는 1796년까지 그것을 소유했다. 그것을 발렌티누스 가문에게 맡겼습니다. 후자는 시스파다네 공화국에 합류한 반항적인 지역 주민들에 의해 1796년에 축출되었습니다. 1819년 발렌티니에게 반환된 후 1878년에 성은 이탈리아 국가에 인수되었고 국가 기념물로 지정되었습니다.[NEWLINE][NEWLINE]지명 "카노사"는 1992년 인근 마을인 샤노 덴자가 역사적, 문화적 유산을 기리기 위해 이름을 카노사로 변경하기 전까지 폐허가 된 성과 인접한 작은 마을만을 지칭했습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_BEDULU', 						'발리' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_BEDULU_ADJ', 						'발리의' UNION ALL
SELECT 'TXT_KEY_CIV5_BEDULU_TEXT', 							'"천 개의 사원이 있는 섬"으로 알려진 발리의 역사는 인도네시아 힌두교의 마지막 보루 중 하나인 문화와 종교로 가득 차 있습니다.[NEWLINE][NEWLINE]발리는 원래 동남아시아와 오세아니아에서 해양 동남아시아를 통해 이주한 사람들이 기원전 2000년경에 거주했습니다.[NEWLINE][NEWLINE]언어적으로 발리인들은 인도네시아 군도, 말레이시아, 필리핀, 오세아니아 사람들과 밀접한 관련이 있습니다. 섬의 서쪽에 있는 세키크 마을 근처에서 이 시기의 석기가 발견되었습니다. 896년과 911년의 비문에는 스리 케사리바마가 언급된 914년까지 왕이 언급되어 있지 않습니다. 그들은 또한 불교와 시바교가 동시에 실천되었던 독특한 방언을 가진 독립적인 발리를 드러냅니다.[NEWLINE][NEWLINE]음푸 신독의 증손녀인 마헨드라다타는 989년경 발리 왕 우다야나 워마데와와 결혼하여 1001년경 아이랑가를 낳았습니다. 이 결혼은 발리에 더 많은 힌두교와 자바 문화를 가져왔습니다. 사칼렌두키라나 공주는 1098년에 나타났습니다. 수라디파는 1115년에서 1119년까지, 자야삭티는 1146년에서 1150년까지 통치했습니다. 자야판구스는 1178년에서 1181년 사이의 비문에 나타나고 아둔쿤티케타나와 그의 아들 파라메스바라는 1204년에 나타납니다.[NEWLINE][NEWLINE]발리 문화는 서기 1세기경부터 인도, 중국, 특히 힌두 문화의 영향을 강하게 받았습니다. 발리 드위파("발리 섬")라는 이름은 914년 스리 케사리 워마데와가 쓴 블란종 기둥 비문에서 왈리드위파를 언급하는 등 다양한 비문에서 발견되었습니다. 이 시기에 사람들은 습답 재배에서 쌀을 재배하기 위해 현지에서 수박이라고 불리는 복잡한 관개 시스템을 개발했습니다. 오늘날에도 여전히 행해지는 일부 종교적, 문화적 전통은 이 시기로 거슬러 올라갑니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_DALI', 						'대리국' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_DALI_ADJ', 						'대리국의' UNION ALL
SELECT 'TXT_KEY_CIV5_DALI_TEXT', 							'"위대한 진리" 또는 "위대한 행정"이라는 뜻을 가진 대리국은 10세기부터 13세기까지 거의 3세기 동안 동남아시아에서 중요한 역할을 한 불교 왕국이었습니다. 수많은 사원과 거대한 석탑이 있는 경건한 왕국이었으며, 단일 민족이 아닌 다양한 민족과 부족으로 구성되었으며, 그 중 가장 큰 부족은 백이족과 이족이었습니다.[NEWLINE][NEWLINE]대리국은 불교를 보존하고 전파하는 데 큰 영향을 미쳤습니다. 두안 왕족은 그 이전의 난자오 선조들과 마찬가지로 독실한 불교 신자였으며, 달리 주변과 시바오산에 대형 불교 사원을 건설했습니다. 이 사원들은 곧 불교의 중심지가 되었습니다. 이곳에서 왕들은 인근 동남아시아 왕국의 불교를 신봉하는 왕들을 모델로 삼으려고 노력했습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_MULTAN', 						'물탄' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_MULTAN_ADJ', 						'물탄의' UNION ALL
SELECT 'TXT_KEY_CIV5_MULTAN_TEXT', 							'물탄은 파키스탄 펀자브 주에 있는 도시이자 물탄 지구의 수도입니다. 주 남부에 위치하고 있으며 역사가 깊은 도시입니다. 인구는 380만 명 이상(1998년 인구 조사 기준)으로 파키스탄에서 6번째로 큰 도시입니다. 이 도시는 체납 강 바로 동쪽에 건설되었으며, 국가의 지리적 중심지이자 카라치에서 약 966km 떨어져 있습니다.[NEWLINE][NEWLINE]물탄은 "피르와 신전의 도시"로 알려져 있으며 바자르, 모스크, 멋진 디자인의 무덤이 있는 번영하는 도시입니다. 물탄 국제공항은 파키스탄의 주요 도시와 페르시아만의 도시로 가는 항공편을 연결합니다. 이 도시의 산업으로는 금속 가공, 밀가루, 설탕, 제분, 섬유 제조, 비료, 비누, 유리 등이 있습니다. 물탄은 수공예품, 특히 도자기 및 에나멜 작업으로도 유명합니다.[NEWLINE][NEWLINE]아대륙에서 가장 오래된 도시 중 하나인 물탄은 이슬람 이전 시대의 신전인 태양신 사원에 있던 우상에서 유래한 이름입니다.[NEWLINE][NEWLINE]이 도시는 알렉산더 대왕이 정복(기원전 326년경)하고, 중국 불교 학자 수안상이 방문(AD 641년)하고, 아랍인들이 점령(8세기)했으며, 1005년 무슬림 터키 정복자 가즈나의 마흐무드, 1398년 티무르가 점령했습니다. 16세기와 17세기에 물탄은 무굴 황제들의 통치 아래 평화를 누렸습니다. 1818년, 시크교의 지도자 란짓 싱이 이 도시를 점령했습니다. 영국은 1848년부터 1947년 파키스탄이 독립할 때까지 이곳을 점령했습니다. 랜드마크에는 두 명의 무슬림 성인의 14세기 무덤이 있는 오래된 요새가 있습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_BAGAN', 						'바간' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_BAGAN_ADJ', 						'바간의' UNION ALL
SELECT 'TXT_KEY_CIV5_BAGAN_TEXT', 							'이 왕국은 난자오 왕국에서 이라와디 계곡으로 들어온 므란마/버만족이 9세기 파간(현재의 바간)에 세운 작은 정착촌에서 성장했습니다. 그 후 200년 동안 이 작은 공국은 점차 주변 지역을 흡수하며 성장하여 1050년대와 1060년대에 아나라아타 왕이 바간 제국을 세우고 이라와디 계곡과 그 주변을 처음으로 하나의 정치 체제로 통일했습니다. 12세기 후반에 이르러 아나으라타 왕의 후계자들은 남쪽으로는 말레이 반도 상류까지, 동쪽으로는 살윈 강까지, 북쪽으로는 현재의 중국 국경 아래까지, 서쪽으로는 아라칸 북부와 친 언덕까지 영향력을 확장했습니다. 12세기와 13세기에 파간은 크메르 제국과 함께 동남아시아 본토의 두 주요 제국 중 하나였습니다. 파간 왕국은 1280년대까지 면세 종교적 부의 지속적인 증가로 인해 궁정과 군인들의 충성심을 유지하는 왕실의 능력에 심각한 영향을 미치면서 13세기 중반에 쇠퇴하기 시작했습니다. 이로 인해 아라칸족, 몽족, 몽골족, 샨족에 의한 내부 혼란과 외부 도전의 악순환이 시작되었습니다. 반복되는 몽골의 침략(1277-1301)은 1287년 4세기 동안 이어져 온 왕국을 무너뜨렸습니다. 왕국 붕괴 이후 250년간의 정치적 분열은 16세기까지 지속되었습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_RISHIKESH', 					'리시케시' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_RISHIKESH_ADJ', 					'리시케시의' UNION ALL
SELECT 'TXT_KEY_CIV5_RISHIKESH_TEXT', 						'"가르왈 히말라야의 관문", "세계 요가의 수도"로 알려진 리시케시는 히리시케시라고도 하며 인도 우타라칸드 주 데라둔 지구의 데라둔 근처에 있는 도시입니다. 갠지스 강 오른쪽 강변에 위치한 이곳은 힌두교도들의 순례 도시로, 고대 현자들과 성인들이 더 높은 지식을 얻기 위해 이곳에서 명상을 했던 곳입니다. 강변을 따라 수많은 사원과 아쉬람이 세워져 있습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_MUTITJULU', 					'무티출루' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_MUTITJULU_ADJ', 					'무티출루의' UNION ALL
SELECT 'TXT_KEY_CIV5_MUTITJULU_TEXT', 						'"아난구"는 서부 사막 언어를 사용하는 여러 호주 원주민 그룹을 설명하는 포괄적인 용어로, 핏잔자자라와 얀쿠니트자자라가 가장 두드러지게 사용합니다. 서부 사막 언어는 다른 어떤 원주민 언어보다 호주에서 더 많은 지역을 포괄하는 것으로 알려져 있습니다.[NEWLINE][NEWLINE]울룰루와 카타츄타는 아난구 신앙 체계에서 신성한 장소로, 11개의 송라인이 이곳을 통과하거나 그 근처를 지나갑니다. 1979년 원주민 중앙 토지 위원회)는 울룰루-카타츄타 국립공원에 대한 소유권을 주장하기 위해 법적 소송을 시작했고, 1985년 아난구족이 공원 관리위원회의 과반수를 차지하면서도 관광객의 방문을 허용하는 합의안이 시행되었습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_ISKANWAYA', 					'이스칸와야' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_ISKANWAYA_ADJ', 					'이스칸와야의' UNION ALL
SELECT 'TXT_KEY_CIV5_ISKANWAYA_TEXT', 						'이스칸와야는 라파스에서 북쪽으로 325km 떨어진 볼리비아의 리카 강 위 산등성이에 위치한 콜럼버스 이전 시대의 신성한 유적지입니다. 이스칸와야는 페루의 마추픽추를 능가하는 규모와 연륜을 자랑하지만 보존 상태가 좋지 않습니다. 이스칸와야 유적은 잉카 문명 이전의 몰로 문화로 거슬러 올라가며, 기원전 800년 또는 1145년부터 1425년까지 전성기 문화 시대에 사람들이 건축물을 지었을 것으로 추정됩니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_TIWANAKU', 					'티와나쿠' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_TIWANAKU_ADJ', 					'티와나쿠의' UNION ALL
SELECT 'TXT_KEY_CIV5_TIWANAKU_TEXT', 						'티와나쿠(스페인어: 티아후아나코 또는 티아후아나쿠)는 남아메리카 볼리비아 서부에 있는 콜럼버스 이전 시대의 고고학 유적지입니다. 티와나쿠는 서기 300년부터 서기 1000년까지 번성했던 제국의 수도로, 현재의 페루와 칠레로 확장되었습니다. 안데스 학자들은 티와나쿠를 잉카 제국 이전의 가장 중요한 문명 중 하나로 인정하고 있으며, 약 500년 동안 주요 국가 세력의 의식 및 행정 수도로 사용되었습니다. 고대 도시 국가의 유적은 라파스에서 서쪽으로 약 72km(45마일) 떨어진 티와나쿠 지방 잉가비주 라파스 부의 티티카카 호수 남동쪽 해안 근처에 있습니다.49 잉카의 수도 쿨라수유를 찾는 중입니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_DANO', 						'다노' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_DANO_ADJ', 						'다노의' UNION ALL
SELECT 'TXT_KEY_CIV5_DANO_TEXT', 							'다노는 부르키나파소 이오바 주의 주도입니다. 직조와 도자기 시장이 있는 작은 마을로, 식민지 기독교의 영향에도 불구하고 전통적인 우주론과 의식 관습을 이어온 다가라족의 고향입니다. 이러한 관습에는 원소의 힘과 교감하고, 다른 세계의 존재와 소통하며, 소라 껍질로 점을 치는 것이 포함됩니다.[NEWLINE][NEWLINE]다가라족 정착촌은 부르키나파소 남서부의 약 3,500평방킬로미터와 가나 북서부의 거의 같은 면적에 걸쳐 있습니다. 다가라족의 정치 및 사회 조직은 다가라 공동체를 영적으로 보호하는 텡간을 기반으로 합니다.[NEWLINE][NEWLINE]대지 신사는 주로 큰 나무 아래 돌로 이루어진 제사 장소로, 규범에 따라 해당 지역에 처음 도착한 정착민들이 세워야 합니다. 대지 신사에서는 여성과 토양의 다산과 특정 지역의 평화를 책임지는 대지신에게 제사를 지냅니다. 대지 신사에 대한 의식적 통제는 동시에 토지를 분배하고 필요한 희생에 대한 기부금을 요구할 권리를 의미합니다. 따라서 신전을 책임지는 제사장인 대지 사제는 후발 정착민에게 토지를 분배하고 다른 자원에 대한 접근을 규제하며, 때로는 상당한 선물을 대가로 후발 정착민은 집을 짓고 죽은 사람을 묻기 위해 대지 사제의 허가를 요청해야 합니다.[NEWLINE][NEWLINE]이 지역의 비중앙집권 사회에서는 텐간소브 또는 틴다나라고 불리는 대지 사제가 지역 사회의 장로 역할을 수행했으며, 식민지 이전 시기에는 유일한 지역 권위자였습니다. 전통에 따르면 대지 사제의 직책은 정착촌의 창시자 또는 같은 씨족 내의 그의 후손 중 한 명에게 주어집니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_KARYES', 						'카리에스' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_KARYES_ADJ', 						'카리에스의' UNION ALL
SELECT 'TXT_KEY_CIV5_KARYES_TEXT', 							'아토스 산의 수도원 공동체는 그리스의 동방 정교회 수도사 공동체로, 아토스 산을 포함한 아토스 반도의 원위부를 포함하는 영토를 가진 자치 지역, 지방 자치 단체 및 지방 자치 단체의 통합 된 권리를 보유하고 있습니다. 반도의 접경 근위부는 중앙 마케도니아의 일반 아리스토텔레스 공동체에 속합니다.[NEWLINE][NEWLINE]963년 성 아타나시우스 아토나이트가 최초의 수도원을 설립하면서 체계적인 수도원 생활이 시작되었습니다. 1400년에는 40개의 수도원이 있었습니다. 오랫동안 그리스 정교회의 성산으로 여겨져 온 이곳은 1927년 신정 공화국으로 선포되었습니다. 아토나이트 수도원에는 잘 보존된 유물, 희귀 서적, 고대 문서, 엄청난 역사적 가치를 지닌 예술품이 풍부하게 소장되어 있으며, 아토스 산은 1988년부터 세계 문화유산으로 등재되었습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_SGAANG', 						'스구앵과이' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_SGAANG_ADJ', 						'스구앵과이의' UNION ALL
SELECT 'TXT_KEY_CIV5_SGAANG_TEXT', 							'북미의 많은 원주민 부족 중 하나인 하이다 부족은 섬에 사는 민족이라는 점이 특징입니다. 틀링잇족과 침시안족과 관련이 있는 하이다 사회는 귀족, 평민, 노예로 계층화된 씨족 제도를 중심으로 조직되었습니다. 씨족은 모계 혈통을 통해 결정되는 두 개의 주요 씨족이 있었습니다. 이 씨족은 다시 혈통으로 세분화되었습니다.[NEWLINE][NEWLINE]하이다족은 특히 목공예, 직조, 항해에 재능이 뛰어났으며 토템 폴을 최초로 사용한 것으로 알려져 있습니다. 해상에서 활약한 덕분에 식민지 개척자들과 평화로운 무역로를 많이 만들었지만, 현지에서는 노예 제도를 시행하는 두려운 전사였습니다. 이런 이유로 그들은 종종 "북아메리카의 바이킹"이라고 불렸습니다.[NEWLINE][NEWLINE]오늘날 하이다 가와이 본섬의 하이다 보호구역은 하이다 국가 의회를 만들기 위해 함께 뭉쳤습니다. 그들은 문화적 부활을 경험하고 있습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_NYARYANA_MARQ', 				'네네츠' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_NYARYANA_MARQ_ADJ', 				'네네츠의' UNION ALL
SELECT 'TXT_KEY_CIV5_NYARYANA_MARQ_TEXT', 					'사모예드족이라고도 알려진 네네츠족은 러시아 북극 북부의 원주민입니다. 2010년의 최신 인구 조사에 따르면 러시아 연방에는 44,857명의 네네츠족이 거주하고 있으며, 대부분은 야말로-네네츠 자치 오크루그와 네네츠 자치 오크루그에 살고 있습니다. 이들은 툰드라 또는 포레스트 품종의 네네츠어를 사용합니다. 러시아어의 문자 그대로 변형된 사모와 예드는 경멸적인 의미로 나타나는 "스스로 먹는 사람"이라는 의미를 전달합니다. 따라서 사모예드라는 이름은 20세기에 빠르게 사용되지 않았고, 사람들은 "사람"을 의미하는 네네츠족이라는 이름을 갖게 되었습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_ADEJE', 						'아데헤' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_ADEJE_ADJ', 						'아데헤의' UNION ALL
SELECT 'TXT_KEY_CIV5_ADEJE_TEXT', 							'관체족은 북아프리카 해안에서 서쪽으로 약 100킬로미터(60마일) 떨어진 대서양의 카나리아 제도에 거주하던 원주민이었습니다. 이들은 17세기에 멸종한 구안체어를 사용했는데, 이 언어는 베르베르어와 관련이 있는 것으로 추정됩니다. 기원전 천년경에 이 군도에 도착했을 것으로 추정됩니다.[NEWLINE][NEWLINE]관체족은 유럽인이 도착하기 전에 마카로네시안 군도 지역에 살았던 것으로 알려진 유일한 원주민으로, 다른 마카로네시안 군도(카보베르데 제도, 마데이라 제도, 아조레스 제도)에 사람이 살았다는 증거가 없기 때문이죠. 15세기 초 스페인의 카나리아 정복 이후 많은 원주민이 스페인 정복자들에 의해 전멸하고 나머지는 시간이 지나면서 정착민 인구와 문화에 동화되었지만, 실보(라 고메라 섬의 휘파람 언어)와 카나리아 스페인어의 일부 어휘와 같은 원래 문화의 요소가 카나리아 관습과 전통 안에 남아 있습니다.[NEWLINE][NEWLINE]일부 학자들은 관체족과 문화에 대한 파괴를 식민지 대량 학살의 초기 사례로 분류하기도 합니다. 2017년, 관체족의 게놈 전체 데이터를 최초로 분석한 결과, 관체족이 북아프리카에서 유래했으며 인근 북아프리카 본토의 고대 북아프리카 베르베르족과 유전적으로 가장 유사하다는 사실이 확인되었습니다.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_WOOTEI_NIICIE', 				'아라파호' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_WOOTEI_NIICIE_ADJ', 				'아라파호의' UNION ALL
SELECT 'TXT_KEY_CIV5_WOOTEI_NIICIE_TEXT', 					'약 3,000년 전, 아라파호족의 조상인 히테이노노''에이노''족은 현재 캐나다 매니토바와 미국 미네소타로 분류되는 레드 리버 계곡을 따라 서부 오대호 지역에 살았습니다. 그곳에서 아라파호 족은 옥수수를 비롯한 농작물을 재배하는 농경 민족이었습니다.[NEWLINE][NEWLINE]캐나다 동부의 유럽 식민지화 이후, 초기 샤이엔족인 히테시노족과 함께 아라파호족은 오지브웨족에 의해 동부 대평원으로 서쪽으로 이주해야만 했습니다. 그들은 프랑스 무역 동맹국으로부터 총을 얻어 수많은 무기를 보유하게 되었죠. 아라파호 족의 조상들은 1700년 이전에 오대호 서부 대평원 지역으로 들어왔습니다. 평원에서의 초기 역사 동안 아라파호 족은 캐나다 서스캐처원 강 남쪽에서 몬태나, 와이오밍, 사우스다코타 서부에 이르는 북부 평원에서 살았습니다.[NEWLINE][NEWLINE]아라파호 부족이 말을 얻기 전에는 가축인 개를 마차를 끄는 짐승으로 사용했습니다. 아라파호 부족은 1700년대 초에 다른 부족으로부터 말을 얻게 되면서 삶의 방식이 바뀌었습니다. 아라파호 부족은 말을 무리와 기마 동물로 사용하는 유목민이 되었습니다. 말을 타고 더 많은 짐을 운반하고 더 쉽게 이동할 수 있었기 때문에 평원에서 더 쉽고 광범위하게 사냥을 할 수 있었고, 사냥 성공률도 높아졌습니다. 점차 아라파호 부족은 남쪽으로 이동하여 긴밀히 연합한 북부 아라파호와 남부 아라파호로 나뉘어 몬태나 남부, 와이오밍 대부분, 네브라스카 팬핸들, 콜로라도 중부와 동부, 오클라호마 서부, 캔자스 극서부 지역에 걸쳐 넓은 공동 영토를 형성했습니다.' UNION ALL
-- abilities
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ADEJE', 				'[COLOR_MAGENTA]베네스머:[ENDCOLOR] 언덕에 [ICON_RES_DOGO_CANARIO] [COLOR_GREY]도고 까나리오[ENDCOLOR] 배치 가능 (인접 불가, [ICON_FOOD] 식량, [ICON_PRODUCTION] 생산, [ICON_GOLD] 골드, [ICON_CULTURE] 문화, [ICON_PEACE] 신앙 제공)[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ALMATY', 				'[COLOR_MAGENTA]알마투:[ENDCOLOR] [ICON_TRADE] 도시 연결 및 [ICON_CARAVAN] 국제 교역로의 [ICON_RESEARCH] 과학 +1. 두려움 상태인 [ICON_CITY_STATE] 도시 국가에서 매 턴 [ICON_INFLUENCE] 영향력 +1.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_AMBRACIA', 			'[COLOR_MAGENTA]피로스 전쟁:[ENDCOLOR] [ICON_WAR] 군사적 [ICON_CITY_STATE] 도시 국가의 선물 속도 +10%. [COLOR_YIELD_GOLD]지상 군사 유닛[ENDCOLOR]이 [COLOR_WATER_TEXT]피로스의 용병[ENDCOLOR] 승급을 얻음 ([COLOR:255:230:85:255]도시에 주둔 시 [ENDCOLOR] [ICON_PRODUCTION]+5%).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ANDORRA', 			'[COLOR_MAGENTA]피레네 파레아쥬:[ENDCOLOR]작업 가능한 영역의 모든 [COLOR_CITY_BLUE]산[ENDCOLOR] 타일이 [ICON_TOURISM] 관광 +1. [COLOR_CITY_BLUE]산[ENDCOLOR] 근처 도시의 [ICON_HAPPINESS_3] 무료 -10%.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ANTANANARIVO', 		'[COLOR_MAGENTA]리베르탈리아:[ENDCOLOR] 모든 야만인 주둔지를 볼 수 있음. 유닛에게 [COLOR_WATER_TEXT]해적의 천국[ENDCOLOR] 승급 부여. ([COLOR:255:230:85:255]처치[ENDCOLOR] 시 [ICON_GOLD] 골드 획득)[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ANTWERP', 			'[COLOR_MAGENTA]경제적 영향력:[ENDCOLOR] 상인의 [ICON_GOLD] 골드 +1 [ICON_GOLD] 구매 비용 -10%.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ARMAGH', 				'[COLOR_MAGENTA]수호성인:[ENDCOLOR] [ICON_PEACE] 신앙으로 [ICON_HAPPINESS_1] 행복 관리를 돕는 [COLOR_YIELD_FOOD]아일랜드 성인[ENDCOLOR]을 (건물로) 구매 가능. (도시마다 한 종류씩)[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_AUCKLAND', 			'[COLOR_MAGENTA]돛의 도시:[ENDCOLOR] 해안 도시의 식량 +3. [COLOR_YIELD_GOLD]지상 군사 유닛[ENDCOLOR]이 [COLOR_WATER_TEXT]비폭력 저항[ENDCOLOR] 승급을 얻음. (유닛이 지상에 주둔 시 [ICON_FOOD], [ICON_GOLDEN_AGE]을 생산)[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_BAGAN', 				'[COLOR_MAGENTA]천 개의 사원이 있는 섬:[ENDCOLOR] [COLOR_YIELD_FOOD]사원[ENDCOLOR]의 [ICON_HAPPINESS_1] 행복 +1. 건물 건설 시 [ICON_PEACE] 신앙 10.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_BEDULU', 				'[COLOR_MAGENTA]신들의 섬:[ENDCOLOR] [COLOR_GREY][COLOR_CITY_GREEN]정글[ENDCOLOR] 타일에서 작업 중인 시민 2명마다 [ICON_PEACE] 신앙 +1. [ICON_CITY_STATE] 도시 국가 동맹마다 모든 도시에서 [ICON_PEACE] 신앙 +1, [ICON_GOLDEN_AGE] 황금기 점수 +1. [ICON_CARGO_SHIP] 국제 해양 교역로의 [ICON_PEACE] 신앙 +2[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_BELGRADE', 			'[COLOR_MAGENTA]화약고 발칸:[ENDCOLOR] [COLOR_YIELD_GOLD]공성 유닛[ENDCOLOR] 생산 시 [ICON_PRODUCTION] 도시 생산이 10% 증가합니다. [COLOR_YIELD_GOLD]공성 유닛이[ENDCOLOR] [COLOR_WATER_TEXT]하얀 요새[ENDCOLOR] 승급을 얻음. ([ICON_PLUS] 체력 +25)[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_BOGOTA', 				'[COLOR_MAGENTA]독립 연합:[ENDCOLOR] 도시 점령 시 문화 30 [COLOR:105:105:105:255](시대별 보정)[ENDCOLOR] 도시 해방 시 문화 20-30 [COLOR:105:105:105:255](시대 및 소유한 도시 수에 따라 보정, 최대 6 도시)[ENDCOLOR][NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_BRATISLAVA', 			'[COLOR_MAGENTA]슬라브 문화의 심장:[ENDCOLOR] [COLOR_YIELD_FOOD]길드[ENDCOLOR] [ICON_CULTURE] 문화 +2, [ICON_TOURISM] 관광 +1. [ICON_CITY_STATE] 도시 국가와 동맹을 맺으면 두 턴마다 무작위 [ICON_GREAT_PEOPLE] [COLOR_CITY_GOLD]위인[ENDCOLOR] 획득[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_BRUSSELS', 			'[COLOR_MAGENTA]습지의 고향:[ENDCOLOR] [COLOR_CITY_GREEN]습지[ENDCOLOR]의 [ICON_GOLD] 골드 +1, [ICON_CULTURE] 문화 +1. 해안 타일에 [COLOR_CITY_GREEN]습지 복원 시설[ENDCOLOR] ([ICON_FOOD] 식량 +1) 건설 가능[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_BUCHAREST', 			'[COLOR_MAGENTA]동방의 파리:[ENDCOLOR] [ICON_GREAT_WORK] 걸작에서 오는 [ICON_CULTURE] 문화 +1. 역사적 사건의 [ICON_TOURISM] 관광 +25%[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_BUDAPEST', 			'[COLOR_MAGENTA]다뉴브의 진주:[ENDCOLOR] [ICON_RES_HORSE] [COLOR_GREY]말[ENDCOLOR]의 [ICON_GOLDEN_AGE] 황금기 점수 +1. [ICON_RES_HORSE] [COLOR_GREY]말[ENDCOLOR] +5 제공. (교역할 수 있고 독점에 계산됨)[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_BUENOS_AIRES', 		'[COLOR_MAGENTA]민중의 소리:[ENDCOLOR] [COLOR_GREY]사치 자원[ENDCOLOR]의 [ICON_HAPPINESS_1] 행복 +1.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_BYBLOS', 				'[COLOR_MAGENTA]레바논 삼나무:[ENDCOLOR] [COLOR_CITY_BROWN]어선[ENDCOLOR]의 [ICON_FOOD] 식량 +1. [ICON_WONDER] 세계 불가사의 또는 해군 유닛 생산 시  [ICON_PRODUCTION] 생산 +5%[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_CAHOKIA', 			'[COLOR_MAGENTA]카호키아 유적:[ENDCOLOR] [COLOR_CITY_BROWN]카오키아 마운드[ENDCOLOR] 시설 건설 가능 (인접 불가, [ICON_GOLD] 골드, [ICON_RESEARCH] 과학, [ICON_PEACE] 신앙, [ICON_GOLDEN_AGE] 황금기 점수, [ICON_GREAT_GENERAL] 위대한 제독 포인트 제공) [COLOR_CITY_BROWN]카호키아 마운드[ENDCOLOR]에서 유닛 전투력 +15%[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_CANOSSA', 			'[COLOR_MAGENTA]경건한 마음의 불꽃:[ENDCOLOR] [COLOR_YIELD_GOLD]공무원[ENDCOLOR]의 [ICON_PEACE] 신앙 +1. 도시에 [COLOR_YIELD_FOOD]사원[ENDCOLOR]이 있다면 [ICON_DIPLOMAT] 위대한 외교관 점수 +1.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_CAPE_TOWN', 			'[COLOR_MAGENTA]희망의 봉우리:[ENDCOLOR] [ICON_INTERNATIONAL_TRADE] 최대 교역로 범위 +10%. [ICON_INTERNATIONAL_TRADE] 교역 완료 시 [ICON_GOLD] 골드 20-40 [COLOR:105:105:105:255](도시 [ICON_CITIZEN] 인구수에 비례해, 사용 가능한 [ICON_INTERNATIONAL_TRADE] 교역로 수에 반비례해 보정)[ENDCOLOR][NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_CHEVAK', 				'[COLOR_MAGENTA]알레스카의 바람:[ENDCOLOR] [COLOR_CITY_BLUE]툰드라[ENDCOLOR] 타일에서 일하는 시민 3명 또는 작업 가능한 [COLOR_CITY_BLUE]설원[ENDCOLOR] 타일 3개마다 [ICON_FOOD] 식량 +1. [ICON_CULTURE_LOCAL] 도시의 국경 확장 속도 +10%. [ICON_HAPPINESS_3] 낙후에서 오는 불행 -1.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_CLERMONT', 			'[COLOR_MAGENTA]성전의 불꽃:[ENDCOLOR] 새로 생산된 [COLOR_YIELD_GOLD]근접[ENDCOLOR] 및 [COLOR_YIELD_GOLD] 화약 유닛[ENDCOLOR]이 첫 전투 후 무작위 승급을 얻음. (6종류) [COLOR_YIELD_GOLD]군사 유닛이[ENDCOLOR] [COLOR_WATER_TEXT]성전사의 열의[ENDCOLOR] 승급을 얻음([COLOR:255:230:85:255]전투 시[ENDCOLOR] 경험치 +15%)[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_COLOMBO', 			'[COLOR_MAGENTA]계피의 고장:[ENDCOLOR] [COLOR_CITY_GREEN]숲[ENDCOLOR], [COLOR_CITY_GREEN]정글[ENDCOLOR]의 [ICON_GOLD] 골드 +1. [ICON_INTERNATIONAL_TRADE] 교역로가 완료될 때마다 모든 유닛의 체력 10 회복[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_DALI', 				'[COLOR_MAGENTA]차마고도:[ENDCOLOR] [ICON_PEACE] 신앙으로 [ICON_CARAVAN] [COLOR_YIELD_GOLD]대상[ENDCOLOR] 구매 가능. [ICON_INTERNATIONAL_TRADE] 교역로에서 [ICON_PEACE] 종교 압력 +10%.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_DANO', 				'[COLOR_MAGENTA]텐달룬:[ENDCOLOR] [COLOR_YIELD_FOOD]성소[ENDCOLOR]의 [ICON_CULTURE_LOCAL] 국경 확장 점수 +2. 모든 도시의 [ICON_CULTURE] 국경 확장 비용 -10%. 국경이 확장될 때 [ICON_PEACE] 신앙 3[COLOR:105:105:105:255](시대별 보정)[ENDCOLOR][NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_DJIBOUTI', 			'[COLOR_MAGENTA]원향:[ENDCOLOR] [COLOR_YIELD_FOOD]곡창[ENDCOLOR]의 [ICON_CULTURE] 문화 +1. [COLOR_YIELD_GOLD]개척자[ENDCOLOR] 생산 시  [ICON_PRODUCTION] 생산 +80%,  [COLOR_YIELD_FOOD]곡창[ENDCOLOR] 생산 시 생산 +100%.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_DODOMA', 				'[COLOR_MAGENTA]평화의 보금자리:[ENDCOLOR] [ICON_INTERNATIONAL_TRADE] 국제 교역로가 출발 도시와 목표 도시 모두에 [ICON_GOLD] 골드 +1. 국제 해양 교역로의 [ICON_TOURISM] 관광 +1. [COLOR_YIELD_GOLD]민간 해양 유닛[ENDCOLOR]이 [COLOR_WATER_TEXT]광야 항해[ENDCOLOR] 승급을 얻음. ([ICON_MOVES] 이동력 +2)[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_DOUALA', 				'[COLOR_MAGENTA]작은 대륙:[ENDCOLOR] [ICON_INTERNATIONAL_TRADE] 교역로 +1. [COLOR_YIELD_GOLD]교역 유닛[ENDCOLOR] 생산 시 생산 +10%[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_FAYA', 				'[COLOR_MAGENTA]격동의 독립:[ENDCOLOR] [COLOR_YIELD_GOLD]군사 유닛[ENDCOLOR]은 [COLOR_WATER_TEXT]전쟁의 수확[ENDCOLOR] 승급을 얻음. ([COLOR:255:230:85:255]유닛[ENDCOLOR] 처치 시 [ICON_RESEARCH] 과학 획득)[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_FLORENCE', 			'[COLOR_MAGENTA]르네상스의 요람:[ENDCOLOR] [COLOR_CITY_BROWN]채석장[ENDCOLOR]의 [ICON_CULTURE] 문화 +1. 예술가의 [ICON_GOLDEN_AGE] 황금기 점수 +1. 매 턴 수도에 1%의 확률로 [ICON_GREAT_ARTIST] 위대한 예술가 또는 [ICON_GREAT_ENGINEER] 위대한 기술자 출현.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_GENEVA', 				'[COLOR_MAGENTA]에스칼라드:[ENDCOLOR] 도시의 [ICON_GREAT_PEOPLE] 위인 포인트 +3%. [COLOR_YIELD_GOLD]위인[ENDCOLOR] 탄생 시 [ICON_PEACE]신앙 25 [COLOR:105:105:105:255](시대별 보정)[ENDCOLOR][NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_GENOA', 				'[COLOR_MAGENTA]라 수페르바:[ENDCOLOR] [ICON_GREAT_PEOPLE] [COLOR_YIELD_GOLD]위인[ENDCOLOR] 탄생 시 [ICON_GOLD] 골드 50,  [ICON_GOLDEN_AGE] 황금기 점수 25. [COLOR:105:105:105:255](시대별 보정)[ENDCOLOR][NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_GRANADA', 			'[COLOR_MAGENTA]알카사르:[ENDCOLOR] [COLOR_CITY_BROWN]요새[ENDCOLOR], [COLOR_CITY_BROWN]성채[ENDCOLOR], [COLOR_CITY_BROWN]부교[ENDCOLOR]의 [ICON_GREAT_GENERAL] 위대한 장군 포인트 +1. [ICON_WAR] 전쟁 점수 +10%.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_GWYNEDD', 			'[COLOR_MAGENTA]허우엘 법:[ENDCOLOR] [ICON_HAPPINESS_1] 국왕 경축일 동안 [ICON_CULTURE] 문화 +10%. [ICON_HAPPINESS_1] 국왕 경축일 길이 +33%.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_HANOI', 				'[COLOR_MAGENTA]구품제:[ENDCOLOR] 공무원의 [ICON_GREAT_GENERAL] 위대한 장군 포인트 +1, [ICON_GREAT_ADMIRAL] 위대한 제독 포인트 +1. 군사 유닛이 [COLOR_WATER_TEXT]애국주의[ENDCOLOR] 승급을 얻음 ([COLOR:255:230:85:255]도시 국가 영토 내에서[ENDCOLOR] [ICON_STRENGTH] 전투력 +10%).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_HONDURAS', 			'[COLOR_MAGENTA]바나나 공화국:[ENDCOLOR] [ICON_CITY_STATE] 도시 국가가 제공하는 자원이 독점에 계산됨 ([COLOR_CYAN]외환 시장[ENDCOLOR] 정책과 중복되지 않음).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_HONG_KONG', 			'[COLOR_MAGENTA]국가 번영:[ENDCOLOR] [ICON_FOOD] 도시 성장률 +5%, [ICON_CITIZEN] 시민 6명마다 [ICON_GOLD] 골드 +1. 매 턴 플레이어 도시의 [ICON_CITIZEN] 시민 1명이 [COLOR_CYAN]홍콩[ENDCOLOR]으로 이주하여 [ICON_INFLUENCE] 영향력 30을 얻고, [ICON_GOLD] 골드를 100-150 얻음. [COLOR:105:105:105:255](시대와 [COLOR_CYAN]홍콩[COLOR:105:105:105:255]에 대한 [ICON_INFLUENCE] 영향력 단계에 따라 보정)[ENDCOLOR][NEWLINE]' UNION ALL /* Chance of migration starts from 0%, if the City has equal [ICON_CITIZEN] Citizens to [COLOR_CYAN]Hong Kong[ENDCOLOR], and grows by 1% with each [ICON_CITIZEN] Citizen above that number.*/
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_IFE', 				'[COLOR_MAGENTA]오그보니:[ENDCOLOR] [COLOR_YIELD_GOLD]외교 유닛[ENDCOLOR]이 등장하면 신앙 30, [COLOR_YIELD_GOLD]위대한 외교관[ENDCOLOR]은 두 배. [COLOR:105:105:105:255](시대별 보정)[ENDCOLOR] [COLOR_YIELD_GOLD]외교 유닛[ENDCOLOR]이 [COLOR_WATER_TEXT]이와레파[ENDCOLOR] 승급을 얻음. ([COLOR:255:230:85:255]외교 임무[ENDCOLOR] 수행 시 [ICON_INFLUENCE] 영향력 +20)[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ISKANWAYA', 			'[COLOR_MAGENTA]칼라와야 치유사:[ENDCOLOR] [COLOR_YIELD_FOOD]송수로[ENDCOLOR]의 [ICON_PEACE] 신앙 +1. 유닛이 [COLOR_WATER_TEXT]콜라 카파차유[ENDCOLOR] 승급을 얻음. ([COLOR:255:230:85:255]소유한 선교사, 산, 성지 근처에서[ENDCOLOR][COLOR:255:230:85:255]매 턴 회복[ENDCOLOR]).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_JERUSALEM', 			'[COLOR_MAGENTA]성지:[ENDCOLOR] [COLOR_CITY_BROWN]성지[ENDCOLOR]의 [ICON_PEACE] 신앙 +1. 동맹의 대중 종교를 채택하고 종교 압력+100%의 영구적 이득을 얻음 (정복되어도 유지). 성도와 동일한 양의 종교 압력을 제공. 세계 의회가 창설된 이후 동맹이 변경되면 [COLOR_CYAN]예루살렘[ENDCOLOR]에 대한 [COLOR_POSITIVE_TEXT]영향권[ENDCOLOR]을 얻음.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_KABUL', 				'[COLOR_MAGENTA]지상 낙원:[ENDCOLOR] 작업 가능한 영역 안의 모든 [COLOR_CITY_BLUE]산[ENDCOLOR] 타일마다 [ICON_CULTURE] +0.66 문화. [COLOR_YIELD_GOLD]지상 군사 유닛[ENDCOLOR]이 [COLOR_WATER_TEXT]무자히딘[ENDCOLOR] 승급을 얻음. (산 근처에서 [ICON_STRENGTH]방어력 +25%).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_KARYES', 				'[COLOR_MAGENTA]수도원 공화국:[ENDCOLOR] [COLOR_YIELD_GOLD]지상 민간 유닛[ENDCOLOR]이 [COLOR_WATER_TEXT]아토스 산 등반가[ENDCOLOR] 승급을 얻음. ([COLOR:255:230:85:255]산을 건널 수 있음[ENDCOLOR]). 언덕에 [COLOR_CITY_BROWN]수사원[ENDCOLOR] 시설 건설 가능. (인접 불가, [ICON_PRODUCTION] 생산, [ICON_GOLD] 골드, [ICON_CULTURE] 문화, [ICON_PEACE] 신앙 제공) 작업 가능한 영역에 [COLOR_CITY_BROWN]수사원[ENDCOLOR]이 3개 있다면 [ICON_DIPLOMAT] 위대한 외교관 포인트 +1, [ICON_HAPPINESS_3] 종교 불안.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_KATHMANDU', 			'[COLOR_MAGENTA]구르카 왕국:[ENDCOLOR]우호적인 [ICON_CITY_STATE] 도시 국가마다 [ICON_PEACE] 신앙 +1, 동맹 [ICON_CITY_STATE] 도시 국가마다 [ICON_GREAT_GENERAL] 모든 도시의 위대한 장군 포인트 +1. [ICON_GOLD] 골드로 [COLOR_YIELD_GOLD]구르카[ENDCOLOR] 유닛 (고유 [COLOR_YIELD_GOLD]수발총병[ENDCOLOR]) 구매 가능.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_KIEV', 				'[COLOR_MAGENTA]오래된 이야기:[ENDCOLOR] [COLOR_POSITIVE_TEXT][ENDCOLOR] 건설 가능 ([ICON_GREAT_MUSICIAN] +1). [ICON_GREAT_MUSICIAN] 위대한 음악가 출현률 +5%.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_KIGALI', 				'[COLOR_MAGENTA]진정한 마지막 르와부기리:[ENDCOLOR] 국경이 확장되면 [ICON_PRODUCTION] 생산 +1, [ICON_GOLD] 골드 +1. 적 처치 시 모든 도시의 [ICON_CULTURE_LOCAL] 국경 확장 점수 5. [ICON_WAR] 전쟁 피로도 -10%.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_KUALA_LUMPUR', 		'[COLOR_MAGENTA]진흙투성이 강:[ENDCOLOR] [COLOR_CITY_GREEN]강[ENDCOLOR] 타일의 [ICON_GOLD] 골드 +1. 건물 건설 시 [ICON_FOOD] 생산 +20. [ICON_CITIZEN] 시민 탄생 시 [ICON_CULTURE] 문화 10[COLOR:105:105:105:255](시대별 보정)[ENDCOLOR][NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_KYZYL', 				'[COLOR_MAGENTA]아시아의 중심:[ENDCOLOR] [COLOR_YIELD_FOOD]궁전[ENDCOLOR], [COLOR_YIELD_FOOD]기념비[ENDCOLOR]의 [ICON_RESEARCH] 과학 +1. 기술 연구 시 모든 도시에 [ICON_PRODUCTION] 생산 5-20 [COLOR:105:105:105:255](시대에 비례해, 도시 수에 반비례해 보정)[ENDCOLOR][NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_LACONIA', 			'[COLOR_MAGENTA]아고게:[ENDCOLOR] [COLOR_YIELD_GOLD]지상 군사 유닛[ENDCOLOR]이 [COLOR_WATER_TEXT]스파르탄 규율[ENDCOLOR] 승급을 얻음 ([COLOR:255:230:85:255]아군 유닛에 인접 시[ENDCOLOR] [ICON_STRENGTH] 전투력 +15%).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_LA_VENTA', 			'[COLOR_MAGENTA]의례적 창조물:[ENDCOLOR] [COLOR_CITY_GREEN]숲[ENDCOLOR] 또는 [COLOR_CITY_GREEN]정글[ENDCOLOR]이 있는 [COLOR_CITY_BLUE]평원[ENDCOLOR] 및 [COLOR_CITY_BLUE]초원[ENDCOLOR]에 [COLOR_CITY_BROWN]Colossal Head[ENDCOLOR]건설 가능 ([ICON_GREAT_ARTIST] [COLOR_YIELD_GOLD]위대한 예술가[ENDCOLOR], [ICON_GREAT_ENGINEER] [COLOR_YIELD_GOLD]위대한 기술자[ENDCOLOR], [ICON_GREAT_SCIENTIST] [COLOR_YIELD_GOLD]위대한 과학자[ENDCOLOR], [ICON_PROPHET] [COLOR_YIELD_GOLD]위대한 선지자[ENDCOLOR] 강화, [ICON_PRODUCTION] 생산, [ICON_RESEARCH] 과학, [ICON_CULTURE] 문화, [ICON_GOLDEN_AGE] 황금기 점수, [ICON_GREAT_GENERAL] 위대한 장군, [ICON_GREAT_ADMIRAL] 위대한 제독 포인트 추가)[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_LEVUKA', 				'[COLOR_MAGENTA]라사카우 해양 전사:[ENDCOLOR] 정복한 도시마다 수도의 [ICON_GREAT_GENERAL] 위대한 장군 포인트 +1. [COLOR_YIELD_GOLD]군사 유닛[ENDCOLOR]이 [COLOR_WATER_TEXT]바우의 파괴자[ENDCOLOR] 승급을 얻음. (야만인 처치 또는 야만인 주둔지 파괴 시([ICON_FOOD] 식량 30-75), 적 도시 점령 시([ICON_FOOD] 식량 100-200) [ICON_FOOD] 식량을 얻음)[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_LHASA', 				'[COLOR_MAGENTA]신의 정원:[ENDCOLOR] 작업 가능한 영역의 [COLOR_CITY_BLUE]산[ENDCOLOR] 타일마다 신앙 +0.66. [COLOR_POSITIVE_TEXT]세계 의회[ENDCOLOR]가 시작된 이후 [COLOR_YIELD_FOOD]포탈라궁[ENDCOLOR] 건설 가능. [COLOR_CYAN]포탈라궁[ENDCOLOR] 건설 시 [COLOR_CYAN]라사[ENDCOLOR]에 대한 [COLOR_POSITIVE_TEXT]영향권[ENDCOLOR]을 얻음.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MALACCA', 			'[COLOR_MAGENTA]해협 식민지:[ENDCOLOR] [COLOR_GREY]사치 자원[ENDCOLOR]의 [ICON_GOLD] 골드 +1. 도시의 [ICON_GREAT_MERCHANT] 위대한 상인 포인트 +10%. [ICON_GREAT_MERCHANT]위대한 상인과 [ICON_GREAT_ENGINEER] 위대한 기술자의 일회성 능력의 산출량 +10%.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MANAGUA', 			'[COLOR_MAGENTA]빅맨의 도시:[ENDCOLOR] 글로벌 독점에서 오는 황금기의 길이 및 산출량의 합 +7%.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MANILA', 				'[COLOR_MAGENTA]동양의 진주:[ENDCOLOR] [ICON_INTERNATIONAL_TRADE] 국제 교역로의 산출 +5%. [ICON_INTERNATIONAL_TRADE] 교역로 완료 시 [ICON_FOOD] 식량, [ICON_PRODUCTION] 생산 25-50 [COLOR:105:105:105:255](도시 [ICON_CITIZEN] 인구수에 비례해, 사용 가능한 [ICON_INTERNATIONAL_TRADE] 교역로 수에 반비례해 보정)[ENDCOLOR][NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MBANZA_KONGO', 		'[COLOR_MAGENTA]전사 여왕:[ENDCOLOR] [COLOR_YIELD_GOLD]지상 군사 유닛[ENDCOLOR]이 [COLOR_WATER_TEXT]마니콩고의 영광[ENDCOLOR] 승급을 얻음. ([COLOR:255:230:85:255]숲, 정글, 습지, 범람원[ENDCOLOR]에서 [ICON_STRENGTH] 전투력 +15%).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MELBOURNE', 			'[COLOR_MAGENTA]골드 러쉬:[ENDCOLOR] [COLOR_CITY_BROWN]광산[ENDCOLOR]의 [ICON_GOLD] 골드 +1. 도시 [ICON_GOLD] 골드의 10%가  [ICON_FOOD] 식량으로, 5%가 [ICON_CULTURE_LOCAL] 국경 확장 점수로 전환됨.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MILAN', 				'[COLOR_MAGENTA]비스콘티 특사:[ENDCOLOR][COLOR_YIELD_FOOD]비스콘티 저택[ENDCOLOR] 건설 가능 ([ICON_GREAT_ARTIST] +1). [ICON_GREAT_ARTIST] 위대한 예술가 출현률 +5%.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MOGADISHU', 			'[COLOR_MAGENTA]떠오르는 해양 도시:[ENDCOLOR] [COLOR_CITY_BLUE]해양[ENDCOLOR] 타일과 [COLOR_CITY_GREEN]범람원[ENDCOLOR]의 [ICON_FOOD] 식량 +1. [ICON_GOLDEN_AGE] 황금기 동안 [ICON_FOOD] 식량 +5%. [ICON_GOLDEN_AGE] 황금기 진입 비용 -10%.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MOMBASA', 			'[COLOR_MAGENTA]테나샤라 타이파:[ENDCOLOR] [COLOR_GREY]보너스 자원[ENDCOLOR]의 [ICON_FOOD] 식량 +1. 도시 설립 시 [ICON_PEACE] 신앙 40 [COLOR:105:105:105:255](시대별 보정)[ENDCOLOR][NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MONACO', 				'[COLOR_MAGENTA]금융 천국:[ENDCOLOR] [COLOR_YIELD_FOOD]시장[ENDCOLOR], [COLOR_YIELD_FOOD]운향[ENDCOLOR]의 [ICON_CULTURE_LOCAL] 국경 확장 점수 +1. 모든 도시의 [ICON_GOLD] 타일 골드 구매 비용 -33%.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MUISCA', 				'[COLOR_MAGENTA]황금 도시:[ENDCOLOR] 수도의 [ICON_CITIZEN] 시민 3명마다, 제국 전체의 [ICON_CITIZEN] 시민 20명마다 [ICON_GOLD] 골드 +1. [ICON_GOLDEN_AGE] 황금기 또는 [ICON_HAPPINESS_1] 국왕 경축일 동안 국경 확장 속도 두 배.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MULTAN', 				'[COLOR_MAGENTA]성인의 도시:[ENDCOLOR] [ICON_CITIZEN] 시민이 탄생할 때마다 [ICON_PEACE] 신앙 10 [COLOR:105:105:105:255](시대별 보정)[ENDCOLOR] [ICON_MISSIONARY] [COLOR_YIELD_GOLD]선교사[ENDCOLOR]가 추가로 1회 전도 가능.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MUSCAT', 				'[COLOR_MAGENTA]은둔의 항구:[ENDCOLOR] [ICON_SPY] 적 스파이를 잡을 시 보정 +50%. 도시에 주둔한 유닛의 [ICON_STRENGTH] 전투력 +10%. 주둔한 유닛의 [ICON_GOLD] 골드 유지비가 들지 않음.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MUTITJULU', 			'[COLOR_MAGENTA]허우엘 법률:[ENDCOLOR] 작업 중인 [COLOR_CITY_BLUE]사막[ENDCOLOR] 2개마다 황금기 점수 +1. [COLOR_WHITE]자연 불가사의[ENDCOLOR]의 [ICON_PEACE] 신앙 +3, [COLOR_CITY_BLUE]사막[ENDCOLOR]의 [ICON_PEACE] 신앙 +1.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_NANMANDOL', 			'[COLOR_MAGENTA]천상의 보초:[ENDCOLOR] [COLOR_CITY_BLUE]해양[ENDCOLOR] 타일의 [ICON_FOOD] 식량 +1, [ICON_CULTURE] 문화 +1. 유닛 사망 시 모든 도시에 [ICON_CULTURE] 문화 3 [NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_NYARYANA_MARQ', 		'[COLOR_MAGENTA]순록 목동:[ENDCOLOR] [COLOR_CITY_BLUE]Snow[ENDCOLOR] gain +1 [ICON_CULTURE] Culture. Player can build a [COLOR_CITY_BROWN]Chum[ENDCOLOR] improvement on [COLOR_CITY_BLUE]Tundra[ENDCOLOR] and [COLOR_CITY_BLUE]Snow[ENDCOLOR] tiles (not adjacent) increasing [ICON_FOOD] Food, [ICON_PRODUCTION] Production and [ICON_GOLD] Gold output.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_OC_EO', 				'[COLOR_MAGENTA]위대한 글래스 강의 군주들:[ENDCOLOR] [ICON_CARGO_SHIP] 해양 교역로 최대 거리 +20%. 해양 도시의 [ICON_CULTURE_LOCAL] 국경 확장 점수 +1. [ICON_CARGO_SHIP] 해양 국제 교역로마다 [ICON_HAPPINESS_1] 행복 +1.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ODENSO', 				'[COLOR_MAGENTA]겨울 전쟁:[ENDCOLOR] [COLOR_YIELD_GOLD]군사 유닛[ENDCOLOR]이 [COLOR_WATER_TEXT]사냥의 제왕[ENDCOLOR] 승급을 얻음. ([ICON_VIEW_CITY]시야 +1. [COLOR:255:230:85:255]중립 영토에서 회복 시 [ENDCOLOR] +5).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ORMUS', 				'[COLOR_MAGENTA]보석의 왕:[ENDCOLOR] [COLOR_GREY]사치 자원[ENDCOLOR]의 [ICON_FOOD] 식량 +1. [ICON_CITY_STATE] 도시 국가로 향하는 [ICON_INTERNATIONAL_TRADE] 국제 교역로가 매 턴 [ICON_CITY_STATE] 도시 국가로 향하는 교역로 수마다 [ICON_INFLUENCE] 영향력 +0.4 (최대 [ICON_INFLUENCE] 영향력 +2)[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_PANAMA_CITY', 		'[COLOR_MAGENTA]파나마 운하:[ENDCOLOR] [COLOR_CITY_GREEN]호수[ENDCOLOR]의 [ICON_GOLD] 골드 +1. [ICON_CARGO_SHIP]해양 교역로 범위 +10%. [ICON_CARGO_SHIP] 국제 해양 교역로의 [ICON_GOLD] 골드 +1.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_PHANOTEUS', 			'[COLOR_MAGENTA]프로메테우스의 선물:[ENDCOLOR] [ICON_CITY_STATE] 도시 국가의 [COLOR_POSITIVE_TEXT]선거 조작[ENDCOLOR] 또는 [COLOR_POSITIVE_TEXT]쿠데타[ENDCOLOR]에 추가 기회 부여. [ICON_SPY] 보안 등급과 스파이 작전 속도 +20%.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_PRAGUE', 				'[COLOR_MAGENTA]프라하 성:[ENDCOLOR] [COLOR_YIELD_FOOD]성벽[ENDCOLOR], [COLOR_YIELD_FOOD]성[ENDCOLOR]의 [ICON_CULTURE] 문화 +1.종교를 퍼뜨릴 수 있는 유닛이 사망하거나 소모될 시 [ICON_CULTURE] 문화를 10-30, [ICON_PEACE] 신앙을 20-60 제공. [COLOR:105:105:105:255](시대별 보정)[ENDCOLOR][NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_QUEBEC_CITY', 		'[COLOR_MAGENTA]모피와 통나무:[ENDCOLOR] [COLOR_CITY_BROWN]야영지[ENDCOLOR], [COLOR_CITY_BROWN]재재소[ENDCOLOR]의 [ICON_GOLD] 골드 +1. [COLOR_CITY_GREEN]숲[ENDCOLOR] 또는 [COLOR_CITY_GREEN]정글[ENDCOLOR] 제거 시 [ICON_PRODUCTION] 생산 10, [ICON_GOLD] 골드 10 [COLOR:105:105:105:255](시대별 보정)[ENDCOLOR][NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_QUELIMANE', 			'[COLOR_MAGENTA]길조의 강:[ENDCOLOR] [COLOR_CITY_GREEN]강[ENDCOLOR]의 [ICON_GOLDEN_AGE] 황금기 점수 +1. [ICON_GOLDEN_AGE] 황금기 길이 +25%[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_RAGUSA', 				'[COLOR_MAGENTA]해양 종속국:[ENDCOLOR] [COLOR_CITY_BROWN]대사관[ENDCOLOR]의 [ICON_FOOD] 식량 +1.해안 도시의 [ICON_SILVER_FIST] 군사 유닛 보급 한도 +1. [ICON_CITY_STATE] 도시 국가 동맹마다 모든 도시에 [ICON_FOOD] 식량 +1.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_RIGA', 				'[COLOR_MAGENTA]한자 동맹:[ENDCOLOR] [ICON_FOOD]식량 +2%. [ICON_CITY_STATE] 도시 국가에 연결된 [ICON_INTERNATIONAL_TRADE] 국제 교역로마다 [ICON_PRODUCTION] 생산 +1%.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_RISHIKESH', 			'[COLOR_MAGENTA]히말라야 요가:[ENDCOLOR] [COLOR_YIELD_FOOD]아쉬람[ENDCOLOR] 건물 건설 가능 ([ICON_RESEARCH], [ICON_PEACE], [ICON_TOURISM], [ICON_HAPPINESS_3]). [COLOR_CITY_GREEN]강[ENDCOLOR] 근처 도시의 [ICON_PEACE] 신앙 +2.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_SAMARKAND', 			'[COLOR_MAGENTA]소그드:[ENDCOLOR] [ICON_INTERNATIONAL_TRADE] 국제 고역로가 출발 도시 및 목표 도시 서로에게 [ICON_GOLD] 골드 +4. [COLOR_YIELD_GOLD]교역 유닛[ENDCOLOR]의 [ICON_SIGHT] 시야 +2.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_SANTO_DOMINGO', 		'[COLOR_MAGENTA]카리브해의 관문:[ENDCOLOR] 글로벌 독점에서 오는 행복 및 산출량의 합 +3[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_SGAANG', 				'[COLOR_MAGENTA]토템 폴 유적:[ENDCOLOR] [COLOR_YIELD_GOLD]해상 유닛[ENDCOLOR]이 [COLOR_WATER_TEXT]한랭해역의 전문가[ENDCOLOR] 승급을 얻음 ([COLOR:255:230:85:255]빙하 통과 가능[ENDCOLOR]). 해안 [COLOR_CITY_BLUE]툰드라[ENDCOLOR]에 [COLOR_CITY_BROWN]토템 폴[ENDCOLOR] 시설 건설 가능 ([ICON_FOOD] 식량, [ICON_PRODUCTION] 생산, [ICON_GOLD] 골드, [ICON_CULTURE] 문화 증가)[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_SIDON', 				'[COLOR_MAGENTA]정복 도시:[ENDCOLOR] 다른 도시 국가에 공물 요구 시 [COLOR_CYAN]시돈[ENDCOLOR]에 대한 [COLOR_POSITIVE_TEXT]영향권[ENDCOLOR]을 얻음. [COLOR_YIELD_GOLD]군사 유닛[ENDCOLOR]이 [COLOR_WATER_TEXT]지역 불량배[ENDCOLOR] 승급을 얻음 ([COLOR:255:230:85:255]적 영토에서 회복 시[ENDCOLOR] 체력 +5).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_SIERRA_LEONE', 		'[COLOR_MAGENTA]자유의 왕국:[ENDCOLOR] [COLOR_YIELD_GOLD]노동자[ENDCOLOR] [ICON_WORKER]건설 속도 +20%. [ICON_HAPPINESS_3] 낙후 -5%. [COLOR_YIELD_GOLD]노동자[ENDCOLOR]마다 매 턴 [ICON_CULTURE]문화 +1.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_SINGAPORE', 			'[COLOR_MAGENTA]발전된 부:[ENDCOLOR][COLOR_YIELD_GOLD]외교 유닛[ENDCOLOR] 생산 시 [ICON_PRODUCTION] 생산력 +5%. [COLOR_YIELD_GOLD]외교 유닛[ENDCOLOR] 소모 시 [ICON_GOLD] 골드 30 [COLOR:105:105:105:255](시대 및 대상 도시 국가의 [ICON_INFLUENCE] 영향력에 따라 보정)[ENDCOLOR] [COLOR_YIELD_GOLD]외교 유닛[ENDCOLOR]이 [COLOR_WATER_TEXT]귀족[ENDCOLOR] 승급을 얻음 (외교 임무 수행 시 [ICON_INFLUENCE] 영향력 +15).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_SOFIA', 				'[COLOR_MAGENTA]세르디카:[ENDCOLOR] 도시 시민이 믿는 종교 하나당 도시의 [ICON_GREAT_GENERAL] 위대한 장군 포인트 +1,  [ICON_GREAT_ADMIRAL] 위대한 제독 포인트 +1. [ICON_GREAT_GENERAL] [COLOR_YIELD_GOLD]위대한 장군[ENDCOLOR] 및 [ICON_GREAT_ADMIRAL] [COLOR_YIELD_GOLD]위대한 제독[ENDCOLOR]의 [ICON_STRENGTH] 전투력 보너스 +10%.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_SURREY', 				'[COLOR_MAGENTA]장엄한 비행:[ENDCOLOR] [COLOR_GREY]전략 자원[ENDCOLOR]에서 [ICON_GREAT_GENERAL] 위대한 장군 포인트 +1. [COLOR_YIELD_GOLD]공중 유닛[ENDCOLOR] 생산 시 [ICON_PRODUCTION] 생산 +10%. [COLOR_YIELD_GOLD]공중 유닛[ENDCOLOR]이 [COLOR_WATER_TEXT]장엄한 비행[ENDCOLOR] 승급을 얻음 ([COLOR:255:230:85:255]지상 및 해양 유닛과 전투 시 [ENDCOLOR][ICON_RANGE_STRENGTH] 전투력 +10%).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_SYDNEY', 				'[COLOR_MAGENTA]자본 인프라:[ENDCOLOR] [ICON_HAPPINESS_1] 국왕 경축일 동안 [ICON_FOOD] 식량 +5%. [ICON_HAPPINESS_1] 국왕 경축일이 시작하면 [ICON_GREAT_ARTIST] 위대한 예술가 포인트, [ICON_GREAT_ARTIST] 위대한 작가 포인트, [ICON_GREAT_ARTIST] 위대한 음악가 포인트를 5-20 얻음[COLOR:105:105:105:255](시대별 보정)[ENDCOLOR] [NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_TAIWAN', 				'[COLOR_MAGENTA]대만의 기적:[ENDCOLOR] 도시 생산을 과학으로 전환하면 [ICON_RESEARCH] 과학 +10%. [ICON_RESEARCH] 과학의 10%를 [ICON_FOOD] 식량으로 전환.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_THIMPHU', 			'[COLOR_MAGENTA]전룡의 왕국:[ENDCOLOR] [COLOR_CYAN]언덕[ENDCOLOR] 위 도시의 [ICON_CULTURE] 문화 +3. 매 턴 [ICON_STRENGTH] 방어력 +0.1, [ICON_CULTURE] 문화 +1.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_TIWANAKU', 			'[COLOR_MAGENTA]하나 파차:[ENDCOLOR] [ICON_PEACE] 신앙으로 [COLOR_YIELD_GOLD]시스퀘노[ENDCOLOR] 유닛 (고유 [COLOR_YIELD_GOLD]선교사[ENDCOLOR]) 구매 가능. 선교사를 소모하여 평지 [COLOR_CITY_BLUE]평원[ENDCOLOR], [COLOR_CITY_BLUE]툰드라[ENDCOLOR], [COLOR_CITY_BLUE]사막[ENDCOLOR]에 [COLOR_CITY_BROWN]성큰 가든[ENDCOLOR] 시설 건설 가능. (인접 불가, [ICON_RESEARCH] 과학, [ICON_CULTURE] 문화, [ICON_PEACE] 신앙, [ICON_TOURISM] 관광 증가)[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_TYRE', 				'[COLOR_MAGENTA]고대 시대의 유적:[ENDCOLOR] [ICON_VP_ARTIFACT] [COLOR_CITY_BROWN]랜드마크[ENDCOLOR]의 [ICON_GOLD] 골드 +2. [ICON_VP_ARTIFACT] [COLOR_YIELD_GOLD]고고학자[ENDCOLOR] 생산 시 생산 +10%.[ICON_WONDER] 불가사의 건설 시 [ICON_TOURISM] 관광 20-40 [COLOR:105:105:105:255](시대 및 도시의 [ICON_WONDER] 불가사의 수에 따라 보정)[ENDCOLOR][NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_UR', 					'[COLOR_MAGENTA]문명의 요람:[ENDCOLOR] [ICON_TRADE] 도시 연결 시 [ICON_FOOD] 식량 +2. 새로 건설하는 도시의 [ICON_CITIZEN] 시민 +1.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_VALLETTA', 			'[COLOR_MAGENTA]대항만:[ENDCOLOR] [COLOR_YIELD_FOOD]대항만[ENDCOLOR] 건설 가능 ([ICON_FOOD], [ICON_RESEARCH], [ICON_STRENGTH]).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_VANCOUVER', 			'[COLOR_MAGENTA]터미널 도시:[ENDCOLOR] 각 [ICON_TRADE] 도시 연결마다 [ICON_GOLD] 골드 3%. [ICON_GOLD] 도시 연결 유지비 -30%[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_VATICAN_CITY', 		'[COLOR_MAGENTA]콘클라베:[ENDCOLOR] [ICON_GREAT_PEOPLE] [COLOR_YIELD_GOLD]위인[ENDCOLOR] 소모 시 만난 모든 [ICON_CITY_STATE] 도시 국가에  [ICON_INFLUENCE] 영향력 10.  [ICON_GOLD] 골드 또는 [ICON_PEACE] 신앙으로 [COLOR_YIELD_GOLD]스위스 근위대[ENDCOLOR]유닛 (용병) 구매 가능[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_VILNIUS', 			'[COLOR_MAGENTA]북방의 아테네:[ENDCOLOR] [COLOR_YIELD_FOOD]황혼의 문[ENDCOLOR] 건설 가능 ([ICON_GREAT_WRITER] +1). 작가의 [ICON_GOLD] 골드 +1.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_WELLINGTON', 			'[COLOR_MAGENTA]테 황가누이-아-타라:[ENDCOLOR] [COLOR_GREY]전략 자원[ENDCOLOR]의 [ICON_FOOD] 식량 +1. 추가로 [COLOR_GREY] 전략 자원[ENDCOLOR]의 복사본을 얻음:[NEWLINE][ICON_BULLET] +1 (가지고 있지만 독점은 없을 때)[NEWLINE][ICON_BULLET] +2 (전략 독점)[NEWLINE][ICON_BULLET] +3 (글로벌 독점)[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_WITTENBERG', 			'[COLOR_MAGENTA]종교 개혁의 장:[ENDCOLOR] 도시 시민이 믿는 종교 하나당 도시의 [ICON_PRODUCTION] 생산 +1, [ICON_GOLD] 골드 +1, [ICON_CULTURE] 문화 +1. [ICON_PEACE] 종교 압력 -10%, [ICON_PEACE] 개종 저항 -10%. 모든 도시의 [ICON_HAPPINESS_3] 종교 불안 -5%[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_WOOTEI_NIICIE', 		'[COLOR_MAGENTA]푸른 하늘의 인류:[ENDCOLOR] [COLOR_YIELD_GOLD]기병 및 화약 유닛[ENDCOLOR] 생산 시 [ICON_PRODUCTION] 생산 +10%. [COLOR_YIELD_FOOD]대상 숙소[ENDCOLOR]가 있거나 [ICON_RES_HORSE] [COLOR_GREY]말[ENDCOLOR] 근처에 있는 도시에서 생산한 [COLOR_YIELD_GOLD]지상 유닛[ENDCOLOR]의 경험치 +15. 유닛이 레벨업할 시 [ICON_GREAT_GENERAL] 위대한 장군 포인트 +2 [COLOR:105:105:105:255](레벨에 따라 보정)[ENDCOLOR][NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_YANGCHENG', 			'[COLOR_MAGENTA]십이간지:[ENDCOLOR] [COLOR_GREY]동물 자원[ENDCOLOR]의 [ICON_PEACE] 신앙 +1. 매 시대가 시작될 때마다 [ICON_PEACE] 신앙 70, (시대에 처음으로 진입했다면 30% 추가) 12종류 중 무작위 추가 보너스를 얻음.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_YEREVAN', 			'[COLOR_MAGENTA]대아르메니아:[ENDCOLOR] [ICON_RES_HORSE] [COLOR_GREY]말[ENDCOLOR]의 [ICON_CULTURE] 문화 +1. [COLOR_YIELD_GOLD]군사 유닛[ENDCOLOR]이 [COLOR_WATER_TEXT]손자병법[ENDCOLOR] 승급을 얻음([COLOR:255:230:85:255]처치 시[ENDCOLOR] [ICON_CULTURE] 문화, [ICON_GOLDEN_AGE] 황금기 점수).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ZANZIBAR', 			'[COLOR_MAGENTA]향신료의 섬:[ENDCOLOR] [COLOR_GREY]사치 자원[ENDCOLOR]의 [ICON_TOURISM] 관광 +1. [ICON_INTERNATIONAL_TRADE] 교역로마다 [ICON_HAPPINESS_3] 행복 +1.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ZURICH', 				'[COLOR_MAGENTA]금융 박람회:[ENDCOLOR] [COLOR_YIELD_FOOD]은행[ENDCOLOR], [COLOR_YIELD_FOOD]증권거래소[ENDCOLOR]의 [ICON_GOLD] 골드 +2. 매 턴 총 [ICON_GOLD] 골드가 +2%(시대별 최대 20 [ICON_GOLD] 골드로 제한)[NEWLINE]' UNION ALL
-- promotions
SELECT 'TXT_KEY_PROMOTION_AMBRACIA', 					'피로스의 용병' UNION ALL
SELECT 'TXT_KEY_PROMOTION_AMBRACIA_HELP', 					' [COLOR_POSITIVE_TEXT]도시에 주둔 시[ENDCOLOR] [ICON_PRODUCTION] 생산 +5%.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_ANTANANARIVO', 				'해적의 천국' UNION ALL
SELECT 'TXT_KEY_PROMOTION_ANTANANARIVO_HELP', 				'유닛 처치 시 [ICON_STRENGTH] 전투력과 동일한 [ICON_GOLD] 골드 제공' UNION ALL
SELECT 'TXT_KEY_PROMOTION_AUCKLAND', 					'비폭력 저항' UNION ALL
SELECT 'TXT_KEY_PROMOTION_AUCKLAND_HELP', 					'주둔 시 도시의 [ICON_FOOD] 식량 +1, [ICON_GOLDEN_AGE] 황금기 점수 +1.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_BELGRADE', 					'하얀 요새' UNION ALL
SELECT 'TXT_KEY_PROMOTION_BELGRADE_HELP', 					'체력 +25.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT', 					'성전사의 열의' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT_HELP', 					'전투 경험치 +15%' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT1', 					'클레몬트의 축복' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT1_HELP', 					'첫 전투에 따라 임시로 무작위 전투력 보너스 제공' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT2', 					'서둘러!' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT2_HELP', 					'[ICON_MOVES]이동력 +1. 공격 후 이동 가능' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT3', 					'대동단결!' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT3_HELP', 					'[COLOR_POSITIVE_TEXT]아군 유닛에 인접 시[ENDCOLOR] [ICON_STRENGTH] 전투력 +15%' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT4', 					'돌격!' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT4_HELP', 					'공격 시 전투력 [ICON_STRENGTH] +5%. [COLOR_POSITIVE_TEXT]요새화한 유닛[ENDCOLOR] 상대로 [ICON_STRENGTH] +15%.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT5', 					'보강!' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT5_HELP', 					'[ICON_STRENGTH] 방어력 +15%. 공격 후 회복 가능.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT6', 					'하느님께 영광을' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT6_HELP', 					'위대한 장군처럼 주변 유닛에 전투력 보너스 부여. 주변 유닛이 매 턴 체력 5 추가 회복.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT7', 					'신의 뜻으로' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT7_HELP', 					'시야 +1. 적 처치 시 [ICON_STRENGTH] 전투력의 75% 만큼 [ICON_PEACE] 신앙 제공' UNION ALL
SELECT 'TXT_KEY_PROMOTION_DODOMA', 						'광야 항해' UNION ALL
SELECT 'TXT_KEY_PROMOTION_DODOMA_HELP', 					'[ICON_MOVES] 이동력 +2' UNION ALL
SELECT 'TXT_KEY_PROMOTION_FAYA', 						'전쟁의 수확' UNION ALL
SELECT 'TXT_KEY_PROMOTION_FAYA_HELP', 						'처치한 적의 [ICON_STRENGTH]전투력 50%만큼 [ICON_RESEARCH] 과학 제공' UNION ALL
SELECT 'TXT_KEY_PROMOTION_HANOI', 						'애국주의' UNION ALL
SELECT 'TXT_KEY_PROMOTION_HANOI_HELP', 						'[COLOR_POSITIVE_TEXT]아군 영토 내에서[ENDCOLOR] [ICON_STRENGTH] 전투력 +10%.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_IFE', 						'이와레파' UNION ALL
SELECT 'TXT_KEY_PROMOTION_IFE_HELP', 						'외교 임무 수행 시 [ICON_INFLUENCE] 영향력 +20.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_ISKANWAYA', 					'콜라 카파차유' UNION ALL
SELECT 'TXT_KEY_PROMOTION_ISKANWAYA_HELP', 					'[COLOR_POSITIVE_TEXT]선교사[ENDCOLOR], [COLOR_POSITIVE_TEXT]성지[ENDCOLOR], [COLOR_POSITIVE_TEXT]산[ENDCOLOR] 근처에서 매턴 체력 +10.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_KABUL', 						'무자히딘' UNION ALL
SELECT 'TXT_KEY_PROMOTION_KABUL_HELP', 						'[ICON_STRENGTH] 방어력 +25%.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_KARYES', 						'아토스 산 등반가' UNION ALL
SELECT 'TXT_KEY_PROMOTION_KARYES_HELP', 					'유닛이 산을 건널 수 있음.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_LACONIA', 					'스파르탄 규율' UNION ALL
SELECT 'TXT_KEY_PROMOTION_LACONIA_HELP', 					'[COLOR_POSITIVE_TEXT]아군 유닛에 인접 시[ENDCOLOR] [ICON_STRENGTH] 전투력 +15%' UNION ALL
SELECT 'TXT_KEY_PROMOTION_LEVUKA', 						'바우의 파괴자' UNION ALL
SELECT 'TXT_KEY_PROMOTION_LEVUKA_HELP', 					'[COLOR_POSITIVE_TEXT]야만인 처치[ENDCOLOR], [COLOR_POSITIVE_TEXT]야만인 주둔지 파괴[ENDCOLOR], [COLOR_POSITIVE_TEXT]도시 점령[ENDCOLOR] 시 [ICON_FOOD].' UNION ALL
SELECT 'TXT_KEY_PROMOTION_MBANZA_KONGO', 				'마니콩고의 영광' UNION ALL
SELECT 'TXT_KEY_PROMOTION_MBANZA_KONGO_HELP', 				'[COLOR_POSITIVE_TEXT]숲[ENDCOLOR], [COLOR_POSITIVE_TEXT]정글[ENDCOLOR], [COLOR_POSITIVE_TEXT]습지[ENDCOLOR], [COLOR_POSITIVE_TEXT]범람원[ENDCOLOR]에서 전투 시 [ICON_STRENGTH] 전투력 +15%.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_ODENSO', 						'사냥의 제왕' UNION ALL
SELECT 'TXT_KEY_PROMOTION_ODENSO_HELP', 					'[ICON_VIEW_CITY] 시야 +1, 중립 영토에서 회복 시 추가로 5 회복.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SGAANG', 						'한랭해역의 전문가' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SGAANG_HELP', 					'유닛이 빙하를 건널 수 있음' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIDON', 						'지역 불량배' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIDON_HELP', 						'[COLOR_POSITIVE_TEXT]적 영토 내에서 회복 시[ENDCOLOR] 추가로 5 회복.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SURREY', 						'장엄한 비행' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SURREY_HELP', 					'해상 및 지상 유닛 대항 시 [ICON_STRENGTH]전투력 보너스 +10%.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_YEREVAN', 					'손자병법' UNION ALL
SELECT 'TXT_KEY_PROMOTION_YEREVAN_HELP', 					'처치한 적의 [ICON_STRENGTH]전투력 50%만큼 [ICON_CULTURE] 문화 제공' UNION ALL
SELECT 'TXT_KEY_PROMOTION_GUARDIA_SVIZZERA', 			'스위스 근위대' UNION ALL
SELECT 'TXT_KEY_PROMOTION_GUARDIA_SVIZZERA_HELP', 			'도시 내에서 처치 시 체력 10, 수도 내에서 처치 시 30, 성도 내에서 처치 시 40 회복.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_KATZBALGER', 					'카츠발게르' UNION ALL
SELECT 'TXT_KEY_PROMOTION_KATZBALGER_HELP', 				'유닛이 [ICON_PEACE] 신앙 +2 생산,  [COLOR_CYAN]라디오[ENDCOLOR] 연구 시 [ICON_CULTURE] 문화 +2, [COLOR_CYAN]통신[ENDCOLOR] 연구 시 [ICON_TOURISM] 관광 +2.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_MILITARISTIC_NEUTRAL', 		'용병 군대' UNION ALL
SELECT 'TXT_KEY_PROMOTION_MILITARISTIC_NEUTRAL_HELP', 		'전투 경험치 +20%' UNION ALL
-- units
SELECT 'TXT_KEY_UNIT_SWISS_GUARD', 						'스위스 근위대' UNION ALL
SELECT 'TXT_KEY_UNIT_SWISS_GUARD_STRATEGY', 				'The Swiss Guard is a unique mercenary unit of the Vatican City, located in the tech tree between [COLOR_POSITIVE_TEXT]Free Company[ENDCOLOR] and [COLOR_POSITIVE_TEXT]Foreign Legion[ENDCOLOR]. It can only be purchased (with either [ICON_GOLD] Gold or [ICON_PEACE] Faith) and does move after purchase; though it does not require any policies to do so. The Swiss Guard gains extra [ICON_STRENGTH] Strength each consecutive Era and heals after killing an enemy unit, if it is close to owned City (a little), Capital (more) or Holy City (the most). It also generates yields depending on techs discovered ([COLOR_CYAN]Radio[ENDCOLOR] and [COLOR_CYAN]Telecommunications[ENDCOLOR]). This unit does not obsolete.' UNION ALL
SELECT 'TXT_KEY_UNIT_SWISS_GUARD_HELP', 					'This unit can only be purchased with [ICON_GOLD] Gold or [ICON_PEACE] Faith (requires an access to [COLOR_CYAN]Vatican City[ENDCOLOR]''s ability).[NEWLINE][NEWLINE]Does not obsolete. Gains additional [ICON_STRENGTH] Strength each consecutive Era. May move immediately after purchase.[NEWLINE][NEWLINE]Unit heals itself after killing an Enemy Unit by value depending on the owned City it is in range of (regular, Capital, Holy City). Generates +2 [ICON_PEACE] Faith, +2 [ICON_CULTURE] Culture after [COLOR_CYAN]Radio[ENDCOLOR] and +2 [ICON_TOURISM] Tourism after [COLOR_CYAN]Telecommunications[ENDCOLOR].' UNION ALL
SELECT 'TXT_KEY_CIV5_UNIT_SWISS_GUARD', 					'스위스 근위대는 역사적으로 중세와 르네상스 시대에 유럽의 궁정에서 경호원으로 활동했던 스위스 출신 용병들을 일컫는 말입니다. 변함없는 충성심과 용맹함으로 찬사를 받은 스위스 근위대는 의장대부터 최전방 부대까지 다양한 임무를 수행했으며 프랑스, 스페인, 나폴리 등 유럽 강대국의 군대에서 사용되었습니다. 1874년 스위스 헌법에 의해 외국 세력의 스위스 근위대 모집이 금지되었지만 교황청을 위해 복무한 교황청 스위스 근위대는 예외였으며, 오늘날에도 교황의 안전과 사도궁의 보안을 책임지는 바티칸의 주요 부대로 남아 있습니다.' UNION ALL
SELECT 'TXT_KEY_UNIT_GURKHA', 							'구르카' UNION ALL
SELECT 'TXT_KEY_UNIT_GURKHA_STRATEGY', 						'The Gurkha is the Kathmandu''s replacement for the Fusilier. In addition to being unlocked earlier than the Rifleman, the Gurkha gains more experience from fights and has huge handicap against blocked enemy units.' UNION ALL
SELECT 'TXT_KEY_UNIT_GURKHA_HELP', 							'This unit can only be purchased with [ICON_GOLD] Gold (requires an access to [COLOR_CYAN]Kathmandu[ENDCOLOR]''s ability).[NEWLINE][NEWLINE]Unique Fusilier Unit that may move immediately after purchase, can be trained earlier and does not require [COLOR_POSITIVE_TEXT]Armory[ENDCOLOR] when buying.[NEWLINE][NEWLINE]Unit starts with additional promotions that crush enemy units ([COLOR_POSITIVE_TEXT]Heavy Charge[ENDCOLOR]) and allow gaining mor XP from fights ([COLOR_POSITIVE_TEXT]Quick Study[ENDCOLOR]).' UNION ALL
SELECT 'TXT_KEY_CIV5_UNIT_GURKHA', 							'구르카족은 네팔 산악지대와 인도 고르칼란드 지역에 거주하는 민족입니다. 용감하고 두려움이 없으며 죽음을 두려워하지 않는 것으로 유명한 이들은 1814년 동인도회사가 네팔과 벌인 구르카 전쟁 당시 영국군 지휘관들에게 깊은 인상을 남겼습니다. 전쟁이 끝나기도 전인 1815년, 영국 인도 군대 내에 구르카족 최초의 연대가 창설되었습니다. 19세기부터 20세기까지 구르카족은 전쟁과 수많은 인도 반란에도 불구하고 영국 왕실에 충성을 다했습니다. 구르카족은 영국군의 일원으로 두 차례의 세계대전에 참전하여 15개의 소총 연대를 구성했습니다. 그들은 어떤 고난도 견뎌내는 능력으로 널리 존경받았으며 치명적인 쿠쿠리 칼을 다루는 기술로 두려움을 샀습니다. 구르카 연대는 오늘날까지 계속 복무하고 있습니다.' UNION ALL
SELECT 'TXT_KEY_UNIT_SISQENO', 							'시스퀘노' UNION ALL
SELECT 'TXT_KEY_UNIT_SISQENO_STRATEGY', 					'The Sisqeno is the Tiwanaku''s replacement for the Missionary. It gains additional active ability, that allows it to build Sunken Courtyard improvements. This action may only be used when unit has all of its spreads (before using spread action).' UNION ALL
SELECT 'TXT_KEY_UNIT_SISQENO_HELP', 						'This unit can only be purchased with [ICON_PEACE] Faith (requires an access to [COLOR_CYAN]Tiwanaku[ENDCOLOR]''s ability).[NEWLINE][NEWLINE]Unique Missionary Unit. It is slightly cheaper than its predecessor.[NEWLINE][NEWLINE]Unit can build a [COLOR_POSITIVE_TEXT]Sunken Courtyard[ENDCOLOR] improvement, only when all of its Spread Religion charges are active.' UNION ALL
SELECT 'TXT_KEY_CIV5_UNIT_SISQENO', 						'티와나쿠 제국은 티티카카 호수의 물리적 공간과 티와나쿠의 고지대 유적지 사이에 영성, 힘, 권위를 연결했습니다. 두 유적지 모두에 사원이 세워졌으며 뱀, 콘도르, 퓨마의 공통된 이미지는 두 유적지를 연결한 종교적, 우주론적 표현에 있어 중요한 의미를 지니고 있습니다.[NEWLINE]여러 학자들은 티와나쿠의 영성, 농업 패턴, 기념비적인 건축물, 예술적 묘사가 치리파, 푸카라, 쿠스코와 같은 초기 및 다른 지역 문화와 연관성이 있다고 지적했습니다. 야야-마마 종교 전통으로 알려진 티티카카 호수 지역에서 발견된 많은 유물은 유사한 모티프를 특징으로 하며, 이 지역의 지리와 문화에 오랫동안 통합되어 있음을 보여줍니다. 티티카카 호수는 티와나쿠와 잉카 세계관에서는 우주의 정신적 발상지이자 중심지였으며, 지금도 이 지역에 살고 있는 원주민들에게 신성한 장소로 남아 있습니다. 티티카카 호수는 영적으로 강력한 동물인 퓨마의 이름을 따서 명명되었습니다.[NEWLINE]티와나쿠의 뒤를 이어 수백 년 동안 전해 내려온 잉카 신화에 따르면 신이자 위대한 창조자인 비라코차가 티티카카 호수에서 대홍수 후 세상을 창조하기 위해 등장했습니다. 그는 오늘날 볼리비아의 티티카카 호수 남쪽 기슭에 있는 태양의 섬에서 태양(인티)을, 동쪽의 달의 섬에서 달(마마 킬라)을 가져왔고 호수에서 태어난 별들로 우주를 창조했습니다. 그 후 티와나쿠에서 돌로 최초의 인간을 창조했습니다. 비라코차는 원소, 날씨, 농사의 운을 관장하는 전능한 신이었어요. 비라코차는 태양의 관문에 있는 티와나쿠에 묘사되어 있으며 고대 제국의 다른 조각과 이미지에도 등장합니다. 잉카의 신처럼 양손에 콘도르의 머리인 뱀을 들고 있는 모습을 볼 수 있습니다.[NEWLINE][NEWLINE]비라코차 숭배 외에도 티와나쿠 종교에 대한 다른 증거는 조상 숭배의 체계를 가리킵니다. 후기 잉카와 마찬가지로 미라 묶음과 골격 유골의 보존, 사용 및 재구성을 보면 이것이 사실임을 알 수 있습니다.[NEWLINE]이 지역의 후기 문화는 "철파"로 알려진 사회 엘리트들을 위한 대형 "지상 매장실"을 사용했습니다. 티와나쿠 유적지에서도 규모는 작지만 비슷한 구조물이 발견되었습니다. 후기 잉카와 마찬가지로 티와나쿠의 주민들도 죽은 자와 관련하여 비슷한 의식과 의례를 행했을 가능성이 있습니다.[NEWLINE]아카파나 이스트 빌딩에는 조상이 매장된 증거가 있습니다. 아카파나 이스트의 유골은 전시용이라기보다는 적절한 매장을 위한 것으로 보입니다. 해골에는 죽은 후 살을 발라내거나 환생할 때 생긴 상처가 많이 보입니다. 그런 다음 유골은 야외에 방치하지 않고 묶어서 묻었습니다.[NEWLINE][NEWLINE]티와나쿠는 아카파나라는 건물 꼭대기에서 인신 제사를 지냈습니다. 사람들은 죽은 직후 내장이 제거되고 찢겨져 모든 사람이 볼 수 있도록 배치되었습니다. 이 의식은 신에게 바치는 헌신의 한 형태였던 것으로 추측됩니다. 인간 희생의 유형에는 희생자가 조각난 채로 난도질 당하고, 토막 난 채로 비바람과 육식 동물에 노출된 후 쓰레기통에 버려지는 것이 포함되었습니다. 연구에 따르면 희생된 한 남성은 티티카카 분지 원주민이 아니었으며, 희생은 원래 다른 사회에서 온 사람들일 가능성이 높다고 생각할 여지를 남겼습니다.' UNION ALL
-- improvements
	-- marsh
	SELECT 'TXT_KEY_BUILD_MARSH', 							'Create a Marsh'  UNION ALL
	SELECT 'TXT_KEY_BUILD_MARSH_HELP', 						'Terraforms the landscape here into the [COLOR_CITY_GREEN]Marsh[ENDCOLOR], while installing an improvement that''ll stabilize it. Requires an access to [COLOR_CYAN]Brussels[ENDCOLOR]'' ability..'  UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_MARSH', 					'Marsh' UNION ALL
	SELECT 'TXT_KEY_CIV5_IMPROVEMENTS_MARSH', 				'To restore the marshlands on any terrain, just allow water to flow to it naturally. It should even work on snow! If the water doesn''t freeze that is.' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_MARSH_HELP', 				'Only with the Alliance of the Brussel people can a civilization continue a restoration project of marshlands.' UNION ALL
	-- mound
	SELECT 'TXT_KEY_BUILD_MOUND', 							'Construct a Mound'  UNION ALL
	SELECT 'TXT_KEY_BUILD_MOUND_HELP', 						'Cannot be built next to another [COLOR_CITY_BROWN]Mound[ENDCOLOR] or on a [COLOR_GREY]Resource[ENDCOLOR]. +1 [ICON_GOLDEN_AGE] Golden Age Point, if next to a City. +1 [ICON_RESEARCH] Science with [COLOR_CYAN]Architecture[ENDCOLOR] and +1 [ICON_GREAT_GENERAL] Great General Point with [COLOR_CYAN]Military Science[ENDCOLOR]. Adjacent [COLOR_CITY_BROWN]Villages[ENDCOLOR] and [COLOR_CITY_BROWN]Towns[ENDCOLOR] gain +1 [ICON_GOLD] Gold. Requires an access to [COLOR_CYAN]Cahokia[ENDCOLOR]''s ability to be finished.' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_MOUND', 					'Mound' UNION ALL
	SELECT 'TXT_KEY_CIV5_IMPROVEMENTS_MOUND', 				'It is a pyramid built of transported soil and clay.' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_MOUND_HELP', 				'Only with the Alliance of the Cahokia people allow a civilization enjoy such a beauty of a structure.' UNION ALL
	-- sunken courtyard
	SELECT 'TXT_KEY_BUILD_SUNK_COURT', 						'Construct a Sunken Courtyard'  UNION ALL
	SELECT 'TXT_KEY_BUILD_SUNK_COURT_HELP', 				'Cannot be built next to another [COLOR_CITY_BROWN]Sunken Courtyard[ENDCOLOR] or on a [COLOR_GREY]Resource[ENDCOLOR], and can only be built on flat [COLOR_CITY_BLUE]Plains[ENDCOLOR], [COLOR_CITY_BLUE]Tundra[ENDCOLOR] or [COLOR_CITY_BLUE]Desert[ENDCOLOR] tiles. +1 [ICON_RESEARCH] Science, if next to a City, and +1 [ICON_CULTURE] Culture and +1 [ICON_PEACE] Faith, if next to a [COLOR_CITY_BLUE]Mountain[ENDCOLOR]. +1 [ICON_TOURISM] Tourism with [COLOR_CYAN]Archaeology[ENDCOLOR] and +1 [ICON_RESEARCH] Science with [COLOR_CYAN]Radar[ENDCOLOR]. Requires an access to [COLOR_CYAN]Tiwanaku[ENDCOLOR]''s ability to be finished.' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_SUNK_COURT', 				'Sunken Courtyard' UNION ALL
	SELECT 'TXT_KEY_CIV5_IMPROVEMENTS_SUNK_COURT', 			'티와나쿠는 전성기에는 최대 4만 명이 거주했으며 수많은 건물과 플랫폼, 안뜰을 갖춘 의식 중심지를 중심으로 가장 크고 중요한 반지하 궁전, 칼라사사야와 푸투니 콤플렉스(높은 플랫폼과 안뜰의 조합), 아카파나(킴사차타 산맥을 재현한 것으로 추정되는 복잡한 토루 구조), 후기 사원 단지인 푸마풍쿠가 있습니다.[NEWLINE][NEWLINE]가라앉은 궁정 스타일의 건물은 푸카라나 치리파 등 티티카카 호수 주변 지역의 티와나쿠 건국 이전의 고고학 유적지에서 많이 발견되지만, 반지하 궁정은 현재까지 발견된 것 중 가장 큰 규모입니다. 그 규모가 커진 것은 신흥 티와나쿠 정권의 정치력이 커졌음을 보여주는 증거일 가능성이 높습니다. 기원전 300~400년 사이에 완공된 이 건물은 중앙 의식 구역에 건설된 가장 초기의 기념비적인 석조 건물로 추정됩니다.[NEWLINE][NEWLINE]반지하 궁전의 세 벽(북쪽, 동쪽, 서쪽)에 있는 중앙 돌은 동지 및 춘분 일출과 일몰, 중요한 별의 일출과 일몰과 같은 다양한 천문학적 사건의 관측 지점을 표시하고 남반구의 중심인 천상의 남극으로 가는 길을 가리키기도 합니다. 이 돌들은 종교 의식 참가자들이 적절한 천체 행사를 위해 방향을 잡을 수 있도록 도와주는 보조 도구였습니다.' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_SUNK_COURT_HELP', 			'Only with the Alliance of the Tiwanaku people allow a civilization enjoy such a beauty of a structure.' UNION ALL
	-- colossal head
	SELECT 'TXT_KEY_BUILD_BIG_HEAD', 						'Construct a Colossal Head'  UNION ALL
	SELECT 'TXT_KEY_BUILD_BIG_HEAD_HELP', 					'Cannot be build on a [COLOR_GREY]Resource[ENDCOLOR] and can only be built on [COLOR_CITY_BLUE]Plains[ENDCOLOR] or [COLOR_CITY_BLUE]Grassland[ENDCOLOR] tiles with [COLOR_CITY_GREEN]Forest[ENDCOLOR] or [COLOR_CITY_GREEN]Jungle[ENDCOLOR]. +1 [ICON_GOLDEN_AGE] Golden Age Point, if next to a City and +1 [ICON_PRODUCTION] Production if next to a [ICON_RES_STONE] [COLOR_GREY]Stone[ENDCOLOR] or [ICON_RES_MARBLE] [COLOR_GREY]Marble[ENDCOLOR]. +2 [ICON_GOLDEN_AGE] Golden Age Points with [COLOR_CYAN]Machinery[ENDCOLOR], +3 [ICON_RESEARCH] Science with [COLOR_CYAN]Architecture[ENDCOLOR] and +2 [ICON_PRODUCTION] Production with [COLOR_CYAN]Scientific Theory[ENDCOLOR]. +3 [ICON_CULTURE] Culture with [COLOR_MAGENTA]New Deal[ENDCOLOR]. +1 [ICON_GOLDEN_AGE] Golden Age Point, +1 [ICON_GREAT_GENERAL] Great General Point and +1 [ICON_GREAT_ADMIRAL] Great Admiral Point, if there are 2 adjacent [COLOR_CITY_BROWN]Colossal Heads[ENDCOLOR]. Adjacent [COLOR_CITY_BROWN]Farms[ENDCOLOR], [COLOR_CITY_BROWN]Mines[ENDCOLOR] and [COLOR_CITY_BROWN]Quarries[ENDCOLOR] gain +1 [ICON_PRODUCTION] Production. Requires an access to [COLOR_CYAN]La Venta[ENDCOLOR]''s ability to be finished.' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_BIG_HEAD', 					'Colossal Head' UNION ALL
	SELECT 'TXT_KEY_CIV5_IMPROVEMENTS_BIG_HEAD', 			'올멕 문명(기원전 1200년~기원전 400년)의 석기 머리 조각은 고대 세계에서 가장 신비롭고 논쟁의 여지가 많은 유물 중 하나입니다. 현재까지 이 지역에서는 커다란 현무암 바위로 조각한 17개의 기념비적인 석조 인간 머리 조각이 발굴되었습니다. 이 머리들은 적어도 기원전 900년 이전에 만들어진 것으로 올멕 문명의 독특한 특징입니다. 높이가 거의 3미터, 둘레가 4.5미터(9.8피트, 14.7피트), 평균 무게가 약 8톤에 달합니다. 모두 통통한 뺨과 오똑한 코, 살짝 교차된 눈을 가진 성숙한 남성을 묘사하고 있습니다. 하지만 머리 모양이 똑같지 않고 각기 독특한 머리 장식을 하고 있어 특정 인물을 표현한 것으로 추정됩니다.[NEWLINE][NEWLINE]올멕인들은 베라크루스의 시에라 데 로스 턱틀라스 산맥에서 돌들을 가져왔습니다. 제작에 사용 된 매우 큰 석판이 먼 거리에 걸쳐 운송되어 많은 인적 노력과 자원이 필요하다는 점을 고려하면, 기념비는 강력한 개별 올멕 통치자의 초상화를 나타내며 아마도 그들의 죽음을 기념하기 위해 조각되었을 것으로 생각됩니다. 머리는 올멕 중심에서 일렬 또는 단체로 배열되었지만 돌을 현장으로 운반하는 데 사용 된 방법과 물류는 불확실하며 가능한 한 거대한 발사 강 뗏목을 사용하고 육지에서는 통나무 롤러를 사용했을 것으로 추정됩니다.' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_BIG_HEAD_HELP', 			'Only with the Alliance of the La Venta people allow a civilization enjoy such a beauty of a structure.' UNION ALL
	-- monastery
	SELECT 'TXT_KEY_BUILD_MONASTERY', 						'Construct a Monastery'  UNION ALL
	SELECT 'TXT_KEY_BUILD_MONASTERY_HELP', 					'Cannot be built next to another [COLOR_CITY_BROWN]Monastery[ENDCOLOR], next to a City or on a [COLOR_GREY]Resource[ENDCOLOR]. +1 [ICON_PEACE] Faith, if next to a [COLOR_CITY_BLUE]Mountain[ENDCOLOR]. +1 [ICON_PEACE] Faith with [COLOR_CYAN]Scientific Theory[ENDCOLOR] and +1 [ICON_PEACE] Faith with [COLOR_CYAN]Electricity[ENDCOLOR]. Adjacent [COLOR_CITY_BROWN]Villages[ENDCOLOR] and [COLOR_CITY_BROWN]Towns[ENDCOLOR] gain +1 [ICON_PRODUCTION] Production. Requires an access to [COLOR_CYAN]Karyes[ENDCOLOR]'' ability to be finished.' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_MONASTERY', 				'Monastery' UNION ALL
	SELECT 'TXT_KEY_CIV5_IMPROVEMENTS_MONASTERY', 			'수도원은 세속적인 재물을 멀리하고 기도와 헌신의 단순한 삶을 살기 위해 수도원장이 이끄는 수도사들의 폐쇄적이고 때로는 외딴 공동체였습니다. 기독교 수도원은 4세기에 이집트와 시리아에서 처음 발전했으며 5세기에는 서유럽으로 퍼져나갔습니다.[NEWLINE][NEWLINE]베네딕토회 수도회의 창시자이자 유럽 수도원 모델의 창시자인 누시아의 성 베네딕토(480년경-543년경)와 같은 인물은 수도사들이 지켜야 할 규칙을 정립했으며, 이러한 규칙은 오늘날 생존하는 수도원을 포함하여 이후 여러 세기 동안 다양한 수준으로 모방되고 따랐습니다.[NEWLINE][NEWLINE]수도원 회원들은 가난했지만 수도원 자체는 부유하고 강력한 기관이었으며, 기부받은 토지와 재산으로 부를 모았습니다. 수도원은 또한 젊은이들을 교육하는 중요한 배움의 중심지였으며, 오늘날 역사가들에게 가장 중요한 것은 중세 세계뿐만 아니라 고전 고대에 대한 우리의 지식을 크게 향상시킨 책을 힘들게 제작하고 고대 텍스트를 보존했다는 것입니다.' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_MONASTERY_HELP', 			'Only with the Alliance of the Karyes people allow a civilization enjoy such a beauty of a structure.' UNION ALL
	-- totem pole
	SELECT 'TXT_KEY_BUILD_TOTEM_POLE', 						'Construct a Totem Pole'  UNION ALL
	SELECT 'TXT_KEY_BUILD_TOTEM_POLE_HELP', 				'Cannot be built on a [COLOR_GREY]Resource[ENDCOLOR]. +1 [ICON_PRODUCTION] Production with [COLOR_CYAN]Compass[ENDCOLOR] and +1 [ICON_GOLD] Gold with [COLOR_CYAN]Navigation[ENDCOLOR]. +2 [ICON_PRODUCTION] Production, if there are 2 adjacent [COLOR_CITY_BROWN]Totem Poles[ENDCOLOR]. Adjacent [COLOR_CITY_BLUE]Coast[ENDCOLOR] tiles gain +1 [ICON_CULTURE] Culture. Requires an access to [COLOR_CYAN]SGaang Gwaay[ENDCOLOR]''s ability to be finished.' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_TOTEM_POLE', 				'Totem Pole' UNION ALL
	SELECT 'TXT_KEY_CIV5_IMPROVEMENTS_TOTEM_POLE', 			'토템 폴, 또는 하이다어로 갸아앙은 태평양 북서부에서 볼 수 있는 예술 및 문체 표현의 한 유형입니다. 토템 폴은 신화 속 인물과 사건을 상징하거나 최근의 조상 및 현존하는 사람들의 경험을 전달할 수 있습니다. 이러한 캐릭터 중 일부는 자연 속 사물을 문체적으로 표현한 것처럼 보이기도 하고, 더 사실적으로 조각된 캐릭터도 있습니다. 장대 조각에는 동물, 물고기, 식물, 곤충, 인간이 포함되거나 천둥새와 같은 초자연적인 존재를 나타낼 수 있습니다.[NEWLINE][NEWLINE]일반적으로 토템 폴이라고 불리는 직립형 기둥 조각에는 집 정면 기둥, 집 기둥, 장례식장 기둥, 기념 기둥, 환영 기둥, 수치/조롱 기둥 등 6가지 기본 유형이 있습니다. 각 문화권에는 일반적으로 기둥에 표시되는 전통적인 디자인에 관한 복잡한 규칙과 관습이 있습니다.[NEWLINE][NEWLINE]디자인은 일반적으로 특정 씨족 또는 전통 조각가 집단의 재산으로 간주되며, 이러한 디자인의 소유권은 조각을 의뢰한 사람에게 양도할 수 없습니다.' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_TOTEM_POLE_HELP', 			'Only with the Alliance of the SGaang Gwaay people allow a civilization enjoy such a beauty of a structure.' UNION ALL
	-- chum
	SELECT 'TXT_KEY_BUILD_CHUM', 							'Construct a Chum'  UNION ALL
	SELECT 'TXT_KEY_BUILD_CHUM_HELP', 						'Cannot be built next to another [COLOR_CITY_BROWN]Chum[ENDCOLOR] or on a [COLOR_GREY]Resource[ENDCOLOR]. +1 [ICON_FOOD] Food, if next to a [COLOR_GREY]Bonus Resource[ENDCOLOR] and +1 [ICON_PRODUCTION] Production, if next to a [COLOR_CITY_BROWN]Camp[ENDCOLOR] or [COLOR_CITY_BROWN]Pasture[ENDCOLOR]. +1 [ICON_FOOD] Food with [COLOR_CYAN]Education[ENDCOLOR], +1 [ICON_FOOD] Food with [COLOR_CYAN]Fertilizer[ENDCOLOR] and +1 [ICON_PRODUCTION] Faith with [COLOR_CYAN]Refrigeration[ENDCOLOR]. Adjacent [COLOR_CITY_BROWN]Camps[ENDCOLOR] and [COLOR_CITY_BROWN]Pastures[ENDCOLOR] gain +1 [ICON_GOLD] Gold. Requires an access to [COLOR_CYAN]Nyar''yana Marq[ENDCOLOR]''s ability to be finished.' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_CHUM', 						'Chum' UNION ALL
	SELECT 'TXT_KEY_CIV5_IMPROVEMENTS_CHUM', 				'첨은 러시아 시베리아 북서부의 유목민 우랄족(네네츠, 응가나산, 에네츠, 칸티, 만시, 코미)의 순록 목동들이 사용하는 임시 거주지입니다. 러시아, 몽골, 중국의 퉁구스 민족, 부족인 이븐크족도 첨을 사용합니다. 또한 투바 공화국의 최남단 토차 지역과 몽골 북부의 국경을 넘는 친척들의 순록 목동들도 사용합니다. 아메리카 원주민의 티피와 비슷한 디자인이지만 일부 버전은 수직이 덜합니다. 사미 라브부와 건축 방식이 매우 밀접하게 관련되어 있지만 크기가 다소 더 큽니다. 일부 첨은 지름이 최대 10미터에 달하기도 합니다.[NEWLINE][NEWLINE]전통적인 첨은 순록 가죽을 함께 꿰매고 원으로 구성된 나무 기둥을 감싸는 순록 가죽으로 구성됩니다. 가운데에는 난방과 모기를 쫓는 데 사용되는 벽난로가 있습니다. 연기는 첨의 상단에 있는 구멍을 통해 빠져나갑니다. 캔버스와 나무 기둥은 보통 꽤 무겁지만 순록이 운반할 수 있습니다. 첨은 오늘날에도 러시아의 야말 네네츠, 칸티, 토차 타이반족의 연중 쉼터로 사용되고 있습니다.' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_CHUM_HELP', 				'Only with the Alliance of the Nyar''ana Marq people allow a civilization enjoy such a beauty of a structure.' UNION ALL
	-- dogo canario
	SELECT 'TXT_KEY_BUILD_DOGO_CANARIO', 					'Place a [ICON_RES_DOGO_CANARIO] Dogo Canario'  UNION ALL
	SELECT 'TXT_KEY_BUILD_DOGO_CANARIO_HELP', 				'Helps in breeding the [ICON_RES_DOGO_CANARIO] Dogo Canarios, that can be improved with a [COLOR_CITY_BROWN]Camp[ENDCOLOR]. Adjacent [COLOR_CITY_BROWN]Pastures[ENDCOLOR] gain +1 [ICON_FOOD] Food and +1 [ICON_GOLD] Gold.' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_DOGO_CANARIO', 				'Dogo Canario' UNION ALL
	SELECT 'TXT_KEY_CIV5_IMPROVEMENTS_DOGO_CANARIO', 		'도고 카나리오는 카나리아 제도에 서식하는 개 품종으로 머리가 넓고 근육질의 몸을 가진 희귀견입니다. 도고 카나리오는 신화, 장례 풍습, 심지어는 구안치의 식단에서도 중요한 역할을 담당했습니다. 일부는 주인과 함께 미라로 만들어지기도 했습니다.' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_DOGO_CANARIO_HELP', 		'Only with the Alliance of the Adeje people allow a civilization enjoy such a beauty of a structure.' UNION ALL
-- resources
SELECT 'TXT_KEY_RESOURCE_DOGO_CANARIO',					'Dogo Canario' UNION ALL
SELECT 'TXT_KEY_RESOURCE_DOGO_CANARIO_TEXT',			'Dogo Canario are a breed of dog native to the canary islands, a rare dog with a broad head and muscular body. They played a role in the myth, funeral customs and even diet of the guanches. Some were even mummified along with their owners.' UNION ALL
SELECT 'TXT_KEY_RESOURCE_DOGO_CANARIO_MONOPOLY',		'Requires an access to [COLOR_CYAN]Adeje[ENDCOLOR]''s ability to be finished.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] +5% [ICON_PRODUCTION] Production and +5% [ICON_GOLD] Gold in all owned Cities.' UNION ALL
-- cs traits/buildings/policies
SELECT 'TXT_KEY_MARITIME_BONUS', 						'[COLOR:90:205:40:255]Builders (Maritime):[ENDCOLOR][NEWLINE][ICON_BULLET]has a [ICON_WORKER] Manufactory and an additional Bonus Resource nearby'  UNION ALL
SELECT 'TXT_KEY_MARITIME_FRIENDLY_BONUS', 					'[COLOR:200:240:140:255]Harvesters (Maritime Friendly):[ENDCOLOR][NEWLINE][ICON_BULLET]1% Chance for spawning a Worker or a Fishing Boat inside Friends'' Territory (their Capital must be on a Coast to get a Fishing Boat)'  UNION ALL
SELECT 'TXT_KEY_MARITIME_NEUTRAL_BONUS', 					'[COLOR:110:160:70:255]Secured Warehouse (Maritime Neutral):[ENDCOLOR][NEWLINE][ICON_BULLET]nothing'  UNION ALL
SELECT 'TXT_KEY_MARITIME_HOSTILE_BONUS', 					'[COLOR:60:125:40:255]Selfish Gatherers (Maritime Hostile):[ENDCOLOR][NEWLINE][ICON_BULLET]nothing'  UNION ALL
SELECT 'TXT_KEY_MERCANTILE_BONUS', 						'[COLOR:240:215:65:255]Trade Center (Mercantile):[ENDCOLOR][NEWLINE][ICON_BULLET]has a [ICON_CITY_STATE] Town and an additional Luxury Resource nearby'  UNION ALL
SELECT 'TXT_KEY_MERCANTILE_FRIENDLY_BONUS', 				'[COLOR:240:240:165:255]Golden City (Mercantile Friendly):[ENDCOLOR][NEWLINE][ICON_BULLET]1% Chance for spawning a [ICON_CARAVAN] Caravan or a [ICON_CARGO_SHIP] Cargo Ship inside Friends'' Territory (their Capital must be on a Coast to get a [ICON_CARGO_SHIP] Cargo Ship)'  UNION ALL
SELECT 'TXT_KEY_MERCANTILE_NEUTRAL_BONUS', 					'[COLOR:210:210:70:255]Shadow Council (Mercantile Neutral):[ENDCOLOR][NEWLINE][ICON_BULLET]nothing'  UNION ALL
SELECT 'TXT_KEY_MERCANTILE_HOSTILE_BONUS', 					'[COLOR:130:130:20:255]Free City (Mercantile Hostile):[ENDCOLOR][NEWLINE][ICON_BULLET]nothing'  UNION ALL
SELECT 'TXT_KEY_MILITARISTIC_BONUS', 					'[COLOR:245:40:40:255]Fortress (Militaristic):[ENDCOLOR][NEWLINE][ICON_BULLET]has a [ICON_WAR] Fort and an additional Strategic Resource nearby[NEWLINE][ICON_BULLET]can train its Unique Unit[NEWLINE][ICON_BULLET]Major Player can upgrade his units inside their territory if Allied'  UNION ALL
SELECT 'TXT_KEY_MILITARISTIC_FRIENDLY_BONUS', 				'[COLOR:255:180:180:255]Mercenary Hub (Militaristic Friendly):[ENDCOLOR][NEWLINE][ICON_BULLET]+1% Rate of Unit Gifts to its Friends'  UNION ALL
SELECT 'TXT_KEY_MILITARISTIC_NEUTRAL_BONUS', 				'[COLOR:245:90:90:255]Sellsword Army (Militaristic Neutral):[ENDCOLOR][NEWLINE][ICON_BULLET]nothing'  UNION ALL
SELECT 'TXT_KEY_MILITARISTIC_HOSTILE_BONUS', 				'[COLOR:170:10:10:255]Hermit Dragon (Militaristic Hostile):[ENDCOLOR][NEWLINE][ICON_BULLET]nothing'  UNION ALL
SELECT 'TXT_KEY_CULTURED_BONUS', 						'[COLOR:210:65:200:255]Center of Learning (Cultured):[ENDCOLOR][NEWLINE][ICON_BULLET]has an [ICON_RESEARCH] Academy and an [ICON_RES_ARTIFACTS] Archaeological Site nearby'  UNION ALL
SELECT 'TXT_KEY_CULTURED_FRIENDLY_BONUS', 					'[COLOR:240:180:235:255]Open University (Cultured Friendly):[ENDCOLOR][NEWLINE][ICON_BULLET]1% Chance for spawning an [ICON_VP_ARTIFACT] Archaeologist inside Friends'' Territory (after researching Archaeology)'  UNION ALL
SELECT 'TXT_KEY_CULTURED_NEUTRAL_BONUS', 					'[COLOR:210:90:195:255]Patronage (Cultured Neutral):[ENDCOLOR][NEWLINE][ICON_BULLET]nothing'  UNION ALL
SELECT 'TXT_KEY_CULTURED_HOSTILE_BONUS', 					'[COLOR:130:30:115:255]Recluse Court (Cultured Hostile):[ENDCOLOR][NEWLINE][ICON_BULLET]nothing'  UNION ALL
SELECT 'TXT_KEY_RELIGIOUS_BONUS', 						'[COLOR:25:110:250:255]Center of Faith (Religious):[ENDCOLOR][NEWLINE][ICON_BULLET]has a Holy Site nearby'  UNION ALL
SELECT 'TXT_KEY_RELIGIOUS_FRIENDLY_BONUS', 					'[COLOR:160:220:250:255]Open Mind (Religious Friendly):[ENDCOLOR][NEWLINE][ICON_BULLET]1% Chance for spawning a [ICON_MISSIONARY] Missionary inside Friends'' Territory[NEWLINE][ICON_BULLET]+10% [ICON_PEACE] Religious Pressure[NEWLINE][ICON_BULLET]-25% [ICON_PEACE] Conversion Resistance'  UNION ALL
SELECT 'TXT_KEY_RELIGIOUS_NEUTRAL_BONUS', 					'[COLOR:105:155:230:255]Medicant Orders (Religious Neutral):[ENDCOLOR][NEWLINE][ICON_BULLET]+25% [ICON_PEACE] Religious Pressure'  UNION ALL
SELECT 'TXT_KEY_RELIGIOUS_HOSTILE_BONUS', 					'[COLOR:25:110:170:255]One Truth (Religious Hostile):[ENDCOLOR][NEWLINE][ICON_BULLET]+40% [ICON_PEACE] Religious Pressure[NEWLINE][ICON_BULLET]-25% [ICON_PEACE] Conversion Resistance'  UNION ALL
	SELECT 'TXT_KEY_BUILDING_CS_STRENGTH_FRIENDLY', 		'Small HP boost' UNION ALL
	SELECT 'TXT_KEY_BUILDING_CS_STRENGTH_FRIENDLY_HELP', 		'+1 City HP.' UNION ALL
	SELECT 'TXT_KEY_BUILDING_CS_STRENGTH_NEUTRAL', 			'Medium HP boost' UNION ALL
	SELECT 'TXT_KEY_BUILDING_CS_STRENGTH_NEUTRAL_HELP', 		'+2 City HP.' UNION ALL
	SELECT 'TXT_KEY_BUILDING_CS_STRENGTH_HOSTILE', 			'Huge HP boost' UNION ALL
	SELECT 'TXT_KEY_BUILDING_CS_STRENGTH_HOSTILE_HELP', 		'+3 City HP.' UNION ALL
	SELECT 'TXT_KEY_BUILDING_CS_RELIGION_FRIENDLY', 		'Small pressure boost' UNION ALL
	SELECT 'TXT_KEY_BUILDING_CS_RELIGION_FRIENDLY_HELP', 		'+10% [ICON_PEACE] Religious Pressure and -25% [ICON_PEACE] Convertion Resistance.' UNION ALL
	SELECT 'TXT_KEY_BUILDING_CS_RELIGION_NEUTRAL', 			'Medium pressure boost' UNION ALL
	SELECT 'TXT_KEY_BUILDING_CS_RELIGION_NEUTRAL_HELP', 		'+25% [ICON_PEACE] Religious Pressure.' UNION ALL
	SELECT 'TXT_KEY_BUILDING_CS_RELIGION_HOSTILE', 			'Huge pressure boost' UNION ALL
	SELECT 'TXT_KEY_BUILDING_CS_RELIGION_HOSTILE_HELP', 		'+40% [ICON_PEACE] Religious Pressure and +25% [ICON_PEACE] Convertion Resistance.' UNION ALL
		SELECT 'TXT_KEY_POLICY_CS_MARITIME', 					'Builders' UNION ALL
		SELECT 'TXT_KEY_POLICY_CS_MERCANTILE', 					'Trade Center' UNION ALL
		SELECT 'TXT_KEY_POLICY_CS_MILITARISTIC', 				'Fortress' UNION ALL
		SELECT 'TXT_KEY_POLICY_CS_CULTURED', 					'Center of Learning' UNION ALL
		SELECT 'TXT_KEY_POLICY_CS_RELIGIOUS', 					'Center of Faith' UNION ALL
-- regular buildings
SELECT 'TXT_KEY_BUILDING_ARMAGH1', 						'Naomh Gaelach' UNION ALL
SELECT 'TXT_KEY_BUILDING_ARMAGH1_HELP', 				'Requires an access to [COLOR_CYAN]Armagh[ENDCOLOR]''s ability. Grants [ICON_CULTURE] Culture bonus based on number of Active Events (lost without the Alliance). Reduces [ICON_HAPPINESS_3] Boredom.' UNION ALL
SELECT 'TXT_KEY_BUILDING_ARMAGH2', 						'Naomh Breandán' UNION ALL
SELECT 'TXT_KEY_BUILDING_ARMAGH2_HELP', 				'Requires an access to [COLOR_CYAN]Armagh[ENDCOLOR]''s ability. Grants [ICON_RESEARCH] Science bonus based on number of Active Events (lost without the Alliance). Reduces [ICON_HAPPINESS_3] Illiteracy.' UNION ALL
SELECT 'TXT_KEY_BUILDING_ARMAGH3', 						'Naomh Pádraig' UNION ALL
SELECT 'TXT_KEY_BUILDING_ARMAGH3_HELP', 				'Requires an access to [COLOR_CYAN]Armagh[ENDCOLOR]''s ability. Grants [ICON_GOLD] Gold bonus based on number of Active Events (lost without the Alliance). Reduces [ICON_HAPPINESS_3] Poverty.' UNION ALL
SELECT 'TXT_KEY_BUILDING_ARMAGH4', 						'Naomh Bríd' UNION ALL
SELECT 'TXT_KEY_BUILDING_ARMAGH4_HELP', 				'Requires an access to [COLOR_CYAN]Armagh[ENDCOLOR]''s ability. Grants [ICON_FOOD] Food and [ICON_PRODUCTION] Production bonus based on number of Active Events (lost without the Alliance). Reduces [ICON_HAPPINESS_3] Distress.' UNION ALL
SELECT 'TXT_KEY_BUILDING_JERUSALEM', 					'Holy City' UNION ALL
SELECT 'TXT_KEY_BUILDING_JERUSALEM_HELP', 				'Built after adopting Majority Religion of its Ally.[NEWLINE][NEWLINE]This city becomes a Holy City. Too many have made the pilgrimage to this city for their religion.[NEWLINE][NEWLINE]+100% [ICON_PEACE] Religious Pressure.' UNION ALL
SELECT 'TXT_KEY_BUILDING_KIEV', 						'Bylina' UNION ALL
SELECT 'TXT_KEY_BUILDING_KIEV_HELP', 					'Requires an access to [COLOR_CYAN]Kyiv[ENDCOLOR]''s ability. +2 [ICON_GREAT_MUSICIAN]; +1 Musician Slot.' UNION ALL
SELECT 'TXT_KEY_BUILDING_MILAN', 						'Visconti Emissary' UNION ALL
SELECT 'TXT_KEY_BUILDING_MILAN_HELP', 					'Requires an access to [COLOR_CYAN]Milan[ENDCOLOR]''s ability. +2 [ICON_GREAT_ARTIST]; +1 Artist Slot.' UNION ALL
SELECT 'TXT_KEY_BUILDING_VILNIUS', 						'The Gate of Dawn' UNION ALL
SELECT 'TXT_KEY_BUILDING_VILNIUS_HELP', 				'Requires an access to [COLOR_CYAN]Vilnius[ENDCOLOR]''s ability. +2 [ICON_GREAT_WRITER]; +1 Writer Slot.' UNION ALL
SELECT 'TXT_KEY_BUILDING_RISHIKESH', 					'Ashram' UNION ALL
SELECT 'TXT_KEY_BUILDING_RISHIKESH_HELP', 				'Requires an access to [COLOR_CYAN]Rishikesh[ENDCOLOR]''s ability. +1 [ICON_PEACE] Faith and +1 [ICON_TOURISM] for every Mountain tile within their workable radius. -1 [ICON_HAPPINESS_3] Unhappiness from Religious Unrest, Urbanization and Boredom.' UNION ALL
SELECT 'TXT_KEY_BUILDING_VALLETTA', 					'The Grand Harbor' UNION ALL
SELECT 'TXT_KEY_BUILDING_VALLETTA_HELP', 				'City must have a Fishing Boat resource improved and Player must have an access to [COLOR_CYAN]Valletta[ENDCOLOR]''s ability. +2 [ICON_FOOD] Food and +2 [ICON_RESEARCH] Science (lost without the Alliance). +15 XP to all newly trained Naval Units. +25 City HP.' UNION ALL
-- world wonders
SELECT 'TXT_KEY_BUILDING_LHASA', 						'Potala Palace' UNION ALL
SELECT 'TXT_KEY_BUILDING_LHASA_HELP', 					'+1 and +10% [ICON_CULTURE] Culture and [ICON_FOOD] Food. Grants 1 additional delegate in the World Congress. Requires an access to [COLOR_CYAN]Lhasa[ENDCOLOR]''s ability and an active session of the [COLOR_POSITIVE_TEXT]World Congress[ENDCOLOR]. Yield modifiers halved without the Alliance. Can never be destroyed.' UNION ALL
SELECT 'TXT_KEY_BUILDING_LHASA_QUOTE', 					'[NEWLINE]"The first time I stepped onto the rooftop of the Potala Palace, I felt, as never before or since, as if I were stepping onto the rooftop of my being; onto some dimension of consciousness that I''d never visited before."[NEWLINE] – Pico Iyer[NEWLINE]';
--==========================================================================================================================
-- COMPATIBLITY
--==========================================================================================================================
-- POTALA PALACE - More Wonders
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Potala Palace[ENDCOLOR] depends strongly on alliance with [COLOR_CYAN]Lhasa[ENDCOLOR] (+10%[ICON_FOOD]; +10%[ICON_CULTURE]; halved when not allied with [COLOR_CYAN]Lhasa[ENDCOLOR]). Ties bonds between these two countries ([COLOR_YIELD_GOLD]Sphere of Influence[ENDCOLOR] over [COLOR_CYAN]Lhasa[ENDCOLOR]) using special diplomatic techniques (+1[ICON_DIPLOMAT] League Vote).'
WHERE Tag = 'TXT_KEY_BUILDING_LHASA_HELP' AND EXISTS (SELECT * FROM Community WHERE Type='MW-SETTING-HELP' AND Value= 1) AND EXISTS (SELECT * FROM Community WHERE Type='UCS-MW' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'Requires and alliance with [COLOR_POSITIVE_TEXT]Lhasa[ENDCOLOR] and an active session of the [COLOR_POSITIVE_TEXT]World Congress[ENDCOLOR]. ', '') WHERE Tag ='TXT_KEY_BUILDING_LHASA_HELP' AND EXISTS (SELECT * FROM Community WHERE Type='MW-SETTING-HELP' AND Value= 0) AND EXISTS (SELECT * FROM Community WHERE Type='UCS-MW' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,										Text) 
SELECT		'TXT_KEY_BUILDING_LHASA_HELP_CUT',			Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_BUILDING_LHASA_HELP' AND EXISTS (SELECT * FROM Community WHERE Type='UCS-MW' AND Value= 1);
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_CYAN]Lhasa CS Ally[ENDCOLOR] and an [COLOR_CYAN]active session of WC[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_LHASA_HELP' AND EXISTS (SELECT * FROM Community WHERE Type='UCS-MW' AND Value= 1);
--============================================--
-- VP FIXES (copy from MW)
--============================================--
-- additional combat classes for promotions
INSERT OR REPLACE INTO Language_en_US 
			(Tag,										Text) 
VALUES		('TXT_KEY_UNITCOMBAT_SPECIAL_PEOPLE',		'Great People'),
			('TXT_KEY_UNITCOMBAT_SPACESHIP_PART',		'Space Parts'),
			('TXT_KEY_UNITCOMBAT_MISSILE',				'Missiles'),
			('TXT_KEY_UNITCOMBAT_ARCHAEOLOGIST',		'Archaeologists');