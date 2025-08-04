-------------------------------------------------
-- Select Civilization
-------------------------------------------------
CivilopediaControl = "/FrontEnd/MainMenu/Other/Civilopedia";-- MUST be before include( "PopulateUniques" ) to enable pedia callback
include("PopulateUniques"); local InitializePopulateUniques = InitializePopulateUniques; local PopulateUniquesForSelectCivilization = PopulateUniquesForSelectCivilization;
include("InstanceManager.lua")
include("InfoTooltipInclude.lua")
include("IconSupport")
------------------------------------------------
-- Global Variables
------------------------------------------------
local g_bIsScenario = false
local g_bWasScenario = true
local g_bRefreshCivs = false
-----------------
-- Pedia Callback
-----------------
local getPedia;
local function getPediaB( ... )
    Events.SearchForPediaEntry( ... )
end
local function getPediaA( ... )
    UIManager:QueuePopup( LookUpControl( CivilopediaControl ), PopupPriority.eUtmost );
    getPedia = getPediaB;
    getPedia( ... )
end
getPedia = CivilopediaControl and getPediaA;
-------------------------------------------------
-------------------------------------------------
function OnBack()
    UIManager:DequeuePopup( ContextPtr );
    ContextPtr:SetHide( true );
end
Controls.BackButton:RegisterCallback( Mouse.eLClick, OnBack );
 
-- JFD_IsUsingCivilopedia
function JFD_IsUsingCivilopedia()
    local civilopediaModID = "bbaaa06e-3dcf-4480-b9ed-ddea6200e19b"
    local pietyModID = "eea66053-7579-481a-bb8d-2f3959b59974"
    for _, mod in pairs(Modding.GetActivatedMods()) do
        if (mod.ID == culDivModID) or (mod.ID == pietyModID) then
            return true
        end
    end
    return false
end
local isUsingCivilopedia = JFD_IsUsingCivilopedia()
 
-- JFD_IsUsingCulDiv
function JFD_IsUsingCulDiv()
    local culDivModID = "31a31d1c-b9d7-45e1-842c-23232d66cd47"
    for _, mod in pairs(Modding.GetActivatedMods()) do
        if (mod.ID == culDivModID) then
            return true
        end
    end
    return false
end
local isUsingCulDiv = JFD_IsUsingCulDiv()
local isUsingEUI = false

function SortByLeaderName(a, b)
    return Locale.Compare(a.LeaderDesc, b.LeaderDesc) < 0
end
-----------------
-- SORT FUNCTIONS
-----------------
local g_CurrentSortOption = 1

g_SortOptions = {
	{"Civilization",	InitCivSelection},
	{"Culture Type",	InitCivSelection},}
function RefreshSortOptions()
	local g_SortByPullDown = Controls.SortByPullDown
	g_SortByPullDown:ClearEntries()
	for i, v in ipairs(g_SortOptions) do
		local Sort_ControlTable = {}
		g_SortByPullDown:BuildEntry("InstanceOne", Sort_ControlTable)
		Sort_ControlTable.Button:LocalizeAndSetText(v[1])
		Sort_ControlTable.Button:LocalizeAndSetToolTip(nil)
		Sort_ControlTable.Button:RegisterCallback(Mouse.eLClick, 
		function()
			g_SortByPullDown:GetButton():LocalizeAndSetText(v[1])
			g_CurrentSortOption = i
			g_bRefreshCivs = true
			InitCivSelection()
		end)
		if (not isUsingCulDiv) then
			Sort_ControlTable.Button:SetHide(true)
			Controls.SortByPullDown:SetDisabled(true)
		else
			Sort_ControlTable.Button:SetHide(false)
			Controls.SortByPullDown:SetDisabled(false)
		end
	end
	g_SortByPullDown:CalculateInternals()
	g_SortByPullDown:GetButton():LocalizeAndSetText(g_SortOptions[g_CurrentSortOption][1])
	g_SortByPullDown:GetButton():LocalizeAndSetToolTip(nil)
