-- Ynaem
-- Author: Gedemon
-- DateCreated: 11/3/2010
--------------------------------------------------------------

--print ("---- Loading YnAEMP defines -----")

-- Get YnAEMP related mods
defaultCSModID = "53da86d6-4a0d-4f92-a489-4d1a7fb7cd30"
madeiraCSModID = "9f6d56dd-d653-4c8a-b3a7-4a30582c86c2"
extendedCSModID = "77214b67-d97a-4359-bfe6-b534905528f1"
dynamicModID = "97837c72-d198-49d2-accd-31101cfc048a"

-- Used to find YnAEMP mod files (basically : maps files)
YnaemModId = "36e88483-48fe-4545-b85f-bafc50dde315"
YnaemModVersion = Modding.GetActivatedModVersion(YnaemModId)

g_defaultCS = 0
g_madeiraCS = 0
g_extendedCS = 0
g_dynamicCS = 0
g_dynamicMod = false
g_bBadCS = false

local unsortedInstalledMods = Modding.GetInstalledMods()
for key, modInfo in pairs(unsortedInstalledMods) do
	for k, v in pairs(modInfo) do
		if modInfo.Enabled then
			--print (k)
			if modInfo.ID == defaultCSModID then
				g_defaultCS = 1
			end
			if modInfo.ID == madeiraCSModID then
				g_madeiraCS = 1
			end
			if modInfo.ID == extendedCSModID then
				g_extendedCS = 1
			end
			if modInfo.ID == dynamicModID then
				g_dynamicCS = 1
				g_dynamicMod = true
			end
		end
	end
end

-- more than one CS mod activated ?
if ( g_defaultCS + g_madeiraCS + g_extendedCS + g_dynamicCS > 1 ) then
	g_bBadCS = true
end


-- use mod data to save / load data between game initialisation phases
dynHistModVersion = Modding.GetLatestInstalledModVersion(dynamicModID) -- use DynHist mod ID for components intercompatibility
modUserData = Modding.OpenUserData(dynamicModID, dynHistModVersion)

-- map type
GIANT_EARTH = 1
HUGE_EARTH = 2
LARGE_GREATEST_EARTH = 3
STANDARD_CORDIFORM_EARTH = 4
GIANT_EUROPE = 5
LARGE_EUROPE = 6
NORTHWEST_EUROPE = 7
LARGE_AFRICA = 8
WEST_AFRICA = 9
AMERICAS = 10
ASIA = 11
EAST_ASIA = 12
NORTHEAST_ASIA = 13
NORTH_ATLANTIC = 14
AEGEAN = 15
APENNINE = 16
BRITISH_ISLES = 17
CARIBBEAN = 18
MEDITERRANEAN = 19
MESOPOTAMIA = 20
NILE_VALLEY = 21
PACIFIC = 22
SOUTH_PACIFIC = 23
MESOPOTAMIA_GIANT = 24
ASIA_SMALL = 25 -- re-test
LARGE_EUROPE_NEW = 26
ADRIATIC = 27
CAUCASUS = 28
ASIA_MONGOL_STEPPE = 29
CENTRAL_ASIA = 30
EASTERN_EUROPE = 31
NORTH_SEA_EUROPE = 32
AFRICA_ASIA_OCEANIA = 33
AFRICA_SOUTH_EUROPE = 34
AFRICA_GIANT = 35
SOUTH_AMERICA_GIANT = 36
AUSTRALIA_SOUTHEAST_ASIA = 37
INDIAN_OCEAN = 38
AMERICAS_GIANT = 39
INDIA_GIANT = 40
SOUTH_CENTRAL_AMERICA_HUGE = 41
SOUTH_CENTRAL_AMERICA_GIANT = 42
SCOTLAND_IRELAND_HUGE = 43
SOUTH_AMERICA_LARGE = 44
ASIA_SOUTH_HUGE = 45
SOUTH_PACIFIC_GIANT = 46
NORTH_AMERICA_GIANT = 47
NORTH_AMERICA_HUGE = 48
-- STANDARD_EARTH = 49
TEXCOCO = 49
WALES = 50
SOUTHERN_AFRICA = 51
SEA_OF_JAPAN = 52
RUSSIA_LARGE = 53
PATAGONIA = 54
NETHERLANDS = 55
INDONESIA = 56
MEDITERRANEAN_HUGE = 57
CENTRAL_AFRICA_LARGE = 58
GERMANY_HUGE = 59
CARIBBEAN_HUGE = 60
EARTH_MK3 = 61
VIETNAM = 62
JAPAN_HUGE = 63
LEVANT = 64
AUSTRALIA = 65
IBERIA = 66
INDIA = 67
ATLANTIC_GIANT = 68
NORTH_SEA_GIANT = 69
DENMARK = 70
ORIENT = 71


-- List of available maps
-- todo: ID as index
-- if ( g_madeiraCS == 1 ) then
	-- local str = "[NEWLINE]No other map available for Madeira's CS"
	-- g_MapList = { 
		-- [GIANT_EARTH] = { ID = GIANT_EARTH, File = "Earth_Giant_blank.Civ5Map", Name = "Giant Earth", Description = "180x96 giant earth" .. str, Size = "WORLDSIZE_HUGE", Civs = 20, Minors = 36, TablePrefix = "Yagem" },
	-- }
-- elseif ( g_dynamicCS == 1 ) then
	-- local str = "[NEWLINE]Limited list for Dynamic History"
	-- g_MapList = { 
		-- [GIANT_EARTH] = { ID = GIANT_EARTH, File = "Earth_Giant_blank.Civ5Map", Name = "Giant Earth", Description = "180x96 giant earth" .. str, Size = "WORLDSIZE_HUGE", Civs = 20, Minors = 36, TablePrefix = "Yagem" },
		-- [LARGE_EUROPE] = { ID = LARGE_EUROPE, File = "Europe_Large_blank.Civ5Map", Name = "Large Europe", Description = "79x73 large Europe by Dieter VonClam" .. str, Size = "WORLDSIZE_LARGE", Civs = 12, Minors = 12, TablePrefix = "EuroLarge" },
	-- }
