-- Lua MinorCivLeaders
-- Author: Nutty, based on Gedemon's Ynaemp Leaders for City States
-- DateCreated: 3/27/2011 8:52:38 PM
-------------------------------------------------------------------

local g_iMinorCivID = -1
local g_iMinorCivTeamID = -1
local g_control = nil
local m_PopupInfo = nil

----------------------
-- On City State PopUp
----------------------
function OnEventReceived( popupInfo )
	
	if (popupInfo.Type == ButtonPopupTypes.BUTTONPOPUP_CITY_STATE_DIPLO) then
		g_control = "/InGame/CityStateDiploPopup/"
	elseif (popupInfo.Type == ButtonPopupTypes.BUTTONPOPUP_CITY_STATE_GREETING) then
		g_control = "/InGame/CityStateGreetingPopup/"
	elseif (popupInfo.Type == ButtonPopupTypes.BUTTONPOPUP_CITY_STATE_MESSAGE) then
		g_control = "/InGame/CityStateDiploPopup/"
	else
		return
	end
	
	m_PopupInfo = popupInfo	
	
    local iPlayer = popupInfo.Data1
    local pPlayer = Players[iPlayer]
	local iTeam = pPlayer:GetTeam()
	local pTeam = Teams[iTeam]
    
    g_iMinorCivID = iPlayer
    g_iMinorCivTeamID = iTeam
	
	local bForcePeace = false

	SetCityStateLeader()
end
Events.SerialEventGameMessagePopup.Add( OnEventReceived )

function OnGameDataDirty()
	if (not (ContextPtr:LookUpControl("/InGame/CityStateDiploPopup"):IsHidden())) then
		g_control = "/InGame/CityStateDiploPopup/"
	elseif (not (ContextPtr:LookUpControl("/InGame/CityStateGreetingPopup"):IsHidden())) then
		g_control = "/InGame/CityStateGreetingPopup/"
	else
		return
	end

	SetCityStateLeader()
end
Events.SerialEventGameDataDirty.Add( OnGameDataDirty )

