-- Plague_Main
-- Author: FramedArchitecture
-- DateCreated: 3/1/2013
--------------------------------------------------------------------
include ("Plague_SaveData.lua");
include ("Plague_UI.lua");
include( "FLuaVector" );
--------------------------------------------------------------------
MapModData.g_Properties	= MapModData.g_Properties or {}
g_Properties			= MapModData.g_Properties
--------------------------------------------------------------------
local bTest	= false
--------------------------------------------------------------------
local print					= bTest and print or function() end
local gHandicap				= PreGame.GetHandicap(0)
local gPlagueChance			= GameDefines["PLAGUE_BASE_INIT_THRESHOLD"] + gHandicap
local gPlagueDuration		= GameDefines["PLAGUE_BASE_DURATION_TURNS"] + gHandicap
local gPlagueCooldown		= GameDefines["PLAGUE_BASE_COOLDOWN_TURNS"] - gHandicap
local gPropagateChance		= GameDefines["PLAGUE_BASE_PROPAGATE_THRESHOLD"] + gHandicap
local gPlagueAoEDamage		= GameDefines["PLAGUE_CITY_BASE_AOE_DAMAGE"]
local gPlagueTradeRouteMod	= GameDefines["PLAGUE_CITY_TRADE_RANGE_MOD"]
local gPlagueTradeLocalMod	= GameDefines["PLAGUE_CITY_TRADE_LOCAL_MOD"]
local gPlagueInfluenceMod	= GameDefines["PLAGUE_BASE_INFLUENCE_MOD"]
local gPlagueBorderMod		= GameDefines["PLAGUE_BASE_BORDER_PERMEABILITY"]
local gSabotageChance		= GameDefines["PLAGUE_BASE_SPY_SABOTAGE_THRESHOLD"]
local gCityHeal				= GameDefines["CITY_HIT_POINTS_HEALED_PER_TURN"]
local bNoPlagues			= (PreGame.GetGameOption("GAMEOPTION_PLAGUE_DISABLED") == 1)
local bAbandonCity			= (PreGame.GetGameOption("GAMEOPTION_PLAGUE_DESTROYS_CITIES") == 1)
local bFire					= false
local sort					= table.sort
local insert				= table.insert
local remove				= table.remove
local floor					= math.floor
local ceil					= math.ceil
local gCityHealthList		= {}
--------------------------------------------------------------------
-- UPDATE
--------------------------------------------------------------------
function OnEndTurn(id)
	if (id ~= 63) then return end
	print("GetCurrentEra:", g_Properties.g_CurrentEra)
	
	UpdateCityHealthList()
	ConvertHealthToFood()

	if bNoPlagues then return end
	UpdatePlagues()
end
--------------------------------------------------------------------
-- HEALTH
--------------------------------------------------------------------
function UpdateCityHealthList()
	gCityHealthList = {}

	for _, pPlayer in pairs(Players) do
		if pPlayer and pPlayer:IsAlive() then
			for pCity in pPlayer:Cities() do
				local iHealth = GetCityHealthTotal(pCity)
				insert(gCityHealthList, {health=iHealth, city=pCity, plagued=GetCityPlagueInfo(pCity)});
			end
		end
	end

	sort(gCityHealthList, function(x,y) return (x.health < y.health) end)
	
	g_Properties.gCityHealthList = gCityHealthList

	if bTest then
		for i,v in ipairs(gCityHealthList) do
			print(i, "UpdateCityHealthList()", v.city:GetName(), v.health)
		end
	end
end
--------------------------------------------------------------------
function ConvertHealthToFood()
	for i =  1, #gCityHealthList do
		local v = gCityHealthList[i]
		local iHealth = v.health
		local pCity = v.city
		local currentFood = pCity:GetFood()
		local finalFood = currentFood + iHealth
		local foodNeeded = pCity:GrowthThreshold()
		local foodPerTurn = pCity:FoodDifference()
		local iChange = 0

		if not bNoPlagues and v.plagued then
			if (iHealth < 0) then
				iChange = (finalFood < 1) and KillPopulation(pCity) or iHealth
			end
		elseif (foodPerTurn > 0) then
			if (iHealth < 0) then
				iChange = (finalFood < 1) and -currentFood or ceil(iHealth / 2)
			else
				iChange = (finalFood > foodNeeded) and ((foodNeeded - currentFood) - 1) or iHealth
			end
		end
		pCity:ChangeFood(iChange)
	end
