
-- AdvancedSetup - Really Advanced Setup Mod의 일부
-- 원본 게임 파일을 대폭 수정한 버전입니다.
-- 대부분의 코드가 변경되었거나 다른 파일로 이동되었습니다.

-------------------------------------------------
-- Advanced Settings Screen
-------------------------------------------------

-- print("AdvancedSetUp *************************************************************************************************");

include("GTAS_Constants");
include("GTAS_Utilities");
include("GTAS_DataManager");

-------------------------------------------------------------------------------
-- Top Menu Bar Controls
-------------------------------------------------------------------------------

function OnCivilizations()
	GlobalData.currentMainPanel = CIV_MAIN_PANEL;

    Controls.CivsHighlight:SetHide(false);
    Controls.CivBonusHighlight:SetHide(true);
    Controls.MapBonusHighlight:SetHide(true);
    Controls.MapHighlight:SetHide(true);
    Controls.GameHighlight:SetHide(true);

    Controls.CivMainPanel:SetHide(false);
    Controls.CivBonusMainPanel:SetHide(true);
    Controls.MapBonusMainPanel:SetHide(true);
    Controls.MapMainPanel:SetHide(true);
    Controls.GameMainPanel:SetHide(true);
end
Controls.CivsButton:RegisterCallback(Mouse.eLClick, OnCivilizations);

function OnCivBonus()
	GlobalData.currentMainPanel = CIV_BONUS_MAIN_PANEL;

    Controls.CivsHighlight:SetHide(true);
    Controls.CivBonusHighlight:SetHide(false);
    Controls.MapBonusHighlight:SetHide(true);
    Controls.MapHighlight:SetHide(true);
    Controls.GameHighlight:SetHide(true);

    Controls.CivMainPanel:SetHide(true);
    Controls.CivBonusMainPanel:SetHide(false);
    Controls.MapBonusMainPanel:SetHide(true);
    Controls.MapMainPanel:SetHide(true);
    Controls.GameMainPanel:SetHide(true);
end
Controls.CivBonusButton:RegisterCallback(Mouse.eLClick, OnCivBonus);
LuaEvents.GTAS_OpenCivBonusPanel.Add(OnCivBonus);

function OnMapBonus()
	GlobalData.currentMainPanel = MAP_BONUS_MAIN_PANEL;

    Controls.CivsHighlight:SetHide(true);
    Controls.CivBonusHighlight:SetHide(true);
    Controls.MapBonusHighlight:SetHide(false);
    Controls.MapHighlight:SetHide(true);
    Controls.GameHighlight:SetHide(true);

    Controls.CivMainPanel:SetHide(true);
    Controls.CivBonusMainPanel:SetHide(true);
    Controls.MapBonusMainPanel:SetHide(false);
    Controls.MapMainPanel:SetHide(true);
    Controls.GameMainPanel:SetHide(true);
end
Controls.MapBonusButton:RegisterCallback(Mouse.eLClick, OnMapBonus);
LuaEvents.GTAS_OpenMapBonusPanel.Add(OnMapBonus);

function OnMap()
	GlobalData.currentMainPanel = MAP_MAIN_PANEL;

    Controls.CivsHighlight:SetHide(true);
    Controls.CivBonusHighlight:SetHide(true);
    Controls.MapBonusHighlight:SetHide(true);
    Controls.MapHighlight:SetHide(false);
    Controls.GameHighlight:SetHide(true);

    Controls.CivMainPanel:SetHide(true);
    Controls.CivBonusMainPanel:SetHide(true);
    Controls.MapBonusMainPanel:SetHide(true);
    Controls.MapMainPanel:SetHide(false);
    Controls.GameMainPanel:SetHide(true);
end
Controls.MapButton:RegisterCallback(Mouse.eLClick, OnMap);
LuaEvents.GTAS_OpenMapPanel.Add(OnMap);

function OnGame()
	GlobalData.currentMainPanel = GAME_MAIN_PANEL;

    Controls.CivsHighlight:SetHide(true);
    Controls.CivBonusHighlight:SetHide(true);
    Controls.MapBonusHighlight:SetHide(true);
    Controls.MapHighlight:SetHide(true);
    Controls.GameHighlight:SetHide(false);

    Controls.CivMainPanel:SetHide(true);
    Controls.CivBonusMainPanel:SetHide(true);
    Controls.MapBonusMainPanel:SetHide(true);
    Controls.MapMainPanel:SetHide(true);
    Controls.GameMainPanel:SetHide(false);
end
Controls.GameButton:RegisterCallback(Mouse.eLClick, OnGame);

-------------------------------------------------------------------------------
function OnResetAll()
	LuaEvents.GTAS_ResetCivPanel();
	LuaEvents.GTAS_ResetGamePanel();
	LuaEvents.GTAS_ResetMapBonusPanel();
	LuaEvents.GTAS_ResetMapPanel();

	if GlobalData.currentMainPanel == CIV_MAIN_PANEL then
		LuaEvents.GTAS_BuildCivPanel();
	elseif GlobalData.currentMainPanel == CIV_BONUS_MAIN_PANEL then
		LuaEvents.GTAS_BuildCivBonusPanel();
	elseif GlobalData.currentMainPanel == MAP_BONUS_MAIN_PANEL then
		LuaEvents.GTAS_BuildMapBonusPanel();
	elseif GlobalData.currentMainPanel == MAP_MAIN_PANEL then
		LuaEvents.GTAS_BuildMapPanel();
	elseif GlobalData.currentMainPanel == GAME_MAIN_PANEL then
		LuaEvents.GTAS_BuildGamePanel();
	end
end
Controls.ResetAllButton:RegisterCallback(Mouse.eLClick, OnResetAll);

