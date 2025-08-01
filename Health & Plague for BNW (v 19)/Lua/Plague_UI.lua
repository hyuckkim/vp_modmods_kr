-- Plague_UI
-- Author: FramedArchitecture
-- DateCreated: 3/1/2013
--------------------------------------------------------------------
include ("Plague_SaveData.lua")
--------------------------------------------------------------------
MapModData.g_Properties	= MapModData.g_Properties or {}
g_Properties			= MapModData.g_Properties
--------------------------------------------------------------------
PlayerClass		 = getmetatable(Players[0]).__index
LuaEvents.Player = LuaEvents.Player		or function(player)	 end
LuaEvents.City	 = LuaEvents.City		or function(city)	 end
--------------------------------------------------------------------
local bNoPlagues	 = (PreGame.GetGameOption("GAMEOPTION_PLAGUE_DISABLED") == 1)
local bAbandonCity	 = (PreGame.GetGameOption("GAMEOPTION_PLAGUE_DESTROYS_CITIES") == 1)
local bNonHistoric	 = (PreGame.GetGameOption("GAMEOPTION_PLAGUE_NONHISTORIC") == 1)
local bWorldVariable	= true		-- Plague spread range changes with World Size	
local bSpeedVariable	= false		-- Plague duration changes with Game Speed
local gHandicap			= (PreGame.GetHandicap(0) > 0) and PreGame.GetHandicap(0) or 1
local gCityHealthMod	= GameDefines["PLAGUE_CITY_POPULATION_MOD"]
local gMinorEmpireBonus	= GameDefines["PLAGUE_MINOR_EMPIRE_BONUS"]
local gPlagueDurMod		= GameInfo.GameSpeeds[PreGame.GetGameSpeed()].GrowthPercent / 100
local gPlagueRangeMod	= GameInfo.Worlds[PreGame.GetWorldSize()].ResearchPercent / 100
local insert			= table.insert
local concat			= table.concat
local ceil				= math.ceil
local floor				= math.floor
local condition			= "YieldType = 'YIELD_HEALTH'"
--------------------------------------------------------------------
-- UI
--------------------------------------------------------------------
function PlayerClass.GetEmpireHealthTotal(pPlayer)
	local t = pPlayer:GetEmpireHealthDetails()
	return t.total
end
LuaEvents.Player.Add( PlayerClass.GetEmpireHealthTotal )
--------------------------------------------------------------------
function PlayerClass.GetEmpireHealthDetails(pPlayer)
	local health = {
		["total"] = 0,
		["happiness"] = 0,
		["trait"] = 0,
		["tech"] = 0,
		["policy"] = 0,
		["building"] = 0,
		["trade"] = 0,
		["diversity"] = 0,
		["religion"] = 0,
	}

	if not pPlayer:IsAnarchy() then
		health.happiness = GetHappinessMod(pPlayer)
		health.trait = GetTraitMod(pPlayer)
		health.tech = GetTechMod(pPlayer)
		health.policy = GetEmpirePolicyMod(pPlayer)
		health.building = GetEmpireBuildingMod(pPlayer)
		health.trade = GetEmpireTradeMod(pPlayer)
		health.diversity = GetDiversityMod(pPlayer)
		health.religion = GetEmpireReligionMod(pPlayer)

		local total = 0
		for _, value in pairs(health) do
			total = total + value
		end

		health.total = total
	end

	return health
end
LuaEvents.Player.Add( PlayerClass.GetEmpireHealthDetails )
--------------------------------------------------------------------
function GetCityHealthTotal(pCity)
	local t = GetCityHealthDetails(pCity)
	return t.total
