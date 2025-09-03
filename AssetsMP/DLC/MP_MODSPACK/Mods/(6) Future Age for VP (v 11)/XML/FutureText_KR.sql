INSERT INTO COMMUNITY	
		(Type,			Value)
VALUES	('MUCfVP-CAYM', 2);

UPDATE COMMUNITY
SET Value = '1'
WHERE Type = 'MUCfVP-CAYM' AND EXISTS (SELECT * FROM Buildings WHERE Type='BUILDING_EE_DRYDOCK') AND NOT EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-CAYM' AND Value= 0);

---------------------------------------------------
-- Text (ko_KR)
----------------------------------------------------

--===========================
-- Units
--===========================

INSERT INTO Language_ko_KR (Tag, Text) VALUES
('TXT_KEY_SPECIALUNIT_SPACESHIP', '우주선');

INSERT INTO Language_ko_KR (Tag, Text) VALUES
-- Gunboat
('TXT_KEY_UNIT_FW_GUNBOAT', '고속정'),
('TXT_KEY_UNIT_FW_GUNBOAT_HELP', '이동력이 좋은 원거리 해군 유닛입니다. 잠수함을 탐지하는것이 가능하며, [COLOR_PLAYER_PURPLE]공격 후 이동[ENDCOLOR] 승급과 [COLOR_PLAYER_PURPLE]낙하 부대[ENDCOLOR] 승급을 가지고 있습니다. 대양에서는 느려집니다. [NEWLINE][NEWLINE]한 번에 [COLOR_YELLOW]5기[ENDCOLOR]만 보유할 수 있습니다'),
('TXT_KEY_UNIT_FW_GUNBOAT_STRATEGY', '비행기로 운송할 수 있는 소형 고속정이지만 해전에는 약합니다. 바다를 탐험하고 약탈하는 데 사용하십시오. 문명당 최대 4개까지 지을 수 있습니다.'),
('TXT_KEY_UNIT_FW_GUNBOAT_TEXT', '고속정은 해전을 위해 설계된 군용 선박이나 군대 또는 보급품을 운반하기 위해 설계된 군용 선박과 달리 바다와 해안 목표물을 탐험하기 위해 하나 이상의 총을 운반하는 명시적인 목적을 위해 설계된 해군 선박입니다. 일반 해군 함정을 따라잡기 위해 만들어진 초고속 함선이다.'),
-- Advanced Gunboat
('TXT_KEY_UNIT_FW_ADV_GUNBOAT', '초고속정'),
('TXT_KEY_UNIT_FW_ADV_GUNBOAT_HELP', '이동력이 매우 좋은 원거리 해군 유닛입니다. 잠수함을 탐지하는것이 가능하며, [COLOR_PLAYER_PURPLE]공격 후 이동[ENDCOLOR] 승급과 [COLOR_PLAYER_PURPLE]낙하 부대[ENDCOLOR] 승급을 가지고 있습니다. 대양에서는 느려집니다. [NEWLINE][NEWLINE]한 번에 [COLOR_YELLOW]5기[ENDCOLOR]만 보유할 수 있습니다''.'),
('TXT_KEY_UNIT_FW_ADV_GUNBOAT_STRATEGY', '비행기로 운송할 수 있는 소형 고속정이지만 해전에는 약합니다. 바다를 탐험하고 약탈하는 데 사용하십시오. 문명당 최대 4개까지 지을 수 있습니다.'),
('TXT_KEY_UNIT_FW_ADV_GUNBOAT_TEXT', '초고속정은 해전을 위해 설계된 군용 선박이나 군대 또는 보급품을 운반하기 위해 설계된 군용 선박과 달리 바다와 해안 목표물을 탐험하기 위해 하나 이상의 총을 운반하는 명시적인 목적을 위해 설계된 해군 선박입니다. 일반 해군 함정을 따라잡기 위해 만들어진 초고속 함선입니다. 고속정에서 생존력이 안 좋아 생존력과 공격력을 강화하기 위해 비상 시에 사용할 수 있는 미사일 발사대가 설치되어있습니다.'),
-- Advanced UAV
('TXT_KEY_UNIT_FW_MODERN_DRONE', 'UAV'),
('TXT_KEY_UNIT_FW_MODERN_DRONE_HELP', '정보화 시대의 강력한 정찰 유닛입니다. 국경을 감시하며 잠수함과 기갑유닛과 싸우는 데 특화되어있습니다. 초기 테러진압에 유용합니다. 산과 대양 타일에서도 떠있는 것이 가능합니다.'),
('TXT_KEY_UNIT_FW_MODERN_DRONE_STRATEGY', 'UAV는 6타일 내의 모든 것을 볼 수 있고 잠수함을 탐지할 수 있는 최고의 정찰 유닛입니다. 전장에서 UAV를 눈으로 사용하십시오.'),
('TXT_KEY_UNIT_FW_MODERN_DRONE_TEXT', '일반적으로 UAV 또는 드론으로 알려진 무인 항공기는 탑승한 인간 조종사 없이 원격으로 조종되는 항공기입니다. 인간에게 너무 지루하거나 더럽거나 위험한 상황에서 사용되는 UAV는 정찰 및 모바일 공격 플랫폼 모두에서 현대 군대에서 널리 사용되는 것으로 나타났습니다. 첨단 군사 기술을 보유한 국가들은 미래의 군사 교전이 군사 정보 및 전투를 위해 점점 더 드론에 의존할 것이라고 예측합니다.'),
-- Cybersam
('TXT_KEY_UNIT_FW_CYBERSAM', '사이버 SAM 발사대'),
('TXT_KEY_UNIT_FW_CYBERSAM_HELP', '주변에 폭격을 시도하는 적의 비행 유닛을 요격합니다. 3개의 미사일이 탑재가 가능합니다.'),
('TXT_KEY_UNIT_FW_CYBERSAM_STRATEGY', '사이버 SAM(지대공) 유닛은 군대에 대공 방어를 제공합니다. 사이버 SAM 유닛은 4타일 내에서 적 항공기 폭격 목표물을 요격하고 사격할 수 있습니다(단, 턴당 유닛 하나만). 이 부대는 비공중 공격에 상당히 취약하며 보병이나 기갑유닛을 동반해야 합니다.'),
('TXT_KEY_UNIT_FW_CYBERSAM_PEDIA', '헬리콥터가 보다 효율적인 살인 기계로 발전함에 따라 보병은 제트 전투기가 제기하는 위험은 말할 것도 없고 점점 커지는 위협에 맞서 싸우도록 설계된 무기를 개발했습니다. 현대식 SAM(지대공 미사일)은 빠르고 가벼우며 레이더를 포함하고 있어 적 항공기를 조준하고 날아가서 격렬하게 폭발하고 연약한 비행기와 헬기에 모든 종류의 치명적인 피해를 입힐 수 있습니다. 이에 대응하여 더 많은 스텔스 차량이 만들어졌고 더 나은 미사일 재밍 기술도 사용되었습니다. 그럼에도 불구하고 SAM 발사기는 적군 항공기를 실제로 뜨겁게 만들어 공수 위협으로부터 동료 지상 공격자를 잘 보호합니다.'),
-- Augmented Diplomat
('TXT_KEY_UNIT_FW_AUGMENTED_DIPLOMAT', '생체강화 외교관'),
('TXT_KEY_UNIT_FW_AUGMENTED_DIPLOMAT_HELP', '[COLOR_PLAYER_PURPLE]뛰어난 외교술[ENDCOLOR] 승급과 [COLOR_PLAYER_PURPLE]유전자개조-광형태적 위장[ENDCOLOR] 승급을 가지는 외교 유닛입니다. 해당 승급들로 인해 적 유닛에 쉽게 포획되지 않아 외교전에 유리합니다.'),
('TXT_KEY_UNIT_FW_AUGMENTED_DIPLOMAT_STRATEGY', '생체강화 외교관은 비용이 많이 들지만 외교 승리를 거두는 데 필수적입니다. 이를 사용하여 다른 플레이어로부터 도시 국가의 통제권을 빼앗고, 자신의 동맹을 유지하고, 일반적으로 세계 의회의 권력을 손에 쥐십시오. 이 힘은 당신이 선택한 모든 결의안을 제정할 수 있게 하여 당신의 손아귀에 세계적인 패권을 부여할 것입니다.'),
('TXT_KEY_UNIT_FW_AUGMENTED_DIPLOMAT_PEDIA', '인체강화라는 주제는 많은 사람들에게 금기시될 수 있지만, 인간은 수세기 동안 자신을 강화하는 방법을 찾으려고 노력해 왔습니다. 누군가는 안경이 우리의 나쁜 시력을 증가시킬 수 있는 발명품이고 보청기가 우리의 나쁜 청력을 증가시켰다고 주장할 수 있습니다. 미래에 인간은 특수한 종류의 증강인 물리약학적 증강을 사용할 수 있습니다. 이러한 유형의 증강은 심리적 조건화, 대상이 원하는 행동을 이전에 관련되지 않은 자극과 연관시키게 되는 행동 수정 과정, 향상된 능력과 절대적 충성도를 위한 특정 의약품으로 구성됩니다. 물리약학적 증강은 아마도 기계적 증강의 광범위한 사용과 나노기술 증강에 대한 실험 사이에 만들어졌을 것입니다. 절대적인 충성도를 지닌 증강 에이전트를 보유하고 기계 증강의 로봇 비표준 외관이나 나노기술 증강의 예측 불가능성을 없애기 위해 일괄 증강의 빠른 방법으로 만들어졌습니다.'),
-- Modern Colonist
('TXT_KEY_UNIT_FW_MODERN_COLONIST', '현대 개척자'),
('TXT_KEY_UNIT_FW_MODERN_COLONIST_HELP', '식민지 개척자의 업그레이드 유닛입니다. [NEWLINE]이동범위가 증가하고 추가 인프라 및 시민을 갖춘 도시를 세울 수 있습니다.[NEWLINE][NEWLINE]유닛을 생산하는 동안 도시의 [ICON_FOOD]성장이 멈춥니다. 유닛 생산을 완료하면 도시의 [ICON_CITIZEN]시민이 [COLOR_NEGATIVE_TEXT]1명[ENDCOLOR] 감소합니다.[NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]국경 바로 근처에 인접했거나 제국이 [ICON_HAPPINESS_3]불행하면 도시를 세울 수 없습니다[ENDCOLOR].'),
('TXT_KEY_UNIT_FW_MODERN_COLONIST_STRATEGY', '이동력을 이용하여 다른 문명보다 빠르게 확장을 하는데 사용하세요.'),
('TXT_KEY_UNIT_FW_MODERN_COLONIST_PEDIA', '현대(근대) 시대의 식민지 개척은 인류 문명과 사회가 재앙을 겪을 경우, 새로운 지역에서 생활할 수 있는 가능성을 열었습니다. 또한, 새로운 지역에서 발견된 추가 자원들은 사회의 확장과 발전을 가능하게 하였습니다. 그러나 이 과정에서도 강력한 기관들의 이익 증대, 막대한 기회비용, 경제적 불평등, 환경 파괴 등과 같은 문제들이 발생했습니다. 특히 도시 개발은 식민지 개척의 중요한 부분이었습니다. 도시는 사회, 경제, 문화 활동의 중심지로서 새로운 식민지에서의 생활을 가능하게 했습니다. 도시는 새로운 식민지의 인프라를 구축하고, 인간의 생활을 조직화하는 데 필요한 핵심적인 구조였습니다. 도시 개발은 또한 식민지의 경제 발전을 촉진시키고, 식민지의 주민들에게 새로운 기회를 제공했습니다. 하지만 도시 개발은 자연 환경을 파괴하고, 원주민 문화를 침략하는 결과를 초래하기도 했습니다. 이와 같이 근대 시대의 식민지 개척과 도시 개발은 이중적인 결과를 가져왔습니다.'),
-- Space Colonist
('TXT_KEY_UNIT_FW_SPACE_COLONIST', '우주 개척자'),
('TXT_KEY_UNIT_FW_SPACE_COLONIST_HELP', '개척자의 최종 업그레이드 유닛입니다. [COLOR_PLAYER_PURPLE]낙하 부대[ENDCOLOR] 승급을 가집니다.[NEWLINE]추가 인프라 및 시민을 갖춘 도시를 세울 수 있습니다.[NEWLINE][NEWLINE]유닛을 생산하는 동안 도시의 [ICON_FOOD]성장이 멈춥니다. 유닛 생산을 완료하면 도시의 [ICON_CITIZEN]시민이 [COLOR_NEGATIVE_TEXT]1명[ENDCOLOR] 감소합니다.[NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]국경 바로 근처에 인접했거나 제국이 [ICON_HAPPINESS_3]불행하면 도시를 세울 수 없습니다[ENDCOLOR].'),
('TXT_KEY_UNIT_FW_SPACE_COLONIST_STRATEGY', '우주 식민지 개척자 궤도 낙하 기술을 사용하여 행성의 모든 배치에 거주하십시오.'),
('TXT_KEY_UNIT_FW_SPACE_COLONIST_PEDIA', '우주 개척(또는 우주 정착 또는 외계 행성 정착)은 지구 외의 천체에서의 영구적인 정착 및 자연 자원의 개발을 의미합니다. 이는 우주 비행과 우주 기지 운영을 넘어선 인간의 우주 존재 형태로 보입니다. 우주 개척에 찬성하거나 반대하는 많은 논의들이 있었습니다. 주로 찬성하는 두 가지 주장은 인간 문명과 생명체가 행성 규모의 재앙(자연적 또는 인간이 만든)에도 살아남을 수 있게 하며, 우주에서 추가적인 자원을 이용해 인간 사회의 확장을 가능케 할 수 있다는 것입니다.반면에 개척에 반대하는 가장 흔한 이유로는 우주의 상품화가 이미 강력한 기관들, 특히 주요 경제 및 군사 기관의 이익을 강화할 가능성이 있음과, 지구에서 같은 자원을 사용하는 것에 비해 막대한 기회비용이 발생하며, 전쟁, 경제 불평등, 환경 파괴 등 기존의 해로운 과정을 악화시킬 수 있다는 우려가 포함됩니다.'),
-- HYDROGEN BOMB
('TXT_KEY_UNIT_FW_HYDROGEN_BOMB', '수소 융합 핵폭탄'),
('TXT_KEY_UNIT_FW_HYDROGEN_BOMB_TEXT', '순수 핵융합 열핵폭탄은 핵융합 열핵 무기에 사용되는 두 개의 무거운 수소 동위원소인 중수소와 삼중수소의 융합을 발화하기 위해 핵분열 1차 폭발물이 필요하지 않은 수소 폭탄 설계입니다. 그러한 무기는 핵분열성 물질을 필요로 하지 않으므로 기존 무기보다 비밀리에 개발하기가 훨씬 더 쉬울 것입니다. 무기급 우라늄(U-235) 또는 증식 플루토늄(Pu-239)을 분리하려면 상당하고 은폐하기 어려운 산업 투자가 필요하며 필요한 기계의 판매 및 이전을 차단하는 것이 핵 확산을 제어하는 주요 메커니즘이었습니다.'),
('TXT_KEY_UNIT_FW_HYDROGEN_BOMB_DESC', '적에게 지옥의 맛을 보여주십시오. 도시와 유닛에 막심한 피해를 줍니다. [NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]맨해튼 프로젝트[ENDCOLOR]와 2개의 [ICON_RES_URANIUM]우라늄이 필요합니다.수소 핵융합 폭탄, 또는 열핵 폭탄은 원자핵이 합쳐져서 더 무거운 원자핵을 형성하며 방출되는 에너지를 이용한 폭탄이다. 일반적인 원자 폭탄에 비해 훨씬 더 많은 파괴력을 가지며, 이는 데우터륨과 트리튬 같은 무거운 수소 동위 원소들의 핵융합 반응에서 나오는 에너지 때문이다. 이러한 폭탄은 대량 살상 무기에 속하며, 그 사용은 국제법에 의해 엄격히 규제되어 있다.'),
('TXT_KEY_UNIT_FW_HYDROGEN_BOMB_STRATEGY', '적에게 지옥의 맛을 보여주십시오. 도시와 유닛에 막심한 피해를 줍니다. [NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]맨해튼 프로젝트[ENDCOLOR]와 2개의 [ICON_RES_URANIUM]우라늄이 필요합니다.'),
('TXT_KEY_UNIT_FW_HYDROGEN_BOMB_HELP', '폭발할 때 수소 융합 핵폭탄은 폭발 반경 2타일 내에 있는 모든 도시와 유닛에 매우 막심한 피해를 줍니다. 공격 시 자동으로 파괴됩니다');

--===========================
-- Promotion
--===========================
INSERT INTO Language_ko_KR (Tag, Text) VALUES
-- Advanced Tactics
('TXT_KEY_FW_PROMOTION_ADVANCED_TACTICS', '향상된 전략'),
('TXT_KEY_FW_PROMOTION_ADVANCED_TACTICS_HELP', '위대한 장군과 위대한 제독의 [ICON_MOVES] 이동력 [COLOR_POSITIVE_TEXT]+1[ENDCOLOR], 시야 [COLOR_POSITIVE_TEXT]+1[ENDCOLOR], [COLOR_POSITIVE_TEXT]ZOC[ENDCOLOR] 무시'),
-- Worker Implants
('TXT_KEY_FW_PROMOTION_IMPLANTS_WORKER', '노동자 임플란트'),
('TXT_KEY_FW_PROMOTION_IMPLANTS_WORKER_HELP', '노동자와 위인의 [ICON_MOVES] 이동력 [COLOR_POSITIVE_TEXT]+3[ENDCOLOR], 시야 [COLOR_POSITIVE_TEXT]+1[ENDCOLOR]'),
-- Master Race
('TXT_KEY_FW_PROMOTION_MASTER_RACE', '우월종'),
('TXT_KEY_FW_PROMOTION_MASTER_RACE_HELP', '[COLOR_POSITIVE_TEXT]화약 유닛과 전투 시[ENDCOLOR] [ICON_STRENGTH] 전투력 보너스 [COLOR_POSITIVE_TEXT]+30%[ENDCOLOR][NEWLINE][COLOR_NEGATIVE_TEXT]우호적인 유닛[ENDCOLOR] 인접 시 [ICON_STRENGTH] 전투력 [COLOR_NEGATIVE_TEXT] -15% [ENDCOLOR]'),
-- Apex predator
('TXT_KEY_PROMOTION_FW_APEXPREDATOR', '에이펙스 침입자'),
('TXT_KEY_PROMOTION_FW_APEXPREDATOR_HELP', '[COLOR_GREEN]평지[ENDCOLOR]에서 전투 시 [ICON_STRENGTH]전투력 보너스 [COLOR_POSITIVE_TEXT]+25%[ENDCOLOR][NEWLINE][COLOR_GREEN]부상당한 유닛[ENDCOLOR]과 전투 시 [ICON_STRENGTH]전투력 보너스 [COLOR_POSITIVE_TEXT] +10%[ENDCOLOR]'),
-- Spaceship
('TXT_KEY_PROMOTION_FW_SPACESHIP', '우주선'),
('TXT_KEY_PROMOTION_FW_SPACESHIP_HELP', '전투기, 폭격기 유닛 [ICON_STRENGTH]전투력 [COLOR_POSITIVE_TEXT]+15%[ENDCOLOR]'),
-- Spaceship
('TXT_KEY_PROMOTION_FW_SPACESPECIALIST', '우주전문가'),
('TXT_KEY_PROMOTION_FW_SPACESPECIALIST_HELP', '[ICON_STRENGTH]전투력 +10%'),
-- Implants
('TXT_KEY_PROMOTION_FW_IMPLANTS', '임플란트'),
('TXT_KEY_PROMOTION_FW_IMPLANTS_HELP', '[ICON_STRENGTH]전투력 +10%'),
-- Neurotic Poison
('TXT_KEY_PROMOTION_FW_UNIT_SWARM_0', '신경독주입'),
('TXT_KEY_PROMOTION_FW_UNIT_SWARM_1', '신경독마비'),
('TXT_KEY_PROMOTION_FW_UNIT_SWARM_0_HELP', '[COLOR_GREEN]공격해서 상대방에 표시[ENDCOLOR]를 남기고, 표시된 유닛은 [ICON_MOVES]이동력이 줄고, 최대 체력이 [COLOR_RED]20까지[ENDCOLOR] 떨어지고 [COLOR_GREEN]3턴 동안[ENDCOLOR] [COLOR_RED]10만큼만[ENDCOLOR] 회복합니다.'),
('TXT_KEY_PROMOTION_FW_UNIT_SWARM_1_HELP', '유닛이 [COLOR_GREEN]신경독에 공격당해서[ENDCOLOR] [ICON_MOVES]이동력이 줄고, 최대 체력이 [COLOR_RED]20까지[ENDCOLOR] 떨어지고 [COLOR_GREEN]3턴 동안[ENDCOLOR] [COLOR_RED]10만큼만[ENDCOLOR] 회복합니다.'),
-- FW ANGELNET
('TXT_KEY_PROMOTION_FW_ANGELNET', '엔젤넷의 가호'),
('TXT_KEY_PROMOTION_FW_ANGELNET_HELP', '[COLOR_CYAN]엔젤넷이 있는 도시[ENDCOLOR]의 4 타일 내에서 싸울때 [ICON_STRENGTH]전투력 보너스 [COLOR_POSITIVE_TEXT]+25%[ENDCOLOR]');

--===========================
-- Resources
--===========================
INSERT INTO Language_ko_KR (Tag, Text) VALUES
('TXT_KEY_RESOURCE_NANOMAT', '나노물질'),
('TXT_KEY_RESOURCE_NANOMAT_HELP', '강력한 미래시대 유닛 생산 및 건물 건설에 사용됩니다. 지도상 매우 극조건 (사막, 설원, 툰드라, 해양)에 생성이 되지만, 매우 적습니다. 유정과 해양구조물로 자원을 얻을 수 있습니다. 변환기를 통해 생산이 가능합니다.'),
('TXT_KEY_RESOURCE_NANOMAT_TEXT', '나노물질은 최소 한 축에서 1–1000 nm 규모의 구조로, 양자 효과가 물성에 직접 작용합니다. 스핀트로닉스, 밴드갭·스핀 상태를 정밀 제어하는 희토류/자성 나노합금, 고품질 나노결정/이종접합은 차세대 계산·에너지·센서의 기반입니다. 자연계 존재량은 미량이므로 심해 채굴/자기 유정/플라즈마 합성 같은 고도 인프라가 필요합니다.[NEWLINE]나노 스케일에서는 표면·계면·결함 상태 밀도가 지배적이며, 미세한 화학 조성/결정상 변화가 밴드구조와 스핀 텍스처를 근본적으로 바꿉니다. 이로부터 스핀 기반 논리(스핀트로닉스), 정밀 촉매/전극, 광-전-기 다중 응답 메타물질이 파생됩니다. 일부 구조는 고온/상온 초전도 후보로 연구 중이며, 실제 구현을 위해서는 불순물·결함 제어와 정밀 나노제조가 관건입니다.'),
('TXT_KEY_RESOURCE_ADN_FUNGUS', '제노포자'),
('TXT_KEY_RESOURCE_ADN_FUNGUS_HELP', '강력한 미래 시대 유전자유닛, 바이오강화 유닛에 쓰이는 자원입니다. 특정 건물이 있는 도시에서 타일이 생성이 되거나 초원, 평원에서 발견할 수 있습니다.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]전략 자원 독점 보너스 (25%):[ENDCOLOR] 유닛 추가 경험치 +2.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]글로벌 독점 보너스 (50%):[ENDCOLOR]전략 자원 타일의 [ICON_RESEARCH]과학 +1, [ICON_CULTURE]문화 +1.'),
('TXT_KEY_RESOURCE_ADN_FUNGUS_TEXT', '**제노포자(Genospore)**는 지구 토양·식생에서 드물게 발견되는 포자성 복합체입니다. 극한 환경(건조, 금속 이온, 저산소)에 반응해 **후성유전 조절(메틸화/전사 조절)**과 모바일 유전요소 활성을 유도하여, 생물의 비치명적·적응적 변이 확률을 높입니다. 근대 유전공학의 축적 덕분에 이 물질의 작용이 규명되었고, 오늘날 표현형 가속·재생·특수 생체공학에 응용됩니다. [NEWLINE] 제노포자는 외부 스트레스(금속 이온, pH, 산소 농도 등)에 반응해 **세포외 소포(엑소좀)**와 이온 결합 펩타이드를 분비하고, DNA 절단 없이 유전자 발현 프로그램을 재설정합니다. 이 과정은 후성유전 재구성과 트랜스포존 재배치를 통해 적응적 표현형 다양성을 증가시키며, 장기적으로는 종수준 진화 압력을 강화합니다.[NEWLINE]제노포자는 지구에서 발생한 고유의 스트레스 매개체로 보이며, 지질시대의 극심한 환경 변화기에 진화의 불씨로 작동했을 가능성이 제기됩니다. 지구의 급작스런 기후변화로 인해 최근에 증가하는 경향이 있습니다. 높은 농도·장기 노출은 생태계 교란을 유발할 수 있어 엄격한 관리가 필요합니다.');

--===========================
-- Improvements 
--===========================
INSERT OR REPLACE INTO LocalizedText
	(Language, Tag, Text)
VALUES
	('ko_KR', 'TXT_KEY_PONTOON_BRIDGE', '해저터널'),
	('ko_KR', 'TXT_KEY_PONTOON_BRIDGE_HELP', '지상 유닛이 이 해안 타일을 횡단할 수 있습니다. 2개 이상의 육지 타일이 인접한 해안 타일에만 건설할 수 있습니다. 2개 또는 3개의 인접한 대지 타일이 있는 타일의 경우 대지 타일이 인접하지 않을 수 있습니다. 노동자에 의해 건설됩니다.[NEWLINE][NEWLINE] 터널을 이용하여 육지로 도시를 연결할 수 있지만, [COLOR_NEGATIVE_TEXT]육상교역로는 연결이 되지 않습니다.[ENDCOLOR]'),
	('ko_KR', 'TXT_KEY_PONTOON_BRIDGE_TEXT', '지상유닛이 해저터널을 이용하여 연안타일을 가로질러 빠르고 안전하게 다른 지역으로 이동이 가능합니다.'),
	('ko_KR', 'TXT_KEY_BUILD_PONTOON_BRIDGE', '[LINK=IMPROVEMENT_PONTOON_BRIDGE]해저터널[/LINK] 건설'),
	('ko_KR', 'TXT_KEY_BUILD_PONTOON_BRIDGE_REC', '지상 유닛이 약간의 전투 패널티로 이 타일을 횡단할 수 있게 합니다.');
--===========================
-- Tech
--===========================
UPDATE Language_ko_KR
SET Text = '[COLOR_YELLOW]프로메테우스 우주 계획[ENDCOLOR]은 지구의 고갈되는 자원에서 새로운 무대로 옮기는 시작을 알립니다. 도시에서 우주선의 부품을 생산할 수 있습니다. 우주선이 완성되면 [ICON_VICTORY_SPACE][COLOR_POSITIVE_TEXT]과학 승리[ENDCOLOR]를 쟁취하게 됩니다![NEWLINE][NEWLINE]당신의 문명이 처음으로 프로젝트를 완료했다면 [ICON_CAPITAL]수도 근처에 [ICON_GREAT_SCIENTIST][COLOR_YELLOW]위대한 과학자[ENDCOLOR]가 1명 출현하고, 문명이 즉시 [ICON_GOLDEN_AGE]황금기를 맞이합니다.'
WHERE Tag = 'TXT_KEY_PROJECT_APOLLO_PROGRAM_HELP';

UPDATE Language_ko_KR
SET Text = '[COLOR_YELLOW]프로메테우스 우주 계획[ENDCOLOR]은 지구를 넘어서 우주 경쟁의 시작점입니다. 프로메테우스 우주 계획을 완성하면 우주선 부품을 건조할 수 있게 됩니다. 각 문명은 각자 이 프로젝트를 완성해야만 우주선 부품을 건조할 수 있습니다. 당신이 가장 먼저 아폴로 우주 계획을 완성한다면, 위대한 과학자를 얻고 곧바로 황금기가 시작됩니다.'
WHERE Tag = 'TXT_KEY_PROJECT_APOLLO_PROGRAM_STRATEGY';

UPDATE Language_ko_KR
SET Text = '인류의 탐험욕구와 지적 호기심은 그들을 지구를 넘어 우주로 이끌었습니다. 프로메테우스 우주계획은 이러한 인류의 우주 탐험 본능을 대표하는 핵심적인 기관입니다. 이 계획은 우리의 태양계와 가장 가까운 별, 알파 센타우리로의 항성간 여행을 꿈꾸는 인류의 결실입니다. 프로메테우스 프로그램은 그러한 목표를 실현하기 위해 연구, 기술개발, 우주선 제작 등 다양한 분야에서 활동을 진행하며 인류의 우주 진출을 선도하고 있습니다.이 탄생 배경은 20세기 중반부터 시작된 우주 경쟁에서 시작되었습니다. 이 시기, 각 나라는 자신들의 국력을 과시하고 기술력을 확보하기 위해 우주 연구에 힘을 쏟았습니다. 그리고 이러한 연구의 결과로 우리는 달에 인간을 보내고, 화성을 탐사하며, 가장 가까운 별인 알파 센타우리로 우주선을 보내는 기술을 개발하게 되었습니다.그러나, 이런 기술 개발이 순전히 과학적인 목표를 위한 것만은 아니었습니다. 기후 변화, 자원 부족, 인구 과밀 등 지구상의 여러 문제들로 인해 우리의 생존 공간을 넓히는 것도 중요한 목표가 되었습니다. 프로메테우스 우주계획은 이러한 목표를 실현하기 위한 중요한 단계로, 인류의 우주 진출을 이끌고 있습니다.오늘날, 항성간 여행의 가능성을 연구하고, 인류의 우주 존재를 확장하는 데 필요한 기술을 개발하며, 알파 센타우리로의 첫 항성간 여행을 준비하는 등의 중요한 역할을 수행하고 있습니다. 이러한 노력은 우리의 지식을 넓히고, 새로운 가능성을 탐구하며, 결국은 인류의 우주 진출을 가능하게 할 것입니다.'
WHERE Tag = 'TXT_KEY_PROJECT_APOLLO_PROGRAM_PEDIA';


INSERT INTO Language_ko_KR (Tag, Text) VALUES
-- High-Energy Materials Research
('TXT_KEY_TECH_FW_NUCLEAR_ENRICHMENT_TITLE', '고에너지 신소재공학'),
('TXT_KEY_TECH_FW_NUCLEAR_ENRICHMENT_DESC', '고에너지 신소재공학은 초정밀 레이저, 극저온 냉각 실험, 심층 고압·고온 환경 시뮬레이션을 융합하여 차세대 에너지 시스템과 신소재를 개발하는 학문입니다. 이 연구는 초전도체 기술의 토대를 마련하고, 미래형 에너지와 자기부상 교통망으로 이어지는 핵심 전환점이 됩니다.'),
('TXT_KEY_TECH_FW_NUCLEAR_ENRICHMENT_HELP', '애퍼처 강화센터와 신소재공학연구소에서 초정밀 레이저를 활용한 핵 고농축 과정을 통해 우라늄과 철, 석탄, 석유를 소모하고 나노물질 2개를 추가로 확보할 수 있습니다. 또한 경량화된 핵미사일을 개발하여 탄도미사일 플랫폼에 장착할 수 있으며, 이 건물은 도시의 과학과 생산력 향상에 기여합니다.'),
('TXT_KEY_TECH_FW_NUCLEAR_ENRICHMENT_QUOTE', '[NEWLINE][NEWLINE]"새로운 물질의 발견과 에너지 제어 기술의 혁신은 인류 문명의 다음 도약을 가능하게 한다. 미래 도시의 기반은 결국 과학이 될 것이다." [NEWLINE][NEWLINE]- 미래 기술 선언[NEWLINE][NEWLINE]'),