-- else	
	g_MapList = { 	
		[GIANT_EARTH] = 				{ID = GIANT_EARTH, 					File = "Yagem.Civ5Map", 								Name = "[COLOR_POSITIVE_TEXT]Earth[ENDCOLOR] ([COLOR_CYAN]Giant[ENDCOLOR])", 							Description = "A Map of Earth by Genghis Kai", 																		Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "Yagem",},
		[HUGE_EARTH] = 					{ID = HUGE_EARTH, 					File = "Yahem.Civ5Map", 								Name = "[COLOR_POSITIVE_TEXT]Earth[ENDCOLOR] ([COLOR_CYAN]Huge[ENDCOLOR])", 							Description = "A Map of Earth with enlarged Europe by Dale", 														Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "Yahem" },
		[LARGE_GREATEST_EARTH] = 		{ID = LARGE_GREATEST_EARTH, 		File = "GreatestEarth.Civ5Map", 						Name = "[COLOR_POSITIVE_TEXT]Earth:[ENDCOLOR] Greatest ([COLOR_CYAN]Large[ENDCOLOR])", 					Description = "A Map of Earth by djvandyke", 																		Size = "WORLDSIZE_LARGE", 		Civs = 8, 	Minors = 16, 	TablePrefix = "GreatestEarth" },
		-- [STANDARD_EARTH] = 				{ID = EARTH_STANDARD, 				File = "Earth_Standard.Civ5Map", 						Name = "[COLOR_POSITIVE_TEXT]Earth[ENDCOLOR] ([COLOR_CYAN]Standard[ENDCOLOR])", 						Description = "Standard Earth by Greizer85", 																	Size = "WORLDSIZE_STANDARD", 	Civs = 16, 	Minors = 32, 	TablePrefix = "EarthStandard" },
		[STANDARD_CORDIFORM_EARTH] = 	{ID = STANDARD_CORDIFORM_EARTH, 	File = "Cordiform.Civ5Map", 							Name = "[COLOR_POSITIVE_TEXT]Earth:[ENDCOLOR] Cordiform ([COLOR_CYAN]Standard[ENDCOLOR])", 				Description = "A Map of Earth using the Werner projection by smellymummy", 											Size = "WORLDSIZE_STANDARD", 	Civs = 16, 	Minors = 32, 	TablePrefix = "Cordiform" },
		[AFRICA_ASIA_OCEANIA] = 		{ID = AFRICA_ASIA_OCEANIA, 			File = "AfriAsiaAust.Civ5Map", 							Name = "[COLOR_POSITIVE_TEXT]Earth:[ENDCOLOR] Africa, Asia, & Aus. ([COLOR_CYAN]Huge[ENDCOLOR])", 		Description = "A Map of Africa, Asia, and Australia by ???", 														Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "AfriAsiaAust" },
		[AFRICA_SOUTH_EUROPE] = 		{ID = AFRICA_SOUTH_EUROPE, 			File = "AfriSouthEuro.Civ5Map", 						Name = "[COLOR_POSITIVE_TEXT]Africa:[ENDCOLOR] Africa & South Europe ([COLOR_CYAN]Large[ENDCOLOR])",	Description = "A Map of Africa, and Southern Europe by ???", 														Size = "WORLDSIZE_LARGE", 		Civs = 8, 	Minors = 16, 	TablePrefix = "AfriSouthEuro" },
		[AFRICA_GIANT] = 				{ID = AFRICA_GIANT,					File = "AfriGiant.Civ5Map", 							Name = "[COLOR_POSITIVE_TEXT]Africa[ENDCOLOR] ([COLOR_CYAN]Giant[ENDCOLOR])", 							Description = "A Map of Africa by Imperator/Elite999", 																Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "AfriGiant" },
		[GIANT_EUROPE] = 				{ID = GIANT_EUROPE,					File = "EuroGiant.Civ5Map", 							Name = "[COLOR_POSITIVE_TEXT]Europe[ENDCOLOR] ([COLOR_CYAN]Giant[ENDCOLOR])", 							Description = "A Map of Europe by Damasc", 																			Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "EuroGiant" },
		[LARGE_EUROPE] = 				{ID = LARGE_EUROPE,					File = "EuroLarge.Civ5Map", 							Name = "[COLOR_POSITIVE_TEXT]Europe[ENDCOLOR] ([COLOR_CYAN]Large[ENDCOLOR])", 							Description = "A Map of Europe by Dieter VonClam",																	Size = "WORLDSIZE_LARGE", 		Civs = 8, 	Minors = 16, 	TablePrefix = "EuroLarge" },
		[LARGE_EUROPE_NEW] = 			{ID = LARGE_EUROPE_NEW, 			File = "EuroLargeNew.Civ5Map", 							Name = "[COLOR_POSITIVE_TEXT]Europe:[ENDCOLOR] Greatest ([COLOR_CYAN]Large[ENDCOLOR])", 				Description = "A Map of Europe by JanBoruta", 																		Size = "WORLDSIZE_LARGE", 		Civs = 8, 	Minors = 16, 	TablePrefix = "EuroLargeNew" },
		[EASTERN_EUROPE] = 				{ID = EASTERN_EUROPE, 				File = "EuroEastern.Civ5Map", 							Name = "[COLOR_POSITIVE_TEXT]Europe:[ENDCOLOR] Eastern ([COLOR_CYAN]Large[ENDCOLOR])", 					Description = "A Map of Eastern Europe by Lungora",  																Size = "WORLDSIZE_LARGE", 		Civs = 8, 	Minors = 16, 	TablePrefix = "EuroEastern" },
		[NORTH_SEA_EUROPE] = 			{ID = NORTH_SEA_EUROPE, 			File = "NorthSeaEurope.Civ5Map", 						Name = "[COLOR_POSITIVE_TEXT]Europe:[ENDCOLOR] North Sea ([COLOR_CYAN]Huge[ENDCOLOR])", 				Description = "A Map of the North Sea by Lungora", 																	Size = "WORLDSIZE_SMALL", 		Civs = 6, 	Minors = 16,	TablePrefix = "NorthSeaEurope" },
		[NORTHWEST_EUROPE] = 			{ID = NORTHWEST_EUROPE, 			File = "NorthWestEurope.Civ5Map", 						Name = "[COLOR_POSITIVE_TEXT]Europe:[ENDCOLOR] North-West ([COLOR_CYAN]Small[ENDCOLOR])", 				Description = "A Map of North-West Europe by jordie", 																Size = "WORLDSIZE_SMALL", 		Civs = 6, 	Minors = 16,	TablePrefix = "NorthWestEurope" },
		[AEGEAN] = 						{ID = AEGEAN, 						File = "Aegean.Civ5Map", 								Name = "[COLOR_POSITIVE_TEXT]Europe:[ENDCOLOR] Aegea ([COLOR_CYAN]Standard[ENDCOLOR])", 				Description = "A Map of Greece and Anatolia by Evanescence", 														Size = "WORLDSIZE_STANDARD", 	Civs = 16, 	Minors = 32, 	TablePrefix = "Aegean" },
		[APENNINE] = 					{ID = APENNINE, 					File = "Apennine.Civ5Map", 								Name = "[COLOR_POSITIVE_TEXT]Europe:[ENDCOLOR] Apennine ([COLOR_CYAN]Standard[ENDCOLOR])", 				Description = "A Map of Italy by Evanescence", 																		Size = "WORLDSIZE_TINY", 		Civs = 4, 	Minors = 8, 	TablePrefix = "Apennine" },
		[BRITISH_ISLES] = 				{ID = BRITISH_ISLES, 				File = "BritishIsles.Civ5Map", 							Name = "[COLOR_POSITIVE_TEXT]Europe:[ENDCOLOR] Great Britain ([COLOR_CYAN]Standard[ENDCOLOR])", 		Description = "A Map of the British Isles by Firaxis",	 															Size = "WORLDSIZE_STANDARD", 	Civs = 16, 	Minors = 32, 	TablePrefix = "BritishIsles" },
		[MEDITERRANEAN] = 				{ID = MEDITERRANEAN, 				File = "Mediterranean.Civ5Map", 						Name = "[COLOR_POSITIVE_TEXT]Europe:[ENDCOLOR] Mediterranean ([COLOR_CYAN]Large[ENDCOLOR])", 			Description = "A Map of the Mediterranean by ???", 																	Size = "WORLDSIZE_LARGE", 		Civs = 8, 	Minors = 16, 	TablePrefix = "Mediterranean" },
		[ADRIATIC] = 					{ID = ADRIATIC, 					File = "Adriatic.Civ5Map", 								Name = "[COLOR_POSITIVE_TEXT]Europe:[ENDCOLOR] Balkans ([COLOR_CYAN]Huge[ENDCOLOR])", 					Description = "A Map of the Adriatic Sea, by Lungora", 																Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "Adriatic" },
		[ASIA] = 						{ID = ASIA, 						File = "Asia.Civ5Map", 									Name = "[COLOR_POSITIVE_TEXT]Asia[ENDCOLOR] ([COLOR_CYAN]Large[ENDCOLOR])", 							Description = "A Map of Asia by ???", 																				Size = "WORLDSIZE_LARGE", 		Civs = 8, 	Minors = 16, 	TablePrefix = "Asia" },
		[ASIA_SMALL] = 					{ID = ASIA_SMALL, 					File = "AsiaSmall.Civ5Map", 							Name = "[COLOR_POSITIVE_TEXT]Asia:[ENDCOLOR] East ([COLOR_CYAN]Small[ENDCOLOR])", 						Description = "A Map of East Asia by ???", 																			Size = "WORLDSIZE_SMALL", 		Civs = 6, 	Minors = 16,	TablePrefix = "AsiaSmall" },
		[EAST_ASIA] = 					{ID = EAST_ASIA, 					File = "EastAsia.Civ5Map", 								Name = "[COLOR_POSITIVE_TEXT]Asia:[ENDCOLOR] South East ([COLOR_CYAN]Large[ENDCOLOR])", 				Description = "A Map of South-East Asia ???", 																		Size = "WORLDSIZE_LARGE", 		Civs = 8, 	Minors = 16, 	TablePrefix = "EastAsia" },
		[AUSTRALIA_SOUTHEAST_ASIA] = 	{ID = AUSTRALIA_SOUTHEAST_ASIA, 	File = "AustralasiaGiant.Civ5Map", 						Name = "[COLOR_POSITIVE_TEXT]Oceania:[ENDCOLOR] Aus. & S-E Asia ([COLOR_CYAN]Giant[ENDCOLOR])", 		Description = "A Map of Australia and South East Asia by Imperator/Elite999", 										Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "AustralasiaGiant" },
		[NORTHEAST_ASIA] = 				{ID = NORTHEAST_ASIA, 				File = "NorthEastAsia.Civ5Map", 						Name = "[COLOR_POSITIVE_TEXT]Asia:[ENDCOLOR] North-East ([COLOR_CYAN]Standard[ENDCOLOR])", 				Description = "A Map of North-East Asia by Evanescence", 															Size = "WORLDSIZE_STANDARD", 	Civs = 16, 	Minors = 32, 	TablePrefix = "NorthEastAsia" },
		[ASIA_MONGOL_STEPPE] = 			{ID = ASIA_MONGOL_STEPPE, 			File = "AsiaSteppeGiant.Civ5Map", 						Name = "[COLOR_POSITIVE_TEXT]Asia:[ENDCOLOR] Steppes ([COLOR_CYAN]Huge[ENDCOLOR])", 					Description = "A Map of the Asian Steppes by Lungora", 																Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "AsiaSteppeGiant" },
		[CAUCASUS] = 					{ID = CAUCASUS, 					File = "Caucasus.Civ5Map", 								Name = "[COLOR_POSITIVE_TEXT]Asia:[ENDCOLOR] Caucasus ([COLOR_CYAN]Huge[ENDCOLOR])", 					Description = "A Map of Anatolia and the Caucasus by Lungora", 														Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "Caucasus" },
		[CENTRAL_ASIA] = 				{ID = CENTRAL_ASIA, 				File = "CentralAsia.Civ5Map", 							Name = "[COLOR_POSITIVE_TEXT]Asia:[ENDCOLOR] Central ([COLOR_CYAN]Giant[ENDCOLOR])", 					Description = "A Map of Central Asia by Lungora", 																	Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "CentralAsia" },
		[NORTH_ATLANTIC] = 				{ID = NORTH_ATLANTIC, 				File = "NorthAtlantic.Civ5Map", 						Name = "[COLOR_POSITIVE_TEXT]Europe:[ENDCOLOR] Atlantic ([COLOR_CYAN]Large[ENDCOLOR])", 				Description = "A Map of Europe and the Eastern Seaboard by ???", 													Size = "WORLDSIZE_LARGE", 		Civs = 8, 	Minors = 16, 	TablePrefix = "NorthAtlantic" },
		[PACIFIC] = 					{ID = PACIFIC, 						File = "Pacific.Civ5Map", 								Name = "[COLOR_POSITIVE_TEXT]Oceania:[ENDCOLOR] Pacific ([COLOR_CYAN]Large[ENDCOLOR])", 				Description = "A Map of the Pacific by kevincbryan", 																Size = "WORLDSIZE_LARGE", 		Civs = 8, 	Minors = 16, 	TablePrefix = "Pacific" },
		[SOUTH_PACIFIC] = 				{ID = SOUTH_PACIFIC, 				File = "SouthPacific.Civ5Map", 							Name = "[COLOR_POSITIVE_TEXT]Oceania:[ENDCOLOR] South ([COLOR_CYAN]Huge[ENDCOLOR])", 					Description = "A Map of the South Pacific by Firaxis", 																Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "SouthPacific" },
		[INDIAN_OCEAN] = 				{ID = INDIAN_OCEAN,				 	File = "IndianOcean.Civ5Map", 							Name = "[COLOR_POSITIVE_TEXT]Asia:[ENDCOLOR] Indian Ocean ([COLOR_CYAN]Large[ENDCOLOR])", 				Description = "A Map of East Africa, India, South-East Asia, and Western Australia by ???", 						Size = "WORLDSIZE_LARGE", 		Civs = 8, 	Minors = 16, 	TablePrefix = "IndianOcean" },
		[AMERICAS] = 					{ID = AMERICAS, 					File = "Americas.Civ5Map", 								Name = "[COLOR_POSITIVE_TEXT]America[ENDCOLOR] ([COLOR_CYAN]Standard[ENDCOLOR])", 						Description = "A Map of the Americas by ???", 																		Size = "WORLDSIZE_STANDARD", 	Civs = 16, 	Minors = 32, 	TablePrefix = "Americas" },
		[SOUTH_AMERICA_GIANT] = 		{ID = SOUTH_AMERICA_GIANT, 			File = "SouthAmericaGiant.Civ5Map", 					Name = "[COLOR_POSITIVE_TEXT]America:[ENDCOLOR][ENDCOLOR] South ([COLOR_CYAN]Giant[ENDCOLOR])", 		Description = "A Map of South America by Imperator/Elite999", 														Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "SouthAmericaGiant" },
		[CARIBBEAN] = 					{ID = CARIBBEAN, 					File = "Caribbean.Civ5Map",	 							Name = "[COLOR_POSITIVE_TEXT]America:[ENDCOLOR] Caribbean ([COLOR_CYAN]Large[ENDCOLOR])", 				Description = "A Map of the Caribbean by Firaixs", 																	Size = "WORLDSIZE_LARGE", 		Civs = 8, 	Minors = 16, 	TablePrefix = "Caribbean" },
		[MESOPOTAMIA_GIANT] = 			{ID = MESOPOTAMIA_GIANT, 			File = "MesopotamiaGiant.Civ5Map", 						Name = "[COLOR_POSITIVE_TEXT]Mid-East:[ENDCOLOR] Mesopotamia ([COLOR_CYAN]Giant[ENDCOLOR])", 			Description = "A Map of the Levant by Lungora", 																	Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "MesopotamiaGiant" },
		[MESOPOTAMIA] = 				{ID = MESOPOTAMIA, 					File = "Mesopotamia.Civ5Map", 							Name = "[COLOR_POSITIVE_TEXT]Mid-East:[ENDCOLOR] Mesopotamia ([COLOR_CYAN]Standard[ENDCOLOR])", 		Description = "A Map of Mesopotamia by ???", 																		Size = "WORLDSIZE_LARGE", 		Civs = 8, 	Minors = 16, 	TablePrefix = "Mesopotamia" },
		[LARGE_AFRICA] = 				{ID = LARGE_AFRICA, 				File = "AfricaLarge.Civ5Map", 							Name = "[COLOR_POSITIVE_TEXT]Africa:[ENDCOLOR] ([COLOR_CYAN]Standard[ENDCOLOR])", 						Description = "A Map of Africa by jordie", 																			Size = "WORLDSIZE_LARGE", 		Civs = 8, 	Minors = 16, 	TablePrefix = "AfricaLarge" },
		[NILE_VALLEY] = 				{ID = NILE_VALLEY, 					File = "NileValley.Civ5Map", 							Name = "[COLOR_POSITIVE_TEXT]Mid-East:[ENDCOLOR] Nile Valley ([COLOR_CYAN]Large[ENDCOLOR])", 			Description = "A Map of the Nile Valley by Admiral Ackbar", 														Size = "WORLDSIZE_LARGE", 		Civs = 8, 	Minors = 16, 	TablePrefix = "NileValley" },
		[WEST_AFRICA] = 				{ID = WEST_AFRICA, 					File = "WestAfrica.Civ5Map", 							Name = "[COLOR_POSITIVE_TEXT]Africa:[ENDCOLOR] West ([COLOR_CYAN]Large[ENDCOLOR])", 					Description = "A Map of West Africa by Lungora", 																	Size = "WORLDSIZE_LARGE", 		Civs = 8, 	Minors = 16, 	TablePrefix = "WestAfrica" },
		[AMERICAS_GIANT] = 				{ID = AMERICAS_GIANT, 				File = "AmericasGiant.Civ5Map", 						Name = "[COLOR_POSITIVE_TEXT]America[ENDCOLOR] ([COLOR_CYAN]Giant[ENDCOLOR])", 							Description = "A Map of the Americas by Imperator/Elite999", 														Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "AmericasGiant" },
		[INDIA_GIANT] = 				{ID = INDIA_GIANT, 					File = "IndiaGiant.Civ5Map", 							Name = "[COLOR_POSITIVE_TEXT]Asia:[ENDCOLOR] India ([COLOR_CYAN]Giant[ENDCOLOR])", 						Description = "A Map of South Asia by Imperator/Elite999", 															Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "IndiaGiant" },
		[SOUTH_CENTRAL_AMERICA_HUGE] = 	{ID = SOUTH_CENTRAL_AMERICA_HUGE, 	File = "SouthAmericaCentralHuge.Civ5Map", 				Name = "[COLOR_POSITIVE_TEXT]America:[ENDCOLOR] South & Central ([COLOR_CYAN]Huge[ENDCOLOR])", 			Description = "A Map of Central and South America by Imperator/Elite999", 											Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "SouthAmericaCentralHuge" },
		[SOUTH_CENTRAL_AMERICA_GIANT] = {ID = SOUTH_CENTRAL_AMERICA_GIANT, 	File = "SouthAmericaCentralGiant.Civ5Map", 				Name = "[COLOR_POSITIVE_TEXT]America:[ENDCOLOR] South & Central ([COLOR_CYAN]Giant[ENDCOLOR])", 		Description = "A Map of Central and South America by Imperator/Elite999", 											Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "SouthAmericaCentralGiant" },
		[SCOTLAND_IRELAND_HUGE] = 		{ID = SCOTLAND_IRELAND_HUGE, 		File = "ScotlandIrelandHuge.Civ5Map", 					Name = "[COLOR_POSITIVE_TEXT]Europe:[ENDCOLOR] Scotland & Ireland ([COLOR_CYAN]Huge[ENDCOLOR])", 		Description = "A Map of Scotland and Ireland by Lungora", 															Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "ScotlandIrelandHuge" },
		[SOUTH_AMERICA_LARGE] = 		{ID = SOUTH_AMERICA_LARGE, 			File = "SouthAmericaLarge.Civ5Map", 					Name = "[COLOR_POSITIVE_TEXT]America:[ENDCOLOR] South ([COLOR_CYAN]Large[ENDCOLOR])", 					Description = "A Map of South America by Imperator/Elite999", 														Size = "WORLDSIZE_LARGE", 		Civs = 8, 	Minors = 16, 	TablePrefix = "SouthAmericaLarge" },
		[ASIA_SOUTH_HUGE] = 			{ID = ASIA_SOUTH_HUGE, 				File = "SouthAsiaHuge.Civ5Map", 						Name = "[COLOR_POSITIVE_TEXT]Asia:[ENDCOLOR] South ([COLOR_CYAN]Huge[ENDCOLOR])", 						Description = "A Map of South Asia by ???", 																		Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "SouthAsiaHuge" },
		[SOUTH_PACIFIC_GIANT] = 		{ID = SOUTH_PACIFIC_GIANT, 			File = "SouthPacificGiant.Civ5Map", 					Name = "[COLOR_POSITIVE_TEXT]Oceania:[ENDCOLOR] South ([COLOR_CYAN]Huge[ENDCOLOR])", 					Description = "A Map of the South Pacific by Lungora", 																Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "SouthPacificGiant" },
		[NORTH_AMERICA_GIANT] = 		{ID = NORTH_AMERICA_GIANT, 			File = "NorthAmericaGiant.Civ5Map", 					Name = "[COLOR_POSITIVE_TEXT]America:[ENDCOLOR] North ([COLOR_CYAN]Giant[ENDCOLOR])",					Description = "A Map of North America by Imperator/Elite999", 														Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "NorthAmericaGiant" },
		[NORTH_AMERICA_HUGE] = 			{ID = NORTH_AMERICA_HUGE, 			File = "NorthAmericaHuge.Civ5Map", 						Name = "[COLOR_POSITIVE_TEXT]America:[ENDCOLOR] North ([COLOR_CYAN]Huge[ENDCOLOR])", 					Description = "A Map of North America by Lungora", 																	Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "NorthAmericaHuge" },
		[TEXCOCO] = 					{ID = TEXCOCO, 						File = "Texcoco.Civ5Map", 								Name = "[COLOR_POSITIVE_TEXT]America:[ENDCOLOR] Lake Texcoco ([COLOR_CYAN]Standard[ENDCOLOR])", 		Description = "A Map of Lake Texcoco and the Mexico Valley by Vanadius", 											Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "Texcoco" },
		[WALES] = 						{ID = WALES, 						File = "Wales.Civ5Map", 								Name = "[COLOR_POSITIVE_TEXT]Europe:[ENDCOLOR] Wales ([COLOR_CYAN]Standard[ENDCOLOR])", 				Description = "A Map of Wales, Western England, Cornwall, Isle of Man, and Eastern Ireland by Vanadius", 			Size = "WORLDSIZE_STANDARD", 	Civs = 16, 	Minors = 32, 	TablePrefix = "Wales" },
		[SOUTHERN_AFRICA] = 			{ID = SOUTHERN_AFRICA, 				File = "SouthernAfrica.Civ5Map", 						Name = "[COLOR_POSITIVE_TEXT]Africa:[ENDCOLOR] South ([COLOR_CYAN]Huge[ENDCOLOR])", 					Description = "A Map of Southern African Continent and Madagascar by Vanadius", 									Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "SouthernAfrica" },
		[SEA_OF_JAPAN] = 				{ID = SEA_OF_JAPAN, 				File = "SeaOfJapan.Civ5Map", 							Name = "[COLOR_POSITIVE_TEXT]Asia:[ENDCOLOR] Sea of Japan ([COLOR_CYAN]Huge[ENDCOLOR])", 				Description = "A Map of the Sea of Japan by ???", 																	Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "SeaOfJapan" },
		[RUSSIA_LARGE] = 				{ID = RUSSIA_LARGE, 				File = "RussiaLarge.Civ5Map", 							Name = "[COLOR_POSITIVE_TEXT]Earth:[ENDCOLOR] Eurasia ([COLOR_CYAN]Large[ENDCOLOR])", 					Description = "A Map of Russia from Kamchatka to Norway by Eaving and Vanadius", 									Size = "WORLDSIZE_LARGE", 		Civs = 8, 	Minors = 16, 	TablePrefix = "RussiaLarge" },
		[PATAGONIA] = 					{ID = PATAGONIA, 					File = "Patagonia.Civ5Map", 							Name = "[COLOR_POSITIVE_TEXT]America:[ENDCOLOR] Patagonia ([COLOR_CYAN]Huge[ENDCOLOR])", 				Description = "A Map of Patagonia in Argentina and Chile by Vanadius", 												Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "Patagonia" },
		[NETHERLANDS] = 				{ID = NETHERLANDS, 					File = "Netherlands.Civ5Map", 							Name = "[COLOR_POSITIVE_TEXT]Europe:[ENDCOLOR] Netherlands ([COLOR_CYAN]Standard[ENDCOLOR])", 			Description = "A Map of the Netherlands including Northern Belgium and North-Western Germany by Vanadius", 			Size = "WORLDSIZE_STANDARD", 	Civs = 16, 	Minors = 32, 	TablePrefix = "Netherlands" },
		[INDONESIA] = 					{ID = INDONESIA, 					File = "Indonesia.Civ5Map", 							Name = "[COLOR_POSITIVE_TEXT]Asia:[ENDCOLOR] Indonesia ([COLOR_CYAN]Huge[ENDCOLOR])", 					Description = "A Map of the Indonesian Archipelago, including South East Asia and the Philippines by Vanadius", 	Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "Indonesia" },
		[MEDITERRANEAN_HUGE] = 			{ID = MEDITERRANEAN_HUGE, 			File = "MediterraneanHuge.Civ5Map", 					Name = "[COLOR_POSITIVE_TEXT]Europe:[ENDCOLOR] Mediterranean ([COLOR_CYAN]Huge[ENDCOLOR])", 			Description = "A Map of the Mediterranean by DMS", 																	Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "MediterraneanHuge" },
		[CENTRAL_AFRICA_LARGE] = 		{ID = CENTRAL_AFRICA_LARGE, 		File = "CentralAfricaLarge.Civ5Map", 					Name = "[COLOR_POSITIVE_TEXT]Africa:[ENDCOLOR] Central ([COLOR_CYAN]Large[ENDCOLOR])", 					Description = "A Map of the Central Africa from Kenya to Angola to Nigeria by Vanadius", 							Size = "WORLDSIZE_LARGE", 		Civs = 8, 	Minors = 16, 	TablePrefix = "CentralAfricaLarge" },
		[GERMANY_HUGE] = 				{ID = GERMANY_HUGE, 				File = "GermanyHuge.Civ5Map", 							Name = "[COLOR_POSITIVE_TEXT]Europe:[ENDCOLOR] Germany ([COLOR_CYAN]Huge[ENDCOLOR])", 					Description = "A Map of Germany by Vanadius", 																		Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "GermanyHuge" },
		[CARIBBEAN_HUGE] = 				{ID = CARIBBEAN_HUGE, 				File = "CaribbeanHuge.Civ5Map", 						Name = "[COLOR_POSITIVE_TEXT]America:[ENDCOLOR] Caribbean ([COLOR_CYAN]Huge[ENDCOLOR])", 				Description = "A Map of the Caribbean by Lungora", 																	Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "CaribbeanHuge" },
		[EARTH_MK3] = 					{ID = EARTH_MK3, 					File = "EarthMk3.Civ5Map", 								Name = "[COLOR_POSITIVE_TEXT]Earth:[ENDCOLOR] Mk.3 ([COLOR_CYAN]Huge[ENDCOLOR])", 						Description = "A Map of the Earth for the Battle Royale", 															Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "EarthMk3" },
		[VIETNAM] = 					{ID = VIETNAM, 						File = "Vietnam.Civ5Map", 								Name = "[COLOR_POSITIVE_TEXT]Asia:[ENDCOLOR] Vietnam ([COLOR_CYAN]Small[ENDCOLOR])", 					Description = "A Map of Vietnam, Cambodia, Laos, and some of China and Thailand by Lungora", 						Size = "WORLDSIZE_SMALL", 		Civs = 6, 	Minors = 16,	TablePrefix = "Vietnam" },
		[JAPAN_HUGE] = 					{ID = JAPAN_HUGE, 					File = "JapanHuge.Civ5Map", 							Name = "[COLOR_POSITIVE_TEXT]Asia:[ENDCOLOR] Japan ([COLOR_CYAN]Giant[ENDCOLOR])", 						Description = "A Map of Japan and South Korea by Lungora", 															Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "JapanHuge" },
		[LEVANT] = 						{ID = LEVANT, 						File = "Levant.Civ5Map", 								Name = "[COLOR_POSITIVE_TEXT]Mid-East:[ENDCOLOR] Levant ([COLOR_CYAN]Standard[ENDCOLOR])", 				Description = "A Map of the Levant, Cyprus, The Nile Delta, and Sinai by Lungora", 									Size = "WORLDSIZE_STANDARD", 	Civs = 16, 	Minors = 32, 	TablePrefix = "Levant" },
		[AUSTRALIA] = 					{ID = AUSTRALIA, 					File = "Australia.Civ5Map", 							Name = "[COLOR_POSITIVE_TEXT]Oceania:[ENDCOLOR] Australia ([COLOR_CYAN]Standard[ENDCOLOR])", 			Description = "A Map of Australia by Lungora", 																		Size = "WORLDSIZE_STANDARD", 	Civs = 16, 	Minors = 32, 	TablePrefix = "Australia" },
		[IBERIA] = 						{ID = IBERIA, 						File = "Iberia.Civ5Map", 								Name = "[COLOR_POSITIVE_TEXT]Europe:[ENDCOLOR] Iberia ([COLOR_CYAN]Large[ENDCOLOR])", 					Description = "A Map of Iberia, Morocco, Western Algeria, and a touch of Southern France by Lungora", 				Size = "WORLDSIZE_LARGE", 		Civs = 8, 	Minors = 16, 	TablePrefix = "Iberia" },
		[INDIA] = 						{ID = INDIA, 						File = "India.Civ5Map", 								Name = "[COLOR_POSITIVE_TEXT]Asia:[ENDCOLOR] India ([COLOR_CYAN]Large[ENDCOLOR])", 						Description = "A Map of South Asia by Lungora", 																	Size = "WORLDSIZE_LARGE", 		Civs = 8, 	Minors = 16, 	TablePrefix = "India" },
		[ATLANTIC_GIANT] = 				{ID = ATLANTIC_GIANT, 				File = "AtlanticGiant.Civ5Map", 						Name = "[COLOR_POSITIVE_TEXT]Europe:[ENDCOLOR] Atlantic ([COLOR_CYAN]Huge[ENDCOLOR])", 					Description = "A Map of the Atlantic from Hawaii to Norway by Vanadius", 											Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "AtlanticGiant" },
		[NORTH_SEA_GIANT] = 			{ID = NORTH_SEA_GIANT, 				File = "NorthSeaGiant.Civ5Map", 						Name = "[COLOR_POSITIVE_TEXT]Europe:[ENDCOLOR] North Sea ([COLOR_CYAN]Giant[ENDCOLOR])", 				Description = "A Map of Norwegian Sea, Barents Sea, Greenland Sea and Northern Atlantic Ocean by Vanadius", 		Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "NorthSeaGiant" },
		[DENMARK] = 					{ID = DENMARK, 						File = "Denmark.Civ5Map", 								Name = "[COLOR_POSITIVE_TEXT]Europe:[ENDCOLOR] Denmark ([COLOR_CYAN]Small[ENDCOLOR])", 					Description = "A Map of Denmark by Jules Winnfield", 																Size = "WORLDSIZE_SMALL", 		Civs = 6, 	Minors = 16, 	TablePrefix = "Denmark" },
		[ORIENT] = 						{ID = ORIENT, 						File = "Orient.Civ5Map", 								Name = "[COLOR_POSITIVE_TEXT]Asia:[ENDCOLOR] Orient ([COLOR_CYAN]Huge[ENDCOLOR])", 						Description = "A Map of the Orient from Africa to India by Napoleon V", 											Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "Orient" },

	}
