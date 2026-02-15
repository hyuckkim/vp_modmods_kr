include("IconSupport");
include("InstanceManager");
include("SupportFunctions");

print("This is NotificationSettings");

local g_InstantYieldsManager = GenerationalInstanceManager:new("InstantYieldsInstance", "Base", Controls.NotificationSettingsStack);

local g_InstantYieldClassification = {}
for i = 0, InstantYieldType.NUM_INSTANT_YIELD_TYPES - 1 do
	if  i == InstantYieldType.INSTANT_YIELD_TYPE_BIRTH or
		i == InstantYieldType.INSTANT_YIELD_TYPE_BIRTH_RETROACTIVE or
		i == InstantYieldType.INSTANT_YIELD_TYPE_CONSTRUCTION or
		i == InstantYieldType.INSTANT_YIELD_TYPE_BORDERS or
		i == InstantYieldType.INSTANT_YIELD_TYPE_U_PROD or
		i == InstantYieldType.INSTANT_YIELD_TYPE_PURCHASE or
		i == InstantYieldType.INSTANT_YIELD_TYPE_TILE_PURCHASE or
		i == InstantYieldType.INSTANT_YIELD_TYPE_FOUND or
		i == InstantYieldType.INSTANT_YIELD_TYPE_CONSTRUCTION_WONDER or
		i == InstantYieldType.INSTANT_YIELD_TYPE_FAITH_PURCHASE or
		i == InstantYieldType.INSTANT_YIELD_TYPE_REFUND or
		i == InstantYieldType.INSTANT_YIELD_TYPE_FAITH_REFUND or
		i == InstantYieldType.INSTANT_YIELD_TYPE_BIRTH_HOLY_CITY
	then
		g_InstantYieldClassification[i] = "City"
	elseif
		i == InstantYieldType.INSTANT_YIELD_TYPE_DEATH or
		i == InstantYieldType.INSTANT_YIELD_TYPE_F_CONQUEST or
		i == InstantYieldType.INSTANT_YIELD_TYPE_VICTORY or
		i == InstantYieldType.INSTANT_YIELD_TYPE_SCOUTING or
		i == InstantYieldType.INSTANT_YIELD_TYPE_LEVEL_UP or
		i == InstantYieldType.INSTANT_YIELD_TYPE_PILLAGE or
		i == InstantYieldType.INSTANT_YIELD_TYPE_VICTORY_GLOBAL or
		i == InstantYieldType.INSTANT_YIELD_TYPE_PILLAGE_GLOBAL or
		i == InstantYieldType.INSTANT_YIELD_TYPE_BARBARIAN_CAMP_CLEARED or
		i == InstantYieldType.INSTANT_YIELD_TYPE_PILLAGE_UNIT or
		i == InstantYieldType.INSTANT_YIELD_TYPE_BULLY
	then
		g_InstantYieldClassification[i] = "Military"
	elseif
		i == InstantYieldType.INSTANT_YIELD_TYPE_GP_USE or
		i == InstantYieldType.INSTANT_YIELD_TYPE_GP_BORN or
		i == InstantYieldType.INSTANT_YIELD_TYPE_F_SPREAD or
		i == InstantYieldType.INSTANT_YIELD_TYPE_CONVERSION or
		i == InstantYieldType.INSTANT_YIELD_TYPE_SPREAD or
		i == InstantYieldType.INSTANT_YIELD_TYPE_CULTURE_BOMB or
		i == InstantYieldType.INSTANT_YIELD_TYPE_REMOVE_HERESY or
		i == InstantYieldType.INSTANT_YIELD_TYPE_TR_END or
		i == InstantYieldType.INSTANT_YIELD_TYPE_TR_MOVEMENT or
		i == InstantYieldType.INSTANT_YIELD_TYPE_TR_MOVEMENT_IN_FOREIGN or
		i == InstantYieldType.INSTANT_YIELD_TYPE_IMPROVEMENT_BUILD
	then
		g_InstantYieldClassification[i] = "Civilian"
	elseif
		i == InstantYieldType.INSTANT_YIELD_TYPE_SPY_ATTACK or
		i == InstantYieldType.INSTANT_YIELD_TYPE_SPY_DEFENSE or
		i == InstantYieldType.INSTANT_YIELD_TYPE_SPY_IDENTIFY or
		i == InstantYieldType.INSTANT_YIELD_TYPE_SPY_DEFENSE_OR_ID or
		i == InstantYieldType.INSTANT_YIELD_TYPE_SPY_RIG_ELECTION
	then
		g_InstantYieldClassification[i] = "Spies"
	elseif
		i == InstantYieldType.INSTANT_YIELD_TYPE_COMBAT_EXPERIENCE or
		i == InstantYieldType.INSTANT_YIELD_TYPE_TR_PRODUCTION_SIPHON or
		i == InstantYieldType.INSTANT_YIELD_TYPE_CONVERSION_EXPO or
		i == InstantYieldType.INSTANT_YIELD_TYPE_PROMOTION_OBTAINED
	then
		g_InstantYieldClassification[i] = "Unused"
	else
		g_InstantYieldClassification[i] = "Misc"
	end
