UPDATE Language_ko_KR SET
Text = '기뢰 해역은 현대 시대 건물로, 충분한 철광석을 가지고 있고 도시에 항구를 건설한 경우에만 건설할 수 있습니다. 기뢰 해역이 설치되면 적 함선은 도시 영토에 진입하자마자 즉시 저지당하고, 육지에서의 보복 공격 범위 밖의 지역 바다 타일에 앉아 있을 수 없게 됩니다. 이 도시의 해상 근접 공격 유닛은 인접한 모든 적에게 미치는 영향이 적습니다. 기뢰 해역을 이용해 해상 침공을 둔화시킨 후, 자국 해군으로 이를 따돌리세요. 기뢰 해역은 자원이 많이 필요하므로 해상 포위 공격에 특히 취약한 위치에만 설치하는 것이 가장 좋습니다.'
WHERE Tag = 'TXT_KEY_BUILDING_MINEFIELD_STRATEGY';

UPDATE Language_ko_KR SET
Text = Replace(Text, '[COLOR_NEGATIVE_TEXT]원거리 공격[ENDCOLOR]을 방어할 때 [ICON_STRENGTH] 전투력이 -10% 감소합니다.[NEWLINE]', '')
WHERE Tag = 'TXT_KEY_PROMOTION_MINELAYER_HELP';

UPDATE Language_ko_KR SET
Text = Replace(Text, '[NEWLINE][NEWLINE][COLOR_CYAN]{TXT_KEY_TECH_COMBUSTION_TITLE}[ENDCOLOR]를 연구한 후 사용 가능합니다.', '')
WHERE Tag = 'TXT_KEY_PROMOTION_MINELAYER_HELP';