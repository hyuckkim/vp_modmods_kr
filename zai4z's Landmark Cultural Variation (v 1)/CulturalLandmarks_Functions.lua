local Archaeologists = {}
local LandmarkID = GameInfoTypes.IMPROVEMENT_LANDMARK
local ArtToLandmark = {
    [GameInfoTypes.ARTSTYLE_SOUTH_AMERICA] = GameInfoTypes.IMPROVEMENT_LANDMARK_AMER,
    [GameInfoTypes.ARTSTYLE_ASIAN] = GameInfoTypes.IMPROVEMENT_LANDMARK_ASIA,
    [GameInfoTypes.ARTSTYLE_MIDDLE_EAST] = GameInfoTypes.IMPROVEMENT_LANDMARK_AFRI,
    [GameInfoTypes.ARTSTYLE_EUROPEAN] = GameInfoTypes.IMPROVEMENT_LANDMARK_EURO,
    [GameInfoTypes.ARTSTYLE_GRECO_ROMAN] = GameInfoTypes.IMPROVEMENT_LANDMARK_EURO,
    [GameInfoTypes.ARTSTYLE_POLYNESIAN] = GameInfoTypes.IMPROVEMENT_LANDMARK_AMER,
    [GameInfoTypes.ARTSTYLE_BARBARIAN] = GameInfoTypes.IMPROVEMENT_LANDMARK_EURO
}

for row in DB.Query("SELECT UnitType FROM Unit_Builds WHERE BuildType = 'BUILD_LANDMARK'") do
    Archaeologists[GameInfoTypes[row.UnitType]] = true
end

function Jar_LandmarkCreated(iPlayer, iUnit, iUnitType, iX, iY, bDelay, iByPlayer)
    if not Archaeologists[iUnitType] then return end
	if not bDelay then
		if iByPlayer == -1 then
			local pPlot = Map.GetPlot(iX, iY)
			if pPlot and (pPlot:GetImprovementType() == LandmarkID) then
				pPlot:SetImprovementType(ArtToLandmark[Players[unitOwnerId]:GetArtStyleType()])
			end
		end
	end
end
GameEvents.UnitPrekill.Add(Jar_LandmarkCreated)