-- end

-- Bosphorus Strait position
-- x, y are plot coordinate, replX and replY the replacement plot for any civ starting here
-- riverX, riverY are the coordinate of the plot NW or W to the strait as a river (see position)
g_BosphorusPlot = { 
	[GIANT_EARTH] = {x=31, y=59, replX=32, replY=59, riverX=31, riverY=60, position = "NW"},
	[HUGE_EARTH] = {x=69, y=54, replX=69, replY=53, riverX=69, riverY=54, position = "NW"},
	[STANDARD_CORDIFORM_EARTH] = {x=45, y=24, replX=45, replY=23, riverX=44, riverY=24, position = "W"},
	[LARGE_EUROPE] = {x=53, y=31, replX=54, replY=31, riverX=53, riverY=31, position = "W-NW"},
	[LARGE_GREATEST_EARTH] = {x=58, y=45, replX=59, replY=45, riverX=57, riverY=45, position = "W"},
	[GIANT_EUROPE] = {x=110, y=34, replX=110, replY=33, riverX=110, riverY=34, position = "W-NW"},
	[MESOPOTAMIA_GIANT] = {x=19, y=91, replX=20, replY=91, riverX=19, riverY=91, position = "W-NW"},
	[LARGE_EUROPE_NEW] = {x=59, y=23, replX=58, replY=23, riverX=58, riverY=23, position = "W"},
	[CAUCASUS] = {x=44, y=39, replX=43, replY=39, riverX=43, riverY=39, position = "W"},
	[AFRICA_SOUTH_EUROPE] = {x=51, y=71, replX=51, replY=72, riverX=51, riverY=72, position = "NW"},
	[AFRICA_ASIA_OCEANIA] = {x=39, y=74, replX=40, replY=74, riverX=39, riverY=74, position = "W"},
	[MEDITERRANEAN_HUGE] = {x=66, y=47, replX=65, replY=46, riverX=65, riverY=46, position = "W"},
	[EARTH_MK3] = {x=33, y=57, replX=32, replY=57, riverX=32, riverY=57, position = "W"},
	[ATLANTIC_GIANT] = {x=170, y=34, replX=170, replY=38, riverX=170, riverY=34, position = "W"},
	[ORIENT] = {x=33, y=65, replX=32, replY=65, riverX=32, riverY=65, position = "W"},
}

