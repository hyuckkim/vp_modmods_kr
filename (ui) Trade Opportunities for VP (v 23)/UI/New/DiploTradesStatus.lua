print("Loading DiploTradeStatus.lua from TOfVP")
--------------------------------------------------------------
-- New Trade Opportunities panel
-- Dec 13, 2017: Retrofitted for Vox Populi, Infixo
-- Jan 14, 2020: Improved, adan_eslavo
--------------------------------------------------------------
include("IconSupport")
include("SupportFunctions")
include("InstanceManager")
include("InfoTooltipInclude")

local L = Locale.ConvertTextKey

local g_PlayerIM = InstanceManager:new("TradeStatusInstance", "TradeBox", Controls.PlayerBox)
local g_AiIM = InstanceManager:new("TradeStatusInstance", "TradeBox", Controls.AiStack)
local g_CsIM = InstanceManager:new("CityStateInstance", "TradeBox", Controls.AiStack)
local g_ResourceIM = InstanceManager:new("TradeResourcesInstance", "TradeBox", Controls.ResourceBox)

local g_SortTable
local g_ePreviousResource = -1

local g_tCsCoordinates = {}

local g_tValidImprovements = {
	"IMPROVEMENT_CAMP",
	"IMPROVEMENT_MINE",
	"IMPROVEMENT_QUARRY",
	"IMPROVEMENT_PLANTATION",
	"IMPROVEMENT_FISHING_BOATS",
	"IMPROVEMENT_PASTURE"
}

local g_sColorBrown = "[COLOR_CITY_GREY]"
local g_sColorDarkGreen = "[COLOR:0:135:0:255]"
local g_sColorLightGreen = "[COLOR:125:255:0:255]"
local g_sColorYellowGreen = "[COLOR:200:180:0:255]"
local g_sColorYellow = "[COLOR:255:255:100:255]"
local g_sColorRed = "[COLOR:255:70:70:255]"
local g_sColorPink = "[COLOR:255:100:255:255]"
local g_sColorPurple = "[COLOR:255:50:150:255]"
local g_sColorBlue = "[COLOR_CITY_BLUE]"
local g_sColorCyan = "[COLOR_CYAN]"	
local g_sColorOrange = "[COLOR_YIELD_FOOD]"

local g_sColorResourceLuxury = "[COLOR:255:235:30:255]"
local g_sColorResourceStrategic = "[COLOR:210:210:210:255]"
local g_sColorResourceName

local g_sColorWar = "[COLOR_NEGATIVE_TEXT]"
local g_sColorFriendly = "[COLOR_POSITIVE_TEXT]"
local g_sColorGuarded = "[COLOR_YELLOW]"
local g_sColorDenounce = "[COLOR_MAGENTA]"
local g_sColorAfraid = "[COLOR_YIELD_FOOD]"

local g_sColorFadingRed = "[COLOR_FADING_NEGATIVE_TEXT]"
local g_sColorLightOrange = "[COLOR_PLAYER_LIGHT_ORANGE_TEXT]"
local g_sColorMagenta = "[COLOR_MAGENTA]"

local g_tIsCsHasResourceUnimproved = {}

local g_iNeutralThreshold = GameDefines.FRIENDSHIP_THRESHOLD_NEUTRAL
local g_iFriendThreshold = GameDefines.FRIENDSHIP_THRESHOLD_FRIENDS
local g_iAllyThreshold = GameDefines.FRIENDSHIP_THRESHOLD_ALLIES

-- open window?
function ShowHideHandler(bIsHide, bIsInit)
	if not bIsInit and not bIsHide then
		g_ResourceIM:ResetInstances()
		g_PlayerIM:ResetInstances()
		g_AiIM:ResetInstances()
		g_CsIM:ResetInstances()
	  
		local ePlayer = Game.GetActivePlayer()
		
		InitPlayer(ePlayer)
		InitAiList(ePlayer)
	end
end
ContextPtr:SetShowHideHandler(ShowHideHandler)

-- draw first player line
function InitPlayer(ePlayer)
	GetCivControl(g_PlayerIM, ePlayer, false)
end

-- check if there are AIs and run lines for them
function InitAiList(ePlayer)
	local pPlayer = Players[ePlayer]
	local pTeam = Teams[pPlayer:GetTeam()]
	local iCount = 0

	g_SortTable = {}
  
	for playerLoop = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local pOtherPlayer = Players[playerLoop]
		local eOtherTeam = pOtherPlayer:GetTeam()
		
		-- draw new resource lines for each met civ
		if playerLoop ~= ePlayer and pOtherPlayer:IsAlive() then
			if pTeam:IsHasMet(eOtherTeam) then
				iCount = iCount + 1
				GetCivControl(g_AiIM, playerLoop, true)
			end
		end
	end
	
	-- draw CSs columns for each resource
	if InitCsList() then
		iCount = iCount + 1
	end

	if iCount == 0 then
		Controls.AiNoneMetText:SetHide(false)
		Controls.AiScrollPanel:SetHide(true)
	else
		Controls.AiNoneMetText:SetHide(true)
		Controls.AiScrollPanel:SetHide(false)

		Controls.AiStack:SortChildren(ByScore)
		Controls.AiStack:CalculateSize()
		Controls.AiStack:ReprocessAnchoring()
		Controls.AiScrollPanel:CalculateInternalSize()
	end
end

-- sorting rules
function ByScore(a, b)
	local entryA = g_SortTable[tostring(a)]
	local entryB = g_SortTable[tostring(b)]

	if entryA == nil or entryB == nil then 
		if entryA ~= nil and entryB == nil then
			return true
		elseif entryA == nil and entryB ~= nil then
			return false
		else
			return (tostring(a) < tostring(b)) -- gotta do something!
		end
	end

	return (Players[entryA.PlayerID]:GetScore() > Players[entryB.PlayerID]:GetScore())
end

