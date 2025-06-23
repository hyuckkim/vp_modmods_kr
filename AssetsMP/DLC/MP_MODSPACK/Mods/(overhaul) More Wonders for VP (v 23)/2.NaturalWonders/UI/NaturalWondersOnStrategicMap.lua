-- lua fixes civ 5 restriction (not allowing to place more than fixed number of sv icons for Natural Wonders on the map)
-- it adds those icons manually, previously listing all Natural Wonders
-- works only for new Natural Wonders (PseudoNaturalWonders)
-- by @adan_eslavo and @N.Core

include("IconSupport")
include("InstanceManager")

local tFeatures = {}
local bIsPseudoWonder = false

for row in GameInfo.Features() do
	tFeatures[row.ID] = {}
	bIsPseudoWonder = row.PseudoNaturalWonder
	
	-- row.ID == 30 is equivalent of Mt. Everest; every subsequent NW has its icon invisible
	if row.ArtDefineTag and row.ArtDefineTag ~= "" and bIsPseudoWonder == true and row.ID > 30 then
		for subRow in GameInfo.ArtDefine_StrategicView{StrategicViewType=row.ArtDefineTag} do
			tFeatures[row.ID][-1] = subRow.Asset
		end
	end
end
--tFeatures[FeatureTypes.FEATURE_FOREST][TerrainTypes.TERRAIN_PLAINS] = "sv_forest_on_plains.dds"
tFeatures[-1] = {}

local tHexInstances = {}
local tPlotsIndexes = {}
local hexManager = InstanceManager:new("NWHexInstance", "NWAnchor", Controls.NWHexContainer)
		
for i = 0, Map.GetNumPlots()-1, 1 do
	local pPlot = Map.GetPlotByIndex(i)
	tHexInstances[i] = hexManager:GetInstance()
			
	local wx, wy, wz = GridToWorld(pPlot:GetX(), pPlot:GetY())
	tHexInstances[i].NWAnchor:SetWorldPositionVal(wx, wy, 0)
	tHexInstances[i].NWAnchor:SetHide(true)
			
	tHexInstances[i].Feature:SetSizeVal(425, 425)
	tHexInstances[i].FeatureShadow:SetSizeVal(425, 425)
	--tHexInstances[i].Resource:SetSizeVal(148, 148)
	--tHexInstances[i].Resource:SetTextureOffsetVal(40, 40)
				
	-- Features and natural wonders
	if tFeatures[pPlot:GetFeatureType()][-1] ~= nil then
		table.insert(tPlotsIndexes, i)
		featureTexture = tFeatures[pPlot:GetFeatureType()][-1]

		tHexInstances[i].FeatureShadow:SetHide(true)
		tHexInstances[i].FeatureShadow:SetTexture(featureTexture)
		tHexInstances[i].Feature:SetHide(true)
		tHexInstances[i].Feature:SetTexture(featureTexture)
	end
end	

function UpdateNaturalWondersSVIcons()
	for _, index in pairs(tPlotsIndexes) do
		local pPlot = Map.GetPlotByIndex(index)
		local bRevealed = pPlot:IsRevealed(Game.GetActiveTeam(), false)
		local bVisible = pPlot:IsActiveVisible(false)
		
		tHexInstances[index].NWAnchor:SetHide(not bRevealed)
		tHexInstances[index].Feature:SetHide(not bRevealed)
			
		if bVisible then
			tHexInstances[index].Feature:SetAlpha(1)
			tHexInstances[index].FeatureShadow:SetHide(true)
		else	
			tHexInstances[index].Feature:SetAlpha(0.3)
			tHexInstances[index].FeatureShadow:SetHide(not bRevealed)
		end
	end
end
			
function StrategicViewForNaturalWonders(bStrategicView)
    if bStrategicView then
		UpdateNaturalWondersSVIcons()
	else
		for _, index in pairs(tPlotsIndexes) do
			local pPlot = Map.GetPlotByIndex(index)
			tHexInstances[index].NWAnchor:SetHide(true)
			tHexInstances[index].FeatureShadow:SetHide(true)
			tHexInstances[index].Feature:SetHide(true)
		end
	end
end
Events.StrategicViewStateChanged.Add(StrategicViewForNaturalWonders)

function NewNaturalWonderFound(float, integer)
	if InStrategicView() then
		print("NewNaturalWonderFound", float, integer)
		UpdateNaturalWondersSVIcons()
	end
end
Events.NaturalWonderRevealed.Add(NewNaturalWonderFound)

function UnitVisibilityChanged(ePlayer, iUnit, bVisible, bCheckFlag, uBlendTime)
	if InStrategicView() then
		print("UnitVisibilityChanged", ePlayer, iUnit, bVisible, bCheckFlag, uBlendTime)
		UpdateNaturalWondersSVIcons()
	end
end
Events.UnitVisibilityChanged.Add(UnitVisibilityChanged)