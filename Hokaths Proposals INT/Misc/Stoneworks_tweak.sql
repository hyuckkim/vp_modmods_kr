-- remove this newline in tabya. since base stoneworks starts with this line
UPDATE Language_ko_KR
SET Text = Replace(Text, '[NEWLINE][NEWLINE]허가', ' 허가')
WHERE Tag IN (SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_STONE_WORKS');

UPDATE Language_ko_KR
SET Text = Replace(Text, '문명 내부의 교역로를 따라 이 도시의 [ICON_PRODUCTION] 생산력을 옮길 수 있습니다.', '도시의 경계가 확장되면 [ICON_PRODUCTION] 생산력 10을 얻습니다. (시대에 따라 보정)')
WHERE Tag IN (SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_STONE_WORKS');

UPDATE Language_ko_KR
SET Text = '석재 공장은 [ICON_PRODUCTION] 생산력과 [ICON_CULTURE] 문화를 증가시키고, 대부분 채석장 자원의 산출량을 증가시킵니다. 국경 확장으로 수익을 창출하는 모든 효과와 마찬가지로, 석재 공장은 도시의 문화 가치를 효과적으로 증가시킵니다.'
WHERE Tag = 'TXT_KEY_BUILDING_STONE_WORKS_STRATEGY';

UPDATE Language_ko_KR
SET Text = '{TXT_KEY_BUILDING_STONE_WORKS}을 대체하는 송가이 고유 건물입니다. {TXT_KEY_BUILDING_STONE_WORKS}의 보너스를 증가시키고, {TXT_KEY_BUILDING_MUD_PYRAMID_MOSQUE_DESC}는 추가적으로 [ICON_CULTURE] 문화와 [ICON_PRODUCTION] 생산력을 생성합니다. {TXT_KEY_BUILDING_MUD_PYRAMID_MOSQUE_DESC}는 건물 건설에 +10%의 이점을 제공하며, 모든 강 타일의 생산을 증가시켜 송수로를 따라 있는 도시의 개발도 크게 증가시킵니다.'
WHERE Tag = 'TXT_KEY_BUILDING_MUD_PYRAMID_MOSQUE_STRATEGY';

-- 대장간 
UPDATE Language_ko_KR
SET Text = '문명 내부의 교역로를 따라 이 도시의 [ICON_PRODUCTION] 생산력을 옮길 수 있습니다.[NEWLINE][NEWLINE]' || Text
WHERE Tag IN (SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_FORGE');

UPDATE Language_ko_KR
SET Text = Replace(Text, '작업장', '대장간')
WHERE Tag IN (SELECT Help FROM Units WHERE Type IN ('UNIT_CARAVAN', 'UNIT_CARGO_SHIP'));

UPDATE Language_ko_KR
SET Text = Replace(Text, '작업장', '대장간')
WHERE Tag IN (SELECT Strategy FROM Units WHERE Type IN ('UNIT_CARAVAN', 'UNIT_CARGO_SHIP'));

UPDATE Language_ko_KR
SET Text = '대장간은 근처의 [ICON_RES_IRON] 철과 [ICON_RES_COPPER] 구리 자원을 개선하고 광산의 [ICON_PRODUCTION] 생산력을 늘립니다. 또한 이를 통해 도시 간에 생산력을 이동할 수 있게 되었는데, 이는 새로운 정착지를 적절한 시기에 건설하고 운영하는 데 중요한 요소가 될 수 있습니다.'
WHERE Tag = 'TXT_KEY_BUILDING_FORGE_STRATEGY';

-- 작업장
UPDATE Language_ko_KR
SET Text = Replace(Text, '[NEWLINE][NEWLINE]문명 내부의 교역로를 따라 이 도시의 [ICON_PRODUCTION] 생산력을 옮길 수 있습니다.', '')
WHERE Tag IN (SELECT Help FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_WORKSHOP');