-- function drawing resource lines
function GetCivControl(im, ePlayer, bCanTrade)
	local eActivePlayer = Game.GetActivePlayer()
	local bIsActivePlayer = (eActivePlayer == ePlayer)
	local pActivePlayer = Players[eActivePlayer]
	local eActiveTeam = pActivePlayer:GetTeam()
	local pActiveTeam = Teams[eActiveTeam]

	local pPlayer = Players[ePlayer]
	local eTeam = pPlayer:GetTeam()
	local pTeam = Teams[eTeam]
	local civilization = GameInfo.Civilizations[pPlayer:GetCivilizationType()]
        
	local pDeal = UI.GetScratchDeal()

	local tSortEntry = {}
	
	local imControlTableHeader = g_ResourceIM:GetInstance()
	local imControlTable = im:GetInstance()
		
	imControlTable.TradeOps:SetHide(false)

	local bIsAtWar = pActiveTeam:IsAtWar(eTeam) == true
	imControlTable.TradeWar:SetHide(not bIsAtWar)

	local bIsSanctioned = Game.IsResolutionPassed(GameInfoTypes.RESOLUTION_PLAYER_EMBARGO, ePlayer)
	imControlTable.TradeSanction:SetHide(not bIsSanctioned or bIsAtWar)

	imControlTable.CivName:SetText(L(civilization.ShortDescription))
	CivIconHookup(ePlayer, 32, imControlTable.CivSymbol, imControlTable.CivIconBG, imControlTable.CivIconShadow, false, true)
	imControlTable.CivIconBG:SetHide(false)

	if bCanTrade then        
		imControlTable.CivButton:SetVoid1(ePlayer)
		imControlTable.CivButton:RegisterCallback(Mouse.eLClick, OnCivSelected)

		g_SortTable[tostring(imControlTable.TradeBox)] = tSortEntry
		tSortEntry.PlayerID = ePlayer
	else
		imControlTable.CivButtonHL:SetHide(true)
	end
	
	local sGatheredOtherHeaders = ""
	local sGatheredOtherTooltips = ""
	local sText = ""
	local sToolTip = ""
	local sDeals = ""
	local sVerifiedDeals = ""
	local sColorDots = g_sColorBrown
	
	local controlOther = imControlTable["RESOURCE_OTHER_LUXURIES"]
	controlOther:SetText(sText)		
	controlOther:SetToolTipString(sToolTip)
		
	imControlTableHeader.RESOURCE_OTHER_LUXURIES_ICON:SetHide(true)
	imControlTableHeader["Other"]:SetText(sText)
	
	-- draw headers and lines
	for resource in GameInfo.Resources() do
		if resource.ResourceUsage > 0 then
			-- header
			local controlHeader = imControlTableHeader[L(resource.Description)]
			
			g_sColorResourceName = g_sColorResourceLuxury
			if resource.ResourceUsage == 1 then
				g_sColorResourceName = g_sColorResourceStrategic
			end
			local sColorResourceImprovement = g_sColorCyan
			
			if controlHeader == nil then
				local sImprovement = ""
				local pImprovement = GameInfo.Improvement_ResourceTypes{ResourceType=resource.Type}()
				local bIsUniqueLuxuryNotFromMercantile = pImprovement and pImprovement.ImprovementType == 'IMPROVEMENT_CITY'
				
				if resource.OnlyMinorCivs or bIsUniqueLuxuryNotFromMercantile then
					sImprovement = "City-State"
				else
					for _, validImprovement in ipairs(g_tValidImprovements) do
						for improvement in GameInfo.Improvement_ResourceTypes() do
							if improvement.ResourceType == resource.Type and improvement.ImprovementType == validImprovement then
								sImprovement = L("TXT_KEY_" .. improvement.ImprovementType)
							end
						end
					end

					if sImprovement == "" then
						for quantity in GameInfo.Building_ResourceQuantity{ResourceType=resource.Type} do
							for building in GameInfo.Buildings{Type=quantity.BuildingType} do
								sImprovement = L(building.Description)
								break
							end
						end

						for plot in GameInfo.Building_ResourcePlotsToPlace{ResourceType=resource.Type} do
							for building in GameInfo.Buildings{Type=plot.BuildingType} do
								sImprovement = L(building.Description)
								break
							end
						end
					end
				end
				
				local sHelp = L(resource.Help)
				sHelp = string.gsub(sHelp, "(.-)(Monopoly Bonus:)(.-)", "[COLOR_POSITIVE_TEXT]M.B.:[ENDCOLOR]%3")

				local sOtherHeader = L("TXT_KEY_DO_TRADE_OTHER_HEADER", L(resource.IconString), g_sColorResourceName, L(resource.Description), sColorResourceImprovement, sImprovement, sHelp)

				if sGatheredOtherHeaders == "" then
					sGatheredOtherHeaders = sOtherHeader
				else
					sGatheredOtherHeaders = sGatheredOtherHeaders .. "[NEWLINE]" .. sOtherHeader
				end
				
				local controlHeaderBox = imControlTableHeader.RESOURCE_OTHER_LUXURIES_ICON
				controlHeaderBox:SetHide(false)
				
				controlHeader = imControlTableHeader["Other"]
				controlHeader:SetText("[ICON_RES_HIDDEN_ARTIFACTS]")
				controlHeader:SetToolTipString(sGatheredOtherHeaders)
			else
				controlHeader:SetText(L(resource.IconString))
				controlHeader:SetToolTipString(L("TXT_KEY_DO_TRADE_HEADER", resource.IconString, g_sColorResourceName, L(resource.Description), L(resource.Help)))
			end
			
			-- values
			sText, sToolTip, sDeals, sColorValue = GetUsefulResourceText(pPlayer, resource, bIsActivePlayer, pActivePlayer)
			local control = imControlTable[resource.Type]
			
			if control == nil then
				if sGatheredOtherTooltips == "" then
					sGatheredOtherTooltips = sToolTip
				else
					sGatheredOtherTooltips = sGatheredOtherTooltips .. "[NEWLINE]" .. sToolTip
				end

				local iPosStart, iPosEnd = string.find(sToolTip, "unavailable")
				
				if iPosStart == nil and sColorValue ~= g_sColorBrown then
					if sColorDots ~= g_sColorCyan and sColorDots ~= g_sColorBlue then
						sColorDots = sColorValue
					end
				end
			else
				if sDeals ~= "" then
					sToolTip = sToolTip .. "[NEWLINE][NEWLINE]" .. sDeals
				end
				
				control:SetText(sText)
				control:SetToolTipString(sToolTip)
			end
			
			if sDeals ~= "" then
				sVerifiedDeals = sDeals
			end
		end
	end
	
	if sGatheredOtherTooltips ~= "" then
		if sVerifiedDeals ~= "" then
			sGatheredOtherTooltips = sGatheredOtherTooltips .."[NEWLINE][NEWLINE]" .. sVerifiedDeals
		end

		controlOther:SetText(sColorDots .. "...[ENDCOLOR]")
		controlOther:SetToolTipString(sGatheredOtherTooltips)
		Controls.BottomTrimNormal:SetHide(true)
		Controls.BottomTrimOther:SetHide(false)
		Controls.OtherHeader:SetHide(false)
	else
		Controls.BottomTrimNormal:SetHide(false)
		Controls.BottomTrimOther:SetHide(true)
		Controls.OtherHeader:SetHide(true)
	end

	local sCivName = GetApproach(pActivePlayer, pPlayer, L(civilization.ShortDescription))
	local sEraName = GameInfo.Eras[pPlayer:GetCurrentEra()].Description
	local iScore = pPlayer:GetScore()
	local iGoldPerTurn = ("%+2g"):format(pPlayer:CalculateGoldRate())
	local iTreasure = pPlayer:GetGold()
	
	local eReligionCreated = pPlayer:GetReligionCreatedByPlayer()
	local sReligionCreatedType, sReligionCreated
	
	if eReligionCreated ~= -1 then
		for row in GameInfo.Religions{ID=pPlayer:GetReligionCreatedByPlayer()} do
			sReligionCreatedType = row.Type
		end
		
		local pReligion =  GameInfo.Religions[sReligionCreatedType]
		
		sReligionCreated = "[NEWLINE]" .. pReligion.IconString .. " " .. L(pReligion.Description)
	else
		sReligionCreated = ""
	end
		
	local sPlayerTooltip = L("TXT_KEY_DO_TRADE_CIV_STATUS", sCivName, iScore, sEraName, iTreasure, iGoldPerTurn, sReligionCreated)

	if sVerifiedDeals ~= "" then
		sPlayerTooltip = sPlayerTooltip .. "[NEWLINE][NEWLINE]" .. sVerifiedDeals
	end

	imControlTable.CivButton:SetToolTipString(sPlayerTooltip)

	-- draw three additional action buttons
	local sResearchIcon = ""
	local sResearchTip = ""
  
	if bIsActivePlayer then
		sResearchIcon = ""
		sResearchTip = ""
	else
		if pDeal:IsPossibleToTradeItem(ePlayer, eActivePlayer, TradeableItems.TRADE_ITEM_RESEARCH_AGREEMENT, Game.GetDealDuration()) then
			sResearchIcon = "[ICON_RESEARCH]"
			sResearchTip = "TXT_KEY_DO_TRADE_STATUS_RA_YES_TT"
		elseif pTeam:IsHasResearchAgreement(eActiveTeam) then
			sResearchIcon = "[ICON_SWAP]"
			sResearchTip = "TXT_KEY_DO_TRADE_STATUS_RA_NO_TT"
		end
	end
	
	imControlTable.ResearchText:SetText(sResearchIcon)
	imControlTable.ResearchText:SetToolTipString(L(sResearchTip))

	local sEmbassyIcon = ""
	local sEmbassyTip = ""
  
	if bIsActivePlayer then
		sEmbassyIcon = ""
		sEmbassyTip = ""
	else
		if pDeal:IsPossibleToTradeItem(ePlayer, eActivePlayer, TradeableItems.TRADE_ITEM_ALLOW_EMBASSY, Game.GetDealDuration()) and
			pDeal:IsPossibleToTradeItem(eActivePlayer, ePlayer, TradeableItems.TRADE_ITEM_ALLOW_EMBASSY, Game.GetDealDuration()) then
			sEmbassyIcon = "[ICON_CITY_STATE]"
			sEmbassyTip = "TXT_KEY_DO_TRADE_STATUS_EMBASSY_YES_TT"
		elseif pTeam:HasEmbassyAtTeam(eActiveTeam) and pActiveTeam:HasEmbassyAtTeam(eTeam) then
			sEmbassyIcon = "[ICON_INFLUENCE]"
			sEmbassyTip = "TXT_KEY_DO_TRADE_STATUS_EMBASSY_NO_TT"
		elseif pActiveTeam:HasEmbassyAtTeam(eTeam) then
			sEmbassyIcon = "[ICON_CAPITAL]"
			sEmbassyTip = "TXT_KEY_DO_TRADE_STATUS_EMBASSY_US_TT"
		elseif pTeam:HasEmbassyAtTeam(eActiveTeam) then
			sEmbassyIcon = "[ICON_CAPITAL]"
			sEmbassyTip = "TXT_KEY_DO_TRADE_STATUS_EMBASSY_THEM_TT"
		end
	end
  
	imControlTable.EmbassyText:SetText(sEmbassyIcon)
	imControlTable.EmbassyText:SetToolTipString(L(sEmbassyTip))

	local sBordersIcon = ""
	local sBordersTip = ""
  
	if bIsActivePlayer then
		sBordersIcon = ""
		sBordersTip = ""
	else
		if pDeal:IsPossibleToTradeItem(ePlayer, eActivePlayer, TradeableItems.TRADE_ITEM_OPEN_BORDERS, Game.GetDealDuration()) and
			pDeal:IsPossibleToTradeItem(eActivePlayer, ePlayer, TradeableItems.TRADE_ITEM_OPEN_BORDERS, Game.GetDealDuration()) then
			sBordersIcon = "[ICON_TRADE]"
			sBordersTip = "TXT_KEY_DO_TRADE_STATUS_BORDERS_YES_TT"
		elseif pTeam:IsAllowsOpenBordersToTeam(eActiveTeam) and pActiveTeam:IsAllowsOpenBordersToTeam(eTeam) then
			sBordersIcon = "[ICON_TRADE_WHITE]"
			sBordersTip = "TXT_KEY_DO_TRADE_STATUS_BORDERS_NO_TT"
		elseif pTeam:IsAllowsOpenBordersToTeam(eActiveTeam) then
			sBordersIcon = "[ICON_ARROW_RIGHT]"
			sBordersTip = "TXT_KEY_DO_TRADE_STATUS_BORDERS_US_TT"
		elseif pActiveTeam:IsAllowsOpenBordersToTeam(eTeam) then
			sBordersIcon = "[ICON_ARROW_LEFT]"
			sBordersTip = "TXT_KEY_DO_TRADE_STATUS_BORDERS_THEM_TT"
		end
	end
  
	imControlTable.BordersText:SetText(sBordersIcon)
	imControlTable.BordersText:SetToolTipString(L(sBordersTip))

	return imControlTable
