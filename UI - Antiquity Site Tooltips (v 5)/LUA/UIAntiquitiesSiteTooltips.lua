print("This is the 'UI - Antiquities Site Tooltips' mod script.")

--
-- There are two key pieces of information about a dig site - the primary civilization involved and the era
--
-- An archaeologist has a 50% (iPercentBase) of being right about each, so a 25% chance of being totally correct about the site
-- a 50% chance of being partially correct and a 25% chance of being completely wrong.
--
-- The percentage chance of being correct for each key piece of information is increased as follows
--  * involving our own civilization +15% (iPercentCiv), as there may be something in the archives
--  * on our own land +10% (iPercentLand), as there may be people around with "local knowledge"
--  * for each similar site we have dug +5% (iPercentPrev), as we should be able to be able to identify common features
-- the maximum chance of being correct is capped at 95% (ie there is always a chance of being wrong)
--
-- So for a site involving our civilization within our borders there is a 56% chance of being totally correct, a 6% chance of being totally wrong
-- and a 38% chance of being partially correct, if we had dug 4 similiar sites, the figures would be 90%, 9.75% and 0.25% respectively
--
-- If the archaeologist is wrong about the civilization, they will guess one (which could be the correct civilization!)
-- If the archaeologist is wrong about the era, they will guess either the era before or the era after
--
-- There is a remote (5%) chance that the archaeologist will be wrong about the site type (battlefield, camp, ruins, city)
--
-- Once an archaeologist has decided what the site is they will never change their opinion, although another archaeologist 
-- may hold different views when they visit the site.  Ultimately the only way to discover what is down there is to dig it up!
--
-- If an archaeologist is the active unit, the report for the site will be their views on it,
-- unless they haven't visited the site, in which case the view of the last archaeologist to visit will be reported
--

local iPercentBase = 50
local iPercentCiv  = 15
local iPercentLand = 10
local iPercentPrev = 5

local iArchaeologist = GameInfoTypes.UNIT_ARCHAEOLOGIST

local playersPlotCache = nil
local playersUnitCache = nil

local modDb = nil
local modDbTable  = "AntiquitySites"
local modDbCreate = 'CREATE TABLE IF NOT EXISTS ' ..
                    'AntiquitySites("Player" INTEGER NOT NULL, "Unit" INTEGER NOT NULL, "Plot" INTEGER NOT NULL, ' ..
                                   '"ActualType" INTEGER NOT NULL, "ActualPlayer1" INTEGER NOT NULL, "ActualPlayer2" INTEGER NOT NULL, "ActualEra" INTEGER NOT NULL, ' ..
                                   '"SiteType" INTEGER NOT NULL, "SitePlayer1" INTEGER NOT NULL, "SitePlayer2" INTEGER NOT NULL, "SiteEra" INTEGER NOT NULL' ..
                                   ')'
local modDbSelect = "SELECT Player, Unit, Plot, ActualType, ActualPlayer1, ActualPlayer2, ActualEra, SiteType, SitePlayer1, SitePlayer2, SiteEra FROM AntiquitySites"
local modDbInsert = "INSERT INTO AntiquitySites(Player, Unit, Plot, ActualType, ActualPlayer1, ActualPlayer2, ActualEra, SiteType, SitePlayer1, SitePlayer2, SiteEra) VALUES(%i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i)"
local modDbDelete = "DELETE FROM AntiquitySites WHERE Player=%i AND Unit=%i AND Plot=%i"
local modDbClear  = "DELETE FROM AntiquitySites WHERE Player=%i AND Unit=%i"

-- Initialise the database sub-system
function DbmOpen(sStmt)
  -- print(string.format("DbmOpen(%s)", sStmt))
  local bInit = true
  if (modDb == nil) then
    modDb = Modding.OpenSaveData()

    if (sStmt ~= nil) then
      bInit = DbmExec(sStmt)
    end
  end

  return (bInit and (modDb ~= nil))
end

-- Execute a SQL statement
function DbmExec(sStmt)
  -- print(string.format("DbmExec(%s)", sStmt))
  local rows = DbmRows(sStmt)

  if (rows ~= nil) then
    for _ in rows do end

    return true
  end

  return false
end

-- Execute an SQL query
function DbmRows(sQuery)
  -- print(string.format("DbmRows(%s)", sQuery))
  if (modDb ~= nil and sQuery ~= nil) then
    return modDb.Query(sQuery)
  end

  return nil
end

