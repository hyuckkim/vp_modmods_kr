-----------------------
 -- 번역표현 변경
------------------------	
 
-- TERICIO ->PIKEMAN
UPDATE Language_ko_KR
SET Text = '창총보병'
WHERE Tag = 'TXT_KEY_UNIT_SPANISH_TERCIO';	

UPDATE Language_ko_KR
SET Text = '창총보병은 르네상스 시대의 기본 근접 공격 유닛으로, 중세 시대의 무시무시한 기사단에 쉽게 맞설 수 있습니다.'
WHERE Tag = 'TXT_KEY_CIV5_SPAIN_TERCIO_HELP';	

UPDATE Language_ko_KR
SET Text = '철을 필요로 하지 않았던 이전 방어 유닛들처럼, 창총보병은 최전선에서 든든한 기반을 제공합니다. 또한 [COLOR_POSITIVE_TEXT]파이크 전술[ENDCOLOR]을 사용할 수 있어 적에게 공격을 개시할 때 공격적으로 활용할 수 있습니다. 따라서 기마 유닛이 덜 위협적이기는 하지만, 단 하나의 실패 지점도 없는 효과적인 군대 구성을 설계하는 데 여전히 주의를 기울여야 합니다.'
WHERE Tag = 'TXT_KEY_CIV5_SPAIN_TERCIO_STRATEGY';	

UPDATE Language_ko_KR
SET Text = '창총보병은 15세기 후반과 16세기 초반에 처음 등장한 전술적 대형을 말하며, 17세기 후반에 총검병이 개발될 때까지 사용되었습니다. 이러한 유형의 부대는 파이크로 무장한 군인과 화승총 그리고/또는 머스킷총으로 무장한 군인을 결합했습니다. 칼, 도끼, 석궁과 같은 다른 무기도 가끔 사용되었습니다. 이 대형은 원래 신성 로마 제국 보병대(란츠크네히트)와 스페인 보병대(테르시오)에 의해 개발되었습니다.[NEWLINE][NEWLINE]이 전술은 종종 4m가 넘는 강화된 장창인 파이크를 이용한 통제에 달려 있습니다. 방어적으로는 뛰어나지만, 다루기 힘들어서 기동성이 떨어지기 쉬웠고, 오직 잘 훈련된 부대만이 효과적인 공격 방식으로 사용할 수 있었습니다. 이러한 약점을 극복하기 위해 장창병은 매우 원시적인 (매치락) 화기인 화승총과 짝을 이루었습니다. 창총진은 매우 성공적이어서 당시의 많은 전투는 움직일 수 없는 많은 수의 병사들이 서로를 밀치고 치명적인 압도로 이어지는 "파이크 밀기(Push of Pike)"로 알려졌으며, 장창병의 무장을 해제하기 위해 특별히 거대한 대검이 제작되었습니다.'
WHERE Tag = 'TXT_KEY_CIV5_SPAIN_TERCIO_TEXT';	

UPDATE Language_ko_KR
SET Text = '전차궁수'
WHERE Tag = 'TXT_KEY_UNIT_CHARIOT_ARCHER';	

UPDATE Language_ko_KR
SET Text = '전차궁수는 트인 지형에서 치명적인 성능을 가진 재빠른 원거리 유닛입니다. 전차궁수는 궁병보다는 약하지만 두배의 거리를 이동할 수 있습니다. 그러나 전차궁수는(도로가 깔려있지 않은 한)숲이나 정글, 언덕 타일에 들어갈 때 이동력에 제한을 받습니다. 방어시에 기마유닛이므로 창병에게 약합니다.'
WHERE Tag = 'TXT_KEY_UNIT_CHARIOT_ARCHER_STRATEGY';	

UPDATE Language_ko_KR
SET Text = '기마궁수'
WHERE Tag = 'TXT_KEY_UNIT_MONGOL_KESHIK';		

UPDATE Language_ko_KR
SET Text = '기마궁수는 빠른 범위 유닛으로, 개방된 지역에서 강합니다. 이동력 패널티 없이 험지에 들어갈 수 있으며 근접유닛의 공격을 높은 확률로 회피할 수 있습니다. 기병 유닛이므로 기마궁수는 창병에 취약합니다.'
WHERE Tag = 'TXT_KEY_CIV5_MONGOLIA_KESHIK_STRATEGY';		

UPDATE Language_ko_KR
SET Text = '등자가 발명되기 이전, 말을 타고 싸우는 것은 사실상 불가능했습니다. 탑승자를 받쳐줄 방법이 없었고, 그를 말에서 내리게 하려면 살살 눌러야 하는데, 이는 끔찍한 결과를 가져왔습니다. 말은 전차를 끄는 목적으로 전투에 처음 사용되었습니다. 전차궁수 구성원은 보통 한두 마리의 말과 운전사, 그리고 궁병으로 구성되었습니다. 전차궁수의 기동력이 보병들에게 특히 위협적이었는데, 그들은 범위 안으로 빠르게 달려온 후 일제히 사격을 퍼붓고, 보병이 접근해서 공격하기 전에 빠르게 빠져나갔습니다. 전차궁수의 가장 큰 단점은 통행하기 어려운 지형이 있었다는 것입니다. 평탄한 지형에서 그들은 전장의 왕이었으나, 언덕이나 숲에서는 매우 큰 패널티를 가져야만 했었습니다.'
WHERE Tag = 'TXT_KEY_UNIT_CHARIOT_ARCHER_TEXT';	

UPDATE Language_ko_KR 
SET Text = '경궁기병' 
WHERE Tag ='TXT_KEY_DESC_MOUNTED_BOWMAN';

UPDATE Language_ko_KR
SET Text = '경궁기병은 빠른 이동과 원거리 공격이 가능한 중세 시대의 유닛입니다. 적을 괴롭히고 당신의 전쟁 노력을 지지하기 위해 그것을 사용하되, 그들이 혼자 잡히는 것을 조심하십시오.'
WHERE Tag = 'TXT_KEY_CIV5_MOUNTED_BOWMAN_STRATEGY';	

UPDATE Language_ko_KR
SET Text = '경궁기병은 보통 경량화된 갑옷과 빠른 움직임이 특징인 마병 부대를 가리킵니다. 가장 유명한 경궁기병은 아마도 중세 몽골의 경궁기병일 것입니다. 그들은 높은 이동성과 함께 강력한 활을 통해 적에게 빠르고 치명적인 타격을 가할 수 있었습니다.몽골 기병은 소형이지만 강인한 말을 타고 다니며, 대형 경궁(composite bow)을 사용하여 움직이면서도 화살을 발사하였습니다. 이들은 전술적인 이점을 얻기 위해 자주 이동하며 공격하고, 적의 행동을 방해하였습니다. 몽골 기병의 기술은 그들이 세계 최고의 기병군으로 인정받을 수 있게 해주었고, 13세기에 걸쳐 그들의 제국을 건설하는 데 중요한 역할을 하였습니다.'
WHERE Tag = 'TXT_KEY_CIV5_MOUNTED_BOWMAN_PEDIA';	

---------------------------------- 
--  특수유닛 표현 변경
----------------------------------
DELETE FROM Language_ko_KR WHERE Tag ='TXT_KEY_UNIT_BARBARIAN_AXMAN_HELP';
--Barbarian
UPDATE Language_ko_KR
SET Text = '투석병을 대체하는 [COLOR_NEGATIVE_TEXT]야만인[ENDCOLOR] 유닛입니다.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_AXMAN';	
 
-- ZULU_IMPI
UPDATE Language_ko_KR
SET Text = '창총보병을 대체하는 줄루의 고유 유닛입니다. 기마 유닛과 화약 유닛을 공격하는데 특화되어있으며 동시대의 대부분 유닛들보다 전반적으로 더 강력합니다. 전투 시작 전에 원거리 일격을 가합니다.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_ZULU_IMPI';	

-- EGYPT WAR CHARIOT
UPDATE Language_ko_KR
SET Text = '전차궁수를 대체하는 이집트의 고유유닛입니다. 원거리 유닛으로 일반 전차궁수보다 강력하며 [COLOR_PLAYER_PURPLE]파라오의 선물[ENDCOLOR] 승급을 보유합니다. [NEWLINE][NEWLINE][ICON_RES_HORSE]말을 요구하지 않습니다.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_EGYPTIAN_WAR_CHARIOT';	

DELETE FROM Language_ko_KR WHERE Tag ='TXT_KEY_UNIT_EGYPTIAN_WARCHARIOT_STRATEGY';

INSERT INTO Language_ko_KR (Tag, Text)
VALUES 
('TXT_KEY_UNIT_EGYPTIAN_WARCHARIOT_STRATEGY', '이륜전차는 전차궁수를 대체하는 이집트의 고유유닛입니다. 일반적인 전차궁수보다 빠르며 플레이하는 플레이어는 말 자원이 없어도 이륜전차를 만들 수 있습니다. 기마유닛이므로 이륜전차는 창병에 상당히 약합니다.');

UPDATE Language_ko_KR
SET Text = '이륜전차는 전차궁수를 대체하는 이집트의 고유유닛입니다. 일반적인 전차궁수보다 빠르며 플레이하는 플레이어는 말 자원이 없어도 이륜전차를 만들 수 있습니다. 기마유닛이므로 이륜전차는 창병에 상당히 약합니다.'
WHERE Tag = 'TXT_KEY_UNIT_EGYPTIAN_WARCHARIOT_STRATEGY';	

-- Poland PANCERNY
UPDATE Language_ko_KR
SET Text = '경궁기병을 대체하는 폴란드의 고유 유닛입니다. 경궁기병보다 공격과 방어에 더 강하고, 원거리 공격에는 추가로 방어보너스를 받습니다. 적 유닛을 처치할때마다 [ICON_PEACE]신앙을 획득하며 야만인을 처치하면 2배로 받습니다.'
WHERE Tag ='TXT_KEY_UNIT_POLAND_PANCERNY_HELP';

UPDATE Language_ko_KR
SET Text = '판체르니는 경궁기병의 폴란드 대체유닛입니다. 경궁기병보다 공격력과 방어력이 강하고 원거리 공격으로부터 받는 피해가 적습니다. 판체르니는 또한 적을 처치할 때마다 신앙을 얻습니다. 기마 유닛인 판체르니는 장창병에게 취약합니다.'
WHERE Tag ='TXT_KEY_UNIT_POLAND_PANCERNY_STRATEGY';

-- CELTS_SCYTHED_CHARIOT
UPDATE Language_ko_KR
SET Text = '기마궁수를 대체하는 켈트의 고유 유닛입니다. 근접 유닛과 궁병 유닛에 더 강력합니다.[NEWLINE][NEWLINE]이동 후, 새로 인접한 적 유닛에 피해를 주지만, [COLOR_NEGATIVE_TEXT]기마궁수보다 이동력이 더 적고 험지에서 이동력 페널티를 받습니다.[ENDCOLOR]'
WHERE Tag ='TXT_KEY_UNIT_CELTS_SCYTHED_CHARIOT_HELP';

-- SHOSHONE_YELLOW_BROW
UPDATE Language_ko_KR
SET Text = '창총보병을 대체하는 쇼쇼니의 고유 유닛입니다. [COLOR_POSITIVE_TEXT]진형 I[ENDCOLOR] 승급을 가지고 시작하며, 피해를 입을수록 [ICON_STRENGTH]전투력이 상승하고, 요새화하면 [ICON_STRENGTH]전투 보너스가 2배가 됩니다.'
WHERE Tag ='TXT_KEY_UNIT_SHOSHONE_YELLOW_BROW_HELP';

-- HUN
UPDATE Language_ko_KR
SET Text = '기마궁수를 대체하는 훈의 고유 유닛입니다. 빠른 원거리 유닛으로 평지에서 치명적입니다. [NEWLINE][NEWLINE][ICON_RES_HORSE]말이 필요하지 않습니다.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_HUN_HORSE_ARCHER';	

-- GERMAN LANDSKMECHT
UPDATE Language_ko_KR
SET Text = '창총보병을 대체하는 독일의 고유 유닛입니다. 구매 시 경험치 패널티와 구매 쿨타임이 없으며 즉시 이동할 수 있지만 유닛의 [ICON_GOLD] 비용이 증가합니다. 최대 체력인 적에게 주는 피해가 증가합니다. [COLOR_POSITIVE_TEXT]진형II[ENDCOLOR] 승급을 보유하고 있습니다.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_LANDSKNECHT' AND NOT EXISTS (SELECT * FROM Units WHERE TYPE = 'UNIT_EE_SKIRMISHER');

UPDATE Language_ko_KR
SET Text = '일반 창총보병보다 더 저렴하다는 점에 더해, 란츠크네히트는 구매 시 최대 경험치를 받고 즉시 이동할 수 있어 빠르게 필요한 만큼 모을 수 있습니다.[NEWLINE][NEWLINE]빠른 충원 속도와 최대 채력 상대 보너스로 적을 첫 턴에 크게 놀래키고 전선을 빠르게 붕괴시키십시오.[NEWLINE][NEWLINE]란츠크네히트의 낮은 가격은 선물하기에 뛰어납니다. 한 번에 유닛을 여럿 구매하여 가까운 도시 국가에 보내면 단기적, 장기적인 영향력을 모두 얻을 수 있습니다.'
WHERE Tag = 'TXT_KEY_UNIT_GERMAN_LANDSKNECHT_STRATEGY' AND NOT EXISTS (SELECT * FROM Units WHERE TYPE = 'UNIT_EE_SKIRMISHER');

UPDATE Language_ko_KR
SET Text = '총사대는 프랑스의 고유 유닛으로 창총보병을 대체합니다. 총사대는 창총보병보다 눈에 띄게 강하고, [ICON_MOVES] 이동력이 +1 더 높고, 통제 구역을 무시합니다.'
WHERE Tag = 'TXT_KEY_UNIT_FRENCH_MUSKETEER_STRATEGY'AND NOT EXISTS (SELECT * FROM Units WHERE TYPE = 'UNIT_EE_SKIRMISHER');

UPDATE Language_ko_KR
SET Text = '창총보병을 대체하는 프랑스의 고유 유닛입니다. 적에게 공격하기 위해 빠르게 이동할 수 있습니다. [COLOR_PLAYER_PURPLE]전격전[ENDCOLOR] 승급을 보유합니다.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_MUSKETEER' AND NOT EXISTS (SELECT * FROM Units WHERE TYPE = 'UNIT_EE_SKIRMISHER');

------------------
-- 번역 교정
------------------
-- 곡창
UPDATE Language_ko_KR
SET Text = '건설을 완료하면 [ICON_FOOD]식량 [COLOR_POSITIVE_TEXT]25[ENDCOLOR]를 제공합니다. [ICON_CITIZEN]시민이 증가할 때 사용한 [ICON_FOOD]식량의 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR]가 저장됩니다. [NEWLINE][NEWLINE]국내 교역로를 통해 당신 문명의 다른 도시로 [ICON_FOOD]식량을 [ICON_TURNS_REMAINING]제공할 수 있습니다.[NEWLINE][NEWLINE][ICON_RES_WHEAT] 밀: [ICON_FOOD]식량 +1[NEWLINE][ICON_RES_BANANA] 바나나: [ICON_FOOD]식량 +1[NEWLINE][ICON_RES_MAIZE]옥수수: [ICON_FOOD] 식량 +1[NEWLINE][ICON_RES_RICE]쌀: [ICON_FOOD] 식량 +1'
WHERE Tag = 'TXT_KEY_BUILDING_GRANARY_HELP';

-- 훈제실
UPDATE Language_ko_KR
SET Text = '야영지에서 [ICON_PRODUCTION] 생산을 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 얻습니다. 타일을 획득할 때 [ICON_FOOD]식량 [COLOR_POSITIVE_TEXT]5[ENDCOLOR][COLOR:105:105:105:255](시대별 보정)[ENDCOLOR] 제공합니다. [NEWLINE][NEWLINE][ICON_RES_DEER] 사슴: [ICON_FOOD] 식량 +1[NEWLINE][ICON_RES_BISON] 들소: [ICON_FOOD] 식량 +1'
WHERE Tag = 'TXT_KEY_BUILDING_LODGE_HELP';

-- 스톤헨지
UPDATE Language_ko_KR
SET Text = '[COLOR_PLAYER_NETHERLANDS_BACKGROUND]자문회[ENDCOLOR]를 무료로 제공합니다. 이 불가사의가 지어진 도시에 [ICON_PEACE]신앙 [COLOR_POSITIVE_TEXT]60[ENDCOLOR]을 제공합니다. [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'
WHERE Tag = 'TXT_KEY_BUILDING_STONEHENGE_HELP';

-- 피라미드
UPDATE Language_ko_KR
SET Text = '무료 [COLOR_YELLOW]개척자[ENDCOLOR]가 1명 출현합니다. [ICON_GREAT_PEOPLE]위인을 소모할 때 [ICON_GOLDEN_AGE]황금기 점수를 [COLOR_POSITIVE_TEXT]50[ENDCOLOR] [COLOR:105:105:105:255](시대별 보정)[ENDCOLOR] 제공합니다. [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'
WHERE Tag = 'TXT_KEY_WONDER_PYRAMIDS_HELP';

-- 우물
UPDATE Language_ko_KR
SET Text = '[ICON_CITIZEN]시민 5명마다 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]강과 인접한 도시[ENDCOLOR]에는 건설할 수 없습니다. 도시에 [COLOR_NEGATIVE_TEXT]물레방앗간[ENDCOLOR]이 없어야 건설할 수 있습니다.'
WHERE Tag = 'TXT_KEY_BUILDING_WELL_HELP';