-- Natural Wonder renaming
g_NaturalWonderName = { 
	[GIANT_EARTH] = {},
	[HUGE_EARTH] = {},
	-- [STANDARD_EARTH] = {},
	[STANDARD_CORDIFORM_EARTH] = {},
	[LARGE_EUROPE] = { TXT_KEY_FEATURE_VOLCANO = "Santorini", TXT_KEY_FEATURE_REEF = "Coral Reef", TXT_KEY_FEATURE_GEYSER = "The Great Geysir", TXT_KEY_FEATURE_CRATER = "Tin Bider crater", TXT_KEY_FEATURE_POTOSI = "The Great Copper Mountain" },
	[LARGE_GREATEST_EARTH] = {},
	[GIANT_EUROPE] = { 
		TXT_KEY_FEATURE_VOLCANO = "Santorini",
		TXT_KEY_CIV5_FEATURES_KRAKATOA_TEXT = "Santorini is an island located in the southern Aegean Sea. The island is the site of one of the largest volcanic eruptions in recorded history: the Minoan eruption, sometimes called the Thera eruption, which occurred some 3600 years ago at the height of the Minoan civilization. The eruption left a large caldera surrounded by volcanic ash deposits hundreds of feet deep and may have led indirectly to the collapse of the Minoan civilization on the island of Crete, 110 km to the south, through a gigantic tsunami. Another popular theory holds that the Thera eruption is the source of the legend of Atlantis.",		
		TXT_KEY_FEATURE_REEF = "The Sula Reef",
		TXT_KEY_CIV5_FEATURES_GREATBARRIERREEF_TEXT = "The Sula Reef is a deep-water coral reef off the coast of Norway. It is located on the Sula Ridge, named after the island of Sula. The reef is generated by the coral Lophelia pertusa. It has a length extension of about thirteen kilometers, and is 700 meters wide. The thickness of the reef is up to 35 meters. Until the discovery of the Røst Reef in 2002, the Sula Reef was the world's largest known Lophelia reef.",
		TXT_KEY_FEATURE_GEYSER = "The Great Geysir",
		TXT_KEY_CIV5_FEATURES_OLDFAITHFUL_TEXT = "Geysir sometimes known as The Great Geysir, is a geyser in southwestern Iceland. It was the first geyser described in a printed source and the first known to modern Europeans. The English word geyser (a periodically spouting hot spring) derives from Geysir. The name Geysir itself is derived from the Icelandic verb geysa. Geysir lies in the Haukadalur valley on the slopes of Laugarfjall hill, which is also the home to Strokkur geyser about 50 metres south.",
		TXT_KEY_FEATURE_CRATER = "Tin Bider crater",
		TXT_KEY_CIV5_FEATURES_BARRINGER_TEXT = "Tin Bider is an impact crater that sits in dry, rugged terrain in Algeria. The crater was formed in the last 70 million years, perhaps in the late Cretaceous or early Tertiary Period. Spanning 6 kilometres, the crater sits at the southern end of a range of hills. The elevated position and concentric rings of Tin Bider suggest that its structure is complex.",
		TXT_KEY_FEATURE_POTOSI = "The Great Copper Mountain",
		TXT_KEY_CIV5_FEATURES_POTOSI_TEXT =  "Falun Mine was a mine in Falun, Sweden, that operated for a millennium from the 10th century to 1992. It produced as much as two thirds of Europe's copper needs and helped fund many of Sweden's wars in the 17th century. Technological developments at the mine had a profound influence on mining globally for two centuries. Since 2001 it has been designated a UNESCO world heritage site as well as a museum.",
		TXT_KEY_FEATURE_MT_FUJI = "Mt. Etna",
		TXT_KEY_CIV5_FEATURES_FUJI_TEXT = "Mount Etna is an active stratovolcano on the east coast of Sicily, Italy, in the Province of Catania, between Messina and Catania. It lies above the convergent plate margin between the African Plate and the Eurasian Plate. It is the tallest active volcano on the European continent, currently 3,329 m (10,922 ft) high, though this varies with summit eruptions.",
		TXT_KEY_FEATURE_MT_KAILASH = "Mont Blanc",
		TXT_KEY_CIV5_FEATURES_MT_KAILASH_TEXT = "Mont Blanc is the highest mountain in the Alps, Western Europe and the European Union. The mountain lies between the regions of Aosta Valley, Italy, and Haute-Savoie, France. It rises 4,810 m above sea level and is ranked 11th in the world in topographic prominence. The summit of Mont Blanc is a thick, perennial ice and snow dome whose thickness varies, so no exact and permanent summit elevation can be determined, although accurate measurements have been made. It was first climbed in 1786 by Michel-Gabriel Paccard and Jacques Balmat. In 1886, future U.S. President Theodore Roosevelt led an expedition to the peak. Today it is one of the most visited tourist destinations in the world.",
		TXT_KEY_FEATURE_MESA = "Siligo Mesa",
		TXT_KEY_CIV5_FEATURES_GRANDMESA_TEXT = "Siligo is a town in the region of Logudoro, in northern Sardinia, Italy. It is known for the mesa of Monte Santu, an elevated area of land with a flat top formed by weathering and erosion of horizontally layered rocks that have been uplifted by tectonic activity. The place hosts an archaeological site and a prehistoric Nuragic Sanctuary.",
		TXT_KEY_FEATURE_SRI_PADA = "Kirkjufell",
		TXT_KEY_CIV5_FEATURES_SRI_PADA_TEXT = "Kirkjufell (Icelandic: Church mountain) is a 463m high mountain on the north coast of Iceland's Snæfellsnes peninsula, near the town of Grundarfjörður.",
		TXT_KEY_FEATURE_LAKE_VICTORIA = "Lake Ladoga",
		TXT_KEY_CIV5_FEATURES_LAKE_VICTORIA_TEXT = "Lake Ladoga is a freshwater lake located in the Republic of Karelia and Leningrad Oblast in northwestern Russia just outside the outskirts of Saint Petersburg. It is the largest lake in Europe, and the 15th largest freshwater lake by area in the world.",
		TXT_KEY_FEATURE_KILIMANJARO = "Mt. Elbrus",
		TXT_KEY_CIV5_FEATURES_KILIMANJARO_TEXT = "Mount Elbrus is a dormant volcano located in the western Caucasus mountain range, in Kabardino-Balkaria and Karachay–Cherkessia of Russia, near the border with Georgia. Mt. Elbrus's peak is the highest in the Caucasus Mountains and in Europe."
		},
	[APENNINE] = {},
	[EAST_ASIA] = {},
	[BRITISH_ISLES] = {},
	[NORTHEAST_ASIA] = {},
	[AEGEAN] = {},
	[NORTH_ATLANTIC] = {},
	[PACIFIC] = {},
	[SOUTH_PACIFIC] = {},
	[NORTHWEST_EUROPE] = {},
	[CARIBBEAN] = {},
	[ASIA] = {},
	[MEDITERRANEAN] = {},
	[MESOPOTAMIA] = {},
	[LARGE_AFRICA] = {},
	[NILE_VALLEY] = {},
	[AMERICAS] = {},
	[MESOPOTAMIA_GIANT] = {},
	[ASIA_SMALL] = {},
	[LARGE_EUROPE_NEW] = {},
	[ADRIATIC] = {},
	[WEST_AFRICA] = {},	
	[CAUCASUS] = {},
	[ASIA_MONGOL_STEPPE] = {},
	[CENTRAL_ASIA] = {},
	[EASTERN_EUROPE] = {},
	[NORTH_SEA_EUROPE] = {},
	[AFRICA_SOUTH_EUROPE] = {},
	[AFRICA_ASIA_OCEANIA] = {},
	[INDIAN_OCEAN] = {},
	[AFRICA_GIANT] = {},
	[SOUTH_AMERICA_GIANT] = {},
	[AUSTRALIA_SOUTHEAST_ASIA] = {},
	[AMERICAS_GIANT] = {},
	[INDIA_GIANT] = {},
	[SOUTH_CENTRAL_AMERICA_HUGE] = {},
	[SOUTH_CENTRAL_AMERICA_GIANT] = {},
	[SCOTLAND_IRELAND_HUGE] = {},
	[SOUTH_AMERICA_LARGE] = {},
	[ASIA_SOUTH_HUGE] = {},
	[SOUTH_PACIFIC_GIANT] = {},
	[NORTH_AMERICA_GIANT] = {},
	[NORTH_AMERICA_HUGE] = {},
	[TEXCOCO] = {},
	[WALES] = {},
	[SOUTHERN_AFRICA] = {},
	[SEA_OF_JAPAN] = {},
	[RUSSIA_LARGE] = {},
	[PATAGONIA] = {},
	[NETHERLANDS] = {},
	[INDONESIA] = {},
	[MEDITERRANEAN_HUGE] = {},
	[CENTRAL_AFRICA_LARGE] = {},
	[GERMANY_HUGE] = {},
	[CARIBBEAN_HUGE] = {},
	[EARTH_MK3] = {},
	[VIETNAM] = {},
	[JAPAN_HUGE] = {},
	[LEVANT] = {},
	[AUSTRALIA] = {},
	[IBERIA] = {},
	[INDIA] = {},
	[ATLANTIC_GIANT] = {},
	[NORTH_SEA_GIANT] = {},
	[DENMARK] = {},
	[ORIENT] = {},
}