end

-- filling the gaps with colourful info
function GetUsefulResourceText(pPlayer, pResource, bIsActivePlayer, pActivePlayer)
	local eResource = pResource.ID
	local bIsPaper = eResource == GameInfoTypes.RESOURCE_PAPER
	
	local sText = ""
	local sToolTip = ""
	local sDeals = ""
	local sCityList = ""
	local iTotal = 0
	local sColorValue = g_sColorBrown
	
	if IsAvailableLuxury(eResource) and IsVisibleUsefulResource(eResource, pActivePlayer) then		
		local bIsLuxury = (pResource.ResourceUsage == 2)
		local bIsStrategic = (pResource.ResourceUsage == 1)

		local iMinors  = pPlayer:GetResourceFromMinors(eResource) -- doubling the number of resources after allying? Commented out...
		local iImports = pPlayer:GetResourceImport(eResource)
		local iExports = pPlayer:GetResourceExport(eResource)
		local iLocal   = pPlayer:GetNumResourceTotal(eResource, false) + iExports
		local iUsed    = pPlayer:GetNumResourceUsed(eResource)
		
		local iSurplus = iLocal - iExports - iUsed
		iTotal = iLocal + --[[iMinors +--]] iImports - iExports - iUsed
		
		if bIsActivePlayer then
			if iTotal == 0 then
				local iCounter = 0
				
				sCityList, iCounter = GetGoldenAgeCities(pPlayer, pResource)

				if sCityList ~= "" then
					if iCounter > 1 then
						sColorValue = g_sColorBlue
					else
						sColorValue = g_sColorCyan
					end
				else
					sColorValue = g_sColorOrange
				end
			else
				if iSurplus > 3 then
					sColorValue = g_sColorDarkGreen
				elseif iSurplus > 1 then
					sColorValue = g_sColorLightGreen
				elseif iSurplus == 1 then
					sColorValue = g_sColorYellowGreen
				elseif iSurplus < 0 then
					sColorValue = g_sColorRed
				end
			end
		else
			local iActiveMinors  = pActivePlayer:GetResourceFromMinors(eResource) -- doubling the number of resources after allying? Commented out...
			local iActiveImports = pActivePlayer:GetResourceImport(eResource)
			local iActiveExports = pActivePlayer:GetResourceExport(eResource)
			local iActiveLocal   = pActivePlayer:GetNumResourceTotal(eResource, false) + iActiveExports
			local iActiveUsed    = pActivePlayer:GetNumResourceUsed(eResource)
			local iActiveFromGP  = pPlayer:GetResourcesFromGP(eResource) -- included in iActiveLocal
			
			local iActiveSurplus = iActiveLocal - iActiveExports - iActiveUsed
			local iActiveTotal   = iActiveLocal + --[[iActiveMinors +--]] iActiveImports - iActiveExports - iActiveUsed
			
			if Game.IsResolutionPassed(GameInfoTypes.RESOLUTION_BAN_LUXURY_HAPPINESS, eResource) then
				sColorValue = g_sColorPurple
			elseif iSurplus > 3 and iActiveTotal <= 0 then
				sColorValue = g_sColorDarkGreen
			elseif iSurplus > 1 and iActiveTotal <= 0 then
				sColorValue = g_sColorLightGreen
			elseif iSurplus < 0 then
				sColorValue = g_sColorRed
			elseif iTotal == 0 and iActiveSurplus > 0 then
				sColorValue = g_sColorOrange
			elseif iSurplus == 1 and iActiveTotal <= 0 and iTotal > 1 then
				sColorValue = g_sColorYellow
			elseif iSurplus == 1 and iActiveTotal <= 0 and bIsStrategic then
				sColorValue = g_sColorYellow
			elseif iSurplus == 1 and iActiveTotal <= 0 then
				sColorValue = g_sColorPink
			end
			
			-- current deals part copied and modified from EUI
			local table = EUI.table
			local tDealsFinalTurn = {}
			local tDeals = table()
			local iCurrentTurn = Game.GetGameTurn()-1
			local eActivePlayer = pActivePlayer:GetID()
			local ePlayer = pPlayer:GetID()
				
			local tDealItems = {}
			local tFinalTurns = table()
			local pDeal = UI.GetScratchDeal()
			
			EUI.PushScratchDeal()
			
			for i = 0, UI.GetNumCurrentDeals(eActivePlayer) - 1 do
				UI.LoadCurrentDeal(eActivePlayer, i)
				
				local iToPlayer = pDeal:GetOtherPlayer(eActivePlayer)
				
				pDeal:ResetIterator()
				
				repeat
					local iItem, iDuration, iFinalTurn, data1, data2, data3, flag1, iFromPlayer = pDeal:GetNextItem()
					
					if iItem then
						if iToPlayer == ePlayer or iFromPlayer == ePlayer then
							local bIsFromUs = iFromPlayer == eActivePlayer
							local tDealItem = tDealItems[iFinalTurn]
							
							if not tDealItem then
								tDealItem = {}
								tDealItems[iFinalTurn] = tDealItem
								tFinalTurns:insert(iFinalTurn)
							end
							
							if iItem == TradeableItems.TRADE_ITEM_GOLD_PER_TURN then
								tDealItem.GPT = (tDealItem.GPT or 0) + (bIsFromUs and -data1 or data1)
							elseif iItem == TradeableItems.TRADE_ITEM_RESOURCES then
								tDealItem[data1] = (tDealItem[data1] or 0) + (bIsFromUs and -data2 or data2)
							else
								tDealsFinalTurn[iItem + (bIsFromUs and 65536 or 0)] = iFinalTurn
							end
						end
					else
						break
					end
				until false
			end
			
			EUI.PopScratchDeal()
			tFinalTurns:sort()
			
			for i = 1, #tFinalTurns do
				local iFinalTurn = tFinalTurns[i]
				local tDealItem = tDealItems[iFinalTurn] or {}
				local tDeal = table()
				local iQuantity = tDealItem.GPT
				
				if iQuantity and iQuantity ~= 0 then
					tDeal:insert(string.format("%+g%s", iQuantity, "[ICON_GOLD]"))
				end
				
				for resource in GameInfo.Resources() do
					local iQuantity = tDealItem[resource.ID]
					
					if iQuantity or 0 ~= 0 then
						tDeal:insert(string.format("%+g%s", iQuantity, tostring(resource.IconString)))
					end
				end
				
				if #tDeal > 0 then
					tDeals:insert(table.concat(tDeal) .. " ("..(iFinalTurn - iCurrentTurn)..")[NEWLINE]")
				end
			end
			
			if #tDeals > 0 then
				for i = 0, #tDeals do
					sDeals = string.format("%s with %s:[NEWLINE]%s", L("Current deals"), GetApproach(pActivePlayer, pPlayer, pPlayer:GetName()), table.concat(tDeals))
				end
			end
		end
		
		-- monopolies
		local bHasStatecraftPolicyForMonopolies = pPlayer:HasPolicy(GameInfoTypes.POLICY_CULTURAL_DIPLOMACY)
		local bHasBonusFromTegucigalpa = pPlayer:HasPolicy(GameInfoTypes.POLICY_HONDURAS)
		local bIsDutch = pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_NETHERLANDS
		
		local iResourceOwnAll = iLocal
		local iResourceOnMap = Map.GetNumResources(eResource)

		local iExtraMisc = pPlayer:GetResourcesMisc(eResource) -- included in iLocal
			local iExtraFromCorporation = pPlayer:GetResourcesFromCorporation(eResource)
			local iExtraFromFranchise = pPlayer:GetResourcesFromFranchises(eResource)
			local iExtraFromCSAlliances = pPlayer:GetResourceFromCSAlliances(eResource) -- Foreign Service
			local iExtraFromAdmiral = pPlayer:GetResourcesFromGP(eResource)
			local iExtraFromModifiers = iExtraMisc - (iExtraFromCorporation + iExtraFromFranchise + iExtraFromCSAlliances + iExtraFromAdmiral)
				local iExtraFromThirdAlternativeMod = pPlayer:GetStrategicResourceMod(eResource)
				local iExtraFromZealotryMod = pPlayer:GetResourceModFromReligion(eResource)	
		local iExtraFromBuildings = pPlayer:GetNumResourceFromBuildings(eResource)	
		local iResOwnPlusTrait = iResourceOwnAll - (iExtraMisc + iExtraFromBuildings)
			local iExtraFromTraitMod = pPlayer:GetResourceQuantityModifierFromTraits(eResource)
				local iExtraFromTrait = (iResOwnPlusTrait * iExtraFromTraitMod) / (iExtraFromTraitMod + 100)
				local iResOwnFromMap = (iResOwnPlusTrait * 100) / (iExtraFromTraitMod + 100)
		
		local sResourcesExtra = ""
		local sResourcesExtraFromCorpAndFranch = ""
		local sResourcesExtraFromCSAlliances = ""
		local sResourcesExtraFromBuildings = ""
		local sResourcesExtraFromAdmiral = ""
		local sResourcesExtraFromModifiers = ""
		local sResourcesByNeds = ""
		local sResourcesFromStatecraft = ""

		if bIsDutch and bIsLuxury then
			iResourceOwnAll = iResourceOwnAll + iImports

			if iImports == 1 then
				sResourcesByNeds = L("TXT_KEY_DO_TRADE_VALUE_TOOLTIP_NETHERLANDS_ONE")
			elseif iImports > 1 then
				sResourcesByNeds = L("TXT_KEY_DO_TRADE_VALUE_TOOLTIP_NETHERLANDS_MORE", iImports)
			end
		end	

		if (bHasStatecraftPolicyForMonopolies or bHasBonusFromTegucigalpa) and not (bIsDutch and bIsLuxury) then
			iResourceOwnAll = iResourceOwnAll + iMinors

			if iMinors == 1 then
				sResourcesFromStatecraft = L("TXT_KEY_DO_TRADE_VALUE_TOOLTIP_STATECRAFT_ONE")
			elseif iMinors > 1 then
				sResourcesFromStatecraft = L("TXT_KEY_DO_TRADE_VALUE_TOOLTIP_STATECRAFT_MORE", iMinors)
			end
		end
		
		if iExtraFromBuildings > 0 then
			-- East India Company, World Wonders, Natural Wonders
			-- if all resources are on the map, then it spawns one and it counts towards monopoly
			-- if there are some resources not available on the map, he chooses one of them and it does not count towards monopolys
			if iExtraFromBuildings == 1 then
				sResourcesExtraFromBuildings = L("TXT_KEY_DO_TRADE_VALUE_TOOLTIP_BUILDINGS_ONE", iExtraFromBuildings)
			elseif iExtraFromBuildings > 1 then
				sResourcesExtraFromBuildings = L("TXT_KEY_DO_TRADE_VALUE_TOOLTIP_BUILDINGS_MORE", iExtraFromBuildings)
			end

			if iResourceOnMap == 0 then
				sResourcesExtraFromBuildings = sResourcesExtraFromBuildings .. " " .. L("TXT_KEY_DO_TRADE_VALUE_TOOLTIP_EXT")
				iResourceOwnAll = iResourceOwnAll - iExtraFromBuildings -- so resources do not count towards monopolies
			end
		end
		
		if iExtraFromAdmiral > 0 then
			-- two copies of resource granted by expending a GA
			-- if all resources are on the map, then it spawns one and it counts towards monopoly
			-- if there are some resources not available on the map, he chooses one of them and it does not count towards monopolys
			sResourcesExtraFromAdmiral = L("TXT_KEY_DO_TRADE_VALUE_TOOLTIP_GP", iExtraFromAdmiral)

			if iResourceOnMap == 0 then
				sResourcesExtraFromAdmiral = sResourcesExtraFromAdmiral .. " " .. L("TXT_KEY_DO_TRADE_VALUE_TOOLTIP_EXT")
				iResourceOwnAll = iResourceOwnAll - iExtraFromAdmiral -- so resources do not count towards monopolies
			end
		end	

		if iExtraFromCorporation > 0  or iExtraFromFranchise > 0 then
			-- Hexxon Refineries (+1 Oil and Coal for every three Global Franchises)
			-- Corporations_NumFreeResources (unused in VP)
			sResourcesExtraFromCorpAndFranch = L("TXT_KEY_DO_TRADE_VALUE_TOOLTIP_CORP", iExtraFromCorporation, iExtraFromFranchise)

			if iResourceOnMap == 0 then
				sResourcesExtraFromAdmiral = sResourcesExtraFromAdmiral .. " " .. L("TXT_KEY_DO_TRADE_VALUE_TOOLTIP_EXT")
				iResourceOwnAll = iResourceOwnAll - iExtraFromCorporation - iExtraFromFranchise -- so resources do not count towards monopolies
			end
		end			

		if iExtraFromCSAlliances > 0 then
			-- +1 of every strategic for every 3 CS alliances
			if iExtraFromCSAlliances == 1 then
				sResourcesExtraFromCSAlliances = L("TXT_KEY_DO_TRADE_VALUE_TOOLTIP_ALLY_ONE")
			elseif iExtraFromCSAlliances > 1 then
				sResourcesExtraFromCSAlliances = L("TXT_KEY_DO_TRADE_VALUE_TOOLTIP_ALLY_MORE", iExtraFromCSAlliances)
			end
		end					
		
		if (iExtraFromModifiers > 0 or iExtraFromTrait > 0) and bIsStrategic then
			local iSumFromMod = iExtraFromModifiers + iExtraFromTrait
			
			-- Zealotry (belief):				+1% of every strategic resource for each city following your religion
			-- Third Alternative (policy):		+100% of every strategic resource
			-- Russian UA (trait):				+100% of every strategic resource
			if iSumFromMod == 1 then
				sResourcesExtraFromModifiers = L("TXT_KEY_DO_TRADE_VALUE_TOOLTIP_MODS_ONE", iExtraFromThirdAlternativeMod, iExtraFromZealotryMod, iExtraFromTraitMod)
			elseif iSumFromMod > 1 then
				sResourcesExtraFromModifiers = L("TXT_KEY_DO_TRADE_VALUE_TOOLTIP_MODS_MORE", iSumFromMod, iExtraFromThirdAlternativeMod, iExtraFromZealotryMod, iExtraFromTraitMod)
			end
		end	
		
		sResourcesExtra = sResourcesByNeds .. sResourcesFromStatecraft .. sResourcesExtraFromBuildings .. sResourcesExtraFromAdmiral .. sResourcesExtraFromCSAlliances 
							.. sResourcesExtraFromCorpAndFranch  .. sResourcesExtraFromModifiers

		local fRatio = iResourceOwnAll / iResourceOnMap
		local bGlobalMonopoly = fRatio > 0.5
		local bStrategicMonopoly = fRatio > 0.25
		local sMonopoly = ""	
		
		if not bIsPaper then
			if bGlobalMonopoly then
				sMonopoly = "''"
			elseif bStrategicMonopoly and bIsStrategic then
				sMonopoly = "'"
			end
		end
		
		sText = L("TXT_KEY_DO_TRADE_VALUE", sColorValue, iTotal, sMonopoly)
		sToolTip = L("TXT_KEY_DO_TRADE_VALUE_TOOLTIP", pResource.IconString, g_sColorResourceName, L(pResource.Description), sText, sCityList, sColorValue, iResourceOwnAll, iResourceOnMap, sResourcesExtra)
	else
		sText = L("TXT_KEY_DO_TRADE_VALUE_NONE", g_sColorBrown)
		sToolTip = L("TXT_KEY_DO_TRADE_VALUE_TOOLTIP_NONE", pResource.IconString, g_sColorResourceName, L(pResource.Description), g_sColorBrown)
	end

	return sText, sToolTip, sDeals, sColorValue