end
RefreshSortOptions()
Events.AfterModsActivate.Add(function()
    g_bRefreshCivs = true
	print("mod activate")
    isUsingCulDiv = JFD_IsUsingCulDiv()
    isUsingCivilopedia = JFD_IsUsingCivilopedia()
	RefreshSortOptions()
end)
----------------------------------------------------------------        
----------------------------------------------------------------        
function ShowHideHandler(bIsHide)
    local isWBMap = IsWBMap(PreGame.GetMapScript())
    g_bIsScenario = (PreGame.GetLoadWBScenario() and isWBMap)
    if(g_bWasScenario ~= g_bIsScenario) then
        g_bRefreshCivs = true
    end
    g_bWasScenario = g_bIsScenario
    if( not bIsHide and (isWBMap or g_bRefreshCivs)) then
        g_bRefreshCivs = false
        Controls.Stack:DestroyAllChildren()
        InitCivSelection()
    end
end
ContextPtr:SetShowHideHandler(ShowHideHandler)
----------------------------------------------------------------        
----------------------------------------------------------------
function IsWBMap(file)
    return Path.UsesExtension(file,".Civ5Map")
end
----------------------------------------------------------------        
-- Input processing
----------------------------------------------------------------        
function InputHandler( uiMsg, wParam, lParam )
    if uiMsg == KeyEvents.KeyDown then
        if wParam == Keys.VK_ESCAPE then
            OnBack()
            return true
        end
    end
