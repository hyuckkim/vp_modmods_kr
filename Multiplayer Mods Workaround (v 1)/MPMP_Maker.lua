-- MPMP_Maker
-- Author: Gedemon
-- DateCreated: 31-Jan-14 03:16:29
--------------------------------------------------------------
--[[
	Allow the creation of a MPModspack folder in assets/DLC to copy (and format) activated mods

	usage: 
		- activate all desired mods, launch a new game from the mods menu, and from "MPMP_Maker" context in Firetuner call CreateMP()
		- check MPMPMaker.log for errors (but I need to add a lot more in it, actually it can output "done" even if something goes wrong) after creation
		- quit game (not to main menu, completly !)
		- start civ5 again, launch a new game from the main menu, the modspack should be activated
		- check database.log if the game crashes before the main menu, or if there are errors in the Lua.log
	
	limitations : 
		- you must manually delete the MP_MODSPACK folder in Steam\steamapps\common\sid meier's civilization v\Assets\DLC if you want to use the normal game again
		- a savegame can't know if a modspack is used
		- how to check for same modspack in MP ?
		- what if other DLC are activated/deactivated while the modpack is active ?
		- can't be used with DLL mods without merging both projects (C++ and this lua file as an InGameUIaddin)
		- all mods won't work in MP, changing gameplay could cause massive desync issues if not done with MP in mind

	todo: 
		- create a "desinstall" mod with a copy of all UI files that are loaded in the MPModspack so that they can be removed if that mod is activated (they should override the DLC UI files). That "MPModpack desinstallation" mod would be deleted/recreated each time a MP modspack is created
		- then make sure we are not copying in the DLC folder some files that can't be loaded with mods !
		- create a small additional DLC (optional installation, as this one would require manual desinstallation) to handle automatically the launch of a small game session to configure the MP Modspack when entering the mod's menu
		- the UI...
		- handle DLL mods that may need renaming (see also limitations as a DLL with the mandatory Game function must be loaded)

		- maybe put all frontend custom files in a separate DLC folder, and edit them (no delete/replace) with the content of the modded or original files (still need an uninstall mod for UI files):
		std::ifstream ifs("input.txt", std::ios::binary);
		std::ofstream ofs("output.txt", std::ios::binary);
		ofs << ifs.rdbuf();
--]]

local MPMPMakerModID = "c70dee73-8179-4a19-a3e5-1d931908ff43" -- we don't want to include MPMPMaker in the modspack
local GamePlayFileName = "CIV5Units.xml" -- that's where we write the whole database
--local textFileName = "CIV5Units_Mongol.xml"
local AudioFileName = "Audio2DScriptsExpansion1.xml" -- that's where we write the audio database. (we can't change the structure on those, neither update previous entries, just add new entries)
local AudioDefinesName = "AudioDefinesExpansion1.xml"
local AudioMiscName = "Civ5_Dialog_Adolphus.xml"

--[[local textFileNameList = { --Yes this is awkward, but is the lesser evil  -- that's where we write the text database. (we can't use override for the text files, the localization is handled separately)
	"CIV5Units_Mongol.xml", --breaks the pattern, but I want to keep this consistent with past versions
	"Civ5_Dialog_Adolphus.xml",
	"Civ5_Dialog_Alexander.xml",
	"Civ5_Dialog_alMansur.xml",
	"Civ5_Dialog_Ashurbanipal.xml",
	"Civ5_Dialog_Askia.xml",
	"Civ5_Dialog_Attila.xml",
	"Civ5_Dialog_Augustus.xml",
	"Civ5_Dialog_Bismarck.xml",
	"Civ5_Dialog_Boudicca.xml"
}--]] --Civ 5 needs everything in one folder or it doesn't work apparently =(

local textFileName="CIV5Units_Mongol.xml"