-- 페트라
UPDATE Language_ko_KR
SET Text = '무료 [COLOR_YELLOW]대상[ENDCOLOR]이 1개 출현하고 추가 [ICON_INTERNATIONAL_TRADE][COLOR_YELLOW]교역로[ENDCOLOR]를 1개 제공합니다. 이 불가사의가 지어진 도시 주변 모든 사막 타일의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [COLOR_RESEARCH_STORED]고고학[ENDCOLOR]을 연구하면 [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]6[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE][COLOR_YELLOW]사막과 인접한 도시[ENDCOLOR]에만 건설할 수 있습니다. [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'
WHERE Tag = 'TXT_KEY_WONDER_PETRA_HELP';

-- 아르테미스 사원
UPDATE Language_ko_KR
SET Text = '[COLOR_PLAYER_NETHERLANDS_BACKGROUND]약초상[ENDCOLOR]을 무료로 제공합니다. 모든 도시의 [ICON_FOOD]식량이 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR] 증가합니다. 원거리 유닛을 생산할 때 [ICON_PRODUCTION]생산 보너스를 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR] 제공합니다. [NEWLINE][NEWLINE]전문가 [COLOR_POSITIVE_TEXT]2명[ENDCOLOR]이 더이상 [ICON_URBANIZATION] 도시화에서 오는 [ICON_HAPPINESS_3]불행을 증가시키지 않습니다.[NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'
WHERE Tag = 'TXT_KEY_WONDER_TEMPLE_ARTEMIS_HELP';

-- 약초상
UPDATE Language_ko_KR
SET Text = '도시 주변 정글 또는 숲 타일 2개마다 [ICON_FOOD]식량이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 습지 및 재배지의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_HERBALIST_HELP';

-- 성벽
UPDATE Language_ko_KR
SET Text = '도시의 [ICON_RANGE_STRENGTH]원거리 공격 범위가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [ICON_SILVER_FIST] 인구수에 따른 지역 군사 보급 한도가 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE][ICON_CITY_STATE] 도시 규모 요구치가 [COLOR_POSITIVE_TEXT]5%[ENDCOLOR] 감소합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_WALLS_HELP';

-- 석재 공장
UPDATE Language_ko_KR
SET Text = '국내 교역로를 통해 당신 문명의 다른 도시로 [ICON_PRODUCTION]생산을 [ICON_TURNS_REMAINING]제공할 수 있습니다.[NEWLINE][NEWLINE][ICON_RES_STONE] 석재: [ICON_PRODUCTION]생산 +2[NEWLINE][ICON_RES_MARBLE] 대리석: [ICON_PRODUCTION]생산 +1 [ICON_GOLD]골드 +1[NEWLINE][ICON_RES_SALT] 소금: [ICON_GOLD]골드 +2[NEWLINE][ICON_RES_JADE] 옥: [ICON_PRODUCTION]생산 +1 [ICON_GOLD]골드 +1[NEWLINE][NEWLINE]반드시 도시에 [COLOR_YELLOW]채석장[ENDCOLOR]이 있어야 합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_STONE_WORKS_HELP';

-- 할리카르나소스의 영묘
UPDATE Language_ko_KR
SET Text = '[COLOR_PLAYER_NETHERLANDS_BACKGROUND]석재 공장[ENDCOLOR]을 무료로 제공합니다. 이 불가사의가 지어지면 "국왕 경축일"이 시작됩니다. "국왕 경축일"이 열리는 동안 도시의 [ICON_PRODUCTION]생산, [ICON_RESEARCH]과학, [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR] 증가합니다.  [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'
WHERE Tag = 'TXT_KEY_WONDER_MAUSOLEUM_HALICARNASSUS_HELP';

-- 병영
UPDATE Language_ko_KR
SET Text = '도시에서 생산하는 모든 유닛의 경험치가 [COLOR_POSITIVE_TEXT]15[ENDCOLOR] 증가합니다. [ICON_WAR] 지역 군사 보급 한도가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE][ICON_FOOD]/[ICON_PRODUCTION]낙후에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_BARRACKS_HELP';

-- 대장간
UPDATE Language_ko_KR
SET Text = '광산의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][ICON_RES_IRON] 철: [ICON_PRODUCTION]생산 +1 [ICON_GOLD]골드 +1[NEWLINE][ICON_RES_COPPER] 구리: [ICON_GOLD]골드 +2'
WHERE Tag = 'TXT_KEY_BUILDING_FORGE_HELP';

-- 제우스
UPDATE Language_ko_KR
SET Text = '[COLOR_PLAYER_NETHERLANDS_BACKGROUND]병영[ENDCOLOR]을 무료로 제공합니다. 도시 공격 시 모든 유닛의 [ICON_STRENGTH]전투력이 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR] 증가합니다. 포획한 노동자의 작업 속도가 감소하지 않습니다. [NEWLINE][NEWLINE][ICON_FOOD]/[ICON_PRODUCTION]낙후에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다. [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'
WHERE Tag = 'TXT_KEY_WONDER_STATUE_ZEUS_HELP';

-- 등대
UPDATE Language_ko_KR
SET Text = '도시 주변 해양 타일의 [ICON_FOOD]식량과 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 이 도시에서 출발하는 국내 [ICON_TURNS_REMAINING]교역로의 [ICON_FOOD]식량이 [COLOR_POSITIVE_TEXT]4[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE][ICON_CONNECTED]육상으로 연결되지 않은 도시와 [ICON_CAPITAL]수도를 [ICON_CONNECTED]해안 도시로 연결합니다.[NEWLINE][NEWLINE][COLOR_YELLOW]해안 도시[ENDCOLOR]에만 건설할 수 있습니다.'
WHERE Tag = 'TXT_KEY_BUILDING_LIGHTHOUSE_HELP';

-- 파로스의 등대
UPDATE Language_ko_KR
SET Text = '[COLOR_PLAYER_NETHERLANDS_BACKGROUND]등대[ENDCOLOR]를 무료로 제공합니다. 모든 해상 유닛의 [ICON_MOVES]이동력 및 [ICON_VP_VISION]시야가 [COLOR_POSITIVE_TEXT]+1[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE][COLOR_YELLOW]해안 도시[ENDCOLOR]에만 건설할 수 있습니다. [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'
WHERE Tag = 'TXT_KEY_WONDER_GREAT_LIGHTHOUSE_HELP';

-- 법무소
UPDATE Language_ko_KR
SET Text = '무료 [COLOR_YELLOW]특사[ENDCOLOR]가 1명 출현합니다. 외교 유닛을 생산할 때 [ICON_PRODUCTION]생산 보너스를 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR] 제공합니다. [NEWLINE][NEWLINE][ICON_RES_PAPER]종이를 [COLOR_POSITIVE_TEXT]1개[ENDCOLOR] 제공합니다. [NEWLINE][NEWLINE]도시국가 [COLOR_POSITIVE_TEXT]우호 단계[ENDCOLOR] 보너스: 각각 +1 [ICON_FOOD] 식량[NEWLINE][ICON_CITY_STATE] 도시국가 [COLOR_CYAN]동맹[ENDCOLOR] 보너스: 각각 +1 [ICON_FOOD] 식량, +1 [ICON_PEACE] 신앙[NEWLINE][NEWLINE]문명에 도시가 많을수록 건설에 필요한[ICON_PRODUCTION] 생산과 [ICON_CITIZEN] 시민이 증가합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_COURT_SCRIBE_HELP';

-- 도서관
UPDATE Language_ko_KR
SET Text = '[ICON_RESEARCH]문맹, [ICON_URBANIZATION] 도시화에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]씩 감소합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_LIBRARY_HELP';

-- 알렉산드리아 도서관
UPDATE Language_ko_KR
SET Text = '[COLOR_PLAYER_NETHERLANDS_BACKGROUND]도서관[ENDCOLOR]을 무료로 제공합니다. [COLOR_RESEARCH_STORED]무료 기술[ENDCOLOR]을 1개 제공합니다. [ICON_VP_GREATWRITING]걸작 문학 슬롯 [COLOR_POSITIVE_TEXT]2개[ENDCOLOR]를 포함합니다. [NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]테마[ENDCOLOR]보너스:  [ICON_RESEARCH]과학 +3 [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'
WHERE Tag = 'TXT_KEY_WONDER_GREAT_LIBRARY_HELP';

-- 공중 정원
UPDATE Language_ko_KR
SET Text = '[COLOR_PLAYER_NETHERLANDS_BACKGROUND]정원[ENDCOLOR]을 무료로 제공합니다.[NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'
WHERE Tag = 'TXT_KEY_WONDER_HANGING_GARDEN_HELP';

-- 로마 포럼
UPDATE Language_ko_KR
SET Text = '무료 [ICON_DIPLOMAT][COLOR_YELLOW]위대한 외교관[ENDCOLOR]이 1명 출현합니다. 외교 유닛을 생산할 때 [ICON_PRODUCTION]생산 보너스를 [COLOR_POSITIVE_TEXT]20%[ENDCOLOR] 제공합니다. 도시에서 생산하는 외교유닛에게 [COLOR_PLAYER_PURPLE]황실 봉인[ENDCOLOR] 승급을 부여합니다.[NEWLINE][NEWLINE][ICON_RES_PAPER]종이를 [COLOR_POSITIVE_TEXT]1개[ENDCOLOR] 제공합니다.[NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'
WHERE Tag = 'TXT_KEY_BUILDING_FORUM_HELP';

-- 물레방앗간
UPDATE Language_ko_KR
SET Text = '[ICON_CITIZEN]시민 4명마다 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE][COLOR_YELLOW]강과 인접한 도시[ENDCOLOR]에만 건설할 수 있습니다. 도시에 [COLOR_NEGATIVE_TEXT]우물[ENDCOLOR]이 없어야 건설할 수 있습니다.'
WHERE Tag = 'TXT_KEY_BUILDING_WATERMILL_HELP';

-- 투기장
UPDATE Language_ko_KR
SET Text = '[ICON_CITIZEN]시민 4명마다 [ICON_TOURISM]관광이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 도시의 병영, 대장간, 무기고의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE][ICON_CULTURE]무료에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.[NEWLINE][NEWLINE][ICON_RES_OLIVE] 올리브: [ICON_FOOD]식량 +1 [ICON_GOLD]골드 +1[NEWLINE][ICON_RES_PERFUME] 향수: [ICON_CULTURE]문화 +1 [ICON_GOLD]골드 +1'
WHERE Tag = 'TXT_KEY_BUILDING_COLOSSEUM_HELP';

-- 병마용
UPDATE Language_ko_KR
SET Text = '타일 시설의 건설 속도가 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR] 빨라집니다. 적 유닛을 처치할 때 [ICON_CULTURE]문화를 [COLOR_POSITIVE_TEXT]10[ENDCOLOR] [COLOR:105:105:105:255](시대별 보정)[ENDCOLOR] 제공합니다. [ICON_WAR] 지역 군사 보급 한도가 [COLOR_POSITIVE_TEXT]5[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'
WHERE Tag = 'TXT_KEY_WONDER_TERRA_COTTA_ARMY_HELP';

-- 영웅 서사시
UPDATE Language_ko_KR
SET Text = '무료 [COLOR_YELLOW][ICON_GREAT_WRITER]위대한 작가[ENDCOLOR]가 1명 출현합니다. [ICON_VP_GREATWRITING]걸작 문학 슬롯 [COLOR_POSITIVE_TEXT]1개[ENDCOLOR]를 포함합니다. 도시에서 생산하는 모든 지상 유닛에 [COLOR_PLAYER_PURPLE]사기[ENDCOLOR] 승급을 부여합니다. [ICON_SILVER_FIST] 인구수에 따른 지역 군사 보급 한도가 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]문명에 도시가 많을수록 건설에 필요한 [ICON_PRODUCTION]생산과 [ICON_CITIZEN]시민이 증가합니다. '
WHERE Tag = 'TXT_KEY_BUILDING_HEROIC_EPIC_HELP';

-- 로도스의 거상
UPDATE Language_ko_KR
SET Text = '무료 [ICON_CARGO_SHIP][COLOR_YELLOW]화물선[ENDCOLOR]이 1개 출현하고 추가 [ICON_INTERNATIONAL_TRADE][COLOR_YELLOW]교역로[ENDCOLOR]를 1개 제공합니다. 이 도시로 향하는 [ICON_ARROW_LEFT] 교역로마다 도시의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가하고 [ICON_ARROW_RIGHT] 교역로를 개설한 상대 문명의 [ICON_GOLD]골드도 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][COLOR_YELLOW]해안 도시[ENDCOLOR]에만 건설할 수 있습니다. [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'
WHERE Tag = 'TXT_KEY_WONDER_COLOSSUS_HELP';

-- 국가 기념비
UPDATE Language_ko_KR
SET Text = '[ICON_CITIZEN]시민이 증가할 때 [ICON_CULTURE]문화를 [COLOR_POSITIVE_TEXT]15[ENDCOLOR] [COLOR:105:105:105:255](시대별 보정)[ENDCOLOR] 제공하고 정책을 채택할 때 [ICON_GOLDEN_AGE]황금기 점수를 [COLOR_POSITIVE_TEXT]50[ENDCOLOR] [COLOR:105:105:105:255](시대별 보정)[ENDCOLOR] 제공합니다.[ICON_GREAT_WORK]걸작 예술품 또는 [ICON_VP_ARTIFACT]유물 슬롯 [COLOR_POSITIVE_TEXT]1개[ENDCOLOR]를 포함합니다. [NEWLINE][NEWLINE][ICON_GREAT_PEOPLE]위인 출현율이 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]문명에 도시가 많을수록 건설에 필요한 [ICON_PRODUCTION]생산과 [ICON_CITIZEN]시민이 증가합니다. '
WHERE Tag = 'TXT_KEY_BUILDING_NATIONAL_EPIC_HELP';

-- 원형극장
UPDATE Language_ko_KR
SET Text = '[ICON_VP_GREATWRITING]걸작 문학 슬롯 [COLOR_POSITIVE_TEXT]2개[ENDCOLOR]를 포함합니다.[NEWLINE][NEWLINE][ICON_GREAT_WRITER]위대한 작가 출현율이 [COLOR_POSITIVE_TEXT]33%[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE][ICON_RES_DYE] 염료: [ICON_CULTURE]문화 +1 [ICON_GOLD]골드 +1[NEWLINE][ICON_RES_SILK] 비단: [ICON_CULTURE]문화 +1 [ICON_GOLD]골드 +1[NEWLINE][ICON_RES_LAPIS] 청금석: [ICON_CULTURE] 문화 +2[NEWLINE][ICON_RES_BRAZILWOOD] 브라질 소방목: [ICON_CULTURE]문화 +1 [ICON_GOLD]골드 +1[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]테마[ENDCOLOR]보너스:  [ICON_CULTURE]문화 +2'
WHERE Tag = 'TXT_KEY_BUILDING_AMPHITHEATER_HELP';

-- 날란다
UPDATE Language_ko_KR
SET Text = '모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]원형극장[ENDCOLOR]의 [ICON_RESEARCH]과학과 [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [ICON_VP_GREATWRITING] 걸작 문학 슬롯 [COLOR_POSITIVE_TEXT]2개[ENDCOLOR]를 포함하며, 그 중 1개는 [ICON_VP_GREATWRITING][COLOR_YELLOW]무료[ENDCOLOR] 걸작 문학으로 채워져 있습니다. [NEWLINE][NEWLINE][ICON_CULTURE]무료에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]테마[ENDCOLOR]보너스:  [ICON_CULTURE]문화 +3  [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'
WHERE Tag = 'TXT_KEY_BUILDING_NALANDA_HELP';

-- 사원
UPDATE Language_ko_KR
SET Text = '도시의 [ICON_RELIGION]종교 압력이 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR] 증가합니다. [ICON_VP_GREATMUSIC]걸작 음악 슬롯 [COLOR_POSITIVE_TEXT]1개[ENDCOLOR]를 포함합니다.[NEWLINE][NEWLINE][ICON_RELIGION]종교 분쟁에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다. [NEWLINE][NEWLINE][ICON_RES_INCENSE] 향: [ICON_CULTURE]문화 +1 [ICON_GOLD]골드 +1[NEWLINE][ICON_RES_WINE] 와인: [ICON_CULTURE]문화 +1 [ICON_GOLD] 골드 +1[NEWLINE][ICON_RES_AMBER] 호박석: [ICON_CULTURE]문화 +1 [ICON_GOLD]골드 +1'
WHERE Tag = 'TXT_KEY_BUILDING_TEMPLE_HELP';

-- 국립대학
UPDATE Language_ko_KR
SET Text = '[ICON_GOLDEN_AGE]황금기 동안 도시의 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]20%[ENDCOLOR] 증가합니다. [ICON_VP_GREATWRITING]걸작 문학 슬롯 [COLOR_POSITIVE_TEXT]1개[ENDCOLOR]를 포함합니다.[NEWLINE][NEWLINE]모든 도시의 [ICON_RESEARCH] 문맹에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다. 전문가 [COLOR_POSITIVE_TEXT]1명[ENDCOLOR]이 더이상 [ICON_URBANIZATION] 도시화에서 오는 [ICON_HAPPINESS_3]불행을 증가시키지 않습니다.[NEWLINE][NEWLINE]문명에 도시가 많을수록 건설에 필요한 [ICON_PRODUCTION]생산과 [ICON_CITIZEN]시민이 증가합니다. '
WHERE Tag = 'TXT_KEY_BUILDING_NATIONAL_COLLEGE_HELP';