end
LuaEvents.City.Add( GetCityHealthTotal )
--------------------------------------------------------------------
function GetCityHealthDetails(pCity)
	local health = {
		["total"] = 0,
		["empire"] = 0,
		["pop"] = 0,
		["water"] = 0,
		["building"] = 0,
		["specialist"] = 0,
		["resource"] = 0,
		["improvement"] = 0,
		["feature"] = 0,
		["religion"] = 0,
		["policy"] = 0,
		["tourism"] = 0,
		["plague"] = 0,
	}

	if not pCity:IsResistance() and not pCity:IsRazing() then
		local beliefs = GetCityBeliefs(pCity)

		health.pop = GetPopulationMod(pCity)
		health.water = GetWaterMod(pCity)
		health.building = GetBuildingHealthMod(pCity)
		health.specialist = GetSpecialistHealthMod(pCity)
		health.resource = GetResourceHealthMod(pCity)
		health.improvement = GetImprovementHealthMod(pCity)
		health.feature = GetFeatureHealthMod(pCity, beliefs)
		health.religion = GetCityReligionMod(pCity, beliefs)
		health.policy = GetCityPolicyMod(pCity)
		health.tourism = GetCityTourismMod(pCity)
		health.plague = GetPlagueMod(pCity)

		local healthmod = (Players[pCity:GetOwner()]:GetEmpireHealthTotal()/100)
		if (healthmod ~= 0) then
			local round = function(x)
				if (x > 0) then return ceil(x) end
				if (x <= 0) then return floor(x) end
			end
			for _, value in pairs(health) do
				if (healthmod > 0) and (value > 0) then
					health.empire = health.empire + (healthmod*value)
				elseif (healthmod < 0) and (value < 0) then
					health.empire = health.empire - (healthmod*value)
				end
			end
			health.empire = round(health.empire)
		end
		
		local total = 0
		for _, value in pairs(health) do
			total = total + value
		end

		health.total = total
	end

	return health