local langList = {
	"en_US",
	"DE_DE",
	"ES_ES",
	"FR_FR",
	"IT_IT",
	"JA_JP",
	"KO_KR",
	"PL_PL",
	"RU_RU",
	"ZH_Hant_HK"
}

-- Table that are already filled when the XMLSerializer is called
local tableToIgnore = {
	["ApplicationInfo"] = true,
	["ScannedFiles"] = true,
	["DownloadableContent"] = true,
	["MapScriptOptionPossibleValues"] = true,
	["MapScriptOptions"] = true,
	["MapScriptRequiredDLC"] = true,
	["MapScripts"] = true,
	["Map_Folders"] = true,
	["Map_Sizes"] = true,
	["Maps"] = true,
	["MemoryInfos"] = true,
}

-- Table that are already defined but need to be (re)filled with the mods data
local structureToIgnore = { 
	["ArtDefine_LandmarkTypes"] = true,
	["ArtDefine_Landmarks"] = true,
	["ArtDefine_StrategicView"] = true,
	["ArtDefine_UnitInfoMemberInfos"] = true,
	["ArtDefine_UnitInfos"] = true,
	["ArtDefine_UnitMemberCombatWeapons"] = true,
	["ArtDefine_UnitMemberCombats"] = true,
	["ArtDefine_UnitMemberInfos"] = true,
	["Audio_2DSounds"] = true,
	["Audio_3DSounds"] = true,
	["Audio_ScriptTypes"] = true,
	["Audio_SoundLoadTypes"] = true,
	["Audio_SoundScapeElementScripts"] = true,
	["Audio_SoundScapeElements"] = true,
	["Audio_SoundScapes"] = true,
	["Audio_SoundTypes"] = true,
	["Audio_Sounds"] = true,
	["Audio_SpeakerChannels"] = true,
}

local audioTableListe = {
	"Audio_2DSounds",
}

local audioTableMisc= { -- KLUDGE: These parameters are rarely used by modmakers and I'm not dealing with them, so still doing in the old fashion. It is probably broken.
	"Audio_3DSounds",
	"Audio_SoundScapeElementScripts",
	"Audio_SoundScapeElements",
	"Audio_SoundScapes",
}

local audioTableDefines = {
	"Audio_Sounds"
}

function CreateMP()

	print2 ("Deleting previous ModPack if exist...")
	Game.DeleteMPMP()
	
	print2 ("Creating New ModPack folder...")
	Game.CreateMPMP()
	
	print2 ("Copying Activated Mods...")
	CopyActivatedMods()
	
	print2 ("Getting the Database...")
	CopyFullDatabase()

	print2 ("Getting Texts...")
	CopyTextDatabase(textFileName,langList)

	print2 ("Getting Audio Tables...")
	CopyAudioDatabase()
	
	print2 ("Getting Audio Defines...")
	CopyAudioDefines()
	--ContextPtr:LookUpControl("/InGame/TopPanel/TopPanelInfoStack"):SetHide( false )
	
	print2 ("Getting Audio Misc...")
	CopyAudioMisc()
	
	print2 ("Done!")

end

function CleanQuery(str) --Cleans strings inside tags of things like < >. Should be called whenever something is written YES I KNOW THIS SUCKS
	local outStr=string.gsub(str,"<","&lt;")
	outStr=string.gsub(outStr,">","&gt;")
	return outStr
end

function CleanWrite(GamePlayFileName, str, boolVar) --Does some additional processing of strings before writing them, because the database does not always match the xml exactly. Intended to replace Game.WriteMPMP usage elsewhere. May do more elaborate things in future if necessary

	--local outStr=string.gsub(str,"<","&lt;") --this is now done in CleanQuery
	--outStr=string.gsub(outStr,">","&gt;")
	outStr=str
	Game.WriteMPMP( GamePlayFileName, outStr, boolVar)
end