end

-- check for discovered resources (no spoilers addon)
function IsVisibleUsefulResource(eResource, pPlayer)
	local ePlayer = pPlayer:GetID()
	local pTeam = Teams[pPlayer:GetTeam()]
	
	for playerLoop = 0, GameDefines.MAX_CIV_PLAYERS - 1, 1 do
		local pOtherPlayer = Players[playerLoop]
		local eOtherTeam = pOtherPlayer:GetTeam()
    
		if playerLoop == ePlayer then
			if IsPlayerHasResource(pPlayer, eResource) or IsPlayerNearResource(pPlayer, eResource) then
				return true
			end
		elseif playerLoop ~= ePlayer and pOtherPlayer:IsAlive() then
			if pTeam:IsHasMet(eOtherTeam) then
				if IsPlayerHasResource(pOtherPlayer, eResource) or IsPlayerNearResource(pOtherPlayer, eResource) then
					return true
				end
			end
		end
	end

	return false
end

-- check for active player resources
function IsPlayerHasResource(pPlayer, eResource)
	return pPlayer:GetNumResourceTotal(eResource, false) + pPlayer:GetResourceExport(eResource) > 0
end

-- check for nearby resources
function IsPlayerNearResource(pPlayer, eResource)
	local ePlayer = pPlayer:GetID()
	
	for city in pPlayer:Cities() do
		if city ~= nil then
			local iThisX = city:GetX()
			local iThisY = city:GetY()
			
			local iRange = 5
			local iCloseRange = 2
			
			for iDX = -iRange, iRange, 1 do
				for iDY = -iRange, iRange, 1 do
					local pTargetPlot = Map.GetPlotXY(iThisX, iThisY, iDX, iDY)
			
					if pTargetPlot ~= nil then
						local eOwner = pTargetPlot:GetOwner()
			  
						if eOwner == ePlayer or eOwner == -1 then
							local plotDistance = Map.PlotDistance(iThisX, iThisY, pTargetPlot:GetX(), pTargetPlot:GetY())
							
							if plotDistance <= iRange and (plotDistance <= iCloseRange or eOwner == ePlayer) then
								if pTargetPlot:GetResourceType(Game.GetActiveTeam()) == eResource then
									return true
								end
							end
						end
					end
				end
			end
		end
	end

	return false
