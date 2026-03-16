---UNIQUE UNITS----
UPDATE Language_ko_KR
SET Text = '{TXT_KEY_UNIT_FRENCH_MUSKETEER}은 프랑스 유닛으로 {TXT_KEY_UNIT_2HANDER}을 대체 합니다. 더욱 강력해졌으며, 더 빠르게 움직이고 통제 구역(ZOC)을 무시할 수 있는 다양한 승급이 있습니다.'
WHERE Tag = 'TXT_KEY_UNIT_FRENCH_MUSKETEER_STRATEGY';

UPDATE Language_ko_KR
SET Text = '{TXT_KEY_UNIT_FRENCH_MUSKETEER}은 프랑스 유닛으로 {TXT_KEY_UNIT_2HANDER}을 대체 합니다. 더욱 강력해졌으며, 더 빠르게 움직이고 통제 구역(ZOC)을 무시할 수 있는 다양한 승급이 있습니다.'
WHERE Tag = 'TXT_KEY_UNIT_FRENCH_MUSKETEER_STRATEGY';

UPDATE Language_ko_KR
SET Text = '도펠죌트너'
WHERE Tag = 'TXT_KEY_UNIT_GERMAN_LANDSKNECHT';

UPDATE Language_ko_KR
SET Text = '{TXT_KEY_UNIT_GERMAN_LANDSKNECHT}는 {TXT_KEY_UNIT_2HANDER}을 대체하는 독일의 고유 유닛입니다. 체력이 가득 찬 유닛에 대한 전투 보너스가 있으며, 승선한 유닛에 대한 보너스가 더 큽니다. 훈련이나 구매 비용이 약간 저렴하고, 구매하면 전체 경험치를 얻고 즉시 이동할 수 있습니다.[NEWLINE][NEWLINE]빠른 배치와 체력이 충분한 유닛에 대한 보너스를 활용해 전쟁의 첫 턴에서 적을 놀라게 하고 적의 전선을 빠르게 무너뜨리세요. 가격이 저렴하기 때문에 선물로도 좋습니다. 한 번에 여러 유닛을 구매하고, 근처 도시 국가로 가져가서 단기 및 장기적으로 영향력의 이점을 얻으세요.'
WHERE Tag = 'TXT_KEY_UNIT_GERMAN_LANDSKNECHT_STRATEGY';

UPDATE Language_ko_KR
SET Text = '도펠죌트너 또는 "2배 급료 병사"는 유럽 전쟁의 창총진 시대에 등장해 자원하여 최전선에서 싸우고 두 배의 급여를 받는 사람들을 말합니다. 부대의 약 4분의 1은 파이크병 앞에서 날개를 형성한 최전선 군인이었고, 파이크병은 석궁병 및/또는 화승총병을 방어했습니다. 도펠죌트너의 주된 무기는 가벼운 원거리 무기였지만, 적의 창과 그 휘두르는 자의 머리를 자르는 데 사용된 것은 거대한 양손검인 츠바이헨더였습니다!'
WHERE Tag = 'TXT_KEY_CIVILOPEDIA_UNITS_MEDIEVAL_LANDSKNECHT_TEXT';

----------------------------------------------------
-- 승급
----------------------------------------------------
-- impi
UPDATE Language_ko_KR
SET Text = '화약 유닛을 물리치는 데 탁월한 줄루족의 고유한 {TXT_KEY_UNIT_SPANISH_TERCIO}입니다. 투창 승급을 가지고 시작합니다. 또한, 엄폐 I도 가지고 시작합니다.'
WHERE Tag = 'TXT_KEY_UNIT_HELP_ZULU_IMPI';

UPDATE Language_ko_KR
SET Text = '투창'
WHERE Tag = 'TXT_KEY_PROMOTION_RANGED_SUPPORT_FIRE';

UPDATE Language_ko_KR
SET Text = '{TXT_KEY_UNIT_ZULU_IMPI}는 {TXT_KEY_UNIT_SPANISH_TERCIO}를 대체하는 줄루족의 고유 유닛입니다. {TXT_KEY_UNIT_PIKEMAN}보다 훨씬 더 튼튼하고 제작 비용도 더 많이 들지만, 동시대의 다른 유닛과 비교하면 눈에 띄게 비용이 적게 듭니다. 방패에는 엄폐 I이 부여되어 원거리 공격의 피해를 줄여주고, 근접 공격을 하기 전에는 창 던지기 공격을 하여 근접 전투가 시작되기 전에 방어측을 약화시킵니다. 또한 화약 유닛과 싸울 때 [ICON_STRENGTH] 전투력 보너스도 있어 산업 시대에도 치명적인 유닛입니다.'
WHERE Tag = 'TXT_KEY_UNIT_ZULU_IMPI_STRATEGY';

-- yellow brow
UPDATE Language_ko_KR
SET Text = Replace(Text, '대형 I', '대형 I 그리고 대형 II')
WHERE Tag = 'TXT_KEY_UNIT_SHOSHONE_YELLOW_BROW_HELP';

