--------------------------------------------------
-- Installed Mods Panel
--------------------------------------------------
include("InstanceManager");
g_InstalledMods = {}
g_ModsToTest = {}
g_DownloadingFiles = {}
g_CurrentMod = Modding.GetModBrowserInstalledListings()[1]
g_NumInstalledMods = #Modding.GetModBrowserInstalledListings()
g_UpdateFunctions = {}

g_OldSelected = ""

g_SortOptions = {
	--- Show All
	{Name = "All", bAll = true},
}
include("ModBrowser_SortFilters")

local pMod_Manager = InstanceManager:new("Mod_Instance", "Mod_Container", Controls.ModsStack)
local pDependencies_Manager = InstanceManager:new("Mod_Instance", "Mod_Container", Controls.DetailsDependentModStack)
local pSelectedMod_Manager = InstanceManager:new("Mod_Instance", "Mod_Container", Controls.SelectedMod_Stack)

local pDetails_Manager = InstanceManager:new("DetailLabelInstance", "DetailLabel", Controls.DetailsStack)
local pDetailsDependentMods_Manager = InstanceManager:new("DetailsDependentModInstance", "Label", Controls.DependentModStack)

local g_Tooltips = {
	[0] = "TXT_KEY_MODDING_ENABLEMOD",
	[1] = "TXT_KEY_MODDING_MOD_BLOCKED_BY_OTHER_MOD",
	[2] = "TXT_KEY_MODDING_MOD_VERSION_ALREADY_ENABLED",
	[3] = "TXT_KEY_MODDING_MOD_MISSING_DEPENDENCIES",
	[4] = "TXT_KEY_MODDING_MOD_HAS_EXCLUSIVITY_CONFLICTS",
	[5] = "TXT_KEY_MODDING_MOD_BAD_GAMEVERSION",
}

local tStateMsg = {
	[1] = "TXT_KEY_MODDING_INSTALLER_EXTRACTING",
	[2] = "TXT_KEY_MODDING_INSTALLER_VERIFYING",
	[3] = "TXT_KEY_MODDING_INSTALLER_COPYING",
	[4] = "TXT_KEY_MODDING_INSTALLER_FINISHED",
	[5] = "TXT_KEY_MODDING_INSTALLER_ERROR",
}
--------------------------------------------------
-- NAVIGATION ROUTINES
--------------------------------------------------
function NavigateBack()
	local args = {};
	LuaEvents.OnModsBrowserNavigateBack(args);
	
	if(not args.Cancel) then
		UIManager:DequeuePopup(ContextPtr);
	end
end

--------------------------------------------------
-- EXPLICIT EVENT HANDLERS
--------------------------------------------------
function InputHandler(uiMsg, wParam, lParam)

	if (uiMsg == KeyEvents.KeyDown and wParam == Keys.VK_ESCAPE) then
		NavigateBack();
	end

	return true;
end
-------------------------------------------------
-- GLOBAL ACTIONS
-------------------------------------------------
-- Context Event Registration
ContextPtr:SetInputHandler(InputHandler);

ContextPtr:SetShowHideHandler(function(bHiding)
	if(not bHiding) then
		Controls.SmallButton2:SetHide(not Steam.IsOverlayEnabled());
	end
end);

-- Control Event Registration
Controls.BackButton:RegisterCallback(Mouse.eLClick, NavigateBack);

function OnWorkshopButtonClicked()
	Steam.ActivateGameOverlayToWebPage("http://steamcommunity.com/workshop/browse?appid=8930");
end

function OnNextButtonClicked()
	UIManager:SetUICursor( 1 );
	Modding.ActivateEnabledMods();	
	UIManager:SetUICursor( 0 );
	
	-- Send out an event to continue on to the scenario popup.  We will send this whether or not
	-- the mod switched the UIs 	
	UIManager:QueuePopup(Controls.ModsMenu, PopupPriority.ModsMenuScreen);
	Events.SystemUpdateUI( SystemUpdateUIType.RestoreUI, "ModsMenu");	
	
end
--------------------------------------------------
-- CUSTOM EVENTS
--------------------------------------------------
Controls.SmallButton1:RegisterCallback(Mouse.eLClick, function() LuaEvents.OnModBrowserDeleteButtonClicked() end);
Controls.SmallButton2:RegisterCallback(Mouse.eLClick, function() OnWorkshopButtonClicked() end);