g_NaturalWonderPlacement = { 
	[GIANT_EARTH] = {
		["FEATURE_POTOSI"] = {X=157, Y=21},
		["FEATURE_MT_SINAI"] = {X=34, Y=47},
		["FEATURE_SRI_PADA"] = {X=63, Y=33},
		["FEATURE_MT_KAILASH"] = {X=65, Y=56},
		["FEATURE_ULURU"] = {X=92, Y=16},
		["FEATURE_LAKE_VICTORIA"] = {X=34, Y=28},
		["FEATURE_KILIMANJARO"] = {X=36, Y=26},
	},
	[HUGE_EARTH] = {
		["FEATURE_POTOSI"] = {X=35, Y=21},
		["FEATURE_MT_SINAI"] = {X=73, Y=46},
		["FEATURE_SRI_PADA"] = {X=92, Y=33},
		["FEATURE_MT_KAILASH"] = {X=92, Y=51},
		["FEATURE_ULURU"] = {X=112, Y=17},
	},
	[STANDARD_CORDIFORM_EARTH] = {
		["FEATURE_POTOSI"] = {X=16, Y=10},
		["FEATURE_MT_SINAI"] = {X=47, Y=18},
		["FEATURE_SRI_PADA"] = {X=61, Y=17},
		["FEATURE_MT_KAILASH"] = {X=58, Y=26},
		["FEATURE_ULURU"] = {X=72, Y=10},
	},
	[LARGE_EUROPE] = {
		["FEATURE_MT_SINAI"] = {X=61, Y=12},
	},
	[LARGE_GREATEST_EARTH] = {
		["FEATURE_LAKE_VICTORIA"] = {X=60, Y=18},
		["FEATURE_KILIMANJARO"] = {X=61, Y=15},
	},
	[AFRICA_GIANT] = {
		["FEATURE_LAKE_VICTORIA"] = {X=99, Y=65},
		["FEATURE_KILIMANJARO"] = {X=104, Y=62},
	},
}
--------------------------------------------------------------