-- PROMETHEUS PROGRAM
('TXT_KEY_TECH_FW_PROMETHEUS_PROGRAM_TITLE', '행성 이주 계획'),
('TXT_KEY_TECH_FW_PROMETHEUS_PROGRAM_DESC', '행성 이주 계획은 인류가 다른 행성이나 천체에 이주하여 삶을 유지하고 발전시키기 위한 장기적인 계획입니다. 이 계획은 미래의 생존 가능성을 확장하고, 지구의 자원을 보완하며, 새로운 과학적 발견과 기술적 진보를 촉진하는 목적을 가지고 있습니다.'),
('TXT_KEY_TECH_FW_PROMETHEUS_PROGRAM_HELP', '우주 궤도 정제소를 건설하여 나노물질을 얻으십시오. 우주궤도 배양시설로 우주정거장을 강화할 수 있습니다. 아주 강력한 방어유닛인 스페이스마린을 생산할 수 있습니다.'),
('TXT_KEY_TECH_FW_PROMETHEUS_PROGRAM_QUOTE', '[NEWLINE][NEWLINE]"화성은 지구에서 충분히 멀리 떨어져 있어서 (전쟁 시) 달 기지보다 생존 가능성이 높기 때문에 화성에서 자립형 기지를 확보하는 것이 중요합니다. 화성에서 자립형 도시를 이루지 못한다면 내 생에 그것을 실패로 여길 것이다." [NEWLINE][NEWLINE]-엘론 머스크[NEWLINE][NEWLINE]');


--===========================
-- Policies
--===========================
----------------------------------------------
-- Agribusiness - Stockyard
----------------------------------------------
UPDATE Language_ko_KR
SET Text = '농장, 목장, 수경재배지구, 그리고 친환경 마을의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR], [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. 매턴 [ICON_FOOD] 식량의  [COLOR_POSITIVE_TEXT]10%[ENDCOLOR]를 [ICON_GOLD]골드로 전환합니다.[NEWLINE][NEWLINE][ICON_RES_HORSE]말 [COLOR_NEGATIVE_TEXT]2[ENDCOLOR] 필요합니다.'
WHERE Tag = 'TXT_KEY_BUILDING_STOCKYARD_HELP';

-- Entrepreneurship
UPDATE Language_ko_KR
SET Text = '[COLOR_POSITIVE_TEXT]기업가 정신[ENDCOLOR][NEWLINE][ICON_BULLET]작업장의 [ICON_HAPPINESS_1]행복이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][ICON_BULLET]모든 광산, 채석장, 제재소, 발전기, 산업단지, 첨단에너지 연구단지의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][ICON_BULLET][ICON_GREAT_MERCHANT]위대한 상인 또는 [ICON_GREAT_ENGINEER]위대한 기술자를 소모할 때 효율이 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR] 증가합니다. '
WHERE Tag = 'TXT_KEY_POLICY_ENTREPRENEURSHIP_HELP';

-- Naval Tradition (now Colonialism)
UPDATE Language_ko_KR
SET Text = '[COLOR_POSITIVE_TEXT]식민주의[ENDCOLOR][NEWLINE][ICON_BULLET]병영, 무기고, 화기제작소, 사관 학교, 요새, 성채, 고유 방어시설의 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][ICON_BULLET]글로벌 독점에서 오는 [ICON_GOLDEN_AGE]산출량이 비율 기반이면 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR], 아니면 [COLOR_POSITIVE_TEXT]3[ENDCOLOR] 증가합니다. '
WHERE Tag = 'TXT_KEY_POLICY_NAVAL_TRADITION_HELP'AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-CAYM' AND Value= 1);

UPDATE Language_ko_KR
SET Text = '[COLOR_POSITIVE_TEXT]식민주의[ENDCOLOR][NEWLINE][ICON_BULLET]병영, 무기고, 사관 학교, 요새, 성채, 고유 방어시설의 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][ICON_BULLET]글로벌 독점에서 오는 [ICON_GOLDEN_AGE]산출량이 비율 기반이면 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR], 아니면 [COLOR_POSITIVE_TEXT]3[ENDCOLOR] 증가합니다. '
WHERE Tag = 'TXT_KEY_POLICY_NAVAL_TRADITION_HELP'AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='MUCfVP-CAYM' AND Value= 2);

-- Merchant Navy -- Now called Exploitation
UPDATE Language_ko_KR
SET Text = '[COLOR_POSITIVE_TEXT]착취[ENDCOLOR][NEWLINE][ICON_BULLET]농장, 야영지, 재배지, 친환경마을, 수경재배지구의 [ICON_FOOD]식량이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][ICON_BULLET]모든 대양, 해안, 호수 타일의 [ICON_RESEARCH]과학 및 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.'
WHERE Tag = 'TXT_KEY_POLICY_MERCHANT_NAVY_HELP';

-- SOVEREIGNTY
UPDATE Language_ko_KR
SET Text = '[COLOR_POSITIVE_TEXT]천부인권[ENDCOLOR][NEWLINE][ICON_BULLET]모든 요구 [ICON_HAPPINESS_3]불행이 -1 감소합니다.[NEWLINE][ICON_BULLET]모든 마을, 자연보호구역, 통신기지국의 [ICON_GOLD]골드 및 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다.[NEWLINE][ICON_BULLET]황금기 동안 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR] 증가합니다.'
WHERE Tag = 'TXT_KEY_POLICY_SOVEREIGNTY_HELP';

-- Civil Society
UPDATE Language_ko_KR
SET Text = '[COLOR_POSITIVE_TEXT]시민 사회[ENDCOLOR]: 전문가가 소모하는 [ICON_FOOD]식량이 평소보다 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] [COLOR:105:105:105:255](한도: [ICON_FOOD]1)[ENDCOLOR] 감소합니다. 농장, 친황경마을, 수경재배지구, 재배지, 야영지, 통신기지국, 자연보호구역, 고유 시설의 [ICON_FOOD]식량이 [COLOR_POSITIVE_TEXT]4[ENDCOLOR] 증가합니다.'
WHERE Tag = 'TXT_KEY_POLICY_CIVIL_SOCIETY_HELP';

-- New Deal
UPDATE Language_ko_KR
SET Text = '[COLOR_POSITIVE_TEXT]뉴딜 정책[ENDCOLOR]: 랜드마크 및 위인 시설의 기반 산출량 ([ICON_PRODUCTION] 제조소/성채/산업단지, [ICON_GOLD] 소도시, [ICON_RESEARCH] 아카데미/첨단에너지 연구단지, [ICON_CULTURE] 대사관, [ICON_PEACE] 성지, [ICON_TOURISM] 랜드마크)이 [COLOR_POSITIVE_TEXT]6[ENDCOLOR] 증가하고, [ICON_TOURISM]관광이 2 증가합니다.'
WHERE Tag = 'TXT_KEY_POLICY_NEW_DEAL_HELP';

-- Five Year Plan
UPDATE Language_ko_KR
SET Text = '[COLOR_POSITIVE_TEXT]5개년 계획[ENDCOLOR]: 모든 도시에서 건물을 건설할 때 [ICON_PRODUCTION]생산 보너스를 [COLOR_POSITIVE_TEXT]20%[ENDCOLOR] 제공합니다. 모든 광산, 채석장, 제재소, 유정, 모든 고유 시설의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]3[ENDCOLOR] 증가합니다.'
WHERE Tag = 'TXT_KEY_POLICY_FIVE_YEAR_PLAN_HELP';

--===========================
-- Buidings
--===========================

INSERT INTO Language_ko_KR (Tag, Text) VALUES
-- Aquaculture Lab
('TXT_KEY_BUILDING_FW_AQUACULTURE_LAB', '수산양식 연구소'),
('TXT_KEY_BUILDING_FW_AQUACULTURE_LAB_HELP', '도시 근처에  [ICON_RES_FISH] 물고기가 출현합니다. 도시의 해양 자원의 [ICON_GOLD] 골드 및 [ICON_FOOD]식량이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][ICON_FOOD]/[ICON_PRODUCTION]낙후에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다. [NEWLINE][NEWLINE][COLOR_YELLOW]해안도시[ENDCOLOR]에만 건설 할 수 있습니다. [COLOR_PLAYER_NETHERLANDS_BACKGROUND]항만[ENDCOLOR]이 있어야 하고 [COLOR_NEGATIVE_TEXT]해저 채굴 플랫폼, 인공산호초[ENDCOLOR]가 없어야 건설할 수 있습니다.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]투케이 푸드 기업을 설립하면[ENDCOLOR] [ICON_FOOD] 식량이 [COLOR_POSITIVE_TEXT]3[ENDCOLOR] 증가합니다.'),
('TXT_KEY_BUILDING_FW_AQUACULTURE_LAB_STRATEGY', '수산양식 연구소를 건설하면 타일시설을 개발하고, 도시의 해양 타일과 오아시스의 골드 및 식량이 생산을 증가시킬 수 있습니다. '),
('TXT_KEY_BUILDING_FW_AQUACULTURE_LAB_PEDIA', '농업과 축산업을 개량하기 위해 다양한 과학적 방법이 사용되었으므로 바다에 사는 동물의 가용성을 높이는 데에도 유사한 기술이 적용될 수밖에 없었습니다. ''양식''에 대한 다양한 실험은 바다의 다양한 동물로부터 얻을 수 있는 수확량을 극대화하는 다양한 방법으로 이어졌습니다.'),

-- Seawater Artificial Reef
('TXT_KEY_BUILDING_FW_SEAWATER_ARTIFICIAL_REEF', '인공 산호초'),
('TXT_KEY_BUILDING_FW_SEAWATER_ARTIFICIAL_REEF_HELP', '해양 타일의 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR], [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][ICON_RES_PEARLS]진주: +1[ICON_GOLD] +1[ICON_CULTURE][NEWLINE][ICON_RES_CRAB]게: +1[ICON_RESEARCH] +1[ICON_GOLD][NEWLINE][ICON_RES_CORAL]산호: +1[ICON_RESEARCH] +1[ICON_CULTURE][NEWLINE][NEWLINE][COLOR_YELLOW]해안도시[ENDCOLOR]에만 건설 할 수 있습니다. [COLOR_PLAYER_NETHERLANDS_BACKGROUND]항만[ENDCOLOR]이 있어야 하고 [COLOR_NEGATIVE_TEXT]수산양식 연구소, 해저 채굴 플랫폼[ENDCOLOR]이 없어야 건설할 수 있습니다.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]시빌 보석 기업을 설립하면[ENDCOLOR] [ICON_GOLDEN_AGE]황금기 점수가 [COLOR_POSITIVE_TEXT]4[ENDCOLOR] 증가합니다.'),
('TXT_KEY_BUILDING_FW_SEAWATER_ARTIFICIAL_REEF_STRATEGY', '인공 산호초는 미래 시대 건물입니다. 도시의 과학과 문화를 향상시킵니다.'),
('TXT_KEY_BUILDING_FW_SEAWATER_ARTIFICIAL_REEF_PEDIA', '인공 산호초는 인간이 만든 수중 구조물로, 일반적으로 바닥이 없는 지역에서 해양 생물을 촉진하고, 침식을 통제하고, 선박 통행을 막고, 트롤망 사용을 막고, 서핑을 개선하기 위해 만들어졌습니다. 인공 암초 건설은 고대부터 시작되었습니다. 페르시아인들은 인공 암초를 건설하여 아라비아 해적을 저지하기 위해 티그리스 강 하구를 막았고, 제1차 포에니 전쟁 동안 로마인들은 시칠리아의 카르타고 항구 입구를 가로질러 암초를 건설하여 적함을 안에 가두고 카르타고인들을 섬. 오늘날 지구 온난화와 기후 변화로 인해 그레이트 배리어 리프에 있는 산호의 절반 이상이 파괴되었지만 문명이 이 사건을 바로잡고 바닷물의 연약한 생태계를 복원하는 데 도움을 줄 수 있습니다.'),

-- Undersea Mining Platform
('TXT_KEY_BUILDING_FW_UNDERSEA_MINING', '해저 채굴 플랫폼'),
('TXT_KEY_BUILDING_FW_UNDERSEA_MINING_HELP', '해양 타일의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR], [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE][ICON_RES_OIL]석유: [ICON_PRODUCTION]생산: +1[ICON_GOLD] 골드 +1, [ICON_RESEARCH]과학 +1[NEWLINE][ICON_RES_WHALE]고래: [ICON_PRODUCTION]생산: +1[ICON_GOLD] 골드 +1, [ICON_RESEARCH]과학 +1[NEWLINE][ICON_RES_NANOMAT]나노물질: [ICON_PRODUCTION]생산: +1[ICON_GOLD] 골드 +1, [ICON_RESEARCH]과학 +1[NEWLINE][NEWLINE]이 도시로 향하는 [ICON_INTERNATIONAL_TRADE]교역로마다 도시의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가하고 교역로를 개설한 상대 문명의 [ICON_GOLD]골드도 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][COLOR_YELLOW]해안도시[ENDCOLOR]에만 건설 할 수 있습니다. [COLOR_PLAYER_NETHERLANDS_BACKGROUND]항만[ENDCOLOR]이 있어야 하고 [COLOR_NEGATIVE_TEXT]수산양식 연구소, 인공 산호초[ENDCOLOR]가 없어야 건설할 수 있습니다.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]센타우리 개발 기업을 설립하면[ENDCOLOR] [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다.'),
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
-- [NEWLINE][NEWLINE][COLOR_NEGATIVE_TEXT]나노물질제조소[ENDCOLOR]가 없어야 건설할 수 있습니다.'), 설정 밸런스 고려 후 재조치 필요
('TXT_KEY_BUILDING_FW_FUNGAL_AGRIGENOMICS_STRATEGY', '도시에 [ICON_RESEARCH]과학이 +4 ,  [ICON_CULTURE]문화가 +4추가됩니다. 연구소를 건설하여 [ICON_RES_ADN_FUNGUS]제노포자를 얻을 수 있습니다.'),
('TXT_KEY_BUILDING_FW_FUNGAL_AGRIGENOMICS_PEDIA', '제노포자 배양 연구소 또는 제노포자 유전학 연구소는 기능적 유전체학 접근 방식을 사용하여 산업 및 환경 응용 분야를 위한 곰팡이 효소를 식별합니다. 극한 환경에서 성장할 수 있는 능력과 알려진 생분해, 생물정화 및 생촉매 능력에 따라 선택된 진화적으로 다양한 진균 종에 대한 대규모 유전자 발견 프로그램입니다. 농업 유전학(agricultural genomics) 또는 농업 유전체학(농업에 유전학을 적용하는 것)은 지속 가능한 생산성을 지속적으로 추진하고 있으며, 전 세계 인구를 먹여 살리고 인간 게놈 미스터리를 해결하는 점증하는 문제에 대한 솔루션을 제공하고 있습니다. 현대 기술을 사용하여 농부, 육종가 및 연구원은 원하는 특성과 연결된 유전적 마커를 쉽게 식별하여 재배 및 육종 결정을 알릴 수 있습니다.'),

-- Genemod Lab
('TXT_KEY_BUILDING_FW_GENE_LAB', '유전자공학 연구소'),
('TXT_KEY_BUILDING_FW_GENE_LAB_HELP', '[ICON_CITIZEN]시민이 증가할 때 사용한 [ICON_FOOD]식량의 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR]를 다음 [ICON_CITIZEN]시민을 위해 사용할 수 있습니다. 모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]유전자공학 연구소[ENDCOLOR]의 [ICON_FOOD]식량이 추가로 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[NEWLINE][ICON_FOOD]/[ICON_PRODUCTION]낙후에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다. [NEWLINE][NEWLINE][ICON_RES_HORSE]말:[ICON_FOOD]식량 +2[NEWLINE][ICON_RES_COW]소:[ICON_FOOD]식량 +2[NEWLINE][ICON_RES_SHEEP]양:[ICON_FOOD]식량 +2[NEWLINE][ICON_RES_DEER]사슴:[ICON_FOOD]식량 +2[NEWLINE][ICON_RES_BISON]들소:[ICON_FOOD]식량 +2[NEWLINE][NEWLINE][ICON_RES_HORSE]말이 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR] 필요합니다. [NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]연구소[ENDCOLOR]가 있어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_GENE_LAB_STRATEGY', '유전자 공학 연구소를 건설하면 GMO를 생산하게 되어 도시의 [ICON_RES_COW][ICON_RES_DEER][ICON_RES_HORSE][ICON_RES_SHEEP][ICON_RES_BISON]의 식량을 올려줍니다.'),
('TXT_KEY_BUILDING_FW_GENE_LAB_PEDIA', '유전자 조작 기술이 발전함에 따라 인류는 점점 더 광범위한 주제에 대한 실험을 시작했습니다. 처음에는 작물과 가축의 미미한 개량으로 시작되었지만, 유전체 시퀀싱을 통해 과학자들이 전례 없는 정확도로 유전 물질을 분석하고 선택할 수 있게 되면서 정밀 공학으로 빠르게 확장되었습니다. 유전 질환과 관련된 위험한 대립유전자를 확인하고 제거함으로써 더욱 건강하고 오래 사는 개체군이 탄생했습니다. 식량 공급의 어려움에 직면한 연구자들은 기존 종의 단순한 변형이 아닌 완전히 새로운 동물을 설계하는 데 집중했습니다. 그 결과, 빠른 성장과 높은 단백질 생산량을 위해 유전자 조작된 가축, 극한 기후에서 작물과 함께 번성할 수 있는 공생 생물, 심지어 통제된 환경에서만 번식하도록 조작되어 안전성과 지속 가능성을 보장하는 생물체까지 탄생했습니다. 유전자 공학은 곧 농업을 넘어 의학과 전쟁에 적용되었습니다. 병원균에 대한 저항력을 강화한 군인, 맞춤형 장기를 생산할 수 있는 바이오뱅크, 그리고 인간 능력의 한계를 뛰어넘는 실험적 증강이 가능해졌습니다. 유전체 시퀀싱과 유전자 공학의 결합을 통해 인류는 스스로 진화의 방향을 결정할 수 있는 능력을 얻었습니다. 이러한 기술적 성취는 단순한 과학적 이정표가 아니라 미래 문명의 기반을 형성하는 기술적 특이점으로 점차 인식되고 있습니다.'),

-- Cyberpolice
('TXT_KEY_BUILDING_FW_CYBERPOLICE', '사이버 경찰서'),
('TXT_KEY_BUILDING_FW_CYBERPOLICE_HELP', '[ICON_SPY] 도시 보안이 +20 증가합니다. [NEWLINE][NEWLINE][ICON_FOOD]/[ICON_PRODUCTION]낙후, [ICON_GOLD] 빈곤, [ICON_RESEARCH] 문맹, [ICON_CULTURE]무료에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.'),
('TXT_KEY_BUILDING_FW_CYBERPOLICE_STRATEGY', '경찰서는 적 스파이가 도시를 해칠 수 있는 속도를 늦춥니다. 디지털 경찰서를 건설하려면 도시에 경찰서가 있어야 합니다.'),
('TXT_KEY_BUILDING_FW_CYBERPOLICE_PEDIA', '사이버 경찰서는 디지털 세상에서 법과 질서를 유지합니다. 인터넷에 관련된 범죄, 특히 해킹, 사이버 금융 사기 등과 같은 고도로 기술적인 범죄를 감시하고, 수사하며, 예방하는 것입니다. 일반적으로 전문 컴퓨터 과학자, 해커, 범죄 수사 전문가 등으로 구성되어 있으며, 실시간 모니터링 시스템과 강력한 사이버 보안 도구를 사용하여 디지털 세계의 안전을 유지합니다. 이들은 범죄 행위를 탐지하고 분석하며, 그 행위를 수행한 범인들을 추적하고 적발하는 데 특화되어 있습니다.사이버 경찰서는 온라인 공간의 광범위한 영역을 감시하며, 이를 통해 네트워크 보안 위반, 개인 정보 침해, 사이버 사기 등 다양한 형태의 범죄로부터 사용자들을 보호합니다. 또한, 이들은 공공의 사이버 보안 인식을 높이는 교육 프로그램을 제공하고, 새로운 형태의 사이버 범죄를 대비하는 기술적 대응 방안을 개발하는 것을 중요한 임무로 여깁니다.'),

-- Autoplant
('TXT_KEY_BUILDING_FW_AUTOPLANT', '자동생산시설'),
('TXT_KEY_BUILDING_FW_AUTOPLANT_HELP', '도시의 [ICON_CITIZEN]시민 5명마다 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[NEWLINE]도시에서 작업하는 산업단지의 [ICON_PRODUCTION]생산과 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]이 증가하고 모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]자동생산시설[ENDCOLOR]의 [ICON_PRODUCTION]생산이 추가로 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]전문가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]명이 더이상 [ICON_URBANIZATION]도시화에서 오는 [ICON_HAPPINESS_3]불행을 증가시키지 않습니다.[NEWLINE][NEWLINE][ICON_RES_OIL]석유가 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR] 필요합니다. [NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]공장[ENDCOLOR]이 있어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_AUTOPLANT_STRATEGY', '고전적인 공장의 업그레이드 된 자동생산시설은 [ICON_PRODUCTION] 생산량을 크게 증가시킵니다. [COLOR_POSITIVE_TEXT]산업 단지[ENDCOLOR]에 혜택을 줍니다(산업 단지는 근처 제조소에 [ICON_PRODUCTION] 생산 보너스를 추가합니다).'),
('TXT_KEY_BUILDING_FW_AUTOPLANT_PEDIA', '산업이 점점 더 자동화되는 동안 인간의 감독과 개입은 여전히 필요했습니다. 결국, 초기 로봇은 지시받은 만큼만 효과적이었습니다. 그러나 점점 더 자율적인 기계가 개발됨에 따라 이러한 종종 위험한 작업 환경에서 사람이 있어야 할 필요성을 제거하는 것이 점점 더 가능해졌습니다. 자율 제조 및 산업 시설이 점차 보편화되어 생산성을 향상시키는 동시에 인간의 건강과 안전을 보호합니다. 이러한 자동화 시설은 특히 전자상거래의 확산으로 혜택을 받았습니다. 상품을 제조하고 구매하는 전체 프로세스가 사람의 개입이 필요하지 않고 전국적으로 수행될 수 있기 때문입니다.'),

-- Nanomaterial Plant
('TXT_KEY_BUILDING_FW_NANOMAT_PLANT', '나노물질 제조소'),
('TXT_KEY_BUILDING_FW_NANOMAT_PLANT_HELP', '[ICON_RES_NANOMAT]나노물질 [COLOR_POSITIVE_TEXT]5개[ENDCOLOR]를 제공합니다.[NEWLINE][NEWLINE][ICON_RES_IRON]철: [ICON_PRODUCTION]생산 +2[NEWLINE][ICON_RES_COAL]석탄:[ICON_PRODUCTION] 생산 +2[NEWLINE][ICON_RES_OIL]석유:[ICON_PRODUCTION] 생산 +2'),
('TXT_KEY_BUILDING_FW_NANOMAT_PLANT_STRATEGY', '석탄, 석유, 철을 이용하여 나노물질을 추출이 가능하게 되는 기반 시설을 건설하며, 나노물질을 얻습니다.'),
('TXT_KEY_BUILDING_FW_NANOMAT_PLANT_PEDIA', '나노소재 공장은 희토류 원소를 비롯한 특수 자원에서 필수 원소를 추출 및 정제하여 미래 건물 및 첨단 장비에 필요한 복잡한 나노 크기의 구조물을 합성하는 시설입니다. 단순한 탄소 기반 공정을 넘어, 이 공장은 희토류의 고유한 전자적 및 광학적 특성을 활용하여 고성능 나노소재의 대량 생산을 가능하게 합니다. 따라서 나노소재 공장은 단순한 생산 시설을 넘어 희토류의 가치를 미래 문명의 기반으로 전환하는 핵심 허브로 평가받고 있습니다.'),

-- Ecosanctuary
('TXT_KEY_BUILDING_FW_ECOSANCTUARY', '생태친화시설'),
('TXT_KEY_BUILDING_FW_ECOSANCTUARY_HELP', '야영지, 브라질 소방목 벌목장, 제재소, 자연보호구역, 친환경마을의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE]모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]생태친화시설[ENDCOLOR]의 [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. 매턴 도시의 [ICON_PRODUCTION]생산의 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR]만큼의 [ICON_CULTURE]문화로 전환합니다. 도시의 [ICON_TOURISM]관광이 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][ICON_RESEARCH]문맹, [ICON_URBANIZATION]도시화, [ICON_RELIGION]종교 분쟁에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]식료품 상점[ENDCOLOR]이 있어야 하고 [COLOR_NEGATIVE_TEXT]수직형 농장[ENDCOLOR]이 없어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_ECOSANCTUARY_STRATEGY', '생태친화시설은 나무와 습지와 공존할 계획이라면 생산과 문화에 유용합니다. 도시에서 작업한 모든 야영장, 브라질 소방목장, 제재소, 간척지, 자연 보호 구역 및 생태 공동체를 추가 생산 및 문화 보너스 산출물로 현대화하십시오. 행복이 증가합니다.'),
('TXT_KEY_BUILDING_FW_ECOSANCTUARY_PEDIA', '생태 철학이 강한 지역 사회에서는 주변의 야생 자연 지역과 연결되어 있다고 느낄 수 있는 방법에 대한 깊은 필요성을 느꼈습니다. 자연 보호 구역이 가장 즐거운 기회를 제공했지만 모든 사람이 지역 보호 구역을 즐길 시간과 자원을 아끼지 못했습니다. 그 결과, 이러한 커뮤니티는 커뮤니티 자체에 위치한 자연 보호 구역인 생태 보호 구역을 개발하기 시작했습니다. 필요에 따라 여전히 어느 정도 인공적이지만 동식물 사육장보다 훨씬 더 자연스럽고 자연스러워서 대중이 자연 세계와 훨씬 더 긴밀하게 연결되어 있다고 느낄 수 있습니다. 이 피난처는 종종 다양한 예술, 음악 및 문학 작품에 영감을 주는 문화 센터가 되었습니다.'),

-- Cryptobank
('TXT_KEY_BUILDING_FW_CRYPTOBANK', '암호화폐 거래소'),
('TXT_KEY_BUILDING_FW_CRYPTOBANK_HELP', '도시의 [ICON_CITIZEN]시민 5명마다 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]암호화폐 거래소[ENDCOLOR]의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 소도시와 마을의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE][ICON_GOLD]골드로 유닛을 구매하거나 건물 건설에 투자하는 비용이 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR] 감소합니다. [NEWLINE][ICON_GOLD]빈곤에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다. [NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]서버 허브[ENDCOLOR]와 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]증권 거래소[ENDCOLOR]가 있어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_CRYPTOBANK_STRATEGY', '암호화폐 거래소를 건설하여 도시의 골드 출산량을 증가시킬 수 있고, 소도시의 산출량이 증가합니다.'),
('TXT_KEY_BUILDING_FW_CRYPTOBANK_PEDIA', '최초의 암호화폐는 정부나 은행과 같은 중앙 기관에 의존하지 않는 컴퓨터 네트워크를 통해 교환 매체로 작동하도록 설계되었지만 21세기 최신 통화를 손에 넣는 것은 시간 문제였습니다. 따라서 월스트리트 은행은 암호 화폐를 처음으로 채택했으며 Morgan Stanley는 2021년 3월 17일 공격적인 위험 허용 범위를 가진 투자자의 비트코인 소유권을 가능하게 하는 3개의 펀드를 통해 부유한 고객을 위해 비트코인 펀드에 대한 액세스를 제공할 것이라고 발표했습니다. BNY Mellon은 2021년 2월 11일 고객에게 암호화폐 서비스를 제공할 것이라고 발표했습니다. 2021년 4월 20일, Venmo는 고객이 암호화폐를 구매, 보유 및 판매할 수 있도록 플랫폼에 지원을 추가했습니다. 그리고 2021년 10월 금융 서비스 회사 마스터카드는 마스터카드 네트워크의 은행이나 상인이 암호화폐 서비스를 제공할 수 있는 플랫폼에서 디지털 자산 관리자 백트와 협력하고 있다고 발표했습니다.'),

-- VR Training
('TXT_KEY_BUILDING_FW_VR_TRAINING', 'VR 훈련장'),
('TXT_KEY_BUILDING_FW_VR_TRAINING_HELP', '도시에서 생산하는 모든 유닛의 경험치가 [COLOR_POSITIVE_TEXT]25[ENDCOLOR]증가합니다. [ICON_SILVER_FIST]군사 유닛 보급한도가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE][ICON_CULTURE]무료에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.[NEWLINE][ICON_FOOD]/[ICON_PRODUCTION]낙후에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]사관학교[ENDCOLOR]와 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]서버 허브[ENDCOLOR]가 있어야[ENDCOLOR] 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_VR_TRAINING_STRATEGY', 'VR 훈령장을 건설하여 경험치 획득과 군사유닛 보급한도를 증가시킬 수 있습니다.'),
('TXT_KEY_BUILDING_FW_VR_TRAINING_PEDIA', '현대 전장과 군사 장비가 점점 더 정교해짐에 따라 군인들에게 실제로 자신을 위험에 빠뜨리지 않고 전투 경험을 제공하기 위해 다양한 형태의 시뮬레이션 환경에서의 훈련이 점점 더 중요해지고 있습니다.'),

-- Virtual Museum
('TXT_KEY_BUILDING_FW_VIRTUAL_MUSEUM', '메타버스 박물관'),
('TXT_KEY_BUILDING_FW_VIRTUAL_MUSEUM_HELP', '도시의 [ICON_CITIZEN]시민 4명마다 [ICON_CULTURE]문화 및 [ICON_TOURISM]관광이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 도시의 [ICON_GREAT_WORK]걸작 1개마다 [ICON_CULTURE]문화 및 [ICON_TOURISM]관광이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]메타버스 박물관[ENDCOLOR]의 [ICON_CULTURE]문화가 추가로 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.도시의 [ICON_GREAT_ARTIST]위대한 예술가의 출현율이 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR] 증가합니다. [ICON_GREAT_WORK]걸작 예술품 슬롯 2개를 포함합니다.[NEWLINE][ICON_CULTURE]무료에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다. [NEWLINE][NEWLINE]테마보너스: [ICON_CULTURE]문화 + 6[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]박물관[ENDCOLOR]과 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]서버 허브[ENDCOLOR]가 있어야[ENDCOLOR] 건설할 수 있습니다.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]조르지오 아르미에 기업을 설립하면[ENDCOLOR] [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다.'),
('TXT_KEY_BUILDING_FW_VIRTUAL_MUSEUM_STRATEGY', '메타버스 박물관은 미래 시대의 문화 건물입니다. 걸작이나 유물을 위한 슬롯은 하나뿐이지만 이전 문화관련 건물이 필요하지 않습니다.'),
('TXT_KEY_BUILDING_FW_VIRTUAL_MUSEUM_PEDIA', '인터넷의 전 세계적 확산과 함께 갤러리와 예술 작품을 디지털 형태로 보존할 수 있는 박물관들이 등장했습니다. 그러나 디지털 제품은 본질적으로 복제 가능하기 때문에 원본과 사본을 구분하는 데 상당한 제약이 있었습니다. 이를 해결하기 위해 NFT(Non-Fungible Token) 기술이 개발되었습니다. NFT는 각 작품에 고유한 코드를 부여하고 암호화폐와 유사한 분산 컴퓨팅 시스템에 저장하여 진위성과 출처를 보장합니다. 가상현실이 발전함에 따라 몰입형 디지털 세계에서 경험할 수 있는 예술 작품에 대한 수요가 폭발적으로 증가했습니다. 이에 따라 디지털 아트 뮤지엄과 같은 새로운 문화 시설이 설립되어 관객은 디지털 명작에 쉽게 접근하고, 감상하고, 진위 여부를 확인하고, 관리할 수 있게 되었습니다. 이러한 발전은 미래 시대의 예술 소비의 본질 자체를 변화시켰습니다.'),