-- 대상숙소
UPDATE Language_ko_KR
SET Text = '이 도시에서 다른 문명으로 출발하는 [ICON_CARAVAN]육상 [ICON_INTERNATIONAL_TRADE]교역로가 완료되면 [COLOR_POSITIVE_TEXT]역사적 사건[ENDCOLOR]을 발동시킵니다.[NEWLINE][NEWLINE]도시 주변 사막 또는 툰드라 타일 2개마다 [ICON_FOOD]식량과 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 도시의 육상 교역로 범위가 [COLOR_POSITIVE_TEXT]50%[ENDCOLOR]증가하고 교역로의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]3[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][ICON_RES_TRUFFLES] 송로버섯: [ICON_GOLD]골드 +2[NEWLINE][ICON_RES_COTTON] 면: [ICON_PRODUCTION]생산 +1 [ICON_CULTURE]문화 +1[NEWLINE][ICON_RES_FUR] 모피: [ICON_GOLD]골드 +1 [ICON_PRODUCTION]생산 +1'
WHERE Tag = 'TXT_KEY_BUILDING_CARAVANSARY_HELP';

-- 오라클
UPDATE Language_ko_KR
SET Text = '[COLOR_PLAYER_NETHERLANDS_BACKGROUND]사원[ENDCOLOR]을 무료로 제공합니다. 이 불가사의가 지어지면 [ICON_CULTURE]문화와 [ICON_RESEARCH]과학을 [COLOR_POSITIVE_TEXT]400[ENDCOLOR] 제공합니다. [NEWLINE][NEWLINE][ICON_RESEARCH]문맹에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.[NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'
WHERE Tag = 'TXT_KEY_WONDER_ORACLE_HELP';

-- 앙코르와트
UPDATE Language_ko_KR
SET Text = '[COLOR_PLAYER_NETHERLANDS_BACKGROUND]만디르[ENDCOLOR]를 무료로 제공합니다. 모든 도시의 [ICON_CULTURE_LOCAL]국경 확장 속도가 [COLOR_POSITIVE_TEXT]40%[ENDCOLOR] 증가하고, 새 타일을 구매하기 위해 필요한 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR] 감소합니다.  [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'
WHERE Tag = 'TXT_KEY_WONDER_ANGKOR_WAT_HELP';

-- 만리장성
UPDATE Language_ko_KR
SET Text = '[COLOR_PLAYER_NETHERLANDS_BACKGROUND]성벽[ENDCOLOR]을 무료로 제공합니다. 무료 [ICON_GREAT_GENERAL][COLOR_YELLOW]위대한 장군[ENDCOLOR]이 1명 출현합니다. 적 지상 유닛이 지상으로 당신 문명의 영토에 진입할 때 [COLOR_NEGATIVE_TEXT][ICON_MOVES]이동력을 전부 소모[ENDCOLOR]합니다. [ICON_WAR] 지역 군사 보급 한도가 [COLOR_POSITIVE_TEXT]3[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE]이 불가사의를 건설한 문명이 [COLOR_NEGATIVE_TEXT]화약[ENDCOLOR]을 연구하면 기능을 잃습니다. [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'
WHERE Tag = 'TXT_KEY_WONDER_GREAT_WALL_HELP';

-- 송수로
UPDATE Language_ko_KR
SET Text = '도시 주변 호수 및 오아시스 타일의 [ICON_FOOD]식량이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. [ICON_CITIZEN]시민이 증가할 때 사용한 [ICON_FOOD]식량의 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR]가 저장됩니다. [ICON_CITIZEN]시민이 증가할 때 현재 [ICON_PRODUCTION]생산 산출량의 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR]를 즉시 제공합니다.  [NEWLINE][NEWLINE][ICON_GOLD]빈곤에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_AQUEDUCT_HELP';

-- 원형경기장
UPDATE Language_ko_KR
SET Text = '모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]투기장[ENDCOLOR]의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다."국왕 경축일"이 열리는 동안 도시의 [ICON_CULTURE]문화와 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE][ICON_CULTURE]무료에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.[NEWLINE][NEWLINE][ICON_RES_HORSE] 말을 [COLOR_POSITIVE_TEXT]2[ENDCOLOR]마리 제공합니다.  [NEWLINE][NEWLINE]문명에 도시가 많을수록 건설에 필요한 [ICON_PRODUCTION]생산과 [ICON_CITIZEN]시민이 증가합니다. '
WHERE Tag = 'TXT_KEY_BUILDING_CIRCUS_MAXIMUS_HELP';

-- 목욕탕
UPDATE Language_ko_KR
SET Text = '도시의 사원, 원형극장, 정원의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR], [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [ICON_GOLDEN_AGE]황금기 동안 도시의 [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][COLOR_YELLOW]담수와 인접한 도시[ENDCOLOR]에만 건설할 수 있습니다.'
WHERE Tag = 'TXT_KEY_BUILDING_BATH_HELP';

-- 대학
UPDATE Language_ko_KR
SET Text = '도시 주변 정글 및 설원 타일의 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [ICON_CITIZEN]시민이 증가할 때 현재 [ICON_RESEARCH]과학 산출량의 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR]를 즉시 제공합니다. [NEWLINE][NEWLINE][ICON_RESEARCH]문맹에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_UNIVERSITY_HELP';

-- 제국대학
UPDATE Language_ko_KR
SET Text = '무료 [ICON_GREAT_SCIENTIST][COLOR_YELLOW]위대한 과학자[ENDCOLOR]가 1명 출현합니다. 기술 발견 시 [ICON_CULTURE]문화를 [COLOR_POSITIVE_TEXT]50[ENDCOLOR] [COLOR:105:105:105:255](시대별 보정)[ENDCOLOR] 제공합니다. [ICON_VP_GREATWRITING]걸작 문학 슬롯 [COLOR_POSITIVE_TEXT]2개[ENDCOLOR]를 포함합니다. [NEWLINE][NEWLINE][ICON_RESEARCH]문맹에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]테마[ENDCOLOR]보너스:  [ICON_RESEARCH]과학 +4[NEWLINE][NEWLINE]문명에 도시가 많을수록 건설에 필요한 [ICON_PRODUCTION]생산과 [ICON_CITIZEN]시민이 증가합니다. '
WHERE Tag = 'TXT_KEY_BUILDING_OXFORD_UNIVERSITY_HELP';

-- 상코레 대학
UPDATE Language_ko_KR
SET Text = '[COLOR_PLAYER_NETHERLANDS_BACKGROUND]모스크[ENDCOLOR]를 무료로 제공합니다. [ICON_GREAT_PEOPLE]위인을 소모할 때 [ICON_RESEARCH]과학을 [COLOR_POSITIVE_TEXT]50[ENDCOLOR] [COLOR:105:105:105:255](시대별 보정)[ENDCOLOR] 제공합니다.[NEWLINE][NEWLINE][COLOR_MAGENTA]전통[ENDCOLOR] 정책을 완성해야 건설할 수 있습니다. [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'
WHERE Tag = 'TXT_KEY_WONDER_MOSQUE_OF_DJENNE_HELP';

-- 아야소피아
UPDATE Language_ko_KR
SET Text = '[COLOR_PLAYER_NETHERLANDS_BACKGROUND]교회[ENDCOLOR]를 무료로 제공합니다. 무료 [ICON_PROPHET][COLOR_YELLOW]위대한 선지자[ENDCOLOR]가 1명 출현합니다. 모든 [ICON_MISSIONARY]선교사의 전도력이 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'
WHERE Tag = 'TXT_KEY_WONDER_HAGIA_SOPHIA_HELP';

-- 대사원
UPDATE Language_ko_KR
SET Text = '모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]사원[ENDCOLOR]의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR], [ICON_PEACE]신앙이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. [ICON_GREAT_WORK]걸작 음악 슬롯 [COLOR_POSITIVE_TEXT]1개[ENDCOLOR]를 포함합니다. [NEWLINE][NEWLINE]모든 도시의 [ICON_PEACE]종교 분쟁에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소하고, 추가로 해당 도시의[ICON_PEACE]종교 분쟁에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다. [NEWLINE][NEWLINE]문명에 도시가 많을수록 건설에 필요한 [ICON_PRODUCTION]생산과 [ICON_CITIZEN]시민이 증가합니다. '
WHERE Tag = 'TXT_KEY_BUILDING_GRAND_TEMPLE_HELP';

-- 보로부두르 사원
UPDATE Language_ko_KR
SET Text = '[COLOR_PLAYER_NETHERLANDS_BACKGROUND]사리탑[ENDCOLOR]을 무료로 제공합니다. 무료 [ICON_MISSIONARY][COLOR_YELLOW]선교사[ENDCOLOR]가 2명 출현합니다. 모든 [ICON_MISSIONARY]선교사와 [ICON_PROPHET]위대한 선지자는 종교를 추가로 [COLOR_POSITIVE_TEXT]1번[ENDCOLOR] 더 전파할 수 있습니다.[NEWLINE][NEWLINE][COLOR_YELLOW]성도[ENDCOLOR]에만 건설할 수 있습니다. [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'
WHERE Tag = 'TXT_KEY_WONDER_BOROBUDUR_HELP';

-- 마구간
UPDATE Language_ko_KR
SET Text = '기마 유닛을 생산할 때 [ICON_PRODUCTION]생산 보너스를 [COLOR_POSITIVE_TEXT]33%[ENDCOLOR] 제공합니다. [ICON_WAR] 지역 군사 보급 한도가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]이 도시에서 출발하는 국내 [ICON_TURNS_REMAINING]교역로의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][ICON_RES_HORSE] 말: [ICON_PRODUCTION]생산 +2[NEWLINE][ICON_RES_SHEEP] 양: [ICON_PRODUCTION]생산 +2[NEWLINE][ICON_RES_COW] 소: [ICON_PRODUCTION]생산 +2[NEWLINE][NEWLINE]반드시 도시에 [COLOR_YELLOW]목장[ENDCOLOR]이 있어야 합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_STABLE_HELP';

-- 성
UPDATE Language_ko_KR
SET Text = '채석장의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE]도시가 받는 모든 피해를 [COLOR_POSITIVE_TEXT] 2[ENDCOLOR] 감소시킵니다. [ICON_SILVER_FIST] 인구수에 따른 지역 군사 보급 한도가 [COLOR_POSITIVE_TEXT]5%[ENDCOLOR] 증가합니다. [ICON_GREAT_WORK]걸작 예술품 또는 [ICON_VP_ARTIFACT]유물 슬롯 [COLOR_POSITIVE_TEXT]1개[ENDCOLOR]를 포함합니다. [NEWLINE][NEWLINE][ICON_CITY_STATE] 도시 규모 요구치가 [COLOR_POSITIVE_TEXT]5%[ENDCOLOR] 감소합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_CASTLE_HELP';

-- 알함브라 궁전
UPDATE Language_ko_KR
SET Text = '[COLOR_PLAYER_NETHERLANDS_BACKGROUND]성[ENDCOLOR]을 무료로 제공합니다. 모든 기마 유닛에 [COLOR_PLAYER_PURPLE]히네테[ENDCOLOR] 승급을 부여합니다. 이 불가사의가 지어진 도시의 [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE][COLOR_MAGENTA]권위[ENDCOLOR] 정책을 완성해야 건설할 수 있습니다. [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'
WHERE Tag = 'TXT_KEY_WONDER_ALHAMBRA_HELP';

-- 서커스
UPDATE Language_ko_KR
SET Text = '건설을 완료하면 [ICON_CULTURE] 문화를 [COLOR_POSITIVE_TEXT]100[ENDCOLOR] 제공하고 [COLOR_POSITIVE_TEXT]10턴[ENDCOLOR] 동안 "국왕 경축일"을 맞이합니다. [NEWLINE][NEWLINE][ICON_CULTURE]무료에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.[NEWLINE][NEWLINE][ICON_RES_IVORY] 상아: [ICON_CULTURE]문화 +3'
WHERE Tag = 'TXT_KEY_BUILDING_CIRCUS_HELP';

-- 마추픽추
UPDATE Language_ko_KR
SET Text = '[ICON_CONNECTED]도시 연결 및 [ICON_INDUSTRIAL_CONNECTED]산업 도시 연결 에서 오는 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR] 증가합니다. 이 불가사의가 지어진 도시 주변 3타일 이내의 산 1개마다 [ICON_FOOD]식량, [ICON_PRODUCTION]생산, [ICON_CULTURE]문화, [ICON_PEACE]신앙이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]씩 증가합니다.[NEWLINE][NEWLINE]도시 주변 [COLOR_YELLOW]2타일 이내에 산[ENDCOLOR]이 있어야 건설할 수 있습니다. [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'
WHERE Tag = 'TXT_KEY_WONDER_MACHU_PICHU_HELP';

-- 무기고
UPDATE Language_ko_KR
SET Text = '도시에서 생산하는 모든 유닛의 경험치가 [COLOR_POSITIVE_TEXT]20[ENDCOLOR] 증가합니다. [ICON_WAR] 지역 군사 보급 한도가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE][ICON_FOOD]/[ICON_PRODUCTION]낙후에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_ARMORY_HELP';

-- 작업장
UPDATE Language_ko_KR
SET Text = '도시 주변 숲 타일의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [ICON_CITIZEN]시민 4명마다 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 이 도시에서 출발하는 국내 [ICON_TURNS_REMAINING]교역로의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]4[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE]국내 교역로를 통해 당신 문명의 다른 도시로 [ICON_PRODUCTION]생산 보너스를 [ICON_TURNS_REMAINING]제공할 수 있습니다.'	
WHERE Tag = 'TXT_KEY_BUILDING_WORKSHOP_HELP' AND NOT EXISTS (SELECT * FROM Units WHERE TYPE = 'UNIT_EE_SKIRMISHER');

-- 세관
UPDATE Language_ko_KR
SET Text = '이 도시로 향하는 [ICON_ARROW_LEFT]교역로마다 도시의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가하고 [ICON_ARROW_RIGHT] 교역로를 개설한 상대 문명의 [ICON_GOLD]골드도 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE][ICON_GOLD]빈곤에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.[NEWLINE][NEWLINE][ICON_RES_BANANA] 바나나: [ICON_GOLD]골드 +2[NEWLINE][ICON_RES_COFFEE] 커피: [ICON_GOLD]골드 +1 [ICON_PRODUCTION]생산 +2[NEWLINE][ICON_RES_TEA] 차: [ICON_GOLD]골드 +2 [ICON_PRODUCTION] 생산 +1[NEWLINE][ICON_RES_TOBACCO] 연초: [ICON_GOLD]골드 +3'
WHERE Tag = 'TXT_KEY_BUILDING_MINT_HELP';

-- 자금성
UPDATE Language_ko_KR
SET Text = '모든 도시에서 [ICON_GOLD]골드로 유닛을 구매하거나 건물 건설에 투자하는 비용이 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR] 감소합니다. [NEWLINE][NEWLINE][ICON_GOLD]빈곤에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.[NEWLINE][NEWLINE][COLOR_MAGENTA]진보[ENDCOLOR] 정책을 완성해야 건설할 수 있습니다. [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'
WHERE Tag = 'TXT_KEY_WONDER_FORBIDDEN_PALACE_HELP';

-- 정원
UPDATE Language_ko_KR
SET Text = '도시 주변 오아시스 타일의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE]도시의 [ICON_GREAT_PEOPLE]위인 출현율이 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE]전문가 [COLOR_POSITIVE_TEXT]1명[ENDCOLOR]이 더이상 [ICON_URBANIZATION] 도시화에서 오는 [ICON_HAPPINESS_3]불행을 증가시키지 않습니다. [NEWLINE][NEWLINE][ICON_RES_CITRUS] 감귤: [ICON_FOOD]식량 +1 [ICON_GOLD]골드 +1[NEWLINE][ICON_RES_COCOA] 코코아: [ICON_FOOD]식량 +1 [ICON_GOLD]골드 +1[NEWLINE][ICON_RES_CLOVES] 정향: [ICON_PEACE] 신앙 +1 [ICON_CULTURE]문화 +1.[NEWLINE][ICON_RES_PEPPER] 후추: [ICON_PEACE]신앙 +1 [ICON_GOLD]골드 +1.[NEWLINE][ICON_RES_NUTMEG] 육두구: [ICON_CULTURE] 문화 +1 [ICON_PRODUCTION] 생산 +1'
WHERE Tag = 'TXT_KEY_BUILDING_GARDEN_HELP';

-- 특허회사
UPDATE Language_ko_KR
SET Text = '이 도시의 모든 사치 자원을 추가로 한 개씩 [COLOR_POSITIVE_TEXT]복제[ENDCOLOR]합니다. 이 도시로 향하는 [ICON_ARROW_LEFT]교역로마다 도시의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]4[ENDCOLOR] 증가하고 [ICON_ARROW_RIGHT] 교역로를 개설한 상대 문명의 [ICON_GOLD]골드도 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. [ICON_INTERNATIONAL_TRADE]교역로의 자원 다양성 수치가 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]모든 도시의 [ICON_GOLD]빈곤으로 인한 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]씩 감소합니다.[NEWLINE][NEWLINE]문명에 도시가 많을수록 건설에 필요한 [ICON_PRODUCTION]생산과 [ICON_CITIZEN]시민이 증가합니다. '
WHERE Tag = 'TXT_KEY_BUILDING_NATIONAL_TREASURY_HELP';

-- 항만
UPDATE Language_ko_KR
SET Text = '이 도시에서 다른 문명으로 출발하는 해상 [ICON_CARGO_SHIP]교역로가 완료되면 [COLOR_POSITIVE_TEXT]역사적 사건[ENDCOLOR]을 발동시킵니다.[NEWLINE][NEWLINE]도시 주변 해양 타일의 [ICON_FOOD]식량이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가하고 해양 자원의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]도시의 [ICON_CARGO_SHIP] 해상 교역로 범위가 [COLOR_POSITIVE_TEXT]50%[ENDCOLOR] 증가하고 교역로의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. 해상 유닛을 생산할 때 [ICON_PRODUCTION]생산 보너스를 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR] 제공합니다. [ICON_WAR] 지역 군사 보급 한도가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][COLOR_YELLOW]해안 도시[ENDCOLOR]에만 건설할 수 있습니다.'
WHERE Tag = 'TXT_KEY_BUILDING_HARBOR_HELP';

