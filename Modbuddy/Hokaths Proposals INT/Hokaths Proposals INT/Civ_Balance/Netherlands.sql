UPDATE Language_ko_KR
SET Text = '도시에서 사치 자원을 생산할 때마다 [ICON_GOLD] 골드 +1, [ICON_CULTURE] 문화 +1 증가합니다. 수입 및/또는 수출하는 고유한 사치 자원 하나당 [ICON_GOLD] 골드 +4 증가[COLOR:105:105:105:255](시대별 보정)[ENDCOLOR]합니다. [ICON_VP_MONOPOLY] 독점에 포함되는 문명에서 중복된 사치품을 수입할 수 있습니다.'
WHERE Tag = 'TXT_KEY_TRAIT_LUXURY_RETENTION';

UPDATE Language_ko_KR
SET Text = '습지 타일이나 최소 2개의 육지 타일에 인접한 특징 없는 호수/해안 타일에만 건설할 수 있습니다. 물 위에 지어진 간척지는 땅 타일인 것처럼 승선하지 않고도 지상 유닛으로 이동할 수 있습니다.'
WHERE Tag = 'TXT_KEY_CIV5_IMPROVEMENTS_POLDER_HELP';