end
--------------------------------------------------------------------
function GetHealthTooltip(pCity, bCondensed)
	local strTT = "";
	local tips = {};

	local health = GetCityHealthDetails(pCity);

	if (not OptionsManager.IsNoBasicHelp() and not bCondensed) then
		if (health.plague < 0) then
			insert(tips, Locale.ConvertTextKey("TXT_KEY_PM_HEALTH_HELP_PLAGUE_INFO") .. "[NEWLINE]");
		else
			insert(tips, Locale.ConvertTextKey("TXT_KEY_PM_HEALTH_HELP_INFO") .. "[NEWLINE]");
		end
	end

	if (health.pop ~= 0) then
		if health.pop < 0 then 
			insert(tips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_PM_DISEASE_FROM_POP", health.pop));
		else
			insert(tips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_PM_HEALTH_FROM_POP", health.pop));
		end
	end
	if (health.water ~= 0) then
		if health.water < 0 then 
			insert(tips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_PM_HEALTH_FROM_NO_WATER", health.water));
		else
			insert(tips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_PM_HEALTH_FROM_WATER", health.water));
		end
	end
	if (health.building ~= 0) then
		if health.building < 0 then 
			insert(tips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_PM_DISEASE_FROM_BUILDINGS", health.building));
		else
			insert(tips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_PM_HEALTH_FROM_BUILDINGS", health.building));
		end
	end
	if (health.specialist ~= 0) then
		insert(tips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_PM_HEALTH_FROM_SPECIALISTS", health.specialist));
	end
	if (health.resource ~= 0) then
		if health.resource < 0 then 
			insert(tips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_PM_DISEASE_FROM_RESOURCES", health.resource));
		else
			insert(tips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_PM_HEALTH_FROM_RESOURCES", health.resource));
		end
	end
	if (health.improvement ~= 0) then
		if health.improvement < 0 then 
			insert(tips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_PM_DISEASE_FROM_IMPOVEMENTS", health.improvement));
		else
			insert(tips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_PM_HEALTH_FROM_IMPROVEMENTS", health.improvement));
		end
	end
	if (health.feature ~= 0) then
		if health.feature < 0 then 
			insert(tips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_PM_DISEASE_FROM_FEATURES", health.feature));
		else
			insert(tips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_PM_HEALTH_FROM_FEATURES", health.feature));
		end
	end
	if (health.religion ~= 0) then
		if health.religion < 0 then 
			insert(tips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_PM_DISEASE_FROM_RELIGION", health.religion));
		else
			insert(tips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_PM_HEALTH_FROM_RELIGION", health.religion));
		end
	end
	if (health.policy ~= 0) then
		if health.policy < 0 then 
			insert(tips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_PM_DISEASE_FROM_POLICY", health.policy));
		else
			insert(tips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_PM_HEALTH_FROM_POLICY", health.policy));
		end
	end
	if (health.tourism ~= 0) then
		if health.tourism < 0 then 
			insert(tips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_PM_DISEASE_FROM_TOURISM", health.tourism));
		else
			insert(tips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_PM_HEALTH_FROM_TOURISM", health.tourism));
		end
	end
	if (health.empire ~= 0) then
		if health.empire < 0 then 
			insert(tips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_PM_HEALTH_LOST_CIVMOD", health.empire));
		else
			insert(tips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_PM_HEALTH_GAIN_CIVMOD", health.empire));
		end
	end
	if (health.plague < 0) then
		insert(tips, "[ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_PM_DISEASE_FROM_PLAGUE", health.plague));
	end
	
	insert(tips, "----------------");

	if health.total < 0 then
		insert(tips, Locale.ConvertTextKey("TXT_KEY_YIELD_TOTAL_NEGATIVE", health.total, "[ICON_HEALTH]"));
	else
		insert(tips, Locale.ConvertTextKey("TXT_KEY_YIELD_TOTAL", health.total, "[ICON_HEALTH]"));
	end

	if #tips > 0 then
		strTT = concat(tips, "[NEWLINE]")
	end

	return strTT;
end
--------------------------------------------------------------------
function GetCityPlagueInfo(pCity)
	if not bNoPlagues then
		local t = GetPlagueCities()
		if (#t > 0) then
			local iX, iY = pCity:GetX(), pCity:GetY()
			for _, v in ipairs(t) do
				if (v.turns > 0) then
					if (iX == v.X) and (iY == v.Y) then
						return true, v.turns
					end
				end
			end
		end
	end
	return false, 0;
end
LuaEvents.City.Add( GetCityPlagueInfo )
--------------------------------------------------------------------
-- Functions
--------------------------------------------------------------------
function GetPopulationMod(pCity)
	local iHealth = 0
	if Players[pCity:GetOwner()]:IsHuman() then
		iHealth = -ceil( math.log(pCity:GetPopulation())*gCityHealthMod + floor(gHandicap/3) )
	else
		iHealth = -ceil( math.log(pCity:GetPopulation())*gCityHealthMod )
	end
	return iHealth;
end
--------------------------------------------------------------------
function GetWaterMod(pCity)
	local iHealth = -1;
	if pCity:Plot():IsFreshWater() then
		iHealth = iHealth + 2
	else
		for row in GameInfo.Buildings("AddsFreshWaterHealth = 1") do
			if pCity:IsHasBuilding(row.ID) then
				iHealth = iHealth + 2
				break
			end
		end
	end
	return iHealth;
end
--------------------------------------------------------------------
function GetBuildingHealthMod(pCity)
	local iHealth = 0
	for row in GameInfo.Building_YieldChanges(condition) do
		if pCity:IsHasBuilding(GameInfoTypes[row.BuildingType]) then
			iHealth = iHealth + row.Yield
		end
	end
	return iHealth;
end
--------------------------------------------------------------------
function GetSpecialistHealthMod(pCity)
	local iHealth = 0
	for row in GameInfo.SpecialistYields(condition) do
		local specialistInfo = GameInfo.Specialists[row.SpecialistType]
		if specialistInfo then
			local iCount = pCity:GetSpecialistCount(specialistInfo.ID)
			if iCount >  0 then
				iHealth = iHealth + (iCount * row.Yield)
			end
		end
	end
	return iHealth;
end
--------------------------------------------------------------------
function GetResourceHealthMod(pCity)
	local iHealth = 0

	local teamID = Players[pCity:GetOwner()]:GetTeam();
	local n = pCity:GetNumCityPlots() - 1
	
	for i = 0, n, 1 do
		local plot = pCity:GetCityIndexPlot( i )
		if plot and pCity:IsWorkingPlot( plot ) then
			local resourceID = plot:GetResourceType(teamID)
			if (resourceID > -1) then
				local improvementID = plot:GetImprovementType()
				if (improvementID > -1) or plot:IsCity() then
					local bPillaged = plot:IsImprovementPillaged()
					for row in GameInfo.Improvement_ResourceType_Yields(condition) do
						local resourceInfo = GameInfo.Resources[row.ResourceType]
						local improvementInfo = GameInfo.Improvements[row.ImprovementType]
						if resourceInfo and improvementInfo and not bPillaged then
							if (resourceID == resourceInfo.ID) then
								if (improvementID == improvementInfo.ID) or plot:IsCity() then
									iHealth = iHealth + row.Yield
								end
							end
						end
					end
				end
				for row in GameInfo.Resource_YieldChanges(condition) do
					local resourceInfo = GameInfo.Resources[row.ResourceType]
					if resourceInfo then
						if (resourceID == resourceInfo.ID) then
							iHealth = iHealth + row.Yield
						end
					end
				end
			end
		end
	end

	return iHealth;
end
--------------------------------------------------------------------
function GetImprovementHealthMod(pCity)
	local iHealth = 0
	local teamID = pCity:GetTeam()
	local pTeamTechs = Teams[teamID]:GetTeamTechs()
	local n = pCity:GetNumCityPlots() - 1

	for i = 1, n, 1 do
		local plot = pCity:GetCityIndexPlot( i );
		if plot and pCity:IsWorkingPlot( plot ) then
			local improvementID = plot:GetImprovementType()
			if (improvementID > -1) and not plot:IsImprovementPillaged() then
				for row in GameInfo.Improvement_Yields(condition) do
					local improvementInfo = GameInfo.Improvements[row.ImprovementType]
					if improvementInfo and (improvementID == improvementInfo.ID) then
						iHealth = iHealth + row.Yield
					end
				end
				for row in GameInfo.Improvement_TechYieldChanges(condition) do
					local improvementInfo = GameInfo.Improvements[row.ImprovementType]
					if improvementInfo and (improvementID == improvementInfo.ID) then
						local techInfo = GameInfo.Technologies[row.TechType]
						if techInfo and pTeamTechs:HasTech(techInfo.ID) then
							iHealth = iHealth + row.Yield
						end
					end
				end
				if plot:IsFreshWater() then
					for row in GameInfo.Improvement_TechFreshWaterYieldChanges(condition) do
						local improvementInfo = GameInfo.Improvements[row.ImprovementType]
						if improvementInfo and (improvementID == improvementInfo.ID) then
							local techInfo = GameInfo.Technologies[row.TechType]
							if techInfo and pTeamTechs:HasTech(techInfo.ID) then
								iHealth = iHealth + row.Yield
							end
						end
					end
				end
			end
		end
	end

	return iHealth;
end
--------------------------------------------------------------------
function GetFeatureHealthMod(pCity, beliefs)
	local iHealth = 0
	local cityPlot = pCity:Plot()
	local bReligion = (#beliefs > 0) and true or false
	local n = pCity:GetNumCityPlots() - 1
	for i = 1, n, 1 do
		local plot = pCity:GetCityIndexPlot( i )
		if plot and (plot:GetFeatureType() > -1) then
			local bWorking = pCity:IsWorkingPlot( plot )
			local featureID = plot:GetFeatureType() 
			for row in GameInfo.Feature_YieldChanges(condition) do
				local featureInfo = GameInfo.Features[row.FeatureType]
				if featureInfo and (featureID == featureInfo.ID) then
					if row.OnlyAdjacentCity then
						if IsAdjacentCity(plot, cityPlot) then
							iHealth = iHealth + row.Yield
						end
					elseif bWorking then
						iHealth = iHealth + row.Yield
					end
				end
			end
			if bReligion then
				for _,belief in ipairs(beliefs) do
					for row in GameInfo.Belief_FeatureYieldChanges(condition) do
						if (row.BeliefType == belief) then
							local featureInfo = GameInfo.Features[row.FeatureType]
							if featureInfo and (featureID == featureInfo.ID) then
								iHealth = iHealth + row.Yield
							end
						end
					end
				end
			end
		end
	end
	return iHealth;
end
--------------------------------------------------------------------
function GetCityReligionMod(pCity, beliefs)
	local iHealth = 0
	if #beliefs > 0 then
		for _,belief in ipairs(beliefs) do
			if (pCity:GetPopulation() > 2) then
				for row in GameInfo.Belief_CityYieldChanges(condition) do
					if row.BeliefType == belief then
						iHealth = iHealth + row.Yield
					end
				end
			end
			if pCity:IsHolyCityAnyReligion() then
				for row in GameInfo.Belief_HolyCityYieldChanges(condition) do
					if row.BeliefType == belief then
						iHealth = iHealth + row.Yield
					end
				end
			end
			for row in GameInfo.Belief_BuildingClassYieldChanges(condition) do
				if row.BeliefType == belief then
					for building in GameInfo.Buildings("BuildingClass='" .. row.BuildingClassType .. "'") do
						if pCity:IsHasBuilding(building.ID) then
							iHealth = iHealth + row.YieldChange
						end
					end
				end
			end
		end
	end
	return iHealth;
end
--------------------------------------------------------------------
function GetCityPolicyMod(pCity)
	local iHealth = 0
	local pPlayer = Players[pCity:GetOwner()]
	if pCity:IsCapital() then
		for row in GameInfo.Policy_CapitalYieldPerPopChanges(condition) do
			local policyInfo = GameInfo.Policies[row.PolicyType]
			if policyInfo then
				if pPlayer:HasPolicy(policyInfo.ID) and not pPlayer:IsPolicyBlocked(policyInfo.ID) then 
					local iYield = floor( pCity:GetPopulation() / (100/row.Yield) )
					iHealth = iHealth + iYield
				end
			end
		end
	end 
	for row in GameInfo.Policy_BuildingClassYieldChanges(condition) do
		local policyInfo = GameInfo.Policies[row.PolicyType]
		if policyInfo then
			if pPlayer:HasPolicy(policyInfo.ID) and not pPlayer:IsPolicyBlocked(policyInfo.ID) then 
				local pClass = GameInfo.BuildingClasses[row.BuildingClassType]
				if pClass then
					for building in GameInfo.Buildings("BuildingClass='" .. pClass.Type .. "'") do
						if ( pCity:IsHasBuilding(building.ID) ) then
							iHealth = iHealth + row.YieldChange
						end
					end
				end
			end
		end
	end
	return iHealth;
end
--------------------------------------------------------------------
function GetCityTourismMod(pCity)
	local iHealth = 0
	if Players[pCity:GetOwner()]:GetNumSpies() > 0 then
		local iTourism = pCity:GetBaseTourism(); 
		if iTourism < 5 then 
			iHealth = 1
		elseif iTourism <= 60 then
			iHealth = -floor(iTourism / 6) 
		elseif iTourism > 60 then
			iHealth = -10
		end
	end
	return iHealth;
end
--------------------------------------------------------------------
function GetPlagueMod(pCity)
	local iHealth = 0
	
	local unit = pCity:GetGarrisonedUnit()
	if unit and IsDiseased(unit) then
		iHealth = iHealth - 1
	end

	local iX, iY = pCity:GetX(), pCity:GetY()
	for i = 0, 5 do
		local adjPlot = Map.PlotDirection(iX, iY, i)
		if adjPlot then
			local adjUnit = adjPlot:GetUnit(0)
			if adjUnit and IsDiseased(adjUnit) then
				iHealth = iHealth - 1
			end
		end
	end

	local bPlagued, iTurns = GetCityPlagueInfo(pCity)
	if bPlagued then
		iHealth = iHealth - iTurns
	end

	return iHealth
end
--------------------------------------------------------------------
function GetHappinessMod(pPlayer)
	local iHealth = 0
	if pPlayer:IsGoldenAge() then
		iHealth = 10
	elseif pPlayer:IsEmpireUnhappy() then
		local iUnhappy = pPlayer:GetExcessHappiness()
		iHealth = (iUnhappy < -10) and -10 or iUnhappy
	end
	return iHealth;
end
--------------------------------------------------------------------
function GetTraitMod(pPlayer)
	if pPlayer:IsMinorCiv() then
		return gMinorEmpireBonus
	end

	local traitType = GetTraitType(pPlayer)
	if traitType then
		for row in GameInfo.Trait_HealthModifier("TraitType='" .. traitType .. "'") do
			if row.EraPrereq then
				if pPlayer:GetCurrentEra() < GameInfoTypes[row.EraPrereq] then
					return 0;
				end
			end
			return row.HealthModifier
		end
	end
	return 0;
end
--------------------------------------------------------------------
function GetTechMod(pPlayer)
	local pTeam = Teams[pPlayer:GetTeam()]
	local iHealth = 0
	for row in GameInfo.Technology_Health() do
		local iYield = row.Yield
		local techInfo = GameInfo.Technologies[row.TechType]
		if techInfo then
			if ( pTeam:IsHasTech(techInfo.ID) ) then
				iHealth = iHealth + iYield
			end
		end
	end
	return iHealth;
end
--------------------------------------------------------------------
function GetEmpirePolicyMod(pPlayer)
	local iHealth = 0
	for row in GameInfo.PolicyBranch_Health() do
		local iYield = row.Yield
		local branchInfo = GameInfo.PolicyBranchTypes[row.PolicyBranchType]
		if branchInfo then
			for row in GameInfo.Policies("PolicyBranchType='" .. branchInfo.Type .. "'") do
				if pPlayer:HasPolicy(row.ID) and not pPlayer:IsPolicyBlocked(row.ID) then 
					iHealth = iHealth + iYield
				end
			end
		end
	end

	for row in GameInfo.Policy_YieldModifiers(condition) do
		local policyInfo = GameInfo.Policies[row.PolicyType]
		if policyInfo then
			if pPlayer:HasPolicy(policyInfo.ID) and not pPlayer:IsPolicyBlocked(policyInfo.ID) then 
				iHealth = iHealth + row.Yield
			end
		end
	end

	for row in GameInfo.Policy_BuildingClassYieldModifiers(condition) do
		local policyInfo = GameInfo.Policies[row.PolicyType]
		if policyInfo then
			if pPlayer:HasPolicy(policyInfo.ID) and not pPlayer:IsPolicyBlocked(policyInfo.ID) then 
				local classInfo = GameInfo.BuildingClasses[row.BuildingClassType]
				if classInfo then
					local iBonus = row.YieldMod * pPlayer:GetBuildingClassCount(classInfo.ID)
					iBonus = iBonus < 10 and iBonus or 10
					iHealth = iHealth + iBonus
				end
			end
		end
	end

	return iHealth;
end
--------------------------------------------------------------------
function GetEmpireBuildingMod(pPlayer)
	local iHealth = 0
	for row in GameInfo.Building_YieldModifiers(condition) do
		local buildingInfo = GameInfo.Buildings[row.BuildingType]
		if buildingInfo then
			iHealth = iHealth + (pPlayer:CountNumBuildings(buildingInfo.ID) * row.Yield)
		end
	end
	return iHealth;
end
--------------------------------------------------------------------
function GetEmpireTradeMod(pPlayer)
	local iHealth = 0
	local routes = pPlayer:GetTradeRoutes()
	
	for i,v in ipairs(routes) do
		if v.FromID ~= v.ToID then
			iHealth = iHealth - 1
		end
	end

	return iHealth;
end
--------------------------------------------------------------------
function GetDiversityMod(pPlayer)
	local iHealth = -1
	for row in GameInfo.Improvement_ResourceType_Yields(condition) do
		if row.Yield > 0 then
			local resourceInfo = GameInfo.Resources[row.ResourceType]
			if resourceInfo and (pPlayer:GetNumResourceAvailable(resourceInfo.ID, true) > 0) then
				iHealth = iHealth + 1
			end
		end
	end
	return (iHealth > 0) and iHealth or 0;
end
--------------------------------------------------------------------
function GetEmpireReligionMod(pPlayer)
	local iHealth = 0
	
	if pPlayer:HasCreatedReligion() then
		local eReligion = pPlayer:GetReligionCreatedByPlayer();
		for _,v in ipairs(Game.GetBeliefsInReligion(eReligion)) do
			local belief = GameInfo.Beliefs[v];
			if belief and belief.Founder then
				for row in GameInfo.Belief_YieldChangePerForeignCity(condition) do
					if row.BeliefType == belief.Type then
						local iBonus = (Game.GetNumCitiesFollowing(eReligion) * row.Yield)
						iBonus = (iBonus < 20) and iBonus or 20
						iHealth = iHealth + iBonus
					end
				end
			end
		end
	end

	return iHealth;
end
--------------------------------------------------------------------
-- Support
--------------------------------------------------------------------
function GetHealthFromSpecialist(specialistType)
	for row in GameInfo.SpecialistYields("SpecialistType='" .. specialistType .. "'") do
		if row.YieldType == "YIELD_HEALTH" then
			return row.Yield
		end
	end
	return 0;
end
--------------------------------------------------------------------
function CalculateHealthYield(plot)
	local iHealth = 0

	local teamID = Game.GetActiveTeam();
	local improvementID = plot:GetRevealedImprovementType(teamID, false)
	local resourceID = plot:GetResourceType(teamID)
	local featureID = plot:GetFeatureType()
	local bPillaged = plot:IsImprovementPillaged()
	local pWorkingCity = plot:GetWorkingCity()
	local bWorked = plot:IsBeingWorked()
	local bCity = plot:IsCity()
	
	if ((improvementID > -1) or bCity) and not bPillaged then
		local plotTeamID = plot:GetTeam()
		if (plotTeamID ~= -1) and not bCity then
			local pTeamTechs = Teams[plotTeamID]:GetTeamTechs()
			for row in GameInfo.Improvement_TechYieldChanges(condition) do
				local improvementInfo = GameInfo.Improvements[row.ImprovementType]
				if improvementInfo and (improvementID == improvementInfo.ID) then
					local techInfo = GameInfo.Technologies[row.TechType]
					if techInfo and pTeamTechs:HasTech(techInfo.ID)then
						iHealth = iHealth + row.Yield
					end
				end
			end
			if plot:IsFreshWater() then
				for row in GameInfo.Improvement_TechFreshWaterYieldChanges(condition) do
					local techInfo = GameInfo.Technologies[row.TechType]
					if techInfo and pTeamTechs:HasTech(techInfo.ID) then
						local improvementInfo = GameInfo.Improvements[row.ImprovementType]
						if improvementInfo and (improvementID == improvementInfo.ID) then
							iHealth = iHealth + row.Yield
						end
					end
				end
			end
		end
		for row in GameInfo.Improvement_Yields(condition) do
			local improvementInfo = GameInfo.Improvements[row.ImprovementType]
			if improvementInfo and (improvementID == improvementInfo.ID) then
				iHealth = iHealth + row.Yield
			end
		end
		for row in GameInfo.Improvement_ResourceType_Yields(condition) do
			local resourceInfo = GameInfo.Resources[row.ResourceType]
			if resourceInfo and (resourceID == resourceInfo.ID) then
				local improvementInfo = GameInfo.Improvements[row.ImprovementType]
				if (improvementInfo and (improvementID == improvementInfo.ID)) or bCity then
					iHealth = iHealth + row.Yield
				end
			end
		end
	end

	if (resourceID > -1) then
		for row in GameInfo.Resource_YieldChanges(condition) do
			local resourceInfo = GameInfo.Resources[row.ResourceType]
			if resourceInfo and (resourceID == resourceInfo.ID) then
				iHealth = iHealth + row.Yield
			end
		end
	end

	if (featureID > -1) then
		for row in GameInfo.Feature_YieldChanges(condition) do
			local featureInfo = GameInfo.Features[row.FeatureType]
			if featureInfo and (featureID == featureInfo.ID) then
				if row.OnlyAdjacentCity then 
					if IsAdjacentCity(plot) then
						iHealth = iHealth + row.Yield
					end
				else
					iHealth = iHealth + row.Yield
				end
			end
		end
		if not bWorked and pWorkingCity then
			local beliefs = GetCityBeliefs(pWorkingCity)
			for _,belief in ipairs(beliefs) do
				for row in GameInfo.Belief_FeatureYieldChanges(condition) do
					if (row.BeliefType == belief) then
						local featureInfo = GameInfo.Features[row.FeatureType]
						if featureInfo and (featureID == featureInfo.ID) then
							iHealth = iHealth + row.Yield
						end
					end
				end
			end
		end
	end

	return iHealth;
end
--------------------------------------------------------------------
function GetCityBeliefs(pCity)
	local beliefs = {}
	local eReligion = pCity:GetReligiousMajority()
	if (eReligion == 0) then
		insert(beliefs, GameInfo.Beliefs[Players[pCity:GetOwner()]:GetBeliefInPantheon()].Type)
	elseif (eReligion > 0) then
		for _,v in ipairs(Game.GetBeliefsInReligion(eReligion)) do
			local belief = GameInfo.Beliefs[v]
			if belief then
				insert(beliefs, belief.Type)
			end
		end
	end	
	return beliefs
end
--------------------------------------------------------------------
function IsAdjacentCity(plot, cityPlot)
	if not plot:IsPotentialCityWork() then
		return false;
	end
	local iX, iY = plot:GetX(), plot:GetY()
	local x, y
	if cityPlot then
		x, y = cityPlot:GetX(), cityPlot:GetY()
	end
	for i = 0, 5 do
		local adjPlot = Map.PlotDirection(iX, iY, i)
		if adjPlot and adjPlot:IsCity() then
			if cityPlot then
				return (x == adjPlot:GetX()) and (y == adjPlot:GetY())
			end
			return true;
		end
	end
	return false;
end
--------------------------------------------------------------------
function Disease(pUnit, bBoolean)
	pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_PLAGUED, bBoolean)
end
--------------------------------------------------------------------
function IsDiseased(pUnit)
	return pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_PLAGUED)
end
--------------------------------------------------------------------
function GetTraitType(pPlayer)
	local leaderType = GameInfo.Leaders[pPlayer:GetLeaderType()].Type;
		for row in GameInfo.Leader_Traits( "LeaderType ='" .. leaderType .. "'" ) do
			return GameInfo.Traits[row.TraitType].Type
		end
	return nil;
end
--------------------------------------------------------------------
function GetEraThresholds()
	local thresholds = {}

	local eraType = GameInfo.Eras[g_Properties.g_CurrentEra].Type 
	if bNonHistoric then
		eraType = GameInfo.Eras["ERA_RENAISSANCE"].Type
	end

	for row in GameInfo.Era_PlagueDefines("EraType='" .. eraType .. "'") do
		
		thresholds.health = row.HealthMin

		if bWorldVariable then
			thresholds.range = ceil(row.MaxRange * gPlagueRangeMod)
		else
			thresholds.range = row.MaxRange
		end

		if bSpeedVariable then 
			thresholds.duration = floor(row.MaxDuration * gPlagueDurMod)
		else
			thresholds.duration = row.MaxDuration
		end
	end

	return thresholds
end
--------------------------------------------------------------------