-- 제철소
UPDATE Language_ko_KR
SET Text = '건설을 완료하면 [ICON_RESEARCH]과학 [COLOR_POSITIVE_TEXT]25[ENDCOLOR][COLOR:105:105:105:255](시대별 보정)[ENDCOLOR]를 제공합니다.[NEWLINE][NEWLINE][ICON_RES_IRON]철 [COLOR_POSITIVE_TEXT]2개[ENDCOLOR]를 제공합니다. [NEWLINE][NEWLINE]문명에 도시가 많을수록 건설에 필요한 [ICON_PRODUCTION]생산과 [ICON_CITIZEN]시민이 증가합니다. '
WHERE Tag = 'TXT_KEY_BUILDING_IRONWORKS_HELP';

-- 카를슈테인성
UPDATE Language_ko_KR
SET Text = '[COLOR_PLAYER_NETHERLANDS_BACKGROUND]기사단[ENDCOLOR]을 무료로 제공합니다. 일반적으로 필요한 전 세계의 신도 수보다  낮은 [COLOR_POSITIVE_TEXT]5%[ENDCOLOR]수준[COLOR:105:105:105:255](보통 20%)[ENDCOLOR]으로 [COLOR_POSITIVE_TEXT]개혁 교리[ENDCOLOR]를 선택할 수 있습니다.[NEWLINE][NEWLINE][COLOR_YELLOW]성도[ENDCOLOR]에만 건설할 수 있습니다. [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'
WHERE Tag = 'TXT_KEY_BUILDING_KARLSTEJN_HELP';

-- 노트르담대성당
UPDATE Language_ko_KR
SET Text = '[COLOR_PLAYER_NETHERLANDS_BACKGROUND]대성당[ENDCOLOR]을 무료로 제공합니다. 당신의 [COLOR_POSITIVE_TEXT]대중 종교[ENDCOLOR]를 믿는 모든 도시의 종교 압력이 [COLOR_POSITIVE_TEXT]30%[ENDCOLOR] 증가합니다. [ICON_GREAT_WORK]걸작 예술품 또는 [ICON_VP_ARTIFACT]유물 슬롯 [COLOR_POSITIVE_TEXT]2개[ENDCOLOR]를 포함합니다. [NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]테마[ENDCOLOR]보너스:  [ICON_PEACE]신앙 +3 [ICON_GOLDEN_AGE]황금기 점수 +3 [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.' 
WHERE Tag = 'TXT_KEY_BUILDING_NOTRE_DAME_HELP';

-- 은행
UPDATE Language_ko_KR
SET Text = '도시의 대상 숙소 및 세관의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]3[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][ICON_INVEST] 골드로 유닛을 구매하거나 건물 건설에 투자할 때 비용의 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR]를 [ICON_RESEARCH]과학으로 전환합니다.[NEWLINE][NEWLINE][ICON_RES_GOLD] 금: [ICON_GOLD]골드 +3[NEWLINE][ICON_RES_SILVER] 은: [ICON_GOLD]골드 +1 [ICON_PRODUCTION]생산 +1 [ICON_CULTURE]문화 +1[NEWLINE][ICON_RES_GEMS] 보석: [ICON_CULTURE]문화 +2 [ICON_GOLD]골드 +1'
WHERE Tag = 'TXT_KEY_BUILDING_BANK_HELP';

-- 글로브 극장
UPDATE Language_ko_KR
SET Text = '무료 [ICON_GREAT_WRITER][COLOR_YELLOW]위대한 작가[ENDCOLOR]가 1명 출현합니다. 모든 도시의 [ICON_VP_WRITER] 작가, [ICON_VP_ARTIST] 예술가, [ICON_VP_MUSICIAN] 음악가의 [ICON_GOLDEN_AGE]황금기 점수가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. [ICON_VP_GREATWRITING]걸작 문학 슬롯 [COLOR_POSITIVE_TEXT]2개[ENDCOLOR]를 포함합니다. [NEWLINE][NEWLINE][ICON_CULTURE]무료, [ICON_URBANIZATION] 도시화에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]씩 감소합니다.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]테마[ENDCOLOR]보너스:  [ICON_GOLD]골드 +10[NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'
WHERE Tag = 'TXT_KEY_WONDER_GLOBE_THEATER_HELP';

-- 인쇄국
UPDATE Language_ko_KR
SET Text = '외교 유닛을 생산할 때 [ICON_PRODUCTION]생산 보너스를 [COLOR_POSITIVE_TEXT]20%[ENDCOLOR] 제공합니다. 외교 유닛에 [COLOR_PLAYER_PURPLE]문자 해독[ENDCOLOR] 승급을 부여합니다.[NEWLINE][NEWLINE][ICON_RES_PAPER]종이를 [COLOR_POSITIVE_TEXT]1개[ENDCOLOR] 제공합니다. [NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]외교 청사[ENDCOLOR]가 있어야 건설할 수 있습니다. 문명에 도시가 많을수록 건설에 필요한 [ICON_PRODUCTION]생산과 [ICON_CITIZEN]시민이 증가합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_PRINTING_PRESS_HELP';

-- 경찰대
UPDATE Language_ko_KR
SET Text = '[ICON_SPY] 도시 보안이 20 증가하고, [ICON_CITIZEN] 시민 2명마다 1씩 추가로 증가합니다.[NEWLINE][NEWLINE][ICON_FOOD]/[ICON_PRODUCTION]낙후에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_CONSTABLE_HELP';

-- 천문대
UPDATE Language_ko_KR
SET Text = '도시 주변 3타일 이내의 산 1개마다 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][COLOR_MAGENTA]{TXT_KEY_POLICY_SECULARISM}[ENDCOLOR] 정책을 채택해야 건설할 수 있습니다.'
WHERE Tag = 'TXT_KEY_BUILDING_OBSERVATORY_HELP'  AND NOT EXISTS (SELECT * FROM Units WHERE TYPE = 'UNIT_EE_SKIRMISHER');

-- 치첸이사
UPDATE Language_ko_KR
SET Text = '[COLOR_PLAYER_NETHERLANDS_BACKGROUND]테오칼리[ENDCOLOR]를 무료로 제공합니다. [ICON_GOLDEN_AGE]황금기의 길이가 [COLOR_POSITIVE_TEXT]50%[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]모든 도시의 [ICON_CITY_STATE] 도시 규모 요구치가 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR] 감소합니다.[NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'
WHERE Tag = 'TXT_KEY_WONDER_CHICHEN_ITZA_HELP';

-- 히메지성
UPDATE Language_ko_KR
SET Text = '[COLOR_PLAYER_NETHERLANDS_BACKGROUND]성형 요새[ENDCOLOR]를 무료로 제공합니다. 우호 영토 내 전투 시 유닛의 [ICON_STRENGTH]전투력이 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR] 증가하고 모든 도시의 [ICON_STRENGTH]전투력이 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR] 증가합니다. [ICON_WAR] 지역 군사 보급 한도가 [COLOR_POSITIVE_TEXT]5[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'
WHERE Tag = 'TXT_KEY_WONDER_HIMEJI_CASTLE_HELP';

-- 피사의 사탑
UPDATE Language_ko_KR
SET Text = '[ICON_CAPITAL]수도 근처에 무료 [COLOR_YELLOW]원하는 [ICON_GREAT_PEOPLE][COLOR_YELLOW]위인[ENDCOLOR]이 1명 [ENDCOLOR]출현합니다. 이 불가사의가 지어진 도시의 [ICON_GREAT_PEOPLE]위인 출현율이 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR] 증가하고 다른 모든 도시의 위인 출현율이 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'
WHERE Tag = 'TXT_KEY_WONDER_LEANING_TOWER_HELP';

-- 식료품 상점
UPDATE Language_ko_KR
SET Text = '[ICON_CITIZEN]시민 5명마다 [ICON_FOOD]식량이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [ICON_CITIZEN]시민이 증가할 때 사용한 [ICON_FOOD]식량의 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR]가 저장됩니다. [NEWLINE][NEWLINE][ICON_GOLD]빈곤에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_GROCER_HELP' AND NOT EXISTS (SELECT * FROM Units WHERE TYPE = 'UNIT_MONGOLIA_BLACK_TUG');

-- 왕실 컬렉션
UPDATE Language_ko_KR
SET Text = '[ICON_CITIZEN]시민 4명마다 [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 도시의 [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR] 증가합니다. [ICON_GREAT_WORK]걸작 예술품 또는 [ICON_VP_ARTIFACT]유물 슬롯 [COLOR_POSITIVE_TEXT]3개[ENDCOLOR]를 포함합니다. [NEWLINE][NEWLINE]모든 도시의 [ICON_CULTURE]무료로 인한 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]테마[ENDCOLOR]보너스:  [ICON_CULTURE]문화 +4 [ICON_GOLD]골드 +4[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]갤러리[ENDCOLOR]가 있어야 건설할 수 있습니다. 문명에 도시가 많을수록 건설에 필요한 [ICON_PRODUCTION]생산과 [ICON_CITIZEN]시민이 증가합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_HERMITAGE_HELP';

-- 영곡탑
UPDATE Language_ko_KR
SET Text = '무료 [ICON_GREAT_SCIENTIST][COLOR_YELLOW]위대한 과학자[ENDCOLOR]가 1명 출현합니다. 이 불가사의가 지어진 도시에 [ICON_RESEARCH]과학 보너스를 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR] 제공합니다. [NEWLINE][NEWLINE][ICON_RESEARCH]문맹에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.[NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'
WHERE Tag = 'TXT_KEY_WONDER_PORCELAIN_TOWER_HELP';

-- 타지마할
UPDATE Language_ko_KR
SET Text = '이 불가사의가 지어지면 제국이 즉시 [ICON_GOLDEN_AGE]황금기를 맞이합니다. [ICON_CITIZEN]시민 2명마다 [ICON_GOLDEN_AGE]황금기 점수가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 이 불가사의가 지어진 도시에 존재하는 [ICON_RELIGION]종교 1개마다 [ICON_RESEARCH]과학, [ICON_CULTURE]문화, [ICON_PEACE]신앙이 [COLOR_POSITIVE_TEXT]3[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'
WHERE Tag = 'TXT_KEY_WONDER_TAJ_MAHAL_HELP';

-- 갤러리
UPDATE Language_ko_KR
SET Text = '도시의 [ICON_GREAT_WORK] 걸작에서 오는 [ICON_TOURISM] 관광이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [ICON_GREAT_WORK] 걸작 예술품 또는 [ICON_VP_ARTIFACT]유물 슬롯 [COLOR_POSITIVE_TEXT]1개[ENDCOLOR]를 포함합니다. [NEWLINE][NEWLINE][ICON_GREAT_ARTIST] 위대한 예술가의 출현율이 [COLOR_POSITIVE_TEXT]33%[ENDCOLOR] 증가합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_GALLERY_HELP'  AND NOT EXISTS (SELECT * FROM Units WHERE TYPE = 'UNIT_EE_SKIRMISHER');

-- 풍차
UPDATE Language_ko_KR
SET Text = '도시 주변 습지 및 호수 타일의 [ICON_PRODUCTION]생산 및 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. 도시에 건물을 건설할 때 [ICON_PRODUCTION]생산 보너스를 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR] 제공합니다. 도시의 식료품 상점 및 곡창의 [ICON_FOOD]식량이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_WINDMILL_HELP' AND NOT EXISTS (SELECT * FROM Units WHERE TYPE = 'UNIT_EE_SKIRMISHER');

-- 오페라 극장
UPDATE Language_ko_KR
SET Text = '도시의 [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]5%[ENDCOLOR] 증가합니다. 도시의 [ICON_GREAT_WORK]걸작 음악에서 오는 [ICON_TOURISM]관광이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[ICON_GREAT_WORK]걸작 음악 슬롯 [COLOR_POSITIVE_TEXT]1개[ENDCOLOR]를 포함합니다.[NEWLINE][NEWLINE][ICON_GREAT_MUSICIAN]위대한 음악가 출현율이 [COLOR_POSITIVE_TEXT]33%[ENDCOLOR] 증가합니다. '
WHERE Tag = 'TXT_KEY_BUILDING_OPERA_HOUSE_HELP' AND NOT EXISTS (SELECT * FROM Units WHERE TYPE = 'UNIT_EE_SKIRMISHER');

-- 우피치 미술관
UPDATE Language_ko_KR
SET Text = '[COLOR_PLAYER_NETHERLANDS_BACKGROUND]갤러리[ENDCOLOR]를 무료로 제공합니다. 무료 [ICON_GREAT_ARTIST][COLOR_YELLOW]위대한 예술가[ENDCOLOR]가 1명 출현합니다.  모든 도시의 [ICON_GREAT_WORK]걸작에서 오는 [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [ICON_GREAT_WORK]걸작 예술품 또는 [ICON_VP_ARTIFACT]유물 슬롯 [COLOR_POSITIVE_TEXT]3개[ENDCOLOR]를 포함합니다. [NEWLINE][NEWLINE]전문가 [COLOR_POSITIVE_TEXT]1명[ENDCOLOR]이 더이상 [ICON_URBANIZATION] 도시화에서 오는 [ICON_HAPPINESS_3]불행을 증가시키지 않습니다.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]테마[ENDCOLOR]보너스:  [ICON_CULTURE]문화 +10[NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'
WHERE Tag = 'TXT_KEY_WONDER_UFFIZI_HELP';

-- 시스타나 성당
UPDATE Language_ko_KR
SET Text = '모든 도시의 [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR] 증가합니다. [ICON_GREAT_WORK]걸작 예술품 또는 [ICON_VP_ARTIFACT]유물 슬롯 [COLOR_POSITIVE_TEXT]2개[ENDCOLOR]를 포함합니다.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]테마[ENDCOLOR]보너스:  [ICON_PEACE]신앙 +3 [ICON_CULTURE]문화 +3 [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'
WHERE Tag = 'TXT_KEY_WONDER_SISTINE_CHAPEL_HELP';

-- 성형요새
UPDATE Language_ko_KR
SET Text = '도시가 받는 모든 피해를 [COLOR_POSITIVE_TEXT] 2 [ENDCOLOR]감소시킵니다. 도시가 시야에 상관 없이 [ICON_RANGE_STRENGTH] 범위 공격을 할 수 있습니다. 주둔한 유닛이 체력을 추가로 [COLOR_POSITIVE_TEXT]5[ENDCOLOR] 회복합니다. [ICON_SILVER_FIST] 지역 군사 보급 한도가 시민의 [COLOR_POSITIVE_TEXT] 10%[ENDCOLOR]만큼 증가합니다. [NEWLINE][NEWLINE][ICON_CITY_STATE] 도시 규모 요구치가 [COLOR_POSITIVE_TEXT]5%[ENDCOLOR] 감소합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_FORTRESS_HELP';

-- 붉은 요새
UPDATE Language_ko_KR
SET Text = '[COLOR_PLAYER_NETHERLANDS_BACKGROUND]군수창고[ENDCOLOR]를 무료로 제공합니다. 무료 [ICON_GREAT_ENGINEER][COLOR_YELLOW]위대한 기술자[ENDCOLOR]가 1명 출현합니다. 도시의 원거리 전투력이 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR] [ICON_RANGE_STRENGTH]사거리가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 도시의 [ICON_STRENGTH]전투력과 체력이 증가하고 [ICON_SILVER_FIST] 지역 군사 보급 한도가 모든 도시 [ICON_CITIZEN]시민의 [COLOR_POSITIVE_TEXT]5%[ENDCOLOR]만큼 증가합니다.[NEWLINE][NEWLINE][COLOR_MAGENTA]충성[ENDCOLOR] 정책을 완성해야 건설할 수 있습니다. [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'
WHERE Tag = 'TXT_KEY_WONDER_RED_FORT_HELP';

-- 이화원
UPDATE Language_ko_KR
SET Text = '모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]외교 청사[ENDCOLOR]의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]3[ENDCOLOR] [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 모든 도시에서 외교 유닛을 생산할 때 [ICON_PRODUCTION]생산 보너스를 [COLOR_POSITIVE_TEXT]20%[ENDCOLOR] 제공합니다. 모든 외교 유닛에 [COLOR_PLAYER_PURPLE]귀족[ENDCOLOR] 승급을 부여합니다. [NEWLINE][NEWLINE][ICON_RES_PAPER]종이를 [COLOR_POSITIVE_TEXT]1개[ENDCOLOR] 제공합니다.[NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다. '
WHERE Tag = 'TXT_KEY_BUILDING_SUMMER_PALACE_HELP' AND NOT EXISTS (SELECT * FROM Units WHERE TYPE = 'UNIT_EE_SKIRMISHER');

-- 동물원
UPDATE Language_ko_KR
SET Text = '건설을 완료하면 [ICON_RESEARCH] 과학을 [COLOR_POSITIVE_TEXT]500[ENDCOLOR] 제공합니다. 도시 주변 정글 및 숲 타일의 [ICON_CULTURE]문화와 [ICON_TOURISM]관광이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]이 도시에서 다른 문명으로 출발하는 [ICON_CARAVAN]/[ICON_CARGO_SHIP]교역로가 완료되면 [COLOR_POSITIVE_TEXT]역사적 사건[ENDCOLOR]을 발동시킵니다. [NEWLINE][NEWLINE][ICON_CULTURE]무료에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_THEATRE_HELP' AND NOT EXISTS (SELECT * FROM Units WHERE TYPE = 'UNIT_EE_SKIRMISHER');

-- 공립학교
UPDATE Language_ko_KR
SET Text = '[ICON_CITIZEN]시민 2명마다 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE][ICON_RESEARCH]문맹에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_PUBLIC_SCHOOL_HELP' AND NOT EXISTS (SELECT * FROM Units WHERE TYPE = 'UNIT_EE_SKIRMISHER');