----------------------------------------------------
-- Text (ko_KR)
----------------------------------------------------
INSERT INTO Language_ko_KR (Tag, Text) VALUES
('TXT_KEY_UNIT_2HANDER', '양손 검병'),
('TXT_KEY_CIV5_2HANDER_TEXT', '르네상스의 양손검은 중세의 장검보다 더 길고 큰 괴물 같은 무기로, 자루는 1피트가 넘고 칼날은 길이가 거의 5피트에 달해 사람 키보다 키가 큽니다. 이러한 기법은 주로 16세기 초반에 사용되었습니다. 이 검은 14세기부터 시작된 점점 더 커지는 추세의 마지막 단계를 보여줍니다. 파이크 대형에 맞서 싸우고 파이크병의 머리를 자르는 데 사용할 수 있습니다.'),
('TXT_KEY_UNIT_2HANDER_STRATEGY', '양손 검병은 장검병보다 훨씬 강력하며, 대형 I 승급을 가지고 시작하는 근접 유닛에 대해 파괴적인 전투 보너스를 얻습니다.'), 
('TXT_KEY_UNIT_HELP_2HANDER', '초기 르네상스 시대의 근접 유닛입니다. 창병, {TXT_KEY_UNIT_PIKEMAN}, 자유 용병대, {TXT_KEY_UNIT_SPANISH_TERCIO}에 [COLOR_POSITIVE_TEXT]공격할 때[ENDCOLOR] 추가로 [ICON_STRENGTH] 힘이 +33% 증가합니다.');
----------------------------------------------------
-- Text (ko_KR)
----------------------------------------------------

INSERT INTO Language_ko_KR (Tag, Text) VALUES
('TXT_KEY_PROMOTION_2HANDER', '대검'),
('TXT_KEY_PROMOTION_2HANDER_HELP', '창병, {TXT_KEY_UNIT_PIKEMAN}, 자유 용병대, {TXT_KEY_UNIT_SPANISH_TERCIO} [COLOR_POSITIVE_TEXT]공격시[ENDCOLOR] 추가로 [ICON_STRENGTH] 힘 +33% 증가[NEWLINE][COLOR_NEGATIVE_TEXT]업그레이드시 없어집니다[ENDCOLOR].');

-- rename the Tercio
UPDATE Language_ko_KR
SET Text = '창총진'
WHERE Tag = 'TXT_KEY_UNIT_SPANISH_TERCIO';

UPDATE Language_ko_KR
SET Text = '철을 필요로 하지 않았던 이전 방어 유닛들처럼, 창총진은 최전선에서 든든한 기반을 제공합니다. 또한 [COLOR_POSITIVE_TEXT]파이크 전술[ENDCOLOR]을 사용할 수 있어 적에게 공격을 개시할 때 공격적으로 활용할 수 있습니다. 그러나 르네상스 시대에 강력한 양손 검병이 등장하면서 처음으로 직접적인 대항마가 탄생했습니다. 따라서 기마 유닛이 덜 위협적이기는 하지만, 단 하나의 실패 지점도 없는 효과적인 군대 구성을 설계하는 데 여전히 주의를 기울여야 합니다.'
WHERE Tag = 'TXT_KEY_CIV5_SPAIN_TERCIO_STRATEGY';

UPDATE Language_ko_KR
SET Text = '창총진은 15세기 후반과 16세기 초반에 처음 등장한 전술적 대형을 말하며, 17세기 후반에 총검이 개발될 때까지 사용되었습니다. 이러한 유형의 부대는 파이크로 무장한 군인과 화승총 그리고/또는 머스킷총으로 무장한 군인을 결합했습니다. 칼, 도끼, 석궁과 같은 다른 무기도 가끔 사용되었습니다. 이 대형은 원래 신성 로마 제국 보병대(란츠크네히트)와 스페인 보병대(테르시오)에 의해 개발되었습니다.[NEWLINE][NEWLINE]이 전술은 종종 4m가 넘는 강화된 장창인 파이크를 이용한 통제에 달려 있습니다. 방어적으로는 뛰어나지만, 다루기 힘들어서 기동성이 떨어지기 쉬웠고, 오직 잘 훈련된 부대만이 효과적인 공격 방식으로 사용할 수 있었습니다. 이러한 약점을 극복하기 위해 장창병은 매우 원시적인 (매치락) 화기인 화승총과 짝을 이루었습니다. 창총진은 매우 성공적이어서 당시의 많은 전투는 움직일 수 없는 많은 수의 병사들이 서로를 밀치고 치명적인 압도로 이어지는 "파이크 밀기(Push of Pike)"로 알려졌으며, 장창병의 무장을 해제하기 위해 특별히 거대한 대검이 제작되었습니다.'
WHERE Tag = 'TXT_KEY_CIV5_SPAIN_TERCIO_TEXT';