------------------------
-- Set City State Leader 
------------------------
function SetCityStateLeader()	
	
	--if (ContextPtr:LookUpControl("/InGame/CityStateDiploPopup"):IsHidden()) then
	--	if (ContextPtr:LookUpControl("/InGame/CityStateGreetingPopup"):IsHidden()) then
	--		return
	--	end
	--end

	local pPlayer = Players[g_iMinorCivID];
	local sMinorCivType = pPlayer:GetMinorCivType();
	
	local leaderIcon = nil;
	local modernCountry = nil;
	--local shortModernCountry = nil;
	local leaderPlace = nil;
	local leaderName = nil;
	--local leaderTitle = nil;
	--local leaderSuffix = nil;
	--local artistName = nil;
	--local title = nil;
	local description = nil;
	local status = nil;
	local trait = nil;
	local personality = nil;

	if (sMinorCivType ~= nil) then
		local realMinorCivType = GameInfo.MinorCivilizations[sMinorCivType].Type;
		
		if realMinorCivType ~= nil then
			local condition = "Type = '".. realMinorCivType .."'";
			for row in GameInfo.MinorCivLeaders(condition) do
				leaderIcon = row.LeaderIcon;
				modernCountry = row.ModernCountry;
				--shortModernCountry = row.ShortModernCountry;
				leaderPlace = row.LeaderPlace;
				leaderName = row.LeaderName;
				--leaderTitle = row.LeaderTitle;
				--leaderSuffix = row.LeaderSuffix;
				--artistName = row.LeaderArtistName;
			end
		end
	end

	description = ContextPtr:LookUpControl(g_control .."DescriptionLabel"):GetText();
	
	if (description:sub(1, 18) ~= "[COLOR_POPUP_TEXT]") then
		--title = leaderName .." of ".. ContextPtr:LookUpControl(g_control .."TitleLabel"):GetText();
		if (leaderName ~= nil) then
			local artPack = GameInfo.MinorCivLeaders["ARTPACK"].LeaderIcon;
			
			if artPack == "MODERN_FLAGS" then
				--[for Modern Flags Art Pack (e.g., "Romania"):]
				description = "[COLOR_POPUP_TEXT]".. modernCountry .."[ENDCOLOR][NEWLINE]".. description;
			elseif artPack == "NONE" then
				--[for LEADERS version:] (e.g., "Vlad III of Wallachia says:"):]
				description = "[COLOR_POPUP_TEXT]".. leaderName .." of ".. leaderPlace .." says:[ENDCOLOR][NEWLINE]".. description;

				--[Alternative long LEADERS version: (e.g., "Prince Vlad III the Impaler of Wallachia says:"):]
				--description = " of ".. leaderPlace .."[ENDCOLOR] says:[NEWLINE]".. description;
				--if (leaderSuffix ~= nil)
				--	description = leaderName .." ".. leaderSuffix .. description;
				--else
				--  description = leaderName .. description;
				--end
				--if (leaderTitle ~= nil)
				--	description = leaderTitle .." ".. description;
				--end
				--description = "[COLOR_POPUP_TEXT]".. description;
			else
				description = "[COLOR_POPUP_TEXT]".. leaderName .."[ENDCOLOR][NEWLINE]".. description;
			end

		else
			description = "[COLOR_POPUP_TEXT][ENDCOLOR]".. description;
		end

		trait = ContextPtr:LookUpControl(g_control .."TraitInfo"):GetText();
		if (trait == "[COLOR_POSITIVE_TEXT]".. Locale.ConvertTextKey("TXT_KEY_CITY_STATE_CULTURED_ADJECTIVE") .."[ENDCOLOR]") then
			trait = trait:gsub("POSITIVE_TEXT]", "MAGENTA][ICON_CULTURE] ");
		elseif (trait == "[COLOR_POSITIVE_TEXT]".. Locale.ConvertTextKey("TXT_KEY_CITY_STATE_MILITARISTIC_ADJECTIVE") .."[ENDCOLOR]") then
			trait = trait:gsub("POSITIVE_TEXT]", "RED][ICON_WAR] ");
		elseif (trait == "[COLOR_POSITIVE_TEXT]".. Locale.ConvertTextKey("TXT_KEY_CITY_STATE_MARITIME_ADJECTIVE") .."[ENDCOLOR]") then
			trait = trait:gsub("POSITIVE_TEXT]", "CYAN][ICON_FOOD] ");
		elseif (trait == "[COLOR_POSITIVE_TEXT]".. Locale.ConvertTextKey("TXT_KEY_CITY_STATE_MERCANTILE_ADJECTIVE") .."[ENDCOLOR]") then
			trait = trait:gsub("POSITIVE_TEXT]", "YELLOW][ICON_GOLD] ");
		elseif (trait == "[COLOR_POSITIVE_TEXT]".. Locale.ConvertTextKey("TXT_KEY_CITY_STATE_RELIGIOUS_ADJECTIVE") .."[ENDCOLOR]") then
			trait = trait:gsub("POSITIVE_TEXT]", "WHITE][ICON_PEACE] ");
		end

		personality = ContextPtr:LookUpControl(g_control .."PersonalityInfo"):GetText();
		if (personality == "[COLOR_POSITIVE_TEXT]".. Locale.ConvertTextKey("TXT_KEY_CITY_STATE_PERSONALITY_FRIENDLY") .."[ENDCOLOR]") then
			personality = personality:gsub("COLOR_POSITIVE_TEXT]", "COLOR_POSITIVE_TEXT][ICON_HAPPINESS_1] ");
		elseif (personality == "[COLOR_POSITIVE_TEXT]" ..Locale.ConvertTextKey("TXT_KEY_CITY_STATE_PERSONALITY_NEUTRAL") .."[ENDCOLOR]") then
			personality = personality:gsub("COLOR_POSITIVE_TEXT]", "COLOR_FADING_POSITIVE_TEXT][ICON_HAPPINESS_2] ");
		elseif (personality == "[COLOR_POSITIVE_TEXT]" ..Locale.ConvertTextKey("TXT_KEY_CITY_STATE_PERSONALITY_IRRATIONAL") .."[ENDCOLOR]") then
			personality = personality:gsub("COLOR_POSITIVE_TEXT]", "COLOR_FADING_NEGATIVE_TEXT][ICON_HAPPINESS_3] ");
		elseif (personality == "[COLOR_POSITIVE_TEXT]" ..Locale.ConvertTextKey("TXT_KEY_CITY_STATE_PERSONALITY_HOSTILE") .."[ENDCOLOR]") then
			personality = personality:gsub("COLOR_POSITIVE_TEXT]", "COLOR_NEGATIVE_TEXT][ICON_HAPPINESS_4] ");
		end

		if (g_control == "/InGame/CityStateDiploPopup/") then
			--status = ContextPtr:LookUpControl("/InGame/CityStateDiploPopup/StatusInfo"):GetText();
			--if (status == "[COLOR_POSITIVE_TEXT]".. Locale.ConvertTextKey("TXT_KEY_CITY_STATE_PERSONALITY_NEUTRAL") .. "[ENDCOLOR]") then
			--	status = status:gsub("[COLOR_POSITIVE_TEXT]", "[COLOR_FADING_POSITIVE_TEXT]");
			--elseif status == "" then
			--	status = "";
			--	ContextPtr:LookUpControl("/InGame/CityStateDiploPopup/StatusInfo"):LocalizeAndSetText(status);
			--end
			--ContextPtr:LookUpControl(g_control .."StatusIcon"):UnloadTexture();
			ContextPtr:LookUpControl(g_control .."StatusIcon"):SetTexture("blank_texture.dds");
		end

		if (leaderIcon ~= nil) then
			local prefix = nil;
			local gk_mode = Game.GetReligionName ~= nil;
			local bnw_mode = Game.GetActiveLeague ~= nil;
			if bnw_mode then
				prefix = "bnw_";
			elseif gk_mode then
				prefix = "g+k_";
			else
				prefix = "van_";
			end
				
			ContextPtr:LookUpControl(g_control .."TitleIcon"):UnloadTexture();
			ContextPtr:LookUpControl(g_control .."TitleIcon"):SetTextureAndResize(prefix .. leaderIcon);
		else
			ContextPtr:LookUpControl(g_control .."TitleIcon"):UnloadTexture();
			ContextPtr:LookUpControl(g_control .."TitleIcon"):SetTextureAndResize(GameInfo.MinorCivTraits[GameInfo.MinorCivilizations[sMinorCivType].MinorCivTrait].TraitTitleIcon);
		end

		--ContextPtr:LookUpControl(g_control .."BackgroundImage"):UnloadTexture();
		--ContextPtr:LookUpControl(g_control .."BackgroundImage"):SetTexture("CityStateBackgroundCulture.dds");

		--ContextPtr:LookUpControl(g_control .."TitleLabel"):LocalizeAndSetText(title);
		ContextPtr:LookUpControl(g_control .."DescriptionLabel"):LocalizeAndSetText(description);
		ContextPtr:LookUpControl(g_control .."TraitInfo"):LocalizeAndSetText(trait);
		ContextPtr:LookUpControl(g_control .."PersonalityInfo"):LocalizeAndSetText(personality);
	end
end