--==========================================================================================================================
-- 게임 텍스트
--==========================================================================================================================
UPDATE Language_ko_KR SET Text = REPLACE(Text, '[ICON_RES_HORSE] 말', '[ICON_RES_HORSE] 말, [ICON_RES_CAMEL] 낙타')
WHERE Tag ='TXT_KEY_CORPORATION_RESOURCE_BONUS_LANDSEA_EXTRACTORS';

UPDATE Language_ko_KR SET Text = REPLACE(Text, '[ICON_RES_MARBLE] 대리석', '[ICON_RES_QUARTZ] 석영, [ICON_RES_MARBLE] 대리석')
WHERE Tag ='TXT_KEY_CORPORATION_RESOURCE_BONUS_FIRAXITE_MATERIALS';

UPDATE Language_ko_KR SET Text = REPLACE(Text, '[ICON_RES_SILK] 비단', '[ICON_RES_ALPACA] 알파카, [ICON_RES_SILK] 비단')
WHERE Tag ='TXT_KEY_CORPORATION_RESOURCE_BONUS_GIORGIO_ARMEIER';

UPDATE Language_ko_KR
SET Text = Text || '[NEWLINE][ICON_RES_ALPACA] 알파카: [ICON_GOLD] 골드 +3'
WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_MINT' AND ((Type = 'BUILDING_MINT' OR Type IN(SELECT BuildingType FROM Civilization_BuildingClassOverrides))));

UPDATE Language_ko_KR
SET Text = Text || '[NEWLINE][NEWLINE][ICON_RES_QUARTZ] 석영: [ICON_RESEARCH] 과학 +1'
WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WORKSHOP' AND ((Type = 'BUILDING_WORKSHOP' OR Type IN(SELECT BuildingType FROM Civilization_BuildingClassOverrides))));

UPDATE Language_ko_KR
SET Text = Text || '[NEWLINE][NEWLINE][ICON_RES_QUARTZ] 석영: [ICON_RESEARCH] 과학 +3'
WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_LABORATORY' AND ((Type = 'BUILDING_LABORATORY' OR Type IN(SELECT BuildingType FROM Civilization_BuildingClassOverrides))));

UPDATE Language_ko_KR
SET Text = Text || '[NEWLINE][ICON_RES_CAMEL] 낙타: [ICON_PRODUCTION] 생산력 +1, [ICON_GOLD] 골드 +1'
WHERE Tag IN(SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_CARAVANSARY' AND ((Type = 'BUILDING_CARAVANSARY' OR Type IN(SELECT BuildingType FROM Civilization_BuildingClassOverrides))));

INSERT OR REPLACE INTO Language_ko_KR 
(Tag, Text) VALUES
('TXT_KEY_RESOURCE_ALPACA', '알파카'),
('TXT_KEY_RESOURCE_ALPACA_TEXT', '알파카는 남아메리카 안데스 산맥이 원산지인 가축으로, 특히 페루, 볼리비아, 칠레와 같은 나라에서 많이 발견됩니다. 이들은 라마와 가까운 친척이며, 다양한 자연색을 띠는 부드럽고 고급스러운 털로 인해 주로 가치가 있습니다. 6,000년 전 안데스 산맥의 원주민에 의해 길들여진 알파카는 무리 지어 사는 사회적 동물이며, 온화하고 호기심 많은 성격으로 유명합니다. 그들은 주로 풀을 뜯어먹으며, 혹독한 산악 환경에서도 잘 살 수 있게 해주는 독특한 소화 시스템을 가지고 있습니다. 알파카는 털을 얻는 것 외에도 애완동물로 키우는 경우가 많고, 매력적인 성격 때문에 농장이나 교육 현장에서 인기가 많습니다.'),
('TXT_KEY_RESOURCE_CAMEL', '낙타'),
('TXT_KEY_RESOURCE_CAMEL_TEXT', '낙타는 가축으로서 식량(낙타 우유와 낙타 고기)과 직물(낙타 털로 만든 섬유와 펠트)을 제공하는 일종의 길들여진 발굽동물로 이는 양과 비슷합니다. 그러나 낙타는 말과 마찬가지로 승객과 화물을 운반할 수 있는 일하는 동물이기도 합니다. 실제로 기원전 500년에서 100년 사이에 박트리아 낙타가 군사적으로 사용되기 시작했는데, 이는 제1차 세계 대전까지 이어졌습니다. 그러나 말과는 달리 극도로 건조한 서식지에서 진화했기 때문에 사막 지형에서도 효과적으로 일할 수 있습니다. 널리 알려진 믿음과는 달리 낙타는 등의 혹(지방 조직의 저장소)에 물을 저장하지 않고 대신 눈에 띄지 않는 일련의 적응을 통해 물을 유지합니다. 예를 들어, 이들은 높은 삼투압 조건(탈수와 빠른 재수화 모두)에서 성능이 크게 향상된 타원형 모양의 적혈구를 가지고 있습니다. 낙타는 3분 만에 200리터의 물을 마실 수 있습니다!'),
('TXT_KEY_RESOURCE_QUARTZ', '석영'),
('TXT_KEY_RESOURCE_QUARTZ_TEXT', '로마의 자연주의자 대 플리니우스는 석영이 물의 얼음이며 오랜 시간이 지나도 영구적으로 얼어붙는다고 믿었습니다. 우리는 이제 그것이 지구 대륙 지각에서 두 번째로 풍부한 광물인 이산화 규소라는 것을 알고 있습니다. 고대에는 아일랜드의 뉴그레인지와 같은 매장지에서 흔히 발견되었으며, 보석과 작은 조각품의 재료로도 사용되었습니다. 고고학자들은 장석이 흔히 쓰이는 장석보다 단단하기 때문에 석기 도구에도 사용됐다는 사실을 발견했습니다. 가장 흔한 것은 무색이고 투명한데, 서로 다른 미세한 서식지와 불순물로 인해 유색(예: 자수정)과 불투명(예: 오닉스) 품종이 모두 생겨납니다. 그러나 과학적 용도에 적합한 것은 가장 순수한 석영뿐이며, 1930년대에 이르러 전자 산업은 브라질에서만 공급되는 등급의 실리콘에 의존하게 되었습니다. 이러한 희귀성으로 인해 석영을 재배하는 대체 방법에 대한 연구가 진행되었고, 오늘날에는 합성 제조 기술을 통해 나노 크기에서도 정밀하게 구조화된 결정을 생성할 수 있습니다. 필수적인 자원인 석영 기반 구성 요소는 마이크로 저울부터 태양 전지까지 모든 종류의 기술적 응용 분야에 활용됩니다.');