-- 노이반슈타인성
UPDATE Language_ko_KR
SET Text = '모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]성[ENDCOLOR]의 [ICON_GOLD]골드, [ICON_CULTURE]문화, [ICON_HAPPINESS_1]행복이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE]도시 주변 [COLOR_YELLOW]2타일 이내에 산[ENDCOLOR]이 있어야 건설할 수 있습니다. [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'
WHERE Tag = 'TXT_KEY_WONDER_NEUSCHWANSTEIN_HELP';

-- 호텔
UPDATE Language_ko_KR
SET Text = '[ICON_WONDER] 세계 불가사의 및 타일이 제공하는 [ICON_CULTURE]문화의 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR]가 도시의 [ICON_TOURISM]관광에 추가됩니다. [ICON_GREAT_WORK]걸작에서 오는 [ICON_TOURISM]관광이 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR] 증가합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_HOTEL_HELP';

-- 항구
UPDATE Language_ko_KR
SET Text = '도시 주변 해양 타일의 [ICON_PRODUCTION]생산과 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 도시 주변 해양 자원의 [ICON_PRODUCTION]생산과 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. 해상 유닛을 생산할 때 [ICON_PRODUCTION]생산 보너스를 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR]제공합니다. [ICON_SILVER_FIST] 인구수에 따른 지역 군사 보급 한도가 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][ICON_CONNECTED]산업 도시로 연결되지 않은 도시와 [ICON_CAPITAL]수도를 [ICON_CONNECTED]산업 도시로 연결합니다. [NEWLINE][NEWLINE][COLOR_YELLOW]해안 도시[ENDCOLOR]에만 건설할 수 있습니다.'
WHERE Tag = 'TXT_KEY_BUILDING_SEAPORT_HELP';

-- 소호제작소
UPDATE Language_ko_KR
SET Text = '[COLOR_PLAYER_NETHERLANDS_BACKGROUND]공장[ENDCOLOR]을 무료로 제공합니다. 이 불가사의가 지어진 도시의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]5[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][ICON_RES_COAL]석탄 [COLOR_POSITIVE_TEXT]4개[ENDCOLOR]를 제공합니다.[NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'
WHERE Tag = 'TXT_KEY_BUILDING_SOHO_FOUNDRY_HELP';

-- 박물관
UPDATE Language_ko_KR
SET Text = '도시에서 [COLOR_POSITIVE_TEXT]고고학자[ENDCOLOR]를 생산할 수 있습니다. [ICON_CITIZEN]시민 4명마다 [ICON_CULTURE]문화와 [ICON_TOURISM]관광이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [ICON_GREAT_WORK]걸작에서 오는 [ICON_TOURISM]관광이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [ICON_GREAT_WORK]걸작 예술품 또는 [ICON_VP_ARTIFACT]유물 슬롯 [COLOR_POSITIVE_TEXT]2개[ENDCOLOR]를 포함합니다.[NEWLINE][NEWLINE][ICON_CULTURE]무료에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]테마[ENDCOLOR]보너스:  [ICON_CULTURE]문화 +4'
WHERE Tag = 'TXT_KEY_BUILDING_MUSEUM_HELP';

-- 루부르 박물관
UPDATE Language_ko_KR
SET Text = '[COLOR_PLAYER_NETHERLANDS_BACKGROUND]박물관[ENDCOLOR]을 무료로 제공합니다. 무료 [COLOR_YELLOW]고고학자[ENDCOLOR]가 2명, 무료 [ICON_GREAT_ARTIST][COLOR_YELLOW]위대한 예술가[ENDCOLOR]가 1명 출현합니다. [ICON_GREAT_WORK]걸작 예술품 또는 [ICON_VP_ARTIFACT]유물 슬롯 [COLOR_POSITIVE_TEXT]4개[ENDCOLOR]를 포함합니다. [NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]테마[ENDCOLOR]보너스:  [ICON_CULTURE]문화 +15[NEWLINE][NEWLINE][COLOR_MAGENTA]미학[ENDCOLOR] 정책을 완성해야 건설할 수 있습니다. [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'
WHERE Tag = 'TXT_KEY_WONDER_LOUVRE_HELP';

-- 공장
UPDATE Language_ko_KR
SET Text = '[ICON_CITIZEN]시민 4명마다 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]공장[ENDCOLOR]의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. 제조소의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]전문가 [COLOR_POSITIVE_TEXT]1명[ENDCOLOR]이 더이상 도시화에서 오는 [ICON_HAPPINESS_3]불행을 증가시키지 않습니다.[NEWLINE][NEWLINE][ICON_RES_COAL] 석탄: [ICON_PRODUCTION] 생산 +2, [ICON_RESEARCH] 과학 +2.[NEWLINE][NEWLINE][ICON_RES_COAL]석탄 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR]가 필요합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_FACTORY_HELP';

-- 웨스트민스터 궁전
UPDATE Language_ko_KR
SET Text = '무료 [ICON_GREAT_MERCHANT][COLOR_YELLOW]위대한 상인[ENDCOLOR]이 1명 출현합니다. 세계 대회 추가 [ICON_DIPLOMAT] 대표단을 1명 얻고, 세계의 원래 [ICON_CITY_STATE]도시 국가 4개마다 [ICON_DIPLOMAT] 세계 대회 추가 대표단을 1명 확보합니다.[NEWLINE][NEWLINE][ICON_GOLD]빈곤에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.[NEWLINE][NEWLINE][COLOR_MAGENTA]외교[ENDCOLOR] 정책을 완성해야 건설할 수 있습니다. [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'
WHERE Tag = 'TXT_KEY_WONDER_BIG_BEN_HELP';

--  에펠탑
UPDATE Language_ko_KR
SET Text = '새로운 정책을 채택하기 위해 필요한 [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR] 감소합니다.  [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'
WHERE Tag = 'TXT_KEY_WONDER_EIFFEL_TOWER_HELP';

--  사관학교
UPDATE Language_ko_KR
SET Text = '지상 유닛을 생산할 때 [ICON_PRODUCTION]생산 보너스를 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR] 제공합니다. 도시에서 생산하는 모든 유닛의 경험치가 [COLOR_POSITIVE_TEXT]25[ENDCOLOR] 증가합니다. [ICON_WAR] 지역 군사 보급 한도가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE][ICON_FOOD]/[ICON_PRODUCTION]낙후에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_MILITARY_ACADEMY_HELP';

-- 브란덴부르크 문
UPDATE Language_ko_KR
SET Text = '무료 [ICON_GREAT_GENERAL][COLOR_YELLOW]위대한 장군[ENDCOLOR]이 1명 출현합니다. 모든 도시에서 생산하는 유닛의 경험치가 [COLOR_POSITIVE_TEXT]15[ENDCOLOR] 증가합니다. [ICON_WAR] 지역 군사 보급 한도가 [COLOR_POSITIVE_TEXT]10[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE][ICON_GOLD]빈곤에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.[NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'
WHERE Tag = 'TXT_KEY_WONDER_BRANDENBURG_GATE_HELP';

-- 병원
UPDATE Language_ko_KR
SET Text = '모든 전문가마다 [ICON_FOOD] 식량이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]증가하고, [ICON_VP_SCIENTIST] 과학자, [ICON_VP_MERCHANT] 상인, [ICON_VP_ENGINEER]기술자의 관련 산출량이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR]증가합니다. 행동 여부에 상관 없이 이 도시 내부의 지상 유닛은 매 턴 체력을 추가 [COLOR_POSITIVE_TEXT]15[ENDCOLOR] 더 회복합니다. [NEWLINE][NEWLINE][ICON_GOLD]빈곤에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR], [ICON_URBANIZATION] 도시화에서 오는 [ICON_HAPPINESS_3] 불행이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 감소합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_HOSPITAL_HELP';

-- 자유의 여신상
UPDATE Language_ko_KR
SET Text = '[COLOR_MAGENTA]무료 정책[ENDCOLOR]을 1개 제공합니다. 모든 전문가의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE][ICON_IDEOLOGY_FREEDOM][COLOR_MAGENTA]평등[ENDCOLOR] 이념을 채택해야 건설할 수 있습니다. [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'
WHERE Tag = 'TXT_KEY_WONDER_STATUE_OF_LIBERTY_HELP';

-- 국제 금융센터
UPDATE Language_ko_KR
SET Text = '도시의 [ICON_FOOD]식량과 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]5%[ENDCOLOR] 증가합니다. [COLOR_POSITIVE_TEXT]친선 관계[ENDCOLOR]를 맺은 문명 2개마다 세계 의회 추가 [COLOR_YELLOW]대표단[ENDCOLOR]을 1명 확보합니다.[NEWLINE][NEWLINE][ICON_IDEOLOGY_FREEDOM][COLOR_MAGENTA]평등[ENDCOLOR] 이념을 채택해야 건설할 수 있습니다. [NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]증권거래소[ENDCOLOR]가 있어야 건설할 수 있습니다. 문명에 도시가 많을수록 건설에 필요한 [ICON_PRODUCTION]생산이 증가합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_FINANCE_CENTER_HELP';

-- 증권거래소
UPDATE Language_ko_KR
SET Text = '[ICON_CITIZEN]시민 2명마다 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 소도시 및 마을의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE][ICON_GOLD]골드로 유닛을 구매하거나 건물 건설에 투자하는 비용이 [COLOR_POSITIVE_TEXT]20%[ENDCOLOR] 감소합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_STOCK_EXCHANGE_HELP';

-- 엠파이어스테이트 빌딩
UPDATE Language_ko_KR
SET Text = '[COLOR_PLAYER_NETHERLANDS_BACKGROUND]증권거래소[ENDCOLOR]를 무료로 제공합니다.무료 [COLOR_YELLOW]원하는 [ICON_GREAT_PEOPLE]위인[ENDCOLOR]이 1명 출현합니다. 모든 전문가의 [ICON_GOLD] 골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'
WHERE Tag = 'TXT_KEY_BUILDING_EMPIRE_STATE_BUILDING_HELP';

-- 크렘린
UPDATE Language_ko_KR
SET Text = '[COLOR_MAGENTA]무료 정책[ENDCOLOR] 1개를 제공합니다. 기갑 유닛을 생산할 때 [ICON_PRODUCTION]생산 보너스를 [COLOR_POSITIVE_TEXT]33%[ENDCOLOR] 제공합니다. [NEWLINE][NEWLINE][ICON_PRODUCTION]/[ICON_FOOD]낙후에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.[NEWLINE][NEWLINE][ICON_IDEOLOGY_ORDER][COLOR_MAGENTA]질서[ENDCOLOR] 이념을 채택해야 건설할 수 있습니다.  [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'
WHERE Tag = 'TXT_KEY_WONDER_KREMLIN_HELP';

-- 군수창고
UPDATE Language_ko_KR
SET Text = '도시의 [ICON_RANGE_STRENGTH]원거리 공격 범위가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 이 도시에 주둔한 유닛은 체력을 추가 [COLOR_POSITIVE_TEXT]5[ENDCOLOR] 더 회복합니다. [ICON_SILVER_FIST] 인구수에 따른 지역 군사 보급 한도가 [COLOR_POSITIVE_TEXT]5%[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE] [ICON_CITY_STATE] 도시 규모 요구치가 [COLOR_POSITIVE_TEXT]5%[ENDCOLOR] 감소합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_ARSENAL_HELP';

-- 연구소
UPDATE Language_ko_KR
SET Text = '도시의 공장, 병원, 의학 연구소 및 아카데미의 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]4[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][ICON_GREAT_SCIENTIST]위대한 과학자 출현율이 [COLOR_POSITIVE_TEXT]33%[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE][ICON_RESEARCH]문맹에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.[NEWLINE][ICON_RES_OIL] 석유: [ICON_RESEARCH]과학 +4[NEWLINE][ICON_RES_ALUMINUM]알루미늄 : [ICON_RESEARCH]과학 +4[NEWLINE][ICON_RES_URANIUM]우라늄 : [ICON_RESEARCH]과학 +4'
WHERE Tag = 'TXT_KEY_BUILDING_LABORATORY_HELP';

-- 구세주 그리스도상
UPDATE Language_ko_KR
SET Text = '이 불가사의가 지어진 도시의 [ICON_TOURISM]관광이 [COLOR_POSITIVE_TEXT]25[ENDCOLOR] 증가합니다. 모든 호텔의 [ICON_CULTURE]문화, [ICON_TOURISM]관광, [ICON_GOLDEN_AGE]황금기 점수가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'
WHERE Tag = 'TXT_KEY_WONDER_CRISTO_REDENTOR_HELP';

-- 제련소
UPDATE Language_ko_KR
SET Text = '[ICON_RES_IRON]철, [ICON_RES_COAL]석탄, [ICON_RES_OIL]석유 각 [COLOR_POSITIVE_TEXT]1개[ENDCOLOR]씩 제공합니다.[NEWLINE][NEWLINE]이 건물은 문명당 [COLOR_YELLOW]최대 5개[ENDCOLOR]까지 건설할 수 있습니다.'
WHERE Tag = 'TXT_KEY_BUILDING_COAL_PLANT_HELP';

-- 문화 과학 궁전
UPDATE Language_ko_KR
SET Text = '도시의 [ICON_CULTURE]문화와 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]5%[ENDCOLOR] 증가합니다. 다른 문명과 맺은 모든 [COLOR_POSITIVE_TEXT]연구 협약[ENDCOLOR] 1개마다 세계 의회 추가 [COLOR_YELLOW]대표단[ENDCOLOR]을 1명 확보합니다.[NEWLINE][NEWLINE][ICON_IDEOLOGY_ORDER][COLOR_MAGENTA]질서[ENDCOLOR] 이념을 채택해야 건설할 수 있습니다. [NEWLINE][NEWLINE]도시에 공립 학교가 있어야 건설할 수 있습니다. 문명에 도시가 많을수록 건설에 필요한 [ICON_PRODUCTION]생산이 증가합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_PALACE_SCIENCE_CULTURE_HELP';

-- 방송탑
UPDATE Language_ko_KR
SET Text = '[ICON_CITIZEN]시민 2명마다 [ICON_CULTURE]문화와 [ICON_TOURISM]관광이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [ICON_GREAT_WORK]걸작에서 오는 [ICON_TOURISM]관광이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. [ICON_GREAT_WORK]걸작 음악 슬롯 [COLOR_POSITIVE_TEXT]2개[ENDCOLOR]를 포함합니다. [NEWLINE][NEWLINE][ICON_CULTURE]무료에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]테마[ENDCOLOR]보너스:  [ICON_GOLD]골드 +10'
WHERE Tag = 'TXT_KEY_BUILDING_BROADCAST_TOWER_HELP'  AND NOT EXISTS (SELECT * FROM Units WHERE TYPE = 'UNIT_EE_SKIRMISHER');

-- 브로드웨이
UPDATE Language_ko_KR
SET Text = '무료 [ICON_GREAT_MUSICIAN][COLOR_YELLOW]위대한 음악가[ENDCOLOR]가 1명 출현합니다. [ICON_VP_GREATMUSIC]걸작 음악 슬롯 [COLOR_POSITIVE_TEXT]3개[ENDCOLOR]를 포함합니다. 이 불가사의가 지어지면 [ICON_CULTURE]문화를 [COLOR_POSITIVE_TEXT]250[ENDCOLOR] [COLOR:105:105:105:255](시대별 보정)[ENDCOLOR] 제공합니다.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]테마[ENDCOLOR]보너스:  [ICON_GOLD]골드 +20[ENDCOLOR][NEWLINE][NEWLINE][COLOR_MAGENTA]산업[ENDCOLOR] 정책을 완성해야 건설할 수 있습니다. '
WHERE Tag = 'TXT_KEY_WONDER_BROADWAY_HELP';

-- 외무성
UPDATE Language_ko_KR
SET Text = '외교 유닛을 생산할 때 [ICON_PRODUCTION]생산 보너스를 [COLOR_POSITIVE_TEXT]20%[ENDCOLOR] 제공합니다. 모든 외교 유닛에 [COLOR_PLAYER_PURPLE]면책 특권[ENDCOLOR] 승급을 부여합니다.[NEWLINE][NEWLINE][ICON_RES_PAPER]종이를 [COLOR_POSITIVE_TEXT]1개[ENDCOLOR] 제공합니다. [NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]통신사[ENDCOLOR]가 있어야 건설할 수 있습니다. 문명에 도시가 많을수록 건설에 필요한 [ICON_PRODUCTION]생산이 증가합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_FOREIGN_OFFICE_HELP';

-- 프로라
UPDATE Language_ko_KR
SET Text = '[COLOR_MAGENTA]무료 정책[ENDCOLOR] 1개를 제공합니다. 채택한 정책 2개마다 [ICON_CAPITAL]수도의 [ICON_HAPPINESS_1]행복이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]유닛이 타일을 약탈할 때 [ICON_CULTURE]문화를 [COLOR_POSITIVE_TEXT]25[ENDCOLOR] [COLOR:105:105:105:255](시대별 보정)[ENDCOLOR] 제공합니다.[NEWLINE][NEWLINE][ICON_IDEOLOGY_AUTOCRACY][COLOR_MAGENTA]독재[ENDCOLOR] 이념을 채택해야 건설할 수 있습니다. [NEWLINE][NEWLINE][COLOR_YELLOW]해안 도시[ENDCOLOR]에만 건설할 수 있습니다. [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'
WHERE Tag = 'TXT_KEY_WONDER_PRORA_RESORT_HELP';

-- 의학 연구소
UPDATE Language_ko_KR
SET Text = '건설을 완료하면 [ICON_CITIZEN]시민이 [COLOR_POSITIVE_TEXT]2명[ENDCOLOR]이 즉시 증가하고, 도시에 있는 [ICON_CITIZEN]시민당 [ICON_RESEARCH]과학을 [COLOR_POSITIVE_TEXT]50[ENDCOLOR] 획득합니다. [ICON_CITIZEN]시민이 증가할 때 사용한 [ICON_FOOD]식량의 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR]를 저장합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_MEDICAL_LAB_HELP';