end

-- creating list of cities demanding some resource to get WLKTD
function GetGoldenAgeCities(pPlayer,pResource)
	local sCityList = ""
	local iCounter = 0
	local sColor = g_sColorCyan

	for city in pPlayer:Cities() do
		if city:GetWeLoveTheKingDayCounter() == 0 and city:GetResourceDemanded(true) == pResource.ID then
     		if sCityList ~= "" then
				sCityList = sCityList .. ", "
			end
			
			if city:IsCapital() then
				sCityList = sCityList .. "[ICON_CAPITAL] "
			end
			
			sCityList = sCityList .. city:GetName()
			iCounter = iCounter + 1
			
			if iCounter > 1 then
				sColor = g_sColorBlue
			end
		end
	end
	
	if sCityList ~= "" then
		sCityList = L("TXT_KEY_DO_TRADE_DEMAND", " ", sColor, sCityList)
	end
	
	return sCityList, iCounter
end

-- function drawing cs buttons
function InitCsList()
	local bCsMet = false

	local eActivePlayer = Game.GetActivePlayer()
	local pActivePlayer = Players[eActivePlayer]
	local pActiveTeam = Teams[pActivePlayer:GetTeam()]

	local imControlTable = g_CsIM:GetInstance()
	local iMaxY = imControlTable.TradeBox:GetSizeY()
			
	for resource in GameInfo.Resources() do
		if resource.ResourceUsage > 0 then
			local sLuxControl = resource.Type
			local im = imControlTable[sLuxControl]
			local imPlusBox = imControlTable[sLuxControl .. "_BOX"]
			local eResource = resource.ID

			if im ~= nil then
				im:DestroyAllChildren()
			else
				im = imControlTable["RESOURCE_OTHER_LUXURIES"]
				imPlusBox = imControlTable["RESOURCE_OTHER_LUXURIES_BOX"]
				
				
				if eResource > g_ePreviousResource then
					g_ePreviousResource = eResource
				else
					g_ePreviousResource = -1
					im:DestroyAllChildren()
				end
			end
			
			for csloop = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS-1, 1 do
				local pCs = Players[csloop]
				
				if pCs:IsAlive() and pActiveTeam:IsHasMet(pCs:GetTeam()) then
					if IsCsNearResource(pCs, eResource) or IsCsHasResource(pCs, eResource) then
						local tCSTextControlTable = {}
						
						ContextPtr:BuildInstanceForControl("CityStateButtonInstance", tCSTextControlTable, im)

						tCSTextControlTable.CsTraitIcon:SetOffsetVal(-3,0)
						tCSTextControlTable.CsTraitIcon:SetSizeVal(31,24)

						local sTrait = GameInfo.MinorCivilizations[pCs:GetMinorCivType()].MinorCivTrait
						tCSTextControlTable.CsTraitIcon:SetTexture(GameInfo.MinorCivTraits[sTrait].TraitIcon)
						
						if IsCsHasResource(pCs, eResource) then
							tCSTextControlTable.CsLuxuryIcon:SetHide(true)
							local primaryColor, secondaryColor = pCs:GetPlayerColors()
							tCSTextControlTable.CsTraitIcon:SetColor({x = secondaryColor.x, y = secondaryColor.y, z = secondaryColor.z, w = 1})
						elseif g_tIsCsHasResourceUnimproved[eResource] then
							tCSTextControlTable.CsLuxuryIcon:SetHide(false)
							tCSTextControlTable.CsTraitIcon:SetColor({x = 0.4, y = 0.4, z = 0.4, w = 1})
						end

						local sCsAlly = L("-")
						local eCsAlly = pCs:GetAlly()
						
						if eCsAlly ~= nil and eCsAlly ~= -1 then
							if eCsAlly ~= eActivePlayer then
								local pAlly = Players[eCsAlly]

								if pActiveTeam:IsHasMet(pAlly:GetTeam()) then
									sCsAlly = L(Players[eCsAlly]:GetCivilizationShortDescriptionKey())
									sCsAlly = GetApproach(pActivePlayer, pAlly, sCsAlly)
								else
									sCsAlly = L("TXT_KEY_MISC_UNKNOWN")
								end
							else
								sCsAlly = L("TXT_KEY_DO_CS_YOU")
							end					
						end

						local sAmount = GetResourceTotalPossibleAmount(pCs, eResource)
						g_tIsCsHasResourceUnimproved[eResource] = false
						
						local iCSInfluence, sColorMinorApprach = GetCSInfluence(pCs, pActivePlayer)
						local sCsName = ""

						if sColorMinorApprach ~= "" then
							sCsName = sColorMinorApprach .. L(pCs:GetCivilizationShortDescriptionKey()) .. "[ENDCOLOR]"
						else
							sCsName = L(pCs:GetCivilizationShortDescriptionKey())
						end

						local sToolTip = L("TXT_KEY_DO_TRADE_CS_TOOLTIP", sAmount, resource.IconString, sCsName, iCSInfluence, sCsAlly, GetCsStrategicsOrLuxuries(pCs, eResource))
						
						local pCsCity = pCs:GetCapitalCity()
						g_tCsCoordinates[csloop] = {
							iX = pCsCity:GetX(),
							iY = pCsCity:GetY()
						}

						tCSTextControlTable.CsButton:SetToolTipString(sToolTip)
						tCSTextControlTable.CsButton:SetVoid1(csloop)
						tCSTextControlTable.CsButton:RegisterCallback(Mouse.eLClick, OnCsSelected)
						tCSTextControlTable.CsButton:RegisterCallback(Mouse.eRClick, OnCsCenter)
					end

					bCsMet = true
				end
			end

			im:CalculateSize()
			im:ReprocessAnchoring()

			imPlusBox:SetSizeY(math.max(30, im:GetSizeY() + 3))

			iMaxY = math.max(iMaxY, im:GetSizeY())
		end
	end 

	if not bCsMet then
		imControlTable.TradeBox:SetHide(true)
	else
		imControlTable.TradeBox:SetHide(false)
		imControlTable.TradeBox:SetSizeY(iMaxY+5)
	end

	return bCsMet
