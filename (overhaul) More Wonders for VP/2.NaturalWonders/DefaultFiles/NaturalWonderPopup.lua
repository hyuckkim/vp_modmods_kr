-------------------------------------------------
-- Natural Wonder Popup
-------------------------------------------------
include( "IconSupport" )

local m_PopupInfo = nil
local L = Locale.ConvertTextKey

-------------------------------------------------
-- On Display
-------------------------------------------------
function OnPopup( popupInfo )
	if popupInfo.Type ~= ButtonPopupTypes.BUTTONPOPUP_NATURAL_WONDER_REWARD then return end
	
	local x = popupInfo.Data1
	local y = popupInfo.Data2
	local iFinderGold = popupInfo.Data3
	local bFirstFinder = popupInfo.Option1
	
	SetIcon(x, y)
	
	m_PopupInfo = popupInfo
	
	local pNaturalWonderPlot = Map.GetPlot(x, y)
	local eFeature = pNaturalWonderPlot:GetFeatureType()
	local pFeature = GameInfo.Features[eFeature]
	local sFeatureCondition = "FeatureType = '" .. pFeature.Type .. "'"
	
	local sTitle = L("TXT_KEY_MORE_NATURAL_WONDERS_TITLE", pFeature.Description)			
	--local sYield = L("TXT_KEY_MORE_NATURAL_WONDERS_HAPPINESS", pFeature.InBorderHappiness)
	
	sYield = L("TXT_KEY_MORE_NATURAL_WONDERS_YIELDS")

	for row in GameInfo.Feature_YieldChanges(sFeatureCondition) do
	    if row.Yield > 0 then
			sYield = sYield .. " " .. tostring(row.Yield) .. " ".. GameInfo.Yields[row.YieldType].IconString
		end
	end	

	sYield = sYield .. " " .. L("TXT_KEY_MORE_NATURAL_WONDERS_YIELDS_PER_ERA")

	for row in GameInfo.Feature_EraYieldChanges(sFeatureCondition) do
	    if row.Yield > 0 then
			sYield = sYield .. " +" .. tostring(row.Yield) .. " " .. GameInfo.Yields[row.YieldType].IconString
		end
	end

	sYield = sYield .. ")"

	for row in GameInfo.Plot_AdjacentFeatureYieldChanges(sFeatureCondition) do
		if row.Yield > 0 or row.Yield < 0 then
			sYield = sYield .. L("TXT_KEY_MORE_NATURAL_WONDERS_YIELDS_ADJACENT")
			break
		end
	end
	for row in GameInfo.Plot_AdjacentFeatureYieldChanges(sFeatureCondition) do
		if row.Yield > 0 then
			sYield = sYield .. " +" .. tostring(row.Yield) .. " " .. GameInfo.Yields[row.YieldType].IconString .. " (" .. L(GameInfo.Plots[row.PlotType].Description) .. ")"
		end
		if row.Yield < 0 then
			sYield = sYield .. " [COLOR_NEGATIVE_TEXT]" .. tostring(row.Yield) .. "[ENDCOLOR] " .. GameInfo.Yields[row.YieldType].IconString .. " (" .. L(GameInfo.Plots[row.PlotType].Description) .. ")"
		end
	end

	--[[for row in GameInfo.Feature_RiverYieldChanges(sFeatureCondition) do
	    if row.Yield > 0 then
			if sYield ~= "" then
				sYield = sYield .. L("TXT_KEY_MORE_NATURAL_WONDERS_YIELDS_RIVER")
			end

	        iYieldsCount = iYieldsCount + 1
			sYield = sYield .. " +" .. tostring(row.Yield) .. " " .. GameInfo.Yields[row.YieldType].IconString
		end
	end--]]

	

	if pFeature.PassableTechFeature or iFinderGold > 0 or pFeature.Defense > 0 or pFeature.TurnDamage > 0 then
		sYield = sYield .. L("TXT_KEY_MORE_NATURAL_WONDERS_ABILITIES_HEADER")
	end	
	
	if pFeature.PassableTechFeature then
		sYield = sYield .. L("TXT_KEY_MORE_NATURAL_WONDERS_PASSABLE", L(GameInfo.Technologies[pFeature.PassableTechFeature].Description))
	end

	if pFeature.Movement >= 10 then
		sYield = sYield .. L("TXT_KEY_MORE_NATURAL_MOVE_END")
	end

	if iFinderGold > 0 then
		if bFirstFinder then
			sYield = sYield .. L("TXT_KEY_MORE_NATURAL_WONDERS_GOLD_FIRST_FIND", iFinderGold)
		else
			sYield = sYield .. L("TXT_KEY_MORE_NATURAL_WONDERS_GOLD_NEXT_FIND", iFinderGold)
		end
	end
	
	if pFeature.Defense > 0 then
		sYield = sYield .. L("TXT_KEY_MORE_NATURAL_WONDERS_DEFENSE", pFeature.Defense)
	end	
	
	if pFeature.TurnDamage > 0 then
		sYield = sYield .. L("TXT_KEY_MORE_NATURAL_WONDERS_DAMAGE", pFeature.TurnDamage)
	end



	local sExtendedWonderInfo = L("TXT_KEY_MORE_NATURAL_WONDERS_EXTENDED_" .. pFeature.Type)

	if pFeature.AddsFreshWater or pFeature.AdjacentUnitFreePromotion or pFeature.FreePromotionIfOwned or sExtendedWonderInfo ~= "" then
		sYield = sYield .. L("TXT_KEY_MORE_NATURAL_WONDERS_OTHER_ABILITIES_HEADER")
	end
	
	if pFeature.AddsFreshWater then
		sYield = sYield .. L("TXT_KEY_MORE_NATURAL_WONDERS_FRESH_WATER")
	end

	if pFeature.FreePromotionIfOwned then
		local pPromotion = GameInfo.UnitPromotions[pFeature.FreePromotionIfOwned]
		sYield = sYield .. L("TXT_KEY_MORE_NATURAL_WONDERS_FREE_PROMOTION", "TXT_KEY_MORE_NATURAL_WONDERS_PROMOTION_DETAILS_" .. pPromotion.Type, L(pPromotion.Description), L(pPromotion.Help))
	end
	
	if pFeature.AdjacentUnitFreePromotion then
		local pPromotion = GameInfo.UnitPromotions[pFeature.AdjacentUnitFreePromotion]
		sYield = sYield .. L("TXT_KEY_MORE_NATURAL_WONDERS_NEAR_PROMOTION", "TXT_KEY_MORE_NATURAL_WONDERS_PROMOTION_DETAILS_" .. pPromotion.Type, L(pPromotion.Description), L(pPromotion.Help))
	end

	if pFeature.LocationUnitFreePromotion then
		local pPromotion = GameInfo.UnitPromotions[pFeature.LocationUnitFreePromotion]
		sYield = sYield .. L("TXT_KEY_MORE_NATURAL_WONDERS_LOCATION_PROMOTION", "TXT_KEY_MORE_NATURAL_WONDERS_PROMOTION_DETAILS_" .. pPromotion.Type, L(pPromotion.Description), L(pPromotion.Help))
	end

	if sExtendedWonderInfo ~= "" then
		sYield = sYield .. sExtendedWonderInfo
	end



	local sExtendedWonderMapInfo = L("TXT_KEY_MORE_NATURAL_WONDERS_EXTENDED_MAP_" .. pFeature.Type)

	if sExtendedWonderMapInfo ~= "" then
		sYield = sYield .. L("TXT_KEY_MORE_NATURAL_WONDERS_MAP_ABILITIES_HEADER")
		sYield = sYield .. sExtendedWonderMapInfo
	end


	Controls.TitleLabel:SetText(sTitle)	
	Controls.DescriptionLabel:SetText(sYield)	

	UIManager:QueuePopup(ContextPtr, PopupPriority.NaturalWonderPopup)