-- max number of resource tiles around civ starting position (see CivilizationsStartTable.xml)
MAX_REQUESTED_RESOURCE = 6

--------------------
-- Map option : Type
--------------------
-- Major placement
MAJOR_PLACEMENT = 1
-- City States placement
MINOR_PLACEMENT = 2
-- Bosphorus tile
BOSPHORUS = 3
-- City States minimum distance
MINOR_DISTANCE = 4
-- Remove United States
NO_US = 5
-- Resources option
RESOURCE_GEO = 6
RESOURCE_DEPOSIT = 7
RESOURCE_QUANTITY = 8
RESOURCE_SCALE = 9
RESOURCE_REQUESTED = 10

--------------------
-- Map option : Value
--------------------
-- Map option : Civilization placement
MAJOR_TSL_ONLY = 1
MAJOR_TSL_RANDOM = 2
MAJOR_ALL_RANDOM = 3
-- Map option : City States placement
MINOR_TSL_ONLY = 1
MINOR_TSL_RANDOM = 2
MINOR_ALL_RANDOM = 3
-- Map option : City States minimum distance
g_MinorDistanceValue = {0,2,4,6,9}
MINOR_DISTANCE_NO = 1
MINOR_DISTANCE_MINI = 2
MINOR_DISTANCE_CLOSE = 3
MINOR_DISTANCE_MEDIUM = 4
MINOR_DISTANCE_AWAY = 5
-- Map option : Resources quantity
g_ResourceQuantityCoeff = {0.25,0.5,1,2,4}
RESOURCE_POOR = 1
RESOURCE_SPARSE = 2
RESOURCE_STANDARD = 3
RESOURCE_ABUNDANT = 4
RESOURCE_RICHE = 5

-------------------------------
-- Map Options : Mod dependency
-------------------------------