-- 경기장
UPDATE Language_ko_KR
SET Text = '건설을 완료하면 모든 도시 국가에 대한 [ICON_INFLUENCE] 영향력을 [COLOR_POSITIVE_TEXT]20[ENDCOLOR] 증가시킵니다. [ICON_CITIZEN]시민 2명마다 [ICON_GOLDEN_AGE]황금기 점수가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]세계 불가사의, 자연 경관 및 타일 시설이 제공하는 [ICON_CULTURE]문화의 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR]가 도시의 [ICON_TOURISM]관광에 추가됩니다.[ICON_GREAT_WORK]걸작에서 오는 [ICON_TOURISM]관광이 [COLOR_POSITIVE_TEXT]50%[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]동물원[ENDCOLOR]이 있어야 건설할 수 있습니다.'
WHERE Tag = 'TXT_KEY_BUILDING_STADIUM_HELP';

-- 펜타곤
UPDATE Language_ko_KR
SET Text = '무료 [COLOR_YELLOW]제트기[ENDCOLOR]가 2개 출현합니다. 공중 유닛을 생산할 때 [ICON_PRODUCTION]생산 보너스를 [COLOR_POSITIVE_TEXT]50%[ENDCOLOR] 제공합니다. 이 불가사의가 지어진 도시에서 생산하는 공중 유닛의 경험치가 [COLOR_POSITIVE_TEXT]20[ENDCOLOR] 증가합니다. [ICON_SILVER_FIST] 전역 군사 보급 한도가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR], 공중 유닛 정원이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다.  [NEWLINE][NEWLINE][COLOR_MAGENTA]제국주의[ENDCOLOR] 정책을 완성해야 건설할 수 있습니다.  [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'
WHERE Tag = 'TXT_KEY_WONDER_PENTAGON_HELP' AND NOT EXISTS (SELECT * FROM Units WHERE TYPE = 'UNIT_EARLYJET');

-- 어머니 조국상
UPDATE Language_ko_KR
SET Text = '[COLOR_PLAYER_NETHERLANDS_BACKGROUND]경찰서[ENDCOLOR]를 무료로 제공합니다. 적 유닛이 [ICON_RAZING]약탈할 때 [ICON_GOLD]골드 획득과 체력 회복을 막습니다. [ICON_SILVER_FIST]인구수에 따른 지역 군사 보급 한도가 [COLOR_POSITIVE_TEXT]100%[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]모든 도시의 건물 [ICON_GOLD]유지 비용이 [COLOR_POSITIVE_TEXT] 10%[ENDCOLOR] 감소합니다.  [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'
WHERE Tag = 'TXT_KEY_WONDER_MOTHERLAND_STATUE_HELP';

-- 국가 정보국
UPDATE Language_ko_KR
SET Text = '[ICON_SPY] 도시 보안이 +10 증가하고 [ICON_VP_SPY_POINTS] 스파이 포인트를 100 제공합니다. 아군 스파이의 작전 기간이 1턴 감소하고 외국 스파이의 작전 기간이 2턴 증가합니다. 스파이를 체포하거나, 발견하거나 스파이 작전을 성공하면 [ICON_RESEARCH]과학과 [ICON_GOLD]골드를 [COLOR_POSITIVE_TEXT]100[ENDCOLOR] [COLOR:105:105:105:255](시대별 보정)[ENDCOLOR] 제공합니다. 도시 국가에서 선거 조작에 성공하면 [ICON_RESEARCH]과학과 [ICON_GOLD]골드를 [COLOR_POSITIVE_TEXT]25[ENDCOLOR] [COLOR:105:105:105:255](시대별 보정)[ENDCOLOR] 제공합니다. 존재하는 모든 [ICON_SPY]스파이의 레벨이 상승합니다. [NEWLINE][NEWLINE]모든 도시의 [ICON_FOOD]/[ICON_PRODUCTION]낙후로 인한 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다. [NEWLINE][NEWLINE]문명에 도시가 많을수록 건설에 필요한 [ICON_PRODUCTION]생산과 [ICON_CITIZEN]시민이 증가합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_INTELLIGENCE_AGENCY_HELP';

-- 블레츠리파크
UPDATE Language_ko_KR
SET Text = '[COLOR_PLAYER_NETHERLANDS_BACKGROUND]연구소[ENDCOLOR]를 무료로 제공합니다. 모든 [ICON_VP_SCIENTIST] 과학자의 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE][ICON_VP_SPY_POINTS] 스파이 포인트를 200 제공합니다. 모든 도시의 도시 [ICON_SPY] 보안이 [COLOR_POSITIVE_TEXT]20[ENDCOLOR] 증가합니다. 아군 스파이의 작전 기간이 2턴 감소하고 외국 스파이의 작전 기간이 2턴 증가합니다. [NEWLINE][NEWLINE][COLOR_MAGENTA]합리[ENDCOLOR] 정책을 완성해야 건설할 수 있습니다.  [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'
WHERE Tag = 'TXT_KEY_BUILDING_BLETCHLEY_PARK_HELP';

-- 군사기지
UPDATE Language_ko_KR
SET Text = '도시 공습을 하는 공중 유닛에게 주는 [ICON_STRENGTH]피해가 [COLOR_POSITIVE_TEXT]15[ENDCOLOR] 증가합니다. 도시의 원거리 전투력이 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR] 증가합니다. 이 도시에 주둔한 유닛은 체력을 추가 [COLOR_POSITIVE_TEXT]20[ENDCOLOR] 더 회복합니다. 공중 유닛을 생산할 때 [ICON_PRODUCTION]생산 보너스를 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR] 제공합니다. [ICON_SILVER_FIST] 인구수에 따른 지역 군사 보급 한도가 [COLOR_POSITIVE_TEXT]20%[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][ICON_FOOD]/[ICON_PRODUCTION]낙후에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소하고 [ICON_CITY_STATE] 도시 규모 요구치가 [COLOR_POSITIVE_TEXT]5%[ENDCOLOR] 감소합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_MILITARY_BASE_HELP';

-- CN Tower
UPDATE Language_ko_KR
SET Text = '[COLOR_PLAYER_NETHERLANDS_BACKGROUND]방송탑[ENDCOLOR]을 무료로 제공합니다. 모든 도시의 [ICON_HAPPINESS_1]행복이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 모든 도시의 [ICON_GREAT_WORK]걸작에서 오는 [ICON_GOLD]골드와 [ICON_TOURISM]관광이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE][ICON_WONDER] 세계 불가사의 및 타일이 제공하는 [ICON_CULTURE]문화의 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR]가 [ICON_TOURISM]관광에 추가되고, 이 도시에서는 추가로 [COLOR_POSITIVE_TEXT] 25%[ENDCOLOR]를 얻습니다. 모든 도시의 [ICON_GREAT_WORK]걸작에서 오는 [ICON_TOURISM]관광이 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR] 증가하고, 이 도시에서는 추가로 25%가 증가합니다. [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'
WHERE Tag = 'TXT_KEY_WONDER_CN_TOWER_HELP';

-- 자료관
UPDATE Language_ko_KR
SET Text = '[ICON_WONDER] 세계 불가사의 및 타일이 제공하는 [ICON_CULTURE]문화의 [COLOR_POSITIVE_TEXT]50%[ENDCOLOR]가 도시의 [ICON_TOURISM]관광에 추가됩니다. 문명의 모든 [COLOR_POSITIVE_TEXT]랜드마크[ENDCOLOR]의 [ICON_CULTURE] 문화와 [ICON_TOURISM] 관광이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_INTERPRETIVE_CENTER_HELP';

-- 시드니 오페라하우스
UPDATE Language_ko_KR
SET Text = '[COLOR_MAGENTA]무료 정책[ENDCOLOR] 1개를 제공합니다. 이 불가사의가 지어진 도시의 [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR] 증가합니다. [ICON_VP_GREATMUSIC]걸작 음악 슬롯 [COLOR_POSITIVE_TEXT]2개[ENDCOLOR]를 포함합니다.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]테마[ENDCOLOR]보너스:  [ICON_CULTURE]문화 +15[NEWLINE][NEWLINE][COLOR_YELLOW]해안 도시[ENDCOLOR]에만 건설할 수 있습니다. [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'
WHERE Tag = 'TXT_KEY_WONDER_SYDNEY_OPERA_HOUSE_HELP';

-- 인터넷 검열시스템
UPDATE Language_ko_KR
SET Text = '모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]연구소[ENDCOLOR]의 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]10[ENDCOLOR] 증가합니다.[ICON_SPY] 도시 보안이 +50 증가합니다. [NEWLINE][NEWLINE]다른 문명의 기술이 [ICON_TOURISM]관광에 끼치는 영향을 [COLOR_POSITIVE_TEXT]무효화[ENDCOLOR] 합니다. [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'
WHERE Tag = 'TXT_KEY_BUILDING_GREAT_FIREWALL_HELP';

-- 수력 발전소
UPDATE Language_ko_KR
SET Text = '모든 도시가 [ICON_PRODUCTION]생산을 다른 산출량으로 전환할 때의 효율성이 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]강, 호수 타일의 [ICON_PRODUCTION]생산, [ICON_GOLD]골드, [ICON_FOOD]식량이 [COLOR_POSITIVE_TEXT]3[ENDCOLOR]씩 증가합니다. [NEWLINE][NEWLINE]수력발전소는 오직 [COLOR_YELLOW]강과 인접한 도시[ENDCOLOR]에서만 건설할 수 있습니다. [ICON_RES_ALUMINUM] 알루미늄 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR]가 필요합니다. 도시에 다른 [COLOR_NEGATIVE_TEXT]발전소[ENDCOLOR]가 없어야 건설할 수 있습니다.'
WHERE Tag = 'TXT_KEY_BUILDING_HYDRO_PLANT_HELP';

-- 원자력 발전소
UPDATE Language_ko_KR
SET Text = '모든 도시가 [ICON_PRODUCTION]생산을 다른 산출량으로 전환할 때의 효율성이 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]도시의 [ICON_GREAT_PEOPLE]위인 출현율이 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR] 증가합니다. 모든 전문가의 [ICON_PRODUCTION]생산, [ICON_GOLD]골드, [ICON_RESEARCH]과학, [ICON_CULTURE]문화 산출량이 추가로 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]씩 증가합니다.[NEWLINE][NEWLINE][ICON_RES_URANIUM]우라늄 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR]가 필요합니다. 도시에 다른 [COLOR_NEGATIVE_TEXT]발전소[ENDCOLOR]가 없어야 건설할 수 있습니다.'
WHERE Tag = 'TXT_KEY_BUILDING_NUCLEAR_PLANT_HELP';

-- 태양열 발전소
UPDATE Language_ko_KR
SET Text = '모든 도시가 [ICON_PRODUCTION]생산을 다른 산출량으로 전환할 때의 효율성이 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE]사막 타일의 [ICON_PRODUCTION] 생산과 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]3[ENDCOLOR] 증가하고 다른 지상 타일의 [ICON_PRODUCTION]생산과 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][ICON_RES_ALUMINUM]알루미늄 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR]가 필요합니다. 도시에 다른 [COLOR_NEGATIVE_TEXT]발전소[ENDCOLOR]가 없어야 건설할 수 있습니다.'
WHERE Tag = 'TXT_KEY_BUILDING_SOLAR_PLANT_HELP';

-- 풍력 발전소
UPDATE Language_ko_KR
SET Text = '모든 도시가 [ICON_PRODUCTION]생산을 다른 산출량으로 전환할 때의 효율성이 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]모든 작업 가능한 타일(평지, 언덕, 해양 타일)의 [ICON_PRODUCTION]생산, [ICON_GOLD]과학, [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]씩 증가합니다. [NEWLINE][NEWLINE][ICON_RES_ALUMINUM]알루미늄 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR]가 필요합니다. 도시에 다른 [COLOR_NEGATIVE_TEXT]발전소[ENDCOLOR]가 없어야 건설할 수 있습니다'
WHERE Tag = 'TXT_KEY_BUILDING_WIND_PLANT_HELP';

-- 조력 발전소
UPDATE Language_ko_KR
SET Text = '모든 도시가 [ICON_PRODUCTION]생산을 다른 산출량으로 전환할 때의 효율성이 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]모든 해상 타일의 [ICON_PRODUCTION]생산, [ICON_RESEARCH]과학, [ICON_FOOD]식량, [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT] 2 [ENDCOLOR]씩 증가합니다. [NEWLINE][NEWLINE][ICON_RES_ALUMINUM]알루미늄 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR]가 필요합니다. 해안에만 건설할 수 있습니다. 도시에 다른 [COLOR_NEGATIVE_TEXT]발전소[ENDCOLOR]가 없어야 건설할 수 있습니다.'
WHERE Tag = 'TXT_KEY_BUILDING_TIDAL_PLANT_HELP';

--=================================
-- 4uc ua fixed
--=================================
--[[인도네시아]]
-- 찬디
UPDATE Language_ko_KR
SET Text = '"국왕 경축일"이 열리는 동안 도시의 [ICON_PEACE]신앙 및 [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR] 증가합니다. 건물이 완성되면 도시 근처에 [ICON_RES_CLOVES]정향 [ICON_RES_PEPPER]후추 [ICON_RES_NUTMEG]육두구 자원이 출현합니다. [NEWLINE][NEWLINE][ICON_GREAT_PEOPLE]위인 출현율이 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]전문가 [COLOR_POSITIVE_TEXT]1명[ENDCOLOR]이 더이상 [ICON_URBANIZATION] 도시화에서 오는 [ICON_HAPPINESS_3]불행을 증가시키지 않습니다. [NEWLINE][NEWLINE]오아시스: [ICON_GOLD]골드 +2[NEWLINE][ICON_RES_CITRUS] 감귤: [ICON_FOOD]식량 +1 [ICON_GOLD]골드 +1[NEWLINE][ICON_RES_COCOA] 코코아: [ICON_FOOD]식량 +1 [ICON_GOLD]골드 +1[NEWLINE][ICON_RES_CLOVES] 정향: [ICON_PEACE] 신앙 +1 [ICON_CULTURE]문화 +1.[NEWLINE][ICON_RES_PEPPER] 후추: [ICON_PEACE]신앙 +1 [ICON_GOLD]골드 +1.[NEWLINE][ICON_RES_NUTMEG] 육두구: [ICON_CULTURE] 문화 +1 [ICON_PRODUCTION] 생산 +1'
WHERE Tag = 'TXT_KEY_BUILDING_CANDI_HELP';

--[[ 인도 ]]
-- 나가-말라
UPDATE Language_ko_KR
SET Text = '{TXT_KEY_DESC_CUIRASSIER}을 대체하는 인도의 고유 유닛입니다. [ICON_MOVES] 이동력 2와 [COLOR_NEGATIVE_TEXT]{TXT_KEY_PROMOTION_SKIRMISHER_DOCTRINE}[ENDCOLOR] 승급을 잃는 대신 [ICON_STRENGTH] 전투력과 [ICON_RANGE_STRENGTH] 원거리 전투력이 강하며, 주변 적 유닛의 [ICON_STRENGTH] 전투력을 감소시킵니다. [COLOR_POSITIVE_TEXT]{TXT_KEY_PROMOTION_ACCURACY_1}[ENDCOLOR] 승급을 보유합니다. [NEWLINE][NEWLINE][ICON_RES_HORSE] {TXT_KEY_RESOURCE_HORSES}을 요구하지 않습니다. '
WHERE Tag = 'TXT_KEY_UNIT_HELP_INDIAN_WAR_ELEPHANT';
-- 하라파 저수지
UPDATE Language_ko_KR
SET Text = '도시의 [ICON_RELIGION] 대중 종교를 믿는 신도 1명마다 [ICON_FOOD] 식량이 +1% 증가합니다. 농장의 [ICON_FOOD]식량과 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE][ICON_CITIZEN]도시 주변 오아시스 및 호수 타일의 [ICON_FOOD]식량이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. [ICON_CITIZEN]시민이 증가할 때 사용한 [ICON_FOOD]식량의 [COLOR_POSITIVE_TEXT]20%[ENDCOLOR]가 저장됩니다. 시민이 증가할 때 현재 [ICON_PRODUCTION]생산 산출량의 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR]를 즉시 제공합니다. [NEWLINE][NEWLINE][ICON_GOLD]빈곤에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_INDUS_CANAL_HELP';


-- [[스웨덴]]
-- 스콜라
UPDATE Language_ko_KR
SET Text = '[ICON_CITIZEN]시민 2명마다 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]3[ENDCOLOR] [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE][ICON_RESEARCH]문맹에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_SKOLA_HELP';

-- [[프랑스]]
-- 샤토
UPDATE Language_ko_KR
SET Text = '해당 타일의 [ICON_CULTURE]문화, [ICON_GOLD]골드, [ICON_FOOD]식량이 증가합니다. 주둔 시 [ICON_STRENGTH]방어력 보너스가 [COLOR_POSITIVE_TEXT]50%[ENDCOLOR] 증가합니다. [COLOR_POSITIVE_TEXT]요새[ENDCOLOR] 역할을 제공해, 공격 후에도 그 타일에 계속 주둔할 수 있습니다. [NEWLINE][NEWLINE]사치 자원과 인접한 타일에만 건설할 수 있습니다. 다른 {TXT_KEY_IMPROVEMENT_CHATEAU}와 서로 인접하여 건설할 수 없습니다.'
WHERE Tag = 'TXT_KEY_CIV5_IMPROVEMENTS_CHATEAU_HELP';