-------------------------------------------------------------------------------
function OnBack()
	print("OnBack --------------------");
	SaveData();
    UIManager:DequeuePopup(ContextPtr);
end
Controls.BackButton:RegisterCallback(Mouse.eLClick, OnBack);

-------------------------------------------------------------------------------
function OnStart()
	print("OnStart --------------------");
    SaveData();
	SetPreGameValues();
	Events.SerialEventStartGame();
	UIManager:SetUICursor(1);
end
Controls.StartButton:RegisterCallback(Mouse.eLClick, OnStart);


----------------------------------------------------------------
function ValidateControls()
	isValid, isWarning, helpText = ValidateStart();
	Controls.StartButton:SetDisabled(not isValid);
	Controls.StartButton:LocalizeAndSetToolTip(helpText);

	if isValid then
		if isWarning then
			Controls.StartLabel:SetText("[COLOR0:195:180:60:255]게임 시작[ENDCOLOR]");
		else
			Controls.StartLabel:SetText("[COLOR_BEIGE]게임 시작[ENDCOLOR]");
		end
	else
		Controls.StartLabel:SetText("[COLOR0:210:70:70:255]게임 시작[ENDCOLOR]");
	end

	if MapData.isRandomWorldSize then
		Controls.CivsButton:SetText("?  플레이어");
	else
		Controls.CivsButton:SetText(string.format("플레이어 %d명", SlotData:GetSlotCount()));
	end
end
LuaEvents.GTAS_ValidateControls.Add(ValidateControls)

-------------------------------------------------------------------------------------------------------
function ValidateStart()
	local isValid = true;
	local isWarning = false;
	local helpText = "";
	local newline = "";

	function AddHelpText(text)
		helpText = helpText .. newline .. text;
		newline = "[NEWLINE]";
	end

-- 심각한 경고는 여기에 있습니다. -----------------------------------------------------------------
-- 이 중 하나가 발생하면 게임을 시작할 수 없습니다.

	local humanSlot = SlotData:GetSlot(0);

	if humanSlot ~= nil and not MapData.isRandomWorldSize then
		isValid = false;

		-- 팀이 2개 이상 있는지 확인하세요.
		for _, slot in SlotData:AISlotList() do
			if slot.team ~= humanSlot.team then
				isValid = true;
				break;
			end
		end

		if not isValid then
			AddHelpText(Locale.ConvertTextKey("최소 2개의 팀이 있어야 합니다!"));
		end
	end

	-- 활동 중인 문명을 세어보세요.
	local activeCivs = 0;
	for civType, _ in pairs(MapData.activeCivs) do
		if MapData.activeCivs[civType] then
			activeCivs = activeCivs + 1;
		end
	end

	-- 적어도 하나의 활성화된 문명이 있는지 확인하세요.
	if activeCivs == 0 then
		isValid = false;
		AddHelpText("최소한 하나의 문명이 활성화되어 있어야 합니다!");
	end

-- 약한 경고는 여기에 있습니다. ---------------------------------------------------------------------
-- 이러한 경고 중 하나가 발생하더라도 게임을 시작할 수 있습니다. (시작이 유효한 경우에만 발생합니다.)

	-- 활동하는 문명이 충분한가요?
	if isValid then
		if activeCivs == 1 then
			isWarning = true;
			AddHelpText("활성화된 문명이 하나뿐입니다. 이로 인해 게임에 중복된 문명이 등장하게 됩니다!");
		elseif not MapData.isRandomWorldSize and activeCivs < SlotData:GetSlotCount() then
			isWarning = true;
			AddHelpText("플레이어보다 활동하는 문명의 수가 적습니다. 이로 인해 게임에 중복된 문명이 등장하게 됩니다!");
		end

		if MapData.disableAllNaturalWonders then
			isWarning = true;
			AddHelpText("모든 자연 불가사의가 비활성화되었습니다!");
		end
		
		if GameData.disableNukes then
			isWarning = true;
			AddHelpText("모든 핵무기가 비활성화되었습니다!");
		end
	end

	-- 경고가 없다면 플레이어에게 게임을 시작해도 괜찮다는 것을 알려주세요.
	if helpText == "" then
		helpText = "현재 설정을 사용하여 게임을 시작합니다.";
	end

	return isValid, isWarning, helpText;
end

----------------------------------------------------------------
function InputHandler(uiMsg, wParam, lParam)
	if uiMsg == KeyEvents.KeyDown then
		if wParam == Keys.VK_ESCAPE then
		    OnBack();
        	return true;
		elseif wParam == Keys.C then
			UIManager:QueuePopup(Controls.Civilopedia, PopupPriority.HallOfFame);
        	return true;
		end
	end

	return false;
end
ContextPtr:SetInputHandler(InputHandler);

----------------------------------------------------------------
function StartMod()
	local version = Modding.GetActivatedModVersion(MOD_ID) or "알 수 없음";
	
	print(string.format("(진짜 고급 설정)  버전: %s  -------------------------------------------------------------------------------", version));

	Controls.MainTitle:SetToolTipString(string.format("General Tso의 진짜 고급 설정 모드. 버전: %s", version));

	-- DataManager에 데이터를 로드합니다.
	LoadData();
	
	if GlobalData.currentMainPanel == CIV_BONUS_MAIN_PANEL then
		OnCivBonus();
	elseif GlobalData.currentMainPanel == MAP_BONUS_MAIN_PANEL then
		OnMapBonus();
	elseif GlobalData.currentMainPanel == MAP_MAIN_PANEL then
		OnMap();
	elseif GlobalData.currentMainPanel == GAME_MAIN_PANEL then
		OnGame();
	else
		OnCivilizations();
	end
end


-- 모드 시작 -------------------------------------------------------------------------------------------------------------------------------
StartMod();