end

function GetInstantYieldName(i)
	local str;
	if i == InstantYieldType.INSTANT_YIELD_TYPE_BIRTH then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_BIRTH_SHORT");			
	elseif i == InstantYieldType.INSTANT_YIELD_TYPE_DEATH then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_DEATH_SHORT");			
	elseif i == InstantYieldType.INSTANT_YIELD_TYPE_PROPOSAL then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_PROPOSAL_SHORT");			
	elseif i == InstantYieldType.INSTANT_YIELD_TYPE_ERA_UNLOCK then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_ERA_UNLOCK_SHORT");			
	elseif i == InstantYieldType.INSTANT_YIELD_TYPE_POLICY_UNLOCK then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_POLICY_UNLOCK_SHORT");			
	elseif i == InstantYieldType.INSTANT_YIELD_TYPE_INSTANT then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_INSTANT_SHORT");			
	elseif i == InstantYieldType.INSTANT_YIELD_TYPE_TECH then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_TECH_SHORT");			
	elseif i == InstantYieldType.INSTANT_YIELD_TYPE_CONSTRUCTION then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_CONSTRUCTION_SHORT");			
	elseif i == InstantYieldType.INSTANT_YIELD_TYPE_BORDERS then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_BORDERS_SHORT");			
	elseif i == InstantYieldType.INSTANT_YIELD_TYPE_GP_USE then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_GP_USE_SHORT");			
	elseif i == InstantYieldType.INSTANT_YIELD_TYPE_GP_BORN then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_GP_BORN_SHORT");			
	elseif i == InstantYieldType.INSTANT_YIELD_TYPE_F_SPREAD then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_F_SPREAD_SHORT");			
	elseif i == InstantYieldType.INSTANT_YIELD_TYPE_F_CONQUEST then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_F_CONQUEST_SHORT");			
	elseif i == InstantYieldType.INSTANT_YIELD_TYPE_VICTORY then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_VICTORY_SHORT");			
	elseif i == InstantYieldType.INSTANT_YIELD_TYPE_U_PROD then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_U_PROD_SHORT");			
	elseif i == InstantYieldType.INSTANT_YIELD_TYPE_PURCHASE then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_PURCHASE_SHORT");			
	elseif i == InstantYieldType.INSTANT_YIELD_TYPE_TILE_PURCHASE then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_TILE_PURCHASE_SHORT");			
	elseif i == InstantYieldType.INSTANT_YIELD_TYPE_FOUND then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_FOUND_SHORT");			
	elseif i == InstantYieldType.INSTANT_YIELD_TYPE_TR_END then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_TR_END_SHORT");			
	elseif i == InstantYieldType.INSTANT_YIELD_TYPE_CONVERSION then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_CONVERSION_SHORT");			
	elseif i == InstantYieldType.INSTANT_YIELD_TYPE_SPREAD then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_SPREAD_SHORT");			
	elseif i == InstantYieldType.INSTANT_YIELD_TYPE_BULLY then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_BULLY_SHORT");			
	elseif i == InstantYieldType.INSTANT_YIELD_TYPE_TR_MOVEMENT then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_TR_MOVEMENT_SHORT");			
	elseif i == InstantYieldType.INSTANT_YIELD_TYPE_SCOUTING then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_SCOUTING_SHORT");			
	elseif i == InstantYieldType.INSTANT_YIELD_TYPE_LEVEL_UP then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_LEVEL_UP_SHORT");			
	elseif i == InstantYieldType.INSTANT_YIELD_TYPE_PILLAGE then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_PILLAGE_SHORT");			
	elseif i == InstantYieldType.INSTANT_YIELD_TYPE_BIRTH_RETROACTIVE then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_BIRTH_RETROACTIVE_SHORT");			
	elseif i == InstantYieldType.INSTANT_YIELD_TYPE_SPY_ATTACK then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_SPY_ATTACK_SHORT");			
	elseif i == InstantYieldType.INSTANT_YIELD_TYPE_SPY_DEFENSE then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_SPY_DEFENSE_SHORT");			
	elseif i == InstantYieldType.INSTANT_YIELD_TYPE_DELEGATES then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_DELEGATES_SHORT");			
	elseif i == InstantYieldType.INSTANT_YIELD_TYPE_CONSTRUCTION_WONDER then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_CONSTRUCTION_WONDER_SHORT");			
	elseif i == InstantYieldType.INSTANT_YIELD_TYPE_MINOR_QUEST_REWARD then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_MINOR_QUEST_REWARD_SHORT");			
	elseif i == InstantYieldType.INSTANT_YIELD_TYPE_CULTURE_BOMB then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_CULTURE_BOMB_SHORT");			
	elseif i == InstantYieldType.INSTANT_YIELD_TYPE_REMOVE_HERESY then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_REMOVE_HERESY_SHORT");			
	elseif i == InstantYieldType.INSTANT_YIELD_TYPE_FAITH_PURCHASE then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_FAITH_PURCHASE_SHORT");			
	elseif i == InstantYieldType.INSTANT_YIELD_TYPE_VICTORY_GLOBAL then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_VICTORY_GLOBAL_SHORT");			
	elseif i == InstantYieldType.INSTANT_YIELD_TYPE_PILLAGE_GLOBAL then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_PILLAGE_GLOBAL_SHORT");			
	elseif i == InstantYieldType.INSTANT_YIELD_TYPE_CONVERSION_EXPO then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_CONVERSION_EXPO_SHORT");			
	elseif i == InstantYieldType.INSTANT_YIELD_TYPE_PROMOTION_OBTAINED then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_PROMOTION_OBTAINED_SHORT");			
	elseif i == InstantYieldType.INSTANT_YIELD_TYPE_BARBARIAN_CAMP_CLEARED then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_BARBARIAN_CAMP_CLEARED_SHORT");			
	elseif i == InstantYieldType.INSTANT_YIELD_TYPE_TR_PRODUCTION_SIPHON then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_TR_PRODUCTION_SIPHON_SHORT");			
	elseif i == InstantYieldType.INSTANT_YIELD_TYPE_TR_MOVEMENT_IN_FOREIGN then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_TR_MOVEMENT_IN_FOREIGN_SHORT");			
	elseif i == InstantYieldType.INSTANT_YIELD_TYPE_IMPROVEMENT_BUILD then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_IMPROVEMENT_BUILD_SHORT");			
	elseif i == InstantYieldType.INSTANT_YIELD_TYPE_LUA then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_LUA_SHORT");			
	elseif i == InstantYieldType.INSTANT_YIELD_TYPE_RESEARCH_AGREMEENT then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_RESEARCH_AGREMEENT_SHORT");			
	elseif i == InstantYieldType.INSTANT_YIELD_TYPE_REFUND then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_REFUND_SHORT");			
	elseif i == InstantYieldType.INSTANT_YIELD_TYPE_FAITH_REFUND then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_FAITH_REFUND_SHORT");			
	elseif i == InstantYieldType.INSTANT_YIELD_TYPE_BIRTH_HOLY_CITY then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_BIRTH_HOLY_CITY_SHORT");			
	elseif i == InstantYieldType.INSTANT_YIELD_TYPE_TECH_RETROACTIVE then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_TECH_RETROACTIVE_SHORT");			
	elseif i == InstantYieldType.INSTANT_YIELD_TYPE_PILLAGE_UNIT then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_PILLAGE_UNIT_SHORT");			
	elseif i == InstantYieldType.INSTANT_YIELD_TYPE_COMBAT_EXPERIENCE then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_COMBAT_EXPERIENCE_SHORT");			
	elseif i == InstantYieldType.INSTANT_YIELD_TYPE_SPY_IDENTIFY then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_SPY_IDENTIFY_SHORT");			
	elseif i == InstantYieldType.INSTANT_YIELD_TYPE_SPY_DEFENSE_OR_ID then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_SPY_DEFENSE_OR_ID_SHORT");			
	elseif i == InstantYieldType.INSTANT_YIELD_TYPE_SPY_RIG_ELECTION then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_SPY_RIG_ELECTION_SHORT");		
	elseif i == InstantYieldType.INSTANT_YIELD_TYPE_INSTANT then
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_TYPE_INSTANT_SHORT");
	else
		-- failsafe
		str = Locale.Lookup("TXT_KEY_INSTANT_YIELD_UNKNOWN", i)
	end
	return str;