function GetTablesStructure(tableName)
	
	local sTableStructure = "	<Table name=\"".. tostring(tableName) .."\">\n"
	local query = "PRAGMA table_info(".. tostring(tableName) ..");"
	--local query = "SELECT sql FROM (SELECT * FROM sqlite_master UNION ALL SELECT * FROM sqlite_temp_master) WHERE tbl_name =  '".. tostring(tableName) .."' AND type!='meta' AND sql NOT NULL AND name NOT LIKE 'sqlite_%' ORDER BY substr(type,2,1), name);"
	
	local structure = DB.CreateQuery(query)	
	local bHasPrimaryKey = false
	for line in structure() do	

		-- prepare for Crude Formatting(tm)
		local bAutoIncrement = false
		local bUnique = false
		local bIsPrimaryKey = (line.pk > 0)
		local bNotNull = (line.notnull > 0)
		local sDefaultValue = tostring(line.dflt_value)
		sDefaultValue = string.gsub(sDefaultValue, "'", "")
		if sDefaultValue:len() > 0 and sDefaultValue ~= "nil" then sDefaultValue = "default=\"".. sDefaultValue .."\"" else sDefaultValue = "" end
		if bIsPrimaryKey then bHasPrimaryKey = true end
		if (line.name == "ID" and bIsPrimaryKey ) then bAutoIncrement = true end
		if (line.name == "Type" and bHasPrimaryKey ) then bUnique = true end
		
		-- Write the line...
		local sColumn = "		<Column name=\"".. tostring(line.name).."\" type=\"".. tostring(line.type).."\" "
		if bIsPrimaryKey then sColumn = sColumn .. " primarykey=\"true\"" end
		if bAutoIncrement then sColumn = sColumn .. " autoincrement=\"true\"" end
		if bUnique then sColumn = sColumn .. " unique=\"true\"" end
		if bNotNull then sColumn = sColumn .. " notnull=\"true\"" end
		sColumn = sColumn .. " " .. sDefaultValue
		sTableStructure = sTableStructure .. sColumn .. "/>\n"
	end	

	return sTableStructure .. "	</Table> \n"
end