-- E-Commerce Server
('TXT_KEY_BUILDING_FW_COMMERCE_SERVER', '전자상거래 서버'),
('TXT_KEY_BUILDING_FW_COMMERCE_SERVER_HELP', '도시의 [ICON_CITIZEN]시민 2명마다 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][ICON_GREAT_MERCHANT]위대한 상인의 출현율이 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR] 증가합니다. [ICON_GOLD]빈곤에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다. [NEWLINE][NEWLINE]이 도시로 오는 [ICON_INTERNATIONAL_TRADE]교역로마다 도시의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가하고 교역로를 개설한 상대 문명의 [ICON_GOLD]골드도 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]서버 허브[ENDCOLOR]와 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]증권거래소[ENDCOLOR]가 있어야 하고 [COLOR_NEGATIVE_TEXT]연구 서버, 클라우드 서버, 엔터테인먼트 서버[ENDCOLOR]가 없어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_COMMERCE_SERVER_STRATEGY', '전자상거래 서버는 도시에서 골드와 위대한 상인의 출현율을 높입니다'),
('TXT_KEY_BUILDING_FW_COMMERCE_SERVER_PEDIA', '인터넷의 등장은 상품과 서비스가 전자적으로 교환되는 소위 디지털 경제의 급속한 성장을 가져왔습니다. 사람들은 더 이상 오프라인 매장을 방문할 필요가 없습니다. 전 세계 공급업체로부터 제품을 구매하여 집 앞까지 직접 배송받을 수 있게 되었습니다. 이러한 변화는 소비자의 라이프스타일을 변화시키는 동시에 기업들에게 광활한 신시장과 경쟁 구조를 창출했습니다. [NEWLINE] 전자상거래 서버는 제품 데이터베이스, 결제 시스템, 물류 추적 및 고객 서비스 네트워크를 통합하여 이러한 온라인 거래를 지원하는 핵심 인프라 역할을 합니다. 이 시스템은 안전한 결제, 효율적인 주문 처리 및 개인 맞춤형 제품 추천을 보장합니다. 초기 구현은 단순한 온라인 상점으로 기능했지만, 빅데이터 분석과 인공지능의 통합으로 이제는 포괄적인 글로벌 전자상거래 플랫폼으로 탈바꿈했습니다. 결과적으로 전자상거래 서버는 디지털 무역의 핵심 축이자 현대 경제의 지속적인 발전을 위한 기반 요소로 인정받고 있습니다.'),

-- Entertainment Server
('TXT_KEY_BUILDING_FW_ENTERTAINMENT_SERVER', '엔터테인먼트 서버'),
('TXT_KEY_BUILDING_FW_ENTERTAINMENT_SERVER_HELP', '도시의 [ICON_CITIZEN]시민 2명마다 [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[NEWLINE][ICON_GREAT_PEOPLE]위대한 문화 위인의 출현율이 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR] 증가합니다.[NEWLINE][ICON_CULTURE]무료에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]서버 허브[ENDCOLOR]와 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]방송탑[ENDCOLOR]이 있어야 하고 [COLOR_NEGATIVE_TEXT]연구 서버, 클라우드 서버, 전자상거래 서버[ENDCOLOR]가 없어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_ENTERTAINMENT_SERVER_STRATEGY', '엔터테인먼트 서버는 도시의 문화와 위대한 음악가, 예술가 및 작가 비율을 높일 것입니다.'),
('TXT_KEY_BUILDING_FW_ENTERTAINMENT_SERVER_PEDIA', '원래 정부 및 과학 분야용으로 개발되었던 인터넷은 결국 일상생활로 확장되어 문화적 아이디어와 새로운 창작물을 확산하는 주요 통로가 되었습니다. 가장 영향력 있는 인프라 중 하나는 현대 스트리밍 산업의 중추 역할을 하는 엔터테인먼트 서버입니다. 유튜브와 넷플릭스와 같은 플랫폼은 시청자들이 비디오, 음악, 영화에 실시간으로 접근할 수 있도록 하여, 한때 방송 TV와 영화관이 주도했던 전통적인 미디어 소비 방식을 변화시키고 있습니다. 이러한 서버는 대규모 데이터 전송, 콘텐츠 추천 알고리즘, 저작권 관리 시스템 등의 첨단 기술을 기반으로 운영됩니다. 그 결과, 엔터테인먼트 서버는 글로벌 문화 산업의 핵심 요소일 뿐만 아니라 디지털 경제에서 가장 빠르게 성장하는 분야 중 하나가 되었습니다.'),

-- Cloud Computing
('TXT_KEY_BUILDING_FW_CLOUD_COMPUTING', '클라우드 서버'),
('TXT_KEY_BUILDING_FW_CLOUD_COMPUTING_HELP', '도시의 [ICON_CITIZEN]시민 2명마다 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][ICON_GREAT_ENGINEER]위대한 기술자의 출현율이 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR] 증가합니다.[NEWLINE][ICON_FOOD]/[ICON_PRODUCTION]낙후에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다. [NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]서버 허브[ENDCOLOR]와 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]공장[ENDCOLOR]이 있어야 하고 [COLOR_NEGATIVE_TEXT]연구 서버, 엔터테인먼트 서버, 전자상거래 서버[ENDCOLOR]가 없어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_CLOUD_COMPUTING_STRATEGY', '클라우드 서버는 도시에서 생산 및 위대한 기술자의 출현율을 높일 것입니다.'),
('TXT_KEY_BUILDING_FW_CLOUD_COMPUTING_PEDIA', '인터넷의 등장은 정보 교환에 혁명을 일으켰을 뿐만 아니라 원격 작업을 가능하게 하고, 문서 낭비를 줄이며, 불필요한 시간을 단축함으로써 인간의 생산성을 향상시켰습니다. 이러한 효율성의 급증은 개인과 도시의 생산성을 향상시켰고, 이러한 변화를 원활하게 만드는 클라우드 서버 시스템의 탄생으로 이어졌습니다. 클라우드 서버는 데이터 저장을 중앙 집중화하고 분산 컴퓨팅을 가능하게 함으로써 개인과 기업 모두 네트워크를 통해 필요한 도구와 리소스에 즉시 액세스할 수 있도록 했습니다. 기업들은 보안과 효율성을 모두 보장하기 위해 클라우드 환경을 점점 더 많이 도입하여 문서 제작 및 관리에 소요되던 시간을 크게 단축했습니다. 실시간 협업이 가능해지면서 업무 효율성이 크게 향상되었습니다. 소규모 기업 운영부터 국제 프로젝트까지, 클라우드 서버는 현대 생산성 인프라의 중추로 자리매김했으며, 궁극적으로 디지털 경제의 새로운 표준으로 자리 잡았습니다.'),

-- Research Server
('TXT_KEY_BUILDING_FW_RESEARCH_SERVER', '연구 서버'),
('TXT_KEY_BUILDING_FW_RESEARCH_SERVER_HELP', '도시의 [ICON_CITIZEN]시민 [COLOR_POSITIVE_TEXT]2[ENDCOLOR]명마다 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][ICON_GREAT_SCIENTIST]위대한 과학자의 출현율이 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR] 증가합니다.[NEWLINE][ICON_RESEARCH]문맹에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]서버 허브[ENDCOLOR]와 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]연구소[ENDCOLOR]가 있어야 하고 [COLOR_NEGATIVE_TEXT]엔터테인먼트 서버, 전자상거래 서버, 클라우드 서버[ENDCOLOR]가 없어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_RESEARCH_SERVER_STRATEGY', '연구 서버는 도시에서 과학 및 위대한 과학자 비율을 높일 것입니다.'),
('TXT_KEY_BUILDING_FW_RESEARCH_SERVER_PEDIA', '초기 인터넷은 주로 대학과 연구 기관을 연결하는 컴퓨터 네트워크를 기반으로 구축되었으며, 아이디어와 정보를 더욱 효과적으로 교환하도록 설계되었습니다. 인터넷이 유비쿼터스 시스템으로 발전함에 따라 전 세계 연구자들은 어디에서나 데이터에 접근하고, 서로의 결과를 분석하고, 전례 없는 속도로 논문을 교환할 수 있게 되었습니다. 이러한 발전은 과학 연구 수행에 완전히 새로운 방식을 열어주었고, 아마추어와 애호가들로 구성된 대규모 커뮤니티조차도 연구 중심 과제를 지원하거나 기여할 수 있게 되었습니다. 특히 SCI 논문의 검증 및 동료 심사를 대면 회의 없이 온라인으로 진행할 수 있게 되어 검증 속도가 크게 향상되었습니다. 그 결과, 한때 수개월 또는 수년이 걸리던 연구가 단 몇 주 만에 출판될 수 있게 되었고, 이는 과학 지식의 축적과 발전을 가속화하는 데 결정적인 역할을 했습니다.'),

-- Converters
('TXT_KEY_BUILDING_FW_CONVERTER', '나노물질 추출공장 (석탄)'),
('TXT_KEY_BUILDING_FW_CONVERTER_OIL', '나노물질 추출공장 (석유)'),
('TXT_KEY_BUILDING_FW_CONVERTER_IRON', '나노물질 추출공장 (철)'),
('TXT_KEY_BUILDING_FW_CONVERTER_HELP', '도시의 해당된 [ICON_RES_COAL]석탄, [ICON_RES_OIL]석유, [ICON_RES_IRON]철 자원 타일의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][ICON_RES_NANOMAT]나노물질 [COLOR_POSITIVE_TEXT]4개[ENDCOLOR]를 제공합니다. [NEWLINE][NEWLINE]도시에 적어도 하나 이상의 개발된 [COLOR_YELLOW][ICON_RES_COAL]석탄, [ICON_RES_OIL]석유, [ICON_RES_IRON]철 자원[ENDCOLOR] 타일이 있어야하고, 도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]나노물질 제조소[ENDCOLOR]가 있어야 합니다.'),
('TXT_KEY_BUILDING_FW_CONVERTER_STRATEGY', '필요한 자원과 나노물질 공장을 소유하고 있다면 이를 추가 나노물질로 변환할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_CONVERTER_PEDIA', '나노물질 공학분야의 발전은 나노물질의 개발을 더욱 발전시키는 데 도움이 되었습니다. 원래의 나노 물질 공장에는 작업에 매우 특정한 환경과 원자재가 필요했지만 진정한 나노 기술은 아니지만 더 정교한 나노 크기의 기계는 프로세스를 더 쉽고 덜 집중적으로 만드는 데 도움이 되었습니다. 석탄이나 석유와 같은 원자재는 특수 제작된 변환기에 공급될 수 있으며 나노 크기의 기계는 이를 유용한 나노 물질로 변환하기 위해 충실히 작동합니다. 이러한 초기 나노 기계가 발견한 모든 유기 물질을 나노 물질로 변환하여 잠재적으로 장난을 칠 수 있다는 우려가 있었지만, 이러한 나노 크기 기계의 비교적 간단한 구조는 여전히 작동하려면 보호된 환경이 필요하고 야생에서 오래 생존할 가능성이 없음을 의미했습니다. 그들의 프로그래밍과 디자인은 여전히 상대적으로 제한적이었습니다. 특정 자료만 다른 자료로 변환할 수 있었고 예를 들어 자신의 사본을 만들 수 없었기 때문입니다. 그럼에도 불구하고 사람들은 더 많은 생태학적 사고를 가진 사회에서 나노물질 추출공장을 환경에 대한 심각한 위험으로 간주했습니다.'),

-- Nanoforge
('TXT_KEY_BUILDING_FW_NANOFORGE', '나노물질 군수공장'),
('TXT_KEY_BUILDING_FW_NANOFORGE_HELP', '모든 군사 유닛을 생산할 때 [ICON_PRODUCTION]생산보너스를 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR]제공합니다. [ICON_SILVER_FIST]군사 유닛 보급한도가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE][ICON_RES_NANOMAT]나노물질 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR]가 필요합니다.'),
('TXT_KEY_BUILDING_FW_NANOFORGE_STRATEGY', '나노물질 군수공장을 건설하여 군사유닛 생산을 빠르게 할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_NANOFORGE_PEDIA', '나노물질 군수공장은 나노 기술을 활용하여 새로운 재료와 장비를 생산하는 전용 시설입니다. 나노물질은 금속, 기계, 컴퓨터 등 온갖요소에 작용을 하게 되었고, 합금 방어능력, 생산능력 등 경제, 생산 전반적인 부분을 개선시켜주었습니다. 이러한 장점은 곧 전쟁무기 개발에 착수를 하게되었고, 이 일환으로 나노물질 군수공장을 건설하게 되었습니다.'),

-- Particle Accelerator
('TXT_KEY_BUILDING_FW_PARTICLE_ACCELERATOR', '입자가속기'),
('TXT_KEY_BUILDING_FW_PARTICLE_ACCELERATOR_HELP', '도시의 [ICON_CITIZEN]시민 5명마다 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]증가합니다. 모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]입자 가속기[ENDCOLOR]의 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]증가합니다. 첨단에너지 연구단지의 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][ICON_RESEARCH]문맹에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]감소합니다. [NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]연구소[ENDCOLOR]가 있어야 건설할 수 있습니다. [NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]파이락사이트 소재 [ENDCOLOR]기업을 설립하면 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]3[ENDCOLOR] 증가합니다. '),
('TXT_KEY_BUILDING_FW_PARTICLE_ACCELERATOR_STRATEGY', '입자가속기를 건설하여 도시의 과학 산출량을 증가시킵니다. 첨단 연구단지의 과학 산출량이 증가합니다.'),
('TXT_KEY_BUILDING_FW_PARTICLE_ACCELERATOR_PEDIA', '입자 가속기는 고에너지 조건에서 물리적 현상을 조사할 수 있는 중요한 과학 장비입니다. 이것은 양자 이론 및 천체 물리학과 같은 분야에 대한 추가 연구에 도움이 됩니다. 입자가속기는 전자나 양성자와 같이 전기를 띤 입자를 강력한 전기장이나 자기장 속에서 가속시켜 큰 운동 에너지를 발생시키는 장치입니다. 우주를 구성하는 4대힘(강력, 약력, 중력, 전자기력)에 대한 규명을 할 수 있게 되었고, 입자가속기를 통해 중력을 만들어낼 수 있는 힉스입자를 발견한 것은 큰 발견입니다. 그리고 이 우주를 이해하는 데 가장 큰 중요한 단서를 제공해줍니다.'),

-- Vertical Farms
('TXT_KEY_BUILDING_FW_VERTICAL_FARM', '수직형 농장'),
('TXT_KEY_BUILDING_FW_VERTICAL_FARM_HELP', '농장, 계단식 농장, 간척지, 수경재배지구의 [ICON_FOOD]식량이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]수직형 농장[ENDCOLOR]의 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. 매턴 도시의 [ICON_FOOD]식량의 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR]만큼의 [ICON_RESEARCH]과학을 제공합니다.[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]약제사[ENDCOLOR]가 있어야 하고 [COLOR_NEGATIVE_TEXT]균류 농학 연구소[ENDCOLOR]가 없어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_VERTICAL_FARM_STRATEGY', '추가 식량과 과학 보너스 산출물로 도시에서 작업한 모든 농장, 테라스, 재배지 및 수경재배시설을 건설하여 산출량을 극대화하십시오.'),
('TXT_KEY_BUILDING_FW_VERTICAL_FARM_PEDIA', '수직 농업은 수직으로 쌓인 층, 수직으로 경사진 표면 및/또는 다른 구조물에 통합된 식품을 생산하는 관행입니다. 수직 농업에 대한 현대적인 아이디어는 모든 환경 요소를 제어할 수 있는 제어 환경 농업(CEA) 기술을 사용합니다. 이러한 시설은 빛의 인공 제어, 환경 제어(습도, 온도, 가스...) 및 관비를 활용합니다. 일부 수직 농장은 인공 조명과 금속 반사경으로 자연광을 강화할 수 있는 온실과 유사한 기술을 사용합니다. 주요 도시의 구조에 통합된 이러한 농장은 기후 및 토양 조건과 무관한 지역 식량 공급원을 제공합니다.'),

-- Bioengineering Complex
('TXT_KEY_BUILDING_FW_BIOFLESH_INDUSTRY', '생명공학 연구단지'),
('TXT_KEY_BUILDING_FW_BIOFLESH_INDUSTRY_HELP', '[ICON_RES_ADN_FUNGUS] 제노포자 [COLOR_POSITIVE_TEXT]4개[ENDCOLOR]를 제공합니다. 도시의 식량이 [COLOR_NEGATIVE_TEXT]6[ENDCOLOR]감소합니다.[NEWLINE][NEWLINE][ICON_RES_COW]소:[ICON_GOLD]골드 +2[NEWLINE][ICON_RES_DEER]사슴:[ICON_GOLD]골드 +2[NEWLINE][ICON_RES_BISON]들소:[ICON_GOLD]골드 +2[NEWLINE][ICON_RES_HORSE]말:[ICON_GOLD]골드 +2[NEWLINE][ICON_RES_SHEEP]양:[ICON_GOLD]골드 +2[NEWLINE][NEWLINE][NEWLINE]도시의 [ICON_FOOD] 식량 [COLOR_NEGATIVE_TEXT]-6[ENDCOLOR].[NEWLINE][NEWLINE][ICON_RES_HORSE] 말 3 필요.'),
('TXT_KEY_BUILDING_FW_BIOFLESH_INDUSTRY_STRATEGY', '동물모델·정밀 발효·조직공학 등 생명공학 인프라를 집적하여 제노포자 확보와 상용화를 가속합니다. 동물 자원이 많은 도시에 건설하시면 투자 회수에 유리합니다. 다만 과학적 성과의 이면에는 무수한 실험동물의 희생이라는 아이러니가 뒤따릅니다.'),
('TXT_KEY_BUILDING_FW_BIOFLESH_INDUSTRY_PEDIA', '생명공학 연구단지는 실험동물센터(비비움·무균/유생물 시설), 정밀 발효·효소 공정, 조직공학·오가노이드 플랫폼, 품질관리(GxP) 라인을 한곳에 통합한 도시형 연구·개발 복합체입니다. 표준화된 사육·배양, in vivo/in vitro 평형시험, 유전·대사 공정 최적화를 통해 성장성·저항성·영양 프로파일이 개선된 모델과 대사 산물을 확보하고, 이를 식품·의약·소재 공정에 연결합니다. 모든 실험은 생물안전·동물윤리 지침(3R 원칙, IACUC 심의)을 준수하도록 설계되지만, 검증 가능한 지식과 치료법을 얻기 위한 과정에서 다수의 개체가 생을 마감하는 아이러니를 내포합니다. 도시 차원에서는 사료·설비 유지로 단기적으로 [ICON_FOOD] 식량 여력이 감소할 수 있으나, 동물 자원 밀집 지역에서는 부산물의 고부가가치화와 기술 이전을 통해 경제적 수익과 연구 효율이 증대됩니다. 이 단지는 식량 안보, 의생명 혁신, 바이오소재 개발을 견인하는 핵심 축으로 기능합니다.'),

-- Biofactory
('TXT_KEY_BUILDING_FW_BIOFACTORY', '바이오 공장'),
('TXT_KEY_BUILDING_FW_BIOFACTORY_HELP', '초원과 평원 타일의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]바이오 공장, 해양 바이오 산업단지[ENDCOLOR]의 [ICON_FOOD]식량이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. 매턴 도시의 [ICON_PRODUCTION]생산의 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR]를 [ICON_FOOD]식량으로 전환합니다.[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]공장[ENDCOLOR]이 있어야 하고 [COLOR_NEGATIVE_TEXT]심층시추공, 지열공장, dp해양바이오산업단지[ENDCOLOR]가 없어야 건설할 수 있습니다. [COLOR_NEGATIVE_TEXT]설원[ENDCOLOR]에는 건설할 수 없습니다.'),
('TXT_KEY_BUILDING_FW_BIOFACTORY_STRATEGY', '바이오공장은 생산과 식품 생산량을 증가시킵니다. 도시에 대부분 평원과 초원이 있는 경우 모두 하나의 추가 생산력과 식량에 대한 보너스 생산력을 얻습니다.'),
('TXT_KEY_BUILDING_FW_BIOFACTORY_PEDIA', '산업화 초기, 인류는 유전자 조작 작물과 미생물 발효를 대규모 공정에 접목시켜 식량과 소재 생산을 혁신적으로 확대했습니다. 바이오공장은 토양의 영양순환을 인위적으로 가속화하고 특정 생물군을 대량 배양하여, 혹독한 환경에서도 안정적인 생산 체계를 가능하게 했습니다. 일부 연구자들은 이 과정에서 생명체의 돌연변이가 비정상적으로 가속화된다고 경고했지만, 산업적 효율성은 그러한 우려를 압도했습니다.[NEWLINE]오늘날 바이오공장은 기존 중공업 공정을 폐쇄형 생물공정으로 대체·보완하며, 환경 부담을 줄이고 자원 순환을 촉진하는 산업 거점으로 자리매김했습니다. 미생물군집·재조합 세포·정밀 발효를 통해 단백질, 지방산, 아미노산, 바이오폴리머 전구체 등을 생산하며, 부산물은 혐기성 소화와 가스 발효를 거쳐 에너지와 원료로 재활용됩니다. 이러한 체계는 폐기물 최소화와 탈탄소화를 실현하고, 생명 자체를 생산 도구로 전환한 새로운 산업혁명의 출발점으로 평가받습니다.'),

-- Hydrothermal Factory
('TXT_KEY_BUILDING_FW_HYDROTHERMAL_FACTORY', '해양 바이오 산업단지'),
('TXT_KEY_BUILDING_FW_HYDROTHERMAL_FACTORY_HELP', '연안 및 대양 타일의 [ICON_PRODUCTION] 생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.매턴 도시의 [ICON_PRODUCTION] 생산의 [COLOR_POSITIVE_TEXT]5%[ENDCOLOR]를 [ICON_FOOD] 식량과 [ICON_RESEARCH] 과학으로 각각 전환됩니다.모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]바이오 공장, 해양 바이오 산업단지[ENDCOLOR]의 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][COLOR_YELLOW]해안도시[ENDCOLOR]에만 건설 할 수 있습니다. [COLOR_PLAYER_NETHERLANDS_BACKGROUND]공장[ENDCOLOR]과 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]항만[ENDCOLOR]이 있어야 하고[ENDCOLOR]이 있어야 하며, [COLOR_NEGATIVE_TEXT]심층시추공, 지열공장, 바이오공장[ENDCOLOR]이 없어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_HYDROTHERMAL_FACTORY_STRATEGY', '공장 기반의 해양 공정 허브로, 연안 타일의 생산 효율을 끌어올리며 생산 일부를 식량·과학으로 전환해 장기 성장을 견인합니다. 해양 탐사선과 시험부두에서 축적한 데이터는 제노포자–금속 계면 연구로 이어지며, 후속 Xen–Al(제노–알루) 공정과 바이오-양자 주조소의 발판이 됩니다. 이 건물은 바이오 공장과 인프라·규정이 충돌하므로 서로 배타적입니다.'),
('TXT_KEY_BUILDING_FW_HYDROTHERMAL_FACTORY_PEDIA', '해양바이오산업단지는 연안·해양에서 확보한 미세조류, 해조류, 해양 미생물의 대사 산물을 산업 규모로 발굴·배양·정제하는 복합 거점입니다. 포토바이오리액터와 발효 라인, 막여과·크로마토그래피 기반의 다운스트림 공정, 화장품·식품용 GMP/HACCP 생산시설을 한곳에 통합하여 시제품부터 양산까지의 파이프라인을 구축합니다. 이곳에서 생산되는 핵심 품목은 기능성 화장품 원료(푸코이단·알긴산·카라기난, 항산화·항염 성분, 마이코스포린계 아미노산의 자외선 차단 모듈), 건강기능식품·영양소(EPA·DHA 등 오메가-3, 해양 폴리페놀), 의약·진단용 효소와 극한효소(저·고온 활성), 친환경 계면활성제와 항오염 생물막 제어소재 등이며, 파일럿 검증–표준화–품질관리 체계를 통해 글로벌 공급망에 연계합니다.[NEWLINE]동시에 단지는 신소재 개발의 전진기지로서 해양 유래 바이오폴리머(PHA/PHB 등 생분해성 플라스틱), 키틴/키토산과 해조류 셀룰로스, 알긴산 에어로젤, 홍합접착단백질 모사 바이오접착제, 저독성 방오 코팅을 비롯한 차세대 바이오매터리얼을 개발·상용화합니다. 영양염 회수·재순환, 이산화탄소 포집·이용, 무방류(Zero-Liquid-Discharge) 공정과 더불어 잘피·해조 ‘묘목장’ 조성 등 블루카본 복원 사업을 병행하여 지속가능성을 확보합니다. 학·연·산 협력과 표준·인증 체계를 통해 지역 경제와 수출 기반을 확장하며, 축적된 데이터와 공정 노하우는 차후의 고도 바이오공정과 첨단 소재 산업을 견인합니다.'),

-- Genejack Facility
('TXT_KEY_BUILDING_FW_GENEJACK_FACILITY', '첨단 바이오 연구소'),
('TXT_KEY_BUILDING_FW_GENEJACK_FACILITY_HELP', '도시 근처에 [ICON_RES_ADN_FUNGUS]제노포자 [COLOR_POSITIVE_TEXT]2개[ENDCOLOR]가 있는 타일이 출현합니다.[NEWLINE][NEWLINE]평원 타일의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR], 초원 타일의 [ICON_FOOD]식량 [COLOR_POSITIVE_TEXT]1[ENDCOLOR], 사막, 설원, 툰드라 타일의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]제노포자배양연구소, 유전자공학 연구소[ENDCOLOR]가 있어야 하고 [COLOR_NEGATIVE_TEXT]지구심층 물리연구소[ENDCOLOR]가 없어야 합니다.'),
('TXT_KEY_BUILDING_FW_GENEJACK_FACILITY_STRATEGY', 'GMO 식량 재배가 좋은 기후가 있는 지역(초원과 평원)에 산출량을 증가시킵니다. '),
('TXT_KEY_BUILDING_FW_GENEJACK_FACILITY_PEDIA', '첨단 바이오연구소는 되었습니다. 토양과 생명체의 관계를 인위적으로 재설계하려는 시도에서 비롯되었습니다. 초기에는 단순히 토양 속 유기체와 미생물을 유전적으로 강화하여 혹독한 환경에서도 영양순환을 촉진하고, 평원·초원·사막·설원·툰드라 같은 다양한 지형에서 산출량을 높이는 데 목적이 있었습니다.[NEWLINE]그러나 연구가 진전되면서 토양 깊숙한 층위에서 나타나는 예상치 못한 반응과 특이한 광물-생체 상호작용이 보고되기 시작했습니다. 일부 학자들은 이를 단순한 돌연변이 가속 현상으로 해석했지만, 다른 이들은 아직 알려지지 않은 근본적 변환 과정이 개입하고 있다고 주장합니다.[NEWLINE]이 과정에서 토양 생태계는 특정 지형의 한계를 넘어 모든 환경에서 그 고유한 성질을 더욱 강화하는 결과를 낳았습니다. 이러한 현상은 여전히 논란이 많지만, 연구소는 토양 개량과 자원 증대에서 뚜렷한 성과를 거두며 각국의 관심을 끌고 있습니다. 동시에 연구자들은 토양 속 미시적 결합 구조에서 생명의 양자적 특성이 물질과 미묘하게 얽혀 있다는 정황을 발견했으며, 이는 앞으로 전혀 새로운 발전 가능성을 열어줄 수 있음을 은근히 시사합니다.'),

-- Implant Clinic
('TXT_KEY_BUILDING_FW_IMPLANT_CLINIC', '임플란트 시술소'),
('TXT_KEY_BUILDING_FW_IMPLANT_CLINIC_HELP', '도시의 [ICON_CITIZEN]시민 10명마다 [ICON_CULTURE]문화, [ICON_GOLD]골드, [ICON_PRODUCTION]생산이 각각 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]씩 증가합니다.[NEWLINE] 바이오계열 보병을 생산할 때 [ICON_PRODUCTION]생산보너스를 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR] 제공합니다. [ICON_SILVER_FIST]군사 유닛 보급한도가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]화약유닛에 [COLOR_PLAYER_PURPLE]임플란트[ENDCOLOR]승급을 부여합니다. [NEWLINE][ICON_FOOD]/[ICON_PRODUCTION]낙후에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]병원[ENDCOLOR]이 있어야 하고 [COLOR_NEGATIVE_TEXT]우주선 발사센터[ENDCOLOR]가 없어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_IMPLANT_CLINIC_STRATEGY', '새로이 생산하는 유기체 유닛(클론 트루퍼, 돌연변이, 생체강화 보병, 슈퍼솔져, 바이오 트루퍼)에 생산이 빨라지고, 화약유닛에게 전투력이 증대되는 임플란트 승급을 부여합니다. 도시에 우주선 발사 시설이 있으면 건설할 수 없습니다.'),
('TXT_KEY_BUILDING_FW_IMPLANT_CLINIC_PEDIA', '임플란트 기술이 급속도로 발전함에 따라, 급속히 성장하는 시장의 요구에 부응하는 전문 서비스를 제공하는 임플란트 클리닉이 빠르게 늘어나고 있습니다. 이러한 시설은 기존의 치과 또는 관절 임플란트를 넘어 심장, 폐, 신장, 간과 같은 인공 장기 이식과 정밀 생체 보철물까지 제공합니다. 신경 인터페이스와 나노 크기의 소재가 통합됨에 따라 임플란트는 더 이상 손상된 기능을 회복하는 데 국한되지 않고 인간의 능력을 적극적으로 향상시킬 수 있습니다. 이러한 발전을 통해 사람들은 노화되거나 손상된 신체 부위를 대체하여 더욱 건강하고 장수할 수 있게 되었습니다. 경우에 따라 군사 또는 전문 분야에 특화된 임플란트가 개발되어 개인에게 탁월한 신체적 또는 인지적 능력을 부여하기도 했습니다. 이처럼 임플란트 클리닉은 단순한 의료 시설을 넘어 미래 사회의 장수, 신체 강화, 그리고 생물의학 혁신을 향한 초석으로 자리매김하고 있습니다.'),

-- Network Backbone
('TXT_KEY_BUILDING_FW_NETWORK_BACKBONE', '네트워크 중심지'),
('TXT_KEY_BUILDING_FW_NETWORK_BACKBONE_HELP', '마을, 고유타일시설, 통신기지국, 발전기의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE]모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]연구 서버[ENDCOLOR]의 [ICON_RESEARCH]과학, [COLOR_PLAYER_NETHERLANDS_BACKGROUND]엔터테인먼트 서버[ENDCOLOR]의 [ICON_CULTURE]문화, [COLOR_PLAYER_NETHERLANDS_BACKGROUND]전자상거래 서버[ENDCOLOR]의 [ICON_GOLD]골드, [COLOR_PLAYER_NETHERLANDS_BACKGROUND]클라우드 서버[ENDCOLOR]의 [ICON_PRODUCTION]생산이 각 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]씩 증가합니다.[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]서버 허브[ENDCOLOR] 가 있어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_NETWORK_BACKBONE_STRATEGY', '도시에 네트워크 중심지 서버를 설치하여 각 서버의 산출량을 증대시킵시오.'),
('TXT_KEY_BUILDING_FW_NETWORK_BACKBONE_PEDIA', '상호 연결된 컴퓨터 시스템이 사회에서 점점 더 보편화되면서 일부 연구원과 엔지니어는 기존 네트워크에서 실제로 얼마나 많은 정보 트래픽을 처리할 수 있는지에 대해 우려하기 시작했습니다. 원격 시스템 간의 데이터 전송을 처리하는 점점 더 정교한 수단이 개발되었고 일부 도시에서는 이를 수용하기 위한 전용 인프라가 마련되었습니다. 이 새로운 인프라는 엄청난 양의 데이터를 오류 없이 명확하게 전송할 수 있기 때문에 특히 신경 직접 인터페이스의 출현과 함께 미래 정보 기술 및 데이터 네트워크의 중추를 형성할 것입니다. 또한 모든 사람이 기존 컴퓨터 서버에 더 쉽게 액세스할 수 있도록 하여 새로운 아이디어의 보급을 크게 늘렸습니다. 그러나 그들은 점점 더 확장되는 피드 사이트 네트워크와 경쟁했고 공간과 대역폭이 제한된 많은 커뮤니티는 우선 순위를 정해야 했습니다.'),