end
ContextPtr:SetInputHandler(InputHandler)
----------------------------------------------------------------        
-- set the Civ
----------------------------------------------------------------
local tGeneratedCivs = {}
local civSelectedID = nil
local cultureSelectedID = nil
local leaderSelectedID = nil
function LeaderSelected(civID, scenarioPlayerID)
    if (not g_bIsScenario) then
        if (civID == -1 and civSelectedID > -1) then
            local civ = GameInfo.Civilizations[civSelectedID]
            local sCivGroup = civ.DerivativeCiv or civ.Type
            local civilizations = {}
            local count = 1
            for row in GameInfo.Civilizations() do
                local s_LoopCivGroup = row.DerivativeCiv or row.Type
 
                if sCivGroup == s_LoopCivGroup then
                    civilizations[count] = row.ID
                    count = count + 1
                end
            end
            civID = civilizations[math.random(#civilizations)]
        elseif civID == -1 then
            local civilizations = {}
            local count = 1
            for row in GameInfo.Civilizations("Playable = 1") do
                civilizations[count] = row.ID
                count = count + 1
            end
            civID = civilizations[math.random(#civilizations)]
        end
    end
    PreGame.SetCivilization(0, civID)
    if g_bIsScenario then
        UI.MoveScenarioPlayerToSlot( scenarioPlayerID, 0 )
        local playerList = UI.GetMapPlayers(PreGame.GetMapScript())
        if(playerList ~= nil) then
            local player = playerList[scenarioPlayerID + 1]
            if(player ~= nil) then
                PreGame.SetHandicap(0, player.DefaultHandicap)
            end
        end
    end
    OnBack()
end
 
function CivilizationSelected(civID, scenarioPlayerID)
    civSelectedID = civID
    AddLeaderEntry(civID)
    ShowHideHandler(false)
end

function CultureSelected(cultureID)
    cultureSelectedID = cultureID
    AddLeaderEntry(cultureID)
    ShowHideHandler(false)
end
 
 function CultureSelectedRandom(cultureID)
	local civID = -1
	local culture = GameInfo.JFD_CultureTypes[cultureID]
	local civilizations = {}
    local count = 1
    for row in GameInfo.Civilization_JFD_CultureTypes("CultureType = '" .. culture.Type .. "'") do
        civilizations[count] = GameInfo.Civilizations[row.CivilizationType].ID
        count = count + 1
    end
    civID = civilizations[math.random(#civilizations)]
	LeaderSelected(civID)
end

function CivSelectedRandom(civID)
	civID = -1
	civSelectedID = -1
	LeaderSelected(civID, scenarioPlayerID)
end
 
function LeaderSelectedRandom(civID)
    civSelectedID = civID
    civID = -1
    LeaderSelected(civID, scenarioPlayerID)
end
 
function AddRandomCivilizationEntry()
    ------------------------------------------------------------------------------------------------
    -- set up the random slot
    ------------------------------------------------------------------------------------------------
    local controlTable = {}
    ContextPtr:BuildInstanceForControl("ItemInstance", controlTable, Controls.Stack)
    controlTable.Button:SetVoid1(-1)
    controlTable.Button:RegisterCallback(Mouse.eLClick, CivSelectedRandom)
    
    controlTable.CivDesc:LocalizeAndSetText("무작위 문명")
    IconHookup(22, 64, "LEADER_ATLAS", controlTable.Portrait)
end
 
 function AddCultureEntry(cultureID, scenarioCivID)
    local cultureType = GameInfo.JFD_CultureTypes[cultureID]
	local controlTable = {};
    ContextPtr:BuildInstanceForControl("ItemInstance", controlTable, Controls.Stack)
    controlTable.Button:SetVoid1(cultureID)
    controlTable.Button:SetVoid2(scenarioCivID)
    controlTable.Button:RegisterCallback(Mouse.eLClick, CultureSelected)
    IconHookup(cultureType.PortraitIndex, 64, cultureType.IconAtlas, controlTable.Portrait)
    controlTable.CivDesc:LocalizeAndSetText(cultureType.ShortDescription)
    if cultureID == cultureSelectedID then
        controlTable.CivHL:SetHide(false)
    end
    return controlTable
end

function AddCivilizationEntry(civ, scenarioCivID, leaderHoverID)
    local iCiv = civ.ID
    local tCiv = GameInfo.Civilizations[iCiv]
    local sCivGroup = tCiv.DerivativeCiv
    if sCivGroup == nil then sCivGroup = tCiv.Type end
    if tGeneratedCivs[sCivGroup] then return end
    local tMasterCiv = GameInfo.Civilizations[sCivGroup]
    if tMasterCiv == nil then tMasterCiv = tCiv end
 
    local sGroupName = Locale.ConvertTextKey(sCivGroup)
    if sGroupName == sCivGroup then
        sGroupName = Locale.ConvertTextKey(tMasterCiv.ShortDescription)
    end
 
    local controlTable = {};
    ContextPtr:BuildInstanceForControl("ItemInstance", controlTable, Controls.Stack)
    controlTable.Button:SetVoid1(tMasterCiv.ID)
    controlTable.Button:SetVoid2(scenarioCivID)
    controlTable.Button:RegisterCallback(Mouse.eLClick, CivilizationSelected)
    IconHookup(tMasterCiv.PortraitIndex, 64, tMasterCiv.IconAtlas, controlTable.Portrait)
    controlTable.CivDesc:SetText(sGroupName)
    if tMasterCiv.ID == civSelectedID then
        controlTable.CivHL:SetHide(false)
    end
    tGeneratedCivs[sCivGroup] = true
    return controlTable
end
 
local leaderManager = InstanceManager:new("LeaderInstance", "LeaderButton", Controls.LeaderStack)
function AddLeaderEntry(civID)
	local leaderTable = {}
	if g_CurrentSortOption == 2 then
		local culture = GameInfo.JFD_CultureTypes[civID]
		-- Add the Master
		for civilization in GameInfo.Civilization_JFD_CultureTypes("CultureType = '" .. culture.Type .. "'") do
			for row in GameInfo.Civilization_Leaders("CivilizationType = '" .. civilization.CivilizationType .. "'") do
				local leaderType = row.LeaderheadType
				local leaderDesc = GameInfo.Leaders[leaderType].Description
				table.insert(leaderTable, {
				Civilization = row.CivilizationType,
				LeaderType = leaderType,
				LeaderDesc = Locale.Lookup(leaderDesc)});
			end
		end
		
		leaderManager:ResetInstances()
		table.sort(leaderTable, SortByLeaderName)
		local leaderInstance = leaderManager:GetInstance()
		leaderInstance.LeaderButton:SetVoid1(civID)
		leaderInstance.LeaderButton:RegisterCallback(Mouse.eLClick, CultureSelectedRandom)
		leaderInstance.LeaderBonusTitle:LocalizeAndSetText("무작위 지도자 - {1_CivName}", culture.ShortDescription);
		leaderInstance.LeaderBonusDescription:LocalizeAndSetText("TXT_KEY_RANDOM_LEADER_HELP")
		leaderInstance.CivIcon:SetHide(true)
		IconHookup(22, 128, "LEADER_ATLAS", leaderInstance.LeaderPortrait)
	else
	
		local tMasterCiv = GameInfo.Civilizations[civID]
		local sCivGroup = tMasterCiv.DerivativeCiv
		if sCivGroup == nil then sCivGroup = tMasterCiv.Type end
	
		local sGroupName = tMasterCiv.DerivativeCiv
		if sGroupName == nil then
			sGroupName = Locale.ConvertTextKey(tMasterCiv.ShortDescription)
		else
			if Locale.ConvertTextKey(sGroupName) == sGroupName then
				sGroupName = Locale.ConvertTextKey(tMasterCiv.ShortDescription)
			else
				sGroupName = Locale.ConvertTextKey(sGroupName)
			end
		end
		
		-- Add the Master
		for row in GameInfo.Civilization_Leaders("CivilizationType = '" .. tMasterCiv.Type .. "'") do
			local leaderType = row.LeaderheadType
			local leaderDesc = GameInfo.Leaders[leaderType].Description
			table.insert(leaderTable, {
			Civilization = row.CivilizationType,
			LeaderType = leaderType,
			LeaderDesc = Locale.Lookup(leaderDesc)});
		end
	
		for otherCiv in GameInfo.Civilizations("DerivativeCiv = '" .. sCivGroup .. "'") do
			for row in GameInfo.Civilization_Leaders("CivilizationType = '" .. otherCiv.Type .. "'") do
				if row.CivilizationType ~= tMasterCiv.Type then
					local leaderType = row.LeaderheadType
					local leaderDesc = GameInfo.Leaders[leaderType].Description
					table.insert(leaderTable, {
					Civilization = row.CivilizationType,
					LeaderType = leaderType,
					LeaderDesc = Locale.Lookup(leaderDesc)})
				end
			end
		end
		
		leaderManager:ResetInstances()
		table.sort(leaderTable, SortByLeaderName)
		local leaderInstance = leaderManager:GetInstance()
		leaderInstance.LeaderButton:SetVoid1(tMasterCiv.ID)
		leaderInstance.LeaderButton:RegisterCallback(Mouse.eLClick, LeaderSelectedRandom)
		leaderInstance.LeaderBonusTitle:LocalizeAndSetText("무작위 지도자 - {1_CivName}", sGroupName);
		leaderInstance.LeaderBonusDescription:LocalizeAndSetText("TXT_KEY_RANDOM_LEADER_HELP")
		leaderInstance.CivIcon:SetHide(true)
		IconHookup(22, 128, "LEADER_ATLAS", leaderInstance.LeaderPortrait)
    end
	for _, v in ipairs(leaderTable) do
        local leaderInstance = leaderManager:GetInstance()
        local leader = GameInfo.Leaders[v.LeaderType]
        local leaderCiv
        for row in GameInfo.Civilization_Leaders("LeaderheadType = '" .. leader.Type .. "'") do
            leaderCiv = GameInfo.Civilizations[row.CivilizationType]
            break
        end
        leaderInstance.LeaderButton:SetVoid1(leaderCiv.ID)
        leaderInstance.LeaderButton:SetVoid2(scenarioCivID)
        leaderInstance.LeaderButton:RegisterCallback(Mouse.eLClick, LeaderSelected)
        local traitType = nil
        for leaderTrait in GameInfo.Leader_Traits("LeaderType = '" .. leader.Type .. "'") do
            traitType = leaderTrait.TraitType
            break
        end
        local civilization = GameInfo.Civilizations[v.Civilization]
        local trait = GameInfo.Traits[traitType]
        IconHookup(leader.PortraitIndex, 128, leader.IconAtlas, leaderInstance.LeaderPortrait)
        IconHookup(civilization.PortraitIndex, 45, civilization.IconAtlas, leaderInstance.CivIconImg)
        leaderInstance.CivIconImg:LocalizeAndSetToolTip(civilization.Description)
        if isUsingCulDiv then
            for row in GameInfo.Civilization_JFD_CultureTypes("CivilizationType = '" .. v.Civilization .. "'") do
                local culture = GameInfo.JFD_CultureTypes[row.CultureType]
                local cultureTT = Locale.ConvertTextKey(culture.ShortDescription)
                for row in GameInfo.JFD_CultureType_StartingBonuses("CultureType = '" .. culture.Type .. "'") do
                    cultureTT = cultureTT .. "[NEWLINE][NEWLINE]" .. Locale.ConvertTextKey(row.Description)
                    if userSettingGoldenAgeBonuses then
                        cultureTT = cultureTT .. "[NEWLINE][NEWLINE]" .. Locale.ConvertTextKey(row.Description .. "_GA")
                    end
                    break
                end
                leaderInstance.CultureIcon:SetHide(false)
                IconHookup(culture.PortraitIndex, 45, culture.IconAtlas, leaderInstance.CultureIconImg)
                leaderInstance.CultureIconImg:LocalizeAndSetToolTip(cultureTT)
                break
            end
        end
        local pedia = CivilopediaControl and (leader.Description)
        pedia = Locale.ConvertTextKey(pedia)
        leaderInstance.LeaderPortrait:RegisterCallback(Mouse.eRClick, function() getPedia(pedia)end)
 
        local pedia = CivilopediaControl and (leaderCiv.ShortDescription)
        pedia = Locale.ConvertTextKey(pedia)
        leaderInstance.CivIconImg:RegisterCallback(Mouse.eRClick, function() getPedia(pedia) end)
 
        leaderInstance.LeaderBonusTitle:LocalizeAndSetText(trait.ShortDescription)
        local title = Locale.ConvertTextKey(leader.Description);
        title = string.format("%s (%s)", title, Locale.ConvertTextKey(trait.ShortDescription))
        leaderInstance.LeaderBonusTitle:SetText(title);                
        leaderInstance.LeaderBonusDescription:LocalizeAndSetText(trait.Description)
        leaderInstance.LeaderBonusDescription:SetWrapWidth(440)
        leaderInstance.UniqueStack:SetOffsetVal(30,0)
 
        local uniqueItems = {}
        local count = 1
        for row in GameInfo.Civilization_UnitClassOverrides("CivilizationType = '" .. leaderCiv.Type .. "'") do
            local unitType = row.UnitType
            if unitType then
                local isHidden = false
                if isUsingCivilopedia then
                    for otherRow in GameInfo.JFD_Civilopedia_HideFromPedia("Type = '" .. unitType .. "'") do
                        isHidden = true
                    end
                end
                if (not isHidden) then
                    local unit = GameInfo.Units[unitType]
                    uniqueItems[count] = {}
                    uniqueItems[count].Item = unit
                    if isUsingEUI then
                        uniqueItems[count].ItemTT = GetHelpTextForUnit(unit.ID, true)
                    end
                    count = count + 1
                end
            end
        end
        for row in GameInfo.Civilization_BuildingClassOverrides("CivilizationType = '" .. leaderCiv.Type .. "'") do
            local buildingType = row.BuildingType
            if buildingType then
                local isHidden = false
                if isUsingCivilopedia then
                    for otherRow in GameInfo.JFD_Civilopedia_HideFromPedia("Type = '" .. buildingType .. "'") do
                        isHidden = true
                    end
                end
                if (not isHidden) then
                    local building = GameInfo.Buildings[buildingType]
                    if building.GreatWorkCount > -1 then
                        uniqueItems[count] = {}
                        uniqueItems[count].Item = building
                        if isUsingEUI then
                            uniqueItems[count].ItemTT = GetHelpTextForBuilding(building.ID, true)
                        end
                        count = count + 1
                    end
                end
            end
        end
        for row in GameInfo.Improvements("CivilizationType = '" .. leaderCiv.Type .. "'") do
            local improvementType = row.Type
            if improvementType then
                local isHidden = false
                if isUsingCivilopedia then
                    for otherRow in GameInfo.JFD_Civilopedia_HideFromPedia("Type = '" .. improvementType .. "'") do
                        isHidden = true
                    end
                end
                if (not isHidden) then
                    local improvement = GameInfo.Improvements[improvementType]
                    uniqueItems[count] = {}
                    uniqueItems[count].Item = improvement
                    if isUsingEUI then
                        uniqueItems[count].ItemTT = GetHelpTextForImprovement(improvement.ID, true)
                    end
                    count = count + 1
                end
            end
        end
        for buttonNum = 1, 4 do
            local buttonName = "B"..tostring(buttonNum);
            local buttonFrameName = "LeaderBF"..tostring(buttonNum)
            local thisButton = leaderInstance[buttonName]
            local thisButtonFrame = leaderInstance[buttonFrameName]
            if(thisButton and thisButtonFrame) then
                if uniqueItems[buttonNum] then
                    local uniqueItem = uniqueItems[buttonNum].Item
                    local uniqueItemTT = uniqueItems[buttonNum].ItemTT
                    thisButton:SetHide(false)
                    thisButtonFrame:SetHide(false)
                    IconHookup(uniqueItem.PortraitIndex, 64, uniqueItem.IconAtlas, thisButton)
                    thisButton:LocalizeAndSetToolTip(uniqueItem.Description)
                    if uniqueItemTT then
                        thisButton:LocalizeAndSetToolTip(uniqueItemTT)
                    end
                    local pedia = CivilopediaControl and (uniqueItem.Description)
                    if pedia then
                        thisButton:RegisterCallback(Mouse.eRClick, function() getPedia(pedia)end)
                    end
                    if buttonNum == 3 then
                       leaderInstance.LeaderBonusDescription:SetWrapWidth(390)
                       leaderInstance.UniqueStack:SetOffsetVal(-10,0)
                    end
                else
                    thisButton:SetHide(true)
                    thisButtonFrame:SetHide(true)
                end
            end
        end
        leaderInstance.UniqueStack:ReprocessAnchoring()
    end
    Controls.LeaderStack:CalculateSize()
    Controls.LeaderStack:ReprocessAnchoring()
    Controls.LeaderScrollPanel:CalculateInternalSize()
end
 
function InitCivSelection()
    if g_CurrentSortOption == 2 and isUsingCulDiv then
		Controls.Stack:DestroyAllChildren()
		AddRandomCivilizationEntry()
		for row in GameInfo.JFD_CultureTypes() do	
			local addEntry = false
			for civilization in GameInfo.Civilization_JFD_CultureTypes("CultureType = '" .. row.Type .. "'") do
				addEntry = true
			end
			if addEntry then
				AddCultureEntry(row.ID)
			end
		end	
		Controls.Stack:CalculateSize()
		Controls.Stack:ReprocessAnchoring()
		Controls.ScrollPanel:CalculateInternalSize()	
	else
		Controls.Stack:DestroyAllChildren()
		local traitsQuery = DB.CreateQuery([[SELECT Description, ShortDescription FROM Traits inner join
		Leader_Traits ON Traits.Type = Leader_Traits.TraitType
		WHERE Leader_Traits.LeaderType = ? LIMIT 1]]);
		-- local populateUniqueBonuses = PopulateUniqueBonuses_CreateCached()
																																																		
		if(g_bIsScenario) then
			local civList = UI.GetMapPlayers(PreGame.GetMapScript())
			if(civList ~= nil) then
				local sql = [[  SELECT
					Civilizations.ID,
					Civilizations.Type,
					Civilizations.Description,
					Civilizations.ShortDescription as ShortDescription,
					Civilizations.PortraitIndex,
					Civilizations.IconAtlas,
					Leaders.Type AS LeaderType,
					Leaders.Description as LeaderDescription,
					Leaders.PortraitIndex as LeaderPortraitIndex,
					Leaders.IconAtlas as LeaderIconAtlas
					FROM Civilizations, Leaders, Civilization_Leaders WHERE
					Civilizations.ID = ? AND
					Civilizations.Type = Civilization_Leaders.CivilizationType AND
					Leaders.Type = Civilization_Leaders.LeaderheadType
					LIMIT 1
				]];
														
				local scenarioCivQuery = DB.CreateQuery(sql)
				local civEntries = {};
				for i, v in pairs(civList) do
					if(v.Playable) then
						for row in scenarioCivQuery(v.CivType) do
							table.insert(civEntries, {Locale.Lookup(row.ShortDescription), row, i - 1})
						end
					end
				end
				-- Sort by leader description;
				table.sort(civEntries, function(a, b) return Locale.Compare(a[1], b[1]) == -1 end)
				
				tGeneratedCivs = {}
				for i,v in ipairs(civEntries) do
					local row = v[2]
					local scenarioCivID = v[3]
					AddCivilizationEntry(row.CivilizationID, scenarioCivID)
				end    
			end
		else
			AddRandomCivilizationEntry()
			local civEntries = {}
			local sql = [[  SELECT
			Civilizations.ID,
			Civilizations.Type,
			Civilizations.Description,
			Civilizations.ShortDescription as ShortDescription,
			Civilizations.PortraitIndex,
			Civilizations.IconAtlas,
			Civilizations.DerivativeCiv,
			Leaders.Type AS LeaderType,
			Leaders.Description as LeaderDescription,
			Leaders.PortraitIndex as LeaderPortraitIndex,
			Leaders.IconAtlas as LeaderIconAtlas
			FROM Civilizations, Leaders, Civilization_Leaders WHERE
			Civilizations.Type = Civilization_Leaders.CivilizationType AND
			Leaders.Type = Civilization_Leaders.LeaderheadType AND
			Civilizations.Playable = 1]];
			for row in DB.Query(sql) do
				local sGroupName = row.DerivativeCiv
				if sGroupName == nil then
					sGroupName = Locale.ConvertTextKey(row.ShortDescription)
				else
					if Locale.ConvertTextKey(sGroupName) == sGroupName then
						sGroupName = Locale.ConvertTextKey(row.ShortDescription)
					else
						sGroupName = Locale.ConvertTextKey(sGroupName)
					end
				end
				table.insert(civEntries, {sGroupName, row})
			end
			
			-- Sort by civ description;
			table.sort(civEntries, function(a, b) return Locale.Compare(a[1], b[1]) == -1 end)
			
			tGeneratedCivs = {}
			for i,v in ipairs(civEntries) do
				local row = v[2]
				AddCivilizationEntry(row)
			end
		end
	
		Controls.Stack:CalculateSize()
		Controls.Stack:ReprocessAnchoring()
		Controls.ScrollPanel:CalculateInternalSize()
	end
end
 
Events.AfterModsActivate.Add(function()
    isUsingCulDiv = JFD_IsUsingCulDiv()
    isUsingCivilopedia = JFD_IsUsingCivilopedia()
    g_bRefreshCivs = true
end)
 
Events.AfterModsDeactivate.Add(function()
    g_bRefreshCivs = true
end)