end

-- sort instant yields by localized name
local g_InstantYieldCitySorted = {}
local g_InstantYieldMilitarySorted = {}
local g_InstantYieldCivilianSorted = {}
local g_InstantYieldSpiesSorted = {}
local g_InstantYieldMiscSorted = {}

for i = 0, InstantYieldType.NUM_INSTANT_YIELD_TYPES - 1 do
	if g_InstantYieldClassification[i] ~= "Unused" then
		local entry = {}
		entry["Index"] = i
		entry["Name"] = GetInstantYieldName(i)
		if g_InstantYieldClassification[i] == "City" then
			table.insert(g_InstantYieldCitySorted, entry);
		elseif g_InstantYieldClassification[i] == "Military" then
			table.insert(g_InstantYieldMilitarySorted, entry);
		elseif g_InstantYieldClassification[i] == "Civilian" then
			table.insert(g_InstantYieldCivilianSorted, entry);
		elseif g_InstantYieldClassification[i] == "Spies" then
			table.insert(g_InstantYieldSpiesSorted, entry);
		else
			table.insert(g_InstantYieldMiscSorted, entry);
		end
	end
end
table.sort(g_InstantYieldCitySorted, function(a, b) return a.Name < b.Name end)
table.sort(g_InstantYieldMilitarySorted, function(a, b) return a.Name < b.Name end)
table.sort(g_InstantYieldCivilianSorted, function(a, b) return a.Name < b.Name end)
table.sort(g_InstantYieldSpiesSorted, function(a, b) return a.Name < b.Name end)
table.sort(g_InstantYieldMiscSorted, function(a, b) return a.Name < b.Name end)