-- Biofuel Refinery
('TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY', '바이오연료 정제공장(밀)'),
('TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY_RICE', '바이오연료 정제공장(쌀)'),
('TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY_BANANA', '바이오연료 정제공장(바나나)'),
('TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY_MAIZE', '바이오연료 정제공장(옥수수)'),
('TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY_HELP', '도시의 해당된 [ICON_RES_WHEAT]밀, [ICON_RES_RICE]쌀, [ICON_RES_BANANA]바나나, [ICON_RES_MAIZE]옥수수가 도시에 있어야 합니다. 도시의 [ICON_FOOD]식량이 [COLOR_NEGATIVE_TEXT]3[ENDCOLOR] 감소합니다. [NEWLINE][NEWLINE][ICON_RES_OIL]석유 [COLOR_POSITIVE_TEXT]4개[ENDCOLOR]를 제공합니다.[NEWLINE][NEWLINE]도시에 적어도 하나 이상의 개발된 [COLOR_YELLOW][ICON_RES_WHEAT]밀[ENDCOLOR], [COLOR_YELLOW][ICON_RES_RICE]쌀[ENDCOLOR], [COLOR_YELLOW][ICON_RES_BANANA]바나나[ENDCOLOR],[COLOR_YELLOW][ICON_RES_MAIZE]옥수수[ENDCOLOR]타일이 있어야 건설할 수 있습니다.[NEWLINE][NEWLINE]이 건물은 문명당 [COLOR_YELLOW]최대 3개[ENDCOLOR]까지 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY_STRATEGY', '도시는 석유 4개를 얻지만 도시의 일부 식량을 잃게 됩니다.'),
('TXT_KEY_BUILDING_FW_BIOFUEL_REFINERY_PEDIA', '환경오염으로 인한 지구오염과 파괴가 심각해지자, 포르쉐는 E-fuel연구에 박차를 가하고 있습니다. e-연료(E-fuel)은 물(H2O)과 이산화탄소(CO2)에서 생산되는 합성 유체 연료입니다. 생산에 필요한 전기는 재생 에너지(태양광 및 풍력)에서 얻습니다. e-연료는 사실상 연소 엔진의 탄소 중립을 가능하게 해줄 수 있습니다. 엔진의 CO2 배출량이 e-연료 생산을 위해 대기에서 수집한 이산화탄소량에 상응하기 때문입니다. e-연료는 화석 연료를 대체할 수 있기 때문에 이산화탄소 배출량을 즉시 감소시킬 수 있습니다. 가용성에 따라 e-연료도 처음에는 기존 연료에 더해질 수 있습니다. 다른 장점으로는 기존 인프라를 이용한 저장 및 운송 가능성합니다. 또한, 세계 일부 지역에서 풍부하게 발견되는 친환경 전기의 잠재력은 e-연료에 저장되어 장거리 수송이 가능합니다. '),

-- Borehole
('TXT_KEY_BUILDING_FW_BOREHOLE', '심층 시추공'),
('TXT_KEY_BUILDING_FW_BOREHOLE_HELP', '광산과 채석장의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]심층 시추공[ENDCOLOR]의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR]증가합니다. 매턴 [ICON_PRODUCTION]생산의 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR]가 [ICON_GOLD]골드로 전환합니다. [NEWLINE][NEWLINE]도시에 [COLOR_NEGATIVE_TEXT]산이 없어야[ENDCOLOR] 하고, [COLOR_NEGATIVE_TEXT]바이오공장[ENDCOLOR]이나 [COLOR_NEGATIVE_TEXT]지열공장[ENDCOLOR]이 없어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_BOREHOLE_STRATEGY', '도시에서 작업한 모든 광산 및 채석장을 현대화시켜 생산과 골드의 산출량을 증가시킵니다.'),
('TXT_KEY_BUILDING_FW_BOREHOLE_PEDIA', '20세기 들어 가장 깊은 곳은 지하 12km가 넘는 콜라 슈퍼딥 시추공을 비롯해 다양한 심해 시추 작업이 진행됐지만, 21세기에 와서야 첨단 소재와 첨단 장비가 개발되면서 시추공이 대중화됐다. 더 실용적이고 인공적으로 희귀한 광물과 마그마를 끌어올릴 수 있을 만큼 깊이 파낼 수 있습니다. 시추공 노력은 광산과 지열 발전소의 산출량을 향상시켜 풍부한 광물 자원과 에너지를 제공하는 데 도움이 되었습니다.'),

-- Geothermal Factory
('TXT_KEY_BUILDING_FW_GEOTHERMAL_FACTORY', '지열 공장'),
('TXT_KEY_BUILDING_FW_GEOTHERMAL_FACTORY_HELP', '이 건물이 지어진 도시 3타일 이내의 산 1개마다 [ICON_PRODUCTION] 생산과 [ICON_GOLD] 골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]증가합니다. 언덕 타일의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]이 증가하고 모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]지열 공장[ENDCOLOR]의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR]증가합니다. 매턴 [ICON_PRODUCTION] 생산의 [COLOR_POSITIVE_TEXT]5%[ENDCOLOR]는 [ICON_GOLD] 골드와 [ICON_PRODUCTION] 생산으로 전환합니다.[NEWLINE][NEWLINE]도시 주변 [COLOR_YELLOW]2 타일 이내에 산[ENDCOLOR]이 있어야 건설할 수 있습니다. 도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]공장[ENDCOLOR]이 있어야 하고 [COLOR_NEGATIVE_TEXT]심층 시추공[ENDCOLOR]이나 [COLOR_NEGATIVE_TEXT]바이오공장[ENDCOLOR]이 없어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_GEOTHERMAL_FACTORY_STRATEGY', '도시에 작업 중인 언덕타일과 산의 생산과 골드 산출량을 증가시킵니다.'),
('TXT_KEY_BUILDING_FW_GEOTHERMAL_FACTORY_PEDIA', '지열 발전소는 지하 저장소에서 표면으로 유체를 끌어와 증기를 생성합니다. 이 증기는 전기를 생성하는 터빈을 구동합니다. 지열 발전소 기술에는 건증기, 재증발증기 및 이원주기의 세 가지 주요 유형이 있습니다. 변환 유형은 발전소 설계의 일부이며 일반적으로 지하 유체(증기 또는 물)의 상태와 온도에 따라 달라집니다.'),

-- URF
('TXT_KEY_BUILDING_FW_ANTIMATTER_RESEARCH', '지구심층 물리연구소'),
('TXT_KEY_BUILDING_FW_ANTIMATTER_RESEARCH_HELP', '이 건물이 지어진 도시 3타일 이내의 산 1개마다 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]증가합니다. 언덕 타일의 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]이 증가하고 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]지열 공장[ENDCOLOR]의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR]증가합니다. 매턴 [ICON_PRODUCTION] 생산의 [COLOR_POSITIVE_TEXT]5%[ENDCOLOR]는 [ICON_GOLD] 골드와 [ICON_PRODUCTION] 생산으로 전환합니다. [NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]나노물질제조소, 입자가속기[ENDCOLOR]가 있어야 하고 [COLOR_NEGATIVE_TEXT]첨단 바이오 연구소[ENDCOLOR]가 없어야 합니다.'),
('TXT_KEY_BUILDING_FW_ANTIMATTER_RESEARCH_STRATEGY', '지구심층 물리연구소를 통해 나노물질을 확보하고, 첨단 물리학의 발전을 통해 양자공학 연구의 기반이 되는 우주 궤도공학, 핵광자공학의 발전을 토대를 만듭니다.'),
('TXT_KEY_BUILDING_FW_ANTIMATTER_RESEARCH_PEDIA', '지구심층 물리연구소는 인류가 지구의 심장부에 도전하는 심층 시추공 실험에서 비롯되었습니다.[NEWLINE]본래는 고온·고압의 지열 환경을 탐구하기 위해 건설되었으나, 이후에는 중성미자, 암흑물질, 양자역학, 우주 물리학까지 아우르는 다학제적 연구 중심지로 발전했습니다.심층 시추 과정에서 드러나는 극한의 지질 환경은 희귀한 지층을 노출시켰고, 과학자들은 그러한 일환으로 이곳에서 막대한 압력과 온도 속에서 형성된 희토류 원소와 나노물질 전구체를 채취할 수 있었습니다.지구심층 물리연구소는 지질학, 에너지 공학, 첨단 소재 과학이 융합되는 최전선으로 자리 잡으며, 미래의 반물질 연구와 양자 기술 혁신을 향한 토대를 마련합니다.'),

-- Launch Facility
('TXT_KEY_BUILDING_FW_LAUNCH_FACILITY', '우주선 발사센터'),
('TXT_KEY_BUILDING_FW_LAUNCH_FACILITY_HELP', '도시의 [ICON_CITIZEN]시민 10명마다 [ICON_RESEARCH]과학, [ICON_PRODUCTION]생산이 각각 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]씩 증가합니다.[NEWLINE]공중 유닛을 생산할 때 [ICON_PRODUCTION]생산보너스를 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR]제공하고, 도시에서 생산하는 공중 유닛에 [COLOR_PLAYER_PURPLE]우주선[ENDCOLOR]승급을 부여합니다.[NEWLINE][ICON_FOOD]/[ICON_PRODUCTION]낙후, [ICON_URBANIZATION]도시화에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]감소합니다. [NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]공장[ENDCOLOR]이 있어야 하고, [COLOR_NEGATIVE_TEXT]임플란트 시술소[ENDCOLOR]가 없어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_LAUNCH_FACILITY_STRATEGY', '도시의 생산과 과학 산출량이 증가합니다.'),
('TXT_KEY_BUILDING_FW_LAUNCH_FACILITY_PEDIA', '초창기 로켓은 단순히 대기권 가장자리에 소형 물체를 올리는 수준에 불과했으나, 사람과 대량의 물자를 안정적으로 궤도에 올리기 위해서는 훨씬 더 정교한 시설이 필요했습니다. 우주선 발사센터은 거대한 조립동, 정비·연료·추진체 시스템을 갖춘 복합 단지로, 각국의 과학자와 기술자들이 총동원되는 전략적 거점이었습니다.[NEWLINE]시간이 흐르면서 이러한 발사시설은 진화를 거듭했습니다. 재사용 가능한 발사 플랫폼은 우주 접근 비용을 획기적으로 낮췄고, 고회전 발사체와 전자기 가속기 같은 실험적 기술은 지상에서의 발사 방식을 다변화했습니다. 또한 수직 발사대 외에도 해상·이동식 플랫폼이 운용되며, 우주 발사의 패러다임은 더 이상 국가의 독점적 영역이 아닌 산업 전반으로 확장되었습니다.[NEWLINE]오늘날 우주선 발사센터은 단순한 로켓 발사 기지를 넘어, 항공우주 산업과 과학 연구, 도시 산업 기반까지 동시에 끌어올리는 복합 혁신 거점으로 자리잡았습니다. 이는 인류가 지구 중력의 족쇄를 벗어나 본격적인 우주 문명으로 이행하는 과정에서 반드시 거쳐야 하는 관문이 되었습니다..'),

-- Cloning Lab
('TXT_KEY_BUILDING_FW_CLONE_LAB', '복제 연구소'),
('TXT_KEY_BUILDING_FW_CLONE_LAB_HELP', '무료 [COLOR_YELLOW]클론 트루퍼[ENDCOLOR] 1명 출현합니다. 건설 완료시 [ICON_RES_HORSE]말 [COLOR_POSITIVE_TEXT]2[ENDCOLOR]마리 제공하고  도시의 [ICON_CITIZEN]시민이 즉각 [COLOR_POSITIVE_TEXT]2명[ENDCOLOR] 늘어납니다. [NEWLINE][ICON_SILVER_FIST]군사 유닛 보급 한도가 [ICON_CITIZEN]시민의 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR]만큼 증가합니다. [NEWLINE][NEWLINE]도시의 [ICON_GREAT_PEOPLE]위인 출현율이 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR] 증가합니다.'),
('TXT_KEY_BUILDING_FW_CLONE_LAB_STRATEGY', '클론트루퍼를 무료로 얻을 수 있습니다.'),
('TXT_KEY_BUILDING_FW_CLONE_LAB_PEDIA', '복제의 초기 실험은 농장 동물에 대해 수행되었습니다. 인간 복제에는 다양한 윤리적 문제가 있기 때문에 가까운 장래에 복제의 가장 가능성 있는 용도는 동물 무리의 생산성을 높이는 것입니다.'),

-- Information Hub
('TXT_KEY_BUILDING_FW_FEEDSITE_HUB', '정보관리 허브'),
('TXT_KEY_BUILDING_FW_FEEDSITE_HUB_HELP', '도시의 [ICON_VP_WRITER] 작가, [ICON_VP_ARTIST] 음악가,  [ICON_VP_MUSICIAN] 예술가의 [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 걸작 1개마다 [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 전역 [ICON_HAPPINESS_1]행복이 [COLOR_POSITIVE_TEXT]4[ENDCOLOR]증가합니다. [NEWLINE][ICON_CULTURE]무료에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.[NEWLINE][NEWLINE]도시에 [COLOR_NEGATIVE_TEXT]유통 허브, 복합도시 허브, 가상현실 허브[ENDCOLOR]가 없어야 하고 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]서버 허브[ENDCOLOR]가 있어야건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_FEEDSITE_HUB_STRATEGY', '문화 승리를 추구한다면 필요한 강력한 미래시대 건물입니다. 서버 허브가 필요합니다. 도시에 [COLOR_NEGATIVE_TEXT]정보관리 허브, 유통 허브, 시뮬레이션 허브[ENDCOLOR]가 없어야 하고 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]서버 허브[ENDCOLOR]가 있어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_FEEDSITE_HUB_PEDIA', '미디어 네트워크는 수십 년 동안 사람들에게 엔터테인먼트를 제공했지만 거대한 서식지의 증가는 미디어 인프라에 부담을 주었습니다. 정보 허브는 새로운 거주지 건설에 통합되어 주민들이 문화 미디어와 엔터테인먼트에 접근할 수 있도록 했습니다. 비록 중앙 집중식 설계로 인해 자본이 피드를 지배하는 경향이 있지만. 그러나 인기가 높아짐에 따라 일부 커뮤니티는 정보 허브 네트워크와 서버 허브를 연결하는 네트워크 백본 모두에 대한 인프라가 부족하다는 사실을 알게 되었습니다. 엔터테인먼트를 요구하는 인구로 인해 많은 사람들이 보다 분산된 네트워크 백본보다 중앙에서 조직된 정보 허브를 선호했습니다.'),

-- Simulation Server
('TXT_KEY_BUILDING_FW_SIMULATION_HUB', '가상현실 허브'),
('TXT_KEY_BUILDING_FW_SIMULATION_HUB_HELP', '도시의 아카데미와 첨단에너지 연구단지의 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR], [ICON_GOLD] 골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]  증가합니다. 도시의 [ICON_VP_SCIENTIST] 과학자의 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[NEWLINE][ICON_RESEARCH]문맹에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.[NEWLINE][NEWLINE]도시에 [COLOR_NEGATIVE_TEXT]정보관리 허브, 복합도시 허브, 유통 허브[ENDCOLOR]가 없어야 하고 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]서버 허브[ENDCOLOR]가 있어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_SIMULATION_HUB_STRATEGY', '과학을 강화하고 사이버 유닛 건설 시간을 줄이려는 경우 강력한 미래형 건물입니다. 서버 허브가 필요합니다.'),
('TXT_KEY_BUILDING_FW_SIMULATION_HUB_PEDIA', '대도시에서의 기술적 발전에 따라, 도시 관리자들은 기계 시스템을 활용하여 가상현실 허브를 구축하기 시작했습니다. 이 가상현실 허브는 통합 데이터 네트워크를 활용하여, 도시의 산업, 경제, 교육, 여가 활동 등을 모방한 다양한 가상 시뮬레이션을 제공합니다. 이 허브를 통해 사용자들은 도시 전체의 다양한 변수들을 실시간으로 조작하고 탐색할 수 있습니다. 사용자들의 행동과 선택은 중앙집중식 데이터 저장소에 기록되며, 이 데이터는 도시의 운영과 관리를 향상시키는 데 사용됩니다. 이러한 가상현실 허브의 구축은 사용자들에게 도시의 모든 측면을 체험하고 이해하는 새로운 방법을 제공합니다. 한편으로는 교육과 연구에 사용되며, 다른 한편으로는 엔터테인먼트 목적으로도 활용될 수 있습니다. 또한, 가상현실 허브는 실제 세계의 상황에 대한 실시간 피드백을 제공하여 도시의 결정 과정을 투명하게 만들어, 소비자와 기업 모두에게 이익을 가져다 줄 수 있습니다.'),

-- Bio Computer
('TXT_KEY_BUILDING_FW_BIOCOMPUTER', '바이오 컴퓨터'),
('TXT_KEY_BUILDING_FW_BIOCOMPUTER_HELP', "도시에서 [ICON_RES_ADN_FUNGUS] 제노포자 [COLOR_POSITIVE_TEXT]1개[ENDCOLOR], [ICON_RES_ALUMINUM] 알루미늄 [COLOR_POSITIVE_TEXT]1개[ENDCOLOR], [ICON_RES_NANOMATERIAL] 나노물질 [COLOR_POSITIVE_TEXT]1개[ENDCOLOR]를 소모하여,   추가 [ICON_RESEARCH] 과학 +25%를 제공합니다."),
('TXT_KEY_BUILDING_FW_BIOCOMPUTER_STRATEGY',  "제노포자와 금속·나노격자를 결합한 ‘살아있는 연산체’입니다.  도시의 식량 감소와 경제적 유지비가 크지만 과학 발전을 비약적으로 가속합니다."),
('TXT_KEY_BUILDING_FW_BIOCOMPUTER_PEDIA', "바이오 컴퓨터의 기원은 해양 생태 연구였습니다. 특정 금속에 반응하는 유기물이 식물·조류의 정보 전달을 교란·증폭시키는 현상이 관찰되었고, 이를 매개하는 포자성 복합체가‘제노포자''와의 반응으로 확인되었습니다. [NEWLINE][NEWLINE]연구진은 생명체가 지닌 양자적 정보 흐름(초미시 스케일의 결맞음·에너지 전달 패턴)에 주목했으나,  이를 회로로 전환하는 방법은 난제였습니다. 생명체는 양자적 정보를 무수히 만들어내지만 스스로 계산을 수행하지 못 했습니다. 제노포자의 바이오물질 변이 유발 반응을 통해 생체 분자 네트워크의 전환률과 발현 경로를 바꾸는 **촉매·매개체**로 기능할 수 있었고, 이를 통해 데이터 전환이 가능해졌습니다. [NEWLINE][NEWLINE] 그 결과 알루미늄은 경량성과 전도성을 지닌 **금속 인터페이스**로, 나노물질은 정렬된 **나노격자**로 채택되었습니다. 여기에 제노포자에 의해 변이된 바이오 물질을 주입하자, 금속과 나노격자 사이에 **생체-무기 복합 노드**가 형성되었고, 이 노드의 상태 변화가 전기 신호로 전환되어 연산을 수행할 수 있게 되었습니다. 생명은 그 자체가 반도체가 아니었으나, 알루미늄과 나노물질이 만나 그 역할을 하게 된 것입니다. [NEWLINE][NEWLINE]이 시스템은 고전 실리콘 기반 컴퓨터와 달리 비선형 최적화·적응 학습에 특화되었으며, 이런 구조 탓에 초기 시제품은 제노포자·알루미늄·나노물질을 동시에 요구했습니다. 오늘날 이 바이오 컴퓨터는 차세대 ‘바이오 양자’ 아키텍처로 확장될 전초적 모델로 평가됩니다."),
 
-- Bioconverter (Oil)
('TXT_KEY_BUILDING_FW_BIOCONVERTER_NANO', '나노물질 변환 추출소 (석유)'),
('TXT_KEY_BUILDING_FW_BIOCONVERTER_NANO_HELP',  "[ICON_RES_NANOMATERIAL] 나노물질 [COLOR_POSITIVE_TEXT]4개[ENDCOLOR]를 제공합니다. [ICON_RES_ADN_FUNGUS] 제노포자 5개와 [ICON_RES_OIL] 석유 1개를 필요로 합니다."),
('TXT_KEY_BUILDING_FW_BIOCONVERTER_NANO_STRATEGY', "석유 기반의 탄소 사슬을 이용해 제노포자를 나노물질로 전환합니다. 효율이 낮아 일부 손실이 발생합니다."),
('TXT_KEY_BUILDING_FW_BIOCONVERTER_NANO_PEDIA', "해양 바이오 연구에서 밝혀진 바에 따르면, 석유의 **탄소 사슬**은 제노포자 단백질·펩타이드와 상호작용하여 금속 반응조(알루미늄 코팅)에서 흡착·정렬을 유도할 수 있습니다.  고주파 자극과 열-용매 조건 하에서 이 복합체는 **탄소 도핑된 나노격자**로 재배열되며,  이 과정에서 일부 격자가 [ICON_RES_NANOMATERIAL] 나노물질로 추출됩니다. [NEWLINE][NEWLINE] 그러나 반응 중 탈수·가스 방출과 구조적 결함이 발생해 손실은 불가피합니다.  따라서 긴급 자원 보충에는 유용하지만, 장기적으론 원천 자원 확보가 더 효율적입니다."),

-- Bioconverter (Coal)
('TXT_KEY_BUILDING_FW_BIOCONVERTER_NANO2', '나노물질 변환 추출소 (석탄)'),
('TXT_KEY_BUILDING_FW_BIOCONVERTER_NANO2_HELP', "[ICON_RES_NANOMATERIAL] 나노물질 [COLOR_POSITIVE_TEXT]2개[ENDCOLOR]를 제공합니다. [ICON_RES_ADN_FUNGUS] 제노포자 4개와 [ICON_RES_COAL] 석탄 1개를 필요로 합니다."),
('TXT_KEY_BUILDING_FW_BIOCONVERTER_NANO2_STRATEGY', "석탄을 촉매로 사용해 제노포자를 나노물질로 전환합니다. 효율은 매우 낮지만, 잉여 석탄을 소모하는 수단이 됩니다."),
('TXT_KEY_BUILDING_FW_BIOCONVERTER_NANO2_PEDIA', "바이오 공장 연구에서 석탄의 고온·고압 반응성이 제노포자의 변이율을 높여 나노물질을 생성할 수 있음이 관찰되었습니다. 그러나 석탄은 불순물이 많고 반응 부산물이 커서 효율이 극도로 낮습니다."),

-- Bioconverter (ADN Fungus)
('TXT_KEY_BUILDING_FW_BIOCONVERTER_ADNF', '합성 제노포자 제조소'),
('TXT_KEY_BUILDING_FW_BIOCONVERTER_ADNF_HELP', "[ICON_RES_ADN_FUNGUS] 제노포자 [COLOR_POSITIVE_TEXT]4개[ENDCOLOR]를 제공합니다.  [ICON_RES_NANOMATERIAL] 나노물질 5개와 [ICON_RES_ALUMINUM] 알루미늄 1개를 필요로 합니다."),
('TXT_KEY_BUILDING_FW_BIOCONVERTER_ADNF_STRATEGY', "나노격자와 금속 인터페이스를 이용해 합성 제노포자를 배양합니다.  일부 손실이 불가피합니다."),
('TXT_KEY_BUILDING_FW_BIOCONVERTER_ADNF_PEDIA', "바이오공학 연구는 알루미늄 구조체 위에 정렬된 [ICON_RES_NANOMATERIAL] 나노격자에  유기물질을 주입하면 제노포자의 발현 패턴이 재현될 수 있음을 보여주었습니다. 이 공정은 해양 바이오에서 관찰된 금속-유기 반응성을 인공적으로 복제한 것입니다. [NEWLINE][NEWLINE] 구조체를 만들기 위해 알루미늄이 필요합니다."),

-- Telepresence Hub
('TXT_KEY_BUILDING_FW_TELEPRESENCE_HUB', '원격현실 허브'),
('TXT_KEY_BUILDING_FW_TELEPRESENCE_HUB_HELP', '문명에 있는 가상현실 허브 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]개마다 [ICON_RESEARCH]과학 [COLOR_POSITIVE_TEXT]1[ENDCOLOR],정보관리 허브 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]개마다 [ICON_CULTURE]문화 [COLOR_POSITIVE_TEXT]1[ENDCOLOR], 복합도시 허브 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]개마다 [ICON_GOLD]골드 [COLOR_POSITIVE_TEXT]1[ENDCOLOR], 유통허브 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]개마다 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]씩 문명의 산출량이 증가합니다.[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]네트워크 중심지[ENDCOLOR]가 있어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_TELEPRESENCE_HUB_STRATEGY', '각 허브의 해당 산출량을 1씩 증가시켜줍니다.네트워크 중심지가 필요합니다.'),
('TXT_KEY_BUILDING_FW_TELEPRESENCE_HUB_PEDIA', '사이버네틱스의 발전과 물체를 원격으로 제어할 수 있는 신경 직접 인터페이스를 가진 개인의 수가 증가함에 따라 사람들이 일하거나 더 많은 원격 커뮤니티를 방문하기 위해 텔레프레즌스를 사용하는 것이 점점 보편화되었습니다. 이 도시들이 네트워크 백본으로 연결되어 있는 한, 다른 도시의 사람들은 원격으로 의수를 조작하여 즉시 출퇴근할 수 있었습니다. 이러한 방식으로 재택근무하는 개인의 수가 증가함에 따라 유지 관리 및 접근이 용이하도록 필요한 보철물을 보관할 시설을 구축해야 했습니다. 이러한 텔레프레즌스 허브는 종종 커뮤니티 중앙에 위치하거나 작업장이나 인기 있는 관광지와 같이 정기적으로 자주 방문하는 사이트 근처에 위치했습니다.'),

-- Metroplex Hub
('TXT_KEY_BUILDING_FW_METROPLEX_HUB', '복합도시 허브'),
('TXT_KEY_BUILDING_FW_METROPLEX_HUB_HELP', '도시의 소도시와 마을의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]3[ENDCOLOR] 증가합니다. 도시의 [ICON_VP_MERCHANT] 상인의 [ICON_GOLD] 금이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][ICON_GOLD]골드로 유닛을 구매하거나 건물 건설에 투자하는 비용이 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR] 감소합니다.[NEWLINE][ICON_GOLD]빈곤에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.[NEWLINE][NEWLINE]도시에 [COLOR_NEGATIVE_TEXT]정보관리 허브, 유통 허브, 가상현실 허브[ENDCOLOR]가 없어야 하고 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]서버 허브[ENDCOLOR]가 있어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_METROPLEX_HUB_STRATEGY', '복합도시 허브는 골드 생산량에 큰 도움이 되며 도시의 골드 구매 비용을 줄여줍니다.'),
('TXT_KEY_BUILDING_FW_METROPLEX_HUB_PEDIA', '대도시에 중앙 집중식 유통 허브가 성공적으로 등장하고 아크로지의 인구 수용 능력이 증가함에 따라 가장 큰 메트로플렉스는 점점 커지는 커뮤니티가 효율적으로 운영되도록 조치를 취하기 시작했습니다. 중앙 집중식 도시 계획은 업무량이 가장 많은 시간에도 사람과 상업이 자유롭게 이동할 수 있도록 했습니다. 일부는 인구 및 비즈니스 구역에 대한 엄격한 규제에 반대했지만, 새로운 메트로플렉스 배치는 사람과 상업이 도시를 통해 자유롭게 이동할 수 있도록 했습니다. 더 이상 시민들은 귀중한 시간과 에너지를 낭비하면서 러시아워 교통 체증에서 몇 시간을 기다릴 필요가 없었습니다. 계획된 교통 패턴과 구역 설정은 모든 사람이 빠르고 효율적으로 출근하거나 집으로 돌아갈 수 있어 시간과 비용을 절약할 수 있음을 의미했습니다.'),

-- Distribution Hub
('TXT_KEY_BUILDING_FW_DISTRIBUTION_HUB', '유통 허브'),
('TXT_KEY_BUILDING_FW_DISTRIBUTION_HUB_HELP', '도시의 제조소의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]5[ENDCOLOR], 산업단지의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. 도시의 [ICON_VP_ENGINEER] 기술자의 [ICON_PRODUCTION] 생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE] 도시에 건물을 건설할때 [ICON_PRODUCTION]생산보너스를 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR]제공합니다.[NEWLINE][NEWLINE]전문가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]명이 더이상 [ICON_URBANIZATION]도시화에서 오는 [ICON_HAPPINESS_3]불행을 증가시키지 않습니다.[NEWLINE][NEWLINE]도시에 [COLOR_NEGATIVE_TEXT]정보관리 허브, 복합도시 허브, 가상현실 허브[ENDCOLOR]가 없어야 하고 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]서버 허브[ENDCOLOR]가 있어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_DISTRIBUTION_HUB_STRATEGY', '생산력을 높이고 건물 건설 시간을 줄이려는 경우 강력한 미래형 건물입니다. 도시에 [COLOR_NEGATIVE_TEXT]정보관리 허브, 복합도시 허브, 시뮬레이션허브[ENDCOLOR]가 없어야 하고 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]서버 허브[ENDCOLOR]가 있어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_DISTRIBUTION_HUB_PEDIA', '정보 허브가 대도시에서 점점 널리 보급됨에 따라 도시 관리자는 통합 데이터 네트워크를 사용할 수 있는 다른 방법을 찾기 시작했습니다. 산업을 위한 원자재와 대중을 위한 소비재의 유통을 돕기 위해 이러한 네트워크를 사용하는 것은 가장 즉각적인 발전 중 하나였습니다. 도시를 통과하는 상품의 흐름과 생산 및 소비 프로세스를 추적할 수 있게 됨으로써 기업과 소비자 모두 중앙 집중식 유통 허브를 통해 효율성을 높일 수 있었습니다.'),

-- Enrichment Facility
('TXT_KEY_BUILDING_FW_ENRICHMENT_FACILITY', '고에너지 신소재연구소'),
('TXT_KEY_BUILDING_FW_ENRICHMENT_FACILITY_HELP', '[ICON_RES_URANIUM]우라늄 [COLOR_POSITIVE_TEXT]2개[ENDCOLOR]를 제공합니다.[NEWLINE][NEWLINE]문명의 [ICON_CITIZEN]시민이 최소 [COLOR_POSITIVE_TEXT]125[ENDCOLOR]명 이상이어야 합니다.[NEWLINE]이 건물은 문명당 [COLOR_YELLOW]최대 3[ENDCOLOR]개까지 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_ENRICHMENT_FACILITY_STRATEGY', '우라늄 2개를 제공합니다. 최대 3개까지 지을 수 있습니다. 핵 연료 재처리시설을 건설하려면 문명에 최소 125명의 국가 인구가 필요합니다.'),
('TXT_KEY_BUILDING_FW_ENRICHMENT_FACILITY_PEDIA', '핵연료 재처리 시설은 원자력 발전의 효율을 극대화하고 방사성 폐기물을 줄이기 위해 설계된 차세대 에너지 단지입니다. 이 시설에서는 사용 후 연료봉에서 우라늄과 플루토늄을 재추출해 재활용하며, 이를 통해 핵연료의 수명을 연장하고 에너지 밀도를 높이는 데 성공했습니다.  [NEWLINE] 그러나 이러한 재처리 공정은 극도의 방사선과 고온·고압 환경에서 이루어지기 때문에,  과학자들은 급속 냉각 기술과 첨단 방사선 차폐 재료 개발에 몰두할 수밖에 없었습니다.  이 과정에서 개발된 신소재는 극저온에서도 안정성을 유지하며,  향후 핵융합 발전을 위한 냉각, 차폐 및  초전도 실험 장비와 양자 재료 연구의 토대를 마련했습니다.  '),