end

--get influence with CS and city-state approach
function GetCSInfluence(pCs, pPlayer)
	local ePlayer = pPlayer:GetID()
	local eTeam = pPlayer:GetTeam()
	local bWar = Teams[eTeam]:IsAtWar(pCs:GetTeam())
	local iInfluence = pCs:GetMinorCivFriendshipWithMajor(ePlayer)
	local iNeededInfluence = GetNeededInfluence(pCs, pPlayer)
	
	local sColour = ""
	
	local iNeededInfPercentage = (iInfluence / (iNeededInfluence + iInfluence)) * 100
	local iNeededForFriendshipInfPercentage = (iInfluence / g_iFriendThreshold) * 100
	
	if pCs:IsAllies(ePlayer) then
		sColour = g_sColorCyan
	elseif pCs:IsMinorPermanentWar(eTeam) or bWar then
		sColour = g_sColorRed
	elseif pCs:IsPeaceBlocked(eTeam) then
		sColour = g_sColorFadingRed
	elseif pCs:IsFriends(ePlayer) and iNeededInfPercentage > 75 then
		sColour = g_sColorDarkGreen
	elseif pCs:IsFriends(ePlayer) and iNeededInfPercentage <= 75 then
		sColour = g_sColorLightGreen
	elseif iInfluence < g_iNeutralThreshold and pCs:CanMajorBullyGold(ePlayer) then
		sColour = g_sColorLightOrange
	elseif iNeededForFriendshipInfPercentage > 75 then
		sColour = g_sColorYellowGreen
	elseif iInfluence < g_iNeutralThreshold and not pCs:CanMajorBullyGold(ePlayer) then
		sColour = g_sColorDenounce
	end

	return iInfluence, sColour