function CopyActivatedMods()
	local activatedMods = Modding.GetActivatedMods()
	local inGameOverridden=0;
	local cityViewOverridden=0;
	local leaderHeadRootOverridden=0;
	for i,v in ipairs(activatedMods) do
		if v.ID ~= MPMPMakerModID then -- but not this mod !
			local name = Modding.GetModProperty(v.ID, v.Version, "Name");	
			print2 ("Copying " .. name)
			local Banned="CIV5AICityStrategies|CIV5AIEconomicStrategies|CIV5AIGrandStrategies|CIV5AIMilitaryStrategies|CIV5CitySpecializations|CIV5TacticalMoves|CIV5Attitudes|CIV5Calendars|CIV5CitySizes|CIV5Concepts|CIV5Contacts|CIV5DenialInfos|CIV5Domains|CIV5InvisibleInfos|CIV5MajorCivApproachTypes|CIV5MemoryInfos|CIV5MinorCivApproachTypes|CIV5MinorCivTraits|CIV5Months|CIV5Seasons|CIV5UnitAIInfos|CIV5UnitCombatInfos|CIV5BuildingClasses|CIV5Buildings|CIV5Civilizations|CIV5MinorCivilizations|CIV5Regions|CIV5Traits|Civ5Diplomacy_Responses|CIV5ArtStyleTypes|CIV5Climates|CIV5CultureLevels|CIV5Cursors|CIV5EmphasizeInfos|CIV5Eras|CIV5Flavors|CIV5GameOptions|CIV5GameSpeeds|CIV5GoodyHuts|CIV5HandicapInfos|CIV5HurryInfos|CIV5IconFontMapping|CIV5IconTextureAtlases|CIV5MultiplayerOptions|CIV5PlayerOptions|CIV5Policies|CIV5PolicyBranchTypes|CIV5Processes|CIV5Projects|CIV5Replays|CIV5SeaLevels|CIV5SmallAwards|CIV5Specialists|CIV5Trades|CIV5TurnTimers|CIV5Victories|CIV5Votes|CIV5VoteSources|CIV5Worlds|CIV5Colors|CIV5InterfaceModes|CIV5PlayerColors|CIV5LeaderTables|CIV5Routes|CIV5HintText|CIV5ModdingText|CIV5_Victory|CIV5Technologies|CIV5Features|CIV5Improvements|CIV5ResourceClasses|CIV5Resources|CIV5Terrains|CIV5Yields|Civ5AnimationCategories|Civ5AnimationPaths|CIV5Automates|CIV5Builds|CIV5Commands|CIV5Controls|Civ5EntityEvents|CIV5Missions|CIV5MultiUnitFormations|CIV5SpecialUnits|CIV5UnitClasses|CIV5UnitMovementRates|CIV5UnitPromotions|CIV5Units|"						
			-- pass modID and version, parse the Mods folder in C++ for .modinfo files to find the correct folder even if it was not conventionnaly named...
			local iCopied = Game.CopyModDataToMPMP(name, v.ID, tostring(v.Version),Banned) --returns 0 if failure, 1000 if success, 1xyz if UI override has occurred x=1 for InGame.lua, y=1 for CityView.lua, z=1 for LeaderHeadRoot.lua. if x, y, or z is 2, then it was overridden more than once. It's stupid but only safe to pass bool and int into lua. This is megassa hard-coded, but good enough...
			if not iCopied then
				error ("Failed! Couldn't find folder for mod: " .. name)
			end
			iCopied=iCopied-1000;
			local tempVal=math.floor(iCopied/100);
			inGameOverridden=inGameOverridden+tempVal;
			iCopied=iCopied-tempVal;
			if tempVal>0 then
				print2 ("InGame.lua has been overwritten!")
				if inGameOverridden>1 then
					print2 ("InGame.lua has been overwritten by a mod more than once. This may cause compatibility issues.")
				end
			end
			local tempVal=math.floor(iCopied/10);
			cityViewOverridden=cityViewOverridden+tempVal;
			iCopied=iCopied-tempVal;
			if tempVal>0 then
				print2 ("CityView.lua has been overwritten! If you are using Enhanced UI, this WILL cause errors.")
				if cityViewOverridden>1 then
					print2 ("CityView.lua has been overwritten by a mod more than once. This may cause compatibility issues.")
				end
			end
			local tempVal=iCopied;
			leaderHeadRootOverridden=leaderHeadRootOverridden+iCopied;
			--iCopied=0;
			if tempVal>0 then
				print2 ("LeaderHeadRoot.lua has been overwritten! If you are using Enhanced UI, this WILL cause errors.")
				if leaderHeadRootOverridden>1 then
					print2 ("LeaderHeadRoot.lua has been overwritten by a mod more than once. This may cause compatibility issues.")
				end
			end
		end
	end

	for addin in Modding.GetActivatedModEntryPoints("InGameUIAddin") do
		if addin.ModID ~= MPMPMakerModID then
			local addinFile = Modding.GetEvaluatedFilePath(addin.ModID, addin.Version, addin.File)
			local addinPath = addinFile.EvaluatedPath
			local filename = Path.GetFileNameWithoutExtension(addinPath)
			print2 ("Adding " .. filename .. " to InGame.lua...")
			Game.AddUIAddinToMPMP("InGame.lua", filename)		
		end
	end	

	for addin in Modding.GetActivatedModEntryPoints("CityViewUIAddin") do
		if addin.ModID ~= MPMPMakerModID then
			local addinFile = Modding.GetEvaluatedFilePath(addin.ModID, addin.Version, addin.File)
			local addinPath = addinFile.EvaluatedPath
			local filename = Path.GetFileNameWithoutExtension(addinPath)
			print2 ("Adding " .. filename .. " to InGame.lua...")
			Game.AddUIAddinToMPMP("CityView.lua", filename)	
		end
	end	

	for addin in Modding.GetActivatedModEntryPoints("DiplomacyUIAddin") do
		if addin.ModID ~= MPMPMakerModID then
			local addinFile = Modding.GetEvaluatedFilePath(addin.ModID, addin.Version, addin.File)
			local addinPath = addinFile.EvaluatedPath
			local filename = Path.GetFileNameWithoutExtension(addinPath)
			print2 ("Adding " .. filename .. " to InGame.lua...")
			Game.AddUIAddinToMPMP("LeaderHeadRoot.lua", filename)		
		end
	end