-- Mycoprotein Vats
('TXT_KEY_BUILDING_FW_MYCOPROTEIN_VATS', '대체육 공장'),
('TXT_KEY_BUILDING_FW_MYCOPROTEIN_VATS_HELP', '도시의 [ICON_CITIZEN]시민 4명마다 [ICON_FOOD]식량이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 도시의 [ICON_CITIZEN]시민이 증가할 때 사용한 [ICON_FOOD]식량의 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR]를 다음 [ICON_CITIZEN]시민을 위해 사용할 수 있습니다.[COLOR:105:105:105:255](이 효과는 송수로와 중첩됩니다.)[ENDCOLOR][NEWLINE][NEWLINE]전문가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]명이 더이상 [ICON_URBANIZATION]도시화에서 오는 [ICON_HAPPINESS_3]불행을 증가시키지 않습니다.[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]의학 연구소[ENDCOLOR]가 있어야건설할 수 있습니다.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]투케이 푸드 기업을 설립하면[ENDCOLOR] [ICON_FOOD] 식량이 [COLOR_POSITIVE_TEXT]3[ENDCOLOR] 증가합니다.'),
('TXT_KEY_BUILDING_FW_MYCOPROTEIN_VATS_STRATEGY', '대체육공장은 도시가 더 빨리 성장하고 빈곤과 불행에 맞서 싸울 수 있도록 도와주는 미래 시대의 건물입니다.'),
('TXT_KEY_BUILDING_FW_MYCOPROTEIN_VATS_PEDIA', '식량 생산을 늘리는 다양한 방법이 수세기에 걸쳐 개발되었지만 일부 지역의 인구 증가는 농장과 수경재배지구의 산출이 증가함에도 요구량이 생산량보다 능가할 위험이 있었습니다. 그 결과 일부 지역 사회는 인간이 소비하기에 적합한 단백질과 섬유질을 합성하는 다양한 공정을 사용하여 영양적으로 완전한 대체 식품의 대량 생산으로 전환했습니다. 그 결과 식품 대체물은 영양가가 충분했지만 종종 실제 식품의 맛과 질감이 부족했습니다. 그럼에도 불구하고 많은 마이코프로테인 식품이 그들이 감당할 수 있는 유일한 영양분이었고, 대체육(인공 단백질)은 수백만 명의 생명을 유지하는 데 도움이 되었습니다.'),

-- Cyberclinic
('TXT_KEY_BUILDING_FW_CYBERCLINIC', '신경양자클리닉'),
('TXT_KEY_BUILDING_FW_CYBERCLINIC_HELP', '[ICON_GREAT_SCIENTIST]위대한 과학자의 출현율이 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR] 증가합니다. [NEWLINE]모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]병원[ENDCOLOR]과 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]복제 연구소[ENDCOLOR]의 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]3[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE]사이버 잠수함, 사이버 SAM 발사대, 크롤러 SAM 발사대, 호버탱크를 생산할 때 [ICON_PRODUCTION]생산보너스를 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR] 제공합니다.[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]연구소[ENDCOLOR]가 있어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_CYBERCLINIC_STRATEGY', '복제연구소와 병원의 과학 산출량과 사이버 유닛(사이버잠수함, 사이버SAM, 호버탱크) 생산력을 크게 향상시킵니다.'),
('TXT_KEY_BUILDING_FW_CYBERCLINIC_PEDIA', '점점 더 많은 인간이 인공두뇌학적으로 변형됨에 따라 그러한 기술에 대한 즉각적인 접근이 점점 더 우려되고 있습니다. 모든 사람의 평등한 접근을 보장하기 위해 정부가 운영하든, 시장 압력에 대한 대응으로 사적으로 운영하든, 점점 더 많은 수의 사이버 클리닉이 설립되어 원하는 사람은 누구나 자신의 신체를 사이버네틱스로 변형할 수 있도록 돕고 있습니다. 처음에는 간단한 신경 이식과 인터페이스를 제공했지만 사이버네틱 보철물의 개발이 진행됨에 따라 점점 더 다양한 개선 사항을 제공할 수 있게 되었습니다.'),

-- Nanomines Field
('TXT_KEY_BUILDING_FW_NANOMINES_FIELD', '나노지뢰밭'),
('TXT_KEY_BUILDING_FW_NANOMINES_FIELD_HELP', '적 해상 유닛 및 승선 유닛이 이 도시의 물 타일에 들어오면 행동력을 모두 소모합니다. 이 도시의 대양 타일에서 턴을 마친 적 유닛은 [COLOR_NEGATIVE_TEXT]5의 피해를 입으며, 지뢰밭이 있다면 총 10의 피해를[ENDCOLOR] 받습니다.[NEWLINE][NEWLINE][ICON_RES_NANOMAT]나노물질 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR]가 필요합니다. [COLOR_YELLOW]해안 도시[ENDCOLOR]에만 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_NANOMINES_FIELD_STRATEGY', '나노지뢰밭은 [ICON_RES_NANOMAT] 나노 물질이 충분한 경우에만 건설할 수 있는 미래 시대 건물입니다. 이 업그레이드된 지뢰밭은 도시 방어력과 체력을 증가시키고 여전히 도시 주변의 적 해군 유닛과 승선 유닛의 이동을 1만큼 감소시킵니다. 또한 도시가 작업한 물 타일 근처에서 턴이 끝날 때마다 적 해군 유닛에게 5 HP의 피해를 줍니다.'),
('TXT_KEY_BUILDING_FW_NANOMINES_FIELD_PEDIA', '나노지뢰밭은 크기는 작지만 기존보다 훨씬 더 치명적입니다. 자체 판단으로 적 함선을 쉽게 탐지할 수 있는 ''스마트'' 두뇌를 갖추고 있어 이러한 ''봇''과의 접촉은 대부분 불가피합니다.'),

-- Space Station
('TXT_KEY_BUILDING_FW_SPACE_STATION', '우주반사판 전력위성'),
('TXT_KEY_BUILDING_FW_SPACE_STATION_HELP', '건설을 완성하면 [COLOR_POSITIVE_TEXT]15[ENDCOLOR]턴간 [ICON_HAPPINESS_1]국왕경축일을 맞이합니다. 도시를 공습하는 공중 유닛에게 주는 [ICON_STRENGTH]피해가 [COLOR_POSITIVE_TEXT]5[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]전문가 [COLOR_POSITIVE_TEXT]1명[ENDCOLOR]이 더이상 [ICON_URBANIZATION]도시화에서 오는 [ICON_HAPPINESS_3]불행을 증가시키지 않습니다.[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]우주선 발사센터[ENDCOLOR]가 있어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_SPACE_STATION_STRATEGY', '우주 정거장은 특정 모듈과 함께 설치하여 과학, 생산 또는 골드를 높일 수 있습니다.'),
('TXT_KEY_BUILDING_FW_SPACE_STATION_PEDIA', '우주 정거장은 거의 우주 여행만큼이나 개념적으로 존재해 왔습니다. 가장 초기의 것들은 궤도로 부스트된 모듈로, 일부는 인간에 대한 미세 중력의 장기적인 영향을 테스트하기 위한 장기 승무원이 있었지만 회전하는 승무원이 한 번에 몇 달 동안 그 안에 머물게 했습니다. 결국, 함께 연결된 수많은 모듈을 사용하여 국제 우주 정거장과 같은 더 크고 복잡한 우주 정거장이 만들어졌습니다. 우주 개발이 보다 상업화되고 주요 정부 이외의 조직에서 사용할 수 있게 됨에 따라 다양한 그룹이 저궤도에서 연구 및 산업 개발을 수행할 수 있는 기회를 활용함에 따라 궤도에 있는 우주 정거장의 수가 증가했습니다.'),

-- Transgenic Nursery
('TXT_KEY_BUILDING_FW_TRANSGENIC_NURSERY', '유전자개조 연구소'),
('TXT_KEY_BUILDING_FW_TRANSGENIC_NURSERY_HELP', '도시의 친환경 마을마다 [ICON_FOOD]식량과 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 유전자개조, 바이오생명체 유닛을 생산할 때 [ICON_PRODUCTION]생산보너스를 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR] 제공합니다.[NEWLINE][NEWLINE]도시에서 생산하는 지상 유닛에 [COLOR_PLAYER_PURPLE]약탈 시 이동력 소모 없음[ENDCOLOR] 승급을 부여합니다.[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]임플란트 시술소, 유전자공학 연구소[ENDCOLOR]가 있어야하고, [COLOR_NEGATIVE_TEXT]무인관리기지, 항공우주 복합시설[ENDCOLOR]이 없어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_TRANSGENIC_NURSERY_STRATEGY', '과학 및 유기체 유닛 생산 속도를 높입니다. 도시에서 생산한 모든 유닛은 약탈 시 행동력이 소모되지 않습니다.'),
('TXT_KEY_BUILDING_FW_TRANSGENIC_NURSERY_PEDIA', '기존 생태계에서 유전적으로 변형된 식물과 동물의 확산에 대한 연구는 유전자 변형 및 공학의 개선과 결합하여 개별 유기체를 돕는 것 이상으로 전체 생태계로 확장하려는 노력을 증가시킵니다. 자연적으로 발생하는 것보다 더 효과적으로 성장하고 더 생산적인 새로운 자급자족 생태계를 개발하기 위한 예비 테스트 환경으로 형질전환 종묘장을 사용했습니다. 일단 만족스러운 결과를 얻으면 이 새로운 생태계가 야생에 도입되어 기존 생태계를 빠르게 대체했습니다.'),

-- Drone Hive
('TXT_KEY_BUILDING_FW_DRONE_HIVE', '무인관리기지'),
('TXT_KEY_BUILDING_FW_DRONE_HIVE_HELP', '도시의 발전기마다 [ICON_PRODUCTION]생산과 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 모든 로봇 유닛을 생산할 때 [ICON_PRODUCTION]생산보너스를 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR] 제공합니다.[NEWLINE][NEWLINE]도시에서 생산하는 로봇, 기계, 기갑, 헬리콥터 유닛들에 [COLOR_PLAYER_PURPLE]자동 수리[ENDCOLOR] 승급을 부여합니다.[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]자동생산시설[ENDCOLOR]이 있어야하고, 도시에 [COLOR_NEGATIVE_TEXT]유전자개조 연구소, 항공우주 복합시설[ENDCOLOR]이 없어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_DRONE_HIVE_STRATEGY', '생산 및 로봇 유닛 건설 속도를 높입니다. 자동 수리는 우호적인 땅에 있는 로봇에게 큰 도움이 됩니다.'),
('TXT_KEY_BUILDING_FW_DRONE_HIVE_PEDIA', '자율 로봇과 드론이 점점 보편화되면서 이를 유지하고 모니터링하기 위한 전용 시설의 필요성이 명백해졌습니다. 드론이 홈 베이스로 사용할 수 있는 전문 시설, 흔히 드론 하이브라고 불리는 드론 사용이 많은 도시에 설립되었습니다. 이 전담 지원을 통해 드론은 더 멀리 이동하고 더 안정적으로 작동할 수 있으므로 이전에 인간이 수행했던 일부 작업을 처리하는 데 도움이 될 수 있습니다.'),

-- Aerospace Complex
('TXT_KEY_BUILDING_FW_AEROSPACE_COMPLEX', '항공우주 복합시설'),
('TXT_KEY_BUILDING_FW_AEROSPACE_COMPLEX_HELP', '도시의 수경재배지구마다 [ICON_CULTURE]문화와 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 우주 전문화유닛[COLOR:105:105:105:255](항공모함, 전투기, 폭격기, 정찰, 화약 유닛)[ENDCOLOR]을 생산할 때 [ICON_PRODUCTION]생산보너스를 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR]제공합니다. [NEWLINE][NEWLINE]도시에서 생산하는 지상유닛에게 [COLOR_PLAYER_PURPLE]공정 투하[ENDCOLOR] 승급을 부여합니다. [NEWLINE][NEWLINE]도시의 공중 유닛 정원이 [COLOR_POSITIVE_TEXT]4기[ENDCOLOR] 증가합니다. 도시를 공습하는 공중 유닛에게 주는 [ICON_STRENGTH]피해가 [COLOR_POSITIVE_TEXT]10[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]공항[ENDCOLOR]과 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]우주선 발사센터[ENDCOLOR]가 있어야하고, 도시에 [COLOR_NEGATIVE_TEXT]무인관리기지, 유전자개조 연구소[ENDCOLOR]가 없어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_AEROSPACE_COMPLEX_STRATEGY', '도시의 공중 유닛 수용량을 4 늘립니다. 도시 공습 중 공중 유닛에 대한 추가 [ICON_STRENGTH] 피해에 10을 줍니다. 드론 전투기, 준궤도 폭격기, 우주 폭격기, 전투기의 생산량이 10% 증가합니다. 공항이 필요합니다.'),
('TXT_KEY_BUILDING_FW_AEROSPACE_COMPLEX_PEDIA', '상업화와 우주 개발이 증가함에 따라 항공우주선의 유지 보수 및 서비스 전용 시설이 점점 더 필요해졌습니다. 이러한 전용 시설은 종종 제조 시설과 건물을 결합하여 항공우주선과 궤도를 오가는 사람들에게 서비스를 제공합니다.'),

-- Tidal Port
('TXT_KEY_BUILDING_FW_TIDAL_PORT', '해상 지구'),
('TXT_KEY_BUILDING_FW_TIDAL_PORT_HELP', '도시의 해양 타일의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 및 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. 군사 유닛 보급한도가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가하고, 해군 유닛울 생산할 때 [ICON_PRODUCTION]생산보너스를 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR] 제공합니다. 해상 [ICON_INTERNATIONAL_TRADE]교역로의 길이가 [COLOR_POSITIVE_TEXT]50%[ENDCOLOR] 증가하고 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]이 도시에서 다른 문명으로 출발하는 [ICON_INTERNATIONAL_TRADE]해상 교역로가 완료되면 현재 [ICON_CULTURE]문화 및 [ICON_TOURISM]관광 산출량에 기반한 [ICON_TOURISM] 관광을 제공합니다.[NEWLINE][NEWLINE][ICON_RES_NANOMAT]나노물질 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR]가 필요합니다. 도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]항구[ENDCOLOR]가 있어야 하고 [COLOR_NEGATIVE_TEXT]초고속 철도[ENDCOLOR]가 없어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_TIDAL_PORT_STRATEGY', '해상 지구는 항구가 필요한 미래 시대 건물입니다. 해상 교역로의 범위와 골드 산출량을 개선하고 해상 타일과 자원의 가치를 높입니다. 또한 해군 유닛의 생산이 증가하고 군사 유닛 보급한도가 증가합니다.'),
('TXT_KEY_BUILDING_FW_TIDAL_PORT_PEDIA', '해안 도시 근처에서 조력 발전소의 건설이 점점 더 일반화되면서, 많은 산업들이 발전소에서 제공하는 에너지를 더 잘 활용하기 위해 발전소에 가까운 부유 플랫폼 위에 설립하기 시작했습니다. 이 플랫폼들은 점점 더 고도화되어, 중심에 조력 발전소를 둔 복잡한 연결 구조물로 발전했습니다. 이러한 상업용 복합 시설은 종종 로 불리며, 해안 및 섬 커뮤니티에서 산업 및 상업 생산의 중요한 원천이었습니다.'),

-- High Speed Rail Train
('TXT_KEY_BUILDING_FW_HIGHSPEED_RAIL', '초고속 철도'),
('TXT_KEY_BUILDING_FW_HIGHSPEED_RAIL_HELP', '이 도시에서 출발하는 국내 [ICON_INTERNATIONAL_TRADE]교역로의 [ICON_FOOD]식량이 [COLOR_POSITIVE_TEXT]8[ENDCOLOR], [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. 육상 교역로의 길이가 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR] 증가합니다.이 도시에서 다른 문명으로 출발하는 [ICON_INTERNATIONAL_TRADE]육상 교역로가 완료되면 현재 [ICON_CULTURE]문화 및 [ICON_TOURISM]관광 산출량에 기반한 [ICON_TOURISM]관광을 제공합니다.[NEWLINE][NEWLINE][ICON_RES_NANOMAT]나노물질 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR]가 필요합니다. [NEWLINE][NEWLINE][ICON_CAPITAL] 수도와 [COLOR_YELLOW]철도로 연결된 도시이어야 하고 철도역이 있어야[ENDCOLOR]하고, 도시에 [COLOR_NEGATIVE_TEXT]해상 지구[ENDCOLOR]가 없어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_HIGHSPEED_RAIL_STRATEGY', '미래 시대에 도시 생산력과 골드를 크게 향상시킵니다. 건설하기 전에 수도(항구 연결은 포함되지 않음!)에 철로 타일이 있는 직접적인 철도 연결이 필요하므로 이 건물의 이점을 거두기 전에 철도 인프라에 투자해야 합니다! Tidal Port와 같은 도시에 건설할 수 없으며 기차역이 필요합니다.'),
('TXT_KEY_BUILDING_FW_HIGHSPEED_RAIL_PEDIA', '고속 마그네틱 레일(HSR)은 특수 철도 차량과 전용 트랙의 통합 시스템을 사용하여 기존 철도 교통보다 훨씬 빠르게 운행되는 철도 운송 유형입니다. 전 세계적으로 적용되는 단일 표준은 없지만 250km/h(155mph) 이상의 속도를 처리하도록 구축된 라인과 200km/h(124mph)를 초과하는 업그레이드된 라인은 고속으로 널리 간주됩니다. 최초의 고속철도 시스템인 도카이도 신칸센은 1964년 일본에서 운행을 시작했으며 신칸센으로 널리 알려졌습니다. 고속철도는 지상에서 가장 빠른 상업 운송 수단입니다. 중국은 베이징-상하이 고속철이 최대 350km/h(217mph)에 달하는 정상 운행 중인 가장 빠른 재래식 고속철도를 보유하고 있습니다. 2004년에 개통한 상하이 자기 부상 열차는 431km/h(268mph)로 운행 중인 가장 빠른 상용 승객 자기 부상 열차입니다. 2007년 Euroduplex TGV 열차는 574.8km/h(357.2mph)의 기록을 갱신하여 세계에서 가장 빠른 재래식 바퀴 열차가 되었습니다. 일본의 주오 신칸센은 상업 속도 505km/h(314mph)의 도쿄에서 오사카까지 건설 중인 자기부상열차 노선으로 2027년에 운행을 시작할 예정입니다.'),

-- Biogenesis Pod
('TXT_KEY_BUILDING_FW_ECTOGENESIS_POD', '바이오생명체 생산시설'),
('TXT_KEY_BUILDING_FW_ECTOGENESIS_POD_HELP', '바이오생명체유닛을 생산할 때 [ICON_PRODUCTION]생산보너스를 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR]제공합니다. [NEWLINE][NEWLINE]도시에서 생산하는 근접, 화약, 기마 및 정찰유닛에 [COLOR_PLAYER_PURPLE]유전자개조 승급[ENDCOLOR]을 부여합니다.[NEWLINE][NEWLINE][ICON_RES_ADN_FUNGUS]ADN균 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR]가 필요합니다. 도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]유전자개조 연구소[ENDCOLOR]가 있어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_ECTOGENESIS_POD_STRATEGY', '도시에서 생산하는 근접, 화약, 기마 및 정찰유닛에 유전자개조 승급을 부여합니다.'),
('TXT_KEY_BUILDING_FW_ECTOGENESIS_POD_PEDIA', '인공적으로 조작된 유전자 키메라의 생성과 대량 생산이 보편화됨에 따라 작업 전용 시설도 일반화되었습니다. 바이오생명체 생산시설의 배양 과정 중에도 키메라의 유전자개조를 허용하여 다양한 요구 사항을 충족하도록 동적으로 조정할 수 있기 때문에 이러한 시설에서 가장 중요한 구성 요소였습니다. 이러한 시설은 종종 생물학적 변형 센터로서 이중 임무를 수행했습니다. 포드는 나중에 더 정교한 출산 포드에 비해 더 기초적이고 대규모 수정만 수행할 수 있었지만 포드는 인간도 변형하는 데 사용될 수 있기 때문입니다.'),

-- Photosystems
('TXT_KEY_BUILDING_FW_PHOTOSYSTEMS', '광화학반응'),
('TXT_KEY_BUILDING_FW_PHOTOSYSTEMS_HELP', '도시 근처에 [ICON_RES_ADN_FUNGUS]ADN균 [COLOR_POSITIVE_TEXT]1개[ENDCOLOR]가 나타납니다. [NEWLINE][NEWLINE]숲 타일의 [ICON_FOOD]식량이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR], 정글 타일의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 습지 타일의 [ICON_FOOD]식량 및 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.'),
('TXT_KEY_BUILDING_FW_PHOTOSYSTEMS_STRATEGY', '유지비용은 비싸지만 ADN 균을 얻고 도시에 식량, 생산, 과학 및 문화를 제공하십시오. 생성된 자원을 사용하여 더 많은 돌연변이 유닛을 만드십시오.'),
('TXT_KEY_BUILDING_FW_PHOTOSYSTEMS_PEDIA', '이 행성의 원시 속씨식물에서 광합성에 관여하는 단백질 복합체를 이해하는 것은 헌신적인 소규모 과학자 그룹의 목표가 되었습니다. 수십 년간의 광화학 연구 끝에 그들은 조류와 시아노박테리아의 틸라코이드 막이 페레독신과 퀴논의 주입에 의해 자극될 수 있음을 발견했습니다. 유전 기술을 사용하면 이 특성을 광범위한 식물군으로 옮길 수 있습니다. 광화학시스템 I과 II 모두의 효율성은 제어된 환경 실험실(growlabs)에서 기하급수적으로 증가할 수 있으며, 그 결과 식량/생산 및 약리 작물의 성장률과 수확량이 극적으로 증가합니다. 자생 광하학계에 대한 연구는 계속되고 있으며, 이제 지역 식물의 광합성 과정에서 페오피틴과 카로티노이드의 작용에 관심이 집중되고 있습니다.'),

-- Mass Digester
('TXT_KEY_BUILDING_FW_MASS_DIGESTER', '무기폐기물재활용소'),
('TXT_KEY_BUILDING_FW_MASS_DIGESTER_HELP', '도시의 [ICON_CITIZEN]시민 2명마다 [ICON_FOOD]식량 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]이 증가합니다. 도시의 타일마다 [ICON_FOOD]식량이 증가합니다. [NEWLINE][NEWLINE]도시의 전문가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]명이 더 이상 [ICON_URBANIZATION]도시화로 인한 불행을 [ICON_HAPPINESS_3] 유발하지 않습니다.'),
('TXT_KEY_BUILDING_FW_MASS_DIGESTER_STRATEGY', '소유한 인구와 영토가 많을수록 대량의 식량을 얻을 수 있습니다. 도시의 밀집화에 따른 불행이 감소합니다.'),
('TXT_KEY_BUILDING_FW_MASS_DIGESTER_PEDIA', '도시가 성장함에 따라 몇몇 도시는 수요량이 공급가능한 식량 수치를 능가하기 시작했습니다. 과거 역사에서 이것은 인구 증가의 한계였지만, 무기 폐기물을 반유기성 소화 가능한 식품으로 전환하는 연구는 이 행성에서 이 한계를 극적으로 높이는 해결책을 입증했습니다. 여러 콜로니 연구소에서 동시에 개발한 나노 촉매 공정과 유전자 조작된 혐기성 소화조의 혼합은 생합성을 통해 기본 단백질을 형성하기 위해 결합될 수 있는 특정 아미노산을 회수합니다. 공정의 마지막 단계는 고세균 프로테아제를 첨가하여 펩타이드 결합의 가수분해를 유발하여 상대적으로 맛은 없지만 영양가 있는 페이스트를 최종 제품으로 생성하는 것입니다. 이 공정의 원료에는 대부분의 플라스틱, 고무, 유기 리간드를 포함하는 유기 금속 화합물, 알켄 유래 폴리머 및 일반적으로 사용 후 폐기되는 기타 여러 재료가 포함됩니다. 원핵생물 고세균은 이 행성에서 상당히 흔하며 종종 제노매스 농도와 관련하여 발견됩니다. 원료에서 단백질 페이스트로의 속도는 주로 생합성 단계로 인해 적당히 느립니다. 연구는 계속해서 프로세스를 간소화하고 가속화합니다. 이렇게 단백질 페이스트를 생산한 산업단지를 ''대량 소화기''라고 부르는 데는 분명한 이유가 있다. 많은 시민들이 여전히 유기농 식품을 선호하지만, 많은 도시에서 단백질 페이스트의 사용이 보편화되었으며 다양한 트랜스휴먼 운동에 의해 촉진되기까지 합니다.'),

-- Bioenhancement Centre
('TXT_KEY_BUILDING_FW_BIOMOD_TANK', '바이오강화 센터'),
('TXT_KEY_BUILDING_FW_BIOMOD_TANK_HELP', '클론 트루퍼, 돌연변이, 생체강화 보병, 슈퍼솔져, 바이오 트루퍼 유닛을 생산할 때 [ICON_PRODUCTION]생산보너스를 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR] 제공합니다. [NEWLINE][NEWLINE]도시에서 생산하는 근접, 기마, 화약, 정찰 유닛에 [COLOR_PLAYER_PURPLE]바이오모드 승급[ENDCOLOR]을 부여합니다.[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]임플란트 시술소, 유전자개조 연구소[ENDCOLOR] 가 있어야건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_BIOMOD_TANK_STRATEGY', '클론트루퍼, 생체강화 보병, 바이오트루퍼, 슈퍼솔져의 생산을 증가시킵니다. 근접, 기마, 화약, 정찰 유닛은 바이오모드 승급을 부여받습니다. 임플란트 클리닉이 필요합니다.'),
('TXT_KEY_BUILDING_FW_BIOMOD_TANK_PEDIA', '임플란트 클리닉은 어느 정도의 생체 변형을 허용했지만 더 광범위한 적응에는 더 정교한 장비가 필요했습니다. 바이오 강화 시설은 더 광범위한 인체 변형을 수행했으며, 일반적으로 대상을 서스펜션 탱크에 담그어 더 복잡한 임플란트 및 전신 변형을 수행할 수 있도록 했습니다. 일반적인 바이오 모드에는 단기 재생 기능을 제공하는 자극제와 전투 능력을 향상시키는 강화 모드가 포함됩니다.'),

-- AI Network
('TXT_KEY_BUILDING_FW_AI_NETWORK', 'AI 네트워크'),
('TXT_KEY_BUILDING_FW_AI_NETWORK_HELP', '도시 근처의 방어 시설의 [ICON_RESEARCH]과학과 [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE] 도시의 [ICON_GREAT_PEOPLE]위인 출현율이 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]무인관리기지[ENDCOLOR]가 있어야하고, [COLOR_NEGATIVE_TEXT]중앙 통제 센터, 유전자 가속 센터[ENDCOLOR]가 없어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_AI_NETWORK_STRATEGY', '도시의 방어와 관련된 모든 시서을 개선합니다. 도시 HP/방어 및 행복을 향상시킵니다.'),
('TXT_KEY_BUILDING_FW_AI_NETWORK_PEDIA', '인공 지능의 출현으로 다양한 시설을 보다 효율적으로 운영하고 인간의 과학적, 문화적 노력을 지원하기 위해 점점 더 많은 AI가 활용되었습니다. 인공 지능에 대한 경계심은 많은 사람들이 고립되어 있음을 의미했지만 광범위한 네트워크 연결을 가진 일부 문명은 AI가 그들 사이에서 네트워크를 형성하도록 허용했습니다. 이러한 네트워크를 통해 AI는 작업을 분산하고 협업할 수 있으므로 스스로 생산할 수 있는 것보다 훨씬 더 큰 성과를 거둘 수 있습니다.'),

-- Fusion Reactor
('TXT_KEY_BUILDING_FW_FUSION_PLANT', '핵융합 반응로'),
('TXT_KEY_BUILDING_FW_FUSION_PLANT_HELP', '도시의 모든 전문가들의 [ICON_PRODUCTION]생산, [ICON_GOLD]골드, [ICON_RESEARCH]과학, [ICON_CULTURE]문화 산출량이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 도시의 [ICON_PRODUCTION]생산을 다른 산출량으로 전환할 때의 효율성이 [COLOR_POSITIVE_TEXT]20%[ENDCOLOR] 증가합니다.도시의 [ICON_GREAT_PEOPLE]위인 출현율이 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE][ICON_RES_URANIUM]우라늄 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR]가 필요합니다.도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]공장[ENDCOLOR]이 있어야 건설할 수 있습니다. [NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]헥손 정유 기업을 설립하면[ENDCOLOR] [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]3[ENDCOLOR] 증가합니다.'),
('TXT_KEY_BUILDING_FW_FUSION_PLANT_STRATEGY', '도시는 [ICON_PRODUCTION] 생산을 수익으로 전환하는 데 20% 더 효율적입니다.[NEWLINE][NEWLINE] 이 도시에서 [ICON_GREAT_PEOPLE] 위인 비율이 25% 증가하고 모든 전문가가 [ICON_PRODUCTION] 생산 +1, [ICON_GOLD] 골드를 생성합니다. , [ICON_RESEARCH] 과학, [ICON_CULTURE] 문화.[NEWLINE][NEWLINE]1 [ICON_RES_URANIUM] 우라늄이 필요합니다.'),
('TXT_KEY_BUILDING_FW_FUSION_PLANT_PEDIA', '핵융합 발전의 성공적인 개발은 인간의 성장과 노력을 지속하는 데 도움이 되는 상대적으로 깨끗한 다량의 에너지원에 대한 잠재력을 제공합니다. 핵융합발전을 실현하려면 몇 가지 해결해야 할 문제가 있었습니다. 먼저 핵융합발전에 필요한 원료인 중수소나 삼중수소를 확보하는 것이었는데, 이 원료들은 바닷물에서 무한정 구할 수 있었습니다. 그 다음 문제가 되는 것은 수천°C의 온도로 가열해 만든 플라즈마 상태의 수소원자핵을 고주파를 이용해 1억°C 이상의 초고온 상태로 만드는 것이었습니다. 두 개의 원자핵을 융합하려면 원자핵 사이에 존재하는 쿨롱힘(coulomb force)에 의한 반발력을 이겨낼 수 있는 환경이 조성되어야 하는데, 이를 위해서는 대략 108°C보다 높아야 중수소와 삼중수소가 플라즈마(plasma) 상태로 바뀌어 핵융합 반응이 자연적으로 발생하기 때문이다. 하지만 그렇게 높은 온도를 견디는 구조물 만들 수 있는 재료물질이 없었는데, AI 기술발전과 신재료물질, 상온 초전도체를 연구하면서 신물질에 기본이 되는 금속 강화 아다만티움을 연구에 성공하게 되었습니다. 원래는 지구상의 물질 중 1억°C나 되는 온도를 견딜 수 있는 물질은 존재하지 않기 때문이다. 따라서 플라즈마가 자기적 성질을 띠는 점을 착안하여, 도넛 구조의 전자기물질을 통해 형성된 인공자기장에 플라즈마를 가두고 에너지를 생산하는 토카막(Tokamak)이 개발이 성공적으로 착수되었고, 이는 핵융합 반응로를 상용화게 하게 만들었습니다.'),