-- init button text
Controls.InstantYieldCityButton:SetText( "[ICON_MINUS]" .. Locale.ConvertTextKey( "TXT_KEY_NOTIFICATION_SETTINGS_CITY_BUTTON" ) );
Controls.InstantYieldMilitaryButton:SetText( "[ICON_MINUS]" .. Locale.ConvertTextKey( "TXT_KEY_NOTIFICATION_SETTINGS_MILITARY_BUTTON" ) );
Controls.InstantYieldCivilianButton:SetText( "[ICON_MINUS]" .. Locale.ConvertTextKey( "TXT_KEY_NOTIFICATION_SETTINGS_CIVILIAN_BUTTON" ) );
Controls.InstantYieldSpiesButton:SetText( "[ICON_MINUS]" .. Locale.ConvertTextKey( "TXT_KEY_NOTIFICATION_SETTINGS_SPIES_BUTTON" ) );
Controls.InstantYieldMiscButton:SetText( "[ICON_MINUS]" .. Locale.ConvertTextKey( "TXT_KEY_NOTIFICATION_SETTINGS_MISC_BUTTON" ) );
function OnClose()
	ContextPtr:SetHide(true)
end
Controls.CloseButton:RegisterCallback(Mouse.eLClick, OnClose);

function OnTurnOffAll()
	local iPlayer = Game.GetActivePlayer();
    local pPlayer = Players[ iPlayer ];
	for i = 0, InstantYieldType.NUM_INSTANT_YIELD_TYPES - 1 do
		if g_InstantYieldClassification[i] ~= "Unused" then
			pPlayer:SetInstantYieldNotificationDisabled(i, true);
		end
	end
	Refresh()