end

function DeleteMP()
	print2 ("Deleting ModPack if exist...")
	Game.DeleteMPMP()
end

function CopyAudioDatabase()
	local sDatabase = ""
	CleanWrite( AudioFileName, "<?xml version=\"1.0\" encoding=\"utf-8\"?> \n<!-- generated by MP Modpacks Maker (Gedemon) -->\n<Script2DFile> \n", true ) -- replace file

	local tables = DB.CreateQuery("SELECT name FROM sqlite_master WHERE type='table' ORDER BY name;")	
	for i, tableName in ipairs(audioTableListe) do	
		print2 ("Copying: " .. tableName)
		local query = "PRAGMA table_info(".. tostring(tableName) ..");"
		local structure = DB.CreateQuery(query)
		
		if tostring(tableName)=="Audio_2DSounds" then
			sDatabase = "	<Script2DSounds>"
		else
			sDatabase = "	<".. tostring(tableName) ..">"
		end
		CleanWrite( AudioFileName, sDatabase, false)

		local columns = {}
		for c in structure() do			
			table.insert(columns, {Name = c.name})
		end
		print2 ("Do You Crash here?")
		local query = "SELECT * FROM " .. tableName ..";"	
		for result in DB.Query(query) do
			sDatabase = "		<Script2DSound> \n"
			for i, col in pairs(columns) do				
				local tagStr = col.Name
				local valueStr = tostring(result[col.Name])
				local boolDoThis = true
				-- KLUDGE: Real way to do this would be to query the possible row titles of Script2DSound and string match, but way too much work
				if tagStr=="MaxVolume" then
					tagStr="iMaxVolume"
				elseif tagStr=="MinVolume" then
					tagStr="iMinVolume"
				elseif tagStr=="IsMusic" then
					tagStr="bIsMusic"
				elseif tagStr=="Priority" then
					tagStr="iPriority"
					--boolDoThis=false
				elseif not ((tagStr=="SoundType") or (tagStr=="SoundID") or (tagStr=="ScriptID")) then
					boolDoThis=false
				end
				if valueStr:len() > 0 and valueStr ~= "nil" and boolDoThis then sDatabase = sDatabase .. "			<".. tagStr ..">".. CleanQuery(valueStr) .."</".. tagStr .."> \n" end
			end
			sDatabase = sDatabase .. "		</Script2DSound>"
			CleanWrite( AudioFileName, sDatabase, false)
		end

		if tostring(tableName)=="Audio_2DSounds" then
			sDatabase = "	</Script2DSounds>"
		else
			sDatabase = "	</".. tostring(tableName) ..">"
		end
		CleanWrite( AudioFileName, sDatabase, false)
		sDatabase = ""
	end
	CleanWrite( AudioFileName, "</Script2DFile> \n", false)

end

