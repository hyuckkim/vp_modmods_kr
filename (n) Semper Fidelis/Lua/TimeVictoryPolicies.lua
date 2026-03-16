-- Semper Fidelis Functions
-- Author: Hokath
-- DateCreated: 28/09/2024 9:36:12 AM
--------------------------------------------------------------

local iMaxRed = 375;

local iTurnReductionDE = -15;
local iHarmonyT3 = GameInfoTypes.POLICY_DEEP_ECOLOGY;

local iTurnReductionGD = -4;
local iAutocracyT3 = GameInfoTypes.POLICY_GUNBOAT_DIPLOMACY;

local iTurnReductionMM = -5;
local iProsperityT3 = GameInfoTypes.POLICY_MASS_MEDIA;
local iProsperityWriter = GameInfoTypes.UNIT_PROSPERITY_WRITER;
local iProsperityArtist = GameInfoTypes.UNIT_PROSPERITY_ARTIST;
local iProsperityMusician = GameInfoTypes.UNIT_PROSPERITY_MUSICIAN;
local L = Locale.ConvertTextKey;


-- helper function to be called by both triggers
function TimerReduction(TurnReduction, pPlayer, sReason)
	local iMaxTurns = Game.GetMaxTurns()
	if iMaxTurns <= iMaxRed then
		return false
	elseif (iMaxRed - iMaxTurns) > TurnReduction then
		TurnReduction = iMaxRed - iMaxTurns
	end
	Game.ChangeMaxTurns(TurnReduction)
	iMaxTurns = Game.GetMaxTurns()
	-- notification 
	local sText = " reduced the amount of time left to achieve victory by [COLOR_NEGATIVE_TEXT]" .. TurnReduction .. "[ENDCOLOR] turns " .. sReason
	sText = sText .. "[NEWLINE][NEWLINE]There will now be just [COLOR_POSITIVE_TEXT]" .. iMaxTurns .. "[ENDCOLOR] turns total!"
	for iAllPlayer = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do 
		local pAllPlayer = Players[iAllPlayer]
		local sText2 = ""
		-- different text for the triggerer versus everyone else
		if pPlayer ~= pAllPlayer then
			local sText2 = pPlayer:GetName() .. sText
		else
			local sText2 = "You" .. sText
		end
		if pAllPlayer:IsHuman() then 	
			pAllPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, sText2, "Game timer reduced!")
		end
	end
end

function WorldCapitalTimerReduction(iPlayer, aPolicy)
	if aPolicy == iAutocracyT3 then
		local pPlayer = Players[iPlayer];
		local multiplier = pPlayer:GetNumWorldWonders()
		TimerReduction(iTurnReductionGD*multiplier, pPlayer, "by construction of a [COLOR_MAGENTA]World Capital[ENDCOLOR]!")
	end
end

GameEvents.PlayerAdoptPolicy.Add(WorldCapitalTimerReduction);

function PolicyTimerReduction(iPlayer, aPolicy)
	local pPlayer = Players[iPlayer];
	if pPlayer:HasPolicy(iHarmonyT3) then
		TimerReduction(iTurnReductionDE, pPlayer, "via harmonizing [COLOR_MAGENTA]Policy[ENDCOLOR] decisions!")
	end
end

GameEvents.PlayerAdoptPolicy.Add(PolicyTimerReduction);

--function TechTimerReduction(iTeam, iTech, iChange)
--	for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
--		local pPlayer = Players[iPlayer]
--		if (pPlayer ~= nil) then
--			if (pPlayer:GetTeam() == iTeam) and pPlayer:HasPolicy(iHarmonyT3) then
--				TimerReduction(iTurnReductionDE, pPlayer, "via harmonizing [COLOR_CYAN]Technological[ENDCOLOR] advancements!")
--			end
--		end
--	end
--end
--
--GameEvents.TeamTechResearched.Add(TechTimerReduction);