-- [[바빌론]]
-- 바빌론 성벽
UPDATE Language_ko_KR
SET Text = '[ICON_GREAT_SCIENTIST]위대한 과학자를 기술 연구에 소모할 때 [ICON_RESEARCH] 과학이 추가로 [COLOR_POSITIVE_TEXT]5%[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]도시의 [ICON_RANGE_STRENGTH]원거리 공격 범위가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.  [ICON_SILVER_FIST] 인구수에 따른 지역 군사 보급 한도가 [COLOR_POSITIVE_TEXT]5%[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]도시의 [ICON_CITY_STATE] 도시 규모 요구치가 [COLOR_POSITIVE_TEXT]5%[ENDCOLOR] 감소합니다. '
WHERE Tag = 'TXT_KEY_CIV5_BABYLON_WALLS_INFO';

-- [[페르시아]]
-- [[카르타고]]
-- 위대한 코튼
UPDATE Language_ko_KR
SET Text = '모든 해안도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]{TXT_KEY_BUILDING_HARBOR}[ENDCOLOR]을 무료로 제공합니다. 추가 [ICON_INTERNATIONAL_TRADE][COLOR_YELLOW]교역로[ENDCOLOR]를 2개 제공합니다. 모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]항만[ENDCOLOR]의 [ICON_PRODUCTION] 생산이 [COLOR_POSITIVE_TEXT]3[ENDCOLOR] 증가하고, 모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]등대[ENDCOLOR]의 [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]이 도시의 모든 사치 자원을 추가로 한 개씩 [COLOR_POSITIVE_TEXT]복제[ENDCOLOR]합니다. 이 도시로 향하는 [ICON_ARROW_LEFT] 교역로마다 도시의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]5[ENDCOLOR] 증가하고 [ICON_ARROW_RIGHT] 교역로를 개설한 상대 문명의 [ICON_GOLD]골드도 [COLOR_POSITIVE_TEXT]3[ENDCOLOR] 증가합니다. [ICON_INTERNATIONAL_TRADE]교역로의 자원 다양성 수치가 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][ICON_GOLD] 빈곤으로 인한 [ICON_HAPPINESS_3] 불행이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 감소하고, 다른 모든 도시에서 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다. [NEWLINE][NEWLINE]문명에 도시가 많을수록 건설에 필요한 [ICON_PRODUCTION] 생산과 [ICON_CITIZEN] 시민이 증가합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_GREAT_COTHON_HELP' AND NOT EXISTS (SELECT * FROM Units WHERE TYPE = 'UNIT_EE_SKIRMISHER');
-- [[이집트]]
-- 왕가의 무덤
UPDATE Language_ko_KR
SET Text = '[ICON_GREAT_WORK] 위대한 예술품 또는 [ICON_VP_ARTIFACT]유물 슬롯 [COLOR_POSITIVE_TEXT]1개[ENDCOLOR]를 포함합니다. 건물이 완성되면 도시에 이집트 고유의 [ICON_VP_ARTIFACT] 유물을 제공합니다.[NEWLINE][NEWLINE]이 도시에서 다른 문명으로 출발하는 육상 [ICON_CARAVAN]교역로가 완료되면 [COLOR_POSITIVE_TEXT]역사적 사건[ENDCOLOR]을 발동시킵니다.[NEWLINE][NEWLINE]도시 주변 사막 또는 툰드라 타일 1.5개마다 [ICON_FOOD]식량 및 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [ICON_CARAVAN] 도시의 육상 교역로 범위가 [COLOR_POSITIVE_TEXT]50%[ENDCOLOR] 증가하고 교역로의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]3[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][ICON_RES_TRUFFLES] 송로버섯: [ICON_GOLD]골드 +2[NEWLINE][ICON_RES_COTTON] 면: [ICON_PRODUCTION]생산 +1 [ICON_CULTURE]문화 +1[NEWLINE][ICON_RES_FUR] 모피: [ICON_GOLD]골드 +1 [ICON_PRODUCTION]생산 +1'
WHERE Tag = 'TXT_KEY_BUILDING_BURIAL_TOMB_HELP';

-- [[시암]]
-- 나레수안 코끼리
UPDATE Language_ko_KR
SET Text = '{TXT_KEY_UNIT_KNIGHT}를 대체하는 시암의 고유 유닛입니다. 기마 유닛 상대로 강하며 {TXT_KEY_UNIT_GREAT_GENERAL}과 겹쳐 있을 때 [ICON_STRENGTH] 전투력 보너스를 얻습니다. [ICON_MOVES] [COLOR_NEGATIVE_TEXT]이동력[ENDCOLOR] 1이 낮은 대신 근처 적의 [ICON_STRENGTH] 전투력을 감소시킵니다. [NEWLINE][NEWLINE][ICON_RES_HORSE] {TXT_KEY_RESOURCE_HORSES}을 요구하지 않습니다. '
WHERE Tag = 'TXT_KEY_UNIT_HELP_SIAMESE_WARELEPHANT';
-- 와트
UPDATE Language_ko_KR
SET Text = '도시의 성소 및 사원의 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]3[ENDCOLOR] 증가하고 이 도시에서 생산된 외교 유닛이 [ICON_INFLUENCE] +10 영향력을 얻습니다. [NEWLINE][NEWLINE]도시 보안이 25 증가하고, [ICON_CITIZEN] 시민 2명마다 1씩 추가로 증가합니다. [NEWLINE][NEWLINE][ICON_FOOD]/[ICON_PRODUCTION]낙후에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_WAT_HELP';
-- [[포르투갈]]

-- [[오스트리아]]

-- [[아즈텍]]

-- [[켈트]]
UPDATE Language_ko_KR
SET Text = '기마궁수를 대체하는 켈트의 고유 유닛입니다. 근접 유닛과 궁병 유닛에 더 강력합니다. 이동 후 새로 인접한 적 유닛에 피해를 줍니다. 산병보다 이동력이 더 적고 험지에서 이동력 페널티를 받습니다.'
WHERE Tag = 'TXT_KEY_UNIT_CELTS_SCYTHED_CHARIOT_HELP';

UPDATE Language_ko_KR
SET Text = '[ICON_VP_GREATMUSIC] 걸작 음악 슬롯을 [COLOR_POSITIVE_TEXT]1개[ENDCOLOR] 포함합니다. [NEWLINE][NEWLINE]건설을 완료하면 도시에 [ICON_CULTURE]문화를 [COLOR_POSITIVE_TEXT]150[ENDCOLOR] 제공하고 [COLOR_POSITIVE_TEXT]15턴[ENDCOLOR] 동안 "국왕 경축일"을 맞이합니다. [NEWLINE][NEWLINE][ICON_CULTURE]무료에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.[NEWLINE][NEWLINE][ICON_RES_IVORY] 상아: [ICON_CULTURE]문화 +3'
WHERE Tag = 'TXT_KEY_BUILDING_CEILIDH_HALL_HELP';

-- [[독일]]

-- [[네덜란드]]

-- [[줄루]]
-- 이칸다
UPDATE Language_ko_KR
SET Text = '근접 및 화약 유닛에게 [COLOR_PLAYER_PURPLE]버팔로[ENDCOLOR] 승급 트리를 부여합니다. [NEWLINE][NEWLINE]도시에서 생산하는 모든 유닛의 경험치가 [COLOR_POSITIVE_TEXT]15[ENDCOLOR] 증가합니다. [ICON_WAR] 지역 군사 유닛 보급 한도가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE][ICON_FOOD]/[ICON_PRODUCTION]낙후에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_IKANDA_HELP';
-- [[한국]]
-- 서원
UPDATE Language_ko_KR
SET Text = '[ICON_GREAT_WORK] 걸작과 근처 위인 타일에서 오는 [ICON_PRODUCTION] 생산 및 [ICON_RESEARCH] 과학이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]도시 주변 정글 타일과 설원 타일의 [ICON_RESEARCH] 과학이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [ICON_CITIZEN] 시민이 증가할 때 현재 [ICON_RESEARCH] 과학 산출량의 [COLOR_POSITIVE_TEXT]50%[ENDCOLOR]를 즉시 제공합니다. [NEWLINE][NEWLINE][ICON_RESEARCH] 문맹에서 오는 [ICON_HAPPINESS_3] 불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_SEOWON_HELP';
-- [[오스만제국]]
-- 공성 주조 공장
UPDATE Language_ko_KR
SET Text = '공성 유닛을 생산할 때 [ICON_PRODUCTION]생산 보너스를 [COLOR_POSITIVE_TEXT]50%[ENDCOLOR] 제공하고, 도시에서 생산하는 모든 공성 유닛에 [COLOR_PLAYER_PURPLE]{TXT_KEY_PROMOTION_VOLLEY}[ENDCOLOR] 승급을 부여합니다. 도시에서 유닛을 생산할 때 유닛 [ICON_PRODUCTION]생산 비용의 [COLOR_POSITIVE_TEXT]20%[ENDCOLOR]를 [ICON_RESEARCH]과학으로 전환합니다.[NEWLINE][NEWLINE]광산의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE][ICON_RES_IRON] 철: [ICON_PRODUCTION]생산 +1 [ICON_GOLD]골드 +1[NEWLINE][ICON_RES_COPPER] 구리: [ICON_GOLD]골드 +2'
WHERE Tag = 'TXT_KEY_BUILDING_SIEGE_WORKSHOP_HELP';

-- [[아시리아]]
-- 왕립도서관
UPDATE Language_ko_KR
SET Text = '[COLOR_PLAYER_NETHERLANDS_BACKGROUND]{TXT_KEY_BUILDING_LIBRARY}[ENDCOLOR]을 무료로 제공합니다. [ICON_VP_GREATWRITING][COLOR_YELLOW]걸작 문학[ENDCOLOR] 1개를 무료로 제공합니다. 모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]도서관[ENDCOLOR]의 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]3[ENDCOLOR] 증가합니다. [ICON_CITIZEN]시민 2명마다 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 당신의 문명이 통제하고 있는 모든 [ICON_VP_GREATWRITING]걸작 문학마다 모든 도시에서 생산하는 유닛의 경험치가 [COLOR_POSITIVE_TEXT]5[ENDCOLOR] [COLOR:105:105:105:255](한도: 45)[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE][ICON_GOLDEN_AGE]황금기 동안 도시의 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]20%[ENDCOLOR] 증가합니다. [ICON_VP_GREATWRITING]걸작 문학 슬롯 [COLOR_POSITIVE_TEXT]3개[ENDCOLOR]를 포함합니다.[NEWLINE][NEWLINE]모든 도시의 [ICON_RESEARCH] 문맹에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다. 전문가 [COLOR_POSITIVE_TEXT]1명[ENDCOLOR]이 더이상 [ICON_URBANIZATION] 도시화에서 오는 [ICON_HAPPINESS_3]불행을 증가시키지 않습니다.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]테마[ENDCOLOR]보너스:  [ICON_PRODUCTION]생산 +3, [ICON_RESEARCH]과학 +3[NEWLINE][NEWLINE]문명에 도시가 많을수록 건설에 필요한 [ICON_PRODUCTION]생산과 [ICON_CITIZEN]시민이 증가합니다. '
WHERE Tag = 'TXT_KEY_BUILDING_ROYAL_LIBRARY_HELP';

UPDATE Language_ko_KR
SET Text = '{TXT_KEY_BUILDING_NATIONAL_COLLEGE}을 대체하는 아시리아의 고유 건물입니다. 대체하는{TXT_KEY_BUILDING_NATIONAL_COLLEGE} 의 과학 산출 외에도, {TXT_KEY_BUILDING_ROYAL_LIBRARY_DESC}은 추가[ICON_RESEARCH] 과학과 [ICON_CULTURE] 문화를 생성하며 모든 도서관을 강화합니다. 세 개의 [ICON_VP_GREATWRITING] 작가 슬롯을 가지고, 걸작 문학 한 개와 도서관을 도시에 제공하며 더 이른 시기에 건설할 수 있습니다. 모든 도서관에 보너스를 제공하고, 모든 도시의 유닛이 걸작 문학의 개수에 비례해 경험치 보너스를 받습니다. (최대 45) {TXT_KEY_BUILDING_NATIONAL_COLLEGE}와 달리, {TXT_KEY_BUILDING_ROYAL_LIBRARY_DESC}는 [COLOR_CYAN]{TXT_KEY_TECH_WRITING_TITLE}[ENDCOLOR] 연구 시 생산할 수 있고, {TXT_KEY_BUILDING_LIBRARY}를 요구하는 대신 무료로 제공합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_ROYAL_LIBRARY_STRATEGY';

-- [[송가이]]

-- [[로마]]

-- [[훈]]

-- [[모로코]]
-- 카스바
UPDATE Language_ko_KR
SET Text = '인접한 어선의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가하고 인접한 해안 타일의 [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [ICON_STRENGTH]방어력 보너스를 [COLOR_POSITIVE_TEXT]30%[ENDCOLOR] 제공하고 인접한 적 유닛에 피해를 [COLOR_POSITIVE_TEXT]5[ENDCOLOR] 입힙니다. (중첩되지 않음) 사치 또는 전략 자원 위에 건설하면 해당 자원을 교역망과 연결할 수 있습니다. [NEWLINE][NEWLINE]도시에 인접해야만 건설할 수 있습니다.'
WHERE Tag = 'TXT_KEY_CIV5_IMPROVEMENTS_KASBAH_HELP';
-- [[그리스]]
-- 김나지움 / 아크로폴리스
UPDATE Language_ko_KR
SET Text = '적 유닛을 처치할 때 이 도시에 [ICON_CULTURE_LOCAL]국경 확장 점수를 [COLOR_POSITIVE_TEXT]5[ENDCOLOR] [COLOR:105:105:105:255](시대별 보정)[ENDCOLOR] 제공합니다. 유닛이 이 도시에서 생산 되었다면 추가로 [ICON_CULTURE]문화를 [COLOR_POSITIVE_TEXT]25[ENDCOLOR] [COLOR:105:105:105:255](시대별 보정)[ENDCOLOR] 제공합니다.[NEWLINE][NEWLINE][ICON_GREAT_WORK]걸작 문학 슬롯 [COLOR_POSITIVE_TEXT]2개[ENDCOLOR]를 포함합니다. [NEWLINE][NEWLINE][ICON_GREAT_WRITER]위대한 작가 출현율이 [COLOR_POSITIVE_TEXT]33%[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][ICON_RES_DYE] 염료: [ICON_CULTURE]문화 +1 [ICON_GOLD]골드 +1[NEWLINE][ICON_RES_SILK] 비단: [ICON_CULTURE]문화 +1 [ICON_GOLD]골드 +1[NEWLINE][ICON_RES_LAPIS] 청금석: [ICON_CULTURE]문화 +2[NEWLINE][ICON_RES_BRAZILWOOD] 브라질 소방목: [ICON_CULTURE]문화 +1, [ICON_GOLD]골드 +1[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]테마[ENDCOLOR]보너스: [ICON_CULTURE]문화 +2'
WHERE Tag = 'TXT_KEY_BUILDING_ODEON_HELP';
-- [[베네치아]]
-- 피아자 산 마르코
UPDATE Language_ko_KR
SET Text = '도시의 민간 유닛 구매 대기시간이 3턴으로 감소하고, 군사 유닛 구매 대기시간은 사라집니다. [ICON_WAR] 지역 군사 보급 한도가 [COLOR_POSITIVE_TEXT]5[ENDCOLOR] 증가합니다. [ICON_SPY] 도시 보안이 10 증가합니다.[NEWLINE][NEWLINE][COLOR_RESEARCH_STORED]{TXT_KEY_TECH_GUILDS_TITLE}[ENDCOLOR]를 연구하면 [COLOR_POSITIVE_TEXT]{TXT_KEY_BUILDING_MURANO_GLASSWORKS}[ENDCOLOR], [COLOR_POSITIVE_TEXT]{TXT_KEY_BUILDING_VENETIAN_ARSENALE}[ENDCOLOR], [COLOR_POSITIVE_TEXT]{TXT_KEY_BUILDING_RIALTO_DISTRICT}[ENDCOLOR] 중 하나를 건설할 수 있습니다.[NEWLINE][NEWLINE][ICON_CITIZEN] 시민이 증가할 때 [ICON_CULTURE] 문화를 [COLOR_POSITIVE_TEXT]15[ENDCOLOR][COLOR:105:105:105:255](시대별 보정)[ENDCOLOR] 제공하고, 정책을 채택할 때 [ICON_GOLDEN_AGE] 황금기 점수를 [COLOR_POSITIVE_TEXT]50[ENDCOLOR][COLOR:105:105:105:255](시대별 보정)[ENDCOLOR] 제공합니다. [ICON_GREAT_WORK]걸작 예술품 또는 [ICON_VP_ARTIFACT]유물 슬롯 [COLOR_POSITIVE_TEXT]1개[ENDCOLOR]를 포함합니다. [NEWLINE][NEWLINE][ICON_GREAT_PEOPLE]위인 출현율이 [COLOR_POSITIVE_TEXT]33%[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE]문명에 도시가 많을수록 건설에 필요한 [ICON_PRODUCTION]생산과 [ICON_CITIZEN]시민이 증가합니다. [NEWLINE][NEWLINE][ICON_CAPITAL] 수도[ENDCOLOR]에만 건설할 수 있습니다. '
WHERE Tag = 'TXT_KEY_BUILDING_PIAZZA_SAN_MARCO_HELP';