function CopyAudioDefines()
	local sDatabase = ""
	CleanWrite( AudioDefinesName, "<?xml version=\"1.0\" encoding=\"utf-8\"?> \n<!-- generated by MP Modpacks Maker (Gedemon) -->\n<AudioDefinesFile> \n", true ) -- replace file

	local tables = DB.CreateQuery("SELECT name FROM sqlite_master WHERE type='table' ORDER BY name;")	
	for i, tableName in ipairs(audioTableDefines) do	
		print2 ("Copying: " .. tableName)
		local query = "PRAGMA table_info(".. tostring(tableName) ..");"
		local structure = DB.CreateQuery(query)
		
		if tostring(tableName)=="Audio_Sounds" then
			sDatabase = "	<SoundDatas>"
		else
			sDatabase = "	<".. tostring(tableName) ..">"
		end
		CleanWrite( AudioDefinesName, sDatabase, false)

		local columns = {}
		for c in structure() do			
			table.insert(columns, {Name = c.name})
		end
		print2 ("Do You Crash here?")
		local query = "SELECT * FROM " .. tableName ..";"	
		for result in DB.Query(query) do
			sDatabase = "		<SoundData> \n"
			for i, col in pairs(columns) do				
				local tagStr = col.Name
				local valueStr = tostring(result[col.Name])
				local boolDoThis = true
				-- KLUDGE: Real way to do this would be to query the possible row titles of Script2DSound and string match, but way too much work
				if tagStr=="DontCache" then
					tagStr="bDontCache"
				elseif tagStr=="OnlyLoadOneVariationEachTime" then
					tagStr="bOnlyLoadOneVariationEachTime"
				elseif tagStr=="FileName" then
					tagStr="Filename"
				elseif tagStr=="LoadType" then
					valueStr="STREAMED" --Other types, like DynamicResident, are no longer supported
				elseif not ((tagStr=="SoundID") or (tagStr=="LoadType")) then
					boolDoThis=false
				end
				if valueStr:len() > 0 and valueStr ~= "nil" and boolDoThis then sDatabase = sDatabase .. "			<".. tagStr ..">".. CleanQuery(valueStr) .."</".. tagStr .."> \n" end
			end
			sDatabase = sDatabase .. "		</SoundData>"
			CleanWrite( AudioDefinesName, sDatabase, false)
		end

		if tostring(tableName)=="Audio_Sounds" then
			sDatabase = "	</SoundDatas>"
		else
			sDatabase = "	</".. tostring(tableName) ..">"
		end
		CleanWrite( AudioDefinesName, sDatabase, false)
		sDatabase = ""
	end
	CleanWrite( AudioDefinesName, "</AudioDefinesFile> \n", false)

end

function CopyAudioMisc()
	local sDatabase = ""
	CleanWrite( AudioMiscName, "<?xml version=\"1.0\" encoding=\"utf-8\"?> \n<!-- generated by MP Modpacks Maker (Gedemon) -->\n<GameData> \n", true ) -- replace file

	local tables = DB.CreateQuery("SELECT name FROM sqlite_master WHERE type='table' ORDER BY name;")	
	for i, tableName in ipairs(audioTableMisc) do	
		print2 ("Copying: " .. tableName)
		local query = "PRAGMA table_info(".. tostring(tableName) ..");"
		local structure = DB.CreateQuery(query)
		
		sDatabase = "	<".. tostring(tableName) ..">"
		CleanWrite( AudioMiscName, sDatabase, false)

		local columns = {}
		for c in structure() do			
			table.insert(columns, {Name = c.name})
		end
		print2 ("Do You Crash here?")
		local query = "SELECT * FROM " .. tableName ..";"	
		for result in DB.Query(query) do
			sDatabase = "		<Row> \n"
			for i, col in pairs(columns) do				
				local tagStr = ""
				local valueStr = tostring(result[col.Name])
				if valueStr:len() > 0 and valueStr ~= "nil" then sDatabase = sDatabase .. "			<".. tagStr ..">".. CleanQuery(valueStr) .."</".. tagStr .."> \n" end
			end
			sDatabase = sDatabase .. "		</Row>"
			CleanWrite( AudioMiscName, sDatabase, false)
		end

		sDatabase = "	</".. tostring(tableName) ..">"
		CleanWrite( AudioMiscName, sDatabase, false)
		sDatabase = ""
	end
	CleanWrite( AudioMiscName, "</GameData> \n", false)

end