Controls.DisableAllButton:RegisterCallback(Mouse.eLClick, function()
	local tMods = Modding.GetModBrowserInstalledListings()
	for iKey, tMod in pairs(tMods) do
		if tMod.Enabled then
			Modding.DisableMod(tMod.ModId, tMod.Version)
		end
	end
	RefreshModsList()
	ShowInstalledModDetails()
end);

Controls.EnableAllButton:RegisterCallback(Mouse.eLClick, function()
	local tMods = Modding.GetModBrowserInstalledListings()
	for iKey, tMod in pairs(tMods) do
		if not tMod.Enabled then
			Modding.EnableMod(tMod.ModId, tMod.Version)
		end
	end
	RefreshModsList()
	ShowInstalledModDetails()
end);

Controls.LargeButton:RegisterCallback(Mouse.eLClick, function() OnNextButtonClicked() end);

function SetButtonState(button, label, visible, enabled, caption, tooltip)
	button:SetHide(not visible);
	button:SetDisabled(not enabled);
	if(caption ~= nil) then
		label:SetText(caption);
	end
	
	button:SetToolTipString(tooltip);
end

LuaEvents.ModBrowserSetDeleteButtonState.Add(function(...)
	SetButtonState(Controls.SmallButton1, Controls.SmallButton1Label, ...);
end);
-----------------
-- SORT FUNCTIONS
-----------------
local g_CurrentSortOption = 1
function ResetSortOptions()

	g_SortByPullDown = Controls.SortByPullDown
	g_SortByPullDown:ClearEntries()

	for i, v in ipairs(g_SortOptions) do
		local Sort_ControlTable = {}
		g_SortByPullDown:BuildEntry("InstanceOne", Sort_ControlTable)
		Sort_ControlTable.Button:LocalizeAndSetText(v.Name)
		Sort_ControlTable.Button:RegisterCallback(Mouse.eLClick, 
		function()
			g_SortByPullDown:GetButton():LocalizeAndSetText(v.Name)
			g_CurrentSortOption = i
			RefreshModsList()
		end)
	end

	local showDLCMods = Modding.GetSystemProperty("ShowDLCMods")
	Controls.ShowDLCMods:SetCheck(showDLCMods == "1")

	g_SortByPullDown:CalculateInternals()
	g_SortByPullDown:GetButton():LocalizeAndSetText(g_SortOptions[g_CurrentSortOption].Name)
end
ResetSortOptions()

-----------------
-- ENABLE/DISABLE
-----------------
function EnableMod(modID, version)
	Modding.EnableMod(modID, version)
	RefreshModsList()
	ShowInstalledModDetails()
end

