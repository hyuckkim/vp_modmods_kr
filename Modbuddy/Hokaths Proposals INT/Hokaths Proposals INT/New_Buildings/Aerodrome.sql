INSERT INTO Language_ko_KR (Tag, Text)
VALUES	('TXT_KEY_BUILDING_AIRFIELD',			'비행장'),
		('TXT_KEY_BUILDING_AIRFIELD_TEXT',		'비행장이란 항공기 운항이 이루어지는 장소로, 항공화물이나 승객이 탑승하거나 탑승하지 않는지 여부와 관계없이, 그리고 공공용인지 민간용인지 여부와 관계없이 운영됩니다. 이들은 비행장의 한 유형으로, 여기에는 소규모 일반 항공 비행장과 멀리 떨어진 비행장, 대규모 상업 공항, 군용 공군 기지가 포함됩니다. 항공의 초창기에는 포장된 활주로가 없고 모든 착륙장이 잔디밭이었는데, 전형적인 비행장은 오늘날의 공항과 비슷하게 몇 가지 방향으로만 이착륙을 허용했습니다.[NEWLINE][NEWLINE]이후, 더욱 현대적인 비행장은 규모가 훨씬 커져 어느 방향으로든 이착륙이 가능해졌습니다. 바람의 방향에 관계없이 항상 바람을 향해 이륙하고 착륙할 수 있는 능력은 초창기 항공 시대에는 중요한 장점이었는데 당시 비행기나 비행선은 횡풍에서 이륙하거나 착륙할 때 성능이 좋지 않거나 심지어 위험할 수도 있었습니다.'),
		('TXT_KEY_BUILDING_AIRFIELD_STRATEGY',	'T비행장은 강력한 공항과 군사기지 건물에 필요한 첫 번째 항공 인프라입니다. 게임의 이 시점에서는 열기구만 발사할 수 있을 수도 있지만, 공중전이 중요할 것이라는 걸 알고 있다면 미리 투자할 수 있습니다. 이 건물은 도시 내에 있는 세계 불가사의를 기반으로 수익을 낼 수 있으므로, 하늘에서 바라보는 경치 좋은 전망에 대한 수요가 있는 틈새 투자처가 될 수 있습니다.'),
		('TXT_KEY_BUILDING_AIRFIELD_HELP',		'도시에 있는 모든 [ICON_WONDER] 세계 불가사의에서 [ICON_GOLD] 골드 +2, [ICON_TOURISM] 관광 +1을 획득합니다. 공중 및 호버링 유닛에 대한 [ICON_PRODUCTION] 생산량이 +20% 증가합니다.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]도시의 공중 유닛 수용량이 1만큼 증가합니다[ENDCOLOR]. 도시에 대한 공습 시 공중 유닛의 [ICON_STRENGTH] 피해가 +5 증가합니다.');

UPDATE Language_ko_KR SET
Text = Replace(Text, '도시의 공중 유닛 수용 인원이 2에서 6으로 증가합니다.', '도시의 공중 유닛 수용량이 2만큼 증가합니다.')
WHERE Tag = 'TXT_KEY_BUILDING_AIRPORT_HELP';

UPDATE Language_ko_KR SET
Text = Replace(Text, '도시에 대한 공습.', '[COLOR_POSITIVE_TEXT]도시의 공중 유닛 수용량이 1만큼 증가합니다[ENDCOLOR].')
WHERE Tag = 'TXT_KEY_BUILDING_MILITARY_BASE_HELP';