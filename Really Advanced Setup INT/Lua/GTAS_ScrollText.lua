
-- GTAS_ScrollText - Really Advanced Setup Mod의 일부

local MODE_TEXT = 1;
local MODE_LINE = 2;

LINE_HEIGHT = 18;
TITLE_HEIGHT = 44;
SUB_TITLE_HEIGHT = 34;

ScrollTextDefaults = {
	mode = MODE_TEXT;
	text = "";
	anchor = "C,C";
	offsetX = 0;
	offsetY = 0;
	sizeX = 891;
	sizeY = 27;
	font = "TwCenMT20";
};

COLOR_LIGHT_BLUE = "[COLOR:120:200:255:255]";
COLOR_YELLOW = "[COLOR:200:200:70:255]";
COLOR_GREEN = "[COLOR_GREEN]";

function ColorText(colorType, text)
	return colorType .. text .. "[/COLOR]";
end

TerrainCivText = {
	rootControl = "TerrainHelpRoot";
	textControl = "TerrainHelpLabel";
	lineControl = "TerrainHelpLine";
	defaults = ScrollTextDefaults;
	data = {
		{ sizeY = TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_GREEN, "플레이어 지형") },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT24",
			text = ColorText(COLOR_LIGHT_BLUE, "이 목록을 사용하여 플레이어의 시작 위치를 기준으로 지형을 배치합니다.") },
		{ sizeY = LINE_HEIGHT, mode = MODE_LINE },
		{ text = "지형을 배치하는 순서는 세 단계로 이루어집니다." },
		{ text = "이 모드 외부에서 생성된 지형이 가장 먼저 배치됩니다." },
		{ text = "모든 플레이어 지형 목록(이 지형 목록과 같은)에서 생성된 지형은 두 번째로 배치됩니다." },
		{ text = "지도 지형 목록(지도 보너스 패널에 있는)에서 생성된 지형은 세 번째로 배치됩니다." },
		{ text = "지형을 바꾸는 것은 심각한 문제로 이어질 수 있으므로 주의해야 합니다." },
		{ text = "몇 가지 예를 들자면..." },
		{ text = "시작 지점 주위에 산의 고리를 만들면 플레이어는 영구적으로 고립됩니다." },
		{ text = "AI의 시작 위치 주변에 작은 섬을 만들면 결국 내륙으로 고립될 수 있습니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_LIGHT_BLUE, "지형 제어") },
		{ sizeY = LINE_HEIGHT, mode = MODE_LINE },
		{ text = "이 목록에 명령을 추가하려면 아래의 지형 제어를 사용하세요." },
		{ text = "각 명령은 지도가 생성될 때 하나 이상의 타일의 지형을 변경하려고 시도합니다." },
		{ text = "각 명령을 입력할 때마다 지도를 만드는 데 필요한 총 시간이 늘어난다는 점을 기억하세요." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "지형 메뉴" },
		{ text = "이 메뉴에는 지도에 추가할 수 있는 지형 유형 목록이 포함되어 있습니다." },
		{ text = "이 메뉴를 사용하여 현재 지형을 선택하세요." },
		{ text = "현재 지형은 왼쪽 이미지에 나타납니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "물/땅 바꾸기" },
		{ text = "일반적으로 이 모드는 물 타일을 땅 타일로 바꾸지 않으며, 그 반대의 경우도 마찬가지입니다." },
		{ text = "이 빈 칸을 선택하면 물과 땅 지형을 서로 변경할 수 있습니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "배치" },
		{ text = "이는 모드가 지형을 변경할 때 적합한 타일을 어떻게 검색할지 결정합니다." },
		{ text = "가까이를 선택하면 검색이 최소 거리에서 시작하여 최대 거리까지 진행됩니다." },
		{ text = "멀리를 선택하면 검색이 최대 거리에서 시작하여 최소 거리까지 진행됩니다." },
		{ text = "무작위를 선택하면 최소 거리와 최대 거리 사이에서 무작위 타일을 찾습니다." },
		{ text = "채우기는 최소 거리와 최대 거리 사이에서 지형을 최대한 많이 변경합니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "셈" },
		{ text = "이는 (가능한 경우) 적용될 지형 변경 횟수입니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "최소 거리" },
		{ text = "지형은 플레이어의 시작 위치에서 이 거리보다 더 가까워지지 않습니다." },
		{ text = "최소 거리는 최대 거리보다 클 수 없습니다." },
		{ text = "이 슬라이더를 최대 거리 이상으로 옮기려고 하면 해당 슬라이더도 따라오게 됩니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "최대 거리" },
		{ text = "플레이어의 시작 위치에서 이 거리 이상에서는 지형이 변경되지 않습니다." },
		{ text = "최대 거리는 최소 거리보다 작을 수 없습니다." },
		{ text = "이 슬라이더를 최소 거리 이상으로 옮기려고 하면 해당 슬라이더도 따라오게 됩니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "고도" },
		{ text = "이를 통해 지형이 변경될 때 타일의 고도를 확인할 수 있습니다." },
		{ text = "현재 지형에 고도가 없으면 이 설정은 비활성화됩니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "목록에 추가" },
		{ text = "이렇게 하면 현재 지형 제어 설정을 사용하여 이 목록에 새 명령이 추가됩니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_LIGHT_BLUE, "목록 제어") },
		{ sizeY = LINE_HEIGHT, mode = MODE_LINE },
		{ text = "이 목록에 명령이 추가되면 편집에 사용되는 여러 가지 제어가 생깁니다." },
		{ text = "목록에서 명령을 삭제하려면 작은 x 버튼을 클릭하세요." },
		{ text = "둥근 버튼을 클릭하면 명령 설정이 지형 컨트롤로 복사됩니다." },
		{ text = "업데이트 버튼을 클릭하면 지형 제어 설정이 해당 명령에 복사됩니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "모든 플레이어에게 목록 복사" },
		{ text = "이 제어는 이 플레이어의 지형 목록을 다른 모든 플레이어의 지형 목록에 복사합니다." },
		{ text = "이 제어는 목록이 비어 있을 때 사용할 수 있으며, 비어 있는 경우 다른 모든 플레이어 지형 목록이 지워집니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "목록 지우기" },
		{ text = "이렇게 하면 목록에서 모든 명령이 제거됩니다." },
		{ text = "목록이 비어 있으면 이 제어가 나타나지 않습니다." },
		{ },
		{ text = ColorText(COLOR_YELLOW, "이 도움말 텍스트는 목록이 비어 있을 때만 나타납니다.") },
		{ sizeY = 10 },
	};
};

TerrainMapText = {
	textControl = "TerrainHelpLabel";
	rootControl = "TerrainHelpRoot";
	lineControl = "TerrainHelpLine";
	defaults = ScrollTextDefaults;
	data = {
		{ sizeY = TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_GREEN, "지도 지형") },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT24", text = "이 목록을 사용하면 전체 지도에 지형을 무작위로 배치할 수 있습니다." },
		{ sizeY = LINE_HEIGHT, mode = MODE_LINE },
		{ text = "지형을 배치하는 순서는 세 단계로 이루어집니다." },
		{ text = "이 모드 외부에서 생성된 지형이 가장 먼저 배치됩니다." },
		{ text = "플레이어 지형 목록(플레이어 보너스 패널에 있는)에서 생성된 지형은 두 번째로 배치됩니다." },
		{ text = "이 지도에서 생성된 지도 지형 목록은 세 번째로 배치됩니다." },
		{ text = "지형을 바꾸는 것은 심각한 문제로 이어질 수 있으므로 주의해야 합니다." },
		{ text = "몇 가지 예를 들자면..." },
		{ text = "시작 지점 주위에 산의 고리를 만들면 플레이어는 영구적으로 고립됩니다." },
		{ text = "AI의 시작 위치 주변에 작은 섬을 만들면 결국 내륙으로 고립될 수 있습니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_LIGHT_BLUE, "지형 제어") },
		{ sizeY = LINE_HEIGHT, mode = MODE_LINE },
		{ text = "이 목록에 명령을 추가하려면 아래의 지형 제어를 사용하세요." },
		{ text = "각 명령은 지도가 생성될 때 하나 이상의 타일의 지형을 변경하려고 시도합니다." },
		{ text = "각 명령을 입력할 때마다 지도를 만드는 데 필요한 총 시간이 늘어난다는 점을 기억하세요." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "지형 메뉴" },
		{ text = "이 메뉴에는 지도에 추가할 수 있는 지형 유형 목록이 포함되어 있습니다." },
		{ text = "이 메뉴를 사용하여 현재 지형을 선택하세요." },
		{ text = "현재 지형은 왼쪽 이미지에 나타납니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "땅/물 바꾸기" },
		{ text = "일반적으로 이 모드는 물 타일을 땅 타일로 바꾸지 않으며, 그 반대의 경우도 마찬가지입니다." },
		{ text = "이 빈 칸을 선택하면 땅과 물 지형을 서로 변경할 수 있습니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "셈" },
		{ text = "이는 (가능한 경우) 적용될 지형 변경 횟수입니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "고도" },
		{ text = "이를 통해 지형이 변경될 때 타일의 고도를 확인할 수 있습니다." },
		{ text = "현재 지형에 고도가 없으면 이 설정은 비활성화됩니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "목록에 추가" },
		{ text = "이렇게 하면 현재 설정을 사용하여 목록에 새 명령이 추가됩니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_LIGHT_BLUE, "목록 제어") },
		{ sizeY = LINE_HEIGHT, mode = MODE_LINE },
		{ text = "이 목록에 명령이 추가되면 편집에 사용되는 여러 가지 제어가 생깁니다." },
		{ text = "목록에서 명령을 삭제하려면 작은 x 버튼을 클릭하세요." },
		{ text = "둥근 버튼을 클릭하면 명령 설정이 지형 제어로 복사됩니다." },
		{ text = "업데이트 버튼을 클릭하면 지형 제어 설정이 해당 명령에 복사됩니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "목록 지우기" },
		{ text = "이렇게 하면 목록에서 모든 명령이 제거됩니다." },
		{ text = "목록이 비어 있으면 이 제어가 나타나지 않습니다." },
		{ },
		{ text = ColorText(COLOR_YELLOW, "이 도움말 텍스트는 목록이 비어 있을 때만 나타납니다.") },
		{ sizeY = 10 },
	};
};

FeatureCivText = {
	rootControl = "FeatureHelpRoot";
	textControl = "FeatureHelpLabel";
	lineControl = "FeatureHelpLine";
	defaults = ScrollTextDefaults;
	data = {
		{ sizeY = TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_GREEN, "플레이어 특성") },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT24", 
			text = ColorText(COLOR_LIGHT_BLUE, "이 목록을 사용하여 플레이어의 시작 위치를 기준으로 특성을 배치합니다.") },
		{ sizeY = LINE_HEIGHT, mode = MODE_LINE },
		{ text = "특성을 배치하는 순서는 세 단계로 이루어집니다." },
		{ text = "이 모드 외부에서 생성된 특성이 가장 먼저 배치됩니다." },
		{ text = "모든 플레이어 특성 목록(이 목록과 같은)에서 생성된 특성은 두 번째에 배치됩니다." },
		{ text = "지도 특성 목록(지도 보너스 패널에 있는)에서 생성된 특성은 세 번째에 배치됩니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_LIGHT_BLUE, "특성 제어") },
		{ sizeY = LINE_HEIGHT, mode = MODE_LINE },
		{ text = "아래에 있는 특성 제어를 사용하여 이 목록에 명령을 추가하세요." },
		{ text = "각 명령은 지도가 생성될 때 하나 이상의 특성을 배치하려고 시도합니다." },
		{ text = "각 명령을 입력할 때마다 지도를 만드는 데 필요한 총 시간이 늘어난다는 점을 기억하세요." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "특성 메뉴" },
		{ text = "이 메뉴에는 지도에 추가할 수 있는 특성 목록이 포함되어 있습니다." },
		{ text = "이 메뉴를 사용하여 현재 특성을 선택하세요." },
		{ text = "현재 특성은 왼쪽 이미지에 나타납니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "기존 특성 교체" },
		{ text = "일반적으로 새로운 특성은 이미 특성이 포함된 타일에 배치되지 않습니다." },
		{ text = "이 빈 칸을 선택하면 새 특성이 기존 특성을 대체합니다." },
		{ text = "이 설정을 사용하면 이전에 다른 명령으로 만든 특성을 덮어쓸 수 있습니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "배치" },
		{ text = "이는 모드가 다음 지형 특성을 배치할 때 적합한 타일을 어떻게 검색할지 결정합니다." },
		{ text = "가까이를 선택하면 검색이 최소 거리에서 시작하여 최대 거리까지 진행됩니다." },
		{ text = "멀리를 선택하면 검색이 최대 거리에서 시작하여 최소 거리까지 진행됩니다." },
		{ text = "무작위를 선택하면 최소 거리와 최대 거리 사이에서 무작위 타일을 찾습니다." },
		{ text = "채우기를 선택하면 최소 거리와 최대 거리 사이에 가능한 한 많은 특성을 넣습니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "셈" },
		{ text = "이는  (가능한 경우) 생성될 특성의 수입니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "최소 거리" },
		{ text = "특성은 플레이어의 시작 위치로부터 이 거리보다 더 가깝게 배치되지 않습니다." },
		{ text = "최소 거리는 최대 거리보다 클 수 없습니다." },
		{ text = "이 슬라이더를 최대 거리 이상으로 옮기려고 하면 해당 슬라이더도 따라오게 됩니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "최대 거리" },
		{ text = "특성은 플레이어의 시작 위치에서 이 거리보다 멀리 배치되지 않습니다." },
		{ text = "최대 거리는 최소 거리보다 작을 수 없습니다." },
		{ text = "이 슬라이더를 최소 거리 이상으로 옮기려고 하면 해당 슬라이더도 따라오게 됩니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "목록에 추가" },
		{ text = "이렇게 하면 현재 설정을 사용하여 목록에 새 명령이 추가됩니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_LIGHT_BLUE, "목록 제어") },
		{ sizeY = LINE_HEIGHT, mode = MODE_LINE },
		{ text = "이 목록에 명령이 추가되면 편집에 사용되는 여러 가지 제어가 생깁니다." },
		{ text = "목록에서 명령을 삭제하려면 작은 x 버튼을 클릭하세요." },
		{ text = "둥근 버튼을 클릭하여 명령 설정을 특성 제어로 복사합니다." },
		{ text = "업데이트 버튼을 클릭하면 특성 제어 설정이 해당 명령에 복사됩니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "모든 플레이어에게 목록 복사" },
		{ text = "이 제어는 이 플레이어 기능 목록을 다른 모든 플레이어 기능 목록에 복사합니다." },
		{ text = "이 제어는 목록이 비어 있을 때 사용할 수 있으며, 비어 있는 경우 다른 모든 플레이어 기능 목록이 지워집니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "목록 지우기" },
		{ text = "이렇게 하면 목록에서 모든 명령이 제거됩니다." },
		{ text = "목록이 비어 있으면 이 제어가 나타나지 않습니다." },
		{ },
		{ text = ColorText(COLOR_YELLOW, "이 도움말 텍스트는 목록이 비어 있을 때만 나타납니다.") },
		{ sizeY = 10 },
	};
};

FeatureMapText = {
	textControl = "FeatureHelpLabel";
	rootControl = "FeatureHelpRoot";
	lineControl = "FeatureHelpLine";
	defaults = ScrollTextDefaults;
	data = {
		{ sizeY = TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_GREEN, "지도 특성") },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT24", text = "이 목록을 사용하면 전체 지도에 지형 특성을 무작위로 배치할 수 있습니다." },
		{ sizeY = LINE_HEIGHT, mode = MODE_LINE },
		{ text = "특성을 배치하는 순서는 세 단계로 이루어집니다." },
		{ text = "이 모드 외부에서 생성된 특성이 가장 먼저 배치됩니다." },
		{ text = "모든 플레이어 기능 목록(플레이어 보너스 패널에 있는)에서 생성된 기능은 두 번째에 배치됩니다." },
		{ text = "이 지도 특성 목록에서 생성된 특성은 세 번째에 배치됩니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_LIGHT_BLUE, "특성 제어") },
		{ sizeY = LINE_HEIGHT, mode = MODE_LINE },
		{ text = "아래에 있는 특성 제어을 사용하여 이 목록에 명령을 추가하세요." },
		{ text = "각 명령은 지도가 생성될 때 하나 이상의 특성을 배치하려고 시도합니다." },
		{ text = "각 명령을 입력할 때마다 지도를 만드는 데 필요한 총 시간이 늘어난다는 점을 기억하세요." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "특성 메뉴" },
		{ text = "이 메뉴에는 지도에 추가할 수 있는 특성 목록이 포함되어 있습니다." },
		{ text = "이 메뉴를 사용하여 현재 특성을 선택하세요." },
		{ text = "현재 특성은 왼쪽 이미지에 나타납니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "기존 특성 교체" },
		{ text = "일반적으로 새로운 특성은 이미 특성이 포함된 타일에 배치되지 않습니다." },
		{ text = "이 빈 칸을 선택하면 새 특성이 기존 특성을 대체합니다." },
		{ text = "이 설정을 사용하면 이전에 다른 명령으로 만든 특성을 덮어쓸 수 있습니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "셈" },
		{ text = "이는 생성될 특성의 수입니다. (가능한 경우)" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "목록에 추가" },
		{ text = "이렇게 하면 현재 설정을 사용하여 목록에 새 명령이 추가됩니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_LIGHT_BLUE, "목록 제어") },
		{ sizeY = LINE_HEIGHT, mode = MODE_LINE },
		{ text = "이 목록에 명령이 추가되면 편집에 사용되는 여러 가지 제어가 생깁니다." },
		{ text = "목록에서 명령을 삭제하려면 작은 x 버튼을 클릭하세요." },
		{ text = "둥근 버튼을 클릭하여 명령 설정을 특성 제어로 복사합니다." },
		{ text = "업데이트 버튼을 클릭하면 특성 제어 설정이 해당 명령에 복사됩니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "목록 지우기" },
		{ text = "이렇게 하면 목록에서 모든 명령이 제거됩니다." },
		{ text = "목록이 비어 있으면 이 제어가 나타나지 않습니다." },
		{ },
		{ text = ColorText(COLOR_YELLOW, "이 도움말 텍스트는 목록이 비어 있을 때만 나타납니다.") },
		{ sizeY = 10 },
	};
};

ResourceCivText = {
	rootControl = "ResourceHelpRoot";
	textControl = "ResourceHelpLabel";
	lineControl = "ResourceHelpLine";
	defaults = ScrollTextDefaults;
	data = {
		{ sizeY = TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_GREEN, "플레이어 자원") },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT24",
			text = ColorText(COLOR_LIGHT_BLUE, "이 목록을 사용하여 플레이어의 시작 위치를 기준으로 자원을 배치합니다.") },
		{ sizeY = LINE_HEIGHT, mode = MODE_LINE },
		{ text = "자원을 배치하는 순서는 세 단계로 이루어집니다." },
		{ text = "이 모드 외부에서 생성된 자원이 가장 먼저 배치됩니다." },
		{ text = "모든 플레이어 자원 목록(이 목록과 같은)에서 생성된 자원은 두 번째에 배치됩니다." },
		{ text = "지도 자원 목록(지도 보너스 패널에 위치)에서 생성된 자원은 세 번째에 배치됩니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_LIGHT_BLUE, "자원 제어") },
		{ sizeY = LINE_HEIGHT, mode = MODE_LINE },
		{ text = "이 목록에 명령을 추가하려면 아래의 자원 제어를 사용하세요." },
		{ text = "각 명령은 지도가 생성될 때 하나 이상의 자원을 배치하려고 시도합니다." },
		{ text = "각 명령을 입력할 때마다 지도를 만드는 데 필요한 총 시간이 늘어난다는 점을 기억하세요." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "자원 메뉴" },
		{ text = "이 메뉴에는 지도에 추가할 수 있는 자원 목록이 포함되어 있습니다." },
		{ text = "이 메뉴를 사용하여 현재 자원을 선택하세요." },
		{ text = "현재 자원은 왼쪽 이미지에 나타납니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "느슨한 규칙" },
		{ text = "일반적으로 자원 배치는 지형, 언덕, 특성에 의해 제한됩니다." },
		{ text = "이 빈 칸을 선택하면 이러한 제한 중 일부가 무시됩니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "배치" },
		{ text = "이는 모드가 다음 자원을 배치할 때 적합한 타일을 어떻게 검색할지 결정합니다." },
		{ text = "가까이를 선택하면 검색이 최소 거리에서 시작하여 최대 거리까지 진행됩니다." },
		{ text = "멀리를 선택하면 검색이 최대 거리에서 시작하여 최소 거리까지 진행됩니다." },
		{ text = "무작위를 선택하면 최소 거리와 최대 거리 사이에서 무작위 타일을 찾습니다." },
		{ text = "채우기를 선택하면 최소 거리와 최대 거리 사이에 가능한 한 많은 자원을 넣습니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "셈" },
		{ text = "이는 생성될 자원의 수입니다. (가능한 경우)" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "최소 거리" },
		{ text = "자원은 플레이어의 시작 위치로부터 이 거리보다 더 가까운 곳에 배치되지 않습니다." },
		{ text = "최소 거리는 최대 거리보다 클 수 없습니다." },
		{ text = "이 슬라이더를 최대 거리 이상으로 옮기려고 하면 해당 슬라이더도 따라오게 됩니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "최대 거리" },
		{ text = "자원은 플레이어의 시작 위치에서 이 거리보다 멀리 배치되지 않습니다." },
		{ text = "최대 거리는 최소 거리보다 작을 수 없습니다." },
		{ text = "이 슬라이더를 최소 거리 이상으로 옮기려고 하면 해당 슬라이더도 따라오게 됩니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "자원 유형" },
		{ text = "이는 자원 메뉴에 표시되는 자원 유형을 제어합니다." },
		{ text = "모두 버튼은 현재 게임에서 사용할 수 있는 모든 자원을 표시합니다." },
		{ text = "다른 버튼은 단일 유형의 자원만 표시합니다." },
		{ text = "각 자원 유형마다 서로 다른 무작위 자원 설정이 제공됩니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "목록에 추가" },
		{ text = "이렇게 하면 현재 설정을 사용하여 목록에 새 명령이 추가됩니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_LIGHT_BLUE, "목록 제어") },
		{ sizeY = LINE_HEIGHT, mode = MODE_LINE },
		{ text = "이 목록에 명령이 추가되면 편집에 사용되는 여러 가지 제어가 생깁니다." },
		{ text = "목록에서 명령을 삭제하려면 작은 x 버튼을 클릭하세요." },
		{ text = "둥근 버튼을 클릭하여 명령 설정을 자원 제어로 복사합니다." },
		{ text = "업데이트 버튼을 클릭하여 자원 제어 설정을 해당 명령에 복사합니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "모든 플레이어에게 목록 복사" },
		{ text = "이 제어는 이 플레이어 자원 목록을 다른 모든 플레이어 자원 목록에 복사합니다." },
		{ text = "이 제어는 목록이 비어 있을 때 사용할 수 있으며, 이 경우 다른 모든 플레이어 자원 목록이 지워집니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "목록 지우기" },
		{ text = "이렇게 하면 목록에서 모든 명령이 제거됩니다." },
		{ text = "목록이 비어 있으면 이 제어가 나타나지 않습니다." },
		{ },
		{ text = ColorText(COLOR_YELLOW, "이 도움말 텍스트는 목록이 비어 있을 때만 나타납니다.") },
		{ sizeY = 10 },
	};
};

ResourceMapText = {
	textControl = "ResourceHelpLabel";
	rootControl = "ResourceHelpRoot";
	lineControl = "ResourceHelpLine";
	defaults = ScrollTextDefaults;
	data = {
		{ sizeY = TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_GREEN, "지도 자원") },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT24", text = "이 목록을 사용하면 전체 지도에 자원을 무작위로 배치할 수 있습니다." },
		{ sizeY = LINE_HEIGHT, mode = MODE_LINE },
		{ text = "자원을 배치하는 순서는 세 단계로 이루어집니다." },
		{ text = "이 모드 외부에서 생성된 자원이 가장 먼저 배치됩니다." },
		{ text = "플레이어 자원 목록(플레이어 보너스 패널에 위치)에서 생성된 자원은 두 번째에 배치됩니다." },
		{ text = "이 지도 자원 목록에서 생성된 자원은 세 번째에 배치됩니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_LIGHT_BLUE, "자원 제어") },
		{ sizeY = LINE_HEIGHT, mode = MODE_LINE },
		{ text = "이 목록에 명령을 추가하려면 아래의 자원 제어를 사용하세요." },
		{ text = "각 명령은 지도가 생성될 때 하나 이상의 자원을 배치하려고 시도합니다." },
		{ text = "각 명령을 입력할 때마다 지도를 만드는 데 필요한 총 시간이 늘어난다는 점을 기억하세요." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "자원 메뉴" },
		{ text = "이 메뉴에는 지도에 추가할 수 있는 자원 목록이 포함되어 있습니다." },
		{ text = "이 메뉴를 사용하여 현재 자원을 선택하세요." },
		{ text = "현재 자원은 왼쪽 이미지에 나타납니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "느슨한 규칙" },
		{ text = "일반적으로 자원 배치는 지형, 언덕, 특성에 의해 제한됩니다." },
		{ text = "이 빈 칸을 선택하면 이러한 제한 중 일부가 무시됩니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "셈" },
		{ text = "이는 생성될 자원의 수입니다. (가능한 경우)" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "자원 유형" },
		{ text = "이는 자원 메뉴에 표시되는 자원 유형을 제어합니다." },
		{ text = "모두 버튼은 현재 게임에서 사용할 수 있는 모든 자원을 표시합니다." },
		{ text = "다른 버튼은 단일 유형의 자원만 표시합니다." },
		{ text = "각 자원 유형마다 서로 다른 무작위 자원 설정이 제공됩니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "목록에 추가" },
		{ text = "이렇게 하면 현재 설정을 사용하여 목록에 새 명령이 추가됩니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_LIGHT_BLUE, "목록 제어") },
		{ sizeY = LINE_HEIGHT, mode = MODE_LINE },
		{ text = "이 목록에 명령이 추가되면 편집에 사용되는 여러 가지 제어가 생깁니다." },
		{ text = "목록에서 명령을 삭제하려면 작은 x 버튼을 클릭하세요." },
		{ text = "둥근 버튼을 클릭하여 명령 설정을 자원 제어로 복사합니다." },
		{ text = "업데이트 버튼을 클릭하여 자원 제어 설정을 해당 명령에 복사합니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "목록 지우기" },
		{ text = "이렇게 하면 목록에서 모든 명령이 제거됩니다." },
		{ text = "목록이 비어 있으면 이 제어가 나타나지 않습니다." },
		{ },
		{ text = ColorText(COLOR_YELLOW, "이 도움말 텍스트는 목록이 비어 있을 때만 나타납니다.") },
		{ sizeY = 10 },
	};
};

NaturalWonderCivText = {
	rootControl = "WonderHelpRoot";
	textControl = "WonderHelpLabel";
	lineControl = "WonderHelpLine";
	defaults = ScrollTextDefaults;
	data = {
		{ sizeY = TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_GREEN, "플레이어 자연경관") },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT24",
			text = ColorText(COLOR_LIGHT_BLUE, "이 목록을 사용하여 플레이어의 시작 위치를 기준으로 자연경관을 배치하세요.") },
		{ sizeY = LINE_HEIGHT, mode = MODE_LINE },
		{ text = "자연경관을 배치하는 순서는 세 단계로 이루어집니다." },
		{ text = "이 모드 밖에서 만들어진 자연경관은 가장 먼저 배치됩니다." },
		{ text = "모든 플레이어의 자연경관 목록(이 목록과 같은 목록)에서 만들어진 자연경관은 두 번째로 배치됩니다." },
		{ text = " 지도 자연경관 목록(지도 보너스 패널에 있는)에서 생성된 자연경관은 세 번째에 배치됩니다." },
		{ text = "지도 패널에서 자연경관을 제어하기 위한 다른 설정이 있습니다." },
		{ text = "게임 시작 시 유닛 시야 범위 내에 있는 자연경관은 발견되어도 행복도를 제공하지 않습니다." },
		{ text = "그레이트 배리어 리프(대보초)와 지브롤터 암벽은 그래픽 문제로 인해 이 모드에 포함되지 않습니다." },
		{ text = "이 모드 외부에서 생성된 경우에도 여전히 나타날 수 있습니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_LIGHT_BLUE, "자연경관 제어") },
		{ sizeY = LINE_HEIGHT, mode = MODE_LINE },
		{ text = "이 목록에 명령을 추가하려면 아래에 있는 자연경관 제어를 사용하세요." },
		{ text = "각 명령은 지도가 생성될 때 하나 이상의 자연경관을 배치하려고 시도합니다." },
		{ text = "대부분의 자연경관은 배치에 있어 매우 구체적인 요건을 갖추고 있습니다." },
		{ text = "지도의 상태에 따라서는 주어진 유형의 자연경관이 거의 없거나 전혀 없을 수도 있습니다." },
		{ text = "각 명령을 입력할 때마다 지도를 만드는 데 필요한 총 시간이 늘어난다는 점을 기억하세요." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "자연경관 메뉴" },
		{ text = "이 메뉴에는 지도에 추가할 수 있는 자연경관 목록이 포함되어 있습니다." },
		{ text = "이 메뉴를 사용하여 현재의 자연경관을 선택하세요." },
		{ text = "현재의 자연경관은 왼쪽 이미지에 표시됩니다." },
		{ text = "더 많은 자연경관을 보려면 이미지 위에 마우스 포인터를 올려 놓으세요." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "스프링클 추가" },
		{ text = '스프링클은 근처에 무작위 개수의 자원을 추가하여 자연경관을 "향상"시키는 데 사용할 수 있습니다.' },
		{ text = "지도 조건이 허락한다면 해당 자원은 자연경관과 동일한 테마를 갖게 됩니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "배치" },
		{ text = "이는 모드가 다음 자연경관을 배치할 때 적합한 타일을 어떻게 검색할지 결정합니다." },
		{ text = "가까이를 선택하면 검색이 최소 거리에서 시작하여 최대 거리까지 진행됩니다." },
		{ text = "멀리를 선택하면 검색이 최대 거리에서 시작하여 최소 거리까지 진행됩니다." },
		{ text = "무작위를 선택하면 최소 거리와 최대 거리 사이에서 무작위 타일을 찾습니다." },
		{ text = "채우기를 선택하면 최소 거리와 최대 거리 사이에 가능한 한 많은 자연경관을 넣습니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "셈" },
		{ text = "이는 생성될 자연경관의 수입니다. (가능하다면)" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "최소 거리" },
		{ text = "자연경관은 플레이어의 시작 위치에서 이 거리보다 더 가까운 곳에 배치되지 않습니다." },
		{ text = "최소 거리는 최대 거리보다 클 수 없습니다." },
		{ text = "이 슬라이더를 최대 거리 이상으로 옮기려고 하면 해당 슬라이더도 따라오게 됩니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "최대 거리" },
		{ text = "자연경관은 플레이어의 시작 위치에서 이 거리보다 멀리 배치되지 않습니다." },
		{ text = "최대 거리는 최소 거리보다 작을 수 없습니다." },
		{ text = "이 슬라이더를 최소 거리 이상으로 옮기려고 하면 해당 슬라이더도 따라오게 됩니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "지도에 허용되는 각 자연경관의 최대 사본 수" },
		{ text = "이는 지도가 생성될 때 각 자연경관의 사본이 몇 개 허용되는지 표시합니다." },
		{ text = "이 값은 지도 패널에서 변경할 수 있습니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "목록에 추가" },
		{ text = "이렇게 하면 현재 설정을 사용하여 목록에 새 명령이 추가됩니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_LIGHT_BLUE, "목록 제어") },
		{ sizeY = LINE_HEIGHT, mode = MODE_LINE },
		{ text = "이 목록에 명령이 추가되면 편집에 사용되는 여러 가지 제어가 생깁니다." },
		{ text = "목록에서 명령을 삭제하려면 작은 x 버튼을 클릭하세요." },
		{ text = "둥근 버튼을 클릭하여 명령 설정을 자연경관 제어로 복사합니다." },
		{ text = "업데이트 버튼을 클릭하여 자연경관 제어 설정을 해당 명령에 복사합니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "모든 플레이어에게 목록 복사" },
		{ text = "이 제어는 이 플레이어 자연경관 목록을 다른 모든 플레이어 자연경관 목록에 복사합니다." },
		{ text = "이 제어는 목록이 비어 있을 때 사용할 수 있으며, 비어 있는 경우 다른 모든 플레이어 자연경관 목록을 지웁니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "목록 지우기" },
		{ text = "이렇게 하면 목록에서 모든 명령이 제거됩니다." },
		{ text = "목록이 비어 있으면 이 제어가 나타나지 않습니다." },
		{ },
		{ text = ColorText(COLOR_YELLOW, "이 도움말 텍스트는 목록이 비어 있을 때만 나타납니다.") },
		{ sizeY = 10 },
	};
};

NaturalWonderMapText = {
	rootControl = "WonderHelpRoot";
	textControl = "WonderHelpLabel";
	lineControl = "WonderHelpLine";
	defaults = ScrollTextDefaults;
	data = {
		{ sizeY = TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_GREEN, "지도 자연경관") },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT24", text = "이 목록을 사용하면 전체 지도에 자연경관을 무작위로 배치할 수 있습니다." },
		{ sizeY = LINE_HEIGHT, mode = MODE_LINE },
		{ text = "자연경관을 배치하는 순서는 세 단계로 이루어집니다." },
		{ text = "이 모드 밖에서 만들어진 자연경관은 가장 먼저 배치됩니다." },
		{ text = "모든 플레이어의 자연경관 목록(이 목록과 같은 목록)에서 만들어진 자연경관은 두 번째로 배치됩니다." },
		{ text = " 지도 자연경관 목록(지도 보너스 패널에 있는)에서 생성된 자연경관은 세 번째에 배치됩니다." },
		{ text = "지도 패널에서 자연경관을 제어하기 위한 다른 설정이 있습니다." },
		{ text = "게임 시작 시 유닛 시야 범위 내에 있는 자연경관은 발견되어도 행복도를 제공하지 않습니다." },
		{ text = "그레이트 배리어 리프(대보초)와 지브롤터 암벽은 그래픽 문제로 인해 이 모드에 포함되지 않습니다." },
		{ text = "이 모드 외부에서 생성된 경우에도 여전히 나타날 수 있습니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_LIGHT_BLUE, "Wonder Controls") },
		{ sizeY = LINE_HEIGHT, mode = MODE_LINE },
		{ text = "이 목록에 명령을 추가하려면 아래에 있는 자연경관 제어를 사용하세요." },
		{ text = "각 명령은 지도가 생성될 때 하나 이상의 자연경관을 배치하려고 시도합니다." },
		{ text = "대부분의 자연경관은 배치에 있어 매우 구체적인 요건을 갖추고 있습니다." },
		{ text = "지도의 상태에 따라서는 주어진 유형의 자연경관이 거의 없거나 전혀 없을 수도 있습니다." },
		{ text = "각 명령을 입력할 때마다 지도를 만드는 데 필요한 총 시간이 늘어난다는 점을 기억하세요." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "자연경관 메뉴" },
		{ text = "이 메뉴에는 지도에 추가할 수 있는 자연경관 목록이 포함되어 있습니다." },
		{ text = "이 메뉴를 사용하여 현재의 자연경관을 선택하세요." },
		{ text = "현재의 자연경관은 왼쪽 이미지에 표시됩니다." },
		{ text = "더 많은 자연경관을 보려면 이미지 위에 마우스 포인터를 올려 놓으세요." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "스프링클 추가" },
		{ text = '스프링클은 근처에 무작위 개수의 자원을 추가하여 자연경관을 "향상"시키는 데 사용할 수 있습니다.' },
		{ text = "지도 조건이 허락한다면 해당 자원은 자연경관과 동일한 테마를 갖게 됩니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "셈" },
		{ text = "이는 생성될 자연경관의 수입니다. (가능하다면)" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "지도에 허용되는 각 자연경관의 최대 사본 수" },
		{ text = "이는 지도가 생성될 때 각 자연경관의 사본이 몇 개 허용되는지 표시합니다." },
		{ text = "이 값은 지도 패널에서 변경할 수 있습니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "목록에 추가" },
		{ text = "이렇게 하면 현재 설정을 사용하여 목록에 새 명령이 추가됩니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_LIGHT_BLUE, "목록 제어") },
		{ sizeY = LINE_HEIGHT, mode = MODE_LINE },
		{ text = "이 목록에 명령이 추가되면 편집에 사용되는 여러 가지 제어가 생깁니다." },
		{ text = "목록에서 명령을 삭제하려면 작은 x 버튼을 클릭하세요." },
		{ text = "둥근 버튼을 클릭하여 명령 설정을 자연경관 제어로 복사합니다." },
		{ text = "업데이트 버튼을 클릭하여 자연경관 제어 설정을 해당 명령에 복사합니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "Clear List" },
		{ text = "이렇게 하면 목록에서 모든 명령이 제거됩니다." },
		{ text = "목록이 비어 있으면 이 제어가 나타나지 않습니다." },
		{ },
		{ text = ColorText(COLOR_YELLOW, "이 도움말 텍스트는 목록이 비어 있을 때만 나타납니다.") },
		{ sizeY = 10 },
	};
};

UnitCivText = {
	rootControl = "UnitHelpRoot";
	textControl = "UnitHelpLabel";
	lineControl = "UnitHelpLine";
	defaults = ScrollTextDefaults;
	data = {
		{ sizeY = TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_GREEN, "플레이어 유닛") },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT24", 
			text = ColorText(COLOR_LIGHT_BLUE, "이 목록을 사용하여 이 플레이어의 시작 유닛을 교체하세요.") },
		{ sizeY = LINE_HEIGHT, mode = MODE_LINE },
		{ text = "이 목록이 비어 있으면 이 플레이어는 이 모드 외부에서 생성된 유닛만 받습니다." },
		{ text = "이 목록을 사용하면 이 플레이어는 이 모드에서 생성된 유닛만 받습니다." },
		{ text = "시작 위치의 허용 범위 내에서 적합한 타일이 발견되는 경우에만 유닛이 배치됩니다." },
		{ text = "플레이어의 시작 위치 주변 지역이 채워지면 더 이상 유닛이 추가되지 않습니다." },
		{ text = "이 목록에 나타난 순서대로 유닛이 지도에 배치됩니다." },
		{ text = "공중 전투 유닛, 대상, 화물선과 같은 일부 유닛은 문명이 첫 번째 도시를 획득한 후에 배치됩니다." },
		{ text = "화물선의 경우 첫 번째 도시가 해안 도시여야 합니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_LIGHT_BLUE, "유닛 제어") },
		{ sizeY = LINE_HEIGHT, mode = MODE_LINE },
		{ text = "아래에 있는 제어를 사용하여 이 목록에 명령을 추가하세요." },
		{ text = "각 명령은 지도가 생성될 때 하나 이상의 유닛을 배치하려고 시도합니다." },
		{ text = "각 명령을 입력할 때마다 지도를 만드는 데 필요한 총 시간이 늘어난다는 점을 기억하세요." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "유닛" },
		{ text = "이 메뉴에는 이 문명에 제공될 수 있는 유닛이 포함되어 있습니다." },
		{ text = "게임에서 사용 가능한 모든 유닛을 포함할 수 있습니다." },
		{ text = "스크롤해야 할 단위가 너무 많으므로 나중에 설명할 제어를 사용하여 단위를 필터링할 수 있습니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "셈" },
		{ text = "이는 명령에 의해 추가될 유닛의 수입니다. (가능한 경우)" },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "경험" },
		{ text = "명령에 의해 추가된 모든 유닛의 경험치 레벨입니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "미래 시대의 유닛 표시" },
		{ text = "이 설정을 선택하면 현재 선택된 게임 시대보다 이후 시대의 유닛이 유닛 메뉴에 표시됩니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "다른 문명의 고유한 유닛 표시" },
		{ text = "이 설정을 선택하면 현재 선택된 문명 외의 문명의 고유 유닛이 유닛 메뉴에 표시됩니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "유닛 유형" },
		{ text = "전투를 선택하면 전투 유닛만 유닛 메뉴에 표시됩니다." },
		{ text = "비전투를 선택하면 비전투 유닛만 유닛 메뉴에 표시됩니다." },
		{ text = "둘 다 선택하면 전투 부대와 비전투 부대가 모두 부대 메뉴에 표시됩니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "목록에 추가" },
		{ text = "이렇게 하면 현재 설정을 사용하여 목록에 새 명령이 추가됩니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT24", text = ColorText(COLOR_LIGHT_BLUE, "목록 제어") },
		{ sizeY = LINE_HEIGHT, mode = MODE_LINE },
		{ text = "이 목록에 명령이 추가되면 편집에 사용되는 여러 가지 제어가 생깁니다." },
		{ text = "목록에서 명령을 삭제하려면 작은 x 버튼을 클릭하세요." },
		{ text = "둥근 버튼을 클릭하여 명령 설정을 유닛 제어로 복사합니다." },
		{ text = "업데이트 버튼을 클릭하면 유닛 제어 설정이 해당 명령에 복사됩니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "모든 플레이어에게 목록 복사" },
		{ text = "이 제어는 이 플레이어 유닛 목록을 다른 모든 플레이어 유닛 목록에 복사합니다.." },
		{ text = "이 제어는 목록이 비어 있을 때 사용할 수 있으며, 이 경우 다른 모든 플레이어 유닛 목록이 지워집니다." },
		{ },
		{ sizeY = SUB_TITLE_HEIGHT, font = "TwCenMT22", text = "목록 지우기" },
		{ text = "이렇게 하면 목록에서 모든 명령이 제거됩니다." },
		{ text = "목록이 비어 있으면 이 제어가 나타나지 않습니다." },
		{ },
		{ text = ColorText(COLOR_YELLOW, "이 도움말 텍스트는 목록이 비어 있을 때만 나타납니다.") },
		{ sizeY = 10 },
	};
};

function CreateScrollText(scrollText, manager)
	for _, line in ipairs(scrollText.data) do
		local instance = manager:GetInstance();
		local mode;

		if line.mode ~= nil then
			mode = line.mode;
		else
			mode = scrollText.defaults.mode;
		end

		local control = instance[scrollText.lineControl];

		if control ~= nil then
			if mode == MODE_LINE then
				control:SetHide(false);
			else
				control:SetHide(true);
			end
		end

		local control = instance[scrollText.textControl];

		if control ~= nil then
			if mode == MODE_TEXT then
				control:SetHide(false);

				if line.text ~= nil then
					control:SetText(Locale.ConvertTextKey(line.text));
				else
					control:SetText(Locale.ConvertTextKey(scrollText.defaults.text));
				end

				if line.anchor ~= nil then
					control:SetAnchor(line.anchor);
				else
					control:SetAnchor(scrollText.defaults.anchor);
				end

				if line.offsetX ~= nil then
					control:SetOffsetX(line.offsetX);
				else
					control:SetOffsetX(scrollText.defaults.offsetX);
				end

				if line.offsetY ~= nil then
					control:SetOffsetY(line.offsetY);
				else
					control:SetOffsetY(scrollText.defaults.offsetY);
				end

				if line.font ~= nil then
					control:SetFontByName(line.font);
				else
					control:SetFontByName(scrollText.defaults.font);
				end

			else
				control:SetHide(true);
			end
		end

		local control = instance[scrollText.rootControl];

		if control ~= nil then
			if line.sizeX ~= nil then
				control:SetSizeX(line.sizeX);
			else
				control:SetSizeX(scrollText.defaults.sizeX);
			end

			if line.sizeY ~= nil then
				control:SetSizeY(line.sizeY);
			else
				control:SetSizeY(scrollText.defaults.sizeY);
			end
		end
	end
end