end

function GetNeededInfluence(pCs, pPlayer)
	local iNeededInfluence = 0

	local iPlayerInfluence = pCs:GetMinorCivFriendshipWithMajor(pPlayer:GetID())
	local eAlly = pCs:GetAlly()
  
	if eAlly ~= nil and eAlly ~= -1 then
		if eAlly ~= pPlayer:GetID() then
			iNeededInfluence = pCs:GetMinorCivFriendshipWithMajor(eAlly) - iPlayerInfluence + 1
		end
	else
		iNeededInfluence = g_iAllyThreshold - iPlayerInfluence
	end

	return iNeededInfluence
end

-- checking nearby resources
function IsCsNearResource(pCs, eResource)
	local iCs = pCs:GetID()
	local pCapital = pCs:GetCapitalCity()
	local bFound = false

	if pCapital ~= nil then
		local iThisX = pCapital:GetX()
		local iThisY = pCapital:GetY()
		
		local iRange = 5
		local iCloseRange = 2
		
		for iDX = -iRange, iRange, 1 do
			for iDY = -iRange, iRange, 1 do
				local pTargetPlot = Map.GetPlotXY(iThisX, iThisY, iDX, iDY)
        
				if pTargetPlot ~= nil then
					local eOwner = pTargetPlot:GetOwner()
          
					if eOwner == iCs or eOwner == -1 then
						local plotDistance = Map.PlotDistance(iThisX, iThisY, pTargetPlot:GetX(), pTargetPlot:GetY())
            
						if plotDistance <= iRange and (plotDistance <= iCloseRange or eOwner == iCs) then
							if pTargetPlot:GetResourceType(Game.GetActiveTeam()) == eResource then
								local eImprovement = pTargetPlot:GetImprovementType()
								
								if (eImprovement == (-1) 
								or pTargetPlot:IsImprovementPillaged()
								or (eImprovement ~= (-1) and not pTargetPlot:IsResourceConnectedByImprovement(eImprovement))
								or (eImprovement ~= (-1) and pTargetPlot:IsResourceConnectedByImprovement(eImprovement) and not IsCsHasResource(pCs, eResource)))
								and not pTargetPlot:IsCity() then
									g_tIsCsHasResourceUnimproved[eResource] = true
								end
								
								bFound = true
							end
						end
					end
				end
			end
		end
	end
	
	if bFound then
		return true
	else
		g_tIsCsHasResourceUnimproved[eResource] = false
		return false
	end
end

-- checks for available resource list
function GetCsStrategicsOrLuxuries(pCs, eOmittedResource)
	local sStrategicsOrLuxuries = ""
	
	for resource in GameInfo.Resources() do
		local eResource = resource.ID

		if Game.GetResourceUsageType(eResource) > 0 and eResource ~= eOmittedResource then
			if IsCsNearResource(pCs, eResource) or IsCsHasResource(pCs, eResource) then
				if sStrategicsOrLuxuries ~= "" then
					sStrategicsOrLuxuries = sStrategicsOrLuxuries .. ", "
				else
					sStrategicsOrLuxuries = sStrategicsOrLuxuries .. "[NEWLINE][ICON_BULLET] has also: "
				end
				
				sStrategicsOrLuxuries = sStrategicsOrLuxuries .. GetResourceTotalPossibleAmount(pCs, eResource) .. resource.IconString
				g_tIsCsHasResourceUnimproved[eResource] = false
			end	
		end
	end

	return sStrategicsOrLuxuries
end

-- gather list of resources that CS have or can have
function GetResourceTotalPossibleAmount(pCs, eResource)
	local sAmount = ""
	
	if IsCsHasResource(pCs, eResource) then
		sAmount = "[COLOR_POSITIVE_TEXT]" .. GetCsResourceCount(pCs, eResource) .. "[ENDCOLOR]"
		
		if g_tIsCsHasResourceUnimproved[eResource] then
			sAmount = sAmount .. "+[COLOR_NEGATIVE_TEXT]?[ENDCOLOR]"
		end
	elseif g_tIsCsHasResourceUnimproved[eResource] then
		sAmount = "[COLOR_NEGATIVE_TEXT]?[ENDCOLOR]"
	end

	return sAmount
end

-- checks for CS resources
function IsCsHasResource(pCs, eResource)
	return (GetCsResourceCount(pCs, eResource) > 0)
end

-- subfunction
function GetCsResourceCount(pCs, eResource)
	return pCs:GetNumResourceTotal(eResource, false) + pCs:GetResourceExport(eResource)
end

