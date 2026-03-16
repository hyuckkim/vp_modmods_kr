-- Lua YnAEMP Utils
-- Author: Gedemon
-- DateCreated: 5/8/2011 3:32:29 PM
--------------------------------------------------------------
include("PlotIterators.lua")

function GetPlot(x,y)
	local plot = Map:GetPlotXY(y,x)
	return plot
end

function IsValidPlot(playerID, minDistance, startingPlot)
	for adjacentPlot in PlotAreaSpiralIterator(startingPlot, minDistance, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
		if adjacentPlot:IsStartingPlot() then
			return false
		end
	end
	return true
end

function ListAllCivs()
	print ("+++++++++++++++++++")
	print ("---- civ list -----")
	for iPlayer = 0, GameDefines.MAX_PLAYERS do
		local player = Players[iPlayer]
		if player ~= nil then
			local str = "- " .. iPlayer .. " - "
			if player:IsMinorCiv() then
				local minorCivType = player:GetMinorCivType();
				local civInfo = GameInfo.MinorCivilizations[minorCivType];
				local minorName = Locale.ConvertTextKey( civInfo.Description ) 
				str = str .. "Minor civ " .. minorName .. " (" .. minorCivType ..") - "
			else
				local majorCivType = player:GetCivilizationType();
				local civInfo = GameInfo.Civilizations[majorCivType];
				local minorName = Locale.ConvertTextKey( civInfo.Description ) 
				str = str .. "Major civ " .. minorName .. " (" .. majorCivType ..") - "
			end
			if player:IsAlive() then
				str = str .. " alive - "
			end
			print (str)
		end
	end
	print ("+++++++++++++++++++")
end

function IsCulDivActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "31a31d1c-b9d7-45e1-842c-23232d66cd47" then
			return true
		end
	end
	return false
end


function GetCultureType(civilizationID, isMinor)
	local cultureID = nil 
	local subCultureID = nil
	if IsCulDivActive() then
		local artDefineCultureTypes = {}
		artDefineCultureTypes["ARTSTYLE_SOUTH_AMERICA"]	 = GameInfo.JFD_CultureTypes["CULTURE_JFD_GREAT_PLAINS"].ID
		artDefineCultureTypes["ARTSTYLE_ASIAN"]		  	 = GameInfo.JFD_CultureTypes["CULTURE_JFD_ORIENTAL"].ID
		artDefineCultureTypes["ARTSTYLE_EUROPEAN"]	  	 = GameInfo.JFD_CultureTypes["CULTURE_JFD_WESTERN"].ID
		artDefineCultureTypes["ARTSTYLE_GRECO_ROMAN"] 	 = GameInfo.JFD_CultureTypes["CULTURE_JFD_CLASSICAL"].ID
		artDefineCultureTypes["ARTSTYLE_MIDDLE_EAST"]	 = GameInfo.JFD_CultureTypes["CULTURE_JFD_ISLAMIC"].ID
		artDefineCultureTypes["ARTSTYLE_POLYNESIAN"]  	 = GameInfo.JFD_CultureTypes["CULTURE_JFD_OCEANIC"].ID
		if (not isMinor) then
			local civilization = GameInfo.Civilizations[civilizationID]
			for row in GameInfo.Civilization_JFD_CultureTypes("CivilizationType = '" .. civilization.Type .. "'") do
				cultureID = GameInfo.JFD_CultureTypes[row.CultureType].ID
				if (not cultureID) then
					for culture in GameInfo.JFD_CultureTypes("LowerType = '" .. row.CultureType .. "'") do
						cultureID = culture.ID
						break
					end
				end
			end
			if (not cultureID) then cultureID = artDefineCultureTypes[civilization.ArtStyleType] end
		else
			local minorCivilization = GameInfo.MinorCivilizations[civilizationID]
			for row in GameInfo.MinorCivilization_JFD_CultureTypes("MinorCivilizationType = '" .. minorCivilization.Type .. "'") do
				cultureID = GameInfo.JFD_CultureTypes[row.CultureType].ID
				if (not cultureID) then
					for culture in GameInfo.JFD_CultureTypes("LowerType = '" .. row.CultureType .. "'") do
						cultureID = culture.ID
						break
					end
				end
			end
			if (not cultureID) then cultureID = artDefineCultureTypes[minorCivilization.ArtStyleType] end
		end
		if (not cultureID) then cultureID = GameInfo.JFD_CultureTypes["CULTURE_JFD_COLONIAL"].ID end
	end
	return cultureID, subCultureID
end
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------