end
function OnTurnOnAll()
	local iPlayer = Game.GetActivePlayer();
    local pPlayer = Players[ iPlayer ];
	for i = 0, InstantYieldType.NUM_INSTANT_YIELD_TYPES - 1 do
		if g_InstantYieldClassification[i] ~= "Unused" then
			pPlayer:SetInstantYieldNotificationDisabled(i, false);
		end
	end
	Refresh()
end
Controls.TurnOffAllButton:RegisterCallback(Mouse.eLClick, OnTurnOffAll);
Controls.TurnOnAllButton:RegisterCallback(Mouse.eLClick, OnTurnOnAll);

function OpenNotificationSettings()
    ContextPtr:SetHide(false)
end

function ToggleInstantYieldSetting(checkbox, pPlayer, Type)
	local NotificationDisabled;
    if checkbox:IsChecked() then
        NotificationDisabled = false;
		print("Enabling Instant Yield Notification Type " .. Type .. ": " .. GetInstantYieldName(Type))
	else
		NotificationDisabled = true;
		print("Disabling Instant Yield Notification Type " .. Type .. ": " .. GetInstantYieldName(Type))
	end
	pPlayer:SetInstantYieldNotificationDisabled(Type, NotificationDisabled);

end

function ShowHideHandler( bIsHide, bInitState )
	if(not bIsHide ) then
		Refresh()
	end
end