-- approach types checking for CS
function GetApproach(pActivePlayer, pPlayer, sPlayerName)
	if pActivePlayer:GetID() ~= pPlayer:GetID() then
		if Teams[pActivePlayer:GetTeam()]:IsAtWar(pPlayer:GetTeam()) then
			sPlayerName = g_sColorWar .. sPlayerName .. "[ENDCOLOR]"
		elseif pPlayer:IsDenouncingPlayer(pActivePlayer:GetID()) then
			sPlayerName = g_sColorDenounce .. sPlayerName .. "[ENDCOLOR]"
		else
			local iApproach = pActivePlayer:GetApproachTowardsUsGuess(pPlayer:GetID())
  
			if iApproach == MajorCivApproachTypes.MAJOR_CIV_APPROACH_WAR then
				sPlayerName = g_sColorWar .. sPlayerName .. "[ENDCOLOR]"
			elseif iApproach == MajorCivApproachTypes.MAJOR_CIV_APPROACH_HOSTILE then
				sPlayerName = g_sColorWar .. sPlayerName .. "[ENDCOLOR]"
			elseif iApproach == MajorCivApproachTypes.MAJOR_CIV_APPROACH_GUARDED then
				sPlayerName = g_sColorGuarded .. sPlayerName .. "[ENDCOLOR]"
			elseif iApproach == MajorCivApproachTypes.MAJOR_CIV_APPROACH_NEUTRAL then
				sPlayerName = sPlayerName .. "[ENDCOLOR]"
			elseif iApproach == MajorCivApproachTypes.MAJOR_CIV_APPROACH_FRIENDLY then
				sPlayerName = g_sColorFriendly .. sPlayerName .. "[ENDCOLOR]"
			elseif iApproach == MajorCivApproachTypes.MAJOR_CIV_APPROACH_AFRAID then
				sPlayerName = g_sColorAfraid .. sPlayerName .. "[ENDCOLOR]"
			end
		end
	end

	return sPlayerName
end

-- it's a City-State being founded, so we may now have Mercantile luxuries
function OnCityCreated(hexPos, ePlayer)
	if (ePlayer >= GameDefines.MAX_MAJOR_CIVS) then
		GetCsLuxuriesAndStrategics()
	end
end
Events.SerialEventCityCreated.Add(OnCityCreated)

---------------
-- callbacks --
---------------
function OnCivSelected(ePlayer)
	if (Players[ePlayer]:IsHuman()) then
		Events.OpenPlayerDealScreenEvent(ePlayer)
	else
		UI.SetRepeatActionPlayer(ePlayer)
		UI.ChangeStartDiploRepeatCount(1)
		Players[ePlayer]:DoBeginDiploWithHuman()
	end
end

function OnCsSelected(iCs)
	local popupInfo = {
		Type = ButtonPopupTypes.BUTTONPOPUP_CITY_STATE_DIPLO,
		Data1 = iCs
	}
    
	Events.SerialEventGameMessagePopup(popupInfo)
end

function OnCsCenter(eCs)
	local pPlot = Map.GetPlot(g_tCsCoordinates[eCs].iX, g_tCsCoordinates[eCs].iY)
   
	if pPlot ~= nil then
		UI.LookAt(pPlot)
	end
end

---------------------------
-- resource list creator --
---------------------------
local gAvailableUsefulResources = nil

function IsAvailableLuxury(resource)
	if gAvailableUsefulResources == nil then
		GetAvailableUsefulResources()
	end

	return gAvailableUsefulResources[resource]
end

function GetAvailableUsefulResources()
	gAvailableUsefulResources = {}

	GetMapLuxuriesAndStrategics()
	GetBuildingLuxuriesAndStrategics()
	GetCsLuxuriesAndStrategics()
	GetCivLuxuriesAndStrategics()
	GetCivExtraLuxuriesFromGP()
end

-- any luxuries placed on the map
function GetMapLuxuriesAndStrategics()
	for iPlot = 0, Map.GetNumPlots()-1, 1 do
		local pPlot = Map.GetPlotByIndex(iPlot)

		if pPlot:GetResourceType() ~= -1 then
			local resource = GameInfo.Resources[pPlot:GetResourceType()]

			if resource ~= nil and resource.ResourceUsage > 0 then
				gAvailableUsefulResources[resource.ID] = true
			end
		end
	end
end

-- any luxuries from buildings
function GetBuildingLuxuriesAndStrategics()
	for buildingResource in GameInfo.Building_ResourceQuantity() do
		local resource = GameInfo.Resources[buildingResource.ResourceType]

		if resource ~= nil and resource.ResourceUsage > 0 then
			gAvailableUsefulResources[resource.ID] = true
		end
	end

	for buildingResource in GameInfo.Building_ResourcePlotsToPlace() do
		local resource = GameInfo.Resources[buildingResource.ResourceType]

		if resource ~= nil and resource.ResourceUsage > 0 then
			gAvailableUsefulResources[resource.ID] = true
		end
	end
end

-- any luxuries from City States
function GetCsLuxuriesAndStrategics()
	for iCs = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS - 1, 1 do
		local pCs = Players[iCs]
			
		if pCs:IsEverAlive() then
			local pPlot = pCs:GetStartingPlot()
			local resource = pPlot and GameInfo.Resources[pPlot:GetResourceType()]

			if resource ~= nil and resource.ResourceUsage > 0 then
				gAvailableUsefulResources[resource.ID] = true
			end
		end
	end
end

-- any civ specific luxuries and strategics
function GetCivLuxuriesAndStrategics()
	for iCiv = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
		local pCiv = Players[iCiv]
		
		if pCiv:IsEverAlive() then
			local sCivType = GameInfo.Civilizations[pCiv:GetCivilizationType()].Type

			for resource in GameInfo.Resources() do
				if resource.ResourceUsage > 0 then
					local pImprovement = GameInfo.Improvement_ResourceTypes{ResourceType=resource.Type}()
					local bIsUniqueLuxuryNotFromMercantile = pImprovement and pImprovement.ImprovementType == 'IMPROVEMENT_CITY'
					
					if resource.CivilizationType == sCivType or bIsUniqueLuxuryNotFromMercantile then
						gAvailableUsefulResources[resource.ID] = true
					end
				end
			end
		end
	end
end

-- check for any luxuries added by GP (Great Admirals) normally not present on the map
function GetCivExtraLuxuriesFromGP()
	for iCiv = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
		local pCiv = Players[iCiv]
		
		if pCiv:IsEverAlive() then
			local sCivType = GameInfo.Civilizations[pCiv:GetCivilizationType()].Type

			for resource in GameInfo.Resources() do
				if resource.ResourceUsage == 2 then
					local iNumExtraResFromGP = pCiv:GetResourcesFromGP(resource.ID)
					
					if iNumExtraResFromGP > 0 then
						gAvailableUsefulResources[resource.ID] = true
					end
				end
			end
		end
	end
end

GetAvailableUsefulResources()

function OnGPExpended(ePlayer, eGPType)
	if eGPType == GameInfoTypes.UNIT_GREAT_ADMIRAL then
		for iCiv = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
			local pCiv = Players[iCiv]
		
			if pCiv:IsEverAlive() then
				local sCivType = GameInfo.Civilizations[pCiv:GetCivilizationType()].Type

				for resource in GameInfo.Resources() do
					if resource.ResourceUsage > 0 then
						if pCiv:GetNumResourceAvailable(resource.ID, false) > 0 then
							gAvailableUsefulResources[resource.ID] = true
						end
					end
				end
			end
		end
	end
end
GameEvents.GreatPersonExpended.Add(OnGPExpended)
--------------------------------------------------------------
--------------------------------------------------------------
print("Loaded DiploTradeStatus.lua from TOfVP")
--------------------------------------------------------------
--------------------------------------------------------------