function DisableMod(modID, version)

	local mods = Modding.GetModsRequiredToDisableMod(modID, version);
	
	if(mods and #mods > 1) then
		-- More than one mod is required to disable this mod!
		-- Prompt user and check if this is ok to continue.
		
			
		-- Populate basic info on dialog.	
		Controls.ConfirmText:LocalizeAndSetText("TXT_KEY_CONFIRM_DISABLE_MOD");
		Controls.EffectedModsLabel:LocalizeAndSetText("TXT_KEY_WILL_ALSO_DISABLE_MODS");
		Controls.EffectedModsElements:SetHide(false);
		Controls.DeleteUserData:SetHide(true);
		
		pDetailsDependentMods_Manager:ResetInstances();
		
		for i,v in ipairs(mods) do
			if(v.ModID ~= modID) then
				pDetailsDependentMods_Manager:BuildInstance()
				local listing = pDetailsDependentMods_Manager:GetInstance();
			
				local displayName = Modding.GetModProperty(v.ModID, v.Version, "Name");
				local displayNameVersion = string.format("[ICON_BULLET] %s (v. %i)", displayName, v.Version);			
				listing.Label:SetText(displayNameVersion);	
			
			end		
		end

		UIManager:PushModal(Controls.DeleteConfirm);
		
		Controls.Yes:RegisterCallback(Mouse.eLClick, function()
			UIManager:PopModal(Controls.DeleteConfirm);
			
			for i,v in ipairs(mods) do
				Modding.DisableMod(v.ModID, v.Version);
			end
			
			RefreshModsList()
			ShowInstalledModDetails()
		
		end);
		
		Controls.No:RegisterCallback(Mouse.eLClick, function()
			UIManager:PopModal(Controls.DeleteConfirm);
		end);	

	else
		
		-- Just disable the mod.
		Modding.DisableMod(modID, version)
		RefreshModsList()
		ShowInstalledModDetails()
	
	end
	
end
-----------------
-- HANDLE CAN ENABLE
-----------------
function HandleCanEnable()
	local tCanEnable = Modding.CanEnableMod(g_ModsToTest)
	for iKey,iState in ipairs(tCanEnable) do
	
		local tInstance = g_ModsToTest[iKey][3]
		if iState > 0 then
			tInstance.Mod_Checkbox:SetDisabled(true)
			tInstance.Mod_Checkbox:SetAlpha(0.33)
		end
	
		local sTooltip = g_Tooltips[iState]
		if(sTooltip ~= nil) then
			sTooltip = Locale.ConvertTextKey(sTooltip)
		end
		
		tInstance.Mod_Checkbox:SetToolTipString(sTooltip)	  
	end	
end
-----------------
-- CREATEMODBOX
-----------------
function CreateModBox(tInstance, tMod, bDependency)
	if not bDependency then
		tInstance.Mod_Name:SetText(string.format("%s (V. %i)", tMod.Name, tMod.Version))
		local iBoxY = tInstance.Mod_Name:GetSizeY() + 30
		tInstance.Mod_Container:SetSizeY(iBoxY)
		tInstance.Mod_AlphaAnim:SetSizeY(iBoxY + 2)
		tInstance.Mod_Highlight:SetSizeY(iBoxY + 4)
	end

	if tMod.Enabled then
		tInstance.Mod_Checkbox:SetCheck(true)
		tInstance.Mod_Checkbox:RegisterCallback(Mouse.eLClick, function() 
			DisableMod(tMod.ModId, tMod.Version) 
			-- if (g_CurrentMod.ModId == tMod.ModId) and (g_CurrentMod.Version == tMod.Version) then
			-- 	g_CurrentMod.Enabled = tMod.Enabled
			-- end
		end
		)
	else
		table.insert(g_ModsToTest, {tMod.ModId, tMod.Version, tInstance})
		tInstance.Mod_Checkbox:RegisterCallback(Mouse.eLClick, function() 
			EnableMod(tMod.ModId, tMod.Version)
			-- if (g_CurrentMod.ModId == tMod.ModId) and (g_CurrentMod.Version == tMod.Version) then
			-- 	g_CurrentMod.Enabled = tMod.Enabled
			-- end
		end
		)
	end

	tInstance.Mod_Container:RegisterCallback(Mouse.eLClick, function()
		g_CurrentMod = tMod
		ShowInstalledModDetails()
	end)
end

function CreateDependency(tInstance, tMod)
	local bModExists = false
	if tMod.ModID and g_InstalledMods[tMod.ModID] then
		CreateModBox(tInstance, g_InstalledMods[tMod.ModID], true)
		bModExists = true
	end
	if not(bModExists) then tInstance.Mod_Checkbox:SetHide(true) end

	sName = "[NEWLINE]"
	-- Get Name
	if tMod.PackageID then
		local dlcTitle;
		if(tMod.PackageID == "*") then
			dlcTitle = Locale.Lookup("TXT_KEY_MODDING_BLOCKS_ALL_OTHER_DLC");
		else
			local packageID = string.gsub(tMod.PackageID, "-", "");
			packageID = Locale.ToUpper(packageID);
			dlcTitle = Locale.Lookup("TXT_KEY_" .. packageID .. "_DESCRIPTION");
		end
		sName = sName .. dlcTitle
	elseif tMod.ModID then

		if g_InstalledMods[tMod.ModID] then
			tMod.ModTitle = g_InstalledMods[tMod.ModID].Name
		end

		local modTitle = string.format("%s (V. %i - %i)", tMod.ModTitle, tMod.MinVersion, tMod.MaxVersion);
		sName = sName .. modTitle
	else
		sName = sName .. Locale.Lookup("TXT_KEY_MODDING_GAMEVERSION", tMod.MinVersion, tMod.MaxVersion);
	end
	-- End Get Name
	-- Set Instance Name
	if tMod.Type == 2 then
		sName = Locale.Lookup("TXT_KEY_MODDING_DEPENDSON", sName)
		tInstance.Mod_Name:SetText("[COLOR_POSITIVE_TEXT]" .. sName)
	elseif tMod.Type == 1 then
		sName = Locale.Lookup("TXT_KEY_MODDING_REFERENCES", sName)
		tInstance.Mod_Name:SetText("[COLOR_MENU_BLUE]" .. sName)
	elseif tMod.Type == -1 then
		sName = Locale.Lookup("TXT_KEY_MODDING_BLOCKS", sName)
		tInstance.Mod_Name:SetText("[COLOR_NEGATIVE_TEXT]" .. sName)
	end

	local iBoxY = tInstance.Mod_Name:GetSizeY() + 30
	tInstance.Mod_Container:SetSizeY(iBoxY)
	tInstance.Mod_AlphaAnim:SetSizeY(iBoxY + 2)
	tInstance.Mod_Highlight:SetSizeY(iBoxY + 4)
end
-----------------
-- MOD DETAILS
-----------------
function ShowInstalledModDetails()
	local iMod, iVersion = g_CurrentMod.ModId, g_CurrentMod.Version
	local tMod = Modding.GetInstalledModDetails(iMod, iVersion)
	g_ModsToTest = {}

	Controls.SelectedModName:SetText(tMod.Name)
	Controls.SelectedModID:SetText(iMod)
	Controls.SelectedModDescription:SetText(tMod.Description)

	-- Details:
	pDetails_Manager:ResetInstances()

	function AddDetail(sTag, sValue)
		if(sValue ~= nil) then
			pDetails_Manager:BuildInstance()
			local tDetail = pDetails_Manager:GetInstance()
			local sText = Locale.Lookup(sTag) .. " " .. Locale.Lookup(sValue)
			tDetail.DetailLabel:SetText(sText)
		end
	end	
	function AddYesNoDetail(tag, value)
		if(value == "1") then
			return AddDetail(tag, Locale.ConvertTextKey("TXT_KEY_MODDING_LABELYES"));
		else
			return AddDetail(tag, Locale.ConvertTextKey("TXT_KEY_MODDING_LABELNO"));
		end
	end

	AddDetail("TXT_KEY_MODDING_LABELVERSION", iVersion);
	AddDetail("TXT_KEY_MODDING_LABELAUTHOR", tMod.Authors)
	AddDetail("TXT_KEY_MODDING_LABELSPECIALTHANKS", tMod.SpecialThanks)
	AddYesNoDetail("TXT_KEY_MODDING_LABELSUPPORTSSINGLEPLAYER", tMod.SupportsSinglePlayer)
	AddYesNoDetail("TXT_KEY_MODDING_LABELSUPPORTSMULTIPLAYER", tMod.SupportsMultiplayer)
	AddYesNoDetail("TXT_KEY_MODDING_LABELAFFECTSSAVEDGAMES", tMod.AffectsSavedGames)
	AddDetail("TXT_KEY_MODDING_LABELUPDATED", tMod.Updated)

	pSelectedMod_Manager:ResetInstances()
	pSelectedMod_Manager:BuildInstance()
	local tSelectedMod = pSelectedMod_Manager:GetInstance()
	CreateModBox(tSelectedMod, g_CurrentMod)

	local tDependencies = {}
	local tReferences = {}
	local tBlocks = {}

	local tModAssociations = Modding.GetModAssociations(iMod, iVersion)
	local tDlcAssociations = Modding.GetDlcAssociations(iMod, iVersion)
	local tGameVersionAssociations = Modding.GetGameVersionAssociations(iMod, iVersion)
	for _, tMod in ipairs(tModAssociations) do
		if tMod.Type == 2	then table.insert(tDependencies, tMod) end
		if tMod.Type == 1	then table.insert(tReferences, tMod) end
		if tMod.Type == -1	then table.insert(tBlocks, tMod) end
	end
	for _, tMod in ipairs(tDlcAssociations) do
		if tMod.Type == 2	then table.insert(tDependencies, tMod) end
		if tMod.Type == 1	then table.insert(tReferences, tMod) end
		if tMod.Type == -1	then table.insert(tBlocks, tMod) end
	end
	for _, tMod in ipairs(tGameVersionAssociations) do
		if tMod.Type == 2	then table.insert(tDependencies, tMod) end
		if tMod.Type == 1	then table.insert(tReferences, tMod) end
		if tMod.Type == -1	then table.insert(tBlocks, tMod) end
	end

	pDependencies_Manager:ResetInstances()
	for _, tMod in ipairs(tDependencies) do
		pDependencies_Manager:BuildInstance()
		local tInstance = pDependencies_Manager:GetInstance()
		CreateDependency(tInstance, tMod)
	end
	for _, tMod in ipairs(tReferences) do
		pDependencies_Manager:BuildInstance()
		local tInstance = pDependencies_Manager:GetInstance()
		CreateDependency(tInstance, tMod)
	end
	for _, tMod in ipairs(tBlocks) do
		pDependencies_Manager:BuildInstance()
		local tInstance = pDependencies_Manager:GetInstance()
		CreateDependency(tInstance, tMod)
	end

	HandleCanEnable()

	-- local bCanUnsubscribe = Modding.CanUnsubscribeMod(iMod, iVersion)
	-- local bCanDeleteMod = Modding.CanDeleteMod(iMod, iVersion)
	-- if(bCanUnsubscribe) then
	-- 	LuaEvents.ModBrowserSetDeleteButtonState(true, true, Locale.Lookup("TXT_KEY_MODDING_UNSUBSCRIBE_MOD"))
	-- elseif(bCanDeleteMod) then
	-- 	LuaEvents.ModBrowserSetDeleteButtonState(true, true, Locale.Lookup("TXT_KEY_MODDING_DELETEMOD"))
	-- else
	-- 	LuaEvents.ModBrowserSetDeleteButtonState(false, false)
	-- end

	Controls.DetailsStack:ReprocessAnchoring()
	Controls.DetailsStack:CalculateSize()
	Controls.SelectedMod_Stack:ReprocessAnchoring()
	Controls.SelectedMod_Stack:CalculateSize()
	Controls.DetailsDependentModStack:ReprocessAnchoring()
	Controls.DetailsDependentModStack:CalculateSize()
	Controls.DescriptionScrollPanel:CalculateInternalSize()

	if g_OldSelected ~= iMod .. "_V_" .. iVersion then
		Controls.DescriptionScrollPanel:SetScrollValue(0)
		g_OldSelected = iMod .. "_V_" .. iVersion
	end
end

--ShowInstalledModDetails("222d2cdf-a40c-41f2-a220-904c5ce81343", 35)
-----------------
-- MODS LIST
-----------------
function RefreshModsList()

		local tMods = Modding.GetModBrowserInstalledListings()
		g_NumInstalledMods = #tMods
		g_InstalledMods = {}
		g_UpdateFunctions = {}
		for iKey, tMod in pairs(tMods) do

			if g_CurrentMod then
				if (g_CurrentMod.ModId == tMod.ModId) and (g_CurrentMod.Version == tMod.Version) then
					g_CurrentMod = tMod
				end			
			end

			if not(g_InstalledMods[tMod.ModId]) then
				g_InstalledMods[tMod.ModId] = tMod
			else
				local tOldMod = g_InstalledMods[tMod.ModId]
				if tOldMod.Version < tMod.Version then
					g_InstalledMods[tMod.ModId] = tMod
				end
			end
		end

		------------------------------------------------------------------------------------------------
		-- Filter
		------------------------------------------------------------------------------------------------
		local tFilteredMods = {}
		if g_SortOptions[g_CurrentSortOption].bAll then
			tFilteredMods = tMods
		else
			if (g_SortOptions[g_CurrentSortOption].FilterTerms) or (g_SortOptions[g_CurrentSortOption].ModIDs) then
				for iKey, tMod in pairs(tMods) do
					local sName = Locale.ToLower(tMod.Name)
					local iModID = tMod.ModId
					local bInclude = false
					-- Filter IDs
					if g_SortOptions[g_CurrentSortOption].ModIDs then
						for _, iCheckID in ipairs(g_SortOptions[g_CurrentSortOption].ModIDs) do
							if iModID == iCheckID then
								bInclude = true
								table.insert(tFilteredMods, tMod)
								tMods[iKey] = nil 
								break
							end
						end
					end
					-- Filter Terms
					if not(bInclude) and (g_SortOptions[g_CurrentSortOption].FilterTerms) then
						for _, sFilter in ipairs(g_SortOptions[g_CurrentSortOption].FilterTerms) do

							sFilter = Locale.ToLower(sFilter)

							if string.find(sName, sFilter) then
								bInclude = true
								table.insert(tFilteredMods, tMod)
								tMods[iKey] = nil
								break
							end
						end						
					end
					----
				end
			end
		end
		------------------------------------------------------------------------------------------------
		--Search
		------------------------------------------------------------------------------------------------
		local sSearchString = Locale.ToLower(Controls.SearchEditBox:GetText())
		local tFinalMods = {}
		g_ModsToTest = {}

		if sSearchString ~= nil and sSearchString ~= "" then
			for iKey, tMod in ipairs(tFilteredMods) do
				local sName = Locale.ToLower(tMod.Name)
				if string.find(sName, sSearchString) then
					table.insert(tFinalMods, tMod)
				end
			end
		else
			tFinalMods = tFilteredMods
		end

		local bSortEnabled = Controls.SortByActivation:IsChecked()
		table.sort(tFilteredMods, function (a, b)
			if bSortEnabled and a.Enabled ~= b.Enabled then
				return a.Enabled and not b.Enabled;
			end
			return (Locale.Compare(a.Name, b.Name) == -1)
		end)
		------------------------------------------------------------------------------------------------
		--Unsorted Mod
		------------------------------------------------------------------------------------------------
		local tUnsortedInstalledMods = Modding.GetModBrowserInstalledListings()	-- Get the installed mods.
		local unsortedInstalledMods = Modding.GetModBrowserInstalledListings();	-- Get the installed mods.

		pMod_Manager:ResetInstances()
		for iKey, tMod in ipairs(tFinalMods) do
			pMod_Manager:BuildInstance()
			local tInstance = pMod_Manager:GetInstance()
			CreateModBox(tInstance, tMod)
		end

	HandleCanEnable()
	Controls.ModsStack:CalculateSize()
	Controls.ModsStack:ReprocessAnchoring()
	Controls.ModsScrollPanel:CalculateInternalSize()
end
Controls.SearchEditBox:RegisterCallback(RefreshModsList)
Controls.SortByActivation:RegisterCallback(Mouse.eLClick, RefreshModsList)
-----------------
-- DELETE/UNSUBSCRIBE
-----------------
Controls.ShowDLCMods:RegisterCheckHandler( function(bCheck)
	if(bCheck) then
		Modding.SetSystemProperty("ShowDLCMods", "1");
		RefreshModsList()
	else
		Modding.SetSystemProperty("ShowDLCMods", "0");
		RefreshModsList()
	end
end);
-----------------
-- UPDATE HANDLING
-----------------
function OnUpdate(deltaTime)
	Modding.UpdateModdingSystem()

	local downloadingFiles = Modding.GetModBrowserDownloadingListings();
	if(#downloadingFiles == #g_DownloadingFiles) then
		for i,v in ipairs(g_DownloadingFiles) do
			if(not Modding.PublishedFileIdsMatch(v.PublishedFileId, downloadingFiles[i].PublishedFileId)) then
				g_DownloadingFiles = downloadingFiles;
				RefreshModsList()
				break;
			end
		end
	elseif g_NumInstalledMods ~= #Modding.GetModBrowserInstalledListings() then
		RefreshModsList()
	else
		local progress = Modding.GetInstallProgress();
		if(g_InstallingMods ~= (progress ~= nil)) then
			g_InstallingMods = (progress ~= nil);
			RefreshModsList()
		end
	end

	if(Modding.HasPendingInstalls()) then
		Modding.InstallMods();
	end
end
ContextPtr:SetUpdate(OnUpdate);
-----------------
-- MODS LIST
-----------------
RefreshModsList()
ShowInstalledModDetails()