function ToggleStack( stacknumber )
    if( stacknumber == 0 ) then
        if( Controls.InstantYieldCityStack:IsHidden() ) then
            Controls.InstantYieldCityStack:SetHide( false );
            Controls.InstantYieldCityButton:SetText( "[ICON_MINUS]" .. Locale.ConvertTextKey( "TXT_KEY_NOTIFICATION_SETTINGS_CITY_BUTTON" ) );
        else
            Controls.InstantYieldCityStack:SetHide( true );
            Controls.InstantYieldCityButton:SetText( "[ICON_PLUS]" .. Locale.ConvertTextKey( "TXT_KEY_NOTIFICATION_SETTINGS_CITY_BUTTON" ) );
        end
    elseif( stacknumber == 1 ) then
        if( Controls.InstantYieldMilitaryStack:IsHidden() ) then
            Controls.InstantYieldMilitaryStack:SetHide( false );
            Controls.InstantYieldMilitaryButton:SetText( "[ICON_MINUS]" .. Locale.ConvertTextKey( "TXT_KEY_NOTIFICATION_SETTINGS_MILITARY_BUTTON" ) );
        else
            Controls.InstantYieldMilitaryStack:SetHide( true );
            Controls.InstantYieldMilitaryButton:SetText( "[ICON_PLUS]" .. Locale.ConvertTextKey( "TXT_KEY_NOTIFICATION_SETTINGS_MILITARY_BUTTON" ) );
        end
    elseif( stacknumber == 2 ) then
        if( Controls.InstantYieldCivilianStack:IsHidden() ) then
            Controls.InstantYieldCivilianStack:SetHide( false );
            Controls.InstantYieldCivilianButton:SetText( "[ICON_MINUS]" .. Locale.ConvertTextKey( "TXT_KEY_NOTIFICATION_SETTINGS_CIVILIAN_BUTTON" ) );
        else
            Controls.InstantYieldCivilianStack:SetHide( true );
            Controls.InstantYieldCivilianButton:SetText( "[ICON_PLUS]" .. Locale.ConvertTextKey( "TXT_KEY_NOTIFICATION_SETTINGS_CIVILIAN_BUTTON" ) );
        end
    elseif( stacknumber == 3 ) then
        if( Controls.InstantYieldSpiesStack:IsHidden() ) then
            Controls.InstantYieldSpiesStack:SetHide( false );
            Controls.InstantYieldSpiesButton:SetText( "[ICON_MINUS]" .. Locale.ConvertTextKey( "TXT_KEY_NOTIFICATION_SETTINGS_SPIES_BUTTON" ) );
        else
            Controls.InstantYieldSpiesStack:SetHide( true );
            Controls.InstantYieldSpiesButton:SetText( "[ICON_PLUS]" .. Locale.ConvertTextKey( "TXT_KEY_NOTIFICATION_SETTINGS_SPIES_BUTTON" ) );
        end
    elseif( stacknumber == 4 ) then
        if( Controls.InstantYieldMiscStack:IsHidden() ) then
            Controls.InstantYieldMiscStack:SetHide( false );
            Controls.InstantYieldMiscButton:SetText( "[ICON_MINUS]" .. Locale.ConvertTextKey( "TXT_KEY_NOTIFICATION_SETTINGS_MISC_BUTTON" ) );
        else
            Controls.InstantYieldMiscStack:SetHide( true );
            Controls.InstantYieldMiscButton:SetText( "[ICON_PLUS]" .. Locale.ConvertTextKey( "TXT_KEY_NOTIFICATION_SETTINGS_MISC_BUTTON" ) );
        end
    end
end
Controls.InstantYieldCityButton:SetVoid1( 0 );
Controls.InstantYieldCityButton:RegisterCallback( Mouse.eLClick, ToggleStack );
Controls.InstantYieldMilitaryButton:SetVoid1( 1 );
Controls.InstantYieldMilitaryButton:RegisterCallback( Mouse.eLClick, ToggleStack );
Controls.InstantYieldCivilianButton:SetVoid1( 2 );
Controls.InstantYieldCivilianButton:RegisterCallback( Mouse.eLClick, ToggleStack );
Controls.InstantYieldSpiesButton:SetVoid1( 3 );
Controls.InstantYieldSpiesButton:RegisterCallback( Mouse.eLClick, ToggleStack );
Controls.InstantYieldMiscButton:SetVoid1( 4 );
Controls.InstantYieldMiscButton:RegisterCallback( Mouse.eLClick, ToggleStack );