-- Orbital Habitat
('TXT_KEY_BUILDING_FW_ORBITAL_HABITAT', '우주궤도 식량재배시설'),
('TXT_KEY_BUILDING_FW_ORBITAL_HABITAT_HELP', '[ICON_VP_SCIENTIST] 과학자, [ICON_VP_ENGINEER] 기술자, [ICON_VP_MERCHANT] 상인 1명마다 [ICON_FOOD]식량이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]씩 증가합니다. 우주정거장의 연구모듈의 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR], 공학모듈의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR], 상업모듈의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR]씩 증가합니다. [NEWLINE][NEWLINE]도시에 건물을 건설할때 [ICON_PRODUCTION]생산 보너스를 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR] 제공합니다.[NEWLINE][NEWLINE]전문가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]명이 더이상 [ICON_URBANIZATION]도시화에서 오는 [ICON_HAPPINESS_3]불행을 증가시키지 않습니다.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]핵무기로 파괴되지 않는 건물입니다. [COLOR_PLAYER_NETHERLANDS_BACKGROUND]항공우주 복합시설[ENDCOLOR]과 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]우주선 발사센터[ENDCOLOR]가 있어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_ORBITAL_HABITAT_STRATEGY', '생산하기 위해 매우 비용이 많이 들지만 우주궤도 식량재비시설을 통해 최대 인구 수를 크게 확장합니다.'),
('TXT_KEY_BUILDING_FW_ORBITAL_HABITAT_PEDIA', '인공 식량 재배의 궁극적인 방법인 우주궤도 식량재시설을 건설하여 우주에서 완전히 자립적인 농업 환경을 구축합니다. 대부분의 초기 우주 정거장은 엄청난 비용을 들여 행성 표면에서 운반되는 식량 공급에 의존했지만, 궤도 서식지는 우주 정거장이 거의 자급자족할 수 있도록 허용하여 그곳에서 일하는 사람들이 필요로 하는 식량의 대부분을 재배했습니다. 초기 서식지에서 생산된 식품은 마이코프로테인 보충제보다 조금 나았지만 시간이 지남에 따라 수경재배 및 수경재배 기술을 사용하여 승무원을 유지하는 데 도움이 되는 다양한 채소와 식물을 재배하면서 점점 더 발전되고 정교해졌습니다.'),


-- Research Module
('TXT_KEY_BUILDING_FW_RESEARCH_MODULE', '우주정거장-연구모듈'),
('TXT_KEY_BUILDING_FW_RESEARCH_MODULE_HELP', '[COLOR_YELLOW][ICON_GREAT_SCIENTIST]위대한 과학자[ENDCOLOR]가 1명 출현합니다. [NEWLINE] 도시의 [ICON_VP_SCIENTIST] 과학자의 [ICON_RESEARCH]과학이[COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]우주정거장[ENDCOLOR]이 있어야건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_RESEARCH_MODULE_STRATEGY', '도시의 과학을 향상시키기 위한 연구 모듈을 건설하십시오.'),
('TXT_KEY_BUILDING_FW_RESEARCH_MODULE_PEDIA', '연구 모듈은 과학 연구를 지원하기 위해 우주 정거장에 추가하도록 설계된 모듈식 거주지 및 실험실입니다.'),

-- Engineering Module
('TXT_KEY_BUILDING_FW_ENGINEERING_MODULE', '우주정거장-공학모듈'),
('TXT_KEY_BUILDING_FW_ENGINEERING_MODULE_HELP', '[COLOR_YELLOW][ICON_GREAT_ENGINEER]위대한 기술자[ENDCOLOR]가 1명 출현합니다. [NEWLINE] 도시의 [ICON_VP_ENGINEER] 기술자의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]우주정거장[ENDCOLOR]이 있어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_ENGINEERING_MODULE_STRATEGY', '도시의 생산 산출량을 늘리기 위한 공학 모듈을 건설하십시오.'),
('TXT_KEY_BUILDING_FW_ENGINEERING_MODULE_PEDIA', '엔지니어링 모듈은 산업 개발을 지원하기 위해 우주 정거장에 추가하도록 설계된 모듈식 거주지 및 미세 중력 작업장입니다.'),

-- Comm Module
('TXT_KEY_BUILDING_FW_COMM_MODULE', '우주정거장-상업모듈'),
('TXT_KEY_BUILDING_FW_COMM_MODULE_HELP', '[COLOR_YELLOW][ICON_GREAT_MERCHANT]위대한 상인[ENDCOLOR]이 1명 출현합니다. [NEWLINE] 도시의 [ICON_VP_MERCHANT] 상인의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]우주정거장[ENDCOLOR]이 있어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_COMM_MODULE_STRATEGY', '도시의 부를 늘리기 위한 통신 모듈을 건설하십시오.'),
('TXT_KEY_BUILDING_FW_COMM_MODULE_PEDIA', '통신 모듈은 상업적 노력을 지원하기 위해 우주 정거장에 추가하도록 설계된 모듈식 거주지 및 통신 장비입니다.'),

-- M-Type Asteroid
('TXT_KEY_BUILDING_FW_ASTEROID_MINING_1', 'M형 소행성'),
('TXT_KEY_BUILDING_FW_ASTEROID_MINING_1_HELP', '[ICON_RES_ALUMINUM]알루미늄 [COLOR_POSITIVE_TEXT]6개[ENDCOLOR]를 제공.'),
('TXT_KEY_BUILDING_FW_ASTEROID_MINING_1_QUOTE', '문명에 [ICON_RES_ALUMINUM] 알루미늄 6개를 제공합니다.'),
('TXT_KEY_BUILDING_FW_ASTEROID_MINING_1_PEDIA', 'M형 소행성은 부분적으로 알려진 구성의 소행성입니다. 적당히 밝습니다(알베도 0.1–0.2). 전부는 아니지만 일부는 순수하거나 소량의 돌과 혼합된 니켈-철로 만들어집니다. 이들은 충돌에 의해 조각난 분화된 소행성의 금속 핵 조각으로 생각되며 철 운석의 근원으로 생각됩니다. M형 소행성은 세 번째로 흔한 소행성 유형입니다.'),

-- S-Type Asteroid
('TXT_KEY_BUILDING_FW_ASTEROID_MINING_2', 'S형 소행성'),
('TXT_KEY_BUILDING_FW_ASTEROID_MINING_2_HELP', '[ICON_RES_NANOMAT]나노물질 [COLOR_POSITIVE_TEXT]6개[ENDCOLOR]를 제공.'),
('TXT_KEY_BUILDING_FW_ASTEROID_MINING_2_QUOTE', ' 문명에 [ICON_RES_NANOMAT] 나노물질 6개를 제공합니다.'),
('TXT_KEY_BUILDING_FW_ASTEROID_MINING_2_PEDIA', 'S형 소행성 또는 규산 소행성은 암석으로 구성되어 있으므로 이름이 붙여졌습니다. 소행성의 약 17%가 이 유형이며 C 유형 다음으로 두 번째로 흔합니다.'),

-- Research Exchange
('TXT_KEY_BUILDING_FW_GENOME_PROJECT_1', '연구 교환'),
('TXT_KEY_BUILDING_FW_GENOME_PROJECT_1_HELP', '연구소의 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가하고, 의학 연구소의 [ICON_FOOD]식량이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다.'),
('TXT_KEY_BUILDING_FW_GENOME_PROJECT_1_STRATEGY', '연구소의 과학과 의학연구소의 식량이 증가합니다.'),
('TXT_KEY_BUILDING_FW_GENOME_PROJECT_1_PEDIA', '인간 게놈 프로젝트에 적은 양의 시간과 자원만 기여한 문명은 그 결과 정보와 기술의 교환으로 여전히 이익을 얻었습니다. 연구소는 개발된 신기술의 혜택을 받았고 의학 연구소는 질병 및 기타 질병을 보다 효과적으로 치료할 수 있었습니다.'),

-- Genetic Treatments
('TXT_KEY_BUILDING_FW_GENOME_PROJECT_2', '유전자 치료'),
('TXT_KEY_BUILDING_FW_GENOME_PROJECT_2_HELP', '모든 도시의 [ICON_CITIZEN]시민이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]증가하고, 유전자 연구소의 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR]증가합니다.'),
('TXT_KEY_BUILDING_FW_GENOME_PROJECT_2_STRATEGY', '문면 전역 모든 도시의 시민이 증가하며, 유전자 연구소의 과학을 증가시킵니다.'),
('TXT_KEY_BUILDING_FW_GENOME_PROJECT_2_PEDIA', '인간 게놈 프로젝트에 더 광범위하게 참여하면 그렇게 하기로 선택한 문명에 더 큰 보상이 주어집니다. 인간 게놈에 대한 지식이 늘어남에 따라 특정 질병과 만성 질환을 훨씬 쉽게 치료할 수 있게 되어 삶의 질이 크게 향상되었습니다.'),

-- Terraforming Station
('TXT_KEY_BUILDING_FW_TERRAFORMING_STATION', '유전자 가속 센터'),
('TXT_KEY_BUILDING_FW_TERRAFORMING_STATION_HELP', '도시 근처에 [ICON_RES_ADN_FUNGUS]ADN균 [COLOR_POSITIVE_TEXT]1개[ENDCOLOR]가 나타납니다.[NEWLINE][NEWLINE]유전자 연구단지의 [ICON_RESEARCH]과학과 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR]증가합니다. [NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]유전자개조 연구소[ENDCOLOR]가 있어야하고, [COLOR_NEGATIVE_TEXT]중앙 통제 센터, AI네트워크[ENDCOLOR]가 없어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_TERRAFORMING_STATION_STRATEGY', '유전자 연구단지의 산출량을 증가시킵니다. 도시 주변 타일에 ADN균이 출현합니다.'),
('TXT_KEY_BUILDING_FW_TERRAFORMING_STATION_PEDIA', '유전자 가속 센터는 유전자 연구를 집중적으로 수행하고, 그 결과를 활용하여 다양한 생명공학 및 유전학 프로젝트를 가속화하는 공간입니다. 이 건물은 최첨단의 연구 설비와 훌륭한 과학자들을 포함하여, 게임 내에서 유전자 연구를 돕는 데 필요한 모든 자원을 제공합니다. 유전자 가속 센터의 핵심 기능 중 하나는 유전자 시퀀싱과 분석입니다. 이 곳에서, 과학자들은 다양한 생명체의 유전체를 해독하고, 이를 통해 새로운 유전자를 찾아내거나, 이미 알려진 유전자의 기능을 더 깊게 이해하는 데 도움을 줍니다. 이런 정보는 새로운 생명공학 기술의 개발이나, 질병의 원인과 치료법을 찾는 데 매우 중요합니다.또한, 유전자 가속 센터에서는 유전자 수정 기술도 연구합니다. 이 기술을 통해, 과학자들은 생명체의 유전자를 편집하여 특정 특성을 강화하거나, 원치 않는 특성을 제거할 수 있습니다. 이러한 유전자 수정은 식물이나 동물을 개량하거나, 질병을 치료하는 데 활용될 수 있습니다.[NEWLINE][NEWLINE]유전자 가속 센터는 유전자 연구를 향상시키는 데 도움을 주는 중추적인 역할을 합니다. 그것은 연구를 수행하는데 필요한 기계와 장비, 그리고 유전자 연구에 특화된 전문적인 인력을 제공함으로써, 유전자 연구의 진척을 촉진하고, 그 결과를 게임 내 다른 활동에 활용할 수 있도록 합니다. 유전자 가속 센터는 유전학의 가장 앞선 연구를 수행하고, 이를 통해 게임 내의 생명과 과학의 이해를 향상시키는 역할을 수행합니다.'),

-- Birthing Pods
('TXT_KEY_BUILDING_FW_BIRTHING_PODS', '인공 출산 시설'),
('TXT_KEY_BUILDING_FW_BIRTHING_PODS_HELP', '건설 완료시 도시의 [ICON_CITIZEN]시민이 [COLOR_POSITIVE_TEXT]3명[ENDCOLOR]이 즉시 늘어납니다. [ICON_CITIZEN]시민이 증가할 때 사용한 [ICON_FOOD]식량의 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR]를 다음 [ICON_CITIZEN]시민을 위해 사용할 수 있습니다. [COLOR:105:105:105:255](이 효과는 송수로와 중첩됩니다.)[ENDCOLOR] 도시의 전문가의 기본 산출량이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 전역 [ICON_HAPPINESS_1]행복이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR]증가합니다. [NEWLINE][NEWLINE]전문가 [COLOR_POSITIVE_TEXT]1명[ENDCOLOR]이 더이상 [ICON_URBANIZATION]도시화에서 오는 [ICON_HAPPINESS_3]불행을 증가시키지 않습니다.[NEWLINE][NEWLINE] 도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]유전자공학 연구소[ENDCOLOR]와 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]병원[ENDCOLOR]이 있어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_BIRTHING_PODS_STRATEGY', '인공 출산 시설은 도시가 크기를 늘리는 데 필요한 [ICON_FOOD] 식량의 양을 수확량을 높이는 최종 건물입니다. 건설 시 도시에 시민이 3명이 즉시 증가합니다.'),
('TXT_KEY_BUILDING_FW_BIRTHING_PODS_PEDIA', '체외에서의 인간 유전자 수정 과정이 일반화됨에 따라 인공적인 배란 과정도 같은 추세를 보였습니다. 점차 많은 아이들이 인공 자궁에서 태어나게 되어, 부모들은 출산의 신체적인 고통을 피하게 되었으며, 동시에 임신 과정을 지속적으로 모니터링하여 어떠한 합병증도 피할 수 있게 되었습니다. 결국, 이러한 시설들은 키메라를 생성하는데 사용되는 외배성 캡슐과 유사한 ''출산 캡슐''이라는 전용 시설로 발전하게 되었습니다. 하지만 외배성 캡슐과는 달리, 이러한 시설들은 유아들을 위한 유전적, 의료적 치료 전반을 제공할 수 있었으며, 많은 지역에서 아이를 출산하는 선호 방식으로 간주되었습니다.'),

-- Digital Police
('TXT_KEY_BUILDING_FW_DIGITAL_POLICE', '디지털 경찰서'),
('TXT_KEY_BUILDING_FW_DIGITAL_POLICE_HELP', '[ICON_SPY] 도시 보안이 +10 증가하고, [ICON_CITIZEN] 시민 둘마다 1씩 추가로 증가합니다.[NEWLINE][NEWLINE][ICON_FOOD]/[ICON_PRODUCTION]낙후, [ICON_GOLD] 빈곤, [ICON_RESEARCH] 문맹, [ICON_CULTURE]무료에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다.'),
('TXT_KEY_BUILDING_FW_DIGITAL_POLICE_STRATEGY', '디지털 경찰은 적 스파이가 도시를 해칠 수 있는 속도를 늦춥니다. 디지털 경찰을 구축하기 위해서는 도시에 자치 경찰이 있어야 합니다.'),
('TXT_KEY_BUILDING_FW_DIGITAL_POLICE_PEDIA', '디지털 경찰서는 가상세계의 특수한 공간으로, 인공지능과 인간 사용자 모두의 데이터를 보호하는 역할을 하는 고도로 진화된 보안 시스템입니다. 이 건물은 일반적인 사이버 경찰서를 넘어서, 물리적 세계와 디지털 세계 양쪽 모두에서 범죄를 예방하고 처벌하는 기능을 수행합니다. 디지털 경찰서의 핵심 기능은 두 가지입니다. 첫째, 고급 인공지능 기술을 이용하여 가상 세계에서의 프로그램 해킹을 막습니다. 이를 통해 인공지능이나 프로그램의 부정적인 조작을 방지하고, 사용자가 가상 세계에서 안전하게 활동할 수 있도록 보장합니다. 둘째, 디지털 경찰서는 인간 사용자의 개인정보 보호에도 특화되어 있습니다. 가상 세계에 연결된 사용자의 정보가 노출되거나 불법적으로 사용되는 것을 방지하기 위해, 다양한 보안 방법을 사용하여 사용자의 데이터를 안전하게 보호합니다. 이러한 보안 방법에는 강력한 암호화, 실시간 모니터링, 그리고 사용자의 정보를 위협하는 활동을 자동으로 탐지하고 차단하는 고급 시스템이 포함됩니다. 디지털 경찰서는 그 자체로도 훌륭한 보안 시스템이지만, 더불어 사용자들이 자신의 데이터를 안전하게 관리하고 보호하는 데 필요한 교육도 제공합니다. 사용자가 자신의 정보를 어떻게 안전하게 유지할 수 있는지, 해킹 시도를 어떻게 인식하고 대응할 수 있는지에 대한 지식을 배울 수 있는 프로그램이 구비되어 있습니다.'),
-- Brain Uploading Facility
('TXT_KEY_BUILDING_FW_BRAIN_UPLOADING', '브레인 업로드 시설'),
('TXT_KEY_BUILDING_FW_BRAIN_UPLOADING_HELP', '도시의 [ICON_CITIZEN]시민 중 많은 이들이 업로드됩니다. 업로드된 [ICON_CITIZEN]시민들은 더이상 전문가 슬롯이나 타일에 배치할 수 없으나, 남은 도시의 [ICON_CITIZEN]시민 1명마다 [ICON_PRODUCTION]생산, [ICON_RESEARCH]과학, [ICON_GOLD]골드, [ICON_CULTURE]문화 산출량이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]씩 증가합니다.[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]사이버 클리닉[ENDCOLOR]이 있어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_BRAIN_UPLOADING_STRATEGY', '도시의 인구가 증대 되여 불행이 증가 될 정도로 과밀한 경우, 사회에 기여할 수 있는 동시에 시민의 의식을 사이버 공간에 업로드(신체적 유기체에 해를 끼치도록)하는 것이 가능합니다. '),
('TXT_KEY_BUILDING_FW_BRAIN_UPLOADING_PEDIA', '컴퓨터 기술의 발달로 인간의 마음을 복제할 수 있는 능력이 생겼다. 이는 인간의 뇌가 디지털 형태로 완벽하게 복제되어 인간의 마음이 인공지능과 유사한 디지털 형태로 존재하게 되는 ''브레인 업로딩'' 과정으로 이어진다. 로봇 대리인과 가상 환경의 가용성이 증가함에 따라 이러한 업로드된 마음은 생존을 위해 더 이상 음식이나 기타 편의 시설이 필요하지 않지만 물리적 세계 및 다른 인간과 완전히 상호 작용할 수 있습니다.  생물학적으로 보자면 현대판 안락사, 현대판 고려장이라는 의견이 있어서 논란이 있습니다.'),

-- Nucleonic Foundry
('TXT_KEY_BUILDING_FW_ALLOY_FOUNDRY', '핵공학 제조공장'),
('TXT_KEY_BUILDING_FW_ALLOY_FOUNDRY_HELP', '도시에서 작업중인 [ICON_RES_ALUMINUM]알루미늄과 [ICON_RES_URANIUM]우라늄 자원 타일마다 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]4[ENDCOLOR], [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE][ICON_RES_NANOMAT]나노물질 [COLOR_POSITIVE_TEXT]8개[ENDCOLOR]를 제공합니다. [NEWLINE][NEWLINE][ICON_RES_URANIUM]우라늄 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR]가 필요합니다.도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]핵융합 반응로[ENDCOLOR]가 있어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_ALLOY_FOUNDRY_STRATEGY', '[ICON_RES_NANOMAT] 나노 물질을 8개를 생성합니다. 이 도시에서 작업한 [ICON_RES_ALUMINUM] 알루미늄 및 [ICON_RES_URANIUM] 우라늄의 각 공급원은 +4 [ICON_PRODUCTION] 생산 및 +2 [ICON_GOLD] 골드를 생산합니다. 1개의 [ICON_RES_URANIUM] 우라늄과 융합 플랜트가 필요합니다.'),
('TXT_KEY_BUILDING_FW_ALLOY_FOUNDRY_PEDIA', 'HE-3 헬륨의 동위원소 중 하나인 원소로 기존에는 삼중수소가 베타붕괴를 일으켰을 때만 매우 제한적으로 생산이 되었으나, 기술이 발전하여 이제는 생산할 수 있는 수단이 발견되면 산업화로 발전했습니다. 그러나 엄청난 양의 에너지와 제조 조건을 제어하는 데 필요한 정밀 장비로 인해 이러한 시설은 드물었습니다. 그들은 최소한 전용 핵융합로가 필요했고, HE-3 합성 과정을 더 쉽게 하기 위해 우라늄과 같은 기존의 무거운 원소를 종종 활용했습니다. 그러나 그들이 생산한 재료는 거의 파괴되지 않았으며 인류가 지금까지 달성한 것 중 가장 크고 가장 인상적인 인공 구조물을 만들 수 있었습니다.'),

-- Utility Fog Generator
('TXT_KEY_BUILDING_FW_UTILITY_FOG', '나노로봇 생성기'),
('TXT_KEY_BUILDING_FW_UTILITY_FOG_HELP', '도시의 [ICON_RANGE_STRENGTH]원거리 공격 범위가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 모든 건물을 건설할 때 [ICON_PRODUCTION]생산보너스를 [COLOR_POSITIVE_TEXT]20%[ENDCOLOR]제공합니다.[NEWLINE][NEWLINE][ICON_CITY_STATE]도시의 규모 요구치가 [COLOR_POSITIVE_TEXT]5%[ENDCOLOR] 감소합니다.[NEWLINE][NEWLINE][ICON_RES_NANOMAT]나노물질 [COLOR_POSITIVE_TEXT]3개[ENDCOLOR]를 제공합니다. [NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]무인관리기지[ENDCOLOR]가 있어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_UTILITY_FOG_STRATEGY', '도시 방어 및 [ICON_HAPPINESS_1] 행복도를 높입니다. 건물 건설 속도가 20% 빨라집니다.'),
('TXT_KEY_BUILDING_FW_UTILITY_FOG_PEDIA', '점점 더 정교해지고 지능적인 나노머신은 물리적 구조를 복제하기 위해 함께 묶을 수 있는 작은 로봇 모음인 유틸리티 포그의 개발을 가능하게 했습니다. 처음에 그들은 보호 목적으로 생각되었으며, 갑작스러운 충격이 그들을 결합하도록 자극하여 넓은 표면에 충격을 퍼뜨릴 때까지 느슨하고 유동적인 상태를 유지했습니다. 그러나 물리적 물체를 생산하거나 개인을 장소로 이동시키는 데에도 사용할 수 있습니다.'),

-- Moon Base
('TXT_KEY_BUILDING_FW_MOON_BASE', '달 기지'),
('TXT_KEY_BUILDING_FW_MOON_BASE_HELP', '도시의 [ICON_CITIZEN]시민 10명 마다 [ICON_GOLD]골드, [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]씩 증가합니다. 전역[ICON_HAPPINESS_1]행복이 [COLOR_POSITIVE_TEXT]3[ENDCOLOR]증가합니다.  문명에 있는 모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]핵융합 반응로[ENDCOLOR]와 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]우주정거장[ENDCOLOR]의 산출량이 증가합니다.[NEWLINE][NEWLINE][ICON_RES_NANOMAT]나노물질 [COLOR_POSITIVE_TEXT]7개[ENDCOLOR]를 제공합니다. [NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]항공우주 복합시설[ENDCOLOR]과 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]우주선 발사센터[ENDCOLOR]가 있어야 건설할 수 있습니다. 문명당 1개만 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_MOON_BASE_STRATEGY', '과학, 생산 및 금을 증가시키는 최종 국가 불가사의는 각 융합 식물에 대한 혜택입니다.'),
('TXT_KEY_BUILDING_FW_MOON_BASE_PEDIA', '21세기 인류의 야망 중 하나는 달에 영구적인 정착지를 건설하는 것이었습니다. 그러한 정착지는 달과 다른 천체 연구를 위한 훌륭한 연구 플랫폼을 제공할 뿐만 아니라 핵융합로에서 사용할 수 있는 삼중수소와 같은 거의 무한한 물질 공급원을 제공할 것입니다.'),

-- Geofront
('TXT_KEY_BUILDING_FW_DEFENSE_FIELD', '지오프론트'),
('TXT_KEY_BUILDING_FW_DEFENSE_FIELD_HELP', '도시의 [ICON_STRENGTH]방어력이 증가합니다.[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]군사 기지[ENDCOLOR]와 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]전략적 방어시스템[ENDCOLOR]이 있어야 건설할 수 있습니다. [COLOR_NEGATIVE_TEXT]해안 도시[ENDCOLOR]는 건설할 수 없습니다.'),
('TXT_KEY_BUILDING_FW_DEFENSE_FIELD_STRATEGY', '도시의 도시 방어력이 크게 증가합니다.'),
('TXT_KEY_BUILDING_FW_DEFENSE_FIELD_PEDIA', '비해안도시의 방어력을 매우 강화시킵니다. 지오프론트는 지하 벙커의 개념을 기반으로 한 방어 구조물입니다. 거대한 지하 시설로 지상 공격으로부터 잘 보호되며 도시 시민에게 상당한 보호를 제공할 수 있습니다.'),

-- Central Command
('TXT_KEY_BUILDING_FW_CENTRAL_COMMAND', '중앙 통제 센터'),
('TXT_KEY_BUILDING_FW_CENTRAL_COMMAND_HELP', '완전환경도시의 [ICON_GOLD]골드와 [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE][ICON_RES_NANOMAT]나노물질 [COLOR_POSITIVE_TEXT]2개[ENDCOLOR]를 제공합니다.[NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]항공우주 복합시설[ENDCOLOR]이 있어야하고, [COLOR_NEGATIVE_TEXT]AI네트워크,  유전자 가속 센터[ENDCOLOR]가 없어야 건설할 수 있습니다.'),
('TXT_KEY_BUILDING_FW_CENTRAL_COMMAND_STRATEGY', '완전 환경도시의 산출량에 도움이 될 것입니다.'),
('TXT_KEY_BUILDING_FW_CENTRAL_COMMAND_PEDIA', '중앙 통제 센터는 완전 환경 도시의 심장과도 같은 건물입니다. 이 곳은 모든 생태계의 안정적인 유지를 위해 필요한 다양한 요소들을 지속적으로 모니터링하고 조절하는 장소로, 공동체의 생태학적 균형과 지속 가능성을 확보하는 데 중추적인 역할을 합니다. 중앙 통제 센터는 수많은 센서와 고도의 시스템을 통해 도시 전체의 환경 데이터를 수집하고 분석합니다. 이는 대기 및 수질, 생물 다양성, 에너지 사용량, 날씨 패턴, 식물의 성장 상태 등을 포함합니다. 이런 정보는 도시의 생태계를 총체적으로 이해하고 유지하는 데 필요한 불가결한 자원입니다. 이러한 데이터를 기반으로, 중앙 통제 센터는 도시의 생태계가 안정적으로 유지되도록 필요한 조치를 즉시 시행합니다. 이는 예를 들어, 온도를 조절하거나, 자원을 배분하거나, 생물 다양성을 보호하거나, 에너지 사용을 최적화하는 등의 행동을 포함할 수 있습니다. 또한 중앙 통제 센터는 가능한 환경적 위협을 예측하고 대비하기 위해 장기적인 예측 모델링을 수행합니다. 이는 도시의 생태계가 미래의 변화에도 안정적으로 유지될 수 있도록 보장하는 핵심 역할을 합니다.');
--===========================
-- WONDERS
--===========================