-- [[영국]]
-- 화이트 타워
UPDATE Language_ko_KR
SET Text = '모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]경찰대, 성, 무기고[ENDCOLOR]의 [ICON_CULTURE] 문화가 1 증가합니다. [ICON_VP_GREATART]걸작 예술품이 들어 있는 [ICON_GREAT_WORK]걸작 예술품 또는[ICON_VP_ARTIFACT]유물 슬롯을 [COLOR_POSITIVE_TEXT]1개[ENDCOLOR] 포함합니다. [NEWLINE][NEWLINE]스파이를 체포하거나, 발견하거나 스파이 작전이 성공하면 [ICON_RESEARCH]과학 및 [ICON_GOLD]골드를 [COLOR_POSITIVE_TEXT]40[ENDCOLOR] [COLOR:105:105:105:255](시대별 보정)[ENDCOLOR] 제공합니다. 도시 국가에서 선거 조작에 성공하면 [ICON_RESEARCH]과학 및 [ICON_GOLD]골드를 [COLOR_POSITIVE_TEXT]25[ENDCOLOR] [COLOR:105:105:105:255](시대별 보정)[ENDCOLOR] 제공합니다.[NEWLINE][NEWLINE]건설을 완료하면 [ICON_RESEARCH]과학 [COLOR_POSITIVE_TEXT]25[ENDCOLOR][COLOR:105:105:105:255](시대별 보정)[ENDCOLOR]를 제공합니다.[NEWLINE][NEWLINE][ICON_RES_IRON]철 2개를 [COLOR_POSITIVE_TEXT]무료[ENDCOLOR]로 제공합니다. [NEWLINE][NEWLINE]문명에 도시가 많을수록 건설에 필요한 [ICON_PRODUCTION] 생산과 [ICON_CITIZEN]시민이 증가합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_WHITE_TOWER_HELP';

-- [[러시아]]
-- 오스트로그
UPDATE Language_ko_KR
SET Text = '야영지, 광산, 제재소, 전략 자원 타일의 [ICON_PRODUCTION]생산 및 [ICON_GOLD] 골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 적 지상 유닛이 이 도시의 지상 타일에 진입할 때 [ICON_MOVES]이동력을 모두 소모합니다. [NEWLINE][NEWLINE]도시가 받는 모든 피해를 [COLOR_POSITIVE_TEXT] 2 [ENDCOLOR]감소시킵니다. 도시가 시야에 상관 없이 [ICON_RANGE_STRENGTH] 범위 공격을 할 수 있습니다. 주둔한 유닛이 체력을 추가로 [COLOR_POSITIVE_TEXT]5[ENDCOLOR] 회복합니다. [ICON_SILVER_FIST] 인구수에 따른 지역 군사 보급 한도가 [COLOR_POSITIVE_TEXT]5%[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE][ICON_CITY_STATE] 도시 규모 요구치가 [COLOR_POSITIVE_TEXT]5%[ENDCOLOR] 감소합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_KREPOST_HELP';
-- [[일본]]
-- 도조
UPDATE Language_ko_KR
SET Text = '도시에서 생산하는 모든 기마, 근접, 화약, 기갑 유닛에 [COLOR_PLAYER_PURPLE]무사도[ENDCOLOR] 진급을 부여합니다. 유닛이 얻은 경험치의 140% 만큼 [ICON_CULTURE]문화 및 [ICON_RESEARCH]과학을 제공합니다. [NEWLINE][NEWLINE] 도시에서 생산하는 모든 유닛의 경험치가 [COLOR_POSITIVE_TEXT]25[ENDCOLOR] 증가합니다. [ICON_WAR] 군사 유닛 보급 한도가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][ICON_FOOD]/[ICON_PRODUCTION]낙후에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_DOJO_HELP';


-- [[미국]]
-- 독립기념관
UPDATE Language_ko_KR
SET Text = '[ICON_CULTURE] 정책 채택에 필요한 문화가 [COLOR_POSITIVE_TEXT]5%[ENDCOLOR] 감소합니다. [NEWLINE][NEWLINE][ICON_CITIZEN]시민 4명마다 [ICON_CULTURE] 문화가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 도시의 [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR] 증가합니다. 걸작 예술품 슬롯 [COLOR_POSITIVE_TEXT]2개[ENDCOLOR]를 포함합니다. [NEWLINE][NEWLINE]모든 도시의 [ICON_CULTURE]무료로 인한 [ICON_HAPPINESS_3] 불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]테마[ENDCOLOR]보너스: [ICON_CULTURE]문화 +3, [ICON_GOLD]골드 +3[NEWLINE][NEWLINE] 문명에 도시가 많을수록 [ICON_PRODUCTION] 건설 비용과 [ICON_CITIZEN]시민이 증가합니다.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]슬레이터 밀[ENDCOLOR], [COLOR_POSITIVE_TEXT]미국 육군사관학교[ENDCOLOR], [COLOR_POSITIVE_TEXT]스미스소니언 협회[ENDCOLOR]를 [COLOR_CYAN]현대 시대[ENDCOLOR]에 지을 수 있습니다.'
WHERE Tag = 'TXT_KEY_BUILDING_AMERICA_INDEPENDENCEHALL_HELP';
-- 스미스소니언 협회
UPDATE Language_ko_KR
SET Text = '셋 중 [COLOR_NEGATIVE_TEXT]하나만[ENDCOLOR] 건설할 수 있는 미국의 고유 국가 불가사의입니다. 도시에 [COLOR_YELLOW]{TXT_KEY_BUILDING_AMERICA_INDEPENDENCEHALL}[ENDCOLOR]이 있어야 건설할 수 있습니다.[NEWLINE][NEWLINE]모든 도시에서 타일 [ICON_GOLD]구매 비용이 25% 감소합니다. 모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]박물관과 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]연구소[ENDCOLOR]에서 +5 [ICON_CULTURE]문화와 [ICON_RESEARCH]과학을 얻고, 모든 [ICON_WONDER] 세계 불가사의에서 +2 [ICON_CULTURE] 문화와 [ICON_RESEARCH]과학을 제공합니다.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]무료[ENDCOLOR] 박물관을 제공합니다.[NEWLINE][NEWLINE]모든 도시의 [ICON_GOLD]골드의 10%만큼 [ICON_CULTURE]문화가 증가합니다.[NEWLINE][NEWLINE]모든 랜드마크의 [ICON_RESEARCH] 과학이 +5 증가하고 모든 [ICON_GREAT_WORK] 걸작의 [ICON_RESEARCH] 과학이 +1 증가합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_AMERICA_SMITHSONIAN_HELP';
-- 웨스트 포인트
UPDATE Language_ko_KR
SET Text = '셋 중 [COLOR_NEGATIVE_TEXT]하나만[ENDCOLOR] 건설할 수 있는 미국의 고유 국가 불가사의입니다. 도시에 [COLOR_YELLOW]{TXT_KEY_BUILDING_AMERICA_INDEPENDENCEHALL}[ENDCOLOR]이 있어야 건설할 수 있습니다.[NEWLINE][NEWLINE]모든 도시에서 타일 [ICON_GOLD]구매 비용이 25% 감소합니다. 모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]사관 학교[ENDCOLOR]와 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]성형 요새[ENDCOLOR]에서 +5 [ICON_PRODUCTION]생산과 [ICON_RESEARCH]과학을 제공하고, 모든 [ICON_WONDER] 세계 불가사의에서 +2 [ICON_PRODUCTION] 생산과 [ICON_RESEARCH]과학을 제공합니다.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]무료[ENDCOLOR] 사관 학교를 제공합니다. 모든 도시의 [ICON_GOLD]골드의 10%만큼 [ICON_CULTURE]과학이 증가합니다.[NEWLINE][NEWLINE]모든 공성 유닛과 원거리 해군 유닛이 [COLOR_POSITIVE_TEXT]광역 피해[ENDCOLOR] 진급을 얻습니다.'
WHERE Tag = 'TXT_KEY_BUILDING_AMERICA_WESTPOINT_HELP';
-- 슬레이터 밀
UPDATE Language_ko_KR
SET Text = '셋 중 [COLOR_NEGATIVE_TEXT]하나만[ENDCOLOR] 건설할 수 있는 미국의 고유 국가 불가사의입니다. 도시에 [COLOR_YELLOW]{TXT_KEY_BUILDING_AMERICA_INDEPENDENCEHALL}[ENDCOLOR]이 있어야 건설할 수 있습니다. 오직 강 옆에 있는 도시에서만 건설할 수 있습니다.[NEWLINE][NEWLINE]모든 도시에서 타일 [ICON_GOLD]구매 비용이 25% 감소합니다. 모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]공장[ENDCOLOR]과 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]증권거래소[ENDCOLOR]에서 +5 [ICON_GOLD]골드와 [ICON_PRODUCTION]생산을 제공하고, 모든 [ICON_WONDER] 세계 불가사의에서 +2 [ICON_GOLD]골드와 [ICON_PRODUCTION]생산을 제공합니다.[NEWLINE][NEWLINE]이 도시에 [COLOR_POSITIVE_TEXT]무료[ENDCOLOR] 공장을 제공합니다.[NEWLINE][NEWLINE]모든 도시의 [ICON_GOLD]골드의 10%만큼 [ICON_PRODUCTION] 생산이 증가합니다.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]추가[ENDCOLOR] [ICON_INTERNATIONAL_TRADE] 교역로를 제공하고, [ICON_INTERNATIONAL_TRADE] 교역이 25% 빨리 완료됩니다.'
WHERE Tag = 'TXT_KEY_BUILDING_AMERICA_SLATERMILL_HELP';
-- [[스페인]]

-- [[중국]]
UPDATE Language_ko_KR
SET Text = '타일의 [ICON_GOLD] 골드, [ICON_PRODUCTION] 생산, [ICON_RESEARCH] 과학이 증가합니다. 도시가 "황후 경축일""을 맞이하는 동안 [ICON_GOLD] 골드, [ICON_PRODUCTION] 생산, [ICON_RESEARCH] 과학이 추가로 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE]도시 또는 다른 두 쓰허위안에 인접한 평지에 지을 수 있습니다. '
WHERE Tag = 'TXT_KEY_IMPROVEMENT_SIHEYUAN_HELP';
-- [[몽골]]
-- 게르
UPDATE Language_ko_KR
SET Text = '야영지와 목장의 [ICON_PRODUCTION] 생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 도시의 [ICON_CULTURE_LOCAL] 국경 확장 속도가 [COLOR_POSITIVE_TEXT]40%[ENDCOLOR] 증가하고 새 타일을 구매하기 위해 필요한 [ICON_GOLD] 골드가 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR] 감소합니다. [NEWLINE][NEWLINE]타일을 획득할 때 [ICON_FOOD] 식량과 [ICON_PRODUCTION] 생산을 [COLOR_POSITIVE_TEXT] 5[ENDCOLOR] [COLOR:105:105:105:255](시대별 보정)[ENDCOLOR]얻습니다.  [NEWLINE][NEWLINE][ICON_RES_DEER] 사슴: [ICON_FOOD] 식량 +1[NEWLINE][ICON_RES_BISON] 들소: [ICON_FOOD] 식량 +1'
WHERE Tag = 'TXT_KEY_BUILDING_YURT_HELP';

-- [[폴리네시아]]
UPDATE Language_ko_KR
SET Text = '만약 다른 모아이 또는 도시 옆에 건설하면 추가로 [ICON_CULTURE]문화를 1 제공합니다. 자원 위에 건설할 수 있지만 자원을 교역망에 연결하지는 않습니다.[NEWLINE][NEWLINE]해안에만 건설할 수 있습니다. '
WHERE Tag = 'TXT_KEY_CIV5_IMPROVEMENTS_MOAI_HELP';
-- [[폴란드]]
UPDATE Language_ko_KR
SET Text = ' 도시에서 생산하는 기마 유닛의 경험치가 [COLOR_POSITIVE_TEXT]15[ENDCOLOR] 증가합니다. [ICON_RES_HORSE]말 [COLOR_POSITIVE_TEXT]1마리[ENDCOLOR]를 제공합니다.[NEWLINE][NEWLINE]기마 유닛을 생산할 때 [ICON_PRODUCTION]생산 보너스를 [COLOR_POSITIVE_TEXT]33%[ENDCOLOR] 제공합니다. [ICON_WAR] 지역 군사 보급 한도가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE]이 도시에서 출발하는 국내 [ICON_TURNS_REMAINING]교역로의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE][ICON_RES_HORSE] 말: [ICON_PRODUCTION]생산 +3 [ICON_GOLD]골드 +3[NEWLINE][ICON_RES_SHEEP] 양: [ICON_PRODUCTION]생산 +3 [ICON_GOLD]골드 +3[NEWLINE][ICON_RES_COW] 소: [ICON_PRODUCTION]생산 +3 [ICON_GOLD]골드 +3'
WHERE Tag = 'TXT_KEY_BUILDING_DUCAL_STABLE_HELP';

-- [[비잔틴제국]]
UPDATE Language_ko_KR
SET Text = '[ICON_CITIZEN]시민 3명마다 [ICON_PEACE]신앙이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 교역로가 제공하는 종교 압력이 [COLOR_POSITIVE_TEXT]100%[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE]도시의 종교 압력이 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR] 증가합니다. [ICON_VP_GREATMUSIC]걸작 음악 슬롯 [COLOR_POSITIVE_TEXT]1개[ENDCOLOR]를 포함합니다.[NEWLINE][NEWLINE][ICON_RELIGION] 종교 분쟁에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.[NEWLINE][NEWLINE][ICON_RES_INCENSE] 향: [ICON_CULTURE]문화 +1 [ICON_GOLD]골드 +1[NEWLINE][ICON_RES_WINE] 와인: [ICON_CULTURE]문화 +1 [ICON_GOLD]골드 +1[NEWLINE][ICON_RES_AMBER] 호박석: [ICON_CULTURE]문화 +1 [ICON_GOLD]골드 +1'
WHERE Tag = 'TXT_KEY_BUILDING_BASILICA_HELP';
	
-- [[잉카]]
UPDATE Language_ko_KR
SET Text = '인접한 산 또는 {TXT_KEY_IMPROVEMENT_TERRACE_FARM}마다 [ICON_FOOD] 식량이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 인접한 모든 농장의 [ICON_FOOD] 식량이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE]언덕 위에만 건설할 수 있습니다.'
WHERE Tag = 'TXT_KEY_CIV5_IMPROVEMENTS_TERRACE_FARM_HELP';

-- [[마야]]

-- [[브라질]]
-- 브라질 소방목
UPDATE Language_ko_KR
SET Text = '[ICON_RES_BRAZILWOOD]{TXT_KEY_RESOURCE_BRAZILWOOD}이 생성됩니다. [NEWLINE]담수가 아닌 숲 또는 정글에만 건설할 수 있습니다. 다른 {TXT_KEY_IMPROVEMENT_BRAZILWOOD_CAMP}에 인접하여 건설할 수 없습니다.'
WHERE Tag = 'TXT_KEY_BUILD_BRAZILWOOD_CAMP_HELP';
-- [[쇼숀]]
UPDATE Language_ko_KR
SET Text = '시설 위에 주둔한 유닛에 [ICON_STRENGTH]방어력 보너스를 15% 제공하고 인접한 적 유닛에 피해를 [COLOR_POSITIVE_TEXT]5[ENDCOLOR] 입힙니다. (피해는 중첩되지 않습니다) [NEWLINE][NEWLINE]2타일 범위의 모든 쇼쇼니 유닛이 [ICON_STRENGTH]전투력 보너스를 +20% 받습니다.[NEWLINE][NEWLINE] 평지 타일에만 건설할 수 있습니다. 다른 티피와 서로 인접하여 건설할 수 없습니다.'
WHERE Tag = 'TXT_KEY_CIV5_IMPROVEMENTS_ENCAMPMENT_SHOSHONE_HELP';

-- [[덴마크]]
-- 룬스톤
UPDATE Language_ko_KR
SET Text = '이 도시에서 생산한 유닛이 타일을 약탈 시 [ICON_CULTURE]문화를 [COLOR_POSITIVE_TEXT]30[ENDCOLOR] [COLOR:105:105:105:255](시대별 보정)[ENDCOLOR] 제공합니다. 근접, 화약 및 해상 근접 유닛을 생산할 때 [ICON_PRODUCTION]생산 보너스를 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR] 제공합니다.[NEWLINE][NEWLINE]도시 주변 해양 타일의 [ICON_FOOD]식량이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 이 도시에서 출발하는 국내 [ICON_TURNS_REMAINING]교역로의 [ICON_FOOD]식량이 [COLOR_POSITIVE_TEXT]6[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE][ICON_CONNECTED]육상으로 연결되지 않은 도시와 [ICON_CAPITAL]수도를 [ICON_CONNECTED]해안 도시로 연결합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_JELLING_STONES_HELP';

-- [[아라비아]]
UPDATE Language_ko_KR
SET Text = '이 도시에서 다른 문명으로 출발하는 [ICON_CARAVAN]/[ICON_CARGO_SHIP]교역로가 완료되면 [COLOR_POSITIVE_TEXT]역사적 사건[ENDCOLOR]을 발동시킵니다. 도시의 [ICON_CARAVAN] 육상 교역로 범위가 [COLOR_POSITIVE_TEXT]50%[ENDCOLOR]증가합니다. [NEWLINE][NEWLINE]이 도시로 향하는 [ICON_INTERNATIONAL_TRADE]교역로마다 도시의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가하고 교역로를 개설한 상대 문명의 [ICON_GOLD]골드도 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][ICON_RES_SPICES] 향신료: [ICON_FOOD]식량 +1 [ICON_PRODUCTION]생산 +1[NEWLINE][ICON_RES_SUGAR] 설탕: [ICON_FOOD]식량 +1 [ICON_GOLD]골드 +1'
WHERE Tag = 'TXT_KEY_BUILDING_BAZAAR_HELP';

-- [[에티오피아]]
UPDATE Language_ko_KR
SET Text = '[ICON_GOLDEN_AGE]황금기 동안 도시의 [ICON_PEACE]신앙이 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR] 증가합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_STELE_HELP';

-- [[이로쿼이]]
UPDATE Language_ko_KR
SET Text = '도시 주변 정글, 숲, 습지 타일의 [ICON_FOOD]식량 및 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 재배지의 [ICON_FOOD]식량 및 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_LONGHOUSE_HELP';

/*
-------------------------
 -- 계몽시대 번역 교정
-------------------------	