end
--------------------------------------------------------------------
function OnLoadScreenClose()
	Events.SerialEventCityCaptured.Add( UpdateCityHealthList )
	Events.SerialEventCityCreated.Add( UpdateCityHealthList )
	Events.SerialEventCityDestroyed.Add( UpdateCityHealthList )
end
--------------------------------------------------------------------
-- PLAGUE
--------------------------------------------------------------------
function UpdatePlagues()
	local event = GetPlagueData()
	print("UpdatePlagues()", event.cooldowntimer, event.plaguetimer, event.plaguename)
	
	if (event.cooldowntimer > 0) then
		event.cooldowntimer=event.cooldowntimer-1
	elseif (event.plaguetimer > 0) then
		event.plaguetimer=event.plaguetimer-1
		DoPlagueEvent()
	elseif (event.plaguetimer == 0) then
		event=EndPlagueEvent(event)
	else
		event=InitPlagueEvent(event)
	end
	
	SavePlagueData(event)

	if bTest then
		local cities = GetPlagueCities()
		for i,v in ipairs(cities) do
			local city = Map.GetPlot(v.X, v.Y):GetPlotCity()
			if city then 
				print(i, "GetPlagueCities()", city:GetName(), v.turns)
			end
		end
	end
end
--------------------------------------------------------------------
function DoPlagueEvent()
	local t = GetPlagueCities()
	if #t > 0 then
		for i = 1, #t do
			local v = t[i]
			local x, y = v.X, v.Y
			if x and y then 
				local city = Map.GetPlot(x, y):GetPlotCity()
				if city and (v.turns > -1) then
					if (v.turns == 0) then
						city:ChangeHealRate(gCityHeal)
					else
						PropagatePlague(x, y)
						DiseaseUnits(city)
					end
					v.turns = (v.turns - 1)
				end
			end
		end
		SavePlagueCities(t)
	end