if g_bBadCS then
	MajorPlacementValues = { 
			{ Name	= "Only TSL", ToolTip = "Only Civilizations with True Starting Location will be in game", Value = MAJOR_TSL_ONLY,},
			{ Name	= "Random and TSL", ToolTip = "Civilizations with no TSL get random placement", Value = MAJOR_TSL_RANDOM,},
			{ Name	= "Totally random", ToolTip = "All Civilizations get random placement", Value = MAJOR_ALL_RANDOM,},
		}
		
	MinorPlacementValues = { 
			{ Name	= "Only TSL", ToolTip = "Only City States with True Starting Location will be in game", Value = MINOR_TSL_ONLY,},
			{ Name	= "Random and TSL", ToolTip = "City States with no TSL get random placement", Value = MINOR_TSL_RANDOM,},
			{ Name	= "Totally random", ToolTip = "All City States get random placement", Value = MINOR_ALL_RANDOM,},
		}

elseif ( g_madeiraCS == 1 ) then
	MinorPlacementValues = { 
			{ Name	= "Only TSL", ToolTip = "Madeira's selection with True Starting Location", Value = MINOR_TSL_ONLY,},
			{ Name	= "Random", ToolTip = "Madeira's selection with random placement", Value = MINOR_ALL_RANDOM,},
		}
elseif ( g_dynamicCS == 1 ) then
	MinorPlacementValues = { 
			{ Name	= "Dynamic Placement", ToolTip = "Dynamic History mod is activated", Value = MINOR_TSL_ONLY,},
		}
else
	MajorPlacementValues = { 
			{ Name	= "Only TSL", ToolTip = "Only Civilizations with True Starting Location will be in game", Value = MAJOR_TSL_ONLY,},
			{ Name	= "Random and TSL", ToolTip = "Civilizations with no TSL get random placement", Value = MAJOR_TSL_RANDOM,},
			{ Name	= "Totally random", ToolTip = "All Civilizations get random placement", Value = MAJOR_ALL_RANDOM,},
		}
		
	MinorPlacementValues = { 
			{ Name	= "Only TSL", ToolTip = "Only City States with True Starting Location will be in game", Value = MINOR_TSL_ONLY,},
			{ Name	= "Random and TSL", ToolTip = "City States with no TSL get random placement", Value = MINOR_TSL_RANDOM,},
			{ Name	= "Totally random", ToolTip = "All City States get random placement", Value = MINOR_ALL_RANDOM,},
		}
end

if ( g_dynamicCS == 1 ) then
	NoUSOption = 	{
		ID = NO_US,
		Name = "Delayed start for civilizations",
		ToolTip = "Dynamic History Mod is selected, if checked Civilizations will start at real date",
		Disabled = false,
		GameOption = false, MapOption = true,
		Checked = true,
		SortPriority = 3,
	}
else
	NoUSOption = 	{
		ID = NO_US,
		Name = "Only native American",
		ToolTip = "Will remove Colonial Civs (e.g. United States and Brazil) at game start if it was (randomly or not) selected, keeping only native american civilizations",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 3,
	}
end