function CopyTextDatabase(fileName,langList)
    CleanWrite(fileName, "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<!-- generated by MP Modpacks Maker (Gedemon) -->\n<GameData>\n", true ) --Create file
    for i,langName in pairs(langList) do
        print2 ("Copying: Language_" .. langName)
        local sDatabase = ""	
        local query = "SELECT * FROM Language_" .. langName .. ";"
        local textStruct=DB.Query(query)
        local hasWritten=false --this is stupid, but safest
        CleanWrite(fileName,"	<Language_" .. langName .. ">",false)
        for result in textStruct do
            if not (string.find(tostring(result.Tag), "TURN_REMINDER_EMAIL")) then
                hasWritten=true
                sDatabase = "		<Replace Tag=\"".. tostring(result.Tag) .."\"> \n"
                sDatabase = sDatabase .. "			<Text>\n				".. CleanQuery(tostring(result.Text)) .."\n			</Text>\n"
                if result.Gender then
                    sDatabase = sDatabase .. "			<Gender>\n				".. CleanQuery(tostring(result.Gender)) .."\n			</Gender>\n"
                end
                if result.Plurality then
                    sDatabase = sDatabase .. "			<Plurality>\n				".. CleanQuery(tostring(result.Plurality)) .."\n			</Plurality>\n"
                end
                sDatabase = sDatabase .. "		</Replace>"
                CleanWrite( fileName, sDatabase, false)
            end
        end
        if not hasWritten then --is struct empty?
            print ("WARNING: " .. langName .. " is not a loaded language database!")
        end
        CleanWrite( fileName, "	</Language_" .. langName .. ">", false)
    end
    CleanWrite(fileName,"\n</GameData>",false)
end

function CopyFullDatabase()
	local sDatabase = ""
	CleanWrite( GamePlayFileName, "<?xml version=\"1.0\" encoding=\"utf-8\"?> \n<!-- generated by MP Modpacks Maker (Gedemon) -->\n<GameData> \n", true ) -- Open file

	local tables = DB.CreateQuery("SELECT name FROM sqlite_master WHERE type='table' ORDER BY name;")	
	for t in tables() do	
		if not (string.find(t.name, "sqlite") or tableToIgnore[t.name] ) then
			print2 ("Copying: " .. t.name)
			local query = "PRAGMA table_info(".. tostring(t.name) ..");"
			local structure = DB.CreateQuery(query)

			if not (structureToIgnore[t.name] ) then
				sDatabase = GetTablesStructure(t.name)
			end
			sDatabase = sDatabase .. "	<".. CleanQuery(tostring(t.name)) ..">\n		<Delete />\n"		
			WriteToGamePlayFile(sDatabase)

			local columns = {}
			for c in structure() do			
				table.insert(columns, {Name = c.name})
			end

			local query = "SELECT * FROM " .. t.name ..";"	
			for result in DB.Query(query) do
				sDatabase = "		<Row> \n"
				for i, col in pairs(columns) do				
					local tagStr = ""
					local valueStr = tostring(result[col.Name])			
					if valueStr:len() > 0 and valueStr ~= "nil" then sDatabase = sDatabase .. "			<".. col.Name ..">".. CleanQuery(valueStr) .."</".. col.Name .."> \n" end
				end
				sDatabase = sDatabase .. "		</Row>"
				WriteToGamePlayFile(sDatabase)
			end

			sDatabase = "	</".. tostring(t.name) .."> \n"
			WriteToGamePlayFile(sDatabase)
			sDatabase = ""
		end
	end
	sDatabase = sDatabase .. "</GameData> \n"
	WriteToGamePlayFile(sDatabase)

end

function WriteToGamePlayFile(str)
	CleanWrite( GamePlayFileName, str, false ) -- Append file
end

function print2(str)
	--Events.GameplayAlertMessage(str)
	--ContextPtr:LookUpControl("/InGame/TopPanel/CurrentTurn"):SetText( str )
	print(str)
end