function LoadCache()
  DbmOpen(modDbCreate)

  playersPlotCache = {}
  playersUnitCache = {}

  for row in DbmRows(modDbSelect) do
    local iPlayer = row.Player
	local iUnit = row.Unit
	local iPlot = row.Plot
	-- print(string.format("cache: %i, %i, %i", iPlayer, iUnit, iPlot))

	local plotCache = {
	    ActualType    = row.ActualType,
	    ActualPlayer1 = row.ActualPlayer1,
	    ActualPlayer2 = row.ActualPlayer2,
	    ActualEra     = row.ActualEra,
	    SiteType      = row.SiteType,
	    SitePlayer1   = row.SitePlayer1,
	    SitePlayer2   = row.SitePlayer2,
	    SiteEra       = row.SiteEra
	  }

    if (iUnit == -1) then
      if (playersPlotCache[iPlayer] == nil) then
        playersPlotCache[iPlayer] = {}
      end

	  playersPlotCache[iPlayer][iPlot] = plotCache
	else
      if (playersUnitCache[iPlayer] == nil) then
        playersUnitCache[iPlayer] = {}
      end

      if (playersUnitCache[iPlayer][iUnit] == nil) then
        playersUnitCache[iPlayer][iUnit] = {}
      end

	  playersUnitCache[iPlayer][iUnit][iPlot] = plotCache
	end
  end
end

function GetPlayerPlotCache(iPlayer, iPlot)
  -- print(string.format("GetPlayerPlotCache(%i, %i)", iPlayer, iPlot))

  if (playersPlotCache == nil) then
    LoadCache()
  end

  if (playersPlotCache[iPlayer] == nil) then
    playersPlotCache[iPlayer] = {}
  end

  return playersPlotCache[iPlayer][iPlot]
end

function GetPlayerUnitCache(iPlayer, iUnit, iPlot)
  -- print(string.format("GetPlayerUnitCache(%i, %i, %i)", iPlayer, iUnit, iPlot))

  if (playersUnitCache == nil) then
    LoadCache()
  end

  if (playersUnitCache[iPlayer] == nil) then
    playersUnitCache[iPlayer] = {}
  end

  if (playersUnitCache[iPlayer][iUnit] == nil) then
    playersUnitCache[iPlayer][iUnit] = {}
  end

  return playersUnitCache[iPlayer][iUnit][iPlot]
end

function UpdateCache(iPlayer, iUnit, iPlot, plotCache)
  if (playersPlotCache[iPlayer] == nil) then
    playersPlotCache[iPlayer] = {}
  end

  playersPlotCache[iPlayer][iPlot] = plotCache
  playersUnitCache[iPlayer][iUnit][iPlot] = plotCache

  DbmExec(string.format(modDbDelete, iPlayer, -1, iPlot))
  DbmExec(string.format(modDbDelete, iPlayer, iUnit, iPlot))

  DbmExec(string.format(modDbInsert, iPlayer, -1, iPlot, plotCache.ActualType, plotCache.ActualPlayer1, plotCache.ActualPlayer2, plotCache.ActualEra, plotCache.SiteType, plotCache.SitePlayer1, plotCache.SitePlayer2, plotCache.SiteEra))
  DbmExec(string.format(modDbInsert, iPlayer, iUnit, iPlot, plotCache.ActualType, plotCache.ActualPlayer1, plotCache.ActualPlayer2, plotCache.ActualEra, plotCache.SiteType, plotCache.SitePlayer1, plotCache.SitePlayer2, plotCache.SiteEra))
end

function GetCachedSiteData(iPlayer, iUnit, pPlot)
  local iPlot = pPlot:GetPlotIndex()
  local plotCache = nil

  local pUnit = UI.GetHeadSelectedUnit()
  if (pUnit and pUnit:GetUnitType() == iArchaeologist) then
    -- There is an Archaeologist selected so use what they think (if anything)
    plotCache = GetPlayerUnitCache(iPlayer, pUnit:GetID(), iPlot)
  end

  if (plotCache == nil) then
    if (iUnit == -1) then
      plotCache = GetPlayerPlotCache(iPlayer, iPlot)
    else
      -- There is an Archaeologist present on the plot, have they been here before?
	  plotCache = GetPlayerUnitCache(iPlayer, iUnit, iPlot)

	  if (plotCache == nil) then
        -- The Archaeologist has NOT been here before, so work out what they think the site is
        local iActualType    = pPlot:GetArchaeologyArtifactType()
        local iActualPlayer1 = pPlot:GetArchaeologyArtifactPlayer1()
        local iActualPlayer2 = pPlot:GetArchaeologyArtifactPlayer2()
        local iActualEra     = pPlot:GetArchaeologyArtifactEra()

	    local iBaseChance = iPercentBase
	    if (iActualPlayer1 == iPlayer or iActualPlayer2 == iPlayer) then
	      -- We were involved, so it may be in our written records
	      iBaseChance = iBaseChance + iPercentCiv
	    end
	    if (pPlot:GetOwner() == iPlayer) then
	      -- On our land, so there may be locals with knowledge
	      iBaseChance = iBaseChance + iPercentLand
	    end

	    -- Increase the chance for every such site we have already dug
        for _, v in ipairs(Players[iPlayer]:GetGreatWorks(GameInfo.GreatWorkClasses.GREAT_WORK_ARTIFACT.ID)) do
          if (v.Era == iActualEra and (v.Creator == iActualPlayer1 or v.Creator == iActualPlayer2)) then
	        iBaseChance = iBaseChance + iPercentPrev
		  end
        end

	    iBaseChance = math.min(95, iBaseChance)
	    -- print(string.format("iBaseChance = %i", iBaseChance))

	    plotCache = {
	      ActualType    = iActualType,
	      ActualPlayer1 = iActualPlayer1,
	      ActualPlayer2 = iActualPlayer2,
	      ActualEra     = iActualEra,
	      SiteType      = GetPredictedSiteType(iBaseChance, iActualType),
	      SitePlayer1   = GetPredictedSitePlayer(iBaseChance, iActualPlayer1),
	      SitePlayer2   = GetPredictedSitePlayer(iBaseChance, iActualPlayer2),
	      SiteEra       = GetPredictedSiteEra(iBaseChance, iActualEra, Players[iPlayer]:GetCurrentEra())
	    }

        UpdateCache(iPlayer, iUnit, iPlot, plotCache)
	  end
    end
  end

  if (plotCache == nil) then
    return -1, -1, -1
  end

  return plotCache.SiteType, plotCache.SitePlayer1, plotCache.SiteEra