---------------------- 
-- Map Options : Table 
----------------------
g_MapPulldownOptions = {
---------------
[GIANT_EARTH] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[HUGE_EARTH] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = { 
			{ Name	= "Only TSL", ToolTip = "Only Civilizations with True Starting Location will be in game", Value = MAJOR_TSL_ONLY,},
			{ Name	= "Random and TSL", ToolTip = "Civilizations with no TSL get random placement", Value = MAJOR_TSL_RANDOM,},
			{ Name	= "Totally random", ToolTip = "All Civilizations get random placement", Value = MAJOR_ALL_RANDOM,},
		},
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = { 
			{ Name	= "Only TSL", ToolTip = "Only City States with True Starting Location will be in game", Value = MINOR_TSL_ONLY,},
			{ Name	= "Random and TSL", ToolTip = "City States with no TSL get random placement", Value = MINOR_TSL_RANDOM,},
			{ Name	= "Totally random", ToolTip = "All City States get random placement", Value = MINOR_ALL_RANDOM,},
		},
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[LARGE_GREATEST_EARTH] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},---------------
-- [STANDARD_EARTH] = {
	-- [MAJOR_PLACEMENT] = {
		-- ID = MAJOR_PLACEMENT,
		-- Name = "Civ Placement",
		-- ToolTip = "Placement for Major Civilizations",
		-- Disabled = false,
		-- DefaultValue = 1,
		-- SortPriority = 2,
		-- Values = { 
			-- { Name	= "Only TSL", ToolTip = "Only Civilizations with True Starting Location will be in game", Value = MAJOR_TSL_ONLY,},
			-- { Name	= "Random and TSL", ToolTip = "Civilizations with no TSL get random placement", Value = MAJOR_TSL_RANDOM,},
			-- { Name	= "Totally random", ToolTip = "All Civilizations get random placement", Value = MAJOR_ALL_RANDOM,},
		-- },
	-- },
	-- [MINOR_PLACEMENT] = {
		-- ID = MINOR_PLACEMENT,
		-- Name = "CS Placement",
		-- ToolTip = "Placement for City States",
		-- Disabled = false,
		-- DefaultValue = 1,
		-- SortPriority = 2,
		-- Values = { 
			-- { Name	= "Only TSL", ToolTip = "Only City States with True Starting Location will be in game", Value = MINOR_TSL_ONLY,},
			-- { Name	= "Random and TSL", ToolTip = "City States with no TSL get random placement", Value = MINOR_TSL_RANDOM,},
			-- { Name	= "Totally random", ToolTip = "All City States get random placement", Value = MINOR_ALL_RANDOM,},
		-- },
	-- },
	-- [MINOR_DISTANCE] = {
			-- ID = MINOR_DISTANCE,
			-- Name = "CS Separation",
			-- ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			-- Disabled = false,
			-- DefaultValue = 3,
			-- SortPriority = 2,
			-- Values = { 
				-- { Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				-- { Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				-- { Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				-- { Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
			-- },
	-- },
	-- [RESOURCE_QUANTITY] = {
			-- ID = RESOURCE_QUANTITY,
			-- Name = "Resources",
			-- ToolTip = "Resources quantity",
			-- Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	-- },
-- },
---------------
[STANDARD_CORDIFORM_EARTH] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = { 
			{ Name	= "Only TSL", ToolTip = "Only Civilizations with True Starting Location will be in game", Value = MAJOR_TSL_ONLY,},
			{ Name	= "Random and TSL", ToolTip = "Civilizations with no TSL get random placement", Value = MAJOR_TSL_RANDOM,},
			{ Name	= "Totally random", ToolTip = "All Civilizations get random placement", Value = MAJOR_ALL_RANDOM,},
		},
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = { 
			{ Name	= "Only TSL", ToolTip = "Only City States with True Starting Location will be in game", Value = MINOR_TSL_ONLY,},
			{ Name	= "Random and TSL", ToolTip = "City States with no TSL get random placement", Value = MINOR_TSL_RANDOM,},
			{ Name	= "Totally random", ToolTip = "All City States get random placement", Value = MINOR_ALL_RANDOM,},
		},
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[AFRICA_ASIA_OCEANIA] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[AMERICAS_GIANT] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[AMERICAS] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[NORTH_ATLANTIC] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[PACIFIC] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[SOUTH_PACIFIC_GIANT] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[SOUTH_PACIFIC] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[INDIAN_OCEAN] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[GIANT_EUROPE] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[LARGE_EUROPE_NEW] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[LARGE_EUROPE] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------- 
[SOUTH_CENTRAL_AMERICA_GIANT] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[SOUTH_CENTRAL_AMERICA_HUGE] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[SOUTH_AMERICA_GIANT] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[SOUTH_AMERICA_LARGE] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[NORTH_AMERICA_GIANT] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[NORTH_AMERICA_HUGE] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[AFRICA_SOUTH_EUROPE] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[AFRICA_GIANT] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[LARGE_AFRICA] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[ASIA] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[AUSTRALIA_SOUTHEAST_ASIA] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[ASIA_SOUTH_HUGE] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[EAST_ASIA] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[ASIA_SMALL] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[NORTHEAST_ASIA] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[ASIA_MONGOL_STEPPE] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[CENTRAL_ASIA] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[INDIA_GIANT] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[CAUCASUS] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[MESOPOTAMIA_GIANT] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[MESOPOTAMIA] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[NILE_VALLEY] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[WEST_AFRICA] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[MEDITERRANEAN] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[APENNINE] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[AEGEAN] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[ADRIATIC] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[BRITISH_ISLES] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[EASTERN_EUROPE] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[NORTHWEST_EUROPE] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[NORTH_SEA_EUROPE] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[SCOTLAND_IRELAND_HUGE] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[CARIBBEAN] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[TEXCOCO] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[WALES] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[SOUTHERN_AFRICA] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[SEA_OF_JAPAN] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[RUSSIA_LARGE] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[PATAGONIA] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[NETHERLANDS] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[INDONESIA] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[MEDITERRANEAN_HUGE] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[CENTRAL_AFRICA_LARGE] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[GERMANY_HUGE] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[CARIBBEAN_HUGE] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[VIETNAM] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[JAPAN_HUGE] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[LEVANT] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[AUSTRALIA] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[IBERIA] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[INDIA] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[EARTH_MK3] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[ATLANTIC_GIANT] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[NORTH_SEA_GIANT] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[DENMARK] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[ORIENT] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "Civ Placement",
		ToolTip = "Placement for Major Civilizations",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "CS Placement",
		ToolTip = "Placement for City States",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "CS Separation",
			ToolTip = "City States minimum separation distance: a city that starts under the minimum distance will be removed from the game",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "Don't check", ToolTip = "Allow City States starting positions to overlap. Not recommanded", Value = MINOR_DISTANCE_NO,},
				{ Name	= "Minimum", ToolTip = "3 tiles", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "Close", ToolTip = "~ 5 tiles", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "Medium", ToolTip = "~ 7 tiles", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "Away", ToolTip = "~ 9 tiles", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "Resources",
			ToolTip = "Resources quantity",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "Poor", ToolTip = "Resources are extremly rare", Value = RESOURCE_POOR,},
				{ Name	= "Sparse", ToolTip = "Less resources", Value = RESOURCE_SPARSE,},
				{ Name	= "Standard", ToolTip = "Standard value", Value = RESOURCE_STANDARD,},
				{ Name	= "Abundant", ToolTip = "More resources", Value = RESOURCE_ABUNDANT,},
				{ Name	= "Riche", ToolTip = "I've said : Give me more resources !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
}
---------------
g_MapCheckboxOptions = {
---------------- 
[GIANT_EARTH] = {
	{
		ID = BOSPHORUS,
		Name = "Bosphorus Strait",
		ToolTip = "If checked, will use a sea tile for Bosphorus, else it will be a river",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 0,
	},	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_DEPOSIT,
		Name = "Strategic Resource Deposits",
		ToolTip = "Place some heavy deposits in specified regions",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[HUGE_EARTH] = {
	{
		ID = BOSPHORUS,
		Name = "Bosphorus Strait",
		ToolTip = "If checked, will use a sea tile for Bosphorus, else it will be a river",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 0,
	},	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_DEPOSIT,
		Name = "Strategic Resource Deposits",
		ToolTip = "Place some heavy deposits in specified regions",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
-- [STANDARD_EARTH] = {
	-- {
		-- ID = NO_US,
		-- Name = "Only native American",
		-- ToolTip = "Will remove Colonial Civs (e.g. United States and Brazil) at game start if it was (randomly or not) selected, keeping only native american civilizations",
		-- Disabled = false,
		-- GameOption = false, MapOption = true,
		-- SortPriority = 0,
	-- },	{
		-- ID = RESOURCE_SCALE,
		-- Name = "No Resoure Scaling",
		-- ToolTip = "The number of resources won't be scaled depending of the number of players",
		-- Disabled = false,
		-- GameOption = false, MapOption = true,
		-- SortPriority = 2,
	-- },	{
		-- ID = RESOURCE_REQUESTED,
		-- Name = "Historic Starting Resources",
		-- ToolTip = "Place historic resources for each civilization",
		-- Disabled = false,
		-- GameOption = false, MapOption = true,
		-- SortPriority = 2,
	-- },
-- },
----------------
[STANDARD_CORDIFORM_EARTH] = {
	{
		ID = BOSPHORUS,
		Name = "Bosphorus Strait",
		ToolTip = "If checked, will use a sea tile for Bosphorus, else it will be a river",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 0,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
---------------- 
[LARGE_EUROPE] = {
	{
		ID = BOSPHORUS,
		Name = "Bosphorus Strait",
		ToolTip = "If checked, will use a sea tile for Bosphorus, else it will be a river",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 0,
	},	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
---------------- 
[LARGE_GREATEST_EARTH] = {
	{
		ID = BOSPHORUS,
		Name = "Bosphorus Strait",
		ToolTip = "If checked, will use a sea tile for Bosphorus, else it will be a river",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 0,
	},	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},		{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
---------------- 
[GIANT_EUROPE] = {
	{
		ID = BOSPHORUS,
		Name = "Bosphorus Strait",
		ToolTip = "If checked, will use a sea tile for Bosphorus, else it will be a river",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 0,
	},	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[APENNINE] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[EAST_ASIA] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[BRITISH_ISLES] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[NORTHEAST_ASIA] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[AEGEAN] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[NORTH_ATLANTIC] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[PACIFIC] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[SOUTH_PACIFIC] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[NORTHWEST_EUROPE] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[CARIBBEAN] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[ASIA] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[MEDITERRANEAN] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[MESOPOTAMIA] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[LARGE_AFRICA] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[NILE_VALLEY] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[AMERICAS] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[MESOPOTAMIA_GIANT] = {
	{
		ID = BOSPHORUS,
		Name = "Bosphorus Strait",
		ToolTip = "If checked, will use a sea tile for Bosphorus, else it will be a river",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 0,
	},	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},		{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
}, 
----------------
[ASIA_SMALL] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[LARGE_EUROPE_NEW] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[ADRIATIC] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[WEST_AFRICA] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[CAUCASUS] = {
	{
		ID = BOSPHORUS,
		Name = "Bosphorus Strait",
		ToolTip = "If checked, will use a sea tile for Bosphorus, else it will be a river",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 0,
	},	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[ASIA_MONGOL_STEPPE] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[CENTRAL_ASIA] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[EASTERN_EUROPE] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[NORTH_SEA_EUROPE] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[AFRICA_ASIA_OCEANIA] = {
	{
		ID = BOSPHORUS,
		Name = "Bosphorus Strait",
		ToolTip = "If checked, will use a sea tile for Bosphorus, else it will be a river",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 0,
	},	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[AFRICA_SOUTH_EUROPE] = {
	{
		ID = BOSPHORUS,
		Name = "Bosphorus Strait",
		ToolTip = "If checked, will use a sea tile for Bosphorus, else it will be a river",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 0,
	},	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[AFRICA_GIANT] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[SOUTH_AMERICA_GIANT] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[AUSTRALIA_SOUTHEAST_ASIA] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[INDIAN_OCEAN] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[AMERICAS_GIANT] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[INDIA_GIANT] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[SOUTH_CENTRAL_AMERICA_HUGE] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[SOUTH_CENTRAL_AMERICA_GIANT] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[SCOTLAND_IRELAND_HUGE] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[SOUTH_AMERICA_LARGE] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[ASIA_SOUTH_HUGE] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[SOUTH_PACIFIC_GIANT] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[NORTH_AMERICA_GIANT] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[NORTH_AMERICA_HUGE] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[TEXCOCO] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[WALES] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[SOUTHERN_AFRICA] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[SEA_OF_JAPAN] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[RUSSIA_LARGE] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
-----------
[PATAGONIA] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
-----------
[NETHERLANDS] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
-----------
[INDONESIA] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
-----------
[MEDITERRANEAN_HUGE] = {
	{
		ID = BOSPHORUS,
		Name = "Bosphorus Strait",
		ToolTip = "If checked, will use a sea tile for Bosphorus, else it will be a river",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 0,
	},	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
-----------
[CENTRAL_AFRICA_LARGE] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
-----------
[GERMANY_HUGE] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
-----------
[CARIBBEAN_HUGE] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
-----------
[VIETNAM] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
-----------
[JAPAN_HUGE] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
-----------
[LEVANT] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
-----------
[AUSTRALIA] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
-----------
[IBERIA] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
-----------
[INDIA] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
-----------
[NORTH_SEA_GIANT] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
-----------
[DENMARK] = {
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
-----------
[ORIENT] = {
	{
		ID = BOSPHORUS,
		Name = "Bosphorus Strait",
		ToolTip = "If checked, will use a sea tile for Bosphorus, else it will be a river",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 0,
	},	
	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
-----------
[EARTH_MK3] = {
	{
		ID = BOSPHORUS,
		Name = "Bosphorus Strait",
		ToolTip = "If checked, will use a sea tile for Bosphorus, else it will be a river",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 0,
	},	
	{
		ID = BOSPHORUS,
		Name = "Bosphorus Strait",
		ToolTip = "If checked, will use a sea tile for Bosphorus, else it will be a river",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 0,
	},	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_DEPOSIT,
		Name = "Strategic Resource Deposits",
		ToolTip = "Place some heavy deposits in specified regions",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
-----------
[ATLANTIC_GIANT] = {
	{
		ID = BOSPHORUS,
		Name = "Bosphorus Strait",
		ToolTip = "If checked, will use a sea tile for Bosphorus, else it will be a river",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 0,
	},	{
		ID = RESOURCE_GEO,
		Name = "True Resource Placement",
		ToolTip = "Force resources to be placed in the correct geographic region",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_DEPOSIT,
		Name = "Strategic Resource Deposits",
		ToolTip = "Place some heavy deposits in specified regions",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "No Resoure Scaling",
		ToolTip = "The number of resources won't be scaled depending of the number of players",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "Historic Starting Resources",
		ToolTip = "Place historic resources for each civilization",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
}

--print ("---- YnAEMP defines loaded -----")