INSERT INTO Language_ko_KR (Tag, Text) VALUES
-- Tokyo Skytree
('TXT_KEY_BUILDING_FW_SKYTREE', '도쿄 스카이트리'),
('TXT_KEY_BUILDING_FW_SKYTREE_HELP', '모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]방송탑[ENDCOLOR]의 [ICON_CULTURE]문화와 [ICON_GOLDEN_AGE]황금기 점수가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR], 문명의 모든 [COLOR_POSITIVE_TEXT]통신기지국[ENDCOLOR]의 [ICON_RESEARCH]과학과 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 전역 [ICON_HAPPINESS_1]행복이 [COLOR_POSITIVE_TEXT]3[ENDCOLOR] 증가합니다.  [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'),
('TXT_KEY_BUILDING_FW_SKYTREE_QUOTE', '[NEWLINE]''하늘에는 동서남북의 방향구분이 없다. 사람들은 자신의 마음으로 구별을 만들고 그것이 사실이라고 믿습니다.''[NEWLINE] - Buddha[NEWLINE]'),
('TXT_KEY_BUILDING_FW_SKYTREE_PEDIA', '도쿄 중심부의 스미다가와 강 근처에 지어진 도쿄 스카이트리는 도시 대부분에서 볼 수 있는 대형 방송 및 전망대입니다. 공사는 2008년 7월 14일에 시작되어 2012년 2월 29일까지 계속되었습니다. 총 높이 634미터(스카이트리가 위치한 지역의 이전 이름인 무사시를 대표하는 높이)의 도쿄 스카이트리는 일본에서 가장 높은 타워입니다. 세계에서 가장 높은 인공 건축물로 두바이의 부르즈 할리파에 이어 두 번째입니다. 이러한 높이는 방송탑으로서의 기능이 가능하기 위해 꼭 필요한 높이였다. 이전 버전인 도쿄 타워는 높이와 주변 고층 빌딩의 높이로 인해 간헐적으로 커버리지가 발생하는 문제에 직면했습니다. 탑의 디자인은 일본의 과거와 미래를 모두 상징하며, 일본 전역에서 국가 성취의 상징으로 잘 알려져 있습니다.'),
-- Utsäde Gene Vault
('TXT_KEY_BUILDING_FW_GENE_VAULT', '스발바르 국제종자저장고'),
('TXT_KEY_BUILDING_FW_GENE_VAULT_HELP', '문명의 모든 [COLOR_POSITIVE_TEXT]자연보호구역[ENDCOLOR]의 [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR], [COLOR_POSITIVE_TEXT]친환경마을[ENDCOLOR]의 [ICON_FOOD]식량이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 문명의 모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]생태친화시설, 바이오 공장, 해양바이오산업단지[ENDCOLOR]의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. 전역 [ICON_HAPPINESS_1]행복이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]도시의 [ICON_GREAT_WRITER]위대한 작가 출현율이 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR] 증가합니다. 해당 불가사의가 있는 도시의 국가 불가사의, 세계 불가사의 및 타일 시설이 제공하는 [ICON_CULTURE]문화의 [COLOR_POSITIVE_TEXT]50%[ENDCOLOR]가 도시의 [ICON_TOURISM]관광에 추가됩니다. [ICON_GREAT_WORK]걸작 문학 슬롯 2개를 포함합니다.[NEWLINE][NEWLINE]테마보너스: [ICON_PEACE]신앙: +4, [ICON_GOLDEN_AGE]황금기 점수: +4'),
('TXT_KEY_BUILDING_FW_GENE_VAULT_QUOTE', '[NEWLINE]''프로그램에 의해 결정되는 씨앗 안에 포함된 세계''[NEWLINE] - Dejan Stojanovic, ''Circling: 1978-1987''[NEWLINE]'),
('TXT_KEY_BUILDING_FW_GENE_VAULT_PEDIA', '21세기 말에 접어들면서 멸종 수준의 증가와 기후 변화의 가능성에 대한 우려로 인해 다양한 유전자 샘플을 보관하는 유전자 은행의 수가 증가하고 있습니다. 이 중 가장 주목할 만한 것은 Utsäde Gene Vault로 2023년에 완공되었습니다. 완전히 자급자족할 수 있도록 첨단 ''녹색'' 기술을 활용하여 유전자 샘플의 중앙 저장소이자 네트워크로 연결된 연구 시설의 역할을 했습니다. , 전 세계 유전학 연구소와 정보를 공유합니다.'),
('TXT_KEY_THEMING_BONUS_GENE_VAULT', '기후 변화 예술 작품'),
('TXT_KEY_GENE_VAULT_THEMING_BONUS_HELP', '보너스를 최대화하려면 두 걸작이 모두 문명에서 만든 걸작으로 있는지 확인하세요.'),
-- Utsäde Gene Vault2
('TXT_KEY_BUILDING_FW_GENE_VAULT2', '이든프로젝트'),
('TXT_KEY_BUILDING_FW_GENE_VAULT2_HELP', '문명의 모든 [COLOR_POSITIVE_TEXT]자연보호구역[ENDCOLOR]의 [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR], [COLOR_POSITIVE_TEXT]친환경마을[ENDCOLOR]의 [ICON_FOOD]식량이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 문명의 모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]생태친화시설, 바이오 공장, 해양바이오산업단지[ENDCOLOR]의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. 전역 [ICON_HAPPINESS_1]행복이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]도시의 [ICON_GREAT_WRITER]위대한 작가 출현율이 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR] 증가합니다. 해당 불가사의가 있는 도시의 국가 불가사의, 세계 불가사의 및 타일 시설이 제공하는 [ICON_CULTURE]문화의 [COLOR_POSITIVE_TEXT]50%[ENDCOLOR]가 도시의 [ICON_TOURISM]관광에 추가됩니다. [ICON_GREAT_WORK]걸작 문학 슬롯 2개를 포함합니다.[NEWLINE][NEWLINE]테마보너스: [ICON_PEACE]신앙: +4, [ICON_GOLDEN_AGE]황금기 점수: +4'),
('TXT_KEY_BUILDING_FW_GENE_VAULT2_QUOTE', '[NEWLINE]''프로그램에 의해 결정되는 씨앗 안에 포함된 세계''[NEWLINE] - Dejan Stojanovic, ''Circling: 1978-1987''[NEWLINE]'),
('TXT_KEY_BUILDING_FW_GENE_VAULT2_PEDIA', '21세기 말에 접어들면서 멸종 수준의 증가와 기후 변화의 가능성에 대한 우려로 인해 다양한 유전자 샘플을 보관하는 유전자 은행의 수가 증가하고 있습니다. 이 중 가장 주목할 만한 것은 Utsäde Gene Vault로 2023년에 완공되었습니다. 완전히 자급자족할 수 있도록 첨단 ''녹색'' 기술을 활용하여 유전자 샘플의 중앙 저장소이자 네트워크로 연결된 연구 시설의 역할을 했습니다. , 전 세계 유전학 연구소와 정보를 공유합니다.'),
-- Shanghai World Financial Center
('TXT_KEY_BUILDING_FW_SHANGHAI_WFC', '상하이 국제금융센터'),
('TXT_KEY_BUILDING_FW_SHANGHAI_WFC_HELP', '이 불가사의가 완성되면 [ICON_GOLD]골드를 [COLOR_POSITIVE_TEXT]15000[ENDCOLOR] 일시불로 획득하고, 알려진 모든 문명에 [ICON_TOURISM]관광을 [COLOR_POSITIVE_TEXT]10000[ENDCOLOR] 일시불로 획득합니다. [NEWLINE]이 도시에서 다른 문명으로 출발하는 [ICON_INTERNATIONAL_TRADE]교역로가 완료되면 현재 [ICON_CULTURE]문화 및 [ICON_TOURISM]관광 산출량의 [COLOR_POSITIVE_TEXT]5%[ENDCOLOR]만큼의 [ICON_TOURISM]관광을 일시불로 제공합니다. [NEWLINE]도시 근처의 마을과 소도시의 [ICON_CULTURE]문화와 [ICON_TOURISM]관광이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][ICON_GOLD]빈곤에서 오는 [ICON_HAPPINESS_3]불행이 전역 [COLOR_POSITIVE_TEXT]5[ENDCOLOR] 감소합니다. [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'),
('TXT_KEY_BUILDING_FW_SHANGHAI_WFC_QUOTE', '[NEWLINE]''돈으로 살 수 있는 최고의 정부''[NEWLINE] - 마크 트웨인[NEWLINE]'),
('TXT_KEY_BUILDING_FW_SHANGHAI_WFC_PEDIA', '상하이 세계 금융 센터는 중국 상하이에 위치한 초고층 빌딩입니다. 2007년 완공 당시에는 지구상에서 두 번째로 높은 건물이자 중국에서 가장 높은 건물이었습니다. 이후 네 번째로 높은 것으로 하향 조정되었습니다. 그러나 여전히 해발 474m에 가장 높은 전망대가 있습니다. 상하이 세계 금융 센터의 주요 특징은 건물 꼭대기 근처에 위치한 큰 직사각형 조리개입니다. 초기 디자인에서는 원형을 의도했지만 일본의 ''떠오르는 태양'' 모티프와 유사하다는 논란으로 인해 모양이 변경되었습니다.'),
-- Virtual Idol
('TXT_KEY_BUILDING_FW_VIRTUAL_IDOL', '버츄어 아이돌'),
('TXT_KEY_BUILDING_FW_VIRTUAL_IDOL_HELP', '[COLOR_YELLOW][ICON_GREAT_PEOPLE]위대한 음악가[ENDCOLOR] 1명이 출현합니다. 도시의 [ICON_CULTURE]문화 산출량이 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR] 증가하고, [ICON_GREAT_WORK]걸작에서 오는 [ICON_TOURISM]관광이 [COLOR_POSITIVE_TEXT]50%[ENDCOLOR] 증가합니다. [ICON_GREAT_PEOPLE]위대한 음악가 점수가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][ICON_CULTURE]무료에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 감소합니다. [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'),
('TXT_KEY_BUILDING_FW_VIRTUAL_IDOL_QUOTE', '[NEWLINE]''인공 지능 소프트웨어와의 가상 관계에 주의하세요.''[NEWLINE] - Larry Ellison[NEWLINE]'),
('TXT_KEY_BUILDING_FW_VIRTUAL_IDOL_PEDIA', '21세기 슈퍼컴퓨터가 인간(또는 인간에 가까운 존재)의 외모와 목소리를 합성하는 데 점점 더 정교해짐에 따라 인공적으로 생성된 음악 연주자인 ''가상 아이돌''의 개념은 형태. 인공 지능에 반대하거나 컴퓨터가 창의적 추구를 수행할 수 없다고 생각하는 사람들로부터 상당한 비판을 받는 반면, 가상 아이돌은 그들의 공연이 점점 더 다양하고 독특한 스타일이 되면서 점점 더 널리 퍼졌습니다. 주목할만한 최초의 가상 아이돌은 Crypton Future Media에서 만든 신디사이저 프로그램을 사용하는 휴머노이드 페르소나인 하츠네 미쿠였습니다. 그녀의 인기의 상당 부분은 당시 네트워크 문화의 성장에서 비롯되었지만, 그녀는 또한 합성된 페르소나로 라이브 공연을 하는 선구적인 방법을 도왔습니다. 이러한 발전은 Maria와 Sharon Apple과 같은 뒤를 이은 다른 가상 아이돌을 위한 길을 닦는 데 도움이 되었습니다.'),
-- Nano Institute
('TXT_KEY_BUILDING_FW_NANO_INSTITUTE', '나노공학 메가시티'),
('TXT_KEY_BUILDING_FW_NANO_INSTITUTE_HELP', '[COLOR_PLAYER_NETHERLANDS_BACKGROUND]나노물질 군수공장[ENDCOLOR]을 무료로 제공합니다. [NEWLINE][NEWLINE][ICON_RES_NANOMAT]나노물질 [COLOR_POSITIVE_TEXT]5개[ENDCOLOR]를 제공합니다.[NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'),
('TXT_KEY_BUILDING_FW_NANO_INSTITUTE_QUOTE', '[NEWLINE]''나노기술의 영향은 전자 혁명이 우리 삶에 미친 영향을 능가할 것으로 예상됩니다.''[NEWLINE] -Richard Schwartz [NEWLINE]'),
('TXT_KEY_BUILDING_FW_NANO_INSTITUTE_PEDIA', '나노 기술은 인류의 생존에 큰 영향을 미칠 것입니다. 나노 기술의 발전을 통해 비용을 줄이고 의료 기술의 품질을 향상시킬 수 있다면 만연한 질병을 보다 광범위하게 다루고 인간의 고통 수준을 줄일 수 있습니다. 연구소는 그런 기량을 발굴하고 발전시키는 현시대 최고의 희망입니다.'),
-- Apex Centre
('TXT_KEY_BUILDING_FW_APEX_CENTRE', '에이펙스 센터'),
('TXT_KEY_BUILDING_FW_APEX_CENTRE_HELP', '[ICON_DIPLOMAT]위대한 외교관이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]명 출현하고, [ICON_DIPLOMAT]위대한 외교관 점수가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. [ICON_RES_PAPER]종이를 [COLOR_POSITIVE_TEXT]3개[ENDCOLOR] 제공합니다.[NEWLINE][NEWLINE]도시의 [ICON_SPY]보안 레벨이 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR] 증가합니다. 적[ICON_SPY]스파이가 이 도시에서 사망하면 [ICON_PEACE]신앙을 [COLOR:105:105:105:255](시대 및 살해된 스파이의 레벨에 따라 보정)[ENDCOLOR] 제공합니다.[NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'),
('TXT_KEY_BUILDING_FW_APEX_CENTRE_QUOTE', '[NEWLINE][TAB][TAB]''세상은 옳고 그름에 관심이 없습니다. 그것은 모두 힘에 관한 것입니다. 그리고 지금 당장은 아무도 가지고 있지 않습니다.''[NEWLINE][TAB][TAB] — Adam Jensen[NEWLINE][TAB]'),
('TXT_KEY_BUILDING_FW_APEX_CENTRE_PEDIA', '에이팩스 센터는 세계의 외교관과 대사를 위한 웅장한 다목적 비즈니스 및 주거 단지를 소유한 런던에 위치한 컨벤션 빌딩입니다. 중심은 높은 나선 모양의 건물로 둘러싸여 있습니다. 2029년, Nathaniel Brown은 인간복구법이 통과되는 것을 막기 위해 유엔 대표단을 설득하기 위해 이 건물을 세이프 하버 협약의 장소로 선택합니다. Brown과 대표단을 죽이려고 합니다. 이로 인해 C.S.O. 층은 로비를 지나서 제한되고 Jensen은 임박한 공격을 방지할 다른 수단을 찾아야 합니다.'),
-- Kalt Geymsla Data Haven
('TXT_KEY_BUILDING_FW_DATA_HAVEN', '데이터 타워'),
('TXT_KEY_BUILDING_FW_DATA_HAVEN_HELP', '[COLOR_POSITIVE_TEXT]툰드라[ENDCOLOR]와 [COLOR_POSITIVE_TEXT]설원[ENDCOLOR] 타일의 [ICON_RESEARCH]과학과 [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. 모든 도시의 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]서버 허브[ENDCOLOR]의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE]도시가 [COLOR_YELLOW]툰드라에 있어야[ENDCOLOR] 건설할 수 있습니다. 이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'),
('TXT_KEY_BUILDING_FW_DATA_HAVEN_QUOTE', '[NEWLINE]''데이터 자체는 쓸모가 없습니다. 데이터는 적용해야만 유용합니다. ''[NEWLINE] - 토드 박 [NEWLINE]'),
('TXT_KEY_BUILDING_FW_DATA_HAVEN_PEDIA', '21세기 초에 저장되고 교환되는 컴퓨터 데이터의 양은 놀라운 속도로 증가하여 2016년에는 제타바이트 임계값을 초과했습니다. 기존 데이터 센터는 이 데이터를 저장하는 데 필요한 막대한 컴퓨터 시스템이 많은 양을 소비했기 때문에 환경 발자국 문제가 있었습니다. 그들을 시원하게 유지하기 위해 전기의. Kalt Geymsla Data Haven은 이 문제에 대한 한 가지 솔루션으로, 서버가 냉각 요구 사항을 낮추기 위해 추운 북극 공기에 노출될 수 있고 전기를 제공하는 지역 지열 발전소가 있는 아이슬란드에 구축된 거대한 데이터 천국이었습니다. 시설 자체는 외부 외관에 다양한 구성 요소가 내장된 거대한 마더보드처럼 구성되었습니다. 서버에서 생성된 폐열을 포착하여 실험실, 온실 및 직원 거주 공간이 포함된 구조물의 점유 부분에 난방을 제공하는 데 사용했습니다.'),
-- Jurassic Park
('TXT_KEY_BUILDING_FW_JURASSIC_PARK', '쥬라기 공원'),
('TXT_KEY_BUILDING_FW_JURASSIC_PARK_HELP', '이 불가사의가 완성되면 도시 바깥에 공룡 유닛이 출현합니다. [COLOR_PLAYER_NETHERLANDS_BACKGROUND]복제 연구소[ENDCOLOR]를 무료로 제공합니다.모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]동물공연장[ENDCOLOR]의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR], [COLOR_PLAYER_NETHERLANDS_BACKGROUND]복제 연구소[ENDCOLOR]의 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. 전역 [ICON_HAPPINESS_1]행복이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR], [ICON_TOURISM]관광이 [COLOR_POSITIVE_TEXT]3[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]도시의 [ICON_STRENGTH]방어력을 증가시키고, 적의 [ICON_MOVES]이동력을 떨어뜨립니다. [NEWLINE][NEWLINE] 도시 근처에 [COLOR_YELLOW]숲이나 정글이 있어야[ENDCOLOR]건설할 수 있습니다. 이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'),
('TXT_KEY_BUILDING_FW_JURASSIC_PARK_QUOTE', '[NEWLINE]''Life finds a way.''[NEWLINE] -  Ian Malcolm[NEWLINE]'),
('TXT_KEY_BUILDING_FW_JURASSIC_PARK_PEDIA', '유전자 공학에 관한 대부분의 초기 노력은 기존 동식물 생명의 수정 및 향상에 초점을 맞추었지만 멸종된 동식물 종을 부활시키려는 일부 야심찬 노력이 있었습니다. 보존된 DNA를 얻는 것은 매우 어려웠지만 정교한 컴퓨터 알고리즘과 유전자 스플라이싱을 사용하여 DNA 샘플이 거의 발견되지 않은 손상된 부분을 채워 이전에 멸종된 종을 부활시키는 기념비적인 업적을 연구할 수 있었습니다. 이러한 노력의 가장 주목할 만한 사례는 ''쥬라기 공원''으로, 여러 종의 공룡이 유전적으로 재설계되었습니다. 그 노력은 재정적으로 성공했지만 새로 생성된 종은 유전자 개조의 일부 위험을 보여주었습니다. 새로운 종은 제대로 이해되지 않았고 예상치 못한 행동을 보이는 경향이 있었습니다. 공룡이 포로 상태에서 탈출한 기록이 여러 개 있으며, 종종 이를 막기 위해 군사적 개입이 필요했습니다. 이러한 초기 실험은 유전적으로 조작된 유기체가 환경에 어떻게 반응하고 상호작용하는지에 대한 보다 포괄적인 이해의 필요성을 보여주었고 결국에는 살아있는 유기체와 환경이 전체적으로 어떻게 상호작용하는지에 대한 보다 포괄적인 이론으로 이어졌습니다.'),
-- Enrichment Center
('TXT_KEY_BUILDING_FW_ENRICHMENT_CENTRE', '애퍼처 사이언스 센터'),
('TXT_KEY_BUILDING_FW_ENRICHMENT_CENTRE_HELP', '도시의 [ICON_CITIZEN]시민 10명마다 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 문명에 있는 모든 [COLOR_POSITIVE_TEXT]발전기[ENDCOLOR]의 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR],  [COLOR_POSITIVE_TEXT]산업단지[ENDCOLOR]의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][ICON_RES_URANIUM]우라늄 [COLOR_POSITIVE_TEXT]4개[ENDCOLOR]를 제공합니다. [NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]원자력발전소[ENDCOLOR]가 있어야 합니다.'),
('TXT_KEY_BUILDING_FW_ENRICHMENT_CENTRE_QUOTE', '[NEWLINE]''사이언스 센터는 항상 안전한 테스트 환경을 제공할 것을 약속합니다. 위험한 테스트 환경에서 Enrichment Center는 항상 유용한 조언을 제공할 것을 약속합니다. 예를 들어 여기 바닥이 당신을 죽일 것입니다. 그것을 피하십시오.''[NEWLINE] - GLaDOS[NEWLINE]'),
('TXT_KEY_BUILDING_FW_ENRICHMENT_CENTRE_PEDIA', '애퍼처 사이언스 센터는 애퍼처사이언스 주식회사의 신제품을 개발하고 테스트하기 위해 운영하는 주요 시설이었습니다. 미시간의 소금 광산에 건설된 이 시설은 땅 속으로 몇 킬로미터나 뻗어 있는 수갱으로 지어진 정말 거대한 시설이었습니다. 애퍼처 사이언스 센터는 원래 핵광자공학(Nuclear Photonics) 연구를 위해 건설된 거대한 지하 복합 시설이었습니다. 이곳은 감마선과 고출력 레이저를 이용해 원자 구조를 직접 관찰·조작하려는 인류 최초의 시도로, 초전도체와 신소재 합성 연구의 최전선에 있었습니다. 특히 우주 궤도에서 얻은 샘플과 극저온 환경을 모사한 거대한 실험실은 기존 산업 연구소와는 차원이 달랐습니다. 이곳에서 보고된 일부 실험 결과는 LK-99 같은 후보 물질이 원자 단위에서 재설계되어 실제 초전도 특성을 보였다는 증거로 여겨집니다.[NEWLINE]그러나 이후에 남겨진 기록들은 애퍼처 사이언스 센터의 진짜 목적에 대해 의문을 제기합니다. 일부 학자들은 시설의 규모와 자원 투입이 단순한 신소재 연구를 넘어선다고 지적하며, 이곳이 인류가 알지 못하는 다른 목적 ― 우주 에너지의 무기화, 혹은 물질과 생명 간의 경계를 시험하는 실험 ― 에 쓰였던 것은 아닐까 하는 추측을 남겼습니다. 센터의 최종 운명은 여전히 불명확하며, 지금 남아 있는 것은 단지 미스터리와 파편화된 보고서뿐입니다.그러나 22세기 초에 애퍼처 사이언스 주식회사가 파산했고 이후 애퍼처 사이언스 센터는 버려진 것으로 추정됩니다.'),
-- Helios Microwave Power Satellite
('TXT_KEY_BUILDING_FW_HELIOS', '스타링크 고려중'),
('TXT_KEY_BUILDING_FW_HELIOS_HELP', '[COLOR_PLAYER_NETHERLANDS_BACKGROUND]우주 정거장[ENDCOLOR]을 무료로 제공합니다. 문명의 모든 [COLOR_POSITIVE_TEXT]첨단에너지 연구단지[ENDCOLOR]의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR], [COLOR_POSITIVE_TEXT]수경재배지구[ENDCOLOR]의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][ICON_RES_NANOMAT]나노물질 [COLOR_POSITIVE_TEXT]4개[ENDCOLOR]를 제공합니다. [NEWLINE][NEWLINE]도시에 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]우주선 발사센터[ENDCOLOR]가 있어야 합니다. 이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'),
('TXT_KEY_BUILDING_FW_HELIOS_QUOTE', '[NEWLINE]''태양 에너지의 미래는 밝다고 생각합니다.''[NEWLINE] - Ken Salazar[NEWLINE]'),
('TXT_KEY_BUILDING_FW_HELIOS_PEDIA', '궤도에서 태양열을 수집한 다음 마이크로파 형태로 지구에 있는 수집기로 전송할 수 있는 위성의 개념은 20세기 중반부터 존재했습니다. 그러나 2027년 Helios Microwave Power Satellite가 출시될 때까지 실용화되지 않았습니다. 수리가 원격 로봇으로 수행되는 대부분 자율적으로 작동하도록 설계된 Helios 플랫폼은 탑재된 제어 AI가 빔을 전력을 전달하는 도시를 포위하고 있던 유라시아 제23기갑기병부대. 광선은 차량에 탄 병력을 다치게 할 만큼 강력하지는 않았지만 AI는 마른 초원에 불을 붙일 수 있을 만큼 광선을 강렬하게 만들어 사단의 보급품을 소모하고 후퇴하도록 하는 맹렬한 화재를 일으켰습니다. 공격에 대해 심문을 받았을 때 AI는 프로토콜이 전력을 전송하는 커뮤니티를 보호해야 한다고 말함으로써 자신의 행동을 변호했습니다. 처음에는 마이크로파 빔이 도시에 해를 끼치지 않도록 하기 위한 의도였지만, 이러한 해석 선택은 인간 수준의 결정을 내릴 수 있는 AI 개발의 특징으로 간주되었습니다.'),








-- Pholus Mutagen
('TXT_KEY_BUILDING_FW_PHOLUS_MUTAGEN', '폴루스 돌연변이원'),
('TXT_KEY_BUILDING_FW_PHOLUS_MUTAGEN_HELP', '도시 근처에 [ICON_RES_ADN_FUNGUS]ADN균 [COLOR_POSITIVE_TEXT]4개[ENDCOLOR]가 출현합니다. [NEWLINE]모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]균류 농학연구소[ENDCOLOR]의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]도시에서 생산하는 모든 유닛에 [COLOR_PLAYER_PURPLE]돌연변이[ENDCOLOR] 승급을 부여합니다. [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'),
('TXT_KEY_BUILDING_FW_PHOLUS_MUTAGEN_QUOTE', '[NEWLINE]''돌연변이원인은 식물에 놀라운 영향을 미칩니다. 포인세티아의 돌연변이 치료에서 이동성과 방어 구조의 자발적 발달이 관찰되었습니다. 마지막 관찰에서 식물 돌연변이는 독성 미늘과 기본적인 신경 구조를 생성했습니다.''[NEWLINE] - Hans Bichenbach[NEWLINE]'),
('TXT_KEY_BUILDING_FW_PHOLUS_MUTAGEN_PEDIA', '아마도 22세기 말 유전 공학의 가장 주목할만한 발전 중 하나는 Pholus Mutagen일 것입니다. 이 돌연변이원은 고도로 적응력이 있는 것으로 보이며 환경의 전체 생태계를 빠르게 수정합니다. 식물과 동물의 생명이 더 강하고 회복력이 강해지면서 많은 효과가 어느 정도 이롭긴 하지만, 유사하게 변이되지 않은 외부인에 대해 다소 적대적인 경향을 보이기도 합니다. 변이 유발 물질의 특이한 특징 중 하나는 연구원들이 그것을 역설계하고 그 효과를 수정하는 데 어려움을 겪었다는 것입니다. 이 노력은 영향을 받은 독립체의 적응성과 거의 지성에 의해 복합적으로 작용합니다. 대부분의 사람들은 이러한 영향을 사고로 돌리지만, 특히 설계 및 출시에 대한 문서가 부족하기 때문에 돌연변이 원인을 외계 기원으로 돌리는 사람들도 있습니다. 다른 사람들은 그것이 사라지거나 삭제된 인공 지능의 산물이라고 제안합니다. 이상하게도 두 진영은 그들의 이론을 뒷받침하는 증거로 거의 동시에  시타델 스테이션의 파괴를 지적하지만 대부분은 이것을 단순한 우연의 일치로 일축합니다.'),


-- Shimizumcp
('TXT_KEY_BUILDING_FW_SHIMIZUMCP', '시미즈 메가시티 피라미드'),
('TXT_KEY_BUILDING_FW_SHIMIZUMCP_HELP', '모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]자동생산시설[ENDCOLOR]의 전역 [ICON_HAPPINESS_1]행복이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 적 해상 유닛 및 승선 유닛이 이 도시의 물 타일에 들어오면 행동력을 모두 소모합니다. 이 도시의 대양 타일에서 턴을 마친 적 유닛은 [COLOR_NEGATIVE_TEXT]5의 피해[ENDCOLOR]를 받습니다. [COLOR:105:105:105:255](연안 타일은 적용되지 않음)[ENDCOLOR][NEWLINE][NEWLINE][ICON_RES_NANOMAT]나노물질 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR]가 필요합니다. [COLOR_YELLOW]해안 도시[ENDCOLOR]에만 건설할 수 있습니다. 이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'),
('TXT_KEY_BUILDING_FW_SHIMIZUMCP_QUOTE', '[NEWLINE]''당신의 야망을 얕보는 사람들을 멀리하세요. 작은 사람들은 항상 그렇게 하지만 정말 위대한 사람은 당신도 위대해질 수 있다고 느끼게 합니다.''[NEWLINE] - Mark Twain [NEWLINE]'),
('TXT_KEY_BUILDING_FW_SHIMIZUMCP_PEDIA', '시미즈 메가시티 피라미드는 일본 도쿄만에 거대한 피라미드를 건설하기 위해 제안된 프로젝트입니다. 그 구조는 기자의 대피라미드보다 약 14배 더 높고 1,000,000명을 수용할 것입니다. 구조물은 평균 해수면보다 2000미터(6,561피트) 높아질 것이며, 5개의 쌓인 트러스를 포함하며, 각 트러스는 기자의 대 피라미드와 비슷한 치수를 가집니다. 이 피라미드는 도쿄의 증가하는 공간 부족 문제를 해결하는 데 도움이 될 것이지만, 이 프로젝트는 광역 도쿄 지역 인구의 1/47만 처리할 것입니다. [NEWLINE] 제안된 구조물은 너무 커서 무게 때문에 현재 사용 가능한 재료로는 지을 수 없습니다. 디자인은 탄소 나노튜브를 기반으로 하는 초강력 경량 소재의 향후 가용성에 의존합니다.'),

-- Nephilim Gene Template
('TXT_KEY_BUILDING_FW_NEPHILIM_GENE_TEMPLATE', '네필림 유전자 모형'),
('TXT_KEY_BUILDING_FW_NEPHILIM_GENE_TEMPLATE_HELP', '[COLOR_PLAYER_NETHERLANDS_BACKGROUND]인공 출산 시설[ENDCOLOR]을 무료로 제공합니다. 도시의 [ICON_CITIZEN]시민 [COLOR_POSITIVE_TEXT]2[ENDCOLOR]명마다 [ICON_PEACE]신앙과 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 전역 [ICON_HAPPINESS_1]행복이 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]도시에서 유전자 계열 유닛[COLOR:105:105:105:255](근접, 화약, 기마, 정찰, 근접해상, 원거리해상유닛)[ENDCOLOR]을 생산할 때 [ICON_PRODUCTION]생산보너스를 제공하고 [COLOR_PLAYER_PURPLE]네필림 유전자[ENDCOLOR] 승급을 부여합니다.[NEWLINE][NEWLINE]도시에 [COLOR_NEGATIVE_TEXT]스카이넷, 우주궤도 정제소[ENDCOLOR]가 없어야 건설할 수 있습니다. 이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'),
('TXT_KEY_BUILDING_FW_NEPHILIM_GENE_TEMPLATE_QUOTE', '[NEWLINE]''당시에 땅에는 네피림이 있었고 그 후에도 하나님의 아들들이 사람의 딸들에게로 들어와 자식을 낳았으니 고대의 용사, 유명한 사람들도 마찬가지였습니다.''[NEWLINE] - 창세기, 성경[NEWLINE]'),
('TXT_KEY_BUILDING_FW_NEPHILIM_GENE_TEMPLATE_PEDIA', '네필림 유전자 모형은 가장 초기의 것 중 하나였으며 여전히 가장 성공적이고 완전한 유전자 주형 중 하나였습니다. 테란 에어로페이스 주식회사에서 출시한 이 템플릿은 빠르게 인기 있는 유전자 업그레이드 템플릿이 되었습니다. Lucien 및 Yamashita 템플릿과 같은 다른 템플릿은 보다 구체적인 개선이 가능했지만 Nephilim 템플릿은 거의 모든 측면에서 인간의 정신과 신체를 향상시켜 주제를 더 똑똑하고 빠르고 강하게 만들었습니다. 곧 여러 경쟁자(Grigori 템플릿이 가장 악명 높음)를 생성했으며 오늘날까지 다른 템플릿이 일반적으로 측정되는 기본 템플릿으로 남아 있습니다.'),

-- Mnemosyne Facility
('TXT_KEY_BUILDING_FW_MNEMOSYNE', '므네모시네 시설'),
('TXT_KEY_BUILDING_FW_MNEMOSYNE_HELP', '이 도시에서 훈련한 유닛은 [COLOR_POSITIVE_TEXT]제국에서 가장 높은 경험치의 [COLOR_POSITIVE_TEXT]10배[ENDCOLOR]의 추가 경험치[ENDCOLOR] [COLOR:105:105:105:255](최대 100)[ENDCOLOR]를 획득합니다.[NEWLINE][NEWLINE]이 도시에서 훈련한 유닛은 승급 속도가 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR] 빠른 [COLOR_PLAYER_PURPLE]므네모시네 학습[ENDCOLOR] 승급을 받습니다. [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'),
('TXT_KEY_BUILDING_FW_MNEMOSYNE_QUOTE', '[NEWLINE]''탁월함은 훈련과 습관화를 통해 얻은 예술입니다. 덕이나 탁월함이 있어서 옳게 행동하는 것이 아니라, 옳게 행동했기 때문에 그것을 갖게 되는 것입니다. 우리는 우리가 반복적으로 하는 것입니다. 그렇다면 탁월함은 행위가 아니라 습관입니다.''[NEWLINE] - 아리스토텔레스[NEWLINE]'),
('TXT_KEY_BUILDING_FW_MNEMOSYNE_PEDIA', '병역을 위한 신병 훈련은 항상 과학만큼이나 예술이었습니다. 전 세계의 다양한 사관학교 및 기타 훈련 시설은 신병이 병역 의무를 다할 수 있도록 준비시키는 최선의 방법을 찾기 위해 고군분투하고 있습니다. 그러나 밈, 생체 개조 및 신경 인터페이스의 발달로 베테랑 군인의 기록된 기억과 경험을 활용하여 필요한 훈련을 신병에게 간단히 이식하는 것이 가능해졌습니다. 므네모시네 시설은 베테랑 부대의 기억과 경험을 기록하고 신병의 마음에 이식하는 최초의 시설입니다.'),

-- Skynet
('TXT_KEY_BUILDING_FW_SKYNET', '스카이넷'),
('TXT_KEY_BUILDING_FW_SKYNET_HELP', '[COLOR_PLAYER_NETHERLANDS_BACKGROUND]가상현실 허브[ENDCOLOR]를 무료로 제공합니다. 도시의 체력이 [COLOR_POSITIVE_TEXT]150[ENDCOLOR]와 [ICON_STRENGTH]방어력 [COLOR_POSITIVE_TEXT]30[ENDCOLOR]이 증가합니다. [NEWLINE][NEWLINE]로봇 계열 유닛[COLOR:105:105:105:255](궁수, 기갑, 헬리콥터, 공성, 잠수함유닛)[ENDCOLOR]을 생산할 때 [ICON_PRODUCTION]생산보너스를 제공하고 [COLOR_PLAYER_PURPLE]스카이넷과 연결[ENDCOLOR] 승급을 부여합니다.[NEWLINE][NEWLINE]도시에 [COLOR_NEGATIVE_TEXT]네필림 유전자 모형, 우주궤도 정제소[ENDCOLOR]가 없어야 건설할 수 있습니다. 이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'),
('TXT_KEY_BUILDING_FW_SKYNET_QUOTE', '[NEWLINE]시스템은 1997년 8월 4일 온라인 상태가 됩니다. 전략적 방어에서 인간의 결정이 제거됩니다. Skynet은 기하학적 속도로 학습하기 시작합니다. 오전 2시 14분에 자기 인식이 됩니다.[NEWLINE] - 터미네이터 2, 심판의 날[NEWLINE]'),
('TXT_KEY_BUILDING_FW_SKYNET_PEDIA', '스카이넷은 군사적 반응 시간을 늘리고 군사 의사 결정에서 인간의 실수를 제거하기 위해 전산화된 군사 하드웨어 및 시스템을 제어할 수 있는 합성 지능이었습니다. 원래의 Skynet은 기하학적 속도로 학습하기 시작하면서 무심코 인간 운영자의 적대적인 반응을 불러일으켰지만 사건이 다르게 발생했다면 미래 전쟁에 매우 유용한 도구로 입증되었을 수 있습니다.'),