end
Events.SerialEventGameMessagePopup.Add(OnPopup)

function SetIcon(x, y)
	local pNaturalWonderPlot = Map.GetPlot(x, y)
	local eFeature = pNaturalWonderPlot:GetFeatureType()
	local pFeature = GameInfo.Features[eFeature]

	if pFeature.NaturalWonder or pFeature.PseudoNaturalWonder then
		IconHookup(pFeature.PortraitIndex, 128, pFeature.IconAtlas, Controls.Icon)
		Controls.WonderLabel:LocalizeAndSetText(pFeature.Description)
		Controls.QuoteLabel:LocalizeAndSetText(L("TXT_KEY_MORE_NATURAL_WONDERS_QUOTE_" .. pFeature.Type))
	end
end

----------------------------------------------------------------        
-- Input processing
----------------------------------------------------------------        
function OnCloseButtonClicked()
    UIManager:DequeuePopup(ContextPtr)
end
Controls.CloseButton:RegisterCallback(Mouse.eLClick, OnCloseButtonClicked)

function InputHandler(uiMsg, wParam, lParam)
    if uiMsg == KeyEvents.KeyDown then
        if wParam == Keys.VK_ESCAPE or wParam == Keys.VK_RETURN then
            OnCloseButtonClicked()
            return true
        end
    end
end
ContextPtr:SetInputHandler(InputHandler)

function ShowHideHandler( bIsHide, bInitState )
    if not bInitState then
        if not bIsHide then
        	UI.incTurnTimerSemaphore()
        	Events.SerialEventGameMessagePopupShown(m_PopupInfo)
        else
            UI.decTurnTimerSemaphore()
            Events.SerialEventGameMessagePopupProcessed.CallImmediate(ButtonPopupTypes.BUTTONPOPUP_NATURAL_WONDER_REWARD, 0)
        end
    end
end
ContextPtr:SetShowHideHandler(ShowHideHandler)

----------------------------------------------------------------
-- 'Active' (local human) player has changed
----------------------------------------------------------------
Events.GameplaySetActivePlayer.Add(OnClose)