end

function GetPredictedSiteType(iBaseChance, iActualType)
  if (math.random(1, 100) > 95) then
    -- A really bad mistake!
	return math.random(1, GameInfo.GreatWorkArtifactClasses.ARTIFACT_WRITING.ID) -- EVIL!!! Why is there no enum for these???
  end

  return iActualType
end

function GetPredictedSitePlayer(iBaseChance, iActualPlayer)
  if (iActualPlayer ~= -1 and math.random(1, 100) > iBaseChance) then
    repeat
      if (iActualPlayer < GameDefines.MAX_MAJOR_CIVS) then
	    iActualPlayer = math.random(0, GameDefines.MAX_MAJOR_CIVS-1)
	  else
	    iActualPlayer = math.random(GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS)
	  end
	until (Players[iActualPlayer]:IsEverAlive())
  end

  return iActualPlayer
end

function GetPredictedSiteEra(iBaseChance, iActualEra, iCurrentEra)
  if (math.random(1, 100) > iBaseChance) then
    if (iActualEra > 0 and math.random(1, 100) > 50) then
      iActualEra = iActualEra - 1
	else
	  if (iActualEra == iCurrentEra) then
        iActualEra = iActualEra - 1
	  else
        iActualEra = iActualEra + 1
	  end
	end
  end

  return iActualEra
end

function GetArchaeologistOnPlot(iPlayer, pPlot)
  for i = 0, pPlot:GetNumUnits()-1, 1 do
    local pUnit = pPlot:GetUnit(i)

	if (pUnit:GetUnitType() == iArchaeologist and pUnit:GetOwner() == iPlayer) then
	  return pUnit:GetID()
	end
  end

  return -1
end

function OnGetAntiquitiesTooltip(pPlot, bLongForm, iTeam, iResource, response)
  if (iResource == GameInfoTypes.RESOURCE_ARTIFACTS or iResource == GameInfoTypes.RESOURCE_HIDDEN_ARTIFACTS) then
    local iPlayer = Game.GetActivePlayer()
	local iUnit = GetArchaeologistOnPlot(iPlayer, pPlot)

    local iSiteType, iSitePlayer, iSiteEra = GetCachedSiteData(iPlayer, iUnit, pPlot)

    if (iSiteType ~= -1) then
  	  response.Tip = Locale.ConvertTextKey(string.format("TXT_KEY_ARCH_SITE_TYPE_%i", iSiteType), Players[iSitePlayer]:GetCivilizationAdjectiveKey(), GameInfo.Eras[iSiteEra].ShortDescription)
   end
  end
end
LuaEvents.GetAntiquitiesTooltip.Add(OnGetAntiquitiesTooltip)

-- When an archaeologist is consumed, clear their entries from the cache (requires the modded DLL event)
function OnUnitPrekill(iPlayer, iUnit, iUnitType, iX, iY, bDelay, iByPlayer)
  if (iUnitType == iArchaeologist) then
    DbmExec(string.format(modDbClear, iPlayer, iUnit))
	GetPlayerUnitCache(iPlayer, iUnit, 0)
	playersUnitCache[iPlayer][iUnit] = {}
  end
end
GameEvents.UnitPrekill.Add(OnUnitPrekill)