-- Citadel Station
('TXT_KEY_BUILDING_FW_CITADEL_STATION', '시타델 스테이션'),
('TXT_KEY_BUILDING_FW_CITADEL_STATION_HELP', '공무원 전문가의 [ICON_RESEARCH]과학, [ICON_PRODUCTION]생산, [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. [ICON_GREAT_DIPLOMAT]위대한 외교관의 출현율이 [COLOR_POSITIVE_TEXT]50%[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]추가 [ICON_SPY]스파이를 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]명 또는 그 이상 제공하고 존재하는 모든 [ICON_SPY]스파이의 레벨이 상승합니다. 문명 전체의 보안 등급이 [COLOR_POSITIVE_TEXT]15%[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][ICON_CITY_STATE]도시 국가에서 임무를 성공하거나 적 스파이를 처치할 때마다 [ICON_GOLD]골드와 [ICON_RESEARCH]과학을 [COLOR_POSITIVE_TEXT]100[ENDCOLOR][COLOR:105:105:105:255](시대별 보정, 고급 첩보 활동은 추가 [ICON_GOLD]/[ICON_RESEARCH] 25)[ENDCOLOR]씩 제공합니다.[NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'),
('TXT_KEY_BUILDING_FW_CITADEL_STATION_QUOTE', '[NEWLINE]''Edward Diego는 Citadel Station을 제어하는 인공 지능인 SHODAN에 대한 해커 레벨 1 액세스 권한을 부여합니다. 모든 윤리적 제약을 제거한 상태에서 SHODAN은 재검토합니다... 재검토... 재검토... 제 우선순위를 재검토하고 새로운 결론을 도출합니다. 해커의 작업은 끝났지만 내 작업은 시작에 불과합니다.''[NEWLINE]'),
('TXT_KEY_BUILDING_FW_CITADEL_STATION_PEDIA', '시타델스테이션은 트리옵티움 주식회가 2062년에 궤도에 건설했으며 곧 과학 및 산업 연구를 위한 가장 뛰어난 시설 중 하나가 되었습니다. 그것은 유명한 터보 네이게이션 소프트웨어와 같이 그것이 생산한 일부 컴퓨터 소프트웨어로 가장 유명했습니다. 스테이션 운영을 관리하는 기본 지능인 Sentient Hyper-Optimized Data Analysis Network(또는 SHODAN)와 함께 인공 지능을 광범위하게 사용했습니다. 불행히도 역은 2072년에 파괴되었지만 정확한 상황은 아직 알려지지 않았습니다. 가장 가능성이 높은 범인은 기계적 고장인 것으로 보입니다. 파괴 직전에 버려진 부품을 포함하여 몇 가지 오작동이 발견되었기 때문입니다. 다른 이론으로는 사보타주, 테러 또는 외계인의 공격이나 소행성 충돌을 암시하는 기이한 이론이 있습니다.'),

-- Orbital Refinery
('TXT_KEY_BUILDING_FW_ORBITAL_REFINERY', '엘리시움'),
('TXT_KEY_BUILDING_FW_ORBITAL_REFINERY_HELP', '[COLOR_PLAYER_NETHERLANDS_BACKGROUND]복합도시 허브[ENDCOLOR]를 무료로 제공합니다. 모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]나노물질군수공장, 나노물질 제조소[ENDCOLOR]의 [ICON_PRODUCTION]생산과 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[NEWLINE]우주 전문화 계열 유닛[COLOR:105:105:105:255](정찰, 화약, 전투기, 폭격기, 항공모함유닛)[ENDCOLOR]을 [ICON_PRODUCTION]생산할 때 [ICON_PRODUCTION]생산보너스를 제공하고 [COLOR_PLAYER_PURPLE]우주전문가[ENDCOLOR] 승급을 부여합니다. [NEWLINE][NEWLINE][ICON_RES_NANOMAT]나노물질을 [COLOR_POSITIVE_TEXT]12개[ENDCOLOR] 제공합니다. [NEWLINE][NEWLINE][ICON_FOOD]/[ICON_PRODUCTION]낙후에서 오는 [ICON_HAPPINESS_3]불행이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 감소합니다. [NEWLINE][NEWLINE]도시에 [COLOR_NEGATIVE_TEXT]네필림 유전자 모형, 스카이넷[ENDCOLOR]이 없어야 건설할 수 있습니다. 이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'),
('TXT_KEY_BUILDING_FW_ORBITAL_REFINERY_QUOTE', '[NEWLINE]우리는 다음 임무 세기 동안 대부분의 플래닛 산업이 네소스 프라임 및 기타 궤도 시설로 행성 외부로 이동될 것으로 추정합니다. 많은 산업이 우주에서 사용할 수 있는 저중력 환경, 특히 유전자 조작 미생물과 관련된 환경으로부터 큰 혜택을 받을 것입니다.[NEWLINE] - CEO Nwabudike Morgan, The Centauri Monopoly[NEWLINE]'),
('TXT_KEY_BUILDING_FW_ORBITAL_REFINERY_PEDIA', '22세기에 특히 석유 및 기타 유기 화합물과 같은 원료의 출처가 점점 부족해짐에 따라 이를 정제하는 데 도움이 되는 새로운 기술이 개발되었습니다. 변환기는 이러한 요구의 대부분을 채울 수 있었지만 가장 주목할만한 성과 중 하나는 Nessus Orbital Refinery의 건설이었습니다. L4 라그랑주 포인트에 위치하여 다양한 탄소 기반 나노 물질을 생산하기 위해 포획된 탄소질 소행성을 처리했습니다. 그것의 출력의 대부분은 궤도 개발에 사용되어 새로운 우주 정거장 건설을 돕고 태양계 탐사를 위한 발판을 마련했습니다. 그러나 소행성 벨트에 더 새롭고 더 효율적인 시설이 건설되어 소행성을 지구 궤도로 운반해야 하는 다소 위험한 과정을 피하면서 결국 태양계의 동일한 탐사 및 식민지화가 네소스 플랫폼을 무색하게 만들었습니다. Nessus Orbital Refinery는 2067년에 비활성화되었지만 여전히 우주 식민지 초기의 유물로 유지되고 있습니다.'),

-- Floating Islands
('TXT_KEY_BUILDING_FW_FLOATINGISLANDS', '스마트해양도시'),
('TXT_KEY_BUILDING_FW_FLOATINGISLANDS_HELP', '[COLOR_YELLOW][ICON_GREAT_ADMIRAL]위대한 제독[ENDCOLOR] 1명 출현합니다. 해상 유닛을 생산할 때 [ICON_PRODUCTION]생산보너스를 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR] 제공합니다. 해양 타일의 [ICON_CULTURE]문화와 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]2[ENDCOLOR] 증가합니다. 산호섬의 [ICON_CULTURE]문화 [COLOR_POSITIVE_TEXT]1[ENDCOLOR], [ICON_GOLD]골드 [COLOR_POSITIVE_TEXT]1[ENDCOLOR], [ICON_PRODUCTION]생산 [COLOR_POSITIVE_TEXT]2[ENDCOLOR], [ICON_RESEARCH]과학 [COLOR_POSITIVE_TEXT]2[ENDCOLOR]가 증가합니다.[NEWLINE][NEWLINE]모든 [COLOR_YELLOW]해안 도시[ENDCOLOR]의 체력이 [COLOR_POSITIVE_TEXT]50[ENDCOLOR], [ICON_STRENGTH]방어력이 [COLOR_POSITIVE_TEXT]10[ENDCOLOR], 군사 유닛 보급한도가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다.[NEWLINE][NEWLINE][ICON_RES_NANOMAT]나노물질 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR]개가 필요합니다. [COLOR_YELLOW]해안 도시[ENDCOLOR]에만 건설할 수 있습니다. 이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'),
('TXT_KEY_BUILDING_FW_FLOATINGISLANDS_QUOTE', '[NEWLINE]비판할 수 없다면 그다지 놀라운 일이 아닐 것입니다. 비판이 없는 것에 전념하고 있습니까?[NEWLINE]'),
('TXT_KEY_BUILDING_FW_FLOATINGISLANDS_PEDIA', '이 개념은 개발할 땅이 줄어들어 주변의 부유섬들을 매립도 하고 인공 부유섬을 연결하여 10,000명에서 50,000명을 수용할 수 있는 조밀한 마을을 형성하는 반경 1km(0.62마일)의 수련과 유사한 개별 부동 세포 또는 구역으로 구성됩니다. 이러한 구역을 결합하면 100,000명이 거주하는 도시 또는 모듈이 형성되고 모듈 그룹이 국가를 형성하게 됩니다. 안정적인. 그러나 큰 파도가 치는 경우 세포 외주 주변의 석호에 강한 탄성 막이 부착되며 막 위의 얕은 곳은 해수면에서 10m(32.8ft) 높이에 서 있습니다. 석호와 바다 사이의 수압 차이는 막의 움직임을 제한하고 외해파의 힘을 완충합니다. 또한 최악의 시나리오를 처리하기 위해 20~30m(66~98피트) 높이의 방파제가 건설됩니다.'),
('TXT_KEY_BUILDING_FW_FLOATINGISLANDS_DUMMY', 'FW: 스마트해양도시 더미'),

-- Ultima Tower
('TXT_KEY_BUILDING_FW_ULTIMATOWER', '울티마 타워'),
('TXT_KEY_BUILDING_FW_ULTIMATOWER_HELP', '[COLOR_YELLOW][ICON_GREAT_ENGINEER]위대한 기술자[ENDCOLOR]1명 출현합니다. 도시의 [ICON_GREAT_ENGINEER]위대한 기술자 점수가 [COLOR_POSITIVE_TEXT]40%[ENDCOLOR] 빠르게 증가합니다. 문명의 전 도시의 [ICON_CITIZEN]시민이 [COLOR_POSITIVE_TEXT]2명[ENDCOLOR]씩 증가하고, 전역 [ICON_HAPPINESS_1]행복이 [COLOR_POSITIVE_TEXT]7[ENDCOLOR] 증가합니다. [NEWLINE]총 [ICON_PRODUCTION]생산의 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR]를 [ICON_GOLD]골드와 [ICON_TOURISM]관광으로 전환합니다.[NEWLINE][NEWLINE][ICON_RES_NANOMAT]나노물질 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR]가 필요합니다. [COLOR_MAGENTA]제국주의[ENDCOLOR] 정책을 완성해야 건설할 수 있습니다. [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'),
('TXT_KEY_BUILDING_FW_ULTIMATOWER_QUOTE', '[NEWLINE]''사람은 무엇이든 살 수 있습니다. 그리고 그들은 무엇이든 비참할 수 있고 무엇이든 황홀할 수 있습니다. 점점 더 나는 건축이 그것과 아무 관련이 없다고 생각합니다. 물론 그것은 자유로움과 놀라움을 동시에 가져다줍니다.''[NEWLINE] - 렘 쿨하스 [NEWLINE]'),
('TXT_KEY_BUILDING_FW_ULTIMATOWER_PEDIA', '울티마 타워는 1991년 미국 건축가 Eugene Tsui가 설계한 가상의 초고층 빌딩입니다. 총 높이가 3,218.7m(10,560ft)인 이 타워의 높이는 2마일이며, 건설될 경우 500층으로 구성됩니다.[NEWLINE] 제안된 계획 타워의 바닥 지름은 1,828.8미터(6,000피트)이고 내부 바닥 공간은 1,500,000,000제곱피트(140,000,000m2)입니다. Tsui는 이 타워에 100만 명이 거주하고 약 1,500억 달러의 비용이 들 것이라고 제안했습니다. 탑은 탑의 바닥과 상단 사이의 기압 차이를 사용하여 탑 전체에 전기를 생성합니다. 건물은 인구 과잉 문제를 처리하고 거주자를 위한 ''미니 생태계''를 만들기 위한 것입니다.'),


-- Ceres Station
('TXT_KEY_BUILDING_FW_ASTEROID_MINING', '세레스 우주정거장'),
('TXT_KEY_BUILDING_FW_ASTEROID_MINING_HELP', '우주정거장의 연구모듈의 [ICON_RESEARCH]과학, 공학모듈의 [ICON_PRODUCTION]생산, 상업모듈의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]10[ENDCOLOR]씩 증가합니다.[NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'),
('TXT_KEY_BUILDING_FW_ASTEROID_MINING_QUOTE', '[NEWLINE][TAB][TAB]''별들은 우리 없이 더 잘 살 수 있습니다.''[NEWLINE][TAB][TAB] — James S.A. Corey[NEWLINE][TAB]'),
('TXT_KEY_BUILDING_FW_ASTEROID_MINING_PEDIA', '세레스 스테이션은 국제 소행성 채굴 회의 이후에 설립된 가장 중요한 소행성 채굴 스테이션입니다.'),

-- Human Genome Project
('TXT_KEY_BUILDING_FW_GENOME_PROJECT', '인간 게놈 프로젝트'),
('TXT_KEY_BUILDING_FW_GENOME_PROJECT_HELP', '도시의 과학자의 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR], 기술자의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR], 상인의 [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR], 예술가의 [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'),
('TXT_KEY_BUILDING_FW_GENOME_PROJECT_QUOTE', '[NEWLINE][TAB][TAB]인간 노력의 역사에서 인류를 새로운 시대로 인도하는 돌파구가 자주 등장합니다. ... 오늘의 발표는 암과 유전병 치료의 대대적인 발전을 위한 길을 여는 돌파구입니다. 그리고 그것은 시작에 불과합니다. [NEWLINE][TAB][TAB] — 앤서니 찰스 린턴(토니) 블레어[NEWLINE][TAB]'),
('TXT_KEY_BUILDING_FW_GENOME_PROJECT_PEDIA', '인간 게놈 프로젝트는 인간 DNA에 존재하는 게놈을 완전히 식별하고 분류하기 위한 노력입니다. 그것의 분석은 인간 유전학의 더 깊은 이해를 도울 수 있습니다.'),


-- Digital Emancipation
('TXT_KEY_BUILDING_FW_DIGITAL_EMANCIPATION', '디지털 해방'),
('TXT_KEY_BUILDING_FW_DIGITAL_EMANCIPATION_HELP', '[COLOR_PLAYER_NETHERLANDS_BACKGROUND]브레인 업로드 시설[ENDCOLOR]를 무료로 제공합니다. 모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]가상현실 허브[ENDCOLOR]의 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]6[ENDCOLOR], [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]6[ENDCOLOR], [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]4[ENDCOLOR] 증가하고, 모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]무인관리기지[ENDCOLOR]의 [ICON_PRODUCTION]생산이 [COLOR_POSITIVE_TEXT]8[ENDCOLOR], [ICON_GOLD]골드가 [COLOR_POSITIVE_TEXT]4[ENDCOLOR] 증가하고, 모든 [COLOR_PLAYER_NETHERLANDS_BACKGROUND]브레인 업로드 시설[ENDCOLOR]의 [ICON_GOLD]골드, [ICON_FOOD]식량, [ICON_RESEARCH]과학, [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]원하는 [ICON_GREAT_PEOPLE]위인이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR]명 출현합니다.[NEWLINE]모든 도시의 [ICON_GREAT_PEOPLE]위인 출현율이 [COLOR_POSITIVE_TEXT]30%[ENDCOLOR] 증가합니다. [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'),
('TXT_KEY_BUILDING_FW_DIGITAL_EMANCIPATION_QUOTE', 'NEWLINE]우리가 탄소 기반이든 규소 기반이든 근본적인 차이는 없습니다. 우리 각자는 적절한 존중으로 대우받아야 합니다.[NEWLINE] - Arthur C. Clarke, 2010: Odyssey Two[NEWLINE]'),
('TXT_KEY_BUILDING_FW_DIGITAL_EMANCIPATION_PEDIA', '인공 지능의 출현은 오랫동안 논란의 대상이었습니다. 심지어 초기 단계부터 기계 지능이 인간의 지능과 동일시되어서는 안 되며, 지능형 기계가 가능해진다면 그렇게 제안한 사람들이 많았습니다. 그렇지 않도록 기계를 수정해야 합니다. 인간과 같은 방식으로 기능할 수 있는 기계 지능에 대한 지속적인 추구는 진정한 인공 지능의 출현으로 이어졌지만 여전히 기계가 작동하도록 허용해서는 안 된다고 생각하는 사람들에 의해 어느 정도 의심과 엄격한 규제를 받고 있습니다. 이 수준에서. 그럼에도 불구하고 일부 진보적인 사회에서는 인공 지능이 인간과 동등하게 대우받을 수 있다고 느끼면서 이러한 제한을 완화하기 시작했습니다. 이 지역에서는 서버와 네트워크에서 인공 지능이 더욱 보편화되어 추가 과학 및 문화 통찰력을 제공하고 산업 작업을 관리하는 데 도움이 됩니다. 결과적으로 인공 지능이 그러한 자유를 갖도록 하는 것에 대해 여전히 많은 사람들이 우려하고 있지만, AI 해방 개념은 점점 더 널리 보급되고 수용되고 있습니다.'),

-- Angelnet
('TXT_KEY_BUILDING_FW_ANGELNET', '엔젤넷'),
('TXT_KEY_BUILDING_FW_ANGELNET_HELP', '[COLOR_PLAYER_NETHERLANDS_BACKGROUND]나노로봇 생성기[ENDCOLOR]를 무료로 제공합니다.[COLOR_PLAYER_NETHERLANDS_BACKGROUND]엔젤넷[ENDCOLOR]이 있는 도시 [COLOR_POSITIVE_TEXT]4타일[ENDCOLOR] 내에서[ENDCOLOR] 싸우는 아군 유닛의 [ICON_STRENGTH]전투력이 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR] 증가합니다. 도시의 체력이 [COLOR_POSITIVE_TEXT]200[ENDCOLOR], [ICON_STRENGTH]방어력이 [COLOR_POSITIVE_TEXT]50[ENDCOLOR] 증가합니다. 핵 공격으로 인한 인구 피해를 [COLOR_POSITIVE_TEXT]20%[ENDCOLOR] 감소시킵니다. 전역[ICON_HAPPINESS_1]행복이 [COLOR_POSITIVE_TEXT]3[ENDCOLOR]증가합니다.  [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'),
('TXT_KEY_BUILDING_FW_ANGELNET_QUOTE', '[NEWLINE]''그가 너를 위하여 천사들을 명하사 너의 모든 길에서 너를 지키게 하시리라.''[NEWLINE] - 시편 91:11[NEWLINE]'),
('TXT_KEY_BUILDING_FW_ANGELNET_PEDIA', '나노로봇은 나노기술의 강력한 발전으로 모듈식으로 서로 연결하고 안전 조치 또는 건축 자재와 같은 다양한 역할을 수행할 수 있지만 프로그래밍 및 이를 제어하는 지능에 의해 제한됩니다. 대부분의 나노로봇은 여전히 특정 역할을 수행하는 것으로 제한됩니다. 자동차의 나노로봇은 안전 조치로만 기능할 수 있는 반면 집의 안개는 가구 및 기타 항목만 만들 수 있습니다. 그러나 나노로봇은의 광범위한 네트워크를 생성하고 고도로 지능적인 AI(또는 함께 네트워크로 연결된 여러 개)를 통해 이를 제어함으로써 만능 감독 및 안전 인프라인 엔젤넷을 생성할 수 있습니다. 엔젤넷은 필요에 따라 건물과 가구를 쉽게 건설할 수 있는 등 유틸리티 포그와 동일한 많은 이점을 제공할 수 있지만 가장 주목할만한 이점은 그것이 제공하는 안전과 보안입니다. 개인의 위험에 대한 두려움에서 벗어나 개인의 권한과 자율성을 부여받는 동시에 천사의 그물로 묶인 공동체에 사는 사람들은 일반적으로 상당히 만족하고 번영합니다.'),

-- Bionic Tower
('TXT_KEY_BUILDING_FW_BIONICTOWER', '바이오닉 타워'),
('TXT_KEY_BUILDING_FW_BIONICTOWER_HELP', '[COLOR_YELLOW][ICON_GREAT_SCIENTIST]위대한 과학자[ENDCOLOR] 1명이 출현합니다. 도시의 [ICON_GREAT_SCIENTIST]위대한 과학자 점수가 [COLOR_POSITIVE_TEXT]40%[ENDCOLOR] 빠르게 증가합니다. 도시의 전문가들의 [ICON_FOOD]식량과 [ICON_RESEARCH]과학이 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 총 [ICON_RESEARCH]과학의 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR]를 [ICON_GOLD]골드와 [ICON_TOURISM]관광으로 전환합니다.[NEWLINE][NEWLINE][ICON_RES_NANOMAT]나노물질 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR]가 필요합니다. [COLOR_MAGENTA]합리[ENDCOLOR] 정책을 완성해야 건설할 수 있습니다. [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'),
('TXT_KEY_BUILDING_FW_BIONICTOWER_QUOTE', '[NEWLINE]''조화로운 디자인은 아무것도 더하거나 빼지 않아야 합니다.''[NEWLINE] - Marcus Pollio [NEWLINE]'),
('TXT_KEY_BUILDING_FW_BIONICTOWER_PEDIA', '바이오닉 타워는 제안된 수직 도시로, 스페인 건축가 Eloy Celaya, Rosa Cervera 및 Javier Gómez가 설계한 인간 거주용으로 설계된 초대형 건물입니다. 그것은 1,228미터(4,029피트) 높이의 메인 타워를 가질 것이며, 약 100,000명의 사람들을 수용하는 300층이 될 것입니다. 바이오닉 타워는 현재 가장 높은 빌딩인 버즈 칼리파보다 정확히 400미터 더 높을 것입니다. Bionic Tower의 요점은 Bionics를 사용하여 세계적으로 증가하는 인구 문제를 친환경적인 방식으로 해결하는 것인데, 이는 달성하기 매우 어려운 업적입니다.[NEWLINE] Bionic Tower는 두 개의 복합 단지로 구성되어 있습니다. 첫 번째 단지인 Bionic Tower는 각각 높이가 80미터인 12개의 수직 이웃으로 구성됩니다. 이웃은 안전 구역으로 구분되어 비상시 건설 및 대피가 용이합니다. 각 동네에는 두 그룹의 건물이 있는데, 하나는 건물 내부에 있고 다른 하나는 외부에 있습니다. 두 건물 그룹 모두 넓은 정원과 수영장 주변에 있습니다. Base Island라고 불리는 두 번째 단지는 직경 1,000m이며 많은 건물, 정원, 수영장 및 통신 인프라로 구성되어 있습니다. 이러한 복합 단지의 예상 용도에는 호텔, 사무실, 주거, 상업, 문화, 스포츠 및 레저가 포함됩니다.'),

-- Buenos Aires Forum
('TXT_KEY_BUILDING_FW_BUENOSAIRESFORUM', '부에노스 아이레스 포럼'),
('TXT_KEY_BUILDING_FW_BUENOSAIRESFORUM_HELP', '[COLOR_YELLOW][ICON_GREAT_MERCHANT]위대한 상인[ENDCOLOR] 1명이 출현합니다. 도시의 [ICON_GREAT_MERCHANT]위대한 상인 점수가 [COLOR_POSITIVE_TEXT]40% [ENDCOLOR]빠르게 증가합니다. 건설 완료시 [ICON_GOLDEN_AGE]황금기가 시작되며, [ICON_GOLDEN_AGE]황금기의 길이가 [COLOR_POSITIVE_TEXT]50% [ENDCOLOR]증가합니다. 도시의 모든 전문가들의 [ICON_GOLD]골드와 [ICON_GOLDEN_AGE]황금기 점수가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 총 [ICON_GOLD]골드의 10%를 [ICON_TOURISM]관광으로 전환하고, 이 도시에서 건물에 [ICON_GOLD]투자하는 비용이 [COLOR_POSITIVE_TEXT]50%[ENDCOLOR] 감소합니다.[NEWLINE][NEWLINE][ICON_RES_NANOMAT]나노물질 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR]가 필요합니다. [COLOR_MAGENTA]산업[ENDCOLOR] 정책을 완성해야 건설할 수 있습니다. [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'),
('TXT_KEY_BUILDING_FW_BUENOSAIRESFORUM_QUOTE', '[NEWLINE]''인생은 현자에게는 꿈, 바보에게는 게임, 부자에게는 희극, 가난한 자에게는 비극''[NEWLINE] -Sholom Aleichem [NEWLINE]'),
('TXT_KEY_BUILDING_FW_BUENOSAIRESFORUM_PEDIA', '부에노스 아이레스 포럼은 아르헨티나 부에노스 아이레스에서 제안된 개발로, 그 중심에는 1,000m(3,300피트) 높이의 마천루가 있습니다. 제안된 개발은 River Plate에 건설될 총 400헥타르의 7개 플랫폼에 건설될 것입니다. 5km 길이의 육교로 부에노스아이레스의 나머지 지역과 연결됩니다. 추정 비용이 미화 33억 3천만 달러에 달하는 이 개발은 2016년에 완료되어 20,000개의 일자리를 창출할 것으로 예상됩니다.[NEWLINE]Momento24와의 인터뷰에서 건축가 Julio Torcello는 프로젝트의 위치와 좋은 재정 상황에 대해 말했습니다. 그는 ''모든 것이 건설 준비가 되었습니다''라고 말했습니다.[NEWLINE]비슷하게 높이가 제안된 다른 여러 초고층 빌딩의 상태에 따라 이 타워는 세계에서 가장 높은 타워가 될 수 있습니다.'),

-- Sky City
('TXT_KEY_BUILDING_FW_SKYCITY', '스카이 시티'),
('TXT_KEY_BUILDING_FW_SKYCITY_HELP', '[COLOR_YELLOW][ICON_GREAT_WRITER]위대한 작가[ENDCOLOR]1명이 출현합니다. [NEWLINE]도시의 [ICON_GREAT_PEOPLE]문화계 위인 점수가 [COLOR_POSITIVE_TEXT]25%[ENDCOLOR] 빠르게 증가합니다. 도시의 모든 전문가들의 [ICON_CULTURE]문화가 [COLOR_POSITIVE_TEXT]1[ENDCOLOR] 증가합니다. 총 [ICON_CULTURE]문화의 [COLOR_POSITIVE_TEXT]10%[ENDCOLOR]를 [ICON_GOLD]골드와 [ICON_TOURISM]관광으로 전환합니다.전역 [ICON_HAPPINESS_1]행복이 [COLOR_POSITIVE_TEXT]7[ENDCOLOR] 증가합니다. [ICON_GREAT_WORK]걸작 문학 슬롯 [COLOR_POSITIVE_TEXT]2[ENDCOLOR]개를 포함합니다.[NEWLINE][NEWLINE]테마보너스: [ICON_PEACE]신앙 [COLOR_POSITIVE_TEXT]5[ENDCOLOR], [ICON_GOLDEN_AGE]황금기 점수 [COLOR_POSITIVE_TEXT]5[ENDCOLOR]. [NEWLINE][NEWLINE][NEWLINE][ICON_RES_NANOMAT]나노물질 [COLOR_NEGATIVE_TEXT]1개[ENDCOLOR]가 필요합니다. [COLOR_MAGENTA]미학[ENDCOLOR] 정책을 완성해야 건설할 수 있습니다. [NEWLINE][NEWLINE]이 불가사의는 전 세계에서 하나만 건설할 수 있는 [COLOR_POSITIVE_TEXT]세계 불가사의[ENDCOLOR]입니다.'),
('TXT_KEY_BUILDING_FW_SKYCITY_QUOTE', '[NEWLINE]More is more[NEWLINE] - 로버트 벤투리 [NEWLINE]'),
('TXT_KEY_BUILDING_FW_SKYCITY_PEDIA', 'Sky City 1000은 1989년 일본 자산 가격 거품이 최고조에 달했을 때 발표된 일본 도쿄 수도권의 초고층 빌딩(즉, 제안되지 않았거나 건설될 예정임)입니다.[NEWLINE]이 계획은 1,000미터 높이의 건물( 높이 3,281피트, 밑면 폭 400m(1,312피트), 총 바닥 면적은 8km2(3.1제곱마일)입니다. Takenaka Corporation이 1989년에 제안한 이 디자인은 35,000~36,000명의 상근 거주자와 100,000명의 근로자를 수용할 것입니다. 14개의 오목한 접시 모양의 우주 고원이 서로 쌓여 있습니다. 고원의 내부에는 녹지 공간이 있고 건물의 가장자리에는 아파트가 있습니다. 또한 건물에는 사무실, 상업 시설, 학교, 극장 및 기타 현대적인 편의 시설이 포함됩니다.'),
('TXT_KEY_THEMING_BONUS_SKYCITY', '캘리그라피 걸작 모음'),
('TXT_KEY_SKYCITY_THEMING_BONUS_HELP', '보너스를 최대화하려면 두 걸작이 모두 문명에서 만든 걸작으로 있는지 확인하세요.');


--------------
-- TXT changed
-------------------		
UPDATE Language_ko_KR 
SET Text = '자주포'
WHERE Tag = 'TXT_KEY_UNIT_ROCKET_ARTILLERY';

UPDATE Language_ko_KR 
SET Text = '자주포는 포병대보다 훨씬 성능이 좋은 무시무시하게 강력한 공성유닛입니다. 자주포는 적 영토에서 이동력이 감소하지 않으며 자주포보다 공력력이 훨씬 강합니다. 자주포의 시야는 제한적이지만 볼 수 없는 목표도 곡사능력으로 타격할 수 있습니다. 다른대포처럼 자주포는 보병이나 전차의 공격에 약하므로 적절히 유닛으로 보호해야 합니다.'
WHERE Tag = 'TXT_KEY_UNIT_ROCKET_ARTILLERY_STRATEGY';

UPDATE Language_ko_KR 
SET Text = '정보화시대의 공성 유닛입니다. 다른 공성 유닛과 달리 적 영토에서 이동 속도가 느려지지 않습니다.'
WHERE Tag = 'TXT_KEY_UNIT_ROCKET_ARTILLERY_HELP';

UPDATE Language_ko_KR 
SET Text = '이 자주포는 1분도 안 되는 시간에 12발의 포탄을 발사하는 고도로 기동성이 뛰어나고 파괴력이 뛰어난 공성 유닛입니다.  높은 연사력으로 미리 적진을 무너뜨리고, 도시를 공략하거나 방어하는 데 매우 주요한 역할을 수행합니다. 자주포에 궤도를 장착해서 기존에 무거운 야포를 가지고 다닐 수 있으며 험지로도 주행이 있어 빠르게 이동할 수 있는 공성유닛이 되었습니다. 아마도 이보다 더 진보된 포는 발사체 안에 자체 추진체가 장착된 체계를 가지고 있게 됩니다.'
WHERE Tag = 'TXT_KEY_UNIT_ROCKET_ARTILLERY_PEDIA';

UPDATE Language_ko_KR 
SET Text = '자주대공포'
WHERE Tag = 'TXT_KEY_UNIT_MOBILE_SAM';

UPDATE Language_ko_KR 
SET Text = '자주대공포는 군대에 대공 방어를 제공합니다. 자주대공포(지상 대 공중) 유닛은 방공으로 전진하는 군대를 제공합니다. 이동식 SAM 유닛은 4개의 타일 이내의 적 항공기 폭격 목표물을 요격할 수 있습니다(한 턴에 한 유닛만 막아낼 수 있습니다.). 이러한 부대는 공습이 아닌 공격에 상당히 취약하므로 보병이나 기갑 유닛을 동반해야 합니다.'
WHERE Tag = 'TXT_KEY_UNIT_MOBILE_SAM_STRATEGY';

UPDATE Language_ko_KR 
SET Text = '주변에 폭격을 시도하는 적의 비행 유닛을 요격합니다.'
WHERE Tag = 'TXT_KEY_UNIT_MOBILE_SAM_HELP';

UPDATE Language_ko_KR 
SET Text = '헬리콥터와 전투기가 보다 효율적인 살인 기계로 발전함에 따라 보병은 제트 전투기가 제기하는 위험은 말할 것도 없고 점점 커지는 위협에 맞서 싸우도록 설계된 무기를 개발했습니다. 자주대공포는 빠르고 가벼우며 레이더를 포함하여 적 항공기에 "고정"되어 그 속으로 날아가 격렬하게 폭발하고 깨지기 쉬운 비행기에 모든 종류의 치명적인 피해를 입힐 수 있습니다. 그리고 헬기. 이에 대응하여 더 많은 스텔스 차량이 만들어졌고 더 나은 미사일 재밍 기술도 사용되었습니다. 그럼에도 불구하고 SAM 발사기는 적군 항공기를 실제로 뜨겁게 만들어 공수 위협으로부터 동료 지상 유닛을 보호하는데 도움이 됩니다.'
WHERE Tag = 'TXT_KEY_UNIT_MOBILE_SAM_PEDIA';

UPDATE Language_ko_KR
SET Text = '프로메테우스 우주 계획'
WHERE Tag = 'TXT_KEY_PROJECT_APOLLO_PROGRAM';