end
--------------------------------------------------------------------
function PropagatePlague(x, y)
	if (RandomInteger() <= gPropagateChance) then
		local thresholds = GetEraThresholds()
		local pSourceCity = Map.GetPlot(x, y):GetPlotCity()
		local iSourceCityOwner = pSourceCity:GetOwner()
		local targetCities = {}
		for _,v in ipairs(gCityHealthList) do
			local pTargetCity = v.city
			local iTargetHealth = v.health
			if (iTargetHealth <= thresholds.health) then
				local iTargetX = pTargetCity:GetX();
				local iTargetY = pTargetCity:GetY();
				local iTargetDist = Map.PlotDistance(x, y, iTargetX, iTargetY)
				if iTargetDist > 0 then
					--only cities that haven't yet been plagued this event cycle
					if not IsWasPlagued(pTargetCity) then
						local bTradeRoute = false					
						local iTargetCityOwner = pTargetCity:GetOwner();
						if iSourceCityOwner ~= iTargetCityOwner then
							--cities with international routes reduces effective distance
							if IsInternationalTradeRoute(pSourceCity, pTargetCity) then
								iTargetDist = ceil(iTargetDist * gPlagueTradeRouteMod)
								local bTradeRoute = true
							end
							--if source player is influential on target player then effective distance decreased
							if Players[iSourceCityOwner]:GetInfluenceLevel(iTargetCityOwner) > 2 then
								iTargetDist = ceil(iTargetDist * gPlagueInfluenceMod)
							end
							--no open borders increases effective distance
							if not IsOpenBorders(iSourceCityOwner, iTargetCityOwner) then
								iTargetDist = floor(iTargetDist * gPlagueBorderMod) 
							end
						end
						--local connected cities reduces effective distance
						if iSourceCityOwner == iTargetCityOwner then
							if pTargetCity:IsCapital() or IsConnected(iSourceCityOwner, pSourceCity, pTargetCity) then
								iTargetDist = ceil(iTargetDist * gPlagueTradeLocalMod) 
							end
						end
						if (iTargetDist <= thresholds.range) or bTradeRoute then
							--weighted value for each eligible target city
							local iValue = iTargetDist + iTargetHealth
							insert(targetCities, {value = iValue, health = iTargetHealth, city = pTargetCity})
						end
					end
				end
			else
				break;
			end
		end
		print(pSourceCity:GetName(),"#targetCities:",#targetCities)
		if #targetCities > 0 then
			local pPlagueCity
			local iPlagueCityHealth = 0
			if (#targetCities == 1) then
				pPlagueCity = targetCities[1].city
				iPlagueCityHealth = targetCities[1].health
			elseif (#targetCities > 1) then
				sort(targetCities, function(x,y) return (x.value < y.value) end)
				local minValue = targetCities[1].value
				local bestCities = 0
				for _, v in ipairs (targetCities) do
					if v.value == minValue then
						bestCities = bestCities + 1
					else
						break;
					end
				end
				local i = math.random(bestCities);
				pPlagueCity = targetCities[i].city
				iPlagueCityHealth = targetCities[i].health
			end

			if pPlagueCity then
				local iCityX = pPlagueCity:GetX();
				local iCityY = pPlagueCity:GetY();
				local iPlagueTurns = thresholds.duration - iPlagueCityHealth
				iPlagueTurns = (iPlagueTurns < 3) and 3 or iPlagueTurns
				
				--plagued cities heal slower
				pPlagueCity:ChangeHealRate(-gCityHeal);

				InsertPlagueCities({X = iCityX, Y = iCityY, turns = iPlagueTurns})

				print(pPlagueCity:GetName() .. " is now PLAGUED.")

				-- Notification
				if (pPlagueCity:GetOwner() == Game.GetActivePlayer()) then
					local text = Locale.ConvertTextKey("TXT_KEY_PLAGUE_SPREAD", GetCurrentPlagueName(), pPlagueCity:GetName());
					local heading = Locale.ConvertTextKey("TXT_KEY_PLAGUE_SPREAD_SHORT");
					Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, iCityX, iCityY);
				end
			end
		end
	end
end
--------------------------------------------------------------------
function InitPlagueEvent(event)
	local pPlagueCity
	local iPlagueCityHealth = 0
	local event = event

	if (RandomInteger() < gPlagueChance) then
		local targetCities = {}
		for i = 1, #gCityHealthList do
			local v = gCityHealthList[i]
			if (v.health < 0) then
				insert(targetCities, {health = v.health, city = v.city})
			end
		end
		if (#targetCities > 0) then
			local i = math.random(#targetCities)
			pPlagueCity = targetCities[i].city
			iPlagueCityHealth = targetCities[i].health
		end
	elseif (g_Properties.g_CurrentEra >= GameInfoTypes.ERA_RENAISSANCE) then
		pPlagueCity = GetSpyPlagueTarget()
	end
	
	if pPlagueCity then
		local bVirulent = (RandomInteger() < 10)
		local thresholds = GetEraThresholds()
		local x, y = pPlagueCity:GetX(), pPlagueCity:GetY()
		local plagueTurns = thresholds.duration - iPlagueCityHealth
		local plagueName = function()
			local choices = {}
			local name = "TXT_KEY_PLAGUE_UNNAMED" 
			local bModern = (g_Properties.g_CurrentEra > GameInfoTypes.ERA_RENAISSANCE)
			for row in GameInfo.PlagueNames() do
				if bModern then
					insert(choices, row.ModernDesc)
				elseif not row.OnlyModern then
					insert(choices, row.AncientDesc)
				end
			end
			if #choices > 0 then
				name = choices[math.random(#choices)]
			end
			return name
		end

		pPlagueCity:ChangeHealRate(-gCityHeal)

		InsertPlagueCities({X = x, Y = y, turns = ((plagueTurns < 3) and 3 or plagueTurns)})
		
		event.cooldowntimer = -1
		event.plaguetimer = bVirulent and (floor(gPlagueDuration*1.5)) or gPlagueDuration
		event.plaguename = plagueName()

		print("InitPlagueEvent(city, duration, name):", pPlagueCity:GetName(), event.plaguetimer, event.plaguename)
		
		--notification
		local text = Locale.ConvertTextKey("TXT_KEY_PLAGUE_BEGIN_UNSEEN")
		local heading = Locale.ConvertTextKey("TXT_KEY_PLAGUE_BEGIN_SHORT")
		if bVirulent then
			heading = Locale.ConvertTextKey("TXT_KEY_PLAGUE_BEGIN_SHORT_VIRULENT")
		end
		if (pPlagueCity:Plot():IsRevealed(Game.GetActiveTeam(), false)) then
			text = Locale.ConvertTextKey("TXT_KEY_PLAGUE_BEGIN", event.plaguename, pPlagueCity:GetName())
		end
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, x, y)
	end

	return event
end
--------------------------------------------------------------------
function GetSpyPlagueTarget()
	local pTargetCity = nil
	local sabotageTargets = {}
	for iPlayerLoop = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
        local pPlayer = Players[iPlayerLoop]
        if pPlayer and pPlayer:IsAlive() then
			local spies = pPlayer:GetEspionageSpies()
			if #spies > 0 then
				for i,v in ipairs(spies) do
					if (v.State == "TXT_KEY_SPY_STATE_SURVEILLANCE") or
					   (v.State == "TXT_KEY_SPY_STATE_GATHERING_INTEL") then
						local pCity = Map.GetPlot(v.CityX, v.CityY):GetPlotCity()
						if pCity then
							local iBonus = 0
							if (v.Rank == "TXT_KEY_SPY_RANK_1")	then
								iBonus = 1
							elseif (v.Rank == "TXT_KEY_SPY_RANK_2")	then
								iBonus = 2 
							end
							
							if (RandomInteger() <= (gSabotageChance + iBonus)) then
								insert(sabotageTargets, {city = pCity, saboteur = iPlayerLoop})
							end
						end
					end
				end
			end
        end
    end
	print("sabotageTargets:", #sabotageTargets)
	if #sabotageTargets > 0 then
		local i = math.random(#sabotageTargets)
		pTargetCity = sabotageTargets[i].city
		if pTargetCity then
			-- Notification
			local bNotify = false
			local text;
			local heading = Locale.ConvertTextKey("TXT_KEY_PLAGUE_SPY_SABOTAGE_SHORT");
			local iSaboteur = sabotageTargets[i].saboteur
			if (pTargetCity:GetOwner() == Game.GetActivePlayer()) then
				text = Locale.ConvertTextKey("TXT_KEY_PLAGUE_SPY_SABOTAGE_US", pTargetCity:GetName());
				bNotify = true
			elseif (iSaboteur == Game.GetActivePlayer()) then
				text = Locale.ConvertTextKey("TXT_KEY_PLAGUE_SPY_SABOTAGE_THEM", pTargetCity:GetName());
				bNotify = true
			end
			if bNotify then 
				Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, pTargetCity:GetX(), pTargetCity:GetY());
			end
			print(pTargetCity:GetName() .. " sabotaged by " .. Players[iSaboteur]:GetName())
		end
	end
	return pTargetCity
end
--------------------------------------------------------------------
function EndPlagueEvent(event)
	local t = GetPlagueCities()
	for i = 1, #t do
		local v = t[i]
		if (v.turns > -1) then
			local pCity = Map.GetPlot(v.X, v.Y):GetPlotCity()
			if pCity then 
				pCity:ChangeHealRate(gCityHeal) 
			end
		end
	end
	
	t = {}
	SavePlagueCities(t)

	--removes malus promotions
	for _, pPlayer in pairs(Players) do
		if pPlayer and pPlayer:IsAlive() then
			for pUnit in pPlayer:Units() do
				if pUnit then 
					Disease(pUnit, false) 
				end
			end
		end
	end

	-- notification
	local heading = Locale.ConvertTextKey("TXT_KEY_PLAGUE_ENDED_SHORT");
	local text = Locale.ConvertTextKey("TXT_KEY_PLAGUE_ENDED", event.plaguename);
	Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, -1, -1)
	
	local event = event
	event.cooldowntimer=gPlagueCooldown
	event.plaguetimer=-1
	event.plaguename=""

	return event
end
--------------------------------------------------------------------
function OnPlagueCure(playerID, iX, iY, improvementID)
	if (improvementID ~= GameInfoTypes.IMPROVEMENT_ACADEMY) then return end
	
	bFire = not bFire
	if not bFire then return end

	local t = GetPlagueCities()
	if #t > 0 then
		local pPlayer = Players[playerID]
		local cured = 0

		for i = #t, 1, -1 do
			local v = t[i]
			local pCity = Map.GetPlot(v.X, v.Y):GetPlotCity()
			if pCity and (pCity:GetOwner() == playerID) then
				pCity:ChangeHealRate(gCityHeal)
				remove(t, i)
				cured = cured + 1
			end
		end

		for pCity in pPlayer:Cities() do
			insert(t, { X = pCity:GetX(), Y = pCity:GetY(), turns = -1 })
		end

		for pUnit in pPlayer:Units() do
			Disease(pUnit, false)
		end

		if (cured > 0) then
			if (playerID == Game.GetActivePlayer()) then 
				local popupInfo = {Data1 = 500,Type = ButtonPopupTypes.BUTTONPOPUP_TEXT,Text = Locale.ConvertTextKey("TXT_KEY_PLAGUE_CURED", cured, GetCurrentPlagueName())}
				UI.AddPopup(popupInfo);
			end
		end

		SavePlagueCities(t)
	end
end
--------------------------------------------------------------------
-- Support
--------------------------------------------------------------------
function GetCurrentPlagueName()
	local t = GetPlagueData()
	if (t.plaguename ~= "") then
		return t.plaguename
	end
	return "TXT_KEY_PLAGUE_UNNAMED"
end
--------------------------------------------------------------------
function InsertPlagueCities(table)
	local t = GetPlagueCities()
	insert(t, table)
	SavePlagueCities(t)
end
--------------------------------------------------------------------
function IsWasPlagued(pCity)
	local t = GetPlagueCities()
	local x, y = pCity:GetX(), pCity:GetY()
	for i = 1, #t do
		local v = t[i]
		if (x == v.X) and (y == v.Y) then
			return true
		end
	end
	return false
end
--------------------------------------------------------------------
function KillPopulation(pCity)
	local activeID = Game.GetActivePlayer()
	local cityName = pCity:GetName()
	local cityPop = pCity:GetPopulation()
	local ownerID = pCity:GetOwner()
	local cityID = pCity:GetID()
	local iX, iY = pCity:GetX(), pCity:GetY()
	local bCapital = pCity:IsCapital() or pCity:IsOriginalCapital()
	local bAbandon = bAbandonCity and (cityPop == 1)
	local bNotify = false
	local setPop = function()
		pCity:ChangePopulation(-1, true)
		pCity:SetFood(floor(pCity:GrowthThreshold() / 2))
		bNotify = true
	end

	if bCapital then
		if (cityPop > 3) then
			setPop()
		end
	elseif (cityPop > 1) then
		setPop()
	elseif bAbandon then
		pCity:Kill()
		Events.SerialEventCityDestroyed(ToHexFromGrid(Vector2(iX, iY)), ownerID, cityID, -1)
		Events.SerialEventGameDataDirty()
		bNotify = true
	end
	
	-- Notification
	if bNotify and (ownerID == activeID) then
		local plagueName = GetCurrentPlagueName()
		local heading = Locale.ConvertTextKey("TXT_KEY_PLAGUE_DEATH_SHORT")
		local text = Locale.ConvertTextKey("TXT_KEY_PLAGUE_DEATH", plagueName, cityName)
		if bAbandon then
			text = Locale.ConvertTextKey("TXT_KEY_PLAGUE_DEATH_ABANDON", cityName, plagueName)
		end
    	Players[activeID]:AddNotification(NotificationTypes.NOTIFICATION_STARVING, text, heading, iX, iY);
	end

	return 0
end
--------------------------------------------------------------------
function DiseaseUnits(pCity)
	local iX, iY = pCity:GetX(), pCity:GetY();
	local iPercent = ( gPlagueAoEDamage / 100 )
	--affected city unit
	local pUnit = Map.GetPlot(iX, iY):GetUnit(0)
	if pUnit then
		SetAoEDamage(pUnit, iPercent);
		Disease(pUnit, true);
	end
	--city adjacent units
	for i = 0, 5 do
		local adjPlot = Map.PlotDirection(iX, iY, i)
		if adjPlot then
			local adjUnit = adjPlot:GetUnit(0)
			if adjUnit then
				if not IsDiseased(adjUnit) then
					Disease(adjUnit, true);
				end
				SetAoEDamage(adjUnit, iPercent);
			end
		end
	end
end
--------------------------------------------------------------------
function SetAoEDamage(pUnit, iPercent)
	local iMaxHP = pUnit:GetMaxHitPoints()
	local iChange = floor( iMaxHP * iPercent )
	local iNewDamage = pUnit:GetDamage() + iChange
	--cannot be killed by aoe damage
	if ( iNewDamage >= iMaxHP ) then
		iNewDamage = iMaxHP - 2
	end
	pUnit:SetDamage(iNewDamage)
end
--------------------------------------------------------------------
function IsInternationalTradeRoute(pSourceCity, pTargetCity)
	local bTargetTradeRoute = Players[pTargetCity:GetOwner()]:GetInternationalTradeRouteTotal(pTargetCity, pSourceCity, true, true) > 0;
	local bSourceTradeRoute = Players[pSourceCity:GetOwner()]:GetInternationalTradeRouteTotal(pSourceCity, pTargetCity, true, true) > 0;
	return bTargetTradeRoute or bSourceTradeRoute
end
--------------------------------------------------------------------
function IsConnected(iPlayer, pCity1, pCity2)
	local pPlayer = Players[iPlayer]
	return pPlayer:IsCapitalConnectedToCity(pCity1) and pPlayer:IsCapitalConnectedToCity(pCity2);
end
--------------------------------------------------------------------
function IsOpenBorders(iPlayer1, iPlayer2)
	local pPlayer = Players[iPlayer1]
	return pPlayer:IsPlayerHasOpenBorders(iPlayer2) or pPlayer:IsPlayerHasOpenBordersAutomatically(iPlayer2);
end
--------------------------------------------------------------------
function RandomInteger(min, max)
	local min = min and (min-1) or 0
	local max = max and (max-min) or 100
	return min + Game.Rand(max, "")
end
--------------------------------------------------------------------
function OnEraChanged(_, eraID)
	if (eraID > g_Properties.g_CurrentEra) then
		g_Properties.g_CurrentEra = eraID
	end
end
--------------------------------------------------------------------
-- Initialize
--------------------------------------------------------------------
function Initialize()
	
	g_Properties.g_CurrentEra = 0

	local n = GameDefines.MAX_MAJOR_CIVS - 1
	for i = 0, n, 1 do
		local player = Players[i]
		if player and player:IsAlive() then
			local eraID = player:GetCurrentEra()
			if (eraID > g_Properties.g_CurrentEra) then
				g_Properties.g_CurrentEra = eraID
			end
		end
	end

	local initialCooldown = (40-(PreGame.GetGameSpeed()*5))
	
	if bTest then
		gPlagueChance = 100
		initialCooldown = 3
		local thresholds = GetEraThresholds()
		print("thresholds", thresholds.health, thresholds.range, thresholds.duration)
	end
	
	if (Game.GetElapsedGameTurns() == 0) then
		local t = GetPlagueData()
		t.cooldowntimer = initialCooldown
		t.plaguetimer = -1
		t.plaguename = ""
		SavePlagueData(t)
	end

	UpdateCityHealthList()

	Events.LoadScreenClose.Add(OnLoadScreenClose)
	GameEvents.BuildFinished.Add(OnPlagueCure)
	GameEvents.PlayerDoTurn.Add(OnEndTurn)
	GameEvents.TeamSetEra.Add(OnEraChanged)

	--support for faith specialists
	for row in GameInfo.SpecialistYields("YieldType = 'YIELD_FAITH'") do
		include("FaithSpecialist.lua")
		break
	end

	print("+--Health & Plague (BNW) Loaded--+")
end
--------------------------------------------------------------------
Initialize()