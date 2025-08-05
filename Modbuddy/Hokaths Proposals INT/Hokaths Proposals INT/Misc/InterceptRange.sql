-- Anti-Aircraft Gun
UPDATE Language_ko_KR
SET Text = '이러한 특수 포병 유닛은 1타일 이내에 있는 목표물을 폭격하는 모든 항공 유닛을 자동으로 공격합니다. (그들은 턴당 하나의 유닛만 요격할 수 있습니다.) 이들은 다른 지상 유닛과의 전투에서는 매우 약하므로 지상 공격의 위협을 받을 때는 더 강력한 유닛으로 방어해야 합니다.'
WHERE Tag = 'TXT_KEY_UNIT_ANTI_AIRCRAFT_STRATEGY';

-- Mobile SAM
UPDATE Language_ko_KR
SET Text = '이동형 SAM(지대공) 유닛은 진격하는 군대에 대공 방어를 제공합니다. 이동형 SAM 유닛은 육각 타일 2개 이내의 적 항공기 폭격 목표물을 요격하고 사격할 수 있습니다. (하지만 턴당 유닛 1개만 가능) 이러한 부대는 공중 공격이 아닌 공격에 상당히 취약하므로 보병이나 기갑 부대와 함께 있어야 합니다.'
WHERE Tag = 'TXT_KEY_UNIT_MOBILE_SAM_STRATEGY';

-- Carrier
UPDATE Language_ko_KR
SET Text = '항공모함은 전투기, 폭격기, 원자폭탄 등을 운반하는 특수 선박입니다. 항공모함 자체는 공격할 수 없지만, 탑재한 항공기 덕분에 현재 해상에서 가장 강력한 공격 무기가 됩니다. 그러나 방어적으로는 항공모함이 약하므로 구축함과 잠수함의 호위를 받아야 합니다. 그래도 항공모함은 대공 무기로 무장하고 있으며, 2타일 이내에 있는 목표물을 폭격하는 모든 항공 유닛을 자동으로 공격합니다. (그들은 턴당 하나의 유닛만 요격할 수 있습니다.)'
WHERE Tag = 'TXT_KEY_UNIT_CARRIER_STRATEGY';

-- Supercarrier
UPDATE Language_ko_KR
SET Text = '항공기 5대(승급 시 최대 8대)를 탑재하고, 3이라는 높은 대공 요격 범위를 가지고 있으며 잠수함을 감지할 수 있습니다.[NEWLINE][NEWLINE]한 번에 최대 [COLOR_POSITIVE_TEXT]2[ENDCOLOR]대의 대형항공모함만 가질 수 있습니다.'
WHERE Tag = 'TXT_KEY_UNIT_SUPERCARRIER_HELP';

-- other texts dont seem to mention specifics about the range