function Refresh()
	local iPlayer = Game.GetActivePlayer();
    local pPlayer = Players[ iPlayer ];
		
	Controls.InstantYieldCityStack:DestroyAllChildren();
    Controls.InstantYieldMilitaryStack:DestroyAllChildren();
    Controls.InstantYieldCivilianStack:DestroyAllChildren();
    Controls.InstantYieldSpiesStack:DestroyAllChildren();
    Controls.InstantYieldMiscStack:DestroyAllChildren();
	
	for i,v in ipairs(g_InstantYieldCitySorted) do
		local entry = {};
		ContextPtr:BuildInstanceForControl( "InstantYieldsInstance", entry, Controls.InstantYieldCityStack );
		entry.InstantYieldName:SetText(v.Name);
		entry.InstantYieldCheckbox:SetCheck(not pPlayer:IsInstantYieldNotificationDisabled(v.Index));
		entry.InstantYieldCheckbox:RegisterCheckHandler( function() ToggleInstantYieldSetting(entry.InstantYieldCheckbox, pPlayer, v.Index) end );
	end
	for i,v in ipairs(g_InstantYieldMilitarySorted) do
		local entry = {};
		ContextPtr:BuildInstanceForControl( "InstantYieldsInstance", entry, Controls.InstantYieldMilitaryStack );
		entry.InstantYieldName:SetText(v.Name);
		entry.InstantYieldCheckbox:SetCheck(not pPlayer:IsInstantYieldNotificationDisabled(v.Index));
		entry.InstantYieldCheckbox:RegisterCheckHandler( function() ToggleInstantYieldSetting(entry.InstantYieldCheckbox, pPlayer, v.Index) end );
	end
	for i,v in ipairs(g_InstantYieldCivilianSorted) do
		local entry = {};
		ContextPtr:BuildInstanceForControl( "InstantYieldsInstance", entry, Controls.InstantYieldCivilianStack);
		entry.InstantYieldName:SetText(v.Name);
		entry.InstantYieldCheckbox:SetCheck(not pPlayer:IsInstantYieldNotificationDisabled(v.Index));
		entry.InstantYieldCheckbox:RegisterCheckHandler( function() ToggleInstantYieldSetting(entry.InstantYieldCheckbox, pPlayer, v.Index) end );
	end
	for i,v in ipairs(g_InstantYieldSpiesSorted) do
		local entry = {};
		ContextPtr:BuildInstanceForControl( "InstantYieldsInstance", entry, Controls.InstantYieldSpiesStack );
		entry.InstantYieldName:SetText(v.Name);
		entry.InstantYieldCheckbox:SetCheck(not pPlayer:IsInstantYieldNotificationDisabled(v.Index));
		entry.InstantYieldCheckbox:RegisterCheckHandler( function() ToggleInstantYieldSetting(entry.InstantYieldCheckbox, pPlayer, v.Index) end );
	end
	for i,v in ipairs(g_InstantYieldMiscSorted) do
		entry = {};
		ContextPtr:BuildInstanceForControl( "InstantYieldsInstance", entry, Controls.InstantYieldMiscStack );
		entry.InstantYieldName:SetText(v.Name);
		entry.InstantYieldCheckbox:SetCheck(not pPlayer:IsInstantYieldNotificationDisabled(v.Index));
		entry.InstantYieldCheckbox:RegisterCheckHandler( function() ToggleInstantYieldSetting(entry.InstantYieldCheckbox, pPlayer, v.Index) end );
	end
    -- Set player icon at top of screen
    --CivIconHookup( 0, 64, Controls.Icon, Controls.CivIconBG, Controls.CivIconShadow, false, true );
    
	Controls.InstantYieldCityStack:CalculateSize();
    Controls.InstantYieldMilitaryStack:CalculateSize();
    Controls.InstantYieldCivilianStack:CalculateSize();
    Controls.InstantYieldSpiesStack:CalculateSize();
    Controls.InstantYieldMiscStack:CalculateSize();
	
	Controls.AllInstantYieldsStack:CalculateSize();
	Controls.AllInstantYieldsStack:ReprocessAnchoring();
	Controls.AllInstantYieldsScrollPanel:CalculateInternalSize();
end
ContextPtr:SetShowHideHandler(ShowHideHandler);
ContextPtr:SetHide(true);


function InputHandler( uiMsg, wParam, lParam )
    if uiMsg == KeyEvents.KeyDown then
        if (wParam == Keys.VK_ESCAPE or wParam == Keys.VK_RETURN) then
			OnClose();
			return true;
        end
    end
end
ContextPtr:SetInputHandler( InputHandler );

function OnAdditionalInformationDropdownGatherEntries(additionalEntries)
  table.insert(additionalEntries, {text=Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SETTINGS_TITLE"), call=OpenNotificationSettings})
end

LuaEvents.AdditionalInformationDropdownGatherEntries.Add(OnAdditionalInformationDropdownGatherEntries)
LuaEvents.RequestRefreshAdditionalInformationDropdownEntries()

Events.GameplaySetActivePlayer.Add(OnClose)