function MassMediaTimerReduction(iPlayer, iUnit, iGreatWork)
	local pPlayer = Players[iPlayer];
	if pPlayer:HasPolicy(iProsperityT3) then
		TimerReduction(iTurnReductionMM, pPlayer, "due to their intensifying [COLOR_MAGENTA]Media Culture[ENDCOLOR]!")
	end
end

GameEvents.GreatWorkCreated.Add(MassMediaTimerReduction);

function FreeGreatWorkAdan(pMajorPlayer, GWversion)
	if pMajorPlayer:IsMinorCiv() then return end
	if not pMajorPlayer:IsEverAlive() then return end

	local iFreeArtSpots, iFreeWritingSpots, iFreeMusicSpots = 0, 0, 0
				
	-- check free spots
	for city in pMajorPlayer:Cities() do
		iFreeArtSpots = iFreeArtSpots + city:GetNumAvailableGreatWorkSlots(GameInfoTypes.GREAT_WORK_SLOT_ART_ARTIFACT)
		iFreeWritingSpots = iFreeWritingSpots + city:GetNumAvailableGreatWorkSlots(GameInfoTypes.GREAT_WORK_SLOT_LITERATURE)
		iFreeMusicSpots = iFreeMusicSpots + city:GetNumAvailableGreatWorkSlots(GameInfoTypes.GREAT_WORK_SLOT_MUSIC)
	end
	-- choose great work type for gift
	local sGreatWorkClassType, eGreatWorkSlotType, sGreatWorkSlotType = nil, nil, nil
				
	if GWversion == 0 then
		if iFreeWritingSpots > 0 then
			eGreatWorkClassType = GameInfoTypes.GREAT_WORK_LITERATURE
			sGreatWorkClassType = 'GREAT_WORK_LITERATURE'
			eGreatWorkSlotType = GameInfoTypes.GREAT_WORK_SLOT_LITERATURE
			sGreatWorkSlotType = 'GREAT_WORK_SLOT_LITERATURE'
		else
			pMajorPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, "You tried to active [COLOR_MAGENTA]Media Culture[ENDCOLOR] but there were no Great Work Slots available in your Empire!", "Wasted Opportunity")
			return 
		end
	elseif GWversion == 1 then
		if iFreeArtSpots > 0 then
			eGreatWorkClassType = GameInfoTypes.GREAT_WORK_ART
			sGreatWorkClassType = 'GREAT_WORK_ART'
			eGreatWorkSlotType = GameInfoTypes.GREAT_WORK_SLOT_ART_ARTIFACT
			sGreatWorkSlotType = 'GREAT_WORK_SLOT_ART_ARTIFACT'
		else
			pMajorPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, "You tried to active [COLOR_MAGENTA]Media Culture[ENDCOLOR] but there were no Great Work Slots available in your Empire!", "Wasted Opportunity")
			return 
		end

	elseif GWversion == 2 then
		if iFreeMusicSpots > 0 then
			eGreatWorkClassType = GameInfoTypes.GREAT_WORK_MUSIC
			sGreatWorkClassType = 'GREAT_WORK_MUSIC'
			eGreatWorkSlotType = GameInfoTypes.GREAT_WORK_SLOT_MUSIC
			sGreatWorkSlotType = 'GREAT_WORK_SLOT_MUSIC'
		else
			pMajorPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, "You tried to active [COLOR_MAGENTA]Media Culture[ENDCOLOR] but there were no Great Work Slots available in your Empire!", "Wasted Opportunity")
			return 
		end

	else
		return
	end
	
	if sGreatWorkClassType then
		local tUsedGreatWorks, tReservedGreatWorks, tAvailableGreatWorks = {}, {}, {}		
		-- already created great works
		for eplayer, pplayer in ipairs(Players) do
			local tTempTable = pplayer:GetGreatWorks(eGreatWorkClassType)
			
			for i, v in ipairs(tTempTable) do
				local eUsedID = Game.GetGreatWorkType(v.Index)
		
				tUsedGreatWorks[eUsedID] = true
			end
		end
					
		-- reserved great works (for buildings)
		for building in DB.Query("SELECT Buildings.FreeGreatWork FROM Buildings") do
			if building.FreeGreatWork ~= nil then
				local eReservedID = GameInfo.GreatWorks{Type=building.FreeGreatWork}().ID
			
				tReservedGreatWorks[eReservedID] = true
			end
		end
					
		-- creating GW list to choose from
		for greatwork in DB.Query("SELECT GreatWorks.ID FROM GreatWorks WHERE GreatWorkClassType = ?", sGreatWorkClassType) do
			if not tUsedGreatWorks[greatwork.ID] and not tReservedGreatWorks[greatwork.ID] then
				table.insert(tAvailableGreatWorks, greatwork.ID)
			end
		end
					
		-- continue if the pool is not depleted
		if #tAvailableGreatWorks > 0 then
			local eGreatWorkType = table.remove(tAvailableGreatWorks, Game.Rand(#tAvailableGreatWorks, "Choose a random ID of a GW") + 1)
			local eGreatWork = Game.CreateGreatWork(eGreatWorkType, eMajorPlayer, pMajorPlayer:GetCurrentEra(), pMajorPlayer:GetName())
			local bFoundFreeSlot = false
						
			-- looking for a building with at least 1 free slot
			for city in pMajorPlayer:Cities() do
				if city:GetNumAvailableGreatWorkSlots(eGreatWorkSlotType) > 0 then
					for building in DB.Query("SELECT Buildings.ID, Buildings.Description, Buildings.BuildingClass, Buildings.GreatWorkCount FROM Buildings WHERE GreatWorkSlotType = ?", sGreatWorkSlotType) do
						if city:IsHasBuilding(building.ID) then
							local eBuildingClass = GameInfo.BuildingClasses{Type=building.BuildingClass}{}.ID
							local iNumBuildingGreatWorkSlots = building.GreatWorkCount
							
							for i = 0, iNumBuildingGreatWorkSlots - 1 do
								if city:GetBuildingGreatWork(eBuildingClass, i) == -1 then
									city:SetBuildingGreatWork(eBuildingClass, i, eGreatWork)
									bFoundFreeSlot = true

									TimerReduction(iTurnReductionMM, pMajorPlayer, "their intensifying [COLOR_MAGENTA]Media Culture[ENDCOLOR]!")

									if pMajorPlayer:IsHuman() then
										pMajorPlayer:AddNotification(NotificationTypes.NOTIFICATION_GREAT_WORK_COMPLETED_ACTIVE_PLAYER, L("TXT_KEY_GREAT_WORK_PROSPERITY", city:GetName(), L(GameInfo.GreatWorks[eGreatWorkType].Description), L(building.Description)), L("TXT_KEY_GREAT_WORK_PROSPERITY_TITLE"), city:GetX(), city:GetY(), eGreatWork)
									end
	
									break
								end	
							end
										
							if bFoundFreeSlot then break end
						end
					end
					
					if bFoundFreeSlot then break end
				end
			end
		end
	end
end

function MassMediaMakeWork(iUnitOwner, iUnit, iUnitType, iPlotX, iPlotY)
	local pPlayer = Players[iUnitOwner];
	if pPlayer:HasPolicy(iProsperityT3) then
		local uType = GameInfo.Units[iUnitType].ID
		if uType == iProsperityWriter then
			print("it is a screenwriter")
			FreeGreatWorkAdan(pPlayer, 0)
			local pUnit = pPlayer:GetUnitByID(iUnit)
			pUnit:Kill()
		elseif uType == iProsperityArtist then
			print("it is an animator")
			FreeGreatWorkAdan(pPlayer, 1)
			local pUnit = pPlayer:GetUnitByID(iUnit)
			pUnit:Kill()
		elseif uType == iProsperityMusician then
			print("it is a disc jockey")
			FreeGreatWorkAdan(pPlayer, 2)
			local pUnit = pPlayer:GetUnitByID(iUnit)
			pUnit:Kill()
		end
	end
end

GameEvents.UnitCreated.Add(MassMediaMakeWork);


